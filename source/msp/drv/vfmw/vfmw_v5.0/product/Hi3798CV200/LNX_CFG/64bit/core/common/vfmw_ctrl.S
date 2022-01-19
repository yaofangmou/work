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
	add	x2, x0, 307200
	mov	w0, 0
	str	w20, [x2, 1860]
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
	add	x0, x0, 307200
	ldr	w0, [x0, 1860]
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
	mov	w0, 32024
	movk	w0, 0xc, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L499:
	mov	w0, 18200
	movk	w0, 0xb2, lsl 16
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
	ldr	x3, [x19, w24, sxtw 3]
	cbz	x3, .L601
	add	x0, x3, 311296
	ldr	w1, [x0, 1880]
	cbz	w1, .L570
	ldr	w0, [x0, 1356]
	mov	w2, 0
	cmp	w22, w0
	bne	.L573
	b	.L602
	.p2align 3
.L574:
	add	x0, x0, 3156
	add	x0, x3, x0, lsl 4
	ldr	w0, [x0, 12]
	cmp	w22, w0
	beq	.L571
.L573:
	add	w2, w2, 1
	cmp	w1, w2
	mov	w20, w2
	sxtw	x0, w2
	add	x0, x0, 16384
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
	add	x0, x3, 299008
	mov	w21, 1
	add	x0, x0, 3980
	ldr	w2, [x0, -92]
	cmp	w2, w22
	bne	.L578
	b	.L603
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
	sub	w22, w1, #1
	mov	w0, 3
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
	add	x3, x1, 299008
	add	x1, x1, 303104
	strb	wzr, [x3, 3882]
	strb	wzr, [x1, 2730]
	blr	x2
	cmp	w22, w20
	bls	.L585
	sxtw	x21, w24
	uxtw	x23, w20
	.p2align 2
.L577:
	add	w20, w20, 1
	add	x23, x23, 16384
	add	x0, x23, 3156
	ldr	x3, [x19, x21, lsl 3]
	uxtw	x23, w20
	ldr	x4, [x25, 104]
	add	x1, x23, 16384
	add	x0, x3, x0, lsl 4
	add	x1, x1, 3156
	mov	x2, 16
	add	x0, x0, 8
	add	x1, x3, x1, lsl 4
	add	x1, x1, 8
	blr	x4
	cmp	w20, w22
	bcc	.L577
.L576:
	uxtw	x0, w22
	ldr	x4, [x19, w24, sxtw 3]
	add	x0, x0, 16384
	ldr	x3, [x25, 96]
	add	x0, x0, 3156
	mov	x2, 16
	mov	w1, 0
	add	x0, x4, x0, lsl 4
	add	x0, x0, 8
	blr	x3
	ldr	x1, [x19, w24, sxtw 3]
	mov	w0, 0
	add	x1, x1, 311296
	ldr	w2, [x1, 1880]
	sub	w2, w2, #1
	str	w2, [x1, 1880]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L604:
	add	x2, x3, 278528
	ldr	x20, .LC398
	ldr	x1, .LC405
	mov	w3, 3474
	add	x20, x20, 512
	mov	w0, 1
	ldrsb	w4, [x2, 2195]
	mov	x2, x20
	bl	dprint_vfmw
	ldr	x6, [x19, w24, sxtw 3]
	add	x0, x6, 278528
	ldrsb	w0, [x0, 2195]
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
	add	x4, x4, 299008
	ldr	w4, [x4, 3888]
	bl	dprint_vfmw
	ldr	x6, [x19, x21, lsl 3]
	add	x0, x6, 278528
	ldrsb	w0, [x0, 2195]
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
	add	x0, x0, 311296
	mov	x1, x19
	add	x0, x0, 1952
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
	add	x1, x1, 327680
	ldrb	w1, [x1, 1464]
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
	add	x0, x0, 311296
	add	x0, x0, 1952
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
	add	x0, x1, 311296
	add	x0, x0, 1952
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
	add	x0, x0, 311296
	add	x0, x0, 1952
	bl	SYNTAX_ReturnImage
	ldr	x0, [x21, w20, sxtw 3]
	mov	x1, x19
	add	x0, x0, 311296
	add	x0, x0, 1952
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
	add	x0, x0, 311296
	add	x0, x0, 1952
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
	add	x0, x0, 311296
	add	x0, x0, 1952
	bl	SYNTAX_ReturnImage
	ldr	x0, [x21, w20, sxtw 3]
	mov	x1, x19
	add	x0, x0, 311296
	add	x0, x0, 1952
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
	add	x0, x0, 311296
	add	x0, x0, 1952
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
	add	x0, x0, 311296
	add	x0, x0, 1952
	bl	SYNTAX_ReleaseImage
	mov	w23, w0
	ldr	w2, [x20, 188]
	cmn	w2, #1
	beq	.L660
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x29, 64
	str	w2, [x29, 212]
	add	x0, x0, 311296
	add	x0, x0, 1952
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
	bhi	.L716
	ldr	x0, .LC461
	ldr	x20, [x0, w19, sxtw 3]
	cbz	x20, .L716
	ldr	w0, [x20, 4]
	mov	x1, 0
	cmp	w0, 1
	bne	.L695
	ldr	w0, [x20, 8]
	cmp	w0, 1
	bne	.L695
	ldr	w3, [x20, 672]
	cmp	w3, 17
	bls	.L717
.L696:
	ldr	x2, .LC463
	mov	w0, 0
	ldr	x1, .LC465
	add	x2, x2, 664
	bl	dprint_vfmw
	mov	x1, 0
	b	.L695
	.p2align 3
.L716:
	mov	x1, 0
.L695:
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L717:
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
	.text
	.p2align 3
.L706:
	add	x0, x20, 311296
	ldr	x19, [x0, 1968]
.L711:
	cbz	x19, .L716
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
.L708:
	add	x0, x20, 311296
	ldr	x19, [x0, 2192]
	b	.L711
	.p2align 3
.L700:
	add	x0, x20, 311296
	ldr	x19, [x0, 3000]
	b	.L711
	.p2align 3
.L709:
	add	x0, x20, 315392
	ldr	x19, [x0, 312]
	b	.L711
	.p2align 3
.L697:
	add	x0, x20, 311296
	ldr	x19, [x0, 2576]
	b	.L711
	.p2align 3
.L703:
	add	x0, x20, 311296
	ldr	x19, [x0, 1984]
	b	.L711
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
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L720
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L720:
	ldr	x1, .LC468
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
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
	bhi	.L738
	ldr	x0, .LC473
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cmp	w1, 17
	bls	.L739
.L721:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L739:
	ldr	x2, .LC474
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx725
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx725:
	.section	.rodata
	.align	0
	.align	2
.L725:
	.byte	(.L724 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L727 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L721 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L730 - .Lrtx725) / 4
	.byte	(.L721 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.byte	(.L721 - .Lrtx725) / 4
	.byte	(.L735 - .Lrtx725) / 4
	.byte	(.L736 - .Lrtx725) / 4
	.byte	(.L734 - .Lrtx725) / 4
	.text
	.p2align 3
.L734:
	add	x0, x0, 311296
	str	xzr, [x0, 1968]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L738:
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
.L730:
	add	x0, x0, 311296
	str	xzr, [x0, 1984]
	b	.L721
	.p2align 3
.L735:
	add	x0, x0, 311296
	str	xzr, [x0, 2192]
	b	.L721
	.p2align 3
.L727:
	add	x0, x0, 311296
	str	xzr, [x0, 3000]
	b	.L721
	.p2align 3
.L736:
	add	x0, x0, 315392
	str	xzr, [x0, 312]
	b	.L721
	.p2align 3
.L724:
	add	x0, x0, 311296
	str	xzr, [x0, 2576]
	b	.L721
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
	.xword	.L725
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmProcSedOnly
	.type	VCTRL_VdmProcSedOnly, %function
VCTRL_VdmProcSedOnly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L745
	ldr	x0, .LC479
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L746
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L744
	ldr	x2, .LC477
	mov	w3, 4420
	ldr	x4, .LC482
	mov	w0, 0
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
.L740:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L744:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L745:
	ldr	x2, .LC477
	mov	w3, 4418
	ldr	x4, .LC476
	mov	w0, 0
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L746:
	ldr	x2, .LC477
	mov	w3, 4419
	ldr	x4, .LC480
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L740
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
	bhi	.L770
	ldr	x0, .LC486
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L771
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bne	.L772
	ldr	w2, [x1, 672]
	cmp	w2, 17
	bls	.L773
.L766:
	mov	w0, 0
	b	.L749
	.p2align 3
.L773:
	ldr	x3, .LC489
	ldrb	w2, [x3,w2,uxtw]
	adr	x3, .Lrtx753
	add	x2, x3, w2, sxtb #2
	br	x2
.Lrtx753:
	.section	.rodata
	.align	0
	.align	2
.L753:
	.byte	(.L752 - .Lrtx753) / 4
	.byte	(.L754 - .Lrtx753) / 4
	.byte	(.L755 - .Lrtx753) / 4
	.byte	(.L756 - .Lrtx753) / 4
	.byte	(.L766 - .Lrtx753) / 4
	.byte	(.L757 - .Lrtx753) / 4
	.byte	(.L758 - .Lrtx753) / 4
	.byte	(.L766 - .Lrtx753) / 4
	.byte	(.L759 - .Lrtx753) / 4
	.byte	(.L760 - .Lrtx753) / 4
	.byte	(.L761 - .Lrtx753) / 4
	.byte	(.L761 - .Lrtx753) / 4
	.byte	(.L761 - .Lrtx753) / 4
	.byte	(.L762 - .Lrtx753) / 4
	.byte	(.L766 - .Lrtx753) / 4
	.byte	(.L763 - .Lrtx753) / 4
	.byte	(.L764 - .Lrtx753) / 4
	.byte	(.L765 - .Lrtx753) / 4
	.text
	.p2align 3
.L765:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	VP9DEC_GetImageBuffer
.L749:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L764:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	HEVCDEC_GetImageBuffer
	b	.L749
	.p2align 3
.L763:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	MVC_DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L762:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	VP8DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L761:
	ldr	x2, .LC490
	ldr	w2, [x2, 2200]
	tbz	x2, 0, .L749
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	VP6DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L760:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	REAL9DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L759:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	REAL8DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L758:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	AVSDEC_GetImageBuffer
	b	.L749
	.p2align 3
.L757:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	DIVX3DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L756:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	MPEG2DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L755:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	MPEG4DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L754:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	VC1DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L752:
	add	x0, x1, 311296
	add	x0, x0, 1960
	bl	H264DEC_GetImageBuffer
	b	.L749
	.p2align 3
.L772:
	ldr	x2, .LC484
	mov	w3, 4455
	ldr	x4, .LC488
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L749
	.p2align 3
.L770:
	ldr	x2, .LC484
	mov	w3, 4453
	ldr	x4, .LC483
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L749
.L771:
	ldr	x2, .LC484
	mov	w3, 4454
	ldr	x4, .LC487
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L749
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
	.xword	.L753
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
	bhi	.L780
	ldr	x0, .LC494
	ldr	x2, [x0, w19, sxtw 3]
	cbz	x2, .L781
	ldr	w0, [x2, 4]
	cmp	w0, 1
	bne	.L782
	cbz	x20, .L783
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 1340]
.L776:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L782:
	ldr	x2, .LC492
	mov	w3, 4571
	ldr	x4, .LC498
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L776
	.p2align 3
.L780:
	ldr	x2, .LC492
	mov	w3, 4569
	ldr	x4, .LC491
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L776
.L781:
	ldr	x2, .LC492
	mov	w3, 4570
	ldr	x4, .LC496
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L776
.L783:
	ldr	x2, .LC492
	mov	w3, 4572
	ldr	x4, .LC500
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L776
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
	bhi	.L790
	ldr	x0, .LC504
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L791
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L792
	cbz	x20, .L793
	ldr	x3, .LC508
	mov	x2, 20
	mov	x1, x20
	add	x0, x0, 1376
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L786:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L792:
	ldr	x2, .LC502
	mov	w3, 4584
	ldr	x4, .LC506
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L786
	.p2align 3
.L790:
	ldr	x2, .LC502
	mov	w3, 4582
	ldr	x4, .LC501
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L786
.L793:
	ldr	x2, .LC502
	mov	w3, 4585
	ldr	x4, .LC507
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L786
.L791:
	ldr	x2, .LC502
	mov	w3, 4583
	ldr	x4, .LC505
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L786
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
	bhi	.L801
	ldr	x0, .LC512
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L800
	ldr	w1, [x0, 4]
	cbz	w1, .L800
	ldr	w1, [x0, 8]
	cbz	w1, .L800
	ldr	w1, [x0, 20]
	cbz	w1, .L800
	ldr	w0, [x0, 672]
	cmp	w0, 22
	csetm	w0, eq
.L796:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L800:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L801:
	ldr	x2, .LC510
	mov	w3, 4594
	ldr	x4, .LC509
	mov	w0, 0
	ldr	x1, .LC511
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -1
	b	.L796
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
	beq	.L818
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
	b	.L807
	.p2align 3
.L805:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L819
.L807:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 311296
	add	x1, x1, 1960
	cbz	x2, .L805
	cmp	x19, x1
	bne	.L805
	cmn	w0, #1
	str	w0, [x19, 616]
	mov	w0, 1
	beq	.L809
.L813:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L819:
	mov	w0, -1
	str	w0, [x19, 616]
.L809:
	ldr	x1, .LC519
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L813
.L818:
	ldr	x2, .LC513
	mov	w0, 0
	ldr	x1, .LC515
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -20
	b	.L813
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
	cbz	x19, .L822
	ldr	w0, [x19, 616]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 616]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L823
	ldr	w0, [x19, 616]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	str	xzr, [x20, 544]
	ldr	x1, [x20, 552]
	ldr	w0, [x19, 616]
	bl	FreeUsdByDec
	str	xzr, [x20, 552]
	mov	w0, 1
.L821:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L823:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L822:
	mov	w0, -2
	b	.L821
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
	cbz	x0, .L838
	ldr	w1, [x0, 672]
	cmp	w1, 20
	bne	.L839
	ldr	w0, [x0, 596]
	cmp	w0, 2
	ble	.L840
	mov	w1, 1
	mov	w0, w20
	bl	FSP_NewLogicFs
	mov	w22, w0
	tbnz	w0, #31, .L841
	mov	w1, w0
	mov	w0, w20
	bl	FSP_GetLogicFs
	mov	x19, x0
	ldr	x1, .LC531
	mov	w2, w22
	mov	w0, 18
	bl	dprint_vfmw
	cbz	x19, .L842
	ldr	x0, [x19, 32]
	cbz	x0, .L831
	ldr	x1, [x19, 40]
	cbz	x1, .L831
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
.L826:
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L839:
	ldr	x1, .LC525
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L826
	.p2align 3
.L840:
	ldr	x1, .LC527
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L826
	.p2align 3
.L831:
	ldr	x1, .LC537
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L826
	.p2align 3
.L841:
	ldr	x1, .LC529
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L826
.L838:
	ldr	x2, .LC522
	mov	w3, 4786
	ldr	x1, .LC523
	ldr	x4, .LC521
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w1, -1
	b	.L826
.L842:
	ldr	x1, .LC533
	mov	w2, 4814
	mov	w0, 22
	bl	dprint_vfmw
	mov	w1, -1
	b	.L826
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
	cbz	x1, .L861
	ldr	w0, [x1, 672]
	cmp	w0, 20
	bls	.L862
.L843:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L862:
	ldr	x2, .LC542
	ldrb	w0, [x2,w0,uxtw]
	adr	x2, .Lrtx847
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx847:
	.section	.rodata
	.align	0
	.align	2
.L847:
	.byte	(.L846 - .Lrtx847) / 4
	.byte	(.L848 - .Lrtx847) / 4
	.byte	(.L849 - .Lrtx847) / 4
	.byte	(.L850 - .Lrtx847) / 4
	.byte	(.L843 - .Lrtx847) / 4
	.byte	(.L851 - .Lrtx847) / 4
	.byte	(.L852 - .Lrtx847) / 4
	.byte	(.L843 - .Lrtx847) / 4
	.byte	(.L853 - .Lrtx847) / 4
	.byte	(.L854 - .Lrtx847) / 4
	.byte	(.L855 - .Lrtx847) / 4
	.byte	(.L855 - .Lrtx847) / 4
	.byte	(.L855 - .Lrtx847) / 4
	.byte	(.L856 - .Lrtx847) / 4
	.byte	(.L843 - .Lrtx847) / 4
	.byte	(.L857 - .Lrtx847) / 4
	.byte	(.L858 - .Lrtx847) / 4
	.byte	(.L859 - .Lrtx847) / 4
	.byte	(.L843 - .Lrtx847) / 4
	.byte	(.L843 - .Lrtx847) / 4
	.byte	(.L860 - .Lrtx847) / 4
	.text
	.p2align 3
.L860:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	USERDEC_Init
	b	.L843
	.p2align 3
.L859:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	VP9DEC_Init
	b	.L843
	.p2align 3
.L858:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	HEVCDEC_Init
	b	.L843
	.p2align 3
.L857:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	MVC_DEC_Init
	b	.L843
	.p2align 3
.L856:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	VP8DEC_Init
	b	.L843
	.p2align 3
.L855:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	VP6DEC_Init
	b	.L843
	.p2align 3
.L854:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	REAL9DEC_Init
	b	.L843
	.p2align 3
.L853:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	REAL8DEC_Init
	b	.L843
	.p2align 3
.L852:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	AVSDEC_Init
	b	.L843
	.p2align 3
.L851:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	DIVX3DEC_Init
	b	.L843
	.p2align 3
.L850:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	MPEG2DEC_Init
	b	.L843
	.p2align 3
.L849:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	MPEG4DEC_Init
	b	.L843
	.p2align 3
.L848:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	VC1DEC_Init
	b	.L843
	.p2align 3
.L846:
	add	x0, x1, 311296
	add	x1, x1, 680
	add	x0, x0, 1960
	bl	H264DEC_Init
	b	.L843
	.p2align 3
