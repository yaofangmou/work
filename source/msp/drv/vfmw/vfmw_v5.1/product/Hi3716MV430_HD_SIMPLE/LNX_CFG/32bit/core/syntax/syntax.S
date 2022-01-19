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
	.file	"syntax.c"
	.text
	.align	2
	.global	InitVoQueue
	.type	InitVoQueue, %function
InitVoQueue:
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
	ldr	r2, .L2
	mov	r4, r0
	mov	r1, #30
	mov	r0, #10
	bl	dprint_normal
	mov	r2, #0
	mov	r3, #64
	strh	r2, [r4, #2]	@ movhi
	strh	r3, [r4]	@ movhi
	mov	r0, #1
	mvn	r3, #0
	strh	r2, [r4, #4]	@ movhi
	strh	r2, [r4, #6]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	str	r2, [r4, #344]
	str	r2, [r4, #316]
	str	r3, [r4, #272]
	str	r3, [r4, #292]
	str	r3, [r4, #288]
	str	r3, [r4, #284]
	str	r3, [r4, #276]
	str	r3, [r4, #280]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	.LC0
	UNWIND(.fnend)
	.size	InitVoQueue, .-InitVoQueue
	.align	2
	.global	ResetVoQueue
	.type	ResetVoQueue, %function
ResetVoQueue:
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
	ldr	r5, .L7
	mov	r4, r0
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r3, r2
	beq	.L5
	str	r2, [sp]
	mov	r1, #62
	ldr	r2, .L7+4
	mov	r0, #1
	bl	dprint_normal
.L5:
	ldr	r2, [r4, #344]
	add	r1, r4, #336
	mov	r3, #0
	mov	r0, #64
	strh	r3, [r4, #2]	@ movhi
	add	r2, r2, #100
	strh	r0, [r4]	@ movhi
	mvn	r6, #0
	str	r2, [r4, #344]
	mvn	r7, #0
	mvn	r2, #0
	strh	r3, [r4, #4]	@ movhi
	strh	r3, [r4, #6]	@ movhi
	mov	r8, #0
	strh	r3, [r4, #8]	@ movhi
	mov	r9, #0
	str	r3, [r4, #316]
	mov	r0, #2
	str	r2, [r4, #272]
	str	r2, [r4, #292]
	str	r2, [r4, #288]
	str	r2, [r4, #284]
	str	r2, [r4, #276]
	str	r2, [r4, #280]
	ldr	ip, [r5, #16]
	strd	r6, [r1, #-8]
	str	r3, [r4, #324]
	strd	r8, [r1]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L8:
	.align	2
.L7:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC1
	UNWIND(.fnend)
	.size	ResetVoQueue, .-ResetVoQueue
	.align	2
	.global	ReturnImageToSyntax
	.type	ReturnImageToSyntax, %function
ReturnImageToSyntax:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #2
	mov	r3, r1
	beq	.L11
	cmp	r0, #3
	beq	.L12
	cmp	r0, #0
	ldmnefd	sp, {fp, sp, pc}
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_RecycleImage
.L12:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_RecycleImage
.L11:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_RecycleImage
	UNWIND(.fnend)
	.size	ReturnImageToSyntax, .-ReturnImageToSyntax
	.align	2
	.global	ProduceTimeStamp
	.type	ProduceTimeStamp, %function
ProduceTimeStamp:
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
	cmp	r2, #20
	mov	r3, r1
	ldrd	r6, [r1, #208]
	beq	.L16
	add	r0, r0, #272
	sub	r2, r2, #8
	ldrd	r4, [r0, #56]
	subs	r0, r6, r4
	and	r4, r4, r5
	sbc	r1, r7, r5
	cmp	r1, #0
	cmpeq	r0, #5
	movls	r1, #1
	movhi	r1, #0
	adds	r4, r4, #1
	movne	r4, #1
	tst	r1, r4
	beq	.L26
	cmp	r2, #1
	mvnhi	r6, #0
	mvnhi	r7, #0
	bls	.L18
.L16:
	mov	r0, r6
	mov	r1, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L26:
	cmp	r2, #1
	bhi	.L16
	ldrb	r2, [r3, #156]	@ zero_extendqisi2
	and	r2, r2, #3
	cmp	r2, #2
	bne	.L16
.L18:
	mvn	r1, #0
	str	r1, [r3, #200]
	mov	r6, r1
	mov	r7, r1
	str	r1, [r3, #204]
	b	.L16
	UNWIND(.fnend)
	.size	ProduceTimeStamp, .-ProduceTimeStamp
	.align	2
	.global	InsertImgToVoQueue_PtsProcess
	.type	InsertImgToVoQueue_PtsProcess, %function
InsertImgToVoQueue_PtsProcess:
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
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	lr, .L28
	mov	r5, r0
	mov	r4, r3
	ldrb	ip, [r3, #158]	@ zero_extendqisi2
	mov	r0, r2
	ldr	r3, [lr, r5, asl #2]
	mov	r2, r1
	ldrd	r6, [r4, #208]
	mov	r1, r4
	add	r3, r3, #204800
	ldr	r3, [r3, #2540]
	strd	r6, [r4, #200]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	bfi	ip, r3, #2, #1
	strb	ip, [r4, #158]
	bl	ProduceTimeStamp
	ldrd	r8, [r4, #216]
	mov	r3, r5
	ldr	r2, .L28+4
	mov	r6, r0
	mov	r7, r1
	ldrd	r0, [r4, #200]
	strd	r6, [r4, #208]
	strd	r6, [sp, #8]
	strd	r0, [fp, #-44]
	mov	r1, #236
	ldrd	r4, [fp, #-44]
	mov	r0, #24
	strd	r8, [sp, #16]
	strd	r4, [sp]
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	s_pstVfmwChan
	.word	.LC2
	UNWIND(.fnend)
	.size	InsertImgToVoQueue_PtsProcess, .-InsertImgToVoQueue_PtsProcess
	.align	2
	.global	InsertImgToVoQueue_FillImageInfo
	.type	InsertImgToVoQueue_FillImageInfo, %function
InsertImgToVoQueue_FillImageInfo:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	mov	r4, r3
	ldr	r3, [r3, #40]
	mov	r7, r0
	mov	r5, r2
	cmp	r3, #0
	beq	.L31
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldrne	r2, [r4, #32]
	beq	.L31
.L32:
	str	r2, [r5, #300]
	ldr	r3, [r4, #36]
	ldr	r1, [r5, #280]
	str	r3, [r5, #304]
	ldrb	r3, [r4, #156]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	str	r3, [r5, #308]
	ldr	r3, [r4, #156]
	str	r3, [r5, #312]
	ldr	r3, [r4, #88]
	add	r3, r3, #2
	str	r3, [r5, #296]
	ldr	r3, [r4, #100]
	ldrb	r0, [r4, #157]	@ zero_extendqisi2
	cmp	r3, r1
	ldr	r2, [r4, #156]
	ldr	r6, [r4, #44]
	ubfx	r10, r0, #0, #2
	ldrh	ip, [r4, #40]
	ubfx	r2, r2, #14, #3
	ldr	r0, [r4, #48]
	uxtb	r8, r10
	ldrh	r1, [r4, #52]
	uxtb	r9, r2
	strne	r3, [r5, #320]
	orr	r6, ip, r6, asl #16
	ldr	r3, [r5, #316]
	orr	r1, r1, r0, asl #16
	str	r1, [fp, #-56]
	add	r1, r3, #1
	str	r1, [r5, #316]
	str	r3, [r4, #104]
	ldr	r3, [r5, #272]
	cmp	r3, r9
	beq	.L34
	ldr	r1, .L57
	ldr	r1, [r1]
	subs	ip, r1, #0
	beq	.L35
	strb	r3, [fp, #-52]
	mov	r1, #6
	strb	r2, [fp, #-51]
	mov	r3, #2
	sub	r2, fp, #52
	mov	r0, r7
	blx	ip
.L35:
	str	r9, [r5, #272]
.L34:
	ldr	r3, [r5, #276]
	cmp	r3, r8
	beq	.L36
	ldr	r3, .L57
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L37
	sub	r2, fp, #44
	mov	r3, #1
	mov	r1, #3
	mov	r0, r7
	strb	r10, [r2, #-8]!
	blx	r9
.L37:
	str	r8, [r5, #276]
.L36:
	ldr	r3, [r5, #288]
	cmp	r3, r6
	beq	.L56
.L38:
	ldr	r3, .L57
	ldr	r2, [fp, #-56]
	str	r6, [r5, #288]
	str	r2, [r5, #292]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L30
	ldr	r1, [r4, #40]
	mov	r0, r7
	ldr	r6, [r4, #44]
	mov	r3, #8
	ldr	lr, [r4, #48]
	sub	r2, fp, #52
	ldr	ip, [r4, #52]
	strh	r1, [fp, #-52]	@ movhi
	mov	r1, #0
	strh	r6, [fp, #-50]	@ movhi
	strh	lr, [fp, #-48]	@ movhi
	strh	ip, [fp, #-46]	@ movhi
	blx	r5
.L30:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L31:
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #36]
	mov	r1, r2, lsr #1
	str	r2, [r4, #40]
	str	r3, [r4, #44]
	mov	r3, r3, lsr #1
	str	r1, [r4, #48]
	str	r3, [r4, #52]
	b	.L32
.L56:
	ldr	r3, [r5, #292]
	ldr	r2, [fp, #-56]
	cmp	r3, r2
	bne	.L38
	b	.L30
.L58:
	.align	2
.L57:
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	InsertImgToVoQueue_FillImageInfo, .-InsertImgToVoQueue_FillImageInfo
	.global	__aeabi_uidiv
	.align	2
	.global	InsertImgToVoQueue
	.type	InsertImgToVoQueue, %function
InsertImgToVoQueue:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
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
	ldr	r5, [fp, #4]
	mov	r8, r0
	mov	r9, r1
	cmp	r5, #0
	mov	r10, r2
	mov	r6, r3
	beq	.L93
	ldr	r7, .L98
	mov	r1, #416
	ldr	r2, .L98+4
	mov	r0, #3
	bl	dprint_normal
	mov	r0, #2
	ldr	r3, [r7, #12]
	blx	r3
	ldrh	r4, [r6, #4]
	ldrh	r1, [r6, #8]
	and	r4, r4, #63
	cmp	r1, r4
	bne	.L67
	b	.L66
.L65:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r1, r4
	beq	.L66
.L67:
	add	r3, r6, r4, lsl #2
	ldr	r2, [r5, #88]
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #88]
	cmp	r3, r2
	bne	.L65
	movw	r1, #431
	ldr	r2, .L98+8
	mov	r0, #0
	add	r4, r4, #1
	bl	dprint_normal
	mov	r3, #1000
	str	r3, [r5, #96]
	and	r4, r4, #63
	ldrh	r1, [r6, #8]
	cmp	r1, r4
	bne	.L67
.L66:
	ldr	r3, [r5, #96]
	cmp	r3, #100
	bhi	.L94
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #36]
	cmp	r2, #31
	bhi	.L95
.L68:
	str	r1, [sp, #4]
	mov	r0, #0
	str	r2, [sp]
	movw	r1, #438
	ldr	r2, .L98+12
	bl	dprint_normal
	ldr	r3, [r5, #96]
	cmp	r3, #1000
	beq	.L71
	mov	r2, r5
	mov	r1, r10
	mov	r0, r9
	bl	ReturnImageToSyntax
.L71:
	ldr	r3, [r7, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
.L61:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L95:
	cmp	r1, #31
	bls	.L68
	ldr	r10, .L98+16
	cmp	r9, #20
	str	r9, [r5, #148]
	add	r1, r5, #264
	mov	r0, r8
	ldr	r4, .L98+20
	ldr	r3, [r10, r8, asl #2]
	add	r3, r3, #204800
	ldreq	r2, [r3, #3204]
	streq	r2, [r5, #496]
	ldr	r3, [r3, #3276]
	cmp	r3, #0
	streq	r3, [r5, #144]
	bl	VCTRL_GetHDRConfigInfo
	mov	r1, r9
	mov	r3, r5
	mov	r2, r6
	mov	r0, r8
	bl	InsertImgToVoQueue_PtsProcess
	mov	r1, r9
	mov	r3, r5
	mov	r2, r6
	mov	r0, r8
	mov	r9, #100
	bl	InsertImgToVoQueue_FillImageInfo
	ldrh	r2, [r6, #6]
	ldr	lr, [r5, #88]
	mov	r1, #468
	ldrh	ip, [r6, #8]
	mov	r0, #10
	ldrh	r3, [r6, #4]
	mla	r9, r9, r8, r4
	stmia	sp, {r2, ip, lr}
	ldr	r2, .L98+24
	bl	dprint_normal
	ldrh	r3, [r6, #8]
	add	r2, r3, #1
	add	r3, r6, r3, lsl #2
	and	r2, r2, #63
	str	r5, [r3, #12]
	strh	r2, [r6, #8]	@ movhi
	ldr	r2, [r10, r8, asl #2]
	ldr	r3, [r2, #92]
	add	r3, r3, #1
	str	r3, [r2, #92]
	ldr	r3, [r9, #32]
	cmp	r3, #0
	beq	.L96
.L75:
	mov	r3, #100
	ldr	r1, [r5, #20]
	mla	r3, r3, r8, r4
	ldr	r2, [r7, #16]
	mov	r0, #2
	str	r1, [r3, #96]
	blx	r2
	ldr	r3, .L98+28
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L76
	mov	r2, r5
	mov	r3, #0
	mov	r1, #4
	mov	r0, r8
	blx	r6
.L76:
	mov	r0, #8
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L97
.L78:
	mov	r5, #100
	ldr	r2, [r7]
	mul	r5, r5, r8
	add	r6, r4, r5
	ldr	r3, [r6, #4]
	add	r3, r3, #1
	str	r3, [r6, #4]
	blx	r2
	ldr	r1, [r4, r5]
	rsb	r1, r1, r0
	mov	r7, r0
	cmp	r1, #300
	movcc	r0, #1
	bcc	.L61
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L80
	movw	r0, #10000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r6, #8]
.L80:
	mov	r3, #100
	mov	r2, #0
	mul	r8, r3, r8
	mov	r0, #1
	add	r3, r4, r8
	str	r7, [r4, r8]
	str	r2, [r3, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L94:
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #36]
	b	.L68
.L97:
	ldr	r3, [r7]
	blx	r3
	ldr	ip, .L98+32
	ldr	r2, .L98+36
	ldr	r3, [ip, r8, asl #2]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	mov	lr, r0
	cmp	r3, r2
	bls	.L78
	mov	r2, r8, asl #24
	movw	r1, #523
	add	r2, r2, #524288
	ldr	r0, .L98+40
	str	lr, [ip, r8, asl #2]
	bl	DBG_AddTrace
	b	.L78
.L96:
	ldr	r3, [r7]
	blx	r3
	str	r0, [r9, #32]
	b	.L75
.L93:
	mov	r0, r5
	ldr	r2, .L98+44
	mov	r1, #412
	bl	dprint_normal
	mvn	r0, #1
	b	.L61
.L99:
	.align	2
.L98:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	s_pstVfmwChan
	.word	g_VfmwChanStat
	.word	.LC7
	.word	g_EventReportFunc
	.word	.LANCHOR0
	.word	g_TraceFramePeriod
	.word	.LANCHOR1
	.word	.LC3
	UNWIND(.fnend)
	.size	InsertImgToVoQueue, .-InsertImgToVoQueue
	.align	2
	.global	SYNTAX_GetQueueImgNum
	.type	SYNTAX_GetQueueImgNum, %function
SYNTAX_GetQueueImgNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrh	r3, [r0, #6]
	ldrh	ip, [r0, #4]
	ldrh	r0, [r0, #8]
	cmp	r3, ip
	addcc	lr, r3, #64
	rsbcs	ip, ip, r3
	rsbcc	ip, ip, lr
	cmp	r3, r0
	addhi	r0, r0, #64
	str	ip, [r1]
	rsb	r3, r3, r0
	str	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SYNTAX_GetQueueImgNum, .-SYNTAX_GetQueueImgNum
	.align	2
	.global	SYNTAX_GetVoQue
	.type	SYNTAX_GetVoQue, %function
SYNTAX_GetVoQue:
	UNWIND(.fnstart)
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
	cmp	r3, #2
	beq	.L108
	cmp	r3, #3
	beq	.L109
	cmp	r3, #0
	beq	.L113
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L113:
	add	r0, r0, #16
	ldmfd	sp, {fp, sp, pc}
.L109:
	add	r0, r0, #81920
	add	r0, r0, #64
	ldmfd	sp, {fp, sp, pc}
.L108:
	add	r0, r0, #22528
	add	r0, r0, #32
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	2
	.global	SYNTAX_MarkImageOutHanging
	.type	SYNTAX_MarkImageOutHanging, %function
SYNTAX_MarkImageOutHanging:
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
	ldr	r3, [r1]
	mov	r5, r0
	cmp	r3, #2
	beq	.L116
	cmp	r3, #3
	beq	.L117
	cmp	r3, #0
	addeq	r7, r1, #16
	beq	.L115
.L125:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L116:
	add	r7, r1, #22528
	add	r7, r7, #32
.L115:
	cmp	r7, #0
	beq	.L125
	ldr	r6, .L131
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r4, [r7, #4]
	ldrh	r2, [r7, #6]
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L122
.L123:
	add	r3, r7, r4, lsl #2
	mov	r0, r5
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L121
	bl	FSP_MarkImageOutHanging
	ldrh	r2, [r7, #6]
.L121:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L123
.L122:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L117:
	add	r7, r1, #81920
	add	r7, r7, #64
	b	.L115
.L132:
	.align	2
.L131:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SYNTAX_MarkImageOutHanging, .-SYNTAX_MarkImageOutHanging
	.align	2
	.global	SYNTAX_MarkImageEos
	.type	SYNTAX_MarkImageEos, %function
SYNTAX_MarkImageEos:
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
	ldr	r3, [r1]
	cmp	r3, #2
	beq	.L135
	cmp	r3, #3
	beq	.L136
	cmp	r3, #0
	addeq	r4, r1, #16
	beq	.L134
.L146:
	mvn	r4, #0
	b	.L151
.L135:
	add	r4, r1, #22528
	add	r4, r4, #32
.L134:
	cmp	r4, #0
	beq	.L146
	ldr	r5, .L153
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #8]
	cmp	r2, r3
	addhi	r1, r3, #64
	rsbls	r2, r2, r3
	rsbhi	r2, r2, r1
	cmp	r2, #0
	ble	.L141
	cmp	r3, #0
	subne	r3, r3, #1
	moveq	r3, #63
	uxthne	r3, r3
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L152
	mov	r1, #1
	ldr	r2, [r5, #16]
	mov	r0, #2
	str	r1, [r3, #108]
	blx	r2
	mov	r4, #0
.L151:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L141:
	ldr	r4, [r4, #296]
	mov	r0, #2
	ldr	r3, [r5, #16]
	cmp	r4, r0
	mvncc	r4, #0
	blx	r3
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L136:
	add	r4, r1, #81920
	add	r4, r4, #64
	b	.L134
.L152:
	ldr	r3, [r5, #16]
	mov	r0, #2
	blx	r3
	ldrh	ip, [r4, #8]
	ldr	r3, .L153+4
	movw	r1, #743
	ldr	r2, .L153+8
	mov	r0, #1
	str	ip, [sp]
	mvn	r4, #0
	bl	dprint_normal
	b	.L151
.L154:
	.align	2
.L153:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+20
	.word	.LC8
	UNWIND(.fnend)
	.size	SYNTAX_MarkImageEos, .-SYNTAX_MarkImageEos
	.align	2
	.global	SYNTAX_ReceiveImage
	.type	SYNTAX_ReceiveImage, %function
SYNTAX_ReceiveImage:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r5, r1
	beq	.L163
	ldr	r3, [r0]
	cmp	r3, #2
	beq	.L158
	cmp	r3, #3
	beq	.L159
	cmp	r3, #0
	addeq	r4, r0, #16
	beq	.L157
.L166:
	ldr	r3, .L167
	movw	r1, #774
	ldr	r2, .L167+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #1
	b	.L156
.L159:
	add	r4, r0, #81920
	add	r4, r4, #64
.L157:
	cmp	r4, #0
	beq	.L166
	ldr	r9, .L167+8
	mov	r0, #2
	ldr	r3, [r9, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r2, r3
	mvneq	r8, #2
	beq	.L162
	add	r3, r4, r3, lsl #2
	mov	r2, #536
	ldr	r10, [r9, #52]
	mov	r0, r5
	ldr	r1, [r3, #12]
	mov	r8, #1
	ldrd	r6, [r5, #160]
	blx	r10
	ldr	ip, [r5, #88]
	movw	r1, #798
	ldr	r2, .L167+12
	mov	r0, #10
	strd	r6, [r5, #160]
	ldrh	r3, [r4, #4]
	str	ip, [sp, #8]
	ldrh	ip, [r4, #8]
	str	ip, [sp, #4]
	ldrh	ip, [r4, #6]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r5, #88]
	ldr	r2, [r4, #344]
	add	r3, r3, r2
	str	r3, [r5, #88]
	ldrh	r3, [r4, #6]
	add	r3, r3, r8
	and	r3, r3, #63
	strh	r3, [r4, #6]	@ movhi
.L162:
	ldr	r3, [r9, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r8
.L156:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L158:
	add	r4, r0, #22528
	add	r4, r4, #32
	b	.L157
.L163:
	mvn	r0, #1
	b	.L156
.L168:
	.align	2
.L167:
	.word	.LANCHOR1+40
	.word	.LC9
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC10
	UNWIND(.fnend)
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
	.align	2
	.global	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.type	SYNTAX_ReleaseImage_RecycleImage_CheckRet, %function
SYNTAX_ReleaseImage_RecycleImage_CheckRet:
	UNWIND(.fnstart)
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
	bne	.L176
	cmp	r1, #0
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L176:
	cmn	r1, #2
	beq	.L174
	cmp	r1, #1
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L174:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SYNTAX_ReleaseImage_RecycleImage_CheckRet, .-SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.align	2
	.global	SYNTAX_ReleaseImage_RecycleImage
	.type	SYNTAX_ReleaseImage_RecycleImage, %function
SYNTAX_ReleaseImage_RecycleImage:
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
	cmp	r3, #2
	beq	.L179
	cmp	r3, #3
	beq	.L180
	cmp	r3, #0
	mvnne	r1, #1
	beq	.L184
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L184:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	H264DEC_RecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L180:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MPEG2DEC_RecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L179:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MPEG4DEC_RecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	UNWIND(.fnend)
	.size	SYNTAX_ReleaseImage_RecycleImage, .-SYNTAX_ReleaseImage_RecycleImage
	.align	2
	.global	SYNTAX_ReleaseImage
	.type	SYNTAX_ReleaseImage, %function
SYNTAX_ReleaseImage:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r6, r1
	mov	r8, r0
	beq	.L213
	ldr	r3, [r0]
	cmp	r3, #2
	beq	.L189
	cmp	r3, #3
	beq	.L190
	cmp	r3, #0
	addeq	r5, r0, #16
	beq	.L188
.L211:
	ldr	r3, .L215
	mov	r1, #1000
	ldr	r2, .L215+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #1
.L187:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L190:
	add	r5, r0, #81920
	add	r5, r5, #64
.L188:
	cmp	r5, #0
	beq	.L211
	ldr	r9, .L215+8
	mov	r0, #2
	ldr	r3, [r9, #12]
	blx	r3
	ldrh	r4, [r5, #4]
	ldrh	r2, [r5, #6]
	and	r4, r4, #63
	ldr	r3, [r6, #88]
	ldr	r1, [r5, #344]
	cmp	r2, r4
	rsb	r7, r1, r3
	bne	.L200
	b	.L201
.L197:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L214
.L200:
	add	r10, r4, #2
	add	r3, r5, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L195
	ldr	ip, [r3, #88]
	rsb	ip, ip, r7
	clz	ip, ip
	mov	ip, ip, lsr #5
	cmp	ip, #0
	beq	.L197
.L196:
	ldrh	r0, [r5, #4]
	b	.L199
.L204:
	mov	r4, r2
.L199:
	cmp	r4, #0
	mov	r2, #63
	subne	r2, r4, #1
	add	r1, r5, r10, lsl #2
	add	r3, r2, #2
	cmp	r4, r0
	add	lr, r5, r3, lsl #2
	mov	r10, r3
	ldr	r3, [lr, #4]
	str	r3, [r1, #4]
	bne	.L204
	ldr	r3, [r6, #88]
	cmp	ip, #1
	ldr	r2, [r5, #344]
	rsb	r3, r2, r3
	str	r3, [r6, #88]
	ldrh	r3, [r5, #4]
	add	r3, r3, #1
	and	r3, r3, #63
	strh	r3, [r5, #4]	@ movhi
	beq	.L212
	ldrh	r2, [r5, #6]
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L200
.L214:
	ldr	r1, [r5, #344]
	ldr	r3, [r6, #88]
.L201:
	ldr	ip, [r6, #444]
	mov	r0, #1
	str	r1, [sp]
	movw	r1, #1014
	ldr	r2, .L215+12
	mvn	r4, #1
	str	ip, [sp, #4]
	bl	dprint_normal
.L194:
	ldr	r3, [r9, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L195:
	mov	r3, r4
	ldr	r2, .L215+16
	movw	r1, #1032
	mov	r0, #1
	bl	dprint_normal
	mov	ip, #2
	b	.L196
.L212:
	ldr	r0, [r6, #88]
	movw	r1, #1058
	ldr	r2, .L215+20
	str	r0, [sp, #8]
	mov	r0, #10
	ldrh	ip, [r5, #8]
	str	ip, [sp, #4]
	ldrh	ip, [r5, #6]
	str	ip, [sp]
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r8
	bl	SYNTAX_ReleaseImage_RecycleImage
	cmp	r0, #1
	mov	r4, r0
	beq	.L194
	ldr	r3, .L215
	movw	r1, #1063
	ldr	r2, .L215+24
	mov	r0, #0
	bl	dprint_normal
	b	.L194
.L189:
	add	r5, r0, #22528
	add	r5, r5, #32
	b	.L188
.L213:
	ldr	r2, .L215+28
	mov	r1, #992
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #1
	b	.L187
.L216:
	.align	2
.L215:
	.word	.LANCHOR1+60
	.word	.LC9
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC11
	UNWIND(.fnend)
	.size	SYNTAX_ReleaseImage, .-SYNTAX_ReleaseImage
	.align	2
	.global	SYNTAX_ReturnImage
	.type	SYNTAX_ReturnImage, %function
SYNTAX_ReturnImage:
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
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L225
.L220:
	.word	.L223
	.word	.L225
	.word	.L221
	.word	.L222
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L223
.L223:
	add	r4, r0, #16
.L224:
	ldr	r5, .L226
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	mov	r0, #2
	sub	r3, r3, #1
	and	r3, r3, #63
	strh	r3, [r4, #6]	@ movhi
	ldr	r3, [r5, #16]
	blx	r3
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L222:
	add	r4, r0, #81920
	add	r4, r4, #64
	b	.L224
.L221:
	add	r4, r0, #22528
	add	r4, r4, #32
	b	.L224
.L225:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L227:
	.align	2
.L226:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SYNTAX_ReturnImage, .-SYNTAX_ReturnImage
	.align	2
	.global	DecodeStream_H264
	.type	DecodeStream_H264, %function
DecodeStream_H264:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldrd	r2, [r0, #32]
	mov	r4, r0
	mov	r5, r1
	ldr	r8, [r4, #8]
	mov	r0, r1
	ldr	r7, [r4, #20]
	sub	r1, fp, #68
	ldr	r6, [r4, #24]
	strd	r2, [fp, #-44]
	ldrb	lr, [r4, #14]	@ zero_extendqisi2
	ldrb	r2, [r4, #17]	@ zero_extendqisi2
	ldrsb	r3, [r4, #13]
	ldr	ip, [r4, #28]
	strb	r2, [fp, #-67]
	str	r3, [fp, #-48]
	str	r8, [fp, #-64]
	str	r7, [fp, #-60]
	str	r6, [fp, #-56]
	strb	lr, [fp, #-68]
	str	ip, [fp, #-52]
	bl	H264DEC_DecodePacket
	add	r1, r5, #57344
	ldr	r3, .L234
	cmn	r0, #2
	moveq	r2, #1
	movne	r2, #0
	strb	r2, [r4, #1]
	ldr	r0, [r1, #1840]
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #204800
	strb	r2, [r3, #3536]
	ldr	r4, [r5, #360]
	cmp	r4, #0
	beq	.L233
.L228:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L233:
	add	r5, r5, #12288
	ldrb	r3, [r5, #1272]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L228
	ldr	r0, [r1, #1840]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1272]
	b	.L228
.L235:
	.align	2
.L234:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	2
	.global	SegMan
	.type	SegMan, %function
SegMan:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L237
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L237
	ldr	r3, .L261
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L257
.L240:
	ldrb	r5, [r4, #14]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r4, #408]
	cmp	r5, #1
	beq	.L258
	cmp	r5, #0
	beq	.L259
.L245:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L259:
	ldr	r9, .L261+4
	add	r8, r4, #88
	add	r7, r4, #168
	mov	r2, #80
	add	r1, r4, #8
	mov	r0, r8
	ldr	r3, [r9, #52]
	blx	r3
	ldr	r3, [r9, #48]
	mov	r0, r7
	mov	r2, #80
	mov	r1, r5
	blx	r3
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r4, #2]
	cmp	r3, #1
	bls	.L245
	ldr	r1, [r4, #108]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r4, #188]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r9, #48]
	mov	r2, #80
	mov	r1, r5
	mov	r0, r8
	blx	r3
	ldr	r3, [r9, #48]
	mov	r0, r7
	mov	r2, #80
	mov	r1, r5
	blx	r3
	ldr	r2, .L261+8
	movw	r1, #1976
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L261+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L244
	mov	r0, r6
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r7
.L244:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r4, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L257:
	ldr	r3, [r3, #3520]
	cmp	r3, #1
	bne	.L240
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L240
	mov	r2, #160
	add	r1, r4, #248
	add	r0, r4, #88
	bl	memcpy
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L258:
	ldrb	r5, [r4, #2]	@ zero_extendqisi2
	cmp	r5, r7
	beq	.L260
	cmp	r5, #1
	bne	.L245
	ldr	r2, [r4, #104]
	cmp	r2, #1024
	bcs	.L246
	ldr	r8, .L261+4
	rsb	r0, r2, r0
	ldr	r1, [r4, #88]
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r1, [r4, #104]
	ldr	ip, [r4, #8]
	mov	r0, r6
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #24]
	rsb	ip, r1, ip
	rsb	r2, r1, r2
	str	ip, [r4, #88]
	add	r3, r3, r1
	str	r2, [r4, #100]
	str	r3, [r4, #104]
	ldr	r1, [r4, #108]
	strb	r5, [r4, #94]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #28]
	ldr	r3, [r8, #48]
	mov	r1, r7
	mov	r2, #80
	add	r0, r4, #168
	str	ip, [r4, #108]
	blx	r3
.L247:
	mov	r5, #0
	mov	r3, #1
	strb	r5, [r4, #2]
	mov	r2, #160
	strb	r3, [r4, #408]
	add	r1, r4, #88
	add	r0, r4, #248
	bl	memcpy
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L260:
	ldr	r6, .L261+4
	add	r1, r4, #8
	mov	r2, #80
	add	r0, r4, #88
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #80
	mov	r1, r5
	add	r0, r4, #168
	blx	r3
	strb	r5, [r4, #2]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L246:
	ldr	r3, .L261+4
	mov	r2, #80
	add	r1, r4, #8
	add	r0, r4, #168
	ldr	r3, [r3, #52]
	blx	r3
	b	.L247
.L237:
	ldr	r2, .L261+16
	mov	r1, #1936
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L262:
	.align	2
.L261:
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC17
	.word	g_EventReportFunc
	.word	.LC16
	UNWIND(.fnend)
	.size	SegMan, .-SegMan
	.align	2
	.global	DecodeStream_MPEG2
	.type	DecodeStream_MPEG2, %function
DecodeStream_MPEG2:
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
	mov	r5, r0
	mov	r0, r1
	mov	r4, r1
	ldr	r6, [r1]
	bl	MP2_GetPacketState
	cmp	r0, #2
	beq	.L269
.L264:
	mov	r1, r5
	ldr	r0, [r4]
	bl	SegMan
	cmp	r0, #0
	beq	.L270
.L266:
	ldr	r5, [r4, #32]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4, #18]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4, #18]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L270:
	add	r1, r5, #88
	mov	r0, r4
	bl	MPEG2DEC_Decode
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r5, #1]
	b	.L266
.L269:
	ldr	r3, .L272
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L271
.L265:
	add	r1, r4, #80896
	mov	r0, r4
	add	r1, r1, #520
	bl	MPEG2DEC_Decode
	b	.L264
.L271:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L264
	b	.L265
.L273:
	.align	2
.L272:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_MPEG2, .-DecodeStream_MPEG2
	.align	2
	.global	DecodeStream_MPEG4
	.type	DecodeStream_MPEG4, %function
DecodeStream_MPEG4:
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
	add	r5, r1, #20480
	mov	r6, r0
	mov	r0, r1
	mov	r4, r1
	ldr	r7, [r5, #2424]
	bl	MP4_GetPacketState
	cmp	r0, #3
	beq	.L279
.L275:
	mov	r1, r6
	ldr	r0, [r5, #2424]
	bl	SegMan
	cmp	r0, #0
	beq	.L280
.L277:
	ldr	r4, [r4, #1036]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r5, #2460]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r5, #2424]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #2460]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L280:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG4DEC_Decode
	b	.L277
.L279:
	ldr	r3, .L282
	ldr	r3, [r3, r7, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L281
.L276:
	add	r1, r4, #15616
	mov	r0, r4
	add	r1, r1, #32
	bl	MPEG4DEC_Decode
	b	.L275
.L281:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L275
	b	.L276
.L283:
	.align	2
.L282:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	2
	.global	DecodeStream
	.type	DecodeStream, %function
DecodeStream:
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
	mov	r5, r0
	mov	r0, #6
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_RecordPosTime
	cmp	r4, #2
	beq	.L286
	cmp	r4, #3
	beq	.L287
	cmp	r4, #0
	beq	.L291
	str	r4, [sp]
	movw	r1, #1922
	ldr	r3, .L292
	mov	r0, #1
	ldr	r2, .L292+4
	bl	dprint_normal
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L291:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_H264
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L287:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_MPEG2
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L286:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_MPEG4
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L293:
	.align	2
.L292:
	.word	.LANCHOR1+80
	.word	.LC18
	UNWIND(.fnend)
	.size	DecodeStream, .-DecodeStream
	.align	2
	.global	ReleasePacket
	.type	ReleasePacket, %function
ReleasePacket:
	UNWIND(.fnstart)
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
	ldr	r2, .L295
	mov	r3, r0
	movw	r1, #2108
	mov	r0, #0
	str	r0, [sp]
	mov	r0, #2
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L296:
	.align	2
.L295:
	.word	.LC19
	UNWIND(.fnend)
	.size	ReleasePacket, .-ReleasePacket
	.align	2
	.global	ReleaseCurPic_VPx
	.type	ReleaseCurPic_VPx, %function
ReleaseCurPic_VPx:
	UNWIND(.fnstart)
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
	ldr	r2, .L298
	mov	r3, r0
	movw	r1, #2167
	mov	r0, #0
	str	r0, [sp]
	mov	r0, #2
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L299:
	.align	2
.L298:
	.word	.LC19
	UNWIND(.fnend)
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	2
	.global	ReleaseCurPic
	.type	ReleaseCurPic, %function
ReleaseCurPic:
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
	cmp	r0, #2
	mov	r4, r1
	beq	.L302
	cmp	r0, #3
	beq	.L303
	cmp	r0, #0
	beq	.L306
	mov	r3, r0
	ldr	r2, .L307
	movw	r1, #2333
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L306:
	mov	r0, r1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	H264_ClearCurrPic
.L303:
	mov	r0, r1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MP2_ClearCurPic
.L302:
	mov	r0, r1
	bl	MP4_ClearCurPic
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MP4_Clean_HeadPacket
.L308:
	.align	2
.L307:
	.word	.LC20
	UNWIND(.fnend)
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	2
	.global	CheckNewPicSegMpeg2
	.type	CheckNewPicSegMpeg2, %function
CheckNewPicSegMpeg2:
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
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	mov	r6, r1
	add	r1, ip, #73
	cmp	ip, #0
	cmpne	ip, #179
	uxtb	r1, r1
	moveq	lr, #1
	movne	lr, #0
	cmp	r1, #1
	movhi	r1, lr
	orrls	r1, lr, #1
	cmp	r1, #0
	bne	.L317
	ldr	r1, .L319
	mvn	r5, #0
	mvn	r4, #0
	ldr	lr, [r1, r0, asl #2]
	add	lr, lr, #206848
	add	lr, lr, #672
	ldrd	r0, [lr, #-8]
	cmp	r1, r5
	cmpeq	r0, r4
	bne	.L316
	ldr	r1, [r6]
	cmp	r1, #0
	bne	.L316
	sub	r1, ip, #1
	uxtb	r1, r1
	cmp	r1, #174
	bls	.L318
.L316:
	mvn	r0, #0
.L311:
	cmp	ip, #0
	streq	ip, [r6]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L317:
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L316
	mov	r3, #1
	str	r3, [r6]
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	b	.L311
.L318:
	ldrd	r4, [r3, #24]
	mvn	r0, #0
	strd	r4, [lr, #-8]
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	b	.L311
.L320:
	.align	2
.L319:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	CheckNewPicSegMpeg2, .-CheckNewPicSegMpeg2
	.align	2
	.global	CheckNewPicSegMpeg4
	.type	CheckNewPicSegMpeg4, %function
CheckNewPicSegMpeg4:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #179
	cmpne	lr, #176
	add	r3, lr, #75
	moveq	ip, #1
	movne	ip, #0
	cmp	lr, #254
	orreq	ip, ip, #1
	uxtb	r3, r3
	cmp	lr, #47
	orrls	ip, ip, #1
	cmp	r3, #1
	movhi	r3, ip
	orrls	r3, ip, #1
	cmp	r3, #0
	bne	.L333
.L322:
	cmp	r2, #1
	bne	.L326
.L323:
	mov	r2, #1
	str	r2, [r0]
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	mov	r3, #0
.L324:
	cmp	lr, #182
	moveq	r2, #0
	streq	r2, [r0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L333:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L323
	b	.L322
.L326:
	mvn	r3, #0
	b	.L324
	UNWIND(.fnend)
	.size	CheckNewPicSegMpeg4, .-CheckNewPicSegMpeg4
	.align	2
	.global	CheckNewPicSegByVidStd
	.type	CheckNewPicSegByVidStd, %function
CheckNewPicSegByVidStd:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r2, #2
	mov	lr, r1
	ldr	r4, [fp, #4]
	ldr	ip, [r3]
	beq	.L336
	cmp	r2, #3
	beq	.L337
	cmp	r2, #0
	beq	.L340
	mvn	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L340:
	mov	r1, ip
	mov	r0, lr
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	H264_IsNewPicNal
.L337:
	mov	r2, ip
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	CheckNewPicSegMpeg2
.L336:
	mov	r2, r4
	mov	r1, ip
	mov	r0, lr
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	CheckNewPicSegMpeg4
	UNWIND(.fnend)
	.size	CheckNewPicSegByVidStd, .-CheckNewPicSegByVidStd
	.align	2
	.global	IsNewpicSeg
	.type	IsNewpicSeg, %function
IsNewpicSeg:
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
	cmp	r2, #2
	ldr	ip, [r3]
	movne	lr, #0
	beq	.L355
.L342:
	ldrb	r4, [ip]	@ zero_extendqisi2
	ldrb	r5, [ip, #1]	@ zero_extendqisi2
	cmp	r4, #0
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	bne	.L345
	cmp	r5, #0
	bne	.L345
	cmp	ip, #1
	bne	.L345
.L343:
	str	lr, [sp]
	bl	CheckNewPicSegByVidStd
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L355:
	ldrb	lr, [r3, #72]	@ zero_extendqisi2
	ands	lr, lr, #1
	beq	.L342
	b	.L343
.L345:
	str	ip, [sp, #4]
	mov	r3, r4
	str	r5, [sp]
	movw	r1, #2569
	ldr	r2, .L356
	mov	r0, #20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L357:
	.align	2
.L356:
	.word	.LC21
	UNWIND(.fnend)
	.size	IsNewpicSeg, .-IsNewpicSeg
	.align	2
	.global	OpenUsdPool_WithMem
	.type	OpenUsdPool_WithMem, %function
OpenUsdPool_WithMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L365
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #16]
	cmp	ip, #0
	beq	.L364
.L359:
	add	r1, ip, #203776
	mov	r0, #0
	add	r1, r1, #512
	mov	r3, ip
	mov	r2, r0
	str	r0, [ip]
.L361:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L361
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L364:
	cmp	r1, #0
	str	r1, [r0, #16]
	movne	ip, r1
	bne	.L359
.L362:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L366:
	.align	2
.L365:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	2
	.global	CloseUsdPool_WithMem
	.type	CloseUsdPool_WithMem, %function
CloseUsdPool_WithMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L372
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #16]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #16]
	ldmfd	sp, {fp, sp, pc}
.L373:
	.align	2
.L372:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	CloseUsdPool_WithMem, .-CloseUsdPool_WithMem
	.align	2
	.global	InitUsdPool
	.type	InitUsdPool, %function
InitUsdPool:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L379
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #16]
	cmp	r0, #0
	beq	.L377
	add	r1, r0, #203776
	mov	ip, #0
	add	r1, r1, #512
	mov	r3, r0
	mov	r2, ip
	str	ip, [r0]
.L376:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L376
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L377:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L380:
	.align	2
.L379:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	InitUsdPool, .-InitUsdPool
	.align	2
	.global	GetUsd
	.type	GetUsd, %function
GetUsd:
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
	ldr	r3, .L388
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #16]
	cmp	ip, #0
	beq	.L385
	mov	r3, ip
	mov	r2, #0
	b	.L384
.L383:
	add	r2, r2, #1
	add	r3, r3, #1056
	cmp	r2, #192
	add	r3, r3, #8
	beq	.L387
.L384:
	ldr	r1, [r3, #1048]
	cmp	r1, #0
	bne	.L383
	ldr	r1, [r3, #1044]
	cmp	r1, #0
	bne	.L383
	movw	r0, #1064
	mov	r4, #0
	mul	r3, r0, r2
	mov	r5, #0
	mla	r2, r2, r0, r0
	add	r6, ip, r3
	add	r3, r3, #8
	add	lr, r6, #1024
	add	r0, ip, r3
	str	r1, [r6, #1044]
	add	lr, lr, #8
	strd	r4, [ip, r2]
	str	r1, [r6, #1060]
	str	r1, [r6, #1056]
	str	r1, [r6, #1052]
	strb	r1, [r6, #1034]
	strb	r1, [r6, #1035]
	strb	r1, [r6, #1036]
	strh	r1, [lr, #6]	@ movhi
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L387:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L385:
	mov	r0, ip
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L389:
	.align	2
.L388:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	GetUsd, .-GetUsd
	.align	2
	.global	FreeUsdByDec
	.type	FreeUsdByDec, %function
FreeUsdByDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	movne	r3, #0
	strne	r3, [r1, #1040]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FreeUsdByDec, .-FreeUsdByDec
	.align	2
	.global	IsImageInVoQueue
	.type	IsImageInVoQueue, %function
IsImageInVoQueue:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	beq	.L406
	ldrh	r3, [r0, #4]
	ldrh	lr, [r0, #8]
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L400
.L399:
	add	r2, r0, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L398
	ldr	ip, [r2, #88]
	ldr	r2, [r1, #88]
	cmp	ip, r2
	beq	.L401
.L398:
	cmp	r3, lr
	bne	.L399
.L400:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L401:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L406:
	mov	r0, r1
	ldr	r2, .L407
	movw	r1, #2680
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L408:
	.align	2
.L407:
	.word	.LC3
	UNWIND(.fnend)
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	2
	.global	SetAspectRatio
	.type	SetAspectRatio, %function
SetAspectRatio:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	ip, r0
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L410
.L412:
	.word	.L411
	.word	.L413
	.word	.L414
	.word	.L415
	.word	.L416
	.word	.L417
.L417:
	mov	r2, #0
	mov	r3, #2
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L411:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L413:
	mov	r2, #4
	mov	r3, #3
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L414:
	mov	r2, #16
	mov	r3, #9
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L415:
	mov	r2, #221
	mov	r3, #100
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L416:
	mov	r2, #235
	mov	r3, #100
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L410:
	mov	r0, #1
	mov	r3, r1
	str	r0, [ip, #60]
	mov	r1, #0
	ldr	r2, .L419
	str	r1, [ip, #56]
	movw	r1, #2743
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L420:
	.align	2
.L419:
	.word	.LC22
	UNWIND(.fnend)
	.size	SetAspectRatio, .-SetAspectRatio
	.align	2
	.global	GetVoLastImageID
	.type	GetVoLastImageID, %function
GetVoLastImageID:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r0, [r0, #296]
	cmp	r0, #1
	mvnls	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetVoLastImageID, .-GetVoLastImageID
	.align	2
	.global	IsMain10Profile
	.type	IsMain10Profile, %function
IsMain10Profile:
	UNWIND(.fnstart)
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsMain10Profile, .-IsMain10Profile
	.align	2
	.global	IsPtsRewind
	.type	IsPtsRewind, %function
IsPtsRewind:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r1, .L429
	ldrd	r4, [fp, #4]
	ldr	r1, [r1, r0, asl #2]
	subs	r2, r2, r4
	sbc	r3, r3, r5
	add	r1, r1, #204800
	ldr	r1, [r1, #2540]
	cmp	r1, #0
	bne	.L428
	cmp	r3, #0
	cmpeq	r2, #16000
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L428:
	mov	r1, #0
	mov	r0, #9216
	cmp	r3, r1
	movt	r0, 244
	cmpeq	r2, r0
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L430:
	.align	2
.L429:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	IsPtsRewind, .-IsPtsRewind
	.align	2
	.global	MetadataMapToSec
	.type	MetadataMapToSec, %function
MetadataMapToSec:
	UNWIND(.fnstart)
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MetadataMapToSec, .-MetadataMapToSec
	.align	2
	.global	MetadataUnMapToSec
	.type	MetadataUnMapToSec, %function
MetadataUnMapToSec:
	UNWIND(.fnstart)
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MetadataUnMapToSec, .-MetadataUnMapToSec
	.global	pstVdecUsdPool
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__FUNCTION__.9351, %object
	.size	__FUNCTION__.9351, 19
__FUNCTION__.9351:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__func__.9386, %object
	.size	__func__.9386, 20
__func__.9386:
	.ascii	"SYNTAX_MarkImageEos\000"
	.type	__func__.9393, %object
	.size	__func__.9393, 20
__func__.9393:
	.ascii	"SYNTAX_ReceiveImage\000"
	.type	__func__.9423, %object
	.size	__func__.9423, 20
__func__.9423:
	.ascii	"SYNTAX_ReleaseImage\000"
	.type	__func__.9466, %object
	.size	__func__.9466, 13
__func__.9466:
	.ascii	"DecodeStream\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Initializing VO queue\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"ResetVoQueue but still remain image not output(head" )
	ASCII(.ascii	":%d, tail:%d).\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"Chan:%d out_pts: %lld -> %lld Usertag %lld\012\000" )
.LC3:
	ASCII(.ascii	"image point NULL\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"call InsertVOQueue\012\000" )
.LC5:
	ASCII(.ascii	"FATAL: p_image(id=%d) has already in the VoQueue!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC6:
	ASCII(.ascii	"error=%d,W=%d,H=%d,not acceptable!\012\000" )
.LC7:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) + F%d\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"%s: Get image ptr err! Tail:%d\012\000" )
.LC9:
	ASCII(.ascii	"%s, pstVoQue is NULL!!!\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) - F%d\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"SYNTAX_ReleaseImage p_image is null\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"Image(id %d) not found in vo queue(magic word %d), " )
	ASCII(.ascii	"no need to deal with.Phyaddr = 0x%x\012\000" )
.LC13:
	ASCII(.ascii	"image[%d] null\012\000" )
.LC14:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) x F%d\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"%s call SYNTAX_ReleaseImage_RecycleImage failed.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC16:
	ASCII(.ascii	"pSegMan error!\012\000" )
.LC17:
	ASCII(.ascii	"More than two packet!!!ERROR!!!\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"%s unsupport standard %d\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"%s not support VidStd %d, pSegMan %p not used.\012\000" )
.LC20:
	ASCII(.ascii	"VidStd=%d Error!\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"WARNNING: aspect ration (%d) is not expected!\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	last_rec_pos_time.9348, %object
	.size	last_rec_pos_time.9348, 16
last_rec_pos_time.9348:
	.space	16
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 16
pstVdecUsdPool:
	.space	16
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
