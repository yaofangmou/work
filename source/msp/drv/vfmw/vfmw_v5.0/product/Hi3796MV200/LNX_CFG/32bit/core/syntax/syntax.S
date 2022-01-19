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
	b	.L19
.L4:
	.word	.L18
	.word	.L5
	.word	.L6
	.word	.L7
	.word	.L19
	.word	.L8
	.word	.L9
	.word	.L19
	.word	.L10
	.word	.L11
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L13
	.word	.L19
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L19
	.word	.L18
.L18:
	add	r0, r0, #16
	ldmfd	sp, {fp, sp, pc}
.L5:
	add	r0, r0, #49152
	add	r0, r0, #184
	ldmfd	sp, {fp, sp, pc}
.L6:
	add	r0, r0, #22528
	add	r0, r0, #104
	ldmfd	sp, {fp, sp, pc}
.L7:
	add	r0, r0, #88064
	add	r0, r0, #656
	ldmfd	sp, {fp, sp, pc}
.L8:
	add	r0, r0, #42496
	add	r0, r0, #40
	ldmfd	sp, {fp, sp, pc}
.L9:
	add	r0, r0, #16192
	add	r0, r0, #8
	ldmfd	sp, {fp, sp, pc}
.L10:
	add	r0, r0, #54784
	add	r0, r0, #80
	ldmfd	sp, {fp, sp, pc}
.L11:
	add	r0, r0, #54784
	add	r0, r0, #72
	ldmfd	sp, {fp, sp, pc}
.L12:
	add	r0, r0, #12672
	add	r0, r0, #24
	ldmfd	sp, {fp, sp, pc}
.L13:
	add	r0, r0, #8192
	add	r0, r0, #24
	ldmfd	sp, {fp, sp, pc}
.L14:
	add	r0, r0, #592
	ldmfd	sp, {fp, sp, pc}
.L15:
	add	r0, r0, #6144
	add	r0, r0, #48
	ldmfd	sp, {fp, sp, pc}
.L16:
	add	r0, r0, #274432
	add	r0, r0, #4032
	ldmfd	sp, {fp, sp, pc}
.L17:
	add	r0, r0, #18688
	add	r0, r0, #96
	ldmfd	sp, {fp, sp, pc}
.L19:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	2
	.global	PrintVoQueue
	.type	PrintVoQueue, %function