.L861:
	ldr	x2, .LC540
	mov	w3, 4863
	ldr	x4, .LC539
	mov	w0, 0
	ldr	x1, .LC541
	add	x2, x2, 184
	bl	dprint_vfmw
	b	.L843
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
	.xword	.L847
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
	tbnz	w0, #31, .L864
	ldr	w0, [x19, 12]
	cmp	w0, 31
	ble	.L864
	ldr	w0, [x19, 16]
	cmp	w0, 31
	ble	.L864
	ldr	w1, [x19, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L864
	ldr	w0, [x19, 44]
	cmp	w0, 1
	beq	.L870
	cmp	w0, 2
	mov	w0, 0
	bne	.L866
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L864
	ldr	w0, [x19, 24]
	cmp	w0, wzr
	ble	.L864
.L869:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L864
	ldr	w0, [x19, 32]
	cmp	w0, wzr
	bgt	.L871
.L864:
	ldr	x1, .LC544
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
.L866:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L871:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L870:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	bgt	.L869
	b	.L864
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
	cbz	w0, .L874
	mov	w4, 17
	add	w0, w5, 1
	cmp	w0, w4
	csel	w4, w0, w4, le
.L874:
	ldr	x1, .LC545
	sub	w0, w21, #27
	mov	w7, -2
	cmp	w0, 5
	csinv	w7, w7, wzr, ls
	ldr	x8, [x1, 128]
	cbz	x8, .L878
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
	cbnz	w0, .L878
	ldr	w0, [x22, 2464]
	add	w0, w0, 16
	str	w0, [x20]
	ldr	w0, [x19, 256]
	cmp	w0, 17
	beq	.L890
	ldr	w0, [x19, 56]
	add	w0, w0, 32768
	add	w0, w0, 16
	str	w0, [x20, 4]
.L880:
	mov	w0, 1024
	movk	w0, 0x2, lsl 16
	str	w0, [x20, 12]
	ldr	w0, [x19, 256]
	cbz	w0, .L891
	cmp	w0, 15
	bne	.L884
	ldp	w4, w0, [x19, 28]
	mov	w1, 3992
	ldr	w2, [x19, 20]
	mov	w3, 4064
	mov	w5, 2240
	smull	x4, w4, w1
	smaddl	x1, w2, w3, x4
	madd	w3, w0, w5, w1
.L883:
	mov	w2, 32024
	mov	w1, 18200
	cmp	w21, 26
	movk	w2, 0xc, lsl 16
	movk	w1, 0xb2, lsl 16
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
.L891:
	ldp	w4, w0, [x19, 28]
	mov	w1, 4000
	ldr	w2, [x19, 20]
	mov	w3, 4064
	mov	w5, 2208
	smull	x4, w4, w1
	smaddl	x1, w2, w3, x4
	madd	w3, w0, w5, w1
	b	.L883
	.p2align 3
.L878:
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
.L890:
	str	wzr, [x20, 4]
	b	.L880
	.p2align 3
.L884:
	mov	w1, 61264
	cmp	w0, 16
	movk	w1, 0x9, lsl 16
	csel	w3, w1, wzr, eq
	b	.L883
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
	beq	.L893
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
	blt	.L900
	str	w0, [x19, 36]
	str	w1, [x19, 60]
.L893:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L896
	mov	x2, x22
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetMemSize_onDecode
.L895:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L896:
	mov	w0, -1
	b	.L895
	.p2align 3
.L900:
	ldr	x1, .LC552
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
	b	.L895
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
	cbnz	w2, .L925
	ldr	w21, [x19, 152]
	ldr	w22, [x19, 144]
	ldr	x23, [x19, 136]
	cbnz	w21, .L926
.L903:
	mov	w2, w21
	mov	x1, x23
	mov	w0, w22
	add	x20, x19, 224
	bl	MEM_DelMemRecord
	ldr	w21, [x19, 248]
	ldr	w22, [x19, 240]
	ldr	x23, [x19, 232]
	cbnz	w21, .L927
.L904:
	mov	w2, w21
	mov	w0, w22
	mov	x1, x23
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 216]
	ldr	w21, [x19, 208]
	ldr	x22, [x19, 200]
	cbnz	w20, .L928
.L905:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	add	x19, x19, 256
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbnz	w20, .L929
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x19, .LC554
	ldr	w0, [x19, 592]
	cmp	w0, 1
	beq	.L930
.L907:
	ldr	w0, [x19, 596]
	cmp	w0, 1
	beq	.L931
.L908:
	ldr	w0, [x19, 600]
	add	x19, x19, 256
	cmp	w0, 1
	beq	.L932
.L909:
	bl	HEVCDEC_ReleaseHevcGlbMem
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L925:
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
	cbz	w21, .L903
.L926:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 128
	ldr	x3, [x3, 96]
	blr	x3
	b	.L903
	.p2align 3
.L929:
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
	bne	.L907
.L930:
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
	bne	.L908
	.p2align 2
.L931:
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
	bne	.L909
.L932:
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
.L928:
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 192
	ldr	x3, [x3, 96]
	blr	x3
	b	.L905
	.p2align 3
.L927:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	b	.L904
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
	cbnz	w0, .L934
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
	cbnz	w0, .L935
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
	cbnz	w0, .L953
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
	cbz	w0, .L954
	ldr	x2, .LC562
	mov	w4, 18048
	ldr	x1, .LC564
	mov	w3, 1
	add	x2, x2, 200
	mov	w0, 0
	bl	dprint_vfmw
.L950:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
.L938:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L954:
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
	cbnz	w0, .L955
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
	cbnz	w0, .L956
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
	cbnz	w0, .L957
	str	w27, [x23, 344]
	bl	HEVCDEC_AllocHevcGlbMem
	cbz	w0, .L938
	ldr	x1, .LC574
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L938
	.p2align 3
.L953:
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
	b	.L938
	.p2align 3
.L934:
	ldr	x1, .LC560
	mov	w2, -121438208
.L949:
	mov	w0, 0
	bl	dprint_vfmw
	b	.L950
	.p2align 3
.L935:
	mov	w2, 53248
	ldr	x1, .LC560
	movk	w2, 0xf8c3, lsl 16
	b	.L949
.L955:
	ldr	x1, .LC569
	mov	w2, 127
	b	.L949
.L956:
	ldr	x1, .LC569
	mov	w2, 136
	b	.L949
.L957:
	ldr	x1, .LC569
	mov	w2, 181
	b	.L949
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
	cbz	x19, .L991
	ldr	x20, .LC581
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x22, .LC582
	ldr	w19, [x22, 256]
	cbnz	w19, .L990
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
	cbz	x0, .L962
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L982
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L992
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
	bhi	.L967
.L997:
	mov	w0, 5000
	mov	w1, -5000
	cmp	w2, w0
	csel	w0, w2, w0, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
.L963:
	str	w0, [x21, 3696]
.L965:
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
	cbz	x0, .L968
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L969
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L993
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
	bhi	.L973
.L998:
	mov	w19, 5000
	mov	w0, -5000
	cmp	w2, w19
	csel	w19, w2, w19, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
.L969:
	str	w19, [x21, 3700]
.L971:
	ldr	x23, .LC598
	str	xzr, [x29, 72]
	ldr	w0, [x23, 384]
	cbz	w0, .L974
	ldr	x2, .LC599
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x23, 388]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 96]
	strb	w1, [x23, 389]
	strb	w0, [x23, 390]
.L975:
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
.L979:
	str	w2, [x0], 4
	cmp	x1, x0
	bne	.L979
	ldr	x3, [x20, 96]
	mov	x2, 128
	mov	w1, 0
	add	x0, x23, 400
	add	x19, x22, 288
	blr	x3
	mov	x0, x19
	bl	OpenDrivers
	cbnz	w0, .L990
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC606
	add	x0, x22, 272
	ldr	x1, .LC608
	ldr	x3, [x20, 400]
	blr	x3
	cbnz	w0, .L994
	mov	w1, 1
	str	w1, [x22, 256]
.L960:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L974:
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
	cbz	x0, .L975
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L995
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L996
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x23, 384]
.L977:
	ldr	x2, .LC599
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x23, 388]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 96]
	strb	w0, [x23, 389]
	strb	w1, [x23, 390]
	b	.L975
.L962:
	ldr	w2, [x21, 3696]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L997
.L967:
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
	b	.L963
.L968:
	ldr	w2, [x21, 3700]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L998
.L973:
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
	b	.L969
.L982:
	mov	w0, 0
	b	.L963
.L995:
	ldr	w1, [x23, 384]
	b	.L977
.L994:
	mov	x0, x19
	bl	CloseDrivers
.L990:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
.L993:
	ldr	x2, .LC579
	mov	w3, 6032
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 256
	bl	dprint_vfmw
	b	.L971
.L992:
	ldr	x2, .LC579
	mov	w3, 5990
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 232
	bl	dprint_vfmw
	b	.L965
.L996:
	ldr	x2, .LC579
	mov	w3, 6083
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 280
	bl	dprint_vfmw
	b	.L975
.L991:
	ldr	x2, .LC579
	mov	w3, 938
	ldr	x4, .LC578
	mov	w0, 0
	ldr	x1, .LC580
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w0, -1
	b	.L960
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
	beq	.L1004
	cmp	w19, w22
	mov	w19, w21
	blt	.L1005
.L1001:
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
.L1005:
	ldr	x1, .LC617
	mov	w0, 30
	mov	w19, 3
	bl	dprint_vfmw
	b	.L1001
	.p2align 3
.L1004:
	cmp	w20, w22
	mov	w19, w21
	ble	.L1001
	ldr	x1, .LC615
	mov	w0, 30
	mov	w19, 0
	bl	dprint_vfmw
	b	.L1001
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
	b	.L1009
	.p2align 3
.L1007:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1015
.L1009:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 311296
	add	x1, x1, 1960
	cbz	x2, .L1007
	cmp	x19, x1
	bne	.L1007
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1015:
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
.L1021:
	ldr	x4, [x6, x5, lsl 3]
	mov	w0, w5
	cbz	x4, .L1017
	add	x1, x4, 307200
	add	x4, x4, 311296
	add	x1, x1, 1896
	add	x4, x4, 104
	.p2align 2
.L1020:
	ldr	w2, [x1]
	cmp	w2, w19
	bhi	.L1018
	ldr	w3, [x1, -20]
	add	w2, w2, w3
	cmp	w19, w2
	bcc	.L1019
.L1018:
	add	x1, x1, 72
	cmp	x1, x4
	bne	.L1020
.L1017:
	add	x5, x5, 1
	cmp	x5, 32
	bne	.L1021
	mov	w0, -1
.L1019:
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
	beq	.L1059
	cmp	w2, 6
	sub	w0, w2, #2
	ccmp	w2, 18, 4, ne
	ccmp	w0, 1, 0, ne
	bls	.L1030
.L1031:
	ldr	x2, [x19, 40]
	cmn	x2, #1
	beq	.L1060
	str	x2, [x4, 744]
.L1041:
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
	ldrb	w5, [x19, 19]
	strb	w5, [x4, 736]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1059:
	add	x0, x4, 311296
	ldr	x0, [x0, 1960]
	ldrsb	w0, [x0, 604]
	cmp	w0, 1
	bne	.L1031
.L1030:
	add	x3, x19, 8
	add	x1, x4, 1280
	mov	w0, w20
	bl	IsNewpicSeg
	cbz	w0, .L1061
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	beq	.L1037
.L1036:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	beq	.L1038
.L1058:
	str	x1, [x0, 752]
.L1038:
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
.L1037:
	ldr	x2, [x0, 760]
	mov	w0, 29
	ldr	x1, .LC626
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1061:
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	ldr	x1, [x0, 752]
	beq	.L1057
	cmn	x1, #1
	beq	.L1034
.L1057:
	str	x1, [x0, 744]
.L1034:
	ldr	x3, [x0, 768]
	mov	x2, -1
	ldr	x1, [x0, 784]
	str	x2, [x0, 752]
	str	x3, [x0, 760]
	str	x1, [x0, 776]
	cbnz	x1, .L1035
	ldr	x1, [x19, 64]
	str	x1, [x0, 776]
.L1035:
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
	bne	.L1036
	ldr	x1, [x19, 40]
	b	.L1058
	.p2align 3
.L1060:
	ldr	x2, [x4, 744]
	b	.L1041
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
	bhi	.L1063
	ldr	x1, .LC630
	ldr	w1, [x1, 2200]
	tbz	x1, 0, .L1064
.L1063:
	and	w1, w0, -17
	cmp	w1, 4
	ccmp	w0, 14, 4, ne
	beq	.L1064
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L1066
.L1064:
	mov	w0, 0
.L1065:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1066:
	mov	w0, -2
	b	.L1065
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
	bhi	.L1107
	ldr	x21, .LC634
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1108
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1109
	ldr	w1, [x0, 24]
	cbnz	w1, .L1110
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
	bls	.L1079
	str	w2, [x1, w19, sxtw 2]
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	beq	.L1111
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1089
	mov	w20, w0
.L1090:
	ldr	x1, [x21, w19, sxtw 3]
	add	x0, x1, 278528
	ldr	w3, [x0, 2224]
	cmp	w3, 1
	beq	.L1112
	cmp	w3, 3
	beq	.L1113
	add	x24, x1, 824
	ldrb	w0, [x24, 1]
	cbnz	w0, .L1083
	ldr	w0, [x1, 1672]
	cbz	w0, .L1114
.L1083:
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
	bne	.L1115
.L1085:
	ldr	x1, [x21, w19, sxtw 3]
	mov	x0, x24
	add	x2, x1, 311296
	ldr	w1, [x1, 672]
	add	x2, x2, 1960
	bl	DecodeStream
	mov	w0, 4
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L1086
.L1087:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1079:
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	bne	.L1116
.L1096:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1116:
	mov	w0, w19
	mov	w20, -3
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1096
	mov	w20, 0
	b	.L1090
	.p2align 3
.L1111:
	ldr	x1, .LC643
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1096
	.p2align 3
.L1086:
	ldr	x0, [x23]
	add	x22, x22, 656
	blr	x0
	mov	w1, w0
	ldr	x2, .LC654
	ldr	w0, [x22, w19, sxtw 2]
	ldr	w2, [x2]
	sub	w0, w1, w0
	cmp	w0, w2
	bls	.L1087
	mov	w0, w19
	str	w1, [x22, w19, sxtw 2]
	bl	VCTRL_GetDecParam
	cbz	x0, .L1087
	ldr	x0, .LC632
	lsl	w2, w19, 24
	add	w2, w2, 262144
	mov	w1, 5746
	add	x0, x0, 312
	mov	w20, 0
	bl	DBG_AddTrace
	b	.L1096
.L1112:
	ldr	x1, .LC647
	mov	w0, 31
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1096
	.p2align 3
.L1089:
	ldr	x1, .LC645
	mov	w2, w19
	mov	w0, 23
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1096
	.p2align 3
.L1109:
	ldr	x2, .LC632
	mov	w3, 5646
	ldr	x4, .LC636
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1096
	.p2align 3
.L1110:
	ldr	x2, .LC632
	mov	w3, 5647
	ldr	x4, .LC638
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1096
	.p2align 3
.L1114:
	add	x1, x1, 832
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L1083
	cmp	w20, 1
	beq	.L1117
.L1084:
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 1
	mov	w20, -4
	str	w1, [x0, 512]
	b	.L1096
	.p2align 3
.L1107:
	ldr	x2, .LC632
	mov	w3, 5644
	ldr	x4, .LC631
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1096
	.p2align 3
.L1115:
	ldr	x0, .LC632
	lsl	w2, w19, 24
	add	w2, w2, 196608
	mov	w1, 5728
	add	x0, x0, 312
	bl	DBG_AddTrace
	b	.L1085
.L1108:
	ldr	x2, .LC632
	mov	w3, 5645
	ldr	x4, .LC635
	mov	w20, -1
	ldr	x1, .LC633
	add	x2, x2, 296
	bl	dprint_vfmw
	b	.L1096
.L1113:
	ldr	w2, [x1, 1616]
	mov	w0, 31
	ldr	x1, .LC649
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1096
.L1117:
	ldr	x1, .LC651
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1084
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
	b	.L1121
	.p2align 3
.L1149:
	ldr	w1, [x1, 20]
	str	w1, [x2, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1148
.L1121:
	ldr	x1, [x21, x0, lsl 3]
	add	x2, x23, 784
	cbnz	x1, .L1149
	add	x1, x23, 784
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1121
.L1148:
	ldr	x24, .LC659
	mov	w20, -1
	.p2align 2
.L1122:
	ldr	w3, [x23, 784]
	add	x1, x23, 788
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L1123:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L1150
.L1125:
	ldr	w2, [x1]
	add	x1, x1, 4
	cmp	w3, w2
	bge	.L1123
	mov	w19, w0
	add	w0, w0, 1
	cmp	w0, 32
	mov	w3, w2
	bne	.L1125
.L1150:
	add	x2, x23, 784
	add	x0, x21, 256
	add	w1, w19, 1
	cmp	w3, wzr
	sxtw	x25, w19
	str	wzr, [x2, w19, sxtw 2]
	str	w1, [x0, 28]
	ble	.L1126
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1122
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1122
	ldr	w1, [x0, 76]
	cmp	w1, wzr
	ble	.L1128
	ldr	w0, [x0, 80]
	cbz	w0, .L1151
.L1128:
	mov	w22, 500
	b	.L1136
	.p2align 3
.L1131:
	ldr	x0, [x21, x25, lsl 3]
	cbnz	w20, .L1134
	ldr	w1, [x0, 1704]
	cmp	w1, 1
	beq	.L1134
	subs	w22, w22, #1
	beq	.L1122
.L1136:
	mov	w0, w19
	bl	DecChanSyntax
	cmn	w0, #1
	mov	w20, w0
	bne	.L1131
	ldr	x4, [x23, 392]
	cbz	x4, .L1132
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w0, w19
	blr	x4
.L1132:
	mov	w0, w20
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L1134:
	str	wzr, [x0, 1704]
	b	.L1122
.L1151:
	add	x1, x29, 88
	mov	w0, w19
	bl	SM_GetInfo
	cbnz	w0, .L1152
.L1129:
	ldr	x20, [x21, x25, lsl 3]
	ldr	w1, [x29, 100]
	ldr	w2, [x20, 76]
	ldr	w0, [x20, 688]
	bl	GetNextDecodeMode
	str	w0, [x20, 688]
	ldr	x1, [x21, x25, lsl 3]
	ldr	w0, [x1, 688]
	cbz	w0, .L1130
	str	wzr, [x1, 680]
	str	wzr, [x1, 684]
	b	.L1128
.L1126:
	str	wzr, [x0, 28]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
.L1130:
	ldr	w0, [x1, 72]
	str	w0, [x1, 680]
	str	w0, [x1, 684]
	b	.L1128
.L1152:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 88
	blr	x3
	b	.L1129
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
	beq	.L1162
.L1154:
	ldr	w0, [x20, 1132]
	mov	w1, 100
	str	w1, [x20, 280]
	cmp	w0, wzr
	ldr	x21, .LC663
	ble	.L1155
	ldr	x1, [x21, 240]
	blr	x1
.L1155:
	ldr	x1, [x21, 24]
	mov	w0, 0
	mov	w22, 0
	blr	x1
	bl	SM_Wakeup
	ldr	w0, [x20, 1128]
	mov	w1, 101
	str	w1, [x20, 280]
	cbz	w0, .L1163
.L1156:
	mov	w0, 102
	mov	w19, 0
	str	w0, [x20, 280]
	bl	VDMDRV_WakeUpVdm
	.p2align 2
.L1157:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 32
	bne	.L1157
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
.L1163:
	bl	DecSyntax
	mov	w22, w0
	b	.L1156
.L1162:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 2824]
	b	.L1154
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
.L1165:
.L1172:
	mov	x1, x25
	mov	w0, 2
	str	wzr, [x20, 280]
	bl	dprint_vfmw
	str	w21, [x20, 260]
	ldr	w0, [x20, 264]
	cmp	w0, 2
	bne	.L1187
	b	.L1170
	.p2align 3
