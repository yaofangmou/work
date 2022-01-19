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
	mov	r3, r1
	cmp	r0, #16
	ldrls	pc, [pc, r0, asl #2]
	b	.L9
.L12:
	.word	.L11
	.word	.L9
	.word	.L13
	.word	.L14
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L15
.L15:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_DECRecycleImage
.L14:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_RecycleImage
.L13:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_RecycleImage
.L11:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_RecycleImage
.L9:
	ldmfd	sp, {fp, sp, pc}
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
	beq	.L17
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
	beq	.L27
	cmp	r2, #1
	mvnhi	r6, #0
	mvnhi	r7, #0
	bls	.L19
.L17:
	mov	r0, r6
	mov	r1, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L27:
	cmp	r2, #1
	bhi	.L17
	ldrb	r2, [r3, #156]	@ zero_extendqisi2
	and	r2, r2, #3
	cmp	r2, #2
	bne	.L17
.L19:
	mvn	r1, #0
	str	r1, [r3, #200]
	mov	r6, r1
	mov	r7, r1
	str	r1, [r3, #204]
	b	.L17
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
	ldr	lr, .L29
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
	ldr	r2, .L29+4
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
.L30:
	.align	2
.L29:
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
	beq	.L32
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldrne	r2, [r4, #32]
	beq	.L32
.L33:
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
	beq	.L35
	ldr	r1, .L58
	ldr	r1, [r1]
	subs	ip, r1, #0
	beq	.L36
	strb	r3, [fp, #-52]
	mov	r1, #6
	strb	r2, [fp, #-51]
	mov	r3, #2
	sub	r2, fp, #52
	mov	r0, r7
	blx	ip
.L36:
	str	r9, [r5, #272]
.L35:
	ldr	r3, [r5, #276]
	cmp	r3, r8
	beq	.L37
	ldr	r3, .L58
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L38
	sub	r2, fp, #44
	mov	r3, #1
	mov	r1, #3
	mov	r0, r7
	strb	r10, [r2, #-8]!
	blx	r9
.L38:
	str	r8, [r5, #276]
.L37:
	ldr	r3, [r5, #288]
	cmp	r3, r6
	beq	.L57
.L39:
	ldr	r3, .L58
	ldr	r2, [fp, #-56]
	str	r6, [r5, #288]
	str	r2, [r5, #292]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L31
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
.L31:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L32:
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #36]
	mov	r1, r2, lsr #1
	str	r2, [r4, #40]
	str	r3, [r4, #44]
	mov	r3, r3, lsr #1
	str	r1, [r4, #48]
	str	r3, [r4, #52]
	b	.L33
.L57:
	ldr	r3, [r5, #292]
	ldr	r2, [fp, #-56]
	cmp	r3, r2
	bne	.L39
	b	.L31
.L59:
	.align	2
.L58:
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
	beq	.L94
	ldr	r7, .L99
	mov	r1, #416
	ldr	r2, .L99+4
	mov	r0, #3
	bl	dprint_normal
	mov	r0, #2
	ldr	r3, [r7, #12]
	blx	r3
	ldrh	r4, [r6, #4]
	ldrh	r1, [r6, #8]
	and	r4, r4, #63
	cmp	r1, r4
	bne	.L68
	b	.L67
.L66:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r1, r4
	beq	.L67
.L68:
	add	r3, r6, r4, lsl #2
	ldr	r2, [r5, #88]
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #88]
	cmp	r3, r2
	bne	.L66
	movw	r1, #431
	ldr	r2, .L99+8
	mov	r0, #0
	add	r4, r4, #1
	bl	dprint_normal
	mov	r3, #1000
	str	r3, [r5, #96]
	and	r4, r4, #63
	ldrh	r1, [r6, #8]
	cmp	r1, r4
	bne	.L68
.L67:
	ldr	r3, [r5, #96]
	cmp	r3, #100
	bhi	.L95
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #36]
	cmp	r2, #31
	bhi	.L96
.L69:
	str	r1, [sp, #4]
	mov	r0, #0
	str	r2, [sp]
	movw	r1, #438
	ldr	r2, .L99+12
	bl	dprint_normal
	ldr	r3, [r5, #96]
	cmp	r3, #1000
	beq	.L72
	mov	r2, r5
	mov	r1, r10
	mov	r0, r9
	bl	ReturnImageToSyntax
.L72:
	ldr	r3, [r7, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
.L62:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L96:
	cmp	r1, #31
	bls	.L69
	ldr	r10, .L99+16
	cmp	r9, #20
	str	r9, [r5, #148]
	add	r1, r5, #264
	mov	r0, r8
	ldr	r4, .L99+20
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
	ldr	r2, .L99+24
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
	beq	.L97
.L76:
	mov	r3, #100
	ldr	r1, [r5, #20]
	mla	r3, r3, r8, r4
	ldr	r2, [r7, #16]
	mov	r0, #2
	str	r1, [r3, #96]
	blx	r2
	ldr	r3, .L99+28
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L77
	mov	r2, r5
	mov	r3, #0
	mov	r1, #4
	mov	r0, r8
	blx	r6
.L77:
	mov	r0, #8
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L98
.L79:
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
	bcc	.L62
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L81
	movw	r0, #10000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r6, #8]
.L81:
	mov	r3, #100
	mov	r2, #0
	mul	r8, r3, r8
	mov	r0, #1
	add	r3, r4, r8
	str	r7, [r4, r8]
	str	r2, [r3, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L95:
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #36]
	b	.L69
.L98:
	ldr	r3, [r7]
	blx	r3
	ldr	ip, .L99+32
	ldr	r2, .L99+36
	ldr	r3, [ip, r8, asl #2]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	mov	lr, r0
	cmp	r3, r2
	bls	.L79
	mov	r2, r8, asl #24
	movw	r1, #523
	add	r2, r2, #524288
	ldr	r0, .L99+40
	str	lr, [ip, r8, asl #2]
	bl	DBG_AddTrace
	b	.L79
.L97:
	ldr	r3, [r7]
	blx	r3
	str	r0, [r9, #32]
	b	.L76
.L94:
	mov	r0, r5
	ldr	r2, .L99+44
	mov	r1, #412
	bl	dprint_normal
	mvn	r0, #1
	b	.L62
.L100:
	.align	2
.L99:
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
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L114
.L110:
	.word	.L115
	.word	.L114
	.word	.L111
	.word	.L112
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L114
	.word	.L113
.L113:
	add	r0, r0, #7872
.L115:
	add	r0, r0, #16
	ldmfd	sp, {fp, sp, pc}
.L112:
	add	r0, r0, #81920
	add	r0, r0, #64
	ldmfd	sp, {fp, sp, pc}
.L111:
	add	r0, r0, #22528
	add	r0, r0, #32
	ldmfd	sp, {fp, sp, pc}
.L114:
	mov	r0, #0
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
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L129
.L119:
	.word	.L118
	.word	.L129
	.word	.L120
	.word	.L121
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L122
.L122:
	add	r7, r1, #7872
	add	r7, r7, #16
.L117:
	cmp	r7, #0
	beq	.L129
	ldr	r6, .L135
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r4, [r7, #4]
	ldrh	r2, [r7, #6]
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L126
.L127:
	add	r3, r7, r4, lsl #2
	mov	r0, r5
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L125
	bl	FSP_MarkImageOutHanging
	ldrh	r2, [r7, #6]
.L125:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L127
.L126:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L121:
	add	r7, r1, #81920
	add	r7, r7, #64
	b	.L117
.L120:
	add	r7, r1, #22528
	add	r7, r7, #32
	b	.L117
.L118:
	add	r7, r1, #16
	b	.L117
.L129:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L136:
	.align	2
.L135:
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
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L152
.L140:
	.word	.L139
	.word	.L152
	.word	.L141
	.word	.L142
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L152
	.word	.L143
.L143:
	add	r4, r1, #7872
	add	r4, r4, #16
.L138:
	cmp	r4, #0
	beq	.L152
	ldr	r5, .L159
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
	ble	.L147
	cmp	r3, #0
	subne	r3, r3, #1
	moveq	r3, #63
	uxthne	r3, r3
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L158
	mov	r1, #1
	ldr	r2, [r5, #16]
	mov	r0, #2
	str	r1, [r3, #108]
	blx	r2
	mov	r4, #0
.L157:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L142:
	add	r4, r1, #81920
	add	r4, r4, #64
	b	.L138
.L139:
	add	r4, r1, #16
	b	.L138
.L141:
	add	r4, r1, #22528
	add	r4, r4, #32
	b	.L138
.L147:
	ldr	r4, [r4, #296]
	mov	r0, #2
	ldr	r3, [r5, #16]
	cmp	r4, r0
	mvncc	r4, #0
	blx	r3
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L152:
	mvn	r4, #0
	b	.L157
.L158:
	ldr	r3, [r5, #16]
	mov	r0, #2
	blx	r3
	ldrh	ip, [r4, #8]
	ldr	r3, .L159+4
	movw	r1, #743
	ldr	r2, .L159+8
	mov	r0, #1
	str	ip, [sp]
	mvn	r4, #0
	bl	dprint_normal
	b	.L157
.L160:
	.align	2
.L159:
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
	beq	.L171
	ldr	r3, [r0]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L174
.L165:
	.word	.L164
	.word	.L174
	.word	.L166
	.word	.L167
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L174
	.word	.L168
.L168:
	add	r4, r0, #7872
	add	r4, r4, #16
.L163:
	cmp	r4, #0
	beq	.L174
	ldr	r9, .L175
	mov	r0, #2
	ldr	r3, [r9, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r2, r3
	mvneq	r8, #2
	beq	.L170
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
	ldr	r2, .L175+4
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
.L170:
	ldr	r3, [r9, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r8
.L162:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L164:
	add	r4, r0, #16
	b	.L163
.L166:
	add	r4, r0, #22528
	add	r4, r4, #32
	b	.L163
.L167:
	add	r4, r0, #81920
	add	r4, r4, #64
	b	.L163
.L174:
	ldr	r3, .L175+8
	movw	r1, #774
	ldr	r2, .L175+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #1
	b	.L162
.L171:
	mvn	r0, #1
	b	.L162
.L176:
	.align	2
.L175:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC10
	.word	.LANCHOR1+40
	.word	.LC9
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
	beq	.L180
	cmp	r3, #16
	beq	.L180
	cmn	r1, #2
	beq	.L184
	cmp	r1, #1
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L180:
	cmp	r1, #0
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L184:
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
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L195
.L191:
	.word	.L190
	.word	.L195
	.word	.L192
	.word	.L193
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L195
	.word	.L194
.L194:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	HEVC_DECRecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L193:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MPEG2DEC_RecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L192:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MPEG4DEC_RecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L190:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	H264DEC_RecycleImage
	mov	r1, r0
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L195:
	mvn	r1, #1
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
	mov	r9, r0
	beq	.L226
	ldr	r3, [r0]
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L222
.L201:
	.word	.L200
	.word	.L222
	.word	.L202
	.word	.L203
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L204
.L204:
	add	r5, r0, #7872
	add	r5, r5, #16
.L199:
	cmp	r5, #0
	beq	.L222
	ldr	r8, .L228
	mov	r0, #2
	ldr	r3, [r8, #12]
	blx	r3
	ldrh	r4, [r5, #4]
	ldrh	r2, [r5, #6]
	and	r4, r4, #63
	ldr	r3, [r6, #88]
	ldr	r1, [r5, #344]
	cmp	r2, r4
	rsb	r7, r1, r3
	bne	.L213
	b	.L214
.L210:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L227
.L213:
	add	r10, r4, #2
	add	r3, r5, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L208
	ldr	ip, [r3, #88]
	rsb	ip, ip, r7
	clz	ip, ip
	mov	ip, ip, lsr #5
	cmp	ip, #0
	beq	.L210
.L209:
	ldrh	r0, [r5, #4]
	b	.L212
.L217:
	mov	r4, r2
.L212:
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
	bne	.L217
	ldr	r3, [r6, #88]
	cmp	ip, #1
	ldr	r2, [r5, #344]
	rsb	r3, r2, r3
	str	r3, [r6, #88]
	ldrh	r3, [r5, #4]
	add	r3, r3, #1
	and	r3, r3, #63
	strh	r3, [r5, #4]	@ movhi
	beq	.L225
	ldrh	r2, [r5, #6]
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L213
.L227:
	ldr	r1, [r5, #344]
	ldr	r3, [r6, #88]
.L214:
	ldr	ip, [r6, #444]
	mov	r0, #1
	str	r1, [sp]
	movw	r1, #1014
	ldr	r2, .L228+4
	mvn	r4, #1
	str	ip, [sp, #4]
	bl	dprint_normal
.L207:
	ldr	r3, [r8, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r4
.L198:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L203:
	add	r5, r0, #81920
	add	r5, r5, #64
	b	.L199
.L202:
	add	r5, r0, #22528
	add	r5, r5, #32
	b	.L199
.L200:
	add	r5, r0, #16
	b	.L199
.L208:
	mov	r3, r4
	ldr	r2, .L228+8
	movw	r1, #1032
	mov	r0, #1
	bl	dprint_normal
	mov	ip, #2
	b	.L209
.L225:
	ldr	r0, [r6, #88]
	movw	r1, #1058
	ldr	r2, .L228+12
	str	r0, [sp, #8]
	mov	r0, #10
	ldrh	ip, [r5, #8]
	str	ip, [sp, #4]
	ldrh	ip, [r5, #6]
	str	ip, [sp]
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r9
	bl	SYNTAX_ReleaseImage_RecycleImage
	cmp	r0, #1
	mov	r4, r0
	beq	.L207
	ldr	r3, .L228+16
	movw	r1, #1063
	ldr	r2, .L228+20
	mov	r0, #0
	bl	dprint_normal
	b	.L207
.L222:
	ldr	r3, .L228+16
	mov	r1, #1000
	ldr	r2, .L228+24
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #1
	b	.L198
.L226:
	ldr	r2, .L228+28
	mov	r1, #992
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #1
	b	.L198
.L229:
	.align	2
.L228:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR1+60
	.word	.LC15
	.word	.LC9
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
	b	.L239
.L233:
	.word	.L237
	.word	.L239
	.word	.L234
	.word	.L235
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L236
	.word	.L239
	.word	.L239
	.word	.L239
	.word	.L237
.L237:
	add	r4, r0, #16
.L238:
	ldr	r5, .L240
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
.L236:
	add	r4, r0, #7872
	add	r4, r4, #16
	b	.L238
.L234:
	add	r4, r0, #22528
	add	r4, r4, #32
	b	.L238
.L235:
	add	r4, r0, #81920
	add	r4, r4, #64
	b	.L238
.L239:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L241:
	.align	2
.L240:
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
	ldr	r3, .L248
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
	beq	.L247
.L242:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L247:
	add	r5, r5, #12288
	ldrb	r3, [r5, #1272]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L242
	ldr	r0, [r1, #1840]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1272]
	b	.L242
.L249:
	.align	2
.L248:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	2
	.global	DecodeStream_HEVC
	.type	DecodeStream_HEVC, %function
DecodeStream_HEVC:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r3, [r0, #8]
	mov	r4, r0
	mov	r5, r1
	ldr	r6, [r4, #20]
	mov	r0, r1
	ldr	lr, [r4, #24]
	sub	r1, fp, #52
	ldrb	ip, [r4, #14]	@ zero_extendqisi2
	ldr	r2, [r4, #28]
	str	r3, [fp, #-48]
	ldrsb	r3, [r4, #13]
	str	r6, [fp, #-44]
	str	lr, [fp, #-36]
	strb	ip, [fp, #-52]
	str	r2, [fp, #-32]
	str	r3, [fp, #-40]
	bl	HEVCDEC_DecodePacket
	cmn	r0, #2
	beq	.L251
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L252
.L251:
	mov	r2, #1
	ldr	r3, .L259
	strb	r2, [r4, #1]
	ldr	r1, [r5, #248]
	ldr	r3, [r3, r1, asl #2]
	add	r3, r3, #204800
	strb	r2, [r3, #3536]
	ldr	r4, [r5, #2420]
	cmp	r4, #0
	beq	.L258
.L250:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L252:
	strb	r3, [r4, #1]
	ldr	r2, .L259
	ldr	r1, [r5, #248]
	ldr	r2, [r2, r1, asl #2]
	add	r2, r2, #204800
	strb	r3, [r2, #3536]
	ldr	r4, [r5, #2420]
	cmp	r4, #0
	bne	.L250
.L258:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L250
	ldr	r0, [r5, #248]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #9]
	b	.L250
.L260:
	.align	2
.L259:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
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
	beq	.L262
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L262
	ldr	r3, .L286
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L282
.L265:
	ldrb	r5, [r4, #14]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r4, #408]
	cmp	r5, #1
	beq	.L283
	cmp	r5, #0
	beq	.L284
.L270:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L284:
	ldr	r9, .L286+4
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
	bls	.L270
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
	ldr	r2, .L286+8
	movw	r1, #1976
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L286+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L269
	mov	r0, r6
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r7
.L269:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r4, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L282:
	ldr	r3, [r3, #3520]
	cmp	r3, #1
	bne	.L265
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L265
	mov	r2, #160
	add	r1, r4, #248
	add	r0, r4, #88
	bl	memcpy
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L283:
	ldrb	r5, [r4, #2]	@ zero_extendqisi2
	cmp	r5, r7
	beq	.L285
	cmp	r5, #1
	bne	.L270
	ldr	r2, [r4, #104]
	cmp	r2, #1024
	bcs	.L271
	ldr	r8, .L286+4
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
.L272:
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
.L285:
	ldr	r6, .L286+4
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
.L271:
	ldr	r3, .L286+4
	mov	r2, #80
	add	r1, r4, #8
	add	r0, r4, #168
	ldr	r3, [r3, #52]
	blx	r3
	b	.L272
.L262:
	ldr	r2, .L286+16
	mov	r1, #1936
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L287:
	.align	2
.L286:
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
	beq	.L294
.L289:
	mov	r1, r5
	ldr	r0, [r4]
	bl	SegMan
	cmp	r0, #0
	beq	.L295
.L291:
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
.L295:
	add	r1, r5, #88
	mov	r0, r4
	bl	MPEG2DEC_Decode
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r5, #1]
	b	.L291
.L294:
	ldr	r3, .L297
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L296
.L290:
	add	r1, r4, #80896
	mov	r0, r4
	add	r1, r1, #520
	bl	MPEG2DEC_Decode
	b	.L289
.L296:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L289
	b	.L290
.L298:
	.align	2
.L297:
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
	beq	.L304
.L300:
	mov	r1, r6
	ldr	r0, [r5, #2424]
	bl	SegMan
	cmp	r0, #0
	beq	.L305
.L302:
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
.L305:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG4DEC_Decode
	b	.L302
.L304:
	ldr	r3, .L307
	ldr	r3, [r3, r7, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L306
.L301:
	add	r1, r4, #15616
	mov	r0, r4
	add	r1, r1, #32
	bl	MPEG4DEC_Decode
	b	.L300
.L306:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L300
	b	.L301
.L308:
	.align	2
.L307:
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
	cmp	r4, #16
	ldrls	pc, [pc, r4, asl #2]
	b	.L310
.L312:
	.word	.L311
	.word	.L310
	.word	.L313
	.word	.L314
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L310
	.word	.L315
.L315:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_HEVC
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L314:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_MPEG2
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L313:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_MPEG4
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L311:
	mov	r0, r5
	mov	r1, r6
	bl	DecodeStream_H264
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L310:
	str	r4, [sp]
	movw	r1, #1922
	ldr	r3, .L317
	mov	r0, #1
	ldr	r2, .L317+4
	bl	dprint_normal
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L318:
	.align	2
.L317:
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
	ldr	r2, .L320
	mov	r3, r0
	movw	r1, #2108
	mov	r0, #0
	str	r0, [sp]
	mov	r0, #2
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L321:
	.align	2
.L320:
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
	ldr	r2, .L323
	mov	r3, r0
	movw	r1, #2167
	mov	r0, #0
	str	r0, [sp]
	mov	r0, #2
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L324:
	.align	2
.L323:
	.word	.LC19
	UNWIND(.fnend)
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	2
	.global	ReleaseCurPic
	.type	ReleaseCurPic, %function
ReleaseCurPic:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #16
	ldrls	pc, [pc, r0, asl #2]
	b	.L326
.L328:
	.word	.L327
	.word	.L326
	.word	.L329
	.word	.L330
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L326
	.word	.L331
.L331:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_ClearCurrPic
.L330:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_ClearCurPic
.L329:
	mov	r0, r1
	str	r1, [fp, #-16]
	bl	MP4_ClearCurPic
	ldr	r1, [fp, #-16]
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP4_Clean_HeadPacket
.L327:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_ClearCurrPic
.L326:
	mov	r3, r0
	ldr	r2, .L332
	movw	r1, #2333
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L333:
	.align	2
.L332:
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
	bne	.L342
	ldr	r1, .L344
	mvn	r5, #0
	mvn	r4, #0
	ldr	lr, [r1, r0, asl #2]
	add	lr, lr, #206848
	add	lr, lr, #672
	ldrd	r0, [lr, #-8]
	cmp	r1, r5
	cmpeq	r0, r4
	bne	.L341
	ldr	r1, [r6]
	cmp	r1, #0
	bne	.L341
	sub	r1, ip, #1
	uxtb	r1, r1
	cmp	r1, #174
	bls	.L343
.L341:
	mvn	r0, #0
.L336:
	cmp	ip, #0
	streq	ip, [r6]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L342:
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L341
	mov	r3, #1
	str	r3, [r6]
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	b	.L336
.L343:
	ldrd	r4, [r3, #24]
	mvn	r0, #0
	strd	r4, [lr, #-8]
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	b	.L336
.L345:
	.align	2
.L344:
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
	bne	.L358
.L347:
	cmp	r2, #1
	bne	.L351
.L348:
	mov	r2, #1
	str	r2, [r0]
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	mov	r3, #0
.L349:
	cmp	lr, #182
	moveq	r2, #0
	streq	r2, [r0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L358:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L348
	b	.L347
.L351:
	mvn	r3, #0
	b	.L349
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	ip, r1
	ldr	lr, [fp, #4]
	ldr	r1, [r3]
	cmp	r2, #16
	ldrls	pc, [pc, r2, asl #2]
	b	.L360
.L362:
	.word	.L361
	.word	.L360
	.word	.L363
	.word	.L364
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L365
.L365:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_IsNewPicNal
.L364:
	mov	r2, r1
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegMpeg2
.L363:
	mov	r2, lr
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegMpeg4
.L361:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_IsNewPicNal
.L360:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
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
	beq	.L380
.L367:
	ldrb	r4, [ip]	@ zero_extendqisi2
	ldrb	r5, [ip, #1]	@ zero_extendqisi2
	cmp	r4, #0
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	bne	.L370
	cmp	r5, #0
	bne	.L370
	cmp	ip, #1
	bne	.L370
.L368:
	str	lr, [sp]
	bl	CheckNewPicSegByVidStd
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L380:
	ldrb	lr, [r3, #72]	@ zero_extendqisi2
	ands	lr, lr, #1
	beq	.L367
	b	.L368
.L370:
	str	ip, [sp, #4]
	mov	r3, r4
	str	r5, [sp]
	movw	r1, #2569
	ldr	r2, .L381
	mov	r0, #20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L382:
	.align	2
.L381:
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
	ldr	r3, .L390
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #16]
	cmp	ip, #0
	beq	.L389
.L384:
	add	r1, ip, #203776
	mov	r0, #0
	add	r1, r1, #512
	mov	r3, ip
	mov	r2, r0
	str	r0, [ip]
.L386:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L386
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L389:
	cmp	r1, #0
	str	r1, [r0, #16]
	movne	ip, r1
	bne	.L384
.L387:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L391:
	.align	2
.L390:
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
	ldr	r3, .L397
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #16]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #16]
	ldmfd	sp, {fp, sp, pc}
.L398:
	.align	2
.L397:
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
	ldr	r3, .L404
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #16]
	cmp	r0, #0
	beq	.L402
	add	r1, r0, #203776
	mov	ip, #0
	add	r1, r1, #512
	mov	r3, r0
	mov	r2, ip
	str	ip, [r0]
.L401:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L401
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L402:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L405:
	.align	2
.L404:
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
	ldr	r3, .L413
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #16]
	cmp	ip, #0
	beq	.L410
	mov	r3, ip
	mov	r2, #0
	b	.L409
.L408:
	add	r2, r2, #1
	add	r3, r3, #1056
	cmp	r2, #192
	add	r3, r3, #8
	beq	.L412
.L409:
	ldr	r1, [r3, #1048]
	cmp	r1, #0
	bne	.L408
	ldr	r1, [r3, #1044]
	cmp	r1, #0
	bne	.L408
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
.L412:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L410:
	mov	r0, ip
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L414:
	.align	2
.L413:
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
	beq	.L431
	ldrh	r3, [r0, #4]
	ldrh	lr, [r0, #8]
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L425
.L424:
	add	r2, r0, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L423
	ldr	ip, [r2, #88]
	ldr	r2, [r1, #88]
	cmp	ip, r2
	beq	.L426
.L423:
	cmp	r3, lr
	bne	.L424
.L425:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L426:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L431:
	mov	r0, r1
	ldr	r2, .L432
	movw	r1, #2680
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L433:
	.align	2
.L432:
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
	b	.L435
.L437:
	.word	.L436
	.word	.L438
	.word	.L439
	.word	.L440
	.word	.L441
	.word	.L442
.L442:
	mov	r2, #0
	mov	r3, #2
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L436:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L438:
	mov	r2, #4
	mov	r3, #3
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L439:
	mov	r2, #16
	mov	r3, #9
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L440:
	mov	r2, #221
	mov	r3, #100
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L441:
	mov	r2, #235
	mov	r3, #100
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L435:
	mov	r0, #1
	mov	r3, r1
	str	r0, [ip, #60]
	mov	r1, #0
	ldr	r2, .L444
	str	r1, [ip, #56]
	movw	r1, #2743
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L445:
	.align	2
.L444:
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
	ldr	r3, [r0, #304]
	cmp	r3, #1
	beq	.L453
	ldr	r2, [r0, #308]
	cmp	r2, #1
	beq	.L453
	cmp	r3, #2
	ldr	r0, [r0, #312]
	moveq	r3, #1
	subne	r3, r0, #1
	clzne	r3, r3
	movne	r3, r3, lsr #5
.L451:
	cmp	r0, #1
	movne	r0, r3
	orreq	r0, r3, #1
	ldmfd	sp, {fp, sp, pc}
.L453:
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
	ldr	r1, .L460
	ldrd	r4, [fp, #4]
	ldr	r1, [r1, r0, asl #2]
	subs	r2, r2, r4
	sbc	r3, r3, r5
	add	r1, r1, #204800
	ldr	r1, [r1, #2540]
	cmp	r1, #0
	bne	.L459
	cmp	r3, #0
	cmpeq	r2, #16000
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L459:
	mov	r1, #0
	mov	r0, #9216
	cmp	r3, r1
	movt	r0, 244
	cmpeq	r2, r0
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L461:
	.align	2
.L460:
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
	.type	__FUNCTION__.10628, %object
	.size	__FUNCTION__.10628, 19
__FUNCTION__.10628:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__func__.10664, %object
	.size	__func__.10664, 20
__func__.10664:
	.ascii	"SYNTAX_MarkImageEos\000"
	.type	__func__.10671, %object
	.size	__func__.10671, 20
__func__.10671:
	.ascii	"SYNTAX_ReceiveImage\000"
	.type	__func__.10703, %object
	.size	__func__.10703, 20
__func__.10703:
	.ascii	"SYNTAX_ReleaseImage\000"
	.type	__func__.10754, %object
	.size	__func__.10754, 13
__func__.10754:
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
	.type	last_rec_pos_time.10625, %object
	.size	last_rec_pos_time.10625, 16
last_rec_pos_time.10625:
	.space	16
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 16
pstVdecUsdPool:
	.space	16
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
