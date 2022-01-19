#include "hi_asm_define.h"
	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"vfmw_ctrl.c"
	.text
	.align	2
	.type	VfmwProc_SetPrintLevel, %function
VfmwProc_SetPrintLevel:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2
	ldr	r2, [r0]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	g_PrintEnable
	UNWIND(.fnend)
	.size	VfmwProc_SetPrintLevel, .-VfmwProc_SetPrintLevel
	.align	2
	.type	VfmwProc_OpenScdLowdly, %function
VfmwProc_OpenScdLowdly:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L5
	mov	r2, #1
	ldr	r1, [r0]
	ldr	r3, [r3, r1, asl #3]
	str	r2, [r3, #44]
	ldmfd	sp, {fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	s_SmIIS
	UNWIND(.fnend)
	.size	VfmwProc_OpenScdLowdly, .-VfmwProc_OpenScdLowdly
	.align	2
	.type	VfmwProc_CloseScdLowdly, %function
VfmwProc_CloseScdLowdly:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L8
	mov	r2, #0
	ldr	r1, [r0]
	ldr	r3, [r3, r1, asl #3]
	str	r2, [r3, #44]
	ldmfd	sp, {fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	s_SmIIS
	UNWIND(.fnend)
	.size	VfmwProc_CloseScdLowdly, .-VfmwProc_CloseScdLowdly
	.align	2
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L22
	ldr	lr, .L26
	ldr	ip, [lr, r0, asl #2]
	cmp	ip, #0
	beq	.L23
	ldr	ip, [ip, #32]
	cmp	ip, #0
	beq	.L15
	cmp	ip, #1
	bne	.L24
	ldr	r3, [lr, #372]
	cmp	r3, #0
	beq	.L25
.L18:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L24:
	str	r3, [sp]
	mov	r0, #0
	mov	r3, ip
	ldr	r2, .L26+4
	ldr	r1, .L26+8
	bl	dprint_vfmw
.L12:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L15:
	ldr	r3, [lr, #368]
	cmp	r3, #0
	bne	.L18
	mov	r0, r3
	ldr	r1, .L26+12
	bl	dprint_vfmw
	b	.L12
.L25:
	mov	r0, r3
	ldr	r1, .L26+16
	bl	dprint_vfmw
	b	.L12
.L22:
	ldr	ip, .L26+20
	mov	r3, #872
	ldr	r2, .L26+4
	mov	r0, #0
	ldr	r1, .L26+24
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L12
.L23:
	ldr	lr, .L26+28
	mov	r0, ip
	movw	r3, #873
	ldr	r2, .L26+4
	ldr	r1, .L26+24
	str	lr, [sp]
	bl	dprint_vfmw
	b	.L12
.L27:
	.align	2
.L26:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC5
	.word	.LC3
	.word	.LC4
	.word	.LC1
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	2
	.type	VfmwProc_SetStandardObedience, %function
VfmwProc_SetStandardObedience:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L29
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L29+4
	mov	r2, r3
	str	r3, [ip, #388]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L30:
	.align	2
.L29:
	.word	.LANCHOR1
	.word	.LC6
	UNWIND(.fnend)
	.size	VfmwProc_SetStandardObedience, .-VfmwProc_SetStandardObedience
	.align	2
	.type	VfmwProc_SetClkSelect, %function
VfmwProc_SetClkSelect:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	ldr	r2, .L35
	cmp	r3, #4
	strls	r3, [r2]
	ldmlsfd	sp, {fp, sp, pc}
	ldr	r1, .L35+4
	mov	r0, #32
	ldr	r2, [r2]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L36:
	.align	2
.L35:
	.word	.LANCHOR2
	.word	.LC7
	UNWIND(.fnend)
	.size	VfmwProc_SetClkSelect, .-VfmwProc_SetClkSelect
	.align	2
	.type	VfmwProc_SetCompressPara, %function
VfmwProc_SetCompressPara:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	ip, .L81
	ldr	r5, [r0, #4]
	mov	r3, r0
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #52
	ldr	r7, [ip, #48]
	ldr	r4, [r3]
	ldr	r8, [r3, #8]
	ldr	r9, [r3, #12]
	ldr	r6, [r3, #16]
	blx	r7
	cmp	r5, #0
	beq	.L73
	cmp	r8, #0
	beq	.L74
	movw	r3, #625
	cmp	r9, r3
	mov	r3, #1
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	beq	.L68
	bls	.L75
	movw	r3, #750
	cmp	r9, r3
	beq	.L46
	movw	r3, #875
	cmp	r9, r3
	moveq	r3, #3
	streq	r3, [fp, #-44]
.L48:
	movw	r3, #625
	cmp	r6, r3
	beq	.L50
.L80:
	bls	.L76
	movw	r3, #750
	cmp	r6, r3
	moveq	r3, #2
	streq	r3, [fp, #-40]
	beq	.L49
	movw	r3, #875
	cmp	r6, r3
	moveq	r3, #3
	streq	r3, [fp, #-40]
	b	.L49
.L74:
	mvn	r3, #0
	mov	r2, #1
	str	r8, [fp, #-48]
	str	r2, [fp, #-52]
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
.L49:
	ldr	r1, [fp, #-48]
	cmp	r1, #1
	beq	.L77
	cmp	r1, #0
	beq	.L78
.L39:
	mov	r2, r4
	ldr	r1, .L81+4
	mov	r0, #32
	bl	dprint_vfmw
.L56:
	ldr	r3, .L81+8
	ldr	r2, [r3, r4, asl #2]
	cmp	r2, #0
	beq	.L79
.L57:
	mov	r2, r4
	ldr	r1, .L81+12
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L73:
	mvn	r3, #0
	str	r5, [fp, #-52]
	str	r5, [fp, #-48]
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
	b	.L39
.L75:
	cmp	r9, #500
	moveq	r3, #0
	streq	r3, [fp, #-44]
	movw	r3, #625
	cmp	r6, r3
	bne	.L80
.L50:
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L49
.L76:
	cmp	r6, #500
	moveq	r3, #0
	streq	r3, [fp, #-40]
	b	.L49
.L46:
	mov	r3, #2
.L68:
	str	r3, [fp, #-44]
	b	.L48
.L78:
	str	r1, [sp]
	mov	r3, #1
	mov	r2, r4
	ldr	r1, .L81+16
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L81+8
	ldr	r2, [r3, r4, asl #2]
	cmp	r2, #0
	bne	.L57
.L79:
	ldr	lr, [fp, #-44]
	add	r3, r3, r4, lsl #4
	ldr	ip, [fp, #-40]
	mov	r2, r4
	ldr	r6, [fp, #-52]
	mov	r0, #32
	ldr	r5, [fp, #-48]
	str	lr, [r3, #400]
	str	ip, [r3, #404]
	str	r6, [r3, #392]
	str	r5, [r3, #396]
	ldr	r1, .L81+20
	bl	dprint_vfmw
	ldr	r2, [fp, #-52]
	ldr	r1, .L81+24
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r2, [fp, #-48]
	ldr	r1, .L81+28
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-44]
	mov	r0, #32
	ldr	r1, .L81+32
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L77:
	mov	r3, r1
	str	r1, [sp]
	str	r6, [sp, #8]
	mov	r2, r4
	str	r9, [sp, #4]
	mov	r0, #32
	ldr	r1, .L81+36
	bl	dprint_vfmw
	b	.L56
.L82:
	.align	2
.L81:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC10
	.word	.LANCHOR1
	.word	.LC15
	.word	.LC9
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC8
	UNWIND(.fnend)
	.size	VfmwProc_SetCompressPara, .-VfmwProc_SetCompressPara
	.align	2
	.type	VfmwProc_SetTunnelLineNumber, %function
VfmwProc_SetTunnelLineNumber:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L84
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L84+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L85:
	.align	2
.L84:
	.word	g_TunnelLineNumber
	.word	.LC16
	UNWIND(.fnend)
	.size	VfmwProc_SetTunnelLineNumber, .-VfmwProc_SetTunnelLineNumber
	.align	2
	.type	VfmwProc_SetSaveYuvBitWidth, %function
VfmwProc_SetSaveYuvBitWidth:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	bic	r2, r3, #2
	cmp	r2, #8
	bne	.L88
	ldr	ip, .L89
	mov	r2, r3
	ldr	r1, .L89+4
	mov	r0, #32
	str	r3, [ip, #4]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L88:
	mov	r2, r3
	ldr	r1, .L89+8
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L90:
	.align	2
.L89:
	.word	.LANCHOR2
	.word	.LC18
	.word	.LC17
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveYuvBitWidth, .-VfmwProc_SetSaveYuvBitWidth
	.align	2
	.type	VfmwProc_SetTraceImgPeriod, %function
VfmwProc_SetTraceImgPeriod:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L92
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L92+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L93:
	.align	2
.L92:
	.word	g_TraceImgPeriod
	.word	.LC19
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceImgPeriod, .-VfmwProc_SetTraceImgPeriod
	.align	2
	.type	VfmwProc_SetTraceFramePeriod, %function
VfmwProc_SetTraceFramePeriod:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L95
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L95+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L96:
	.align	2
.L95:
	.word	g_TraceFramePeriod
	.word	.LC20
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceFramePeriod, .-VfmwProc_SetTraceFramePeriod
	.align	2
	.type	VfmwProc_SetTraceBSPeriod, %function
VfmwProc_SetTraceBSPeriod:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L98
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L98+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L99:
	.align	2
.L98:
	.word	g_TraceBsPeriod
	.word	.LC21
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceBSPeriod, .-VfmwProc_SetTraceBSPeriod
	.align	2
	.type	VfmwProc_SetTraceCtrl, %function
VfmwProc_SetTraceCtrl:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L101
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L101+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L102:
	.align	2
.L101:
	.word	g_TraceCtrl
	.word	.LC22
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceCtrl, .-VfmwProc_SetTraceCtrl
	.align	2
	.type	VfmwProc_TestStopDec, %function
VfmwProc_TestStopDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L104
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L104+4
	mov	r2, r3
	str	r3, [ip, #904]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L105:
	.align	2
.L104:
	.word	.LANCHOR1
	.word	.LC23
	UNWIND(.fnend)
	.size	VfmwProc_TestStopDec, .-VfmwProc_TestStopDec
	.align	2
	.type	VfmwProc_TestTimeSequence, %function
VfmwProc_TestTimeSequence:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L107
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L107+4
	mov	r2, r3
	str	r3, [ip, #908]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L108:
	.align	2
.L107:
	.word	.LANCHOR1
	.word	.LC24
	UNWIND(.fnend)
	.size	VfmwProc_TestTimeSequence, .-VfmwProc_TestTimeSequence
	.align	2
	.type	VfmwProc_SaveEL, %function
VfmwProc_SaveEL:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L109
	ldr	r6, .L115
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #912]
	cmp	r7, #0
	beq	.L114
	ldr	r1, .L115+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L115+8
	ldr	r0, [r5, #912]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #912]
.L109:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L114:
	ldr	r2, [r6, #1040]
	mov	r1, #50
	ldr	r8, .L115+8
	sub	r0, fp, #88
	add	ip, r2, #1
	ldr	r3, .L115+12
	str	r2, [sp]
	ldr	r9, [r8, #68]
	ldr	r2, .L115+16
	str	ip, [r6, #1040]
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #1044]
	cmp	r0, #0
	str	r0, [r5, #912]
	beq	.L112
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L115+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L109
.L112:
	sub	r2, fp, #88
	ldr	r1, .L115+24
	mov	r0, #32
	bl	dprint_vfmw
	b	.L109
.L116:
	.align	2
.L115:
	.word	.LANCHOR1
	.word	.LC28
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+8
	.word	.LC25
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	VfmwProc_SaveEL, .-VfmwProc_SaveEL
	.align	2
	.type	VfmwProc_SetCurProcChan, %function
VfmwProc_SetCurProcChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #32
	bhi	.L119
	ldr	ip, .L120
	mov	r2, r3
	ldr	r1, .L120+4
	mov	r0, #32
	str	r3, [ip, #1048]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L119:
	mov	r2, r3
	ldr	r1, .L120+8
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L121:
	.align	2
.L120:
	.word	.LANCHOR1
	.word	.LC30
	.word	.LC29
	UNWIND(.fnend)
	.size	VfmwProc_SetCurProcChan, .-VfmwProc_SetCurProcChan
	.align	2
	.type	VfmwProc_SetSaveFileAfterReset, %function
VfmwProc_SetSaveFileAfterReset:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #1
	bls	.L124
	mov	r2, r3
	ldr	r1, .L125
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L124:
	ldr	ip, .L125+4
	mov	r2, r3
	ldr	r1, .L125+8
	mov	r0, #32
	str	r3, [ip, #1052]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L126:
	.align	2
.L125:
	.word	.LC32
	.word	.LANCHOR1
	.word	.LC31
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveFileAfterReset, .-VfmwProc_SetSaveFileAfterReset
	.align	2
	.type	VfmwProc_SetUSE_FF_APT_EN, %function
VfmwProc_SetUSE_FF_APT_EN:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #1
	bls	.L129
	mov	r2, r3
	ldr	r1, .L130
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L129:
	ldr	ip, .L130+4
	mov	r2, r3
	ldr	r1, .L130+8
	mov	r0, #32
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L131:
	.align	2
.L130:
	.word	.LC34
	.word	USE_FF_APT_EN
	.word	.LC33
	UNWIND(.fnend)
	.size	VfmwProc_SetUSE_FF_APT_EN, .-VfmwProc_SetUSE_FF_APT_EN
	.align	2
	.type	VfmwProc_SetVp9DecFrameNum, %function
VfmwProc_SetVp9DecFrameNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L133
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L133+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L134:
	.align	2
.L133:
	.word	g_CfgVp9FrmNum
	.word	.LC35
	UNWIND(.fnend)
	.size	VfmwProc_SetVp9DecFrameNum, .-VfmwProc_SetVp9DecFrameNum
	.align	2
	.type	VfmwProc_SetDefaultOutputOrder, %function
VfmwProc_SetDefaultOutputOrder:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0]
	cmp	r4, #7
	mov	r2, r4
	bhi	.L137
	ldr	r1, .L138
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L138+4
	str	r4, [r3, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L137:
	ldr	r1, .L138+8
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L139:
	.align	2
.L138:
	.word	.LC37
	.word	.LANCHOR2
	.word	.LC36
	UNWIND(.fnend)
	.size	VfmwProc_SetDefaultOutputOrder, .-VfmwProc_SetDefaultOutputOrder
	.align	2
	.global	VCTRL_Isr_0
	.type	VCTRL_Isr_0, %function
VCTRL_Isr_0:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #0
	bl	VDMDRV_IsrProcess
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_0, .-VCTRL_Isr_0
	.align	2
	.global	VCTRL_Scd_Isr
	.type	VCTRL_Scd_Isr, %function
VCTRL_Scd_Isr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #0
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr, .-VCTRL_Scd_Isr
	.align	2
	.global	VCTRL_MMU_ISR
	.type	VCTRL_MMU_ISR, %function
VCTRL_MMU_ISR:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #0
	bl	VDMDRV_MMUIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_MMU_ISR, .-VCTRL_MMU_ISR
	.align	2
	.type	VfmwProc_SaveReorderMetadata, %function
VfmwProc_SaveReorderMetadata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L143
	ldr	r6, .L149
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #1056]
	cmp	r7, #0
	beq	.L148
	ldr	r1, .L149+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L149+8
	ldr	r0, [r5, #1056]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #1056]
.L143:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L148:
	ldr	r8, .L149+8
	mov	r0, #24
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #1184]
	mov	r1, #50
	ldr	r3, .L149+12
	add	ip, r2, #1
	str	ip, [r6, #1184]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #1188]
	cmp	r0, #0
	str	r0, [r5, #1056]
	beq	.L146
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L149+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L143
.L146:
	sub	r2, fp, #88
	ldr	r1, .L149+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L143
.L150:
	.align	2
.L149:
	.word	.LANCHOR1
	.word	.LC40
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+8
	.word	.LC38
	.word	.LC39
	UNWIND(.fnend)
	.size	VfmwProc_SaveReorderMetadata, .-VfmwProc_SaveReorderMetadata
	.align	2
	.type	VfmwProc_SaveMetadata, %function
VfmwProc_SaveMetadata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bls	.L157
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L157:
	ldr	r5, .L159
	mov	r1, r4
	ldr	r7, .L159+4
	mov	r0, #2
	add	r6, r7, r4, lsl #2
	ldr	r3, [r5, #24]
	blx	r3
	ldr	r8, [r6, #1192]
	cmp	r8, #0
	beq	.L158
	ldr	r1, .L159+8
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, [r5, #36]
	ldr	r0, [r6, #1192]
	blx	r3
	mov	r3, #0
	str	r3, [r6, #1192]
.L156:
	ldr	r3, [r5, #28]
	mov	r1, r4
	mov	r0, #2
	blx	r3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L158:
	mov	r0, #23
	ldr	r9, [r5, #68]
	bl	VFMW_GetString
	ldr	r2, [r7, #1320]
	ldr	r3, .L159+12
	mov	r1, #50
	add	ip, r2, #1
	str	ip, [r7, #1320]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	mov	r2, r8
	sub	r0, fp, #88
	ldr	r3, [r5, #32]
	mov	r1, #66
	blx	r3
	sub	r2, fp, #88
	str	r4, [r7, #1324]
	cmp	r0, #0
	str	r0, [r6, #1192]
	beq	.L154
	mov	r3, r4
	ldr	r1, .L159+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L156
.L154:
	ldr	r1, .L159+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L156
.L160:
	.align	2
.L159:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC40
	.word	.LANCHOR2+8
	.word	.LC41
	.word	.LC42
	UNWIND(.fnend)
	.size	VfmwProc_SaveMetadata, .-VfmwProc_SaveMetadata
	.align	2
	.type	VfmwProc_Save1DYUV, %function
VfmwProc_Save1DYUV:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, .L168
	ldmia	r0, {r5, r7}
	mov	r3, r0
	ldr	r8, [r3, #8]
	ldr	r2, [r4, #212]
	mov	r0, r5
	blx	r2
	subs	r6, r0, #0
	beq	.L167
	mov	r0, #22
	ldr	r9, [r4, #68]
	bl	VFMW_GetString
	mov	r1, #50
	ldr	r3, .L168+4
	str	r5, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	sub	r0, fp, #88
	ldr	r3, [r4, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r9, r0, #0
	beq	.L164
	ldr	r3, .L168+8
	ldr	r5, [r3, #148]
	cmp	r5, #0
	beq	.L165
	mov	r1, #1
	mov	r3, r8
	str	r1, [sp]
	mov	r2, r7
	mov	r1, r6
	blx	r5
.L166:
	mov	r0, r9
	ldr	r3, [r4, #36]
	blx	r3
	sub	r2, fp, #88
	ldr	r1, .L168+12
	mov	r0, #32
	bl	dprint_vfmw
.L163:
	ldr	r3, [r4, #156]
	mov	r0, r6
	blx	r3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L165:
	mov	r0, r5
	movw	r2, #6578
	ldr	r1, .L168+16
	bl	dprint_vfmw
	b	.L166
.L167:
	mov	r2, r5
	ldr	r1, .L168+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L163
.L164:
	sub	r2, fp, #88
	ldr	r1, .L168+24
	mov	r0, #32
	bl	dprint_vfmw
	b	.L163
.L169:
	.align	2
.L168:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+8
	.word	g_vdm_hal_fun_ptr
	.word	.LC45
	.word	.LC44
	.word	.LC43
	.word	.LC46
	UNWIND(.fnend)
	.size	VfmwProc_Save1DYUV, .-VfmwProc_Save1DYUV
	.align	2
	.type	VfmwProc_SaveSeg, %function
VfmwProc_SaveSeg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L170
	ldr	r6, .L176
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #1328]
	cmp	r7, #0
	beq	.L175
	ldr	r1, .L176+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L176+8
	ldr	r0, [r5, #1328]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #1328]
.L170:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L175:
	ldr	r8, .L176+8
	mov	r0, #19
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #1456]
	mov	r1, #50
	ldr	r3, .L176+12
	add	ip, r2, #1
	str	ip, [r6, #1456]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #1460]
	cmp	r0, #0
	str	r0, [r5, #1328]
	beq	.L173
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L176+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L170
.L173:
	sub	r2, fp, #88
	ldr	r1, .L176+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L170
.L177:
	.align	2
.L176:
	.word	.LANCHOR1
	.word	.LC49
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+8
	.word	.LC47
	.word	.LC48
	UNWIND(.fnend)
	.size	VfmwProc_SaveSeg, .-VfmwProc_SaveSeg
	.align	2
	.type	VfmwProc_Savestream, %function
VfmwProc_Savestream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L178
	ldr	r6, .L184
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #1464]
	cmp	r7, #0
	beq	.L183
	ldr	r1, .L184+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L184+8
	ldr	r0, [r5, #1464]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #1464]
.L178:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L183:
	ldr	r8, .L184+8
	mov	r0, #18
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #1592]
	mov	r1, #50
	ldr	r3, .L184+12
	add	ip, r2, #1
	str	ip, [r6, #1592]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #1596]
	cmp	r0, #0
	str	r0, [r5, #1464]
	beq	.L181
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L184+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L178
.L181:
	sub	r2, fp, #88
	ldr	r1, .L184+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L178
.L185:
	.align	2
.L184:
	.word	.LANCHOR1
	.word	.LC52
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+8
	.word	.LC50
	.word	.LC51
	UNWIND(.fnend)
	.size	VfmwProc_Savestream, .-VfmwProc_Savestream
	.align	2
	.type	VfmwProc_SaveYUV, %function
VfmwProc_SaveYUV:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	ldr	r6, [r0]
	cmp	r6, #31
	bls	.L196
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L196:
	ldr	r7, .L199
	mov	r1, r6
	ldr	r4, .L199+4
	mov	r0, #2
	add	r8, r4, r6, lsl #2
	ldr	r3, [r7, #24]
	blx	r3
	ldr	r5, [r8, #1600]
	cmp	r5, #0
	beq	.L197
	ldr	r1, .L199+8
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, [r7, #36]
	ldr	r0, [r8, #1600]
	mov	r5, #0
	blx	r3
	ldr	r0, [r4, #1740]
	ldr	r3, .L199+12
	mvn	r2, #0
	cmp	r0, r5
	str	r5, [r8, #1600]
	str	r5, [r4, #1756]
	str	r2, [r3, #76]
	str	r5, [r4, #1760]
	str	r5, [r4, #1764]
	str	r5, [r4, #1768]
	str	r5, [r4, #1772]
	str	r5, [r4, #1776]
	str	r5, [r4, #1784]
	str	r5, [r4, #1780]
	bne	.L198
.L192:
	ldr	r3, [r7, #28]
	mov	r1, r6
	mov	r0, #2
	blx	r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L198:
	ldr	r1, [r4, #1736]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [r4, #1748]
	ldr	r1, [r4, #1736]
	ldr	r0, [r4, #1740]
	bl	MEM_DelMemRecord
	mov	r1, r5
	ldr	r3, [r7, #48]
	mov	r2, #24
	ldr	r0, .L199+16
	blx	r3
	b	.L192
.L197:
	mov	r0, #20
	ldr	r10, [r7, #68]
	bl	VFMW_GetString
	ldr	r3, [r4, #1728]
	ldr	r9, .L199+12
	mov	r1, #100
	add	r2, r3, #1
	str	r2, [r4, #1728]
	str	r3, [sp]
	add	r3, r9, #8
	mov	r2, r0
	sub	r0, fp, #144
	blx	r10
	sub	r0, fp, #144
	ldr	r3, [r7, #32]
	mov	r2, r5
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r8, #1600]
	beq	.L189
	mov	r2, #24
	mov	r1, r5
	ldr	r3, [r7, #48]
	ldr	r0, .L199+16
	blx	r3
	mov	r0, #27
	mov	r3, #3
	str	r3, [r4, #1752]
	bl	VFMW_GetString
	str	r5, [sp]
	ldr	r3, .L199+16
	mov	r2, #47185920
	mov	r1, r5
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	beq	.L190
	ldr	r1, .L199+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r7, #36]
	ldr	r0, [r8, #1600]
	blx	r3
	mvn	r3, #0
	str	r5, [r8, #1600]
	str	r5, [r4, #1756]
	str	r5, [r4, #1760]
	str	r5, [r4, #1764]
	str	r5, [r4, #1768]
	str	r5, [r4, #1772]
	str	r5, [r4, #1776]
	str	r5, [r4, #1780]
	str	r3, [r9, #76]
	b	.L192
.L189:
	sub	r2, fp, #144
	ldr	r1, .L199+24
	mov	r0, #32
	bl	dprint_vfmw
	b	.L192
.L190:
	ldr	r2, [r4, #1748]
	ldr	r1, [r4, #1736]
	ldr	r0, [r4, #1740]
	bl	MEM_AddMemRecord
	ldr	ip, [r4, #1736]
	and	lr, r6, #3
	mov	r3, r6, lsr #24
	str	lr, [sp]
	sub	r2, fp, #144
	ldr	r1, .L199+28
	mov	r0, #32
	add	r5, ip, #9437184
	str	ip, [r4, #1764]
	str	r5, [r4, #1760]
	add	r5, ip, #11796480
	str	lr, [r4, #1780]
	add	lr, ip, #14155776
	str	r3, [r9, #76]
	str	lr, [r4, #1776]
	add	lr, ip, #23592960
	str	r5, [r4, #1756]
	str	lr, [r4, #1772]
	add	lr, ip, #25952256
	add	ip, ip, #28311552
	str	lr, [r4, #1768]
	str	ip, [r4, #1784]
	bl	dprint_vfmw
	b	.L192
.L200:
	.align	2
.L199:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC56
	.word	.LANCHOR2
	.word	.LANCHOR1+1732
	.word	.LC53
	.word	.LC55
	.word	.LC54
	UNWIND(.fnend)
	.size	VfmwProc_SaveYUV, .-VfmwProc_SaveYUV
	.align	2
	.type	VCTRL_ReleaseHalMem, %function
VCTRL_ReleaseHalMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L218
	ldr	r3, [r4, #168]
	cmp	r3, #0
	beq	.L202
	ldr	r3, .L218+4
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L216
	mov	r0, #0
	blx	r3
.L205:
	ldr	r2, [r4, #168]
	ldr	r1, [r4, #156]
	ldr	r0, [r4, #160]
	bl	MEM_DelMemRecord
	ldr	r1, [r4, #156]
	ldr	r0, [r4, #160]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L218+8
	mov	r2, #24
	mov	r1, #0
	ldr	r0, .L218+12
	ldr	r3, [r3, #48]
	blx	r3
.L202:
	ldr	r2, [r4, #216]
	ldr	r5, .L218
	cmp	r2, #0
	bne	.L217
.L206:
	ldr	r3, [r4, #192]
	ldr	r4, .L218
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, #0
	bl	SM_CloseSCDDrv
	ldr	r2, [r4, #192]
	ldr	r1, [r4, #180]
	ldr	r0, [r4, #184]
	bl	MEM_DelMemRecord
	ldr	r1, [r4, #180]
	ldr	r0, [r4, #184]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L218+8
	add	r0, r4, #176
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L217:
	ldr	r1, [r5, #204]
	ldr	r0, [r5, #208]
	bl	MEM_DelMemRecord
	ldr	r1, [r5, #204]
	ldr	r0, [r5, #208]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L218+8
	add	r0, r5, #200
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L206
.L216:
	mov	r0, r3
	movw	r2, #1815
	ldr	r1, .L218+16
	bl	dprint_vfmw
	b	.L205
.L219:
	.align	2
.L218:
	.word	.LANCHOR1
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+152
	.word	.LC44
	UNWIND(.fnend)
	.size	VCTRL_ReleaseHalMem, .-VCTRL_ReleaseHalMem
	.align	2
	.type	VfmwProc_SetScdPrint, %function
VfmwProc_SetScdPrint:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L221
	mov	r1, #1
	ldr	r0, [r0]
	mov	r3, #67108864
	ldr	r5, [r4]
	str	r3, [r4]
	bl	PrintScdRawState
	str	r5, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L222:
	.align	2
.L221:
	.word	g_PrintEnable
	UNWIND(.fnend)
	.size	VfmwProc_SetScdPrint, .-VfmwProc_SetScdPrint
	.align	2
	.type	VfmwProc_PrintTracer, %function
VfmwProc_PrintTracer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r1, .L224
	ldr	r4, [r0]
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DBG_PrintTracer
.L225:
	.align	2
.L224:
	.word	.LC57
	UNWIND(.fnend)
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
	.align	2
	.type	VfmwProc_SetSegBypass, %function
VfmwProc_SetSegBypass:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L228
	ldr	r3, .L229
	mov	r2, #1
	ldr	r1, .L229+4
	mov	r0, #32
	str	r2, [r3, #80]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L228:
	ldr	r2, .L229
	mov	r0, #32
	ldr	r1, .L229+8
	str	r3, [r2, #80]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L230:
	.align	2
.L229:
	.word	.LANCHOR2
	.word	.LC59
	.word	.LC58
	UNWIND(.fnend)
	.size	VfmwProc_SetSegBypass, .-VfmwProc_SetSegBypass
	.align	2
	.type	VfmwProc_SetSmmuIrqEnable, %function
VfmwProc_SetSmmuIrqEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r5, .L235
	ldr	r3, [r5, #84]
	cmp	r3, #1
	beq	.L234
	ldr	r1, .L235+4
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r5, #84]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L234:
	ldr	r1, .L235+8
	mov	r0, #32
	bl	dprint_vfmw
	str	r4, [r5, #84]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L236:
	.align	2
.L235:
	.word	.LANCHOR2
	.word	.LC61
	.word	.LC60
	UNWIND(.fnend)
	.size	VfmwProc_SetSmmuIrqEnable, .-VfmwProc_SetSmmuIrqEnable
	.align	2
	.type	VfmwProc_SetSedOnlyEnable, %function
VfmwProc_SetSedOnlyEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L239
	ldr	r3, .L240
	mov	r2, #1
	ldr	r1, .L240+4
	mov	r0, #32
	str	r2, [r3, #88]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L239:
	ldr	r2, .L240
	mov	r0, #32
	ldr	r1, .L240+8
	str	r3, [r2, #88]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L241:
	.align	2
.L240:
	.word	.LANCHOR2
	.word	.LC63
	.word	.LC62
	UNWIND(.fnend)
	.size	VfmwProc_SetSedOnlyEnable, .-VfmwProc_SetSedOnlyEnable
	.align	2
	.type	VfmwProc_CloseModuleLowly, %function
VfmwProc_CloseModuleLowly:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #31
	bhi	.L244
	ldr	lr, .L245
	mov	r2, r3
	mov	ip, #0
	ldr	r1, .L245+4
	mov	r0, #32
	ldr	r3, [lr, r3, asl #2]
	str	ip, [r3, #1240]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L244:
	ldr	r1, .L245+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L246:
	.align	2
.L245:
	.word	.LANCHOR1
	.word	.LC16
	.word	.LC64
	UNWIND(.fnend)
	.size	VfmwProc_CloseModuleLowly, .-VfmwProc_CloseModuleLowly
	.align	2
	.type	VfmwProc_OpenModuleLowly, %function
VfmwProc_OpenModuleLowly:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	cmp	r3, #31
	bhi	.L249
	ldr	lr, .L250
	mov	r2, r3
	mov	ip, #1
	ldr	r1, .L250+4
	mov	r0, #32
	ldr	r3, [lr, r3, asl #2]
	str	ip, [r3, #1240]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L249:
	ldr	r1, .L250+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L251:
	.align	2
.L250:
	.word	.LANCHOR1
	.word	.LC16
	.word	.LC64
	UNWIND(.fnend)
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	2
	.type	VCTRL_DelRecordEsBuf.isra.5, %function
VCTRL_DelRecordEsBuf.isra.5:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r3, [r1]
	mov	r4, r1
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L252
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L252
	cmp	r0, #1
	strne	r2, [fp, #-36]
	subne	r0, fp, #44
	ldrne	r2, [r3, #4]
	ldreq	r2, .L262
	ldrne	r3, .L262
	ldreq	r0, [r3, #4]
	strne	r2, [fp, #-40]
	ldreq	r3, [r2, #164]
	ldrne	r3, [r3, #180]
	blx	r3
	ldr	r3, [r4]
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	bl	MEM_DelMemRecord
.L252:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L263:
	.align	2
.L262:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_DelRecordEsBuf.isra.5, .-VCTRL_DelRecordEsBuf.isra.5
	.align	2
	.type	VCTRL_StopTask.part.15, %function
VCTRL_StopTask.part.15:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L276
	ldr	r3, [r5, #132]
	cmp	r3, #1
	beq	.L267
	ldr	r6, .L276+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L268
.L275:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L274
.L268:
	ldr	r3, [r5, #132]
	mov	r0, #10
	cmp	r3, #1
	bne	.L275
.L267:
	mov	r0, #0
.L266:
	mov	r3, #0
	str	r3, [r5, #136]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L274:
	mvn	r0, #0
	b	.L266
.L277:
	.align	2
.L276:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_StopTask.part.15, .-VCTRL_StopTask.part.15
	.align	2
	.type	VCTRL_StartTask.part.16, %function
VCTRL_StartTask.part.16:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L290
	ldr	r3, [r5, #132]
	cmp	r3, #2
	beq	.L281
	ldr	r6, .L290+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L282
.L289:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L288
.L282:
	ldr	r3, [r5, #132]
	mov	r0, #10
	cmp	r3, #2
	bne	.L289
.L281:
	mov	r0, #0
.L280:
	mov	r3, #0
	str	r3, [r5, #136]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L288:
	mvn	r0, #0
	b	.L280
.L291:
	.align	2
.L290:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_StartTask.part.16, .-VCTRL_StartTask.part.16
	.align	2
	.type	VCTRL_SetLastFrameState.part.24, %function
VCTRL_SetLastFrameState.part.24:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	ip, .L293
	movw	r3, #7172
	ldr	r2, .L293+4
	ldr	r1, .L293+8
	mov	r0, #0
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L294:
	.align	2
.L293:
	.word	.LC65
	.word	.LANCHOR0+20
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState.part.24, .-VCTRL_SetLastFrameState.part.24
	.align	2
	.type	VCTRL_CanBeDecodedByHardWare.part.26, %function
VCTRL_CanBeDecodedByHardWare.part.26:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	sub	r3, r0, #19
	cmp	r0, #14
	cmpne	r3, #1
	movls	r0, #1
	movhi	r0, #0
	eor	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_CanBeDecodedByHardWare.part.26, .-VCTRL_CanBeDecodedByHardWare.part.26
	.align	2
	.global	VCTRL_Suspend
	.type	VCTRL_Suspend, %function
VCTRL_Suspend:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r6, .L350
	ldr	r8, .L350+4
	ldr	r3, [r6]
	blx	r3
	ldr	r3, [r8]
	cmp	r3, #0
	mov	r9, r0
	beq	.L297
	mov	r0, #0
	blx	r3
.L298:
	mov	r0, #0
	mov	r4, #32
	mov	r5, r0
	bl	SCDDRV_PrepareSleep
	mov	r0, r5
	mov	r7, r5
	bl	VDMDRV_PrepareSleep
	ldr	r3, [r6]
	blx	r3
	mov	r10, r0
.L307:
	mov	r0, #0
	bl	SCDDRV_GetSleepStage
	cmp	r0, #2
	bne	.L342
	mov	r0, #0
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L343
.L302:
	ldr	r3, .L350+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L344
.L309:
	ldr	r3, .L350+12
	ldr	r2, [r3, #128]
	cmp	r2, #1
	beq	.L345
.L315:
	ldr	r3, [r6]
	blx	r3
	ldr	r1, .L350+16
	cmp	r9, r0
	rsbls	r2, r9, r0
	mvnhi	r9, r9
	addhi	r2, r9, r0
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L342:
	mov	r0, #0
	str	r7, [fp, #-48]
	bl	VDMDRV_GetSleepStage
	ldr	r3, [fp, #-48]
	cmp	r0, #2
	bne	.L318
	mov	r5, #1
	mov	r2, r5
.L319:
	tst	r2, r3
	bne	.L302
	subs	r4, r4, #1
	beq	.L346
	ldr	r3, [r6, #120]
	mov	r0, #10
	blx	r3
	eor	r3, r5, #1
	eor	r2, r7, #1
	orrs	r3, r3, r2
	bne	.L307
	ldr	r3, .L350+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L309
.L344:
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L310
	mov	r0, #0
	blx	r3
.L310:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	beq	.L347
	mov	r0, #0
	blx	r3
	ldr	r3, [r8, #8]
	cmp	r3, #0
	beq	.L312
.L349:
	mov	r0, #0
	blx	r3
.L313:
	ldr	r3, [r8, #40]
	cmp	r3, #0
	beq	.L309
	mov	r0, #0
	blx	r3
	ldr	r3, .L350+12
	ldr	r2, [r3, #128]
	cmp	r2, #1
	bne	.L315
.L345:
	mov	r2, #2
	str	r2, [r3, #136]
	bl	VCTRL_StopTask.part.15
	b	.L315
.L343:
	mov	r7, #1
	mov	r3, r7
.L318:
	mov	r2, r5
	b	.L319
.L346:
	ldr	r3, [r6]
	blx	r3
	str	r5, [sp]
	mov	r3, r7
	ldr	r1, .L350+20
	cmp	r10, r0
	rsbls	r2, r10, r0
	mvnhi	r10, r10
	addhi	r2, r10, r0
	mov	r0, #0
	bl	dprint_vfmw
	cmp	r7, #1
	beq	.L348
	mov	r2, #0
	ldr	r1, .L350+24
	mov	r0, r2
	bl	dprint_vfmw
	mov	r0, #0
	bl	SCDDRV_ForceSleep
	cmp	r5, #1
	beq	.L302
.L324:
	mov	r2, #0
	ldr	r1, .L350+28
	mov	r0, r2
	bl	dprint_vfmw
	mov	r0, #0
	bl	VDMDRV_ForceSleep
	b	.L302
.L348:
	cmp	r5, #1
	bne	.L324
	b	.L302
.L347:
	mov	r0, r3
	movw	r2, #345
	ldr	r1, .L350+32
	bl	dprint_vfmw
	ldr	r3, [r8, #8]
	cmp	r3, #0
	bne	.L349
.L312:
	mov	r0, r3
	movw	r2, #350
	ldr	r1, .L350+32
	bl	dprint_vfmw
	b	.L313
.L297:
	mov	r0, r3
	mov	r2, #247
	ldr	r1, .L350+32
	bl	dprint_vfmw
	b	.L298
.L351:
	.align	2
.L350:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	g_HalDisable
	.word	.LANCHOR1
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC66
	.word	.LC44
	UNWIND(.fnend)
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	2
	.type	VfmwProc_TestSuspend, %function
VfmwProc_TestSuspend:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r1, .L353
	mov	r2, r0
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Suspend
.L354:
	.align	2
.L353:
	.word	.LC70
	UNWIND(.fnend)
	.size	VfmwProc_TestSuspend, .-VfmwProc_TestSuspend
	.align	2
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L379
	ldr	r3, [r5]
	blx	r3
	ldr	r3, .L379+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r4, r0
	beq	.L375
.L356:
	mov	r0, #0
	bl	SCDDRV_ExitSleep
	mov	r0, #0
	bl	VDMDRV_ExitSleep
	ldr	r3, .L379+8
	ldr	r2, [r3, #128]
	cmp	r2, #1
	beq	.L376
.L366:
	ldr	r3, [r5]
	blx	r3
	ldr	r1, .L379+12
	cmp	r4, r0
	rsbls	r2, r4, r0
	mvnhi	r2, r4
	addhi	r2, r2, r0
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L375:
	ldr	r6, .L379+16
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L377
	mov	r0, #0
	blx	r3
.L358:
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L378
	mov	r0, #0
	blx	r3
.L360:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L361
	mov	r0, #0
	blx	r3
.L361:
	ldr	r3, [r6, #36]
	cmp	r3, #0
	beq	.L362
	mov	r0, #0
	blx	r3
.L362:
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L363
	mov	r0, #0
	blx	r3
.L364:
	ldr	r0, [r6, #72]
	cmp	r0, #0
	beq	.L365
	blx	r0
	b	.L356
.L376:
	str	r2, [r3, #136]
	bl	VCTRL_StartTask.part.16
	b	.L366
.L378:
	mov	r0, r3
	mov	r2, #392
	ldr	r1, .L379+20
	bl	dprint_vfmw
	b	.L360
.L363:
	mov	r0, r3
	movw	r2, #399
	ldr	r1, .L379+20
	bl	dprint_vfmw
	b	.L364
.L365:
	mov	r2, #400
	ldr	r1, .L379+20
	bl	dprint_vfmw
	b	.L356
.L377:
	mov	r0, r3
	movw	r2, #387
	ldr	r1, .L379+20
	bl	dprint_vfmw
	b	.L358
.L380:
	.align	2
.L379:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HalDisable
	.word	.LANCHOR1
	.word	.LC71
	.word	g_vdm_hal_fun_ptr
	.word	.LC44
	UNWIND(.fnend)
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	2
	.type	VfmwProc_TestResume, %function
VfmwProc_TestResume:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r1, .L382
	mov	r2, r0
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Resume
.L383:
	.align	2
.L382:
	.word	.LC70
	UNWIND(.fnend)
	.size	VfmwProc_TestResume, .-VfmwProc_TestResume
	.align	2
	.global	ChanCtx_Init
	.type	ChanCtx_Init, %function
ChanCtx_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L387
	mov	r2, #384
	mov	r1, #0
	ldr	r0, .L387+4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, .L387+8
	mvn	r1, #0
	add	r2, r3, #128
.L385:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L385
	ldmfd	sp, {fp, sp, pc}
.L388:
	.align	2
.L387:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_ChanCtx
	.word	g_ChanCtx+124
	UNWIND(.fnend)
	.size	ChanCtx_Init, .-ChanCtx_Init
	.align	2
	.global	VCTRL_RecordPosTime
	.type	VCTRL_RecordPosTime, %function
VCTRL_RecordPosTime:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #11
	mov	r4, r0
	bhi	.L396
	ldr	r6, .L397
	ldrb	r3, [r6, r0]	@ zero_extendqisi2
	cmp	r3, #14
	movhi	r3, #0
	strhib	r3, [r6, r0]
	cmp	r0, #10
	mov	r5, r3
	ldreq	r3, .L397+4
	moveq	r2, #1
	streqb	r2, [r3, #1788]
	ldr	r3, .L397+8
	ldr	r3, [r3, #4]
	blx	r3
	rsb	r3, r4, r4, lsl #4
	ldr	r1, .L397+12
	add	r3, r3, r5
	ldrb	r2, [r6, r4]	@ zero_extendqisi2
	add	r2, r2, #1
	strb	r2, [r6, r4]
	str	r0, [r1, r3, asl #2]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L396:
	str	r0, [sp]
	movw	r3, #641
	ldr	r2, .L397+16
	mov	r0, #32
	ldr	r1, .L397+20
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L398:
	.align	2
.L397:
	.word	g_TimeRecId
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecTable
	.word	.LANCHOR0+44
	.word	.LC72
	UNWIND(.fnend)
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	2
	.global	VCTRL_RecordData
	.type	VCTRL_RecordData, %function
VCTRL_RecordData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #1
	bhi	.L404
	ldr	ip, .L405
	rsb	r2, r0, r0, lsl #4
	ldr	r4, .L405+4
	ldrb	r3, [ip, r0]	@ zero_extendqisi2
	cmp	r3, #14
	addls	lr, r3, #1
	movhi	r3, #0
	add	r3, r2, r3
	uxtbls	lr, lr
	movhi	lr, #1
	str	r1, [r4, r3, asl #2]
	strb	lr, [ip, r0]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L404:
	str	r0, [sp]
	mov	r3, #664
	ldr	r2, .L405+8
	mov	r0, #32
	ldr	r1, .L405+12
	bl	dprint_vfmw
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L406:
	.align	2
.L405:
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LANCHOR0+64
	.word	.LC73
	UNWIND(.fnend)
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	2
	.global	VCTRL_Isr_1
	.type	VCTRL_Isr_1, %function
VCTRL_Isr_1:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #1
	bl	VDMDRV_IsrProcess
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_1, .-VCTRL_Isr_1
	.align	2
	.global	VCTRL_Isr_2
	.type	VCTRL_Isr_2, %function
VCTRL_Isr_2:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #2
	bl	VDMDRV_IsrProcess
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_2, .-VCTRL_Isr_2
	.align	2
	.global	VCTRL_Scd_Isr_1
	.type	VCTRL_Scd_Isr_1, %function
VCTRL_Scd_Isr_1:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #1
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr_1, .-VCTRL_Scd_Isr_1
	.align	2
	.global	VCTRL_Scd_Isr_2
	.type	VCTRL_Scd_Isr_2, %function
VCTRL_Scd_Isr_2:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #2
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr_2, .-VCTRL_Scd_Isr_2
	.align	2
	.global	VCTRL_InformVdmFree
	.type	VCTRL_InformVdmFree, %function
VCTRL_InformVdmFree:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L412
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L413:
	.align	2
.L412:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	2
	.global	VCTRL_ExtraWakeUpThread
	.type	VCTRL_ExtraWakeUpThread, %function
VCTRL_ExtraWakeUpThread:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L415
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L416:
	.align	2
.L415:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	2
	.global	VCTRL_SetMoreGapEnable
	.type	VCTRL_SetMoreGapEnable, %function
VCTRL_SetMoreGapEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	ldrhi	ip, .L426
	movwhi	r3, #799
	bhi	.L423
	ldr	r3, .L426+4
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L424
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L425
	cmp	r1, #1
	strls	r1, [r3, #1224]
	movls	r0, #0
	mvnhi	r0, #0
	movhi	r2, #0
	strhi	r2, [r3, #1224]
.L419:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L425:
	ldr	ip, .L426+8
	movw	r3, #801
.L423:
	ldr	r2, .L426+12
	mov	r0, #0
	ldr	r1, .L426+16
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L419
.L424:
	ldr	ip, .L426+20
	mov	r0, r3
	ldr	r2, .L426+12
	mov	r3, #800
	ldr	r1, .L426+16
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L419
.L427:
	.align	2
.L426:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC74
	.word	.LANCHOR0+84
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetMoreGapEnable, .-VCTRL_SetMoreGapEnable
	.align	2
	.global	VCTRL_SetCallBack
	.type	VCTRL_SetCallBack, %function
VCTRL_SetCallBack:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r1, #0
	beq	.L436
	cmp	r0, #0
	beq	.L432
	cmp	r0, #1
	beq	.L433
	mov	r3, r0
	ldr	r2, .L437
	ldr	r1, .L437+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L430:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L433:
	ldr	r3, .L437+8
	mov	r0, #0
	str	r1, [r3, #372]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L432:
	ldr	r3, .L437+8
	str	r1, [r3, #368]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L436:
	ldr	ip, .L437+12
	mov	r0, r1
	movw	r3, #914
	ldr	r2, .L437
	ldr	r1, .L437+16
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L430
.L438:
	.align	2
.L437:
	.word	.LANCHOR0+108
	.word	.LC76
	.word	.LANCHOR1
	.word	.LC75
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	2
	.global	VCTRL_StopTask
	.type	VCTRL_StopTask, %function
VCTRL_StopTask:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L441
	ldr	r2, [r3, #128]
	cmp	r2, #1
	bne	.L440
	mov	r2, #2
	str	r2, [r3, #136]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_StopTask.part.15
.L440:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L442:
	.align	2
.L441:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_StopTask, .-VCTRL_StopTask
	.align	2
	.global	VCTRL_StartTask
	.type	VCTRL_StartTask, %function
VCTRL_StartTask:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L445
	ldr	r2, [r3, #128]
	cmp	r2, #1
	bne	.L444
	str	r2, [r3, #136]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_StartTask.part.16
.L444:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L446:
	.align	2
.L445:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_StartTask, .-VCTRL_StartTask
	.align	2
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r7, r1, #0
	mov	r4, r0
	ldreq	ip, .L455
	moveq	r0, r7
	movweq	r3, #1132
	beq	.L452
	cmp	r4, #31
	bhi	.L453
	ldr	r5, .L455+4
	ldr	r0, [r5, r4, asl #2]
	cmp	r0, #0
	beq	.L454
	ldr	r6, .L455+8
	mov	r2, #12
	add	r0, r0, #192
	add	r5, r5, #1792
	ldr	r3, [r6, #52]
	blx	r3
	mov	r0, r4, asl #4
	sub	r0, r0, r4, asl #2
	ldr	r3, [r6, #52]
	mov	r1, r7
	add	r0, r5, r0
	mov	r2, #12
	blx	r3
	mov	r0, #0
.L449:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L453:
	ldr	ip, .L455+12
	movw	r3, #1133
	ldr	r2, .L455+16
	mov	r0, #0
	ldr	r1, .L455+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L449
.L454:
	ldr	ip, .L455+24
	movw	r3, #1134
.L452:
	ldr	r2, .L455+16
	ldr	r1, .L455+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L449
.L456:
	.align	2
.L455:
	.word	.LC77
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC78
	.word	.LANCHOR0+128
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	2
	.global	VCTRL_SetSendStreamAgainFlag
	.type	VCTRL_SetSendStreamAgainFlag, %function
VCTRL_SetSendStreamAgainFlag:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L461
	ldr	r3, .L463
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r3, r0, #471040
	movne	r0, #0
	strne	r1, [r3, #1588]
	beq	.L462
.L459:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L461:
	ldr	ip, .L463+4
	movw	r3, #1145
	ldr	r2, .L463+8
	mov	r0, #0
	ldr	r1, .L463+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L459
.L462:
	ldr	ip, .L463+16
	movw	r3, #1146
	ldr	r2, .L463+8
	ldr	r1, .L463+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L459
.L464:
	.align	2
.L463:
	.word	.LANCHOR1
	.word	.LC78
	.word	.LANCHOR0+156
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetSendStreamAgainFlag, .-VCTRL_SetSendStreamAgainFlag
	.align	2
	.global	VCTRL_GetSendStreamAgainFlag
	.type	VCTRL_GetSendStreamAgainFlag, %function
VCTRL_GetSendStreamAgainFlag:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L469
	ldr	r3, .L471
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #471040
	ldrne	r0, [r0, #1588]
	beq	.L470
.L467:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L469:
	ldr	ip, .L471+4
	movw	r3, #1155
	ldr	r2, .L471+8
	mov	r0, #0
	ldr	r1, .L471+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L467
.L470:
	ldr	ip, .L471+16
	movw	r3, #1156
	ldr	r2, .L471+8
	ldr	r1, .L471+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L467
.L472:
	.align	2
.L471:
	.word	.LANCHOR1
	.word	.LC78
	.word	.LANCHOR0+188
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetSendStreamAgainFlag, .-VCTRL_GetSendStreamAgainFlag
	.align	2
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	mov	r4, r0
	bhi	.L478
	ldr	r5, .L480
	ldr	r1, [r5, r0, asl #2]
	cmp	r1, #0
	beq	.L478
	ldr	r2, .L480+4
	mov	r3, r0, asl #4
	sub	r3, r3, r0, asl #2
	add	r0, r5, #1792
	add	r0, r0, r3
	add	r1, r1, #192
	ldr	r3, [r2, #60]
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	bne	.L479
	ldr	r1, [r5, r4, asl #2]
	add	r0, r1, #192
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L479:
	mov	r3, r4
	movw	r2, #1171
	ldr	r1, .L480+8
	mov	r0, #0
	bl	dprint_vfmw
.L478:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L481:
	.align	2
.L480:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC79
	UNWIND(.fnend)
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	2
	.global	VCTRL_GetStreamSize
	.type	VCTRL_GetStreamSize, %function
VCTRL_GetStreamSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	ldrhi	ip, .L490
	movhi	r3, #1184
	bhi	.L487
	ldr	r3, .L490+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L488
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L489
	add	r0, r0, #99328
	add	r0, r0, #688
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetSegStreamSize
.L489:
	ldr	ip, .L490+8
	movw	r3, #1186
.L487:
	ldr	r2, .L490+12
	mov	r0, #0
	ldr	r1, .L490+16
	str	ip, [sp]
	bl	dprint_vfmw
.L484:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L488:
	ldr	ip, .L490+20
	movw	r3, #1185
	ldr	r2, .L490+12
	ldr	r1, .L490+16
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L484
.L491:
	.align	2
.L490:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC81
	.word	.LANCHOR0+220
	.word	.LC0
	.word	.LC80
	UNWIND(.fnend)
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	2
	.global	VCTRL_CheckFreshRaw
	.type	VCTRL_CheckFreshRaw, %function
VCTRL_CheckFreshRaw:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #31
	mov	r3, #0
	str	r3, [fp, #-28]
	str	r3, [fp, #-24]
	movhi	r0, r3
	ldrhi	ip, .L502
	movwhi	r3, #1198
	bhi	.L499
	ldr	r2, .L502+4
	ldr	r0, [r2, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L502+8
	movweq	r3, #1199
	beq	.L499
	ldr	r2, [r0, #4]
	cmp	r2, #1
	bne	.L501
	add	r4, r0, #1680
	sub	r1, fp, #28
	add	r4, r4, #8
	mov	r0, r4
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L500
	mov	r0, r4
	sub	r1, fp, #24
	bl	GetRawStreamSize
	cmp	r0, #0
	bne	.L500
	ldr	r3, [fp, #-24]
	mov	r0, #22
	ldr	r2, [fp, #-28]
	ldr	r1, .L502+12
	bl	dprint_vfmw
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L500
	ldr	r0, [fp, #-24]
	cmp	r0, #3
	movgt	r0, #0
	mvnle	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L501:
	ldr	ip, .L502+16
	mov	r0, r3
	mov	r3, #1200
.L499:
	ldr	r2, .L502+20
	ldr	r1, .L502+24
	str	ip, [sp]
	bl	dprint_vfmw
.L500:
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L503:
	.align	2
.L502:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC80
	.word	.LC82
	.word	.LC81
	.word	.LANCHOR0+240
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
	.align	2
	.global	VCTRL_CheckFreshSeg
	.type	VCTRL_CheckFreshSeg, %function
VCTRL_CheckFreshSeg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	cmp	r0, #31
	mov	r2, #0
	str	r2, [fp, #-20]
	str	r2, [fp, #-16]
	movhi	r0, r2
	ldrhi	ip, .L511
	movwhi	r3, #1221
	bhi	.L509
	ldr	r3, .L511+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L510
	ldr	r1, [r0, #4]
	cmp	r1, #1
	ldrne	ip, .L511+8
	movne	r0, r2
	movwne	r3, #1223
	bne	.L509
	add	r0, r0, #99328
	sub	r2, fp, #16
	sub	r1, fp, #20
	add	r0, r0, #688
	bl	GetFreshSegStream
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r0, #22
	ldr	r1, .L511+12
	bl	dprint_vfmw
	ldr	r0, [fp, #-20]
	cmp	r0, #0
	movgt	r0, #0
	mvnle	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L510:
	ldr	ip, .L511+16
	movw	r3, #1222
.L509:
	ldr	r2, .L511+20
	ldr	r1, .L511+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L512:
	.align	2
.L511:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC81
	.word	.LC83
	.word	.LC80
	.word	.LANCHOR0+260
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	2
	.global	VCTRL_SetDiscardPicParam
	.type	VCTRL_SetDiscardPicParam, %function
VCTRL_SetDiscardPicParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	mov	r4, r0
	mov	r0, r1
	bhi	.L520
	cmp	r1, #0
	ldreq	ip, .L522
	movweq	r3, #1240
	beq	.L519
	ldr	r5, .L522+4
	ldr	r0, [r5, r4, asl #2]
	cmp	r0, #0
	beq	.L521
	ldr	r3, .L522+8
	mov	r2, #8
	add	r0, r0, #1552
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r2, [r5, r4, asl #2]
	mov	r0, #0
	ldr	r3, [r2, #1552]
	sub	r3, r3, #1
	cmp	r3, #1
	strhi	r0, [r2, #1552]
.L515:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L520:
	ldr	ip, .L522+12
	movw	r3, #1239
	ldr	r2, .L522+16
	mov	r0, #0
	ldr	r1, .L522+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L515
.L521:
	ldr	ip, .L522+24
	movw	r3, #1241
.L519:
	ldr	r2, .L522+16
	ldr	r1, .L522+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L515
.L523:
	.align	2
.L522:
	.word	.LC84
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC65
	.word	.LANCHOR0+280
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	2
	.global	VCTRL_PartitionMemForStdUser
	.type	VCTRL_PartitionMemForStdUser, %function
VCTRL_PartitionMemForStdUser:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r4, .L541
	cmp	r2, #31
	cmpgt	r1, #31
	mov	r6, r2
	mov	r7, r1
	mov	r9, r0
	movle	r2, #1
	movgt	r2, #0
	str	r3, [fp, #-72]
	ldr	r5, [r4, r0, asl #2]
	ble	.L537
	ldr	r3, [fp, #-72]
	ldr	r1, [fp, #4]
	cmp	r1, #0
	cmpne	r3, #0
	moveq	r8, #1
	movne	r8, #0
	beq	.L538
	ldr	r10, .L541+4
	mov	r2, #20
	mov	r1, r8
	sub	r0, fp, #64
	ldr	r3, [r10, #48]
	blx	r3
	sub	r1, fp, #64
	mov	r0, r9
	str	r6, [fp, #-56]
	mov	r3, #1
	str	r6, [fp, #-48]
	str	r7, [fp, #-60]
	str	r7, [fp, #-52]
	strb	r8, [fp, #-63]
	strb	r8, [fp, #-62]
	strb	r8, [fp, #-61]
	strb	r3, [fp, #-64]
	bl	FSP_ConfigInstance
	subs	r6, r0, #0
	bne	.L528
	ldr	r2, [fp, #4]
	sub	r3, fp, #68
	ldr	r1, [fp, #-72]
	mov	r0, r9
	bl	FSP_ConfigFrameBuf
	subs	r7, r0, #0
	bne	.L539
	mov	r0, r9
	add	r1, r4, #2176
	bl	FSP_GetInstInfo
	movw	r3, #2178
	ldrsb	r3, [r4, r3]
	cmp	r3, #16
	movge	r3, #16
	cmp	r3, #2
	str	r3, [r5, #520]
	ble	.L540
	ldr	ip, [r4, #2180]
	mov	r1, r6
	mov	r2, #64
	ldr	r3, [r10, #48]
	add	r0, r5, #452
	str	ip, [r5, #516]
	blx	r3
	ldr	r1, [r5, #520]
	cmp	r1, #0
	ble	.L526
	add	r4, r4, #2176
	add	r5, r5, #448
	mov	r3, r6
.L533:
	ldr	r2, [r4, #16]
	add	r3, r3, #1
	cmp	r3, r1
	add	r4, r4, #92
	str	r2, [r5, #4]!
	bne	.L533
.L526:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L538:
	mov	r0, r2
	ldr	r1, .L541+8
	bl	dprint_vfmw
	mvn	r6, #0
	b	.L526
.L528:
	mov	r0, r8
	ldr	r1, .L541+12
	bl	dprint_vfmw
.L536:
	mvn	r6, #0
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L539:
	mov	r0, r6
	ldr	r1, .L541+16
	bl	dprint_vfmw
	b	.L536
.L540:
	mov	r0, r7
	movw	r3, #1351
	ldr	r2, .L541+20
	ldr	r1, .L541+24
	bl	dprint_vfmw
	b	.L536
.L537:
	mov	r3, r6
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L541+28
	bl	dprint_vfmw
	mvn	r6, #0
	b	.L526
.L542:
	.align	2
.L541:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC86
	.word	.LC89
	.word	.LC87
	.word	.LANCHOR0+308
	.word	.LC88
	.word	.LC85
	UNWIND(.fnend)
	.size	VCTRL_PartitionMemForStdUser, .-VCTRL_PartitionMemForStdUser
	.align	2
	.global	VCTRL_UnInstallChan
	.type	VCTRL_UnInstallChan, %function
VCTRL_UnInstallChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_UnInstallChan, .-VCTRL_UnInstallChan
	.align	2
	.global	DelAllFrameMemRecord
	.type	DelAllFrameMemRecord, %function
DelAllFrameMemRecord:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r1, #0
	movne	r4, r1
	addne	r5, r4, #2304
	beq	.L561
.L550:
	ldr	r3, [r4]
	cmp	r3, #255
	beq	.L547
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #24]
	ldr	r0, [r4, #32]
	bl	MEM_DelMemRecord
.L547:
	ldr	r3, [r4, #4]
	cmp	r3, #255
	beq	.L548
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #48]
	bl	MEM_DelMemRecord
.L548:
	ldr	r3, [r4, #8]
	cmp	r3, #255
	beq	.L549
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #56]
	ldr	r0, [r4, #64]
	bl	MEM_DelMemRecord
.L549:
	add	r4, r4, #72
	cmp	r4, r5
	bne	.L550
	mov	r0, #0
.L546:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L561:
	ldr	ip, .L562
	mov	r0, r1
	movw	r3, #1390
	ldr	r2, .L562+4
	ldr	r1, .L562+8
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L546
.L563:
	.align	2
.L562:
	.word	.LC90
	.word	.LANCHOR0+340
	.word	.LC0
	UNWIND(.fnend)
	.size	DelAllFrameMemRecord, .-DelAllFrameMemRecord
	.align	2
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r1, #0
	beq	.L593
	ldr	r5, [r4]
	cmp	r5, #0
	beq	.L594
	ldr	r3, [r4, #24]
	cmp	r3, #1
	beq	.L569
	ldr	r2, [r5, #16]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #8]
	bl	MEM_DelMemRecord
.L570:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	beq	.L595
.L568:
	ldr	r5, [r4, #4]
	cmp	r5, #0
	beq	.L596
	ldr	r2, [r5, #16]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #32]
	cmp	r3, #1
	beq	.L597
.L573:
	ldr	r5, [r4, #20]
	cmp	r5, #0
	beq	.L598
	ldr	r2, [r5, #16]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #8]
	bl	MEM_DelMemRecord
	ldr	r0, [r5, #8]
	cmp	r0, #0
	bne	.L599
.L575:
	ldr	r5, [r4, #8]
	cmp	r5, #0
	beq	.L600
.L576:
	ldr	r2, [r5, #16]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #36]
	cmp	r3, #1
	bne	.L577
	ldr	r0, [r5, #8]
	cmp	r0, #0
	bne	.L601
.L577:
	ldr	r3, .L603
	ldr	r0, [r5, #4]
	ldr	r3, [r3, #164]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L569:
	ldr	r1, [r4, #12]
	cmp	r1, #0
	beq	.L602
	bl	DelAllFrameMemRecord
	cmp	r0, #0
	beq	.L570
	ldr	r1, .L603+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #28]
	cmp	r3, #1
	bne	.L568
.L595:
	ldr	r0, [r5, #8]
	cmp	r0, #0
	beq	.L568
	ldr	r1, [r5, #4]
	bl	MEM_ReleaseMemBlock
	b	.L568
.L599:
	ldr	r1, [r5, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r5, [r4, #8]
	cmp	r5, #0
	bne	.L576
.L600:
	ldr	r2, .L603+8
	mov	r0, r5
	ldr	r1, .L603+12
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L597:
	ldr	r0, [r5, #8]
	cmp	r0, #0
	beq	.L573
	ldr	r1, [r5, #4]
	bl	MEM_ReleaseMemBlock
	b	.L573
.L598:
	mov	r0, r5
	ldr	r2, .L603+8
	ldr	r1, .L603+16
	bl	dprint_vfmw
	b	.L575
.L596:
	mov	r0, r5
	ldr	r2, .L603+8
	ldr	r1, .L603+20
	bl	dprint_vfmw
	b	.L573
.L601:
	ldr	r1, [r5, #4]
	bl	MEM_ReleaseMemBlock
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L602:
	mov	r0, r1
	ldr	r2, .L603+8
	ldr	r1, .L603+24
	bl	dprint_vfmw
	b	.L570
.L594:
	mov	r0, r5
	ldr	r2, .L603+8
	ldr	r1, .L603+28
	bl	dprint_vfmw
	b	.L568
.L593:
	mov	r0, r4
	ldr	r2, .L603+8
	ldr	r1, .L603+32
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L604:
	.align	2
.L603:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC94
	.word	.LANCHOR0+364
	.word	.LC97
	.word	.LC96
	.word	.LC95
	.word	.LC93
	.word	.LC92
	.word	.LC91
	UNWIND(.fnend)
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	2
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #26
	moveq	r3, #46848
	movwne	r3, #14296
	movteq	r3, 180
	movtne	r3, 15
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.align	2
	.global	VCTRL_GetVfmwChanNum
	.type	VCTRL_GetVfmwChanNum, %function
VCTRL_GetVfmwChanNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L615
	mov	r0, #0
	add	r1, r3, #128
.L610:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r0, r0, #1
	cmp	r3, r1
	bne	.L610
	ldmfd	sp, {fp, sp, pc}
.L616:
	.align	2
.L615:
	.word	.LANCHOR1-4
	UNWIND(.fnend)
	.size	VCTRL_GetVfmwChanNum, .-VCTRL_GetVfmwChanNum
	.align	2
	.global	VCTRL_GetChanCfg
	.type	VCTRL_GetChanCfg, %function
VCTRL_GetChanCfg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	mov	r3, r1
	bhi	.L623
	cmp	r1, #0
	ldreq	ip, .L625
	moveq	r0, r1
	movweq	r3, #2605
	beq	.L622
	ldr	r2, .L625+4
	ldr	r1, [r2, r0, asl #2]
	cmp	r1, #0
	beq	.L624
	ldr	ip, .L625+8
	mov	r0, r3
	add	r1, r1, #44
	mov	r2, #148
	ldr	r3, [ip, #52]
	blx	r3
	mov	r0, #0
.L619:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L623:
	ldr	ip, .L625+12
	movw	r3, #2604
	ldr	r2, .L625+16
	mov	r0, #0
	ldr	r1, .L625+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L619
.L624:
	ldr	ip, .L625+24
	mov	r0, r1
	movw	r3, #2606
.L622:
	ldr	r2, .L625+16
	ldr	r1, .L625+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L619
.L626:
	.align	2
.L625:
	.word	.LC98
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC65
	.word	.LANCHOR0+388
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	2
	.global	VCTRL_CheckCommonParameter
	.type	VCTRL_CheckCommonParameter, %function
VCTRL_CheckCommonParameter:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L640
	ldr	r2, [r1, #8]
	ldr	r3, [r3, r0, asl #2]
	ldr	r0, [r3, #52]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #72]
	ldr	r2, [r1, #28]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #68]
	ldr	r2, [r1, #24]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #76]
	ldr	r2, [r1, #32]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #80]
	ldr	r2, [r1, #36]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #84]
	ldr	r2, [r1, #40]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #100]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #112]
	ldr	r2, [r1, #68]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #108]
	ldr	r2, [r1, #64]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #104]
	ldr	r2, [r1, #60]
	cmp	r0, r2
	bne	.L639
	ldr	r0, [r3, #116]
	ldr	r2, [r1, #72]
	cmp	r0, r2
	bne	.L639
	ldr	r3, [r3, #176]
	ldr	r0, [r1, #132]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L639:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L641:
	.align	2
.L640:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_CheckCommonParameter, .-VCTRL_CheckCommonParameter
	.align	2
	.global	VCTRL_CmpConfigParameter
	.type	VCTRL_CmpConfigParameter, %function
VCTRL_CmpConfigParameter:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L649
	mov	r5, r1
	ldr	r4, [r3, r0, asl #2]
	ldr	r3, [r4, #600]
	cmp	r3, #22
	beq	.L647
	bl	VCTRL_CheckCommonParameter
	cmp	r0, #0
	bne	.L647
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L648
	sub	r3, r3, #10
	cmp	r3, #2
	ldmhifd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #56]
	ldr	r0, [r5, #12]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L648:
	ldr	r2, [r4, #56]
	ldr	r3, [r5, #12]
	cmp	r2, r3
	bne	.L647
	ldr	r3, [r4, #60]
	ldr	r0, [r5, #16]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L647:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L650:
	.align	2
.L649:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	2
	.global	VCTRL_CheckChanWH
	.type	VCTRL_CheckChanWH, %function
VCTRL_CheckChanWH:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L656
	ldr	r2, .L656+4
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r2]
	ldr	r0, [r3, #1300]
	ldr	r3, [r3, #1304]
	cmp	r0, r2
	bgt	.L652
	ldr	r0, .L656+8
	ldr	r0, [r0]
	cmp	r3, r0
	ble	.L654
.L652:
	ldr	r0, [r1, #8]
	cmp	r0, #20
	cmpne	r0, #0
	bic	r0, r0, #2
	movne	r3, #1
	moveq	r3, #0
	cmp	r0, #13
	moveq	r0, #0
	andne	r0, r3, #1
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, .L656+8
	mov	r0, #0
	ldr	r1, .L656+12
	ldr	r3, [r3]
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L654:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L657:
	.align	2
.L656:
	.word	.LANCHOR1
	.word	g_ChipMaxWidth
	.word	g_ChipMaxHeight
	.word	.LC99
	UNWIND(.fnend)
	.size	VCTRL_CheckChanWH, .-VCTRL_CheckChanWH
	.align	2
	.global	VCTRL_ConfigChanCompress
	.type	VCTRL_ConfigChanCompress, %function
VCTRL_ConfigChanCompress:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, [r1, #56]
	ldr	r3, .L664
	cmp	r2, #2
	ldr	r2, [r3, r0, asl #2]
	beq	.L663
	add	r0, r3, r0, lsl #4
	ldr	r3, [r0, #396]
	ldr	r1, [r0, #392]
	cmp	r3, #1
	str	r3, [r2, #1212]
	str	r1, [r2, #1208]
	mvnne	r3, #0
	ldreq	r1, [r0, #400]
	ldreq	r3, [r0, #404]
	strne	r3, [r2, #1216]
	streq	r1, [r2, #1216]
	str	r3, [r2, #1220]
	ldmfd	sp, {fp, sp, pc}
.L663:
	mov	r1, #0
	mvn	r3, #0
	str	r1, [r2, #1208]
	str	r1, [r2, #1212]
	str	r3, [r2, #1216]
	str	r3, [r2, #1220]
	ldmfd	sp, {fp, sp, pc}
.L665:
	.align	2
.L664:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_ConfigChanCompress, .-VCTRL_ConfigChanCompress
	.align	2
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L674
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L672
	ldr	r3, [r3, #600]
	sub	r2, r3, #10
	cmp	r2, #2
	bls	.L673
.L669:
	cmp	r3, #14
	cmpne	r3, #4
	beq	.L671
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L668:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L673:
	ldr	r2, .L674+4
	ldr	r2, [r2, #-3056]
	tst	r2, #1
	bne	.L669
.L671:
	mvn	r0, #0
	b	.L668
.L672:
	ldr	ip, .L674+8
	mov	r0, r3
	ldr	r2, .L674+12
	movw	r3, #3004
	ldr	r1, .L674+16
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L668
.L675:
	.align	2
.L674:
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC2
	.word	.LANCHOR0+408
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	2
	.global	VCTRL_ReleaseStream
	.type	VCTRL_ReleaseStream, %function
VCTRL_ReleaseStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L680
	ldr	r2, .L682
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L681
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L678:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L680:
	ldr	ip, .L682+4
	movw	r3, #3249
	ldr	r2, .L682+8
	mov	r0, #0
	ldr	r1, .L682+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L678
.L681:
	ldr	ip, .L682+16
	mov	r0, r3
	ldr	r2, .L682+8
	movw	r3, #3250
	ldr	r1, .L682+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L678
.L683:
	.align	2
.L682:
	.word	.LANCHOR1
	.word	.LC100
	.word	.LANCHOR0+424
	.word	.LC0
	.word	.LC101
	UNWIND(.fnend)
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	2
	.global	VCTRL_ImageOutputEnable
	.type	VCTRL_ImageOutputEnable, %function
VCTRL_ImageOutputEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #31
	mov	r4, r0
	mov	r6, r1
	bhi	.L687
	ldr	r5, .L688
	mov	r0, #4
	ldr	r3, [r5, #12]
	blx	r3
	ldr	r3, .L688+4
	ldr	r2, [r6]
	mov	r0, #4
	ldr	r3, [r3, r4, asl #2]
	str	r2, [r3, #12]
	ldr	r3, [r5, #16]
	blx	r3
	mov	r0, #0
.L686:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L687:
	ldr	ip, .L688+8
	movw	r3, #3319
	ldr	r2, .L688+12
	mov	r0, #0
	ldr	r1, .L688+16
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L686
.L689:
	.align	2
.L688:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+444
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_ImageOutputEnable, .-VCTRL_ImageOutputEnable
	.align	2
	.global	VCTRL_TryToRelSpecialFrm
	.type	VCTRL_TryToRelSpecialFrm, %function
VCTRL_TryToRelSpecialFrm:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	mov	r5, r0
	bhi	.L725
	ldr	r6, .L730
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L726
	add	r3, r0, #475136
	ldr	r8, [r3, #1608]
	cmp	r8, #0
	beq	.L694
	ldr	r3, [r3, #1084]
	cmp	r1, r3
	movne	r3, #0
	bne	.L697
	b	.L727
.L700:
	ldr	r2, [r0, r2]
	cmp	r1, r2
	beq	.L695
.L697:
	add	r3, r3, #1
	movw	r2, #17468
	cmp	r3, r8
	movt	r2, 7
	mov	ip, r3, asl #4
	mov	r4, r3
	add	r2, ip, r2
	bne	.L700
.L694:
	mvn	r0, #0
.L718:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L727:
	mov	r4, #0
.L695:
	add	r3, r0, #462848
	ldr	r3, [r3, #3616]
	cmp	r3, r1
	movwne	r3, #7804
	movne	r7, #1
	movtne	r3, 7
	addne	r3, r0, r3
	bne	.L704
	b	.L728
.L701:
	add	r7, r7, #1
	cmp	r7, #32
	beq	.L729
.L704:
	ldr	r2, [r3]
	add	r3, r3, #92
	cmp	r2, r1
	bne	.L701
.L698:
	ldr	r9, .L730+4
	mov	r0, #3
	sub	r8, r8, #1
	ldr	r3, [r9, #12]
	blx	r3
	ldr	r3, [r6, r5, asl #2]
	mov	r1, #92
	movw	r2, #7704
	movt	r2, 7
	mov	r0, #3
	mla	r7, r1, r7, r3
	movw	r3, #10648
	movt	r3, 7
	mov	r1, #0
	add	r2, r7, r2
	add	r3, r7, r3
	ldr	r7, [r9, #16]
	strb	r1, [r2, #2]
	strb	r1, [r3, #2]
	blx	r7
	cmp	r8, r4
	bls	.L710
	mov	r7, r4, asl #4
.L703:
	add	r4, r4, #1
	movw	r0, #17464
	ldr	r1, [r6, r5, asl #2]
	movt	r0, 7
	movw	r3, #17464
	add	r0, r7, r0
	mov	r7, r4, asl #4
	movt	r3, 7
	add	r3, r7, r3
	add	r0, r1, r0
	mov	r2, #16
	add	r1, r1, r3
	ldr	r3, [r9, #52]
	blx	r3
	cmp	r8, r4
	bhi	.L703
.L702:
	ldr	r0, [r6, r5, asl #2]
	mov	r8, r8, asl #4
	movw	r3, #17464
	ldr	r4, [r9, #48]
	movt	r3, 7
	add	r3, r8, r3
	add	r0, r0, r3
	mov	r2, #16
	mov	r1, #0
	blx	r4
	ldr	r3, [r6, r5, asl #2]
	mov	r0, #0
	add	r3, r3, #475136
	ldr	r2, [r3, #1608]
	sub	r2, r2, #1
	str	r2, [r3, #1608]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L729:
	add	r0, r0, #442368
	movw	r4, #2179
	movw	r3, #3474
	ldr	r2, .L730+8
	ldrsb	ip, [r0, r4]
	mov	r0, #1
	ldr	r1, .L730+12
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r6, r5, asl #2]
	add	r3, ip, #442368
	ldrsb	r3, [r3, r4]
	cmp	r3, #0
	movgt	r4, #0
	ble	.L694
.L706:
	mov	r2, #92
	movw	r3, #3477
	mla	ip, r2, r4, ip
	mov	r0, #1
	ldr	r2, .L730+8
	add	r4, r4, r0
	ldr	r1, .L730+16
	add	ip, ip, #462848
	ldr	ip, [ip, #3616]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r6, r5, asl #2]
	movw	r3, #51331
	movt	r3, 6
	add	r3, ip, r3
	ldrsb	r3, [r3]
	cmp	r3, r4
	bgt	.L706
	b	.L694
.L725:
	ldr	ip, .L730+20
	movw	r3, #3439
	ldr	r2, .L730+8
	mov	r0, #0
	ldr	r1, .L730+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L718
.L710:
	mov	r8, r4
	b	.L702
.L728:
	mov	r7, #0
	b	.L698
.L726:
	ldr	ip, .L730+20
	mov	r3, #3440
	ldr	r2, .L730+8
	ldr	r1, .L730+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L718
.L731:
	.align	2
.L730:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+468
	.word	.LC103
	.word	.LC102
	.word	.LC65
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_TryToRelSpecialFrm, .-VCTRL_TryToRelSpecialFrm
	.align	2
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 640
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #648)
	sub	sp, sp, #648
	cmp	r0, #31
	mov	r5, r0
	mov	r4, r1
	bhi	.L764
	ldr	r7, .L777
	ldr	r0, [r7, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L777+4
	moveq	r3, #3600
	beq	.L761
	cmp	r1, #0
	beq	.L765
	ldr	r8, .L777+8
	mov	r0, #4
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r6, [r7, r5, asl #2]
	cmp	r6, #0
	beq	.L766
	ldr	r3, [r6, #4]
	cmp	r3, #1
	bne	.L767
	ldr	r3, [r6, #12]
	cmp	r3, #1
	bne	.L768
	add	r0, r6, #475136
	mov	r1, r4
	add	r0, r0, #1680
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r9, r0
	beq	.L769
	mov	r0, #9
	mvn	r6, #0
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L752
.L751:
	ldr	r3, [r7, r5, asl #2]
	mov	r0, #4
	ldr	r2, [r8, #16]
	add	r3, r3, #491520
	ldrb	r3, [r3, #1116]	@ zero_extendqisi2
	strb	r3, [r4, #392]
	blx	r2
.L760:
	mov	r0, r6
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L769:
	ldr	r2, [r4, #192]
	mvn	r3, #0
	str	r3, [r4, #188]
	cmp	r2, #1
	beq	.L770
.L741:
	mov	r0, #9
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L771
.L753:
	ldr	r2, [r4, #64]
	mov	r6, #0
	ldr	r3, [r7, r5, asl #2]
	str	r2, [r3, #428]
	ldr	r2, [r4, #276]
	str	r2, [r3, #432]
	b	.L751
.L771:
	mov	r6, #0
.L752:
	ldr	r3, [r8]
	blx	r3
	ldr	r3, .L777+12
	ldr	r1, .L777+16
	add	r3, r3, r5, lsl #2
	ldr	r2, [r3, #-3052]
	ldr	r1, [r1]
	rsb	r2, r2, r0
	cmp	r2, r1
	bhi	.L772
.L750:
	cmp	r6, #0
	bne	.L751
	b	.L753
.L772:
	mov	r2, r5, asl #24
	str	r0, [r3, #-3052]
	add	r2, r2, #589824
	movw	r1, #3752
	cmp	r9, #1
	addeq	r2, r2, #1
	ldr	r0, .L777+20
	bl	DBG_AddTrace
	b	.L750
.L770:
	ldr	r2, [r4, #180]
	cmp	r2, #0
	beq	.L773
	ldr	r0, [r4, #24]
	mov	r2, #3
	ldr	r1, [r4, #20]
	str	r3, [r4, #188]
	str	r9, [r4, #180]
	str	r0, [r4, #200]
	str	r1, [r4, #196]
	str	r2, [r4, #276]
	b	.L741
.L768:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	ldr	r2, .L777+24
	ldr	r1, .L777+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r6, #0
	b	.L760
.L767:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	mov	r2, r5
	ldr	r1, .L777+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r6, #0
	b	.L760
.L773:
	ldr	r0, [r7, r5, asl #2]
	sub	r1, fp, #676
	add	r0, r0, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	bne	.L774
	ldr	r3, [r4, #184]
	ldr	r2, [fp, #-492]
	cmp	r3, r2
	bge	.L744
	ldr	r1, [fp, #-652]
	mov	r3, #3
	ldr	r2, [fp, #-656]
	mov	r9, #1
	ldr	r6, [fp, #-496]
	ldr	r0, [fp, #-648]
	cmp	r6, #0
	str	r1, [r4, #200]
	str	r2, [r4, #196]
	ldr	r1, [fp, #-644]
	movne	r6, #0
	ldr	r2, [fp, #-528]
	str	r0, [r4, #204]
	str	r1, [r4, #208]
	str	r2, [r4, #188]
	str	r3, [r4, #276]
	strne	r9, [r4, #180]
.L749:
	mov	r0, #9
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L752
	cmp	r6, #0
	bne	.L751
	b	.L753
.L764:
	ldr	ip, .L777+36
	movw	r3, #3599
	ldr	r2, .L777+24
	mov	r0, #0
	ldr	r1, .L777+40
	mvn	r6, #0
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L760
.L774:
	ldr	r3, [r7, r5, asl #2]
	mov	r6, r0
	add	r0, r3, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReturnImage
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	b	.L760
.L765:
	ldr	ip, .L777+44
	mov	r0, r1
	movw	r3, #3601
.L761:
	ldr	r2, .L777+24
	mvn	r6, #0
	ldr	r1, .L777+40
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L760
.L744:
	ldr	r0, [r7, r5, asl #2]
	bgt	.L775
	cmp	r3, #0
	bne	.L747
	add	r0, r0, #475136
	mvn	r6, #0
	add	r0, r0, #1680
	mvn	r9, #1
	bl	SYNTAX_ReturnImage
	ldr	r0, [r7, r5, asl #2]
	mov	r1, r4
	add	r0, r0, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r4, #184]
	ldr	r2, .L777+24
	mov	r0, #1
	ldr	r1, .L777+48
	bl	dprint_vfmw
	b	.L749
.L747:
	add	r0, r0, #475136
	mov	r1, r4
	add	r0, r0, #1680
	ldr	r6, .L777
	bl	SYNTAX_ReleaseImage
	ldr	r3, [fp, #-496]
	cmp	r3, #0
	beq	.L776
	ldr	r3, [r4, #184]
	mov	r0, #1
	ldr	r2, .L777+24
	ldr	r1, .L777+52
	bl	dprint_vfmw
	sub	r1, fp, #676
	ldr	r3, [r8, #52]
	mov	r2, #640
	mov	r0, r4
	blx	r3
	ldr	r3, [fp, #-652]
	ldr	r1, [fp, #-656]
	mvn	r0, #0
	mov	r2, #3
	str	r0, [r4, #188]
	str	r3, [r4, #200]
	mov	r3, #1
	str	r1, [r4, #196]
	str	r2, [r4, #276]
	str	r3, [r4, #180]
	b	.L741
.L766:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	mov	r0, r6
	movw	r2, #3608
	ldr	r1, .L777+56
	bl	dprint_vfmw
	mvn	r6, #0
	b	.L760
.L775:
	add	r0, r0, #475136
	mvn	r6, #0
	add	r0, r0, #1680
	mvn	r9, #1
	bl	SYNTAX_ReturnImage
	ldr	r0, [r7, r5, asl #2]
	mov	r1, r4
	add	r0, r0, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReleaseImage
	ldr	r1, [fp, #-492]
	ldr	r3, [r4, #184]
	mov	r0, #1
	ldr	r2, .L777+24
	str	r1, [sp]
	ldr	r1, .L777+60
	bl	dprint_vfmw
	b	.L749
.L776:
	ldr	r0, [r6, r5, asl #2]
	sub	r1, fp, #676
	mvn	r6, #0
	mvn	r9, #1
	add	r0, r0, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r4, #184]
	ldr	r2, .L777+24
	mov	r0, #1
	ldr	r1, .L777+52
	bl	dprint_vfmw
	b	.L749
.L778:
	.align	2
.L777:
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	g_TraceImgPeriod
	.word	.LANCHOR0+516
	.word	.LANCHOR0+496
	.word	.LC107
	.word	.LC106
	.word	.LC65
	.word	.LC0
	.word	.LC104
	.word	.LC109
	.word	.LC110
	.word	.LC105
	.word	.LC108
	UNWIND(.fnend)
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	2
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 640
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #652)
	sub	sp, sp, #652
	cmp	r0, #31
	mov	r4, r0
	mov	r5, r1
	ldrhi	ip, .L808
	movwhi	r3, #3795
	bhi	.L799
	ldr	r6, .L808+4
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L808+8
	movweq	r3, #3796
	beq	.L800
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L802
	cmp	r1, #0
	beq	.L803
	ldr	r7, .L808+12
	mov	r0, #4
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r0, [r6, r4, asl #2]
	cmp	r0, #0
	movweq	r2, #3804
	ldreq	r1, .L808+16
	beq	.L801
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L804
	ldr	r1, [r5, #20]
	mov	r0, r4
	bl	VCTRL_TryToRelSpecialFrm
	subs	r8, r0, #0
	beq	.L805
	ldr	r0, [r6, r4, asl #2]
	mov	r1, r5
	add	r0, r0, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r5, #188]
	cmn	r3, #1
	mov	r8, r0
	beq	.L788
	ldr	r0, [r6, r4, asl #2]
	sub	r1, fp, #676
	str	r3, [fp, #-528]
	add	r0, r0, #475136
	add	r0, r0, #1680
	bl	SYNTAX_ReleaseImage
	mov	r8, r0
.L788:
	mov	r0, #10
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L806
.L790:
	subs	r4, r8, #1
	mvnne	r4, #0
	cmp	r4, #0
	bne	.L807
.L792:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
.L781:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L805:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	movw	r2, #3825
	ldr	r1, .L808+20
	mov	r0, r8
	bl	dprint_vfmw
	mov	r4, r8
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L807:
	ldr	r2, .L808+24
	mov	r0, #0
	ldr	r1, .L808+28
	bl	dprint_vfmw
	b	.L792
.L806:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, .L808+32
	ldr	r1, .L808+36
	add	r3, r3, r4, lsl #2
	ldr	r2, [r3, #-2924]
	ldr	r1, [r1]
	rsb	r2, r2, r0
	mov	ip, r0
	cmp	r2, r1
	bls	.L790
	mov	r2, r4, asl #24
	movw	r1, #3854
	add	r2, r2, #655360
	ldr	r0, .L808+40
	cmp	r8, #1
	addeq	r2, r2, #1
	str	ip, [r3, #-2924]
	bl	DBG_AddTrace
	b	.L790
.L804:
	ldr	r1, .L808+44
	movw	r2, #3813
	mov	r0, #0
.L801:
	bl	dprint_vfmw
	ldr	r3, [r7, #16]
	mov	r0, #4
	mvn	r4, #0
	blx	r3
	b	.L781
.L802:
	ldr	ip, .L808+48
	movw	r3, #3797
.L799:
	ldr	r2, .L808+24
	mov	r0, #0
	ldr	r1, .L808+52
	mvn	r4, #0
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L781
.L803:
	ldr	ip, .L808+56
	mov	r0, r1
	movw	r3, #3798
.L800:
	ldr	r2, .L808+24
	mvn	r4, #0
	ldr	r1, .L808+52
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L781
.L809:
	.align	2
.L808:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC105
	.word	.LC113
	.word	.LANCHOR0+536
	.word	.LC114
	.word	.LANCHOR3
	.word	g_TraceImgPeriod
	.word	.LANCHOR0+560
	.word	.LC112
	.word	.LC111
	.word	.LC0
	.word	.LC104
	UNWIND(.fnend)
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	2
	.global	VCTRL_GetVidStd
	.type	VCTRL_GetVidStd, %function
VCTRL_GetVidStd:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	bhi	.L811
	ldr	r3, .L815
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L811
	ldr	r2, [r3, #4]
	cmp	r2, #1
	beq	.L814
	mov	r3, r0
	movw	r2, #3881
	ldr	r1, .L815+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #22
	ldmfd	sp, {fp, sp, pc}
.L811:
	movw	r2, #3875
	ldr	r1, .L815+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #22
	ldmfd	sp, {fp, sp, pc}
.L814:
	ldr	r0, [r3, #600]
	ldmfd	sp, {fp, sp, pc}
.L816:
	.align	2
.L815:
	.word	.LANCHOR1
	.word	.LC116
	.word	.LC115
	UNWIND(.fnend)
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	2
	.global	VCTRL_GetHDRConfigInfo
	.type	VCTRL_GetHDRConfigInfo, %function
VCTRL_GetHDRConfigInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L822
	ldr	r3, .L825
	ldr	r2, [r3, r0, asl #2]
	cmp	r2, #0
	beq	.L823
	cmp	r1, #0
	beq	.L824
	ldrb	r2, [r2, #44]	@ zero_extendqisi2
	strb	r2, [r1, #65]
	ldr	r2, [r3, r0, asl #2]
	ldrb	r2, [r2, #46]	@ zero_extendqisi2
	strb	r2, [r1, #66]
	ldr	r2, [r3, r0, asl #2]
	ldr	r2, [r2, #156]
	str	r2, [r1, #76]
	ldr	r2, [r3, r0, asl #2]
	ldr	r2, [r2, #160]
	str	r2, [r1, #68]
	ldr	r3, [r3, r0, asl #2]
	ldr	r3, [r3, #164]
	str	r3, [r1, #72]
.L817:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L822:
	ldr	ip, .L825+4
	movw	r3, #3890
	ldr	r2, .L825+8
	mov	r0, #0
	ldr	r1, .L825+12
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L823:
	ldr	ip, .L825+16
	mov	r0, r2
	movw	r3, #3891
	ldr	r2, .L825+8
	ldr	r1, .L825+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L817
.L824:
	ldr	ip, .L825+20
	mov	r0, r1
	movw	r3, #3892
	ldr	r2, .L825+8
	ldr	r1, .L825+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L817
.L826:
	.align	2
.L825:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+584
	.word	.LC0
	.word	.LC2
	.word	.LC117
	UNWIND(.fnend)
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	2
	.global	VCTRL_GetDecParam
	.type	VCTRL_GetDecParam, %function
VCTRL_GetDecParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	bhi	.L849
	ldr	r3, .L852
	ldr	r5, [r3, r0, asl #2]
	cmp	r5, #0
	moveq	r3, r5
	beq	.L828
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L851
.L849:
	mov	r3, #0
.L828:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L851:
	ldr	r3, [r5, #8]
	cmp	r3, #1
	bne	.L849
	ldr	r3, [r5, #600]
	cmp	r3, #18
	ldrls	pc, [pc, r3, asl #2]
	b	.L829
.L831:
	.word	.L830
	.word	.L839
	.word	.L833
	.word	.L839
	.word	.L829
	.word	.L839
	.word	.L836
	.word	.L829
	.word	.L839
	.word	.L839
	.word	.L839
	.word	.L839
	.word	.L839
	.word	.L839
	.word	.L829
	.word	.L841
	.word	.L842
	.word	.L839
	.word	.L844
.L839:
	add	r3, r5, #475136
	ldr	r4, [r3, #1692]
.L845:
	cmp	r4, #0
	moveq	r3, r4
	beq	.L828
	ldr	r3, .L852+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r5, #40]
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L836:
	add	r3, r5, #475136
	ldr	r4, [r3, #1704]
	b	.L845
.L841:
	add	r3, r5, #475136
	ldr	r4, [r3, #1916]
	b	.L845
.L842:
	add	r3, r5, #479232
	ldr	r4, [r3, #456]
	b	.L845
.L833:
	add	r3, r5, #475136
	ldr	r4, [r3, #2724]
	b	.L845
.L844:
	add	r3, r5, #475136
	ldr	r4, [r3, #1728]
	b	.L845
.L830:
	add	r3, r5, #475136
	ldr	r4, [r3, #2048]
	b	.L845
.L829:
	ldr	r2, .L852+8
	mov	r0, #0
	ldr	r1, .L852+12
	bl	dprint_vfmw
	mov	r3, #0
	b	.L828
.L853:
	.align	2
.L852:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+608
	.word	.LC118
	UNWIND(.fnend)
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	2
	.global	VCTRL_IsSedOnlyMode
	.type	VCTRL_IsSedOnlyMode, %function
VCTRL_IsSedOnlyMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r1, #0
	beq	.L862
	cmp	r0, #0
	beq	.L857
	cmp	r0, #16
	bne	.L863
	add	r0, r4, #4096
	ldrb	r0, [r0, #1084]	@ zero_extendqisi2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L863:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L857:
	ldrb	r0, [r4, #1184]	@ zero_extendqisi2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L862:
	ldr	r1, .L864
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L865:
	.align	2
.L864:
	.word	.LC119
	UNWIND(.fnend)
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	2
	.global	VCTRL_ClearDecparam
	.type	VCTRL_ClearDecparam, %function
VCTRL_ClearDecparam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L884
	ldr	r3, .L885
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #600]
	cmp	r2, #18
	ldrls	pc, [pc, r2, asl #2]
	b	.L866
.L870:
	.word	.L869
	.word	.L879
	.word	.L872
	.word	.L879
	.word	.L866
	.word	.L879
	.word	.L875
	.word	.L866
	.word	.L879
	.word	.L879
	.word	.L879
	.word	.L879
	.word	.L879
	.word	.L879
	.word	.L866
	.word	.L880
	.word	.L881
	.word	.L879
	.word	.L883
.L880:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #1916]
.L866:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L879:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #1692]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L884:
	ldr	ip, .L885+4
	movw	r3, #4340
	ldr	r2, .L885+8
	mov	r0, #0
	ldr	r1, .L885+12
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L875:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #1704]
	b	.L866
.L869:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #2048]
	b	.L866
.L883:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #1728]
	b	.L866
.L872:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #2724]
	b	.L866
.L881:
	add	r3, r3, #479232
	mov	r2, #0
	str	r2, [r3, #456]
	b	.L866
.L886:
	.align	2
.L885:
	.word	.LANCHOR1
	.word	.LC120
	.word	.LANCHOR0+628
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	2
	.global	VCTRL_VdmProcSedOnly
	.type	VCTRL_VdmProcSedOnly, %function
VCTRL_VdmProcSedOnly:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #31
	mov	r4, r0
	mov	r6, r1
	ldrhi	ip, .L899
	movwhi	r3, #4418
	bhi	.L897
	ldr	r5, .L899+4
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L898
	ldr	r3, [r3, #8]
	cmp	r3, #1
	beq	.L891
	ldr	ip, .L899+8
	movw	r3, #4420
.L897:
	ldr	r2, .L899+12
	mov	r0, #0
	ldr	r1, .L899+16
	str	ip, [sp]
	bl	dprint_vfmw
.L887:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L891:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L887
	ldr	r2, [r5, r4, asl #2]
	ldr	r3, [r2, #600]
	cmp	r3, #0
	beq	.L892
	cmp	r3, #16
	bne	.L887
	movw	r0, #18072
	mov	r1, r6
	movt	r0, 7
	add	r0, r2, r0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	HEVCDEC_VDMProcSedOnly
.L892:
	movw	r0, #18072
	mov	r1, r6
	movt	r0, 7
	add	r0, r2, r0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	H264DEC_VDMProcSedOnly
.L898:
	ldr	ip, .L899+20
	mov	r0, r3
	ldr	r2, .L899+12
	movw	r3, #4419
	ldr	r1, .L899+16
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L887
.L900:
	.align	2
.L899:
	.word	.LC121
	.word	.LANCHOR1
	.word	.LC122
	.word	.LANCHOR0+648
	.word	.LC0
	.word	.LC111
	UNWIND(.fnend)
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	2
	.global	VCTRL_GetImageBuffer
	.type	VCTRL_GetImageBuffer, %function
VCTRL_GetImageBuffer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	ldrhi	ip, .L929
	movwhi	r3, #4453
	bhi	.L925
	ldr	r3, .L929+4
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L926
	ldr	r0, [r3, #8]
	cmp	r0, #1
	bne	.L927
	ldr	r2, [r3, #600]
	cmp	r2, #18
	ldrls	pc, [pc, r2, asl #2]
	b	.L921
.L907:
	.word	.L906
	.word	.L908
	.word	.L909
	.word	.L910
	.word	.L921
	.word	.L911
	.word	.L912
	.word	.L921
	.word	.L913
	.word	.L914
	.word	.L915
	.word	.L915
	.word	.L915
	.word	.L916
	.word	.L921
	.word	.L917
	.word	.L918
	.word	.L919
	.word	.L920
.L920:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS2DEC_GetImageBuffer
.L906:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L908:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_GetImageBuffer
.L909:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L910:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L911:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_GetImageBuffer
.L912:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_GetImageBuffer
.L913:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_GetImageBuffer
.L914:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_GetImageBuffer
.L915:
	ldr	r2, .L929+8
	ldr	r2, [r2, #-3056]
	tst	r2, #1
	bne	.L928
.L903:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L916:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_GetImageBuffer
.L918:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L919:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_GetImageBuffer
.L917:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_GetImageBuffer
.L927:
	ldr	ip, .L929+12
	movw	r3, #4455
.L925:
	ldr	r2, .L929+16
	mov	r0, #0
	ldr	r1, .L929+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L903
.L921:
	mov	r0, #0
	b	.L903
.L928:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_GetImageBuffer
.L926:
	ldr	ip, .L929+24
	mov	r0, r3
	ldr	r2, .L929+16
	movw	r3, #4454
	ldr	r1, .L929+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L903
.L930:
	.align	2
.L929:
	.word	.LC121
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC122
	.word	.LANCHOR0+672
	.word	.LC0
	.word	.LC111
	UNWIND(.fnend)
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	2
	.global	VCTRL_ConfigFFFBSpeed
	.type	VCTRL_ConfigFFFBSpeed, %function
VCTRL_ConfigFFFBSpeed:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	ldrhi	ip, .L941
	movwhi	r3, #4569
	bhi	.L937
	ldr	r3, .L941+4
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	moveq	r0, r3
	ldreq	ip, .L941+8
	movweq	r3, #4570
	beq	.L938
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L939
	cmp	r1, #0
	ldrne	r2, [r1]
	movne	r0, #0
	strne	r2, [r3, #1228]
	beq	.L940
.L933:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L939:
	ldr	ip, .L941+12
	movw	r3, #4571
.L937:
	ldr	r2, .L941+16
	mov	r0, #0
	ldr	r1, .L941+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L933
.L940:
	ldr	ip, .L941+24
	mov	r0, r1
	movw	r3, #4572
.L938:
	ldr	r2, .L941+16
	ldr	r1, .L941+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L933
.L942:
	.align	2
.L941:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC123
	.word	.LC124
	.word	.LANCHOR0+696
	.word	.LC0
	.word	.LC125
	UNWIND(.fnend)
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	2
	.global	VCTRL_ConfigPVRInfo
	.type	VCTRL_ConfigPVRInfo, %function
VCTRL_ConfigPVRInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	ldrhi	ip, .L953
	movwhi	r3, #4582
	bhi	.L949
	ldr	r3, .L953+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L953+8
	movweq	r3, #4583
	beq	.L950
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L951
	cmp	r1, #0
	beq	.L952
	ldr	r3, .L953+12
	add	r0, r0, #1264
	mov	r2, #20
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L945:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L951:
	ldr	ip, .L953+16
	movw	r3, #4584
.L949:
	ldr	r2, .L953+20
	mov	r0, #0
	ldr	r1, .L953+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L945
.L952:
	ldr	ip, .L953+28
	mov	r0, r1
	movw	r3, #4585
.L950:
	ldr	r2, .L953+20
	ldr	r1, .L953+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L945
.L954:
	.align	2
.L953:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC123
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC124
	.word	.LANCHOR0+720
	.word	.LC0
	.word	.LC125
	UNWIND(.fnend)
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	2
	.global	VCTRL_IsChanActive
	.type	VCTRL_IsChanActive, %function
VCTRL_IsChanActive:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L962
	ldr	r3, .L963
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L961
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L961
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L961
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L961
	ldr	r0, [r3, #600]
	cmp	r0, #22
	movne	r0, #0
	mvneq	r0, #0
.L957:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L961:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L962:
	ldr	ip, .L963+4
	movw	r3, #4594
	ldr	r2, .L963+8
	mov	r0, #0
	ldr	r1, .L963+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L957
.L964:
	.align	2
.L963:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+740
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	2
	.global	USERDEC_Init
	.type	USERDEC_Init, %function
USERDEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r1
	mov	r5, r0
	moveq	r4, #1
	movne	r4, #0
	beq	.L982
	ldr	r3, .L984
	mov	r1, r4
	ldr	r7, [r0, #352]
	mov	r2, #368
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r5, #8
	str	r7, [r5, #352]
	bl	ResetVoQueue
	ldr	r0, .L984+4
	mov	r1, r4
	str	r6, [r5]
	b	.L970
.L968:
	add	r1, r1, #1
	cmp	r1, #32
	beq	.L983
.L970:
	ldr	r2, [r0], #4
	movw	r3, #18072
	movt	r3, 7
	cmp	r2, #0
	add	r3, r2, r3
	beq	.L968
	cmp	r5, r3
	bne	.L968
	cmn	r1, #1
	str	r1, [r5, #360]
	beq	.L969
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L983:
	mvn	r3, #0
	str	r3, [r5, #360]
.L969:
	ldr	r1, .L984+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L982:
	ldr	r2, .L984+12
	mov	r0, #0
	ldr	r1, .L984+16
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L985:
	.align	2
.L984:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC127
	.word	.LANCHOR0+760
	.word	.LC126
	UNWIND(.fnend)
	.size	USERDEC_Init, .-USERDEC_Init
	.align	2
	.global	USERDEC_RecycleImage
	.type	USERDEC_RecycleImage, %function
USERDEC_RecycleImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	mov	r5, r1
	beq	.L988
	mov	r2, #0
	ldr	r0, [r4, #360]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #360]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L989
	add	r5, r0, #560
	add	r8, r0, #544
	ldr	r1, [r0, #544]
	mov	r6, #0
	ldr	r0, [r4, #360]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r8]
	ldr	r0, [r4, #360]
	ldr	r1, [r5, #-8]
	bl	FreeUsdByDec
	strd	r6, [r5, #-8]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L989:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L988:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	USERDEC_RecycleImage, .-USERDEC_RecycleImage
	.align	2
	.global	VCTRL_GetUsrdecFrame
	.type	VCTRL_GetUsrdecFrame, %function
VCTRL_GetUsrdecFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r7, .L1009
	mov	r6, r0
	mov	r5, r1
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L1004
	ldr	r2, [r3, #600]
	cmp	r2, #20
	bne	.L1005
	ldr	r3, [r3, #520]
	cmp	r3, #2
	ble	.L1006
	mov	r1, #1
	bl	FSP_NewLogicFs
	subs	r8, r0, #0
	blt	.L1007
	mov	r1, r8
	mov	r0, r6
	bl	FSP_GetLogicFs
	mov	r2, r8
	ldr	r1, .L1009+4
	mov	r4, r0
	mov	r0, #18
	bl	dprint_vfmw
	cmp	r4, #0
	beq	.L1008
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L997
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L997
	ldr	r2, [r2, #8]
	mov	r0, #18
	ldr	r3, [r3, #8]
	ldr	r1, .L1009+8
	bl	dprint_vfmw
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #8]
	str	r3, [r5, #40]
	ldr	r3, [r7, r6, asl #2]
	ldr	r3, [r3, #516]
	str	r3, [r5, #20]
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #24]
	str	r3, [r5, #24]
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #24]
	bl	MEM_Phy2Vir
	mov	r3, #0
	mov	r2, r3
	str	r3, [r5, #36]
	str	r0, [r5, #32]
.L992:
	mov	r0, r2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1005:
	ldr	r1, .L1009+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L992
.L1006:
	ldr	r1, .L1009+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L992
.L997:
	ldr	r1, .L1009+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L992
.L1007:
	ldr	r1, .L1009+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L992
.L1004:
	ldr	ip, .L1009+28
	mov	r0, r3
	ldr	r2, .L1009+32
	movw	r3, #4786
	ldr	r1, .L1009+36
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L992
.L1008:
	movw	r2, #4814
	ldr	r1, .L1009+40
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L992
.L1010:
	.align	2
.L1009:
	.word	.LANCHOR1
	.word	.LC131
	.word	.LC133
	.word	.LC128
	.word	.LC129
	.word	.LC134
	.word	.LC130
	.word	.LC2
	.word	.LANCHOR0+776
	.word	.LC0
	.word	.LC132
	UNWIND(.fnend)
	.size	VCTRL_GetUsrdecFrame, .-VCTRL_GetUsrdecFrame
	.align	2
	.global	InitSyntaxCtx
	.type	InitSyntaxCtx, %function
InitSyntaxCtx:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L1031
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1030
	ldr	r2, [r3, #600]
	cmp	r2, #20
	ldrls	pc, [pc, r2, asl #2]
	b	.L1011
.L1015:
	.word	.L1014
	.word	.L1016
	.word	.L1017
	.word	.L1018
	.word	.L1011
	.word	.L1019
	.word	.L1020
	.word	.L1011
	.word	.L1021
	.word	.L1022
	.word	.L1023
	.word	.L1023
	.word	.L1023
	.word	.L1024
	.word	.L1011
	.word	.L1025
	.word	.L1026
	.word	.L1027
	.word	.L1028
	.word	.L1011
	.word	.L1029
.L1029:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_Init
.L1014:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L1016:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_Init
.L1017:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L1018:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L1019:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_Init
.L1020:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_Init
.L1021:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_Init
.L1022:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_Init
.L1023:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_Init
.L1024:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_Init
.L1025:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_Init
.L1026:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L1027:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_Init
.L1028:
	movw	r0, #18072
	add	r1, r3, #608
	movt	r0, 7
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS2DEC_Init
.L1030:
	ldr	ip, .L1031+4
	mov	r0, r3
	ldr	r2, .L1031+8
	movw	r3, #4863
	ldr	r1, .L1031+12
	str	ip, [sp]
	bl	dprint_vfmw
.L1011:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1032:
	.align	2
.L1031:
	.word	.LANCHOR1
	.word	.LC2
	.word	.LANCHOR0+800
	.word	.LC0
	UNWIND(.fnend)
	.size	InitSyntaxCtx, .-InitSyntaxCtx
	.align	2
	.global	VCTRL_VarifyOption
	.type	VCTRL_VarifyOption, %function
VCTRL_VarifyOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #36]
	cmp	r3, #0
	blt	.L1034
	ldr	r3, [r0, #12]
	cmp	r3, #31
	ble	.L1034
	ldr	r3, [r0, #16]
	cmp	r3, #31
	ble	.L1034
	ldr	r3, [r0, #56]
	cmp	r3, #262144
	blt	.L1034
	ldr	r3, [r0, #44]
	cmp	r3, #1
	beq	.L1040
	cmp	r3, #2
	bne	.L1038
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L1034
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ble	.L1034
.L1039:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ble	.L1034
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bgt	.L1038
.L1034:
	ldr	r1, .L1041
	mov	r0, #32
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1038:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1040:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bgt	.L1039
	b	.L1034
.L1042:
	.align	2
.L1041:
	.word	.LC135
	UNWIND(.fnend)
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	2
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r3, [r1, #40]
	mov	r4, r1
	mov	r6, r0
	cmp	r3, #0
	mov	r5, r2
	ldr	r1, [r1, #36]
	moveq	r0, #1
	beq	.L1045
	add	r0, r1, #1
	cmp	r0, #17
	movge	r0, #17
.L1045:
	ldr	r3, .L1061
	sub	r2, r6, #27
	cmp	r2, #6
	ldr	r2, [r4, #60]
	ldr	r7, [r3, #64]
	mvncc	ip, #1
	mvncs	ip, #0
	cmp	r7, #0
	beq	.L1049
	ldr	lr, .L1061+4
	add	r1, r2, r1
	ldr	r3, [r4, #16]
	add	r1, r1, #2
	ldr	r2, [r4, #12]
	str	r1, [sp, #4]
	mvn	r1, #-2147483648
	str	r0, [sp]
	mov	r0, #0
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	mov	r0, #1
	str	lr, [sp, #16]
	blx	r7
	ldr	r3, .L1061+8
	cmp	r0, #0
	bne	.L1049
	ldr	r3, [r3, #-2796]
	add	r3, r3, #16
	str	r3, [r5]
	ldr	r3, [r4, #256]
	cmp	r3, #17
	streq	r0, [r5, #4]
	ldrne	r3, [r4, #56]
	addne	r3, r3, #32768
	addne	r3, r3, #16
	strne	r3, [r5, #4]
	mov	r3, #132096
	str	r3, [r5, #12]
	ldr	r3, [r4, #256]
	cmp	r3, #0
	beq	.L1060
	cmp	r3, #15
	bne	.L1054
	ldr	r3, [r4, #20]
	movw	ip, #4060
	ldr	r0, [r4, #28]
	movw	r2, #3992
	ldr	r1, [r4, #32]
	mov	lr, #2240
.L1059:
	mul	ip, ip, r3
	mla	r3, r2, r0, ip
	mla	r2, lr, r1, r3
	cmp	r2, #0
	movcc	r2, #0
.L1053:
	cmp	r6, #26
	movw	r1, #14296
	movt	r1, 15
	mov	r3, #46848
	movt	r3, 180
	mov	r0, #0
	movne	r3, r1
	add	r3, r3, r2
	str	r3, [r5, #8]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1060:
	ldr	r3, [r4, #20]
	movw	ip, #4060
	ldr	r0, [r4, #28]
	mov	r2, #4000
	ldr	r1, [r4, #32]
	mov	lr, #2208
	b	.L1059
.L1049:
	movw	r2, #5019
	ldr	r1, .L1061+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1054:
	cmp	r3, #16
	movw	r3, #58792
	movt	r3, 19
	moveq	r2, r3
	movne	r2, #0
	b	.L1053
.L1062:
	.align	2
.L1061:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR3-2796
	.word	.LANCHOR3
	.word	.LC136
	UNWIND(.fnend)
	.size	VCTRL_GetMemSize_onDecode, .-VCTRL_GetMemSize_onDecode
	.align	2
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r3, #2
	mov	r5, r0
	mov	r4, r1
	mov	r6, r2
	beq	.L1064
	ldr	r1, .L1072
	ldr	r2, [r4, #36]
	ldr	ip, [r4, #60]
	ldr	r3, [r1, #-1564]
	ldr	lr, [r1, #-1560]
	add	r1, r2, r3
	cmp	r1, #16
	add	r0, ip, lr
	movge	r1, #16
	orrs	r7, r1, r0
	strpl	r1, [r4, #36]
	strpl	r0, [r4, #60]
	bmi	.L1071
.L1064:
	mov	r0, r4
	bl	VCTRL_VarifyOption
	cmp	r0, #0
	bne	.L1066
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_GetMemSize_onDecode
.L1071:
	stmia	sp, {ip, lr}
	mov	r0, #32
	ldr	r1, .L1072+4
	bl	dprint_vfmw
.L1066:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1073:
	.align	2
.L1072:
	.word	.LANCHOR3
	.word	.LC137
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	2
	.global	CloseDrivers
	.type	CloseDrivers, %function
CloseDrivers:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	bl	SM_InstInit
	ldr	r2, [r4, #88]
	cmp	r2, #0
	bne	.L1098
.L1075:
	ldr	r5, [r4, #112]
	ldr	r6, [r4, #104]
	cmp	r5, #0
	ldr	r7, [r4, #100]
	bne	.L1099
.L1076:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #184]
	ldr	r6, [r4, #176]
	cmp	r5, #0
	ldr	r7, [r4, #172]
	bne	.L1100
.L1077:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #160]
	ldr	r6, [r4, #152]
	cmp	r5, #0
	ldr	r7, [r4, #148]
	bne	.L1101
.L1078:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #208]
	ldr	r6, [r4, #200]
	cmp	r5, #0
	ldr	r7, [r4, #196]
	bne	.L1102
.L1079:
	ldr	r4, .L1106
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #376]
	cmp	r3, #1
	beq	.L1103
	ldr	r3, [r4, #380]
	ldr	r5, .L1106
	cmp	r3, #1
	beq	.L1104
.L1081:
	ldr	r3, [r4, #384]
	ldr	r4, .L1106
	cmp	r3, #1
	beq	.L1105
.L1082:
	bl	HEVCDEC_ReleaseHevcGlbMem
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1098:
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_DelMemRecord
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L1106+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #72
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1075
.L1102:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1106+4
	add	r0, r4, #192
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1079
.L1101:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1106+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #144
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1078
.L1099:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1106+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #96
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1076
.L1100:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1106+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #168
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1077
.L1105:
	ldr	r3, .L1106+4
	mov	r0, #13
	ldr	r5, [r3, #208]
	bl	VFMW_GetString
	ldr	r2, .L1106+8
	mov	r1, r0
	mov	r0, #181
	blx	r5
	mov	r3, #0
	str	r3, [r4, #384]
	b	.L1082
.L1103:
	ldr	r3, .L1106+4
	mov	r0, #0
	ldr	r5, [r3, #208]
	bl	VFMW_GetString
	ldr	r2, .L1106+8
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #376]
	ldr	r3, [r4, #380]
	ldr	r5, .L1106
	cmp	r3, #1
	bne	.L1081
.L1104:
	ldr	r3, .L1106+4
	mov	r0, #4
	ldr	r6, [r3, #208]
	bl	VFMW_GetString
	ldr	r2, .L1106+8
	mov	r1, r0
	mov	r0, #136
	blx	r6
	mov	r3, #0
	str	r3, [r5, #380]
	b	.L1081
.L1107:
	.align	2
.L1106:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-1556
	UNWIND(.fnend)
	.size	CloseDrivers, .-CloseDrivers
	.align	2
	.global	OpenDrivers
	.type	OpenDrivers, %function
OpenDrivers:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	ldr	r6, .L1133
	ldr	r5, .L1133+4
	movw	r2, #1228
	mov	r1, #0
	add	r7, r0, #96
	mov	r4, r0
	mov	r0, r6
	ldr	r3, [r5, #48]
	blx	r3
	mov	r0, #0
	mov	r2, r7
	movt	r0, 63683
	mov	r1, #65536
	bl	MEM_MapRegisterAddr
	subs	r8, r0, #0
	bne	.L1109
	ldr	r2, [r4, #112]
	add	r7, r4, #168
	ldr	r1, [r4, #100]
	ldr	r0, [r4, #104]
	bl	MEM_AddMemRecord
	ldr	r3, [r4, #100]
	mov	r0, #53248
	mov	r2, r7
	movt	r0, 63683
	mov	r1, #4096
	str	r3, [r6]
	bl	MEM_MapRegisterAddr
	subs	r9, r0, #0
	bne	.L1110
	ldr	r2, [r4, #184]
	mov	r8, #49152
	ldr	r1, [r4, #172]
	add	r10, r4, #144
	ldr	r0, [r4, #176]
	movt	r8, 63683
	bl	MEM_AddMemRecord
	ldr	r3, [r4, #172]
	mov	r0, r8
	mov	r2, r10
	mov	r1, #4096
	str	r3, [r6, #8]
	bl	MEM_MapRegisterAddr
	subs	r7, r0, #0
	bne	.L1128
	ldr	r2, [r4, #160]
	add	r6, r4, #72
	ldr	r1, [r4, #148]
	ldr	r0, [r4, #152]
	bl	MEM_AddMemRecord
	ldr	r3, .L1133+8
	mov	r0, #12
	ldr	r9, [r5, #68]
	str	r8, [r3]
	bl	VFMW_GetString
	mov	r3, #1
	mov	r1, #20
	mov	r2, r0
	sub	r0, fp, #64
	blx	r9
	str	r7, [sp]
	mov	r1, #3
	sub	r0, fp, #64
	str	r1, [r4, #92]
	mov	r3, r6
	movw	r2, #18048
	mov	r1, r7
	bl	MEM_AllocMemBlock
	subs	r9, r0, #0
	beq	.L1129
	movw	r2, #18048
	mov	r3, #1
	str	r2, [sp]
	mov	r0, r7
	ldr	r1, .L1133+12
	ldr	r2, .L1133+16
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r7
	mov	r0, r6
.L1124:
	mov	r2, #24
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
.L1113:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1129:
	ldr	r2, [r4, #88]
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	ldr	r8, .L1133+20
	bl	MEM_AddMemRecord
	ldr	r1, [r4, #88]
	ldr	r0, [r4, #80]
	bl	SCDDRV_CfgDspMem
	mov	r0, r9
	bl	VDMDRV_Init
	ldr	r7, .L1133+24
	bl	SM_InstInit
	ldr	r2, [r8, #92]
	mov	r0, r9
	ldr	r10, [r5, #204]
	str	r2, [fp, #-72]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r2, [fp, #-72]
	ldr	r1, .L1133+28
	mov	r3, r0
	mov	r0, #127
	blx	r10
	subs	r3, r0, #0
	str	r3, [fp, #-80]
	bne	.L1130
	ldr	r3, [r5, #204]
	mov	r0, #4
	ldr	r2, [r8, #92]
	mov	r9, #1
	ldr	r10, .L1133+32
	str	r3, [fp, #-72]
	str	r2, [fp, #-76]
	str	r9, [r10, #376]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r2, [fp, #-76]
	ldr	r1, .L1133+36
	ldr	ip, [fp, #-72]
	mov	r3, r0
	mov	r0, #136
	blx	ip
	subs	r3, r0, #0
	str	r3, [fp, #-76]
	bne	.L1131
	ldr	r2, [r8, #92]
	mov	r0, #13
	ldr	r8, [r5, #204]
	str	r9, [r10, #380]
	str	r2, [fp, #-72]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r2, [fp, #-72]
	ldr	r1, .L1133+40
	mov	r3, r0
	mov	r0, #181
	blx	r8
	subs	r7, r0, #0
	bne	.L1132
	str	r9, [r10, #384]
	bl	HEVCDEC_AllocHevcGlbMem
	cmp	r0, #0
	beq	.L1113
	ldr	r1, .L1133+44
	mov	r0, r7
	bl	dprint_vfmw
	mov	r0, r7
	b	.L1113
.L1128:
	ldr	r1, .L1133+48
	mov	r2, r8
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r9
	mov	r0, r10
	b	.L1124
.L1109:
	mov	r2, #0
	ldr	r1, .L1133+48
	movt	r2, 63683
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r7
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L1113
.L1110:
	mov	r2, #53248
	ldr	r1, .L1133+48
	movt	r2, 63683
	mov	r0, r8
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r8
	mov	r0, r7
	b	.L1124
.L1130:
	ldr	r1, .L1133+52
	mov	r2, #127
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r9
	mov	r0, r6
	b	.L1124
.L1131:
	ldr	r1, .L1133+52
	mov	r2, #136
	ldr	r7, [fp, #-80]
.L1125:
	mov	r0, r7
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r7
	mov	r0, r6
	b	.L1124
.L1132:
	mov	r2, #181
	ldr	r1, .L1133+52
	ldr	r7, [fp, #-76]
	b	.L1125
.L1134:
	.align	2
.L1133:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_ScdRegPhyBaseAddr
	.word	.LC139
	.word	.LANCHOR0+816
	.word	.LANCHOR2
	.word	.LANCHOR3-1556
	.word	VCTRL_Isr_0
	.word	.LANCHOR1
	.word	VCTRL_Scd_Isr
	.word	VCTRL_MMU_ISR
	.word	.LC141
	.word	.LC138
	.word	.LC140
	UNWIND(.fnend)
	.size	OpenDrivers, .-OpenDrivers
	.align	2
	.global	VCTRL_OpenVfmw
	.type	VCTRL_OpenVfmw, %function
VCTRL_OpenVfmw:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	cmp	r0, #0
	beq	.L1167
	ldr	r5, .L1172
	mov	r2, #8
	ldr	r7, .L1172+4
	sub	r0, fp, #52
	mov	r1, #0
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r4, [r7, #128]
	cmp	r4, #0
	bne	.L1166
	ldr	r6, .L1172+8
	mov	r1, #1024
	ldr	r3, [r5, #80]
	str	r4, [fp, #-56]
	sub	r0, r6, #1552
	blx	r3
	sub	r0, r6, #1552
	ldr	r3, [r5, #96]
	ldr	r1, .L1172+12
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1139
	ldr	r3, [r5, #92]
	sub	r0, fp, #56
	ldr	r1, .L1172+16
	blx	r3
	cmp	r0, #0
	beq	.L1158
	sub	r0, fp, #56
	ldr	r3, [r5, #92]
	ldr	r1, .L1172+20
	blx	r3
	cmp	r0, #0
	beq	.L1168
	mov	r2, r4
	ldr	r3, [r5, #84]
	mov	r1, r4
	blx	r3
	mov	r2, r0
	str	r0, [r6, #-1564]
.L1143:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r8, #5000
	cmp	r3, r1
	bhi	.L1144
	cmp	r2, r8
	movw	r3, #60536
.L1165:
	movt	r3, 65535
	movge	r2, r8
	cmp	r2, r3
	movlt	r2, r3
.L1140:
	str	r2, [r6, #-1564]
.L1142:
	ldr	r8, .L1172+8
	mov	r9, #0
	ldr	r3, [r5, #80]
	mov	r1, #1024
	sub	r0, r8, #1552
	str	r9, [fp, #-56]
	blx	r3
	sub	r0, r8, #1552
	ldr	r3, [r5, #96]
	ldr	r1, .L1172+24
	blx	r3
	ldr	r10, .L1172
	cmp	r0, r9
	str	r0, [fp, #-56]
	beq	.L1145
	ldr	r3, [r10, #92]
	sub	r0, fp, #56
	ldr	r1, .L1172+16
	blx	r3
	cmp	r0, r9
	beq	.L1146
	sub	r0, fp, #56
	ldr	r3, [r10, #92]
	ldr	r1, .L1172+20
	blx	r3
	cmp	r0, r9
	beq	.L1169
	mov	r2, r9
	ldr	r3, [r10, #84]
	mov	r1, r9
	blx	r3
	mov	r2, r0
	str	r0, [r8, #-1560]
.L1149:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r8, #5000
	cmp	r3, r1
	bhi	.L1150
	cmp	r2, r8
	movw	r3, #60536
	movt	r3, 65535
	movlt	r4, r2
	movge	r4, r8
	cmp	r4, r3
	movlt	r4, r3
.L1146:
	str	r4, [r6, #-1560]
.L1148:
	ldr	r4, [r6, #-528]
	mov	r3, #0
	ldr	r8, .L1172+8
	cmp	r4, r3
	str	r3, [fp, #-56]
	beq	.L1151
	ldr	r2, .L1172+28
	and	r3, r4, #1
	ubfx	r1, r4, #1, #1
	strb	r3, [r8, #-524]
	ubfx	r3, r4, #2, #1
	ubfx	r4, r4, #3, #1
	strb	r1, [r2, #96]
	strb	r3, [r8, #-523]
	strb	r4, [r8, #-522]
.L1152:
	ldr	r4, .L1172+4
	mov	r2, #260
	ldr	r3, [r5, #48]
	mov	r1, #0
	add	r0, r4, #128
	mov	r8, #1
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #128
	mov	r1, #0
	mov	r0, r4
	blx	r3
	ldr	r1, .L1172+32
	sub	r0, fp, #52
	mov	r2, #134217728
	mov	r3, #75497472
	str	r2, [fp, #-52]
	str	r1, [r6, #-520]
	str	r3, [fp, #-48]
	str	r8, [r7, #132]
	bl	MEM_InitMemManager
	bl	FSP_Init
	ldr	r6, .L1172
	bl	ChanCtx_Init
	ldr	r3, [r5, #48]
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L1172+36
	blx	r3
	add	r0, r4, #152
	bl	OpenDrivers
	cmp	r0, #0
	bne	.L1166
	ldr	r3, [r6, #124]
	mov	r1, r8
	blx	r3
	ldr	r3, [r6, #200]
	ldr	r2, .L1172+40
	add	r0, r4, #140
	ldr	r1, .L1172+44
	blx	r3
	cmp	r0, #0
	streq	r8, [r4, #128]
	bne	.L1170
.L1137:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1151:
	ldr	r3, [r5, #80]
	mov	r1, #1024
	sub	r0, r8, #1552
	ldr	r9, .L1172
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1172+48
	sub	r0, r8, #1552
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1152
	ldr	r3, [r9, #92]
	sub	r0, fp, #56
	ldr	r1, .L1172+16
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r8, #-528]
	beq	.L1154
	sub	r0, fp, #56
	ldr	r3, [r9, #92]
	ldr	r1, .L1172+20
	blx	r3
	cmp	r0, #0
	beq	.L1171
	ldr	r3, [r9, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	str	r0, [r8, #-528]
.L1154:
	ldr	r2, .L1172+28
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #-524]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2, #96]
	strb	r3, [r6, #-523]
	strb	r0, [r6, #-522]
	b	.L1152
.L1145:
	ldr	r2, [r8, #-1560]
	b	.L1149
.L1139:
	ldr	r2, [r6, #-1564]
	b	.L1143
.L1144:
	ldr	r1, .L1172+52
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r2, [r6, #-1564]
	movw	r3, #60536
	cmp	r2, r8
	b	.L1165
.L1150:
	ldr	r1, .L1172+56
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r4, [r6, #-1560]
	movw	r3, #60536
	cmp	r4, r8
	movt	r3, 65535
	movge	r4, r8
	cmp	r4, r3
	movlt	r4, r3
	b	.L1146
.L1158:
	mov	r2, r4
	b	.L1140
.L1170:
	add	r0, r4, #152
	bl	CloseDrivers
.L1166:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1169:
	movw	r3, #6032
	ldr	r2, .L1172+60
	ldr	r1, .L1172+64
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1148
.L1168:
	movw	r3, #5990
	ldr	r2, .L1172+68
	ldr	r1, .L1172+64
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1142
.L1171:
	movw	r3, #6083
	ldr	r2, .L1172+72
	ldr	r1, .L1172+64
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1152
.L1167:
	ldr	ip, .L1172+76
	movw	r3, #938
	ldr	r2, .L1172+80
	ldr	r1, .L1172+84
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1137
.L1173:
	.align	2
.L1172:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC143
	.word	.LC144
	.word	.LC145
	.word	.LC148
	.word	.LANCHOR2
	.word	VCTRL_EventReport
	.word	.LANCHOR3-516
	.word	VFMW_CTRL_thread_proc
	.word	.LC151
	.word	.LC150
	.word	.LC147
	.word	.LC149
	.word	.LANCHOR0+864
	.word	.LC146
	.word	.LANCHOR0+844
	.word	.LANCHOR0+884
	.word	.LC142
	.word	.LANCHOR0+828
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	2
	.global	GetNextDecodeMode
	.type	GetNextDecodeMode, %function
GetNextDecodeMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	mov	r4, r2
	mov	ip, r4, asl #1
	movw	r2, #21846
	cmp	r4, #0
	movt	r2, 21845
	smull	r2, r3, ip, r2
	add	r5, r4, #7
	movge	r5, r4
	mov	r6, r0
	mov	r5, r5, asr #3
	str	r1, [sp, #4]
	str	r4, [sp]
	mov	r7, r1
	sub	r3, r3, ip, asr #31
	ldr	r1, .L1182
	mov	r2, r5
	mov	r0, #30
	bl	dprint_vfmw
	cmp	r6, #3
	beq	.L1180
	cmp	r4, r7
	movge	r4, r6
	blt	.L1181
.L1176:
	mov	r2, r6
	mov	r3, r4
	ldr	r1, .L1182+4
	mov	r0, #30
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1181:
	ldr	r1, .L1182+8
	mov	r0, #30
	bl	dprint_vfmw
.L1179:
	mov	r4, #3
	b	.L1176
.L1180:
	cmp	r5, r7
	ble	.L1179
	ldr	r1, .L1182+12
	mov	r0, #30
	bl	dprint_vfmw
	mov	r4, #0
	b	.L1176
.L1183:
	.align	2
.L1182:
	.word	.LC152
	.word	.LC155
	.word	.LC154
	.word	.LC153
	UNWIND(.fnend)
	.size	GetNextDecodeMode, .-GetNextDecodeMode
	.align	2
	.global	VCTRL_GetChanIDByCtx
	.type	VCTRL_GetChanIDByCtx, %function
VCTRL_GetChanIDByCtx:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, .L1194
	mov	r2, #0
	b	.L1187
.L1185:
	add	r2, r2, #1
	cmp	r2, #32
	beq	.L1193
.L1187:
	ldr	r1, [ip], #4
	movw	r3, #18072
	movt	r3, 7
	cmp	r1, #0
	add	r3, r1, r3
	beq	.L1185
	cmp	r0, r3
	bne	.L1185
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L1193:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1195:
	.align	2
.L1194:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	2
	.global	VCTRL_GetChanIDByMemAddr
	.type	VCTRL_GetChanIDByMemAddr, %function
VCTRL_GetChanIDByMemAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L1208
	mov	lr, #0
.L1201:
	ldr	r2, [r4], #4
	cmp	r2, #0
	beq	.L1197
	movw	r3, #13912
	movw	r1, #16216
	movt	r3, 7
	movt	r1, 7
	add	r3, r2, r3
	add	r1, r2, r1
.L1200:
	ldr	r2, [r3]
	cmp	r2, r0
	bhi	.L1198
	ldr	ip, [r3, #-20]
	add	r2, r2, ip
	cmp	r0, r2
	bcc	.L1202
.L1198:
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L1200
.L1197:
	add	lr, lr, #1
	cmp	lr, #32
	bne	.L1201
	mvn	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L1202:
	mov	r0, lr
	ldmfd	sp, {r4, fp, sp, pc}
.L1209:
	.align	2
.L1208:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByMemAddr, .-VCTRL_GetChanIDByMemAddr
	.align	2
	.global	DecChanProcessPts
	.type	DecChanProcessPts, %function
DecChanProcessPts:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r6, .L1239
	mov	r5, r0
	mov	r4, r1
	ldr	ip, [r6, r0, asl #2]
	ldr	r2, [ip, #52]
	cmp	r2, #1
	beq	.L1234
	cmp	r2, #6
	cmpne	r2, #18
	sub	r1, r2, #2
	moveq	r3, #1
	movne	r3, #0
	cmp	r1, #1
	orrls	r3, r3, #1
	cmp	r3, #0
	bne	.L1212
.L1213:
	ldrd	r2, [r4, #32]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1235
	add	r1, ip, #672
	strd	r2, [r1]
.L1223:
	ldrd	r8, [r4, #48]
	add	r0, ip, #688
	add	lr, ip, #704
	ldr	r1, .L1239+4
	strd	r8, [r0]
	mov	r0, #29
	ldrd	r6, [r4, #56]
	strd	r6, [lr]
	ldr	lr, [r4, #64]
	str	lr, [ip, #720]
	ldr	lr, [r4, #68]
	str	lr, [ip, #724]
	ldr	lr, [r4, #72]
	str	lr, [ip, #728]
	ldr	lr, [r4, #76]
	str	lr, [ip, #744]
	ldrb	lr, [r4, #16]	@ zero_extendqisi2
	strb	lr, [ip, #664]
	strd	r8, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1234:
	add	r3, ip, #475136
	ldr	r3, [r3, #1688]
	ldrb	r3, [r3, #564]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1213
.L1212:
	add	r1, ip, #1168
	add	r3, r4, #8
	mov	r0, r5
	bl	IsNewpicSeg
	cmp	r0, #0
	beq	.L1236
.L1214:
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [r1, #52]
	cmp	r3, #3
	addeq	r0, r1, #688
	beq	.L1220
.L1219:
	ldrd	r2, [r4, #32]
	mvn	r7, #0
	mvn	r6, #0
	add	r0, r1, #688
	cmp	r3, r7
	cmpeq	r2, r6
	strned	r2, [r0, #-8]
.L1221:
	ldrd	r2, [r4, #48]
	add	lr, r1, #704
	add	ip, r1, #720
	strd	r2, [lr, #-8]
	ldrd	r2, [r4, #56]
	strd	r2, [ip, #-8]
	ldr	r3, [r4, #64]
	str	r3, [r1, #732]
	ldr	r3, [r4, #68]
	str	r3, [r1, #736]
	ldr	r3, [r4, #72]
	str	r3, [r1, #740]
	ldr	r3, [r4, #76]
	str	r3, [r1, #748]
.L1220:
	ldrd	r2, [r0]
	mov	r0, #29
	ldr	r1, .L1239+8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1236:
	ldr	ip, [r6, r5, asl #2]
	add	lr, ip, #688
	ldr	r3, [ip, #52]
	cmp	r3, #3
	beq	.L1237
	ldrd	r2, [lr, #-8]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1238
	add	r1, ip, #672
	strd	r2, [r1]
.L1216:
	add	r7, ip, #704
	mvn	r0, #0
	mvn	r1, #0
	strd	r0, [lr, #-8]
	ldrd	r0, [r7, #-8]
	add	r8, ip, #720
	strd	r0, [lr]
	ldrd	r0, [r8, #-8]
	orrs	lr, r0, r1
	strd	r0, [r7]
	ldreqd	r0, [r4, #56]
	streqd	r0, [r7]
.L1218:
	ldr	r1, [ip, #736]
	mov	r0, #29
	ldr	r7, [ip, #732]
	ldr	lr, [ip, #740]
	str	r1, [ip, #724]
	ldr	r1, [ip, #748]
	str	r7, [ip, #720]
	str	lr, [ip, #728]
	str	r1, [ip, #744]
	ldr	r1, .L1239+12
	bl	dprint_vfmw
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [r1, #52]
	cmp	r3, #3
	bne	.L1219
	ldrd	r2, [r4, #32]
	add	lr, r1, #688
	add	ip, r1, #704
	add	r0, r1, #720
	strd	r2, [lr, #-8]
	ldrd	r2, [r4, #48]
	strd	r2, [ip, #-8]
	ldrd	r2, [r4, #56]
	strd	r2, [r0, #-8]
	ldr	r3, [r4, #64]
	str	r3, [r1, #732]
	ldr	r3, [r4, #68]
	str	r3, [r1, #736]
	ldr	r3, [r4, #72]
	str	r3, [r1, #740]
	ldr	r3, [r4, #76]
	str	r3, [r1, #748]
	b	.L1214
.L1237:
	ldrd	r2, [lr, #-8]
	add	r1, ip, #672
	strd	r2, [r1]
	b	.L1216
.L1235:
	add	r3, ip, #672
	ldrd	r2, [r3]
	b	.L1223
.L1238:
	add	r3, ip, #672
	ldrd	r2, [r3]
	b	.L1216
.L1240:
	.align	2
.L1239:
	.word	.LANCHOR1
	.word	.LC158
	.word	.LC157
	.word	.LC156
	UNWIND(.fnend)
	.size	DecChanProcessPts, .-DecChanProcessPts
	.align	2
	.global	DecChanCheckDecParam
	.type	DecChanCheckDecParam, %function
DecChanCheckDecParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L1249
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #600]
	sub	r3, r2, #10
	cmp	r3, #2
	bhi	.L1242
	ldr	r3, .L1249+4
	ldr	r3, [r3, #-3056]
	ands	r3, r3, #1
	beq	.L1243
.L1242:
	bic	r3, r2, #16
	cmp	r3, #4
	cmpne	r2, #14
	movne	r3, #1
	moveq	r3, #0
	beq	.L1243
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	mvnne	r3, #1
	moveq	r3, #0
.L1243:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1250:
	.align	2
.L1249:
	.word	.LANCHOR1
	.word	.LANCHOR3
	UNWIND(.fnend)
	.size	DecChanCheckDecParam, .-DecChanCheckDecParam
	.align	2
	.global	DecChanSyntax
	.type	DecChanSyntax, %function
DecChanSyntax:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #31
	mov	r4, r0
	ldrhi	ip, .L1295
	movwhi	r3, #5644
	bhi	.L1284
	ldr	r6, .L1295+4
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1287
	ldr	r3, [r0, #8]
	cmp	r3, #1
	bne	.L1288
	ldr	r5, [r0, #24]
	cmp	r5, #0
	ldrne	ip, .L1295+8
	movwne	r3, #5647
	bne	.L1284
	ldr	r8, .L1295+12
	mov	r7, r4, asl #2
	str	r5, [r0, #436]
	ldr	r9, .L1295+16
	ldr	r3, [r8]
	blx	r3
	add	r2, r9, r7
	ldr	r3, [r2, #-388]
	mov	r1, r0
	ldr	r0, .L1295+20
	rsb	r3, r3, r1
	ldr	r0, [r0]
	cmp	r3, r0
	mov	r0, r4
	bls	.L1257
	str	r1, [r2, #-388]
	bl	DecChanCheckDecParam
	cmn	r0, #2
	mov	r10, r0
	bne	.L1258
	mov	r2, r4
	ldr	r1, .L1295+24
	mov	r0, #23
	bl	dprint_vfmw
.L1274:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1257:
	bl	DecChanCheckDecParam
	cmn	r0, #2
	mov	r10, r0
	beq	.L1274
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	mvnne	r10, #2
	bne	.L1274
.L1268:
	ldr	r1, [r6, r4, asl #2]
	add	r3, r1, #442368
	ldr	r3, [r3, #2208]
	cmp	r3, #1
	beq	.L1289
	cmp	r3, #3
	beq	.L1290
	ldrb	r3, [r1, #753]	@ zero_extendqisi2
	add	r10, r1, #752
	cmp	r3, #0
	bne	.L1261
	ldr	r3, [r1, #1560]
	cmp	r3, #0
	beq	.L1291
.L1261:
	ldrd	r2, [r10, #32]
	mov	r0, #29
	ldr	r1, .L1295+28
	strd	r2, [fp, #-52]
	ldrd	r2, [r10, #48]
	strd	r2, [sp]
	ldrd	r2, [fp, #-52]
	bl	dprint_vfmw
	mov	r1, r10
	mov	r0, r4
	bl	DecChanProcessPts
	mov	r0, #3
	bl	CHECK_REC_POS_ENABLE
	adds	r3, r0, #0
	movne	r3, #1
	cmp	r5, #1
	movne	r3, #0
	cmp	r3, #0
	bne	.L1292
.L1263:
	ldr	r3, [r6, r4, asl #2]
	movw	r2, #18072
	mov	r0, r10
	movt	r2, 7
	add	r2, r3, r2
	ldr	r1, [r3, #600]
	bl	DecodeStream
	mov	r0, #4
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L1293
.L1285:
	mov	r10, #0
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1258:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	moveq	r5, r0
	beq	.L1268
	mov	r2, r4
	ldr	r1, .L1295+32
	mov	r0, #23
	mvn	r10, #2
	bl	dprint_vfmw
	b	.L1274
.L1288:
	ldr	ip, .L1295+36
	movw	r3, #5646
.L1284:
	ldr	r2, .L1295+40
	mov	r0, #0
	ldr	r1, .L1295+44
	mvn	r10, #0
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1274
.L1293:
	ldr	r3, [r8]
	add	r7, r9, r7
	blx	r3
	ldr	r1, .L1295+48
	ldr	r3, [r7, #-260]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	mov	r2, r0
	cmp	r3, r1
	bls	.L1285
	mov	r0, r4
	str	r2, [r7, #-260]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1285
	mov	r2, r4, asl #24
	movw	r1, #5746
	add	r2, r2, #262144
	ldr	r0, .L1295+52
	bl	DBG_AddTrace
	b	.L1285
.L1291:
	add	r1, r1, #760
	mov	r0, r4
	bl	SM_ReadSegStream
	cmp	r0, #0
	beq	.L1261
	cmp	r5, #1
	beq	.L1294
.L1262:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #1
	mvn	r10, #3
	str	r2, [r3, #436]
	b	.L1274
.L1292:
	mov	r2, r4, asl #24
	movw	r1, #5728
	add	r2, r2, #196608
	ldr	r0, .L1295+52
	bl	DBG_AddTrace
	b	.L1263
.L1287:
	ldr	ip, .L1295+56
	movw	r3, #5645
	ldr	r2, .L1295+40
	mvn	r10, #0
	ldr	r1, .L1295+44
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1274
.L1289:
	ldr	r1, .L1295+60
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r10, #2
	b	.L1274
.L1290:
	ldr	r2, [r1, #1504]
	mov	r0, #31
	ldr	r1, .L1295+64
	mvn	r10, #0
	bl	dprint_vfmw
	b	.L1274
.L1294:
	mov	r2, r4
	ldr	r1, .L1295+68
	mov	r0, #23
	bl	dprint_vfmw
	b	.L1262
.L1296:
	.align	2
.L1295:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC159
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	g_TraceBsPeriod
	.word	.LC160
	.word	.LC165
	.word	.LC161
	.word	.LC122
	.word	.LANCHOR0+900
	.word	.LC0
	.word	g_TraceFramePeriod
	.word	.LANCHOR0+916
	.word	.LC111
	.word	.LC162
	.word	.LC163
	.word	.LC164
	UNWIND(.fnend)
	.size	DecChanSyntax, .-DecChanSyntax
	.align	2
	.global	DecSyntax
	.type	DecSyntax, %function
DecSyntax:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r0, .L1329
	ldr	r1, .L1329+4
	sub	r3, r0, #128
.L1300:
	ldr	r2, [r1, #4]!
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #20]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L1300
	ldr	r7, .L1329+8
	mvn	r5, #0
	ldr	r8, .L1329+12
	mov	r9, #0
	mov	r10, r7
.L1301:
	mov	r3, #0
	ldr	r0, [r8, #-132]
	mov	r4, r3
	ldr	r1, .L1329+16
	b	.L1302
.L1304:
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	movlt	r0, r2
	movlt	r4, r3
.L1302:
	add	r3, r3, #1
	cmp	r3, #32
	bne	.L1304
	add	r3, r8, r4, lsl #2
	cmp	r0, #0
	add	r2, r4, #1
	mov	r1, #0
	str	r9, [r3, #-132]
	str	r2, [r7, #148]
	ldr	r3, .L1329+8
	ble	.L1305
	ldr	r3, [r10, r4, asl #2]
	cmp	r3, r1
	beq	.L1301
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bne	.L1301
	ldr	r2, [r3, #76]
	cmp	r2, r1
	ble	.L1307
	ldr	r5, [r3, #80]
	cmp	r5, r1
	beq	.L1327
.L1307:
	mov	r6, #500
	b	.L1315
.L1310:
	cmp	r0, #0
	ldr	r3, [r7, r4, asl #2]
	bne	.L1313
	ldr	r2, [r3, #1592]
	cmp	r2, #1
	beq	.L1313
	subs	r6, r6, #1
	beq	.L1301
.L1315:
	mov	r0, r4
	bl	DecChanSyntax
	cmn	r0, #1
	mov	r5, r0
	bne	.L1310
	ldr	r6, [r8, #-520]
	cmp	r6, #0
	beq	.L1321
	mov	r3, #0
	mov	r0, r4
	mov	r2, r3
	mov	r1, #102
	blx	r6
.L1321:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1313:
	str	r9, [r3, #1592]
	b	.L1301
.L1327:
	mov	r0, r4
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L1328
.L1308:
	ldr	r5, [r7, r4, asl #2]
	ldr	r1, [fp, #-56]
	ldr	r2, [r5, #76]
	ldr	r0, [r5, #616]
	bl	GetNextDecodeMode
	ldr	r3, [r7, r4, asl #2]
	str	r0, [r5, #616]
	ldr	r2, [r3, #616]
	cmp	r2, #0
	strne	r9, [r3, #612]
	strne	r9, [r3, #608]
	ldreq	r2, [r3, #72]
	streq	r2, [r3, #612]
	streq	r2, [r3, #608]
	b	.L1307
.L1305:
	mov	r0, r5
	str	r1, [r3, #148]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1328:
	ldr	r3, .L1329+20
	mov	r1, r5
	sub	r0, fp, #68
	mov	r2, #24
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1308
.L1330:
	.align	2
.L1329:
	.word	.LANCHOR3-4
	.word	.LANCHOR1-4
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LANCHOR3-132
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	DecSyntax, .-DecSyntax
	.align	2
	.global	VCTRL_RunProcess
	.type	VCTRL_RunProcess, %function
VCTRL_RunProcess:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1342
	mov	r0, #0
	bl	VCTRL_RecordPosTime
	ldrb	r3, [r5, #1788]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1340
.L1332:
	ldr	r0, [r5, #908]
	mov	r3, #100
	ldr	r6, .L1342+4
	cmp	r0, #0
	str	r3, [r5, #144]
	ble	.L1333
	ldr	r3, [r6, #120]
	blx	r3
.L1333:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	SM_Wakeup
	ldr	r3, [r5, #904]
	mov	r2, #101
	str	r2, [r5, #144]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1341
.L1334:
	mov	r3, #102
	str	r3, [r5, #144]
	bl	VDMDRV_WakeUpVdm
	mov	r4, #0
.L1335:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #32
	bne	.L1335
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #1
	mov	r3, #105
	str	r3, [r5, #144]
	bl	VCTRL_RecordPosTime
	mov	r1, #0
	ldr	r3, [r6, #132]
	mov	r0, r1
	mov	r2, #10
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1341:
	bl	DecSyntax
	mov	r7, r0
	b	.L1334
.L1340:
	mov	r0, #11
	bl	VCTRL_RecordPosTime
	mov	r3, #0
	strb	r3, [r5, #1788]
	b	.L1332
.L1343:
	.align	2
.L1342:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	2
	.global	VFMW_CTRL_thread_proc
	.type	VFMW_CTRL_thread_proc, %function
VFMW_CTRL_thread_proc:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L1371
	ldr	r6, .L1371+4
.L1345:
.L1352:
	ldr	r1, .L1371+8
	mov	r0, #2
	mov	r3, #0
	str	r3, [r4, #144]
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	mov	r5, #2
	str	r5, [r4, #132]
	cmp	r3, r5
	bne	.L1367
	b	.L1350
.L1369:
	str	r5, [r4, #144]
	bl	VCTRL_RunProcess
	ldr	r1, .L1371+12
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	cmp	r3, #2
	beq	.L1350
.L1367:
	cmp	r3, #3
	bne	.L1369
.L1348:
	ldr	r1, .L1371+16
	mov	r0, #2
	mov	r3, #6
	str	r3, [r4, #144]
	bl	dprint_vfmw
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #132]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1350:
	ldr	r1, .L1371+20
	mov	r0, #2
	mov	r3, #4
	str	r3, [r4, #144]
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r4, #132]
	b	.L1347
.L1370:
	ldr	r3, [r6, #120]
	blx	r3
.L1347:
	ldr	r1, .L1371+24
	mov	r0, #22
	mov	r3, #5
	str	r3, [r4, #144]
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	mov	r0, #10
	cmp	r3, #1
	beq	.L1352
	cmp	r3, #3
	bne	.L1370
	b	.L1348
.L1372:
	.align	2
.L1371:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC166
	.word	.LC168
	.word	.LC170
	.word	.LC167
	.word	.LC169
	UNWIND(.fnend)
	.size	VFMW_CTRL_thread_proc, .-VFMW_CTRL_thread_proc
	.align	2
	.global	VCTRL_GetChanVoQue
	.type	VCTRL_GetChanVoQue, %function
VCTRL_GetChanVoQue:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L1393
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1391
	ldr	r2, [r3, #600]
	cmp	r2, #20
	ldrls	pc, [pc, r2, asl #2]
	b	.L1392
.L1376:
	.word	.L1390
	.word	.L1377
	.word	.L1378
	.word	.L1379
	.word	.L1392
	.word	.L1380
	.word	.L1381
	.word	.L1392
	.word	.L1382
	.word	.L1383
	.word	.L1384
	.word	.L1384
	.word	.L1384
	.word	.L1385
	.word	.L1392
	.word	.L1386
	.word	.L1387
	.word	.L1388
	.word	.L1389
	.word	.L1392
	.word	.L1390
.L1390:
	add	r0, r3, #475136
	add	r0, r0, #1696
	ldmfd	sp, {fp, sp, pc}
.L1377:
	movw	r0, #1864
	movt	r0, 8
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1378:
	movw	r0, #40696
	movt	r0, 7
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1379:
	add	r0, r3, #565248
	add	r0, r0, #288
	ldmfd	sp, {fp, sp, pc}
.L1380:
	movw	r0, #60600
	movt	r0, 7
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1381:
	movw	r0, #34264
	movt	r0, 7
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1382:
	add	r0, r3, #528384
	add	r0, r0, #3296
	ldmfd	sp, {fp, sp, pc}
.L1383:
	movw	r0, #7384
	movt	r0, 8
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1384:
	movw	r0, #30760
	movt	r0, 7
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1385:
	movw	r0, #26280
	movt	r0, 7
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1386:
	add	r0, r3, #475136
	add	r0, r0, #2272
	ldmfd	sp, {fp, sp, pc}
.L1387:
	add	r0, r3, #479232
	add	r0, r0, #3776
	ldmfd	sp, {fp, sp, pc}
.L1388:
	add	r0, r3, #753664
	add	r0, r0, #1616
	ldmfd	sp, {fp, sp, pc}
.L1389:
	add	r0, r3, #491520
	add	r0, r0, #4080
	ldmfd	sp, {fp, sp, pc}
.L1392:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1391:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1394:
	.align	2
.L1393:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	2
	.global	VCTRL_FindOccupiedFrame
	.type	VCTRL_FindOccupiedFrame, %function
VCTRL_FindOccupiedFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #31
	mov	r5, r0
	bhi	.L1411
	bl	VCTRL_GetChanVoQue
	subs	r4, r0, #0
	beq	.L1406
	sub	r2, fp, #36
	mov	r3, #0
	sub	r1, fp, #44
	str	r3, [fp, #-44]
	str	r3, [r2, #-4]!
	bl	GetQueueImgNum
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	beq	.L1406
	cmp	r2, #32
	bhi	.L1399
.L1402:
	ldr	r3, .L1413
	ldrh	r1, [r4, #4]
	ldr	r0, [r3, r5, asl #2]
	and	r1, r1, #63
	add	lr, r0, #475136
	add	r1, r4, r1, lsl #2
	ldr	r3, [lr, #1608]
	ldr	r1, [r1, #12]
	cmp	r3, #32
	bhi	.L1400
	add	ip, r0, r3, lsl #4
	movw	r0, #17468
	movt	r0, 7
	mov	r6, #0
	add	r0, ip, r0
	mov	r7, #0
	mov	ip, #1
	mov	r8, #0
	b	.L1403
.L1404:
	ldrh	r1, [r4, #4]
	cmp	r3, #33
	add	r1, r1, ip
	add	ip, ip, #1
	and	r1, r1, #63
	add	r1, r4, r1, lsl #2
	ldr	r1, [r1, #12]
	beq	.L1400
.L1403:
	ldr	r1, [r1, #20]
	cmp	ip, r2
	strd	r6, [r0, #4]
	add	r3, r3, #1
	str	r8, [r0, #-4]
	add	r0, r0, #16
	str	r1, [r0, #-16]
	str	r3, [lr, #1608]
	bcc	.L1404
.L1410:
	mov	r0, #0
.L1412:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1406:
	mvn	r0, #0
.L1397:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1400:
	mov	r2, r5
	ldr	r1, .L1413+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1412
.L1399:
	mov	r3, #32
	ldr	r1, .L1413+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	bne	.L1402
	b	.L1410
.L1411:
	ldr	ip, .L1413+12
	movw	r3, #3265
	ldr	r2, .L1413+16
	mov	r0, #0
	ldr	r1, .L1413+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1397
.L1414:
	.align	2
.L1413:
	.word	.LANCHOR1
	.word	.LC172
	.word	.LC171
	.word	.LC65
	.word	.LANCHOR0+932
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_FindOccupiedFrame, .-VCTRL_FindOccupiedFrame
	.align	2
	.global	VCTRL_ReportOccupiedFrame
	.type	VCTRL_ReportOccupiedFrame, %function
VCTRL_ReportOccupiedFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #31
	mov	r7, r0
	mov	r4, r1
	bhi	.L1432
	cmp	r1, #0
	beq	.L1433
	bl	VCTRL_GetChanVoQue
	subs	r5, r0, #0
	mvneq	r0, #0
	beq	.L1417
	ldr	r6, .L1435
	sub	r8, fp, #36
	mov	r3, #0
	mov	r0, #4
	str	r3, [r8, #-4]!
	str	r3, [fp, #-44]
	ldr	r3, [r6, #12]
	blx	r3
	mov	r2, r8
	sub	r1, fp, #44
	mov	r0, r5
	bl	GetQueueImgNum
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	beq	.L1419
	cmp	r2, #32
	bhi	.L1434
.L1420:
	mov	r1, #0
	mov	r0, r1
	mov	lr, r1
.L1422:
	ldrh	r3, [r5, #4]
	add	ip, r4, r0, lsl #4
	add	r1, r1, #1
	mov	r7, #0
	add	r3, r3, r0
	and	r3, r3, #63
	uxth	r1, r1
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #12]
	ldr	r8, [r3, #20]
	str	r8, [ip, #4]
	ldr	r3, [r3, #504]
	str	r7, [ip, #12]
	str	r3, [ip, #8]
	str	lr, [r4, r0, asl #4]
	sxth	r0, r1
	cmp	r0, r2
	bcc	.L1422
	uxth	r3, r2
.L1421:
	ldrh	r1, [r5, #4]
	add	r3, r3, r1
	and	r3, r3, #63
	strh	r3, [r5, #4]	@ movhi
	str	r2, [r4, #528]
.L1423:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	mov	r0, #0
.L1417:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1419:
	ldr	lr, .L1435+4
	ldr	r1, [lr, r7, asl #2]
	add	r3, r1, #475136
	ldr	r3, [r3, #1608]
	cmp	r3, #0
	beq	.L1423
	mov	r0, r2
	mov	r5, r2
.L1424:
	mov	r3, r0, asl #4
	movw	ip, #17464
	add	r1, r1, r3
	movt	ip, 7
	add	ip, r1, ip
	add	r3, r4, r3
	add	r1, r0, #29696
	add	r2, r2, #1
	ldr	r8, [ip, #4]
	add	r1, r1, #68
	mov	ip, #0
	uxth	r2, r2
	str	r8, [r3, #4]
	ldr	r8, [lr, r7, asl #2]
	ldr	r1, [r8, r1, asl #4]
	str	ip, [r3, #12]
	str	r1, [r3, #8]
	str	r5, [r4, r0, asl #4]
	sxth	r0, r2
	ldr	r1, [lr, r7, asl #2]
	add	r3, r1, #475136
	ldr	r3, [r3, #1608]
	cmp	r0, r3
	bcc	.L1424
	str	r3, [r4, #528]
	b	.L1423
.L1434:
	mov	r3, #32
	ldr	r1, .L1435+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	moveq	r3, r2
	bne	.L1420
	b	.L1421
.L1432:
	ldr	ip, .L1435+12
	movw	r3, #3341
	ldr	r2, .L1435+16
	mov	r0, #0
	ldr	r1, .L1435+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1417
.L1433:
	ldr	ip, .L1435+24
	mov	r0, r1
	movw	r3, #3342
	ldr	r2, .L1435+16
	ldr	r1, .L1435+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1417
.L1436:
	.align	2
.L1435:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC171
	.word	.LC65
	.word	.LANCHOR0+956
	.word	.LC0
	.word	.LC173
	UNWIND(.fnend)
	.size	VCTRL_ReportOccupiedFrame, .-VCTRL_ReportOccupiedFrame
	.align	2
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r8, r1, #0
	mov	r5, r2
	mov	r6, r3
	mov	r4, r0
	beq	.L1450
	cmp	r2, #0
	beq	.L1451
	cmp	r3, #0
	beq	.L1452
	cmp	r0, #31
	bhi	.L1453
	ldr	r7, .L1458
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L1454
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L1444
	mov	r2, r6
	mov	r1, r5
	bl	GetQueueImgNum
	ldr	r2, [r7, r4, asl #2]
	ldr	r3, [r2, #600]
	cmp	r3, #0
	beq	.L1455
	cmp	r3, #16
	beq	.L1456
	cmp	r3, #17
	moveq	r3, #9
	streq	r3, [r8]
	beq	.L1437
	cmp	r3, #15
	beq	.L1457
	cmp	r3, #18
	moveq	r3, #5
	movne	r3, #2
	str	r3, [r8]
.L1437:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1444:
	str	r3, [r6]
	str	r3, [r5]
	str	r3, [r8]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1453:
	ldr	ip, .L1458+4
	movw	r3, #5855
	ldr	r2, .L1458+8
	mov	r0, #0
	ldr	r1, .L1458+12
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1455:
	add	r2, r2, #499712
	ldr	r3, [r2, #3824]
	str	r3, [r8]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1456:
	add	r2, r2, #479232
	ldr	r3, [r2, #628]
	str	r3, [r8]
	b	.L1437
.L1450:
	ldr	ip, .L1458+16
	mov	r0, r8
	movw	r3, #5852
	ldr	r2, .L1458+8
	ldr	r1, .L1458+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1437
.L1451:
	ldr	ip, .L1458+20
	mov	r0, r2
	movw	r3, #5853
	ldr	r2, .L1458+8
	ldr	r1, .L1458+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1437
.L1452:
	ldr	ip, .L1458+24
	mov	r0, r3
	ldr	r2, .L1458+8
	movw	r3, #5854
	ldr	r1, .L1458+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1437
.L1457:
	add	r2, r2, #11599872
	ldr	r3, [r2, #512]
	str	r3, [r8]
	b	.L1437
.L1454:
	ldr	ip, .L1458+28
	mov	r0, r3
	ldr	r2, .L1458+8
	movw	r3, #5856
	ldr	r1, .L1458+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1437
.L1459:
	.align	2
.L1458:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+984
	.word	.LC0
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	2
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #48)
	sub	sp, sp, #48
	subs	r4, r1, #0
	mov	r5, r0
	beq	.L1470
	cmp	r0, #31
	bhi	.L1471
	ldr	r6, .L1473
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1472
	ldr	r3, .L1473+4
	mov	r7, #0
	mov	r1, r7
	mov	r2, #100
	str	r7, [fp, #-56]
	mov	r0, r4
	ldr	r3, [r3, #48]
	str	r7, [fp, #-60]
	str	r7, [fp, #-64]
	blx	r3
	ldr	r2, [r6, r5, asl #2]
	movw	r3, #2179
	ldr	r2, [r2, #1184]
	str	r2, [r4, #32]
	ldr	r2, [r6, r5, asl #2]
	ldr	r2, [r2, #1188]
	str	r2, [r4, #36]
	ldr	r2, [r6, r5, asl #2]
	ldr	r2, [r2, #1192]
	str	r2, [r4, #44]
	ldr	r2, [r6, r5, asl #2]
	add	r1, r2, #442368
	ldrsb	ip, [r1, r3]
	cmp	ip, r7
	ble	.L1468
	movw	r3, #7706
	mov	r1, r7
	movt	r3, 7
	add	r3, r2, r3
	mov	r0, r7
.L1467:
	ldrsb	r2, [r3]
	add	r1, r1, #1
	add	r3, r3, #92
	cmp	r2, #3
	addeq	r0, r0, #1
	cmp	r1, ip
	bne	.L1467
.L1465:
	str	r0, [r4, #84]
	movw	lr, #2179
	ldr	ip, [r6, r5, asl #2]
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	add	ip, ip, #442368
	mov	r0, r5
	ldrsb	ip, [ip, lr]
	str	ip, [r4, #92]
	bl	VCTRL_GetChanImgNum
	ldr	r2, .L1473+8
	mov	r3, r5, asl #6
	ldr	ip, [fp, #-60]
	add	r3, r3, r5, lsl #3
	sub	r1, fp, #52
	add	r3, r2, r3
	ldr	r2, [fp, #-56]
	mov	r0, r5
	add	r2, ip, r2
	str	r2, [r4, #48]
	ldr	r2, [r3, #16]
	str	r2, [r4, #96]
	ldr	r3, [r3, #4]
	str	r3, [r4, #20]
	bl	SM_GetInfo
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-44]
	cmp	r3, #10
	str	r1, [r4, #52]
	movle	r3, #0
	movgt	r3, #1
	str	r2, [r4, #56]
	str	r3, [r4, #80]
	ldr	r3, [r6, r5, asl #2]
	add	r3, r3, #491520
	ldrb	r3, [r3, #1176]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r4, #88]
.L1460:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1471:
	ldr	ip, .L1473+12
	movw	r3, #1262
	ldr	r2, .L1473+16
	mov	r0, #0
	ldr	r1, .L1473+20
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1472:
	ldr	ip, .L1473+24
	movw	r3, #1263
	ldr	r2, .L1473+16
	ldr	r1, .L1473+20
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1460
.L1468:
	mov	r0, r7
	b	.L1465
.L1470:
	ldr	ip, .L1473+28
	mov	r0, r4
	movw	r3, #1261
	ldr	r2, .L1473+16
	ldr	r1, .L1473+20
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1460
.L1474:
	.align	2
.L1473:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LC100
	.word	.LANCHOR0+1004
	.word	.LC0
	.word	.LC101
	.word	.LC177
	UNWIND(.fnend)
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	2
	.global	VCTRL_GetChanWidth
	.type	VCTRL_GetChanWidth, %function
VCTRL_GetChanWidth:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L1479
	ldr	r3, .L1481
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldrne	r0, [r0, #1300]
	beq	.L1480
.L1477:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1479:
	ldr	ip, .L1481+4
	movw	r3, #5919
	ldr	r2, .L1481+8
	mov	r0, #0
	ldr	r1, .L1481+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1477
.L1480:
	ldr	ip, .L1481+16
	movw	r3, #5920
	ldr	r2, .L1481+8
	ldr	r1, .L1481+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1477
.L1482:
	.align	2
.L1481:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+1024
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanWidth, .-VCTRL_GetChanWidth
	.align	2
	.global	VCTRL_GetChanHeight
	.type	VCTRL_GetChanHeight, %function
VCTRL_GetChanHeight:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L1487
	ldr	r3, .L1489
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldrne	r0, [r0, #1304]
	beq	.L1488
.L1485:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1487:
	ldr	ip, .L1489+4
	movw	r3, #5927
	ldr	r2, .L1489+8
	mov	r0, #0
	ldr	r1, .L1489+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1485
.L1488:
	ldr	ip, .L1489+16
	movw	r3, #5928
	ldr	r2, .L1489+8
	ldr	r1, .L1489+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1485
.L1490:
	.align	2
.L1489:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+1044
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanHeight, .-VCTRL_GetChanHeight
	.align	2
	.global	VCTRL_GetChanCapLevel
	.type	VCTRL_GetChanCapLevel, %function
VCTRL_GetChanCapLevel:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L1495
	ldr	r3, .L1496
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #36]
	moveq	r0, #33
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1495:
	ldr	ip, .L1496+4
	movw	r3, #5935
	ldr	r2, .L1496+8
	mov	r0, #0
	ldr	r1, .L1496+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1497:
	.align	2
.L1496:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+1064
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_GetChanCapLevel, .-VCTRL_GetChanCapLevel
	.align	2
	.global	VCTRL_SetVdecExtra
	.type	VCTRL_SetVdecExtra, %function
VCTRL_SetVdecExtra:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #4992
	ldr	r5, .L1505
	add	r3, r3, #8
	movw	r2, #10000
	cmp	r3, r2
	mov	r4, r1
	str	r0, [r5, #-1564]
	bhi	.L1503
.L1499:
	movw	r1, #5000
	cmp	r0, r1
	movw	r2, #60536
	add	r3, r4, #4992
	movge	r0, r1
	movt	r2, 65535
	cmp	r0, r2
	add	r3, r3, #8
	movw	r1, #10000
	str	r4, [r5, #-1560]
	movlt	r0, r2
	cmp	r3, r1
	str	r0, [r5, #-1564]
	ldr	r6, .L1505
	bhi	.L1504
.L1500:
	movw	r2, #5000
	cmp	r4, r2
	movw	r3, #60536
	movge	r4, r2
	movt	r3, 65535
	cmp	r4, r3
	movlt	r4, r3
	str	r4, [r5, #-1560]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1503:
	mov	r2, r0
	ldr	r1, .L1505+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r0, [r5, #-1564]
	b	.L1499
.L1504:
	mov	r2, r4
	ldr	r1, .L1505+8
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r4, [r6, #-1560]
	b	.L1500
.L1506:
	.align	2
.L1505:
	.word	.LANCHOR3
	.word	.LC178
	.word	.LC179
	UNWIND(.fnend)
	.size	VCTRL_SetVdecExtra, .-VCTRL_SetVdecExtra
	.align	2
	.global	VfmwProcGetHandler
	.type	VfmwProcGetHandler, %function
VfmwProcGetHandler:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r1, r0, #0
	ldrne	r3, .L1519
	bne	.L1511
	b	.L1517
.L1512:
	ldr	r2, [r3, #8]!
	cmp	r2, r1
	beq	.L1518
.L1511:
	ldr	r0, [r3, #12]
	cmp	r0, #0
	bne	.L1512
	ldmfd	sp, {fp, sp, pc}
.L1518:
	ldmfd	sp, {fp, sp, pc}
.L1517:
	ldr	r0, .L1519+4
	ldmfd	sp, {fp, sp, pc}
.L1520:
	.align	2
.L1519:
	.word	.LANCHOR0+1088
	.word	VfmwProc_SetPrintLevel
	UNWIND(.fnend)
	.size	VfmwProcGetHandler, .-VfmwProcGetHandler
	.align	2
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	beq	.L1528
	cmp	r0, #0
	ldrne	r3, .L1534
	bne	.L1526
	b	.L1533
.L1527:
	ldr	ip, [r3, #8]!
	cmp	r0, ip
	beq	.L1524
.L1526:
	ldr	r4, [r3, #12]
	cmp	r4, #0
	bne	.L1527
	mov	r2, r0
	ldr	r1, .L1534+4
	mov	r0, #32
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1533:
	ldr	r4, .L1534+8
.L1524:
	mov	r0, r1
	blx	r4
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1528:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1535:
	.align	2
.L1534:
	.word	.LANCHOR0+1088
	.word	.LC180
	.word	VfmwProc_SetPrintLevel
	UNWIND(.fnend)
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	2
	.global	VCTRL_SetLastFrameState
	.type	VCTRL_SetLastFrameState, %function
VCTRL_SetLastFrameState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	bhi	.L1542
	ldr	r3, .L1543
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #440]
	ldmfd	sp, {fp, sp, pc}
.L1542:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.24
.L1544:
	.align	2
.L1543:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	2
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	subs	r5, r1, #0
	mov	r4, r0
	moveq	r2, #2
	beq	.L1547
	cmp	r5, #1
	moveq	r2, #3
	movne	r2, #4
.L1547:
	cmp	r4, #31
	bhi	.L1559
	ldr	r7, .L1560
	ldr	r3, [r7, r4, asl #2]
	cmp	r3, #0
	strne	r2, [r3, #440]
.L1550:
	ldr	r3, .L1560+4
	ldr	r6, [r3, #-520]
	cmp	r6, #0
	beq	.L1551
	sub	r2, fp, #28
	mov	r3, #4
	mov	r1, #115
	mov	r0, r4
	str	r5, [r2, #-4]!
	blx	r6
.L1551:
	ldr	ip, [r7, r4, asl #2]
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L1560+8
	mov	r0, #1
	ldr	ip, [ip, #440]
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1559:
	bl	VCTRL_SetLastFrameState.part.24
	ldr	r7, .L1560
	b	.L1550
.L1561:
	.align	2
.L1560:
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC181
	UNWIND(.fnend)
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	2
	.global	VCTRL_OutputLastFrame
	.type	VCTRL_OutputLastFrame, %function
VCTRL_OutputLastFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	mov	r5, r0
	bhi	.L1590
	ldr	r3, .L1593
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1591
	add	r2, r3, #475136
	ldr	r2, [r2, #1680]
	cmp	r2, #18
	ldrls	pc, [pc, r2, asl #2]
	b	.L1583
.L1568:
	.word	.L1567
	.word	.L1569
	.word	.L1570
	.word	.L1571
	.word	.L1583
	.word	.L1572
	.word	.L1573
	.word	.L1583
	.word	.L1574
	.word	.L1575
	.word	.L1576
	.word	.L1576
	.word	.L1576
	.word	.L1577
	.word	.L1583
	.word	.L1578
	.word	.L1579
	.word	.L1580
	.word	.L1581
.L1583:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r1, .L1593+4
	mov	r0, #2
	bl	dprint_vfmw
	mvn	r0, #0
.L1564:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1581:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	AVS2DEC_GetRemainImg
	mov	r4, r0
.L1566:
	cmn	r4, #1
	beq	.L1583
	cmp	r4, #0
	bne	.L1592
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r1, .L1593+8
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1567:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	H264DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1569:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	VC1DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1570:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	MPEG4DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1571:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	MPEG2DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1572:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	DIVX3DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1573:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	AVSDEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1574:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	REAL8DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1575:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	REAL9DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1576:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	VP6DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1577:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	VP8DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1578:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	MVC_DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1579:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	HEVCDEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1580:
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	VP9DEC_GetRemainImg
	mov	r4, r0
	b	.L1566
.L1592:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	sub	r2, r4, #2
	ldr	r1, .L1593+12
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1590:
	ldr	ip, .L1593+16
	movw	r3, #7212
	ldr	r2, .L1593+20
	mov	r0, #0
	ldr	r1, .L1593+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1564
.L1591:
	ldr	ip, .L1593+28
	mov	r0, r3
	ldr	r2, .L1593+20
	movw	r3, #7213
	ldr	r1, .L1593+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1564
.L1594:
	.align	2
.L1593:
	.word	.LANCHOR1
	.word	.LC182
	.word	.LC183
	.word	.LC184
	.word	.LC65
	.word	.LANCHOR0+1448
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	2
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r5, .L1641
	mov	r4, r0
	ldr	ip, [r5, r0, asl #2]
	cmp	ip, #0
	beq	.L1633
	ldr	r0, [ip, #600]
	ldr	r6, [ip, #1240]
	cmp	r0, #18
	ldrls	pc, [pc, r0, asl #2]
	b	.L1595
.L1599:
	.word	.L1598
	.word	.L1600
	.word	.L1601
	.word	.L1602
	.word	.L1595
	.word	.L1603
	.word	.L1604
	.word	.L1595
	.word	.L1605
	.word	.L1606
	.word	.L1607
	.word	.L1607
	.word	.L1607
	.word	.L1608
	.word	.L1595
	.word	.L1609
	.word	.L1610
	.word	.L1611
	.word	.L1612
.L1610:
	movw	r0, #18072
	str	r3, [sp, #4]
	str	r6, [sp]
	mov	r3, r2
	movt	r0, 7
	mov	r2, #1
	add	r0, ip, r0
	ldr	r7, .L1641
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #475136
	ldrb	r3, [r3, #1699]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1634
.L1615:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #479232
	strne	r2, [r3, #456]
.L1595:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1612:
	movw	r0, #18072
	mov	r2, r6
	movt	r0, 7
	add	r0, ip, r0
	bl	AVS2DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r7, .L1641
	add	r3, r3, #475136
	ldrb	r3, [r3, #1688]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1635
.L1620:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #475136
	strne	r2, [r3, #1728]
	b	.L1595
.L1598:
	movw	r0, #18072
	str	r3, [sp, #4]
	str	r6, [sp]
	mov	r3, r2
	movt	r0, 7
	mov	r2, #1
	add	r0, ip, r0
	ldr	r7, .L1641
	bl	H264DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #487424
	ldrb	r3, [r3, #2960]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1636
.L1613:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #475136
	strne	r2, [r3, #2048]
	b	.L1595
.L1600:
	movw	r0, #18072
	movt	r0, 7
	add	r0, ip, r0
	bl	VC1DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1641
	add	r2, r3, #487424
	ldrb	r2, [r2, #2143]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1637
.L1621:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #1692]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1601:
	movw	r0, #18072
	ldr	r6, .L1641
	movt	r0, 7
	add	r0, ip, r0
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #499712
	ldrb	r2, [r2, #124]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1638
.L1618:
	add	r3, r3, #475136
	mov	r2, #0
	str	r2, [r3, #2724]
	b	.L1595
.L1602:
	movw	r0, #18072
	movt	r0, 7
	add	r0, ip, r0
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1641
	add	r2, r3, #565248
	ldrb	r2, [r2, #658]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1621
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #565248
	strb	r1, [r2, #658]
	b	.L1621
.L1603:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetSwitchRounding
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	DIVX3DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	str	r2, [r3, #1692]
	b	.L1595
.L1604:
	movw	r0, #18072
	movt	r0, 7
	add	r0, ip, r0
	bl	AVSDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1641
	add	r3, r3, #475136
	ldrb	r2, [r3, #1688]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1639
.L1619:
	mov	r2, #0
	str	r2, [r3, #1704]
	b	.L1595
.L1605:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetMb0QpInCurrPic
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	REAL8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	str	r2, [r3, #1692]
	b	.L1595
.L1606:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetMb0QpInCurrPic
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	movw	r0, #18072
	movt	r0, 7
	add	r0, r3, r0
	bl	REAL9DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	str	r2, [r3, #1692]
	b	.L1595
.L1607:
	movw	r0, #18072
	movt	r0, 7
	add	r0, ip, r0
	bl	VP6DEC_VDMPostProc
.L1632:
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	str	r2, [r3, #1692]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1608:
	movw	r0, #18072
	movt	r0, 7
	add	r0, ip, r0
	bl	VP8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	str	r2, [r3, #1692]
	b	.L1595
.L1609:
	movw	r0, #18072
	mov	r2, #1
	movt	r0, 7
	add	r0, ip, r0
	bl	MVC_DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r6, .L1641
	add	r3, r3, #475136
	ldrb	r2, [r3, #1689]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1640
.L1622:
	mov	r2, #0
	str	r2, [r3, #1916]
	b	.L1595
.L1611:
	movw	r0, #18072
	mov	r2, r6
	movt	r0, 7
	add	r0, ip, r0
	bl	VP9DEC_VDMPostProc
	cmp	r6, #1
	bne	.L1632
	b	.L1595
.L1633:
	ldr	lr, .L1641+4
	mov	r0, ip
	movw	r3, #4215
	ldr	r2, .L1641+8
	ldr	r1, .L1641+12
	str	lr, [sp]
	bl	dprint_vfmw
	b	.L1595
.L1640:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #475136
	mov	r3, r2
	strb	r1, [r2, #1689]
	b	.L1622
.L1639:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #475136
	mov	r3, r2
	strb	r1, [r2, #1688]
	b	.L1619
.L1638:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #499712
	strb	r1, [r2, #124]
	b	.L1618
.L1637:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #487424
	strb	r1, [r2, #2143]
	b	.L1621
.L1634:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	strb	r2, [r3, #1699]
	b	.L1615
.L1636:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #487424
	strb	r2, [r3, #2960]
	b	.L1613
.L1635:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	strb	r2, [r3, #1688]
	b	.L1620
.L1642:
	.align	2
.L1641:
	.word	.LANCHOR1
	.word	.LC2
	.word	.LANCHOR0+1472
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	2
	.global	VCTRL_VdmPostProc
	.type	VCTRL_VdmPostProc, %function
VCTRL_VdmPostProc:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	mov	r7, r3
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	ldrhi	ip, .L1653
	movwhi	r3, #4403
	bhi	.L1651
	ldr	ip, .L1653+4
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L1652
	ldr	ip, [ip, #8]
	cmp	ip, #1
	beq	.L1647
	ldr	ip, .L1653+8
	movw	r3, #4405
.L1651:
	ldr	r2, .L1653+12
	mov	r0, #0
	ldr	r1, .L1653+16
	str	ip, [sp]
	bl	dprint_vfmw
.L1643:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1647:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1643
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_PostProc
.L1652:
	ldr	lr, .L1653+20
	mov	r0, ip
	movw	r3, #4404
	ldr	r2, .L1653+12
	ldr	r1, .L1653+16
	str	lr, [sp]
	bl	dprint_vfmw
	b	.L1643
.L1654:
	.align	2
.L1653:
	.word	.LC121
	.word	.LANCHOR1
	.word	.LC122
	.word	.LANCHOR0+1488
	.word	.LC0
	.word	.LC111
	UNWIND(.fnend)
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	2
	.global	VCTRL_SvdecLastFrame
	.type	VCTRL_SvdecLastFrame, %function
VCTRL_SvdecLastFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L1659
	add	r1, r1, #2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_ReportLastFrame
.L1659:
	ldr	ip, .L1660
	movw	r3, #7338
	ldr	r2, .L1660+4
	mov	r0, #0
	ldr	r1, .L1660+8
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1661:
	.align	2
.L1660:
	.word	.LC65
	.word	.LANCHOR0+1508
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_SvdecLastFrame, .-VCTRL_SvdecLastFrame
	.align	2
	.global	Get_YuvFormat
	.type	Get_YuvFormat, %function
Get_YuvFormat:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L1663
.L1665:
	.word	.L1664
	.word	.L1666
	.word	.L1667
	.word	.L1668
	.word	.L1669
	.word	.L1670
	.word	.L1671
.L1671:
	cmp	r0, #1
	moveq	r0, #1
	movne	r0, #7
	ldmfd	sp, {fp, sp, pc}
.L1664:
	cmp	r0, #1
	moveq	r0, #0
	movne	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L1666:
	cmp	r0, #1
	moveq	r0, #2
	movne	r0, #8
	ldmfd	sp, {fp, sp, pc}
.L1667:
	cmp	r0, #1
	moveq	r0, #4
	movne	r0, #10
	ldmfd	sp, {fp, sp, pc}
.L1668:
	cmp	r0, #1
	moveq	r0, #3
	movne	r0, #9
	ldmfd	sp, {fp, sp, pc}
.L1669:
	cmp	r0, #1
	moveq	r0, #5
	movne	r0, #11
	ldmfd	sp, {fp, sp, pc}
.L1670:
	cmp	r0, #1
	moveq	r0, #13
	movne	r0, #12
	ldmfd	sp, {fp, sp, pc}
.L1663:
	mov	r3, r1
	movw	r2, #7822
	ldr	r1, .L1680
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #13
	ldmfd	sp, {fp, sp, pc}
.L1681:
	.align	2
.L1680:
	.word	.LC185
	UNWIND(.fnend)
	.size	Get_YuvFormat, .-Get_YuvFormat
	.align	2
	.global	VDH_PutUsrdecFrame
	.type	VDH_PutUsrdecFrame, %function
VDH_PutUsrdecFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	mov	r5, r1
	ldr	r1, [r1, #40]
	mov	r8, r0
	bl	FSP_GetLogicIdByPhyAddr
	cmn	r0, #1
	mov	r7, r0
	beq	.L1690
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L1685
	mov	r1, r0
	mov	r2, #0
	mov	r0, r8
	bl	FSP_ClearLogicFs
	mov	r0, #0
.L1684:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1685:
	ldr	r0, [r5, #48]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L1691
.L1686:
	mov	r1, r7
	mov	r0, r8
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L1692
	str	r7, [r4, #148]
	add	ip, r4, #576
	ldrd	r2, [r5, #64]
	add	r0, r4, #592
	add	r1, r4, #608
	mov	r6, #0
	mov	r9, #1
	strd	r2, [ip]
	ldrd	r2, [r5, #64]
	strd	r2, [r0, #-8]
	ldrd	r2, [r5, #64]
	strd	r2, [r0]
	ldrd	r2, [r5, #64]
	strd	r2, [r1, #-8]
	str	r9, [r4]
	str	r6, [r4, #4]
	str	r6, [r4, #8]
	str	r6, [r4, #12]
	ldr	r3, [r5, #40]
	str	r3, [r4, #20]
	mov	r0, r3
	str	r3, [r4, #36]
	ldr	r3, [r5, #48]
	str	r3, [r4, #24]
	str	r3, [r4, #40]
	bl	MEM_Phy2Vir
	str	r6, [r4, #508]
	str	r0, [r4, #504]
	ldr	r0, [r4, #24]
	bl	MEM_Phy2Vir
	str	r6, [r4, #516]
	ldr	lr, [r4, #20]
	mov	r1, r6
	ldr	r10, [r4, #24]
	mov	r2, #4
	ldr	ip, .L1694
	str	r0, [r4, #512]
	add	r0, r4, #64
	ldr	r3, [r5, #44]
	add	lr, r3, lr
	str	lr, [r4, #28]
	ldr	r3, [r5, #44]
	str	r6, [r4, #52]
	add	r3, r3, r10
	str	r3, [r4, #32]
	ldr	r3, [r5, #12]
	ldr	r10, [ip, #48]
	str	r3, [r4, #68]
	ldr	r3, [r5, #16]
	str	r3, [r4, #72]
	ldr	r3, [r5, #12]
	mov	ip, r3, lsr r9
	str	r3, [r4, #76]
	ldr	r3, [r5, #16]
	str	ip, [r4, #84]
	str	r3, [r4, #80]
	mov	r3, r3, lsr r9
	str	r3, [r4, #88]
	ldr	r3, [r5, #44]
	str	r6, [r4, #108]
	str	r6, [r4, #152]
	str	r3, [r4, #112]
	mov	r3, r3, lsr r9
	str	r9, [r4, #164]
	str	r3, [r4, #116]
	blx	r10
	ldrb	r3, [r4, #65]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	and	r3, r3, #252
	orr	r3, r3, #12
	and	r2, r2, #224
	bfi	r3, r9, #4, #2
	bfi	r2, r9, #5, #3
	strb	r3, [r4, #65]
	strb	r2, [r4, #64]
	ldr	r0, [r5, #24]
	str	r0, [r4, #212]
	bl	MEM_Phy2Vir
	str	r6, [r4, #524]
	str	r0, [r4, #520]
	ldr	r1, [r5]
	ldr	r0, [r5, #8]
	bl	Get_YuvFormat
	cmp	r0, #13
	beq	.L1693
	str	r0, [r4, #388]
	mov	r2, r9
	ldr	r3, [r5, #56]
	mov	r9, #20
	mov	r1, r7
	mov	r0, r8
	str	r3, [r4, #364]
	ldr	r3, [r5, #60]
	str	r3, [r4, #360]
	ldr	r3, [r5, #52]
	str	r9, [r4, #296]
	str	r3, [r4, #368]
	bl	FSP_SetDisplay
	ldr	r3, .L1694+4
	str	r4, [sp]
	movw	r2, #18072
	mov	r1, r9
	movt	r2, 7
	ldr	ip, [r3, r8, asl #2]
	mov	r0, r8
	add	r3, ip, #475136
	add	r2, ip, r2
	add	r3, r3, #1696
	bl	InsertImgToVoQueue
	cmp	r0, #1
	moveq	r0, r6
	beq	.L1684
	add	r9, r4, #544
	ldr	r1, [r4, #544]
	mov	r0, r8
	add	r5, r4, #560
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	mov	r0, r8
	strd	r2, [r9]
	ldr	r1, [r4, #552]
	strd	r2, [fp, #-52]
	bl	FreeUsdByDec
	ldrd	r2, [fp, #-52]
	mov	r0, r8
	mov	r1, r7
	strd	r2, [r5, #-8]
	mov	r2, r6
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L1684
.L1691:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	bne	.L1686
	ldr	r2, [r5, #48]
	ldr	r1, .L1694+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1684
.L1690:
	ldr	r2, [r5, #40]
	mov	r0, #0
	ldr	r1, .L1694+12
	bl	dprint_vfmw
	mov	r0, r7
	b	.L1684
.L1693:
	mov	r2, r0
	ldr	r1, .L1694+16
	mov	r0, r9
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1684
.L1692:
	movw	r2, #4698
	ldr	r1, .L1694+20
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1684
.L1695:
	.align	2
.L1694:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC187
	.word	.LC186
	.word	.LC189
	.word	.LC188
	UNWIND(.fnend)
	.size	VDH_PutUsrdecFrame, .-VDH_PutUsrdecFrame
	.align	2
	.global	VCTRL_PutUsrdecFrame
	.type	VCTRL_PutUsrdecFrame, %function
VCTRL_PutUsrdecFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r5, .L1708
	mov	r4, r0
	mov	r3, r1
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L1708+4
	movweq	r3, #4838
	beq	.L1704
	cmp	r3, #0
	beq	.L1705
	ldr	r2, [r0, #600]
	cmp	r2, #20
	bne	.L1706
	ldr	r3, .L1708+8
	mov	r2, #72
	add	r0, r0, #528
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r1, [r5, r4, asl #2]
	mov	r0, r4
	add	r1, r1, #528
	bl	VDH_PutUsrdecFrame
	cmp	r0, #0
	bne	.L1707
.L1698:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1706:
	ldr	r1, .L1708+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1698
.L1707:
	ldr	r1, .L1708+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1698
.L1705:
	ldr	ip, .L1708+20
	mov	r0, r3
	movw	r3, #4839
.L1704:
	ldr	r2, .L1708+24
	ldr	r1, .L1708+28
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1698
.L1709:
	.align	2
.L1708:
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC191
	.word	.LC192
	.word	.LC190
	.word	.LANCHOR0+1532
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_PutUsrdecFrame, .-VCTRL_PutUsrdecFrame
	.align	2
	.global	VCTRL_ResetHardware
	.type	VCTRL_ResetHardware, %function
VCTRL_ResetHardware:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VDMDRV_ResetVDH
	UNWIND(.fnend)
	.size	VCTRL_ResetHardware, .-VCTRL_ResetHardware
	.align	2
	.global	VCTRL_CanBeDecodedByHardWare
	.type	VCTRL_CanBeDecodedByHardWare, %function
VCTRL_CanBeDecodedByHardWare:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #4
	cmpne	r0, #7
	beq	.L1712
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_CanBeDecodedByHardWare.part.26
.L1712:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_CanBeDecodedByHardWare, .-VCTRL_CanBeDecodedByHardWare
	.align	2
	.global	VCTRL_IsChanOpenAndRun
	.type	VCTRL_IsChanOpenAndRun, %function
VCTRL_IsChanOpenAndRun:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #4]
	cmp	r3, #1
	ldreq	r0, [r0, #8]
	subeq	r0, r0, #1
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_IsChanOpenAndRun, .-VCTRL_IsChanOpenAndRun
	.align	2
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	mov	r6, r0
	movwhi	r2, #7871
	ldrhi	r1, .L1762
	bhi	.L1752
	ldr	r5, .L1762+4
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L1753
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L1719
	ldr	r0, [r0, #600]
	cmp	r0, #22
	beq	.L1719
	cmp	r0, #4
	cmpne	r0, #7
	moveq	r7, #1
	movne	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r4, r7
.L1725:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L1724
	ldr	r3, [r5, r4, asl #2]
	ldr	r0, [r3, #600]
	cmp	r0, #4
	cmpne	r0, #7
	beq	.L1724
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	r0, #0
	addne	r7, r7, #1
.L1724:
	add	r4, r4, #1
	cmp	r4, #32
	bne	.L1725
	cmp	r7, #1
	beq	.L1754
.L1726:
	ldr	r3, .L1762+8
	mov	r1, #0
	add	r0, r3, #128
.L1733:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1732
	ldr	r2, [r2, #600]
	cmp	r2, #6
	moveq	r1, #1
.L1732:
	cmp	r3, r0
	bne	.L1733
	cmp	r1, #1
	beq	.L1755
.L1734:
	ldr	r3, [r5, r6, asl #2]
	ldr	r3, [r3, #600]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, .L1762+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1756
	ldr	r3, .L1762+16
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L1719:
	ldr	r1, .L1762+20
	movw	r2, #7883
.L1752:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1754:
	ldr	r4, .L1762+12
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1757
	mov	r0, r7
	mov	r1, #0
	bl	VDH_Need_Module
.L1729:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1730
	ldr	r3, .L1762+16
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L1758
	mov	r0, #0
	blx	r3
	b	.L1726
.L1755:
	ldr	r3, .L1762+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1759
	mov	r1, #0
	mov	r0, #3
	bl	VDH_Need_Module
	b	.L1734
.L1759:
	ldr	r3, .L1762+16
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1760
	mov	r0, #0
	blx	r3
	b	.L1734
.L1757:
	ldr	r3, .L1762+16
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1761
	mov	r0, #0
	blx	r3
	b	.L1729
.L1753:
	movw	r2, #7877
	ldr	r1, .L1762+24
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1756:
	mov	r1, #0
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Need_Module
.L1730:
	mov	r1, #0
	mov	r0, r1
	bl	VDH_Need_Module
	b	.L1726
.L1758:
	mov	r0, r3
	movw	r2, #7932
	ldr	r1, .L1762+28
	bl	dprint_vfmw
	b	.L1726
.L1760:
	mov	r0, r3
	movw	r2, #7963
	ldr	r1, .L1762+28
	bl	dprint_vfmw
	b	.L1734
.L1761:
	mov	r0, r3
	movw	r2, #7918
	ldr	r1, .L1762+28
	bl	dprint_vfmw
	b	.L1729
.L1763:
	.align	2
.L1762:
	.word	.LC193
	.word	.LANCHOR1
	.word	.LANCHOR1-4
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC195
	.word	.LC194
	.word	.LC44
	UNWIND(.fnend)
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	2
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #31
	mov	r5, r0
	ldrhi	ip, .L1778
	movwhi	r3, #2484
	bhi	.L1775
	ldr	r4, .L1778+4
	ldr	r3, [r4, r0, asl #2]
	cmp	r3, #0
	beq	.L1776
	ldr	r6, [r3, #4]
	cmp	r6, #1
	bne	.L1777
	ldr	r3, [r3, #600]
	cmp	r3, #22
	ldreq	ip, .L1778+8
	movweq	r3, #2487
	beq	.L1775
	bl	SM_Start
	ldr	r3, [r4, r5, asl #2]
	mov	r2, #0
	add	r1, r3, #475136
	str	r6, [r1, #1676]
	str	r6, [r3, #8]
	ldr	r3, [r4, r5, asl #2]
	str	r6, [r3, #12]
	ldr	r3, [r4, r5, asl #2]
	str	r2, [r3, #24]
	ldr	r3, [r4, r5, asl #2]
	str	r6, [r3, #16]
	ldr	r2, [r4, r5, asl #2]
	ldr	r3, [r2, #20]
	cmp	r3, #0
	bne	.L1770
	ldr	r3, .L1778+12
	sub	r0, r4, #4
	ldr	r1, .L1778+16
	add	lr, r3, #128
	str	r6, [r2, #20]
.L1773:
	ldr	r2, [r0, #4]!
	add	r3, r3, #4
	add	r1, r1, #4
	cmp	r2, #0
	streq	r2, [r3, #-4]
	ldrne	ip, [r2, #20]
	strne	ip, [r3, #-4]
	ldrne	r2, [r2, #20]
	cmp	r3, lr
	str	r2, [r1, #-4]
	bne	.L1773
	ldr	r0, .L1778+12
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1770:
	ldr	r4, .L1778+20
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r2, #12
	ldr	r3, [r4, #48]
	mov	r1, #0
	ldr	r0, .L1778+24
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #720
	mov	r1, #0
	ldr	r0, .L1778+28
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #2
	mov	r1, #0
	ldr	r0, .L1778+32
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #120
	mov	r1, #0
	ldr	r0, .L1778+36
	blx	r3
	mov	r0, #0
.L1766:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1777:
	ldr	ip, .L1778+40
	movw	r3, #2486
.L1775:
	ldr	r2, .L1778+44
	mov	r0, #0
	ldr	r1, .L1778+48
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1766
.L1776:
	ldr	ip, .L1778+52
	mov	r0, r3
	ldr	r2, .L1778+44
	movw	r3, #2485
	ldr	r1, .L1778+48
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1766
.L1779:
	.align	2
.L1778:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC196
	.word	.LANCHOR3+2300
	.word	g_ChanCtx
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecId
	.word	g_TimeRecTable
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LC124
	.word	.LANCHOR0+1556
	.word	.LC0
	.word	.LC80
	UNWIND(.fnend)
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	2
	.type	VfmwProc_TestStartChan, %function
VfmwProc_TestStartChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r2, r4
	ldr	r1, .L1781
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L1782:
	.align	2
.L1781:
	.word	.LC197
	UNWIND(.fnend)
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	2
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r5, .L1845
	mov	r8, #0
	str	r0, [fp, #-48]
	mov	r7, r8
	add	r9, r5, #128
	mov	r1, r8
	b	.L1793
.L1835:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L1832
.L1789:
	cmp	r8, #0
	cmpeq	r6, #6
	bne	.L1784
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L1833
.L1784:
	cmp	r5, r9
	beq	.L1834
.L1793:
	ldr	r4, [r5, #4]!
	cmp	r4, #0
	beq	.L1784
	cmp	r1, #0
	ldr	r6, [r4, #600]
	beq	.L1835
	cmp	r7, #0
	cmpeq	r6, #1
	bne	.L1789
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L1784
	ldr	r10, [r4, #8]
.L1812:
	cmp	r10, #1
	moveq	r7, #1
	cmp	r8, #0
	cmpeq	r6, #6
	bne	.L1784
.L1813:
	cmp	r10, #1
	moveq	r8, #1
	cmp	r5, r9
	bne	.L1793
.L1834:
	cmp	r1, #0
	beq	.L1836
.L1794:
	cmp	r8, #0
	bne	.L1806
	ldr	r3, .L1845+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1837
	mov	r1, r8
	mov	r0, #3
	bl	VDH_UnNeed_Module
.L1806:
	cmp	r7, #0
	bne	.L1783
.L1842:
	ldr	r3, .L1845+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1838
	ldr	r3, .L1845+8
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1783
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L1833:
	ldr	r10, [r4, #8]
	b	.L1813
.L1832:
	ldr	r10, [r4, #8]
	cmp	r10, #1
	beq	.L1839
.L1788:
	cmp	r7, #0
	cmpeq	r6, #1
	beq	.L1812
	b	.L1789
.L1839:
	cmp	r6, #7
	cmpne	r6, #4
	beq	.L1788
	mov	r0, r6
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	adds	r1, r0, #0
	movne	r1, #1
	b	.L1788
.L1836:
	ldr	r4, .L1845+4
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1799
	ldr	r5, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r0, r5
	bl	SCDDRV_ResetSCD
	mov	r0, r5
	bl	VDMDRV_ResetVDH
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r1, [fp, #-52]
	cmp	r3, #1
	beq	.L1799
	mov	r0, #1
	bl	VDH_UnNeed_Module
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1802
.L1844:
	ldr	r3, .L1845+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L1840
	mov	r0, #0
	blx	r3
.L1805:
	mov	r0, #0
	bl	SCDDRV_SetStateIdle
	b	.L1794
.L1837:
	ldr	r3, .L1845+8
	mov	r0, r8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L1841
	blx	r3
	cmp	r7, #0
	beq	.L1842
.L1783:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1838:
	mov	r1, r7
	mov	r0, #2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_UnNeed_Module
.L1799:
	ldr	r3, .L1845+8
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L1843
	mov	r0, #0
	blx	r3
.L1801:
	mov	r0, #0
	bl	VDMDRV_SetStateIdle
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1844
.L1802:
	mov	r1, #0
	mov	r0, r1
	bl	VDH_UnNeed_Module
	b	.L1794
.L1840:
	mov	r0, r3
	movw	r2, #8057
	ldr	r1, .L1845+12
	bl	dprint_vfmw
	b	.L1805
.L1841:
	movw	r2, #8075
	ldr	r1, .L1845+12
	bl	dprint_vfmw
	b	.L1806
.L1843:
	mov	r0, r3
	movw	r2, #8042
	ldr	r1, .L1845+12
	bl	dprint_vfmw
	b	.L1801
.L1846:
	.align	2
.L1845:
	.word	.LANCHOR1-4
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC44
	UNWIND(.fnend)
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	2
	.global	VCTRL_StopChan
	.type	VCTRL_StopChan, %function
VCTRL_StopChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #31
	mov	r4, r0
	bhi	.L1853
	ldr	r6, .L1855
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1854
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L1852
	str	r2, [r3, #24]
	mov	r3, #0
	ldr	r2, [r6, r0, asl #2]
	str	r3, [r2, #12]
	ldr	r2, [r6, r0, asl #2]
	str	r3, [r2, #8]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1852
	mov	r1, r5
	mov	r0, r4
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r5, [r3, #24]
	bl	VCTRL_CloseHardware
	mov	r0, r5
.L1849:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1852:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1853:
	ldr	ip, .L1855+4
	movw	r3, #2571
	ldr	r2, .L1855+8
	mov	r0, #0
	ldr	r1, .L1855+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1849
.L1854:
	ldr	ip, .L1855+16
	mov	r0, r3
	ldr	r2, .L1855+8
	movw	r3, #2572
	ldr	r1, .L1855+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1849
.L1856:
	.align	2
.L1855:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+1572
	.word	.LC0
	.word	.LC198
	UNWIND(.fnend)
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	2
	.global	VCTRL_StopChanWithCheck
	.type	VCTRL_StopChanWithCheck, %function
VCTRL_StopChanWithCheck:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1864
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1859
.L1863:
	add	r4, r4, #1
	ldr	r3, [r8, #120]
	blx	r3
	cmp	r4, #50
	beq	.L1861
.L1859:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r7
	bl	VCTRL_StopChan
	ldr	r3, [r5, #16]
	mov	r6, r0
	mov	r0, #0
	blx	r3
	cmp	r6, #0
	mov	r0, #10
	bne	.L1863
	cmp	r4, #49
	bgt	.L1861
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1861:
	ldr	r1, .L1864+4
	mvn	r6, #0
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1865:
	.align	2
.L1864:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC199
	UNWIND(.fnend)
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	2
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #31
	mov	r4, r0
	mov	r8, r1
	bhi	.L1892
	ldr	r6, .L1898
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1893
	ldr	r2, [r1]
	cmp	r2, #1
	bhi	.L1894
	ldr	r9, .L1898+4
	mov	r5, #0
	ldr	r7, [r3, #8]
	bl	VCTRL_StopChan
	ldr	r2, [r6, r4, asl #2]
	mov	r3, r4, asl #6
	ldr	r0, .L1898+8
	add	r3, r3, r4, lsl #3
	mov	r1, r5
	ldr	r10, [r9, #48]
	add	r0, r0, r3
	str	r5, [r2, #444]
	str	r5, [r2, #448]
	mov	r2, #72
	blx	r10
	mov	r1, r5
	mov	r0, r4
	bl	VCTRL_SetSendStreamAgainFlag
	ldr	r3, [r9, #12]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	VCTRL_FindOccupiedFrame
	ldr	r3, [r9, #16]
	mov	r0, #4
	blx	r3
	ldr	r2, [r8, #4]
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r2, [r3, #1232]
	bl	InitSyntaxCtx
	ldr	r3, [r6, r4, asl #2]
	movw	r1, #18072
	movt	r1, 7
	add	r1, r3, r1
	ldr	r0, [r3, #600]
	bl	ReleaseCurPic
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r9, #48]
	mov	r1, r5
	mov	r2, #416
	add	r0, r0, #752
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mvn	r0, #0
	mvn	r1, #0
	add	r2, r3, #688
	add	ip, r3, #672
	strd	r0, [ip]
	strd	r0, [r2, #-8]
	mov	r0, r4
	ldr	r2, [r3, #1504]
	str	r5, [r3, #1168]
	cmp	r2, #1
	str	r5, [r3, #1596]
	addeq	r2, r3, #475136
	streq	r5, [r3, #1560]
	streq	r5, [r2, #1612]
	ldr	r3, [r3, #600]
	cmp	r3, #20
	beq	.L1872
	ldr	r3, [r8, #8]
	cmp	r3, #0
	beq	.L1895
.L1872:
	bl	FSP_EmptyInstance
.L1873:
	mov	r0, r4
	bl	InitUsdPool
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L1896
.L1874:
	ldr	r2, [r6, #1052]
	ldr	r3, .L1898
	cmp	r2, #0
	beq	.L1875
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-48]
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1877
	mov	r0, #512
	sub	r1, fp, #48
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1877
	sub	r1, fp, #48
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1877:
	ldr	r1, .L1898+12
	mov	r0, #32
	bl	dprint_vfmw
.L1875:
	cmp	r7, #0
	bne	.L1897
.L1879:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1868:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1896:
	mov	r0, r4
	bl	SM_Reset
	b	.L1874
.L1897:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1879
.L1895:
	bl	FSP_ResetInstance
	b	.L1873
.L1894:
	movw	r2, #3151
	ldr	r1, .L1898+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1868
.L1892:
	ldr	ip, .L1898+20
	movw	r3, #3146
	ldr	r2, .L1898+24
	mov	r0, #0
	ldr	r1, .L1898+28
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1868
.L1893:
	ldr	ip, .L1898+32
	mov	r0, r3
	ldr	r2, .L1898+24
	movw	r3, #3147
	ldr	r1, .L1898+28
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1868
.L1899:
	.align	2
.L1898:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-4
	.word	.LC201
	.word	.LC200
	.word	.LC100
	.word	.LANCHOR0+1588
	.word	.LC0
	.word	.LC101
	UNWIND(.fnend)
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	2
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	cmp	r0, #31
	mov	r4, r0
	bhi	.L1922
	ldr	r6, .L1926
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1923
	ldr	r8, [r3, #8]
	bl	VCTRL_StopChan
	ldr	r7, .L1926+4
	mov	r5, #0
	ldr	r3, [r6, r4, asl #2]
	mov	r0, #4
	ldr	r2, [r7, #12]
	str	r5, [r3, #444]
	str	r5, [r3, #448]
	blx	r2
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	beq	.L1924
.L1904:
	mov	r3, r4, asl #6
	ldr	r0, .L1926+8
	add	r3, r3, r4, lsl #3
	mov	r1, #0
	mov	r5, r1
	mov	r2, #72
	add	r0, r0, r3
	ldr	r9, [r7, #48]
	blx	r9
	mov	r1, r5
	mov	r0, r4
	bl	VCTRL_SetSendStreamAgainFlag
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r5, [r3, #1232]
	bl	InitSyntaxCtx
	ldr	r0, [r6, r4, asl #2]
	mov	r1, r5
	ldr	r3, [r7, #48]
	mov	r2, #416
	add	r0, r0, #752
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mvn	r0, #0
	mvn	r1, #0
	add	r2, r3, #475136
	add	lr, r3, #672
	add	ip, r3, #688
	strd	r0, [lr]
	strd	r0, [ip, #-8]
	mov	r0, r4
	str	r5, [r3, #1168]
	str	r5, [r2, #1640]
	str	r5, [r2, #1632]
	str	r5, [r2, #1636]
	ldr	r1, [r3, #1504]
	str	r5, [r3, #1596]
	cmp	r1, #1
	streq	r5, [r3, #1560]
	streq	r5, [r2, #1612]
	ldr	r3, [r3, #600]
	cmp	r3, #20
	beq	.L1906
	bl	FSP_ResetInstance
.L1907:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	InitUsdPool
	mov	r0, r4
	bl	SM_Reset
	ldr	r2, [r6, #1052]
	ldr	r3, .L1926
	cmp	r2, #0
	beq	.L1908
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-40]
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1910
	mov	r0, #512
	sub	r1, fp, #40
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1910
	sub	r1, fp, #40
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1910:
	ldr	r1, .L1926+12
	mov	r0, #32
	bl	dprint_vfmw
.L1908:
	cmp	r8, #0
	bne	.L1925
.L1912:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1902:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1925:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1912
.L1906:
	bl	FSP_EmptyInstance
	b	.L1907
.L1924:
	add	r2, r3, #475136
	ldr	r1, [r3, #600]
	ldr	r2, [r2, #1680]
	cmp	r2, r1
	bne	.L1904
	str	r5, [r3, #12]
	mov	r0, r4
	bl	VCTRL_FindOccupiedFrame
	b	.L1904
.L1922:
	ldr	ip, .L1926+16
	movw	r3, #3489
	ldr	r2, .L1926+20
	mov	r0, #0
	ldr	r1, .L1926+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1902
.L1923:
	ldr	ip, .L1926+28
	mov	r0, r3
	ldr	r2, .L1926+20
	movw	r3, #3490
	ldr	r1, .L1926+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1902
.L1927:
	.align	2
.L1926:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-4
	.word	.LC201
	.word	.LC100
	.word	.LANCHOR0+1616
	.word	.LC0
	.word	.LC101
	UNWIND(.fnend)
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	2
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #300)
	sub	sp, sp, #300
	ldr	r7, .L2083
	mov	r4, #0
	str	r0, [fp, #-320]
	mov	r8, r1
	mov	r5, r2
	ldr	r3, [r7, #48]
	mov	r1, r4
	mov	r2, #44
	sub	r0, fp, #232
	str	r4, [fp, #-312]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r1, r4
	mov	r2, #144
	sub	r0, fp, #188
	blx	r3
	ldr	r3, [r7, #48]
	mov	r1, r4
	mov	r2, #16
	sub	r0, fp, #308
	blx	r3
	mov	r1, r4
	ldr	r3, [r7, #48]
	sub	r0, fp, #292
	mov	r2, #16
	blx	r3
	cmp	r8, r4
	beq	.L2064
	ldr	r3, [r8, #36]
	cmp	r3, #0
	blt	.L1931
	ldr	r3, [r8, #12]
	cmp	r3, #31
	ble	.L1931
	ldr	r3, [r8, #16]
	cmp	r3, #31
	ble	.L1931
	ldr	r3, [r8, #56]
	cmp	r3, #262144
	blt	.L1931
	ldr	r2, [r8, #44]
	cmp	r2, #1
	beq	.L2065
	cmp	r2, #2
	bne	.L1933
	ldr	r3, [r8, #20]
	cmp	r3, #0
	ble	.L1931
	ldr	r3, [r8, #24]
	cmp	r3, #0
	ble	.L1931
.L2057:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	ble	.L1931
	ldr	r3, [r8, #32]
	cmp	r3, #0
	bgt	.L1933
.L1931:
	ldr	r1, .L2083+4
	mov	r0, #0
	bl	dprint_vfmw
.L1930:
	mvn	r0, #0
.L2049:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1933:
	ldr	r3, [r8, #216]
	movw	ip, #14296
	mov	r4, #1
	movt	ip, 15
	cmp	r3, #1
	sub	r2, fp, #292
	mov	lr, #46848
	mov	r1, r8
	movhi	r3, #0
	strhi	r3, [r8, #216]
	mov	r3, r5
	ldr	r5, [fp, #-320]
	str	r4, [r8, #240]
	movt	lr, 180
	cmp	r5, #26
	str	r4, [r8, #244]
	mov	r0, r5
	movne	lr, ip
	str	lr, [fp, #-324]
	bl	VCTRL_GetChanMemSize
	cmp	r0, #0
	bne	.L2066
	ldr	r6, .L2083+8
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L2002
	mov	r3, r6
.L1939:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1938
	add	r4, r4, #1
	cmp	r4, #32
	bne	.L1939
	ldr	r3, [r8, #252]
	cmp	r3, #1
	beq	.L1998
.L1992:
	mov	r2, #32
	ldr	r1, .L2083+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2049
.L2065:
	ldr	r3, [r8, #20]
	cmp	r3, #0
	bgt	.L2057
	b	.L1931
.L2066:
	movw	r2, #2167
	ldr	r1, .L2083+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2049
.L2064:
	mov	r0, r8
	ldr	r1, .L2083+20
	bl	dprint_vfmw
	b	.L1930
.L2002:
	mov	r4, r3
.L1938:
	ldr	r3, [r8, #252]
	cmp	r3, #1
	beq	.L1998
.L1941:
	cmp	r4, #31
	bhi	.L1992
	ldr	r3, .L2083+24
	mov	r5, #0
	add	r1, r3, #128
.L1943:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r5, r5, #1
	cmp	r3, r1
	bne	.L1943
	cmp	r5, #0
	bne	.L2000
	mov	r3, #3
	mov	r0, #15
	str	r3, [r6, #172]
	ldr	r10, [r7, #68]
	bl	VFMW_GetString
	mov	r3, r5
	mov	r1, #20
	ldr	r9, .L2083+8
	mov	r2, r0
	sub	r0, fp, #276
	blx	r10
	ldr	r3, .L2083+28
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L1945
	blx	r3
	subs	r10, r0, #0
	ble	.L1945
	str	r5, [sp]
	add	r3, r9, #152
	mov	r2, r10
	mov	r1, r5
	sub	r0, fp, #276
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1946
	ldr	r2, [r9, #168]
	sub	r10, fp, #256
	ldr	r1, [r9, #156]
	ldr	r0, [r9, #160]
	bl	MEM_AddMemRecord
	ldr	r3, .L2083
	mov	r2, #20
	mov	r1, r5
	mov	r0, r10
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, .L2083+28
	ldr	r1, [r9, #160]
	ldr	r2, [r9, #168]
	ldr	r3, [r3, #56]
	str	r5, [fp, #-248]
	cmp	r3, #0
	str	r1, [fp, #-256]
	str	r2, [fp, #-252]
	beq	.L1947
	mov	r0, r10
	blx	r3
	cmp	r0, #0
	bne	.L1947
	mov	r3, #3
	str	r3, [r9, #220]
	ldr	r3, .L2083
	mov	r0, #16
	ldr	r3, [r3, #68]
	str	r3, [fp, #-328]
	bl	VFMW_GetString
	mov	r3, r5
	mov	r1, #20
	ldr	ip, [fp, #-328]
	mov	r2, r0
	sub	r0, fp, #276
	blx	ip
	mov	r2, #1
	add	r3, r9, #200
	str	r2, [sp]
	mov	r1, r5
	mov	r2, #10240
	sub	r0, fp, #276
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1948
	ldr	r2, [r9, #216]
	ldr	r1, [r9, #204]
	ldr	r0, [r9, #208]
	bl	MEM_AddMemRecord
	ldr	r1, .L2083
	ldr	r2, [r9, #208]
	mov	r0, #17
	ldr	r3, .L2083+32
	ldr	r1, [r1, #68]
	str	r2, [r3, #1196]
	str	r1, [fp, #-328]
	add	r1, r2, #5120
	str	r1, [r3, #1200]
	bl	VFMW_GetString
	mov	r3, r5
	mov	r1, #20
	ldr	ip, [fp, #-328]
	mov	r2, r0
	sub	r0, fp, #276
	blx	ip
	str	r5, [sp]
	mov	ip, #3
	sub	r0, fp, #276
	add	r3, r9, #176
	mov	r2, #204800
	mov	r1, r5
	str	ip, [r9, #196]
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L2067
	ldr	r2, [r9, #192]
	ldr	r1, [r9, #180]
	ldr	r0, [r9, #184]
	bl	MEM_AddMemRecord
	mov	r2, r5
	ldr	r1, [r9, #192]
	ldr	r0, [r9, #184]
	bl	SM_OpenSCDDrv
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [fp, #-328]
	bne	.L2068
.L1944:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldrd	r2, [r8, #128]
	ldr	r1, .L2083
	orrs	r3, r2, r3
	beq	.L1954
	ldr	r3, [r8, #136]
	cmp	r3, #0
	bne	.L1955
.L1954:
	mov	r0, #7
	mov	r3, #3
	mov	r5, #1
	str	r3, [fp, #-236]
	bl	VFMW_GetString
	ldr	r2, [fp, #-284]
	mov	r3, r10
	str	r5, [sp]
	mov	r1, #0
	bl	MEM_AllocMemBlock
	subs	r9, r0, #0
	bne	.L2069
	ldr	r2, [fp, #-240]
	ldr	r1, [fp, #-252]
	ldr	r0, [fp, #-248]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-248]
	ldr	r2, [fp, #-252]
	ldr	r3, [fp, #-240]
	str	r9, [fp, #-128]
	str	r5, [fp, #-300]
	str	r1, [fp, #-140]
	str	r2, [fp, #-132]
	str	r3, [fp, #-124]
.L1958:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldrd	r2, [r8, #80]
	ldr	r1, .L2083
	orrs	r3, r2, r3
	beq	.L1993
	ldr	r3, [r8, #88]
	cmp	r3, #0
	bne	.L1960
.L1993:
	ldr	r3, [r8, #216]
	cmp	r3, #1
	beq	.L1961
	mov	r0, #8
	mov	r3, #3
	str	r3, [fp, #-236]
	bl	VFMW_GetString
	mov	r3, #0
	ldr	r2, [fp, #-292]
	mov	r1, r3
	str	r3, [sp]
	mov	r3, r10
	bl	MEM_AllocMemBlock
	subs	r5, r0, #0
	bne	.L2070
	ldr	r2, [fp, #-240]
	ldr	r1, [fp, #-252]
	ldr	r0, [fp, #-248]
	bl	MEM_AddMemRecord
	ldr	r0, [fp, #-248]
	ldr	r1, [fp, #-252]
	mov	r3, #1
	ldr	r2, [fp, #-240]
	str	r5, [fp, #-176]
	str	r0, [fp, #-188]
	str	r1, [fp, #-180]
	str	r2, [fp, #-172]
	str	r3, [fp, #-308]
.L1965:
	ldr	r3, [fp, #-288]
	cmp	r3, #0
	bne	.L2055
.L1975:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldr	r3, [fp, #-280]
	cmp	r3, #0
	ble	.L1983
	mov	r0, #11
	mov	r3, #3
	str	r3, [fp, #-236]
	bl	VFMW_GetString
	mov	r3, #0
	ldr	r2, [fp, #-280]
	mov	r1, r3
	str	r3, [sp]
	mov	r3, r10
	bl	MEM_AllocMemBlock
	subs	r5, r0, #0
	bne	.L2071
	ldr	r2, [fp, #-240]
	ldr	r1, [fp, #-252]
	ldr	r0, [fp, #-248]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-248]
	ldr	r2, [fp, #-252]
	ldr	r3, [fp, #-240]
	str	r5, [fp, #-104]
	str	r1, [fp, #-116]
	str	r2, [fp, #-108]
	str	r3, [fp, #-100]
.L1983:
	ldr	r3, [r7, #48]
	mov	r1, #0
	mov	r2, #24
	mov	r0, r10
	blx	r3
	ldr	r3, [r8, #192]
	ldr	r1, .L2083
	cmp	r3, #0
	beq	.L1984
	ldr	r2, [r8, #208]
	cmp	r2, #0
	beq	.L1984
	ldr	r0, [r8, #248]
	str	r3, [fp, #-248]
	cmp	r0, #1
	str	r2, [fp, #-240]
	ldreq	r3, [r1, #160]
	moveq	r2, #3
	ldrne	r3, [r1, #176]
	movne	r2, #0
	moveq	r0, r10
	movne	r0, r10
	str	r2, [fp, #-236]
	blx	r3
	ldr	r2, [fp, #-240]
	mov	r1, r0
	str	r0, [fp, #-252]
	ldr	r0, [fp, #-248]
	bl	MEM_AddMemRecord
	ldr	r0, [fp, #-240]
	ldr	r1, [fp, #-248]
	mov	r3, #0
	ldr	r2, [fp, #-252]
	str	r0, [fp, #-52]
	str	r1, [fp, #-68]
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
.L1984:
	ldr	r3, [r7, #12]
	mov	r0, #0
	blx	r3
	ldr	r9, [fp, #-324]
	ldr	r0, [fp, #-132]
	mov	r1, #0
	sub	r2, r9, #205824
	ldr	r3, [r7, #48]
	sub	r2, r2, #520
	mov	r5, #0
	str	r0, [r6, r4, asl #2]
	blx	r3
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r7, #52]
	mov	r2, #264
	add	r0, r0, #1280
	mov	r1, r8
	add	r0, r0, #8
	blx	r3
	ldr	r0, [r6, r4, asl #2]
	ldr	r10, [fp, #-320]
	mov	r2, #22
	ldr	r1, .L2083+36
	mov	ip, #30
	str	r9, [r0, #1196]
	str	r10, [r0, #36]
	mov	r0, r4
	ldr	r3, [r6, r4, asl #2]
	str	r4, [r3]
	str	r10, [r3, #636]
	str	r5, [r3, #1224]
	ldr	r3, [r6, r4, asl #2]
	ldr	lr, [r8]
	ldr	r10, .L2083+8
	str	lr, [r3, #32]
	ldr	r3, [r6, r4, asl #2]
	add	lr, r3, #475136
	str	r2, [r3, #600]
	str	r2, [lr, #1680]
	str	r5, [r3, #28]
	ldr	r3, [r6, r4, asl #2]
	ldr	r9, [r8, #248]
	add	lr, r3, #475136
	add	r2, r3, #1600
	add	r2, r2, #8
	str	r2, [r1, r4, asl #3]
	str	r9, [lr, #1656]
	add	r1, r3, #442368
	str	ip, [r3, #1600]
	add	r1, r1, #2176
	ldr	r2, [r8, #240]
	ldr	r9, .L2083
	str	r2, [r3, #1680]
	ldr	r2, [r8, #244]
	str	r2, [r3, #1684]
	bl	FSP_EnableInstance
	subs	r2, r0, #0
	bne	.L2072
	mov	r0, r4
	mov	r9, r2
	str	r2, [fp, #-320]
	bl	VCTRL_ResetChan
	ldr	r3, [r10, r4, asl #2]
	ldr	r2, [fp, #-320]
	ldr	lr, [fp, #-308]
	add	r1, r3, #471040
	ldr	ip, [fp, #-304]
	ldr	r0, [fp, #-300]
	str	lr, [r3, #356]
	str	ip, [r3, #360]
	str	r0, [r3, #364]
	add	r3, r3, #475136
	str	r2, [r1, #1564]
	str	r2, [r1, #1568]
	str	r2, [r1, #1576]
	str	r2, [r1, #1580]
	str	r2, [r1, #1572]
	str	r2, [r1, #1584]
	ldr	r1, [r8, #216]
	str	r2, [r3, #1612]
	str	r1, [r3, #1620]
	ldr	r1, [r8, #252]
	str	r2, [r3, #1676]
	str	r1, [r3, #1672]
.L1989:
	mov	r5, r9, asl #6
	ldr	r0, [r6, r4, asl #2]
	add	r5, r5, r9, lsl #3
	movw	r3, #13880
	movt	r3, 7
	add	r3, r5, r3
	add	r0, r0, r3
	mov	r2, #72
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	ldr	r1, [r6, r4, asl #2]
	add	r9, r9, #1
	movw	r3, #13880
	add	r5, r1, r5
	movt	r3, 7
	add	r0, r5, #471040
	add	r3, r5, r3
	cmp	r9, #32
	mov	r2, #255
	ldr	r5, .L2083+8
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r8, .L2083
	str	r2, [r0, #1600]
	bne	.L1989
	movw	r0, #16184
	ldr	r3, [r8, #48]
	mov	r2, #1248
	movt	r0, 7
	add	r0, r1, r0
	mov	r1, #0
	blx	r3
	ldr	r1, [r5, r4, asl #2]
	movw	r0, #17432
	ldr	r3, [r8, #48]
	mov	r2, #24
	movt	r0, 7
	add	r0, r1, r0
	mov	r1, #0
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	ldr	r0, [fp, #-124]
	mov	r6, #0
	ldr	r9, [fp, #-180]
	add	r1, r3, #442368
	ldr	r2, .L2083+40
	str	r0, [r3, #300]
	ldr	r0, [fp, #-68]
	add	r2, r2, r4, lsl #2
	ldr	r7, [fp, #-156]
	ldr	lr, [fp, #-140]
	ldr	ip, [fp, #-132]
	str	r9, [r3, #240]
	str	r0, [r3, #340]
	ldr	r9, [fp, #-52]
	ldr	r0, [fp, #-60]
	ldr	r10, [fp, #-164]
	str	r7, [r3, #264]
	str	lr, [r3, #292]
	str	ip, [r3, #288]
	ldr	lr, [fp, #-172]
	ldr	ip, [fp, #-100]
	ldr	r7, [fp, #-148]
	str	r0, [r3, #336]
	str	r9, [r3, #348]
	ldr	r0, [fp, #-116]
	ldr	r9, [fp, #-108]
	str	r6, [r2, #2428]
	ldr	r2, [fp, #-188]
	str	ip, [r3, #324]
	str	r9, [r3, #312]
	mov	r9, #14848
	str	r2, [r3, #244]
	str	lr, [r3, #252]
	str	r10, [r3, #268]
	str	r7, [r3, #276]
	str	r0, [r3, #316]
	str	r2, [r3, #396]
	add	r2, r0, #15
	str	lr, [r3, #400]
	bic	r2, r2, #15
	str	r6, [r1, #2208]
	str	r4, [r3]
	ldr	r1, [r5, r4, asl #2]
	str	ip, [r3, #392]
	add	lr, r1, #425984
	str	r6, [r3, #372]
	str	r6, [r3, #376]
	str	r10, [r3, #380]
	mov	r10, #131072
	str	r7, [r3, #384]
	str	r0, [r3, #388]
	mov	r0, r4
	str	r2, [r3, #404]
	str	r2, [r3, #412]
	str	r2, [r3, #420]
	mov	r2, #32768
	str	r9, [r3, #408]
	str	r2, [r3, #416]
	str	r10, [r3, #424]
	str	r4, [r1, #228]
	str	r4, [r1, #232]
	str	r4, [lr, #1820]
	bl	SM_ClearInst
	ldr	r3, [r5, r4, asl #2]
	ldr	r2, [fp, #-324]
	mov	r0, r4
	sub	r1, r2, #203776
	ldr	r3, [r3, #288]
	sub	r1, r1, #520
	add	r1, r3, r1
	bl	OpenUsdPool_WithMem
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #1
	mov	r0, r4
	str	r2, [r3, #4]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	r3, [r8]
	ldr	r5, [r5, r4, asl #2]
	blx	r3
	ldr	r3, [r8, #16]
	add	r5, r5, #475136
	str	r0, [r5, #1628]
	mov	r0, r6
	blx	r3
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2000:
	mov	r3, #0
	sub	r10, fp, #256
	str	r3, [fp, #-328]
	b	.L1944
.L2055:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldrd	r2, [r8, #104]
	ldr	r1, .L2083
	orrs	r3, r2, r3
	beq	.L1969
	ldr	r3, [r8, #96]
	cmp	r3, #0
	beq	.L1969
	ldr	r3, [r8, #112]
	cmp	r3, #0
	beq	.L1969
	ldr	r2, [fp, #-288]
	cmp	r3, r2
	bge	.L2073
.L2058:
	ldr	r3, [fp, #-164]
.L1972:
	cmp	r3, #0
	beq	.L1974
	ldrd	r2, [fp, #-156]
	orrs	r3, r2, r3
	beq	.L1974
	ldr	r2, [fp, #-148]
	ldr	r3, [fp, #-288]
	cmp	r2, r3
	bge	.L1975
.L1974:
	ldr	r3, [fp, #-300]
	cmp	r3, #1
	beq	.L2074
.L1976:
	ldr	r3, [fp, #-308]
	cmp	r3, #1
	beq	.L2075
.L1977:
	ldr	r2, .L2083+44
	mov	r0, #1
	ldr	r1, .L2083+48
	bl	dprint_vfmw
.L1978:
	ldr	r2, .L2083+52
	mov	r0, #1
	ldr	r1, .L2083+56
	bl	dprint_vfmw
	ldr	r3, [fp, #-328]
	cmp	r3, #1
	bne	.L1930
	bl	VCTRL_ReleaseHalMem
	mvn	r0, #0
	b	.L2049
.L1961:
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	str	r3, [fp, #-188]
	str	r3, [fp, #-172]
	str	r3, [fp, #-308]
	strd	r0, [fp, #-180]
	b	.L1965
.L1969:
	mov	r0, #9
	mov	r3, #3
	str	r3, [fp, #-236]
	bl	VFMW_GetString
	mov	r3, #0
	ldr	r2, [fp, #-288]
	mov	r1, r3
	str	r3, [sp]
	mov	r3, r10
	bl	MEM_AllocMemBlock
	subs	r5, r0, #0
	bne	.L1971
	ldr	r2, [fp, #-240]
	ldr	r1, [fp, #-252]
	ldr	r0, [fp, #-248]
	bl	MEM_AddMemRecord
	ldr	r3, [fp, #-248]
	ldr	r0, [fp, #-252]
	mov	r2, #1
	ldr	r1, [fp, #-240]
	str	r5, [fp, #-152]
	str	r3, [fp, #-164]
	str	r0, [fp, #-156]
	str	r1, [fp, #-148]
	str	r2, [fp, #-304]
	b	.L1972
.L1955:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r8, #120
	sub	r0, fp, #140
	blx	r3
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-284]
	cmp	r2, r3
	blt	.L2076
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_AddMemRecord
	b	.L1958
.L1945:
	mov	r3, #0
	ldr	r2, .L2083+60
	mov	r0, r3
	ldr	r1, .L2083+64
	bl	dprint_vfmw
.L1951:
	bl	VCTRL_ReleaseHalMem
	ldr	r2, .L2083+52
	ldr	r1, .L2083+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2049
.L1971:
	ldr	ip, [fp, #-288]
	movw	r3, #1691
	ldr	r2, .L2083+44
	mov	r0, #1
	ldr	r1, .L2083+72
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-164]
	b	.L1972
.L1998:
	sub	r1, fp, #312
	mov	r0, #1
	bl	PDT_GetAttribute
	ldr	r3, [fp, #-312]
	cmp	r3, #1
	cmpne	r4, #15
	ble	.L1941
	mov	r2, r4
	ldr	r1, .L2083+76
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2049
.L1960:
	ldr	r3, [r1, #52]
	mov	r2, #24
	sub	r0, fp, #188
	add	r1, r8, #72
	blx	r3
	ldr	r3, [r8, #216]
	ldr	r2, [fp, #-172]
	cmp	r3, #1
	beq	.L1967
	ldr	r3, [fp, #-292]
	cmp	r2, r3
	blt	.L2077
.L1967:
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_AddMemRecord
	b	.L1965
.L2071:
	ldr	r3, [fp, #-300]
	cmp	r3, #1
	beq	.L2078
.L1980:
	ldr	r3, [fp, #-308]
	cmp	r3, #1
	beq	.L2079
.L1981:
	ldr	r3, [fp, #-304]
	cmp	r3, #1
	beq	.L2080
.L1982:
	movw	r2, #2079
	ldr	r1, .L2083+80
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1978
.L2070:
	ldr	r3, [fp, #-300]
	cmp	r3, #1
	beq	.L2081
.L1963:
	movw	r2, #1750
	ldr	r1, .L2083+84
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1978
.L2069:
	mov	r0, r5
	movw	r2, #1961
	ldr	r1, .L2083+88
	bl	dprint_vfmw
	b	.L1978
.L2072:
	mov	r2, r4
	ldr	r1, .L2083+92
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r10, r4, asl #2]
	movw	r2, #13880
	mov	r0, r4
	add	r1, r3, #475136
	movt	r2, 7
	ldr	ip, [r3, #364]
	add	r2, r3, r2
	ldr	lr, [r1, #1620]
	ldr	r6, [r1, #1656]
	str	r2, [fp, #-220]
	ldr	r1, [r3, #356]
	ldr	r2, [r3, #360]
	str	lr, [fp, #-208]
	str	ip, [fp, #-196]
	str	r1, [fp, #-204]
	add	r1, r3, #236
	str	r2, [fp, #-200]
	add	r2, r3, #260
	str	r1, [fp, #-232]
	add	r1, r3, #284
	str	r2, [fp, #-228]
	add	r2, r3, #332
	str	r1, [fp, #-224]
	add	r3, r3, #308
	str	r2, [fp, #-216]
	str	r3, [fp, #-212]
	str	r5, [r10, r4, asl #2]
	bl	VDMDRV_ClearChanIsDec
	ldr	r3, [r9, #16]
	mov	r0, r5
	blx	r3
	mov	r0, r6
	sub	r1, fp, #216
	bl	VCTRL_DelRecordEsBuf.isra.5
	sub	r1, fp, #232
	mov	r0, r4
	bl	VCTRL_FreeChanResource
	mvn	r0, #0
	b	.L2049
.L1947:
	mov	r2, #0
	ldr	r1, .L2083+96
	mov	r0, r2
	bl	dprint_vfmw
	b	.L1951
.L2073:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r8, #96
	sub	r0, fp, #164
	blx	r3
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-156]
	ldr	r0, [fp, #-164]
	bl	MEM_AddMemRecord
	b	.L2058
.L2067:
	mov	r2, #204800
	mov	r3, r5
	str	r2, [sp]
	mov	r0, r5
	ldr	r2, .L2083+60
	ldr	r1, .L2083+100
	bl	dprint_vfmw
	b	.L1951
.L2068:
	mov	r3, #0
	ldr	r2, .L2083+60
	mov	r0, r3
	ldr	r1, .L2083+104
	bl	dprint_vfmw
	b	.L1951
.L1948:
	mov	r2, #10240
	mov	r3, r5
	str	r2, [sp]
	mov	r0, r5
	ldr	r2, .L2083+60
	ldr	r1, .L2083+108
	bl	dprint_vfmw
	b	.L1951
.L1946:
	str	r10, [sp]
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L2083+60
	ldr	r1, .L2083+112
	bl	dprint_vfmw
	b	.L1951
.L2080:
	ldr	r1, [fp, #-156]
	ldr	r0, [fp, #-164]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-156]
	ldr	r0, [fp, #-164]
	bl	MEM_DelMemRecord
	b	.L1982
.L2081:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1963
.L2076:
	movw	r2, #1977
	ldr	r1, .L2083+116
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1978
.L2075:
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-172]
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_DelMemRecord
	b	.L1977
.L2074:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1976
.L2079:
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-172]
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_DelMemRecord
	b	.L1981
.L2078:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1980
.L2077:
	ldr	r1, [fp, #-300]
	cmp	r1, #1
	beq	.L2082
.L1968:
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r2
	ldr	r1, .L2083+120
	movw	r2, #1781
	bl	dprint_vfmw
	b	.L1978
.L2082:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-172]
	ldr	r3, [fp, #-292]
	b	.L1968
.L2084:
	.align	2
.L2083:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC135
	.word	.LANCHOR1
	.word	.LC205
	.word	.LC203
	.word	.LC202
	.word	.LANCHOR1-4
	.word	g_vdm_hal_fun_ptr
	.word	g_HwMem
	.word	s_SmIIS
	.word	.LANCHOR3
	.word	.LANCHOR0+1672
	.word	.LC218
	.word	.LANCHOR0+1652
	.word	.LC220
	.word	.LANCHOR0+1632
	.word	.LC206
	.word	.LC212
	.word	.LC217
	.word	.LC204
	.word	.LC219
	.word	.LC215
	.word	.LC213
	.word	.LC221
	.word	.LC208
	.word	.LC210
	.word	.LC211
	.word	.LC209
	.word	.LC207
	.word	.LC214
	.word	.LC216
	UNWIND(.fnend)
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	2
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	subs	r6, r1, #0
	mov	r7, r0
	ldreq	ip, .L2159
	moveq	r0, r6
	movweq	r3, #2789
	beq	.L2146
	cmp	r7, #31
	ldrhi	ip, .L2159+4
	movwhi	r3, #2790
	bhi	.L2147
	ldr	r8, .L2159+8
	ldr	r3, [r8, r7, asl #2]
	cmp	r3, #0
	beq	.L2148
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L2149
	bl	VCTRL_CheckChanWH
	subs	r10, r0, #0
	bne	.L2150
	ldr	r4, .L2159+12
	ldr	r1, .L2159+16
	bl	PDT_GetAttribute
	ldr	r2, [r6, #8]
	ldr	r3, [r4, #2576]
	cmp	r3, #21
	bhi	.L2093
	cmp	r3, r2
	beq	.L2094
	ldr	r0, .L2159+20
	add	r3, r4, #2576
.L2096:
	ldr	r1, [r3, #4]!
	cmp	r1, #21
	bhi	.L2093
	cmp	r1, r2
	beq	.L2094
	cmp	r3, r0
	bne	.L2096
.L2094:
	cmp	r2, #8
	mov	r3, #0
	str	r3, [fp, #-116]
	beq	.L2151
.L2097:
	cmp	r2, #9
	beq	.L2152
.L2123:
	cmp	r2, #5
	mov	r3, #0
	str	r3, [fp, #-116]
	beq	.L2153
.L2124:
	mov	r1, r6
	mov	r0, r7
	bl	VCTRL_CmpConfigParameter
	subs	r3, r0, #0
	beq	.L2154
	ldr	r9, .L2159+24
	mov	r2, #148
	ldr	r0, [r8, r7, asl #2]
	mov	r1, r6
	ldr	r4, .L2159+8
	ldr	r3, [r9, #52]
	add	r0, r0, #44
	blx	r3
	ldr	ip, [r6, #24]
	ldr	r3, [r8, r7, asl #2]
	mov	r2, #72
	sub	r0, fp, #116
	mov	r1, #0
	str	ip, [r3, #20]
	ldr	r3, [r8, r7, asl #2]
	ldr	ip, [r6, #8]
	str	ip, [r3, #600]
	ldr	ip, [r6, #100]
	str	ip, [r3, #1512]
	ldr	r3, [r9, #48]
	blx	r3
	ldr	r3, [r8, r7, asl #2]
	ldr	r2, [r3, #380]
	cmp	r2, #0
	beq	.L2104
	ldr	r1, [r3, #384]
	cmp	r1, #15
	bgt	.L2155
.L2104:
	ldr	r1, [r6, #84]
	mov	r2, #49152
	ldr	ip, [r6, #24]
	movt	r2, 63683
	ldr	r0, [r6, #8]
	cmp	r1, #1
	str	r2, [fp, #-96]
	addeq	r3, r3, #475136
	ldreq	r2, [r6, #136]
	addne	r3, r3, #475136
	strb	ip, [fp, #-112]
	movne	r2, #0
	ldreq	ip, [r6, #92]
	str	r0, [fp, #-108]
	ldreq	r0, [r6, #96]
	streq	r1, [fp, #-68]
	streq	ip, [fp, #-60]
	streq	r0, [fp, #-56]
	str	r2, [r3, #1668]
	ldr	r3, [r6, #88]
	ldr	r2, [r6, #8]
	cmp	r3, #0
	ldr	r1, [r6, #80]
	movne	r3, #1
	strne	r3, [fp, #-64]
	mov	r3, #0
	cmp	r2, r3
	str	r3, [fp, #-80]
	str	r1, [fp, #-72]
	bne	.L2156
.L2145:
	ldr	r3, [r6, #52]
.L2109:
	ldr	r4, .L2159+28
	mov	r1, #0
	str	r3, [fp, #-76]
	add	r5, r4, #128
	mov	r3, r4
.L2111:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r1, r1, #1
	cmp	r3, r5
	bne	.L2111
	ldr	r3, .L2159+32
	cmp	r1, #1
	str	r3, [fp, #-132]
	ble	.L2157
.L2112:
	mov	r3, #0
	str	r3, [fp, #-76]
.L2113:
	ldr	r3, [r8, r7, asl #2]
	mov	r2, #12
	sub	r0, fp, #92
	ldrsb	r3, [r3, #44]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [fp, #-76]
	add	r3, r6, #12
	str	r3, [fp, #-128]
	mov	r1, r3
	ldr	r3, [r9, #52]
	blx	r3
	sub	r1, fp, #116
	mov	r0, r7
	bl	SM_Config
	ldr	r3, [r9, #48]
	sub	r0, fp, #120
	mov	r2, #1
	mov	r1, #0
	blx	r3
	ldr	r3, [r6, #84]
	cmp	r3, #1
	beq	.L2158
.L2115:
	ldr	r3, [r8, r7, asl #2]
	mov	lr, #1
	ldr	r2, [fp, #-132]
	ldr	r1, [r3, #292]
	ldr	ip, [r3, #300]
	ldr	r0, [r3, #372]
	str	r1, [r3, #1200]
	ldr	r1, [r3, #376]
	str	ip, [r3, #1204]
	str	r0, [r3, #624]
	str	r1, [r3, #628]
	ldr	ip, [r3, #404]
	ldr	r0, [r3, #408]
	ldr	r1, [r3, #412]
	str	ip, [r3, #640]
	str	r0, [r3, #644]
	str	r1, [r3, #648]
	ldr	ip, [r3, #416]
	ldr	r0, [r3, #420]
	ldr	r1, [r3, #424]
	str	ip, [r3, #652]
	add	ip, r3, #475136
	str	r0, [r3, #656]
	str	r1, [r3, #660]
	ldr	r1, [r6, #28]
	ldr	r2, [r2, #72]
	str	r1, [r3, #612]
	cmp	r2, #7
	ldr	r1, [r6, #28]
	str	r1, [r3, #608]
	ldr	r1, [r6, #36]
	str	r1, [r3, #616]
	ldreq	r2, [r6, #40]
	str	r2, [r3, #632]
	mov	r2, #0
	ldr	r1, [r6, #44]
	str	r1, [r3, #620]
	mov	r1, r6
	ldr	r0, [r6, #132]
	str	r0, [r3, #1252]
	ldr	r0, [r6, #140]
	str	lr, [r3, #1256]
	str	lr, [r3, #1260]
	str	r0, [r3, #1588]
	ldr	r0, [r6, #72]
	rsb	r0, lr, r0
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r3, #1236]
	ldr	r0, [r6, #76]
	str	r0, [r3, #1240]
	ldr	r0, [r6, #48]
	str	r0, [r3, #1244]
	ldr	r0, [fp, #-76]
	str	r2, [r3, #1560]
	str	r2, [r3, #1580]
	str	r0, [r3, #1248]
	mov	r0, r7
	str	r2, [r3, #1596]
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	strb	r3, [ip, #1616]
	bl	VCTRL_ConfigChanCompress
	ldr	r0, [r8, r7, asl #2]
	ldr	r3, [r9, #52]
	mov	r2, #12
	add	r0, r0, #1168
	ldr	r1, [fp, #-128]
	add	r0, r0, #4
	ldr	r9, .L2159+8
	blx	r3
	ldr	ip, [r8, r7, asl #2]
	add	r3, ip, #475136
	ldr	r0, [ip, #600]
	ldr	r2, [r3, #1680]
	cmp	r2, r0
	beq	.L2117
	mov	r0, r7
	bl	VCTRL_ResetChan
	ldr	r3, [r6, #8]
	ldr	ip, [r9, r7, asl #2]
	cmp	r3, #20
	beq	.L2118
	ldr	r0, [ip, #600]
	add	r3, ip, #475136
.L2117:
	ldr	r1, .L2159+36
	ldr	r2, .L2159+40
	str	r0, [r3, #1680]
.L2122:
	ldr	r3, [r4, #4]!
	add	r1, r1, #4
	add	r2, r2, #4
	cmp	r3, #0
	streq	r3, [r1, #-4]
	ldrne	r0, [r3, #20]
	strne	r0, [r1, #-4]
	ldrne	r3, [r3, #20]
	cmp	r5, r4
	str	r3, [r2, #-4]
	bne	.L2122
	ldr	r0, .L2159+36
	bl	VDMDRV_SetPriority
	mov	r0, r7
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2154:
	ldr	r1, .L2159+44
	mov	r10, r3
	bl	dprint_vfmw
.L2142:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2093:
	ldr	r1, .L2159+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r10, #0
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2156:
	cmp	r2, #16
	beq	.L2145
	b	.L2109
.L2152:
	sub	r0, fp, #116
	bl	REAL9DEC_Support
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	ldrne	r2, [r6, #8]
	bne	.L2123
.L2098:
	mvn	r10, #0
	b	.L2142
.L2151:
	sub	r0, fp, #116
	bl	REAL8DEC_Support
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	beq	.L2098
	ldr	r2, [r6, #8]
	b	.L2097
.L2153:
	sub	r0, fp, #116
	bl	DIVX3DEC_Support
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	bne	.L2124
	b	.L2098
.L2149:
	ldr	ip, .L2159+52
	movw	r3, #2792
.L2147:
	ldr	r2, .L2159+56
	mov	r0, #0
	ldr	r1, .L2159+60
	mvn	r10, #0
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2157:
	ldr	r3, [r3, #88]
	cmp	r3, #0
	bne	.L2113
	b	.L2112
.L2155:
	mov	r0, r2
	str	r2, [fp, #-104]
	bl	MEM_Phy2Vir
	ldr	r3, [r4, r7, asl #2]
	str	r0, [fp, #-116]
	ldr	r2, [r3, #384]
	sub	r2, r2, #16
	str	r2, [fp, #-100]
	b	.L2104
.L2158:
	sub	r1, fp, #120
	mov	r0, r7
	strb	r3, [fp, #-120]
	bl	FSP_ConfigAttribute
	b	.L2115
.L2150:
	ldr	r1, .L2159+64
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L2142
.L2118:
	ldr	r3, [ip, #396]
	mov	r0, r7
	ldr	r2, [ip, #1304]
	ldr	r1, [ip, #1300]
	ldr	ip, [ip, #400]
	str	ip, [sp]
	bl	VCTRL_PartitionMemForStdUser
	cmp	r0, #0
	bne	.L2119
	ldr	ip, [r9, r7, asl #2]
	add	r3, ip, #475136
	ldr	r0, [ip, #600]
	b	.L2117
.L2148:
	ldr	ip, .L2159+68
	mov	r0, r3
	movw	r3, #2791
.L2146:
	ldr	r2, .L2159+56
	mvn	r10, #0
	ldr	r1, .L2159+60
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L2142
.L2119:
	mov	r0, #1
	ldr	r1, .L2159+72
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L2142
.L2160:
	.align	2
.L2159:
	.word	.LC222
	.word	.LC100
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LANCHOR3+2556
	.word	.LANCHOR3+2700
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1-4
	.word	.LANCHOR2
	.word	.LANCHOR3+2704
	.word	g_ChanCtx
	.word	.LC225
	.word	.LC224
	.word	.LC74
	.word	.LANCHOR0+1692
	.word	.LC0
	.word	.LC223
	.word	.LC101
	.word	.LC226
	UNWIND(.fnend)
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	2
	.type	VfmwProc_SetUvmosEnable, %function
VfmwProc_SetUvmosEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #152)
	sub	sp, sp, #152
	ldr	r4, [r0]
	ldr	r1, .L2165
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2165+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L2164
	mov	r2, r4
	ldr	r1, .L2165+8
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2164:
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-36]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2166:
	.align	2
.L2165:
	.word	.LC227
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC228
	UNWIND(.fnend)
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	2
	.type	VfmwProc_SetDropStreamThread, %function
VfmwProc_SetDropStreamThread:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #152)
	sub	sp, sp, #152
	ldr	r4, [r0]
	ldr	r1, .L2169
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2169+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2167
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-136]
	bl	VCTRL_ConfigChan
.L2167:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2170:
	.align	2
.L2169:
	.word	.LC229
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetDropStreamThread, .-VfmwProc_SetDropStreamThread
	.align	2
	.type	VfmwProc_SetDecMode, %function
VfmwProc_SetDecMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #152)
	sub	sp, sp, #152
	ldr	r4, [r0]
	ldr	r1, .L2175
	mov	r0, #32
	and	r5, r4, #7
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2175+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L2174
	mov	r2, r4
	ldr	r1, .L2175+8
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2174:
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-132]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2176:
	.align	2
.L2175:
	.word	.LC230
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC231
	UNWIND(.fnend)
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	2
	.type	VfmwProc_SetDecOrderOutput, %function
VfmwProc_SetDecOrderOutput:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #152)
	sub	sp, sp, #152
	ldr	r4, [r0]
	ldr	r1, .L2179
	mov	r0, #32
	and	r5, r4, #3
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2179+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2177
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-128]
	bl	VCTRL_ConfigChan
.L2177:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2180:
	.align	2
.L2179:
	.word	.LC232
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	2
	.type	VfmwProc_SetErrorThread, %function
VfmwProc_SetErrorThread:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #152)
	sub	sp, sp, #152
	ldr	r4, [r0]
	ldr	r1, .L2183
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2183+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2181
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-140]
	bl	VCTRL_ConfigChan
.L2181:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2184:
	.align	2
.L2183:
	.word	.LC233
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetErrorThread, .-VfmwProc_SetErrorThread
	.align	2
	.type	VfmwProc_TestResetChan, %function
VfmwProc_TestResetChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L2186
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2187:
	.align	2
.L2186:
	.word	.LC234
	UNWIND(.fnend)
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	2
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #56)
	sub	sp, sp, #56
	ldr	r4, .L2210
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	cmp	r5, #31
	ldrhi	ip, .L2210+4
	movwhi	r3, #2377
	bhi	.L2205
	ldr	r6, .L2210+8
	ldr	r7, [r6, r5, asl #2]
	cmp	r7, #0
	beq	.L2206
	ldr	r8, [r7, #4]
	cmp	r8, #1
	bne	.L2207
	mov	r0, #0
	str	r0, [r7, #8]
	ldr	r3, [r4, #16]
	blx	r3
	mov	r0, r5
	bl	SCDDRV_IsChanDec
	cmp	r0, #0
	bne	.L2208
.L2193:
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	ldr	r2, .L2210+12
	ldr	r3, [r4, #12]
	mov	r0, #4
	mov	r4, #0
	ldr	r8, .L2210
	str	r4, [r2, r5, asl #2]
	blx	r3
	mov	r0, r5
	bl	VCTRL_StopChan
	ldr	r3, [r8, #16]
	subs	r7, r0, #0
	mov	r0, #4
	bne	.L2209
	blx	r3
	mov	r0, r5
	bl	VCTRL_ResetChan
	mov	r4, r7
	bl	VDMDRV_ParamInit
	ldr	r3, .L2210+16
	ldr	r2, [r8, #12]
	mov	r0, #4
	add	r3, r3, r5, lsl #2
	str	r7, [r3, #-516]
	blx	r2
	mov	r0, r5
	bl	FSP_DisableInstance
	mov	r0, r5
	bl	CloseUsdPool_WithMem
	ldr	r3, [r6, r5, asl #2]
	ldr	r0, .L2210+20
	add	r2, r3, #475136
	str	r7, [r6, r5, asl #2]
	add	r6, r6, r5, lsl #4
	ldr	r1, [r2, #1620]
	ldr	r9, [r2, #1656]
	movw	r2, #13880
	str	r7, [r0, r5, asl #3]
	movt	r2, 7
	ldr	r0, [r3, #364]
	add	r2, r3, r2
	str	r1, [fp, #-56]
	str	r2, [fp, #-68]
	ldr	r1, [r3, #356]
	ldr	r2, [r3, #360]
	str	r0, [fp, #-44]
	mov	r0, r5
	str	r1, [fp, #-52]
	str	r2, [fp, #-48]
	add	r2, r3, #236
	str	r2, [fp, #-80]
	add	r2, r3, #260
	str	r2, [fp, #-76]
	add	r2, r3, #284
	str	r2, [fp, #-72]
	add	r2, r3, #332
	add	r3, r3, #308
	str	r2, [fp, #-64]
	str	r3, [fp, #-60]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	SCDDRV_ResetSCD
	mov	r0, r5
	bl	VDMDRV_ResetVDH
	ldr	r2, [r8, #16]
	mvn	r3, #0
	str	r7, [r6, #392]
	str	r3, [r6, #404]
	mov	r0, #4
	str	r3, [r6, #400]
	str	r7, [r6, #396]
	blx	r2
	ldr	r3, [r8, #16]
	mov	r0, r7
	blx	r3
	ldr	r3, [r8, #24]
	mov	r1, r5
	mov	r0, #1
	blx	r3
	mov	r0, r9
	sub	r1, fp, #64
	bl	VCTRL_DelRecordEsBuf.isra.5
	sub	r1, fp, #80
	mov	r0, r5
	bl	VCTRL_FreeChanResource
	ldr	r3, [r8, #28]
	mov	r1, r5
	mov	r0, #1
	blx	r3
	ldr	r3, .L2210+24
	add	r1, r3, #128
.L2196:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r4, r4, #1
	cmp	r3, r1
	bne	.L2196
	cmp	r4, #0
	movne	r0, #0
	bne	.L2190
	bl	VCTRL_ReleaseHalMem
	mov	r0, r4
.L2190:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2208:
	mov	r0, r5
	ldr	r7, [r4, #132]
	bl	SCDDRV_IsChanDec
	mov	r2, #500
	clz	r1, r0
	mov	r0, r8
	mov	r1, r1, lsr #5
	blx	r7
	b	.L2193
.L2207:
	ldr	ip, .L2210+28
	movw	r3, #2391
.L2205:
	ldr	r2, .L2210+32
	mov	r0, #0
	ldr	r1, .L2210+36
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2209:
	blx	r3
	ldr	r3, [r8, #16]
	mov	r0, r4
	blx	r3
	mvn	r0, #0
	b	.L2190
.L2206:
	ldr	ip, .L2210+40
	mov	r3, #2384
	ldr	r2, .L2210+32
	mov	r0, r7
	ldr	r1, .L2210+36
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #16]
	mov	r0, r7
	blx	r3
	mvn	r0, #0
	b	.L2190
.L2211:
	.align	2
.L2210:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC65
	.word	.LANCHOR1
	.word	g_LowDelaySeqIndex
	.word	.LANCHOR3
	.word	s_SmIIS
	.word	.LANCHOR1-4
	.word	.LC237
	.word	.LANCHOR0+1712
	.word	.LC235
	.word	.LC236
	UNWIND(.fnend)
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	2
	.global	VCTRL_CloseVfmw
	.type	VCTRL_CloseVfmw, %function
VCTRL_CloseVfmw:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r6, .L2230
	ldr	r3, [r6, #128]
	cmp	r3, #1
	bne	.L2219
	sub	r5, r6, #4
	mov	r4, #0
.L2215:
	ldr	r3, [r5, #4]!
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L2214
	bl	VCTRL_DestroyChan
.L2214:
	cmp	r4, #32
	bne	.L2215
	bl	FSP_Exit
	ldr	r3, [r6, #132]
	mov	r2, #3
	ldr	r5, .L2230+4
	cmp	r3, #0
	str	r2, [r6, #136]
	beq	.L2217
	mov	r0, #10
	ldr	r3, [r5, #120]
	mov	r4, #49
	blx	r3
	b	.L2218
.L2229:
	ldr	r3, [r5, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L2217
.L2218:
	ldr	r3, [r6, #132]
	mov	r0, #10
	cmp	r3, #0
	bne	.L2229
.L2217:
	ldr	r3, [r5, #48]
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L2230+8
	blx	r3
	ldr	r0, .L2230+12
	bl	CloseDrivers
	mov	r3, #0
	mov	r0, r3
	str	r3, [r6, #128]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2219:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2231:
	.align	2
.L2230:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-516
	.word	.LANCHOR1+152
	UNWIND(.fnend)
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	2
	.type	VfmwProc_TestRestartChan, %function
VfmwProc_TestRestartChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StopChan
	mov	r2, r4
	ldr	r1, .L2233
	mov	r3, r0
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L2233+4
	mov	r3, r0
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r2, r4
	ldr	r1, .L2233+8
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2234:
	.align	2
.L2233:
	.word	.LC238
	.word	.LC234
	.word	.LC197
	UNWIND(.fnend)
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	2
	.type	VfmwProc_TestStopChan, %function
VfmwProc_TestStopChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StopChan
	mov	r2, r4
	ldr	r1, .L2236
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2237:
	.align	2
.L2236:
	.word	.LC238
	UNWIND(.fnend)
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	2
	.global	VCTRL_InitDspCode
	.type	VCTRL_InitDspCode, %function
VCTRL_InitDspCode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #6
	mov	r5, r0
	moveq	r4, #1
	beq	.L2239
	cmp	r1, #0
	moveq	r4, #2
	movne	r4, #0
.L2239:
	ldr	r3, .L2253
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2249
	mov	r1, r4
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Require_DspCode
.L2249:
	ldr	r6, .L2253+4
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L2250
	mov	r0, #0
	blx	r3
.L2242:
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L2251
	mov	r0, #0
	blx	r3
.L2244:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	beq	.L2252
	mov	r0, #0
	blx	r3
.L2246:
	mov	r1, r4
	mov	r0, #0
	bl	SCDDRV_LoadDspCode
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_CloseHardware
.L2250:
	mov	r0, r3
	movw	r2, #3055
	ldr	r1, .L2253+8
	bl	dprint_vfmw
	b	.L2242
.L2251:
	mov	r0, r3
	mov	r2, #3056
	ldr	r1, .L2253+8
	bl	dprint_vfmw
	b	.L2244
.L2252:
	mov	r0, r3
	movw	r2, #3057
	ldr	r1, .L2253+8
	bl	dprint_vfmw
	b	.L2246
.L2254:
	.align	2
.L2253:
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC44
	UNWIND(.fnend)
	.size	VCTRL_InitDspCode, .-VCTRL_InitDspCode
	.align	2
	.global	VCTRL_LoadDspCode
	.type	VCTRL_LoadDspCode, %function
VCTRL_LoadDspCode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2281
	mov	r5, r0
	ldr	r3, [r3, r0, asl #2]
	ldr	r1, [r3, #600]
	cmp	r1, #0
	movne	r3, #1
	movne	r6, #0
	ldreq	r6, [r3, #1244]
	clzeq	r3, r6
	moveq	r3, r3, lsr #5
.L2256:
	cmp	r1, #6
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L2277
.L2268:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2277:
	ldr	r7, .L2281+4
	ldr	r4, [r7, #-516]
	cmp	r4, #0
	bne	.L2257
	sub	r3, r7, #516
	sub	r2, r7, #392
	b	.L2258
.L2279:
	cmp	r3, r2
	beq	.L2278
.L2258:
	ldr	r4, [r3, #4]!
	cmp	r4, #0
	beq	.L2279
.L2257:
	cmp	r4, #1
	beq	.L2280
	cmp	r1, #6
	beq	.L2268
	ldr	r1, .L2281+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2278:
	mov	r0, r5
	add	r5, r7, r5, lsl #2
	bl	VCTRL_InitDspCode
	cmp	r6, #1
	mov	r0, r4
	streq	r6, [r5, #-516]
	movne	r3, #2
	strne	r3, [r5, #-516]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2280:
	cmp	r6, #1
	beq	.L2268
	ldr	r1, .L2281+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2282:
	.align	2
.L2281:
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC240
	.word	.LC239
	UNWIND(.fnend)
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	2
	.global	VCTRL_SetChanFsPartitionState
	.type	VCTRL_SetChanFsPartitionState, %function
VCTRL_SetChanFsPartitionState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2284
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #442368
	str	r1, [r3, #2208]
	ldmfd	sp, {fp, sp, pc}
.L2285:
	.align	2
.L2284:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	2
	.global	VCTRL_GetCurChanFsSize
	.type	VCTRL_GetCurChanFsSize, %function
VCTRL_GetCurChanFsSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2287
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #471040
	ldr	r0, [r3, #1564]
	ldmfd	sp, {fp, sp, pc}
.L2288:
	.align	2
.L2287:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	2
	.global	VCTRT_SetChanCtrlState
	.type	VCTRT_SetChanCtrlState, %function
VCTRT_SetChanCtrlState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #1
	beq	.L2291
	bcc	.L2292
	cmp	r1, #2
	bne	.L2299
	ldr	r3, .L2300
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #2428]
	cmp	r3, #1
	beq	.L2296
	mov	r3, #0
	str	r1, [r0, #2428]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2299:
	mov	r3, #0
.L2290:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2292:
	ldr	r2, .L2300
	mov	r1, #0
	mov	r3, r1
	add	r0, r2, r0, lsl #2
	str	r1, [r0, #2428]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2291:
	ldr	r3, .L2300
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #2428]
	cmp	r3, #0
	bne	.L2296
	str	r1, [r0, #2428]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2296:
	mvn	r3, #0
	b	.L2290
.L2301:
	.align	2
.L2300:
	.word	.LANCHOR3
	UNWIND(.fnend)
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.align	2
	.global	VCTRL_AddFrameBufMemoryRecord
	.type	VCTRL_AddFrameBufMemoryRecord, %function
VCTRL_AddFrameBufMemoryRecord:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0]
	mov	r4, r0
	cmp	r3, #255
	beq	.L2303
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #24]
	ldr	r0, [r0, #32]
	bl	MEM_AddMemRecord
.L2303:
	ldr	r3, [r4, #4]
	cmp	r3, #255
	beq	.L2304
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #48]
	bl	MEM_AddMemRecord
.L2304:
	ldr	r3, [r4, #8]
	cmp	r3, #255
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #56]
	ldr	r0, [r4, #64]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MEM_AddMemRecord
	UNWIND(.fnend)
	.size	VCTRL_AddFrameBufMemoryRecord, .-VCTRL_AddFrameBufMemoryRecord
	.align	2
	.global	VCTRL_SetSingleFrameBufToChan
	.type	VCTRL_SetSingleFrameBufToChan, %function
VCTRL_SetSingleFrameBufToChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r7, .L2346
	mov	r4, r0
	mov	r5, r1
	ldr	r1, [r1, #12]
	ldr	r3, [r7, r0, asl #2]
	add	r2, r3, #475136
	add	r3, r3, #471040
	ldr	r0, [r2, #1040]
	cmp	r0, r1
	beq	.L2313
	ldr	ip, [r3, #1560]
	cmp	ip, #0
	beq	.L2341
.L2313:
	ldr	r3, [r3, #3952]
	cmp	r3, #0
	beq	.L2315
	ldr	r2, [r2, #1072]
	cmp	r2, #0
	beq	.L2342
.L2315:
	ldr	r6, .L2346+4
	mov	r0, #8
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r0, [r7, r4, asl #2]
	add	r2, r0, #471040
	ldr	r3, [r2, #1592]
	cmp	r3, #255
	beq	.L2324
	add	r2, r2, #1664
	mov	r1, #1
	b	.L2317
.L2344:
	add	r1, r1, #1
	cmp	r1, #32
	beq	.L2343
.L2317:
	ldr	ip, [r2]
	add	r2, r2, #72
	cmp	ip, #255
	bne	.L2344
.L2316:
	mov	r2, r1, asl #6
	movw	r3, #13880
	add	r1, r2, r1, lsl #3
	movt	r3, 7
	add	r3, r1, r3
	ldr	r9, [r6, #52]
	add	r0, r0, r3
	mov	r2, #72
	mov	r1, r5
	ldr	r8, .L2346+4
	blx	r9
	ldr	r3, [r7, r4, asl #2]
	mov	r0, r5
	ldr	r9, .L2346+8
	add	r3, r3, #475136
	ldr	r2, [r3, #1072]
	add	r2, r2, #1
	str	r2, [r3, #1072]
	bl	VCTRL_AddFrameBufMemoryRecord
	mov	r3, r4, asl #6
	add	r3, r3, r4, lsl #3
	add	r9, r9, r3
	ldr	r3, [r9, #20]
	cmp	r3, #2
	beq	.L2345
.L2319:
	ldr	r3, [r7, r4, asl #2]
	add	r3, r3, #475136
	ldr	r3, [r3, #1076]
	cmp	r3, #0
	bne	.L2320
.L2322:
	mov	r4, #0
.L2321:
	ldr	r3, [r6, #16]
	mov	r0, #8
	blx	r3
	mov	r0, r4
.L2337:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2342:
	ldr	r3, [r5, #8]
	cmp	r3, #255
	bne	.L2315
	str	r3, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	movw	r3, #8188
	ldr	r2, .L2346+12
	ldr	r1, .L2346+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2337
.L2343:
	mov	r3, r4
	ldr	r2, .L2346+12
	ldr	r1, .L2346+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L2321
.L2345:
	ldr	r3, [r9, #48]
	cmp	r3, #0
	bne	.L2319
	ldr	r3, [r8]
	blx	r3
	mov	r3, #3
	str	r3, [r9, #20]
	str	r0, [r9, #48]
	b	.L2319
.L2320:
	mov	r1, r5
	mov	r0, r4
	bl	FSP_SetSingleFrameBuf
	cmp	r0, #0
	beq	.L2322
	mov	r3, r4
	ldr	r2, .L2346+12
	ldr	r1, .L2346+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L2321
.L2324:
	mov	r1, #0
	b	.L2316
.L2341:
	str	r0, [sp, #4]
	movw	r3, #8178
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L2346+12
	ldr	r1, .L2346+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2337
.L2347:
	.align	2
.L2346:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LANCHOR0+1732
	.word	.LC242
	.word	.LC244
	.word	.LC243
	.word	.LC241
	UNWIND(.fnend)
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	2
	.global	VCTRL_AllocMemToDecoder
	.type	VCTRL_AllocMemToDecoder, %function
VCTRL_AllocMemToDecoder:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #76)
	sub	sp, sp, #76
	ldr	r5, .L2360
	mov	r7, r0, asl #2
	mov	r4, r0
	add	r3, r5, r7
	ldr	r10, [r3, #2428]
	cmp	r10, #0
	bne	.L2349
	ldr	r8, .L2360+4
	mov	ip, #1
	mov	r2, #72
	str	ip, [r3, #2428]
	sub	r0, fp, #116
	ldr	r9, .L2360+8
	ldr	r3, [r8, #52]
	blx	r3
	sub	r1, fp, #116
	mov	r0, r4
	bl	VCTRL_SetSingleFrameBufToChan
	ldr	r3, [r9, r4, asl #2]
	subs	r6, r0, #0
	bne	.L2358
.L2351:
	add	r3, r3, #442368
	mov	r2, #2
	ldr	r1, .L2360+12
	mov	r0, #31
	str	r2, [r3, #2208]
	bl	dprint_vfmw
	ldr	r3, [r9, r4, asl #2]
	ldr	r9, .L2360+8
	add	r3, r3, #475136
	ldr	r3, [r3, #1676]
	cmp	r3, #1
	beq	.L2359
.L2352:
	add	r5, r5, r7
	mov	r0, r6
	mov	r3, #0
	str	r3, [r5, #2428]
.L2357:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2358:
	add	r2, r3, #471040
	ldr	r2, [r2, #1564]
	cmp	r2, #0
	beq	.L2351
	mov	r2, r4
	ldr	r1, .L2360+16
	mov	r0, r10
	bl	dprint_vfmw
	ldr	r3, [r9, r4, asl #2]
	mov	r1, #3
	add	r2, r3, #442368
	str	r1, [r2, #2208]
	b	.L2351
.L2359:
	ldr	r3, [r8, #128]
	mov	r0, #0
	blx	r3
	ldr	r3, [r9, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #475136
	str	r2, [r3, #1676]
	b	.L2352
.L2349:
	mov	r3, r0
	ldr	r2, .L2360+20
	ldr	r1, .L2360+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2357
.L2361:
	.align	2
.L2360:
	.word	.LANCHOR3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC246
	.word	.LC245
	.word	.LANCHOR0+1764
	.word	.LC247
	UNWIND(.fnend)
	.size	VCTRL_AllocMemToDecoder, .-VCTRL_AllocMemToDecoder
	.align	2
	.global	VCTRL_GetFsSize
	.type	VCTRL_GetFsSize, %function
VCTRL_GetFsSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	r3, .L2367
	mov	r5, r0
	mov	r6, r1
	mov	r7, r2
	sub	r0, fp, #52
	ldr	r3, [r3, #48]
	mov	r2, #24
	mov	r1, #0
	blx	r3
	ldr	r3, .L2367+4
	ldr	r4, [r3, #52]
	cmp	r4, #0
	beq	.L2363
	ldr	ip, .L2367+8
	sub	r3, fp, #52
	str	r3, [sp, #4]
	mov	r2, r7
	mov	r1, r6
	mov	r0, r5
	ldr	ip, [ip, r5, asl #2]
	mov	r3, #0
	add	ip, ip, #475136
	ldr	ip, [ip, #1680]
	str	ip, [sp]
	blx	r4
.L2363:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2368:
	.align	2
.L2367:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_GetFsSize, .-VCTRL_GetFsSize
	.align	2
	.global	VCTRL_EnableEsBuf
	.type	VCTRL_EnableEsBuf, %function
VCTRL_EnableEsBuf:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2370
	mov	r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #2832]
	ldmfd	sp, {fp, sp, pc}
.L2371:
	.align	2
.L2370:
	.word	.LANCHOR3
	UNWIND(.fnend)
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	2
	.global	VCTRL_DisableEsBuf
	.type	VCTRL_DisableEsBuf, %function
VCTRL_DisableEsBuf:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2373
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #2832]
	ldmfd	sp, {fp, sp, pc}
.L2374:
	.align	2
.L2373:
	.word	.LANCHOR3
	UNWIND(.fnend)
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	2
	.global	VCTRL_IfEsBufEnable
	.type	VCTRL_IfEsBufEnable, %function
VCTRL_IfEsBufEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L2376
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #2832]
	ldmfd	sp, {fp, sp, pc}
.L2377:
	.align	2
.L2376:
	.word	.LANCHOR3
	UNWIND(.fnend)
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
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
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.19829, %object
	.size	__func__.19829, 18
__func__.19829:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.21050, %object
	.size	__func__.21050, 24
__func__.21050:
	.ascii	"VCTRL_SetLastFrameState\000"
	.type	__func__.19768, %object
	.size	__func__.19768, 20
__func__.19768:
	.ascii	"VCTRL_RecordPosTime\000"
	.type	__func__.19773, %object
	.size	__func__.19773, 17
__func__.19773:
	.ascii	"VCTRL_RecordData\000"
	.space	3
	.type	__func__.19820, %object
	.size	__func__.19820, 23
__func__.19820:
	.ascii	"VCTRL_SetMoreGapEnable\000"
	.space	1
	.type	__func__.19841, %object
	.size	__func__.19841, 18
__func__.19841:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__func__.19881, %object
	.size	__func__.19881, 25
__func__.19881:
	.ascii	"VCTRL_SetStreamInterface\000"
	.space	3
	.type	__func__.19886, %object
	.size	__func__.19886, 29
__func__.19886:
	.ascii	"VCTRL_SetSendStreamAgainFlag\000"
	.space	3
	.type	__func__.19890, %object
	.size	__func__.19890, 29
__func__.19890:
	.ascii	"VCTRL_GetSendStreamAgainFlag\000"
	.space	3
	.type	__func__.19900, %object
	.size	__func__.19900, 20
__func__.19900:
	.ascii	"VCTRL_GetStreamSize\000"
	.type	__func__.19907, %object
	.size	__func__.19907, 20
__func__.19907:
	.ascii	"VCTRL_CheckFreshRaw\000"
	.type	__func__.19914, %object
	.size	__func__.19914, 20
__func__.19914:
	.ascii	"VCTRL_CheckFreshSeg\000"
	.type	__func__.19919, %object
	.size	__func__.19919, 25
__func__.19919:
	.ascii	"VCTRL_SetDiscardPicParam\000"
	.space	3
	.type	__FUNCTION__.19947, %object
	.size	__FUNCTION__.19947, 29
__FUNCTION__.19947:
	.ascii	"VCTRL_PartitionMemForStdUser\000"
	.space	3
	.type	__func__.19962, %object
	.size	__func__.19962, 21
__func__.19962:
	.ascii	"DelAllFrameMemRecord\000"
	.space	3
	.type	__func__.19972, %object
	.size	__func__.19972, 23
__func__.19972:
	.ascii	"VCTRL_FreeChanResource\000"
	.space	1
	.type	__func__.20154, %object
	.size	__func__.20154, 17
__func__.20154:
	.ascii	"VCTRL_GetChanCfg\000"
	.space	3
	.type	__func__.20215, %object
	.size	__func__.20215, 14
__func__.20215:
	.ascii	"VCTRL_SeekPts\000"
	.space	2
	.type	__func__.20248, %object
	.size	__func__.20248, 20
__func__.20248:
	.ascii	"VCTRL_ReleaseStream\000"
	.type	__func__.20268, %object
	.size	__func__.20268, 24
__func__.20268:
	.ascii	"VCTRL_ImageOutputEnable\000"
	.type	__func__.20307, %object
	.size	__func__.20307, 25
__func__.20307:
	.ascii	"VCTRL_TryToRelSpecialFrm\000"
	.space	3
	.type	__func__.20331, %object
	.size	__func__.20331, 19
__func__.20331:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.20339, %object
	.size	__FUNCTION__.20339, 19
__FUNCTION__.20339:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__func__.20346, %object
	.size	__func__.20346, 23
__func__.20346:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.20350, %object
	.size	__FUNCTION__.20350, 23
__FUNCTION__.20350:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.20358, %object
	.size	__func__.20358, 23
__func__.20358:
	.ascii	"VCTRL_GetHDRConfigInfo\000"
	.space	1
	.type	__func__.20385, %object
	.size	__func__.20385, 18
__func__.20385:
	.ascii	"VCTRL_GetDecParam\000"
	.space	2
	.type	__func__.20476, %object
	.size	__func__.20476, 20
__func__.20476:
	.ascii	"VCTRL_ClearDecparam\000"
	.type	__func__.20506, %object
	.size	__func__.20506, 21
__func__.20506:
	.ascii	"VCTRL_VdmProcSedOnly\000"
	.space	3
	.type	__func__.20516, %object
	.size	__func__.20516, 21
__func__.20516:
	.ascii	"VCTRL_GetImageBuffer\000"
	.space	3
	.type	__func__.20540, %object
	.size	__func__.20540, 22
__func__.20540:
	.ascii	"VCTRL_ConfigFFFBSpeed\000"
	.space	2
	.type	__func__.20545, %object
	.size	__func__.20545, 20
__func__.20545:
	.ascii	"VCTRL_ConfigPVRInfo\000"
	.type	__func__.20549, %object
	.size	__func__.20549, 19
__func__.20549:
	.ascii	"VCTRL_IsChanActive\000"
	.space	1
	.type	__func__.20555, %object
	.size	__func__.20555, 13
__func__.20555:
	.ascii	"USERDEC_Init\000"
	.space	3
	.type	__func__.20574, %object
	.size	__func__.20574, 21
__func__.20574:
	.ascii	"VCTRL_GetUsrdecFrame\000"
	.space	3
	.type	__func__.20584, %object
	.size	__func__.20584, 14
__func__.20584:
	.ascii	"InitSyntaxCtx\000"
	.space	2
	.type	__func__.20640, %object
	.size	__func__.20640, 12
__func__.20640:
	.ascii	"OpenDrivers\000"
	.type	__func__.19850, %object
	.size	__func__.19850, 15
__func__.19850:
	.ascii	"VCTRL_OpenVfmw\000"
	.space	1
	.type	__FUNCTION__.20780, %object
	.size	__FUNCTION__.20780, 18
__FUNCTION__.20780:
	.ascii	"GetExtraRefFrmNum\000"
	.space	2
	.type	__FUNCTION__.20786, %object
	.size	__FUNCTION__.20786, 19
__FUNCTION__.20786:
	.ascii	"GetExtraDispFrmNum\000"
	.space	1
	.type	__FUNCTION__.20792, %object
	.size	__FUNCTION__.20792, 16
__FUNCTION__.20792:
	.ascii	"GetExtraCtrlCmd\000"
	.type	__func__.20725, %object
	.size	__func__.20725, 14
__func__.20725:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__FUNCTION__.20726, %object
	.size	__FUNCTION__.20726, 14
__FUNCTION__.20726:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__func__.20257, %object
	.size	__func__.20257, 24
__func__.20257:
	.ascii	"VCTRL_FindOccupiedFrame\000"
	.type	__func__.20278, %object
	.size	__func__.20278, 26
__func__.20278:
	.ascii	"VCTRL_ReportOccupiedFrame\000"
	.space	2
	.type	__func__.20757, %object
	.size	__func__.20757, 20
__func__.20757:
	.ascii	"VCTRL_GetChanImgNum\000"
	.type	__func__.19930, %object
	.size	__func__.19930, 19
__func__.19930:
	.ascii	"VCTRL_GetChanState\000"
	.space	1
	.type	__func__.20761, %object
	.size	__func__.20761, 19
__func__.20761:
	.ascii	"VCTRL_GetChanWidth\000"
	.space	1
	.type	__func__.20765, %object
	.size	__func__.20765, 20
__func__.20765:
	.ascii	"VCTRL_GetChanHeight\000"
	.type	__func__.20769, %object
	.size	__func__.20769, 22
__func__.20769:
	.ascii	"VCTRL_GetChanCapLevel\000"
	.space	2
	.type	g_ProcCommandTable, %object
	.size	g_ProcCommandTable, 360
g_ProcCommandTable:
	.word	0
	.word	VfmwProc_SetPrintLevel
	.word	2
	.word	VfmwProc_SetErrorThread
	.word	3
	.word	VfmwProc_SetDefaultOutputOrder
	.word	4
	.word	VfmwProc_SetDecOrderOutput
	.word	5
	.word	VfmwProc_SetDecMode
	.word	7
	.word	VfmwProc_SetDropStreamThread
	.word	8
	.word	VfmwProc_SetVp9DecFrameNum
	.word	9
	.word	VfmwProc_SetUvmosEnable
	.word	11
	.word	VfmwProc_SetUSE_FF_APT_EN
	.word	12
	.word	VfmwProc_SetSaveFileAfterReset
	.word	13
	.word	VfmwProc_SetCurProcChan
	.word	256
	.word	VfmwProc_PrintTracer
	.word	257
	.word	VfmwProc_SetScdPrint
	.word	512
	.word	VfmwProc_Savestream
	.word	513
	.word	VfmwProc_SaveSeg
	.word	514
	.word	VfmwProc_SaveYUV
	.word	516
	.word	VfmwProc_Save1DYUV
	.word	528
	.word	VfmwProc_SaveMetadata
	.word	544
	.word	VfmwProc_SaveReorderMetadata
	.word	560
	.word	VfmwProc_SaveEL
	.word	768
	.word	VfmwProc_TestSuspend
	.word	769
	.word	VfmwProc_TestResume
	.word	896
	.word	VfmwProc_TestStopChan
	.word	897
	.word	VfmwProc_TestResetChan
	.word	898
	.word	VfmwProc_TestStartChan
	.word	899
	.word	VfmwProc_TestRestartChan
	.word	1024
	.word	VfmwProc_TestTimeSequence
	.word	1026
	.word	VfmwProc_TestStopDec
	.word	1280
	.word	VfmwProc_SetTraceCtrl
	.word	1281
	.word	VfmwProc_SetTraceBSPeriod
	.word	1282
	.word	VfmwProc_SetTraceFramePeriod
	.word	1283
	.word	VfmwProc_SetTraceImgPeriod
	.word	1285
	.word	VfmwProc_SetSaveYuvBitWidth
	.word	1536
	.word	VfmwProc_OpenModuleLowly
	.word	1537
	.word	VfmwProc_CloseModuleLowly
	.word	1538
	.word	VfmwProc_SetTunnelLineNumber
	.word	1539
	.word	VfmwProc_OpenScdLowdly
	.word	1540
	.word	VfmwProc_CloseScdLowdly
	.word	1541
	.word	VfmwProc_SetSedOnlyEnable
	.word	1792
	.word	VfmwProc_SetSmmuIrqEnable
	.word	2048
	.word	VfmwProc_SetCompressPara
	.word	2304
	.word	VfmwProc_SetClkSelect
	.word	2305
	.word	VfmwProc_SetStandardObedience
	.word	2306
	.word	VfmwProc_SetSegBypass
	.word	65535
	.word	0
	.type	__func__.21065, %object
	.size	__func__.21065, 22
__func__.21065:
	.ascii	"VCTRL_OutputLastFrame\000"
	.space	2
	.type	__func__.20450, %object
	.size	__func__.20450, 15
__func__.20450:
	.ascii	"VCTRL_PostProc\000"
	.space	1
	.type	__func__.20501, %object
	.size	__func__.20501, 18
__func__.20501:
	.ascii	"VCTRL_VdmPostProc\000"
	.space	2
	.type	__func__.21092, %object
	.size	__func__.21092, 21
__func__.21092:
	.ascii	"VCTRL_SvdecLastFrame\000"
	.space	3
	.type	__func__.20580, %object
	.size	__func__.20580, 21
__func__.20580:
	.ascii	"VCTRL_PutUsrdecFrame\000"
	.space	3
	.type	__func__.20133, %object
	.size	__func__.20133, 16
__func__.20133:
	.ascii	"VCTRL_StartChan\000"
	.type	__func__.20149, %object
	.size	__func__.20149, 15
__func__.20149:
	.ascii	"VCTRL_StopChan\000"
	.space	1
	.type	__func__.20242, %object
	.size	__func__.20242, 26
__func__.20242:
	.ascii	"VCTRL_ResetChanWithOption\000"
	.space	2
	.type	__func__.20321, %object
	.size	__func__.20321, 16
__func__.20321:
	.ascii	"VCTRL_ResetChan\000"
	.type	__func__.20039, %object
	.size	__func__.20039, 18
__func__.20039:
	.ascii	"VCTRL_AllocHalMem\000"
	.space	2
	.type	__func__.20115, %object
	.size	__func__.20115, 17
__func__.20115:
	.ascii	"VCTRL_CreateChan\000"
	.space	3
	.type	__func__.19996, %object
	.size	__func__.19996, 18
__func__.19996:
	.ascii	"VCTRL_AllocSCDMem\000"
	.space	2
	.type	__func__.20200, %object
	.size	__func__.20200, 17
__func__.20200:
	.ascii	"VCTRL_ConfigChan\000"
	.space	3
	.type	__func__.20127, %object
	.size	__func__.20127, 18
__func__.20127:
	.ascii	"VCTRL_DestroyChan\000"
	.space	2
	.type	__func__.21187, %object
	.size	__func__.21187, 30
__func__.21187:
	.ascii	"VCTRL_SetSingleFrameBufToChan\000"
	.space	2
	.type	__func__.21199, %object
	.size	__func__.21199, 24
__func__.21199:
	.ascii	"VCTRL_AllocMemToDecoder\000"
	.data
	.align	2
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
	.space	59
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s %d: %s\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"InstID out of range\000" )
.LC2:
	ASCII(.ascii	"Chan inactive\000" )
	.space	2
.LC3:
	ASCII(.ascii	"s_VfmwCTrl.event_report_vdec = NULL\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"s_VfmwCTrl.event_report_omxvdec = NULL\012\000" )
.LC5:
	ASCII(.ascii	"%s Unkown Adapter Type: %d, Len: %d\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"Set standard obedience: %d\012\000" )
.LC7:
	ASCII(.ascii	"g_ClkSelect(%d) set error! dat = %d not support\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC8:
	ASCII(.ascii	"ChanID: %d, VcmpEn: %d, LossCmpEN: %d, YRatio: 0.%d" )
	ASCII(.ascii	", UVRatio: 0.%d\012\000" )
.LC9:
	ASCII(.ascii	"ChanID: %d, VcmpEn: %d, LossCmpEN: %d\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"ChanID:%d, Compress Disable!\000" )
	.space	3
.LC11:
	ASCII(.ascii	"ChanID:%d; \000" )
.LC12:
	ASCII(.ascii	"VCmpEnable:%d; \000" )
.LC13:
	ASCII(.ascii	"LossCmpEnable:%d; \000" )
	.space	1
.LC14:
	ASCII(.ascii	"YCmpRatio:%d, YCmpRatio:%d\012\000" )
.LC15:
	ASCII(.ascii	"ChanID %d Already Create! Can not be set!!\012\000" )
.LC16:
	ASCII(.ascii	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleL" )
	ASCII(.ascii	"owlyEnable = 1 ------\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"ERROR: g_SaveYUVBitWidth should be 8 or 10! (not to" )
	ASCII(.ascii	" be %d)\012\000" )
.LC18:
	ASCII(.ascii	"------ g_SaveYUVBitWidth = %d ------\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"------ g_TraceImgPeriod = %x ------\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"------ g_TraceFramePeriod = %x ------\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"------ g_TraceBsPeriod = %x ------\012\000" )
.LC22:
	ASCII(.ascii	"------ g_TraceCtrl = %x ------\012\000" )
.LC23:
	ASCII(.ascii	"------ dec stop = %d ------\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"------ dec task delay %d ms ------\012\000" )
.LC25:
	ASCII(.ascii	"%s/vfmw_el_save_%d.dat\000" )
	.space	1
.LC26:
	ASCII(.ascii	"OK create file '%s' for channel %d el stream save\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC27:
	ASCII(.ascii	"failed create file '%s' for el stream save!\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	">>>> close el stream saving >>>>\012\000" )
	.space	2
.LC29:
	ASCII(.ascii	"NO SUCH CHANNEL : %d\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"Pay attention to  CHANNEL : %d\012\000" )
.LC31:
	ASCII(.ascii	"ResetCreateNewSave = %d\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"ResetCreateNewSave can NOT be set to %d, must be 0 " )
	ASCII(.ascii	"or 1\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"USE_FF_APT_EN = %d\012\000" )
.LC34:
	ASCII(.ascii	"USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\012" )
	ASCII(.ascii	"\000" )
.LC35:
	ASCII(.ascii	"g_CfgVp9FrmNum = %d\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"Invalid output order %d\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"set default output order %d\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"OK create file '%s' for channel %d metadata_reorder" )
	ASCII(.ascii	" stream save\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"failed create file '%s' for metadata_reorder stream" )
	ASCII(.ascii	" save!\012\000" )
	.space	1
.LC40:
	ASCII(.ascii	">>>> close metadata stream saving >>>>\012\000" )
.LC41:
	ASCII(.ascii	"OK create file '%s' for channel %d metadata stream " )
	ASCII(.ascii	"save\012\000" )
	.space	3
.LC42:
	ASCII(.ascii	"failed create file '%s' for metadata stream save!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC43:
	ASCII(.ascii	"address '0x%x' is not valid!\012\000" )
	.space	2
.LC44:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC45:
	ASCII(.ascii	"1d image has been saved to '%s'\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"open file '%s' fail!\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"OK create file '%s' for channel %d seg stream save\012" )
	ASCII(.ascii	"\000" )
.LC48:
	ASCII(.ascii	"failed create file '%s' for seg stream save!\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	">>>> close seg stream saving >>>>\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"OK create file '%s' for channel %d raw stream save\012" )
	ASCII(.ascii	"\000" )
.LC51:
	ASCII(.ascii	"failed create file '%s' for raw stream save!\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	">>>> close raw stream saving >>>>\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"Failed to alloc VFMW_DumpImageTmp size %d!\012\000" )
.LC54:
	ASCII(.ascii	"OK create file '%s' for chan %d yuv save.(crop %d)\012" )
	ASCII(.ascii	"\000" )
.LC55:
	ASCII(.ascii	"failed create file '%s' for yuv save!\012\000" )
	.space	1
.LC56:
	ASCII(.ascii	"OK close yuv save.\012\000" )
.LC57:
	ASCII(.ascii	"print memory tracer...\012\000" )
.LC58:
	ASCII(.ascii	"Disable seg bypass.\012\000" )
	.space	3
.LC59:
	ASCII(.ascii	"Enable seg bypass.\012\000" )
.LC60:
	ASCII(.ascii	"unmask vfmw mmu err int!\012\000" )
	.space	2
.LC61:
	ASCII(.ascii	"mask vfmw mmu err int!\012\000" )
.LC62:
	ASCII(.ascii	"Disable SedOnly Func\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"Enable SedOnly Func\012\000" )
	.space	3
.LC64:
	ASCII(.ascii	"The channel number is to Large.\012\000" )
	.space	3
.LC65:
	ASCII(.ascii	"ChanID out of range\000" )
.LC66:
	ASCII(.ascii	"Force vdm %d sleep.\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"Vfmw suspend totally take %d ms\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSlee" )
	ASCII(.ascii	"p=%d)!\012\000" )
	.space	1
.LC69:
	ASCII(.ascii	"Force scd %d sleep.\012\000" )
	.space	3
.LC70:
	ASCII(.ascii	"proc cmd need no param:%p\012\000" )
	.space	1
.LC71:
	ASCII(.ascii	"Vfmw resume totally take %d ms\012\000" )
.LC72:
	ASCII(.ascii	"%s,%d,pos(%d) error!\012\000" )
	.space	2
.LC73:
	ASCII(.ascii	"%s, %d, pos(%d) error!\012\000" )
.LC74:
	ASCII(.ascii	"can NOT config a not-opened Chan\000" )
	.space	3
.LC75:
	ASCII(.ascii	"event_report null!\000" )
	.space	1
.LC76:
	ASCII(.ascii	"%s Unkown Adapter Type: %d\012\000" )
.LC77:
	ASCII(.ascii	"pstStreamParam is NULL\000" )
	.space	1
.LC78:
	ASCII(.ascii	"ChanID invalid\000" )
	.space	1
.LC79:
	ASCII(.ascii	"L: %d, Stream Interface Error!!, ChanID: %d\012\000" )
	.space	3
.LC80:
	ASCII(.ascii	"This Chan has not been created!!!\000" )
	.space	2
.LC81:
	ASCII(.ascii	"can NOT get a not-opened Chan's information of bits" )
	ASCII(.ascii	"tream\000" )
	.space	3
.LC82:
	ASCII(.ascii	"Raw FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC83:
	ASCII(.ascii	"Seg FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC84:
	ASCII(.ascii	"pArgs is null\000" )
	.space	2
.LC85:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC86:
	ASCII(.ascii	"no mem to arrange for soft dec\012\000" )
.LC87:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC88:
	ASCII(.ascii	"%s: L%d : vdm chan memory is too small to support u" )
	ASCII(.ascii	"ser decoder\012\000" )
.LC89:
	ASCII(.ascii	"FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC90:
	ASCII(.ascii	"parameter err, null pointer!!!\000" )
	.space	1
.LC91:
	ASCII(.ascii	"%s FATAL: pstChan = NULL!\012\000" )
	.space	1
.LC92:
	ASCII(.ascii	"%s FATAL: pChanMem_vdh = NULL!\012\000" )
.LC93:
	ASCII(.ascii	"%s FATAL: pChanMem_frm = NULL!\012\000" )
.LC94:
	ASCII(.ascii	"DelAllFrameMemRecord err in VCTRL_FreeChanResource " )
	ASCII(.ascii	"!\012\000" )
	.space	2
.LC95:
	ASCII(.ascii	"%s FATAL: pChanMem_scd = NULL!\012\000" )
.LC96:
	ASCII(.ascii	"%s FATAL: pChanMem_hal = NULL!\012\000" )
.LC97:
	ASCII(.ascii	"%s FATAL: pChanMem_ctx = NULL!\012\000" )
.LC98:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC99:
	ASCII(.ascii	"Chip not support beyond %dx%d when Std != H264/VP8/" )
	ASCII(.ascii	"MVC/USER.\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC101:
	ASCII(.ascii	"s_pstVfmwChan = NULL\000" )
	.space	3
.LC102:
	ASCII(.ascii	"%s,%d,s_pstVfmwChan[chanID]->FspInst.stDecFsRec[i]." )
	ASCII(.ascii	"PhyFS.PhyAddr = 0x%x\012\000" )
	.space	3
.LC103:
	ASCII(.ascii	"%s,%d,can't find special frame match DecFs Num = %d" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC104:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC105:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC106:
	ASCII(.ascii	"This channel %d is not opened!\012\000" )
.LC107:
	ASCII(.ascii	"%s cannot output!\012\000" )
	.space	1
.LC108:
	ASCII(.ascii	"%s: view_0 id(%d) > view_1 id(%d), error!\012\000" )
	.space	1
.LC109:
	ASCII(.ascii	"%s: continuous view0 id(%d)!\012\000" )
	.space	2
.LC110:
	ASCII(.ascii	"%s: continuous view1 id(%d)!\012\000" )
	.space	2
.LC111:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC112:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC113:
	ASCII(.ascii	"vdm_ctrl.c,L%d: VCTRL_TryToRelSpecialFrm success!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC114:
	ASCII(.ascii	"%s call SYNTAX_ReleaseImage failed\012\000" )
.LC115:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC116:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC117:
	ASCII(.ascii	"pstHDRInput = null\000" )
	.space	1
.LC118:
	ASCII(.ascii	"%s VidStd=%d Error!\012\000" )
	.space	3
.LC119:
	ASCII(.ascii	"Get DecParam Type Failure!\012\000" )
.LC120:
	ASCII(.ascii	"ChanId invalid!\000" )
.LC121:
	ASCII(.ascii	"ChanId out of range\000" )
.LC122:
	ASCII(.ascii	"This channel is not running\000" )
.LC123:
	ASCII(.ascii	"chan not create\000" )
.LC124:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC125:
	ASCII(.ascii	"NULL == pArgs\000" )
	.space	2
.LC126:
	ASCII(.ascii	"%s param invalid!\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err!\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but VFMW_USER != s_pstVfmwChan" )
	ASCII(.ascii	"[ChanID]->eVidStd!\012\000" )
	.space	1
.LC129:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but s_pstVfmwChan[ChanID]->s32" )
	ASCII(.ascii	"UsrdecFrameNum < MIN_USERDEC_FRAME_NUM!\012\000" )
.LC130:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC131:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC132:
	ASCII(.ascii	"line: %d, pLf is NULL!\012\000" )
.LC133:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC134:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame get LogicFs fail!\012\000" )
.LC135:
	ASCII(.ascii	"CAP_LEVEL_USER_DEFINE_WITH_OPTION option is illegal" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC136:
	ASCII(.ascii	"VCTRL_GetChanMemSizeByOption L%d: arrange return fa" )
	ASCII(.ascii	"ilure\012\000" )
	.space	2
.LC137:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), extra_ref(%d), s32Dis" )
	ASCII(.ascii	"playFrameNum(%d), extra_disp(%d)\012\000" )
	.space	3
.LC138:
	ASCII(.ascii	"MEM_MapRegisterAddr reg 0x%x failed!\012\000" )
	.space	2
.LC139:
	ASCII(.ascii	"%s alloc dsp mem size %d failed!\012\000" )
	.space	2
.LC140:
	ASCII(.ascii	"Register irq %d failed!\012\000" )
	.space	3
.LC141:
	ASCII(.ascii	"HEVCDEC_AllocHevcGlbMem Error!\012\000" )
.LC142:
	ASCII(.ascii	"pArgs = NULL\000" )
	.space	3
.LC143:
	ASCII(.ascii	"extra_ref=\000" )
	.space	1
.LC144:
	ASCII(.ascii	"=\000" )
	.space	2
.LC145:
	ASCII(.ascii	" \000" )
	.space	2
.LC146:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC147:
	ASCII(.ascii	"ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC148:
	ASCII(.ascii	"extra_disp=\000" )
.LC149:
	ASCII(.ascii	"ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC150:
	ASCII(.ascii	"extra_cmd=\000" )
	.space	1
.LC151:
	ASCII(.ascii	"HI_VFMW_VideoDecode\000" )
.LC152:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC153:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC154:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC155:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC156:
	ASCII(.ascii	"pic_pts: %lld\012\000" )
	.space	1
.LC157:
	ASCII(.ascii	"pic_usertag: %lld\012\000" )
	.space	1
.LC158:
	ASCII(.ascii	"pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC159:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC160:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC161:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC162:
	ASCII(.ascii	"DFS, Wait Partition\012\000" )
	.space	3
.LC163:
	ASCII(.ascii	"DFS, Partition fail, u32DynamicFrameStoreAllocEn: %" )
	ASCII(.ascii	"d, eFspPartitionState: %d\012\000" )
	.space	2
.LC164:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC165:
	ASCII(.ascii	"seg_pts: %lld, seg_usertag = %lld\012\000" )
	.space	1
.LC166:
	ASCII(.ascii	"Thread running...\012\000" )
	.space	1
.LC167:
	ASCII(.ascii	"Thread stopped!\012\000" )
	.space	3
.LC168:
	ASCII(.ascii	"thread running...\012\000" )
	.space	1
.LC169:
	ASCII(.ascii	"thread stopped...\012\000" )
	.space	1
.LC170:
	ASCII(.ascii	"Thread killed!\012\000" )
.LC171:
	ASCII(.ascii	"ERROR:ReadNum = %d larger than VFMW_MAX_RESERVE_NUM" )
	ASCII(.ascii	"(%d)\012\000" )
	.space	3
.LC172:
	ASCII(.ascii	"The array of occupied frames is overflow, s_pstVfmw" )
	ASCII(.ascii	"Chan[%d]->specialFrameNum = %d\000" )
	.space	2
.LC173:
	ASCII(.ascii	"pSpecialFrmInfo = null!!!\000" )
	.space	2
.LC174:
	ASCII(.ascii	"pRefImgNum  = null\000" )
	.space	1
.LC175:
	ASCII(.ascii	"pReadImgNum = null\000" )
	.space	1
.LC176:
	ASCII(.ascii	"pNewImgNum  = null\000" )
	.space	1
.LC177:
	ASCII(.ascii	"pstChanState = NULL\000" )
.LC178:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_ref = %d is out of [ -500" )
	ASCII(.ascii	"0, 5000 ]!\012\000" )
	.space	1
.LC179:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_disp = %d is out of [ -50" )
	ASCII(.ascii	"00, 5000 ]!\012\000" )
.LC180:
	ASCII(.ascii	"Command \"%d\" not registerd!\012\000" )
	.space	3
.LC181:
	ASCII(.ascii	"Chan %d Report Last Frame, Value=%d, LastFrameState" )
	ASCII(.ascii	"=%d\012\000" )
.LC182:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC183:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC184:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC185:
	ASCII(.ascii	"line %d can not know YuvFormat = %d\012\000" )
	.space	3
.LC186:
	ASCII(.ascii	"userdec frame(phy=%#x) address error!\012\000" )
	.space	1
.LC187:
	ASCII(.ascii	"can not map vir addr for usrdat frame(cbphy=%#x)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC188:
	ASCII(.ascii	"line: %d, pLogic is Null!\012\000" )
	.space	1
.LC189:
	ASCII(.ascii	"eYuvFormat %d is not support!!\012\000" )
.LC190:
	ASCII(.ascii	"pUsrdecFrame == NULL\000" )
	.space	3
.LC191:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame: VidStd is %d\012\000" )
.LC192:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame return err\012\000" )
	.space	3
.LC193:
	ASCII(.ascii	"L:%d ChanID out of range\012\000" )
	.space	2
.LC194:
	ASCII(.ascii	"L:%d This Chan has not been created!!!\012\000" )
.LC195:
	ASCII(.ascii	"L:%d WARNING: vidio std not setted!\012\000" )
	.space	3
.LC196:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC197:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC198:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC199:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC200:
	ASCII(.ascii	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\012\000" )
	.space	2
.LC201:
	ASCII(.ascii	"---------------------------------------------------" )
	ASCII(.ascii	"----------------------\012\000" )
	.space	1
.LC202:
	ASCII(.ascii	"Param Invalid of PChanOption is NULL\012\000" )
	.space	2
.LC203:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSize failed!\012\000" )
	.space	2
.LC204:
	ASCII(.ascii	"ChanID: %d is out of range!\012\000" )
	.space	3
.LC205:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT create m" )
	ASCII(.ascii	"ore channels\012\000" )
	.space	3
.LC206:
	ASCII(.ascii	"%s get Vdh %d hal mem size failed!\012\000" )
.LC207:
	ASCII(.ascii	"%s alloc Vdh %d hal mem size %d failed!\012\000" )
	.space	3
.LC208:
	ASCII(.ascii	"VDMHAL_OpenHAL Vdh %d failed!\012\000" )
	.space	1
.LC209:
	ASCII(.ascii	"%s alloc vdh %d vp9 prob mem size %d failed!\012\000" )
	.space	2
.LC210:
	ASCII(.ascii	"%s alloc Scd %d hal mem size %d failed!\012\000" )
	.space	3
.LC211:
	ASCII(.ascii	"%s open Scd %d drv failed!\012\000" )
.LC212:
	ASCII(.ascii	"%s alloc hal mem failed!\012\000" )
	.space	2
.LC213:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC214:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC215:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC216:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC217:
	ASCII(.ascii	"%s :%d Alloc failed ScdDetailMem:%d\012\000" )
	.space	3
.LC218:
	ASCII(.ascii	"%s allc chan scd failed!\012\000" )
	.space	2
.LC219:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel Hal Mem\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC220:
	ASCII(.ascii	"%s alloc mem for vfmw failed!\012\000" )
	.space	1
.LC221:
	ASCII(.ascii	"Chan:%d can NOT enable FSP instance\012\000" )
	.space	3
.LC222:
	ASCII(.ascii	"pstCfg = NULL\000" )
	.space	2
.LC223:
	ASCII(.ascii	"VCTRL_CheckChanWH return err.\012\000" )
	.space	1
.LC224:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC225:
	ASCII(.ascii	"VCTRL_ConfigChan with same config paramater.\012\000" )
	.space	2
.LC226:
	ASCII(.ascii	"can NOT VCTRL_PartitionMemForStdUser\012\000" )
	.space	2
.LC227:
	ASCII(.ascii	"chan %d: new UvmosEnable = %d\012\000" )
	.space	1
.LC228:
	ASCII(.ascii	"chan %d: SetUvmosEnable failed!\012\000" )
	.space	3
.LC229:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC230:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC231:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC232:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC233:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC234:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC235:
	ASCII(.ascii	"%s:L%d: %s\012\000" )
.LC236:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC237:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC238:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC239:
	ASCII(.ascii	"WARNNING: dsp in lowdelay state, we can not support" )
	ASCII(.ascii	"ed  avs in the same time!!!\012\000" )
.LC240:
	ASCII(.ascii	"WARNNING: dsp in avs state, we can not supported  l" )
	ASCII(.ascii	"owdelay in the same time!!!\012\000" )
.LC241:
	ASCII(.ascii	"%s, %d, actul size = 0x%x, except size= 0x%x\012\000" )
	.space	2
.LC242:
	ASCII(.ascii	"%s, %d, CfgFrameNum = %x, PmvNodeStatus= 0x%x\012\000" )
	.space	1
.LC243:
	ASCII(.ascii	"%s: Chan %d set single frame failed!\012\000" )
	.space	2
.LC244:
	ASCII(.ascii	"%s: Chan %d no frame buffer store!\012\000" )
.LC245:
	ASCII(.ascii	"DFS, request frame store fail!, chanid: %d\012\000" )
.LC246:
	ASCII(.ascii	"DFS, set decoding thread state to success!\012 \000" )
	.space	3
.LC247:
	ASCII(.ascii	"%s set chan %d ctrl state CHAN_FRAME_STORE_ALLOC fa" )
	ASCII(.ascii	"iled!\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
.LANCHOR3 = . + 8184
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 128
s_pstVfmwChan:
	.space	128
	.type	s_VfmwCTrl, %object
	.size	s_VfmwCTrl, 260
s_VfmwCTrl:
	.space	260
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.space	4
	.type	g_VfmwCompressPara, %object
	.size	g_VfmwCompressPara, 512
g_VfmwCompressPara:
	.space	512
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.space	4
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.space	4
	.type	vfmw_save_el_file, %object
	.size	vfmw_save_el_file, 128
vfmw_save_el_file:
	.space	128
	.type	save_file_cnt.20928, %object
	.size	save_file_cnt.20928, 4
save_file_cnt.20928:
	.space	4
	.type	save_el_chan_num, %object
	.size	save_el_chan_num, 4
save_el_chan_num:
	.space	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.space	4
	.type	g_ResetCreateNewSave, %object
	.size	g_ResetCreateNewSave, 4
g_ResetCreateNewSave:
	.space	4
	.type	vfmw_save_metadata_reorder_file, %object
	.size	vfmw_save_metadata_reorder_file, 128
vfmw_save_metadata_reorder_file:
	.space	128
	.type	save_file_cnt.20922, %object
	.size	save_file_cnt.20922, 4
save_file_cnt.20922:
	.space	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.space	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 128
vfmw_save_metadata_file:
	.space	128
	.type	save_file_cnt.20916, %object
	.size	save_file_cnt.20916, 4
save_file_cnt.20916:
	.space	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.space	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 128
vfmw_save_seg_file:
	.space	128
	.type	save_file_cnt.20894, %object
	.size	save_file_cnt.20894, 4
save_file_cnt.20894:
	.space	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.space	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 128
vfmw_save_str_file:
	.space	128
	.type	save_file_cnt.20888, %object
	.size	save_file_cnt.20888, 4
save_file_cnt.20888:
	.space	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.space	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 128
vfmw_save_yuv_file:
	.space	128
	.type	save_file_cnt.20901, %object
	.size	save_file_cnt.20901, 4
save_file_cnt.20901:
	.space	4
	.type	MemRecord_YUV, %object
	.size	MemRecord_YUV, 24
MemRecord_YUV:
	.space	24
	.type	pVl, %object
	.size	pVl, 4
pVl:
	.space	4
	.type	pUl, %object
	.size	pUl, 4
pUl:
	.space	4
	.type	pY, %object
	.size	pY, 4
pY:
	.space	4
	.type	pVl_2bit, %object
	.size	pVl_2bit, 4
pVl_2bit:
	.space	4
	.type	pUl_2bit, %object
	.size	pUl_2bit, 4
pUl_2bit:
	.space	4
	.type	pY_2bit, %object
	.size	pY_2bit, 4
pY_2bit:
	.space	4
	.type	save_yuv_with_crop, %object
	.size	save_yuv_with_crop, 4
save_yuv_with_crop:
	.space	4
	.type	pPixelArray, %object
	.size	pPixelArray, 4
pPixelArray:
	.space	4
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.space	1
	.space	3
	.type	s_StreamIntf, %object
	.size	s_StreamIntf, 384
s_StreamIntf:
	.space	384
	.type	FspInstInfo.19943, %object
	.size	FspInstInfo.19943, 2952
FspInstInfo.19943:
	.space	2952
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.space	4
	.type	last_rec_pos_time.20336, %object
	.size	last_rec_pos_time.20336, 128
last_rec_pos_time.20336:
	.space	128
	.type	last_rec_pos_time.20347, %object
	.size	last_rec_pos_time.20347, 128
last_rec_pos_time.20347:
	.space	128
	.type	MemArrange.20615, %object
	.size	MemArrange.20615, 1232
MemArrange.20615:
	.space	1232
	.type	extra_ref, %object
	.size	extra_ref, 4
extra_ref:
	.space	4
	.type	extra_disp, %object
	.size	extra_disp, 4
extra_disp:
	.space	4
	.type	g_VfmwIrqHandle, %object
	.size	g_VfmwIrqHandle, 4
g_VfmwIrqHandle:
	.space	4
	.type	cmdline, %object
	.size	cmdline, 1024
cmdline:
	.space	1024
	.type	extra_cmd, %object
	.size	extra_cmd, 4
extra_cmd:
	.space	4
	.type	g_allow_B_before_P, %object
	.size	g_allow_B_before_P, 1
g_allow_B_before_P:
	.space	1
	.type	g_not_allow_H264FullPictureRepair_flag, %object
	.size	g_not_allow_H264FullPictureRepair_flag, 1
g_not_allow_H264FullPictureRepair_flag:
	.space	1
	.type	g_apple_airplay_mirrorinig_flag, %object
	.size	g_apple_airplay_mirrorinig_flag, 1
g_apple_airplay_mirrorinig_flag:
	.space	1
	.space	1
	.type	g_event_report, %object
	.size	g_event_report, 4
g_event_report:
	.space	4
	.type	g_DSPState, %object
	.size	g_DSPState, 128
g_DSPState:
	.space	128
	.type	last_rec_pos_time.20720, %object
	.size	last_rec_pos_time.20720, 128
last_rec_pos_time.20720:
	.space	128
	.type	last_rec_pos_decparam_time.20721, %object
	.size	last_rec_pos_decparam_time.20721, 128
last_rec_pos_decparam_time.20721:
	.space	128
	.type	ChanPriTab.20670, %object
	.size	ChanPriTab.20670, 128
ChanPriTab.20670:
	.space	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 2304
g_VfmwChanStat:
	.space	2304
	.type	PrioArray.20132, %object
	.size	PrioArray.20132, 128
PrioArray.20132:
	.space	128
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.space	128
	.type	Capability.20196, %object
	.size	Capability.20196, 148
Capability.20196:
	.space	148
	.type	PrioArray.20195, %object
	.size	PrioArray.20195, 128
PrioArray.20195:
	.space	128
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 128
g_EsBufValidFlag:
	.space	128
	.type	g_eVdmVersion, %object
	.size	g_eVdmVersion, 4
g_eVdmVersion:
	.space	4
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 64
g_VfmwGlobalStat:
	.space	64
	.type	AcceleratorCharacter, %object
	.size	AcceleratorCharacter, 4
AcceleratorCharacter:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