.L1189:
	str	w21, [x20, 280]
	bl	VCTRL_RunProcess
	mov	x1, x22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x20, 264]
	cmp	w0, 2
	beq	.L1170
.L1187:
	cmp	w0, 3
	bne	.L1189
.L1168:
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
.L1170:
	mov	w2, 4
	mov	x1, x26
	mov	w0, 2
	str	w2, [x20, 280]
	mov	w27, 5
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x20, 260]
	b	.L1167
	.p2align 3
.L1190:
	ldr	x1, [x24, 240]
	blr	x1
.L1167:
	mov	x1, x23
	mov	w0, 22
	str	w27, [x20, 280]
	bl	dprint_vfmw
	ldr	w1, [x20, 264]
	mov	w0, 10
	cmp	w1, 1
	beq	.L1172
	cmp	w1, 3
	bne	.L1190
	b	.L1168
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
	cbz	x0, .L1209
	ldr	w1, [x0, 672]
	cmp	w1, 20
	bls	.L1210
.L1209:
	mov	x0, 0
.L1192:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1210:
	ldr	x2, .LC678
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1194
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1194:
	.section	.rodata
	.align	0
	.align	2
.L1194:
	.byte	(.L1207 - .Lrtx1194) / 4
	.byte	(.L1195 - .Lrtx1194) / 4
	.byte	(.L1196 - .Lrtx1194) / 4
	.byte	(.L1197 - .Lrtx1194) / 4
	.byte	(.L1209 - .Lrtx1194) / 4
	.byte	(.L1198 - .Lrtx1194) / 4
	.byte	(.L1199 - .Lrtx1194) / 4
	.byte	(.L1209 - .Lrtx1194) / 4
	.byte	(.L1200 - .Lrtx1194) / 4
	.byte	(.L1201 - .Lrtx1194) / 4
	.byte	(.L1202 - .Lrtx1194) / 4
	.byte	(.L1202 - .Lrtx1194) / 4
	.byte	(.L1202 - .Lrtx1194) / 4
	.byte	(.L1203 - .Lrtx1194) / 4
	.byte	(.L1209 - .Lrtx1194) / 4
	.byte	(.L1204 - .Lrtx1194) / 4
	.byte	(.L1205 - .Lrtx1194) / 4
	.byte	(.L1206 - .Lrtx1194) / 4
	.byte	(.L1209 - .Lrtx1194) / 4
	.byte	(.L1209 - .Lrtx1194) / 4
	.byte	(.L1207 - .Lrtx1194) / 4
	.text
	.p2align 3
.L1207:
	add	x0, x0, 311296
	ldr	x19, [sp, 16]
	add	x0, x0, 1968
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1205:
	add	x0, x0, 315392
	add	x0, x0, 3896
	b	.L1192
	.p2align 3
.L1204:
	add	x0, x0, 311296
	add	x0, x0, 2872
	b	.L1192
	.p2align 3
.L1203:
	add	x0, x0, 319488
	add	x0, x0, 2000
	b	.L1192
	.p2align 3
.L1202:
	add	x0, x0, 323584
	add	x0, x0, 2432
	b	.L1192
	.p2align 3
.L1206:
	add	x0, x0, 585728
	add	x0, x0, 3376
	b	.L1192
	.p2align 3
.L1195:
	add	x0, x0, 364544
	add	x0, x0, 2256
	b	.L1192
	.p2align 3
.L1197:
	add	x0, x0, 401408
	add	x0, x0, 648
	b	.L1192
	.p2align 3
.L1196:
	add	x0, x0, 335872
	add	x0, x0, 104
	b	.L1192
	.p2align 3
.L1201:
	add	x0, x0, 364544
	add	x0, x0, 3656
	b	.L1192
	.p2align 3
.L1200:
	add	x0, x0, 364544
	add	x0, x0, 3680
	b	.L1192
	.p2align 3
.L1199:
	add	x0, x0, 327680
	add	x0, x0, 1840
	b	.L1192
	.p2align 3
.L1198:
	add	x0, x0, 352256
	add	x0, x0, 3624
	b	.L1192
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC677:
	.xword	.LANCHOR1
	.align	3
.LC678:
	.xword	.L1194
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
	bhi	.L1227
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1221
	add	x2, x29, 48
	add	x1, x29, 40
	str	wzr, [x29, 40]
	str	wzr, [x2, -4]!
	bl	GetQueueImgNum
	ldr	w2, [x29, 40]
	mov	w0, -1
	cbz	w2, .L1213
	cmp	w2, 32
	bhi	.L1228
.L1215:
	ldr	x1, .LC684
	ldrh	w0, [x20, 4]
	ldr	x5, [x1, w19, sxtw 3]
	and	x0, x0, 63
	add	x0, x0, 2
	add	x6, x5, 311296
	ldr	x4, [x20, x0, lsl 3]
	ldr	w3, [x6, 1880]
	cmp	w3, 32
	bhi	.L1216
	mov	w1, 1
	b	.L1218
	.p2align 3
.L1219:
	ldrh	w0, [x20, 4]
	cmp	w3, 33
	add	w0, w0, w1
	add	w1, w1, 1
	and	x0, x0, 63
	add	x0, x0, 2
	ldr	x4, [x20, x0, lsl 3]
	beq	.L1216
.L1218:
	ubfiz	x0, x3, 4, 32
	ldr	w4, [x4, 20]
	add	x0, x5, x0
	add	w3, w3, 1
	add	x0, x0, 311296
	cmp	w1, w2
	str	wzr, [x0, 1352]
	str	w4, [x0, 1356]
	str	xzr, [x0, 1360]
	str	w3, [x6, 1880]
	bcc	.L1219
	mov	w0, 0
.L1213:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1216:
	ldr	x1, .LC686
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1213
	.p2align 3
.L1228:
	ldr	x1, .LC683
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 40]
	cbnz	w2, .L1215
	mov	w0, 0
	b	.L1213
.L1221:
	mov	w0, -1
	b	.L1213
.L1227:
	ldr	x2, .LC680
	mov	w3, 3265
	ldr	x4, .LC679
	mov	w0, 0
	ldr	x1, .LC681
	add	x2, x2, 328
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1213
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
	bhi	.L1246
	cbz	x19, .L1247
	mov	w0, w22
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1239
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
	cbnz	w2, .L1248
	ldr	x6, .LC694
	ldr	x4, [x6, w22, sxtw 3]
	add	x0, x4, 311296
	ldr	w0, [x0, 1880]
	cbz	w0, .L1237
	mov	w2, 0
	sxtw	x0, w22
	.p2align 2
.L1238:
	sxtw	x3, w2
	add	w2, w2, 1
	add	x1, x3, 16384
	lsl	x3, x3, 4
	add	x1, x1, 3156
	add	x5, x19, x3
	lsl	x1, x1, 4
	sxth	w2, w2
	add	x4, x4, x1
	ldr	w4, [x4, 12]
	str	w4, [x5, 4]
	ldr	x4, [x6, x0, lsl 3]
	add	x1, x4, x1
	ldr	x1, [x1, 16]
	str	x1, [x5, 8]
	str	wzr, [x19, x3]
	ldr	x4, [x6, x0, lsl 3]
	add	x1, x4, 311296
	ldr	w1, [x1, 1880]
	cmp	w2, w1
	bcc	.L1238
	str	w1, [x19, 528]
	b	.L1237
	.p2align 3
.L1248:
	cmp	w2, 32
	bhi	.L1249
.L1234:
	mov	w0, 0
	.p2align 2
.L1236:
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
	bhi	.L1236
	uxth	w1, w2
.L1235:
	ldrh	w0, [x20, 4]
	add	w0, w1, w0
	and	w0, w0, 63
	strh	w0, [x20, 4]
	str	w2, [x19, 528]
.L1237:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, 0
.L1231:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1249:
	ldr	x1, .LC693
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 72]
	cbnz	w2, .L1234
	mov	w2, 0
	mov	w1, 0
	b	.L1235
.L1239:
	mov	w0, -1
	b	.L1231
.L1246:
	ldr	x2, .LC688
	mov	w3, 3341
	ldr	x4, .LC687
	mov	w0, 0
	ldr	x1, .LC689
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1231
.L1247:
	ldr	x2, .LC688
	mov	w3, 3342
	ldr	x4, .LC691
	mov	w0, 0
	ldr	x1, .LC689
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1231
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
	cbz	x20, .L1263
	cbz	x21, .L1264
	cbz	x22, .L1265
	cmp	w19, 31
	bhi	.L1266
	ldr	x23, .LC704
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L1267
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	cbz	x0, .L1257
	mov	x2, x22
	mov	x1, x21
	bl	GetQueueImgNum
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w3, [x0, 672]
	cbz	w3, .L1268
	cmp	w3, 16
	beq	.L1269
	cmp	w3, 17
	beq	.L1270
	cmp	w3, 15
	beq	.L1271
	cmp	w3, 18
	beq	.L1272
	mov	w0, 2
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1257:
	str	wzr, [x22]
	str	wzr, [x21]
	str	wzr, [x20]
.L1250:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1266:
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
.L1268:
	add	x0, x0, 339968
	ldr	w0, [x0, 1568]
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1269:
	add	x0, x0, 315392
	ldr	w0, [x0, 632]
	str	w0, [x20]
	b	.L1250
	.p2align 3
.L1270:
	mov	w0, 9
	str	w0, [x20]
	b	.L1250
	.p2align 3
.L1263:
	ldr	x2, .LC697
	mov	w3, 5852
	ldr	x4, .LC696
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1250
	.p2align 3
.L1264:
	ldr	x2, .LC697
	mov	w3, 5853
	ldr	x4, .LC700
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1250
	.p2align 3
.L1265:
	ldr	x2, .LC697
	mov	w3, 5854
	ldr	x4, .LC702
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1250
	.p2align 3
.L1271:
	add	x0, x0, 11436032
	ldr	w0, [x0, 2784]
	str	w0, [x20]
	b	.L1250
	.p2align 3
.L1267:
	ldr	x2, .LC697
	mov	w3, 5856
	ldr	x4, .LC705
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1250
	.p2align 3
.L1272:
	ldr	x2, .LC697
	mov	w0, 32
	ldr	x1, .LC707
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1250
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
	.align	3
.LC707:
	.xword	.LC706
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
	cbz	x19, .L1283
	cmp	w20, 31
	bhi	.L1284
	ldr	x21, .LC715
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L1285
	ldr	x0, .LC717
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
	add	x0, x5, 278528
	ldrsb	w0, [x0, 2195]
	cmp	w0, wzr
	ble	.L1281
	mov	x2, 40838
	sub	w4, w0, #1
	mov	w3, 92
	movk	x2, 0x4, lsl 16
	add	x0, x5, 299008
	mov	w1, 0
	umaddl	x2, w4, w3, x2
	add	x0, x0, 3882
	add	x3, x5, x2
	.p2align 2
.L1280:
	ldrsb	w2, [x0], 92
	cmp	w2, 3
	csinc	w1, w1, w1, ne
	cmp	x0, x3
	bne	.L1280
.L1278:
	str	w1, [x19, 84]
	add	x3, x29, 68
	add	x2, x29, 64
	mov	w0, w20
	ldr	x4, [x21, w20, sxtw 3]
	add	x1, x29, 60
	sxtw	x22, w20
	add	x4, x4, 278528
	ldrsb	w4, [x4, 2195]
	str	w4, [x19, 92]
	bl	VCTRL_GetChanImgNum
	ldr	x2, .LC718
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
	mov	x0, 63400
	ldr	x1, [x21, w20, sxtw 3]
	movk	x0, 0x4, lsl 16
	add	x0, x1, x0
	ldrb	w0, [x0, 3616]
	and	w0, w0, 1
	str	w0, [x19, 88]
.L1273:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1284:
	ldr	x2, .LC712
	mov	w3, 1262
	ldr	x4, .LC714
	mov	w0, 0
	ldr	x1, .LC713
	add	x2, x2, 408
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1285:
	ldr	x2, .LC712
	mov	w3, 1263
	ldr	x4, .LC716
	ldr	x1, .LC713
	add	x2, x2, 408
	bl	dprint_vfmw
	b	.L1273
.L1281:
	mov	w1, 0
	b	.L1278
.L1283:
	ldr	x2, .LC712
	mov	w3, 1261
	ldr	x4, .LC711
	mov	w0, 0
	ldr	x1, .LC713
	add	x2, x2, 408
	bl	dprint_vfmw
	b	.L1273
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	3
.LC711:
	.xword	.LC710
	.align	3
.LC712:
	.xword	.LANCHOR4
	.align	3
.LC713:
	.xword	.LC6
	.align	3
.LC714:
	.xword	.LC385
	.align	3
.LC715:
	.xword	.LANCHOR1
	.align	3
.LC716:
	.xword	.LC390
	.align	3
.LC717:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC718:
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
	bhi	.L1290
	ldr	x0, .LC723
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1291
	ldr	w0, [x0, 1412]
.L1288:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1290:
	ldr	x2, .LC721
	mov	w3, 5919
	ldr	x4, .LC720
	mov	w0, 0
	ldr	x1, .LC722
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1288
.L1291:
	ldr	x2, .LC721
	mov	w3, 5920
	ldr	x4, .LC724
	ldr	x1, .LC722
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1288
	.size	VCTRL_GetChanWidth, .-VCTRL_GetChanWidth
	.align	3
.LC720:
	.xword	.LC198
	.align	3
.LC721:
	.xword	.LANCHOR4
	.align	3
.LC722:
	.xword	.LC6
	.align	3
.LC723:
	.xword	.LANCHOR1
	.align	3
.LC724:
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
	bhi	.L1296
	ldr	x0, .LC728
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1297
	ldr	w0, [x0, 1416]
.L1294:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1296:
	ldr	x2, .LC726
	mov	w3, 5927
	ldr	x4, .LC725
	mov	w0, 0
	ldr	x1, .LC727
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1294
.L1297:
	ldr	x2, .LC726
	mov	w3, 5928
	ldr	x4, .LC729
	ldr	x1, .LC727
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1294
	.size	VCTRL_GetChanHeight, .-VCTRL_GetChanHeight
	.align	3
.LC725:
	.xword	.LC198
	.align	3
.LC726:
	.xword	.LANCHOR4
	.align	3
.LC727:
	.xword	.LC6
	.align	3
.LC728:
	.xword	.LANCHOR1
	.align	3
.LC729:
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
	bhi	.L1302
	ldr	x0, .LC733
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1301
	ldr	w0, [x0, 36]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1302:
	ldr	x2, .LC731
	mov	w3, 5935
	ldr	x4, .LC730
	mov	w0, 0
	ldr	x1, .LC732
	add	x2, x2, 480
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1301:
	mov	w0, 33
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCapLevel, .-VCTRL_GetChanCapLevel
	.align	3
.LC730:
	.xword	.LC198
	.align	3
.LC731:
	.xword	.LANCHOR4
	.align	3
.LC732:
	.xword	.LC6
	.align	3
.LC733:
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
	ldr	x20, .LC734
	add	w0, w21, 4096
	mov	w1, 10000
	add	w0, w0, 904
	mov	w2, w21
	cmp	w0, w1
	str	w21, [x20, 3696]
	bhi	.L1308
.L1304:
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
	bhi	.L1309
.L1305:
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
.L1308:
	ldr	x1, .LC736
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w2, [x20, 3696]
	b	.L1304
	.p2align 3
.L1309:
	ldr	x1, .LC738
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w19, [x20, 3700]
	b	.L1305
	.size	VCTRL_SetVdecExtra, .-VCTRL_SetVdecExtra
	.align	3
.LC734:
	.xword	.LANCHOR3
	.align	3
.LC736:
	.xword	.LC735
	.align	3
.LC738:
	.xword	.LC737
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
	cbz	w19, .L1314
	ldr	x3, .LC741
	mov	w1, 1
	ldr	x0, .LC739
	add	x3, x3, 504
	b	.L1312
	.p2align 3
.L1313:
	ldr	w4, [x3, x4]
	add	w1, w1, 1
	ubfiz	x2, x1, 4, 32
	cmp	w4, w19
	add	x2, x3, x2
	beq	.L1311
	ldr	x0, [x2, 8]
.L1312:
	ubfiz	x4, x1, 4, 32
	cbnz	x0, .L1313
.L1311:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1314:
	ldr	x0, .LC740
	b	.L1311
	.size	VfmwProcGetHandler, .-VfmwProcGetHandler
	.align	3
.LC739:
	.xword	VfmwProc_SetErrorThread
	.align	3
.LC740:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC741:
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
	cbz	x20, .L1325
	cbz	w19, .L1322
	ldr	x4, .LC745
	mov	w0, 1
	ldr	x5, .LC743
	add	x4, x4, 504
	b	.L1318
	.p2align 3
.L1323:
	ldr	w6, [x4, x6]
	add	w0, w0, 1
	ubfiz	x3, x0, 4, 32
	cmp	w19, w6
	add	x3, x4, x3
	beq	.L1317
	ldr	x5, [x3, 8]
.L1318:
	ubfiz	x6, x0, 4, 32
	cbnz	x5, .L1323
	ldr	x1, .LC747
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
.L1325:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1322:
	ldr	x5, .LC744
.L1317:
	mov	x0, x20
	blr	x5
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	3
.LC743:
	.xword	VfmwProc_SetErrorThread
	.align	3
.LC744:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC745:
	.xword	.LANCHOR4
	.align	3
.LC747:
	.xword	.LC746
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
	bhi	.L1332
	ldr	x0, .LC749
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1326
	str	w20, [x0, 516]
.L1326:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1332:
	bl	VCTRL_SetLastFrameState.part.24
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	3
.LC749:
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
	cbz	w20, .L1340
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 31
	bhi	.L1347
.L1337:
	ldr	x21, .LC750
	ldr	x1, [x21, w19, sxtw 3]
	cbz	x1, .L1338
	str	w0, [x1, 516]
.L1338:
	ldr	x0, .LC751
	ldr	x4, [x0, 392]
	cbz	x4, .L1339
	add	x2, x29, 64
	mov	w3, 4
	mov	w1, 115
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L1339:
	ldr	x4, [x21, w19, sxtw 3]
	mov	w3, w20
	ldr	x1, .LC753
	mov	w2, w19
	mov	w0, 1
	ldr	w4, [x4, 516]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1340:
	cmp	w19, 31
	mov	w0, 2
	bls	.L1337
.L1347:
	bl	VCTRL_SetLastFrameState.part.24
	ldr	x21, .LC750
	b	.L1338
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	3
.LC750:
	.xword	.LANCHOR1
	.align	3
.LC751:
	.xword	.LANCHOR5
	.align	3
.LC753:
	.xword	.LC752
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
	bhi	.L1375
	ldr	x0, .LC757
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1376
	add	x0, x0, 311296
	ldr	w1, [x0, 1952]
	cmp	w1, 17
	bls	.L1377
.L1368:
	mov	w1, 1
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC761
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, -1
.L1350:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1377:
	ldr	x2, .LC759
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1354
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1354:
	.section	.rodata
	.align	0
	.align	2
