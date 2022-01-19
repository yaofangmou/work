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
	.type	VfmwProc_SetStatisticsEnable, %function
VfmwProc_SetStatisticsEnable:
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
	ldr	lr, .L2
	movw	r1, #6032
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L2+4
	mov	r3, ip
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	VfmwProc_SetStatisticsEnable, .-VfmwProc_SetStatisticsEnable
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
	ldr	lr, .L5
	movw	r1, #6022
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L5+4
	mov	r3, ip
	str	ip, [lr, #4]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.word	.LC1
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, [r0]
	cmp	r3, #4
	bhi	.L8
	ldr	r2, .L11
	str	r3, [r2]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L8:
	ldr	ip, .L11
	movw	r1, #6011
	str	r3, [sp]
	mov	r0, #32
	ldr	r2, .L11+4
	ldr	r3, [ip]
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	.LANCHOR1
	.word	.LC2
	UNWIND(.fnend)
	.size	VfmwProc_SetClkSelect, .-VfmwProc_SetClkSelect
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
	ldr	lr, .L14
	movw	r1, #5869
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L14+4
	mov	r3, ip
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L15:
	.align	2
.L14:
	.word	g_TraceImgPeriod
	.word	.LC3
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
	ldr	lr, .L17
	movw	r1, #5859
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L17+4
	mov	r3, ip
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L18:
	.align	2
.L17:
	.word	g_TraceFramePeriod
	.word	.LC4
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
	ldr	lr, .L20
	movw	r1, #5849
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L20+4
	mov	r3, ip
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L21:
	.align	2
.L20:
	.word	g_TraceBsPeriod
	.word	.LC5
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
	ldr	lr, .L23
	movw	r1, #5839
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L23+4
	mov	r3, ip
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L24:
	.align	2
.L23:
	.word	g_TraceCtrl
	.word	.LC6
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
	ldr	lr, .L26
	movw	r1, #5829
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L26+4
	mov	r3, ip
	str	ip, [lr, #8]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	.LC7
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
	ldr	lr, .L29
	movw	r1, #5819
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L29+4
	mov	r3, ip
	str	ip, [lr, #12]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.word	.LC8
	UNWIND(.fnend)
	.size	VfmwProc_TestTimeSequence, .-VfmwProc_TestTimeSequence
	.align	2
	.type	VfmwProc_SetSaveYuvEnd, %function
VfmwProc_SetSaveYuvEnd:
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
	ldr	r3, .L34
	ldr	ip, [r0]
	ldr	r3, [r3, #16]
	cmp	ip, r3
	strcs	ip, [sp]
	strcc	ip, [sp]
	ldrcs	lr, .L34+4
	movwcc	r1, #5733
	ldrcc	r2, .L34+8
	movcc	r0, #32
	movwcs	r1, #5738
	ldrcs	r2, .L34+12
	movcs	r0, #32
	strcs	ip, [lr, #4]
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveYuvEnd, .-VfmwProc_SetSaveYuvEnd
	.align	2
	.type	VfmwProc_SetSaveYuvBegin, %function
VfmwProc_SetSaveYuvBegin:
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
	ldr	r3, .L40
	ldr	ip, [r0]
	ldr	r2, [r3, #4]
	cmp	ip, r2
	bhi	.L39
	ldr	lr, .L40+4
	mov	r3, ip
	str	r2, [sp]
	movw	r1, #5721
	ldr	r2, .L40+8
	mov	r0, #32
	str	ip, [lr, #16]
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L39:
	str	r2, [sp]
	mov	r3, ip
	ldr	r2, .L40+12
	movw	r1, #5716
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L41:
	.align	2
.L40:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC12
	.word	.LC11
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveYuvBegin, .-VfmwProc_SetSaveYuvBegin
	.align	2
	.type	VfmwProc_SetSaveYuvBitDepth, %function
VfmwProc_SetSaveYuvBitDepth:
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
	ldr	ip, [r0]
	bic	r3, ip, #2
	cmp	r3, #8
	bne	.L44
	ldr	lr, .L45
	mov	r3, ip
	ldr	r2, .L45+4
	movw	r1, #5704
	mov	r0, #32
	str	ip, [lr, #8]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L44:
	mov	r3, ip
	ldr	r2, .L45+8
	movw	r1, #5699
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L46:
	.align	2
.L45:
	.word	.LANCHOR1
	.word	.LC14
	.word	.LC13
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveYuvBitDepth, .-VfmwProc_SetSaveYuvBitDepth
	.align	2
	.type	VfmwProc_SetSaveRawAfterReset, %function
VfmwProc_SetSaveRawAfterReset:
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
	ldr	ip, [r0]
	cmp	ip, #1
	bls	.L49
	mov	r3, ip
	ldr	r2, .L50
	movw	r1, #5687
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L49:
	ldr	lr, .L50+4
	mov	r3, ip
	ldr	r2, .L50+8
	movw	r1, #5683
	mov	r0, #32
	str	ip, [lr, #20]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L51:
	.align	2
.L50:
	.word	.LC16
	.word	.LANCHOR0
	.word	.LC15
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveRawAfterReset, .-VfmwProc_SetSaveRawAfterReset
	.align	2
	.type	VfmwProc_SaveEL, %function
VfmwProc_SaveEL:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	r4, [r0]
	cmp	r4, #3
	bhi	.L52
	ldr	r2, .L58
	add	r5, r2, r4, lsl #2
	ldr	r6, [r5, #24]
	cmp	r6, #0
	beq	.L57
	ldr	r2, .L58+4
	movw	r1, #5668
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L58+8
	ldr	r0, [r5, #24]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #24]
.L52:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L57:
	ldr	ip, [r2, #40]
	mov	r1, #50
	ldr	r7, .L58+8
	sub	r0, fp, #88
	ldr	r3, .L58+12
	str	ip, [sp]
	add	ip, ip, #1
	ldr	r8, [r7, #68]
	str	ip, [r2, #40]
	ldr	r2, .L58+16
	blx	r8
	ldr	r3, [r7, #32]
	strb	r6, [fp, #-39]
	mov	r2, r6
	sub	r0, fp, #88
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r5, #24]
	beq	.L55
	str	r4, [sp]
	sub	r3, fp, #88
	ldr	r2, .L58+20
	movw	r1, #5659
	mov	r0, #32
	bl	dprint_normal
	b	.L52
.L55:
	sub	r3, fp, #88
	ldr	r2, .L58+24
	movw	r1, #5663
	mov	r0, #32
	bl	dprint_normal
	b	.L52
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.word	.LC20
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+12
	.word	.LC17
	.word	.LC18
	.word	.LC19
	UNWIND(.fnend)
	.size	VfmwProc_SaveEL, .-VfmwProc_SaveEL
	.align	2
	.type	VfmwProc_SaveDecYUV, %function
VfmwProc_SaveDecYUV:
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
	ldr	r3, .L61
	movw	r1, #5563
	ldr	r2, .L61+4
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L62:
	.align	2
.L61:
	.word	.LANCHOR2
	.word	.LC21
	UNWIND(.fnend)
	.size	VfmwProc_SaveDecYUV, .-VfmwProc_SaveDecYUV
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
	ldr	ip, [r0]
	cmp	ip, #4
	bhi	.L65
	ldr	lr, .L66
	mov	r3, ip
	ldr	r2, .L66+4
	movw	r1, #5389
	mov	r0, #32
	str	ip, [lr, #44]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L65:
	mov	r3, ip
	ldr	r2, .L66+8
	movw	r1, #5384
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	.LC23
	.word	.LC22
	UNWIND(.fnend)
	.size	VfmwProc_SetCurProcChan, .-VfmwProc_SetCurProcChan
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
	ldr	ip, [r0]
	cmp	ip, #1
	bls	.L70
	mov	r3, ip
	ldr	r2, .L71
	movw	r1, #5372
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L70:
	ldr	lr, .L71+4
	mov	r3, ip
	ldr	r2, .L71+8
	movw	r1, #5368
	mov	r0, #32
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L72:
	.align	2
.L71:
	.word	.LC25
	.word	g_Use_FFAPT_Enable
	.word	.LC24
	UNWIND(.fnend)
	.size	VfmwProc_SetUSE_FF_APT_EN, .-VfmwProc_SetUSE_FF_APT_EN
	.align	2
	.type	VfmwProc_SetFsWaterMark, %function
VfmwProc_SetFsWaterMark:
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
	ldr	ip, [r0]
	cmp	ip, #1
	bls	.L75
	mov	r3, ip
	ldr	r2, .L76
	movw	r1, #5355
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L75:
	ldr	lr, .L76+4
	mov	r3, ip
	ldr	r2, .L76+8
	movw	r1, #5351
	mov	r0, #32
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L77:
	.align	2
.L76:
	.word	.LC27
	.word	g_FsWaterMarkEnable
	.word	.LC26
	UNWIND(.fnend)
	.size	VfmwProc_SetFsWaterMark, .-VfmwProc_SetFsWaterMark
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
	mov	r3, r4
	bhi	.L80
	ldr	r2, .L81
	movw	r1, #5279
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L81+4
	str	r4, [r3, #76]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L80:
	ldr	r2, .L81+8
	movw	r1, #5275
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L82:
	.align	2
.L81:
	.word	.LC29
	.word	.LANCHOR1
	.word	.LC28
	UNWIND(.fnend)
	.size	VfmwProc_SetDefaultOutputOrder, .-VfmwProc_SetDefaultOutputOrder
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
	ldr	lr, .L84
	movw	r1, #5178
	ldr	ip, [r0]
	mov	r0, #32
	ldr	r2, .L84+4
	mov	r3, ip
	str	ip, [lr]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L85:
	.align	2
.L84:
	.word	g_PrintEnable
	.word	.LC30
	UNWIND(.fnend)
	.size	VfmwProc_SetPrintLevel, .-VfmwProc_SetPrintLevel
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
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #160)
	sub	sp, sp, #160
	cmp	r0, #3
	mov	r4, r2
	bhi	.L140
	ldr	r5, .L147
	add	r2, r5, r0, lsl #2
	ldr	ip, [r2, #48]
	cmp	ip, #0
	beq	.L141
	sub	r2, r1, #61
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L92
.L94:
	.word	.L93
	.word	.L95
	.word	.L96
	.word	.L97
	.word	.L98
.L92:
	ldr	r2, [ip, #144]
	cmp	r2, #0
	beq	.L114
	cmp	r2, #1
	bne	.L142
	ldr	r3, [r5, #212]
	cmp	r3, #0
	beq	.L143
.L117:
	mov	r2, r4
	blx	r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L142:
	str	r3, [sp, #4]
	mov	r1, #968
	str	r2, [sp]
	mov	r0, #0
	ldr	r3, .L147+4
	ldr	r2, .L147+8
	bl	dprint_normal
	mvn	r0, #0
.L136:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L114:
	ldr	r3, [r5, #208]
	cmp	r3, #0
	bne	.L117
	mov	r0, r3
	ldr	r2, .L147+12
	movw	r1, #946
	bl	dprint_normal
	mvn	r0, #0
	b	.L136
.L98:
	mov	r2, #144
	mov	r1, #0
	sub	r0, fp, #172
	str	r3, [fp, #-176]
	bl	memset
	ldr	r3, [fp, #-176]
	cmp	r3, #16
	bne	.L144
	ldr	r3, [r4]
	cmp	r3, #3
	ldrhi	r2, .L147+16
	movwhi	r3, #873
	bhi	.L138
	ldrd	r0, [r4, #8]
	orrs	r2, r0, r1
	beq	.L145
	add	r5, r5, r3, lsl #2
	mov	r4, #1
	str	r4, [fp, #-172]
	mov	r1, r0
	ldr	r3, [r5, #48]
	mov	r2, #28
	ldr	lr, .L147+20
	sub	r0, fp, #156
	add	r3, r3, #24576
	ldr	ip, [r3, #1756]
	ldr	r5, [lr, #52]
	str	ip, [fp, #-164]
	ldr	r3, [r3, #1760]
	str	r3, [fp, #-160]
	blx	r5
	sub	r1, fp, #172
	mov	r0, #10
	bl	VMM_SendCommandBlock
	cmp	r0, #0
	beq	.L102
	ldr	ip, [fp, #-172]
	mov	r0, r4
	ldr	r3, .L147+24
	movw	r1, #886
	ldr	r2, .L147+28
	str	ip, [sp]
	bl	dprint_normal
	b	.L102
.L93:
	cmp	r3, #152
	beq	.L99
	mov	r2, #152
	str	r3, [sp]
	str	r2, [sp, #4]
	movw	r1, #717
	ldr	r3, .L147+32
	mov	r0, #1
	ldr	r2, .L147+36
	bl	dprint_normal
.L102:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L95:
	cmp	r3, #152
	beq	.L103
	str	r3, [sp]
	mov	r2, #152
	ldr	r3, .L147+40
	movw	r1, #766
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L147+36
	bl	dprint_normal
	b	.L102
.L96:
	cmp	r3, #16
	mov	r1, #0
	str	r1, [fp, #-172]
	str	r1, [fp, #-168]
	str	r1, [fp, #-164]
	str	r1, [fp, #-160]
	beq	.L105
	str	r3, [sp]
	mov	r2, #16
	ldr	r3, .L147+44
	movw	r1, #809
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L147+36
	bl	dprint_normal
	b	.L102
.L97:
	cmp	r3, #16
	mov	r2, #0
	str	r2, [fp, #-172]
	str	r2, [fp, #-168]
	str	r2, [fp, #-164]
	str	r2, [fp, #-160]
	str	r2, [fp, #-156]
	str	r2, [fp, #-152]
	beq	.L107
	str	r3, [sp]
	mov	r2, #16
	ldr	r3, .L147+48
	mov	r1, #836
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L147+36
	bl	dprint_normal
	b	.L102
.L144:
	str	r3, [sp]
	mov	r2, #16
	ldr	r3, .L147+24
	movw	r1, #866
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L147+36
	bl	dprint_normal
	b	.L102
.L99:
	ldr	r6, .L147+20
	mov	r1, #0
	mov	r2, #136
	sub	r0, fp, #172
	mov	r5, r1
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, r4
	ldr	r2, .L147+52
	mov	r1, #32
	ldr	r7, [r6, #68]
	sub	r0, fp, #172
	blx	r7
	ldrsb	r3, [r4, #80]
	ldr	ip, [r4, #48]
	ldr	r0, [r4, #52]
	cmp	r3, r5
	ldr	r1, [r4, #56]
	ldrd	r2, [r4, #64]
	str	ip, [fp, #-116]
	str	r0, [fp, #-112]
	str	r1, [fp, #-132]
	strd	r2, [fp, #-44]
	strb	r5, [fp, #-141]
	str	r5, [fp, #-120]
	bne	.L146
.L101:
	ldr	r1, [r4, #32]
	sub	r2, fp, #172
	mov	r0, #0
	sub	r1, r1, #1
	clz	r1, r1
	mov	r1, r1, lsr #5
	bl	VMM_SendCommand
	cmp	r0, #0
	beq	.L102
	ldr	r2, [fp, #-132]
	sub	r3, fp, #172
	mov	r1, #752
	str	r3, [sp]
	mov	r0, #1
	ldr	r3, .L147+32
	str	r2, [sp, #4]
	ldr	r2, .L147+56
	bl	dprint_normal
	b	.L102
.L103:
	ldr	r5, .L147+20
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #172
	ldr	r3, [r5, #48]
	blx	r3
	mov	r3, r4
	ldr	r5, [r5, #68]
	mov	r1, #32
	ldr	r2, .L147+52
	sub	r0, fp, #172
	blx	r5
	ldr	ip, [r4, #40]
	ldr	r5, [r4, #48]
	mov	r3, #0
	ldr	r0, [r4, #32]
	sub	r2, fp, #172
	ldr	lr, [r4, #52]
	mov	r1, r3
	str	ip, [fp, #-140]
	str	r5, [fp, #-116]
	ldr	ip, [r4, #56]
	ldrd	r4, [r4, #64]
	str	r0, [fp, #-136]
	mov	r0, #1
	str	ip, [fp, #-132]
	mov	ip, #2
	str	lr, [fp, #-112]
	strd	r4, [fp, #-44]
	strb	r3, [fp, #-141]
	str	r3, [fp, #-120]
	str	ip, [fp, #-108]
	bl	VMM_SendCommand
	cmp	r0, #0
	beq	.L102
	ldr	r2, [fp, #-136]
	sub	r3, fp, #172
	movw	r1, #795
	str	r3, [sp]
	mov	r0, #1
	ldr	r3, .L147+40
	str	r2, [sp, #4]
	ldr	r2, .L147+60
	bl	dprint_normal
	b	.L102
.L105:
	ldrd	r6, [r4]
	sub	r2, fp, #172
	ldrd	r4, [r4, #8]
	mov	r0, #2
	strd	r6, [fp, #-172]
	strd	r4, [fp, #-164]
	bl	VMM_SendCommand
	cmp	r0, #0
	beq	.L102
	ldr	r3, .L147+44
	movw	r1, #822
	ldr	r2, .L147+64
	mov	r0, #1
	bl	dprint_normal
	b	.L102
.L107:
	ldrd	r2, [r4]
	sub	r1, fp, #172
	ldrd	r4, [r4, #8]
	mov	r0, #9
	strd	r2, [fp, #-164]
	strd	r4, [fp, #-156]
	bl	VMM_SendCommandBlock
	cmp	r0, #0
	beq	.L102
	ldr	ip, [fp, #-172]
	movw	r1, #850
	ldr	r3, .L147+48
	mov	r0, #1
	ldr	r2, .L147+68
	str	ip, [sp]
	bl	dprint_normal
	b	.L102
.L145:
	ldr	r2, .L147+72
	movw	r3, #874
.L138:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L147+24
	ldr	r2, .L147+76
	bl	dprint_normal
	b	.L102
.L146:
	mov	r2, #1
	add	r3, r4, #88
	strb	r2, [fp, #-104]
	mov	r1, #32
	ldr	r2, .L147+52
	sub	r0, fp, #100
	ldr	r6, [r6, #68]
	blx	r6
	ldr	r1, [r4, #144]
	ldr	r2, [r4, #136]
	ldr	r3, [r4, #140]
	strb	r5, [fp, #-69]
	str	r1, [fp, #-60]
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	b	.L101
.L143:
	mov	r0, r3
	ldr	r2, .L147+80
	movw	r1, #958
	bl	dprint_normal
	mvn	r0, #0
	b	.L136
.L140:
	ldr	r2, .L147+84
	movw	r3, #929
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L147+4
	str	r2, [sp, #4]
	ldr	r2, .L147+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L136
.L141:
	ldr	r2, .L147+88
	movw	r1, #930
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L147+4
	str	r2, [sp, #4]
	ldr	r2, .L147+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L136
.L148:
	.align	2
.L147:
	.word	.LANCHOR0
	.word	.LANCHOR2+20
	.word	.LC45
	.word	.LC43
	.word	.LC40
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+164
	.word	.LC42
	.word	.LANCHOR2+40
	.word	.LC34
	.word	.LANCHOR2+68
	.word	.LANCHOR2+96
	.word	.LANCHOR2+132
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC41
	.word	.LC31
	.word	.LC44
	.word	.LC32
	.word	.LC33
	UNWIND(.fnend)
	.size	VCTRL_EventReport, .-VCTRL_EventReport
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
	cmp	r4, #3
	bhi	.L149
	ldr	r7, .L155
	add	r5, r7, r4, lsl #2
	ldr	r6, [r5, #232]
	cmp	r6, #0
	beq	.L154
	ldr	r2, .L155+4
	mov	r1, #5632
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L155+8
	ldr	r0, [r5, #232]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #232]
.L149:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L154:
	ldr	r8, .L155+8
	mov	r0, #25
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r7, #248]
	mov	r1, #50
	ldr	r3, .L155+12
	str	r2, [sp]
	add	r2, r2, #1
	str	r2, [r7, #248]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	strb	r6, [fp, #-39]
	mov	r2, r6
	sub	r0, fp, #88
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r5, #232]
	beq	.L152
	str	r4, [sp]
	sub	r3, fp, #88
	ldr	r2, .L155+16
	movw	r1, #5623
	mov	r0, #32
	bl	dprint_normal
	b	.L149
.L152:
	sub	r3, fp, #88
	ldr	r2, .L155+20
	movw	r1, #5627
	mov	r0, #32
	bl	dprint_normal
	b	.L149
.L156:
	.align	2
.L155:
	.word	.LANCHOR0
	.word	.LC48
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+12
	.word	.LC46
	.word	.LC47
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
	cmp	r4, #3
	bhi	.L157
	ldr	r7, .L163
	add	r5, r7, r4, lsl #2
	ldr	r6, [r5, #252]
	cmp	r6, #0
	beq	.L162
	ldr	r2, .L163+4
	movw	r1, #5595
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L163+8
	ldr	r0, [r5, #252]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #252]
.L157:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L162:
	ldr	r8, .L163+8
	mov	r0, #24
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r7, #268]
	mov	r1, #50
	ldr	r3, .L163+12
	str	r2, [sp]
	add	r2, r2, #1
	str	r2, [r7, #268]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	strb	r6, [fp, #-39]
	mov	r2, r6
	sub	r0, fp, #88
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r5, #252]
	beq	.L160
	str	r4, [sp]
	sub	r3, fp, #88
	ldr	r2, .L163+16
	movw	r1, #5586
	mov	r0, #32
	bl	dprint_normal
	b	.L157
.L160:
	sub	r3, fp, #88
	ldr	r2, .L163+20
	movw	r1, #5590
	mov	r0, #32
	bl	dprint_normal
	b	.L157
.L164:
	.align	2
.L163:
	.word	.LANCHOR0
	.word	.LC48
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+12
	.word	.LC49
	.word	.LC50
	UNWIND(.fnend)
	.size	VfmwProc_SaveMetadata, .-VfmwProc_SaveMetadata
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
	cmp	r4, #3
	bhi	.L165
	ldr	r7, .L171
	add	r5, r7, r4, lsl #2
	ldr	r6, [r5, #272]
	cmp	r6, #0
	beq	.L170
	ldr	r2, .L171+4
	movw	r1, #5486
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L171+8
	ldr	r0, [r5, #272]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #272]
.L165:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L170:
	ldr	r8, .L171+8
	mov	r0, #21
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r7, #288]
	mov	r1, #50
	ldr	r3, .L171+12
	str	r2, [sp]
	add	r2, r2, #1
	str	r2, [r7, #288]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	strb	r6, [fp, #-39]
	mov	r2, r6
	sub	r0, fp, #88
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r5, #272]
	beq	.L168
	str	r4, [sp]
	sub	r3, fp, #88
	ldr	r2, .L171+16
	movw	r1, #5477
	mov	r0, #32
	bl	dprint_normal
	b	.L165
.L168:
	sub	r3, fp, #88
	ldr	r2, .L171+20
	movw	r1, #5481
	mov	r0, #32
	bl	dprint_normal
	b	.L165
.L172:
	.align	2
.L171:
	.word	.LANCHOR0
	.word	.LC53
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+12
	.word	.LC51
	.word	.LC52
	UNWIND(.fnend)
	.size	VfmwProc_SaveSeg, .-VfmwProc_SaveSeg
	.align	2
	.type	VfmwProc_SaveRaw, %function
VfmwProc_SaveRaw:
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
	cmp	r4, #3
	bhi	.L173
	ldr	r7, .L179
	add	r5, r7, r4, lsl #2
	ldr	r6, [r5, #292]
	cmp	r6, #0
	beq	.L178
	ldr	r2, .L179+4
	movw	r1, #5449
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L179+8
	ldr	r0, [r5, #292]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #292]
.L173:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L178:
	ldr	r8, .L179+8
	mov	r0, #20
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r7, #308]
	mov	r1, #50
	ldr	r3, .L179+12
	str	r2, [sp]
	add	r2, r2, #1
	str	r2, [r7, #308]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	strb	r6, [fp, #-39]
	mov	r2, r6
	sub	r0, fp, #88
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r5, #292]
	beq	.L176
	str	r4, [sp]
	sub	r3, fp, #88
	ldr	r2, .L179+16
	mov	r1, #5440
	mov	r0, #32
	bl	dprint_normal
	b	.L173
.L176:
	sub	r3, fp, #88
	ldr	r2, .L179+20
	movw	r1, #5444
	mov	r0, #32
	bl	dprint_normal
	b	.L173
.L180:
	.align	2
.L179:
	.word	.LANCHOR0
	.word	.LC56
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+12
	.word	.LC54
	.word	.LC55
	UNWIND(.fnend)
	.size	VfmwProc_SaveRaw, .-VfmwProc_SaveRaw
	.align	2
	.type	VfmwProc_SaveDispYUV, %function
VfmwProc_SaveDispYUV:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #112)
	sub	sp, sp, #112
	ldr	r4, [r0]
	cmp	r4, #3
	bls	.L190
.L181:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L190:
	ldr	r5, .L193
	mov	r0, #22
	bl	VFMW_GetString
	add	r7, r5, r4, lsl #2
	ldr	r6, [r7, #312]
	cmp	r6, #0
	beq	.L183
	ldr	r8, .L193+4
	mov	r0, r6
	mov	r4, #0
	ldr	r3, [r8, #36]
	blx	r3
	ldr	r0, [r5, #336]
	str	r4, [r7, #312]
	cmp	r0, r4
	beq	.L184
	ldr	r1, [r5, #332]
	bl	MEM_ReleaseMemBlock
	ldr	r3, [r8, #48]
	mov	r1, r4
	add	r0, r5, #328
	mov	r2, #24
	blx	r3
.L184:
	ldr	r2, .L193+8
	movw	r1, #5522
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L183:
	ldr	ip, [r5, #352]
	mov	r2, r0
	ldr	r8, .L193+4
	mov	r1, #100
	ldr	r3, .L193+12
	sub	r0, fp, #136
	str	ip, [sp]
	add	ip, ip, #1
	ldr	r9, [r8, #68]
	str	ip, [r5, #352]
	blx	r9
	strb	r6, [fp, #-37]
	sub	r0, fp, #136
	ldr	r3, [r8, #32]
	mov	r2, r6
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r7, #312]
	beq	.L191
	ldr	r3, [r8, #48]
	mov	r2, #24
	mov	r1, r6
	add	r0, r5, #328
	blx	r3
	mov	r0, #19
	str	r6, [r5, #348]
	bl	VFMW_GetString
	mov	r2, #24576
	str	r6, [sp]
	movt	r2, 159
	add	r3, r5, #328
	mov	r1, r6
	bl	MEM_AllocMemBlock
	subs	ip, r0, #0
	bne	.L192
	str	r4, [sp]
	sub	r3, fp, #136
	ldr	r2, .L193+16
	movw	r1, #5556
	mov	r0, #32
	str	ip, [r5, #356]
	bl	dprint_normal
	b	.L181
.L192:
	ldr	r3, [r8, #36]
	ldr	r0, [r7, #312]
	blx	r3
	mov	r3, #24576
	movt	r3, 159
	ldr	r2, .L193+20
	movw	r1, #5551
	mov	r0, #1
	str	r6, [r7, #312]
	bl	dprint_normal
	b	.L181
.L191:
	sub	r3, fp, #136
	ldr	r2, .L193+24
	movw	r1, #5533
	mov	r0, #32
	bl	dprint_normal
	b	.L181
.L194:
	.align	2
.L193:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	.LANCHOR1+12
	.word	.LC60
	.word	.LC59
	.word	.LC58
	UNWIND(.fnend)
	.size	VfmwProc_SaveDispYUV, .-VfmwProc_SaveDispYUV
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
	ldr	r4, .L196
	mov	r1, #1
	ldr	r0, [r0]
	mov	r3, #2097152
	ldr	r5, [r4]
	str	r3, [r4]
	bl	PrintScdRawState
	str	r5, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L197:
	.align	2
.L196:
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, .L199
	movw	r1, #5398
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DBG_PrintTracer
.L200:
	.align	2
.L199:
	.word	.LC61
	UNWIND(.fnend)
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
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
	beq	.L203
	ldr	r3, .L204
	mov	ip, #1
	ldr	r2, .L204+4
	movw	r1, #5930
	mov	r0, #32
	str	ip, [r3, #80]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L203:
	ldr	ip, .L204
	movw	r1, #5925
	ldr	r2, .L204+8
	mov	r0, #32
	str	r3, [ip, #80]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L205:
	.align	2
.L204:
	.word	.LANCHOR1
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
	ldr	r1, [r0]
	cmp	r1, #3
	bhi	.L208
	ldr	ip, .L209
	mov	r3, r1
	mov	lr, #0
	ldr	r2, .L209+4
	add	ip, ip, r1, lsl #2
	mov	r0, #32
	movw	r1, #5901
	ldr	ip, [ip, #48]
	add	ip, ip, #204800
	str	lr, [ip, #3276]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L208:
	ldr	r2, .L209+8
	movw	r1, #5896
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L210:
	.align	2
.L209:
	.word	.LANCHOR0
	.word	.LC65
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
	ldr	r1, [r0]
	cmp	r1, #3
	bhi	.L213
	ldr	ip, .L214
	mov	r3, r1
	mov	lr, #1
	ldr	r2, .L214+4
	add	ip, ip, r1, lsl #2
	mov	r0, #32
	movw	r1, #5885
	ldr	ip, [ip, #48]
	add	ip, ip, #204800
	str	lr, [ip, #3276]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L213:
	ldr	r2, .L214+8
	movw	r1, #5880
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L215:
	.align	2
.L214:
	.word	.LANCHOR0
	.word	.LC65
	.word	.LC64
	UNWIND(.fnend)
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	2
	.type	VCTRL_SetLastFrameState.part.19, %function
VCTRL_SetLastFrameState.part.19:
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
	ldr	r2, .L217
	movw	r3, #6193
	mov	r0, #0
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	ldr	r3, .L217+4
	ldr	r2, .L217+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L218:
	.align	2
.L217:
	.word	.LC40
	.word	.LANCHOR2+200
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState.part.19, .-VCTRL_SetLastFrameState.part.19
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
	ldr	r5, .L269
	ldr	r8, .L269+4
	ldr	r3, [r5]
	blx	r3
	ldr	r2, [r8]
	cmp	r2, #0
	mov	r9, r0
	beq	.L220
	mov	r0, #0
	blx	r2
.L222:
	mov	r0, #0
	mov	r4, #32
	mov	r6, r0
	bl	SCDDRV_PrepareSleep
	mov	r0, r6
	mov	r7, r6
	bl	VDMDRV_PrepareSleep
	ldr	r3, [r5]
	blx	r3
	str	r0, [fp, #-48]
.L221:
	mov	r0, #0
	bl	SCDDRV_GetSleepStage
	cmp	r0, #2
	bne	.L262
	mov	r0, #0
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L263
.L226:
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L231
	mov	r0, #0
	blx	r3
.L231:
	ldr	r2, [r8, #24]
	cmp	r2, #0
	beq	.L264
	mov	r0, #0
	blx	r2
	ldr	r2, [r8, #8]
	cmp	r2, #0
	beq	.L265
.L234:
	mov	r0, #0
	blx	r2
.L235:
	ldr	r6, .L269+8
	ldr	r3, [r6, #64]
	cmp	r3, #1
	bne	.L236
	ldr	r3, [r6, #68]
	mov	r2, #2
	str	r2, [r6, #72]
	cmp	r3, #1
	beq	.L238
	ldr	r3, [r5, #120]
	mov	r0, #10
	blx	r3
	mov	r4, #49
	b	.L239
.L266:
	ldr	r3, [r5, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L238
.L239:
	ldr	r3, [r6, #68]
	mov	r0, #10
	cmp	r3, #1
	bne	.L266
.L238:
	mov	r3, #0
	str	r3, [r6, #72]
.L236:
	ldr	r3, [r5]
	blx	r3
	ldr	r2, .L269+12
	movw	r1, #363
	cmp	r9, r0
	rsbls	r3, r9, r0
	mvnhi	r9, r9
	addhi	r3, r9, r0
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L262:
	mov	r0, #0
	mov	r10, r7
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L242
	mov	r6, #1
	mov	r2, r6
.L243:
	tst	r2, r10
	bne	.L226
	subs	r4, r4, #1
	beq	.L267
	ldr	r3, [r5, #120]
	mov	r0, #10
	blx	r3
	eor	r3, r6, #1
	eor	r2, r7, #1
	orrs	r3, r3, r2
	bne	.L221
	b	.L226
.L263:
	mov	r7, #1
	mov	r10, r7
.L242:
	mov	r2, r6
	b	.L243
.L267:
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [fp, #-48]
	str	r6, [sp, #4]
	movw	r1, #270
	str	r7, [sp]
	ldr	r2, .L269+16
	cmp	r3, r0
	rsbls	r3, r3, r0
	ldrhi	r3, [fp, #-48]
	mvnhi	r10, r3
	addhi	r3, r10, r0
	mov	r0, #0
	bl	dprint_normal
	cmp	r7, #1
	beq	.L268
	mov	r3, #0
	ldr	r2, .L269+20
	mov	r0, r3
	mov	r1, #276
	bl	dprint_normal
	mov	r0, #0
	bl	SCDDRV_ForceSleep
	cmp	r6, #1
	beq	.L226
.L245:
	mov	r3, #0
	ldr	r2, .L269+24
	mov	r0, r3
	movw	r1, #285
	bl	dprint_normal
	mov	r0, #0
	bl	VDMDRV_ForceSleep
	b	.L226
.L268:
	cmp	r6, #1
	bne	.L245
	b	.L226
.L220:
	movw	r3, #343
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L269+28
	bl	dprint_normal
	b	.L222
.L264:
	mov	r3, #320
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L269+28
	bl	dprint_normal
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L234
.L265:
	movw	r3, #325
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L269+28
	bl	dprint_normal
	b	.L235
.L270:
	.align	2
.L269:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC67
	.word	.LC66
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
	ldr	r2, .L272
	mov	r3, r0
	movw	r1, #5747
	mov	r0, #20
	bl	dprint_normal
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Suspend
.L273:
	.align	2
.L272:
	.word	.LC71
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
	ldr	r6, .L296
	ldr	r4, .L296+4
	ldr	r3, [r6]
	blx	r3
	ldr	r2, [r4, #4]
	cmp	r2, #0
	mov	r7, r0
	beq	.L293
	mov	r0, #0
	blx	r2
	ldr	r2, [r4, #20]
	cmp	r2, #0
	beq	.L294
.L277:
	mov	r0, #0
	blx	r2
.L278:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L279
	mov	r0, #0
	blx	r3
.L279:
	ldr	r5, .L296+8
	mov	r0, #0
	bl	SCDDRV_ExitSleep
	mov	r0, #0
	bl	VDMDRV_ExitSleep
	ldr	r3, [r5, #64]
	cmp	r3, #1
	bne	.L280
	ldr	r2, [r5, #68]
	str	r3, [r5, #72]
	cmp	r2, #2
	beq	.L282
	ldr	r3, [r6, #120]
	mov	r0, #10
	blx	r3
	mov	r4, #49
	b	.L283
.L295:
	ldr	r2, [r6, #120]
	blx	r2
	subs	r4, r4, #1
	beq	.L282
.L283:
	ldr	r2, [r5, #68]
	mov	r0, #10
	cmp	r2, #2
	bne	.L295
.L282:
	mov	r3, #0
	str	r3, [r5, #72]
.L280:
	ldr	r3, [r6]
	blx	r3
	ldr	r2, .L296+12
	movw	r1, #426
	cmp	r7, r0
	rsbls	r3, r7, r0
	mvnhi	r3, r7
	addhi	r3, r3, r0
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L293:
	movw	r3, #383
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L296+16
	bl	dprint_normal
	ldr	r2, [r4, #20]
	cmp	r2, #0
	bne	.L277
.L294:
	mov	r3, #388
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L296+16
	bl	dprint_normal
	b	.L278
.L297:
	.align	2
.L296:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC72
	.word	.LC66
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
	ldr	r2, .L299
	mov	r3, r0
	movw	r1, #5756
	mov	r0, #20
	bl	dprint_normal
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Resume
.L300:
	.align	2
.L299:
	.word	.LC71
	UNWIND(.fnend)
	.size	VfmwProc_TestResume, .-VfmwProc_TestResume
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
	bhi	.L306
	ldr	ip, .L307
	rsb	r2, r0, r0, lsl #4
	ldr	r4, .L307+4
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
.L306:
	movw	r1, #565
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #32
	ldr	r3, .L307+8
	ldr	r2, .L307+12
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L308:
	.align	2
.L307:
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LANCHOR2+224
	.word	.LC73
	UNWIND(.fnend)
	.size	VCTRL_RecordData, .-VCTRL_RecordData
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
	ldr	r3, .L311
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L312:
	.align	2
.L311:
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
	ldr	r3, .L314
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L315:
	.align	2
.L314:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
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
	beq	.L324
	cmp	r0, #0
	beq	.L320
	cmp	r0, #1
	beq	.L321
	str	r0, [sp]
	movw	r1, #991
	ldr	r3, .L325
	mov	r0, #0
	ldr	r2, .L325+4
	bl	dprint_normal
	mvn	r0, #0
.L318:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L321:
	ldr	r3, .L325+8
	mov	r0, #0
	str	r1, [r3, #212]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L320:
	ldr	r3, .L325+8
	str	r1, [r3, #208]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L324:
	ldr	r2, .L325+12
	movw	r3, #978
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L325
	str	r2, [sp, #4]
	ldr	r2, .L325+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L318
.L326:
	.align	2
.L325:
	.word	.LANCHOR2+244
	.word	.LC75
	.word	.LANCHOR0
	.word	.LC74
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	2
	.global	VCTRL_InitChanCtx
	.type	VCTRL_InitChanCtx, %function
VCTRL_InitChanCtx:
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
	ldr	r4, .L328
	mov	r2, #48
	ldr	r3, .L328+4
	mov	r1, #0
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	mvn	r3, #0
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L329:
	.align	2
.L328:
	.word	g_ChanCtx
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_InitChanCtx, .-VCTRL_InitChanCtx
	.align	2
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
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
	cmp	r0, #3
	mov	r2, r1
	bhi	.L335
	ldr	r3, .L338
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L336
	cmp	r1, #0
	beq	.L337
	ldr	r3, .L338+4
	add	r0, r0, #26112
	add	r0, r0, #192
	mov	r2, #12
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L332:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L335:
	ldr	r2, .L338+8
	movw	r3, #1154
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L338+12
	str	r2, [sp, #4]
	ldr	r2, .L338+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L332
.L337:
	ldr	ip, .L338+20
	movw	r1, #1156
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L338+12
	str	ip, [sp, #4]
	ldr	r2, .L338+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L332
.L336:
	ldr	r2, .L338+24
	movw	r1, #1155
	ldr	r3, .L338+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L338+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L332
.L339:
	.align	2
.L338:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+264
	.word	.LC31
	.word	.LC76
	.word	.LC33
	UNWIND(.fnend)
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	2
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
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
	cmp	r0, #3
	bhi	.L342
	ldr	r3, .L344
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	addne	r0, r0, #26112
	addne	r0, r0, #192
	ldmfd	sp, {fp, sp, pc}
.L342:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L345:
	.align	2
.L344:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	2
	.global	VCTRL_SetDeiMemQueryInterface
	.type	VCTRL_SetDeiMemQueryInterface, %function
VCTRL_SetDeiMemQueryInterface:
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
	cmp	r0, #3
	mov	r2, r1
	bhi	.L351
	ldr	r3, .L354
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L352
	cmp	r1, #0
	beq	.L353
	ldr	r3, .L354+4
	add	r0, r0, #26112
	add	r0, r0, #220
	mov	r2, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L348:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L351:
	ldr	r2, .L354+8
	movw	r3, #1176
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L354+12
	str	r2, [sp, #4]
	ldr	r2, .L354+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L348
.L353:
	ldr	ip, .L354+20
	movw	r1, #1178
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L354+12
	str	ip, [sp, #4]
	ldr	r2, .L354+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L348
.L352:
	ldr	r2, .L354+24
	movw	r1, #1177
	ldr	r3, .L354+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L354+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L348
.L355:
	.align	2
.L354:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+292
	.word	.LC31
	.word	.LC77
	.word	.LC33
	UNWIND(.fnend)
	.size	VCTRL_SetDeiMemQueryInterface, .-VCTRL_SetDeiMemQueryInterface
	.align	2
	.global	VCTRL_GetChanMemInfo
	.type	VCTRL_GetChanMemInfo, %function
VCTRL_GetChanMemInfo:
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
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_GetMemInfo
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemInfo, .-VCTRL_GetChanMemInfo
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
	cmp	r0, #3
	ldrhi	r2, .L365
	movwhi	r3, #1195
	bhi	.L362
	ldr	r3, .L365+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L363
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L364
	add	r0, r0, #74752
	add	r0, r0, #848
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetSegStreamSize
.L364:
	ldr	r2, .L365+8
	movw	r3, #1197
.L362:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L365+12
	ldr	r2, .L365+16
	bl	dprint_normal
.L359:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L363:
	ldr	r2, .L365+20
	movw	r1, #1196
	ldr	r3, .L365+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L365+16
	bl	dprint_normal
	b	.L359
.L366:
	.align	2
.L365:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC78
	.word	.LANCHOR2+324
	.word	.LC31
	.word	.LC33
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
	cmp	r0, #3
	mov	r2, #0
	str	r2, [fp, #-28]
	str	r2, [fp, #-24]
	movwhi	r1, #1209
	ldrhi	ip, .L378
	bhi	.L374
	ldr	r3, .L378+4
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #48]
	cmp	r0, #0
	beq	.L376
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L377
	add	r4, r0, #26368
	sub	r1, fp, #28
	add	r4, r4, #56
	mov	r0, r4
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L375
	mov	r0, r4
	sub	r1, fp, #24
	bl	GetRawStreamSize
	cmp	r0, #0
	bne	.L375
	ldr	ip, [fp, #-24]
	movw	r1, #1218
	ldr	r3, [fp, #-28]
	mov	r0, #20
	ldr	r2, .L378+8
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L375
	ldr	r0, [fp, #-24]
	cmp	r0, #3
	movgt	r0, #0
	mvnle	r0, #0
.L369:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L377:
	ldr	ip, .L378+12
	movw	r1, #1211
.L374:
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L378+16
	str	ip, [sp, #4]
	ldr	r2, .L378+20
	bl	dprint_normal
.L375:
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L376:
	ldr	r2, .L378+24
	movw	r1, #1210
	ldr	r3, .L378+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L378+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L369
.L379:
	.align	2
.L378:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC80
	.word	.LC78
	.word	.LANCHOR2+344
	.word	.LC31
	.word	.LC79
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
	cmp	r0, #3
	mov	r2, #0
	str	r2, [fp, #-20]
	str	r2, [fp, #-16]
	movwhi	r1, #1234
	ldrhi	ip, .L388
	bhi	.L385
	ldr	r3, .L388+4
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #48]
	cmp	r0, #0
	beq	.L386
	ldr	r1, [r0, #16]
	cmp	r1, #1
	bne	.L387
	add	r0, r0, #74752
	sub	r2, fp, #16
	add	r0, r0, #848
	sub	r1, fp, #20
	bl	GetFreshSegStream
	ldr	ip, [fp, #-16]
	ldr	r3, [fp, #-20]
	movw	r1, #1241
	ldr	r2, .L388+8
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	ldr	r0, [fp, #-20]
	cmp	r0, #0
	movgt	r0, #0
	mvnle	r0, #0
.L382:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L387:
	ldr	ip, .L388+12
	movw	r1, #1236
.L385:
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L388+16
	str	ip, [sp, #4]
	ldr	r2, .L388+20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L386:
	ldr	r2, .L388+24
	movw	r1, #1235
	ldr	r3, .L388+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L388+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L382
.L389:
	.align	2
.L388:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC81
	.word	.LC78
	.word	.LANCHOR2+364
	.word	.LC31
	.word	.LC79
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
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #3
	mov	r2, r1
	bhi	.L396
	ldr	r3, .L399
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #48]
	cmp	r0, #0
	beq	.L397
	cmp	r1, #0
	beq	.L398
	ldr	r3, .L399+4
	add	r0, r0, #207872
	mov	r2, #8
	add	r0, r0, #440
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r0, #0
	add	r3, r3, #204800
	ldr	r2, [r3, #3512]
	sub	r2, r2, #1
	cmp	r2, #1
	strhi	r0, [r3, #3512]
.L392:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L396:
	ldr	r2, .L399+8
	movw	r3, #1253
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L399+12
	str	r2, [sp, #4]
	ldr	r2, .L399+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L392
.L398:
	ldr	ip, .L399+20
	movw	r1, #1255
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L399+12
	str	ip, [sp, #4]
	ldr	r2, .L399+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L392
.L397:
	ldr	r2, .L399+24
	movw	r1, #1254
	ldr	r3, .L399+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L399+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L392
.L400:
	.align	2
.L399:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+384
	.word	.LC31
	.word	.LC82
	.word	.LC33
	UNWIND(.fnend)
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
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
	subs	r5, r1, #0
	beq	.L420
	ldr	r4, [r5, #12]
	cmp	r4, #0
	beq	.L421
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L422
.L406:
	ldr	r4, [r5, #16]
	cmp	r4, #0
	beq	.L423
.L407:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L424
.L408:
	ldr	r4, [r5, #20]
	cmp	r4, #0
	beq	.L425
.L409:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #8]
	cmp	r3, #1
	beq	.L426
.L410:
	ldr	r3, .L427
	ldr	r0, [r4, #4]
	ldr	r3, [r3, #164]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L426:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L410
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L424:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L408
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r4, [r5, #20]
	cmp	r4, #0
	bne	.L409
.L425:
	ldr	r3, .L427+4
	movw	r1, #1566
	ldr	r2, .L427+8
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L422:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L406
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r4, [r5, #16]
	cmp	r4, #0
	bne	.L407
.L423:
	mov	r0, r4
	ldr	r3, .L427+12
	ldr	r2, .L427+16
	movw	r1, #1544
	bl	dprint_normal
	b	.L408
.L421:
	mov	r0, r4
	ldr	r3, .L427+20
	ldr	r2, .L427+24
	movw	r1, #1522
	bl	dprint_normal
	b	.L406
.L420:
	mov	r0, r5
	ldr	r3, .L427+28
	ldr	r2, .L427+32
	movw	r1, #1588
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L428:
	.align	2
.L427:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+484
	.word	.LC86
	.word	.LANCHOR2+460
	.word	.LC85
	.word	.LANCHOR2+436
	.word	.LC84
	.word	.LANCHOR2+412
	.word	.LC83
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
	movw	r3, #38320
	movt	r3, 7
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.align	2
	.global	VCTRL_GetChanHalSize
	.type	VCTRL_GetChanHalSize, %function
VCTRL_GetChanHalSize:
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
	mov	r3, #0
	str	r3, [r0]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_GetChanHalSize, .-VCTRL_GetChanHalSize
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
	cmp	r0, #3
	mov	r2, r1
	bhi	.L436
	ldr	r3, .L439
	add	r3, r3, r0, lsl #2
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L437
	cmp	r2, #0
	beq	.L438
	ldr	r3, .L439+4
	add	r1, r1, #206848
	mov	r0, r2
	add	r1, r1, #408
	mov	r2, #156
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L433:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L436:
	ldr	r2, .L439+8
	movw	r3, #2387
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L439+12
	str	r2, [sp, #4]
	ldr	r2, .L439+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L433
.L438:
	ldr	ip, .L439+20
	movw	r1, #2389
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L439+12
	str	ip, [sp, #4]
	ldr	r2, .L439+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L433
.L437:
	ldr	r2, .L439+24
	movw	r3, #2388
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L439+12
	str	r2, [sp, #4]
	ldr	r2, .L439+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L433
.L440:
	.align	2
.L439:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+508
	.word	.LC31
	.word	.LC87
	.word	.LC33
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
	ldr	r3, .L455
	ldr	r2, [r1, #8]
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2464]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2484]
	ldr	r2, [r1, #28]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2480]
	ldr	r2, [r1, #24]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2488]
	ldr	r2, [r1, #32]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2492]
	ldr	r2, [r1, #36]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2496]
	ldr	r2, [r1, #40]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2512]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2596]
	ldr	r2, [r1, #140]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2524]
	ldr	r2, [r1, #68]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2520]
	ldr	r2, [r1, #64]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2516]
	ldr	r2, [r1, #60]
	cmp	r0, r2
	bne	.L454
	ldr	r0, [r3, #2528]
	ldr	r2, [r1, #72]
	cmp	r0, r2
	bne	.L454
	ldr	r3, [r3, #2588]
	ldr	r0, [r1, #132]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L454:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L456:
	.align	2
.L455:
	.word	.LANCHOR0
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
	ldr	r3, .L464
	mov	r5, r1
	add	r3, r3, r0, lsl #2
	ldr	r4, [r3, #48]
	ldr	r3, [r4, #128]
	cmp	r3, #22
	beq	.L462
	bl	VCTRL_CheckCommonParameter
	cmp	r0, #0
	bne	.L462
	add	r4, r4, #204800
	ldr	r3, [r4, #2464]
	cmp	r3, #1
	beq	.L463
	sub	r3, r3, #10
	cmp	r3, #2
	ldmhifd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #2468]
	ldr	r0, [r5, #12]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L463:
	ldr	r2, [r4, #2468]
	ldr	r3, [r5, #12]
	cmp	r2, r3
	bne	.L462
	ldr	r3, [r4, #2472]
	ldr	r0, [r5, #16]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L462:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L465:
	.align	2
.L464:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
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
	ldr	r3, .L467
	mvn	r2, #0
	ldr	r1, [r1, #56]
	mov	ip, #0
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	str	r1, [r3, #2512]
	str	ip, [r3, #3248]
	str	r2, [r3, #3252]
	str	r2, [r3, #3256]
	ldmfd	sp, {fp, sp, pc}
.L468:
	.align	2
.L467:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_ConfigChanCompress, .-VCTRL_ConfigChanCompress
	.align	2
	.global	VCTRL_ConfigChanMaxWH
	.type	VCTRL_ConfigChanMaxWH, %function
VCTRL_ConfigChanMaxWH:
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
	ldr	r3, [r1, #104]
	cmp	r3, #0
	ble	.L470
	ldr	r2, [r1, #108]
	cmp	r2, #0
	ble	.L470
	ldr	r2, .L472
	add	r0, r2, r0, lsl #2
	ldr	r2, [r0, #48]
	add	r2, r2, #204800
	str	r3, [r2, #2560]
	ldr	r3, [r1, #108]
	str	r3, [r2, #2564]
	ldmfd	sp, {fp, sp, pc}
.L470:
	ldr	r3, .L472
	mov	r1, #1920
	mov	r2, #1088
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	str	r1, [r3, #2560]
	str	r2, [r3, #2564]
	ldmfd	sp, {fp, sp, pc}
.L473:
	.align	2
.L472:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_ConfigChanMaxWH, .-VCTRL_ConfigChanMaxWH
	.align	2
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
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
	cmp	r0, #3
	mov	r4, r0
	mov	r5, r1
	bhi	.L479
	ldr	r3, .L481
	add	r3, r3, r0, lsl #2
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L480
	add	r1, r1, #128
	mov	r0, #3
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L478
	mov	r1, r5
	mov	r0, r4
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L476:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L478:
	mvn	r0, #0
	b	.L476
.L479:
	ldr	r2, .L481+4
	movw	r3, #2758
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L481+8
	str	r2, [sp, #4]
	ldr	r2, .L481+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L476
.L480:
	ldr	r2, .L481+16
	movw	r3, #2759
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L481+8
	str	r2, [sp, #4]
	ldr	r2, .L481+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L476
.L482:
	.align	2
.L481:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+528
	.word	.LC31
	.word	.LC88
	UNWIND(.fnend)
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	2
	.global	VCTRL_InitSyntaxCtx
	.type	VCTRL_InitSyntaxCtx, %function
VCTRL_InitSyntaxCtx:
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
	ldr	r3, .L492
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L491
	ldr	r3, [r0, #128]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L483
.L487:
	.word	.L486
	.word	.L483
	.word	.L488
	.word	.L489
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L483
	.word	.L490
.L491:
	ldr	r2, .L492+4
	movw	r1, #2780
	ldr	r3, .L492+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L492+12
	bl	dprint_normal
.L483:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L490:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L486:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L488:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L489:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L493:
	.align	2
.L492:
	.word	.LANCHOR0
	.word	.LC33
	.word	.LANCHOR2+544
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_InitSyntaxCtx, .-VCTRL_InitSyntaxCtx
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
	cmp	r0, #3
	bhi	.L498
	ldr	r3, .L500
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L499
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L496:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L498:
	ldr	r2, .L500+4
	movw	r3, #2895
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L500+8
	str	r2, [sp, #4]
	ldr	r2, .L500+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L496
.L499:
	ldr	r2, .L500+16
	mov	r1, #2896
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L500+8
	str	r2, [sp, #4]
	ldr	r2, .L500+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L496
.L501:
	.align	2
.L500:
	.word	.LANCHOR0
	.word	.LC89
	.word	.LANCHOR2+564
	.word	.LC31
	.word	.LC90
	UNWIND(.fnend)
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	2
	.global	VCTRL_GetChanUniqueID
	.type	VCTRL_GetChanUniqueID, %function
VCTRL_GetChanUniqueID:
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
	cmp	r0, #3
	bhi	.L505
	ldr	r3, .L506
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L505
	ldrd	r0, [r3, #8]
	ldmfd	sp, {fp, sp, pc}
.L505:
	mvn	r0, #0
	mvn	r1, #0
	ldmfd	sp, {fp, sp, pc}
.L507:
	.align	2
.L506:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanUniqueID, .-VCTRL_GetChanUniqueID
	.align	2
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #3
	mov	r5, r0
	mov	r6, r1
	ldrhi	r2, .L531
	movwhi	r3, #3154
	bhi	.L524
	ldr	r10, .L531+4
	mov	r9, r0, asl #2
	add	r7, r10, r9
	ldr	r0, [r7, #48]
	cmp	r0, #0
	ldreq	r2, .L531+8
	movweq	r1, #3155
	beq	.L525
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L526
	cmp	r6, #0
	beq	.L527
	ldr	r8, .L531+12
	mov	r0, #4
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r0, [r7, #48]
	cmp	r0, #0
	beq	.L514
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L514
	add	r0, r0, #207872
	mov	r1, r6
	add	r0, r0, #480
	bl	SYNTAX_ReceiveImage
	mov	r4, r0
	mov	r0, #9
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L528
.L517:
	cmp	r4, #1
	beq	.L529
.L519:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	subs	r0, r4, #1
	mvnne	r0, #0
.L510:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L528:
	ldr	r3, [r8]
	blx	r3
	ldr	r2, .L531+16
	ldr	r3, [r7, #360]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L517
	mov	r2, r5, asl #24
	str	r0, [r7, #360]
	add	r2, r2, #589824
	movw	r1, #3197
	cmp	r4, #1
	addeq	r2, r2, #1
	ldr	r0, .L531+20
	bl	DBG_AddTrace
	b	.L517
.L529:
	add	r9, r10, r9
	mov	r2, #100
	mla	r5, r2, r5, r10
	ldr	r3, [r9, #48]
	ldr	r1, [r6, #156]
	add	r2, r3, #24576
	add	r5, r5, #408
	str	r1, [r2, #1764]
	ldr	r2, [r6, #152]
	str	r2, [r3, #136]
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L530
.L520:
	ldr	r2, [r6, #444]
	movw	r3, #3211
	ldr	lr, [r6, #88]
	mov	r1, r3
	ldr	ip, [r6, #276]
	mov	r0, #26
	str	r3, [sp]
	ldr	r3, .L531+24
	stmib	sp, {r2, ip, lr}
	ldr	r2, .L531+28
	bl	dprint_normal
	b	.L519
.L530:
	ldr	r3, [r8]
	blx	r3
	str	r0, [r5, #4]
	b	.L520
.L514:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L526:
	ldr	r2, .L531+32
	movw	r3, #3156
.L524:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L531+24
	ldr	r2, .L531+36
	bl	dprint_normal
	mvn	r0, #0
	b	.L510
.L527:
	ldr	r2, .L531+40
	movw	r1, #3157
	mov	r0, r6
.L525:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L531+24
	ldr	r2, .L531+36
	bl	dprint_normal
	mvn	r0, #0
	b	.L510
.L532:
	.align	2
.L531:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TraceImgPeriod
	.word	.LANCHOR2+604
	.word	.LANCHOR2+584
	.word	.LC93
	.word	.LC91
	.word	.LC31
	.word	.LC92
	UNWIND(.fnend)
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	2
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #3
	mov	r7, r0
	mov	r6, r1
	ldrhi	r2, .L553
	movwhi	r3, #3225
	bhi	.L546
	ldr	r4, .L553+4
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #48]
	cmp	r0, #0
	ldreq	r2, .L553+8
	movweq	r1, #3226
	beq	.L547
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L548
	cmp	r6, #0
	beq	.L549
	ldr	r8, .L553+12
	mov	r0, #4
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r5, [r4, #48]
	cmp	r5, #0
	beq	.L550
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L551
	add	r0, r5, #207872
	mov	r1, r6
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	mov	r5, r0
	mov	r0, #10
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L552
.L542:
	cmp	r5, #1
	beq	.L544
	ldr	r2, [r6, #444]
	movw	r3, #3282
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #26
	ldr	r3, .L553+16
	str	r2, [sp, #4]
	ldr	r2, .L553+20
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r7
	bl	FSP_UnMarkImageOutHanging
.L545:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	subs	r0, r5, #1
	mvnne	r0, #0
.L535:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L552:
	ldr	r3, [r8]
	blx	r3
	ldr	r2, .L553+24
	ldr	r3, [r4, #776]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L542
	mov	r2, r7, asl #24
	str	r0, [r4, #776]
	add	r2, r2, #655360
	movw	r1, #3275
	cmp	r5, #1
	addeq	r2, r2, #1
	ldr	r0, .L553+28
	bl	DBG_AddTrace
	b	.L542
.L544:
	ldr	r2, [r6, #444]
	movw	r3, #3287
	ldr	ip, [r6, #88]
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #26
	ldr	r3, .L553+16
	stmib	sp, {r2, ip}
	ldr	r2, .L553+32
	bl	dprint_normal
	b	.L545
.L551:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	movw	r3, #3243
	mov	r1, r3
	ldr	r2, .L553+36
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L535
.L548:
	ldr	r2, .L553+40
	movw	r3, #3227
.L546:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L553+16
	ldr	r2, .L553+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L535
.L549:
	ldr	r2, .L553+48
	movw	r1, #3228
	mov	r0, r6
.L547:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L553+16
	ldr	r2, .L553+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L535
.L550:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	movw	r3, #3235
	mov	r0, r5
	mov	r1, r3
	ldr	r2, .L553+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L535
.L554:
	.align	2
.L553:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+624
	.word	.LC96
	.word	g_TraceImgPeriod
	.word	.LANCHOR2+648
	.word	.LC97
	.word	.LC95
	.word	.LC91
	.word	.LC31
	.word	.LC92
	.word	.LC94
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #3
	bhi	.L556
	ldr	r3, .L560
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L556
	ldr	r2, [r3, #16]
	cmp	r2, #1
	beq	.L559
	movw	r3, #3307
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L560+4
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #22
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L556:
	movw	r3, #3301
	ldr	r2, .L560+8
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #22
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L559:
	ldr	r0, [r3, #128]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L561:
	.align	2
.L560:
	.word	.LANCHOR0
	.word	.LC99
	.word	.LC98
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
	cmp	r0, #3
	bhi	.L567
	ldr	r3, .L570
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L568
	cmp	r1, #0
	beq	.L569
	add	r3, r0, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	strb	r2, [r1, #65]
	ldrb	r2, [r3, #2458]	@ zero_extendqisi2
	strb	r2, [r1, #66]
	ldr	r2, [r3, #2568]
	str	r2, [r1, #76]
	ldr	r2, [r3, #2572]
	str	r2, [r1, #68]
	ldr	r3, [r3, #2576]
	str	r3, [r1, #72]
.L562:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L567:
	ldr	r2, .L570+4
	movw	r3, #3316
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L570+8
	str	r2, [sp, #4]
	ldr	r2, .L570+12
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L568:
	ldr	r2, .L570+16
	movw	r1, #3317
	ldr	r3, .L570+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L570+12
	bl	dprint_normal
	b	.L562
.L569:
	ldr	r2, .L570+20
	movw	r3, #3318
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L570+8
	str	r2, [sp, #4]
	ldr	r2, .L570+12
	bl	dprint_normal
	b	.L562
.L571:
	.align	2
.L570:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+672
	.word	.LC31
	.word	.LC33
	.word	.LC100
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #3
	bhi	.L584
	ldr	r3, .L587
	add	r0, r3, r0, lsl #2
	ldr	r5, [r0, #48]
	cmp	r5, #0
	moveq	r3, r5
	beq	.L573
	ldr	r3, [r5, #16]
	cmp	r3, #1
	beq	.L586
.L584:
	mov	r3, #0
.L573:
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L586:
	ldr	r3, [r5, #20]
	cmp	r3, #1
	bne	.L584
	ldr	r3, [r5, #128]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L574
.L576:
	.word	.L575
	.word	.L574
	.word	.L577
	.word	.L578
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L574
	.word	.L579
.L579:
	add	r3, r5, #208896
	ldr	r4, [r3, #1884]
.L580:
	cmp	r4, #0
	moveq	r3, r4
	beq	.L573
	ldr	r3, .L587+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r5, #40]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L578:
	add	r3, r5, #204800
	ldr	r4, [r3, #3592]
	b	.L580
.L577:
	add	r3, r5, #208896
	ldr	r4, [r3, #500]
	b	.L580
.L575:
	add	r3, r5, #204800
	ldr	r4, [r3, #3920]
	b	.L580
.L574:
	str	r3, [sp]
	movw	r1, #3461
	ldr	r3, .L587+8
	mov	r0, #0
	ldr	r2, .L587+12
	bl	dprint_normal
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L588:
	.align	2
.L587:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+696
	.word	.LC101
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
	beq	.L597
	cmp	r0, #0
	beq	.L592
	cmp	r0, #16
	bne	.L598
	add	r0, r4, #4096
	ldrb	r0, [r0, #828]	@ zero_extendqisi2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L598:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L592:
	ldrb	r0, [r4, #936]	@ zero_extendqisi2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L597:
	ldr	r2, .L599
	movw	r1, #3480
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L600:
	.align	2
.L599:
	.word	.LC102
	UNWIND(.fnend)
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	2
	.global	VCTRL_ChanDecparamInValidFlag
	.type	VCTRL_ChanDecparamInValidFlag, %function
VCTRL_ChanDecparamInValidFlag:
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
	cmp	r0, #3
	mov	r2, r0
	bhi	.L602
	ldr	r4, .L613
	add	r4, r4, r0, lsl #2
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L602
	ldr	r1, [r3, #16]
	cmp	r1, #1
	bne	.L605
	ldr	r6, [r3, #20]
	cmp	r6, #1
	beq	.L606
.L605:
	mov	r3, r2
	movw	r1, #3519
	ldr	r2, .L613+4
	mov	r0, #20
	bl	dprint_normal
	mov	r5, #0
.L604:
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L602:
	movw	r3, #3513
	str	r2, [sp]
	mov	r1, r3
	ldr	r2, .L613+8
	mov	r0, #20
	mov	r5, #0
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L606:
	bl	VCTRL_GetDecParam
	subs	r7, r0, #0
	beq	.L611
	ldr	r2, [r4, #48]
	mov	r3, #0
	mov	r5, r3
	str	r3, [r2, #108]
	str	r3, [r2, #112]
	b	.L604
.L611:
	ldr	r8, [r4, #48]
	ldr	r3, .L613+12
	ldr	r5, [r8, #108]
	cmp	r5, #0
	beq	.L612
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r4, #48]
	ldr	r2, [r3, #112]
	cmp	r0, r2
	bls	.L609
	rsb	r0, r2, r0
	cmp	r0, #40
	movls	r5, r7
	bls	.L604
.L609:
	str	r7, [r3, #108]
	mov	r5, r6
	str	r7, [r3, #112]
	b	.L604
.L612:
	str	r6, [r8, #108]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r8, #112]
	b	.L604
.L614:
	.align	2
.L613:
	.word	.LANCHOR0
	.word	.LC104
	.word	.LC103
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
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
	cmp	r0, #3
	bhi	.L625
	ldr	r3, .L627
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L626
	ldr	r3, [r0, #128]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L619
.L621:
	.word	.L620
	.word	.L619
	.word	.L622
	.word	.L623
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L619
	.word	.L624
.L625:
	ldr	r2, .L627+4
	movw	r3, #3887
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L627+8
	str	r2, [sp, #4]
	ldr	r2, .L627+12
	bl	dprint_normal
.L615:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L624:
	add	r0, r0, #208896
	mov	r3, #0
	str	r3, [r0, #1884]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L620:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3920]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L622:
	add	r0, r0, #208896
	mov	r3, #0
	str	r3, [r0, #500]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L623:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3592]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L619:
	str	r3, [sp]
	movw	r1, #3989
	ldr	r3, .L627+8
	mov	r0, #1
	ldr	r2, .L627+16
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L626:
	ldr	r2, .L627+20
	mov	r1, #3888
	ldr	r3, .L627+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L627+12
	bl	dprint_normal
	b	.L615
.L628:
	.align	2
.L627:
	.word	.LANCHOR0
	.word	.LC105
	.word	.LANCHOR2+716
	.word	.LC31
	.word	.LC106
	.word	.LC90
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #3
	mov	r5, r1
	ldrhi	r2, .L641
	movwhi	r3, #4014
	bhi	.L639
	ldr	r3, .L641+4
	add	r4, r3, r0, lsl #2
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L640
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L633
	ldr	r2, .L641+8
	mov	r3, #4016
.L639:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L641+12
	ldr	r2, .L641+16
	bl	dprint_normal
.L629:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L633:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L629
	ldr	r0, [r4, #48]
	ldr	r3, [r0, #128]
	cmp	r3, #0
	beq	.L634
	cmp	r3, #16
	bne	.L629
	add	r0, r0, #207872
	mov	r1, r5
	add	r0, r0, #488
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVCDEC_VDMProcSedOnly
.L634:
	add	r0, r0, #207872
	mov	r1, r5
	add	r0, r0, #488
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	H264DEC_VDMProcSedOnly
.L640:
	ldr	r2, .L641+20
	movw	r1, #4015
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L641+12
	str	r2, [sp, #4]
	ldr	r2, .L641+16
	bl	dprint_normal
	b	.L629
.L642:
	.align	2
.L641:
	.word	.LC105
	.word	.LANCHOR0
	.word	.LC107
	.word	.LANCHOR2+736
	.word	.LC31
	.word	.LC91
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
	cmp	r0, #3
	ldrhi	r2, .L657
	movwhi	r3, #4051
	bhi	.L654
	ldr	r3, .L657+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L655
	ldr	r3, [r0, #20]
	cmp	r3, #1
	bne	.L656
	ldr	r3, [r0, #128]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L648
.L650:
	.word	.L649
	.word	.L648
	.word	.L651
	.word	.L652
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L648
	.word	.L653
.L653:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L649:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L651:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L652:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L648:
	str	r3, [sp]
	mov	r1, #4160
	ldr	r3, .L657+8
	mov	r0, #0
	ldr	r2, .L657+12
	bl	dprint_normal
	mov	r0, #0
.L645:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L656:
	ldr	r2, .L657+16
	movw	r3, #4053
.L654:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L657+8
	ldr	r2, .L657+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L645
.L655:
	ldr	r2, .L657+24
	movw	r1, #4052
	ldr	r3, .L657+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L657+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L645
.L658:
	.align	2
.L657:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LANCHOR2+760
	.word	.LC108
	.word	.LC107
	.word	.LC31
	.word	.LC88
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
	cmp	r0, #3
	ldrhi	r2, .L669
	movwhi	r3, #4169
	bhi	.L665
	ldr	r3, .L669+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	movweq	r1, #4170
	ldreq	r2, .L669+8
	streq	r1, [sp]
	beq	.L666
	ldr	r2, [r0, #16]
	cmp	r2, #1
	bne	.L667
	cmp	r1, #0
	beq	.L668
	ldr	r2, [r1]
	add	r3, r0, #204800
	mov	r0, #0
	str	r2, [r3, #3264]
.L661:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L667:
	ldr	r2, .L669+12
	movw	r3, #4171
.L665:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L669+16
	ldr	r2, .L669+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L661
.L668:
	ldr	r2, .L669+24
	movw	r3, #4172
	mov	r0, r1
	mov	r1, r3
	str	r3, [sp]
.L666:
	str	r2, [sp, #4]
	ldr	r3, .L669+16
	ldr	r2, .L669+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L661
.L670:
	.align	2
.L669:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC88
	.word	.LC109
	.word	.LANCHOR2+784
	.word	.LC31
	.word	.LC110
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
	cmp	r0, #3
	mov	r2, r1
	movwhi	r3, #4181
	ldrhi	r2, .L681
	bhi	.L677
	ldr	r3, .L681+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L678
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L679
	cmp	r2, #0
	beq	.L680
	ldr	r3, .L681+8
	add	r0, r0, #207872
	add	r0, r0, #228
	mov	r2, #24
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L673:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L679:
	ldr	r2, .L681+12
	movw	r3, #4183
.L677:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L681+16
	ldr	r2, .L681+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L673
.L680:
	ldr	ip, .L681+24
	movw	r1, #4184
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L681+16
	str	ip, [sp, #4]
	ldr	r2, .L681+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L673
.L678:
	ldr	r2, .L681+28
	movw	r1, #4182
	ldr	r3, .L681+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L681+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L673
.L682:
	.align	2
.L681:
	.word	.LC40
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC109
	.word	.LANCHOR2+808
	.word	.LC31
	.word	.LC110
	.word	.LC88
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
	cmp	r0, #3
	bhi	.L690
	ldr	r3, .L691
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L689
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L689
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L689
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L689
	ldr	r0, [r3, #128]
	cmp	r0, #22
	movne	r0, #0
	mvneq	r0, #0
.L685:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L689:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L690:
	ldr	r2, .L691+4
	movw	r3, #4193
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L691+8
	str	r2, [sp, #4]
	ldr	r2, .L691+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L685
.L692:
	.align	2
.L691:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+828
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	2
	.type	VCTRL_GetActiveChanNum, %function
VCTRL_GetActiveChanNum:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r8, .L701
	mov	r3, #0
	mov	r6, r0
	mov	r7, r1
	mov	r4, r3
	str	r3, [r0]
	str	r3, [r1]
.L698:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	beq	.L700
.L695:
	add	r4, r4, #1
	cmp	r4, #4
	bne	.L698
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L700:
	ldr	r5, [r8, r4, asl #2]
	sub	r1, fp, #40
	mov	r0, #3
	ldr	r3, [r5, #128]
	str	r3, [fp, #-40]
	bl	PDT_GetAttribute
	cmp	r0, #0
	ldreq	r3, [r6]
	addeq	r3, r3, #1
	streq	r3, [r6]
	ldr	r3, [r5, #128]
	cmp	r3, #1
	ldreq	r3, [r7]
	addeq	r3, r3, #1
	streq	r3, [r7]
	b	.L695
.L702:
	.align	2
.L701:
	.word	.LANCHOR0+48
	UNWIND(.fnend)
	.size	VCTRL_GetActiveChanNum, .-VCTRL_GetActiveChanNum
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	blt	.L704
	ldr	r3, [r0, #44]
	cmp	r3, #262144
	blt	.L704
	ldr	r3, [r0, #36]
	cmp	r3, #1
	beq	.L708
.L707:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L708:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L704
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bgt	.L707
.L704:
	ldr	r3, .L709
	movw	r1, #4217
	ldr	r2, .L709+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L710:
	.align	2
.L709:
	.word	.LANCHOR2+848
	.word	.LC111
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r1, #44]
	movw	r0, #38320
	movt	r0, 7
	str	r0, [r2, #8]
	add	r3, r3, #1024
	add	r3, r3, #15
	bic	r3, r3, #1020
	bic	r3, r3, #3
	str	r3, [r2, #4]
	ldr	r3, [r1, #36]
	cmp	r3, #0
	movweq	r3, #15364
	movteq	r3, 17
	beq	.L712
	ldr	lr, [r1, #12]
	mov	ip, #4000
	ldr	r5, [r1, #20]
	cmp	lr, #0
	ldr	r0, [r1, #24]
	movwgt	r3, #4060
	movle	lr, #136
	mulgt	r4, r3, lr
	str	lr, [r1, #12]
	mov	r3, #2208
	movwle	r4, #27872
	mul	r1, ip, r5
	ldr	ip, [r2, #8]
	mla	r1, r3, r0, r1
	movtle	r4, 8
	movw	lr, #42580
	movt	lr, 9
	add	r3, r1, r4
	cmp	r3, lr
	addcs	r3, ip, r3
	addcc	r3, ip, lr
.L712:
	str	r3, [r2, #8]
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	subs	r4, r1, #0
	mov	r6, r0
	mov	r5, r2
	movweq	r1, #4281
	ldreq	r2, .L729
	moveq	r0, r4
	beq	.L726
	cmp	r5, #0
	beq	.L727
	cmp	r3, #2
	beq	.L720
	ldr	r2, .L729+4
	ldr	r3, [r4, #28]
	ldr	ip, [r4, #48]
	ldr	r0, [r2, #792]
	ldr	lr, [r2, #796]
	add	r1, r3, r0
	cmp	r1, #16
	add	r2, ip, lr
	movge	r1, #16
	orrs	r7, r1, r2
	strpl	r1, [r4, #28]
	strpl	r2, [r4, #48]
	bmi	.L728
.L720:
	mov	r0, r4
	bl	VCTRL_VarifyOption
	cmp	r0, #0
	bne	.L718
	mov	r2, r5
	mov	r1, r4
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_GetMemSize_onDecode
.L727:
	ldr	r2, .L729+8
	movw	r1, #4282
	mov	r0, r5
.L726:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L729+12
	ldr	r2, .L729+16
	bl	dprint_normal
.L718:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L728:
	str	r0, [sp]
	movw	r1, #4291
	stmib	sp, {ip, lr}
	mov	r0, #32
	ldr	r2, .L729+20
	bl	dprint_normal
	b	.L718
.L730:
	.align	2
.L729:
	.word	.LC112
	.word	.LANCHOR0
	.word	.LC113
	.word	.LANCHOR2+868
	.word	.LC31
	.word	.LC114
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	2
	.global	VCTRL_RegisterInterrupt
	.type	VCTRL_RegisterInterrupt, %function
VCTRL_RegisterInterrupt:
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
	ldr	r7, .L737
	ldr	r6, .L737+4
	mov	r0, #0
	ldr	r4, .L737+8
	ldr	r8, [r7, #200]
	ldr	r9, [r6, #84]
	bl	VFMW_GetString
	add	r5, r4, #800
	ldr	r1, .L737+12
	str	r5, [sp]
	mov	r2, r9
	mov	r3, r0
	mov	r0, #127
	blx	r8
	subs	r8, r0, #0
	bne	.L735
	mov	r0, #4
	ldr	r9, [r6, #84]
	ldr	r7, [r7, #200]
	mov	r6, #1
	str	r6, [r4, #216]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r2, r9
	ldr	r1, .L737+16
	mov	r3, r0
	mov	r0, #136
	blx	r7
	cmp	r0, #0
	streq	r6, [r4, #220]
	bne	.L736
.L733:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L735:
	mov	r3, #127
	ldr	r2, .L737+20
	movw	r1, #4314
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L733
.L736:
	mov	r0, r8
	mov	r3, #136
	ldr	r2, .L737+20
	movw	r1, #4322
	bl	dprint_normal
	mvn	r0, #0
	b	.L733
.L738:
	.align	2
.L737:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	VCTRL_Isr_0
	.word	VCTRL_Scd_Isr
	.word	.LC115
	UNWIND(.fnend)
	.size	VCTRL_RegisterInterrupt, .-VCTRL_RegisterInterrupt
	.align	2
	.global	VCTRL_UnregisterInterrupt
	.type	VCTRL_UnregisterInterrupt, %function
VCTRL_UnregisterInterrupt:
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
	ldr	r4, .L743
	ldr	r3, [r4, #216]
	cmp	r3, #1
	beq	.L742
.L740:
	ldr	r3, [r4, #220]
	ldr	r4, .L743
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L743+4
	mov	r0, #4
	ldr	r5, [r3, #204]
	bl	VFMW_GetString
	add	r2, r4, #800
	mov	r1, r0
	mov	r0, #136
	blx	r5
	mov	r3, #0
	str	r3, [r4, #220]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L742:
	ldr	r3, .L743+4
	mov	r0, #0
	ldr	r5, [r3, #204]
	bl	VFMW_GetString
	add	r2, r4, #800
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #216]
	b	.L740
.L744:
	.align	2
.L743:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_UnregisterInterrupt, .-VCTRL_UnregisterInterrupt
	.align	2
	.global	VCTRL_MapVdmRegister
	.type	VCTRL_MapVdmRegister, %function
VCTRL_MapVdmRegister:
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
	mov	r0, #0
	add	r2, r4, #72
	movt	r0, 63683
	mov	r1, #65536
	bl	MEM_MapRegisterAddr
	subs	r5, r0, #0
	bne	.L748
	ldr	r2, [r4, #88]
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_AddMemRecord
.L747:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L748:
	mov	r3, #0
	ldr	r2, .L749
	movt	r3, 63683
	movw	r1, #4377
	mov	r0, #0
	mvn	r5, #0
	bl	dprint_normal
	b	.L747
.L750:
	.align	2
.L749:
	.word	.LC116
	UNWIND(.fnend)
	.size	VCTRL_MapVdmRegister, .-VCTRL_MapVdmRegister
	.align	2
	.global	VCTRL_UnmapVdmRegister
	.type	VCTRL_UnmapVdmRegister, %function
VCTRL_UnmapVdmRegister:
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
	ldr	r5, [r0, #88]
	mov	r4, r0
	ldr	r6, [r0, #80]
	cmp	r5, #0
	ldr	r7, [r0, #76]
	beq	.L752
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L756
	add	r0, r4, #72
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
.L752:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_DelMemRecord
.L757:
	.align	2
.L756:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_UnmapVdmRegister, .-VCTRL_UnmapVdmRegister
	.align	2
	.global	VCTRL_InitVdmHal
	.type	VCTRL_InitVdmHal, %function
VCTRL_InitVdmHal:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	ldr	r7, .L769
	mov	r4, r0
	mov	r0, #15
	ldr	r6, .L769+4
	ldr	r8, [r7, #68]
	bl	VFMW_GetString
	mov	r3, #0
	mov	r1, #20
	mov	r5, r3
	mov	r2, r0
	sub	r0, fp, #76
	blx	r8
	ldr	r3, [r6, #44]
	strb	r5, [fp, #-57]
	cmp	r3, r5
	beq	.L759
	mov	r0, r5
	blx	r3
	subs	r2, r0, #0
	ble	.L759
	str	r5, [r4, #20]
	sub	r0, fp, #76
	str	r5, [sp]
	mov	r3, r4
	mov	r1, r5
	bl	MEM_AllocMemBlock
	subs	r8, r0, #0
	bne	.L760
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_AddMemRecord
	ldr	r3, [r7, #48]
	mov	r2, #20
	mov	r1, r8
	sub	r0, fp, #56
	blx	r3
	ldr	r3, [r6, #48]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	cmp	r3, r5
	str	r8, [fp, #-48]
	str	r1, [fp, #-56]
	str	r2, [fp, #-52]
	beq	.L761
	sub	r0, fp, #56
	blx	r3
	subs	r4, r0, #0
	bne	.L761
	bl	VDMDRV_Init
.L762:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L759:
	mov	r3, #0
	ldr	r2, .L769+8
	mov	r0, r3
	movw	r1, #4482
	bl	dprint_normal
	mvn	r4, #0
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L761:
	mov	r3, #0
	ldr	r2, .L769+12
	mov	r0, r3
	movw	r1, #4510
	bl	dprint_normal
	mvn	r4, #0
	b	.L762
.L760:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L769+16
	movw	r1, #4496
	bl	dprint_normal
	mvn	r4, #0
	b	.L762
.L770:
	.align	2
.L769:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LC117
	.word	.LC119
	.word	.LC118
	UNWIND(.fnend)
	.size	VCTRL_InitVdmHal, .-VCTRL_InitVdmHal
	.align	2
	.global	VCTRL_DeinitVdmHal
	.type	VCTRL_DeinitVdmHal, %function
VCTRL_DeinitVdmHal:
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
	ldr	r3, [r0, #48]
	mov	r4, r0
	cmp	r3, #0
	beq	.L779
	ldr	r3, [r0, #64]
	adds	r5, r3, #0
	movne	r5, #1
.L772:
	ldr	r6, [r4, #16]
	ldr	r7, [r4, #8]
	cmp	r6, #0
	ldr	r8, [r4, #4]
	beq	.L773
	ldr	r3, .L786
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L785
	mov	r0, #0
	blx	r2
.L778:
	cmp	r5, #0
	beq	.L776
.L777:
	ldr	r3, .L786+4
	mov	r0, r4
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
.L773:
	mov	r2, r6
	mov	r1, r8
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MEM_DelMemRecord
.L785:
	movw	r3, #4550
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L786+8
	bl	dprint_normal
	b	.L778
.L776:
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	b	.L777
.L779:
	mov	r5, r3
	b	.L772
.L787:
	.align	2
.L786:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC66
	UNWIND(.fnend)
	.size	VCTRL_DeinitVdmHal, .-VCTRL_DeinitVdmHal
	.align	2
	.global	VCTRL_InitScdHal
	.type	VCTRL_InitScdHal, %function
VCTRL_InitScdHal:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r3, .L792
	mov	r4, r0
	mov	r0, #17
	mov	r5, #0
	ldr	r6, [r3, #68]
	bl	VFMW_GetString
	mov	r3, r5
	mov	r1, #20
	mov	r2, r0
	sub	r0, fp, #48
	blx	r6
	str	r5, [r4, #44]
	sub	r0, fp, #48
	add	r3, r4, #24
	str	r5, [sp]
	mov	r1, r5
	mov	r2, #25600
	strb	r5, [fp, #-29]
	bl	MEM_AllocMemBlock
	subs	r6, r0, #0
	bne	.L789
	ldr	r2, [r4, #40]
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_AddMemRecord
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #32]
	mov	r2, r6
	bl	SM_OpenSCDDrv
	subs	r4, r0, #0
	bne	.L790
	bl	SM_InstInit
.L791:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L789:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L792+4
	movw	r1, #4592
	bl	dprint_normal
	mvn	r4, #0
	b	.L791
.L790:
	mov	r3, r6
	mov	r0, r6
	ldr	r2, .L792+8
	movw	r1, #4600
	bl	dprint_normal
	mvn	r4, #0
	b	.L791
.L793:
	.align	2
.L792:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC120
	.word	.LC121
	UNWIND(.fnend)
	.size	VCTRL_InitScdHal, .-VCTRL_InitScdHal
	.align	2
	.global	VCTRL_DeinitScdHal
	.type	VCTRL_DeinitScdHal, %function
VCTRL_DeinitScdHal:
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
	ldr	r3, [r0, #48]
	mov	r4, r0
	cmp	r3, #0
	beq	.L795
	ldr	r3, [r0, #64]
	cmp	r3, #0
	beq	.L795
	ldr	r5, [r0, #40]
	ldr	r7, [r0, #32]
	cmp	r5, #0
	ldr	r6, [r0, #28]
	bne	.L806
.L799:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r7
	bl	MEM_DelMemRecord
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_InstInit
.L795:
	ldr	r5, [r4, #40]
	ldr	r7, [r4, #32]
	cmp	r5, #0
	ldr	r6, [r4, #28]
	beq	.L799
	mov	r0, #0
	add	r8, r4, #24
	bl	SM_CloseSCDDrv
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_ReleaseMemBlock
.L797:
	ldr	r3, .L807
	mov	r0, r8
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L799
.L806:
	mov	r0, #0
	add	r8, r4, #24
	bl	SM_CloseSCDDrv
	b	.L797
.L808:
	.align	2
.L807:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_DeinitScdHal, .-VCTRL_DeinitScdHal
	.align	2
	.global	VCTRL_GetNextDecodeMode
	.type	VCTRL_GetNextDecodeMode, %function
VCTRL_GetNextDecodeMode:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	movw	r6, #21846
	mov	r3, r2, asl #1
	cmp	r2, #0
	movt	r6, 21845
	add	r5, r2, #7
	smull	r6, r7, r3, r6
	movge	r5, r2
	mov	r5, r5, asr #3
	str	r2, [sp, #4]
	mov	r6, r0
	str	r1, [sp, #8]
	sub	r3, r7, r3, asr #31
	mov	r4, r2
	str	r3, [sp]
	mov	r8, r1
	ldr	r2, .L816
	mov	r3, r5
	movw	r1, #4656
	mov	r0, #25
	bl	dprint_normal
	cmp	r6, #3
	beq	.L814
	cmp	r4, r8
	blt	.L815
.L813:
	mov	r4, r6
.L811:
	str	r4, [sp]
	mov	r3, r6
	ldr	r2, .L816+4
	movw	r1, #4675
	mov	r0, #25
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L815:
	ldr	r2, .L816+8
	movw	r1, #4670
	mov	r0, #25
	mov	r4, #3
	bl	dprint_normal
	b	.L811
.L814:
	cmp	r5, r8
	ble	.L813
	ldr	r2, .L816+12
	movw	r1, #4662
	mov	r0, #25
	mov	r4, #0
	bl	dprint_normal
	b	.L811
.L817:
	.align	2
.L816:
	.word	.LC122
	.word	.LC125
	.word	.LC124
	.word	.LC123
	UNWIND(.fnend)
	.size	VCTRL_GetNextDecodeMode, .-VCTRL_GetNextDecodeMode
	.align	2
	.global	VCTRL_GetChanPriorityTab
	.type	VCTRL_GetChanPriorityTab, %function
VCTRL_GetChanPriorityTab:
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
	ldr	r2, .L823
	add	r1, r0, #16
.L821:
	ldr	r3, [r2], #4
	add	r0, r0, #4
	cmp	r3, #0
	ldrne	r3, [r3, #28]
	str	r3, [r0, #-4]
	cmp	r0, r1
	bne	.L821
	ldmfd	sp, {fp, sp, pc}
.L824:
	.align	2
.L823:
	.word	.LANCHOR0+48
	UNWIND(.fnend)
	.size	VCTRL_GetChanPriorityTab, .-VCTRL_GetChanPriorityTab
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	ip, r0, #0
	ldrne	r1, .L836
	movne	r0, #0
	beq	.L835
.L829:
	ldr	r2, [r1], #4
	cmp	r2, #0
	add	r3, r2, #207872
	add	r3, r3, #488
	beq	.L828
	cmp	ip, r3
	beq	.L827
.L828:
	add	r0, r0, #1
	cmp	r0, #4
	bne	.L829
	mvn	r0, #0
.L827:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L835:
	ldr	r2, .L836+4
	movw	r3, #4703
	mov	r1, r3
	str	r3, [sp]
	ldr	r3, .L836+8
	str	r2, [sp, #4]
	ldr	r2, .L836+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L827
.L837:
	.align	2
.L836:
	.word	.LANCHOR0+48
	.word	.LC126
	.word	.LANCHOR2+892
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	2
	.global	VCTRL_DecChanProcessPts
	.type	VCTRL_DecChanProcessPts, %function
VCTRL_DecChanProcessPts:
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
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r6, .L859
	mov	r7, r0, asl #2
	mov	r4, r1
	add	r8, r6, r7
	mov	r5, r0
	ldr	r1, [r8, #48]
	add	ip, r1, #204800
	ldr	r2, [ip, #2464]
	cmp	r2, #6
	cmpne	r2, #18
	sub	lr, r2, #2
	moveq	r3, #1
	movne	r3, #0
	cmp	lr, #1
	orrls	r3, r3, #1
	cmp	r3, #0
	bne	.L855
	ldrd	r6, [r4, #32]
	mvn	r3, #0
	mvn	r2, #0
	add	r1, r1, #206848
	cmp	r7, r3
	add	r3, r1, #656
	cmpeq	r6, r2
	beq	.L856
	strd	r6, [r3]
.L850:
	ldrd	r8, [r4, #48]
	add	lr, r1, #672
	add	r0, r1, #688
	mov	r3, r5
	ldr	r2, .L859+4
	movw	r1, #4824
	strd	r8, [lr]
	strd	r8, [fp, #-44]
	ldrd	r8, [r4, #56]
	strd	r8, [r0]
	mov	r0, #24
	ldr	lr, [r4, #64]
	str	lr, [ip, #2752]
	ldr	lr, [r4, #68]
	str	lr, [ip, #2756]
	ldr	lr, [r4, #72]
	str	lr, [ip, #2760]
	ldr	lr, [r4, #76]
	str	lr, [ip, #2776]
	ldrb	lr, [r4, #16]	@ zero_extendqisi2
	ldrd	r4, [fp, #-44]
	strb	lr, [ip, #2700]
	strd	r4, [sp, #8]
	strd	r6, [sp]
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L856:
	ldrd	r6, [r3]
	b	.L850
.L855:
	add	r1, r1, #207872
	add	r3, r4, #8
	add	r1, r1, #128
	bl	IsNewpicSeg
	cmp	r0, #0
	bne	.L840
	ldr	r1, [r8, #48]
	add	r0, r1, #204800
	add	r1, r1, #206848
	ldr	r3, [r0, #2464]
	cmp	r3, #3
	beq	.L857
	add	ip, r1, #672
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r8, [ip, #-8]
	cmp	r9, r3
	add	r3, r1, #656
	cmpeq	r8, r2
	beq	.L858
	strd	r8, [r3]
.L842:
	add	lr, r1, #688
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [ip, #-8]
	ldrd	r2, [lr, #-8]
	add	r1, r1, #704
	strd	r2, [ip]
	ldrd	r2, [r1, #-8]
	orrs	r1, r2, r3
	strd	r2, [lr]
	ldreqd	r2, [r4, #56]
	streqd	r2, [lr]
.L844:
	ldr	r2, [r0, #2768]
	mov	r3, r5
	ldr	r1, [r0, #2772]
	ldr	ip, [r0, #2764]
	str	r2, [r0, #2756]
	ldr	r2, [r0, #2780]
	str	r1, [r0, #2760]
	movw	r1, #4778
	str	ip, [r0, #2752]
	str	r2, [r0, #2776]
	mov	r0, #24
	strd	r8, [sp]
	ldr	r2, .L859+8
	bl	dprint_normal
	add	r3, r6, r7
	ldr	r0, [r3, #48]
	add	r1, r0, #204800
	ldr	r3, [r1, #2464]
	cmp	r3, #3
	bne	.L845
	ldrd	r2, [r4, #32]
	add	r0, r0, #206848
	add	lr, r0, #672
	add	ip, r0, #688
	add	r0, r0, #704
	strd	r2, [lr, #-8]
	ldrd	r2, [r4, #48]
	strd	r2, [ip, #-8]
	ldrd	r2, [r4, #56]
	strd	r2, [r0, #-8]
	ldr	r3, [r4, #64]
	str	r3, [r1, #2764]
	ldr	r3, [r4, #68]
	str	r3, [r1, #2768]
	ldr	r3, [r4, #72]
	str	r3, [r1, #2772]
	ldr	r3, [r4, #76]
	str	r3, [r1, #2780]
.L840:
	add	r6, r6, r7
	ldr	r0, [r6, #48]
	add	r1, r0, #204800
	ldr	r3, [r1, #2464]
	cmp	r3, #3
	addeq	r0, r0, #206848
	beq	.L846
.L845:
	ldrd	r2, [r4, #32]
	mvn	r7, #0
	mvn	r6, #0
	add	r0, r0, #206848
	cmp	r3, r7
	cmpeq	r2, r6
	addne	ip, r0, #672
	strned	r2, [ip, #-8]
.L847:
	ldrd	r2, [r4, #48]
	add	lr, r0, #688
	add	ip, r0, #704
	strd	r2, [lr, #-8]
	ldrd	r2, [r4, #56]
	strd	r2, [ip, #-8]
	ldr	r3, [r4, #64]
	str	r3, [r1, #2764]
	ldr	r3, [r4, #68]
	str	r3, [r1, #2768]
	ldr	r3, [r4, #72]
	str	r3, [r1, #2772]
	ldr	r3, [r4, #76]
	str	r3, [r1, #2780]
.L846:
	add	r0, r0, #672
	mov	r3, r5
	ldr	r2, .L859+12
	movw	r1, #4807
	ldrd	r4, [r0]
	mov	r0, #24
	strd	r4, [sp]
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L857:
	add	ip, r1, #672
	add	r3, r1, #656
	ldrd	r8, [ip, #-8]
	strd	r8, [r3]
	b	.L842
.L858:
	ldrd	r8, [r3]
	b	.L842
.L860:
	.align	2
.L859:
	.word	.LANCHOR0
	.word	.LC129
	.word	.LC127
	.word	.LC128
	UNWIND(.fnend)
	.size	VCTRL_DecChanProcessPts, .-VCTRL_DecChanProcessPts
	.align	2
	.global	VCTRL_DecChanCheckDecParam
	.type	VCTRL_DecChanCheckDecParam, %function
VCTRL_DecChanCheckDecParam:
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
	ldr	r3, .L865
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #128]
	cmp	r3, #20
	beq	.L863
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	mvnne	r0, #1
	moveq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L863:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L866:
	.align	2
.L865:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_DecChanCheckDecParam, .-VCTRL_DecChanCheckDecParam
	.align	2
	.global	VCTRL_DecChanSyntax
	.type	VCTRL_DecChanSyntax, %function
VCTRL_DecChanSyntax:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	cmp	r0, #3
	mov	r4, r0
	ldrhi	r2, .L899
	movwhi	r3, #4850
	bhi	.L889
	ldr	r2, .L899+4
	mov	r3, r0, asl #2
	str	r3, [fp, #-48]
	add	r6, r2, r3
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L893
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L894
	ldr	r5, [r3, #32]
	cmp	r5, #0
	ldrne	r2, .L899+8
	movwne	r3, #4853
	bne	.L889
	bl	IsPrintStateAllow
	ldr	r3, [r6, #48]
	ldr	r3, [r3, #128]
	cmp	r3, #20
	mov	r7, r0
	beq	.L873
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	bne	.L895
.L873:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	beq	.L896
	cmp	r7, #1
	mvnne	r5, #2
	beq	.L897
.L887:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L895:
	cmp	r7, #1
	mvnne	r5, #1
	bne	.L887
	mov	r3, r4
	ldr	r2, .L899+12
	movw	r1, #4862
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #1
	b	.L887
.L896:
	ldr	r3, .L899+4
	ldr	r2, [fp, #-48]
	add	r3, r3, r2
	ldr	r1, [r3, #48]
	add	r6, r1, #204800
	add	r1, r1, #206848
	add	r10, r1, #736
	ldrb	r3, [r6, #2785]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L875
	ldr	r3, [r6, #3520]
	cmp	r3, #0
	beq	.L898
.L875:
	add	r6, r6, #2784
	mov	r3, r4
	ldr	r2, .L899+16
	movw	r1, #4896
	ldrd	r8, [r6, #48]
	mov	r0, #24
	strd	r8, [sp, #8]
	ldrd	r6, [r6, #32]
	strd	r6, [sp]
	bl	dprint_normal
	mov	r1, r10
	mov	r0, r4
	bl	VCTRL_DecChanProcessPts
	ldr	r2, [fp, #-48]
	ldr	r3, .L899+4
	mov	r0, r10
	add	r8, r3, r2
	ldr	r3, [r8, #48]
	add	r2, r3, #207872
	add	r2, r2, #488
	ldr	r1, [r3, #128]
	bl	DecodeStream
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L894:
	ldr	r2, .L899+20
	movw	r3, #4852
.L889:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L899+24
	mvn	r5, #0
	ldr	r2, .L899+28
	bl	dprint_normal
	b	.L887
.L897:
	mov	r3, r4
	ldr	r2, .L899+32
	movw	r1, #4873
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #2
	b	.L887
.L898:
	add	r1, r1, #744
	mov	r0, r4
	bl	SM_ReadSegStream
	cmp	r0, #0
	beq	.L875
	cmp	r7, #1
	mvnne	r5, #3
	bne	.L887
	mov	r3, r4
	ldr	r2, .L899+36
	movw	r1, #4888
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #3
	b	.L887
.L893:
	ldr	r2, .L899+40
	movw	r1, #4851
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L899+24
	mvn	r5, #0
	str	r2, [sp, #4]
	ldr	r2, .L899+28
	bl	dprint_normal
	b	.L887
.L900:
	.align	2
.L899:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC130
	.word	.LC131
	.word	.LC134
	.word	.LC107
	.word	.LANCHOR2+916
	.word	.LC31
	.word	.LC132
	.word	.LC133
	.word	.LC91
	UNWIND(.fnend)
	.size	VCTRL_DecChanSyntax, .-VCTRL_DecChanSyntax
	.align	2
	.global	VCTRL_DecSyntax
	.type	VCTRL_DecSyntax, %function
VCTRL_DecSyntax:
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
	ldr	r1, .L935
	add	r3, r1, #756
	add	r0, r1, #772
.L904:
	ldr	r2, [r1], #4
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #28]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L904
	ldr	r7, .L935+4
	mvn	r4, #0
	ldr	r10, .L935+8
.L905:
	ldr	r3, [r7, #804]
	ldr	r2, [r7, #808]
	ldr	r0, .L935+4
	cmp	r3, r2
	movlt	r3, r2
	ldr	r2, [r7, #812]
	movlt	r6, #1
	movge	r6, #0
	cmp	r3, r2
	movlt	r3, r2
	ldr	r2, [r7, #816]
	movlt	r6, #2
	cmp	r3, r2
	movlt	r6, #3
	movlt	r3, r2
	mov	r9, r6, asl #2
	cmp	r3, #0
	add	r3, r7, r9
	mov	r2, #0
	add	r1, r6, #1
	str	r1, [r7, #84]
	str	r2, [r3, #804]
	ble	.L909
	ldr	r3, [r3, #48]
	cmp	r3, r2
	beq	.L905
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L905
	add	r3, r3, #204800
	ldr	r2, [r3, #2488]
	cmp	r2, #0
	ble	.L911
	ldr	r4, [r3, #2492]
	cmp	r4, #0
	beq	.L932
.L911:
	mov	r5, #500
	add	r8, r7, r9
	b	.L919
.L914:
	cmp	r0, #0
	bne	.L933
	ldr	r3, [r8, #48]
	add	r3, r3, #204800
	ldr	r2, [r3, #3540]
	cmp	r2, #1
	beq	.L917
	subs	r5, r5, #1
	beq	.L905
.L919:
	mov	r0, r6
	bl	VCTRL_DecChanSyntax
	cmn	r0, #1
	mov	r4, r0
	bne	.L914
	ldr	r5, [r7, #820]
	cmp	r5, #0
	beq	.L926
	mov	r3, #0
	mov	r0, r6
	mov	r2, r3
	mov	r1, #21
	blx	r5
.L926:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L933:
	add	r9, r7, r9
	ldr	r3, [r9, #48]
	add	r3, r3, #204800
.L917:
	mov	r2, #0
	str	r2, [r3, #3540]
	b	.L905
.L932:
	mov	r0, r6
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L934
.L912:
	add	r5, r7, r9
	ldr	r1, [fp, #-56]
	ldr	r4, [r5, #48]
	add	r4, r4, #204800
	ldr	r2, [r4, #2488]
	ldr	r0, [r4, #2680]
	bl	VCTRL_GetNextDecodeMode
	ldr	r3, [r5, #48]
	add	r3, r3, #204800
	str	r0, [r4, #2680]
	ldr	r2, [r3, #2680]
	cmp	r2, #0
	ldreq	r2, [r3, #2484]
	movne	r2, #0
	str	r2, [r3, #2676]
	str	r2, [r3, #2672]
	b	.L911
.L909:
	str	r2, [r0, #84]
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L934:
	mov	r1, r4
	sub	r0, fp, #68
	ldr	r3, [r10, #48]
	mov	r2, #24
	blx	r3
	b	.L912
.L936:
	.align	2
.L935:
	.word	.LANCHOR0+48
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_DecSyntax, .-VCTRL_DecSyntax
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
	cmp	r0, #3
	bhi	.L947
	ldr	r3, .L948
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #128]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L947
.L940:
	.word	.L944
	.word	.L947
	.word	.L941
	.word	.L942
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L943
	.word	.L947
	.word	.L947
	.word	.L947
	.word	.L944
.L944:
	add	r0, r0, #207872
	add	r0, r0, #496
	ldmfd	sp, {fp, sp, pc}
.L943:
	add	r0, r0, #216064
	add	r0, r0, #176
	ldmfd	sp, {fp, sp, pc}
.L941:
	add	r0, r0, #230400
	add	r0, r0, #512
	ldmfd	sp, {fp, sp, pc}
.L942:
	add	r0, r0, #286720
	add	r0, r0, #3616
	ldmfd	sp, {fp, sp, pc}
.L947:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L949:
	.align	2
.L948:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	2
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
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
	cmp	r0, #3
	mov	r6, r1
	mov	r5, r2
	mov	r7, r3
	bhi	.L964
	ldr	ip, .L970
	add	r4, ip, r0, lsl #2
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldreq	r2, .L970+4
	movweq	r1, #5108
	moveq	r0, r3
	beq	.L963
	cmp	r6, #0
	beq	.L965
	cmp	r5, #0
	ldreq	r2, .L970+8
	movweq	r1, #5110
	moveq	r0, r5
	beq	.L963
	cmp	r7, #0
	ldreq	r2, .L970+12
	movweq	r1, #5111
	moveq	r0, r7
	beq	.L963
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L957
	mov	r2, r7
	mov	r1, r5
	bl	SYNTAX_GetQueueImgNum
	ldr	r2, [r4, #48]
	ldr	r3, [r2, #128]
	cmp	r3, #0
	beq	.L966
	cmp	r3, #16
	beq	.L967
	cmp	r3, #17
	beq	.L968
	cmp	r3, #15
	beq	.L969
	cmp	r3, #18
	movne	r3, #2
	strne	r3, [r6]
	bne	.L950
	str	r3, [sp]
	movw	r1, #5156
	ldr	r3, .L970+16
	mov	r0, #32
	ldr	r2, .L970+20
	bl	dprint_normal
	b	.L950
.L964:
	ldr	r2, .L970+24
	movw	r3, #5107
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L970+16
	str	r2, [sp, #4]
	ldr	r2, .L970+28
	bl	dprint_normal
.L950:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L957:
	str	r3, [r7]
	str	r3, [r5]
	str	r3, [r6]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L966:
	add	r2, r2, #233472
	ldr	r3, [r2, #1600]
	str	r3, [r6]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L965:
	ldr	r2, .L970+32
	movw	r1, #5109
	mov	r0, r6
.L963:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L970+16
	ldr	r2, .L970+28
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L967:
	add	r2, r2, #208896
	ldr	r3, [r2, #1836]
	ldr	r3, [r3, #184]
	str	r3, [r6]
	b	.L950
.L969:
	mov	r2, #15
	ldr	r3, .L970+16
	str	r2, [sp]
	movw	r1, #5148
	ldr	r2, .L970+20
	mov	r0, #32
	bl	dprint_normal
	b	.L950
.L968:
	str	r3, [sp]
	movw	r1, #5140
	ldr	r3, .L970+16
	mov	r0, #32
	ldr	r2, .L970+20
	bl	dprint_normal
	b	.L950
.L971:
	.align	2
.L970:
	.word	.LANCHOR0
	.word	.LC88
	.word	.LC136
	.word	.LC137
	.word	.LANCHOR2+936
	.word	.LC138
	.word	.LC40
	.word	.LC31
	.word	.LC135
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	cmp	r0, #3
	mov	r5, r0
	mov	r4, r1
	bhi	.L978
	ldr	r7, .L980
	add	r6, r7, r0, lsl #2
	ldr	r0, [r6, #48]
	cmp	r0, #0
	ldreq	r2, .L980+4
	movweq	r1, #1274
	beq	.L977
	cmp	r4, #0
	beq	.L979
	ldr	r0, .L980+8
	mov	r3, #0
	mov	r1, r3
	str	r3, [fp, #-64]
	str	r3, [fp, #-68]
	mov	r2, #100
	ldr	r8, [r0, #48]
	mov	r0, r4
	str	r3, [fp, #-72]
	blx	r8
	ldr	r3, [r6, #48]
	mov	r0, r5
	add	r3, r3, #204800
	ldr	r2, [r3, #3216]
	str	r2, [r4, #32]
	ldr	r2, [r3, #3220]
	str	r2, [r4, #36]
	ldr	r3, [r3, #3224]
	str	r3, [r4, #44]
	bl	FSP_GetWaitDispFsNum
	str	r0, [r4, #84]
	mov	r0, r5
	bl	FSP_GetTotalDispFsNum
	sub	r3, fp, #64
	sub	r2, fp, #68
	sub	r1, fp, #72
	str	r0, [r4, #92]
	mov	r0, r5
	bl	VCTRL_GetChanImgNum
	mov	r3, #100
	mla	r3, r3, r5, r7
	ldr	r2, [fp, #-68]
	ldr	ip, [fp, #-64]
	sub	r1, fp, #60
	mov	r0, r5
	add	r2, r2, ip
	str	r2, [r4, #48]
	ldr	r2, [r3, #472]
	str	r2, [r4, #96]
	ldr	r3, [r3, #384]
	str	r3, [r4, #20]
	bl	SM_GetInfo
	ldr	r2, [fp, #-40]
	ldr	r3, [r6, #48]
	ldr	r0, [fp, #-44]
	cmp	r2, #10
	ldr	r1, [fp, #-52]
	add	r3, r3, #221184
	movle	r2, #0
	movgt	r2, #1
	str	r0, [r4, #52]
	str	r1, [r4, #56]
	str	r2, [r4, #80]
	ldrb	r3, [r3, #2984]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r4, #88]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L978:
	ldr	r2, .L980+12
	movw	r3, #1273
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L980+16
	str	r2, [sp, #4]
	ldr	r2, .L980+20
	bl	dprint_normal
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L979:
	ldr	r2, .L980+24
	movw	r1, #1275
	mov	r0, r4
.L977:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L980+16
	ldr	r2, .L980+20
	bl	dprint_normal
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L981:
	.align	2
.L980:
	.word	.LANCHOR0
	.word	.LC90
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC89
	.word	.LANCHOR2+956
	.word	.LC31
	.word	.LC139
	UNWIND(.fnend)
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	2
	.global	VCTRL_GetVfmwProcHandler
	.type	VCTRL_GetVfmwProcHandler, %function
VCTRL_GetVfmwProcHandler:
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
	ldrne	r3, .L994
	bne	.L986
	b	.L992
.L987:
	ldr	r2, [r3, #40]!
	cmp	r2, r1
	beq	.L993
.L986:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	bne	.L987
	ldmfd	sp, {fp, sp, pc}
.L993:
	ldmfd	sp, {fp, sp, pc}
.L992:
	ldr	r0, .L994+4
	ldmfd	sp, {fp, sp, pc}
.L995:
	.align	2
.L994:
	.word	.LANCHOR2+976
	.word	VfmwProc_SetPrintLevel
	UNWIND(.fnend)
	.size	VCTRL_GetVfmwProcHandler, .-VCTRL_GetVfmwProcHandler
	.align	2
	.global	VCTRL_ShowProcCommand
	.type	VCTRL_ShowProcCommand, %function
VCTRL_ShowProcCommand:
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
	subs	r4, r1, #0
	mov	r5, r2
	beq	.L1000
	cmp	r0, #40
	bhi	.L999
	mov	r2, r0, asl #5
	ldr	r3, .L1001
	add	ip, r2, r0, lsl #3
	ldr	lr, .L1001+4
	add	r1, r3, ip
	mov	r0, r4
	add	ip, r1, #984
	ldr	r2, .L1001+8
	ldr	r3, [r1, #976]
	mov	r1, r5
	str	ip, [sp]
	add	r4, r4, r5
	ldr	r6, [lr, #68]
	blx	r6
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #-1]
.L998:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L999:
	mvn	r0, #0
	b	.L998
.L1000:
	ldr	r2, .L1001+12
	movw	r1, #6148
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L1001+16
	str	r2, [sp, #4]
	ldr	r2, .L1001+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L998
.L1002:
	.align	2
.L1001:
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC141
	.word	.LC140
	.word	.LANCHOR2+2656
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_ShowProcCommand, .-VCTRL_ShowProcCommand
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
	beq	.L1010
	cmp	r0, #0
	ldrne	r2, .L1016
	bne	.L1008
	b	.L1015
.L1009:
	ldr	ip, [r2, #40]!
	cmp	r0, ip
	beq	.L1006
.L1008:
	ldr	r4, [r2, #44]
	cmp	r4, #0
	bne	.L1009
	mov	r3, r0
	ldr	r2, .L1016+4
	movw	r1, #6179
	mov	r0, #32
	bl	dprint_normal
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1015:
	ldr	r4, .L1016+8
.L1006:
	mov	r0, r1
	blx	r4
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1010:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1017:
	.align	2
.L1016:
	.word	.LANCHOR2+976
	.word	.LC142
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
	cmp	r0, #3
	bhi	.L1024
	ldr	r3, .L1025
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	cmp	r3, #0
	strne	r1, [r3, #140]
	ldmfd	sp, {fp, sp, pc}
.L1024:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.19
.L1026:
	.align	2
.L1025:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	2
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	subs	r5, r1, #0
	moveq	r1, #2
	beq	.L1029
	cmp	r5, #1
	moveq	r1, #3
	movne	r1, #4
.L1029:
	cmp	r0, #3
	bhi	.L1041
	ldr	r3, .L1042
	add	r2, r3, r0, lsl #2
	ldr	r2, [r2, #48]
	cmp	r2, #0
	strne	r1, [r2, #140]
.L1032:
	ldr	r4, [r3, #820]
	cmp	r4, #0
	beq	.L1027
	sub	r2, fp, #20
	mov	r3, #4
	mov	r1, #44
	str	r5, [r2, #-4]!
	blx	r4
.L1027:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1041:
	str	r0, [fp, #-32]
	bl	VCTRL_SetLastFrameState.part.19
	ldr	r3, .L1042
	ldr	r0, [fp, #-32]
	b	.L1032
.L1043:
	.align	2
.L1042:
	.word	.LANCHOR0
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
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #3
	mov	r5, r0
	bhi	.L1059
	ldr	r4, .L1061
	mov	r6, r0, asl #2
	add	r3, r4, r6
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L1060
	add	r3, r1, #204800
	ldr	r3, [r3, #3552]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L1048
.L1050:
	.word	.L1049
	.word	.L1048
	.word	.L1051
	.word	.L1052
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1048
	.word	.L1053
.L1051:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	MPEG4DEC_FlushRemainImg
	ldr	r1, [r4, #48]
.L1048:
	add	r1, r1, #207872
	mov	r0, r5
	add	r1, r1, #480
	bl	SYNTAX_MarkImageEos
	cmn	r0, #1
	mov	r4, r0
	beq	.L1055
	cmp	r0, #0
	beq	.L1056
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	sub	r3, r4, #2
	ldr	r2, .L1061+4
	movw	r1, #6332
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
.L1046:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1056:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r2, .L1061+8
	movw	r1, #6327
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1055:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r2, .L1061+12
	movw	r1, #6322
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1053:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	HEVCDEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1048
.L1049:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	H264DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1048
.L1052:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	MPEG2DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1048
.L1059:
	ldr	r2, .L1061+16
	movw	r3, #6232
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1061+20
	str	r2, [sp, #4]
	ldr	r2, .L1061+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1046
.L1060:
	ldr	r2, .L1061+28
	movw	r3, #6233
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L1061+20
	str	r2, [sp, #4]
	ldr	r2, .L1061+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1046
.L1062:
	.align	2
.L1061:
	.word	.LANCHOR0
	.word	.LC145
	.word	.LC144
	.word	.LC143
	.word	.LC105
	.word	.LANCHOR2+2680
	.word	.LC31
	.word	.LC90
	UNWIND(.fnend)
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	2
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
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
	ldr	ip, .L1080
	mov	r4, r0, asl #2
	mov	r5, r0
	add	r0, ip, r4
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L1075
	ldr	lr, [r0, #128]
	cmp	lr, #16
	ldrls	pc, [pc, lr, asl #2]
	b	.L1063
.L1067:
	.word	.L1066
	.word	.L1063
	.word	.L1068
	.word	.L1069
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1063
	.word	.L1070
.L1068:
	add	r4, ip, r4
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #229376
	ldrb	r2, [r2, #1924]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1076
.L1074:
	add	r3, r3, #208896
	mov	r2, #0
	str	r2, [r3, #500]
.L1063:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1070:
	add	r4, ip, r4
	add	r0, r0, #207872
	str	r3, [sp, #4]
	add	r0, r0, #488
	mov	r3, r2
	mov	r6, #0
	mov	r2, #1
	str	r6, [sp]
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #204800
	ldrb	r2, [r2, #3569]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1077
.L1072:
	add	r3, r3, #208896
	mov	r2, #0
	str	r2, [r3, #1884]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1066:
	add	r4, ip, r4
	add	r0, r0, #207872
	str	r3, [sp, #4]
	add	r0, r0, #488
	mov	r3, r2
	mov	r6, #0
	mov	r2, #1
	str	r6, [sp]
	bl	H264DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #221184
	ldrb	r2, [r2, #736]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1078
.L1071:
	add	r3, r3, #204800
	mov	r2, #0
	str	r2, [r3, #3920]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1069:
	add	r4, ip, r4
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r3, r3, #204800
	ldrb	r2, [r3, #3578]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1079
.L1073:
	mov	r2, #0
	str	r2, [r3, #3592]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1075:
	ldr	r2, .L1080+4
	movw	r1, #3750
	ldr	r3, .L1080+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1080+12
	bl	dprint_normal
	b	.L1063
.L1079:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r4, #48]
	mov	r1, #0
	add	r2, r2, #204800
	mov	r3, r2
	strb	r1, [r2, #3578]
	b	.L1073
.L1076:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	mov	r1, #0
	add	r2, r3, #229376
	strb	r1, [r2, #1924]
	b	.L1074
.L1078:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	add	r2, r3, #221184
	strb	r6, [r2, #736]
	b	.L1071
.L1077:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	add	r2, r3, #204800
	strb	r6, [r2, #3569]
	b	.L1072
.L1081:
	.align	2
.L1080:
	.word	.LANCHOR0
	.word	.LC33
	.word	.LANCHOR2+2704
	.word	.LC31
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
	cmp	r0, #3
	mov	r6, r2
	mov	r7, r3
	mov	r4, r0
	mov	r5, r1
	ldrhi	r2, .L1092
	movwhi	r3, #3998
	bhi	.L1090
	ldr	ip, .L1092+4
	add	ip, ip, r0, lsl #2
	ldr	ip, [ip, #48]
	cmp	ip, #0
	beq	.L1091
	ldr	ip, [ip, #20]
	cmp	ip, #1
	beq	.L1086
	ldr	r2, .L1092+8
	mov	r3, #4000
.L1090:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1092+12
	ldr	r2, .L1092+16
	bl	dprint_normal
.L1082:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1086:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1082
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_PostProc
.L1091:
	ldr	r2, .L1092+20
	movw	r1, #3999
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L1092+12
	str	r2, [sp, #4]
	ldr	r2, .L1092+16
	bl	dprint_normal
	b	.L1082
.L1093:
	.align	2
.L1092:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC107
	.word	.LANCHOR2+2720
	.word	.LC31
	.word	.LC33
	UNWIND(.fnend)
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
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
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	cmp	r0, #3
	ldrhi	r2, .L1117
	movwhi	r3, #6524
	bhi	.L1112
	ldr	r3, .L1117+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L1113
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L1099
	ldr	r2, .L1117+8
	mov	r3, #6528
.L1112:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1117+12
	ldr	r2, .L1117+16
	bl	dprint_normal
.L1095:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1099:
	ldr	r4, [r0, #128]
	sub	r1, fp, #20
	mov	r0, #3
	str	r4, [r1, #-4]!
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L1095
	sub	r0, fp, #32
	sub	r1, fp, #28
	bl	VCTRL_GetActiveChanNum
	ldr	r0, [fp, #-32]
	cmp	r0, #0
	beq	.L1114
.L1101:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	cmpeq	r4, #1
	bne	.L1095
	ldr	r3, .L1117+20
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L1095
	mov	r0, #0
	blx	r3
	b	.L1095
.L1113:
	ldr	r2, .L1117+24
	movw	r1, #6527
	ldr	r3, .L1117+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1117+16
	bl	dprint_normal
	b	.L1095
.L1114:
	ldr	r5, .L1117+20
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L1115
	blx	r2
.L1103:
	ldr	r2, [r5, #20]
	cmp	r2, #0
	beq	.L1116
	mov	r0, #0
	blx	r2
	b	.L1101
.L1115:
	movw	r3, #6402
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L1117+28
	bl	dprint_normal
	b	.L1103
.L1116:
	movw	r3, #6449
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L1117+28
	bl	dprint_normal
	b	.L1101
.L1118:
	.align	2
.L1117:
	.word	.LC146
	.word	.LANCHOR0
	.word	.LC148
	.word	.LANCHOR2+2740
	.word	.LC31
	.word	g_vdm_hal_fun_ptr
	.word	.LC147
	.word	.LC66
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #3
	mov	r5, r0
	ldrhi	r2, .L1133
	movhi	r3, #2272
	bhi	.L1130
	ldr	r4, .L1133+4
	mov	r6, r0, asl #2
	add	r8, r4, r6
	ldr	r3, [r8, #48]
	cmp	r3, #0
	beq	.L1131
	ldr	r7, [r3, #16]
	cmp	r7, #1
	bne	.L1132
	ldr	r3, [r3, #128]
	cmp	r3, #22
	ldreq	r2, .L1133+8
	movweq	r3, #2275
	beq	.L1130
	bl	SM_Start
	ldr	r0, [r8, #48]
	mov	r3, #0
	ldr	r2, [r0, #28]
	str	r7, [r0, #124]
	cmp	r2, r3
	str	r7, [r0, #24]
	str	r3, [r0, #32]
	bne	.L1125
	ldr	r1, .L1133+12
	add	r3, r4, #48
	add	r2, r4, #824
	add	lr, r4, #64
	str	r7, [r0, #28]
.L1128:
	ldr	r0, [r3], #4
	add	r2, r2, #4
	add	r1, r1, #4
	cmp	r0, #0
	streq	r0, [r2, #-4]
	ldrne	ip, [r0, #28]
	ldrne	r0, [r3, #-4]
	strne	ip, [r2, #-4]
	ldrne	r0, [r0, #28]
	cmp	r3, lr
	str	r0, [r1, #-4]
	bne	.L1128
	ldr	r0, .L1133+16
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1125:
	ldr	r7, .L1133+20
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r2, #12
	ldr	r3, [r7, #48]
	mov	r1, #0
	ldr	r0, .L1133+24
	add	r4, r4, r6
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #720
	mov	r1, #0
	ldr	r0, .L1133+28
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #2
	mov	r1, #0
	ldr	r0, .L1133+32
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #120
	mov	r1, #0
	ldr	r0, .L1133+36
	blx	r3
	ldr	r3, [r4, #48]
	mov	r0, #0
	mov	r2, #1
	str	r2, [r3, #20]
.L1121:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1132:
	ldr	r2, .L1133+40
	movw	r3, #2274
.L1130:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1133+44
	ldr	r2, .L1133+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L1121
.L1131:
	ldr	r2, .L1133+52
	movw	r1, #2273
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1133+44
	str	r2, [sp, #4]
	ldr	r2, .L1133+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L1121
.L1134:
	.align	2
.L1133:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC149
	.word	g_ChanCtx
	.word	.LANCHOR0+824
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecId
	.word	g_TimeRecTable
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LC109
	.word	.LANCHOR2+2760
	.word	.LC31
	.word	.LC79
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
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r3, r4
	ldr	r2, .L1136
	movw	r1, #5793
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1137:
	.align	2
.L1136:
	.word	.LC150
	UNWIND(.fnend)
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	2
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	cmp	r0, #3
	mov	r4, r0
	ldrhi	r2, .L1152
	movwhi	r3, #6566
	bhi	.L1149
	ldr	r3, .L1152+4
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #48]
	cmp	r0, #0
	beq	.L1150
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L1142
	ldr	r2, .L1152+8
	movw	r3, #6570
.L1149:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1152+12
	ldr	r2, .L1152+16
	bl	dprint_normal
.L1138:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1142:
	ldr	r5, [r0, #128]
	sub	r1, fp, #20
	mov	r0, #3
	str	r5, [r1, #-4]!
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L1138
	sub	r1, fp, #28
	sub	r0, fp, #32
	bl	VCTRL_GetActiveChanNum
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L1151
.L1144:
	ldr	r0, [fp, #-28]
	cmp	r5, #1
	cmpeq	r0, #0
	movne	r0, #1
	moveq	r0, #0
	bne	.L1138
	ldr	r3, .L1152+20
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1138
	blx	r3
	b	.L1138
.L1150:
	ldr	r2, .L1152+24
	movw	r1, #6569
	ldr	r3, .L1152+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1152+16
	bl	dprint_normal
	b	.L1138
.L1151:
	mov	r0, r4
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	bl	VDMDRV_ResetVDH
	b	.L1144
.L1153:
	.align	2
.L1152:
	.word	.LC146
	.word	.LANCHOR0
	.word	.LC148
	.word	.LANCHOR2+2776
	.word	.LC31
	.word	g_vdm_hal_fun_ptr
	.word	.LC147
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
	cmp	r0, #3
	mov	r4, r0
	bhi	.L1160
	ldr	r6, .L1162
	add	r6, r6, r0, lsl #2
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L1161
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L1159
	str	r2, [r3, #32]
	mov	r2, #0
	str	r2, [r3, #20]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1159
	mov	r1, r5
	mov	r0, r4
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	ldr	r3, [r6, #48]
	mov	r0, r4
	str	r5, [r3, #32]
	bl	VCTRL_CloseHardware
	mov	r0, r5
.L1156:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1159:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1160:
	ldr	r2, .L1162+4
	movw	r3, #2357
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1162+8
	str	r2, [sp, #4]
	ldr	r2, .L1162+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1156
.L1161:
	ldr	r2, .L1162+16
	movw	r1, #2358
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1162+8
	str	r2, [sp, #4]
	ldr	r2, .L1162+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1156
.L1163:
	.align	2
.L1162:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+2796
	.word	.LC31
	.word	.LC151
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
	ldr	r5, .L1171
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1166
.L1170:
	add	r4, r4, #1
	ldr	r3, [r8, #120]
	blx	r3
	cmp	r4, #50
	beq	.L1168
.L1166:
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
	bne	.L1170
	cmp	r4, #49
	bgt	.L1168
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1168:
	ldr	r2, .L1171+4
	movw	r1, #2346
	mvn	r6, #0
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1172:
	.align	2
.L1171:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC152
	UNWIND(.fnend)
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	2
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
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
	ldr	r5, .L1200
	mov	r4, r0
	mov	r10, r1
	ldr	r3, [r5]
	blx	r3
	cmp	r4, #3
	mov	r7, r0
	bhi	.L1194
	ldr	r6, .L1200+4
	mov	r3, r4, asl #2
	str	r3, [fp, #-56]
	add	r8, r6, r3
	ldr	r0, [r8, #48]
	cmp	r0, #0
	beq	.L1195
	movw	r1, #2966
	ldr	r2, .L1200+8
	str	r1, [sp]
	mov	r0, #26
	ldr	r3, .L1200+12
	bl	dprint_normal
	ldr	r3, [r8, #48]
	mov	r0, r4
	ldr	r3, [r3, #20]
	str	r3, [fp, #-60]
	bl	VCTRL_StopChan
	ldr	r3, [r5, #12]
	mov	r0, #4
	blx	r3
	ldr	r0, [r8, #48]
	cmp	r0, #0
	beq	.L1196
	add	r1, r0, #207872
	mov	r0, r4
	add	r1, r1, #480
	bl	SYNTAX_MarkImageOutHanging
.L1178:
	ldr	r3, [fp, #-56]
	mov	r0, r4
	mvn	r9, #0
	add	r8, r6, r3
	bl	FSP_ResetInstance
	ldr	r2, [r10, #4]
	mov	r0, r4
	ldr	r3, [r8, #48]
	add	r3, r3, #204800
	str	r2, [r3, #3268]
	bl	VCTRL_InitSyntaxCtx
	ldr	r0, [r8, #48]
	ldr	r3, [r5, #48]
	mov	r2, #416
	add	r0, r0, #206848
	mov	r1, #0
	add	r0, r0, #736
	blx	r3
	ldr	r3, [r8, #48]
	mov	r2, #0
	mvn	r8, #0
	add	r1, r3, #206848
	add	ip, r3, #204800
	add	r0, r1, #656
	add	r1, r1, #672
	strd	r8, [r0]
	mov	r0, r4
	strd	r8, [r1, #-8]
	str	r2, [ip, #3200]
	str	r2, [ip, #3520]
	str	r2, [r3, #68]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #108]
	str	r2, [r3, #112]
	str	r2, [r3, #52]
	bl	InitUsdPool
	ldr	r3, [r5, #16]
	mov	r0, #4
	blx	r3
	ldr	r3, [r10]
	cmp	r3, #0
	beq	.L1197
	ldr	r2, [r6, #20]
	ldr	r3, .L1200+4
	cmp	r2, #0
	bne	.L1198
.L1180:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L1199
.L1184:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	movw	r3, #3019
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L1200+16
	mov	r0, #26
	ldr	r3, .L1200+12
	bl	dprint_normal
	ldr	r3, [r5]
	blx	r3
	mov	r3, #100
	mla	r4, r3, r4, r6
	mov	r3, #0
	rsb	r0, r7, r0
	str	r0, [r4, #436]
.L1175:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1197:
	mov	r0, r4
	bl	SM_Reset
	ldr	r2, [r6, #20]
	ldr	r3, .L1200+4
	cmp	r2, #0
	beq	.L1180
.L1198:
	ldr	r2, [fp, #-56]
	str	r4, [fp, #-48]
	add	r9, r3, r2
	ldr	r3, [r9, #292]
	cmp	r3, #0
	beq	.L1180
	mov	r0, #512
	sub	r1, fp, #48
	bl	VCTRL_SetDbgOption
	ldr	r3, [r9, #292]
	cmp	r3, #0
	beq	.L1180
	sub	r1, fp, #48
	mov	r0, #512
	bl	VCTRL_SetDbgOption
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L1184
.L1199:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1184
.L1196:
	ldr	r2, .L1200+20
	movw	r1, #2916
	ldr	r3, .L1200+24
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1200+28
	bl	dprint_normal
	b	.L1178
.L1194:
	ldr	r2, .L1200+32
	movw	r3, #2963
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1200+12
	str	r2, [sp, #4]
	ldr	r2, .L1200+28
	bl	dprint_normal
	mvn	r3, #0
	b	.L1175
.L1195:
	ldr	r2, .L1200+36
	movw	r1, #2964
	ldr	r3, .L1200+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1200+28
	bl	dprint_normal
	mvn	r3, #0
	b	.L1175
.L1201:
	.align	2
.L1200:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC153
	.word	.LANCHOR2+2812
	.word	.LC154
	.word	.LC33
	.word	.LANCHOR2+2840
	.word	.LC31
	.word	.LC89
	.word	.LC90
	UNWIND(.fnend)
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	2
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
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
	ldr	r3, .L1203
	mov	r4, r0
	mov	r2, #12
	sub	r0, fp, #32
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #32
	mov	r0, r4
	bl	VCTRL_ResetChanWithOption
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1204:
	.align	2
.L1203:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	2
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #196)
	sub	sp, sp, #196
	ldr	r7, .L1292
	mov	r5, r1
	mov	r6, r2
	mov	r8, r0
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	str	r0, [fp, #-220]
	sub	r0, fp, #188
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #96
	mov	r1, #0
	sub	r0, fp, #140
	blx	r3
	ldr	r4, [r7, #48]
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #212
	blx	r4
	ldr	r4, [r7, #48]
	sub	r0, fp, #200
	mov	r2, #12
	mov	r1, #0
	blx	r4
	cmp	r5, #0
	beq	.L1276
	ldr	r2, [r5, #28]
	cmp	r2, #0
	blt	.L1208
	ldr	r3, [r5, #44]
	cmp	r3, #262144
	blt	.L1208
	ldr	r3, [r5, #36]
	cmp	r3, #1
	beq	.L1277
.L1209:
	ldr	r3, [r5, #160]
	mov	r4, #0
	sub	r2, fp, #200
	mov	r1, r5
	cmp	r3, #1
	str	r4, [r5, #172]
	mov	r0, r8
	str	r4, [r5, #176]
	movhi	r3, #0
	strhi	r3, [r5, #160]
	mov	r3, r6
	bl	VCTRL_GetChanMemSize
	cmp	r0, r4
	bne	.L1273
	ldr	r3, .L1292+4
	ldr	r6, [r3, #48]
	cmp	r6, #0
	beq	.L1250
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L1251
	ldr	r3, .L1292+4
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L1252
	ldr	r3, .L1292+4
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L1278
.L1242:
	mov	r3, #4
	ldr	r2, .L1292+8
	movw	r1, #2047
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
	str	r3, [fp, #-216]
	b	.L1267
.L1277:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ble	.L1208
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bgt	.L1209
.L1208:
	ldr	r3, .L1292+12
	movw	r1, #1777
	ldr	r2, .L1292+16
	mov	r0, #1
	bl	dprint_normal
.L1245:
	mvn	r3, #0
	str	r3, [fp, #-216]
.L1267:
	ldr	r0, [fp, #-216]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1273:
	movw	r3, #2033
	mov	r0, r4
	mov	r1, r3
	ldr	r2, .L1292+20
	bl	dprint_normal
	mvn	r3, #0
	str	r3, [fp, #-216]
	b	.L1267
.L1276:
	mov	r0, r5
	ldr	r2, .L1292+24
	movw	r1, #1757
	bl	dprint_normal
	b	.L1245
.L1250:
	str	r6, [fp, #-224]
.L1212:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #24
	sub	r0, fp, #164
	mov	r1, #0
	ldr	r4, .L1292
	blx	r3
	ldrd	r2, [r5, #120]
	orrs	r3, r2, r3
	beq	.L1213
	ldr	r3, [r5, #128]
	cmp	r3, #0
	bne	.L1214
.L1213:
	mov	r4, #0
	mov	r0, #7
	str	r4, [fp, #-144]
	bl	VFMW_GetString
	mov	r1, r4
	ldr	r2, [fp, #-192]
	mov	r4, #1
	sub	r3, fp, #164
	str	r4, [sp]
	bl	MEM_AllocMemBlock
	subs	r9, r0, #0
	bne	.L1279
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-160]
	ldr	r0, [fp, #-156]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-156]
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-148]
	str	r9, [fp, #-80]
	str	r4, [fp, #-204]
	str	r1, [fp, #-92]
	str	r2, [fp, #-84]
	str	r3, [fp, #-76]
.L1217:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #164
	blx	r3
	ldrd	r2, [r5, #72]
	ldr	r1, .L1292
	orrs	r3, r2, r3
	beq	.L1246
	ldr	r3, [r5, #80]
	cmp	r3, #0
	bne	.L1219
.L1246:
	ldr	r3, [r5, #160]
	cmp	r3, #1
	beq	.L1220
	mov	r4, #0
	mov	r0, #8
	str	r4, [fp, #-144]
	bl	VFMW_GetString
	mov	r1, r4
	str	r4, [sp]
	ldr	r2, [fp, #-200]
	sub	r3, fp, #164
	bl	MEM_AllocMemBlock
	subs	r4, r0, #0
	bne	.L1280
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-160]
	ldr	r0, [fp, #-156]
	bl	MEM_AddMemRecord
	ldr	r0, [fp, #-156]
	ldr	r1, [fp, #-160]
	mov	r3, #1
	ldr	r2, [fp, #-148]
	str	r4, [fp, #-128]
	str	r0, [fp, #-140]
	str	r1, [fp, #-132]
	str	r2, [fp, #-124]
	str	r3, [fp, #-212]
.L1224:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #164
	blx	r3
	ldrd	r2, [r5, #96]
	ldr	r1, .L1292
	orrs	r3, r2, r3
	beq	.L1248
	ldr	r3, [r5, #104]
	cmp	r3, #0
	bne	.L1228
.L1248:
	mov	r4, #0
	mov	r0, #9
	str	r4, [fp, #-144]
	bl	VFMW_GetString
	sub	r3, fp, #164
	ldr	r2, [fp, #-196]
	str	r4, [sp]
	mov	r1, r4
	bl	MEM_AllocMemBlock
	subs	r3, r0, #0
	str	r3, [fp, #-216]
	bne	.L1281
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-160]
	ldr	r0, [fp, #-156]
	bl	MEM_AddMemRecord
	ldr	ip, [fp, #-156]
	ldr	r0, [fp, #-160]
	mov	r2, #1
	ldr	r1, [fp, #-148]
	ldr	r3, [fp, #-216]
	str	ip, [fp, #-116]
	str	r0, [fp, #-108]
	str	r3, [fp, #-104]
	str	r1, [fp, #-100]
	str	r2, [fp, #-208]
.L1268:
	mov	r2, r6, asl #2
	ldr	r3, [r7]
	str	r2, [fp, #-216]
	mov	r9, r2
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #0
	blx	r3
	ldr	r2, [fp, #-76]
	ldr	r0, .L1292+4
	movw	r1, #28584
	ldr	r4, [fp, #-84]
	movt	r1, 4
	add	r0, r0, r9
	cmp	r2, r1
	ldr	r3, [r7, #48]
	movcs	r2, r1
	str	r4, [r0, #48]
	mov	r1, #0
	mov	r0, r4
	blx	r3
	add	r0, r4, #207872
	ldr	r3, [r7, #52]
	mov	r2, #184
	mov	r1, r5
	add	r0, r0, #256
	blx	r3
	add	r3, r4, #204800
	movw	r2, #38320
	mov	r0, #0
	movt	r2, 7
	str	r2, [r3, #3228]
	str	r8, [r4, #148]
	mov	r1, #22
	str	r8, [r3, #2688]
	add	ip, r4, #24576
	str	r0, [r3, #3260]
	add	r2, r4, #26112
	str	r6, [r4, #4]
	add	r2, r2, #232
	ldr	lr, [r5]
	str	r1, [r4, #128]
	ldr	r10, .L1292
	str	lr, [r4, #144]
	str	r1, [r3, #3552]
	add	r1, r4, #256
	str	r0, [r4, #36]
	mov	r0, r6
	ldr	r3, [r5, #180]
	ldr	lr, .L1292+28
	ldr	r9, .L1292+4
	str	r3, [r4, #84]
	ldr	r3, [r5, #172]
	str	r2, [lr, r6, asl #3]
	str	r3, [ip, #1836]
	ldr	r3, [r5, #176]
	str	r3, [ip, #1840]
	bl	FSP_EnableInstance
	subs	r8, r0, #0
	bne	.L1282
	mov	r0, r6
	bl	VCTRL_ResetChan
	ldr	lr, [fp, #-212]
	ldr	ip, [fp, #-208]
	ldr	r0, [fp, #-204]
	ldr	r3, [fp, #-116]
	str	ip, [r4, #156]
	str	r0, [r4, #160]
	add	r2, r3, #1024
	str	lr, [r4, #152]
	add	r2, r2, #15
	ldr	lr, [r5, #160]
	ldr	r1, [fp, #-100]
	ldr	r5, [fp, #-92]
	sub	ip, r1, #16
	str	lr, [r4, #56]
	add	r2, r2, ip
	ldr	lr, [fp, #-84]
	str	ip, [r4, #168]
	bic	r2, r2, #1020
	ldr	ip, [fp, #-76]
	add	r0, r1, r3
	bic	r2, r2, #3
	str	r3, [r4, #236]
	str	r1, [r4, #244]
	cmp	r2, r0
	ldr	r1, [fp, #-132]
	str	r3, [r4, #164]
	str	lr, [r4, #184]
	ldr	r3, [fp, #-124]
	ldr	lr, [fp, #-108]
	str	ip, [r4, #196]
	ldr	ip, [fp, #-140]
	str	r2, [r4, #172]
	str	r8, [r4, #176]
	str	r5, [r4, #188]
	str	ip, [r4, #212]
	str	r1, [r4, #208]
	str	r3, [r4, #220]
	str	lr, [r4, #232]
	bhi	.L1283
	add	r2, r4, #196608
	str	r6, [r4, #4]
	str	r6, [r4, #44]
	mov	r0, r6
	str	r6, [r4, #48]
	str	r6, [r2, #1980]
	str	r6, [fp, #-216]
	bl	SM_ClearInst
	ldr	r2, [r4, #184]
	movw	r1, #30632
	mov	r0, r6
	movt	r1, 4
	add	r1, r2, r1
	bl	OpenUsdPool_WithMem
	mov	r2, #1
	mov	r0, r6
	str	r2, [r4, #16]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	r2, [r10]
	blx	r2
	ldrh	ip, [fp, #-224]
	str	r8, [r4, #124]
	adds	r2, r8, ip
	mov	r1, r0
	str	r0, [r4, #116]
	adc	r3, r1, #0
	mov	r0, r8
	strd	r2, [r4, #8]
	ldr	r2, [r10, #16]
	blx	r2
	ldr	r2, [r10]
	blx	r2
	mov	r2, #100
	mul	r6, r2, r6
	ldr	r5, [r10, #48]
	mov	r1, r8
	mov	r4, r0
	add	r0, r9, #376
	add	r0, r0, r6
	add	r9, r9, r6
	blx	r5
	ldr	r3, [fp, #-220]
	ldr	r0, [fp, #-216]
	rsb	r4, r3, r4
	str	r8, [r9, #424]
	str	r4, [r9, #420]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1220:
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	str	r3, [fp, #-140]
	str	r3, [fp, #-124]
	str	r3, [fp, #-212]
	strd	r0, [fp, #-132]
	b	.L1224
.L1214:
	ldr	r3, [r4, #52]
	mov	r2, #24
	add	r1, r5, #112
	sub	r0, fp, #92
	blx	r3
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-192]
	cmp	r2, r3
	blt	.L1284
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_AddMemRecord
	b	.L1217
.L1228:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r5, #88
	sub	r0, fp, #116
	blx	r3
	ldrd	r0, [fp, #-108]
	orrs	r3, r0, r1
	beq	.L1233
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-196]
	cmp	r2, r3
	blt	.L1233
	mov	r1, r0
	ldr	r0, [fp, #-116]
	bl	MEM_AddMemRecord
	b	.L1268
.L1219:
	ldr	r3, [r1, #52]
	mov	r2, #24
	sub	r0, fp, #140
	add	r1, r5, #64
	blx	r3
	ldr	r3, [r5, #160]
	ldr	r2, [fp, #-124]
	cmp	r3, #1
	beq	.L1226
	ldr	r1, [fp, #-200]
	cmp	r2, r1
	blt	.L1285
.L1226:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_AddMemRecord
	b	.L1224
.L1281:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1286
.L1230:
	ldr	r3, [fp, #-212]
	cmp	r3, #1
	beq	.L1287
.L1231:
	ldr	r2, .L1292+32
	movw	r3, #1817
.L1272:
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
	str	r3, [fp, #-216]
	b	.L1267
.L1280:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1288
.L1222:
	movw	r3, #1881
	ldr	r2, .L1292+36
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	b	.L1245
.L1282:
	mov	r3, r6
	ldr	r2, .L1292+40
	movw	r1, #2086
	mov	r0, #1
	bl	dprint_normal
.L1238:
	mov	r0, r6
	mov	r5, #0
	bl	FSP_DisableInstance
	mov	r0, r6
	bl	CloseUsdPool_WithMem
	ldr	r2, [fp, #-216]
	ldr	r3, .L1292+4
	mov	r0, r6
	ldr	r1, [r4, #156]
	ldr	ip, [r4, #160]
	add	r3, r3, r2
	ldr	r2, [r4, #152]
	str	r1, [fp, #-184]
	str	r5, [r3, #48]
	add	r3, r4, #228
	str	ip, [fp, #-180]
	str	r2, [fp, #-188]
	add	r2, r4, #204
	str	r3, [fp, #-172]
	add	r4, r4, #180
	mvn	r3, #0
	str	r2, [fp, #-176]
	str	r3, [fp, #-216]
	str	r4, [fp, #-168]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	ldr	r2, [r7, #16]
	blx	r2
	sub	r1, fp, #188
	mov	r0, r6
	bl	VCTRL_FreeChanResource
	b	.L1267
.L1283:
	str	r0, [sp, #4]
	mov	r3, r6
	str	r2, [sp]
	movw	r1, #2118
	ldr	r2, .L1292+44
	mov	r0, #1
	bl	dprint_normal
	b	.L1238
.L1279:
	movw	r3, #1938
	mov	r0, r4
	mov	r1, r3
	ldr	r2, .L1292+48
	bl	dprint_normal
	b	.L1245
.L1233:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1289
.L1235:
	ldr	r3, [fp, #-212]
	cmp	r3, #1
	beq	.L1290
.L1236:
	movw	r3, #1845
	ldr	r2, .L1292+52
	b	.L1272
.L1287:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1231
.L1286:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1230
.L1288:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1222
.L1284:
	movw	r3, #1954
	ldr	r2, .L1292+56
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	b	.L1245
.L1285:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1291
.L1227:
	movw	r3, #1912
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, r3
	ldr	r2, .L1292+60
	mov	r0, #1
	bl	dprint_normal
	b	.L1245
.L1290:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1236
.L1289:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1235
.L1291:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-200]
	b	.L1227
.L1251:
	mov	r6, #1
.L1241:
	cmp	r6, #3
	str	r6, [fp, #-224]
	bls	.L1212
	b	.L1242
.L1278:
	mov	r6, #3
	b	.L1241
.L1252:
	mov	r6, #2
	b	.L1241
.L1293:
	.align	2
.L1292:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC157
	.word	.LANCHOR2+2868
	.word	.LC111
	.word	.LC156
	.word	.LC155
	.word	s_SmIIS
	.word	.LC162
	.word	.LC160
	.word	.LC164
	.word	.LC165
	.word	.LC158
	.word	.LC163
	.word	.LC159
	.word	.LC161
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
	cmp	r0, #3
	mov	r8, r0
	mov	r4, r1
	ldrhi	r2, .L1350
	movwhi	r3, #2661
	bhi	.L1342
	ldr	r6, .L1350+4
	mov	r9, r0, asl #2
	add	r3, r6, r9
	ldr	r0, [r3, #48]
	cmp	r0, #0
	ldreq	r2, .L1350+8
	movweq	r1, #2662
	beq	.L1343
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L1345
	cmp	r4, #0
	beq	.L1346
	add	r1, r6, #840
	mov	r0, #0
	bl	PDT_GetAttribute
	ldr	r3, [r6, #860]
	ldr	r5, [r4, #8]
	cmp	r3, #21
	bhi	.L1301
	cmp	r3, r5
	beq	.L1302
	add	r2, r6, #860
	add	r3, r6, #984
.L1304:
	ldr	r1, [r2, #4]!
	cmp	r1, #21
	bhi	.L1301
	cmp	r1, r5
	beq	.L1302
	cmp	r2, r3
	bne	.L1304
.L1302:
	mov	r1, r4
	mov	r0, r8
	bl	VCTRL_CmpConfigParameter
	subs	r7, r0, #0
	beq	.L1347
	add	r7, r6, r9
	ldr	r10, .L1350+12
	mov	r2, #72
	mov	r1, #0
	ldr	r3, [r7, #48]
	sub	r0, fp, #116
	str	r5, [r3, #128]
	ldr	ip, [r4, #24]
	str	ip, [r3, #28]
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	strb	ip, [r3]
	ldr	r3, [r10, #48]
	blx	r3
	ldr	r3, [r7, #48]
	ldr	r3, [r3, #164]
	mov	r0, r3
	str	r3, [fp, #-104]
	bl	MEM_Phy2Vir
	ldr	r1, [r4, #84]
	ldr	ip, [r4, #8]
	mov	r3, #49152
	cmp	r1, #1
	movt	r3, 63683
	ldr	r2, [r7, #48]
	str	r3, [fp, #-96]
	movne	r3, #0
	ldreq	r3, [r4, #136]
	str	ip, [fp, #-108]
	ldreq	ip, [r4, #92]
	ldr	lr, [r4, #24]
	streq	r1, [fp, #-68]
	streq	ip, [fp, #-60]
	ldr	r5, [r2, #168]
	strb	lr, [fp, #-112]
	str	r5, [fp, #-100]
	str	r0, [fp, #-116]
	ldreq	r0, [r4, #96]
	str	r3, [r2, #120]
	ldr	r3, [r4, #88]
	streq	r0, [fp, #-56]
	cmp	r3, #0
	ldr	r2, [r4, #80]
	movne	r3, #1
	strne	r3, [fp, #-64]
	ldr	r3, [r4, #8]
	str	r2, [fp, #-72]
	cmp	r3, #0
	bne	.L1348
.L1341:
	ldr	r3, [r4, #52]
.L1309:
	ldr	r5, .L1350+16
	mov	r2, #0
	str	r3, [fp, #-76]
	add	r7, r5, #16
	mov	r3, r5
.L1311:
	ldr	r1, [r3], #4
	cmp	r1, #0
	addne	r2, r2, #1
	cmp	r3, r7
	bne	.L1311
	ldr	r3, .L1350+20
	cmp	r2, #1
	str	r3, [fp, #-124]
	ble	.L1349
.L1312:
	mov	r3, #0
	str	r3, [fp, #-76]
.L1314:
	ldrsb	r3, [r4]
	add	r2, r4, #12
	sub	r0, fp, #92
	str	r2, [fp, #-120]
	cmp	r3, #1
	mov	r1, r2
	mov	r2, #12
	ldrne	r3, [fp, #-76]
	moveq	r3, #0
	streq	r3, [fp, #-76]
	str	r3, [r4, #52]
	ldr	r3, [r10, #52]
	blx	r3
	sub	r1, fp, #116
	mov	r0, r8
	bl	SM_Config
	ldr	r2, [fp, #-124]
	add	r3, r6, r9
	ldr	r1, [r2, #76]
	ldr	r2, [r3, #48]
	cmp	r1, #7
	add	r3, r2, #204800
	ldr	r0, [r2, #188]
	str	r0, [r3, #3232]
	ldr	r0, [r2, #196]
	str	r0, [r3, #3236]
	ldr	r0, [r2, #172]
	str	r0, [r3, #2692]
	mvn	r0, #0
	ldr	r2, [r2, #176]
	str	r2, [r3, #2696]
	ldr	r2, [r4, #28]
	str	r2, [r3, #2676]
	ldr	r2, [r4, #28]
	str	r2, [r3, #2672]
	ldr	r2, [r4, #36]
	str	r2, [r3, #2680]
	mov	r2, #0
	ldreq	r1, [r4, #40]
	str	r1, [r3, #2684]
	ldr	r1, [r4, #72]
	sub	r1, r1, #1
	clz	r1, r1
	mov	r1, r1, lsr #5
	str	r1, [r3, #3272]
	ldr	r1, [r4, #76]
	str	r1, [r3, #3276]
	ldr	r1, [r4, #48]
	str	r1, [r3, #3280]
	ldr	r1, [r4, #52]
	str	r1, [r3, #3284]
	ldr	r1, [r4, #132]
	str	r2, [r3, #3520]
	str	r2, [r3, #3532]
	str	r1, [r3, #3288]
	str	r2, [r3, #3292]
	str	r2, [r3, #3296]
	ldr	r1, [r4, #152]
	str	r1, [r3, #3544]
	ldr	r1, [r4, #56]
	str	r2, [r3, #3248]
	str	r0, [r3, #3252]
	str	r1, [r3, #2512]
	str	r0, [r3, #3256]
	ldr	r2, [r4, #104]
	cmp	r2, #0
	ble	.L1318
	ldr	r1, [r4, #108]
	cmp	r1, #0
	ble	.L1318
	str	r2, [r3, #2560]
	ldr	r2, [r4, #108]
	str	r2, [r3, #2564]
.L1319:
	add	r6, r6, r9
	mov	r1, r4
	ldr	r3, [r10, #52]
	mov	r2, #156
	ldr	r0, [r6, #48]
	add	r0, r0, #206848
	add	r0, r0, #408
	blx	r3
	ldr	r0, [r6, #48]
	ldr	r3, [r10, #52]
	mov	r2, #12
	add	r0, r0, #207872
	ldr	r1, [fp, #-120]
	add	r0, r0, #132
	blx	r3
	ldr	r1, [r6, #48]
	add	r0, r1, #204800
	ldr	ip, [r1, #128]
	ldr	r3, [r0, #3552]
	cmp	r3, ip
	beq	.L1320
	mov	r0, r8
	bl	VCTRL_ResetChan
	ldr	r1, [r6, #48]
	add	r0, r1, #204800
	ldr	ip, [r1, #128]
.L1320:
	movw	r3, #2456
	ldr	r2, .L1350+24
	ldrsb	lr, [r0, r3]
	ldr	r3, .L1350+28
	str	ip, [r0, #3552]
	str	lr, [r1, #264]
.L1323:
	ldr	r1, [r5], #4
	add	r2, r2, #4
	add	r3, r3, #4
	cmp	r1, #0
	streq	r1, [r2, #-4]
	ldrne	r0, [r1, #28]
	ldrne	r1, [r5, #-4]
	strne	r0, [r2, #-4]
	ldrne	r1, [r1, #28]
	cmp	r7, r5
	str	r1, [r3, #-4]
	bne	.L1323
	ldr	r0, .L1350+24
	bl	VDMDRV_SetPriority
	mov	r0, r8
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1337:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1348:
	cmp	r3, #16
	movne	r3, #0
	beq	.L1341
	b	.L1309
.L1347:
	ldr	r3, .L1350+32
	movw	r1, #2680
	ldr	r2, .L1350+36
	bl	dprint_normal
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1301:
	mov	r3, r5
	ldr	r2, .L1350+40
	movw	r1, #2476
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, .L1350+32
	ldr	r2, .L1350+44
	mov	r1, #2672
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1318:
	mov	r2, #1920
	str	r2, [r3, #2560]
	mov	r2, #1088
	str	r2, [r3, #2564]
	b	.L1319
.L1349:
	ldr	r3, [r3, #80]
	cmp	r3, #0
	beq	.L1312
	cmp	r3, #1
	streq	r3, [fp, #-76]
	b	.L1314
.L1345:
	ldr	r2, .L1350+48
	movw	r3, #2663
.L1342:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1350+32
	ldr	r2, .L1350+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L1337
.L1346:
	ldr	r2, .L1350+56
	movw	r1, #2664
	mov	r0, r4
.L1343:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1350+32
	ldr	r2, .L1350+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L1337
.L1351:
	.align	2
.L1350:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+48
	.word	.LANCHOR1
	.word	.LANCHOR0+988
	.word	g_ChanCtx
	.word	.LANCHOR2+2888
	.word	.LC170
	.word	.LC168
	.word	.LC169
	.word	.LC166
	.word	.LC31
	.word	.LC167
	UNWIND(.fnend)
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	2
	.type	VfmwProc_SetUvmosEnable, %function
VfmwProc_SetUvmosEnable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #168)
	sub	sp, sp, #168
	ldr	r4, [r0]
	movw	r1, #5230
	ldr	r2, .L1356
	bic	r5, r4, #-16777216
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1356+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L1355
	mov	r3, r4
	ldr	r2, .L1356+8
	movw	r1, #5240
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1355:
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-44]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1357:
	.align	2
.L1356:
	.word	.LC171
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC172
	UNWIND(.fnend)
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	2
	.type	VfmwProc_SetDropStreamThreshold, %function
VfmwProc_SetDropStreamThreshold:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #168)
	sub	sp, sp, #168
	ldr	r4, [r0]
	movw	r1, #5318
	ldr	r2, .L1360
	bic	r5, r4, #-16777216
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1360+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1358
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-144]
	bl	VCTRL_ConfigChan
.L1358:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1361:
	.align	2
.L1360:
	.word	.LC173
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetDropStreamThreshold, .-VfmwProc_SetDropStreamThreshold
	.align	2
	.type	VfmwProc_SetDecMode, %function
VfmwProc_SetDecMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #168)
	sub	sp, sp, #168
	ldr	r4, [r0]
	movw	r1, #5294
	ldr	r2, .L1366
	and	r5, r4, #7
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1366+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L1365
	mov	r3, r4
	ldr	r2, .L1366+8
	movw	r1, #5304
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1365:
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-140]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1367:
	.align	2
.L1366:
	.word	.LC174
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC175
	UNWIND(.fnend)
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	2
	.type	VfmwProc_SetDecOrderOutput, %function
VfmwProc_SetDecOrderOutput:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #168)
	sub	sp, sp, #168
	ldr	r4, [r0]
	movw	r1, #5254
	ldr	r2, .L1370
	and	r5, r4, #3
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1370+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1368
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-136]
	bl	VCTRL_ConfigChan
.L1368:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1371:
	.align	2
.L1370:
	.word	.LC176
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	2
	.type	VfmwProc_SetErrorThreshold, %function
VfmwProc_SetErrorThreshold:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #168)
	sub	sp, sp, #168
	ldr	r4, [r0]
	movw	r1, #5210
	ldr	r2, .L1374
	bic	r5, r4, #-16777216
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1374+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1372
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-148]
	bl	VCTRL_ConfigChan
.L1372:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1375:
	.align	2
.L1374:
	.word	.LC177
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetErrorThreshold, .-VfmwProc_SetErrorThreshold
	.align	2
	.type	VfmwProc_TestResetChan, %function
VfmwProc_TestResetChan:
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
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r3, r4
	ldr	r2, .L1377
	movw	r1, #5781
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1378:
	.align	2
.L1377:
	.word	.LC178
	UNWIND(.fnend)
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	2
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r5, .L1394
	mov	r4, r0
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r7, r0
	mov	r0, #0
	blx	r3
	cmp	r4, #3
	ldrhi	r2, .L1394+4
	movwhi	r3, #2182
	bhi	.L1389
	ldr	r8, .L1394+8
	mov	r9, r4, asl #2
	add	r3, r8, r9
	ldr	r6, [r3, #48]
	cmp	r6, #0
	beq	.L1390
	ldr	r10, [r6, #16]
	cmp	r10, #1
	bne	.L1391
	mov	r0, #0
	ldr	r3, [r5, #16]
	str	r0, [r6, #20]
	blx	r3
	mov	r0, r4
	bl	SCDDRV_IsChanDec
	cmp	r0, #0
	bne	.L1392
.L1384:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #4
	ldr	r5, .L1394
	blx	r3
	mov	r0, r4
	bl	VCTRL_StopChan
	ldr	r3, [r5, #16]
	subs	r6, r0, #0
	mov	r0, #4
	bne	.L1393
	blx	r3
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r5, #12]
	mov	r0, #4
	add	r9, r8, r9
	blx	r3
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r9, #48]
	ldr	r2, .L1394+12
	mov	r0, r4
	str	r6, [r9, #48]
	add	r1, r3, #204
	ldr	lr, [r3, #152]
	ldr	ip, [r3, #156]
	ldr	r9, [r3, #160]
	str	r6, [r2, r4, asl #3]
	add	r2, r3, #228
	str	lr, [fp, #-68]
	add	r3, r3, #180
	str	ip, [fp, #-64]
	str	r2, [fp, #-52]
	str	r1, [fp, #-56]
	str	r3, [fp, #-48]
	str	r9, [fp, #-60]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r4
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	bl	VDMDRV_ResetVDH
	ldr	r3, [r5, #16]
	mov	r0, #4
	blx	r3
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	mov	r1, r4
	ldr	r3, [r5, #24]
	mov	r0, #1
	blx	r3
	ldr	r3, [r5]
	blx	r3
	sub	r1, fp, #68
	mov	r10, r0
	mov	r0, r4
	bl	VCTRL_FreeChanResource
	ldr	r3, [r5]
	blx	r3
	mov	r1, r4
	ldr	r3, [r5, #28]
	mov	r9, r0
	mov	r0, #1
	blx	r3
	ldr	r3, [r5]
	blx	r3
	mov	r3, #100
	mla	r4, r3, r4, r8
	rsb	r9, r10, r9
	str	r9, [r4, #432]
	rsb	r0, r7, r0
	str	r0, [r4, #428]
.L1381:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1392:
	mov	r0, r4
	ldr	r6, [r5, #132]
	bl	SCDDRV_IsChanDec
	mov	r2, #500
	clz	r1, r0
	mov	r0, r10
	mov	r1, r1, lsr #5
	blx	r6
	b	.L1384
.L1391:
	ldr	r2, .L1394+16
	movw	r3, #2196
.L1389:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r2, .L1394+20
	mvn	r6, #0
	ldr	r3, .L1394+24
	bl	dprint_normal
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1393:
	blx	r3
	ldr	r3, [r5, #16]
	mov	r0, #0
	mvn	r6, #0
	blx	r3
	b	.L1381
.L1390:
	ldr	r2, .L1394+28
	movw	r3, #2189
	mov	r1, r3
	str	r3, [sp]
	mov	r0, r6
	ldr	r3, .L1394+24
	str	r2, [sp, #4]
	ldr	r2, .L1394+20
	bl	dprint_normal
	mov	r0, r6
	ldr	r3, [r5, #16]
	mvn	r6, #0
	blx	r3
	b	.L1381
.L1395:
	.align	2
.L1394:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR0
	.word	s_SmIIS
	.word	.LC181
	.word	.LC179
	.word	.LANCHOR2+2908
	.word	.LC180
	UNWIND(.fnend)
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	2
	.type	VfmwProc_TestRestartChan, %function
VfmwProc_TestRestartChan:
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
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StopChan
	mov	r3, r4
	ldr	r2, .L1397
	movw	r1, #5805
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r3, r4
	ldr	r2, .L1397+4
	movw	r1, #5807
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r3, r4
	ldr	r2, .L1397+8
	movw	r1, #5809
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1398:
	.align	2
.L1397:
	.word	.LC182
	.word	.LC178
	.word	.LC150
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
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StopChan
	mov	r3, r4
	ldr	r2, .L1400
	movw	r1, #5770
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1401:
	.align	2
.L1400:
	.word	.LC182
	UNWIND(.fnend)
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
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
	ldr	r3, .L1403
	mov	r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #1004]
	ldmfd	sp, {fp, sp, pc}
.L1404:
	.align	2
.L1403:
	.word	.LANCHOR0
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
	ldr	r3, .L1406
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #1004]
	ldmfd	sp, {fp, sp, pc}
.L1407:
	.align	2
.L1406:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	2
	.global	VCTRL_IfNoGapEnable
	.type	VCTRL_IfNoGapEnable, %function
VCTRL_IfNoGapEnable:
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
	ldr	r3, .L1409
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2540]
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L1410:
	.align	2
.L1409:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_IfNoGapEnable, .-VCTRL_IfNoGapEnable
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
	ldr	r3, .L1412
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #1004]
	ldmfd	sp, {fp, sp, pc}
.L1413:
	.align	2
.L1412:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	2
	.global	VCTRL_GetChanCrcMode
	.type	VCTRL_GetChanCrcMode, %function
VCTRL_GetChanCrcMode:
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
	ldr	r3, .L1415
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2500]
	ldmfd	sp, {fp, sp, pc}
.L1416:
	.align	2
.L1415:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanCrcMode, .-VCTRL_GetChanCrcMode
	.align	2
	.global	VCTRL_SetChanWaitFsFlag
	.type	VCTRL_SetChanWaitFsFlag, %function
VCTRL_SetChanWaitFsFlag:
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
	ldr	r3, .L1418
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	str	r1, [r3, #3520]
	ldmfd	sp, {fp, sp, pc}
.L1419:
	.align	2
.L1418:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_SetChanWaitFsFlag, .-VCTRL_SetChanWaitFsFlag
	.align	2
	.global	VCTRL_BindRequireMem
	.type	VCTRL_BindRequireMem, %function
VCTRL_BindRequireMem:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	cmp	r0, #3
	mov	r2, r1
	bhi	.L1427
	ldr	r5, .L1432
	add	r5, r5, r0, lsl #2
	ldr	ip, [r5, #48]
	cmp	ip, #0
	beq	.L1428
	cmp	r1, #0
	beq	.L1429
	ldrd	r6, [r1, #64]
	mvn	r3, #0
	ldrd	r8, [ip, #8]
	movw	r2, #65535
	and	r3, r3, r7
	and	r2, r2, r6
	cmp	r3, r9
	cmpeq	r2, r8
	bne	.L1430
	bl	FSP_BindRequireFs
	subs	r4, r0, #0
	beq	.L1431
.L1426:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1422:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1431:
	ldr	r3, [r5, #48]
	ldr	r3, [r3, #124]
	cmp	r3, #1
	bne	.L1426
	ldr	r3, .L1432+4
	ldr	r3, [r3, #128]
	blx	r3
	ldr	r3, [r5, #48]
	str	r4, [r3, #124]
	b	.L1426
.L1430:
	strd	r8, [sp, #8]
	movw	r1, #6654
	strd	r6, [sp]
	mov	r0, #1
	ldr	r3, .L1432+8
	ldr	r2, .L1432+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1422
.L1427:
	ldr	r2, .L1432+16
	movw	r3, #6644
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1432+8
	str	r2, [sp, #4]
	ldr	r2, .L1432+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1422
.L1429:
	ldr	ip, .L1432+24
	movw	r1, #6646
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L1432+8
	str	ip, [sp, #4]
	ldr	r2, .L1432+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1422
.L1428:
	ldr	r2, .L1432+28
	movw	r1, #6645
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L1432+8
	str	r2, [sp, #4]
	ldr	r2, .L1432+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1422
.L1433:
	.align	2
.L1432:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+2928
	.word	.LC184
	.word	.LC105
	.word	.LC31
	.word	.LC183
	.word	.LC90
	UNWIND(.fnend)
	.size	VCTRL_BindRequireMem, .-VCTRL_BindRequireMem
	.align	2
	.global	VCTRL_SetFrameBufferMode
	.type	VCTRL_SetFrameBufferMode, %function
VCTRL_SetFrameBufferMode:
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
	cmp	r0, #3
	bhi	.L1438
	ldr	r3, .L1440
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L1439
	bl	FSP_SetFrameBufferMode
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1436:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1438:
	ldr	r2, .L1440+4
	movw	r3, #6676
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1440+8
	str	r2, [sp, #4]
	ldr	r2, .L1440+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1436
.L1439:
	ldr	r2, .L1440+16
	movw	r1, #6677
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1440+8
	str	r2, [sp, #4]
	ldr	r2, .L1440+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1436
.L1441:
	.align	2
.L1440:
	.word	.LANCHOR0
	.word	.LC105
	.word	.LANCHOR2+2952
	.word	.LC31
	.word	.LC91
	UNWIND(.fnend)
	.size	VCTRL_SetFrameBufferMode, .-VCTRL_SetFrameBufferMode
	.align	2
	.global	VCTRL_BindExternBuffer
	.type	VCTRL_BindExternBuffer, %function
VCTRL_BindExternBuffer:
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
	cmp	r0, #3
	mov	r2, r0
	mov	r5, r1
	bhi	.L1454
	ldr	r3, .L1457
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	ldreq	r2, .L1457+4
	movweq	r1, #6691
	moveq	r0, r3
	beq	.L1453
	cmp	r5, #0
	beq	.L1455
	bl	FSP_BindExternFs
	subs	r4, r0, #0
	beq	.L1456
.L1448:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1444:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1456:
	ldr	r2, [r5, #56]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #32]
	bl	MEM_AddMemRecord
	ldr	r3, [r5, #184]
	cmp	r3, #0
	beq	.L1448
	ldrd	r0, [r5, #192]
	orrs	r2, r0, r1
	bne	.L1448
	ldr	r2, .L1457+8
	movw	r1, #6705
	mov	r0, r4
	bl	dprint_normal
	b	.L1448
.L1454:
	ldr	r2, .L1457+12
	movw	r3, #6690
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1457+16
	str	r2, [sp, #4]
	ldr	r2, .L1457+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1444
.L1455:
	ldr	r2, .L1457+24
	movw	r1, #6692
	mov	r0, r5
.L1453:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1457+16
	ldr	r2, .L1457+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1444
.L1458:
	.align	2
.L1457:
	.word	.LANCHOR0
	.word	.LC91
	.word	.LC186
	.word	.LC105
	.word	.LANCHOR2+2980
	.word	.LC31
	.word	.LC185
	UNWIND(.fnend)
	.size	VCTRL_BindExternBuffer, .-VCTRL_BindExternBuffer
	.align	2
	.global	VCTRL_UnBindExternBuffer
	.type	VCTRL_UnBindExternBuffer, %function
VCTRL_UnBindExternBuffer:
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
	cmp	r0, #3
	mov	r2, r0
	mov	r4, r1
	bhi	.L1469
	ldr	r3, .L1472
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	ldreq	r2, .L1472+4
	movweq	r1, #6719
	moveq	r0, r3
	beq	.L1468
	cmp	r4, #0
	beq	.L1470
	bl	FSP_UnBindExternFs
	ldr	r2, [r4, #56]
	ldr	r1, [r4, #40]
	mov	r5, r0
	ldr	r0, [r4, #32]
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #184]
	cmp	r3, #0
	bne	.L1471
.L1464:
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1461:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1471:
	ldrd	r0, [r4, #192]
	orrs	r2, r0, r1
	bne	.L1464
	ldr	r2, .L1472+8
	movw	r1, #6731
	mov	r0, #0
	bl	dprint_normal
	b	.L1464
.L1469:
	ldr	r2, .L1472+12
	movw	r3, #6718
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1472+16
	str	r2, [sp, #4]
	ldr	r2, .L1472+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1461
.L1470:
	ldr	r2, .L1472+24
	mov	r1, #6720
	mov	r0, r4
.L1468:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1472+16
	ldr	r2, .L1472+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1461
.L1473:
	.align	2
.L1472:
	.word	.LANCHOR0
	.word	.LC91
	.word	.LC186
	.word	.LC105
	.word	.LANCHOR2+3004
	.word	.LC31
	.word	.LC185
	UNWIND(.fnend)
	.size	VCTRL_UnBindExternBuffer, .-VCTRL_UnBindExternBuffer
	.align	2
	.global	VCTRL_SetFrameBufferNum
	.type	VCTRL_SetFrameBufferNum, %function
VCTRL_SetFrameBufferNum:
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
	cmp	r0, #3
	bhi	.L1477
	bl	FSP_SetDispFsNum
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1476:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1477:
	ldr	r2, .L1478
	movw	r3, #6741
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1478+4
	str	r2, [sp, #4]
	ldr	r2, .L1478+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L1476
.L1479:
	.align	2
.L1478:
	.word	.LC105
	.word	.LANCHOR2+3032
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_SetFrameBufferNum, .-VCTRL_SetFrameBufferNum
	.align	2
	.global	VCTRL_GetOccupiedNum
	.type	VCTRL_GetOccupiedNum, %function
VCTRL_GetOccupiedNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r3, .L1481
	str	r2, [fp, #-24]
	add	r3, r3, r0, lsl #2
	str	r1, [fp, #-28]
	mov	r0, #2
	sub	r1, fp, #32
	ldr	r3, [r3, #48]
	ldr	ip, [r3, #128]
	ldr	r2, [r3, #148]
	ldr	r3, [r3, #120]
	str	ip, [fp, #-20]
	str	r2, [fp, #-16]
	str	r3, [fp, #-32]
	bl	PDT_GetAttribute
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1482:
	.align	2
.L1481:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetOccupiedNum, .-VCTRL_GetOccupiedNum
	.align	2
	.global	VCTRL_GetExtraFrameNum
	.type	VCTRL_GetExtraFrameNum, %function
VCTRL_GetExtraFrameNum:
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
	ldr	r3, .L1484
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2556]
	ldmfd	sp, {fp, sp, pc}
.L1485:
	.align	2
.L1484:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetExtraFrameNum, .-VCTRL_GetExtraFrameNum
	.align	2
	.global	VCTRL_IsSupport4KStd
	.type	VCTRL_IsSupport4KStd, %function
VCTRL_IsSupport4KStd:
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
	sub	r3, r0, #16
	cmp	r3, #2
	clzhi	r0, r0
	movhi	r0, r0, lsr #5
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_IsSupport4KStd, .-VCTRL_IsSupport4KStd
	.align	2
	.global	VCTRL_IsResolutionValid
	.type	VCTRL_IsResolutionValid, %function
VCTRL_IsResolutionValid:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #3
	bhi	.L1498
	ldr	r3, .L1503
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L1499
	mul	ip, r2, r1
	cmp	ip, #1024
	blt	.L1500
	add	lr, r0, #204800
	ldr	r3, [lr, #2560]
	cmp	r3, #0
	ble	.L1494
	ldr	lr, [lr, #2564]
	cmp	lr, #0
	ble	.L1494
	mul	r4, lr, r3
	cmp	ip, r4
	bgt	.L1501
.L1494:
	mov	r3, #57344
	movt	r3, 31
	cmp	ip, r3
	ble	.L1497
	ldr	r3, [r0, #128]
	bic	r0, r3, #2
	cmp	r0, #16
	bne	.L1502
.L1497:
	mov	r0, #1
.L1491:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1498:
	ldr	r2, .L1503+4
	movw	r3, #6780
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1503+8
	str	r2, [sp, #4]
	ldr	r2, .L1503+12
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1502:
	cmp	r3, #17
	cmpne	r3, #0
	moveq	r4, #1
	movne	r4, #0
	beq	.L1497
	stmia	sp, {r1, r2}
	mov	r0, r4
	movw	r1, #6804
	ldr	r2, .L1503+16
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1499:
	ldr	r2, .L1503+20
	movw	r1, #6781
	ldr	r3, .L1503+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1503+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1491
.L1500:
	mov	r0, #32
	stmib	sp, {r1, r2}
	mov	r3, r0
	str	r0, [sp]
	movw	r1, #6788
	ldr	r2, .L1503+24
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	b	.L1491
.L1501:
	stmib	sp, {r1, r2}
	mov	r0, #32
	movw	r1, #6796
	str	lr, [sp]
	ldr	r2, .L1503+28
	bl	dprint_normal
	mov	r0, #0
	b	.L1491
.L1504:
	.align	2
.L1503:
	.word	.LANCHOR0
	.word	.LC105
	.word	.LANCHOR2+3056
	.word	.LC31
	.word	.LC189
	.word	.LC91
	.word	.LC187
	.word	.LC188
	UNWIND(.fnend)
	.size	VCTRL_IsResolutionValid, .-VCTRL_IsResolutionValid
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
	ldr	r3, .L1514
	mov	r4, r0
	ldr	r2, [r3]
	cmp	r2, #1
	beq	.L1512
.L1505:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1512:
	cmp	r0, #11
	bhi	.L1513
	ldr	r6, .L1514+4
	ldrb	r2, [r6, r0]	@ zero_extendqisi2
	cmp	r2, #14
	movhi	r2, #0
	strhib	r2, [r6, r0]
	cmp	r0, #10
	mov	r5, r2
	moveq	r2, #1
	streqb	r2, [r3, #1020]
	ldr	r3, .L1514+8
	ldr	r3, [r3, #4]
	blx	r3
	rsb	r2, r4, r4, lsl #4
	ldr	r1, .L1514+12
	add	r2, r2, r5
	ldrb	r3, [r6, r4]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [r6, r4]
	str	r0, [r1, r2, asl #2]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1513:
	movw	r1, #6876
	ldr	r3, .L1514+16
	stmia	sp, {r1, r4}
	mov	r0, #32
	ldr	r2, .L1514+20
	bl	dprint_normal
	b	.L1505
.L1515:
	.align	2
.L1514:
	.word	.LANCHOR0
	.word	g_TimeRecId
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecTable
	.word	.LANCHOR2+3080
	.word	.LC190
	UNWIND(.fnend)
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
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
	ldr	r5, .L1527
	mov	r0, #0
	bl	VCTRL_RecordPosTime
	ldrb	r3, [r5, #1020]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1525
.L1517:
	ldr	r0, [r5, #12]
	mov	r3, #100
	ldr	r6, .L1527+4
	cmp	r0, #0
	str	r3, [r5, #80]
	ble	.L1518
	ldr	r3, [r6, #120]
	blx	r3
.L1518:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	SM_Wakeup
	ldr	r3, [r5, #8]
	mov	r2, #101
	str	r2, [r5, #80]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1526
.L1519:
	mov	r3, #102
	str	r3, [r5, #80]
	bl	VDMDRV_WakeUpVdm
	mov	r4, #0
.L1520:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #4
	bne	.L1520
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #1
	mov	r3, #105
	str	r3, [r5, #80]
	bl	VCTRL_RecordPosTime
	mov	r1, #0
	ldr	r3, [r6, #132]
	mov	r0, r1
	mov	r2, #10
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1526:
	bl	VCTRL_DecSyntax
	mov	r7, r0
	b	.L1519
.L1525:
	mov	r0, #11
	bl	VCTRL_RecordPosTime
	mov	r3, #0
	strb	r3, [r5, #1020]
	b	.L1517
.L1528:
	.align	2
.L1527:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	2
	.global	VCTRL_DecodeThread
	.type	VCTRL_DecodeThread, %function
VCTRL_DecodeThread:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
.L1530:
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L1560
	mov	r5, #2
	ldr	r7, .L1560+4
	ldr	r3, [r4, #72]
.L1535:
	cmp	r3, #2
	str	r5, [r4, #68]
	bne	.L1555
	b	.L1531
.L1559:
	str	r5, [r4, #80]
	bl	VCTRL_RunProcess
	ldr	r3, [r4, #72]
	cmp	r3, #2
	beq	.L1531
.L1555:
	cmp	r3, #3
	bne	.L1559
.L1532:
	mov	r3, #6
	mov	r0, #0
	str	r3, [r4, #80]
	str	r0, [r4, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1531:
	mov	r6, #5
	mov	r3, #1
	str	r6, [r4, #80]
	str	r3, [r4, #68]
.L1537:
	ldr	r3, [r7, #120]
	mov	r0, #10
	blx	r3
	ldr	r3, [r4, #72]
	str	r6, [r4, #80]
	cmp	r3, #1
	beq	.L1535
	cmp	r3, #3
	bne	.L1537
	b	.L1532
.L1561:
	.align	2
.L1560:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_DecodeThread, .-VCTRL_DecodeThread
	.align	2
	.global	VCTRL_CloseDrivers
	.type	VCTRL_CloseDrivers, %function
VCTRL_CloseDrivers:
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
	bl	VCTRL_DeinitVdmHal
	mov	r0, r4
	bl	VCTRL_DeinitScdHal
	mov	r0, r4
	bl	VCTRL_UnmapVdmRegister
	bl	VCTRL_UnregisterInterrupt
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_CloseDrivers, .-VCTRL_CloseDrivers
	.align	2
	.global	VCTRL_OpenDrivers
	.type	VCTRL_OpenDrivers, %function
VCTRL_OpenDrivers:
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
	mov	r4, r0
	bl	VCTRL_MapVdmRegister
	cmp	r0, #0
	movwne	r1, #6968
	bne	.L1571
	mov	r0, r4
	bl	VCTRL_InitVdmHal
	cmp	r0, #0
	movwne	r1, #6973
	bne	.L1571
	mov	r0, r4
	bl	VCTRL_InitScdHal
	cmp	r0, #0
	movwne	r1, #6978
	bne	.L1571
	bl	VCTRL_RegisterInterrupt
	cmp	r0, #0
	bne	.L1572
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1572:
	movw	r1, #6983
.L1571:
	ldr	r3, .L1573
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L1573+4
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_CloseDrivers
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1574:
	.align	2
.L1573:
	.word	.LANCHOR2+3100
	.word	.LC191
	UNWIND(.fnend)
	.size	VCTRL_OpenDrivers, .-VCTRL_OpenDrivers
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
	ldr	r5, .L1593
	ldr	r3, [r5, #64]
	cmp	r3, #1
	bne	.L1582
	add	r6, r5, #48
	mov	r4, #0
.L1578:
	ldr	r3, [r6], #4
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L1577
	bl	VCTRL_DestroyChan
.L1577:
	cmp	r4, #4
	bne	.L1578
	bl	FSP_Exit
	ldr	r3, [r5, #68]
	mov	r2, #3
	str	r2, [r5, #72]
	cmp	r3, #0
	beq	.L1580
	ldr	r6, .L1593+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L1581
.L1592:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L1580
.L1581:
	ldr	r3, [r5, #68]
	mov	r0, #10
	cmp	r3, #0
	bne	.L1592
.L1580:
	ldr	r0, .L1593+8
	bl	VCTRL_CloseDrivers
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #64]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1582:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1594:
	.align	2
.L1593:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+88
	UNWIND(.fnend)
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
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
	subs	r7, r0, #0
	beq	.L1627
	ldr	r5, .L1632
	mov	r2, #8
	ldr	r6, .L1632+4
	mov	r1, #0
	sub	r0, fp, #52
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r4, [r6, #64]
	cmp	r4, #0
	bne	.L1626
	mov	r1, #1024
	ldr	r3, [r5, #80]
	add	r0, r6, r1
	str	r4, [fp, #-56]
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1632+8
	add	r0, r6, #1024
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1599
	ldr	r3, [r5, #92]
	sub	r0, fp, #56
	ldr	r1, .L1632+12
	blx	r3
	cmp	r0, #0
	beq	.L1618
	sub	r0, fp, #56
	ldr	r3, [r5, #92]
	ldr	r1, .L1632+16
	blx	r3
	cmp	r0, #0
	beq	.L1628
	ldr	r3, [r5, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	mov	r3, r0
	str	r0, [r6, #792]
.L1603:
	add	r2, r3, #4992
	movw	r1, #10000
	add	r2, r2, #8
	movw	r8, #5000
	cmp	r2, r1
	bhi	.L1604
	cmp	r3, r8
	movw	r2, #60536
.L1625:
	movt	r2, 65535
	movge	r3, r8
	cmp	r3, r2
	movlt	r3, r2
.L1600:
	str	r3, [r6, #792]
.L1602:
	ldr	r8, .L1632+4
	mov	r1, #1024
	mov	r9, #0
	ldr	r3, [r5, #80]
	add	r0, r8, r1
	str	r9, [fp, #-56]
	blx	r3
	add	r0, r8, #1024
	ldr	r3, [r5, #96]
	ldr	r1, .L1632+20
	blx	r3
	ldr	r10, .L1632
	cmp	r0, r9
	str	r0, [fp, #-56]
	beq	.L1605
	ldr	r3, [r10, #92]
	sub	r0, fp, #56
	ldr	r1, .L1632+12
	blx	r3
	cmp	r0, r9
	beq	.L1606
	sub	r0, fp, #56
	ldr	r3, [r10, #92]
	ldr	r1, .L1632+16
	blx	r3
	cmp	r0, r9
	beq	.L1629
	ldr	r3, [r10, #84]
	mov	r2, r9
	mov	r1, r9
	blx	r3
	mov	r3, r0
	str	r0, [r8, #796]
.L1609:
	add	r2, r3, #4992
	movw	r1, #10000
	add	r2, r2, #8
	movw	r8, #5000
	cmp	r2, r1
	bhi	.L1610
	cmp	r3, r8
	movw	r2, #60536
	movt	r2, 65535
	movlt	r4, r3
	movge	r4, r8
	cmp	r4, r2
	movlt	r4, r2
.L1606:
	str	r4, [r6, #796]
.L1608:
	ldr	r4, [r6, #2048]
	mov	r3, #0
	ldr	r8, .L1632+4
	cmp	r4, r3
	str	r3, [fp, #-56]
	beq	.L1611
	ldr	r2, .L1632+24
	and	r3, r4, #1
	ubfx	r1, r4, #1, #1
	strb	r3, [r8, #2052]
	ubfx	r3, r4, #2, #1
	ubfx	r4, r4, #3, #1
	strb	r1, [r2, #88]
	strb	r3, [r8, #2053]
	strb	r4, [r8, #2054]
.L1612:
	ldr	r4, .L1632+4
	mov	r2, #168
	ldr	r3, [r5, #48]
	mov	r1, #0
	add	r0, r4, #64
	ldr	r8, .L1632
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #48
	blx	r3
	ldr	r1, .L1632+28
	mov	r2, #134217728
	mov	r3, #3
	str	r2, [fp, #-52]
	str	r1, [r6, #820]
	str	r3, [r6, #68]
	mov	r3, #75497472
	str	r3, [fp, #-48]
	bl	FSP_Init
	bl	VCTRL_InitChanCtx
	ldr	r3, [r5, #52]
	add	r1, r7, #8
	mov	r2, #24
	add	r0, r4, #136
	blx	r3
	add	r0, r4, #88
	bl	VCTRL_OpenDrivers
	cmp	r0, #0
	bne	.L1626
	ldr	r3, [r8, #124]
	mov	r1, #1
	blx	r3
	ldr	r3, [r8, #192]
	ldr	r2, .L1632+32
	add	r0, r4, #76
	ldr	r1, .L1632+36
	blx	r3
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r4, #64]
	bne	.L1630
.L1597:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1611:
	mov	r1, #1024
	ldr	r3, [r5, #80]
	add	r0, r8, r1
	ldr	r9, .L1632
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1632+40
	add	r0, r8, #1024
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1612
	ldr	r3, [r9, #92]
	sub	r0, fp, #56
	ldr	r1, .L1632+12
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r8, #2048]
	beq	.L1614
	sub	r0, fp, #56
	ldr	r3, [r9, #92]
	ldr	r1, .L1632+16
	blx	r3
	cmp	r0, #0
	beq	.L1631
	ldr	r3, [r9, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	str	r0, [r8, #2048]
.L1614:
	ldr	r2, .L1632+24
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #2052]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2, #88]
	strb	r3, [r6, #2053]
	strb	r0, [r6, #2054]
	b	.L1612
.L1605:
	ldr	r3, [r8, #796]
	b	.L1609
.L1599:
	ldr	r3, [r6, #792]
	b	.L1603
.L1604:
	ldr	r2, .L1632+44
	movw	r1, #1035
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r6, #792]
	movw	r2, #60536
	cmp	r3, r8
	b	.L1625
.L1610:
	ldr	r2, .L1632+48
	movw	r1, #1077
	mov	r0, #32
	bl	dprint_normal
	ldr	r4, [r6, #796]
	movw	r2, #60536
	cmp	r4, r8
	movt	r2, 65535
	movge	r4, r8
	cmp	r4, r2
	movlt	r4, r2
	b	.L1606
.L1618:
	mov	r3, r4
	b	.L1600
.L1630:
	add	r0, r4, #88
	bl	VCTRL_CloseDrivers
.L1626:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1629:
	movw	r1, #1063
	ldr	r3, .L1632+52
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1632+56
	bl	dprint_normal
	b	.L1608
.L1628:
	movw	r1, #1021
	ldr	r3, .L1632+60
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1632+56
	bl	dprint_normal
	b	.L1602
.L1631:
	movw	r1, #1114
	ldr	r3, .L1632+64
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1632+56
	bl	dprint_normal
	b	.L1612
.L1627:
	ldr	r2, .L1632+68
	movw	r3, #7044
	mov	r1, r3
	str	r3, [sp]
	ldr	r3, .L1632+72
	str	r2, [sp, #4]
	ldr	r2, .L1632+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L1597
.L1633:
	.align	2
.L1632:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC198
	.word	.LANCHOR1
	.word	VCTRL_EventReport
	.word	VCTRL_DecodeThread
	.word	.LC201
	.word	.LC200
	.word	.LC197
	.word	.LC199
	.word	.LANCHOR2+3160
	.word	.LC196
	.word	.LANCHOR2+3136
	.word	.LANCHOR2+3188
	.word	.LC192
	.word	.LANCHOR2+3120
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
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
	.align	2
.LANCHOR2 = . + 0
	.type	__func__.14256, %object
	.size	__func__.14256, 20
__func__.14256:
	.ascii	"VfmwProc_SaveDecYUV\000"
	.type	__func__.13515, %object
	.size	__func__.13515, 18
__func__.13515:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.13458, %object
	.size	__func__.13458, 26
__func__.13458:
	.ascii	"VCTRL_HandleAllocMemEvent\000"
	.space	2
	.type	__func__.13467, %object
	.size	__func__.13467, 28
__func__.13467:
	.ascii	"VCTRL_HandleReleaseMemEvent\000"
	.type	__func__.13475, %object
	.size	__func__.13475, 33
__func__.13475:
	.ascii	"VCTRL_HandleReleaseBurstMemEvent\000"
	.space	3
	.type	__func__.13483, %object
	.size	__func__.13483, 29
__func__.13483:
	.ascii	"VCTRL_HandleCancelAllocEvent\000"
	.space	3
	.type	__func__.13493, %object
	.size	__func__.13493, 33
__func__.13493:
	.ascii	"VCTRL_HandleAllocPreProcessEvent\000"
	.space	3
	.type	__func__.14397, %object
	.size	__func__.14397, 24
__func__.14397:
	.ascii	"VCTRL_SetLastFrameState\000"
	.type	__func__.13431, %object
	.size	__func__.13431, 17
__func__.13431:
	.ascii	"VCTRL_RecordData\000"
	.space	3
	.type	__func__.13527, %object
	.size	__func__.13527, 18
__func__.13527:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__func__.13563, %object
	.size	__func__.13563, 25
__func__.13563:
	.ascii	"VCTRL_SetStreamInterface\000"
	.space	3
	.type	__func__.13571, %object
	.size	__func__.13571, 30
__func__.13571:
	.ascii	"VCTRL_SetDeiMemQueryInterface\000"
	.space	2
	.type	__func__.13582, %object
	.size	__func__.13582, 20
__func__.13582:
	.ascii	"VCTRL_GetStreamSize\000"
	.type	__func__.13589, %object
	.size	__func__.13589, 20
__func__.13589:
	.ascii	"VCTRL_CheckFreshRaw\000"
	.type	__func__.13596, %object
	.size	__func__.13596, 20
__func__.13596:
	.ascii	"VCTRL_CheckFreshSeg\000"
	.type	__func__.13601, %object
	.size	__func__.13601, 25
__func__.13601:
	.ascii	"VCTRL_SetDiscardPicParam\000"
	.space	3
	.type	__func__.13636, %object
	.size	__func__.13636, 23
__func__.13636:
	.ascii	"VCTRL_FreeChanResource\000"
	.space	1
	.type	__func__.13619, %object
	.size	__func__.13619, 22
__func__.13619:
	.ascii	"VCTRL_FreeVdhResource\000"
	.space	2
	.type	__func__.13625, %object
	.size	__func__.13625, 22
__func__.13625:
	.ascii	"VCTRL_FreeScdResource\000"
	.space	2
	.type	__func__.13631, %object
	.size	__func__.13631, 22
__func__.13631:
	.ascii	"VCTRL_FreeCtxResource\000"
	.space	2
	.type	__func__.13758, %object
	.size	__func__.13758, 17
__func__.13758:
	.ascii	"VCTRL_GetChanCfg\000"
	.space	3
	.type	__func__.13814, %object
	.size	__func__.13814, 14
__func__.13814:
	.ascii	"VCTRL_SeekPts\000"
	.space	2
	.type	__func__.13818, %object
	.size	__func__.13818, 20
__func__.13818:
	.ascii	"VCTRL_InitSyntaxCtx\000"
	.type	__func__.13829, %object
	.size	__func__.13829, 20
__func__.13829:
	.ascii	"VCTRL_ReleaseStream\000"
	.type	__func__.13861, %object
	.size	__func__.13861, 19
__func__.13861:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.13865, %object
	.size	__FUNCTION__.13865, 19
__FUNCTION__.13865:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__func__.13871, %object
	.size	__func__.13871, 23
__func__.13871:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.13875, %object
	.size	__FUNCTION__.13875, 23
__FUNCTION__.13875:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.13883, %object
	.size	__func__.13883, 23
__func__.13883:
	.ascii	"VCTRL_GetHDRConfigInfo\000"
	.space	1
	.type	__func__.13898, %object
	.size	__func__.13898, 18
__func__.13898:
	.ascii	"VCTRL_GetDecParam\000"
	.space	2
	.type	__func__.13955, %object
	.size	__func__.13955, 20
__func__.13955:
	.ascii	"VCTRL_ClearDecparam\000"
	.type	__func__.13973, %object
	.size	__func__.13973, 21
__func__.13973:
	.ascii	"VCTRL_VdmProcSedOnly\000"
	.space	3
	.type	__func__.13983, %object
	.size	__func__.13983, 21
__func__.13983:
	.ascii	"VCTRL_GetImageBuffer\000"
	.space	3
	.type	__func__.13994, %object
	.size	__func__.13994, 22
__func__.13994:
	.ascii	"VCTRL_ConfigFFFBSpeed\000"
	.space	2
	.type	__func__.13999, %object
	.size	__func__.13999, 20
__func__.13999:
	.ascii	"VCTRL_ConfigPVRInfo\000"
	.type	__func__.14003, %object
	.size	__func__.14003, 19
__func__.14003:
	.ascii	"VCTRL_IsChanActive\000"
	.space	1
	.type	__func__.14007, %object
	.size	__func__.14007, 19
__func__.14007:
	.ascii	"VCTRL_VarifyOption\000"
	.space	1
	.type	__func__.14025, %object
	.size	__func__.14025, 21
__func__.14025:
	.ascii	"VCTRL_GetChanMemSize\000"
	.space	3
	.type	__func__.14108, %object
	.size	__func__.14108, 21
__func__.14108:
	.ascii	"VCTRL_GetChanIDByCtx\000"
	.space	3
	.type	__func__.14130, %object
	.size	__func__.14130, 20
__func__.14130:
	.ascii	"VCTRL_DecChanSyntax\000"
	.type	__func__.14166, %object
	.size	__func__.14166, 20
__func__.14166:
	.ascii	"VCTRL_GetChanImgNum\000"
	.type	__func__.13610, %object
	.size	__func__.13610, 19
__func__.13610:
	.ascii	"VCTRL_GetChanState\000"
	.space	1
	.type	g_VfmwProcCommandTable, %object
	.size	g_VfmwProcCommandTable, 1680
g_VfmwProcCommandTable:
	.word	0
	.word	VfmwProc_SetPrintLevel
	.ascii	"set print level\000"
	.space	14
	.space	2
	.word	2
	.word	VfmwProc_SetErrorThreshold
	.ascii	"set error threshold\000"
	.space	10
	.space	2
	.word	3
	.word	VfmwProc_SetDefaultOutputOrder
	.ascii	"set default output order\000"
	.space	5
	.space	2
	.word	4
	.word	VfmwProc_SetDecOrderOutput
	.ascii	"set dec order\000"
	.space	16
	.space	2
	.word	5
	.word	VfmwProc_SetDecMode
	.ascii	"set dec mode\000"
	.space	17
	.space	2
	.word	7
	.word	VfmwProc_SetDropStreamThreshold
	.ascii	"set drop stream threshold\000"
	.space	4
	.space	2
	.word	9
	.word	VfmwProc_SetFsWaterMark
	.ascii	"set fs water marker\000"
	.space	10
	.space	2
	.word	10
	.word	VfmwProc_SetUvmosEnable
	.ascii	"set uvmos enable\000"
	.space	13
	.space	2
	.word	11
	.word	VfmwProc_SetUSE_FF_APT_EN
	.ascii	"set ff apt enbale\000"
	.space	12
	.space	2
	.word	13
	.word	VfmwProc_SetCurProcChan
	.ascii	"set expected channel\000"
	.space	9
	.space	2
	.word	256
	.word	VfmwProc_PrintTracer
	.ascii	"print tracer informaton\000"
	.space	6
	.space	2
	.word	257
	.word	VfmwProc_SetScdPrint
	.ascii	"enable scd print control\000"
	.space	5
	.space	2
	.word	512
	.word	VfmwProc_SaveRaw
	.ascii	"save raw data\000"
	.space	16
	.space	2
	.word	513
	.word	VfmwProc_SaveSeg
	.ascii	"save seg data\000"
	.space	16
	.space	2
	.word	514
	.word	VfmwProc_SaveDispYUV
	.ascii	"save display yuv\000"
	.space	13
	.space	2
	.word	515
	.word	VfmwProc_SaveDecYUV
	.ascii	"save decode yuv\000"
	.space	14
	.space	2
	.word	528
	.word	VfmwProc_SaveMetadata
	.ascii	"save metadata\000"
	.space	16
	.space	2
	.word	530
	.word	VfmwProc_SaveReorderMetadata
	.ascii	"save reorder metadata\000"
	.space	8
	.space	2
	.word	531
	.word	VfmwProc_SaveEL
	.ascii	"save el stream\000"
	.space	15
	.space	2
	.word	544
	.word	VfmwProc_SetSaveRawAfterReset
	.ascii	"set save raw data after reset\000"
	.space	2
	.word	545
	.word	VfmwProc_SetSaveYuvBitDepth
	.ascii	"set save yuv bit depth\000"
	.space	7
	.space	2
	.word	560
	.word	VfmwProc_SetSaveYuvBegin
	.ascii	"set save yuv begin\000"
	.space	11
	.space	2
	.word	561
	.word	VfmwProc_SetSaveYuvEnd
	.ascii	"set save yuv end\000"
	.space	13
	.space	2
	.word	768
	.word	VfmwProc_TestSuspend
	.ascii	"test suspend\000"
	.space	17
	.space	2
	.word	769
	.word	VfmwProc_TestResume
	.ascii	"test resume\000"
	.space	18
	.space	2
	.word	896
	.word	VfmwProc_TestStopChan
	.ascii	"test stop channel\000"
	.space	12
	.space	2
	.word	897
	.word	VfmwProc_TestResetChan
	.ascii	"test reset channel\000"
	.space	11
	.space	2
	.word	898
	.word	VfmwProc_TestStartChan
	.ascii	"test start channel\000"
	.space	11
	.space	2
	.word	899
	.word	VfmwProc_TestRestartChan
	.ascii	"test restart channel\000"
	.space	9
	.space	2
	.word	1024
	.word	VfmwProc_TestTimeSequence
	.ascii	"set thread sleep time in ms\000"
	.space	2
	.space	2
	.word	1026
	.word	VfmwProc_TestStopDec
	.ascii	"stop decode at given frame num"
	.space	2
	.word	1280
	.word	VfmwProc_SetTraceCtrl
	.ascii	"set trace control\000"
	.space	12
	.space	2
	.word	1281
	.word	VfmwProc_SetTraceBSPeriod
	.ascii	"set trace bitstream period\000"
	.space	3
	.space	2
	.word	1282
	.word	VfmwProc_SetTraceFramePeriod
	.ascii	"set trace frame period\000"
	.space	7
	.space	2
	.word	1283
	.word	VfmwProc_SetTraceImgPeriod
	.ascii	"set trace image period\000"
	.space	7
	.space	2
	.word	1536
	.word	VfmwProc_OpenModuleLowly
	.ascii	"enable module lowdelay\000"
	.space	7
	.space	2
	.word	1537
	.word	VfmwProc_CloseModuleLowly
	.ascii	"disable module lowdelay\000"
	.space	6
	.space	2
	.word	1541
	.word	VfmwProc_SetSedOnlyEnable
	.ascii	"set sed only switch\000"
	.space	10
	.space	2
	.word	2304
	.word	VfmwProc_SetClkSelect
	.ascii	"set vdh clock selection\000"
	.space	6
	.space	2
	.word	2305
	.word	VfmwProc_SetStandardObedience
	.ascii	"set standard obedience\000"
	.space	7
	.space	2
	.word	2306
	.word	VfmwProc_SetStatisticsEnable
	.ascii	"set statistics enable\000"
	.space	8
	.space	2
	.word	65535
	.word	0
	.space	32
	.type	__func__.14386, %object
	.size	__func__.14386, 22
__func__.14386:
	.ascii	"VCTRL_ShowProcCommand\000"
	.space	2
	.type	__func__.14412, %object
	.size	__func__.14412, 22
__func__.14412:
	.ascii	"VCTRL_OutputLastFrame\000"
	.space	2
	.type	__func__.13944, %object
	.size	__func__.13944, 15
__func__.13944:
	.ascii	"VCTRL_PostProc\000"
	.space	1
	.type	__func__.13968, %object
	.size	__func__.13968, 18
__func__.13968:
	.ascii	"VCTRL_VdmPostProc\000"
	.space	2
	.type	__func__.14468, %object
	.size	__func__.14468, 19
__func__.14468:
	.ascii	"VCTRL_OpenHardware\000"
	.space	1
	.type	__func__.13737, %object
	.size	__func__.13737, 16
__func__.13737:
	.ascii	"VCTRL_StartChan\000"
	.type	__func__.14478, %object
	.size	__func__.14478, 20
__func__.14478:
	.ascii	"VCTRL_CloseHardware\000"
	.type	__func__.13753, %object
	.size	__func__.13753, 15
__func__.13753:
	.ascii	"VCTRL_StopChan\000"
	.space	1
	.type	__func__.13851, %object
	.size	__func__.13851, 26
__func__.13851:
	.ascii	"VCTRL_ResetChanWithOption\000"
	.space	2
	.type	__func__.13836, %object
	.size	__func__.13836, 26
__func__.13836:
	.ascii	"VCTRL_MarkImageOutHanging\000"
	.space	2
	.type	__func__.13648, %object
	.size	__func__.13648, 17
__func__.13648:
	.ascii	"VCTRL_CheckParam\000"
	.space	3
	.type	__func__.13808, %object
	.size	__func__.13808, 17
__func__.13808:
	.ascii	"VCTRL_ConfigChan\000"
	.space	3
	.type	__func__.13731, %object
	.size	__func__.13731, 18
__func__.13731:
	.ascii	"VCTRL_DestroyChan\000"
	.space	2
	.type	__func__.14505, %object
	.size	__func__.14505, 21
__func__.14505:
	.ascii	"VCTRL_BindRequireMem\000"
	.space	3
	.type	__func__.14511, %object
	.size	__func__.14511, 25
__func__.14511:
	.ascii	"VCTRL_SetFrameBufferMode\000"
	.space	3
	.type	__func__.14519, %object
	.size	__func__.14519, 23
__func__.14519:
	.ascii	"VCTRL_BindExternBuffer\000"
	.space	1
	.type	__func__.14527, %object
	.size	__func__.14527, 25
__func__.14527:
	.ascii	"VCTRL_UnBindExternBuffer\000"
	.space	3
	.type	__func__.14533, %object
	.size	__func__.14533, 24
__func__.14533:
	.ascii	"VCTRL_SetFrameBufferNum\000"
	.type	__func__.14552, %object
	.size	__func__.14552, 24
__func__.14552:
	.ascii	"VCTRL_IsResolutionValid\000"
	.type	__func__.14564, %object
	.size	__func__.14564, 20
__func__.14564:
	.ascii	"VCTRL_RecordPosTime\000"
	.type	__func__.14579, %object
	.size	__func__.14579, 18
__func__.14579:
	.ascii	"VCTRL_OpenDrivers\000"
	.space	2
	.type	__func__.14594, %object
	.size	__func__.14594, 15
__func__.14594:
	.ascii	"VCTRL_OpenVfmw\000"
	.space	1
	.type	__FUNCTION__.13538, %object
	.size	__FUNCTION__.13538, 24
__FUNCTION__.13538:
	.ascii	"VCTRL_GetExtraRefFrmNum\000"
	.type	__FUNCTION__.13544, %object
	.size	__FUNCTION__.13544, 25
__FUNCTION__.13544:
	.ascii	"VCTRL_GetExtraDispFrmNum\000"
	.space	3
	.type	__FUNCTION__.13550, %object
	.size	__FUNCTION__.13550, 22
__FUNCTION__.13550:
	.ascii	"VCTRL_GetExtraCtrlCmd\000"
	.data
	.align	2
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
	.type	g_SaveFilePath, %object
	.size	g_SaveFilePath, 64
g_SaveFilePath:
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
	.space	3
	.type	g_MaskMMUErrIntEnable, %object
	.size	g_MaskMMUErrIntEnable, 4
g_MaskMMUErrIntEnable:
	.word	1
	.type	g_RpuStartCode, %object
	.size	g_RpuStartCode, 5
g_RpuStartCode:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	25
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Set statistics: %d\012\000" )
.LC1:
	ASCII(.ascii	"Set standard obedience: %d\012\000" )
.LC2:
	ASCII(.ascii	"g_ClkSelect(%d) set error! dat = %d not support\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC3:
	ASCII(.ascii	"------ g_TraceImgPeriod = %x ------\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"------ g_TraceFramePeriod = %x ------\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"------ g_TraceBsPeriod = %x ------\012\000" )
.LC6:
	ASCII(.ascii	"------ g_TraceCtrl = %x ------\012\000" )
.LC7:
	ASCII(.ascii	"------ dec stop = %d ------\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"------ dec task delay %d ms ------\012\000" )
.LC9:
	ASCII(.ascii	"ERROR: set save yuv end failed, begin %d > end %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC10:
	ASCII(.ascii	"------ Set save yuv end[%d, %d] ------\012\000" )
.LC11:
	ASCII(.ascii	"ERROR: set save yuv begin failed, begin %d > end %d" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"------ Set save yuv begin[%d, %d] ------\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"ERROR: g_SaveYUVBitDepth should be 8 or 10! (not to" )
	ASCII(.ascii	" be %d)\012\000" )
.LC14:
	ASCII(.ascii	"------ g_SaveYUVBitDepth = %d ------\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"SaveRawAfterReset = %d\012\000" )
.LC16:
	ASCII(.ascii	"SaveRawAfterReset can NOT be set to %d, must be 0 o" )
	ASCII(.ascii	"r 1\012\000" )
.LC17:
	ASCII(.ascii	"%s/vfmw_el_save_%d.dat\000" )
	.space	1
.LC18:
	ASCII(.ascii	"OK create file '%s' for channel %d el stream save\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC19:
	ASCII(.ascii	"failed create file '%s' for el stream save!\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	">>>> close el stream saving >>>>\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"%s not support now!\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"NO SUCH CHANNEL : %d\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"Pay attention to  CHANNEL : %d\012\000" )
.LC24:
	ASCII(.ascii	"g_Use_FFAPT_Enable = %d\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"g_Use_FFAPT_Enable can NOT be set to %d, must be 0 " )
	ASCII(.ascii	"or 1\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"g_FsWaterMarkEnable = %d\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"g_FsWaterMarkEnable can NOT be set to %d, must be 0" )
	ASCII(.ascii	" or 1\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"Invalid output order %d\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"set default output order %d\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"PrintEnable = 0x%x\012\000" )
.LC31:
	ASCII(.ascii	"%s %d: %s\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"InstID out of range\000" )
.LC33:
	ASCII(.ascii	"Chan inactive\000" )
	.space	2
.LC34:
	ASCII(.ascii	"%s ERROR: Arg Len %d != %d\012\000" )
.LC35:
	ASCII(.ascii	"%s\000" )
	.space	1
.LC36:
	ASCII(.ascii	"%s ERROR: VMM_CMD_Alloc %s size %d failed!\012\000" )
.LC37:
	ASCII(.ascii	"%s ERROR: VMM_CMD_Release %s phy 0x%x failed!\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"%s ERROR: VMM_CMD_ReleaseBurst failed!\012\000" )
.LC39:
	ASCII(.ascii	"%s ERROR: VMM_CMD_BLK_CancleCmd %d failed!\012\000" )
.LC40:
	ASCII(.ascii	"ChanID out of range\000" )
.LC41:
	ASCII(.ascii	"pMemInfo is NULL\000" )
	.space	3
.LC42:
	ASCII(.ascii	"%s ERROR: VMM_CMD_BLK_OpsInvoke %d  Type failed!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC43:
	ASCII(.ascii	"g_VfmwCtrlData.event_report_vdec = NULL\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	"g_VfmwCtrlData.event_report_omxvdec = NULL\012\000" )
.LC45:
	ASCII(.ascii	"%s Unkown Adapter Type: %d, Len: %d\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"OK create file '%s' for channel %d metadata_reorder" )
	ASCII(.ascii	" stream save\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"failed create file '%s' for metadata_reorder stream" )
	ASCII(.ascii	" save!\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	">>>> close metadata stream saving >>>>\012\000" )
.LC49:
	ASCII(.ascii	"OK create file '%s' for channel %d metadata stream " )
	ASCII(.ascii	"save\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"failed create file '%s' for metadata stream save!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC51:
	ASCII(.ascii	"OK create file '%s' for channel %d seg stream save\012" )
	ASCII(.ascii	"\000" )
.LC52:
	ASCII(.ascii	"failed create file '%s' for seg stream save!\012\000" )
	.space	2
.LC53:
	ASCII(.ascii	">>>> close seg stream saving >>>>\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"OK create file '%s' for channel %d raw stream save\012" )
	ASCII(.ascii	"\000" )
.LC55:
	ASCII(.ascii	"failed create file '%s' for raw stream save!\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	">>>> close raw stream saving >>>>\012\000" )
	.space	1
.LC57:
	ASCII(.ascii	"OK close yuv save.\012\000" )
.LC58:
	ASCII(.ascii	"failed create file '%s' for yuv save!\012\000" )
	.space	1
.LC59:
	ASCII(.ascii	"Failed to alloc YUV mem size %d!\012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"OK create file '%s' for chan %d yuv save.(crop %d)\012" )
	ASCII(.ascii	"\000" )
.LC61:
	ASCII(.ascii	"print memory tracer...\012\000" )
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
	ASCII(.ascii	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleL" )
	ASCII(.ascii	"owlyEnable = 1 ------\012\000" )
	.space	2
.LC66:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC67:
	ASCII(.ascii	"Force vdm %d sleep.\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"Vfmw suspend totally take %d ms\012\000" )
	.space	3
.LC69:
	ASCII(.ascii	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSlee" )
	ASCII(.ascii	"p=%d)!\012\000" )
	.space	1
.LC70:
	ASCII(.ascii	"Force scd %d sleep.\012\000" )
	.space	3
.LC71:
	ASCII(.ascii	"proc cmd need no param:%p\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"Vfmw resume totally take %d ms\012\000" )
.LC73:
	ASCII(.ascii	"%s, %d, pos(%d) error!\012\000" )
.LC74:
	ASCII(.ascii	"event_report null!\000" )
	.space	1
.LC75:
	ASCII(.ascii	"%s Unkown Adapter Type: %d\012\000" )
.LC76:
	ASCII(.ascii	"pstStreamParam is NULL\000" )
	.space	1
.LC77:
	ASCII(.ascii	"pDeiMemIntf is NULL\000" )
.LC78:
	ASCII(.ascii	"can NOT get a not-opened Chan's information of bits" )
	ASCII(.ascii	"tream\000" )
	.space	3
.LC79:
	ASCII(.ascii	"This Chan has not been created!!!\000" )
	.space	2
.LC80:
	ASCII(.ascii	"Raw FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC81:
	ASCII(.ascii	"Seg FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC82:
	ASCII(.ascii	"pArgs is null\000" )
	.space	2
.LC83:
	ASCII(.ascii	"%s FATAL: pstChan = NULL!\012\000" )
	.space	1
.LC84:
	ASCII(.ascii	"%s FATAL: pChanMem_vdh = NULL!\012\000" )
.LC85:
	ASCII(.ascii	"%s FATAL: pChanMem_scd = NULL!\012\000" )
.LC86:
	ASCII(.ascii	"%s FATAL: pChanMem_ctx = NULL!\012\000" )
.LC87:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC88:
	ASCII(.ascii	"chan not create\000" )
.LC89:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC90:
	ASCII(.ascii	"s_pstVfmwChan = NULL\000" )
	.space	3
.LC91:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC92:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC93:
	ASCII(.ascii	"%s, %d, Phyaddr = 0x%x MetaDataPhyaddr = 0x%x image" )
	ASCII(.ascii	"_id = %d\012\000" )
	.space	3
.LC94:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC95:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC96:
	ASCII(.ascii	"%s, %d, ===> Phyaddr 0x%x release Error, force to U" )
	ASCII(.ascii	"nMark ImageOutHanging\012\000" )
	.space	2
.LC97:
	ASCII(.ascii	"%s, %d, ===> Phyaddr 0x%x release success!! imageId" )
	ASCII(.ascii	" = 0x%x\012\000" )
.LC98:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC99:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"pstHDRInput = null\000" )
	.space	1
.LC101:
	ASCII(.ascii	"%s VidStd=%d Error!\012\000" )
	.space	3
.LC102:
	ASCII(.ascii	"Get DecParam Type Failure!\012\000" )
.LC103:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range is %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC104:
	ASCII(.ascii	"Chan %d is not open or not running\012\000" )
.LC105:
	ASCII(.ascii	"ChanId out of range\000" )
.LC106:
	ASCII(.ascii	"%s unsupport VidStd %d\012\000" )
.LC107:
	ASCII(.ascii	"This channel is not running\000" )
.LC108:
	ASCII(.ascii	"%s unsupport VidStd %d.\012\000" )
	.space	3
.LC109:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC110:
	ASCII(.ascii	"pArgs = null\000" )
	.space	3
.LC111:
	ASCII(.ascii	"%s param invalid.\012\000" )
	.space	1
.LC112:
	ASCII(.ascii	"pChanOption = null\000" )
	.space	1
.LC113:
	ASCII(.ascii	"pDetailMemSize = null\000" )
	.space	2
.LC114:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), g_ExtraRef(%d), s32Di" )
	ASCII(.ascii	"splayFrameNum(%d), g_ExtraDisp(%d)\012\000" )
	.space	1
.LC115:
	ASCII(.ascii	"Register irq %d failed!\012\000" )
	.space	3
.LC116:
	ASCII(.ascii	"MEM_MapRegisterAddr reg 0x%x failed!\012\000" )
	.space	2
.LC117:
	ASCII(.ascii	"VDMDRV_GetHalMemSize Vdh %d failed!\012\000" )
	.space	3
.LC118:
	ASCII(.ascii	"MEM_AllocMemBlock Vdh %d failed!\012\000" )
	.space	2
.LC119:
	ASCII(.ascii	"VDMDRV_OpenHAL Vdh %d failed!\012\000" )
	.space	1
.LC120:
	ASCII(.ascii	"MEM_AllocMemBlock Scd %d failed!\012\000" )
	.space	2
.LC121:
	ASCII(.ascii	"SM_OpenSCDDrv Scd %d failed!\012\000" )
	.space	2
.LC122:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC123:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC124:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC125:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC126:
	ASCII(.ascii	"pCtx = null\000" )
.LC127:
	ASCII(.ascii	"Chan:%d pic_pts: %lld\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"Chan:%d pic_usertag: %lld\012\000" )
	.space	1
.LC129:
	ASCII(.ascii	"Chan:%d pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC130:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC131:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC132:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC133:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC134:
	ASCII(.ascii	"Chan:%d seg_pts: %lld, seg_usertag = %lld\012\000" )
	.space	1
.LC135:
	ASCII(.ascii	"pRefImgNum = null\000" )
	.space	2
.LC136:
	ASCII(.ascii	"pReadImgNum = null\000" )
	.space	1
.LC137:
	ASCII(.ascii	"pNewImgNum = null\000" )
	.space	2
.LC138:
	ASCII(.ascii	"%s not support std %d\012\000" )
	.space	1
.LC139:
	ASCII(.ascii	"pstChanState = NULL\000" )
.LC140:
	ASCII(.ascii	"pShowStr = null\000" )
.LC141:
	ASCII(.ascii	"  0x%-15x %s\000" )
	.space	3
.LC142:
	ASCII(.ascii	"Command \"0x%x\" not registerd!\012\000" )
	.space	1
.LC143:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC144:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC145:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC146:
	ASCII(.ascii	"Chan id out of range!\000" )
	.space	2
.LC147:
	ASCII(.ascii	"Chan not created!\000" )
	.space	2
.LC148:
	ASCII(.ascii	"Chan not open!\000" )
	.space	1
.LC149:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC150:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC151:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC152:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC153:
	ASCII(.ascii	"\012====>%s, %d=====> prepare\012\000" )
.LC154:
	ASCII(.ascii	"====>%s, %d=====> end\012\012\000" )
.LC155:
	ASCII(.ascii	"Param Invalid of PChanOption is NULL\012\000" )
	.space	2
.LC156:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSize failed!\012\000" )
	.space	2
.LC157:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT create m" )
	ASCII(.ascii	"ore channels\012\000" )
	.space	3
.LC158:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC159:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC160:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC161:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC162:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel scd\012\000" )
	.space	2
.LC163:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for SCD\012\000" )
	.space	2
.LC164:
	ASCII(.ascii	"Chan:%d can NOT enable FSP instance\012\000" )
	.space	3
.LC165:
	ASCII(.ascii	"Chan:%d hal mem %d overlap scd mem %d\012\000" )
	.space	1
.LC166:
	ASCII(.ascii	"can NOT config a not-opened Chan\000" )
	.space	3
.LC167:
	ASCII(.ascii	"pstCfg = null\000" )
	.space	2
.LC168:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC169:
	ASCII(.ascii	"%s check standard support failed.\012\000" )
	.space	1
.LC170:
	ASCII(.ascii	"%s config not change, no need to proceed.\012\000" )
	.space	1
.LC171:
	ASCII(.ascii	"chan %d: new UvmosEnable = %d\012\000" )
	.space	1
.LC172:
	ASCII(.ascii	"chan %d: SetUvmosEnable failed!\012\000" )
	.space	3
.LC173:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC174:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC175:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC176:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC177:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC178:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC179:
	ASCII(.ascii	"%s:L%d: %s\012\000" )
.LC180:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC181:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC182:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC183:
	ASCII(.ascii	"pMem = NULL\000" )
.LC184:
	ASCII(.ascii	"%s Mem UniqueID %llx != Chan UniqueID %llx, ignor t" )
	ASCII(.ascii	"his bind operation.\012\000" )
.LC185:
	ASCII(.ascii	"pExternBuffer = NULL\000" )
	.space	3
.LC186:
	ASCII(.ascii	"Attached buffer phy:%x, but vir addr is NULL\012\000" )
	.space	2
.LC187:
	ASCII(.ascii	"Resolution min(w=%d,h=%d), this stream (w=%d,h=%d) " )
	ASCII(.ascii	"invalid!\012\000" )
	.space	3
.LC188:
	ASCII(.ascii	"Resolution max(w = %d, h = %d), this stream (w = %d" )
	ASCII(.ascii	", h = %d) invalid!\012\000" )
	.space	1
.LC189:
	ASCII(.ascii	"Std(%d) not support 4K(w = %d, h = %d)\012\000" )
.LC190:
	ASCII(.ascii	"%s,%d,pos(%d) error!\012\000" )
	.space	2
.LC191:
	ASCII(.ascii	"%s %d ERROR exit.\012\000" )
	.space	1
.LC192:
	ASCII(.ascii	"pArgs null!\000" )
.LC193:
	ASCII(.ascii	"g_ExtraRef=\000" )
.LC194:
	ASCII(.ascii	"=\000" )
	.space	2
.LC195:
	ASCII(.ascii	" \000" )
	.space	2
.LC196:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC197:
	ASCII(.ascii	"ERROR: g_ExtraRef = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC198:
	ASCII(.ascii	"g_ExtraDisp=\000" )
	.space	3
.LC199:
	ASCII(.ascii	"ERROR: g_ExtraDisp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
.LC200:
	ASCII(.ascii	"g_ExtraCommand=\000" )
.LC201:
	ASCII(.ascii	"HI_VFMW_VideoDecode\000" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_StatisticsEnable, %object
	.size	g_StatisticsEnable, 4
g_StatisticsEnable:
	.space	4
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.space	4
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.space	4
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.space	4
	.type	g_SaveYuvBegin, %object
	.size	g_SaveYuvBegin, 4
g_SaveYuvBegin:
	.space	4
	.type	g_SaveRawAfterReset, %object
	.size	g_SaveRawAfterReset, 4
g_SaveRawAfterReset:
	.space	4
	.type	g_SaveElFileHandler, %object
	.size	g_SaveElFileHandler, 16
g_SaveElFileHandler:
	.space	16
	.type	save_file_cnt.14274, %object
	.size	save_file_cnt.14274, 4
save_file_cnt.14274:
	.space	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.space	4
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 16
s_pstVfmwChan:
	.space	16
	.type	g_VfmwCtrlData, %object
	.size	g_VfmwCtrlData, 168
g_VfmwCtrlData:
	.space	168
	.type	g_SaveReorderMetadataFileHandler, %object
	.size	g_SaveReorderMetadataFileHandler, 16
g_SaveReorderMetadataFileHandler:
	.space	16
	.type	save_file_cnt.14268, %object
	.size	save_file_cnt.14268, 4
save_file_cnt.14268:
	.space	4
	.type	g_SaveMetadataFileHandler, %object
	.size	g_SaveMetadataFileHandler, 16
g_SaveMetadataFileHandler:
	.space	16
	.type	save_file_cnt.14262, %object
	.size	save_file_cnt.14262, 4
save_file_cnt.14262:
	.space	4
	.type	g_SaveSegFileHandler, %object
	.size	g_SaveSegFileHandler, 16
g_SaveSegFileHandler:
	.space	16
	.type	save_file_cnt.14244, %object
	.size	save_file_cnt.14244, 4
save_file_cnt.14244:
	.space	4
	.type	g_SaveRawFileHandler, %object
	.size	g_SaveRawFileHandler, 16
g_SaveRawFileHandler:
	.space	16
	.type	save_file_cnt.14238, %object
	.size	save_file_cnt.14238, 4
save_file_cnt.14238:
	.space	4
	.type	g_SaveDispYuvFileHandler, %object
	.size	g_SaveDispYuvFileHandler, 16
g_SaveDispYuvFileHandler:
	.space	16
	.type	g_SaveMemRecord, %object
	.size	g_SaveMemRecord, 24
g_SaveMemRecord:
	.space	24
	.type	SaveFileCnt.14252, %object
	.size	SaveFileCnt.14252, 4
SaveFileCnt.14252:
	.space	4
	.type	g_SaveYuvCount, %object
	.size	g_SaveYuvCount, 4
g_SaveYuvCount:
	.space	4
	.type	last_rec_pos_time.13862, %object
	.size	last_rec_pos_time.13862, 16
last_rec_pos_time.13862:
	.space	16
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 400
g_VfmwChanStat:
	.space	400
	.type	last_rec_pos_time.13872, %object
	.size	last_rec_pos_time.13872, 16
last_rec_pos_time.13872:
	.space	16
	.type	g_ExtraRef, %object
	.size	g_ExtraRef, 4
g_ExtraRef:
	.space	4
	.type	g_ExtraDisp, %object
	.size	g_ExtraDisp, 4
g_ExtraDisp:
	.space	4
	.type	g_IrqDevHandle, %object
	.size	g_IrqDevHandle, 4
g_IrqDevHandle:
	.space	4
	.type	ChanPriTab.14134, %object
	.size	ChanPriTab.14134, 16
ChanPriTab.14134:
	.space	16
	.type	g_EventReportFunc, %object
	.size	g_EventReportFunc, 4
g_EventReportFunc:
	.space	4
	.type	PrioArray.13736, %object
	.size	PrioArray.13736, 16
PrioArray.13736:
	.space	16
	.type	Capability.13807, %object
	.size	Capability.13807, 148
Capability.13807:
	.space	148
	.type	PrioArray.13806, %object
	.size	PrioArray.13806, 16
PrioArray.13806:
	.space	16
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 16
g_EsBufValidFlag:
	.space	16
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.space	1
	.space	3
	.type	g_CmdLine, %object
	.size	g_CmdLine, 1024
g_CmdLine:
	.space	1024
	.type	g_ExtraCommand, %object
	.size	g_ExtraCommand, 4
g_ExtraCommand:
	.space	4
	.type	g_AllowBPicBeforePPic, %object
	.size	g_AllowBPicBeforePPic, 1
g_AllowBPicBeforePPic:
	.space	1
	.type	g_H264FullPictureRepairDisable, %object
	.size	g_H264FullPictureRepairDisable, 1
g_H264FullPictureRepairDisable:
	.space	1
	.type	g_AppleAirplayMirrorinigFlag, %object
	.size	g_AppleAirplayMirrorinigFlag, 1
g_AppleAirplayMirrorinigFlag:
	.space	1
	.space	1
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 60
g_VfmwGlobalStat:
	.space	60
	.type	g_SaveDecYuvFileHandler, %object
	.size	g_SaveDecYuvFileHandler, 16
g_SaveDecYuvFileHandler:
	.space	16
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
