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
	b	.L18
.L4:
	.word	.L17
	.word	.L5
	.word	.L6
	.word	.L7
	.word	.L18
	.word	.L8
	.word	.L9
	.word	.L18
	.word	.L10
	.word	.L11
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L13
	.word	.L18
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L18
	.word	.L18
	.word	.L17
.L17:
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
	add	r0, r0, #5504
	add	r0, r0, #56
	ldmfd	sp, {fp, sp, pc}
.L16:
	add	r0, r0, #274432
	add	r0, r0, #1408
	ldmfd	sp, {fp, sp, pc}
.L18:
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
	beq	.L26
	ldrh	ip, [r5, #8]
	mov	r0, #1
	ldrh	r3, [r5, #4]
	ldrh	r2, [r5, #6]
	ldr	r1, .L27
	str	ip, [sp]
	bl	dprint_vfmw
	ldrh	r3, [r5, #4]
	ldrh	r2, [r5, #8]
	and	r4, r3, #63
	cmp	r2, r4
	bne	.L25
	b	.L24
.L23:
	add	r3, r5, r4, lsl #2
	ldr	r1, .L27+4
	mov	r0, #1
	ldr	r3, [r3, #12]
	ldr	r2, [r3, #148]
	bl	dprint_vfmw
	add	r3, r4, #1
	ldrh	r2, [r5, #8]
	and	r4, r3, #63
	cmp	r2, r4
	beq	.L24
.L25:
	tst	r3, #7
	bne	.L23
	ldr	r1, .L27+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L23
.L24:
	ldr	r1, .L27+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L26:
	mov	r3, #78
	ldr	r2, .L27+12
	ldr	r1, .L27+16
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L28:
	.align	2
.L27:
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
	beq	.L34
	ldr	r5, .L36
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	ldrh	r1, [r4, #8]
	cmp	r2, r3
	beq	.L35
.L32:
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L36+4
	bl	dprint_vfmw
.L33:
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
.L35:
	cmp	r2, r1
	bne	.L32
	b	.L33
.L34:
	mov	r3, #107
	ldr	r2, .L36+8
	ldr	r1, .L36+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L37:
	.align	2
.L36:
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
	beq	.L56
	cmp	r0, #20
	ldrls	pc, [pc, r0, asl #2]
	b	.L38
.L42:
	.word	.L41
	.word	.L43
	.word	.L44
	.word	.L45
	.word	.L38
	.word	.L46
	.word	.L47
	.word	.L38
	.word	.L48
	.word	.L49
	.word	.L50
	.word	.L50
	.word	.L50
	.word	.L51
	.word	.L38
	.word	.L52
	.word	.L53
	.word	.L54
	.word	.L38
	.word	.L38
	.word	.L55
.L56:
	mov	r3, #151
	ldr	r2, .L57
	ldr	r1, .L57+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L55:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_RecycleImage
.L41:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_RecycleImage
.L43:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_RecycleImage
.L44:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_RecycleImage
.L45:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_RecycleImage
.L46:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_RecycleImage
.L47:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_RecycleImage
.L48:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_RecycleImage
.L49:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_RecycleImage
.L50:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_RecycleImage
.L51:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_RecycleImage
.L52:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_RecycleImage
.L53:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_DECRecycleImage
.L54:
	ldr	r1, [r2, #148]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_RecycleImage
.L38:
	ldmfd	sp, {fp, sp, pc}
.L58:
	.align	2
.L57:
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
	bhi	.L128
	cmp	r5, #0
	cmpne	r2, #0
	beq	.L130
	cmp	r4, #0
	beq	.L131
	ldr	r6, .L140
	mov	r0, #2
	ldr	r1, .L140+4
	bl	dprint_vfmw
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r9, [r5, #4]
	ldrh	r0, [r5, #8]
	and	r9, r9, #63
	cmp	r0, r9
	ldrne	r8, [fp, #-56]
	bne	.L69
	b	.L68
.L67:
	add	r9, r9, #1
	and	r9, r9, #63
	cmp	r0, r9
	beq	.L132
.L69:
	add	r3, r5, r9, lsl #2
	ldr	r1, [r4, #148]
	ldr	r3, [r3, #12]
	ldr	r2, [r3, #148]
	cmp	r2, r1
	bne	.L67
	ldr	r1, .L140+8
	mov	r0, #0
	bl	dprint_vfmw
	add	r9, r9, #1
	mov	r3, #1000
	str	r3, [r4, #152]
	ldrh	r0, [r5, #8]
	and	r9, r9, #63
	cmp	r0, r9
	bne	.L69
.L132:
	str	r8, [fp, #-56]
.L68:
	ldr	r2, [r4, #152]
	cmp	r2, #100
	bhi	.L133
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #72]
	cmp	r3, #31
	bhi	.L134
.L70:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L140+12
	bl	dprint_vfmw
	ldr	r3, [r4, #152]
	cmp	r3, #1000
	beq	.L73
	mov	r2, r4
	mov	r1, r10
	ldr	r0, [fp, #-56]
	bl	ReturnImageToSyntax
.L73:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
.L61:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L134:
	cmp	r1, #31
	bls	.L70
	ldr	r8, [fp, #-56]
	add	r1, r4, #416
	mov	r0, r7
	str	r8, [r4, #216]
	bl	VCTRL_GetHDRConfigInfo
	ldr	r3, .L140+16
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
	beq	.L94
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
	beq	.L135
	cmp	r8, #1
	bls	.L76
	mov	r2, r0
	mov	r3, r1
	mvn	r0, #0
	mvn	r1, #0
	b	.L74
.L133:
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #72]
	b	.L70
.L135:
	cmp	r8, #1
	bls	.L136
.L94:
	mov	r2, r0
	mov	r3, r1
.L74:
	ldrd	r8, [ip]
	strd	r0, [ip, #-8]
	strd	r0, [sp]
	mov	r0, #29
	strd	r8, [sp, #8]
	ldr	r1, .L140+20
	bl	dprint_vfmw
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L77
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ldrne	r2, [r4, #68]
	beq	.L77
.L78:
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
	ldreq	r3, .L140+24
	streq	r3, [fp, #-56]
	beq	.L80
	ldr	r1, .L140+24
	ldr	r8, [r1]
	str	r1, [fp, #-56]
	cmp	r8, #0
	beq	.L81
	strb	r3, [fp, #-52]
	mov	r1, #7
	strb	r2, [fp, #-51]
	mov	r3, #2
	sub	r2, fp, #52
	mov	r0, r7
	blx	r8
.L81:
	str	r10, [r5, #272]
.L80:
	ldr	r3, [r5, #276]
	ldr	r2, [fp, #-60]
	cmp	r2, r3
	beq	.L82
	ldr	r3, [fp, #-56]
	ldr	r8, [r3]
	cmp	r8, #0
	beq	.L83
	ldrb	r1, [fp, #-65]	@ zero_extendqisi2
	sub	r2, fp, #44
	mov	r3, #1
	mov	r0, r7
	strb	r1, [r2, #-8]!
	mov	r1, #4
	blx	r8
.L83:
	ldr	r3, [fp, #-60]
	str	r3, [r5, #276]
.L82:
	ldr	r3, [r5, #288]
	cmp	r9, r3
	beq	.L137
.L84:
	ldr	r3, [fp, #-56]
	str	r9, [r5, #288]
	ldr	r8, [r3]
	ldr	r3, [fp, #-64]
	cmp	r8, #0
	str	r3, [r5, #292]
	beq	.L85
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
.L85:
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
	ldr	r1, .L140+28
	bl	dprint_vfmw
	ldrh	r3, [r5, #8]
	ldr	r9, .L140+32
	mov	r1, #0
	add	r2, r5, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	str	r4, [r2, #12]
	add	r2, r8, r10
	strh	r3, [r5, #8]	@ movhi
	add	r5, r9, r2
	ldr	r3, .L140+16
	ldr	r3, [r3, r7, asl #2]
	add	r3, r3, #294912
	ldr	r2, [r3, #1536]
	add	r2, r2, #1
	str	r2, [r3, #1536]
	str	r1, [r4, #264]
	ldr	r3, [r5, #24]
	cmp	r3, #6
	beq	.L138
.L87:
	ldr	r2, [r4, #52]
	add	r3, r8, r10
	add	r3, r9, r3
	mov	r1, #5
	mov	r0, r7
	str	r2, [r3, #20]
	ldr	r2, [r4, #160]
	bl	VDEC_Lowdelay_Event_Time
	ldr	r1, .L140+36
	ldr	r3, [r4, #160]
	mov	r0, #2
	ldr	r2, [r6, #16]
	add	r3, r3, #1
	str	r3, [r1, r7, asl #2]
	blx	r2
	ldr	r3, [fp, #-56]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L88
	mov	r2, r4
	mov	r3, #640
	mov	r1, #5
	mov	r0, r7
	blx	r5
.L88:
	mov	r0, #8
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L139
.L90:
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
	bcc	.L61
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L92
	movw	r0, #10000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r4, #8]
.L92:
	add	r8, r8, r10
	mov	r2, #0
	add	r3, r9, r8
	mov	r0, #1
	str	r5, [r9, r8]
	str	r2, [r3, #4]
	b	.L61
.L77:
	ldr	r2, [r4, #68]
	ldr	r3, [r4, #72]
	mov	r1, r2, lsr #1
	str	r2, [r4, #76]
	str	r3, [r4, #80]
	mov	r3, r3, lsr #1
	str	r1, [r4, #84]
	str	r3, [r4, #88]
	b	.L78
.L136:
	ldrb	r3, [r4, #64]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L94
.L76:
	mvn	r9, #0
	str	r9, [lr]
	mov	r2, r9
	mov	r0, r9
	mov	r3, r9
	str	r9, [lr, #4]
	mov	r1, r9
	b	.L74
.L130:
	movw	r3, #397
.L128:
	ldr	r2, .L140+40
	mov	r0, #1
	ldr	r1, .L140+44
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L61
.L139:
	ldr	r3, [r6]
	blx	r3
	ldr	r1, .L140+48
	ldr	r2, .L140+52
	ldr	r3, [r1, r7, asl #2]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L90
	mov	r2, r7, asl #24
	str	r0, [r1, r7, asl #2]
	add	r2, r2, #524288
	movw	r1, #522
	ldr	r0, .L140+56
	bl	DBG_AddTrace
	b	.L90
.L138:
	ldr	r2, [r5, #68]
	add	r3, r5, #64
	cmp	r2, r1
	bne	.L87
	ldr	r1, [r6]
	str	r2, [fp, #-64]
	str	r3, [fp, #-60]
	blx	r1
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-60]
	str	r2, [r5, #24]
	str	r0, [r3, #4]
	b	.L87
.L137:
	ldr	r3, [r5, #292]
	ldr	r2, [fp, #-64]
	cmp	r2, r3
	bne	.L84
	b	.L85
.L131:
	mov	r0, r4
	ldr	r1, .L140+60
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L61
.L141:
	.align	2
.L140:
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
	bne	.L149
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
.L149:
	movw	r3, #563
	ldr	r2, .L150
	ldr	r1, .L150+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L151:
	.align	2
.L150:
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
	beq	.L158
	bl	SYNTAX_GetVoQue
	subs	r4, r0, #0
	beq	.L159
	ldr	r9, .L160
	mov	r0, #2
	ldr	r3, [r9, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r2, r3
	mvneq	r5, #2
	beq	.L156
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
	ldr	r1, .L160+4
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
.L156:
	ldr	r3, [r9, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r5
.L154:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L158:
	movw	r3, #678
	ldr	r2, .L160+8
	ldr	r1, .L160+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L154
.L159:
	ldr	r2, .L160+8
	mov	r0, #1
	ldr	r1, .L160+16
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L154
.L161:
	.align	2
.L160:
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
	beq	.L209
	bl	SYNTAX_GetVoQue
	subs	r5, r0, #0
	beq	.L210
	ldr	r8, .L211
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
	bne	.L197
	b	.L196
.L170:
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	beq	.L196
.L197:
	add	r10, r4, #2
	add	r3, r5, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L168
	ldr	ip, [r3, #148]
	rsb	ip, ip, r9
	clz	ip, ip
	mov	ip, ip, lsr #5
	cmp	ip, #0
	beq	.L170
.L169:
	ldrh	r0, [r5, #4]
	b	.L172
.L199:
	mov	r4, r2
.L172:
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
	bne	.L199
	ldr	r3, [r6, #148]
	cmp	ip, #1
	ldr	r2, [r5, #344]
	rsb	r3, r2, r3
	str	r3, [r6, #148]
	ldrh	r2, [r5, #4]
	add	r2, r2, #1
	and	r2, r2, #63
	strh	r2, [r5, #4]	@ movhi
	beq	.L208
	ldrh	r2, [r5, #6]
	add	r4, r4, #1
	and	r4, r4, #63
	cmp	r2, r4
	bne	.L197
.L196:
	mov	r2, r9
	ldr	r1, .L211+4
	mov	r0, #1
	mvn	r4, #1
	bl	dprint_vfmw
.L167:
	ldr	r3, [r8, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r4
.L164:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L168:
	mov	r2, r4
	ldr	r1, .L211+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	ip, #2
	b	.L169
.L208:
	ldr	r1, [r6, #148]
	mov	r0, #12
	ldrh	r3, [r5, #6]
	str	r1, [sp, #4]
	ldrh	ip, [r5, #8]
	ldr	r1, .L211+12
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r7]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L201
.L175:
	.word	.L174
	.word	.L176
	.word	.L177
	.word	.L178
	.word	.L201
	.word	.L179
	.word	.L180
	.word	.L201
	.word	.L181
	.word	.L182
	.word	.L183
	.word	.L183
	.word	.L183
	.word	.L184
	.word	.L201
	.word	.L185
	.word	.L186
	.word	.L187
	.word	.L201
	.word	.L201
	.word	.L188
.L188:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	USERDEC_RecycleImage
	ldr	r3, [r7]
.L173:
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L189
.L191:
	.word	.L190
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L189
	.word	.L194
	.word	.L194
	.word	.L194
.L194:
	cmp	r0, #0
	mvnne	r4, #19
	moveq	r4, #1
	b	.L167
.L190:
	cmp	r0, #0
	moveq	r4, #1
	mvnne	r4, #19
	b	.L167
.L189:
	cmn	r0, #2
	beq	.L205
	cmp	r0, #1
	mvnne	r4, #19
	moveq	r4, #1
	b	.L167
.L174:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	H264DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L180:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	AVSDEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L181:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	REAL8DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L182:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	REAL9DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L183:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VP6DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L184:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VP8DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L185:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	MVC_DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L186:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	HEVC_DECRecycleImage
	ldr	r3, [r7]
	b	.L173
.L187:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VP9DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L176:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	VC1DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L177:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	MPEG4DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L178:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	MPEG2DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L179:
	ldr	r1, [r6, #148]
	add	r0, r7, #8
	bl	DIVX3DEC_RecycleImage
	ldr	r3, [r7]
	b	.L173
.L201:
	mvn	r0, #1
	b	.L173
.L209:
	ldr	r1, .L211+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L164
.L210:
	ldr	r2, .L211+20
	mov	r0, #1
	ldr	r1, .L211+24
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L164
.L205:
	mov	r4, r0
	b	.L167
.L212:
	.align	2
.L211:
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
	beq	.L233
	ldr	r3, [r0]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L232
.L217:
	.word	.L230
	.word	.L218
	.word	.L219
	.word	.L220
	.word	.L232
	.word	.L221
	.word	.L222
	.word	.L232
	.word	.L223
	.word	.L224
	.word	.L225
	.word	.L225
	.word	.L225
	.word	.L226
	.word	.L232
	.word	.L227
	.word	.L228
	.word	.L229
	.word	.L232
	.word	.L232
	.word	.L230
.L230:
	add	r4, r0, #16
.L231:
	ldr	r5, .L234
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
.L218:
	add	r4, r0, #49152
	add	r4, r4, #184
	b	.L231
.L219:
	add	r4, r0, #22528
	add	r4, r4, #104
	b	.L231
.L220:
	add	r4, r0, #88064
	add	r4, r4, #656
	b	.L231
.L221:
	add	r4, r0, #42496
	add	r4, r4, #40
	b	.L231
.L222:
	add	r4, r0, #16192
	add	r4, r4, #8
	b	.L231
.L223:
	add	r4, r0, #54784
	add	r4, r4, #80
	b	.L231
.L224:
	add	r4, r0, #54784
	add	r4, r4, #72
	b	.L231
.L225:
	add	r4, r0, #12672
	add	r4, r4, #24
	b	.L231
.L226:
	add	r4, r0, #8192
	add	r4, r4, #24
	b	.L231
.L227:
	add	r4, r0, #592
	b	.L231
.L228:
	add	r4, r0, #5504
	add	r4, r4, #56
	b	.L231
.L229:
	add	r4, r0, #274432
	add	r4, r4, #1408
	b	.L231
.L232:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L233:
	movw	r3, #955
	ldr	r2, .L234+4
	ldr	r1, .L234+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L235:
	.align	2
.L234:
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	moveq	r6, #1
	movne	r6, #0
	beq	.L242
	ldrd	r2, [r0, #32]
	sub	r1, fp, #68
	ldr	r8, [r0, #8]
	mov	r0, r5
	ldr	r7, [r4, #20]
	strd	r2, [fp, #-44]
	ldr	lr, [r4, #24]
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	ldrb	ip, [r4, #13]	@ zero_extendqisi2
	ldr	r2, [r4, #28]
	strb	r3, [fp, #-67]
	str	r8, [fp, #-64]
	str	r7, [fp, #-60]
	str	lr, [fp, #-56]
	strb	ip, [fp, #-68]
	str	r2, [fp, #-52]
	bl	H264DEC_DecodePacket
	add	r3, r5, #61440
	cmn	r0, #2
	beq	.L243
	strb	r6, [r4, #1]
	ldr	r2, .L245
	ldr	r1, [r3, #2680]
	ldr	r2, [r2, r1, asl #2]
	strb	r6, [r2, #1584]
.L240:
	ldr	r4, [r5, #360]
	cmp	r4, #0
	beq	.L244
.L236:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L242:
	movw	r3, #1058
	ldr	r2, .L245+4
	ldr	r1, .L245+8
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L243:
	mov	r2, #1
	ldr	r1, .L245
	strb	r2, [r4, #1]
	ldr	r0, [r3, #2680]
	ldr	r1, [r1, r0, asl #2]
	strb	r2, [r1, #1584]
	b	.L240
.L244:
	add	r5, r5, #12288
	ldrb	r2, [r5, #1272]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L236
	ldr	r0, [r3, #2680]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1272]
	b	.L236
.L246:
	.align	2
.L245:
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
	beq	.L257
	ldr	r6, [r0, #8]
	sub	r1, fp, #52
	ldr	lr, [r0, #20]
	mov	r0, r5
	ldr	ip, [r4, #24]
	ldrb	r2, [r4, #13]	@ zero_extendqisi2
	ldr	r3, [r4, #28]
	str	r6, [fp, #-48]
	str	lr, [fp, #-44]
	str	ip, [fp, #-36]
	strb	r2, [fp, #-52]
	str	r3, [fp, #-32]
	bl	HEVCDEC_DecodePacket
	cmn	r0, #2
	beq	.L250
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L250
	strb	r3, [r4, #1]
	ldr	r2, .L259
	ldr	r1, [r5, #252]
	ldr	r2, [r2, r1, asl #2]
	strb	r3, [r2, #1584]
.L252:
	ldr	r4, [r5, #2392]
	cmp	r4, #0
	beq	.L258
.L247:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L250:
	mov	r3, #1
	ldr	r2, .L259
	strb	r3, [r4, #1]
	ldr	r1, [r5, #252]
	ldr	r2, [r2, r1, asl #2]
	strb	r3, [r2, #1584]
	b	.L252
.L257:
	movw	r3, #1098
	ldr	r2, .L259+4
	ldr	r1, .L259+8
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L258:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L247
	ldr	r0, [r5, #252]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #9]
	b	.L247
.L260:
	.align	2
.L259:
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
	beq	.L278
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L279
	ldr	r8, .L281
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	add	r6, r5, #294912
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
	ldr	r3, [r6, #3424]
	cmp	r3, #0
	bne	.L280
.L264:
	ldr	r3, [r6, #3420]
	cmp	r3, #0
	bne	.L265
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
	ldr	r0, [r6, #3516]
	bl	SM_ReleaseStreamSeg
	ldr	r2, .L281+4
	ldr	ip, [r2]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r6, #3516]
	mov	r3, r9
	mov	r2, r9
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L280:
	ldr	r2, [r6, #3464]
	ldr	r3, [r6, #3460]
	cmp	r2, r3
	beq	.L264
.L265:
	mov	r3, #1
	strb	r3, [r4, #1]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L278:
	movw	r3, #1134
	ldr	r2, .L281+8
	ldr	r1, .L281+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L279:
	add	r5, r1, #294912
	ldr	r0, [r5, #3516]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #3516]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L282:
	.align	2
.L281:
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
	beq	.L289
	ldrd	r2, [r0, #32]
	sub	r1, fp, #60
	ldr	r7, [r0, #8]
	mov	r0, r5
	ldr	lr, [r4, #20]
	strd	r2, [fp, #-36]
	ldr	ip, [r4, #24]
	ldr	r3, [r4, #28]
	ldrb	r2, [r4, #13]	@ zero_extendqisi2
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
	beq	.L290
.L283:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L289:
	movw	r3, #1176
	ldr	r2, .L291
	ldr	r1, .L291+4
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L290:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L283
	ldr	r0, [r5, #120]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1]
	b	.L283
.L292:
	.align	2
.L291:
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
	beq	.L307
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L308
	ldr	r7, .L310
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
	bgt	.L296
	ldr	r1, .L310+4
	add	r5, r5, #49152
.L306:
	mov	r0, r6
	bl	dprint_vfmw
	ldr	r1, [r4, #108]
	ldr	r0, [r5, #528]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L310+8
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
.L296:
	add	r2, r5, #15808
	mov	r1, #16
	add	r2, r2, #24
	ldr	r0, [r4, #88]
	bl	Vc1SMPSeqHdr
	subs	r9, r0, #0
	beq	.L309
	add	r5, r5, #49152
	ldr	r1, .L310+12
	b	.L306
.L307:
	movw	r3, #1242
	ldr	r2, .L310+16
	ldr	r1, .L310+20
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L309:
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
.L308:
	add	r5, r1, #49152
	ldr	r0, [r5, #528]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #528]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L311:
	.align	2
.L310:
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
	beq	.L323
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L324
	ldr	r8, .L325
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
	ldr	r3, .L325+4
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
.L323:
	movw	r3, #1481
	ldr	r2, .L325+8
	ldr	r1, .L325+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L324:
	add	r5, r1, #53248
	ldr	r0, [r5, #1960]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #1960]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L326:
	.align	2
.L325:
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
	beq	.L338
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L339
	ldr	r8, .L340
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
	ldr	r3, .L340+4
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
.L338:
	movw	r3, #1518
	ldr	r2, .L340+8
	ldr	r1, .L340+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L339:
	add	r5, r1, #53248
	ldr	r0, [r5, #1952]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #1952]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L341:
	.align	2
.L340:
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
	beq	.L353
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L354
	ldr	r8, .L355
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
	ldr	r3, .L355+4
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
.L353:
	movw	r3, #1560
	ldr	r2, .L355+8
	ldr	r1, .L355+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L354:
	add	r5, r1, #40960
	ldr	r0, [r5, #1920]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #1920]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L356:
	.align	2
.L355:
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
	beq	.L368
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L369
	ldr	r8, .L370
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
	ldr	r3, .L370+4
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
.L368:
	movw	r3, #1602
	ldr	r2, .L370+8
	ldr	r1, .L370+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L369:
	add	r5, r1, #8192
	ldr	r0, [r5, #368]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #368]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L371:
	.align	2
.L370:
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
	beq	.L383
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L384
	ldr	r8, .L385
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
	ldr	r3, .L385+4
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
.L383:
	movw	r3, #1643
	ldr	r2, .L385+8
	ldr	r1, .L385+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L384:
	add	r5, r1, #12288
	ldr	r0, [r5, #752]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #752]
	ldr	r1, [r4, #28]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L386:
	.align	2
.L385:
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
	bhi	.L409
	cmp	r1, #0
	beq	.L390
	ldr	r0, [r1, #8]
	cmp	r0, #0
	beq	.L390
	ldr	r3, .L414
	ldr	r3, [r3, r5, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	beq	.L410
.L392:
	ldrb	r6, [r4, #13]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r4, #408]
	cmp	r6, #1
	beq	.L411
	cmp	r6, #0
	beq	.L412
.L397:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L412:
	ldr	r9, .L414+4
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
	bls	.L397
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
	ldr	r1, .L414+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L414+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L396
	mov	r0, r5
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	r7
.L396:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r4, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L410:
	ldr	r3, [r3, #1560]
	cmp	r3, #1
	bne	.L392
	ldrb	r3, [r1, #408]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L392
	mov	r2, #160
	add	r1, r1, #248
	add	r0, r4, #88
	bl	memcpy
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L411:
	ldrb	r6, [r4, #2]	@ zero_extendqisi2
	cmp	r6, r7
	beq	.L413
	cmp	r6, #1
	bne	.L397
	ldr	r2, [r4, #104]
	cmp	r2, #1024
	bge	.L398
	ldr	r8, .L414+4
	rsb	r0, r2, r0
	ldr	r1, [r4, #88]
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r4, #104]
	ldr	ip, [r4, #24]
	mov	r0, r5
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #20]
	rsb	r1, r3, r1
	strb	r6, [r4, #93]
	rsb	r2, r3, r2
	str	r1, [r4, #88]
	add	r3, r3, ip
	str	r2, [r4, #100]
	str	r3, [r4, #104]
	ldr	r1, [r4, #108]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #28]
	ldr	r3, [r8, #48]
	mov	r1, r7
	mov	r2, #80
	add	r0, r4, #168
	str	ip, [r4, #108]
	blx	r3
.L399:
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
.L413:
	ldr	r5, .L414+4
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
.L398:
	ldr	r3, .L414+4
	mov	r2, #80
	add	r1, r4, #8
	add	r0, r4, #168
	ldr	r3, [r3, #52]
	blx	r3
	b	.L399
.L409:
	movw	r3, #1775
	ldr	r2, .L414+16
	ldr	r1, .L414+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L390:
	ldr	r1, .L414+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L415:
	.align	2
.L414:
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
	beq	.L422
	add	r6, r1, #49152
	mov	r0, r1
	ldr	r7, [r6, #528]
	bl	VC1_GetPacketState
	cmp	r0, #2
	beq	.L423
.L418:
	mov	r1, r5
	ldr	r0, [r6, #528]
	bl	SegMan
	subs	r7, r0, #0
	beq	.L424
.L420:
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
.L422:
	movw	r3, #1209
	ldr	r2, .L425
	ldr	r1, .L425+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L424:
	add	r5, r5, #88
	mov	r0, r4
	mov	r1, r5
	bl	VC1DEC_Decode
	ldr	r3, .L425+8
	mov	r0, r5
	mov	r1, r7
	mov	r2, #160
	ldr	r3, [r3, #48]
	blx	r3
	b	.L420
.L423:
	ldr	r3, .L425+12
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	bne	.L419
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L418
.L419:
	add	r1, r4, #12544
	mov	r0, r4
	add	r1, r1, #32
	bl	VC1DEC_Decode
	b	.L418
.L426:
	.align	2
.L425:
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
	beq	.L432
	ldrb	r2, [r0, #13]	@ zero_extendqisi2
	mov	r0, #22
	ldr	r1, .L436
	bl	dprint_vfmw
	ldr	r2, [r4, #20]
	ldr	r1, .L436+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r4, #24]
	ldr	r1, .L436+8
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r5]
	ldr	r3, [r2, #564]
	cmp	r3, #1
	bhi	.L433
	ldr	r1, [r2, #568]
	cmp	r1, #8
	bgt	.L434
	add	r1, r5, #12288
	uxtb	r3, r3
	cmp	r3, #1
	mov	r0, r4
	strb	r3, [r1, #3544]
	ldr	r3, [r2, #568]
	strb	r3, [r1, #3546]
	mov	r1, r5
	beq	.L435
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DecodeStream_VC1_Smp
.L433:
	mov	r0, r6
	ldr	r1, .L436+12
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L432:
	movw	r3, #1293
	ldr	r2, .L436+16
	ldr	r1, .L436+20
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L434:
	mov	r0, r6
	ldr	r1, .L436+24
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L435:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DecodeStream_VC1_Adv
.L437:
	.align	2
.L436:
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
	beq	.L445
	add	r5, r1, #86016
	mov	r0, r1
	ldr	r7, [r5, #3048]
	bl	MP2_GetPacketState
	cmp	r0, #2
	beq	.L446
.L440:
	mov	r1, r6
	ldr	r0, [r5, #3048]
	bl	SegMan
	cmp	r0, #0
	beq	.L447
.L442:
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
.L445:
	movw	r3, #1333
	ldr	r2, .L448
	ldr	r1, .L448+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L447:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG2DEC_Decode
	ldrb	r3, [r5, #3065]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r6, #1]
	b	.L442
.L446:
	ldr	r3, .L448+8
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	bne	.L441
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L440
.L441:
	add	r1, r4, #88064
	mov	r0, r4
	add	r1, r1, #80
	bl	MPEG2DEC_Decode
	b	.L440
.L449:
	.align	2
.L448:
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
	beq	.L456
	add	r5, r1, #20480
	mov	r0, r1
	ldr	r7, [r5, #2496]
	bl	MP4_GetPacketState
	cmp	r0, #3
	beq	.L457
.L452:
	mov	r1, r6
	ldr	r0, [r5, #2496]
	bl	SegMan
	cmp	r0, #0
	beq	.L458
.L454:
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
.L456:
	movw	r3, #1378
	ldr	r2, .L459
	ldr	r1, .L459+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L458:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG4DEC_Decode
	b	.L454
.L457:
	ldr	r3, .L459+8
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	bne	.L453
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L452
.L453:
	add	r1, r4, #15680
	mov	r0, r4
	add	r1, r1, #32
	bl	MPEG4DEC_Decode
	b	.L452
.L460:
	.align	2
.L459:
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
	beq	.L467
	mov	r0, r1
	ldr	r6, [r1, #4]
	bl	AVS_GetPacketState
	cmp	r0, #0
	bne	.L463
	ldr	r3, .L470
	ldr	r3, [r3, r6, asl #2]
	ldr	r2, [r3, #1504]
	cmp	r2, #1
	beq	.L468
.L464:
	add	r1, r4, #16384
	mov	r0, r4
	add	r1, r1, #168
	bl	AVSDEC_Decode
.L463:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	SegMan
	cmp	r0, #0
	beq	.L469
.L465:
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
.L467:
	movw	r3, #1414
	ldr	r2, .L470+4
	ldr	r1, .L470+8
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L469:
	add	r1, r5, #88
	mov	r0, r4
	bl	AVSDEC_Decode
	b	.L465
.L468:
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	bne	.L463
	b	.L464
.L471:
	.align	2
.L470:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+464
	.word	.LC0
	UNWIND(.fnend)
	.size	DecodeStream_AVS, .-DecodeStream_AVS
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
	beq	.L490
	mov	r0, #6
	bl	VCTRL_RecordPosTime
	cmp	r4, #17
	ldrls	pc, [pc, r4, asl #2]
	b	.L474
.L476:
	.word	.L475
	.word	.L477
	.word	.L478
	.word	.L479
	.word	.L474
	.word	.L480
	.word	.L481
	.word	.L474
	.word	.L482
	.word	.L483
	.word	.L484
	.word	.L484
	.word	.L484
	.word	.L485
	.word	.L474
	.word	.L486
	.word	.L487
	.word	.L488
.L490:
	movw	r3, #1683
	ldr	r2, .L491
	ldr	r1, .L491+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L488:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP9
.L489:
	mov	r0, #7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L487:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_HEVC
	b	.L489
.L486:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MVC
	b	.L489
.L485:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP8
	b	.L489
.L484:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP6x
	b	.L489
.L483:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_REAL9
	b	.L489
.L482:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_REAL8
	b	.L489
.L481:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_AVS
	b	.L489
.L480:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_DIVX3
	b	.L489
.L479:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG2
	b	.L489
.L478:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG4
	b	.L489
.L477:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VC1
	b	.L489
.L475:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_H264
	b	.L489
.L474:
	movw	r3, #1763
	ldr	r2, .L491
	ldr	r1, .L491+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L489
.L492:
	.align	2
.L491:
	.word	.LANCHOR0+484
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
	beq	.L518
	sub	r3, r0, #5
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L495
.L497:
	.word	.L496
	.word	.L495
	.word	.L495
	.word	.L498
	.word	.L499
	.word	.L500
	.word	.L500
	.word	.L500
	.word	.L501
	.word	.L495
	.word	.L495
	.word	.L495
	.word	.L502
.L502:
	ldr	r4, [r1]
	add	r1, r1, #294912
	ldr	r0, [r1, #3516]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L508
	ldr	r1, .L519
	mov	r0, #1
	bl	dprint_vfmw
.L508:
	ldr	r3, .L519+4
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L496:
	ldr	r4, [r1]
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L508
	add	r3, r1, #40960
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1920]
	bl	SM_ReleaseStreamSeg
	b	.L508
.L498:
	ldr	r4, [r1]
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L508
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1960]
	bl	SM_ReleaseStreamSeg
	b	.L508
.L499:
	ldr	r4, [r1]
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L508
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1952]
	bl	SM_ReleaseStreamSeg
	b	.L508
.L500:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #752]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L508
	ldr	r1, .L519+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L508
.L501:
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #368]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L508
	ldr	r1, .L519+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L508
.L495:
	mov	r2, r0
	ldr	r1, .L519+16
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L518:
	movw	r3, #1862
	ldr	r2, .L519+20
	ldr	r1, .L519+24
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L520:
	.align	2
.L519:
	.word	.LC29
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC28
	.word	.LC27
	.word	.LC30
	.word	.LANCHOR0+500
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
	beq	.L540
	sub	r0, r0, #10
	cmp	r0, #7
	ldrls	pc, [pc, r0, asl #2]
	b	.L521
.L525:
	.word	.L524
	.word	.L524
	.word	.L524
	.word	.L526
	.word	.L521
	.word	.L521
	.word	.L521
	.word	.L527
.L527:
	ldr	r4, [r1]
	add	r1, r1, #294912
	ldr	r0, [r1, #3516]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L530
	ldr	r1, .L541
	mov	r0, #1
	bl	dprint_vfmw
.L530:
	ldr	r3, .L541+4
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L526:
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #368]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L530
	ldr	r1, .L541+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L530
.L524:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #752]
	ldr	r1, [r4, #252]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L530
	ldr	r1, .L541+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L530
.L521:
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L540:
	movw	r3, #1972
	ldr	r2, .L541+16
	ldr	r1, .L541+20
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L542:
	.align	2
.L541:
	.word	.LC29
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LC28
	.word	.LANCHOR0+516
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
	beq	.L552
	cmp	r0, #8
	beq	.L546
	cmp	r0, #9
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r4, [r1]
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L553
.L549:
	ldr	r3, .L554
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L546:
	ldr	r4, [r1]
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L549
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1960]
	bl	SM_ReleaseStreamSeg
	b	.L549
.L552:
	movw	r3, #2029
	ldr	r2, .L554+4
	ldr	r1, .L554+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L553:
	add	r3, r1, #53248
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1952]
	bl	SM_ReleaseStreamSeg
	b	.L549
.L555:
	.align	2
.L554:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+536
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
	beq	.L559
	ldr	r4, [r1]
	ldrb	r3, [r4, #237]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L560
.L558:
	ldr	r3, .L561
	add	r0, r4, #232
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L560:
	add	r3, r1, #40960
	ldr	r1, [r4, #252]
	ldr	r0, [r3, #1920]
	bl	SM_ReleaseStreamSeg
	b	.L558
.L559:
	movw	r3, #2071
	ldr	r2, .L561+4
	ldr	r1, .L561+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L562:
	.align	2
.L561:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+556
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
	beq	.L580
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L565
.L567:
	.word	.L566
	.word	.L568
	.word	.L569
	.word	.L570
	.word	.L565
	.word	.L571
	.word	.L572
	.word	.L565
	.word	.L573
	.word	.L574
	.word	.L575
	.word	.L575
	.word	.L575
	.word	.L576
	.word	.L565
	.word	.L577
	.word	.L578
	.word	.L579
.L579:
	mov	r0, #17
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L566:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_ClearCurrPic
.L568:
	add	r3, r1, #49152
	add	r0, r1, #12736
	ldr	r1, [r3, #528]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1_ClearCurPic
.L569:
	mov	r0, r1
	str	r1, [fp, #-16]
	bl	MP4_ClearCurPic
	ldr	r1, [fp, #-16]
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP4_Clean_HeadPacket
.L570:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_ClearCurPic
.L571:
	mov	r0, #5
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_DIVX3
.L572:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS_ClearCurPic
.L573:
	mov	r0, #8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_Realx
.L574:
	mov	r0, #9
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_Realx
.L575:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L576:
	mov	r0, #13
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L577:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_ClearCurrPic
.L578:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_ClearCurrPic
.L565:
	mov	r2, r0
	ldr	r1, .L581
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L580:
	movw	r3, #2087
	ldr	r2, .L581+4
	ldr	r1, .L581+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L582:
	.align	2
.L581:
	.word	.LC30
	.word	.LANCHOR0+576
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
	beq	.L634
	cmp	r2, #2
	ldr	r1, [r3]
	movne	r3, ip
	beq	.L635
.L586:
	ldrb	ip, [r1]	@ zero_extendqisi2
	ldrb	r4, [r1, #1]	@ zero_extendqisi2
	cmp	ip, #0
	ldrb	r5, [r1, #2]	@ zero_extendqisi2
	bne	.L589
	cmp	r4, #0
	beq	.L636
.L589:
	str	r5, [sp]
	mov	r3, r4
	mov	r2, ip
	ldr	r1, .L638
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
.L629:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L636:
	cmp	r5, #1
	bne	.L589
	cmp	r2, #16
	ldrls	pc, [pc, r2, asl #2]
	b	.L609
.L593:
	.word	.L592
	.word	.L594
	.word	.L595
	.word	.L596
	.word	.L609
	.word	.L609
	.word	.L597
	.word	.L609
	.word	.L609
	.word	.L609
	.word	.L609
	.word	.L609
	.word	.L609
	.word	.L609
	.word	.L609
	.word	.L598
	.word	.L599
.L635:
	ldrb	ip, [r6, #72]	@ zero_extendqisi2
	ands	r3, ip, #1
	beq	.L586
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
	beq	.L603
.L607:
	ldr	r2, [lr]
	cmp	r2, #0
	beq	.L603
	b	.L602
.L599:
	mov	r0, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	HEVC_IsNewPicNal
.L592:
	mov	r0, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	H264_IsNewPicNal
.L594:
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	sub	r3, r2, #12
	cmp	r2, #10
	cmpne	r3, #3
	bhi	.L621
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L621
	mov	r2, #1
	str	r2, [lr]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
.L606:
	cmp	r2, #13
	mov	r0, r3
	bne	.L629
.L631:
	mov	r3, #0
	str	r3, [lr]
	b	.L629
.L595:
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
	bne	.L607
.L602:
	cmp	r3, #1
	bne	.L615
.L603:
	mov	r3, #1
	str	r3, [lr]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	mov	r0, #0
.L604:
	cmp	ip, #182
	bne	.L629
	b	.L631
.L597:
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
	beq	.L618
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L618
	mov	r2, #1
	str	r2, [lr]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	mov	r0, r3
	sub	ip, r2, #179
	clz	ip, ip
	mov	ip, ip, lsr #5
.L605:
	cmp	r2, #182
	movne	r2, ip
	orreq	r2, ip, #1
	cmp	r2, #0
	bne	.L631
	b	.L629
.L598:
	mov	r0, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	MVC_IsNewPicNal
.L596:
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
	bne	.L637
	ldr	r3, .L638+4
	mvn	r5, #0
	mvn	r4, #0
	ldr	r0, [r3, r0, asl #2]
	add	r0, r0, #688
	ldrd	r2, [r0, #-8]
	cmp	r3, r5
	cmpeq	r2, r4
	bne	.L613
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L613
	sub	r3, ip, #1
	uxtb	r3, r3
	cmp	r3, #174
	bhi	.L613
	ldrd	r4, [r6, #24]
	mvn	r3, #0
	strd	r4, [r0, #-8]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
.L601:
	cmp	ip, #0
	streq	ip, [lr]
	moveq	r0, r3
	movne	r0, r3
	b	.L629
.L609:
	mvn	r0, #0
	b	.L629
.L637:
	ldr	r0, [lr]
	cmp	r0, #0
	bne	.L613
	mov	r2, #1
	mov	r3, r0
	str	r2, [lr]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	b	.L601
.L613:
	mvn	r3, #0
	b	.L601
.L634:
	movw	r3, #2363
	ldr	r2, .L638+8
	ldr	r1, .L638+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L629
.L621:
	mvn	r3, #0
	b	.L606
.L618:
	mvn	r0, #0
	b	.L605
.L615:
	mvn	r0, #0
	b	.L604
.L639:
	.align	2
.L638:
	.word	.LC31
	.word	s_pstVfmwChan
	.word	.LANCHOR0+592
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
	bhi	.L646
	ldr	r3, .L647
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #128]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L647+4
	ldr	r3, [r3, #220]
	blx	r3
	mov	r3, #0
	str	r3, [r4, #128]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L646:
	movw	r3, #2421
	ldr	r2, .L647+8
	ldr	r1, .L647+12
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L648:
	.align	2
.L647:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+604
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
	bhi	.L655
	ldr	r3, .L656
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #128]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #128]
	ldmfd	sp, {fp, sp, pc}
.L655:
	movw	r3, #2453
	ldr	r2, .L656+4
	ldr	r1, .L656+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L657:
	.align	2
.L656:
	.word	.LANCHOR1
	.word	.LANCHOR0+620
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
	bhi	.L664
	ldr	r3, .L665
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #128]
	cmp	r0, #0
	beq	.L662
	add	r1, r0, #203776
	mov	ip, #0
	add	r1, r1, #512
	mov	r3, r0
	mov	r2, ip
	str	ip, [r0]
.L661:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L661
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L664:
	movw	r3, #2471
	ldr	r2, .L665+4
	ldr	r1, .L665+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L662:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L666:
	.align	2
.L665:
	.word	.LANCHOR1
	.word	.LANCHOR0+644
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
	bhi	.L672
	ldr	r4, .L674
	add	r4, r4, r0, lsl #2
	ldr	r3, [r4, #128]
	cmp	r3, #0
	beq	.L673
.L670:
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	InitUsdPool
.L673:
	ldr	r3, .L674+4
	movw	r0, #7688
	movt	r0, 3
	ldr	r3, [r3, #216]
	blx	r3
	str	r0, [r4, #128]
	b	.L670
.L672:
	movw	r3, #2406
	ldr	r2, .L674+8
	ldr	r1, .L674+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L675:
	.align	2
.L674:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+656
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
	bhi	.L681
	cmp	r1, #0
	beq	.L682
	ldr	r3, .L683
	add	r3, r3, r0, lsl #2
	ldr	r2, [r3, #128]
	cmp	r2, #0
	streq	r1, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	InitUsdPool
.L681:
	movw	r3, #2438
	ldr	r2, .L683+4
	ldr	r1, .L683+8
	mov	r0, #1
	bl	dprint_vfmw
.L678:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L682:
	movw	r3, #2439
	ldr	r2, .L683+4
	ldr	r1, .L683+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L678
.L684:
	.align	2
.L683:
	.word	.LANCHOR1
	.word	.LANCHOR0+668
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
	bhi	.L693
	ldr	r3, .L694
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #128]
	cmp	ip, #0
	beq	.L692
	mov	r3, ip
	mov	r2, #0
	b	.L689
.L688:
	add	r2, r2, #1
	add	r3, r3, #1056
	cmp	r2, #192
	add	r3, r3, #8
	beq	.L692
.L689:
	ldr	r1, [r3, #1048]
	cmp	r1, #0
	bne	.L688
	ldr	r1, [r3, #1044]
	cmp	r1, #0
	bne	.L688
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
.L693:
	movw	r3, #2501
	ldr	r2, .L694+4
	ldr	r1, .L694+8
	mov	r0, #1
	bl	dprint_vfmw
.L692:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L695:
	.align	2
.L694:
	.word	.LANCHOR1
	.word	.LANCHOR0+688
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
	ldr	r2, .L703
	ldr	r1, .L703+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L704:
	.align	2
.L703:
	.word	.LANCHOR0+696
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
	ldr	r2, .L707
	ldr	r1, .L707+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L708:
	.align	2
.L707:
	.word	.LANCHOR0+712
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
	beq	.L721
	cmp	r1, #0
	beq	.L722
	ldrh	r3, [r0, #4]
	ldrh	lr, [r0, #8]
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L715
.L714:
	add	r2, r0, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L713
	ldr	ip, [r2, #148]
	ldr	r2, [r1, #148]
	cmp	ip, r2
	beq	.L716
.L713:
	cmp	r3, lr
	bne	.L714
.L715:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L716:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L722:
	mov	r0, r1
	ldr	r1, .L723
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L721:
	movw	r3, #2566
	ldr	r2, .L723+4
	ldr	r1, .L723+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L724:
	.align	2
.L723:
	.word	.LC5
	.word	.LANCHOR0+728
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
	beq	.L729
	ldrh	r0, [r4, #8]
	ldrh	r3, [r4, #6]
	cmp	r0, r3
	ldreqh	r3, [r4, #4]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L729:
	ldr	r2, .L730
	ldr	r1, .L730+4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L731:
	.align	2
.L730:
	.word	.LANCHOR0+748
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
	beq	.L743
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L734
.L736:
	.word	.L735
	.word	.L737
	.word	.L738
	.word	.L739
	.word	.L740
	.word	.L741
.L741:
	mov	r1, #0
	mov	r2, #2
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L735:
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L737:
	mov	r1, #4
	mov	r2, #3
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L738:
	mov	r1, #16
	mov	r2, #9
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L739:
	mov	r1, #221
	mov	r2, #100
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L740:
	mov	r1, #235
	mov	r2, #100
	str	r1, [r3, #100]
	str	r2, [r3, #104]
	ldmfd	sp, {fp, sp, pc}
.L734:
	mov	r0, #1
	mov	r2, r1
	mov	ip, #0
	str	r0, [r3, #104]
	ldr	r1, .L744
	str	ip, [r3, #100]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L743:
	movw	r3, #2614
	ldr	r2, .L744+4
	ldr	r1, .L744+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L745:
	.align	2
.L744:
	.word	.LC33
	.word	.LANCHOR0+764
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
	beq	.L750
	ldr	r0, [r0, #296]
	cmp	r0, #1
	mvnls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L750:
	movw	r3, #2662
	ldr	r2, .L751
	ldr	r1, .L751+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L752:
	.align	2
.L751:
	.word	.LANCHOR0+780
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
	beq	.L761
	ldr	r3, [r4, #308]
	cmp	r3, #1
	beq	.L758
	ldr	r2, [r4, #312]
	cmp	r2, #1
	beq	.L758
	cmp	r3, #2
	ldr	r0, [r4, #316]
	moveq	r3, #1
	subne	r3, r0, #1
	clzne	r3, r3
	movne	r3, r3, lsr #5
.L756:
	cmp	r0, #1
	movne	r0, r3
	orreq	r0, r3, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L758:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L761:
	movw	r3, #2677
	ldr	r2, .L762
	ldr	r1, .L762+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L763:
	.align	2
.L762:
	.word	.LANCHOR0+800
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
	bhi	.L768
	ldr	r1, .L770
	ldr	r1, [r1, r0, asl #2]
	ldr	r1, [r1, #128]
	cmp	r1, #0
	ldrd	r0, [fp, #4]
	bne	.L769
	subs	r0, r2, r0
	sbc	r1, r3, r1
	cmp	r1, #0
	cmpeq	r0, #1000
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L769:
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
.L768:
	movw	r3, #2702
	ldr	r2, .L770+4
	ldr	r1, .L770+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L771:
	.align	2
.L770:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+816
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
	.type	__func__.14355, %object
	.size	__func__.14355, 13
__func__.14355:
	.ascii	"PrintVoQueue\000"
	.space	3
	.type	__func__.14361, %object
	.size	__func__.14361, 13
__func__.14361:
	.ascii	"ResetVoQueue\000"
	.space	3
	.type	__func__.14367, %object
	.size	__func__.14367, 20
__func__.14367:
	.ascii	"ReturnImageToSyntax\000"
	.type	__func__.14431, %object
	.size	__func__.14431, 19
__func__.14431:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__FUNCTION__.14434, %object
	.size	__FUNCTION__.14434, 19
__FUNCTION__.14434:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__func__.14442, %object
	.size	__func__.14442, 15
__func__.14442:
	.ascii	"GetQueueImgNum\000"
	.space	1
	.type	__func__.14471, %object
	.size	__func__.14471, 20
__func__.14471:
	.ascii	"SYNTAX_ReceiveImage\000"
	.type	__func__.14517, %object
	.size	__func__.14517, 20
__func__.14517:
	.ascii	"SYNTAX_ReleaseImage\000"
	.type	__func__.14526, %object
	.size	__func__.14526, 19
__func__.14526:
	.ascii	"SYNTAX_ReturnImage\000"
	.space	1
	.type	__func__.14551, %object
	.size	__func__.14551, 18
__func__.14551:
	.ascii	"DecodeStream_H264\000"
	.space	2
	.type	__func__.14558, %object
	.size	__func__.14558, 18
__func__.14558:
	.ascii	"DecodeStream_HEVC\000"
	.space	2
	.type	__func__.14563, %object
	.size	__func__.14563, 17
__func__.14563:
	.ascii	"DecodeStream_VP9\000"
	.space	3
	.type	__func__.14570, %object
	.size	__func__.14570, 17
__func__.14570:
	.ascii	"DecodeStream_MVC\000"
	.space	3
	.type	__func__.14583, %object
	.size	__func__.14583, 21
__func__.14583:
	.ascii	"DecodeStream_VC1_Smp\000"
	.space	3
	.type	__func__.14615, %object
	.size	__func__.14615, 19
__func__.14615:
	.ascii	"DecodeStream_REAL8\000"
	.space	1
	.type	__func__.14621, %object
	.size	__func__.14621, 19
__func__.14621:
	.ascii	"DecodeStream_REAL9\000"
	.space	1
	.type	__func__.14627, %object
	.size	__func__.14627, 19
__func__.14627:
	.ascii	"DecodeStream_DIVX3\000"
	.space	1
	.type	__func__.14633, %object
	.size	__func__.14633, 17
__func__.14633:
	.ascii	"DecodeStream_VP8\000"
	.space	3
	.type	__func__.14639, %object
	.size	__func__.14639, 18
__func__.14639:
	.ascii	"DecodeStream_VP6x\000"
	.space	2
	.type	__func__.14668, %object
	.size	__func__.14668, 7
__func__.14668:
	.ascii	"SegMan\000"
	.space	1
	.type	__func__.14577, %object
	.size	__func__.14577, 21
__func__.14577:
	.ascii	"DecodeStream_VC1_Adv\000"
	.space	3
	.type	__func__.14588, %object
	.size	__func__.14588, 17
__func__.14588:
	.ascii	"DecodeStream_VC1\000"
	.space	3
	.type	__func__.14595, %object
	.size	__func__.14595, 19
__func__.14595:
	.ascii	"DecodeStream_MPEG2\000"
	.space	1
	.type	__func__.14602, %object
	.size	__func__.14602, 19
__func__.14602:
	.ascii	"DecodeStream_MPEG4\000"
	.space	1
	.type	__func__.14609, %object
	.size	__func__.14609, 17
__func__.14609:
	.ascii	"DecodeStream_AVS\000"
	.space	3
	.type	__func__.14645, %object
	.size	__func__.14645, 13
__func__.14645:
	.ascii	"DecodeStream\000"
	.space	3
	.type	__func__.14674, %object
	.size	__func__.14674, 14
__func__.14674:
	.ascii	"ReleasePacket\000"
	.space	2
	.type	__func__.14690, %object
	.size	__func__.14690, 18
__func__.14690:
	.ascii	"ReleaseCurPic_VPx\000"
	.space	2
	.type	__func__.14703, %object
	.size	__func__.14703, 20
__func__.14703:
	.ascii	"ReleaseCurPic_Realx\000"
	.type	__func__.14713, %object
	.size	__func__.14713, 20
__func__.14713:
	.ascii	"ReleaseCurPic_DIVX3\000"
	.type	__func__.14718, %object
	.size	__func__.14718, 14
__func__.14718:
	.ascii	"ReleaseCurPic\000"
	.space	2
	.type	__func__.14790, %object
	.size	__func__.14790, 12
__func__.14790:
	.ascii	"IsNewpicSeg\000"
	.type	__func__.14800, %object
	.size	__func__.14800, 13
__func__.14800:
	.ascii	"CloseUsdPool\000"
	.space	3
	.type	__func__.14810, %object
	.size	__func__.14810, 21
__func__.14810:
	.ascii	"CloseUsdPool_WithMem\000"
	.space	3
	.type	__func__.14816, %object
	.size	__func__.14816, 12
__func__.14816:
	.ascii	"InitUsdPool\000"
	.type	__func__.14796, %object
	.size	__func__.14796, 12
__func__.14796:
	.ascii	"OpenUsdPool\000"
	.type	__func__.14806, %object
	.size	__func__.14806, 20
__func__.14806:
	.ascii	"OpenUsdPool_WithMem\000"
	.type	__func__.14826, %object
	.size	__func__.14826, 7
__func__.14826:
	.ascii	"GetUsd\000"
	.space	1
	.type	__func__.14838, %object
	.size	__func__.14838, 13
__func__.14838:
	.ascii	"MarkUsdByDnr\000"
	.space	3
	.type	__func__.14843, %object
	.size	__func__.14843, 15
__func__.14843:
	.ascii	"UnMarkUsdByDnr\000"
	.space	1
	.type	__func__.14849, %object
	.size	__func__.14849, 17
__func__.14849:
	.ascii	"IsImageInVoQueue\000"
	.space	3
	.type	__func__.14855, %object
	.size	__func__.14855, 15
__func__.14855:
	.ascii	"IsVoQueueEmpty\000"
	.space	1
	.type	__func__.14860, %object
	.size	__func__.14860, 15
__func__.14860:
	.ascii	"SetAspectRatio\000"
	.space	1
	.type	__func__.14873, %object
	.size	__func__.14873, 17
__func__.14873:
	.ascii	"GetVoLastImageID\000"
	.space	3
	.type	__func__.14878, %object
	.size	__func__.14878, 16
__func__.14878:
	.ascii	"IsMain10Profile\000"
	.type	__func__.14885, %object
	.size	__func__.14885, 12
__func__.14885:
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
	.type	last_rec_pos_time.14430, %object
	.size	last_rec_pos_time.14430, 128
last_rec_pos_time.14430:
	.space	128
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 128
pstVdecUsdPool:
	.space	128
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
