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
	mov	w0, 32160
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
	add	x0, x20, 507904
	ldr	x19, [x0, 2104]
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
	add	x0, x20, 507904
	ldr	x19, [x0, 2328]
	b	.L711
	.p2align 3
.L700:
	add	x0, x20, 507904
	ldr	x19, [x0, 3136]
	b	.L711
	.p2align 3
.L709:
	add	x0, x20, 512000
	ldr	x19, [x0, 480]
	b	.L711
	.p2align 3
.L697:
	add	x0, x20, 507904
	ldr	x19, [x0, 2712]
	b	.L711
	.p2align 3
.L703:
	add	x0, x20, 507904
	ldr	x19, [x0, 2120]
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
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L726
	cbz	w20, .L721
	cmp	w20, 16
	beq	.L722
	mov	w0, 0
.L720:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L722:
	ldr	w0, [x19, 5188]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	uxtb	w0, w0
	ret
	.p2align 3
.L721:
	ldrb	w0, [x19, 1188]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L726:
	ldr	x1, .LC468
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L720
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
	bhi	.L744
	ldr	x0, .LC473
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cmp	w1, 17
	bls	.L745
.L727:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L745:
	ldr	x2, .LC474
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx731
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx731:
	.section	.rodata
	.align	0
	.align	2
.L731:
	.byte	(.L730 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L733 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L727 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L736 - .Lrtx731) / 4
	.byte	(.L727 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.byte	(.L727 - .Lrtx731) / 4
	.byte	(.L741 - .Lrtx731) / 4
	.byte	(.L742 - .Lrtx731) / 4
	.byte	(.L740 - .Lrtx731) / 4
	.text
	.p2align 3
.L740:
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L744:
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
.L736:
	add	x0, x0, 507904
	str	xzr, [x0, 2120]
	b	.L727
	.p2align 3
.L741:
	add	x0, x0, 507904
	str	xzr, [x0, 2328]
	b	.L727
	.p2align 3
.L733:
	add	x0, x0, 507904
	str	xzr, [x0, 3136]
	b	.L727
	.p2align 3
.L742:
	add	x0, x0, 512000
	str	xzr, [x0, 480]
	b	.L727
	.p2align 3
.L730:
	add	x0, x0, 507904
	str	xzr, [x0, 2712]
	b	.L727
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
	.xword	.L731
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
	bhi	.L756
	ldr	x20, .LC479
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L757
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L750
	ldr	x2, .LC477
	mov	w3, 4420
	ldr	x4, .LC482
	mov	w0, 0
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
.L746:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L750:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L746
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cbz	w1, .L751
	cmp	w1, 16
	bne	.L746
	add	x0, x0, 507904
	mov	w1, w21
	add	x0, x0, 2096
	bl	HEVCDEC_VDMProcSedOnly
	b	.L746
	.p2align 3
.L756:
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
.L751:
	add	x0, x0, 507904
	mov	w1, w21
	add	x0, x0, 2096
	bl	H264DEC_VDMProcSedOnly
	b	.L746
	.p2align 3
.L757:
	ldr	x2, .LC477
	mov	w3, 4419
	ldr	x4, .LC480
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L746
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
	bhi	.L781
	ldr	x0, .LC486
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L782
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bne	.L783
	ldr	w2, [x1, 672]
	cmp	w2, 17
	bls	.L784
.L777:
	mov	w0, 0
	b	.L760
	.p2align 3
.L784:
	ldr	x3, .LC489
	ldrb	w2, [x3,w2,uxtw]
	adr	x3, .Lrtx764
	add	x2, x3, w2, sxtb #2
	br	x2
.Lrtx764:
	.section	.rodata
	.align	0
	.align	2
.L764:
	.byte	(.L763 - .Lrtx764) / 4
	.byte	(.L765 - .Lrtx764) / 4
	.byte	(.L766 - .Lrtx764) / 4
	.byte	(.L767 - .Lrtx764) / 4
	.byte	(.L777 - .Lrtx764) / 4
	.byte	(.L768 - .Lrtx764) / 4
	.byte	(.L769 - .Lrtx764) / 4
	.byte	(.L777 - .Lrtx764) / 4
	.byte	(.L770 - .Lrtx764) / 4
	.byte	(.L771 - .Lrtx764) / 4
	.byte	(.L772 - .Lrtx764) / 4
	.byte	(.L772 - .Lrtx764) / 4
	.byte	(.L772 - .Lrtx764) / 4
	.byte	(.L773 - .Lrtx764) / 4
	.byte	(.L777 - .Lrtx764) / 4
	.byte	(.L774 - .Lrtx764) / 4
	.byte	(.L775 - .Lrtx764) / 4
	.byte	(.L776 - .Lrtx764) / 4
	.text
	.p2align 3
.L776:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VP9DEC_GetImageBuffer
.L760:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L775:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	HEVCDEC_GetImageBuffer
	b	.L760
	.p2align 3
.L774:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	MVC_DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L773:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VP8DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L772:
	ldr	x2, .LC490
	ldr	w2, [x2, 2200]
	tbz	x2, 0, .L760
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VP6DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L771:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	REAL9DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L770:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	REAL8DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L769:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	AVSDEC_GetImageBuffer
	b	.L760
	.p2align 3
.L768:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	DIVX3DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L767:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	MPEG2DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L766:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	MPEG4DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L765:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VC1DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L763:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	H264DEC_GetImageBuffer
	b	.L760
	.p2align 3
.L783:
	ldr	x2, .LC484
	mov	w3, 4455
	ldr	x4, .LC488
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L760
	.p2align 3
.L781:
	ldr	x2, .LC484
	mov	w3, 4453
	ldr	x4, .LC483
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L760
.L782:
	ldr	x2, .LC484
	mov	w3, 4454
	ldr	x4, .LC487
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L760
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
	.xword	.L764
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
	bhi	.L791
	ldr	x0, .LC494
	ldr	x2, [x0, w19, sxtw 3]
	cbz	x2, .L792
	ldr	w0, [x2, 4]
	cmp	w0, 1
	bne	.L793
	cbz	x20, .L794
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 1340]
.L787:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L793:
	ldr	x2, .LC492
	mov	w3, 4571
	ldr	x4, .LC498
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L787
	.p2align 3
.L791:
	ldr	x2, .LC492
	mov	w3, 4569
	ldr	x4, .LC491
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L787
.L792:
	ldr	x2, .LC492
	mov	w3, 4570
	ldr	x4, .LC496
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L787
.L794:
	ldr	x2, .LC492
	mov	w3, 4572
	ldr	x4, .LC500
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L787
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
	bhi	.L801
	ldr	x0, .LC504
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L802
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L803
	cbz	x20, .L804
	ldr	x3, .LC508
	mov	x2, 20
	mov	x1, x20
	add	x0, x0, 1376
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L797:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L803:
	ldr	x2, .LC502
	mov	w3, 4584
	ldr	x4, .LC506
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L797
	.p2align 3
.L801:
	ldr	x2, .LC502
	mov	w3, 4582
	ldr	x4, .LC501
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L797
.L804:
	ldr	x2, .LC502
	mov	w3, 4585
	ldr	x4, .LC507
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L797
.L802:
	ldr	x2, .LC502
	mov	w3, 4583
	ldr	x4, .LC505
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L797
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
	bhi	.L812
	ldr	x0, .LC512
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L811
	ldr	w1, [x0, 4]
	cbz	w1, .L811
	ldr	w1, [x0, 8]
	cbz	w1, .L811
	ldr	w1, [x0, 20]
	cbz	w1, .L811
	ldr	w0, [x0, 672]
	cmp	w0, 22
	csetm	w0, eq
.L807:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L811:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L812:
	ldr	x2, .LC510
	mov	w3, 4594
	ldr	x4, .LC509
	mov	w0, 0
	ldr	x1, .LC511
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -1
	b	.L807
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
	beq	.L829
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
	b	.L818
	.p2align 3
.L816:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L830
.L818:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 507904
	add	x1, x1, 2096
	cbz	x2, .L816
	cmp	x19, x1
	bne	.L816
	cmn	w0, #1
	str	w0, [x19, 616]
	mov	w0, 1
	beq	.L820
.L824:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L830:
	mov	w0, -1
	str	w0, [x19, 616]
.L820:
	ldr	x1, .LC519
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L824
.L829:
	ldr	x2, .LC513
	mov	w0, 0
	ldr	x1, .LC515
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -20
	b	.L824
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
	cbz	x19, .L833
	ldr	w0, [x19, 616]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 616]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L834
	ldr	w0, [x19, 616]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	str	xzr, [x20, 544]
	ldr	x1, [x20, 552]
	ldr	w0, [x19, 616]
	bl	FreeUsdByDec
	str	xzr, [x20, 552]
	mov	w0, 1
.L832:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L834:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L833:
	mov	w0, -2
	b	.L832
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
	cbz	x0, .L849
	ldr	w1, [x0, 672]
	cmp	w1, 20
	bne	.L850
	ldr	w0, [x0, 596]
	cmp	w0, 2
	ble	.L851
	mov	w1, 1
	mov	w0, w20
	bl	FSP_NewLogicFs
	mov	w22, w0
	tbnz	w0, #31, .L852
	mov	w1, w0
	mov	w0, w20
	bl	FSP_GetLogicFs
	mov	x19, x0
	ldr	x1, .LC531
	mov	w2, w22
	mov	w0, 18
	bl	dprint_vfmw
	cbz	x19, .L853
	ldr	x0, [x19, 32]
	cbz	x0, .L842
	ldr	x1, [x19, 40]
	cbz	x1, .L842
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
.L837:
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L850:
	ldr	x1, .LC525
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L837
	.p2align 3
.L851:
	ldr	x1, .LC527
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L837
	.p2align 3
.L842:
	ldr	x1, .LC537
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L837
	.p2align 3
.L852:
	ldr	x1, .LC529
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L837
.L849:
	ldr	x2, .LC522
	mov	w3, 4786
	ldr	x1, .LC523
	ldr	x4, .LC521
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w1, -1
	b	.L837
.L853:
	ldr	x1, .LC533
	mov	w2, 4814
	mov	w0, 22
	bl	dprint_vfmw
	mov	w1, -1
	b	.L837
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
	cbz	x1, .L872
	ldr	w0, [x1, 672]
	cmp	w0, 20
	bls	.L873
.L854:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L873:
	ldr	x2, .LC542
	ldrb	w0, [x2,w0,uxtw]
	adr	x2, .Lrtx858
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx858:
	.section	.rodata
	.align	0
	.align	2
.L858:
	.byte	(.L857 - .Lrtx858) / 4
	.byte	(.L859 - .Lrtx858) / 4
	.byte	(.L860 - .Lrtx858) / 4
	.byte	(.L861 - .Lrtx858) / 4
	.byte	(.L854 - .Lrtx858) / 4
	.byte	(.L862 - .Lrtx858) / 4
	.byte	(.L863 - .Lrtx858) / 4
	.byte	(.L854 - .Lrtx858) / 4
	.byte	(.L864 - .Lrtx858) / 4
	.byte	(.L865 - .Lrtx858) / 4
	.byte	(.L866 - .Lrtx858) / 4
	.byte	(.L866 - .Lrtx858) / 4
	.byte	(.L866 - .Lrtx858) / 4
	.byte	(.L867 - .Lrtx858) / 4
	.byte	(.L854 - .Lrtx858) / 4
	.byte	(.L868 - .Lrtx858) / 4
	.byte	(.L869 - .Lrtx858) / 4
	.byte	(.L870 - .Lrtx858) / 4
	.byte	(.L854 - .Lrtx858) / 4
	.byte	(.L854 - .Lrtx858) / 4
	.byte	(.L871 - .Lrtx858) / 4
	.text
	.p2align 3
.L871:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	USERDEC_Init
	b	.L854
	.p2align 3
.L870:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VP9DEC_Init
	b	.L854
	.p2align 3
.L869:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	HEVCDEC_Init
	b	.L854
	.p2align 3
.L868:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	MVC_DEC_Init
	b	.L854
	.p2align 3
.L867:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VP8DEC_Init
	b	.L854
	.p2align 3
.L866:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VP6DEC_Init
	b	.L854
	.p2align 3
.L865:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	REAL9DEC_Init
	b	.L854
	.p2align 3
.L864:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	REAL8DEC_Init
	b	.L854
	.p2align 3
.L863:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	AVSDEC_Init
	b	.L854
	.p2align 3
.L862:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	DIVX3DEC_Init
	b	.L854
	.p2align 3
.L861:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	MPEG2DEC_Init
	b	.L854
	.p2align 3
.L860:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	MPEG4DEC_Init
	b	.L854
	.p2align 3
.L859:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VC1DEC_Init
	b	.L854
	.p2align 3
.L857:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	H264DEC_Init
	b	.L854
	.p2align 3
.L872:
	ldr	x2, .LC540
	mov	w3, 4863
	ldr	x4, .LC539
	mov	w0, 0
	ldr	x1, .LC541
	add	x2, x2, 184
	bl	dprint_vfmw
	b	.L854
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
	.xword	.L858
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
	tbnz	w0, #31, .L875
	ldr	w0, [x19, 12]
	cmp	w0, 31
	ble	.L875
	ldr	w0, [x19, 16]
	cmp	w0, 31
	ble	.L875
	ldr	w1, [x19, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L875
	ldr	w0, [x19, 44]
	cmp	w0, 1
	beq	.L881
	cmp	w0, 2
	mov	w0, 0
	bne	.L877
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L875
	ldr	w0, [x19, 24]
	cmp	w0, wzr
	ble	.L875
.L880:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L875
	ldr	w0, [x19, 32]
	cmp	w0, wzr
	bgt	.L882
.L875:
	ldr	x1, .LC544
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
.L877:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L882:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L881:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	bgt	.L880
	b	.L875
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
	cbz	w0, .L885
	mov	w4, 17
	add	w0, w5, 1
	cmp	w0, w4
	csel	w4, w0, w4, le
.L885:
	ldr	x1, .LC545
	sub	w0, w21, #27
	mov	w7, -2
	cmp	w0, 5
	csinv	w7, w7, wzr, ls
	ldr	x8, [x1, 128]
	cbz	x8, .L889
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
	cbnz	w0, .L889
	ldr	w0, [x22, 2464]
	add	w0, w0, 16
	str	w0, [x20]
	ldr	w0, [x19, 256]
	cmp	w0, 17
	beq	.L901
	ldr	w0, [x19, 56]
	add	w0, w0, 32768
	add	w0, w0, 16
	str	w0, [x20, 4]
.L891:
	mov	w0, 1024
	movk	w0, 0x2, lsl 16
	str	w0, [x20, 12]
	ldr	w0, [x19, 256]
	cbz	w0, .L902
	cmp	w0, 15
	bne	.L895
	ldp	w4, w0, [x19, 28]
	mov	w1, 3992
	ldr	w2, [x19, 20]
	mov	w3, 4064
	mov	w5, 2240
	smull	x4, w4, w1
	smaddl	x1, w2, w3, x4
	madd	w3, w0, w5, w1
.L894:
	mov	w2, 32160
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
.L902:
	ldp	w4, w0, [x19, 28]
	mov	w1, 4000
	ldr	w2, [x19, 20]
	mov	w3, 4064
	mov	w5, 2208
	smull	x4, w4, w1
	smaddl	x1, w2, w3, x4
	madd	w3, w0, w5, w1
	b	.L894
	.p2align 3
.L889:
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
.L901:
	str	wzr, [x20, 4]
	b	.L891
	.p2align 3
.L895:
	mov	w1, 61264
	cmp	w0, 16
	movk	w1, 0x9, lsl 16
	csel	w3, w1, wzr, eq
	b	.L894
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
	beq	.L904
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
	blt	.L911
	str	w0, [x19, 36]
	str	w1, [x19, 60]
.L904:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L907
	mov	x2, x22
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetMemSize_onDecode
.L906:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L907:
	mov	w0, -1
	b	.L906
	.p2align 3
.L911:
	ldr	x1, .LC552
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
	b	.L906
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
	cbnz	w2, .L936
	ldr	w21, [x19, 152]
	ldr	w22, [x19, 144]
	ldr	x23, [x19, 136]
	cbnz	w21, .L937
.L914:
	mov	w2, w21
	mov	x1, x23
	mov	w0, w22
	add	x20, x19, 224
	bl	MEM_DelMemRecord
	ldr	w21, [x19, 248]
	ldr	w22, [x19, 240]
	ldr	x23, [x19, 232]
	cbnz	w21, .L938
.L915:
	mov	w2, w21
	mov	w0, w22
	mov	x1, x23
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 216]
	ldr	w21, [x19, 208]
	ldr	x22, [x19, 200]
	cbnz	w20, .L939