.L1354:
	.byte	(.L1353 - .Lrtx1354) / 4
	.byte	(.L1355 - .Lrtx1354) / 4
	.byte	(.L1356 - .Lrtx1354) / 4
	.byte	(.L1357 - .Lrtx1354) / 4
	.byte	(.L1368 - .Lrtx1354) / 4
	.byte	(.L1358 - .Lrtx1354) / 4
	.byte	(.L1359 - .Lrtx1354) / 4
	.byte	(.L1368 - .Lrtx1354) / 4
	.byte	(.L1360 - .Lrtx1354) / 4
	.byte	(.L1361 - .Lrtx1354) / 4
	.byte	(.L1362 - .Lrtx1354) / 4
	.byte	(.L1362 - .Lrtx1354) / 4
	.byte	(.L1362 - .Lrtx1354) / 4
	.byte	(.L1363 - .Lrtx1354) / 4
	.byte	(.L1368 - .Lrtx1354) / 4
	.byte	(.L1364 - .Lrtx1354) / 4
	.byte	(.L1365 - .Lrtx1354) / 4
	.byte	(.L1366 - .Lrtx1354) / 4
	.text
	.p2align 3
.L1366:
	add	x0, x0, 1960
	bl	VP9DEC_GetRemainImg
	mov	w19, w0
	.p2align 2
.L1352:
	cmn	w19, #1
	beq	.L1368
	cbnz	w19, .L1378
	mov	w0, w20
	mov	w1, 0
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC763
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1365:
	add	x0, x0, 1960
	bl	HEVCDEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1364:
	add	x0, x0, 1960
	bl	MVC_DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1363:
	add	x0, x0, 1960
	bl	VP8DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1362:
	add	x0, x0, 1960
	bl	VP6DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1361:
	add	x0, x0, 1960
	bl	REAL9DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1360:
	add	x0, x0, 1960
	bl	REAL8DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1359:
	add	x0, x0, 1960
	bl	AVSDEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1358:
	add	x0, x0, 1960
	bl	DIVX3DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1357:
	add	x0, x0, 1960
	bl	MPEG2DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1356:
	add	x0, x0, 1960
	bl	MPEG4DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1355:
	add	x0, x0, 1960
	bl	VC1DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1353:
	add	x0, x0, 1960
	bl	H264DEC_GetRemainImg
	mov	w19, w0
	b	.L1352
	.p2align 3
.L1378:
	mov	w1, w19
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC765
	sub	w2, w19, #2
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1375:
	ldr	x2, .LC755
	mov	w3, 7212
	ldr	x4, .LC754
	mov	w0, 0
	ldr	x1, .LC756
	add	x2, x2, 1224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1350
.L1376:
	ldr	x2, .LC755
	mov	w3, 7213
	ldr	x4, .LC758
	ldr	x1, .LC756
	add	x2, x2, 1224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1350
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	3
.LC754:
	.xword	.LC198
	.align	3
.LC755:
	.xword	.LANCHOR4
	.align	3
.LC756:
	.xword	.LC6
	.align	3
.LC757:
	.xword	.LANCHOR1
	.align	3
.LC758:
	.xword	.LC9
	.align	3
.LC759:
	.xword	.L1354
	.align	3
.LC761:
	.xword	.LC760
	.align	3
.LC763:
	.xword	.LC762
	.align	3
.LC765:
	.xword	.LC764
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
	ldr	x21, .LC766
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1413
	ldr	w1, [x0, 672]
	ldr	w24, [x0, 1352]
	cmp	w1, 17
	bls	.L1414
.L1379:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1414:
	ldr	x2, .LC770
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx1383
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx1383:
	.section	.rodata
	.align	0
	.align	2
.L1383:
	.2byte	(.L1382 - .Lrtx1383) / 4
	.2byte	(.L1384 - .Lrtx1383) / 4
	.2byte	(.L1385 - .Lrtx1383) / 4
	.2byte	(.L1386 - .Lrtx1383) / 4
	.2byte	(.L1379 - .Lrtx1383) / 4
	.2byte	(.L1387 - .Lrtx1383) / 4
	.2byte	(.L1388 - .Lrtx1383) / 4
	.2byte	(.L1379 - .Lrtx1383) / 4
	.2byte	(.L1389 - .Lrtx1383) / 4
	.2byte	(.L1390 - .Lrtx1383) / 4
	.2byte	(.L1391 - .Lrtx1383) / 4
	.2byte	(.L1391 - .Lrtx1383) / 4
	.2byte	(.L1391 - .Lrtx1383) / 4
	.2byte	(.L1392 - .Lrtx1383) / 4
	.2byte	(.L1379 - .Lrtx1383) / 4
	.2byte	(.L1393 - .Lrtx1383) / 4
	.2byte	(.L1394 - .Lrtx1383) / 4
	.2byte	(.L1395 - .Lrtx1383) / 4
	.text
	.p2align 3
.L1395:
	add	x0, x0, 311296
	mov	w3, w22
	mov	w2, w24
	mov	w1, w20
	add	x0, x0, 1960
	bl	VP9DEC_VDMPostProc
	cmp	w24, 1
	beq	.L1379
.L1411:
	ldr	x0, [x21, w19, sxtw 3]
.L1412:
	add	x0, x0, 311296
	str	xzr, [x0, 1968]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1394:
	add	x0, x0, 311296
	mov	w5, w22
	mov	w4, w24
	mov	x3, x23
	mov	w2, 1
	mov	w1, w20
	add	x0, x0, 1960
	bl	HEVCDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	ldrb	w0, [x0, 1969]
	cmp	w0, 1
	beq	.L1415
.L1398:
	cmp	w24, 1
	beq	.L1379
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 315392
	str	xzr, [x0, 312]
	b	.L1379
	.p2align 3
.L1393:
	add	x0, x0, 311296
	mov	w1, w20
	mov	w2, 1
	add	x0, x0, 1960
	bl	MVC_DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	ldrb	w1, [x0, 1961]
	cmp	w1, 1
	beq	.L1416
	str	xzr, [x0, 2192]
	b	.L1379
	.p2align 3
.L1392:
	add	x0, x0, 311296
	mov	w1, w20
	add	x0, x0, 1960
	bl	VP8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	str	xzr, [x0, 1968]
	b	.L1379
	.p2align 3
.L1391:
	add	x0, x0, 311296
	mov	w1, w20
	add	x0, x0, 1960
	bl	VP6DEC_VDMPostProc
	b	.L1411
	.p2align 3
.L1390:
	mov	w0, w22
	bl	VDMDRV_GetMb0QpInCurrPic
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 311296
	add	x0, x0, 1960
	bl	REAL9DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	str	xzr, [x0, 1968]
	b	.L1379
	.p2align 3
.L1389:
	mov	w0, w22
	bl	VDMDRV_GetMb0QpInCurrPic
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 311296
	add	x0, x0, 1960
	bl	REAL8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	str	xzr, [x0, 1968]
	b	.L1379
	.p2align 3
.L1388:
	add	x0, x0, 311296
	mov	w1, w20
	add	x0, x0, 1960
	bl	AVSDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	ldrb	w1, [x0, 1960]
	cmp	w1, 1
	beq	.L1417
	str	xzr, [x0, 1984]
	b	.L1379
	.p2align 3
.L1387:
	mov	w0, w22
	bl	VDMDRV_GetSwitchRounding
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 311296
	add	x0, x0, 1960
	bl	DIVX3DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	str	xzr, [x0, 1968]
	b	.L1379
	.p2align 3
.L1386:
	add	x0, x0, 311296
	mov	w1, w20
	add	x0, x0, 1960
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 401408
	ldrb	w1, [x1, 1274]
	cmp	w1, 1
	bne	.L1412
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 401408
	strb	wzr, [x1, 1274]
	b	.L1412
	.p2align 3
.L1385:
	add	x0, x0, 311296
	mov	w1, w20
	mov	x2, x23
	add	x0, x0, 1960
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 335872
	ldrb	w1, [x1, 748]
	cmp	w1, 1
	beq	.L1418
.L1401:
	add	x0, x0, 311296
	str	xzr, [x0, 3000]
	b	.L1379
	.p2align 3
.L1384:
	add	x0, x0, 311296
	mov	w1, w20
	add	x0, x0, 1960
	bl	VC1DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 327680
	ldrb	w1, [x1, 391]
	cmp	w1, 1
	bne	.L1412
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 327680
	strb	wzr, [x1, 391]
	b	.L1412
	.p2align 3
.L1382:
	add	x0, x0, 311296
	mov	w5, w22
	mov	w4, w24
	mov	x3, x23
	mov	w2, 1
	mov	w1, w20
	add	x0, x0, 1960
	bl	H264DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 327680
	ldrb	w0, [x0, 504]
	cmp	w0, 1
	beq	.L1419
.L1396:
	cmp	w24, 1
	beq	.L1379
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	str	xzr, [x0, 2576]
	b	.L1379
	.p2align 3
.L1417:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	strb	wzr, [x0, 1960]
	str	xzr, [x0, 1984]
	b	.L1379
	.p2align 3
.L1416:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	strb	wzr, [x0, 1961]
	str	xzr, [x0, 2192]
	b	.L1379
	.p2align 3
.L1413:
	ldr	x2, .LC768
	mov	w3, 4215
	ldr	x4, .LC767
	ldr	x1, .LC769
	add	x2, x2, 1248
	bl	dprint_vfmw
	b	.L1379
	.p2align 3
.L1418:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 335872
	strb	wzr, [x1, 748]
	b	.L1401
.L1419:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 327680
	strb	wzr, [x0, 504]
	b	.L1396
.L1415:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 311296
	strb	wzr, [x0, 1969]
	b	.L1398
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	3
.LC766:
	.xword	.LANCHOR1
	.align	3
.LC767:
	.xword	.LC9
	.align	3
.LC768:
	.xword	.LANCHOR4
	.align	3
.LC769:
	.xword	.LC6
	.align	3
.LC770:
	.xword	.L1383
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
	bhi	.L1428
	ldr	x0, .LC774
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1429
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L1424
	ldr	x2, .LC772
	mov	w3, 4405
	ldr	x4, .LC776
	mov	w0, 0
	ldr	x1, .LC773
	add	x2, x2, 1264
	bl	dprint_vfmw
.L1420:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1424:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L1420
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
.L1428:
	ldr	x2, .LC772
	mov	w3, 4403
	ldr	x4, .LC771
	mov	w0, 0
	ldr	x1, .LC773
	add	x2, x2, 1264
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1429:
	ldr	x2, .LC772
	mov	w3, 4404
	ldr	x4, .LC775
	ldr	x1, .LC773
	add	x2, x2, 1264
	bl	dprint_vfmw
	b	.L1420
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	3
.LC771:
	.xword	.LC475
	.align	3
.LC772:
	.xword	.LANCHOR4
	.align	3
.LC773:
	.xword	.LC6
	.align	3
.LC774:
	.xword	.LANCHOR1
	.align	3
.LC775:
	.xword	.LC435
	.align	3
.LC776:
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
	bhi	.L1433
	add	w1, w20, 2
	mov	w0, w19
	bl	VCTRL_ReportLastFrame
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1433:
	ldr	x2, .LC778
	mov	w3, 7338
	ldr	x4, .LC777
	mov	w0, 0
	ldr	x1, .LC779
	add	x2, x2, 1288
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SvdecLastFrame, .-VCTRL_SvdecLastFrame
	.align	3
.LC777:
	.xword	.LC198
	.align	3
.LC778:
	.xword	.LANCHOR4
	.align	3
.LC779:
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
	bls	.L1452
	ldr	x1, .LC782
	mov	w3, w19
	mov	w2, 7822
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 13
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1452:
	ldr	x0, .LC780
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1437
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1437:
	.section	.rodata
	.align	0
	.align	2
.L1437:
	.byte	(.L1436 - .Lrtx1437) / 4
	.byte	(.L1438 - .Lrtx1437) / 4
	.byte	(.L1439 - .Lrtx1437) / 4
	.byte	(.L1440 - .Lrtx1437) / 4
	.byte	(.L1441 - .Lrtx1437) / 4
	.byte	(.L1442 - .Lrtx1437) / 4
	.byte	(.L1443 - .Lrtx1437) / 4
	.text
	.p2align 3
.L1442:
	cmp	w20, 1
	mov	w1, 12
	mov	w0, 13
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1443:
	cmp	w20, 1
	mov	w0, 7
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1436:
	cmp	w20, 1
	mov	w0, 6
	csel	w0, wzr, w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1438:
	cmp	w20, 1
	mov	w1, 8
	mov	w0, 2
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1439:
	cmp	w20, 1
	mov	w1, 10
	mov	w0, 4
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1440:
	cmp	w20, 1
	mov	w1, 9
	mov	w0, 3
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1441:
	cmp	w20, 1
	mov	w1, 11
	mov	w0, 5
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Get_YuvFormat, .-Get_YuvFormat
	.align	3
.LC780:
	.xword	.L1437
	.align	3
.LC782:
	.xword	.LC781
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
	beq	.L1462
	ldr	w0, [x20, 4]
	cmp	w0, 1
	beq	.L1456
	mov	w0, w21
	mov	w2, 0
	mov	w1, w22
	bl	FSP_ClearLogicFs
	mov	w0, 0
.L1455:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1456:
	ldr	w0, [x20, 48]
	bl	MEM_Phy2Vir
	cbz	x0, .L1463
.L1457:
	mov	w1, w22
	mov	w0, w21
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L1464
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
	ldr	x4, .LC789
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
	beq	.L1465
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
	ldr	x2, .LC792
	mov	x4, x19
	mov	w1, w24
	mov	w0, w21
	ldr	x2, [x2, w21, sxtw 3]
	add	x2, x2, 311296
	add	x3, x2, 1968
	add	x2, x2, 1960
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w0, 0
	beq	.L1455
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
	b	.L1455
	.p2align 3
.L1463:
	ldr	w0, [x20, 4]
	cmp	w0, 1
	bne	.L1457
	ldr	x1, .LC786
	mov	w0, 0
	ldr	w2, [x20, 48]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1455
.L1462:
	ldr	x1, .LC784
	mov	w0, 0
	ldr	w2, [x20, 40]
	bl	dprint_vfmw
	mov	w0, w22
	b	.L1455
.L1465:
	ldr	x1, .LC791
	mov	w2, w0
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1455
.L1464:
	ldr	x1, .LC788
	mov	w2, 4698
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1455
	.size	VDH_PutUsrdecFrame, .-VDH_PutUsrdecFrame
	.align	3
.LC784:
	.xword	.LC783
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC788:
	.xword	.LC787
	.align	3
.LC789:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC791:
	.xword	.LC790
	.align	3
.LC792:
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
	ldr	x20, .LC793
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1474
	cbz	x21, .L1475
	ldr	w2, [x0, 672]
	cmp	w2, 20
	bne	.L1476
	ldr	x3, .LC801
	mov	x1, x21
	mov	x2, 72
	add	x0, x0, 600
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	add	x1, x1, 600
	bl	VDH_PutUsrdecFrame
	cbnz	w0, .L1477
.L1468:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1476:
	ldr	x1, .LC800
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1468
	.p2align 3
.L1477:
	ldr	x1, .LC803
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1468
.L1475:
	ldr	x2, .LC795
	mov	w3, 4839
	ldr	x4, .LC798
	mov	w0, 0
	ldr	x1, .LC796
	add	x2, x2, 1312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1468
.L1474:
	ldr	x2, .LC795
	mov	w3, 4838
	ldr	x4, .LC794
	ldr	x1, .LC796
	add	x2, x2, 1312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1468
	.size	VCTRL_PutUsrdecFrame, .-VCTRL_PutUsrdecFrame
	.align	3
.LC793:
	.xword	.LANCHOR1
	.align	3
.LC794:
	.xword	.LC9
	.align	3
.LC795:
	.xword	.LANCHOR4
	.align	3
.LC796:
	.xword	.LC6
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC800:
	.xword	.LC799
	.align	3
.LC801:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC803:
	.xword	.LC802
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
	beq	.L1480
	mov	w0, w19
	bl	VCTRL_CanBeDecodedByHardWare.part.26
.L1480:
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
	beq	.L1485
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1485:
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
	bhi	.L1521
	ldr	x20, .LC806
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L1522
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1490
	ldr	w0, [x0, 672]
	cmp	w0, 22
	beq	.L1490
	cmp	w0, 7
	ccmp	w0, 4, 4, ne
	beq	.L1486
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cbz	w0, .L1486
	mov	x19, 0
	mov	w22, 0
	.p2align 2
.L1495:
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbnz	w0, .L1494
	ldr	x0, [x20, x19, lsl 3]
	ldr	w1, [x0, 672]
	cmp	w1, 4
	mov	w0, w1
	ccmp	w1, 7, 4, ne
	beq	.L1494
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	w0, wzr
	csinc	w22, w22, w22, eq
.L1494:
	add	x19, x19, 1
	cmp	x19, 32
	bne	.L1495
	cmp	w22, 1
	beq	.L1523
.L1496:
	mov	x0, x20
	add	x3, x20, 256
	mov	w2, 0
	.p2align 2
.L1503:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L1502
	ldr	w1, [x1, 672]
	cmp	w1, 6
	csinc	w2, w2, wzr, ne
.L1502:
	cmp	x0, x3
	bne	.L1503
	cmp	w2, 1
	beq	.L1524
.L1504:
	ldr	x0, [x20, w21, sxtw 3]
	ldr	w0, [x0, 672]
	cmp	w0, 1
	bne	.L1486
	ldr	x0, .LC811
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1525
	ldr	x0, .LC812
	ldr	x1, [x0, 56]
	cbz	x1, .L1486
	mov	w0, 0
	blr	x1
	b	.L1486
	.p2align 3
.L1490:
	ldr	x1, .LC810
	mov	w2, 7883
	mov	w0, 0
	bl	dprint_vfmw
.L1486:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1521:
	ldr	x1, .LC805
	mov	w2, 7871
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1523:
	ldr	x19, .LC811
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1526
	mov	w1, 0
	mov	w0, w22
	bl	VDH_Need_Module
.L1499:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1500
	ldr	x0, .LC812
	ldr	x1, [x0, 40]
	cbz	x1, .L1527
	mov	w0, 0
	blr	x1
	b	.L1496
.L1524:
	ldr	x0, .LC811
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1528
	mov	w1, 0
	mov	w0, 3
	bl	VDH_Need_Module
	b	.L1504
.L1528:
	ldr	x0, .LC812
	ldr	x1, [x0, 24]
	cbz	x1, .L1529
	mov	w0, 0
	blr	x1
	b	.L1504
.L1526:
	ldr	x0, .LC812
	ldr	x1, [x0, 8]
	cbz	x1, .L1530
	mov	w0, 0
	blr	x1
	b	.L1499
.L1522:
	ldr	x1, .LC808
	mov	w2, 7877
	bl	dprint_vfmw
	b	.L1486
.L1525:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_Need_Module
	b	.L1486
.L1500:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Need_Module
	b	.L1496
.L1527:
	ldr	x1, .LC813
	mov	w2, 7932
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1496
.L1529:
	ldr	x1, .LC813
	mov	w2, 7963
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1504
.L1530:
	ldr	x1, .LC813
	mov	w2, 7918
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1499
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	3
.LC805:
	.xword	.LC804
	.align	3
