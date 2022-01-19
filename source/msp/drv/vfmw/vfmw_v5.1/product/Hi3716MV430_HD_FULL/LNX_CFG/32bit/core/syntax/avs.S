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
	.file	"avs.c"
	.text
	.align	2
	.global	avs_u_v
	.type	avs_u_v, %function
avs_u_v:
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
	mov	r5, r2
	mov	r6, r1
	bl	BsGet
	str	r6, [sp, #4]
	mov	r3, r5
	mov	r1, #167
	ldr	r2, .L2
	mov	r4, r0
	str	r0, [sp]
	mov	r0, #8
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	.LC0
	UNWIND(.fnend)
	.size	avs_u_v, .-avs_u_v
	.align	2
	.global	avs_f_v
	.type	avs_f_v, %function
avs_f_v:
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
	mov	r5, r2
	mov	r6, r1
	bl	BsGet
	str	r6, [sp, #4]
	mov	r3, r5
	mov	r1, #177
	ldr	r2, .L5
	mov	r4, r0
	str	r0, [sp]
	mov	r0, #8
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	UNWIND(.fnend)
	.size	avs_f_v, .-avs_f_v
	.align	2
	.global	avs_ue_v
	.type	avs_ue_v, %function
avs_ue_v:
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
	mov	r6, r1
	mov	r1, #32
	mov	r7, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	mov	r4, r0
	mvnhi	r5, #0
	movhi	r4, #32
	bls	.L11
.L8:
	str	r4, [sp, #4]
	mov	r3, r6
	str	r5, [sp]
	mov	r1, #204
	ldr	r2, .L12
	mov	r0, #8
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L11:
	add	r5, r4, #1
	mov	r1, r4
	mov	r0, r7
	mov	r4, r4, asl #1
	bl	BsSkip
	mov	r1, r5
	mov	r0, r7
	add	r4, r4, #1
	bl	BsShow
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r7
	bl	BsSkip
	b	.L8
.L13:
	.align	2
.L12:
	.word	.LC0
	UNWIND(.fnend)
	.size	avs_ue_v, .-avs_ue_v
	.align	2
	.global	avs_se_v
	.type	avs_se_v, %function
avs_se_v:
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
	mov	r6, r1
	mov	r1, #32
	mov	r7, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	mov	r4, r0
	mvnhi	r5, #-2147483648
	movhi	r4, #32
	bls	.L19
.L15:
	str	r4, [sp, #4]
	mov	r3, r6
	str	r5, [sp]
	mov	r1, #235
	ldr	r2, .L20
	mov	r0, #8
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L19:
	add	r8, r4, #1
	mov	r1, r4
	mov	r0, r7
	mov	r4, r4, asl #1
	bl	BsSkip
	mov	r1, r8
	mov	r0, r7
	add	r4, r4, #1
	bl	BsShow
	mov	r1, r8
	sub	r0, r0, #1
	tst	r0, #1
	mov	r0, r0, asr #1
	addne	r5, r0, #1
	rsbeq	r5, r0, #0
	mov	r0, r7
	bl	BsSkip
	b	.L15
.L21:
	.align	2
.L20:
	.word	.LC0
	UNWIND(.fnend)
	.size	avs_se_v, .-avs_se_v
	.align	2
	.global	AVS_next_start_code
	.type	AVS_next_start_code, %function
AVS_next_start_code:
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
	bl	BsToNextByte
	mov	r0, r5
	bl	BsResidBits
	add	r6, r0, #7
	cmp	r0, #0
	movlt	r0, r6
	mov	r6, r0, asr #3
	cmp	r6, #3
	subgt	r6, r6, #3
	movgt	r4, #0
	bgt	.L25
	b	.L26
.L31:
	bl	BsSkip
	cmp	r4, r6
	beq	.L26
.L25:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	bne	.L31
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L26:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_next_start_code, .-AVS_next_start_code
	.align	2
	.global	AVS_sequence_header
	.type	AVS_sequence_header, %function
AVS_sequence_header:
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
	add	r6, r0, #12288
	mov	r4, r1
	ldr	r2, .L48
	ldr	r5, [r6, #3124]
	mov	r1, #32
	ldr	r3, [r6, #2732]
	mov	r7, r0
	bic	r3, r3, #65536
	mov	r0, r5
	str	r3, [r6, #2732]
	bl	avs_f_v
	ldr	r2, .L48+4
	mov	r1, #8
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+8
	mov	r1, #8
	str	r0, [r4, #16]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+12
	mov	r1, #1
	str	r0, [r4, #20]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+16
	mov	r1, #14
	strb	r0, [r4, #15]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+20
	mov	r1, #14
	str	r0, [r4, #24]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+24
	mov	r1, #2
	str	r0, [r4, #28]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+28
	mov	r1, #3
	strb	r0, [r4, #11]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+32
	mov	r1, #4
	strb	r0, [r4, #12]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+36
	mov	r1, #4
	strb	r0, [r4, #13]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+40
	mov	r1, #18
	strb	r0, [r4, #14]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+44
	mov	r1, #1
	str	r0, [r4, #32]
	mov	r0, r5
	bl	avs_f_v
	ldr	r2, .L48+48
	mov	r1, #12
	strb	r0, [r4, #10]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+52
	mov	r1, #1
	str	r0, [r4, #36]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+44
	mov	r1, #1
	strb	r0, [r4, #9]
	mov	r0, r5
	bl	avs_f_v
	ldr	r2, .L48+56
	mov	r1, #18
	strb	r0, [r4, #10]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L48+60
	mov	r1, #3
	str	r0, [r4, #40]
	mov	r0, r5
	bl	avs_u_v
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	cmp	r3, #1920
	strb	r0, [r4, #8]
	bhi	.L34
	cmp	r2, #1088
	bhi	.L34
	ldrb	r1, [r4, #14]	@ zero_extendqisi2
	cmp	r1, #15
	ldrls	r0, .L48+64
	mvnhi	r1, #0
	addls	r1, r0, r1, lsl #2
	ldrls	r1, [r1, #20]
	str	r1, [r4, #44]
	ldr	r1, [r6, #2772]
	cmp	r3, r1
	beq	.L46
.L39:
	ldr	r3, [r7, #4]
	mov	r8, #100
	ldr	r5, .L48+68
	mla	r3, r8, r3, r5
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L47
.L41:
	ldr	r3, .L48+72
	mov	r1, #1
	str	r1, [r6, #2744]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L40
	ldr	ip, [r6, #2772]
	mov	r3, #8
	ldr	r2, [r4, #24]
	ldr	lr, [r6, #2776]
	strh	ip, [fp, #-44]	@ movhi
	ldr	ip, [r4, #28]
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	ldr	r0, [r7, #4]
	strh	lr, [fp, #-42]	@ movhi
	strh	ip, [fp, #-38]	@ movhi
	blx	r5
.L40:
	add	r0, r6, #2736
	mov	r1, r4
	mov	r2, #376
	add	r0, r0, #12
	bl	memcpy
	ldr	r2, [r6, #2740]
	ldr	r3, [r6, #2732]
	mov	r1, #1
	mov	r0, r1
	add	r2, r2, r1
	orr	r3, r3, #65536
	str	r2, [r6, #2740]
	str	r3, [r6, #2732]
	str	r1, [r6, #2736]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L34:
	str	r2, [sp, #4]
	mov	r1, #516
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L48+64
	ldr	r2, .L48+76
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L46:
	ldr	r3, [r6, #2776]
	cmp	r2, r3
	bne	.L39
	b	.L40
.L47:
	ldr	r2, .L48+80
	mov	r1, #1
	str	r1, [r3, #64]
	ldr	r9, [r7, #4]
	ldr	r3, [r2]
	blx	r3
	mla	r5, r8, r9, r5
	str	r0, [r5, #68]
	b	.L41
.L49:
	.align	2
.L48:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LANCHOR0
	.word	g_VfmwChanStat
	.word	g_EventReportFunc
	.word	.LC17
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	AVS_sequence_header, .-AVS_sequence_header
	.align	2
	.global	AVS_i_picture_header
	.type	AVS_i_picture_header, %function
AVS_i_picture_header:
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
	ldr	r3, .L89
	mov	r6, r0
	ldr	r5, [r0, #496]
	mov	r4, r1
	add	r0, r1, #80
	mov	r2, #272
	ldr	r3, [r3, #48]
	mov	r1, #0
	blx	r3
	ldr	r3, [r6, #104]
	ldr	r2, .L89+4
	mov	r1, #32
	bic	r3, r3, #262144
	mov	r0, r5
	str	r3, [r6, #104]
	bl	avs_f_v
	mov	r0, r5
	ldr	r2, .L89+8
	mov	r1, #16
	bl	avs_u_v
	ldr	r3, [r4, #16]
	cmp	r3, #72
	str	r0, [r4, #96]
	beq	.L81
.L51:
	ldr	r2, .L89+12
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	uxtb	r0, r0
	strb	r0, [r4, #90]
	cmp	r0, #1
	beq	.L82
.L52:
	ldr	r2, .L89+16
	mov	r1, #1
	mov	r0, r5
	bl	avs_f_v
	ldr	r2, .L89+20
	mov	r1, #8
	str	r0, [r4, #108]
	mov	r0, r5
	bl	avs_u_v
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, #1
	str	r0, [r4, #112]
	beq	.L83
.L53:
	ldr	r2, .L89+24
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #1
	uxtb	r0, r0
	strb	r0, [r4, #80]
	streqb	r3, [r4, #80]
	beq	.L55
	cmp	r0, #0
	beq	.L84
.L55:
	mov	r3, #1
	strb	r3, [r4, #81]
.L56:
	ldr	r2, .L89+28
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L89+32
	mov	r1, #1
	strb	r0, [r4, #82]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L89+36
	mov	r1, #1
	strb	r0, [r4, #83]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L89+40
	mov	r1, #6
	strb	r0, [r4, #84]
	mov	r0, r5
	bl	avs_u_v
	ldrh	r3, [r4, #80]
	cmp	r3, #0
	strb	r0, [r4, #85]
	beq	.L85
.L57:
	ldr	r2, .L89+44
	mov	r1, #4
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L89+48
	mov	r1, #1
	strb	r0, [r4, #87]
	mov	r0, r5
	bl	avs_u_v
	mov	r3, #0
	str	r3, [r4, #120]
	str	r3, [r4, #124]
	uxtb	r0, r0
	strb	r0, [r4, #88]
	cmp	r0, r3
	beq	.L86
.L59:
	ldr	r3, [r4, #16]
	cmp	r3, #72
	beq	.L87
.L61:
	mov	r0, #1
	mov	r3, #0
	strb	r0, [r4, #93]
	str	r3, [r4, #348]
	ldr	r3, [r6, #104]
	orr	r3, r3, #262144
	str	r3, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L84:
	ldr	r2, .L89+52
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	strb	r0, [r4, #81]
	b	.L56
.L86:
	ldr	r2, .L89+56
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	uxtb	r0, r0
	strb	r0, [r4, #89]
	cmp	r0, #0
	beq	.L59
	ldr	r1, .L89+60
	mov	r0, r5
	bl	avs_se_v
	ldr	r1, .L89+64
	str	r0, [r4, #120]
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r4, #124]
	b	.L59
.L85:
	ldr	r2, .L89+68
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	strb	r0, [r4, #86]
	b	.L57
.L87:
	ldr	r2, .L89+72
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	cmp	r0, #0
	str	r0, [r4, #128]
	bne	.L62
.L71:
	mov	r0, r5
	ldr	r2, .L89+76
	mov	r1, #1
	bl	avs_u_v
	str	r0, [r4, #332]
	b	.L61
.L81:
	ldr	r2, .L89+16
	mov	r1, #1
	mov	r0, r5
	bl	avs_f_v
	ldr	r2, .L89+80
	mov	r1, #7
	str	r0, [r4, #108]
	mov	r0, r5
	bl	avs_u_v
	ldr	r3, [r4, #96]
	mov	r2, #1
	strb	r2, [r4]
	str	r0, [r4, #100]
	orr	r0, r0, r3, asl #7
	str	r0, [r4, #96]
	b	.L51
.L82:
	ldr	r2, .L89+84
	mov	r1, #24
	mov	r0, r5
	bl	avs_u_v
	str	r0, [r4, #104]
	b	.L52
.L83:
	ldr	r1, .L89+88
	mov	r0, r5
	bl	avs_ue_v
	str	r0, [r4, #116]
	b	.L53
.L62:
	ldr	r2, .L89+92
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L89+96
	mov	r1, #1
	str	r0, [r4, #132]
	mov	r0, r5
	bl	avs_u_v
	cmp	r0, #0
	str	r0, [r4, #136]
	beq	.L88
.L63:
	ldr	r2, .L89+100
	mov	r1, #2
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L89+104
	mov	r1, #2
	str	r0, [r4, #148]
	mov	r0, r5
	bl	avs_u_v
	ldr	r3, [r4, #148]
	cmp	r3, #1
	str	r0, [r4, #152]
	beq	.L66
	ldr	r2, [r4, #132]
	cmp	r2, #0
	cmpeq	r3, #3
	beq	.L66
	cmp	r3, #2
	addeq	r7, r4, #176
	bne	.L71
.L70:
	add	r8, r4, #200
.L69:
	ldr	r1, .L89+108
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r7, #4]!
	cmp	r7, r8
	bne	.L69
	b	.L71
.L88:
	ldr	r1, .L89+112
	mov	r0, r5
	bl	avs_se_v
	ldr	r1, .L89+116
	str	r0, [r4, #140]
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r4, #144]
	b	.L63
.L66:
	add	r8, r4, #152
	add	r7, r4, #176
.L65:
	ldr	r1, .L89+120
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r8, #4]!
	cmp	r8, r7
	bne	.L65
	ldr	r3, [r4, #148]
	cmp	r3, #2
	beq	.L70
	ldr	r2, [r4, #132]
	cmp	r2, #0
	cmpeq	r3, #3
	bne	.L71
	b	.L70
.L90:
	.align	2
.L89:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	.word	.LC19
	.word	.LC21
	.word	.LC12
	.word	.LC23
	.word	.LC25
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC16
	.word	.LC32
	.word	.LC26
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC31
	.word	.LC36
	.word	.LC37
	.word	.LC20
	.word	.LC22
	.word	.LC24
	.word	.LC38
	.word	.LC39
	.word	.LC42
	.word	.LC43
	.word	.LC45
	.word	.LC40
	.word	.LC41
	.word	.LC44
	UNWIND(.fnend)
	.size	AVS_i_picture_header, .-AVS_i_picture_header
	.align	2
	.global	AVS_pb_picture_header
	.type	AVS_pb_picture_header, %function
AVS_pb_picture_header:
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
	ldr	r3, .L143
	mov	r6, r0
	ldr	r5, [r0, #496]
	mov	r4, r1
	add	r0, r1, #80
	mov	r2, #272
	ldr	r3, [r3, #48]
	mov	r1, #0
	blx	r3
	ldr	r3, [r6, #104]
	ldr	r2, .L143+4
	mov	r1, #32
	bic	r3, r3, #262144
	mov	r0, r5
	str	r3, [r6, #104]
	bl	avs_f_v
	mov	r0, r5
	ldr	r2, .L143+8
	mov	r1, #16
	bl	avs_u_v
	ldr	r3, [r4, #16]
	cmp	r3, #72
	str	r0, [r4, #96]
	beq	.L135
.L92:
	ldr	r2, .L143+12
	mov	r1, #2
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+16
	mov	r1, #8
	strb	r0, [r4, #91]
	mov	r0, r5
	bl	avs_u_v
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, #1
	str	r0, [r4, #112]
	beq	.L136
.L93:
	ldr	r2, .L143+20
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	uxtb	r0, r0
	strb	r0, [r4, #80]
	cmp	r0, #0
	movne	r3, #1
	strneb	r3, [r4, #81]
	beq	.L137
.L95:
	ldr	r2, .L143+24
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+28
	mov	r1, #1
	strb	r0, [r4, #82]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+32
	mov	r1, #1
	strb	r0, [r4, #83]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+36
	mov	r1, #6
	strb	r0, [r4, #84]
	mov	r0, r5
	bl	avs_u_v
	ldrb	r3, [r4, #91]	@ zero_extendqisi2
	cmp	r3, #2
	strb	r0, [r4, #85]
	beq	.L138
.L96:
	ldr	r2, .L143+40
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	strb	r0, [r4, #93]
.L98:
	ldr	r2, .L143+44
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	ldrb	r2, [r4, #91]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #340]
	cmp	r2, #2
	str	r3, [r4, #344]
	strb	r0, [r4, #94]
	beq	.L139
	ldr	r2, .L143+48
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	str	r0, [r4, #340]
.L100:
	ldrb	r3, [r4, #81]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L101
	ldr	r3, [r4, #16]
	cmp	r3, #72
	beq	.L102
.L101:
	mov	r3, #0
	str	r3, [r4, #340]
	str	r3, [r4, #344]
.L102:
	ldr	r2, .L143+52
	mov	r1, #2
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+56
	mov	r1, #1
	strb	r0, [r4, #87]
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+60
	mov	r1, #1
	strb	r0, [r4, #86]
	mov	r0, r5
	bl	avs_u_v
	mov	r3, #0
	str	r3, [r4, #120]
	str	r3, [r4, #124]
	uxtb	r0, r0
	strb	r0, [r4, #88]
	cmp	r0, r3
	beq	.L140
.L104:
	ldr	r3, [r4, #16]
	cmp	r3, #72
	beq	.L141
.L106:
	ldrb	r3, [r4, #91]	@ zero_extendqisi2
	mov	r0, #1
	cmp	r3, #1
	movne	r3, #2
	str	r3, [r4, #348]
	ldr	r3, [r6, #104]
	orr	r3, r3, #262144
	str	r3, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L138:
	ldrb	r3, [r4, #81]	@ zero_extendqisi2
	cmp	r3, #1
	streqb	r3, [r4, #93]
	bne	.L96
	b	.L98
.L137:
	ldr	r2, .L143+64
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	uxtb	r0, r0
	strb	r0, [r4, #81]
	cmp	r0, #0
	bne	.L95
	ldr	r2, .L143+68
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	strb	r0, [r4, #92]
	b	.L95
.L140:
	ldr	r2, .L143+72
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	uxtb	r0, r0
	strb	r0, [r4, #89]
	cmp	r0, #0
	beq	.L104
	ldr	r1, .L143+76
	mov	r0, r5
	bl	avs_se_v
	ldr	r1, .L143+80
	str	r0, [r4, #120]
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r4, #124]
	b	.L104
.L139:
	ldr	r2, .L143+84
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	str	r0, [r4, #344]
	b	.L100
.L141:
	ldr	r2, .L143+88
	mov	r1, #1
	mov	r0, r5
	bl	avs_u_v
	cmp	r0, #1
	mov	r7, r0
	str	r0, [r4, #128]
	beq	.L107
.L116:
	mov	r0, r5
	ldr	r2, .L143+92
	mov	r1, #1
	bl	avs_u_v
	str	r0, [r4, #332]
	b	.L106
.L135:
	ldr	r2, .L143+96
	mov	r1, #1
	mov	r0, r5
	bl	avs_f_v
	ldr	r2, .L143+100
	mov	r1, #7
	str	r0, [r4, #108]
	mov	r0, r5
	bl	avs_u_v
	ldr	r3, [r4, #96]
	mov	r2, #1
	strb	r2, [r4]
	str	r0, [r4, #100]
	orr	r0, r0, r3, asl #7
	str	r0, [r4, #96]
	b	.L92
.L136:
	ldr	r1, .L143+104
	mov	r0, r5
	bl	avs_ue_v
	str	r0, [r4, #116]
	b	.L93
.L107:
	mov	r1, r0
	ldr	r2, .L143+108
	mov	r0, r5
	bl	avs_u_v
	mov	r1, r7
	ldr	r2, .L143+112
	str	r0, [r4, #132]
	mov	r0, r5
	bl	avs_u_v
	cmp	r0, #0
	str	r0, [r4, #136]
	beq	.L142
.L108:
	ldr	r2, .L143+116
	mov	r1, #2
	mov	r0, r5
	bl	avs_u_v
	ldr	r2, .L143+120
	mov	r1, #2
	str	r0, [r4, #148]
	mov	r0, r5
	bl	avs_u_v
	ldr	r3, [r4, #148]
	cmp	r3, #1
	str	r0, [r4, #152]
	beq	.L111
	ldr	r2, [r4, #132]
	cmp	r2, #0
	cmpeq	r3, #3
	beq	.L111
	cmp	r3, #2
	addeq	r7, r4, #176
	bne	.L116
.L115:
	add	r8, r4, #200
.L114:
	ldr	r1, .L143+124
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r7, #4]!
	cmp	r7, r8
	bne	.L114
	b	.L116
.L111:
	add	r8, r4, #152
	add	r7, r4, #176
.L110:
	ldr	r1, .L143+128
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r8, #4]!
	cmp	r8, r7
	bne	.L110
	ldr	r3, [r4, #148]
	cmp	r3, #2
	beq	.L115
	ldr	r2, [r4, #132]
	cmp	r2, #0
	cmpeq	r3, #3
	bne	.L116
	b	.L115
.L142:
	ldr	r1, .L143+132
	mov	r0, r5
	bl	avs_se_v
	ldr	r1, .L143+136
	str	r0, [r4, #140]
	mov	r0, r5
	bl	avs_se_v
	str	r0, [r4, #144]
	b	.L108
.L144:
	.align	2
.L143:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	.LC19
	.word	.LC47
	.word	.LC23
	.word	.LC25
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC49
	.word	.LC50
	.word	.LC52
	.word	.LC16
	.word	.LC31
	.word	.LC32
	.word	.LC26
	.word	.LC48
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC51
	.word	.LC36
	.word	.LC37
	.word	.LC12
	.word	.LC20
	.word	.LC24
	.word	.LC38
	.word	.LC39
	.word	.LC42
	.word	.LC43
	.word	.LC45
	.word	.LC44
	.word	.LC40
	.word	.LC41
	UNWIND(.fnend)
	.size	AVS_pb_picture_header, .-AVS_pb_picture_header
	.align	2
	.global	AVS_user_data
	.type	AVS_user_data, %function
AVS_user_data:
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
	add	r4, r0, #12288
	mov	r6, r1
	mov	r5, r0
	ldr	r2, .L184
	ldr	r0, [r4, #3124]
	mov	r1, #32
	bl	avs_f_v
	ldr	r3, [r4, #2732]
	cmp	r6, #0
	orr	r3, r3, #1048576
	str	r3, [r4, #2732]
	bne	.L146
	ldr	r1, [r4, #3412]
	cmp	r1, #0
	beq	.L147
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	str	r6, [r4, #3412]
.L147:
	ldr	r0, [r5, #4]
	bl	GetUsd
	cmp	r0, #0
	str	r0, [r4, #3412]
	beq	.L157
	ldr	r3, [r5, #12]
	add	r0, r0, #1056
	mov	r1, #10
	add	r6, r5, #16384
	ldr	r7, .L184+4
	ldrd	r2, [r3, #32]
	strd	r2, [r0]
	ldr	r3, [r4, #3412]
	str	r1, [r3, #1040]
	ldr	r3, [r4, #3412]
	ldr	r2, [r4, #2740]
	str	r2, [r3, #1044]
	ldr	r2, [r4, #3412]
	ldr	r3, [r6, #128]
	sub	r3, r3, #4
	str	r3, [r2, #1052]
	ldr	r0, [r4, #3412]
	ldr	r2, [r0, #1052]
	cmp	r2, #1024
	movgt	r3, #1024
	strgt	r3, [r0, #1052]
	ldrgt	r0, [r4, #3412]
	ldr	r1, [r6, #112]
	ldr	r3, [r7, #52]
	ldrgt	r2, [r0, #1052]
	add	r1, r1, #4
	blx	r3
	ldrb	r3, [r6, #118]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L152
	ldr	r2, [r4, #3412]
	ldr	r1, [r6, #208]
	ldr	r3, [r2, #1052]
	add	r3, r3, r1
	str	r3, [r2, #1052]
	ldr	r3, [r4, #3412]
	ldr	r2, [r3, #1052]
	cmp	r2, #1024
	movgt	r2, #1024
	strgt	r2, [r3, #1052]
	ldrgt	r3, [r4, #3412]
	ldr	r0, [r6, #128]
	ldrgt	r2, [r3, #1052]
	rsb	r2, r0, r2
	cmn	r2, #4
	beq	.L152
	sub	r0, r0, #4
	ldr	r7, [r7, #52]
	add	r0, r3, r0
	add	r2, r2, #4
	ldr	r1, [r6, #192]
	blx	r7
.L152:
	ldr	r3, .L184+8
	ldr	r6, [r3]
	cmp	r6, #0
	ldrne	r2, [r4, #3412]
	bne	.L183
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L146:
	ldr	r1, [r4, #3416]
	cmp	r1, #0
	beq	.L156
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r3, #0
	str	r3, [r4, #3416]
.L156:
	ldr	r0, [r5, #4]
	bl	GetUsd
	cmp	r0, #0
	str	r0, [r4, #3416]
	beq	.L157
	ldr	r3, [r5, #12]
	add	r0, r0, #1056
	mov	r1, #11
	add	r6, r5, #16384
	ldr	r7, .L184+4
	ldrd	r2, [r3, #32]
	strd	r2, [r0]
	ldr	r3, [r4, #3416]
	str	r1, [r3, #1040]
	ldr	r3, [r4, #3416]
	ldr	r2, [r4, #2740]
	str	r2, [r3, #1044]
	ldr	r2, [r4, #3416]
	ldr	r3, [r6, #128]
	sub	r3, r3, #4
	str	r3, [r2, #1052]
	ldr	r0, [r4, #3416]
	ldr	r2, [r0, #1052]
	cmp	r2, #1024
	movgt	r3, #1024
	strgt	r3, [r0, #1052]
	ldrgt	r0, [r4, #3416]
	ldr	r1, [r6, #112]
	ldr	r3, [r7, #52]
	ldrgt	r2, [r0, #1052]
	add	r1, r1, #4
	blx	r3
	ldrb	r3, [r6, #118]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L160
	ldr	r2, [r4, #3416]
	ldr	r1, [r6, #208]
	ldr	r3, [r2, #1052]
	add	r3, r3, r1
	str	r3, [r2, #1052]
	ldr	r3, [r4, #3416]
	ldr	r2, [r3, #1052]
	cmp	r2, #1024
	movgt	r2, #1024
	strgt	r2, [r3, #1052]
	ldrgt	r3, [r4, #3416]
	ldr	r0, [r6, #128]
	ldrgt	r2, [r3, #1052]
	rsb	r2, r0, r2
	cmn	r2, #4
	beq	.L160
	sub	r0, r0, #4
	ldr	r7, [r7, #52]
	add	r0, r3, r0
	add	r2, r2, #4
	ldr	r1, [r6, #192]
	blx	r7
.L160:
	ldr	r3, .L184+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L182
	ldr	r2, [r4, #3416]
.L183:
	movw	r3, #1064
	ldr	r0, [r5, #4]
	mov	r1, #5
	blx	r6
.L182:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L157:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L185:
	.align	2
.L184:
	.word	.LC53
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	AVS_user_data, .-AVS_user_data
	.align	2
	.global	AVS_sequence_display_extension
	.type	AVS_sequence_display_extension, %function
AVS_sequence_display_extension:
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
	ldr	r4, [r0, #496]
	mov	r5, r1
	ldr	r2, .L189
	mov	r1, #4
	mov	r6, r0
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+4
	mov	r1, #3
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+8
	mov	r1, #1
	strb	r0, [r5, #50]
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+12
	mov	r1, #1
	strb	r0, [r5, #51]
	mov	r0, r4
	bl	avs_u_v
	uxtb	r0, r0
	strb	r0, [r5, #52]
	cmp	r0, #1
	beq	.L188
.L187:
	ldr	r2, .L189+16
	mov	r1, #14
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+20
	mov	r1, #1
	str	r0, [r5, #68]
	mov	r0, r4
	bl	avs_f_v
	ldr	r2, .L189+24
	mov	r1, #14
	strb	r0, [r5, #49]
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+28
	mov	r1, #2
	str	r0, [r5, #72]
	mov	r0, r4
	bl	avs_u_v
	strb	r0, [r5, #48]
	mov	r0, r4
	bl	AVS_next_start_code
	ldr	r3, [r6, #104]
	mov	r0, #1
	orr	r3, r3, #131072
	str	r3, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L188:
	ldr	r2, .L189+32
	mov	r1, #8
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+36
	mov	r1, #8
	str	r0, [r5, #56]
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L189+40
	mov	r1, #8
	str	r0, [r5, #60]
	mov	r0, r4
	bl	avs_u_v
	str	r0, [r5, #64]
	b	.L187
.L190:
	.align	2
.L189:
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC61
	.word	.LC12
	.word	.LC62
	.word	.LC16
	.word	.LC58
	.word	.LC59
	.word	.LC60
	UNWIND(.fnend)
	.size	AVS_sequence_display_extension, .-AVS_sequence_display_extension
	.align	2
	.global	AVS_copyright_extension
	.type	AVS_copyright_extension, %function
AVS_copyright_extension:
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
	ldr	r4, [r0, #496]
	mov	r5, r0
	ldr	r2, .L192
	mov	r1, #4
	ldr	r6, .L192+4
	mov	r0, r4
	bl	avs_u_v
	mov	r0, r4
	ldr	r2, .L192+8
	mov	r1, #1
	bl	avs_u_v
	mov	r0, r4
	ldr	r2, .L192+12
	mov	r1, #8
	bl	avs_u_v
	mov	r0, r4
	ldr	r2, .L192+16
	mov	r1, #1
	bl	avs_u_v
	mov	r0, r4
	ldr	r2, .L192+20
	mov	r1, #7
	bl	avs_u_v
	mov	r2, r6
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L192+24
	mov	r1, #20
	bl	avs_u_v
	mov	r2, r6
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L192+28
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r6
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	ldr	r2, .L192+32
	mov	r1, #22
	mov	r0, r4
	bl	avs_u_v
	mov	r0, r4
	bl	AVS_next_start_code
	ldr	r3, [r5, #104]
	mov	r0, #1
	orr	r3, r3, #2097152
	str	r3, [r5, #104]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L193:
	.align	2
.L192:
	.word	.LC54
	.word	.LC12
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC16
	.word	.LC66
	.word	.LC67
	.word	.LC68
	UNWIND(.fnend)
	.size	AVS_copyright_extension, .-AVS_copyright_extension
	.align	2
	.global	AVS_camera_parameters_extension
	.type	AVS_camera_parameters_extension, %function
AVS_camera_parameters_extension:
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
	ldr	r4, [r0, #496]
	mov	r6, r0
	ldr	r7, .L195
	mov	r1, #4
	ldr	r5, .L195+4
	ldr	r2, .L195+8
	mov	r0, r4
	bl	avs_u_v
	mov	r2, r7
	mov	r0, r4
	mov	r1, #1
	bl	avs_u_v
	mov	r0, r4
	ldr	r2, .L195+12
	mov	r1, #7
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+16
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+20
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+24
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+28
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+32
	mov	r1, #16
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+36
	mov	r1, #16
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+40
	mov	r1, #16
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+44
	mov	r1, #16
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+48
	mov	r1, #16
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+52
	mov	r1, #16
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+56
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+60
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+64
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+68
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+72
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r0, r4
	ldr	r2, .L195+76
	mov	r1, #22
	bl	avs_u_v
	mov	r2, r5
	mov	r0, r4
	mov	r1, #1
	bl	avs_f_v
	mov	r2, r7
	mov	r1, #32
	mov	r0, r4
	bl	avs_u_v
	mov	r0, r4
	bl	AVS_next_start_code
	ldr	r3, [r6, #104]
	mov	r0, #1
	orr	r3, r3, #4194304
	str	r3, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L196:
	.align	2
.L195:
	.word	.LC16
	.word	.LC12
	.word	.LC54
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	UNWIND(.fnend)
	.size	AVS_camera_parameters_extension, .-AVS_camera_parameters_extension
	.align	2
	.global	AVS_picture_display_extension
	.type	AVS_picture_display_extension, %function
AVS_picture_display_extension:
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
	ldr	r4, [r0, #496]
	mov	r7, r1
	mov	r8, r0
	mov	r1, #4
	ldr	r2, .L216
	mov	r0, r4
	bl	avs_u_v
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L214
	ldrb	r3, [r7, #81]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L215
.L199:
	mov	r3, #1
	str	r3, [r7, #4]
.L201:
	add	r6, r7, #348
	mov	r5, #0
.L203:
	ldr	r2, .L216+4
	mov	r1, #16
	mov	r0, r4
	add	r5, r5, #1
	bl	avs_u_v
	ldr	r2, .L216+8
	mov	r1, #1
	str	r0, [r6, #4]!
	mov	r0, r4
	bl	avs_f_v
	ldr	r2, .L216+12
	mov	r1, #16
	mov	r0, r4
	bl	avs_u_v
	ldr	r2, .L216+8
	mov	r1, #1
	str	r0, [r6, #12]
	mov	r0, r4
	bl	avs_f_v
	ldr	r3, [r7, #4]
	cmp	r3, r5
	bgt	.L203
	mov	r0, r4
	bl	AVS_next_start_code
	ldr	r3, [r8, #104]
	mov	r0, #1
	orr	r3, r3, #524288
	str	r3, [r8, #104]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L215:
	ldrb	r3, [r7, #83]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L202
.L200:
	mov	r3, #2
	str	r3, [r7, #4]
	b	.L201
.L214:
	ldrb	r3, [r7, #83]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L199
	ldrb	r3, [r7, #82]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L200
.L202:
	mov	r3, #3
	str	r3, [r7, #4]
	b	.L201
.L217:
	.align	2
.L216:
	.word	.LC54
	.word	.LC86
	.word	.LC12
	.word	.LC87
	UNWIND(.fnend)
	.size	AVS_picture_display_extension, .-AVS_picture_display_extension
	.align	2
	.global	AVS_extension
	.type	AVS_extension, %function
AVS_extension:
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
	ldr	r4, [r0, #496]
	mov	r5, r0
	ldr	r2, .L225
	mov	r6, r1
	mov	r1, #32
	mov	r0, r4
	bl	avs_f_v
	mov	r0, r4
	mov	r1, #4
	bl	BsShow
	sub	r0, r0, #2
	cmp	r0, #9
	ldrls	pc, [pc, r0, asl #2]
	b	.L219
.L221:
	.word	.L220
	.word	.L219
	.word	.L222
	.word	.L219
	.word	.L219
	.word	.L223
	.word	.L219
	.word	.L219
	.word	.L219
	.word	.L224
.L224:
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS_camera_parameters_extension
.L223:
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS_picture_display_extension
.L222:
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS_copyright_extension
.L220:
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS_sequence_display_extension
.L219:
	mov	r0, r4
	mov	r1, #4
	bl	BsSkip
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L226:
	.align	2
.L225:
	.word	.LC88
	UNWIND(.fnend)
	.size	AVS_extension, .-AVS_extension
	.align	2
	.global	AVS_AllocateVHB
	.type	AVS_AllocateVHB, %function
AVS_AllocateVHB:
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
	ldr	r1, .L237
	add	r3, r0, #12288
	mov	r4, r0
	mov	r2, #36
	sub	r0, fp, #64
	ldr	r7, [r1, #48]
	mov	r1, #0
	ldr	r5, [r3, #2776]
	ldr	r6, [r3, #2772]
	blx	r7
	ldr	r3, [r4, #12]
	sub	r1, fp, #64
	str	r5, [fp, #-44]
	mov	r2, #0
	str	r6, [fp, #-48]
	mov	lr, #6
	ldr	r0, [r3, #16]
	mov	ip, #8
	str	r5, [fp, #-52]
	cmp	r0, #24
	ldr	r0, [r4, #4]
	str	r6, [fp, #-56]
	movne	r5, #4
	moveq	r5, #1
	str	r5, [fp, #-40]
	ldr	r3, [r3, #16]
	str	lr, [fp, #-64]
	cmp	r3, #24
	strb	ip, [fp, #-59]
	movne	r3, #4
	moveq	r3, #1
	str	r3, [fp, #-36]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L235
	cmp	r0, #0
	moveq	r0, #1
	streq	r0, [r4, #8]
	bne	.L236
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L235:
	add	r0, r4, #16128
	add	r0, r0, #8
	bl	ResetVoQueue
	mov	r0, #3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L236:
	ldr	r3, .L237+4
	movw	r1, #1262
	ldr	r2, .L237+8
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L238:
	.align	2
.L237:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+84
	.word	.LC89
	UNWIND(.fnend)
	.size	AVS_AllocateVHB, .-AVS_AllocateVHB
	.align	2
	.global	AVS_StartDecode
	.type	AVS_StartDecode, %function
AVS_StartDecode:
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
	add	r6, r0, #16384
	ldr	r0, [r0, #4]
	add	r5, r4, #12288
	str	r0, [r4, #88]
	ldr	r3, [r6, #272]
	strb	r3, [r4, #20]
	ldr	r3, [r6, #276]
	strb	r3, [r4, #21]
	ldr	r3, [r6, #280]
	strb	r3, [r4, #22]
	ldr	r3, [r6, #284]
	strb	r3, [r4, #23]
	ldr	r3, [r6, #288]
	strb	r3, [r4, #24]
	ldr	r3, [r6, #300]
	str	r3, [r4, #28]
	ldr	r3, [r6, #304]
	str	r3, [r4, #92]
	ldr	r3, [r6, #324]
	str	r3, [r4, #32]
	ldr	r3, [r6, #328]
	str	r3, [r4, #36]
	ldr	r3, [r6, #456]
	str	r3, [r4, #104]
	ldr	r3, [r6, #468]
	str	r3, [r4, #108]
	ldr	r3, [r6, #460]
	str	r3, [r4, #112]
	ldr	r3, [r6, #472]
	str	r3, [r4, #116]
	ldr	r3, [r6, #464]
	str	r3, [r4, #120]
	ldr	r3, [r6, #476]
	str	r3, [r4, #124]
	ldr	r3, [r6, #336]
	strh	r3, [r4, #84]	@ movhi
	ldr	r3, [r6, #332]
	strh	r3, [r4, #86]	@ movhi
	ldr	r3, [r6, #340]
	strb	r3, [r4, #63]
	ldr	r3, [r6, #344]
	strb	r3, [r4, #64]
	ldr	r3, [r6, #380]
	strb	r3, [r4, #40]
	ldr	r3, [r6, #384]
	strb	r3, [r4, #41]
	ldr	r3, [r6, #348]
	strb	r3, [r4, #42]
	ldr	r3, [r6, #352]
	strb	r3, [r4, #43]
	ldr	r3, [r6, #360]
	strb	r3, [r4, #44]
	ldr	r3, [r6, #364]
	strb	r3, [r4, #45]
	ldr	r3, [r6, #368]
	strb	r3, [r4, #46]
	ldr	r3, [r6, #372]
	strb	r3, [r4, #47]
	ldr	r3, [r6, #376]
	strb	r3, [r4, #48]
	ldr	r3, [r6, #388]
	strb	r3, [r4, #49]
	ldr	r3, [r6, #392]
	strb	r3, [r4, #50]
	ldr	r3, [r6, #396]
	strb	r3, [r4, #51]
	ldr	r3, [r6, #400]
	strb	r3, [r4, #52]
	ldr	r3, [r6, #404]
	strb	r3, [r4, #53]
	ldr	r3, [r6, #448]
	strb	r3, [r4, #54]
	ldr	r3, [r6, #356]
	strb	r3, [r4, #55]
	ldr	r3, [r6, #412]
	strb	r3, [r4, #56]
	ldr	r3, [r6, #408]
	strb	r3, [r4, #57]
	ldr	r3, [r6, #428]
	strb	r3, [r4, #58]
	ldr	r3, [r6, #424]
	strb	r3, [r4, #59]
	ldr	r3, [r6, #420]
	strb	r3, [r4, #60]
	ldr	r3, [r6, #416]
	strb	r3, [r4, #61]
	ldr	r3, [r6, #452]
	strb	r3, [r4, #62]
	ldr	r3, [r6, #432]
	str	r3, [r4, #132]
	ldr	r3, [r6, #436]
	str	r3, [r4, #136]
	ldr	r3, [r6, #440]
	str	r3, [r4, #140]
	ldr	r3, [r6, #508]
	str	r3, [r4, #148]
	ldr	r3, [r6, #520]
	str	r3, [r4, #152]
	ldr	r3, [r5, #2704]
	ldr	r1, [r3, #4]
	bl	FSP_GetLogicFs
	subs	r7, r0, #0
	beq	.L253
	ldr	r1, [r7, #24]
	add	r2, r4, #16896
	add	r2, r2, #142
	add	r3, r4, #288
	add	r0, r4, #544
	ldr	r1, [r1, #44]
	str	r1, [r4, #548]
	ldr	r1, [r7, #24]
	ldr	r1, [r1, #72]
	str	r1, [r4, #552]
	ldr	r1, [r7, #24]
	ldr	r1, [r1, #64]
	str	r1, [r4, #556]
	ldr	r1, [r7, #24]
	ldr	r1, [r1, #68]
	str	r1, [r4, #560]
	ldrb	r1, [r7, #408]	@ zero_extendqisi2
	strb	r1, [r4, #72]
	ldr	r1, [r6, #324]
	str	r1, [r4, #144]
	ldr	r1, [r6, #444]
	str	r1, [r4, #156]
	ldr	r1, [r6, #652]
	str	r1, [r4, #160]
	ldr	r1, [r6, #480]
	strb	r1, [r4, #65]
	ldr	r1, [r6, #484]
	strb	r1, [r4, #66]
	ldr	r1, [r6, #492]
	strb	r1, [r4, #67]
	ldr	r1, [r6, #488]
	strb	r1, [r4, #68]
	ldr	r1, [r6, #496]
	strb	r1, [r4, #69]
	ldr	r1, [r6, #500]
	strb	r1, [r4, #70]
	ldr	r1, [r6, #504]
	strb	r1, [r4, #71]
.L242:
	ldrsh	r1, [r2, #2]!
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L242
	ldr	r1, [r6, #308]
	add	r3, r4, #16896
	add	r2, r4, #160
	mov	r0, r3
	add	r3, r3, #8
	str	r1, [r4, #564]
	add	r0, r0, #136
	ldr	r1, [r6, #312]
	str	r1, [r4, #568]
	ldr	r1, [r6, #316]
	str	r1, [r4, #572]
	ldr	r1, [r6, #320]
	str	r1, [r4, #576]
.L243:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L243
	ldr	r3, [r5, #3408]
	add	r2, r4, #20
	add	r3, r3, #1
	str	r3, [r5, #3408]
	ldr	r3, [r4, #12]
	str	r2, [r4, #16]
	ldr	r0, [r3, #840]
	cmp	r0, #1
	beq	.L254
	cmp	r0, #2
	beq	.L255
.L247:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L255:
	ldr	r3, [r3, #844]
	cmp	r2, #0
	cmpne	r3, #0
	ble	.L247
	ldr	r3, [r5, #2704]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L247
	mov	r7, #0
	ldr	r0, [r4, #4]
	str	r7, [r4, #16]
	mov	r2, r7
	ldr	r1, [r3, #4]
	bl	FSP_SetDisplay
	ldr	r2, [r4, #12]
	mov	r0, r7
	ldr	r3, [r2, #844]
	sub	r3, r3, #1
	str	r3, [r2, #844]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L254:
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r5, #2704]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #2
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r7, #0
	ldr	r0, [r4, #4]
	str	r7, [r4, #16]
	mov	r2, r7
	ldr	r1, [r3, #4]
	bl	FSP_SetDisplay
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L253:
	movw	r3, #1645
	ldr	r2, .L256
	mov	r1, r3
	bl	dprint_normal
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L257:
	.align	2
.L256:
	.word	.LC90
	UNWIND(.fnend)
	.size	AVS_StartDecode, .-AVS_StartDecode
	.align	2
	.global	AVS_SetImgFormat
	.type	AVS_SetImgFormat, %function
AVS_SetImgFormat:
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
	UNWIND(.pad #4)
	sub	sp, sp, #4
	add	r5, r0, #12288
	ldrb	r3, [r5, #2763]	@ zero_extendqisi2
	ldr	r6, [r5, #3096]
	cmp	r3, #1
	ldrb	r7, [r5, #2798]	@ zero_extendqisi2
	moveq	r9, #0
	beq	.L259
	ldrb	r9, [r5, #2828]	@ zero_extendqisi2
	subs	r9, r9, #1
	movne	r9, #1
.L259:
	ldrb	r3, [r5, #2761]	@ zero_extendqisi2
	ldr	r0, [r0, #4]
	sub	r3, r3, #1
	ldrb	r8, [r5, #2830]	@ zero_extendqisi2
	uxtb	r3, r3
	cmp	r3, #3
	ldrls	r2, .L265
	movhi	r10, #0
	addls	r3, r2, r3, lsl #2
	ldrls	r10, [r3, #100]
	ldr	r3, [r5, #2704]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L264
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	mov	r1, r10
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	bfi	r3, r9, #0, #2
	bfi	r2, r6, #0, #2
	uxtb	r3, r3
	and	r2, r2, #227
	orr	r3, r3, #12
	bfi	r2, r7, #5, #3
	bfi	r3, r8, #4, #2
	strb	r2, [r4, #156]
	strb	r3, [r4, #157]
	ldr	r3, [r4, #156]
	bfi	r3, r10, #14, #3
	str	r3, [r4, #156]
	ldr	r3, [r5, #3400]
	str	r6, [r4, #24]
	str	r6, [r4, #28]
	str	r3, [r4, #96]
	bl	SetAspectRatio
	ldr	r3, [r5, #2792]
	str	r3, [r4, #64]
	ldmib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L264:
	movw	r3, #1752
	ldr	r2, .L265+4
	mov	r1, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L266:
	.align	2
.L265:
	.word	.LANCHOR0
	.word	.LC91
	UNWIND(.fnend)
	.size	AVS_SetImgFormat, .-AVS_SetImgFormat
	.align	2
	.global	AVS_GetImageBuffer
	.type	AVS_GetImageBuffer, %function
AVS_GetImageBuffer:
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
	add	r4, r0, #12288
	mov	r5, r0
	ldr	r3, [r4, #3816]
	cmp	r3, #2
	beq	.L268
	ldr	r6, [r4, #3132]
	add	r7, r0, #14912
	add	r7, r7, #4
	add	r2, r6, #1
	mov	r3, r6, asl #4
	mov	r1, r2, asr #31
	sub	r6, r3, r6, asl #2
	add	r6, r6, #16
	mov	r3, r1, lsr #30
	add	r6, r7, r6
	add	r2, r2, r3
	str	r6, [r4, #2704]
	and	r2, r2, #3
	rsb	r2, r3, r2
	str	r2, [r4, #3132]
.L269:
	mov	r1, #0
	ldr	r0, [r5, #4]
	bl	FSP_NewLogicFs
	str	r0, [r6, #4]
	ldr	r3, [r4, #2704]
	ldr	r1, [r3, #4]
	cmp	r1, #0
	blt	.L277
	ldr	r0, [r5, #4]
	bl	FSP_GetLogicFs
	subs	r4, r0, #0
	beq	.L278
	mov	r3, #0
	mov	r0, #1
	str	r3, [r4, #136]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L268:
	add	r7, r0, #14912
	add	r6, r7, #68
	add	r7, r7, #4
	str	r6, [r4, #2704]
	b	.L269
.L277:
	ldr	r2, .L279
	movw	r1, #1796
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L271
	ldr	r3, [r4, #2704]
	add	r7, r7, #4
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2716]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #168]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r6, #168]
	strd	r2, [r6, #176]
	strd	r2, [r6, #184]
	strd	r2, [r6, #192]
	str	r7, [r4, #2704]
	str	r7, [r4, #2716]
	str	r7, [r4, #2712]
	str	r7, [r4, #2708]
	ldr	r0, [r5, #4]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2636]
.L271:
	add	r1, r5, #16128
	mov	r6, #0
	add	r1, r1, #8
	str	r6, [r4, #3396]
	ldr	r0, [r5, #4]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L278:
	movw	r3, #1810
	ldr	r2, .L279+4
	mov	r1, r3
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L280:
	.align	2
.L279:
	.word	.LC92
	.word	.LC90
	UNWIND(.fnend)
	.size	AVS_GetImageBuffer, .-AVS_GetImageBuffer
	.align	2
	.global	AVS_OutputOneFrame
	.type	AVS_OutputOneFrame, %function
AVS_OutputOneFrame:
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
	mov	r6, r0
	mov	r4, r1
	ldr	r0, [r1, #4]
	ldr	r1, [r6, #4]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L287
	mov	r2, #1
	ldr	r1, [r6, #4]
	ldr	r0, [r4, #4]
	bl	FSP_SetDisplay
	add	r3, r4, #16128
	ldr	r0, [r4, #4]
	add	r3, r3, #8
	str	r5, [sp]
	mov	r2, r4
	mov	r1, #6
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L283
	ldr	r0, [r4, #4]
	mov	r2, #0
	ldr	r1, [r6, #4]
	bl	FSP_SetDisplay
	ldr	r3, [r6, #4]
	ldr	r2, .L288
	movw	r1, #1835
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
.L283:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L287:
	movw	r3, #1828
	ldr	r2, .L288+4
	mov	r1, r3
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L289:
	.align	2
.L288:
	.word	.LC94
	.word	.LC93
	UNWIND(.fnend)
	.size	AVS_OutputOneFrame, .-AVS_OutputOneFrame
	.align	2
	.global	AVS_UpdateTableIdx2Dist
	.type	AVS_UpdateTableIdx2Dist, %function
AVS_UpdateTableIdx2Dist:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r3, [r0, #201]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r0, #468]
	beq	.L304
	cmp	r3, #0
	beq	.L305
	cmp	r3, #1
	bne	.L299
	ldr	r3, [r0, #84]
	add	r2, r0, #4
	ldr	r1, [r0, #76]
	cmp	r3, r2
	ldrne	r2, [r3, #8]
	ldr	r3, [r0, #80]
	ldreq	r2, [r0, #536]
	movne	r2, r2, asl #1
	strne	r2, [r0, #536]
	add	r2, r2, #1
	str	r2, [r0, #532]
	ldr	r3, [r3, #8]
	str	r2, [r0, #552]
	mov	r3, r3, asl #1
	str	r3, [r0, #528]
	str	r3, [r0, #548]
	add	r3, r3, #1
	str	r3, [r0, #524]
	str	r3, [r0, #544]
	ldr	r3, [r1, #8]
	mov	r3, r3, asl #1
	str	r3, [r0, #540]
.L295:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L305:
	ldr	r3, [r0, #80]
	ldr	r3, [r3, #8]
	mov	r3, r3, asl #1
	str	r3, [r0, #540]
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L304:
	cmp	r3, #1
	beq	.L306
	cmp	r3, #2
	bne	.L295
	ldr	r3, [r0, #84]
	add	r2, r0, #4
	cmp	r3, r2
	ldrne	r3, [r3, #8]
	movne	r3, r3, asl #1
	strne	r3, [r0, #524]
	ldr	r3, [r0, #80]
	ldr	r3, [r3, #8]
	mov	r3, r3, asl #1
	str	r3, [r0, #532]
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L299:
	cmp	r3, #2
	bne	.L295
	ldr	r3, [r0, #84]
	add	r2, r0, #4
	cmp	r3, r2
	ldrne	r2, [r3, #8]
	ldr	r3, [r0, #80]
	ldreq	r2, [r0, #528]
	movne	r2, r2, asl #1
	strne	r2, [r0, #528]
	add	r1, r2, #1
	str	r1, [r0, #524]
	ldr	r3, [r3, #8]
	str	r1, [r0, #540]
	str	r2, [r0, #544]
	mov	r3, r3, asl #1
	str	r3, [r0, #532]
	str	r3, [r0, #548]
	add	r3, r3, #1
	str	r3, [r0, #536]
	str	r3, [r0, #552]
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L306:
	ldr	r3, [r0, #80]
	add	r2, r0, #4
	ldr	r1, [r0, #84]
	ldr	r3, [r3, #8]
	cmp	r1, r2
	mov	r3, r3, asl #1
	str	r3, [r0, #524]
	ldrne	r3, [r1, #8]
	movne	r3, r3, asl #1
	strne	r3, [r0, #528]
	b	.L295
	UNWIND(.fnend)
	.size	AVS_UpdateTableIdx2Dist, .-AVS_UpdateTableIdx2Dist
	.global	__aeabi_idiv
	.align	2
	.global	AVS_UpdateTableMvEScale
	.type	AVS_UpdateTableMvEScale, %function
AVS_UpdateTableMvEScale:
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
	mov	r5, r0
	ldrb	r0, [r0, #201]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L358
	ldr	r3, [r5, #468]
	cmp	r3, #0
	moveq	r3, #512
	streq	r3, [r5, #620]
	beq	.L344
	cmp	r3, #1
	bne	.L334
	ldr	r3, [r5, #76]
	add	r10, r5, #536
	str	r3, [fp, #-60]
	add	r3, r5, #520
	str	r3, [fp, #-48]
	add	r3, r5, #552
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-56]
.L323:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	ldr	r8, [fp, #-52]
	ldr	r3, [r3, #8]
	ldr	r7, [fp, #-48]
	add	r9, r2, r3, lsl #1
	mov	r3, r10
	mov	r10, r9
	mov	r9, r3
.L319:
	ldr	r5, [r7, #4]!
	mov	r6, r8
	ldr	r4, [fp, #-48]
	rsb	r5, r5, r10
	ubfx	r5, r5, #0, #9
.L321:
	ldr	r1, [r4, #4]!
	mov	r0, #512
	mov	r3, #1
	rsb	r1, r1, r10
	ubfx	r1, r1, #0, #9
	cmp	r1, #0
	beq	.L320
	bl	__aeabi_idiv
	mov	r3, r0
.L320:
	mul	r3, r3, r5
	cmp	r9, r4
	str	r3, [r6, #4]!
	bne	.L321
	cmp	r9, r7
	add	r8, r8, #16
	bne	.L319
	ldr	r3, [fp, #-56]
	add	r10, r9, #16
	add	r3, r3, #1
	str	r3, [fp, #-56]
	cmp	r3, #2
	ldr	r3, [fp, #-48]
	add	r3, r3, #16
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	add	r3, r3, #64
	str	r3, [fp, #-52]
	bne	.L323
.L344:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L358:
	ldr	r2, [r5, #76]
	ldr	r3, [r5, #468]
	ldr	r6, [r2, #8]
	cmp	r3, #1
	addeq	r9, r5, #520
	addeq	r7, r5, #32
	moveq	r8, r5
	mov	r6, r6, asl #1
	beq	.L310
	cmp	r3, #2
	bne	.L344
	ldr	r3, [r5, #524]
	rsb	r3, r3, r6
	ubfx	r4, r3, #0, #9
	cmp	r4, #0
	beq	.L316
	mov	r1, r4
	mov	r0, #512
	bl	__aeabi_idiv
.L316:
	mul	r3, r0, r4
	ldr	r4, [r5, #532]
	rsb	r4, r6, r4
	ubfx	r4, r4, #0, #9
	cmp	r4, #0
	str	r3, [r5, #556]
	moveq	r0, #1
	beq	.L317
	mov	r1, r4
	mov	r0, #512
	bl	__aeabi_idiv
.L317:
	mul	r4, r0, r4
	mov	r0, #1
	str	r4, [r5, #572]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L310:
	ldr	r1, [r5, #524]
	mov	r0, #512
	ldr	r4, [r9, #4]!
	mov	r3, #1
	rsb	r1, r1, r6
	ubfx	r1, r1, #0, #9
	rsb	r4, r4, r6
	cmp	r1, #0
	ubfx	r4, r4, #0, #9
	beq	.L312
	bl	__aeabi_idiv
	mov	r3, r0
.L312:
	mul	r3, r3, r4
	mov	r0, #1
	str	r3, [r8, #556]
	ldr	r1, [r5, #528]
	rsb	r1, r1, r6
	ubfx	r1, r1, #0, #9
	cmp	r1, #0
	beq	.L313
	mov	r0, #512
	bl	__aeabi_idiv
.L313:
	mul	r0, r0, r4
	add	r8, r8, #16
	str	r0, [r8, #544]
	cmp	r8, r7
	bne	.L310
	b	.L344
.L334:
	cmp	r3, #2
	bne	.L344
	ldr	r3, [r5, #76]
	mov	r7, r5
	add	r5, r5, #16
	add	r10, r7, #520
	mov	r8, #0
	str	r3, [fp, #-52]
.L333:
	ldr	r3, [fp, #-52]
	mov	r9, r10
	ldr	r4, [r3, #8]
	mov	r3, r7
	add	r4, r8, r4, lsl #1
.L324:
	ldr	r1, [r10, #4]
	mov	r0, #512
	ldr	r6, [r9, #4]!
	mov	ip, #1
	rsb	r1, r1, r4
	ubfx	r1, r1, #0, #9
	rsb	r6, r6, r4
	cmp	r1, #0
	ubfx	r6, r6, #0, #9
	beq	.L326
	str	r3, [fp, #-48]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-48]
	mov	ip, r0
.L326:
	mul	ip, ip, r6
	mov	r0, #1
	str	ip, [r3, #556]
	ldr	r1, [r10, #8]
	rsb	r1, r1, r4
	ubfx	r1, r1, #0, #9
	cmp	r1, #0
	beq	.L327
	mov	r0, #512
	str	r3, [fp, #-48]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-48]
.L327:
	mul	r0, r0, r6
	add	r3, r3, #8
	str	r0, [r3, #552]
	cmp	r3, r5
	bne	.L324
	add	r2, r10, #8
	mov	r9, r7
.L325:
	ldr	r1, [r10, #12]
	mov	r0, #512
	ldr	r6, [r2, #4]!
	mov	ip, #1
	rsb	r1, r4, r1
	ubfx	r1, r1, #0, #9
	rsb	r6, r4, r6
	cmp	r1, #0
	ubfx	r6, r6, #0, #9
	beq	.L330
	str	r2, [fp, #-48]
	bl	__aeabi_idiv
	ldr	r2, [fp, #-48]
	mov	ip, r0
.L330:
	mul	ip, ip, r6
	mov	r0, #1
	str	ip, [r9, #572]
	ldr	r1, [r10, #16]
	rsb	r1, r4, r1
	ubfx	r1, r1, #0, #9
	cmp	r1, #0
	beq	.L331
	mov	r0, #512
	str	r2, [fp, #-48]
	bl	__aeabi_idiv
	ldr	r2, [fp, #-48]
.L331:
	mul	r0, r0, r6
	add	r9, r9, #8
	str	r0, [r9, #568]
	cmp	r5, r9
	bne	.L325
	add	r8, r8, #1
	add	r5, r5, #32
	cmp	r8, #2
	add	r7, r7, #32
	add	r10, r10, #16
	bne	.L333
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_UpdateTableMvEScale, .-AVS_UpdateTableMvEScale
	.align	2
	.global	AVS_UpdateTableDirectScale
	.type	AVS_UpdateTableDirectScale, %function
AVS_UpdateTableDirectScale:
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
	ldrb	r3, [r0, #201]	@ zero_extendqisi2
	mov	r6, r0
	cmp	r3, #1
	beq	.L382
	ldr	r9, [r0, #80]
	mov	r5, #1
	add	r8, r0, #4
	add	r7, r0, #684
	mov	r4, #0
	ldr	r10, [r9, #8]
	mov	r10, r10, asl r5
.L366:
	sub	r3, r5, #1
	mov	r0, #16384
	and	r1, r5, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	add	r3, r3, #21
	ldr	r3, [r6, r3, asl #2]
	cmp	r8, r3
	beq	.L364
	ldr	r4, [r3, #8]
	add	r4, r1, r4, lsl #1
	rsb	r1, r4, r10
	ubfx	r1, r1, #0, #9
	cmp	r1, #0
	moveq	r3, #32
	streq	r3, [r7]
	beq	.L364
	bl	__aeabi_idiv
	str	r0, [r7]
.L364:
	add	r5, r5, #1
	add	r7, r7, #4
	cmp	r5, #5
	bne	.L366
	ldr	r2, [r9, #8]
	add	r9, r6, #700
	ldr	r3, [r6, #800]
	mov	r5, #1
	mov	r7, #0
	cmp	r3, #0
	moveq	r2, r2, asl #1
	movne	r10, r2, asl #1
	addeq	r10, r2, #1
.L376:
	cmp	r3, #0
	beq	.L369
	add	r1, r7, r7, lsr #31
	mov	r1, r1, asr #1
	add	r1, r1, #21
	ldr	r1, [r6, r1, asl #2]
	cmp	r8, r1
	beq	.L370
	ldr	r4, [r1, #8]
	and	r1, r5, #1
	add	r4, r1, r4, lsl #1
	rsb	r0, r4, r10
	add	r0, r0, #512
	mov	r1, r0, asr #31
	mov	ip, r1, lsr #23
	add	r0, r0, ip
	ubfx	r1, r0, #0, #9
	subs	r1, r1, ip
	moveq	r2, #32
	streq	r2, [r9, #-16]
	beq	.L372
	mov	r0, #16384
	str	r3, [fp, #-48]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-48]
	str	r0, [r9, #-16]
.L373:
	str	r0, [r9]
.L375:
	add	r5, r5, #1
	add	r7, r7, #1
	cmp	r5, #5
	add	r9, r9, #4
	bne	.L376
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L369:
	add	r1, r5, r5, lsr #31
	mov	r1, r1, asr #1
	add	r1, r1, #20
	ldr	r1, [r6, r1, asl #2]
	cmp	r8, r1
	ldrne	r4, [r1, #8]
	andne	r1, r7, #1
	addne	r4, r1, r4, lsl #1
.L370:
	rsb	r0, r4, r10
	add	r0, r0, #512
	mov	r1, r0, asr #31
	mov	ip, r1, lsr #23
	add	r0, r0, ip
	ubfx	r1, r0, #0, #9
	subs	r1, r1, ip
	beq	.L372
	mov	r0, #16384
	str	r3, [fp, #-48]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-48]
	b	.L373
.L372:
	mov	r2, #32
	str	r2, [r9]
	b	.L375
.L382:
	ldr	r3, [r0, #80]
	add	r7, r0, #4
	add	r4, r0, #80
	add	r6, r0, #88
	mov	r8, #32
	ldr	r5, [r3, #8]
	mov	r5, r5, asl #1
.L363:
	ldr	r3, [r4, #4]!
	mov	r0, #16384
	cmp	r3, r7
	beq	.L361
	ldr	r1, [r3, #8]
	sub	r1, r5, r1, asl #1
	ubfx	r1, r1, #0, #9
	cmp	r1, #0
	streq	r8, [r4, #600]
	beq	.L361
	bl	__aeabi_idiv
	str	r0, [r4, #600]
.L361:
	cmp	r4, r6
	bne	.L363
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_UpdateTableDirectScale, .-AVS_UpdateTableDirectScale
	.align	2
	.global	AVS_UpdateTableSymScale
	.type	AVS_UpdateTableSymScale, %function
AVS_UpdateTableSymScale:
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
	ldr	r3, [r0, #84]
	add	r2, r0, #4
	mov	r5, r0
	cmp	r3, r2
	beq	.L390
	ldrb	r0, [r0, #201]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L385
	ldr	r3, [r5, #76]
	add	r2, r5, #520
	add	r5, r5, #712
	mov	r1, r5
	str	r3, [fp, #-56]
	mov	r5, r2
	mov	r3, #0
	mov	r2, r1
.L388:
	ldr	r1, [fp, #-56]
	add	r10, r5, #20
	mov	r8, r5
	str	r5, [fp, #-48]
	mov	r9, r2
	mov	r5, r10
	ldr	r6, [r1, #8]
	mov	r7, #2
	mov	r10, r2
	str	r3, [fp, #-52]
	add	r6, r3, r6, lsl #1
.L387:
	ldr	r1, [r8, #4]!
	mov	r0, #512
	ldr	r4, [r5, #-4]!
	mov	ip, #1
	rsb	r1, r1, r6
	ubfx	r1, r1, #0, #9
	rsb	r4, r6, r4
	cmp	r1, #0
	ubfx	r4, r4, #0, #9
	beq	.L386
	bl	__aeabi_idiv
	mov	ip, r0
.L386:
	mul	r4, ip, r4
	subs	r7, r7, #1
	str	r4, [r9, #4]!
	bne	.L387
	ldr	r3, [fp, #-52]
	add	r2, r10, #8
	ldr	r5, [fp, #-48]
	add	r3, r3, #1
	cmp	r3, #2
	add	r5, r5, #16
	bne	.L388
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L385:
	ldr	r2, [r5, #76]
	ldr	r1, [r3, #8]
	ldr	r3, [r5, #80]
	ldr	r2, [r2, #8]
	ldr	r4, [r3, #8]
	mov	r3, r2, asl #1
	sub	r1, r3, r1, asl #1
	ubfx	r1, r1, #0, #9
	rsb	r3, r3, r4, lsl #1
	cmp	r1, #0
	ubfx	r4, r3, #0, #9
	bne	.L395
.L389:
	mul	r3, r0, r4
	mov	r0, #1
	str	r3, [r5, #716]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L395:
	mov	r0, #512
	bl	__aeabi_idiv
	b	.L389
.L390:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_UpdateTableSymScale, .-AVS_UpdateTableSymScale
	.align	2
	.global	AVS_UpdateTabBBlkDist
	.type	AVS_UpdateTabBBlkDist, %function
AVS_UpdateTabBBlkDist:
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
	ldr	r2, [r0, #84]
	add	r1, r0, #4
	mov	r3, r0
	cmp	r2, r1
	beq	.L399
	ldrb	r0, [r0, #201]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L400
	ldr	r4, [r3, #76]
	mov	r0, #1
	ldr	r1, [r3, #536]
	ldr	r5, [r3, #524]
	ldr	r2, [r4, #8]
	ldr	lr, [r3, #532]
	ldr	ip, [r3, #528]
	mov	r2, r2, asl r0
	rsb	r5, r5, r2
	rsb	ip, ip, r2
	rsb	lr, r2, lr
	rsb	r2, r2, r1
	ubfx	lr, lr, #0, #9
	ubfx	r1, r5, #0, #9
	str	lr, [r3, #740]
	ubfx	r2, r2, #0, #9
	str	r1, [r3, #732]
	ubfx	r1, ip, #0, #9
	str	r2, [r3, #744]
	str	r1, [r3, #736]
	ldr	r2, [r4, #8]
	ldr	r1, [r3, #552]
	ldr	r4, [r3, #540]
	ldr	lr, [r3, #548]
	mov	r2, r2, asl r0
	ldr	ip, [r3, #544]
	add	r2, r2, r0
	rsb	r4, r4, r2
	rsb	lr, r2, lr
	rsb	ip, ip, r2
	rsb	r2, r2, r1
	ubfx	lr, lr, #0, #9
	ubfx	r1, r4, #0, #9
	ubfx	r2, r2, #0, #9
	str	r1, [r3, #748]
	str	lr, [r3, #756]
	ubfx	r1, ip, #0, #9
	str	r2, [r3, #760]
	str	r1, [r3, #752]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L400:
	ldr	r1, [r3, #76]
	ldr	lr, [r3, #80]
	ldr	ip, [r2, #8]
	ldr	r1, [r1, #8]
	ldr	lr, [lr, #8]
	mov	r2, r1, asl #1
	sub	r1, r2, ip, asl #1
	rsb	r2, r2, lr, lsl #1
	ubfx	r1, r1, #0, #9
	ubfx	r2, r2, #0, #9
	str	r1, [r3, #732]
	str	r2, [r3, #740]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L399:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_UpdateTabBBlkDist, .-AVS_UpdateTabBBlkDist
	.align	2
	.global	AVS_UpdatePmvTable
	.type	AVS_UpdatePmvTable, %function
AVS_UpdatePmvTable:
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
	ldr	r4, [r0, #468]
	mov	r5, r0
	cmp	r4, #1
	beq	.L410
	bcc	.L404
	cmp	r4, #2
	bne	.L412
	bl	AVS_UpdateTableIdx2Dist
	mov	r0, r5
	bl	AVS_UpdateTableMvEScale
	mov	r0, r5
	bl	AVS_UpdateTableDirectScale
	mov	r0, r5
	bl	AVS_UpdateTabBBlkDist
	mov	r0, r5
	bl	AVS_UpdateTableSymScale
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L412:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L404:
	ldrb	r4, [r0, #201]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L409
.L410:
	bl	AVS_UpdateTableIdx2Dist
	mov	r0, r5
	bl	AVS_UpdateTableMvEScale
.L409:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_UpdatePmvTable, .-AVS_UpdatePmvTable
	.align	2
	.global	AVS_GetStreamInf
	.type	AVS_GetStreamInf, %function
AVS_GetStreamInf:
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
	UNWIND(.pad #40)
	sub	sp, sp, #40
	add	r4, r0, #12288
	mov	r5, r0
	ldr	r2, [r4, #2744]
	ldrb	r3, [r4, #2760]	@ zero_extendqisi2
	cmp	r2, #1
	str	r3, [r4, #3424]
	beq	.L414
	ldr	r3, [r0, #8]
	cmp	r3, #1
	beq	.L415
.L414:
	ldr	r2, .L512
	movw	r1, #1288
	mov	r0, #20
	bl	dprint_normal
	sub	r3, fp, #36
	mov	ip, #0
	sub	r2, fp, #44
	str	ip, [r3, #-4]!
	sub	r1, fp, #48
	ldr	r0, [r5, #4]
	str	ip, [fp, #-48]
	str	ip, [fp, #-44]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #696]
	cmp	r3, #1
	beq	.L497
.L417:
	ldr	r3, [r4, #2772]
	ldrb	r2, [r4, #2763]	@ zero_extendqisi2
	add	r3, r3, #15
	cmp	r2, #1
	mov	r3, r3, lsr #4
	str	r3, [r4, #2724]
	ldr	r3, [r4, #2776]
	addne	r3, r3, #31
	addeq	r3, r3, #15
	movne	r3, r3, lsr #5
	moveq	r3, r3, lsr #4
	movne	r3, r3, asl #1
	str	r3, [r4, #2728]
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	addeq	r6, r5, #14912
	addeq	r6, r6, #8
	beq	.L425
	ldr	r3, [r4, #2704]
	add	r6, r5, #14912
	ldr	r0, [r5, #4]
	add	r6, r6, #8
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2716]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r1, [r7, #168]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r7, #176]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r7, #184]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r7, #192]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	strd	r2, [r7, #176]
	strd	r2, [r7, #184]
	strd	r2, [r7, #192]
	str	r6, [r4, #2704]
	str	r6, [r4, #2716]
	str	r6, [r4, #2712]
	str	r6, [r4, #2708]
	ldr	r0, [r5, #4]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2636]
.L425:
	add	r1, r5, #16128
	mov	r7, #0
	add	r1, r1, #8
	str	r7, [r4, #3396]
	ldr	r0, [r5, #4]
	bl	FSP_ClearNotInVoQueue
	str	r7, [r4, #2744]
	str	r6, [r4, #2704]
	mov	r0, r5
	str	r6, [r4, #2716]
	str	r6, [r4, #2712]
	str	r6, [r4, #2708]
	bl	AVS_AllocateVHB
	cmp	r0, #3
	mov	ip, r0
	moveq	r7, r0
	beq	.L420
	cmp	r0, r7
	strne	r7, [r4, #2744]
	beq	.L498
.L415:
	ldrb	r1, [r4, #2759]	@ zero_extendqisi2
	mov	r0, r5
	ldr	r3, [r4, #2704]
	ldrb	r2, [r4, #2829]	@ zero_extendqisi2
	str	r1, [r4, #3420]
	strb	r2, [r3]
	bl	AVS_GetImageBuffer
	subs	r7, r0, #0
	beq	.L499
	ldr	r3, [r4, #2704]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L500
	ldr	r3, [r5, #12]
	mvn	r8, #0
	mvn	r9, #0
	ldr	r2, .L512+4
	movw	r1, #1374
	mov	r0, #24
	ldrd	r6, [r3, #32]
	strd	r6, [ip, #208]
	ldr	r3, [r5, #12]
	ldrd	r6, [r3, #48]
	strd	r6, [ip, #216]
	ldr	r3, [r5, #12]
	ldrd	r6, [r3, #64]
	strd	r6, [ip, #224]
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #80]
	str	r3, [ip]
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #84]
	str	r3, [ip, #4]
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #88]
	str	r3, [ip, #8]
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #104]
	str	r3, [ip, #12]
	ldrb	r3, [r4, #2829]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [ip, #20]
	ldr	r3, [r5, #12]
	strd	r8, [r3, #32]
	ldrd	r6, [ip, #216]
	ldr	r3, [r5, #4]
	strd	r6, [sp, #8]
	ldrd	r6, [ip, #208]
	strd	r6, [sp]
	bl	dprint_normal
	ldr	r3, [r4, #2704]
	ldr	r2, [r4, #2860]
	str	r2, [r3, #8]
	ldr	r3, [r4, #2704]
	ldrb	r2, [r4, #2829]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r4, #2704]
	ldr	r2, [r4, #3096]
	strb	r2, [r3, #1]
	ldrb	r2, [r4, #2829]	@ zero_extendqisi2
	ldr	r3, [r4, #2704]
	cmp	r2, #0
	ldrneb	r2, [r4, #2830]	@ zero_extendqisi2
	moveq	r2, #1
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #2829]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L501
.L495:
	add	r6, r5, #14912
	add	r6, r6, #4
.L430:
	ldr	r3, [r4, #3092]
	mov	r0, r6
	add	r6, r5, #16384
	str	r3, [r4, #3428]
	bl	AVS_UpdatePmvTable
	ldr	ip, [r4, #2724]
	ldr	r0, [r4, #2728]
	mov	r3, #0
	str	r3, [r6, #276]
	mov	r3, #1
	str	r3, [r6, #280]
	mov	lr, #6
	mul	r1, r0, ip
	add	r3, r5, #15232
	add	r2, r5, #16896
	add	r3, r3, lr
	add	r2, r2, #142
	sub	r1, r1, #1
	str	r1, [r6, #272]
	ldr	r1, [r4, #3144]
	str	ip, [r6, #336]
	cmp	r1, #0
	add	ip, r1, #63
	str	r0, [r6, #332]
	add	r0, r5, #15360
	movlt	r1, ip
	str	lr, [r6, #288]
	mov	r1, r1, asr lr
	str	r1, [r6, #284]
	ldr	r1, [r4, #3424]
	add	r0, r0, lr
	str	r1, [r6, #340]
	ldr	r1, [r4, #3420]
	str	r1, [r6, #344]
	ldrb	r1, [r4, #2842]	@ zero_extendqisi2
	str	r1, [r6, #348]
	ldrb	r1, [r4, #2841]	@ zero_extendqisi2
	str	r1, [r6, #352]
	ldrb	r1, [r4, #2840]	@ zero_extendqisi2
	str	r1, [r6, #356]
	ldrb	r1, [r4, #2834]	@ zero_extendqisi2
	str	r1, [r6, #360]
	ldrb	r1, [r4, #2833]	@ zero_extendqisi2
	str	r1, [r6, #364]
	ldrb	r1, [r4, #2832]	@ zero_extendqisi2
	str	r1, [r6, #368]
	ldrb	r1, [r4, #2831]	@ zero_extendqisi2
	str	r1, [r6, #372]
	ldrb	r1, [r4, #2830]	@ zero_extendqisi2
	str	r1, [r6, #376]
	ldr	r1, [r4, #3096]
	str	r1, [r6, #380]
	ldrb	r1, [r4, #2829]	@ zero_extendqisi2
	cmp	r1, #0
	moveq	r1, #1
	movne	r1, #3
	str	r1, [r6, #384]
	ldrb	r1, [r4, #2828]	@ zero_extendqisi2
	str	r1, [r6, #388]
	ldr	r1, [r4, #2872]
	str	r1, [r6, #392]
	ldr	r1, [r4, #2868]
	str	r1, [r6, #396]
	ldrb	r1, [r4, #2837]	@ zero_extendqisi2
	str	r1, [r6, #400]
	ldrb	r1, [r4, #2836]	@ zero_extendqisi2
	str	r1, [r6, #404]
	ldr	r1, [r4, #2876]
	str	r1, [r6, #480]
	ldr	r1, [r4, #2884]
	str	r1, [r6, #484]
	ldr	r1, [r4, #2888]
	str	r1, [r6, #492]
	ldr	r1, [r4, #2892]
	str	r1, [r6, #488]
.L433:
	ldrh	r1, [r3, #2]!
	cmp	r3, r0
	strh	r1, [r2, #2]!	@ movhi
	bne	.L433
	ldr	r3, [r4, #3080]
	str	r3, [r6, #496]
	ldr	r3, [r4, #3092]
	str	r3, [r6, #504]
	ldr	r3, [r4, #3088]
	str	r3, [r6, #500]
	ldr	r3, [r4, #2704]
	ldr	r0, [r5, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #2
	ldr	r3, [r4, #2708]
	ldr	r1, [r3, #4]
	beq	.L502
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L503
	ldr	r3, [r4, #2708]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r2, #3
	movne	r2, #1
	str	r2, [r6, #408]
	ldrsb	r2, [r3, #2]
	str	r2, [r6, #412]
	ldr	r2, [ip, #400]
	str	r2, [r6, #432]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r2, #3
	movne	r2, #1
	str	r2, [r6, #424]
	ldrsb	r3, [r3, #2]
	str	r3, [r6, #428]
	ldr	r3, [ip, #400]
	str	r3, [r6, #436]
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	ldrne	r3, [r4, #2712]
	beq	.L504
.L496:
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r2, #3
	movne	r2, #1
	str	r2, [r6, #416]
	ldrsb	r3, [r3, #2]
	str	r3, [r6, #420]
	ldr	r3, [ip, #400]
	str	r3, [r6, #440]
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L505
	ldr	r3, [ip, #20]
	str	r3, [r6, #308]
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L506
	ldr	r3, [ip, #20]
	str	r3, [r6, #312]
	ldr	r3, [r4, #2716]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L507
	ldr	r3, [ip, #20]
	str	r3, [r6, #316]
	ldr	r3, [r4, #2704]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L508
	ldr	r3, [ip, #20]
	str	r3, [r6, #320]
	ldr	r3, [ip, #400]
	str	r3, [r6, #324]
	ldr	r3, [ip, #400]
	str	r3, [r6, #444]
	ldr	r3, [ip, #404]
	str	r3, [r6, #328]
	ldr	r3, [r4, #2708]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r2, #3
	movne	r2, #1
	str	r2, [r6, #448]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	adds	r3, r3, #0
	movne	r3, #1
	str	r3, [r6, #452]
	ldr	r3, [r4, #2704]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetPmvAddr
	str	r0, [r6, #508]
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetPmvAddr
	add	ip, r5, #15424
	add	ip, ip, #44
	mov	r2, #0
	str	r0, [r6, #520]
	add	r0, r5, #16896
	ldr	r3, [r4, #3096]
	add	r0, r0, #8
	cmp	r3, #2
	movne	r1, #0
	moveq	r1, #4
	moveq	lr, #8
	moveq	r7, #16
	movne	r7, #32
	movne	lr, r1
.L454:
	add	r2, r2, #1
	ldr	r3, [ip, #4]!
	cmp	r2, r7
	ubfx	r3, r3, #0, #18
	str	r3, [r0, #4]!
	blt	.L454
	cmp	lr, #0
	ble	.L459
	add	ip, r5, #15552
	add	r0, r5, #16896
	add	ip, ip, #44
	add	r0, r0, #72
	mov	r2, #0
.L458:
	add	r2, r2, #1
	ldr	r3, [ip, #4]!
	cmp	r2, lr
	ubfx	r3, r3, #0, #15
	str	r3, [r0, #4]!
	bne	.L458
.L459:
	cmp	r1, #0
	ble	.L457
	add	r0, r5, #15616
	add	lr, r5, #16896
	add	r0, r0, #32
	add	lr, lr, #104
	mov	ip, #0
.L460:
	ldr	r2, [r0, #4]
	add	ip, ip, #1
	ldr	r3, [r0], #8
	cmp	ip, r1
	ubfx	r2, r2, #0, #9
	ubfx	r3, r3, #0, #9
	orr	r3, r3, r2, asl #9
	str	r3, [lr, #4]!
	bne	.L460
	add	r0, r5, #15616
	add	r5, r5, #16896
	add	r0, r0, #12
	add	r5, r5, #120
	mov	r2, #0
.L461:
	add	r2, r2, #1
	ldr	r3, [r0, #4]!
	cmp	r2, r1
	ubfx	r3, r3, #0, #18
	str	r3, [r5, #4]!
	bne	.L461
.L457:
	ldr	r3, [r4, #3140]
	mov	r7, #1
	str	r3, [r6, #652]
.L420:
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L497:
	ldr	r2, [fp, #-40]
	cmp	r2, #0
	ble	.L509
.L418:
	mov	r7, #3
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L501:
	ldr	r7, [r4, #3096]
	cmp	r7, #0
	bne	.L495
	ldr	r3, [r4, #2704]
	mov	r2, #1
	ldr	r0, [r5, #4]
	add	r6, r5, #14912
	add	r6, r6, #4
	ldr	r1, [r3, #4]
	bl	FSP_SetRef
	ldr	r3, [r4, #2716]
	add	r2, r6, #4
	cmp	r3, r2
	beq	.L431
	mov	r2, r7
	ldr	r1, [r3, #4]
	ldr	r0, [r5, #4]
	bl	FSP_SetRef
.L431:
	ldr	r1, [r4, #2712]
	ldr	r2, [r4, #2708]
	ldr	r3, [r4, #2704]
	str	r1, [r4, #2716]
	str	r2, [r4, #2712]
	str	r3, [r4, #2708]
	b	.L430
.L502:
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L510
	ldr	r3, [r4, #2708]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r2, #3
	movne	r2, #1
	str	r2, [r6, #408]
	ldrsb	r3, [r3, #2]
	str	r3, [r6, #412]
	ldr	r3, [ip, #400]
	str	r3, [r6, #432]
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L511
	ldr	r3, [r4, #2712]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r2, #3
	movne	r2, #1
	str	r2, [r6, #424]
	ldrsb	r3, [r3, #2]
	str	r3, [r6, #428]
	ldr	r3, [ip, #400]
	str	r3, [r6, #436]
	ldr	r3, [r4, #2716]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	ldrne	r3, [r4, #2716]
	bne	.L496
	movw	r3, #1457
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L499:
	ldr	r2, .L512+12
	movw	r1, #1357
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L498:
	ldr	r2, .L512+16
	movw	r1, #1343
	mov	r0, #1
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L509:
	ldr	r2, [fp, #-44]
	cmp	r2, #32
	bgt	.L418
	ldr	r8, [r5, #16]
	cmp	r8, #0
	bne	.L418
	ldr	ip, [r4, #2740]
	cmp	ip, #1
	bls	.L417
	ldr	r2, [r4, #3492]
	cmp	r2, #0
	beq	.L417
	add	r6, r5, #16384
	ldr	r1, [r6, #784]
	cmp	r2, r1
	beq	.L417
	ldr	r0, [r4, #3496]
	ldr	lr, [r6, #788]
	cmp	r0, lr
	beq	.L417
	str	r0, [sp, #16]
	mov	r0, r3
	str	r2, [sp, #12]
	str	r1, [sp, #8]
	movw	r1, #1308
	ldr	r2, .L512+20
	stmia	sp, {ip, lr}
	bl	dprint_normal
	ldr	r2, .L512+24
	ldr	r3, [r4, #3492]
	ldr	r7, [r2]
	str	r3, [r6, #784]
	ldr	r3, [r4, #3496]
	cmp	r7, #0
	str	r3, [r6, #788]
	beq	.L417
	mov	r3, r8
	mov	r2, r8
	mov	r1, #48
	ldr	r0, [r5, #4]
	blx	r7
	b	.L417
.L500:
	movw	r3, #1362
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L505:
	movw	r3, #1481
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L506:
	movw	r3, #1485
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L507:
	movw	r3, #1489
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L504:
	movw	r3, #1474
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L503:
	movw	r3, #1465
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L508:
	movw	r3, #1493
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L511:
	movw	r3, #1451
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L510:
	movw	r3, #1445
	ldr	r2, .L512+8
	mov	r1, r3
	mov	r7, ip
	bl	dprint_normal
	b	.L420
.L513:
	.align	2
.L512:
	.word	.LC95
	.word	.LC99
	.word	.LC93
	.word	.LC98
	.word	.LC97
	.word	.LC96
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	AVS_GetStreamInf, .-AVS_GetStreamInf
	.align	2
	.global	AVS_PrepareDecode
	.type	AVS_PrepareDecode, %function
AVS_PrepareDecode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	bl	AVS_GetStreamInf
	cmp	r0, #3
	ldmeqfd	sp, {fp, sp, pc}
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_PrepareDecode, .-AVS_PrepareDecode
	.align	2
	.global	AVS_VerifyMemPara
	.type	AVS_VerifyMemPara, %function
AVS_VerifyMemPara:
	UNWIND(.fnstart)
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_VerifyMemPara, .-AVS_VerifyMemPara
	.align	2
	.global	AVSDEC_Init
	.type	AVSDEC_Init, %function
AVSDEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	cmpne	r0, #0
	mov	r7, r1
	mov	r4, r0
	moveq	r8, #1
	movne	r8, #0
	beq	.L522
	add	r5, r0, #16384
	ldr	r9, .L524
	add	r6, r0, #16128
	movw	r2, #17176
	ldr	r10, [r5, #96]
	add	r6, r6, #8
	ldr	r3, [r9, #48]
	mov	r1, r8
	blx	r3
	mov	r0, r6
	str	r10, [r5, #96]
	add	r5, r4, #14912
	bl	ResetVoQueue
	str	r7, [r4, #12]
	mov	r0, r4
	add	r7, r4, #15680
	bl	VCTRL_GetChanIDByCtx
	add	r5, r5, #4
	add	r7, r7, #44
	cmn	r0, #1
	str	r0, [r4, #4]
	beq	.L523
	add	r4, r4, #12288
	ldr	r3, [r9, #48]
	mov	r1, r8
	mov	r2, #808
	mov	r0, r5
	add	r5, r5, #4
	blx	r3
	mov	r3, #1024
	mov	r0, #1
	str	r7, [r4, #3124]
	str	r6, [r4, #3148]
	str	r5, [r4, #2704]
	str	r5, [r4, #2716]
	str	r5, [r4, #2712]
	str	r5, [r4, #2708]
	str	r3, [r4, #3144]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L522:
	movw	r3, #2318
	ldr	r2, .L524+4
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L523:
	mov	r0, r8
	ldr	r2, .L524+8
	movw	r1, #2337
	bl	dprint_normal
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L525:
	.align	2
.L524:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC93
	.word	.LC100
	UNWIND(.fnend)
	.size	AVSDEC_Init, .-AVSDEC_Init
	.align	2
	.global	AVSDEC_RecycleImage
	.type	AVSDEC_RecycleImage, %function
AVSDEC_RecycleImage:
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
	beq	.L528
	mov	r2, #0
	ldr	r0, [r4, #4]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L529
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #4]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #4]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L528:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L529:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVSDEC_RecycleImage, .-AVSDEC_RecycleImage
	.align	2
	.global	AVSDEC_FlushRemainImg
	.type	AVSDEC_FlushRemainImg, %function
AVSDEC_FlushRemainImg:
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
	ldr	r3, [r0, #12]
	mov	r5, r0
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L530
	add	r4, r0, #14976
	add	r9, r0, #16128
	add	r9, r9, #8
	mov	r6, #0
	mov	r8, r4
	add	r4, r4, #32
	add	r8, r8, #20
	mov	r7, #0
.L535:
	ldr	r3, [r4, #-4]!
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	r10, r0, #0
	beq	.L533
	ldr	r3, [r4]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L541
.L533:
	cmp	r4, r8
	bne	.L535
.L530:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L541:
	mov	r0, r5
	bl	AVS_SetImgFormat
	ldr	r3, [r4]
	mov	r2, #1
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_SetDisplay
	ldr	r0, [r5, #4]
	mov	r3, r9
	str	r10, [sp]
	mov	r2, r5
	mov	r1, #6
	bl	InsertImgToVoQueue
	cmp	r0, #1
	mov	r0, r5
	beq	.L533
	ldr	r1, [r10, #88]
	bl	AVSDEC_RecycleImage
	ldr	r1, [r10, #168]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	strd	r6, [r10, #168]
	ldr	r1, [r10, #176]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	strd	r6, [r10, #176]
	b	.L533
	UNWIND(.fnend)
	.size	AVSDEC_FlushRemainImg, .-AVSDEC_FlushRemainImg
	.align	2
	.global	AVSDEC_GetImageBuffer
	.type	AVSDEC_GetImageBuffer, %function
AVSDEC_GetImageBuffer:
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
	beq	.L547
	ldr	r0, [r4, #4]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	cmn	r0, #1
	beq	.L548
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L548:
	add	r1, r4, #16128
	ldr	r0, [r4, #4]
	add	r1, r1, #8
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L547:
	movw	r3, #2625
	ldr	r2, .L549
	mov	r1, r3
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L550:
	.align	2
.L549:
	.word	.LC93
	UNWIND(.fnend)
	.size	AVSDEC_GetImageBuffer, .-AVSDEC_GetImageBuffer
	.align	2
	.global	ClearSlice
	.type	ClearSlice, %function
ClearSlice:
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
	add	r4, r1, #4
	add	r8, r1, #12
	mov	r7, r1
	mov	r9, r0
	mov	r6, r1
	mov	r5, #0
.L553:
	ldr	r3, [r4, #4]!
	cmp	r3, #0
	ble	.L552
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L558
.L552:
	cmp	r4, r8
	str	r5, [r4]
	str	r5, [r6], #4
	str	r5, [r7, #16]
	bne	.L553
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L558:
	ldr	r1, [r4, #12]
	mov	r0, r9
	bl	SM_ReleaseStreamSeg
	b	.L552
	UNWIND(.fnend)
	.size	ClearSlice, .-ClearSlice
	.align	2
	.global	AVS_ClearCurPic
	.type	AVS_ClearCurPic, %function
AVS_ClearCurPic:
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
	cmn	r0, #20
	cmpne	r0, #0
	mov	r6, r0
	moveq	r0, #1
	movne	r0, #0
	beq	.L560
	ldr	r3, [r6, #128]
	cmp	r3, #0
	addgt	r5, r6, #580
	movgt	r4, r0
	ble	.L564
.L563:
	mov	r1, r5
	ldr	r0, [r6, #4]
	bl	ClearSlice
	ldr	r3, [r6, #128]
	add	r4, r4, #1
	add	r5, r5, #28
	cmp	r3, r4
	bgt	.L563
.L564:
	mov	r3, #0
	mov	r0, #1
	str	r3, [r6, #128]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L560:
	movw	r3, #2666
	ldr	r2, .L566
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L567:
	.align	2
.L566:
	.word	.LC93
	UNWIND(.fnend)
	.size	AVS_ClearCurPic, .-AVS_ClearCurPic
	.align	2
	.type	AVS_DecodeArbiter.part.5, %function
AVS_DecodeArbiter.part.5:
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
	ldr	r3, [r0, #12]
	mov	r6, r0
	add	r4, r0, #12288
	ldr	r3, [r3, #8]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L583
.L571:
	.word	.L570
	.word	.L572
	.word	.L573
	.word	.L583
	.word	.L570
.L573:
	ldr	r5, [r4, #3816]
	clz	r5, r5
	mov	r5, r5, lsr #5
.L569:
	cmp	r5, #0
	str	r3, [r4, #3392]
	beq	.L589
.L576:
	ldr	r3, [r4, #3816]
	cmp	r3, #1
	beq	.L590
.L579:
	cmp	r3, #2
	bne	.L581
	ldr	r3, [r4, #3396]
	cmp	r3, #1
	ble	.L580
.L581:
	add	r1, r4, #3456
	add	r0, r4, #2736
	add	r1, r1, #12
	mov	r2, #376
	add	r0, r0, #12
	bl	memcpy
	ldrb	lr, [r4, #2829]	@ zero_extendqisi2
	ldr	ip, [r4, #3096]
	movw	r1, #1224
	ldr	r3, [r4, #3408]
	mov	r0, #16
	ldr	r2, .L591
	stmia	sp, {ip, lr}
	bl	dprint_normal
	ldr	r3, [r4, #2732]
	mov	r0, #1
	bic	r3, r3, #311296
	str	r3, [r4, #2732]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L572:
	ldr	r2, [r4, #3392]
	ldr	r5, [r4, #3816]
	cmp	r2, #2
	str	r3, [r4, #3392]
	moveq	r2, #0
	streq	r2, [r4, #3396]
	subs	r5, r5, #2
	movne	r5, #1
	cmp	r5, #0
	bne	.L576
.L589:
	mov	r0, r6
	bl	AVS_ClearCurPic
	ldr	r2, .L591+4
	ldr	r3, [r4, #2732]
	ldr	r7, [r2]
	bic	r3, r3, #311296
	str	r3, [r4, #2732]
	cmp	r7, #0
	beq	.L588
	ldr	r0, [r6, #4]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r7
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L570:
	ldr	r2, [r4, #3392]
	str	r3, [r4, #3392]
	cmp	r2, #2
	ldr	r3, [r4, #3816]
	moveq	r2, #0
	streq	r2, [r4, #3396]
	cmp	r3, #1
	bne	.L579
.L590:
	ldr	r3, [r4, #3396]
	cmp	r3, #0
	bgt	.L581
.L580:
	mov	r0, r6
	bl	AVS_ClearCurPic
	ldr	r2, .L591+4
	ldr	r3, [r4, #2732]
	ldr	r5, [r2]
	bic	r3, r3, #311296
	str	r3, [r4, #2732]
	cmp	r5, #0
	beq	.L588
	mov	r3, #0
	ldr	r0, [r6, #4]
	mov	r2, r3
	mov	r1, #42
	blx	r5
.L588:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L583:
	mov	r5, #1
	b	.L569
.L592:
	.align	2
.L591:
	.word	.LC101
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	AVS_DecodeArbiter.part.5, .-AVS_DecodeArbiter.part.5
	.align	2
	.global	AVS_DecodeArbiter
	.type	AVS_DecodeArbiter, %function
AVS_DecodeArbiter:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #12288
	ldr	r3, [r3, #2732]
	and	r3, r3, #376832
	cmp	r3, #376832
	beq	.L595
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L595:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS_DecodeArbiter.part.5
	UNWIND(.fnend)
	.size	AVS_DecodeArbiter, .-AVS_DecodeArbiter
	.align	2
	.global	AVSDEC_VDMPostProc
	.type	AVSDEC_VDMPostProc, %function
AVSDEC_VDMPostProc:
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
	mov	r5, r0
	mov	r6, r1
	bl	AVS_ClearCurPic
	ldr	r3, .L655
	add	r4, r5, #12288
	add	r0, r5, #20
	movw	r2, #14896
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #3096]
	cmp	r3, #0
	bne	.L597
	str	r6, [r4, #3400]
	ldr	r3, [r5, #12]
	ldr	r2, [r3]
	ldr	r3, [r4, #3400]
	cmp	r2, r3
	blt	.L646
.L602:
	mov	r0, r5
	bl	AVS_SetImgFormat
	ldr	r3, [r4, #2704]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L647
	ldr	r3, [r4, #3412]
	cmp	r3, #0
	strne	r3, [ip, #168]
	movne	r3, #0
	strne	r3, [ip, #172]
	ldr	r2, [r4, #3416]
	mov	r3, #0
	str	r3, [r4, #3412]
	cmp	r2, r3
	strne	r3, [ip, #180]
	strne	r2, [ip, #176]
	mov	r2, #0
	ldr	r3, [r4, #3096]
	str	r2, [r4, #3416]
	cmp	r3, #1
	bls	.L648
.L607:
	ldr	r6, [r4, #2704]
.L612:
	ldr	r1, [r6, #4]
	ldr	r0, [r5, #4]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L649
	add	r3, r5, #14912
	add	r3, r3, #8
	cmp	r6, r3
	beq	.L617
	ldr	r2, [r5, #12]
	ldr	r3, [r4, #3400]
	ldr	r2, [r2, #4]
	cmp	r2, r3
	bge	.L615
	str	r2, [sp]
	movw	r1, #2585
	ldr	r2, .L655+4
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r6, #4]
	mov	r2, #0
	ldr	r0, [r5, #4]
	bl	FSP_SetDisplay
	ldrd	r2, [r7, #168]
	orrs	r1, r2, r3
	bne	.L650
.L616:
	ldrd	r2, [r7, #176]
	orrs	r1, r2, r3
	bne	.L651
.L617:
	mov	r4, #1
.L600:
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L615:
	mov	r0, r6
	mov	r1, r5
	bl	AVS_OutputOneFrame
	subs	r4, r0, #0
	bne	.L617
	ldrd	r2, [r7, #168]
	orrs	r1, r2, r3
	bne	.L652
.L618:
	ldrd	r2, [r7, #176]
	orrs	r1, r2, r3
	beq	.L600
	mov	r1, r2
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #176]
	b	.L600
.L597:
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L653
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r7, [ip, #96]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L654
	ldr	r1, [ip, #96]
	ldr	r2, [r4, #3096]
	add	r1, r7, r1
	add	r1, r6, r1
	cmp	r1, #100
	movge	r1, #100
	str	r1, [r4, #3400]
	ldr	r3, [r5, #12]
	cmp	r2, #2
	ldr	r2, [r3]
	beq	.L602
	ldr	r3, [r4, #3400]
	cmp	r2, r3
	bge	.L602
.L646:
	str	r2, [sp]
	movw	r1, #2532
	ldr	r2, .L655+8
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #2708]
	mov	r2, #0
	str	r2, [r4, #3396]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L603
	ldr	r3, [r4, #2704]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2712]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2716]
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #168]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	add	r3, r5, #14912
	add	r3, r3, #8
	mov	r0, #0
	mov	r1, #0
	strd	r0, [r6, #168]
	strd	r0, [r6, #176]
	strd	r0, [r6, #184]
	strd	r0, [r6, #192]
	str	r3, [r4, #2704]
	str	r3, [r4, #2716]
	str	r3, [r4, #2712]
	str	r3, [r4, #2708]
	ldr	r0, [r5, #4]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2636]
.L603:
	mov	ip, #0
	str	ip, [r4, #3396]
	mov	r4, ip
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L648:
	ldr	r2, [r4, #3396]
	ldrb	r1, [r4, #2829]	@ zero_extendqisi2
	cmp	r2, #1
	addle	r2, r2, #1
	adds	r3, r3, #0
	str	r2, [r4, #3396]
	movne	r3, #1
	cmp	r1, #1
	orreq	r3, r3, #1
	cmp	r3, #0
	beq	.L609
	ldr	r3, [r4, #2704]
	mov	r2, #1
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #4]
	bl	FSP_SetRef
	add	r3, r5, #14912
	ldr	r2, [r4, #2716]
	add	r3, r3, #8
	cmp	r2, r3
	beq	.L610
	ldr	r1, [r2, #4]
	mov	r2, #0
	ldr	r0, [r5, #4]
	bl	FSP_SetRef
.L610:
	ldr	r1, [r4, #2712]
	ldr	r2, [r4, #2708]
	ldr	r3, [r4, #2704]
	str	r1, [r4, #2716]
	str	r2, [r4, #2712]
	str	r3, [r4, #2708]
.L609:
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ldreq	r6, [r4, #2712]
	beq	.L612
	b	.L607
.L651:
	mov	r1, r2
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r4, #1
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #176]
	b	.L600
.L650:
	mov	r1, r2
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	b	.L616
.L652:
	mov	r1, r2
	ldr	r0, [r5, #4]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	b	.L618
.L647:
	movw	r3, #2543
	ldr	r2, .L655+12
	mov	r1, r3
	mov	r4, ip
	bl	dprint_normal
	b	.L600
.L649:
	movw	r3, #2577
	ldr	r2, .L655+12
	mov	r1, r3
	mov	r4, r7
	bl	dprint_normal
	b	.L600
.L653:
	movw	r3, #2517
	ldr	r2, .L655+12
	mov	r1, r3
	mov	r4, ip
	bl	dprint_normal
	b	.L600
.L654:
	movw	r3, #2521
	ldr	r2, .L655+12
	mov	r1, r3
	mov	r4, ip
	bl	dprint_normal
	b	.L600
.L656:
	.align	2
.L655:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC103
	.word	.LC102
	.word	.LC93
	UNWIND(.fnend)
	.size	AVSDEC_VDMPostProc, .-AVSDEC_VDMPostProc
	.align	2
	.global	ClearPacket
	.type	ClearPacket, %function
ClearPacket:
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
	add	r4, r0, #16384
	mov	r5, r0
	ldr	r0, [r0, #4]
	ldr	r1, [r4, #132]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #118]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L658
	ldrb	r3, [r4, #198]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L662
.L658:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L662:
	ldr	r3, [r4, #204]
	cmp	r3, #0
	beq	.L658
	ldr	r1, [r4, #212]
	ldr	r0, [r5, #4]
	bl	SM_ReleaseStreamSeg
	b	.L658
	UNWIND(.fnend)
	.size	ClearPacket, .-ClearPacket
	.align	2
	.global	WriteAvsSliceMsg
	.type	WriteAvsSliceMsg, %function
WriteAvsSliceMsg:
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
	ldr	r3, [r0, #128]
	mov	r4, r0
	cmp	r3, #512
	bge	.L675
	cmp	r3, #0
	addle	r2, r0, #16384
	ble	.L666
	add	r1, r0, #12288
	add	r2, r0, #16384
	sub	r0, r3, #1
	ldr	r1, [r1, #3492]
	ldr	lr, [r2, #112]
	mov	ip, r0, asl #5
	add	r1, r1, #15
	sub	r0, ip, r0, asl #2
	add	r0, r4, r0
	ldrb	ip, [lr, #3]	@ zero_extendqisi2
	mov	r1, r1, lsr #4
	ldr	r0, [r0, #596]
	mul	r1, ip, r1
	cmp	r1, r0
	bls	.L676
.L666:
	mov	lr, r3, asl #2
	mov	r0, r3, asl #5
	ldr	ip, [r2, #124]
	rsb	r1, lr, r0
	add	r1, r4, r1
	cmp	r3, #0
	str	ip, [r1, #580]
	ldr	ip, [r2, #132]
	str	ip, [r1, #600]
	ldr	ip, [r2, #128]
	str	ip, [r1, #588]
	streq	r3, [r4, #596]
	bne	.L677
.L668:
	ldrb	r1, [r2, #118]	@ zero_extendqisi2
	rsb	r0, lr, r0
	add	r3, r3, #1
	cmp	r1, #1
	addne	r0, r4, r0
	addeq	r0, r4, r0
	ldrne	r1, [r2, #204]
	moveq	r2, #0
	streq	r2, [r0, #584]
	streq	r2, [r0, #604]
	strne	r1, [r0, #584]
	ldrne	r1, [r2, #212]
	strne	r1, [r0, #604]
	ldrne	r2, [r2, #208]
	str	r2, [r0, #592]
	mov	r0, #1
	str	r3, [r4, #128]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L677:
	add	r7, r4, #12288
	ldr	r5, [r2, #112]
	ldr	ip, [r7, #3492]
	ldrb	r6, [r5, #3]	@ zero_extendqisi2
	add	ip, ip, #15
	mov	ip, ip, lsr #4
	mul	r6, r6, ip
	str	r6, [r1, #596]
	ldr	r1, [r7, #2772]
	ldr	r5, [r7, #2776]
	add	ip, r1, #15
	add	r5, r5, #15
	mov	r1, ip, lsr #4
	mov	r5, r5, lsr #4
	mul	r1, r1, r5
	sub	r1, r1, #1
	cmp	r6, r1
	movhi	r0, #0
	bls	.L668
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L675:
	mov	r0, #512
	ldr	r2, .L678
	str	r0, [sp]
	movw	r1, #2705
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L676:
	mov	r3, r1
	str	r0, [sp]
	ldr	r2, .L678+4
	movw	r1, #2715
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	ClearPacket
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L679:
	.align	2
.L678:
	.word	.LC104
	.word	.LC105
	UNWIND(.fnend)
	.size	WriteAvsSliceMsg, .-WriteAvsSliceMsg
	.align	2
	.global	AVS_GetPacketState
	.type	AVS_GetPacketState, %function
AVS_GetPacketState:
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
	beq	.L683
	add	r4, r4, #16384
	ldr	r0, [r4, #104]
	subs	r0, r0, #1
	movne	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L683:
	movw	r3, #2766
	ldr	r2, .L684
	mov	r1, r3
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L685:
	.align	2
.L684:
	.word	.LC93
	UNWIND(.fnend)
	.size	AVS_GetPacketState, .-AVS_GetPacketState
	.align	2
	.global	Avs_Vfmw_WQMatrix
	.type	Avs_Vfmw_WQMatrix, %function
Avs_Vfmw_WQMatrix:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 304
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #304)
	sub	sp, sp, #304
	ldr	r7, [r0, #148]
	mov	r3, #0
	ldr	lr, [r0, #132]
	cmp	r7, #1
	str	r3, [fp, #-340]
	str	r3, [fp, #-336]
	str	r3, [fp, #-332]
	str	r3, [fp, #-328]
	str	r3, [fp, #-324]
	str	r3, [fp, #-320]
	beq	.L689
	clz	r3, lr
	cmp	r7, #3
	cmpeq	lr, #0
	mov	r3, r3, lsr #5
	beq	.L689
	cmp	r7, #2
	addeq	r3, r0, #176
	beq	.L691
	cmp	r3, #0
	bne	.L723
.L724:
	sub	lr, fp, #316
	cmp	r7, #0
	mov	r3, #128
	strh	r3, [lr]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	strh	r3, [lr, #6]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	strh	r3, [lr, #10]	@ movhi
	strh	r3, [lr, #12]	@ movhi
	strh	r3, [lr, #14]	@ movhi
	strh	r3, [lr, #16]	@ movhi
	strh	r3, [lr, #18]	@ movhi
	strh	r3, [lr, #20]	@ movhi
	strh	r3, [lr, #22]	@ movhi
	bne	.L773
	ldr	r3, .L779
	add	r2, lr, #10
	add	ip, r3, #12
.L705:
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2, #2]!	@ movhi
	bne	.L705
.L698:
	add	ip, r0, #202
	add	r2, r0, #328
	add	r2, r2, #2
	mov	r1, #128
	mov	r3, ip
.L709:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L709
	ldr	r3, [r0, #128]
	cmp	r3, #0
	beq	.L726
	ldr	r9, [r0, #152]
	mov	r8, #0
	ldr	r3, .L779+4
	mov	r9, r9, asl #6
	add	r6, r9, #64
	add	r9, r3, r9
	add	r6, r3, r6
.L727:
	sub	r3, fp, #292
	mov	r4, r8, asl #3
	add	r5, r3, r8, lsl #7
	sub	r4, r4, r8, asl #1
	sub	r5, r5, #2
	mov	r2, r9
.L717:
	add	r0, r2, #8
	mov	r1, r5
.L715:
	ldrb	r3, [r2], #1	@ zero_extendqisi2
	add	r3, r4, r3
	cmp	r0, r2
	mov	r3, r3, asl #1
	ldrh	r3, [lr, r3]
	strh	r3, [r1, #2]!	@ movhi
	bne	.L715
	cmp	r0, r6
	add	r5, r5, #16
	mov	r2, r0
	bne	.L717
	add	r8, r8, #1
	cmp	r8, #2
	bne	.L727
.L713:
	cmp	r7, #0
	subeq	r3, fp, #166
	subeq	r1, fp, #38
	beq	.L718
	cmp	r7, #1
	beq	.L774
	cmp	r7, #2
	beq	.L775
.L686:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L689:
	ldr	r4, .L779+8
	add	r1, r0, #152
	sub	ip, fp, #340
	add	r3, r0, #176
.L688:
	ldr	r5, [r1, #4]!
	ldrh	r2, [r4], #2
	cmp	r1, r3
	add	r2, r2, r5
	strh	r2, [ip], #2	@ movhi
	bne	.L688
	cmp	r7, #2
	beq	.L691
	cmp	lr, #0
	cmpeq	r7, #3
	bne	.L692
.L691:
	ldr	ip, .L779
	sub	r1, fp, #328
	add	r5, r0, #200
.L693:
	ldr	r4, [r3, #4]!
	ldrh	r2, [ip, #2]!
	cmp	r3, r5
	add	r2, r2, r4
	strh	r2, [r1], #2	@ movhi
	bne	.L693
.L692:
	cmp	lr, #0
	bne	.L724
.L723:
	ldr	r3, .L779+8
	sub	lr, fp, #316
	add	ip, r3, #12
	mov	r5, lr
	mov	r2, lr
.L696:
	ldrh	r1, [r3], #2
	cmp	r3, ip
	strh	r1, [r2], #2	@ movhi
	bne	.L696
	ldr	r3, .L779
	add	r4, lr, #10
	add	ip, r3, #12
	mov	r2, r4
.L697:
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2, #2]!	@ movhi
	bne	.L697
	cmp	r7, #0
	beq	.L698
	cmp	r7, #1
	beq	.L776
	cmp	r7, #2
	beq	.L777
	cmp	r7, #3
	bne	.L698
	sub	r3, fp, #340
	sub	r1, fp, #328
.L703:
	ldrh	r2, [r3], #2
	cmp	r3, r1
	strh	r2, [r5], #2	@ movhi
	bne	.L703
	add	r1, lr, #22
.L704:
	ldrh	r2, [r3], #2
	strh	r2, [r4, #2]!	@ movhi
	cmp	r4, r1
	bne	.L704
	b	.L698
.L718:
	ldrh	r2, [r3, #2]!
	cmp	r3, r1
	strh	r2, [ip, #2]!	@ movhi
	beq	.L686
	ldrh	r2, [r3, #2]!
	cmp	r3, r1
	strh	r2, [ip, #2]!	@ movhi
	bne	.L718
	b	.L686
.L726:
	sub	r0, fp, #166
	add	lr, fp, #90
	mov	r1, #128
.L728:
	sub	r3, r0, #128
.L714:
	add	r2, r3, #16
.L711:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L711
	cmp	r2, r0
	mov	r3, r2
	bne	.L714
	add	r0, r0, #128
	cmp	r0, lr
	bne	.L728
	b	.L713
.L773:
	cmp	r7, #1
	beq	.L778
	cmp	r7, #2
	bne	.L698
	sub	r2, fp, #328
	add	r3, lr, #10
	add	ip, lr, #22
.L708:
	ldrh	r1, [r2], #2
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, ip
	bne	.L708
	b	.L698
.L778:
	sub	r3, fp, #340
	sub	ip, fp, #328
	mov	r2, lr
.L707:
	ldrh	r1, [r3], #2
	cmp	r3, ip
	strh	r1, [r2], #2	@ movhi
	bne	.L707
	b	.L698
.L776:
	sub	r3, fp, #340
	sub	r1, fp, #328
.L700:
	ldrh	r2, [r3], #2
	cmp	r3, r1
	strh	r2, [r5], #2	@ movhi
	bne	.L700
	b	.L698
.L775:
	sub	r3, fp, #166
	sub	r1, fp, #38
.L722:
	ldrh	r2, [r3, #2]!
	cmp	r3, r1
	strh	r2, [ip, #2]!	@ movhi
	bne	.L722
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L774:
	sub	r3, fp, #292
	sub	r1, fp, #166
	sub	r3, r3, #2
.L720:
	ldrh	r2, [r3, #2]!
	cmp	r3, r1
	strh	r2, [ip, #2]!	@ movhi
	bne	.L720
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L777:
	sub	r3, fp, #328
	add	r1, lr, #22
.L702:
	ldrh	r2, [r3], #2
	strh	r2, [r4, #2]!	@ movhi
	cmp	r4, r1
	bne	.L702
	b	.L698
.L780:
	.align	2
.L779:
	.word	.LANCHOR1+10
	.word	.LANCHOR0+116
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	Avs_Vfmw_WQMatrix, .-Avs_Vfmw_WQMatrix
	.align	2
	.global	AVS_ParseHeader
	.type	AVS_ParseHeader, %function
AVS_ParseHeader:
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
	add	r7, r0, #12288
	add	r8, r0, #16384
	mov	r3, #0
	add	r9, r0, #14912
	ldr	r6, [r7, #3124]
	add	r5, r0, #15744
	str	r3, [r8, #104]
	mov	r4, r0
	mov	r1, #32
	add	r9, r9, #4
	mov	r0, r6
	add	r5, r5, #12
	bl	BsShow
	uxtb	r0, r0
	sub	r3, r0, #176
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L782
.L784:
	.word	.L783
	.word	.L785
	.word	.L786
	.word	.L787
	.word	.L788
	.word	.L789
	.word	.L790
	.word	.L791
	.word	.L788
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L782
	.word	.L792
.L782:
	cmp	r0, #175
	bhi	.L788
	ldr	r3, [r7, #2732]
	and	r2, r3, #327680
	cmp	r2, #327680
	beq	.L829
.L788:
	mov	r0, r4
	bl	ClearPacket
.L825:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L787:
	ldr	r3, [r7, #2732]
	ands	r6, r3, #32768
	bne	.L823
	tst	r3, #262144
	beq	.L797
	bic	r3, r3, #311296
	mov	r0, r9
	str	r3, [r7, #2732]
	mov	r1, r5
	bl	AVS_i_picture_header
	b	.L827
.L789:
	ldr	r3, [r7, #2732]
	tst	r3, #327680
	beq	.L801
	mov	r1, r5
	mov	r0, r9
	bl	AVS_extension
	mov	r0, r4
	bl	ClearPacket
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L790:
	ldr	r3, [r7, #2732]
	ands	r6, r3, #32768
	bne	.L823
	tst	r3, #262144
	beq	.L799
	bic	r3, r3, #311296
	mov	r0, r9
	str	r3, [r7, #2732]
	mov	r1, r5
	bl	AVS_pb_picture_header
.L827:
	mov	r0, r5
	bl	Avs_Vfmw_WQMatrix
	mov	r0, r4
	bl	ClearPacket
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L791:
	ldr	r3, [r7, #2732]
	ands	r5, r3, #32768
	bne	.L822
	tst	r3, #327680
	beq	.L825
.L828:
	bic	r3, r3, #311296
	mov	r0, r4
	str	r3, [r7, #2732]
	bl	ClearPacket
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L792:
	mov	r1, #32
	mov	r0, r6
	bl	BsSkip
	mov	r1, #32
	mov	r0, r6
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r6
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L801
	mov	r5, #1
	strb	r5, [r4]
	str	r5, [r8, #104]
	mov	r0, r4
	ldr	r3, [r7, #2732]
	orr	r3, r3, #16384
	str	r3, [r7, #2732]
	bl	ClearPacket
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L785:
	ldr	r3, [r7, #2732]
	ands	r5, r3, #32768
	bne	.L822
	tst	r3, #327680
	beq	.L788
	b	.L828
.L786:
	ldr	r3, [r7, #2732]
	ands	r1, r3, #262144
	movne	r1, #1
	bne	.L824
	tst	r3, #65536
	beq	.L801
.L824:
	mov	r0, r4
	bl	AVS_user_data
	mov	r0, r4
	bl	ClearPacket
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L783:
	ldr	r3, [r7, #2732]
	ands	r6, r3, #32768
	bne	.L822
	tst	r3, #65536
	beq	.L795
	bic	r3, r3, #311296
	mov	r1, r5
	str	r3, [r7, #2732]
	mov	r0, r4
	bl	AVS_sequence_header
	mov	r0, r4
	bl	ClearPacket
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L829:
	orr	r3, r3, #32768
	mov	r0, r4
	str	r3, [r7, #2732]
	bl	WriteAvsSliceMsg
	cmp	r0, #0
	bne	.L825
.L801:
	mov	r0, r4
	bl	ClearPacket
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L822:
	mov	r0, #1
	orr	r3, r3, #16384
	str	r0, [r8, #104]
	str	r3, [r7, #2732]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L799:
	mov	r0, r9
	mov	r1, r5
	bl	AVS_pb_picture_header
.L826:
	mov	r0, r5
	bl	Avs_Vfmw_WQMatrix
	mov	r0, r4
	bl	ClearPacket
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L797:
	mov	r0, r9
	mov	r1, r5
	bl	AVS_i_picture_header
	b	.L826
.L795:
	mov	r1, r5
	mov	r0, r4
	bl	AVS_sequence_header
	mov	r0, r4
	bl	ClearPacket
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L823:
	orr	r3, r3, #16384
	mov	r0, r5
	mov	r4, #1
	str	r4, [r8, #104]
	str	r3, [r7, #2732]
	bl	Avs_Vfmw_WQMatrix
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS_ParseHeader, .-AVS_ParseHeader
	.align	2
	.global	AVSDEC_Decode
	.type	AVSDEC_Decode, %function
AVSDEC_Decode:
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
	beq	.L844
	add	r0, r0, #15680
	ldr	r2, [r1, #16]
	add	r0, r0, #44
	ldr	r1, [r1]
	bl	BsInit
	ldr	r3, .L847
	add	r6, r4, #12288
	add	r0, r4, #16384
	mov	r1, r5
	mov	r2, #160
	ldr	r3, [r3, #52]
	add	r0, r0, #112
	blx	r3
	ldr	r3, [r6, #2732]
	mov	r0, r4
	str	r3, [r6, #3432]
	bl	AVS_ParseHeader
	subs	r5, r0, #0
	beq	.L845
	ldr	r3, [r6, #2732]
	and	r3, r3, #376832
	cmp	r3, #376832
	beq	.L834
.L835:
	mov	r5, #0
.L832:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L844:
	mov	r3, #2368
	ldr	r2, .L847+4
	mov	r1, r3
	mov	r5, #0
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L845:
	ldr	r2, .L847+8
	movw	r1, #2382
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	AVS_ClearCurPic
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L834:
	mov	r0, r4
	bl	AVS_DecodeArbiter.part.5
	cmp	r0, #0
	beq	.L835
	mov	r0, r4
	bl	AVS_GetStreamInf
	cmp	r0, #3
	beq	.L836
	adds	r5, r0, #0
	movne	r5, #1
	cmp	r5, #0
	beq	.L846
	mov	r0, r4
	bl	AVS_StartDecode
	subs	r3, r0, #0
	bne	.L832
	ldr	r2, .L847+12
	movw	r1, #2413
	mov	r0, #1
	mov	r5, r3
	bl	dprint_normal
	mov	r0, r4
	bl	AVS_ClearCurPic
	b	.L832
.L846:
	ldr	r2, .L847+16
	movw	r1, #2404
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	AVS_ClearCurPic
	b	.L832
.L836:
	ldr	r3, [r6, #3432]
	mov	r5, r0
	str	r3, [r6, #2732]
	b	.L832
.L848:
	.align	2
.L847:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC93
	.word	.LC106
	.word	.LC108
	.word	.LC107
	UNWIND(.fnend)
	.size	AVSDEC_Decode, .-AVSDEC_Decode
	.global	wq_param_default
	.global	g_AvsCfg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12612, %object
	.size	__func__.12612, 20
__func__.12612:
	.ascii	"AVS_sequence_header\000"
	.type	frame_rate_Table, %object
	.size	frame_rate_Table, 64
frame_rate_Table:
	.word	0
	.word	23976
	.word	24000
	.word	25000
	.word	29970
	.word	30000
	.word	50000
	.word	59940
	.word	60000
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.type	__func__.12703, %object
	.size	__func__.12703, 16
__func__.12703:
	.ascii	"AVS_AllocateVHB\000"
	.type	CSWTCH.51, %object
	.size	CSWTCH.51, 16
CSWTCH.51:
	.word	5
	.word	1
	.word	2
	.word	3
	.type	WeightQuantModel, %object
	.size	WeightQuantModel, 256
WeightQuantModel:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	5
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	wq_param_default, %object
	.size	wq_param_default, 24
wq_param_default:
	.short	135
	.short	143
	.short	143
	.short	160
	.short	160
	.short	213
	.short	128
	.short	98
	.short	106
	.short	116
	.short	116
	.short	128
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%-40s     %#-8x(%db)\012\000" )
	.space	2
.LC1:
	ASCII(.ascii	"video_sequence_start_code\000" )
	.space	2
.LC2:
	ASCII(.ascii	"profile_id\000" )
	.space	1
.LC3:
	ASCII(.ascii	"level_id\000" )
	.space	3
.LC4:
	ASCII(.ascii	"progressive_sequence\000" )
	.space	3
.LC5:
	ASCII(.ascii	"horizontal_size\000" )
.LC6:
	ASCII(.ascii	"vertical_size\000" )
	.space	2
.LC7:
	ASCII(.ascii	"chroma_format\000" )
	.space	2
.LC8:
	ASCII(.ascii	"sample_precision\000" )
	.space	3
.LC9:
	ASCII(.ascii	"aspect_ratio\000" )
	.space	3
.LC10:
	ASCII(.ascii	"frame_rate_code\000" )
.LC11:
	ASCII(.ascii	"bit_rate_lower\000" )
	.space	1
.LC12:
	ASCII(.ascii	"marker_bit\000" )
	.space	1
.LC13:
	ASCII(.ascii	"bit_rate_upper\000" )
	.space	1
.LC14:
	ASCII(.ascii	"low_delay\000" )
	.space	2
.LC15:
	ASCII(.ascii	"bbv_buffer_size\000" )
.LC16:
	ASCII(.ascii	"reserved_bits\000" )
	.space	2
.LC17:
	ASCII(.ascii	"%s: not support solution(w = %d, h = %d)\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"i_picture_start_code\000" )
	.space	3
.LC19:
	ASCII(.ascii	"bbv_delay\000" )
	.space	2
.LC20:
	ASCII(.ascii	"bbv_delay_extension\000" )
.LC21:
	ASCII(.ascii	"time_code_flag\000" )
	.space	1
.LC22:
	ASCII(.ascii	"time_code\000" )
	.space	2
.LC23:
	ASCII(.ascii	"picture_distance\000" )
	.space	3
.LC24:
	ASCII(.ascii	"bbv_check_times\000" )
.LC25:
	ASCII(.ascii	"progressive_frame\000" )
	.space	2
.LC26:
	ASCII(.ascii	"picture_structure\000" )
	.space	2
.LC27:
	ASCII(.ascii	"top_field_first\000" )
.LC28:
	ASCII(.ascii	"repeat_first_field\000" )
	.space	1
.LC29:
	ASCII(.ascii	"fixed_picture_qp\000" )
	.space	3
.LC30:
	ASCII(.ascii	"picture_qp\000" )
	.space	1
.LC31:
	ASCII(.ascii	"skip_mode_flag\000" )
	.space	1
.LC32:
	ASCII(.ascii	"loop_filter_disable\000" )
.LC33:
	ASCII(.ascii	"loop_filter_parameter_flag\000" )
	.space	1
.LC34:
	ASCII(.ascii	"alpha_c_offset\000" )
	.space	1
.LC35:
	ASCII(.ascii	"beta_offset\000" )
.LC36:
	ASCII(.ascii	"weighting_quant_flag\000" )
	.space	3
.LC37:
	ASCII(.ascii	"aec_enable\000" )
	.space	1
.LC38:
	ASCII(.ascii	"mb_adapt_weighting_quant_disable\000" )
	.space	3
.LC39:
	ASCII(.ascii	"chroma_quant_param_disable\000" )
	.space	1
.LC40:
	ASCII(.ascii	"chroma_quant_param_delta_u\000" )
	.space	1
.LC41:
	ASCII(.ascii	"chroma_quant_param_delta_v\000" )
	.space	1
.LC42:
	ASCII(.ascii	"weighting_quant_param_index\000" )
.LC43:
	ASCII(.ascii	"weighting_quant_model\000" )
	.space	2
.LC44:
	ASCII(.ascii	"weighting_quant_param_deltal1\000" )
	.space	2
.LC45:
	ASCII(.ascii	"weighting_quant_param_deltal2\000" )
	.space	2
.LC46:
	ASCII(.ascii	"pb_picture_start_code\000" )
	.space	2
.LC47:
	ASCII(.ascii	"picture_coding_type\000" )
.LC48:
	ASCII(.ascii	"advanced_pred_mode_disable\000" )
	.space	1
.LC49:
	ASCII(.ascii	"picture_reference_flag\000" )
	.space	1
.LC50:
	ASCII(.ascii	"no_forward_reference_flag\000" )
	.space	2
.LC51:
	ASCII(.ascii	"b_filed_enhanced_flag\000" )
	.space	2
.LC52:
	ASCII(.ascii	"p_filed_enhanced_flag\000" )
	.space	2
.LC53:
	ASCII(.ascii	"user_data_start_code\000" )
	.space	3
.LC54:
	ASCII(.ascii	"extension_ID\000" )
	.space	3
.LC55:
	ASCII(.ascii	"video_format\000" )
	.space	3
.LC56:
	ASCII(.ascii	"sample_range\000" )
	.space	3
.LC57:
	ASCII(.ascii	"colour_description\000" )
	.space	1
.LC58:
	ASCII(.ascii	"colour_primaries\000" )
	.space	3
.LC59:
	ASCII(.ascii	"transfer_characteristics\000" )
	.space	3
.LC60:
	ASCII(.ascii	"matrix_coefficients\000" )
.LC61:
	ASCII(.ascii	"display_horizontal_size\000" )
.LC62:
	ASCII(.ascii	"display_vertical_size\000" )
	.space	2
.LC63:
	ASCII(.ascii	"copyright_flag\000" )
	.space	1
.LC64:
	ASCII(.ascii	"copyright_id\000" )
	.space	3
.LC65:
	ASCII(.ascii	"original_or_copy\000" )
	.space	3
.LC66:
	ASCII(.ascii	"copyright_number_1\000" )
	.space	1
.LC67:
	ASCII(.ascii	"copyright_number_2\000" )
	.space	1
.LC68:
	ASCII(.ascii	"copyright_number_3\000" )
	.space	1
.LC69:
	ASCII(.ascii	"camera_id\000" )
	.space	2
.LC70:
	ASCII(.ascii	"height_of_image_device\000" )
	.space	1
.LC71:
	ASCII(.ascii	"focal_length\000" )
	.space	3
.LC72:
	ASCII(.ascii	"f_number\000" )
	.space	3
.LC73:
	ASCII(.ascii	"vertical_angle_of_view\000" )
	.space	1
.LC74:
	ASCII(.ascii	"camera_position_x_upper\000" )
.LC75:
	ASCII(.ascii	"camera_position_x_lower\000" )
.LC76:
	ASCII(.ascii	"camera_position_y_upper\000" )
.LC77:
	ASCII(.ascii	"camera_position_y_lower\000" )
.LC78:
	ASCII(.ascii	"camera_position_z_upper\000" )
.LC79:
	ASCII(.ascii	"camera_position_z_lower\000" )
.LC80:
	ASCII(.ascii	"camera_direction_x\000" )
	.space	1
.LC81:
	ASCII(.ascii	"camera_direction_y\000" )
	.space	1
.LC82:
	ASCII(.ascii	"camera_direction_z\000" )
	.space	1
.LC83:
	ASCII(.ascii	"image_plane_vertical_x\000" )
	.space	1
.LC84:
	ASCII(.ascii	"image_plane_vertical_y\000" )
	.space	1
.LC85:
	ASCII(.ascii	"image_plane_vertical_z\000" )
	.space	1
.LC86:
	ASCII(.ascii	"frame_centre_horizontal_offset\000" )
	.space	1
.LC87:
	ASCII(.ascii	"frame_centre_vertical_offset\000" )
	.space	3
.LC88:
	ASCII(.ascii	"extension_start_code\000" )
	.space	3
.LC89:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC90:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC91:
	ASCII(.ascii	"line: %d pImage is null\012\000" )
	.space	3
.LC92:
	ASCII(.ascii	"ERROR: get frame store fail!\012\000" )
	.space	2
.LC93:
	ASCII(.ascii	"line: %d\012\000" )
	.space	2
.LC94:
	ASCII(.ascii	"ERROR: AVS_OutputOneFrame is err(%d)\012\000" )
	.space	2
.LC95:
	ASCII(.ascii	"size change\012\000" )
	.space	3
.LC96:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC97:
	ASCII(.ascii	"ERROR: allocate vhb\012\000" )
	.space	3
.LC98:
	ASCII(.ascii	"ERROR: get img buf err\012\000" )
.LC99:
	ASCII(.ascii	"Chan:%d dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC101:
	ASCII(.ascii	"-----Pic %5d, type %d, struct %d-----\012\000" )
	.space	1
.LC102:
	ASCII(.ascii	"ERROR: err_level(%d) over ref_thr(%d)\012\000" )
	.space	1
.LC103:
	ASCII(.ascii	"ERROR: err_level(%d) over out_thr(%d)\012\000" )
	.space	1
.LC104:
	ASCII(.ascii	"SlcNum %d > %d Write slice msg failed\012\000" )
	.space	1
.LC105:
	ASCII(.ascii	"This slice's start mbn %d <= LastSliceFirstMb %d, W" )
	ASCII(.ascii	"rite slice msg failed\012\000" )
	.space	2
.LC106:
	ASCII(.ascii	"ERROR: paseHeader err\012\000" )
	.space	1
.LC107:
	ASCII(.ascii	"ERROR: AVS_PrepareDecode err\012\000" )
	.space	2
.LC108:
	ASCII(.ascii	"ERROR: AVS_StartDecode err\012\000" )
	.bss
	.align	2
	.type	g_AvsCfg, %object
	.size	g_AvsCfg, 512
g_AvsCfg:
	.space	512
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