PrintVoQueue:
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
	subs	r5, r0, #0
	beq	.L27
	ldrh	ip, [r5, #8]
	mov	r0, #1
	ldrh	r3, [r5, #4]
	ldrh	r2, [r5, #6]
	ldr	r1, .L28
	str	ip, [sp]
	bl	dprint_vfmw
	ldrh	r3, [r5, #4]
	ldrh	r2, [r5, #8]
	and	r4, r3, #63
	cmp	r2, r4
	bne	.L26
	b	.L25
.L24:
	add	r3, r5, r4, lsl #2
	ldr	r1, .L28+4
	mov	r0, #1
	ldr	r3, [r3, #12]
	ldr	r2, [r3, #148]
	bl	dprint_vfmw
	add	r3, r4, #1
	ldrh	r2, [r5, #8]
	and	r4, r3, #63
	cmp	r2, r4
	beq	.L25
.L26:
	tst	r3, #7
	bne	.L24
	ldr	r1, .L28+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L24
.L25:
	ldr	r1, .L28+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L27:
	mov	r3, #78
	ldr	r2, .L28+12
	ldr	r1, .L28+16
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L29:
	.align	2
.L28:
	.word	.LC1
	.word	.LC3
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	PrintVoQueue, .-PrintVoQueue
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
	subs	r4, r0, #0
	beq	.L35
	ldr	r5, .L37
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	ldrh	r1, [r4, #8]
	cmp	r2, r3
	beq	.L36
.L33:
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L37+4
	bl	dprint_vfmw
.L34:
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
.L36:
	cmp	r2, r1
	bne	.L33
	b	.L34
.L35:
	mov	r3, #107
	ldr	r2, .L37+8
	ldr	r1, .L37+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L38:
	.align	2
.L37:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	.word	.LANCHOR0+16
	.word	.LC0
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r3, r1
	beq	.L58
	cmp	r0, #20
	ldrls	pc, [pc, r0, asl #2]
	b	.L39
.L43:
	.word	.L42
	.word	.L44
	.word	.L45
	.word	.L46
	.word	.L39
	.word	.L47
	.word	.L48
	.word	.L39
	.word	.L49
	.word	.L50
	.word	.L51
	.word	.L51
	.word	.L51
	.word	.L52
	.word	.L39
	.word	.L53
	.word	.L54
	.word	.L55
	.word	.L56
	.word	.L39
	.word	.L57
.L58:
	mov	r3, #151
	ldr	r2, .L59
	ldr	r1, .L59+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L57:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_RecycleImage
.L56:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS2DEC_RecycleImage
.L55:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_RecycleImage
.L54:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_DECRecycleImage
.L53:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_RecycleImage
.L52:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_RecycleImage
.L51:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_RecycleImage
.L50:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_RecycleImage
.L49:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_RecycleImage
.L48:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_RecycleImage
.L47:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_RecycleImage
.L46:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_RecycleImage
.L45:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_RecycleImage
.L44:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_RecycleImage
.L42:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_RecycleImage
.L39:
	ldmfd	sp, {fp, sp, pc}
.L60:
	.align	2
.L59:
	.word	.LANCHOR0+32
	.word	.LC0
	UNWIND(.fnend)
	.size	ReturnImageToSyntax, .-ReturnImageToSyntax
	.global	__aeabi_uidiv
	.align	2
	.global	InsertImgToVoQueue
	.type	InsertImgToVoQueue, %function
InsertImgToVoQueue:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r0, #31
	mov	r5, r3
	mov	r7, r0
	str	r1, [fp, #-56]
	mov	r10, r2
	ldr	r4, [fp, #4]
	movhi	r3, #396
	bhi	.L130
	cmp	r5, #0
	cmpne	r2, #0
	beq	.L132
	cmp	r4, #0
	beq	.L133
	ldr	r6, .L142
	mov	r0, #2
	ldr	r1, .L142+4
	bl	dprint_vfmw
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r9, [r5, #4]
	ldrh	r0, [r5, #8]
	and	r9, r9, #63
	cmp	r0, r9
	ldrne	r8, [fp, #-56]
	bne	.L71
	b	.L70
.L69:
	add	r9, r9, #1
	and	r9, r9, #63
	cmp	r0, r9
	beq	.L134
.L71:
	add	r3, r5, r9, lsl #2
	ldr	r1, [r4, #148]
	ldr	r3, [r3, #12]
	ldr	r2, [r3, #148]
	cmp	r2, r1
	bne	.L69
	ldr	r1, .L142+8
	mov	r0, #0
	bl	dprint_vfmw
	add	r9, r9, #1
	mov	r3, #1000
	str	r3, [r4, #152]
	ldrh	r0, [r5, #8]
	and	r9, r9, #63
	cmp	r0, r9
	bne	.L71
.L134:
	str	r8, [fp, #-56]
.L70:
	ldr	r2, [r4, #152]
	cmp	r2, #100
	bhi	.L135
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #72]
	cmp	r3, #31
	bhi	.L136
.L72:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L142+12
	bl	dprint_vfmw
	ldr	r3, [r4, #152]
	cmp	r3, #1000
	beq	.L75
	mov	r2, r4
	mov	r1, r10
	ldr	r0, [fp, #-56]
	bl	ReturnImageToSyntax
.L75:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
.L63:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L136:
	cmp	r1, #31
	bls	.L72
	ldr	r8, [fp, #-56]
	add	r1, r4, #416
	mov	r0, r7
	str	r8, [r4, #216]
	bl	VCTRL_GetHDRConfigInfo
	ldr	r3, .L142+16
	ldrb	r2, [r4, #66]	@ zero_extendqisi2
	add	ip, r4, #592
	add	lr, r4, #576
	cmp	r8, #20
	ldr	r3, [r3, r7, asl #2]
	ldr	r3, [r3, #128]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #66]
	ldrd	r0, [ip, #-8]
	strd	r0, [lr]
	beq	.L96
	add	r3, r5, #272
	ldrd	r2, [r3, #56]
	subs	r8, r0, r2
	sbc	r9, r1, r3
	and	r3, r3, r2
	cmp	r9, #0
	cmpeq	r8, #5
	movls	r2, #1
	movhi	r2, #0
	adds	r3, r3, #1
	movne	r3, #1
	tst	r2, r3
	ldr	r3, [fp, #-56]
	sub	r8, r3, #8
	beq	.L137
	cmp	r8, #1
	bls	.L78
	mov	r2, r0
	mov	r3, r1
	mvn	r0, #0
	mvn	r1, #0
	b	.L76
.L135:
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #72]
	b	.L72
.L137:
	cmp	r8, #1
	bls	.L138
.L96:
	mov	r2, r0
	mov	r3, r1
.L76:
	ldrd	r8, [ip]
	strd	r0, [ip, #-8]
	strd	r0, [sp]
	mov	r0, #29
	strd	r8, [sp, #8]
	ldr	r1, .L142+20
	bl	dprint_vfmw
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ldrne	r2, [r4, #68]
	beq	.L79
.L80:
	str	r2, [r5, #300]
	ldr	r3, [r4, #72]
	ldr	r1, [r5, #280]
	str	r3, [r5, #304]
	ldrb	r3, [r4, #64]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	str	r3, [r5, #308]
	ldr	r3, [r4, #64]
	str	r3, [r5, #312]
	ldr	r3, [r4, #148]
	add	r3, r3, #2
	str	r3, [r5, #296]
	ldrb	r0, [r4, #65]	@ zero_extendqisi2
	ldr	r3, [r4, #156]
	ubfx	r0, r0, #0, #2
	ldr	r2, [r4, #64]
	cmp	r3, r1
	ldr	ip, [r4, #80]
	ldrh	r9, [r4, #76]
	mov	lr, r0
	ldrh	r1, [r4, #88]
	ubfx	r2, r2, #14, #3
	strb	r0, [fp, #-65]
	uxtb	lr, lr
	ldr	r0, [r4, #84]
	uxtb	r10, r2
	strne	r3, [r5, #320]
	orr	r9, r9, ip, asl #16
	ldr	r3, [r5, #316]
	orr	r1, r1, r0, asl #16
	str	r1, [fp, #-64]
	add	r1, r3, #1
	str	r1, [r5, #316]
	str	r3, [r4, #160]
	ldr	r3, [r5, #272]
	str	lr, [fp, #-60]
	cmp	r10, r3
	ldreq	r3, .L142+24
	streq	r3, [fp, #-56]
	beq	.L82
	ldr	r1, .L142+24
	ldr	r8, [r1]
	str	r1, [fp, #-56]
	cmp	r8, #0
	beq	.L83
	strb	r3, [fp, #-52]
	mov	r1, #7
	strb	r2, [fp, #-51]
	mov	r3, #2
	sub	r2, fp, #52
	mov	r0, r7
	blx	r8
.L83:
	str	r10, [r5, #272]
.L82:
	ldr	r3, [r5, #276]
	ldr	r2, [fp, #-60]
	cmp	r2, r3
	beq	.L84
	ldr	r3, [fp, #-56]
	ldr	r8, [r3]
	cmp	r8, #0
	beq	.L85
	ldrb	r1, [fp, #-65]	@ zero_extendqisi2
	sub	r2, fp, #44
	mov	r3, #1
	mov	r0, r7
	strb	r1, [r2, #-8]!
	mov	r1, #4
	blx	r8
.L85:
	ldr	r3, [fp, #-60]
	str	r3, [r5, #276]
.L84:
	ldr	r3, [r5, #288]
	cmp	r9, r3
	beq	.L139
.L86:
	ldr	r3, [fp, #-56]
	str	r9, [r5, #288]
	ldr	r8, [r3]
	ldr	r3, [fp, #-64]
	cmp	r8, #0
	str	r3, [r5, #292]
	beq	.L87
	ldr	r1, [r4, #80]
	mov	r3, #8
	ldr	r0, [r4, #84]
	sub	r2, fp, #52
	ldr	lr, [r4, #76]
	ldr	ip, [r4, #88]
	strh	r1, [fp, #-50]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-48]	@ movhi
	mov	r0, r7
	strh	lr, [fp, #-52]	@ movhi
	strh	ip, [fp, #-46]	@ movhi
	blx	r8
.L87:
	ldr	ip, [r4, #36]
	mov	r0, #12
	ldr	r1, [r4, #40]
	mov	r8, r7, asl #3
	ldr	r2, [r4, #112]
	mov	r10, r7, asl #6
	ldr	r3, [r4, #116]
	str	r1, [r4, #24]
	add	r2, r2, ip
	str	ip, [r4, #20]
	add	r3, r3, r1
	str	r2, [r4, #28]
	str	r3, [r4, #32]
	ldr	r1, [r4, #148]
	ldrh	ip, [r5, #8]
	ldrh	r3, [r5, #6]
	ldrh	r2, [r5, #4]
	str	r1, [sp, #4]
	str	ip, [sp]
	ldr	r1, .L142+28
	bl	dprint_vfmw
	ldrh	r3, [r5, #8]
	ldr	r9, .L142+32
	mov	r1, #0
	add	r2, r5, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	str	r4, [r2, #12]
	add	r2, r8, r10
	strh	r3, [r5, #8]	@ movhi
	add	r5, r9, r2
	ldr	r3, .L142+16
	ldr	r3, [r3, r7, asl #2]
	add	r3, r3, #475136
	ldr	r2, [r3, #1664]
	add	r2, r2, #1
	str	r2, [r3, #1664]
	str	r1, [r4, #264]
	ldr	r3, [r5, #24]
	cmp	r3, #6
	beq	.L140
.L89:
	ldr	r2, [r4, #52]
	add	r3, r8, r10
	add	r3, r9, r3
	mov	r1, #5
	mov	r0, r7
	str	r2, [r3, #20]
	ldr	r2, [r4, #160]
	bl	VDEC_Lowdelay_Event_Time
	ldr	r1, .L142+36
	ldr	r3, [r4, #160]
	mov	r0, #2
	ldr	r2, [r6, #16]
	add	r3, r3, #1
	str	r3, [r1, r7, asl #2]
	blx	r2
	ldr	r3, [fp, #-56]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L90
	mov	r2, r4
	mov	r3, #640
	mov	r1, #5
	mov	r0, r7
	blx	r5
.L90:
	mov	r0, #8
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L141
.L92:
	add	r7, r8, r10
	ldr	r2, [r6]
	add	r4, r9, r7
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
	blx	r2
	ldr	r1, [r9, r7]
	rsb	r1, r1, r0
	mov	r5, r0
	cmp	r1, #300
	movcc	r0, #1
	bcc	.L63
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L94
	movw	r0, #10000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r4, #8]
.L94:
	add	r8, r8, r10
	mov	r2, #0
	add	r3, r9, r8
	mov	r0, #1
	str	r5, [r9, r8]
	str	r2, [r3, #4]
	b	.L63
.L79:
	ldr	r2, [r4, #68]
	ldr	r3, [r4, #72]
	mov	r1, r2, lsr #1
	str	r2, [r4, #76]
	str	r3, [r4, #80]
	mov	r3, r3, lsr #1
	str	r1, [r4, #84]
	str	r3, [r4, #88]
	b	.L80
.L138:
	ldrb	r3, [r4, #64]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L96
.L78:
	mvn	r9, #0
	str	r9, [lr]
	mov	r2, r9
	mov	r0, r9
	mov	r3, r9
	str	r9, [lr, #4]
	mov	r1, r9
	b	.L76
.L132:
	movw	r3, #397
.L130:
	ldr	r2, .L142+40
	mov	r0, #1
	ldr	r1, .L142+44
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L63
.L141:
	ldr	r3, [r6]
	blx	r3
	ldr	r1, .L142+48
	ldr	r2, .L142+52
	ldr	r3, [r1, r7, asl #2]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L92
	mov	r2, r7, asl #24
	str	r0, [r1, r7, asl #2]
	add	r2, r2, #524288
	movw	r1, #522
	ldr	r0, .L142+56
	bl	DBG_AddTrace
	b	.L92
.L140:
	ldr	r2, [r5, #68]
	add	r3, r5, #64
	cmp	r2, r1
	bne	.L89
	ldr	r1, [r6]
	str	r2, [fp, #-64]
	str	r3, [fp, #-60]
	blx	r1
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-60]
	str	r2, [r5, #24]
	str	r0, [r3, #4]
	b	.L89
.L139:
	ldr	r3, [r5, #292]
	ldr	r2, [fp, #-64]
	cmp	r2, r3
	bne	.L86
	b	.L87
.L133:
	mov	r0, r4
	ldr	r1, .L142+60
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L63
.L143:
	.align	2
.L142:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	s_pstVfmwChan
	.word	.LC9
	.word	g_event_report
	.word	.LC10
	.word	g_VfmwChanStat
	.word	g_LowDelaySeqIndex
	.word	.LANCHOR0+52
	.word	.LC0
	.word	.LANCHOR1
	.word	g_TraceFramePeriod
	.word	.LANCHOR0+72
	.word	.LC5
	UNWIND(.fnend)
	.size	InsertImgToVoQueue, .-InsertImgToVoQueue
	.align	2
	.global	GetQueueImgNum
	.type	GetQueueImgNum, %function
GetQueueImgNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L151
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
.L151:
	movw	r3, #563
	ldr	r2, .L152
	ldr	r1, .L152+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L153:
	.align	2
.L152:
	.word	.LANCHOR0+92
	.word	.LC0
	UNWIND(.fnend)
	.size	GetQueueImgNum, .-GetQueueImgNum
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r1, #0
	cmpne	r0, #0
	mov	r8, r1
	beq	.L160
	bl	SYNTAX_GetVoQue
	subs	r4, r0, #0
	beq	.L161
	ldr	r9, .L162
	mov	r0, #2
	ldr	r3, [r9, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r2, r3
	mvneq	r5, #2
	beq	.L158
	add	r10, r8, #496
	add	r3, r4, r3, lsl #2
	mov	r2, #640
	mov	r0, r8
	ldrd	r6, [r10]
	mov	r5, #1
	ldr	r1, [r3, #12]
	ldr	r3, [r9, #52]
	blx	r3
	strd	r6, [r10]
	ldr	ip, [r8, #148]
	mov	r0, #12
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #4]
	str	ip, [sp, #4]
	ldrh	ip, [r4, #8]
	ldr	r1, .L162+4
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r8, #148]
	ldr	r2, [r4, #344]
	add	r3, r3, r2
	str	r3, [r8, #148]
	ldrh	r3, [r4, #6]
	add	r3, r3, r5
	and	r3, r3, #63
	strh	r3, [r4, #6]	@ movhi
.L158:
	ldr	r3, [r9, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r5
.L156:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L160:
	movw	r3, #678
	ldr	r2, .L162+8
	ldr	r1, .L162+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L156
.L161:
	ldr	r2, .L162+8
	mov	r0, #1
	ldr	r1, .L162+16
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L156
.L163:
	.align	2
.L162:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	.LANCHOR0+108
	.word	.LC0
	.word	.LC11
	UNWIND(.fnend)
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #0
	cmpne	r1, #0
	mov	r6, r1
	mov	r7, r0
	beq	.L212
	bl	SYNTAX_GetVoQue
	subs	r5, r0, #0
	beq	.L213
	ldr	r8, .L214
	mov	r0, #2
	ldr	r3, [r8, #12]
	blx	r3
	ldrh	r4, [r5, #4]
	ldrh	r2, [r5, #6]
	and	r4, r4, #63
	ldr	r9, [r6, #148]
	ldr	r3, [r5, #344]
	cmp	r2, r4
	rsb	r9, r3, r9
	bne	.L200
	b	.L199
.L172:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L199
.L200:
	add	r10, r4, #2
	add	r3, r5, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L170
	ldr	ip, [r3, #148]
	rsb	ip, ip, r9
	clz	ip, ip
	mov	ip, ip, lsr #5
	cmp	ip, #0
	beq	.L172
.L171:
	ldrh	r0, [r5, #4]
	b	.L174
.L202:
	mov	r4, r2
.L174:
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
	bne	.L202
	ldr	r3, [r6, #148]
	cmp	ip, #1
	ldr	r2, [r5, #344]
	rsb	r3, r2, r3
	str	r3, [r6, #148]
	ldrh	r2, [r5, #4]
	add	r2, r2, #1
	and	r2, r2, #63
	strh	r2, [r5, #4]	@ movhi
	beq	.L211
	ldrh	r2, [r5, #6]
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L200
.L199:
	mov	r2, r9
	ldr	r1, .L214+4
	mov	r0, #1
	mvn	r4, #1
	bl	dprint_vfmw
.L169:
	ldr	r3, [r8, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r4
.L166:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L170:
	mov	r2, r4
	ldr	r1, .L214+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	ip, #2
	b	.L171
.L211:
	ldr	r1, [r6, #148]
	mov	r0, #12
	ldrh	r3, [r5, #6]
	str	r1, [sp, #4]
	ldrh	ip, [r5, #8]
	ldr	r1, .L214+12
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r7]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L204
.L177:
	.word	.L176
	.word	.L178
	.word	.L179
	.word	.L180
	.word	.L204
	.word	.L181
	.word	.L182
	.word	.L204
	.word	.L183
	.word	.L184
	.word	.L185
	.word	.L185
	.word	.L185
	.word	.L186
	.word	.L204
	.word	.L187
	.word	.L188
	.word	.L189
	.word	.L190
	.word	.L204
	.word	.L191
.L191:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	USERDEC_RecycleImage
	ldr	r3, [r7]
.L175:
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L192
.L194:
	.word	.L193
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L192
	.word	.L197
	.word	.L197
	.word	.L197
.L197:
	cmp	r0, #0
	mvnne	r4, #19
	moveq	r4, #1
	b	.L169
.L193:
	cmp	r0, #0
	moveq	r4, #1
	mvnne	r4, #19
	b	.L169
.L192:
	cmn	r0, #2
	beq	.L208
	cmp	r0, #1
	mvnne	r4, #19
	moveq	r4, #1
	b	.L169
.L176:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	H264DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L183:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	REAL8DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L184:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	REAL9DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L185:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VP6DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L186:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VP8DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L187:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	MVC_DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L188:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	HEVC_DECRecycleImage
	ldr	r3, [r7]
	b	.L175
.L189:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VP9DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L190:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	AVS2DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L179:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	MPEG4DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L180:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	MPEG2DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L181:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	DIVX3DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L182:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	AVSDEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L178:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VC1DEC_RecycleImage
	ldr	r3, [r7]
	b	.L175
.L204:
	mvn	r0, #1
	b	.L175
.L212:
	ldr	r1, .L214+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L166
.L213:
	ldr	r2, .L214+20
	mov	r0, #1
	ldr	r1, .L214+24
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L166
.L208:
	mov	r4, r0
	b	.L169
.L215:
	.align	2
.L214:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC13
	.word	.LANCHOR0+128
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
	cmp	r0, #0
	beq	.L237
	ldr	r3, [r0]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L236
.L220:
	.word	.L234
	.word	.L221
	.word	.L222
	.word	.L223
	.word	.L236
	.word	.L224
	.word	.L225
	.word	.L236
	.word	.L226
	.word	.L227
	.word	.L228
	.word	.L228
	.word	.L228
	.word	.L229
	.word	.L236
	.word	.L230
	.word	.L231
	.word	.L232
	.word	.L233
	.word	.L236
	.word	.L234
.L234:
	add	r4, r0, #16
.L235:
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
.L221:
	add	r4, r0, #49152
	add	r4, r4, #184
	b	.L235
.L222:
	add	r4, r0, #22528
	add	r4, r4, #104
	b	.L235
.L223:
	add	r4, r0, #88064
	add	r4, r4, #656
	b	.L235
.L224:
	add	r4, r0, #42496
	add	r4, r4, #40
	b	.L235
.L225:
	add	r4, r0, #16192
	add	r4, r4, #8
	b	.L235
.L226:
	add	r4, r0, #54784
	add	r4, r4, #80
	b	.L235
.L227:
	add	r4, r0, #54784
	add	r4, r4, #72
	b	.L235
.L228:
	add	r4, r0, #12672
	add	r4, r4, #24
	b	.L235
.L229:
	add	r4, r0, #8192
	add	r4, r4, #24
	b	.L235
.L230:
	add	r4, r0, #592
	b	.L235
.L231:
	add	r4, r0, #6144
	add	r4, r4, #48
	b	.L235
.L232:
	add	r4, r0, #274432
	add	r4, r4, #4032
	b	.L235
.L233:
	add	r4, r0, #18688
	add	r4, r4, #96
	b	.L235
.L236:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L237:
	movw	r3, #955
	ldr	r2, .L238+4
	ldr	r1, .L238+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L239:
	.align	2
.L238:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+148
	.word	.LC0
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L246
	ldrd	r2, [r0, #32]
	sub	r1, fp, #60
	ldr	ip, [r0, #8]
	mov	r0, r5
	ldr	r7, [r4, #20]
	strd	r2, [fp, #-36]
	ldr	r3, [r4, #24]
	ldrb	lr, [r4, #14]	@ zero_extendqisi2
	str	ip, [fp, #-56]
	ldrb	r2, [r4, #17]	@ zero_extendqisi2
	ldr	ip, [r4, #28]
	str	r3, [fp, #-48]
	ldrsb	r3, [r4, #13]
	str	r7, [fp, #-52]
	strb	lr, [fp, #-60]
	str	r3, [fp, #-40]
	str	ip, [fp, #-44]
	strb	r2, [fp, #-59]
	bl	H264DEC_DecodePacket
	add	r3, r5, #61440
	cmn	r0, #2
	beq	.L247
	strb	r6, [r4, #1]
	ldr	r2, .L249
	ldr	r1, [r3, #2688]
	ldr	r2, [r2, r1, asl #2]
	strb	r6, [r2, #1584]
.L244:
	ldr	r4, [r5, #360]
	cmp	r4, #0
	beq	.L248
.L240:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L246:
	movw	r3, #1058
	ldr	r2, .L249+4
	ldr	r1, .L249+8
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L247:
	mov	r2, #1
	ldr	r1, .L249
	strb	r2, [r4, #1]
	ldr	r0, [r3, #2688]
	ldr	r1, [r1, r0, asl #2]
	strb	r2, [r1, #1584]
	b	.L244
.L248:
	add	r5, r5, #12288
	ldrb	r2, [r5, #1272]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L240
	ldr	r0, [r3, #2688]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1272]
	b	.L240
.L250:
	.align	2
.L249:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+168
	.word	.LC0
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	beq	.L261
	ldr	r3, [r0, #8]
	sub	r1, fp, #52
	ldr	r6, [r0, #20]
	mov	r0, r5
	ldr	lr, [r4, #24]
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
	beq	.L254
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L254
	strb	r3, [r4, #1]
	ldr	r2, .L263
	ldr	r1, [r5, #276]
	ldr	r2, [r2, r1, asl #2]
	strb	r3, [r2, #1584]
.L256:
	ldr	r4, [r5, #2864]
	cmp	r4, #0
	beq	.L262
.L251:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L254:
	mov	r3, #1
	ldr	r2, .L263
	strb	r3, [r4, #1]
	ldr	r1, [r5, #276]
	ldr	r2, [r2, r1, asl #2]
	strb	r3, [r2, #1584]
	b	.L256
.L261:
	movw	r3, #1098
	ldr	r2, .L263+4
	ldr	r1, .L263+8
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L262:
	ldrb	r3, [r5, #11]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L251
	ldr	r0, [r5, #276]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #11]
	b	.L251
.L264:
	.align	2
.L263:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+188
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	2
	.global	DecodeStream_VP9
	.type	DecodeStream_VP9, %function
DecodeStream_VP9:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r9, #1
	movne	r9, #0
	beq	.L282
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L283
	ldr	r8, .L285
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	add	r6, r5, #311296
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r9
	mov	r2, #80
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	VP9DEC_DecodePacket
	ldr	r3, [r6, #2768]
	cmp	r3, #0
	bne	.L284
.L268:
	ldr	r3, [r6, #2764]
	cmp	r3, #0
	bne	.L269
	strb	r3, [r4, #1]
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #262144
	ldrb	r9, [r5, #1036]	@ zero_extendqisi2
	cmp	r9, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r2, #160
	mov	r1, r9
	ldr	r5, [r8, #48]
	mov	r0, r7
	blx	r5
	ldr	r1, [r4, #28]
	ldr	r0, [r6, #2860]
	bl	SM_ReleaseStreamSeg
	ldr	r2, .L285+4
	ldr	ip, [r2]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r6, #2860]
	mov	r3, r9
	mov	r2, r9
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L284:
	ldr	r2, [r6, #2808]
	ldr	r3, [r6, #2804]
	cmp	r2, r3
	beq	.L268
.L269:
	mov	r3, #1
	strb	r3, [r4, #1]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L282:
	movw	r3, #1134
	ldr	r2, .L285+8
	ldr	r1, .L285+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L283:
	add	r5, r1, #311296
	ldr	r0, [r5, #2860]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #2860]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L286:
	.align	2
.L285:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LANCHOR0+208
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_VP9, .-DecodeStream_VP9
	.align	2
	.global	DecodeStream_MVC
	.type	DecodeStream_MVC, %function
DecodeStream_MVC:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L293
	ldrd	r2, [r0, #32]
	sub	r1, fp, #60
	ldr	r7, [r0, #8]
	mov	r0, r5
	ldr	lr, [r4, #20]
	strd	r2, [fp, #-36]
	ldr	ip, [r4, #24]
	ldr	r3, [r4, #28]
	ldrb	r2, [r4, #14]	@ zero_extendqisi2
	str	r7, [fp, #-56]
	str	r3, [fp, #-44]
	str	lr, [fp, #-52]
	str	ip, [fp, #-48]
	strb	r2, [fp, #-60]
	bl	MVC_DEC_DecodePacket
	cmn	r0, #2
	strneb	r6, [r4, #1]
	moveq	r3, #1
	streqb	r3, [r4, #1]
	ldr	r4, [r5, #228]
	cmp	r4, #0
	beq	.L294
.L287:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L293:
	movw	r3, #1176
	ldr	r2, .L295
	ldr	r1, .L295+4
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L294:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L287
	ldr	r0, [r5, #120]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1]
	b	.L287
.L296:
	.align	2
.L295:
	.word	.LANCHOR0+228
	.word	.LC0
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L311
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L312
	ldr	r7, .L314
	add	r8, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r8
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, r6
	add	r0, r4, #168
	blx	r3
	ldr	r3, [r4, #104]
	cmp	r3, #15
	bhi	.L300
	ldr	r1, .L314+4
	add	r5, r5, #49152
.L310:
	mov	r0, r6
	bl	dprint_vfmw
	ldr	r1, [r4, #108]
	ldr	r0, [r5, #528]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L314+8
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #528]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L300:
	add	r2, r5, #15808
	mov	r1, #16
	add	r2, r2, #24
	ldr	r0, [r4, #88]
	bl	Vc1SMPSeqHdr
	subs	r9, r0, #0
	beq	.L313
	add	r5, r5, #49152
	ldr	r1, .L314+12
	b	.L310
.L311:
	movw	r3, #1242
	ldr	r2, .L314+16
	ldr	r1, .L314+20
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L313:
	ldr	ip, [r4, #104]
	mov	r1, r8
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
	ldr	r3, [r7, #48]
	mov	r1, r9
	mov	r0, r8
	mov	r2, #160
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L312:
	add	r5, r1, #49152
	ldr	r0, [r5, #528]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #528]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L315:
	.align	2
.L314:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC17
	.word	g_event_report
	.word	.LC18
	.word	.LANCHOR0+248
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_VC1_Smp, .-DecodeStream_VC1_Smp
	.align	2
	.global	DecodeStream_REAL8
	.type	DecodeStream_REAL8, %function
DecodeStream_REAL8:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L327
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L328
	ldr	r8, .L329
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r6
	mov	r2, #80
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	REAL8DEC_Decode
	cmn	r0, #2
	strneb	r6, [r4, #1]
	moveq	r3, #1
	streqb	r3, [r4, #1]
	ldr	r6, [r5, #4]
	cmp	r6, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #53248
	ldr	r3, [r8, #48]
	mov	r2, #160
	mov	r1, r6
	mov	r0, r7
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #1960]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L329+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #1960]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L327:
	movw	r3, #1481
	ldr	r2, .L329+8
	ldr	r1, .L329+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L328:
	add	r5, r1, #53248
	ldr	r0, [r5, #1960]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #1960]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L330:
	.align	2
.L329:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LANCHOR0+272
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_REAL8, .-DecodeStream_REAL8
	.align	2
	.global	DecodeStream_REAL9
	.type	DecodeStream_REAL9, %function
DecodeStream_REAL9:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L342
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L343
	ldr	r8, .L344
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r6
	mov	r2, #80
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	REAL9DEC_Decode
	cmn	r0, #2
	strneb	r6, [r4, #1]
	moveq	r3, #1
	streqb	r3, [r4, #1]
	ldr	r6, [r5, #4]
	cmp	r6, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #53248
	ldr	r3, [r8, #48]
	mov	r2, #160
	mov	r1, r6
	mov	r0, r7
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #1952]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L344+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #1952]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L342:
	movw	r3, #1518
	ldr	r2, .L344+8
	ldr	r1, .L344+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L343:
	add	r5, r1, #53248
	ldr	r0, [r5, #1952]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #1952]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L345:
	.align	2
.L344:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LANCHOR0+292
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_REAL9, .-DecodeStream_REAL9
	.align	2
	.global	DecodeStream_DIVX3
	.type	DecodeStream_DIVX3, %function
DecodeStream_DIVX3:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L357
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L358
	ldr	r8, .L359
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r6
	mov	r2, #80
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	DIVX3DEC_Decode
	cmn	r0, #2
	strneb	r6, [r4, #1]
	moveq	r3, #1
	streqb	r3, [r4, #1]
	ldr	r6, [r5, #4]
	cmp	r6, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #40960
	ldr	r3, [r8, #48]
	mov	r2, #160
	mov	r1, r6
	mov	r0, r7
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #1920]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L359+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #1920]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L357:
	movw	r3, #1560
	ldr	r2, .L359+8
	ldr	r1, .L359+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L358:
	add	r5, r1, #40960
	ldr	r0, [r5, #1920]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #1920]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L360:
	.align	2
.L359:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LANCHOR0+312
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_DIVX3, .-DecodeStream_DIVX3
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L372
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L373
	ldr	r8, .L374
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r6
	mov	r2, #80
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	VP8DEC_Decode
	cmn	r0, #2
	strneb	r6, [r4, #1]
	moveq	r3, #1
	streqb	r3, [r4, #1]
	ldr	r6, [r5, #4]
	cmp	r6, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #8192
	ldr	r3, [r8, #48]
	mov	r2, #160
	mov	r1, r6
	mov	r0, r7
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #368]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L374+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #368]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L372:
	movw	r3, #1602
	ldr	r2, .L374+8
	ldr	r1, .L374+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L373:
	add	r5, r1, #8192
	ldr	r0, [r5, #368]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #368]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L375:
	.align	2
.L374:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LANCHOR0+332
	.word	.LC0
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L387
	ldrb	r3, [r0, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L388
	ldr	r8, .L389
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r6
	mov	r2, #80
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	VP6DEC_Decode
	cmn	r0, #2
	strneb	r6, [r4, #1]
	moveq	r3, #1
	streqb	r3, [r4, #1]
	ldr	r6, [r5, #4]
	cmp	r6, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #12288
	ldr	r3, [r8, #48]
	mov	r2, #160
	mov	r1, r6
	mov	r0, r7
	blx	r3
	ldr	r1, [r4, #28]
	ldr	r0, [r5, #752]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L389+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #752]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L387:
	movw	r3, #1643
	ldr	r2, .L389+8
	ldr	r1, .L389+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L388:
	add	r5, r1, #12288
	ldr	r0, [r5, #752]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #752]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L390:
	.align	2
.L389:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LANCHOR0+352
	.word	.LC0
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
	cmp	r0, #31
	mov	r5, r0
	mov	r4, r1
	bhi	.L413
	cmp	r1, #0
	beq	.L394
	ldr	r0, [r1, #8]
	cmp	r0, #0
	beq	.L394
	ldr	r3, .L418
	ldr	r3, [r3, r5, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	beq	.L414
.L396:
	ldrb	r6, [r4, #14]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r4, #408]
	cmp	r6, #1
	beq	.L415
	cmp	r6, #0
	beq	.L416
.L401:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L416:
	ldr	r9, .L418+4
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
	mov	r1, r6
	blx	r3
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r4, #2]
	cmp	r3, #1
	bls	.L401
	ldr	r1, [r4, #108]
	mov	r0, r5
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r4, #188]
	mov	r0, r5
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r9, #48]
	mov	r2, #80
	mov	r1, r6
	mov	r0, r8
	blx	r3
	ldr	r3, [r9, #48]
	mov	r0, r7
	mov	r2, #80
	mov	r1, r6
	blx	r3
	ldr	r1, .L418+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L418+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L400
	mov	r0, r5
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	r7
.L400:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r4, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L414:
	ldr	r3, [r3, #1560]
	cmp	r3, #1
	bne	.L396
	ldrb	r3, [r1, #408]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L396
	mov	r2, #160
	add	r1, r1, #248
	add	r0, r4, #88
	bl	memcpy
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L415:
	ldrb	r6, [r4, #2]	@ zero_extendqisi2
	cmp	r6, r7
	beq	.L417
	cmp	r6, #1
	bne	.L401
	ldr	r2, [r4, #104]
	cmp	r2, #1024
	bcs	.L402
	ldr	r8, .L418+4
	rsb	r0, r2, r0
	ldr	r1, [r4, #88]
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r1, [r4, #104]
	ldr	ip, [r4, #8]
	mov	r0, r5
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #24]
	rsb	ip, r1, ip
	rsb	r2, r1, r2
	str	ip, [r4, #88]
	add	r3, r3, r1
	str	r2, [r4, #100]
	str	r3, [r4, #104]
	ldr	r1, [r4, #108]
	strb	r6, [r4, #94]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #28]
	ldr	r3, [r8, #48]
	mov	r1, r7
	mov	r2, #80
	add	r0, r4, #168
	str	ip, [r4, #108]
	blx	r3
.L403:
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
.L417:
	ldr	r5, .L418+4
	add	r1, r4, #8
	mov	r2, #80
	add	r0, r4, #88
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #80
	mov	r1, r6
	add	r0, r4, #168
	blx	r3
	strb	r6, [r4, #2]
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L402:
	ldr	r3, .L418+4
	mov	r2, #80
	add	r1, r4, #8
	add	r0, r4, #168
	ldr	r3, [r3, #52]
	blx	r3
	b	.L403
.L413:
	movw	r3, #1775
	ldr	r2, .L418+16
	ldr	r1, .L418+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L394:
	ldr	r1, .L418+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L419:
	.align	2
.L418:
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	g_event_report
	.word	.LANCHOR0+372
	.word	.LC0
	.word	.LC19
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r4, r1
	beq	.L426
	add	r6, r1, #49152
	mov	r0, r1
	ldr	r7, [r6, #528]
	bl	VC1_GetPacketState
	cmp	r0, #2
	beq	.L427
.L422:
	mov	r1, r5
	ldr	r0, [r6, #528]
	bl	SegMan
	subs	r7, r0, #0
	beq	.L428
.L424:
	ldr	r5, [r4, #4]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r4, r4, #12288
	ldrb	r3, [r4, #455]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r6, #528]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4, #455]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L426:
	movw	r3, #1209
	ldr	r2, .L429
	ldr	r1, .L429+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L428:
	add	r5, r5, #88
	mov	r0, r4
	mov	r1, r5
	bl	VC1DEC_Decode
	ldr	r3, .L429+8
	mov	r0, r5
	mov	r1, r7
	mov	r2, #160
	ldr	r3, [r3, #48]
	blx	r3
	b	.L424
.L427:
	ldr	r3, .L429+12
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	bne	.L423
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L422
.L423:
	add	r1, r4, #12544
	mov	r0, r4
	add	r1, r1, #32
	bl	VC1DEC_Decode
	b	.L422
.L430:
	.align	2
.L429:
	.word	.LANCHOR0+380
	.word	.LC0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L436
	ldrb	r2, [r0, #14]	@ zero_extendqisi2
	mov	r0, #22
	ldr	r1, .L440
	bl	dprint_vfmw
	ldr	r2, [r4, #20]
	ldr	r1, .L440+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r4, #24]
	ldr	r1, .L440+8
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r5]
	ldr	r3, [r2, #564]
	cmp	r3, #1
	bhi	.L437
	ldr	r1, [r2, #568]
	cmp	r1, #8
	bgt	.L438
	add	r1, r5, #12288
	uxtb	r3, r3
	cmp	r3, #1
	mov	r0, r4
	strb	r3, [r1, #3544]
	ldr	r3, [r2, #568]
	strb	r3, [r1, #3546]
	mov	r1, r5
	beq	.L439
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DecodeStream_VC1_Smp
.L437:
	mov	r0, r6
	ldr	r1, .L440+12
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L436:
	movw	r3, #1293
	ldr	r2, .L440+16
	ldr	r1, .L440+20
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L438:
	mov	r0, r6
	ldr	r1, .L440+24
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L439:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DecodeStream_VC1_Adv
.L441:
	.align	2
.L440:
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LANCHOR0+404
	.word	.LC0
	.word	.LC25
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r0
	mov	r4, r1
	beq	.L449
	add	r5, r1, #86016
	mov	r0, r1
	ldr	r7, [r5, #3048]
	bl	MP2_GetPacketState
	cmp	r0, #2
	beq	.L450
.L444:
	mov	r1, r6
	ldr	r0, [r5, #3048]
	bl	SegMan
	cmp	r0, #0
	beq	.L451
.L446:
	ldr	r4, [r4, #4]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r5, #3066]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r5, #3048]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #3066]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L449:
	movw	r3, #1333
	ldr	r2, .L452
	ldr	r1, .L452+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L451:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG2DEC_Decode
	ldrb	r3, [r5, #3065]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r6, #1]
	b	.L446
.L450:
	ldr	r3, .L452+8
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	bne	.L445
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L444
.L445:
	add	r1, r4, #88064
	mov	r0, r4
	add	r1, r1, #80
	bl	MPEG2DEC_Decode
	b	.L444
.L453:
	.align	2
.L452:
	.word	.LANCHOR0+424
	.word	.LC0
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r0
	mov	r4, r1
	beq	.L460
	add	r5, r1, #20480
	mov	r0, r1
	ldr	r7, [r5, #2496]
	bl	MP4_GetPacketState
	cmp	r0, #3
	beq	.L461
.L456:
	mov	r1, r6
	ldr	r0, [r5, #2496]
	bl	SegMan
	cmp	r0, #0
	beq	.L462
.L458:
	ldr	r4, [r4, #1036]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r5, #2532]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r5, #2496]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #2532]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L460:
	movw	r3, #1378
	ldr	r2, .L463
	ldr	r1, .L463+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L462:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG4DEC_Decode
	b	.L458
.L461:
	ldr	r3, .L463+8
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	bne	.L457
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L456
.L457:
	add	r1, r4, #15680
	mov	r0, r4
	add	r1, r1, #32
	bl	MPEG4DEC_Decode
	b	.L456
.L464:
	.align	2
.L463:
	.word	.LANCHOR0+444
	.word	.LC0
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r4, r1
	beq	.L471
	mov	r0, r1
	ldr	r6, [r1, #4]
	bl	AVS_GetPacketState
	cmp	r0, #0
	bne	.L467
	ldr	r3, .L474
	ldr	r3, [r3, r6, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	beq	.L472
.L468:
	add	r1, r4, #16384
	mov	r0, r4
	add	r1, r1, #168
	bl	AVSDEC_Decode
.L467:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	SegMan
	cmp	r0, #0
	beq	.L473
.L469:
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
.L471:
	movw	r3, #1414
	ldr	r2, .L474+4
	ldr	r1, .L474+8
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L473:
	add	r1, r5, #88
	mov	r0, r4
	bl	AVSDEC_Decode
	b	.L469
.L472:
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L467
	b	.L468
.L475:
	.align	2
.L474:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+464
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_AVS, .-DecodeStream_AVS
	.align	2
	.global	DecodeStream_AVS2
	.type	DecodeStream_AVS2, %function
DecodeStream_AVS2:
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
	cmpne	r0, #0
	mov	r5, r0
	mov	r4, r1
	beq	.L483
	mov	r1, r0
	ldr	r0, [r4, #4]
	bl	SegMan
	cmp	r0, #0
	beq	.L484
.L478:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r5, #1]
	ldr	r5, [r4, #40]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #4]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L483:
	movw	r3, #1449
	ldr	r2, .L485
	ldr	r1, .L485+4
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L484:
	add	r1, r5, #88
	mov	r0, r4
	bl	AVS2DEC_Decode
	b	.L478
.L486:
	.align	2
.L485:
	.word	.LANCHOR0+484
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_AVS2, .-DecodeStream_AVS2
	.align	2
	.global	DecodeStream
	.type	DecodeStream, %function
DecodeStream:
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
	cmp	r2, #0
	cmpne	r0, #0
	mov	r4, r1
	mov	r5, r0
	mov	r6, r2
	beq	.L506
	mov	r0, #6
	bl	VCTRL_RecordPosTime
	cmp	r4, #18
	ldrls	pc, [pc, r4, asl #2]
	b	.L489
.L491:
	.word	.L490
	.word	.L492
	.word	.L493
	.word	.L494
	.word	.L489
	.word	.L495
	.word	.L496
	.word	.L489
	.word	.L497
	.word	.L498
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L500
	.word	.L489
	.word	.L501
	.word	.L502
	.word	.L503
	.word	.L504
.L506:
	movw	r3, #1683
	ldr	r2, .L507
	ldr	r1, .L507+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L504:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_AVS2
.L505:
	mov	r0, #7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L503:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP9
	b	.L505
.L502:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_HEVC
	b	.L505
.L501:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MVC
	b	.L505
.L500:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP8
	b	.L505
.L499:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP6x
	b	.L505
.L498:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_REAL9
	b	.L505
.L497:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_REAL8
	b	.L505
.L496:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_AVS
	b	.L505
.L495:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_DIVX3
	b	.L505
.L494:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG2
	b	.L505
.L493:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG4
	b	.L505
.L492:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VC1
	b	.L505
.L490:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_H264
	b	.L505
.L489:
	movw	r3, #1763
	ldr	r2, .L507
	ldr	r1, .L507+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L505
.L508:
	.align	2
.L507:
	.word	.LANCHOR0+504
	.word	.LC0
	.word	.LC26
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	beq	.L534
	sub	r3, r0, #5
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L511
.L513:
	.word	.L512
	.word	.L511
	.word	.L511
	.word	.L514
	.word	.L515
	.word	.L516
	.word	.L516
	.word	.L516
	.word	.L517
	.word	.L511
	.word	.L511
	.word	.L511
	.word	.L518
.L518:
	ldr	r4, [r1]
	add	r1, r1, #311296
	ldr	r0, [r1, #2860]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L524
	ldr	r1, .L535
	mov	r0, #1
	bl	dprint_vfmw
.L524:
	ldr	r3, .L535+4
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L512:
	ldr	r4, [r1]
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L524
	add	r3, r1, #40960
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1920]
	bl	SM_ReleaseStreamSeg
	b	.L524
.L514:
	ldr	r4, [r1]
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L524
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1960]
	bl	SM_ReleaseStreamSeg
	b	.L524
.L515:
	ldr	r4, [r1]
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L524
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1952]
	bl	SM_ReleaseStreamSeg
	b	.L524
.L516:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #752]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L524
	ldr	r1, .L535+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L524
.L517:
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #368]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L524
	ldr	r1, .L535+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L524
.L511:
	mov	r2, r0
	ldr	r1, .L535+16
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L534:
	movw	r3, #1862
	ldr	r2, .L535+20
	ldr	r1, .L535+24
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L536:
	.align	2
.L535:
	.word	.LC29
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC28
	.word	.LC27
	.word	.LC30
	.word	.LANCHOR0+520
	.word	.LC0
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	beq	.L556
	sub	r0, r0, #10
	cmp	r0, #7
	ldrls	pc, [pc, r0, asl #2]
	b	.L537
.L541:
	.word	.L540
	.word	.L540
	.word	.L540
	.word	.L542
	.word	.L537
	.word	.L537
	.word	.L537
	.word	.L543
.L543:
	ldr	r4, [r1]
	add	r1, r1, #311296
	ldr	r0, [r1, #2860]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L546
	ldr	r1, .L557
	mov	r0, #1
	bl	dprint_vfmw
.L546:
	ldr	r3, .L557+4
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L542:
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #368]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L546
	ldr	r1, .L557+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L546
.L540:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #752]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L546
	ldr	r1, .L557+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L546
.L537:
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L556:
	movw	r3, #1972
	ldr	r2, .L557+16
	ldr	r1, .L557+20
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L558:
	.align	2
.L557:
	.word	.LC29
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LC28
	.word	.LANCHOR0+536
	.word	.LC0
	UNWIND(.fnend)
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	2
	.global	ReleaseCurPic_Realx
	.type	ReleaseCurPic_Realx, %function
ReleaseCurPic_Realx:
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
	beq	.L568
	cmp	r0, #8
	beq	.L562
	cmp	r0, #9
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r4, [r1]
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L569
.L565:
	ldr	r3, .L570
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L562:
	ldr	r4, [r1]
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L565
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1960]
	bl	SM_ReleaseStreamSeg
	b	.L565
.L568:
	movw	r3, #2029
	ldr	r2, .L570+4
	ldr	r1, .L570+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L569:
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1952]
	bl	SM_ReleaseStreamSeg
	b	.L565
.L571:
	.align	2
.L570:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+556
	.word	.LC0
	UNWIND(.fnend)
	.size	ReleaseCurPic_Realx, .-ReleaseCurPic_Realx
	.align	2
	.global	ReleaseCurPic_DIVX3
	.type	ReleaseCurPic_DIVX3, %function
ReleaseCurPic_DIVX3:
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
	beq	.L575
	ldr	r4, [r1]
	ldrb	r3, [r4, #238]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L576
.L574:
	ldr	r3, .L577
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L576:
	add	r3, r1, #40960
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1920]
	bl	SM_ReleaseStreamSeg
	b	.L574
.L575:
	movw	r3, #2071
	ldr	r2, .L577+4
	ldr	r1, .L577+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L578:
	.align	2
.L577:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+576
	.word	.LC0
	UNWIND(.fnend)
	.size	ReleaseCurPic_DIVX3, .-ReleaseCurPic_DIVX3
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
	cmp	r1, #0
	beq	.L597
	cmp	r0, #18
	ldrls	pc, [pc, r0, asl #2]
	b	.L581
.L583:
	.word	.L582
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L581
	.word	.L587
	.word	.L588
	.word	.L581
	.word	.L589
	.word	.L590
	.word	.L591
	.word	.L591
	.word	.L591
	.word	.L592
	.word	.L581
	.word	.L593
	.word	.L594
	.word	.L595
	.word	.L596
.L596:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS2DEC_ClearCurPic
.L582:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_ClearCurrPic
.L584:
	add	r3, r1, #49152
	add	r0, r1, #12736
	ldr	r1, [r3, #528]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1_ClearCurPic
.L585:
	mov	r0, r1
	str	r1, [fp, #-16]
	bl	MP4_ClearCurPic
	ldr	r1, [fp, #-16]
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP4_Clean_HeadPacket
.L586:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_ClearCurPic
.L587:
	mov	r0, #5
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_DIVX3
.L588:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS_ClearCurPic
.L589:
	mov	r0, #8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_Realx
.L590:
	mov	r0, #9
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_Realx
.L591:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L592:
	mov	r0, #13
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L593:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_ClearCurrPic
.L594:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_ClearCurrPic
.L595:
	mov	r0, #17
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L581:
	mov	r2, r0
	ldr	r1, .L598
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L597:
	movw	r3, #2087
	ldr	r2, .L598+4
	ldr	r1, .L598+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L599:
	.align	2
.L598:
	.word	.LC30
	.word	.LANCHOR0+596
	.word	.LC0
	UNWIND(.fnend)
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	2
	.global	IsNewpicSeg
	.type	IsNewpicSeg, %function
IsNewpicSeg:
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
	cmp	r3, #0
	cmpne	r1, #0
	mov	lr, r1
	mov	r6, r3
	moveq	ip, #1
	movne	ip, #0
	beq	.L661
	cmp	r2, #2
	ldr	r1, [r3]
	movne	r3, ip
	beq	.L662
.L603:
	ldrb	ip, [r1]	@ zero_extendqisi2
	ldrb	r4, [r1, #1]	@ zero_extendqisi2
	cmp	ip, #0
	ldrb	r5, [r1, #2]	@ zero_extendqisi2
	bne	.L606
	cmp	r4, #0
	beq	.L663
.L606:
	str	r5, [sp]
	mov	r3, r4
	mov	r2, ip
	ldr	r1, .L665
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
.L651:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L663:
	cmp	r5, #1
	bne	.L606
	cmp	r2, #18
	ldrls	pc, [pc, r2, asl #2]
	b	.L628
.L610:
	.word	.L609
	.word	.L611
	.word	.L612
	.word	.L613
	.word	.L628
	.word	.L628
	.word	.L614
	.word	.L628
	.word	.L628
	.word	.L628
	.word	.L628
	.word	.L628
	.word	.L628
	.word	.L628
	.word	.L628
	.word	.L615
	.word	.L616
	.word	.L628
	.word	.L617
.L662:
	ldrb	ip, [r6, #72]	@ zero_extendqisi2
	ands	r3, ip, #1
	beq	.L603
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #179
	cmpne	ip, #176
	add	r4, ip, #75
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #254
	orreq	r2, r2, #1
	cmp	ip, #47
	movhi	r0, r2
	orrls	r0, r2, #1
	uxtb	r2, r4
	cmp	r2, #1
	movhi	r2, r0
	orrls	r2, r0, #1
	cmp	r2, #0
	beq	.L621
.L626:
	ldr	r2, [lr]
	cmp	r2, #0
	beq	.L621
	b	.L620
.L617:
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	add	r3, r2, #80
	add	r4, r2, #74
	sub	ip, r2, #179
	uxtb	r0, r3
	clz	ip, ip
	uxtb	r3, r4
	cmp	r3, #1
	cmphi	r0, #1
	mov	ip, ip, lsr #5
	movls	r3, #1
	movhi	r3, #0
	orrs	r3, ip, r3
	beq	.L640
.L658:
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L640
	mov	r2, #1
	str	r2, [lr]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	mov	r0, r3
	sub	ip, r2, #179
	clz	ip, ip
	mov	ip, ip, lsr #5
.L624:
	cmp	r2, #182
	movne	r2, ip
	orreq	r2, ip, #1
	cmp	r2, #0
	beq	.L651
.L654:
	mov	r3, #0
	str	r3, [lr]
	b	.L651
.L609:
	mov	r0, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	H264_IsNewPicNal
.L613:
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	add	r3, ip, #73
	cmp	ip, #0
	cmpne	ip, #179
	uxtb	r3, r3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, #1
	movhi	r3, r2
	orrls	r3, r2, #1
	cmp	r3, #0
	bne	.L664
	ldr	r3, .L665+4
	mvn	r5, #0
	mvn	r4, #0
	ldr	r0, [r3, r0, asl #2]
	add	r0, r0, #688
	ldrd	r2, [r0, #-8]
	cmp	r3, r5
	cmpeq	r2, r4
	bne	.L632
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L632
	sub	r3, ip, #1
	uxtb	r3, r3
	cmp	r3, #174
	bhi	.L632
	ldrd	r4, [r6, #24]
	mvn	r3, #0
	strd	r4, [r0, #-8]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
.L619:
	cmp	ip, #0
	streq	ip, [lr]
	moveq	r0, r3
	movne	r0, r3
	b	.L651
.L614:
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	sub	ip, r2, #179
	add	r3, r2, #74
	clz	ip, ip
	uxtb	r3, r3
	mov	ip, ip, lsr #5
	cmp	r2, #176
	movne	r0, ip
	orreq	r0, ip, #1
	cmp	r3, #1
	movhi	r3, r0
	orrls	r3, r0, #1
	cmp	r3, #0
	bne	.L658
.L640:
	mvn	r0, #0
	b	.L624
.L611:
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	sub	r3, r2, #12
	cmp	r2, #10
	cmpne	r3, #3
	bhi	.L643
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L643
	mov	r0, r3
	mov	r3, #1
	str	r3, [lr]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
.L625:
	cmp	r2, #13
	bne	.L651
	b	.L654
.L612:
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #179
	cmpne	ip, #176
	add	r4, ip, #75
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #254
	orreq	r2, r2, #1
	cmp	ip, #47
	movhi	r0, r2
	orrls	r0, r2, #1
	uxtb	r2, r4
	cmp	r2, #1
	movhi	r2, r0
	orrls	r2, r0, #1
	cmp	r2, #0
	bne	.L626
.L620:
	cmp	r3, #1
	bne	.L634
.L621:
	mov	r3, #1
	str	r3, [lr]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	mov	r0, #0
.L622:
	cmp	ip, #182
	bne	.L651
	b	.L654
.L615:
	mov	r0, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	MVC_IsNewPicNal
.L616:
	mov	r0, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	HEVC_IsNewPicNal
.L628:
	mvn	r0, #0
	b	.L651
.L664:
	ldr	r0, [lr]
	cmp	r0, #0
	bne	.L632
	mov	r2, #1
	mov	r3, r0
	str	r2, [lr]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	b	.L619
.L632:
	mvn	r3, #0
	b	.L619
.L661:
	movw	r3, #2363
	ldr	r2, .L665+8
	ldr	r1, .L665+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L651
.L643:
	mvn	r0, #0
	b	.L625
.L634:
	mvn	r0, #0
	b	.L622
.L666:
	.align	2
.L665:
	.word	.LC31
	.word	s_pstVfmwChan
	.word	.LANCHOR0+612
	.word	.LC0
	UNWIND(.fnend)
	.size	IsNewpicSeg, .-IsNewpicSeg
	.align	2
	.global	CloseUsdPool
	.type	CloseUsdPool, %function
CloseUsdPool:
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
	bhi	.L673
	ldr	r3, .L674
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #128]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L674+4
	ldr	r3, [r3, #220]
	blx	r3
	mov	r3, #0
	str	r3, [r4, #128]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L673:
	movw	r3, #2421
	ldr	r2, .L674+8
	ldr	r1, .L674+12
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L675:
	.align	2
.L674:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+624
	.word	.LC0
	UNWIND(.fnend)
	.size	CloseUsdPool, .-CloseUsdPool
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
	cmp	r0, #31
	bhi	.L682
	ldr	r3, .L683
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #128]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #128]
	ldmfd	sp, {fp, sp, pc}
.L682:
	movw	r3, #2453
	ldr	r2, .L683+4
	ldr	r1, .L683+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L684:
	.align	2
.L683:
	.word	.LANCHOR1
	.word	.LANCHOR0+640
	.word	.LC0
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
	cmp	r0, #31
	bhi	.L691
	ldr	r3, .L692
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #128]
	cmp	r0, #0
	beq	.L689
	add	r1, r0, #203776
	mov	ip, #0
	add	r1, r1, #512
	mov	r3, r0
	mov	r2, ip
	str	ip, [r0]
.L688:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L688
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L691:
	movw	r3, #2471
	ldr	r2, .L692+4
	ldr	r1, .L692+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L689:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L693:
	.align	2
.L692:
	.word	.LANCHOR1
	.word	.LANCHOR0+664
	.word	.LC0
	UNWIND(.fnend)
	.size	InitUsdPool, .-InitUsdPool
	.align	2
	.global	OpenUsdPool
	.type	OpenUsdPool, %function
OpenUsdPool:
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
	mov	r5, r0
	bhi	.L699
	ldr	r4, .L701
	add	r4, r4, r0, lsl #2
	ldr	r3, [r4, #128]
	cmp	r3, #0
	beq	.L700
.L697:
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	InitUsdPool
.L700:
	ldr	r3, .L701+4
	movw	r0, #7688
	movt	r0, 3
	ldr	r3, [r3, #216]
	blx	r3
	str	r0, [r4, #128]
	b	.L697
.L699:
	movw	r3, #2406
	ldr	r2, .L701+8
	ldr	r1, .L701+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L702:
	.align	2
.L701:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+676
	.word	.LC0
	UNWIND(.fnend)
	.size	OpenUsdPool, .-OpenUsdPool
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
	cmp	r0, #31
	bhi	.L708
	cmp	r1, #0
	beq	.L709
	ldr	r3, .L710
	add	r3, r3, r0, lsl #2
	ldr	r2, [r3, #128]
	cmp	r2, #0
	streq	r1, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	InitUsdPool
.L708:
	movw	r3, #2438
	ldr	r2, .L710+4
	ldr	r1, .L710+8
	mov	r0, #1
	bl	dprint_vfmw
.L705:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L709:
	movw	r3, #2439
	ldr	r2, .L710+4
	ldr	r1, .L710+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L705
.L711:
	.align	2
.L710:
	.word	.LANCHOR1
	.word	.LANCHOR0+688
	.word	.LC0
	UNWIND(.fnend)
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	2
	.global	GetUsd
	.type	GetUsd, %function
GetUsd:
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
	bhi	.L720
	ldr	r3, .L721
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #128]
	cmp	ip, #0
	beq	.L719
	mov	r3, ip
	mov	r2, #0
	b	.L716
.L715:
	add	r2, r2, #1
	add	r3, r3, #1056
	cmp	r2, #192
	add	r3, r3, #8
	beq	.L719
.L716:
	ldr	r1, [r3, #1048]
	cmp	r1, #0
	bne	.L715
	ldr	r1, [r3, #1044]
	cmp	r1, #0
	bne	.L715
	movw	r3, #1064
	mov	r4, #0
	mul	r0, r3, r2
	mov	r5, #0
	mla	r2, r2, r3, r3
	add	lr, ip, r0
	add	r0, r0, #8
	add	r3, lr, #1024
	add	r0, ip, r0
	str	r1, [lr, #1044]
	strd	r4, [ip, r2]
	str	r1, [lr, #1060]
	str	r1, [lr, #1056]
	str	r1, [lr, #1052]
	strb	r1, [lr, #1034]
	strb	r1, [lr, #1035]
	strb	r1, [lr, #1036]
	strh	r1, [r3, #14]	@ movhi
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L720:
	movw	r3, #2501
	ldr	r2, .L721+4
	ldr	r1, .L721+8
	mov	r0, #1
	bl	dprint_vfmw
.L719:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L722:
	.align	2
.L721:
	.word	.LANCHOR1
	.word	.LANCHOR0+708
	.word	.LC0
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
	.global	MarkUsdByDnr
	.type	MarkUsdByDnr, %function
MarkUsdByDnr:
	UNWIND(.fnstart)
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
	movne	r3, #1
	strne	r3, [r1, #1036]
	ldmnefd	sp, {fp, sp, pc}
	mov	r3, #2544
	ldr	r2, .L730
	ldr	r1, .L730+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L731:
	.align	2
.L730:
	.word	.LANCHOR0+716
	.word	.LC0
	UNWIND(.fnend)
	.size	MarkUsdByDnr, .-MarkUsdByDnr
	.align	2
	.global	UnMarkUsdByDnr
	.type	UnMarkUsdByDnr, %function
UnMarkUsdByDnr:
	UNWIND(.fnstart)
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
	strne	r3, [r1, #1036]
	ldmnefd	sp, {fp, sp, pc}
	movw	r3, #2554
	ldr	r2, .L734
	ldr	r1, .L734+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L735:
	.align	2
.L734:
	.word	.LANCHOR0+732
	.word	.LC0
	UNWIND(.fnend)
	.size	UnMarkUsdByDnr, .-UnMarkUsdByDnr
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
	cmp	r0, #0
	beq	.L748
	cmp	r1, #0
	beq	.L749
	ldrh	r3, [r0, #4]
	ldrh	lr, [r0, #8]
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L742
.L741:
	add	r2, r0, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L740
	ldr	ip, [r2, #148]
	ldr	r2, [r1, #148]
	cmp	ip, r2
	beq	.L743
.L740:
	cmp	r3, lr
	bne	.L741
.L742:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L743:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L749:
	mov	r0, r1
	ldr	r1, .L750
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L748:
	movw	r3, #2566
	ldr	r2, .L750+4
	ldr	r1, .L750+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L751:
	.align	2
.L750:
	.word	.LC5
	.word	.LANCHOR0+748
	.word	.LC0
	UNWIND(.fnend)
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	2
	.global	IsVoQueueEmpty
	.type	IsVoQueueEmpty, %function
IsVoQueueEmpty:
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
	subs	r4, r0, #0
	beq	.L756
	ldrh	r0, [r4, #8]
	ldrh	r3, [r4, #6]
	cmp	r0, r3
	ldreqh	r3, [r4, #4]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L756:
	ldr	r2, .L757
	ldr	r1, .L757+4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L758:
	.align	2
.L757:
	.word	.LANCHOR0+768
	.word	.LC32
	UNWIND(.fnend)
	.size	IsVoQueueEmpty, .-IsVoQueueEmpty
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
	subs	r3, r0, #0
	beq	.L770
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L761
.L763:
	.word	.L762
	.word	.L764
	.word	.L765
	.word	.L766
	.word	.L767
	.word	.L768
.L768:
	mov	r1, #0
	mov	r2, #2
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L762:
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L764:
	mov	r1, #4
	mov	r2, #3
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L765:
	mov	r1, #16
	mov	r2, #9
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L766:
	mov	r1, #221
	mov	r2, #100
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L767:
	mov	r1, #235
	mov	r2, #100
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L761:
	mov	r0, #1
	mov	r2, r1
	mov	ip, #0
	str	r0, [r3, #104]
	ldr	r1, .L771
	str	ip, [r3, #100]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L770:
	movw	r3, #2614
	ldr	r2, .L771+4
	ldr	r1, .L771+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L772:
	.align	2
.L771:
	.word	.LC33
	.word	.LANCHOR0+784
	.word	.LC0
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
	cmp	r0, #0
	beq	.L777
	ldr	r0, [r0, #296]
	cmp	r0, #1
	mvnls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L777:
	movw	r3, #2662
	ldr	r2, .L778
	ldr	r1, .L778+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L779:
	.align	2
.L778:
	.word	.LANCHOR0+800
	.word	.LC0
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L788
	ldr	r3, [r4, #332]
	cmp	r3, #1
	beq	.L785
	ldr	r2, [r4, #336]
	cmp	r2, #1
	beq	.L785
	cmp	r3, #2
	ldr	r0, [r4, #340]
	moveq	r3, #1
	subne	r3, r0, #1
	clzne	r3, r3
	movne	r3, r3, lsr #5
.L783:
	cmp	r0, #1
	movne	r0, r3
	orreq	r0, r3, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L785:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L788:
	movw	r3, #2677
	ldr	r2, .L789
	ldr	r1, .L789+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L790:
	.align	2
.L789:
	.word	.LANCHOR0+820
	.word	.LC0
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	bhi	.L795
	ldr	r1, .L797
	ldr	r1, [r1, r0, asl #2]
	ldr	r1, [r1, #128]
	cmp	r1, #0
	ldrd	r0, [fp, #4]
	bne	.L796
	subs	r0, r2, r0
	sbc	r1, r3, r1
	cmp	r1, #0
	cmpeq	r0, #1000
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L796:
	subs	r0, r2, r0
	sbc	r1, r3, r1
	mov	r2, r0
	movw	r0, #16960
	mov	r3, r1
	mov	r1, #0
	cmp	r3, r1
	movt	r0, 15
	cmpeq	r2, r0
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L795:
	movw	r3, #2702
	ldr	r2, .L797+4
	ldr	r1, .L797+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L798:
	.align	2
.L797:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+836
	.word	.LC0
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
.LANCHOR0 = . + 0
	.type	__func__.14951, %object
	.size	__func__.14951, 13
__func__.14951:
	.ascii	"PrintVoQueue\000"
	.space	3
	.type	__func__.14957, %object
	.size	__func__.14957, 13
__func__.14957:
	.ascii	"ResetVoQueue\000"
	.space	3
	.type	__func__.14963, %object
	.size	__func__.14963, 20
__func__.14963:
	.ascii	"ReturnImageToSyntax\000"
	.type	__func__.15028, %object
	.size	__func__.15028, 19
__func__.15028:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__FUNCTION__.15031, %object
	.size	__FUNCTION__.15031, 19
__FUNCTION__.15031:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__func__.15039, %object
	.size	__func__.15039, 15
__func__.15039:
	.ascii	"GetQueueImgNum\000"
	.space	1
	.type	__func__.15069, %object
	.size	__func__.15069, 20
__func__.15069:
	.ascii	"SYNTAX_ReceiveImage\000"
	.type	__func__.15116, %object
	.size	__func__.15116, 20
__func__.15116:
	.ascii	"SYNTAX_ReleaseImage\000"
	.type	__func__.15125, %object
	.size	__func__.15125, 19
__func__.15125:
	.ascii	"SYNTAX_ReturnImage\000"
	.space	1
	.type	__func__.15151, %object
	.size	__func__.15151, 18
__func__.15151:
	.ascii	"DecodeStream_H264\000"
	.space	2
	.type	__func__.15158, %object
	.size	__func__.15158, 18
__func__.15158:
	.ascii	"DecodeStream_HEVC\000"
	.space	2
	.type	__func__.15163, %object
	.size	__func__.15163, 17
__func__.15163:
	.ascii	"DecodeStream_VP9\000"
	.space	3
	.type	__func__.15170, %object
	.size	__func__.15170, 17
__func__.15170:
	.ascii	"DecodeStream_MVC\000"
	.space	3
	.type	__func__.15183, %object
	.size	__func__.15183, 21
__func__.15183:
	.ascii	"DecodeStream_VC1_Smp\000"
	.space	3
	.type	__func__.15222, %object
	.size	__func__.15222, 19
__func__.15222:
	.ascii	"DecodeStream_REAL8\000"
	.space	1
	.type	__func__.15228, %object
	.size	__func__.15228, 19
__func__.15228:
	.ascii	"DecodeStream_REAL9\000"
	.space	1
	.type	__func__.15234, %object
	.size	__func__.15234, 19
__func__.15234:
	.ascii	"DecodeStream_DIVX3\000"
	.space	1
	.type	__func__.15240, %object
	.size	__func__.15240, 17
__func__.15240:
	.ascii	"DecodeStream_VP8\000"
	.space	3
	.type	__func__.15246, %object
	.size	__func__.15246, 18
__func__.15246:
	.ascii	"DecodeStream_VP6x\000"
	.space	2
	.type	__func__.15276, %object
	.size	__func__.15276, 7
__func__.15276:
	.ascii	"SegMan\000"
	.space	1
	.type	__func__.15177, %object
	.size	__func__.15177, 21
__func__.15177:
	.ascii	"DecodeStream_VC1_Adv\000"
	.space	3
	.type	__func__.15188, %object
	.size	__func__.15188, 17
__func__.15188:
	.ascii	"DecodeStream_VC1\000"
	.space	3
	.type	__func__.15195, %object
	.size	__func__.15195, 19
__func__.15195:
	.ascii	"DecodeStream_MPEG2\000"
	.space	1
	.type	__func__.15202, %object
	.size	__func__.15202, 19
__func__.15202:
	.ascii	"DecodeStream_MPEG4\000"
	.space	1
	.type	__func__.15209, %object
	.size	__func__.15209, 17
__func__.15209:
	.ascii	"DecodeStream_AVS\000"
	.space	3
	.type	__func__.15216, %object
	.size	__func__.15216, 18
__func__.15216:
	.ascii	"DecodeStream_AVS2\000"
	.space	2
	.type	__func__.15252, %object
	.size	__func__.15252, 13
__func__.15252:
	.ascii	"DecodeStream\000"
	.space	3
	.type	__func__.15282, %object
	.size	__func__.15282, 14
__func__.15282:
	.ascii	"ReleasePacket\000"
	.space	2
	.type	__func__.15298, %object
	.size	__func__.15298, 18
__func__.15298:
	.ascii	"ReleaseCurPic_VPx\000"
	.space	2
	.type	__func__.15311, %object
	.size	__func__.15311, 20
__func__.15311:
	.ascii	"ReleaseCurPic_Realx\000"
	.type	__func__.15321, %object
	.size	__func__.15321, 20
__func__.15321:
	.ascii	"ReleaseCurPic_DIVX3\000"
	.type	__func__.15326, %object
	.size	__func__.15326, 14
__func__.15326:
	.ascii	"ReleaseCurPic\000"
	.space	2
	.type	__func__.15406, %object
	.size	__func__.15406, 12
__func__.15406:
	.ascii	"IsNewpicSeg\000"
	.type	__func__.15416, %object
	.size	__func__.15416, 13
__func__.15416:
	.ascii	"CloseUsdPool\000"
	.space	3
	.type	__func__.15426, %object
	.size	__func__.15426, 21
__func__.15426:
	.ascii	"CloseUsdPool_WithMem\000"
	.space	3
	.type	__func__.15432, %object
	.size	__func__.15432, 12
__func__.15432:
	.ascii	"InitUsdPool\000"
	.type	__func__.15412, %object
	.size	__func__.15412, 12
__func__.15412:
	.ascii	"OpenUsdPool\000"
	.type	__func__.15422, %object
	.size	__func__.15422, 20
__func__.15422:
	.ascii	"OpenUsdPool_WithMem\000"
	.type	__func__.15442, %object
	.size	__func__.15442, 7
__func__.15442:
	.ascii	"GetUsd\000"
	.space	1
	.type	__func__.15454, %object
	.size	__func__.15454, 13
__func__.15454:
	.ascii	"MarkUsdByDnr\000"
	.space	3
	.type	__func__.15459, %object
	.size	__func__.15459, 15
__func__.15459:
	.ascii	"UnMarkUsdByDnr\000"
	.space	1
	.type	__func__.15465, %object
	.size	__func__.15465, 17
__func__.15465:
	.ascii	"IsImageInVoQueue\000"
	.space	3
	.type	__func__.15471, %object
	.size	__func__.15471, 15
__func__.15471:
	.ascii	"IsVoQueueEmpty\000"
	.space	1
	.type	__func__.15476, %object
	.size	__func__.15476, 15
__func__.15476:
	.ascii	"SetAspectRatio\000"
	.space	1
	.type	__func__.15489, %object
	.size	__func__.15489, 17
__func__.15489:
	.ascii	"GetVoLastImageID\000"
	.space	3
	.type	__func__.15494, %object
	.size	__func__.15494, 16
__func__.15494:
	.ascii	"IsMain10Profile\000"
	.type	__func__.15501, %object
	.size	__func__.15501, 12
__func__.15501:
	.ascii	"IsPtsRewind\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"[%s %d]assert warning\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"VoQueue state: head(%d) history(%d) tail(%d)\000" )
	.space	3
.LC2:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%d \000" )
.LC4:
	ASCII(.ascii	"ResetVoQueue but queue not empty: head(%d) history(" )
	ASCII(.ascii	"%d) tail(%d)\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"image point NULL\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"call InsertVOQueue\012\000" )
.LC7:
	ASCII(.ascii	"FATAL: p_image(id=%d) has already in the VoQueue!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC8:
	ASCII(.ascii	"error=%d,W=%d,H=%d,not acceptable!\012\000" )
.LC9:
	ASCII(.ascii	"out_pts: %lld -> %lld Usertag %lld\012\000" )
.LC10:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) + F%d\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"%s, pstVoQue is NULL!!!\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) - F%d\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"SYNTAX_ReleaseImage p_image is null\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"Image %d not found in vo queue.\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"image[%d] null\012\000" )
.LC16:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) x F%d\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"LENTH ERROR: VC1 S/MP BS is wrong!\012\000" )
.LC18:
	ASCII(.ascii	"SYNTAX ERROR: VC1 S/MP BS is wrong!\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"pSegMan error!\012\000" )
.LC20:
	ASCII(.ascii	"More than two packet!!!ERROR!!!\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"pSegMan->CurrSeg.IsLastSeg=%d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"pSegMan->CurrSeg.PhyAddr=%#x\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"pSegMan->CurrSeg.LenInByte=%#x\012\000" )
.LC24:
	ASCII(.ascii	"ERROR: Wrong PreParseInfo about Vc1 IsAdvProfile!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC25:
	ASCII(.ascii	"ERROR: Wrong PreParseInfo about Vc1 CodecVersion!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC26:
	ASCII(.ascii	"Func: %s, Line: %d\012\000" )
.LC27:
	ASCII(.ascii	"ERROR: VFMW_VP8 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"ERROR: VFMW_VP6 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"ERROR: VFMW_VP9 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"VidStd=%d Error!\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"%s pstVoQue NULL\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"WARNNING: aspect ration (%d) is not expected!\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	last_rec_pos_time.15027, %object
	.size	last_rec_pos_time.15027, 128
last_rec_pos_time.15027:
	.space	128
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 128
pstVdecUsdPool:
	.space	128
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