.LC806:
	.xword	.LANCHOR1
	.align	3
.LC808:
	.xword	.LC807
	.align	3
.LC810:
	.xword	.LC809
	.align	3
.LC811:
	.xword	g_HalDisable
	.align	3
.LC812:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC813:
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
	bhi	.L1542
	ldr	x19, .LC818
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1543
	ldr	w21, [x0, 4]
	cmp	w21, 1
	bne	.L1544
	ldr	w0, [x0, 672]
	cmp	w0, 22
	beq	.L1545
	mov	w0, w20
	bl	SM_Start
	ldr	x0, [x19, w20, sxtw 3]
	add	x1, x0, 311296
	str	w21, [x1, 1948]
	str	w21, [x0, 8]
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 12]
	ldr	x0, [x19, w20, sxtw 3]
	str	wzr, [x0, 24]
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 16]
	ldr	x1, [x19, w20, sxtw 3]
	ldr	w0, [x1, 20]
	cbnz	w0, .L1537
	str	w21, [x1, 20]
	mov	x1, 0
	ldr	x0, .LC823
	ldr	x5, .LC824
	b	.L1540
	.p2align 3
.L1547:
	ldr	w4, [x2, 20]
	str	w4, [x3, x1, lsl 2]
	ldr	w2, [x2, 20]
	str	w2, [x5, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	beq	.L1546
.L1540:
	ldr	x2, [x19, x1, lsl 3]
	add	x3, x0, 3216
	cbnz	x2, .L1547
	add	x2, x0, 3216
	str	wzr, [x5, x1, lsl 2]
	str	wzr, [x2, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	bne	.L1540
	.p2align 2
.L1546:
	add	x0, x0, 3216
	bl	VDMDRV_SetPriority
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
.L1537:
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w20
	bl	VCTRL_OpenHardware
	ldr	x19, .LC825
	ldr	x0, .LC826
	mov	x2, 12
	mov	w1, 0
	ldr	x3, [x19, 96]
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 720
	ldr	x0, .LC827
	mov	w1, 0
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 2
	ldr	x0, .LC828
	mov	w1, 0
	blr	x3
	ldr	x0, .LC829
	mov	x2, 120
	ldr	x3, [x19, 96]
	mov	w1, 0
	blr	x3
	mov	w0, 0
.L1533:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1544:
	ldr	x2, .LC816
	mov	w3, 2486
	ldr	x4, .LC820
	mov	w0, 0
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1533
.L1542:
	ldr	x2, .LC816
	mov	w3, 2484
	ldr	x4, .LC815
	mov	w0, 0
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1533
.L1545:
	ldr	x2, .LC816
	mov	w3, 2487
	ldr	x4, .LC822
	mov	w0, 0
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1533
.L1543:
	ldr	x2, .LC816
	mov	w3, 2485
	ldr	x4, .LC819
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1533
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	3
.LC815:
	.xword	.LC198
	.align	3
.LC816:
	.xword	.LANCHOR4
	.align	3
.LC817:
	.xword	.LC6
	.align	3
.LC818:
	.xword	.LANCHOR1
	.align	3
.LC819:
	.xword	.LC297
	.align	3
.LC820:
	.xword	.LC497
	.align	3
.LC822:
	.xword	.LC821
	.align	3
.LC823:
	.xword	.LANCHOR5
	.align	3
.LC824:
	.xword	g_ChanCtx
	.align	3
.LC825:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC826:
	.xword	g_TimeRecId
	.align	3
.LC827:
	.xword	g_TimeRecTable
	.align	3
.LC828:
	.xword	g_DataRecId
	.align	3
.LC829:
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
	ldr	x1, .LC832
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	3
.LC832:
	.xword	.LC831
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
	ldr	x19, .LC833
	mov	w0, 0
	add	x23, x19, 256
	b	.L1558
	.p2align 3
.L1600:
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1597
.L1550:
	add	x19, x19, 8
	cmp	x19, x23
	beq	.L1598
.L1558:
	ldr	x20, [x19]
	cbz	x20, .L1550
	ldr	w21, [x20, 672]
	cbnz	w0, .L1551
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1599
.L1551:
	cmp	w22, wzr
	ccmp	w21, 1, 0, eq
	beq	.L1600
.L1554:
	cmp	w24, wzr
	ccmp	w21, 6, 0, eq
	bne	.L1550
	ldr	w1, [x20, 4]
	cmp	w1, 1
	bne	.L1550
	ldr	w26, [x20, 8]
.L1578:
	cmp	w26, 1
	add	x19, x19, 8
	csinc	w24, w24, wzr, ne
	cmp	x19, x23
	bne	.L1558
	.p2align 2
.L1598:
	cbnz	w0, .L1559
	ldr	x19, .LC834
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1564
	mov	w0, w25
	bl	SCDDRV_ResetSCD
	mov	w0, w25
	bl	VDMDRV_ResetVDH
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1564
	mov	w1, 0
	mov	w0, 1
	bl	VDH_UnNeed_Module
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1567
.L1606:
	ldr	x0, .LC835
	ldr	x1, [x0, 48]
	cbz	x1, .L1601
	mov	w0, 0
	blr	x1
.L1570:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle
.L1559:
	cbnz	w24, .L1571
	ldr	x0, .LC834
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1602
	mov	w1, 0
	mov	w0, 3
	bl	VDH_UnNeed_Module
.L1571:
	cbnz	w22, .L1549
	ldr	x0, .LC834
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1603
	ldr	x0, .LC835
	ldr	x1, [x0, 64]
	cbz	x1, .L1549
	mov	w0, 0
	blr	x1
.L1549:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1599:
	ldr	w26, [x20, 8]
	cmp	w26, 1
	beq	.L1604
.L1553:
	cmp	w21, 1
	ccmp	w22, wzr, 0, eq
	bne	.L1554
.L1577:
	cmp	w26, 1
	csinc	w22, w22, wzr, ne
	cmp	w21, 6
	ccmp	w24, wzr, 0, eq
	beq	.L1578
	b	.L1550
	.p2align 3
.L1604:
	cmp	w21, 4
	ccmp	w21, 7, 4, ne
	beq	.L1553
	mov	w0, w21
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	w0, wzr
	cset	w0, ne
	b	.L1553
.L1564:
	ldr	x0, .LC835
	ldr	x1, [x0, 16]
	cbz	x1, .L1605
	mov	w0, 0
	blr	x1
.L1566:
	mov	w0, 0
	bl	VDMDRV_SetStateIdle
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1606
.L1567:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_UnNeed_Module
	b	.L1559
.L1603:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_UnNeed_Module
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L1602:
	ldr	x0, .LC835
	ldr	x1, [x0, 32]
	cbz	x1, .L1607
	mov	w0, 0
	blr	x1
	b	.L1571
.L1601:
	ldr	x1, .LC836
	mov	w2, 8057
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1570
.L1605:
	ldr	x1, .LC836
	mov	w2, 8042
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1566
.L1607:
	ldr	x1, .LC836
	mov	w2, 8075
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1571
.L1597:
	ldr	w26, [x20, 8]
	b	.L1577
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	3
.LC833:
	.xword	.LANCHOR1
	.align	3
.LC834:
	.xword	g_HalDisable
	.align	3
.LC835:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC836:
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
	bhi	.L1614
	ldr	x20, .LC841
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1615
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1613
	str	w1, [x0, 24]
	mov	w0, w19
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 12]
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 8]
	bl	SM_Stop
	cbnz	w0, .L1613
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
.L1610:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1613:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1614:
	ldr	x2, .LC839
	mov	w3, 2571
	ldr	x4, .LC838
	mov	w0, 0
	ldr	x1, .LC840
	add	x2, x2, 1352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1610
.L1615:
	ldr	x2, .LC839
	mov	w3, 2572
	ldr	x4, .LC843
	ldr	x1, .LC840
	add	x2, x2, 1352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1610
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	3
.LC838:
	.xword	.LC198
	.align	3
.LC839:
	.xword	.LANCHOR4
	.align	3
.LC840:
	.xword	.LC6
	.align	3
.LC841:
	.xword	.LANCHOR1
	.align	3
.LC843:
	.xword	.LC842
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
	ldr	x19, .LC844
	b	.L1618
	.p2align 3
.L1622:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L1620
.L1618:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L1622
	cmp	w20, 49
	bgt	.L1620
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1620:
	ldr	x1, .LC846
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
.LC844:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC846:
	.xword	.LC845
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
	bhi	.L1649
	ldr	x20, .LC850
	sxtw	x21, w19
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1650
	ldr	w0, [x22]
	cmp	w0, 1
	bhi	.L1651
	mov	w0, w19
	ldr	w24, [x1, 8]
	bl	VCTRL_StopChan
	ldr	x23, .LC854
	ldr	x3, [x20, w19, sxtw 3]
	lsl	x1, x21, 6
	ldr	x0, .LC855
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
	add	x1, x0, 311296
	ldr	w0, [x0, 672]
	add	x1, x1, 1960
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
	beq	.L1652
.L1628:
	ldr	w0, [x0, 672]
	cmp	w0, 20
	beq	.L1629
	ldr	w0, [x22, 8]
	cbz	w0, .L1653
.L1629:
	mov	w0, w19
	bl	FSP_EmptyInstance
.L1630:
	mov	w0, w19
	bl	InitUsdPool
	ldr	w0, [x22]
	cbz	w0, .L1654
.L1631:
	ldr	w0, [x20, 1404]
	cbz	w0, .L1632
	add	x20, x20, 2200
	str	w19, [x29, 76]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1634
	mov	w0, 512
	add	x1, x29, 76
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1634
	add	x1, x29, 76
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1634:
	ldr	x1, .LC857
	mov	w0, 32
	bl	dprint_vfmw
.L1632:
	cbnz	w24, .L1655
.L1636:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1625:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1654:
	mov	w0, w19
	bl	SM_Reset
	b	.L1631
	.p2align 3
.L1655:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1636
	.p2align 3
.L1652:
	add	x1, x0, 311296
	str	wzr, [x0, 1672]
	str	wzr, [x1, 1884]
	b	.L1628
	.p2align 3
.L1653:
	mov	w0, w19
	bl	FSP_ResetInstance
	b	.L1630
	.p2align 3
.L1651:
	ldr	x1, .LC853
	mov	w2, 3151
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1625
	.p2align 3
.L1649:
	ldr	x2, .LC848
	mov	w3, 3146
	ldr	x4, .LC847
	mov	w0, 0
	ldr	x1, .LC849
	add	x2, x2, 1368
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1625
.L1650:
	ldr	x2, .LC848
	mov	w3, 3147
	ldr	x4, .LC851
	mov	w0, 0
	ldr	x1, .LC849
	add	x2, x2, 1368
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1625
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	3
.LC847:
	.xword	.LC385
	.align	3
.LC848:
	.xword	.LANCHOR4
	.align	3
.LC849:
	.xword	.LC6
	.align	3
.LC850:
	.xword	.LANCHOR1
	.align	3
.LC851:
	.xword	.LC390
	.align	3
.LC853:
	.xword	.LC852
	.align	3
.LC854:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC855:
	.xword	.LANCHOR5
	.align	3
.LC857:
	.xword	.LC856
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
	bhi	.L1678
	ldr	x20, .LC863
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1679
	mov	w0, w19
	ldr	w22, [x1, 8]
	bl	VCTRL_StopChan
	ldr	x21, .LC865
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, 4
	ldr	x2, [x21, 24]
	str	wzr, [x1, 520]
	str	wzr, [x1, 524]
	blr	x2
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 1616]
	cmp	w1, 1
	beq	.L1680
.L1660:
	sxtw	x1, w19
	ldr	x3, .LC866
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
	add	x1, x0, 311296
	str	x2, [x0, 744]
	str	x2, [x0, 752]
	str	wzr, [x0, 1280]
	str	wzr, [x1, 1904]
	str	wzr, [x1, 1908]
	str	wzr, [x1, 1912]
	str	wzr, [x0, 1708]
	ldr	w2, [x0, 1616]
	cmp	w2, 1
	beq	.L1681
.L1661:
	ldr	w0, [x0, 672]
	cmp	w0, 20
	mov	w0, w19
	beq	.L1662
	bl	FSP_ResetInstance
.L1663:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	InitUsdPool
	mov	w0, w19
	bl	SM_Reset
	ldr	w0, [x20, 1404]
	cbz	w0, .L1664
	add	x20, x20, 2200
	str	w19, [x29, 60]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1666
	mov	w0, 512
	add	x1, x29, 60
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1666
	add	x1, x29, 60
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1666:
	ldr	x1, .LC867
	mov	w0, 32
	bl	dprint_vfmw
.L1664:
	cbnz	w22, .L1682
.L1668:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1658:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1682:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1668
	.p2align 3
.L1662:
	bl	FSP_EmptyInstance
	b	.L1663
	.p2align 3
.L1681:
	str	wzr, [x0, 1672]
	str	wzr, [x1, 1884]
	b	.L1661
	.p2align 3
.L1680:
	add	x1, x0, 311296
	ldr	w2, [x0, 672]
	ldr	w1, [x1, 1952]
	cmp	w1, w2
	bne	.L1660
	str	wzr, [x0, 12]
	mov	w0, w19
	bl	VCTRL_FindOccupiedFrame
	b	.L1660
	.p2align 3
.L1678:
	ldr	x2, .LC861
	mov	w3, 3489
	ldr	x4, .LC860
	mov	w0, 0
	ldr	x1, .LC862
	add	x2, x2, 1400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1658
.L1679:
	ldr	x2, .LC861
	mov	w3, 3490
	ldr	x4, .LC864
	mov	w0, 0
	ldr	x1, .LC862
	add	x2, x2, 1400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1658
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	3
.LC860:
	.xword	.LC385
	.align	3
.LC861:
	.xword	.LANCHOR4
	.align	3
.LC862:
	.xword	.LC6
	.align	3
.LC863:
	.xword	.LANCHOR1
	.align	3
.LC864:
	.xword	.LC390
	.align	3
.LC865:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC866:
	.xword	.LANCHOR5
	.align	3
.LC867:
	.xword	.LC856
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
	ldr	x22, .LC870
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
	cbz	x27, .L1821
	ldr	w0, [x27, 36]
	tbnz	w0, #31, .L1686
	ldr	w0, [x27, 12]
	cmp	w0, 31
	ble	.L1686
	ldr	w0, [x27, 16]
	cmp	w0, 31
	ble	.L1686
	ldr	w1, [x27, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L1686
	ldr	w0, [x27, 44]
	cmp	w0, 1
	beq	.L1822
	cmp	w0, 2
	bne	.L1688
	ldr	w0, [x27, 20]
	cmp	w0, wzr
	ble	.L1686
	ldr	w0, [x27, 24]
	cmp	w0, wzr
	ble	.L1686
.L1813:
	ldr	w0, [x27, 28]
	cmp	w0, wzr
	ble	.L1686
	ldr	w0, [x27, 32]
	cmp	w0, wzr
	bgt	.L1688
.L1686:
	ldr	x1, .LC873
	mov	w0, 0
	bl	dprint_vfmw
.L1685:
	mov	w0, -1
.L1843:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L1688:
	ldr	w0, [x27, 216]
	cmp	w0, 1
	bls	.L1690
	str	wzr, [x27, 216]
.L1690:
	mov	w3, w19
	mov	w0, 32024
	mov	w19, 18200
	movk	w0, 0xc, lsl 16
	cmp	w20, 26
	movk	w19, 0xb2, lsl 16
	mov	w21, 1
	csel	w19, w19, w0, eq
	add	x2, x29, 128
	mov	x1, x27
	mov	w0, w20
	stp	w21, w21, [x27, 240]
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L1823
	ldr	x25, .LC876
	ldr	x0, [x25]
	cbz	x0, .L1824
	add	x0, x25, 8
	b	.L1695
	.p2align 3
.L1826:
	add	w21, w21, 1
	cmp	w21, 32
	beq	.L1825
.L1695:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbnz	x1, .L1826
.L1694:
	ldr	w0, [x27, 252]
	cmp	w0, 1
	beq	.L1756
.L1697:
	cmp	w21, 31
	bhi	.L1749
	mov	x1, x25
	add	x3, x25, 256
	mov	w0, 0
	.p2align 2
.L1699:
	ldr	x2, [x1], 8
	cmp	x2, xzr
	csinc	w0, w0, w0, eq
	cmp	x3, x1
	bne	.L1699
	cbz	w0, .L1827
	mov	w26, 0
	add	x23, x29, 168
.L1700:
	ldr	x3, [x22, 96]
	add	x24, x27, 72
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 56]
	cbz	x0, .L1710
	ldr	w0, [x24, 64]
	cbnz	w0, .L1711
.L1710:
	mov	w1, 3
	mov	w0, 7
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 136]
	mov	w4, 1
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1828
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
.L1714:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 8]
	cbz	x0, .L1751
	ldr	w0, [x24, 16]
	cbnz	w0, .L1716
.L1751:
	ldr	w0, [x27, 216]
	cmp	w0, 1
	beq	.L1717
	mov	w1, 3
	mov	w0, 8
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1829
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
.L1721:
	ldr	w0, [x29, 132]
	cbnz	w0, .L1812
.L1731:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	w0, [x29, 140]
	cmp	w0, wzr
	ble	.L1739
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 11
	bl	VFMW_GetString
	ldr	w2, [x29, 140]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1830
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
.L1739:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	w0, [x27, 192]
	cbz	w0, .L1740
	ldr	w1, [x27, 208]
	cbz	w1, .L1740
	str	w1, [x29, 192]
	ldr	w1, [x27, 248]
	str	w0, [x29, 184]
	cmp	w1, 1
	beq	.L1831
	ldr	x1, [x22, 352]
	mov	x0, x23
	str	wzr, [x29, 196]
	blr	x1
	mov	x1, x0
	str	x0, [x29, 176]
.L1742:
	ldr	w2, [x29, 192]
	ldr	w0, [x29, 184]
	bl	MEM_AddMemRecord
	ldr	w1, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x0, [x29, 176]
	str	w1, [x29, 392]
	str	x0, [x29, 400]
	str	w2, [x29, 408]
