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
	.file	"vdm_hal.c"
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.text
	.align	2
	.type	VDMHAL_CfgNotFullRepair, %function
VDMHAL_CfgNotFullRepair:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 48
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
	str	r1, [fp, #-80]
	ldr	r1, [r0, #48]
	str	r0, [fp, #-60]
	cmp	r1, #6
	str	r2, [fp, #-68]
	moveq	r9, #2
	beq	.L2
	cmp	r1, #5
	moveq	r9, #4
	beq	.L2
	cmp	r1, #4
	moveq	r9, #8
	bne	.L28
.L2:
	ldr	r2, [fp, #-60]
	ldr	r2, [r2, #32]
	cmp	r2, #0
	movle	r3, #0
	strle	r3, [fp, #-72]
	ble	.L4
	ldr	r1, [fp, #-68]
	mov	r7, #0
	rsb	r8, r9, #0
	sub	r10, r9, #1
	str	r7, [fp, #-76]
	mov	r6, r2
	mul	r3, r3, r1
	str	r7, [fp, #-72]
	str	r3, [fp, #-84]
	sub	r3, r3, #1
	str	r3, [fp, #-88]
	b	.L5
.L30:
	ldr	r0, [r5, #52]
	mov	r1, r9
	str	r2, [fp, #-56]
	sub	r0, r0, #1
	add	r0, r0, r9
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-56]
	mul	r3, r9, r0
	cmp	r2, r3
	str	r3, [fp, #-76]
	bhi	.L9
.L8:
	add	r7, r7, #1
	cmp	r6, r7
	ble	.L4
.L19:
	cmp	r7, #199
	bgt	.L29
.L5:
	ldr	r3, [fp, #-60]
	mov	r1, r9
	add	r5, r3, r7, lsl #3
	ldr	r3, [r5, #56]
	ldr	r4, [r5, #60]
	str	r3, [fp, #-64]
	sub	r3, r4, #1
	add	r3, r3, r9
	str	r3, [fp, #-56]
	mov	r0, r3
	bl	__aeabi_uidiv
	cmp	r7, #0
	ldr	r3, [fp, #-56]
	mul	r2, r9, r0
	bgt	.L30
	ldr	r1, [fp, #-76]
	cmp	r2, r1
	movhi	r1, #0
	movls	r1, #1
	cmp	r7, #0
	moveq	r1, #0
	cmp	r1, #0
	andeq	r3, r3, r8
	bne	.L8
.L11:
	ldr	r2, [fp, #-84]
	mov	r1, r9
	ldr	r0, [fp, #-64]
	cmp	r2, r3
	ldr	r4, [fp, #-88]
	movhi	r4, r3
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-72]
	add	r6, r3, #1
	mul	r5, r9, r0
	cmp	r5, r4
	movhi	r5, #0
	cmp	r6, #250
	bgt	.L31
	mov	r0, r5
	ldr	r1, [fp, #-68]
	bl	__aeabi_uidivmod
	ldr	r2, [fp, #-72]
	mov	r0, r5
	mov	r3, #0	@ movhi
	mov	r5, r2, asl #1
	bfi	r3, r1, #0, #9
	ldr	r1, [fp, #-68]
	strh	r3, [fp, #-48]	@ movhi
	bl	__aeabi_uidiv
	ldr	r3, .L33
	add	r1, r5, #12
	mov	ip, #0	@ movhi
	ldr	r2, [r3, #848]
	ldr	r3, [fp, #-80]
	add	r1, r3, r1
	ldr	r3, .L33
	rsb	r1, r2, r1
	ldr	r3, [r3, #852]
	cmp	r1, r3
	bfi	ip, r0, #0, #9
	strh	ip, [fp, #-46]	@ movhi
	bcc	.L16
	ldr	r1, .L33
	mov	r0, #1
	str	r0, [r1, #844]
.L17:
	ldr	r1, [fp, #-68]
	mov	r0, r4
	str	r3, [fp, #-64]
	add	r5, r5, #13
	str	r2, [fp, #-56]
	bl	__aeabi_uidivmod
	mov	r0, r4
	mov	ip, #0	@ movhi
	bfi	ip, r1, #0, #9
	ldr	r1, [fp, #-68]
	strh	ip, [fp, #-48]	@ movhi
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-80]
	mov	r1, #0	@ movhi
	ldr	r2, [fp, #-56]
	add	r5, r3, r5
	ldr	r3, [fp, #-64]
	rsb	r2, r2, r5
	cmp	r2, r3
	bfi	r1, r0, #0, #9
	strh	r1, [fp, #-46]	@ movhi
	bcc	.L18
	ldr	r3, .L33
	mov	r2, #1
	str	r6, [fp, #-72]
	add	r7, r7, #1
	str	r2, [r3, #844]
	ldr	r3, [fp, #-60]
	ldr	r6, [r3, #32]
	cmp	r6, r7
	bgt	.L19
.L4:
	ldr	r3, [fp, #4]
	mov	r0, #0
	ldr	r2, [fp, #-72]
	str	r2, [r3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L32:
	ldr	r2, [r5, #64]
	and	r2, r2, r8
	cmp	r3, r2
	add	r0, r2, #1
	bhi	.L12
	cmp	r3, r0
	beq	.L12
	ldr	r2, [r5, #52]
	add	r2, r10, r2
	and	r2, r2, r8
	cmp	r3, r2
	bhi	.L11
.L12:
	ldr	r4, [r5, #68]
	add	r5, r5, #8
	mov	r7, r1
.L9:
	cmp	r7, #198
	add	r1, r7, #1
	add	r3, r10, r4
	movle	r2, #1
	movgt	r2, #0
	cmp	r6, r1
	and	r3, r3, r8
	movle	r2, #0
	cmp	r2, #0
	bne	.L32
	b	.L11
.L16:
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-80]
	add	r3, r3, #6
	str	r2, [r1, r3, asl #3]
	ldr	r3, .L33
	ldr	r2, [r3, #848]
	ldr	r3, [r3, #852]
	b	.L17
.L18:
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-80]
	mov	r3, r3, asl #3
	str	r6, [fp, #-72]
	add	r3, r3, #52
	str	r2, [r1, r3]
	ldr	r3, [fp, #-60]
	ldr	r6, [r3, #32]
	b	.L8
.L29:
	movw	r1, #1676
	ldr	r3, .L33+4
	stmia	sp, {r1, r7}
	mov	r0, #0
	ldr	r2, .L33+8
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L28:
	mov	r0, #1
	ldr	r2, .L33+12
	movw	r1, #1653
	str	r3, [fp, #-56]
	mov	r9, r0
	bl	dprint_normal
	ldr	r3, [fp, #-56]
	b	.L2
.L31:
	ldr	r2, [fp, #-60]
	mov	r3, #1
	str	r6, [fp, #-72]
	str	r3, [r2, #44]
	b	.L4
.L34:
	.align	2
.L33:
	.word	g_HwMem
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC0
	UNWIND(.fnend)
	.size	VDMHAL_CfgNotFullRepair, .-VDMHAL_CfgNotFullRepair
	.align	2
	.type	VDMHAL_FillHalMem, %function
VDMHAL_FillHalMem:
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
	add	ip, r1, #1020
	mov	r5, r1
	add	ip, ip, #3
	add	r2, r0, #12
	bic	ip, ip, #1020
	bic	ip, ip, #3
	add	r1, ip, #210944
	mov	r3, ip
.L36:
	str	r3, [r2, #4]!
	add	r3, r3, #1024
	cmp	r3, r1
	bne	.L36
	add	r4, ip, #216064
	mov	r3, #210944
	add	ip, ip, r3
	str	r3, [r0, #840]
	mov	r1, r4
	str	ip, [r0, #856]
	bl	H264HAL_FillMixRam
	rsb	r4, r5, r4
	cmp	r0, #0
	addcs	r0, r4, r0
	addcc	r0, r4, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_FillHalMem, .-VDMHAL_FillHalMem
	.align	2
	.global	VDMHAL_GetHalMemSize
	.type	VDMHAL_GetHalMemSize, %function
VDMHAL_GetHalMemSize:
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
	bne	.L41
	mov	r1, #1
	ldr	r0, .L42
	bl	VDMHAL_FillHalMem
	ldr	r3, .L42+4
	mov	r1, r5
	mov	r2, #1000
	ldr	r3, [r3, #48]
	mov	r4, r0
	ldr	r0, .L42
	blx	r3
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L41:
	str	r5, [sp]
	mov	r1, #213
	ldr	r3, .L42+8
	mov	r0, #0
	ldr	r2, .L42+12
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+24
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMHAL_GetHalMemSize, .-VDMHAL_GetHalMemSize
	.align	2
	.global	VDMHAL_OpenHAL
	.type	VDMHAL_OpenHAL, %function
VDMHAL_OpenHAL:
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
	subs	r3, r0, #0
	beq	.L52
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L53
	ldr	r6, [r3, #8]
	cmp	r6, #0
	ldrgt	ip, .L56
	movgt	r1, #240
	bgt	.L51
	ldr	r7, [r3, #4]
	cmp	r7, #0
	ble	.L54
	mov	r2, #1000
	ldr	r9, .L56+4
	mul	r8, r2, r6
	ldr	r10, .L56+8
	mov	r1, #0
	add	r4, r8, r9
	ldr	r3, [r10, #48]
	mov	r0, r4
	blx	r3
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	str	r0, [r9, r8]
	mov	r0, #53248
	movt	r0, 63683
	bl	MEM_Phy2Vir
	mov	r1, r5
	stmib	r4, {r0, r5, r7}
	mov	r0, r4
	bl	VDMHAL_FillHalMem
	cmp	r0, r7
	bhi	.L55
	ldr	r0, [r4, #32]
	bl	MEM_Phy2Vir
	mov	r3, #206848
	str	r3, [r4, #852]
	ldr	r5, .L56+12
	str	r0, [r4, #848]
	mov	r0, r4
	bl	H264HAL_InitHal
	mov	r2, #44
	ldr	r3, [r10, #48]
	mov	r1, #0
	mov	r4, r0
	mla	r0, r2, r6, r5
	blx	r3
	mov	r3, #4
	str	r3, [r5]
.L46:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L54:
	ldr	ip, .L56+16
	mov	r1, #243
.L51:
	ldr	r3, .L56+20
	mov	r0, #0
	ldr	r2, .L56+24
	mvn	r4, #0
	str	ip, [sp]
	bl	dprint_normal
	b	.L46
.L55:
	mov	r3, r0
	str	r7, [sp]
	ldr	r2, .L56+28
	mov	r1, #260
	mov	r0, #0
	mvn	r4, #0
	bl	dprint_normal
	b	.L46
.L53:
	ldr	ip, .L56+32
	mov	r0, r5
	ldr	r3, .L56+20
	mov	r1, #237
	ldr	r2, .L56+24
	mvn	r4, #0
	str	ip, [sp]
	bl	dprint_normal
	b	.L46
.L52:
	ldr	ip, .L56+36
	mov	r1, #234
	ldr	r3, .L56+20
	mvn	r4, #0
	ldr	r2, .L56+24
	str	ip, [sp]
	bl	dprint_normal
	b	.L46
.L57:
	.align	2
.L56:
	.word	.LC6
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VdmExtParam
	.word	.LC7
	.word	.LANCHOR0+48
	.word	.LC3
	.word	.LC8
	.word	.LC5
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMHAL_OpenHAL, .-VDMHAL_OpenHAL
	.align	2
	.global	VDMHAL_CloseHAL
	.type	VDMHAL_CloseHAL, %function
VDMHAL_CloseHAL:
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
	movt	r0, 63683
	bl	MEM_Phy2Vir
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L61
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L60
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r2	@ indirect register sibling call
.L60:
	movw	r3, #293
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L61+4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L62:
	.align	2
.L61:
	.word	g_vdm_hal_fun_ptr
	.word	.LC9
	UNWIND(.fnend)
	.size	VDMHAL_CloseHAL, .-VDMHAL_CloseHAL
	.align	2
	.global	VDMHAL_DeriveDecCmpHeadInfo
	.type	VDMHAL_DeriveDecCmpHeadInfo, %function
VDMHAL_DeriveDecCmpHeadInfo:
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
	add	r0, r0, #2032
	add	r1, r1, #63
	add	r0, r0, #15
	bic	r1, r1, #63
	bic	r0, r0, #2032
	bic	r0, r0, #15
	mov	r1, r1, lsr #1
	mov	r0, r0, lsr #7
	str	r0, [r2]
	mul	r0, r1, r0
	str	r0, [r3]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_DeriveDecCmpHeadInfo, .-VDMHAL_DeriveDecCmpHeadInfo
	.align	2
	.global	VDMHAL_DeriveMetadataInfo
	.type	VDMHAL_DeriveMetadataInfo, %function
VDMHAL_DeriveMetadataInfo:
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
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #12]
	cmp	r3, #0
	beq	.L66
	ldr	r0, .L70
	bics	r3, r2, #16
	movne	r3, #0
	moveq	r3, #4096
	ldr	r2, [r0]
	str	r3, [r1, #24]
	cmp	r2, #1
	addeq	r3, r3, #4
	streq	r3, [r1, #24]
.L66:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	g_FsWaterMarkEnable
	UNWIND(.fnend)
	.size	VDMHAL_DeriveMetadataInfo, .-VDMHAL_DeriveMetadataInfo
	.align	2
	.global	VDMHAL_DeriveMemSize
	.type	VDMHAL_DeriveMemSize, %function
VDMHAL_DeriveMemSize:
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
	ldr	r3, [r0, #12]
	ldr	ip, [r0, #20]
	sub	r3, r3, #16
	ldr	r4, [r0, #16]
	cmp	r3, #3
	sub	r2, ip, #1
	add	r3, r4, #63
	ldrb	r9, [r0, #6]	@ zero_extendqisi2
	movcc	lr, #64
	movcs	lr, #32
	add	lr, r2, lr
	bic	r3, r3, #63
	mvncc	r2, #63
	mvncs	r2, #31
	and	lr, lr, r2
	cmp	r9, #8
	mov	r7, r3, asl #4
	ldrb	r8, [r0, #4]	@ zero_extendqisi2
	mul	r2, r3, lr
	movhi	r3, r3, lsr #2
	movls	lr, #0
	strls	lr, [fp, #-52]
	mulhi	lr, r3, lr
	movhi	r3, r3, asl #5
	strhi	r3, [fp, #-52]
	cmp	r8, #1
	movne	ip, #0
	movne	r4, ip
	beq	.L123
.L75:
	add	r3, lr, r2
	ldr	r6, [r1]
	add	r3, r3, ip
	add	r2, ip, r2
	cmp	r6, #0
	mov	r10, r7, lsr #1
	add	r3, r3, r3, lsl #1
	streq	r6, [r1, #36]
	mov	r3, r3, lsr #1
	add	r5, r3, #1024
	str	r5, [fp, #-48]
	moveq	r5, #32
	streq	r5, [r1, #32]
	ldr	r5, [r0, #40]
	adds	r5, r5, #0
	movne	r5, #1
	cmp	r9, #8
	strb	r5, [r1, #40]
	ldrb	r5, [r0, #6]	@ zero_extendqisi2
	str	r2, [r1, #68]
	addhi	r2, r2, r2, lsl #1
	movls	r2, #0
	strls	r2, [r1, #72]
	movhi	r2, r2, lsr #1
	strls	r2, [r1, #76]
	strhi	r2, [r1, #76]
	addhi	r2, r2, lr
	str	r2, [r1, #80]
	ldr	r2, .L129
	str	ip, [r1, #56]
	ldrhi	ip, [fp, #-52]
	ldr	lr, [r2]
	strb	r8, [r1, #41]
	strhi	ip, [r1, #72]
	cmp	lr, #1
	ldr	ip, [fp, #-48]
	addeq	r3, r3, #1024
	addeq	r3, r3, #4
	strb	r5, [r1, #42]
	str	r4, [r1, #52]
	str	ip, [r1, #48]
	streq	r3, [r1, #48]
	cmp	r6, #0
	str	r7, [r1, #60]
	str	r10, [r1, #64]
	ldrb	r4, [r0, #5]	@ zero_extendqisi2
	ldr	r6, [r0, #44]
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #20]
	ldrb	r5, [r0, #7]	@ zero_extendqisi2
	ldr	r7, [r0, #12]
	beq	.L110
	sxtb	r8, r5
	cmp	r8, #0
	blt	.L124
	sub	r7, r7, #16
	cmp	r7, #3
	movcc	ip, #64
	movcs	ip, #32
	cmp	r4, #0
	beq	.L125
	add	r2, r2, #63
	sub	r3, r3, #1
	bic	r2, r2, #63
	add	r3, r3, ip
	rsb	ip, ip, #0
	cmp	r8, #8
	and	r3, r3, ip
	mov	r7, r2, lsr #1
	mul	ip, r7, r3
	mov	ip, ip, lsr #3
	add	ip, ip, #1020
	add	ip, ip, #3
	bic	ip, ip, #1020
	bic	ip, ip, #3
	beq	.L126
	cmp	r8, #10
	bne	.L92
	mul	r3, r2, r3
	mov	r6, #0
	mov	r3, r3, asl #1
.L119:
	add	r3, r3, #1020
	add	r3, r3, #3
	bic	r3, r3, #1020
	bic	r3, r3, #3
	add	r3, r3, ip
.L90:
	cmp	lr, #1
	clz	r8, r4
	strb	r4, [r1, #85]
	add	r4, r3, #1024
	addeq	r3, r3, #1024
	str	r4, [r1, #92]
	strb	r5, [r1, #86]
	addeq	r3, r3, #4
	str	r7, [r1, #96]
	mov	r9, #0
	str	ip, [r1, #100]
	mov	r8, r8, lsr #5
	str	r2, [r1, #104]
	strb	r8, [r1, #84]
	str	r2, [r1, #108]
	str	r6, [r1, #112]
	str	r9, [r1, #36]
	streq	r3, [r1, #92]
	ldr	r4, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #20]
.L80:
	ldr	ip, [r1, #4]
	cmp	ip, #0
	beq	.L100
	add	r5, r2, #15
	add	r6, r3, #15
	ldr	r8, .L129+4
	bic	r7, r4, #2
	mov	r5, r5, lsr #4
	mov	r6, r6, lsr #4
	cmp	r6, #36
	cmpls	r5, #45
	ldrb	r8, [r8]	@ zero_extendqisi2
	movls	ip, #64
	movhi	ip, #32
	cmp	r8, #1
	moveq	ip, #64
	cmp	r7, #16
	moveq	ip, #16
	cmp	r4, #18
	beq	.L97
	mul	r5, r5, r6
	mul	ip, ip, r5
	add	ip, ip, #47
	bic	ip, ip, #31
.L98:
	cmp	lr, #1
	add	r3, ip, #256
	addeq	ip, ip, #260
	str	r3, [r1, #16]
	streq	ip, [r1, #16]
	ldr	r4, [r0, #12]
.L100:
	ldr	r3, [r1, #8]
	cmp	r3, #0
	beq	.L105
	bics	r3, r4, #16
	movne	r3, #0
	moveq	r3, #4096
	cmp	lr, #1
	strne	r3, [r1, #24]
	beq	.L127
.L105:
	mov	r0, #0
.L117:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L125:
	cmp	r8, #8
	addeq	r2, r2, #63
	biceq	r2, r2, #63
	beq	.L86
	cmp	r8, #10
	beq	.L128
	cmp	r8, #16
	bne	.L88
	add	r2, r2, #63
	bic	r2, r2, #63
	mov	r2, r2, asl #1
.L86:
	cmp	r6, #1
	subne	r3, r3, #1
	rsbne	r6, ip, #0
	addne	r3, r3, ip
	ldreq	r6, [r0, #28]
	andne	r6, r6, r3
	moveq	ip, #0
	movne	ip, #0
	mul	r6, r6, r2
	mov	r7, ip
	add	r3, r6, r6, lsl #1
	mov	r3, r3, lsr #1
	add	r3, r3, #1020
	add	r3, r3, #3
	bic	r3, r3, #1020
	bic	r3, r3, #3
	b	.L90
.L110:
	mov	r4, r7
	b	.L80
.L123:
	add	r4, r4, #2032
	add	ip, ip, #63
	add	r4, r4, #15
	bic	ip, ip, #63
	bic	r4, r4, #2032
	bic	r4, r4, #15
	mov	ip, ip, lsr #1
	mov	r4, r4, lsr #7
	mul	ip, r4, ip
	b	.L75
.L127:
	add	r3, r3, #4
	mov	r0, #0
	str	r3, [r1, #24]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L128:
	add	r2, r2, #63
	bic	r2, r2, #63
	add	r2, r2, r2, lsl #2
	mov	r2, r2, lsr #2
	b	.L86
.L97:
	add	ip, r2, #63
	add	r3, r3, #63
	bic	ip, ip, #63
	bic	r3, r3, #63
	mov	ip, ip, lsr #4
	mov	r3, r3, lsr #4
	mul	ip, r3, ip
	mov	ip, ip, asl #4
	b	.L98
.L126:
	add	r8, r2, r2, lsl #1
	mov	r6, #0
	mul	r3, r3, r8
	mov	r3, r3, lsr #1
	b	.L119
.L92:
	str	r8, [sp]
	movw	r1, #577
	ldr	r3, .L129+8
	mov	r0, #1
	ldr	r2, .L129+12
	bl	dprint_normal
.L82:
	ldr	r3, .L129+16
	movw	r1, #754
	ldr	r2, .L129+20
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L117
.L88:
	str	r8, [sp]
	mov	r1, #544
	ldr	r3, .L129+8
	mov	r0, #1
	ldr	r2, .L129+24
	bl	dprint_normal
	b	.L82
.L124:
	ldr	r3, .L129+8
	movw	r1, #515
	ldr	r2, .L129+28
	mov	r0, #1
	bl	dprint_normal
	b	.L82
.L130:
	.align	2
.L129:
	.word	g_FsWaterMarkEnable
	.word	g_NotDirect_8x8_InferenceFlag
	.word	.LANCHOR0+64
	.word	.LC12
	.word	.LANCHOR0+88
	.word	.LC13
	.word	.LC11
	.word	.LC10
	UNWIND(.fnend)
	.size	VDMHAL_DeriveMemSize, .-VDMHAL_DeriveMemSize
	.align	2
	.global	VDMHAL_InquireMemNeed
	.type	VDMHAL_InquireMemNeed, %function
VDMHAL_InquireMemNeed:
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
	subs	r6, r0, #0
	mov	r4, r1
	mov	r5, r2
	beq	.L133
	cmp	r6, #1
	beq	.L134
	str	r6, [sp]
	mov	r1, #840
	ldr	r3, .L170
	mov	r0, #1
	ldr	r2, .L170+4
	bl	dprint_normal
	mvn	r0, #0
.L150:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L134:
	ldr	r2, [r1, #16]
	mov	r0, #0
	ldr	r3, [r1, #20]
	add	r2, r2, #15
	ldr	r1, [r1, #32]
	add	r3, r3, #31
	mov	r2, r2, lsr #4
	mov	r3, r3, lsr #5
	str	r1, [r5, #44]
	mul	r3, r3, r2
	mov	r2, r3, asl #11
	sub	r3, r2, r3, asl #9
	str	r3, [r5, #48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L133:
	ldr	r9, [r1]
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	mov	r0, r9
	bl	VCTRL_GetOccupiedNum
	mov	r7, r0
	mov	r0, r9
	bl	VCTRL_GetExtraFrameNum
	ldr	r3, [r4, #32]
	str	r6, [r5]
	str	r6, [r5, #88]
	add	r0, r7, r0
	add	r0, r0, r3
	str	r0, [r5, #44]
	ldr	r3, [r4, #12]
	bics	r3, r3, #16
	beq	.L164
.L135:
	mov	r3, #0
	str	r3, [r5, #8]
	str	r3, [r5, #28]
.L136:
	ldr	r8, .L170+8
	mov	r3, #1
	str	r3, [r5, #4]
	ldr	r3, [r8, r9, asl #2]
	add	r3, r3, #204800
	ldr	r3, [r3, #2684]
	cmp	r3, #2
	ldreq	r3, [r5, #44]
	ldrne	r3, [r4, #36]
	str	r3, [r5, #20]
	ldr	r9, [r4]
	ldr	r3, [r4, #16]
	ldr	r10, [r4, #12]
	ldr	r6, [r8, r9, asl #2]
	str	r3, [fp, #-48]
	add	r6, r6, #204800
	ldr	r3, [r4, #20]
	ldr	r7, [r6, #2512]
	cmp	r7, #1
	beq	.L139
	bcc	.L141
	cmp	r7, #3
	bne	.L165
	mov	r0, #0
	ldr	r2, .L170+12
	movw	r1, #345
	str	r3, [fp, #-52]
	mov	r7, r0
	bl	dprint_normal
	ldr	r3, [fp, #-52]
.L139:
	ldr	r0, [r8, r9, asl #2]
	mov	r1, #352
	str	r7, [r6, #3244]
	add	r0, r0, #204800
	ldr	r2, .L170+16
	ldr	ip, [r0, #2512]
	mov	r0, #1
	str	r3, [sp, #12]
	ldr	r3, [fp, #-48]
	stmia	sp, {r7, r10}
	str	r3, [sp, #8]
	mov	r3, ip
	bl	dprint_normal
	ldr	r2, [r6, #3244]
	ldr	r3, [r5]
	cmp	r3, #0
	streq	r7, [r6, #3240]
	strb	r2, [r4, #4]
	ldr	r0, [r4]
	ldr	r2, [r6, #3240]
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	strb	r2, [r4, #5]
	ldr	r2, [r8, r0, asl #2]
	add	r2, r2, #204800
	ldr	r1, [r2, #2596]
	cmp	r1, #0
	beq	.L166
	cmp	r1, #1
	moveq	r3, #8
	beq	.L148
	cmp	r1, #2
	movne	r3, #255
	beq	.L167
.L148:
	strb	r3, [r4, #7]
	bl	VCTRL_IfNoGapEnable
	mov	r1, r5
	str	r0, [r4, #44]
	mov	r0, r4
	bl	VDMHAL_DeriveMemSize
	cmp	r0, #0
	beq	.L150
	ldr	r3, .L170+20
	movw	r1, #797
	ldr	r2, .L170+24
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L150
.L164:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	streq	r0, [r5, #28]
	streq	r3, [r5, #8]
	bne	.L135
	b	.L136
.L166:
	cmp	r3, #9
	uxtbne	r3, r3
	moveq	r3, #10
	b	.L148
.L141:
	bics	r2, r10, #16
	moveq	r2, #1
	movne	r2, #0
	cmp	r10, #18
	orreq	r2, r2, #1
	cmp	r2, #0
	ldr	r2, [fp, #-48]
	mul	r1, r2, r3
	bne	.L168
.L144:
	sub	r7, r10, #17
	clz	r7, r7
	mov	r7, r7, lsr #5
.L145:
	movw	r2, #16383
	movt	r2, 506
	cmp	r1, r2
	movhi	r7, #0
	b	.L139
.L165:
	mov	r7, #0
	b	.L139
.L168:
	movw	r2, #36863
	movt	r2, 126
	cmp	r1, r2
	movhi	r7, #1
	bhi	.L145
	b	.L144
.L167:
	cmp	r3, #8
	ldr	r2, [r2, #3240]
	movls	r3, #0
	movhi	r3, #1
	cmp	r2, #1
	movne	r2, #0
	andeq	r2, r3, #1
	cmp	r2, #0
	bne	.L169
	cmp	r3, #0
	movne	r3, #16
	moveq	r3, #8
	b	.L148
.L169:
	ldr	r3, .L170+28
	movw	r1, #383
	ldr	r2, .L170+32
	mov	r0, #1
	bl	dprint_normal
	ldr	r0, [r4]
	mov	r3, #255
	b	.L148
.L171:
	.align	2
.L170:
	.word	.LANCHOR0+168
	.word	.LC18
	.word	s_pstVfmwChan
	.word	.LC14
	.word	.LC15
	.word	.LANCHOR0+136
	.word	.LC17
	.word	.LANCHOR0+112
	.word	.LC16
	UNWIND(.fnend)
	.size	VDMHAL_InquireMemNeed, .-VDMHAL_InquireMemNeed
	.align	2
	.global	VDMHAL_ResetVdm
	.type	VDMHAL_ResetVdm, %function
VDMHAL_ResetVdm:
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
	subs	r6, r0, #0
	mov	r4, #0
	str	r4, [fp, #-48]
	ble	.L173
	str	r4, [sp, #4]
	mov	r0, r4
	str	r6, [sp]
	movw	r1, #905
	ldr	r3, .L190
	ldr	r2, .L190+4
	bl	dprint_normal
.L172:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L173:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L188
	mov	r10, #1000
	ldr	r7, .L190+8
	mul	r10, r10, r6
	ldr	r3, [r7, r10]
	add	r2, r3, #61440
	ldr	r8, [r3, #36]
	ldr	r3, [r2, #2052]
	tst	r3, #3
	str	r3, [fp, #-48]
	beq	.L172
	ldr	r5, .L190+12
	mov	r9, r7
	ldr	r3, [r5, #112]
	blx	r3
	ldr	r3, [r9, r10]!
	add	r3, r3, #61440
	ldr	r1, [r3, #2060]
	uxtb	r2, r1
	str	r1, [fp, #-48]
	orr	r2, r2, #2
	strb	r2, [fp, #-48]
	ldr	r2, [fp, #-48]
	str	r2, [r3, #2060]
	b	.L178
.L189:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L179
.L178:
	ldr	r3, [r5, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r9]
	add	r3, r3, #61440
	ldr	r3, [r3, #2064]
	tst	r3, #2
	str	r3, [fp, #-48]
	beq	.L189
	cmp	r4, #1000
	bge	.L179
	str	r6, [sp]
	mov	r1, #952
	ldr	r3, .L190
	mov	r0, #0
	ldr	r2, .L190+16
	bl	dprint_normal
.L181:
	mov	r3, #1000
	ldr	r1, [r5, #112]
	mul	r6, r3, r6
	ldr	r2, [r7, r6]
	add	r2, r2, #61440
	ldr	r3, [r2, #2060]
	str	r3, [fp, #-48]
	bfc	r3, #1, #1
	strb	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #2060]
	blx	r1
	ldr	r3, [r7, r6]
	str	r8, [r3, #36]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L179:
	str	r6, [sp]
	mov	r1, #948
	ldr	r3, .L190
	mov	r0, #0
	ldr	r2, .L190+20
	bl	dprint_normal
	b	.L181
.L188:
	ldr	r2, .L190+24
	movw	r1, #915
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L191:
	.align	2
.L190:
	.word	.LANCHOR0+192
	.word	.LC19
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC22
	.word	.LC21
	.word	.LC20
	UNWIND(.fnend)
	.size	VDMHAL_ResetVdm, .-VDMHAL_ResetVdm
	.align	2
	.global	VDMHAL_SetSmmuPageTableAddr
	.type	VDMHAL_SetSmmuPageTableAddr, %function
VDMHAL_SetSmmuPageTableAddr:
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
	ldr	r3, .L198
	mov	r4, r0
	ldr	r3, [r3, #188]
	cmp	r3, #0
	beq	.L192
	sub	r2, fp, #24
	sub	r1, fp, #28
	sub	r0, fp, #32
	blx	r3
	cmp	r4, #0
	bne	.L194
	ldr	r3, .L198+4
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	add	r3, r3, #61440
	str	r0, [r3, #524]
	str	r1, [r3, #772]
	str	r2, [r3, #776]
.L192:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L194:
	mov	r5, #1
	str	r4, [sp]
	ldr	r3, .L198+8
	mov	r1, #972
	str	r5, [sp, #4]
	mov	r0, #32
	ldr	r2, .L198+12
	bl	dprint_normal
	stmia	sp, {r4, r5}
	movw	r1, #973
	ldr	r3, .L198+8
	ldr	r2, .L198+12
	mov	r0, #32
	bl	dprint_normal
	stmia	sp, {r4, r5}
	movw	r1, #974
	ldr	r3, .L198+8
	ldr	r2, .L198+12
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L199:
	.align	2
.L198:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LANCHOR0+208
	.word	.LC23
	UNWIND(.fnend)
	.size	VDMHAL_SetSmmuPageTableAddr, .-VDMHAL_SetSmmuPageTableAddr
	.align	2
	.global	VDMHAL_EnableSmmu
	.type	VDMHAL_EnableSmmu, %function
VDMHAL_EnableSmmu:
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
	ldr	r3, .L201
	mov	r2, #8
	ldr	r3, [r3]
	add	r3, r3, #61440
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L202:
	.align	2
.L201:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_EnableSmmu, .-VDMHAL_EnableSmmu
	.align	2
	.global	VDMHAL_GlbReset
	.type	VDMHAL_GlbReset, %function
VDMHAL_GlbReset:
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
	mov	r4, #0
	movt	r4, 63683
	mov	r0, r4
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L208
	ldr	r3, .L209
	ldr	r2, [r3, #76]
	cmp	r2, #0
	beq	.L206
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	r2	@ indirect register sibling call
.L206:
	movw	r3, #1001
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L209+4
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_normal
.L208:
	str	r4, [sp]
	movw	r1, #995
	ldr	r3, .L209+8
	ldr	r2, .L209+12
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L210:
	.align	2
.L209:
	.word	g_vdm_hal_fun_ptr
	.word	.LC9
	.word	.LANCHOR0+236
	.word	.LC24
	UNWIND(.fnend)
	.size	VDMHAL_GlbReset, .-VDMHAL_GlbReset
	.align	2
	.global	VDMHAL_GlbResetX
	.type	VDMHAL_GlbResetX, %function
VDMHAL_GlbResetX:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r4, #0
	movt	r4, 63683
	mov	r5, r0
	mov	r0, r4
	mov	r3, #0
	str	r3, [fp, #-32]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L230
	cmp	r5, #0
	ble	.L231
	mov	r2, #1
	str	r5, [sp]
	str	r2, [sp, #4]
	movw	r1, #1021
	ldr	r3, .L235
	mov	r0, #32
	ldr	r2, .L235+4
	bl	dprint_normal
	ldrb	r4, [fp, #-32]	@ zero_extendqisi2
	and	r4, r4, #3
	cmp	r4, #1
	beq	.L232
.L211:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L231:
	mov	r4, #1000
	ldr	r7, .L235+8
	mul	r4, r4, r5
	ldr	r3, [r7, r4]
	add	r3, r3, #61440
	ldr	r3, [r3, #2052]
	and	r2, r3, #3
	cmp	r2, #1
	str	r3, [fp, #-32]
	bne	.L211
	ldr	r6, .L235+12
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r3, [r7, r4]
	add	r3, r3, #61440
	ldr	r1, [r3, #2060]
	uxtb	r2, r1
	str	r1, [fp, #-32]
	orr	r2, r2, #1
	strb	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #2060]
	b	.L226
.L232:
	ldr	r6, .L235+12
	ldr	r3, [r6, #112]
	blx	r3
	movw	r1, #1027
	ldr	r3, .L235
	mov	r0, #32
	ldr	r2, .L235+4
	str	r4, [sp, #4]
	str	r5, [sp]
	bl	dprint_normal
	ldrb	ip, [fp, #-32]	@ zero_extendqisi2
	str	r4, [sp, #4]
	movw	r1, #1029
	str	r5, [sp]
	mov	r0, #32
	ldr	r3, .L235
	orr	ip, ip, #1
	ldr	r2, .L235+16
	strb	ip, [fp, #-32]
	bl	dprint_normal
.L226:
	ldr	r3, .L235+8
	mov	r7, #1000
	mov	r4, #0
	mla	r7, r7, r5, r3
	b	.L221
.L218:
	stmia	sp, {r5, ip}
	bl	dprint_normal
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	tst	r3, #1
	bne	.L220
.L233:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L222
.L221:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	cmp	r5, #0
	mov	ip, #1
	ldr	r3, .L235
	movw	r1, #1035
	ldr	r2, .L235+4
	mov	r0, #32
	bgt	.L218
	ldr	r3, [r7]
	add	r3, r3, #61440
	ldr	r3, [r3, #2064]
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L233
.L220:
	cmp	r4, #1000
	bge	.L222
	str	r5, [sp]
	movw	r1, #1049
	ldr	r3, .L235
	mov	r0, #0
	ldr	r2, .L235+20
	bl	dprint_normal
.L224:
	cmp	r5, #0
	ble	.L234
	mov	r4, #1
	str	r5, [sp]
	ldr	r3, .L235
	movw	r1, #1052
	str	r4, [sp, #4]
	mov	r0, #32
	ldr	r2, .L235+4
	bl	dprint_normal
	str	r4, [sp, #4]
	str	r5, [sp]
	movw	r1, #1054
	ldr	r3, .L235
	mov	r0, #32
	ldr	r2, .L235+16
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L222:
	str	r5, [sp]
	movw	r1, #1045
	ldr	r3, .L235
	mov	r0, #0
	ldr	r2, .L235+24
	bl	dprint_normal
	b	.L224
.L234:
	mov	r3, #1000
	ldr	r2, .L235+8
	mul	r5, r3, r5
	ldr	r2, [r2, r5]
	add	r2, r2, #61440
	ldr	r3, [r2, #2060]
	str	r3, [fp, #-32]
	bfc	r3, #0, #1
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #2060]
	b	.L211
.L230:
	str	r4, [sp]
	movw	r1, #1017
	ldr	r3, .L235
	ldr	r2, .L235+28
	bl	dprint_normal
	b	.L211
.L236:
	.align	2
.L235:
	.word	.LANCHOR0+252
	.word	.LC25
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC23
	.word	.LC27
	.word	.LC26
	.word	.LC24
	UNWIND(.fnend)
	.size	VDMHAL_GlbResetX, .-VDMHAL_GlbResetX
	.align	2
	.global	VDMHAL_ClearIntState
	.type	VDMHAL_ClearIntState, %function
VDMHAL_ClearIntState:
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
	subs	r3, r0, #0
	bgt	.L240
	mov	r0, #1000
	ldr	r1, .L241
	mul	r3, r0, r3
	mvn	r2, #0
	ldr	r3, [r1, r3]
	str	r2, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L240:
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L241+4
	movw	r1, #1069
	str	r0, [sp, #4]
	ldr	r2, .L241+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L242:
	.align	2
.L241:
	.word	g_HwMem
	.word	.LANCHOR0+272
	.word	.LC19
	UNWIND(.fnend)
	.size	VDMHAL_ClearIntState, .-VDMHAL_ClearIntState
	.align	2
	.global	VDMHAL_ClearMMUIntState
	.type	VDMHAL_ClearMMUIntState, %function
VDMHAL_ClearMMUIntState:
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
	subs	r4, r0, #0
	bgt	.L248
	mov	r3, #1000
	ldr	r5, .L250
	mul	r4, r3, r4
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L249
.L246:
	add	r3, r3, #61440
	mov	r2, #7
	str	r2, [r3, #44]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L248:
	mov	r0, #0
	str	r4, [sp]
	str	r0, [sp, #4]
	movw	r1, #1121
	ldr	r3, .L250+4
	ldr	r2, .L250+8
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L249:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L246
.L247:
	ldr	r2, .L250+12
	movw	r1, #1135
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L251:
	.align	2
.L250:
	.word	g_HwMem
	.word	.LANCHOR0+296
	.word	.LC19
	.word	.LC28
	UNWIND(.fnend)
	.size	VDMHAL_ClearMMUIntState, .-VDMHAL_ClearMMUIntState
	.align	2
	.global	VDMHAL_MaskInt
	.type	VDMHAL_MaskInt, %function
VDMHAL_MaskInt:
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
	subs	r4, r0, #0
	bgt	.L257
	mov	r3, #1000
	ldr	r5, .L259
	mul	r4, r3, r4
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L258
.L255:
	mvn	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L257:
	mov	r0, #0
	str	r4, [sp]
	str	r0, [sp, #4]
	movw	r1, #1156
	ldr	r3, .L259+4
	ldr	r2, .L259+8
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L258:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L255
.L256:
	ldr	r2, .L259+12
	movw	r1, #1170
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L260:
	.align	2
.L259:
	.word	g_HwMem
	.word	.LANCHOR0+320
	.word	.LC19
	.word	.LC28
	UNWIND(.fnend)
	.size	VDMHAL_MaskInt, .-VDMHAL_MaskInt
	.align	2
	.global	VDMHAL_GetIntMaskCfg
	.type	VDMHAL_GetIntMaskCfg, %function
VDMHAL_GetIntMaskCfg:
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
	cmp	r0, #1
	mvneq	r0, #5
	mvnne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_GetIntMaskCfg, .-VDMHAL_GetIntMaskCfg
	.align	2
	.global	VDMHAL_EnableInt
	.type	VDMHAL_EnableInt, %function
VDMHAL_EnableInt:
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
	subs	r3, r0, #0
	bgt	.L267
	mov	r0, #1000
	ldr	r1, .L268
	mul	r3, r0, r3
	mvn	r2, #1
	ldr	r3, [r1, r3]
	str	r2, [r3, #36]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L267:
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L268+4
	movw	r1, #1226
	str	r0, [sp, #4]
	ldr	r2, .L268+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L269:
	.align	2
.L268:
	.word	g_HwMem
	.word	.LANCHOR0+336
	.word	.LC19
	UNWIND(.fnend)
	.size	VDMHAL_EnableInt, .-VDMHAL_EnableInt
	.align	2
	.global	VDMHAL_CheckReg
	.type	VDMHAL_CheckReg, %function
VDMHAL_CheckReg:
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
	bgt	.L285
	sub	r3, r0, #1
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L273
.L275:
	.word	.L282
	.word	.L276
	.word	.L277
	.word	.L283
	.word	.L279
	.word	.L280
	.word	.L281
.L283:
	mov	r2, #40
.L274:
	mov	r3, #1000
	ldr	r0, .L286
	mul	r1, r3, r1
	ldr	r3, [r0, r1]
	ldr	r0, [r3, r2]
.L284:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L282:
	mov	r2, #28
	b	.L274
.L277:
	mov	r2, #36
	b	.L274
.L281:
	movw	r2, #62272
	b	.L274
.L276:
	mov	r2, #32
	b	.L274
.L279:
	movw	r2, #61480
	b	.L274
.L280:
	movw	r2, #62304
	b	.L274
.L273:
	str	r0, [sp]
	movw	r1, #1290
	ldr	r3, .L286+4
	mov	r0, #0
	ldr	r2, .L286+8
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L285:
	str	r1, [sp]
	mov	r0, #0
	movw	r1, #1243
	ldr	r3, .L286+4
	ldr	r2, .L286+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L284
.L287:
	.align	2
.L286:
	.word	g_HwMem
	.word	.LANCHOR0+356
	.word	.LC30
	.word	.LC29
	UNWIND(.fnend)
	.size	VDMHAL_CheckReg, .-VDMHAL_CheckReg
	.align	2
	.global	VDMHAL_ReadMMUMask
	.type	VDMHAL_ReadMMUMask, %function
VDMHAL_ReadMMUMask:
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
	cmp	r0, #0
	ble	.L291
	str	r0, [sp]
	mov	r2, #1
	ldr	r3, .L292
	movw	r1, #1303
	str	r2, [sp, #4]
	mov	r0, #32
	ldr	r2, .L292+4
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L291:
	mov	r3, #1000
	ldr	r2, .L292+8
	mul	r0, r3, r0
	ldr	r3, [r2, r0]
	add	r3, r3, #61440
	ldr	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L293:
	.align	2
.L292:
	.word	.LANCHOR0+372
	.word	.LC25
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_ReadMMUMask, .-VDMHAL_ReadMMUMask
	.align	2
	.global	VDMHAL_WriteMMUMask
	.type	VDMHAL_WriteMMUMask, %function
VDMHAL_WriteMMUMask:
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
	ble	.L297
	str	r1, [sp]
	mov	r2, #1
	ldr	r3, .L298
	movw	r1, #1310
	str	r2, [sp, #4]
	mov	r0, #32
	ldr	r2, .L298+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L297:
	mov	r3, #1000
	ldr	r2, .L298+8
	mul	r1, r3, r1
	ldr	r3, [r2, r1]
	add	r3, r3, #61440
	str	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L299:
	.align	2
.L298:
	.word	.LANCHOR0+392
	.word	.LC23
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_WriteMMUMask, .-VDMHAL_WriteMMUMask
	.align	2
	.global	VDMHAL_PrepareDec
	.type	VDMHAL_PrepareDec, %function
VDMHAL_PrepareDec:
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
	subs	r6, r2, #0
	mov	r4, r0
	mov	r5, r1
	mov	r7, r3
	bgt	.L313
	cmp	r1, #0
	beq	.L314
	sub	r1, r0, #6
	mov	r2, #0
	clz	r1, r1
	mov	r0, r2
	mov	r1, r1, lsr #5
	bl	SCD_ConfigReg
	mov	r3, r7
	mov	r2, #0
	mov	r1, #1
	mov	r0, #8
	bl	SCD_ConfigReg
	mov	r1, r5
	mov	r3, r7
	mov	r2, r6
	mov	r0, r4
	bl	HAL_CfgVdmReg
	cmp	r0, #0
	ldrne	ip, .L317
	movwne	r1, #1439
	bne	.L312
	cmp	r4, #2
	beq	.L306
	cmp	r4, #3
	beq	.L307
	cmp	r4, #0
	beq	.L315
.L311:
	ldr	ip, .L317+4
	movw	r1, #1442
.L312:
	ldr	r3, .L317+8
	mov	r0, #0
	ldr	r2, .L317+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L302
.L307:
	mov	r2, r7
	mov	r0, r5
	mov	r1, r6
	bl	MP2HAL_StartDec
.L305:
	cmp	r0, #0
	bne	.L311
	ldr	r2, .L317+16
	mov	r3, #1000
	mla	r3, r3, r6, r2
	ldr	r2, [r3, #844]
	str	r0, [r3, #844]
	cmp	r2, #1
	beq	.L316
.L302:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L315:
	mov	r2, r7
	mov	r0, r5
	mov	r1, r6
	bl	H264HAL_StartDec
	b	.L305
.L306:
	mov	r2, r7
	mov	r0, r5
	mov	r1, r6
	bl	MP4HAL_StartDec
	b	.L305
.L313:
	mov	r0, #0
	str	r6, [sp]
	str	r0, [sp, #4]
	movw	r1, #1427
	ldr	r3, .L317+8
	ldr	r2, .L317+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L302
.L314:
	ldr	ip, .L317+24
	mov	r0, r1
	ldr	r3, .L317+8
	movw	r1, #1431
	ldr	r2, .L317+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L302
.L316:
	str	r0, [sp, #8]
	movw	r1, #1450
	str	r6, [sp, #4]
	str	r4, [sp]
	ldr	r3, .L317+8
	ldr	r2, .L317+28
	bl	dprint_normal
	mvn	r0, #0
	b	.L302
.L318:
	.align	2
.L317:
	.word	.LC32
	.word	.LC33
	.word	.LANCHOR0+412
	.word	.LC3
	.word	g_HwMem
	.word	.LC19
	.word	.LC31
	.word	.LC34
	UNWIND(.fnend)
	.size	VDMHAL_PrepareDec, .-VDMHAL_PrepareDec
	.align	2
	.global	VDMHAL_IsVdmReady
	.type	VDMHAL_IsVdmReady, %function
VDMHAL_IsVdmReady:
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
	cmp	r0, #0
	ble	.L322
	str	r0, [sp]
	mov	r2, #1
	ldr	r3, .L323
	movw	r1, #1461
	str	r2, [sp, #4]
	mov	r0, #32
	ldr	r2, .L323+4
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L322:
	mov	r3, #1000
	ldr	r2, .L323+8
	mul	r0, r3, r0
	ldr	r3, [r2, r0]
	ldr	r0, [r3, #28]
	ubfx	r0, r0, #17, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L324:
	.align	2
.L323:
	.word	.LANCHOR0+432
	.word	.LC25
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_IsVdmReady, .-VDMHAL_IsVdmReady
	.align	2
	.global	VDMHAL_IsVdmRun
	.type	VDMHAL_IsVdmRun, %function
VDMHAL_IsVdmRun:
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
	cmp	r0, #0
	ble	.L328
	str	r0, [sp]
	mov	r4, #1
	ldr	r3, .L329
	movw	r1, #1473
	str	r4, [sp, #4]
	mov	r0, #32
	ldr	r2, .L329+4
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L328:
	mov	r3, #1000
	ldr	r2, .L329+8
	mul	r0, r3, r0
	ldr	r3, [r2, r0]
	ldr	r0, [r3, #40]
	subs	r0, r0, #1
	movne	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L330:
	.align	2
.L329:
	.word	.LANCHOR0+452
	.word	.LC25
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_IsVdmRun, .-VDMHAL_IsVdmRun
	.align	2
	.global	VDMHAL_IsVdhDecOver
	.type	VDMHAL_IsVdhDecOver, %function
VDMHAL_IsVdhDecOver:
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
	ldr	r3, .L341
	mov	r4, r0
	ldr	r3, [r3, #96]
	cmp	r3, #0
	moveq	r0, r3
	beq	.L332
	blx	r3
.L332:
	cmp	r4, #2
	beq	.L335
	cmp	r4, #3
	beq	.L335
	cmp	r4, #1
	ubfxeq	r0, r0, #17, #1
	beq	.L337
	str	r4, [sp]
	movw	r1, #1503
	ldr	r3, .L341+4
	mov	r0, #0
	ldr	r2, .L341+8
	bl	dprint_normal
	mov	r0, #0
.L337:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L335:
	and	r0, r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L342:
	.align	2
.L341:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0+468
	.word	.LC30
	UNWIND(.fnend)
	.size	VDMHAL_IsVdhDecOver, .-VDMHAL_IsVdhDecOver
	.align	2
	.global	VDMHAL_IsVdhPartDecOver
	.type	VDMHAL_IsVdhPartDecOver, %function
VDMHAL_IsVdhPartDecOver:
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
	ldr	r3, .L352
	mov	r4, r0
	ldr	r3, [r3, #96]
	cmp	r3, #0
	moveq	r0, r3
	beq	.L344
	blx	r3
.L344:
	cmp	r4, #1
	ubfxeq	r0, r0, #19, #1
	beq	.L348
	cmp	r4, #2
	ubfxeq	r0, r0, #2, #1
	bne	.L351
.L348:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L351:
	str	r4, [sp]
	movw	r1, #1523
	ldr	r3, .L352+4
	mov	r0, #0
	ldr	r2, .L352+8
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L353:
	.align	2
.L352:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0+488
	.word	.LC30
	UNWIND(.fnend)
	.size	VDMHAL_IsVdhPartDecOver, .-VDMHAL_IsVdhPartDecOver
	.align	2
	.global	VDMHAL_GetRepairRequire
	.type	VDMHAL_GetRepairRequire, %function
VDMHAL_GetRepairRequire:
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
	movne	r3, #0
	strne	r3, [r0]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_GetRepairRequire, .-VDMHAL_GetRepairRequire
	.align	2
	.global	VDMHAL_UpdateHardwareInfo
	.type	VDMHAL_UpdateHardwareInfo, %function
VDMHAL_UpdateHardwareInfo:
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
	cmp	r0, #0
	bgt	.L367
	mov	r3, #1000
	ldr	lr, .L369
	mul	r3, r3, r0
	mov	r2, #184
	mul	r2, r2, r0
	mov	r1, r0, asl #6
	ldr	ip, .L369+4
	sub	r1, r1, r0, asl #4
	ldr	r5, .L369+8
	ldr	lr, [lr, r3]
	add	r1, r1, ip
	add	r4, r5, r2
	ldr	r1, [r1, #4]
	ldr	r3, [lr, #12]
	cmp	r1, #1
	str	r3, [r5, r2]
	ldr	r3, [lr, #28]
	str	r3, [r4, #4]
	beq	.L368
	add	r1, lr, #4096
	add	r3, r2, #48
	add	ip, r2, #176
	add	r3, r3, r5
	mov	r2, r1
	ldr	r1, [r1]
	ldr	r6, [r2, #12]
	add	ip, ip, r5
	ldr	r2, [lr, #208]
	str	r1, [r4, #16]
	ldr	r1, [lr, #212]
	str	r6, [r4, #20]
	str	r2, [r4, #8]
	add	r2, lr, #33024
	str	r1, [r4, #12]
	ldr	r1, [lr, #176]
	str	r1, [r4, #24]
	ldr	r7, [lr, #180]
	ldr	r1, [lr, #184]
	ldr	r6, [lr, #188]
	str	r7, [r4, #28]
	str	r1, [r4, #32]
	ldr	r1, [lr, #192]
	str	r6, [r4, #36]
	str	r1, [r4, #40]
.L363:
	ldr	r1, [r2], #4
	str	r1, [r3, #4]!
	cmp	r3, ip
	bne	.L363
	mov	r2, #184
	add	r3, lr, #32768
	mla	r2, r2, r0, r5
	ldr	r1, [r3, #384]
	ldr	r3, [r3, #388]
	mov	r0, #0
	str	r1, [r2, #48]
	str	r3, [r2, #44]
.L366:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L368:
	add	r3, lr, #4096
	mov	r0, #0
	ldr	r3, [r3, #12]
	str	r3, [r4, #20]
	uxth	r3, r3
	ldr	r1, [lr, #176]
	str	r3, [r4, #20]
	str	r1, [r4, #24]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L367:
	mov	r3, #0
	movw	r1, #1543
	stmia	sp, {r0, r3}
	mov	r0, r3
	ldr	r2, .L369+12
	ldr	r3, .L369+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L366
.L370:
	.align	2
.L369:
	.word	g_HwMem
	.word	g_VdmDrvParam+40
	.word	g_BackUp
	.word	.LC19
	.word	.LANCHOR0+512
	UNWIND(.fnend)
	.size	VDMHAL_UpdateHardwareInfo, .-VDMHAL_UpdateHardwareInfo
	.align	2
	.global	VDMHAL_ReadMsgSlot
	.type	VDMHAL_ReadMsgSlot, %function
VDMHAL_ReadMsgSlot:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r3, r0
	moveq	r4, #1
	movne	r4, #0
	beq	.L375
	cmp	r2, #800
	bhi	.L376
	ldr	r3, .L377
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
.L373:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L376:
	mov	r3, r2
	mov	r1, #800
	mov	r0, r4
	str	r1, [sp]
	ldr	r2, .L377+4
	movw	r1, #1595
	bl	dprint_normal
	mvn	r0, #0
	b	.L373
.L375:
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L377+8
	movw	r1, #1589
	bl	dprint_normal
	mvn	r0, #0
	b	.L373
.L378:
	.align	2
.L377:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC36
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_ReadMsgSlot, .-VDMHAL_ReadMsgSlot
	.align	2
	.global	VDMHAL_CfgDecRpMsg
	.type	VDMHAL_CfgDecRpMsg, %function
VDMHAL_CfgDecRpMsg:
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
	mov	r5, r0
	ldr	r0, [r1, #32]
	mov	r4, r2
	mov	r7, #0
	str	r7, [fp, #-48]
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L422
	ldr	r3, [r5, #32]
	sub	r3, r3, #1
	cmp	r3, #199
	bhi	.L423
	mov	r1, r4, asl #6
	ldr	r3, .L426
	sub	r2, r1, r4, asl #4
	ldr	r1, .L426+4
	add	r2, r3, r2
	ldrb	r4, [r5, #1]	@ zero_extendqisi2
	ldr	r9, [r5, #20]
	ldr	r3, [r2, #8]
	cmp	r4, #0
	ldr	r2, [r5, #4]
	ldr	r10, [r5, #12]
	ldr	r3, [r1, r3, asl #2]
	sub	r2, r2, #16
	ldr	r1, [r5, #16]
	add	r3, r3, #204800
	ldr	r7, [r3, #3244]
	moveq	r3, #8
	andne	r3, r4, #15
	moveq	r4, r3
	strne	r3, [fp, #-56]
	streq	r3, [fp, #-56]
	cmp	r2, #3
	ldr	r3, [r5, #48]
	movcc	r0, #64
	movcs	r0, #32
	mov	r9, r9, asl r3
	mov	r3, r1, asl r3
	sub	r2, r9, #1
	add	lr, r3, #63
	add	r2, r2, r0
	mvncc	r0, #63
	mvncs	r0, #31
	cmp	r7, #1
	addeq	r3, r3, #2032
	addeq	r1, r9, #63
	addeq	r3, r3, #15
	biceq	r1, r1, #63
	biceq	r3, r3, #2032
	and	r2, r2, r0
	biceq	r3, r3, #15
	moveq	r1, r1, lsr #1
	bic	lr, lr, #63
	movne	r1, #0
	moveq	r3, r3, lsr #7
	mul	ip, lr, r2
	mov	r8, lr, asl #4
	muleq	r1, r3, r1
	cmp	r4, #8
	ldr	r4, .L426+8
	movhi	r0, lr, lsr #2
	movls	r9, #0
	strls	r9, [fp, #-60]
	add	ip, r1, ip
	movhi	r9, r0, asl #5
	mulhi	r0, r0, r2
	addhi	r3, ip, ip, lsl #1
	ldr	r2, [r4, #848]
	movls	r0, r9
	movhi	r3, r3, lsr #1
	strhi	r3, [fp, #-60]
	ldr	r3, [r4, #852]
	rsb	lr, r2, r6
	ubfxhi	r9, r9, #0, #20
	cmp	lr, r3
	strcc	r10, [r6]
	ldrcc	r2, [r4, #848]
	movcs	lr, #1
	ldrcc	r3, [r4, #852]
	strcs	lr, [r4, #844]
	add	lr, r6, #1
	rsb	lr, r2, lr
	ldr	r10, [r5, #12]
	cmp	lr, r3
	add	lr, ip, r10
	strcc	lr, [r6, #4]
	ldrcc	r2, [r4, #848]
	movcs	lr, #1
	ldrcc	r3, [r4, #852]
	strcs	lr, [r4, #844]
	add	lr, r6, #2
	rsb	lr, r2, lr
	ldr	r10, [r5, #8]
	cmp	lr, r3
	strcc	r10, [r6, #8]
	movcs	lr, #1
	ldrcc	r2, [r4, #848]
	ldrcc	r3, [r4, #852]
	strcs	lr, [r4, #844]
	add	lr, r6, #3
	rsb	lr, r2, lr
	ldr	r10, [r5, #8]
	cmp	lr, r3
	add	ip, ip, r10
	strcc	ip, [r6, #12]
	movcs	ip, #1
	strcs	ip, [r4, #844]
	ldrcc	r2, [r4, #848]
	add	ip, r6, #4
	ldrcc	r3, [r4, #852]
	rsb	ip, r2, ip
	cmp	ip, r3
	strcc	r8, [r6, #16]
	mov	r8, r8, lsr #1
	ldrcc	r2, [r4, #848]
	movcs	ip, #1
	ldrcc	r3, [r4, #852]
	strcs	ip, [r4, #844]
	add	ip, r6, #5
	rsb	ip, r2, ip
	cmp	ip, r3
	strcc	r1, [r6, #20]
	ldrcc	r2, [r4, #848]
	movcs	r1, #1
	ldrcc	r3, [r4, #852]
	strcs	r1, [r4, #844]
	add	r1, r6, #6
	ldr	lr, [r5, #20]
	rsb	r1, r2, r1
	ldr	ip, [r5, #16]
	cmp	r1, r3
	sub	r1, lr, #1
	mov	lr, #0	@ movhi
	sub	ip, ip, #1
	bfi	lr, ip, #0, #9
	mov	ip, #0	@ movhi
	strh	lr, [fp, #-52]	@ movhi
	bfi	ip, r1, #0, #9
	strh	ip, [fp, #-50]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-52]
	mov	ip, #0
	strcs	r1, [r4, #844]
	add	r1, r6, #8
	bfi	ip, r9, #0, #20
	str	r0, [fp, #-52]
	strcc	r3, [r6, #24]
	ldrcc	r2, [r4, #848]
	ldrcc	r3, [r4, #852]
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	ip, [r6, #32]
	ldrcc	r2, [r4, #848]
	movcs	r1, #1
	ldrcc	r3, [r4, #852]
	strcs	r1, [r4, #844]
	add	r1, r6, #9
	rsb	r1, r2, r1
	cmp	r1, r3
	ldrcc	r3, [fp, #-60]
	movcs	r1, #1
	strcs	r1, [r4, #844]
	add	r1, r6, #10
	strcc	r3, [r6, #36]
	ldrcc	r2, [r4, #848]
	ldrcc	r3, [r4, #852]
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	r0, [r6, #40]
	ldrcc	r2, [r4, #848]
	movcs	r1, #1
	strcs	r1, [r4, #844]
	add	r1, r6, #11
	ldrcc	r3, [r4, #852]
	rsb	r2, r2, r1
	ldr	r0, [fp, #-52]
	cmp	r2, r3
	bfi	r0, r8, #0, #18
	str	r0, [fp, #-52]
	movcs	r3, #1
	strcc	r0, [r6, #44]
	strcs	r3, [r4, #844]
	ldr	r3, [r5, #40]
	ldr	r8, [r5, #20]
	sub	r3, r3, #1
	ldr	r9, [r5, #16]
	cmp	r3, #1
	ldr	r3, [r5, #44]
	addls	r8, r8, r8, lsr #31
	movls	r8, r8, asr #1
	cmp	r3, #0
	beq	.L424
	cmp	r3, #1
	beq	.L412
.L425:
	ldr	r1, [fp, #-48]
	ldr	lr, [r4, #848]
	sub	r1, r1, #1
	ldr	r0, [r4, #852]
	uxth	r1, r1
.L413:
	ldr	r3, [r5, #48]
	add	r2, r6, #7
	ldr	ip, [r5, #40]
	rsb	r2, lr, r2
	ldr	lr, [fp, #-56]
	and	r3, r3, #3
	cmp	r2, r0
	and	ip, ip, #3
	bfi	r3, lr, #2, #4
	and	r7, r7, #1
	ldrb	lr, [r5]	@ zero_extendqisi2
	bfi	r7, ip, #4, #2
	strh	r1, [fp, #-52]	@ movhi
	bfi	r7, ip, #6, #2
	bfi	r3, lr, #6, #1
	strb	r7, [fp, #-50]
	strb	r3, [fp, #-49]
	mov	r0, #0
	ldrcc	r3, [fp, #-52]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	strcc	r3, [r6, #28]
.L381:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L424:
	sub	r2, fp, #48
	mov	r3, r8
	str	r2, [sp]
	mov	r1, r6
	mov	r2, r9
	mov	r0, r5
	bl	VDMHAL_CfgNotFullRepair
	ldr	r3, [r5, #44]
	cmp	r3, #1
	bne	.L425
.L412:
	str	r3, [r5, #32]
	add	r2, r6, #12
	ldr	lr, [r4, #848]
	mov	r1, #0
	ldr	r0, [r4, #852]
	mov	ip, #0	@ movhi
	rsb	r2, lr, r2
	bfi	ip, r1, #0, #9
	cmp	r2, r0
	strh	ip, [fp, #-52]	@ movhi
	mov	r2, #0	@ movhi
	bfi	r2, r1, #0, #9
	ldr	r1, .L426+8
	sub	r9, r9, #1
	strh	r2, [fp, #-50]	@ movhi
	sub	r8, r8, #1
	ldrcc	r3, [fp, #-52]
	mov	r2, #0	@ movhi
	strcs	r3, [r1, #844]
	bfi	r2, r9, #0, #9
	strh	r2, [fp, #-52]	@ movhi
	strcc	r3, [r6, #48]
	add	r3, r6, #13
	ldrcc	lr, [r1, #848]
	ldrcc	r0, [r1, #852]
	mov	r1, #0
	rsb	r3, lr, r3
	cmp	r3, r0
	mov	r3, #0	@ movhi
	bfi	r3, r8, #0, #9
	strh	r3, [fp, #-50]	@ movhi
	ldrcc	r3, [fp, #-52]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	strcc	r3, [r6, #52]
	ldrcc	lr, [r4, #848]
	ldrcc	r0, [r4, #852]
	b	.L413
.L423:
	ldr	ip, .L426+12
	mov	r0, r7
	ldr	r3, .L426+16
	movw	r1, #1747
	ldr	r2, .L426+20
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L381
.L422:
	ldr	ip, .L426+24
	movw	r1, #1745
	ldr	r3, .L426+16
	ldr	r2, .L426+20
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L381
.L427:
	.align	2
.L426:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC38
	.word	.LANCHOR0+540
	.word	.LC3
	.word	.LC37
	UNWIND(.fnend)
	.size	VDMHAL_CfgDecRpMsg, .-VDMHAL_CfgDecRpMsg
	.align	2
	.global	VDMHAL_CfgDispRpMsg
	.type	VDMHAL_CfgDispRpMsg, %function
VDMHAL_CfgDispRpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	ldr	r3, .L495
	mov	ip, r2, asl #6
	mov	r5, r0
	sub	r2, ip, r2, asl #4
	ldr	r0, [r1, #32]
	add	r3, r3, r2
	mov	r8, #0
	str	r8, [fp, #-48]
	ldr	r6, [r3, #8]
	bl	MEM_Phy2Vir
	subs	r4, r0, #0
	beq	.L481
	ldr	r3, [r5, #32]
	sub	r3, r3, #1
	cmp	r3, #199
	bhi	.L482
	ldrb	r7, [r5, #2]	@ zero_extendqisi2
	mov	r1, #2
	ldr	r2, [r5, #12]
	mov	r0, r6
	cmp	r7, #0
	beq	.L483
	bl	FSP_GetLogicFs_By_DispAddr
	subs	r3, r0, #0
	beq	.L484
	mov	r0, r6
	ldr	r2, [r5, #8]
	mov	r1, #1
	str	r3, [fp, #-56]
	bl	FSP_GetLogicFs_By_DispAddr
	ldr	r3, [fp, #-56]
	subs	r10, r0, #0
	beq	.L485
	ldr	r1, [r3, #108]
	add	r7, r3, #40
	ldr	r2, [r10, #108]
	ldr	r6, [r3, #492]
	subs	r2, r1, r2
	ldr	r9, [r5, #8]
	movne	r2, #1
	cmp	r1, #0
	ldr	r1, [r3, #484]
	movne	r2, #0
	cmp	r2, #0
	ldr	r2, [r5, #12]
	rsb	r6, r1, r6
	str	r2, [fp, #-56]
	ldr	r2, [r3, #464]
	str	r2, [fp, #-64]
	ldr	r2, [r3, #476]
	ldr	r3, [r3, #472]
	str	r2, [fp, #-68]
	str	r3, [fp, #-60]
	bne	.L486
.L435:
	ldr	r8, .L495+4
	ldr	r0, [fp, #-56]
	ldr	r2, [r8, #848]
	add	r0, r6, r0
	ldr	r3, [r8, #852]
	add	r6, r6, r9
	rsb	r1, r2, r4
	cmp	r1, r3
	ldrcc	r3, [fp, #-56]
	movcs	r1, #1
	strcs	r1, [r8, #844]
	add	r1, r4, #1
	strcc	r3, [r4]
	ldrcc	r2, [r8, #848]
	ldrcc	r3, [r8, #852]
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	r0, [r4, #4]
	ldrcc	r2, [r8, #848]
	movcs	r1, #1
	ldrcc	r3, [r8, #852]
	strcs	r1, [r8, #844]
	add	r1, r4, #2
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	r9, [r4, #8]
	ldrcc	r2, [r8, #848]
	movcs	r1, #1
	ldrcc	r3, [r8, #852]
	strcs	r1, [r8, #844]
	add	r1, r4, #3
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	r6, [r4, #12]
	ldrcc	r2, [r8, #848]
	movcs	r1, #1
	ldrcc	r3, [r8, #852]
	strcs	r1, [r8, #844]
	add	r1, r4, #4
	rsb	r1, r2, r1
	cmp	r1, r3
	ldrcc	r3, [fp, #-64]
	movcs	r1, #1
	strcs	r1, [r8, #844]
	add	r1, r4, #5
	strcc	r3, [r4, #16]
	ldrcc	r2, [r8, #848]
	ldrcc	r3, [r8, #852]
	rsb	r1, r2, r1
	cmp	r1, r3
	ldrcc	r3, [fp, #-68]
	movcs	r1, #1
	strcs	r1, [r8, #844]
	add	r1, r4, #6
	strcc	r3, [r4, #20]
	ldrcc	r2, [r8, #848]
	ldrcc	r3, [r8, #852]
	rsb	r1, r2, r1
	ldr	r0, [r5, #20]
	ldr	ip, [r5, #16]
	cmp	r1, r3
	sub	r1, r0, #1
	mov	r0, #0	@ movhi
	sub	ip, ip, #1
	bfi	r0, ip, #0, #9
	strh	r0, [fp, #-52]	@ movhi
	mov	r0, #0	@ movhi
	bfi	r0, r1, #0, #9
	strh	r0, [fp, #-50]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-52]
	mov	r0, #0
	strcs	r1, [r8, #844]
	add	r1, r4, #8
	strcc	r3, [r4, #24]
	ldrcc	r2, [r8, #848]
	ldrcc	r3, [r8, #852]
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	r0, [r4, #32]
	mov	r0, #0
	str	r0, [fp, #-52]
	ldrcc	r2, [r8, #848]
	movcs	r1, #1
	ldrcc	r3, [r8, #852]
	strcs	r1, [r8, #844]
	add	r1, r4, #9
	rsb	r1, r2, r1
	cmp	r1, r3
	strcc	r0, [r4, #36]
	ldrcc	r2, [r8, #848]
	movcs	r1, #1
	ldrcc	r3, [r8, #852]
	strcs	r1, [r8, #844]
	add	r1, r4, #10
	rsb	r1, r2, r1
	cmp	r1, r3
	movcc	r3, #0
	strcc	r3, [r4, #40]
	ldrcc	r2, [r8, #848]
	movcs	r1, #1
	strcs	r1, [r8, #844]
	add	r1, r4, #11
	ldrh	r0, [fp, #-50]
	rsb	r2, r2, r1
	ldr	r1, [fp, #-60]
	ldrcc	r3, [r8, #852]
	bfi	r0, r1, #2, #14
	strh	r0, [fp, #-50]	@ movhi
	cmp	r2, r3
	ldr	r1, [fp, #-52]
	movcs	r3, #1
	bfc	r1, #0, #18
	str	r1, [fp, #-52]
	strcs	r3, [r8, #844]
	strcc	r1, [r4, #44]
	ldr	r3, [r5, #40]
	ldr	r6, [r5, #20]
	sub	r3, r3, #1
	ldr	r9, [r5, #16]
	cmp	r3, #1
	ldr	r3, [r5, #44]
	addls	r6, r6, r6, lsr #31
	movls	r6, r6, asr #1
	cmp	r3, #0
	beq	.L487
	cmp	r3, #1
	beq	.L468
.L491:
	ldr	r3, [fp, #-48]
	ldr	lr, [r7, #76]
	sub	r3, r3, #1
	ldr	r0, [r8, #848]
	cmp	lr, #8
	ldr	r1, [r8, #852]
	uxth	r3, r3
	movne	r2, #0
	beq	.L488
.L473:
	ldr	r7, [r7, #68]
	sub	r6, lr, #16
	ldr	r9, [r5, #48]
	clz	r6, r6
	and	r7, r7, #1
	strh	r3, [fp, #-52]	@ movhi
	ldr	ip, [r5, #40]
	sub	r5, r9, #4
	mov	r3, r7
	bfi	r3, r7, #1, #1
	bfi	r3, r2, #2, #1
	mov	r2, #0
	bfi	r2, lr, #2, #4
	add	lr, r4, #7
	rsb	r0, r0, lr
	mov	r6, r6, lsr #5
	bfi	r2, r5, #0, #2
	cmp	r0, r1
	and	ip, ip, #3
	bfi	r3, r6, #3, #1
	bfi	r3, ip, #4, #2
	uxtb	r2, r2
	bfi	r3, ip, #6, #2
	orr	r2, r2, #64
	strb	r3, [fp, #-50]
	mov	r0, #0
	strb	r2, [fp, #-49]
	movcs	r3, #1
	ldrcc	r3, [fp, #-52]
	strcs	r3, [r8, #844]
	strcc	r3, [r4, #28]
.L430:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L483:
	bl	FSP_GetPairDispFs_By_DecAddr
	subs	r8, r0, #0
	beq	.L489
	mov	r1, r7
	mov	r0, r6
	ldr	r2, [r5, #8]
	bl	FSP_GetLogicFs_By_DecAddr
	subs	r3, r0, #0
	beq	.L490
	ldr	r2, [r8, #4]
	add	r7, r3, #40
	ldr	r9, [r3, #484]
	ldr	r6, [r3, #492]
	str	r2, [fp, #-56]
	ldr	r2, [r3, #464]
	rsb	r6, r9, r6
	str	r2, [fp, #-64]
	ldr	r2, [r3, #476]
	ldr	r3, [r3, #472]
	str	r2, [fp, #-68]
	str	r3, [fp, #-60]
	b	.L435
.L487:
	sub	r2, fp, #48
	mov	r3, r6
	str	r2, [sp]
	mov	r1, r4
	mov	r2, r9
	mov	r0, r5
	bl	VDMHAL_CfgNotFullRepair
	ldr	r3, [r5, #44]
	cmp	r3, #1
	bne	.L491
.L468:
	str	r3, [r5, #32]
	add	r2, r4, #12
	ldr	r0, [r8, #848]
	mov	ip, #0
	ldr	r1, [r8, #852]
	mov	lr, #0	@ movhi
	rsb	r2, r0, r2
	bfi	lr, ip, #0, #9
	cmp	r2, r1
	strh	lr, [fp, #-52]	@ movhi
	str	r3, [fp, #-48]
	mov	r2, #0	@ movhi
	bfi	r2, ip, #0, #9
	ldr	ip, .L495+4
	strh	r2, [fp, #-50]	@ movhi
	sub	r9, r9, #1
	ldrcc	r3, [fp, #-52]
	sub	r6, r6, #1
	strcs	r3, [ip, #844]
	mov	r2, #0	@ movhi
	bfi	r2, r6, #0, #9
	strh	r2, [fp, #-50]	@ movhi
	strcc	r3, [r4, #48]
	add	r3, r4, #13
	ldrcc	r0, [ip, #848]
	ldrcc	r1, [ip, #852]
	rsb	r3, r0, r3
	cmp	r3, r1
	mov	r3, #0	@ movhi
	bfi	r3, r9, #0, #9
	strh	r3, [fp, #-52]	@ movhi
	ldrcc	r2, [fp, #-52]
	movcs	r2, #1
	strcs	r2, [r8, #844]
	mov	r3, #0
	strcc	r2, [r4, #52]
	ldr	lr, [r7, #76]
	ldrcc	r0, [r8, #848]
	ldrcc	r1, [r8, #852]
	cmp	lr, #8
	movne	r2, #0
	bne	.L473
.L488:
	ldr	r2, [r7, #392]
	cmp	r2, #8
	movhi	r2, #1
	bhi	.L473
	ldr	r2, [r7, #396]
	cmp	r2, #8
	movls	r2, #0
	movhi	r2, #1
	b	.L473
.L486:
	ldr	r3, [r10, #188]
	ldr	r2, [r10, #116]
	sub	r3, r3, #16
	cmp	r3, #3
	mvncc	r3, #63
	mvncs	r3, #31
	str	r3, [fp, #-76]
	movcc	r3, #64
	movcs	r3, #32
	cmp	r2, #8
	str	r3, [fp, #-72]
	beq	.L492
	cmp	r2, #10
	beq	.L493
	cmp	r2, #16
	beq	.L494
	str	r2, [sp]
	movw	r1, #879
	ldr	r3, .L495+8
	mov	r0, #1
	ldr	r2, .L495+12
	bl	dprint_normal
.L440:
	ldr	r3, [r10, #76]
	mov	r2, #0
	ldr	r1, [fp, #-72]
	ldr	r0, [fp, #-76]
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r1, [r10, #484]
	and	r3, r3, r0
	str	r8, [r10, #464]
	str	r8, [r10, #468]
	mla	r8, r3, r8, r1
	ldrb	r3, [r10, #198]	@ zero_extendqisi2
	str	r2, [r10, #108]
	orr	r3, r3, #2
	strb	r2, [r10, #460]
	str	r2, [r10, #472]
	str	r2, [r10, #476]
	strb	r3, [r10, #198]
	str	r8, [r10, #492]
	b	.L435
.L494:
	ldr	r8, [r10, #72]
	add	r8, r8, #63
	bic	r8, r8, #63
	mov	r8, r8, asl #1
	b	.L440
.L492:
	ldr	r8, [r10, #72]
	add	r8, r8, #63
	bic	r8, r8, #63
	b	.L440
.L482:
	ldr	ip, .L495+16
	mov	r0, r8
	ldr	r3, .L495+20
	movw	r1, #1879
	ldr	r2, .L495+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L430
.L493:
	ldr	r8, [r10, #72]
	add	r8, r8, #63
	bic	r8, r8, #63
	add	r8, r8, r8, lsl #2
	mov	r8, r8, lsr #2
	b	.L440
.L489:
	ldr	ip, [r5, #12]
	movw	r1, #1891
	ldr	r3, .L495+20
	ldr	r2, .L495+28
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L430
.L484:
	ldr	ip, [r5, #12]
	movw	r1, #1921
	ldr	r3, .L495+20
	ldr	r2, .L495+32
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L430
.L481:
	ldr	ip, .L495+36
	movw	r1, #1877
	ldr	r3, .L495+20
	ldr	r2, .L495+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L430
.L490:
	ldr	ip, [r5, #8]
	movw	r1, #1899
	ldr	r3, .L495+20
	ldr	r2, .L495+40
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L430
.L485:
	ldr	ip, [r5, #8]
	movw	r1, #1929
	ldr	r3, .L495+20
	ldr	r2, .L495+44
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L430
.L496:
	.align	2
.L495:
	.word	g_VdmDrvParam
	.word	g_HwMem
	.word	.LANCHOR0+580
	.word	.LC11
	.word	.LC38
	.word	.LANCHOR0+560
	.word	.LC3
	.word	.LC39
	.word	.LC41
	.word	.LC37
	.word	.LC40
	.word	.LC42
	UNWIND(.fnend)
	.size	VDMHAL_CfgDispRpMsg, .-VDMHAL_CfgDispRpMsg
	.align	2
	.global	VDMHAL_CfgRpReg
	.type	VDMHAL_CfgRpReg, %function
VDMHAL_CfgRpReg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r2, [r0, #32]
	subs	r4, r1, #0
	str	r2, [fp, #-24]
	ble	.L500
	mov	r5, #1
	str	r4, [sp]
	ldr	r3, .L501
	movw	r1, #2390
	str	r5, [sp, #4]
	mov	r0, #32
	ldr	r2, .L501+4
	bl	dprint_normal
	stmia	sp, {r4, r5}
	movw	r1, #2390
	ldr	r3, .L501
	ldr	r2, .L501+4
	mov	r0, #32
	bl	dprint_normal
	stmia	sp, {r4, r5}
	movw	r1, #2390
	ldr	r3, .L501
	ldr	r2, .L501+4
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L500:
	mov	r3, #1000
	ldr	r1, .L501+8
	mul	r4, r3, r4
	mov	r0, #7
	movw	r3, #49667
	movt	r3, 8192
	ldr	ip, [r1, r4]
	str	r2, [ip, #16]
	ldr	r2, [r1, r4]
	str	r0, [r2, #36]
	ldr	r2, [r1, r4]
	str	r3, [r2, #12]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L502:
	.align	2
.L501:
	.word	.LANCHOR0+608
	.word	.LC23
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_CfgRpReg, .-VDMHAL_CfgRpReg
	.align	2
	.global	VDMHAL_GetUvMOSParam
	.type	VDMHAL_GetUvMOSParam, %function
VDMHAL_GetUvMOSParam:
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
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_GetUvMOSParam, .-VDMHAL_GetUvMOSParam
	.align	2
	.global	VDMHAL_MakeDecReport
	.type	VDMHAL_MakeDecReport, %function
VDMHAL_MakeDecReport:
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
	subs	r3, r0, #0
	ldreq	ip, .L530
	movweq	r1, #2081
	beq	.L523
	ldr	r5, [r3, #4]
	ldr	r7, [r3]
	cmp	r5, #0
	ldr	r6, [r3, #8]
	beq	.L525
	ldr	r3, .L530+4
	mov	r2, #820
	ldr	r4, .L530+8
	mov	r1, #0
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	mov	r3, #184
	mla	r3, r3, r6, r4
	mov	r2, #1024
	str	r2, [r5, #4]
	ldr	r3, [r3, #4]
	mov	r3, r3, lsr #17
	and	r2, r3, #3
	cmp	r2, #1
	moveq	r3, #0
	beq	.L508
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r7, #3
	orrne	r3, r3, #1
.L508:
	mov	r2, #184
	str	r3, [r5]
	mla	r2, r2, r6, r4
	cmp	r7, #0
	cmpne	r7, #15
	ldr	r3, [r2, #4]
	ubfx	r3, r3, #0, #17
	str	r3, [r5, #12]
	beq	.L526
.L509:
	cmp	r3, #200
	bhi	.L527
.L510:
	ldr	r2, .L530+12
	mov	r3, #1000
	mla	r3, r3, r6, r2
	ldr	r7, [r3, #16]
	mov	r0, r7
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L528
	mov	r3, #184
	ldr	r8, .L530+16
	mla	r3, r3, r6, r4
	mov	r0, #3200
	mla	r4, r0, r6, r8
	str	r7, [r3, #180]
	ldr	r2, [r5, #12]
	mov	r0, r4
	mov	r2, r2, asl #2
	bl	VDMHAL_ReadMsgSlot
	ldr	ip, [r5, #12]
	cmp	ip, #0
	movne	r0, r4
	movne	r3, r5
	movne	r2, #0
	beq	.L515
.L514:
	ldr	r1, [r0, #4]
	add	r2, r2, #1
	cmp	r2, ip
	add	r0, r0, #16
	add	r3, r3, #4
	strh	r1, [r3, #12]	@ movhi
	ldr	r1, [r0, #-8]
	strh	r1, [r3, #14]	@ movhi
	bne	.L514
.L515:
	mov	r0, #7
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L529
.L506:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L526:
	ldr	r1, .L530+20
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L509
	ldrb	r2, [r2, #19]	@ zero_extendqisi2
	and	r2, r2, #3
	cmp	r2, #2
	bne	.L509
	mov	r3, #1
	strh	r1, [r5, #16]	@ movhi
	mov	r0, r1
	strh	r1, [r5, #18]	@ movhi
	str	r3, [r5, #12]
	b	.L506
.L529:
	ldr	r3, [r5, #12]
	movw	r1, #2143
	ldr	r2, .L530+24
	mov	r0, #7
	bl	dprint_normal
	mov	r3, r7
	ldr	r2, .L530+28
	mov	r1, #2144
	mov	r0, #7
	mov	r4, #0
	bl	dprint_normal
	mov	r3, #3200
	mla	r6, r3, r6, r8
.L516:
	ldr	r7, [r6, #12]
	ldr	lr, [r6, #8]
	mov	r3, r4
	ldr	ip, [r6, #4]
	movw	r1, #2149
	ldr	r2, [r6], #16
	mov	r0, #7
	str	r7, [sp, #12]
	add	r4, r4, #4
	stmia	sp, {r2, ip, lr}
	ldr	r2, .L530+32
	bl	dprint_normal
	ldr	r3, [r5, #12]
	mov	r3, r3, asl #2
	sub	r3, r3, #3
	cmp	r3, r4
	bhi	.L516
	ldr	r2, .L530+36
	movw	r1, #2152
	mov	r0, #7
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L527:
	mov	r0, #200
	ldr	r2, .L530+40
	str	r0, [sp]
	movw	r1, #2119
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r5, #12]
	b	.L510
.L528:
	ldr	ip, .L530+44
	movw	r1, #2126
.L523:
	ldr	r3, .L530+48
	ldr	r2, .L530+52
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L506
.L525:
	ldr	ip, .L530+56
	mov	r0, r5
	ldr	r3, .L530+48
	movw	r1, #2088
	ldr	r2, .L530+52
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L506
.L531:
	.align	2
.L530:
	.word	.LC43
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_BackUp
	.word	g_HwMem
	.word	g_UpMsg
	.word	g_H264FullPictureRepairDisable
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC45
	.word	.LC46
	.word	.LANCHOR0+624
	.word	.LC3
	.word	.LC44
	UNWIND(.fnend)
	.size	VDMHAL_MakeDecReport, .-VDMHAL_MakeDecReport
	.align	2
	.global	VDMHAL_PrepareRepair
	.type	VDMHAL_PrepareRepair, %function
VDMHAL_PrepareRepair:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
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
	ldr	r0, .L544
	ldr	r5, .L544+4
	cmp	r3, #0
	mov	r4, r3
	mov	r1, #3312
	mov	r3, #1000
	mov	r7, r2
	mla	r0, r1, r4, r0
	mla	r5, r3, r4, r5
	bgt	.L542
	cmp	r2, #3
	bne	.L539
	mov	r2, r4
	mov	r1, r5
	bl	VDMHAL_CfgDecRpMsg
	subs	r6, r0, #0
	bne	.L543
	mov	r0, r5
	mov	r1, r4
	ldr	r2, [fp, #4]
	bl	VDMHAL_CfgRpReg
	mov	r0, r6
.L534:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L542:
	mov	r0, #0
	str	r4, [sp]
	str	r0, [sp, #4]
	movw	r1, #2167
	ldr	r3, .L544+8
	ldr	r2, .L544+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L534
.L539:
	str	r2, [sp]
	movw	r1, #2178
	ldr	r3, .L544+8
	mov	r0, #0
	ldr	r2, .L544+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L534
.L543:
	str	r7, [sp]
	movw	r1, #2184
	ldr	r3, .L544+8
	mov	r0, #0
	ldr	r2, .L544+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L534
.L545:
	.align	2
.L544:
	.word	g_RepairParam
	.word	g_HwMem
	.word	.LANCHOR0+648
	.word	.LC19
	.word	.LC51
	.word	.LC52
	UNWIND(.fnend)
	.size	VDMHAL_PrepareRepair, .-VDMHAL_PrepareRepair
	.align	2
	.global	VDMHAL_StartHwRepair
	.type	VDMHAL_StartHwRepair, %function
VDMHAL_StartHwRepair:
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
	subs	r4, r0, #0
	ble	.L549
	mov	r5, #1
	str	r4, [sp]
	ldr	r3, .L550
	movw	r1, #2390
	str	r5, [sp, #4]
	mov	r0, #32
	ldr	r2, .L550+4
	bl	dprint_normal
	movw	r1, #2390
	ldr	r2, .L550+4
	mov	r0, #32
	stmia	sp, {r4, r5}
	ldr	r3, .L550
	bl	dprint_normal
	ldr	r3, .L550+8
	ldr	r3, [r3, #112]
	blx	r3
	stmia	sp, {r4, r5}
	movw	r1, #2237
	ldr	r3, .L550+12
	ldr	r2, .L550+4
	mov	r0, #32
	bl	dprint_normal
	stmia	sp, {r4, r5}
	movw	r1, #2238
	ldr	r3, .L550+12
	ldr	r2, .L550+4
	mov	r0, #32
	bl	dprint_normal
	stmia	sp, {r4, r5}
	movw	r1, #2239
	ldr	r3, .L550+12
	ldr	r2, .L550+4
	mov	r0, #32
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L549:
	mov	r3, #1000
	ldr	r5, .L550+16
	mul	r4, r3, r4
	mov	r0, #67108864
	ldr	r3, .L550+8
	mvn	r1, #1
	ldr	r2, [r5, r4]
	str	r0, [r2, #8]
	ldr	r2, [r5, r4]
	str	r1, [r2, #36]
	ldr	r3, [r3, #112]
	blx	r3
	ldr	r2, [r5, r4]
	mov	r3, #0
	mov	r1, #1
	str	r3, [r2]
	ldr	r2, [r5, r4]
	str	r1, [r2]
	ldr	r2, [r5, r4]
	str	r3, [r2]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L551:
	.align	2
.L550:
	.word	.LANCHOR0+608
	.word	.LC23
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+672
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_StartHwRepair, .-VDMHAL_StartHwRepair
	.align	2
	.global	VDMHAL_StartHwDecode
	.type	VDMHAL_StartHwDecode, %function
VDMHAL_StartHwDecode:
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
	subs	r4, r0, #0
	bgt	.L560
	ldr	r0, .L561
	mov	r2, r4, asl #6
	ldr	r3, .L561+4
	sub	r2, r2, r4, asl #4
	ldr	ip, .L561+8
	ldr	lr, [r0]
	ldr	r0, [r3]
	add	r2, ip, r2
	ldr	r6, .L561+12
	ldr	ip, [lr, #120]
	cmp	r0, #4
	ldr	r5, [r2, #8]
	mov	r2, r4
	ubfx	r3, ip, #8, #2
	movcs	r0, #0
	cmp	r0, r3
	mov	r3, r1
	bfine	ip, r0, #8, #2
	strne	ip, [lr, #120]
	ldr	ip, [lr, #120]
	mov	r1, #2
	mov	r0, #12
	ldr	r7, .L561+16
	bfc	ip, #12, #5
	bfc	ip, #17, #1
	str	ip, [lr, #120]
	ldr	ip, [lr, #120]
	orr	ip, ip, #131072
	str	ip, [lr, #120]
	bl	SCD_ConfigReg
	mov	r3, #1000
	mul	r4, r3, r4
	ldr	r3, .L561+20
	movw	r2, #43690
	bfi	r2, r2, #16, #16
	mov	r0, #30
	ldr	r3, [r3, r5, asl #2]
	ldr	r1, [r6, r4]
	add	r3, r3, #204800
	str	r2, [r1, #156]
	ldr	r2, [r3, #3276]
	ldr	r3, [r6, r4]
	cmp	r2, #1
	mvneq	r2, #5
	mvnne	r2, #1
	str	r2, [r3, #36]
	ldr	r3, [r7, #116]
	blx	r3
	ldr	r3, [r7, #112]
	blx	r3
	ldr	r2, [r6, r4]
	mov	r3, #0
	mov	r1, #1
	str	r3, [r2]
	ldr	r2, [r6, r4]
	str	r1, [r2]
	ldr	r2, [r6, r4]
	str	r3, [r2]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L560:
	mov	r0, #0
	str	r4, [sp]
	str	r0, [sp, #4]
	movw	r1, #2258
	ldr	r3, .L561+24
	ldr	r2, .L561+28
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L562:
	.align	2
.L561:
	.word	g_pstRegCrg
	.word	g_ClkSelect
	.word	g_VdmDrvParam
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LANCHOR0+696
	.word	.LC19
	UNWIND(.fnend)
	.size	VDMHAL_StartHwDecode, .-VDMHAL_StartHwDecode
	.align	2
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
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
	bne	.L564
	ldr	r3, .L568
	ldr	r2, [r3]
	ldr	r3, [r2, #120]
	ubfx	r0, r3, #8, #2
	cmp	r0, r1
	bfine	r3, r1, #8, #2
	strne	r3, [r2, #120]
	ldmfd	sp, {fp, sp, pc}
.L564:
	cmp	r0, #1
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L568
	ldr	r2, [r3]
	ldr	r3, [r2, #120]
	bfi	r3, r1, #12, #5
	bfc	r3, #17, #1
	str	r3, [r2, #120]
	ldr	r3, [r2, #120]
	orr	r3, r3, #131072
	str	r3, [r2, #120]
	ldmfd	sp, {fp, sp, pc}
.L569:
	.align	2
.L568:
	.word	g_pstRegCrg
	UNWIND(.fnend)
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	2
	.global	MFDE_ConfigReg
	.type	MFDE_ConfigReg, %function
MFDE_ConfigReg:
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
	cmp	r2, #0
	ble	.L573
	str	r2, [sp]
	movw	r1, #2390
	mov	r2, #1
	ldr	r3, .L574
	str	r2, [sp, #4]
	mov	r0, #32
	ldr	r2, .L574+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L573:
	mov	r3, #1000
	ldr	ip, .L574+8
	mul	r2, r3, r2
	ldr	r3, [ip, r2]
	str	r1, [r3, r0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L575:
	.align	2
.L574:
	.word	.LANCHOR0+608
	.word	.LC23
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12942, %object
	.size	__func__.12942, 24
__func__.12942:
	.ascii	"VDMHAL_CfgNotFullRepair\000"
	.type	__func__.12594, %object
	.size	__func__.12594, 21
__func__.12594:
	.ascii	"VDMHAL_GetHalMemSize\000"
	.space	3
	.type	__func__.12604, %object
	.size	__func__.12604, 15
__func__.12604:
	.ascii	"VDMHAL_OpenHAL\000"
	.space	1
	.type	__func__.12685, %object
	.size	__func__.12685, 22
__func__.12685:
	.ascii	"VDMHAL_DeriveDispInfo\000"
	.space	2
	.type	__func__.12715, %object
	.size	__func__.12715, 21
__func__.12715:
	.ascii	"VDMHAL_DeriveMemSize\000"
	.space	3
	.type	__func__.12637, %object
	.size	__func__.12637, 22
__func__.12637:
	.ascii	"VDMHAL_DeriveBitDepth\000"
	.space	2
	.type	__func__.12721, %object
	.size	__func__.12721, 29
__func__.12721:
	.ascii	"VDMHAL_InquireSelfDecMemNeed\000"
	.space	3
	.type	__func__.12739, %object
	.size	__func__.12739, 22
__func__.12739:
	.ascii	"VDMHAL_InquireMemNeed\000"
	.space	2
	.type	__func__.12755, %object
	.size	__func__.12755, 16
__func__.12755:
	.ascii	"VDMHAL_ResetVdm\000"
	.type	__func__.12765, %object
	.size	__func__.12765, 28
__func__.12765:
	.ascii	"VDMHAL_SetSmmuPageTableAddr\000"
	.type	__func__.12775, %object
	.size	__func__.12775, 16
__func__.12775:
	.ascii	"VDMHAL_GlbReset\000"
	.type	__func__.12785, %object
	.size	__func__.12785, 17
__func__.12785:
	.ascii	"VDMHAL_GlbResetX\000"
	.space	3
	.type	__func__.12793, %object
	.size	__func__.12793, 21
__func__.12793:
	.ascii	"VDMHAL_ClearIntState\000"
	.space	3
	.type	__func__.12799, %object
	.size	__func__.12799, 24
__func__.12799:
	.ascii	"VDMHAL_ClearMMUIntState\000"
	.type	__func__.12805, %object
	.size	__func__.12805, 15
__func__.12805:
	.ascii	"VDMHAL_MaskInt\000"
	.space	1
	.type	__func__.12815, %object
	.size	__func__.12815, 17
__func__.12815:
	.ascii	"VDMHAL_EnableInt\000"
	.space	3
	.type	__func__.12822, %object
	.size	__func__.12822, 16
__func__.12822:
	.ascii	"VDMHAL_CheckReg\000"
	.type	__func__.12836, %object
	.size	__func__.12836, 19
__func__.12836:
	.ascii	"VDMHAL_ReadMMUMask\000"
	.space	1
	.type	__func__.12841, %object
	.size	__func__.12841, 20
__func__.12841:
	.ascii	"VDMHAL_WriteMMUMask\000"
	.type	__func__.12862, %object
	.size	__func__.12862, 18
__func__.12862:
	.ascii	"VDMHAL_PrepareDec\000"
	.space	2
	.type	__func__.12867, %object
	.size	__func__.12867, 18
__func__.12867:
	.ascii	"VDMHAL_IsVdmReady\000"
	.space	2
	.type	__func__.12872, %object
	.size	__func__.12872, 16
__func__.12872:
	.ascii	"VDMHAL_IsVdmRun\000"
	.type	__func__.12882, %object
	.size	__func__.12882, 20
__func__.12882:
	.ascii	"VDMHAL_IsVdhDecOver\000"
	.type	__func__.12891, %object
	.size	__func__.12891, 24
__func__.12891:
	.ascii	"VDMHAL_IsVdhPartDecOver\000"
	.type	__func__.12900, %object
	.size	__func__.12900, 26
__func__.12900:
	.ascii	"VDMHAL_UpdateHardwareInfo\000"
	.space	2
	.type	__func__.12977, %object
	.size	__func__.12977, 19
__func__.12977:
	.ascii	"VDMHAL_CfgDecRpMsg\000"
	.space	1
	.type	__func__.12998, %object
	.size	__func__.12998, 20
__func__.12998:
	.ascii	"VDMHAL_CfgDispRpMsg\000"
	.type	__func__.12747, %object
	.size	__func__.12747, 28
__func__.12747:
	.ascii	"VDMHAL_AmendImageLinearInfo\000"
	.type	__func__.13073, %object
	.size	__func__.13073, 15
__func__.13073:
	.ascii	"MFDE_ConfigReg\000"
	.space	1
	.type	__func__.13023, %object
	.size	__func__.13023, 21
__func__.13023:
	.ascii	"VDMHAL_MakeDecReport\000"
	.space	3
	.type	__func__.13041, %object
	.size	__func__.13041, 21
__func__.13041:
	.ascii	"VDMHAL_PrepareRepair\000"
	.space	3
	.type	__func__.13050, %object
	.size	__func__.13050, 21
__func__.13050:
	.ascii	"VDMHAL_StartHwRepair\000"
	.space	3
	.type	__func__.13060, %object
	.size	__func__.13060, 21
__func__.13060:
	.ascii	"VDMHAL_StartHwDecode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"align_mb error\012\000" )
.LC1:
	ASCII(.ascii	"[%s][%d]sclie_num is wrong! %d \012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"%s VdhId %d invalid!\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%s: %s\012\000" )
.LC4:
	ASCII(.ascii	"pOpenParam = NULL error!\000" )
	.space	3
.LC5:
	ASCII(.ascii	"MemBaseAddr = 0 error!\000" )
	.space	1
.LC6:
	ASCII(.ascii	"VdhId invalid!\000" )
	.space	1
.LC7:
	ASCII(.ascii	"Size invalid!\000" )
	.space	2
.LC8:
	ASCII(.ascii	"!!!!!! HAL memory not enouph! need %d, have %d\012\000" )
.LC9:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"%s derive bit depth failed.\012\000" )
	.space	3
.LC11:
	ASCII(.ascii	"%s linear not support bit depth %d.\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"%s AFBC not support bit depth %d.\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"%s derive disp info failed.\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"Compress Strategy invalid\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"CompressStrategy: %d, DecCompressFlag: %d, VidStd: " )
	ASCII(.ascii	"%d, Width: %d, Height: %d\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"%s 16bit expand only support linear!\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"%s derive mem size failed.\012\000" )
.LC18:
	ASCII(.ascii	"%s unsupport eMemType %d\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC20:
	ASCII(.ascii	"VDMDRV_ResetVdm: map vdm register fail, vir(reg) = " )
	ASCII(.ascii	"(%p)\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"%s module id %d failed!\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"%s module id %d success!\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"%s: map vdm register 0x%x failed!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"%s VdhId %d failed!\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"%s VdhId %d success!\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"vdm register virtual address not mapped, reset fail" )
	ASCII(.ascii	"ed!\012\000" )
.LC29:
	ASCII(.ascii	"%s: VdhId(%d) Invalid!\012\000" )
.LC30:
	ASCII(.ascii	"%s: unkown reg_id = %d\012\000" )
.LC31:
	ASCII(.ascii	"pDecParam is null\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"HAL_V5R6C1_CfgVdmReg failed\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"VDMHAL_StartDec failed\012\000" )
.LC34:
	ASCII(.ascii	"%s: after StartDec, VidStd(%d), VdhId(%d) down mess" )
	ASCII(.ascii	"age polluted!!!\012\000" )
.LC35:
	ASCII(.ascii	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"ReadUpMsgSlot error! upmsg_size(%d) > UP_MSG_SIZE(%" )
	ASCII(.ascii	"d)\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"Can not map repair msg virtual address!\000" )
.LC38:
	ASCII(.ascii	"ValidGroupNum out of range!\000" )
.LC39:
	ASCII(.ascii	"%s: find src disp fs by dec addr 0x%x failed.\012\000" )
	.space	1
.LC40:
	ASCII(.ascii	"%s: find dst logic fs by dec addr 0x%x failed.\012\000" )
.LC41:
	ASCII(.ascii	"%s: find src logic fs by disp addr 0x%x failed.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC42:
	ASCII(.ascii	"%s: find dst logic fs by disp addr 0x%x failed.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC43:
	ASCII(.ascii	"pMakeDecReport is NULL\000" )
	.space	1
.LC44:
	ASCII(.ascii	"pDecReport is NULL\000" )
	.space	1
.LC45:
	ASCII(.ascii	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full" )
	ASCII(.ascii	" repair.\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"can NOT map vir addr for up-msg\000" )
.LC47:
	ASCII(.ascii	"\012***** UpMsg DecSliceNum=%d\012\000" )
	.space	3
.LC48:
	ASCII(.ascii	"\012***** Up Msg (phy addr: %#8x) *****\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"\0120x%02x 0x%08x 0x%08x 0x%08x 0x%08x\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"\012***** Up Msg print finished *****\012\000" )
.LC51:
	ASCII(.ascii	"%s: unkown RepairState %d\012\000" )
	.space	1
.LC52:
	ASCII(.ascii	"%s: RepairState %d config message failed!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