.L916:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	add	x19, x19, 256
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbnz	w20, .L940
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x19, .LC554
	ldr	w0, [x19, 592]
	cmp	w0, 1
	beq	.L941
.L918:
	ldr	w0, [x19, 596]
	cmp	w0, 1
	beq	.L942
.L919:
	ldr	w0, [x19, 600]
	add	x19, x19, 256
	cmp	w0, 1
	beq	.L943
.L920:
	bl	HEVCDEC_ReleaseHevcGlbMem
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L936:
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
	cbz	w21, .L914
.L937:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 128
	ldr	x3, [x3, 96]
	blr	x3
	b	.L914
	.p2align 3
.L940:
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
	bne	.L918
.L941:
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
	bne	.L919
	.p2align 2
.L942:
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
	bne	.L920
.L943:
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
.L939:
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 192
	ldr	x3, [x3, 96]
	blr	x3
	b	.L916
	.p2align 3
.L938:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	b	.L915
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
	cbnz	w0, .L945
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
	cbnz	w0, .L946
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
	cbnz	w0, .L964
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
	cbz	w0, .L965
	ldr	x2, .LC562
	mov	w4, 18048
	ldr	x1, .LC564
	mov	w3, 1
	add	x2, x2, 200
	mov	w0, 0
	bl	dprint_vfmw
.L961:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
.L949:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L965:
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
	cbnz	w0, .L966
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
	cbnz	w0, .L967
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
	cbnz	w0, .L968
	str	w27, [x23, 344]
	bl	HEVCDEC_AllocHevcGlbMem
	cbz	w0, .L949
	ldr	x1, .LC574
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L949
	.p2align 3
.L964:
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
	b	.L949
	.p2align 3
.L945:
	ldr	x1, .LC560
	mov	w2, -121438208
.L960:
	mov	w0, 0
	bl	dprint_vfmw
	b	.L961
	.p2align 3
.L946:
	mov	w2, 53248
	ldr	x1, .LC560
	movk	w2, 0xf8c3, lsl 16
	b	.L960
.L966:
	ldr	x1, .LC569
	mov	w2, 127
	b	.L960
.L967:
	ldr	x1, .LC569
	mov	w2, 136
	b	.L960
.L968:
	ldr	x1, .LC569
	mov	w2, 181
	b	.L960
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
	cbz	x19, .L1002
	ldr	x20, .LC581
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x22, .LC582
	ldr	w19, [x22, 256]
	cbnz	w19, .L1001
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
	cbz	x0, .L973
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L993
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1003
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
	bhi	.L978
.L1008:
	mov	w0, 5000
	mov	w1, -5000
	cmp	w2, w0
	csel	w0, w2, w0, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
.L974:
	str	w0, [x21, 3696]
.L976:
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
	cbz	x0, .L979
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L980
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1004
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
	bhi	.L984
.L1009:
	mov	w19, 5000
	mov	w0, -5000
	cmp	w2, w19
	csel	w19, w2, w19, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
.L980:
	str	w19, [x21, 3700]
.L982:
	ldr	x23, .LC598
	str	xzr, [x29, 72]
	ldr	w0, [x23, 384]
	cbz	w0, .L985
	ldr	x2, .LC599
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x23, 388]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 96]
	strb	w1, [x23, 389]
	strb	w0, [x23, 390]
.L986:
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
.L990:
	str	w2, [x0], 4
	cmp	x1, x0
	bne	.L990
	ldr	x3, [x20, 96]
	mov	x2, 128
	mov	w1, 0
	add	x0, x23, 400
	add	x19, x22, 288
	blr	x3
	mov	x0, x19
	bl	OpenDrivers
	cbnz	w0, .L1001
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC606
	add	x0, x22, 272
	ldr	x1, .LC608
	ldr	x3, [x20, 400]
	blr	x3
	cbnz	w0, .L1005
	mov	w1, 1
	str	w1, [x22, 256]
.L971:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L985:
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
	cbz	x0, .L986
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1006
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1007
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x23, 384]
.L988:
	ldr	x2, .LC599
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x23, 388]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 96]
	strb	w0, [x23, 389]
	strb	w1, [x23, 390]
	b	.L986
.L973:
	ldr	w2, [x21, 3696]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1008
.L978:
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
	b	.L974
.L979:
	ldr	w2, [x21, 3700]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1009
.L984:
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
	b	.L980
.L993:
	mov	w0, 0
	b	.L974
.L1006:
	ldr	w1, [x23, 384]
	b	.L988
.L1005:
	mov	x0, x19
	bl	CloseDrivers
.L1001:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
.L1004:
	ldr	x2, .LC579
	mov	w3, 6032
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 256
	bl	dprint_vfmw
	b	.L982
.L1003:
	ldr	x2, .LC579
	mov	w3, 5990
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 232
	bl	dprint_vfmw
	b	.L976
.L1007:
	ldr	x2, .LC579
	mov	w3, 6083
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 280
	bl	dprint_vfmw
	b	.L986
.L1002:
	ldr	x2, .LC579
	mov	w3, 938
	ldr	x4, .LC578
	mov	w0, 0
	ldr	x1, .LC580
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w0, -1
	b	.L971
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
	beq	.L1015
	cmp	w19, w22
	mov	w19, w21
	blt	.L1016
.L1012:
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
.L1016:
	ldr	x1, .LC617
	mov	w0, 30
	mov	w19, 3
	bl	dprint_vfmw
	b	.L1012
	.p2align 3
.L1015:
	cmp	w20, w22
	mov	w19, w21
	ble	.L1012
	ldr	x1, .LC615
	mov	w0, 30
	mov	w19, 0
	bl	dprint_vfmw
	b	.L1012
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
	b	.L1020
	.p2align 3
.L1018:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1026
.L1020:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 507904
	add	x1, x1, 2096
	cbz	x2, .L1018
	cmp	x19, x1
	bne	.L1018
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1026:
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
.L1032:
	ldr	x4, [x6, x5, lsl 3]
	mov	w0, w5
	cbz	x4, .L1028
	add	x1, x4, 503808
	add	x4, x4, 507904
	add	x1, x1, 2032
	add	x4, x4, 240
	.p2align 2
.L1031:
	ldr	w2, [x1]
	cmp	w2, w19
	bhi	.L1029
	ldr	w3, [x1, -20]
	add	w2, w2, w3
	cmp	w19, w2
	bcc	.L1030
.L1029:
	add	x1, x1, 72
	cmp	x1, x4
	bne	.L1031
.L1028:
	add	x5, x5, 1
	cmp	x5, 32
	bne	.L1032
	mov	w0, -1
.L1030:
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
	beq	.L1070
	cmp	w2, 6
	sub	w0, w2, #2
	ccmp	w2, 18, 4, ne
	ccmp	w0, 1, 0, ne
	bls	.L1041
.L1042:
	ldr	x2, [x19, 40]
	cmn	x2, #1
	beq	.L1071
	str	x2, [x4, 744]
.L1052:
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
.L1070:
	add	x0, x4, 507904
	ldr	x0, [x0, 2096]
	ldrsb	w0, [x0, 604]
	cmp	w0, 1
	bne	.L1042
.L1041:
	add	x3, x19, 8
	add	x1, x4, 1280
	mov	w0, w20
	bl	IsNewpicSeg
	cbz	w0, .L1072
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	beq	.L1048
.L1047:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	beq	.L1049
.L1069:
	str	x1, [x0, 752]
.L1049:
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
.L1048:
	ldr	x2, [x0, 760]
	mov	w0, 29
	ldr	x1, .LC626
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1072:
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	ldr	x1, [x0, 752]
	beq	.L1068
	cmn	x1, #1
	beq	.L1045
.L1068:
	str	x1, [x0, 744]
.L1045:
	ldr	x3, [x0, 768]
	mov	x2, -1
	ldr	x1, [x0, 784]
	str	x2, [x0, 752]
	str	x3, [x0, 760]
	str	x1, [x0, 776]
	cbnz	x1, .L1046
	ldr	x1, [x19, 64]
	str	x1, [x0, 776]
.L1046:
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
	bne	.L1047
	ldr	x1, [x19, 40]
	b	.L1069
	.p2align 3
.L1071:
	ldr	x2, [x4, 744]
	b	.L1052
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
	bhi	.L1074
	ldr	x1, .LC630
	ldr	w1, [x1, 2200]
	tbz	x1, 0, .L1075
.L1074:
	and	w1, w0, -17
	cmp	w1, 4
	ccmp	w0, 14, 4, ne
	beq	.L1075
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L1077
.L1075:
	mov	w0, 0
.L1076:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1077:
	mov	w0, -2
	b	.L1076
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
	bhi	.L1118
	ldr	x21, .LC634
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1119
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1120
	ldr	w1, [x0, 24]
	cbnz	w1, .L1121
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
	bls	.L1090
	str	w2, [x1, w19, sxtw 2]
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	beq	.L1122
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1100
	mov	w20, w0
.L1101:
	ldr	x1, [x21, w19, sxtw 3]
	add	x0, x1, 475136
	ldr	w3, [x0, 2360]
	cmp	w3, 1
	beq	.L1123
	cmp	w3, 3
	beq	.L1124
	add	x24, x1, 824
	ldrb	w0, [x24, 1]
	cbnz	w0, .L1094
	ldr	w0, [x1, 1672]
	cbz	w0, .L1125
.L1094:
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
	bne	.L1126
.L1096:
	ldr	x1, [x21, w19, sxtw 3]
	mov	x0, x24
	add	x2, x1, 507904
	ldr	w1, [x1, 672]
	add	x2, x2, 2096
	bl	DecodeStream
	mov	w0, 4
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L1097
.L1098:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1090:
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	bne	.L1127
.L1107:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1127:
	mov	w0, w19
	mov	w20, -3
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1107
	mov	w20, 0
	b	.L1101
	.p2align 3
.L1122:
	ldr	x1, .LC643
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1107
	.p2align 3
.L1097:
	ldr	x0, [x23]
	add	x22, x22, 656
	blr	x0
	mov	w1, w0
	ldr	x2, .LC654
	ldr	w0, [x22, w19, sxtw 2]
	ldr	w2, [x2]
	sub	w0, w1, w0
	cmp	w0, w2
	bls	.L1098
	mov	w0, w19
	str	w1, [x22, w19, sxtw 2]
	bl	VCTRL_GetDecParam
	cbz	x0, .L1098
	ldr	x0, .LC632
	lsl	w2, w19, 24
	add	w2, w2, 262144
	mov	w1, 5746
	add	x0, x0, 312
	mov	w20, 0
	bl	DBG_AddTrace
	b	.L1107
.L1123:
	ldr	x1, .LC647
	mov	w0, 31
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1107
	.p2align 3
.L1100:
	ldr	x1, .LC645
	mov	w2, w19
	mov	w0, 23
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1107
	.p2align 3
.L1120:
	ldr	x2, .LC632
	mov	w3, 5646
	ldr	x4, .LC636
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1107
	.p2align 3
.L1121:
	ldr	x2, .LC632
	mov	w3, 5647
	ldr	x4, .LC638
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1107
	.p2align 3
.L1125:
	add	x1, x1, 832
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L1094
	cmp	w20, 1
	beq	.L1128
.L1095:
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 1
	mov	w20, -4
	str	w1, [x0, 512]
	b	.L1107
	.p2align 3
.L1118:
	ldr	x2, .LC632
	mov	w3, 5644
	ldr	x4, .LC631
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1107
	.p2align 3
.L1126:
	ldr	x0, .LC632
	lsl	w2, w19, 24
	add	w2, w2, 196608
	mov	w1, 5728
	add	x0, x0, 312
	bl	DBG_AddTrace
	b	.L1096
.L1119:
	ldr	x2, .LC632
	mov	w3, 5645
	ldr	x4, .LC635
	mov	w20, -1
	ldr	x1, .LC633
	add	x2, x2, 296
	bl	dprint_vfmw
	b	.L1107
.L1124:
	ldr	w2, [x1, 1616]
	mov	w0, 31
	ldr	x1, .LC649
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1107
.L1128:
	ldr	x1, .LC651
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1095
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
	b	.L1132
	.p2align 3
