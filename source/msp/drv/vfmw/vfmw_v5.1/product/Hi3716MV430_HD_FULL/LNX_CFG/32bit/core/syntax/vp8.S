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
	.file	"vp8.c"
	.text
	.align	2
	.type	VP8_init_frame.part.0, %function
VP8_init_frame.part.0:
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
	ldr	r6, .L2
	mov	r4, r0
	ldr	r7, .L2+4
	add	r0, r0, #2368
	mov	r2, #38
	add	r0, r0, #6
	ldr	r3, [r6, #52]
	mov	r1, r7
	ldr	r5, .L2+8
	blx	r3
	add	r0, r4, #1312
	add	r1, r7, #40
	ldr	r3, [r6, #52]
	mov	r2, #1056
	add	r0, r0, #6
	blx	r3
	add	r0, r4, #1296
	mov	r1, r5
	ldr	r3, [r6, #52]
	mov	r2, #4
	add	r0, r0, #14
	blx	r3
	add	r0, r4, #1312
	add	r1, r5, #4
	ldr	r3, [r6, #52]
	mov	r5, #0
	mov	r2, #3
	add	r0, r0, #2
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #8
	mov	r1, r5
	add	r0, r4, #22
	blx	r3
	strb	r5, [r4, #17]
	mov	r1, r5
	ldr	r3, [r6, #48]
	mov	r2, #4
	add	r0, r4, #32
	blx	r3
	ldr	r3, [r6, #48]
	mov	r1, r5
	add	r0, r4, #36
	mov	r2, #4
	blx	r3
	mov	r3, #1
	strb	r5, [r4, #43]
	strb	r5, [r4, #44]
	strb	r5, [r4, #48]
	strb	r5, [r4, #49]
	strb	r3, [r4, #41]
	strb	r3, [r4, #42]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	VP8_init_frame.part.0, .-VP8_init_frame.part.0
	.align	2
	.global	Vp8_Vfmw_StartBoolDecode
	.type	Vp8_Vfmw_StartBoolDecode, %function
Vp8_Vfmw_StartBoolDecode:
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
	mov	r2, #255
	mov	r0, r1
	mov	r3, #16
	str	r2, [r4]
	mov	r1, #24
	str	r3, [r4, #8]
	bl	BsGet
	str	r0, [r4, #4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp8_Vfmw_StartBoolDecode, .-Vp8_Vfmw_StartBoolDecode
	.align	2
	.global	Vp8_Vfmw_DecodeBool
	.type	Vp8_Vfmw_DecodeBool, %function
Vp8_Vfmw_DecodeBool:
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
	mov	r7, r0
	mov	r8, r1
	ldmia	r0, {r0, r1}
	ldr	r6, [r7, #8]
	sub	r5, r0, #1
	mul	r2, r5, r2
	mov	r5, r2, lsr #8
	ldr	r2, .L13
	add	r5, r5, #1
	mov	r3, r5, asl #16
	cmp	r1, r3
	rsbcs	r5, r5, r0
	rsbcs	r1, r3, r1
	add	r2, r2, r5
	movcs	r9, #1
	movcc	r9, #0
	ldrb	r3, [r2, #1096]	@ zero_extendqisi2
	subs	r6, r6, r3
	mov	r5, r5, asl r3
	mov	r10, r1, asl r3
	bmi	.L12
.L7:
	mov	r0, r9
	str	r6, [r7, #8]
	stmia	r7, {r5, r10}
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L12:
	rsbs	r3, r6, #8
	str	r3, [fp, #-48]
	bmi	.L7
	mov	r4, r3
.L8:
	mov	r1, #8
	mov	r0, r8
	bl	BsGet
	orr	r10, r10, r0, asl r4
	subs	r4, r4, #8
	bpl	.L8
	ldr	r3, [fp, #-48]
	add	r6, r6, #8
	bic	r3, r3, #7
	add	r6, r6, r3
	b	.L7
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp8_Vfmw_DecodeBool, .-Vp8_Vfmw_DecodeBool
	.align	2
	.global	Vp8_Vfmw_DecodeValue
	.type	Vp8_Vfmw_DecodeValue, %function
Vp8_Vfmw_DecodeValue:
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
	subs	r4, r2, #1
	mov	r5, #0
	mov	r6, r0
	mov	r7, r1
	bmi	.L16
.L17:
	mov	r2, #128
	mov	r1, r7
	mov	r0, r6
	bl	Vp8_Vfmw_DecodeBool
	orr	r5, r5, r0, asl r4
	subs	r4, r4, #1
	bcs	.L17
.L16:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp8_Vfmw_DecodeValue, .-Vp8_Vfmw_DecodeValue
	.align	2
	.global	VP8_SetImgFormat
	.type	VP8_SetImgFormat, %function
VP8_SetImgFormat:
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
	add	r5, r0, #4096
	add	r0, r0, #8192
	ldr	r1, [r5, #4072]
	ldr	r0, [r0, #344]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, [r5, #4076]
	mov	lr, #1
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	mov	r5, #5
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	and	ip, r1, #3
	bfi	r2, r1, #0, #2
	str	ip, [r4, #24]
	and	r3, r3, #252
	and	r2, r2, #227
	orr	r3, r3, #12
	bfi	r2, r5, #5, #3
	bfi	r3, lr, #4, #2
	strb	r2, [r4, #156]
	strb	r3, [r4, #157]
	mov	r1, #0
	ldr	r3, [r4, #156]
	str	ip, [r4, #28]
	bfc	r3, #14, #3
	str	r3, [r4, #156]
	bl	SetAspectRatio
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #36]
	mov	r2, r2, lsr #1
	str	r2, [r4, #48]
	mov	r3, r3, lsr #1
	str	r3, [r4, #52]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP8_SetImgFormat, .-VP8_SetImgFormat
	.align	2
	.global	VP8DEC_VDMPostProc
	.type	VP8DEC_VDMPostProc, %function
VP8DEC_VDMPostProc:
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
	mov	r5, r0
	add	r4, r0, #4096
	mov	r8, r1
	mov	r0, #13
	mov	r1, r5
	bl	ReleasePacket
	ldr	r3, [r4, #4036]
	cmp	r3, #2
	beq	.L90
.L26:
	ldr	r7, [r5, #3284]
	clz	r7, r7
	mov	r7, r7, lsr #5
.L27:
	add	r6, r5, #8192
	ldr	r1, [r4, #4072]
	ldr	r0, [r6, #344]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	beq	.L91
	cmp	r8, #0
	blt	.L30
	cmp	r8, #100
	movge	r8, #100
	str	r8, [r3, #96]
	ldr	r3, [r5]
	ldr	r3, [r3]
	cmp	r8, r3
	bhi	.L92
.L31:
	mov	r0, r5
	bl	VP8_SetImgFormat
	cmp	r7, #0
	beq	.L93
.L32:
	ldr	r2, [r4, #4076]
	ldr	r3, [r4, #4040]
	cmp	r2, #0
	ldr	r8, [r4, #4068]
	add	r3, r3, #1
	str	r3, [r4, #4040]
	bne	.L94
	ldr	r3, [r4, #4060]
	cmp	r8, r3
	beq	.L38
.L36:
	ldr	r3, [r4, #4064]
	cmp	r8, r3
	beq	.L38
	ldr	r1, [r4, #4072]
	subs	r9, r8, r1
	movne	r9, #1
.L37:
	str	r1, [r4, #4068]
	mov	r2, #1
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L35:
	ldrb	r3, [r5, #3268]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L95
	cmp	r3, #2
	beq	.L96
.L41:
	ldrb	r3, [r5, #3267]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L97
	cmp	r3, #2
	beq	.L98
.L46:
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	beq	.L49
	ldrb	r3, [r5, #3265]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L50
.L49:
	ldr	r3, [r4, #4060]
	ldr	r2, [r4, #4068]
	cmp	r3, r2
	beq	.L88
	ldr	r2, [r4, #4064]
	cmp	r3, r2
	beq	.L88
	ldr	r1, [r4, #4072]
	cmp	r3, r1
	beq	.L52
	mov	r1, r3
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L88:
	ldr	r1, [r4, #4072]
.L52:
	str	r1, [r4, #4060]
	mov	r2, #1
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L50:
	ldr	r3, [r5, #3280]
	cmp	r3, #0
	beq	.L54
	ldrb	r3, [r5, #3266]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L55
.L54:
	ldr	r3, [r4, #4064]
	ldr	r2, [r4, #4068]
	cmp	r3, r2
	beq	.L89
	ldr	r2, [r4, #4060]
	cmp	r3, r2
	beq	.L89
	ldr	r1, [r4, #4072]
	cmp	r3, r1
	beq	.L57
	mov	r1, r3
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L89:
	ldr	r1, [r4, #4072]
.L57:
	str	r1, [r4, #4064]
	mov	r2, #1
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L55:
	cmp	r9, #1
	beq	.L99
.L59:
	cmp	r7, #0
	moveq	r0, #1
	beq	.L87
	ldr	r0, [r6, #344]
	mov	r2, #0
	ldr	r1, [r4, #4072]
	bl	FSP_SetDisplay
	mov	r0, #1
.L87:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L94:
	ldrb	r9, [r5, #3264]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L35
	ldr	r3, [r4, #4060]
	cmp	r8, r3
	bne	.L36
.L38:
	ldr	r1, [r4, #4072]
	mov	r9, #0
	b	.L37
.L90:
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	movne	r7, #1
	bne	.L27
	b	.L26
.L93:
	ldr	r1, [r4, #4072]
	ldr	r0, [r6, #344]
	bl	FSP_GetFsImagePtr
	subs	r10, r0, #0
	beq	.L100
	mov	r2, #1
	ldr	r1, [r4, #4072]
	ldr	r0, [r6, #344]
	bl	FSP_SetDisplay
	add	r3, r5, #8128
	ldr	r0, [r6, #344]
	add	r3, r3, #56
	str	r10, [sp]
	mov	r2, r5
	mov	r1, #13
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L32
	str	r0, [fp, #-48]
	mov	r8, #0
	ldr	r1, [r10, #168]
	mov	r9, #0
	ldr	r0, [r6, #344]
	bl	FreeUsdByDec
	strd	r8, [r10, #168]
	ldr	r1, [r10, #176]
	ldr	r0, [r6, #344]
	bl	FreeUsdByDec
	strd	r8, [r10, #176]
	mov	r2, r7
	ldr	r1, [r4, #4072]
	ldr	r0, [r6, #344]
	bl	FSP_SetDisplay
	mov	r0, r7
	ldr	r2, .L101
	movw	r1, #587
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L30:
	mov	r2, #0
	str	r2, [r3, #96]
	b	.L31
.L97:
	ldr	r1, [r4, #4060]
	ldr	r3, [r4, #4068]
	cmp	r1, r3
	beq	.L45
	ldr	r3, [r4, #4064]
	cmp	r1, r3
	cmpne	r8, r1
	beq	.L45
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L45:
	str	r8, [r4, #4060]
	mov	r2, #1
	ldr	r0, [r6, #344]
	mov	r1, r8
	bl	FSP_SetRef
	mov	r9, #0
	b	.L46
.L95:
	ldr	r1, [r4, #4064]
	ldr	r3, [r4, #4068]
	cmp	r1, r3
	beq	.L40
	ldr	r3, [r4, #4060]
	cmp	r1, r3
	cmpne	r8, r1
	beq	.L40
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
.L40:
	str	r8, [r4, #4064]
	mov	r2, #1
	ldr	r0, [r6, #344]
	mov	r1, r8
	bl	FSP_SetRef
	mov	r9, #0
	b	.L41
.L98:
	ldr	r3, [r4, #4060]
	ldr	r2, [r4, #4068]
	ldr	r1, [r4, #4064]
	cmp	r3, r2
	beq	.L48
	cmp	r3, r1
	beq	.L48
	mov	r1, r3
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
	ldr	r1, [r4, #4064]
.L48:
	str	r1, [r4, #4060]
	mov	r2, #1
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
	b	.L46
.L96:
	ldr	r3, [r4, #4064]
	ldr	r2, [r4, #4068]
	ldr	r1, [r4, #4060]
	cmp	r3, r2
	beq	.L43
	cmp	r3, r1
	beq	.L43
	mov	r1, r3
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
	ldr	r1, [r4, #4060]
.L43:
	str	r1, [r4, #4064]
	mov	r2, #1
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
	b	.L41
.L99:
	mov	r1, r8
	mov	r2, #0
	ldr	r0, [r6, #344]
	bl	FSP_SetRef
	b	.L59
.L92:
	ldr	r2, .L101+4
	movw	r1, #557
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r8
	bl	dprint_normal
	ldr	r1, [r4, #4060]
	ldr	r0, [r6, #344]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #4064]
	ldr	r0, [r6, #344]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #4068]
	ldr	r0, [r6, #344]
	bl	FSP_ClearLogicFs
	ldr	r0, [r6, #344]
	bl	FSP_GetNullLogicFs
	mov	r2, #0
	str	r2, [r4, #4040]
	mov	r3, r0
	str	r0, [r4, #4068]
	str	r0, [r4, #4064]
	mvn	r0, #0
	str	r3, [r4, #4060]
	b	.L87
.L91:
	ldr	r2, .L101+8
	movw	r1, #549
	bl	dprint_normal
	mvn	r0, #0
	b	.L87
.L100:
	mov	r3, #572
	ldr	r2, .L101+12
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L87
.L102:
	.align	2
.L101:
	.word	.LC4
	.word	.LC2
	.word	.LC1
	.word	.LC3
	UNWIND(.fnend)
	.size	VP8DEC_VDMPostProc, .-VP8DEC_VDMPostProc
	.align	2
	.global	VP8DEC_Init
	.type	VP8DEC_Init, %function
VP8DEC_Init:
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
	ldr	r3, .L107
	add	r5, r0, #8192
	movw	r2, #8552
	mov	r6, r1
	ldr	r7, [r5, #336]
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r4, r0
	blx	r3
	add	r0, r4, #8128
	add	r0, r0, #56
	str	r7, [r5, #336]
	bl	ResetVoQueue
	mov	r0, r4
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r5, #344]
	beq	.L106
	add	r3, r4, #4096
	str	r6, [r4]
	mov	r1, #0
	mov	r2, #1024
	str	r1, [r3, #4044]
	mov	r0, #1
	str	r2, [r3, #4032]
	mov	r2, #3
	str	r1, [r3, #4052]
	str	r2, [r3, #4080]
	str	r2, [r3, #4048]
	ldr	r2, [r6, #8]
	str	r2, [r3, #4036]
	ldr	r2, [r6, #20]
	str	r2, [r3, #4056]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L106:
	ldr	r3, .L107+4
	mov	r1, #708
	ldr	r2, .L107+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L108:
	.align	2
.L107:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1352
	.word	.LC5
	UNWIND(.fnend)
	.size	VP8DEC_Init, .-VP8DEC_Init
	.align	2
	.global	VP8_setup_version
	.type	VP8_setup_version, %function
VP8_setup_version:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #64]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L110
.L112:
	.word	.L110
	.word	.L113
	.word	.L114
	.word	.L115
.L110:
	mov	r3, #0
	str	r3, [r0, #76]
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	str	r3, [r0, #88]
	mov	r3, #0
	str	r3, [r0, #92]
	ldmfd	sp, {fp, sp, pc}
.L114:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r0, #76]
	str	r2, [r0, #84]
	str	r3, [r0, #80]
	str	r3, [r0, #88]
.L117:
	mov	r3, #1
	str	r3, [r0, #92]
	ldmfd	sp, {fp, sp, pc}
.L113:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r0, #76]
	str	r2, [r0, #88]
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	b	.L117
.L115:
	mov	r3, #1
	str	r3, [r0, #76]
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	str	r3, [r0, #88]
	b	.L117
	UNWIND(.fnend)
	.size	VP8_setup_version, .-VP8_setup_version
	.align	2
	.global	read_mvcontexts
	.type	read_mvcontexts, %function
read_mvcontexts:
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
	ldr	r8, .L131
	mov	r7, r0
	mov	r6, r1
	mov	r9, r2
	add	r10, r8, #38
.L123:
	mov	r4, r8
	mov	r5, r9
	add	r8, r8, #19
	b	.L122
.L120:
	cmp	r4, r8
	add	r5, r5, #1
	beq	.L130
.L122:
	ldrb	r2, [r4], #1	@ zero_extendqisi2
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L120
	mov	r2, #7
	mov	r1, r6
	mov	r0, r7
	add	r5, r5, #1
	bl	Vp8_Vfmw_DecodeValue
	mov	r3, #1
	uxtb	r0, r0
	cmp	r0, #0
	mov	r0, r0, asl r3
	uxtbne	r3, r0
	cmp	r4, r8
	strb	r3, [r5, #-1]
	bne	.L122
.L130:
	cmp	r10, r4
	add	r9, r9, #19
	bne	.L123
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L132:
	.align	2
.L131:
	.word	.LANCHOR0+1364
	UNWIND(.fnend)
	.size	read_mvcontexts, .-read_mvcontexts
	.align	2
	.global	VP8_mb_mode_mv_init
	.type	VP8_mb_mode_mv_init, %function
VP8_mb_mode_mv_init:
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
	ldr	r3, [r0, #56]
	mov	r6, r0
	mov	r4, r1
	mov	r5, r2
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r2, #8
	mov	r1, r5
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #8
	mov	r1, r5
	strb	r0, [r6, #50]
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #8
	mov	r1, r5
	strb	r0, [r6, #51]
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #128
	mov	r1, r5
	strb	r0, [r6, #52]
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeBool
	cmp	r0, #1
	beq	.L135
.L139:
	mov	r2, #128
	mov	r1, r5
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L137
	add	r7, r6, #1312
	mov	r8, r7
	add	r7, r7, #1
	add	r8, r8, #4
.L140:
	mov	r2, #8
	mov	r1, r5
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeValue
	strb	r0, [r7, #1]!
	cmp	r7, r8
	bne	.L140
.L137:
	add	r2, r6, #2368
	mov	r1, r5
	add	r2, r2, #6
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	read_mvcontexts
.L135:
	add	r7, r6, #1296
	add	r8, r6, #1312
	add	r7, r7, #13
	add	r8, r8, #1
.L138:
	mov	r2, #8
	mov	r1, r5
	mov	r0, r4
	bl	Vp8_Vfmw_DecodeValue
	strb	r0, [r7, #1]!
	cmp	r7, r8
	bne	.L138
	b	.L139
	UNWIND(.fnend)
	.size	VP8_mb_mode_mv_init, .-VP8_mb_mode_mv_init
	.align	2
	.global	get_delta_q
	.type	get_delta_q, %function
get_delta_q:
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
	mov	r5, r2
	mov	r2, #128
	mov	r6, r3
	mov	r7, r0
	mov	r8, r1
	bl	Vp8_Vfmw_DecodeBool
	cmp	r0, #0
	bne	.L147
.L144:
	cmp	r0, r5
	movne	r3, #1
	strne	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L147:
	mov	r2, #4
	mov	r1, r8
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	mov	r1, r8
	mov	r2, #128
	mov	r4, r0
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r3, r0, #0
	eor	r4, r4, r3
	add	r0, r4, r0
	b	.L144
	UNWIND(.fnend)
	.size	get_delta_q, .-get_delta_q
	.align	2
	.global	VP8_init_frame
	.type	VP8_init_frame, %function
VP8_init_frame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #56]
	cmp	r3, #0
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8_init_frame.part.0
	UNWIND(.fnend)
	.size	VP8_init_frame, .-VP8_init_frame
	.align	2
	.global	VP8_GetPictureHeader
	.type	VP8_GetPictureHeader, %function
VP8_GetPictureHeader:
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
	ldr	r3, .L241
	mov	r8, r1
	mov	r6, r0
	str	r1, [fp, #-68]
	mov	r4, r2
	ldmia	r3, {r0, r1}
	sub	r3, fp, #52
	stmia	r3, {r0, r1}
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r6
	bl	BsGet
	add	r1, r8, #4096
	uxtb	r3, r5
	uxtb	r2, r7
	and	r5, r5, #1
	str	r5, [r8, #2516]
	str	r5, [r1, #860]
	ubfx	r1, r3, #1, #3
	str	r1, [r8, #2524]
	ubfx	r1, r3, #4, #1
	str	r1, [r8, #2520]
	uxtb	r0, r0
	mov	r1, r0, asl #16
	orr	r1, r1, r2, asl #8
	orr	r3, r1, r3
	mov	r3, r3, asr #5
	str	r3, [r8, #2528]
	cmp	r3, r4
	bhi	.L226
	ldr	r4, [fp, #-68]
	add	r3, r4, #2448
	add	r3, r3, #12
	str	r3, [fp, #-80]
	mov	r0, r3
	bl	VP8_setup_version
	ldr	r4, [r4, #2516]
	cmp	r4, #0
	beq	.L227
.L154:
	ldr	r4, [fp, #-68]
	mov	r3, #16
	mov	r2, #255
	mov	r1, #24
	mov	r0, r6
	str	r3, [r4, #2608]
	str	r2, [r4, #2600]
	bl	BsGet
	ldr	r3, [r4, #2516]
	ldr	r1, [fp, #-80]
	cmp	r3, #0
	add	r7, r1, #140
	str	r0, [r4, #2604]
	beq	.L228
.L157:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	uxtb	r0, r0
	strb	r0, [r3, #2474]
	cmp	r0, #0
	bne	.L158
.L165:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r4, [fp, #-68]
	mov	r2, #6
	mov	r1, r6
	str	r0, [r4, #2596]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #3
	mov	r1, r6
	strb	r0, [r4, #2470]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	mov	r3, #0
	mov	r2, #128
	strb	r3, [r4, #2461]
	mov	r1, r6
	strb	r0, [r4, #2471]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	uxtb	r0, r0
	strb	r0, [r4, #2462]
	cmp	r0, #0
	bne	.L229
.L160:
	mov	r2, #2
	mov	r1, r6
	mov	r0, r7
	sub	r4, fp, #44
	bl	Vp8_Vfmw_DecodeValue
	ldr	r8, [fp, #-68]
	mov	r2, #7
	mov	r1, r6
	mov	r5, #0
	strb	r0, [r8, #2473]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	movw	r2, #2465
	str	r5, [r4, #-12]!
	mov	r1, r6
	ldrsb	r2, [r8, r2]
	mov	r3, r4
	strb	r0, [r8, #2463]
	mov	r0, r7
	bl	get_delta_q
	movw	r2, #2466
	ldrsb	r2, [r8, r2]
	mov	r3, r4
	mov	r1, r6
	strb	r0, [r8, #2465]
	mov	r0, r7
	bl	get_delta_q
	movw	r2, #2467
	ldrsb	r2, [r8, r2]
	mov	r3, r4
	mov	r1, r6
	strb	r0, [r8, #2466]
	mov	r0, r7
	bl	get_delta_q
	movw	r2, #2468
	ldrsb	r2, [r8, r2]
	mov	r3, r4
	mov	r1, r6
	strb	r0, [r8, #2467]
	mov	r0, r7
	bl	get_delta_q
	movw	r2, #2469
	mov	r3, r4
	ldrsb	r2, [r8, r2]
	mov	r1, r6
	strb	r0, [r8, #2468]
	mov	r0, r7
	bl	get_delta_q
	ldr	r3, [r8, #2516]
	cmp	r3, r5
	strb	r0, [r8, #2469]
	bne	.L230
.L169:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	uxtb	r0, r0
	strb	r0, [r3, #2505]
	cmp	r0, #0
	beq	.L231
	ldr	r2, [fp, #-68]
	ldr	r3, [r2, #2516]
	cmp	r3, #0
	bne	.L181
.L233:
	mov	r3, #1
	strb	r3, [r2, #2500]
.L182:
	ldr	r3, [fp, #-68]
	ldr	r10, .L241+4
	add	r3, r3, #3776
	add	r3, r3, #2
	str	r3, [fp, #-76]
.L193:
	add	r3, r10, #264
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-64]
.L189:
	ldr	r8, [fp, #-64]
	sub	r5, r10, #33
.L187:
	sub	r9, r5, #11
	mov	r4, r8
	b	.L184
.L183:
	cmp	r9, r5
	add	r4, r4, #1
	beq	.L232
.L184:
	ldrb	r2, [r9, #1]!	@ zero_extendqisi2
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	cmp	r0, #1
	bne	.L183
	mov	r2, #8
	mov	r1, r6
	mov	r0, r7
	add	r4, r4, #1
	bl	Vp8_Vfmw_DecodeValue
	cmp	r9, r5
	strb	r0, [r4, #-1]
	bne	.L184
.L232:
	add	r5, r9, #11
	add	r8, r8, #11
	cmp	r5, r10
	bne	.L187
	ldr	r3, [fp, #-64]
	add	r10, r9, #44
	add	r3, r3, #33
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-72]
	cmp	r10, r3
	bne	.L189
	ldr	r3, .L241+8
	cmp	r10, r3
	ldr	r3, [fp, #-76]
	add	r3, r3, #264
	str	r3, [fp, #-76]
	bne	.L193
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	cmp	r0, #0
	str	r0, [r3, #2532]
	ldreq	r3, [fp, #-68]
	streqb	r0, [r3, #2513]
	beq	.L191
	mov	r2, #8
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	ldr	r3, [fp, #-68]
	strb	r0, [r3, #2513]
.L191:
	mov	r2, r6
	mov	r1, r7
	ldr	r0, [fp, #-80]
	bl	VP8_mb_mode_mv_init
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #2516]
	cmp	r3, #0
	beq	.L192
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #2500]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	moveq	r0, #1
	beq	.L222
.L192:
	ldr	r2, [fp, #-68]
	mov	r0, #1
	ldrb	r3, [r2, #2463]	@ zero_extendqisi2
	strb	r3, [r2, #2464]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L231:
	ldr	r0, [fp, #-80]
	movw	r2, #1149
	ldr	r3, .L241+12
	add	r1, r0, #1296
	add	r0, r0, #152
	add	r1, r1, #5
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r2, [fp, #-68]
	ldr	r3, [r2, #2516]
	cmp	r3, #0
	beq	.L233
	b	.L181
.L230:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r4, [fp, #-68]
	mov	r2, #128
	mov	r1, r6
	strb	r0, [r4, #2501]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldrb	r3, [r4, #2501]	@ zero_extendqisi2
	strb	r5, [r4, #2503]
	cmp	r3, #0
	uxtb	r3, r0
	strb	r3, [r4, #2502]
	beq	.L234
.L178:
	ldr	r2, [fp, #-68]
	cmp	r3, #0
	mov	r3, #0
	strb	r3, [r2, #2504]
	beq	.L235
.L179:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r4, [fp, #-68]
	mov	r2, #128
	mov	r1, r6
	strb	r0, [r4, #2508]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	strb	r0, [r4, #2509]
	b	.L169
.L229:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	uxtb	r0, r0
	strb	r0, [r3, #2461]
	cmp	r0, #0
	beq	.L160
	add	r4, r3, #2480
	add	r5, r3, #2496
	add	r4, r4, #12
	mov	r8, r3
.L173:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	uxtb	r0, r0
	strb	r0, [r8, #2490]
	cmp	r0, #1
	beq	.L236
.L171:
	add	r4, r4, #1
	cmp	r4, r5
	bne	.L173
	ldr	r3, [fp, #-68]
	add	r4, r3, #2496
	add	r4, r4, #4
.L177:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	uxtb	r0, r0
	strb	r0, [r3, #2491]
	cmp	r0, #1
	beq	.L237
.L175:
	add	r5, r5, #1
	cmp	r5, r4
	bne	.L177
	b	.L160
.L158:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r4, [fp, #-68]
	mov	r2, #128
	mov	r1, r6
	strb	r0, [r4, #2475]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	uxtb	r0, r0
	strb	r0, [r4, #2476]
	cmp	r0, #0
	bne	.L238
.L161:
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #2475]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L165
	ldr	r3, .L241+12
	mov	r2, #3
	ldr	r0, [fp, #-80]
	mov	r1, #255
	ldr	r5, [fp, #-68]
	add	r0, r0, #18
	ldr	r3, [r3, #48]
	blx	r3
	add	r4, r5, #2464
	add	r5, r5, #2480
	add	r4, r4, #14
	add	r5, r5, #1
.L167:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	uxtb	r0, r0
	strb	r0, [r3, #2481]
	cmp	r0, #1
	beq	.L239
.L166:
	add	r4, r4, #1
	cmp	r4, r5
	bne	.L167
	b	.L165
.L228:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r4, [fp, #-68]
	mov	r2, #128
	mov	r1, r6
	str	r0, [r4, #2588]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	str	r0, [r4, #2592]
	b	.L157
.L227:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	mov	r0, r6
	bl	BsGet
	uxtb	r2, r5
	uxtb	r3, r7
	cmp	r3, #157
	cmpeq	r2, #1
	movne	r1, #1
	moveq	r1, #0
	uxtb	r0, r0
	cmp	r0, #42
	orrne	r1, r1, #1
	cmp	r1, #0
	beq	.L155
	str	r0, [sp, #4]
	movw	r1, #931
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L241+16
	bl	dprint_normal
	mov	r0, r4
.L222:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L181:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	strb	r0, [r3, #2500]
	b	.L182
.L226:
	ldr	r2, .L241+20
	movw	r1, #914
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L238:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	ldr	r8, [fp, #-68]
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, .L241+12
	add	r4, r8, #2480
	mov	r1, #0
	mov	r2, #8
	add	r4, r4, #5
	ldr	r3, [r3, #48]
	mov	r5, r1
	strb	r0, [r8, #2477]
	ldr	r0, [fp, #-80]
	add	r0, r0, #22
	blx	r3
.L162:
	sub	r9, r4, #4
	b	.L164
.L163:
	strb	r10, [r9, #1]!
	cmp	r9, r4
	beq	.L240
.L164:
	mov	r2, #128
	mov	r1, r6
	mov	r0, r7
	mov	r10, #0
	bl	Vp8_Vfmw_DecodeBool
	ldr	r3, [fp, #-68]
	uxtb	r0, r0
	strb	r0, [r3, #2460]
	cmp	r0, #1
	bne	.L163
	sub	r3, fp, #52
	mov	r1, r6
	mov	r0, r7
	ldr	r2, [r3, r5, asl #2]
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #128
	mov	r1, r6
	mov	r8, r0
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	uxtb	r10, r8
	rsb	r8, r8, #0
	cmp	r0, #0
	uxtbne	r10, r8
	strb	r10, [r9, #1]!
	cmp	r9, r4
	bne	.L164
.L240:
	add	r5, r5, #1
	add	r4, r4, #4
	cmp	r5, #2
	bne	.L162
	b	.L161
.L235:
	mov	r2, #2
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	ldr	r3, [fp, #-68]
	strb	r0, [r3, #2504]
	b	.L179
.L155:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r4, r0
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r6
	bl	BsGet
	uxtb	r1, r5
	uxtb	r3, r4
	ldr	r4, [fp, #-68]
	orr	r3, r3, r1, asl #8
	uxtb	r2, r7
	ubfx	r3, r3, #0, #14
	mov	ip, r1, lsr #6
	str	r3, [r4, #2564]
	add	r1, r3, #15
	ldr	lr, [r4, #2516]
	mov	r1, r1, lsr #4
	str	r1, [r4, #2556]
	cmp	lr, #0
	str	ip, [r4, #2572]
	uxtb	r0, r0
	orr	r3, r2, r0, asl #8
	mov	r0, r0, lsr #6
	ubfx	r3, r3, #0, #14
	str	r3, [r4, #2568]
	add	r2, r3, #15
	str	r0, [r4, #2576]
	mov	r3, r2, lsr #4
	str	r3, [r4, #2560]
	mul	r1, r1, r3
	str	r1, [r4, #2580]
	bne	.L154
	ldr	r0, [fp, #-80]
	bl	VP8_init_frame.part.0
	b	.L154
.L234:
	mov	r2, #2
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	ldr	r2, [fp, #-68]
	ldrb	r3, [r2, #2502]	@ zero_extendqisi2
	strb	r0, [r2, #2503]
	b	.L178
.L236:
	mov	r2, #6
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #128
	mov	r1, r6
	strb	r0, [r4]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	uxtb	r0, r0
	strb	r0, [r8, #2472]
	cmp	r0, #1
	ldreqb	r3, [r4]	@ zero_extendqisi2
	rsbeq	r3, r3, #0
	streqb	r3, [r4]
	b	.L171
.L237:
	mov	r2, #6
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	mov	r2, #128
	mov	r1, r6
	strb	r0, [r5]
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeBool
	cmp	r0, #0
	ldrneb	r3, [r5]	@ zero_extendqisi2
	rsbne	r3, r3, #0
	strneb	r3, [r5]
	b	.L175
.L239:
	mov	r2, #8
	mov	r1, r6
	mov	r0, r7
	bl	Vp8_Vfmw_DecodeValue
	strb	r0, [r4]
	b	.L166
.L242:
	.align	2
.L241:
	.word	.LANCHOR0+1404
	.word	.LANCHOR0+1455
	.word	.LANCHOR0+2511
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC7
	.word	.LC6
	UNWIND(.fnend)
	.size	VP8_GetPictureHeader, .-VP8_GetPictureHeader
	.align	2
	.global	VP8_ArrangeVHBMem
	.type	VP8_ArrangeVHBMem, %function
VP8_ArrangeVHBMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldr	r3, .L253
	add	r5, r0, #4096
	mov	r4, r0
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	r0, fp, #64
	blx	r3
	ldr	ip, [r5, #1688]
	ldr	lr, [r5, #1684]
	add	r0, r4, #8192
	ldr	r3, [r4]
	sub	r1, fp, #64
	str	ip, [fp, #-44]
	mov	r2, #0
	str	lr, [fp, #-48]
	ldr	r6, [r3, #16]
	str	ip, [fp, #-52]
	cmp	r6, #24
	ldr	r0, [r0, #344]
	str	lr, [fp, #-56]
	mov	lr, #13
	movne	ip, #4
	moveq	ip, #1
	str	ip, [fp, #-40]
	ldr	ip, [r3, #16]
	mov	r3, #8
	str	lr, [fp, #-64]
	cmp	ip, #24
	strb	r3, [fp, #-59]
	movne	r3, #4
	moveq	r3, #1
	str	r3, [fp, #-36]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L251
	cmp	r0, #0
	moveq	r0, #1
	streq	r0, [r5, #4044]
	bne	.L252
.L247:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L252:
	ldr	r3, .L253+4
	mov	r1, #1216
	ldr	r2, .L253+8
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L251:
	add	r0, r4, #8128
	add	r0, r0, #56
	bl	ResetVoQueue
	mov	r0, #0
	b	.L247
.L254:
	.align	2
.L253:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+2468
	.word	.LC8
	UNWIND(.fnend)
	.size	VP8_ArrangeVHBMem, .-VP8_ArrangeVHBMem
	.align	2
	.global	VP8_DecodeDecide
	.type	VP8_DecodeDecide, %function
VP8_DecodeDecide:
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
	add	r4, r0, #4096
	mov	r6, r0
	ldr	r5, [r4, #4044]
	cmp	r5, #0
	beq	.L281
	ldr	r3, [r4, #4036]
	sub	r3, r3, #2
	cmp	r3, #1
	ldr	r3, [r0]
	ldr	r3, [r3, #8]
	bls	.L282
.L259:
	str	r3, [r4, #4036]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L264
.L265:
	.word	.L263
	.word	.L263
	.word	.L260
	.word	.L262
	.word	.L263
.L283:
	ldr	r2, .L285
	movw	r1, #1260
	mov	r0, #16
	bl	dprint_normal
.L262:
	mov	r0, #0
.L278:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L282:
	cmp	r3, #4
	cmpne	r3, #1
	bhi	.L259
	add	r5, r0, #8192
	ldr	r2, .L285+4
	movw	r1, #1243
	mov	r0, #3
	bl	dprint_normal
	ldr	r0, [r5, #344]
	ldr	r1, [r4, #4060]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #344]
	ldr	r1, [r4, #4064]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #344]
	ldr	r1, [r4, #4068]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #344]
	bl	FSP_GetNullLogicFs
	mov	r3, #0
	str	r3, [r4, #4040]
	str	r0, [r4, #4068]
	str	r0, [r4, #4064]
	str	r0, [r4, #4060]
	ldr	r3, [r6]
	ldr	r3, [r3, #8]
	b	.L259
.L281:
	ldr	r2, .L285+8
	movw	r1, #1235
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L260:
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	bne	.L283
.L261:
	add	r3, r6, #8192
	ldr	r1, [r4, #4068]
	ldr	r0, [r3, #344]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L284
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	beq	.L270
	ldr	r2, [r6]
	ldr	r3, [r5, #96]
	ldr	r2, [r2]
	cmp	r3, r2
	bls	.L270
	str	r2, [sp]
	movw	r1, #1298
	ldr	r2, .L285+12
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L263:
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	beq	.L261
	ldr	r3, [r4, #4040]
	cmp	r3, #0
	bne	.L261
	str	r3, [sp]
	movw	r1, #1272
	ldr	r3, .L285+16
	mov	r0, #16
	ldr	r2, .L285+20
	bl	dprint_normal
	b	.L262
.L264:
	ldr	r2, .L285+24
	mov	r1, #1280
	mov	r0, #1
	bl	dprint_normal
	b	.L262
.L270:
	mov	r0, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L284:
	movw	r1, #1290
	ldr	r3, .L285+28
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L285+32
	bl	dprint_normal
	mov	r0, r5
	b	.L278
.L286:
	.align	2
.L285:
	.word	.LC11
	.word	.LC10
	.word	.LC9
	.word	.LC16
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR0+2488
	.word	.LC15
	UNWIND(.fnend)
	.size	VP8_DecodeDecide, .-VP8_DecodeDecide
	.align	2
	.global	VP8_GetImageBuffer
	.type	VP8_GetImageBuffer, %function
VP8_GetImageBuffer:
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
	add	r4, r0, #8192
	add	r6, r0, #4096
	mov	r7, r0
	mov	r1, #0
	ldr	r0, [r4, #344]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r6, #4072]
	blt	.L291
	mov	r1, r0
	ldr	r0, [r4, #344]
	bl	FSP_GetLogicFs
	subs	r4, r0, #0
	beq	.L292
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L291:
	ldr	r2, .L293
	mov	r1, #1328
	mov	r0, #0
	mov	r5, r0
	bl	dprint_normal
	ldr	r1, [r6, #4060]
	ldr	r0, [r4, #344]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #4064]
	ldr	r0, [r4, #344]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #4068]
	ldr	r0, [r4, #344]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #344]
	bl	FSP_GetNullLogicFs
	add	r1, r7, #8128
	str	r5, [r6, #4040]
	add	r1, r1, #56
	str	r0, [r6, #4068]
	str	r0, [r6, #4064]
	str	r0, [r6, #4060]
	ldr	r0, [r4, #344]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L292:
	movw	r3, #1341
	ldr	r2, .L293+4
	mov	r1, r3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L294:
	.align	2
.L293:
	.word	.LC17
	.word	.LC18
	UNWIND(.fnend)
	.size	VP8_GetImageBuffer, .-VP8_GetImageBuffer
	.align	2
	.global	VP8_Set_DecParam
	.type	VP8_Set_DecParam, %function
VP8_Set_DecParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 88
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
	ldr	r7, .L336
	mov	r10, r0
	add	r3, r0, #8
	ldr	ip, [r10, #3180]
	add	r8, r0, #4096
	str	r3, [fp, #-116]
	movw	r2, #3160
	mov	r1, #0
	mov	r0, r3
	ldr	r3, [r7, #48]
	add	r5, r10, #8192
	str	ip, [fp, #-120]
	blx	r3
	ldr	r3, [r8, #1636]
	str	r3, [r10, #2808]
	ldr	r3, [r8, #4080]
	str	r3, [r10, #2812]
	ldr	r3, [r8, #1676]
	str	r3, [r10, #2796]
	ldr	r3, [r8, #1680]
	str	r3, [r10, #2800]
	ldr	r3, [r8, #1664]
	str	r3, [r10, #2816]
	ldr	r3, [r8, #1668]
	str	r3, [r10, #2820]
	ldrb	r3, [r8, #1633]	@ zero_extendqisi2
	strb	r3, [r10, #2760]
	ldr	r3, [r8, #1652]
	strb	r3, [r10, #2761]
	ldrb	r3, [r8, #1593]	@ zero_extendqisi2
	strb	r3, [r10, #2762]
	ldrb	r3, [r8, #1594]	@ zero_extendqisi2
	strb	r3, [r10, #2763]
	ldrb	r3, [r8, #1595]	@ zero_extendqisi2
	strb	r3, [r10, #2764]
	ldrb	r3, [r8, #1597]	@ zero_extendqisi2
	strb	r3, [r10, #2765]
	ldrb	r3, [r8, #1582]	@ zero_extendqisi2
	strb	r3, [r10, #2766]
	ldr	r3, [r8, #1716]
	strb	r3, [r10, #2768]
	ldrb	r3, [r8, #1590]	@ zero_extendqisi2
	strb	r3, [r10, #2770]
	ldrb	r3, [r8, #1591]	@ zero_extendqisi2
	strb	r3, [r10, #2771]
	ldr	r3, [r8, #4048]
	strb	r3, [r10, #2769]
	ldr	r3, [r8, #4052]
	strb	r3, [r10, #2772]
	ldrb	r3, [r8, #1583]	@ zero_extendqisi2
	strb	r3, [r10, #2767]
	ldrb	r3, [r8, #1585]	@ zero_extendqisi2
	sxtb	r2, r3
	mov	r3, r3, lsr #7
	cmp	r2, #0
	strb	r3, [r10, #2773]
	rsblt	r2, r2, #0
	strb	r2, [r10, #2774]
	ldrb	r3, [r8, #1586]	@ zero_extendqisi2
	sxtb	r2, r3
	mov	r3, r3, lsr #7
	cmp	r2, #0
	strb	r3, [r10, #2775]
	rsblt	r2, r2, #0
	strb	r2, [r10, #2776]
	ldrb	r3, [r8, #1587]	@ zero_extendqisi2
	sxtb	r2, r3
	mov	r3, r3, lsr #7
	cmp	r2, #0
	strb	r3, [r10, #2777]
	rsblt	r2, r2, #0
	strb	r2, [r10, #2778]
	ldrb	r3, [r8, #1588]	@ zero_extendqisi2
	sxtb	r2, r3
	mov	r3, r3, lsr #7
	cmp	r2, #0
	strb	r3, [r10, #2779]
	rsblt	r2, r2, #0
	strb	r2, [r10, #2780]
	ldrb	r3, [r8, #1589]	@ zero_extendqisi2
	sxtb	r2, r3
	mov	r3, r3, lsr #7
	cmp	r2, #0
	strb	r3, [r10, #2781]
	rsblt	r2, r2, #0
	strb	r2, [r10, #2782]
	ldrb	r3, [r8, #1630]	@ zero_extendqisi2
	strb	r3, [r10, #2783]
	ldrb	r3, [r8, #1631]	@ zero_extendqisi2
	strb	r3, [r10, #2784]
	ldrb	r3, [r8, #1632]	@ zero_extendqisi2
	strb	r3, [r10, #2785]
	ldr	r3, [r8, #1724]
	str	r3, [r10, #2792]
	ldr	r3, [r8, #1720]
	strb	r3, [r10, #2787]
	ldr	r3, [r8, #1728]
	strb	r3, [r10, #2788]
	ldr	r3, [r8, #4056]
	str	r3, [r10, #3152]
	ldr	r1, [r8, #4072]
	ldr	r0, [r5, #344]
	bl	FSP_GetLogicFs
	ldr	r1, [r8, #4060]
	mov	r4, r0
	ldr	r0, [r5, #344]
	bl	FSP_GetLogicFs
	ldr	r1, [r8, #4064]
	mov	r6, r0
	ldr	r0, [r5, #344]
	bl	FSP_GetLogicFs
	ldr	r1, [r8, #4068]
	mov	r9, r0
	ldr	r0, [r5, #344]
	bl	FSP_GetLogicFs
	cmp	r6, #0
	cmpne	r4, #0
	beq	.L296
	cmp	r0, #0
	cmpne	r9, #0
	beq	.L296
	ldr	r5, [r4, #24]
	cmp	r5, #0
	beq	.L335
	ldr	r3, [r5, #4]
	add	r5, r10, #5696
	mov	lr, r5
	mov	ip, r5
	str	r3, [r10, #3128]
	mov	r1, r5
	ldr	r3, [r4, #24]
	add	lr, lr, #5
	add	ip, ip, #11
	add	r1, r1, #25
	ldr	r3, [r3, #12]
	str	r3, [r10, #3132]
	ldr	r3, [r4, #32]
	ldr	r3, [r3, #8]
	str	r3, [r10, #3148]
	ldr	r3, [r6, #24]
	cmp	r3, #0
	ldreq	r3, [r4, #24]
	ldr	r3, [r3, #4]
	str	r3, [r10, #3140]
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ldreq	r3, [r4, #24]
	ldr	r3, [r3, #4]
	str	r3, [r10, #3136]
	ldr	r3, [r0, #24]
	mov	r0, r5
	add	r5, r5, #1
	add	r0, r0, #15
	cmp	r3, #0
	ldreq	r3, [r4, #24]
	ldr	r3, [r3, #4]
	str	r10, [fp, #-124]
	str	r3, [r10, #3144]
	ldr	r3, [r4, #24]
	ldr	r2, [r3, #44]
	mov	r3, r10
	str	r2, [r8, #4032]
	str	r2, [r10, #2804]
	mov	r2, #0
	ldr	r6, [r4, #24]
	ldr	r6, [r6, #72]
	str	r6, [r10, #3156]
	ldr	r6, [r4, #24]
	ldr	r6, [r6, #64]
	str	r6, [r10, #3160]
	ldr	r6, [r4, #24]
	ldr	r6, [r6, #68]
	str	r6, [r10, #3164]
	ldrb	r4, [r4, #408]	@ zero_extendqisi2
	strb	r4, [r10, #2786]
.L306:
	ldrsb	r4, [r5, #1]!
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #4
	str	r4, [r3, #3044]
	ldrsb	r4, [lr, #1]!
	str	r4, [r3, #3060]
	ldrsb	r4, [ip, #1]!
	str	r4, [r3, #3076]
	ldrsb	r4, [r0, #1]!
	str	r4, [r3, #3092]
	ldrb	r4, [r1, #1]!	@ zero_extendqisi2
	str	r4, [r3, #3108]
	bne	.L306
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	ldr	r0, [fp, #-116]
	blx	r3
	ldrb	r3, [r8, #1633]	@ zero_extendqisi2
	add	ip, r10, #1200
	mov	r2, #16
	mov	r1, #0
	add	r0, r10, #24
	strb	r3, [r10, #8]
	add	r3, ip, #8
	add	ip, r10, #6976
	mov	r9, r3
	ldrb	r3, [r8, #1598]	@ zero_extendqisi2
	add	ip, ip, #18
	strb	r3, [r10, #9]
	mov	r4, ip
	ldrb	r3, [r8, #1599]	@ zero_extendqisi2
	add	ip, r10, #2736
	add	ip, ip, #8
	str	ip, [fp, #-112]
	strb	r3, [r10, #10]
	ldrb	r3, [r8, #1600]	@ zero_extendqisi2
	strb	r3, [r10, #11]
	ldrb	r3, [r8, #1630]	@ zero_extendqisi2
	strb	r3, [r10, #12]
	ldrb	r3, [r8, #1631]	@ zero_extendqisi2
	strb	r3, [r10, #13]
	ldrb	r3, [r8, #1632]	@ zero_extendqisi2
	strb	r3, [r10, #14]
	ldr	r3, [r7, #48]
	blx	r3
	ldrb	r3, [r8, #2890]	@ zero_extendqisi2
	mov	r2, #16
	mov	r1, #0
	add	r0, r10, #40
	strb	r3, [r10, #24]
	ldrb	r3, [r8, #2891]	@ zero_extendqisi2
	strb	r3, [r10, #25]
	ldrb	r3, [r8, #2892]	@ zero_extendqisi2
	strb	r3, [r10, #26]
	ldrb	r3, [r8, #2893]	@ zero_extendqisi2
	strb	r3, [r10, #27]
	ldrb	r3, [r8, #2894]	@ zero_extendqisi2
	strb	r3, [r10, #28]
	ldrb	r3, [r8, #2895]	@ zero_extendqisi2
	strb	r3, [r10, #29]
	ldrb	r3, [r8, #2896]	@ zero_extendqisi2
	strb	r3, [r10, #30]
	ldr	r3, [r7, #48]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r10, #56
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r10, #712
	blx	r3
	ldrb	r0, [r8, #3955]	@ zero_extendqisi2
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	strb	r0, [r10, #712]
	ldrb	r0, [r8, #3954]	@ zero_extendqisi2
	strb	r0, [r10, #713]
	ldrb	r0, [r8, #3956]	@ zero_extendqisi2
	strb	r0, [r10, #714]
	ldrb	r0, [r8, #3957]	@ zero_extendqisi2
	strb	r0, [r10, #715]
	ldrb	r0, [r8, #3958]	@ zero_extendqisi2
	strb	r0, [r10, #716]
	ldrb	r0, [r8, #3959]	@ zero_extendqisi2
	strb	r0, [r10, #717]
	ldrb	r0, [r8, #3960]	@ zero_extendqisi2
	strb	r0, [r10, #718]
	ldrb	r0, [r8, #3961]	@ zero_extendqisi2
	strb	r0, [r10, #719]
	add	r0, r10, #728
	ldrb	ip, [r8, #3962]	@ zero_extendqisi2
	strb	ip, [r10, #720]
	blx	r3
	ldrb	r0, [r8, #3955]	@ zero_extendqisi2
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	strb	r0, [r10, #728]
	ldrb	r0, [r8, #3963]	@ zero_extendqisi2
	strb	r0, [r10, #729]
	ldrb	r0, [r8, #3964]	@ zero_extendqisi2
	strb	r0, [r10, #730]
	ldrb	r0, [r8, #3965]	@ zero_extendqisi2
	strb	r0, [r10, #731]
	ldrb	r0, [r8, #3966]	@ zero_extendqisi2
	strb	r0, [r10, #732]
	ldrb	r0, [r8, #3967]	@ zero_extendqisi2
	strb	r0, [r10, #733]
	ldrb	r0, [r8, #3968]	@ zero_extendqisi2
	strb	r0, [r10, #734]
	ldrb	r0, [r8, #3969]	@ zero_extendqisi2
	strb	r0, [r10, #735]
	ldrb	r0, [r8, #3970]	@ zero_extendqisi2
	strb	r0, [r10, #736]
	ldrb	r0, [r8, #3971]	@ zero_extendqisi2
	strb	r0, [r10, #737]
	add	r0, r10, #744
	ldrb	ip, [r8, #3972]	@ zero_extendqisi2
	strb	ip, [r10, #738]
	blx	r3
	ldrb	r0, [r8, #3974]	@ zero_extendqisi2
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	strb	r0, [r10, #744]
	ldrb	r0, [r8, #3973]	@ zero_extendqisi2
	strb	r0, [r10, #745]
	ldrb	r0, [r8, #3975]	@ zero_extendqisi2
	strb	r0, [r10, #746]
	ldrb	r0, [r8, #3976]	@ zero_extendqisi2
	strb	r0, [r10, #747]
	ldrb	r0, [r8, #3977]	@ zero_extendqisi2
	strb	r0, [r10, #748]
	ldrb	r0, [r8, #3978]	@ zero_extendqisi2
	strb	r0, [r10, #749]
	ldrb	r0, [r8, #3979]	@ zero_extendqisi2
	strb	r0, [r10, #750]
	ldrb	r0, [r8, #3980]	@ zero_extendqisi2
	strb	r0, [r10, #751]
	add	r0, r10, #760
	ldrb	ip, [r8, #3981]	@ zero_extendqisi2
	strb	ip, [r10, #752]
	blx	r3
	ldrb	r3, [r8, #3974]	@ zero_extendqisi2
	str	r10, [fp, #-128]
	str	r8, [fp, #-132]
	strb	r3, [r10, #760]
	ldrb	r3, [r8, #3982]	@ zero_extendqisi2
	strb	r3, [r10, #761]
	ldrb	r3, [r8, #3983]	@ zero_extendqisi2
	strb	r3, [r10, #762]
	ldrb	r3, [r8, #3984]	@ zero_extendqisi2
	strb	r3, [r10, #763]
	ldrb	r3, [r8, #3985]	@ zero_extendqisi2
	strb	r3, [r10, #764]
	ldrb	r3, [r8, #3986]	@ zero_extendqisi2
	strb	r3, [r10, #765]
	ldrb	r3, [r8, #3987]	@ zero_extendqisi2
	strb	r3, [r10, #766]
	ldrb	r3, [r8, #3988]	@ zero_extendqisi2
	strb	r3, [r10, #767]
	ldrb	r3, [r8, #3989]	@ zero_extendqisi2
	strb	r3, [r10, #768]
	ldrb	r3, [r8, #3990]	@ zero_extendqisi2
	strb	r3, [r10, #769]
	ldrb	r3, [r8, #3991]	@ zero_extendqisi2
	strb	r3, [r10, #770]
	mov	r10, r4
.L307:
	sub	r6, r9, #384
	mov	r8, r10
.L311:
	sub	r4, r6, #48
	mov	r5, r8
.L308:
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	mov	r0, r4
	blx	r3
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r7, #52]
	mov	r2, #11
	add	r4, r4, #16
	blx	r3
	cmp	r6, r4
	add	r5, r5, #11
	bne	.L308
	add	r6, r6, #48
	add	r8, r8, #33
	cmp	r9, r6
	bne	.L311
	ldr	r3, [fp, #-112]
	add	r9, r9, #384
	add	r10, r10, #264
	cmp	r9, r3
	bne	.L307
	ldr	r8, [fp, #-132]
	ldr	r9, [fp, #-120]
	ldr	r10, [fp, #-128]
	ldr	r2, [r8, #1636]
	ldr	r3, [r9, #4]
	add	r7, r10, #3184
	cmp	r2, #0
	bic	r3, r3, #15
	mov	r0, r7
	sub	r3, r3, #16
	str	r3, [r10, #2824]
	moveq	r4, #10
	movne	r4, #3
	ldr	r5, [r8, #1648]
	bl	BsPos
	add	r5, r4, r5
	mov	r5, r5, asl #3
	rsb	r0, r0, r5
	str	r0, [r10, #2828]
	mov	r0, r7
	ldr	r6, [r9, #4]
	bl	BsPos
	and	r6, r6, #15
	add	r6, r6, #16
	cmp	r0, #0
	add	r5, r0, #7
	movge	r5, r0
	mov	r0, r7
	bl	BsPos
	add	r5, r6, r5, asr #3
	and	r1, r5, #15
	mov	ip, #0
	bic	r5, r5, #15
	str	ip, [r10, #2840]
	str	r5, [r10, #2836]
	str	ip, [r10, #2844]
	str	ip, [r10, #2848]
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #29
	add	r2, r0, r3
	and	r2, r2, #7
	rsb	r3, r3, r2
	add	r3, r3, r1, lsl #3
	str	r3, [r10, #2832]
	ldrb	r5, [r8, #1593]	@ zero_extendqisi2
	mov	r3, #1
	ldr	r1, [r8, #1648]
	mov	r5, r3, asl r5
	ldr	r2, [r9, #8]
	ldr	r0, [r9]
	add	r3, r4, r1
	uxtb	r5, r5
	rsb	r2, r4, r2
	cmp	r5, #1
	add	r0, r0, r3
	subhi	r4, r5, #1
	str	r3, [fp, #-112]
	movls	r4, r0
	str	r5, [r10, #2852]
	addhi	r4, r4, r4, lsl #1
	addhi	r4, r0, r4
	cmp	r5, #0
	ble	.L322
	rsb	r3, r5, #1
	sub	lr, fp, #76
	sub	r7, r5, #1
	mov	ip, #0
	add	r3, r3, r3, lsl #1
	mov	r6, lr
	rsb	r3, r1, r3
	add	r8, r3, r2
.L317:
	cmp	ip, r7
	add	ip, ip, #1
	rsbge	r3, r4, r0
	add	r0, r0, #3
	ldrltb	r3, [r0, #-2]	@ zero_extendqisi2
	addge	r3, r3, r8
	ldrltb	r2, [r0, #-3]	@ zero_extendqisi2
	ldrltb	r1, [r0, #-1]	@ zero_extendqisi2
	addlt	r3, r2, r3, lsl #8
	addlt	r3, r3, r1, lsl #16
	cmp	ip, r5
	str	r3, [r6], #4
	add	r4, r4, r3
	bne	.L317
	ldr	r3, [fp, #-120]
	add	r9, r10, #2848
	ldr	r1, [fp, #-112]
	add	r8, r10, #2880
	add	r6, r10, #2944
	ldr	r0, [fp, #-124]
	ldr	r2, [r3, #4]
	add	r3, r7, r7, lsl #1
	add	r7, r10, #2912
	add	r9, r9, #4
	and	r2, r2, #15
	add	r8, r8, #4
	add	r3, r3, r2
	add	r7, r7, #4
	add	r3, r3, r1
	mov	r2, #0
	add	r6, r6, #4
	sub	r1, fp, #108
	mov	r4, r2
	str	r3, [fp, #-120]
	str	r10, [fp, #-112]
.L321:
	cmp	r2, #0
	add	r2, r2, #1
	add	r1, r1, #4
	add	r0, r0, #4
	ldreq	r3, [fp, #-120]
	ldrne	r3, [r1, #-8]
	ldrne	ip, [lr, #-4]
	streq	r3, [fp, #-108]
	ldreq	r3, [r1, #-4]
	addne	r3, ip, r3
	ldr	r10, [lr], #4
	strne	r3, [r1, #-4]
	and	ip, r3, #15
	cmp	r2, r5
	bic	r3, r3, #15
	mov	r10, r10, asl #3
	mov	ip, ip, asl #3
	str	r10, [r9, #4]!
	add	r3, r3, #16
	str	ip, [r8, #4]!
	str	r3, [r7, #4]!
	str	r4, [r6, #4]!
	str	r4, [r0, #2980]
	str	r4, [r0, #3012]
	bne	.L321
	ldr	r10, [fp, #-112]
.L322:
	ldr	r3, [fp, #-116]
	mov	r0, #1
	str	r3, [r10, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L296:
	ldr	r2, .L336+4
	movw	r1, #1427
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
.L329:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L335:
	ldr	r2, .L336+8
	movw	r1, #1433
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	b	.L329
.L337:
	.align	2
.L336:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC19
	.word	.LC20
	UNWIND(.fnend)
	.size	VP8_Set_DecParam, .-VP8_Set_DecParam
	.align	2
	.global	VP8_Update_PictHeader
	.type	VP8_Update_PictHeader, %function
VP8_Update_PictHeader:
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
	ldrb	r3, [r0, #2505]	@ zero_extendqisi2
	add	r5, r0, #2448
	mov	r4, r0
	add	r5, r5, #12
	cmp	r3, #0
	add	r7, r0, #8
	ldr	r6, .L342
	bne	.L339
	add	r0, r0, #3760
	movw	r2, #1149
	add	r0, r0, #1
	add	r1, r5, #152
	ldr	r3, [r6, #52]
	blx	r3
.L339:
	ldr	r3, [r6, #52]
	movw	r2, #2452
	mov	r1, r5
	mov	r0, r7
	blx	r3
	ldr	r2, [r4, #2516]
	add	r3, r4, #4096
	str	r2, [r3, #864]
	ldr	r2, [r4, #2596]
	str	r2, [r3, #832]
	ldrb	r2, [r4, #2471]	@ zero_extendqisi2
	str	r2, [r3, #836]
	ldrb	r3, [r4, #2500]	@ zero_extendqisi2
	strb	r3, [r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L343:
	.align	2
.L342:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP8_Update_PictHeader, .-VP8_Update_PictHeader
	.align	2
	.global	VP8DEC_Decode
	.type	VP8DEC_Decode, %function
VP8DEC_Decode:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r3, [r1]
	mov	r4, r0
	str	r3, [r0, #3168]
	ldr	r2, [r1, #12]
	str	r2, [r0, #3172]
	ldr	r2, [r1, #16]
	cmp	r2, #2
	str	r2, [r0, #3176]
	ble	.L378
	add	r5, r0, #3184
	add	r10, r0, #3216
	mov	r1, r3
	mov	r0, r5
	bl	BsInit
	add	r3, r4, #3168
	mov	r0, r5
	mov	r1, r10
	ldr	r2, [r4, #3176]
	str	r3, [r4, #3180]
	bl	VP8_GetPictureHeader
	cmp	r0, #1
	bne	.L379
	add	r5, r4, #4096
	ldr	r3, [r5, #4044]
	cmp	r3, #0
	bne	.L380
.L348:
	ldr	r7, .L384
	ldr	r6, [r7]
	cmp	r6, #0
	subeq	r8, fp, #52
	addeq	r9, r4, #8192
	beq	.L350
	ldr	r3, [r4, #3320]
	sub	r8, fp, #52
	ldr	r1, [r4, #3324]
	add	r9, r4, #8192
	ldr	r0, [r5, #1680]
	mov	r2, r8
	ldr	ip, [r5, #1676]
	strh	r3, [fp, #-52]	@ movhi
	mov	r3, #8
	strh	r1, [fp, #-50]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-46]	@ movhi
	strh	ip, [fp, #-48]	@ movhi
	ldr	r0, [r9, #344]
	blx	r6
.L350:
	mov	r3, r8
	sub	r2, fp, #56
	sub	r1, fp, #60
	ldr	r0, [r9, #344]
	mov	ip, #0
	str	ip, [fp, #-60]
	str	ip, [fp, #-56]
	str	ip, [fp, #-52]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4]
	ldr	r3, [r3, #696]
	cmp	r3, #1
	beq	.L381
.L352:
	ldr	r1, [r5, #4060]
	mov	r8, #0
	ldr	r0, [r9, #344]
	bl	FSP_ClearLogicFs
	ldr	r1, [r5, #4064]
	ldr	r0, [r9, #344]
	bl	FSP_ClearLogicFs
	ldr	r1, [r5, #4068]
	ldr	r0, [r9, #344]
	bl	FSP_ClearLogicFs
	ldr	r0, [r9, #344]
	bl	FSP_GetNullLogicFs
	add	r1, r4, #8128
	add	r1, r1, #56
	str	r8, [r5, #4040]
	str	r0, [r5, #4068]
	str	r0, [r5, #4064]
	str	r0, [r5, #4060]
	ldr	r0, [r9, #344]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r4
	bl	VP8_ArrangeVHBMem
	cmp	r0, #1
	bne	.L382
.L349:
	mov	r0, r4
	bl	VP8_DecodeDecide
	cmp	r0, #1
	mov	r6, r0
	beq	.L356
	ldr	r2, .L384+4
	movw	r1, #1748
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L379:
	ldr	r2, .L384+8
	mov	r1, #1696
	mov	r0, #3
	bl	dprint_normal
	mov	r0, #0
.L346:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L378:
	ldr	r2, .L384+12
	movw	r1, #1684
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L380:
	ldr	r2, [r4, #3320]
	ldr	r3, [r5, #1676]
	cmp	r2, r3
	bne	.L348
	ldr	r2, [r4, #3324]
	ldr	r3, [r5, #1680]
	cmp	r2, r3
	bne	.L348
	b	.L349
.L381:
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	bgt	.L353
	ldr	r2, [fp, #-56]
	cmp	r2, #32
	bgt	.L353
	ldr	r6, [r4, #4]
	cmp	r6, #0
	bne	.L353
	ldr	r2, [r4, #3320]
	cmp	r2, #0
	beq	.L352
	ldr	r1, [r5, #1680]
	ldr	r0, [r9, #348]
	cmp	r1, r0
	beq	.L352
	ldr	r0, [r5, #1676]
	ldr	ip, [r9, #352]
	cmp	r0, ip
	beq	.L352
	ldr	ip, [r4, #3324]
	str	r1, [sp, #12]
	movw	r1, #1723
	str	r0, [sp, #8]
	mov	r0, r3
	str	r2, [sp]
	str	ip, [sp, #4]
	ldr	r2, .L384+16
	bl	dprint_normal
	ldr	r3, [r5, #1680]
	ldr	r7, [r7]
	str	r3, [r9, #348]
	cmp	r7, #0
	ldr	r3, [r5, #1676]
	str	r3, [r9, #352]
	beq	.L352
	mov	r3, r6
	mov	r2, r6
	mov	r1, #48
	ldr	r0, [r9, #344]
	blx	r7
	b	.L352
.L382:
	ldr	r2, .L384+20
	movw	r1, #1739
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L356:
	mov	r0, r4
	bl	VP8_GetImageBuffer
	cmp	r0, #1
	beq	.L357
	mov	r0, r6
	ldr	r2, .L384+24
	movw	r1, #1756
	bl	dprint_normal
	mov	r0, #0
	b	.L346
.L353:
	mvn	r0, #1
	b	.L346
.L357:
	add	r9, r4, #8192
	ldr	r1, [r5, #4072]
	ldr	r0, [r9, #344]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L383
	ldr	r0, [r4]
	mov	r3, #0
	ldr	r2, .L384+28
	movw	r1, #1779
	ldrd	r6, [r0, #32]
	mov	r0, #24
	strd	r6, [r8, #208]
	ldr	ip, [r4]
	ldrd	r6, [ip, #48]
	strd	r6, [r8, #216]
	ldr	ip, [r4]
	ldrd	r6, [ip, #64]
	strd	r6, [r8, #224]
	mvn	r6, #0
	ldr	ip, [r4]
	mvn	r7, #0
	ldr	ip, [ip, #80]
	str	ip, [r8]
	ldr	ip, [r4]
	ldr	ip, [ip, #84]
	str	ip, [r8, #4]
	ldr	ip, [r4]
	ldr	ip, [ip, #88]
	str	ip, [r8, #8]
	ldr	ip, [r4]
	ldr	ip, [ip, #104]
	str	r3, [r8, #20]
	str	ip, [r8, #12]
	ldr	r3, [r4]
	strd	r6, [r3, #32]
	ldrd	r6, [r8, #216]
	strd	r6, [sp, #8]
	ldrd	r6, [r8, #208]
	strd	r6, [sp]
	bl	dprint_normal
	ldr	r2, [r5, #4076]
	cmp	r2, #0
	bne	.L359
	ldr	r1, [r5, #4064]
	ldr	r3, [r5, #4072]
	cmp	r1, r3
	beq	.L360
	ldr	r0, [r9, #344]
	bl	FSP_SetRef
	ldr	r3, [r5, #4072]
.L360:
	ldr	r1, [r5, #4068]
	cmp	r1, r3
	beq	.L361
	mov	r2, #0
	ldr	r0, [r9, #344]
	bl	FSP_SetRef
	ldr	r3, [r5, #4072]
.L361:
	ldr	r1, [r5, #4060]
	cmp	r1, r3
	beq	.L362
	ldr	r0, [r9, #344]
	mov	r2, #0
	bl	FSP_SetRef
.L362:
	mov	r3, #0
	str	r3, [r5, #4040]
.L359:
	mov	r0, r4
	bl	VP8_Set_DecParam
	mov	r0, r10
	bl	VP8_Update_PictHeader
	mov	r0, #0
	b	.L346
.L383:
	movw	r3, #1765
	ldr	r2, .L384+32
	mov	r1, r3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r8
	b	.L346
.L385:
	.align	2
.L384:
	.word	g_EventReportFunc
	.word	.LC25
	.word	.LC22
	.word	.LC21
	.word	.LC23
	.word	.LC24
	.word	.LC26
	.word	.LC27
	.word	.LC18
	UNWIND(.fnend)
	.size	VP8DEC_Decode, .-VP8DEC_Decode
	.align	2
	.global	VP8DEC_RecycleImage
	.type	VP8DEC_RecycleImage, %function
VP8DEC_RecycleImage:
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
	cmp	r0, #0
	mov	r5, r1
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r4, r0, #8192
	mov	r2, #0
	ldr	r0, [r4, #344]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #344]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L389
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #344]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #344]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L389:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP8DEC_RecycleImage, .-VP8DEC_RecycleImage
	.align	2
	.global	VP8DEC_GetImageBuffer
	.type	VP8DEC_GetImageBuffer, %function
VP8DEC_GetImageBuffer:
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
	add	r4, r0, #8192
	mov	r5, r0
	ldr	r0, [r4, #344]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	cmn	r0, #1
	beq	.L394
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L394:
	add	r1, r5, #8128
	ldr	r0, [r4, #344]
	add	r1, r1, #56
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP8DEC_GetImageBuffer, .-VP8DEC_GetImageBuffer
	.global	default_uv_mode_prob
	.global	default_ymode_prob
	.global	VP8_VFMWBITREADER_NORM
	.global	vp8_mv_update_probs
	.global	vp8_default_mv_context
	.global	vp8_coef_update_probs
	.global	default_coef_probs
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	vp8_default_mv_context, %object
	.size	vp8_default_mv_context, 38
vp8_default_mv_context:
	.byte	-94
	.byte	-128
	.byte	-31
	.byte	-110
	.byte	-84
	.byte	-109
	.byte	-42
	.byte	39
	.byte	-100
	.byte	-128
	.byte	-127
	.byte	-124
	.byte	75
	.byte	-111
	.byte	-78
	.byte	-50
	.byte	-17
	.byte	-2
	.byte	-2
	.byte	-92
	.byte	-128
	.byte	-52
	.byte	-86
	.byte	119
	.byte	-21
	.byte	-116
	.byte	-26
	.byte	-28
	.byte	-128
	.byte	-126
	.byte	-126
	.byte	74
	.byte	-108
	.byte	-76
	.byte	-53
	.byte	-20
	.byte	-2
	.byte	-2
	.space	2
	.type	default_coef_probs, %object
	.size	default_coef_probs, 1056
default_coef_probs:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-3
	.byte	-120
	.byte	-2
	.byte	-1
	.byte	-28
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-67
	.byte	-127
	.byte	-14
	.byte	-1
	.byte	-29
	.byte	-43
	.byte	-1
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	106
	.byte	126
	.byte	-29
	.byte	-4
	.byte	-42
	.byte	-47
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	98
	.byte	-8
	.byte	-1
	.byte	-20
	.byte	-30
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-75
	.byte	-123
	.byte	-18
	.byte	-2
	.byte	-35
	.byte	-22
	.byte	-1
	.byte	-102
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	78
	.byte	-122
	.byte	-54
	.byte	-9
	.byte	-58
	.byte	-76
	.byte	-1
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-71
	.byte	-7
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-72
	.byte	-106
	.byte	-9
	.byte	-1
	.byte	-20
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	77
	.byte	110
	.byte	-40
	.byte	-1
	.byte	-20
	.byte	-26
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	101
	.byte	-5
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-86
	.byte	-117
	.byte	-15
	.byte	-4
	.byte	-20
	.byte	-47
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	37
	.byte	116
	.byte	-60
	.byte	-13
	.byte	-28
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-52
	.byte	-2
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-49
	.byte	-96
	.byte	-6
	.byte	-1
	.byte	-18
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	102
	.byte	103
	.byte	-25
	.byte	-1
	.byte	-45
	.byte	-85
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-104
	.byte	-4
	.byte	-1
	.byte	-16
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-79
	.byte	-121
	.byte	-13
	.byte	-1
	.byte	-22
	.byte	-31
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	80
	.byte	-127
	.byte	-45
	.byte	-1
	.byte	-62
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-10
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-58
	.byte	35
	.byte	-19
	.byte	-33
	.byte	-63
	.byte	-69
	.byte	-94
	.byte	-96
	.byte	-111
	.byte	-101
	.byte	62
	.byte	-125
	.byte	45
	.byte	-58
	.byte	-35
	.byte	-84
	.byte	-80
	.byte	-36
	.byte	-99
	.byte	-4
	.byte	-35
	.byte	1
	.byte	68
	.byte	47
	.byte	-110
	.byte	-48
	.byte	-107
	.byte	-89
	.byte	-35
	.byte	-94
	.byte	-1
	.byte	-33
	.byte	-128
	.byte	1
	.byte	-107
	.byte	-15
	.byte	-1
	.byte	-35
	.byte	-32
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-72
	.byte	-115
	.byte	-22
	.byte	-3
	.byte	-34
	.byte	-36
	.byte	-1
	.byte	-57
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	81
	.byte	99
	.byte	-75
	.byte	-14
	.byte	-80
	.byte	-66
	.byte	-7
	.byte	-54
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	-127
	.byte	-24
	.byte	-3
	.byte	-42
	.byte	-59
	.byte	-14
	.byte	-60
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	99
	.byte	121
	.byte	-46
	.byte	-6
	.byte	-55
	.byte	-58
	.byte	-1
	.byte	-54
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	23
	.byte	91
	.byte	-93
	.byte	-14
	.byte	-86
	.byte	-69
	.byte	-9
	.byte	-46
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	-56
	.byte	-10
	.byte	-1
	.byte	-22
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	109
	.byte	-78
	.byte	-15
	.byte	-1
	.byte	-25
	.byte	-11
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	44
	.byte	-126
	.byte	-55
	.byte	-3
	.byte	-51
	.byte	-64
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-124
	.byte	-17
	.byte	-5
	.byte	-37
	.byte	-47
	.byte	-1
	.byte	-91
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	94
	.byte	-120
	.byte	-31
	.byte	-5
	.byte	-38
	.byte	-66
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	22
	.byte	100
	.byte	-82
	.byte	-11
	.byte	-70
	.byte	-95
	.byte	-1
	.byte	-57
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-74
	.byte	-7
	.byte	-1
	.byte	-24
	.byte	-21
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	124
	.byte	-113
	.byte	-15
	.byte	-1
	.byte	-29
	.byte	-22
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	35
	.byte	77
	.byte	-75
	.byte	-5
	.byte	-63
	.byte	-45
	.byte	-1
	.byte	-51
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-99
	.byte	-9
	.byte	-1
	.byte	-20
	.byte	-25
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	121
	.byte	-115
	.byte	-21
	.byte	-1
	.byte	-31
	.byte	-29
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	45
	.byte	99
	.byte	-68
	.byte	-5
	.byte	-61
	.byte	-39
	.byte	-1
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	1
	.byte	-5
	.byte	-1
	.byte	-43
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-53
	.byte	1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-119
	.byte	1
	.byte	-79
	.byte	-1
	.byte	-32
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-3
	.byte	9
	.byte	-8
	.byte	-5
	.byte	-49
	.byte	-48
	.byte	-1
	.byte	-64
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-81
	.byte	13
	.byte	-32
	.byte	-13
	.byte	-63
	.byte	-71
	.byte	-7
	.byte	-58
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	73
	.byte	17
	.byte	-85
	.byte	-35
	.byte	-95
	.byte	-77
	.byte	-20
	.byte	-89
	.byte	-1
	.byte	-22
	.byte	-128
	.byte	1
	.byte	95
	.byte	-9
	.byte	-3
	.byte	-44
	.byte	-73
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-17
	.byte	90
	.byte	-12
	.byte	-6
	.byte	-45
	.byte	-47
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-101
	.byte	77
	.byte	-61
	.byte	-8
	.byte	-68
	.byte	-61
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	24
	.byte	-17
	.byte	-5
	.byte	-38
	.byte	-37
	.byte	-1
	.byte	-51
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-55
	.byte	51
	.byte	-37
	.byte	-1
	.byte	-60
	.byte	-70
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	69
	.byte	46
	.byte	-66
	.byte	-17
	.byte	-55
	.byte	-38
	.byte	-1
	.byte	-28
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-65
	.byte	-5
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-33
	.byte	-91
	.byte	-7
	.byte	-1
	.byte	-43
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-115
	.byte	124
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	16
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-66
	.byte	36
	.byte	-26
	.byte	-1
	.byte	-20
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-107
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-30
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-9
	.byte	-64
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-16
	.byte	-128
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-122
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-43
	.byte	62
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	55
	.byte	93
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-54
	.byte	24
	.byte	-43
	.byte	-21
	.byte	-70
	.byte	-65
	.byte	-36
	.byte	-96
	.byte	-16
	.byte	-81
	.byte	-1
	.byte	126
	.byte	38
	.byte	-74
	.byte	-24
	.byte	-87
	.byte	-72
	.byte	-28
	.byte	-82
	.byte	-1
	.byte	-69
	.byte	-128
	.byte	61
	.byte	46
	.byte	-118
	.byte	-37
	.byte	-105
	.byte	-78
	.byte	-16
	.byte	-86
	.byte	-1
	.byte	-40
	.byte	-128
	.byte	1
	.byte	112
	.byte	-26
	.byte	-6
	.byte	-57
	.byte	-65
	.byte	-9
	.byte	-97
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-90
	.byte	109
	.byte	-28
	.byte	-4
	.byte	-45
	.byte	-41
	.byte	-1
	.byte	-82
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	39
	.byte	77
	.byte	-94
	.byte	-24
	.byte	-84
	.byte	-76
	.byte	-11
	.byte	-78
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	52
	.byte	-36
	.byte	-10
	.byte	-58
	.byte	-57
	.byte	-7
	.byte	-36
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	124
	.byte	74
	.byte	-65
	.byte	-13
	.byte	-73
	.byte	-63
	.byte	-6
	.byte	-35
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	24
	.byte	71
	.byte	-126
	.byte	-37
	.byte	-102
	.byte	-86
	.byte	-13
	.byte	-74
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	-74
	.byte	-31
	.byte	-7
	.byte	-37
	.byte	-16
	.byte	-1
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-107
	.byte	-106
	.byte	-30
	.byte	-4
	.byte	-40
	.byte	-51
	.byte	-1
	.byte	-85
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	28
	.byte	108
	.byte	-86
	.byte	-14
	.byte	-73
	.byte	-62
	.byte	-2
	.byte	-33
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	81
	.byte	-26
	.byte	-4
	.byte	-52
	.byte	-53
	.byte	-1
	.byte	-64
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	123
	.byte	102
	.byte	-47
	.byte	-9
	.byte	-68
	.byte	-60
	.byte	-1
	.byte	-23
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	20
	.byte	95
	.byte	-103
	.byte	-13
	.byte	-92
	.byte	-83
	.byte	-1
	.byte	-53
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-34
	.byte	-8
	.byte	-1
	.byte	-40
	.byte	-43
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-88
	.byte	-81
	.byte	-10
	.byte	-4
	.byte	-21
	.byte	-51
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	47
	.byte	116
	.byte	-41
	.byte	-1
	.byte	-45
	.byte	-44
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	121
	.byte	-20
	.byte	-3
	.byte	-44
	.byte	-42
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-115
	.byte	84
	.byte	-43
	.byte	-4
	.byte	-55
	.byte	-54
	.byte	-1
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	42
	.byte	80
	.byte	-96
	.byte	-16
	.byte	-94
	.byte	-71
	.byte	-1
	.byte	-51
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-12
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-18
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.type	VP8_VFMWBITREADER_NORM, %object
	.size	VP8_VFMWBITREADER_NORM, 256
VP8_VFMWBITREADER_NORM:
	.byte	0
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.12546, %object
	.size	__func__.12546, 12
__func__.12546:
	.ascii	"VP8DEC_Init\000"
	.type	vp8_mv_update_probs, %object
	.size	vp8_mv_update_probs, 38
vp8_mv_update_probs:
	.byte	-19
	.byte	-10
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-6
	.byte	-6
	.byte	-4
	.byte	-2
	.byte	-2
	.byte	-25
	.byte	-13
	.byte	-11
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-5
	.byte	-5
	.byte	-2
	.byte	-2
	.byte	-2
	.space	2
.LC0:
	.word	7
	.word	6
	.type	vp8_coef_update_probs, %object
	.size	vp8_coef_update_probs, 1056
vp8_coef_update_probs:
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-80
	.byte	-10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-33
	.byte	-15
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-12
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-22
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-10
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-17
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-3
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-39
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-31
	.byte	-4
	.byte	-15
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-22
	.byte	-6
	.byte	-15
	.byte	-6
	.byte	-3
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-33
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-18
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-9
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-70
	.byte	-5
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-22
	.byte	-5
	.byte	-12
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-5
	.byte	-13
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-20
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-2
	.byte	-4
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-7
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-10
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-2
	.byte	-5
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-11
	.byte	-5
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.type	__func__.12650, %object
	.size	__func__.12650, 18
__func__.12650:
	.ascii	"VP8_ArrangeVHBMem\000"
	.space	2
	.type	__FUNCTION__.12664, %object
	.size	__FUNCTION__.12664, 17
__FUNCTION__.12664:
	.ascii	"VP8_DecodeDecide\000"
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	default_ymode_prob, %object
	.size	default_ymode_prob, 4
default_ymode_prob:
	.byte	112
	.byte	86
	.byte	-116
	.byte	37
	.type	default_uv_mode_prob, %object
	.size	default_uv_mode_prob, 3
default_uv_mode_prob:
	.byte	-94
	.byte	101
	.byte	-52
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	ASCII(.ascii	"pCurImg is null\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"err_level(%d) over ref_thr(%d)\012\000" )
.LC3:
	ASCII(.ascii	"line: %d pToQueImg is null\012\000" )
.LC4:
	ASCII(.ascii	"insert img to Voqueue failed!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s get ChanID = -1!\012\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"Error!partition 0 length > streamlength!\012\000" )
	.space	2
.LC7:
	ASCII(.ascii	"Invalid frame sync code,data[0-1]:%02x,%02x,%02x\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC8:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC9:
	ASCII(.ascii	"ERROR: No Img buffer is allocated\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"----------------- vp8 Imode -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"-----I_MODE, but FrameType is %d-----\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"P-frm\000" )
	.space	2
.LC13:
	ASCII(.ascii	"-----cur framtype is %s, but refnum=%d-----\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"error: DecMode illegal\012\000" )
.LC15:
	ASCII(.ascii	"%s %d NULL == pFwdImg!!\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"dec P frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC17:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"VP8_Set_DecParam but logic fs is null!\012\000" )
.LC20:
	ASCII(.ascii	"VP8_Set_DecParam but cur logic pstDecodeFs is null!" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"Error!Truncated packet\012\000" )
.LC22:
	ASCII(.ascii	"VP8_CB_GetPictureHeader Error!\012\000" )
.LC23:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"VP8_ArrangeVHBMem error\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"VP8_DecodeDecide err\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"VP8_GetBufFromQueue err\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
