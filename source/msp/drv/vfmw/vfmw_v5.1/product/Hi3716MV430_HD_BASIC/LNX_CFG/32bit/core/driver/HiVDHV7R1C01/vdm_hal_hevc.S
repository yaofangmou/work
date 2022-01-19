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
	.file	"vdm_hal_hevc.c"
	.text
	.align	2
	.global	HEVCHAL_FillMixRam
	.type	HEVCHAL_FillMixRam, %function
HEVCHAL_FillMixRam:
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
	add	r3, r1, #1020
	mov	r2, r0
	add	r3, r3, #3
	rsb	r0, r1, #145408
	bic	r3, r3, #1020
	bic	r3, r3, #3
	str	r3, [r2, #928]
	add	ip, r3, #2048
	add	r1, r3, #88064
	add	r0, r0, r3
	str	ip, [r2, #924]
	add	r3, r3, #100352
	str	r1, [r2, #920]
	str	r3, [r2, #916]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_FillMixRam, .-HEVCHAL_FillMixRam
	.align	2
	.global	HEVCHAL_WriteCabacTab
	.type	HEVCHAL_WriteCabacTab, %function
HEVCHAL_WriteCabacTab:
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
	ldr	r8, .L25
	ldr	r6, .L25+4
	mov	r9, #0
	mov	r5, #16
	mov	r2, r9
	mov	r10, r9
	mov	r7, r9
	mov	lr, r5
	str	r0, [fp, #-48]
.L3:
	mov	r3, r10, asl #7
	cmp	r2, #464
	add	r3, r3, r10, lsl #5
	add	r3, r3, lr
	add	r3, r8, r3, lsl #2
	ldr	r5, [r3, #24]
	bge	.L5
	add	r0, lr, r9
	ldr	r3, .L25+8
	mov	ip, r2, asl #1
	rsb	lr, r2, lr
	add	r1, r6, ip
	add	r0, r3, r0, lsl #2
	b	.L13
.L9:
	cmp	r2, #464
	ldr	r5, [r0, #4]!
	beq	.L5
.L13:
	mov	r3, r5, asr #4
	and	r4, r5, #15
	cmn	r5, #1
	add	r2, r2, #1
	add	r3, r3, r3, lsl #2
	mov	r4, r4, asl #3
	subne	r3, r3, #45
	strneb	r3, [r6, ip]
	add	r3, lr, r2
	streqb	r7, [r6, ip]
	subne	r4, r4, #16
	streqb	r7, [r1, #1]
	strneb	r4, [r1, #1]
	cmp	r3, #159
	add	r1, r1, #2
	mov	ip, r2, asl #1
	ble	.L9
	add	r10, r10, #1
	cmp	r10, #3
	beq	.L23
	cmp	r10, #0
	add	r9, r9, #160
	moveq	lr, #16
	movne	lr, #0
	b	.L3
.L5:
	mov	r3, #157
	str	r8, [sp]
	mov	r1, r3
	ldr	r2, .L25+12
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
.L20:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L23:
	ldr	r0, [fp, #-48]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	addne	r3, r3, #2
	ldrne	r2, .L25+16
	addne	r0, r2, #928
	beq	.L24
.L12:
	ldrb	r1, [r2, #-1]	@ zero_extendqisi2
	add	r3, r3, #2
	strb	r1, [r3, #-3]
	ldrb	r1, [r2], #2	@ zero_extendqisi2
	cmp	r2, r0
	strb	r1, [r3, #-4]
	bne	.L12
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L24:
	ldr	ip, .L25+20
	mov	r1, #166
	ldr	r3, .L25
	ldr	r2, .L25+24
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L20
.L26:
	.align	2
.L25:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LANCHOR1+24
	.word	.LC1
	.word	.LANCHOR0+1
	.word	.LC3
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_WriteCabacTab, .-HEVCHAL_WriteCabacTab
	.align	2
	.global	HEVCHAL_InitHal
	.type	HEVCHAL_InitHal, %function
HEVCHAL_InitHal:
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
	ldr	r0, [r0, #860]
	bl	HEVCHAL_WriteCabacTab
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r2, .L32
	mov	r1, #182
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	.LC4
	UNWIND(.fnend)
	.size	HEVCHAL_InitHal, .-HEVCHAL_InitHal
	.align	2
	.global	HEVCHAL_GetVirAddr
	.type	HEVCHAL_GetVirAddr, %function
HEVCHAL_GetVirAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_GetVirAddr, .-HEVCHAL_GetVirAddr
	.align	2
	.global	HEVCHAL_GetPhyAddr
	.type	HEVCHAL_GetPhyAddr, %function
HEVCHAL_GetPhyAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_GetPhyAddr, .-HEVCHAL_GetPhyAddr
	.align	2
	.global	HEVCHAL_CutSliceChain
	.type	HEVCHAL_CutSliceChain, %function
HEVCHAL_CutSliceChain:
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
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	movne	r0, #0
	strne	r0, [r3, #252]
	beq	.L39
.L38:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L39:
	ldr	ip, .L40
	mov	r1, #207
	ldr	r3, .L40+4
	ldr	r2, .L40+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L38
.L41:
	.align	2
.L40:
	.word	.LC5
	.word	.LANCHOR1+1944
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_CutSliceChain, .-HEVCHAL_CutSliceChain
	.align	2
	.global	HEVCHAL_WriteQmatrix
	.type	HEVCHAL_WriteQmatrix, %function
HEVCHAL_WriteQmatrix:
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
	ldmeqfd	sp, {fp, sp, pc}
	sub	r0, r0, #4
	sub	r2, r2, #4
	mov	r3, #0
.L44:
	add	r3, r3, #1
	ldr	ip, [r0, #4]!
	cmp	r3, r1
	str	ip, [r2, #4]!
	bne	.L44
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_WriteQmatrix, .-HEVCHAL_WriteQmatrix
	.align	2
	.global	HEVCHAL_WriteTileInfo
	.type	HEVCHAL_WriteTileInfo, %function
HEVCHAL_WriteTileInfo:
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
	mov	r6, r0
	ldr	r0, [r1, #928]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-48]
	beq	.L48
	add	r8, r3, #1024
	add	r9, r3, #4
	add	r8, r8, #4
	mov	r7, r6
	mov	r10, r6
	mov	r5, #0
.L49:
	mov	ip, r10
	mov	lr, r9
	mov	r0, #0
.L53:
	cmp	r0, #252
	add	r0, r0, #4
	strgt	r5, [lr, #-4]
	add	ip, ip, #4
	ldrleb	r3, [ip, #1610]	@ zero_extendqisi2
	add	lr, lr, #4
	ldrleb	r4, [ip, #1611]	@ zero_extendqisi2
	ldrleb	r2, [ip, #1608]	@ zero_extendqisi2
	movle	r3, r3, asl #16
	ldrleb	r1, [ip, #1609]	@ zero_extendqisi2
	orrle	r3, r3, r4, asl #24
	orrle	r3, r3, r2
	orrle	r3, r3, r1, asl #8
	strle	r3, [lr, #-8]
	cmp	r0, #512
	bne	.L53
	add	r9, r9, #512
	add	r10, r10, #256
	cmp	r9, r8
	bne	.L49
	mov	r3, #0
	mov	r0, r3
.L54:
	cmp	r3, #9
	add	r3, r3, #1
	strgt	r0, [r8, #-4]
	add	r6, r6, #8
	ldrle	r1, [r6, #2120]
	add	r8, r8, #4
	ldrle	r2, [r6, #2116]
	orrle	r2, r2, r1, asl #16
	strle	r2, [r8, #-8]
	cmp	r3, #20
	bne	.L54
	ldr	r3, [fp, #-48]
	add	r2, r3, #1104
	mov	r3, #0
	add	r2, r2, #4
	mov	ip, r3
.L60:
	cmp	r3, #10
	add	r3, r3, #1
	strgt	ip, [r2, #-4]
	add	r7, r7, #8
	ldrle	r0, [r7, #2200]
	add	r2, r2, #4
	ldrle	r1, [r7, #2196]
	orrle	r1, r1, r0, asl #16
	strle	r1, [r2, #-8]
	cmp	r3, #22
	bne	.L60
	mov	r0, #0
.L65:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L48:
	ldr	ip, .L68
	mov	r1, #238
	ldr	r3, .L68+4
	ldr	r2, .L68+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L65
.L69:
	.align	2
.L68:
	.word	.LC6
	.word	.LANCHOR1+1968
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_WriteTileInfo, .-HEVCHAL_WriteTileInfo
	.align	2
	.global	HEVCHAL_SetPicMsg
	.type	HEVCHAL_SetPicMsg, %function
HEVCHAL_SetPicMsg:
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
	mov	r4, r0
	mov	r0, r2
	str	r1, [fp, #-48]
	str	r3, [fp, #-52]
	bl	MEM_Phy2Vir
	subs	r7, r0, #0
	beq	.L135
	ldr	r3, .L137
	mov	r2, #256
	mov	r1, #0
	ldr	r5, .L137+4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, .L137+8
	mov	r1, #316
	mov	r0, #5
	bl	dprint_normal
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #8]
	ldr	r3, [r4, #20]
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	mov	r0, r0, asl #9
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	orr	r1, r0, r1, asl #19
	orr	r1, r1, r3
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	orr	r1, r1, ip, asl #25
	orr	r2, r1, r2, asl #24
	ldr	r1, [r5, #848]
	ldrb	ip, [r4, #5]	@ zero_extendqisi2
	orr	r2, r2, r0, asl #23
	ldr	r0, [r5, #852]
	rsb	r1, r1, r7
	orr	r3, r2, r3, asl #22
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	cmp	r1, r0
	orr	r3, r3, ip, asl #21
	mov	r1, #332
	mov	r0, #5
	orr	r3, r3, r2, asl #18
	movcs	r2, #1
	strcc	r3, [r7]
	strcs	r2, [r5, #844]
	ldr	r2, .L137+12
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r7, #1
	rsb	r2, r0, r2
	ldr	r3, [r4, #24]
	cmp	r2, r1
	ldr	r2, .L137+4
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r7, #4]
	strcs	r1, [r2, #844]
	movw	r1, #337
	ldr	r2, .L137+16
	bl	dprint_normal
	ldr	ip, [r4, #40]
	ldr	r2, [r4, #32]
	add	r0, r7, #2
	ldr	r1, [r4, #72]
	ldr	lr, [r4, #44]
	mov	ip, ip, asl #24
	ldr	r3, [r4, #48]
	orr	r2, ip, r2, asl #29
	orr	r2, r2, r1
	ldr	ip, [r4, #52]
	ldr	r1, [r4, #56]
	orr	r2, r2, lr, asl #21
	orr	r3, r2, r3, asl #18
	ldr	lr, [r4, #60]
	ldr	r2, [r4, #64]
	orr	r3, r3, ip, asl #15
	orr	r1, r3, r1, asl #12
	ldr	ip, [r4, #68]
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	orr	r1, r1, lr, asl #9
	ldr	lr, [r5, #848]
	orr	r2, r1, r2, asl #6
	orr	r2, r2, ip, asl #3
	rsb	r1, lr, r0
	ldr	lr, [r5, #852]
	ldrb	r0, [r4, #37]	@ zero_extendqisi2
	orr	r3, r2, r3, asl #28
	ldr	r2, .L137+4
	cmp	r1, lr
	orr	r3, r3, r0, asl #27
	movcs	r1, #1
	strcc	r3, [r7, #8]
	mov	r0, #5
	strcs	r1, [r2, #844]
	movw	r1, #354
	ldr	r2, .L137+20
	bl	dprint_normal
	ldr	ip, [r4, #80]
	ldr	r2, [r4, #76]
	add	r0, r7, #3
	ldr	lr, [r4, #84]
	ldr	r1, [r4, #96]
	mov	ip, ip, asl #16
	ldr	r3, [r4, #88]
	orr	r2, ip, r2, asl #22
	ldr	ip, [r5, #848]
	orr	r2, r2, r1
	orr	r2, r2, lr, asl #12
	rsb	r1, ip, r0
	ldr	ip, [r5, #852]
	ldr	r0, [r4, #92]
	orr	r3, r2, r3, asl #8
	ldr	r2, .L137+4
	cmp	r1, ip
	orr	r3, r3, r0, asl #4
	movcs	r1, #1
	strcc	r3, [r7, #12]
	mov	r0, #5
	strcs	r1, [r2, #844]
	movw	r1, #365
	ldr	r2, .L137+24
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #4
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #932]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #16]
	strcs	r1, [r2, #844]
	movw	r1, #371
	ldr	r2, .L137+28
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #5
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #936]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #20]
	strcs	r1, [r2, #844]
	mov	r1, #376
	ldr	r2, .L137+32
	bl	dprint_normal
	ldr	r2, [r4, #1288]
	ldr	r0, [r5, #848]
	add	r3, r7, #6
	ldr	r1, [r5, #852]
	add	r2, r4, r2, lsl #2
	rsb	r3, r0, r3
	cmp	r3, r1
	ldr	r1, .L137+4
	ldr	r3, [r2, #1468]
	mov	r0, #5
	movcs	r2, #1
	strcs	r2, [r1, #844]
	mov	r1, #380
	strcc	r3, [r7, #24]
	ldr	r2, .L137+36
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #7
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #940]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #28]
	strcs	r1, [r2, #844]
	mov	r1, #384
	ldr	r2, .L137+40
	bl	dprint_normal
	ldr	r6, [r4, #2356]
	cmp	r6, #0
	beq	.L89
	ldr	r10, .L137+4
	add	r9, r4, #2288
	mov	r8, #8
.L92:
	ldr	r3, [r9, #4]!
	add	r2, r7, r8
	ldr	ip, [r5, #848]
	mov	r0, #1
	add	r3, r3, #332
	ldr	r1, [r5, #852]
	add	r3, r3, #2
	rsb	r2, ip, r2
	cmp	r2, r1
	ldr	r2, .L137+44
	ldr	r1, [r4, r3, asl #2]
	mov	r3, r8
	strcs	r0, [r10, #844]
	mov	r0, #5
	strcc	r1, [r7, r8, asl #2]
	str	r1, [sp]
	movw	r1, #390
	bl	dprint_normal
	ldr	r6, [r4, #2356]
	sub	r3, r8, #7
	add	r8, r8, #1
	cmp	r3, r6
	bcc	.L92
	cmp	r6, #15
	bhi	.L98
.L89:
	add	r3, r6, #8
	ldr	r9, .L137+4
	add	r8, r7, r3, lsl #2
.L97:
	ldr	r2, [r4, #2292]
	add	r1, r7, r3
	ldr	lr, [r5, #848]
	mov	r0, #1
	add	r2, r2, #332
	ldr	ip, [r5, #852]
	add	r2, r2, #2
	rsb	r1, lr, r1
	cmp	r1, ip
	add	r6, r6, #1
	ldr	r2, [r4, r2, asl #2]
	movw	r1, #397
	strcs	r0, [r9, #844]
	mov	r0, #5
	add	r8, r8, #4
	strcc	r2, [r8, #-4]
	str	r2, [sp]
	ldr	r2, .L137+44
	bl	dprint_normal
	cmp	r6, #15
	add	r3, r6, #8
	bls	.L97
.L98:
	ldr	r0, [r5, #848]
	add	r2, r7, #25
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	ldr	r3, [fp, #-48]
	cmp	r2, r1
	ldr	r2, .L137+4
	movcs	r1, #1
	ldr	r3, [r3, #860]
	strcs	r1, [r2, #844]
	strcc	r3, [r7, #100]
.L99:
	ldr	r2, .L137+48
	movw	r1, #403
	mov	r0, #5
	ldr	r10, .L137+4
	bl	dprint_normal
	add	r9, r4, #120
	add	r8, r7, #104
	mov	r6, #26
.L102:
	ldr	r2, [r5, #848]
	add	r3, r7, r6
	ldr	r1, [r5, #852]
	mov	r0, #1
	rsb	r3, r2, r3
	ldr	r2, [r9, #4]!
	cmp	r3, r1
	mov	r3, r6
	strcs	r0, [r10, #844]
	add	r6, r6, #1
	strcc	r2, [r8]
	movw	r1, #410
	str	r2, [sp]
	mov	r0, #5
	ldr	r2, .L137+44
	add	r8, r8, #4
	bl	dprint_normal
	cmp	r6, #42
	bne	.L102
	ldr	r0, [r5, #848]
	add	r2, r7, #43
	ldr	r3, [fp, #-48]
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #920]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #172]
	strcs	r1, [r2, #844]
	mov	r1, #416
	ldr	r2, .L137+52
	bl	dprint_normal
	ldr	r2, [r5, #848]
	ldr	r1, [r5, #852]
	add	r3, r7, #54
	rsb	r3, r2, r3
	ldr	r2, [r4, #188]
	cmp	r3, r1
	ldr	r1, .L137+4
	ldr	r3, [r4, #192]
	mov	r0, #5
	orr	r3, r3, r2, asl #16
	movcs	r2, #1
	strcc	r3, [r7, #216]
	strcs	r2, [r1, #844]
	movw	r1, #423
	ldr	r2, .L137+56
	bl	dprint_normal
	ldr	r1, [fp, #-48]
	mov	r0, r4
	bl	HEVCHAL_WriteTileInfo
	subs	r6, r0, #0
	bne	.L136
	ldr	r0, [r5, #848]
	add	r2, r7, #55
	ldr	r3, [fp, #-48]
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #928]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #220]
	strcs	r1, [r2, #844]
	movw	r1, #434
	ldr	r2, .L137+60
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #56
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #924]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #224]
	strcs	r1, [r2, #844]
	movw	r1, #439
	ldr	r2, .L137+64
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #57
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #916]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #228]
	strcs	r1, [r2, #844]
	mov	r1, #444
	ldr	r2, .L137+68
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #58
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #944]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #232]
	strcs	r1, [r2, #844]
	movw	r1, #449
	ldr	r2, .L137+72
	bl	dprint_normal
	ldr	r0, [r5, #848]
	ldr	r3, [fp, #-48]
	add	r2, r7, #59
	ldr	r1, [r5, #852]
	rsb	r2, r0, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r3, [r3, #948]
	ldr	r2, .L137+4
	movcs	r1, #1
	strcc	r3, [r7, #236]
	strcs	r1, [r2, #844]
	movw	r1, #454
	ldr	r2, .L137+76
	bl	dprint_normal
	ldr	r0, [r4, #224]
	ldr	ip, [r4, #228]
	add	r1, r7, #60
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	mov	r0, r0, asl #16
	ldr	r2, [r4, #240]
	orr	r0, r0, ip, asl #13
	ldrb	ip, [r4, #217]	@ zero_extendqisi2
	ldrb	lr, [r4, #232]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	and	r2, r2, #31
	ldr	r8, [r4, #236]
	orr	r3, r3, ip, asl #23
	ldrb	ip, [r4, #218]	@ zero_extendqisi2
	orr	r2, r0, r2
	ldrb	r0, [r4, #233]	@ zero_extendqisi2
	orr	r2, r2, lr, asl #12
	ldrb	lr, [r4, #219]	@ zero_extendqisi2
	orr	r3, r3, ip, asl #22
	ldrb	ip, [r4, #234]	@ zero_extendqisi2
	orr	r0, r2, r0, asl #11
	orr	r2, r3, lr, asl #21
	and	r3, r8, #31
	ldrb	lr, [r4, #220]	@ zero_extendqisi2
	orr	r0, r0, ip, asl #10
	orr	r3, r0, r3, asl #5
	ldrb	r0, [r4, #221]	@ zero_extendqisi2
	ldr	ip, [r5, #848]
	orr	r2, r2, lr, asl #20
	rsb	r1, ip, r1
	orr	r2, r2, r0, asl #19
	ldr	ip, [r5, #852]
	orr	r3, r3, r2
	ldr	r2, .L137+4
	mov	r0, #5
	cmp	r1, ip
	strcc	r3, [r7, #240]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	ldr	r2, .L137+80
	mov	r1, #476
	bl	dprint_normal
	ldr	r2, [r5, #848]
	ldr	r1, [r5, #852]
	add	r3, r7, #61
	rsb	r3, r2, r3
	ldr	r2, [r4, #244]
	cmp	r3, r1
	ldr	r1, .L137+4
	ldr	r3, [r4, #248]
	mov	r0, #5
	orr	r3, r3, r2, asl #16
	movcs	r2, #1
	strcc	r3, [r7, #244]
	strcs	r2, [r1, #844]
	movw	r1, #485
	ldr	r2, .L137+84
	bl	dprint_normal
	ldr	r1, [r5, #848]
	ldr	r2, [r5, #852]
	add	r3, r7, #63
	rsb	r3, r1, r3
	ldr	r1, .L137+4
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L137+88
	ldrcc	r3, [fp, #-52]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	movw	r1, #490
	strcc	r3, [r7, #252]
	ldr	r3, [fp, #-52]
	bl	dprint_normal
	mov	r1, r7
	mov	r0, #64
	bl	HEVC_GetVirAddr
	add	r2, r4, #1264
	add	r2, r2, #12
	add	r4, r4, #252
	sub	r0, r0, #4
.L124:
	ldr	r3, [r4, #4]!
	cmp	r4, r2
	str	r3, [r0, #4]!
	bne	.L124
.L72:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L136:
	ldr	r2, .L137+92
	mov	r1, #428
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_normal
	b	.L72
.L135:
	ldr	ip, .L137+96
	movw	r1, #309
	ldr	r3, .L137+100
	mvn	r6, #0
	ldr	r2, .L137+104
	str	ip, [sp]
	bl	dprint_normal
	b	.L72
.L138:
	.align	2
.L137:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC21
	.word	.LC7
	.word	.LANCHOR1+1992
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_SetPicMsg, .-HEVCHAL_SetPicMsg
	.align	2
	.global	HEVCHAL_SetSliceMsgStreamAddrInfo
	.type	HEVCHAL_SetSliceMsgStreamAddrInfo, %function
HEVCHAL_SetSliceMsgStreamAddrInfo:
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
	ldr	r4, .L160
	mov	r6, r2
	mov	r8, r3
	mov	r7, r1
	mov	r5, r6
	mov	r9, #0
	add	r10, r2, #2
	str	r1, [fp, #-60]
	add	r2, r2, #1
	str	r0, [fp, #-56]
	str	r2, [fp, #-52]
	str	r6, [fp, #-48]
.L157:
	cmp	r9, #0
	beq	.L159
	ldr	r2, [r7]
	cmp	r2, #0
	beq	.L143
.L141:
	ldr	r1, [fp, #-48]
	ldr	r2, [r4, #848]
	ldr	r0, [r4, #852]
	rsb	r3, r6, r1
	rsb	r2, r2, r1
	ldr	r1, [fp, #-56]
	cmp	r2, r0
	ldr	r2, [r7, #16]
	mov	r0, #5
	ldr	r1, [r1, #1324]
	biccc	r2, r2, #15
	ldrcs	r1, .L160
	movcs	r2, #1
	biccc	r1, r1, #15
	rsbcc	r2, r1, r2
	strcc	r2, [r5]
	strcs	r2, [r1, #844]
	movw	r1, #522
	ldr	ip, [r5]
	ldr	r2, .L160+4
	str	r8, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	ldr	r1, [fp, #-52]
	ldr	r2, [r4, #848]
	ldr	r0, [r4, #852]
	rsb	r3, r6, r1
	rsb	r2, r2, r1
	ldr	r1, [r7, #8]
	cmp	r2, r0
	ldr	r0, [r7, #16]
	addcc	r2, r5, #4
	movcs	r2, #1
	strcs	r2, [r4, #844]
	addcs	r2, r5, #4
	addcc	r1, r1, r0, lsl #3
	andcc	r1, r1, #127
	strcc	r1, [r5, #4]
	ldr	r0, [r2]
	add	r1, r8, #4
	ldr	r2, .L160+4
	str	r1, [sp]
	movw	r1, #526
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	rsb	r3, r6, r10
	rsb	r2, r2, r10
	ldr	r0, [r7]
	cmp	r2, r1
	add	r1, r8, #8
	addcc	r2, r5, #8
	movcs	r2, #1
	strcs	r2, [r4, #844]
	addcs	r2, r5, #8
	strcc	r0, [r5, #8]
	ldr	r0, [r2]
	str	r1, [sp]
	movw	r1, #530
	ldr	r2, .L160+4
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
.L150:
	ldr	r3, [fp, #-48]
	add	r9, r9, #1
	cmp	r9, #2
	add	r5, r5, #12
	add	r3, r3, #3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	add	r8, r8, #12
	add	r10, r10, #3
	add	r7, r7, #4
	add	r3, r3, #3
	str	r3, [fp, #-52]
	bne	.L157
	mov	r0, #0
.L142:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L143:
	ldr	ip, [fp, #-48]
	ldr	r1, [r4, #848]
	ldr	r0, [r4, #852]
	rsb	r3, r6, ip
	rsb	r1, r1, ip
	cmp	r1, r0
	strcc	r2, [r5]
	mov	r0, #5
	ldrcs	r1, .L160
	movcs	r2, #1
	strcs	r2, [r1, #844]
	mov	r1, #536
	ldr	ip, [r5]
	ldr	r2, .L160+4
	str	r8, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	ldr	r0, [fp, #-52]
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	rsb	r3, r6, r0
	rsb	r2, r2, r0
	cmp	r2, r1
	addcc	r2, r5, #4
	movcs	r2, #1
	strcs	r2, [r4, #844]
	addcs	r2, r5, #4
	movcc	r1, #0
	strcc	r1, [r5, #4]
	add	r1, r8, #4
	ldr	r0, [r2]
	str	r1, [sp]
	mov	r1, #540
	ldr	r2, .L160+4
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	rsb	r3, r6, r10
	rsb	r2, r2, r10
	cmp	r2, r1
	addcc	r2, r5, #8
	movcs	r2, #1
	strcs	r2, [r4, #844]
	addcs	r2, r5, #8
	movcc	r1, #0
	strcc	r1, [r5, #8]
	add	r1, r8, #8
	ldr	r0, [r2]
	str	r1, [sp]
	mov	r1, #544
	ldr	r2, .L160+4
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	b	.L150
.L159:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L141
	mov	r0, r9
	ldr	r3, .L160+8
	ldr	r2, .L160+12
	movw	r1, #511
	bl	dprint_normal
	mvn	r0, #0
	b	.L142
.L161:
	.align	2
.L160:
	.word	g_HwMem
	.word	.LC31
	.word	.LANCHOR1+2012
	.word	.LC30
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgStreamAddrInfo, .-HEVCHAL_SetSliceMsgStreamAddrInfo
	.align	2
	.global	HEVCHAL_SetSliceMsgAPCIndex
	.type	HEVCHAL_SetSliceMsgAPCIndex, %function
HEVCHAL_SetSliceMsgAPCIndex:
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
	ldr	lr, [r0, #68]
	cmp	lr, #0
	beq	.L172
	mov	ip, #0
	ldr	r8, .L186
	add	r4, r0, #368
	mov	r2, ip
	mov	r7, #15
	mov	r9, #1
	b	.L171
.L166:
	cmp	r6, r2
	beq	.L182
.L169:
	add	r2, r2, #1
	cmp	lr, r2
	bls	.L172
.L171:
	and	r3, r2, #7
	ldr	r5, [r4, #4]!
	cmp	r3, #7
	sub	r6, lr, #1
	mov	r3, r3, asl #2
	orr	ip, ip, r5, asl r3
	bne	.L166
	ldr	r5, [r8, #848]
	add	r3, r1, r7
	ldr	lr, [r8, #852]
	add	r2, r2, #1
	rsb	r3, r5, r3
	cmp	r3, lr
	strcc	ip, [r1, r7, asl #2]
	strcs	r9, [r8, #844]
	add	r7, r7, #1
	ldr	lr, [r0, #68]
	mov	ip, #0
	cmp	lr, r2
	bhi	.L171
.L172:
	ldr	lr, [r0, #72]
	cmp	lr, #0
	beq	.L183
	mov	ip, #0
	ldr	r8, .L186
	add	r4, r0, #432
	mov	r2, ip
	mov	r7, #17
	mov	r9, #1
	b	.L178
.L173:
	cmp	r6, r2
	beq	.L184
.L176:
	add	r2, r2, #1
	cmp	lr, r2
	bls	.L185
.L178:
	and	r3, r2, #7
	ldr	r5, [r4, #4]!
	cmp	r3, #7
	sub	r6, lr, #1
	mov	r3, r3, asl #2
	orr	ip, ip, r5, asl r3
	bne	.L173
	ldr	r5, [r8, #848]
	add	r3, r1, r7
	ldr	lr, [r8, #852]
	add	r2, r2, #1
	rsb	r3, r5, r3
	cmp	r3, lr
	strcc	ip, [r1, r7, asl #2]
	strcs	r9, [r8, #844]
	add	r7, r7, #1
	ldr	lr, [r0, #72]
	mov	ip, #0
	cmp	lr, r2
	bhi	.L178
.L185:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L182:
	ldr	r5, [r8, #848]
	add	r3, r1, r7
	ldr	lr, [r8, #852]
	rsb	r3, r5, r3
	cmp	r3, lr
	strcs	r9, [r8, #844]
	strcc	ip, [r1, r7, asl #2]
	ldr	lr, [r0, #68]
	b	.L169
.L184:
	ldr	r5, [r8, #848]
	add	r3, r1, r7
	ldr	lr, [r8, #852]
	rsb	r3, r5, r3
	cmp	r3, lr
	strcs	r9, [r8, #844]
	strcc	ip, [r1, r7, asl #2]
	ldr	lr, [r0, #72]
	b	.L176
.L183:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L187:
	.align	2
.L186:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgAPCIndex, .-HEVCHAL_SetSliceMsgAPCIndex
	.align	2
	.global	HEVCHAL_SetSliceMsgWPInfo
	.type	HEVCHAL_SetSliceMsgWPInfo, %function
HEVCHAL_SetSliceMsgWPInfo:
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
	mov	r6, r1
	mov	r0, #64
	mov	r1, r2
	mov	r4, r2
	bl	HEVC_GetVirAddr
	mov	r1, r4
	str	r0, [fp, #-52]
	mov	r0, #128
	bl	HEVC_GetVirAddr
	ldrb	r3, [r5, #37]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L189
	ldr	r3, [r6, #76]
	cmp	r3, #1
	beq	.L190
.L189:
	ldrb	r3, [r5, #36]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L221
.L188:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L221:
	ldr	r3, [r6, #76]
	cmp	r3, #0
	bne	.L188
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L209
.L208:
	ldr	lr, .L222
	add	r10, r6, #584
	ldr	r9, [fp, #-52]
	mov	r8, r0
	mov	r5, r6
	mov	r4, #0
	add	r3, r6, #712
	str	r3, [fp, #-48]
.L200:
	ldr	r3, [fp, #-52]
	add	r8, r8, #4
	ldr	r1, [lr, #848]
	add	r5, r5, #8
	ldr	ip, [fp, #-48]
	add	r3, r3, r4
	ldr	r2, [lr, #852]
	rsb	r3, r1, r3
	add	r9, r9, #4
	cmp	r3, r2
	ldr	r7, [ip, #4]!
	ldr	r3, [r10, #4]!
	ubfx	r3, r3, #0, #9
	uxtb	r7, r7
	str	ip, [fp, #-48]
	movcc	r3, r3, asl #3
	ldr	ip, [r6, #580]
	orrcc	r7, r3, r7, asl #12
	ldrcc	r3, .L222
	ldrcs	r3, .L222
	and	ip, ip, #7
	orrcc	r7, r7, ip
	strcc	r7, [r9, #-4]
	ldrcc	r1, [r3, #848]
	movcs	ip, #1
	ldrcc	r2, [r3, #852]
	strcs	ip, [r3, #844]
	add	r3, r0, r4
	ldr	ip, [r5, #836]
	rsb	r3, r1, r3
	ldr	r7, [r5, #1092]
	cmp	r3, r2
	ubfx	r3, ip, #0, #9
	ldr	ip, [r6, #584]
	movcs	r3, #1
	strcs	r3, [lr, #844]
	uxtb	r7, r7
	movcc	r3, r3, asl #3
	and	ip, ip, #7
	orrcc	r7, r3, r7, asl #12
	add	r3, r4, #32
	orrcc	r7, r7, ip
	strcc	r7, [r8, #-4]
	ldr	ip, [r5, #1096]
	add	r3, r0, r3
	ldrcc	r1, [lr, #848]
	add	r4, r4, #1
	ldrcc	r2, [lr, #852]
	rsb	r1, r1, r3
	ldr	r3, [r5, #840]
	cmp	r1, r2
	uxtb	ip, ip
	ubfx	r3, r3, #0, #9
	orrcc	r3, r3, ip, asl #9
	movcs	r3, #1
	strcc	r3, [r8, #124]
	strcs	r3, [lr, #844]
	ldr	r3, [r6, #68]
	cmp	r3, r4
	bhi	.L200
	ldr	r3, [r6, #76]
	cmp	r3, #0
	bne	.L188
.L209:
	ldr	r3, [r6, #72]
	cmp	r3, #0
	beq	.L188
	add	r3, r6, #776
	str	r3, [fp, #-56]
	add	r3, r6, #648
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	mov	r9, r0
	ldr	lr, .L222
	mov	r5, r6
	add	r10, r3, #64
	mov	r7, #0
.L207:
	ldr	r4, [fp, #-56]
	add	r3, r7, #16
	ldr	r2, [fp, #-52]
	add	r9, r9, #4
	ldr	ip, [lr, #848]
	add	r5, r5, #8
	ldr	r8, [r4, #4]!
	add	r2, r2, r3
	ldr	r1, [lr, #852]
	rsb	r2, ip, r2
	add	r3, r0, r3
	add	r10, r10, #4
	str	r4, [fp, #-56]
	cmp	r2, r1
	ldr	r4, [fp, #-48]
	uxtb	r8, r8
	ldr	r2, [r4, #4]!
	ubfx	r2, r2, #0, #9
	ldrcs	r2, .L222
	str	r4, [fp, #-48]
	ldr	r4, [r6, #580]
	movcc	r2, r2, asl #3
	orrcc	r2, r2, r8, asl #12
	and	r4, r4, #7
	movcs	r4, #1
	orrcc	r4, r2, r4
	ldrcc	r2, .L222
	strcc	r4, [r10, #-4]
	strcs	r4, [r2, #844]
	ldrcc	ip, [r2, #848]
	ldrcc	r1, [r2, #852]
	ldr	r4, [r5, #1220]
	rsb	r3, ip, r3
	ldr	r2, [r5, #964]
	cmp	r3, r1
	ldr	r8, [r6, #584]
	ubfx	r3, r2, #0, #9
	uxtb	r4, r4
	and	r2, r8, #7
	movcs	r3, #1
	movcc	r3, r3, asl #3
	strcs	r3, [lr, #844]
	orrcc	r4, r3, r4, asl #12
	add	r3, r7, #48
	orrcc	r4, r4, r2
	strcc	r4, [r9, #60]
	ldr	r2, [r5, #1224]
	add	r3, r0, r3
	ldrcc	ip, [lr, #848]
	add	r7, r7, #1
	ldrcc	r1, [lr, #852]
	rsb	ip, ip, r3
	ldr	r3, [r5, #968]
	cmp	ip, r1
	uxtb	r2, r2
	ubfx	r3, r3, #0, #9
	orrcc	r3, r3, r2, asl #9
	movcs	r3, #1
	strcc	r3, [r9, #188]
	strcs	r3, [lr, #844]
	ldr	r3, [r6, #72]
	cmp	r3, r7
	bhi	.L207
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L190:
	ldr	r3, [r6, #68]
	cmp	r3, #0
	bne	.L208
	b	.L188
.L223:
	.align	2
.L222:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgWPInfo, .-HEVCHAL_SetSliceMsgWPInfo
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.align	2
	.global	HEVCHAL_SetSliceMsg
	.type	HEVCHAL_SetSliceMsg, %function
HEVCHAL_SetSliceMsg:
	UNWIND(.fnstart)
	@ args = 20, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r4, .L269
	mov	r7, r0
	mov	r5, r2
	mov	r8, r3
	sub	r3, fp, #36
	ldmia	r4, {r0, r1, r2}
	stmdb	r3, {r0, r1, r2}
	mov	r0, r8
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L268
	ldr	r3, .L269+4
	mov	r2, #1024
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, .L269+8
	movw	r1, #699
	mov	r0, #5
	bl	dprint_normal
	mov	r3, r8
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	bl	HEVCHAL_SetSliceMsgStreamAddrInfo
	cmn	r0, #1
	beq	.L226
	ldr	r4, .L269+12
	add	r1, r6, #6
	ldr	r0, [r5, #28]
	ldrb	r2, [r5, #32]	@ zero_extendqisi2
	ldr	ip, [r4, #848]
	and	r0, r0, #127
	ldrb	r3, [r5, #24]	@ zero_extendqisi2
	rsb	r1, ip, r1
	mov	r2, r2, asl #18
	ldr	ip, [r5, #36]
	orr	r0, r2, r0, asl #19
	mov	r2, r3, asl #27
	ldrb	r3, [r5, #25]	@ zero_extendqisi2
	orr	r0, r0, ip
	ldr	ip, [r4, #852]
	cmp	r1, ip
	orr	r3, r2, r3, asl #26
	orr	r3, r0, r3
	movw	r1, #721
	movcs	r2, #1
	strcc	r3, [r6, #24]
	strcs	r2, [r4, #844]
	mov	r0, #5
	ldr	r2, .L269+16
	bl	dprint_normal
	ldr	r2, [r5, #44]
	ldr	r3, [r5, #56]
	add	ip, r6, #7
	ldr	r0, [r5, #76]
	ldr	r8, [r5, #60]
	mov	r2, r2, asl #24
	ldr	r1, [r5, #72]
	orr	r3, r2, r3, asl #20
	sub	r2, fp, #36
	ldr	lr, [r5, #68]
	add	r0, r2, r0, lsl #2
	orr	r3, r3, r8, asl #16
	ldr	r2, [r5, #40]
	orr	r1, r3, r1, asl #8
	ldr	r0, [r0, #-12]
	orr	r1, r1, lr, asl #2
	ldrb	lr, [r5, #52]	@ zero_extendqisi2
	ldrb	r3, [r5, #64]	@ zero_extendqisi2
	orr	r1, r1, r0
	ldr	r0, [r4, #848]
	orr	r2, r1, r2, asl #28
	orr	r2, r2, lr, asl #27
	ldrb	r1, [r5, #65]	@ zero_extendqisi2
	rsb	ip, r0, ip
	ldr	r0, [r4, #852]
	orr	r3, r2, r3, asl #15
	ldr	r2, .L269+12
	cmp	ip, r0
	orr	r3, r3, r1, asl #14
	mov	r0, #5
	strcc	r3, [r6, #28]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	ldr	r2, .L269+20
	mov	r1, #736
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #8
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+24
	ldrcc	r3, [fp, #8]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	movw	r1, #741
	strcc	r3, [r6, #32]
	ldr	r3, [fp, #8]
	bl	dprint_normal
	ldr	r8, [r7, #20]
	ldr	r0, [fp, #8]
	add	r8, r8, #1
	mov	r1, r8
	bl	__aeabi_uidivmod
	ldr	r0, [fp, #8]
	mov	r9, r1
	mov	r1, r8
	bl	__aeabi_uidiv
	ldr	r1, [r4, #848]
	ldr	r3, [r4, #852]
	add	r2, r6, #9
	rsb	r2, r1, r2
	ldr	r1, .L269+12
	cmp	r2, r3
	movcs	r2, #1
	strcs	r2, [r1, #844]
	ldr	r2, .L269+28
	movw	r1, #750
	orr	r3, r9, r0, asl #16
	mov	r0, #5
	strcc	r3, [r6, #36]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #10
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+32
	ldrcc	r3, [fp, #12]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	movw	r1, #755
	strcc	r3, [r6, #40]
	ldr	r3, [fp, #12]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r5, #96]
	add	r2, r6, #11
	ldr	r0, [r4, #852]
	rsb	r2, r3, r2
	ldr	r3, [r5, #100]
	cmp	r2, r0
	and	r2, r1, #31
	ldr	r1, .L269+12
	and	r3, r3, #31
	orr	r3, r3, r2, asl #8
	mov	r0, #5
	movcs	r2, #1
	strcc	r3, [r6, #44]
	strcs	r2, [r1, #844]
	movw	r1, #763
	ldr	r2, .L269+36
	bl	dprint_normal
	ldr	r0, [r5, #108]
	ldr	r2, [r5, #104]
	add	ip, r6, #12
	and	r0, r0, #15
	ldrb	r1, [r5, #115]	@ zero_extendqisi2
	and	r2, r2, #15
	ldrb	lr, [r5, #113]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	ldrb	r3, [r5, #112]	@ zero_extendqisi2
	ldr	r8, [r4, #848]
	orr	r2, r0, r2, asl #16
	orr	r2, r2, r1
	ldrb	r0, [r5, #114]	@ zero_extendqisi2
	rsb	r1, r8, ip
	orr	r2, r2, lr, asl #3
	ldr	ip, [r4, #852]
	orr	r3, r2, r3, asl #2
	ldr	r2, .L269+12
	orr	r3, r3, r0, asl #1
	cmp	r1, ip
	mov	r0, #5
	strcc	r3, [r6, #48]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	ldr	r2, .L269+40
	movw	r1, #775
	bl	dprint_normal
	ldr	ip, [r5, #68]
	cmp	ip, #0
	beq	.L264
	mov	r3, #0
	add	r1, r5, #112
	mov	r2, r3
.L242:
	ldr	r0, [r1, #4]!
	orr	r3, r3, r0, asl r2
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L242
.L241:
	ldr	r0, [r4, #848]
	add	r2, r6, #13
	ldr	r1, [r4, #852]
	rsb	r2, r0, r2
	ldr	r0, .L269+12
	cmp	r2, r1
	movw	r1, #786
	strcc	r3, [r6, #52]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L269+44
	mov	r0, #5
	bl	dprint_normal
	ldr	ip, [r5, #72]
	cmp	ip, #0
	beq	.L265
	mov	r3, #0
	add	r1, r5, #176
	mov	r2, r3
.L246:
	ldr	r0, [r1, #4]!
	orr	r3, r3, r0, asl r2
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L246
.L245:
	ldr	r0, [r4, #848]
	add	r2, r6, #14
	ldr	r1, [r4, #852]
	rsb	r2, r0, r2
	ldr	r0, .L269+12
	cmp	r2, r1
	movw	r1, #795
	strcc	r3, [r6, #56]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L269+48
	mov	r0, #5
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r5
	bl	HEVCHAL_SetSliceMsgAPCIndex
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r6, #23
	rsb	r2, r3, r2
	ldr	r3, [r5, #564]
	cmp	r2, r1
	ldr	r2, .L269+12
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #92]
	strcs	r1, [r2, #844]
	movw	r1, #802
	ldr	r2, .L269+52
	bl	dprint_normal
	ldr	r3, [r7, #80]
	ldr	r0, [r4, #848]
	add	r2, r6, #24
	ldr	r1, [r4, #852]
	rsb	r2, r0, r2
	mov	r3, r3, lsr #1
	cmp	r2, r1
	ldr	r2, .L269+12
	mov	r3, r3, asl #8
	mov	r0, #5
	orr	r3, r3, #16384
	movcs	r1, #1
	orr	r3, r3, #10
	strcs	r1, [r2, #844]
	strcc	r3, [r6, #96]
	movw	r1, #810
	ldr	r2, .L269+56
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #25
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+60
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	movw	r1, #946
	strcc	r3, [r6, #100]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #37
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+64
	movcs	r3, #1
	movcc	r3, #134217728
	strcs	r3, [r1, #844]
	movw	r1, #951
	strcc	r3, [r6, #148]
	mov	r3, #134217728
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #43
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+68
	ldrcc	r3, [fp, #16]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	mov	r1, #956
	strcc	r3, [r6, #172]
	ldr	r3, [fp, #16]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #44
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+72
	ldrcc	r3, [fp, #20]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	mov	r1, #960
	strcc	r3, [r6, #176]
	ldr	r3, [fp, #20]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r6, #63
	rsb	r3, r1, r3
	ldr	r1, .L269+12
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L269+76
	ldrcc	r3, [fp, #4]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	movw	r1, #994
	strcc	r3, [r6, #252]
	ldr	r3, [fp, #4]
	bl	dprint_normal
	mov	r0, r7
	mov	r2, r6
	mov	r1, r5
	bl	HEVCHAL_SetSliceMsgWPInfo
	mov	r0, #0
.L226:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L264:
	mov	r3, ip
	b	.L241
.L265:
	mov	r3, ip
	b	.L245
.L268:
	ldr	ip, .L269+80
	add	r3, r4, #12
	ldr	r2, .L269+84
	movw	r1, #694
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L226
.L270:
	.align	2
.L269:
	.word	.LANCHOR1+2048
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	.word	g_HwMem
	.word	.LC15
	.word	.LC16
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC18
	.word	.LC43
	.word	.LC19
	.word	.LC44
	.word	.LC29
	.word	.LC32
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsg, .-HEVCHAL_SetSliceMsg
	.align	2
	.global	HEVCHAL_CheckParaValid
	.type	HEVCHAL_CheckParaValid, %function
HEVCHAL_CheckParaValid:
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
	ldr	r3, [r0, #2356]
	cmp	r3, #16
	movls	r0, #0
	bhi	.L274
.L272:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L274:
	ldr	ip, .L275
	mov	r1, #1004
	ldr	r3, .L275+4
	mov	r0, #0
	ldr	r2, .L275+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L272
.L276:
	.align	2
.L275:
	.word	.LC45
	.word	.LANCHOR1+2080
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_CheckParaValid, .-HEVCHAL_CheckParaValid
	.align	2
	.global	HEVCHAL_CheckSlicePara
	.type	HEVCHAL_CheckSlicePara, %function
HEVCHAL_CheckSlicePara:
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
	beq	.L281
	cmp	r1, #0
	ldr	r3, [r0, #92]
	movgt	r0, #1
	movle	r0, #0
	cmp	r3, r2
	movcs	r0, #0
	andcc	r0, r0, #1
	cmp	r0, #0
	bne	.L282
.L279:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L282:
	str	r2, [sp]
	movw	r1, #1019
	ldr	r2, .L283
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L279
.L281:
	str	r1, [sp]
	mov	r0, #1
	movw	r1, #1013
	ldr	r3, .L283+4
	ldr	r2, .L283+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L279
.L284:
	.align	2
.L283:
	.word	.LC47
	.word	.LANCHOR1+2104
	.word	.LC46
	UNWIND(.fnend)
	.size	HEVCHAL_CheckSlicePara, .-HEVCHAL_CheckSlicePara
	.align	2
	.global	HEVCHAL_FindNextSlicePara
	.type	HEVCHAL_FindNextSlicePara, %function
HEVCHAL_FindNextSlicePara:
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
	cmp	r2, r1
	ldr	lr, [r0, #92]
	str	r2, [r3]
	ldmgefd	sp, {fp, sp, pc}
	ldr	r0, [r0, #1356]
	cmp	r0, #0
	beq	.L289
	ldr	ip, [r0, #92]
	cmp	lr, ip
	ldmccfd	sp, {fp, sp, pc}
	add	r2, r2, #1
	b	.L288
.L290:
	ldr	r0, [r0, #1356]
	cmp	r0, #0
	beq	.L289
	ldr	ip, [r0, #92]
	cmp	lr, ip
	ldmccfd	sp, {fp, sp, pc}
.L288:
	cmp	r2, r1
	str	r2, [r3]
	add	r2, r2, #1
	bne	.L290
	ldmfd	sp, {fp, sp, pc}
.L289:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_FindNextSlicePara, .-HEVCHAL_FindNextSlicePara
	.align	2
	.global	HEVCHAL_CheckSliceAddrValid
	.type	HEVCHAL_CheckSliceAddrValid, %function
HEVCHAL_CheckSliceAddrValid:
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
	cmp	r1, r2
	ldr	ip, [r0, #572]
	bgt	.L296
	cmp	r2, ip
	blt	.L296
	ldr	r3, [r0, #92]
	cmp	r3, ip
	movls	r0, #0
	bhi	.L300
.L298:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L296:
	str	r2, [sp, #4]
	mov	r3, r1
	str	ip, [sp]
	movw	r1, #1051
	ldr	r2, .L301
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L298
.L300:
	str	ip, [sp]
	movw	r1, #1057
	ldr	r2, .L301+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L298
.L302:
	.align	2
.L301:
	.word	.LC48
	.word	.LC49
	UNWIND(.fnend)
	.size	HEVCHAL_CheckSliceAddrValid, .-HEVCHAL_CheckSliceAddrValid
	.align	2
	.global	HEVCHAL_SetSliceMsgSedOnly
	.type	HEVCHAL_SetSliceMsgSedOnly, %function
HEVCHAL_SetSliceMsgSedOnly:
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
	mov	r6, r0
	ldr	r0, [r0, #2360]
	mov	r8, r1
	ldr	r2, [r6, #2364]
	cmp	r0, #0
	ble	.L304
	mov	r3, #0
	mov	r7, r3
	mov	r4, r3
.L306:
	ldrb	r1, [r2, #25]	@ zero_extendqisi2
	cmp	r1, #0
	moveq	r7, r3
	add	r3, r3, #1
	moveq	r4, r2
	cmp	r3, r0
	ldr	r2, [r2, #1356]
	bne	.L306
	cmp	r4, #0
	beq	.L304
	rsb	r3, r7, r3
	cmp	r3, #0
	addgt	r9, r8, #40
	movgt	r5, #0
	bgt	.L313
	b	.L314
.L320:
	ldr	lr, [r4, #1356]
	ldrb	r10, [r6, #221]	@ zero_extendqisi2
	ldr	r2, [lr, #92]
	cmp	r10, #0
	sub	r2, r2, #1
	ldrne	lr, [lr, #568]
	moveq	lr, r2
.L311:
	str	r2, [sp, #16]
	mov	r2, r4
	str	r1, [sp, #8]
	mov	r1, r8
	str	r0, [sp, #4]
	mov	r0, r6
	str	lr, [sp, #12]
	add	r5, r5, #1
	str	ip, [sp]
	bl	HEVCHAL_SetSliceMsg
	cmp	r0, #0
	bne	.L319
	ldr	r3, [r6, #2360]
	ldr	r4, [r4, #1356]
	rsb	r3, r7, r3
	cmp	r3, r5
	ble	.L314
.L313:
	sub	r2, r3, #1
	ldr	r0, [r4, #80]
	cmp	r5, #198
	cmple	r5, r2
	ldr	r3, [r9]
	ldr	r1, [r4, #92]
	movlt	r2, #1
	movge	r2, #0
	ldr	ip, [r9, #4]!
	blt	.L320
	ldr	lr, [r6, #16]
	mov	ip, r2
	ldr	r2, [r6, #20]
	mla	lr, r2, lr, lr
	add	r2, lr, r2
	mov	lr, r2
	b	.L311
.L314:
	mov	r0, #0
.L308:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L319:
	ldr	r3, .L321
	movw	r1, #1127
	ldr	r2, .L321+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L304:
	ldr	r3, .L321
	movw	r1, #1092
	ldr	r2, .L321+8
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L308
.L322:
	.align	2
.L321:
	.word	.LANCHOR1+2128
	.word	.LC51
	.word	.LC50
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgSedOnly, .-HEVCHAL_SetSliceMsgSedOnly
	.align	2
	.global	HEVCHAL_StartDec
	.type	HEVCHAL_StartDec, %function
HEVCHAL_StartDec:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	r3, [r0, #2356]
	mov	r10, r0
	str	r1, [fp, #-84]
	cmp	r3, #16
	bhi	.L378
	ldr	r2, [fp, #-84]
	mov	r3, #1000
	ldr	r1, .L387
	mla	r3, r3, r2, r1
	mov	r2, r3
	str	r3, [fp, #-76]
	mov	r1, r2
	ldr	r3, [r3, #40]
	ldr	r2, [r2, #32]
	bl	HEVCHAL_SetPicMsg
	ldr	r6, [r10, #2364]
	cmp	r6, #0
	beq	.L379
	add	r3, r10, #4096
	ldr	r3, [r3, #828]
	cmp	r3, #1
	beq	.L380
	ldr	r4, [r6, #92]
	cmp	r4, #0
	bne	.L381
	str	r4, [fp, #-80]
.L327:
	ldr	r2, [r10, #20]
	ldr	r3, [r10, #16]
	ldr	r1, [r10, #2360]
	mla	r3, r2, r3, r3
	cmp	r1, #0
	add	r9, r3, r2
	ble	.L330
	ldr	r1, [fp, #-80]
	mov	r3, #250
	mov	r2, #0
	str	r2, [fp, #-48]
	add	r1, r1, #6
	str	r1, [fp, #-68]
	ldr	r1, [fp, #-84]
	mov	r8, r2
	mul	r3, r3, r1
	str	r3, [fp, #-72]
.L346:
	ldr	r3, [fp, #-72]
	mov	r0, r6
	ldr	r1, [fp, #-68]
	add	r3, r3, r8
	ldr	ip, .L387
	add	r3, r3, r1
	mov	r1, r8
	add	r3, r3, #4
	ldr	r3, [ip, r3, asl #2]
	str	r3, [fp, #-52]
	bl	HEVCHAL_CheckSlicePara
	cmn	r0, #1
	beq	.L375
	ldr	r1, [r10, #2360]
	add	r2, r8, #1
	ldr	r3, [r6, #80]
	cmp	r1, r2
	ldr	r5, [r6, #92]
	str	r3, [fp, #-56]
	ble	.L332
	ldr	r4, [r6, #1356]
	cmp	r4, #0
	bne	.L374
	b	.L333
.L383:
	add	r2, r2, #1
	cmp	r2, r1
	beq	.L382
	ldr	r4, [r4, #1356]
	cmp	r4, #0
	beq	.L333
.L374:
	ldr	r3, [r4, #92]
	cmp	r5, r3
	bcs	.L383
.L339:
	cmp	r1, r2
	beq	.L340
	ldr	r3, [fp, #-80]
	add	r3, r3, #2
	add	r8, r3, r8
	cmp	r8, #200
	bgt	.L340
	ldrb	r1, [r10, #221]	@ zero_extendqisi2
	mov	r8, r2
	ldr	r3, [r4, #92]
	cmp	r1, #0
	ldr	r1, [fp, #-72]
	sub	r3, r3, #1
	add	r1, r1, r2
	ldr	r2, [fp, #-68]
	ldrne	r7, [r4, #568]
	moveq	r7, r3
	add	r2, r1, r2
	ldr	r1, .L387
	add	r2, r2, #4
	ldr	r2, [r1, r2, asl #2]
	str	r2, [fp, #-64]
.L342:
	str	r3, [r6, #572]
	mov	r2, r9
	mov	r1, r7
	mov	r0, r6
	str	r3, [fp, #-60]
	bl	HEVCHAL_CheckSliceAddrValid
	cmn	r0, #1
	beq	.L375
	ldr	r3, [fp, #-60]
	mov	r2, r6
	ldr	r0, [fp, #-56]
	ldr	ip, [fp, #-64]
	str	r3, [sp, #16]
	str	r0, [sp, #4]
	mov	r0, r10
	ldr	r3, [fp, #-52]
	str	r7, [sp, #12]
	str	r5, [sp, #8]
	ldr	r1, [fp, #-76]
	str	ip, [sp]
	bl	HEVCHAL_SetSliceMsg
	cmp	r0, #0
	bne	.L384
	ldr	r3, [r10, #2360]
	ldr	r2, [fp, #-48]
	cmp	r8, r3
	add	r2, r2, #1
	str	r2, [fp, #-48]
	ldr	r2, [r6, #572]
	bge	.L385
	mov	r6, r4
	b	.L346
.L381:
	ldrb	r3, [r10, #221]	@ zero_extendqisi2
	mov	r0, #1000
	ldr	r2, .L387
	mov	r7, #1
	cmp	r3, #0
	ldr	r3, [fp, #-84]
	ldr	r9, [r6]
	sub	ip, r4, #1
	str	r7, [r6]
	mla	r0, r0, r3, r2
	ldr	r3, [r6, #4]
	ldrne	lr, [r6, #568]
	moveq	lr, ip
	ldr	r8, [r6, #16]
	mov	r2, r6
	str	r3, [fp, #-48]
	ldr	r3, [r6, #8]
	ldr	r1, [fp, #-76]
	str	r3, [fp, #-52]
	ldr	r3, [r6, #12]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [r6, #4]
	str	r3, [r6, #8]
	str	r3, [r6, #12]
	ldr	r5, [r10, #1324]
	str	r5, [r6, #16]
	ldr	r5, [r6, #20]
	str	r3, [r6, #20]
	str	r3, [sp, #8]
	str	r3, [sp, #4]
	ldr	r3, [r0, #40]
	ldr	r0, [r0, #44]
	str	ip, [sp, #16]
	str	lr, [sp, #12]
	str	r0, [sp]
	mov	r0, r10
	bl	HEVCHAL_SetSliceMsg
	cmp	r0, #0
	bne	.L386
	ldr	r3, [fp, #-48]
	str	r4, [r6, #92]
	str	r9, [r6]
	str	r3, [r6, #4]
	ldr	r3, [fp, #-52]
	str	r8, [r6, #16]
	str	r5, [r6, #20]
	str	r3, [r6, #8]
	ldr	r3, [fp, #-56]
	str	r7, [fp, #-80]
	str	r3, [r6, #12]
	ldr	r6, [r10, #2364]
	b	.L327
.L382:
	cmp	r4, #0
	beq	.L333
.L340:
	mov	r3, #0
	mov	r2, #0
	str	r3, [r6, #1356]
	mov	r7, r9
	ldr	r8, [r10, #2360]
	mov	r3, r9
	str	r2, [fp, #-64]
	b	.L342
.L332:
	cmp	r6, #0
	beq	.L333
	mov	r4, r6
	b	.L339
.L384:
	ldr	r3, .L387+4
	movw	r1, #1279
	ldr	r2, .L387+8
	mov	r0, #1
	bl	dprint_normal
.L375:
	mvn	r5, #0
.L369:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L378:
	ldr	ip, .L387+12
	mov	r1, #1004
	ldr	r3, .L387+16
	mov	r0, #0
	ldr	r2, .L387+20
	mvn	r5, #0
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L333:
	ldr	r3, .L387+4
	mov	r1, #1248
	ldr	r2, .L387+24
	mov	r0, #1
	bl	dprint_normal
	mvn	r5, #0
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L385:
	cmp	r3, #0
	ldr	r1, [fp, #-48]
	mov	r5, r0
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, #0
	andgt	r2, r2, #1
	movle	r2, #0
	cmp	r2, #0
	beq	.L330
	ldr	r0, [fp, #-80]
	mov	r2, #250
	ldr	r1, [fp, #-84]
	mla	r2, r2, r1, r0
	add	r3, r2, r3
	ldr	r2, .L387
	add	r3, r3, #9
	ldr	r0, [r2, r3, asl #2]
	bl	HEVCHAL_CutSliceChain
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L380:
	ldr	r1, [fp, #-76]
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	HEVCHAL_SetSliceMsgSedOnly
.L330:
	ldr	r2, .L387+28
	movw	r1, #1294
	mov	r0, #1
	mvn	r5, #0
	bl	dprint_normal
	b	.L369
.L386:
	mov	r0, r7
	ldr	r3, .L387+4
	ldr	r2, .L387+32
	movw	r1, #1210
	bl	dprint_normal
	mvn	r5, #0
	b	.L369
.L379:
	mov	r0, r6
	ldr	r3, .L387+4
	ldr	r2, .L387+36
	movw	r1, #1171
	bl	dprint_normal
	mvn	r5, #0
	b	.L369
.L388:
	.align	2
.L387:
	.word	g_HwMem
	.word	.LANCHOR1+2156
	.word	.LC54
	.word	.LC45
	.word	.LANCHOR1+2080
	.word	.LC2
	.word	.LC53
	.word	.LC55
	.word	.LC51
	.word	.LC52
	UNWIND(.fnend)
	.size	HEVCHAL_StartDec, .-HEVCHAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.10228, %object
	.size	__func__.10228, 22
__func__.10228:
	.ascii	"HEVCHAL_WriteCabacTab\000"
	.space	2
	.type	s_InitValue, %object
	.size	s_InitValue, 1920
s_InitValue:
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	200
	.word	139
	.word	141
	.word	157
	.word	154
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	184
	.word	-1
	.word	-1
	.word	-1
	.word	184
	.word	63
	.word	94
	.word	138
	.word	182
	.word	154
	.word	111
	.word	141
	.word	154
	.word	154
	.word	139
	.word	139
	.word	138
	.word	153
	.word	136
	.word	167
	.word	152
	.word	152
	.word	110
	.word	110
	.word	124
	.word	125
	.word	140
	.word	153
	.word	125
	.word	127
	.word	140
	.word	109
	.word	111
	.word	143
	.word	127
	.word	111
	.word	79
	.word	108
	.word	123
	.word	63
	.word	110
	.word	110
	.word	124
	.word	125
	.word	140
	.word	153
	.word	125
	.word	127
	.word	140
	.word	109
	.word	111
	.word	143
	.word	127
	.word	111
	.word	79
	.word	108
	.word	123
	.word	63
	.word	91
	.word	171
	.word	134
	.word	141
	.word	140
	.word	92
	.word	137
	.word	138
	.word	140
	.word	152
	.word	138
	.word	139
	.word	153
	.word	74
	.word	149
	.word	92
	.word	139
	.word	107
	.word	122
	.word	152
	.word	140
	.word	179
	.word	166
	.word	182
	.word	140
	.word	227
	.word	122
	.word	197
	.word	111
	.word	111
	.word	125
	.word	110
	.word	110
	.word	94
	.word	124
	.word	108
	.word	124
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	140
	.word	139
	.word	182
	.word	182
	.word	152
	.word	136
	.word	152
	.word	136
	.word	153
	.word	136
	.word	139
	.word	111
	.word	136
	.word	139
	.word	111
	.word	-1
	.word	153
	.word	138
	.word	138
	.word	-1
	.word	-1
	.word	79
	.word	110
	.word	122
	.word	95
	.word	79
	.word	63
	.word	31
	.word	31
	.word	153
	.word	153
	.word	168
	.word	140
	.word	198
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	185
	.word	107
	.word	139
	.word	126
	.word	154
	.word	197
	.word	185
	.word	201
	.word	149
	.word	154
	.word	139
	.word	154
	.word	154
	.word	154
	.word	152
	.word	149
	.word	107
	.word	167
	.word	154
	.word	153
	.word	111
	.word	154
	.word	154
	.word	139
	.word	139
	.word	107
	.word	167
	.word	91
	.word	122
	.word	107
	.word	167
	.word	125
	.word	110
	.word	94
	.word	110
	.word	95
	.word	79
	.word	125
	.word	111
	.word	110
	.word	78
	.word	110
	.word	111
	.word	111
	.word	95
	.word	94
	.word	108
	.word	123
	.word	108
	.word	125
	.word	110
	.word	94
	.word	110
	.word	95
	.word	79
	.word	125
	.word	111
	.word	110
	.word	78
	.word	110
	.word	111
	.word	111
	.word	95
	.word	94
	.word	108
	.word	123
	.word	108
	.word	121
	.word	140
	.word	61
	.word	154
	.word	154
	.word	196
	.word	196
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	182
	.word	134
	.word	149
	.word	136
	.word	153
	.word	121
	.word	136
	.word	137
	.word	169
	.word	194
	.word	166
	.word	167
	.word	154
	.word	167
	.word	137
	.word	182
	.word	155
	.word	154
	.word	139
	.word	153
	.word	139
	.word	123
	.word	123
	.word	63
	.word	153
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	170
	.word	153
	.word	123
	.word	123
	.word	107
	.word	121
	.word	107
	.word	121
	.word	167
	.word	151
	.word	183
	.word	140
	.word	151
	.word	183
	.word	140
	.word	-1
	.word	124
	.word	138
	.word	94
	.word	-1
	.word	-1
	.word	79
	.word	154
	.word	137
	.word	95
	.word	79
	.word	63
	.word	31
	.word	31
	.word	153
	.word	153
	.word	168
	.word	169
	.word	198
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	160
	.word	107
	.word	139
	.word	126
	.word	154
	.word	197
	.word	185
	.word	201
	.word	134
	.word	154
	.word	139
	.word	154
	.word	154
	.word	183
	.word	152
	.word	149
	.word	92
	.word	167
	.word	154
	.word	153
	.word	111
	.word	154
	.word	154
	.word	139
	.word	139
	.word	107
	.word	167
	.word	91
	.word	107
	.word	107
	.word	167
	.word	125
	.word	110
	.word	124
	.word	110
	.word	95
	.word	94
	.word	125
	.word	111
	.word	111
	.word	79
	.word	125
	.word	126
	.word	111
	.word	111
	.word	79
	.word	108
	.word	123
	.word	93
	.word	125
	.word	110
	.word	124
	.word	110
	.word	95
	.word	94
	.word	125
	.word	111
	.word	111
	.word	79
	.word	125
	.word	126
	.word	111
	.word	111
	.word	79
	.word	108
	.word	123
	.word	93
	.word	121
	.word	140
	.word	61
	.word	154
	.word	154
	.word	196
	.word	167
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	182
	.word	134
	.word	149
	.word	136
	.word	153
	.word	121
	.word	136
	.word	122
	.word	169
	.word	208
	.word	166
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	170
	.word	154
	.word	139
	.word	153
	.word	139
	.word	123
	.word	123
	.word	63
	.word	124
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	170
	.word	153
	.word	138
	.word	138
	.word	122
	.word	121
	.word	122
	.word	121
	.word	167
	.word	151
	.word	183
	.word	140
	.word	151
	.word	183
	.word	140
	.word	-1
	.word	224
	.word	167
	.word	122
	.word	-1
	.word	-1
	.type	__func__.10255, %object
	.size	__func__.10255, 22
__func__.10255:
	.ascii	"HEVCHAL_CutSliceChain\000"
	.space	2
	.type	__func__.10273, %object
	.size	__func__.10273, 22
__func__.10273:
	.ascii	"HEVCHAL_WriteTileInfo\000"
	.space	2
	.type	__func__.10304, %object
	.size	__func__.10304, 18
__func__.10304:
	.ascii	"HEVCHAL_SetPicMsg\000"
	.space	2
	.type	__func__.10324, %object
	.size	__func__.10324, 34
__func__.10324:
	.ascii	"HEVCHAL_SetSliceMsgStreamAddrInfo\000"
	.space	2
.LC0:
	.word	2
	.word	1
	.word	0
	.type	__func__.10384, %object
	.size	__func__.10384, 20
__func__.10384:
	.ascii	"HEVCHAL_SetSliceMsg\000"
	.type	__func__.10394, %object
	.size	__func__.10394, 23
__func__.10394:
	.ascii	"HEVCHAL_CheckParaValid\000"
	.space	1
	.type	__func__.10400, %object
	.size	__func__.10400, 23
__func__.10400:
	.ascii	"HEVCHAL_CheckSlicePara\000"
	.space	1
	.type	__func__.10434, %object
	.size	__func__.10434, 27
__func__.10434:
	.ascii	"HEVCHAL_SetSliceMsgSedOnly\000"
	.space	1
	.type	__func__.10463, %object
	.size	__func__.10463, 17
__func__.10463:
	.ascii	"HEVCHAL_StartDec\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	ASCII(.ascii	"line %d func %s\011HEVCWriteCabacTab return error.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC2:
	ASCII(.ascii	"%s: %s\012\000" )
.LC3:
	ASCII(.ascii	"can not map mn virtual address!\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"HEVCWriteCabacTab return error.\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"can not map slice msg virtual address!\012\000" )
.LC6:
	ASCII(.ascii	"can not map slice segment info virtual address!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC7:
	ASCII(.ascii	"can not map down msg virtual address!\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"pic msg burst0:\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"D0 = 0x%x\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"D1 = 0x%x\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"D2 = 0x%x\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"D3 = 0x%x\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"D4 = 0x%x\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"D5 = 0x%x\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"D6 = 0x%x\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"D7 = 0x%x\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"D%d = 0x%x\012\000" )
.LC18:
	ASCII(.ascii	"D25 = 0x%x\012\000" )
.LC19:
	ASCII(.ascii	"D43 = 0x%x\012\000" )
.LC20:
	ASCII(.ascii	"D54 = 0x%x\012\000" )
.LC21:
	ASCII(.ascii	"HEVC_WriteTileInfo return error.\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"D55 = 0x%x\012\000" )
.LC23:
	ASCII(.ascii	"D56 = 0x%x\012\000" )
.LC24:
	ASCII(.ascii	"D57 = 0x%x\012\000" )
.LC25:
	ASCII(.ascii	"D58 = 0x%x\012\000" )
.LC26:
	ASCII(.ascii	"D59 = 0x%x\012\000" )
.LC27:
	ASCII(.ascii	"D60 = 0x%x\012\000" )
.LC28:
	ASCII(.ascii	"D61 = 0x%x\012\000" )
.LC29:
	ASCII(.ascii	"D63 = 0x%x\012\000" )
.LC30:
	ASCII(.ascii	"%s FATAL: i=0, valid_bitlen=0\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"slicemsg D[%d] addr 0x%x = 0x%x\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"HEVCHAL_SetSliceMsg can not map slice msg virtual a" )
	ASCII(.ascii	"ddress!\012\000" )
.LC33:
	ASCII(.ascii	"slice msg info:\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"D8 = 0x%x\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"D9 = 0x%x\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"D10 = 0x%x\012\000" )
.LC37:
	ASCII(.ascii	"D11 = 0x%x\012\000" )
.LC38:
	ASCII(.ascii	"D12 = 0x%x\012\000" )
.LC39:
	ASCII(.ascii	"D13 = 0x%x\012\000" )
.LC40:
	ASCII(.ascii	"D14 = 0x%x\012\000" )
.LC41:
	ASCII(.ascii	"D23 = 0x%x\012\000" )
.LC42:
	ASCII(.ascii	"D24 = 0x%x\012\000" )
.LC43:
	ASCII(.ascii	"D37 = 0x%x\012\000" )
.LC44:
	ASCII(.ascii	"D44 = 0x%x\012\000" )
.LC45:
	ASCII(.ascii	"FATAL: ApcSize > 16\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"%s: i = %d, pSlicePara = NULL!\012\000" )
.LC47:
	ASCII(.ascii	"SliceSegmentTileAddress %d < prevEndCtbInSliceTile " )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"end_ctb_in_slice_raster(%d)/end_ctb_in_slice_tile(%" )
	ASCII(.ascii	"d) > pic_max_ctb(%d)\012\000" )
	.space	3
.LC49:
	ASCII(.ascii	"SliceSegmentTileAddress %d > end_ctb_in_slice_tile " )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"%s : pTargetSlicePara == NULL\012\000" )
	.space	1
.LC51:
	ASCII(.ascii	"%s 0: set slice msg failed!\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"%s pFirstSlice = NULL!\012\000" )
.LC53:
	ASCII(.ascii	"%s pTargetSlicePara is NULL!\012\000" )
	.space	2
.LC54:
	ASCII(.ascii	"%s 1: set slice msg failed!\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"No slice to dec, add up msg report.\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	s_CabacMN, %object
	.size	s_CabacMN, 928
s_CabacMN:
	.space	928
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