.L1160:
	ldr	w1, [x1, 20]
	str	w1, [x2, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1159
.L1132:
	ldr	x1, [x21, x0, lsl 3]
	add	x2, x23, 784
	cbnz	x1, .L1160
	add	x1, x23, 784
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1132
.L1159:
	ldr	x24, .LC659
	mov	w20, -1
	.p2align 2
.L1133:
	ldr	w3, [x23, 784]
	add	x1, x23, 788
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L1134:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L1161
.L1136:
	ldr	w2, [x1]
	add	x1, x1, 4
	cmp	w3, w2
	bge	.L1134
	mov	w19, w0
	add	w0, w0, 1
	cmp	w0, 32
	mov	w3, w2
	bne	.L1136
.L1161:
	add	x2, x23, 784
	add	x0, x21, 256
	add	w1, w19, 1
	cmp	w3, wzr
	sxtw	x25, w19
	str	wzr, [x2, w19, sxtw 2]
	str	w1, [x0, 28]
	ble	.L1137
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1133
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1133
	ldr	w1, [x0, 76]
	cmp	w1, wzr
	ble	.L1139
	ldr	w0, [x0, 80]
	cbz	w0, .L1162
.L1139:
	mov	w22, 500
	b	.L1147
	.p2align 3
.L1142:
	ldr	x0, [x21, x25, lsl 3]
	cbnz	w20, .L1145
	ldr	w1, [x0, 1704]
	cmp	w1, 1
	beq	.L1145
	subs	w22, w22, #1
	beq	.L1133
.L1147:
	mov	w0, w19
	bl	DecChanSyntax
	cmn	w0, #1
	mov	w20, w0
	bne	.L1142
	ldr	x4, [x23, 392]
	cbz	x4, .L1143
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w0, w19
	blr	x4
.L1143:
	mov	w0, w20
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L1145:
	str	wzr, [x0, 1704]
	b	.L1133
.L1162:
	add	x1, x29, 88
	mov	w0, w19
	bl	SM_GetInfo
	cbnz	w0, .L1163
.L1140:
	ldr	x20, [x21, x25, lsl 3]
	ldr	w1, [x29, 100]
	ldr	w2, [x20, 76]
	ldr	w0, [x20, 688]
	bl	GetNextDecodeMode
	str	w0, [x20, 688]
	ldr	x1, [x21, x25, lsl 3]
	ldr	w0, [x1, 688]
	cbz	w0, .L1141
	str	wzr, [x1, 680]
	str	wzr, [x1, 684]
	b	.L1139
.L1137:
	str	wzr, [x0, 28]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
.L1141:
	ldr	w0, [x1, 72]
	str	w0, [x1, 680]
	str	w0, [x1, 684]
	b	.L1139
.L1163:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 88
	blr	x3
	b	.L1140
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
	beq	.L1173
.L1165:
	ldr	w0, [x20, 1132]
	mov	w1, 100
	str	w1, [x20, 280]
	cmp	w0, wzr
	ldr	x21, .LC663
	ble	.L1166
	ldr	x1, [x21, 240]
	blr	x1
.L1166:
	ldr	x1, [x21, 24]
	mov	w0, 0
	mov	w22, 0
	blr	x1
	bl	SM_Wakeup
	ldr	w0, [x20, 1128]
	mov	w1, 101
	str	w1, [x20, 280]
	cbz	w0, .L1174
.L1167:
	mov	w0, 102
	mov	w19, 0
	str	w0, [x20, 280]
	bl	VDMDRV_WakeUpVdm
	.p2align 2
.L1168:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 32
	bne	.L1168
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
.L1174:
	bl	DecSyntax
	mov	w22, w0
	b	.L1167
.L1173:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 2824]
	b	.L1165
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
.L1176:
.L1183:
	mov	x1, x25
	mov	w0, 2
	str	wzr, [x20, 280]
	bl	dprint_vfmw
	str	w21, [x20, 260]
	ldr	w0, [x20, 264]
	cmp	w0, 2
	bne	.L1198
	b	.L1181
	.p2align 3
.L1200:
	str	w21, [x20, 280]
	bl	VCTRL_RunProcess
	mov	x1, x22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x20, 264]
	cmp	w0, 2
	beq	.L1181
.L1198:
	cmp	w0, 3
	bne	.L1200
.L1179:
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
.L1181:
	mov	w2, 4
	mov	x1, x26
	mov	w0, 2
	str	w2, [x20, 280]
	mov	w27, 5
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x20, 260]
	b	.L1178
	.p2align 3
.L1201:
	ldr	x1, [x24, 240]
	blr	x1
.L1178:
	mov	x1, x23
	mov	w0, 22
	str	w27, [x20, 280]
	bl	dprint_vfmw
	ldr	w1, [x20, 264]
	mov	w0, 10
	cmp	w1, 1
	beq	.L1183
	cmp	w1, 3
	bne	.L1201
	b	.L1179
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
	cbz	x0, .L1220
	ldr	w1, [x0, 672]
	cmp	w1, 20
	bls	.L1221
.L1220:
	mov	x0, 0
.L1203:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1221:
	ldr	x2, .LC678
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1205
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1205:
	.section	.rodata
	.align	0
	.align	2
.L1205:
	.byte	(.L1218 - .Lrtx1205) / 4
	.byte	(.L1206 - .Lrtx1205) / 4
	.byte	(.L1207 - .Lrtx1205) / 4
	.byte	(.L1208 - .Lrtx1205) / 4
	.byte	(.L1220 - .Lrtx1205) / 4
	.byte	(.L1209 - .Lrtx1205) / 4
	.byte	(.L1210 - .Lrtx1205) / 4
	.byte	(.L1220 - .Lrtx1205) / 4
	.byte	(.L1211 - .Lrtx1205) / 4
	.byte	(.L1212 - .Lrtx1205) / 4
	.byte	(.L1213 - .Lrtx1205) / 4
	.byte	(.L1213 - .Lrtx1205) / 4
	.byte	(.L1213 - .Lrtx1205) / 4
	.byte	(.L1214 - .Lrtx1205) / 4
	.byte	(.L1220 - .Lrtx1205) / 4
	.byte	(.L1215 - .Lrtx1205) / 4
	.byte	(.L1216 - .Lrtx1205) / 4
	.byte	(.L1217 - .Lrtx1205) / 4
	.byte	(.L1220 - .Lrtx1205) / 4
	.byte	(.L1220 - .Lrtx1205) / 4
	.byte	(.L1218 - .Lrtx1205) / 4
	.text
	.p2align 3
.L1218:
	add	x0, x0, 507904
	ldr	x19, [sp, 16]
	add	x0, x0, 2104
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1216:
	add	x0, x0, 512000
	add	x0, x0, 4064
	b	.L1203
	.p2align 3
.L1215:
	add	x0, x0, 507904
	add	x0, x0, 3008
	b	.L1203
	.p2align 3
.L1214:
	add	x0, x0, 516096
	add	x0, x0, 2136
	b	.L1203
	.p2align 3
.L1213:
	add	x0, x0, 520192
	add	x0, x0, 2568
	b	.L1203
	.p2align 3
.L1217:
	add	x0, x0, 782336
	add	x0, x0, 3512
	b	.L1203
	.p2align 3
.L1206:
	add	x0, x0, 561152
	add	x0, x0, 2392
	b	.L1203
	.p2align 3
.L1208:
	add	x0, x0, 598016
	add	x0, x0, 784
	b	.L1203
	.p2align 3
.L1207:
	add	x0, x0, 532480
	add	x0, x0, 240
	b	.L1203
	.p2align 3
.L1212:
	add	x0, x0, 561152
	add	x0, x0, 3792
	b	.L1203
	.p2align 3
.L1211:
	add	x0, x0, 561152
	add	x0, x0, 3816
	b	.L1203
	.p2align 3
.L1210:
	add	x0, x0, 524288
	add	x0, x0, 1976
	b	.L1203
	.p2align 3
.L1209:
	add	x0, x0, 548864
	add	x0, x0, 3760
	b	.L1203
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC677:
	.xword	.LANCHOR1
	.align	3
.LC678:
	.xword	.L1205
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
	bhi	.L1238
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1232
	add	x2, x29, 48
	add	x1, x29, 40
	str	wzr, [x29, 40]
	str	wzr, [x2, -4]!
	bl	GetQueueImgNum
	ldr	w2, [x29, 40]
	mov	w0, -1
	cbz	w2, .L1224
	cmp	w2, 32
	bhi	.L1239
.L1226:
	ldr	x1, .LC684
	ldrh	w0, [x20, 4]
	ldr	x5, [x1, w19, sxtw 3]
	and	x0, x0, 63
	add	x0, x0, 2
	add	x6, x5, 507904
	ldr	x4, [x20, x0, lsl 3]
	ldr	w3, [x6, 2016]
	cmp	w3, 32
	bhi	.L1227
	mov	w1, 1
	b	.L1229
	.p2align 3
.L1230:
	ldrh	w0, [x20, 4]
	cmp	w3, 33
	add	w0, w0, w1
	add	w1, w1, 1
	and	x0, x0, 63
	add	x0, x0, 2
	ldr	x4, [x20, x0, lsl 3]
	beq	.L1227
.L1229:
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
	bcc	.L1230
	mov	w0, 0
.L1224:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1227:
	ldr	x1, .LC686
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1224
	.p2align 3
.L1239:
	ldr	x1, .LC683
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 40]
	cbnz	w2, .L1226
	mov	w0, 0
	b	.L1224
.L1232:
	mov	w0, -1
	b	.L1224
.L1238:
	ldr	x2, .LC680
	mov	w3, 3265
	ldr	x4, .LC679
	mov	w0, 0
	ldr	x1, .LC681
	add	x2, x2, 328
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1224
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
	bhi	.L1257
	cbz	x19, .L1258
	mov	w0, w22
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1250
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
	cbnz	w2, .L1259
	ldr	x6, .LC694
	ldr	x4, [x6, w22, sxtw 3]
	add	x0, x4, 507904
	ldr	w0, [x0, 2016]
	cbz	w0, .L1248
	mov	w2, 0
	sxtw	x0, w22
	.p2align 2
.L1249:
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
	bcc	.L1249
	str	w1, [x19, 528]
	b	.L1248
	.p2align 3
.L1259:
	cmp	w2, 32
	bhi	.L1260
.L1245:
	mov	w0, 0
	.p2align 2
.L1247:
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
	bhi	.L1247
	uxth	w1, w2
.L1246:
	ldrh	w0, [x20, 4]
	add	w0, w1, w0
	and	w0, w0, 63
	strh	w0, [x20, 4]
	str	w2, [x19, 528]
.L1248:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, 0
.L1242:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1260:
	ldr	x1, .LC693
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 72]
	cbnz	w2, .L1245
	mov	w2, 0
	mov	w1, 0
	b	.L1246
.L1250:
	mov	w0, -1
	b	.L1242
.L1257:
	ldr	x2, .LC688
	mov	w3, 3341
	ldr	x4, .LC687
	mov	w0, 0
	ldr	x1, .LC689
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1242
.L1258:
	ldr	x2, .LC688
	mov	w3, 3342
	ldr	x4, .LC691
	mov	w0, 0
	ldr	x1, .LC689
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1242
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
	cbz	x20, .L1274
	cbz	x21, .L1275
	cbz	x22, .L1276
	cmp	w19, 31
	bhi	.L1277
	ldr	x23, .LC704
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L1278
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	cbz	x0, .L1268
	mov	x2, x22
	mov	x1, x21
	bl	GetQueueImgNum
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w3, [x0, 672]
	cbz	w3, .L1279
	cmp	w3, 16
	beq	.L1280
	cmp	w3, 17
	beq	.L1281
	cmp	w3, 15
	beq	.L1282
	cmp	w3, 18
	beq	.L1283
	mov	w0, 2
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1268:
	str	wzr, [x22]
	str	wzr, [x21]
	str	wzr, [x20]
.L1261:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1277:
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
.L1279:
	add	x0, x0, 536576
	ldr	w0, [x0, 1704]
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1280:
	add	x0, x0, 512000
	ldr	w0, [x0, 800]
	str	w0, [x20]
	b	.L1261
	.p2align 3
.L1281:
	mov	w0, 9
	str	w0, [x20]
	b	.L1261
	.p2align 3
.L1274:
	ldr	x2, .LC697
	mov	w3, 5852
	ldr	x4, .LC696
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1261
	.p2align 3
.L1275:
	ldr	x2, .LC697
	mov	w3, 5853
	ldr	x4, .LC700
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1261
	.p2align 3
.L1276:
	ldr	x2, .LC697
	mov	w3, 5854
	ldr	x4, .LC702
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1261
	.p2align 3
.L1282:
	add	x0, x0, 11632640
	ldr	w0, [x0, 2920]
	str	w0, [x20]
	b	.L1261
	.p2align 3
.L1278:
	ldr	x2, .LC697
	mov	w3, 5856
	ldr	x4, .LC705
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1261
	.p2align 3
.L1283:
	ldr	x2, .LC697
	mov	w0, 32
	ldr	x1, .LC707
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1261
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
	cbz	x19, .L1294
	cmp	w20, 31
	bhi	.L1295
	ldr	x21, .LC715
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L1296
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
	add	x0, x5, 475136
	ldrsb	w0, [x0, 2331]
	cmp	w0, wzr
	ble	.L1292
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
.L1291:
	ldrsb	w2, [x0], 92
	cmp	w2, 3
	csinc	w1, w1, w1, ne
	cmp	x0, x3
	bne	.L1291
.L1289:
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
	mov	x0, 63536
	ldr	x1, [x21, w20, sxtw 3]
	movk	x0, 0x7, lsl 16
	add	x0, x1, x0
	ldrb	w0, [x0, 3616]
	and	w0, w0, 1
	str	w0, [x19, 88]
.L1284:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1295:
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
.L1296:
	ldr	x2, .LC712
	mov	w3, 1263
	ldr	x4, .LC716
	ldr	x1, .LC713
	add	x2, x2, 408
	bl	dprint_vfmw
	b	.L1284
.L1292:
	mov	w1, 0
	b	.L1289
.L1294:
	ldr	x2, .LC712
	mov	w3, 1261
	ldr	x4, .LC711
	mov	w0, 0
	ldr	x1, .LC713
	add	x2, x2, 408
	bl	dprint_vfmw
	b	.L1284
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
	bhi	.L1301
	ldr	x0, .LC723
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1302
	ldr	w0, [x0, 1412]
.L1299:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1301:
	ldr	x2, .LC721
	mov	w3, 5919
	ldr	x4, .LC720
	mov	w0, 0
	ldr	x1, .LC722
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1299
.L1302:
	ldr	x2, .LC721
	mov	w3, 5920
	ldr	x4, .LC724
	ldr	x1, .LC722
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1299
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
	bhi	.L1307
	ldr	x0, .LC728
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1308
	ldr	w0, [x0, 1416]
.L1305:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1307:
	ldr	x2, .LC726
	mov	w3, 5927
	ldr	x4, .LC725
	mov	w0, 0
	ldr	x1, .LC727
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1305
.L1308:
	ldr	x2, .LC726
	mov	w3, 5928
	ldr	x4, .LC729
	ldr	x1, .LC727
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1305
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
	bhi	.L1313
	ldr	x0, .LC733
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1312
	ldr	w0, [x0, 36]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1313:
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
.L1312:
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
	bhi	.L1319
.L1315:
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
	bhi	.L1320