.L1740:
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
	ldr	x3, .LC912
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
	add	x2, x0, 311296
	str	w1, [x0, 672]
	str	w1, [x2, 1952]
	str	wzr, [x0, 28]
	ldr	x0, [x25, w21, sxtw 3]
	ldr	w2, [x27, 248]
	add	x1, x0, 311296
	str	w2, [x1, 1928]
	lsl	x1, x26, 4
	mov	w2, 30
	str	w2, [x0, 1712]
	add	x2, x0, 1720
	str	x2, [x3, x1]
	add	x1, x0, 278528
	add	x1, x1, 2192
	ldr	w0, [x27, 240]
	str	w0, [x2, 76]
	ldr	w0, [x27, 244]
	str	w0, [x2, 80]
	mov	w0, w21
	bl	FSP_EnableInstance
	cbnz	w0, .L1832
	mov	w0, w21
	mov	w20, 0
	mov	w24, 255
	bl	VCTRL_ResetChan
	ldr	x0, [x25, w21, sxtw 3]
	ldp	w3, w2, [x29, 112]
	add	x1, x0, 307200
	ldr	w4, [x29, 120]
	add	x7, x1, 1792
	str	w3, [x0, 432]
	str	w2, [x0, 436]
	str	w4, [x0, 440]
	add	x0, x0, 311296
	stp	wzr, wzr, [x7, 44]
	stp	wzr, wzr, [x7, 52]
	str	wzr, [x1, 1852]
	str	wzr, [x1, 1856]
	ldr	w1, [x27, 216]
	str	w1, [x0, 1892]
	str	wzr, [x0, 1884]
	ldr	w1, [x27, 252]
	str	w1, [x0, 1944]
	str	wzr, [x0, 1948]
	.p2align 2
.L1745:
	uxtw	x1, w20
	ldr	x0, [x25, x26, lsl 3]
	lsl	x19, x1, 6
	ldr	x4, [x22, 96]
	add	x19, x19, x1, lsl 3
	mov	x2, 72
	add	x3, x19, 307200
	mov	w1, 0
	add	x0, x0, x3
	add	w20, w20, 1
	add	x0, x0, 1864
	blr	x4
	ldr	x0, [x25, x26, lsl 3]
	cmp	w20, 32
	add	x1, x0, x19
	add	x1, x1, 307200
	str	w24, [x1, 1864]
	str	w24, [x1, 1868]
	str	w24, [x1, 1872]
	bne	.L1745
	ldr	x3, [x22, 96]
	add	x0, x0, 311296
	mov	x2, 1248
	mov	w1, 0
	add	x0, x0, 72
	blr	x3
	ldr	x0, [x25, x26, lsl 3]
	mov	x2, 24
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 311296
	add	x0, x0, 1320
	blr	x3
	ldr	x1, .LC917
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
	add	x1, x0, 278528
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
	str	wzr, [x1, 2224]
	add	w1, w3, 15
	str	w21, [x0]
	and	w1, w1, -16
	stp	wzr, wzr, [x6, 192]
	stp	w2, w5, [x6, 200]
	str	w3, [x0, 464]
	ldr	x2, [x25, x26, lsl 3]
	str	w4, [x0, 468]
	mov	w4, 14848
	add	x3, x2, 278528
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
	add	x19, x19, 311296
	blr	x0
	ldr	x1, [x22, 32]
	str	w0, [x19, 1900]
	mov	w0, 0
	blr	x1
	mov	w0, w21
.L1804:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L1827:
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
	ldr	x28, .LC881
	ldr	x0, [x28, 96]
	cbz	x0, .L1701
	blr	x0
	cmp	w0, wzr
	mov	w23, w0
	ble	.L1701
	mov	w2, w0
	mov	w4, 0
	add	x3, x25, 288
	mov	w1, 0
	add	x0, x29, 144
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1702
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
	cbz	x1, .L1703
	mov	x0, x23
	blr	x1
	cbnz	w0, .L1703
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
	mov	w2, 16384
	mov	w1, 0
	add	x0, x29, 144
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1704
	ldr	w2, [x24, 120]
	ldr	x1, [x24, 104]
	ldr	w0, [x24, 112]
	bl	MEM_AddMemRecord
	ldr	x28, [x22, 136]
	ldr	x1, .LC882
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
	mov	w2, 61440
	add	x0, x29, 144
	movk	w2, 0xa, lsl 16
	mov	w4, 0
	add	x3, x25, 320
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1833
	ldr	w2, [x24, 88]
	mov	w26, 1
	ldr	x1, [x24, 72]
	ldr	w0, [x24, 80]
	bl	MEM_AddMemRecord
	ldr	w0, [x24, 80]
	mov	w2, 0
	ldr	w1, [x24, 88]
	bl	SM_OpenSCDDrv
	cbz	w0, .L1700
	ldr	x24, .LC883
	mov	w3, 0
	ldr	x1, .LC895
	mov	w0, 0
	add	x2, x24, 1416
	bl	dprint_vfmw
	b	.L1707
	.p2align 3
.L1825:
	ldr	w0, [x27, 252]
	cmp	w0, 1
	bne	.L1749
.L1756:
	add	x1, x29, 108
	mov	w0, 1
	bl	PDT_GetAttribute
	ldr	w0, [x29, 108]
	cmp	w0, 1
	ccmp	w21, 15, 4, ne
	ble	.L1697
	ldr	x1, .LC878
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1804
	.p2align 3
.L1812:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 32]
	cbz	x0, .L1725
	ldr	w0, [x24, 24]
	cbz	w0, .L1725
	ldr	w0, [x24, 40]
	cbz	w0, .L1725
	ldr	w1, [x29, 132]
	cmp	w0, w1
	bge	.L1834
	ldr	w0, [x29, 296]
	.p2align 2
.L1728:
	cbz	w0, .L1730
	ldr	x0, [x29, 304]
	cbz	x0, .L1730
	ldr	w0, [x29, 132]
	ldr	w1, [x29, 312]
	cmp	w1, w0
	bge	.L1731
.L1730:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1835
.L1732:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1836
.L1733:
	ldr	x24, .LC883
	mov	w0, 1
	ldr	x1, .LC909
	add	x2, x24, 1464
	bl	dprint_vfmw
	b	.L1734
.L1725:
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 9
	bl	VFMW_GetString
	ldr	w2, [x29, 132]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1727
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
	b	.L1728
.L1717:
	str	wzr, [x29, 112]
	str	wzr, [x29, 272]
	str	xzr, [x29, 280]
	str	wzr, [x29, 288]
	b	.L1721
.L1822:
	ldr	w0, [x27, 20]
	cmp	w0, wzr
	bgt	.L1813
	b	.L1686
	.p2align 3
.L1727:
	ldr	x24, .LC883
	mov	w3, 1691
	ldr	x1, .LC907
	mov	w0, 1
	ldr	w4, [x29, 132]
	add	x2, x24, 1464
	bl	dprint_vfmw
	ldr	w0, [x29, 296]
	b	.L1728
.L1711:
	ldr	x3, [x22, 104]
	mov	x2, 24
	add	x1, x27, 120
	add	x0, x29, 320
	blr	x3
	ldr	w0, [x29, 136]
	ldr	w2, [x29, 336]
	cmp	w2, w0
	blt	.L1837
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_AddMemRecord
	b	.L1714
.L1701:
	ldr	x24, .LC883
	mov	w3, 0
	ldr	x1, .LC885
	mov	w0, 0
	add	x2, x24, 1416
	bl	dprint_vfmw
.L1707:
	bl	VCTRL_ReleaseHalMem
	ldr	x1, .LC897
	add	x2, x24, 1440
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1804
.L1716:
	ldr	x3, [x22, 104]
	mov	x2, 24
	mov	x1, x24
	add	x0, x29, 272
	blr	x3
	ldr	w0, [x27, 216]
	ldr	w2, [x29, 288]
	cmp	w0, 1
	beq	.L1723
	ldr	w4, [x29, 128]
	cmp	w2, w4
	blt	.L1838
.L1723:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_AddMemRecord
	b	.L1721
.L1831:
	ldr	x1, [x22, 320]
	mov	w2, 3
	mov	x0, x23
	str	w2, [x29, 196]
	blr	x1
	mov	x1, x0
	str	x0, [x29, 176]
	b	.L1742
.L1830:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1839
.L1736:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1840
.L1737:
	ldr	w0, [x29, 116]
	cmp	w0, 1
	beq	.L1841
.L1738:
	ldr	x1, .LC911
	mov	w2, 2079
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
.L1734:
	ldr	x1, .LC914
	add	x2, x24, 1440
	mov	w0, 1
	bl	dprint_vfmw
	cbz	w26, .L1685
	bl	VCTRL_ReleaseHalMem
	mov	w0, -1
	b	.L1804
.L1834:
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
	b	.L1728
.L1841:
	ldr	w0, [x29, 296]
	ldr	x1, [x29, 304]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 296]
	ldr	w2, [x29, 312]
	ldr	x1, [x29, 304]
	bl	MEM_DelMemRecord
	b	.L1738
.L1840:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 272]
	ldr	w2, [x29, 288]
	ldr	x1, [x29, 280]
	bl	MEM_DelMemRecord
	b	.L1737
.L1839:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1736
.L1824:
	mov	w21, 0
	b	.L1694
.L1829:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1842
.L1719:
	ldr	x1, .LC903
	mov	w2, 1750
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1734
.L1828:
	ldr	x1, .LC899
	mov	w2, 1961
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1734
.L1832:
	ldr	x1, .LC916
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
	add	x3, x1, 311296
	add	x2, x1, 307200
	ldr	w6, [x1, 436]
	add	x2, x2, 1864
	ldr	w4, [x1, 432]
	ldr	w5, [x1, 440]
	stp	w4, w6, [x29, 252]
	ldr	w19, [x3, 1928]
	ldr	w4, [x3, 1892]
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
	b	.L1804
.L1703:
	ldr	x1, .LC889
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1707
.L1749:
	ldr	x1, .LC880
	mov	w2, 32
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1804
.L1823:
	ldr	x1, .LC875
	mov	w2, 2167
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1804
.L1833:
	ldr	x24, .LC883
	mov	w4, 61440
	ldr	x1, .LC893
	movk	w4, 0xa, lsl 16
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1707
.L1702:
	ldr	x24, .LC883
	mov	w4, w23
	ldr	x1, .LC887
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1707
.L1704:
	ldr	x24, .LC883
	mov	w4, 16384
	ldr	x1, .LC891
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1707
.L1842:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1719
.L1837:
	ldr	x1, .LC901
	mov	w2, 1977
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1734
.L1836:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 272]
	ldr	w2, [x29, 288]
	ldr	x1, [x29, 280]
	bl	MEM_DelMemRecord
	b	.L1733
.L1835:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1732
.L1821:
	ldr	x1, .LC872
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1843
.L1838:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1844
.L1724:
	ldr	x1, .LC905
	mov	w3, w2
	mov	w0, 1
	mov	w2, 1781
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1734
.L1844:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w2, [x29, 336]
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	ldr	w4, [x29, 128]
	ldr	w2, [x29, 288]
	b	.L1724
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	3
.LC870:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC872:
	.xword	.LC871
	.align	3
.LC873:
	.xword	.LC543
	.align	3
.LC875:
	.xword	.LC874
	.align	3
.LC876:
	.xword	.LANCHOR1
	.align	3
.LC878:
	.xword	.LC877
	.align	3
.LC880:
	.xword	.LC879
	.align	3
.LC881:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC882:
	.xword	g_HwMem
	.align	3
.LC883:
	.xword	.LANCHOR4
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
.LC911:
	.xword	.LC910
	.align	3
.LC912:
	.xword	s_SmIIS
	.align	3
.LC914:
	.xword	.LC913
	.align	3
.LC916:
	.xword	.LC915
	.align	3
.LC917:
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
	mov	w20, w0
	mov	x23, x1
	mov	x0, x30
	bl	_mcount
	cbz	x23, .L1890
	cmp	w20, 31
	bhi	.L1891
	ldr	x22, .LC925
	ldr	x0, [x22, w20, sxtw 3]
	cbz	x0, .L1892
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L1893
	mov	x1, x23
	mov	w0, w20
	bl	VCTRL_CheckChanWH
	mov	w21, w0
	cbnz	w0, .L1894
	ldr	x19, .LC930
	add	x24, x19, 3472
	mov	x1, x24
	bl	PDT_GetAttribute
	ldr	w0, [x19, 3492]
	ldr	w2, [x23, 8]
	cmp	w0, 21
	bhi	.L1853
	cmp	w0, w2
	beq	.L1854
	add	x0, x19, 3496
	add	x3, x19, 3620
	.p2align 2
.L1856:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 21
	bhi	.L1853
	cmp	w1, w2
	beq	.L1854
	cmp	x3, x0
	bne	.L1856
.L1854:
	cmp	w2, 8
	str	wzr, [x29, 96]
	beq	.L1895
.L1857:
	cmp	w2, 9
	beq	.L1896
	cmp	w2, 5
	str	wzr, [x29, 96]
	beq	.L1897
.L1877:
	mov	x1, x23
	mov	w0, w20
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1898
	ldr	x24, .LC935
	mov	x2, 148
	ldr	x0, [x22, w20, sxtw 3]
	mov	x1, x23
	ldr	x3, [x24, 104]
	add	x0, x0, 44
	blr	x3
	ldr	x0, [x22, w20, sxtw 3]
	mov	x2, 80
	ldr	w1, [x23, 24]
	str	w1, [x0, 20]
	ldr	x0, [x22, w20, sxtw 3]
	ldr	w1, [x23, 8]
	ldr	x3, [x24, 96]
	str	w1, [x0, 672]
	ldr	w1, [x23, 100]
	str	w1, [x0, 1624]
	mov	w1, 0
	add	x0, x29, 96
	blr	x3
	ldr	x1, [x22, w20, sxtw 3]
	ldr	w2, [x1, 456]
	cbnz	w2, .L1899
.L1864:
	ldr	w2, [x23, 24]
	add	x1, x1, 311296
	ldr	w0, [x23, 84]
	strb	w2, [x29, 104]
	ldr	w2, [x23, 8]
	cmp	w0, 1
	str	w2, [x29, 108]
	mov	w2, 49152
	movk	w2, 0xf8c3, lsl 16
	str	w2, [x29, 120]
	beq	.L1900
	str	wzr, [x1, 1940]
.L1866:
	ldr	w0, [x23, 88]
	cbnz	w0, .L1901
.L1867:
	ldr	w0, [x23, 80]
	add	x26, x23, 12
	ldr	x3, [x24, 104]
	mov	x2, 12
	mov	x1, x26
	str	w0, [x29, 144]
	stp	wzr, wzr, [x29, 136]
	add	x0, x29, 124
	blr	x3
	add	x1, x29, 96
	mov	w0, w20
	bl	SM_Config
	ldr	x3, [x24, 96]
	mov	x2, 1
	mov	w1, 0
	add	x0, x29, 88
	blr	x3
	ldr	w2, [x23, 84]
	cmp	w2, 1
	beq	.L1902
.L1868:
	ldr	x0, [x22, w20, sxtw 3]
	ldr	x1, .LC936
	ldr	w2, [x0, 352]
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
	ldr	w1, [x1, 72]
	ldr	w2, [x23, 28]
	str	w2, [x0, 684]
	cmp	w1, 7
	ldr	w2, [x23, 28]
	str	w2, [x0, 680]
	ldr	w2, [x23, 36]
	str	w2, [x0, 688]
	beq	.L1903
.L1869:
	str	w1, [x0, 704]
	mov	w25, 1
	ldr	w1, [x23, 44]
	str	w1, [x0, 692]
	ldr	w1, [x23, 132]
	str	w1, [x0, 1364]
	ldr	w1, [x23, 140]
	str	w1, [x0, 1700]
	str	w25, [x0, 1368]
	str	w25, [x0, 1372]
	ldr	w1, [x23, 72]
	cmp	w1, w25
	cset	w1, eq
	str	w1, [x0, 1348]
	ldr	w1, [x23, 76]
	str	w1, [x0, 1352]
	ldr	w1, [x23, 48]
	str	w1, [x0, 1356]
	ldr	w1, [x29, 140]
	str	w1, [x0, 1360]
	str	wzr, [x0, 1672]
	str	wzr, [x0, 1692]
	str	wzr, [x0, 1708]
	add	x0, x0, 311296
	ldrsb	w1, [x23, 1]
	strb	w1, [x0, 1888]
	mov	x1, x23
	mov	w0, w20
	bl	VCTRL_ConfigChanCompress
	ldr	x0, [x22, w20, sxtw 3]
	mov	x2, 12
	ldr	x3, [x24, 104]
	mov	x1, x26
	add	x0, x0, 1284
	blr	x3
	ldr	x0, [x22, w20, sxtw 3]
	add	x1, x0, 311296
	ldr	w2, [x0, 672]
	ldr	w0, [x1, 1952]
	cmp	w0, w2
	beq	.L1870
	mov	w0, w20
	bl	VCTRL_ResetChan
	ldr	w1, [x23, 8]
	ldr	x0, [x22, w20, sxtw 3]
	cmp	w1, 20
	beq	.L1871
	ldr	w2, [x0, 672]
	add	x1, x0, 311296
.L1870:
	ldr	x4, .LC939
	mov	x0, 0
	str	w2, [x1, 1952]
	b	.L1875
	.p2align 3
.L1905:
	ldr	w3, [x1, 20]
	str	w3, [x2, x0, lsl 2]
	ldr	w1, [x1, 20]
	str	w1, [x4, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1904
.L1875:
	ldr	x1, [x22, x0, lsl 3]
	add	x2, x19, 3624
	cbnz	x1, .L1905
	add	x1, x19, 3624
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1875
.L1904:
	add	x0, x19, 3624
	bl	VDMDRV_SetPriority
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1898:
	ldr	x1, .LC934
	mov	w21, 0
	bl	dprint_vfmw
.L1889:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1853:
	ldr	x1, .LC932
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1901:
	mov	w0, 1
	str	w0, [x29, 152]
	b	.L1867
	.p2align 3
.L1899:
	ldr	w0, [x1, 460]
	cmp	w0, 15
	ble	.L1864
	mov	w0, w2
	str	w2, [x29, 112]
	bl	MEM_Phy2Vir
	str	x0, [x29, 96]
	ldr	x1, [x22, w20, sxtw 3]
	ldr	w0, [x1, 460]
	sub	w0, w0, #16
	str	w0, [x29, 116]
	b	.L1864
	.p2align 3
.L1896:
	add	x0, x29, 96
	bl	REAL9DEC_Support
	ldr	w0, [x29, 96]
	cbz	w0, .L1858
	ldr	w2, [x23, 8]
	str	wzr, [x29, 96]
	cmp	w2, 5
	bne	.L1877
	b	.L1897
.L1895:
	add	x0, x29, 96
	bl	REAL8DEC_Support
	ldr	w0, [x29, 96]
	cbz	w0, .L1858
	ldr	w2, [x23, 8]
	b	.L1857
.L1897:
	add	x0, x29, 96
	bl	DIVX3DEC_Support
	ldr	w0, [x29, 96]
	cbnz	w0, .L1877
.L1858:
	mov	w21, -1
	b	.L1889
.L1893:
	ldr	x2, .LC922
	mov	w3, 2792
	ldr	x4, .LC927
	mov	w0, 0
	ldr	x1, .LC923
	add	x2, x2, 1488
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1889
.L1900:
	ldr	w2, [x23, 92]
	str	w2, [x29, 156]
	ldr	w2, [x23, 96]
	str	w0, [x29, 148]
	str	w2, [x29, 160]
	ldr	w0, [x23, 136]
	str	w0, [x1, 1940]
	b	.L1866
.L1903:
	ldr	w1, [x23, 40]
	b	.L1869
.L1902:
	add	x1, x29, 88
	mov	w0, w20
	strb	w2, [x29, 88]
	bl	FSP_ConfigAttribute
	b	.L1868
.L1894:
	ldr	x1, .LC929
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1889
.L1871:
	ldr	w3, [x0, 472]
	ldr	w4, [x0, 476]
	ldr	w1, [x0, 1412]
	ldr	w2, [x0, 1416]
	mov	w0, w20
	bl	VCTRL_PartitionMemForStdUser
	cbnz	w0, .L1872
	ldr	x0, [x22, w20, sxtw 3]
	add	x1, x0, 311296
	ldr	w2, [x0, 672]
	b	.L1870
.L1891:
	ldr	x2, .LC922
	mov	w3, 2790
	ldr	x4, .LC924
	mov	w0, 0
	ldr	x1, .LC923
	add	x2, x2, 1488
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1889
.L1892:
	ldr	x2, .LC922
	mov	w3, 2791
	ldr	x4, .LC926
	mov	w21, -1
	ldr	x1, .LC923
	add	x2, x2, 1488
	bl	dprint_vfmw
	b	.L1889
.L1890:
	ldr	x2, .LC922
	mov	w3, 2789
	ldr	x4, .LC921
	mov	w0, 0
	ldr	x1, .LC923
	add	x2, x2, 1488
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1889
.L1872:
	ldr	x1, .LC938
	mov	w0, w25
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1889
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	3
.LC921:
	.xword	.LC920
	.align	3
.LC922:
	.xword	.LANCHOR4
	.align	3
.LC923:
	.xword	.LC6
	.align	3
.LC924:
	.xword	.LC385
	.align	3
.LC925:
	.xword	.LANCHOR1
	.align	3
.LC926:
	.xword	.LC390
	.align	3
.LC927:
	.xword	.LC255
	.align	3
.LC929:
	.xword	.LC928
	.align	3
.LC930:
	.xword	.LANCHOR5
	.align	3
.LC932:
	.xword	.LC931
	.align	3
.LC934:
	.xword	.LC933
	.align	3
.LC935:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC936:
	.xword	.LANCHOR2
	.align	3
.LC938:
	.xword	.LC937
	.align	3
.LC939:
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
	ldr	x1, .LC944
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC945
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1909
	ldr	x1, .LC947
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1909:
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 172]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	3
.LC944:
	.xword	.LC943
	.align	3
