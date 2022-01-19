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
	.file	"fsp.c"
	.text
	.align	2
	.type	FSP_IsConfigChanged, %function
FSP_IsConfigChanged:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	cmp	r2, r3
	beq	.L10
.L8:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L10:
	ldrb	r2, [r0, #5]	@ zero_extendqisi2
	ldrb	r3, [r1, #5]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L8
	ldr	r2, [r0, #24]
	ldr	r3, [r1, #24]
	cmp	r2, r3
	bne	.L8
	ldr	r2, [r0, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	bne	.L8
	ldr	r2, [r0, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L8
	ldr	r2, [r0, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L8
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	subs	r0, r3, r0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsConfigChanged, .-FSP_IsConfigChanged
	.align	2
	.type	FSP_GetFsRequirement, %function
FSP_GetFsRequirement:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #80)
	sub	sp, sp, #80
	ldr	r7, .L15
	mov	r5, #0
	mov	r6, r0
	str	r5, [fp, #-76]
	mov	r0, r1
	ldr	r3, [r7, #48]
	mov	r2, #116
	str	r5, [fp, #-72]
	mov	r4, r1
	str	r5, [fp, #-68]
	mov	r1, r5
	str	r5, [fp, #-64]
	str	r5, [fp, #-60]
	str	r5, [fp, #-56]
	str	r5, [fp, #-52]
	str	r5, [fp, #-48]
	str	r5, [fp, #-44]
	str	r5, [fp, #-40]
	str	r5, [fp, #-36]
	str	r5, [fp, #-32]
	blx	r3
	mov	r1, r5
	ldr	r3, [r7, #48]
	mov	r2, #48
	sub	r0, fp, #76
	blx	r3
	ldr	r3, .L15+4
	ldr	lr, [r6]
	ldr	ip, [r6, #8]
	ldr	r0, [r6, #40]
	ldrb	r1, [r6, #45]	@ zero_extendqisi2
	ldr	r2, [r6, #48]
	ldr	r3, [r3, #56]
	str	lr, [fp, #-76]
	cmp	r3, r5
	ldr	lr, [r6, #56]
	ldr	r5, [r6, #52]
	str	ip, [fp, #-68]
	str	r0, [fp, #-64]
	ldr	ip, [r6, #60]
	ldr	r0, [r6, #64]
	strb	r1, [fp, #-70]
	str	r2, [fp, #-60]
	ldr	r1, [r6, #68]
	ldr	r2, [r6, #72]
	str	r0, [fp, #-44]
	str	r5, [fp, #-56]
	str	lr, [fp, #-52]
	str	ip, [fp, #-48]
	str	r1, [fp, #-40]
	str	r2, [fp, #-36]
	ldrb	r0, [r6, #44]	@ zero_extendqisi2
	beq	.L14
	adds	r0, r0, #0
	sub	r1, fp, #76
	mov	r2, r4
	movne	r0, #1
	blx	r3
	subs	r5, r0, #0
	bne	.L14
	ldr	lr, [r4, #44]
	movw	r1, #1294
	ldr	ip, [r4, #88]
	mov	r0, #14
	cmp	lr, #32
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #28]
	movcs	lr, #32
	cmp	ip, #32
	str	lr, [r4, #44]
	movcs	ip, #32
	cmp	r2, #32
	ldr	r6, [r4, #36]
	ldr	lr, [r4, #8]
	movcs	r2, #32
	str	ip, [r4, #88]
	cmp	r3, #32
	ldr	ip, [r4, #4]
	str	r2, [r4, #20]
	movcs	r3, #32
	ldr	r2, [r4]
	str	r3, [r4, #28]
	str	r6, [sp, #12]
	stmia	sp, {r2, ip, lr}
	ldr	r3, .L15+8
	ldr	r2, .L15+12
	bl	dprint_normal
	ldr	ip, [r4, #24]
	ldr	r2, [r4, #28]
	movw	r1, #1299
	ldr	r3, [r4, #16]
	mov	r0, #14
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #92]
	str	ip, [sp, #28]
	ldr	ip, [r4, #88]
	str	r2, [sp, #24]
	ldr	r2, [r4, #48]
	str	r3, [sp, #20]
	ldr	r3, [r4, #44]
	stmib	sp, {r2, ip, lr}
	str	r6, [sp, #16]
	str	r3, [sp]
	ldr	r2, .L15+16
	ldr	r3, .L15+8
	bl	dprint_normal
	ldr	ip, [r4, #80]
	ldr	r2, [r4, #76]
	movw	r1, #1305
	ldr	r3, [r4, #72]
	mov	r0, #14
	ldr	lr, [r4, #64]
	ldr	r6, [r4, #68]
	str	ip, [sp, #28]
	ldr	ip, [r4, #60]
	str	r2, [sp, #24]
	ldr	r2, [r4, #56]
	str	r3, [sp, #20]
	ldr	r3, [r4, #52]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	str	r6, [sp, #16]
	ldr	r3, .L15+8
	ldr	r2, .L15+20
	bl	dprint_normal
	ldr	r2, [r4, #56]
	ldr	r3, [r4, #96]
	movw	r1, #1308
	ldr	lr, [r4, #112]
	mov	r0, #14
	ldr	ip, [r4, #60]
	str	r3, [sp]
	ldr	r3, .L15+8
	stmib	sp, {r2, ip, lr}
	ldr	r2, .L15+24
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L14:
	ldr	r3, .L15+8
	movw	r1, #1284
	ldr	r2, .L15+28
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC0
	UNWIND(.fnend)
	.size	FSP_GetFsRequirement, .-FSP_GetFsRequirement
	.align	2
	.type	FSP_MarkFsOutHanging, %function
FSP_MarkFsOutHanging:
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
	ldr	r3, [r0, #76]
	ldr	r2, [r0, #12]
	mov	ip, r1
	cmp	r3, #0
	ldr	r1, [r0, #16]
	addne	r0, r0, #21504
	addeq	r0, r0, #18432
	moveq	r1, r2
	cmp	r1, #0
	add	r0, r0, #192
	beq	.L17
	ldr	r3, [r0, #4]
	cmp	ip, r3
	beq	.L22
	add	r3, r0, #96
	mov	r2, #0
.L25:
	add	r2, r2, #1
	mov	r0, r3
	cmp	r2, r1
	add	r3, r3, #96
	beq	.L17
	ldr	lr, [r3, #-92]
	cmp	ip, lr
	bne	.L25
.L22:
	cmp	r0, #0
	beq	.L17
	movw	r2, #2372
	mov	r3, #4
	mov	r1, r2
	str	r3, [r0, #84]
	stmia	sp, {r2, ip}
	mov	r0, #26
	ldr	r3, .L26
	ldr	r2, .L26+4
	bl	dprint_normal
.L17:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	.LANCHOR0+24
	.word	.LC5
	UNWIND(.fnend)
	.size	FSP_MarkFsOutHanging, .-FSP_MarkFsOutHanging
	.align	2
	.type	FSP_UnMarkFsOutHanging, %function
FSP_UnMarkFsOutHanging:
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
	ldr	r3, [r0, #76]
	ldr	r2, [r0, #12]
	mov	ip, r1
	cmp	r3, #0
	ldr	r1, [r0, #16]
	addne	r0, r0, #21504
	addeq	r0, r0, #18432
	moveq	r1, r2
	cmp	r1, #0
	add	r0, r0, #192
	beq	.L28
	ldr	r3, [r0, #4]
	cmp	ip, r3
	beq	.L33
	add	r3, r0, #96
	mov	r2, #0
.L36:
	add	r2, r2, #1
	mov	r0, r3
	cmp	r2, r1
	add	r3, r3, #96
	beq	.L28
	ldr	lr, [r3, #-92]
	cmp	ip, lr
	bne	.L36
.L33:
	cmp	r0, #0
	beq	.L28
	ldr	r3, [r0, #84]
	cmp	r3, #4
	beq	.L37
.L28:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L37:
	movw	r2, #2389
	mov	r3, #0
	mov	r1, r2
	str	r3, [r0, #84]
	stmia	sp, {r2, ip}
	mov	r0, #26
	ldr	r3, .L38
	ldr	r2, .L38+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L39:
	.align	2
.L38:
	.word	.LANCHOR0+48
	.word	.LC6
	UNWIND(.fnend)
	.size	FSP_UnMarkFsOutHanging, .-FSP_UnMarkFsOutHanging
	.align	2
	.type	FSP_ReleaseFs, %function
FSP_ReleaseFs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 176
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #188)
	sub	sp, sp, #188
	ldr	r6, .L59
	mov	r4, r1
	mov	r10, r0
	mov	r5, r2
	sub	r0, fp, #196
	ldr	r3, [r6, #48]
	mov	r2, #152
	mov	r1, #0
	blx	r3
	cmp	r4, #3
	ldrls	pc, [pc, r4, asl #2]
	b	.L41
.L43:
	.word	.L42
	.word	.L44
	.word	.L45
	.word	.L46
.L46:
	mov	ip, #1
	str	ip, [fp, #-216]
	mov	r8, ip
	ldr	ip, [r5, #12]
	ldr	r3, .L59+4
	mov	r1, #32
	ldr	r2, .L59+8
	sub	r0, fp, #196
	ldr	r7, [r6, #68]
	str	ip, [fp, #-200]
	ldr	r9, [r5, #8]
	blx	r7
	mov	r3, #0
	mov	r2, #16
	strb	r3, [fp, #-165]
	str	r2, [fp, #-204]
.L47:
	mov	r0, r10
	mov	r7, #0
	bl	VCTRL_GetChanUniqueID
	ldr	r3, [fp, #-200]
	str	r8, [fp, #-148]
	uxtb	r4, r4
	str	r9, [fp, #-164]
	str	r3, [fp, #-140]
	mov	r4, r4, asl #16
	str	r7, [fp, #-144]
	strd	r0, [fp, #-212]
	mov	r0, r9
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-216]
	ldrd	r8, [fp, #-212]
	str	r7, [fp, #-152]
	orr	r8, r8, r4
	strd	r8, [fp, #-132]
	cmp	r0, r7
	movne	r3, #0
	andeq	r3, r3, #1
	str	r0, [fp, #-156]
	cmp	r3, r7
	bne	.L58
.L49:
	ldr	r0, [fp, #-140]
	sub	r3, fp, #196
	ldr	ip, [fp, #-164]
	movw	r1, #1619
	ldr	r2, .L59+12
	str	r0, [sp, #4]
	mov	r0, #14
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, .L59+16
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L50
	sub	r2, fp, #196
	mov	r0, r10
	mov	r3, #152
	mov	r1, #62
	blx	r4
.L50:
	ldr	r3, [r6, #48]
	mov	r0, r5
	ldr	r2, [fp, #-204]
	mov	r1, #0
	blx	r3
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L45:
	ldrb	r8, [r5, #2]	@ zero_extendqisi2
	mov	r1, #32
	ldr	ip, [r5, #12]
	sub	r0, fp, #196
	adds	r2, r8, #0
	ldr	r3, .L59+20
	ldr	r7, [r6, #68]
	movne	r2, #1
	str	r2, [fp, #-216]
	ldr	r2, .L59+8
	str	ip, [fp, #-200]
	ldr	r9, [r5, #8]
	blx	r7
	mov	r3, #24
	str	r3, [fp, #-204]
	mov	r3, #0
	strb	r3, [fp, #-165]
	b	.L47
.L44:
	ldrb	r8, [r5, #2]	@ zero_extendqisi2
	sub	r0, fp, #196
	ldr	r7, [r6, #68]
	mov	r1, #32
	ldr	r3, .L59+24
.L57:
	ldr	ip, [r5, #40]
	adds	r2, r8, #0
	ldr	r9, [r5, #4]
	movne	r2, #1
	str	r2, [fp, #-216]
	str	ip, [fp, #-200]
	ldr	r2, .L59+8
	blx	r7
	mov	r3, #96
	str	r3, [fp, #-204]
	mov	r3, #0
	strb	r3, [fp, #-165]
	b	.L47
.L42:
	ldrb	r8, [r5, #2]	@ zero_extendqisi2
	mov	r1, #32
	ldr	r7, [r6, #68]
	sub	r0, fp, #196
	ldr	r3, .L59+28
	b	.L57
.L41:
	str	r4, [sp]
	movw	r1, #1601
	ldr	r3, .L59+32
	mov	r0, #1
	ldr	r2, .L59+36
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L58:
	ldr	r2, [fp, #-164]
	sub	r3, fp, #196
	mov	r1, #1616
	str	r3, [sp]
	mov	r0, #1
	ldr	r3, .L59+32
	str	r2, [sp, #4]
	ldr	r2, .L59+40
	bl	dprint_normal
	b	.L49
.L60:
	.align	2
.L59:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC11
	.word	.LC8
	.word	.LC14
	.word	g_EventReportFunc
	.word	.LC10
	.word	.LC9
	.word	.LC7
	.word	.LANCHOR0+72
	.word	.LC12
	.word	.LC13
	UNWIND(.fnend)
	.size	FSP_ReleaseFs, .-FSP_ReleaseFs
	.align	2
	.type	FSP_RequireFs, %function
FSP_RequireFs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #164)
	sub	sp, sp, #164
	ldr	r7, .L81
	mov	r9, r0
	mov	r4, r1
	mov	r5, r2
	sub	r0, fp, #196
	ldr	r3, [r7, #48]
	mov	r2, #152
	mov	r1, #0
	ldr	r6, [r9]
	blx	r3
	cmp	r4, #3
	ldrls	pc, [pc, r4, asl #2]
	b	.L62
.L64:
	.word	.L63
	.word	.L65
	.word	.L66
	.word	.L67
.L67:
	ldr	r10, [r7, #68]
	mov	r1, #32
	ldr	r3, .L81+4
	sub	r0, fp, #196
	ldr	r2, .L81+8
	mov	r8, #1
	ldr	r7, [r9, #100]
	blx	r10
	mov	r9, #0
	strb	r9, [fp, #-165]
.L69:
	mov	r0, r6
	uxtb	r4, r4
	bl	VCTRL_GetChanUniqueID
	ldr	r2, .L81+12
	str	r7, [sp]
	sub	r5, r5, #1
	mov	r4, r4, asl #16
	clz	r5, r5
	ldr	ip, [r2]
	sub	r3, fp, #196
	str	r9, [fp, #-144]
	mov	r5, r5, lsr #5
	cmp	ip, #1
	ldr	r2, .L81+16
	str	r7, [fp, #-140]
	movne	ip, r8
	str	r5, [fp, #-164]
	str	ip, [fp, #-148]
	orr	r8, r0, r4
	mov	r9, r1
	mov	r0, #14
	movw	r1, #1533
	strd	r8, [fp, #-132]
	bl	dprint_normal
	ldr	r3, .L81+20
	ldr	r4, [r3]
	cmp	r4, #0
	moveq	r0, r4
	beq	.L71
	sub	r2, fp, #196
	mov	r0, r6
	mov	r3, #152
	mov	r1, #61
	blx	r4
	mov	r0, #0
.L71:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L66:
	ldr	r8, [r9, #88]
	mov	r1, #32
	ldr	r10, [r7, #68]
	sub	r0, fp, #196
	sub	r8, r8, #1
	ldr	r3, .L81+24
	clz	r8, r8
	ldr	r2, .L81+8
	ldr	r7, [r9, #92]
	blx	r10
	mov	r8, r8, lsr #5
	mov	r3, #0
	strb	r3, [fp, #-165]
	mov	r9, r8
	b	.L69
.L65:
	ldr	r3, [r9, #76]
	cmp	r3, #1
	movne	r8, #0
	beq	.L79
.L70:
	ldr	r10, [r7, #68]
	mov	r1, #32
	ldr	r3, .L81+28
	sub	r0, fp, #196
	ldr	r2, .L81+8
	ldr	r7, [r9, #168]
	blx	r10
	mov	r9, #0
	strb	r9, [fp, #-165]
	b	.L69
.L63:
	ldr	r3, [r9, #76]
	cmp	r3, #0
	movne	r8, #0
	beq	.L80
.L68:
	ldr	r10, [r7, #68]
	mov	r1, #32
	ldr	r3, .L81+32
	sub	r0, fp, #196
	ldr	r2, .L81+8
	ldr	r7, [r9, #124]
	blx	r10
	ldr	r9, [r9, #108]
	mov	r3, #0
	strb	r3, [fp, #-165]
	cmp	r9, r3
	beq	.L69
	str	r9, [fp, #-52]
	mov	r9, r3
	str	r3, [fp, #-56]
	mov	r3, #1
	strb	r3, [fp, #-116]
	str	r3, [fp, #-60]
	b	.L69
.L62:
	str	r4, [sp]
	movw	r1, #1521
	ldr	r3, .L81+36
	mov	r0, #1
	ldr	r2, .L81+40
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L80:
	mov	r0, r6
	bl	VCTRL_GetChanCrcMode
	adds	r8, r0, #0
	movne	r8, #1
	b	.L68
.L79:
	mov	r0, r6
	bl	VCTRL_GetChanCrcMode
	adds	r8, r0, #0
	movne	r8, #1
	b	.L70
.L82:
	.align	2
.L81:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC11
	.word	.LC8
	.word	.LANCHOR1
	.word	.LC15
	.word	g_EventReportFunc
	.word	.LC10
	.word	.LC9
	.word	.LC7
	.word	.LANCHOR0+88
	.word	.LC12
	UNWIND(.fnend)
	.size	FSP_RequireFs, .-FSP_RequireFs
	.align	2
	.type	FSP_ReportFsRequirement, %function
FSP_ReportFsRequirement:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	ldr	r6, [r1, #20]
	ldr	r7, [r1, #28]
	mov	r8, r0
	ldr	r5, [r1, #44]
	mov	r9, r1
	cmp	r7, r6
	ldr	r4, [r1, #88]
	ldr	r0, [r0, #36]
	movcs	r2, r7
	movcc	r2, r6
	cmp	r4, r5
	movcs	r3, r4
	movcc	r3, r5
	cmp	r2, r3
	movge	r10, r2
	movlt	r10, r3
	cmp	r0, #1
	beq	.L111
	ldr	r3, .L116
	str	r3, [fp, #-96]
.L84:
	ldr	lr, [r9, #24]
	movw	r1, #1773
	ldr	ip, [r9, #16]
	mov	r0, #14
	ldr	r2, [r9, #92]
	ldr	r3, [r9, #48]
	str	lr, [sp, #28]
	str	ip, [sp, #20]
	str	r2, [sp, #12]
	str	r3, [sp, #4]
	ldr	r2, .L116+4
	ldr	r3, .L116+8
	str	r7, [sp, #24]
	str	r6, [sp, #16]
	str	r4, [sp, #8]
	str	r5, [sp]
	bl	dprint_normal
	ldr	r0, [r8]
	bl	VCTRL_GetChanUniqueID
	ldr	r3, [fp, #-96]
	ldrb	lr, [r9, #42]	@ zero_extendqisi2
	ldr	r1, [r9, #44]
	ldr	r3, [r3]
	ldr	r2, [r9, #20]
	ldr	ip, [r8, #48]
	cmp	r3, #0
	str	r3, [fp, #-96]
	ldr	r0, [r8, #52]
	ldr	r3, [r9, #48]
	ldr	r9, [r9, #16]
	strb	lr, [fp, #-72]
	str	ip, [fp, #-68]
	str	r0, [fp, #-64]
	str	r1, [fp, #-60]
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	str	r9, [fp, #-48]
	beq	.L85
	ldr	r0, [r8]
	sub	r3, fp, #72
	mov	r1, #0
	str	r3, [fp, #-84]
	str	r1, [fp, #-80]
	mov	r1, #65
	mov	r2, r0
	mov	r3, r0, asr #31
	ldr	ip, [fp, #-96]
	strd	r2, [fp, #-92]
	mov	r3, #16
	sub	r2, fp, #92
	blx	ip
.L85:
	cmp	r10, #0
	ble	.L112
	mov	r9, #0
	b	.L91
.L87:
	cmp	r5, #0
	bne	.L113
.L88:
	cmp	r4, #0
	bne	.L114
.L89:
	cmp	r7, #0
	bne	.L115
.L90:
	add	r9, r9, #1
	cmp	r9, r10
	beq	.L112
.L91:
	cmp	r6, #0
	beq	.L87
	clz	r2, r9
	mov	r1, #2
	mov	r0, r8
	sub	r6, r6, #1
	mov	r2, r2, lsr #5
	bl	FSP_RequireFs
	cmp	r5, #0
	beq	.L88
.L113:
	clz	r2, r9
	mov	r1, #0
	mov	r0, r8
	sub	r5, r5, #1
	mov	r2, r2, lsr #5
	bl	FSP_RequireFs
	cmp	r4, #0
	beq	.L89
.L114:
	clz	r2, r9
	mov	r1, #1
	mov	r0, r8
	sub	r4, r4, #1
	mov	r2, r2, lsr #5
	bl	FSP_RequireFs
	cmp	r7, #0
	beq	.L90
.L115:
	clz	r2, r9
	mov	r1, #3
	mov	r0, r8
	add	r9, r9, #1
	mov	r2, r2, lsr #5
	sub	r7, r7, #1
	bl	FSP_RequireFs
	cmp	r9, r10
	bne	.L91
.L112:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L111:
	ldr	r3, [r8, #48]
	movw	r1, #1766
	ldr	r2, [r9, #104]
	ldr	ip, .L116
	mov	lr, r3
	ldr	r3, [r8, #52]
	str	r2, [fp, #-104]
	str	ip, [fp, #-96]
	str	r3, [fp, #-100]
	ldrb	r2, [r9, #86]	@ zero_extendqisi2
	ldr	r3, [r9, #92]
	str	lr, [fp, #-108]
	str	r4, [sp, #4]
	mov	r4, ip
	str	lr, [sp, #8]
	ldr	ip, [fp, #-100]
	ldr	lr, [fp, #-104]
	str	r2, [sp, #20]
	str	r3, [sp]
	str	lr, [sp, #16]
	ldr	r3, .L116+8
	str	ip, [sp, #12]
	ldr	r2, .L116+12
	bl	dprint_normal
	ldr	r3, [r4]
	subs	lr, r3, #0
	moveq	r4, r3
	beq	.L84
	ldr	r2, [fp, #-108]
	mov	r3, #24
	ldr	r1, [r9, #92]
	mov	r4, #0
	ldr	ip, [r9, #88]
	str	r2, [fp, #-64]
	ldr	r2, [fp, #-100]
	ldrb	r0, [r9, #86]	@ zero_extendqisi2
	str	r1, [fp, #-72]
	mov	r1, #45
	str	r2, [fp, #-60]
	ldr	r2, [fp, #-104]
	str	ip, [fp, #-68]
	mov	ip, lr
	str	r0, [fp, #-52]
	str	r2, [fp, #-56]
	sub	r2, fp, #72
	ldr	r0, [r8]
	blx	ip
	b	.L84
.L117:
	.align	2
.L116:
	.word	g_EventReportFunc
	.word	.LC17
	.word	.LANCHOR0+104
	.word	.LC16
	UNWIND(.fnend)
	.size	FSP_ReportFsRequirement, .-FSP_ReportFsRequirement
	.align	2
	.type	FSP_IsDecFsUnLinked.part.1, %function
FSP_IsDecFsUnLinked.part.1:
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
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L120
	ldr	r2, [r0, #12]
	ldr	r1, [r3, #76]
	cmp	r1, r2
	beq	.L122
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L122:
	ldr	r0, [r3, #80]
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L120:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsDecFsUnLinked.part.1, .-FSP_IsDecFsUnLinked.part.1
	.align	2
	.type	FSP_CancelFsRequirement.isra.11, %function
FSP_CancelFsRequirement.isra.11:
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
	UNWIND(.pad #32)
	sub	sp, sp, #32
	mov	r5, r0
	bl	VCTRL_GetChanUniqueID
	movw	r6, #65535
	mvn	r7, #0
	ldr	r2, .L128
	strd	r6, [sp, #8]
	mov	r8, r0
	mov	r9, r1
	mov	r0, #14
	movw	r1, #1842
	strd	r8, [sp]
	bl	dprint_normal
	ldr	r3, .L128+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L124
	strd	r8, [fp, #-52]
	mov	r0, r5
	strd	r6, [fp, #-44]
	mov	r3, #16
	sub	r2, fp, #52
	mov	r1, #64
	blx	r4
.L124:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L129:
	.align	2
.L128:
	.word	.LC18
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	FSP_CancelFsRequirement.isra.11, .-FSP_CancelFsRequirement.isra.11
	.align	2
	.type	FSP_ReleaseDecFsRecord.part.12, %function
FSP_ReleaseDecFsRecord.part.12:
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
	ldr	r2, [r0, #12]
	mov	r6, r0
	cmp	r2, #0
	addne	r4, r0, #18432
	movne	r5, #0
	addne	r4, r4, #192
	bne	.L133
	b	.L134
.L132:
	cmp	r5, r2
	add	r4, r4, #96
	bcs	.L134
.L133:
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, #1
	bne	.L132
	mov	r2, r4
	mov	r1, #0
	ldr	r0, [r6]
	add	r4, r4, #96
	bl	FSP_ReleaseFs
	ldr	r2, [r6, #12]
	cmp	r5, r2
	bcc	.L133
.L134:
	mov	r3, #0
	str	r3, [r6, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_ReleaseDecFsRecord.part.12, .-FSP_ReleaseDecFsRecord.part.12
	.align	2
	.type	FSP_ReleaseDispFsRecord.part.13, %function
FSP_ReleaseDispFsRecord.part.13:
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
	ldr	r3, [r0, #16]
	mov	r6, r0
	cmp	r3, #0
	addne	r4, r0, #21504
	movne	r5, #0
	addne	r4, r4, #192
	bne	.L140
	b	.L141
.L139:
	cmp	r5, r3
	add	r4, r4, #96
	bcs	.L141
.L140:
	ldrb	r1, [r4]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r1, #1
	bne	.L139
	mov	r2, r4
	ldr	r0, [r6]
	bl	FSP_ReleaseFs
	ldr	r3, [r6, #16]
	add	r4, r4, #96
	cmp	r5, r3
	bcc	.L140
.L141:
	mov	r3, #0
	str	r3, [r6, #16]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_ReleaseDispFsRecord.part.13, .-FSP_ReleaseDispFsRecord.part.13
	.align	2
	.type	FSP_ReleasePmvRecord.part.14, %function
FSP_ReleasePmvRecord.part.14:
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
	ldr	r2, [r0, #20]
	mov	r6, r0
	cmp	r2, #0
	addne	r4, r0, #24576
	movne	r5, #0
	addne	r4, r4, #192
	bne	.L147
	b	.L148
.L146:
	cmp	r5, r2
	add	r4, r4, #24
	bcs	.L148
.L147:
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, #1
	bne	.L146
	mov	r2, r4
	mov	r1, #2
	ldr	r0, [r6]
	add	r4, r4, #24
	bl	FSP_ReleaseFs
	ldr	r2, [r6, #20]
	cmp	r5, r2
	bcc	.L147
.L148:
	mov	r3, #0
	str	r3, [r6, #20]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_ReleasePmvRecord.part.14, .-FSP_ReleasePmvRecord.part.14
	.align	2
	.type	FSP_ReleaseMetadataRecord.part.15, %function
FSP_ReleaseMetadataRecord.part.15:
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
	ldr	r2, [r0, #24]
	mov	r6, r0
	cmp	r2, #0
	addne	r4, r0, #25344
	movne	r5, #0
	addne	r4, r4, #192
	bne	.L154
	b	.L155
.L153:
	cmp	r5, r2
	add	r4, r4, #16
	bcs	.L155
.L154:
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, #1
	bne	.L153
	mov	r2, r4
	mov	r1, #3
	ldr	r0, [r6]
	add	r4, r4, #16
	bl	FSP_ReleaseFs
	ldr	r2, [r6, #24]
	cmp	r5, r2
	bcc	.L154
.L155:
	mov	r3, #0
	str	r3, [r6, #24]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_ReleaseMetadataRecord.part.15, .-FSP_ReleaseMetadataRecord.part.15
	.align	2
	.type	FSP_VarifyWaterMark, %function
FSP_VarifyWaterMark:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	mov	r4, r1
	mov	r5, r0
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L161
	add	r0, r0, r4
	movw	r3, #52445
	movt	r3, 43707
	ldr	r2, [r0, #-4]
	cmp	r2, r3
	beq	.L158
	str	r3, [sp, #8]
	movw	r1, #2280
	str	r2, [sp, #4]
	mov	r0, #32
	str	r5, [sp]
	ldr	r3, .L162
	ldr	r2, .L162+4
	bl	dprint_normal
.L158:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L161:
	str	r4, [sp, #4]
	mov	r1, #2272
	str	r5, [sp]
	mov	r0, #32
	ldr	r3, .L162
	ldr	r2, .L162+8
	bl	dprint_normal
	b	.L158
.L163:
	.align	2
.L162:
	.word	.LANCHOR0+128
	.word	.LC20
	.word	.LC19
	UNWIND(.fnend)
	.size	FSP_VarifyWaterMark, .-FSP_VarifyWaterMark
	.align	2
	.type	FSP_IsLogicFsMatchTargetCore, %function
FSP_IsLogicFsMatchTargetCore:
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
	ldrsb	r3, [r0]
	cmp	r3, #0
	bne	.L165
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bne	.L165
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L165:
	cmp	r1, #0
	beq	.L167
	cmp	r1, #1
	beq	.L174
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L167:
	ldr	r0, [r0, #16]
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L174:
	ldr	r0, [r0, #16]
	sub	r0, r0, #2
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsLogicFsMatchTargetCore, .-FSP_IsLogicFsMatchTargetCore
	.align	2
	.type	FSP_FindIdleDispFs.isra.19, %function
FSP_FindIdleDispFs.isra.19:
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
	mov	r3, #0
	mov	r9, r2
	str	r3, [r2]
	ldr	r2, [r0, #76]
	mov	r7, r0
	cmp	r2, r3
	beq	.L176
	ldr	ip, [r0, #16]
	cmp	ip, r3
	beq	.L183
	add	r1, r0, #21760
	add	r1, r1, #20
	b	.L180
.L178:
	cmp	r3, ip
	add	r1, r1, #96
	beq	.L183
.L180:
	mov	r5, r3, asl #5
	mov	r6, r3, asl #7
	rsb	r4, r5, r6
	add	r3, r3, #1
	add	r4, r7, r4
	add	r2, r4, #21504
	add	r2, r2, #192
	ldrh	r0, [r2]
	cmp	r0, #1
	bne	.L178
	ldr	r8, [r1]
	cmp	r8, #0
	bne	.L178
	ldr	r10, [r1, #-44]
	ldr	lr, [r7, #168]
	cmp	r10, lr
	bne	.L178
	ldr	r10, [r1, #-40]
	ldr	lr, [r7, #180]
	cmp	r10, lr
	bne	.L178
	movw	r10, #21776
	ldr	r3, [r4, r10]
	cmp	r3, #0
	beq	.L182
	str	r3, [sp, #4]
	mov	r1, #816
	ldr	ip, [r2, #4]
	ldr	r3, .L188
	ldr	r2, .L188+4
	str	ip, [sp]
	bl	dprint_normal
	str	r8, [r4, r10]
.L182:
	rsb	r5, r5, r6
	add	r0, r5, #21504
	add	r0, r0, #192
	add	r0, r7, r0
	str	r0, [r9]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L176:
	clz	r0, r1
	str	r1, [r9]
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L183:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L189:
	.align	2
.L188:
	.word	.LANCHOR0+148
	.word	.LC21
	UNWIND(.fnend)
	.size	FSP_FindIdleDispFs.isra.19, .-FSP_FindIdleDispFs.isra.19
	.align	2
	.type	FSP_FindIdleMetadata.isra.21, %function
FSP_FindIdleMetadata.isra.21:
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
	mov	ip, #0
	str	ip, [r2]
	ldr	r3, [r0, #84]
	cmp	r3, ip
	moveq	r0, r3
	beq	.L198
	cmp	r1, ip
	beq	.L196
	ldr	r1, [r1, #36]
	cmp	r1, #31
	bhi	.L199
	add	r3, r1, #1584
	ldr	ip, [r0, #100]
	add	r3, r3, #12
	mov	r3, r3, asl #4
	add	lr, r0, r3
	ldrh	r3, [r0, r3]
	cmp	r3, #1
	beq	.L200
.L196:
	mvn	r0, #0
.L198:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L200:
	add	r0, r0, r1, lsl #4
	add	r0, r0, #25344
	ldr	r3, [r0, #204]
	cmp	ip, r3
	bne	.L196
	clz	r3, lr
	str	lr, [r2]
	mov	r3, r3, lsr #5
	rsb	r0, r3, #0
	b	.L198
.L199:
	ldr	lr, .L201
	mov	r0, ip
	ldr	r3, .L201+4
	movw	r1, #887
	ldr	r2, .L201+8
	str	lr, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L198
.L202:
	.align	2
.L201:
	.word	.LC23
	.word	.LANCHOR0+168
	.word	.LC22
	UNWIND(.fnend)
	.size	FSP_FindIdleMetadata.isra.21, .-FSP_FindIdleMetadata.isra.21
	.align	2
	.type	FSP_FindOneGroupFs, %function
FSP_FindOneGroupFs:
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
	mov	r3, #0
	str	r3, [r1, #24]
	mov	r5, r1
	ldr	r7, [r0, #12]
	mov	r4, r0
	cmp	r7, r3
	addne	r1, r0, #18688
	addne	r1, r1, #20
	bne	.L208
	b	.L209
.L206:
	cmp	r3, r7
	add	r1, r1, #96
	beq	.L209
.L208:
	mov	r2, r3, asl #7
	sub	r2, r2, r3, asl #5
	add	r3, r3, #1
	add	lr, r4, r2
	add	ip, lr, #18432
	add	ip, ip, #192
	ldrh	r0, [ip]
	cmp	r0, #1
	bne	.L206
	ldr	r6, [r1]
	cmp	r6, #0
	bne	.L206
	ldr	r9, [r1, #-44]
	ldr	r8, [r4, #124]
	cmp	r9, r8
	bne	.L206
	ldr	r9, [r1, #-40]
	ldr	r8, [r4, #136]
	cmp	r9, r8
	bne	.L206
	add	r1, r2, #18432
	add	r1, r1, #192
	add	r1, r4, r1
	str	r1, [r5, #24]
	cmp	r1, #0
	beq	.L209
	movw	r3, #18704
	ldr	r3, [lr, r3]
	cmp	r3, #0
	beq	.L210
	str	r3, [sp, #4]
	mov	r1, #792
	ldr	ip, [ip, #4]
	ldr	r3, .L233
	ldr	r2, .L233+4
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r5, #24]
	str	r6, [r3, #80]
	ldr	r1, [r5, #24]
.L210:
	add	r2, r5, #28
	mov	r0, r4
	bl	FSP_FindIdleDispFs.isra.19
	cmp	r0, #0
	bne	.L209
	str	r0, [r5, #32]
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L217
	ldr	ip, [r4, #20]
	cmp	ip, #0
	beq	.L209
	add	r1, r4, #24576
	ldr	lr, [r4, #92]
	add	r1, r1, #204
	b	.L214
.L212:
	cmp	r0, ip
	add	r1, r1, #24
	beq	.L209
.L214:
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #3
	add	r0, r0, #1
	add	r3, r4, r2
	add	r3, r3, #24576
	add	r3, r3, #192
	ldrh	r3, [r3]
	cmp	r3, #1
	bne	.L212
	ldr	r3, [r1]
	cmp	r3, lr
	bne	.L212
	add	r2, r2, #24576
	add	r2, r2, #192
	add	r2, r4, r2
	str	r2, [r5, #32]
	cmp	r2, #0
	beq	.L209
.L217:
	mov	r0, r4
	add	r2, r5, #36
	ldr	r1, [r5, #28]
	bl	FSP_FindIdleMetadata.isra.21
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L209:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L234:
	.align	2
.L233:
	.word	.LANCHOR0+192
	.word	.LC24
	UNWIND(.fnend)
	.size	FSP_FindOneGroupFs, .-FSP_FindOneGroupFs
	.align	2
	.type	FSP_GetOccupiedNum.part.26, %function
FSP_GetOccupiedNum.part.26:
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
	ldr	ip, .L236
	movw	r1, #3522
	ldr	r3, .L236+4
	ldr	r2, .L236+8
	mov	r0, #0
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L237:
	.align	2
.L236:
	.word	.LC25
	.word	.LANCHOR0+212
	.word	.LC22
	UNWIND(.fnend)
	.size	FSP_GetOccupiedNum.part.26, .-FSP_GetOccupiedNum.part.26
	.align	2
	.type	FSP_SetDisplay_Share.isra.6, %function
FSP_SetDisplay_Share.isra.6:
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
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r3, [r0, #28]
	mov	r4, r0
	mov	ip, r1
	cmp	r3, #0
	beq	.L238
	ldr	r2, [r3, #76]
	ldr	r0, [r0, #12]
	cmp	r2, r0
	bne	.L260
	cmp	r1, #1
	moveq	r2, #3
	streq	r2, [r3, #84]
	beq	.L238
	ldr	r2, [r3, #80]
	cmp	r2, #0
	ble	.L243
	sub	r2, r2, #1
	str	r2, [r3, #80]
	ldrsb	r3, [r4]
	cmp	r3, #0
	beq	.L261
.L244:
	ldr	r5, [r4, #20]
	cmp	r5, #0
	bne	.L238
	mov	r0, r4
	bl	FSP_IsDecFsUnLinked.part.1
	cmp	r0, #1
	bne	.L238
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #32]
	cmp	r3, r1
	strne	r5, [r3, #84]
	cmp	r2, #0
	strb	r5, [r3, #1]
	beq	.L249
	ldr	r3, [r4, #12]
	ldr	r1, [r2, #20]
	cmp	r1, r3
	moveq	r3, #0
	streqb	r3, [r2, #1]
.L249:
	mov	r3, #0
	str	r3, [r4, #24]
	str	r3, [r4, #32]
.L238:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L261:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L244
	ldr	r1, [r3, #76]
	ldr	r2, [r4, #12]
	cmp	r1, r2
	bne	.L244
.L250:
	ldr	r2, [r3, #80]
	cmp	r2, #0
	bgt	.L244
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #36]
	cmp	r1, r3
	movne	r1, #0
	strneb	r1, [r3, #1]
	mov	r1, #0
	cmp	r2, #0
	str	r1, [r3, #84]
	mov	r3, #0
	strneb	r1, [r2, #1]
	str	r3, [r4, #28]
	str	r3, [r4, #36]
	b	.L244
.L260:
	ldr	lr, [r4, #4]
	movw	r1, #435
	str	r0, [sp, #16]
	mov	r0, #1
	str	r2, [sp, #8]
	str	lr, [sp, #12]
	ldr	r2, [r3, #36]
	ldr	r3, .L262
	str	ip, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L262+4
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L243:
	ldrsb	r2, [r4]
	cmp	r2, #0
	bne	.L244
	b	.L250
.L263:
	.align	2
.L262:
	.word	.LANCHOR0+232
	.word	.LC26
	UNWIND(.fnend)
	.size	FSP_SetDisplay_Share.isra.6, .-FSP_SetDisplay_Share.isra.6
	.align	2
	.global	FSP_IsLogicFsAvailable
	.type	FSP_IsLogicFsAvailable, %function
FSP_IsLogicFsAvailable:
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
	ldrsb	r3, [r0]
	cmp	r3, #0
	ldreq	r0, [r0, #20]
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsLogicFsAvailable, .-FSP_IsLogicFsAvailable
	.align	2
	.global	FSP_IsDecFsAvailable
	.type	FSP_IsDecFsAvailable, %function
FSP_IsDecFsAvailable:
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
	ldrh	r3, [r1]
	cmp	r3, #1
	beq	.L272
.L270:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L272:
	ldr	r3, [r1, #84]
	cmp	r3, #0
	bne	.L270
	ldr	ip, [r1, #40]
	ldr	r2, [r0, #124]
	cmp	ip, r2
	beq	.L273
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L273:
	ldr	r3, [r1, #44]
	ldr	r0, [r0, #136]
	rsb	r0, r0, r3
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsDecFsAvailable, .-FSP_IsDecFsAvailable
	.align	2
	.global	FSP_IsDispFsAvailable
	.type	FSP_IsDispFsAvailable, %function
FSP_IsDispFsAvailable:
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
	ldrh	r3, [r1]
	cmp	r3, #1
	beq	.L279
.L277:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L279:
	ldr	r3, [r1, #84]
	cmp	r3, #0
	bne	.L277
	ldr	ip, [r1, #40]
	ldr	r2, [r0, #168]
	cmp	ip, r2
	beq	.L280
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L280:
	ldr	r3, [r1, #44]
	ldr	r0, [r0, #180]
	rsb	r0, r0, r3
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsDispFsAvailable, .-FSP_IsDispFsAvailable
	.align	2
	.global	FSP_IsPmvAvailable
	.type	FSP_IsPmvAvailable, %function
FSP_IsPmvAvailable:
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
	ldrh	r2, [r1]
	ldr	r3, [r0, #92]
	cmp	r2, #1
	ldreq	r0, [r1, #12]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsPmvAvailable, .-FSP_IsPmvAvailable
	.align	2
	.global	FSP_IsMetadataAvailable
	.type	FSP_IsMetadataAvailable, %function
FSP_IsMetadataAvailable:
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
	ldrh	r2, [r1]
	ldr	r3, [r0, #100]
	cmp	r2, #1
	ldreq	r0, [r1, #12]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsMetadataAvailable, .-FSP_IsMetadataAvailable
	.align	2
	.global	FSP_Init
	.type	FSP_Init, %function
FSP_Init:
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
	ldr	r3, .L288
	mov	r2, #16
	mov	r1, #0
	ldr	r0, .L288+4
	ldr	r3, [r3, #48]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L289:
	.align	2
.L288:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+4
	UNWIND(.fnend)
	.size	FSP_Init, .-FSP_Init
	.align	2
	.global	FSP_EnableInstance
	.type	FSP_EnableInstance, %function
FSP_EnableInstance:
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
	mov	r5, r1
	mov	r7, r0
	ldrhi	ip, .L296
	movwhi	r1, #2482
	bhi	.L294
	ldr	r6, .L296+4
	add	r6, r6, r0, lsl #2
	ldr	r4, [r6, #4]
	cmp	r4, #0
	bne	.L295
	ldr	r8, .L296+8
	mov	r0, #3
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r1, r4
	movw	r2, #26048
	mov	r0, r5
	blx	r3
	str	r7, [r5]
	mov	r2, #1
	str	r4, [r5, #32]
	ldr	r3, [r8, #16]
	mov	r0, #3
	str	r5, [r6, #4]
	str	r2, [r5, #28]
	blx	r3
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L295:
	ldr	ip, .L296+12
	movw	r1, #2483
.L294:
	ldr	r3, .L296+16
	mov	r0, #0
	ldr	r2, .L296+20
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L297:
	.align	2
.L296:
	.word	.LC25
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LANCHOR0+256
	.word	.LC22
	UNWIND(.fnend)
	.size	FSP_EnableInstance, .-FSP_EnableInstance
	.align	2
	.global	FSP_DisableInstance
	.type	FSP_DisableInstance, %function
FSP_DisableInstance:
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
	bhi	.L319
	ldr	r6, .L326
	mov	r5, r0, asl #2
	add	r4, r6, r5
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L320
	ldr	r7, .L326+4
	mov	r0, #3
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r4, [r4, #4]
	ldr	r3, [r4, #28]
	cmp	r3, #1
	beq	.L321
.L302:
	add	r3, r6, r5
	mov	r1, #0
	ldr	r2, [r7, #16]
	mov	r0, #3
	str	r1, [r3, #4]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	bx	r2
.L319:
	ldr	ip, .L326+8
	movw	r1, #2502
	ldr	r3, .L326+12
	mov	r0, #0
	ldr	r2, .L326+16
	str	ip, [sp]
	bl	dprint_normal
.L298:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L321:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L322
.L303:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L323
.L304:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L324
.L305:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L325
.L306:
	ldr	r8, [r4]
	movw	r2, #26048
	ldr	r3, [r7, #48]
	mov	r1, #0
	mov	r0, r4
	blx	r3
	mov	r3, #0
	str	r8, [r4]
	str	r3, [r4, #28]
	b	.L302
.L320:
	ldr	ip, .L326+20
	movw	r1, #2503
	ldr	r3, .L326+12
	ldr	r2, .L326+16
	str	ip, [sp]
	bl	dprint_normal
	b	.L298
.L325:
	mov	r0, r4
	bl	FSP_ReleaseMetadataRecord.part.15
	b	.L306
.L324:
	mov	r0, r4
	bl	FSP_ReleasePmvRecord.part.14
	b	.L305
.L323:
	mov	r0, r4
	bl	FSP_ReleaseDispFsRecord.part.13
	b	.L304
.L322:
	mov	r0, r4
	bl	FSP_ReleaseDecFsRecord.part.12
	b	.L303
.L327:
	.align	2
.L326:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LANCHOR0+276
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_DisableInstance, .-FSP_DisableInstance
	.align	2
	.global	FSP_Exit
	.type	FSP_Exit, %function
FSP_Exit:
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
	ldr	r5, .L339
	mov	r4, #0
.L330:
	ldr	r3, [r5], #4
	cmp	r3, #0
	beq	.L329
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L338
.L329:
	add	r4, r4, #1
	cmp	r4, #4
	bne	.L330
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L338:
	mov	r0, r4
	bl	FSP_DisableInstance
	b	.L329
.L340:
	.align	2
.L339:
	.word	.LANCHOR1+4
	UNWIND(.fnend)
	.size	FSP_Exit, .-FSP_Exit
	.align	2
	.global	FSP_ResetInstance
	.type	FSP_ResetInstance, %function
FSP_ResetInstance:
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
	bhi	.L372
	ldr	r3, .L374
	add	r5, r3, r0, lsl #2
	ldr	r0, [r5, #4]
	cmp	r0, #0
	beq	.L373
	ldr	r4, .L374+4
	mov	r0, #3
	ldr	r3, [r4, #12]
	blx	r3
	ldr	r1, [r5, #4]
	mov	ip, #0
	add	r0, r1, #18432
	mov	r2, ip
	mov	r3, r1
	str	ip, [r1, #4]
.L345:
	strb	r2, [r3, #192]
	add	r3, r3, #576
	str	r2, [r3, #-372]
	str	r2, [r3, #-364]
	str	r2, [r3, #-360]
	str	r2, [r3, #-356]
	str	r2, [r3, #-352]
	str	r2, [r3, #-348]
	cmp	r3, r0
	bne	.L345
	ldr	ip, [r1, #20]
	cmp	ip, #0
	addne	r3, r1, #24576
	movne	r2, #0
	addne	r3, r3, #193
	movne	r0, r2
	beq	.L350
.L349:
	add	r2, r2, #1
	strb	r0, [r3]
	cmp	r2, ip
	str	r0, [r3, #19]
	add	r3, r3, #24
	bne	.L349
.L350:
	ldr	lr, [r1, #12]
	cmp	lr, #0
	addne	r3, r1, #18432
	movne	r0, #0
	addne	r3, r3, #193
	movne	r2, r0
	beq	.L348
.L354:
	ldr	ip, [r3, #83]
	add	r0, r0, #1
	strb	r2, [r3]
	add	r3, r3, #96
	cmp	ip, #4
	strne	r2, [r3, #-13]
	cmp	r0, lr
	str	r2, [r3, #-21]
	str	r2, [r3, #-17]
	str	r2, [r3, #-9]
	bne	.L354
.L348:
	ldr	lr, [r1, #16]
	cmp	lr, #0
	addne	r3, r1, #21504
	movne	r0, #0
	addne	r3, r3, #193
	movne	r2, r0
	beq	.L352
.L358:
	ldr	ip, [r3, #83]
	add	r0, r0, #1
	strb	r2, [r3]
	add	r3, r3, #96
	cmp	ip, #4
	strne	r2, [r3, #-13]
	cmp	r0, lr
	str	r2, [r3, #-21]
	str	r2, [r3, #-17]
	str	r2, [r3, #-9]
	bne	.L358
.L352:
	ldr	r0, [r1, #24]
	cmp	r0, #0
	addne	r3, r1, #25344
	movne	r2, #0
	addne	r3, r3, #194
	beq	.L356
.L360:
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r2, r2, #1
	add	r3, r3, #16
	cmp	r1, #0
	streqb	r1, [r3, #-17]
	cmp	r2, r0
	bne	.L360
.L356:
	ldr	r3, [r4, #16]
	mov	r0, #3
	blx	r3
	mov	r0, #0
.L343:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L372:
	ldr	ip, .L374+8
	movw	r1, #2530
	ldr	r3, .L374+12
	mov	r0, #0
	ldr	r2, .L374+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L343
.L373:
	ldr	ip, .L374+20
	movw	r1, #2531
	ldr	r3, .L374+12
	ldr	r2, .L374+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L343
.L375:
	.align	2
.L374:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LANCHOR0+296
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_ResetInstance, .-FSP_ResetInstance
	.align	2
	.global	FSP_ArrangeFsPool
	.type	FSP_ArrangeFsPool, %function
FSP_ArrangeFsPool:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #164)
	sub	sp, sp, #164
	cmp	r0, #3
	mov	r4, r0
	mov	r6, r1
	mov	r8, r2
	bhi	.L486
	ldr	r5, .L506
	mov	r10, r0, asl #2
	add	r3, r5, r10
	ldr	r0, [r3, #4]
	cmp	r0, #0
	beq	.L487
	ldr	r3, .L506+4
	mov	r9, #100
	mla	r9, r9, r4, r3
	ldr	r2, [r9, #16]
	cmp	r2, #0
	beq	.L488
.L380:
	ldr	r2, [r6, #12]
	mov	r0, r4
	ldr	r1, [r6, #8]
	str	r3, [fp, #-168]
	bl	VCTRL_IsResolutionValid
	ldr	r3, [fp, #-168]
	cmp	r0, #1
	bne	.L489
	mov	r9, #100
	mla	r9, r9, r4, r3
	ldr	r3, [r9, #64]
	cmp	r3, #1
	beq	.L477
	ldr	r7, .L506+8
.L382:
	ldr	r3, [r7, #12]
	mov	r0, #3
	blx	r3
	ldr	r3, .L506+12
	add	r5, r5, r10
	cmp	r8, #0
	ldr	r9, .L506+8
	ldr	r3, [r3, r4, asl #2]
	ldr	r5, [r5, #4]
	add	r3, r3, #204800
	ldr	r3, [r3, #3544]
	str	r3, [r6, #32]
	beq	.L490
	cmp	r8, #1
	beq	.L491
	cmp	r8, #2
	beq	.L492
	str	r8, [sp]
	movw	r1, #2591
	ldr	r3, .L506+16
	mov	r0, #1
	ldr	r2, .L506+20
	mvn	r4, #0
	bl	dprint_normal
.L385:
	ldr	r3, [r7, #16]
	mov	r0, #3
	blx	r3
	mov	r0, r4
.L476:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L488:
	ldr	r7, .L506+8
	str	r3, [fp, #-168]
	ldr	r2, [r7]
	blx	r2
	ldr	r3, [fp, #-168]
	str	r0, [r9, #16]
	b	.L380
.L490:
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	add	r4, r5, #40
	ldr	ip, [r6, #12]
	movw	r1, #2052
	ldr	r2, [r6, #8]
	mov	r0, #14
	str	r3, [sp, #24]
	ldr	r3, [r6, #28]
	str	ip, [sp, #20]
	ldr	ip, [r6, #24]
	str	r2, [sp, #16]
	ldrb	r2, [r6, #5]	@ zero_extendqisi2
	str	r3, [sp, #12]
	ldr	r3, [r6]
	stmib	sp, {r2, ip}
	ldr	r2, .L506+24
	str	r3, [sp]
	ldr	r3, .L506+28
	bl	dprint_normal
	mov	r0, r4
	mov	r1, r6
	bl	FSP_IsConfigChanged
	cmp	r0, #0
	beq	.L493
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #120]
	str	r8, [r5, #32]
	cmp	r2, r3
	bcc	.L386
	ldr	ip, [r5, #16]
	ldr	r3, [r5, #164]
	cmp	ip, r3
	bcc	.L386
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #96]
	cmp	r2, r3
	bcc	.L386
	ldr	r2, [r5, #24]
	ldr	r3, [r5, #104]
	cmp	r2, r3
	bcs	.L387
.L386:
	ldr	r0, [r5]
	bl	FSP_CancelFsRequirement.isra.11
	ldr	ip, [r5, #16]
.L387:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	beq	.L388
	cmp	ip, #0
	addne	r3, r5, #21504
	movne	r0, #0
	addne	r3, r3, #192
	movne	r2, r0
	beq	.L390
.L394:
	ldr	r1, [r3, #84]
	add	r0, r0, #1
	strb	r2, [r3]
	add	r3, r3, #96
	cmp	r1, #3
	strb	r2, [r3, #-95]
	str	r2, [r3, #-20]
	movne	r1, #0
	cmp	r0, ip
	str	r2, [r3, #-16]
	str	r2, [r3, #-8]
	str	r1, [r3, #-12]
	bne	.L394
.L390:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	bne	.L494
.L395:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L495
.L396:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L496
.L397:
	add	r1, r5, #18432
	mov	r3, r5
	mov	r2, #0
.L398:
	strb	r2, [r3, #192]
	add	r3, r3, #576
	str	r2, [r3, #-372]
	str	r2, [r3, #-364]
	str	r2, [r3, #-360]
	str	r2, [r3, #-356]
	str	r2, [r3, #-352]
	str	r2, [r3, #-348]
	cmp	r3, r1
	bne	.L398
	add	r8, r5, #76
	mov	r1, r6
	ldr	r3, [r7, #52]
	mov	r2, #36
	mov	r0, r4
	blx	r3
	mov	r1, r8
	mov	r0, r5
	bl	FSP_GetFsRequirement
	cmp	r0, #0
	bne	.L497
	mov	r1, r8
	mov	r0, r5
	bl	FSP_ReportFsRequirement
	cmp	r0, #0
	bne	.L498
	mov	r1, #1
	ldr	r0, [r5]
	str	r1, [r5, #32]
	mov	r4, #2
	bl	VCTRL_SetChanWaitFsFlag
	b	.L385
.L477:
	ldr	r3, [r9, #72]
	ldr	r7, .L506+8
	cmp	r3, #0
	bne	.L382
	ldr	r3, [r7]
	blx	r3
	str	r0, [r9, #72]
	b	.L382
.L492:
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	add	r8, r5, #40
	ldr	ip, [r6, #12]
	movw	r1, #2172
	ldr	r2, [r6, #8]
	mov	r0, #14
	str	r3, [sp, #24]
	ldr	r3, [r6, #28]
	str	ip, [sp, #20]
	ldr	ip, [r6, #24]
	str	r2, [sp, #16]
	ldrb	r2, [r6, #5]	@ zero_extendqisi2
	str	r3, [sp, #12]
	ldr	r3, [r6]
	stmib	sp, {r2, ip}
	ldr	r2, .L506+24
	str	r3, [sp]
	ldr	r3, .L506+32
	bl	dprint_normal
	mov	r0, r8
	mov	r1, r6
	add	r3, r5, #76
	str	r3, [fp, #-168]
	bl	FSP_IsConfigChanged
	subs	r4, r0, #0
	beq	.L499
	ldr	r2, [r5, #12]
	mov	r1, #0
	ldr	r3, [r5, #120]
	str	r1, [r5, #32]
	cmp	r2, r3
	bcc	.L413
	ldr	ip, [r5, #16]
	ldr	r3, [r5, #164]
	cmp	ip, r3
	bcc	.L413
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #96]
	cmp	r2, r3
	bcc	.L413
	ldr	r2, [r5, #24]
	ldr	r3, [r5, #104]
	cmp	r2, r3
	bcc	.L413
.L414:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	beq	.L415
	cmp	ip, #0
	addne	r3, r5, #21504
	movne	r0, #0
	addne	r3, r3, #192
	movne	r2, r0
	beq	.L417
.L421:
	ldr	r1, [r3, #84]
	add	r0, r0, #1
	strb	r2, [r3]
	add	r3, r3, #96
	cmp	r1, #3
	strb	r2, [r3, #-95]
	str	r2, [r3, #-20]
	movne	r1, #0
	cmp	r0, ip
	str	r2, [r3, #-16]
	str	r2, [r3, #-8]
	str	r1, [r3, #-12]
	bne	.L421
.L417:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L500
.L422:
	ldr	r10, [r5, #76]
	add	r9, r5, #18432
	cmp	r10, #0
	addeq	r9, r9, #192
	addeq	r4, r5, #192
	beq	.L435
	add	r4, r5, #192
	add	r9, r9, #192
	mov	r10, #0
	b	.L431
.L428:
	ldr	r3, [r4, #16]
	sub	r3, r3, #1
	cmp	r3, #1
	bls	.L501
.L427:
	str	r10, [r4, #20]
	add	r4, r4, #576
	str	r10, [r4, #-548]
	str	r10, [r4, #-540]
	cmp	r4, r9
	beq	.L436
.L431:
	ldr	r3, [r4, #20]
	ldr	r0, [r4, #24]
	cmp	r3, #0
	bne	.L428
	ldr	r1, [r4, #28]
	cmp	r1, #0
	beq	.L427
	str	r3, [r1, #84]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L427
	b	.L428
.L491:
	ldr	r2, [r6, #24]
	movw	r1, #2117
	ldr	ip, [r6, #28]
	mov	r0, #14
	ldr	r3, .L506+36
	stmia	sp, {r2, ip}
	ldr	r2, .L506+40
	bl	dprint_normal
	ldr	r2, [r5, #40]
	ldr	r3, [r6]
	cmp	r2, r3
	ldrneb	r2, [r6, #5]	@ zero_extendqisi2
	beq	.L502
.L480:
	ldr	ip, [r6, #8]
.L481:
	ldr	r0, [r6, #12]
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
.L404:
	str	r1, [sp, #16]
	movw	r1, #2124
	str	r0, [sp, #12]
	mov	r0, #1
	str	r2, [sp, #4]
	mvn	r4, #0
	str	r3, [sp]
	str	ip, [sp, #8]
	ldr	r3, .L506+36
	ldr	r2, .L506+44
	bl	dprint_normal
	b	.L385
.L493:
	ldr	r3, .L506+28
	movw	r1, #2058
	ldr	r2, .L506+48
	mov	r0, #14
	bl	dprint_normal
	mov	r1, r8
	ldr	r0, [r5]
	mov	r4, r8
	bl	VCTRL_SetChanWaitFsFlag
	b	.L385
.L503:
	str	r10, [r4, #20]
	mov	r1, #0
	mov	r0, r4
	bl	FSP_SetDisplay_Share.isra.6
.L434:
	add	r4, r4, #576
	cmp	r4, r9
	beq	.L436
.L435:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L434
	b	.L503
.L413:
	ldr	r0, [r5]
	bl	FSP_CancelFsRequirement.isra.11
	ldr	ip, [r5, #16]
	b	.L414
.L501:
	cmp	r0, #0
	str	r10, [r4, #20]
	beq	.L427
	mov	r0, r4
	bl	FSP_IsDecFsUnLinked.part.1
	cmp	r0, #1
	bne	.L427
	ldr	r3, [r4, #24]
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #32]
	cmp	r3, r0
	strne	r10, [r3, #84]
	cmp	r1, #0
	strb	r10, [r3, #1]
	beq	.L430
	ldr	r3, [r4, #12]
	ldr	r0, [r1, #20]
	cmp	r0, r3
	streqb	r10, [r1, #1]
.L430:
	str	r10, [r4, #24]
	str	r10, [r4, #32]
	b	.L427
.L436:
	mov	r1, r6
	ldr	r3, [r7, #52]
	mov	r2, #36
	mov	r0, r8
	blx	r3
	ldr	r1, [fp, #-168]
	mov	r0, r5
	bl	FSP_GetFsRequirement
	cmp	r0, #0
	bne	.L504
	ldr	lr, [r5, #12]
	mov	r0, r5
	ldr	r2, [r5, #120]
	rsb	lr, lr, #32
	ldr	r3, [r5, #164]
	cmp	r2, lr
	ldr	ip, [r5, #20]
	ldr	r1, [fp, #-168]
	movcs	r4, lr
	movcc	r4, r2
	cmp	r3, #32
	ldr	r2, [r5, #96]
	rsb	ip, ip, #32
	str	r4, [r5, #120]
	movcc	lr, r3
	movcs	lr, #32
	ldr	r3, [r5, #104]
	cmp	r2, ip
	str	lr, [r5, #164]
	movcs	r2, ip
	cmp	r3, #32
	str	r2, [r5, #96]
	movcs	r3, #32
	str	r3, [r5, #104]
	bl	FSP_ReportFsRequirement
	cmp	r0, #0
	bne	.L505
	ldr	r2, [r5, #120]
	mov	r0, #1
	ldr	ip, [r5, #12]
	mov	r1, r0
	ldr	r3, [r5, #164]
	mov	r4, #2
	add	r2, r2, ip
	ldr	ip, [r5, #16]
	str	r2, [r5, #120]
	add	r3, r3, ip
	ldr	r2, [r5, #96]
	ldr	ip, [r5, #20]
	str	r3, [r5, #164]
	add	r2, r2, ip
	ldr	r3, [r5, #104]
	ldr	ip, [r5, #24]
	str	r0, [r5, #32]
	add	r3, r3, ip
	str	r2, [r5, #96]
	str	r3, [r5, #104]
	ldr	r0, [r5]
	bl	VCTRL_SetChanWaitFsFlag
	b	.L385
.L388:
	cmp	ip, #0
	beq	.L390
	mov	r0, r5
	bl	FSP_ReleaseDispFsRecord.part.13
	b	.L390
.L415:
	cmp	ip, #0
	beq	.L417
	mov	r0, r5
	bl	FSP_ReleaseDispFsRecord.part.13
	b	.L417
.L494:
	mov	r0, r5
	bl	FSP_ReleaseDecFsRecord.part.12
	b	.L395
.L496:
	mov	r0, r5
	bl	FSP_ReleaseMetadataRecord.part.15
	b	.L397
.L495:
	mov	r0, r5
	bl	FSP_ReleasePmvRecord.part.14
	b	.L396
.L489:
	ldr	r3, .L506+16
	movw	r1, #2565
	ldr	r2, .L506+52
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L476
.L500:
	mov	r0, r5
	bl	FSP_ReleaseMetadataRecord.part.15
	b	.L422
.L499:
	ldr	r3, .L506+32
	movw	r1, #2178
	ldr	r2, .L506+48
	mov	r0, #14
	bl	dprint_normal
	mov	r1, r4
	ldr	r0, [r5]
	bl	VCTRL_SetChanWaitFsFlag
	b	.L385
.L502:
	ldrb	r1, [r5, #45]	@ zero_extendqisi2
	ldrb	r2, [r6, #5]	@ zero_extendqisi2
	cmp	r1, r2
	bne	.L480
	ldr	r1, [r5, #48]
	ldr	ip, [r6, #8]
	cmp	r1, ip
	bne	.L481
	ldr	r0, [r5, #52]
	ldr	lr, [r6, #12]
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
	cmp	r0, lr
	movne	r0, lr
	bne	.L404
	ldrb	lr, [r5, #44]	@ zero_extendqisi2
	cmp	lr, r1
	bne	.L404
	ldr	r3, [r9, #48]
	mov	r2, #116
	mov	r1, #0
	sub	r0, fp, #160
	blx	r3
	ldr	r4, [r5, #120]
	ldr	r0, [r6, #24]
	rsb	r9, r4, #32
	ldr	r8, [r5, #96]
	cmp	r9, r0
	ldr	r3, [r6, #28]
	rsb	lr, r8, #32
	ldr	r2, [r5, #76]
	movcs	r9, r0
	cmp	lr, r3
	str	r9, [fp, #-116]
	movcs	lr, r3
	cmp	r2, #0
	str	lr, [fp, #-140]
	ldr	ip, [r5, #164]
	ldreq	r2, [fp, #-72]
	beq	.L439
	rsb	r2, ip, #32
	cmp	r2, r0
	movcs	r2, r0
	str	r2, [fp, #-72]
.L439:
	ldr	r3, [r5, #84]
	cmp	r3, #0
	ldr	r3, [r5, #104]
	ldreq	r1, [fp, #-132]
	beq	.L409
	rsb	r1, r3, #32
	cmp	r1, r0
	movcs	r1, r0
	str	r1, [fp, #-132]
.L409:
	ldr	r6, [r5, #168]
	add	r0, r9, r4
	add	r2, ip, r2
	ldr	r4, [r5, #124]
	ldr	ip, [r5, #100]
	add	r3, r3, r1
	str	r6, [fp, #-68]
	add	lr, lr, r8
	ldr	r6, [r5, #92]
	sub	r1, fp, #160
	str	r0, [r5, #120]
	mov	r0, r5
	str	r2, [r5, #164]
	str	lr, [r5, #96]
	str	r3, [r5, #104]
	str	r4, [fp, #-112]
	str	r6, [fp, #-144]
	str	ip, [fp, #-136]
	bl	FSP_ReportFsRequirement
	cmp	r0, #0
	moveq	r4, r0
	beq	.L385
	ldr	r3, .L506+36
	movw	r1, #2158
	ldr	r2, .L506+56
	mov	r0, #1
	bl	dprint_normal
	mvn	r4, #0
	b	.L385
.L486:
	ldr	ip, .L506+60
	movw	r1, #2555
	ldr	r3, .L506+16
	mov	r0, #0
	ldr	r2, .L506+64
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L476
.L497:
	ldr	r3, .L506+28
	movw	r1, #2092
	ldr	r2, .L506+68
	mov	r0, #1
	bl	dprint_normal
	mvn	r4, #0
	b	.L385
.L504:
	ldr	r3, .L506+32
	movw	r1, #2217
	ldr	r2, .L506+68
	mov	r0, #1
	bl	dprint_normal
	mvn	r4, #0
	b	.L385
.L498:
	ldr	r3, .L506+28
	movw	r1, #2100
	ldr	r2, .L506+56
	mov	r0, #1
	bl	dprint_normal
	mvn	r4, #0
	b	.L385
.L487:
	ldr	ip, .L506+72
	movw	r1, #2556
	ldr	r3, .L506+16
	ldr	r2, .L506+64
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L476
.L505:
	ldr	r3, .L506+32
	movw	r1, #2230
	ldr	r2, .L506+56
	mov	r0, #1
	bl	dprint_normal
	mvn	r4, #0
	b	.L385
.L507:
	.align	2
.L506:
	.word	.LANCHOR1
	.word	g_VfmwChanStat
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LANCHOR0+316
	.word	.LC35
	.word	.LC30
	.word	.LANCHOR0+336
	.word	.LANCHOR0+376
	.word	.LANCHOR0+356
	.word	.LC34
	.word	.LC36
	.word	.LC31
	.word	.LC29
	.word	.LC33
	.word	.LC25
	.word	.LC22
	.word	.LC32
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_ArrangeFsPool, .-FSP_ArrangeFsPool
	.align	2
	.global	FSP_SetFrameBufferMode
	.type	FSP_SetFrameBufferMode, %function
FSP_SetFrameBufferMode:
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
	ldr	r4, .L514
	mov	r5, r1
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L512
	cmp	r1, #1
	bhi	.L513
	ldr	r6, .L514+4
	mov	r0, #3
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #16]
	mov	r0, #3
	str	r5, [r2, #36]
	blx	r3
	mov	r0, #0
.L510:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L513:
	ldr	ip, .L514+8
	movw	r1, #2604
	ldr	r3, .L514+12
	mov	r0, #0
	ldr	r2, .L514+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L512:
	ldr	ip, .L514+20
	movw	r1, #2603
	ldr	r3, .L514+12
	ldr	r2, .L514+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L510
.L515:
	.align	2
.L514:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC37
	.word	.LANCHOR0+400
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_SetFrameBufferMode, .-FSP_SetFrameBufferMode
	.align	2
	.global	FSP_SetDispFsNum
	.type	FSP_SetDispFsNum, %function
FSP_SetDispFsNum:
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
	ldr	r4, .L522
	mov	r5, r1
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L520
	cmp	r1, #31
	bhi	.L521
	ldr	r6, .L522+4
	mov	r0, #3
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #16]
	mov	r0, #3
	str	r5, [r2, #164]
	blx	r3
	mov	r0, #0
.L518:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L521:
	str	r1, [sp]
	mov	r2, #32
	ldr	r3, .L522+8
	mov	r1, #2624
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L522+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L518
.L520:
	ldr	ip, .L522+16
	movw	r1, #2620
	ldr	r3, .L522+8
	ldr	r2, .L522+20
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L518
.L523:
	.align	2
.L522:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+424
	.word	.LC38
	.word	.LC28
	.word	.LC22
	UNWIND(.fnend)
	.size	FSP_SetDispFsNum, .-FSP_SetDispFsNum
	.align	2
	.global	FSP_BindRequireFs
	.type	FSP_BindRequireFs, %function
FSP_BindRequireFs:
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
	subs	r5, r1, #0
	beq	.L621
	ldr	r8, .L640
	add	r4, r8, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L622
	ldr	r7, .L640+4
	mov	r0, #3
	ldr	r3, [r7, #12]
	blx	r3
	ldrd	r2, [r5, #64]
	ldr	ip, [r5, #48]
	mov	r1, #0
	and	r0, r2, #16711680
	ldr	r4, [r4, #4]
	cmp	ip, #0
	mov	r6, r0, lsr #16
	orr	r6, r6, r1, asl #16
	beq	.L528
	ldrd	r2, [r5, #40]
	orrs	r3, r2, r3
	beq	.L623
.L528:
	cmp	r6, #3
	ldrls	pc, [pc, r6, asl #2]
	b	.L529
.L531:
	.word	.L530
	.word	.L532
	.word	.L533
	.word	.L534
.L534:
	ldr	r3, [r5, #56]
	ldr	r2, [r4, #100]
	cmp	r3, r2
	bne	.L624
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #104]
	cmp	r3, #31
	cmpls	r3, r2
	movcs	r6, #1
	movcc	r6, #0
	bcs	.L562
	cmp	r2, #0
	beq	.L563
	add	r3, r4, #24576
	ldrb	r3, [r3, #960]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L566
	b	.L625
.L567:
	add	r3, r3, #192
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L626
.L566:
	add	r6, r6, #1
	cmp	r6, r2
	mov	r9, r6, asl #4
	add	r3, r9, #25344
	bne	.L567
.L563:
	mvn	r2, #0
	ldr	r3, .L640+8
	str	r2, [sp]
	movw	r1, #2027
	ldr	r2, .L640+12
	mov	r0, #1
	bl	dprint_normal
	b	.L536
.L530:
	ldr	r3, [r5, #56]
	ldr	r2, [r4, #124]
	cmp	r3, r2
	bne	.L627
	ldr	r3, [r5, #144]
	ldr	r2, [r4, #108]
	cmp	r3, r2
	bne	.L628
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #120]
	cmp	r3, #31
	cmpls	r3, r1
	movcs	r6, #1
	movcc	r6, #0
	bcs	.L538
	cmp	r1, #0
	beq	.L539
	add	r3, r4, #16384
	ldrb	r3, [r3, #2240]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r3, r4, #18688
	addne	r3, r3, #32
	bne	.L542
	b	.L629
.L543:
	ldrb	r2, [r3], #96	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L630
.L542:
	add	r6, r6, #1
	cmp	r6, r1
	bne	.L543
.L539:
	mvn	r2, #0
	ldr	r3, .L640+16
	str	r2, [sp]
	movw	r1, #1876
	ldr	r2, .L640+12
	mov	r0, #1
	bl	dprint_normal
	b	.L536
.L532:
	ldr	r3, [r5, #56]
	ldr	r2, [r4, #168]
	cmp	r3, r2
	bne	.L631
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #164]
	cmp	r3, #31
	cmpls	r3, r1
	movcs	r6, #1
	movcc	r6, #0
	bcs	.L548
	cmp	r1, #0
	beq	.L549
	add	r3, r4, #20480
	ldrb	r3, [r3, #1216]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r3, r4, #21760
	addne	r3, r3, #32
	bne	.L552
	b	.L632
.L553:
	ldrb	r2, [r3], #96	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L633
.L552:
	add	r6, r6, #1
	cmp	r6, r1
	bne	.L553
.L549:
	mvn	r2, #0
	ldr	r3, .L640+20
	str	r2, [sp]
	movw	r1, #1940
	ldr	r2, .L640+12
	mov	r0, #1
	bl	dprint_normal
	b	.L536
.L533:
	ldr	r3, [r5, #56]
	ldr	r2, [r4, #92]
	cmp	r3, r2
	bne	.L634
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #96]
	cmp	r3, #31
	cmpls	r3, r1
	movcs	r6, #1
	movcc	r6, #0
	bcs	.L555
	cmp	r1, #0
	beq	.L556
	add	r3, r4, #24576
	ldrb	r3, [r3, #192]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r3, r4, #24576
	addne	r3, r3, #216
	bne	.L559
	b	.L635
.L560:
	ldrb	r2, [r3], #24	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L636
.L559:
	add	r6, r6, #1
	cmp	r6, r1
	bne	.L560
.L556:
	mvn	r2, #0
	ldr	r3, .L640+24
	str	r2, [sp]
	movw	r1, #1985
	ldr	r2, .L640+12
	mov	r0, #1
	bl	dprint_normal
	b	.L536
.L623:
	ldr	r2, [r5, #32]
	movw	r1, #2657
	str	r5, [sp]
	mov	r0, #1
	ldr	r3, .L640+28
	str	r2, [sp, #4]
	ldr	r2, .L640+32
	bl	dprint_normal
	b	.L528
.L529:
	str	r5, [sp]
	movw	r1, #2679
	ldr	r3, .L640+28
	mov	r0, #1
	ldr	r2, .L640+36
	bl	dprint_normal
.L536:
	mvn	r4, #0
.L568:
	ldr	r3, [r7, #16]
	mov	r0, #3
	blx	r3
	mov	r0, r4
.L611:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L636:
	cmn	r6, #1
	beq	.L556
.L557:
	mov	r3, r6, asl #5
	mov	r2, #24
	sub	r9, r3, r6, asl #3
	mov	r1, #0
	add	r0, r9, #24576
	ldr	r3, [r7, #48]
	add	r0, r0, #192
	movw	r10, #24768
	add	r0, r4, r0
	blx	r3
	add	r3, r4, r9
	add	r2, r3, #24576
	mov	r1, #1
	mov	r0, #0
	strb	r1, [r3, r10]
	strb	r0, [r2, #193]
	mov	r1, r2
	str	r6, [r2, #196]
	movw	ip, #24776
	ldr	lr, [r5, #48]
	movw	r0, #24784
	strb	lr, [r2, #194]
	ldr	r2, [r5, #32]
	str	r2, [r3, ip]
	ldr	r2, [r5, #56]
	str	r2, [r1, #204]
	ldr	r2, [r5, #56]
	mov	r2, r2, lsr #1
	str	r2, [r3, r0]
	ldr	r3, [r4, #20]
	add	r3, r3, #1
	str	r3, [r4, #20]
.L546:
	ldr	r3, [r4, #32]
	movw	r1, #2690
	ldr	r2, .L640+40
	mov	r0, #14
	cmp	r3, #2
	movne	r3, #2
	strne	r3, [r4, #32]
	ldr	ip, [r5, #56]
	mov	r3, r5
	str	ip, [sp, #4]
	ldr	ip, [r5, #32]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r8]
	cmp	r3, #1
	movne	r4, #0
	bne	.L568
	ldr	r6, [r5, #32]
	ldr	r5, [r5, #56]
	mov	r0, r6
	bl	MEM_Phy2Vir
	subs	r4, r0, #0
	beq	.L637
	add	r0, r4, r5
	movw	r3, #52445
	movt	r3, 43707
	mov	r4, #0
	str	r3, [r0, #-4]
	b	.L568
.L626:
	cmn	r6, #1
	beq	.L563
.L564:
	add	r0, r6, #1584
	add	r9, r4, r9
	add	r0, r0, #12
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, r0, lsl #4
	blx	r3
	add	r2, r9, #24576
	mov	ip, #1
	mov	r0, #0
	str	r6, [r2, #964]
	movw	r1, #25544
	strb	ip, [r2, #960]
	add	r3, r9, #25344
	strb	r0, [r2, #961]
	ldr	r2, [r5, #32]
	str	r2, [r9, r1]
	ldr	r2, [r5, #56]
	str	r2, [r3, #204]
	ldr	r3, [r4, #24]
	add	r3, r3, ip
	str	r3, [r4, #24]
	b	.L546
.L633:
	cmn	r6, #1
	beq	.L549
.L550:
	mov	r3, r6, asl #7
	mov	r2, #96
	sub	r9, r3, r6, asl #5
	mov	r1, #0
	add	r0, r9, #21504
	ldr	r3, [r7, #48]
	add	r0, r0, #192
	movw	r10, #21696
	add	r0, r4, r0
	blx	r3
	add	r3, r4, r9
	add	r1, r3, #21504
	mov	r2, #1
	strb	r2, [r3, r10]
	movw	r9, #21736
	str	r6, [r1, #228]
	mov	r2, r1
	ldr	ip, [r5, #48]
	mov	r1, r2
	movw	lr, #21744
	add	r0, r3, #21760
	strb	ip, [r2, #194]
	movw	ip, #21768
	ldr	r6, [r5, #32]
	str	r6, [r2, #196]
	ldr	r2, [r5, #56]
	str	r2, [r3, r9]
	ldr	r2, [r4, #180]
	str	r2, [r1, #236]
	ldr	r2, [r4, #184]
	str	r2, [r3, lr]
	ldr	r2, [r4, #172]
	str	r2, [r0]
	ldr	r2, [r4, #176]
	str	r2, [r0, #4]
	ldr	r2, [r4, #188]
	str	r2, [r3, ip]
	ldr	r3, [r4, #16]
	add	r3, r3, #1
	str	r3, [r4, #16]
	b	.L546
.L630:
	cmn	r6, #1
	beq	.L539
.L540:
	mov	r10, r6, asl #5
	mov	r9, r6, asl #7
	rsb	r3, r10, r9
	mov	r2, #96
	add	r0, r3, #18432
	str	r3, [fp, #-48]
	add	r0, r0, #192
	mov	r1, #0
	ldr	r3, [r7, #48]
	add	r0, r4, r0
	blx	r3
	ldr	r3, [fp, #-48]
	movw	r1, #18624
	mov	r2, #1
	add	r3, r4, r3
	add	ip, r3, #18432
	strb	r2, [r3, r1]
	mov	r0, ip
	str	r6, [ip, #228]
	ldr	ip, [r5, #48]
	ldr	r1, .L640+4
	strb	ip, [r0, #194]
	ldr	ip, [r5, #32]
	str	ip, [r0, #196]
	ldrsb	r0, [r5, #80]
	cmp	r0, #0
	bne	.L638
.L544:
	ldr	r1, [r5, #56]
	rsb	r9, r10, r9
	add	r9, r4, r9
	movw	r2, #18664
	add	r3, r9, #18432
	movw	r0, #18672
	str	r1, [r9, r2]
	ldr	r1, [r4, #136]
	mov	r2, r3
	str	r1, [r3, #236]
	movw	r1, #18680
	ldr	r3, [r4, #140]
	str	r3, [r9, r0]
	mov	r3, r2
	ldr	r0, [r4, #148]
	str	r0, [r2, #244]
	add	r2, r9, #18688
	ldr	r0, [r4, #152]
	str	r0, [r9, r1]
	movw	r1, #18696
	ldr	r0, [r4, #156]
	str	r0, [r3, #252]
	ldr	r3, [r4, #128]
	str	r3, [r2]
	ldr	r3, [r4, #132]
	str	r3, [r2, #4]
	ldr	r3, [r4, #144]
	str	r3, [r9, r1]
	ldr	r3, [r4, #12]
	add	r3, r3, #1
	str	r3, [r4, #12]
	b	.L546
.L638:
	ldr	r0, [r5, #120]
	add	r3, r3, #18432
	str	r2, [fp, #-52]
	str	r1, [fp, #-48]
	str	r0, [r3, #204]
	bl	MEM_Phy2Vir
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-52]
	cmp	r0, #0
	beq	.L639
	ldr	r3, [r1, #48]
	mov	r2, #32
	mov	r1, #255
	blx	r3
	b	.L544
.L562:
	str	r2, [sp, #4]
	movw	r1, #2019
	mov	r2, #32
	str	r3, [sp]
	str	r2, [sp, #8]
	mov	r0, #1
	ldr	r3, .L640+8
	ldr	r2, .L640+44
	bl	dprint_normal
	b	.L536
.L555:
	str	r1, [sp, #4]
	mov	r2, #32
	str	r3, [sp]
	movw	r1, #1977
	str	r2, [sp, #8]
	mov	r0, #1
	ldr	r3, .L640+24
	ldr	r2, .L640+48
	bl	dprint_normal
	b	.L536
.L548:
	str	r1, [sp, #4]
	mov	r2, #32
	str	r3, [sp]
	movw	r1, #1932
	str	r2, [sp, #8]
	mov	r0, #1
	ldr	r3, .L640+20
	ldr	r2, .L640+44
	bl	dprint_normal
	b	.L536
.L538:
	str	r1, [sp, #4]
	mov	r2, #32
	str	r3, [sp]
	movw	r1, #1868
	str	r2, [sp, #8]
	mov	r0, #1
	ldr	r3, .L640+16
	ldr	r2, .L640+44
	bl	dprint_normal
	b	.L536
.L634:
	str	r2, [sp, #8]
	movw	r1, #1971
	str	r3, [sp, #4]
	mov	r0, #14
	str	r5, [sp]
	ldr	r3, .L640+24
	ldr	r2, .L640+52
	bl	dprint_normal
	b	.L536
.L631:
	str	r2, [sp, #8]
	movw	r1, #1926
	str	r3, [sp, #4]
	mov	r0, #14
	str	r5, [sp]
	ldr	r3, .L640+20
	ldr	r2, .L640+52
	bl	dprint_normal
	b	.L536
.L627:
	str	r2, [sp, #8]
	mov	r1, #1856
	str	r3, [sp, #4]
	mov	r0, #14
	str	r5, [sp]
	ldr	r3, .L640+16
	ldr	r2, .L640+52
	bl	dprint_normal
	b	.L536
.L624:
	str	r2, [sp, #8]
	movw	r1, #2013
	str	r3, [sp, #4]
	mov	r0, #14
	str	r5, [sp]
	ldr	r3, .L640+8
	ldr	r2, .L640+52
	bl	dprint_normal
	b	.L536
.L628:
	add	r5, r5, #88
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	movw	r1, #1862
	str	r5, [sp]
	mov	r0, #14
	ldr	r3, .L640+16
	ldr	r2, .L640+52
	bl	dprint_normal
	b	.L536
.L625:
	mov	r6, r3
	mov	r9, r3
	b	.L564
.L632:
	mov	r6, r3
	b	.L550
.L635:
	mov	r6, r3
	b	.L557
.L629:
	mov	r6, r3
	b	.L540
.L622:
	ldr	ip, .L640+56
	movw	r1, #2646
	ldr	r3, .L640+28
	ldr	r2, .L640+60
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L611
.L637:
	str	r5, [sp, #4]
	movw	r1, #2254
	str	r6, [sp]
	mov	r0, #32
	ldr	r3, .L640+64
	ldr	r2, .L640+68
	bl	dprint_normal
	b	.L568
.L621:
	ldr	ip, .L640+72
	mov	r0, r5
	ldr	r3, .L640+28
	movw	r1, #2645
	ldr	r2, .L640+60
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L611
.L639:
	mov	r0, r2
	ldr	r3, .L640+16
	ldr	r2, .L640+76
	movw	r1, #1898
	bl	dprint_normal
	b	.L536
.L641:
	.align	2
.L640:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+508
	.word	.LC42
	.word	.LANCHOR0+464
	.word	.LANCHOR0+480
	.word	.LANCHOR0+496
	.word	.LANCHOR0+444
	.word	.LC13
	.word	.LC45
	.word	.LC46
	.word	.LC41
	.word	.LC44
	.word	.LC40
	.word	.LC28
	.word	.LC22
	.word	.LANCHOR0+524
	.word	.LC19
	.word	.LC39
	.word	.LC43
	UNWIND(.fnend)
	.size	FSP_BindRequireFs, .-FSP_BindRequireFs
	.align	2
	.global	FSP_BindExternFs
	.type	FSP_BindExternFs, %function
FSP_BindExternFs:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	subs	r10, r1, #0
	beq	.L665
	ldr	r2, .L671
	add	r4, r2, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L666
	ldr	r2, [r10, #32]
	tst	r2, #15
	bne	.L667
	ldr	r8, .L671+4
	mov	r0, #3
	ldr	r2, [r8, #12]
	blx	r2
	ldr	r6, [r4, #4]
	ldr	r2, [r10, #56]
	ldr	r1, [r6, #168]
	cmp	r2, r1
	bne	.L668
	ldr	r2, [r6, #16]
	ldr	r0, [r6, #164]
	cmp	r2, #31
	cmpls	r2, r0
	movcs	r4, #1
	movcc	r4, #0
	bcs	.L649
	cmp	r0, #0
	beq	.L650
	add	r2, r6, #20480
	ldrb	r2, [r2, #1216]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r2, r6, #21760
	addne	r2, r2, #32
	bne	.L653
	b	.L669
.L654:
	ldrb	r3, [r2], #96	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L670
.L653:
	add	r4, r4, #1
	cmp	r4, r0
	bne	.L654
.L650:
	ldr	r3, .L671+8
	movw	r1, #2746
	ldr	r2, .L671+12
	mov	r0, #1
	bl	dprint_normal
	b	.L648
.L670:
	cmn	r4, #1
	beq	.L650
.L651:
	mov	r5, r4, asl #7
	ldr	r7, [r8, #48]
	sub	r5, r5, r4, asl #5
	mov	r2, #96
	add	r0, r5, #21504
	mov	r1, #0
	add	r0, r0, #192
	add	r5, r6, r5
	add	r0, r6, r0
	movw	r9, #21696
	blx	r7
	add	r2, r5, #21504
	mov	r1, #1
	strb	r1, [r5, r9]
	mov	r7, r2
	str	r4, [r2, #228]
	ldr	r2, [r10, #48]
	add	r4, r6, r4, lsl #4
	add	r9, r4, #24576
	movw	lr, #21704
	movw	r3, #21736
	movw	r1, #21728
	strb	r2, [r7, #194]
	ldr	ip, [r10, #32]
	str	r1, [fp, #-48]
	str	ip, [r7, #196]
	movw	ip, #21744
	ldr	r4, [r10, #40]
	str	r4, [r5, lr]
	ldr	lr, [r10, #56]
	str	lr, [r5, r3]
	movw	r3, #21712
	ldr	lr, [r10, #184]
	str	lr, [r5, r3]
	movw	lr, #21720
	ldrd	r2, [r10, #192]
	strd	r2, [r5, lr]
	add	r3, r5, #21760
	ldr	lr, [r10, #208]
	str	lr, [r5, r1]
	movw	lr, #21768
	ldr	r4, [r6, #180]
	str	r4, [r7, #236]
	mov	r4, #0
	ldr	r0, [r6, #184]
	str	r0, [r5, ip]
	mov	r0, #3
	ldr	ip, [r6, #172]
	str	ip, [r3]
	ldr	ip, [r6, #176]
	str	ip, [r3, #4]
	ldr	r3, [r6, #188]
	str	r3, [r5, lr]
	ldr	r3, [r6, #16]
	add	r3, r3, #1
	str	r3, [r6, #16]
	strb	r4, [r9, #961]
	ldr	r3, [r8, #16]
	strb	r4, [r9, #962]
	blx	r3
	ldr	r1, [fp, #-48]
	ldr	r3, .L671+8
	mov	r0, #14
	ldr	r2, .L671+16
	ldr	ip, [r5, r1]
	movw	r1, #2780
	str	ip, [sp, #24]
	movw	ip, #21720
	ldrd	r8, [r5, ip]
	movw	ip, #21712
	strd	r8, [sp, #16]
	ldr	ip, [r5, ip]
	str	ip, [sp, #12]
	movw	ip, #21736
	ldr	ip, [r5, ip]
	str	ip, [sp, #8]
	ldr	ip, [r7, #196]
	str	ip, [sp, #4]
	ldr	ip, [r6, #16]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
.L644:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L649:
	mov	r3, #32
	str	r0, [sp, #4]
	str	r2, [sp]
	movw	r1, #2738
	str	r3, [sp, #8]
	mov	r0, #1
	ldr	r3, .L671+8
	ldr	r2, .L671+20
	bl	dprint_normal
.L648:
	ldr	r3, [r8, #16]
	mov	r0, #3
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L667:
	str	r2, [sp]
	mov	r1, #2720
	ldr	r3, .L671+8
	mov	r0, #1
	ldr	r2, .L671+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L644
.L668:
	str	r1, [sp, #8]
	mov	r0, #14
	str	r2, [sp, #4]
	movw	r1, #2731
	str	r10, [sp]
	ldr	r3, .L671+8
	ldr	r2, .L671+28
	bl	dprint_normal
	b	.L648
.L669:
	mov	r4, r2
	b	.L651
.L666:
	ldr	ip, .L671+32
	movw	r1, #2713
	ldr	r3, .L671+8
	ldr	r2, .L671+36
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L644
.L665:
	ldr	ip, .L671+40
	mov	r0, r10
	ldr	r3, .L671+8
	movw	r1, #2712
	ldr	r2, .L671+36
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L644
.L672:
	.align	2
.L671:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+544
	.word	.LC42
	.word	.LC49
	.word	.LC41
	.word	.LC48
	.word	.LC40
	.word	.LC28
	.word	.LC22
	.word	.LC47
	UNWIND(.fnend)
	.size	FSP_BindExternFs, .-FSP_BindExternFs
	.align	2
	.global	FSP_IsNewFsAvailable
	.type	FSP_IsNewFsAvailable, %function
FSP_IsNewFsAvailable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 576
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #588)
	sub	sp, sp, #588
	cmp	r0, #3
	mov	r5, r0
	bhi	.L690
	ldr	r4, .L694
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L691
	ldr	r6, .L694+4
	mov	r0, #3
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r0, [r4, #4]
	ldr	r3, [r0, #120]
	cmp	r3, #0
	movne	r3, r0
	movne	r2, #0
	bne	.L680
	b	.L692
.L678:
	add	r2, r2, #1
	add	r3, r3, #576
	cmp	r2, #32
	beq	.L681
.L680:
	ldrsb	r1, [r3, #192]
	cmp	r1, #0
	bne	.L678
	ldr	r1, [r3, #212]
	cmp	r1, #0
	bne	.L678
	mov	r3, r2, asl #9
	add	r3, r3, r2, lsl #6
	add	r1, r3, #192
	add	r3, r0, r3
	cmn	r0, r1
	str	r2, [r3, #196]
	beq	.L681
	sub	r1, fp, #604
	bl	FSP_FindOneGroupFs
	cmp	r0, #0
	beq	.L693
.L681:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mov	r3, #0
.L688:
	mov	r0, r3
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L692:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L693:
	ldr	r4, .L694+8
	mov	r0, #3
	ldr	r3, [r6, #16]
	blx	r3
	mov	r3, #100
	mla	r4, r3, r5, r4
	ldr	r2, .L694+4
	add	r4, r4, #16
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movne	r3, #1
	bne	.L688
	ldr	r3, [r2]
	blx	r3
	mov	r3, #1
	str	r0, [r4, #4]
	b	.L688
.L690:
	ldr	ip, .L694+12
	movw	r1, #2870
	ldr	r3, .L694+16
	mov	r0, #0
	ldr	r2, .L694+20
	str	ip, [sp]
	bl	dprint_normal
	mvn	r3, #0
	b	.L688
.L691:
	ldr	ip, .L694+24
	movw	r1, #2871
	ldr	r3, .L694+16
	ldr	r2, .L694+20
	str	ip, [sp]
	bl	dprint_normal
	mvn	r3, #0
	b	.L688
.L695:
	.align	2
.L694:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwChanStat
	.word	.LC25
	.word	.LANCHOR0+564
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_IsNewFsAvailable, .-FSP_IsNewFsAvailable
	.align	2
	.global	FSP_NewLogicFs
	.type	FSP_NewLogicFs, %function
FSP_NewLogicFs:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	cmp	r0, #3
	str	r0, [fp, #-48]
	mov	r9, r1
	bhi	.L741
	ldr	r3, [fp, #-48]
	ldr	r4, .L753
	add	r4, r4, r3, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L742
	ldr	r10, .L753+4
	mov	r0, #3
	ldr	r3, [r10, #12]
	blx	r3
	ldr	r5, [r4, #4]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #76]
	cmp	r9, #1
	cmpeq	r3, #0
	moveq	r9, #0
	bl	VCTRL_IfNoGapEnable
	mov	r3, r5
	mov	r2, #0
	str	r0, [fp, #-60]
	b	.L703
.L701:
	add	r2, r2, #1
	add	r3, r3, #576
	cmp	r2, #32
	beq	.L719
.L703:
	ldrsb	r1, [r3, #192]
	cmp	r1, #0
	bne	.L701
	ldr	r1, [r3, #212]
	cmp	r1, #0
	bne	.L701
	mov	r3, r2, asl #6
	mov	r0, r2, asl #9
	add	r7, r3, r0
	str	r3, [fp, #-52]
	add	r4, r7, #192
	add	r8, r5, r7
	adds	r4, r5, r4
	str	r0, [fp, #-56]
	str	r2, [r8, #196]
	beq	.L719
	cmp	r9, #3
	beq	.L743
	mov	r1, r4
	mov	r0, r5
	bl	FSP_FindOneGroupFs
	cmp	r0, #0
	bne	.L744
	add	r7, r7, #232
	ldr	r6, [r8, #216]
	add	r0, r5, r7
	ldr	r3, [r8, #228]
	ldr	r7, [r8, #220]
	ldr	r1, [r8, #224]
.L721:
	mov	r2, #1
	str	r2, [r6, #84]
	ldr	ip, [r5, #4]
	cmp	r9, r2
	str	ip, [r6, #76]
	beq	.L745
	str	r2, [r7, #84]
	ldr	r2, [r5, #4]
	str	r2, [r7, #76]
.L722:
	cmp	r1, #0
	ldrne	r2, [r5, #4]
	strne	r2, [r1, #20]
.L705:
	ldr	r2, [fp, #-56]
	mov	lr, #1
	str	r3, [fp, #-64]
	mov	r1, #0
	ldr	r3, [fp, #-52]
	add	r8, r3, r2
	mov	r2, #536
	add	r8, r5, r8
	str	r9, [r8, #208]
	ldr	ip, [r5, #4]
	str	lr, [r8, #212]
	add	lr, ip, lr
	str	ip, [r8, #204]
	str	lr, [r5, #4]
	ldr	r9, [r10, #48]
	blx	r9
	ldr	r1, [r8, #196]
	add	r2, r4, #528
	str	r1, [r4, #128]
	ldr	r1, [r5, #48]
	str	r1, [r4, #72]
	ldr	r1, [r5, #52]
	str	r1, [r4, #76]
	ldr	r1, [r5, #56]
	str	r1, [r4, #80]
	ldr	r1, [r5, #60]
	str	r1, [r4, #84]
	ldr	r1, [r6, #44]
	str	r1, [r4, #412]
	ldr	r1, [r6, #48]
	str	r1, [r4, #416]
	ldr	r1, [r6, #52]
	str	r1, [r4, #428]
	ldr	r1, [r6, #64]
	str	r1, [r4, #420]
	ldr	r1, [r6, #68]
	str	r1, [r4, #424]
	ldr	r1, [r6, #4]
	str	r1, [r4, #440]
	ldr	r1, [r6, #12]
	str	r1, [r4, #444]
	ldr	r0, [r6, #4]
	ldr	r1, [r6, #72]
	add	r1, r1, r0
	str	r1, [r4, #448]
	ldr	r0, [r6, #4]
	ldr	r1, [r6, #56]
	add	r1, r1, r0
	str	r1, [r4, #452]
	ldr	r0, [r6, #4]
	ldr	r1, [r6, #60]
	add	r1, r1, r0
	str	r1, [r4, #456]
	ldrb	r1, [r5, #117]	@ zero_extendqisi2
	strb	r1, [r4, #409]
	ldrb	r1, [r5, #116]	@ zero_extendqisi2
	strb	r1, [r4, #408]
	ldr	r1, [r7, #44]
	str	r1, [r4, #464]
	ldr	r1, [r7, #48]
	str	r1, [r4, #468]
	ldr	r1, [r7, #52]
	str	r1, [r4, #480]
	ldr	r1, [r7, #64]
	str	r1, [r4, #472]
	ldr	r1, [r7, #68]
	str	r1, [r4, #476]
	ldr	r1, [r7, #4]
	str	r1, [r4, #484]
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #72]
	add	r1, r1, r0
	str	r1, [r4, #492]
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #56]
	add	r1, r1, r0
	str	r1, [r4, #504]
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #60]
	add	r1, r1, r0
	str	r1, [r4, #508]
	ldrb	r1, [r5, #161]	@ zero_extendqisi2
	strb	r1, [r4, #460]
	ldr	r1, [r7, #16]
	str	r1, [r4, #512]
	ldrd	r0, [r7, #24]
	strd	r0, [r2, #-8]
	ldr	r2, [r7, #32]
	str	r2, [r4, #528]
	ldr	r3, [fp, #-60]
	ldrb	r2, [r4, #198]	@ zero_extendqisi2
	bfi	r2, r3, #3, #1
	strb	r2, [r4, #198]
	ldr	r2, [r5, #76]
	ldr	r3, [fp, #-64]
	cmp	r2, #0
	beq	.L715
	ldrb	r1, [r5, #162]	@ zero_extendqisi2
	ldrb	r2, [r4, #198]	@ zero_extendqisi2
	str	r1, [r4, #116]
	ldrb	r1, [r5, #161]	@ zero_extendqisi2
	str	r1, [r4, #108]
	ldrb	r1, [r5, #160]	@ zero_extendqisi2
	bfi	r2, r1, #1, #1
	strb	r2, [r4, #198]
.L716:
	cmp	r3, #0
	beq	.L717
	ldr	r2, [r3, #8]
	mov	r1, #1
	strb	r1, [r3, #1]
	str	r3, [fp, #-60]
	str	r2, [r4, #316]
	ldr	r0, [r3, #8]
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-60]
	mov	r1, #0
	str	r1, [r4, #324]
	str	r0, [r4, #320]
	ldr	r3, [r3, #12]
	str	r3, [r4, #312]
.L717:
	ldr	r3, [r10, #16]
	mov	r0, #3
	blx	r3
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-52]
	movw	r1, #3084
	ldr	r7, .L753+4
	add	r3, r3, r2
	ldr	r2, .L753+8
	add	r5, r5, r3
	add	r6, r5, #192
	ldr	r0, [r5, #220]
	ldr	ip, [r5, #216]
	ldr	r3, [r5, #196]
	ldr	lr, [r0, #76]
	str	lr, [sp, #16]
	ldr	lr, [r0, #36]
	mov	r0, #14
	str	lr, [sp, #12]
	ldr	lr, [ip, #76]
	str	lr, [sp, #8]
	ldr	ip, [ip, #36]
	str	ip, [sp, #4]
	ldr	ip, [r5, #204]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r0, [r5, #196]
	cmp	r0, #0
	blt	.L729
	ldr	r3, .L753+12
	mov	r4, #100
	ldr	r2, [fp, #-48]
	mla	r4, r4, r2, r3
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L746
.L729:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L743:
	add	r6, r5, #18432
	add	r7, r7, #232
	add	r6, r6, #192
	add	r0, r5, r7
	str	r1, [r8, #228]
	mov	r3, r1
	str	r1, [r8, #224]
	mov	r7, r6
	str	r6, [r8, #216]
	str	r6, [r8, #220]
	b	.L705
.L715:
	ldrb	r1, [r5, #118]	@ zero_extendqisi2
	ldrb	r2, [r4, #198]	@ zero_extendqisi2
	str	r1, [r4, #116]
	ldrb	r1, [r5, #117]	@ zero_extendqisi2
	str	r1, [r4, #108]
	ldrb	r1, [r5, #116]	@ zero_extendqisi2
	bfi	r2, r1, #1, #1
	strb	r2, [r4, #198]
	b	.L716
.L719:
	ldr	r3, [r10, #16]
	mov	r0, #3
	blx	r3
	ldr	r3, .L753+16
	ldr	r2, .L753+20
	movw	r1, #2948
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L746:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r4, #72]
	ldr	r1, [r4, #68]
	mov	r2, #0
	str	r2, [r4, #68]
	str	r2, [r4, #72]
	str	r2, [r4, #64]
	rsb	ip, r3, r0
	rsb	r0, r1, r0
	str	ip, [r4, #80]
	rsb	r3, r1, r3
	str	r0, [r4, #84]
	str	r3, [r4, #76]
	ldr	r0, [r6, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L745:
	ldr	r2, [r6, #80]
	add	r2, r2, #1
	str	r2, [r6, #80]
	str	r9, [r7, #84]
	ldr	ip, [r5, #4]
	ldr	r2, [r7, #80]
	str	ip, [r7, #76]
	add	r2, r2, #1
	str	r2, [r7, #80]
	b	.L722
.L744:
	ldr	r2, [r8, #216]
	add	r3, r8, #216
	cmp	r2, #0
	beq	.L747
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L748
	ldr	r3, [r8, #224]
	cmp	r3, #0
	beq	.L749
.L710:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-56]
	add	r6, r3, r2
	add	r6, r5, r6
	add	r6, r6, #224
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L750
.L712:
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	add	r2, r2, r1
	add	r1, r5, r2
	add	r2, r2, #232
	add	r0, r5, r2
	ldr	r6, [r1, #216]
	ldr	r7, [r1, #220]
	ldr	r1, [r1, #224]
	b	.L721
.L750:
	add	r3, r5, #24576
	ldrb	r3, [r3, #960]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L751
	ldr	r2, .L753+24
	movw	r1, #973
	mov	r0, #1
	bl	dprint_normal
	add	r3, r5, #25344
	add	r3, r3, #192
	str	r3, [r6, #4]
	b	.L712
.L749:
	add	r3, r5, #24576
	ldrb	r3, [r3, #192]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L752
	ldr	r2, .L753+28
	movw	r1, #961
	mov	r0, #1
	bl	dprint_normal
	add	r3, r5, #24576
	add	r3, r3, #192
	str	r3, [r8, #224]
	b	.L710
.L741:
	ldr	ip, .L753+32
	movw	r1, #2926
	ldr	r3, .L753+16
	mov	r0, #0
	ldr	r2, .L753+36
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L729
.L742:
	ldr	ip, .L753+40
	movw	r1, #2927
	ldr	r3, .L753+16
	ldr	r2, .L753+36
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L729
.L751:
	ldr	r2, .L753+44
	movw	r1, #969
	mov	r0, #1
	bl	dprint_normal
.L708:
	ldr	r3, [r10, #16]
	mov	r0, #3
	blx	r3
	ldr	r3, .L753+16
	ldr	r2, .L753+48
	movw	r1, #2972
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L729
.L752:
	ldr	r2, .L753+52
	movw	r1, #957
	mov	r0, #1
	bl	dprint_normal
	b	.L708
.L748:
	ldr	r2, .L753+56
	movw	r1, #949
	mov	r0, #1
	bl	dprint_normal
	b	.L708
.L747:
	ldr	r2, .L753+60
	movw	r1, #943
	mov	r0, #1
	bl	dprint_normal
	b	.L708
.L754:
	.align	2
.L753:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	g_VfmwChanStat
	.word	.LANCHOR0+588
	.word	.LC50
	.word	.LC56
	.word	.LC54
	.word	.LC25
	.word	.LC22
	.word	.LC28
	.word	.LC55
	.word	.LC58
	.word	.LC53
	.word	.LC52
	.word	.LC51
	UNWIND(.fnend)
	.size	FSP_NewLogicFs, .-FSP_NewLogicFs
	.align	2
	.global	FSP_SetRef
	.type	FSP_SetRef, %function
FSP_SetRef:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	cmp	r0, #3
	mov	r6, r2
	ldrhi	ip, .L815
	movwhi	r1, #3229
	bhi	.L804
	cmp	r1, #31
	bhi	.L806
	ldr	r3, .L815+4
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L807
	ldr	r7, .L815+8
	mov	r0, #3
	mov	r8, r1, asl #6
	mov	r5, r1, asl #9
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r4, [r4, #4]
	add	r3, r8, r5
	add	r3, r4, r3
	add	r0, r3, #192
	ldr	r2, [r3, #208]
	strb	r6, [r3, #192]
	cmp	r2, #0
	beq	.L808
	sub	r2, r2, #1
	cmp	r2, #1
	bls	.L809
.L762:
	ldr	r3, [r7, #16]
	mov	r0, #3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L806:
	ldr	ip, .L815+12
	movw	r1, #3230
.L804:
	ldr	r3, .L815+16
	mov	r0, #0
	ldr	r2, .L815+20
	str	ip, [sp]
	bl	dprint_normal
.L755:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L808:
	ldr	ip, [r3, #216]
	add	r10, r3, #216
	ldr	r9, [r3, #224]
	cmp	ip, #0
	beq	.L762
	add	r3, r3, #200
	ldr	lr, [ip, #76]
	ldr	r1, [r3, #4]
	cmp	lr, r1
	bne	.L810
	cmp	r6, #1
	beq	.L811
	ldr	r3, [r10, #4]
	strb	r2, [ip, #1]
	cmp	ip, r3
	strne	r2, [ip, #84]
	cmp	r9, #0
	beq	.L770
	add	r3, r8, r5
	ldr	r2, [r9, #20]
	add	r3, r4, r3
	ldr	r3, [r3, #204]
	cmp	r2, r3
	moveq	r3, #0
	streqb	r3, [r9, #1]
.L770:
	add	r1, r8, r5
	mov	r2, #0
	add	r3, r4, r1
	str	r2, [r3, #216]
	str	r2, [r3, #224]
	b	.L762
.L807:
	ldr	ip, .L815+24
	movw	r1, #3231
	ldr	r3, .L815+16
	ldr	r2, .L815+20
	str	ip, [sp]
	bl	dprint_normal
	b	.L755
.L810:
	str	r1, [sp, #16]
	movw	r1, #286
	ldr	r2, [r0, #4]
	mov	r0, #1
	str	lr, [sp, #8]
	ldr	r3, .L815+28
	str	r2, [sp, #12]
	ldr	ip, [ip, #36]
	ldr	r2, .L815+32
	stmia	sp, {r6, ip}
	bl	dprint_normal
	b	.L762
.L809:
	ldr	r2, [r3, #216]
	ldr	lr, [r3, #224]
	cmp	r2, #0
	beq	.L762
	add	r3, r3, #200
	ldr	ip, [r2, #76]
	ldr	r1, [r3, #4]
	cmp	ip, r1
	bne	.L812
	cmp	r6, #1
	beq	.L813
	ldr	r3, [r2, #80]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r2, #80]
	add	r3, r8, r5
	add	r6, r4, r3
	ldr	r9, [r6, #212]
	cmp	r9, #0
	bne	.L777
	add	r0, r3, #192
	add	r0, r4, r0
	bl	FSP_IsDecFsUnLinked.part.1
	cmp	r0, #1
	bne	.L777
	ldr	r3, [r6, #216]
	ldr	r1, [r6, #220]
	ldr	r2, [r6, #224]
	cmp	r3, r1
	strne	r9, [r3, #84]
	cmp	r2, #0
	strb	r9, [r3, #1]
	beq	.L779
	add	r3, r8, r5
	ldr	r1, [r2, #20]
	add	r3, r4, r3
	ldr	r3, [r3, #204]
	cmp	r1, r3
	moveq	r3, #0
	streqb	r3, [r2, #1]
.L779:
	add	r3, r8, r5
	mov	r2, #0
	add	r3, r4, r3
	str	r2, [r3, #216]
	str	r2, [r3, #224]
.L777:
	add	r3, r8, r5
	add	r3, r4, r3
	ldrsb	r1, [r3, #192]
	cmp	r1, #0
	bne	.L762
	ldr	r2, [r3, #220]
	cmp	r2, #0
	beq	.L762
	ldr	ip, [r2, #76]
	ldr	r0, [r3, #204]
	cmp	ip, r0
	bne	.L762
	ldr	r0, [r2, #80]
	cmp	r0, #0
	bgt	.L762
	ldr	r0, [r3, #216]
	ldr	r3, [r3, #228]
	cmp	r0, r2
	strneb	r1, [r2, #1]
	mov	r1, #0
	cmp	r3, #0
	str	r1, [r2, #84]
	mov	r2, #0
	strneb	r1, [r3, #1]
	add	r1, r8, r5
	add	r3, r4, r1
	add	r1, r3, #216
	str	r2, [r1, #4]
	str	r2, [r3, #228]
	b	.L762
.L811:
	cmp	r9, #0
	strb	r6, [ip, #1]
	beq	.L765
	ldr	r3, [r3, #4]
	ldr	r2, [r9, #20]
	cmp	r2, r3
	streqb	r6, [r9, #1]
.L765:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L766
	ldr	r3, [ip, #84]
	cmp	r3, #1
	beq	.L766
.L775:
	add	r3, r8, r5
	add	r3, r4, r3
	add	r3, r3, #208
	ldr	r2, [r3, #4]
	cmp	r2, #1
	moveq	r2, #2
	streq	r2, [r3, #4]
	b	.L762
.L812:
	str	r1, [sp, #16]
	movw	r1, #334
	ldr	lr, [r0, #4]
	mov	r0, #1
	str	ip, [sp, #8]
	ldr	r3, .L815+36
	str	lr, [sp, #12]
	ldr	ip, [r2, #36]
	ldr	r2, .L815+32
	stmia	sp, {r6, ip}
	bl	dprint_normal
	b	.L762
.L766:
	mov	r3, #2
	str	r3, [ip, #84]
	b	.L775
.L813:
	cmp	lr, #0
	strb	r6, [r2, #1]
	beq	.L773
	ldr	r3, [r3, #4]
	ldr	r1, [lr, #20]
	cmp	r1, r3
	beq	.L814
.L773:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L774
	ldr	r3, [r2, #84]
	cmp	r3, #1
	bne	.L775
.L774:
	mov	r3, #2
	str	r3, [r2, #84]
	b	.L775
.L814:
	ldr	r3, [r4, #96]
	subs	r3, r3, #1
	movne	r3, #1
	strb	r3, [lr, #1]
	b	.L773
.L816:
	.align	2
.L815:
	.word	.LC25
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC59
	.word	.LANCHOR0+604
	.word	.LC22
	.word	.LC28
	.word	.LANCHOR0+616
	.word	.LC60
	.word	.LANCHOR0+640
	UNWIND(.fnend)
	.size	FSP_SetRef, .-FSP_SetRef
	.align	2
	.global	FSP_GetRef
	.type	FSP_GetRef, %function
FSP_GetRef:
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
	ldrhi	ip, .L825
	movwhi	r1, #3262
	bhi	.L822
	cmp	r1, #31
	bhi	.L823
	ldr	r3, .L825+4
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #4]
	cmp	r3, #0
	beq	.L824
	mov	r0, r1, asl #9
	add	r1, r0, r1, lsl #6
	add	r3, r3, r1
	ldrsb	r0, [r3, #192]
.L819:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L823:
	ldr	ip, .L825+8
	movw	r1, #3263
.L822:
	ldr	r3, .L825+12
	mov	r0, #0
	ldr	r2, .L825+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L819
.L824:
	ldr	ip, .L825+20
	mov	r0, r3
	mov	r1, #3264
	ldr	r3, .L825+12
	ldr	r2, .L825+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L819
.L826:
	.align	2
.L825:
	.word	.LC25
	.word	.LANCHOR1
	.word	.LC59
	.word	.LANCHOR0+660
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetRef, .-FSP_GetRef
	.align	2
	.global	FSP_SetDisplay
	.type	FSP_SetDisplay, %function
FSP_SetDisplay:
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
	UNWIND(.pad #24)
	sub	sp, sp, #24
	cmp	r0, #3
	mov	r5, r1
	mov	r6, r2
	ldrhi	ip, .L868
	movwhi	r1, #3276
	bhi	.L860
	cmp	r5, #31
	bhi	.L862
	ldr	r3, .L868+4
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L863
	ldr	r7, .L868+8
	mov	r0, #3
	ldr	r3, [r7, #12]
	blx	r3
	mov	r1, r5, asl #6
	mov	r5, r5, asl #9
	ldr	ip, [r4, #4]
	add	r3, r1, r5
	cmp	r6, #1
	add	r0, r3, #192
	add	r3, ip, r3
	add	r0, ip, r0
	beq	.L832
	ldr	r2, [r3, #208]
	mov	lr, #0
	str	lr, [r3, #212]
	cmp	r2, lr
	beq	.L864
.L833:
	sub	r2, r2, #1
	cmp	r2, #1
	bls	.L865
.L838:
	ldr	r3, [r7, #16]
	mov	r0, #3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L862:
	ldr	ip, .L868+12
	movw	r1, #3277
.L860:
	ldr	r3, .L868+16
	mov	r0, #0
	ldr	r2, .L868+20
	str	ip, [sp]
	bl	dprint_normal
.L827:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L864:
	cmp	r6, lr
	ldr	r2, [r3, #220]
	bne	.L834
	ldr	r3, [r0, #24]
	ldr	r0, [r0, #12]
	cmp	r3, lr
	beq	.L834
	ldr	lr, [r3, #76]
	cmp	r0, lr
	beq	.L866
.L834:
	cmp	r2, #0
	beq	.L838
	add	r3, r1, r5
	ldr	lr, [r2, #76]
	add	r3, ip, r3
	ldr	r0, [r3, #204]
	cmp	lr, r0
	bne	.L867
	cmp	r6, #1
	moveq	r3, #3
	streq	r3, [r2, #84]
	beq	.L838
	ldr	r0, [r3, #216]
	add	r5, r1, r5
	ldr	r2, [r3, #220]
	add	ip, ip, r5
	ldr	r3, [r3, #228]
	cmp	r0, r2
	movne	r0, #0
	strneb	r0, [r2, #1]
	cmp	r3, #0
	mov	r0, #0
	str	r0, [r2, #84]
	strneb	r0, [r3, #1]
	mov	r3, #0
	str	r3, [ip, #220]
	str	r3, [ip, #228]
	b	.L838
.L832:
	ldr	r2, [r3, #208]
	mov	lr, #3
	str	lr, [r3, #212]
	cmp	r2, #0
	bne	.L833
	ldr	r2, [r3, #220]
	b	.L834
.L863:
	ldr	ip, .L868+24
	movw	r1, #3278
	ldr	r3, .L868+16
	ldr	r2, .L868+20
	str	ip, [sp]
	bl	dprint_normal
	b	.L827
.L867:
	str	r0, [sp, #16]
	movw	r1, #403
	ldr	ip, [r3, #196]
	mov	r0, #1
	str	lr, [sp, #8]
	ldr	r3, .L868+28
	str	ip, [sp, #12]
	ldr	ip, [r2, #36]
	ldr	r2, .L868+32
	stmia	sp, {r6, ip}
	bl	dprint_normal
	b	.L838
.L865:
	mov	r1, r6
	bl	FSP_SetDisplay_Share.isra.6
	b	.L838
.L866:
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L834
	ldr	r0, [r3, #84]
	cmp	r0, #0
	beq	.L834
	add	r0, r1, r5
	cmp	r2, r3
	add	r0, ip, r0
	mov	lr, #0
	ldr	r0, [r0, #224]
	strne	lr, [r3, #84]
	cmp	r0, #0
	strb	lr, [r3, #1]
	beq	.L836
	add	r3, r1, r5
	ldr	lr, [r0, #20]
	add	r3, ip, r3
	ldr	r3, [r3, #204]
	cmp	lr, r3
	moveq	r3, #0
	streqb	r3, [r0, #1]
.L836:
	add	r3, r1, r5
	mov	r0, #0
	add	r3, ip, r3
	str	r0, [r3, #216]
	str	r0, [r3, #224]
	b	.L834
.L869:
	.align	2
.L868:
	.word	.LC25
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC59
	.word	.LANCHOR0+672
	.word	.LC22
	.word	.LC28
	.word	.LANCHOR0+688
	.word	.LC61
	UNWIND(.fnend)
	.size	FSP_SetDisplay, .-FSP_SetDisplay
	.align	2
	.global	FSP_GetDisplay
	.type	FSP_GetDisplay, %function
FSP_GetDisplay:
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
	ldrhi	ip, .L878
	movwhi	r1, #3309
	bhi	.L875
	cmp	r1, #31
	bhi	.L876
	ldr	r3, .L878+4
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #4]
	cmp	r3, #0
	beq	.L877
	mov	r0, r1, asl #9
	add	r1, r0, r1, lsl #6
	add	r3, r3, r1
	ldrsb	r0, [r3, #212]
.L872:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L876:
	ldr	ip, .L878+8
	movw	r1, #3310
.L875:
	ldr	r3, .L878+12
	mov	r0, #0
	ldr	r2, .L878+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L872
.L877:
	ldr	ip, .L878+20
	mov	r0, r3
	movw	r1, #3311
	ldr	r3, .L878+12
	ldr	r2, .L878+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L872
.L879:
	.align	2
.L878:
	.word	.LC25
	.word	.LANCHOR1
	.word	.LC59
	.word	.LANCHOR0+716
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetDisplay, .-FSP_GetDisplay
	.align	2
	.global	FSP_GetStoreType
	.type	FSP_GetStoreType, %function
FSP_GetStoreType:
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
	bhi	.L885
	ldr	r3, .L887
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #4]
	cmp	r0, #0
	beq	.L886
	ldr	r3, [r0, #12]
	cmp	r1, r3
	movcc	r3, r1, asl #7
	subcc	r1, r3, r1, asl #5
	movwcc	r2, #18712
	addcc	r0, r0, r1
	movcs	r0, #2
	ldrcc	r0, [r0, r2]
.L882:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L885:
	ldr	ip, .L887+4
	movw	r1, #3346
	ldr	r3, .L887+8
	mov	r0, #0
	ldr	r2, .L887+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L886:
	ldr	ip, .L887+16
	movw	r1, #3347
	ldr	r3, .L887+8
	ldr	r2, .L887+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L882
.L888:
	.align	2
.L887:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+732
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetStoreType, .-FSP_GetStoreType
	.align	2
	.global	FSP_GetFreeDecFsSlotNum
	.type	FSP_GetFreeDecFsSlotNum, %function
FSP_GetFreeDecFsSlotNum:
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
	bhi	.L899
	ldr	r3, .L901
	add	r5, r3, r0, lsl #2
	ldr	r0, [r5, #4]
	cmp	r0, #0
	beq	.L900
	ldr	r6, .L901+4
	mov	r0, #3
	mov	r4, #0
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r1, [r5, #4]
	add	r3, r1, #18432
	add	r1, r1, #21504
	add	r3, r3, #192
	add	r1, r1, #192
.L894:
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r3, r3, #96
	cmp	r2, #1
	addne	r4, r4, #1
	cmp	r3, r1
	bne	.L894
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L899:
	ldr	ip, .L901+8
	movw	r1, #3460
	ldr	r3, .L901+12
	mov	r0, #0
	ldr	r2, .L901+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L900:
	ldr	ip, .L901+20
	movw	r1, #3461
	ldr	r3, .L901+12
	ldr	r2, .L901+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L902:
	.align	2
.L901:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LANCHOR0+752
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetFreeDecFsSlotNum, .-FSP_GetFreeDecFsSlotNum
	.align	2
	.global	FSP_ClearNotInVoQueue
	.type	FSP_ClearNotInVoQueue, %function
FSP_ClearNotInVoQueue:
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
	mov	r5, r0
	mov	r7, r1
	bhi	.L921
	cmp	r1, #0
	beq	.L922
	ldr	r3, .L925
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #4]
	cmp	r0, #0
	addne	r6, r0, #18432
	addne	r4, r0, #232
	addne	r6, r6, #232
	bne	.L911
	b	.L923
.L909:
	add	r4, r4, #576
	cmp	r4, r6
	beq	.L924
.L911:
	ldrsb	r3, [r4, #-40]
	mov	r2, #0
	mov	r0, r5
	cmp	r3, r2
	bne	.L908
	ldr	r3, [r4, #-20]
	cmp	r3, r2
	beq	.L909
.L908:
	ldr	r1, [r4, #-36]
	bl	FSP_SetRef
	ldr	r3, [r4, #-12]
	mov	r1, r4
	mov	r0, r7
	cmp	r3, #0
	beq	.L909
	ldr	r3, [r3, #84]
	cmp	r3, #4
	beq	.L909
	bl	IsImageInVoQueue
	cmp	r0, #0
	beq	.L909
	ldr	r1, [r4, #-36]
	mov	r2, #0
	mov	r0, r5
	add	r4, r4, #576
	bl	FSP_SetDisplay
	cmp	r4, r6
	bne	.L911
.L924:
	mov	r0, #0
.L920:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L921:
	ldr	ip, .L925+4
	movw	r1, #3489
	ldr	r3, .L925+8
	mov	r0, #0
	ldr	r2, .L925+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L920
.L923:
	ldr	ip, .L925+16
	movw	r1, #3491
	ldr	r3, .L925+8
	ldr	r2, .L925+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L920
.L922:
	ldr	ip, .L925+20
	mov	r0, r1
	ldr	r3, .L925+8
	movw	r1, #3490
	ldr	r2, .L925+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L920
.L926:
	.align	2
.L925:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+776
	.word	.LC22
	.word	.LC28
	.word	.LC62
	UNWIND(.fnend)
	.size	FSP_ClearNotInVoQueue, .-FSP_ClearNotInVoQueue
	.align	2
	.global	FSP_GetOccupiedNum
	.type	FSP_GetOccupiedNum, %function
FSP_GetOccupiedNum:
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
	cmp	r2, #3
	bhi	.L933
	cmp	r0, #1088
	bgt	.L930
	ldr	r3, .L934
	ldr	r3, [r3, r2, asl #2]
	ldr	r3, [r3, #120]
	cmp	r3, #0
	movne	r0, #1
	moveq	r0, #4
	ldmfd	sp, {fp, sp, pc}
.L930:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L933:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_GetOccupiedNum.part.26
.L935:
	.align	2
.L934:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_GetOccupiedNum, .-FSP_GetOccupiedNum
	.align	2
	.global	FSP_IfCanGetDecFs
	.type	FSP_IfCanGetDecFs, %function
FSP_IfCanGetDecFs:
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
	bhi	.L956
	cmp	r1, #0
	beq	.L957
	ldr	r3, .L962
	add	r3, r3, r0, lsl #2
	ldr	ip, [r3, #4]
	cmp	ip, #0
	addne	r1, ip, #18688
	addne	r1, r1, #20
	movne	r2, #0
	movne	lr, r1
	bne	.L942
	b	.L958
.L941:
	cmp	r2, #32
	add	lr, lr, #96
	beq	.L959
.L942:
	mov	r3, r2, asl #7
	sub	r3, r3, r2, asl #5
	add	r2, r2, #1
	add	r3, ip, r3
	add	r3, r3, #18432
	add	r3, r3, #192
	ldrh	r3, [r3]
	cmp	r3, #1
	bne	.L941
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L941
	ldr	r5, [lr, #-44]
	ldr	r4, [ip, #124]
	cmp	r5, r4
	bne	.L941
	ldr	r5, [lr, #-40]
	ldr	r4, [ip, #136]
	cmp	r5, r4
	bne	.L941
	mov	r0, r3
	b	.L952
.L959:
	mov	r4, #0
	mov	r2, r4
	b	.L944
.L943:
	cmp	r2, #32
	add	r1, r1, #96
	beq	.L960
.L944:
	mov	r3, r2, asl #7
	sub	r3, r3, r2, asl #5
	add	r2, r2, #1
	add	r3, ip, r3
	add	r3, r3, #18432
	add	r3, r3, #192
	ldrh	r3, [r3]
	cmp	r3, #1
	bne	.L943
	ldr	lr, [r1]
	add	r1, r1, #96
	cmp	lr, #3
	addeq	r4, r4, #1
	cmp	r2, #32
	bne	.L944
.L960:
	ldr	r3, [ip, #48]
	cmp	r3, #1088
	movgt	r3, #1
	ble	.L961
.L946:
	cmp	r3, r4
	movlt	r0, #0
	mvnge	r0, #0
.L952:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L961:
	ldr	r3, .L962+4
	ldr	r3, [r3, r0, asl #2]
	ldr	r3, [r3, #120]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #4
	b	.L946
.L956:
	ldr	ip, .L962+8
	movw	r1, #3544
	ldr	r3, .L962+12
	mov	r0, #0
	ldr	r2, .L962+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L952
.L958:
	ldr	lr, .L962+20
	mov	r0, ip
	ldr	r3, .L962+12
	movw	r1, #3546
	ldr	r2, .L962+16
	str	lr, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L952
.L957:
	ldr	ip, .L962+24
	mov	r0, r1
	ldr	r3, .L962+12
	movw	r1, #3545
	ldr	r2, .L962+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L952
.L963:
	.align	2
.L962:
	.word	.LANCHOR1
	.word	s_pstVfmwChan
	.word	.LC25
	.word	.LANCHOR0+800
	.word	.LC22
	.word	.LC63
	.word	.LC62
	UNWIND(.fnend)
	.size	FSP_IfCanGetDecFs, .-FSP_IfCanGetDecFs
	.align	2
	.global	FSP_ClearLogicFs
	.type	FSP_ClearLogicFs, %function
FSP_ClearLogicFs:
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
	bhi	.L973
	ldr	r3, .L976
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L974
	cmp	r1, #31
	bls	.L975
.L964:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L975:
	mov	r2, #0
	bl	FSP_SetRef
	mov	r1, r5
	mov	r0, r4
	bl	FSP_GetDisplay
	cmp	r0, #3
	beq	.L964
	mov	r1, r5
	mov	r0, r4
	mov	r2, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	FSP_SetDisplay
.L973:
	ldr	ip, .L976+4
	movw	r1, #3608
	ldr	r3, .L976+8
	mov	r0, #0
	ldr	r2, .L976+12
	str	ip, [sp]
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L974:
	ldr	ip, .L976+16
	mov	r0, r3
	movw	r1, #3609
	ldr	r3, .L976+8
	ldr	r2, .L976+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L964
.L977:
	.align	2
.L976:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+820
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_ClearLogicFs, .-FSP_ClearLogicFs
	.align	2
	.global	FSP_GetLogicFs
	.type	FSP_GetLogicFs, %function
FSP_GetLogicFs:
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
	cmp	r0, #3
	bhi	.L983
	ldr	r3, .L985
	add	r0, r3, r0, lsl #2
	ldr	r4, [r0, #4]
	cmp	r4, #0
	beq	.L984
	cmp	r1, #31
	movls	r0, r1, asl #9
	addls	r0, r0, r1, lsl #6
	movhi	r0, #0
	addls	r0, r0, #192
	addls	r0, r4, r0
.L980:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L983:
	ldr	ip, .L985+4
	movw	r1, #3628
	ldr	r3, .L985+8
	mov	r0, #0
	ldr	r2, .L985+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	b	.L980
.L984:
	ldr	ip, .L985+16
	movw	r1, #3629
	ldr	r3, .L985+8
	mov	r0, r4
	ldr	r2, .L985+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	b	.L980
.L986:
	.align	2
.L985:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+840
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetLogicFs, .-FSP_GetLogicFs
	.align	2
	.global	FSP_LinkLogicFs
	.type	FSP_LinkLogicFs, %function
FSP_LinkLogicFs:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	cmp	r0, #3
	mov	r10, r1
	mov	r7, r0
	ldrhi	ip, .L1023
	movhi	r1, #3104
	bhi	.L1016
	cmp	r10, #31
	bhi	.L1017
	ldr	r3, .L1023+4
	add	r3, r3, r0, lsl #2
	ldr	r6, [r3, #4]
	cmp	r6, #0
	beq	.L1018
	ldr	r1, [r6, #76]
	cmp	r1, #0
	beq	.L1019
	ldr	r9, .L1023+8
	mov	r0, #3
	ldr	r3, [r9, #12]
	blx	r3
	mov	r3, r6
	mov	r2, #0
	b	.L995
.L993:
	add	r2, r2, #1
	add	r3, r3, #576
	cmp	r2, #32
	beq	.L1005
.L995:
	ldrsb	r1, [r3, #192]
	cmp	r1, #0
	bne	.L993
	ldr	r5, [r3, #212]
	cmp	r5, #0
	bne	.L993
	mov	r3, r2, asl #6
	mov	r1, r2, asl #9
	add	r8, r3, r1
	str	r3, [fp, #-48]
	add	r4, r8, #192
	add	r8, r6, r8
	adds	r4, r6, r4
	str	r1, [fp, #-52]
	str	r2, [r8, #196]
	beq	.L1005
	mov	r0, r7
	mov	r1, r10
	bl	FSP_GetLogicFs
	subs	r7, r0, #0
	beq	.L1020
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #28]
	cmp	r3, #0
	beq	.L999
	cmp	r2, #0
	beq	.L999
	ldr	r3, [r7, #12]
	add	r2, r8, #200
	mov	r0, r6
	str	r2, [fp, #-56]
	mov	r1, r2
	add	r2, r4, #28
	str	r3, [r1, #4]
	add	r10, r8, #216
	ldr	r1, [r7, #24]
	str	r1, [r8, #216]
	ldr	ip, [r7, #32]
	str	ip, [r8, #224]
	bl	FSP_FindIdleDispFs.isra.19
	subs	r3, r0, #0
	str	r3, [fp, #-60]
	bne	.L1021
	add	r2, r4, #36
	ldr	r1, [r4, #28]
	mov	r0, r6
	bl	FSP_FindIdleMetadata.isra.21
	cmp	r0, #0
	bne	.L1022
	ldr	r1, [r8, #216]
	ldr	r2, [r1, #80]
	add	r2, r2, #1
	str	r2, [r1, #80]
	ldr	r1, [r8, #216]
	ldr	r2, [r10, #4]
	cmp	r1, r2
	beq	.L1003
	ldr	r3, [fp, #-56]
	mov	r1, #1
	str	r1, [r2, #84]
	ldr	r2, [r10, #4]
	ldr	r1, [r3, #4]
	str	r1, [r2, #76]
	ldr	r2, [r10, #4]
	ldr	r3, [r2, #80]
	add	r3, r3, #1
	str	r3, [r2, #80]
.L1003:
	ldr	r3, [fp, #-48]
	add	r1, r7, #40
	ldr	r2, [fp, #-52]
	add	r0, r3, r2
	mov	r3, #2
	add	r8, r6, r0
	add	r0, r0, #232
	mov	r2, #536
	add	r0, r6, r0
	str	r3, [r8, #208]
	mov	r3, #1
	str	r3, [r8, #212]
	ldr	r3, [r9, #52]
	ldr	r5, [r8, #220]
	ldr	r10, [r8, #228]
	blx	r3
	ldr	r3, [r8, #196]
	add	r1, r4, #528
	cmp	r10, #0
	str	r3, [r4, #128]
	ldr	r3, [r5, #44]
	str	r3, [r4, #464]
	ldr	r3, [r5, #48]
	str	r3, [r4, #468]
	ldr	r3, [r5, #52]
	str	r3, [r4, #480]
	ldr	r3, [r5, #64]
	str	r3, [r4, #472]
	ldr	r3, [r5, #68]
	str	r3, [r4, #476]
	ldr	r3, [r5, #4]
	str	r3, [r4, #484]
	ldr	r3, [r5, #12]
	str	r3, [r4, #488]
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #72]
	add	r3, r3, r2
	str	r3, [r4, #492]
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #56]
	add	r3, r3, r2
	str	r3, [r4, #504]
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #60]
	add	r3, r3, r2
	str	r3, [r4, #508]
	ldrb	r3, [r6, #161]	@ zero_extendqisi2
	strb	r3, [r4, #460]
	ldr	r3, [r5, #16]
	str	r3, [r4, #512]
	ldrd	r2, [r5, #24]
	strd	r2, [r1, #-8]
	ldr	r3, [r5, #32]
	str	r3, [r4, #528]
	beq	.L1004
	ldr	r3, [r10, #8]
	mov	r2, #1
	strb	r2, [r10, #1]
	str	r3, [r4, #316]
	ldr	r0, [r10, #8]
	bl	MEM_Phy2Vir
	mov	r2, #0
	str	r2, [r4, #324]
	str	r0, [r4, #320]
.L1004:
	ldr	r3, [r9, #16]
	mov	r0, #3
	blx	r3
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	movw	r1, #3214
	add	r3, r3, r2
	ldr	r2, .L1023+12
	add	r6, r6, r3
	ldr	r0, [r6, #220]
	ldr	ip, [r6, #216]
	ldr	r3, [r6, #196]
	ldr	lr, [r0, #76]
	str	lr, [sp, #24]
	ldr	lr, [r0, #36]
	mov	r0, #14
	str	lr, [sp, #20]
	ldr	lr, [ip, #76]
	str	lr, [sp, #16]
	ldr	ip, [ip, #36]
	str	ip, [sp, #12]
	ldr	ip, [r7, #12]
	str	ip, [sp, #8]
	ldr	ip, [r7, #4]
	str	ip, [sp, #4]
	ldr	ip, [r6, #204]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
.L1014:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1019:
	bl	FSP_NewLogicFs
	mov	r1, r0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	FSP_GetLogicFs
.L1005:
	ldr	r3, .L1023+16
	movw	r1, #3124
	ldr	r2, .L1023+20
	mov	r0, #0
	bl	dprint_normal
.L996:
	ldr	r3, [r9, #16]
	mov	r0, #3
	blx	r3
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1017:
	ldr	ip, .L1023+24
	movw	r1, #3105
.L1016:
	ldr	r3, .L1023+16
	mov	r0, #0
	ldr	r2, .L1023+28
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	b	.L1014
.L1021:
	mov	r0, r5
	ldr	r3, .L1023+16
	ldr	r2, .L1023+32
	movw	r1, #3150
	bl	dprint_normal
	b	.L996
.L999:
	str	r2, [sp, #8]
	movw	r1, #3138
	str	r3, [sp, #4]
	mov	r0, #0
	str	r10, [sp]
	ldr	r3, .L1023+16
	ldr	r2, .L1023+36
	bl	dprint_normal
	b	.L996
.L1022:
	ldr	r0, [fp, #-60]
	movw	r1, #3158
	ldr	r3, .L1023+16
	ldr	r2, .L1023+40
	bl	dprint_normal
	b	.L996
.L1018:
	ldr	ip, .L1023+44
	movw	r1, #3106
	ldr	r3, .L1023+16
	mov	r0, r6
	ldr	r2, .L1023+28
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r6
	b	.L1014
.L1020:
	mov	r3, r10
	ldr	r2, .L1023+48
	movw	r1, #3132
	bl	dprint_normal
	b	.L996
.L1024:
	.align	2
.L1023:
	.word	.LC25
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC69
	.word	.LANCHOR0+856
	.word	.LC50
	.word	.LC64
	.word	.LC22
	.word	.LC67
	.word	.LC66
	.word	.LC68
	.word	.LC28
	.word	.LC65
	UNWIND(.fnend)
	.size	FSP_LinkLogicFs, .-FSP_LinkLogicFs
	.align	2
	.global	FSP_SetStoreType
	.type	FSP_SetStoreType, %function
FSP_SetStoreType:
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
	mov	r4, r2
	mov	r5, r1
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1029
	ldr	r3, [r0, #24]
	cmp	r3, #0
	strne	r4, [r3, #88]
	movne	r0, #0
	beq	.L1030
.L1027:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1029:
	str	r5, [sp]
	movw	r1, #3326
	ldr	r3, .L1031
	mov	r0, #1
	ldr	r2, .L1031+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L1027
.L1030:
	str	r5, [sp]
	movw	r1, #3332
	ldr	r3, .L1031
	mov	r0, #1
	ldr	r2, .L1031+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L1027
.L1032:
	.align	2
.L1031:
	.word	.LANCHOR0+872
	.word	.LC70
	.word	.LC71
	UNWIND(.fnend)
	.size	FSP_SetStoreType, .-FSP_SetStoreType
	.align	2
	.global	FSP_ReleasePmv
	.type	FSP_ReleasePmv, %function
FSP_ReleasePmv:
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
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1039
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r2, [r0, #12]
	ldr	r1, [r3, #20]
	cmp	r1, r2
	moveq	r2, #0
	streqb	r2, [r3, #1]
	ldmfd	sp, {fp, sp, pc}
.L1039:
	ldr	r3, .L1040
	movw	r1, #3587
	ldr	r2, .L1040+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_normal
.L1041:
	.align	2
.L1040:
	.word	.LANCHOR0+892
	.word	.LC72
	UNWIND(.fnend)
	.size	FSP_ReleasePmv, .-FSP_ReleasePmv
	.align	2
	.global	FSP_GetLogicFs_By_DecAddr
	.type	FSP_GetLogicFs_By_DecAddr, %function
FSP_GetLogicFs_By_DecAddr:
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
	mov	r6, r1
	mov	r7, r2
	bhi	.L1059
	ldr	r3, .L1062
	add	r0, r3, r0, lsl #2
	ldr	r9, [r0, #4]
	cmp	r9, #0
	addne	r5, r9, #18432
	addne	r4, r9, #192
	addne	r5, r5, #192
	movne	r8, #0
	bne	.L1049
	b	.L1060
.L1046:
	add	r4, r4, #576
	cmp	r4, r5
	beq	.L1050
.L1049:
	mov	r1, r6
	mov	r0, r4
	bl	FSP_IsLogicFsMatchTargetCore
	cmp	r0, #0
	beq	.L1046
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L1046
	ldr	r3, [r3, #4]
	cmp	r3, r7
	bne	.L1046
	cmp	r8, #0
	beq	.L1058
	ldr	r2, [r8, #12]
	ldr	r3, [r4, #12]
	cmp	r3, r2
	bhi	.L1061
.L1048:
	ldr	r3, [r9, #4]
	sub	r3, r3, #1
	cmp	r2, r3
	bne	.L1046
.L1050:
	mov	r0, r8
.L1044:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1061:
	ldr	r3, .L1062+4
	movw	r1, #3676
	ldr	r2, .L1062+8
	mov	r0, #1
	bl	dprint_normal
.L1058:
	ldr	r2, [r4, #12]
	mov	r8, r4
	b	.L1048
.L1059:
	ldr	ip, .L1062+12
	movw	r1, #3646
	ldr	r3, .L1062+4
	mov	r0, #0
	ldr	r2, .L1062+16
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	b	.L1044
.L1060:
	ldr	ip, .L1062+20
	movw	r1, #3647
	ldr	r3, .L1062+4
	mov	r0, r9
	ldr	r2, .L1062+16
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r9
	b	.L1044
.L1063:
	.align	2
.L1062:
	.word	.LANCHOR1
	.word	.LANCHOR0+908
	.word	.LC73
	.word	.LC25
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetLogicFs_By_DecAddr, .-FSP_GetLogicFs_By_DecAddr
	.align	2
	.global	FSP_GetLogicFs_By_DispAddr
	.type	FSP_GetLogicFs_By_DispAddr, %function
FSP_GetLogicFs_By_DispAddr:
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
	mov	r6, r1
	mov	r7, r2
	bhi	.L1078
	ldr	r3, .L1080
	add	r0, r3, r0, lsl #2
	ldr	r4, [r0, #4]
	cmp	r4, #0
	addne	r5, r4, #18432
	addne	r4, r4, #192
	addne	r5, r5, #192
	beq	.L1079
.L1069:
	mov	r1, r6
	mov	r0, r4
	bl	FSP_IsLogicFsMatchTargetCore
	cmp	r0, #0
	beq	.L1068
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L1068
	ldr	r3, [r3, #4]
	cmp	r3, r7
	beq	.L1070
.L1068:
	add	r4, r4, #576
	cmp	r4, r5
	bne	.L1069
	mov	r0, #0
.L1066:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1070:
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1078:
	ldr	ip, .L1080+4
	mov	r1, #3696
	ldr	r3, .L1080+8
	mov	r0, #0
	ldr	r2, .L1080+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	b	.L1066
.L1079:
	ldr	ip, .L1080+16
	movw	r1, #3697
	ldr	r3, .L1080+8
	mov	r0, r4
	ldr	r2, .L1080+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	b	.L1066
.L1081:
	.align	2
.L1080:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+936
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetLogicFs_By_DispAddr, .-FSP_GetLogicFs_By_DispAddr
	.align	2
	.global	FSP_GetPairDispFs_By_DecAddr
	.type	FSP_GetPairDispFs_By_DecAddr, %function
FSP_GetPairDispFs_By_DecAddr:
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
	mov	r6, r1
	mov	r8, r2
	bhi	.L1106
	ldr	r3, .L1109
	add	r0, r3, r0, lsl #2
	ldr	r7, [r0, #4]
	cmp	r7, #0
	addne	r5, r7, #18432
	addne	r4, r7, #192
	addne	r5, r5, #192
	movne	r9, #0
	bne	.L1087
	b	.L1107
.L1086:
	add	r4, r4, #576
	cmp	r4, r5
	beq	.L1108
.L1087:
	mov	r1, r6
	mov	r0, r4
	bl	FSP_IsLogicFsMatchTargetCore
	cmp	r0, #0
	beq	.L1086
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L1086
	ldr	r2, [r3, #4]
	cmp	r2, r8
	bne	.L1086
	ldr	r0, [r4, #28]
	mov	r9, r4
	cmp	r0, #0
	beq	.L1093
	ldr	r3, [r3, #76]
	ldr	r2, [r0, #76]
	cmp	r2, r3
	bne	.L1086
.L1084:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1108:
	cmp	r9, #0
	moveq	r0, r9
	beq	.L1084
	cmp	r6, #2
	bne	.L1088
	ldr	ip, [r7, #16]
	ldr	lr, [r9, #12]
	cmp	ip, #0
	beq	.L1096
	add	r2, r7, #21504
	mov	r9, #0
	add	r2, r2, #192
	mov	r1, r9
	mvn	r0, #0
.L1092:
	ldr	r3, [r2, #76]
	add	r1, r1, #1
	rsb	r3, lr, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r0
	movcc	r9, r2
	movcc	r0, r3
	cmp	r1, ip
	add	r2, r2, #96
	bne	.L1092
.L1089:
	ldr	r2, .L1109+4
	movw	r1, #3780
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r9
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1093:
	mov	r9, r4
	b	.L1086
.L1088:
	mov	r3, r6
	ldr	r2, .L1109+8
	movw	r1, #3784
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1106:
	ldr	ip, .L1109+12
	movw	r1, #3733
	ldr	r3, .L1109+16
	mov	r0, #0
	ldr	r2, .L1109+20
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	b	.L1084
.L1096:
	mov	r9, ip
	b	.L1089
.L1107:
	ldr	ip, .L1109+24
	movw	r1, #3734
	ldr	r3, .L1109+16
	mov	r0, r7
	ldr	r2, .L1109+20
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r7
	b	.L1084
.L1110:
	.align	2
.L1109:
	.word	.LANCHOR1
	.word	.LC74
	.word	.LC75
	.word	.LC25
	.word	.LANCHOR0+964
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetPairDispFs_By_DecAddr, .-FSP_GetPairDispFs_By_DecAddr
	.align	2
	.global	FSP_MarkImageOutHanging
	.type	FSP_MarkImageOutHanging, %function
FSP_MarkImageOutHanging:
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
	mov	r5, r1
	bhi	.L1132
	ldr	r3, .L1136
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L1133
	ldr	r6, .L1136+4
	mov	r0, #3
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r4, [r4, #4]
	ldr	r1, [r5, #444]
	mov	r0, r4
	bl	FSP_MarkFsOutHanging
	ldr	r1, [r5, #456]
	cmp	r1, #0
	bne	.L1134
	ldr	r2, [r5, #276]
	cmp	r2, #0
	bne	.L1135
.L1116:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mov	r0, #0
.L1113:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1134:
	mov	r0, r4
	bl	FSP_MarkFsOutHanging
	ldr	r2, [r5, #276]
	cmp	r2, #0
	beq	.L1116
.L1135:
	ldr	r7, [r4, #24]
	cmp	r7, #0
	beq	.L1116
	add	r1, r4, #24576
	add	r3, r4, #25344
	add	r3, r3, #192
	ldr	r1, [r1, #968]
	cmp	r2, r1
	beq	.L1120
	add	r1, r4, #25344
	rsb	lr, r3, #25344
	add	r1, r1, #208
	add	lr, lr, #208
	mov	r0, #0
.L1121:
	add	r0, r0, #1
	add	r1, r1, #16
	cmp	r0, r7
	add	ip, r3, lr
	beq	.L1120
	ldr	r5, [r1, #-8]
	add	r3, r4, ip
	cmp	r2, r5
	bne	.L1121
.L1120:
	cmp	r3, #0
	beq	.L1116
	movw	ip, #2405
	mov	r0, #1
	mov	r1, ip
	strb	r0, [r3, #2]
	strb	r0, [r3, #1]
	mov	r0, #26
	str	r2, [sp, #4]
	str	ip, [sp]
	ldr	r3, .L1136+8
	ldr	r2, .L1136+12
	bl	dprint_normal
	b	.L1116
.L1132:
	ldr	ip, .L1136+16
	movw	r1, #3796
	ldr	r3, .L1136+20
	mov	r0, #0
	ldr	r2, .L1136+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1113
.L1133:
	ldr	ip, .L1136+28
	movw	r1, #3797
	ldr	r3, .L1136+20
	ldr	r2, .L1136+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1113
.L1137:
	.align	2
.L1136:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1020
	.word	.LC76
	.word	.LC25
	.word	.LANCHOR0+996
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_MarkImageOutHanging, .-FSP_MarkImageOutHanging
	.align	2
	.global	FSP_UnMarkImageOutHanging
	.type	FSP_UnMarkImageOutHanging, %function
FSP_UnMarkImageOutHanging:
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
	mov	r5, r1
	bhi	.L1159
	ldr	r3, .L1163
	add	r4, r3, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L1160
	ldr	r6, .L1163+4
	mov	r0, #3
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r4, [r4, #4]
	ldr	r1, [r5, #444]
	mov	r0, r4
	bl	FSP_UnMarkFsOutHanging
	ldr	r1, [r5, #456]
	cmp	r1, #0
	bne	.L1161
	ldr	r2, [r5, #276]
	cmp	r2, #0
	bne	.L1162
.L1143:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mov	r0, #0
.L1140:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1161:
	mov	r0, r4
	bl	FSP_UnMarkFsOutHanging
	ldr	r2, [r5, #276]
	cmp	r2, #0
	beq	.L1143
.L1162:
	ldr	r7, [r4, #24]
	cmp	r7, #0
	beq	.L1143
	add	r1, r4, #24576
	add	r3, r4, #25344
	add	r3, r3, #192
	ldr	r1, [r1, #968]
	cmp	r2, r1
	beq	.L1147
	add	r1, r4, #25344
	rsb	lr, r3, #25344
	add	r1, r1, #208
	add	lr, lr, #208
	mov	r0, #0
.L1148:
	add	r0, r0, #1
	add	r1, r1, #16
	cmp	r0, r7
	add	ip, r3, lr
	beq	.L1147
	ldr	r5, [r1, #-8]
	add	r3, r4, ip
	cmp	r2, r5
	bne	.L1148
.L1147:
	cmp	r3, #0
	beq	.L1143
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1143
	movw	ip, #2422
	mov	r0, #0
	mov	r1, ip
	strb	r0, [r3, #2]
	strb	r0, [r3, #1]
	mov	r0, #26
	str	r2, [sp, #4]
	str	ip, [sp]
	ldr	r3, .L1163+8
	ldr	r2, .L1163+12
	bl	dprint_normal
	b	.L1143
.L1159:
	ldr	ip, .L1163+16
	movw	r1, #3830
	ldr	r3, .L1163+20
	mov	r0, #0
	ldr	r2, .L1163+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1140
.L1160:
	ldr	ip, .L1163+28
	movw	r1, #3831
	ldr	r3, .L1163+20
	ldr	r2, .L1163+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1140
.L1164:
	.align	2
.L1163:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1076
	.word	.LC6
	.word	.LC25
	.word	.LANCHOR0+1048
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_UnMarkImageOutHanging, .-FSP_UnMarkImageOutHanging
	.align	2
	.global	FSP_GetFsImagePtr
	.type	FSP_GetFsImagePtr, %function
FSP_GetFsImagePtr:
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
	cmp	r0, #3
	bhi	.L1170
	ldr	r3, .L1172
	add	r0, r3, r0, lsl #2
	ldr	r4, [r0, #4]
	cmp	r4, #0
	beq	.L1171
	cmp	r1, #31
	movls	r0, r1, asl #9
	addls	r0, r0, r1, lsl #6
	movhi	r0, #0
	addls	r0, r0, #232
	addls	r0, r4, r0
.L1167:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1170:
	ldr	ip, .L1172+4
	movw	r1, #3863
	ldr	r3, .L1172+8
	mov	r0, #0
	ldr	r2, .L1172+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	b	.L1167
.L1171:
	ldr	ip, .L1172+16
	movw	r1, #3864
	ldr	r3, .L1172+8
	mov	r0, r4
	ldr	r2, .L1172+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	b	.L1167
.L1173:
	.align	2
.L1172:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+1108
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetFsImagePtr, .-FSP_GetFsImagePtr
	.align	2
	.global	FSP_GetPmvAddr
	.type	FSP_GetPmvAddr, %function
FSP_GetPmvAddr:
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
	bl	FSP_GetLogicFs
	subs	r4, r0, #0
	beq	.L1178
	ldr	r0, [r4, #32]
	cmp	r0, #0
	ldrne	r0, [r0, #8]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1178:
	ldr	r3, .L1179
	movw	r1, #3883
	ldr	r2, .L1179+4
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1180:
	.align	2
.L1179:
	.word	.LANCHOR0+1128
	.word	.LC72
	UNWIND(.fnend)
	.size	FSP_GetPmvAddr, .-FSP_GetPmvAddr
	.align	2
	.global	FSP_GetDecFsAddrTab
	.type	FSP_GetDecFsAddrTab, %function
FSP_GetDecFsAddrTab:
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
	bhi	.L1191
	cmp	r2, #0
	beq	.L1192
	cmp	r1, #0
	beq	.L1193
	ldr	r3, .L1195
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #4]
	cmp	r0, #0
	beq	.L1194
	ldr	r3, [r0, #12]
	cmp	r3, #0
	str	r3, [r1]
	ble	.L1181
	add	ip, r0, #18432
	sub	r2, r2, #4
	add	ip, ip, #196
	mov	r3, #0
.L1188:
	ldr	lr, [ip], #96
	add	r3, r3, #1
	str	lr, [r2, #4]!
	ldr	lr, [r1]
	cmp	lr, r3
	bgt	.L1188
.L1181:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1191:
	ldr	ip, .L1195+4
	movw	r1, #3902
	ldr	r3, .L1195+8
	mov	r0, #0
	ldr	r2, .L1195+12
	str	ip, [sp]
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1192:
	ldr	ip, .L1195+16
	mov	r0, r2
	ldr	r3, .L1195+8
	movw	r1, #3903
	ldr	r2, .L1195+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1181
.L1193:
	ldr	ip, .L1195+20
	mov	r0, r1
	ldr	r3, .L1195+8
	mov	r1, #3904
	ldr	r2, .L1195+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1181
.L1194:
	ldr	lr, .L1195+24
	movw	r1, #3905
	ldr	r3, .L1195+8
	ldr	r2, .L1195+12
	str	lr, [sp]
	bl	dprint_normal
	b	.L1181
.L1196:
	.align	2
.L1195:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+1144
	.word	.LC22
	.word	.LC77
	.word	.LC78
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetDecFsAddrTab, .-FSP_GetDecFsAddrTab
	.align	2
	.global	FSP_GetPmvAddrTab
	.type	FSP_GetPmvAddrTab, %function
FSP_GetPmvAddrTab:
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
	bhi	.L1207
	cmp	r2, #0
	beq	.L1208
	cmp	r1, #0
	beq	.L1209
	ldr	r3, .L1211
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #4]
	cmp	r0, #0
	beq	.L1210
	ldr	r3, [r0, #20]
	cmp	r3, #0
	str	r3, [r1]
	ble	.L1197
	add	ip, r0, #24576
	sub	r2, r2, #4
	add	ip, ip, #200
	mov	r3, #0
.L1204:
	ldr	lr, [ip], #24
	add	r3, r3, #1
	str	lr, [r2, #4]!
	ldr	lr, [r1]
	cmp	lr, r3
	bgt	.L1204
.L1197:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1207:
	ldr	ip, .L1211+4
	movw	r1, #3923
	ldr	r3, .L1211+8
	mov	r0, #0
	ldr	r2, .L1211+12
	str	ip, [sp]
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1208:
	ldr	ip, .L1211+16
	mov	r0, r2
	ldr	r3, .L1211+8
	movw	r1, #3924
	ldr	r2, .L1211+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1197
.L1209:
	ldr	ip, .L1211+20
	mov	r0, r1
	ldr	r3, .L1211+8
	movw	r1, #3925
	ldr	r2, .L1211+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1197
.L1210:
	ldr	lr, .L1211+24
	movw	r1, #3926
	ldr	r3, .L1211+8
	ldr	r2, .L1211+12
	str	lr, [sp]
	bl	dprint_normal
	b	.L1197
.L1212:
	.align	2
.L1211:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+1164
	.word	.LC22
	.word	.LC79
	.word	.LC80
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetPmvAddrTab, .-FSP_GetPmvAddrTab
	.align	2
	.global	FSP_GetNullLogicFs
	.type	FSP_GetNullLogicFs, %function
FSP_GetNullLogicFs:
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
	bhi	.L1224
	ldr	r3, .L1227
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #4]
	cmp	ip, #0
	addne	r3, ip, #17920
	movne	r2, #31
	addne	r3, r3, #128
	bne	.L1219
	b	.L1225
.L1217:
	sub	r2, r2, #1
	sub	r3, r3, #576
	cmn	r2, #1
	beq	.L1226
.L1219:
	ldrsb	r1, [r3]
	cmp	r1, #0
	bne	.L1217
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bne	.L1217
.L1218:
	mov	r3, r2, asl #9
	mov	r0, r2
	add	r2, r3, r2, lsl #6
	mov	r3, #0
	add	ip, ip, r2
	str	r3, [ip, #216]
	str	r3, [ip, #220]
.L1215:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1226:
	mov	r2, #0
	b	.L1218
.L1224:
	ldr	ip, .L1227+4
	movw	r1, #3945
	ldr	r3, .L1227+8
	mov	r0, #0
	ldr	r2, .L1227+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1215
.L1225:
	ldr	lr, .L1227+16
	mov	r0, ip
	ldr	r3, .L1227+8
	movw	r1, #3946
	ldr	r2, .L1227+12
	str	lr, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1215
.L1228:
	.align	2
.L1227:
	.word	.LANCHOR1
	.word	.LC25
	.word	.LANCHOR0+1184
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetNullLogicFs, .-FSP_GetNullLogicFs
	.align	2
	.global	FSP_GetMinAvailableDecFsNum
	.type	FSP_GetMinAvailableDecFsNum, %function
FSP_GetMinAvailableDecFsNum:
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
	bhi	.L1233
	ldr	r3, .L1237
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1234
	ldr	r2, [r3, #48]
	cmp	r2, #1088
	movgt	r0, #1
	bgt	.L1231
	ldr	r2, .L1237+4
	ldr	r2, [r2, r0, asl #2]
	ldr	r2, [r2, #120]
	cmp	r2, #0
	movne	r0, #1
	moveq	r0, #4
.L1231:
	ldr	r2, [r3, #76]
	cmp	r2, #0
	ldreq	r3, [r3, #12]
	ldrne	r0, [r3, #12]
	rsbeq	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1233:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1234:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1238:
	.align	2
.L1237:
	.word	.LANCHOR1
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_GetMinAvailableDecFsNum, .-FSP_GetMinAvailableDecFsNum
	.align	2
	.global	FSP_GetTotalDispFsNum
	.type	FSP_GetTotalDispFsNum, %function
FSP_GetTotalDispFsNum:
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
	ldr	r3, .L1243
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #4]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #76]
	cmp	r3, #0
	ldrne	r0, [r0, #16]
	ldreq	r0, [r0, #12]
	ldmfd	sp, {fp, sp, pc}
.L1244:
	.align	2
.L1243:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	FSP_GetTotalDispFsNum, .-FSP_GetTotalDispFsNum
	.align	2
	.global	FSP_GetWaitDispFsNum
	.type	FSP_GetWaitDispFsNum, %function
FSP_GetWaitDispFsNum:
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
	bhi	.L1255
	ldr	r3, .L1257
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #4]
	cmp	r0, #0
	movne	r3, r0
	movne	r0, #0
	addne	ip, r3, #18432
	bne	.L1250
	ldr	ip, .L1257+4
	movw	r1, #4024
	ldr	r3, .L1257+8
	ldr	r2, .L1257+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
.L1247:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1256:
	ldr	r2, [r2, #84]
	cmp	r2, #3
	addeq	r0, r0, #1
.L1249:
	add	r3, r3, #576
	cmp	r3, ip
	beq	.L1247
.L1250:
	ldr	r2, [r3, #220]
	cmp	r2, #0
	beq	.L1249
	ldr	r1, [r3, #212]
	cmp	r1, #3
	bne	.L1249
	b	.L1256
.L1255:
	ldr	ip, .L1257+16
	movw	r1, #4023
	ldr	r3, .L1257+8
	mov	r0, #0
	ldr	r2, .L1257+12
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1258:
	.align	2
.L1257:
	.word	.LANCHOR1
	.word	.LC28
	.word	.LANCHOR0+1204
	.word	.LC22
	.word	.LC25
	UNWIND(.fnend)
	.size	FSP_GetWaitDispFsNum, .-FSP_GetWaitDispFsNum
	.align	2
	.global	FSP_CheckIfFsPolluted
	.type	FSP_CheckIfFsPolluted, %function
FSP_CheckIfFsPolluted:
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
	ldr	r4, .L1290
	mov	r5, r0
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L1259
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L1288
.L1259:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1288:
	ldr	r6, .L1290+4
	mov	r0, #3
	ldr	r3, [r6, #12]
	blx	r3
	mov	r0, r5
	ldr	r2, [r4, #20]
	mov	r1, #0
	bl	FSP_GetLogicFs_By_DecAddr
	subs	r5, r0, #0
	beq	.L1289
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L1262
	ldr	r2, [r5, #28]
	cmp	r2, #0
	beq	.L1262
	ldr	r2, [r5, #32]
	cmp	r2, #0
	beq	.L1262
.L1263:
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #4]
	bl	FSP_VarifyWaterMark
.L1264:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L1265
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #4]
	bl	FSP_VarifyWaterMark
.L1265:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L1266
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	FSP_VarifyWaterMark
.L1266:
	ldr	r3, [r6, #16]
	mov	r0, #3
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	bx	r3
.L1262:
	movw	r1, #4069
	ldr	r3, .L1290+8
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L1290+12
	bl	dprint_normal
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L1264
	b	.L1263
.L1289:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	ldr	ip, [r4, #20]
	ldr	r3, .L1290+8
	movw	r1, #4063
	ldr	r2, .L1290+16
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	b	.L1259
.L1291:
	.align	2
.L1290:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1228
	.word	.LC82
	.word	.LC81
	UNWIND(.fnend)
	.size	FSP_CheckIfFsPolluted, .-FSP_CheckIfFsPolluted
	.align	2
	.global	FSP_GetInst
	.type	FSP_GetInst, %function
FSP_GetInst:
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
	ldrls	r3, .L1295
	addls	r0, r3, r0, lsl #2
	ldrls	r0, [r0, #4]
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1296:
	.align	2
.L1295:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	FSP_GetInst, .-FSP_GetInst
	.align	2
	.global	FSP_DumpState
	.type	FSP_DumpState, %function
FSP_DumpState:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	cmp	r0, #3
	mov	r4, r1
	bls	.L1469
.L1298:
	mov	r3, r0
	ldr	r2, .L1486
	movw	r1, #4112
	mov	r0, #32
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L1469:
	ldr	r3, .L1486+4
	add	r3, r3, r0, lsl #2
	ldr	r5, [r3, #4]
	cmp	r5, #0
	beq	.L1298
	ldr	r0, [r5]
	bl	VCTRL_GetExtraFrameNum
	ldr	r2, [r5, #52]
	ldr	r1, [r5, #48]
	mov	r8, r0
	ldr	r0, [r5]
	bl	VCTRL_GetOccupiedNum
	cmp	r4, #0
	mov	r7, r0
	beq	.L1470
	ldr	r6, .L1486+8
	mov	r0, r4
	ldr	r1, .L1486+12
	ldr	r3, [r6, #268]
	blx	r3
	ldr	r3, [r6, #268]
	ldr	r2, [r5]
	mov	r0, r4
	ldr	r1, .L1486+16
	blx	r3
	ldr	r9, [r6, #268]
	ldr	r3, [r5, #28]
	mov	r0, r4
	ldr	r2, .L1486+20
	ldr	r1, .L1486+24
	blx	r9
	ldr	r3, [r5, #32]
	ldr	r2, .L1486+28
	mov	r0, r4
	ldr	r1, .L1486+24
	ldr	r9, [r6, #268]
	blx	r9
	mov	r3, r8
	ldr	r2, .L1486+32
	mov	r0, r4
	ldr	r1, .L1486+24
	ldr	r8, [r6, #268]
	blx	r8
	ldr	r2, .L1486+36
	mov	r3, r7
	ldr	r1, .L1486+24
	ldr	r7, [r6, #268]
	mov	r0, r4
	blx	r7
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+12
	mov	r0, r4
	blx	r3
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+160
	mov	r0, r4
	blx	r3
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #40]
	mov	r0, r4
	ldr	r2, .L1486+164
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #45]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+168
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+172
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #48]
	mov	r0, r4
	ldr	r2, .L1486+176
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #52]
	mov	r0, r4
	ldr	r2, .L1486+180
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #56]
	mov	r0, r4
	ldr	r2, .L1486+184
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #60]
	mov	r0, r4
	ldr	r2, .L1486+188
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #64]
	mov	r0, r4
	ldr	r2, .L1486+192
	ldr	r1, .L1486+24
	blx	r7
	ldr	r2, .L1486+196
	ldr	r7, [r6, #268]
	mov	r0, r4
	ldr	r3, [r5, #68]
	ldr	r1, .L1486+24
	blx	r7
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+12
	mov	r0, r4
	blx	r3
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+204
	mov	r0, r4
	blx	r3
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #120]
	mov	r0, r4
	ldr	r2, .L1486+208
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #124]
	mov	r0, r4
	ldr	r2, .L1486+212
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #116]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+216
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #117]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+220
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #118]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+224
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #128]
	mov	r0, r4
	ldr	r2, .L1486+228
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #132]
	mov	r0, r4
	ldr	r2, .L1486+232
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #136]
	mov	r0, r4
	ldr	r2, .L1486+236
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #140]
	mov	r0, r4
	ldr	r2, .L1486+240
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #144]
	mov	r0, r4
	ldr	r2, .L1486+244
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #148]
	mov	r0, r4
	ldr	r2, .L1486+248
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #152]
	mov	r0, r4
	ldr	r2, .L1486+252
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #156]
	mov	r0, r4
	ldr	r2, .L1486+256
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #112]
	mov	r0, r4
	ldr	r2, .L1486+260
	ldr	r1, .L1486+24
	blx	r7
	ldr	r1, [r5, #76]
	ldr	r2, .L1486+320
	mov	r0, r4
	cmp	r1, #1
	ldr	r3, .L1486+324
	ldr	r7, [r6, #268]
	movne	r3, r2
	ldr	r1, .L1486+332
	ldr	r2, .L1486+264
	blx	r7
	ldr	r3, [r5, #76]
	cmp	r3, #0
	beq	.L1308
	ldr	r7, [r6, #268]
	mov	r0, r4
	ldr	r3, [r5, #164]
	ldr	r2, .L1486+268
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #168]
	mov	r0, r4
	ldr	r2, .L1486+272
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #160]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+276
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #161]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+280
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldrb	r3, [r5, #162]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L1486+284
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #172]
	mov	r0, r4
	ldr	r2, .L1486+288
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #176]
	mov	r0, r4
	ldr	r2, .L1486+292
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #180]
	mov	r0, r4
	ldr	r2, .L1486+296
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #184]
	mov	r0, r4
	ldr	r2, .L1486+300
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #188]
	mov	r0, r4
	ldr	r2, .L1486+304
	ldr	r1, .L1486+24
	blx	r7
.L1308:
	ldr	r1, [r5, #80]
	mov	r0, r4
	ldr	r2, .L1486+320
	cmp	r1, #1
	ldr	r3, .L1486+324
	ldr	r7, [r6, #268]
	movne	r3, r2
	ldr	r1, .L1486+332
	ldr	r2, .L1486+308
	blx	r7
	ldr	r3, [r5, #80]
	cmp	r3, #0
	bne	.L1313
	cmp	r4, #0
	beq	.L1314
.L1315:
	ldr	r1, [r5, #84]
	mov	r0, r4
	ldr	r2, .L1486+320
	cmp	r1, #1
	ldr	r3, .L1486+324
	ldr	r7, [r6, #268]
	movne	r3, r2
	ldr	r1, .L1486+332
	ldr	r2, .L1486+328
	blx	r7
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L1471
	ldr	r7, [r6, #268]
	mov	r0, r4
	ldr	r3, [r5, #104]
	ldr	r2, .L1486+336
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #100]
	mov	r0, r4
	ldr	r2, .L1486+340
	ldr	r1, .L1486+24
	blx	r7
.L1322:
	ldr	r3, [r6, #268]
	mov	r0, r4
	ldr	r1, .L1486+12
	blx	r3
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+40
	mov	r0, r4
	blx	r3
.L1323:
	mov	r8, #0
	mov	r6, r5
	mov	r7, r8
	b	.L1334
.L1453:
	cmp	r4, #0
	beq	.L1327
	ldr	r2, .L1486+8
.L1328:
	ldr	r0, [r6, #216]
	sxtb	r1, r3
	ldr	ip, [r6, #220]
	cmp	r0, #0
	ldr	lr, [r6, #208]
	ldr	r10, [r6, #212]
	ldrne	r0, [r0, #4]
	cmp	ip, #0
	ldr	r9, [r2, #268]
	ldrne	ip, [ip, #4]
	ldr	r2, [r6, #196]
	ldr	r3, [r6, #204]
	str	r0, [sp, #12]
	mov	r0, r4
	stmia	sp, {r1, lr}
	str	ip, [sp, #16]
	str	r10, [sp, #8]
	ldr	r1, .L1486+44
	blx	r9
.L1331:
	add	r7, r7, #1
	add	r6, r6, #576
	cmp	r7, #32
	beq	.L1472
.L1334:
	ldrb	r3, [r6, #192]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1324
	ldr	r2, [r6, #212]
	cmp	r2, #0
	addeq	r8, r8, #1
	beq	.L1331
.L1324:
	cmp	r8, r7
	bne	.L1453
	cmp	r4, #0
	beq	.L1473
	ldr	r1, .L1486+48
	mov	r0, r4
	ldr	r3, .L1486+356
	ldr	r2, .L1486+52
	str	r1, [sp, #16]
	ldr	r1, .L1486+56
	str	r3, [sp]
	ldr	r3, .L1486+8
	str	r1, [sp, #12]
	ldr	r1, .L1486+352
	str	r2, [sp, #4]
	ldr	r2, .L1486+124
	str	r1, [sp, #8]
	ldr	r1, .L1486+60
	ldr	r9, [r3, #268]
	ldr	r3, .L1486+360
	blx	r9
	ldr	r2, .L1486+8
	ldrb	r3, [r6, #192]	@ zero_extendqisi2
	b	.L1328
.L1313:
	ldr	r7, [r6, #268]
	mov	r0, r4
	ldr	r3, [r5, #96]
	ldr	r2, .L1486+312
	ldr	r1, .L1486+24
	blx	r7
	ldr	r7, [r6, #268]
	ldr	r3, [r5, #92]
	mov	r0, r4
	ldr	r2, .L1486+316
	ldr	r1, .L1486+24
	blx	r7
	b	.L1315
.L1473:
	ldr	lr, .L1486+48
	mov	r1, #1088
	ldr	ip, .L1486+52
	mov	r0, #32
	ldr	r3, .L1486+356
	str	lr, [sp, #20]
	ldr	lr, .L1486+56
	ldr	r2, .L1486+360
	str	lr, [sp, #16]
	ldr	lr, .L1486+352
	stmia	sp, {r2, r3, ip, lr}
	ldr	r3, .L1486+124
	ldr	r2, .L1486+60
	bl	dprint_normal
	ldrb	r3, [r6, #192]	@ zero_extendqisi2
.L1327:
	ldr	r1, [r6, #216]
	sxtb	r2, r3
	ldr	r0, [r6, #220]
	add	r7, r7, #1
	cmp	r1, #0
	ldr	ip, [r6, #204]
	ldr	lr, [r6, #208]
	add	r6, r6, #576
	ldrne	r1, [r1, #4]
	cmp	r0, #0
	ldr	r9, [r6, #-364]
	ldrne	r0, [r0, #4]
	ldr	r3, [r6, #-380]
	str	r1, [sp, #16]
	movw	r1, #1095
	str	r0, [sp, #20]
	mov	r0, #32
	stmib	sp, {r2, lr}
	str	r9, [sp, #12]
	str	ip, [sp]
	ldr	r2, .L1486+44
	bl	dprint_normal
	cmp	r7, #32
	bne	.L1334
.L1472:
	cmp	r4, #0
	beq	.L1474
	ldr	r6, .L1486+8
	mov	r3, r8
	str	r7, [sp]
	mov	r0, r4
	ldr	r2, .L1486+76
	ldr	r1, .L1486+132
	ldr	r7, [r6, #268]
	blx	r7
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+12
	mov	r0, r4
	blx	r3
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L1475
	ldr	r3, .L1486+364
	mov	r0, r4
	ldr	r2, .L1486+360
	ldr	r1, .L1486+80
	mov	r7, r3
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r2, [fp, #-64]
	mov	r8, r3
	str	r3, [fp, #-56]
	ldr	r3, .L1486+352
	mov	r9, r3
	str	r3, [fp, #-68]
	ldr	r3, .L1486+372
	mov	r10, r3
	str	r3, [fp, #-72]
	ldr	r3, .L1486+356
	str	r3, [fp, #-60]
	ldr	r3, [r6, #268]
	blx	r3
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-64]
	mov	r0, r4
	str	r7, [sp, #20]
	str	r3, [sp, #4]
	str	r2, [sp]
	str	r8, [sp, #16]
	str	r9, [sp, #12]
	str	r10, [sp, #8]
	ldr	r3, .L1486+120
	ldr	r7, [r6, #268]
	ldr	r2, .L1486+124
	ldr	r1, .L1486+92
	blx	r7
	ldr	r3, [r5, #12]
	cmp	r3, #0
	streq	r3, [fp, #-76]
	beq	.L1343
.L1342:
	mov	r3, #0
	add	r6, r5, #18432
	str	r3, [fp, #-76]
	add	r6, r6, #236
	mov	r7, r3
	b	.L1341
.L1346:
	cmp	r4, #0
	movne	r1, #0
	beq	.L1476
.L1391:
	ldr	r3, .L1486+64
	cmp	r1, #0
	ldr	r0, .L1486+376
	ldr	r1, [r6, #-40]
	ldr	r8, [r6, #32]
	moveq	r3, r0
	str	r3, [fp, #-48]
	ldr	r2, [r6, #-8]
	mov	r0, r4
	ldrb	r3, [r6, #-44]	@ zero_extendqisi2
	ldrb	r9, [r6, #-43]	@ zero_extendqisi2
	ldr	r10, [r6, #36]
	str	r1, [sp, #20]
	ldr	r1, [fp, #-48]
	stmia	sp, {r8, r9, r10}
	str	r1, [sp, #24]
	ldr	r1, .L1486+8
	str	lr, [sp, #16]
	str	ip, [sp, #12]
	ldr	r8, [r1, #268]
	ldr	r1, .L1486+68
	blx	r8
.L1348:
	ldr	r3, [r5, #12]
	add	r7, r7, #1
	add	r6, r6, #96
	cmp	r7, r3
	bcs	.L1477
.L1341:
	mov	r3, r7, asl #7
	ldr	ip, [r6, #40]
	sub	r3, r3, r7, asl #5
	ldr	lr, [r6, #-4]
	add	r3, r5, r3
	add	r3, r3, #18432
	add	r3, r3, #192
	ldrh	r3, [r3]
	cmp	r3, #1
	bne	.L1346
	cmp	ip, #0
	bne	.L1346
	ldr	r2, [r5, #124]
	cmp	lr, r2
	bne	.L1346
	ldr	r1, [r6]
	ldr	r2, [r5, #136]
	cmp	r1, r2
	bne	.L1346
	ldr	r2, [fp, #-76]
	cmp	r4, #0
	add	r2, r2, #1
	movne	r1, r3
	str	r2, [fp, #-76]
	bne	.L1391
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-44]	@ zero_extendqisi2
	ldr	r9, [r6, #32]
	ldrb	r8, [r6, #-43]	@ zero_extendqisi2
	ldr	r2, [r6, #36]
	ldr	r0, [r6, #-40]
	ldr	r1, .L1486+64
.L1389:
	str	r1, [sp, #28]
	movw	r1, #1123
	str	r0, [sp, #24]
	mov	r0, #32
	str	r2, [sp, #12]
	str	lr, [sp, #20]
	str	ip, [sp, #16]
	str	r8, [sp, #8]
	str	r9, [sp, #4]
	str	r10, [sp]
	ldr	r2, .L1486+68
	bl	dprint_normal
	b	.L1348
.L1477:
	cmp	r4, #0
	beq	.L1340
	ldr	r6, .L1486+8
.L1343:
	str	r3, [sp]
	mov	r0, r4
	ldr	r3, [fp, #-76]
	ldr	r2, .L1486+84
	ldr	r1, .L1486+132
	ldr	r7, [r6, #268]
	blx	r7
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+12
	mov	r0, r4
	blx	r3
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L1350
.L1353:
	ldr	r3, [r6, #268]
	mov	r0, r4
	ldr	r1, .L1486+88
	blx	r3
	ldr	r3, [fp, #-52]
	mov	r0, r4
	ldr	r2, .L1486+124
	ldr	r1, .L1486+92
	str	r3, [sp, #20]
	ldr	r3, [fp, #-56]
	str	r3, [sp, #16]
	ldr	r3, [fp, #-68]
	str	r3, [sp, #12]
	ldr	r3, [fp, #-72]
	str	r3, [sp, #8]
	ldr	r3, [fp, #-60]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-64]
	str	r3, [sp]
	ldr	r3, .L1486+120
	ldr	r7, [r6, #268]
	blx	r7
	ldr	r3, [r5, #16]
	cmp	r3, #0
	streq	r3, [fp, #-60]
	beq	.L1355
.L1351:
	mov	r3, #0
	add	r6, r5, #21504
	str	r3, [fp, #-60]
	add	r6, r6, #236
	mov	r7, r3
	b	.L1354
.L1358:
	cmp	r4, #0
	movne	r1, #0
	beq	.L1478
.L1395:
	ldr	r3, .L1486+64
	cmp	r1, #0
	ldr	r0, .L1486+376
	ldr	r1, [r6, #-40]
	ldr	r8, [r6, #32]
	moveq	r3, r0
	str	r3, [fp, #-48]
	ldr	r2, [r6, #-8]
	mov	r0, r4
	ldrb	r3, [r6, #-44]	@ zero_extendqisi2
	ldrb	r9, [r6, #-43]	@ zero_extendqisi2
	ldr	r10, [r6, #36]
	str	r1, [sp, #20]
	ldr	r1, [fp, #-48]
	stmia	sp, {r8, r9, r10}
	str	r1, [sp, #24]
	ldr	r1, .L1486+8
	str	lr, [sp, #16]
	str	ip, [sp, #12]
	ldr	r8, [r1, #268]
	ldr	r1, .L1486+68
	blx	r8
.L1360:
	ldr	r3, [r5, #16]
	add	r7, r7, #1
	add	r6, r6, #96
	cmp	r7, r3
	bcs	.L1479
.L1354:
	mov	r3, r7, asl #7
	ldr	ip, [r6, #40]
	sub	r3, r3, r7, asl #5
	ldr	lr, [r6, #-4]
	add	r3, r5, r3
	add	r3, r3, #21504
	add	r3, r3, #192
	ldrh	r3, [r3]
	cmp	r3, #1
	bne	.L1358
	cmp	ip, #0
	bne	.L1358
	ldr	r2, [r5, #168]
	cmp	lr, r2
	bne	.L1358
	ldr	r1, [r6]
	ldr	r2, [r5, #180]
	cmp	r1, r2
	bne	.L1358
	ldr	r2, [fp, #-60]
	cmp	r4, #0
	add	r2, r2, #1
	movne	r1, r3
	str	r2, [fp, #-60]
	bne	.L1395
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-44]	@ zero_extendqisi2
	ldr	r9, [r6, #32]
	ldrb	r8, [r6, #-43]	@ zero_extendqisi2
	ldr	r2, [r6, #36]
	ldr	r0, [r6, #-40]
	ldr	r1, .L1486+64
.L1393:
	str	r1, [sp, #28]
	mov	r1, #1152
	str	r0, [sp, #24]
	mov	r0, #32
	str	r2, [sp, #12]
	str	lr, [sp, #20]
	str	ip, [sp, #16]
	str	r8, [sp, #8]
	str	r9, [sp, #4]
	str	r10, [sp]
	ldr	r2, .L1486+68
	bl	dprint_normal
	b	.L1360
.L1475:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	bne	.L1480
.L1350:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L1362
	cmp	r4, #0
	beq	.L1430
	ldr	r3, .L1486+364
	ldr	r6, .L1486+8
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r3, [fp, #-56]
.L1365:
	ldr	r3, [r6, #268]
	mov	r0, r4
	ldr	r1, .L1486+100
	blx	r3
	ldr	r3, .L1486+348
	ldr	r1, [fp, #-52]
	mov	r0, r4
	mov	r2, r3
	str	r3, [fp, #-48]
	str	r1, [sp, #12]
	ldr	r3, .L1486+104
	ldr	r1, [fp, #-56]
	str	r2, [sp]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	ldr	r3, .L1486+120
	ldr	r7, [r6, #268]
	ldr	r2, .L1486+124
	ldr	r1, .L1486+128
	blx	r7
	ldr	r3, [r5, #20]
	cmp	r3, #0
	streq	r3, [fp, #-60]
	beq	.L1368
.L1363:
	mov	r3, #0
	add	r6, r5, #24576
	str	r3, [fp, #-60]
	add	r6, r6, #204
	mov	r7, r3
	ldr	r9, .L1486+376
	b	.L1367
.L1371:
	cmp	r4, #0
	movne	r1, #0
	beq	.L1481
.L1399:
	ldr	r3, .L1486+64
	cmp	r1, #0
	ldr	r10, [r6, #4]
	mov	r0, r4
	moveq	r3, r9
	ldr	r2, [r6, #-8]
	ldrb	lr, [r6, #-11]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r8, [r6, #-4]
	ldrb	r3, [r6, #-12]	@ zero_extendqisi2
	str	r1, [sp, #16]
	ldr	r1, .L1486+8
	str	r8, [sp, #12]
	str	r10, [sp, #4]
	str	lr, [sp]
	str	ip, [sp, #8]
	ldr	r10, [r1, #268]
	ldr	r1, .L1486+72
	blx	r10
.L1372:
	ldr	r3, [r5, #20]
	add	r7, r7, #1
	add	r6, r6, #24
	cmp	r7, r3
	bcs	.L1482
.L1367:
	mov	r3, r7, asl #5
	ldr	r2, [r5, #92]
	sub	r3, r3, r7, asl #3
	ldr	ip, [r6]
	add	r3, r5, r3
	add	r3, r3, #24576
	ldrh	r1, [r3, #192]
	cmp	r1, #1
	bne	.L1371
	cmp	r2, ip
	bne	.L1371
	ldr	r3, [fp, #-60]
	cmp	r4, #0
	add	r3, r3, #1
	str	r3, [fp, #-60]
	bne	.L1399
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-12]	@ zero_extendqisi2
	ldrb	lr, [r6, #-11]	@ zero_extendqisi2
	ldr	r2, [r6, #4]
	ldr	r0, [r6, #-4]
	ldr	r1, .L1486+64
.L1397:
	str	r1, [sp, #20]
	movw	r1, #1180
	str	r0, [sp, #16]
	mov	r0, #32
	str	r2, [sp, #8]
	str	ip, [sp, #12]
	stmia	sp, {r10, lr}
	ldr	r2, .L1486+72
	bl	dprint_normal
	b	.L1372
.L1479:
	cmp	r4, #0
	beq	.L1352
	ldr	r6, .L1486+8
.L1355:
	str	r3, [sp]
	mov	r0, r4
	ldr	r3, [fp, #-60]
	ldr	r2, .L1486+96
	ldr	r1, .L1486+132
	ldr	r7, [r6, #268]
	blx	r7
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+12
	mov	r0, r4
	blx	r3
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L1365
.L1362:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L1297
	cmp	r4, #0
	beq	.L1432
	ldr	r3, .L1486+364
	ldr	r6, .L1486+8
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r3, [fp, #-56]
	ldr	r3, .L1486+348
	str	r3, [fp, #-48]
.L1378:
	ldr	r3, [r6, #268]
	mov	r0, r4
	ldr	r1, .L1486+112
	blx	r3
	ldr	r2, [fp, #-52]
	ldr	r3, .L1486+116
	mov	r0, r4
	ldr	r1, .L1486+128
	str	r2, [sp, #12]
	ldr	r2, [fp, #-56]
	str	r2, [sp, #8]
	ldr	r2, [fp, #-48]
	stmia	sp, {r2, r3}
	ldr	r3, .L1486+120
	ldr	r7, [r6, #268]
	ldr	r2, .L1486+124
	blx	r7
	ldr	r3, [r5, #24]
	cmp	r3, #0
	streq	r3, [fp, #-48]
	beq	.L1381
.L1376:
	mov	r3, #0
	add	r6, r5, #25344
	str	r3, [fp, #-48]
	add	r6, r6, #204
	mov	r7, r3
	ldr	r9, .L1486+376
	b	.L1380
.L1384:
	cmp	r4, #0
	movne	r1, #0
	beq	.L1483
.L1403:
	ldr	r3, .L1486+64
	cmp	r1, #0
	ldrb	r10, [r6, #-10]	@ zero_extendqisi2
	mov	r0, r4
	moveq	r3, r9
	ldr	r2, [r6, #-8]
	ldrb	lr, [r6, #-11]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r8, [r6, #-4]
	ldrb	r3, [r6, #-12]	@ zero_extendqisi2
	str	r1, [sp, #16]
	ldr	r1, .L1486+8
	str	r8, [sp, #12]
	str	r10, [sp, #4]
	str	lr, [sp]
	str	ip, [sp, #8]
	ldr	r10, [r1, #268]
	ldr	r1, .L1486+72
	blx	r10
.L1385:
	ldr	r3, [r5, #24]
	add	r7, r7, #1
	add	r6, r6, #16
	cmp	r7, r3
	bcs	.L1484
.L1380:
	add	r3, r7, #1584
	ldr	r2, [r5, #100]
	add	r3, r3, #12
	ldr	ip, [r6]
	mov	r3, r3, asl #4
	ldrh	r1, [r5, r3]
	cmp	r1, #1
	bne	.L1384
	cmp	r2, ip
	bne	.L1384
	ldr	r3, [fp, #-48]
	cmp	r4, #0
	add	r3, r3, #1
	str	r3, [fp, #-48]
	bne	.L1403
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-12]	@ zero_extendqisi2
	ldrb	lr, [r6, #-11]	@ zero_extendqisi2
	ldrb	r2, [r6, #-10]	@ zero_extendqisi2
	ldr	r0, [r6, #-4]
	ldr	r1, .L1486+64
.L1401:
	str	r1, [sp, #20]
	movw	r1, #1208
	str	r0, [sp, #16]
	mov	r0, #32
	str	r2, [sp, #8]
	str	ip, [sp, #12]
	stmia	sp, {r10, lr}
	ldr	r2, .L1486+72
	bl	dprint_normal
	b	.L1385
.L1482:
	cmp	r4, #0
	beq	.L1364
	ldr	r6, .L1486+8
.L1368:
	str	r3, [sp]
	mov	r0, r4
	ldr	r3, [fp, #-60]
	ldr	r2, .L1486+108
	ldr	r1, .L1486+132
	ldr	r7, [r6, #268]
	blx	r7
	ldr	r3, [r6, #268]
	ldr	r1, .L1486+12
	mov	r0, r4
	blx	r3
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L1378
.L1297:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1484:
	cmp	r4, #0
	beq	.L1377
	ldr	r6, .L1486+8
.L1381:
	str	r3, [sp]
	mov	r0, r4
	ldr	r3, [fp, #-48]
	ldr	r5, [r6, #268]
	ldr	r2, .L1486+136
	ldr	r1, .L1486+132
	blx	r5
	ldr	r3, [r6, #268]
	mov	r0, r4
	ldr	r1, .L1486+12
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1471:
	cmp	r4, #0
	bne	.L1322
.L1321:
	ldr	r2, .L1486+12
	movw	r1, #1062
	mov	r0, #32
	bl	dprint_normal
	ldr	r2, .L1486+40
	movw	r1, #1073
	mov	r0, #32
	bl	dprint_normal
	b	.L1323
.L1480:
	ldr	r3, .L1486+352
	str	r3, [fp, #-68]
	ldr	r3, .L1486+356
	str	r3, [fp, #-60]
	ldr	r3, .L1486+360
	str	r3, [fp, #-64]
	ldr	r3, .L1486+364
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r3, [fp, #-56]
	ldr	r3, .L1486+372
	str	r3, [fp, #-72]
	b	.L1353
.L1487:
	.align	2
.L1486:
	.word	.LC87
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC138
	.word	.LC147
	.word	.LC141
	.word	.LC144
	.word	.LC142
	.word	.LC140
	.word	.LC86
	.word	.LC156
	.word	.LC164
	.word	.LC148
	.word	.LC150
	.word	.LC157
	.word	.LC158
	.word	.LC151
	.word	.LC159
	.word	.LC160
	.word	.LC162
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC155
	.word	.LC139
	.word	.LC161
	.word	.LC149
	.word	.LC168
	.word	.LC89
	.word	.LC90
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC88
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC122
	.word	.LC123
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC133
	.word	.LC134
	.word	.LC84
	.word	.LC83
	.word	.LC135
	.word	.LC121
	.word	.LC136
	.word	.LC137
	.word	.LC91
	.word	.LC163
	.word	.LC143
	.word	.LC145
	.word	.LC146
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC85
.L1474:
	ldr	r3, .L1486+76
	movw	r1, #1098
	ldr	r2, .L1486+132
	mov	r0, r7
	str	r7, [sp, #4]
	str	r8, [sp]
	bl	dprint_normal
	ldr	r2, .L1486+200
	movw	r1, #1099
	mov	r0, r7
	bl	dprint_normal
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L1485
	ldr	r3, .L1486+364
	movw	r1, #1111
	ldr	r2, .L1486+80
	mov	r0, r7
	mov	r6, r3
	str	r3, [fp, #-52]
	bl	dprint_normal
	ldr	r3, .L1486+368
	mov	r0, r7
	movw	r1, #1112
	str	r6, [sp, #24]
	mov	ip, r3
	str	r3, [fp, #-56]
	ldr	r3, .L1486+352
	str	ip, [sp, #20]
	ldr	r2, .L1486+92
	mov	lr, r3
	str	r3, [fp, #-68]
	ldr	r3, .L1486+372
	str	lr, [sp, #16]
	mov	r7, r3
	str	r3, [fp, #-72]
	ldr	r3, .L1486+356
	str	r7, [sp, #12]
	mov	r8, r3
	str	r3, [fp, #-60]
	ldr	r3, .L1486+360
	str	r8, [sp, #8]
	mov	r9, r3
	str	r3, [fp, #-64]
	ldr	r3, .L1486+120
	str	r9, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L1486+124
	bl	dprint_normal
	ldr	r3, [r5, #12]
	cmp	r3, #0
	bne	.L1342
	str	r4, [fp, #-76]
.L1340:
	str	r3, [sp, #4]
	movw	r1, #1126
	ldr	r3, [fp, #-76]
	mov	r0, #32
	ldr	r2, .L1486+132
	str	r3, [sp]
	ldr	r3, .L1486+84
	bl	dprint_normal
	ldr	r2, .L1486+200
	movw	r1, #1127
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L1350
.L1405:
	ldr	r2, .L1486+88
	movw	r1, #1140
	mov	r0, #32
	bl	dprint_normal
	ldr	r2, [fp, #-52]
	ldr	r3, .L1486+120
	movw	r1, #1141
	mov	r0, #32
	str	r2, [sp, #24]
	ldr	r2, [fp, #-56]
	str	r3, [sp]
	ldr	r3, .L1486+124
	str	r2, [sp, #20]
	ldr	r2, [fp, #-68]
	str	r2, [sp, #16]
	ldr	r2, [fp, #-72]
	str	r2, [sp, #12]
	ldr	r2, [fp, #-60]
	str	r2, [sp, #8]
	ldr	r2, [fp, #-64]
	str	r2, [sp, #4]
	ldr	r2, .L1486+92
	bl	dprint_normal
	ldr	r3, [r5, #16]
	cmp	r3, #0
	streq	r3, [fp, #-60]
	bne	.L1351
.L1352:
	str	r3, [sp, #4]
	movw	r1, #1155
	ldr	r3, [fp, #-60]
	mov	r0, #32
	ldr	r2, .L1486+132
	str	r3, [sp]
	ldr	r3, .L1486+96
	bl	dprint_normal
	ldr	r2, .L1486+200
	movw	r1, #1156
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L1362
.L1366:
	ldr	r3, .L1486+348
	movw	r1, #1169
	ldr	r2, .L1486+100
	mov	r0, #32
	mov	r6, r3
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r0, [fp, #-52]
	ldr	r2, .L1486+104
	movw	r1, #1170
	ldr	r3, .L1486+120
	ldr	ip, [fp, #-56]
	str	r0, [sp, #16]
	mov	r0, #32
	str	r2, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldr	r3, .L1486+124
	str	r6, [sp, #4]
	ldr	r2, .L1486+128
	bl	dprint_normal
	ldr	r3, [r5, #20]
	cmp	r3, #0
	streq	r3, [fp, #-60]
	bne	.L1363
.L1364:
	str	r3, [sp, #4]
	movw	r1, #1183
	ldr	r3, [fp, #-60]
	mov	r0, #32
	ldr	r2, .L1486+132
	str	r3, [sp]
	ldr	r3, .L1486+108
	bl	dprint_normal
	ldr	r2, .L1486+200
	mov	r1, #1184
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L1297
.L1374:
	ldr	r2, .L1486+112
	movw	r1, #1197
	mov	r0, #32
	bl	dprint_normal
	ldr	ip, [fp, #-56]
	ldr	r0, [fp, #-52]
	movw	r1, #1198
	ldr	r2, .L1486+116
	ldr	r3, .L1486+120
	str	ip, [sp, #12]
	ldr	ip, [fp, #-48]
	str	r0, [sp, #16]
	mov	r0, #32
	str	r2, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #4]
	ldr	r3, .L1486+124
	ldr	r2, .L1486+128
	bl	dprint_normal
	ldr	r3, [r5, #24]
	cmp	r3, #0
	streq	r3, [fp, #-48]
	bne	.L1376
.L1377:
	str	r3, [sp, #4]
	movw	r1, #1211
	ldr	r3, [fp, #-48]
	mov	r0, #32
	ldr	r2, .L1486+132
	str	r3, [sp]
	ldr	r3, .L1486+136
	bl	dprint_normal
	ldr	r2, .L1486+200
	movw	r1, #1212
	mov	r0, #32
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L1470:
	ldr	r2, .L1486+200
	mov	r1, #988
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [r5]
	ldr	r2, .L1486+140
	movw	r1, #989
	mov	r0, #32
	bl	dprint_normal
	ldr	ip, [r5, #28]
	ldr	r3, .L1486+144
	movw	r1, #990
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #32]
	ldr	r3, .L1486+148
	movw	r1, #991
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, .L1486+152
	mov	r1, #992
	ldr	r2, .L1486+344
	str	r8, [sp]
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, .L1486+156
	movw	r1, #993
	ldr	r2, .L1486+344
	str	r7, [sp]
	mov	r0, #32
	bl	dprint_normal
	ldr	r2, .L1486+200
	movw	r1, #994
	mov	r0, #32
	bl	dprint_normal
	ldr	r2, .L1486+160
	movw	r1, #999
	mov	r0, #32
	bl	dprint_normal
	ldr	ip, [r5, #40]
	ldr	r3, .L1486+164
	mov	r1, #1000
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #45]	@ zero_extendqisi2
	ldr	r3, .L1486+168
	movw	r1, #1001
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #44]	@ zero_extendqisi2
	ldr	r3, .L1486+172
	movw	r1, #1002
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #48]
	ldr	r3, .L1486+176
	movw	r1, #1003
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #52]
	ldr	r3, .L1486+180
	mov	r1, #1004
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #56]
	ldr	r3, .L1486+184
	movw	r1, #1005
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #60]
	ldr	r3, .L1486+188
	movw	r1, #1006
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #64]
	ldr	r3, .L1486+192
	movw	r1, #1007
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #68]
	ldr	r3, .L1486+196
	mov	r1, #1008
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, .L1486+200
	movw	r1, #1009
	mov	r0, #32
	bl	dprint_normal
	ldr	r2, .L1486+204
	movw	r1, #1014
	mov	r0, #32
	bl	dprint_normal
	ldr	ip, [r5, #120]
	ldr	r3, .L1486+208
	movw	r1, #1015
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #124]
	ldr	r3, .L1486+212
	mov	r1, #1016
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #116]	@ zero_extendqisi2
	ldr	r3, .L1486+216
	movw	r1, #1017
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #117]	@ zero_extendqisi2
	ldr	r3, .L1486+220
	movw	r1, #1018
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #118]	@ zero_extendqisi2
	ldr	r3, .L1486+224
	movw	r1, #1019
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #128]
	ldr	r3, .L1486+228
	mov	r1, #1020
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #132]
	ldr	r3, .L1486+232
	movw	r1, #1021
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #136]
	ldr	r3, .L1486+236
	movw	r1, #1022
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #140]
	ldr	r3, .L1486+240
	movw	r1, #1023
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #144]
	ldr	r3, .L1486+244
	mov	r1, #1024
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #148]
	ldr	r3, .L1486+248
	movw	r1, #1025
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #152]
	ldr	r3, .L1486+252
	movw	r1, #1026
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #156]
	ldr	r3, .L1486+256
	movw	r1, #1027
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #112]
	ldr	r3, .L1486+260
	movw	r1, #1028
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	lr, [r5, #76]
	ldr	ip, .L1486+320
	movw	r1, #1030
	ldr	r2, .L1486+324
	cmp	lr, #1
	ldr	r3, .L1486+264
	mov	r0, #32
	moveq	ip, r2
	ldr	r2, .L1486+332
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r5, #76]
	cmp	r3, #0
	beq	.L1306
	ldr	ip, [r5, #164]
	movw	r1, #1034
	ldr	r3, .L1486+268
	mov	r0, #32
	ldr	r2, .L1486+344
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #168]
	ldr	r3, .L1486+272
	movw	r1, #1035
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #160]	@ zero_extendqisi2
	ldr	r3, .L1486+276
	movw	r1, #1036
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #161]	@ zero_extendqisi2
	ldr	r3, .L1486+280
	movw	r1, #1037
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	ip, [r5, #162]	@ zero_extendqisi2
	ldr	r3, .L1486+284
	movw	r1, #1038
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #172]
	ldr	r3, .L1486+288
	movw	r1, #1039
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #176]
	ldr	r3, .L1486+292
	mov	r1, #1040
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #180]
	ldr	r3, .L1486+296
	movw	r1, #1041
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #184]
	ldr	r3, .L1486+300
	movw	r1, #1042
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #188]
	ldr	r3, .L1486+304
	movw	r1, #1043
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
.L1306:
	ldr	lr, [r5, #80]
	movw	r1, #1046
	ldr	ip, .L1486+320
	mov	r0, #32
	ldr	r2, .L1486+324
	cmp	lr, #1
	ldr	r3, .L1486+308
	moveq	ip, r2
	ldr	r2, .L1486+332
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r5, #80]
	cmp	r3, #0
	beq	.L1314
	ldr	ip, [r5, #96]
	movw	r1, #1050
	ldr	r3, .L1486+312
	mov	r0, #32
	ldr	r2, .L1486+344
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #92]
	ldr	r3, .L1486+316
	movw	r1, #1051
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
.L1314:
	ldr	lr, [r5, #84]
	movw	r1, #1054
	ldr	ip, .L1486+320
	mov	r0, #32
	ldr	r2, .L1486+324
	cmp	lr, #1
	ldr	r3, .L1486+328
	moveq	ip, r2
	ldr	r2, .L1486+332
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L1321
	ldr	ip, [r5, #104]
	movw	r1, #1058
	ldr	r3, .L1486+336
	mov	r0, #32
	ldr	r2, .L1486+344
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #100]
	ldr	r3, .L1486+340
	movw	r1, #1059
	ldr	r2, .L1486+344
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	b	.L1321
.L1432:
	ldr	r3, .L1486+364
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r3, [fp, #-56]
	ldr	r3, .L1486+348
	str	r3, [fp, #-48]
	b	.L1374
.L1430:
	ldr	r3, .L1486+364
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r3, [fp, #-56]
	b	.L1366
.L1485:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L1350
	ldr	r3, .L1486+352
	str	r3, [fp, #-68]
	ldr	r3, .L1486+356
	str	r3, [fp, #-60]
	ldr	r3, .L1486+360
	str	r3, [fp, #-64]
	ldr	r3, .L1486+364
	str	r3, [fp, #-52]
	ldr	r3, .L1486+368
	str	r3, [fp, #-56]
	ldr	r3, .L1486+372
	str	r3, [fp, #-72]
	b	.L1405
.L1481:
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-12]	@ zero_extendqisi2
	ldrb	lr, [r6, #-11]	@ zero_extendqisi2
	ldr	r2, [r6, #4]
	ldr	r0, [r6, #-4]
	ldr	r1, .L1486+376
	b	.L1397
.L1483:
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-12]	@ zero_extendqisi2
	ldrb	lr, [r6, #-11]	@ zero_extendqisi2
	ldrb	r2, [r6, #-10]	@ zero_extendqisi2
	ldr	r0, [r6, #-4]
	ldr	r1, .L1486+376
	b	.L1401
.L1478:
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-44]	@ zero_extendqisi2
	ldr	r9, [r6, #32]
	ldrb	r8, [r6, #-43]	@ zero_extendqisi2
	ldr	r2, [r6, #36]
	ldr	r0, [r6, #-40]
	ldr	r1, .L1486+376
	b	.L1393
.L1476:
	ldr	r3, [r6, #-8]
	ldrb	r10, [r6, #-44]	@ zero_extendqisi2
	ldr	r9, [r6, #32]
	ldrb	r8, [r6, #-43]	@ zero_extendqisi2
	ldr	r2, [r6, #36]
	ldr	r0, [r6, #-40]
	ldr	r1, .L1486+376
	b	.L1389
	UNWIND(.fnend)
	.size	FSP_DumpState, .-FSP_DumpState
	.align	2
	.global	FSP_UnBindExternFs
	.type	FSP_UnBindExternFs, %function
FSP_UnBindExternFs:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L1507
	ldr	r7, .L1510
	add	r7, r7, r0, lsl #2
	ldr	r0, [r7, #4]
	cmp	r0, #0
	beq	.L1508
	ldr	r8, .L1510+4
	mov	r4, #1
	mov	r0, #3
	str	r4, [r5, #304]
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r9, [r7, #4]
	ldr	r1, [r5, #32]
	add	r3, r9, #20480
	ldr	r3, [r3, #1220]
	cmp	r3, r1
	beq	.L1499
	add	r3, r9, #21760
	add	r3, r3, #36
	b	.L1495
.L1505:
	add	r4, r4, #1
	cmp	r4, #32
	beq	.L1496
.L1495:
	ldr	r2, [r3]
	add	r3, r3, #96
	cmp	r2, r1
	bne	.L1505
.L1492:
	mov	r7, r4, asl #5
	mov	r10, r4, asl #7
	rsb	r2, r7, r10
	add	r2, r9, r2
	add	r1, r2, #21760
	add	r1, r1, #16
	ldr	r3, [r1, #4]
	cmp	r3, #0
	bne	.L1509
.L1494:
	rsb	r0, r7, r10
	movw	r2, #21704
	add	r3, r9, r0
	movw	ip, #21736
	mov	r1, #0
	add	r0, r0, #21504
	ldr	lr, [r3, r2]
	movw	r2, #21712
	str	r1, [r5, #44]
	add	r0, r0, #192
	add	r0, r9, r0
	str	lr, [r5, #40]
	movw	lr, #21720
	ldr	r4, [r3, ip]
	movw	ip, #21728
	str	r4, [r5, #56]
	ldr	r4, [r3, r2]
	mov	r2, #96
	str	r4, [r5, #184]
	ldrd	r6, [r3, lr]
	strd	r6, [r5, #192]
	ldr	ip, [r3, ip]
	ldr	r3, [r8, #48]
	str	ip, [r5, #208]
	blx	r3
	ldr	ip, [r9, #16]
	movw	r1, #2855
	ldr	r3, .L1510+8
	cmp	ip, #0
	mov	r0, #14
	subne	ip, ip, #1
	strne	ip, [r9, #16]
	ldr	r2, [r5, #208]
	str	r2, [sp, #24]
	ldrd	r6, [r5, #192]
	ldr	r2, .L1510+12
	strd	r6, [sp, #16]
	ldr	lr, [r5, #184]
	str	lr, [sp, #12]
	ldr	lr, [r5, #56]
	str	lr, [sp, #8]
	ldr	lr, [r5, #32]
	stmia	sp, {ip, lr}
	bl	dprint_normal
	ldr	r3, [r8, #16]
	mov	r0, #3
	blx	r3
	mov	r0, #0
.L1504:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1509:
	movw	r3, #21736
	mov	r0, #2
	str	r0, [r5, #304]
	add	r0, r2, #21504
	ldr	lr, [r2, r3]
	movw	ip, #21696
	ldr	r3, .L1510+8
	str	lr, [sp, #12]
	ldr	lr, [r1, #4]
	movw	r1, #2820
	str	lr, [sp, #8]
	ldrb	lr, [r0, #193]	@ zero_extendqisi2
	mov	r0, #0
	str	lr, [sp, #4]
	ldrb	ip, [r2, ip]	@ zero_extendqisi2
	ldr	r2, .L1510+16
	str	ip, [sp]
	bl	dprint_normal
	cmp	r4, #31
	ble	.L1494
.L1496:
	mov	r0, r6
	mov	r3, #2
	mov	r1, #0
	str	r3, [r5, #304]
	bl	FSP_DumpState
	ldr	r3, [r8, #16]
	mov	r0, #3
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1499:
	mov	r4, #0
	b	.L1492
.L1508:
	ldr	ip, .L1510+20
	movw	r1, #2799
	ldr	r3, .L1510+8
	ldr	r2, .L1510+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1504
.L1507:
	ldr	ip, .L1510+28
	mov	r0, r5
	ldr	r3, .L1510+8
	movw	r1, #2798
	ldr	r2, .L1510+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1504
.L1511:
	.align	2
.L1510:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1252
	.word	.LC49
	.word	.LC169
	.word	.LC28
	.word	.LC22
	.word	.LC39
	UNWIND(.fnend)
	.size	FSP_UnBindExternFs, .-FSP_UnBindExternFs
	.align	2
	.type	FSP_ResortDecFsPool, %function
FSP_ResortDecFsPool:
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
	ldr	ip, [r0, #120]
	ldr	r3, [r0, #12]
	mov	r10, r0
	subs	r3, ip, r3
	str	r3, [fp, #-60]
	bmi	.L1536
.L1514:
	cmp	ip, #0
	add	r3, r10, #18432
	add	r3, r3, #192
	str	r3, [fp, #-56]
	beq	.L1529
.L1542:
	mvn	r9, #0
	mov	r7, #0
	mov	lr, r9
	mov	r6, r9
	mov	r8, r9
	mov	r3, r7
	ldr	r2, [fp, #-56]
	b	.L1518
.L1538:
	cmn	r8, #1
	moveq	r8, r3
	beq	.L1517
	cmn	r6, #1
	moveq	r6, r3
.L1517:
	add	r3, r3, #1
	add	r2, r2, #96
	cmp	r3, ip
	beq	.L1537
.L1518:
	ldrb	r1, [r2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1538
	mov	r9, lr
	mov	lr, r3
	add	r3, r3, #1
	add	r7, r7, #1
	cmp	r3, ip
	add	r2, r2, #96
	bne	.L1518
.L1537:
	cmp	r8, lr
	bge	.L1515
	cmn	lr, #1
	cmnne	r8, #1
	moveq	r0, #1
	movne	r0, #0
	beq	.L1539
	mov	r5, r8, asl #7
	mov	r3, lr, asl #7
	sub	r5, r5, r8, asl #5
	sub	lr, r3, lr, asl #5
	add	r3, r10, r5
	str	r3, [fp, #-52]
	add	r3, r3, #18432
	add	r5, r5, #18432
	add	r3, r3, #192
	add	r4, lr, #18432
	add	r5, r5, #192
	add	r4, r4, #192
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r5, r10, r5
	add	r4, r10, r4
	cmp	r3, #0
	str	r3, [fp, #-48]
	bne	.L1540
	add	lr, r10, lr
	add	r3, lr, #18432
	add	r3, r3, #192
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1541
	ldr	r3, .L1543
	mov	r2, #96
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L1543
	ldr	r1, [fp, #-48]
	mov	r2, #96
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [fp, #-52]
	add	r1, r10, #18432
	add	r2, r3, #18432
	mov	r3, r10
	str	r8, [r2, #228]
.L1527:
	ldr	r2, [r3, #216]
	cmp	r4, r2
	streq	r5, [r3, #216]
	beq	.L1524
	cmp	r5, r2
	streq	r4, [r3, #216]
.L1524:
	ldr	r2, [r3, #220]
	cmp	r4, r2
	streq	r5, [r3, #220]
	beq	.L1526
	cmp	r5, r2
	streq	r4, [r3, #220]
.L1526:
	add	r3, r3, #576
	cmp	r3, r1
	bne	.L1527
	cmp	r9, r6
	ble	.L1515
	ldr	ip, [r10, #120]
	cmp	ip, #0
	bne	.L1542
.L1529:
	mov	r7, ip
.L1515:
	ldr	r3, [fp, #-60]
	str	r7, [r10, #12]
	add	r3, r7, r3
	str	r3, [r10, #120]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1541:
	ldr	ip, .L1543+4
	movw	r1, #1388
	ldr	r0, [fp, #-48]
	ldr	r3, .L1543+8
	ldr	r2, .L1543+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1515
.L1539:
	ldr	ip, .L1543+16
	movw	r1, #1381
	ldr	r3, .L1543+8
	mov	r0, #0
	ldr	r2, .L1543+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1515
.L1540:
	ldr	ip, .L1543+20
	movw	r1, #1387
	ldr	r3, .L1543+8
	ldr	r2, .L1543+12
	str	ip, [sp]
	bl	dprint_normal
	b	.L1515
.L1536:
	ldr	r2, .L1543+24
	movw	r1, #1432
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r10, #12]
	mov	r1, #0
	ldr	r0, [r10]
	str	r1, [fp, #-60]
	str	r3, [r10, #120]
	bl	FSP_DumpState
	ldr	ip, [r10, #120]
	b	.L1514
.L1544:
	.align	2
.L1543:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC173
	.word	.LANCHOR0+1272
	.word	.LC22
	.word	.LC171
	.word	.LC172
	.word	.LC170
	UNWIND(.fnend)
	.size	FSP_ResortDecFsPool, .-FSP_ResortDecFsPool
	.align	2
	.global	FSP_ReleaseUnusedOldDecFs
	.type	FSP_ReleaseUnusedOldDecFs, %function
FSP_ReleaseUnusedOldDecFs:
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
	cmp	r0, #3
	mov	r9, r0
	bhi	.L1560
	ldr	r4, .L1566
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L1561
	ldr	r10, .L1566+4
	mov	r0, #3
	ldr	r3, [r10, #12]
	blx	r3
	ldr	r6, [r4, #4]
	ldr	ip, [r6, #12]
	cmp	ip, #0
	beq	.L1550
	mov	r8, #0
	add	r4, r6, #18432
	add	r4, r4, #192
	mov	r7, r8
	mov	r5, r8
	b	.L1554
.L1563:
	str	r5, [sp]
	add	r7, r7, r0
	bl	dprint_normal
	ldr	ip, [r6, #12]
.L1552:
	add	r5, r5, #1
	add	r4, r4, #96
	cmp	r5, ip
	bcs	.L1562
.L1554:
	ldrb	r2, [r4]	@ zero_extendqisi2
	mov	r0, #1
	movw	r1, #3381
	ldr	r3, .L1566+8
	cmp	r2, r0
	ldr	r2, .L1566+12
	bne	.L1563
	ldr	r2, [r6, #124]
	ldr	r3, [r4, #40]
	cmp	r2, r3
	beq	.L1564
.L1553:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1552
	ldr	r1, [r4, #84]
	mov	r2, r4
	mov	r0, r9
	cmp	r1, #0
	bne	.L1552
	bl	FSP_ReleaseFs
	ldr	ip, [r6, #12]
	add	r5, r5, #1
	add	r8, r8, #1
	cmp	r5, ip
	add	r4, r4, #96
	bcc	.L1554
.L1562:
	orrs	r3, r7, r8
	bne	.L1565
.L1550:
	ldr	r3, [r10, #16]
	mov	r0, #3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1564:
	ldr	r2, [r4, #44]
	ldr	r3, [r6, #136]
	cmp	r2, r3
	bne	.L1553
	b	.L1552
.L1565:
	mov	r0, r6
	bl	FSP_ResortDecFsPool
	b	.L1550
.L1560:
	ldr	ip, .L1566+16
	movw	r1, #3367
	ldr	r3, .L1566+8
	mov	r0, #0
	ldr	r2, .L1566+20
	str	ip, [sp]
	bl	dprint_normal
.L1545:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1561:
	ldr	ip, .L1566+24
	movw	r1, #3368
	ldr	r3, .L1566+8
	ldr	r2, .L1566+20
	str	ip, [sp]
	bl	dprint_normal
	b	.L1545
.L1567:
	.align	2
.L1566:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1292
	.word	.LC174
	.word	.LC25
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_ReleaseUnusedOldDecFs, .-FSP_ReleaseUnusedOldDecFs
	.align	2
	.global	FSP_ReleaseUnusedCurDecFs
	.type	FSP_ReleaseUnusedCurDecFs, %function
FSP_ReleaseUnusedCurDecFs:
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
	cmp	r0, #3
	mov	r8, r0
	bhi	.L1583
	ldr	r4, .L1587
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L1584
	ldr	r10, .L1587+4
	mov	r0, #3
	ldr	r3, [r10, #12]
	blx	r3
	ldr	r6, [r4, #4]
	ldr	lr, [r6, #12]
	cmp	lr, #0
	beq	.L1573
	mov	r9, #0
	add	r5, r6, #18432
	add	r5, r5, #192
	mov	r7, r9
	mov	r4, r9
	b	.L1577
.L1586:
	str	r4, [sp]
	add	r7, r7, r0
	bl	dprint_normal
	ldr	lr, [r6, #12]
.L1575:
	add	r4, r4, #1
	add	r5, r5, #96
	cmp	r4, lr
	bcs	.L1585
.L1577:
	ldrb	r2, [r5]	@ zero_extendqisi2
	mov	ip, r4, asl #7
	sub	ip, ip, r4, asl #5
	ldr	r3, .L1587+8
	add	ip, r6, ip
	cmp	r2, #1
	add	ip, ip, #18432
	ldr	r2, .L1587+12
	add	ip, ip, #192
	movw	r1, #3428
	mov	r0, #1
	bne	.L1586
	ldrh	r3, [ip]
	cmp	r3, #1
	bne	.L1575
	ldr	r1, [r5, #84]
	cmp	r1, #0
	bne	.L1575
	ldr	r2, [r5, #40]
	ldr	r3, [r6, #124]
	cmp	r2, r3
	bne	.L1575
	ldr	r2, [r5, #44]
	ldr	r3, [r6, #136]
	cmp	r2, r3
	bne	.L1575
	mov	r2, r5
	mov	r0, r8
	bl	FSP_ReleaseFs
	add	r9, r9, #1
	ldr	lr, [r6, #12]
	b	.L1575
.L1585:
	orrs	r3, r7, r9
	beq	.L1573
	mov	r0, r6
	bl	FSP_ResortDecFsPool
.L1573:
	ldr	r3, [r10, #16]
	mov	r0, #3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1583:
	ldr	ip, .L1587+16
	movw	r1, #3414
	ldr	r3, .L1587+8
	mov	r0, #0
	ldr	r2, .L1587+20
	str	ip, [sp]
	bl	dprint_normal
.L1568:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1584:
	ldr	ip, .L1587+24
	movw	r1, #3415
	ldr	r3, .L1587+8
	ldr	r2, .L1587+20
	str	ip, [sp]
	bl	dprint_normal
	b	.L1568
.L1588:
	.align	2
.L1587:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1320
	.word	.LC174
	.word	.LC25
	.word	.LC22
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_ReleaseUnusedCurDecFs, .-FSP_ReleaseUnusedCurDecFs
	.align	2
	.global	FSP_GetMemInfo
	.type	FSP_GetMemInfo, %function
FSP_GetMemInfo:
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
	bls	.L1593
.L1590:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L1594
	movw	r1, #4143
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1593:
	ldr	r3, .L1594+4
	add	r3, r3, r0, lsl #2
	ldr	r2, [r3, #4]
	cmp	r1, #0
	cmpne	r2, #0
	moveq	ip, #1
	movne	ip, #0
	beq	.L1590
	ldrb	r3, [r2, #45]	@ zero_extendqisi2
	mov	r0, ip
	strb	r3, [r1]
	ldr	r3, [r2, #48]
	str	r3, [r1, #4]
	ldr	r3, [r2, #52]
	str	r3, [r1, #8]
	ldr	r3, [r2, #64]
	str	r3, [r1, #12]
	ldr	r3, [r2, #68]
	str	r3, [r1, #16]
	ldr	r3, [r2, #124]
	str	r3, [r1, #20]
	ldr	r3, [r2, #92]
	str	r3, [r1, #24]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1595:
	.align	2
.L1594:
	.word	.LC175
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	FSP_GetMemInfo, .-FSP_GetMemInfo
	.global	g_LastDecPhyAddr
	.global	g_FsWaterMarkEnable
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.10177, %object
	.size	__func__.10177, 21
__func__.10177:
	.ascii	"FSP_GetFsRequirement\000"
	.space	3
	.type	__func__.10437, %object
	.size	__func__.10437, 21
__func__.10437:
	.ascii	"FSP_MarkFsOutHanging\000"
	.space	3
	.type	__func__.10443, %object
	.size	__func__.10443, 23
__func__.10443:
	.ascii	"FSP_UnMarkFsOutHanging\000"
	.space	1
	.type	__func__.10263, %object
	.size	__func__.10263, 14
__func__.10263:
	.ascii	"FSP_ReleaseFs\000"
	.space	2
	.type	__func__.10241, %object
	.size	__func__.10241, 14
__func__.10241:
	.ascii	"FSP_RequireFs\000"
	.space	2
	.type	__func__.10316, %object
	.size	__func__.10316, 24
__func__.10316:
	.ascii	"FSP_ReportFsRequirement\000"
	.type	__func__.10397, %object
	.size	__func__.10397, 20
__func__.10397:
	.ascii	"FSP_VarifyWaterMark\000"
	.type	__func__.10063, %object
	.size	__func__.10063, 19
__func__.10063:
	.ascii	"FSP_FindIdleDispFs\000"
	.space	1
	.type	__func__.10082, %object
	.size	__func__.10082, 21
__func__.10082:
	.ascii	"FSP_FindIdleMetadata\000"
	.space	3
	.type	__func__.10056, %object
	.size	__func__.10056, 18
__func__.10056:
	.ascii	"FSP_FindIdleDecFs\000"
	.space	2
	.type	__func__.10682, %object
	.size	__func__.10682, 19
__func__.10682:
	.ascii	"FSP_GetOccupiedNum\000"
	.space	1
	.type	__func__.9936, %object
	.size	__func__.9936, 21
__func__.9936:
	.ascii	"FSP_SetDisplay_Share\000"
	.space	3
	.type	__func__.10474, %object
	.size	__func__.10474, 19
__func__.10474:
	.ascii	"FSP_EnableInstance\000"
	.space	1
	.type	__func__.10479, %object
	.size	__func__.10479, 20
__func__.10479:
	.ascii	"FSP_DisableInstance\000"
	.type	__func__.10484, %object
	.size	__func__.10484, 18
__func__.10484:
	.ascii	"FSP_ResetInstance\000"
	.space	2
	.type	__func__.10492, %object
	.size	__func__.10492, 18
__func__.10492:
	.ascii	"FSP_ArrangeFsPool\000"
	.space	2
	.type	__func__.10368, %object
	.size	__func__.10368, 17
__func__.10368:
	.ascii	"FSP_ArrangeNewFs\000"
	.space	3
	.type	__func__.10376, %object
	.size	__func__.10376, 17
__func__.10376:
	.ascii	"FSP_ArrangeAddFs\000"
	.space	3
	.type	__func__.10384, %object
	.size	__func__.10384, 21
__func__.10384:
	.ascii	"FSP_ArrangeRefreshFs\000"
	.space	3
	.type	__func__.10498, %object
	.size	__func__.10498, 23
__func__.10498:
	.ascii	"FSP_SetFrameBufferMode\000"
	.space	1
	.type	__func__.10504, %object
	.size	__func__.10504, 17
__func__.10504:
	.ascii	"FSP_SetDispFsNum\000"
	.space	3
	.type	__func__.10513, %object
	.size	__func__.10513, 18
__func__.10513:
	.ascii	"FSP_BindRequireFs\000"
	.space	2
	.type	__func__.10339, %object
	.size	__func__.10339, 13
__func__.10339:
	.ascii	"FSP_AddDecFs\000"
	.space	3
	.type	__func__.10347, %object
	.size	__func__.10347, 14
__func__.10347:
	.ascii	"FSP_AddDispFs\000"
	.space	2
	.type	__func__.10354, %object
	.size	__func__.10354, 11
__func__.10354:
	.ascii	"FSP_AddPmv\000"
	.space	1
	.type	__func__.10361, %object
	.size	__func__.10361, 16
__func__.10361:
	.ascii	"FSP_AddMetadata\000"
	.type	__func__.10390, %object
	.size	__func__.10390, 18
__func__.10390:
	.ascii	"FSP_FillWaterMark\000"
	.space	2
	.type	__func__.10530, %object
	.size	__func__.10530, 17
__func__.10530:
	.ascii	"FSP_BindExternFs\000"
	.space	3
	.type	__func__.10553, %object
	.size	__func__.10553, 21
__func__.10553:
	.ascii	"FSP_IsNewFsAvailable\000"
	.space	3
	.type	__func__.10568, %object
	.size	__func__.10568, 15
__func__.10568:
	.ascii	"FSP_NewLogicFs\000"
	.space	1
	.type	__func__.10591, %object
	.size	__func__.10591, 11
__func__.10591:
	.ascii	"FSP_SetRef\000"
	.space	1
	.type	__func__.9911, %object
	.size	__func__.9911, 21
__func__.9911:
	.ascii	"FSP_SetRef_Exclusive\000"
	.space	3
	.type	__func__.9919, %object
	.size	__func__.9919, 17
__func__.9919:
	.ascii	"FSP_SetRef_Share\000"
	.space	3
	.type	__func__.10597, %object
	.size	__func__.10597, 11
__func__.10597:
	.ascii	"FSP_GetRef\000"
	.space	1
	.type	__func__.10605, %object
	.size	__func__.10605, 15
__func__.10605:
	.ascii	"FSP_SetDisplay\000"
	.space	1
	.type	__func__.9928, %object
	.size	__func__.9928, 25
__func__.9928:
	.ascii	"FSP_SetDisplay_Exclusive\000"
	.space	3
	.type	__func__.10611, %object
	.size	__func__.10611, 15
__func__.10611:
	.ascii	"FSP_GetDisplay\000"
	.space	1
	.type	__func__.10625, %object
	.size	__func__.10625, 17
__func__.10625:
	.ascii	"FSP_GetStoreType\000"
	.space	3
	.type	__func__.10659, %object
	.size	__func__.10659, 24
__func__.10659:
	.ascii	"FSP_GetFreeDecFsSlotNum\000"
	.type	__func__.10671, %object
	.size	__func__.10671, 22
__func__.10671:
	.ascii	"FSP_ClearNotInVoQueue\000"
	.space	2
	.type	__func__.10692, %object
	.size	__func__.10692, 18
__func__.10692:
	.ascii	"FSP_IfCanGetDecFs\000"
	.space	2
	.type	__func__.10710, %object
	.size	__func__.10710, 17
__func__.10710:
	.ascii	"FSP_ClearLogicFs\000"
	.space	3
	.type	__func__.10716, %object
	.size	__func__.10716, 15
__func__.10716:
	.ascii	"FSP_GetLogicFs\000"
	.space	1
	.type	__func__.10581, %object
	.size	__func__.10581, 16
__func__.10581:
	.ascii	"FSP_LinkLogicFs\000"
	.type	__func__.10618, %object
	.size	__func__.10618, 17
__func__.10618:
	.ascii	"FSP_SetStoreType\000"
	.space	3
	.type	__func__.10705, %object
	.size	__func__.10705, 15
__func__.10705:
	.ascii	"FSP_ReleasePmv\000"
	.space	1
	.type	__func__.10726, %object
	.size	__func__.10726, 26
__func__.10726:
	.ascii	"FSP_GetLogicFs_By_DecAddr\000"
	.space	2
	.type	__func__.10740, %object
	.size	__func__.10740, 27
__func__.10740:
	.ascii	"FSP_GetLogicFs_By_DispAddr\000"
	.space	1
	.type	__func__.10755, %object
	.size	__func__.10755, 29
__func__.10755:
	.ascii	"FSP_GetPairDispFs_By_DecAddr\000"
	.space	3
	.type	__func__.10768, %object
	.size	__func__.10768, 24
__func__.10768:
	.ascii	"FSP_MarkImageOutHanging\000"
	.type	__func__.10449, %object
	.size	__func__.10449, 27
__func__.10449:
	.ascii	"FSP_MarkMetadataOutHanging\000"
	.space	1
	.type	__func__.10777, %object
	.size	__func__.10777, 26
__func__.10777:
	.ascii	"FSP_UnMarkImageOutHanging\000"
	.space	2
	.type	__func__.10455, %object
	.size	__func__.10455, 29
__func__.10455:
	.ascii	"FSP_UnMarkMetadataOutHanging\000"
	.space	3
	.type	__func__.10783, %object
	.size	__func__.10783, 18
__func__.10783:
	.ascii	"FSP_GetFsImagePtr\000"
	.space	2
	.type	__func__.10790, %object
	.size	__func__.10790, 15
__func__.10790:
	.ascii	"FSP_GetPmvAddr\000"
	.space	1
	.type	__func__.10798, %object
	.size	__func__.10798, 20
__func__.10798:
	.ascii	"FSP_GetDecFsAddrTab\000"
	.type	__func__.10809, %object
	.size	__func__.10809, 18
__func__.10809:
	.ascii	"FSP_GetPmvAddrTab\000"
	.space	2
	.type	__func__.10819, %object
	.size	__func__.10819, 19
__func__.10819:
	.ascii	"FSP_GetNullLogicFs\000"
	.space	1
	.type	__func__.10840, %object
	.size	__func__.10840, 21
__func__.10840:
	.ascii	"FSP_GetWaitDispFsNum\000"
	.space	3
	.type	__func__.10849, %object
	.size	__func__.10849, 22
__func__.10849:
	.ascii	"FSP_CheckIfFsPolluted\000"
	.space	2
	.type	__func__.10541, %object
	.size	__func__.10541, 19
__func__.10541:
	.ascii	"FSP_UnBindExternFs\000"
	.space	1
	.type	__func__.10208, %object
	.size	__func__.10208, 18
__func__.10208:
	.ascii	"FSP_ExchangeDecFs\000"
	.space	2
	.type	__func__.10634, %object
	.size	__func__.10634, 26
__func__.10634:
	.ascii	"FSP_ReleaseUnusedOldDecFs\000"
	.space	2
	.type	__func__.10647, %object
	.size	__func__.10647, 26
__func__.10647:
	.ascii	"FSP_ReleaseUnusedCurDecFs\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s inquire mem need failed.\012\000" )
	.space	3
.LC1:
	ASCII(.ascii	"%s: NeedDispFs %d, NeedPmv %d, NeedMetadata %d, Lin" )
	ASCII(.ascii	"eNumOffset %d\012\000" )
	.space	2
.LC2:
	ASCII(.ascii	"%s: DecFsNum %d, DecFsSize %d, DispFsNum %d, DispFs" )
	ASCII(.ascii	"Size %d, PmvNum %d, PmvSize %d,            Metadata" )
	ASCII(.ascii	"Num %d, MetadataSize %d\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"%s DecInfo: HeadStride %d, HeadSize %d, YStride %d," )
	ASCII(.ascii	" UVStride %d, ChromOffset %d,            Stride_nbi" )
	ASCII(.ascii	"t %d, LumaOffset_nbit %d, ChromOffset_nbit %d\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"%s DispInfo: HeadStride %d, HeadSize %d, Stride %d," )
	ASCII(.ascii	" ChromOffset %d\012\000" )
.LC5:
	ASCII(.ascii	"%s, %d, Addr = 0x%x set in use, FsState = FS_STATE_" )
	ASCII(.ascii	"OUT_HANGING\012\000" )
.LC6:
	ASCII(.ascii	"%s, %d, Addr = 0x%x set no use\012\000" )
.LC7:
	ASCII(.ascii	"VDEC_DecBuffer\000" )
	.space	1
.LC8:
	ASCII(.ascii	"%s\000" )
	.space	1
.LC9:
	ASCII(.ascii	"VDEC_DispBuffer\000" )
.LC10:
	ASCII(.ascii	"VDEC_PmvBuffer\000" )
	.space	1
.LC11:
	ASCII(.ascii	"VDEC_MetadataBuffer\000" )
.LC12:
	ASCII(.ascii	"%s unsupport type %d\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"%s ERROR: Buf %s IsMap PhyAddr 0x%x but VirAddr=0 i" )
	ASCII(.ascii	"nvalid\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"Report to release mem %s phy 0x%x size %d\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"Require mem %s size %d\012\000" )
.LC16:
	ASCII(.ascii	"%s require size:%d, num:%d, w:%d, h:%d s:%d bitdept" )
	ASCII(.ascii	"h:%d\012\000" )
	.space	3
.LC17:
	ASCII(.ascii	"%s require dec(%d/%d), disp(%d/%d), pmv(%d/%d), met" )
	ASCII(.ascii	"adata(%d/%d).\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"Report to cancel alloc cmd UniqueID %llx, Mask %llx" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"%s get mem(phy 0x%x/size %d) vir addr failed.\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"%s mem 0x%x water mark 0x%x != 0x%x, it must be pol" )
	ASCII(.ascii	"luted!!!\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"%s WARNING: DispFs PhyAddr 0x%x LinkRef %d != 0, fo" )
	ASCII(.ascii	"rce 0.\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"%s: %s\012\000" )
.LC23:
	ASCII(.ascii	"MetadataID out of range\000" )
.LC24:
	ASCII(.ascii	"%s WARNING: DecFs PhyAddr 0x%x LinkRef %d != 0, for" )
	ASCII(.ascii	"ce 0.\012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"InstID out of range\000" )
.LC26:
	ASCII(.ascii	"%s IsWaitDisp %d confused: pDispFs %d(Tick %d) != L" )
	ASCII(.ascii	"ogicFs %d(Tick %d)!\012\000" )
.LC27:
	ASCII(.ascii	"fsp is already inited\000" )
	.space	2
.LC28:
	ASCII(.ascii	"Fsp is not inited\000" )
	.space	2
.LC29:
	ASCII(.ascii	"%s resolution invalid\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"%s config: eVidStd %d, BitDepth %d, ExpectDecFsNum " )
	ASCII(.ascii	"%d, ExpectPmvNum %d, DecFsWidth %d, DecFsHeight %d," )
	ASCII(.ascii	" UserDec %d\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"%s config not changed.\012\000" )
.LC32:
	ASCII(.ascii	"%s call FSP_GetFsRequirement failed.\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"%s call FSP_ReportFsRequirement failed.\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"%s: ExpectDecFsNum %d, ExpectPmvNum %d\012\000" )
.LC35:
	ASCII(.ascii	"%s unsupport Mode %d\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"%s fsp config invalid: eVidStd %d, BitDepth %d, Dec" )
	ASCII(.ascii	"FsWidth %d, DecFsHeight %d, UserDec %d\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"Alloc type is invalid\000" )
	.space	2
.LC38:
	ASCII(.ascii	"%s Set Num:%d >= MAX_FRAME_NUM:%d, ignor it.\012\000" )
	.space	2
.LC39:
	ASCII(.ascii	"pMem = NULL\000" )
.LC40:
	ASCII(.ascii	"%s mem %s size %d != need %d, ignor it.\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"%s CfgNum %d >= RequireNum %d/MAX_FRAME_NUM %d, ign" )
	ASCII(.ascii	"or it.\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"%s no free record position, ignor it.\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"%s BackTunnelLineNumVirAddr is invalid\012\000" )
.LC44:
	ASCII(.ascii	"%s CfgNum %d >= RequireNum %d/MAX_PMV_NUM %d, ignor" )
	ASCII(.ascii	" it.\012\000" )
	.space	3
.LC45:
	ASCII(.ascii	"%s unkown buffer %s\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"Bind mem %s phy 0x%x size %d\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"pExternBuffer = NULL\000" )
	.space	3
.LC48:
	ASCII(.ascii	"%s Frame buffer Address(0x%x) is not alligned!\012\000" )
.LC49:
	ASCII(.ascii	"%s CfgNum:%d Phy:0x%x size:0x%x attach phy:0x%x vir" )
	ASCII(.ascii	":0x%x size:0x%x\012\000" )
.LC50:
	ASCII(.ascii	"%s no free logic fs.\012\000" )
	.space	2
.LC51:
	ASCII(.ascii	"No DecFs, can't be fixed.\012\000" )
	.space	1
.LC52:
	ASCII(.ascii	"No DispFs, can't be fixed.\012\000" )
.LC53:
	ASCII(.ascii	"No Pmv, can't be fixed.\012\000" )
	.space	3
.LC54:
	ASCII(.ascii	"No pmv, force use PmvRec[0].\012\000" )
	.space	2
.LC55:
	ASCII(.ascii	"No metadata, can't be fixed.\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"No metadata, force use stMetadataRec[0].\012\000" )
	.space	2
.LC57:
	ASCII(.ascii	"New LogicFs %d(Tick %d), DecFs %d(Tick %d), DispFs " )
	ASCII(.ascii	"%d(Tick %d).\012\000" )
	.space	3
.LC58:
	ASCII(.ascii	"%s try fix fs failed.\012\000" )
	.space	1
.LC59:
	ASCII(.ascii	"LogicFsID out of range\000" )
	.space	1
.LC60:
	ASCII(.ascii	"%s IsRef %d confused: pDecFs %d(Tick %d) != LogicFs" )
	ASCII(.ascii	" %d(Tick %d)!\012\000" )
	.space	2
.LC61:
	ASCII(.ascii	"%s IsWaitDisp %d confused: pDecFs %d(Tick %d) != Lo" )
	ASCII(.ascii	"gicFs %d(Tick %d)!\012\000" )
	.space	1
.LC62:
	ASCII(.ascii	"pstVoQue is NULL\000" )
	.space	3
.LC63:
	ASCII(.ascii	"fsp is not inited\000" )
	.space	2
.LC64:
	ASCII(.ascii	"LinkFsID out of range\000" )
	.space	2
.LC65:
	ASCII(.ascii	"%s get pLinkFs by LinkFsID %d failed!\012\000" )
	.space	1
.LC66:
	ASCII(.ascii	"%s ERROR: LinkFsID %d with pstDecodeFs(%p)/pstDispO" )
	ASCII(.ascii	"utFs(%p) = NULL.\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"%s no free disp fs.\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"%s no free metadata.\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"Link LogicFs %d(Tick %d), LinkFs %d(Tick %d), DecFs" )
	ASCII(.ascii	" %d(Tick %d), DispFs %d(Tick %d).\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"%s find LogicFs %d failed!\012\000" )
.LC71:
	ASCII(.ascii	"%s LogicFs %d pstDecodeFs = NULL!\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"%s pstLogicFs = NULL!\012\000" )
	.space	1
.LC73:
	ASCII(.ascii	"%s notice: another logic fs match, replace with lat" )
	ASCII(.ascii	"est one.\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"Found logic fs, but its disp fs is null, take the c" )
	ASCII(.ascii	"loset one instead.\012\000" )
	.space	1
.LC75:
	ASCII(.ascii	"Found logic fs(core %d), but its disp fs not match." )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC76:
	ASCII(.ascii	"%s, %d, Addr = 0x%x set in use IsOutHanging = 1\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC77:
	ASCII(.ascii	"pDecFsAddrTab is NULL\012\000" )
	.space	1
.LC78:
	ASCII(.ascii	"pDecFsNum is NULL\012\000" )
	.space	1
.LC79:
	ASCII(.ascii	"pPmvAddrTab is NULL\012\000" )
	.space	3
.LC80:
	ASCII(.ascii	"pPmvNum is NULL\012\000" )
	.space	3
.LC81:
	ASCII(.ascii	"%s: can not find logic fs by dec phy addr 0x%llx.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC82:
	ASCII(.ascii	"%s, %d: parameter error.\012\000" )
	.space	2
.LC83:
	ASCII(.ascii	"Yes\000" )
.LC84:
	ASCII(.ascii	"No\000" )
	.space	1
.LC85:
	ASCII(.ascii	"\000" )
	.space	3
.LC86:
	ASCII(.ascii	"(Free)\000" )
	.space	1
.LC87:
	ASCII(.ascii	"pFsp %d invalid\012\000" )
	.space	3
.LC88:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC89:
	ASCII(.ascii	"----------------------------- FSP %2d -------------" )
	ASCII(.ascii	"-------------\012\000" )
	.space	2
.LC90:
	ASCII(.ascii	"InstState\000" )
	.space	2
.LC91:
	ASCII(.ascii	"%-40s :%d\012\000" )
	.space	1
.LC92:
	ASCII(.ascii	"PartitionState\000" )
	.space	1
.LC93:
	ASCII(.ascii	"ExtraFrameNum\000" )
	.space	2
.LC94:
	ASCII(.ascii	"OccupiedFrameNum\000" )
	.space	3
.LC95:
	ASCII(.ascii	"----------------------------- CFG -----------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC96:
	ASCII(.ascii	"VidStd\000" )
	.space	1
.LC97:
	ASCII(.ascii	"BitDepth\000" )
	.space	3
.LC98:
	ASCII(.ascii	"UserDec\000" )
.LC99:
	ASCII(.ascii	"DecFsWidth\000" )
	.space	1
.LC100:
	ASCII(.ascii	"DecFsHeight\000" )
.LC101:
	ASCII(.ascii	"DispFsWidth\000" )
.LC102:
	ASCII(.ascii	"DispFsHeight\000" )
	.space	3
.LC103:
	ASCII(.ascii	"ExpectDecFsNum\000" )
	.space	1
.LC104:
	ASCII(.ascii	"ExpectPmvNum\000" )
	.space	3
.LC105:
	ASCII(.ascii	"--------------------------- MEM NEED --------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC106:
	ASCII(.ascii	"DecFsNum\000" )
	.space	3
.LC107:
	ASCII(.ascii	"DecFsSize\000" )
	.space	2
.LC108:
	ASCII(.ascii	"DecLinearEn\000" )
.LC109:
	ASCII(.ascii	"DecCompressEn\000" )
	.space	2
.LC110:
	ASCII(.ascii	"DecBitDepth\000" )
.LC111:
	ASCII(.ascii	"DecHeadStride\000" )
	.space	2
.LC112:
	ASCII(.ascii	"DecHeadSize\000" )
.LC113:
	ASCII(.ascii	"DecYStride\000" )
	.space	1
.LC114:
	ASCII(.ascii	"DecUVStride\000" )
.LC115:
	ASCII(.ascii	"DecChromOffset\000" )
	.space	1
.LC116:
	ASCII(.ascii	"DecStride_nbit\000" )
	.space	1
.LC117:
	ASCII(.ascii	"LumaOffset_nbit\000" )
.LC118:
	ASCII(.ascii	"ChromOffset_nbit\000" )
	.space	3
.LC119:
	ASCII(.ascii	"LineNumOffset\000" )
	.space	2
.LC120:
	ASCII(.ascii	"NeedDispFs\000" )
	.space	1
.LC121:
	ASCII(.ascii	"%-40s :%s\012\000" )
	.space	1
.LC122:
	ASCII(.ascii	"DispFsNum\000" )
	.space	2
.LC123:
	ASCII(.ascii	"DispFsSize\000" )
	.space	1
.LC124:
	ASCII(.ascii	"DispLinearEn\000" )
	.space	3
.LC125:
	ASCII(.ascii	"DispCompressEn\000" )
	.space	1
.LC126:
	ASCII(.ascii	"DispBitDepth\000" )
	.space	3
.LC127:
	ASCII(.ascii	"DispHeadStride\000" )
	.space	1
.LC128:
	ASCII(.ascii	"DispHeadSize\000" )
	.space	3
.LC129:
	ASCII(.ascii	"DispYStride\000" )
.LC130:
	ASCII(.ascii	"DispUVStride\000" )
	.space	3
.LC131:
	ASCII(.ascii	"DispChromOffset\000" )
.LC132:
	ASCII(.ascii	"NeedPmv\000" )
.LC133:
	ASCII(.ascii	"PmvNum\000" )
	.space	1
.LC134:
	ASCII(.ascii	"PmvSize\000" )
.LC135:
	ASCII(.ascii	"NeedMetadata\000" )
	.space	3
.LC136:
	ASCII(.ascii	"MetadataNum\000" )
.LC137:
	ASCII(.ascii	"MetadataSize\000" )
	.space	3
.LC138:
	ASCII(.ascii	"--------------------------- LOGIC FS --------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC139:
	ASCII(.ascii	"Num\000" )
.LC140:
	ASCII(.ascii	"%-10s %-10s %-10s %-10s %-10s %-10s %-10s\012\000" )
	.space	1
.LC141:
	ASCII(.ascii	"DispPhy\000" )
.LC142:
	ASCII(.ascii	"DecPhy\000" )
	.space	1
.LC143:
	ASCII(.ascii	"FsState\000" )
.LC144:
	ASCII(.ascii	"FsType\000" )
	.space	1
.LC145:
	ASCII(.ascii	"IsRef\000" )
	.space	2
.LC146:
	ASCII(.ascii	"Tick\000" )
	.space	3
.LC147:
	ASCII(.ascii	"%-10d %-10d %-10d %-10d %-10d 0x%-10x 0x%-10x\012\000" )
	.space	1
.LC148:
	ASCII(.ascii	"LogicFs(Free/Total)\000" )
.LC149:
	ASCII(.ascii	"%-40s :%d/%d\012\000" )
	.space	2
.LC150:
	ASCII(.ascii	"---------------------------- DEC FS ---------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC151:
	ASCII(.ascii	"%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC152:
	ASCII(.ascii	"Address\000" )
.LC153:
	ASCII(.ascii	"Size\000" )
	.space	3
.LC154:
	ASCII(.ascii	"LinkRef\000" )
.LC155:
	ASCII(.ascii	"IsValid\000" )
.LC156:
	ASCII(.ascii	"%-10d %-10d %-10d %-10d %-10d %-10d %-10d 0x%-10x %" )
	ASCII(.ascii	"s\012\000" )
	.space	2
.LC157:
	ASCII(.ascii	"DecFs(Free/Total)\000" )
	.space	2
.LC158:
	ASCII(.ascii	"---------------------------- DISP FS --------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC159:
	ASCII(.ascii	"DispFs(Free/Total)\000" )
	.space	1
.LC160:
	ASCII(.ascii	"------------------------------ PMV ----------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC161:
	ASCII(.ascii	"%-10s %-10s %-10s %-10s %-10s %-10s\012\000" )
	.space	3
.LC162:
	ASCII(.ascii	"HalfOffset\000" )
	.space	1
.LC163:
	ASCII(.ascii	"IsInUse\000" )
.LC164:
	ASCII(.ascii	"%-10d %-10d %-10d %-10d %-10d 0x%-10x %s\012\000" )
	.space	2
.LC165:
	ASCII(.ascii	"Pmv(Free/Total)\000" )
.LC166:
	ASCII(.ascii	"--------------------------- METADATA --------------" )
	ASCII(.ascii	"------------\012\000" )
	.space	3
.LC167:
	ASCII(.ascii	"IsOut\000" )
	.space	2
.LC168:
	ASCII(.ascii	"Metadata(Free/Total)\000" )
	.space	3
.LC169:
	ASCII(.ascii	"%s:Warning, Fs is unavailable, Valid:%d Ref:%d Stat" )
	ASCII(.ascii	"us:%d Size:%d\012\000" )
	.space	2
.LC170:
	ASCII(.ascii	"%s ERROR: LackNum %d < 0.\012\000" )
	.space	1
.LC171:
	ASCII(.ascii	"EmptyPos or ValidPos = -1\000" )
	.space	2
.LC172:
	ASCII(.ascii	"EmptyFs is not empty\000" )
	.space	3
.LC173:
	ASCII(.ascii	"ValidFs is not valid\000" )
	.space	3
.LC174:
	ASCII(.ascii	"%s WARNING: DecFsRec[%d] is invalid!\012\000" )
	.space	2
.LC175:
	ASCII(.ascii	"pFsp %d or input Ptr pstMemNeed %p invalid!!\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	g_FsWaterMarkEnable, %object
	.size	g_FsWaterMarkEnable, 4
g_FsWaterMarkEnable:
	.space	4
	.type	s_pFspInst, %object
	.size	s_pFspInst, 16
s_pFspInst:
	.space	16
	.type	g_LastDecPhyAddr, %object
	.size	g_LastDecPhyAddr, 4
g_LastDecPhyAddr:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