.L1316:
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
.L1319:
	ldr	x1, .LC736
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w2, [x20, 3696]
	b	.L1315
	.p2align 3
.L1320:
	ldr	x1, .LC738
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w19, [x20, 3700]
	b	.L1316
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
	cbz	w19, .L1325
	ldr	x3, .LC741
	mov	w1, 1
	ldr	x0, .LC739
	add	x3, x3, 504
	b	.L1323
	.p2align 3
.L1324:
	ldr	w4, [x3, x4]
	add	w1, w1, 1
	ubfiz	x2, x1, 4, 32
	cmp	w4, w19
	add	x2, x3, x2
	beq	.L1322
	ldr	x0, [x2, 8]
.L1323:
	ubfiz	x4, x1, 4, 32
	cbnz	x0, .L1324
.L1322:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1325:
	ldr	x0, .LC740
	b	.L1322
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
	cbz	x20, .L1336
	cbz	w19, .L1333
	ldr	x4, .LC745
	mov	w0, 1
	ldr	x5, .LC743
	add	x4, x4, 504
	b	.L1329
	.p2align 3
.L1334:
	ldr	w6, [x4, x6]
	add	w0, w0, 1
	ubfiz	x3, x0, 4, 32
	cmp	w19, w6
	add	x3, x4, x3
	beq	.L1328
	ldr	x5, [x3, 8]
.L1329:
	ubfiz	x6, x0, 4, 32
	cbnz	x5, .L1334
	ldr	x1, .LC747
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
.L1336:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1333:
	ldr	x5, .LC744
.L1328:
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
	bhi	.L1343
	ldr	x0, .LC749
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1337
	str	w20, [x0, 516]
.L1337:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1343:
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
	cbz	w20, .L1351
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 31
	bhi	.L1358
.L1348:
	ldr	x21, .LC750
	ldr	x1, [x21, w19, sxtw 3]
	cbz	x1, .L1349
	str	w0, [x1, 516]
.L1349:
	ldr	x0, .LC751
	ldr	x4, [x0, 392]
	cbz	x4, .L1350
	add	x2, x29, 64
	mov	w3, 4
	mov	w1, 115
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L1350:
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
.L1351:
	cmp	w19, 31
	mov	w0, 2
	bls	.L1348
.L1358:
	bl	VCTRL_SetLastFrameState.part.24
	ldr	x21, .LC750
	b	.L1349
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
	bhi	.L1386
	ldr	x0, .LC757
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1387
	add	x0, x0, 507904
	ldr	w1, [x0, 2088]
	cmp	w1, 17
	bls	.L1388
.L1379:
	mov	w1, 1
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC761
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, -1
.L1361:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1388:
	ldr	x2, .LC759
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1365
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1365:
	.section	.rodata
	.align	0
	.align	2
.L1365:
	.byte	(.L1364 - .Lrtx1365) / 4
	.byte	(.L1366 - .Lrtx1365) / 4
	.byte	(.L1367 - .Lrtx1365) / 4
	.byte	(.L1368 - .Lrtx1365) / 4
	.byte	(.L1379 - .Lrtx1365) / 4
	.byte	(.L1369 - .Lrtx1365) / 4
	.byte	(.L1370 - .Lrtx1365) / 4
	.byte	(.L1379 - .Lrtx1365) / 4
	.byte	(.L1371 - .Lrtx1365) / 4
	.byte	(.L1372 - .Lrtx1365) / 4
	.byte	(.L1373 - .Lrtx1365) / 4
	.byte	(.L1373 - .Lrtx1365) / 4
	.byte	(.L1373 - .Lrtx1365) / 4
	.byte	(.L1374 - .Lrtx1365) / 4
	.byte	(.L1379 - .Lrtx1365) / 4
	.byte	(.L1375 - .Lrtx1365) / 4
	.byte	(.L1376 - .Lrtx1365) / 4
	.byte	(.L1377 - .Lrtx1365) / 4
	.text
	.p2align 3
.L1377:
	add	x0, x0, 2096
	bl	VP9DEC_GetRemainImg
	mov	w19, w0
	.p2align 2
.L1363:
	cmn	w19, #1
	beq	.L1379
	cbnz	w19, .L1389
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
.L1376:
	add	x0, x0, 2096
	bl	HEVCDEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1375:
	add	x0, x0, 2096
	bl	MVC_DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1374:
	add	x0, x0, 2096
	bl	VP8DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1373:
	add	x0, x0, 2096
	bl	VP6DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1372:
	add	x0, x0, 2096
	bl	REAL9DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1371:
	add	x0, x0, 2096
	bl	REAL8DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1370:
	add	x0, x0, 2096
	bl	AVSDEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1369:
	add	x0, x0, 2096
	bl	DIVX3DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1368:
	add	x0, x0, 2096
	bl	MPEG2DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1367:
	add	x0, x0, 2096
	bl	MPEG4DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1366:
	add	x0, x0, 2096
	bl	VC1DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1364:
	add	x0, x0, 2096
	bl	H264DEC_GetRemainImg
	mov	w19, w0
	b	.L1363
	.p2align 3
.L1389:
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
.L1386:
	ldr	x2, .LC755
	mov	w3, 7212
	ldr	x4, .LC754
	mov	w0, 0
	ldr	x1, .LC756
	add	x2, x2, 1224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1361
.L1387:
	ldr	x2, .LC755
	mov	w3, 7213
	ldr	x4, .LC758
	ldr	x1, .LC756
	add	x2, x2, 1224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1361
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
	.xword	.L1365
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
	cbz	x0, .L1424
	ldr	w1, [x0, 672]
	ldr	w24, [x0, 1352]
	cmp	w1, 17
	bls	.L1425
.L1390:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1425:
	ldr	x2, .LC770
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx1394
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx1394:
	.section	.rodata
	.align	0
	.align	2
.L1394:
	.2byte	(.L1393 - .Lrtx1394) / 4
	.2byte	(.L1395 - .Lrtx1394) / 4
	.2byte	(.L1396 - .Lrtx1394) / 4
	.2byte	(.L1397 - .Lrtx1394) / 4
	.2byte	(.L1390 - .Lrtx1394) / 4
	.2byte	(.L1398 - .Lrtx1394) / 4
	.2byte	(.L1399 - .Lrtx1394) / 4
	.2byte	(.L1390 - .Lrtx1394) / 4
	.2byte	(.L1400 - .Lrtx1394) / 4
	.2byte	(.L1401 - .Lrtx1394) / 4
	.2byte	(.L1402 - .Lrtx1394) / 4
	.2byte	(.L1402 - .Lrtx1394) / 4
	.2byte	(.L1402 - .Lrtx1394) / 4
	.2byte	(.L1403 - .Lrtx1394) / 4
	.2byte	(.L1390 - .Lrtx1394) / 4
	.2byte	(.L1404 - .Lrtx1394) / 4
	.2byte	(.L1405 - .Lrtx1394) / 4
	.2byte	(.L1406 - .Lrtx1394) / 4
	.text
	.p2align 3
.L1406:
	add	x0, x0, 507904
	mov	w3, w22
	mov	w2, w24
	mov	w1, w20
	add	x0, x0, 2096
	bl	VP9DEC_VDMPostProc
	cmp	w24, 1
	beq	.L1390
.L1422:
	ldr	x0, [x21, w19, sxtw 3]
.L1423:
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1405:
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
	ldrb	w0, [x0, 2105]
	cmp	w0, 1
	beq	.L1426
.L1409:
	cmp	w24, 1
	beq	.L1390
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 512000
	str	xzr, [x0, 480]
	b	.L1390
	.p2align 3
.L1404:
	add	x0, x0, 507904
	mov	w1, w20
	mov	w2, 1
	add	x0, x0, 2096
	bl	MVC_DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	ldrb	w1, [x0, 2097]
	cmp	w1, 1
	beq	.L1427
	str	xzr, [x0, 2328]
	b	.L1390
	.p2align 3
.L1403:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	VP8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	b	.L1390
	.p2align 3
.L1402:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	VP6DEC_VDMPostProc
	b	.L1422
	.p2align 3
.L1401:
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
	b	.L1390
	.p2align 3
.L1400:
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
	b	.L1390
	.p2align 3
.L1399:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	AVSDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	ldrb	w1, [x0, 2096]
	cmp	w1, 1
	beq	.L1428
	str	xzr, [x0, 2120]
	b	.L1390
	.p2align 3
.L1398:
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
	b	.L1390
	.p2align 3
.L1397:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 598016
	ldrb	w1, [x1, 1410]
	cmp	w1, 1
	bne	.L1423
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 598016
	strb	wzr, [x1, 1410]
	b	.L1423
	.p2align 3
.L1396:
	add	x0, x0, 507904
	mov	w1, w20
	mov	x2, x23
	add	x0, x0, 2096
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 532480
	ldrb	w1, [x1, 884]
	cmp	w1, 1
	beq	.L1429
.L1412:
	add	x0, x0, 507904
	str	xzr, [x0, 3136]
	b	.L1390
	.p2align 3
.L1395:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	VC1DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 524288
	ldrb	w1, [x1, 527]
	cmp	w1, 1
	bne	.L1423
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 524288
	strb	wzr, [x1, 527]
	b	.L1423
	.p2align 3
.L1393:
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
	beq	.L1430
.L1407:
	cmp	w24, 1
	beq	.L1390
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2712]
	b	.L1390
	.p2align 3
.L1428:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2096]
	str	xzr, [x0, 2120]
	b	.L1390
	.p2align 3
.L1427:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2097]
	str	xzr, [x0, 2328]
	b	.L1390
	.p2align 3
.L1424:
	ldr	x2, .LC768
	mov	w3, 4215
	ldr	x4, .LC767
	ldr	x1, .LC769
	add	x2, x2, 1248
	bl	dprint_vfmw
	b	.L1390
	.p2align 3
.L1429:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 532480
	strb	wzr, [x1, 884]
	b	.L1412
.L1430:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 524288
	strb	wzr, [x0, 640]
	b	.L1407
.L1426:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2105]
	b	.L1409
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
	.xword	.L1394
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
	bhi	.L1439
	ldr	x0, .LC774
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1440
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L1435
	ldr	x2, .LC772
	mov	w3, 4405
	ldr	x4, .LC776
	mov	w0, 0
	ldr	x1, .LC773
	add	x2, x2, 1264
	bl	dprint_vfmw
.L1431:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1435:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L1431
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
.L1439:
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
.L1440:
	ldr	x2, .LC772
	mov	w3, 4404
	ldr	x4, .LC775
	ldr	x1, .LC773
	add	x2, x2, 1264
	bl	dprint_vfmw
	b	.L1431
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
	bhi	.L1444
	add	w1, w20, 2
	mov	w0, w19
	bl	VCTRL_ReportLastFrame
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1444:
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
	bls	.L1463
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
.L1463:
	ldr	x0, .LC780
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1448
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1448:
	.section	.rodata
	.align	0
	.align	2
.L1448:
	.byte	(.L1447 - .Lrtx1448) / 4
	.byte	(.L1449 - .Lrtx1448) / 4
	.byte	(.L1450 - .Lrtx1448) / 4
	.byte	(.L1451 - .Lrtx1448) / 4
	.byte	(.L1452 - .Lrtx1448) / 4
	.byte	(.L1453 - .Lrtx1448) / 4
	.byte	(.L1454 - .Lrtx1448) / 4
	.text
	.p2align 3
.L1453:
	cmp	w20, 1
	mov	w1, 12
	mov	w0, 13
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1454:
	cmp	w20, 1
	mov	w0, 7
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1447:
	cmp	w20, 1
	mov	w0, 6
	csel	w0, wzr, w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1449:
	cmp	w20, 1
	mov	w1, 8
	mov	w0, 2
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1450:
	cmp	w20, 1
	mov	w1, 10
	mov	w0, 4
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1451:
	cmp	w20, 1
	mov	w1, 9
	mov	w0, 3
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1452:
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
	.xword	.L1448
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
	beq	.L1473
	ldr	w0, [x20, 4]
	cmp	w0, 1
	beq	.L1467
	mov	w0, w21
	mov	w2, 0
	mov	w1, w22
	bl	FSP_ClearLogicFs
	mov	w0, 0
.L1466:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1467:
	ldr	w0, [x20, 48]
	bl	MEM_Phy2Vir
	cbz	x0, .L1474
.L1468:
	mov	w1, w22
	mov	w0, w21
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L1475
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
	beq	.L1476
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
	add	x2, x2, 507904
	add	x3, x2, 2104
	add	x2, x2, 2096
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w0, 0
	beq	.L1466
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
	b	.L1466
	.p2align 3
.L1474:
	ldr	w0, [x20, 4]
	cmp	w0, 1
	bne	.L1468
	ldr	x1, .LC786
	mov	w0, 0
	ldr	w2, [x20, 48]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1466
.L1473:
	ldr	x1, .LC784
	mov	w0, 0
	ldr	w2, [x20, 40]
	bl	dprint_vfmw
	mov	w0, w22
	b	.L1466
.L1476:
	ldr	x1, .LC791
	mov	w2, w0
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1466
.L1475:
	ldr	x1, .LC788
	mov	w2, 4698
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1466
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
	cbz	x0, .L1485
	cbz	x21, .L1486
	ldr	w2, [x0, 672]
	cmp	w2, 20
	bne	.L1487
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
	cbnz	w0, .L1488
.L1479:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1487:
	ldr	x1, .LC800
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1479
	.p2align 3
.L1488:
	ldr	x1, .LC803
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1479
.L1486:
	ldr	x2, .LC795
	mov	w3, 4839
	ldr	x4, .LC798
	mov	w0, 0
	ldr	x1, .LC796
	add	x2, x2, 1312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1479
.L1485:
	ldr	x2, .LC795
	mov	w3, 4838
	ldr	x4, .LC794
	ldr	x1, .LC796
	add	x2, x2, 1312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1479
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
	beq	.L1491
	mov	w0, w19
	bl	VCTRL_CanBeDecodedByHardWare.part.26
.L1491:
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
	beq	.L1496
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1496:
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
	bhi	.L1532
	ldr	x20, .LC806
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L1533
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1501
	ldr	w0, [x0, 672]
	cmp	w0, 22
	beq	.L1501
	cmp	w0, 7
	ccmp	w0, 4, 4, ne
	beq	.L1497
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cbz	w0, .L1497
	mov	x19, 0
	mov	w22, 0
	.p2align 2
.L1506:
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbnz	w0, .L1505
	ldr	x0, [x20, x19, lsl 3]
	ldr	w1, [x0, 672]
	cmp	w1, 4
	mov	w0, w1
	ccmp	w1, 7, 4, ne
	beq	.L1505
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	w0, wzr
	csinc	w22, w22, w22, eq
.L1505:
	add	x19, x19, 1
	cmp	x19, 32
	bne	.L1506
	cmp	w22, 1
	beq	.L1534
