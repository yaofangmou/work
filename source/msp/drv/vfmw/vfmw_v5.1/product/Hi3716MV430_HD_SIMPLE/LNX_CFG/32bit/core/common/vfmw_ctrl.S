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
	bhi	.L56
	ldr	r5, .L63
	ldr	ip, [r5, r0, asl #2]
	cmp	ip, #0
	beq	.L57
	sub	r2, r1, #61
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L7
.L9:
	.word	.L8
	.word	.L10
	.word	.L11
	.word	.L12
	.word	.L13
.L7:
	ldr	r2, [ip, #144]
	cmp	r2, #0
	beq	.L29
	cmp	r2, #1
	bne	.L58
	ldr	r3, [r5, #164]
	cmp	r3, #0
	beq	.L59
.L32:
	mov	r2, r4
	blx	r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L58:
	str	r3, [sp, #4]
	mov	r1, #968
	str	r2, [sp]
	mov	r0, #0
	ldr	r3, .L63+4
	ldr	r2, .L63+8
	bl	dprint_normal
	mvn	r0, #0
.L51:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L29:
	ldr	r3, [r5, #160]
	cmp	r3, #0
	bne	.L32
	mov	r0, r3
	ldr	r2, .L63+12
	movw	r1, #946
	bl	dprint_normal
	mvn	r0, #0
	b	.L51
.L13:
	mov	r2, #144
	mov	r1, #0
	sub	r0, fp, #172
	str	r3, [fp, #-176]
	bl	memset
	ldr	r3, [fp, #-176]
	cmp	r3, #16
	bne	.L60
	ldr	r3, [r4]
	cmp	r3, #3
	ldrhi	r2, .L63+16
	movwhi	r3, #873
	bhi	.L53
	ldrd	r0, [r4, #8]
	orrs	r2, r0, r1
	beq	.L61
	ldr	r3, [r5, r3, asl #2]
	mov	r4, #1
	str	r4, [fp, #-172]
	mov	r1, r0
	add	r3, r3, #24576
	ldr	lr, .L63+20
	mov	r2, #28
	sub	r0, fp, #156
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
	beq	.L17
	ldr	ip, [fp, #-172]
	mov	r0, r4
	ldr	r3, .L63+24
	movw	r1, #886
	ldr	r2, .L63+28
	str	ip, [sp]
	bl	dprint_normal
	b	.L17
.L8:
	cmp	r3, #152
	beq	.L14
	mov	r2, #152
	str	r3, [sp]
	str	r2, [sp, #4]
	movw	r1, #717
	ldr	r3, .L63+32
	mov	r0, #1
	ldr	r2, .L63+36
	bl	dprint_normal
.L17:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L10:
	cmp	r3, #152
	beq	.L18
	str	r3, [sp]
	mov	r2, #152
	ldr	r3, .L63+40
	movw	r1, #766
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L63+36
	bl	dprint_normal
	b	.L17
.L11:
	cmp	r3, #16
	mov	r1, #0
	str	r1, [fp, #-172]
	str	r1, [fp, #-168]
	str	r1, [fp, #-164]
	str	r1, [fp, #-160]
	beq	.L20
	str	r3, [sp]
	mov	r2, #16
	ldr	r3, .L63+44
	movw	r1, #809
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L63+36
	bl	dprint_normal
	b	.L17
.L12:
	cmp	r3, #16
	mov	r2, #0
	str	r2, [fp, #-172]
	str	r2, [fp, #-168]
	str	r2, [fp, #-164]
	str	r2, [fp, #-160]
	str	r2, [fp, #-156]
	str	r2, [fp, #-152]
	beq	.L22
	str	r3, [sp]
	mov	r2, #16
	ldr	r3, .L63+48
	mov	r1, #836
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L63+36
	bl	dprint_normal
	b	.L17
.L60:
	str	r3, [sp]
	mov	r2, #16
	ldr	r3, .L63+24
	movw	r1, #866
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L63+36
	bl	dprint_normal
	b	.L17
.L14:
	ldr	r6, .L63+20
	mov	r1, #0
	mov	r2, #136
	sub	r0, fp, #172
	mov	r5, r1
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, r4
	ldr	r2, .L63+52
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
	bne	.L62
.L16:
	ldr	r1, [r4, #32]
	sub	r2, fp, #172
	mov	r0, #0
	sub	r1, r1, #1
	clz	r1, r1
	mov	r1, r1, lsr #5
	bl	VMM_SendCommand
	cmp	r0, #0
	beq	.L17
	ldr	r2, [fp, #-132]
	sub	r3, fp, #172
	mov	r1, #752
	str	r3, [sp]
	mov	r0, #1
	ldr	r3, .L63+32
	str	r2, [sp, #4]
	ldr	r2, .L63+56
	bl	dprint_normal
	b	.L17
.L18:
	ldr	r5, .L63+20
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #172
	ldr	r3, [r5, #48]
	blx	r3
	mov	r3, r4
	ldr	r5, [r5, #68]
	mov	r1, #32
	ldr	r2, .L63+52
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
	beq	.L17
	ldr	r2, [fp, #-136]
	sub	r3, fp, #172
	movw	r1, #795
	str	r3, [sp]
	mov	r0, #1
	ldr	r3, .L63+40
	str	r2, [sp, #4]
	ldr	r2, .L63+60
	bl	dprint_normal
	b	.L17
.L20:
	ldrd	r6, [r4]
	sub	r2, fp, #172
	ldrd	r4, [r4, #8]
	mov	r0, #2
	strd	r6, [fp, #-172]
	strd	r4, [fp, #-164]
	bl	VMM_SendCommand
	cmp	r0, #0
	beq	.L17
	ldr	r3, .L63+44
	movw	r1, #822
	ldr	r2, .L63+64
	mov	r0, #1
	bl	dprint_normal
	b	.L17
.L22:
	ldrd	r2, [r4]
	sub	r1, fp, #172
	ldrd	r4, [r4, #8]
	mov	r0, #9
	strd	r2, [fp, #-164]
	strd	r4, [fp, #-156]
	bl	VMM_SendCommandBlock
	cmp	r0, #0
	beq	.L17
	ldr	ip, [fp, #-172]
	movw	r1, #850
	ldr	r3, .L63+48
	mov	r0, #1
	ldr	r2, .L63+68
	str	ip, [sp]
	bl	dprint_normal
	b	.L17
.L61:
	ldr	r2, .L63+72
	movw	r3, #874
.L53:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L63+24
	ldr	r2, .L63+76
	bl	dprint_normal
	b	.L17
.L62:
	mov	r2, #1
	add	r3, r4, #88
	strb	r2, [fp, #-104]
	mov	r1, #32
	ldr	r2, .L63+52
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
	b	.L16
.L59:
	mov	r0, r3
	ldr	r2, .L63+80
	movw	r1, #958
	bl	dprint_normal
	mvn	r0, #0
	b	.L51
.L56:
	ldr	r2, .L63+84
	movw	r3, #929
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L63+4
	str	r2, [sp, #4]
	ldr	r2, .L63+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L51
.L57:
	ldr	r2, .L63+88
	movw	r1, #930
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L63+4
	str	r2, [sp, #4]
	ldr	r2, .L63+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L51
.L64:
	.align	2
.L63:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC14
	.word	.LC12
	.word	.LC9
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+144
	.word	.LC11
	.word	.LANCHOR0+20
	.word	.LC3
	.word	.LANCHOR0+48
	.word	.LANCHOR0+76
	.word	.LANCHOR0+112
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC10
	.word	.LC0
	.word	.LC13
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	2
	.type	VCTRL_SetLastFrameState.part.15, %function
VCTRL_SetLastFrameState.part.15:
	UNWIND(.fnstart)
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
	ldr	r2, .L66
	movw	r3, #6193
	mov	r0, #0
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	ldr	r3, .L66+4
	ldr	r2, .L66+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L67:
	.align	2
.L66:
	.word	.LC9
	.word	.LANCHOR0+180
	.word	.LC0
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState.part.15, .-VCTRL_SetLastFrameState.part.15
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
	ldr	r5, .L118
	ldr	r8, .L118+4
	ldr	r3, [r5]
	blx	r3
	ldr	r2, [r8]
	cmp	r2, #0
	mov	r9, r0
	beq	.L69
	mov	r0, #0
	blx	r2
.L71:
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
.L70:
	mov	r0, #0
	bl	SCDDRV_GetSleepStage
	cmp	r0, #2
	bne	.L111
	mov	r0, #0
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L112
.L75:
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L80
	mov	r0, #0
	blx	r3
.L80:
	ldr	r2, [r8, #24]
	cmp	r2, #0
	beq	.L113
	mov	r0, #0
	blx	r2
	ldr	r2, [r8, #8]
	cmp	r2, #0
	beq	.L114
.L83:
	mov	r0, #0
	blx	r2
.L84:
	ldr	r6, .L118+8
	ldr	r3, [r6, #16]
	cmp	r3, #1
	bne	.L85
	ldr	r3, [r6, #20]
	mov	r2, #2
	str	r2, [r6, #24]
	cmp	r3, #1
	beq	.L87
	ldr	r3, [r5, #120]
	mov	r0, #10
	blx	r3
	mov	r4, #49
	b	.L88
.L115:
	ldr	r3, [r5, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L87
.L88:
	ldr	r3, [r6, #20]
	mov	r0, #10
	cmp	r3, #1
	bne	.L115
.L87:
	mov	r3, #0
	str	r3, [r6, #24]
.L85:
	ldr	r3, [r5]
	blx	r3
	ldr	r2, .L118+12
	movw	r1, #363
	cmp	r9, r0
	rsbls	r3, r9, r0
	mvnhi	r9, r9
	addhi	r3, r9, r0
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L111:
	mov	r0, #0
	mov	r10, r7
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L91
	mov	r6, #1
	mov	r2, r6
.L92:
	tst	r2, r10
	bne	.L75
	subs	r4, r4, #1
	beq	.L116
	ldr	r3, [r5, #120]
	mov	r0, #10
	blx	r3
	eor	r3, r6, #1
	eor	r2, r7, #1
	orrs	r3, r3, r2
	bne	.L70
	b	.L75
.L112:
	mov	r7, #1
	mov	r10, r7
.L91:
	mov	r2, r6
	b	.L92
.L116:
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [fp, #-48]
	str	r6, [sp, #4]
	movw	r1, #270
	str	r7, [sp]
	ldr	r2, .L118+16
	cmp	r3, r0
	rsbls	r3, r3, r0
	ldrhi	r3, [fp, #-48]
	mvnhi	r10, r3
	addhi	r3, r10, r0
	mov	r0, #0
	bl	dprint_normal
	cmp	r7, #1
	beq	.L117
	mov	r3, #0
	ldr	r2, .L118+20
	mov	r0, r3
	mov	r1, #276
	bl	dprint_normal
	mov	r0, #0
	bl	SCDDRV_ForceSleep
	cmp	r6, #1
	beq	.L75
.L94:
	mov	r3, #0
	ldr	r2, .L118+24
	mov	r0, r3
	movw	r1, #285
	bl	dprint_normal
	mov	r0, #0
	bl	VDMDRV_ForceSleep
	b	.L75
.L117:
	cmp	r6, #1
	bne	.L94
	b	.L75
.L69:
	movw	r3, #343
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L118+28
	bl	dprint_normal
	b	.L71
.L113:
	mov	r3, #320
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L118+28
	bl	dprint_normal
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L83
.L114:
	movw	r3, #325
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L118+28
	bl	dprint_normal
	b	.L84
.L119:
	.align	2
.L118:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC16
	.word	.LC15
	UNWIND(.fnend)
	.size	VCTRL_Suspend, .-VCTRL_Suspend
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
	ldr	r6, .L142
	ldr	r4, .L142+4
	ldr	r3, [r6]
	blx	r3
	ldr	r2, [r4, #4]
	cmp	r2, #0
	mov	r7, r0
	beq	.L139
	mov	r0, #0
	blx	r2
	ldr	r2, [r4, #20]
	cmp	r2, #0
	beq	.L140
.L123:
	mov	r0, #0
	blx	r2
.L124:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L125
	mov	r0, #0
	blx	r3
.L125:
	ldr	r5, .L142+8
	mov	r0, #0
	bl	SCDDRV_ExitSleep
	mov	r0, #0
	bl	VDMDRV_ExitSleep
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L126
	ldr	r2, [r5, #20]
	str	r3, [r5, #24]
	cmp	r2, #2
	beq	.L128
	ldr	r3, [r6, #120]
	mov	r0, #10
	blx	r3
	mov	r4, #49
	b	.L129
.L141:
	ldr	r2, [r6, #120]
	blx	r2
	subs	r4, r4, #1
	beq	.L128
.L129:
	ldr	r2, [r5, #20]
	mov	r0, #10
	cmp	r2, #2
	bne	.L141
.L128:
	mov	r3, #0
	str	r3, [r5, #24]
.L126:
	ldr	r3, [r6]
	blx	r3
	ldr	r2, .L142+12
	movw	r1, #426
	cmp	r7, r0
	rsbls	r3, r7, r0
	mvnhi	r3, r7
	addhi	r3, r3, r0
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L139:
	movw	r3, #383
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L142+16
	bl	dprint_normal
	ldr	r2, [r4, #20]
	cmp	r2, #0
	bne	.L123
.L140:
	mov	r3, #388
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L142+16
	bl	dprint_normal
	b	.L124
.L143:
	.align	2
.L142:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1
	.word	.LC20
	.word	.LC15
	UNWIND(.fnend)
	.size	VCTRL_Resume, .-VCTRL_Resume
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
	bhi	.L149
	ldr	ip, .L150
	rsb	r2, r0, r0, lsl #4
	ldr	r4, .L150+4
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
.L149:
	movw	r1, #565
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #32
	ldr	r3, .L150+8
	ldr	r2, .L150+12
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L151:
	.align	2
.L150:
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LANCHOR0+204
	.word	.LC21
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
	ldr	r3, .L154
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L155:
	.align	2
.L154:
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
	ldr	r3, .L157
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L158:
	.align	2
.L157:
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
	beq	.L167
	cmp	r0, #0
	beq	.L163
	cmp	r0, #1
	beq	.L164
	str	r0, [sp]
	movw	r1, #991
	ldr	r3, .L168
	mov	r0, #0
	ldr	r2, .L168+4
	bl	dprint_normal
	mvn	r0, #0
.L161:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L164:
	ldr	r3, .L168+8
	mov	r0, #0
	str	r1, [r3, #164]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L163:
	ldr	r3, .L168+8
	str	r1, [r3, #160]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L167:
	ldr	r2, .L168+12
	movw	r3, #978
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L168
	str	r2, [sp, #4]
	ldr	r2, .L168+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L161
.L169:
	.align	2
.L168:
	.word	.LANCHOR0+224
	.word	.LC23
	.word	.LANCHOR1
	.word	.LC22
	.word	.LC0
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
	ldr	r4, .L171
	mov	r2, #48
	ldr	r3, .L171+4
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
.L172:
	.align	2
.L171:
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
	mov	r3, r1
	bhi	.L179
	ldr	r2, .L181
	ldr	r0, [r2, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L181+4
	movweq	r1, #1155
	beq	.L178
	cmp	r3, #0
	beq	.L180
	ldr	r3, .L181+8
	add	r0, r0, #26112
	add	r0, r0, #192
	mov	r2, #12
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L175:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L179:
	ldr	r2, .L181+12
	movw	r3, #1154
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L181+16
	str	r2, [sp, #4]
	ldr	r2, .L181+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L175
.L180:
	ldr	r2, .L181+24
	movw	r1, #1156
	mov	r0, r3
.L178:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L181+16
	ldr	r2, .L181+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L175
.L182:
	.align	2
.L181:
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LANCHOR0+244
	.word	.LC0
	.word	.LC24
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
	bhi	.L185
	ldr	r3, .L187
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #26112
	addne	r0, r0, #192
	ldmfd	sp, {fp, sp, pc}
.L185:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L188:
	.align	2
.L187:
	.word	.LANCHOR1
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
	mov	r3, r1
	bhi	.L195
	ldr	r2, .L197
	ldr	r0, [r2, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L197+4
	movweq	r1, #1177
	beq	.L194
	cmp	r3, #0
	beq	.L196
	ldr	r3, .L197+8
	add	r0, r0, #26112
	add	r0, r0, #220
	mov	r2, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L191:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L195:
	ldr	r2, .L197+12
	movw	r3, #1176
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L197+16
	str	r2, [sp, #4]
	ldr	r2, .L197+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L191
.L196:
	ldr	r2, .L197+24
	movw	r1, #1178
	mov	r0, r3
.L194:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L197+16
	ldr	r2, .L197+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L191
.L198:
	.align	2
.L197:
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LANCHOR0+272
	.word	.LC0
	.word	.LC25
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
	ldrhi	r2, .L208
	movwhi	r3, #1195
	bhi	.L205
	ldr	r3, .L208+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L206
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L207
	add	r0, r0, #74752
	add	r0, r0, #848
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetSegStreamSize
.L207:
	ldr	r2, .L208+8
	movw	r3, #1197
.L205:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L208+12
	ldr	r2, .L208+16
	bl	dprint_normal
.L202:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L206:
	ldr	r2, .L208+20
	movw	r1, #1196
	ldr	r3, .L208+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L208+16
	bl	dprint_normal
	b	.L202
.L209:
	.align	2
.L208:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC26
	.word	.LANCHOR0+304
	.word	.LC0
	.word	.LC2
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
	mov	r3, #0
	str	r3, [fp, #-28]
	str	r3, [fp, #-24]
	movwhi	r1, #1209
	ldrhi	r2, .L221
	bhi	.L217
	ldr	r2, .L221+4
	ldr	r0, [r2, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L221+8
	movweq	r1, #1210
	beq	.L219
	ldr	r2, [r0, #16]
	cmp	r2, #1
	bne	.L220
	add	r4, r0, #26368
	sub	r1, fp, #28
	add	r4, r4, #56
	mov	r0, r4
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L218
	mov	r0, r4
	sub	r1, fp, #24
	bl	GetRawStreamSize
	cmp	r0, #0
	bne	.L218
	ldr	ip, [fp, #-24]
	movw	r1, #1218
	ldr	r3, [fp, #-28]
	mov	r0, #20
	ldr	r2, .L221+12
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L218
	ldr	r0, [fp, #-24]
	cmp	r0, #3
	movgt	r0, #0
	mvnle	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L220:
	ldr	r2, .L221+16
	movw	r1, #1211
.L217:
	mov	r0, r3
.L219:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L221+20
	ldr	r2, .L221+24
	bl	dprint_normal
.L218:
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L222:
	.align	2
.L221:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC27
	.word	.LC28
	.word	.LC26
	.word	.LANCHOR0+324
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
	cmp	r0, #3
	mov	r2, #0
	str	r2, [fp, #-20]
	str	r2, [fp, #-16]
	movwhi	r1, #1234
	ldrhi	ip, .L231
	bhi	.L228
	ldr	r3, .L231+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L229
	ldr	r1, [r0, #16]
	cmp	r1, #1
	bne	.L230
	add	r0, r0, #74752
	sub	r2, fp, #16
	add	r0, r0, #848
	sub	r1, fp, #20
	bl	GetFreshSegStream
	ldr	ip, [fp, #-16]
	ldr	r3, [fp, #-20]
	movw	r1, #1241
	ldr	r2, .L231+8
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	ldr	r0, [fp, #-20]
	cmp	r0, #0
	movgt	r0, #0
	mvnle	r0, #0
.L225:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L230:
	ldr	ip, .L231+12
	movw	r1, #1236
.L228:
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L231+16
	str	ip, [sp, #4]
	ldr	r2, .L231+20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L229:
	ldr	r2, .L231+24
	movw	r1, #1235
	ldr	r3, .L231+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L231+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L225
.L232:
	.align	2
.L231:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC29
	.word	.LC26
	.word	.LANCHOR0+344
	.word	.LC0
	.word	.LC27
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
	cmp	r0, #3
	mov	r4, r0
	mov	r3, r1
	bhi	.L240
	ldr	r5, .L242
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L242+4
	movweq	r1, #1254
	beq	.L239
	cmp	r3, #0
	beq	.L241
	ldr	r3, .L242+8
	add	r0, r0, #207872
	mov	r2, #8
	add	r0, r0, #440
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mov	r0, #0
	add	r3, r3, #204800
	ldr	r2, [r3, #3512]
	sub	r2, r2, #1
	cmp	r2, #1
	strhi	r0, [r3, #3512]
.L235:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L240:
	ldr	r2, .L242+12
	movw	r3, #1253
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L242+16
	str	r2, [sp, #4]
	ldr	r2, .L242+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L235
.L241:
	ldr	r2, .L242+24
	movw	r1, #1255
	mov	r0, r3
.L239:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L242+16
	ldr	r2, .L242+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L235
.L243:
	.align	2
.L242:
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LANCHOR0+364
	.word	.LC0
	.word	.LC30
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
	beq	.L263
	ldr	r4, [r5, #12]
	cmp	r4, #0
	beq	.L264
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L265
.L249:
	ldr	r4, [r5, #16]
	cmp	r4, #0
	beq	.L266
.L250:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L267
.L251:
	ldr	r4, [r5, #20]
	cmp	r4, #0
	beq	.L268
.L252:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #8]
	cmp	r3, #1
	beq	.L269
.L253:
	ldr	r3, .L270
	ldr	r0, [r4, #4]
	ldr	r3, [r3, #164]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L269:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L253
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L267:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L251
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r4, [r5, #20]
	cmp	r4, #0
	bne	.L252
.L268:
	ldr	r3, .L270+4
	movw	r1, #1566
	ldr	r2, .L270+8
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L265:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L249
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	ldr	r4, [r5, #16]
	cmp	r4, #0
	bne	.L250
.L266:
	mov	r0, r4
	ldr	r3, .L270+12
	ldr	r2, .L270+16
	movw	r1, #1544
	bl	dprint_normal
	b	.L251
.L264:
	mov	r0, r4
	ldr	r3, .L270+20
	ldr	r2, .L270+24
	movw	r1, #1522
	bl	dprint_normal
	b	.L249
.L263:
	mov	r0, r5
	ldr	r3, .L270+28
	ldr	r2, .L270+32
	movw	r1, #1588
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L271:
	.align	2
.L270:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+464
	.word	.LC34
	.word	.LANCHOR0+440
	.word	.LC33
	.word	.LANCHOR0+416
	.word	.LC32
	.word	.LANCHOR0+392
	.word	.LC31
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
	mov	r3, r1
	bhi	.L280
	ldr	r2, .L283
	ldr	r1, [r2, r0, asl #2]
	cmp	r1, #0
	beq	.L281
	cmp	r3, #0
	beq	.L282
	ldr	ip, .L283+4
	add	r1, r1, #206848
	mov	r0, r3
	add	r1, r1, #408
	mov	r2, #156
	ldr	r3, [ip, #52]
	blx	r3
	mov	r0, #0
.L276:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L280:
	ldr	r2, .L283+8
	movw	r3, #2387
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L283+12
	str	r2, [sp, #4]
	ldr	r2, .L283+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L276
.L282:
	ldr	r2, .L283+20
	mov	r0, r3
	movw	r1, #2389
	str	r1, [sp]
.L279:
	str	r2, [sp, #4]
	ldr	r3, .L283+12
	ldr	r2, .L283+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L276
.L281:
	movw	r3, #2388
	mov	r0, r1
	ldr	r2, .L283+24
	mov	r1, r3
	str	r3, [sp]
	b	.L279
.L284:
	.align	2
.L283:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LANCHOR0+488
	.word	.LC0
	.word	.LC35
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
	ldr	r3, .L299
	ldr	r2, [r1, #8]
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	ldr	r0, [r3, #2464]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2484]
	ldr	r2, [r1, #28]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2480]
	ldr	r2, [r1, #24]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2488]
	ldr	r2, [r1, #32]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2492]
	ldr	r2, [r1, #36]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2496]
	ldr	r2, [r1, #40]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2512]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2596]
	ldr	r2, [r1, #140]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2524]
	ldr	r2, [r1, #68]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2520]
	ldr	r2, [r1, #64]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2516]
	ldr	r2, [r1, #60]
	cmp	r0, r2
	bne	.L298
	ldr	r0, [r3, #2528]
	ldr	r2, [r1, #72]
	cmp	r0, r2
	bne	.L298
	ldr	r3, [r3, #2588]
	ldr	r0, [r1, #132]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L298:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L300:
	.align	2
.L299:
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
	ldr	r3, .L308
	mov	r5, r1
	ldr	r4, [r3, r0, asl #2]
	ldr	r3, [r4, #128]
	cmp	r3, #22
	beq	.L306
	bl	VCTRL_CheckCommonParameter
	cmp	r0, #0
	bne	.L306
	add	r4, r4, #204800
	ldr	r3, [r4, #2464]
	cmp	r3, #1
	beq	.L307
	sub	r3, r3, #10
	cmp	r3, #2
	ldmhifd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #2468]
	ldr	r0, [r5, #12]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L307:
	ldr	r2, [r4, #2468]
	ldr	r3, [r5, #12]
	cmp	r2, r3
	bne	.L306
	ldr	r3, [r4, #2472]
	ldr	r0, [r5, #16]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L306:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L309:
	.align	2
.L308:
	.word	.LANCHOR1
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
	ldr	r3, .L311
	mvn	r2, #0
	ldr	r1, [r1, #56]
	mov	ip, #0
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	str	r1, [r3, #2512]
	str	ip, [r3, #3248]
	str	r2, [r3, #3252]
	str	r2, [r3, #3256]
	ldmfd	sp, {fp, sp, pc}
.L312:
	.align	2
.L311:
	.word	.LANCHOR1
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
	ble	.L314
	ldr	r2, [r1, #108]
	cmp	r2, #0
	ble	.L314
	ldr	r2, .L316
	ldr	r2, [r2, r0, asl #2]
	add	r2, r2, #204800
	str	r3, [r2, #2560]
	ldr	r3, [r1, #108]
	str	r3, [r2, #2564]
	ldmfd	sp, {fp, sp, pc}
.L314:
	ldr	r3, .L316
	mov	r1, #1920
	mov	r2, #1088
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	str	r1, [r3, #2560]
	str	r2, [r3, #2564]
	ldmfd	sp, {fp, sp, pc}
.L317:
	.align	2
.L316:
	.word	.LANCHOR1
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
	bhi	.L323
	ldr	r3, .L325
	ldr	r1, [r3, r0, asl #2]
	cmp	r1, #0
	beq	.L324
	add	r1, r1, #128
	mov	r0, #3
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L322
	mov	r1, r5
	mov	r0, r4
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L320:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L322:
	mvn	r0, #0
	b	.L320
.L323:
	ldr	r2, .L325+4
	movw	r3, #2758
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L325+8
	str	r2, [sp, #4]
	ldr	r2, .L325+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L320
.L324:
	ldr	r2, .L325+16
	movw	r3, #2759
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L325+8
	str	r2, [sp, #4]
	ldr	r2, .L325+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L320
.L326:
	.align	2
.L325:
	.word	.LANCHOR1
	.word	.LC9
	.word	.LANCHOR0+508
	.word	.LC0
	.word	.LC36
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
	ldr	r3, .L336
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L334
	ldr	r3, [r0, #128]
	cmp	r3, #2
	beq	.L330
	cmp	r3, #3
	beq	.L331
	cmp	r3, #0
	beq	.L335
.L327:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L331:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L335:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L330:
	add	r1, r0, #206848
	add	r0, r0, #207872
	add	r1, r1, #624
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L334:
	ldr	r2, .L336+4
	movw	r1, #2780
	ldr	r3, .L336+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L336+12
	bl	dprint_normal
	b	.L327
.L337:
	.align	2
.L336:
	.word	.LANCHOR1
	.word	.LC2
	.word	.LANCHOR0+524
	.word	.LC0
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
	bhi	.L342
	ldr	r2, .L344
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L343
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L340:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L342:
	ldr	r2, .L344+4
	movw	r3, #2895
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L344+8
	str	r2, [sp, #4]
	ldr	r2, .L344+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L340
.L343:
	ldr	r2, .L344+16
	mov	r1, #2896
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L344+8
	str	r2, [sp, #4]
	ldr	r2, .L344+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L340
.L345:
	.align	2
.L344:
	.word	.LANCHOR1
	.word	.LC37
	.word	.LANCHOR0+544
	.word	.LC0
	.word	.LC38
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
	bhi	.L349
	ldr	r3, .L350
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L349
	ldrd	r0, [r3, #8]
	ldmfd	sp, {fp, sp, pc}
.L349:
	mvn	r0, #0
	mvn	r1, #0
	ldmfd	sp, {fp, sp, pc}
.L351:
	.align	2
.L350:
	.word	.LANCHOR1
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #3
	mov	r4, r0
	mov	r6, r1
	ldrhi	r2, .L375
	movwhi	r3, #3154
	bhi	.L368
	ldr	r8, .L375+4
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L375+8
	movweq	r1, #3155
	beq	.L369
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L370
	cmp	r6, #0
	beq	.L371
	ldr	r7, .L375+12
	mov	r0, #4
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r0, [r8, r4, asl #2]
	cmp	r0, #0
	beq	.L358
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L358
	add	r0, r0, #207872
	mov	r1, r6
	add	r0, r0, #480
	bl	SYNTAX_ReceiveImage
	mov	r5, r0
	mov	r0, #9
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L372
.L361:
	cmp	r5, #1
	beq	.L373
.L363:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	subs	r0, r5, #1
	mvnne	r0, #0
.L354:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L372:
	ldr	r3, [r7]
	blx	r3
	add	r1, r8, r4, lsl #2
	ldr	r2, .L375+16
	ldr	r3, [r1, #184]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L361
	mov	r2, r4, asl #24
	str	r0, [r1, #184]
	add	r2, r2, #589824
	movw	r1, #3197
	cmp	r5, #1
	addeq	r2, r2, #1
	ldr	r0, .L375+20
	bl	DBG_AddTrace
	b	.L361
.L373:
	ldr	r3, [r8, r4, asl #2]
	mov	r2, #100
	mla	r4, r2, r4, r8
	ldr	r1, [r6, #156]
	add	r2, r3, #24576
	str	r1, [r2, #1764]
	add	r4, r4, #232
	ldr	r2, [r6, #152]
	str	r2, [r3, #136]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L374
.L364:
	ldr	r2, [r6, #444]
	movw	r3, #3211
	ldr	lr, [r6, #88]
	mov	r1, r3
	ldr	ip, [r6, #276]
	mov	r0, #26
	str	r3, [sp]
	ldr	r3, .L375+24
	stmib	sp, {r2, ip, lr}
	ldr	r2, .L375+28
	bl	dprint_normal
	b	.L363
.L374:
	ldr	r3, [r7]
	blx	r3
	str	r0, [r4, #4]
	b	.L364
.L358:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L370:
	ldr	r2, .L375+32
	movw	r3, #3156
.L368:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L375+24
	ldr	r2, .L375+36
	bl	dprint_normal
	mvn	r0, #0
	b	.L354
.L371:
	ldr	r2, .L375+40
	movw	r1, #3157
	mov	r0, r6
.L369:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L375+24
	ldr	r2, .L375+36
	bl	dprint_normal
	mvn	r0, #0
	b	.L354
.L376:
	.align	2
.L375:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TraceImgPeriod
	.word	.LANCHOR0+584
	.word	.LANCHOR0+564
	.word	.LC41
	.word	.LC39
	.word	.LC0
	.word	.LC40
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
	mov	r4, r0
	mov	r6, r1
	ldrhi	r2, .L397
	movwhi	r3, #3225
	bhi	.L390
	ldr	r7, .L397+4
	ldr	r0, [r7, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L397+8
	movweq	r1, #3226
	beq	.L391
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L392
	cmp	r6, #0
	beq	.L393
	ldr	r8, .L397+12
	mov	r0, #4
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r5, [r7, r4, asl #2]
	cmp	r5, #0
	beq	.L394
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L395
	add	r0, r5, #207872
	mov	r1, r6
	add	r0, r0, #480
	bl	SYNTAX_ReleaseImage
	mov	r5, r0
	mov	r0, #10
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L396
.L386:
	cmp	r5, #1
	beq	.L388
	ldr	r2, [r6, #444]
	movw	r3, #3282
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #26
	ldr	r3, .L397+16
	str	r2, [sp, #4]
	ldr	r2, .L397+20
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r4
	bl	FSP_UnMarkImageOutHanging
.L389:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	subs	r0, r5, #1
	mvnne	r0, #0
.L379:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L396:
	ldr	r3, [r8]
	add	r7, r7, r4, lsl #2
	blx	r3
	ldr	r2, .L397+24
	ldr	r3, [r7, #600]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L386
	mov	r2, r4, asl #24
	str	r0, [r7, #600]
	add	r2, r2, #655360
	movw	r1, #3275
	cmp	r5, #1
	addeq	r2, r2, #1
	ldr	r0, .L397+28
	bl	DBG_AddTrace
	b	.L386
.L388:
	ldr	r2, [r6, #444]
	movw	r3, #3287
	ldr	ip, [r6, #88]
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #26
	ldr	r3, .L397+16
	stmib	sp, {r2, ip}
	ldr	r2, .L397+32
	bl	dprint_normal
	b	.L389
.L395:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	movw	r3, #3243
	mov	r1, r3
	ldr	r2, .L397+36
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L379
.L392:
	ldr	r2, .L397+40
	movw	r3, #3227
.L390:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L397+16
	ldr	r2, .L397+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L379
.L393:
	ldr	r2, .L397+48
	movw	r1, #3228
	mov	r0, r6
.L391:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L397+16
	ldr	r2, .L397+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L379
.L394:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	movw	r3, #3235
	mov	r0, r5
	mov	r1, r3
	ldr	r2, .L397+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L379
.L398:
	.align	2
.L397:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+604
	.word	.LC44
	.word	g_TraceImgPeriod
	.word	.LANCHOR0+628
	.word	.LC45
	.word	.LC43
	.word	.LC39
	.word	.LC0
	.word	.LC40
	.word	.LC42
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
	bhi	.L400
	ldr	r3, .L404
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L400
	ldr	r2, [r3, #16]
	cmp	r2, #1
	beq	.L403
	movw	r3, #3307
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L404+4
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #22
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L400:
	movw	r3, #3301
	ldr	r2, .L404+8
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #22
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L403:
	ldr	r0, [r3, #128]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L405:
	.align	2
.L404:
	.word	.LANCHOR1
	.word	.LC47
	.word	.LC46
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
	bhi	.L411
	ldr	r3, .L414
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L412
	cmp	r1, #0
	beq	.L413
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
.L406:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L411:
	ldr	r2, .L414+4
	movw	r3, #3316
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L414+8
	str	r2, [sp, #4]
	ldr	r2, .L414+12
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L412:
	ldr	r2, .L414+16
	movw	r1, #3317
	ldr	r3, .L414+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L414+12
	bl	dprint_normal
	b	.L406
.L413:
	ldr	r2, .L414+20
	movw	r3, #3318
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L414+8
	str	r2, [sp, #4]
	ldr	r2, .L414+12
	bl	dprint_normal
	b	.L406
.L415:
	.align	2
.L414:
	.word	.LANCHOR1
	.word	.LC9
	.word	.LANCHOR0+652
	.word	.LC0
	.word	.LC2
	.word	.LC48
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
	bhi	.L426
	ldr	r3, .L431
	ldr	r5, [r3, r0, asl #2]
	cmp	r5, #0
	moveq	r3, r5
	beq	.L417
	ldr	r3, [r5, #16]
	cmp	r3, #1
	beq	.L430
.L426:
	mov	r3, #0
.L417:
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L430:
	ldr	r3, [r5, #20]
	cmp	r3, #1
	bne	.L426
	ldr	r3, [r5, #128]
	cmp	r3, #2
	beq	.L419
	cmp	r3, #3
	beq	.L420
	cmp	r3, #0
	addeq	r3, r5, #204800
	ldreq	r4, [r3, #3920]
	beq	.L422
	str	r3, [sp]
	movw	r1, #3461
	ldr	r3, .L431+4
	mov	r0, #0
	ldr	r2, .L431+8
	bl	dprint_normal
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L420:
	add	r3, r5, #204800
	ldr	r4, [r3, #3592]
.L422:
	cmp	r4, #0
	beq	.L427
	ldr	r3, .L431+12
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r5, #40]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L419:
	add	r3, r5, #208896
	ldr	r4, [r3, #500]
	b	.L422
.L427:
	mov	r3, r4
	b	.L417
.L432:
	.align	2
.L431:
	.word	.LANCHOR1
	.word	.LANCHOR0+676
	.word	.LC49
	.word	vfmw_Osal_Func_Ptr_S
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
	beq	.L439
	cmp	r0, #0
	ldreqb	r0, [r4, #936]	@ zero_extendqisi2
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L439:
	ldr	r2, .L440
	movw	r1, #3480
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L441:
	.align	2
.L440:
	.word	.LC50
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #3
	mov	r4, r0
	bhi	.L443
	ldr	r6, .L454
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L443
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L446
	ldr	r7, [r3, #20]
	cmp	r7, #1
	beq	.L447
.L446:
	mov	r3, r4
	ldr	r2, .L454+4
	movw	r1, #3519
	mov	r0, #20
	bl	dprint_normal
	mov	r5, #0
.L445:
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L443:
	movw	r3, #3513
	str	r4, [sp]
	mov	r1, r3
	ldr	r2, .L454+8
	mov	r0, #20
	mov	r5, #0
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L447:
	bl	VCTRL_GetDecParam
	subs	r8, r0, #0
	beq	.L452
	ldr	r2, [r6, r4, asl #2]
	mov	r3, #0
	mov	r5, r3
	str	r3, [r2, #108]
	str	r3, [r2, #112]
	b	.L445
.L452:
	ldr	r9, [r6, r4, asl #2]
	ldr	r3, .L454+12
	ldr	r5, [r9, #108]
	cmp	r5, #0
	beq	.L453
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [r3, #112]
	cmp	r0, r2
	bls	.L450
	rsb	r0, r2, r0
	cmp	r0, #40
	movls	r5, r8
	bls	.L445
.L450:
	str	r8, [r3, #108]
	mov	r5, r7
	str	r8, [r3, #112]
	b	.L445
.L453:
	str	r7, [r9, #108]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r9, #112]
	b	.L445
.L455:
	.align	2
.L454:
	.word	.LANCHOR1
	.word	.LC52
	.word	.LC51
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
	bhi	.L466
	ldr	r3, .L468
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L467
	ldr	r3, [r0, #128]
	cmp	r3, #2
	beq	.L461
	cmp	r3, #3
	beq	.L462
	cmp	r3, #0
	addeq	r0, r0, #204800
	streq	r3, [r0, #3920]
	beq	.L456
	str	r3, [sp]
	movw	r1, #3989
	ldr	r3, .L468+4
	mov	r0, #1
	ldr	r2, .L468+8
	bl	dprint_normal
.L456:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L466:
	ldr	r2, .L468+12
	movw	r3, #3887
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L468+4
	str	r2, [sp, #4]
	ldr	r2, .L468+16
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L462:
	add	r0, r0, #204800
	mov	r3, #0
	str	r3, [r0, #3592]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L461:
	add	r0, r0, #208896
	mov	r3, #0
	str	r3, [r0, #500]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L467:
	ldr	r2, .L468+20
	mov	r1, #3888
	ldr	r3, .L468+4
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L468+16
	bl	dprint_normal
	b	.L456
.L469:
	.align	2
.L468:
	.word	.LANCHOR1
	.word	.LANCHOR0+696
	.word	.LC54
	.word	.LC53
	.word	.LC0
	.word	.LC38
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
	cmp	r0, #3
	mov	r4, r0
	mov	r6, r1
	ldrhi	r2, .L481
	movwhi	r3, #4014
	bhi	.L479
	ldr	r5, .L481+4
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L480
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L474
	ldr	r2, .L481+8
	mov	r3, #4016
.L479:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L481+12
	ldr	r2, .L481+16
	bl	dprint_normal
.L470:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L474:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L470
	ldr	r0, [r5, r4, asl #2]
	ldr	r3, [r0, #128]
	cmp	r3, #0
	bne	.L470
	add	r0, r0, #207872
	mov	r1, r6
	add	r0, r0, #488
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	H264DEC_VDMProcSedOnly
.L480:
	ldr	r2, .L481+20
	movw	r1, #4015
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L481+12
	str	r2, [sp, #4]
	ldr	r2, .L481+16
	bl	dprint_normal
	b	.L470
.L482:
	.align	2
.L481:
	.word	.LC53
	.word	.LANCHOR1
	.word	.LC55
	.word	.LANCHOR0+716
	.word	.LC0
	.word	.LC39
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
	ldrhi	r2, .L497
	movwhi	r3, #4051
	bhi	.L493
	ldr	r3, .L497+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L494
	ldr	r3, [r0, #20]
	cmp	r3, #1
	bne	.L495
	ldr	r3, [r0, #128]
	cmp	r3, #2
	beq	.L489
	cmp	r3, #3
	beq	.L490
	cmp	r3, #0
	beq	.L496
	str	r3, [sp]
	mov	r1, #4160
	ldr	r3, .L497+8
	mov	r0, #0
	ldr	r2, .L497+12
	bl	dprint_normal
	mov	r0, #0
.L485:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L490:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L496:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L489:
	add	r0, r0, #207872
	add	r0, r0, #488
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L495:
	ldr	r2, .L497+16
	movw	r3, #4053
.L493:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L497+8
	ldr	r2, .L497+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L485
.L494:
	ldr	r2, .L497+24
	movw	r1, #4052
	ldr	r3, .L497+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L497+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L485
.L498:
	.align	2
.L497:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LANCHOR0+740
	.word	.LC56
	.word	.LC55
	.word	.LC0
	.word	.LC36
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
	ldrhi	r2, .L509
	movwhi	r3, #4169
	bhi	.L505
	ldr	r3, .L509+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movweq	r1, #4170
	ldreq	r2, .L509+8
	streq	r1, [sp]
	beq	.L506
	ldr	r2, [r0, #16]
	cmp	r2, #1
	bne	.L507
	cmp	r1, #0
	beq	.L508
	ldr	r2, [r1]
	add	r3, r0, #204800
	mov	r0, #0
	str	r2, [r3, #3264]
.L501:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L507:
	ldr	r2, .L509+12
	movw	r3, #4171
.L505:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L509+16
	ldr	r2, .L509+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L501
.L508:
	ldr	r2, .L509+24
	movw	r3, #4172
	mov	r0, r1
	mov	r1, r3
	str	r3, [sp]
.L506:
	str	r2, [sp, #4]
	ldr	r3, .L509+16
	ldr	r2, .L509+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L501
.L510:
	.align	2
.L509:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC36
	.word	.LC57
	.word	.LANCHOR0+764
	.word	.LC0
	.word	.LC58
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
	ldrhi	r2, .L521
	bhi	.L517
	ldr	r3, .L521+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L518
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L519
	cmp	r2, #0
	beq	.L520
	ldr	r3, .L521+8
	add	r0, r0, #207872
	add	r0, r0, #228
	mov	r2, #24
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L513:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L519:
	ldr	r2, .L521+12
	movw	r3, #4183
.L517:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L521+16
	ldr	r2, .L521+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L513
.L520:
	ldr	ip, .L521+24
	movw	r1, #4184
	mov	r0, r2
	str	r1, [sp]
	ldr	r3, .L521+16
	str	ip, [sp, #4]
	ldr	r2, .L521+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L513
.L518:
	ldr	r2, .L521+28
	movw	r1, #4182
	ldr	r3, .L521+16
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L521+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L513
.L522:
	.align	2
.L521:
	.word	.LC9
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	.LANCHOR0+788
	.word	.LC0
	.word	.LC58
	.word	.LC36
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
	bhi	.L530
	ldr	r3, .L531
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L529
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L529
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L529
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L529
	ldr	r0, [r3, #128]
	cmp	r0, #22
	movne	r0, #0
	mvneq	r0, #0
.L525:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L529:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L530:
	ldr	r2, .L531+4
	movw	r3, #4193
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L531+8
	str	r2, [sp, #4]
	ldr	r2, .L531+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L525
.L532:
	.align	2
.L531:
	.word	.LANCHOR1
	.word	.LC9
	.word	.LANCHOR0+808
	.word	.LC0
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
	ldr	r8, .L541
	mov	r3, #0
	mov	r6, r0
	mov	r7, r1
	mov	r4, r3
	str	r3, [r0]
	str	r3, [r1]
.L538:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	beq	.L540
.L535:
	add	r4, r4, #1
	cmp	r4, #4
	bne	.L538
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L540:
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
	b	.L535
.L542:
	.align	2
.L541:
	.word	.LANCHOR1
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
	blt	.L544
	ldr	r3, [r0, #44]
	cmp	r3, #262144
	blt	.L544
	ldr	r3, [r0, #36]
	cmp	r3, #1
	beq	.L548
.L547:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L548:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L544
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bgt	.L547
.L544:
	ldr	r3, .L549
	movw	r1, #4217
	ldr	r2, .L549+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L550:
	.align	2
.L549:
	.word	.LANCHOR0+828
	.word	.LC59
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
	beq	.L552
	ldr	lr, [r1, #12]
	mov	r3, #4000
	ldr	r5, [r1, #20]
	cmp	lr, #0
	ldr	ip, [r1, #24]
	movwgt	r0, #4060
	movle	lr, #136
	mulgt	r4, r0, lr
	str	lr, [r1, #12]
	mov	r0, #2208
	movwle	r4, #27872
	mul	r1, r3, r5
	ldr	r3, [r2, #8]
	mla	r0, r0, ip, r1
	movtle	r4, 8
	add	r0, r0, r4
	cmp	r0, #0
	addcs	r0, r3, r0
	addcc	r0, r3, #0
.L552:
	str	r0, [r2, #8]
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
	ldreq	r2, .L569
	moveq	r0, r4
	beq	.L566
	cmp	r5, #0
	beq	.L567
	cmp	r3, #2
	beq	.L560
	ldr	r2, .L569+4
	ldr	r3, [r4, #28]
	ldr	ip, [r4, #48]
	ldr	r0, [r2, #616]
	ldr	lr, [r2, #620]
	add	r1, r3, r0
	cmp	r1, #16
	add	r2, ip, lr
	movge	r1, #16
	orrs	r7, r1, r2
	strpl	r1, [r4, #28]
	strpl	r2, [r4, #48]
	bmi	.L568
.L560:
	mov	r0, r4
	bl	VCTRL_VarifyOption
	cmp	r0, #0
	bne	.L558
	mov	r2, r5
	mov	r1, r4
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_GetMemSize_onDecode
.L567:
	ldr	r2, .L569+8
	movw	r1, #4282
	mov	r0, r5
.L566:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L569+12
	ldr	r2, .L569+16
	bl	dprint_normal
.L558:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L568:
	str	r0, [sp]
	movw	r1, #4291
	stmib	sp, {ip, lr}
	mov	r0, #32
	ldr	r2, .L569+20
	bl	dprint_normal
	b	.L558
.L570:
	.align	2
.L569:
	.word	.LC60
	.word	.LANCHOR1
	.word	.LC61
	.word	.LANCHOR0+848
	.word	.LC0
	.word	.LC62
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
	ldr	r7, .L577
	ldr	r6, .L577+4
	mov	r0, #0
	ldr	r4, .L577+8
	ldr	r8, [r7, #200]
	ldr	r9, [r6]
	bl	VFMW_GetString
	add	r5, r4, #624
	ldr	r1, .L577+12
	str	r5, [sp]
	mov	r2, r9
	mov	r3, r0
	mov	r0, #127
	blx	r8
	subs	r8, r0, #0
	bne	.L575
	mov	r0, #4
	ldr	r9, [r6]
	ldr	r7, [r7, #200]
	mov	r6, #1
	str	r6, [r4, #168]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r2, r9
	ldr	r1, .L577+16
	mov	r3, r0
	mov	r0, #136
	blx	r7
	cmp	r0, #0
	streq	r6, [r4, #172]
	bne	.L576
.L573:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L575:
	mov	r3, #127
	ldr	r2, .L577+20
	movw	r1, #4314
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L573
.L576:
	mov	r0, r8
	mov	r3, #136
	ldr	r2, .L577+20
	movw	r1, #4322
	bl	dprint_normal
	mvn	r0, #0
	b	.L573
.L578:
	.align	2
.L577:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	VCTRL_Isr_0
	.word	VCTRL_Scd_Isr
	.word	.LC63
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
	ldr	r4, .L583
	ldr	r3, [r4, #168]
	cmp	r3, #1
	beq	.L582
.L580:
	ldr	r3, [r4, #172]
	ldr	r4, .L583
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L583+4
	mov	r0, #4
	ldr	r5, [r3, #204]
	bl	VFMW_GetString
	add	r2, r4, #624
	mov	r1, r0
	mov	r0, #136
	blx	r5
	mov	r3, #0
	str	r3, [r4, #172]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L582:
	ldr	r3, .L583+4
	mov	r0, #0
	ldr	r5, [r3, #204]
	bl	VFMW_GetString
	add	r2, r4, #624
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #168]
	b	.L580
.L584:
	.align	2
.L583:
	.word	.LANCHOR1
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
	bne	.L588
	ldr	r2, [r4, #88]
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #80]
	bl	MEM_AddMemRecord
.L587:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L588:
	mov	r3, #0
	ldr	r2, .L589
	movt	r3, 63683
	movw	r1, #4377
	mov	r0, #0
	mvn	r5, #0
	bl	dprint_normal
	b	.L587
.L590:
	.align	2
.L589:
	.word	.LC64
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
	beq	.L592
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L596
	add	r0, r4, #72
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
.L592:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_DelMemRecord
.L597:
	.align	2
.L596:
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
	ldr	r7, .L609
	mov	r4, r0
	mov	r0, #15
	ldr	r6, .L609+4
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
	beq	.L599
	mov	r0, r5
	blx	r3
	subs	r2, r0, #0
	ble	.L599
	str	r5, [r4, #20]
	sub	r0, fp, #76
	str	r5, [sp]
	mov	r3, r4
	mov	r1, r5
	bl	MEM_AllocMemBlock
	subs	r8, r0, #0
	bne	.L600
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
	beq	.L601
	sub	r0, fp, #56
	blx	r3
	subs	r4, r0, #0
	bne	.L601
	bl	VDMDRV_Init
.L602:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L599:
	mov	r3, #0
	ldr	r2, .L609+8
	mov	r0, r3
	movw	r1, #4482
	bl	dprint_normal
	mvn	r4, #0
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L601:
	mov	r3, #0
	ldr	r2, .L609+12
	mov	r0, r3
	movw	r1, #4510
	bl	dprint_normal
	mvn	r4, #0
	b	.L602
.L600:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L609+16
	movw	r1, #4496
	bl	dprint_normal
	mvn	r4, #0
	b	.L602
.L610:
	.align	2
.L609:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LC65
	.word	.LC67
	.word	.LC66
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
	beq	.L619
	ldr	r3, [r0, #64]
	adds	r5, r3, #0
	movne	r5, #1
.L612:
	ldr	r6, [r4, #16]
	ldr	r7, [r4, #8]
	cmp	r6, #0
	ldr	r8, [r4, #4]
	beq	.L613
	ldr	r3, .L626
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L625
	mov	r0, #0
	blx	r2
.L618:
	cmp	r5, #0
	beq	.L616
.L617:
	ldr	r3, .L626+4
	mov	r0, r4
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
.L613:
	mov	r2, r6
	mov	r1, r8
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MEM_DelMemRecord
.L625:
	movw	r3, #4550
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L626+8
	bl	dprint_normal
	b	.L618
.L616:
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	b	.L617
.L619:
	mov	r5, r3
	b	.L612
.L627:
	.align	2
.L626:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC15
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
	ldr	r3, .L632
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
	bne	.L629
	ldr	r2, [r4, #40]
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_AddMemRecord
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #32]
	mov	r2, r6
	bl	SM_OpenSCDDrv
	subs	r4, r0, #0
	bne	.L630
	bl	SM_InstInit
.L631:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L629:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L632+4
	movw	r1, #4592
	bl	dprint_normal
	mvn	r4, #0
	b	.L631
.L630:
	mov	r3, r6
	mov	r0, r6
	ldr	r2, .L632+8
	movw	r1, #4600
	bl	dprint_normal
	mvn	r4, #0
	b	.L631
.L633:
	.align	2
.L632:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC68
	.word	.LC69
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
	beq	.L635
	ldr	r3, [r0, #64]
	cmp	r3, #0
	beq	.L635
	ldr	r5, [r0, #40]
	ldr	r7, [r0, #32]
	cmp	r5, #0
	ldr	r6, [r0, #28]
	bne	.L646
.L639:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r7
	bl	MEM_DelMemRecord
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_InstInit
.L635:
	ldr	r5, [r4, #40]
	ldr	r7, [r4, #32]
	cmp	r5, #0
	ldr	r6, [r4, #28]
	beq	.L639
	mov	r0, #0
	add	r8, r4, #24
	bl	SM_CloseSCDDrv
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_ReleaseMemBlock
.L637:
	ldr	r3, .L647
	mov	r0, r8
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L639
.L646:
	mov	r0, #0
	add	r8, r4, #24
	bl	SM_CloseSCDDrv
	b	.L637
.L648:
	.align	2
.L647:
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
	ldr	r2, .L656
	mov	r3, r5
	movw	r1, #4656
	mov	r0, #25
	bl	dprint_normal
	cmp	r6, #3
	beq	.L654
	cmp	r4, r8
	blt	.L655
.L653:
	mov	r4, r6
.L651:
	str	r4, [sp]
	mov	r3, r6
	ldr	r2, .L656+4
	movw	r1, #4675
	mov	r0, #25
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L655:
	ldr	r2, .L656+8
	movw	r1, #4670
	mov	r0, #25
	mov	r4, #3
	bl	dprint_normal
	b	.L651
.L654:
	cmp	r5, r8
	ble	.L653
	ldr	r2, .L656+12
	movw	r1, #4662
	mov	r0, #25
	mov	r4, #0
	bl	dprint_normal
	b	.L651
.L657:
	.align	2
.L656:
	.word	.LC70
	.word	.LC73
	.word	.LC72
	.word	.LC71
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
	ldr	r2, .L663
	add	r1, r0, #16
.L661:
	ldr	r3, [r2], #4
	add	r0, r0, #4
	cmp	r3, #0
	ldrne	r3, [r3, #28]
	str	r3, [r0, #-4]
	cmp	r0, r1
	bne	.L661
	ldmfd	sp, {fp, sp, pc}
.L664:
	.align	2
.L663:
	.word	.LANCHOR1
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
	ldrne	r1, .L676
	movne	r0, #0
	beq	.L675
.L669:
	ldr	r2, [r1], #4
	cmp	r2, #0
	add	r3, r2, #207872
	add	r3, r3, #488
	beq	.L668
	cmp	ip, r3
	beq	.L667
.L668:
	add	r0, r0, #1
	cmp	r0, #4
	bne	.L669
	mvn	r0, #0
.L667:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L675:
	ldr	r2, .L676+4
	movw	r3, #4703
	mov	r1, r3
	str	r3, [sp]
	ldr	r3, .L676+8
	str	r2, [sp, #4]
	ldr	r2, .L676+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L667
.L677:
	.align	2
.L676:
	.word	.LANCHOR1
	.word	.LC74
	.word	.LANCHOR0+872
	.word	.LC0
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
	ldr	r6, .L699
	mov	r4, r1
	mov	r5, r0
	ldr	r1, [r6, r0, asl #2]
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
	bne	.L695
	ldrd	r6, [r4, #32]
	mvn	r3, #0
	mvn	r2, #0
	add	r1, r1, #206848
	cmp	r7, r3
	add	r3, r1, #656
	cmpeq	r6, r2
	beq	.L696
	strd	r6, [r3]
.L690:
	ldrd	r8, [r4, #48]
	add	lr, r1, #672
	add	r0, r1, #688
	mov	r3, r5
	ldr	r2, .L699+4
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
.L696:
	ldrd	r6, [r3]
	b	.L690
.L695:
	add	r1, r1, #207872
	add	r3, r4, #8
	add	r1, r1, #128
	bl	IsNewpicSeg
	cmp	r0, #0
	bne	.L680
	ldr	lr, [r6, r5, asl #2]
	add	r0, lr, #204800
	add	lr, lr, #206848
	ldr	r3, [r0, #2464]
	cmp	r3, #3
	beq	.L697
	add	r1, lr, #672
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r8, [r1, #-8]
	cmp	r9, r3
	add	r3, lr, #656
	cmpeq	r8, r2
	beq	.L698
	strd	r8, [r3]
.L682:
	add	ip, lr, #688
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [r1, #-8]
	ldrd	r2, [ip, #-8]
	add	lr, lr, #704
	strd	r2, [r1]
	ldrd	r2, [lr, #-8]
	orrs	r1, r2, r3
	strd	r2, [ip]
	ldreqd	r2, [r4, #56]
	streqd	r2, [ip]
.L684:
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
	ldr	r2, .L699+8
	bl	dprint_normal
	ldr	r0, [r6, r5, asl #2]
	add	r1, r0, #204800
	ldr	r3, [r1, #2464]
	cmp	r3, #3
	bne	.L685
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
.L680:
	ldr	r0, [r6, r5, asl #2]
	add	r1, r0, #204800
	ldr	r3, [r1, #2464]
	cmp	r3, #3
	addeq	r0, r0, #206848
	beq	.L686
.L685:
	ldrd	r2, [r4, #32]
	mvn	r7, #0
	mvn	r6, #0
	add	r0, r0, #206848
	cmp	r3, r7
	cmpeq	r2, r6
	addne	ip, r0, #672
	strned	r2, [ip, #-8]
.L687:
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
.L686:
	add	r0, r0, #672
	mov	r3, r5
	ldr	r2, .L699+12
	movw	r1, #4807
	ldrd	r4, [r0]
	mov	r0, #24
	strd	r4, [sp]
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L697:
	add	r1, lr, #672
	add	r3, lr, #656
	ldrd	r8, [r1, #-8]
	strd	r8, [r3]
	b	.L682
.L698:
	ldrd	r8, [r3]
	b	.L682
.L700:
	.align	2
.L699:
	.word	.LANCHOR1
	.word	.LC77
	.word	.LC75
	.word	.LC76
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
	ldr	r3, .L705
	ldr	r3, [r3, r0, asl #2]
	ldr	r3, [r3, #128]
	cmp	r3, #20
	beq	.L703
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	mvnne	r0, #1
	moveq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L703:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L706:
	.align	2
.L705:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VCTRL_DecChanCheckDecParam, .-VCTRL_DecChanCheckDecParam
	.align	2
	.global	VCTRL_DecChanSyntax
	.type	VCTRL_DecChanSyntax, %function
VCTRL_DecChanSyntax:
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
	mov	r4, r0
	ldrhi	r2, .L739
	movwhi	r3, #4850
	bhi	.L729
	ldr	r8, .L739+4
	ldr	r3, [r8, r0, asl #2]
	cmp	r3, #0
	beq	.L733
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L734
	ldr	r5, [r3, #32]
	cmp	r5, #0
	ldrne	r2, .L739+8
	movwne	r3, #4853
	bne	.L729
	bl	IsPrintStateAllow
	ldr	r3, [r8, r4, asl #2]
	ldr	r3, [r3, #128]
	cmp	r3, #20
	mov	r6, r0
	beq	.L713
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	bne	.L735
.L713:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	beq	.L736
	cmp	r6, #1
	mvnne	r5, #2
	beq	.L737
.L727:
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L735:
	cmp	r6, #1
	mvnne	r5, #1
	bne	.L727
	mov	r3, r4
	ldr	r2, .L739+12
	movw	r1, #4862
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #1
	b	.L727
.L736:
	ldr	r1, [r8, r4, asl #2]
	add	r7, r1, #204800
	add	r1, r1, #206848
	add	r9, r1, #736
	ldrb	r3, [r7, #2785]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L715
	ldr	r3, [r7, #3520]
	cmp	r3, #0
	beq	.L738
.L715:
	add	r0, r7, #2784
	mov	r3, r4
	ldr	r2, .L739+16
	movw	r1, #4896
	ldrd	r6, [r0, #48]
	strd	r6, [sp, #8]
	ldrd	r6, [r0, #32]
	mov	r0, #24
	strd	r6, [sp]
	bl	dprint_normal
	mov	r1, r9
	mov	r0, r4
	bl	VCTRL_DecChanProcessPts
	ldr	r3, [r8, r4, asl #2]
	mov	r0, r9
	add	r2, r3, #207872
	add	r2, r2, #488
	ldr	r1, [r3, #128]
	bl	DecodeStream
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L734:
	ldr	r2, .L739+20
	movw	r3, #4852
.L729:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L739+24
	mvn	r5, #0
	ldr	r2, .L739+28
	bl	dprint_normal
	b	.L727
.L737:
	mov	r3, r4
	ldr	r2, .L739+32
	movw	r1, #4873
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #2
	b	.L727
.L738:
	add	r1, r1, #744
	mov	r0, r4
	bl	SM_ReadSegStream
	cmp	r0, #0
	beq	.L715
	cmp	r6, #1
	mvnne	r5, #3
	bne	.L727
	mov	r3, r4
	ldr	r2, .L739+36
	movw	r1, #4888
	mov	r0, #23
	bl	dprint_normal
	mvn	r5, #3
	b	.L727
.L733:
	ldr	r2, .L739+40
	movw	r1, #4851
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L739+24
	mvn	r5, #0
	str	r2, [sp, #4]
	ldr	r2, .L739+28
	bl	dprint_normal
	b	.L727
.L740:
	.align	2
.L739:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC78
	.word	.LC79
	.word	.LC82
	.word	.LC55
	.word	.LANCHOR0+896
	.word	.LC0
	.word	.LC80
	.word	.LC81
	.word	.LC39
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r9, .L774
	add	r3, r9, #628
	add	r0, r9, #644
	mov	r1, r9
.L744:
	ldr	r2, [r1], #4
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #28]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L744
	ldr	r7, .L774
	mvn	r5, #0
	ldr	r8, .L774+4
.L745:
	ldr	r3, [r9, #628]
	ldr	r2, [r9, #632]
	cmp	r3, r2
	movlt	r3, r2
	ldr	r2, [r9, #636]
	movlt	r4, #1
	movge	r4, #0
	cmp	r3, r2
	movlt	r3, r2
	ldr	r2, [r9, #640]
	movlt	r4, #2
	cmp	r3, r2
	movlt	r4, #3
	movlt	r3, r2
	cmp	r3, #0
	add	r3, r9, r4, lsl #2
	mov	r2, #0
	add	r1, r4, #1
	str	r2, [r3, #628]
	str	r1, [r9, #36]
	ldr	r3, .L774
	ble	.L749
	ldr	r3, [r7, r4, asl #2]
	cmp	r3, r2
	beq	.L745
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L745
	add	r3, r3, #204800
	ldr	r2, [r3, #2488]
	cmp	r2, #0
	ble	.L751
	ldr	r5, [r3, #2492]
	cmp	r5, #0
	beq	.L772
.L751:
	mov	r6, #500
	b	.L759
.L754:
	ldr	r3, [r9, r4, asl #2]
	cmp	r0, #0
	add	r3, r3, #204800
	bne	.L757
	ldr	r2, [r3, #3540]
	cmp	r2, #1
	beq	.L757
	subs	r6, r6, #1
	beq	.L745
.L759:
	mov	r0, r4
	bl	VCTRL_DecChanSyntax
	cmn	r0, #1
	mov	r5, r0
	bne	.L754
	ldr	r6, [r9, #644]
	cmp	r6, #0
	beq	.L766
	mov	r3, #0
	mov	r0, r4
	mov	r2, r3
	mov	r1, #21
	blx	r6
.L766:
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L757:
	mov	r2, #0
	str	r2, [r3, #3540]
	b	.L745
.L772:
	mov	r0, r4
	sub	r1, fp, #60
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L773
.L752:
	ldr	r5, [r9, r4, asl #2]
	ldr	r1, [fp, #-48]
	add	r5, r5, #204800
	ldr	r2, [r5, #2488]
	ldr	r0, [r5, #2680]
	bl	VCTRL_GetNextDecodeMode
	ldr	r3, [r9, r4, asl #2]
	add	r3, r3, #204800
	str	r0, [r5, #2680]
	ldr	r2, [r3, #2680]
	cmp	r2, #0
	ldreq	r2, [r3, #2484]
	movne	r2, #0
	str	r2, [r3, #2676]
	str	r2, [r3, #2672]
	b	.L751
.L749:
	mov	r0, r5
	str	r2, [r3, #36]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L773:
	mov	r1, r5
	sub	r0, fp, #60
	ldr	r3, [r8, #48]
	mov	r2, #24
	blx	r3
	b	.L752
.L775:
	.align	2
.L774:
	.word	.LANCHOR1
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
	bhi	.L785
	ldr	r3, .L786
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #128]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L785
.L779:
	.word	.L782
	.word	.L785
	.word	.L780
	.word	.L781
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L785
	.word	.L782
.L782:
	add	r0, r0, #207872
	add	r0, r0, #496
	ldmfd	sp, {fp, sp, pc}
.L781:
	add	r0, r0, #286720
	add	r0, r0, #3616
	ldmfd	sp, {fp, sp, pc}
.L780:
	add	r0, r0, #230400
	add	r0, r0, #512
	ldmfd	sp, {fp, sp, pc}
.L785:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L787:
	.align	2
.L786:
	.word	.LANCHOR1
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #3
	mov	r4, r0
	mov	r7, r1
	mov	r5, r2
	mov	r6, r3
	bhi	.L802
	ldr	r8, .L809
	ldr	r3, [r8, r0, asl #2]
	cmp	r3, #0
	ldreq	r2, .L809+4
	movweq	r1, #5108
	moveq	r0, r3
	beq	.L801
	cmp	r7, #0
	beq	.L803
	cmp	r5, #0
	ldreq	r2, .L809+8
	movweq	r1, #5110
	moveq	r0, r5
	beq	.L801
	cmp	r6, #0
	ldreq	r2, .L809+12
	movweq	r1, #5111
	moveq	r0, r6
	beq	.L801
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L795
	mov	r2, r6
	mov	r1, r5
	bl	SYNTAX_GetQueueImgNum
	ldr	r2, [r8, r4, asl #2]
	ldr	r3, [r2, #128]
	cmp	r3, #0
	beq	.L804
	cmp	r3, #16
	beq	.L805
	cmp	r3, #17
	beq	.L806
	cmp	r3, #15
	beq	.L807
	cmp	r3, #18
	movne	r3, #2
	strne	r3, [r7]
	beq	.L808
.L788:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L802:
	ldr	r2, .L809+16
	movw	r3, #5107
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L809+20
	str	r2, [sp, #4]
	ldr	r2, .L809+24
	bl	dprint_normal
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L795:
	str	r3, [r6]
	str	r3, [r5]
	str	r3, [r7]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L804:
	add	r2, r2, #233472
	ldr	r3, [r2, #1600]
	str	r3, [r7]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L803:
	ldr	r2, .L809+28
	movw	r1, #5109
	mov	r0, r7
.L801:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L809+20
	ldr	r2, .L809+24
	bl	dprint_normal
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L808:
	str	r3, [sp]
	movw	r1, #5156
	ldr	r3, .L809+20
	mov	r0, #32
	ldr	r2, .L809+32
	bl	dprint_normal
	b	.L788
.L805:
	str	r3, [sp]
	movw	r1, #5132
	ldr	r3, .L809+20
	mov	r0, #32
	ldr	r2, .L809+32
	bl	dprint_normal
	b	.L788
.L806:
	str	r3, [sp]
	movw	r1, #5140
	ldr	r3, .L809+20
	mov	r0, #32
	ldr	r2, .L809+32
	bl	dprint_normal
	b	.L788
.L807:
	mov	r2, #15
	ldr	r3, .L809+20
	str	r2, [sp]
	movw	r1, #5148
	ldr	r2, .L809+32
	mov	r0, #32
	bl	dprint_normal
	b	.L788
.L810:
	.align	2
.L809:
	.word	.LANCHOR1
	.word	.LC36
	.word	.LC84
	.word	.LC85
	.word	.LC9
	.word	.LANCHOR0+916
	.word	.LC0
	.word	.LC83
	.word	.LC86
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
	cmp	r0, #3
	mov	r5, r0
	mov	r4, r1
	bhi	.L817
	ldr	r6, .L819
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L819+4
	movweq	r1, #1274
	beq	.L816
	cmp	r4, #0
	beq	.L818
	ldr	r0, .L819+8
	mov	r3, #0
	mov	r1, r3
	str	r3, [fp, #-56]
	str	r3, [fp, #-60]
	mov	r2, #100
	ldr	r7, [r0, #48]
	mov	r0, r4
	str	r3, [fp, #-64]
	blx	r7
	ldr	r3, [r6, r5, asl #2]
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
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	str	r0, [r4, #92]
	mov	r0, r5
	bl	VCTRL_GetChanImgNum
	mov	r3, #100
	mla	r3, r3, r5, r6
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-56]
	sub	r1, fp, #52
	mov	r0, r5
	add	r2, r2, ip
	str	r2, [r4, #48]
	ldr	r2, [r3, #296]
	str	r2, [r4, #96]
	ldr	r3, [r3, #208]
	str	r3, [r4, #20]
	bl	SM_GetInfo
	ldr	r2, [fp, #-32]
	ldr	r3, [r6, r5, asl #2]
	ldr	r0, [fp, #-36]
	cmp	r2, #10
	ldr	r1, [fp, #-44]
	add	r3, r3, #221184
	movle	r2, #0
	movgt	r2, #1
	str	r0, [r4, #52]
	str	r1, [r4, #56]
	str	r2, [r4, #80]
	ldrb	r3, [r3, #2984]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r4, #88]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L817:
	ldr	r2, .L819+12
	movw	r3, #1273
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L819+16
	str	r2, [sp, #4]
	ldr	r2, .L819+20
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L818:
	ldr	r2, .L819+24
	movw	r1, #1275
	mov	r0, r4
.L816:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L819+16
	ldr	r2, .L819+20
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L820:
	.align	2
.L819:
	.word	.LANCHOR1
	.word	.LC38
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC37
	.word	.LANCHOR0+936
	.word	.LC0
	.word	.LC87
	UNWIND(.fnend)
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	2
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mvn	r0, #19
	ldmfd	sp, {fp, sp, pc}
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
	bhi	.L828
	ldr	r3, .L829
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #140]
	ldmfd	sp, {fp, sp, pc}
.L828:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.15
.L830:
	.align	2
.L829:
	.word	.LANCHOR1
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
	beq	.L833
	cmp	r5, #1
	moveq	r1, #3
	movne	r1, #4
.L833:
	cmp	r0, #3
	bhi	.L845
	ldr	r3, .L846
	ldr	r2, [r3, r0, asl #2]
	cmp	r2, #0
	strne	r1, [r2, #140]
.L836:
	ldr	r4, [r3, #644]
	cmp	r4, #0
	beq	.L831
	sub	r2, fp, #20
	mov	r3, #4
	mov	r1, #44
	str	r5, [r2, #-4]!
	blx	r4
.L831:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L845:
	str	r0, [fp, #-32]
	bl	VCTRL_SetLastFrameState.part.15
	ldr	r3, .L846
	ldr	r0, [fp, #-32]
	b	.L836
.L847:
	.align	2
.L846:
	.word	.LANCHOR1
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
	cmp	r0, #3
	mov	r5, r0
	bhi	.L862
	ldr	r4, .L865
	ldr	r1, [r4, r0, asl #2]
	cmp	r1, #0
	beq	.L863
	add	r3, r1, #204800
	ldr	r3, [r3, #3552]
	cmp	r3, #2
	beq	.L853
	cmp	r3, #3
	beq	.L854
	cmp	r3, #0
	bne	.L852
	add	r0, r1, #207872
	add	r0, r0, #488
	bl	H264DEC_FlushRemainImg
	ldr	r1, [r4, r5, asl #2]
.L852:
	add	r1, r1, #207872
	mov	r0, r5
	add	r1, r1, #480
	bl	SYNTAX_MarkImageEos
	cmn	r0, #1
	mov	r4, r0
	beq	.L857
	cmp	r0, #0
	bne	.L864
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r2, .L865+4
	movw	r1, #6327
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
.L850:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L854:
	add	r0, r1, #207872
	add	r0, r0, #488
	bl	MPEG2DEC_FlushRemainImg
	ldr	r1, [r4, r5, asl #2]
	b	.L852
.L864:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	sub	r3, r4, #2
	ldr	r2, .L865+8
	movw	r1, #6332
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L857:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r2, .L865+12
	movw	r1, #6322
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L853:
	add	r0, r1, #207872
	add	r0, r0, #488
	bl	MPEG4DEC_FlushRemainImg
	ldr	r1, [r4, r5, asl #2]
	b	.L852
.L862:
	ldr	r2, .L865+16
	movw	r3, #6232
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L865+20
	str	r2, [sp, #4]
	ldr	r2, .L865+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L850
.L863:
	ldr	r2, .L865+28
	movw	r3, #6233
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r3, .L865+20
	str	r2, [sp, #4]
	ldr	r2, .L865+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L850
.L866:
	.align	2
.L865:
	.word	.LANCHOR1
	.word	.LC89
	.word	.LC90
	.word	.LC88
	.word	.LC53
	.word	.LANCHOR0+956
	.word	.LC0
	.word	.LC38
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
	ldr	r6, .L881
	mov	r5, r0
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L876
	ldr	r4, [r0, #128]
	cmp	r4, #2
	beq	.L870
	cmp	r4, #3
	beq	.L871
	cmp	r4, #0
	beq	.L877
.L867:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L871:
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r6, r5, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #3578]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L878
.L874:
	mov	r2, #0
	str	r2, [r3, #3592]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L877:
	add	r0, r0, #207872
	str	r3, [sp, #4]
	add	r0, r0, #488
	mov	r3, r2
	str	r4, [sp]
	mov	r2, #1
	bl	H264DEC_VDMPostProc
	ldr	r3, [r6, r5, asl #2]
	add	r2, r3, #221184
	ldrb	r2, [r2, #736]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L879
.L873:
	add	r3, r3, #204800
	mov	r2, #0
	str	r2, [r3, #3920]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L870:
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r6, r5, asl #2]
	add	r2, r3, #229376
	ldrb	r2, [r2, #1924]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L880
.L875:
	add	r3, r3, #208896
	mov	r2, #0
	str	r2, [r3, #500]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L880:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r5, asl #2]
	mov	r1, #0
	add	r2, r3, #229376
	strb	r1, [r2, #1924]
	b	.L875
.L878:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r6, r5, asl #2]
	mov	r1, #0
	add	r2, r2, #204800
	mov	r3, r2
	strb	r1, [r2, #3578]
	b	.L874
.L876:
	ldr	r2, .L881+4
	movw	r1, #3750
	ldr	r3, .L881+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L881+12
	bl	dprint_normal
	b	.L867
.L879:
	mov	r0, r5
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r5, asl #2]
	add	r2, r3, #221184
	strb	r4, [r2, #736]
	b	.L873
.L882:
	.align	2
.L881:
	.word	.LANCHOR1
	.word	.LC2
	.word	.LANCHOR0+980
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
	cmp	r0, #3
	mov	r6, r2
	mov	r7, r3
	mov	r4, r0
	mov	r5, r1
	ldrhi	r2, .L893
	movwhi	r3, #3998
	bhi	.L891
	ldr	ip, .L893+4
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L892
	ldr	ip, [ip, #20]
	cmp	ip, #1
	beq	.L887
	ldr	r2, .L893+8
	mov	r3, #4000
.L891:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L893+12
	ldr	r2, .L893+16
	bl	dprint_normal
.L883:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L887:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L883
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_PostProc
.L892:
	ldr	r2, .L893+20
	movw	r1, #3999
	mov	r0, ip
	str	r1, [sp]
	ldr	r3, .L893+12
	str	r2, [sp, #4]
	ldr	r2, .L893+16
	bl	dprint_normal
	b	.L883
.L894:
	.align	2
.L893:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC55
	.word	.LANCHOR0+996
	.word	.LC0
	.word	.LC2
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
	ldrhi	r2, .L918
	movwhi	r3, #6524
	bhi	.L913
	ldr	r3, .L918+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L914
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L900
	ldr	r2, .L918+8
	mov	r3, #6528
.L913:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L918+12
	ldr	r2, .L918+16
	bl	dprint_normal
.L896:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L900:
	ldr	r4, [r0, #128]
	sub	r1, fp, #20
	mov	r0, #3
	str	r4, [r1, #-4]!
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L896
	sub	r0, fp, #32
	sub	r1, fp, #28
	bl	VCTRL_GetActiveChanNum
	ldr	r0, [fp, #-32]
	cmp	r0, #0
	beq	.L915
.L902:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	cmpeq	r4, #1
	bne	.L896
	ldr	r3, .L918+20
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L896
	mov	r0, #0
	blx	r3
	b	.L896
.L914:
	ldr	r2, .L918+24
	movw	r1, #6527
	ldr	r3, .L918+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L918+16
	bl	dprint_normal
	b	.L896
.L915:
	ldr	r5, .L918+20
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L916
	blx	r2
.L904:
	ldr	r2, [r5, #20]
	cmp	r2, #0
	beq	.L917
	mov	r0, #0
	blx	r2
	b	.L902
.L916:
	movw	r3, #6402
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L918+28
	bl	dprint_normal
	b	.L904
.L917:
	movw	r3, #6449
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L918+28
	bl	dprint_normal
	b	.L902
.L919:
	.align	2
.L918:
	.word	.LC91
	.word	.LANCHOR1
	.word	.LC93
	.word	.LANCHOR0+1016
	.word	.LC0
	.word	g_vdm_hal_fun_ptr
	.word	.LC92
	.word	.LC15
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
	cmp	r0, #3
	mov	r4, r0
	ldrhi	r2, .L934
	movhi	r3, #2272
	bhi	.L931
	ldr	r5, .L934+4
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L932
	ldr	r6, [r3, #16]
	cmp	r6, #1
	bne	.L933
	ldr	r3, [r3, #128]
	cmp	r3, #22
	ldreq	r2, .L934+8
	movweq	r3, #2275
	beq	.L931
	bl	SM_Start
	ldr	r0, [r5, r4, asl #2]
	mov	r3, #0
	ldr	r2, [r0, #28]
	str	r6, [r0, #124]
	cmp	r2, r3
	str	r6, [r0, #24]
	str	r3, [r0, #32]
	bne	.L926
	ldr	r1, .L934+12
	add	r2, r5, #648
	add	lr, r5, #16
	mov	r3, r5
	str	r6, [r0, #28]
.L929:
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
	bne	.L929
	ldr	r0, .L934+16
	bl	VDMDRV_SetPriority
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
.L926:
	ldr	r6, .L934+20
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r4
	bl	VCTRL_OpenHardware
	mov	r2, #12
	ldr	r3, [r6, #48]
	mov	r1, #0
	ldr	r0, .L934+24
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #720
	mov	r1, #0
	ldr	r0, .L934+28
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #2
	mov	r1, #0
	ldr	r0, .L934+32
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #120
	mov	r1, #0
	ldr	r0, .L934+36
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mov	r0, #0
	mov	r2, #1
	str	r2, [r3, #20]
.L922:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L933:
	ldr	r2, .L934+40
	movw	r3, #2274
.L931:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L934+44
	ldr	r2, .L934+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L922
.L932:
	ldr	r2, .L934+52
	movw	r1, #2273
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L934+44
	str	r2, [sp, #4]
	ldr	r2, .L934+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L922
.L935:
	.align	2
.L934:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC94
	.word	g_ChanCtx
	.word	.LANCHOR1+648
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecId
	.word	g_TimeRecTable
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LC57
	.word	.LANCHOR0+1036
	.word	.LC0
	.word	.LC27
	UNWIND(.fnend)
	.size	VCTRL_StartChan, .-VCTRL_StartChan
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
	ldrhi	r2, .L950
	movwhi	r3, #6566
	bhi	.L947
	ldr	r3, .L950+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L948
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L940
	ldr	r2, .L950+8
	movw	r3, #6570
.L947:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L950+12
	ldr	r2, .L950+16
	bl	dprint_normal
.L936:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L940:
	ldr	r5, [r0, #128]
	sub	r1, fp, #20
	mov	r0, #3
	str	r5, [r1, #-4]!
	bl	PDT_GetAttribute
	cmp	r0, #0
	bne	.L936
	sub	r1, fp, #28
	sub	r0, fp, #32
	bl	VCTRL_GetActiveChanNum
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L949
.L942:
	ldr	r0, [fp, #-28]
	cmp	r5, #1
	cmpeq	r0, #0
	movne	r0, #1
	moveq	r0, #0
	bne	.L936
	ldr	r3, .L950+20
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L936
	blx	r3
	b	.L936
.L948:
	ldr	r2, .L950+24
	movw	r1, #6569
	ldr	r3, .L950+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L950+16
	bl	dprint_normal
	b	.L936
.L949:
	mov	r0, r4
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	bl	VDMDRV_ResetVDH
	b	.L942
.L951:
	.align	2
.L950:
	.word	.LC91
	.word	.LANCHOR1
	.word	.LC93
	.word	.LANCHOR0+1052
	.word	.LC0
	.word	g_vdm_hal_fun_ptr
	.word	.LC92
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
	bhi	.L958
	ldr	r6, .L960
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L959
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L957
	str	r2, [r3, #32]
	mov	r2, #0
	str	r2, [r3, #20]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L957
	mov	r1, r5
	mov	r0, r4
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r5, [r3, #32]
	bl	VCTRL_CloseHardware
	mov	r0, r5
.L954:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L957:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L958:
	ldr	r2, .L960+4
	movw	r3, #2357
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L960+8
	str	r2, [sp, #4]
	ldr	r2, .L960+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L954
.L959:
	ldr	r2, .L960+16
	movw	r1, #2358
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L960+8
	str	r2, [sp, #4]
	ldr	r2, .L960+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L954
.L961:
	.align	2
.L960:
	.word	.LANCHOR1
	.word	.LC9
	.word	.LANCHOR0+1072
	.word	.LC0
	.word	.LC95
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
	ldr	r5, .L969
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L964
.L968:
	add	r4, r4, #1
	ldr	r3, [r8, #120]
	blx	r3
	cmp	r4, #50
	beq	.L966
.L964:
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
	bne	.L968
	cmp	r4, #49
	bgt	.L966
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L966:
	ldr	r2, .L969+4
	movw	r1, #2346
	mvn	r6, #0
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L970:
	.align	2
.L969:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC96
	UNWIND(.fnend)
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	2
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
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
	ldr	r6, .L987
	mov	r4, r0
	mov	r8, r1
	ldr	r3, [r6]
	blx	r3
	cmp	r4, #3
	mov	r7, r0
	bhi	.L982
	ldr	r5, .L987+4
	ldr	r0, [r5, r4, asl #2]
	cmp	r0, #0
	beq	.L983
	movw	r1, #2966
	ldr	r2, .L987+8
	str	r1, [sp]
	mov	r0, #26
	ldr	r3, .L987+12
	bl	dprint_normal
	ldr	r3, [r5, r4, asl #2]
	mov	r0, r4
	ldr	r9, [r3, #20]
	bl	VCTRL_StopChan
	ldr	r3, [r6, #12]
	mov	r0, #4
	blx	r3
	ldr	r0, [r5, r4, asl #2]
	cmp	r0, #0
	beq	.L984
	add	r1, r0, #207872
	mov	r0, r4
	add	r1, r1, #480
	bl	SYNTAX_MarkImageOutHanging
.L976:
	mov	r0, r4
	bl	FSP_ResetInstance
	ldr	r3, [r5, r4, asl #2]
	ldr	r2, [r8, #4]
	mov	r0, r4
	add	r3, r3, #204800
	str	r2, [r3, #3268]
	bl	VCTRL_InitSyntaxCtx
	ldr	r0, [r5, r4, asl #2]
	ldr	r3, [r6, #48]
	mov	r2, #416
	add	r0, r0, #206848
	mov	r1, #0
	add	r0, r0, #736
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	mvn	r1, #0
	add	ip, r3, #206848
	add	lr, r3, #204800
	add	r10, ip, #656
	add	ip, ip, #672
	mvn	r0, #0
	strd	r0, [r10]
	strd	r0, [ip, #-8]
	mov	r0, r4
	str	r2, [lr, #3200]
	str	r2, [lr, #3520]
	str	r2, [r3, #68]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #108]
	str	r2, [r3, #112]
	str	r2, [r3, #52]
	bl	InitUsdPool
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L985
	cmp	r9, #0
	bne	.L986
.L978:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	movw	r3, #3019
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L987+16
	mov	r0, #26
	ldr	r3, .L987+12
	bl	dprint_normal
	ldr	r3, [r6]
	blx	r3
	mov	r3, #100
	mla	r4, r3, r4, r5
	mov	r3, #0
	rsb	r0, r7, r0
	str	r0, [r4, #260]
.L973:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L985:
	mov	r0, r4
	bl	SM_Reset
	cmp	r9, #0
	beq	.L978
.L986:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L978
.L984:
	ldr	r2, .L987+20
	movw	r1, #2916
	ldr	r3, .L987+24
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L987+28
	bl	dprint_normal
	b	.L976
.L982:
	ldr	r2, .L987+32
	movw	r3, #2963
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L987+12
	str	r2, [sp, #4]
	ldr	r2, .L987+28
	bl	dprint_normal
	mvn	r3, #0
	b	.L973
.L983:
	ldr	r2, .L987+36
	movw	r1, #2964
	ldr	r3, .L987+12
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L987+28
	bl	dprint_normal
	mvn	r3, #0
	b	.L973
.L988:
	.align	2
.L987:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC97
	.word	.LANCHOR0+1088
	.word	.LC98
	.word	.LC2
	.word	.LANCHOR0+1116
	.word	.LC0
	.word	.LC37
	.word	.LC38
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
	ldr	r3, .L990
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
.L991:
	.align	2
.L990:
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
	ldr	r7, .L1079
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
	beq	.L1063
	ldr	r2, [r5, #28]
	cmp	r2, #0
	blt	.L995
	ldr	r3, [r5, #44]
	cmp	r3, #262144
	blt	.L995
	ldr	r3, [r5, #36]
	cmp	r3, #1
	beq	.L1064
.L996:
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
	bne	.L1060
	ldr	r3, .L1079+4
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L1037
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1038
	ldr	r3, .L1079+4
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L1039
	ldr	r3, .L1079+4
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1065
.L1029:
	mov	r3, #4
	ldr	r2, .L1079+8
	movw	r1, #2047
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
	str	r3, [fp, #-216]
	b	.L1054
.L1064:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ble	.L995
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bgt	.L996
.L995:
	ldr	r3, .L1079+12
	movw	r1, #1777
	ldr	r2, .L1079+16
	mov	r0, #1
	bl	dprint_normal
.L1032:
	mvn	r3, #0
	str	r3, [fp, #-216]
.L1054:
	ldr	r0, [fp, #-216]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1060:
	movw	r3, #2033
	mov	r0, r4
	mov	r1, r3
	ldr	r2, .L1079+20
	bl	dprint_normal
	mvn	r3, #0
	str	r3, [fp, #-216]
	b	.L1054
.L1063:
	mov	r0, r5
	ldr	r2, .L1079+24
	movw	r1, #1757
	bl	dprint_normal
	b	.L1032
.L1037:
	str	r6, [fp, #-224]
.L999:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #24
	sub	r0, fp, #164
	mov	r1, #0
	ldr	r4, .L1079
	blx	r3
	ldrd	r2, [r5, #120]
	orrs	r3, r2, r3
	beq	.L1000
	ldr	r3, [r5, #128]
	cmp	r3, #0
	bne	.L1001
.L1000:
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
	bne	.L1066
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
.L1004:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #164
	blx	r3
	ldrd	r2, [r5, #72]
	ldr	r1, .L1079
	orrs	r3, r2, r3
	beq	.L1033
	ldr	r3, [r5, #80]
	cmp	r3, #0
	bne	.L1006
.L1033:
	ldr	r3, [r5, #160]
	cmp	r3, #1
	beq	.L1007
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
	bne	.L1067
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
.L1011:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #164
	blx	r3
	ldrd	r2, [r5, #96]
	ldr	r1, .L1079
	orrs	r3, r2, r3
	beq	.L1035
	ldr	r3, [r5, #104]
	cmp	r3, #0
	bne	.L1015
.L1035:
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
	bne	.L1068
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
.L1055:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #0
	ldr	r10, .L1079
	blx	r3
	ldr	r2, [fp, #-76]
	movw	r0, #28584
	ldr	r4, [fp, #-84]
	movt	r0, 4
	cmp	r2, r0
	ldr	r3, [r7, #48]
	mov	r1, #0
	movcs	r2, r0
	ldr	r0, .L1079+4
	ldr	r9, .L1079+4
	str	r4, [r0, r6, asl #2]
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
	str	lr, [r4, #144]
	str	r1, [r3, #3552]
	add	r1, r4, #256
	str	r0, [r4, #36]
	mov	r0, r6
	ldr	r3, [r5, #180]
	ldr	lr, .L1079+28
	str	r3, [r4, #84]
	ldr	r3, [r5, #172]
	str	r2, [lr, r6, asl #3]
	str	r3, [ip, #1836]
	ldr	r3, [r5, #176]
	str	r3, [ip, #1840]
	bl	FSP_EnableInstance
	subs	r8, r0, #0
	bne	.L1069
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
	bhi	.L1070
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
	add	r0, r9, #200
	add	r0, r0, r6
	add	r9, r9, r6
	blx	r5
	ldr	r3, [fp, #-220]
	ldr	r0, [fp, #-216]
	rsb	r4, r3, r4
	str	r8, [r9, #248]
	str	r4, [r9, #244]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1007:
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	str	r3, [fp, #-140]
	str	r3, [fp, #-124]
	str	r3, [fp, #-212]
	strd	r0, [fp, #-132]
	b	.L1011
.L1001:
	ldr	r3, [r4, #52]
	mov	r2, #24
	add	r1, r5, #112
	sub	r0, fp, #92
	blx	r3
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-192]
	cmp	r2, r3
	blt	.L1071
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_AddMemRecord
	b	.L1004
.L1015:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r5, #88
	sub	r0, fp, #116
	blx	r3
	ldrd	r0, [fp, #-108]
	orrs	r3, r0, r1
	beq	.L1020
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-196]
	cmp	r2, r3
	blt	.L1020
	mov	r1, r0
	ldr	r0, [fp, #-116]
	bl	MEM_AddMemRecord
	b	.L1055
.L1006:
	ldr	r3, [r1, #52]
	mov	r2, #24
	sub	r0, fp, #140
	add	r1, r5, #64
	blx	r3
	ldr	r3, [r5, #160]
	ldr	r2, [fp, #-124]
	cmp	r3, #1
	beq	.L1013
	ldr	r1, [fp, #-200]
	cmp	r2, r1
	blt	.L1072
.L1013:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_AddMemRecord
	b	.L1011
.L1068:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1073
.L1017:
	ldr	r3, [fp, #-212]
	cmp	r3, #1
	beq	.L1074
.L1018:
	ldr	r2, .L1079+32
	movw	r3, #1817
.L1059:
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
	str	r3, [fp, #-216]
	b	.L1054
.L1067:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1075
.L1009:
	movw	r3, #1881
	ldr	r2, .L1079+36
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	b	.L1032
.L1069:
	mov	r3, r6
	ldr	r2, .L1079+40
	movw	r1, #2086
	mov	r0, #1
	bl	dprint_normal
.L1025:
	mov	r0, r6
	mov	r5, #0
	bl	FSP_DisableInstance
	mov	r0, r6
	bl	CloseUsdPool_WithMem
	ldr	r3, .L1079+4
	ldr	r1, [r4, #160]
	mov	r0, r6
	ldr	r2, [r4, #152]
	str	r5, [r3, r6, asl #2]
	ldr	r3, [r4, #156]
	str	r1, [fp, #-180]
	str	r2, [fp, #-188]
	add	r2, r4, #204
	str	r3, [fp, #-184]
	add	r3, r4, #228
	str	r2, [fp, #-176]
	add	r4, r4, #180
	str	r3, [fp, #-172]
	mvn	r3, #0
	str	r4, [fp, #-168]
	str	r3, [fp, #-216]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	ldr	r2, [r7, #16]
	blx	r2
	sub	r1, fp, #188
	mov	r0, r6
	bl	VCTRL_FreeChanResource
	b	.L1054
.L1070:
	str	r0, [sp, #4]
	mov	r3, r6
	str	r2, [sp]
	movw	r1, #2118
	ldr	r2, .L1079+44
	mov	r0, #1
	bl	dprint_normal
	b	.L1025
.L1066:
	movw	r3, #1938
	mov	r0, r4
	mov	r1, r3
	ldr	r2, .L1079+48
	bl	dprint_normal
	b	.L1032
.L1020:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1076
.L1022:
	ldr	r3, [fp, #-212]
	cmp	r3, #1
	beq	.L1077
.L1023:
	movw	r3, #1845
	ldr	r2, .L1079+52
	b	.L1059
.L1074:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1018
.L1073:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1017
.L1075:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1009
.L1071:
	movw	r3, #1954
	ldr	r2, .L1079+56
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	b	.L1032
.L1072:
	ldr	r3, [fp, #-204]
	cmp	r3, #1
	beq	.L1078
.L1014:
	movw	r3, #1912
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, r3
	ldr	r2, .L1079+60
	mov	r0, #1
	bl	dprint_normal
	b	.L1032
.L1077:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1023
.L1076:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1022
.L1078:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-200]
	b	.L1014
.L1038:
	mov	r6, #1
.L1028:
	cmp	r6, #3
	str	r6, [fp, #-224]
	bls	.L999
	b	.L1029
.L1065:
	mov	r6, #3
	b	.L1028
.L1039:
	mov	r6, #2
	b	.L1028
.L1080:
	.align	2
.L1079:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC101
	.word	.LANCHOR0+1144
	.word	.LC59
	.word	.LC100
	.word	.LC99
	.word	s_SmIIS
	.word	.LC106
	.word	.LC104
	.word	.LC108
	.word	.LC109
	.word	.LC102
	.word	.LC107
	.word	.LC103
	.word	.LC105
	UNWIND(.fnend)
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	2
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
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
	UNWIND(.pad #84)
	sub	sp, sp, #84
	cmp	r0, #3
	mov	r7, r0
	mov	r4, r1
	ldrhi	r2, .L1127
	movwhi	r3, #2661
	bhi	.L1121
	ldr	r6, .L1127+4
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	ldreq	r2, .L1127+8
	movweq	r1, #2662
	beq	.L1122
	ldr	r3, [r0, #16]
	cmp	r3, #1
	bne	.L1124
	cmp	r4, #0
	beq	.L1125
	add	r1, r6, #664
	mov	r0, #0
	bl	PDT_GetAttribute
	ldr	r3, [r6, #684]
	ldr	r5, [r4, #8]
	cmp	r3, #21
	bhi	.L1088
	cmp	r3, r5
	beq	.L1089
	add	r2, r6, #684
	add	r3, r6, #808
.L1091:
	ldr	r1, [r2, #4]!
	cmp	r1, #21
	bhi	.L1088
	cmp	r5, r1
	beq	.L1089
	cmp	r2, r3
	bne	.L1091
.L1089:
	mov	r1, r4
	mov	r0, r7
	bl	VCTRL_CmpConfigParameter
	subs	r8, r0, #0
	beq	.L1126
	ldr	r3, [r6, r7, asl #2]
	mov	r2, #72
	ldr	r8, .L1127+12
	mov	r1, #0
	sub	r0, fp, #116
	str	r5, [r3, #128]
	ldr	ip, [r4, #24]
	str	ip, [r3, #28]
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	strb	ip, [r3]
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r3, [r6, r7, asl #2]
	ldr	r3, [r3, #164]
	mov	r0, r3
	str	r3, [fp, #-104]
	bl	MEM_Phy2Vir
	ldr	r1, [r4, #84]
	ldr	ip, [r4, #8]
	mov	r3, #49152
	cmp	r1, #1
	movt	r3, 63683
	ldr	r2, [r6, r7, asl #2]
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
	ldr	r5, .L1127+4
	add	r10, r5, #16
	mov	r6, r5
	str	r0, [fp, #-116]
	ldreq	r0, [r4, #96]
	str	r3, [r2, #120]
	ldr	r3, [r4, #88]
	streq	r0, [fp, #-56]
	cmp	r3, #0
	ldr	r2, [r4, #8]
	movne	r3, #1
	strne	r3, [fp, #-64]
	ldr	r3, [r4, #80]
	cmp	r2, #0
	mov	r2, #0
	str	r3, [fp, #-72]
	movne	r3, #0
	ldreq	r3, [r4, #52]
	str	r3, [fp, #-76]
	mov	r3, r5
.L1097:
	ldr	r1, [r3], #4
	cmp	r1, #0
	addne	r2, r2, #1
	cmp	r3, r10
	bne	.L1097
	cmp	r2, #1
	add	r9, r4, #12
	mov	r2, #12
	sub	r0, fp, #92
	movgt	r3, #0
	strgt	r3, [fp, #-76]
	ldrsb	r3, [r4]
	mov	r1, r9
	cmp	r3, #1
	ldrne	r3, [fp, #-76]
	moveq	r3, #0
	streq	r3, [fp, #-76]
	str	r3, [r4, #52]
	ldr	r3, [r8, #52]
	blx	r3
	sub	r1, fp, #116
	mov	r0, r7
	bl	SM_Config
	ldr	r1, [r6, r7, asl #2]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r1, #204800
	ldr	ip, [r1, #188]
	str	ip, [r3, #3232]
	ldr	ip, [r1, #196]
	str	ip, [r3, #3236]
	ldr	ip, [r1, #172]
	str	ip, [r3, #2692]
	ldr	r1, [r1, #176]
	str	r1, [r3, #2696]
	ldr	r1, [r4, #28]
	str	r1, [r3, #2676]
	ldr	r1, [r4, #28]
	str	r1, [r3, #2672]
	ldr	r1, [r4, #36]
	str	r1, [r3, #2680]
	ldr	r1, [r4, #40]
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
	str	r2, [r3, #3292]
	str	r2, [r3, #3296]
	str	r1, [r3, #3288]
	ldr	r1, [r4, #152]
	str	r1, [r3, #3544]
	ldr	r1, [r4, #56]
	str	r2, [r3, #3248]
	str	r0, [r3, #3252]
	str	r1, [r3, #2512]
	str	r0, [r3, #3256]
	ldr	r2, [r4, #104]
	cmp	r2, #0
	ble	.L1101
	ldr	r1, [r4, #108]
	cmp	r1, #0
	ble	.L1101
	str	r2, [r3, #2560]
	ldr	r2, [r4, #108]
	str	r2, [r3, #2564]
.L1102:
	ldr	r0, [r6, r7, asl #2]
	mov	r1, r4
	ldr	r3, [r8, #52]
	mov	r2, #156
	add	r0, r0, #206848
	ldr	r4, .L1127+4
	add	r0, r0, #408
	blx	r3
	ldr	r0, [r6, r7, asl #2]
	ldr	r3, [r8, #52]
	mov	r1, r9
	add	r0, r0, #207872
	mov	r2, #12
	add	r0, r0, #132
	blx	r3
	ldr	r1, [r6, r7, asl #2]
	add	r0, r1, #204800
	ldr	ip, [r1, #128]
	ldr	r3, [r0, #3552]
	cmp	r3, ip
	beq	.L1103
	mov	r0, r7
	bl	VCTRL_ResetChan
	ldr	r1, [r4, r7, asl #2]
	add	r0, r1, #204800
	ldr	ip, [r1, #128]
.L1103:
	movw	r3, #2456
	ldr	r2, .L1127+16
	ldrsb	lr, [r0, r3]
	ldr	r3, .L1127+20
	str	ip, [r0, #3552]
	str	lr, [r1, #264]
.L1106:
	ldr	r1, [r5], #4
	add	r2, r2, #4
	add	r3, r3, #4
	cmp	r1, #0
	streq	r1, [r2, #-4]
	ldrne	r0, [r1, #28]
	ldrne	r1, [r5, #-4]
	strne	r0, [r2, #-4]
	ldrne	r1, [r1, #28]
	cmp	r10, r5
	str	r1, [r3, #-4]
	bne	.L1106
	ldr	r0, .L1127+16
	bl	VDMDRV_SetPriority
	mov	r0, r7
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1119:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1126:
	ldr	r3, .L1127+24
	movw	r1, #2680
	ldr	r2, .L1127+28
	bl	dprint_normal
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1088:
	mov	r3, r5
	ldr	r2, .L1127+32
	movw	r1, #2476
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, .L1127+24
	ldr	r2, .L1127+36
	mov	r1, #2672
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1101:
	mov	r2, #1920
	str	r2, [r3, #2560]
	mov	r2, #1088
	str	r2, [r3, #2564]
	b	.L1102
.L1124:
	ldr	r2, .L1127+40
	movw	r3, #2663
.L1121:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L1127+24
	ldr	r2, .L1127+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L1119
.L1125:
	ldr	r2, .L1127+48
	movw	r1, #2664
	mov	r0, r4
.L1122:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1127+24
	ldr	r2, .L1127+44
	bl	dprint_normal
	mvn	r0, #0
	b	.L1119
.L1128:
	.align	2
.L1127:
	.word	.LC9
	.word	.LANCHOR1
	.word	.LC2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+812
	.word	g_ChanCtx
	.word	.LANCHOR0+1164
	.word	.LC114
	.word	.LC112
	.word	.LC113
	.word	.LC110
	.word	.LC0
	.word	.LC111
	UNWIND(.fnend)
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
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
	ldr	r5, .L1144
	mov	r4, r0
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r7, r0
	mov	r0, #0
	blx	r3
	cmp	r4, #3
	ldrhi	r2, .L1144+4
	movwhi	r3, #2182
	bhi	.L1139
	ldr	r8, .L1144+8
	ldr	r6, [r8, r4, asl #2]
	cmp	r6, #0
	beq	.L1140
	ldr	r9, [r6, #16]
	cmp	r9, #1
	bne	.L1141
	mov	r0, #0
	ldr	r3, [r5, #16]
	str	r0, [r6, #20]
	blx	r3
	mov	r0, r4
	bl	SCDDRV_IsChanDec
	cmp	r0, #0
	bne	.L1142
.L1134:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #4
	ldr	r5, .L1144
	blx	r3
	mov	r0, r4
	bl	VCTRL_StopChan
	ldr	r3, [r5, #16]
	subs	r6, r0, #0
	mov	r0, #4
	bne	.L1143
	blx	r3
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r5, #12]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r8, r4, asl #2]
	ldr	r2, .L1144+12
	mov	r0, r4
	add	ip, r3, #204
	str	ip, [fp, #-56]
	ldr	lr, [r3, #152]
	add	r1, r3, #228
	ldr	ip, [r3, #156]
	add	r3, r3, #180
	ldr	r9, [r3, #-20]
	str	r6, [r2, r4, asl #3]
	str	lr, [fp, #-68]
	str	ip, [fp, #-64]
	str	r1, [fp, #-52]
	str	r3, [fp, #-48]
	str	r6, [r8, r4, asl #2]
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
	str	r9, [r4, #256]
	rsb	r0, r7, r0
	str	r0, [r4, #252]
.L1131:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1142:
	mov	r0, r4
	ldr	r6, [r5, #132]
	bl	SCDDRV_IsChanDec
	mov	r2, #500
	clz	r1, r0
	mov	r0, r9
	mov	r1, r1, lsr #5
	blx	r6
	b	.L1134
.L1141:
	ldr	r2, .L1144+16
	movw	r3, #2196
.L1139:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r2, .L1144+20
	mvn	r6, #0
	ldr	r3, .L1144+24
	bl	dprint_normal
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1143:
	blx	r3
	ldr	r3, [r5, #16]
	mov	r0, #0
	mvn	r6, #0
	blx	r3
	b	.L1131
.L1140:
	ldr	r2, .L1144+28
	movw	r3, #2189
	mov	r1, r3
	str	r3, [sp]
	mov	r0, r6
	ldr	r3, .L1144+24
	str	r2, [sp, #4]
	ldr	r2, .L1144+20
	bl	dprint_normal
	mov	r0, r6
	ldr	r3, [r5, #16]
	mvn	r6, #0
	blx	r3
	b	.L1131
.L1145:
	.align	2
.L1144:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LANCHOR1
	.word	s_SmIIS
	.word	.LC117
	.word	.LC115
	.word	.LANCHOR0+1184
	.word	.LC116
	UNWIND(.fnend)
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
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
	ldr	r3, .L1147
	mov	r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #828]
	ldmfd	sp, {fp, sp, pc}
.L1148:
	.align	2
.L1147:
	.word	.LANCHOR1
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
	ldr	r3, .L1150
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #828]
	ldmfd	sp, {fp, sp, pc}
.L1151:
	.align	2
.L1150:
	.word	.LANCHOR1
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
	ldr	r3, .L1153
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	ldr	r0, [r3, #2540]
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L1154:
	.align	2
.L1153:
	.word	.LANCHOR1
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
	ldr	r3, .L1156
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #828]
	ldmfd	sp, {fp, sp, pc}
.L1157:
	.align	2
.L1156:
	.word	.LANCHOR1
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
	ldr	r3, .L1159
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	ldr	r0, [r3, #2500]
	ldmfd	sp, {fp, sp, pc}
.L1160:
	.align	2
.L1159:
	.word	.LANCHOR1
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
	ldr	r3, .L1162
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	str	r1, [r3, #3520]
	ldmfd	sp, {fp, sp, pc}
.L1163:
	.align	2
.L1162:
	.word	.LANCHOR1
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
	mov	r4, r0
	mov	r3, r1
	bhi	.L1172
	ldr	r5, .L1176
	ldr	ip, [r5, r0, asl #2]
	cmp	ip, #0
	ldreq	r2, .L1176+4
	movweq	r1, #6645
	moveq	r0, ip
	beq	.L1171
	cmp	r3, #0
	beq	.L1173
	ldrd	r2, [r3, #64]
	mvn	r9, #0
	ldrd	r6, [ip, #8]
	movw	r8, #65535
	and	r9, r9, r3
	and	r8, r8, r2
	cmp	r9, r7
	cmpeq	r8, r6
	bne	.L1174
	bl	FSP_BindRequireFs
	subs	r6, r0, #0
	beq	.L1175
.L1170:
	adds	r0, r6, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1166:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1175:
	ldr	r3, [r5, r4, asl #2]
	ldr	r3, [r3, #124]
	cmp	r3, #1
	bne	.L1170
	ldr	r3, .L1176+8
	ldr	r3, [r3, #128]
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	str	r6, [r3, #124]
	b	.L1170
.L1174:
	strd	r2, [sp]
	movw	r1, #6654
	strd	r6, [sp, #8]
	mov	r0, #1
	ldr	r3, .L1176+12
	ldr	r2, .L1176+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L1166
.L1172:
	ldr	r2, .L1176+20
	movw	r3, #6644
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1176+12
	str	r2, [sp, #4]
	ldr	r2, .L1176+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1166
.L1173:
	ldr	r2, .L1176+28
	movw	r1, #6646
	mov	r0, r3
.L1171:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1176+12
	ldr	r2, .L1176+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L1166
.L1177:
	.align	2
.L1176:
	.word	.LANCHOR1
	.word	.LC38
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1204
	.word	.LC119
	.word	.LC53
	.word	.LC0
	.word	.LC118
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
	bhi	.L1182
	ldr	r2, .L1184
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L1183
	bl	FSP_SetFrameBufferMode
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1180:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1182:
	ldr	r2, .L1184+4
	movw	r3, #6676
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1184+8
	str	r2, [sp, #4]
	ldr	r2, .L1184+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1180
.L1183:
	ldr	r2, .L1184+16
	movw	r1, #6677
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1184+8
	str	r2, [sp, #4]
	ldr	r2, .L1184+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1180
.L1185:
	.align	2
.L1184:
	.word	.LANCHOR1
	.word	.LC53
	.word	.LANCHOR0+1228
	.word	.LC0
	.word	.LC39
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
	mov	r5, r1
	bhi	.L1198
	ldr	r2, .L1201
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	ldreq	r2, .L1201+4
	movweq	r1, #6691
	moveq	r0, r3
	beq	.L1197
	cmp	r5, #0
	beq	.L1199
	bl	FSP_BindExternFs
	subs	r4, r0, #0
	beq	.L1200
.L1192:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1188:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1200:
	ldr	r2, [r5, #56]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #32]
	bl	MEM_AddMemRecord
	ldr	r3, [r5, #184]
	cmp	r3, #0
	beq	.L1192
	ldrd	r0, [r5, #192]
	orrs	r2, r0, r1
	bne	.L1192
	ldr	r2, .L1201+8
	movw	r1, #6705
	mov	r0, r4
	bl	dprint_normal
	b	.L1192
.L1198:
	ldr	r2, .L1201+12
	movw	r3, #6690
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1201+16
	str	r2, [sp, #4]
	ldr	r2, .L1201+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1188
.L1199:
	ldr	r2, .L1201+24
	movw	r1, #6692
	mov	r0, r5
.L1197:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1201+16
	ldr	r2, .L1201+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1188
.L1202:
	.align	2
.L1201:
	.word	.LANCHOR1
	.word	.LC39
	.word	.LC121
	.word	.LC53
	.word	.LANCHOR0+1256
	.word	.LC0
	.word	.LC120
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
	mov	r4, r1
	bhi	.L1213
	ldr	r2, .L1216
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	ldreq	r2, .L1216+4
	movweq	r1, #6719
	moveq	r0, r3
	beq	.L1212
	cmp	r4, #0
	beq	.L1214
	bl	FSP_UnBindExternFs
	ldr	r2, [r4, #56]
	ldr	r1, [r4, #40]
	mov	r5, r0
	ldr	r0, [r4, #32]
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #184]
	cmp	r3, #0
	bne	.L1215
.L1208:
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1205:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1215:
	ldrd	r0, [r4, #192]
	orrs	r2, r0, r1
	bne	.L1208
	ldr	r2, .L1216+8
	movw	r1, #6731
	mov	r0, #0
	bl	dprint_normal
	b	.L1208
.L1213:
	ldr	r2, .L1216+12
	movw	r3, #6718
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1216+16
	str	r2, [sp, #4]
	ldr	r2, .L1216+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1205
.L1214:
	ldr	r2, .L1216+24
	mov	r1, #6720
	mov	r0, r4
.L1212:
	str	r2, [sp, #4]
	str	r1, [sp]
	ldr	r3, .L1216+16
	ldr	r2, .L1216+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L1205
.L1217:
	.align	2
.L1216:
	.word	.LANCHOR1
	.word	.LC39
	.word	.LC121
	.word	.LC53
	.word	.LANCHOR0+1280
	.word	.LC0
	.word	.LC120
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
	bhi	.L1221
	bl	FSP_SetDispFsNum
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1220:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1221:
	ldr	r2, .L1222
	movw	r3, #6741
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1222+4
	str	r2, [sp, #4]
	ldr	r2, .L1222+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L1220
.L1223:
	.align	2
.L1222:
	.word	.LC53
	.word	.LANCHOR0+1308
	.word	.LC0
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
	ldr	r3, .L1225
	str	r2, [fp, #-24]
	str	r1, [fp, #-28]
	sub	r1, fp, #32
	ldr	r3, [r3, r0, asl #2]
	mov	r0, #2
	ldr	ip, [r3, #128]
	ldr	r2, [r3, #148]
	ldr	r3, [r3, #120]
	str	ip, [fp, #-20]
	str	r2, [fp, #-16]
	str	r3, [fp, #-32]
	bl	PDT_GetAttribute
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1226:
	.align	2
.L1225:
	.word	.LANCHOR1
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
	ldr	r3, .L1228
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	ldr	r0, [r3, #2556]
	ldmfd	sp, {fp, sp, pc}
.L1229:
	.align	2
.L1228:
	.word	.LANCHOR1
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
	bhi	.L1242
	ldr	r3, .L1247
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1243
	mul	ip, r2, r1
	cmp	ip, #1024
	blt	.L1244
	add	lr, r0, #204800
	ldr	r3, [lr, #2560]
	cmp	r3, #0
	ble	.L1238
	ldr	lr, [lr, #2564]
	cmp	lr, #0
	ble	.L1238
	mul	r4, lr, r3
	cmp	ip, r4
	bgt	.L1245
.L1238:
	mov	r3, #57344
	movt	r3, 31
	cmp	ip, r3
	ble	.L1241
	ldr	r3, [r0, #128]
	bic	r0, r3, #2
	cmp	r0, #16
	bne	.L1246
.L1241:
	mov	r0, #1
.L1235:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1242:
	ldr	r2, .L1247+4
	movw	r3, #6780
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1247+8
	str	r2, [sp, #4]
	ldr	r2, .L1247+12
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1246:
	cmp	r3, #17
	cmpne	r3, #0
	moveq	r4, #1
	movne	r4, #0
	beq	.L1241
	stmia	sp, {r1, r2}
	mov	r0, r4
	movw	r1, #6804
	ldr	r2, .L1247+16
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1243:
	ldr	r2, .L1247+20
	movw	r1, #6781
	ldr	r3, .L1247+8
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L1247+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L1235
.L1244:
	mov	r0, #32
	stmib	sp, {r1, r2}
	mov	r3, r0
	str	r0, [sp]
	movw	r1, #6788
	ldr	r2, .L1247+24
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	b	.L1235
.L1245:
	stmib	sp, {r1, r2}
	mov	r0, #32
	movw	r1, #6796
	str	lr, [sp]
	ldr	r2, .L1247+28
	bl	dprint_normal
	mov	r0, #0
	b	.L1235
.L1248:
	.align	2
.L1247:
	.word	.LANCHOR1
	.word	.LC53
	.word	.LANCHOR0+1332
	.word	.LC0
	.word	.LC124
	.word	.LC39
	.word	.LC122
	.word	.LC123
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
	ldr	r3, .L1258
	mov	r4, r0
	ldr	r2, [r3, #844]
	cmp	r2, #1
	beq	.L1256
.L1249:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1256:
	cmp	r0, #11
	bhi	.L1257
	ldr	r6, .L1258+4
	ldrb	r2, [r6, r0]	@ zero_extendqisi2
	cmp	r2, #14
	movhi	r2, #0
	strhib	r2, [r6, r0]
	cmp	r0, #10
	mov	r5, r2
	moveq	r2, #1
	streqb	r2, [r3, #848]
	ldr	r3, .L1258+8
	ldr	r3, [r3, #4]
	blx	r3
	rsb	r2, r4, r4, lsl #4
	ldr	r1, .L1258+12
	add	r2, r2, r5
	ldrb	r3, [r6, r4]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [r6, r4]
	str	r0, [r1, r2, asl #2]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1257:
	movw	r1, #6876
	ldr	r3, .L1258+16
	stmia	sp, {r1, r4}
	mov	r0, #32
	ldr	r2, .L1258+20
	bl	dprint_normal
	b	.L1249
.L1259:
	.align	2
.L1258:
	.word	.LANCHOR1
	.word	g_TimeRecId
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecTable
	.word	.LANCHOR0+1356
	.word	.LC125
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
	ldr	r5, .L1265
	mov	r0, #0
	bl	VCTRL_RecordPosTime
	ldrb	r3, [r5, #848]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1264
.L1261:
	ldr	r6, .L1265+4
	mov	r3, #100
	mov	r0, #0
	str	r3, [r5, #32]
	mov	r4, r0
	ldr	r3, [r6, #12]
	blx	r3
	bl	SM_Wakeup
	mov	r3, #101
	str	r3, [r5, #32]
	bl	VCTRL_DecSyntax
	mov	r3, #102
	str	r3, [r5, #32]
	mov	r7, r0
	bl	VDMDRV_WakeUpVdm
.L1262:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #4
	bne	.L1262
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #1
	mov	r3, #105
	str	r3, [r5, #32]
	bl	VCTRL_RecordPosTime
	mov	r1, #0
	ldr	r3, [r6, #132]
	mov	r0, r1
	mov	r2, #10
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1264:
	mov	r0, #11
	bl	VCTRL_RecordPosTime
	mov	r3, #0
	strb	r3, [r5, #848]
	b	.L1261
.L1266:
	.align	2
.L1265:
	.word	.LANCHOR1
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
.L1268:
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L1298
	mov	r5, #2
	ldr	r7, .L1298+4
	ldr	r3, [r4, #24]
.L1273:
	cmp	r3, #2
	str	r5, [r4, #20]
	bne	.L1293
	b	.L1269
.L1297:
	str	r5, [r4, #32]
	bl	VCTRL_RunProcess
	ldr	r3, [r4, #24]
	cmp	r3, #2
	beq	.L1269
.L1293:
	cmp	r3, #3
	bne	.L1297
.L1270:
	mov	r3, #6
	mov	r0, #0
	str	r3, [r4, #32]
	str	r0, [r4, #20]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1269:
	mov	r6, #5
	mov	r3, #1
	str	r6, [r4, #32]
	str	r3, [r4, #20]
.L1275:
	ldr	r3, [r7, #120]
	mov	r0, #10
	blx	r3
	ldr	r3, [r4, #24]
	str	r6, [r4, #32]
	cmp	r3, #1
	beq	.L1273
	cmp	r3, #3
	bne	.L1275
	b	.L1270
.L1299:
	.align	2
.L1298:
	.word	.LANCHOR1
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
	bne	.L1309
	mov	r0, r4
	bl	VCTRL_InitVdmHal
	cmp	r0, #0
	movwne	r1, #6973
	bne	.L1309
	mov	r0, r4
	bl	VCTRL_InitScdHal
	cmp	r0, #0
	movwne	r1, #6978
	bne	.L1309
	bl	VCTRL_RegisterInterrupt
	cmp	r0, #0
	bne	.L1310
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1310:
	movw	r1, #6983
.L1309:
	ldr	r3, .L1311
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L1311+4
	bl	dprint_normal
	mov	r0, r4
	bl	VCTRL_CloseDrivers
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1312:
	.align	2
.L1311:
	.word	.LANCHOR0+1376
	.word	.LC126
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
	ldr	r5, .L1331
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L1320
	mov	r6, r5
	mov	r4, #0
.L1316:
	ldr	r3, [r6], #4
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L1315
	bl	VCTRL_DestroyChan
.L1315:
	cmp	r4, #4
	bne	.L1316
	bl	FSP_Exit
	ldr	r3, [r5, #20]
	mov	r2, #3
	str	r2, [r5, #24]
	cmp	r3, #0
	beq	.L1318
	ldr	r6, .L1331+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L1319
.L1330:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L1318
.L1319:
	ldr	r3, [r5, #20]
	mov	r0, #10
	cmp	r3, #0
	bne	.L1330
.L1318:
	ldr	r0, .L1331+8
	bl	VCTRL_CloseDrivers
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #16]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1320:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1332:
	.align	2
.L1331:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+40
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
	beq	.L1365
	ldr	r5, .L1370
	mov	r2, #8
	ldr	r6, .L1370+4
	mov	r1, #0
	sub	r0, fp, #52
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r4, [r6, #16]
	cmp	r4, #0
	bne	.L1364
	mov	r1, #1024
	ldr	r3, [r5, #80]
	str	r4, [fp, #-56]
	add	r0, r6, #852
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1370+8
	add	r0, r6, #852
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1337
	ldr	r3, [r5, #92]
	sub	r0, fp, #56
	ldr	r1, .L1370+12
	blx	r3
	cmp	r0, #0
	beq	.L1356
	sub	r0, fp, #56
	ldr	r3, [r5, #92]
	ldr	r1, .L1370+16
	blx	r3
	cmp	r0, #0
	beq	.L1366
	ldr	r3, [r5, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	mov	r3, r0
	str	r0, [r6, #616]
.L1341:
	add	r2, r3, #4992
	movw	r1, #10000
	add	r2, r2, #8
	movw	r8, #5000
	cmp	r2, r1
	bhi	.L1342
	cmp	r3, r8
	movw	r2, #60536
.L1363:
	movt	r2, 65535
	movge	r3, r8
	cmp	r3, r2
	movlt	r3, r2
.L1338:
	str	r3, [r6, #616]
.L1340:
	ldr	r8, .L1370+4
	mov	r9, #0
	ldr	r3, [r5, #80]
	mov	r1, #1024
	add	r0, r8, #852
	str	r9, [fp, #-56]
	blx	r3
	add	r0, r8, #852
	ldr	r3, [r5, #96]
	ldr	r1, .L1370+20
	blx	r3
	ldr	r10, .L1370
	cmp	r0, r9
	str	r0, [fp, #-56]
	beq	.L1343
	ldr	r3, [r10, #92]
	sub	r0, fp, #56
	ldr	r1, .L1370+12
	blx	r3
	cmp	r0, r9
	beq	.L1344
	sub	r0, fp, #56
	ldr	r3, [r10, #92]
	ldr	r1, .L1370+16
	blx	r3
	cmp	r0, r9
	beq	.L1367
	ldr	r3, [r10, #84]
	mov	r2, r9
	mov	r1, r9
	blx	r3
	mov	r3, r0
	str	r0, [r8, #620]
.L1347:
	add	r2, r3, #4992
	movw	r1, #10000
	add	r2, r2, #8
	movw	r8, #5000
	cmp	r2, r1
	bhi	.L1348
	cmp	r3, r8
	movw	r2, #60536
	movt	r2, 65535
	movlt	r4, r3
	movge	r4, r8
	cmp	r4, r2
	movlt	r4, r2
.L1344:
	str	r4, [r6, #620]
.L1346:
	ldr	r4, [r6, #1876]
	mov	r3, #0
	ldr	r8, .L1370+4
	cmp	r4, r3
	str	r3, [fp, #-56]
	beq	.L1349
	ldr	r2, .L1370+24
	and	r3, r4, #1
	ubfx	r1, r4, #1, #1
	strb	r3, [r8, #1880]
	ubfx	r3, r4, #2, #1
	ubfx	r4, r4, #3, #1
	strb	r1, [r2, #4]
	strb	r3, [r8, #1881]
	strb	r4, [r8, #1882]
.L1350:
	ldr	r4, .L1370+4
	mov	r2, #168
	ldr	r3, [r5, #48]
	mov	r1, #0
	add	r0, r4, #16
	ldr	r8, .L1370
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	mov	r0, r4
	blx	r3
	ldr	r1, .L1370+28
	mov	r2, #134217728
	mov	r3, #3
	str	r2, [fp, #-52]
	str	r1, [r6, #644]
	str	r3, [r6, #20]
	mov	r3, #75497472
	str	r3, [fp, #-48]
	bl	FSP_Init
	bl	VCTRL_InitChanCtx
	ldr	r3, [r5, #52]
	add	r1, r7, #8
	mov	r2, #24
	add	r0, r4, #88
	blx	r3
	add	r0, r4, #40
	bl	VCTRL_OpenDrivers
	cmp	r0, #0
	bne	.L1364
	ldr	r3, [r8, #124]
	mov	r1, #1
	blx	r3
	ldr	r3, [r8, #192]
	ldr	r2, .L1370+32
	add	r0, r4, #28
	ldr	r1, .L1370+36
	blx	r3
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r4, #16]
	bne	.L1368
.L1335:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1349:
	ldr	r3, [r5, #80]
	mov	r1, #1024
	add	r0, r8, #852
	ldr	r9, .L1370
	blx	r3
	ldr	r3, [r5, #96]
	ldr	r1, .L1370+40
	add	r0, r8, #852
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1350
	ldr	r3, [r9, #92]
	sub	r0, fp, #56
	ldr	r1, .L1370+12
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r8, #1876]
	beq	.L1352
	sub	r0, fp, #56
	ldr	r3, [r9, #92]
	ldr	r1, .L1370+16
	blx	r3
	cmp	r0, #0
	beq	.L1369
	ldr	r3, [r9, #84]
	mov	r2, r4
	mov	r1, r4
	blx	r3
	str	r0, [r8, #1876]
.L1352:
	ldr	r2, .L1370+24
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #1880]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2, #4]
	strb	r3, [r6, #1881]
	strb	r0, [r6, #1882]
	b	.L1350
.L1343:
	ldr	r3, [r8, #620]
	b	.L1347
.L1337:
	ldr	r3, [r6, #616]
	b	.L1341
.L1342:
	ldr	r2, .L1370+44
	movw	r1, #1035
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r6, #616]
	movw	r2, #60536
	cmp	r3, r8
	b	.L1363
.L1348:
	ldr	r2, .L1370+48
	movw	r1, #1077
	mov	r0, #32
	bl	dprint_normal
	ldr	r4, [r6, #620]
	movw	r2, #60536
	cmp	r4, r8
	movt	r2, 65535
	movge	r4, r8
	cmp	r4, r2
	movlt	r4, r2
	b	.L1344
.L1356:
	mov	r3, r4
	b	.L1338
.L1368:
	add	r0, r4, #40
	bl	VCTRL_CloseDrivers
.L1364:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1367:
	movw	r1, #1063
	ldr	r3, .L1370+52
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1370+56
	bl	dprint_normal
	b	.L1346
.L1366:
	movw	r1, #1021
	ldr	r3, .L1370+60
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1370+56
	bl	dprint_normal
	b	.L1340
.L1369:
	movw	r1, #1114
	ldr	r3, .L1370+64
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1370+56
	bl	dprint_normal
	b	.L1350
.L1365:
	ldr	r2, .L1370+68
	movw	r3, #7044
	mov	r1, r3
	str	r3, [sp]
	ldr	r3, .L1370+72
	str	r2, [sp, #4]
	ldr	r2, .L1370+76
	bl	dprint_normal
	mvn	r0, #0
	b	.L1335
.L1371:
	.align	2
.L1370:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC133
	.word	.LANCHOR2
	.word	VCTRL_EventReport
	.word	VCTRL_DecodeThread
	.word	.LC136
	.word	.LC135
	.word	.LC132
	.word	.LC134
	.word	.LANCHOR0+1436
	.word	.LC131
	.word	.LANCHOR0+1412
	.word	.LANCHOR0+1464
	.word	.LC127
	.word	.LANCHOR0+1396
	.word	.LC0
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
.LANCHOR0 = . + 0
	.type	__func__.12239, %object
	.size	__func__.12239, 18
__func__.12239:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.12182, %object
	.size	__func__.12182, 26
__func__.12182:
	.ascii	"VCTRL_HandleAllocMemEvent\000"
	.space	2
	.type	__func__.12191, %object
	.size	__func__.12191, 28
__func__.12191:
	.ascii	"VCTRL_HandleReleaseMemEvent\000"
	.type	__func__.12199, %object
	.size	__func__.12199, 33
__func__.12199:
	.ascii	"VCTRL_HandleReleaseBurstMemEvent\000"
	.space	3
	.type	__func__.12207, %object
	.size	__func__.12207, 29
__func__.12207:
	.ascii	"VCTRL_HandleCancelAllocEvent\000"
	.space	3
	.type	__func__.12217, %object
	.size	__func__.12217, 33
__func__.12217:
	.ascii	"VCTRL_HandleAllocPreProcessEvent\000"
	.space	3
	.type	__func__.12884, %object
	.size	__func__.12884, 24
__func__.12884:
	.ascii	"VCTRL_SetLastFrameState\000"
	.type	__func__.12155, %object
	.size	__func__.12155, 17
__func__.12155:
	.ascii	"VCTRL_RecordData\000"
	.space	3
	.type	__func__.12251, %object
	.size	__func__.12251, 18
__func__.12251:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__func__.12287, %object
	.size	__func__.12287, 25
__func__.12287:
	.ascii	"VCTRL_SetStreamInterface\000"
	.space	3
	.type	__func__.12295, %object
	.size	__func__.12295, 30
__func__.12295:
	.ascii	"VCTRL_SetDeiMemQueryInterface\000"
	.space	2
	.type	__func__.12306, %object
	.size	__func__.12306, 20
__func__.12306:
	.ascii	"VCTRL_GetStreamSize\000"
	.type	__func__.12313, %object
	.size	__func__.12313, 20
__func__.12313:
	.ascii	"VCTRL_CheckFreshRaw\000"
	.type	__func__.12320, %object
	.size	__func__.12320, 20
__func__.12320:
	.ascii	"VCTRL_CheckFreshSeg\000"
	.type	__func__.12325, %object
	.size	__func__.12325, 25
__func__.12325:
	.ascii	"VCTRL_SetDiscardPicParam\000"
	.space	3
	.type	__func__.12360, %object
	.size	__func__.12360, 23
__func__.12360:
	.ascii	"VCTRL_FreeChanResource\000"
	.space	1
	.type	__func__.12343, %object
	.size	__func__.12343, 22
__func__.12343:
	.ascii	"VCTRL_FreeVdhResource\000"
	.space	2
	.type	__func__.12349, %object
	.size	__func__.12349, 22
__func__.12349:
	.ascii	"VCTRL_FreeScdResource\000"
	.space	2
	.type	__func__.12355, %object
	.size	__func__.12355, 22
__func__.12355:
	.ascii	"VCTRL_FreeCtxResource\000"
	.space	2
	.type	__func__.12482, %object
	.size	__func__.12482, 17
__func__.12482:
	.ascii	"VCTRL_GetChanCfg\000"
	.space	3
	.type	__func__.12538, %object
	.size	__func__.12538, 14
__func__.12538:
	.ascii	"VCTRL_SeekPts\000"
	.space	2
	.type	__func__.12542, %object
	.size	__func__.12542, 20
__func__.12542:
	.ascii	"VCTRL_InitSyntaxCtx\000"
	.type	__func__.12552, %object
	.size	__func__.12552, 20
__func__.12552:
	.ascii	"VCTRL_ReleaseStream\000"
	.type	__func__.12584, %object
	.size	__func__.12584, 19
__func__.12584:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.12588, %object
	.size	__FUNCTION__.12588, 19
__FUNCTION__.12588:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__func__.12594, %object
	.size	__func__.12594, 23
__func__.12594:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.12598, %object
	.size	__FUNCTION__.12598, 23
__FUNCTION__.12598:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.12606, %object
	.size	__func__.12606, 23
__func__.12606:
	.ascii	"VCTRL_GetHDRConfigInfo\000"
	.space	1
	.type	__func__.12620, %object
	.size	__func__.12620, 18
__func__.12620:
	.ascii	"VCTRL_GetDecParam\000"
	.space	2
	.type	__func__.12668, %object
	.size	__func__.12668, 20
__func__.12668:
	.ascii	"VCTRL_ClearDecparam\000"
	.type	__func__.12685, %object
	.size	__func__.12685, 21
__func__.12685:
	.ascii	"VCTRL_VdmProcSedOnly\000"
	.space	3
	.type	__func__.12694, %object
	.size	__func__.12694, 21
__func__.12694:
	.ascii	"VCTRL_GetImageBuffer\000"
	.space	3
	.type	__func__.12704, %object
	.size	__func__.12704, 22
__func__.12704:
	.ascii	"VCTRL_ConfigFFFBSpeed\000"
	.space	2
	.type	__func__.12709, %object
	.size	__func__.12709, 20
__func__.12709:
	.ascii	"VCTRL_ConfigPVRInfo\000"
	.type	__func__.12713, %object
	.size	__func__.12713, 19
__func__.12713:
	.ascii	"VCTRL_IsChanActive\000"
	.space	1
	.type	__func__.12717, %object
	.size	__func__.12717, 19
__func__.12717:
	.ascii	"VCTRL_VarifyOption\000"
	.space	1
	.type	__func__.12735, %object
	.size	__func__.12735, 21
__func__.12735:
	.ascii	"VCTRL_GetChanMemSize\000"
	.space	3
	.type	__func__.12818, %object
	.size	__func__.12818, 21
__func__.12818:
	.ascii	"VCTRL_GetChanIDByCtx\000"
	.space	3
	.type	__func__.12840, %object
	.size	__func__.12840, 20
__func__.12840:
	.ascii	"VCTRL_DecChanSyntax\000"
	.type	__func__.12875, %object
	.size	__func__.12875, 20
__func__.12875:
	.ascii	"VCTRL_GetChanImgNum\000"
	.type	__func__.12334, %object
	.size	__func__.12334, 19
__func__.12334:
	.ascii	"VCTRL_GetChanState\000"
	.space	1
	.type	__func__.12899, %object
	.size	__func__.12899, 22
__func__.12899:
	.ascii	"VCTRL_OutputLastFrame\000"
	.space	2
	.type	__func__.12658, %object
	.size	__func__.12658, 15
__func__.12658:
	.ascii	"VCTRL_PostProc\000"
	.space	1
	.type	__func__.12680, %object
	.size	__func__.12680, 18
__func__.12680:
	.ascii	"VCTRL_VdmPostProc\000"
	.space	2
	.type	__func__.12954, %object
	.size	__func__.12954, 19
__func__.12954:
	.ascii	"VCTRL_OpenHardware\000"
	.space	1
	.type	__func__.12461, %object
	.size	__func__.12461, 16
__func__.12461:
	.ascii	"VCTRL_StartChan\000"
	.type	__func__.12964, %object
	.size	__func__.12964, 20
__func__.12964:
	.ascii	"VCTRL_CloseHardware\000"
	.type	__func__.12477, %object
	.size	__func__.12477, 15
__func__.12477:
	.ascii	"VCTRL_StopChan\000"
	.space	1
	.type	__func__.12574, %object
	.size	__func__.12574, 26
__func__.12574:
	.ascii	"VCTRL_ResetChanWithOption\000"
	.space	2
	.type	__func__.12559, %object
	.size	__func__.12559, 26
__func__.12559:
	.ascii	"VCTRL_MarkImageOutHanging\000"
	.space	2
	.type	__func__.12372, %object
	.size	__func__.12372, 17
__func__.12372:
	.ascii	"VCTRL_CheckParam\000"
	.space	3
	.type	__func__.12532, %object
	.size	__func__.12532, 17
__func__.12532:
	.ascii	"VCTRL_ConfigChan\000"
	.space	3
	.type	__func__.12455, %object
	.size	__func__.12455, 18
__func__.12455:
	.ascii	"VCTRL_DestroyChan\000"
	.space	2
	.type	__func__.12991, %object
	.size	__func__.12991, 21
__func__.12991:
	.ascii	"VCTRL_BindRequireMem\000"
	.space	3
	.type	__func__.12997, %object
	.size	__func__.12997, 25
__func__.12997:
	.ascii	"VCTRL_SetFrameBufferMode\000"
	.space	3
	.type	__func__.13005, %object
	.size	__func__.13005, 23
__func__.13005:
	.ascii	"VCTRL_BindExternBuffer\000"
	.space	1
	.type	__func__.13013, %object
	.size	__func__.13013, 25
__func__.13013:
	.ascii	"VCTRL_UnBindExternBuffer\000"
	.space	3
	.type	__func__.13019, %object
	.size	__func__.13019, 24
__func__.13019:
	.ascii	"VCTRL_SetFrameBufferNum\000"
	.type	__func__.13038, %object
	.size	__func__.13038, 24
__func__.13038:
	.ascii	"VCTRL_IsResolutionValid\000"
	.type	__func__.13050, %object
	.size	__func__.13050, 20
__func__.13050:
	.ascii	"VCTRL_RecordPosTime\000"
	.type	__func__.13065, %object
	.size	__func__.13065, 18
__func__.13065:
	.ascii	"VCTRL_OpenDrivers\000"
	.space	2
	.type	__func__.13080, %object
	.size	__func__.13080, 15
__func__.13080:
	.ascii	"VCTRL_OpenVfmw\000"
	.space	1
	.type	__FUNCTION__.12262, %object
	.size	__FUNCTION__.12262, 24
__FUNCTION__.12262:
	.ascii	"VCTRL_GetExtraRefFrmNum\000"
	.type	__FUNCTION__.12268, %object
	.size	__FUNCTION__.12268, 25
__FUNCTION__.12268:
	.ascii	"VCTRL_GetExtraDispFrmNum\000"
	.space	3
	.type	__FUNCTION__.12274, %object
	.size	__FUNCTION__.12274, 22
__FUNCTION__.12274:
	.ascii	"VCTRL_GetExtraCtrlCmd\000"
	.data
	.align	2
.LANCHOR2 = . + 0
	.type	g_IRQ_FLAG, %object
	.size	g_IRQ_FLAG, 4
g_IRQ_FLAG:
	.word	128
	.type	g_NotDirect_8x8_InferenceFlag, %object
	.size	g_NotDirect_8x8_InferenceFlag, 1
g_NotDirect_8x8_InferenceFlag:
	.byte	1
	.space	3
	.type	g_SaveFilePath, %object
	.size	g_SaveFilePath, 64
g_SaveFilePath:
	.byte	47
	.byte	109
	.byte	110
	.byte	116
	.byte	0
	.space	59
	.type	g_SaveYUVBitDepth, %object
	.size	g_SaveYUVBitDepth, 4
g_SaveYUVBitDepth:
	.word	8
	.type	g_SaveYuvEnd, %object
	.size	g_SaveYuvEnd, 4
g_SaveYuvEnd:
	.word	-1
	.type	g_ClkSelect, %object
	.size	g_ClkSelect, 4
g_ClkSelect:
	.word	-1
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
	ASCII(.ascii	"%s %d: %s\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"InstID out of range\000" )
.LC2:
	ASCII(.ascii	"Chan inactive\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%s ERROR: Arg Len %d != %d\012\000" )
.LC4:
	ASCII(.ascii	"%s\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s ERROR: VMM_CMD_Alloc %s size %d failed!\012\000" )
.LC6:
	ASCII(.ascii	"%s ERROR: VMM_CMD_Release %s phy 0x%x failed!\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"%s ERROR: VMM_CMD_ReleaseBurst failed!\012\000" )
.LC8:
	ASCII(.ascii	"%s ERROR: VMM_CMD_BLK_CancleCmd %d failed!\012\000" )
.LC9:
	ASCII(.ascii	"ChanID out of range\000" )
.LC10:
	ASCII(.ascii	"pMemInfo is NULL\000" )
	.space	3
.LC11:
	ASCII(.ascii	"%s ERROR: VMM_CMD_BLK_OpsInvoke %d  Type failed!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC12:
	ASCII(.ascii	"g_VfmwCtrlData.event_report_vdec = NULL\012\000" )
	.space	3
.LC13:
	ASCII(.ascii	"g_VfmwCtrlData.event_report_omxvdec = NULL\012\000" )
.LC14:
	ASCII(.ascii	"%s Unkown Adapter Type: %d, Len: %d\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"Force vdm %d sleep.\012\000" )
	.space	3
.LC17:
	ASCII(.ascii	"Vfmw suspend totally take %d ms\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSlee" )
	ASCII(.ascii	"p=%d)!\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"Force scd %d sleep.\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"Vfmw resume totally take %d ms\012\000" )
.LC21:
	ASCII(.ascii	"%s, %d, pos(%d) error!\012\000" )
.LC22:
	ASCII(.ascii	"event_report null!\000" )
	.space	1
.LC23:
	ASCII(.ascii	"%s Unkown Adapter Type: %d\012\000" )
.LC24:
	ASCII(.ascii	"pstStreamParam is NULL\000" )
	.space	1
.LC25:
	ASCII(.ascii	"pDeiMemIntf is NULL\000" )
.LC26:
	ASCII(.ascii	"can NOT get a not-opened Chan's information of bits" )
	ASCII(.ascii	"tream\000" )
	.space	3
.LC27:
	ASCII(.ascii	"This Chan has not been created!!!\000" )
	.space	2
.LC28:
	ASCII(.ascii	"Raw FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"Seg FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"pArgs is null\000" )
	.space	2
.LC31:
	ASCII(.ascii	"%s FATAL: pstChan = NULL!\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"%s FATAL: pChanMem_vdh = NULL!\012\000" )
.LC33:
	ASCII(.ascii	"%s FATAL: pChanMem_scd = NULL!\012\000" )
.LC34:
	ASCII(.ascii	"%s FATAL: pChanMem_ctx = NULL!\012\000" )
.LC35:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC36:
	ASCII(.ascii	"chan not create\000" )
.LC37:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC38:
	ASCII(.ascii	"s_pstVfmwChan = NULL\000" )
	.space	3
.LC39:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC40:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC41:
	ASCII(.ascii	"%s, %d, Phyaddr = 0x%x MetaDataPhyaddr = 0x%x image" )
	ASCII(.ascii	"_id = %d\012\000" )
	.space	3
.LC42:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC44:
	ASCII(.ascii	"%s, %d, ===> Phyaddr 0x%x release Error, force to U" )
	ASCII(.ascii	"nMark ImageOutHanging\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"%s, %d, ===> Phyaddr 0x%x release success!! imageId" )
	ASCII(.ascii	" = 0x%x\012\000" )
.LC46:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC47:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"pstHDRInput = null\000" )
	.space	1
.LC49:
	ASCII(.ascii	"%s VidStd=%d Error!\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"Get DecParam Type Failure!\012\000" )
.LC51:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range is %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC52:
	ASCII(.ascii	"Chan %d is not open or not running\012\000" )
.LC53:
	ASCII(.ascii	"ChanId out of range\000" )
.LC54:
	ASCII(.ascii	"%s unsupport VidStd %d\012\000" )
.LC55:
	ASCII(.ascii	"This channel is not running\000" )
.LC56:
	ASCII(.ascii	"%s unsupport VidStd %d.\012\000" )
	.space	3
.LC57:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC58:
	ASCII(.ascii	"pArgs = null\000" )
	.space	3
.LC59:
	ASCII(.ascii	"%s param invalid.\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"pChanOption = null\000" )
	.space	1
.LC61:
	ASCII(.ascii	"pDetailMemSize = null\000" )
	.space	2
.LC62:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), g_ExtraRef(%d), s32Di" )
	ASCII(.ascii	"splayFrameNum(%d), g_ExtraDisp(%d)\012\000" )
	.space	1
.LC63:
	ASCII(.ascii	"Register irq %d failed!\012\000" )
	.space	3
.LC64:
	ASCII(.ascii	"MEM_MapRegisterAddr reg 0x%x failed!\012\000" )
	.space	2
.LC65:
	ASCII(.ascii	"VDMDRV_GetHalMemSize Vdh %d failed!\012\000" )
	.space	3
.LC66:
	ASCII(.ascii	"MEM_AllocMemBlock Vdh %d failed!\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	"VDMDRV_OpenHAL Vdh %d failed!\012\000" )
	.space	1
.LC68:
	ASCII(.ascii	"MEM_AllocMemBlock Scd %d failed!\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"SM_OpenSCDDrv Scd %d failed!\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC71:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC73:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"pCtx = null\000" )
.LC75:
	ASCII(.ascii	"Chan:%d pic_pts: %lld\012\000" )
	.space	1
.LC76:
	ASCII(.ascii	"Chan:%d pic_usertag: %lld\012\000" )
	.space	1
.LC77:
	ASCII(.ascii	"Chan:%d pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC78:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC79:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC80:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC81:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC82:
	ASCII(.ascii	"Chan:%d seg_pts: %lld, seg_usertag = %lld\012\000" )
	.space	1
.LC83:
	ASCII(.ascii	"pRefImgNum = null\000" )
	.space	2
.LC84:
	ASCII(.ascii	"pReadImgNum = null\000" )
	.space	1
.LC85:
	ASCII(.ascii	"pNewImgNum = null\000" )
	.space	2
.LC86:
	ASCII(.ascii	"%s not support std %d\012\000" )
	.space	1
.LC87:
	ASCII(.ascii	"pstChanState = NULL\000" )
.LC88:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC90:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC91:
	ASCII(.ascii	"Chan id out of range!\000" )
	.space	2
.LC92:
	ASCII(.ascii	"Chan not created!\000" )
	.space	2
.LC93:
	ASCII(.ascii	"Chan not open!\000" )
	.space	1
.LC94:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC95:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC96:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC97:
	ASCII(.ascii	"\012====>%s, %d=====> prepare\012\000" )
.LC98:
	ASCII(.ascii	"====>%s, %d=====> end\012\012\000" )
.LC99:
	ASCII(.ascii	"Param Invalid of PChanOption is NULL\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSize failed!\012\000" )
	.space	2
.LC101:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT create m" )
	ASCII(.ascii	"ore channels\012\000" )
	.space	3
.LC102:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC103:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC104:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC105:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC106:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel scd\012\000" )
	.space	2
.LC107:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for SCD\012\000" )
	.space	2
.LC108:
	ASCII(.ascii	"Chan:%d can NOT enable FSP instance\012\000" )
	.space	3
.LC109:
	ASCII(.ascii	"Chan:%d hal mem %d overlap scd mem %d\012\000" )
	.space	1
.LC110:
	ASCII(.ascii	"can NOT config a not-opened Chan\000" )
	.space	3
.LC111:
	ASCII(.ascii	"pstCfg = null\000" )
	.space	2
.LC112:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC113:
	ASCII(.ascii	"%s check standard support failed.\012\000" )
	.space	1
.LC114:
	ASCII(.ascii	"%s config not change, no need to proceed.\012\000" )
	.space	1
.LC115:
	ASCII(.ascii	"%s:L%d: %s\012\000" )
.LC116:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC117:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC118:
	ASCII(.ascii	"pMem = NULL\000" )
.LC119:
	ASCII(.ascii	"%s Mem UniqueID %llx != Chan UniqueID %llx, ignor t" )
	ASCII(.ascii	"his bind operation.\012\000" )
.LC120:
	ASCII(.ascii	"pExternBuffer = NULL\000" )
	.space	3
.LC121:
	ASCII(.ascii	"Attached buffer phy:%x, but vir addr is NULL\012\000" )
	.space	2
.LC122:
	ASCII(.ascii	"Resolution min(w=%d,h=%d), this stream (w=%d,h=%d) " )
	ASCII(.ascii	"invalid!\012\000" )
	.space	3
.LC123:
	ASCII(.ascii	"Resolution max(w = %d, h = %d), this stream (w = %d" )
	ASCII(.ascii	", h = %d) invalid!\012\000" )
	.space	1
.LC124:
	ASCII(.ascii	"Std(%d) not support 4K(w = %d, h = %d)\012\000" )
.LC125:
	ASCII(.ascii	"%s,%d,pos(%d) error!\012\000" )
	.space	2
.LC126:
	ASCII(.ascii	"%s %d ERROR exit.\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"pArgs null!\000" )
.LC128:
	ASCII(.ascii	"g_ExtraRef=\000" )
.LC129:
	ASCII(.ascii	"=\000" )
	.space	2
.LC130:
	ASCII(.ascii	" \000" )
	.space	2
.LC131:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC132:
	ASCII(.ascii	"ERROR: g_ExtraRef = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC133:
	ASCII(.ascii	"g_ExtraDisp=\000" )
	.space	3
.LC134:
	ASCII(.ascii	"ERROR: g_ExtraDisp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
.LC135:
	ASCII(.ascii	"g_ExtraCommand=\000" )
.LC136:
	ASCII(.ascii	"HI_VFMW_VideoDecode\000" )
	.bss
	.align	3
.LANCHOR1 = . + 0
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 16
s_pstVfmwChan:
	.space	16
	.type	g_VfmwCtrlData, %object
	.size	g_VfmwCtrlData, 168
g_VfmwCtrlData:
	.space	168
	.type	last_rec_pos_time.12585, %object
	.size	last_rec_pos_time.12585, 16
last_rec_pos_time.12585:
	.space	16
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 400
g_VfmwChanStat:
	.space	400
	.type	last_rec_pos_time.12595, %object
	.size	last_rec_pos_time.12595, 16
last_rec_pos_time.12595:
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
	.type	ChanPriTab.12844, %object
	.size	ChanPriTab.12844, 16
ChanPriTab.12844:
	.space	16
	.type	g_EventReportFunc, %object
	.size	g_EventReportFunc, 4
g_EventReportFunc:
	.space	4
	.type	PrioArray.12460, %object
	.size	PrioArray.12460, 16
PrioArray.12460:
	.space	16
	.type	Capability.12531, %object
	.size	Capability.12531, 148
Capability.12531:
	.space	148
	.type	PrioArray.12530, %object
	.size	PrioArray.12530, 16
PrioArray.12530:
	.space	16
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 16
g_EsBufValidFlag:
	.space	16
	.type	g_StatisticsEnable, %object
	.size	g_StatisticsEnable, 4
g_StatisticsEnable:
	.space	4
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
	.type	g_SaveMemRecord, %object
	.size	g_SaveMemRecord, 24
g_SaveMemRecord:
	.space	24
	.type	g_SaveRawAfterReset, %object
	.size	g_SaveRawAfterReset, 4
g_SaveRawAfterReset:
	.space	4
	.type	g_SaveYuvBegin, %object
	.size	g_SaveYuvBegin, 4
g_SaveYuvBegin:
	.space	4
	.type	g_SaveYuvCount, %object
	.size	g_SaveYuvCount, 4
g_SaveYuvCount:
	.space	4
	.type	g_SaveElFileHandler, %object
	.size	g_SaveElFileHandler, 16
g_SaveElFileHandler:
	.space	16
	.type	g_SaveReorderMetadataFileHandler, %object
	.size	g_SaveReorderMetadataFileHandler, 16
g_SaveReorderMetadataFileHandler:
	.space	16
	.type	g_SaveMetadataFileHandler, %object
	.size	g_SaveMetadataFileHandler, 16
g_SaveMetadataFileHandler:
	.space	16
	.type	g_SaveDecYuvFileHandler, %object
	.size	g_SaveDecYuvFileHandler, 16
g_SaveDecYuvFileHandler:
	.space	16
	.type	g_SaveDispYuvFileHandler, %object
	.size	g_SaveDispYuvFileHandler, 16
g_SaveDispYuvFileHandler:
	.space	16
	.type	g_SaveSegFileHandler, %object
	.size	g_SaveSegFileHandler, 16
g_SaveSegFileHandler:
	.space	16
	.type	g_SaveRawFileHandler, %object
	.size	g_SaveRawFileHandler, 16
g_SaveRawFileHandler:
	.space	16
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.space	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