.LC945:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC947:
	.xword	.LC946
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
	ldr	x1, .LC949
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC950
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1910
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 72]
	bl	VCTRL_ConfigChan
.L1910:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDropStreamThread, .-VfmwProc_SetDropStreamThread
	.align	3
.LC949:
	.xword	.LC948
	.align	3
.LC950:
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
	ldr	x1, .LC952
	lsr	w20, w3, 24
	and	w19, w3, 7
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC953
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1915
	ldr	x1, .LC955
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1915:
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 76]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	3
.LC952:
	.xword	.LC951
	.align	3
.LC953:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC955:
	.xword	.LC954
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
	ldr	x1, .LC957
	lsr	w20, w3, 24
	and	w19, w3, 3
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC958
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1916
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 80]
	bl	VCTRL_ConfigChan
.L1916:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	3
.LC957:
	.xword	.LC956
	.align	3
.LC958:
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
	ldr	x1, .LC960
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC961
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1918
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 68]
	bl	VCTRL_ConfigChan
.L1918:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetErrorThread, .-VfmwProc_SetErrorThread
	.align	3
.LC960:
	.xword	.LC959
	.align	3
.LC961:
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
	ldr	x1, .LC963
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	3
.LC963:
	.xword	.LC962
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
	ldr	x21, .LC964
	mov	w0, 0
	ldr	x1, [x21, 24]
	blr	x1
	cmp	w20, 31
	bhi	.L1938
	ldr	x19, .LC969
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1939
	ldr	w22, [x0, 4]
	cmp	w22, 1
	bne	.L1940
	str	wzr, [x0, 8]
	mov	w0, 0
	ldr	x1, [x21, 32]
	blr	x1
	mov	w0, w20
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1941
.L1926:
	ldr	x1, [x21, 24]
	mov	w0, 0
	sxtw	x22, w20
	blr	x1
	ldr	x2, .LC974
	mov	w0, 4
	ldr	x1, [x21, 24]
	str	wzr, [x2, w20, sxtw 2]
	blr	x1
	mov	w0, w20
	bl	VCTRL_StopChan
	ldr	x1, [x21, 32]
	cbnz	w0, .L1942
	mov	w0, 4
	lsl	x22, x22, 4
	blr	x1
	mov	w0, w20
	bl	VCTRL_ResetChan
	bl	VDMDRV_ParamInit
	ldr	x1, .LC975
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
	ldr	x4, .LC976
	add	x3, x1, 311296
	add	x2, x1, 307200
	ldr	w5, [x1, 440]
	add	x2, x2, 1864
	str	w5, [x29, 132]
	ldr	w5, [x1, 432]
	str	w5, [x29, 124]
	ldr	w5, [x1, 436]
	ldr	w23, [x3, 1928]
	str	x2, [x29, 96]
	add	x2, x1, 400
	str	w5, [x29, 128]
	ldr	w5, [x3, 1892]
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
.L1929:
	ldr	x2, [x0], 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x0, x3
	bne	.L1929
	mov	w19, 0
	cbnz	w1, .L1923
	bl	VCTRL_ReleaseHalMem
.L1923:
	mov	w0, w19
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 144
	ret