.L1507:
	mov	x0, x20
	add	x3, x20, 256
	mov	w2, 0
	.p2align 2
.L1514:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L1513
	ldr	w1, [x1, 672]
	cmp	w1, 6
	csinc	w2, w2, wzr, ne
.L1513:
	cmp	x0, x3
	bne	.L1514
	cmp	w2, 1
	beq	.L1535
.L1515:
	ldr	x0, [x20, w21, sxtw 3]
	ldr	w0, [x0, 672]
	cmp	w0, 1
	bne	.L1497
	ldr	x0, .LC811
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1536
	ldr	x0, .LC812
	ldr	x1, [x0, 56]
	cbz	x1, .L1497
	mov	w0, 0
	blr	x1
	b	.L1497
	.p2align 3
.L1501:
	ldr	x1, .LC810
	mov	w2, 7883
	mov	w0, 0
	bl	dprint_vfmw
.L1497:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1532:
	ldr	x1, .LC805
	mov	w2, 7871
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1534:
	ldr	x19, .LC811
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1537
	mov	w1, 0
	mov	w0, w22
	bl	VDH_Need_Module
.L1510:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1511
	ldr	x0, .LC812
	ldr	x1, [x0, 40]
	cbz	x1, .L1538
	mov	w0, 0
	blr	x1
	b	.L1507
.L1535:
	ldr	x0, .LC811
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1539
	mov	w1, 0
	mov	w0, 3
	bl	VDH_Need_Module
	b	.L1515
.L1539:
	ldr	x0, .LC812
	ldr	x1, [x0, 24]
	cbz	x1, .L1540
	mov	w0, 0
	blr	x1
	b	.L1515
.L1537:
	ldr	x0, .LC812
	ldr	x1, [x0, 8]
	cbz	x1, .L1541
	mov	w0, 0
	blr	x1
	b	.L1510
.L1533:
	ldr	x1, .LC808
	mov	w2, 7877
	bl	dprint_vfmw
	b	.L1497
.L1536:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_Need_Module
	b	.L1497
.L1511:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Need_Module
	b	.L1507
.L1538:
	ldr	x1, .LC813
	mov	w2, 7932
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1507
.L1540:
	ldr	x1, .LC813
	mov	w2, 7963
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1515
.L1541:
	ldr	x1, .LC813
	mov	w2, 7918
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1510
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
	bhi	.L1553
	ldr	x19, .LC818
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1554
	ldr	w21, [x0, 4]
	cmp	w21, 1
	bne	.L1555
	ldr	w0, [x0, 672]
	cmp	w0, 22
	beq	.L1556
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
	cbnz	w0, .L1548
	str	w21, [x1, 20]
	mov	x1, 0
	ldr	x0, .LC823
	ldr	x5, .LC824
	b	.L1551
	.p2align 3
.L1558:
	ldr	w4, [x2, 20]
	str	w4, [x3, x1, lsl 2]
	ldr	w2, [x2, 20]
	str	w2, [x5, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	beq	.L1557
.L1551:
	ldr	x2, [x19, x1, lsl 3]
	add	x3, x0, 3216
	cbnz	x2, .L1558
	add	x2, x0, 3216
	str	wzr, [x5, x1, lsl 2]
	str	wzr, [x2, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	bne	.L1551
	.p2align 2
.L1557:
	add	x0, x0, 3216
	bl	VDMDRV_SetPriority
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
.L1548:
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
.L1544:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1555:
	ldr	x2, .LC816
	mov	w3, 2486
	ldr	x4, .LC820
	mov	w0, 0
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1544
.L1553:
	ldr	x2, .LC816
	mov	w3, 2484
	ldr	x4, .LC815
	mov	w0, 0
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1544
.L1556:
	ldr	x2, .LC816
	mov	w3, 2487
	ldr	x4, .LC822
	mov	w0, 0
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1544
.L1554:
	ldr	x2, .LC816
	mov	w3, 2485
	ldr	x4, .LC819
	ldr	x1, .LC817
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1544
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
	b	.L1569
	.p2align 3
.L1611:
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1608
.L1561:
	add	x19, x19, 8
	cmp	x19, x23
	beq	.L1609
.L1569:
	ldr	x20, [x19]
	cbz	x20, .L1561
	ldr	w21, [x20, 672]
	cbnz	w0, .L1562
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1610
.L1562:
	cmp	w22, wzr
	ccmp	w21, 1, 0, eq
	beq	.L1611
.L1565:
	cmp	w24, wzr
	ccmp	w21, 6, 0, eq
	bne	.L1561
	ldr	w1, [x20, 4]
	cmp	w1, 1
	bne	.L1561
	ldr	w26, [x20, 8]
.L1589:
	cmp	w26, 1
	add	x19, x19, 8
	csinc	w24, w24, wzr, ne
	cmp	x19, x23
	bne	.L1569
	.p2align 2
.L1609:
	cbnz	w0, .L1570
	ldr	x19, .LC834
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1575
	mov	w0, w25
	bl	SCDDRV_ResetSCD
	mov	w0, w25
	bl	VDMDRV_ResetVDH
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1575
	mov	w1, 0
	mov	w0, 1
	bl	VDH_UnNeed_Module
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1578
.L1617:
	ldr	x0, .LC835
	ldr	x1, [x0, 48]
	cbz	x1, .L1612
	mov	w0, 0
	blr	x1
.L1581:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle
.L1570:
	cbnz	w24, .L1582
	ldr	x0, .LC834
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1613
	mov	w1, 0
	mov	w0, 3
	bl	VDH_UnNeed_Module
.L1582:
	cbnz	w22, .L1560
	ldr	x0, .LC834
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1614
	ldr	x0, .LC835
	ldr	x1, [x0, 64]
	cbz	x1, .L1560
	mov	w0, 0
	blr	x1
.L1560:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1610:
	ldr	w26, [x20, 8]
	cmp	w26, 1
	beq	.L1615
.L1564:
	cmp	w21, 1
	ccmp	w22, wzr, 0, eq
	bne	.L1565
.L1588:
	cmp	w26, 1
	csinc	w22, w22, wzr, ne
	cmp	w21, 6
	ccmp	w24, wzr, 0, eq
	beq	.L1589
	b	.L1561
	.p2align 3
.L1615:
	cmp	w21, 4
	ccmp	w21, 7, 4, ne
	beq	.L1564
	mov	w0, w21
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	w0, wzr
	cset	w0, ne
	b	.L1564
.L1575:
	ldr	x0, .LC835
	ldr	x1, [x0, 16]
	cbz	x1, .L1616
	mov	w0, 0
	blr	x1
.L1577:
	mov	w0, 0
	bl	VDMDRV_SetStateIdle
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1617
.L1578:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_UnNeed_Module
	b	.L1570
.L1614:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_UnNeed_Module
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L1613:
	ldr	x0, .LC835
	ldr	x1, [x0, 32]
	cbz	x1, .L1618
	mov	w0, 0
	blr	x1
	b	.L1582
.L1612:
	ldr	x1, .LC836
	mov	w2, 8057
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1581
.L1616:
	ldr	x1, .LC836
	mov	w2, 8042
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1577
.L1618:
	ldr	x1, .LC836
	mov	w2, 8075
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1582
.L1608:
	ldr	w26, [x20, 8]
	b	.L1588
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
	bhi	.L1625
	ldr	x20, .LC841
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1626
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1624
	str	w1, [x0, 24]
	mov	w0, w19
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 12]
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 8]
	bl	SM_Stop
	cbnz	w0, .L1624
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
.L1621:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1624:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1625:
	ldr	x2, .LC839
	mov	w3, 2571
	ldr	x4, .LC838
	mov	w0, 0
	ldr	x1, .LC840
	add	x2, x2, 1352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1621
.L1626:
	ldr	x2, .LC839
	mov	w3, 2572
	ldr	x4, .LC843
	ldr	x1, .LC840
	add	x2, x2, 1352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1621
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
	b	.L1629
	.p2align 3
.L1633:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L1631
.L1629:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L1633
	cmp	w20, 49
	bgt	.L1631
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1631:
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
	bhi	.L1660
	ldr	x20, .LC850
	sxtw	x21, w19
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1661
	ldr	w0, [x22]
	cmp	w0, 1
	bhi	.L1662
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
	beq	.L1663
.L1639:
	ldr	w0, [x0, 672]
	cmp	w0, 20
	beq	.L1640
	ldr	w0, [x22, 8]
	cbz	w0, .L1664
.L1640:
	mov	w0, w19
	bl	FSP_EmptyInstance
.L1641:
	mov	w0, w19
	bl	InitUsdPool
	ldr	w0, [x22]
	cbz	w0, .L1665
.L1642:
	ldr	w0, [x20, 1404]
	cbz	w0, .L1643
	add	x20, x20, 2200
	str	w19, [x29, 76]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1645
	mov	w0, 512
	add	x1, x29, 76
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1645
	add	x1, x29, 76
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1645:
	ldr	x1, .LC857
	mov	w0, 32
	bl	dprint_vfmw
.L1643:
	cbnz	w24, .L1666
.L1647:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1636:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1665:
	mov	w0, w19
	bl	SM_Reset
	b	.L1642
	.p2align 3
.L1666:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1647
	.p2align 3
.L1663:
	add	x1, x0, 507904
	str	wzr, [x0, 1672]
	str	wzr, [x1, 2020]
	b	.L1639
	.p2align 3
.L1664:
	mov	w0, w19
	bl	FSP_ResetInstance
	b	.L1641
	.p2align 3
.L1662:
	ldr	x1, .LC853
	mov	w2, 3151
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1636
	.p2align 3
.L1660:
	ldr	x2, .LC848
	mov	w3, 3146
	ldr	x4, .LC847
	mov	w0, 0
	ldr	x1, .LC849
	add	x2, x2, 1368
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1636
.L1661:
	ldr	x2, .LC848
	mov	w3, 3147
	ldr	x4, .LC851
	mov	w0, 0
	ldr	x1, .LC849
	add	x2, x2, 1368
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1636
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
	bhi	.L1689
	ldr	x20, .LC863
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1690
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
	beq	.L1691
.L1671:
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
	beq	.L1692
.L1672:
	ldr	w0, [x0, 672]
	cmp	w0, 20
	mov	w0, w19
	beq	.L1673
	bl	FSP_ResetInstance
.L1674:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	InitUsdPool
	mov	w0, w19
	bl	SM_Reset
	ldr	w0, [x20, 1404]
	cbz	w0, .L1675
	add	x20, x20, 2200
	str	w19, [x29, 60]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1677
	mov	w0, 512
	add	x1, x29, 60
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1677
	add	x1, x29, 60
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1677:
	ldr	x1, .LC867
	mov	w0, 32
	bl	dprint_vfmw
.L1675:
	cbnz	w22, .L1693
.L1679:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1669:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1693:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1679
	.p2align 3
.L1673:
	bl	FSP_EmptyInstance
	b	.L1674
	.p2align 3
.L1692:
	str	wzr, [x0, 1672]
	str	wzr, [x1, 2020]
	b	.L1672
	.p2align 3
.L1691:
	add	x1, x0, 507904
	ldr	w2, [x0, 672]
	ldr	w1, [x1, 2088]
	cmp	w1, w2
	bne	.L1671
	str	wzr, [x0, 12]
	mov	w0, w19
	bl	VCTRL_FindOccupiedFrame
	b	.L1671
	.p2align 3
.L1689:
	ldr	x2, .LC861
	mov	w3, 3489
	ldr	x4, .LC860
	mov	w0, 0
	ldr	x1, .LC862
	add	x2, x2, 1400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1669
.L1690:
	ldr	x2, .LC861
	mov	w3, 3490
	ldr	x4, .LC864
	mov	w0, 0
	ldr	x1, .LC862
	add	x2, x2, 1400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1669
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
	cbz	x27, .L1832
	ldr	w0, [x27, 36]
	tbnz	w0, #31, .L1697
	ldr	w0, [x27, 12]
	cmp	w0, 31
	ble	.L1697
	ldr	w0, [x27, 16]
	cmp	w0, 31
	ble	.L1697
	ldr	w1, [x27, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L1697
	ldr	w0, [x27, 44]
	cmp	w0, 1
	beq	.L1833
	cmp	w0, 2
	bne	.L1699
	ldr	w0, [x27, 20]
	cmp	w0, wzr
	ble	.L1697
	ldr	w0, [x27, 24]
	cmp	w0, wzr
	ble	.L1697
.L1824:
	ldr	w0, [x27, 28]
	cmp	w0, wzr
	ble	.L1697
	ldr	w0, [x27, 32]
	cmp	w0, wzr
	bgt	.L1699
.L1697:
	ldr	x1, .LC873
	mov	w0, 0
	bl	dprint_vfmw
.L1696:
	mov	w0, -1
.L1854:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L1699:
	ldr	w0, [x27, 216]
	cmp	w0, 1
	bls	.L1701
	str	wzr, [x27, 216]
.L1701:
	mov	w3, w19
	mov	w0, 32160
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
	cbnz	w0, .L1834
	ldr	x25, .LC876
	ldr	x0, [x25]
	cbz	x0, .L1835
	add	x0, x25, 8
	b	.L1706
	.p2align 3
.L1837:
	add	w21, w21, 1
	cmp	w21, 32
	beq	.L1836
.L1706:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbnz	x1, .L1837
.L1705:
	ldr	w0, [x27, 252]
	cmp	w0, 1
	beq	.L1767
.L1708:
	cmp	w21, 31
	bhi	.L1760
	mov	x1, x25
	add	x3, x25, 256
	mov	w0, 0
	.p2align 2
.L1710:
	ldr	x2, [x1], 8
	cmp	x2, xzr
	csinc	w0, w0, w0, eq
	cmp	x3, x1
	bne	.L1710
	cbz	w0, .L1838
	mov	w26, 0
	add	x23, x29, 168
.L1711:
	ldr	x3, [x22, 96]
	add	x24, x27, 72
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 56]
	cbz	x0, .L1721
	ldr	w0, [x24, 64]
	cbnz	w0, .L1722
.L1721:
	mov	w1, 3
	mov	w0, 7
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 136]
	mov	w4, 1
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1839
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
.L1725:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 8]
	cbz	x0, .L1762
	ldr	w0, [x24, 16]
	cbnz	w0, .L1727
.L1762:
	ldr	w0, [x27, 216]
	cmp	w0, 1
	beq	.L1728
	mov	w1, 3
	mov	w0, 8
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1840
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
.L1732:
	ldr	w0, [x29, 132]
	cbnz	w0, .L1823
