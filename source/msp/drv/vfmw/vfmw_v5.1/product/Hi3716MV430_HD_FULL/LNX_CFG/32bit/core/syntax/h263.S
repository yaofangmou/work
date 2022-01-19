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
	.file	"h263.c"
	.text
	.align	2
	.global	H263_log2bin
	.type	H263_log2bin, %function
H263_log2bin:
	UNWIND(.fnstart)
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
	ldmeqfd	sp, {fp, sp, pc}
	mov	r3, #0
.L3:
	add	r3, r3, #1
	movs	r0, r0, lsr #1
	uxth	r3, r3
	bne	.L3
	sxth	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_log2bin, .-H263_log2bin
	.align	2
	.global	H263_GetUserDataBuf
	.type	H263_GetUserDataBuf, %function
H263_GetUserDataBuf:
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
	ldr	r3, [r1, r2, asl #2]
	cmp	r3, #0
	beq	.L12
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	str	r2, [fp, #-20]
	str	r1, [fp, #-16]
	bl	GetUsd
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-16]
	cmp	r0, #0
	mov	r3, r0
	str	r0, [r1, r2, asl #2]
	addne	r0, r2, #4
	strne	r0, [r3, #1040]
	ldrne	r3, [r1, r2, asl #2]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_GetUserDataBuf, .-H263_GetUserDataBuf
	.align	2
	.global	H263_ClearUsrData
	.type	H263_ClearUsrData, %function
H263_ClearUsrData:
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
	sub	r4, r1, #4
	add	r5, r1, #12
	mov	r7, r0
	mov	r6, #0
.L14:
	ldr	r1, [r4, #4]!
	mov	r0, r7
	bl	FreeUsdByDec
	cmp	r4, r5
	str	r6, [r4]
	bne	.L14
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_ClearUsrData, .-H263_ClearUsrData
	.align	2
	.global	H263_Syntax_Init
	.type	H263_Syntax_Init, %function
H263_Syntax_Init:
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
	ldr	r5, .L21
	mov	r4, r0
	add	r0, r0, #19712
	mov	r2, #24
	mov	r1, #0
	add	r0, r0, #216
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r4, #19712
	ldr	r3, [r5, #48]
	mov	r2, #604
	mov	r1, #0
	add	r0, r0, #240
	blx	r3
	add	r0, r4, #20992
	ldr	r3, [r5, #48]
	mov	r2, #68
	mov	r1, #0
	add	r0, r0, #168
	blx	r3
	add	r0, r4, #20992
	ldr	r3, [r5, #48]
	mov	r2, #776
	mov	r1, #0
	add	r0, r0, #236
	blx	r3
	add	r0, r4, #21760
	ldr	r3, [r5, #48]
	mov	r2, #7
	mov	r1, #0
	add	r0, r0, #244
	blx	r3
	ldr	r3, .L21+4
	add	r2, r4, #19968
	add	r1, r4, #20480
	add	r2, r2, #68
	add	r0, r3, #256
	mov	ip, #1
	strb	ip, [r1, #765]
	str	ip, [r1, #2088]
.L17:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L17
	ldr	r3, .L21+8
	add	r2, r4, #20224
	add	r2, r2, #68
	add	r0, r3, #256
.L18:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L18
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0-4
	.word	.LANCHOR0+252
	UNWIND(.fnend)
	.size	H263_Syntax_Init, .-H263_Syntax_Init
	.align	2
	.global	H263_Global_Data_Init
	.type	H263_Global_Data_Init, %function
H263_Global_Data_Init:
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
	ldr	r5, .L24
	mov	r4, r0
	add	r0, r0, #22016
	mov	r2, #24
	mov	r1, #0
	add	r0, r0, #16
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r4, #21760
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r0, #252
	blx	r3
	mov	r0, r4
	bl	H263_Syntax_Init
	add	r3, r4, #20480
	mov	r2, #0
	mov	r0, r2
	str	r2, [r3, #2068]
	str	r2, [r3, #2072]
	str	r2, [r3, #2076]
	str	r2, [r3, #2080]
	str	r2, [r3, #2040]
	str	r2, [r3, #1580]
	str	r2, [r3, #2024]
	str	r2, [r3, #2028]
	str	r2, [r3, #2032]
	str	r2, [r3, #2084]
	str	r2, [r3, #2044]
	str	r2, [r3, #2048]
	str	r2, [r3, #2052]
	str	r2, [r3, #2056]
	str	r2, [r3, #2060]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	H263_Global_Data_Init, .-H263_Global_Data_Init
	.align	2
	.global	H263_Frame_Init
	.type	H263_Frame_Init, %function
H263_Frame_Init:
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
	ldr	r3, .L38
	mov	r6, r2
	add	r4, r0, #20480
	mov	r7, r1
	mov	r5, r0
	ldr	r3, [r3, #48]
	mov	r2, #36
	mov	r1, #0
	sub	r0, fp, #64
	blx	r3
	ldr	r3, [r4, #1548]
	ldrb	r0, [r5]	@ zero_extendqisi2
	sub	r1, fp, #64
	str	r6, [fp, #-44]
	mov	r2, #0
	cmp	r0, #1
	str	r7, [fp, #-48]
	ldr	r0, [r3, #16]
	mov	ip, #8
	moveq	lr, #14
	movne	lr, #4
	cmp	r0, #24
	str	r6, [fp, #-52]
	ldr	r0, [r4, #2448]
	movne	r6, #3
	moveq	r6, #1
	str	r6, [fp, #-40]
	ldr	r3, [r3, #16]
	str	r7, [fp, #-56]
	cmp	r3, #24
	strb	ip, [fp, #-59]
	movne	r3, #2
	moveq	r3, #1
	str	r3, [fp, #-36]
	str	lr, [fp, #-64]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L36
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r4, #2452]
	bne	.L37
.L31:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L37:
	ldr	r3, .L38+4
	movw	r1, #1178
	ldr	r2, .L38+8
	mov	r0, #0
	bl	dprint_normal
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2452]
	b	.L31
.L36:
	add	r0, r5, #22528
	add	r0, r0, #48
	bl	ResetVoQueue
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2452]
	b	.L31
.L39:
	.align	2
.L38:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+512
	.word	.LC0
	UNWIND(.fnend)
	.size	H263_Frame_Init, .-H263_Frame_Init
	.global	__aeabi_uidiv
	.align	2
	.global	H263_RecordFrameAtr
	.type	H263_RecordFrameAtr, %function
H263_RecordFrameAtr:
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
	add	r9, r0, #20480
	mov	r5, r0
	mov	r6, r1
	ldrb	r3, [r9, #791]	@ zero_extendqisi2
	cmp	r3, #15
	beq	.L59
	sub	r2, r3, #2
	cmp	r2, #1
	movls	r4, #1
	bls	.L42
	sub	r2, r3, #4
	cmp	r2, #1
	movls	r4, #2
	bls	.L42
	cmp	r3, #1
	moveq	r4, #5
	movne	r4, #0
.L42:
	mov	r1, r6
	ldr	r0, [r9, #2448]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L40
	mov	r1, r4
	bl	SetAspectRatio
	ldr	r3, [r9, #1464]
	add	r0, r5, #22528
	ldrb	r1, [r8, #156]	@ zero_extendqisi2
	ldrb	r2, [r8, #157]	@ zero_extendqisi2
	mov	lr, #0
	mov	r3, r3, lsr #1
	str	r3, [r8, #48]
	ldr	ip, [r9, #1460]
	add	r0, r0, #16
	add	r3, r8, #160
	mov	ip, ip, lsr #1
	str	ip, [r8, #52]
	ldr	r5, [r9, #2028]
	add	ip, r8, #192
	str	r5, [r8, #104]
	ldr	r5, [r9, #2024]
	str	r5, [r8, #100]
	ldrb	r5, [r9, #1392]	@ zero_extendqisi2
	bfi	r1, r5, #0, #2
	strb	r1, [r8, #156]
	ldrb	r5, [r9, #769]	@ zero_extendqisi2
	bfi	r1, r5, #5, #3
	strb	r1, [r8, #156]
	ldrb	r1, [r9, #798]	@ zero_extendqisi2
	and	r1, r1, #1
	bfi	r2, r1, #0, #2
	uxtb	r2, r2
	orr	r2, r2, #12
	strb	r2, [r8, #157]
	ldrb	r1, [r9, #1397]	@ zero_extendqisi2
	bfi	r2, r1, #4, #2
	strb	r2, [r8, #157]
	ldr	r2, [r8, #156]
	mov	r1, lr
	bfi	r2, r4, #14, #3
	str	r2, [r8, #156]
	ldrb	r2, [r9, #1392]	@ zero_extendqisi2
	and	r2, r2, #3
	str	r2, [r8, #24]
	ldrb	r2, [r9, #1392]	@ zero_extendqisi2
	str	lr, [r8, #20]
	and	r2, r2, #3
	str	r2, [r8, #28]
.L48:
	ldr	r2, [r0, #4]!
	str	r2, [r3, #8]!
	cmp	r3, ip
	str	r1, [r3, #4]
	bne	.L48
	ldr	r3, [r9, #1548]
	mvn	r4, #0
	mvn	r5, #0
	ldr	r2, .L60
	movw	r1, #1310
	mov	r0, #24
	ldrd	r6, [r3, #32]
	strd	r6, [r8, #208]
	ldr	r3, [r9, #1548]
	ldrd	r6, [r3, #48]
	strd	r6, [r8, #216]
	ldr	r3, [r9, #1548]
	ldrd	r6, [r3, #64]
	strd	r6, [r8, #224]
	ldr	r3, [r9, #1548]
	ldr	r3, [r3, #84]
	str	r3, [r8, #4]
	ldr	r3, [r9, #1548]
	ldr	r3, [r3, #88]
	str	r3, [r8, #8]
	ldr	r3, [r9, #1548]
	ldr	r3, [r3, #104]
	str	r3, [r8, #12]
	ldr	r3, [r9, #1548]
	strd	r4, [r3, #32]
	ldrd	r4, [r8, #216]
	ldr	r3, [r9, #2448]
	strd	r4, [sp, #8]
	ldrd	r4, [r8, #208]
	strd	r4, [sp]
	bl	dprint_normal
.L40:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L59:
	ldr	r2, [r9, #820]
	ldr	r1, [r9, #824]
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r4, #0
	beq	.L42
	ldr	r3, [r9, #872]
	mul	r1, r3, r1
	cmp	r1, #0
	beq	.L50
	ldr	r0, [r9, #868]
	mov	r2, r2, asl #10
	mul	r0, r0, r2
	bl	__aeabi_uidiv
	movw	r3, #1364
	cmp	r0, r3
	movw	r3, #1819
	rsble	r4, r0, #1360
	subgt	r4, r0, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r0, r3
	rsble	r0, r0, #1808
	subgt	r0, r0, #1808
	addle	r0, r0, #12
	subgt	r0, r0, #12
	cmp	r4, r0
	movlt	r4, #1
	movge	r4, #2
	b	.L42
.L50:
	mov	r4, r1
	b	.L42
.L61:
	.align	2
.L60:
	.word	.LC1
	UNWIND(.fnend)
	.size	H263_RecordFrameAtr, .-H263_RecordFrameAtr
	.align	2
	.global	H263_Frame_Atr
	.type	H263_Frame_Atr, %function
H263_Frame_Atr:
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
	add	r4, r0, #20480
	mvn	r2, #0
	mov	r5, r0
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #4
	strb	r3, [r0, #3]
	str	r2, [r4, #2476]
	beq	.L73
	mov	r1, #1
	ldr	r0, [r4, #2448]
	bl	FSP_NewLogicFs
	mov	r1, r0
	str	r0, [r4, #2476]
.L65:
	cmp	r1, #0
	blt	.L66
	ldr	r3, [r4, #2452]
	cmp	r3, #0
	beq	.L66
	mov	r0, r5
	bl	H263_RecordFrameAtr
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2032]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L73:
	ldr	r2, [r4, #2448]
	mov	ip, #100
	ldr	r3, .L74
	ldr	r1, [r4, #2468]
	mov	r0, r2
	mla	r3, ip, r2, r3
	ldr	r2, [r3, #88]
	add	r2, r2, #1
	str	r2, [r3, #88]
	bl	FSP_LinkLogicFs
	cmp	r0, #0
	ldrne	r1, [r0, #4]
	ldreq	r1, [r4, #2476]
	strne	r1, [r4, #2476]
	b	.L65
.L66:
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	movw	r1, #1338
	ldr	r2, .L74+4
	mov	r0, #0
	bl	dprint_normal
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L68
	ldr	r1, [r6, #168]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r6, #168]
	strd	r2, [r6, #176]
	strd	r2, [r6, #184]
	strd	r2, [r6, #192]
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2448]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2468]
	str	r0, [r4, #2460]
.L68:
	add	r1, r5, #22528
	mov	r3, #0
	add	r1, r1, #48
	str	r3, [r4, #2456]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearNotInVoQueue
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L75:
	.align	2
.L74:
	.word	g_VfmwChanStat
	.word	.LC2
	UNWIND(.fnend)
	.size	H263_Frame_Atr, .-H263_Frame_Atr
	.align	2
	.global	H263_Set_DecPar
	.type	H263_Set_DecPar, %function
H263_Set_DecPar:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
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
	ldr	r3, .L93
	add	r4, r0, #20480
	mov	r6, r0
	mov	r2, #48
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	r0, fp, #84
	blx	r3
	ldr	r1, [r4, #1464]
	add	r5, r6, #1040
	add	r2, r4, #748
	add	r3, r1, #15
	add	r0, r2, #656
	add	r2, r2, #704
	add	r7, r6, #12288
	mov	r3, r3, lsr #4
	strh	r3, [r5, #158]	@ movhi
	ldr	ip, [r4, #1460]
	add	r3, ip, #15
	mov	r3, r3, lsr #4
	strh	r3, [r5, #160]	@ movhi
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	strb	r3, [r6, #1040]
	ldrb	lr, [r4, #802]	@ zero_extendqisi2
	strb	lr, [r6, #1041]
	ldrb	lr, [r4, #757]	@ zero_extendqisi2
	strb	lr, [r6, #1042]
	ldrb	lr, [r4, #1399]	@ zero_extendqisi2
	strb	lr, [r6, #1043]
	ldrh	r0, [r0]
	strh	r0, [r5, #4]	@ movhi
	ldrh	r2, [r2]
	strh	r2, [r5, #6]	@ movhi
	ldrb	r2, [r4, #1454]	@ zero_extendqisi2
	strb	r2, [r6, #1049]
	ldrb	r2, [r4, #1403]	@ zero_extendqisi2
	strb	r2, [r6, #1048]
	ldr	r2, [r4, #856]
	strb	r2, [r6, #1050]
	ldrb	r2, [r4, #1400]	@ zero_extendqisi2
	strb	r2, [r6, #1051]
	ldrb	r2, [r4, #1401]	@ zero_extendqisi2
	strb	r2, [r6, #1052]
	ldrb	r2, [r4, #1396]	@ zero_extendqisi2
	strb	r2, [r6, #1053]
	ldrb	r2, [r4, #807]	@ zero_extendqisi2
	strb	r2, [r6, #1054]
	ldrb	r2, [r4, #805]	@ zero_extendqisi2
	strb	r2, [r6, #1055]
	ldrb	r2, [r4, #1394]	@ zero_extendqisi2
	ldrb	r0, [r6]	@ zero_extendqisi2
	strb	r2, [r6, #1056]
	ldrb	r2, [r4, #1398]	@ zero_extendqisi2
	strb	r2, [r6, #1057]
	ldrb	r2, [r4, #1397]	@ zero_extendqisi2
	strb	r2, [r6, #1058]
	ldrb	r2, [r4, #798]	@ zero_extendqisi2
	strb	r2, [r6, #1059]
	ldr	r2, [r4, #1496]
	str	r2, [r6, #1204]
	ldr	r2, [r4, #1492]
	strb	r0, [r6, #1196]
	str	r2, [r6, #1208]
	ldrb	r2, [r4, #760]	@ zero_extendqisi2
	strb	r2, [r6, #1190]
	ldrb	r2, [r4, #759]	@ zero_extendqisi2
	strb	r2, [r6, #1189]
	ldrb	r2, [r4, #758]	@ zero_extendqisi2
	strb	r2, [r6, #1188]
	ldrb	r2, [r4, #761]	@ zero_extendqisi2
	strb	r2, [r6, #1191]
	ldrb	r2, [r4, #762]	@ zero_extendqisi2
	strb	r2, [r6, #1192]
	ldrb	r2, [r4, #763]	@ zero_extendqisi2
	strb	r2, [r6, #1193]
	str	ip, [r7, #3316]
	str	r1, [r7, #3320]
	ldrb	r2, [r4, #800]	@ zero_extendqisi2
	cmp	r2, #2
	cmpeq	r3, #3
	str	r2, [r7, #3324]
	moveq	r3, #1
	movne	r3, #0
	beq	.L90
	ldrb	r2, [r4, #813]	@ zero_extendqisi2
	str	r3, [r7, #3328]
	str	r3, [r7, #3336]
	str	r2, [r7, #3332]
	str	r3, [r7, #3340]
	str	r3, [r7, #3344]
	str	r3, [r7, #3348]
	str	r3, [r7, #3352]
	str	r3, [r7, #3356]
	str	r3, [r7, #3360]
	str	r3, [r7, #3364]
.L78:
	ldr	r1, [r4, #2476]
	ldr	r0, [r4, #2448]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #2460]
	mov	r8, r0
	ldr	r0, [r4, #2448]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #2468]
	mov	r9, r0
	ldr	r0, [r4, #2448]
	bl	FSP_GetLogicFs
	cmp	r8, #0
	cmpne	r9, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L91
	ldr	r2, [r8, #24]
	cmp	r2, #0
	beq	.L92
	ldr	r3, [r8, #32]
	add	ip, r6, #21248
	add	r1, r6, #21504
	add	r2, r6, #1120
	add	ip, ip, #104
	add	r1, r1, #104
	ldr	r3, [r3, #8]
	add	r2, r2, #3
	str	r3, [r6, #1228]
	ldr	r3, [r0, #32]
	ldr	r3, [r3, #8]
	str	r3, [r6, #1232]
	ldr	r3, [r0, #24]
	add	r0, r6, #1056
	add	r0, r0, #3
	cmp	r3, #0
	ldreq	r3, [r8, #24]
	ldr	r3, [r3, #4]
	str	r3, [r6, #1224]
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ldreq	r3, [r8, #24]
	ldr	r3, [r3, #4]
	str	r3, [r6, #1220]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #4]
	str	r3, [r6, #1212]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #12]
	str	r3, [r6, #1216]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #4]
	str	r3, [r7, #3292]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #44]
	str	r3, [r7, #3296]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #48]
	str	r3, [r7, #3300]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #72]
	str	r3, [r7, #3304]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #64]
	str	r3, [r7, #3308]
	ldr	r3, [r8, #24]
	ldr	r3, [r3, #68]
	str	r3, [r7, #3312]
	mov	r3, #0
	ldrb	lr, [r8, #408]	@ zero_extendqisi2
	strb	lr, [r6, #1195]
.L86:
	ldr	lr, [ip, #4]!
	add	r3, r3, #1
	cmp	r3, #64
	strb	lr, [r0, #1]!
	ldr	lr, [r1, #4]!
	strb	lr, [r2, #1]!
	bne	.L86
	ldrh	r2, [r5, #158]
	ldrh	r3, [r5, #160]
	mul	r3, r3, r2
	str	r3, [r4, #1424]
.L76:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L91:
	movw	r1, #1441
	ldr	r3, .L93+4
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L93+8
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L90:
	sub	r1, fp, #68
	ldrb	ip, [r4, #813]	@ zero_extendqisi2
	ldr	r0, [fp, #-84]
	ldmia	r1, {r1, r2, r3}
	str	ip, [r7, #3332]
	str	r0, [r7, #3328]
	ldr	ip, [fp, #-56]
	ldr	r0, [fp, #-52]
	str	r1, [r7, #3336]
	str	r2, [r7, #3340]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-44]
	str	r3, [r7, #3344]
	ldr	r3, [fp, #-40]
	str	ip, [r7, #3348]
	str	r0, [r7, #3352]
	str	r1, [r7, #3356]
	str	r2, [r7, #3360]
	str	r3, [r7, #3364]
	b	.L78
.L92:
	ldr	lr, [r4, #2468]
	mov	r0, r2
	ldr	ip, [r4, #2476]
	movw	r1, #1447
	ldr	r3, [r4, #2460]
	str	r2, [sp, #8]
	stmia	sp, {ip, lr}
	ldr	r2, .L93+12
	bl	dprint_normal
	b	.L76
.L94:
	.align	2
.L93:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+528
	.word	.LC3
	.word	.LC4
	UNWIND(.fnend)
	.size	H263_Set_DecPar, .-H263_Set_DecPar
	.align	2
	.global	H263_Get_DecMode
	.type	H263_Get_DecMode, %function
H263_Get_DecMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #20480
	ldr	r3, [r0, #1580]
	cmp	r3, #2
	ldr	r3, [r0, #1548]
	beq	.L107
.L97:
	ldr	r3, [r3, #8]
	cmp	r3, #2
	beq	.L100
	cmp	r3, #1
	beq	.L106
	cmp	r3, #4
	movne	r3, #0
.L106:
	str	r3, [r0, #1580]
	ldmfd	sp, {fp, sp, pc}
.L107:
	ldr	r2, [r3, #8]
	cmp	r2, #2
	movne	r2, #1
	strne	r2, [r0, #2088]
	bne	.L97
.L100:
	mov	r3, #2
	str	r3, [r0, #1580]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_Get_DecMode, .-H263_Get_DecMode
	.align	2
	.global	H263_GetTrailingOneLen
	.type	H263_GetTrailingOneLen, %function
H263_GetTrailingOneLen:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r1, r0, r1
	ldrb	r3, [r1, #-1]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L111
	mov	r0, #0
.L110:
	mov	r3, r3, lsr #1
	add	r0, r0, #1
	tst	r3, #1
	bne	.L110
	cmp	r0, #0
	addne	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L111:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_GetTrailingOneLen, .-H263_GetTrailingOneLen
	.align	2
	.global	H263DEC_Init
	.type	H263DEC_Init, %function
H263DEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 784
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #788)
	sub	sp, sp, #788
	ldr	r2, .L127
	mov	r4, r0
	mov	r6, r1
	mov	r0, #3
	movw	r1, #1549
	bl	dprint_normal
	cmp	r6, #0
	cmpne	r4, #0
	beq	.L121
	ldr	r3, [r6, #596]
	ldr	r7, .L127+4
	cmp	r3, #1
	beq	.L124
.L119:
	add	r5, r4, #20480
	ldr	r3, [r7, #48]
	movw	r2, #22976
	mov	r1, #0
	ldr	r7, [r5, #2440]
	mov	r0, r4
	blx	r3
	add	r0, r4, #22528
	add	r0, r0, #48
	ldr	r8, .L127+4
	str	r7, [r5, #2440]
	bl	ResetVoQueue
	str	r6, [r5, #1548]
	mov	r0, r4
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r5, #2448]
	beq	.L125
	mov	r0, r4
	bl	H263_Global_Data_Init
	subs	r7, r0, #0
	bne	.L121
	mov	r3, #1
	str	r7, [r5, #2064]
	ldr	r2, .L127+8
	movw	r1, #1588
	str	r3, [r5, #2036]
	mov	r0, #3
	bl	dprint_normal
	ldr	r6, [r6, #596]
	cmp	r6, #1
	beq	.L126
.L118:
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L126:
	add	r0, r4, #20992
	ldr	r3, [r8, #52]
	sub	r1, fp, #812
	mov	r2, #776
	add	r0, r0, #236
	blx	r3
	add	r0, r4, #19712
	ldr	r3, [r8, #52]
	sub	r1, fp, #796
	mov	r2, #24
	add	r0, r0, #216
	blx	r3
	add	r0, r4, #19712
	ldr	r3, [r8, #52]
	sub	r1, fp, #772
	mov	r2, #604
	add	r0, r0, #240
	blx	r3
	add	r0, r4, #21760
	ldr	r3, [r8, #52]
	mov	r2, #7
	sub	r1, fp, #820
	add	r0, r0, #244
	blx	r3
	mov	r0, r7
	strb	r6, [r5, #2485]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L124:
	add	r1, r4, #20992
	ldr	r3, [r7, #52]
	add	r1, r1, #236
	mov	r2, #776
	sub	r0, fp, #812
	blx	r3
	add	r1, r4, #19712
	ldr	r3, [r7, #52]
	add	r1, r1, #216
	mov	r2, #24
	sub	r0, fp, #796
	blx	r3
	add	r1, r4, #19712
	ldr	r3, [r7, #52]
	add	r1, r1, #240
	mov	r2, #604
	sub	r0, fp, #772
	blx	r3
	add	r1, r4, #21760
	ldr	r3, [r7, #52]
	add	r1, r1, #244
	mov	r2, #7
	sub	r0, fp, #820
	blx	r3
	b	.L119
.L121:
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L125:
	ldr	r2, .L127+12
	movw	r1, #1576
	mov	r0, #0
	mvn	r7, #19
	bl	dprint_normal
	b	.L118
.L128:
	.align	2
.L127:
	.word	.LC5
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC7
	.word	.LC6
	UNWIND(.fnend)
	.size	H263DEC_Init, .-H263DEC_Init
	.align	2
	.global	H263DEC_Destroy
	.type	H263DEC_Destroy, %function
H263DEC_Destroy:
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
	add	r4, r4, #20480
	ldr	r2, .L130
	movw	r1, #1605
	mov	r0, #3
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r4, #2036]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L131:
	.align	2
.L130:
	.word	.LC8
	UNWIND(.fnend)
	.size	H263DEC_Destroy, .-H263DEC_Destroy
	.align	2
	.global	H263DEC_RecycleImage
	.type	H263DEC_RecycleImage, %function
H263DEC_RecycleImage:
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
	beq	.L137
	add	r4, r4, #20480
	mov	r2, #0
	ldr	r0, [r4, #2448]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L136
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #2448]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
.L136:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L137:
	ldr	r3, .L138
	movw	r1, #1899
	ldr	r2, .L138+4
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L139:
	.align	2
.L138:
	.word	.LANCHOR0+544
	.word	.LC9
	UNWIND(.fnend)
	.size	H263DEC_RecycleImage, .-H263DEC_RecycleImage
	.align	2
	.global	H263_SetImgFormat
	.type	H263_SetImgFormat, %function
H263_SetImgFormat:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #20480
	ldr	r1, [r0, #2476]
	ldr	r0, [r0, #2448]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_GetFsImagePtr
	UNWIND(.fnend)
	.size	H263_SetImgFormat, .-H263_SetImgFormat
	.align	2
	.global	H263DEC_FlushRemainImg
	.type	H263DEC_FlushRemainImg, %function
H263DEC_FlushRemainImg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r3, [r4, #1548]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L141
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L141
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L151
.L141:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r8, r9, fp, sp, pc}
.L151:
	ldr	r1, [r4, #2476]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	mov	r2, #1
	ldr	r1, [r6, #88]
	ldr	r0, [r4, #2448]
	bl	FSP_SetDisplay
	add	r3, r5, #22528
	ldr	r0, [r4, #2448]
	add	r3, r3, #48
	str	r6, [sp]
	mov	r2, r5
	mov	r1, #4
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L141
	ldr	r1, [r6, #88]
	mov	r0, r5
	bl	H263DEC_RecycleImage
	ldr	r1, [r6, #168]
	ldr	r0, [r4, #2448]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	ldr	r1, [r6, #176]
	strd	r8, [r6, #168]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	strd	r8, [r6, #176]
	b	.L141
	UNWIND(.fnend)
	.size	H263DEC_FlushRemainImg, .-H263DEC_FlushRemainImg
	.align	2
	.global	H263DEC_GetImageBuffer
	.type	H263DEC_GetImageBuffer, %function
H263DEC_GetImageBuffer:
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
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r0, [r4, #2448]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	cmn	r0, #1
	beq	.L156
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L156:
	add	r1, r5, #22528
	ldr	r0, [r4, #2448]
	add	r1, r1, #48
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	H263DEC_GetImageBuffer, .-H263DEC_GetImageBuffer
	.align	2
	.global	H263_GetPacketState
	.type	H263_GetPacketState, %function
H263_GetPacketState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #16384
	ldr	r3, [r0, #3540]
	cmp	r3, #1
	mvnne	r0, #0
	moveq	r0, #3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_GetPacketState, .-H263_GetPacketState
	.align	2
	.global	H263_ClearCurPacket
	.type	H263_ClearCurPacket, %function
H263_ClearCurPacket:
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
	mov	r4, r1
	ldr	r1, [r1, #20]
	mov	r5, r0
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L161
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L162
.L161:
	ldr	r3, .L163
	mov	r0, r4
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L162:
	mov	r0, r5
	ldr	r1, [r4, #100]
	bl	SM_ReleaseStreamSeg
	b	.L161
.L164:
	.align	2
.L163:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	H263_ClearCurPacket, .-H263_ClearCurPacket
	.align	2
	.global	H263_ClearCurPic
	.type	H263_ClearCurPic, %function
H263_ClearCurPic:
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
	add	r8, r0, #16384
	add	r3, r0, #20480
	ldr	r6, [r8, #3532]
	ldr	r7, [r3, #2448]
	cmp	r6, #0
	addgt	r5, r0, #15808
	movgt	r4, #0
	addgt	r5, r5, #8
	ble	.L168
.L167:
	add	r4, r4, #1
	ldr	r1, [r5, #4]!
	mov	r0, r7
	bl	SM_ReleaseStreamSeg
	cmp	r6, r4
	bne	.L167
.L168:
	mov	r3, #0
	str	r3, [r8, #3532]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_ClearCurPic, .-H263_ClearCurPic
	.align	2
	.global	H263_GetScdUpMsg
	.type	H263_GetScdUpMsg, %function
H263_GetScdUpMsg:
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
	add	r2, r0, #20480
	add	r3, r0, #15808
	add	r4, r0, #22784
	add	r3, r3, #8
	ldr	r2, [r2, #1548]
	add	r4, r4, #188
	ldr	r0, [r2, #816]
	cmp	r0, #1
	beq	.L173
.L172:
	ldr	r6, .L174
	add	r5, r1, #72
	mov	r0, r3
	mov	r2, #4
	mov	r1, r5
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r3, [r6, #52]
	mov	r1, r5
	mov	r0, r4
	mov	r2, #4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L173:
	ldr	r2, [r2, #848]
	cmp	r2, #1
	bne	.L172
	ldr	ip, .L174
	mov	r0, r3
	mov	r1, r4
	mov	r2, #4
	ldr	r3, [ip, #52]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L175:
	.align	2
.L174:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	H263_GetScdUpMsg, .-H263_GetScdUpMsg
	.align	2
	.global	H263_Check_Slice_NotSH
	.type	H263_Check_Slice_NotSH, %function
H263_Check_Slice_NotSH:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #16384
	add	r2, r0, #20480
	ldrb	r1, [r3, #3587]	@ zero_extendqisi2
	ldrb	r3, [r2, #680]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L184
	add	r0, r0, #12288
	ldrb	r1, [r0, #3528]	@ zero_extendqisi2
	tst	r1, #120
	bne	.L184
	movw	r1, #3528
	ldrh	r0, [r0, r1]
	ubfx	r0, r0, #7, #4
	add	r0, r0, #17
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L178
.L180:
	.word	.L185
	.word	.L181
	.word	.L182
	.word	.L181
.L184:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L185:
	mov	r3, #17
.L179:
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L182:
	ldrb	r3, [r2, #689]	@ zero_extendqisi2
	ldrb	r2, [r2, #688]	@ zero_extendqisi2
	cmp	r3, r2
	movcc	r3, r2
	cmp	r3, #1
	addgt	r3, r3, #16
	movle	r3, #18
	b	.L179
.L181:
	ldrb	r3, [r2, #688]	@ zero_extendqisi2
	add	r3, r3, #16
	b	.L179
.L178:
	ldr	r2, .L188
	movw	r1, #2241
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L189:
	.align	2
.L188:
	.word	.LC10
	UNWIND(.fnend)
	.size	H263_Check_Slice_NotSH, .-H263_Check_Slice_NotSH
	.align	2
	.global	H263_Combine_SliceData
	.type	H263_Combine_SliceData, %function
H263_Combine_SliceData:
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
	add	r3, r0, #16384
	add	r2, r0, #12288
	add	r0, r0, #1232
	ldr	ip, [r3, #3536]
	add	r0, r0, #8
	ldr	r3, [r2, #3288]
	tst	ip, #2
	beq	.L191
	ldrb	lr, [r2, #3374]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L207
	cmp	lr, #0
	bne	.L199
	ldrb	ip, [r2, #3454]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L199
	mov	ip, r3, asl #5
	sub	r3, ip, r3, asl #2
	sub	r3, r3, #28
	add	r3, r0, r3
	ldr	r0, [r3, #12]
	cmp	r0, #0
	bne	.L206
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L206
	ldr	ip, [r3, #8]
	add	r1, ip, r1, lsl #3
	str	r1, [r3, #8]
	ldr	r1, [r2, #3460]
	str	r1, [r3, #24]
	ldr	r2, [r2, #3464]
	mov	r2, r2, asl #3
	str	r2, [r3, #12]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L207:
	sub	r4, r3, #1
	movw	ip, #510
	cmp	r4, ip
	bhi	.L208
	mov	ip, r3, asl #5
	sub	r3, ip, r3, asl #2
	sub	r3, r3, #28
	add	r3, r0, r3
	ldr	r0, [r3, #12]
	cmp	r0, #0
	beq	.L195
	ldr	ip, [r3, #24]
	cmp	ip, #0
	beq	.L195
	ldr	r2, [r2, #3380]
	cmp	ip, r2
	bhi	.L209
	add	r1, r0, r1, lsl #3
	mov	r0, #0
	str	r1, [r3, #12]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L195:
	ldr	ip, [r2, #3380]
	ldr	r0, [r3, #20]
	cmp	ip, r0
	movls	r1, r1, asl #3
	strls	r1, [r3, #12]
	ldrls	r2, [r2, #3380]
	movhi	r0, #0
	ldrhi	r2, [r3, #8]
	movls	r0, #0
	addhi	r1, r2, r1, lsl #3
	strls	r2, [r3, #24]
	strhi	r1, [r3, #8]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L199:
	movw	r3, #2310
.L205:
	ldr	r2, .L210
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
.L206:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L191:
	movw	r3, #2316
	b	.L205
.L208:
	mov	r0, lr
	ldr	r2, .L210+4
	movw	r1, #2269
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L209:
	movw	r3, #2289
	mov	r0, lr
	mov	r1, r3
	ldr	r2, .L210
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L211:
	.align	2
.L210:
	.word	.LC12
	.word	.LC11
	UNWIND(.fnend)
	.size	H263_Combine_SliceData, .-H263_Combine_SliceData
	.align	2
	.global	H263_Check_StreamType
	.type	H263_Check_StreamType, %function
H263_Check_StreamType:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #20480
	mov	r2, #1
	mov	r0, #196
	str	r0, [r1]
	mov	r0, #0
	strb	r2, [r3, #757]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263_Check_StreamType, .-H263_Check_StreamType
	.align	2
	.global	H263_Clean_HeadPacket
	.type	H263_Clean_HeadPacket, %function
H263_Clean_HeadPacket:
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
	add	r3, r0, #20480
	mov	r8, r0
	ldr	r6, [r3, #2004]
	ldr	r7, [r3, #2448]
	cmp	r6, #64
	movge	r6, #64
	cmp	r6, #0
	addgt	r5, r0, #22016
	movgt	r4, #0
	addgt	r5, r5, #208
	ble	.L216
.L215:
	add	r4, r4, #1
	ldr	r1, [r5, #4]!
	mov	r0, r7
	bl	SM_ReleaseStreamSeg
	cmp	r4, r6
	bne	.L215
.L216:
	ldr	r3, .L218
	add	r0, r8, #22016
	add	r0, r0, #48
	mov	r2, #440
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L219:
	.align	2
.L218:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	H263_Clean_HeadPacket, .-H263_Clean_HeadPacket
	.align	2
	.global	H263DEC_VDMPostProc
	.type	H263DEC_VDMPostProc, %function
H263DEC_VDMPostProc:
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
	ldr	r3, .L271
	mov	r5, r0
	movw	r2, #14616
	mov	r6, r1
	add	r0, r0, #1040
	ldr	r3, [r3, #48]
	mov	r1, #0
	blx	r3
	add	r4, r5, #20480
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L265
.L221:
	str	r6, [r4, #2032]
	ldr	r1, [r4, #2476]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #2468]
	mov	r6, r0
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	cmp	r6, #0
	mov	r7, r0
	beq	.L266
	ldr	r3, [r4, #2032]
	add	r1, r5, #22528
	add	r1, r1, #20
	str	r3, [r6, #96]
	ldr	r0, [r4, #2448]
	bl	H263_ClearUsrData
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L224
	ldr	r2, [r4, #1548]
	ldr	r3, [r4, #2032]
	ldr	r1, [r2]
	cmp	r3, r1
	bhi	.L267
.L224:
	mov	r3, #0
	ldr	r1, [r4, #2476]
	str	r3, [r4, #2088]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	ldr	r3, [r4, #1548]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L268
	ldr	ip, [r4, #2476]
	ldrb	r6, [r4, #1392]	@ zero_extendqisi2
	str	ip, [r4, #2480]
.L230:
	cmn	ip, #1
	beq	.L232
	mov	r1, ip
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L269
	ldr	r3, [r7, #96]
	cmp	r3, #0
	beq	.L234
	ldr	r2, [r4, #1548]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	bhi	.L235
.L234:
	ldr	r1, [r4, #2480]
	ldr	r0, [r4, #2448]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L270
	cmp	r6, #2
	beq	.L237
	ldr	r3, [r10, #20]
	cmp	r3, #2
	beq	.L237
	ldr	r3, [r4, #2480]
	mov	r1, #2112
	ldr	r2, .L271+4
	mov	r0, #9
	bl	dprint_normal
.L232:
	ldr	r3, [r4, #2040]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #2040]
.L264:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L268:
	ldrb	lr, [r4, #1392]	@ zero_extendqisi2
	cmp	lr, #2
	beq	.L228
	ldr	r3, [r4, #2456]
	cmp	r3, #1
	ble	.L229
	ldr	ip, [r4, #2460]
	str	ip, [r4, #2480]
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	b	.L230
.L235:
	ldr	r1, .L271+8
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L240
	str	r3, [fp, #-52]
	mov	r1, #23
	mov	r3, #8
	str	r2, [fp, #-48]
	ldr	r0, [r4, #2448]
	sub	r2, fp, #52
	blx	r5
	ldr	r2, [r4, #1548]
	ldr	r3, [r7, #96]
	ldr	r2, [r2, #4]
.L240:
	str	r2, [sp]
	movw	r1, #2118
	ldr	r2, .L271+12
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r7, #168]
	ldr	r0, [r4, #2448]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	ldr	r1, [r7, #176]
	strd	r8, [r7, #168]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	mov	r2, #0
	ldr	r1, [r4, #2480]
	ldr	r0, [r4, #2448]
	bl	FSP_SetDisplay
	b	.L232
.L237:
	mov	r2, #1
	ldr	r1, [r4, #2480]
	ldr	r0, [r4, #2448]
	bl	FSP_SetDisplay
	add	r3, r5, #22528
	ldr	r0, [r4, #2448]
	add	r3, r3, #48
	str	r7, [sp]
	mov	r2, r5
	mov	r1, #4
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L232
	ldr	r1, [r7, #168]
	mov	r8, #0
	ldr	r0, [r4, #2448]
	mov	r9, #0
	bl	FreeUsdByDec
	strd	r8, [r7, #168]
	ldr	r1, [r7, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	mov	r2, #0
	ldr	r0, [r4, #2448]
	ldr	r1, [r4, #2480]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L264
.L265:
	mov	r2, #0
	ldr	r1, [r4, #2476]
	ldr	r0, [r4, #2448]
	bl	FSP_SetRef
	b	.L221
.L228:
	ldr	ip, [r4, #2476]
	cmp	r7, #0
	str	ip, [r4, #2480]
	beq	.L242
	ldrd	r0, [r7, #208]
	ldrd	r2, [r6, #208]
	cmp	r0, r2
	sbcs	r8, r1, r3
	bge	.L242
	strd	r0, [r6, #208]
	mov	r6, lr
	strd	r2, [r7, #208]
	ldr	ip, [r4, #2480]
	b	.L230
.L229:
	mvn	r3, #0
	str	r3, [r4, #2480]
	b	.L232
.L242:
	mov	r6, lr
	b	.L230
.L267:
	ldr	r1, .L271+8
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L225
	str	r3, [fp, #-52]
	mov	r1, #23
	ldr	ip, [r2]
	mov	r3, #8
	sub	r2, fp, #52
	ldr	r0, [r4, #2448]
	str	ip, [fp, #-48]
	blx	r5
.L225:
	mov	r3, #1
	ldr	r1, [r4, #2468]
	str	r3, [r4, #2088]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L226
	ldr	r1, [r5, #168]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r5, #184]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r5, #192]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r5, #168]
	strd	r2, [r5, #176]
	strd	r2, [r5, #184]
	strd	r2, [r5, #192]
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2448]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2468]
	str	r0, [r4, #2460]
.L226:
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2456]
	b	.L264
.L266:
	str	r0, [sp]
	mov	r3, r6
	mov	r0, r6
	ldr	r2, .L271+16
	movw	r1, #2015
	bl	dprint_normal
	mvn	r0, #0
	b	.L264
.L269:
	movw	r3, #2078
	ldr	r2, .L271+20
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L264
.L270:
	ldr	r1, [r7, #168]
	mov	r8, #0
	ldr	r0, [r4, #2448]
	mov	r9, #0
	bl	FreeUsdByDec
	strd	r8, [r7, #168]
	ldr	r1, [r7, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	mov	r2, r10
	ldr	r0, [r4, #2448]
	ldr	r1, [r4, #2480]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L264
.L272:
	.align	2
.L271:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC15
	.word	g_EventReportFunc
	.word	.LC16
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	H263DEC_VDMPostProc, .-H263DEC_VDMPostProc
	.align	2
	.global	H263_Record_SlcSegID
	.type	H263_Record_SlcSegID, %function
H263_Record_SlcSegID:
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
	add	r5, r0, #16384
	movw	r6, #1022
	mov	r4, r0
	ldr	r3, [r5, #3532]
	cmp	r3, r6
	bhi	.L276
	add	r1, r0, #12288
	add	r4, r0, r3, lsl #2
	add	r4, r4, #12288
	add	r2, r3, #1
	ldr	r0, [r1, #3388]
	str	r0, [r4, #3532]
	str	r2, [r5, #3532]
	ldrb	r2, [r1, #3374]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L273
	ldrb	r2, [r1, #3454]	@ zero_extendqisi2
	cmp	r2, #1
	addeq	r3, r3, #2
	ldreq	r2, [r1, #3468]
	streq	r2, [r4, #3536]
	streq	r3, [r5, #3532]
.L273:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L276:
	bl	H263_Clean_HeadPacket
	mov	r0, r4
	bl	H263_ClearCurPic
	add	r3, r4, #20480
	add	r1, r4, #15616
	ldr	r0, [r3, #2448]
	add	r1, r1, #40
	bl	H263_ClearCurPacket
	ldr	r3, [r5, #3532]
	movw	r1, #2586
	str	r6, [sp]
	ldr	r2, .L277
	mov	r0, #0
	bl	dprint_normal
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L278:
	.align	2
.L277:
	.word	.LC17
	UNWIND(.fnend)
	.size	H263_Record_SlcSegID, .-H263_Record_SlcSegID
	.align	2
	.global	H263_Syntax_PicHeader
	.type	H263_Syntax_PicHeader, %function
H263_Syntax_PicHeader:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r7, r0, #12288
	mov	r5, r0
	mov	r4, r1
	ldr	r3, [r7, #3288]
	mov	r6, r2
	cmp	r3, #0
	bne	.L374
.L280:
	mov	r1, r4
	mov	r2, r6
	sub	r0, fp, #76
	add	r4, r5, #20480
	bl	BsInit
	ldr	r3, .L386
	add	r0, r5, #20992
	mov	r2, #68
	mov	r1, #0
	add	r0, r0, #168
	ldr	r3, [r3, #48]
	blx	r3
	mov	r1, #22
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #13
	sub	r0, fp, #76
	bl	BsSkip
	sub	r0, fp, #76
	mov	r1, #3
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #690]
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L281
.L283:
	.word	.L369
	.word	.L284
	.word	.L285
	.word	.L286
	.word	.L287
	.word	.L288
	.word	.L369
.L374:
	ldr	r2, .L386+4
	mov	r1, #212
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r7, #3288]
	b	.L280
.L281:
	cmp	r0, #7
	bne	.L334
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r9, r0
	cmp	r9, #1
	bhi	.L363
	movne	r8, #0
	strne	r8, [fp, #-80]
	strne	r8, [fp, #-84]
	beq	.L375
.L298:
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #680]
	cmp	r0, #1
	bls	.L308
.L369:
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r4, #1529]
	bl	BsPos
	ldr	r3, .L386+8
	ldr	r6, [r3]
	cmp	r6, r7
	mov	r5, r0
	beq	.L347
	ldr	r0, [r4, #2448]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r6
	mov	r0, r5
.L362:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L284:
	add	r2, r4, #692
	add	r3, r4, #740
	mov	r1, #6
	strb	r1, [r4, #691]
	mov	r1, #8
	strh	r1, [r2]	@ movhi
	mov	r2, #128
	str	r2, [r4, #1464]
	mov	r2, #96
	str	r2, [r4, #1460]
	strh	r1, [r3]	@ movhi
.L334:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	ldrb	r3, [r4, #755]	@ zero_extendqisi2
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r4, #680]
	beq	.L309
	adds	r0, r0, #0
	ldr	r3, [r4, #2088]
	movne	r0, #1
	cmp	r3, #1
	movne	r0, #0
	cmp	r0, #0
	bne	.L309
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	uxtb	r0, r0
	cmp	r0, #0
	strneb	r0, [r4, #687]
	sub	r0, fp, #76
	moveq	r3, #1
	streqb	r3, [r4, #687]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	movne	r10, #0
	beq	.L376
.L296:
	mov	r6, r6, asl #3
.L329:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #1
	beq	.L377
	add	r10, r10, #1
	cmp	r10, #15
	bhi	.L363
	add	r9, r5, #16384
	mov	r2, #1
	strb	r2, [r4, #1529]
	sub	r0, fp, #76
	ldr	r3, [r9, #3536]
	orr	r3, r3, #2
	str	r3, [r9, #3536]
	ldr	r3, [r7, #3288]
	add	r3, r3, r2
	str	r3, [r7, #3288]
	strb	r2, [r4, #688]
	bl	BsPos
	mov	r3, r0, asr #31
	cmp	r0, #0
	add	r1, r0, #7
	rsb	r6, r0, r6
	mov	r3, r3, lsr #29
	str	r6, [r5, #1248]
	add	r2, r0, r3
	movge	r1, r0
	mov	r8, r0
	and	r2, r2, #7
	ldr	r0, [r4, #1544]
	rsb	r3, r3, r2
	add	r3, r3, r0
	strb	r3, [r5, #1245]
	ldr	r3, [r4, #1536]
	add	r3, r3, r1, asr #3
	str	r3, [r5, #1260]
	ldrb	r3, [r7, #3374]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L331
	ldrb	r2, [r7, #3454]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L378
.L331:
	mov	r3, #0
	str	r3, [r5, #1252]
	strb	r3, [r5, #1246]
	str	r3, [r5, #1264]
.L332:
	ldrb	r3, [r4, #680]	@ zero_extendqisi2
	strb	r3, [r5, #1243]
	ldrb	r3, [r4, #689]	@ zero_extendqisi2
	strb	r3, [r5, #1241]
	ldrb	r3, [r4, #688]	@ zero_extendqisi2
	strb	r3, [r5, #1240]
	ldrb	r3, [r4, #687]	@ zero_extendqisi2
	strb	r3, [r5, #1244]
	ldrb	r3, [r4, #684]	@ zero_extendqisi2
	strb	r3, [r5, #1242]
	ldr	r3, [r9, #3532]
	cmp	r3, #0
	bne	.L379
.L333:
	mov	r0, r5
	bl	H263_Record_SlcSegID
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L285:
	add	r2, r4, #692
	add	r3, r4, #740
	mov	r1, #9
	strb	r1, [r4, #691]
	mov	r1, #11
	strh	r1, [r2]	@ movhi
	mov	r2, #176
	str	r2, [r4, #1464]
	mov	r2, #144
	str	r2, [r4, #1460]
	strh	r1, [r3]	@ movhi
	b	.L334
.L287:
	add	r2, r4, #692
	add	r3, r4, #740
	mov	r1, #18
	strb	r1, [r4, #691]
	mov	r1, #88
	strh	r1, [r2]	@ movhi
	mov	r2, #704
	str	r2, [r4, #1464]
	mov	r2, #576
	str	r2, [r4, #1460]
	strh	r1, [r3]	@ movhi
	b	.L334
.L288:
	add	r2, r4, #692
	add	r3, r4, #740
	mov	r1, #18
	strb	r1, [r4, #691]
	mov	r1, #352
	strh	r1, [r2]	@ movhi
	mov	r2, #1408
	str	r2, [r4, #1464]
	mov	r2, #1152
	str	r2, [r4, #1460]
	strh	r1, [r3]	@ movhi
	b	.L334
.L286:
	add	r2, r4, #692
	add	r3, r4, #740
	mov	r1, #18
	strb	r1, [r4, #691]
	mov	r1, #22
	strh	r1, [r2]	@ movhi
	mov	r2, #352
	str	r2, [r4, #1464]
	mov	r2, #288
	str	r2, [r4, #1460]
	strh	r1, [r3]	@ movhi
	b	.L334
.L377:
	sub	r0, fp, #76
	add	r10, r10, #1
	bl	BsPos
	mov	r1, #8
	cmp	r0, r6
	sub	r0, fp, #76
	bgt	.L380
	bl	BsSkip
	cmp	r10, #15
	bls	.L329
.L363:
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r4, #1529]
	bl	BsPos
	ldr	r3, .L386+8
	ldr	r6, [r3]
	cmp	r6, r7
	mov	r5, r0
	beq	.L347
	ldr	r0, [r4, #2448]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #22
	blx	r6
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L309:
	sub	r0, fp, #76
	bl	BsPos
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L347:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L376:
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	mov	r10, #0
	b	.L296
.L379:
	ldr	r2, .L386+12
	movw	r1, #635
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	bl	H263_ClearCurPic
	b	.L333
.L380:
	bl	BsPos
	b	.L362
.L308:
	ldrb	r3, [r4, #755]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L309
	adds	r10, r0, #0
	ldr	r1, [r4, #2088]
	movne	r10, #1
	cmp	r1, #1
	movne	r10, #0
	cmp	r10, #0
	bne	.L309
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #682]
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r1, r0
	cmp	r1, #1
	beq	.L311
	strb	r10, [r4, #1529]
	sub	r0, fp, #76
	bl	BsPos
	ldr	r2, .L386+8
	ldr	r6, [r2]
	cmp	r6, #0
	mov	r5, r0
	beq	.L347
	ldr	r0, [r4, #2448]
	mov	r3, r10
	mov	r2, r10
	mov	r1, #22
	blx	r6
	mov	r0, r5
	b	.L362
.L375:
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #690]
	cmp	r0, #7
	ldrls	pc, [pc, r0, asl #2]
	b	.L299
.L301:
	.word	.L369
	.word	.L302
	.word	.L303
	.word	.L304
	.word	.L305
	.word	.L306
	.word	.L299
	.word	.L369
.L306:
	add	r1, r4, #692
	add	r3, r4, #740
	mov	r0, #18
	strb	r0, [r4, #691]
	mov	r0, #352
	strh	r0, [r1]	@ movhi
	mov	r1, #1408
	str	r1, [r4, #1464]
	mov	r1, #1152
	str	r1, [r4, #1460]
	strh	r0, [r3]	@ movhi
.L299:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	mov	r10, r0
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	str	r0, [fp, #-80]
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	mov	r8, r0
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #4
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #8
	bne	.L363
	uxtb	r3, r10
	str	r3, [fp, #-84]
	ldrb	r3, [fp, #-80]	@ zero_extendqisi2
	uxtb	r8, r8
	str	r3, [fp, #-80]
	b	.L298
.L305:
	add	r1, r4, #692
	add	r3, r4, #740
	mov	r0, #18
	strb	r0, [r4, #691]
	mov	r0, #88
	strh	r0, [r1]	@ movhi
	mov	r1, #704
	str	r1, [r4, #1464]
	mov	r1, #576
	str	r1, [r4, #1460]
	strh	r0, [r3]	@ movhi
	b	.L299
.L302:
	add	r1, r4, #692
	add	r3, r4, #740
	mov	r0, #6
	strb	r0, [r4, #691]
	mov	r0, #8
	strh	r0, [r1]	@ movhi
	mov	r1, #128
	str	r1, [r4, #1464]
	mov	r1, #96
	str	r1, [r4, #1460]
	strh	r0, [r3]	@ movhi
	b	.L299
.L304:
	add	r1, r4, #692
	add	r3, r4, #740
	mov	r0, #18
	strb	r0, [r4, #691]
	mov	r0, #22
	strh	r0, [r1]	@ movhi
	mov	r1, #352
	str	r1, [r4, #1464]
	mov	r1, #288
	str	r1, [r4, #1460]
	strh	r0, [r3]	@ movhi
	b	.L299
.L303:
	add	r1, r4, #692
	add	r3, r4, #740
	mov	r0, #9
	strb	r0, [r4, #691]
	mov	r0, #11
	strh	r0, [r1]	@ movhi
	mov	r1, #176
	str	r1, [r4, #1464]
	mov	r1, #144
	str	r1, [r4, #1460]
	strh	r0, [r3]	@ movhi
	b	.L299
.L378:
	ldr	r2, [r7, #3464]
	strb	r3, [r5, #1246]
	mov	r3, r2, asl #3
	str	r3, [r5, #1252]
	ldr	r3, [r7, #3460]
	str	r3, [r5, #1264]
	b	.L332
.L311:
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	beq	.L381
.L312:
	cmp	r9, #1
	beq	.L382
	ldr	r3, [fp, #-84]
	mov	r10, #0
	cmp	r3, #1
	beq	.L335
.L322:
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	strneb	r0, [r4, #687]
	moveq	r2, #1
	streqb	r2, [r4, #687]
	b	.L296
.L382:
	ldrb	r3, [r4, #690]	@ zero_extendqisi2
	cmp	r3, #6
	movne	r10, #0
	beq	.L383
.L314:
	ldr	r3, [fp, #-84]
	cmp	r3, #1
	beq	.L384
.L321:
	ldr	r3, [fp, #-80]
	cmp	r3, #1
	beq	.L385
.L324:
	cmp	r8, #1
	bne	.L322
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	b	.L322
.L381:
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	b	.L312
.L384:
	mov	r1, #8
	sub	r0, fp, #76
	bl	BsGet
.L335:
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	cmp	r9, #1
	bne	.L322
	b	.L321
.L385:
	mov	r1, r3
	sub	r0, fp, #76
	bl	BsGet
	tst	r0, #255
	bne	.L324
	ldr	r1, [fp, #-80]
	sub	r0, fp, #76
	bl	BsGet
	b	.L324
.L383:
	mov	r1, #4
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #9
	uxtb	r10, r0
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r9
	add	r3, r0, #1
	sub	r0, fp, #76
	mov	r3, r3, asl #2
	str	r3, [r4, #1464]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	bne	.L363
	mov	r1, #9
	sub	r0, fp, #76
	bl	BsGet
	cmp	r10, #15
	mov	r0, r0, asl #2
	str	r0, [r4, #1460]
	bne	.L316
	mov	r1, #8
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #8
	sub	r0, fp, #76
	bl	BsGet
.L316:
	ldr	r1, [r4, #1464]
	add	r0, r4, #692
	add	r1, r1, #15
	ubfx	r1, r1, #4, #16
	strh	r1, [r0]	@ movhi
	ldr	r3, [r4, #1460]
	cmp	r3, #400
	bhi	.L317
	add	r3, r3, #15
	add	r0, r4, #740
	mov	r10, #0
	mov	r3, r3, lsr #4
	strb	r3, [r4, #691]
	strh	r1, [r0]	@ movhi
	b	.L314
.L317:
	cmp	r3, #800
	bhi	.L318
	add	lr, r3, #31
	mov	ip, r1, asl #1
	ands	r3, r3, #31
	mov	lr, lr, lsr #5
	uxth	ip, ip
	strb	lr, [r4, #691]
	strh	ip, [r0]	@ movhi
	beq	.L320
.L364:
	add	r3, r3, #15
	add	r0, r4, #740
	mov	r10, r3, lsr #4
	smulbb	r1, r10, r1
	strh	r1, [r0]	@ movhi
	b	.L314
.L318:
	add	lr, r3, #63
	mov	ip, r1, asl #2
	ands	r3, r3, #63
	mov	lr, lr, lsr #6
	uxth	ip, ip
	strb	lr, [r4, #691]
	strh	ip, [r0]	@ movhi
	bne	.L364
.L320:
	add	r1, r4, #740
	mov	r10, r3
	strh	ip, [r1]	@ movhi
	b	.L314
.L387:
	.align	2
.L386:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	.word	g_EventReportFunc
	.word	.LC19
	UNWIND(.fnend)
	.size	H263_Syntax_PicHeader, .-H263_Syntax_PicHeader
	.align	2
	.global	H263_Syntax_Sorenson_PicHeader
	.type	H263_Syntax_Sorenson_PicHeader, %function
H263_Syntax_Sorenson_PicHeader:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	add	r8, r0, #12288
	mov	r6, r0
	mov	r4, r1
	ldr	r3, [r8, #3288]
	mov	r7, r2
	cmp	r3, #0
	bne	.L440
.L389:
	mov	r1, r4
	mov	r2, r7
	sub	r0, fp, #68
	add	r5, r6, #20480
	bl	BsInit
	ldr	r3, .L445
	add	r0, r6, #20992
	mov	r2, #68
	mov	r1, #0
	add	r0, r0, #168
	ldr	r3, [r3, #48]
	blx	r3
	mov	r1, #17
	sub	r0, fp, #68
	bl	BsSkip
	mov	r1, #5
	sub	r0, fp, #68
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #742]
	sub	r0, fp, #68
	bl	BsSkip
	sub	r0, fp, #68
	mov	r1, #3
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #690]
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L390
.L392:
	.word	.L391
	.word	.L393
	.word	.L394
	.word	.L395
	.word	.L396
	.word	.L397
	.word	.L398
.L440:
	ldr	r2, .L445+4
	movw	r1, #654
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r8, #3288]
	b	.L389
.L398:
	add	r2, r5, #692
	add	r3, r5, #740
	mov	r4, #0
	mov	r1, #8
	strb	r1, [r5, #691]
	mov	r1, #10
	strh	r1, [r2]	@ movhi
	mov	r2, #160
	str	r2, [r5, #1464]
	mov	r2, #120
	str	r2, [r5, #1460]
	strh	r1, [r3]	@ movhi
.L399:
	mov	r1, #2
	sub	r0, fp, #68
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #680]
	cmp	r0, #2
	moveq	r3, #1
	streqb	r3, [r5, #743]
	streqb	r3, [r5, #680]
	beq	.L406
	cmp	r0, #3
	beq	.L436
.L406:
	ldrb	r3, [r5, #755]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L407
	ldr	r3, [r5, #2088]
	cmp	r3, #1
	bne	.L408
	ldrb	r3, [r5, #680]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L407
.L408:
	mov	r1, #1
	sub	r0, fp, #68
	bl	BsGet
	mov	r1, #5
	mov	r7, r7, asl #3
	strb	r0, [r5, #744]
	sub	r0, fp, #68
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	strneb	r0, [r5, #687]
	moveq	r3, #1
	streqb	r3, [r5, #687]
.L413:
	mov	r1, #1
	sub	r0, fp, #68
	bl	BsGet
	cmp	r0, #1
	beq	.L441
	add	r4, r4, #1
	cmp	r4, #15
	bhi	.L436
	add	r9, r6, #16384
	mov	r2, #1
	strb	r2, [r5, #1529]
	sub	r0, fp, #68
	ldr	r3, [r9, #3536]
	orr	r3, r3, #2
	str	r3, [r9, #3536]
	ldr	r3, [r8, #3288]
	add	r3, r3, r2
	str	r3, [r8, #3288]
	strb	r2, [r5, #688]
	bl	BsPos
	mov	r3, r0, asr #31
	cmp	r0, #0
	add	r1, r0, #7
	rsb	r7, r0, r7
	mov	r3, r3, lsr #29
	str	r7, [r6, #1248]
	add	r2, r0, r3
	movge	r1, r0
	mov	r4, r0
	and	r2, r2, #7
	ldr	r0, [r5, #1544]
	rsb	r3, r3, r2
	add	r3, r3, r0
	strb	r3, [r6, #1245]
	ldr	r3, [r5, #1536]
	add	r3, r3, r1, asr #3
	str	r3, [r6, #1260]
	ldrb	r3, [r8, #3374]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L415
	ldrb	r2, [r8, #3454]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L442
.L415:
	mov	r3, #0
	str	r3, [r6, #1252]
	strb	r3, [r6, #1246]
	str	r3, [r6, #1264]
.L416:
	ldrb	r3, [r5, #680]	@ zero_extendqisi2
	strb	r3, [r6, #1243]
	ldrb	r3, [r5, #689]	@ zero_extendqisi2
	strb	r3, [r6, #1241]
	ldrb	r3, [r5, #688]	@ zero_extendqisi2
	strb	r3, [r6, #1240]
	ldrb	r3, [r5, #687]	@ zero_extendqisi2
	strb	r3, [r6, #1244]
	ldrb	r3, [r5, #684]	@ zero_extendqisi2
	strb	r3, [r6, #1242]
	ldr	r3, [r9, #3532]
	cmp	r3, #0
	bne	.L443
.L417:
	mov	r0, r6
	bl	H263_Record_SlcSegID
	mov	r0, r4
.L435:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L394:
	add	r2, r5, #692
	add	r3, r5, #740
	mov	r1, #18
	mov	r4, #0
	strb	r1, [r5, #691]
	mov	r1, #22
	strh	r1, [r2]	@ movhi
	mov	r2, #352
	str	r2, [r5, #1464]
	mov	r2, #288
	str	r2, [r5, #1460]
	strh	r1, [r3]	@ movhi
	b	.L399
.L391:
	mov	r1, #8
	sub	r0, fp, #68
	bl	BsGet
	mov	r1, #8
	mov	r4, #0
	str	r0, [r5, #1464]
	sub	r0, fp, #68
	bl	BsGet
	ldr	r3, [r5, #1464]
	add	r2, r5, #740
	add	r3, r3, #15
	ubfx	r3, r3, #4, #16
	str	r0, [r5, #1460]
	add	r1, r0, #15
	add	r0, r5, #692
	mov	r1, r1, lsr #4
	strh	r3, [r0]	@ movhi
	strb	r1, [r5, #691]
	strh	r3, [r2]	@ movhi
	b	.L399
.L393:
	mov	r1, #16
	sub	r0, fp, #68
	bl	BsGet
	mov	r1, #16
	str	r0, [r5, #1464]
	sub	r0, fp, #68
	bl	BsGet
	ldr	r2, [r5, #1464]
	add	r3, r5, #692
	add	r2, r2, #15
	ubfx	r2, r2, #4, #16
	cmp	r0, #400
	str	r0, [r5, #1460]
	strh	r2, [r3]	@ movhi
	bhi	.L400
	add	r3, r0, #15
	add	r1, r5, #740
	mov	r4, #0
	mov	r3, r3, lsr #4
	strb	r3, [r5, #691]
	strh	r2, [r1]	@ movhi
	b	.L399
.L396:
	add	r2, r5, #692
	add	r3, r5, #740
	mov	r1, #6
	mov	r4, #0
	strb	r1, [r5, #691]
	mov	r1, #8
	strh	r1, [r2]	@ movhi
	mov	r2, #128
	str	r2, [r5, #1464]
	mov	r2, #96
	str	r2, [r5, #1460]
	strh	r1, [r3]	@ movhi
	b	.L399
.L395:
	add	r2, r5, #692
	add	r3, r5, #740
	mov	r1, #9
	mov	r4, #0
	strb	r1, [r5, #691]
	mov	r1, #11
	strh	r1, [r2]	@ movhi
	mov	r2, #176
	str	r2, [r5, #1464]
	mov	r2, #144
	str	r2, [r5, #1460]
	strh	r1, [r3]	@ movhi
	b	.L399
.L397:
	add	r2, r5, #692
	add	r3, r5, #740
	mov	r1, #15
	mov	r4, #0
	strb	r1, [r5, #691]
	mov	r1, #20
	strh	r1, [r2]	@ movhi
	mov	r2, #320
	str	r2, [r5, #1464]
	mov	r2, #240
	str	r2, [r5, #1460]
	strh	r1, [r3]	@ movhi
	b	.L399
.L441:
	sub	r0, fp, #68
	add	r4, r4, #1
	bl	BsPos
	mov	r1, #8
	cmp	r0, r7
	sub	r0, fp, #68
	bgt	.L444
	bl	BsSkip
	cmp	r4, #15
	bls	.L413
.L436:
	mov	r7, #0
	sub	r0, fp, #68
	strb	r7, [r5, #1529]
	bl	BsPos
	ldr	r3, .L445+8
	ldr	r6, [r3]
	cmp	r6, r7
	mov	r4, r0
	beq	.L421
	ldr	r0, [r5, #2448]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #22
	blx	r6
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L407:
	sub	r0, fp, #68
	bl	BsPos
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L390:
	mov	r7, #0
	sub	r0, fp, #68
	strb	r7, [r5, #1529]
	bl	BsPos
	ldr	r3, .L445+8
	ldr	r6, [r3]
	cmp	r6, r7
	mov	r4, r0
	beq	.L421
	ldr	r0, [r5, #2448]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r6
	mov	r0, r4
	b	.L435
.L421:
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L443:
	ldr	r2, .L445+12
	movw	r1, #879
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r6
	bl	H263_ClearCurPic
	b	.L417
.L444:
	bl	BsPos
	b	.L435
.L400:
	cmp	r0, #800
	bhi	.L401
	add	ip, r0, #31
	mov	r1, r2, asl #1
	ands	r0, r0, #31
	mov	ip, ip, lsr #5
	uxth	r1, r1
	strb	ip, [r5, #691]
	strh	r1, [r3]	@ movhi
	bne	.L437
.L403:
	add	r3, r5, #740
	mov	r4, r0
	strh	r1, [r3]	@ movhi
	b	.L399
.L401:
	add	ip, r0, #63
	mov	r1, r2, asl #2
	ands	r0, r0, #63
	mov	ip, ip, lsr #6
	uxth	r1, r1
	strb	ip, [r5, #691]
	strh	r1, [r3]	@ movhi
	beq	.L403
.L437:
	add	r0, r0, #15
	add	r3, r5, #740
	mov	r4, r0, lsr #4
	smulbb	r2, r4, r2
	strh	r2, [r3]	@ movhi
	b	.L399
.L442:
	ldr	r2, [r8, #3464]
	strb	r3, [r6, #1246]
	mov	r3, r2, asl #3
	str	r3, [r6, #1252]
	ldr	r3, [r8, #3460]
	str	r3, [r6, #1264]
	b	.L416
.L446:
	.align	2
.L445:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	.word	g_EventReportFunc
	.word	.LC19
	UNWIND(.fnend)
	.size	H263_Syntax_Sorenson_PicHeader, .-H263_Syntax_Sorenson_PicHeader
	.align	2
	.global	H263_Syntax_Slice_NotSH
	.type	H263_Syntax_Slice_NotSH, %function
H263_Syntax_Slice_NotSH:
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
	add	r6, r0, #12288
	mov	r4, r0
	movw	r3, #510
	ldr	r8, [r6, #3288]
	mov	r7, r2
	sub	r0, r8, #1
	cmp	r0, r3
	bhi	.L468
	movw	r3, #3528
	sub	r0, fp, #76
	ldrh	r9, [r6, r3]
	add	r5, r4, #20480
	add	r3, r8, #1
	str	r3, [r6, #3288]
	ubfx	r9, r9, #7, #4
	bl	BsInit
	add	r9, r9, #17
	sub	r0, fp, #76
	mov	r1, r9
	bl	BsSkip
	ldr	r3, [r5, #1460]
	ldr	r9, [r5, #1464]
	add	r3, r3, #15
	add	r9, r9, #15
	mov	r3, r3, lsr #4
	mov	r9, r9, lsr #4
	mul	r9, r9, r3
	cmp	r9, #0
	beq	.L450
	mov	r3, r9
	mov	r1, #0
.L451:
	add	r1, r1, #1
	movs	r3, r3, lsr #1
	uxth	r1, r1
	bne	.L451
	sxth	r1, r1
	sub	r0, fp, #76
	bl	BsGet
	mov	r10, r8, asl #2
	mov	r8, r8, asl #5
	sub	r1, r9, #1
	rsb	r2, r10, r8
	add	r2, r4, r2
	cmp	r0, r1
	str	r0, [r2, #1256]
	bhi	.L469
.L452:
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	rsb	r9, r10, r8
	add	r9, r4, r9
	mov	r1, #1
	add	r9, r9, #1232
	add	r9, r9, #8
	strb	r0, [r9, #4]
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #0
	beq	.L453
.L463:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #0
	bne	.L463
	mov	r1, #1
	sub	r0, fp, #76
	add	r2, r4, #16384
	str	r2, [fp, #-80]
	bl	BsSkip
	ldr	r2, [fp, #-80]
	ldr	r1, [r2, #3636]
	cmp	r1, #0
	bne	.L470
.L455:
	mov	r1, #1
	sub	r0, fp, #76
	str	r2, [fp, #-80]
	bl	BsSkip
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	rsb	r9, r10, r8
	add	r9, r4, r9
	mov	r1, #3
	add	r9, r9, #1232
	strb	r0, [r9, #11]
	sub	r0, fp, #76
	bl	BsGet
	ldrb	r3, [r9, #11]	@ zero_extendqisi2
	ldr	r2, [fp, #-80]
	cmp	r3, #0
	strb	r0, [r9, #10]
	add	r9, r9, #8
	bne	.L471
.L457:
	ldrb	ip, [r5, #688]	@ zero_extendqisi2
	rsb	r3, r10, r8
	add	r3, r4, r3
	sub	r0, fp, #76
	add	r1, r3, #1232
	str	r3, [fp, #-84]
	strb	ip, [r3, #1240]
	add	r1, r1, #8
	ldrb	ip, [r5, #689]	@ zero_extendqisi2
	str	r1, [fp, #-80]
	strb	ip, [r3, #1241]
	ldr	ip, [r2, #3536]
	orr	ip, ip, #16
	str	ip, [r2, #3536]
	bl	BsPos
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-80]
	mov	r2, r0, asr #31
	cmp	r0, #0
	add	ip, r0, #7
	rsb	r7, r0, r7, lsl #3
	mov	r2, r2, lsr #29
	movge	ip, r0
	mov	r9, r0
	add	r0, r0, r2
	str	r7, [r3, #1248]
	and	r0, r0, #7
	ldr	lr, [r5, #1544]
	rsb	r2, r2, r0
	add	r2, r2, lr
	strb	r2, [r1, #5]
	ldr	r2, [r5, #1536]
	add	r2, r2, ip, asr #3
	str	r2, [r3, #1260]
	ldrb	r2, [r6, #3374]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L459
	ldrb	r1, [r6, #3454]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L472
.L459:
	rsb	r8, r10, r8
	mov	r2, #0
	add	r8, r4, r8
	str	r2, [r8, #1252]
	strb	r2, [r8, #1246]
	str	r2, [r8, #1264]
.L460:
	mov	r0, r4
	bl	H263_Record_SlcSegID
	mov	r0, r9
.L467:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L453:
	ldrb	r3, [r5, #680]	@ zero_extendqisi2
	add	r2, r4, #16384
	strb	r3, [r9, #3]
	ldrb	r3, [r5, #684]	@ zero_extendqisi2
	strb	r3, [r9, #2]
	b	.L457
.L468:
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #40
	ldr	r0, [r3, #2448]
	bl	H263_ClearCurPacket
	mov	r0, r4
	add	r4, r4, #16384
	bl	H263_ClearCurPic
	ldr	r3, .L473
	movw	r1, #2340
	ldr	ip, [r4, #3536]
	mov	r0, #1
	ldr	r2, .L473+4
	bic	ip, ip, #432
	bic	ip, ip, #2
	str	ip, [r4, #3536]
	ldr	ip, [r6, #3288]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L470:
	sub	r0, fp, #76
	bl	BsSkip
	ldr	r2, [fp, #-80]
	b	.L455
.L471:
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsSkip
	ldrb	r3, [r9, #3]	@ zero_extendqisi2
	ldr	r2, [fp, #-80]
	cmp	r3, #2
	bne	.L457
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsSkip
	ldr	r2, [fp, #-80]
	b	.L457
.L472:
	ldr	r1, [r6, #3464]
	strb	r2, [r3, #1246]
	mov	r2, r1, asl #3
	str	r2, [r3, #1252]
	ldr	r2, [r6, #3460]
	str	r2, [r3, #1264]
	b	.L460
.L450:
	mov	r1, r9
	sub	r0, fp, #76
	bl	BsGet
	mov	r10, r8, asl #2
	mov	r8, r8, asl #5
	rsb	r3, r10, r8
	add	r3, r4, r3
	str	r0, [r3, #1256]
	b	.L452
.L469:
	mov	r3, r0
	str	r9, [sp]
	ldr	r2, .L473+8
	movw	r1, #2362
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L467
.L474:
	.align	2
.L473:
	.word	.LANCHOR0+568
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	H263_Syntax_Slice_NotSH, .-H263_Syntax_Slice_NotSH
	.align	2
	.global	H263_Syntax_Slice_SH
	.type	H263_Syntax_Slice_SH, %function
H263_Syntax_Slice_SH:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #60)
	sub	sp, sp, #60
	add	r7, r0, #12288
	movw	r3, #510
	mov	r4, r0
	ldr	r5, [r7, #3288]
	mov	r10, r2
	sub	r6, r5, #1
	cmp	r6, r3
	bhi	.L489
	ldrb	r8, [r7, #3528]	@ zero_extendqisi2
	add	r3, r5, #1
	sub	r0, fp, #76
	str	r3, [r7, #3288]
	ubfx	r8, r8, #3, #4
	bl	BsInit
	add	r8, r8, #17
	sub	r0, fp, #76
	add	r9, r4, #20480
	mov	r1, r8
	bl	BsSkip
	mov	r3, r5, asl #2
	mov	r1, #5
	sub	r0, fp, #76
	mov	r8, r3
	str	r3, [fp, #-84]
	bl	BsGet
	add	r3, r9, #692
	mov	r2, r5, asl #5
	add	r1, r4, #1200
	ldrh	r3, [r3]
	mov	ip, r2
	rsb	r8, r8, ip
	add	r8, r4, r8
	movw	ip, #1198
	str	r2, [fp, #-88]
	add	r2, r8, #1248
	add	r2, r2, #8
	mul	r0, r3, r0
	str	r0, [r8, #1256]
	ldrh	r3, [r1]
	ldrh	r1, [r4, ip]
	mul	r1, r1, r3
	sub	r1, r1, #1
	cmp	r0, r1
	bhi	.L490
	mov	r1, #2
	sub	r0, fp, #76
	str	r2, [fp, #-80]
	bl	BsSkip
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	strb	r0, [r8, #1244]
	sub	r0, fp, #76
	ldrb	r1, [r9, #680]	@ zero_extendqisi2
	strb	r1, [r8, #1243]
	ldrb	r1, [r9, #684]	@ zero_extendqisi2
	strb	r1, [r8, #1242]
	ldrb	r1, [r9, #688]	@ zero_extendqisi2
	strb	r1, [r8, #1240]
	ldrb	r1, [r9, #689]	@ zero_extendqisi2
	strb	r1, [r8, #1241]
	bl	BsPos
	ldr	r2, [fp, #-80]
	mov	ip, r0, asr #31
	cmp	r0, #0
	rsb	r10, r0, r10, lsl #3
	add	lr, r0, #7
	mov	ip, ip, lsr #29
	movge	lr, r0
	mov	r1, r0
	add	r0, r0, ip
	str	r10, [r8, #1248]
	and	r0, r0, #7
	ldr	r10, [r9, #1544]
	rsb	r0, ip, r0
	add	r10, r0, r10
	add	r0, r4, #16384
	strb	r10, [r8, #1245]
	ldr	r3, [r9, #1536]
	add	lr, r3, lr, asr #3
	str	lr, [r2, #4]
	ldr	r3, [r0, #3536]
	orr	r3, r3, #16
	str	r3, [r0, #3536]
	ldrb	r3, [r7, #3374]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L491
.L479:
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-88]
	rsb	r5, r2, r3
	mov	r2, #0
	add	r5, r4, r5
	str	r2, [r5, #1252]
	strb	r2, [r5, #1246]
	str	r2, [r5, #1264]
.L480:
	mov	r2, r6, asl #2
	mov	r6, r6, asl #5
	rsb	r3, r2, r6
	add	r3, r4, r3
	ldr	r0, [r3, #1264]
	cmp	r0, #0
	bne	.L492
.L481:
	rsb	r6, r2, r6
	ldrb	r3, [r7, #3528]	@ zero_extendqisi2
	add	r6, r4, r6
	ubfx	r3, r3, #3, #4
	ldr	r2, [r6, #1248]
	add	r3, r3, r2
	str	r3, [r6, #1248]
.L482:
	mov	r0, r4
	str	r1, [fp, #-80]
	bl	H263_Record_SlcSegID
	ldr	r1, [fp, #-80]
	mov	r0, r1
.L477:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L492:
	ldr	r0, [r3, #1252]
	cmp	r0, #0
	beq	.L481
	ldrb	r2, [r7, #3528]	@ zero_extendqisi2
	ubfx	r2, r2, #3, #4
	add	r2, r2, r0
	str	r2, [r3, #1252]
	b	.L482
.L491:
	ldrb	r2, [r7, #3454]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L479
	ldr	r2, [r7, #3464]
	strb	r3, [r8, #1246]
	mov	r3, r2, asl #3
	str	r3, [r8, #1252]
	ldr	r3, [r7, #3460]
	str	r3, [r8, #1264]
	b	.L480
.L489:
	add	r3, r0, #20480
	add	r1, r0, #15616
	add	r1, r1, #40
	ldr	r0, [r3, #2448]
	bl	H263_ClearCurPacket
	mov	r0, r4
	add	r4, r4, #16384
	bl	H263_ClearCurPic
	ldr	r3, .L493
	movw	r1, #2449
	ldr	ip, [r4, #3536]
	mov	r0, #1
	ldr	r2, .L493+4
	bic	ip, ip, #432
	bic	ip, ip, #2
	str	ip, [r4, #3536]
	ldr	ip, [r7, #3288]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L490:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L493+8
	movw	r1, #2470
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L477
.L494:
	.align	2
.L493:
	.word	.LANCHOR0+592
	.word	.LC20
	.word	.LC22
	UNWIND(.fnend)
	.size	H263_Syntax_Slice_SH, .-H263_Syntax_Slice_SH
	.align	2
	.global	H263_Dec_Slice
	.type	H263_Dec_Slice, %function
H263_Dec_Slice:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	ip, r0, #12288
	mov	r4, r0
	ldrb	r3, [ip, #3528]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L503
	tst	r3, #4
	beq	.L504
	mov	r0, r4
	bl	H263_Syntax_Slice_SH
	cmn	r0, #1
	beq	.L505
.L499:
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L504:
	movw	r0, #3528
	ldrh	r0, [ip, r0]
	ubfx	r0, r0, #7, #4
	sub	lr, r0, #1
	cmp	lr, #6
	bfils	r3, r0, #3, #4
	mov	r0, r4
	strlsb	r3, [ip, #3528]
	bl	H263_Syntax_Slice_SH
	cmn	r0, #1
	bne	.L499
.L505:
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #40
	ldr	r0, [r3, #2448]
	bl	H263_ClearCurPacket
	ldr	r3, .L507
	ldr	r2, .L507+4
	movw	r1, #2570
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L503:
	str	r2, [fp, #-28]
	str	r1, [fp, #-24]
	bl	H263_Check_Slice_NotSH
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	cmp	r0, #0
	beq	.L506
	mov	r1, r2
	mov	r0, r4
	bl	H263_Combine_SliceData
	cmp	r0, #0
	beq	.L500
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #40
	ldr	r0, [r3, #2448]
	bl	H263_ClearCurPacket
	ldr	r3, .L507
	ldr	r2, .L507+4
	movw	r1, #2550
	mov	r0, #1
	bl	dprint_normal
	b	.L499
.L506:
	mov	r0, r4
	bl	H263_Syntax_Slice_NotSH
	cmn	r0, #1
	bne	.L499
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #40
	ldr	r0, [r3, #2448]
	bl	H263_ClearCurPacket
	ldr	r3, .L507
	ldr	r2, .L507+4
	movw	r1, #2540
	mov	r0, #1
	bl	dprint_normal
	b	.L499
.L500:
	mov	r0, r4
	bl	H263_Record_SlcSegID
	b	.L499
.L508:
	.align	2
.L507:
	.word	.LANCHOR0+616
	.word	.LC23
	UNWIND(.fnend)
	.size	H263_Dec_Slice, .-H263_Dec_Slice
	.align	2
	.global	H263_Check_CurPacket
	.type	H263_Check_CurPacket, %function
H263_Check_CurPacket:
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
	add	r5, r0, #12288
	add	r4, r0, #20480
	mov	r3, #0
	ldr	r2, [r5, #3380]
	mov	r6, r0
	sub	r0, fp, #60
	str	r2, [r4, #1536]
	ldr	r1, [r5, #3368]
	str	r1, [r4, #1532]
	ldr	r2, [r5, #3384]
	str	r3, [r4, #1544]
	str	r2, [r4, #1540]
	bl	BsInit
	sub	r0, fp, #60
	mov	r1, #32
	bl	BsShow
	ldr	r3, [r4, #2008]
	mov	r2, #1
	strb	r2, [r4, #757]
	cmp	r3, #196
	beq	.L513
.L510:
	ldr	r3, [r5, #3368]
	cmp	r3, #0
	ldrne	r0, [r5, #3380]
	mvneq	r0, #0
	clzne	r0, r0
	movne	r0, r0, lsr #5
	rsbne	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L513:
	ldr	r3, [r4, #2016]
	cmp	r3, r2
	ble	.L510
	mov	r0, r6
	bl	H263_Clean_HeadPacket
	b	.L510
	UNWIND(.fnend)
	.size	H263_Check_CurPacket, .-H263_Check_CurPacket
	.align	2
	.global	H263_Record_PacketID
	.type	H263_Record_PacketID, %function
H263_Record_PacketID:
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
	add	r5, r0, #20480
	mov	r4, r0
	ldr	r3, [r5, #2004]
	cmp	r3, #62
	bgt	.L517
	add	r1, r0, #12288
	add	r4, r0, r3, lsl #2
	add	r4, r4, #20480
	add	r2, r3, #1
	ldr	r0, [r1, #3388]
	str	r0, [r4, #1748]
	str	r2, [r5, #2004]
	ldrb	r2, [r1, #3374]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L514
	ldrb	r2, [r1, #3454]	@ zero_extendqisi2
	cmp	r2, #1
	addeq	r3, r3, #2
	ldreq	r2, [r1, #3468]
	streq	r2, [r4, #1752]
	streq	r3, [r5, #2004]
.L514:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L517:
	bl	H263_Clean_HeadPacket
	add	r1, r4, #15616
	ldr	r0, [r5, #2448]
	add	r1, r1, #40
	bl	H263_ClearCurPacket
	ldr	r3, [r5, #2004]
	mov	r1, #62
	ldr	r2, .L518
	str	r1, [sp]
	mov	r0, #0
	movw	r1, #2718
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L519:
	.align	2
.L518:
	.word	.LC17
	UNWIND(.fnend)
	.size	H263_Record_PacketID, .-H263_Record_PacketID
	.align	2
	.global	H263_Record_HeadPacketInfo
	.type	H263_Record_HeadPacketInfo, %function
H263_Record_HeadPacketInfo:
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
	mov	r7, r1
	beq	.L523
	ldr	r6, .L525
	add	r1, r4, #15616
	add	r0, r4, #22016
	add	r1, r1, #40
	mov	r2, #160
	add	r0, r0, #48
	ldr	r3, [r6, #52]
	add	r5, r4, #20480
	blx	r3
	add	r1, r4, #15808
	add	r0, r4, #22016
	ldr	r3, [r6, #52]
	add	r1, r1, #8
	add	r0, r0, #208
	mov	r2, #4
	blx	r3
	ldr	r3, [r5, #2012]
	str	r7, [r5, #2008]
	cmp	r3, #0
	beq	.L524
.L522:
	ldr	r3, [r5, #2016]
	add	r3, r3, #1
	str	r3, [r5, #2016]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L524:
	mov	r0, r4
	bl	H263_Record_PacketID
	mov	r3, #1
	str	r3, [r5, #2012]
	b	.L522
.L523:
	ldr	r2, .L525+4
	movw	r1, #2610
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L526:
	.align	2
.L525:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC24
	UNWIND(.fnend)
	.size	H263_Record_HeadPacketInfo, .-H263_Record_HeadPacketInfo
	.align	2
	.global	H263_Syntax_Parse
	.type	H263_Syntax_Parse, %function
H263_Syntax_Parse:
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
	UNWIND(.pad #84)
	sub	sp, sp, #84
	ldr	r9, .L626
	mov	r5, r0
	mov	r8, r1
	mov	r7, r2
	mov	r1, #0
	mov	r2, #32
	sub	r0, fp, #108
	ldr	r4, [r9, #48]
	mov	r10, r3
	blx	r4
	mov	r2, r7
	mov	r1, r8
	sub	r0, fp, #108
	bl	BsInit
	sub	r0, fp, #108
	mov	r1, #32
	add	r6, r5, #16384
	bl	BsShow
	movw	r2, #510
	mov	r3, #0
	str	r3, [r6, #3540]
	cmp	r0, r2
	beq	.L615
.L528:
	add	r4, r5, #20480
	add	r3, r5, #12288
	mov	r2, #1
	strb	r2, [r4, #757]
	ldrb	r0, [r3, #3528]	@ zero_extendqisi2
	and	r0, r0, #2
	ands	r0, r0, #255
	bne	.L532
	ldr	r3, [r6, #3536]
	tst	r3, #130
	beq	.L533
	orr	r3, r3, #32
	str	r2, [r6, #3540]
	str	r3, [r6, #3536]
.L614:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L533:
	ldr	r2, .L626+4
	movw	r1, #953
	mov	r0, #3
	bl	dprint_normal
	cmp	r10, #1
	mov	r1, r8
	mov	r2, r7
	mov	r0, r5
	beq	.L616
	bl	H263_Syntax_PicHeader
	mov	r8, r0
.L535:
	ldr	r3, [r6, #3536]
	tst	r3, #2
	bne	.L536
	add	r1, r5, #15616
	ldr	r0, [r4, #2448]
	add	r1, r1, #40
	bl	H263_ClearCurPacket
	ldrb	r3, [r4, #2485]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L538
.L619:
	ldr	r1, [r6, #3648]
	cmp	r1, #0
	beq	.L540
	ldr	r2, [r6, #3652]
	cmp	r2, #0
	bne	.L617
.L540:
	cmp	r8, r7, asl #3
	mov	r3, #0
	strb	r3, [r4, #2485]
	bls	.L618
.L542:
	ldr	r2, .L626+8
	movw	r1, #1139
	mov	r0, #3
	bl	dprint_normal
	ldr	r3, [r6, #3536]
	mov	r0, #0
	bic	r3, r3, #432
	bic	r3, r3, #2
	str	r3, [r6, #3536]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L532:
	mov	r1, r8
	mov	r2, r7
	mov	r0, r5
	bl	H263_Dec_Slice
	mov	r8, r0
.L537:
	ldrb	r3, [r4, #2485]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L619
.L538:
	cmp	r8, r7, asl #3
	bhi	.L542
.L618:
	ldr	r3, [r6, #3536]
	ands	r3, r3, #130
	beq	.L543
	ldrb	r3, [r4, #757]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L620
	ldr	r2, [r4, #1464]
	ldr	r1, [r4, #1460]
	cmp	r2, #0
	str	r2, [r4, #2052]
	str	r1, [r4, #2056]
	beq	.L547
	ldr	r3, [r4, #2044]
	cmp	r2, r3
	beq	.L547
.L571:
	mov	r6, #1
.L548:
	ldr	r3, .L626+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L552
	ldr	r0, [r4, #2048]
	mov	r3, #8
	ldr	ip, [r4, #2044]
	strh	r2, [fp, #-112]	@ movhi
	sub	r2, fp, #116
	strh	r1, [fp, #-110]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-114]	@ movhi
	strh	ip, [fp, #-116]	@ movhi
	ldr	r0, [r4, #2448]
	blx	r7
.L552:
	cmp	r6, #0
	bne	.L621
.L554:
	ldr	r2, [r4, #2052]
	ldr	r3, [r4, #2056]
	str	r2, [r4, #2044]
	str	r3, [r4, #2048]
.L546:
	add	r1, r5, #20992
	add	r0, r5, #21760
	ldr	r3, [r9, #52]
	add	r1, r1, #168
	mov	r2, #68
	add	r0, r0, #112
	blx	r3
	ldr	r2, .L626+16
	movw	r1, #1074
	mov	r0, #3
	bl	dprint_normal
	ldr	r3, [r4, #2028]
	mov	r0, r8
	add	r3, r3, #1
	str	r3, [r4, #2028]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L543:
	ldrb	r2, [r4, #1527]	@ zero_extendqisi2
	cmp	r2, #1
	movne	r0, r8
	bne	.L614
	ldr	r2, [r4, #2024]
	add	r1, r5, #19712
	add	r0, r5, #21248
	str	r3, [r4, #2028]
	add	r1, r1, #240
	add	r3, r2, #1
	add	r0, r0, #20
	str	r3, [r4, #2024]
	mov	r2, #604
	ldr	r3, [r9, #52]
	blx	r3
	ldr	r2, [r4, #1460]
	ldr	r0, [r6, #3652]
	ldr	r1, [r6, #3648]
	cmp	r2, r0
	beq	.L622
.L558:
	ldr	r3, .L626+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L560
	ldr	ip, [r4, #1464]
	mov	r3, #8
	strh	r2, [fp, #-114]	@ movhi
	sub	r2, fp, #116
	strh	r1, [fp, #-112]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-110]	@ movhi
	strh	ip, [fp, #-116]	@ movhi
	ldr	r0, [r4, #2448]
	blx	r7
	ldr	r0, [r6, #3652]
	ldr	r1, [r6, #3648]
.L560:
	mov	r3, #1
	str	r0, [r4, #1460]
	str	r1, [r4, #1464]
.L559:
	sxtb	r3, r3
	cmp	r3, #1
	beq	.L623
.L562:
	ldr	r3, [r4, #1464]
	mov	r2, #0
	ldr	r1, [r4, #1460]
	mov	r0, r8
	str	r3, [r4, #2048]
	str	r1, [r4, #2044]
	ldr	r3, [r6, #3652]
	str	r3, [r4, #1460]
	ldr	r3, [r6, #3648]
	strb	r2, [r4, #1527]
	str	r3, [r4, #1464]
	b	.L614
.L616:
	bl	H263_Syntax_Sorenson_PicHeader
	mov	r8, r0
	b	.L535
.L620:
	ldrb	r3, [r4, #680]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L545
	ldr	r2, [r4, #1476]
	ldr	r3, [r4, #1468]
	ldr	r0, [r4, #1472]
	str	r2, [r4, #1480]
	add	r2, r2, r3
	str	r2, [r4, #1476]
	ldr	r3, [r6, #3640]
	ldr	r1, [r4, #1488]
	mla	r3, r3, r2, r0
	rsb	r2, r1, r3
	str	r2, [r4, #1492]
	str	r3, [r4, #1484]
	str	r3, [r4, #1488]
	b	.L546
.L615:
	mov	r2, #32
	sub	r1, fp, #108
	ldr	r4, [r9, #52]
	sub	r0, fp, #76
	str	r3, [fp, #-120]
	blx	r4
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #32
	mov	r4, r0
	sub	r0, fp, #76
	bl	BsGet
	movw	r1, #20036
	movw	r2, #20553
	movt	r1, 17221
	movt	r2, 18515
	ldr	r3, [fp, #-120]
	cmp	r0, r1
	cmpeq	r4, r2
	bne	.L528
	ldr	r2, .L626+12
	add	r4, r5, #20480
	mov	r1, #1
	strb	r1, [r4, #2484]
	ldr	r7, [r2]
	cmp	r7, #0
	beq	.L529
	mov	r2, r3
	mov	r1, #46
	ldr	r0, [r4, #2448]
	blx	r7
.L529:
	ldr	r3, [r6, #3536]
	add	r1, r5, #15616
	add	r1, r1, #40
	tst	r3, #130
	orrne	r3, r3, #32
	strne	r3, [r6, #3536]
	movne	r2, #1
	strne	r2, [r6, #3540]
	ldr	r0, [r4, #2448]
	bl	H263_ClearCurPacket
	mov	r0, #0
	b	.L614
.L536:
	mov	r1, #196
	mov	r0, r5
	bl	H263_Record_HeadPacketInfo
	b	.L537
.L547:
	cmp	r1, #0
	beq	.L549
	ldr	r3, [r4, #2048]
	cmp	r1, r3
	beq	.L624
	cmp	r2, #0
	beq	.L571
	ldr	r3, [r4, #2044]
	cmp	r2, r3
	bne	.L571
	mov	r6, #1
	b	.L566
.L549:
	ldr	r6, [r4, #2452]
	subs	r6, r6, #1
	movne	r6, #1
	cmp	r2, #0
	beq	.L552
.L567:
	ldr	r3, [r4, #2044]
	cmp	r2, r3
	bne	.L548
.L551:
	cmp	r1, #0
	beq	.L552
.L566:
	ldr	r3, [r4, #2048]
	cmp	r1, r3
	beq	.L552
	b	.L548
.L545:
	ldr	r3, [r4, #1480]
	ldr	r2, [r4, #1468]
	ldr	ip, [r6, #3640]
	ldr	r0, [r4, #1472]
	add	r2, r2, r3
	ldr	r1, [r4, #1492]
	mla	r3, ip, r2, r0
	ldr	r2, [r4, #1488]
	rsb	r2, r2, r1
	add	r2, r2, r3
	str	r2, [r4, #1496]
	str	r3, [r4, #1484]
	b	.L546
.L624:
	ldr	r6, [r4, #2452]
	subs	r6, r6, #1
	movne	r6, #1
	cmp	r2, #0
	beq	.L551
	b	.L567
.L617:
	mov	r0, r5
	bl	H263_Frame_Init
	cmp	r0, #0
	beq	.L540
	ldr	r2, .L626+20
	movw	r1, #1007
	mov	r0, #0
	bl	dprint_normal
	b	.L540
.L621:
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L555
	ldr	r1, [r6, #168]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r6, #168]
	strd	r2, [r6, #176]
	strd	r2, [r6, #184]
	strd	r2, [r6, #192]
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2448]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2468]
	str	r0, [r4, #2460]
.L555:
	add	r1, r5, #22528
	mov	r6, #0
	add	r1, r1, #48
	str	r6, [r4, #2456]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearNotInVoQueue
	ldr	r2, [r4, #2056]
	ldr	r1, [r4, #2052]
	mov	r0, r5
	bl	H263_Frame_Init
	cmp	r0, r6
	beq	.L554
	mov	r0, r6
	ldr	r2, .L626+24
	movw	r1, #1064
	bl	dprint_normal
	b	.L554
.L622:
	ldr	r3, [r4, #1464]
	cmp	r3, r1
	bne	.L558
	ldr	r3, [r4, #2452]
	subs	r3, r3, #1
	movne	r3, #1
	b	.L559
.L623:
	ldr	r0, .L626+28
	mov	r2, #100
	ldr	r1, [r4, #2448]
	mla	r2, r2, r1, r0
	add	r7, r2, #64
	ldr	r0, [r2, #64]
	cmp	r0, #0
	beq	.L625
.L563:
	mov	r0, r1
	ldr	r1, [r4, #2468]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L564
	ldr	r1, [r7, #168]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r7, #176]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r7, #184]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	ldr	r1, [r7, #192]
	ldr	r0, [r4, #2448]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	strd	r2, [r7, #176]
	strd	r2, [r7, #184]
	strd	r2, [r7, #192]
	ldr	r1, [r4, #2468]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2448]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2468]
	str	r0, [r4, #2460]
.L564:
	add	r1, r5, #22528
	mov	r7, #0
	add	r1, r1, #48
	str	r7, [r4, #2456]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r5
	ldr	r2, [r4, #1460]
	ldr	r1, [r4, #1464]
	bl	H263_Frame_Init
	cmp	r0, r7
	beq	.L562
	mov	r0, r7
	ldr	r2, .L626+32
	movw	r1, #1118
	bl	dprint_normal
	b	.L562
.L625:
	str	r3, [r2, #64]
	ldr	r3, [r9]
	blx	r3
	ldr	r1, [r4, #2448]
	str	r0, [r7, #4]
	b	.L563
.L627:
	.align	2
.L626:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LC30
	.word	g_EventReportFunc
	.word	.LC28
	.word	.LC26
	.word	.LC27
	.word	g_VfmwChanStat
	.word	.LC29
	UNWIND(.fnend)
	.size	H263_Syntax_Parse, .-H263_Syntax_Parse
	.align	2
	.global	H263DEC_Decode
	.type	H263DEC_Decode, %function
H263DEC_Decode:
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
	add	r4, r0, #20480
	mov	r5, r0
	mov	r9, r2
	ldr	r3, [r4, #2036]
	mov	r8, r1
	cmp	r3, #0
	beq	.L629
	ldr	r3, [r1, #16]
	cmp	r3, #0
	beq	.L629
	ldr	r3, [r1, #12]
	cmp	r3, #0
	beq	.L629
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L629
	add	r7, r0, #15616
	ldr	r3, .L722
	add	r7, r7, #40
	strb	r2, [r5]
	mov	r2, #160
	ldr	r3, [r3, #52]
	mov	r0, r7
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	H263_GetScdUpMsg
	mov	r0, r5
	bl	H263_Check_CurPacket
	cmn	r0, #1
	mov	r6, r0
	beq	.L710
	mov	r1, r7
	mov	r0, r5
	bl	H263_GetScdUpMsg
	add	r3, r5, #12288
	mov	r2, #0
	mov	r0, r5
	ldr	r1, [r3, #3380]
	str	r1, [r4, #1536]
	ldr	r1, [r3, #3368]
	str	r1, [r4, #1532]
	ldr	r3, [r3, #3384]
	str	r2, [r4, #1544]
	str	r3, [r4, #1540]
	bl	H263_Get_DecMode
	ldr	r3, [r4, #1548]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L711
.L633:
	add	r6, r5, #16384
	ldr	r3, [r6, #3536]
	str	r3, [r4, #2488]
.L634:
	mov	r3, r9
	ldr	r2, [r4, #1540]
	ldr	r1, [r4, #1532]
	mov	r0, r5
	bl	H263_Syntax_Parse
	ldr	r3, [r4, #1532]
	ldr	ip, [r4, #1548]
	ldr	r1, [r4, #1536]
	mov	r2, r0, lsr #3
	and	r0, r0, #7
	str	r0, [r4, #1544]
	add	r0, r3, r2
	ldr	r3, [r4, #1540]
	add	r1, r2, r1
	str	r0, [r4, #1532]
	rsb	r3, r2, r3
	str	r1, [r4, #1536]
	str	r3, [r4, #1540]
	ldr	r3, [ip, #816]
	cmp	r3, #1
	beq	.L712
.L635:
	ldr	r3, [r6, #3536]
	tst	r3, #288
	beq	.L636
	bic	r3, r3, #432
	bic	r3, r3, #2
	str	r3, [r6, #3536]
	ldr	r3, [r4, #1580]
	cmp	r3, #2
	beq	.L713
	cmp	r3, #1
	beq	.L714
	cmp	r3, #4
	bne	.L639
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L641
	ldr	r3, [r4, #2064]
	cmp	r3, #0
	moveq	r3, #2
	movne	r3, #1
	str	r3, [r4, #2064]
.L639:
	mov	r0, r5
	bl	H263_Frame_Atr
	cmn	r0, #1
	mov	r6, r0
	beq	.L715
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #2468]
	mov	r7, r0
	ldr	r0, [r4, #2448]
	bl	FSP_GetFsImagePtr
	clz	r3, r7
	mov	r3, r3, lsr #5
	clz	r1, r0
	mov	r2, r0
	mov	r1, r1, lsr #5
	orrs	r9, r1, r3
	bne	.L716
	ldrb	r0, [r4, #755]	@ zero_extendqisi2
	and	r10, r0, #253
	cmp	r10, #1
	beq	.L717
	cmp	r0, #2
	beq	.L718
.L650:
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L654
	ldr	r3, [r4, #2456]
	ldr	r1, [r4, #2460]
	cmp	r3, #0
	ldr	r3, [r4, #2468]
	movgt	r2, #2
	movle	r2, #1
	cmp	r1, r3
	str	r2, [r4, #2456]
	beq	.L656
	mov	r2, #0
	ldr	r0, [r4, #2448]
	bl	FSP_SetRef
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_GetDisplay
	cmp	r0, #3
	beq	.L708
	mov	r2, #0
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_SetDisplay
.L708:
	ldr	r3, [r4, #2468]
.L656:
	str	r3, [r4, #2460]
	mov	r2, #1
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	strb	r3, [r5, #1]
	ldr	r3, [r4, #2472]
	ldr	r1, [r4, #2476]
	str	r3, [r4, #2464]
	str	r1, [r4, #2468]
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	strb	r3, [r5, #2]
	ldr	r3, [r4, #1492]
	ldr	r0, [r4, #2448]
	str	r3, [r4, #2472]
	bl	FSP_SetRef
	ldr	r1, [r4, #2460]
	ldr	r0, [r4, #2448]
	bl	FSP_ReleasePmv
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L719
.L654:
	mov	r2, r8
	mov	r1, #0
	mov	r0, r5
	bl	H263_Set_DecPar
	ldrb	r6, [r4, #1392]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L658
	ldr	r3, [r4, #2064]
	cmp	r3, #0
	moveq	r3, #2
	movne	r3, #1
	str	r3, [r4, #2064]
	add	r3, r5, #1040
	str	r3, [r5, #1036]
	ldr	r2, [r4, #1548]
	ldr	r1, [r2, #840]
	cmp	r1, #1
	beq	.L667
.L666:
	cmp	r1, #2
	beq	.L669
.L667:
	cmp	r6, #0
	mov	r3, #0
	strb	r3, [r5, #1194]
	bne	.L668
	ldr	r3, .L722+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L668
	sub	r2, fp, #44
	ldr	r0, [r4, #2448]
	mov	r3, #4
	mov	r1, #8
	str	r6, [r2, #-4]!
	blx	r5
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L717:
	cmp	r3, #0
	bne	.L648
	ldr	r3, [r4, #1548]
	ldr	r2, [r7, #96]
	ldr	r3, [r3]
	cmp	r2, r3
	bls	.L650
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	ldr	ip, [r4, #1548]
	ldr	r3, [r7, #96]
	mov	r0, r10
	ldr	r2, .L722+8
	movw	r1, #1740
	ldr	ip, [ip]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L641:
	sub	r2, r3, #2
	tst	r2, #253
	bne	.L644
	ldr	r2, [r4, #2064]
	cmp	r2, #2
	beq	.L709
.L644:
	cmp	r3, #1
	streq	r3, [r4, #2064]
	b	.L639
.L721:
	str	r6, [r4, #2064]
	add	r3, r5, #1040
	str	r3, [r5, #1036]
	ldr	r2, [r4, #1548]
	ldr	r1, [r2, #840]
	cmp	r1, #1
	beq	.L664
	cmp	r1, #2
	beq	.L669
.L664:
	mov	r3, #0
	strb	r3, [r5, #1194]
.L668:
	mov	r6, #0
.L705:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L658:
	sub	r3, r6, #2
	sub	r9, r6, #2
	clz	r9, r9
	ands	r7, r3, #253
	mov	r9, r9, lsr #5
	bne	.L661
	ldr	r3, [r4, #2064]
	cmp	r3, #2
	beq	.L720
.L661:
	cmp	r6, #1
	beq	.L721
	add	r3, r5, #1040
	str	r3, [r5, #1036]
	ldr	r2, [r4, #1548]
	ldr	r1, [r2, #840]
	cmp	r1, #1
	bne	.L666
	cmp	r3, #0
	moveq	r9, #0
	andne	r9, r9, #1
	cmp	r9, #0
	beq	.L667
	mov	r3, #0
	str	r3, [r5, #1036]
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	b	.L705
.L712:
	ldr	r3, [ip, #848]
	cmp	r3, #0
	beq	.L635
	b	.L668
.L711:
	ldr	r3, [r3, #848]
	cmp	r3, #1
	bne	.L633
	ldr	r3, [r4, #2488]
	add	r6, r5, #16384
	str	r3, [r6, #3536]
	b	.L634
.L713:
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L639
.L638:
	mov	r0, r5
	mvn	r6, #0
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	b	.L705
.L714:
	ldrb	r3, [r4, #1392]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L639
	b	.L638
.L629:
	ldr	r2, .L722+12
	movw	r1, #1623
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_normal
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L718:
	cmp	r3, #0
	bne	.L651
	ldr	r3, [r4, #1548]
	ldr	r0, [r7, #96]
	ldr	r3, [r3]
	cmp	r0, r3
	bhi	.L652
	cmp	r1, #0
	bne	.L653
	ldr	r1, [r2, #96]
	cmp	r3, r1
	bcs	.L650
.L653:
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	str	r2, [fp, #-56]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	ldr	ip, [r4, #1548]
	ldr	r2, [fp, #-56]
	movw	r1, #1778
	mov	r0, #1
	ldr	ip, [ip]
	ldr	r3, [r2, #96]
	ldr	r2, .L722+16
	str	ip, [sp]
	bl	dprint_normal
	b	.L705
.L669:
	ldr	r2, [r2, #844]
	cmp	r2, #0
	andgt	r9, r9, #1
	movle	r9, #0
	cmp	r3, #0
	moveq	r3, #0
	andne	r3, r9, #1
	cmp	r3, #0
	beq	.L667
	mov	r3, #0
	str	r3, [r5, #1036]
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #1548]
	mov	r0, r5
	ldr	r3, [r2, #844]
	add	r3, r3, r6
	str	r3, [r2, #844]
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	b	.L705
.L652:
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	ldr	ip, [r4, #1548]
	ldr	r3, [r7, #96]
	mov	r1, #1760
	ldr	r2, .L722+20
	mov	r0, #1
	ldr	ip, [ip]
	str	ip, [sp]
	bl	dprint_normal
	b	.L705
.L720:
	ldr	r1, [r4, #2476]
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	ldr	r3, .L722+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L709
	ldr	r0, [r4, #2448]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #60
	blx	r5
	mvn	r6, #0
	b	.L705
.L716:
	movw	r1, #1721
	ldr	r3, .L722+24
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L722+28
	bl	dprint_normal
.L709:
	mvn	r6, #0
	b	.L705
.L648:
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	movw	r1, #1735
	mov	r0, r10
	str	r1, [sp]
	ldr	r3, .L722+24
	ldr	r2, .L722+32
	bl	dprint_normal
	b	.L705
.L710:
	ldr	r2, .L722+36
	movw	r1, #1635
	mov	r0, #1
	bl	dprint_normal
	b	.L705
.L636:
	ldr	r2, .L722+40
	movw	r1, #1883
	mov	r0, #3
	mvn	r6, #0
	bl	dprint_normal
	b	.L705
.L715:
	ldr	r2, .L722+44
	movw	r1, #1709
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	b	.L705
.L719:
	ldr	r2, .L722+48
	movw	r1, #1814
	mov	r0, #0
	mvn	r6, #0
	bl	dprint_normal
	b	.L705
.L651:
	ldr	r1, [r4, #2476]
	mvn	r6, #0
	ldr	r0, [r4, #2448]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	bl	H263_ClearCurPic
	mov	r0, r5
	bl	H263_Clean_HeadPacket
	movw	r3, #1755
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L722+32
	mov	r0, #1
	ldr	r3, .L722+24
	bl	dprint_normal
	b	.L705
.L723:
	.align	2
.L722:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC38
	.word	.LC31
	.word	.LC40
	.word	.LC39
	.word	.LANCHOR0+632
	.word	.LC34
	.word	.LC37
	.word	.LC32
	.word	.LC36
	.word	.LC33
	.word	.LC35
	UNWIND(.fnend)
	.size	H263DEC_Decode, .-H263DEC_Decode
	.align	2
	.global	H263_Combine_HdPacket
	.type	H263_Combine_HdPacket, %function
H263_Combine_HdPacket:
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
	add	r5, r0, #20480
	ldr	r3, [r5, #1584]
	cmp	r3, #0
	beq	.L737
	add	r3, r0, #12288
	ldrb	r4, [r3, #3374]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L738
	cmp	r4, #0
	bne	.L732
	ldrb	r2, [r3, #3454]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L732
	ldr	ip, .L741
	add	r1, r0, #15680
	ldr	r2, [r5, #1600]
	add	r0, r0, #22016
	ldr	r3, [r3, #3384]
	add	r1, r1, #56
	ldr	r6, [ip, #52]
	add	r0, r0, #128
	add	r3, r3, r2
	mov	r2, #80
	str	r3, [r5, #1600]
	blx	r6
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L738:
	ldrb	r4, [r5, #1590]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L739
	cmp	r4, #0
	bne	.L731
	ldrb	r2, [r5, #1670]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L731
	ldr	r3, [r3, #3384]
	mov	r0, r4
	ldr	r2, [r5, #1680]
	add	r3, r3, r2
	str	r3, [r5, #1680]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L732:
	mov	r3, #2784
.L736:
	ldr	r2, .L741+4
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L739:
	ldr	r1, [r3, #3380]
	ldr	r2, [r5, #1596]
	cmp	r1, r2
	bcc	.L740
	ldr	r3, [r3, #3384]
	mov	r0, #0
	ldr	r2, [r5, #1600]
	add	r3, r3, r2
	str	r3, [r5, #1600]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L731:
	movw	r3, #2771
	b	.L736
.L740:
	ldr	r3, .L741
	add	r1, r0, #15616
	add	r0, r0, #22016
	add	r1, r1, #40
	mov	r2, #80
	add	r0, r0, #128
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #0
	strb	r4, [r5, #1670]
	mov	r0, r3
	strb	r3, [r5, #1590]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L737:
	ldr	r2, .L741+8
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L726
	ldr	r0, [r5, #2448]
	mov	r2, r3
	mov	r1, #22
	blx	r4
.L726:
	ldr	r2, .L741+12
	movw	r1, #2744
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L742:
	.align	2
.L741:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	g_EventReportFunc
	.word	.LC41
	UNWIND(.fnend)
	.size	H263_Combine_HdPacket, .-H263_Combine_HdPacket
	.align	2
	.global	H263_Renew_CurPacket
	.type	H263_Renew_CurPacket, %function
H263_Renew_CurPacket:
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
	bl	H263_Combine_HdPacket
	cmn	r0, #1
	mov	r5, r0
	beq	.L746
	ldr	r5, .L747
	mov	r0, r4
	bl	H263_Record_PacketID
	add	r1, r4, #22016
	add	r0, r4, #15616
	add	r1, r1, #48
	ldr	r3, [r5, #52]
	mov	r2, #160
	add	r0, r0, #40
	blx	r3
	add	r1, r4, #22016
	add	r0, r4, #15680
	ldr	r3, [r5, #52]
	add	r1, r1, #208
	mov	r2, #4
	add	r0, r0, #48
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L746:
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #40
	ldr	r0, [r3, #2448]
	bl	H263_ClearCurPacket
	mov	r3, #2800
	mov	r1, r3
	ldr	r2, .L747+4
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L748:
	.align	2
.L747:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC42
	UNWIND(.fnend)
	.size	H263_Renew_CurPacket, .-H263_Renew_CurPacket
	.align	2
	.global	H263DEC_GetImageWidth
	.type	H263DEC_GetImageWidth, %function
H263DEC_GetImageWidth:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #20480
	ldr	r0, [r0, #1464]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263DEC_GetImageWidth, .-H263DEC_GetImageWidth
	.align	2
	.global	H263DEC_GetImageHeight
	.type	H263DEC_GetImageHeight, %function
H263DEC_GetImageHeight:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #20480
	ldr	r0, [r0, #1460]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H263DEC_GetImageHeight, .-H263DEC_GetImageHeight
	.global	h263_default_inter_matrix
	.global	h263_default_intra_matrix
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	h263_default_intra_matrix, %object
	.size	h263_default_intra_matrix, 256
h263_default_intra_matrix:
	.word	8
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	28
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	25
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	27
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	45
	.type	h263_default_inter_matrix, %object
	.size	h263_default_inter_matrix, 256
h263_default_inter_matrix:
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	20
	.word	21
	.word	22
	.word	23
	.word	25
	.word	26
	.word	27
	.word	28
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	31
	.word	23
	.word	24
	.word	25
	.word	27
	.word	28
	.word	30
	.word	31
	.word	33
	.type	__func__.12672, %object
	.size	__func__.12672, 16
__func__.12672:
	.ascii	"H263_Frame_Init\000"
	.type	__FUNCTION__.12714, %object
	.size	__FUNCTION__.12714, 16
__FUNCTION__.12714:
	.ascii	"H263_Set_DecPar\000"
	.type	__func__.12759, %object
	.size	__func__.12759, 21
__func__.12759:
	.ascii	"H263DEC_RecycleImage\000"
	.space	3
	.type	__FUNCTION__.12845, %object
	.size	__FUNCTION__.12845, 24
__FUNCTION__.12845:
	.ascii	"H263_Syntax_Slice_NotSH\000"
	.type	__FUNCTION__.12859, %object
	.size	__FUNCTION__.12859, 21
__FUNCTION__.12859:
	.ascii	"H263_Syntax_Slice_SH\000"
	.space	3
	.type	__FUNCTION__.12872, %object
	.size	__FUNCTION__.12872, 15
__FUNCTION__.12872:
	.ascii	"H263_Dec_Slice\000"
	.space	1
	.type	__FUNCTION__.12752, %object
	.size	__FUNCTION__.12752, 15
__FUNCTION__.12752:
	.ascii	"H263DEC_Decode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC1:
	ASCII(.ascii	"Chan:%d dec_pts: %lld Usertag: %lld\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"h263 coding type %d get frame store failed!\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"%s %d  abnormal!\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p)\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"H263DEC Init  -----\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC7:
	ASCII(.ascii	"H263DEC Init success -----\012\000" )
.LC8:
	ASCII(.ascii	"H263 destroy\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"%s pCtx = NULL\012\000" )
.LC10:
	ASCII(.ascii	"vop_coding_type = %d is not expected!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	" slice num %d is not extpected!\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	" line %d packet is wrong!\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"pImg is null, pCurImg %#x pBwdImg %#x\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"line: %d pToQueImg is null!\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"CurImage %d is already out put\012\000" )
.LC16:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"StreamIDNum = %d > (%d)\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"Warning : vop slice num %d != 0\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"warning streamIDNum %d != 0 \012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"FUN: %s Invalid SlcNum = %d\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	" pSlcPara->mb_start_num = %d, MbCnt = %d\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"pSlcPara->mb_start_num = %d, totalMbMin1 = %d\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"FUN: %s H263_ClearCurPacket\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"pCtx is NUL!!!\012\000" )
.LC25:
	ASCII(.ascii	"SHVOP beginning ~ !\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"H263 Frame_Init return err 3!\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"H263 Frame_Init return err 1!\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"vop right\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"H263 Frame_Init return err 2!\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"bits over boundary\012\000" )
.LC31:
	ASCII(.ascii	"bitsream para error -----\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"H263_Check_CurPacket failed!\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"H263_Frame_Atr return fail\012\000" )
.LC34:
	ASCII(.ascii	"fuction return value is null, %s %d!!\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"H263_PrepareNvopDecparam not expect nvop failed.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC36:
	ASCII(.ascii	"bits not enought\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"fuction return value is null,%s %d!!\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"dec P/S frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
	.space	2
.LC39:
	ASCII(.ascii	"dec B frame, bwd ref err(%d) > ref_thr(%d)\012\000" )
.LC40:
	ASCII(.ascii	"dec B frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC41:
	ASCII(.ascii	"pLastPacket->StreamPack[0].VirAddr is NULL!!\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"line %d H263_Combine_HdPacket failed!!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