.L1941:
	mov	w0, w20
	ldr	x23, [x21, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w22
	blr	x23
	b	.L1926
.L1940:
	ldr	x2, .LC966
	mov	w3, 2391
	ldr	x4, .LC973
	mov	w0, 0
	ldr	x1, .LC968
	add	x2, x2, 1512
.L1937:
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
.L1942:
	mov	w0, 4
	mov	w19, -1
	blr	x1
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	b	.L1923
.L1938:
	ldr	x2, .LC966
	mov	w3, 2377
	ldr	x4, .LC965
	mov	w0, 0
	ldr	x1, .LC968
	add	x2, x2, 1512
	b	.L1937
.L1939:
	ldr	x2, .LC966
	mov	w3, 2384
	ldr	x4, .LC971
	ldr	x1, .LC968
	add	x2, x2, 1512
	b	.L1937
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC964:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC965:
	.xword	.LC198
	.align	3
.LC966:
	.xword	.LANCHOR4
	.align	3
.LC968:
	.xword	.LC967
	.align	3
.LC969:
	.xword	.LANCHOR1
	.align	3
.LC971:
	.xword	.LC970
	.align	3
.LC973:
	.xword	.LC972
	.align	3
.LC974:
	.xword	g_LowDelaySeqIndex
	.align	3
.LC975:
	.xword	.LANCHOR5
	.align	3
.LC976:
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
	ldr	x20, .LC980
	ldr	w0, [x20, 256]
	cmp	w0, 1
	bne	.L1950
	mov	x19, 0
	.p2align 2
.L1946:
	ldr	x1, [x20, x19, lsl 3]
	mov	w0, w19
	add	x19, x19, 1
	cbz	x1, .L1945
	bl	VCTRL_DestroyChan
.L1945:
	cmp	x19, 32
	bne	.L1946
	bl	FSP_Exit
	ldr	x21, .LC981
	ldr	w1, [x20, 260]
	mov	w2, 3
	str	w2, [x20, 264]
	cbz	w1, .L1948
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L1949
	.p2align 3
.L1960:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1948
.L1949:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cbnz	w1, .L1960
.L1948:
	ldr	x0, .LC982
	mov	x2, 128
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 400
	blr	x3
	add	x0, x20, 288
	bl	CloseDrivers
	str	wzr, [x20, 256]
	mov	w0, 0
.L1959:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1950:
	mov	w0, -1
	b	.L1959
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC980:
	.xword	.LANCHOR1
	.align	3
.LC981:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC982:
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
	ldr	x1, .LC985
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w3, w0
	ldr	x1, .LC986
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w3, w0
	ldr	x1, .LC987
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	3
.LC985:
	.xword	.LC984
	.align	3
.LC986:
	.xword	.LC962
	.align	3
.LC987:
	.xword	.LC831
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
	ldr	x1, .LC988
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	3
.LC988:
	.xword	.LC984
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
	beq	.L1973
	mov	w19, 2
	cmp	w20, wzr
	csel	w19, w19, wzr, eq
.L1964:
	ldr	x0, .LC989
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1975
	mov	w1, w19
	mov	w0, 0
	bl	VDH_Require_DspCode
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1975:
	ldr	x20, .LC990
	ldr	x1, [x20, 8]
	cbz	x1, .L1976
	mov	w0, 0
	blr	x1
.L1967:
	ldr	x1, [x20, 40]
	cbz	x1, .L1977
	mov	w0, 0
	blr	x1
.L1969:
	ldr	x1, [x20, 24]
	cbz	x1, .L1978
	mov	w0, 0
	blr	x1
.L1971:
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
.L1973:
	mov	w19, 1
	b	.L1964
	.p2align 3
.L1976:
	ldr	x1, .LC991
	mov	w2, 3055
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1967
	.p2align 3
.L1977:
	ldr	x1, .LC991
	mov	w2, 3056
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1969
	.p2align 3
.L1978:
	ldr	x1, .LC991
	mov	w2, 3057
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1971
	.size	VCTRL_InitDspCode, .-VCTRL_InitDspCode
	.align	3
.LC989:
	.xword	g_HalDisable
	.align	3
.LC990:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC991:
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
	ldr	x0, .LC992
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cbnz	w1, .L1991
	ldr	w21, [x0, 1356]
	mov	w0, 0
	cmp	w21, wzr
	cset	w3, eq
	cmp	w1, 6
	cset	w2, ne
	tst	w3, w2
	beq	.L2010
.L1997:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1991:
	cmp	w1, 6
	mov	w3, 1
	cset	w2, ne
	mov	w21, 0
	tst	w3, w2
	mov	w0, 0
	bne	.L1997
.L2010:
	ldr	x20, .LC993
	add	x0, x20, 404
	add	x3, x20, 528
	ldr	w2, [x20, 400]
	cbz	w2, .L1982
	b	.L1981
	.p2align 3
.L2012:
	beq	.L2011
.L1982:
	ldr	w2, [x0]
	add	x0, x0, 4
	cmp	x3, x0
	cbz	w2, .L2012
.L1981:
	cmp	w2, 1
	beq	.L2013
	cmp	w1, 6
	mov	w0, 0
	beq	.L1997
	ldr	x1, .LC997
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1997
	.p2align 3
.L2011:
	mov	w0, w19
	bl	VCTRL_InitDspCode
	cmp	w21, 1
	beq	.L2014
	add	x20, x20, 400
	mov	w1, 2
	mov	w0, 0
	str	w1, [x20, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2014:
	add	x20, x20, 400
	mov	w0, 0
	str	w21, [x20, w19, sxtw 2]
	b	.L1997
	.p2align 3
.L2013:
	cmp	w21, 1
	mov	w0, 0
	beq	.L1997
	ldr	x1, .LC995
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1997
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	3
.LC992:
	.xword	.LANCHOR1
	.align	3
.LC993:
	.xword	.LANCHOR5
	.align	3
.LC995:
	.xword	.LC994
	.align	3
.LC997:
	.xword	.LC996
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
	ldr	x0, .LC1000
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 278528
	str	w19, [x0, 2224]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	3
.LC1000:
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
	ldr	x0, .LC1001
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 307200
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 1836]
	ret
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	3
.LC1001:
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
	beq	.L2019
	cbz	w19, .L2020
	cmp	w19, 2
	bne	.L2028
	ldr	x0, .LC1002
	add	x0, x0, 3344
	ldr	w1, [x0, w20, sxtw 2]
	cmp	w1, 1
	beq	.L2024
.L2026:
	str	w19, [x0, w20, sxtw 2]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2028:
	mov	w0, 0
.L2018:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2020:
	ldr	x1, .LC1002
	mov	w0, 0
	add	x1, x1, 3344
	str	wzr, [x1, w20, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2019:
	ldr	x0, .LC1002
	add	x0, x0, 3344
	ldr	w1, [x0, w20, sxtw 2]
	cbz	w1, .L2026
.L2024:
	mov	w0, -1
	b	.L2018
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.align	3
.LC1002:
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
	beq	.L2030
	ldr	w2, [x19, 12]
	ldr	w0, [x19, 32]
	ldr	x1, [x19, 24]
	bl	MEM_AddMemRecord
.L2030:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L2031
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_AddMemRecord
.L2031:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L2029
	ldr	w2, [x19, 20]
	ldr	w0, [x19, 64]
	ldr	x1, [x19, 56]
	bl	MEM_AddMemRecord
.L2029:
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
	ldr	x22, .LC1004
	ldr	w4, [x20, 12]
	ldr	x0, [x22, w19, sxtw 3]
	add	x1, x0, 311296
	ldr	w5, [x1, 1312]
	cmp	w5, w4
	beq	.L2043
	add	x0, x0, 307200
	ldr	w0, [x0, 1832]
	cbz	w0, .L2070
.L2043:
	ldr	w0, [x1, 128]
	cbz	w0, .L2045
	ldr	w0, [x1, 1344]
	cbz	w0, .L2071
.L2045:
	ldr	x23, .LC1010
	mov	w0, 8
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x4, [x22, w19, sxtw 3]
	add	x2, x4, 307200
	ldr	w0, [x2, 1864]
	cmp	w0, 255
	beq	.L2054
	add	x2, x2, 1936
	mov	x1, 1
	b	.L2047
	.p2align 3
.L2073:
	add	w1, w1, 1
	cmp	w1, 32
	beq	.L2072
.L2047:
	ldr	w3, [x2]
	add	x2, x2, 72
	cmp	w3, 255
	bne	.L2073
.L2046:
	lsl	x0, x1, 6
	ldr	x3, [x23, 104]
	add	x0, x0, x1, lsl 3
	mov	x2, 72
	add	x0, x0, 307200
	mov	x1, x20
	add	x0, x4, x0
	sxtw	x21, w19
	add	x0, x0, 1864
	blr	x3
	ldr	x1, [x22, w19, sxtw 3]
	mov	x0, x20
	add	x1, x1, 311296
	ldr	w2, [x1, 1344]
	add	w2, w2, 1
	str	w2, [x1, 1344]
	bl	VCTRL_AddFrameBufMemoryRecord
	mov	x0, x21
	ldr	x1, .LC1011
	lsl	x21, x21, 6
	add	x0, x21, x0, lsl 3
	add	x1, x1, 912
	add	x21, x1, x0
	ldr	w0, [x21, 24]
	cmp	w0, 2
	beq	.L2074
.L2049:
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 311296
	ldr	w0, [x0, 1348]
	cbnz	w0, .L2050
.L2052:
	mov	w19, 0
.L2051:
	ldr	x1, [x23, 32]
	mov	w0, 8
	blr	x1
	mov	w0, w19
.L2065:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2071:
	ldr	w5, [x20, 8]
	cmp	w5, 255
	bne	.L2045
	ldr	x2, .LC1005
	mov	w4, 0
	ldr	x1, .LC1009
	mov	w3, 8188
	add	x2, x2, 1536
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2065
	.p2align 3
.L2072:
	ldr	x2, .LC1005
	ldr	x1, .LC1015
.L2067:
	mov	w3, w19
	add	x2, x2, 1536
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
	b	.L2051
	.p2align 3
.L2074:
	ldr	w0, [x21, 52]
	cbnz	w0, .L2049
	ldr	x0, [x23]
	blr	x0
	str	w0, [x21, 52]
	mov	w1, 3
	str	w1, [x21, 24]
	b	.L2049
	.p2align 3
.L2050:
	mov	x1, x20
	mov	w0, w19
	bl	FSP_SetSingleFrameBuf
	cbz	w0, .L2052
	ldr	x2, .LC1005
	ldr	x1, .LC1013
	b	.L2067
.L2054:
	mov	x1, 0
	b	.L2046
.L2070:
	ldr	x2, .LC1005
	mov	w3, 8178
	ldr	x1, .LC1007
	mov	w0, 1
	add	x2, x2, 1536
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2065
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	3
.LC1004:
	.xword	.LANCHOR1
	.align	3
.LC1005:
	.xword	.LANCHOR4
	.align	3
.LC1007:
	.xword	.LC1006
	.align	3
.LC1009:
	.xword	.LC1008
	.align	3
.LC1010:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1011:
	.xword	.LANCHOR5
	.align	3
.LC1013:
	.xword	.LC1012
	.align	3
.LC1015:
	.xword	.LC1014
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
	ldr	x21, .LC1017
	add	x3, x21, 3344
	ldr	w0, [x3, w19, sxtw 2]
	cbz	w0, .L2085
	ldr	x2, .LC1024
	mov	w3, w19
	ldr	x1, .LC1026
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
.L2085:
	ldr	x23, .LC1018
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
	ldr	x22, .LC1019
	mov	w20, w0
	ldr	x0, [x22, w19, sxtw 3]
	add	x2, x0, 278528
	cbnz	w20, .L2086
.L2078:
	ldr	x1, .LC1023
	mov	w3, 2
	mov	w0, 31
	str	w3, [x2, 2224]
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 311296
	ldr	w0, [x0, 1948]
	cmp	w0, 1
	beq	.L2087
.L2079:
	add	x21, x21, 3344
	mov	w0, w20
	str	wzr, [x21, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2086:
	add	x1, x0, 307200
	add	x2, x0, 278528
	ldr	w0, [x1, 1836]
	cbz	w0, .L2078
	ldr	x1, .LC1021
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	mov	w1, 3
	add	x2, x0, 278528
	str	w1, [x2, 2224]
	b	.L2078
	.p2align 3
.L2087:
	ldr	x1, [x23, 256]
	mov	w0, 0
	blr	x1
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 311296
	str	wzr, [x0, 1948]
	b	.L2079
	.size	VCTRL_AllocMemToDecoder, .-VCTRL_AllocMemToDecoder
	.align	3
.LC1017:
	.xword	.LANCHOR5
	.align	3
.LC1018:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1019:
	.xword	.LANCHOR1
	.align	3
.LC1021:
	.xword	.LC1020
	.align	3
.LC1023:
	.xword	.LC1022
	.align	3
.LC1024:
	.xword	.LANCHOR4
	.align	3
.LC1026:
	.xword	.LC1025
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
	ldr	x3, .LC1028
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, .LC1029
	ldr	x6, [x0, 104]
	cbz	x6, .L2089
	ldr	x4, .LC1030
	add	x5, x29, 56
	mov	w3, 0
	mov	w2, w21
	mov	w1, w20
	mov	w0, w19
	ldr	x4, [x4, w19, sxtw 3]
	add	x4, x4, 311296
	ldr	w4, [x4, 1952]
	blr	x6
.L2089:
	ldr	w0, [x29, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VCTRL_GetFsSize, .-VCTRL_GetFsSize
	.align	3
.LC1028:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1029:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC1030:
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
	ldr	x0, .LC1031
	mov	w1, 1
	add	x0, x0, 3752
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC1031:
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
	ldr	x0, .LC1033
	add	x0, x0, 3752
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC1033:
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
	ldr	x0, .LC1035
	add	x0, x0, 3752
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC1035:
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
	.type	__func__.15644, %object
	.size	__func__.15644, 18
__func__.15644:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.16849, %object
	.size	__func__.16849, 24
__func__.16849:
	.string	"VCTRL_SetLastFrameState"
	.type	__func__.15583, %object
	.size	__func__.15583, 20
__func__.15583:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.15588, %object
	.size	__func__.15588, 17
__func__.15588:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.15635, %object
	.size	__func__.15635, 23
__func__.15635:
	.string	"VCTRL_SetMoreGapEnable"
	.zero	1
	.type	__func__.15656, %object
	.size	__func__.15656, 18
__func__.15656:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__func__.15696, %object
	.size	__func__.15696, 25
__func__.15696:
	.string	"VCTRL_SetStreamInterface"
	.zero	7
	.type	__func__.15701, %object
	.size	__func__.15701, 29
__func__.15701:
	.string	"VCTRL_SetSendStreamAgainFlag"
	.zero	3
	.type	__func__.15705, %object
	.size	__func__.15705, 29
__func__.15705:
	.string	"VCTRL_GetSendStreamAgainFlag"
	.zero	3
	.type	__func__.15715, %object
	.size	__func__.15715, 20
__func__.15715:
	.string	"VCTRL_GetStreamSize"
	.zero	4
	.type	__func__.15722, %object
	.size	__func__.15722, 20
__func__.15722:
	.string	"VCTRL_CheckFreshRaw"
	.zero	4
	.type	__func__.15729, %object
	.size	__func__.15729, 20
__func__.15729:
	.string	"VCTRL_CheckFreshSeg"
	.zero	4
	.type	__func__.15734, %object
	.size	__func__.15734, 25
__func__.15734:
	.string	"VCTRL_SetDiscardPicParam"
	.zero	7
	.type	__FUNCTION__.15762, %object
	.size	__FUNCTION__.15762, 29
__FUNCTION__.15762:
	.string	"VCTRL_PartitionMemForStdUser"
	.zero	3
	.type	__func__.15777, %object
	.size	__func__.15777, 21
__func__.15777:
	.string	"DelAllFrameMemRecord"
	.zero	3
	.type	__func__.15787, %object
	.size	__func__.15787, 23
__func__.15787:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.15969, %object
	.size	__func__.15969, 17
__func__.15969:
	.string	"VCTRL_GetChanCfg"
	.zero	7
	.type	__func__.16030, %object
	.size	__func__.16030, 14
__func__.16030:
	.string	"VCTRL_SeekPts"
	.zero	2
	.type	__func__.16063, %object
	.size	__func__.16063, 20
__func__.16063:
	.string	"VCTRL_ReleaseStream"
	.zero	4
	.type	__func__.16083, %object
	.size	__func__.16083, 24
__func__.16083:
	.string	"VCTRL_ImageOutputEnable"
	.type	__func__.16122, %object
	.size	__func__.16122, 25
__func__.16122:
	.string	"VCTRL_TryToRelSpecialFrm"
	.zero	7
	.type	__func__.16146, %object
	.size	__func__.16146, 19
__func__.16146:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.16154, %object
	.size	__FUNCTION__.16154, 19
__FUNCTION__.16154:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__func__.16161, %object
	.size	__func__.16161, 23
__func__.16161:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__FUNCTION__.16165, %object
	.size	__FUNCTION__.16165, 23
__FUNCTION__.16165:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.16173, %object
	.size	__func__.16173, 23
__func__.16173:
	.string	"VCTRL_GetHDRConfigInfo"
	.zero	1
	.type	__func__.16199, %object
	.size	__func__.16199, 18
__func__.16199:
	.string	"VCTRL_GetDecParam"
	.align	3
.LANCHOR4 = . + 0
	.type	__func__.16281, %object
	.size	__func__.16281, 20
__func__.16281:
	.string	"VCTRL_ClearDecparam"
	.zero	4
	.type	__func__.16310, %object
	.size	__func__.16310, 21
__func__.16310:
	.string	"VCTRL_VdmProcSedOnly"
	.zero	3
	.type	__func__.16318, %object
	.size	__func__.16318, 21
__func__.16318:
	.string	"VCTRL_GetImageBuffer"
	.zero	3
	.type	__func__.16341, %object
	.size	__func__.16341, 22
__func__.16341:
	.string	"VCTRL_ConfigFFFBSpeed"
	.zero	2
	.type	__func__.16346, %object
	.size	__func__.16346, 20
__func__.16346:
	.string	"VCTRL_ConfigPVRInfo"
	.zero	4
	.type	__func__.16350, %object
	.size	__func__.16350, 19
__func__.16350:
	.string	"VCTRL_IsChanActive"
	.zero	5
	.type	__func__.16356, %object
	.size	__func__.16356, 13
__func__.16356:
	.string	"USERDEC_Init"
	.zero	3
	.type	__func__.16375, %object
	.size	__func__.16375, 21
__func__.16375:
	.string	"VCTRL_GetUsrdecFrame"
	.zero	3
	.type	__func__.16385, %object
	.size	__func__.16385, 14
__func__.16385:
	.string	"InitSyntaxCtx"
	.zero	2
	.type	__func__.16440, %object
	.size	__func__.16440, 12
__func__.16440:
	.string	"OpenDrivers"
	.zero	4
	.type	__func__.15665, %object
	.size	__func__.15665, 15
__func__.15665:
	.string	"VCTRL_OpenVfmw"
	.zero	1
	.type	__FUNCTION__.16579, %object
	.size	__FUNCTION__.16579, 18
__FUNCTION__.16579:
	.string	"GetExtraRefFrmNum"
	.zero	6
	.type	__FUNCTION__.16585, %object
	.size	__FUNCTION__.16585, 19
__FUNCTION__.16585:
	.string	"GetExtraDispFrmNum"
	.zero	5
	.type	__FUNCTION__.16591, %object
	.size	__FUNCTION__.16591, 16
__FUNCTION__.16591:
	.string	"GetExtraCtrlCmd"
	.type	__func__.16525, %object
	.size	__func__.16525, 14
__func__.16525:
	.string	"DecChanSyntax"
	.zero	2
	.type	__FUNCTION__.16526, %object
	.size	__FUNCTION__.16526, 14
__FUNCTION__.16526:
	.string	"DecChanSyntax"
	.zero	2
	.type	__func__.16072, %object
	.size	__func__.16072, 24
__func__.16072:
	.string	"VCTRL_FindOccupiedFrame"
	.type	__func__.16093, %object
	.size	__func__.16093, 26
__func__.16093:
	.string	"VCTRL_ReportOccupiedFrame"
	.zero	6
	.type	__func__.16556, %object
	.size	__func__.16556, 20
__func__.16556:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	__func__.15745, %object
	.size	__func__.15745, 19
__func__.15745:
	.string	"VCTRL_GetChanState"
	.zero	5
	.type	__func__.16560, %object
	.size	__func__.16560, 19
__func__.16560:
	.string	"VCTRL_GetChanWidth"
	.zero	5
	.type	__func__.16564, %object
	.size	__func__.16564, 20
__func__.16564:
	.string	"VCTRL_GetChanHeight"
	.zero	4
	.type	__func__.16568, %object
	.size	__func__.16568, 22
__func__.16568:
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
	.type	__func__.16864, %object
	.size	__func__.16864, 22
__func__.16864:
	.string	"VCTRL_OutputLastFrame"
	.zero	2
	.type	__func__.16256, %object
	.size	__func__.16256, 15
__func__.16256:
	.string	"VCTRL_PostProc"
	.zero	1
	.type	__func__.16305, %object
	.size	__func__.16305, 18
__func__.16305:
	.string	"VCTRL_VdmPostProc"
	.zero	6
	.type	__func__.16890, %object
	.size	__func__.16890, 21
__func__.16890:
	.string	"VCTRL_SvdecLastFrame"
	.zero	3
	.type	__func__.16381, %object
	.size	__func__.16381, 21
__func__.16381:
	.string	"VCTRL_PutUsrdecFrame"
	.zero	3
	.type	__func__.15948, %object
	.size	__func__.15948, 16
__func__.15948:
	.string	"VCTRL_StartChan"
	.type	__func__.15964, %object
	.size	__func__.15964, 15
__func__.15964:
	.string	"VCTRL_StopChan"
	.zero	1
	.type	__func__.16057, %object
	.size	__func__.16057, 26
__func__.16057:
	.string	"VCTRL_ResetChanWithOption"
	.zero	6
	.type	__func__.16136, %object
	.size	__func__.16136, 16
__func__.16136:
	.string	"VCTRL_ResetChan"
	.type	__func__.15854, %object
	.size	__func__.15854, 18
__func__.15854:
	.string	"VCTRL_AllocHalMem"
	.zero	6
	.type	__func__.15930, %object
	.size	__func__.15930, 17
__func__.15930:
	.string	"VCTRL_CreateChan"
	.zero	7
	.type	__func__.15811, %object
	.size	__func__.15811, 18
__func__.15811:
	.string	"VCTRL_AllocSCDMem"
	.zero	6
	.type	__func__.16015, %object
	.size	__func__.16015, 17
__func__.16015:
	.string	"VCTRL_ConfigChan"
	.zero	7
	.type	__func__.15942, %object
	.size	__func__.15942, 18
__func__.15942:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.16985, %object
	.size	__func__.16985, 30
__func__.16985:
	.string	"VCTRL_SetSingleFrameBufToChan"
	.zero	2
	.type	__func__.16997, %object
	.size	__func__.16997, 24
__func__.16997:
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
.LC706:
	ASCII(.string	"%s not support std %d\n" )
	.zero	1
.LC710:
	ASCII(.string	"pstChanState = NULL" )
	.zero	4
.LC735:
	ASCII(.string	"SetVdecExtra ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\n" )
	.zero	1
.LC737:
	ASCII(.string	"SetVdecExtra ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\n" )
.LC746:
	ASCII(.string	"Command \"%d\" not registerd!\n" )
	.zero	3
.LC752:
	ASCII(.string	"Chan %d Report Last Frame, Value=%d, LastFrameState=%d\n" )
.LC760:
	ASCII(.string	"Last frame output failed!\n" )
	.zero	5
.LC762:
	ASCII(.string	"Last frame output successed!\n" )
	.zero	2
.LC764:
	ASCII(.string	"Last frame already output, image id: %d!\n" )
	.zero	6
.LC781:
	ASCII(.string	"line %d can not know YuvFormat = %d\n" )
	.zero	3
.LC783:
	ASCII(.string	"userdec frame(phy=%#x) address error!\n" )
	.zero	1
.LC785:
	ASCII(.string	"can not map vir addr for usrdat frame(cbphy=%#x)\n" )
	.zero	6
.LC787:
	ASCII(.string	"line: %d, pLogic is Null!\n" )
	.zero	5
.LC790:
	ASCII(.string	"eYuvFormat %d is not support!!\n" )
.LC797:
	ASCII(.string	"pUsrdecFrame == NULL" )
	.zero	3
.LC799:
	ASCII(.string	"VCTRL_PutUsrdecFrame: VidStd is %d\n" )
	.zero	4
.LC802:
	ASCII(.string	"VCTRL_PutUsrdecFrame return err\n" )
	.zero	7
.LC804:
	ASCII(.string	"L:%d ChanID out of range\n" )
	.zero	6
.LC807:
	ASCII(.string	"L:%d This Chan has not been created!!!\n" )
.LC809:
	ASCII(.string	"L:%d WARNING: vidio std not setted!\n" )
	.zero	3
.LC821:
	ASCII(.string	"WARNING: vidio std not setted!" )
	.zero	1
.LC831:
	ASCII(.string	"start chan %d: VCTRL_StartChan return %d\n" )
	.zero	6
.LC842:
	ASCII(.string	"This Chan has not been created or has been destroyed !" )
	.zero	1
.LC845:
	ASCII(.string	"VCTRL_StopChanWithCheck fail!\n" )
	.zero	1
.LC852:
	ASCII(.string	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\n" )
	.zero	6
.LC856:
	ASCII(.string	"-------------------------------------------------------------------------\n" )
	.zero	5
.LC871:
	ASCII(.string	"Param Invalid of PChanOption is NULL\n" )
	.zero	2
.LC874:
	ASCII(.string	"line %d VCTRL_GetChanMemSize failed!\n" )
	.zero	2
.LC877:
	ASCII(.string	"ChanID: %d is out of range!\n" )
	.zero	3
.LC879:
	ASCII(.string	"vfmw have max(%d) channels opened, can NOT create more channels\n" )
	.zero	7
.LC884:
	ASCII(.string	"%s get Vdh %d hal mem size failed!\n" )
	.zero	4
.LC886:
	ASCII(.string	"%s alloc Vdh %d hal mem size %d failed!\n" )
	.zero	7
.LC888:
	ASCII(.string	"VDMHAL_OpenHAL Vdh %d failed!\n" )
	.zero	1
.LC890:
	ASCII(.string	"%s alloc vdh %d vp9 prob mem size %d failed!\n" )
	.zero	2
.LC892:
	ASCII(.string	"%s alloc Scd %d hal mem size %d failed!\n" )
	.zero	7
.LC894:
	ASCII(.string	"%s open Scd %d drv failed!\n" )
	.zero	4
.LC896:
	ASCII(.string	"%s alloc hal mem failed!\n" )
	.zero	6
.LC898:
	ASCII(.string	"L: %d : part we can NOT alloc buffer for channel context\n" )
	.zero	6
.LC900:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel context\n" )
	.zero	6
.LC902:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh\n" )
	.zero	2
.LC904:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh, %#x < %#x\n" )
	.zero	7
.LC906:
	ASCII(.string	"%s :%d Alloc failed ScdDetailMem:%d\n" )
	.zero	3
.LC908:
	ASCII(.string	"%s allc chan scd failed!\n" )
	.zero	6
.LC910:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel Hal Mem\n" )
	.zero	6
.LC913:
	ASCII(.string	"%s alloc mem for vfmw failed!\n" )
	.zero	1
.LC915:
	ASCII(.string	"Chan:%d can NOT enable FSP instance\n" )
	.zero	3
.LC920:
	ASCII(.string	"pstCfg = NULL" )
	.zero	2
.LC928:
	ASCII(.string	"VCTRL_CheckChanWH return err.\n" )
	.zero	1
.LC931:
	ASCII(.string	"VFMW didn't support std %d.\n" )
	.zero	3
.LC933:
	ASCII(.string	"VCTRL_ConfigChan with same config paramater.\n" )
	.zero	2
.LC937:
	ASCII(.string	"can NOT VCTRL_PartitionMemForStdUser\n" )
	.zero	2
.LC943:
	ASCII(.string	"chan %d: new UvmosEnable = %d\n" )
	.zero	1
.LC946:
	ASCII(.string	"chan %d: SetUvmosEnable failed!\n" )
	.zero	7
.LC948:
	ASCII(.string	"chan %d: new StrmOFThr = %d\n" )
	.zero	3
.LC951:
	ASCII(.string	"chan %d: new DecMode = %d\n" )
	.zero	5
.LC954:
	ASCII(.string	"chan %d: GetChanCfg failed!\n" )
	.zero	3
.LC956:
	ASCII(.string	"chan %d: new DecOrderOutput = %d\n" )
	.zero	6
.LC959:
	ASCII(.string	"chan %d: new ChanErrThr = %d\n" )
	.zero	2
.LC962:
	ASCII(.string	"reset chan %d: VCTRL_ResetChan return %d\n" )
	.zero	6
.LC967:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC970:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC972:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC984:
	ASCII(.string	"stop chan %d: VCTRL_StopChan return %d\n" )
.LC994:
	ASCII(.string	"WARNNING: dsp in lowdelay state, we can not supported  avs in the same time!!!\n" )
.LC996:
	ASCII(.string	"WARNNING: dsp in avs state, we can not supported  lowdelay in the same time!!!\n" )
.LC1006:
	ASCII(.string	"%s, %d, actul size = 0x%x, except size= 0x%x\n" )
	.zero	2
.LC1008:
	ASCII(.string	"%s, %d, CfgFrameNum = %x, PmvNodeStatus= 0x%x\n" )
	.zero	1
.LC1012:
	ASCII(.string	"%s: Chan %d set single frame failed!\n" )
	.zero	2
.LC1014:
	ASCII(.string	"%s: Chan %d no frame buffer store!\n" )
	.zero	4
.LC1020:
	ASCII(.string	"DFS, request frame store fail!, chanid: %d\n" )
	.zero	4
.LC1022:
	ASCII(.string	"DFS, set decoding thread state to success!\n " )
	.zero	3
.LC1025:
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
	.type	save_file_cnt.16727, %object
	.size	save_file_cnt.16727, 4
save_file_cnt.16727:
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
	.type	save_file_cnt.16721, %object
	.size	save_file_cnt.16721, 4
save_file_cnt.16721:
	.zero	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.zero	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 256
vfmw_save_metadata_file:
	.zero	256
	.type	save_file_cnt.16715, %object
	.size	save_file_cnt.16715, 4
save_file_cnt.16715:
	.zero	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.zero	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 256
vfmw_save_seg_file:
	.zero	256
	.type	save_file_cnt.16693, %object
	.size	save_file_cnt.16693, 4
save_file_cnt.16693:
	.zero	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.zero	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 256
vfmw_save_str_file:
	.zero	256
	.type	save_file_cnt.16687, %object
	.size	save_file_cnt.16687, 4
save_file_cnt.16687:
	.zero	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.zero	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 256
vfmw_save_yuv_file:
	.zero	256
	.type	save_file_cnt.16700, %object
	.size	save_file_cnt.16700, 4
save_file_cnt.16700:
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
	.type	FspInstInfo.15758, %object
	.size	FspInstInfo.15758, 2952
FspInstInfo.15758:
	.zero	2952
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.zero	4
	.zero	4
	.type	last_rec_pos_time.16151, %object
	.size	last_rec_pos_time.16151, 128
last_rec_pos_time.16151:
	.zero	128
	.type	last_rec_pos_time.16162, %object
	.size	last_rec_pos_time.16162, 128
last_rec_pos_time.16162:
	.zero	128
	.type	MemArrange.16415, %object
	.size	MemArrange.16415, 1232
MemArrange.16415:
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
	.type	last_rec_pos_time.16520, %object
	.size	last_rec_pos_time.16520, 128
last_rec_pos_time.16520:
	.zero	128
	.type	last_rec_pos_decparam_time.16521, %object
	.size	last_rec_pos_decparam_time.16521, 128
last_rec_pos_decparam_time.16521:
	.zero	128
	.type	ChanPriTab.16470, %object
	.size	ChanPriTab.16470, 128
ChanPriTab.16470:
	.zero	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 2304
g_VfmwChanStat:
	.zero	2304
	.type	PrioArray.15947, %object
	.size	PrioArray.15947, 128
PrioArray.15947:
	.zero	128
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.zero	128
	.type	Capability.16011, %object
	.size	Capability.16011, 148
Capability.16011:
	.zero	148
	.zero	4
	.type	PrioArray.16010, %object
	.size	PrioArray.16010, 128
PrioArray.16010:
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