.L1742:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	w0, [x29, 140]
	cmp	w0, wzr
	ble	.L1750
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 11
	bl	VFMW_GetString
	ldr	w2, [x29, 140]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1841
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
.L1750:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	w0, [x27, 192]
	cbz	w0, .L1751
	ldr	w1, [x27, 208]
	cbz	w1, .L1751
	str	w1, [x29, 192]
	ldr	w1, [x27, 248]
	str	w0, [x29, 184]
	cmp	w1, 1
	beq	.L1842
	ldr	x1, [x22, 352]
	mov	x0, x23
	str	wzr, [x29, 196]
	blr	x1
	mov	x1, x0
	str	x0, [x29, 176]
.L1753:
	ldr	w2, [x29, 192]
	ldr	w0, [x29, 184]
	bl	MEM_AddMemRecord
	ldr	w1, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x0, [x29, 176]
	str	w1, [x29, 392]
	str	x0, [x29, 400]
	str	w2, [x29, 408]
.L1751:
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
	cbnz	w0, .L1843
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
.L1756:
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
	bne	.L1756
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
.L1815:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L1838:
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
	cbz	x0, .L1712
	blr	x0
	cmp	w0, wzr
	mov	w23, w0
	ble	.L1712
	mov	w2, w0
	mov	w4, 0
	add	x3, x25, 288
	mov	w1, 0
	add	x0, x29, 144
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1713
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
	cbz	x1, .L1714
	mov	x0, x23
	blr	x1
	cbnz	w0, .L1714
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
	cbnz	w0, .L1715
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
	mov	w2, 8192
	add	x0, x29, 144
	movk	w2, 0x3, lsl 16
	mov	w4, 0
	add	x3, x25, 320
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1844
	ldr	w2, [x24, 88]
	mov	w26, 1
	ldr	x1, [x24, 72]
	ldr	w0, [x24, 80]
	bl	MEM_AddMemRecord
	ldr	w0, [x24, 80]
	mov	w2, 0
	ldr	w1, [x24, 88]
	bl	SM_OpenSCDDrv
	cbz	w0, .L1711
	ldr	x24, .LC883
	mov	w3, 0
	ldr	x1, .LC895
	mov	w0, 0
	add	x2, x24, 1416
	bl	dprint_vfmw
	b	.L1718
	.p2align 3
.L1836:
	ldr	w0, [x27, 252]
	cmp	w0, 1
	bne	.L1760
.L1767:
	add	x1, x29, 108
	mov	w0, 1
	bl	PDT_GetAttribute
	ldr	w0, [x29, 108]
	cmp	w0, 1
	ccmp	w21, 15, 4, ne
	ble	.L1708
	ldr	x1, .LC878
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1815
	.p2align 3
.L1823:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 32]
	cbz	x0, .L1736
	ldr	w0, [x24, 24]
	cbz	w0, .L1736
	ldr	w0, [x24, 40]
	cbz	w0, .L1736
	ldr	w1, [x29, 132]
	cmp	w0, w1
	bge	.L1845
	ldr	w0, [x29, 296]
	.p2align 2
.L1739:
	cbz	w0, .L1741
	ldr	x0, [x29, 304]
	cbz	x0, .L1741
	ldr	w0, [x29, 132]
	ldr	w1, [x29, 312]
	cmp	w1, w0
	bge	.L1742
.L1741:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1846
.L1743:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1847
.L1744:
	ldr	x24, .LC883
	mov	w0, 1
	ldr	x1, .LC909
	add	x2, x24, 1464
	bl	dprint_vfmw
	b	.L1745
.L1736:
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 9
	bl	VFMW_GetString
	ldr	w2, [x29, 132]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1738
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
	b	.L1739
.L1728:
	str	wzr, [x29, 112]
	str	wzr, [x29, 272]
	str	xzr, [x29, 280]
	str	wzr, [x29, 288]
	b	.L1732
.L1833:
	ldr	w0, [x27, 20]
	cmp	w0, wzr
	bgt	.L1824
	b	.L1697
	.p2align 3
.L1738:
	ldr	x24, .LC883
	mov	w3, 1691
	ldr	x1, .LC907
	mov	w0, 1
	ldr	w4, [x29, 132]
	add	x2, x24, 1464
	bl	dprint_vfmw
	ldr	w0, [x29, 296]
	b	.L1739
.L1722:
	ldr	x3, [x22, 104]
	mov	x2, 24
	add	x1, x27, 120
	add	x0, x29, 320
	blr	x3
	ldr	w0, [x29, 136]
	ldr	w2, [x29, 336]
	cmp	w2, w0
	blt	.L1848
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_AddMemRecord
	b	.L1725
.L1712:
	ldr	x24, .LC883
	mov	w3, 0
	ldr	x1, .LC885
	mov	w0, 0
	add	x2, x24, 1416
	bl	dprint_vfmw
.L1718:
	bl	VCTRL_ReleaseHalMem
	ldr	x1, .LC897
	add	x2, x24, 1440
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1815
.L1727:
	ldr	x3, [x22, 104]
	mov	x2, 24
	mov	x1, x24
	add	x0, x29, 272
	blr	x3
	ldr	w0, [x27, 216]
	ldr	w2, [x29, 288]
	cmp	w0, 1
	beq	.L1734
	ldr	w4, [x29, 128]
	cmp	w2, w4
	blt	.L1849
.L1734:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_AddMemRecord
	b	.L1732
.L1842:
	ldr	x1, [x22, 320]
	mov	w2, 3
	mov	x0, x23
	str	w2, [x29, 196]
	blr	x1
	mov	x1, x0
	str	x0, [x29, 176]
	b	.L1753
.L1841:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1850
.L1747:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1851
.L1748:
	ldr	w0, [x29, 116]
	cmp	w0, 1
	beq	.L1852
.L1749:
	ldr	x1, .LC911
	mov	w2, 2079
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
.L1745:
	ldr	x1, .LC914
	add	x2, x24, 1440
	mov	w0, 1
	bl	dprint_vfmw
	cbz	w26, .L1696
	bl	VCTRL_ReleaseHalMem
	mov	w0, -1
	b	.L1815
.L1845:
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
	b	.L1739
.L1852:
	ldr	w0, [x29, 296]
	ldr	x1, [x29, 304]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 296]
	ldr	w2, [x29, 312]
	ldr	x1, [x29, 304]
	bl	MEM_DelMemRecord
	b	.L1749
.L1851:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 272]
	ldr	w2, [x29, 288]
	ldr	x1, [x29, 280]
	bl	MEM_DelMemRecord
	b	.L1748
.L1850:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1747
.L1835:
	mov	w21, 0
	b	.L1705
.L1840:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1853
.L1730:
	ldr	x1, .LC903
	mov	w2, 1750
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1745
.L1839:
	ldr	x1, .LC899
	mov	w2, 1961
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1745
.L1843:
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
	b	.L1815
.L1714:
	ldr	x1, .LC889
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1718
.L1760:
	ldr	x1, .LC880
	mov	w2, 32
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1815
.L1834:
	ldr	x1, .LC875
	mov	w2, 2167
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1815
.L1844:
	ldr	x24, .LC883
	mov	w4, 8192
	ldr	x1, .LC893
	movk	w4, 0x3, lsl 16
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1718
.L1713:
	ldr	x24, .LC883
	mov	w4, w23
	ldr	x1, .LC887
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1718
.L1715:
	ldr	x24, .LC883
	mov	w4, 16384
	ldr	x1, .LC891
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1718
.L1853:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1730
.L1848:
	ldr	x1, .LC901
	mov	w2, 1977
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1745
.L1847:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 272]
	ldr	w2, [x29, 288]
	ldr	x1, [x29, 280]
	bl	MEM_DelMemRecord
	b	.L1744
.L1846:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1743
.L1832:
	ldr	x1, .LC872
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1854
.L1849:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1855
.L1735:
	ldr	x1, .LC905
	mov	w3, w2
	mov	w0, 1
	mov	w2, 1781
	bl	dprint_vfmw
	ldr	x24, .LC883
	b	.L1745
.L1855:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w2, [x29, 336]
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	ldr	w4, [x29, 128]
	ldr	w2, [x29, 288]
	b	.L1735
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
	mov	w19, w0
	mov	x24, x1
	mov	x0, x30
	bl	_mcount
	cbz	x24, .L1915
	cmp	w19, 31
	bhi	.L1916
	ldr	x21, .LC925
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1917
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L1918
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_CheckChanWH
	mov	w20, w0
	cbnz	w0, .L1919
	ldr	x22, .LC930
	add	x23, x22, 3472
	mov	x1, x23
	bl	PDT_GetAttribute
	ldr	w0, [x22, 3492]
	ldr	w2, [x24, 8]
	cmp	w0, 21
	bhi	.L1864
	cmp	w0, w2
	beq	.L1865
	add	x0, x22, 3496
	add	x3, x22, 3620
	.p2align 2
.L1867:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 21
	bhi	.L1864
	cmp	w1, w2
	beq	.L1865
	cmp	x3, x0
	bne	.L1867
.L1865:
	cmp	w2, 8
	str	wzr, [x29, 96]
	beq	.L1920
.L1868:
	cmp	w2, 9
	beq	.L1921
	cmp	w2, 5
	str	wzr, [x29, 96]
	beq	.L1922
.L1895:
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1923
	ldr	x23, .LC935
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
	cbnz	w2, .L1924
.L1875:
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
	beq	.L1925
	str	wzr, [x1, 2076]
.L1877:
	ldr	w0, [x24, 88]
	cbz	w0, .L1878
	mov	w0, 1
	str	w0, [x29, 152]
.L1878:
	ldr	w1, [x24, 80]
	ldr	w0, [x24, 8]
	str	wzr, [x29, 136]
	str	w1, [x29, 144]
	cbnz	w0, .L1926
.L1914:
	ldr	w0, [x24, 52]
.L1880:
	str	w0, [x29, 140]
	add	x3, x21, 256
	mov	w1, 0
	mov	x0, x21
	.p2align 2
.L1882:
	ldr	x2, [x0], 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x3, x0
	bne	.L1882
	cmp	w1, 1
	ldr	x25, .LC936
	ble	.L1927
.L1883:
	str	wzr, [x29, 140]
.L1884:
	ldr	x0, [x21, w19, sxtw 3]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	beq	.L1928
.L1885:
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
	beq	.L1929
.L1886:
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
	beq	.L1930
.L1887:
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
	beq	.L1888
	mov	w0, w19
	bl	VCTRL_ResetChan
	ldr	w1, [x24, 8]
	ldr	x0, [x21, w19, sxtw 3]
	cmp	w1, 20
	beq	.L1889
	ldr	w2, [x0, 672]
	add	x1, x0, 507904
.L1888:
	ldr	x4, .LC939
	mov	x0, 0
	str	w2, [x1, 2088]
	b	.L1893
	.p2align 3
.L1932:
	ldr	w3, [x1, 20]
	str	w3, [x2, x0, lsl 2]
	ldr	w1, [x1, 20]
	str	w1, [x4, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1931
.L1893:
	ldr	x1, [x21, x0, lsl 3]
	add	x2, x22, 3624
	cbnz	x1, .L1932
	add	x1, x22, 3624
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1893
.L1931:
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
.L1923:
	ldr	x1, .LC934
	mov	w20, 0
	bl	dprint_vfmw
.L1912:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1864:
	ldr	x1, .LC932
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
.L1924:
	ldr	w0, [x1, 460]
	cmp	w0, 15
	ble	.L1875
	mov	w0, w2
	str	w2, [x29, 112]
	bl	MEM_Phy2Vir
	str	x0, [x29, 96]
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w0, [x1, 460]
	sub	w0, w0, #16
	str	w0, [x29, 116]
	b	.L1875
	.p2align 3
.L1926:
	cmp	w0, 16
	mov	w0, 0
	beq	.L1914
	b	.L1880
	.p2align 3
.L1921:
	add	x0, x29, 96
	bl	REAL9DEC_Support
	ldr	w0, [x29, 96]
	cbz	w0, .L1869
	ldr	w2, [x24, 8]
	str	wzr, [x29, 96]
	cmp	w2, 5
	bne	.L1895
	b	.L1922
.L1927:
	ldr	w0, [x25, 88]
	cbnz	w0, .L1884
	b	.L1883
.L1920:
	add	x0, x29, 96
	bl	REAL8DEC_Support
	ldr	w0, [x29, 96]
	cbz	w0, .L1869
	ldr	w2, [x24, 8]
	b	.L1868
.L1922:
	add	x0, x29, 96
	bl	DIVX3DEC_Support
	ldr	w0, [x29, 96]
	cbnz	w0, .L1895
.L1869:
	mov	w20, -1
	b	.L1912
.L1918:
	ldr	x2, .LC922
	mov	w3, 2792
	ldr	x4, .LC927
	mov	w0, 0
	ldr	x1, .LC923
	add	x2, x2, 1488
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1912
.L1930:
	ldr	w1, [x24, 40]
	b	.L1887
.L1928:
	str	wzr, [x29, 140]
	b	.L1885
.L1925:
	ldr	w2, [x24, 92]
	str	w2, [x29, 156]
	ldr	w2, [x24, 96]
	str	w0, [x29, 148]
	str	w2, [x29, 160]
	ldr	w0, [x24, 136]
	str	w0, [x1, 2076]
	b	.L1877
.L1929:
	strb	w0, [x29, 88]
	add	x1, x29, 88
	mov	w0, w19
	bl	FSP_ConfigAttribute
	b	.L1886
.L1919:
	ldr	x1, .LC929
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1912
.L1889:
	ldr	w3, [x0, 472]
	ldr	w4, [x0, 476]
	ldr	w1, [x0, 1412]
	ldr	w2, [x0, 1416]
	mov	w0, w19
	bl	VCTRL_PartitionMemForStdUser
	cbnz	w0, .L1890
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w2, [x0, 672]
	b	.L1888
.L1916:
	ldr	x2, .LC922
	mov	w3, 2790
	ldr	x4, .LC924
	mov	w0, 0
	ldr	x1, .LC923
	add	x2, x2, 1488
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1912
.L1917:
	ldr	x2, .LC922
	mov	w3, 2791
	ldr	x4, .LC926
	mov	w20, -1
	ldr	x1, .LC923
	add	x2, x2, 1488
	bl	dprint_vfmw
	b	.L1912
.L1915:
	ldr	x2, .LC922
	mov	w3, 2789
	ldr	x4, .LC921
	mov	w0, 0
	ldr	x1, .LC923
	add	x2, x2, 1488
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1912
.L1890:
	ldr	x1, .LC938
	mov	w0, w25
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1912
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
	ldr	x1, .LC945
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC946
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1936
	ldr	x1, .LC948
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1936:
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 172]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	3
.LC945:
	.xword	.LC944
	.align	3
.LC946:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC948:
	.xword	.LC947
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
	ldr	x1, .LC950
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC951
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1937
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 72]
	bl	VCTRL_ConfigChan
