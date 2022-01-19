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
	addne	r3, r0, #290816
	movne	r0, #0
	strne	r1, [r3, #1460]
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
	addne	r0, r0, #290816
	ldrne	r0, [r0, #1460]
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
	movweq	r3, #63096
	movwne	r3, #14824
	movteq	r3, 177
	movtne	r3, 12
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #31
	mov	r4, r0
	bhi	.L725
	ldr	r5, .L730
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L726
	add	r3, r0, #294912
	ldr	ip, [r3, #1480]
	cmp	ip, #0
	beq	.L694
	ldr	r3, [r3, #956]
	cmp	r1, r3
	movne	r2, #0
	bne	.L697
	b	.L727
.L700:
	add	r3, r3, #956
	ldr	r3, [r0, r3]
	cmp	r1, r3
	beq	.L695
.L697:
	add	r2, r2, #1
	cmp	r2, ip
	mov	r3, r2, asl #4
	mov	r6, r2
	add	r3, r3, #294912
	bne	.L700
.L694:
	mvn	r0, #0
.L718:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L727:
	mov	r6, #0
.L695:
	add	r3, r0, #282624
	ldr	r3, [r3, #3488]
	cmp	r3, r1
	movwne	r3, #24060
	movne	r7, #1
	movtne	r3, 4
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
	sub	r8, ip, #1
	ldr	r3, [r9, #12]
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #92
	movw	r2, #23960
	movt	r2, 4
	mov	r0, #3
	mla	r7, r1, r7, r3
	movw	r3, #26904
	movt	r3, 4
	mov	r1, #0
	add	r2, r7, r2
	add	r3, r7, r3
	ldr	r7, [r9, #16]
	strb	r1, [r2, #2]
	strb	r1, [r3, #2]
	blx	r7
	cmp	r8, r6
	bls	.L710
	mov	r7, r6, asl #4
.L703:
	add	r6, r6, #1
	add	r0, r7, #294912
	ldr	r1, [r5, r4, asl #2]
	add	r0, r0, #952
	mov	r7, r6, asl #4
	ldr	r10, [r9, #52]
	add	r3, r7, #294912
	add	r0, r1, r0
	add	r3, r3, #952
	mov	r2, #16
	add	r1, r1, r3
	blx	r10
	cmp	r8, r6
	bhi	.L703
.L702:
	mov	ip, r8, asl #4
	ldr	r0, [r5, r4, asl #2]
	add	ip, ip, #294912
	ldr	r3, [r9, #48]
	add	ip, ip, #952
	mov	r2, #16
	add	r0, r0, ip
	mov	r1, #0
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mov	r0, #0
	add	r3, r3, #294912
	ldr	r2, [r3, #1480]
	sub	r2, r2, #1
	str	r2, [r3, #1480]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L729:
	add	r0, r0, #262144
	movw	r6, #2051
	movw	r3, #3474
	ldr	r2, .L730+8
	ldrsb	ip, [r0, r6]
	mov	r0, #1
	ldr	r1, .L730+12
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r5, r4, asl #2]
	add	r3, ip, #262144
	ldrsb	r3, [r3, r6]
	cmp	r3, #0
	movgt	r6, #0
	ble	.L694
.L706:
	mov	r2, #92
	movw	r3, #3477
	mla	ip, r2, r6, ip
	mov	r0, #1
	ldr	r2, .L730+8
	add	r6, r6, r0
	ldr	r1, .L730+16
	add	ip, ip, #282624
	ldr	ip, [ip, #3488]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r5, r4, asl #2]
	movw	r3, #2051
	movt	r3, 4
	add	r3, ip, r3
	ldrsb	r3, [r3]
	cmp	r3, r6
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
	mov	r8, r6
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
	add	r0, r6, #294912
	mov	r1, r4
	add	r0, r0, #1552
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
	add	r3, r3, #311296
	ldrb	r3, [r3, #988]	@ zero_extendqisi2
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
	add	r0, r0, #294912
	add	r0, r0, #1552
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
	add	r0, r3, #294912
	add	r0, r0, #1552
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
	add	r0, r0, #294912
	mvn	r6, #0
	add	r0, r0, #1552
	mvn	r9, #1
	bl	SYNTAX_ReturnImage
	ldr	r0, [r7, r5, asl #2]
	mov	r1, r4
	add	r0, r0, #294912
	add	r0, r0, #1552
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r4, #184]
	ldr	r2, .L777+24
	mov	r0, #1
	ldr	r1, .L777+48
	bl	dprint_vfmw
	b	.L749
.L747:
	add	r0, r0, #294912
	mov	r1, r4
	add	r0, r0, #1552
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
	add	r0, r0, #294912
	mvn	r6, #0
	add	r0, r0, #1552
	mvn	r9, #1
	bl	SYNTAX_ReturnImage
	ldr	r0, [r7, r5, asl #2]
	mov	r1, r4
	add	r0, r0, #294912
	add	r0, r0, #1552
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
	add	r0, r0, #294912
	add	r0, r0, #1552
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
	add	r0, r0, #294912
	add	r0, r0, #1552
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r5, #188]
	cmn	r3, #1
	mov	r8, r0
	beq	.L788
	ldr	r0, [r6, r4, asl #2]
	sub	r1, fp, #676
	str	r3, [fp, #-528]
	add	r0, r0, #294912
	add	r0, r0, #1552
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
	bhi	.L848
	ldr	r3, .L851
	ldr	r5, [r3, r0, asl #2]
	cmp	r5, #0
	moveq	r3, r5
	beq	.L828
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L850
.L848:
	mov	r3, #0
.L828:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L850:
	ldr	r3, [r5, #8]
	cmp	r3, #1
	bne	.L848
	ldr	r3, [r5, #600]
	cmp	r3, #17
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
.L839:
	add	r3, r5, #294912
	ldr	r4, [r3, #1564]
.L844:
	cmp	r4, #0
	moveq	r3, r4
	beq	.L828
	ldr	r3, .L851+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r5, #40]
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L841:
	add	r3, r5, #294912
	ldr	r4, [r3, #1788]
	b	.L844
.L833:
	add	r3, r5, #294912
	ldr	r4, [r3, #2596]
	b	.L844
.L842:
	add	r3, r5, #294912
	ldr	r4, [r3, #3952]
	b	.L844
.L830:
	add	r3, r5, #294912
	ldr	r4, [r3, #1920]
	b	.L844
.L836:
	add	r3, r5, #294912
	ldr	r4, [r3, #1576]
	b	.L844
.L829:
	ldr	r2, .L851+8
	mov	r0, #0
	ldr	r1, .L851+12
	bl	dprint_vfmw
	mov	r3, #0
	b	.L828
.L852:
	.align	2
.L851:
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r0, r1, #0
	beq	.L855
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L855:
	ldr	r1, .L856
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L857:
	.align	2
.L856:
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
	bhi	.L875
	ldr	r3, .L876
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #600]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L858
.L862:
	.word	.L861
	.word	.L871
	.word	.L864
	.word	.L871
	.word	.L858
	.word	.L871
	.word	.L867
	.word	.L858
	.word	.L871
	.word	.L871
	.word	.L871
	.word	.L871
	.word	.L871
	.word	.L871
	.word	.L858
	.word	.L872
	.word	.L873
	.word	.L871
.L872:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #1788]
.L858:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L871:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #1564]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L875:
	ldr	ip, .L876+4
	movw	r3, #4340
	ldr	r2, .L876+8
	mov	r0, #0
	ldr	r1, .L876+12
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L867:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #1576]
	b	.L858
.L861:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #1920]
	b	.L858
.L873:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #3952]
	b	.L858
.L864:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #2596]
	b	.L858
.L877:
	.align	2
.L876:
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	mov	r3, r0
	ldrhi	ip, .L885
	movwhi	r3, #4418
	bhi	.L883
	ldr	r2, .L885+4
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	beq	.L884
	ldr	r3, [r3, #8]
	cmp	r3, #1
	beq	.L882
	ldr	ip, .L885+8
	movw	r3, #4420
.L883:
	ldr	r2, .L885+12
	mov	r0, #0
	ldr	r1, .L885+16
	str	ip, [sp]
	bl	dprint_vfmw
.L878:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L882:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_GetDecParam
.L884:
	ldr	ip, .L885+20
	mov	r0, r3
	ldr	r2, .L885+12
	movw	r3, #4419
	ldr	r1, .L885+16
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L878
.L886:
	.align	2
.L885:
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
	ldrhi	ip, .L914
	movwhi	r3, #4453
	bhi	.L910
	ldr	r3, .L914+4
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L911
	ldr	r0, [r3, #8]
	cmp	r0, #1
	bne	.L912
	ldr	r2, [r3, #600]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L906
.L893:
	.word	.L892
	.word	.L894
	.word	.L895
	.word	.L896
	.word	.L906
	.word	.L897
	.word	.L898
	.word	.L906
	.word	.L899
	.word	.L900
	.word	.L901
	.word	.L901
	.word	.L901
	.word	.L902
	.word	.L906
	.word	.L903
	.word	.L904
	.word	.L905
.L905:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_GetImageBuffer
.L892:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L894:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_GetImageBuffer
.L895:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L896:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L897:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_GetImageBuffer
.L898:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_GetImageBuffer
.L899:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_GetImageBuffer
.L900:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_GetImageBuffer
.L901:
	ldr	r2, .L914+8
	ldr	r2, [r2, #-3056]
	tst	r2, #1
	bne	.L913
.L889:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L902:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_GetImageBuffer
.L903:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_GetImageBuffer
.L904:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L912:
	ldr	ip, .L914+12
	movw	r3, #4455
.L910:
	ldr	r2, .L914+16
	mov	r0, #0
	ldr	r1, .L914+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L889
.L906:
	mov	r0, #0
	b	.L889
.L913:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_GetImageBuffer
.L911:
	ldr	ip, .L914+24
	mov	r0, r3
	ldr	r2, .L914+16
	movw	r3, #4454
	ldr	r1, .L914+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L889
.L915:
	.align	2
.L914:
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
	ldrhi	ip, .L926
	movwhi	r3, #4569
	bhi	.L922
	ldr	r3, .L926+4
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	moveq	r0, r3
	ldreq	ip, .L926+8
	movweq	r3, #4570
	beq	.L923
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L924
	cmp	r1, #0
	ldrne	r2, [r1]
	movne	r0, #0
	strne	r2, [r3, #1228]
	beq	.L925
.L918:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L924:
	ldr	ip, .L926+12
	movw	r3, #4571
.L922:
	ldr	r2, .L926+16
	mov	r0, #0
	ldr	r1, .L926+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L918
.L925:
	ldr	ip, .L926+24
	mov	r0, r1
	movw	r3, #4572
.L923:
	ldr	r2, .L926+16
	ldr	r1, .L926+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L918
.L927:
	.align	2
.L926:
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
	ldrhi	ip, .L938
	movwhi	r3, #4582
	bhi	.L934
	ldr	r3, .L938+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L938+8
	movweq	r3, #4583
	beq	.L935
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L936
	cmp	r1, #0
	beq	.L937
	ldr	r3, .L938+12
	add	r0, r0, #1264
	mov	r2, #20
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L930:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L936:
	ldr	ip, .L938+16
	movw	r3, #4584
.L934:
	ldr	r2, .L938+20
	mov	r0, #0
	ldr	r1, .L938+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L930
.L937:
	ldr	ip, .L938+28
	mov	r0, r1
	movw	r3, #4585
.L935:
	ldr	r2, .L938+20
	ldr	r1, .L938+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L930
.L939:
	.align	2
.L938:
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
	bhi	.L947
	ldr	r3, .L948
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L946
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L946
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L946
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L946
	ldr	r0, [r3, #600]
	cmp	r0, #22
	movne	r0, #0
	mvneq	r0, #0
.L942:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L946:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L947:
	ldr	ip, .L948+4
	movw	r3, #4594
	ldr	r2, .L948+8
	mov	r0, #0
	ldr	r1, .L948+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L942
.L949:
	.align	2
.L948:
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
	beq	.L967
	ldr	r3, .L969
	mov	r1, r4
	ldr	r7, [r0, #352]
	mov	r2, #368
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r5, #8
	str	r7, [r5, #352]
	bl	ResetVoQueue
	ldr	r0, .L969+4
	mov	r1, r4
	str	r6, [r5]
	b	.L955
.L953:
	add	r1, r1, #1
	cmp	r1, #32
	beq	.L968
.L955:
	ldr	r2, [r0], #4
	movw	r3, #34328
	movt	r3, 4
	cmp	r2, #0
	add	r3, r2, r3
	beq	.L953
	cmp	r5, r3
	bne	.L953
	cmn	r1, #1
	str	r1, [r5, #360]
	beq	.L954
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L968:
	mvn	r3, #0
	str	r3, [r5, #360]
.L954:
	ldr	r1, .L969+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L967:
	ldr	r2, .L969+12
	mov	r0, #0
	ldr	r1, .L969+16
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L970:
	.align	2
.L969:
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
	beq	.L973
	mov	r2, #0
	ldr	r0, [r4, #360]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #360]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L974
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
.L974:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L973:
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
	ldr	r7, .L994
	mov	r6, r0
	mov	r5, r1
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L989
	ldr	r2, [r3, #600]
	cmp	r2, #20
	bne	.L990
	ldr	r3, [r3, #520]
	cmp	r3, #2
	ble	.L991
	mov	r1, #1
	bl	FSP_NewLogicFs
	subs	r8, r0, #0
	blt	.L992
	mov	r1, r8
	mov	r0, r6
	bl	FSP_GetLogicFs
	mov	r2, r8
	ldr	r1, .L994+4
	mov	r4, r0
	mov	r0, #18
	bl	dprint_vfmw
	cmp	r4, #0
	beq	.L993
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L982
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L982
	ldr	r2, [r2, #8]
	mov	r0, #18
	ldr	r3, [r3, #8]
	ldr	r1, .L994+8
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
.L977:
	mov	r0, r2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L990:
	ldr	r1, .L994+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L977
.L991:
	ldr	r1, .L994+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L977
.L982:
	ldr	r1, .L994+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L977
.L992:
	ldr	r1, .L994+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L977
.L989:
	ldr	ip, .L994+28
	mov	r0, r3
	ldr	r2, .L994+32
	movw	r3, #4786
	ldr	r1, .L994+36
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L977
.L993:
	movw	r2, #4814
	ldr	r1, .L994+40
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L977
.L995:
	.align	2
.L994:
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
	ldr	r3, .L1015
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1014
	ldr	r2, [r3, #600]
	cmp	r2, #20
	ldrls	pc, [pc, r2, asl #2]
	b	.L996
.L1000:
	.word	.L999
	.word	.L1001
	.word	.L1002
	.word	.L1003
	.word	.L996
	.word	.L1004
	.word	.L1005
	.word	.L996
	.word	.L1006
	.word	.L1007
	.word	.L1008
	.word	.L1008
	.word	.L1008
	.word	.L1009
	.word	.L996
	.word	.L1010
	.word	.L1011
	.word	.L1012
	.word	.L996
	.word	.L996
	.word	.L1013
.L1013:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_Init
.L999:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L1001:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_Init
.L1002:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L1003:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L1004:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_Init
.L1005:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_Init
.L1006:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_Init
.L1007:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_Init
.L1008:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_Init
.L1009:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_Init
.L1010:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_Init
.L1011:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L1012:
	movw	r0, #34328
	add	r1, r3, #608
	movt	r0, 4
	add	r0, r3, r0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_Init
.L1014:
	ldr	ip, .L1015+4
	mov	r0, r3
	ldr	r2, .L1015+8
	movw	r3, #4863
	ldr	r1, .L1015+12
	str	ip, [sp]
	bl	dprint_vfmw
.L996:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1016:
	.align	2
.L1015:
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
	blt	.L1018
	ldr	r3, [r0, #12]
	cmp	r3, #31
	ble	.L1018
	ldr	r3, [r0, #16]
	cmp	r3, #31
	ble	.L1018
	ldr	r3, [r0, #56]
	cmp	r3, #262144
	blt	.L1018
	ldr	r3, [r0, #44]
	cmp	r3, #1
	beq	.L1024
	cmp	r3, #2
	bne	.L1022
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L1018
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ble	.L1018
.L1023:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ble	.L1018
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bgt	.L1022
.L1018:
	ldr	r1, .L1025
	mov	r0, #32
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1022:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1024:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bgt	.L1023
	b	.L1018
.L1026:
	.align	2
.L1025:
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
	beq	.L1029
	add	r0, r1, #1
	cmp	r0, #17
	movge	r0, #17
.L1029:
	ldr	r3, .L1045
	sub	r2, r6, #27
	cmp	r2, #6
	ldr	r2, [r4, #60]
	ldr	r7, [r3, #64]
	mvncc	ip, #1
	mvncs	ip, #0
	cmp	r7, #0
	beq	.L1033
	ldr	lr, .L1045+4
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
	ldr	r3, .L1045+8
	cmp	r0, #0
	bne	.L1033
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
	beq	.L1044
	cmp	r3, #15
	bne	.L1038
	ldr	r3, [r4, #20]
	movw	ip, #4060
	ldr	r0, [r4, #28]
	movw	r2, #3992
	ldr	r1, [r4, #32]
	mov	lr, #2240
.L1043:
	mul	ip, ip, r3
	mla	r3, r2, r0, ip
	mla	r2, lr, r1, r3
	cmp	r2, #0
	movcc	r2, #0
.L1037:
	cmp	r6, #26
	movw	r1, #14824
	movt	r1, 12
	movw	r3, #63096
	movt	r3, 177
	mov	r0, #0
	movne	r3, r1
	add	r3, r3, r2
	str	r3, [r5, #8]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1044:
	ldr	r3, [r4, #20]
	movw	ip, #4060
	ldr	r0, [r4, #28]
	mov	r2, #4000
	ldr	r1, [r4, #32]
	mov	lr, #2208
	b	.L1043
.L1033:
	movw	r2, #5019
	ldr	r1, .L1045+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1038:
	cmp	r3, #16
	movw	r3, #57056
	movt	r3, 9
	moveq	r2, r3
	movne	r2, #0
	b	.L1037
.L1046:
	.align	2
.L1045:
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
	beq	.L1048
	ldr	r1, .L1056
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
	bmi	.L1055
.L1048:
	mov	r0, r4
	bl	VCTRL_VarifyOption
	cmp	r0, #0
	bne	.L1050
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_GetMemSize_onDecode
.L1055:
	stmia	sp, {ip, lr}
	mov	r0, #32
	ldr	r1, .L1056+4
	bl	dprint_vfmw
.L1050:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1057:
	.align	2
.L1056:
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
	bne	.L1082
.L1059:
	ldr	r5, [r4, #112]
	ldr	r6, [r4, #104]
	cmp	r5, #0
	ldr	r7, [r4, #100]
	bne	.L1083
.L1060:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #184]
	ldr	r6, [r4, #176]
	cmp	r5, #0
	ldr	r7, [r4, #172]
	bne	.L1084
.L1061:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #160]
	ldr	r6, [r4, #152]
	cmp	r5, #0
	ldr	r7, [r4, #148]
	bne	.L1085
.L1062:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #208]
	ldr	r6, [r4, #200]
	cmp	r5, #0
	ldr	r7, [r4, #196]
	bne	.L1086
.L1063:
	ldr	r4, .L1090
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #376]
	cmp	r3, #1
	beq	.L1087
	ldr	r3, [r4, #380]
	ldr	r5, .L1090
	cmp	r3, #1
	beq	.L1088
.L1065:
	ldr	r3, [r4, #384]
	ldr	r4, .L1090
	cmp	r3, #1
	beq	.L1089
.L1066:
	bl	HEVCDEC_ReleaseHevcGlbMem
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1082:
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_DelMemRecord
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L1090+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #72
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1059
.L1086:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1090+4
	add	r0, r4, #192
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1063
.L1085:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1090+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #144
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1062
.L1083:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1090+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #96
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1060
.L1084:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1090+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #168
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1061
.L1089:
	ldr	r3, .L1090+4
	mov	r0, #13
	ldr	r5, [r3, #208]
	bl	VFMW_GetString
	ldr	r2, .L1090+8
	mov	r1, r0
	mov	r0, #181
	blx	r5
	mov	r3, #0
	str	r3, [r4, #384]
	b	.L1066
.L1087:
	ldr	r3, .L1090+4
	mov	r0, #0
	ldr	r5, [r3, #208]
	bl	VFMW_GetString
	ldr	r2, .L1090+8
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #376]
	ldr	r3, [r4, #380]
	ldr	r5, .L1090
	cmp	r3, #1
	bne	.L1065
.L1088:
	ldr	r3, .L1090+4
	mov	r0, #4
	ldr	r6, [r3, #208]
	bl	VFMW_GetString
	ldr	r2, .L1090+8
	mov	r1, r0
	mov	r0, #136
	blx	r6
	mov	r3, #0
	str	r3, [r5, #380]
	b	.L1065
.L1091:
	.align	2
.L1090:
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
	ldr	r6, .L1117
	ldr	r5, .L1117+4
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
	bne	.L1093
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
	bne	.L1094
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
	bne	.L1112
	ldr	r2, [r4, #160]
	add	r6, r4, #72
	ldr	r1, [r4, #148]
	ldr	r0, [r4, #152]
	bl	MEM_AddMemRecord
	ldr	r3, .L1117+8
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
	beq	.L1113
	movw	r2, #18048
	mov	r3, #1
	str	r2, [sp]
	mov	r0, r7
	ldr	r1, .L1117+12
	ldr	r2, .L1117+16
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r7
	mov	r0, r6
.L1108:
	mov	r2, #24
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
.L1097:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1113:
	ldr	r2, [r4, #88]
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	ldr	r8, .L1117+20
	bl	MEM_AddMemRecord
	ldr	r1, [r4, #88]
	ldr	r0, [r4, #80]
	bl	SCDDRV_CfgDspMem
	mov	r0, r9
	bl	VDMDRV_Init
	ldr	r7, .L1117+24
	bl	SM_InstInit
	ldr	r2, [r8, #92]
	mov	r0, r9
	ldr	r10, [r5, #204]
	str	r2, [fp, #-72]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r2, [fp, #-72]
	ldr	r1, .L1117+28
	mov	r3, r0
	mov	r0, #127
	blx	r10
	subs	r3, r0, #0
	str	r3, [fp, #-80]
	bne	.L1114
	ldr	r3, [r5, #204]
	mov	r0, #4
	ldr	r2, [r8, #92]
	mov	r9, #1
	ldr	r10, .L1117+32
	str	r3, [fp, #-72]
	str	r2, [fp, #-76]
	str	r9, [r10, #376]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r2, [fp, #-76]
	ldr	r1, .L1117+36
	ldr	ip, [fp, #-72]
	mov	r3, r0
	mov	r0, #136
	blx	ip
	subs	r3, r0, #0
	str	r3, [fp, #-76]
	bne	.L1115
	ldr	r2, [r8, #92]
	mov	r0, #13
	ldr	r8, [r5, #204]
	str	r9, [r10, #380]
	str	r2, [fp, #-72]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r2, [fp, #-72]
	ldr	r1, .L1117+40
	mov	r3, r0
	mov	r0, #181
	blx	r8
	subs	r7, r0, #0
	bne	.L1116
	str	r9, [r10, #384]
	bl	HEVCDEC_AllocHevcGlbMem
	cmp	r0, #0
	beq	.L1097
	ldr	r1, .L1117+44
	mov	r0, r7
	bl	dprint_vfmw
	mov	r0, r7
	b	.L1097
.L1112:
	ldr	r1, .L1117+48
	mov	r2, r8
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r9
	mov	r0, r10
	b	.L1108
.L1093:
	mov	r2, #0
	ldr	r1, .L1117+48
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
	b	.L1097
.L1094:
	mov	r2, #53248
	ldr	r1, .L1117+48
	movt	r2, 63683
	mov	r0, r8
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r8
	mov	r0, r7
	b	.L1108
.L1114:
	ldr	r1, .L1117+52
	mov	r2, #127
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r9
	mov	r0, r6
	b	.L1108
.L1115:
	ldr	r1, .L1117+52
	mov	r2, #136
	ldr	r7, [fp, #-80]
.L1109:
	mov	r0, r7
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r7
	mov	r0, r6
	b	.L1108
.L1116:
	mov	r2, #181
	ldr	r1, .L1117+52
	ldr	r7, [fp, #-76]
	b	.L1109
.L1118:
	.align	2
.L1117:
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
	beq	.L1151
	ldr	r5, .L1156
	mov	r2, #8
	ldr	r7, .L1156+4
	sub	r0, fp, #52
	mov	r1, #0
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r4, [r7, #128]
	cmp	r4, #0
	bne	.L1150
	ldr	r6, .L1156+8
	mov	r1, #1024
	ldr	r3, [r5, #80]
	str	r4, [fp, #-56]
	sub	r0, r6, #1552
	blx	r3
	sub	r0, r6, #1552
	ldr	r3, [r5, #96]
	ldr	r1, .L1156+12
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1123
	ldr	r3, [r5, #92]
	sub	r0, fp, #56
	ldr	r1, .L1156+16
	blx	r3
	cmp	r0, #0
	beq	.L1142
	sub	r0, fp, #56
	ldr	r3, [r5, #92]
	ldr	r1, .L1156+20
	blx	r3
	cmp	r0, #0
	beq	.L1152
	mov	r2, r4
	ldr	r3, [r5, #84]
	mov	r1, r4
	blx	r3
	mov	r2, r0
	str	r0, [r6, #-1564]
.L1127:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r8, #5000
	cmp	r3, r1
	bhi	.L1128
	cmp	r2, r8
	movw	r3, #60536
.L1149:
	movt	r3, 65535
	movge	r2, r8
	cmp	r2, r3
	movlt	r2, r3
.L1124:
	str	r2, [r6, #-1564]
.L1126:
	ldr	r8, .L1156+8
	mov	r9, #0
	ldr	r3, [r5, #80]
	mov	r1, #1024
	sub	r0, r8, #1552
	str	r9, [fp, #-56]
	blx	r3
	sub	r0, r8, #1552
	ldr	r3, [r5, #96]
	ldr	r1, .L1156+24
	blx	r3
	ldr	r10, .L1156
	cmp	r0, r9
	str	r0, [fp, #-56]
	beq	.L1129
	ldr	r3, [r10, #92]
	sub	r0, fp, #56
	ldr	r1, .L1156+16
	blx	r3
	cmp	r0, r9
	beq	.L1130
	sub	r0, fp, #56
	ldr	r3, [r10, #92]
	ldr	r1, .L1156+20
	blx	r3
	cmp	r0, r9
	beq	.L1153
	mov	r2, r9
	ldr	r3, [r10, #84]
	mov	r1, r9
	blx	r3
	mov	r2, r0
	str	r0, [r8, #-1560]
.L1133:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r8, #5000
	cmp	r3, r1
	bhi	.L1134
	cmp	r2, r8
	movw	r3, #60536
	movt	r3, 65535
	movlt	r4, r2
	movge	r4, r8
	cmp	r4, r3
	movlt	r4, r3
.L1130:
	str	r4, [r6, #-1560]
.L1132:
	ldr	r4, [r6, #-528]
	mov	r3, #0
	ldr	r8, .L1156+8
	cmp	r4, r3
	str	r3, [fp, #-56]
	beq	.L1135
	ldr	r2, .L1156+28
	and	r3, r4, #1
	ubfx	r1, r4, #1, #1
	strb	r3, [r8, #-524]
	ubfx	r3, r4, #2, #1
	ubfx	r4, r4, #3, #1
	strb	r1, [r2, #96]
	strb	r3, [r8, #-523]
	strb	r4, [r8, #-522]
.L1136:
	ldr	r4, .L1156+4
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
	ldr	r1, .L1156+32
	sub	r0, fp, #52
	mov	r2, #134217728
	mov	r3, #75497472
	str	r2, [fp, #-52]
	str	r1, [r6, #-520]
	str	r3, [fp, #-48]
	str	r8, [r7, #132]
	bl	MEM_InitMemManager
	bl	FSP_Init
	ldr	r6, .L1156
	bl	ChanCtx_Init
	ldr	r3, [r5, #48]
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L1156+36
	blx	r3
	add	r0, r4, #152
	bl	OpenDrivers
	cmp	r0, #0
	bne	.L1150
	ldr	r3, [r6, #124]
	mov	r1, r8
	blx	r3
	ldr	r3, [r6, #200]
	ldr	r2, .L1156+40
	add	r0, r4, #140
	ldr	r1, .L1156+44
	blx	r3
	cmp	r0, #0
	streq	r8, [r4, #128]
	bne	.L1154
.L1121:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1135:
	ldr	r3, [r5, #80]
	mov	r1, #1024
	sub	r0, r8, #1552
	ldr	r9, .L1156
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1156+48
	sub	r0, r8, #1552
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1136
	ldr	r3, [r9, #92]
	sub	r0, fp, #56
	ldr	r1, .L1156+16
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r8, #-528]
	beq	.L1138
	sub	r0, fp, #56
	ldr	r3, [r9, #92]
	ldr	r1, .L1156+20
	blx	r3
	cmp	r0, #0
	beq	.L1155
	ldr	r3, [r9, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	str	r0, [r8, #-528]
.L1138:
	ldr	r2, .L1156+28
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #-524]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2, #96]
	strb	r3, [r6, #-523]
	strb	r0, [r6, #-522]
	b	.L1136
.L1129:
	ldr	r2, [r8, #-1560]
	b	.L1133
.L1123:
	ldr	r2, [r6, #-1564]
	b	.L1127
.L1128:
	ldr	r1, .L1156+52
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r2, [r6, #-1564]
	movw	r3, #60536
	cmp	r2, r8
	b	.L1149
.L1134:
	ldr	r1, .L1156+56
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r4, [r6, #-1560]
	movw	r3, #60536
	cmp	r4, r8
	movt	r3, 65535
	movge	r4, r8
	cmp	r4, r3
	movlt	r4, r3
	b	.L1130
.L1142:
	mov	r2, r4
	b	.L1124
.L1154:
	add	r0, r4, #152
	bl	CloseDrivers
.L1150:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1153:
	movw	r3, #6032
	ldr	r2, .L1156+60
	ldr	r1, .L1156+64
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1132
.L1152:
	movw	r3, #5990
	ldr	r2, .L1156+68
	ldr	r1, .L1156+64
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1126
.L1155:
	movw	r3, #6083
	ldr	r2, .L1156+72
	ldr	r1, .L1156+64
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1136
.L1151:
	ldr	ip, .L1156+76
	movw	r3, #938
	ldr	r2, .L1156+80
	ldr	r1, .L1156+84
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1121
.L1157:
	.align	2
.L1156:
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
	ldr	r1, .L1166
	mov	r2, r5
	mov	r0, #30
	bl	dprint_vfmw
	cmp	r6, #3
	beq	.L1164
	cmp	r4, r7
	movge	r4, r6
	blt	.L1165
.L1160:
	mov	r2, r6
	mov	r3, r4
	ldr	r1, .L1166+4
	mov	r0, #30
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1165:
	ldr	r1, .L1166+8
	mov	r0, #30
	bl	dprint_vfmw
.L1163:
	mov	r4, #3
	b	.L1160
.L1164:
	cmp	r5, r7
	ble	.L1163
	ldr	r1, .L1166+12
	mov	r0, #30
	bl	dprint_vfmw
	mov	r4, #0
	b	.L1160
.L1167:
	.align	2
.L1166:
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
	ldr	ip, .L1178
	mov	r2, #0
	b	.L1171
.L1169:
	add	r2, r2, #1
	cmp	r2, #32
	beq	.L1177
.L1171:
	ldr	r1, [ip], #4
	movw	r3, #34328
	movt	r3, 4
	cmp	r1, #0
	add	r3, r1, r3
	beq	.L1169
	cmp	r0, r3
	bne	.L1169
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L1177:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1179:
	.align	2
.L1178:
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
	ldr	r4, .L1192
	mov	lr, #0
.L1185:
	ldr	r2, [r4], #4
	cmp	r2, #0
	beq	.L1181
	movw	r3, #30168
	movw	r1, #32472
	movt	r3, 4
	movt	r1, 4
	add	r3, r2, r3
	add	r1, r2, r1
.L1184:
	ldr	r2, [r3]
	cmp	r2, r0
	bhi	.L1182
	ldr	ip, [r3, #-20]
	add	r2, r2, ip
	cmp	r0, r2
	bcc	.L1186
.L1182:
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L1184
.L1181:
	add	lr, lr, #1
	cmp	lr, #32
	bne	.L1185
	mvn	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L1186:
	mov	r0, lr
	ldmfd	sp, {r4, fp, sp, pc}
.L1193:
	.align	2
.L1192:
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
	ldr	r6, .L1223
	mov	r5, r0
	mov	r4, r1
	ldr	ip, [r6, r0, asl #2]
	ldr	r2, [ip, #52]
	cmp	r2, #1
	beq	.L1218
	cmp	r2, #6
	cmpne	r2, #18
	sub	r1, r2, #2
	moveq	r3, #1
	movne	r3, #0
	cmp	r1, #1
	orrls	r3, r3, #1
	cmp	r3, #0
	bne	.L1196
.L1197:
	ldrd	r2, [r4, #32]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1219
	add	r1, ip, #672
	strd	r2, [r1]
.L1207:
	ldrd	r8, [r4, #48]
	add	r0, ip, #688
	add	lr, ip, #704
	ldr	r1, .L1223+4
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
	ldrb	lr, [r4, #15]	@ zero_extendqisi2
	strb	lr, [ip, #664]
	strd	r8, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1218:
	add	r3, ip, #294912
	ldr	r3, [r3, #1560]
	ldrb	r3, [r3, #564]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1197
.L1196:
	add	r1, ip, #1168
	add	r3, r4, #8
	mov	r0, r5
	bl	IsNewpicSeg
	cmp	r0, #0
	beq	.L1220
.L1198:
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [r1, #52]
	cmp	r3, #3
	addeq	r0, r1, #688
	beq	.L1204
.L1203:
	ldrd	r2, [r4, #32]
	mvn	r7, #0
	mvn	r6, #0
	add	r0, r1, #688
	cmp	r3, r7
	cmpeq	r2, r6
	strned	r2, [r0, #-8]
.L1205:
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
.L1204:
	ldrd	r2, [r0]
	mov	r0, #29
	ldr	r1, .L1223+8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1220:
	ldr	ip, [r6, r5, asl #2]
	add	lr, ip, #688
	ldr	r3, [ip, #52]
	cmp	r3, #3
	beq	.L1221
	ldrd	r2, [lr, #-8]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1222
	add	r1, ip, #672
	strd	r2, [r1]
.L1200:
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
.L1202:
	ldr	r1, [ip, #736]
	mov	r0, #29
	ldr	r7, [ip, #732]
	ldr	lr, [ip, #740]
	str	r1, [ip, #724]
	ldr	r1, [ip, #748]
	str	r7, [ip, #720]
	str	lr, [ip, #728]
	str	r1, [ip, #744]
	ldr	r1, .L1223+12
	bl	dprint_vfmw
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [r1, #52]
	cmp	r3, #3
	bne	.L1203
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
	b	.L1198
.L1221:
	ldrd	r2, [lr, #-8]
	add	r1, ip, #672
	strd	r2, [r1]
	b	.L1200
.L1219:
	add	r3, ip, #672
	ldrd	r2, [r3]
	b	.L1207
.L1222:
	add	r3, ip, #672
	ldrd	r2, [r3]
	b	.L1200
.L1224:
	.align	2
.L1223:
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
	ldr	r3, .L1233
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #600]
	sub	r3, r2, #10
	cmp	r3, #2
	bhi	.L1226
	ldr	r3, .L1233+4
	ldr	r3, [r3, #-3056]
	ands	r3, r3, #1
	beq	.L1227
.L1226:
	bic	r3, r2, #16
	cmp	r3, #4
	cmpne	r2, #14
	movne	r3, #1
	moveq	r3, #0
	beq	.L1227
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	mvnne	r3, #1
	moveq	r3, #0
.L1227:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1234:
	.align	2
.L1233:
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
	ldrhi	ip, .L1279
	movwhi	r3, #5644
	bhi	.L1268
	ldr	r6, .L1279+4
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1271
	ldr	r3, [r0, #8]
	cmp	r3, #1
	bne	.L1272
	ldr	r5, [r0, #24]
	cmp	r5, #0
	ldrne	ip, .L1279+8
	movwne	r3, #5647
	bne	.L1268
	ldr	r8, .L1279+12
	mov	r7, r4, asl #2
	str	r5, [r0, #436]
	ldr	r9, .L1279+16
	ldr	r3, [r8]
	blx	r3
	add	r2, r9, r7
	ldr	r3, [r2, #-388]
	mov	r1, r0
	ldr	r0, .L1279+20
	rsb	r3, r3, r1
	ldr	r0, [r0]
	cmp	r3, r0
	mov	r0, r4
	bls	.L1241
	str	r1, [r2, #-388]
	bl	DecChanCheckDecParam
	cmn	r0, #2
	mov	r10, r0
	bne	.L1242
	mov	r2, r4
	ldr	r1, .L1279+24
	mov	r0, #23
	bl	dprint_vfmw
.L1258:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1241:
	bl	DecChanCheckDecParam
	cmn	r0, #2
	mov	r10, r0
	beq	.L1258
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	mvnne	r10, #2
	bne	.L1258
.L1252:
	ldr	r1, [r6, r4, asl #2]
	add	r3, r1, #262144
	ldr	r3, [r3, #2080]
	cmp	r3, #1
	beq	.L1273
	cmp	r3, #3
	beq	.L1274
	ldrb	r3, [r1, #753]	@ zero_extendqisi2
	add	r10, r1, #752
	cmp	r3, #0
	bne	.L1245
	ldr	r3, [r1, #1560]
	cmp	r3, #0
	beq	.L1275
.L1245:
	ldrd	r2, [r10, #32]
	mov	r0, #29
	ldr	r1, .L1279+28
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
	bne	.L1276
.L1247:
	ldr	r3, [r6, r4, asl #2]
	movw	r2, #34328
	mov	r0, r10
	movt	r2, 4
	add	r2, r3, r2
	ldr	r1, [r3, #600]
	bl	DecodeStream
	mov	r0, #4
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L1277
.L1269:
	mov	r10, #0
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1242:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	moveq	r5, r0
	beq	.L1252
	mov	r2, r4
	ldr	r1, .L1279+32
	mov	r0, #23
	mvn	r10, #2
	bl	dprint_vfmw
	b	.L1258
.L1272:
	ldr	ip, .L1279+36
	movw	r3, #5646
.L1268:
	ldr	r2, .L1279+40
	mov	r0, #0
	ldr	r1, .L1279+44
	mvn	r10, #0
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1258
.L1277:
	ldr	r3, [r8]
	add	r7, r9, r7
	blx	r3
	ldr	r1, .L1279+48
	ldr	r3, [r7, #-260]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	mov	r2, r0
	cmp	r3, r1
	bls	.L1269
	mov	r0, r4
	str	r2, [r7, #-260]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1269
	mov	r2, r4, asl #24
	movw	r1, #5746
	add	r2, r2, #262144
	ldr	r0, .L1279+52
	bl	DBG_AddTrace
	b	.L1269
.L1275:
	add	r1, r1, #760
	mov	r0, r4
	bl	SM_ReadSegStream
	cmp	r0, #0
	beq	.L1245
	cmp	r5, #1
	beq	.L1278
.L1246:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #1
	mvn	r10, #3
	str	r2, [r3, #436]
	b	.L1258
.L1276:
	mov	r2, r4, asl #24
	movw	r1, #5728
	add	r2, r2, #196608
	ldr	r0, .L1279+52
	bl	DBG_AddTrace
	b	.L1247
.L1271:
	ldr	ip, .L1279+56
	movw	r3, #5645
	ldr	r2, .L1279+40
	mvn	r10, #0
	ldr	r1, .L1279+44
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1258
.L1273:
	ldr	r1, .L1279+60
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r10, #2
	b	.L1258
.L1274:
	ldr	r2, [r1, #1504]
	mov	r0, #31
	ldr	r1, .L1279+64
	mvn	r10, #0
	bl	dprint_vfmw
	b	.L1258
.L1278:
	mov	r2, r4
	ldr	r1, .L1279+68
	mov	r0, #23
	bl	dprint_vfmw
	b	.L1246
.L1280:
	.align	2
.L1279:
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
	ldr	r0, .L1313
	ldr	r1, .L1313+4
	sub	r3, r0, #128
.L1284:
	ldr	r2, [r1, #4]!
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #20]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L1284
	ldr	r7, .L1313+8
	mvn	r5, #0
	ldr	r8, .L1313+12
	mov	r9, #0
	mov	r10, r7
.L1285:
	mov	r3, #0
	ldr	r0, [r8, #-132]
	mov	r4, r3
	ldr	r1, .L1313+16
	b	.L1286
.L1288:
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	movlt	r0, r2
	movlt	r4, r3
.L1286:
	add	r3, r3, #1
	cmp	r3, #32
	bne	.L1288
	add	r3, r8, r4, lsl #2
	cmp	r0, #0
	add	r2, r4, #1
	mov	r1, #0
	str	r9, [r3, #-132]
	str	r2, [r7, #148]
	ldr	r3, .L1313+8
	ble	.L1289
	ldr	r3, [r10, r4, asl #2]
	cmp	r3, r1
	beq	.L1285
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bne	.L1285
	ldr	r2, [r3, #76]
	cmp	r2, r1
	ble	.L1291
	ldr	r5, [r3, #80]
	cmp	r5, r1
	beq	.L1311
.L1291:
	mov	r6, #500
	b	.L1299
.L1294:
	cmp	r0, #0
	ldr	r3, [r7, r4, asl #2]
	bne	.L1297
	ldr	r2, [r3, #1592]
	cmp	r2, #1
	beq	.L1297
	subs	r6, r6, #1
	beq	.L1285
.L1299:
	mov	r0, r4
	bl	DecChanSyntax
	cmn	r0, #1
	mov	r5, r0
	bne	.L1294
	ldr	r6, [r8, #-520]
	cmp	r6, #0
	beq	.L1305
	mov	r3, #0
	mov	r0, r4
	mov	r2, r3
	mov	r1, #102
	blx	r6
.L1305:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1297:
	str	r9, [r3, #1592]
	b	.L1285
.L1311:
	mov	r0, r4
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L1312
.L1292:
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
	b	.L1291
.L1289:
	mov	r0, r5
	str	r1, [r3, #148]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1312:
	ldr	r3, .L1313+20
	mov	r1, r5
	sub	r0, fp, #68
	mov	r2, #24
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1292
.L1314:
	.align	2
.L1313:
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
	ldr	r5, .L1326
	mov	r0, #0
	bl	VCTRL_RecordPosTime
	ldrb	r3, [r5, #1788]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1324
.L1316:
	ldr	r0, [r5, #908]
	mov	r3, #100
	ldr	r6, .L1326+4
	cmp	r0, #0
	str	r3, [r5, #144]
	ble	.L1317
	ldr	r3, [r6, #120]
	blx	r3
.L1317:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	SM_Wakeup
	ldr	r3, [r5, #904]
	mov	r2, #101
	str	r2, [r5, #144]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1325
.L1318:
	mov	r3, #102
	str	r3, [r5, #144]
	bl	VDMDRV_WakeUpVdm
	mov	r4, #0
.L1319:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #32
	bne	.L1319
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
.L1325:
	bl	DecSyntax
	mov	r7, r0
	b	.L1318
.L1324:
	mov	r0, #11
	bl	VCTRL_RecordPosTime
	mov	r3, #0
	strb	r3, [r5, #1788]
	b	.L1316
.L1327:
	.align	2
.L1326:
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
	ldr	r4, .L1355
	ldr	r6, .L1355+4
.L1329:
.L1336:
	ldr	r1, .L1355+8
	mov	r0, #2
	mov	r3, #0
	str	r3, [r4, #144]
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	mov	r5, #2
	str	r5, [r4, #132]
	cmp	r3, r5
	bne	.L1351
	b	.L1334
.L1353:
	str	r5, [r4, #144]
	bl	VCTRL_RunProcess
	ldr	r1, .L1355+12
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	cmp	r3, #2
	beq	.L1334
.L1351:
	cmp	r3, #3
	bne	.L1353
.L1332:
	ldr	r1, .L1355+16
	mov	r0, #2
	mov	r3, #6
	str	r3, [r4, #144]
	bl	dprint_vfmw
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #132]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1334:
	ldr	r1, .L1355+20
	mov	r0, #2
	mov	r3, #4
	str	r3, [r4, #144]
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r4, #132]
	b	.L1331
.L1354:
	ldr	r3, [r6, #120]
	blx	r3
.L1331:
	ldr	r1, .L1355+24
	mov	r0, #22
	mov	r3, #5
	str	r3, [r4, #144]
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	mov	r0, #10
	cmp	r3, #1
	beq	.L1336
	cmp	r3, #3
	bne	.L1354
	b	.L1332
.L1356:
	.align	2
.L1355:
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
	ldr	r3, .L1376
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1374
	ldr	r2, [r3, #600]
	cmp	r2, #20
	ldrls	pc, [pc, r2, asl #2]
	b	.L1375
.L1360:
	.word	.L1373
	.word	.L1361
	.word	.L1362
	.word	.L1363
	.word	.L1375
	.word	.L1364
	.word	.L1365
	.word	.L1375
	.word	.L1366
	.word	.L1367
	.word	.L1368
	.word	.L1368
	.word	.L1368
	.word	.L1369
	.word	.L1375
	.word	.L1370
	.word	.L1371
	.word	.L1372
	.word	.L1375
	.word	.L1375
	.word	.L1373
.L1373:
	add	r0, r3, #294912
	add	r0, r0, #1568
	ldmfd	sp, {fp, sp, pc}
.L1361:
	movw	r0, #18120
	movt	r0, 5
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1362:
	movw	r0, #56952
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1363:
	add	r0, r3, #385024
	add	r0, r0, #160
	ldmfd	sp, {fp, sp, pc}
.L1364:
	movw	r0, #11320
	movt	r0, 5
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1365:
	movw	r0, #50520
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1366:
	add	r0, r3, #348160
	add	r0, r0, #3168
	ldmfd	sp, {fp, sp, pc}
.L1367:
	movw	r0, #23640
	movt	r0, 5
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1368:
	movw	r0, #47016
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1369:
	movw	r0, #42536
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1370:
	add	r0, r3, #294912
	add	r0, r0, #2144
	ldmfd	sp, {fp, sp, pc}
.L1371:
	movw	r0, #39880
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1372:
	add	r0, r3, #569344
	add	r0, r0, #2960
	ldmfd	sp, {fp, sp, pc}
.L1375:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1374:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1377:
	.align	2
.L1376:
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
	bhi	.L1394
	bl	VCTRL_GetChanVoQue
	subs	r4, r0, #0
	beq	.L1389
	sub	r2, fp, #36
	mov	r3, #0
	sub	r1, fp, #44
	str	r3, [fp, #-44]
	str	r3, [r2, #-4]!
	bl	GetQueueImgNum
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	beq	.L1389
	cmp	r2, #32
	bhi	.L1382
.L1385:
	ldr	r3, .L1396
	ldrh	r1, [r4, #4]
	ldr	r0, [r3, r5, asl #2]
	and	r1, r1, #63
	add	lr, r0, #294912
	add	r1, r4, r1, lsl #2
	ldr	r3, [lr, #1480]
	ldr	r1, [r1, #12]
	cmp	r3, #32
	bhi	.L1383
	add	r0, r0, r3, lsl #4
	mov	r6, #0
	add	r0, r0, #294912
	mov	r7, #0
	mov	ip, #1
	add	r0, r0, #956
	mov	r8, #0
	b	.L1386
.L1387:
	ldrh	r1, [r4, #4]
	cmp	r3, #33
	add	r1, r1, ip
	add	ip, ip, #1
	and	r1, r1, #63
	add	r1, r4, r1, lsl #2
	ldr	r1, [r1, #12]
	beq	.L1383
.L1386:
	ldr	r1, [r1, #20]
	cmp	ip, r2
	strd	r6, [r0, #4]
	add	r3, r3, #1
	str	r8, [r0, #-4]
	add	r0, r0, #16
	str	r1, [r0, #-16]
	str	r3, [lr, #1480]
	bcc	.L1387
.L1393:
	mov	r0, #0
.L1395:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1389:
	mvn	r0, #0
.L1380:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1383:
	mov	r2, r5
	ldr	r1, .L1396+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1395
.L1382:
	mov	r3, #32
	ldr	r1, .L1396+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	bne	.L1385
	b	.L1393
.L1394:
	ldr	ip, .L1396+12
	movw	r3, #3265
	ldr	r2, .L1396+16
	mov	r0, #0
	ldr	r1, .L1396+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1380
.L1397:
	.align	2
.L1396:
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
	bhi	.L1415
	cmp	r1, #0
	beq	.L1416
	bl	VCTRL_GetChanVoQue
	subs	r5, r0, #0
	mvneq	r0, #0
	beq	.L1400
	ldr	r6, .L1418
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
	beq	.L1402
	cmp	r2, #32
	bhi	.L1417
.L1403:
	mov	r1, #0
	mov	r0, r1
	mov	lr, r1
.L1405:
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
	bcc	.L1405
	uxth	r3, r2
.L1404:
	ldrh	r1, [r5, #4]
	add	r3, r3, r1
	and	r3, r3, #63
	strh	r3, [r5, #4]	@ movhi
	str	r2, [r4, #528]
.L1406:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	mov	r0, #0
.L1400:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1402:
	ldr	ip, .L1418+4
	ldr	r3, [ip, r7, asl #2]
	add	r1, r3, #294912
	ldr	r1, [r1, #1480]
	cmp	r1, #0
	beq	.L1406
	mov	r0, r2
	mov	lr, r2
.L1407:
	mov	r1, r0, asl #4
	add	r5, r0, #18432
	add	r3, r3, r1
	add	r1, r4, r1
	add	r3, r3, #294912
	add	r5, r5, #60
	add	r3, r3, #952
	mov	r8, #0
	add	r2, r2, #1
	ldr	r3, [r3, #4]
	uxth	r2, r2
	str	r3, [r1, #4]
	ldr	r3, [ip, r7, asl #2]
	ldr	r3, [r3, r5, asl #4]
	str	r8, [r1, #12]
	str	r3, [r1, #8]
	str	lr, [r4, r0, asl #4]
	sxth	r0, r2
	ldr	r3, [ip, r7, asl #2]
	add	r1, r3, #294912
	ldr	r1, [r1, #1480]
	cmp	r0, r1
	bcc	.L1407
	str	r1, [r4, #528]
	b	.L1406
.L1417:
	mov	r3, #32
	ldr	r1, .L1418+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	moveq	r3, r2
	bne	.L1403
	b	.L1404
.L1415:
	ldr	ip, .L1418+12
	movw	r3, #3341
	ldr	r2, .L1418+16
	mov	r0, #0
	ldr	r1, .L1418+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1400
.L1416:
	ldr	ip, .L1418+24
	mov	r0, r1
	movw	r3, #3342
	ldr	r2, .L1418+16
	ldr	r1, .L1418+20
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1400
.L1419:
	.align	2
.L1418:
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
	beq	.L1433
	cmp	r2, #0
	beq	.L1434
	cmp	r3, #0
	beq	.L1435
	cmp	r0, #31
	bhi	.L1436
	ldr	r7, .L1442
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L1437
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L1427
	mov	r2, r6
	mov	r1, r5
	bl	GetQueueImgNum
	ldr	r2, [r7, r4, asl #2]
	ldr	r3, [r2, #600]
	cmp	r3, #0
	beq	.L1438
	cmp	r3, #16
	beq	.L1439
	cmp	r3, #17
	moveq	r3, #9
	streq	r3, [r8]
	beq	.L1420
	cmp	r3, #15
	beq	.L1440
	cmp	r3, #18
	movne	r3, #2
	strne	r3, [r8]
	beq	.L1441
.L1420:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1427:
	str	r3, [r6]
	str	r3, [r5]
	str	r3, [r8]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1436:
	ldr	ip, .L1442+4
	movw	r3, #5855
	ldr	r2, .L1442+8
	mov	r0, #0
	ldr	r1, .L1442+12
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1438:
	add	r2, r2, #319488
	ldr	r3, [r2, #3696]
	str	r3, [r8]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1439:
	add	r2, r2, #299008
	ldr	r3, [r2, #28]
	str	r3, [r8]
	b	.L1420
.L1441:
	ldr	r2, .L1442+8
	mov	r0, #32
	ldr	r1, .L1442+16
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L1433:
	ldr	ip, .L1442+20
	mov	r0, r8
	movw	r3, #5852
	ldr	r2, .L1442+8
	ldr	r1, .L1442+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1420
.L1434:
	ldr	ip, .L1442+24
	mov	r0, r2
	movw	r3, #5853
	ldr	r2, .L1442+8
	ldr	r1, .L1442+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1420
.L1435:
	ldr	ip, .L1442+28
	mov	r0, r3
	ldr	r2, .L1442+8
	movw	r3, #5854
	ldr	r1, .L1442+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1420
.L1440:
	add	r2, r2, #11403264
	add	r2, r2, #16384
	ldr	r3, [r2, #384]
	str	r3, [r8]
	b	.L1420
.L1437:
	ldr	ip, .L1442+32
	mov	r0, r3
	ldr	r2, .L1442+8
	movw	r3, #5856
	ldr	r1, .L1442+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1420
.L1443:
	.align	2
.L1442:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+984
	.word	.LC0
	.word	.LC177
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
	beq	.L1454
	cmp	r0, #31
	bhi	.L1455
	ldr	r6, .L1457
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1456
	ldr	r3, .L1457+4
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
	movw	r3, #2051
	ldr	r2, [r2, #1184]
	str	r2, [r4, #32]
	ldr	r2, [r6, r5, asl #2]
	ldr	r2, [r2, #1188]
	str	r2, [r4, #36]
	ldr	r2, [r6, r5, asl #2]
	ldr	r2, [r2, #1192]
	str	r2, [r4, #44]
	ldr	r2, [r6, r5, asl #2]
	add	r1, r2, #262144
	ldrsb	ip, [r1, r3]
	cmp	ip, r7
	ble	.L1452
	movw	r3, #23962
	mov	r1, r7
	movt	r3, 4
	add	r3, r2, r3
	mov	r0, r7
.L1451:
	ldrsb	r2, [r3]
	add	r1, r1, #1
	add	r3, r3, #92
	cmp	r2, #3
	addeq	r0, r0, #1
	cmp	r1, ip
	bne	.L1451
.L1449:
	str	r0, [r4, #84]
	movw	lr, #2051
	ldr	ip, [r6, r5, asl #2]
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	add	ip, ip, #262144
	mov	r0, r5
	ldrsb	ip, [ip, lr]
	str	ip, [r4, #92]
	bl	VCTRL_GetChanImgNum
	ldr	r2, .L1457+8
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
	add	r3, r3, #311296
	ldrb	r3, [r3, #1048]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r4, #88]
.L1444:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1455:
	ldr	ip, .L1457+12
	movw	r3, #1262
	ldr	r2, .L1457+16
	mov	r0, #0
	ldr	r1, .L1457+20
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1456:
	ldr	ip, .L1457+24
	movw	r3, #1263
	ldr	r2, .L1457+16
	ldr	r1, .L1457+20
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1444
.L1452:
	mov	r0, r7
	b	.L1449
.L1454:
	ldr	ip, .L1457+28
	mov	r0, r4
	movw	r3, #1261
	ldr	r2, .L1457+16
	ldr	r1, .L1457+20
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1444
.L1458:
	.align	2
.L1457:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LC100
	.word	.LANCHOR0+1004
	.word	.LC0
	.word	.LC101
	.word	.LC178
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
	bhi	.L1463
	ldr	r3, .L1465
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldrne	r0, [r0, #1300]
	beq	.L1464
.L1461:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1463:
	ldr	ip, .L1465+4
	movw	r3, #5919
	ldr	r2, .L1465+8
	mov	r0, #0
	ldr	r1, .L1465+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1461
.L1464:
	ldr	ip, .L1465+16
	movw	r3, #5920
	ldr	r2, .L1465+8
	ldr	r1, .L1465+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1461
.L1466:
	.align	2
.L1465:
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
	bhi	.L1471
	ldr	r3, .L1473
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldrne	r0, [r0, #1304]
	beq	.L1472
.L1469:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1471:
	ldr	ip, .L1473+4
	movw	r3, #5927
	ldr	r2, .L1473+8
	mov	r0, #0
	ldr	r1, .L1473+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1469
.L1472:
	ldr	ip, .L1473+16
	movw	r3, #5928
	ldr	r2, .L1473+8
	ldr	r1, .L1473+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1469
.L1474:
	.align	2
.L1473:
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
	bhi	.L1479
	ldr	r3, .L1480
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #36]
	moveq	r0, #33
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1479:
	ldr	ip, .L1480+4
	movw	r3, #5935
	ldr	r2, .L1480+8
	mov	r0, #0
	ldr	r1, .L1480+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1481:
	.align	2
.L1480:
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
	ldr	r5, .L1489
	add	r3, r3, #8
	movw	r2, #10000
	cmp	r3, r2
	mov	r4, r1
	str	r0, [r5, #-1564]
	bhi	.L1487
.L1483:
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
	ldr	r6, .L1489
	bhi	.L1488
.L1484:
	movw	r2, #5000
	cmp	r4, r2
	movw	r3, #60536
	movge	r4, r2
	movt	r3, 65535
	cmp	r4, r3
	movlt	r4, r3
	str	r4, [r5, #-1560]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1487:
	mov	r2, r0
	ldr	r1, .L1489+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r0, [r5, #-1564]
	b	.L1483
.L1488:
	mov	r2, r4
	ldr	r1, .L1489+8
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r4, [r6, #-1560]
	b	.L1484
.L1490:
	.align	2
.L1489:
	.word	.LANCHOR3
	.word	.LC179
	.word	.LC180
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
	ldrne	r3, .L1503
	bne	.L1495
	b	.L1501
.L1496:
	ldr	r2, [r3, #8]!
	cmp	r2, r1
	beq	.L1502
.L1495:
	ldr	r0, [r3, #12]
	cmp	r0, #0
	bne	.L1496
	ldmfd	sp, {fp, sp, pc}
.L1502:
	ldmfd	sp, {fp, sp, pc}
.L1501:
	ldr	r0, .L1503+4
	ldmfd	sp, {fp, sp, pc}
.L1504:
	.align	2
.L1503:
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
	beq	.L1512
	cmp	r0, #0
	ldrne	r3, .L1518
	bne	.L1510
	b	.L1517
.L1511:
	ldr	ip, [r3, #8]!
	cmp	r0, ip
	beq	.L1508
.L1510:
	ldr	r4, [r3, #12]
	cmp	r4, #0
	bne	.L1511
	mov	r2, r0
	ldr	r1, .L1518+4
	mov	r0, #32
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1517:
	ldr	r4, .L1518+8
.L1508:
	mov	r0, r1
	blx	r4
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1512:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1519:
	.align	2
.L1518:
	.word	.LANCHOR0+1088
	.word	.LC181
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
	bhi	.L1526
	ldr	r3, .L1527
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #440]
	ldmfd	sp, {fp, sp, pc}
.L1526:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.24
.L1528:
	.align	2
.L1527:
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
	beq	.L1531
	cmp	r5, #1
	moveq	r2, #3
	movne	r2, #4
.L1531:
	cmp	r4, #31
	bhi	.L1543
	ldr	r7, .L1544
	ldr	r3, [r7, r4, asl #2]
	cmp	r3, #0
	strne	r2, [r3, #440]
.L1534:
	ldr	r3, .L1544+4
	ldr	r6, [r3, #-520]
	cmp	r6, #0
	beq	.L1535
	sub	r2, fp, #28
	mov	r3, #4
	mov	r1, #115
	mov	r0, r4
	str	r5, [r2, #-4]!
	blx	r6
.L1535:
	ldr	ip, [r7, r4, asl #2]
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L1544+8
	mov	r0, #1
	ldr	ip, [ip, #440]
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1543:
	bl	VCTRL_SetLastFrameState.part.24
	ldr	r7, .L1544
	b	.L1534
.L1545:
	.align	2
.L1544:
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC182
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
	bhi	.L1573
	ldr	r3, .L1576
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1574
	add	r2, r3, #294912
	ldr	r2, [r2, #1552]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L1566
.L1552:
	.word	.L1551
	.word	.L1553
	.word	.L1554
	.word	.L1555
	.word	.L1566
	.word	.L1556
	.word	.L1557
	.word	.L1566
	.word	.L1558
	.word	.L1559
	.word	.L1560
	.word	.L1560
	.word	.L1560
	.word	.L1561
	.word	.L1566
	.word	.L1562
	.word	.L1563
	.word	.L1564
.L1566:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r1, .L1576+4
	mov	r0, #2
	bl	dprint_vfmw
	mvn	r0, #0
.L1548:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1564:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	VP9DEC_GetRemainImg
	mov	r4, r0
.L1550:
	cmn	r4, #1
	beq	.L1566
	cmp	r4, #0
	bne	.L1575
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r1, .L1576+8
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1551:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	H264DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1554:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	MPEG4DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1555:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	MPEG2DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1553:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	VC1DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1556:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	DIVX3DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1557:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	AVSDEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1558:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	REAL8DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1559:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	REAL9DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1560:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	VP6DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1561:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	VP8DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1562:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	MVC_DEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1563:
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	HEVCDEC_GetRemainImg
	mov	r4, r0
	b	.L1550
.L1575:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	sub	r2, r4, #2
	ldr	r1, .L1576+12
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1573:
	ldr	ip, .L1576+16
	movw	r3, #7212
	ldr	r2, .L1576+20
	mov	r0, #0
	ldr	r1, .L1576+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1548
.L1574:
	ldr	ip, .L1576+28
	mov	r0, r3
	ldr	r2, .L1576+20
	movw	r3, #7213
	ldr	r1, .L1576+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1548
.L1577:
	.align	2
.L1576:
	.word	.LANCHOR1
	.word	.LC183
	.word	.LC184
	.word	.LC185
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
	ldr	r5, .L1618
	mov	r4, r0
	ldr	ip, [r5, r0, asl #2]
	cmp	ip, #0
	beq	.L1611
	ldr	r0, [ip, #600]
	ldr	r6, [ip, #1240]
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L1578
.L1582:
	.word	.L1581
	.word	.L1583
	.word	.L1584
	.word	.L1585
	.word	.L1578
	.word	.L1586
	.word	.L1587
	.word	.L1578
	.word	.L1588
	.word	.L1589
	.word	.L1590
	.word	.L1590
	.word	.L1590
	.word	.L1591
	.word	.L1578
	.word	.L1592
	.word	.L1593
	.word	.L1594
.L1593:
	movw	r0, #34328
	str	r3, [sp, #4]
	str	r6, [sp]
	mov	r3, r2
	movt	r0, 4
	mov	r2, #1
	add	r0, ip, r0
	ldr	r7, .L1618
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #294912
	ldrb	r3, [r3, #1569]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1612
.L1597:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #294912
	strne	r2, [r3, #3952]
.L1578:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1594:
	movw	r0, #34328
	mov	r2, r6
	movt	r0, 4
	add	r0, ip, r0
	bl	VP9DEC_VDMPostProc
	cmp	r6, #1
	bne	.L1610
	b	.L1578
.L1581:
	movw	r0, #34328
	str	r3, [sp, #4]
	str	r6, [sp]
	mov	r3, r2
	movt	r0, 4
	mov	r2, #1
	add	r0, ip, r0
	ldr	r7, .L1618
	bl	H264DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #307200
	ldrb	r3, [r3, #2832]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1613
.L1595:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #294912
	strne	r2, [r3, #1920]
	b	.L1578
.L1584:
	movw	r0, #34328
	ldr	r6, .L1618
	movt	r0, 4
	add	r0, ip, r0
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #315392
	ldrb	r2, [r2, #4092]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1614
.L1600:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #2596]
	b	.L1578
.L1585:
	movw	r0, #34328
	movt	r0, 4
	add	r0, ip, r0
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1618
	add	r2, r3, #385024
	ldrb	r2, [r2, #530]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1615
.L1602:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #1564]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1583:
	movw	r0, #34328
	movt	r0, 4
	add	r0, ip, r0
	bl	VC1DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1618
	add	r2, r3, #307200
	ldrb	r2, [r2, #2015]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1602
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #307200
	strb	r1, [r2, #2015]
	b	.L1602
.L1586:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetSwitchRounding
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	DIVX3DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #1564]
	b	.L1578
.L1587:
	movw	r0, #34328
	movt	r0, 4
	add	r0, ip, r0
	bl	AVSDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1618
	add	r3, r3, #294912
	ldrb	r2, [r3, #1560]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1616
.L1601:
	mov	r2, #0
	str	r2, [r3, #1576]
	b	.L1578
.L1588:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetMb0QpInCurrPic
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	REAL8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #1564]
	b	.L1578
.L1589:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetMb0QpInCurrPic
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	movw	r0, #34328
	movt	r0, 4
	add	r0, r3, r0
	bl	REAL9DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #1564]
	b	.L1578
.L1590:
	movw	r0, #34328
	movt	r0, 4
	add	r0, ip, r0
	bl	VP6DEC_VDMPostProc
.L1610:
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #1564]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1592:
	movw	r0, #34328
	mov	r2, #1
	movt	r0, 4
	add	r0, ip, r0
	bl	MVC_DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r6, .L1618
	add	r3, r3, #294912
	ldrb	r2, [r3, #1561]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1617
.L1603:
	mov	r2, #0
	str	r2, [r3, #1788]
	b	.L1578
.L1591:
	movw	r0, #34328
	movt	r0, 4
	add	r0, ip, r0
	bl	VP8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #1564]
	b	.L1578
.L1611:
	ldr	lr, .L1618+4
	mov	r0, ip
	movw	r3, #4215
	ldr	r2, .L1618+8
	ldr	r1, .L1618+12
	str	lr, [sp]
	bl	dprint_vfmw
	b	.L1578
.L1614:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #315392
	strb	r1, [r2, #4092]
	b	.L1600
.L1615:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #385024
	strb	r1, [r2, #530]
	b	.L1602
.L1617:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #294912
	mov	r3, r2
	strb	r1, [r2, #1561]
	b	.L1603
.L1616:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #294912
	mov	r3, r2
	strb	r1, [r2, #1560]
	b	.L1601
.L1613:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #307200
	strb	r2, [r3, #2832]
	b	.L1595
.L1612:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	strb	r2, [r3, #1569]
	b	.L1597
.L1619:
	.align	2
.L1618:
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
	ldrhi	ip, .L1630
	movwhi	r3, #4403
	bhi	.L1628
	ldr	ip, .L1630+4
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L1629
	ldr	ip, [ip, #8]
	cmp	ip, #1
	beq	.L1624
	ldr	ip, .L1630+8
	movw	r3, #4405
.L1628:
	ldr	r2, .L1630+12
	mov	r0, #0
	ldr	r1, .L1630+16
	str	ip, [sp]
	bl	dprint_vfmw
.L1620:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1624:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1620
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_PostProc
.L1629:
	ldr	lr, .L1630+20
	mov	r0, ip
	movw	r3, #4404
	ldr	r2, .L1630+12
	ldr	r1, .L1630+16
	str	lr, [sp]
	bl	dprint_vfmw
	b	.L1620
.L1631:
	.align	2
.L1630:
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
	bhi	.L1636
	add	r1, r1, #2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_ReportLastFrame
.L1636:
	ldr	ip, .L1637
	movw	r3, #7338
	ldr	r2, .L1637+4
	mov	r0, #0
	ldr	r1, .L1637+8
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1638:
	.align	2
.L1637:
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
	b	.L1640
.L1642:
	.word	.L1641
	.word	.L1643
	.word	.L1644
	.word	.L1645
	.word	.L1646
	.word	.L1647
	.word	.L1648
.L1648:
	cmp	r0, #1
	moveq	r0, #1
	movne	r0, #7
	ldmfd	sp, {fp, sp, pc}
.L1641:
	cmp	r0, #1
	moveq	r0, #0
	movne	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L1643:
	cmp	r0, #1
	moveq	r0, #2
	movne	r0, #8
	ldmfd	sp, {fp, sp, pc}
.L1644:
	cmp	r0, #1
	moveq	r0, #4
	movne	r0, #10
	ldmfd	sp, {fp, sp, pc}
.L1645:
	cmp	r0, #1
	moveq	r0, #3
	movne	r0, #9
	ldmfd	sp, {fp, sp, pc}
.L1646:
	cmp	r0, #1
	moveq	r0, #5
	movne	r0, #11
	ldmfd	sp, {fp, sp, pc}
.L1647:
	cmp	r0, #1
	moveq	r0, #13
	movne	r0, #12
	ldmfd	sp, {fp, sp, pc}
.L1640:
	mov	r3, r1
	movw	r2, #7822
	ldr	r1, .L1657
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #13
	ldmfd	sp, {fp, sp, pc}
.L1658:
	.align	2
.L1657:
	.word	.LC186
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
	beq	.L1667
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L1662
	mov	r1, r0
	mov	r2, #0
	mov	r0, r8
	bl	FSP_ClearLogicFs
	mov	r0, #0
.L1661:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1662:
	ldr	r0, [r5, #48]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L1668
.L1663:
	mov	r1, r7
	mov	r0, r8
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L1669
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
	ldr	ip, .L1671
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
	beq	.L1670
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
	ldr	r3, .L1671+4
	str	r4, [sp]
	movw	r2, #34328
	mov	r1, r9
	movt	r2, 4
	ldr	ip, [r3, r8, asl #2]
	mov	r0, r8
	add	r3, ip, #294912
	add	r2, ip, r2
	add	r3, r3, #1568
	bl	InsertImgToVoQueue
	cmp	r0, #1
	moveq	r0, r6
	beq	.L1661
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
	b	.L1661
.L1668:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	bne	.L1663
	ldr	r2, [r5, #48]
	ldr	r1, .L1671+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1661
.L1667:
	ldr	r2, [r5, #40]
	mov	r0, #0
	ldr	r1, .L1671+12
	bl	dprint_vfmw
	mov	r0, r7
	b	.L1661
.L1670:
	mov	r2, r0
	ldr	r1, .L1671+16
	mov	r0, r9
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1661
.L1669:
	movw	r2, #4698
	ldr	r1, .L1671+20
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1661
.L1672:
	.align	2
.L1671:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC188
	.word	.LC187
	.word	.LC190
	.word	.LC189
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
	ldr	r5, .L1685
	mov	r4, r0
	mov	r3, r1
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	ldreq	ip, .L1685+4
	movweq	r3, #4838
	beq	.L1681
	cmp	r3, #0
	beq	.L1682
	ldr	r2, [r0, #600]
	cmp	r2, #20
	bne	.L1683
	ldr	r3, .L1685+8
	mov	r2, #72
	add	r0, r0, #528
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r1, [r5, r4, asl #2]
	mov	r0, r4
	add	r1, r1, #528
	bl	VDH_PutUsrdecFrame
	cmp	r0, #0
	bne	.L1684
.L1675:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1683:
	ldr	r1, .L1685+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1675
.L1684:
	ldr	r1, .L1685+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1675
.L1682:
	ldr	ip, .L1685+20
	mov	r0, r3
	movw	r3, #4839
.L1681:
	ldr	r2, .L1685+24
	ldr	r1, .L1685+28
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1675
.L1686:
	.align	2
.L1685:
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC192
	.word	.LC193
	.word	.LC191
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
	beq	.L1689
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_CanBeDecodedByHardWare.part.26
.L1689:
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
	ldrhi	r1, .L1739
	bhi	.L1729
	ldr	r5, .L1739+4
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L1730
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L1696
	ldr	r0, [r0, #600]
	cmp	r0, #22
	beq	.L1696
	cmp	r0, #4
	cmpne	r0, #7
	moveq	r7, #1
	movne	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r4, r7
.L1702:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L1701
	ldr	r3, [r5, r4, asl #2]
	ldr	r0, [r3, #600]
	cmp	r0, #4
	cmpne	r0, #7
	beq	.L1701
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	r0, #0
	addne	r7, r7, #1
.L1701:
	add	r4, r4, #1
	cmp	r4, #32
	bne	.L1702
	cmp	r7, #1
	beq	.L1731
.L1703:
	ldr	r3, .L1739+8
	mov	r1, #0
	add	r0, r3, #128
.L1710:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1709
	ldr	r2, [r2, #600]
	cmp	r2, #6
	moveq	r1, #1
.L1709:
	cmp	r3, r0
	bne	.L1710
	cmp	r1, #1
	beq	.L1732
.L1711:
	ldr	r3, [r5, r6, asl #2]
	ldr	r3, [r3, #600]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, .L1739+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1733
	ldr	r3, .L1739+16
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L1696:
	ldr	r1, .L1739+20
	movw	r2, #7883
.L1729:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1731:
	ldr	r4, .L1739+12
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1734
	mov	r0, r7
	mov	r1, #0
	bl	VDH_Need_Module
.L1706:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1707
	ldr	r3, .L1739+16
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L1735
	mov	r0, #0
	blx	r3
	b	.L1703
.L1732:
	ldr	r3, .L1739+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1736
	mov	r1, #0
	mov	r0, #3
	bl	VDH_Need_Module
	b	.L1711
.L1736:
	ldr	r3, .L1739+16
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1737
	mov	r0, #0
	blx	r3
	b	.L1711
.L1734:
	ldr	r3, .L1739+16
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1738
	mov	r0, #0
	blx	r3
	b	.L1706
.L1730:
	movw	r2, #7877
	ldr	r1, .L1739+24
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1733:
	mov	r1, #0
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Need_Module
.L1707:
	mov	r1, #0
	mov	r0, r1
	bl	VDH_Need_Module
	b	.L1703
.L1735:
	mov	r0, r3
	movw	r2, #7932
	ldr	r1, .L1739+28
	bl	dprint_vfmw
	b	.L1703
.L1737:
	mov	r0, r3
	movw	r2, #7963
	ldr	r1, .L1739+28
	bl	dprint_vfmw
	b	.L1711
.L1738:
	mov	r0, r3
	movw	r2, #7918
	ldr	r1, .L1739+28
	bl	dprint_vfmw
	b	.L1706
.L1740:
	.align	2
.L1739:
	.word	.LC194
	.word	.LANCHOR1
	.word	.LANCHOR1-4
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC196
	.word	.LC195
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
	ldrhi	ip, .L1755
	movwhi	r3, #2484
	bhi	.L1752
	ldr	r4, .L1755+4
	ldr	r3, [r4, r0, asl #2]
	cmp	r3, #0
	beq	.L1753
	ldr	r6, [r3, #4]
	cmp	r6, #1
	bne	.L1754
	ldr	r3, [r3, #600]
	cmp	r3, #22
	ldreq	ip, .L1755+8
	movweq	r3, #2487
	beq	.L1752
	bl	SM_Start
	ldr	r3, [r4, r5, asl #2]
	mov	r2, #0
	add	r1, r3, #294912
	str	r6, [r1, #1548]
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
	bne	.L1747
	ldr	r3, .L1755+12
	sub	r0, r4, #4
	ldr	r1, .L1755+16
	add	lr, r3, #128
	str	r6, [r2, #20]
.L1750:
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
	bne	.L1750
	ldr	r0, .L1755+12
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1747:
	ldr	r4, .L1755+20
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r2, #12
	ldr	r3, [r4, #48]
	mov	r1, #0
	ldr	r0, .L1755+24
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #720
	mov	r1, #0
	ldr	r0, .L1755+28
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #2
	mov	r1, #0
	ldr	r0, .L1755+32
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #120
	mov	r1, #0
	ldr	r0, .L1755+36
	blx	r3
	mov	r0, #0
.L1743:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1754:
	ldr	ip, .L1755+40
	movw	r3, #2486
.L1752:
	ldr	r2, .L1755+44
	mov	r0, #0
	ldr	r1, .L1755+48
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1743
.L1753:
	ldr	ip, .L1755+52
	mov	r0, r3
	ldr	r2, .L1755+44
	movw	r3, #2485
	ldr	r1, .L1755+48
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1743
.L1756:
	.align	2
.L1755:
	.word	.LC65
	.word	.LANCHOR1
	.word	.LC197
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
	ldr	r1, .L1758
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L1759:
	.align	2
.L1758:
	.word	.LC198
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
	ldr	r5, .L1822
	mov	r8, #0
	str	r0, [fp, #-48]
	mov	r7, r8
	add	r9, r5, #128
	mov	r1, r8
	b	.L1770
.L1812:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L1809
.L1766:
	cmp	r8, #0
	cmpeq	r6, #6
	bne	.L1761
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L1810
.L1761:
	cmp	r5, r9
	beq	.L1811
.L1770:
	ldr	r4, [r5, #4]!
	cmp	r4, #0
	beq	.L1761
	cmp	r1, #0
	ldr	r6, [r4, #600]
	beq	.L1812
	cmp	r7, #0
	cmpeq	r6, #1
	bne	.L1766
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L1761
	ldr	r10, [r4, #8]
.L1789:
	cmp	r10, #1
	moveq	r7, #1
	cmp	r8, #0
	cmpeq	r6, #6
	bne	.L1761
.L1790:
	cmp	r10, #1
	moveq	r8, #1
	cmp	r5, r9
	bne	.L1770
.L1811:
	cmp	r1, #0
	beq	.L1813
.L1771:
	cmp	r8, #0
	bne	.L1783
	ldr	r3, .L1822+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1814
	mov	r1, r8
	mov	r0, #3
	bl	VDH_UnNeed_Module
.L1783:
	cmp	r7, #0
	bne	.L1760
.L1819:
	ldr	r3, .L1822+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1815
	ldr	r3, .L1822+8
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1760
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L1810:
	ldr	r10, [r4, #8]
	b	.L1790
.L1809:
	ldr	r10, [r4, #8]
	cmp	r10, #1
	beq	.L1816
.L1765:
	cmp	r7, #0
	cmpeq	r6, #1
	beq	.L1789
	b	.L1766
.L1816:
	cmp	r6, #7
	cmpne	r6, #4
	beq	.L1765
	mov	r0, r6
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	adds	r1, r0, #0
	movne	r1, #1
	b	.L1765
.L1813:
	ldr	r4, .L1822+4
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1776
	ldr	r5, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r0, r5
	bl	SCDDRV_ResetSCD
	mov	r0, r5
	bl	VDMDRV_ResetVDH
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r1, [fp, #-52]
	cmp	r3, #1
	beq	.L1776
	mov	r0, #1
	bl	VDH_UnNeed_Module
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1779
.L1821:
	ldr	r3, .L1822+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L1817
	mov	r0, #0
	blx	r3
.L1782:
	mov	r0, #0
	bl	SCDDRV_SetStateIdle
	b	.L1771
.L1814:
	ldr	r3, .L1822+8
	mov	r0, r8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L1818
	blx	r3
	cmp	r7, #0
	beq	.L1819
.L1760:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1815:
	mov	r1, r7
	mov	r0, #2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_UnNeed_Module
.L1776:
	ldr	r3, .L1822+8
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L1820
	mov	r0, #0
	blx	r3
.L1778:
	mov	r0, #0
	bl	VDMDRV_SetStateIdle
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1821
.L1779:
	mov	r1, #0
	mov	r0, r1
	bl	VDH_UnNeed_Module
	b	.L1771
.L1817:
	mov	r0, r3
	movw	r2, #8057
	ldr	r1, .L1822+12
	bl	dprint_vfmw
	b	.L1782
.L1818:
	movw	r2, #8075
	ldr	r1, .L1822+12
	bl	dprint_vfmw
	b	.L1783
.L1820:
	mov	r0, r3
	movw	r2, #8042
	ldr	r1, .L1822+12
	bl	dprint_vfmw
	b	.L1778
.L1823:
	.align	2
.L1822:
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
	bhi	.L1830
	ldr	r6, .L1832
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1831
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L1829
	str	r2, [r3, #24]
	mov	r3, #0
	ldr	r2, [r6, r0, asl #2]
	str	r3, [r2, #12]
	ldr	r2, [r6, r0, asl #2]
	str	r3, [r2, #8]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1829
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
.L1826:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1829:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1830:
	ldr	ip, .L1832+4
	movw	r3, #2571
	ldr	r2, .L1832+8
	mov	r0, #0
	ldr	r1, .L1832+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1826
.L1831:
	ldr	ip, .L1832+16
	mov	r0, r3
	ldr	r2, .L1832+8
	movw	r3, #2572
	ldr	r1, .L1832+12
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1826
.L1833:
	.align	2
.L1832:
	.word	.LANCHOR1
	.word	.LC65
	.word	.LANCHOR0+1572
	.word	.LC0
	.word	.LC199
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
	ldr	r5, .L1841
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1836
.L1840:
	add	r4, r4, #1
	ldr	r3, [r8, #120]
	blx	r3
	cmp	r4, #50
	beq	.L1838
.L1836:
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
	bne	.L1840
	cmp	r4, #49
	bgt	.L1838
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1838:
	ldr	r1, .L1841+4
	mvn	r6, #0
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1842:
	.align	2
.L1841:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC200
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
	bhi	.L1869
	ldr	r6, .L1875
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1870
	ldr	r2, [r1]
	cmp	r2, #1
	bhi	.L1871
	ldr	r9, .L1875+4
	mov	r5, #0
	ldr	r7, [r3, #8]
	bl	VCTRL_StopChan
	ldr	r2, [r6, r4, asl #2]
	mov	r3, r4, asl #6
	ldr	r0, .L1875+8
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
	movw	r1, #34328
	movt	r1, 4
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
	addeq	r2, r3, #294912
	streq	r5, [r3, #1560]
	streq	r5, [r2, #1484]
	ldr	r3, [r3, #600]
	cmp	r3, #20
	beq	.L1849
	ldr	r3, [r8, #8]
	cmp	r3, #0
	beq	.L1872
.L1849:
	bl	FSP_EmptyInstance
.L1850:
	mov	r0, r4
	bl	InitUsdPool
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L1873
.L1851:
	ldr	r2, [r6, #1052]
	ldr	r3, .L1875
	cmp	r2, #0
	beq	.L1852
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-48]
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1854
	mov	r0, #512
	sub	r1, fp, #48
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1854
	sub	r1, fp, #48
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1854:
	ldr	r1, .L1875+12
	mov	r0, #32
	bl	dprint_vfmw
.L1852:
	cmp	r7, #0
	bne	.L1874
.L1856:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1845:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1873:
	mov	r0, r4
	bl	SM_Reset
	b	.L1851
.L1874:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1856
.L1872:
	bl	FSP_ResetInstance
	b	.L1850
.L1871:
	movw	r2, #3151
	ldr	r1, .L1875+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1845
.L1869:
	ldr	ip, .L1875+20
	movw	r3, #3146
	ldr	r2, .L1875+24
	mov	r0, #0
	ldr	r1, .L1875+28
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1845
.L1870:
	ldr	ip, .L1875+32
	mov	r0, r3
	ldr	r2, .L1875+24
	movw	r3, #3147
	ldr	r1, .L1875+28
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1845
.L1876:
	.align	2
.L1875:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-4
	.word	.LC202
	.word	.LC201
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
	bhi	.L1899
	ldr	r6, .L1903
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1900
	ldr	r8, [r3, #8]
	bl	VCTRL_StopChan
	ldr	r7, .L1903+4
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
	beq	.L1901
.L1881:
	mov	r3, r4, asl #6
	ldr	r0, .L1903+8
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
	add	r2, r3, #294912
	add	lr, r3, #672
	add	ip, r3, #688
	strd	r0, [lr]
	strd	r0, [ip, #-8]
	mov	r0, r4
	str	r5, [r3, #1168]
	str	r5, [r2, #1512]
	str	r5, [r2, #1504]
	str	r5, [r2, #1508]
	ldr	r1, [r3, #1504]
	str	r5, [r3, #1596]
	cmp	r1, #1
	streq	r5, [r3, #1560]
	streq	r5, [r2, #1484]
	ldr	r3, [r3, #600]
	cmp	r3, #20
	beq	.L1883
	bl	FSP_ResetInstance
.L1884:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	InitUsdPool
	mov	r0, r4
	bl	SM_Reset
	ldr	r2, [r6, #1052]
	ldr	r3, .L1903
	cmp	r2, #0
	beq	.L1885
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-40]
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1887
	mov	r0, #512
	sub	r1, fp, #40
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #1464]
	cmp	r3, #0
	beq	.L1887
	sub	r1, fp, #40
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1887:
	ldr	r1, .L1903+12
	mov	r0, #32
	bl	dprint_vfmw
.L1885:
	cmp	r8, #0
	bne	.L1902
.L1889:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1879:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1902:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1889
.L1883:
	bl	FSP_EmptyInstance
	b	.L1884
.L1901:
	add	r2, r3, #294912
	ldr	r1, [r3, #600]
	ldr	r2, [r2, #1552]
	cmp	r2, r1
	bne	.L1881
	str	r5, [r3, #12]
	mov	r0, r4
	bl	VCTRL_FindOccupiedFrame
	b	.L1881
.L1899:
	ldr	ip, .L1903+16
	movw	r3, #3489
	ldr	r2, .L1903+20
	mov	r0, #0
	ldr	r1, .L1903+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1879
.L1900:
	ldr	ip, .L1903+28
	mov	r0, r3
	ldr	r2, .L1903+20
	movw	r3, #3490
	ldr	r1, .L1903+24
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1879
.L1904:
	.align	2
.L1903:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-4
	.word	.LC202
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
	ldr	r7, .L2060
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
	beq	.L2041
	ldr	r3, [r8, #36]
	cmp	r3, #0
	blt	.L1908
	ldr	r3, [r8, #12]
	cmp	r3, #31
	ble	.L1908
	ldr	r3, [r8, #16]
	cmp	r3, #31
	ble	.L1908
	ldr	r3, [r8, #56]
	cmp	r3, #262144
	blt	.L1908
	ldr	r2, [r8, #44]
	cmp	r2, #1
	beq	.L2042
	cmp	r2, #2
	bne	.L1910
	ldr	r3, [r8, #20]
	cmp	r3, #0
	ble	.L1908
	ldr	r3, [r8, #24]
	cmp	r3, #0
	ble	.L1908
.L2034:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	ble	.L1908
	ldr	r3, [r8, #32]
	cmp	r3, #0
	bgt	.L1910
.L1908:
	ldr	r1, .L2060+4
	mov	r0, #0
	bl	dprint_vfmw
.L1907:
	mvn	r0, #0
.L2026:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1910:
	ldr	r3, [r8, #216]
	movw	ip, #14824
	mov	r4, #1
	movt	ip, 12
	cmp	r3, #1
	sub	r2, fp, #292
	movw	lr, #63096
	mov	r1, r8
	movhi	r3, #0
	strhi	r3, [r8, #216]
	mov	r3, r5
	ldr	r5, [fp, #-320]
	str	r4, [r8, #240]
	movt	lr, 177
	cmp	r5, #26
	str	r4, [r8, #244]
	mov	r0, r5
	movne	lr, ip
	str	lr, [fp, #-324]
	bl	VCTRL_GetChanMemSize
	cmp	r0, #0
	bne	.L2043
	ldr	r6, .L2060+8
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L1979
	mov	r3, r6
.L1916:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1915
	add	r4, r4, #1
	cmp	r4, #32
	bne	.L1916
	ldr	r3, [r8, #252]
	cmp	r3, #1
	beq	.L1975
.L1969:
	mov	r2, #32
	ldr	r1, .L2060+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2026
.L2042:
	ldr	r3, [r8, #20]
	cmp	r3, #0
	bgt	.L2034
	b	.L1908
.L2043:
	movw	r2, #2167
	ldr	r1, .L2060+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2026
.L2041:
	mov	r0, r8
	ldr	r1, .L2060+20
	bl	dprint_vfmw
	b	.L1907
.L1979:
	mov	r4, r3
.L1915:
	ldr	r3, [r8, #252]
	cmp	r3, #1
	beq	.L1975
.L1918:
	cmp	r4, #31
	bhi	.L1969
	ldr	r3, .L2060+24
	mov	r5, #0
	add	r1, r3, #128
.L1920:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r5, r5, #1
	cmp	r3, r1
	bne	.L1920
	cmp	r5, #0
	bne	.L1977
	mov	r3, #3
	mov	r0, #15
	str	r3, [r6, #172]
	ldr	r10, [r7, #68]
	bl	VFMW_GetString
	mov	r3, r5
	mov	r1, #20
	ldr	r9, .L2060+8
	mov	r2, r0
	sub	r0, fp, #276
	blx	r10
	ldr	r3, .L2060+28
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L1922
	blx	r3
	subs	r10, r0, #0
	ble	.L1922
	str	r5, [sp]
	add	r3, r9, #152
	mov	r2, r10
	mov	r1, r5
	sub	r0, fp, #276
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1923
	ldr	r2, [r9, #168]
	sub	r10, fp, #256
	ldr	r1, [r9, #156]
	ldr	r0, [r9, #160]
	bl	MEM_AddMemRecord
	ldr	r3, .L2060
	mov	r2, #20
	mov	r1, r5
	mov	r0, r10
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, .L2060+28
	ldr	r1, [r9, #160]
	ldr	r2, [r9, #168]
	ldr	r3, [r3, #56]
	str	r5, [fp, #-248]
	cmp	r3, #0
	str	r1, [fp, #-256]
	str	r2, [fp, #-252]
	beq	.L1924
	mov	r0, r10
	blx	r3
	cmp	r0, #0
	bne	.L1924
	mov	r3, #3
	str	r3, [r9, #220]
	ldr	r3, .L2060
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
	mov	r2, #16384
	sub	r0, fp, #276
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1925
	ldr	r2, [r9, #216]
	ldr	r1, [r9, #204]
	ldr	r0, [r9, #208]
	bl	MEM_AddMemRecord
	ldr	r1, .L2060
	ldr	r2, [r9, #208]
	mov	r0, #17
	ldr	r3, .L2060+32
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
	mov	r2, #716800
	mov	r1, r5
	str	ip, [r9, #196]
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L2044
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
	bne	.L2045
.L1921:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldrd	r2, [r8, #128]
	ldr	r1, .L2060
	orrs	r3, r2, r3
	beq	.L1931
	ldr	r3, [r8, #136]
	cmp	r3, #0
	bne	.L1932
.L1931:
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
	bne	.L2046
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
.L1935:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldrd	r2, [r8, #80]
	ldr	r1, .L2060
	orrs	r3, r2, r3
	beq	.L1970
	ldr	r3, [r8, #88]
	cmp	r3, #0
	bne	.L1937
.L1970:
	ldr	r3, [r8, #216]
	cmp	r3, #1
	beq	.L1938
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
	bne	.L2047
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
.L1942:
	ldr	r3, [fp, #-288]
	cmp	r3, #0
	bne	.L2032
.L1952:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldr	r3, [fp, #-280]
	cmp	r3, #0
	ble	.L1960
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
	bne	.L2048
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
.L1960:
	ldr	r3, [r7, #48]
	mov	r1, #0
	mov	r2, #24
	mov	r0, r10
	blx	r3
	ldr	r3, [r8, #192]
	ldr	r1, .L2060
	cmp	r3, #0
	beq	.L1961
	ldr	r2, [r8, #208]
	cmp	r2, #0
	beq	.L1961
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
.L1961:
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
	ldr	r1, .L2060+36
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
	ldr	r10, .L2060+8
	str	lr, [r3, #32]
	ldr	r3, [r6, r4, asl #2]
	add	lr, r3, #294912
	str	r2, [r3, #600]
	str	r2, [lr, #1552]
	str	r5, [r3, #28]
	ldr	r3, [r6, r4, asl #2]
	ldr	r9, [r8, #248]
	add	lr, r3, #294912
	add	r2, r3, #1600
	add	r2, r2, #8
	str	r2, [r1, r4, asl #3]
	str	r9, [lr, #1528]
	add	r1, r3, #262144
	str	ip, [r3, #1600]
	add	r1, r1, #2048
	ldr	r2, [r8, #240]
	ldr	r9, .L2060
	str	r2, [r3, #1680]
	ldr	r2, [r8, #244]
	str	r2, [r3, #1684]
	bl	FSP_EnableInstance
	subs	r2, r0, #0
	bne	.L2049
	mov	r0, r4
	mov	r9, r2
	str	r2, [fp, #-320]
	bl	VCTRL_ResetChan
	ldr	r3, [r10, r4, asl #2]
	ldr	r2, [fp, #-320]
	ldr	lr, [fp, #-308]
	add	r1, r3, #290816
	ldr	ip, [fp, #-304]
	ldr	r0, [fp, #-300]
	str	lr, [r3, #356]
	str	ip, [r3, #360]
	str	r0, [r3, #364]
	add	r3, r3, #294912
	str	r2, [r1, #1436]
	str	r2, [r1, #1440]
	str	r2, [r1, #1448]
	str	r2, [r1, #1452]
	str	r2, [r1, #1444]
	str	r2, [r1, #1456]
	ldr	r1, [r8, #216]
	str	r2, [r3, #1484]
	str	r1, [r3, #1492]
	ldr	r1, [r8, #252]
	str	r2, [r3, #1548]
	str	r1, [r3, #1544]
.L1966:
	mov	r5, r9, asl #6
	ldr	r0, [r6, r4, asl #2]
	add	r5, r5, r9, lsl #3
	movw	r3, #30136
	movt	r3, 4
	add	r3, r5, r3
	add	r0, r0, r3
	mov	r2, #72
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	ldr	r1, [r6, r4, asl #2]
	add	r9, r9, #1
	movw	r3, #30136
	add	r5, r1, r5
	movt	r3, 4
	add	r0, r5, #290816
	add	r3, r5, r3
	cmp	r9, #32
	mov	r2, #255
	ldr	r5, .L2060+8
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r8, .L2060
	str	r2, [r0, #1472]
	bne	.L1966
	movw	r0, #32440
	ldr	r3, [r8, #48]
	mov	r2, #1248
	movt	r0, 4
	add	r0, r1, r0
	mov	r1, #0
	blx	r3
	ldr	r0, [r5, r4, asl #2]
	ldr	r3, [r8, #48]
	mov	r1, #0
	add	r0, r0, #294912
	mov	r2, #24
	add	r0, r0, #920
	mov	r6, r1
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	ldr	ip, [fp, #-156]
	ldr	lr, [fp, #-180]
	add	r7, r3, #262144
	ldr	r2, .L2060+40
	str	ip, [r3, #264]
	ldr	ip, [fp, #-52]
	add	r2, r2, r4, lsl #2
	ldr	r0, [fp, #-140]
	ldr	r1, [fp, #-132]
	ldr	r10, [fp, #-68]
	str	lr, [r3, #240]
	str	ip, [r3, #348]
	ldr	lr, [fp, #-60]
	ldr	ip, [fp, #-108]
	ldr	r9, [fp, #-124]
	str	r0, [r3, #292]
	str	r1, [r3, #288]
	ldr	r0, [fp, #-116]
	ldr	r1, [fp, #-188]
	str	r10, [r3, #340]
	str	lr, [r3, #336]
	ldr	r10, [fp, #-164]
	ldr	lr, [fp, #-148]
	str	ip, [r3, #312]
	str	r6, [r2, #2428]
	ldr	ip, [fp, #-100]
	ldr	r2, [fp, #-172]
	str	r9, [r3, #300]
	mov	r9, #32768
	str	ip, [r3, #324]
	str	r1, [r3, #244]
	str	r2, [r3, #252]
	str	r10, [r3, #268]
	str	lr, [r3, #276]
	str	r0, [r3, #316]
	str	r1, [r3, #396]
	str	r2, [r3, #400]
	add	r2, r0, #15
	str	r6, [r7, #2080]
	bic	r2, r2, #15
	str	r4, [r3]
	ldr	r1, [r5, r4, asl #2]
	str	ip, [r3, #392]
	add	r7, r1, #262144
	str	r6, [r3, #372]
	str	r6, [r3, #376]
	str	r10, [r3, #380]
	str	lr, [r3, #384]
	mov	lr, #131072
	str	r0, [r3, #388]
	mov	r0, r4
	str	lr, [r3, #424]
	str	r2, [r3, #404]
	str	r2, [r3, #412]
	str	r2, [r3, #420]
	mov	r2, #14848
	str	r9, [r3, #416]
	str	r2, [r3, #408]
	str	r4, [r1, #228]
	str	r4, [r1, #232]
	str	r4, [r7, #1820]
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
	add	r5, r5, #294912
	str	r0, [r5, #1500]
	mov	r0, r6
	blx	r3
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1977:
	mov	r3, #0
	sub	r10, fp, #256
	str	r3, [fp, #-328]
	b	.L1921
.L2032:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	mov	r0, r10
	blx	r3
	ldrd	r2, [r8, #104]
	ldr	r1, .L2060
	orrs	r3, r2, r3
	beq	.L1946
	ldr	r3, [r8, #96]
	cmp	r3, #0
	beq	.L1946
	ldr	r3, [r8, #112]
	cmp	r3, #0
	beq	.L1946
	ldr	r2, [fp, #-288]
	cmp	r3, r2
	bge	.L2050
.L2035:
	ldr	r3, [fp, #-164]
.L1949:
	cmp	r3, #0
	beq	.L1951
	ldrd	r2, [fp, #-156]
	orrs	r3, r2, r3
	beq	.L1951
	ldr	r2, [fp, #-148]
	ldr	r3, [fp, #-288]
	cmp	r2, r3
	bge	.L1952
.L1951:
	ldr	r3, [fp, #-300]
	cmp	r3, #1
	beq	.L2051
.L1953:
	ldr	r3, [fp, #-308]
	cmp	r3, #1
	beq	.L2052
.L1954:
	ldr	r2, .L2060+44
	mov	r0, #1
	ldr	r1, .L2060+48
	bl	dprint_vfmw
.L1955:
	ldr	r2, .L2060+52
	mov	r0, #1
	ldr	r1, .L2060+56
	bl	dprint_vfmw
	ldr	r3, [fp, #-328]
	cmp	r3, #1
	bne	.L1907
	bl	VCTRL_ReleaseHalMem
	mvn	r0, #0
	b	.L2026
.L1938:
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	str	r3, [fp, #-188]
	str	r3, [fp, #-172]
	str	r3, [fp, #-308]
	strd	r0, [fp, #-180]
	b	.L1942
.L1946:
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
	bne	.L1948
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
	b	.L1949
.L1932:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r8, #120
	sub	r0, fp, #140
	blx	r3
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-284]
	cmp	r2, r3
	blt	.L2053
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_AddMemRecord
	b	.L1935
.L1922:
	mov	r3, #0
	ldr	r2, .L2060+60
	mov	r0, r3
	ldr	r1, .L2060+64
	bl	dprint_vfmw
.L1928:
	bl	VCTRL_ReleaseHalMem
	ldr	r2, .L2060+52
	ldr	r1, .L2060+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2026
.L1948:
	ldr	ip, [fp, #-288]
	movw	r3, #1691
	ldr	r2, .L2060+44
	mov	r0, #1
	ldr	r1, .L2060+72
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-164]
	b	.L1949
.L1975:
	sub	r1, fp, #312
	mov	r0, #1
	bl	PDT_GetAttribute
	ldr	r3, [fp, #-312]
	cmp	r3, #1
	cmpne	r4, #15
	ble	.L1918
	mov	r2, r4
	ldr	r1, .L2060+76
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2026
.L1937:
	ldr	r3, [r1, #52]
	mov	r2, #24
	sub	r0, fp, #188
	add	r1, r8, #72
	blx	r3
	ldr	r3, [r8, #216]
	ldr	r2, [fp, #-172]
	cmp	r3, #1
	beq	.L1944
	ldr	r3, [fp, #-292]
	cmp	r2, r3
	blt	.L2054
.L1944:
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_AddMemRecord
	b	.L1942
.L2048:
	ldr	r3, [fp, #-300]
	cmp	r3, #1
	beq	.L2055
.L1957:
	ldr	r3, [fp, #-308]
	cmp	r3, #1
	beq	.L2056
.L1958:
	ldr	r3, [fp, #-304]
	cmp	r3, #1
	beq	.L2057
.L1959:
	movw	r2, #2079
	ldr	r1, .L2060+80
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1955
.L2047:
	ldr	r3, [fp, #-300]
	cmp	r3, #1
	beq	.L2058
.L1940:
	movw	r2, #1750
	ldr	r1, .L2060+84
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1955
.L2046:
	mov	r0, r5
	movw	r2, #1961
	ldr	r1, .L2060+88
	bl	dprint_vfmw
	b	.L1955
.L2049:
	mov	r2, r4
	ldr	r1, .L2060+92
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r10, r4, asl #2]
	movw	r2, #30136
	mov	r0, r4
	add	r1, r3, #294912
	movt	r2, 4
	ldr	ip, [r3, #364]
	add	r2, r3, r2
	ldr	lr, [r1, #1492]
	ldr	r6, [r1, #1528]
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
	b	.L2026
.L1924:
	mov	r2, #0
	ldr	r1, .L2060+96
	mov	r0, r2
	bl	dprint_vfmw
	b	.L1928
.L2050:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r8, #96
	sub	r0, fp, #164
	blx	r3
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-156]
	ldr	r0, [fp, #-164]
	bl	MEM_AddMemRecord
	b	.L2035
.L2044:
	mov	r2, #716800
	mov	r3, r5
	str	r2, [sp]
	mov	r0, r5
	ldr	r2, .L2060+60
	ldr	r1, .L2060+100
	bl	dprint_vfmw
	b	.L1928
.L2045:
	mov	r3, #0
	ldr	r2, .L2060+60
	mov	r0, r3
	ldr	r1, .L2060+104
	bl	dprint_vfmw
	b	.L1928
.L1925:
	mov	r2, #16384
	mov	r3, r5
	str	r2, [sp]
	mov	r0, r5
	ldr	r2, .L2060+60
	ldr	r1, .L2060+108
	bl	dprint_vfmw
	b	.L1928
.L1923:
	str	r10, [sp]
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L2060+60
	ldr	r1, .L2060+112
	bl	dprint_vfmw
	b	.L1928
.L2057:
	ldr	r1, [fp, #-156]
	ldr	r0, [fp, #-164]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-156]
	ldr	r0, [fp, #-164]
	bl	MEM_DelMemRecord
	b	.L1959
.L2058:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1940
.L2053:
	movw	r2, #1977
	ldr	r1, .L2060+116
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1955
.L2052:
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-172]
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_DelMemRecord
	b	.L1954
.L2051:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1953
.L2056:
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-172]
	ldr	r1, [fp, #-180]
	ldr	r0, [fp, #-188]
	bl	MEM_DelMemRecord
	b	.L1958
.L2055:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1957
.L2054:
	ldr	r1, [fp, #-300]
	cmp	r1, #1
	beq	.L2059
.L1945:
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r2
	ldr	r1, .L2060+120
	movw	r2, #1781
	bl	dprint_vfmw
	b	.L1955
.L2059:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-172]
	ldr	r3, [fp, #-292]
	b	.L1945
.L2061:
	.align	2
.L2060:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC135
	.word	.LANCHOR1
	.word	.LC206
	.word	.LC204
	.word	.LC203
	.word	.LANCHOR1-4
	.word	g_vdm_hal_fun_ptr
	.word	g_HwMem
	.word	s_SmIIS
	.word	.LANCHOR3
	.word	.LANCHOR0+1672
	.word	.LC219
	.word	.LANCHOR0+1652
	.word	.LC221
	.word	.LANCHOR0+1632
	.word	.LC207
	.word	.LC213
	.word	.LC218
	.word	.LC205
	.word	.LC220
	.word	.LC216
	.word	.LC214
	.word	.LC222
	.word	.LC209
	.word	.LC211
	.word	.LC212
	.word	.LC210
	.word	.LC208
	.word	.LC215
	.word	.LC217
	UNWIND(.fnend)
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	2
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	subs	r7, r1, #0
	mov	r4, r0
	ldreq	ip, .L2118
	moveq	r0, r7
	movweq	r3, #2789
	beq	.L2107
	cmp	r4, #31
	ldrhi	ip, .L2118+4
	movwhi	r3, #2790
	bhi	.L2108
	ldr	r8, .L2118+8
	ldr	r3, [r8, r4, asl #2]
	cmp	r3, #0
	beq	.L2109
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L2110
	bl	VCTRL_CheckChanWH
	subs	r5, r0, #0
	bne	.L2111
	ldr	r6, .L2118+12
	ldr	r1, .L2118+16
	bl	PDT_GetAttribute
	ldr	r2, [r7, #8]
	ldr	r3, [r6, #2576]
	cmp	r3, #21
	bhi	.L2070
	cmp	r3, r2
	beq	.L2071
	ldr	r0, .L2118+20
	add	r3, r6, #2576
.L2073:
	ldr	r1, [r3, #4]!
	cmp	r1, #21
	bhi	.L2070
	cmp	r1, r2
	beq	.L2071
	cmp	r3, r0
	bne	.L2073
.L2071:
	cmp	r2, #8
	mov	r3, #0
	str	r3, [fp, #-116]
	beq	.L2112
.L2074:
	cmp	r2, #9
	beq	.L2113
.L2093:
	cmp	r2, #5
	mov	r3, #0
	str	r3, [fp, #-116]
	beq	.L2114
.L2094:
	mov	r1, r7
	mov	r0, r4
	bl	VCTRL_CmpConfigParameter
	subs	r3, r0, #0
	beq	.L2115
	ldr	r6, .L2118+24
	mov	r2, #148
	ldr	r0, [r8, r4, asl #2]
	mov	r1, r7
	ldr	r9, .L2118+8
	ldr	r3, [r6, #52]
	add	r0, r0, #44
	blx	r3
	ldr	ip, [r7, #24]
	ldr	r3, [r8, r4, asl #2]
	mov	r2, #72
	sub	r0, fp, #116
	mov	r1, #0
	str	ip, [r3, #20]
	ldr	r3, [r8, r4, asl #2]
	ldr	ip, [r7, #8]
	str	ip, [r3, #600]
	ldr	ip, [r7, #100]
	str	ip, [r3, #1512]
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r3, [r8, r4, asl #2]
	ldr	r2, [r3, #380]
	cmp	r2, #0
	bne	.L2116
.L2081:
	ldr	r1, [r7, #84]
	mov	r2, #49152
	ldr	ip, [r7, #24]
	movt	r2, 63683
	ldr	r0, [r7, #8]
	cmp	r1, #1
	str	r2, [fp, #-96]
	addeq	r3, r3, #294912
	strb	ip, [fp, #-112]
	addne	r3, r3, #294912
	ldreq	ip, [r7, #92]
	movne	r2, #0
	str	r0, [fp, #-108]
	add	r10, r7, #12
	ldreq	r0, [r7, #96]
	mov	r9, #0
	ldreq	r2, [r7, #136]
	streq	ip, [fp, #-60]
	streq	r1, [fp, #-68]
	mov	r1, r10
	streq	r0, [fp, #-56]
	sub	r0, fp, #92
	str	r2, [r3, #1540]
	ldr	r3, [r7, #88]
	ldr	r2, [r7, #80]
	cmp	r3, #0
	str	r9, [fp, #-80]
	str	r9, [fp, #-76]
	movne	r3, #1
	str	r2, [fp, #-72]
	strne	r3, [fp, #-64]
	mov	r2, #12
	ldr	r3, [r6, #52]
	blx	r3
	sub	r1, fp, #116
	mov	r0, r4
	bl	SM_Config
	ldr	r3, [r6, #48]
	mov	r1, r9
	sub	r0, fp, #120
	mov	r2, #1
	blx	r3
	ldr	r3, [r7, #84]
	cmp	r3, #1
	beq	.L2117
.L2085:
	ldr	r3, [r8, r4, asl #2]
	mov	r9, #1
	ldr	r2, .L2118+28
	ldr	r1, [r3, #300]
	ldr	r0, [r3, #372]
	ldr	ip, [r3, #292]
	str	r1, [r3, #1204]
	ldr	r1, [r3, #376]
	str	r0, [r3, #624]
	ldr	r0, [r3, #404]
	str	r1, [r3, #628]
	ldr	r1, [r3, #408]
	str	r0, [r3, #640]
	ldr	r0, [r3, #412]
	str	r1, [r3, #644]
	ldr	r1, [r3, #416]
	str	r0, [r3, #648]
	ldr	r0, [r3, #420]
	str	r1, [r3, #652]
	ldr	r1, [r3, #424]
	str	ip, [r3, #1200]
	add	ip, r3, #294912
	str	r0, [r3, #656]
	str	r1, [r3, #660]
	ldr	r1, [r7, #28]
	ldr	r2, [r2, #72]
	str	r1, [r3, #612]
	cmp	r2, #7
	ldr	r1, [r7, #28]
	str	r1, [r3, #608]
	ldr	r1, [r7, #36]
	str	r1, [r3, #616]
	ldreq	r2, [r7, #40]
	str	r2, [r3, #632]
	mov	r2, #0
	ldr	r1, [r7, #44]
	str	r1, [r3, #620]
	mov	r1, r7
	ldr	r0, [r7, #132]
	str	r0, [r3, #1252]
	ldr	r0, [r7, #140]
	str	r9, [r3, #1256]
	str	r9, [r3, #1260]
	str	r0, [r3, #1588]
	ldr	r0, [r7, #72]
	rsb	r0, r9, r0
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r3, #1236]
	ldr	r0, [r7, #76]
	str	r0, [r3, #1240]
	ldr	r0, [r7, #48]
	str	r0, [r3, #1244]
	ldr	r0, [fp, #-76]
	str	r2, [r3, #1560]
	str	r2, [r3, #1580]
	str	r0, [r3, #1248]
	mov	r0, r4
	str	r2, [r3, #1596]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	strb	r3, [ip, #1488]
	bl	VCTRL_ConfigChanCompress
	ldr	r0, [r8, r4, asl #2]
	ldr	r3, [r6, #52]
	mov	r2, #12
	add	r0, r0, #1168
	mov	r1, r10
	add	r0, r0, #4
	ldr	r6, .L2118+8
	blx	r3
	ldr	ip, [r8, r4, asl #2]
	add	r3, ip, #294912
	ldr	r8, [ip, #600]
	ldr	r2, [r3, #1552]
	cmp	r2, r8
	beq	.L2087
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r7, #8]
	ldr	ip, [r6, r4, asl #2]
	cmp	r3, #20
	beq	.L2088
	ldr	r8, [ip, #600]
	add	r3, ip, #294912
.L2087:
	ldr	r2, .L2118+32
	ldr	r0, .L2118+36
	ldr	r1, .L2118+40
	add	lr, r2, #128
	str	r8, [r3, #1552]
.L2092:
	ldr	r3, [r2, #4]!
	add	r0, r0, #4
	add	r1, r1, #4
	cmp	r3, #0
	streq	r3, [r0, #-4]
	ldrne	ip, [r3, #20]
	strne	ip, [r0, #-4]
	ldrne	r3, [r3, #20]
	cmp	r2, lr
	str	r3, [r1, #-4]
	bne	.L2092
	ldr	r0, .L2118+36
	bl	VDMDRV_SetPriority
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2115:
	ldr	r1, .L2118+44
	mov	r5, r3
	bl	dprint_vfmw
.L2106:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2070:
	ldr	r1, .L2118+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r5, #0
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2116:
	ldr	r1, [r3, #384]
	cmp	r1, #15
	ble	.L2081
	mov	r0, r2
	str	r2, [fp, #-104]
	bl	MEM_Phy2Vir
	ldr	r3, [r9, r4, asl #2]
	str	r0, [fp, #-116]
	ldr	r2, [r3, #384]
	sub	r2, r2, #16
	str	r2, [fp, #-100]
	b	.L2081
.L2113:
	sub	r0, fp, #116
	bl	REAL9DEC_Support
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	ldrne	r2, [r7, #8]
	bne	.L2093
.L2075:
	mvn	r5, #0
	b	.L2106
.L2112:
	sub	r0, fp, #116
	bl	REAL8DEC_Support
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	beq	.L2075
	ldr	r2, [r7, #8]
	b	.L2074
.L2114:
	sub	r0, fp, #116
	bl	DIVX3DEC_Support
	ldr	r3, [fp, #-116]
	cmp	r3, #0
	bne	.L2094
	b	.L2075
.L2110:
	ldr	ip, .L2118+52
	movw	r3, #2792
.L2108:
	ldr	r2, .L2118+56
	mov	r0, #0
	ldr	r1, .L2118+60
	mvn	r5, #0
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2117:
	sub	r1, fp, #120
	mov	r0, r4
	strb	r3, [fp, #-120]
	bl	FSP_ConfigAttribute
	b	.L2085
.L2111:
	ldr	r1, .L2118+64
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r5, #0
	b	.L2106
.L2088:
	ldr	r3, [ip, #396]
	mov	r0, r4
	ldr	r2, [ip, #1304]
	ldr	r1, [ip, #1300]
	ldr	ip, [ip, #400]
	str	ip, [sp]
	bl	VCTRL_PartitionMemForStdUser
	cmp	r0, #0
	bne	.L2089
	ldr	ip, [r6, r4, asl #2]
	add	r3, ip, #294912
	ldr	r8, [ip, #600]
	b	.L2087
.L2109:
	ldr	ip, .L2118+68
	mov	r0, r3
	movw	r3, #2791
.L2107:
	ldr	r2, .L2118+56
	mvn	r5, #0
	ldr	r1, .L2118+60
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L2106
.L2089:
	mov	r0, r9
	ldr	r1, .L2118+72
	bl	dprint_vfmw
	mvn	r5, #0
	b	.L2106
.L2119:
	.align	2
.L2118:
	.word	.LC223
	.word	.LC100
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LANCHOR3+2556
	.word	.LANCHOR3+2700
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LANCHOR1-4
	.word	.LANCHOR3+2704
	.word	g_ChanCtx
	.word	.LC226
	.word	.LC225
	.word	.LC74
	.word	.LANCHOR0+1692
	.word	.LC0
	.word	.LC224
	.word	.LC101
	.word	.LC227
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
	ldr	r1, .L2124
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2124+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L2123
	mov	r2, r4
	ldr	r1, .L2124+8
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2123:
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-36]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2125:
	.align	2
.L2124:
	.word	.LC228
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC229
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
	ldr	r1, .L2128
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2128+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2126
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-136]
	bl	VCTRL_ConfigChan
.L2126:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2129:
	.align	2
.L2128:
	.word	.LC230
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
	ldr	r1, .L2134
	mov	r0, #32
	and	r5, r4, #7
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2134+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L2133
	mov	r2, r4
	ldr	r1, .L2134+8
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2133:
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-132]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2135:
	.align	2
.L2134:
	.word	.LC231
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC232
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
	ldr	r1, .L2138
	mov	r0, #32
	and	r5, r4, #3
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2138+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2136
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-128]
	bl	VCTRL_ConfigChan
.L2136:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2139:
	.align	2
.L2138:
	.word	.LC233
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
	ldr	r1, .L2142
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2142+4
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #168
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #168
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2140
	sub	r1, fp, #168
	mov	r0, r4
	str	r5, [fp, #-140]
	bl	VCTRL_ConfigChan
.L2140:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2143:
	.align	2
.L2142:
	.word	.LC234
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
	ldr	r1, .L2145
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2146:
	.align	2
.L2145:
	.word	.LC235
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
	ldr	r4, .L2169
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	cmp	r5, #31
	ldrhi	ip, .L2169+4
	movwhi	r3, #2377
	bhi	.L2164
	ldr	r6, .L2169+8
	ldr	r7, [r6, r5, asl #2]
	cmp	r7, #0
	beq	.L2165
	ldr	r8, [r7, #4]
	cmp	r8, #1
	bne	.L2166
	mov	r0, #0
	str	r0, [r7, #8]
	ldr	r3, [r4, #16]
	blx	r3
	mov	r0, r5
	bl	SCDDRV_IsChanDec
	cmp	r0, #0
	bne	.L2167
.L2152:
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	ldr	r2, .L2169+12
	ldr	r3, [r4, #12]
	mov	r0, #4
	mov	r4, #0
	ldr	r8, .L2169
	str	r4, [r2, r5, asl #2]
	blx	r3
	mov	r0, r5
	bl	VCTRL_StopChan
	ldr	r3, [r8, #16]
	subs	r7, r0, #0
	mov	r0, #4
	bne	.L2168
	blx	r3
	mov	r0, r5
	bl	VCTRL_ResetChan
	mov	r4, r7
	bl	VDMDRV_ParamInit
	ldr	r3, .L2169+16
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
	ldr	r0, .L2169+20
	add	r2, r3, #294912
	str	r7, [r6, r5, asl #2]
	add	r6, r6, r5, lsl #4
	ldr	r1, [r2, #1492]
	ldr	r9, [r2, #1528]
	movw	r2, #30136
	str	r7, [r0, r5, asl #3]
	movt	r2, 4
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
	ldr	r3, .L2169+24
	add	r1, r3, #128
.L2155:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r4, r4, #1
	cmp	r3, r1
	bne	.L2155
	cmp	r4, #0
	movne	r0, #0
	bne	.L2149
	bl	VCTRL_ReleaseHalMem
	mov	r0, r4
.L2149:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2167:
	mov	r0, r5
	ldr	r7, [r4, #132]
	bl	SCDDRV_IsChanDec
	mov	r2, #500
	clz	r1, r0
	mov	r0, r8
	mov	r1, r1, lsr #5
	blx	r7
	b	.L2152
.L2166:
	ldr	ip, .L2169+28
	movw	r3, #2391
.L2164:
	ldr	r2, .L2169+32
	mov	r0, #0
	ldr	r1, .L2169+36
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2168:
	blx	r3
	ldr	r3, [r8, #16]
	mov	r0, r4
	blx	r3
	mvn	r0, #0
	b	.L2149
.L2165:
	ldr	ip, .L2169+40
	mov	r3, #2384
	ldr	r2, .L2169+32
	mov	r0, r7
	ldr	r1, .L2169+36
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #16]
	mov	r0, r7
	blx	r3
	mvn	r0, #0
	b	.L2149
.L2170:
	.align	2
.L2169:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC65
	.word	.LANCHOR1
	.word	g_LowDelaySeqIndex
	.word	.LANCHOR3
	.word	s_SmIIS
	.word	.LANCHOR1-4
	.word	.LC238
	.word	.LANCHOR0+1712
	.word	.LC236
	.word	.LC237
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
	ldr	r6, .L2189
	ldr	r3, [r6, #128]
	cmp	r3, #1
	bne	.L2178
	sub	r5, r6, #4
	mov	r4, #0
.L2174:
	ldr	r3, [r5, #4]!
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L2173
	bl	VCTRL_DestroyChan
.L2173:
	cmp	r4, #32
	bne	.L2174
	bl	FSP_Exit
	ldr	r3, [r6, #132]
	mov	r2, #3
	ldr	r5, .L2189+4
	cmp	r3, #0
	str	r2, [r6, #136]
	beq	.L2176
	mov	r0, #10
	ldr	r3, [r5, #120]
	mov	r4, #49
	blx	r3
	b	.L2177
.L2188:
	ldr	r3, [r5, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L2176
.L2177:
	ldr	r3, [r6, #132]
	mov	r0, #10
	cmp	r3, #0
	bne	.L2188
.L2176:
	ldr	r3, [r5, #48]
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L2189+8
	blx	r3
	ldr	r0, .L2189+12
	bl	CloseDrivers
	mov	r3, #0
	mov	r0, r3
	str	r3, [r6, #128]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2178:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2190:
	.align	2
.L2189:
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
	ldr	r1, .L2192
	mov	r3, r0
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L2192+4
	mov	r3, r0
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r2, r4
	ldr	r1, .L2192+8
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2193:
	.align	2
.L2192:
	.word	.LC239
	.word	.LC235
	.word	.LC198
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
	ldr	r1, .L2195
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2196:
	.align	2
.L2195:
	.word	.LC239
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
	beq	.L2198
	cmp	r1, #0
	moveq	r4, #2
	movne	r4, #0
.L2198:
	ldr	r3, .L2212
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2208
	mov	r1, r4
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Require_DspCode
.L2208:
	ldr	r6, .L2212+4
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L2209
	mov	r0, #0
	blx	r3
.L2201:
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L2210
	mov	r0, #0
	blx	r3
.L2203:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	beq	.L2211
	mov	r0, #0
	blx	r3
.L2205:
	mov	r1, r4
	mov	r0, #0
	bl	SCDDRV_LoadDspCode
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_CloseHardware
.L2209:
	mov	r0, r3
	movw	r2, #3055
	ldr	r1, .L2212+8
	bl	dprint_vfmw
	b	.L2201
.L2210:
	mov	r0, r3
	mov	r2, #3056
	ldr	r1, .L2212+8
	bl	dprint_vfmw
	b	.L2203
.L2211:
	mov	r0, r3
	movw	r2, #3057
	ldr	r1, .L2212+8
	bl	dprint_vfmw
	b	.L2205
.L2213:
	.align	2
.L2212:
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
	ldr	r3, .L2240
	mov	r5, r0
	ldr	r3, [r3, r0, asl #2]
	ldr	r1, [r3, #600]
	cmp	r1, #0
	movne	r3, #1
	movne	r6, #0
	ldreq	r6, [r3, #1244]
	clzeq	r3, r6
	moveq	r3, r3, lsr #5
.L2215:
	cmp	r1, #6
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L2236
.L2227:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2236:
	ldr	r7, .L2240+4
	ldr	r4, [r7, #-516]
	cmp	r4, #0
	bne	.L2216
	sub	r3, r7, #516
	sub	r2, r7, #392
	b	.L2217
.L2238:
	cmp	r3, r2
	beq	.L2237
.L2217:
	ldr	r4, [r3, #4]!
	cmp	r4, #0
	beq	.L2238
.L2216:
	cmp	r4, #1
	beq	.L2239
	cmp	r1, #6
	beq	.L2227
	ldr	r1, .L2240+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2237:
	mov	r0, r5
	add	r5, r7, r5, lsl #2
	bl	VCTRL_InitDspCode
	cmp	r6, #1
	mov	r0, r4
	streq	r6, [r5, #-516]
	movne	r3, #2
	strne	r3, [r5, #-516]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2239:
	cmp	r6, #1
	beq	.L2227
	ldr	r1, .L2240+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2241:
	.align	2
.L2240:
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC241
	.word	.LC240
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
	ldr	r3, .L2243
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #262144
	str	r1, [r3, #2080]
	ldmfd	sp, {fp, sp, pc}
.L2244:
	.align	2
.L2243:
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
	ldr	r3, .L2246
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #290816
	ldr	r0, [r3, #1436]
	ldmfd	sp, {fp, sp, pc}
.L2247:
	.align	2
.L2246:
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
	beq	.L2250
	bcc	.L2251
	cmp	r1, #2
	bne	.L2258
	ldr	r3, .L2259
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #2428]
	cmp	r3, #1
	beq	.L2255
	mov	r3, #0
	str	r1, [r0, #2428]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2258:
	mov	r3, #0
.L2249:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2251:
	ldr	r2, .L2259
	mov	r1, #0
	mov	r3, r1
	add	r0, r2, r0, lsl #2
	str	r1, [r0, #2428]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2250:
	ldr	r3, .L2259
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #2428]
	cmp	r3, #0
	bne	.L2255
	str	r1, [r0, #2428]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2255:
	mvn	r3, #0
	b	.L2249
.L2260:
	.align	2
.L2259:
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
	beq	.L2262
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #24]
	ldr	r0, [r0, #32]
	bl	MEM_AddMemRecord
.L2262:
	ldr	r3, [r4, #4]
	cmp	r3, #255
	beq	.L2263
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #48]
	bl	MEM_AddMemRecord
.L2263:
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
	ldr	r7, .L2305
	mov	r4, r0
	mov	r5, r1
	ldr	r1, [r1, #12]
	ldr	r3, [r7, r0, asl #2]
	add	r2, r3, #294912
	add	r3, r3, #290816
	ldr	r0, [r2, #912]
	cmp	r0, r1
	beq	.L2272
	ldr	ip, [r3, #1432]
	cmp	ip, #0
	beq	.L2300
.L2272:
	ldr	r3, [r3, #3824]
	cmp	r3, #0
	beq	.L2274
	ldr	r2, [r2, #944]
	cmp	r2, #0
	beq	.L2301
.L2274:
	ldr	r6, .L2305+4
	mov	r0, #8
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r0, [r7, r4, asl #2]
	add	r2, r0, #290816
	ldr	r3, [r2, #1464]
	cmp	r3, #255
	beq	.L2283
	add	r2, r2, #1536
	mov	r1, #1
	b	.L2276
.L2303:
	add	r1, r1, #1
	cmp	r1, #32
	beq	.L2302
.L2276:
	ldr	ip, [r2]
	add	r2, r2, #72
	cmp	ip, #255
	bne	.L2303
.L2275:
	mov	r2, r1, asl #6
	movw	r3, #30136
	add	r1, r2, r1, lsl #3
	movt	r3, 4
	add	r3, r1, r3
	ldr	r9, [r6, #52]
	add	r0, r0, r3
	mov	r2, #72
	mov	r1, r5
	ldr	r8, .L2305+4
	blx	r9
	ldr	r3, [r7, r4, asl #2]
	mov	r0, r5
	ldr	r9, .L2305+8
	add	r3, r3, #294912
	ldr	r2, [r3, #944]
	add	r2, r2, #1
	str	r2, [r3, #944]
	bl	VCTRL_AddFrameBufMemoryRecord
	mov	r3, r4, asl #6
	add	r3, r3, r4, lsl #3
	add	r9, r9, r3
	ldr	r3, [r9, #20]
	cmp	r3, #2
	beq	.L2304
.L2278:
	ldr	r3, [r7, r4, asl #2]
	add	r3, r3, #294912
	ldr	r3, [r3, #948]
	cmp	r3, #0
	bne	.L2279
.L2281:
	mov	r4, #0
.L2280:
	ldr	r3, [r6, #16]
	mov	r0, #8
	blx	r3
	mov	r0, r4
.L2296:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2301:
	ldr	r3, [r5, #8]
	cmp	r3, #255
	bne	.L2274
	str	r3, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	movw	r3, #8188
	ldr	r2, .L2305+12
	ldr	r1, .L2305+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2296
.L2302:
	mov	r3, r4
	ldr	r2, .L2305+12
	ldr	r1, .L2305+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L2280
.L2304:
	ldr	r3, [r9, #48]
	cmp	r3, #0
	bne	.L2278
	ldr	r3, [r8]
	blx	r3
	mov	r3, #3
	str	r3, [r9, #20]
	str	r0, [r9, #48]
	b	.L2278
.L2279:
	mov	r1, r5
	mov	r0, r4
	bl	FSP_SetSingleFrameBuf
	cmp	r0, #0
	beq	.L2281
	mov	r3, r4
	ldr	r2, .L2305+12
	ldr	r1, .L2305+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L2280
.L2283:
	mov	r1, #0
	b	.L2275
.L2300:
	str	r0, [sp, #4]
	movw	r3, #8178
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L2305+12
	ldr	r1, .L2305+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2296
.L2306:
	.align	2
.L2305:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LANCHOR0+1732
	.word	.LC243
	.word	.LC245
	.word	.LC244
	.word	.LC242
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
	ldr	r5, .L2319
	mov	r7, r0, asl #2
	mov	r4, r0
	add	r3, r5, r7
	ldr	r10, [r3, #2428]
	cmp	r10, #0
	bne	.L2308
	ldr	r8, .L2319+4
	mov	ip, #1
	mov	r2, #72
	str	ip, [r3, #2428]
	sub	r0, fp, #116
	ldr	r9, .L2319+8
	ldr	r3, [r8, #52]
	blx	r3
	sub	r1, fp, #116
	mov	r0, r4
	bl	VCTRL_SetSingleFrameBufToChan
	ldr	r3, [r9, r4, asl #2]
	subs	r6, r0, #0
	bne	.L2317
.L2310:
	add	r3, r3, #262144
	mov	r2, #2
	ldr	r1, .L2319+12
	mov	r0, #31
	str	r2, [r3, #2080]
	bl	dprint_vfmw
	ldr	r3, [r9, r4, asl #2]
	ldr	r9, .L2319+8
	add	r3, r3, #294912
	ldr	r3, [r3, #1548]
	cmp	r3, #1
	beq	.L2318
.L2311:
	add	r5, r5, r7
	mov	r0, r6
	mov	r3, #0
	str	r3, [r5, #2428]
.L2316:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2317:
	add	r2, r3, #290816
	ldr	r2, [r2, #1436]
	cmp	r2, #0
	beq	.L2310
	mov	r2, r4
	ldr	r1, .L2319+16
	mov	r0, r10
	bl	dprint_vfmw
	ldr	r3, [r9, r4, asl #2]
	mov	r1, #3
	add	r2, r3, #262144
	str	r1, [r2, #2080]
	b	.L2310
.L2318:
	ldr	r3, [r8, #128]
	mov	r0, #0
	blx	r3
	ldr	r3, [r9, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #1548]
	b	.L2311
.L2308:
	mov	r3, r0
	ldr	r2, .L2319+20
	ldr	r1, .L2319+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2316
.L2320:
	.align	2
.L2319:
	.word	.LANCHOR3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC247
	.word	.LC246
	.word	.LANCHOR0+1764
	.word	.LC248
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
	ldr	r3, .L2326
	mov	r5, r0
	mov	r6, r1
	mov	r7, r2
	sub	r0, fp, #52
	ldr	r3, [r3, #48]
	mov	r2, #24
	mov	r1, #0
	blx	r3
	ldr	r3, .L2326+4
	ldr	r4, [r3, #52]
	cmp	r4, #0
	beq	.L2322
	ldr	ip, .L2326+8
	sub	r3, fp, #52
	str	r3, [sp, #4]
	mov	r2, r7
	mov	r1, r6
	mov	r0, r5
	ldr	ip, [ip, r5, asl #2]
	mov	r3, #0
	add	ip, ip, #294912
	ldr	ip, [ip, #1552]
	str	ip, [sp]
	blx	r4
.L2322:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2327:
	.align	2
.L2326:
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
	ldr	r3, .L2329
	mov	r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #2832]
	ldmfd	sp, {fp, sp, pc}
.L2330:
	.align	2
.L2329:
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
	ldr	r3, .L2332
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #2832]
	ldmfd	sp, {fp, sp, pc}
.L2333:
	.align	2
.L2332:
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
	ldr	r3, .L2335
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #2832]
	ldmfd	sp, {fp, sp, pc}
.L2336:
	.align	2
.L2335:
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
	.type	__func__.18313, %object
	.size	__func__.18313, 18
__func__.18313:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.19518, %object
	.size	__func__.19518, 24
__func__.19518:
	.ascii	"VCTRL_SetLastFrameState\000"
	.type	__func__.18252, %object
	.size	__func__.18252, 20
__func__.18252:
	.ascii	"VCTRL_RecordPosTime\000"
	.type	__func__.18257, %object
	.size	__func__.18257, 17
__func__.18257:
	.ascii	"VCTRL_RecordData\000"
	.space	3
	.type	__func__.18304, %object
	.size	__func__.18304, 23
__func__.18304:
	.ascii	"VCTRL_SetMoreGapEnable\000"
	.space	1
	.type	__func__.18325, %object
	.size	__func__.18325, 18
__func__.18325:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__func__.18365, %object
	.size	__func__.18365, 25
__func__.18365:
	.ascii	"VCTRL_SetStreamInterface\000"
	.space	3
	.type	__func__.18370, %object
	.size	__func__.18370, 29
__func__.18370:
	.ascii	"VCTRL_SetSendStreamAgainFlag\000"
	.space	3
	.type	__func__.18374, %object
	.size	__func__.18374, 29
__func__.18374:
	.ascii	"VCTRL_GetSendStreamAgainFlag\000"
	.space	3
	.type	__func__.18384, %object
	.size	__func__.18384, 20
__func__.18384:
	.ascii	"VCTRL_GetStreamSize\000"
	.type	__func__.18391, %object
	.size	__func__.18391, 20
__func__.18391:
	.ascii	"VCTRL_CheckFreshRaw\000"
	.type	__func__.18398, %object
	.size	__func__.18398, 20
__func__.18398:
	.ascii	"VCTRL_CheckFreshSeg\000"
	.type	__func__.18403, %object
	.size	__func__.18403, 25
__func__.18403:
	.ascii	"VCTRL_SetDiscardPicParam\000"
	.space	3
	.type	__FUNCTION__.18431, %object
	.size	__FUNCTION__.18431, 29
__FUNCTION__.18431:
	.ascii	"VCTRL_PartitionMemForStdUser\000"
	.space	3
	.type	__func__.18446, %object
	.size	__func__.18446, 21
__func__.18446:
	.ascii	"DelAllFrameMemRecord\000"
	.space	3
	.type	__func__.18456, %object
	.size	__func__.18456, 23
__func__.18456:
	.ascii	"VCTRL_FreeChanResource\000"
	.space	1
	.type	__func__.18638, %object
	.size	__func__.18638, 17
__func__.18638:
	.ascii	"VCTRL_GetChanCfg\000"
	.space	3
	.type	__func__.18699, %object
	.size	__func__.18699, 14
__func__.18699:
	.ascii	"VCTRL_SeekPts\000"
	.space	2
	.type	__func__.18732, %object
	.size	__func__.18732, 20
__func__.18732:
	.ascii	"VCTRL_ReleaseStream\000"
	.type	__func__.18752, %object
	.size	__func__.18752, 24
__func__.18752:
	.ascii	"VCTRL_ImageOutputEnable\000"
	.type	__func__.18791, %object
	.size	__func__.18791, 25
__func__.18791:
	.ascii	"VCTRL_TryToRelSpecialFrm\000"
	.space	3
	.type	__func__.18815, %object
	.size	__func__.18815, 19
__func__.18815:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.18823, %object
	.size	__FUNCTION__.18823, 19
__FUNCTION__.18823:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__func__.18830, %object
	.size	__func__.18830, 23
__func__.18830:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.18834, %object
	.size	__FUNCTION__.18834, 23
__FUNCTION__.18834:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.18842, %object
	.size	__func__.18842, 23
__func__.18842:
	.ascii	"VCTRL_GetHDRConfigInfo\000"
	.space	1
	.type	__func__.18868, %object
	.size	__func__.18868, 18
__func__.18868:
	.ascii	"VCTRL_GetDecParam\000"
	.space	2
	.type	__func__.18950, %object
	.size	__func__.18950, 20
__func__.18950:
	.ascii	"VCTRL_ClearDecparam\000"
	.type	__func__.18979, %object
	.size	__func__.18979, 21
__func__.18979:
	.ascii	"VCTRL_VdmProcSedOnly\000"
	.space	3
	.type	__func__.18987, %object
	.size	__func__.18987, 21
__func__.18987:
	.ascii	"VCTRL_GetImageBuffer\000"
	.space	3
	.type	__func__.19010, %object
	.size	__func__.19010, 22
__func__.19010:
	.ascii	"VCTRL_ConfigFFFBSpeed\000"
	.space	2
	.type	__func__.19015, %object
	.size	__func__.19015, 20
__func__.19015:
	.ascii	"VCTRL_ConfigPVRInfo\000"
	.type	__func__.19019, %object
	.size	__func__.19019, 19
__func__.19019:
	.ascii	"VCTRL_IsChanActive\000"
	.space	1
	.type	__func__.19025, %object
	.size	__func__.19025, 13
__func__.19025:
	.ascii	"USERDEC_Init\000"
	.space	3
	.type	__func__.19044, %object
	.size	__func__.19044, 21
__func__.19044:
	.ascii	"VCTRL_GetUsrdecFrame\000"
	.space	3
	.type	__func__.19054, %object
	.size	__func__.19054, 14
__func__.19054:
	.ascii	"InitSyntaxCtx\000"
	.space	2
	.type	__func__.19109, %object
	.size	__func__.19109, 12
__func__.19109:
	.ascii	"OpenDrivers\000"
	.type	__func__.18334, %object
	.size	__func__.18334, 15
__func__.18334:
	.ascii	"VCTRL_OpenVfmw\000"
	.space	1
	.type	__FUNCTION__.19248, %object
	.size	__FUNCTION__.19248, 18
__FUNCTION__.19248:
	.ascii	"GetExtraRefFrmNum\000"
	.space	2
	.type	__FUNCTION__.19254, %object
	.size	__FUNCTION__.19254, 19
__FUNCTION__.19254:
	.ascii	"GetExtraDispFrmNum\000"
	.space	1
	.type	__FUNCTION__.19260, %object
	.size	__FUNCTION__.19260, 16
__FUNCTION__.19260:
	.ascii	"GetExtraCtrlCmd\000"
	.type	__func__.19194, %object
	.size	__func__.19194, 14
__func__.19194:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__FUNCTION__.19195, %object
	.size	__FUNCTION__.19195, 14
__FUNCTION__.19195:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__func__.18741, %object
	.size	__func__.18741, 24
__func__.18741:
	.ascii	"VCTRL_FindOccupiedFrame\000"
	.type	__func__.18762, %object
	.size	__func__.18762, 26
__func__.18762:
	.ascii	"VCTRL_ReportOccupiedFrame\000"
	.space	2
	.type	__func__.19225, %object
	.size	__func__.19225, 20
__func__.19225:
	.ascii	"VCTRL_GetChanImgNum\000"
	.type	__func__.18414, %object
	.size	__func__.18414, 19
__func__.18414:
	.ascii	"VCTRL_GetChanState\000"
	.space	1
	.type	__func__.19229, %object
	.size	__func__.19229, 19
__func__.19229:
	.ascii	"VCTRL_GetChanWidth\000"
	.space	1
	.type	__func__.19233, %object
	.size	__func__.19233, 20
__func__.19233:
	.ascii	"VCTRL_GetChanHeight\000"
	.type	__func__.19237, %object
	.size	__func__.19237, 22
__func__.19237:
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
	.type	__func__.19533, %object
	.size	__func__.19533, 22
__func__.19533:
	.ascii	"VCTRL_OutputLastFrame\000"
	.space	2
	.type	__func__.18925, %object
	.size	__func__.18925, 15
__func__.18925:
	.ascii	"VCTRL_PostProc\000"
	.space	1
	.type	__func__.18974, %object
	.size	__func__.18974, 18
__func__.18974:
	.ascii	"VCTRL_VdmPostProc\000"
	.space	2
	.type	__func__.19559, %object
	.size	__func__.19559, 21
__func__.19559:
	.ascii	"VCTRL_SvdecLastFrame\000"
	.space	3
	.type	__func__.19050, %object
	.size	__func__.19050, 21
__func__.19050:
	.ascii	"VCTRL_PutUsrdecFrame\000"
	.space	3
	.type	__func__.18617, %object
	.size	__func__.18617, 16
__func__.18617:
	.ascii	"VCTRL_StartChan\000"
	.type	__func__.18633, %object
	.size	__func__.18633, 15
__func__.18633:
	.ascii	"VCTRL_StopChan\000"
	.space	1
	.type	__func__.18726, %object
	.size	__func__.18726, 26
__func__.18726:
	.ascii	"VCTRL_ResetChanWithOption\000"
	.space	2
	.type	__func__.18805, %object
	.size	__func__.18805, 16
__func__.18805:
	.ascii	"VCTRL_ResetChan\000"
	.type	__func__.18523, %object
	.size	__func__.18523, 18
__func__.18523:
	.ascii	"VCTRL_AllocHalMem\000"
	.space	2
	.type	__func__.18599, %object
	.size	__func__.18599, 17
__func__.18599:
	.ascii	"VCTRL_CreateChan\000"
	.space	3
	.type	__func__.18480, %object
	.size	__func__.18480, 18
__func__.18480:
	.ascii	"VCTRL_AllocSCDMem\000"
	.space	2
	.type	__func__.18684, %object
	.size	__func__.18684, 17
__func__.18684:
	.ascii	"VCTRL_ConfigChan\000"
	.space	3
	.type	__func__.18611, %object
	.size	__func__.18611, 18
__func__.18611:
	.ascii	"VCTRL_DestroyChan\000"
	.space	2
	.type	__func__.19654, %object
	.size	__func__.19654, 30
__func__.19654:
	.ascii	"VCTRL_SetSingleFrameBufToChan\000"
	.space	2
	.type	__func__.19666, %object
	.size	__func__.19666, 24
__func__.19666:
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
	ASCII(.ascii	"%s not support std %d\012\000" )
	.space	1
.LC178:
	ASCII(.ascii	"pstChanState = NULL\000" )
.LC179:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_ref = %d is out of [ -500" )
	ASCII(.ascii	"0, 5000 ]!\012\000" )
	.space	1
.LC180:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_disp = %d is out of [ -50" )
	ASCII(.ascii	"00, 5000 ]!\012\000" )
.LC181:
	ASCII(.ascii	"Command \"%d\" not registerd!\012\000" )
	.space	3
.LC182:
	ASCII(.ascii	"Chan %d Report Last Frame, Value=%d, LastFrameState" )
	ASCII(.ascii	"=%d\012\000" )
.LC183:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC184:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC185:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC186:
	ASCII(.ascii	"line %d can not know YuvFormat = %d\012\000" )
	.space	3
.LC187:
	ASCII(.ascii	"userdec frame(phy=%#x) address error!\012\000" )
	.space	1
.LC188:
	ASCII(.ascii	"can not map vir addr for usrdat frame(cbphy=%#x)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC189:
	ASCII(.ascii	"line: %d, pLogic is Null!\012\000" )
	.space	1
.LC190:
	ASCII(.ascii	"eYuvFormat %d is not support!!\012\000" )
.LC191:
	ASCII(.ascii	"pUsrdecFrame == NULL\000" )
	.space	3
.LC192:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame: VidStd is %d\012\000" )
.LC193:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame return err\012\000" )
	.space	3
.LC194:
	ASCII(.ascii	"L:%d ChanID out of range\012\000" )
	.space	2
.LC195:
	ASCII(.ascii	"L:%d This Chan has not been created!!!\012\000" )
.LC196:
	ASCII(.ascii	"L:%d WARNING: vidio std not setted!\012\000" )
	.space	3
.LC197:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC198:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC199:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC200:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC201:
	ASCII(.ascii	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\012\000" )
	.space	2
.LC202:
	ASCII(.ascii	"---------------------------------------------------" )
	ASCII(.ascii	"----------------------\012\000" )
	.space	1
.LC203:
	ASCII(.ascii	"Param Invalid of PChanOption is NULL\012\000" )
	.space	2
.LC204:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSize failed!\012\000" )
	.space	2
.LC205:
	ASCII(.ascii	"ChanID: %d is out of range!\012\000" )
	.space	3
.LC206:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT create m" )
	ASCII(.ascii	"ore channels\012\000" )
	.space	3
.LC207:
	ASCII(.ascii	"%s get Vdh %d hal mem size failed!\012\000" )
.LC208:
	ASCII(.ascii	"%s alloc Vdh %d hal mem size %d failed!\012\000" )
	.space	3
.LC209:
	ASCII(.ascii	"VDMHAL_OpenHAL Vdh %d failed!\012\000" )
	.space	1
.LC210:
	ASCII(.ascii	"%s alloc vdh %d vp9 prob mem size %d failed!\012\000" )
	.space	2
.LC211:
	ASCII(.ascii	"%s alloc Scd %d hal mem size %d failed!\012\000" )
	.space	3
.LC212:
	ASCII(.ascii	"%s open Scd %d drv failed!\012\000" )
.LC213:
	ASCII(.ascii	"%s alloc hal mem failed!\012\000" )
	.space	2
.LC214:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC215:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC216:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC217:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC218:
	ASCII(.ascii	"%s :%d Alloc failed ScdDetailMem:%d\012\000" )
	.space	3
.LC219:
	ASCII(.ascii	"%s allc chan scd failed!\012\000" )
	.space	2
.LC220:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel Hal Mem\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC221:
	ASCII(.ascii	"%s alloc mem for vfmw failed!\012\000" )
	.space	1
.LC222:
	ASCII(.ascii	"Chan:%d can NOT enable FSP instance\012\000" )
	.space	3
.LC223:
	ASCII(.ascii	"pstCfg = NULL\000" )
	.space	2
.LC224:
	ASCII(.ascii	"VCTRL_CheckChanWH return err.\012\000" )
	.space	1
.LC225:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC226:
	ASCII(.ascii	"VCTRL_ConfigChan with same config paramater.\012\000" )
	.space	2
.LC227:
	ASCII(.ascii	"can NOT VCTRL_PartitionMemForStdUser\012\000" )
	.space	2
.LC228:
	ASCII(.ascii	"chan %d: new UvmosEnable = %d\012\000" )
	.space	1
.LC229:
	ASCII(.ascii	"chan %d: SetUvmosEnable failed!\012\000" )
	.space	3
.LC230:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC231:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC232:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC233:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC234:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC235:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC236:
	ASCII(.ascii	"%s:L%d: %s\012\000" )
.LC237:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC238:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC239:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC240:
	ASCII(.ascii	"WARNNING: dsp in lowdelay state, we can not support" )
	ASCII(.ascii	"ed  avs in the same time!!!\012\000" )
.LC241:
	ASCII(.ascii	"WARNNING: dsp in avs state, we can not supported  l" )
	ASCII(.ascii	"owdelay in the same time!!!\012\000" )
.LC242:
	ASCII(.ascii	"%s, %d, actul size = 0x%x, except size= 0x%x\012\000" )
	.space	2
.LC243:
	ASCII(.ascii	"%s, %d, CfgFrameNum = %x, PmvNodeStatus= 0x%x\012\000" )
	.space	1
.LC244:
	ASCII(.ascii	"%s: Chan %d set single frame failed!\012\000" )
	.space	2
.LC245:
	ASCII(.ascii	"%s: Chan %d no frame buffer store!\012\000" )
.LC246:
	ASCII(.ascii	"DFS, request frame store fail!, chanid: %d\012\000" )
.LC247:
	ASCII(.ascii	"DFS, set decoding thread state to success!\012 \000" )
	.space	3
.LC248:
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
	.type	save_file_cnt.19396, %object
	.size	save_file_cnt.19396, 4
save_file_cnt.19396:
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
	.type	save_file_cnt.19390, %object
	.size	save_file_cnt.19390, 4
save_file_cnt.19390:
	.space	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.space	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 128
vfmw_save_metadata_file:
	.space	128
	.type	save_file_cnt.19384, %object
	.size	save_file_cnt.19384, 4
save_file_cnt.19384:
	.space	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.space	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 128
vfmw_save_seg_file:
	.space	128
	.type	save_file_cnt.19362, %object
	.size	save_file_cnt.19362, 4
save_file_cnt.19362:
	.space	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.space	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 128
vfmw_save_str_file:
	.space	128
	.type	save_file_cnt.19356, %object
	.size	save_file_cnt.19356, 4
save_file_cnt.19356:
	.space	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.space	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 128
vfmw_save_yuv_file:
	.space	128
	.type	save_file_cnt.19369, %object
	.size	save_file_cnt.19369, 4
save_file_cnt.19369:
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
	.type	FspInstInfo.18427, %object
	.size	FspInstInfo.18427, 2952
FspInstInfo.18427:
	.space	2952
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.space	4
	.type	last_rec_pos_time.18820, %object
	.size	last_rec_pos_time.18820, 128
last_rec_pos_time.18820:
	.space	128
	.type	last_rec_pos_time.18831, %object
	.size	last_rec_pos_time.18831, 128
last_rec_pos_time.18831:
	.space	128
	.type	MemArrange.19084, %object
	.size	MemArrange.19084, 1232
MemArrange.19084:
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
	.type	last_rec_pos_time.19189, %object
	.size	last_rec_pos_time.19189, 128
last_rec_pos_time.19189:
	.space	128
	.type	last_rec_pos_decparam_time.19190, %object
	.size	last_rec_pos_decparam_time.19190, 128
last_rec_pos_decparam_time.19190:
	.space	128
	.type	ChanPriTab.19139, %object
	.size	ChanPriTab.19139, 128
ChanPriTab.19139:
	.space	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 2304
g_VfmwChanStat:
	.space	2304
	.type	PrioArray.18616, %object
	.size	PrioArray.18616, 128
PrioArray.18616:
	.space	128
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.space	128
	.type	Capability.18680, %object
	.size	Capability.18680, 148
Capability.18680:
	.space	148
	.type	PrioArray.18679, %object
	.size	PrioArray.18679, 128
PrioArray.18679:
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
