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
	.type	VCTRL_GetChanView1Image, %function
VCTRL_GetChanView1Image:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #548)
	sub	sp, sp, #548
	ldr	r3, [r1, #108]
	mov	r4, r1
	cmp	r3, #0
	beq	.L208
	ldr	ip, [r1, #452]
	mov	r3, #1
	ldr	r1, [r1, #444]
	mov	r0, r3
	str	r3, [r4, #108]
	mvn	r2, #0
	mov	r3, #3
	str	ip, [r4, #460]
	str	r1, [r4, #456]
	str	r2, [r4, #92]
	str	r3, [r4, #152]
.L207:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L208:
	ldr	r5, .L213
	sub	r1, fp, #564
	add	r5, r5, r0, lsl #2
	ldr	r0, [r5, #48]
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r6, r0
	bne	.L209
	ldr	r3, [r4, #112]
	ldr	r2, [fp, #-452]
	cmp	r3, r2
	bge	.L199
	ldr	r2, [fp, #-456]
	mov	r3, #3
	ldr	r0, [fp, #-112]
	cmp	r2, #0
	ldr	r1, [fp, #-120]
	ldr	r2, [fp, #-476]
	str	r0, [r4, #460]
	str	r1, [r4, #456]
	str	r2, [r4, #92]
	str	r3, [r4, #152]
	strne	r6, [r4, #108]
.L200:
	mov	r0, r6
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L209:
	ldr	r0, [r5, #48]
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReturnImage
	mov	r0, r6
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L199:
	ldr	r0, [r5, #48]
	bgt	.L210
	cmp	r3, #0
	beq	.L211
	add	r0, r0, #207872
	mov	r1, r4
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	ldr	r3, [fp, #-456]
	cmp	r3, #0
	beq	.L212
	ldr	ip, [r4, #112]
	movw	r1, #3107
	ldr	r3, .L213+4
	mov	r0, r6
	ldr	r2, .L213+8
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, .L213+12
	sub	r1, fp, #564
	mov	r2, #536
	mov	r0, r4
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-120]
	ldr	r1, [fp, #-112]
	mvn	r2, #0
	mov	r0, r6
	str	r6, [r4, #108]
	str	r3, [r4, #456]
	mov	r3, #3
	str	r1, [r4, #460]
	str	r2, [r4, #92]
	str	r3, [r4, #152]
	b	.L207
.L211:
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReturnImage
	ldr	r0, [r5, #48]
	mov	r1, r4
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	ldr	ip, [r4, #112]
	mov	r0, r6
	ldr	r3, .L213+4
	ldr	r2, .L213+16
	movw	r1, #3092
	str	ip, [sp]
	mvn	r6, #1
	bl	dprint_normal
	b	.L200
.L210:
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReturnImage
	ldr	r0, [r5, #48]
	mov	r1, r4
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	ldr	ip, [r4, #112]
	ldr	r2, [fp, #-452]
	mov	r0, r6
	ldr	r3, .L213+4
	movw	r1, #3083
	str	ip, [sp]
	mvn	r6, #1
	str	r2, [sp, #4]
	ldr	r2, .L213+20
	bl	dprint_normal
	b	.L200
.L212:
	ldr	r0, [r5, #48]
	sub	r1, fp, #564
	add	r0, r0, #207872
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	ldr	ip, [r4, #112]
	mov	r0, r6
	ldr	r3, .L213+4
	ldr	r2, .L213+8
	movw	r1, #3107
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #1
	b	.L207
.L214:
	.align	2
.L213:
	.word	.LANCHOR0
	.word	.LANCHOR2+200
	.word	.LC63
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC62
	.word	.LC61
	UNWIND(.fnend)
	.size	VCTRL_GetChanView1Image, .-VCTRL_GetChanView1Image
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
	ldr	r4, .L216
	mov	r1, #1
	ldr	r0, [r0]
	mov	r3, #2097152
	ldr	r5, [r4]
	str	r3, [r4]
	bl	PrintScdRawState
	str	r5, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L217:
	.align	2
.L216:
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
	ldr	r2, .L219
	movw	r1, #5398
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DBG_PrintTracer
.L220:
	.align	2
.L219:
	.word	.LC64
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
	beq	.L223
	ldr	r3, .L224
	mov	ip, #1
	ldr	r2, .L224+4
	movw	r1, #5930
	mov	r0, #32
	str	ip, [r3, #80]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L223:
	ldr	ip, .L224
	movw	r1, #5925
	ldr	r2, .L224+8
	mov	r0, #32
	str	r3, [ip, #80]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L225:
	.align	2
.L224:
	.word	.LANCHOR1
	.word	.LC66
	.word	.LC65
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
	bhi	.L228
	ldr	ip, .L229
	mov	r3, r1
	mov	lr, #0
	ldr	r2, .L229+4
	add	ip, ip, r1, lsl #2
	mov	r0, #32
	movw	r1, #5901
	ldr	ip, [ip, #48]
	add	ip, ip, #204800
	str	lr, [ip, #3276]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L228:
	ldr	r2, .L229+8
	movw	r1, #5896
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L230:
	.align	2
.L229:
	.word	.LANCHOR0
	.word	.LC68
	.word	.LC67
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
	bhi	.L233
	ldr	ip, .L234
	mov	r3, r1
	mov	lr, #1
	ldr	r2, .L234+4
	add	ip, ip, r1, lsl #2
	mov	r0, #32
	movw	r1, #5885
	ldr	ip, [ip, #48]
	add	ip, ip, #204800
	str	lr, [ip, #3276]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L233:
	ldr	r2, .L234+8
	movw	r1, #5880
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L235:
	.align	2
.L234:
	.word	.LANCHOR0
	.word	.LC68
	.word	.LC67
	UNWIND(.fnend)
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	2
	.type	VCTRL_SetLastFrameState.part.21, %function
VCTRL_SetLastFrameState.part.21:
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
	ldr	r2, .L237
	movw	r3, #6193
	mov	r0, #0
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	ldr	r3, .L237+4
	ldr	r2, .L237+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L238:
	.align	2
.L237:
	.word	.LC40
	.word	.LANCHOR2+224
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState.part.21, .-VCTRL_SetLastFrameState.part.21
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
	ldr	r5, .L289
	ldr	r8, .L289+4
	ldr	r3, [r5]
	blx	r3
	ldr	r2, [r8]
	cmp	r2, #0
	mov	r9, r0
	beq	.L240
	mov	r0, #0
	blx	r2
.L242:
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
.L241:
	mov	r0, #0
	bl	SCDDRV_GetSleepStage
	cmp	r0, #2
	bne	.L282
	mov	r0, #0
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L283
.L246:
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L251
	mov	r0, #0
	blx	r3
.L251:
	ldr	r2, [r8, #24]
	cmp	r2, #0
	beq	.L284
	mov	r0, #0
	blx	r2
	ldr	r2, [r8, #8]
	cmp	r2, #0
	beq	.L285
.L254:
	mov	r0, #0
	blx	r2
.L255:
	ldr	r6, .L289+8
	ldr	r3, [r6, #64]
	cmp	r3, #1
	bne	.L256
	ldr	r3, [r6, #68]
	mov	r2, #2
	str	r2, [r6, #72]
	cmp	r3, #1
	beq	.L258
	ldr	r3, [r5, #120]
	mov	r0, #10
	blx	r3
	mov	r4, #49
	b	.L259
.L286:
	ldr	r3, [r5, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L258
.L259:
	ldr	r3, [r6, #68]
	mov	r0, #10
	cmp	r3, #1
	bne	.L286
.L258:
	mov	r3, #0
	str	r3, [r6, #72]
.L256:
	ldr	r3, [r5]
	blx	r3
	ldr	r2, .L289+12
	movw	r1, #363
	cmp	r9, r0
	rsbls	r3, r9, r0
	mvnhi	r9, r9
	addhi	r3, r9, r0
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L282:
	mov	r0, #0
	mov	r10, r7
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L262
	mov	r6, #1
	mov	r2, r6
.L263:
	tst	r2, r10
	bne	.L246
	subs	r4, r4, #1
	beq	.L287
	ldr	r3, [r5, #120]
	mov	r0, #10
	blx	r3
	eor	r3, r6, #1
	eor	r2, r7, #1
	orrs	r3, r3, r2
	bne	.L241
	b	.L246
.L283:
	mov	r7, #1
	mov	r10, r7
.L262:
	mov	r2, r6
	b	.L263
.L287:
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [fp, #-48]
	str	r6, [sp, #4]
	movw	r1, #270
	str	r7, [sp]
	ldr	r2, .L289+16
	cmp	r3, r0
	rsbls	r3, r3, r0
	ldrhi	r3, [fp, #-48]
	mvnhi	r10, r3
	addhi	r3, r10, r0
	mov	r0, #0
	bl	dprint_normal
	cmp	r7, #1
	beq	.L288
	mov	r3, #0
	ldr	r2, .L289+20
	mov	r0, r3
	mov	r1, #276
	bl	dprint_normal
	mov	r0, #0
	bl	SCDDRV_ForceSleep
	cmp	r6, #1
	beq	.L246
.L265:
	mov	r3, #0
	ldr	r2, .L289+24
	mov	r0, r3
	movw	r1, #285
	bl	dprint_normal
	mov	r0, #0
	bl	VDMDRV_ForceSleep
	b	.L246
.L288:
	cmp	r6, #1
	bne	.L265
	b	.L246
.L240:
	movw	r3, #343
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L289+28
	bl	dprint_normal
	b	.L242
.L284:
	mov	r3, #320
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L289+28
	bl	dprint_normal
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L254
.L285:
	movw	r3, #325
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L289+28
	bl	dprint_normal
	b	.L255
.L290:
	.align	2
.L289:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC70
	.word	.LC69
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
	ldr	r2, .L292
	mov	r3, r0
	movw	r1, #5747
	mov	r0, #20
	bl	dprint_normal
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Suspend
.L293:
	.align	2
.L292:
	.word	.LC74
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
	ldr	r6, .L316
	ldr	r4, .L316+4
	ldr	r3, [r6]
	blx	r3
	ldr	r2, [r4, #4]
	cmp	r2, #0
	mov	r7, r0
	beq	.L313
	mov	r0, #0
	blx	r2
	ldr	r2, [r4, #20]
	cmp	r2, #0
	beq	.L314
.L297:
	mov	r0, #0
	blx	r2
.L298:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L299
	mov	r0, #0
	blx	r3
.L299:
	ldr	r5, .L316+8
	mov	r0, #0
	bl	SCDDRV_ExitSleep
	mov	r0, #0
	bl	VDMDRV_ExitSleep
	ldr	r3, [r5, #64]
	cmp	r3, #1
	bne	.L300
	ldr	r2, [r5, #68]
	str	r3, [r5, #72]
	cmp	r2, #2
	beq	.L302
	ldr	r3, [r6, #120]
	mov	r0, #10
	blx	r3
	mov	r4, #49
	b	.L303
.L315:
	ldr	r2, [r6, #120]
	blx	r2
	subs	r4, r4, #1
	beq	.L302
.L303:
	ldr	r2, [r5, #68]
	mov	r0, #10
	cmp	r2, #2
	bne	.L315
.L302:
	mov	r3, #0
	str	r3, [r5, #72]
.L300:
	ldr	r3, [r6]
	blx	r3
	ldr	r2, .L316+12
	movw	r1, #426
	cmp	r7, r0
	rsbls	r3, r7, r0
	mvnhi	r3, r7
	addhi	r3, r3, r0
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L313:
	movw	r3, #383
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L316+16
	bl	dprint_normal
	ldr	r2, [r4, #20]
	cmp	r2, #0
	bne	.L297
.L314:
	mov	r3, #388
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L316+16
	bl	dprint_normal
	b	.L298
.L317:
	.align	2
.L316:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC75
	.word	.LC69
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
	ldr	r2, .L319
	mov	r3, r0
	movw	r1, #5756
	mov	r0, #20
	bl	dprint_normal
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Resume
.L320:
	.align	2
.L319:
	.word	.LC74
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
	bhi	.L326
	ldr	ip, .L327
	rsb	r2, r0, r0, lsl #4
	ldr	r4, .L327+4
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
.L326:
	movw	r1, #565
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #32
	ldr	r3, .L327+8
	ldr	r2, .L327+12
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L328:
	.align	2
.L327:
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LANCHOR2+248
	.word	.LC76
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
	ldr	r3, .L331
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L332:
	.align	2
.L331:
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
	ldr	r3, .L334
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L335:
	.align	2
.L334:
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
	beq	.L344
	cmp	r0, #0
	beq	.L340
	cmp	r0, #1
	beq	.L341
	str	r0, [sp]
	movw	r1, #991
	ldr	r3, .L345
	mov	r0, #0
	ldr	r2, .L345+4
	bl	dprint_normal
	mvn	r0, #0
.L338:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L341:
	ldr	r3, .L345+8
	mov	r0, #0
	str	r1, [r3, #212]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L340:
	ldr	r3, .L345+8
	str	r1, [r3, #208]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L344:
	ldr	r2, .L345+12
	movw	r3, #978
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L345
	str	r2, [sp, #4]
	ldr	r2, .L345+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L338
.L346:
	.align	2
.L345:
	.word	.LANCHOR2+268
	.word	.LC78
	.word	.LANCHOR0
	.word	.LC77
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
	ldr	r4, .L348
	mov	r2, #48
	ldr	r3, .L348+4
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
.L349:
	.align	2
.L348:
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
	bhi	.L355
	ldr	r3, .L358
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L356
	cmp	r1, #0
	beq	.L357
	ldr	r3, .L358+4
	add	r0, r0, #26112
	add	r0, r0, #192
	mov	r2, #12
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L352:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L355:
	ldr	r2, .L358+8
	movw	r3, #1154
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L358+12
	str	r2, [sp, #4]
	ldr	r2, .L358+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L352
.L357:
	ldr	ip, .L358+20
	movw	r1, #1156
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L358+12
	str	ip, [sp, #4]
	ldr	r2, .L358+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L352
.L356:
	ldr	r2, .L358+24
	movw	r1, #1155
	ldr	r3, .L358+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L358+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L352
.L359:
	.align	2
.L358:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+288
	.word	.LC31
	.word	.LC79
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
	bhi	.L362
	ldr	r3, .L364
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	addne	r0, r0, #26112
	addne	r0, r0, #192
	ldmfd	sp, {fp, sp, pc}
.L362:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L365:
	.align	2
.L364:
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
	bhi	.L371
	ldr	r3, .L374
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L372
	cmp	r1, #0
	beq	.L373
	ldr	r3, .L374+4
	add	r0, r0, #26112
	add	r0, r0, #220
	mov	r2, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L368:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L371:
	ldr	r2, .L374+8
	movw	r3, #1176
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L374+12
	str	r2, [sp, #4]
	ldr	r2, .L374+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L368
.L373:
	ldr	ip, .L374+20
	movw	r1, #1178
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L374+12
	str	ip, [sp, #4]
	ldr	r2, .L374+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L368
.L372:
	ldr	r2, .L374+24
	movw	r1, #1177
	ldr	r3, .L374+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L374+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L368
.L375:
	.align	2
.L374:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+316
	.word	.LC31
	.word	.LC80
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
	ldrhi	r2, .L385
	movwhi	r3, #1195
	bhi	.L382
	ldr	r3, .L385+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L383
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L384
	add	r0, r0, #74752
	add	r0, r0, #848
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetSegStreamSize
.L384:
	ldr	r2, .L385+8
	movw	r3, #1197
.L382:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L385+12
	ldr	r2, .L385+16
	bl	dprint_normal
.L379:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L383:
	ldr	r2, .L385+20
	movw	r1, #1196
	ldr	r3, .L385+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L385+16
	bl	dprint_normal
	b	.L379
.L386:
	.align	2
.L385:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC81
	.word	.LANCHOR2+348
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
	ldrhi	ip, .L398
	bhi	.L394
	ldr	r3, .L398+4
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #48]
	cmp	r0, #0
	beq	.L396
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L397
	add	r4, r0, #26368
	sub	r1, fp, #28
	add	r4, r4, #56
	mov	r0, r4
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L395
	mov	r0, r4
	sub	r1, fp, #24
	bl	GetRawStreamSize
	cmp	r0, #0
	bne	.L395
	ldr	ip, [fp, #-24]
	movw	r1, #1218
	ldr	r3, [fp, #-28]
	mov	r0, #20
	ldr	r2, .L398+8
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L395
	ldr	r0, [fp, #-24]
	cmp	r0, #3
	movgt	r0, #0
	mvnle	r0, #0
.L389:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L397:
	ldr	ip, .L398+12
	movw	r1, #1211
.L394:
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L398+16
	str	ip, [sp, #4]
	ldr	r2, .L398+20
	bl	dprint_normal
.L395:
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L396:
	ldr	r2, .L398+24
	movw	r1, #1210
	ldr	r3, .L398+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L398+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L389
.L399:
	.align	2
.L398:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC83
	.word	.LC81
	.word	.LANCHOR2+368
	.word	.LC31
	.word	.LC82
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
	ldrhi	ip, .L408
	bhi	.L405
	ldr	r3, .L408+4
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #48]
	cmp	r0, #0
	beq	.L406
	ldr	r1, [r0, #16]
	cmp	r1, #1
	bne	.L407
	add	r0, r0, #74752
	sub	r2, fp, #16
	add	r0, r0, #848
	sub	r1, fp, #20
	bl	GetFreshSegStream
	ldr	ip, [fp, #-16]
	ldr	r3, [fp, #-20]
	movw	r1, #1241
	ldr	r2, .L408+8
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	ldr	r0, [fp, #-20]
	cmp	r0, #0
	movgt	r0, #0
	mvnle	r0, #0
.L402:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L407:
	ldr	ip, .L408+12
	movw	r1, #1236
.L405:
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L408+16
	str	ip, [sp, #4]
	ldr	r2, .L408+20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L406:
	ldr	r2, .L408+24
	movw	r1, #1235
	ldr	r3, .L408+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L408+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L402
.L409:
	.align	2
.L408:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC84
	.word	.LC81
	.word	.LANCHOR2+388
	.word	.LC31
	.word	.LC82
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
	bhi	.L416
	ldr	r3, .L419
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #48]
	cmp	r0, #0
	beq	.L417
	cmp	r1, #0
	beq	.L418
	ldr	r3, .L419+4
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
.L412:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L416:
	ldr	r2, .L419+8
	movw	r3, #1253
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L419+12
	str	r2, [sp, #4]
	ldr	r2, .L419+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L412
.L418:
	ldr	ip, .L419+20
	movw	r1, #1255
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L419+12
	str	ip, [sp, #4]
	ldr	r2, .L419+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L412
.L417:
	ldr	r2, .L419+24
	movw	r1, #1254
	ldr	r3, .L419+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L419+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L412
.L420:
	.align	2
.L419:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+408
	.word	.LC31
	.word	.LC85
	.word	.LC33
	UNWIND(.fnend)
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	2
	.global	VCTRL_USERDEC_PartitionMem
	.type	VCTRL_USERDEC_PartitionMem, %function
VCTRL_USERDEC_PartitionMem:
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
	UNWIND(.pad #40)
	sub	sp, sp, #40
	ldr	r3, .L425
	mov	r6, r1
	mov	r1, #0
	mov	r4, r1
	mov	r5, r2
	mov	r7, r0
	ldr	r3, [r3, #48]
	mov	r2, #36
	sub	r0, fp, #64
	blx	r3
	sub	r1, fp, #64
	mov	r0, r7
	mov	r2, r4
	mov	r3, #1
	str	r5, [fp, #-52]
	mov	lr, #20
	mov	ip, #8
	strb	r3, [fp, #-60]
	mov	r3, #6
	str	r6, [fp, #-56]
	str	r4, [fp, #-36]
	str	lr, [fp, #-64]
	strb	ip, [fp, #-59]
	str	r3, [fp, #-40]
	bl	FSP_ArrangeFsPool
	mov	r5, r0
	cmn	r5, #1
	mov	r0, r4
	beq	.L424
.L422:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L424:
	ldr	r3, .L425+4
	movw	r1, #1350
	ldr	r2, .L425+8
	bl	dprint_normal
	mov	r0, r5
	b	.L422
.L426:
	.align	2
.L425:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+436
	.word	.LC86
	UNWIND(.fnend)
	.size	VCTRL_USERDEC_PartitionMem, .-VCTRL_USERDEC_PartitionMem
	.align	2
	.global	VCTRL_USERDEC_GetFrameBuffer
	.type	VCTRL_USERDEC_GetFrameBuffer, %function
VCTRL_USERDEC_GetFrameBuffer:
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
	mov	r5, r1
	ldrhi	r2, .L443
	movwhi	r3, #1362
	bhi	.L439
	ldr	r3, .L443+4
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L440
	ldr	r3, [r3, #128]
	cmp	r3, #20
	bne	.L441
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	mvnne	r0, #0
	bne	.L429
	mov	r1, #0
	mov	r0, r4
	bl	FSP_NewLogicFs
	subs	r6, r0, #0
	blt	.L442
	mov	r0, r4
	mov	r1, r6
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L433
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L433
	ldr	r2, [r3, #484]
	mov	r0, #0
	str	r2, [r5, #24]
	ldr	r2, [r3, #184]
	str	r2, [r5, #20]
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #40]
	str	r3, [r5, #16]
.L429:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L441:
	ldr	r2, .L443+8
	movw	r3, #1364
.L439:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L443+12
	ldr	r2, .L443+16
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L442:
	ldr	r3, .L443+12
	movw	r1, #1375
	ldr	r2, .L443+20
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L429
.L433:
	str	r6, [sp]
	movw	r1, #1383
	ldr	r3, .L443+12
	mov	r0, #0
	ldr	r2, .L443+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L429
.L440:
	ldr	r2, .L443+28
	movw	r1, #1363
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L443+12
	str	r2, [sp, #4]
	ldr	r2, .L443+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L429
.L444:
	.align	2
.L443:
	.word	.LC87
	.word	.LANCHOR0
	.word	.LC89
	.word	.LANCHOR2+464
	.word	.LC31
	.word	.LC90
	.word	.LC91
	.word	.LC88
	UNWIND(.fnend)
	.size	VCTRL_USERDEC_GetFrameBuffer, .-VCTRL_USERDEC_GetFrameBuffer
	.align	2
	.global	VCTRL_USERDEC_PutFrameBuffer
	.type	VCTRL_USERDEC_PutFrameBuffer, %function
VCTRL_USERDEC_PutFrameBuffer:
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
	cmp	r0, #3
	mov	r7, r0
	ldrhi	r2, .L457
	movwhi	r3, #1400
	bhi	.L453
	ldr	r6, .L457+4
	add	r6, r6, r0, lsl #2
	ldr	r0, [r6, #48]
	cmp	r0, #0
	beq	.L454
	ldr	r3, [r0, #128]
	cmp	r3, #20
	str	r3, [fp, #-48]
	bne	.L455
	ldr	r10, .L457+8
	add	r0, r0, #206848
	mov	r2, #56
	add	r0, r0, #568
	ldr	r3, [r10, #52]
	blx	r3
	ldr	r5, [r6, #48]
	mov	r1, #0
	mov	r0, r7
	add	r5, r5, #204800
	ldr	r2, [r5, #2640]
	bl	FSP_GetLogicFs_By_DecAddr
	subs	r4, r0, #0
	beq	.L456
	ldr	r3, [r5, #2620]
	ldr	r1, [r4, #4]
	cmp	r3, #1
	mov	lr, r3
	beq	.L451
	mov	r0, r7
	bl	FSP_ClearLogicFs
	mov	r0, #0
.L447:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L451:
	add	r3, r5, #2624
	str	r1, [r4, #128]
	add	r2, r4, #256
	add	ip, r4, #272
	ldrd	r0, [r3, #40]
	strd	r0, [r4, #240]
	mov	r1, #0
	ldrd	r8, [r3, #40]
	add	r0, r4, #196
	strd	r8, [r4, #248]
	ldrd	r8, [r3, #40]
	strd	r8, [r2]
	mov	r8, lr
	ldrd	r2, [r3, #40]
	strd	r2, [ip, #-8]
	mov	r2, #4
	str	r1, [r4, #44]
	str	r1, [r4, #48]
	str	r1, [r4, #52]
	str	r1, [r4, #60]
	str	lr, [r4, #40]
	ldr	r3, [r5, #2624]
	str	r3, [r4, #72]
	ldr	r3, [r5, #2628]
	str	r3, [r4, #76]
	ldr	ip, [r5, #2624]
	str	ip, [r4, #80]
	mov	ip, ip, lsr #1
	ldr	r3, [r5, #2628]
	str	r1, [r4, #104]
	str	r1, [r4, #136]
	str	r3, [r4, #84]
	mov	r3, r3, lsr #1
	ldr	lr, [r5, #2644]
	str	lr, [r4, #464]
	ldr	lr, [r5, #2656]
	str	r3, [r4, #92]
	add	r3, r4, #40
	str	ip, [r4, #88]
	str	lr, [r4, #468]
	ldr	ip, [r5, #2640]
	str	r3, [fp, #-52]
	str	ip, [r4, #484]
	ldr	ip, [r5, #2648]
	ldr	r10, [r10, #48]
	str	ip, [r4, #492]
	blx	r10
	ldrb	r0, [r4, #197]	@ zero_extendqisi2
	ldrb	ip, [r4, #196]	@ zero_extendqisi2
	mov	r2, r8
	and	r0, r0, #252
	ldr	r1, [r4, #4]
	orr	r0, r0, #12
	and	ip, ip, #224
	bfi	r0, r8, #4, #2
	bfi	ip, r8, #5, #3
	strb	r0, [r4, #197]
	mov	r0, r7
	strb	ip, [r4, #196]
	ldr	ip, [r5, #2636]
	str	ip, [r4, #184]
	ldr	ip, [r5, #2616]
	str	ip, [r4, #560]
	bl	FSP_SetDisplay
	ldr	r2, [r6, #48]
	ldr	r3, [fp, #-52]
	mov	r0, r7
	add	r2, r2, #207872
	ldr	r1, [fp, #-48]
	str	r3, [sp]
	add	r3, r2, #496
	add	r2, r2, #488
	bl	InsertImgToVoQueue
	cmp	r0, #1
	moveq	r0, #0
	beq	.L447
	mov	r2, #0
	ldr	r1, [r4, #4]
	mov	r0, r7
	mov	r8, #0
	bl	FSP_SetDisplay
	ldr	r1, [r4, #208]
	mov	r0, r7
	mov	r9, #0
	bl	FreeUsdByDec
	mov	r0, r7
	strd	r8, [r4, #208]
	ldr	r1, [r4, #216]
	bl	FreeUsdByDec
	strd	r8, [r4, #216]
	mvn	r0, #0
	b	.L447
.L455:
	ldr	r2, .L457+12
	movw	r3, #1402
.L453:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L457+16
	ldr	r2, .L457+20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L454:
	ldr	r2, .L457+24
	movw	r1, #1401
	ldr	r3, .L457+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L457+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L447
.L456:
	ldr	ip, [r5, #2640]
	movw	r1, #1412
	ldr	r3, .L457+16
	mov	r0, #1
	ldr	r2, .L457+28
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L447
.L458:
	.align	2
.L457:
	.word	.LC87
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC89
	.word	.LANCHOR2+496
	.word	.LC31
	.word	.LC88
	.word	.LC92
	UNWIND(.fnend)
	.size	VCTRL_USERDEC_PutFrameBuffer, .-VCTRL_USERDEC_PutFrameBuffer
	.align	2
	.global	VCTRL_USERDEC_RecycleFrameBuffer
	.type	VCTRL_USERDEC_RecycleFrameBuffer, %function
VCTRL_USERDEC_RecycleFrameBuffer:
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
	subs	r4, r0, #0
	mov	r5, r1
	beq	.L461
	mov	r2, #0
	ldr	r0, [r4, #360]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #360]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L462
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #360]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #360]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L462:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L461:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_USERDEC_RecycleFrameBuffer, .-VCTRL_USERDEC_RecycleFrameBuffer
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
	beq	.L482
	ldr	r4, [r5, #12]
	cmp	r4, #0
	beq	.L483
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L484
.L468:
	ldr	r4, [r5, #16]
	cmp	r4, #0
	beq	.L485
.L469:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L486
.L470:
	ldr	r4, [r5, #20]
	cmp	r4, #0
	beq	.L487
.L471:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #8]
	cmp	r3, #1
	beq	.L488
.L472:
	ldr	r3, .L489
	ldr	r0, [r4, #4]
	ldr	r3, [r3, #164]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L488:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L472
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L486:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L470
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r4, [r5, #20]
	cmp	r4, #0
	bne	.L471
.L487:
	ldr	r3, .L489+4
	movw	r1, #1566
	ldr	r2, .L489+8
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L484:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L468
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r4, [r5, #16]
	cmp	r4, #0
	bne	.L469
.L485:
	mov	r0, r4
	ldr	r3, .L489+12
	ldr	r2, .L489+16
	movw	r1, #1544
	bl	dprint_normal
	b	.L470
.L483:
	mov	r0, r4
	ldr	r3, .L489+20
	ldr	r2, .L489+24
	movw	r1, #1522
	bl	dprint_normal
	b	.L468
.L482:
	mov	r0, r5
	ldr	r3, .L489+28
	ldr	r2, .L489+32
	movw	r1, #1588
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L490:
	.align	2
.L489:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+600
	.word	.LC96
	.word	.LANCHOR2+576
	.word	.LC95
	.word	.LANCHOR2+552
	.word	.LC94
	.word	.LANCHOR2+528
	.word	.LC93
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
	cmp	r0, #25
	movweq	r3, #35488
	movwne	r3, #38320
	movteq	r3, 176
	movtne	r3, 7
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
	mov	r3, #32768
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
	bhi	.L500
	ldr	r3, .L503
	add	r3, r3, r0, lsl #2
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L501
	cmp	r2, #0
	beq	.L502
	ldr	r3, .L503+4
	add	r1, r1, #206848
	mov	r0, r2
	add	r1, r1, #408
	mov	r2, #156
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L497:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L500:
	ldr	r2, .L503+8
	movw	r3, #2387
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L503+12
	str	r2, [sp, #4]
	ldr	r2, .L503+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L497
.L502:
	ldr	ip, .L503+20
	movw	r1, #2389
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L503+12
	str	ip, [sp, #4]
	ldr	r2, .L503+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L497
.L501:
	ldr	r2, .L503+24
	movw	r3, #2388
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L503+12
	str	r2, [sp, #4]
	ldr	r2, .L503+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L497
.L504:
	.align	2
.L503:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR2+624
	.word	.LC31
	.word	.LC97
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
	ldr	r3, .L519
	ldr	r2, [r1, #8]
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2464]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2484]
	ldr	r2, [r1, #28]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2480]
	ldr	r2, [r1, #24]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2488]
	ldr	r2, [r1, #32]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2492]
	ldr	r2, [r1, #36]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2496]
	ldr	r2, [r1, #40]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2512]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2596]
	ldr	r2, [r1, #140]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2524]
	ldr	r2, [r1, #68]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2520]
	ldr	r2, [r1, #64]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2516]
	ldr	r2, [r1, #60]
	cmp	r0, r2
	bne	.L518
	ldr	r0, [r3, #2528]
	ldr	r2, [r1, #72]
	cmp	r0, r2
	bne	.L518
	ldr	r3, [r3, #2588]
	ldr	r0, [r1, #132]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L518:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L520:
	.align	2
.L519:
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
	ldr	r3, .L528
	mov	r5, r1
	add	r3, r3, r0, lsl #2
	ldr	r4, [r3, #48]
	ldr	r3, [r4, #128]
	cmp	r3, #22
	beq	.L526
	bl	VCTRL_CheckCommonParameter
	cmp	r0, #0
	bne	.L526
	add	r4, r4, #204800
	ldr	r3, [r4, #2464]
	cmp	r3, #1
	beq	.L527
	sub	r3, r3, #10
	cmp	r3, #2
	ldmhifd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #2468]
	ldr	r0, [r5, #12]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L527:
	ldr	r2, [r4, #2468]
	ldr	r3, [r5, #12]
	cmp	r2, r3
	bne	.L526
	ldr	r3, [r4, #2472]
	ldr	r0, [r5, #16]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L526:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L529:
	.align	2
.L528:
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
	ldr	r3, .L531
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
.L532:
	.align	2
.L531:
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
	ble	.L534
	ldr	r2, [r1, #108]
	cmp	r2, #0
	ble	.L534
	ldr	r2, .L536
	add	r0, r2, r0, lsl #2
	ldr	r2, [r0, #48]
	add	r2, r2, #204800
	str	r3, [r2, #2560]
	ldr	r3, [r1, #108]
	str	r3, [r2, #2564]
	ldmfd	sp, {fp, sp, pc}
.L534:
	ldr	r3, .L536
	mov	r1, #1920
	mov	r2, #1088
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	str	r1, [r3, #2560]
	str	r2, [r3, #2564]
	ldmfd	sp, {fp, sp, pc}
.L537:
	.align	2
.L536:
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
	bhi	.L543
	ldr	r3, .L545
	add	r3, r3, r0, lsl #2
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L544
	add	r1, r1, #128
	mov	r0, #3
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L542
	mov	r1, r5
	mov	r0, r4
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L540:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L542:
	mvn	r0, #0
	b	.L540
.L543:
	ldr	r2, .L545+4
	movw	r3, #2758
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L545+8
	str	r2, [sp, #4]
	ldr	r2, .L545+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L540
.L544:
	ldr	r2, .L545+16
	movw	r3, #2759
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L545+8
	str	r2, [sp, #4]
	ldr	r2, .L545+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L540
.L546:
	.align	2
.L545:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+644
	.word	.LC31
	.word	.LC98
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
	cmp	r0, #3
	bhi	.L551
	ldr	r3, .L553
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L552
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L549:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L551:
	ldr	r2, .L553+4
	movw	r3, #2895
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L553+8
	str	r2, [sp, #4]
	ldr	r2, .L553+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L549
.L552:
	ldr	r2, .L553+16
	mov	r1, #2896
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L553+8
	str	r2, [sp, #4]
	ldr	r2, .L553+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L549
.L554:
	.align	2
.L553:
	.word	.LANCHOR0
	.word	.LC99
	.word	.LANCHOR2+660
	.word	.LC31
	.word	.LC100
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
	bhi	.L558
	ldr	r3, .L559
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L558
	ldrd	r0, [r3, #8]
	ldmfd	sp, {fp, sp, pc}
.L558:
	mvn	r0, #0
	mvn	r1, #0
	ldmfd	sp, {fp, sp, pc}
.L560:
	.align	2
.L559:
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
	mov	r4, r1
	ldrhi	r2, .L592
	movwhi	r3, #3154
	bhi	.L583
	ldr	r8, .L592+4
	mov	r7, r0, asl #2
	add	r9, r8, r7
	ldr	r0, [r9, #48]
	cmp	r0, #0
	ldreq	r2, .L592+8
	movweq	r1, #3155
	beq	.L584
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L586
	cmp	r4, #0
	beq	.L587
	ldr	r6, .L592+12
	mov	r0, #4
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r0, [r9, #48]
	cmp	r0, #0
	beq	.L567
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L567
	add	r0, r0, #207872
	mov	r1, r4
	add	r0, r0, #480
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r9, r0
	beq	.L588
	mov	r0, #9
	mvn	r10, #0
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L575
.L573:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
.L582:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L588:
	ldr	r3, [r4, #116]
	mvn	r2, #0
	str	r2, [r4, #92]
	cmp	r3, #1
	beq	.L589
	mov	r0, #9
	bl	CHECK_REC_POS_ENABLE
	subs	r10, r0, #0
	beq	.L576
	mov	r10, #0
.L575:
	ldr	r3, [r6]
	blx	r3
	add	r1, r8, r7
	ldr	r2, .L592+16
	ldr	r3, [r1, #360]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bhi	.L590
.L572:
	cmp	r9, #1
	bne	.L573
.L576:
	add	r7, r8, r7
	mov	r3, #100
	mla	r5, r3, r5, r8
	ldr	r2, [r7, #48]
	ldr	r1, [r4, #156]
	add	r3, r2, #24576
	add	r5, r5, #408
	str	r1, [r3, #1764]
	ldr	r3, [r4, #152]
	str	r3, [r2, #136]
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L591
.L574:
	ldr	r2, [r4, #444]
	movw	r3, #3211
	ldr	lr, [r4, #88]
	mov	r1, r3
	ldr	ip, [r4, #276]
	mov	r0, #26
	str	r3, [sp]
	ldr	r3, .L592+20
	stmib	sp, {r2, ip, lr}
	ldr	r2, .L592+24
	bl	dprint_normal
	b	.L573
.L590:
	mov	r2, r5, asl #24
	str	r0, [r1, #360]
	add	r2, r2, #589824
	movw	r1, #3197
	cmp	r9, #1
	addeq	r2, r2, #1
	ldr	r0, .L592+28
	bl	DBG_AddTrace
	b	.L572
.L591:
	ldr	r3, [r6]
	blx	r3
	str	r0, [r5, #4]
	b	.L574
.L567:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	mvn	r10, #0
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L586:
	ldr	r2, .L592+32
	movw	r3, #3156
.L583:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L592+20
	mvn	r10, #0
	ldr	r2, .L592+36
	bl	dprint_normal
	b	.L582
.L589:
	mov	r1, r4
	mov	r0, r5
	bl	VCTRL_GetChanView1Image
	mov	r9, r0
	mov	r0, #9
	bl	CHECK_REC_POS_ENABLE
	subs	r10, r9, #1
	mvnne	r10, #0
	cmp	r0, #0
	beq	.L572
	b	.L575
.L587:
	ldr	r2, .L592+40
	movw	r1, #3157
	mov	r0, r4
.L584:
	str	r2, [sp, #4]
	mvn	r10, #0
	str	r1, [sp]
	ldr	r3, .L592+20
	ldr	r2, .L592+36
	bl	dprint_normal
	b	.L582
.L593:
	.align	2
.L592:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TraceImgPeriod
	.word	.LANCHOR2+680
	.word	.LC102
	.word	.LANCHOR2+700
	.word	.LC88
	.word	.LC31
	.word	.LC101
	UNWIND(.fnend)
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	2
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 544
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #564)
	sub	sp, sp, #564
	cmp	r0, #3
	mov	r6, r0
	mov	r4, r1
	ldrhi	r2, .L622
	movwhi	r3, #3225
	bhi	.L614
	ldr	r9, .L622+4
	mov	r10, r0, asl #2
	add	r7, r9, r10
	ldr	r0, [r7, #48]
	cmp	r0, #0
	ldreq	r2, .L622+8
	movweq	r1, #3226
	beq	.L615
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L616
	cmp	r4, #0
	beq	.L617
	ldr	r8, .L622+12
	mov	r0, #4
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r5, [r7, #48]
	cmp	r5, #0
	beq	.L618
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L619
	add	r0, r5, #207872
	mov	r1, r4
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r4, #92]
	cmn	r3, #1
	mov	r5, r0
	beq	.L602
	ldr	r2, [r4, #456]
	cmp	r2, #0
	bne	.L620
.L602:
	mov	r0, #10
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L621
.L604:
	cmp	r5, #1
	beq	.L606
	ldr	r2, [r4, #444]
	movw	r3, #3282
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #26
	ldr	r3, .L622+16
	str	r2, [sp, #4]
	ldr	r2, .L622+20
	bl	dprint_normal
	mov	r1, r4
	mov	r0, r6
	bl	FSP_UnMarkImageOutHanging
.L607:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	subs	r0, r5, #1
	mvnne	r0, #0
.L596:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L621:
	ldr	r3, [r8]
	add	r9, r9, r10
	blx	r3
	ldr	r2, .L622+24
	ldr	r3, [r9, #776]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L604
	mov	r2, r6, asl #24
	str	r0, [r9, #776]
	add	r2, r2, #655360
	movw	r1, #3275
	cmp	r5, #1
	addeq	r2, r2, #1
	ldr	r0, .L622+28
	bl	DBG_AddTrace
	b	.L604
.L606:
	ldr	r2, [r4, #444]
	movw	r3, #3287
	ldr	ip, [r4, #88]
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #26
	ldr	r3, .L622+16
	stmib	sp, {r2, ip}
	ldr	r2, .L622+32
	bl	dprint_normal
	b	.L607
.L620:
	mov	r2, #536
	mov	r1, #0
	sub	r0, fp, #580
	str	r3, [fp, #-584]
	bl	memset
	ldr	r0, [r7, #48]
	ldr	r3, [fp, #-584]
	sub	r1, fp, #580
	add	r0, r0, #207872
	add	r0, r0, #480
	str	r3, [fp, #-492]
	bl	SYNTAX_ReleaseImage
	mov	r5, r0
	b	.L602
.L619:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	movw	r3, #3243
	mov	r1, r3
	ldr	r2, .L622+36
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L596
.L616:
	ldr	r2, .L622+40
	movw	r3, #3227
.L614:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L622+16
	ldr	r2, .L622+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L596
.L617:
	ldr	r2, .L622+48
	movw	r1, #3228
	mov	r0, r4
.L615:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L622+16
	ldr	r2, .L622+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L596
.L618:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	movw	r3, #3235
	mov	r0, r5
	mov	r1, r3
	ldr	r2, .L622+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L596
.L623:
	.align	2
.L622:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+720
	.word	.LC105
	.word	g_TraceImgPeriod
	.word	.LANCHOR2+744
	.word	.LC106
	.word	.LC104
	.word	.LC88
	.word	.LC31
	.word	.LC101
	.word	.LC103
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
	bhi	.L625
	ldr	r3, .L629
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L625
	ldr	r2, [r3, #16]
	cmp	r2, #1
	beq	.L628
	movw	r3, #3307
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L629+4
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #22
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L625:
	movw	r3, #3301
	ldr	r2, .L629+8
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #22
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L628:
	ldr	r0, [r3, #128]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L630:
	.align	2
.L629:
	.word	.LANCHOR0
	.word	.LC108
	.word	.LC107
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
	bhi	.L636
	ldr	r3, .L639
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L637
	cmp	r1, #0
	beq	.L638
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
.L631:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L636:
	ldr	r2, .L639+4
	movw	r3, #3316
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L639+8
	str	r2, [sp, #4]
	ldr	r2, .L639+12
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L637:
	ldr	r2, .L639+16
	movw	r1, #3317
	ldr	r3, .L639+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L639+12
	bl	dprint_normal
	b	.L631
.L638:
	ldr	r2, .L639+20
	movw	r3, #3318
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L639+8
	str	r2, [sp, #4]
	ldr	r2, .L639+12
	bl	dprint_normal
	b	.L631
.L640:
	.align	2
.L639:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+768
	.word	.LC31
	.word	.LC33
	.word	.LC109
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
	bhi	.L661
	ldr	r3, .L665
	add	r0, r3, r0, lsl #2
	ldr	r5, [r0, #48]
	cmp	r5, #0
	moveq	r3, r5
	beq	.L642
	ldr	r3, [r5, #16]
	cmp	r3, #1
	beq	.L664
.L661:
	mov	r3, #0
.L642:
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L664:
	ldr	r3, [r5, #20]
	cmp	r3, #1
	bne	.L661
	ldr	r3, [r5, #128]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L643
.L645:
	.word	.L644
	.word	.L651
	.word	.L649
	.word	.L648
	.word	.L649
	.word	.L643
	.word	.L650
	.word	.L643
	.word	.L643
	.word	.L643
	.word	.L651
	.word	.L651
	.word	.L651
	.word	.L651
	.word	.L649
	.word	.L653
	.word	.L654
	.word	.L643
	.word	.L643
	.word	.L643
	.word	.L661
.L651:
	add	r3, r5, #204800
	ldr	r4, [r3, #3564]
.L655:
	cmp	r4, #0
	beq	.L661
	ldr	r3, .L665+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r5, #40]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L649:
	add	r3, r5, #208896
	ldr	r4, [r3, #500]
	b	.L655
.L650:
	add	r3, r5, #204800
	ldr	r4, [r3, #3576]
	b	.L655
.L648:
	add	r3, r5, #204800
	ldr	r4, [r3, #3592]
	b	.L655
.L654:
	add	r3, r5, #208896
	ldr	r4, [r3, #1884]
	b	.L655
.L644:
	add	r3, r5, #204800
	ldr	r4, [r3, #3920]
	b	.L655
.L653:
	add	r3, r5, #204800
	ldr	r4, [r3, #3788]
	b	.L655
.L643:
	str	r3, [sp]
	movw	r1, #3461
	ldr	r3, .L665+8
	mov	r0, #0
	ldr	r2, .L665+12
	bl	dprint_normal
	mov	r3, #0
	b	.L642
.L666:
	.align	2
.L665:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+792
	.word	.LC110
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
	beq	.L675
	cmp	r0, #0
	beq	.L670
	cmp	r0, #16
	bne	.L676
	add	r0, r4, #4096
	ldrb	r0, [r0, #828]	@ zero_extendqisi2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L676:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L670:
	ldrb	r0, [r4, #936]	@ zero_extendqisi2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L675:
	ldr	r2, .L677
	movw	r1, #3480
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L678:
	.align	2
.L677:
	.word	.LC111
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
	bhi	.L680
	ldr	r4, .L691
	add	r4, r4, r0, lsl #2
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L680
	ldr	r1, [r3, #16]
	cmp	r1, #1
	bne	.L683
	ldr	r6, [r3, #20]
	cmp	r6, #1
	beq	.L684
.L683:
	mov	r3, r2
	movw	r1, #3519
	ldr	r2, .L691+4
	mov	r0, #20
	bl	dprint_normal
	mov	r5, #0
.L682:
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L680:
	movw	r3, #3513
	str	r2, [sp]
	mov	r1, r3
	ldr	r2, .L691+8
	mov	r0, #20
	mov	r5, #0
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L684:
	bl	VCTRL_GetDecParam
	subs	r7, r0, #0
	beq	.L689
	ldr	r2, [r4, #48]
	mov	r3, #0
	mov	r5, r3
	str	r3, [r2, #108]
	str	r3, [r2, #112]
	b	.L682
.L689:
	ldr	r8, [r4, #48]
	ldr	r3, .L691+12
	ldr	r5, [r8, #108]
	cmp	r5, #0
	beq	.L690
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r4, #48]
	ldr	r2, [r3, #112]
	cmp	r0, r2
	bls	.L687
	rsb	r0, r2, r0
	cmp	r0, #40
	movls	r5, r7
	bls	.L682
.L687:
	str	r7, [r3, #108]
	mov	r5, r6
	str	r7, [r3, #112]
	b	.L682
.L690:
	str	r6, [r8, #108]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r8, #112]
	b	.L682
.L692:
	.align	2
.L691:
	.word	.LANCHOR0
	.word	.LC113
	.word	.LC112
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
	bhi	.L709
	ldr	r3, .L711
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L710
	ldr	r3, [r0, #128]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L697
.L699:
	.word	.L698
	.word	.L700
	.word	.L703
	.word	.L702
	.word	.L703
	.word	.L697
	.word	.L704
	.word	.L697
	.word	.L697
	.word	.L697
	.word	.L700
	.word	.L700
	.word	.L700
	.word	.L700
	.word	.L703
	.word	.L707
	.word	.L708
.L700:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3564]
.L693:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L709:
	ldr	r2, .L711+4
	movw	r3, #3887
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L711+8
	str	r2, [sp, #4]
	ldr	r2, .L711+12
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L703:
	add	r0, r0, #208896
	mov	r3, #0
	str	r3, [r0, #500]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L707:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3788]
	b	.L693
.L708:
	add	r0, r0, #208896
	mov	r3, #0
	str	r3, [r0, #1884]
	b	.L693
.L702:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3592]
	b	.L693
.L704:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3576]
	b	.L693
.L698:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3920]
	b	.L693
.L697:
	str	r3, [sp]
	movw	r1, #3989
	ldr	r3, .L711+8
	mov	r0, #1
	ldr	r2, .L711+16
	bl	dprint_normal
	b	.L693
.L710:
	ldr	r2, .L711+20
	mov	r1, #3888
	ldr	r3, .L711+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L711+12
	bl	dprint_normal
	b	.L693
.L712:
	.align	2
.L711:
	.word	.LANCHOR0
	.word	.LC87
	.word	.LANCHOR2+812
	.word	.LC31
	.word	.LC114
	.word	.LC100
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
	ldrhi	r2, .L725
	movwhi	r3, #4014
	bhi	.L723
	ldr	r3, .L725+4
	add	r4, r3, r0, lsl #2
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L724
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L717
	ldr	r2, .L725+8
	mov	r3, #4016
.L723:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L725+12
	ldr	r2, .L725+16
	bl	dprint_normal
.L713:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L717:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L713
	ldr	r0, [r4, #48]
	ldr	r3, [r0, #128]
	cmp	r3, #0
	beq	.L718
	cmp	r3, #16
	bne	.L713
	add	r0, r0, #207872
	mov	r1, r5
	add	r0, r0, #488
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVCDEC_VDMProcSedOnly
.L718:
	add	r0, r0, #207872
	mov	r1, r5
	add	r0, r0, #488
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	H264DEC_VDMProcSedOnly
.L724:
	ldr	r2, .L725+20
	movw	r1, #4015
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L725+12
	str	r2, [sp, #4]
	ldr	r2, .L725+16
	bl	dprint_normal
	b	.L713
.L726:
	.align	2
.L725:
	.word	.LC87
	.word	.LANCHOR0
	.word	.LC115
	.word	.LANCHOR2+832
	.word	.LC31
	.word	.LC88
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
	ldrhi	r2, .L748
	movwhi	r3, #4051
	bhi	.L745
	ldr	r3, .L748+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L746
	ldr	r3, [r0, #20]
	cmp	r3, #1
	bne	.L747
	ldr	r3, [r0, #128]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L732
.L734:
	.word	.L733
	.word	.L735
	.word	.L736
	.word	.L737
	.word	.L738
	.word	.L732
	.word	.L739
	.word	.L732
	.word	.L732
	.word	.L732
	.word	.L740
	.word	.L740
	.word	.L740
	.word	.L741
	.word	.L738
	.word	.L742
	.word	.L743
	.word	.L732
	.word	.L732
	.word	.L732
	.word	.L744
.L744:
	mov	r0, #0
.L729:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L733:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L735:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_GetImageBuffer
.L736:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L737:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L738:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H263DEC_GetImageBuffer
.L739:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_GetImageBuffer
.L740:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_GetImageBuffer
.L741:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_GetImageBuffer
.L742:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_GetImageBuffer
.L743:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L732:
	str	r3, [sp]
	mov	r1, #4160
	ldr	r3, .L748+8
	mov	r0, #0
	ldr	r2, .L748+12
	bl	dprint_normal
	mov	r0, #0
	b	.L729
.L747:
	ldr	r2, .L748+16
	movw	r3, #4053
.L745:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L748+8
	ldr	r2, .L748+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L729
.L746:
	ldr	r2, .L748+24
	movw	r1, #4052
	ldr	r3, .L748+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L748+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L729
.L749:
	.align	2
.L748:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LANCHOR2+856
	.word	.LC116
	.word	.LC115
	.word	.LC31
	.word	.LC98
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
	ldrhi	r2, .L760
	movwhi	r3, #4169
	bhi	.L756
	ldr	r3, .L760+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	movweq	r1, #4170
	ldreq	r2, .L760+8
	streq	r1, [sp]
	beq	.L757
	ldr	r2, [r0, #16]
	cmp	r2, #1
	bne	.L758
	cmp	r1, #0
	beq	.L759
	ldr	r2, [r1]
	add	r3, r0, #204800
	mov	r0, #0
	str	r2, [r3, #3264]
.L752:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L758:
	ldr	r2, .L760+12
	movw	r3, #4171
.L756:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L760+16
	ldr	r2, .L760+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L752
.L759:
	ldr	r2, .L760+24
	movw	r3, #4172
	mov	r0, r1
	mov	r1, r3
	str	r3, [sp]
.L757:
	str	r2, [sp, #4]
	ldr	r3, .L760+16
	ldr	r2, .L760+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L752
.L761:
	.align	2
.L760:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC98
	.word	.LC117
	.word	.LANCHOR2+880
	.word	.LC31
	.word	.LC118
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
	ldrhi	r2, .L772
	bhi	.L768
	ldr	r3, .L772+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L769
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L770
	cmp	r2, #0
	beq	.L771
	ldr	r3, .L772+8
	add	r0, r0, #207872
	add	r0, r0, #228
	mov	r2, #24
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L764:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L770:
	ldr	r2, .L772+12
	movw	r3, #4183
.L768:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L772+16
	ldr	r2, .L772+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L764
.L771:
	ldr	ip, .L772+24
	movw	r1, #4184
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L772+16
	str	ip, [sp, #4]
	ldr	r2, .L772+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L764
.L769:
	ldr	r2, .L772+28
	movw	r1, #4182
	ldr	r3, .L772+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L772+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L764
.L773:
	.align	2
.L772:
	.word	.LC40
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC117
	.word	.LANCHOR2+904
	.word	.LC31
	.word	.LC118
	.word	.LC98
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
	bhi	.L781
	ldr	r3, .L782
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L780
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L780
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L780
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L780
	ldr	r0, [r3, #128]
	cmp	r0, #22
	movne	r0, #0
	mvneq	r0, #0
.L776:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L780:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L781:
	ldr	r2, .L782+4
	movw	r3, #4193
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L782+8
	str	r2, [sp, #4]
	ldr	r2, .L782+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L776
.L783:
	.align	2
.L782:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+924
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
	ldr	r8, .L792
	mov	r3, #0
	mov	r6, r0
	mov	r7, r1
	mov	r4, r3
	str	r3, [r0]
	str	r3, [r1]
.L789:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	beq	.L791
.L786:
	add	r4, r4, #1
	cmp	r4, #4
	bne	.L789
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L791:
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
	b	.L786
.L793:
	.align	2
.L792:
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
	blt	.L795
	ldr	r3, [r0, #44]
	cmp	r3, #262144
	blt	.L795
	ldr	r3, [r0, #36]
	cmp	r3, #1
	beq	.L799
.L798:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L799:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L795
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bgt	.L798
.L795:
	ldr	r3, .L800
	movw	r1, #4217
	ldr	r2, .L800+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L801:
	.align	2
.L800:
	.word	.LANCHOR2+944
	.word	.LC119
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
	ldr	r3, [r1, #44]
	cmp	r0, #25
	movw	lr, #38320
	movw	ip, #35488
	add	r3, r3, #1024
	movt	lr, 7
	add	r3, r3, #15
	movt	ip, 176
	bic	r3, r3, #1020
	movne	ip, lr
	bic	r3, r3, #3
	str	ip, [r2, #8]
	add	r3, r3, #32768
	str	r3, [r2, #4]
	ldr	r3, [r1, #36]
	cmp	r3, #0
	movweq	r3, #42580
	movteq	r3, 9
	beq	.L804
	ldr	r6, [r1, #12]
	mov	r3, #4000
	ldr	r7, [r1, #20]
	mov	lr, #2208
	cmp	r6, #0
	ldr	r4, [r1, #24]
	movwgt	r5, #4060
	movwle	r5, #27872
	mul	r3, r3, r7
	movtle	r5, 8
	mulgt	r5, r5, r6
	movle	r6, #136
	mla	ip, lr, r4, r3
	str	r6, [r1, #12]
	add	r3, ip, r5
	cmp	r3, #0
	movcc	r3, #0
	cmp	r0, #25
	beq	.L806
	movw	r1, #42580
	ldr	ip, [r2, #8]
	movt	r1, 9
	cmp	r3, r1
	movcc	r3, r1
.L804:
	add	ip, ip, r3
	mov	r0, #0
	str	ip, [r2, #8]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L806:
	movw	r0, #3992
	mov	r1, #2240
	mul	r7, r0, r7
	movw	r0, #42580
	mla	r1, r1, r4, r7
	movt	r0, 9
	ldr	ip, [r2, #8]
	add	r1, r1, r5
	cmp	r1, r0
	movcc	r1, r0
	cmp	r1, r3
	movcs	r3, r1
	b	.L804
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
	ldreq	r2, .L823
	moveq	r0, r4
	beq	.L820
	cmp	r5, #0
	beq	.L821
	cmp	r3, #2
	beq	.L814
	ldr	r2, .L823+4
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
	bmi	.L822
.L814:
	mov	r0, r4
	bl	VCTRL_VarifyOption
	cmp	r0, #0
	bne	.L812
	mov	r2, r5
	mov	r1, r4
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_GetMemSize_onDecode
.L821:
	ldr	r2, .L823+8
	movw	r1, #4282
	mov	r0, r5
.L820:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L823+12
	ldr	r2, .L823+16
	bl	dprint_normal
.L812:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L822:
	str	r0, [sp]
	movw	r1, #4291
	stmib	sp, {ip, lr}
	mov	r0, #32
	ldr	r2, .L823+20
	bl	dprint_normal
	b	.L812
.L824:
	.align	2
.L823:
	.word	.LC120
	.word	.LANCHOR0
	.word	.LC121
	.word	.LANCHOR2+964
	.word	.LC31
	.word	.LC122
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
	ldr	r7, .L831
	ldr	r6, .L831+4
	mov	r0, #0
	ldr	r4, .L831+8
	ldr	r8, [r7, #200]
	ldr	r9, [r6, #84]
	bl	VFMW_GetString
	add	r5, r4, #800
	ldr	r1, .L831+12
	str	r5, [sp]
	mov	r2, r9
	mov	r3, r0
	mov	r0, #127
	blx	r8
	subs	r8, r0, #0
	bne	.L829
	mov	r0, #4
	ldr	r9, [r6, #84]
	ldr	r7, [r7, #200]
	mov	r6, #1
	str	r6, [r4, #216]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r2, r9
	ldr	r1, .L831+16
	mov	r3, r0
	mov	r0, #136
	blx	r7
	cmp	r0, #0
	streq	r6, [r4, #220]
	bne	.L830
.L827:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L829:
	mov	r3, #127
	ldr	r2, .L831+20
	movw	r1, #4314
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L827
.L830:
	mov	r0, r8
	mov	r3, #136
	ldr	r2, .L831+20
	movw	r1, #4322
	bl	dprint_normal
	mvn	r0, #0
	b	.L827
.L832:
	.align	2
.L831:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	VCTRL_Isr_0
	.word	VCTRL_Scd_Isr
	.word	.LC123
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
	ldr	r4, .L837
	ldr	r3, [r4, #216]
	cmp	r3, #1
	beq	.L836
.L834:
	ldr	r3, [r4, #220]
	ldr	r4, .L837
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L837+4
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
.L836:
	ldr	r3, .L837+4
	mov	r0, #0
	ldr	r5, [r3, #204]
	bl	VFMW_GetString
	add	r2, r4, #800
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #216]
	b	.L834
.L838:
	.align	2
.L837:
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
	bne	.L842
	ldr	r2, [r4, #88]
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_AddMemRecord
.L841:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L842:
	mov	r3, #0
	ldr	r2, .L843
	movt	r3, 63683
	movw	r1, #4377
	mov	r0, #0
	mvn	r5, #0
	bl	dprint_normal
	b	.L841
.L844:
	.align	2
.L843:
	.word	.LC124
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
	beq	.L846
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L850
	add	r0, r4, #72
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
.L846:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_DelMemRecord
.L851:
	.align	2
.L850:
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
	ldr	r7, .L863
	mov	r4, r0
	mov	r0, #15
	ldr	r6, .L863+4
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
	beq	.L853
	mov	r0, r5
	blx	r3
	subs	r2, r0, #0
	ble	.L853
	str	r5, [r4, #20]
	sub	r0, fp, #76
	str	r5, [sp]
	mov	r3, r4
	mov	r1, r5
	bl	MEM_AllocMemBlock
	subs	r8, r0, #0
	bne	.L854
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
	beq	.L855
	sub	r0, fp, #56
	blx	r3
	subs	r4, r0, #0
	bne	.L855
	bl	VDMDRV_Init
.L856:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L853:
	mov	r3, #0
	ldr	r2, .L863+8
	mov	r0, r3
	movw	r1, #4482
	bl	dprint_normal
	mvn	r4, #0
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L855:
	mov	r3, #0
	ldr	r2, .L863+12
	mov	r0, r3
	movw	r1, #4510
	bl	dprint_normal
	mvn	r4, #0
	b	.L856
.L854:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L863+16
	movw	r1, #4496
	bl	dprint_normal
	mvn	r4, #0
	b	.L856
.L864:
	.align	2
.L863:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LC125
	.word	.LC127
	.word	.LC126
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
	beq	.L873
	ldr	r3, [r0, #64]
	adds	r5, r3, #0
	movne	r5, #1
.L866:
	ldr	r6, [r4, #16]
	ldr	r7, [r4, #8]
	cmp	r6, #0
	ldr	r8, [r4, #4]
	beq	.L867
	ldr	r3, .L880
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L879
	mov	r0, #0
	blx	r2
.L872:
	cmp	r5, #0
	beq	.L870
.L871:
	ldr	r3, .L880+4
	mov	r0, r4
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
.L867:
	mov	r2, r6
	mov	r1, r8
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MEM_DelMemRecord
.L879:
	movw	r3, #4550
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L880+8
	bl	dprint_normal
	b	.L872
.L870:
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	b	.L871
.L873:
	mov	r5, r3
	b	.L866
.L881:
	.align	2
.L880:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC69
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
	ldr	r3, .L886
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
	bne	.L883
	ldr	r2, [r4, #40]
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_AddMemRecord
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #32]
	mov	r2, r6
	bl	SM_OpenSCDDrv
	subs	r4, r0, #0
	bne	.L884
	bl	SM_InstInit
.L885:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L883:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L886+4
	movw	r1, #4592
	bl	dprint_normal
	mvn	r4, #0
	b	.L885
.L884:
	mov	r3, r6
	mov	r0, r6
	ldr	r2, .L886+8
	movw	r1, #4600
	bl	dprint_normal
	mvn	r4, #0
	b	.L885
.L887:
	.align	2
.L886:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC128
	.word	.LC129
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
	beq	.L889
	ldr	r3, [r0, #64]
	cmp	r3, #0
	beq	.L889
	ldr	r5, [r0, #40]
	ldr	r7, [r0, #32]
	cmp	r5, #0
	ldr	r6, [r0, #28]
	bne	.L900
.L893:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r7
	bl	MEM_DelMemRecord
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_InstInit
.L889:
	ldr	r5, [r4, #40]
	ldr	r7, [r4, #32]
	cmp	r5, #0
	ldr	r6, [r4, #28]
	beq	.L893
	mov	r0, #0
	add	r8, r4, #24
	bl	SM_CloseSCDDrv
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_ReleaseMemBlock
.L891:
	ldr	r3, .L901
	mov	r0, r8
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L893
.L900:
	mov	r0, #0
	add	r8, r4, #24
	bl	SM_CloseSCDDrv
	b	.L891
.L902:
	.align	2
.L901:
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
	ldr	r2, .L910
	mov	r3, r5
	movw	r1, #4656
	mov	r0, #25
	bl	dprint_normal
	cmp	r6, #3
	beq	.L908
	cmp	r4, r8
	blt	.L909
.L907:
	mov	r4, r6
.L905:
	str	r4, [sp]
	mov	r3, r6
	ldr	r2, .L910+4
	movw	r1, #4675
	mov	r0, #25
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L909:
	ldr	r2, .L910+8
	movw	r1, #4670
	mov	r0, #25
	mov	r4, #3
	bl	dprint_normal
	b	.L905
.L908:
	cmp	r5, r8
	ble	.L907
	ldr	r2, .L910+12
	movw	r1, #4662
	mov	r0, #25
	mov	r4, #0
	bl	dprint_normal
	b	.L905
.L911:
	.align	2
.L910:
	.word	.LC130
	.word	.LC133
	.word	.LC132
	.word	.LC131
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
	ldr	r2, .L917
	add	r1, r0, #16
.L915:
	ldr	r3, [r2], #4
	add	r0, r0, #4
	cmp	r3, #0
	ldrne	r3, [r3, #28]
	str	r3, [r0, #-4]
	cmp	r0, r1
	bne	.L915
	ldmfd	sp, {fp, sp, pc}
.L918:
	.align	2
.L917:
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
	ldrne	r1, .L930
	movne	r0, #0
	beq	.L929
.L923:
	ldr	r2, [r1], #4
	cmp	r2, #0
	add	r3, r2, #207872
	add	r3, r3, #488
	beq	.L922
	cmp	ip, r3
	beq	.L921
.L922:
	add	r0, r0, #1
	cmp	r0, #4
	bne	.L923
	mvn	r0, #0
.L921:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L929:
	ldr	r2, .L930+4
	movw	r3, #4703
	mov	r1, r3
	str	r3, [sp]
	ldr	r3, .L930+8
	str	r2, [sp, #4]
	ldr	r2, .L930+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L921
.L931:
	.align	2
.L930:
	.word	.LANCHOR0+48
	.word	.LC134
	.word	.LANCHOR2+988
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	2
	.global	VCTRL_USERDEC_Init
	.type	VCTRL_USERDEC_Init, %function
VCTRL_USERDEC_Init:
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
	ldr	r3, .L936
	mov	r4, r0
	ldr	r6, [r0, #352]
	mov	r2, #368
	mov	r5, r1
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r4, #8
	str	r6, [r4, #352]
	bl	ResetVoQueue
	str	r5, [r4]
	mov	r0, r4
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #360]
	beq	.L935
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L935:
	ldr	r2, .L936+4
	movw	r1, #1324
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L937:
	.align	2
.L936:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC135
	UNWIND(.fnend)
	.size	VCTRL_USERDEC_Init, .-VCTRL_USERDEC_Init
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
	ldr	r3, .L954
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L953
	ldr	r3, [r0, #128]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L938
.L942:
	.word	.L941
	.word	.L943
	.word	.L944
	.word	.L945
	.word	.L946
	.word	.L938
	.word	.L947
	.word	.L938
	.word	.L938
	.word	.L938
	.word	.L948
	.word	.L948
	.word	.L948
	.word	.L949
	.word	.L946
	.word	.L950
	.word	.L951
	.word	.L938
	.word	.L938
	.word	.L938
	.word	.L952
.L952:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_USERDEC_Init
.L941:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L943:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_Init
.L944:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L945:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L946:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H263DEC_Init
.L947:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_Init
.L948:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_Init
.L949:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_Init
.L950:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_Init
.L951:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L953:
	ldr	r2, .L954+4
	movw	r1, #2780
	ldr	r3, .L954+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L954+12
	bl	dprint_normal
.L938:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L955:
	.align	2
.L954:
	.word	.LANCHOR0
	.word	.LC33
	.word	.LANCHOR2+1012
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_InitSyntaxCtx, .-VCTRL_InitSyntaxCtx
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
	ldr	r6, .L986
	mov	r7, r0, asl #2
	mov	r4, r1
	add	r3, r6, r7
	mov	r5, r0
	ldr	r1, [r3, #48]
	add	ip, r1, #204800
	ldr	r2, [ip, #2464]
	cmp	r2, #1
	beq	.L981
	cmp	r2, #6
	cmpne	r2, #18
	sub	r0, r2, #2
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #1
	orrls	r3, r3, #1
	cmp	r3, #0
	bne	.L958
.L959:
	ldrd	r6, [r4, #32]
	mvn	r3, #0
	mvn	r2, #0
	add	r1, r1, #206848
	cmp	r7, r3
	add	r3, r1, #656
	cmpeq	r6, r2
	beq	.L982
	strd	r6, [r3]
.L970:
	ldrd	r8, [r4, #48]
	add	lr, r1, #672
	add	r0, r1, #688
	mov	r3, r5
	ldr	r2, .L986+4
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
.L981:
	ldr	r3, [ip, #3560]
	ldrb	r3, [r3, #532]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L959
.L958:
	add	r1, r1, #207872
	add	r3, r4, #8
	add	r1, r1, #128
	mov	r0, r5
	bl	IsNewpicSeg
	cmp	r0, #0
	beq	.L983
.L960:
	add	r6, r6, r7
	ldr	r0, [r6, #48]
	add	r1, r0, #204800
	ldr	r3, [r1, #2464]
	cmp	r3, #3
	addeq	r0, r0, #206848
	beq	.L966
.L965:
	ldrd	r2, [r4, #32]
	mvn	r7, #0
	mvn	r6, #0
	add	r0, r0, #206848
	cmp	r3, r7
	cmpeq	r2, r6
	addne	ip, r0, #672
	strned	r2, [ip, #-8]
.L967:
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
.L966:
	add	r0, r0, #672
	mov	r3, r5
	ldr	r2, .L986+8
	movw	r1, #4807
	ldrd	r4, [r0]
	mov	r0, #24
	strd	r4, [sp]
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L982:
	ldrd	r6, [r3]
	b	.L970
.L983:
	add	r3, r6, r7
	ldr	r1, [r3, #48]
	add	r0, r1, #204800
	add	r1, r1, #206848
	ldr	r3, [r0, #2464]
	cmp	r3, #3
	beq	.L984
	add	ip, r1, #672
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r8, [ip, #-8]
	cmp	r9, r3
	add	r3, r1, #656
	cmpeq	r8, r2
	beq	.L985
	strd	r8, [r3]
.L962:
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
.L964:
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
	ldr	r2, .L986+12
	bl	dprint_normal
	add	r3, r6, r7
	ldr	r0, [r3, #48]
	add	r1, r0, #204800
	ldr	r3, [r1, #2464]
	cmp	r3, #3
	bne	.L965
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
	b	.L960
.L984:
	add	ip, r1, #672
	add	r3, r1, #656
	ldrd	r8, [ip, #-8]
	strd	r8, [r3]
	b	.L962
.L985:
	ldrd	r8, [r3]
	b	.L962
.L987:
	.align	2
.L986:
	.word	.LANCHOR0
	.word	.LC138
	.word	.LC137
	.word	.LC136
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
	ldr	r3, .L992
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #128]
	cmp	r3, #20
	beq	.L990
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	mvnne	r0, #1
	moveq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L990:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L993:
	.align	2
.L992:
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
	ldrhi	r2, .L1026
	movwhi	r3, #4850
	bhi	.L1016
	ldr	r2, .L1026+4
	mov	r3, r0, asl #2
	str	r3, [fp, #-48]
	add	r6, r2, r3
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L1020
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L1021
	ldr	r5, [r3, #32]
	cmp	r5, #0
	ldrne	r2, .L1026+8
	movwne	r3, #4853
	bne	.L1016
	bl	IsPrintStateAllow
	ldr	r3, [r6, #48]
	ldr	r3, [r3, #128]
	cmp	r3, #20
	mov	r7, r0
	beq	.L1000
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	bne	.L1022
.L1000:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	beq	.L1023
	cmp	r7, #1
	mvnne	r5, #2
	beq	.L1024
.L1014:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1022:
	cmp	r7, #1
	mvnne	r5, #1
	bne	.L1014
	mov	r3, r4
	ldr	r2, .L1026+12
	movw	r1, #4862
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #1
	b	.L1014
.L1023:
	ldr	r3, .L1026+4
	ldr	r2, [fp, #-48]
	add	r3, r3, r2
	ldr	r1, [r3, #48]
	add	r6, r1, #204800
	add	r1, r1, #206848
	add	r10, r1, #736
	ldrb	r3, [r6, #2785]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1002
	ldr	r3, [r6, #3520]
	cmp	r3, #0
	beq	.L1025
.L1002:
	add	r6, r6, #2784
	mov	r3, r4
	ldr	r2, .L1026+16
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
	ldr	r3, .L1026+4
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
.L1021:
	ldr	r2, .L1026+20
	movw	r3, #4852
.L1016:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1026+24
	mvn	r5, #0
	ldr	r2, .L1026+28
	bl	dprint_normal
	b	.L1014
.L1024:
	mov	r3, r4
	ldr	r2, .L1026+32
	movw	r1, #4873
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #2
	b	.L1014
.L1025:
	add	r1, r1, #744
	mov	r0, r4
	bl	SM_ReadSegStream
	cmp	r0, #0
	beq	.L1002
	cmp	r7, #1
	mvnne	r5, #3
	bne	.L1014
	mov	r3, r4
	ldr	r2, .L1026+36
	movw	r1, #4888
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #3
	b	.L1014
.L1020:
	ldr	r2, .L1026+40
	movw	r1, #4851
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1026+24
	mvn	r5, #0
	str	r2, [sp, #4]
	ldr	r2, .L1026+28
	bl	dprint_normal
	b	.L1014
.L1027:
	.align	2
.L1026:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC139
	.word	.LC140
	.word	.LC143
	.word	.LC115
	.word	.LANCHOR2+1032
	.word	.LC31
	.word	.LC141
	.word	.LC142
	.word	.LC88
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
	ldr	r1, .L1062
	add	r3, r1, #756
	add	r0, r1, #772
.L1031:
	ldr	r2, [r1], #4
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #28]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L1031
	ldr	r7, .L1062+4
	mvn	r4, #0
	ldr	r10, .L1062+8
.L1032:
	ldr	r3, [r7, #804]
	ldr	r2, [r7, #808]
	ldr	r0, .L1062+4
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
	ble	.L1036
	ldr	r3, [r3, #48]
	cmp	r3, r2
	beq	.L1032
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L1032
	add	r3, r3, #204800
	ldr	r2, [r3, #2488]
	cmp	r2, #0
	ble	.L1038
	ldr	r4, [r3, #2492]
	cmp	r4, #0
	beq	.L1059
.L1038:
	mov	r5, #500
	add	r8, r7, r9
	b	.L1046
.L1041:
	cmp	r0, #0
	bne	.L1060
	ldr	r3, [r8, #48]
	add	r3, r3, #204800
	ldr	r2, [r3, #3540]
	cmp	r2, #1
	beq	.L1044
	subs	r5, r5, #1
	beq	.L1032
.L1046:
	mov	r0, r6
	bl	VCTRL_DecChanSyntax
	cmn	r0, #1
	mov	r4, r0
	bne	.L1041
	ldr	r5, [r7, #820]
	cmp	r5, #0
	beq	.L1053
	mov	r3, #0
	mov	r0, r6
	mov	r2, r3
	mov	r1, #21
	blx	r5
.L1053:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1060:
	add	r9, r7, r9
	ldr	r3, [r9, #48]
	add	r3, r3, #204800
.L1044:
	mov	r2, #0
	str	r2, [r3, #3540]
	b	.L1032
.L1059:
	mov	r0, r6
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L1061
.L1039:
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
	b	.L1038
.L1036:
	str	r2, [r0, #84]
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1061:
	mov	r1, r4
	sub	r0, fp, #68
	ldr	r3, [r10, #48]
	mov	r2, #24
	blx	r3
	b	.L1039
.L1063:
	.align	2
.L1062:
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
	bhi	.L1080
	ldr	r3, .L1081
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #128]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L1080
.L1067:
	.word	.L1077
	.word	.L1068
	.word	.L1069
	.word	.L1070
	.word	.L1071
	.word	.L1080
	.word	.L1072
	.word	.L1080
	.word	.L1080
	.word	.L1080
	.word	.L1073
	.word	.L1073
	.word	.L1073
	.word	.L1074
	.word	.L1071
	.word	.L1075
	.word	.L1076
	.word	.L1080
	.word	.L1080
	.word	.L1080
	.word	.L1077
.L1077:
	add	r0, r0, #207872
	add	r0, r0, #496
	ldmfd	sp, {fp, sp, pc}
.L1068:
	add	r0, r0, #256000
	add	r0, r0, #968
	ldmfd	sp, {fp, sp, pc}
.L1069:
	add	r0, r0, #230400
	add	r0, r0, #512
	ldmfd	sp, {fp, sp, pc}
.L1070:
	add	r0, r0, #286720
	add	r0, r0, #3616
	ldmfd	sp, {fp, sp, pc}
.L1071:
	add	r0, r0, #230400
	add	r0, r0, #536
	ldmfd	sp, {fp, sp, pc}
.L1072:
	add	r0, r0, #224256
	add	r0, r0, #240
	ldmfd	sp, {fp, sp, pc}
.L1073:
	add	r0, r0, #220160
	add	r0, r0, #864
	ldmfd	sp, {fp, sp, pc}
.L1074:
	add	r0, r0, #216064
	add	r0, r0, #480
	ldmfd	sp, {fp, sp, pc}
.L1075:
	add	r0, r0, #208896
	add	r0, r0, #48
	ldmfd	sp, {fp, sp, pc}
.L1076:
	add	r0, r0, #216064
	add	r0, r0, #176
	ldmfd	sp, {fp, sp, pc}
.L1080:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1082:
	.align	2
.L1081:
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
	bhi	.L1097
	ldr	ip, .L1103
	add	r4, ip, r0, lsl #2
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldreq	r2, .L1103+4
	movweq	r1, #5108
	moveq	r0, r3
	beq	.L1096
	cmp	r6, #0
	beq	.L1098
	cmp	r5, #0
	ldreq	r2, .L1103+8
	movweq	r1, #5110
	moveq	r0, r5
	beq	.L1096
	cmp	r7, #0
	ldreq	r2, .L1103+12
	movweq	r1, #5111
	moveq	r0, r7
	beq	.L1096
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L1090
	mov	r2, r7
	mov	r1, r5
	bl	SYNTAX_GetQueueImgNum
	ldr	r2, [r4, #48]
	ldr	r3, [r2, #128]
	cmp	r3, #0
	beq	.L1099
	cmp	r3, #16
	beq	.L1100
	cmp	r3, #17
	beq	.L1101
	cmp	r3, #15
	beq	.L1102
	cmp	r3, #18
	movne	r3, #2
	strne	r3, [r6]
	bne	.L1083
	str	r3, [sp]
	movw	r1, #5156
	ldr	r3, .L1103+16
	mov	r0, #32
	ldr	r2, .L1103+20
	bl	dprint_normal
	b	.L1083
.L1097:
	ldr	r2, .L1103+24
	movw	r3, #5107
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1103+16
	str	r2, [sp, #4]
	ldr	r2, .L1103+28
	bl	dprint_normal
.L1083:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1090:
	str	r3, [r7]
	str	r3, [r5]
	str	r3, [r6]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1099:
	add	r2, r2, #233472
	ldr	r3, [r2, #1600]
	str	r3, [r6]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1098:
	ldr	r2, .L1103+32
	movw	r1, #5109
	mov	r0, r6
.L1096:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1103+16
	ldr	r2, .L1103+28
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1100:
	add	r2, r2, #208896
	ldr	r3, [r2, #1836]
	ldr	r3, [r3, #184]
	str	r3, [r6]
	b	.L1083
.L1102:
	add	r2, r2, #11272192
	add	r2, r2, #57344
	ldr	r3, [r2, #1968]
	str	r3, [r6]
	b	.L1083
.L1101:
	str	r3, [sp]
	movw	r1, #5140
	ldr	r3, .L1103+16
	mov	r0, #32
	ldr	r2, .L1103+20
	bl	dprint_normal
	b	.L1083
.L1104:
	.align	2
.L1103:
	.word	.LANCHOR0
	.word	.LC98
	.word	.LC145
	.word	.LC146
	.word	.LANCHOR2+1052
	.word	.LC147
	.word	.LC40
	.word	.LC31
	.word	.LC144
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
	bhi	.L1111
	ldr	r7, .L1113
	add	r6, r7, r0, lsl #2
	ldr	r0, [r6, #48]
	cmp	r0, #0
	ldreq	r2, .L1113+4
	movweq	r1, #1274
	beq	.L1110
	cmp	r4, #0
	beq	.L1112
	ldr	r0, .L1113+8
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
.L1111:
	ldr	r2, .L1113+12
	movw	r3, #1273
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1113+16
	str	r2, [sp, #4]
	ldr	r2, .L1113+20
	bl	dprint_normal
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1112:
	ldr	r2, .L1113+24
	movw	r1, #1275
	mov	r0, r4
.L1110:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1113+16
	ldr	r2, .L1113+20
	bl	dprint_normal
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1114:
	.align	2
.L1113:
	.word	.LANCHOR0
	.word	.LC100
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC99
	.word	.LANCHOR2+1072
	.word	.LC31
	.word	.LC148
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
	ldrne	r3, .L1127
	bne	.L1119
	b	.L1125
.L1120:
	ldr	r2, [r3, #40]!
	cmp	r2, r1
	beq	.L1126
.L1119:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	bne	.L1120
	ldmfd	sp, {fp, sp, pc}
.L1126:
	ldmfd	sp, {fp, sp, pc}
.L1125:
	ldr	r0, .L1127+4
	ldmfd	sp, {fp, sp, pc}
.L1128:
	.align	2
.L1127:
	.word	.LANCHOR2+1092
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
	beq	.L1133
	cmp	r0, #40
	bhi	.L1132
	mov	r3, r0, asl #5
	ldr	r2, .L1134
	add	r0, r3, r0, lsl #3
	ldr	lr, .L1134+4
	add	r3, r2, r0
	ldr	ip, .L1134+8
	ldr	r2, .L1134+12
	mov	r1, r5
	add	ip, r0, ip
	ldr	r3, [r3, #1092]
	ldr	r6, [lr, #68]
	mov	r0, r4
	str	ip, [sp]
	add	r4, r4, r5
	blx	r6
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #-1]
.L1131:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1132:
	mvn	r0, #0
	b	.L1131
.L1133:
	ldr	r2, .L1134+16
	movw	r1, #6148
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L1134+20
	str	r2, [sp, #4]
	ldr	r2, .L1134+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1131
.L1135:
	.align	2
.L1134:
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+1100
	.word	.LC150
	.word	.LC149
	.word	.LANCHOR2+2772
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
	beq	.L1143
	cmp	r0, #0
	ldrne	r2, .L1149
	bne	.L1141
	b	.L1148
.L1142:
	ldr	ip, [r2, #40]!
	cmp	r0, ip
	beq	.L1139
.L1141:
	ldr	r4, [r2, #44]
	cmp	r4, #0
	bne	.L1142
	mov	r3, r0
	ldr	r2, .L1149+4
	movw	r1, #6179
	mov	r0, #32
	bl	dprint_normal
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1148:
	ldr	r4, .L1149+8
.L1139:
	mov	r0, r1
	blx	r4
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1143:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1150:
	.align	2
.L1149:
	.word	.LANCHOR2+1092
	.word	.LC151
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
	bhi	.L1157
	ldr	r3, .L1158
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	cmp	r3, #0
	strne	r1, [r3, #140]
	ldmfd	sp, {fp, sp, pc}
.L1157:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.21
.L1159:
	.align	2
.L1158:
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
	beq	.L1162
	cmp	r5, #1
	moveq	r1, #3
	movne	r1, #4
.L1162:
	cmp	r0, #3
	bhi	.L1174
	ldr	r3, .L1175
	add	r2, r3, r0, lsl #2
	ldr	r2, [r2, #48]
	cmp	r2, #0
	strne	r1, [r2, #140]
.L1165:
	ldr	r4, [r3, #820]
	cmp	r4, #0
	beq	.L1160
	sub	r2, fp, #20
	mov	r3, #4
	mov	r1, #44
	str	r5, [r2, #-4]!
	blx	r4
.L1160:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1174:
	str	r0, [fp, #-32]
	bl	VCTRL_SetLastFrameState.part.21
	ldr	r3, .L1175
	ldr	r0, [fp, #-32]
	b	.L1165
.L1176:
	.align	2
.L1175:
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
	bhi	.L1196
	ldr	r4, .L1198
	mov	r6, r0, asl #2
	add	r3, r4, r6
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L1197
	add	r3, r1, #204800
	ldr	r3, [r3, #3552]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L1181
.L1183:
	.word	.L1182
	.word	.L1184
	.word	.L1185
	.word	.L1186
	.word	.L1187
	.word	.L1181
	.word	.L1188
	.word	.L1181
	.word	.L1181
	.word	.L1181
	.word	.L1181
	.word	.L1181
	.word	.L1181
	.word	.L1181
	.word	.L1187
	.word	.L1189
	.word	.L1190
.L1184:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	VC1DEC_FlushRemainImg
	ldr	r1, [r4, #48]
.L1181:
	add	r1, r1, #207872
	mov	r0, r5
	add	r1, r1, #480
	bl	SYNTAX_MarkImageEos
	cmn	r0, #1
	mov	r4, r0
	beq	.L1192
	cmp	r0, #0
	beq	.L1193
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	sub	r3, r4, #2
	ldr	r2, .L1198+4
	movw	r1, #6332
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
.L1179:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1193:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r2, .L1198+8
	movw	r1, #6327
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1192:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r2, .L1198+12
	movw	r1, #6322
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1190:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	HEVCDEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1182:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	H264DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1185:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	MPEG4DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1186:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	MPEG2DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1187:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	H263DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1188:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	AVSDEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1189:
	add	r0, r1, #207872
	add	r4, r4, r6
	add	r0, r0, #488
	bl	MVC_DEC_FlushRemainImg
	ldr	r1, [r4, #48]
	b	.L1181
.L1196:
	ldr	r2, .L1198+16
	movw	r3, #6232
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1198+20
	str	r2, [sp, #4]
	ldr	r2, .L1198+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1179
.L1197:
	ldr	r2, .L1198+28
	movw	r3, #6233
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L1198+20
	str	r2, [sp, #4]
	ldr	r2, .L1198+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1179
.L1199:
	.align	2
.L1198:
	.word	.LANCHOR0
	.word	.LC154
	.word	.LC153
	.word	.LC152
	.word	.LC87
	.word	.LANCHOR2+2796
	.word	.LC31
	.word	.LC100
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r5, .L1231
	mov	r4, r0, asl #2
	mov	r6, r0
	add	r0, r5, r4
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L1223
	ldr	ip, [r0, #128]
	cmp	ip, #16
	ldrls	pc, [pc, ip, asl #2]
	b	.L1200
.L1204:
	.word	.L1203
	.word	.L1205
	.word	.L1206
	.word	.L1207
	.word	.L1208
	.word	.L1200
	.word	.L1209
	.word	.L1200
	.word	.L1200
	.word	.L1200
	.word	.L1210
	.word	.L1210
	.word	.L1210
	.word	.L1211
	.word	.L1208
	.word	.L1212
	.word	.L1213
.L1212:
	add	r0, r0, #207872
	add	r4, r5, r4
	mov	r2, #1
	add	r0, r0, #488
	bl	MVC_DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r3, r3, #204800
	ldrb	r2, [r3, #3561]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1224
.L1221:
	mov	r2, #0
	str	r2, [r3, #3788]
.L1200:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1213:
	add	r0, r0, #207872
	add	r4, r5, r4
	str	r3, [sp, #4]
	add	r0, r0, #488
	mov	r3, r2
	mov	r7, #0
	mov	r2, #1
	str	r7, [sp]
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #204800
	ldrb	r2, [r2, #3569]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1225
.L1215:
	add	r3, r3, #208896
	mov	r2, #0
	str	r2, [r3, #1884]
	b	.L1200
.L1203:
	add	r0, r0, #207872
	add	r4, r5, r4
	str	r3, [sp, #4]
	add	r0, r0, #488
	mov	r3, r2
	mov	r7, #0
	mov	r2, #1
	str	r7, [sp]
	bl	H264DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #221184
	ldrb	r2, [r2, #736]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1226
.L1214:
	add	r3, r3, #204800
	mov	r2, #0
	str	r2, [r3, #3920]
	b	.L1200
.L1205:
	add	r0, r0, #207872
	add	r4, r5, r4
	add	r0, r0, #488
	bl	VC1DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #217088
	ldrb	r2, [r2, #3920]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1227
.L1220:
	add	r3, r3, #204800
	mov	r2, #0
	str	r2, [r3, #3564]
	b	.L1200
.L1206:
	add	r0, r0, #207872
	add	r4, r5, r4
	add	r0, r0, #488
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #229376
	ldrb	r2, [r2, #1924]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1228
.L1218:
	add	r3, r3, #208896
	mov	r2, #0
	str	r2, [r3, #500]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1207:
	add	r0, r0, #207872
	add	r4, r5, r4
	add	r0, r0, #488
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r3, r3, #204800
	ldrb	r2, [r3, #3578]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1229
.L1216:
	mov	r2, #0
	str	r2, [r3, #3592]
	b	.L1200
.L1208:
	add	r0, r0, #207872
	add	r4, r5, r4
	add	r0, r0, #488
	bl	H263DEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r2, r3, #229376
	ldrb	r2, [r2, #1948]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1218
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	mov	r1, #0
	add	r2, r3, #229376
	strb	r1, [r2, #1948]
	b	.L1218
.L1209:
	add	r0, r0, #207872
	add	r4, r5, r4
	add	r0, r0, #488
	bl	AVSDEC_VDMPostProc
	ldr	r3, [r4, #48]
	add	r3, r3, #204800
	ldrb	r2, [r3, #3560]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1230
.L1219:
	mov	r2, #0
	str	r2, [r3, #3576]
	b	.L1200
.L1210:
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	VP6DEC_VDMPostProc
.L1222:
	add	r4, r5, r4
	mov	r2, #0
	ldr	r3, [r4, #48]
	add	r3, r3, #204800
	str	r2, [r3, #3564]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1211:
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	VP8DEC_VDMPostProc
	b	.L1222
.L1223:
	ldr	r2, .L1231+4
	movw	r1, #3750
	ldr	r3, .L1231+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1231+12
	bl	dprint_normal
	b	.L1200
.L1224:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r4, #48]
	mov	r1, #0
	add	r2, r2, #204800
	mov	r3, r2
	strb	r1, [r2, #3561]
	b	.L1221
.L1230:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r4, #48]
	mov	r1, #0
	add	r2, r2, #204800
	mov	r3, r2
	strb	r1, [r2, #3560]
	b	.L1219
.L1229:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r4, #48]
	mov	r1, #0
	add	r2, r2, #204800
	mov	r3, r2
	strb	r1, [r2, #3578]
	b	.L1216
.L1228:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	mov	r1, #0
	add	r2, r3, #229376
	strb	r1, [r2, #1924]
	b	.L1218
.L1227:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	mov	r1, #0
	add	r2, r3, #217088
	strb	r1, [r2, #3920]
	b	.L1220
.L1225:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	add	r2, r3, #204800
	strb	r7, [r2, #3569]
	b	.L1215
.L1226:
	mov	r0, r6
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r4, #48]
	add	r2, r3, #221184
	strb	r7, [r2, #736]
	b	.L1214
.L1232:
	.align	2
.L1231:
	.word	.LANCHOR0
	.word	.LC33
	.word	.LANCHOR2+2820
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
	ldrhi	r2, .L1243
	movwhi	r3, #3998
	bhi	.L1241
	ldr	ip, .L1243+4
	add	ip, ip, r0, lsl #2
	ldr	ip, [ip, #48]
	cmp	ip, #0
	beq	.L1242
	ldr	ip, [ip, #20]
	cmp	ip, #1
	beq	.L1237
	ldr	r2, .L1243+8
	mov	r3, #4000
.L1241:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1243+12
	ldr	r2, .L1243+16
	bl	dprint_normal
.L1233:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1237:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1233
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_PostProc
.L1242:
	ldr	r2, .L1243+20
	movw	r1, #3999
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L1243+12
	str	r2, [sp, #4]
	ldr	r2, .L1243+16
	bl	dprint_normal
	b	.L1233
.L1244:
	.align	2
.L1243:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC115
	.word	.LANCHOR2+2836
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
	ldrhi	r2, .L1268
	movwhi	r3, #6524
	bhi	.L1263
	ldr	r3, .L1268+4
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L1264
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L1250
	ldr	r2, .L1268+8
	mov	r3, #6528
.L1263:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1268+12
	ldr	r2, .L1268+16
	bl	dprint_normal
.L1246:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1250:
	ldr	r4, [r0, #128]
	sub	r1, fp, #20
	mov	r0, #3
	str	r4, [r1, #-4]!
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L1246
	sub	r0, fp, #32
	sub	r1, fp, #28
	bl	VCTRL_GetActiveChanNum
	ldr	r0, [fp, #-32]
	cmp	r0, #0
	beq	.L1265
.L1252:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	cmpeq	r4, #1
	bne	.L1246
	ldr	r3, .L1268+20
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L1246
	mov	r0, #0
	blx	r3
	b	.L1246
.L1264:
	ldr	r2, .L1268+24
	movw	r1, #6527
	ldr	r3, .L1268+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1268+16
	bl	dprint_normal
	b	.L1246
.L1265:
	ldr	r5, .L1268+20
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L1266
	blx	r2
.L1254:
	ldr	r2, [r5, #20]
	cmp	r2, #0
	beq	.L1267
	mov	r0, #0
	blx	r2
	b	.L1252
.L1266:
	movw	r3, #6402
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L1268+28
	bl	dprint_normal
	b	.L1254
.L1267:
	movw	r3, #6449
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L1268+28
	bl	dprint_normal
	b	.L1252
.L1269:
	.align	2
.L1268:
	.word	.LC155
	.word	.LANCHOR0
	.word	.LC157
	.word	.LANCHOR2+2856
	.word	.LC31
	.word	g_vdm_hal_fun_ptr
	.word	.LC156
	.word	.LC69
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
	ldrhi	r2, .L1284
	movhi	r3, #2272
	bhi	.L1281
	ldr	r4, .L1284+4
	mov	r6, r0, asl #2
	add	r8, r4, r6
	ldr	r3, [r8, #48]
	cmp	r3, #0
	beq	.L1282
	ldr	r7, [r3, #16]
	cmp	r7, #1
	bne	.L1283
	ldr	r3, [r3, #128]
	cmp	r3, #22
	ldreq	r2, .L1284+8
	movweq	r3, #2275
	beq	.L1281
	bl	SM_Start
	ldr	r0, [r8, #48]
	mov	r3, #0
	ldr	r2, [r0, #28]
	str	r7, [r0, #124]
	cmp	r2, r3
	str	r7, [r0, #24]
	str	r3, [r0, #32]
	bne	.L1276
	ldr	r1, .L1284+12
	add	r3, r4, #48
	add	r2, r4, #824
	add	lr, r4, #64
	str	r7, [r0, #28]
.L1279:
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
	bne	.L1279
	ldr	r0, .L1284+16
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1276:
	ldr	r7, .L1284+20
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r2, #12
	ldr	r3, [r7, #48]
	mov	r1, #0
	ldr	r0, .L1284+24
	add	r4, r4, r6
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #720
	mov	r1, #0
	ldr	r0, .L1284+28
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #2
	mov	r1, #0
	ldr	r0, .L1284+32
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #120
	mov	r1, #0
	ldr	r0, .L1284+36
	blx	r3
	ldr	r3, [r4, #48]
	mov	r0, #0
	mov	r2, #1
	str	r2, [r3, #20]
.L1272:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1283:
	ldr	r2, .L1284+40
	movw	r3, #2274
.L1281:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1284+44
	ldr	r2, .L1284+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L1272
.L1282:
	ldr	r2, .L1284+52
	movw	r1, #2273
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1284+44
	str	r2, [sp, #4]
	ldr	r2, .L1284+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L1272
.L1285:
	.align	2
.L1284:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC158
	.word	g_ChanCtx
	.word	.LANCHOR0+824
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecId
	.word	g_TimeRecTable
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LC117
	.word	.LANCHOR2+2876
	.word	.LC31
	.word	.LC82
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
	ldr	r2, .L1287
	movw	r1, #5793
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1288:
	.align	2
.L1287:
	.word	.LC159
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
	ldrhi	r2, .L1303
	movwhi	r3, #6566
	bhi	.L1300
	ldr	r3, .L1303+4
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #48]
	cmp	r0, #0
	beq	.L1301
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L1293
	ldr	r2, .L1303+8
	movw	r3, #6570
.L1300:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1303+12
	ldr	r2, .L1303+16
	bl	dprint_normal
.L1289:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1293:
	ldr	r5, [r0, #128]
	sub	r1, fp, #20
	mov	r0, #3
	str	r5, [r1, #-4]!
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L1289
	sub	r1, fp, #28
	sub	r0, fp, #32
	bl	VCTRL_GetActiveChanNum
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L1302
.L1295:
	ldr	r0, [fp, #-28]
	cmp	r5, #1
	cmpeq	r0, #0
	movne	r0, #1
	moveq	r0, #0
	bne	.L1289
	ldr	r3, .L1303+20
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1289
	blx	r3
	b	.L1289
.L1301:
	ldr	r2, .L1303+24
	movw	r1, #6569
	ldr	r3, .L1303+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1303+16
	bl	dprint_normal
	b	.L1289
.L1302:
	mov	r0, r4
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	bl	VDMDRV_ResetVDH
	b	.L1295
.L1304:
	.align	2
.L1303:
	.word	.LC155
	.word	.LANCHOR0
	.word	.LC157
	.word	.LANCHOR2+2892
	.word	.LC31
	.word	g_vdm_hal_fun_ptr
	.word	.LC156
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
	bhi	.L1311
	ldr	r6, .L1313
	add	r6, r6, r0, lsl #2
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L1312
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L1310
	str	r2, [r3, #32]
	mov	r2, #0
	str	r2, [r3, #20]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1310
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
.L1307:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1310:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1311:
	ldr	r2, .L1313+4
	movw	r3, #2357
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1313+8
	str	r2, [sp, #4]
	ldr	r2, .L1313+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1307
.L1312:
	ldr	r2, .L1313+16
	movw	r1, #2358
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1313+8
	str	r2, [sp, #4]
	ldr	r2, .L1313+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1307
.L1314:
	.align	2
.L1313:
	.word	.LANCHOR0
	.word	.LC40
	.word	.LANCHOR2+2912
	.word	.LC31
	.word	.LC160
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
	ldr	r5, .L1322
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1317
.L1321:
	add	r4, r4, #1
	ldr	r3, [r8, #120]
	blx	r3
	cmp	r4, #50
	beq	.L1319
.L1317:
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
	bne	.L1321
	cmp	r4, #49
	bgt	.L1319
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1319:
	ldr	r2, .L1322+4
	movw	r1, #2346
	mvn	r6, #0
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1323:
	.align	2
.L1322:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC161
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
	ldr	r5, .L1351
	mov	r4, r0
	mov	r10, r1
	ldr	r3, [r5]
	blx	r3
	cmp	r4, #3
	mov	r7, r0
	bhi	.L1345
	ldr	r6, .L1351+4
	mov	r3, r4, asl #2
	str	r3, [fp, #-56]
	add	r8, r6, r3
	ldr	r0, [r8, #48]
	cmp	r0, #0
	beq	.L1346
	movw	r1, #2966
	ldr	r2, .L1351+8
	str	r1, [sp]
	mov	r0, #26
	ldr	r3, .L1351+12
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
	beq	.L1347
	add	r1, r0, #207872
	mov	r0, r4
	add	r1, r1, #480
	bl	SYNTAX_MarkImageOutHanging
.L1329:
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
	beq	.L1348
	ldr	r2, [r6, #20]
	ldr	r3, .L1351+4
	cmp	r2, #0
	bne	.L1349
.L1331:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L1350
.L1335:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	movw	r3, #3019
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L1351+16
	mov	r0, #26
	ldr	r3, .L1351+12
	bl	dprint_normal
	ldr	r3, [r5]
	blx	r3
	mov	r3, #100
	mla	r4, r3, r4, r6
	mov	r3, #0
	rsb	r0, r7, r0
	str	r0, [r4, #436]
.L1326:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1348:
	mov	r0, r4
	bl	SM_Reset
	ldr	r2, [r6, #20]
	ldr	r3, .L1351+4
	cmp	r2, #0
	beq	.L1331
.L1349:
	ldr	r2, [fp, #-56]
	str	r4, [fp, #-48]
	add	r9, r3, r2
	ldr	r3, [r9, #292]
	cmp	r3, #0
	beq	.L1331
	mov	r0, #512
	sub	r1, fp, #48
	bl	VCTRL_SetDbgOption
	ldr	r3, [r9, #292]
	cmp	r3, #0
	beq	.L1331
	sub	r1, fp, #48
	mov	r0, #512
	bl	VCTRL_SetDbgOption
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L1335
.L1350:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1335
.L1347:
	ldr	r2, .L1351+20
	movw	r1, #2916
	ldr	r3, .L1351+24
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1351+28
	bl	dprint_normal
	b	.L1329
.L1345:
	ldr	r2, .L1351+32
	movw	r3, #2963
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1351+12
	str	r2, [sp, #4]
	ldr	r2, .L1351+28
	bl	dprint_normal
	mvn	r3, #0
	b	.L1326
.L1346:
	ldr	r2, .L1351+36
	movw	r1, #2964
	ldr	r3, .L1351+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1351+28
	bl	dprint_normal
	mvn	r3, #0
	b	.L1326
.L1352:
	.align	2
.L1351:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC162
	.word	.LANCHOR2+2928
	.word	.LC163
	.word	.LC33
	.word	.LANCHOR2+2956
	.word	.LC31
	.word	.LC99
	.word	.LC100
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
	ldr	r3, .L1354
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
.L1355:
	.align	2
.L1354:
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
	ldr	r7, .L1445
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
	beq	.L1429
	ldr	r2, [r5, #28]
	cmp	r2, #0
	blt	.L1359
	ldr	r3, [r5, #44]
	cmp	r3, #262144
	blt	.L1359
	ldr	r3, [r5, #36]
	cmp	r3, #1
	beq	.L1430
.L1360:
	ldr	r3, [r5, #160]
	movw	ip, #38320
	mov	r4, #0
	movt	ip, 7
	cmp	r3, #1
	sub	r2, fp, #200
	movw	lr, #35488
	mov	r1, r5
	movhi	r3, #0
	strhi	r3, [r5, #160]
	cmp	r8, #25
	mov	r3, r6
	str	r4, [r5, #172]
	mov	r0, r8
	str	r4, [r5, #176]
	movt	lr, 176
	movne	lr, ip
	str	lr, [fp, #-216]
	bl	VCTRL_GetChanMemSize
	cmp	r0, r4
	bne	.L1426
	ldr	r3, .L1445+4
	ldr	r6, [r3, #48]
	cmp	r6, #0
	beq	.L1403
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L1404
	ldr	r3, .L1445+4
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L1405
	ldr	r3, .L1445+4
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L1431
.L1394:
	mov	r3, #4
	ldr	r2, .L1445+8
	movw	r1, #2047
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
	mov	r10, r3
	b	.L1421
.L1430:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ble	.L1359
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bgt	.L1360
.L1359:
	ldr	r3, .L1445+12
	movw	r1, #1777
	ldr	r2, .L1445+16
	mov	r0, #1
	bl	dprint_normal
.L1397:
	mvn	r3, #0
	mov	r10, r3
.L1421:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1426:
	movw	r3, #2033
	mov	r0, r4
	mov	r1, r3
	ldr	r2, .L1445+20
	bl	dprint_normal
	mvn	r3, #0
	mov	r10, r3
	b	.L1421
.L1429:
	mov	r0, r5
	ldr	r2, .L1445+24
	movw	r1, #1757
	bl	dprint_normal
	b	.L1397
.L1403:
	str	r6, [fp, #-228]
.L1363:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #24
	sub	r0, fp, #164
	mov	r1, #0
	ldr	r4, .L1445
	blx	r3
	ldrd	r2, [r5, #120]
	orrs	r3, r2, r3
	beq	.L1364
	ldr	r3, [r5, #128]
	cmp	r3, #0
	bne	.L1365
.L1364:
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
	bne	.L1432
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
.L1368:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #164
	blx	r3
	ldrd	r2, [r5, #72]
	ldr	r1, .L1445
	orrs	r3, r2, r3
	beq	.L1398
	ldr	r3, [r5, #80]
	cmp	r3, #0
	bne	.L1370
.L1398:
	ldr	r3, [r5, #160]
	cmp	r3, #1
	beq	.L1371
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
	bne	.L1433
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
.L1375:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #164
	blx	r3
	ldrd	r2, [r5, #96]
	ldr	r1, .L1445
	orrs	r3, r2, r3
	beq	.L1400
	ldr	r3, [r5, #104]
	cmp	r3, #0
	bne	.L1379
.L1400:
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
	mov	r10, r3
	bne	.L1434
	ldr	r2, [fp, #-148]
	ldr	r1, [fp, #-160]
	ldr	r0, [fp, #-156]
	bl	MEM_AddMemRecord
	ldr	ip, [fp, #-156]
	ldr	r0, [fp, #-160]
	mov	r2, #1
	ldr	r1, [fp, #-148]
	str	r10, [fp, #-104]
	str	ip, [fp, #-116]
	str	r0, [fp, #-108]
	str	r1, [fp, #-100]
	str	r2, [fp, #-208]
.L1422:
	mov	r2, r6, asl #2
	ldr	r3, [r7]
	str	r2, [fp, #-224]
	mov	r9, r2
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #0
	blx	r3
	ldr	r10, [fp, #-216]
	ldr	r1, [fp, #-76]
	sub	r2, r10, #205824
	ldr	r0, .L1445+4
	ldr	r4, [fp, #-84]
	sub	r2, r2, #520
	cmp	r2, r1
	add	r0, r0, r9
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
	mov	r0, #0
	mov	r1, #22
	str	r10, [r3, #3228]
	add	ip, r4, #24576
	str	r8, [r4, #148]
	add	r2, r4, #26112
	str	r8, [r3, #2688]
	add	r2, r2, #232
	str	r0, [r3, #3260]
	str	r6, [r4, #4]
	ldr	lr, [r5]
	str	r1, [r4, #128]
	ldr	r8, .L1445+4
	str	lr, [r4, #144]
	str	r1, [r3, #3552]
	add	r1, r4, #256
	str	r0, [r4, #36]
	mov	r0, r6
	ldr	r3, [r5, #180]
	ldr	lr, .L1445+28
	str	r3, [r4, #84]
	ldr	r3, [r5, #172]
	str	r2, [lr, r6, asl #3]
	str	r3, [ip, #1836]
	ldr	r3, [r5, #176]
	str	r3, [ip, #1840]
	bl	FSP_EnableInstance
	subs	r9, r0, #0
	bne	.L1435
	mov	r0, r6
	bl	VCTRL_ResetChan
	ldr	lr, [fp, #-212]
	ldr	r2, [fp, #-116]
	mov	ip, #32768
	ldr	r0, [fp, #-100]
	str	lr, [r4, #152]
	add	r3, r2, #1024
	ldr	lr, [fp, #-208]
	sub	r1, r0, #32768
	sub	r1, r1, #16
	add	r3, r3, #15
	add	r3, r3, r1
	ldr	r10, [fp, #-92]
	str	lr, [r4, #156]
	bic	r3, r3, #1020
	ldr	lr, [fp, #-204]
	bic	r3, r3, #3
	str	lr, [r4, #160]
	add	lr, r3, ip
	ldr	r5, [r5, #160]
	str	r1, [r4, #168]
	str	r3, [r4, #172]
	add	r3, r0, r2
	str	r5, [r4, #56]
	cmp	lr, r3
	ldr	r1, [fp, #-84]
	ldr	r5, [fp, #-76]
	str	r2, [r4, #236]
	str	r0, [r4, #244]
	str	r2, [r4, #164]
	ldr	r0, [fp, #-140]
	ldr	r2, [fp, #-132]
	str	r1, [r4, #184]
	str	r5, [r4, #196]
	ldr	r1, [fp, #-124]
	ldr	r5, [fp, #-108]
	str	r10, [r4, #188]
	str	r0, [r4, #212]
	str	r2, [r4, #208]
	str	r1, [r4, #220]
	str	r5, [r4, #232]
	str	ip, [r4, #176]
	bhi	.L1436
	add	r2, r4, #196608
	str	r6, [r4, #4]
	str	r6, [r4, #44]
	mov	r0, r6
	str	r6, [r4, #48]
	mov	r10, r6
	str	r6, [r2, #1980]
	bl	SM_ClearInst
	ldr	r3, [fp, #-216]
	ldr	r2, [r4, #184]
	mov	r0, r6
	sub	r1, r3, #203776
	sub	r1, r1, #520
	add	r1, r2, r1
	bl	OpenUsdPool_WithMem
	mov	r2, #1
	mov	r0, r6
	str	r2, [r4, #16]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	r3, .L1445
	ldr	r2, [r3]
	blx	r2
	ldrh	ip, [fp, #-228]
	str	r9, [r4, #124]
	adds	r2, r9, ip
	mov	r1, r0
	adc	r3, r1, #0
	strd	r2, [r4, #8]
	ldr	r3, .L1445
	str	r0, [r4, #116]
	mov	r0, r9
	ldr	r2, [r3, #16]
	blx	r2
	ldr	r3, .L1445
	ldr	r2, [r3]
	blx	r2
	mov	r2, #100
	mul	r6, r2, r6
	ldr	r3, .L1445
	mov	r1, r9
	ldr	r5, [r3, #48]
	mov	r4, r0
	add	r0, r8, #376
	add	r0, r0, r6
	add	r8, r8, r6
	blx	r5
	ldr	r3, [fp, #-220]
	mov	r0, r10
	str	r9, [r8, #424]
	rsb	r4, r3, r4
	str	r4, [r8, #420]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1371:
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	str	r3, [fp, #-140]
	str	r3, [fp, #-124]
	str	r3, [fp, #-212]
	strd	r0, [fp, #-132]
	b	.L1375
.L1365:
	ldr	r3, [r4, #52]
	mov	r2, #24
	add	r1, r5, #112
	sub	r0, fp, #92
	blx	r3
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-192]
	cmp	r2, r3
	blt	.L1437
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_AddMemRecord
	b	.L1368
.L1379:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r5, #88
	sub	r0, fp, #116
	blx	r3
	ldrd	r0, [fp, #-108]
	orrs	r3, r0, r1
	beq	.L1384
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-196]
	cmp	r2, r3
	blt	.L1384
	mov	r1, r0
	ldr	r0, [fp, #-116]
	bl	MEM_AddMemRecord
	b	.L1422
.L1370:
	ldr	r3, [r1, #52]
	mov	r2, #24
	sub	r0, fp, #140
	add	r1, r5, #64
	blx	r3
	ldr	r3, [r5, #160]
	ldr	r2, [fp, #-124]
	cmp	r3, #1
	beq	.L1377
	ldr	r1, [fp, #-200]
	cmp	r2, r1
	blt	.L1438
.L1377:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_AddMemRecord
	b	.L1375
.L1434:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1439
.L1381:
	ldr	r3, [fp, #-212]
	cmp	r3, #1
	beq	.L1440
.L1382:
	ldr	r2, .L1445+32
	movw	r3, #1817
.L1425:
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
	mov	r10, r3
	b	.L1421
.L1433:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1441
.L1373:
	movw	r3, #1881
	ldr	r2, .L1445+36
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	b	.L1397
.L1435:
	mov	r3, r6
	ldr	r2, .L1445+40
	movw	r1, #2086
	mov	r0, #1
	bl	dprint_normal
.L1389:
	mov	r0, r6
	mov	r5, #0
	bl	FSP_DisableInstance
	mov	r0, r6
	bl	CloseUsdPool_WithMem
	ldr	r2, [fp, #-224]
	ldr	r3, .L1445+4
	mov	r0, r6
	ldr	r1, [r4, #156]
	ldr	ip, [r4, #160]
	add	r3, r3, r2
	ldr	r2, [r4, #152]
	str	r5, [r3, #48]
	add	r3, r4, #228
	str	r3, [fp, #-172]
	mvn	r3, #0
	str	r1, [fp, #-184]
	mov	r10, r3
	str	ip, [fp, #-180]
	str	r2, [fp, #-188]
	add	r2, r4, #204
	add	r4, r4, #180
	str	r2, [fp, #-176]
	str	r4, [fp, #-168]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	ldr	r2, [r7, #16]
	blx	r2
	sub	r1, fp, #188
	mov	r0, r6
	bl	VCTRL_FreeChanResource
	b	.L1421
.L1436:
	str	r3, [sp, #4]
	movw	r1, #2118
	mov	r3, r6
	str	lr, [sp]
	ldr	r2, .L1445+44
	mov	r0, #1
	bl	dprint_normal
	b	.L1389
.L1432:
	movw	r3, #1938
	mov	r0, r4
	mov	r1, r3
	ldr	r2, .L1445+48
	bl	dprint_normal
	b	.L1397
.L1384:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1442
.L1386:
	ldr	r3, [fp, #-212]
	cmp	r3, #1
	beq	.L1443
.L1387:
	movw	r3, #1845
	ldr	r2, .L1445+52
	b	.L1425
.L1440:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1382
.L1439:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1381
.L1441:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1373
.L1437:
	movw	r3, #1954
	ldr	r2, .L1445+56
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	b	.L1397
.L1438:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1444
.L1378:
	movw	r3, #1912
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, r3
	ldr	r2, .L1445+60
	mov	r0, #1
	bl	dprint_normal
	b	.L1397
.L1443:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1387
.L1442:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1386
.L1444:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-200]
	b	.L1378
.L1404:
	mov	r6, #1
.L1393:
	cmp	r6, #3
	str	r6, [fp, #-228]
	bls	.L1363
	b	.L1394
.L1431:
	mov	r6, #3
	b	.L1393
.L1405:
	mov	r6, #2
	b	.L1393
.L1446:
	.align	2
.L1445:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC166
	.word	.LANCHOR2+2984
	.word	.LC119
	.word	.LC165
	.word	.LC164
	.word	s_SmIIS
	.word	.LC171
	.word	.LC169
	.word	.LC173
	.word	.LC174
	.word	.LC167
	.word	.LC172
	.word	.LC168
	.word	.LC170
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
	mov	r7, r0
	mov	r4, r1
	ldrhi	r2, .L1507
	movwhi	r3, #2661
	bhi	.L1498
	ldr	r6, .L1507+4
	mov	r9, r0, asl #2
	add	r3, r6, r9
	ldr	r0, [r3, #48]
	cmp	r0, #0
	ldreq	r2, .L1507+8
	movweq	r1, #2662
	beq	.L1499
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L1501
	cmp	r4, #0
	beq	.L1502
	add	r1, r6, #840
	mov	r0, #0
	bl	PDT_GetAttribute
	ldr	r3, [r6, #860]
	ldr	r5, [r4, #8]
	cmp	r3, #21
	bhi	.L1454
	cmp	r3, r5
	beq	.L1455
	add	r2, r6, #860
	add	r3, r6, #984
.L1457:
	ldr	r1, [r2, #4]!
	cmp	r1, #21
	bhi	.L1454
	cmp	r1, r5
	beq	.L1455
	cmp	r2, r3
	bne	.L1457
.L1455:
	mov	r1, r4
	mov	r0, r7
	bl	VCTRL_CmpConfigParameter
	subs	r8, r0, #0
	beq	.L1503
	add	r8, r6, r9
	ldr	r10, .L1507+12
	mov	r2, #72
	mov	r1, #0
	ldr	r3, [r8, #48]
	sub	r0, fp, #116
	str	r5, [r3, #128]
	ldr	ip, [r4, #24]
	str	ip, [r3, #28]
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	strb	ip, [r3]
	ldr	r3, [r10, #48]
	blx	r3
	ldr	r3, [r8, #48]
	ldr	r3, [r3, #164]
	mov	r0, r3
	str	r3, [fp, #-104]
	bl	MEM_Phy2Vir
	ldr	r1, [r4, #84]
	ldr	ip, [r4, #8]
	mov	r3, #49152
	cmp	r1, #1
	movt	r3, 63683
	ldr	r2, [r8, #48]
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
	bne	.L1504
.L1496:
	ldr	r3, [r4, #52]
.L1462:
	ldr	r5, .L1507+16
	mov	r2, #0
	str	r3, [fp, #-76]
	add	r8, r5, #16
	mov	r3, r5
.L1464:
	ldr	r1, [r3], #4
	cmp	r1, #0
	addne	r2, r2, #1
	cmp	r3, r8
	bne	.L1464
	ldr	r3, .L1507+20
	cmp	r2, #1
	str	r3, [fp, #-124]
	ble	.L1505
.L1465:
	mov	r3, #0
	str	r3, [fp, #-76]
.L1467:
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
	mov	r0, r7
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
	ble	.L1471
	ldr	r1, [r4, #108]
	cmp	r1, #0
	ble	.L1471
	str	r2, [r3, #2560]
	ldr	r2, [r4, #108]
	str	r2, [r3, #2564]
.L1472:
	add	r6, r6, r9
	ldr	r3, [r10, #52]
	mov	r2, #156
	mov	r1, r4
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
	beq	.L1473
	mov	r0, r7
	bl	VCTRL_ResetChan
	ldr	r3, [r4, #8]
	cmp	r3, #20
	beq	.L1506
.L1497:
	ldr	r1, [r6, #48]
	add	r0, r1, #204800
	ldr	ip, [r1, #128]
.L1473:
	movw	r3, #2456
	ldr	r2, .L1507+24
	ldrsb	lr, [r0, r3]
	ldr	r3, .L1507+28
	str	ip, [r0, #3552]
	str	lr, [r1, #264]
.L1478:
	ldr	r1, [r5], #4
	add	r2, r2, #4
	add	r3, r3, #4
	cmp	r1, #0
	streq	r1, [r2, #-4]
	ldrne	r0, [r1, #28]
	ldrne	r1, [r5, #-4]
	strne	r0, [r2, #-4]
	ldrne	r1, [r1, #28]
	cmp	r8, r5
	str	r1, [r3, #-4]
	bne	.L1478
	ldr	r0, .L1507+24
	bl	VDMDRV_SetPriority
	mov	r0, r7
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1492:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1504:
	cmp	r3, #16
	movne	r3, #0
	beq	.L1496
	b	.L1462
.L1503:
	ldr	r3, .L1507+32
	movw	r1, #2680
	ldr	r2, .L1507+36
	bl	dprint_normal
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1454:
	mov	r3, r5
	ldr	r2, .L1507+40
	movw	r1, #2476
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, .L1507+32
	ldr	r2, .L1507+44
	mov	r1, #2672
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1471:
	mov	r2, #1920
	str	r2, [r3, #2560]
	mov	r2, #1088
	str	r2, [r3, #2564]
	b	.L1472
.L1505:
	ldr	r3, [r3, #80]
	cmp	r3, #0
	beq	.L1465
	cmp	r3, #1
	streq	r3, [fp, #-76]
	b	.L1467
.L1501:
	ldr	r2, .L1507+48
	movw	r3, #2663
.L1498:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1507+32
	ldr	r2, .L1507+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L1492
.L1506:
	mov	r2, #1088
	mov	r1, #1920
	mov	r0, r7
	bl	VCTRL_USERDEC_PartitionMem
	cmp	r0, #0
	beq	.L1497
	ldr	r2, .L1507+56
	movw	r1, #2734
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1492
.L1502:
	ldr	r2, .L1507+60
	movw	r1, #2664
	mov	r0, r4
.L1499:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1507+32
	ldr	r2, .L1507+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L1492
.L1508:
	.align	2
.L1507:
	.word	.LC40
	.word	.LANCHOR0
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+48
	.word	.LANCHOR1
	.word	.LANCHOR0+988
	.word	g_ChanCtx
	.word	.LANCHOR2+3004
	.word	.LC179
	.word	.LC177
	.word	.LC178
	.word	.LC175
	.word	.LC31
	.word	.LC180
	.word	.LC176
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
	ldr	r2, .L1513
	bic	r5, r4, #-16777216
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1513+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L1512
	mov	r3, r4
	ldr	r2, .L1513+8
	movw	r1, #5240
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1512:
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-44]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1514:
	.align	2
.L1513:
	.word	.LC181
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC182
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
	ldr	r2, .L1517
	bic	r5, r4, #-16777216
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1517+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1515
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-144]
	bl	VCTRL_ConfigChan
.L1515:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1518:
	.align	2
.L1517:
	.word	.LC183
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
	ldr	r2, .L1523
	and	r5, r4, #7
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1523+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L1522
	mov	r3, r4
	ldr	r2, .L1523+8
	movw	r1, #5304
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1522:
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-140]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1524:
	.align	2
.L1523:
	.word	.LC184
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC185
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
	ldr	r2, .L1527
	and	r5, r4, #3
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1527+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1525
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-136]
	bl	VCTRL_ConfigChan
.L1525:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1528:
	.align	2
.L1527:
	.word	.LC186
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
	ldr	r2, .L1531
	bic	r5, r4, #-16777216
	mov	r0, #32
	mov	r4, r4, lsr #24
	str	r5, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, .L1531+4
	mov	r2, #156
	mov	r1, #0
	sub	r0, fp, #176
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1529
	sub	r1, fp, #176
	mov	r0, r4
	str	r5, [fp, #-148]
	bl	VCTRL_ConfigChan
.L1529:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1532:
	.align	2
.L1531:
	.word	.LC187
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
	ldr	r2, .L1534
	movw	r1, #5781
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1535:
	.align	2
.L1534:
	.word	.LC188
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
	ldr	r5, .L1551
	mov	r4, r0
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r7, r0
	mov	r0, #0
	blx	r3
	cmp	r4, #3
	ldrhi	r2, .L1551+4
	movwhi	r3, #2182
	bhi	.L1546
	ldr	r8, .L1551+8
	mov	r9, r4, asl #2
	add	r3, r8, r9
	ldr	r6, [r3, #48]
	cmp	r6, #0
	beq	.L1547
	ldr	r10, [r6, #16]
	cmp	r10, #1
	bne	.L1548
	mov	r0, #0
	ldr	r3, [r5, #16]
	str	r0, [r6, #20]
	blx	r3
	mov	r0, r4
	bl	SCDDRV_IsChanDec
	cmp	r0, #0
	bne	.L1549
.L1541:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #4
	ldr	r5, .L1551
	blx	r3
	mov	r0, r4
	bl	VCTRL_StopChan
	ldr	r3, [r5, #16]
	subs	r6, r0, #0
	mov	r0, #4
	bne	.L1550
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
	ldr	r2, .L1551+12
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
.L1538:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1549:
	mov	r0, r4
	ldr	r6, [r5, #132]
	bl	SCDDRV_IsChanDec
	mov	r2, #500
	clz	r1, r0
	mov	r0, r10
	mov	r1, r1, lsr #5
	blx	r6
	b	.L1541
.L1548:
	ldr	r2, .L1551+16
	movw	r3, #2196
.L1546:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r2, .L1551+20
	mvn	r6, #0
	ldr	r3, .L1551+24
	bl	dprint_normal
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1550:
	blx	r3
	ldr	r3, [r5, #16]
	mov	r0, #0
	mvn	r6, #0
	blx	r3
	b	.L1538
.L1547:
	ldr	r2, .L1551+28
	movw	r3, #2189
	mov	r1, r3
	str	r3, [sp]
	mov	r0, r6
	ldr	r3, .L1551+24
	str	r2, [sp, #4]
	ldr	r2, .L1551+20
	bl	dprint_normal
	mov	r0, r6
	ldr	r3, [r5, #16]
	mvn	r6, #0
	blx	r3
	b	.L1538
.L1552:
	.align	2
.L1551:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR0
	.word	s_SmIIS
	.word	.LC191
	.word	.LC189
	.word	.LANCHOR2+3024
	.word	.LC190
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
	ldr	r2, .L1554
	movw	r1, #5805
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r3, r4
	ldr	r2, .L1554+4
	movw	r1, #5807
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r3, r4
	ldr	r2, .L1554+8
	movw	r1, #5809
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1555:
	.align	2
.L1554:
	.word	.LC192
	.word	.LC188
	.word	.LC159
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
	ldr	r2, .L1557
	movw	r1, #5770
	str	r0, [sp]
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1558:
	.align	2
.L1557:
	.word	.LC192
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
	ldr	r3, .L1560
	mov	r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #1004]
	ldmfd	sp, {fp, sp, pc}
.L1561:
	.align	2
.L1560:
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
	ldr	r3, .L1563
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #1004]
	ldmfd	sp, {fp, sp, pc}
.L1564:
	.align	2
.L1563:
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
	ldr	r3, .L1566
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2540]
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L1567:
	.align	2
.L1566:
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
	ldr	r3, .L1569
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #1004]
	ldmfd	sp, {fp, sp, pc}
.L1570:
	.align	2
.L1569:
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
	ldr	r3, .L1572
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2500]
	ldmfd	sp, {fp, sp, pc}
.L1573:
	.align	2
.L1572:
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
	ldr	r3, .L1575
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	str	r1, [r3, #3520]
	ldmfd	sp, {fp, sp, pc}
.L1576:
	.align	2
.L1575:
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
	bhi	.L1584
	ldr	r5, .L1589
	add	r5, r5, r0, lsl #2
	ldr	ip, [r5, #48]
	cmp	ip, #0
	beq	.L1585
	cmp	r1, #0
	beq	.L1586
	ldrd	r6, [r1, #64]
	mvn	r3, #0
	ldrd	r8, [ip, #8]
	movw	r2, #65535
	and	r3, r3, r7
	and	r2, r2, r6
	cmp	r3, r9
	cmpeq	r2, r8
	bne	.L1587
	bl	FSP_BindRequireFs
	subs	r4, r0, #0
	beq	.L1588
.L1583:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1579:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1588:
	ldr	r3, [r5, #48]
	ldr	r3, [r3, #124]
	cmp	r3, #1
	bne	.L1583
	ldr	r3, .L1589+4
	ldr	r3, [r3, #128]
	blx	r3
	ldr	r3, [r5, #48]
	str	r4, [r3, #124]
	b	.L1583
.L1587:
	strd	r8, [sp, #8]
	movw	r1, #6654
	strd	r6, [sp]
	mov	r0, #1
	ldr	r3, .L1589+8
	ldr	r2, .L1589+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1579
.L1584:
	ldr	r2, .L1589+16
	movw	r3, #6644
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1589+8
	str	r2, [sp, #4]
	ldr	r2, .L1589+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1579
.L1586:
	ldr	ip, .L1589+24
	movw	r1, #6646
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L1589+8
	str	ip, [sp, #4]
	ldr	r2, .L1589+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1579
.L1585:
	ldr	r2, .L1589+28
	movw	r1, #6645
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L1589+8
	str	r2, [sp, #4]
	ldr	r2, .L1589+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1579
.L1590:
	.align	2
.L1589:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+3044
	.word	.LC194
	.word	.LC87
	.word	.LC31
	.word	.LC193
	.word	.LC100
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
	bhi	.L1595
	ldr	r3, .L1597
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L1596
	bl	FSP_SetFrameBufferMode
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1593:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1595:
	ldr	r2, .L1597+4
	movw	r3, #6676
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1597+8
	str	r2, [sp, #4]
	ldr	r2, .L1597+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1593
.L1596:
	ldr	r2, .L1597+16
	movw	r1, #6677
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1597+8
	str	r2, [sp, #4]
	ldr	r2, .L1597+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1593
.L1598:
	.align	2
.L1597:
	.word	.LANCHOR0
	.word	.LC87
	.word	.LANCHOR2+3068
	.word	.LC31
	.word	.LC88
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
	bhi	.L1611
	ldr	r3, .L1614
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	ldreq	r2, .L1614+4
	movweq	r1, #6691
	moveq	r0, r3
	beq	.L1610
	cmp	r5, #0
	beq	.L1612
	bl	FSP_BindExternFs
	subs	r4, r0, #0
	beq	.L1613
.L1605:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1601:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1613:
	ldr	r2, [r5, #56]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #32]
	bl	MEM_AddMemRecord
	ldr	r3, [r5, #184]
	cmp	r3, #0
	beq	.L1605
	ldrd	r0, [r5, #192]
	orrs	r2, r0, r1
	bne	.L1605
	ldr	r2, .L1614+8
	movw	r1, #6705
	mov	r0, r4
	bl	dprint_normal
	b	.L1605
.L1611:
	ldr	r2, .L1614+12
	movw	r3, #6690
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1614+16
	str	r2, [sp, #4]
	ldr	r2, .L1614+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1601
.L1612:
	ldr	r2, .L1614+24
	movw	r1, #6692
	mov	r0, r5
.L1610:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1614+16
	ldr	r2, .L1614+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1601
.L1615:
	.align	2
.L1614:
	.word	.LANCHOR0
	.word	.LC88
	.word	.LC196
	.word	.LC87
	.word	.LANCHOR2+3096
	.word	.LC31
	.word	.LC195
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
	bhi	.L1626
	ldr	r3, .L1629
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #48]
	cmp	r3, #0
	ldreq	r2, .L1629+4
	movweq	r1, #6719
	moveq	r0, r3
	beq	.L1625
	cmp	r4, #0
	beq	.L1627
	bl	FSP_UnBindExternFs
	ldr	r2, [r4, #56]
	ldr	r1, [r4, #40]
	mov	r5, r0
	ldr	r0, [r4, #32]
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #184]
	cmp	r3, #0
	bne	.L1628
.L1621:
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1618:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1628:
	ldrd	r0, [r4, #192]
	orrs	r2, r0, r1
	bne	.L1621
	ldr	r2, .L1629+8
	movw	r1, #6731
	mov	r0, #0
	bl	dprint_normal
	b	.L1621
.L1626:
	ldr	r2, .L1629+12
	movw	r3, #6718
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1629+16
	str	r2, [sp, #4]
	ldr	r2, .L1629+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1618
.L1627:
	ldr	r2, .L1629+24
	mov	r1, #6720
	mov	r0, r4
.L1625:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1629+16
	ldr	r2, .L1629+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1618
.L1630:
	.align	2
.L1629:
	.word	.LANCHOR0
	.word	.LC88
	.word	.LC196
	.word	.LC87
	.word	.LANCHOR2+3120
	.word	.LC31
	.word	.LC195
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
	bhi	.L1634
	bl	FSP_SetDispFsNum
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1633:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1634:
	ldr	r2, .L1635
	movw	r3, #6741
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1635+4
	str	r2, [sp, #4]
	ldr	r2, .L1635+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L1633
.L1636:
	.align	2
.L1635:
	.word	.LC87
	.word	.LANCHOR2+3148
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
	ldr	r3, .L1638
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
.L1639:
	.align	2
.L1638:
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
	ldr	r3, .L1641
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #48]
	add	r3, r3, #204800
	ldr	r0, [r3, #2556]
	ldmfd	sp, {fp, sp, pc}
.L1642:
	.align	2
.L1641:
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
	bhi	.L1655
	ldr	r3, .L1660
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #48]
	cmp	r0, #0
	beq	.L1656
	mul	ip, r2, r1
	cmp	ip, #1024
	blt	.L1657
	add	lr, r0, #204800
	ldr	r3, [lr, #2560]
	cmp	r3, #0
	ble	.L1651
	ldr	lr, [lr, #2564]
	cmp	lr, #0
	ble	.L1651
	mul	r4, lr, r3
	cmp	ip, r4
	bgt	.L1658
.L1651:
	mov	r3, #57344
	movt	r3, 31
	cmp	ip, r3
	ble	.L1654
	ldr	r3, [r0, #128]
	bic	r0, r3, #2
	cmp	r0, #16
	bne	.L1659
.L1654:
	mov	r0, #1
.L1648:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1655:
	ldr	r2, .L1660+4
	movw	r3, #6780
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1660+8
	str	r2, [sp, #4]
	ldr	r2, .L1660+12
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1659:
	cmp	r3, #17
	cmpne	r3, #0
	moveq	r4, #1
	movne	r4, #0
	beq	.L1654
	stmia	sp, {r1, r2}
	mov	r0, r4
	movw	r1, #6804
	ldr	r2, .L1660+16
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1656:
	ldr	r2, .L1660+20
	movw	r1, #6781
	ldr	r3, .L1660+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1660+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1648
.L1657:
	mov	r0, #32
	stmib	sp, {r1, r2}
	mov	r3, r0
	str	r0, [sp]
	movw	r1, #6788
	ldr	r2, .L1660+24
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	b	.L1648
.L1658:
	stmib	sp, {r1, r2}
	mov	r0, #32
	movw	r1, #6796
	str	lr, [sp]
	ldr	r2, .L1660+28
	bl	dprint_normal
	mov	r0, #0
	b	.L1648
.L1661:
	.align	2
.L1660:
	.word	.LANCHOR0
	.word	.LC87
	.word	.LANCHOR2+3172
	.word	.LC31
	.word	.LC199
	.word	.LC88
	.word	.LC197
	.word	.LC198
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
	ldr	r3, .L1671
	mov	r4, r0
	ldr	r2, [r3]
	cmp	r2, #1
	beq	.L1669
.L1662:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1669:
	cmp	r0, #11
	bhi	.L1670
	ldr	r6, .L1671+4
	ldrb	r2, [r6, r0]	@ zero_extendqisi2
	cmp	r2, #14
	movhi	r2, #0
	strhib	r2, [r6, r0]
	cmp	r0, #10
	mov	r5, r2
	moveq	r2, #1
	streqb	r2, [r3, #1020]
	ldr	r3, .L1671+8
	ldr	r3, [r3, #4]
	blx	r3
	rsb	r2, r4, r4, lsl #4
	ldr	r1, .L1671+12
	add	r2, r2, r5
	ldrb	r3, [r6, r4]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [r6, r4]
	str	r0, [r1, r2, asl #2]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1670:
	movw	r1, #6876
	ldr	r3, .L1671+16
	stmia	sp, {r1, r4}
	mov	r0, #32
	ldr	r2, .L1671+20
	bl	dprint_normal
	b	.L1662
.L1672:
	.align	2
.L1671:
	.word	.LANCHOR0
	.word	g_TimeRecId
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecTable
	.word	.LANCHOR2+3196
	.word	.LC200
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
	ldr	r5, .L1684
	mov	r0, #0
	bl	VCTRL_RecordPosTime
	ldrb	r3, [r5, #1020]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1682
.L1674:
	ldr	r0, [r5, #12]
	mov	r3, #100
	ldr	r6, .L1684+4
	cmp	r0, #0
	str	r3, [r5, #80]
	ble	.L1675
	ldr	r3, [r6, #120]
	blx	r3
.L1675:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	SM_Wakeup
	ldr	r3, [r5, #8]
	mov	r2, #101
	str	r2, [r5, #80]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1683
.L1676:
	mov	r3, #102
	str	r3, [r5, #80]
	bl	VDMDRV_WakeUpVdm
	mov	r4, #0
.L1677:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #4
	bne	.L1677
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
.L1683:
	bl	VCTRL_DecSyntax
	mov	r7, r0
	b	.L1676
.L1682:
	mov	r0, #11
	bl	VCTRL_RecordPosTime
	mov	r3, #0
	strb	r3, [r5, #1020]
	b	.L1674
.L1685:
	.align	2
.L1684:
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
.L1687:
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L1717
	mov	r5, #2
	ldr	r7, .L1717+4
	ldr	r3, [r4, #72]
.L1692:
	cmp	r3, #2
	str	r5, [r4, #68]
	bne	.L1712
	b	.L1688
.L1716:
	str	r5, [r4, #80]
	bl	VCTRL_RunProcess
	ldr	r3, [r4, #72]
	cmp	r3, #2
	beq	.L1688
.L1712:
	cmp	r3, #3
	bne	.L1716
.L1689:
	mov	r3, #6
	mov	r0, #0
	str	r3, [r4, #80]
	str	r0, [r4, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1688:
	mov	r6, #5
	mov	r3, #1
	str	r6, [r4, #80]
	str	r3, [r4, #68]
.L1694:
	ldr	r3, [r7, #120]
	mov	r0, #10
	blx	r3
	ldr	r3, [r4, #72]
	str	r6, [r4, #80]
	cmp	r3, #1
	beq	.L1692
	cmp	r3, #3
	bne	.L1694
	b	.L1689
.L1718:
	.align	2
.L1717:
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
	bne	.L1728
	mov	r0, r4
	bl	VCTRL_InitVdmHal
	cmp	r0, #0
	movwne	r1, #6973
	bne	.L1728
	mov	r0, r4
	bl	VCTRL_InitScdHal
	cmp	r0, #0
	movwne	r1, #6978
	bne	.L1728
	bl	VCTRL_RegisterInterrupt
	cmp	r0, #0
	bne	.L1729
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1729:
	movw	r1, #6983
.L1728:
	ldr	r3, .L1730
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L1730+4
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_CloseDrivers
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1731:
	.align	2
.L1730:
	.word	.LANCHOR2+3216
	.word	.LC201
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
	ldr	r5, .L1750
	ldr	r3, [r5, #64]
	cmp	r3, #1
	bne	.L1739
	add	r6, r5, #48
	mov	r4, #0
.L1735:
	ldr	r3, [r6], #4
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L1734
	bl	VCTRL_DestroyChan
.L1734:
	cmp	r4, #4
	bne	.L1735
	bl	FSP_Exit
	ldr	r3, [r5, #68]
	mov	r2, #3
	str	r2, [r5, #72]
	cmp	r3, #0
	beq	.L1737
	ldr	r6, .L1750+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L1738
.L1749:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L1737
.L1738:
	ldr	r3, [r5, #68]
	mov	r0, #10
	cmp	r3, #0
	bne	.L1749
.L1737:
	ldr	r0, .L1750+8
	bl	VCTRL_CloseDrivers
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #64]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1739:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1751:
	.align	2
.L1750:
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
	beq	.L1784
	ldr	r5, .L1789
	mov	r2, #8
	ldr	r6, .L1789+4
	mov	r1, #0
	sub	r0, fp, #52
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r4, [r6, #64]
	cmp	r4, #0
	bne	.L1783
	mov	r1, #1024
	ldr	r3, [r5, #80]
	add	r0, r6, r1
	str	r4, [fp, #-56]
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1789+8
	add	r0, r6, #1024
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1756
	ldr	r3, [r5, #92]
	sub	r0, fp, #56
	ldr	r1, .L1789+12
	blx	r3
	cmp	r0, #0
	beq	.L1775
	sub	r0, fp, #56
	ldr	r3, [r5, #92]
	ldr	r1, .L1789+16
	blx	r3
	cmp	r0, #0
	beq	.L1785
	ldr	r3, [r5, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	mov	r3, r0
	str	r0, [r6, #792]
.L1760:
	add	r2, r3, #4992
	movw	r1, #10000
	add	r2, r2, #8
	movw	r8, #5000
	cmp	r2, r1
	bhi	.L1761
	cmp	r3, r8
	movw	r2, #60536
.L1782:
	movt	r2, 65535
	movge	r3, r8
	cmp	r3, r2
	movlt	r3, r2
.L1757:
	str	r3, [r6, #792]
.L1759:
	ldr	r8, .L1789+4
	mov	r1, #1024
	mov	r9, #0
	ldr	r3, [r5, #80]
	add	r0, r8, r1
	str	r9, [fp, #-56]
	blx	r3
	add	r0, r8, #1024
	ldr	r3, [r5, #96]
	ldr	r1, .L1789+20
	blx	r3
	ldr	r10, .L1789
	cmp	r0, r9
	str	r0, [fp, #-56]
	beq	.L1762
	ldr	r3, [r10, #92]
	sub	r0, fp, #56
	ldr	r1, .L1789+12
	blx	r3
	cmp	r0, r9
	beq	.L1763
	sub	r0, fp, #56
	ldr	r3, [r10, #92]
	ldr	r1, .L1789+16
	blx	r3
	cmp	r0, r9
	beq	.L1786
	ldr	r3, [r10, #84]
	mov	r2, r9
	mov	r1, r9
	blx	r3
	mov	r3, r0
	str	r0, [r8, #796]
.L1766:
	add	r2, r3, #4992
	movw	r1, #10000
	add	r2, r2, #8
	movw	r8, #5000
	cmp	r2, r1
	bhi	.L1767
	cmp	r3, r8
	movw	r2, #60536
	movt	r2, 65535
	movlt	r4, r3
	movge	r4, r8
	cmp	r4, r2
	movlt	r4, r2
.L1763:
	str	r4, [r6, #796]
.L1765:
	ldr	r4, [r6, #2048]
	mov	r3, #0
	ldr	r8, .L1789+4
	cmp	r4, r3
	str	r3, [fp, #-56]
	beq	.L1768
	ldr	r2, .L1789+24
	and	r3, r4, #1
	ubfx	r1, r4, #1, #1
	strb	r3, [r8, #2052]
	ubfx	r3, r4, #2, #1
	ubfx	r4, r4, #3, #1
	strb	r1, [r2, #88]
	strb	r3, [r8, #2053]
	strb	r4, [r8, #2054]
.L1769:
	ldr	r4, .L1789+4
	mov	r2, #168
	ldr	r3, [r5, #48]
	mov	r1, #0
	add	r0, r4, #64
	ldr	r8, .L1789
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #48
	blx	r3
	ldr	r1, .L1789+28
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
	bne	.L1783
	ldr	r3, [r8, #124]
	mov	r1, #1
	blx	r3
	ldr	r3, [r8, #192]
	ldr	r2, .L1789+32
	add	r0, r4, #76
	ldr	r1, .L1789+36
	blx	r3
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r4, #64]
	bne	.L1787
.L1754:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1768:
	mov	r1, #1024
	ldr	r3, [r5, #80]
	add	r0, r8, r1
	ldr	r9, .L1789
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1789+40
	add	r0, r8, #1024
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1769
	ldr	r3, [r9, #92]
	sub	r0, fp, #56
	ldr	r1, .L1789+12
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r8, #2048]
	beq	.L1771
	sub	r0, fp, #56
	ldr	r3, [r9, #92]
	ldr	r1, .L1789+16
	blx	r3
	cmp	r0, #0
	beq	.L1788
	ldr	r3, [r9, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	str	r0, [r8, #2048]
.L1771:
	ldr	r2, .L1789+24
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #2052]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2, #88]
	strb	r3, [r6, #2053]
	strb	r0, [r6, #2054]
	b	.L1769
.L1762:
	ldr	r3, [r8, #796]
	b	.L1766
.L1756:
	ldr	r3, [r6, #792]
	b	.L1760
.L1761:
	ldr	r2, .L1789+44
	movw	r1, #1035
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r6, #792]
	movw	r2, #60536
	cmp	r3, r8
	b	.L1782
.L1767:
	ldr	r2, .L1789+48
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
	b	.L1763
.L1775:
	mov	r3, r4
	b	.L1757
.L1787:
	add	r0, r4, #88
	bl	VCTRL_CloseDrivers
.L1783:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1786:
	movw	r1, #1063
	ldr	r3, .L1789+52
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1789+56
	bl	dprint_normal
	b	.L1765
.L1785:
	movw	r1, #1021
	ldr	r3, .L1789+60
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1789+56
	bl	dprint_normal
	b	.L1759
.L1788:
	movw	r1, #1114
	ldr	r3, .L1789+64
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1789+56
	bl	dprint_normal
	b	.L1769
.L1784:
	ldr	r2, .L1789+68
	movw	r3, #7044
	mov	r1, r3
	str	r3, [sp]
	ldr	r3, .L1789+72
	str	r2, [sp, #4]
	ldr	r2, .L1789+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L1754
.L1790:
	.align	2
.L1789:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC208
	.word	.LANCHOR1
	.word	VCTRL_EventReport
	.word	VCTRL_DecodeThread
	.word	.LC211
	.word	.LC210
	.word	.LC207
	.word	.LC209
	.word	.LANCHOR2+3276
	.word	.LC206
	.word	.LANCHOR2+3252
	.word	.LANCHOR2+3304
	.word	.LC202
	.word	.LANCHOR2+3236
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
	.type	__func__.17089, %object
	.size	__func__.17089, 20
__func__.17089:
	.ascii	"VfmwProc_SaveDecYUV\000"
	.type	__func__.16227, %object
	.size	__func__.16227, 18
__func__.16227:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.16170, %object
	.size	__func__.16170, 26
__func__.16170:
	.ascii	"VCTRL_HandleAllocMemEvent\000"
	.space	2
	.type	__func__.16179, %object
	.size	__func__.16179, 28
__func__.16179:
	.ascii	"VCTRL_HandleReleaseMemEvent\000"
	.type	__func__.16187, %object
	.size	__func__.16187, 33
__func__.16187:
	.ascii	"VCTRL_HandleReleaseBurstMemEvent\000"
	.space	3
	.type	__func__.16195, %object
	.size	__func__.16195, 29
__func__.16195:
	.ascii	"VCTRL_HandleCancelAllocEvent\000"
	.space	3
	.type	__func__.16205, %object
	.size	__func__.16205, 33
__func__.16205:
	.ascii	"VCTRL_HandleAllocPreProcessEvent\000"
	.space	3
	.type	__func__.16620, %object
	.size	__func__.16620, 24
__func__.16620:
	.ascii	"VCTRL_GetChanView1Image\000"
	.type	__func__.17230, %object
	.size	__func__.17230, 24
__func__.17230:
	.ascii	"VCTRL_SetLastFrameState\000"
	.type	__func__.16143, %object
	.size	__func__.16143, 17
__func__.16143:
	.ascii	"VCTRL_RecordData\000"
	.space	3
	.type	__func__.16239, %object
	.size	__func__.16239, 18
__func__.16239:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__func__.16275, %object
	.size	__func__.16275, 25
__func__.16275:
	.ascii	"VCTRL_SetStreamInterface\000"
	.space	3
	.type	__func__.16283, %object
	.size	__func__.16283, 30
__func__.16283:
	.ascii	"VCTRL_SetDeiMemQueryInterface\000"
	.space	2
	.type	__func__.16294, %object
	.size	__func__.16294, 20
__func__.16294:
	.ascii	"VCTRL_GetStreamSize\000"
	.type	__func__.16301, %object
	.size	__func__.16301, 20
__func__.16301:
	.ascii	"VCTRL_CheckFreshRaw\000"
	.type	__func__.16308, %object
	.size	__func__.16308, 20
__func__.16308:
	.ascii	"VCTRL_CheckFreshSeg\000"
	.type	__func__.16313, %object
	.size	__func__.16313, 25
__func__.16313:
	.ascii	"VCTRL_SetDiscardPicParam\000"
	.space	3
	.type	__func__.16335, %object
	.size	__func__.16335, 27
__func__.16335:
	.ascii	"VCTRL_USERDEC_PartitionMem\000"
	.space	1
	.type	__func__.16342, %object
	.size	__func__.16342, 29
__func__.16342:
	.ascii	"VCTRL_USERDEC_GetFrameBuffer\000"
	.space	3
	.type	__func__.16350, %object
	.size	__func__.16350, 29
__func__.16350:
	.ascii	"VCTRL_USERDEC_PutFrameBuffer\000"
	.space	3
	.type	__func__.16381, %object
	.size	__func__.16381, 23
__func__.16381:
	.ascii	"VCTRL_FreeChanResource\000"
	.space	1
	.type	__func__.16364, %object
	.size	__func__.16364, 22
__func__.16364:
	.ascii	"VCTRL_FreeVdhResource\000"
	.space	2
	.type	__func__.16370, %object
	.size	__func__.16370, 22
__func__.16370:
	.ascii	"VCTRL_FreeScdResource\000"
	.space	2
	.type	__func__.16376, %object
	.size	__func__.16376, 22
__func__.16376:
	.ascii	"VCTRL_FreeCtxResource\000"
	.space	2
	.type	__func__.16504, %object
	.size	__func__.16504, 17
__func__.16504:
	.ascii	"VCTRL_GetChanCfg\000"
	.space	3
	.type	__func__.16560, %object
	.size	__func__.16560, 14
__func__.16560:
	.ascii	"VCTRL_SeekPts\000"
	.space	2
	.type	__func__.16585, %object
	.size	__func__.16585, 20
__func__.16585:
	.ascii	"VCTRL_ReleaseStream\000"
	.type	__func__.16630, %object
	.size	__func__.16630, 19
__func__.16630:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.16634, %object
	.size	__FUNCTION__.16634, 19
__FUNCTION__.16634:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__func__.16640, %object
	.size	__func__.16640, 23
__func__.16640:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.16645, %object
	.size	__FUNCTION__.16645, 23
__FUNCTION__.16645:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.16653, %object
	.size	__func__.16653, 23
__func__.16653:
	.ascii	"VCTRL_GetHDRConfigInfo\000"
	.space	1
	.type	__func__.16678, %object
	.size	__func__.16678, 18
__func__.16678:
	.ascii	"VCTRL_GetDecParam\000"
	.space	2
	.type	__func__.16760, %object
	.size	__func__.16760, 20
__func__.16760:
	.ascii	"VCTRL_ClearDecparam\000"
	.type	__func__.16787, %object
	.size	__func__.16787, 21
__func__.16787:
	.ascii	"VCTRL_VdmProcSedOnly\000"
	.space	3
	.type	__func__.16797, %object
	.size	__func__.16797, 21
__func__.16797:
	.ascii	"VCTRL_GetImageBuffer\000"
	.space	3
	.type	__func__.16818, %object
	.size	__func__.16818, 22
__func__.16818:
	.ascii	"VCTRL_ConfigFFFBSpeed\000"
	.space	2
	.type	__func__.16823, %object
	.size	__func__.16823, 20
__func__.16823:
	.ascii	"VCTRL_ConfigPVRInfo\000"
	.type	__func__.16827, %object
	.size	__func__.16827, 19
__func__.16827:
	.ascii	"VCTRL_IsChanActive\000"
	.space	1
	.type	__func__.16831, %object
	.size	__func__.16831, 19
__func__.16831:
	.ascii	"VCTRL_VarifyOption\000"
	.space	1
	.type	__func__.16849, %object
	.size	__func__.16849, 21
__func__.16849:
	.ascii	"VCTRL_GetChanMemSize\000"
	.space	3
	.type	__func__.16932, %object
	.size	__func__.16932, 21
__func__.16932:
	.ascii	"VCTRL_GetChanIDByCtx\000"
	.space	3
	.type	__func__.16564, %object
	.size	__func__.16564, 20
__func__.16564:
	.ascii	"VCTRL_InitSyntaxCtx\000"
	.type	__func__.16954, %object
	.size	__func__.16954, 20
__func__.16954:
	.ascii	"VCTRL_DecChanSyntax\000"
	.type	__func__.16999, %object
	.size	__func__.16999, 20
__func__.16999:
	.ascii	"VCTRL_GetChanImgNum\000"
	.type	__func__.16322, %object
	.size	__func__.16322, 19
__func__.16322:
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
	.type	__func__.17219, %object
	.size	__func__.17219, 22
__func__.17219:
	.ascii	"VCTRL_ShowProcCommand\000"
	.space	2
	.type	__func__.17245, %object
	.size	__func__.17245, 22
__func__.17245:
	.ascii	"VCTRL_OutputLastFrame\000"
	.space	2
	.type	__func__.16740, %object
	.size	__func__.16740, 15
__func__.16740:
	.ascii	"VCTRL_PostProc\000"
	.space	1
	.type	__func__.16782, %object
	.size	__func__.16782, 18
__func__.16782:
	.ascii	"VCTRL_VdmPostProc\000"
	.space	2
	.type	__func__.17306, %object
	.size	__func__.17306, 19
__func__.17306:
	.ascii	"VCTRL_OpenHardware\000"
	.space	1
	.type	__func__.16483, %object
	.size	__func__.16483, 16
__func__.16483:
	.ascii	"VCTRL_StartChan\000"
	.type	__func__.17316, %object
	.size	__func__.17316, 20
__func__.17316:
	.ascii	"VCTRL_CloseHardware\000"
	.type	__func__.16499, %object
	.size	__func__.16499, 15
__func__.16499:
	.ascii	"VCTRL_StopChan\000"
	.space	1
	.type	__func__.16607, %object
	.size	__func__.16607, 26
__func__.16607:
	.ascii	"VCTRL_ResetChanWithOption\000"
	.space	2
	.type	__func__.16592, %object
	.size	__func__.16592, 26
__func__.16592:
	.ascii	"VCTRL_MarkImageOutHanging\000"
	.space	2
	.type	__func__.16394, %object
	.size	__func__.16394, 17
__func__.16394:
	.ascii	"VCTRL_CheckParam\000"
	.space	3
	.type	__func__.16554, %object
	.size	__func__.16554, 17
__func__.16554:
	.ascii	"VCTRL_ConfigChan\000"
	.space	3
	.type	__func__.16477, %object
	.size	__func__.16477, 18
__func__.16477:
	.ascii	"VCTRL_DestroyChan\000"
	.space	2
	.type	__func__.17343, %object
	.size	__func__.17343, 21
__func__.17343:
	.ascii	"VCTRL_BindRequireMem\000"
	.space	3
	.type	__func__.17349, %object
	.size	__func__.17349, 25
__func__.17349:
	.ascii	"VCTRL_SetFrameBufferMode\000"
	.space	3
	.type	__func__.17357, %object
	.size	__func__.17357, 23
__func__.17357:
	.ascii	"VCTRL_BindExternBuffer\000"
	.space	1
	.type	__func__.17365, %object
	.size	__func__.17365, 25
__func__.17365:
	.ascii	"VCTRL_UnBindExternBuffer\000"
	.space	3
	.type	__func__.17371, %object
	.size	__func__.17371, 24
__func__.17371:
	.ascii	"VCTRL_SetFrameBufferNum\000"
	.type	__func__.17390, %object
	.size	__func__.17390, 24
__func__.17390:
	.ascii	"VCTRL_IsResolutionValid\000"
	.type	__func__.17402, %object
	.size	__func__.17402, 20
__func__.17402:
	.ascii	"VCTRL_RecordPosTime\000"
	.type	__func__.17417, %object
	.size	__func__.17417, 18
__func__.17417:
	.ascii	"VCTRL_OpenDrivers\000"
	.space	2
	.type	__func__.17432, %object
	.size	__func__.17432, 15
__func__.17432:
	.ascii	"VCTRL_OpenVfmw\000"
	.space	1
	.type	__FUNCTION__.16250, %object
	.size	__FUNCTION__.16250, 24
__FUNCTION__.16250:
	.ascii	"VCTRL_GetExtraRefFrmNum\000"
	.type	__FUNCTION__.16256, %object
	.size	__FUNCTION__.16256, 25
__FUNCTION__.16256:
	.ascii	"VCTRL_GetExtraDispFrmNum\000"
	.space	3
	.type	__FUNCTION__.16262, %object
	.size	__FUNCTION__.16262, 22
__FUNCTION__.16262:
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
	ASCII(.ascii	"%s: view_0 id(%d) > view_1 id(%d), error!\012\000" )
	.space	1
.LC62:
	ASCII(.ascii	"%s: continuous view0 id(%d)!\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"%s: continuous view1 id(%d)!\012\000" )
	.space	2
.LC64:
	ASCII(.ascii	"print memory tracer...\012\000" )
.LC65:
	ASCII(.ascii	"Disable SedOnly Func\012\000" )
	.space	2
.LC66:
	ASCII(.ascii	"Enable SedOnly Func\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"The channel number is to Large.\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleL" )
	ASCII(.ascii	"owlyEnable = 1 ------\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC70:
	ASCII(.ascii	"Force vdm %d sleep.\012\000" )
	.space	3
.LC71:
	ASCII(.ascii	"Vfmw suspend totally take %d ms\012\000" )
	.space	3
.LC72:
	ASCII(.ascii	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSlee" )
	ASCII(.ascii	"p=%d)!\012\000" )
	.space	1
.LC73:
	ASCII(.ascii	"Force scd %d sleep.\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"proc cmd need no param:%p\012\000" )
	.space	1
.LC75:
	ASCII(.ascii	"Vfmw resume totally take %d ms\012\000" )
.LC76:
	ASCII(.ascii	"%s, %d, pos(%d) error!\012\000" )
.LC77:
	ASCII(.ascii	"event_report null!\000" )
	.space	1
.LC78:
	ASCII(.ascii	"%s Unkown Adapter Type: %d\012\000" )
.LC79:
	ASCII(.ascii	"pstStreamParam is NULL\000" )
	.space	1
.LC80:
	ASCII(.ascii	"pDeiMemIntf is NULL\000" )
.LC81:
	ASCII(.ascii	"can NOT get a not-opened Chan's information of bits" )
	ASCII(.ascii	"tream\000" )
	.space	3
.LC82:
	ASCII(.ascii	"This Chan has not been created!!!\000" )
	.space	2
.LC83:
	ASCII(.ascii	"Raw FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC84:
	ASCII(.ascii	"Seg FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC85:
	ASCII(.ascii	"pArgs is null\000" )
	.space	2
.LC86:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC87:
	ASCII(.ascii	"ChanId out of range\000" )
.LC88:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC89:
	ASCII(.ascii	"eVidStd != USER\000" )
.LC90:
	ASCII(.ascii	"%s no available fs.\012\000" )
	.space	3
.LC91:
	ASCII(.ascii	"%s logic fs(ID %d) invalid.\012\000" )
	.space	3
.LC92:
	ASCII(.ascii	"%s: can not find logic fs by dec phy addr 0x%llx.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC93:
	ASCII(.ascii	"%s FATAL: pstChan = NULL!\012\000" )
	.space	1
.LC94:
	ASCII(.ascii	"%s FATAL: pChanMem_vdh = NULL!\012\000" )
.LC95:
	ASCII(.ascii	"%s FATAL: pChanMem_scd = NULL!\012\000" )
.LC96:
	ASCII(.ascii	"%s FATAL: pChanMem_ctx = NULL!\012\000" )
.LC97:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC98:
	ASCII(.ascii	"chan not create\000" )
.LC99:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC100:
	ASCII(.ascii	"s_pstVfmwChan = NULL\000" )
	.space	3
.LC101:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC102:
	ASCII(.ascii	"%s, %d, Phyaddr = 0x%x MetaDataPhyaddr = 0x%x image" )
	ASCII(.ascii	"_id = %d\012\000" )
	.space	3
.LC103:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC104:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC105:
	ASCII(.ascii	"%s, %d, ===> Phyaddr 0x%x release Error, force to U" )
	ASCII(.ascii	"nMark ImageOutHanging\012\000" )
	.space	2
.LC106:
	ASCII(.ascii	"%s, %d, ===> Phyaddr 0x%x release success!! imageId" )
	ASCII(.ascii	" = 0x%x\012\000" )
.LC107:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC108:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC109:
	ASCII(.ascii	"pstHDRInput = null\000" )
	.space	1
.LC110:
	ASCII(.ascii	"%s VidStd=%d Error!\012\000" )
	.space	3
.LC111:
	ASCII(.ascii	"Get DecParam Type Failure!\012\000" )
.LC112:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range is %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC113:
	ASCII(.ascii	"Chan %d is not open or not running\012\000" )
.LC114:
	ASCII(.ascii	"%s unsupport VidStd %d\012\000" )
.LC115:
	ASCII(.ascii	"This channel is not running\000" )
.LC116:
	ASCII(.ascii	"%s unsupport VidStd %d.\012\000" )
	.space	3
.LC117:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC118:
	ASCII(.ascii	"pArgs = null\000" )
	.space	3
.LC119:
	ASCII(.ascii	"%s param invalid.\012\000" )
	.space	1
.LC120:
	ASCII(.ascii	"pChanOption = null\000" )
	.space	1
.LC121:
	ASCII(.ascii	"pDetailMemSize = null\000" )
	.space	2
.LC122:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), g_ExtraRef(%d), s32Di" )
	ASCII(.ascii	"splayFrameNum(%d), g_ExtraDisp(%d)\012\000" )
	.space	1
.LC123:
	ASCII(.ascii	"Register irq %d failed!\012\000" )
	.space	3
.LC124:
	ASCII(.ascii	"MEM_MapRegisterAddr reg 0x%x failed!\012\000" )
	.space	2
.LC125:
	ASCII(.ascii	"VDMDRV_GetHalMemSize Vdh %d failed!\012\000" )
	.space	3
.LC126:
	ASCII(.ascii	"MEM_AllocMemBlock Vdh %d failed!\012\000" )
	.space	2
.LC127:
	ASCII(.ascii	"VDMDRV_OpenHAL Vdh %d failed!\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"MEM_AllocMemBlock Scd %d failed!\012\000" )
	.space	2
.LC129:
	ASCII(.ascii	"SM_OpenSCDDrv Scd %d failed!\012\000" )
	.space	2
.LC130:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC131:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC132:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC133:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC134:
	ASCII(.ascii	"pCtx = null\000" )
.LC135:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC136:
	ASCII(.ascii	"Chan:%d pic_pts: %lld\012\000" )
	.space	1
.LC137:
	ASCII(.ascii	"Chan:%d pic_usertag: %lld\012\000" )
	.space	1
.LC138:
	ASCII(.ascii	"Chan:%d pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC139:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC140:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC141:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC142:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC143:
	ASCII(.ascii	"Chan:%d seg_pts: %lld, seg_usertag = %lld\012\000" )
	.space	1
.LC144:
	ASCII(.ascii	"pRefImgNum = null\000" )
	.space	2
.LC145:
	ASCII(.ascii	"pReadImgNum = null\000" )
	.space	1
.LC146:
	ASCII(.ascii	"pNewImgNum = null\000" )
	.space	2
.LC147:
	ASCII(.ascii	"%s not support std %d\012\000" )
	.space	1
.LC148:
	ASCII(.ascii	"pstChanState = NULL\000" )
.LC149:
	ASCII(.ascii	"pShowStr = null\000" )
.LC150:
	ASCII(.ascii	"  0x%-15x %s\000" )
	.space	3
.LC151:
	ASCII(.ascii	"Command \"0x%x\" not registerd!\012\000" )
	.space	1
.LC152:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC153:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC154:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC155:
	ASCII(.ascii	"Chan id out of range!\000" )
	.space	2
.LC156:
	ASCII(.ascii	"Chan not created!\000" )
	.space	2
.LC157:
	ASCII(.ascii	"Chan not open!\000" )
	.space	1
.LC158:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC159:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC160:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC161:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC162:
	ASCII(.ascii	"\012====>%s, %d=====> prepare\012\000" )
.LC163:
	ASCII(.ascii	"====>%s, %d=====> end\012\012\000" )
.LC164:
	ASCII(.ascii	"Param Invalid of PChanOption is NULL\012\000" )
	.space	2
.LC165:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSize failed!\012\000" )
	.space	2
.LC166:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT create m" )
	ASCII(.ascii	"ore channels\012\000" )
	.space	3
.LC167:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC168:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC169:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC170:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC171:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel scd\012\000" )
	.space	2
.LC172:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for SCD\012\000" )
	.space	2
.LC173:
	ASCII(.ascii	"Chan:%d can NOT enable FSP instance\012\000" )
	.space	3
.LC174:
	ASCII(.ascii	"Chan:%d hal mem %d overlap scd mem %d\012\000" )
	.space	1
.LC175:
	ASCII(.ascii	"can NOT config a not-opened Chan\000" )
	.space	3
.LC176:
	ASCII(.ascii	"pstCfg = null\000" )
	.space	2
.LC177:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC178:
	ASCII(.ascii	"%s check standard support failed.\012\000" )
	.space	1
.LC179:
	ASCII(.ascii	"%s config not change, no need to proceed.\012\000" )
	.space	1
.LC180:
	ASCII(.ascii	"can NOT VCTRL_PartitionMemForStdUser\012\000" )
	.space	2
.LC181:
	ASCII(.ascii	"chan %d: new UvmosEnable = %d\012\000" )
	.space	1
.LC182:
	ASCII(.ascii	"chan %d: SetUvmosEnable failed!\012\000" )
	.space	3
.LC183:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC184:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC185:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC186:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC187:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC188:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC189:
	ASCII(.ascii	"%s:L%d: %s\012\000" )
.LC190:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC191:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC192:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC193:
	ASCII(.ascii	"pMem = NULL\000" )
.LC194:
	ASCII(.ascii	"%s Mem UniqueID %llx != Chan UniqueID %llx, ignor t" )
	ASCII(.ascii	"his bind operation.\012\000" )
.LC195:
	ASCII(.ascii	"pExternBuffer = NULL\000" )
	.space	3
.LC196:
	ASCII(.ascii	"Attached buffer phy:%x, but vir addr is NULL\012\000" )
	.space	2
.LC197:
	ASCII(.ascii	"Resolution min(w=%d,h=%d), this stream (w=%d,h=%d) " )
	ASCII(.ascii	"invalid!\012\000" )
	.space	3
.LC198:
	ASCII(.ascii	"Resolution max(w = %d, h = %d), this stream (w = %d" )
	ASCII(.ascii	", h = %d) invalid!\012\000" )
	.space	1
.LC199:
	ASCII(.ascii	"Std(%d) not support 4K(w = %d, h = %d)\012\000" )
.LC200:
	ASCII(.ascii	"%s,%d,pos(%d) error!\012\000" )
	.space	2
.LC201:
	ASCII(.ascii	"%s %d ERROR exit.\012\000" )
	.space	1
.LC202:
	ASCII(.ascii	"pArgs null!\000" )
.LC203:
	ASCII(.ascii	"g_ExtraRef=\000" )
.LC204:
	ASCII(.ascii	"=\000" )
	.space	2
.LC205:
	ASCII(.ascii	" \000" )
	.space	2
.LC206:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC207:
	ASCII(.ascii	"ERROR: g_ExtraRef = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC208:
	ASCII(.ascii	"g_ExtraDisp=\000" )
	.space	3
.LC209:
	ASCII(.ascii	"ERROR: g_ExtraDisp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
.LC210:
	ASCII(.ascii	"g_ExtraCommand=\000" )
.LC211:
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
	.type	save_file_cnt.17107, %object
	.size	save_file_cnt.17107, 4
save_file_cnt.17107:
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
	.type	save_file_cnt.17101, %object
	.size	save_file_cnt.17101, 4
save_file_cnt.17101:
	.space	4
	.type	g_SaveMetadataFileHandler, %object
	.size	g_SaveMetadataFileHandler, 16
g_SaveMetadataFileHandler:
	.space	16
	.type	save_file_cnt.17095, %object
	.size	save_file_cnt.17095, 4
save_file_cnt.17095:
	.space	4
	.type	g_SaveSegFileHandler, %object
	.size	g_SaveSegFileHandler, 16
g_SaveSegFileHandler:
	.space	16
	.type	save_file_cnt.17077, %object
	.size	save_file_cnt.17077, 4
save_file_cnt.17077:
	.space	4
	.type	g_SaveRawFileHandler, %object
	.size	g_SaveRawFileHandler, 16
g_SaveRawFileHandler:
	.space	16
	.type	save_file_cnt.17071, %object
	.size	save_file_cnt.17071, 4
save_file_cnt.17071:
	.space	4
	.type	g_SaveDispYuvFileHandler, %object
	.size	g_SaveDispYuvFileHandler, 16
g_SaveDispYuvFileHandler:
	.space	16
	.type	g_SaveMemRecord, %object
	.size	g_SaveMemRecord, 24
g_SaveMemRecord:
	.space	24
	.type	SaveFileCnt.17085, %object
	.size	SaveFileCnt.17085, 4
SaveFileCnt.17085:
	.space	4
	.type	g_SaveYuvCount, %object
	.size	g_SaveYuvCount, 4
g_SaveYuvCount:
	.space	4
	.type	last_rec_pos_time.16631, %object
	.size	last_rec_pos_time.16631, 16
last_rec_pos_time.16631:
	.space	16
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 400
g_VfmwChanStat:
	.space	400
	.type	last_rec_pos_time.16642, %object
	.size	last_rec_pos_time.16642, 16
last_rec_pos_time.16642:
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
	.type	ChanPriTab.16958, %object
	.size	ChanPriTab.16958, 16
ChanPriTab.16958:
	.space	16
	.type	g_EventReportFunc, %object
	.size	g_EventReportFunc, 4
g_EventReportFunc:
	.space	4
	.type	PrioArray.16482, %object
	.size	PrioArray.16482, 16
PrioArray.16482:
	.space	16
	.type	Capability.16553, %object
	.size	Capability.16553, 148
Capability.16553:
	.space	148
	.type	PrioArray.16552, %object
	.size	PrioArray.16552, 16
PrioArray.16552:
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