.L1937:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDropStreamThread, .-VfmwProc_SetDropStreamThread
	.align	3
.LC950:
	.xword	.LC949
	.align	3
.LC951:
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
	ldr	x1, .LC953
	lsr	w20, w3, 24
	and	w19, w3, 7
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC954
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1942
	ldr	x1, .LC956
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1942:
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 76]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	3
.LC953:
	.xword	.LC952
	.align	3
.LC954:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC956:
	.xword	.LC955
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
	ldr	x1, .LC958
	lsr	w20, w3, 24
	and	w19, w3, 3
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC959
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1943
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 80]
	bl	VCTRL_ConfigChan
.L1943:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	3
.LC958:
	.xword	.LC957
	.align	3
.LC959:
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
	ldr	x1, .LC961
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC962
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1945
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 68]
	bl	VCTRL_ConfigChan
.L1945:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetErrorThread, .-VfmwProc_SetErrorThread
	.align	3
.LC961:
	.xword	.LC960
	.align	3
.LC962:
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
	ldr	x1, .LC964
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	3
.LC964:
	.xword	.LC963
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
	ldr	x21, .LC965
	mov	w0, 0
	ldr	x1, [x21, 24]
	blr	x1
	cmp	w20, 31
	bhi	.L1965
	ldr	x19, .LC970
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1966
	ldr	w22, [x0, 4]
	cmp	w22, 1
	bne	.L1967
	str	wzr, [x0, 8]
	mov	w0, 0
	ldr	x1, [x21, 32]
	blr	x1
	mov	w0, w20
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1968
.L1953:
	ldr	x1, [x21, 24]
	mov	w0, 0
	sxtw	x22, w20
	blr	x1
	ldr	x2, .LC975
	mov	w0, 4
	ldr	x1, [x21, 24]
	str	wzr, [x2, w20, sxtw 2]
	blr	x1
	mov	w0, w20
	bl	VCTRL_StopChan
	ldr	x1, [x21, 32]
	cbnz	w0, .L1969
	mov	w0, 4
	lsl	x22, x22, 4
	blr	x1
	mov	w0, w20
	bl	VCTRL_ResetChan
	bl	VDMDRV_ParamInit
	ldr	x1, .LC976
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
	ldr	x4, .LC977
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
.L1956:
	ldr	x2, [x0], 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x0, x3
	bne	.L1956
	mov	w19, 0
	cbnz	w1, .L1950
	bl	VCTRL_ReleaseHalMem
.L1950:
	mov	w0, w19
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 144
	ret
