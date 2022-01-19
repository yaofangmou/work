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
	cmp	r0, #20
	ldrls	pc, [pc, r0, asl #2]
	b	.L9
.L12:
	.word	.L11
	.word	.L13
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L9
	.word	.L17
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L18
	.word	.L18
	.word	.L18
	.word	.L19
	.word	.L16
	.word	.L20
	.word	.L21
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L22
.L22:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_USERDEC_RecycleFrameBuffer
.L11:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_RecycleImage
.L13:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_RecycleImage
.L14:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_RecycleImage
.L15:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_RecycleImage
.L16:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H263DEC_RecycleImage
.L17:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_RecycleImage
.L18:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_RecycleImage
.L19:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_RecycleImage
.L20:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_RecycleImage
.L21:
	ldr	r1, [r2, #88]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_DECRecycleImage
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
	beq	.L24
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
	beq	.L34
	cmp	r2, #1
	mvnhi	r6, #0
	mvnhi	r7, #0
	bls	.L26
.L24:
	mov	r0, r6
	mov	r1, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L34:
	cmp	r2, #1
	bhi	.L24
	ldrb	r2, [r3, #156]	@ zero_extendqisi2
	and	r2, r2, #3
	cmp	r2, #2
	bne	.L24
.L26:
	mvn	r1, #0
	str	r1, [r3, #200]
	mov	r6, r1
	mov	r7, r1
	str	r1, [r3, #204]
	b	.L24
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
	ldr	lr, .L36
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
	ldr	r2, .L36+4
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
.L37:
	.align	2
.L36:
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
	beq	.L39
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldrne	r2, [r4, #32]
	beq	.L39
.L40:
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
	beq	.L42
	ldr	r1, .L65
	ldr	r1, [r1]
	subs	ip, r1, #0
	beq	.L43
	strb	r3, [fp, #-52]
	mov	r1, #6
	strb	r2, [fp, #-51]
	mov	r3, #2
	sub	r2, fp, #52
	mov	r0, r7
	blx	ip
.L43:
	str	r9, [r5, #272]
.L42:
	ldr	r3, [r5, #276]
	cmp	r3, r8
	beq	.L44
	ldr	r3, .L65
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L45
	sub	r2, fp, #44
	mov	r3, #1
	mov	r1, #3
	mov	r0, r7
	strb	r10, [r2, #-8]!
	blx	r9
.L45:
	str	r8, [r5, #276]
.L44:
	ldr	r3, [r5, #288]
	cmp	r3, r6
	beq	.L64
.L46:
	ldr	r3, .L65
	ldr	r2, [fp, #-56]
	str	r6, [r5, #288]
	str	r2, [r5, #292]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L38
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
.L38:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L39:
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #36]
	mov	r1, r2, lsr #1
	str	r2, [r4, #40]
	str	r3, [r4, #44]
	mov	r3, r3, lsr #1
	str	r1, [r4, #48]
	str	r3, [r4, #52]
	b	.L40
.L64:
	ldr	r3, [r5, #292]
	ldr	r2, [fp, #-56]
	cmp	r3, r2
	bne	.L46
	b	.L38
.L66:
	.align	2
.L65:
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
	beq	.L101
	ldr	r7, .L106
	mov	r1, #416
	ldr	r2, .L106+4
	mov	r0, #3
	bl	dprint_normal
	mov	r0, #2
	ldr	r3, [r7, #12]
	blx	r3
	ldrh	r4, [r6, #4]
	ldrh	r1, [r6, #8]
	and	r4, r4, #63
	cmp	r1, r4
	bne	.L75
	b	.L74
.L73:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r1, r4
	beq	.L74
.L75:
	add	r3, r6, r4, lsl #2
	ldr	r2, [r5, #88]
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #88]
	cmp	r3, r2
	bne	.L73
	movw	r1, #431
	ldr	r2, .L106+8
	mov	r0, #0
	add	r4, r4, #1
	bl	dprint_normal
	mov	r3, #1000
	str	r3, [r5, #96]
	and	r4, r4, #63
	ldrh	r1, [r6, #8]
	cmp	r1, r4
	bne	.L75
.L74:
	ldr	r3, [r5, #96]
	cmp	r3, #100
	bhi	.L102
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #36]
	cmp	r2, #31
	bhi	.L103
.L76:
	str	r1, [sp, #4]
	mov	r0, #0
	str	r2, [sp]
	movw	r1, #438
	ldr	r2, .L106+12
	bl	dprint_normal
	ldr	r3, [r5, #96]
	cmp	r3, #1000
	beq	.L79
	mov	r2, r5
	mov	r1, r10
	mov	r0, r9
	bl	ReturnImageToSyntax
.L79:
	ldr	r3, [r7, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
.L69:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L103:
	cmp	r1, #31
	bls	.L76
	ldr	r10, .L106+16
	cmp	r9, #20
	str	r9, [r5, #148]
	add	r1, r5, #264
	mov	r0, r8
	ldr	r4, .L106+20
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
	ldr	r2, .L106+24
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
	beq	.L104
.L83:
	mov	r3, #100
	ldr	r1, [r5, #20]
	mla	r3, r3, r8, r4
	ldr	r2, [r7, #16]
	mov	r0, #2
	str	r1, [r3, #96]
	blx	r2
	ldr	r3, .L106+28
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L84
	mov	r2, r5
	mov	r3, #0
	mov	r1, #4
	mov	r0, r8
	blx	r6
.L84:
	mov	r0, #8
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L105
.L86:
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
	bcc	.L69
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L88
	movw	r0, #10000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r6, #8]
.L88:
	mov	r3, #100
	mov	r2, #0
	mul	r8, r3, r8
	mov	r0, #1
	add	r3, r4, r8
	str	r7, [r4, r8]
	str	r2, [r3, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L102:
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #36]
	b	.L76
.L105:
	ldr	r3, [r7]
	blx	r3
	ldr	ip, .L106+32
	ldr	r2, .L106+36
	ldr	r3, [ip, r8, asl #2]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	mov	lr, r0
	cmp	r3, r2
	bls	.L86
	mov	r2, r8, asl #24
	movw	r1, #523
	add	r2, r2, #524288
	ldr	r0, .L106+40
	str	lr, [ip, r8, asl #2]
	bl	DBG_AddTrace
	b	.L86
.L104:
	ldr	r3, [r7]
	blx	r3
	str	r0, [r9, #32]
	b	.L83
.L101:
	mov	r0, r5
	ldr	r2, .L106+44
	mov	r1, #412
	bl	dprint_normal
	mvn	r0, #1
	b	.L69
.L107:
	.align	2
.L106:
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
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L128
.L117:
	.word	.L129
	.word	.L118
	.word	.L119
	.word	.L120
	.word	.L121
	.word	.L128
	.word	.L122
	.word	.L128
	.word	.L128
	.word	.L128
	.word	.L123
	.word	.L123
	.word	.L123
	.word	.L124
	.word	.L121
	.word	.L125
	.word	.L126
	.word	.L128
	.word	.L128
	.word	.L128
	.word	.L129
.L126:
	add	r0, r0, #7872
.L129:
	add	r0, r0, #16
	ldmfd	sp, {fp, sp, pc}
.L118:
	add	r0, r0, #48384
	add	r0, r0, #232
	ldmfd	sp, {fp, sp, pc}
.L119:
	add	r0, r0, #22528
	add	r0, r0, #32
	ldmfd	sp, {fp, sp, pc}
.L120:
	add	r0, r0, #81920
	add	r0, r0, #64
	ldmfd	sp, {fp, sp, pc}
.L121:
	add	r0, r0, #22528
	add	r0, r0, #56
	ldmfd	sp, {fp, sp, pc}
.L122:
	add	r0, r0, #16128
	add	r0, r0, #16
	ldmfd	sp, {fp, sp, pc}
.L123:
	add	r0, r0, #12672
	ldmfd	sp, {fp, sp, pc}
.L124:
	add	r0, r0, #8192
	ldmfd	sp, {fp, sp, pc}
.L125:
	add	r0, r0, #592
	ldmfd	sp, {fp, sp, pc}
.L128:
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
	mov	r5, r0
	mov	r0, r1
	bl	SYNTAX_GetVoQue
	subs	r7, r0, #0
	beq	.L136
	ldr	r6, .L140
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r4, [r7, #4]
	ldrh	r2, [r7, #6]
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L134
.L135:
	add	r3, r7, r4, lsl #2
	mov	r0, r5
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L133
	bl	FSP_MarkImageOutHanging
	ldrh	r2, [r7, #6]
.L133:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L135
.L134:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L136:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L141:
	.align	2
.L140:
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
	mov	r0, r1
	bl	SYNTAX_GetVoQue
	subs	r4, r0, #0
	beq	.L150
	ldr	r5, .L155
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
	ble	.L146
	cmp	r3, #0
	subne	r3, r3, #1
	moveq	r3, #63
	uxthne	r3, r3
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L154
	mov	r1, #1
	ldr	r2, [r5, #16]
	mov	r0, #2
	str	r1, [r3, #108]
	blx	r2
	mov	r4, #0
.L153:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L146:
	ldr	r4, [r4, #296]
	mov	r0, #2
	ldr	r3, [r5, #16]
	cmp	r4, r0
	mvncc	r4, #0
	blx	r3
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L150:
	mvn	r4, #0
	b	.L153
.L154:
	ldr	r3, [r5, #16]
	mov	r0, #2
	blx	r3
	ldrh	ip, [r4, #8]
	ldr	r3, .L155+4
	movw	r1, #743
	ldr	r2, .L155+8
	mov	r0, #1
	str	ip, [sp]
	mvn	r4, #0
	bl	dprint_normal
	b	.L153
.L156:
	.align	2
.L155:
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
	beq	.L161
	bl	SYNTAX_GetVoQue
	subs	r4, r0, #0
	beq	.L163
	ldr	r9, .L164
	mov	r0, #2
	ldr	r3, [r9, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r2, r3
	mvneq	r8, #2
	beq	.L160
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
	ldr	r2, .L164+4
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
.L160:
	ldr	r3, [r9, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r8
.L158:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L161:
	mvn	r0, #1
	b	.L158
.L163:
	ldr	r3, .L164+8
	movw	r1, #774
	ldr	r2, .L164+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #1
	b	.L158
.L165:
	.align	2
.L164:
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
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L167
.L169:
	.word	.L170
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L170
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L170
	.word	.L170
	.word	.L170
.L170:
	cmp	r1, #0
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L167:
	cmn	r1, #2
	beq	.L178
	cmp	r1, #1
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L178:
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
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L194
.L183:
	.word	.L182
	.word	.L184
	.word	.L185
	.word	.L186
	.word	.L187
	.word	.L194
	.word	.L188
	.word	.L194
	.word	.L194
	.word	.L194
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L190
	.word	.L187
	.word	.L191
	.word	.L192
	.word	.L194
	.word	.L194
	.word	.L194
	.word	.L193
.L193:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	VCTRL_USERDEC_RecycleFrameBuffer
	mov	r1, r0
.L181:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L182:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	H264DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L184:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	VC1DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L185:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MPEG4DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L186:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MPEG2DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L187:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	H263DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L188:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	AVSDEC_RecycleImage
	mov	r1, r0
	b	.L181
.L189:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	VP6DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L190:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	VP8DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L191:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	MVC_DEC_RecycleImage
	mov	r1, r0
	b	.L181
.L192:
	ldr	r1, [r1, #88]
	add	r0, r0, #8
	bl	HEVC_DECRecycleImage
	mov	r1, r0
	b	.L181
.L194:
	mvn	r1, #1
	b	.L181
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
	beq	.L217
	bl	SYNTAX_GetVoQue
	subs	r5, r0, #0
	beq	.L218
	ldr	r8, .L220
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
	bne	.L206
	b	.L207
.L203:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L219
.L206:
	add	r10, r4, #2
	add	r3, r5, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L201
	ldr	ip, [r3, #88]
	rsb	ip, ip, r7
	clz	ip, ip
	mov	ip, ip, lsr #5
	cmp	ip, #0
	beq	.L203
.L202:
	ldrh	r0, [r5, #4]
	b	.L205
.L209:
	mov	r4, r2
.L205:
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
	bne	.L209
	ldr	r3, [r6, #88]
	cmp	ip, #1
	ldr	r2, [r5, #344]
	rsb	r3, r2, r3
	str	r3, [r6, #88]
	ldrh	r3, [r5, #4]
	add	r3, r3, #1
	and	r3, r3, #63
	strh	r3, [r5, #4]	@ movhi
	beq	.L216
	ldrh	r2, [r5, #6]
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L206
.L219:
	ldr	r1, [r5, #344]
	ldr	r3, [r6, #88]
.L207:
	ldr	ip, [r6, #444]
	mov	r0, #1
	str	r1, [sp]
	movw	r1, #1014
	ldr	r2, .L220+4
	mvn	r4, #1
	str	ip, [sp, #4]
	bl	dprint_normal
.L200:
	ldr	r3, [r8, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r4
.L197:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L201:
	mov	r3, r4
	ldr	r2, .L220+8
	movw	r1, #1032
	mov	r0, #1
	bl	dprint_normal
	mov	ip, #2
	b	.L202
.L216:
	ldr	r0, [r6, #88]
	movw	r1, #1058
	ldr	r2, .L220+12
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
	beq	.L200
	ldr	r3, .L220+16
	movw	r1, #1063
	ldr	r2, .L220+20
	mov	r0, #0
	bl	dprint_normal
	b	.L200
.L217:
	ldr	r2, .L220+24
	mov	r1, #992
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #1
	b	.L197
.L218:
	ldr	r3, .L220+16
	mov	r1, #1000
	ldr	r2, .L220+28
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #1
	b	.L197
.L221:
	.align	2
.L220:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR1+60
	.word	.LC15
	.word	.LC11
	.word	.LC9
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
	b	.L237
.L225:
	.word	.L235
	.word	.L226
	.word	.L227
	.word	.L228
	.word	.L229
	.word	.L237
	.word	.L230
	.word	.L237
	.word	.L237
	.word	.L237
	.word	.L231
	.word	.L231
	.word	.L231
	.word	.L232
	.word	.L229
	.word	.L233
	.word	.L234
	.word	.L237
	.word	.L237
	.word	.L237
	.word	.L235
.L235:
	add	r4, r0, #16
.L236:
	ldr	r5, .L238
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
.L226:
	add	r4, r0, #48384
	add	r4, r4, #232
	b	.L236
.L227:
	add	r4, r0, #22528
	add	r4, r4, #32
	b	.L236
.L228:
	add	r4, r0, #81920
	add	r4, r4, #64
	b	.L236
.L229:
	add	r4, r0, #22528
	add	r4, r4, #56
	b	.L236
.L230:
	add	r4, r0, #16128
	add	r4, r4, #16
	b	.L236
.L231:
	add	r4, r0, #12672
	b	.L236
.L232:
	add	r4, r0, #8192
	b	.L236
.L233:
	add	r4, r0, #592
	b	.L236
.L234:
	add	r4, r0, #7872
	add	r4, r4, #16
	b	.L236
.L237:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L239:
	.align	2
.L238:
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
	ldr	r3, .L246
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
	beq	.L245
.L240:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L245:
	add	r5, r5, #12288
	ldrb	r3, [r5, #1272]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L240
	ldr	r0, [r1, #1840]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1272]
	b	.L240
.L247:
	.align	2
.L246:
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
	beq	.L249
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L250
.L249:
	mov	r2, #1
	ldr	r3, .L257
	strb	r2, [r4, #1]
	ldr	r1, [r5, #248]
	ldr	r3, [r3, r1, asl #2]
	add	r3, r3, #204800
	strb	r2, [r3, #3536]
	ldr	r4, [r5, #2420]
	cmp	r4, #0
	beq	.L256
.L248:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L250:
	strb	r3, [r4, #1]
	ldr	r2, .L257
	ldr	r1, [r5, #248]
	ldr	r2, [r2, r1, asl #2]
	add	r2, r2, #204800
	strb	r3, [r2, #3536]
	ldr	r4, [r5, #2420]
	cmp	r4, #0
	bne	.L248
.L256:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L248
	ldr	r0, [r5, #248]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #9]
	b	.L248
.L258:
	.align	2
.L257:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	2
	.global	DecodeStream_MVC
	.type	DecodeStream_MVC, %function
DecodeStream_MVC:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	ldrd	r2, [r0, #32]
	mov	r4, r0
	mov	r5, r1
	ldr	r6, [r4, #8]
	mov	r0, r1
	ldr	lr, [r4, #20]
	sub	r1, fp, #60
	ldr	ip, [r4, #24]
	strd	r2, [fp, #-36]
	ldr	r3, [r4, #28]
	ldrb	r2, [r4, #14]	@ zero_extendqisi2
	str	r6, [fp, #-56]
	str	r3, [fp, #-44]
	str	lr, [fp, #-52]
	str	ip, [fp, #-48]
	strb	r2, [fp, #-60]
	bl	MVC_DEC_DecodePacket
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r4, [r5, #228]
	cmp	r4, #0
	beq	.L263
.L259:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L263:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L259
	ldr	r0, [r5, #120]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1]
	b	.L259
	UNWIND(.fnend)
	.size	DecodeStream_MVC, .-DecodeStream_MVC
	.align	2
	.global	DecodeStream_VC1_Smp
	.type	DecodeStream_VC1_Smp, %function
DecodeStream_VC1_Smp:
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
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L277
	ldr	r6, .L279
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	ldr	r3, [r4, #104]
	cmp	r3, #15
	bls	.L278
	add	r2, r5, #28160
	mov	r1, #16
	add	r2, r2, #76
	ldr	r0, [r4, #88]
	bl	Vc1SMPSeqHdr
	subs	r8, r0, #0
	beq	.L269
	ldr	r2, .L279+4
	add	r5, r5, #45056
	movw	r1, #1401
.L276:
	mov	r0, #0
	bl	dprint_normal
	ldr	r1, [r4, #108]
	ldr	r0, [r5, #3904]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L279+8
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r3, #0
	ldr	r0, [r5, #3904]
	mov	r2, r3
	mov	r1, #42
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L278:
	add	r5, r5, #45056
	ldr	r2, .L279+12
	movw	r1, #1390
	b	.L276
.L269:
	ldr	ip, [r4, #104]
	mov	r1, r7
	ldr	r2, [r4, #88]
	mov	r0, r5
	ldr	r3, [r4, #100]
	sub	ip, ip, #16
	add	r2, r2, #16
	str	ip, [r4, #104]
	str	r2, [r4, #88]
	add	r3, r3, #16
	str	r3, [r4, #100]
	bl	VC1DEC_Decode
	ldr	r3, [r6, #48]
	mov	r1, r8
	mov	r0, r7
	mov	r2, #160
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L277:
	add	r5, r1, #45056
	ldr	r0, [r5, #3904]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #3904]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L280:
	.align	2
.L279:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC17
	.word	g_EventReportFunc
	.word	.LC16
	UNWIND(.fnend)
	.size	DecodeStream_VC1_Smp, .-DecodeStream_VC1_Smp
	.align	2
	.global	DecodeStream_VP8
	.type	DecodeStream_VP8, %function
DecodeStream_VP8:
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
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L291
	ldr	r7, .L292
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VP8DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #8192
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #344]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L292+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #344]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #42
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L291:
	add	r5, r1, #8192
	ldr	r0, [r5, #344]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #344]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L293:
	.align	2
.L292:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	DecodeStream_VP8, .-DecodeStream_VP8
	.align	2
	.global	DecodeStream_VP6x
	.type	DecodeStream_VP6x, %function
DecodeStream_VP6x:
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
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L304
	ldr	r7, .L305
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VP6DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #12288
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #728]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L305+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #728]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #42
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L304:
	add	r5, r1, #12288
	ldr	r0, [r5, #728]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #728]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L306:
	.align	2
.L305:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	DecodeStream_VP6x, .-DecodeStream_VP6x
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
	beq	.L308
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L308
	ldr	r3, .L332
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L328
.L311:
	ldrb	r5, [r4, #14]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r4, #408]
	cmp	r5, #1
	beq	.L329
	cmp	r5, #0
	beq	.L330
.L316:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L330:
	ldr	r9, .L332+4
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
	bls	.L316
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
	ldr	r2, .L332+8
	movw	r1, #1976
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L332+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L315
	mov	r0, r6
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r7
.L315:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r4, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L328:
	ldr	r3, [r3, #3520]
	cmp	r3, #1
	bne	.L311
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L311
	mov	r2, #160
	add	r1, r4, #248
	add	r0, r4, #88
	bl	memcpy
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L329:
	ldrb	r5, [r4, #2]	@ zero_extendqisi2
	cmp	r5, r7
	beq	.L331
	cmp	r5, #1
	bne	.L316
	ldr	r2, [r4, #104]
	cmp	r2, #1024
	bcs	.L317
	ldr	r8, .L332+4
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
.L318:
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
.L331:
	ldr	r6, .L332+4
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
.L317:
	ldr	r3, .L332+4
	mov	r2, #80
	add	r1, r4, #8
	add	r0, r4, #168
	ldr	r3, [r3, #52]
	blx	r3
	b	.L318
.L308:
	ldr	r2, .L332+16
	mov	r1, #1936
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L333:
	.align	2
.L332:
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC19
	.word	g_EventReportFunc
	.word	.LC18
	UNWIND(.fnend)
	.size	SegMan, .-SegMan
	.align	2
	.global	DecodeStream_VC1_Adv
	.type	DecodeStream_VC1_Adv, %function
DecodeStream_VC1_Adv:
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
	bl	VC1_GetPacketState
	cmp	r0, #2
	beq	.L338
.L335:
	add	r6, r4, #45056
	mov	r1, r5
	ldr	r0, [r6, #3904]
	bl	SegMan
	subs	r7, r0, #0
	beq	.L339
.L336:
	ldr	r5, [r4, #4]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r4, r4, #12288
	ldrb	r3, [r4, #360]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r6, #3904]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4, #360]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L339:
	add	r5, r5, #88
	mov	r0, r4
	mov	r1, r5
	bl	VC1DEC_Decode
	ldr	r3, .L340
	mov	r0, r5
	mov	r1, r7
	mov	r2, #160
	ldr	r3, [r3, #48]
	blx	r3
	b	.L336
.L338:
	add	r3, r4, #12608
	ldrsb	r3, [r3, #39]
	cmp	r3, #0
	bne	.L335
	add	r1, r4, #12480
	mov	r0, r4
	bl	VC1DEC_Decode
	b	.L335
.L341:
	.align	2
.L340:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	DecodeStream_VC1_Adv, .-DecodeStream_VC1_Adv
	.align	2
	.global	DecodeStream_VC1
	.type	DecodeStream_VC1, %function
DecodeStream_VC1:
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
	ldr	r2, [r1]
	mov	r4, r1
	mov	r5, r0
	ldr	r3, [r2, #532]
	cmp	r3, #1
	bhi	.L351
	ldr	ip, [r2, #536]
	cmp	ip, #8
	bgt	.L352
	add	ip, r1, #24576
	uxtb	r3, r3
	cmp	r3, #1
	strb	r3, [ip, #3660]
	ldr	r3, [r2, #536]
	strb	r3, [ip, #3662]
	beq	.L353
	bl	DecodeStream_VC1_Smp
.L346:
	add	r4, r4, #12608
	ldrsb	r3, [r4, #39]
	cmp	r3, #0
	movne	r3, #1
	strb	r3, [r5, #1]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L351:
	ldr	r2, .L354
	movw	r1, #1425
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L352:
	ldr	r2, .L354+4
	movw	r1, #1432
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L353:
	bl	DecodeStream_VC1_Adv
	b	.L346
.L355:
	.align	2
.L354:
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	DecodeStream_VC1, .-DecodeStream_VC1
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
	beq	.L362
.L357:
	mov	r1, r5
	ldr	r0, [r4]
	bl	SegMan
	cmp	r0, #0
	beq	.L363
.L359:
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
.L363:
	add	r1, r5, #88
	mov	r0, r4
	bl	MPEG2DEC_Decode
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r5, #1]
	b	.L359
.L362:
	ldr	r3, .L365
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L364
.L358:
	add	r1, r4, #80896
	mov	r0, r4
	add	r1, r1, #520
	bl	MPEG2DEC_Decode
	b	.L357
.L364:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L357
	b	.L358
.L366:
	.align	2
.L365:
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
	beq	.L372
.L368:
	mov	r1, r6
	ldr	r0, [r5, #2424]
	bl	SegMan
	cmp	r0, #0
	beq	.L373
.L370:
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
.L373:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG4DEC_Decode
	b	.L370
.L372:
	ldr	r3, .L375
	ldr	r3, [r3, r7, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L374
.L369:
	add	r1, r4, #15616
	mov	r0, r4
	add	r1, r1, #32
	bl	MPEG4DEC_Decode
	b	.L368
.L374:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L368
	b	.L369
.L376:
	.align	2
.L375:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	2
	.global	DecodeStream_AVS
	.type	DecodeStream_AVS, %function
DecodeStream_AVS:
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
	ldr	r6, [r1, #4]
	bl	AVS_GetPacketState
	cmp	r0, #0
	bne	.L378
	ldr	r3, .L384
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L382
	add	r1, r4, #16384
	mov	r0, r4
	add	r1, r1, #112
	bl	AVSDEC_Decode
.L378:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	SegMan
	cmp	r0, #0
	beq	.L383
.L380:
	ldr	r5, [r4, #16]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #4]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L382:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L378
	add	r1, r4, #16384
	mov	r0, r4
	add	r1, r1, #112
	bl	AVSDEC_Decode
	b	.L378
.L383:
	add	r1, r5, #88
	mov	r0, r4
	bl	AVSDEC_Decode
	b	.L380
.L385:
	.align	2
.L384:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_AVS, .-DecodeStream_AVS
	.align	2
	.global	DecodeStream_H263
	.type	DecodeStream_H263, %function
DecodeStream_H263:
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
	add	r5, r1, #20480
	mov	r6, r0
	mov	r0, r1
	mov	r4, r1
	mov	r7, r2
	ldr	r8, [r5, #2448]
	bl	H263_GetPacketState
	cmp	r0, #3
	beq	.L391
.L387:
	mov	r1, r6
	ldr	r0, [r5, #2448]
	bl	SegMan
	cmp	r0, #0
	beq	.L392
.L389:
	ldr	r4, [r4, #1036]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldrb	r3, [r5, #2484]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #2448]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #2484]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L392:
	sub	r2, r7, #14
	add	r1, r6, #88
	clz	r2, r2
	mov	r0, r4
	mov	r2, r2, lsr #5
	bl	H263DEC_Decode
	b	.L389
.L391:
	ldr	r3, .L394
	ldr	r3, [r3, r8, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3488]
	cmp	r2, #1
	beq	.L393
.L388:
	sub	r2, r7, #14
	add	r1, r4, #15616
	clz	r2, r2
	add	r1, r1, #40
	mov	r0, r4
	mov	r2, r2, lsr #5
	bl	H263DEC_Decode
	b	.L387
.L393:
	ldr	r3, [r3, #3520]
	cmp	r3, #0
	bne	.L387
	b	.L388
.L395:
	.align	2
.L394:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_H263, .-DecodeStream_H263
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
	b	.L397
.L399:
	.word	.L398
	.word	.L400
	.word	.L401
	.word	.L402
	.word	.L403
	.word	.L397
	.word	.L404
	.word	.L397
	.word	.L397
	.word	.L397
	.word	.L405
	.word	.L405
	.word	.L405
	.word	.L406
	.word	.L403
	.word	.L407
	.word	.L408
.L408:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_HEVC
.L409:
	mov	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L398:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_H264
	b	.L409
.L400:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VC1
	b	.L409
.L401:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG4
	b	.L409
.L402:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG2
	b	.L409
.L403:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_H263
	b	.L409
.L404:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_AVS
	b	.L409
.L405:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP6x
	b	.L409
.L406:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP8
	b	.L409
.L407:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MVC
	b	.L409
.L397:
	str	r4, [sp]
	movw	r1, #1922
	ldr	r3, .L410
	mov	r0, #1
	ldr	r2, .L410+4
	bl	dprint_normal
	b	.L409
.L411:
	.align	2
.L410:
	.word	.LANCHOR1+80
	.word	.LC22
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
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #10
	bcc	.L413
	cmp	r0, #12
	bls	.L414
	cmp	r0, #13
	bne	.L413
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #344]
	ldr	r1, [r4, #220]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L417
	ldr	r2, .L424
	movw	r1, #2069
	mov	r0, #1
	bl	dprint_normal
.L417:
	ldr	r3, .L424+4
	add	r0, r4, #200
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	r3
.L413:
	mov	r3, r0
	ldr	r2, .L424+8
	mov	r0, #0
	movw	r1, #2108
	str	r0, [sp]
	mov	r0, #2
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L414:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #728]
	ldr	r1, [r4, #220]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L417
	ldr	r2, .L424+12
	movw	r1, #2085
	mov	r0, #1
	bl	dprint_normal
	b	.L417
.L425:
	.align	2
.L424:
	.word	.LC23
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LC24
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
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #10
	bcc	.L427
	cmp	r0, #12
	bls	.L428
	cmp	r0, #13
	bne	.L427
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #344]
	ldr	r1, [r4, #220]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L431
	ldr	r2, .L438
	movw	r1, #2143
	mov	r0, #1
	bl	dprint_normal
.L431:
	ldr	r3, .L438+4
	add	r0, r4, #200
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	r3
.L427:
	mov	r3, r0
	ldr	r2, .L438+8
	mov	r0, #0
	movw	r1, #2167
	str	r0, [sp]
	mov	r0, #2
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L428:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #728]
	ldr	r1, [r4, #220]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L431
	ldr	r2, .L438+12
	movw	r1, #2159
	mov	r0, #1
	bl	dprint_normal
	b	.L431
.L439:
	.align	2
.L438:
	.word	.LC23
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LC24
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
	b	.L441
.L443:
	.word	.L442
	.word	.L444
	.word	.L445
	.word	.L446
	.word	.L447
	.word	.L441
	.word	.L448
	.word	.L441
	.word	.L441
	.word	.L441
	.word	.L449
	.word	.L449
	.word	.L449
	.word	.L450
	.word	.L447
	.word	.L451
	.word	.L452
.L452:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_ClearCurrPic
.L442:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_ClearCurrPic
.L444:
	add	r3, r1, #45056
	add	r0, r1, #12608
	add	r0, r0, #32
	ldr	r1, [r3, #3904]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1_ClearCurPic
.L445:
	mov	r0, r1
	str	r1, [fp, #-16]
	bl	MP4_ClearCurPic
	ldr	r1, [fp, #-16]
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP4_Clean_HeadPacket
.L446:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_ClearCurPic
.L447:
	mov	r0, r1
	str	r1, [fp, #-16]
	bl	H263_ClearCurPic
	ldr	r1, [fp, #-16]
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H263_Clean_HeadPacket
.L448:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS_ClearCurPic
.L449:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L450:
	mov	r0, #13
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L451:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_ClearCurrPic
.L441:
	mov	r3, r0
	ldr	r2, .L453
	movw	r1, #2333
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L454:
	.align	2
.L453:
	.word	.LC26
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
	bne	.L463
	ldr	r1, .L465
	mvn	r5, #0
	mvn	r4, #0
	ldr	lr, [r1, r0, asl #2]
	add	lr, lr, #206848
	add	lr, lr, #672
	ldrd	r0, [lr, #-8]
	cmp	r1, r5
	cmpeq	r0, r4
	bne	.L462
	ldr	r1, [r6]
	cmp	r1, #0
	bne	.L462
	sub	r1, ip, #1
	uxtb	r1, r1
	cmp	r1, #174
	bls	.L464
.L462:
	mvn	r0, #0
.L457:
	cmp	ip, #0
	streq	ip, [r6]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L463:
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L462
	mov	r3, #1
	str	r3, [r6]
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	b	.L457
.L464:
	ldrd	r4, [r3, #24]
	mvn	r0, #0
	strd	r4, [lr, #-8]
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	b	.L457
.L466:
	.align	2
.L465:
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
	bne	.L479
.L468:
	cmp	r2, #1
	bne	.L472
.L469:
	mov	r2, #1
	str	r2, [r0]
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	mov	r3, #0
.L470:
	cmp	lr, #182
	moveq	r2, #0
	streq	r2, [r0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L479:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L469
	b	.L468
.L472:
	mvn	r3, #0
	b	.L470
	UNWIND(.fnend)
	.size	CheckNewPicSegMpeg4, .-CheckNewPicSegMpeg4
	.align	2
	.global	CheckNewPicSegH263
	.type	CheckNewPicSegH263, %function
CheckNewPicSegH263:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r2, #1
	streq	r2, [r0]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	mov	r3, r0
	moveq	r0, #0
	mvnne	r0, #0
	cmp	r2, #182
	moveq	r2, #0
	streq	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CheckNewPicSegH263, .-CheckNewPicSegH263
	.align	2
	.global	CheckNewPicSegAVS
	.type	CheckNewPicSegAVS, %function
CheckNewPicSegAVS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	sub	r2, r3, #179
	add	ip, r3, #74
	clz	r2, r2
	uxtb	ip, ip
	mov	r2, r2, lsr #5
	cmp	r3, #176
	movne	lr, r2
	orreq	lr, r2, #1
	cmp	ip, #1
	movhi	ip, lr
	orrls	ip, lr, #1
	cmp	ip, #0
	beq	.L488
	ldr	ip, [r0]
	cmp	ip, #0
	bne	.L488
	mov	r3, #1
	str	r3, [r0]
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	sub	r2, r3, #179
	clz	r2, r2
	mov	r2, r2, lsr #5
.L485:
	cmp	r3, #182
	movne	r3, r2
	orreq	r3, r2, #1
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0]
	mov	r0, ip
	ldmfd	sp, {fp, sp, pc}
.L488:
	mvn	ip, #0
	b	.L485
	UNWIND(.fnend)
	.size	CheckNewPicSegAVS, .-CheckNewPicSegAVS
	.align	2
	.global	CheckNewPicSegVC1
	.type	CheckNewPicSegVC1, %function
CheckNewPicSegVC1:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	sub	r3, r2, #12
	cmp	r2, #10
	cmpne	r3, #3
	bhi	.L496
	ldr	r3, [r0]
	cmp	r3, #0
	bne	.L496
	mov	r2, #1
	str	r2, [r0]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
.L493:
	cmp	r2, #13
	moveq	r2, #0
	streq	r2, [r0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L496:
	mvn	r3, #0
	b	.L493
	UNWIND(.fnend)
	.size	CheckNewPicSegVC1, .-CheckNewPicSegVC1
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
	b	.L509
.L500:
	.word	.L499
	.word	.L501
	.word	.L502
	.word	.L503
	.word	.L504
	.word	.L509
	.word	.L505
	.word	.L509
	.word	.L509
	.word	.L509
	.word	.L509
	.word	.L509
	.word	.L509
	.word	.L509
	.word	.L504
	.word	.L506
	.word	.L507
.L507:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_IsNewPicNal
.L499:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_IsNewPicNal
.L501:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegVC1
.L502:
	mov	r2, lr
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegMpeg4
.L503:
	mov	r2, r1
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegMpeg2
.L504:
	cmp	lr, #1
	streq	lr, [ip]
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	moveq	r0, #0
	mvnne	r0, #0
	cmp	r3, #182
	ldmnefd	sp, {fp, sp, pc}
	mov	r3, #0
	str	r3, [ip]
	ldmfd	sp, {fp, sp, pc}
.L505:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegAVS
.L506:
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_IsNewPicNal
.L509:
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
	ldr	lr, [r3]
	beq	.L528
	cmp	r2, #4
	cmpne	r2, #14
	ldrb	r4, [lr, #2]	@ zero_extendqisi2
	moveq	ip, #1
	movne	ip, #0
	bne	.L514
	and	ip, r4, #248
	sub	ip, ip, #128
	clz	ip, ip
	mov	ip, ip, lsr #5
	cmp	ip, #1
	beq	.L513
.L514:
	ldrb	r5, [lr]	@ zero_extendqisi2
	ldrb	lr, [lr, #1]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L516
	cmp	lr, #0
	bne	.L516
	cmp	r4, #1
	bne	.L516
.L513:
	str	ip, [sp]
	bl	CheckNewPicSegByVidStd
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L528:
	ldrb	ip, [r3, #72]	@ zero_extendqisi2
	ands	ip, ip, #1
	ldreqb	r4, [lr, #2]	@ zero_extendqisi2
	beq	.L514
	mov	ip, #1
	b	.L513
.L516:
	str	r4, [sp, #4]
	mov	r3, r5
	str	lr, [sp]
	movw	r1, #2569
	ldr	r2, .L529
	mov	r0, #20
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L530:
	.align	2
.L529:
	.word	.LC27
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
	ldr	r3, .L538
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #16]
	cmp	ip, #0
	beq	.L537
.L532:
	add	r1, ip, #203776
	mov	r0, #0
	add	r1, r1, #512
	mov	r3, ip
	mov	r2, r0
	str	r0, [ip]
.L534:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L534
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L537:
	cmp	r1, #0
	str	r1, [r0, #16]
	movne	ip, r1
	bne	.L532
.L535:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L539:
	.align	2
.L538:
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
	ldr	r3, .L545
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #16]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #16]
	ldmfd	sp, {fp, sp, pc}
.L546:
	.align	2
.L545:
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
	ldr	r3, .L552
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #16]
	cmp	r0, #0
	beq	.L550
	add	r1, r0, #203776
	mov	ip, #0
	add	r1, r1, #512
	mov	r3, r0
	mov	r2, ip
	str	ip, [r0]
.L549:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L549
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L550:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L553:
	.align	2
.L552:
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
	ldr	r3, .L561
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #16]
	cmp	ip, #0
	beq	.L558
	mov	r3, ip
	mov	r2, #0
	b	.L557
.L556:
	add	r2, r2, #1
	add	r3, r3, #1056
	cmp	r2, #192
	add	r3, r3, #8
	beq	.L560
.L557:
	ldr	r1, [r3, #1048]
	cmp	r1, #0
	bne	.L556
	ldr	r1, [r3, #1044]
	cmp	r1, #0
	bne	.L556
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
.L560:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L558:
	mov	r0, ip
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L562:
	.align	2
.L561:
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
	beq	.L579
	ldrh	r3, [r0, #4]
	ldrh	lr, [r0, #8]
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L573
.L572:
	add	r2, r0, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L571
	ldr	ip, [r2, #88]
	ldr	r2, [r1, #88]
	cmp	ip, r2
	beq	.L574
.L571:
	cmp	r3, lr
	bne	.L572
.L573:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L574:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L579:
	mov	r0, r1
	ldr	r2, .L580
	movw	r1, #2680
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L581:
	.align	2
.L580:
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
	b	.L583
.L585:
	.word	.L584
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
.L590:
	mov	r2, #0
	mov	r3, #2
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L584:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L586:
	mov	r2, #4
	mov	r3, #3
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L587:
	mov	r2, #16
	mov	r3, #9
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L588:
	mov	r2, #221
	mov	r3, #100
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L589:
	mov	r2, #235
	mov	r3, #100
	str	r2, [r0, #56]
	str	r3, [r0, #60]
	ldmfd	sp, {fp, sp, pc}
.L583:
	mov	r0, #1
	mov	r3, r1
	str	r0, [ip, #60]
	mov	r1, #0
	ldr	r2, .L592
	str	r1, [ip, #56]
	movw	r1, #2743
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L593:
	.align	2
.L592:
	.word	.LC28
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
	beq	.L601
	ldr	r2, [r0, #308]
	cmp	r2, #1
	beq	.L601
	cmp	r3, #2
	ldr	r0, [r0, #312]
	moveq	r3, #1
	subne	r3, r0, #1
	clzne	r3, r3
	movne	r3, r3, lsr #5
.L599:
	cmp	r0, #1
	movne	r0, r3
	orreq	r0, r3, #1
	ldmfd	sp, {fp, sp, pc}
.L601:
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
	ldr	r1, .L608
	ldrd	r4, [fp, #4]
	ldr	r1, [r1, r0, asl #2]
	subs	r2, r2, r4
	sbc	r3, r3, r5
	add	r1, r1, #204800
	ldr	r1, [r1, #2540]
	cmp	r1, #0
	bne	.L607
	cmp	r3, #0
	cmpeq	r2, #16000
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L607:
	mov	r1, #0
	mov	r0, #9216
	cmp	r3, r1
	movt	r0, 244
	cmpeq	r2, r0
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L609:
	.align	2
.L608:
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
	.type	__FUNCTION__.13238, %object
	.size	__FUNCTION__.13238, 19
__FUNCTION__.13238:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__func__.13284, %object
	.size	__func__.13284, 20
__func__.13284:
	.ascii	"SYNTAX_MarkImageEos\000"
	.type	__func__.13291, %object
	.size	__func__.13291, 20
__func__.13291:
	.ascii	"SYNTAX_ReceiveImage\000"
	.type	__func__.13336, %object
	.size	__func__.13336, 20
__func__.13336:
	.ascii	"SYNTAX_ReleaseImage\000"
	.type	__func__.13453, %object
	.size	__func__.13453, 13
__func__.13453:
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
	ASCII(.ascii	"LENTH ERROR: VC1 S/MP BS is wrong!\012\000" )
.LC17:
	ASCII(.ascii	"SYNTAX ERROR: VC1 S/MP BS is wrong!\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"pSegMan error!\012\000" )
.LC19:
	ASCII(.ascii	"More than two packet!!!ERROR!!!\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"ERROR: Wrong PreParseInfo about Vc1 IsAdvProfile!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC21:
	ASCII(.ascii	"ERROR: Wrong PreParseInfo about Vc1 CodecVersion!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC22:
	ASCII(.ascii	"%s unsupport standard %d\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"ERROR: VFMW_VP8 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"ERROR: VFMW_VP6 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"%s not support VidStd %d, pSegMan %p not used.\012\000" )
.LC26:
	ASCII(.ascii	"VidStd=%d Error!\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"WARNNING: aspect ration (%d) is not expected!\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	last_rec_pos_time.13235, %object
	.size	last_rec_pos_time.13235, 16
last_rec_pos_time.13235:
	.space	16
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 16
pstVdecUsdPool:
	.space	16
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