.L1968:
	mov	w0, w20
	ldr	x23, [x21, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w22
	blr	x23
	b	.L1953
.L1967:
	ldr	x2, .LC967
	mov	w3, 2391
	ldr	x4, .LC974
	mov	w0, 0
	ldr	x1, .LC969
	add	x2, x2, 1512
.L1964:
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
.L1969:
	mov	w0, 4
	mov	w19, -1
	blr	x1
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	b	.L1950
.L1965:
	ldr	x2, .LC967
	mov	w3, 2377
	ldr	x4, .LC966
	mov	w0, 0
	ldr	x1, .LC969
	add	x2, x2, 1512
	b	.L1964
.L1966:
	ldr	x2, .LC967
	mov	w3, 2384
	ldr	x4, .LC972
	ldr	x1, .LC969
	add	x2, x2, 1512
	b	.L1964
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC965:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC966:
	.xword	.LC198
	.align	3
.LC967:
	.xword	.LANCHOR4
	.align	3
.LC969:
	.xword	.LC968
	.align	3
.LC970:
	.xword	.LANCHOR1
	.align	3
.LC972:
	.xword	.LC971
	.align	3
.LC974:
	.xword	.LC973
	.align	3
.LC975:
	.xword	g_LowDelaySeqIndex
	.align	3
.LC976:
	.xword	.LANCHOR5
	.align	3
.LC977:
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
	ldr	x20, .LC981
	ldr	w0, [x20, 256]
	cmp	w0, 1
	bne	.L1977
	mov	x19, 0
	.p2align 2
.L1973:
	ldr	x1, [x20, x19, lsl 3]
	mov	w0, w19
	add	x19, x19, 1
	cbz	x1, .L1972
	bl	VCTRL_DestroyChan
.L1972:
	cmp	x19, 32
	bne	.L1973
	bl	FSP_Exit
	ldr	x21, .LC982
	ldr	w1, [x20, 260]
	mov	w2, 3
	str	w2, [x20, 264]
	cbz	w1, .L1975
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L1976
	.p2align 3
.L1987:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1975
.L1976:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cbnz	w1, .L1987
.L1975:
	ldr	x0, .LC983
	mov	x2, 128
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 400
	blr	x3
	add	x0, x20, 288
	bl	CloseDrivers
	str	wzr, [x20, 256]
	mov	w0, 0
.L1986:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1977:
	mov	w0, -1
	b	.L1986
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC981:
	.xword	.LANCHOR1
	.align	3
.LC982:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC983:
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
	ldr	x1, .LC986
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w3, w0
	ldr	x1, .LC987
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w3, w0
	ldr	x1, .LC988
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	3
.LC986:
	.xword	.LC985
	.align	3
.LC987:
	.xword	.LC963
	.align	3
.LC988:
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
	ldr	x1, .LC989
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	3
.LC989:
	.xword	.LC985
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
	beq	.L2000
	mov	w19, 2
	cmp	w20, wzr
	csel	w19, w19, wzr, eq
.L1991:
	ldr	x0, .LC990
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L2002
	mov	w1, w19
	mov	w0, 0
	bl	VDH_Require_DspCode
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2002:
	ldr	x20, .LC991
	ldr	x1, [x20, 8]
	cbz	x1, .L2003
	mov	w0, 0
	blr	x1
.L1994:
	ldr	x1, [x20, 40]
	cbz	x1, .L2004
	mov	w0, 0
	blr	x1
.L1996:
	ldr	x1, [x20, 24]
	cbz	x1, .L2005
	mov	w0, 0
	blr	x1
.L1998:
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
.L2000:
	mov	w19, 1
	b	.L1991
	.p2align 3
.L2003:
	ldr	x1, .LC992
	mov	w2, 3055
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1994
	.p2align 3
.L2004:
	ldr	x1, .LC992
	mov	w2, 3056
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1996
	.p2align 3
.L2005:
	ldr	x1, .LC992
	mov	w2, 3057
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1998
	.size	VCTRL_InitDspCode, .-VCTRL_InitDspCode
	.align	3
.LC990:
	.xword	g_HalDisable
	.align	3
.LC991:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC992:
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
	ldr	x0, .LC993
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cbnz	w1, .L2018
	ldr	w21, [x0, 1356]
	mov	w0, 0
	cmp	w21, wzr
	cset	w3, eq
	cmp	w1, 6
	cset	w2, ne
	tst	w3, w2
	beq	.L2037
.L2024:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2018:
	cmp	w1, 6
	mov	w3, 1
	cset	w2, ne
	mov	w21, 0
	tst	w3, w2
	mov	w0, 0
	bne	.L2024
.L2037:
	ldr	x20, .LC994
	add	x0, x20, 404
	add	x3, x20, 528
	ldr	w2, [x20, 400]
	cbz	w2, .L2009
	b	.L2008
	.p2align 3
.L2039:
	beq	.L2038
.L2009:
	ldr	w2, [x0]
	add	x0, x0, 4
	cmp	x3, x0
	cbz	w2, .L2039
.L2008:
	cmp	w2, 1
	beq	.L2040
	cmp	w1, 6
	mov	w0, 0
	beq	.L2024
	ldr	x1, .LC998
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2024
	.p2align 3
.L2038:
	mov	w0, w19
	bl	VCTRL_InitDspCode
	cmp	w21, 1
	beq	.L2041
	add	x20, x20, 400
	mov	w1, 2
	mov	w0, 0
	str	w1, [x20, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2041:
	add	x20, x20, 400
	mov	w0, 0
	str	w21, [x20, w19, sxtw 2]
	b	.L2024
	.p2align 3
.L2040:
	cmp	w21, 1
	mov	w0, 0
	beq	.L2024
	ldr	x1, .LC996
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2024
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	3
.LC993:
	.xword	.LANCHOR1
	.align	3
.LC994:
	.xword	.LANCHOR5
	.align	3
.LC996:
	.xword	.LC995
	.align	3
.LC998:
	.xword	.LC997
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
	ldr	x0, .LC1001
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 475136
	str	w19, [x0, 2360]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	3
.LC1001:
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
	ldr	x0, .LC1002
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 503808
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 1972]
	ret
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	3
.LC1002:
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
	beq	.L2046
	cbz	w19, .L2047
	cmp	w19, 2
	bne	.L2055
	ldr	x0, .LC1003
	add	x0, x0, 3344
	ldr	w1, [x0, w20, sxtw 2]
	cmp	w1, 1
	beq	.L2051
.L2053:
	str	w19, [x0, w20, sxtw 2]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2055:
	mov	w0, 0
.L2045:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2047:
	ldr	x1, .LC1003
	mov	w0, 0
	add	x1, x1, 3344
	str	wzr, [x1, w20, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2046:
	ldr	x0, .LC1003
	add	x0, x0, 3344
	ldr	w1, [x0, w20, sxtw 2]
	cbz	w1, .L2053
.L2051:
	mov	w0, -1
	b	.L2045
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.align	3
.LC1003:
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
	beq	.L2057
	ldr	w2, [x19, 12]
	ldr	w0, [x19, 32]
	ldr	x1, [x19, 24]
	bl	MEM_AddMemRecord
.L2057:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L2058
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_AddMemRecord
.L2058:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L2056
	ldr	w2, [x19, 20]
	ldr	w0, [x19, 64]
	ldr	x1, [x19, 56]
	bl	MEM_AddMemRecord
.L2056:
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
	ldr	x22, .LC1005
	ldr	w4, [x20, 12]
	ldr	x0, [x22, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w5, [x1, 1448]
	cmp	w5, w4
	beq	.L2070
	add	x0, x0, 503808
	ldr	w0, [x0, 1968]
	cbz	w0, .L2097
.L2070:
	ldr	w0, [x1, 264]
	cbz	w0, .L2072
	ldr	w0, [x1, 1480]
	cbz	w0, .L2098
.L2072:
	ldr	x23, .LC1011
	mov	w0, 8
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x4, [x22, w19, sxtw 3]
	add	x2, x4, 503808
	ldr	w0, [x2, 2000]
	cmp	w0, 255
	beq	.L2081
	add	x2, x2, 2072
	mov	x1, 1
	b	.L2074
	.p2align 3
.L2100:
	add	w1, w1, 1
	cmp	w1, 32
	beq	.L2099
.L2074:
	ldr	w3, [x2]
	add	x2, x2, 72
	cmp	w3, 255
	bne	.L2100
.L2073:
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
	ldr	x1, .LC1012
	lsl	x21, x21, 6
	add	x0, x21, x0, lsl 3
	add	x1, x1, 912
	add	x21, x1, x0
	ldr	w0, [x21, 24]
	cmp	w0, 2
	beq	.L2101
.L2076:
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 1484]
	cbnz	w0, .L2077
.L2079:
	mov	w19, 0
.L2078:
	ldr	x1, [x23, 32]
	mov	w0, 8
	blr	x1
	mov	w0, w19
.L2092:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2098:
	ldr	w5, [x20, 8]
	cmp	w5, 255
	bne	.L2072
	ldr	x2, .LC1006
	mov	w4, 0
	ldr	x1, .LC1010
	mov	w3, 8188
	add	x2, x2, 1536
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2092
	.p2align 3
.L2099:
	ldr	x2, .LC1006
	ldr	x1, .LC1016
.L2094:
	mov	w3, w19
	add	x2, x2, 1536
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
	b	.L2078
	.p2align 3
.L2101:
	ldr	w0, [x21, 52]
	cbnz	w0, .L2076
	ldr	x0, [x23]
	blr	x0
	str	w0, [x21, 52]
	mov	w1, 3
	str	w1, [x21, 24]
	b	.L2076
	.p2align 3
.L2077:
	mov	x1, x20
	mov	w0, w19
	bl	FSP_SetSingleFrameBuf
	cbz	w0, .L2079
	ldr	x2, .LC1006
	ldr	x1, .LC1014
	b	.L2094
.L2081:
	mov	x1, 0
	b	.L2073
.L2097:
	ldr	x2, .LC1006
	mov	w3, 8178
	ldr	x1, .LC1008
	mov	w0, 1
	add	x2, x2, 1536
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2092
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	3
.LC1005:
	.xword	.LANCHOR1
	.align	3
.LC1006:
	.xword	.LANCHOR4
	.align	3
.LC1008:
	.xword	.LC1007
	.align	3
.LC1010:
	.xword	.LC1009
	.align	3
.LC1011:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1012:
	.xword	.LANCHOR5
	.align	3
.LC1014:
	.xword	.LC1013
	.align	3
.LC1016:
	.xword	.LC1015
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
	ldr	x21, .LC1018
	add	x3, x21, 3344
	ldr	w0, [x3, w19, sxtw 2]
	cbz	w0, .L2112
	ldr	x2, .LC1025
	mov	w3, w19
	ldr	x1, .LC1027
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
.L2112:
	ldr	x23, .LC1019
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
	ldr	x22, .LC1020
	mov	w20, w0
	ldr	x0, [x22, w19, sxtw 3]
	add	x2, x0, 475136
	cbnz	w20, .L2113
.L2105:
	ldr	x1, .LC1024
	mov	w3, 2
	mov	w0, 31
	str	w3, [x2, 2360]
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 2084]
	cmp	w0, 1
	beq	.L2114
.L2106:
	add	x21, x21, 3344
	mov	w0, w20
	str	wzr, [x21, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2113:
	add	x1, x0, 503808
	add	x2, x0, 475136
	ldr	w0, [x1, 1972]
	cbz	w0, .L2105
	ldr	x1, .LC1022
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	mov	w1, 3
	add	x2, x0, 475136
	str	w1, [x2, 2360]
	b	.L2105
	.p2align 3
.L2114:
	ldr	x1, [x23, 256]
	mov	w0, 0
	blr	x1
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 507904
	str	wzr, [x0, 2084]
	b	.L2106
	.size	VCTRL_AllocMemToDecoder, .-VCTRL_AllocMemToDecoder
	.align	3
.LC1018:
	.xword	.LANCHOR5
	.align	3
.LC1019:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1020:
	.xword	.LANCHOR1
	.align	3
.LC1022:
	.xword	.LC1021
	.align	3
.LC1024:
	.xword	.LC1023
	.align	3
.LC1025:
	.xword	.LANCHOR4
	.align	3
.LC1027:
	.xword	.LC1026
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
	ldr	x3, .LC1029
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, .LC1030
	ldr	x6, [x0, 104]
	cbz	x6, .L2116
	ldr	x4, .LC1031
	add	x5, x29, 56
	mov	w3, 0
	mov	w2, w21
	mov	w1, w20
	mov	w0, w19
	ldr	x4, [x4, w19, sxtw 3]
	add	x4, x4, 507904
	ldr	w4, [x4, 2088]
	blr	x6
.L2116:
	ldr	w0, [x29, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VCTRL_GetFsSize, .-VCTRL_GetFsSize
	.align	3
.LC1029:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1030:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC1031:
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
	ldr	x0, .LC1032
	mov	w1, 1
	add	x0, x0, 3752
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC1032:
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
	ldr	x0, .LC1034
	add	x0, x0, 3752
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC1034:
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
	ldr	x0, .LC1036
	add	x0, x0, 3752
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC1036:
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
	.type	__func__.15926, %object
	.size	__func__.15926, 18
__func__.15926:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.17135, %object
	.size	__func__.17135, 24
__func__.17135:
	.string	"VCTRL_SetLastFrameState"
	.type	__func__.15865, %object
	.size	__func__.15865, 20
__func__.15865:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.15870, %object
	.size	__func__.15870, 17
__func__.15870:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.15917, %object
	.size	__func__.15917, 23
__func__.15917:
	.string	"VCTRL_SetMoreGapEnable"
	.zero	1
	.type	__func__.15938, %object
	.size	__func__.15938, 18
__func__.15938:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__func__.15978, %object
	.size	__func__.15978, 25
__func__.15978:
	.string	"VCTRL_SetStreamInterface"
	.zero	7
	.type	__func__.15983, %object
	.size	__func__.15983, 29
__func__.15983:
	.string	"VCTRL_SetSendStreamAgainFlag"
	.zero	3
	.type	__func__.15987, %object
	.size	__func__.15987, 29
__func__.15987:
	.string	"VCTRL_GetSendStreamAgainFlag"
	.zero	3
	.type	__func__.15997, %object
	.size	__func__.15997, 20
__func__.15997:
	.string	"VCTRL_GetStreamSize"
	.zero	4
	.type	__func__.16004, %object
	.size	__func__.16004, 20
__func__.16004:
	.string	"VCTRL_CheckFreshRaw"
	.zero	4
	.type	__func__.16011, %object
	.size	__func__.16011, 20
__func__.16011:
	.string	"VCTRL_CheckFreshSeg"
	.zero	4
	.type	__func__.16016, %object
	.size	__func__.16016, 25
__func__.16016:
	.string	"VCTRL_SetDiscardPicParam"
	.zero	7
	.type	__FUNCTION__.16044, %object
	.size	__FUNCTION__.16044, 29
__FUNCTION__.16044:
	.string	"VCTRL_PartitionMemForStdUser"
	.zero	3
	.type	__func__.16059, %object
	.size	__func__.16059, 21
__func__.16059:
	.string	"DelAllFrameMemRecord"
	.zero	3
	.type	__func__.16069, %object
	.size	__func__.16069, 23
__func__.16069:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.16251, %object
	.size	__func__.16251, 17
__func__.16251:
	.string	"VCTRL_GetChanCfg"
	.zero	7
	.type	__func__.16312, %object
	.size	__func__.16312, 14
__func__.16312:
	.string	"VCTRL_SeekPts"
	.zero	2
	.type	__func__.16345, %object
	.size	__func__.16345, 20
__func__.16345:
	.string	"VCTRL_ReleaseStream"
	.zero	4
	.type	__func__.16365, %object
	.size	__func__.16365, 24
__func__.16365:
	.string	"VCTRL_ImageOutputEnable"
	.type	__func__.16404, %object
	.size	__func__.16404, 25
__func__.16404:
	.string	"VCTRL_TryToRelSpecialFrm"
	.zero	7
	.type	__func__.16428, %object
	.size	__func__.16428, 19
__func__.16428:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.16436, %object
	.size	__FUNCTION__.16436, 19
__FUNCTION__.16436:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__func__.16443, %object
	.size	__func__.16443, 23
__func__.16443:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__FUNCTION__.16447, %object
	.size	__FUNCTION__.16447, 23
__FUNCTION__.16447:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.16455, %object
	.size	__func__.16455, 23
__func__.16455:
	.string	"VCTRL_GetHDRConfigInfo"
	.zero	1
	.type	__func__.16481, %object
	.size	__func__.16481, 18
__func__.16481:
	.string	"VCTRL_GetDecParam"
	.align	3
.LANCHOR4 = . + 0
	.type	__func__.16565, %object
	.size	__func__.16565, 20
__func__.16565:
	.string	"VCTRL_ClearDecparam"
	.zero	4
	.type	__func__.16594, %object
	.size	__func__.16594, 21
__func__.16594:
	.string	"VCTRL_VdmProcSedOnly"
	.zero	3
	.type	__func__.16604, %object
	.size	__func__.16604, 21
__func__.16604:
	.string	"VCTRL_GetImageBuffer"
	.zero	3
	.type	__func__.16627, %object
	.size	__func__.16627, 22
__func__.16627:
	.string	"VCTRL_ConfigFFFBSpeed"
	.zero	2
	.type	__func__.16632, %object
	.size	__func__.16632, 20
__func__.16632:
	.string	"VCTRL_ConfigPVRInfo"
	.zero	4
	.type	__func__.16636, %object
	.size	__func__.16636, 19
__func__.16636:
	.string	"VCTRL_IsChanActive"
	.zero	5
	.type	__func__.16642, %object
	.size	__func__.16642, 13
__func__.16642:
	.string	"USERDEC_Init"
	.zero	3
	.type	__func__.16661, %object
	.size	__func__.16661, 21
__func__.16661:
	.string	"VCTRL_GetUsrdecFrame"
	.zero	3
	.type	__func__.16671, %object
	.size	__func__.16671, 14
__func__.16671:
	.string	"InitSyntaxCtx"
	.zero	2
	.type	__func__.16726, %object
	.size	__func__.16726, 12
__func__.16726:
	.string	"OpenDrivers"
	.zero	4
	.type	__func__.15947, %object
	.size	__func__.15947, 15
__func__.15947:
	.string	"VCTRL_OpenVfmw"
	.zero	1
	.type	__FUNCTION__.16865, %object
	.size	__FUNCTION__.16865, 18
__FUNCTION__.16865:
	.string	"GetExtraRefFrmNum"
	.zero	6
	.type	__FUNCTION__.16871, %object
	.size	__FUNCTION__.16871, 19
__FUNCTION__.16871:
	.string	"GetExtraDispFrmNum"
	.zero	5
	.type	__FUNCTION__.16877, %object
	.size	__FUNCTION__.16877, 16
__FUNCTION__.16877:
	.string	"GetExtraCtrlCmd"
	.type	__func__.16811, %object
	.size	__func__.16811, 14
__func__.16811:
	.string	"DecChanSyntax"
	.zero	2
	.type	__FUNCTION__.16812, %object
	.size	__FUNCTION__.16812, 14
__FUNCTION__.16812:
	.string	"DecChanSyntax"
	.zero	2
	.type	__func__.16354, %object
	.size	__func__.16354, 24
__func__.16354:
	.string	"VCTRL_FindOccupiedFrame"
	.type	__func__.16375, %object
	.size	__func__.16375, 26
__func__.16375:
	.string	"VCTRL_ReportOccupiedFrame"
	.zero	6
	.type	__func__.16842, %object
	.size	__func__.16842, 20
__func__.16842:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	__func__.16027, %object
	.size	__func__.16027, 19
__func__.16027:
	.string	"VCTRL_GetChanState"
	.zero	5
	.type	__func__.16846, %object
	.size	__func__.16846, 19
__func__.16846:
	.string	"VCTRL_GetChanWidth"
	.zero	5
	.type	__func__.16850, %object
	.size	__func__.16850, 20
__func__.16850:
	.string	"VCTRL_GetChanHeight"
	.zero	4
	.type	__func__.16854, %object
	.size	__func__.16854, 22
__func__.16854:
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
	.type	__func__.17150, %object
	.size	__func__.17150, 22
__func__.17150:
	.string	"VCTRL_OutputLastFrame"
	.zero	2
	.type	__func__.16540, %object
	.size	__func__.16540, 15
__func__.16540:
	.string	"VCTRL_PostProc"
	.zero	1
	.type	__func__.16589, %object
	.size	__func__.16589, 18
__func__.16589:
	.string	"VCTRL_VdmPostProc"
	.zero	6
	.type	__func__.17176, %object
	.size	__func__.17176, 21
__func__.17176:
	.string	"VCTRL_SvdecLastFrame"
	.zero	3
	.type	__func__.16667, %object
	.size	__func__.16667, 21
__func__.16667:
	.string	"VCTRL_PutUsrdecFrame"
	.zero	3
	.type	__func__.16230, %object
	.size	__func__.16230, 16
__func__.16230:
	.string	"VCTRL_StartChan"
	.type	__func__.16246, %object
	.size	__func__.16246, 15
__func__.16246:
	.string	"VCTRL_StopChan"
	.zero	1
	.type	__func__.16339, %object
	.size	__func__.16339, 26
__func__.16339:
	.string	"VCTRL_ResetChanWithOption"
	.zero	6
	.type	__func__.16418, %object
	.size	__func__.16418, 16
__func__.16418:
	.string	"VCTRL_ResetChan"
	.type	__func__.16136, %object
	.size	__func__.16136, 18
__func__.16136:
	.string	"VCTRL_AllocHalMem"
	.zero	6
	.type	__func__.16212, %object
	.size	__func__.16212, 17
__func__.16212:
	.string	"VCTRL_CreateChan"
	.zero	7
	.type	__func__.16093, %object
	.size	__func__.16093, 18
__func__.16093:
	.string	"VCTRL_AllocSCDMem"
	.zero	6
	.type	__func__.16297, %object
	.size	__func__.16297, 17
__func__.16297:
	.string	"VCTRL_ConfigChan"
	.zero	7
	.type	__func__.16224, %object
	.size	__func__.16224, 18
__func__.16224:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.17271, %object
	.size	__func__.17271, 30
__func__.17271:
	.string	"VCTRL_SetSingleFrameBufToChan"
	.zero	2
	.type	__func__.17283, %object
	.size	__func__.17283, 24
__func__.17283:
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
.LC944:
	ASCII(.string	"chan %d: new UvmosEnable = %d\n" )
	.zero	1
.LC947:
	ASCII(.string	"chan %d: SetUvmosEnable failed!\n" )
	.zero	7
.LC949:
	ASCII(.string	"chan %d: new StrmOFThr = %d\n" )
	.zero	3
.LC952:
	ASCII(.string	"chan %d: new DecMode = %d\n" )
	.zero	5
.LC955:
	ASCII(.string	"chan %d: GetChanCfg failed!\n" )
	.zero	3
.LC957:
	ASCII(.string	"chan %d: new DecOrderOutput = %d\n" )
	.zero	6
.LC960:
	ASCII(.string	"chan %d: new ChanErrThr = %d\n" )
	.zero	2
.LC963:
	ASCII(.string	"reset chan %d: VCTRL_ResetChan return %d\n" )
	.zero	6
.LC968:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC971:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC973:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC985:
	ASCII(.string	"stop chan %d: VCTRL_StopChan return %d\n" )
.LC995:
	ASCII(.string	"WARNNING: dsp in lowdelay state, we can not supported  avs in the same time!!!\n" )
.LC997:
	ASCII(.string	"WARNNING: dsp in avs state, we can not supported  lowdelay in the same time!!!\n" )
.LC1007:
	ASCII(.string	"%s, %d, actul size = 0x%x, except size= 0x%x\n" )
	.zero	2
.LC1009:
	ASCII(.string	"%s, %d, CfgFrameNum = %x, PmvNodeStatus= 0x%x\n" )
	.zero	1
.LC1013:
	ASCII(.string	"%s: Chan %d set single frame failed!\n" )
	.zero	2
.LC1015:
	ASCII(.string	"%s: Chan %d no frame buffer store!\n" )
	.zero	4
.LC1021:
	ASCII(.string	"DFS, request frame store fail!, chanid: %d\n" )
	.zero	4
.LC1023:
	ASCII(.string	"DFS, set decoding thread state to success!\n " )
	.zero	3
.LC1026:
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
	.type	save_file_cnt.17013, %object
	.size	save_file_cnt.17013, 4
save_file_cnt.17013:
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
	.type	save_file_cnt.17007, %object
	.size	save_file_cnt.17007, 4
save_file_cnt.17007:
	.zero	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.zero	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 256
vfmw_save_metadata_file:
	.zero	256
	.type	save_file_cnt.17001, %object
	.size	save_file_cnt.17001, 4
save_file_cnt.17001:
	.zero	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.zero	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 256
vfmw_save_seg_file:
	.zero	256
	.type	save_file_cnt.16979, %object
	.size	save_file_cnt.16979, 4
save_file_cnt.16979:
	.zero	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.zero	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 256
vfmw_save_str_file:
	.zero	256
	.type	save_file_cnt.16973, %object
	.size	save_file_cnt.16973, 4
save_file_cnt.16973:
	.zero	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.zero	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 256
vfmw_save_yuv_file:
	.zero	256
	.type	save_file_cnt.16986, %object
	.size	save_file_cnt.16986, 4
save_file_cnt.16986:
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
	.type	FspInstInfo.16040, %object
	.size	FspInstInfo.16040, 2952
FspInstInfo.16040:
	.zero	2952
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.zero	4
	.zero	4
	.type	last_rec_pos_time.16433, %object
	.size	last_rec_pos_time.16433, 128
last_rec_pos_time.16433:
	.zero	128
	.type	last_rec_pos_time.16444, %object
	.size	last_rec_pos_time.16444, 128
last_rec_pos_time.16444:
	.zero	128
	.type	MemArrange.16701, %object
	.size	MemArrange.16701, 1232
MemArrange.16701:
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
	.type	last_rec_pos_time.16806, %object
	.size	last_rec_pos_time.16806, 128
last_rec_pos_time.16806:
	.zero	128
	.type	last_rec_pos_decparam_time.16807, %object
	.size	last_rec_pos_decparam_time.16807, 128
last_rec_pos_decparam_time.16807:
	.zero	128
	.type	ChanPriTab.16756, %object
	.size	ChanPriTab.16756, 128
ChanPriTab.16756:
	.zero	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 2304
g_VfmwChanStat:
	.zero	2304
	.type	PrioArray.16229, %object
	.size	PrioArray.16229, 128
PrioArray.16229:
	.zero	128
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.zero	128
	.type	Capability.16293, %object
	.size	Capability.16293, 148
Capability.16293:
	.zero	148
	.zero	4
	.type	PrioArray.16292, %object
	.size	PrioArray.16292, 128
PrioArray.16292:
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
