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
	.file	"scd_drv.c"
	.text
	.align	2
	.global	SCDDRV_IsSCDByPass
	.type	SCDDRV_IsSCDByPass, %function
SCDDRV_IsSCDByPass:
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
	bics	r3, r0, #16
	beq	.L7
	sub	r3, r0, #2
	cmp	r3, #2
	bls	.L6
	bic	r3, r0, #8
	cmp	r0, #18
	cmpne	r3, #6
	moveq	r3, #1
	movne	r3, #0
	beq	.L6
	cmp	r0, #1
	beq	.L9
.L3:
	subs	r0, r0, #15
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L6:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L9:
	ldr	r2, [r1]
	cmp	r2, #0
	beq	.L3
.L7:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsSCDByPass, .-SCDDRV_IsSCDByPass
	.align	2
	.global	FillEopRawStream
	.type	FillEopRawStream, %function
FillEopRawStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #140)
	sub	sp, sp, #140
	ldr	r3, .L27
	mov	r5, r1
	mov	r2, #120
	mov	r1, #0
	mov	r8, #72
	ldr	r4, [r3, r0, asl #3]
	sub	r0, fp, #164
	bl	memset
	cmp	r5, #0
	mov	r3, #1
	mov	r7, #83
	mov	r6, #80
	mov	lr, #73
	mov	ip, #67
	mov	r0, #69
	mov	r1, #78
	mvn	r9, #1
	mov	r2, #30
	strb	r8, [fp, #-160]
	strb	r2, [fp, #-161]
	mvn	r10, #69
	strb	r2, [fp, #-149]
	mov	r2, #68
	strb	r8, [fp, #-140]
	strb	r8, [fp, #-120]
	strb	r9, [fp, #-141]
	strb	r9, [fp, #-121]
	strb	r3, [fp, #-162]
	strb	r3, [fp, #-150]
	strb	r3, [fp, #-142]
	strb	r3, [fp, #-130]
	strb	r3, [fp, #-122]
	strb	r7, [fp, #-159]
	strb	r7, [fp, #-139]
	strb	r7, [fp, #-119]
	strb	r6, [fp, #-158]
	strb	r6, [fp, #-138]
	strb	r6, [fp, #-118]
	strb	lr, [fp, #-157]
	strb	lr, [fp, #-137]
	strb	lr, [fp, #-117]
	strb	ip, [fp, #-156]
	strb	ip, [fp, #-136]
	strb	ip, [fp, #-116]
	strb	r0, [fp, #-155]
	strb	r0, [fp, #-135]
	strb	r0, [fp, #-115]
	strb	r1, [fp, #-154]
	strb	r1, [fp, #-134]
	strb	r1, [fp, #-114]
	strb	r2, [fp, #-153]
	strb	r2, [fp, #-133]
	strb	r2, [fp, #-113]
	strb	r9, [fp, #-109]
	mov	r9, #96
	strb	r8, [fp, #-100]
	strb	r8, [fp, #-79]
	mvn	r8, #0
	strb	r3, [fp, #-110]
	strb	r3, [fp, #-106]
	strb	r3, [fp, #-102]
	strb	r7, [fp, #-99]
	strb	r6, [fp, #-98]
	strb	lr, [fp, #-97]
	strb	ip, [fp, #-96]
	strb	r0, [fp, #-95]
	strb	r1, [fp, #-94]
	strb	r2, [fp, #-93]
	strb	r3, [fp, #-90]
	strb	r3, [fp, #-82]
	strb	r7, [fp, #-78]
	strb	r6, [fp, #-77]
	strb	lr, [fp, #-76]
	strb	ip, [fp, #-75]
	strb	r0, [fp, #-74]
	strb	r1, [fp, #-73]
	strb	r2, [fp, #-72]
	strb	r3, [fp, #-69]
	strb	r10, [fp, #-101]
	strb	r10, [fp, #-89]
	strb	r9, [fp, #-81]
	strb	r8, [fp, #-68]
	beq	.L25
	ldr	r3, [r4, #12]
	cmp	r3, #18
	ldrls	pc, [pc, r3, asl #2]
	b	.L13
.L15:
	.word	.L14
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L21
	.word	.L13
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L16
	.word	.L18
	.word	.L13
	.word	.L21
.L16:
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #80]
	cmp	r3, r2
	movls	r0, #0
	bhi	.L26
.L23:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L21:
	sub	r1, fp, #144
	mov	r4, #15
.L17:
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #80]
	add	r0, r4, r3
	cmp	r0, r2
	bhi	.L19
	ldr	ip, .L27+4
	mov	r2, r4
	ldr	r0, [r5, #40]
	ldr	r6, [ip, #52]
	add	r0, r3, r0
	blx	r6
	ldr	r3, [r5, #8]
	mov	r0, #0
	add	r4, r3, r4
	str	r4, [r5, #8]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L14:
	sub	r1, fp, #164
	mov	r4, #15
	b	.L17
.L18:
	mov	r4, #16
	sub	r1, fp, #84
	b	.L17
.L13:
	str	r3, [sp]
	mov	r1, #138
	ldr	r3, .L27+8
	mov	r0, #0
	ldr	r2, .L27+12
	bl	dprint_normal
	mvn	r0, #6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L26:
	mov	r4, #0
.L19:
	str	r2, [sp, #8]
	mov	r1, #144
	str	r3, [sp]
	mov	r0, #0
	str	r4, [sp, #4]
	ldr	r3, .L27+8
	ldr	r2, .L27+16
	bl	dprint_normal
	mvn	r0, #6
	b	.L23
.L25:
	mov	r0, r5
	ldr	r3, .L27+8
	ldr	r2, .L27+20
	mov	r1, #99
	bl	dprint_normal
	mvn	r0, #6
	b	.L23
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC2
	.word	.LC3
	.word	.LC1
	UNWIND(.fnend)
	.size	FillEopRawStream, .-FillEopRawStream
	.align	2
	.global	FillEosRawStream
	.type	FillEosRawStream, %function
FillEosRawStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #112)
	sub	sp, sp, #112
	ldr	r3, .L51
	mov	r4, r1
	mov	r2, #100
	ldr	r1, .L51+4
	ldr	r5, [r3, r0, asl #3]
	sub	r0, fp, #120
	bl	memcpy
	cmp	r4, #0
	beq	.L49
	ldr	r3, [r5, #12]
	cmp	r3, #18
	ldrls	pc, [pc, r3, asl #2]
	b	.L32
.L34:
	.word	.L33
	.word	.L35
	.word	.L36
	.word	.L37
	.word	.L36
	.word	.L47
	.word	.L43
	.word	.L32
	.word	.L47
	.word	.L47
	.word	.L47
	.word	.L47
	.word	.L47
	.word	.L47
	.word	.L36
	.word	.L33
	.word	.L39
	.word	.L47
	.word	.L43
.L33:
	sub	r1, fp, #120
	mov	r5, #15
.L38:
	ldr	r3, [r4, #8]
	cmp	r5, r3
	bhi	.L50
	ldr	r3, .L51+8
	mov	r2, r5
	ldr	r0, [r4, #40]
	ldr	r3, [r3, #52]
	blx	r3
	str	r5, [r4, #8]
.L47:
	mov	r0, #0
.L45:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L43:
	mov	r5, #15
	sub	r1, fp, #100
	b	.L38
.L35:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	bne	.L47
	sub	r1, fp, #100
	mov	r5, #15
	b	.L38
.L36:
	mov	r5, #19
	sub	r1, fp, #80
	b	.L38
.L37:
	mov	r5, #16
	sub	r1, fp, #60
	b	.L38
.L39:
	mov	r5, #16
	sub	r1, fp, #40
	b	.L38
.L32:
	str	r3, [sp]
	mov	r1, #256
	ldr	r3, .L51+12
	mov	r0, #0
	ldr	r2, .L51+16
	bl	dprint_normal
	mvn	r0, #6
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L50:
	str	r3, [sp, #4]
	movw	r1, #263
	str	r5, [sp]
	mov	r0, #0
	ldr	r3, .L51+12
	ldr	r2, .L51+20
	bl	dprint_normal
	mvn	r0, #6
	b	.L45
.L49:
	mov	r0, r4
	ldr	r3, .L51+12
	ldr	r2, .L51+24
	mov	r1, #196
	bl	dprint_normal
	mvn	r0, #6
	b	.L45
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	.word	.LANCHOR1+20
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+120
	.word	.LC2
	.word	.LC4
	.word	.LC1
	UNWIND(.fnend)
	.size	FillEosRawStream, .-FillEosRawStream
	.align	2
	.global	FillVC1ExtraData
	.type	FillVC1ExtraData, %function
FillVC1ExtraData:
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
	ldr	r3, [r0, #28]
	mov	r6, r0
	mov	r4, r1
	cmp	r3, #1
	ldr	r0, [r1, #76]
	beq	.L63
	ands	r5, r0, #128
	bne	.L64
	add	r6, r6, #172032
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #80]
	ldr	r0, [r6, #300]
	add	r3, r2, r0
	cmp	r3, r1
	bhi	.L65
.L61:
	ldr	r7, .L68
	ldr	r1, [r4, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r7, #52]
	ldr	r2, [r6, #300]
	add	r1, r6, #304
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r2, [r6, #300]
	ldr	r3, [r4, #8]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r4, #8]
.L57:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L64:
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #80]
	cmp	r2, #244
	add	r3, r2, #12
	movle	r0, #0
	movgt	r0, #1
	cmp	r3, r1
	movls	r5, r0
	orrhi	r5, r0, #1
	cmp	r5, #0
	bne	.L66
	ldr	r7, .L68
	add	r6, r6, #172032
	ldr	r1, [r4, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, #8
	blx	r3
	ldr	r3, [r7, #52]
	add	r1, r4, #84
	mov	r2, #4
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r7, #52]
	mov	r2, #4
	add	r1, r4, #88
	add	r0, r0, r2
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r7, #48]
	mov	r1, r5
	mov	r2, #4
	add	r0, r0, #12
	blx	r3
	mov	r3, #16
	add	r0, r6, #304
	str	r3, [r4, #8]
	str	r3, [r6, #300]
	ldr	r3, [r7, #52]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #40]
	blx	r3
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L63:
	ands	r5, r0, #128
	beq	.L55
	ldr	r2, [r1, #8]
	cmp	r2, #255
	bhi	.L67
	ldr	r3, .L68
	add	r6, r6, #172032
	add	r0, r6, #304
	str	r2, [r6, #300]
	ldr	r3, [r3, #52]
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #40]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L55:
	ldrb	r0, [r1, #72]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L57
	add	r6, r6, #172032
	ldr	r2, [r1, #8]
	ldr	ip, [r1, #80]
	ldr	r0, [r6, #300]
	add	r1, r2, r0
	cmp	r1, ip
	bls	.L61
	mov	r0, r3
	str	r1, [sp]
	str	ip, [sp, #4]
	movw	r1, #299
	ldr	r3, .L68+4
	ldr	r2, .L68+8
	bl	dprint_normal
	mvn	r0, #1
	b	.L57
.L66:
	str	r1, [sp, #4]
	mov	r2, #256
	str	r3, [sp]
	movw	r1, #317
	str	r2, [sp, #8]
	mov	r0, #1
	ldr	r3, .L68+4
	ldr	r2, .L68+12
	bl	dprint_normal
	mvn	r0, #1
	b	.L57
.L65:
	str	r1, [sp, #4]
	mov	r0, #1
	str	r3, [sp]
	mov	r1, #336
	ldr	r3, .L68+4
	ldr	r2, .L68+8
	bl	dprint_normal
	mvn	r0, #1
	b	.L57
.L67:
	str	r2, [sp]
	mov	r0, r3
	mov	r2, #256
	ldr	r3, .L68+4
	str	r2, [sp, #4]
	movw	r1, #285
	ldr	r2, .L68+16
	bl	dprint_normal
	mvn	r0, #1
	b	.L57
.L69:
	.align	2
.L68:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+140
	.word	.LC6
	.word	.LC7
	.word	.LC5
	UNWIND(.fnend)
	.size	FillVC1ExtraData, .-FillVC1ExtraData
	.align	2
	.global	FillDIVX3ExtraData
	.type	FillDIVX3ExtraData, %function
FillDIVX3ExtraData:
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
	ldr	r2, [r1, #8]
	mov	r4, r1
	ldr	r1, [r1, #80]
	add	r3, r2, #8
	cmp	r3, r1
	bhi	.L73
	ldr	r5, .L74
	ldr	r1, [r4, #40]
	ldr	r3, [r5, #56]
	add	r0, r1, #8
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #4
	add	r1, r4, #84
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r5, #52]
	mov	r2, #4
	add	r1, r4, #88
	add	r0, r0, r2
	blx	r3
	ldr	r3, [r4, #8]
	mov	r0, #0
	add	r3, r3, #8
	str	r3, [r4, #8]
.L72:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L73:
	str	r1, [sp, #4]
	mov	r0, #1
	str	r3, [sp]
	mov	r1, #356
	ldr	r3, .L74+4
	ldr	r2, .L74+8
	bl	dprint_normal
	mvn	r0, #1
	b	.L72
.L75:
	.align	2
.L74:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+160
	.word	.LC8
	UNWIND(.fnend)
	.size	FillDIVX3ExtraData, .-FillDIVX3ExtraData
	.align	2
	.global	FillREAL8ExtraData
	.type	FillREAL8ExtraData, %function
FillREAL8ExtraData:
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
	ldr	r3, [r1, #76]
	mov	r6, r1
	ands	r5, r3, #128
	beq	.L77
	ldr	r3, [r1, #8]
	cmp	r3, #255
	bhi	.L81
	ldr	r2, .L83
	add	r4, r0, #172032
	add	r0, r4, #304
	str	r3, [r4, #300]
	ldr	r3, [r2, #52]
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #40]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L77:
	add	r4, r0, #172032
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #80]
	ldr	r0, [r4, #300]
	add	r3, r2, r0
	cmp	r3, r1
	bhi	.L82
	ldr	r7, .L83
	ldr	r1, [r6, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r7, #52]
	ldr	r2, [r4, #300]
	add	r1, r4, #304
	ldr	r0, [r6, #40]
	blx	r3
	ldr	r2, [r4, #300]
	ldr	r3, [r6, #8]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r6, #8]
.L79:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L82:
	str	r1, [sp, #4]
	mov	r0, #1
	str	r3, [sp]
	mov	r1, #392
	ldr	r3, .L83+4
	ldr	r2, .L83+8
	bl	dprint_normal
	mvn	r0, #1
	b	.L79
.L81:
	str	r3, [sp]
	mov	r2, #256
	ldr	r3, .L83+4
	movw	r1, #378
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L83+12
	bl	dprint_normal
	mvn	r0, #1
	b	.L79
.L84:
	.align	2
.L83:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+180
	.word	.LC9
	.word	.LC5
	UNWIND(.fnend)
	.size	FillREAL8ExtraData, .-FillREAL8ExtraData
	.align	2
	.global	FillExtraData
	.type	FillExtraData, %function
FillExtraData:
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
	mov	r3, r1
	movwhi	r1, #414
	bhi	.L95
	cmp	r3, #0
	beq	.L96
	ldr	r3, [r3, #8]
	cmp	r3, #0
	ble	.L97
	ldr	r3, .L99
	ldr	r0, [r3, r0, asl #3]
	ldr	r3, [r0, #12]
	cmp	r3, #5
	beq	.L90
	cmp	r3, #8
	beq	.L91
	cmp	r3, #1
	movne	r0, #0
	beq	.L98
.L87:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L91:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillREAL8ExtraData
.L98:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillVC1ExtraData
.L90:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillDIVX3ExtraData
.L96:
	movw	r1, #415
.L95:
	ldr	r3, .L99+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L99+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L87
.L97:
	str	r3, [sp]
	movw	r1, #419
	ldr	r3, .L99+4
	mov	r0, #1
	ldr	r2, .L99+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L87
.L100:
	.align	2
.L99:
	.word	.LANCHOR0
	.word	.LANCHOR1+200
	.word	.LC10
	.word	.LC11
	UNWIND(.fnend)
	.size	FillExtraData, .-FillExtraData
	.align	2
	.global	ReleaseRawStreamData
	.type	ReleaseRawStreamData, %function
ReleaseRawStreamData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #124)
	sub	sp, sp, #124
	ldr	r7, .L117
	mov	r6, r0
	mov	r8, r1
	ldr	r4, [r7, r0, asl #3]
	cmp	r4, #0
	beq	.L108
	bl	VCTRL_GetStreamInterface
	subs	r1, r0, #0
	beq	.L103
	ldr	r3, [r1, #8]
	cmp	r3, #0
	beq	.L103
	ldr	r5, .L117+4
	mov	r2, #12
	sub	r0, fp, #144
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r5, #52]
	mov	r1, r8
	sub	r0, fp, #132
	mov	r2, #96
	blx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L115
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r3, [r5, #24]
	mov	r1, r6
	mov	r0, #1
	blx	r3
	sub	r1, fp, #132
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	blx	r3
	ldr	r3, [r5, #28]
	mov	r1, r6
	mov	r4, r0
	mov	r0, #1
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
.L106:
	cmp	r4, #0
	ldr	r0, [r7, r6, asl #3]
	mvnne	r4, #6
	cmp	r0, #0
	movne	r0, r4
	beq	.L116
.L102:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L115:
	sub	r1, fp, #132
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	blx	r3
	mov	r4, r0
	b	.L106
.L103:
	mov	r3, r6
	ldr	r2, .L117+8
	movw	r1, #605
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #6
	b	.L102
.L108:
	mvn	r0, #6
	b	.L102
.L116:
	str	r6, [sp]
	movw	r1, #634
	ldr	r3, .L117+12
	ldr	r2, .L117+16
	bl	dprint_normal
	mvn	r0, #6
	b	.L102
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	.LANCHOR1+216
	.word	.LC13
	UNWIND(.fnend)
	.size	ReleaseRawStreamData, .-ReleaseRawStreamData
	.align	2
	.global	ReadRawStreamData
	.type	ReadRawStreamData, %function
ReadRawStreamData:
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
	ldr	r8, .L157
	mov	r5, r0
	mov	r7, r1
	ldr	r4, [r8, r0, asl #3]
	cmp	r4, #0
	beq	.L150
	bl	VCTRL_GetStreamInterface
	subs	r1, r0, #0
	beq	.L122
	ldr	r3, [r1, #4]
	cmp	r3, #0
	beq	.L122
	ldr	r9, .L157+4
	mov	r2, #12
	sub	r0, fp, #56
	ldr	r3, [r9, #52]
	blx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L151
	ldr	r6, .L157+8
	mov	r0, #0
	ldr	r3, [r6, r5, asl #2]
	cmp	r3, #0
	ldrne	r10, [r3, #116]
	moveq	r10, r3
	ldr	r3, [r9, #16]
	blx	r3
	ldr	r3, [r6, r5, asl #2]
	ldr	r2, .L157+4
	cmp	r3, #0
	beq	.L127
	ldr	r3, [r3, #116]
	cmp	r3, r10
	bne	.L152
.L127:
	ldr	r3, [fp, #-52]
	mov	r1, r7
	ldr	r0, [fp, #-56]
	blx	r3
	ldr	r3, [r9, #12]
	mov	r6, r0
	mov	r0, #0
	blx	r3
.L125:
	cmp	r6, #0
	bne	.L150
	ldr	r3, [r8, r5, asl #3]
	cmp	r3, #0
	beq	.L153
	ldrb	r8, [r7, #1]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L154
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L155
.L133:
	add	r4, r4, #49152
	ldr	r2, [r7, #8]
	mov	r0, #0
	ldr	r3, [r4, #100]
	add	r3, r3, r2
	str	r3, [r4, #100]
.L121:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L154:
	mov	r1, r7
	mov	r0, r5
	bl	FillEosRawStream
	cmp	r0, #0
	beq	.L132
	mov	r0, r6
	mov	r3, r5
	ldr	r2, .L157+12
	movw	r1, #706
	bl	dprint_normal
.L130:
	mov	r1, r7
	mov	r0, r5
	bl	ReleaseRawStreamData
	cmp	r0, #0
	beq	.L150
	ldr	r3, .L157+16
	movw	r1, #737
	ldr	r2, .L157+20
	mov	r0, #0
	bl	dprint_normal
.L150:
	mvn	r0, #6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L155:
	mov	r1, r7
	mov	r0, r5
	bl	FillExtraData
	cmp	r0, #0
	bne	.L156
	add	r3, r4, #172032
	ldr	r3, [r3, #296]
	cmp	r3, #0
	beq	.L133
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L133
	mov	r0, r5
	mov	r1, r7
	bl	FillEopRawStream
	b	.L133
.L151:
	ldr	r3, [fp, #-52]
	mov	r1, r7
	ldr	r0, [fp, #-56]
	blx	r3
	mov	r6, r0
	b	.L125
.L153:
	str	r5, [sp]
	mov	r0, r6
	ldr	r3, .L157+16
	movw	r1, #698
	ldr	r2, .L157+24
	bl	dprint_normal
	b	.L130
.L132:
	mov	r1, r8
	mov	r0, r5
	bl	VCTRL_SetLastFrameState
	b	.L133
.L156:
	mov	r0, r6
	mov	r3, r5
	ldr	r2, .L157+28
	movw	r1, #718
	bl	dprint_normal
	b	.L130
.L152:
	ldr	r3, [r2, #12]
	mov	r0, #0
	blx	r3
	mvn	r0, #6
	b	.L121
.L122:
	mov	r3, r5
	ldr	r2, .L157+32
	movw	r1, #658
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #6
	b	.L121
.L158:
	.align	2
.L157:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LC15
	.word	.LANCHOR1+240
	.word	.LC17
	.word	.LC13
	.word	.LC16
	.word	.LC14
	UNWIND(.fnend)
	.size	ReadRawStreamData, .-ReadRawStreamData
	.align	2
	.global	SCDDRV_SaveStreamSeg
	.type	SCDDRV_SaveStreamSeg, %function
SCDDRV_SaveStreamSeg:
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
	ldr	r5, .L167
	mov	r6, r0
	mov	r4, r1
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrsb	r3, [r1, #5]
	cmp	r3, #2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r7, .L167+4
	mov	r0, #0
	ldr	r3, [r7, #16]
	blx	r3
	ldr	r3, [r7, #44]
	ldr	r2, [r5, r6, asl #2]
	ldr	r1, [r4, #16]
	ldr	r0, [r4]
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L168:
	.align	2
.L167:
	.word	g_SaveSegFileHandler
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SaveStreamSeg, .-SCDDRV_SaveStreamSeg
	.align	2
	.global	SCDDRV_SaveRawStream
	.type	SCDDRV_SaveRawStream, %function
SCDDRV_SaveRawStream:
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
	ldr	r7, .L186
	mov	r8, r0
	mov	r4, r1
	mov	r6, r2
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L169
	ldr	r5, .L186+4
	mov	r0, #0
	ldr	r9, [r1, #12]
	ldr	r3, [r5, #16]
	blx	r3
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r4, r4, #172032
	beq	.L184
.L171:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	ip, [r6, #8]
	ldr	r3, [r4, #292]
	mov	r1, #796
	ldr	r2, .L186+8
	mov	r0, #0
	str	ip, [sp]
	bl	dprint_normal
.L169:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L184:
	add	r1, r4, #28
	mov	r0, r9
	bl	SCDDRV_IsSCDByPass
	cmp	r0, #0
	beq	.L183
	cmp	r9, #17
	bne	.L173
	add	r4, r4, #172032
	ldr	r3, [r4, #292]
	cmp	r3, #1
	beq	.L185
.L174:
	ldr	r3, [r5, #44]
	mov	r1, #12
	ldr	r2, [r7, r8, asl #2]
	add	r0, r6, #8
	blx	r3
	b	.L172
.L173:
	ldr	r3, [r5, #44]
	mov	r1, #4
	ldr	r2, [r7, r8, asl #2]
	add	r0, r6, #8
	blx	r3
.L183:
	add	r4, r4, #172032
.L172:
	ldr	r2, [r7, r8, asl #2]
	ldr	r3, [r5, #44]
	ldr	r1, [r6, #8]
	ldr	r0, [r6, #40]
	blx	r3
	b	.L171
.L185:
	ldr	r3, [r5, #44]
	mov	r1, #32
	ldr	r2, [r7, r8, asl #2]
	ldr	r0, .L186+12
	blx	r3
	b	.L174
.L187:
	.align	2
.L186:
	.word	g_SaveRawFileHandler
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC19
	.word	.LC18
	UNWIND(.fnend)
	.size	SCDDRV_SaveRawStream, .-SCDDRV_SaveRawStream
	.align	2
	.global	GetInstIDByRawArray
	.type	GetInstIDByRawArray, %function
GetInstIDByRawArray:
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
	ldr	ip, .L197
	mov	r3, #0
.L191:
	ldr	r2, [ip, r3, asl #3]
	cmp	r2, #0
	add	r1, r2, #80
	beq	.L189
	cmp	r0, r1
	beq	.L192
.L189:
	add	r3, r3, #1
	cmp	r3, #4
	bne	.L191
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L192:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L198:
	.align	2
.L197:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	GetInstIDByRawArray, .-GetInstIDByRawArray
	.align	2
	.global	SCDDRV_IsScdIdle
	.type	SCDDRV_IsScdIdle, %function
SCDDRV_IsScdIdle:
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
	bne	.L202
	ldr	r3, .L203
	ldr	r0, [r3, #76]
	clz	r0, r0
	mov	r0, r0, lsr #5
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L202:
	movw	r1, #822
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #0
	ldr	r3, .L203+4
	ldr	r2, .L203+8
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L204:
	.align	2
.L203:
	.word	.LANCHOR0
	.word	.LANCHOR1+260
	.word	.LC20
	UNWIND(.fnend)
	.size	SCDDRV_IsScdIdle, .-SCDDRV_IsScdIdle
	.align	2
	.global	SCDDRV_SetStateIdle
	.type	SCDDRV_SetStateIdle, %function
SCDDRV_SetStateIdle:
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
	bne	.L209
	ldr	r1, .L210
	mov	r0, #1
	ldr	r2, .L210+4
	str	r3, [r1, #76]
	ldr	r3, [r2, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L209:
	movw	r1, #833
	ldr	r3, .L210+8
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L210+12
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L211:
	.align	2
.L210:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+280
	.word	.LC21
	UNWIND(.fnend)
	.size	SCDDRV_SetStateIdle, .-SCDDRV_SetStateIdle
	.align	2
	.global	SCDDRV_SetStateWork
	.type	SCDDRV_SetStateWork, %function
SCDDRV_SetStateWork:
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
	bne	.L215
	ldr	r3, .L216
	mov	r2, #1
	str	r2, [r3, #76]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L215:
	movw	r1, #841
	ldr	r3, .L216+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L216+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L217:
	.align	2
.L216:
	.word	.LANCHOR0
	.word	.LANCHOR1+300
	.word	.LC21
	UNWIND(.fnend)
	.size	SCDDRV_SetStateWork, .-SCDDRV_SetStateWork
	.align	2
	.global	ResetSCD
	.type	ResetSCD, %function
ResetSCD:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	subs	r4, r0, #0
	mov	r3, #0
	str	r3, [fp, #-40]
	bne	.L228
	ldr	r6, .L231
	mov	r1, #3
	ldr	r5, .L231+4
	ldr	r0, [r6, #88]
	add	r0, r0, #2176
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	ldr	r2, [r5]
	add	r2, r2, #61440
	ldr	r1, [r2, #2052]
	ands	r3, r1, #3
	str	r1, [fp, #-40]
	mov	r7, r0
	beq	.L229
	ldr	r1, [r2, #2060]
	ldr	r8, .L231+8
	uxtb	r3, r1
	str	r1, [fp, #-40]
	orr	r3, r3, #4
	strb	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #2060]
	b	.L223
.L230:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L224
.L223:
	ldr	r3, [r8, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	add	r3, r3, #61440
	ldr	r2, [r3, #2064]
	tst	r2, #4
	beq	.L230
	cmp	r4, #1000
	bcs	.L224
.L225:
	ldr	r2, [r3, #2060]
	and	r1, r7, #1
	ldr	r0, [r6, #88]
	str	r2, [fp, #-40]
	bfc	r2, #2, #1
	strb	r2, [fp, #-40]
	add	r0, r0, #2064
	ldr	r2, [fp, #-40]
	add	r0, r0, #12
	str	r2, [r3, #2060]
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	mov	r1, #2
	add	r0, r0, #2176
	bl	MEM_WritePhyWord
	mov	r0, #1
.L227:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L224:
	mov	r3, #0
	ldr	r2, .L231+12
	mov	r0, r3
	mov	r1, #884
	bl	dprint_normal
	ldr	r3, [r5]
	add	r3, r3, #61440
	b	.L225
.L229:
	ldr	r2, .L231+16
	movw	r1, #861
	mov	r0, #21
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L228:
	mov	r1, #852
	ldr	r3, .L231+20
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L231+24
	bl	dprint_normal
	mvn	r0, #1
	b	.L227
.L232:
	.align	2
.L231:
	.word	.LANCHOR0
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC23
	.word	.LC22
	.word	.LANCHOR1+320
	.word	.LC10
	UNWIND(.fnend)
	.size	ResetSCD, .-ResetSCD
	.align	2
	.global	SCDDRV_ResetSCD
	.type	SCDDRV_ResetSCD, %function
SCDDRV_ResetSCD:
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
	ldr	r4, .L235
	ldr	r3, [r4, #72]
	cmp	r3, r0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	mov	r0, #0
	bl	ResetSCD
	ldr	r3, .L235+4
	mov	r2, #0
	mov	r0, #1
	str	r2, [r4, #76]
	ldr	r3, [r3, #128]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L236:
	.align	2
.L235:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_ResetSCD, .-SCDDRV_ResetSCD
	.align	2
	.global	SCDDRV_IsRawArrayFull
	.type	SCDDRV_IsRawArrayFull, %function
SCDDRV_IsRawArrayFull:
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
	add	r0, r0, #49152
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #8]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #23
	add	r3, r3, r2
	ubfx	r3, r3, #0, #9
	rsb	r3, r2, r3
	rsb	r0, r0, r3
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsRawArrayFull, .-SCDDRV_IsRawArrayFull
	.align	2
	.global	SCDDRV_InsertRawPacket
	.type	SCDDRV_InsertRawPacket, %function
SCDDRV_InsertRawPacket:
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
	ldr	r2, [r1, #4]
	ldr	r3, .L245
	cmp	r2, #0
	ldr	r2, [r3, r0, asl #3]
	movweq	r1, #934
	beq	.L243
	cmp	r2, #0
	beq	.L244
	add	r4, r2, #49152
	ldr	r0, [r4, #84]
	ldr	lr, [r4, #88]
	add	r3, r0, #1
	mov	ip, r3, asr #31
	mov	ip, ip, lsr #23
	add	r3, r3, ip
	ubfx	r3, r3, #0, #9
	rsb	r3, ip, r3
	cmp	r3, lr
	beq	.L242
	ldr	ip, .L245+4
	mov	r3, r0, asl #7
	add	r2, r2, #80
	sub	r0, r3, r0, asl #5
	add	r0, r2, r0
	mov	r2, #96
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #84]
	mov	r0, #0
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #23
	add	r3, r3, r2
	ubfx	r3, r3, #0, #9
	rsb	r3, r2, r3
	str	r3, [r4, #84]
.L240:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L242:
	mvn	r0, #3
	b	.L240
.L244:
	movw	r1, #935
.L243:
	ldr	r3, .L245+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L245+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L240
.L246:
	.align	2
.L245:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+332
	.word	.LC10
	UNWIND(.fnend)
	.size	SCDDRV_InsertRawPacket, .-SCDDRV_InsertRawPacket
	.align	2
	.global	GetRawState
	.type	GetRawState, %function
GetRawState:
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
	movhi	r1, #956
	bhi	.L252
	ldr	r3, .L254
	ldr	r3, [r3, r0, asl #3]
	cmp	r3, #0
	beq	.L253
	add	r2, r3, #49152
	ldr	r3, [r2, #84]
	ldr	r1, [r2, #88]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #23
	add	r3, r3, r2
	ubfx	r3, r3, #0, #9
	rsb	r3, r2, r3
	cmp	r3, r1
	mvneq	r0, #3
	movne	r0, #0
.L249:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L253:
	movw	r1, #957
.L252:
	ldr	r3, .L254+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L254+8
	bl	dprint_normal
	mvn	r0, #3
	b	.L249
.L255:
	.align	2
.L254:
	.word	.LANCHOR0
	.word	.LANCHOR1+356
	.word	.LC10
	UNWIND(.fnend)
	.size	GetRawState, .-GetRawState
	.align	2
	.global	ShowRawPacket
	.type	ShowRawPacket, %function
ShowRawPacket:
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
	add	r4, r0, #49152
	mov	ip, r0
	ldr	r3, [r4, #16]
	cmp	r3, #512
	bcs	.L259
	ldr	r2, [r4, #4]
	cmp	r3, r2
	beq	.L259
	ldr	lr, .L260
	mov	r2, r3, asl #7
	sub	r3, r2, r3, asl #5
	mov	r0, r1
	mov	r2, #96
	add	r1, ip, r3
	ldr	r3, [lr, #52]
	blx	r3
	ldr	r3, [r4, #16]
	mov	r0, #0
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #23
	add	r3, r3, r2
	ubfx	r3, r3, #0, #9
	rsb	r3, r2, r3
	str	r3, [r4, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L259:
	mvn	r0, #2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L261:
	.align	2
.L260:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ShowRawPacket, .-ShowRawPacket
	.align	2
	.global	GetFirstOffset
	.type	GetFirstOffset, %function
GetFirstOffset:
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
	cmpne	r0, #0
	moveq	r2, #1
	movne	r2, #0
	beq	.L266
	add	r3, r0, #49152
	ldr	r0, [r3, #4]
	ldr	ip, [r3]
	cmp	ip, r0
	ldrne	r3, [r3, #12]
	movne	r0, r2
	mvneq	r0, #2
	strne	r3, [r1]
.L264:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L266:
	movw	r1, #989
	ldr	r3, .L267
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L267+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L264
.L268:
	.align	2
.L267:
	.word	.LANCHOR1+368
	.word	.LC10
	UNWIND(.fnend)
	.size	GetFirstOffset, .-GetFirstOffset
	.align	2
	.global	GetFirstRawPacket
	.type	GetFirstRawPacket, %function
GetFirstRawPacket:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	sub	r3, fp, #20
	mov	r4, r1
	mov	r2, #0
	str	r2, [r3, #-4]!
	mov	r1, r3
	mov	r5, r0
	bl	GetFirstOffset
	add	r3, r5, #49152
	mov	r1, r4
	mov	r0, r5
	ldr	r2, [r3]
	str	r2, [r3, #16]
	bl	ShowRawPacket
	ldr	r2, [fp, #-24]
	ldrd	r0, [r4, #40]
	ldr	ip, [r4, #4]
	ldr	r3, [r4, #8]
	adds	r0, r0, r2
	add	ip, ip, r2
	adc	r1, r1, r2, asr #31
	rsb	r3, r2, r3
	str	ip, [r4, #4]
	strd	r0, [r4, #40]
	str	r3, [r4, #8]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetFirstRawPacket, .-GetFirstRawPacket
	.align	2
	.global	SetFirstOffset
	.type	SetFirstOffset, %function
SetFirstOffset:
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
	beq	.L275
	add	r3, r0, #49152
	ldmia	r3, {r2, ip}
	cmp	r2, ip
	beq	.L273
	mov	ip, r2, asl #7
	ldr	lr, [r3, #12]
	sub	r2, ip, r2, asl #5
	add	r0, r0, r2
	add	r1, r1, lr
	ldr	r2, [r0, #8]
	cmp	r1, r2
	bge	.L274
	mov	r0, #0
	str	r1, [r3, #12]
.L272:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L274:
	mvn	r0, #0
	b	.L272
.L273:
	mvn	r0, #2
	b	.L272
.L275:
	movw	r1, #1019
	ldr	r3, .L276
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L276+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L272
.L277:
	.align	2
.L276:
	.word	.LANCHOR1+384
	.word	.LC10
	UNWIND(.fnend)
	.size	SetFirstOffset, .-SetFirstOffset
	.align	2
	.global	DeleteRawPacket
	.type	DeleteRawPacket, %function
DeleteRawPacket:
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
	subs	r8, r0, #0
	mov	r10, r1
	beq	.L302
	cmp	r1, #0
	beq	.L292
	ldr	r9, .L305
	mov	r7, #0
.L284:
	ldr	r3, [r9, r7, asl #3]
	cmp	r3, #0
	add	r2, r3, #80
	beq	.L281
	cmp	r8, r2
	beq	.L303
.L281:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L284
.L282:
	mov	r3, #1056
	ldr	r2, .L305+4
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L298
.L303:
	cmp	r7, #3
	bhi	.L282
	add	r3, r8, #49152
	str	r3, [fp, #-48]
	ldr	r5, [r3]
	ldr	r3, [r3, #4]
	cmp	r5, r3
	addgt	r3, r3, #512
	rsb	r3, r5, r3
	cmp	r10, r3
	movls	r6, #0
	bhi	.L304
.L287:
	mov	r4, r5, asl #7
	ldr	r3, .L305+8
	sub	r4, r4, r5, asl #5
	ldr	r2, .L305+12
	add	r4, r8, r4
	movw	r1, #1074
	mov	r0, #21
	add	r6, r6, #1
	ldr	ip, [r4, #8]
	add	r5, r5, #1
	ubfx	r5, r5, #0, #9
	str	ip, [sp, #4]
	ldr	ip, [r4, #4]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, [r9, r7, asl #3]
	ldr	r1, [r4, #8]
	cmp	r6, r10
	add	r2, r2, #49152
	ldr	r3, [r2, #100]
	rsb	r3, r1, r3
	bic	r3, r3, r3, asr #31
	str	r3, [r2, #100]
	bne	.L287
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	add	r6, r6, r3
	cmp	r6, #512
	blt	.L288
	ldr	r3, [fp, #-48]
	sub	r6, r6, #512
	str	r6, [r3]
.L289:
	ldr	r3, [fp, #-48]
	mov	r0, #0
	str	r0, [r3, #12]
.L298:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L288:
	ldr	r3, [fp, #-48]
	str	r6, [r3]
	b	.L289
.L292:
	mvn	r0, #0
	b	.L298
.L304:
	str	r10, [sp]
	movw	r1, #1066
	ldr	r2, .L305+16
	mov	r0, #21
	bl	dprint_normal
	mvn	r0, #0
	b	.L298
.L302:
	movw	r1, #1045
	ldr	r3, .L305+8
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L305+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L298
.L306:
	.align	2
.L305:
	.word	.LANCHOR0
	.word	.LC24
	.word	.LANCHOR1+400
	.word	.LC26
	.word	.LC25
	.word	.LC10
	UNWIND(.fnend)
	.size	DeleteRawPacket, .-DeleteRawPacket
	.align	2
	.global	DeleteRawPacketInBuffer
	.type	DeleteRawPacketInBuffer, %function
DeleteRawPacketInBuffer:
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
	cmp	r0, #3
	mov	r7, r0
	movwhi	r1, #1103
	bhi	.L323
	ldr	r10, .L329
	ldr	r8, [r10, r0, asl #3]
	cmp	r8, #0
	beq	.L324
	cmp	r1, #0
	beq	.L325
.L310:
	adds	r3, r8, #80
	str	r3, [fp, #-48]
	beq	.L326
	add	r3, r8, #49152
	str	r3, [fp, #-52]
	ldr	r9, [r3, #80]
	ldr	r4, [r3, #88]
	cmp	r9, r4
	addlt	r9, r9, #512
	rsb	r9, r4, r9
	cmp	r9, #0
	beq	.L324
	mov	r6, #0
	b	.L315
.L328:
	cmp	r6, r9
	beq	.L327
.L315:
	mov	r5, r4, asl #7
	ldr	r3, .L329+4
	sub	r5, r5, r4, asl #5
	ldr	r2, .L329+8
	add	ip, r8, r5
	movw	r1, #1134
	mov	r0, #21
	add	r4, r4, #1
	ldr	lr, [ip, #88]
	add	r6, r6, #1
	ubfx	r4, r4, #0, #9
	str	lr, [sp, #4]
	ldr	ip, [ip, #84]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	mov	r0, r7
	add	r1, r3, r5
	bl	ReleaseRawStreamData
	ldr	r3, [r10, r7, asl #3]
	cmp	r3, #0
	bne	.L328
	mvn	r0, #6
.L309:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L325:
	add	r3, r8, #172032
	ldr	r3, [r3, #228]
	cmp	r3, #0
	bne	.L310
.L324:
	mvn	r0, #0
	b	.L309
.L327:
	ldr	r3, [fp, #-52]
	ldr	r4, [r3, #88]
	add	r4, r4, r6
	cmp	r4, #512
	strlt	r4, [r3, #88]
	subge	r4, r4, #512
	ldrge	r3, [fp, #-52]
	movlt	r0, #0
	movge	r0, #0
	strge	r4, [r3, #88]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L326:
	movw	r1, #1118
.L323:
	ldr	r3, .L329+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L329+12
	bl	dprint_normal
	b	.L324
.L330:
	.align	2
.L329:
	.word	.LANCHOR0
	.word	.LANCHOR1+416
	.word	.LC26
	.word	.LC10
	UNWIND(.fnend)
	.size	DeleteRawPacketInBuffer, .-DeleteRawPacketInBuffer
	.align	2
	.global	DeleteLastSendRaw
	.type	DeleteLastSendRaw, %function
DeleteLastSendRaw:
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
	bhi	.L335
	ldr	r3, .L337
	ldr	r0, [r3, r0, asl #3]
	cmp	r0, #0
	beq	.L336
	add	r4, r0, #172032
	ldr	r1, [r4, #160]
	cmp	r1, #0
	ble	.L331
	add	r0, r0, #80
	bl	DeleteRawPacket
	mov	r3, #0
	str	r3, [r4, #160]
.L331:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L335:
	movw	r1, #1241
	ldr	r3, .L337+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L337+8
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L336:
	movw	r3, #1247
	ldr	r2, .L337+12
	mov	r1, r3
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_normal
.L338:
	.align	2
.L337:
	.word	.LANCHOR0
	.word	.LANCHOR1+440
	.word	.LC21
	.word	.LC27
	UNWIND(.fnend)
	.size	DeleteLastSendRaw, .-DeleteLastSendRaw
	.align	2
	.global	GetRawStreamSize
	.type	GetRawStreamSize, %function
GetRawStreamSize:
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
	movweq	r1, #1262
	beq	.L344
	cmp	r1, #0
	movweq	r1, #1263
	beq	.L344
	add	r0, r0, #49152
	ldr	r3, [r0, #20]
	str	r3, [r1]
	ldr	r2, [r0, #12]
	rsb	r3, r2, r3
	str	r3, [r1]
	cmp	r3, #0
	movge	r0, #0
	blt	.L345
.L341:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L345:
	movw	r1, #1267
.L344:
	ldr	r3, .L346
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L346+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L341
.L347:
	.align	2
.L346:
	.word	.LANCHOR1+460
	.word	.LC10
	UNWIND(.fnend)
	.size	GetRawStreamSize, .-GetRawStreamSize
	.align	2
	.global	GetRawStreamNum
	.type	GetRawStreamNum, %function
GetRawStreamNum:
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
	movweq	r1, #1274
	beq	.L353
	cmp	r1, #0
	beq	.L354
	add	r0, r0, #49152
	ldmia	r0, {r2, r3}
	subs	r3, r3, r2
	strpl	r3, [r1]
	addmi	r3, r3, #512
	strmi	r3, [r1]
	movpl	r0, #0
	movmi	r0, #0
.L350:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L354:
	movw	r1, #1275
.L353:
	ldr	r3, .L355
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L355+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L350
.L356:
	.align	2
.L355:
	.word	.LANCHOR1+480
	.word	.LC10
	UNWIND(.fnend)
	.size	GetRawStreamNum, .-GetRawStreamNum
	.align	2
	.global	GetRawNumOffset
	.type	GetRawNumOffset, %function
GetRawNumOffset:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	clz	ip, r0
	mov	r9, r2
	mov	r5, r1
	mov	ip, ip, lsr #5
	mov	r10, r3
	orrs	r2, ip, r1, lsr #31
	mov	r3, #0
	ldr	r8, [fp, #4]
	mov	r6, r0
	str	r3, [fp, #-48]
	movwne	r1, #1163
	bne	.L367
	cmp	r8, #0
	cmpne	r10, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r9, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L368
	add	r7, r0, #49152
	sub	r1, fp, #48
	ldr	r2, [r7]
	ldr	ip, [r7, #12]
	mov	r3, r2, asl #7
	sub	r3, r3, r2, asl #5
	add	r3, r0, r3
	ldr	r4, [r3, #8]
	rsb	r4, ip, r4
	bl	GetRawStreamNum
	ldr	lr, [r7]
	ldr	ip, [fp, #-48]
	add	ip, lr, ip
	mov	r1, lr
	cmp	ip, lr
	movhi	r3, #0
	movls	r3, #1
	cmp	r5, r4
	orrlt	r3, r3, #1
	cmp	r3, #0
	bne	.L361
	mov	r3, lr
.L362:
	add	r3, r3, #1
	cmp	ip, r3
	mov	r1, r3, asr #31
	movhi	r2, #0
	movls	r2, #1
	mov	r0, r1, lsr #23
	add	r1, r3, r0
	ubfx	r1, r1, #0, #9
	rsb	r1, r0, r1
	mov	r0, r1, asl #7
	sub	r0, r0, r1, asl #5
	add	r0, r6, r0
	ldr	r0, [r0, #8]
	add	r4, r4, r0
	cmp	r5, r4
	orrlt	r2, r2, #1
	cmp	r2, #0
	beq	.L362
	cmp	lr, r3
	rsbne	r4, r0, r4
	rsbne	r4, r4, r5
	strne	r4, [r10]
	beq	.L361
.L364:
	str	r1, [r8]
	mov	r0, #0
	ldr	r2, [r7]
	rsb	r3, r2, r3
	str	r3, [r9]
.L359:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L361:
	str	r5, [r10]
	mov	r3, lr
	b	.L364
.L368:
	movw	r1, #1164
.L367:
	ldr	r3, .L369
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L369+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L359
.L370:
	.align	2
.L369:
	.word	.LANCHOR1+496
	.word	.LC10
	UNWIND(.fnend)
	.size	GetRawNumOffset, .-GetRawNumOffset
	.align	2
	.global	DeleteRawLen
	.type	DeleteRawLen, %function
DeleteRawLen:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
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
	mov	r3, r1, lsr #31
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	r5, r1
	cmp	r3, #0
	mov	r4, r0
	bne	.L376
	sub	r1, fp, #44
	str	r3, [fp, #-40]
	str	r3, [fp, #-36]
	bl	GetRawStreamSize
	cmp	r0, #0
	bne	.L373
	ldr	r3, [fp, #-44]
	cmp	r5, r3
	bgt	.L375
	mov	r1, r5
	sub	r2, fp, #32
	sub	r3, fp, #36
	str	r2, [sp]
	mov	r0, r4
	sub	r2, fp, #40
	bl	GetRawNumOffset
	add	r2, r4, #49152
	ldr	r5, [fp, #-40]
	movw	r3, #1229
	ldr	lr, [r2]
	mov	r1, r3
	ldr	r6, [fp, #-36]
	mov	r0, #21
	add	lr, r5, lr
	ldr	r2, .L377
	mov	ip, lr, asr #31
	mov	ip, ip, lsr #23
	add	lr, lr, ip
	ubfx	lr, lr, #0, #9
	rsb	ip, ip, lr
	str	ip, [fp, #-32]
	mov	lr, ip, asl #7
	sub	ip, lr, ip, asl #5
	add	ip, r4, ip
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	str	lr, [sp, #16]
	ldr	ip, [ip, #8]
	str	r5, [sp, #8]
	str	r5, [sp]
	str	ip, [sp, #12]
	str	r6, [sp, #4]
	bl	dprint_normal
	ldr	r1, [fp, #-40]
	mov	r0, r4
	bl	DeleteRawPacket
	mov	r0, r4
	ldr	r1, [fp, #-36]
	bl	SetFirstOffset
.L373:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L375:
	mvn	r0, #0
	b	.L373
.L376:
	movw	r1, #1208
	ldr	r3, .L377+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L377+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L373
.L378:
	.align	2
.L377:
	.word	.LC28
	.word	.LANCHOR1+512
	.word	.LC10
	UNWIND(.fnend)
	.size	DeleteRawLen, .-DeleteRawLen
	.align	2
	.global	ConfigStreamSegArray
	.type	ConfigStreamSegArray, %function
ConfigStreamSegArray:
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
	subs	r8, r0, #0
	mov	r4, r1
	mov	r6, r2
	mov	r7, r3
	movweq	r1, #1289
	beq	.L384
	cmp	r2, #0
	cmpne	r4, #0
	moveq	r5, #1
	movne	r5, #0
	beq	.L385
	cmp	r3, #262144
	movwcc	r1, #1291
	bcc	.L384
	ldr	r3, .L386
	movw	r2, #57400
	movt	r2, 1
	mov	r1, r5
	ldr	r3, [r3, #48]
	blx	r3
	add	r2, r8, #122880
	mov	r0, r5
	str	r4, [r2, #24]
	str	r6, [r8]
	str	r4, [r2, #32]
	str	r4, [r2, #36]
	str	r7, [r2, #28]
.L381:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L385:
	movw	r1, #1290
.L384:
	ldr	r3, .L386+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L386+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L381
.L387:
	.align	2
.L386:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+528
	.word	.LC10
	UNWIND(.fnend)
	.size	ConfigStreamSegArray, .-ConfigStreamSegArray
	.align	2
	.global	ResetStreamSegArray
	.type	ResetStreamSegArray, %function
ResetStreamSegArray:
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
	subs	r4, r0, #0
	beq	.L391
	ldr	r3, .L392
	mov	r2, #122880
	mov	r1, #0
	add	r0, r4, #8
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r4, #122880
	mov	r3, #0
	ldr	r2, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r2, [r0, #32]
	str	r2, [r0, #36]
	str	r3, [r0, #16]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L391:
	movw	r1, #1306
	ldr	r3, .L392+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L392+8
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L393:
	.align	2
.L392:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+552
	.word	.LC21
	UNWIND(.fnend)
	.size	ResetStreamSegArray, .-ResetStreamSegArray
	.align	2
	.global	GetSegBufFreeSize
	.type	GetSegBufFreeSize, %function
GetSegBufFreeSize:
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
	add	r0, r0, #122880
	ldr	r2, [r0, #36]
	ldr	r3, [r0, #32]
	cmp	r2, r3
	bhi	.L399
	ldrcs	r0, [r0, #28]
	subcc	r3, r3, #1
	rsbcc	r0, r2, r3
	subcs	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L399:
	ldr	r0, [r0, #28]
	sub	r3, r3, #1
	add	r3, r3, r0
	rsb	r0, r2, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegBufFreeSize, .-GetSegBufFreeSize
	.align	2
	.global	CheckData
	.type	CheckData, %function
CheckData:
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
	beq	.L409
	and	r3, r1, #31
	sub	r2, r3, #30
	sub	ip, r3, #1
	cmp	r3, #19
	cmpne	r2, #1
	sub	r2, r1, #1
	movls	r3, #1
	movhi	r3, #0
	cmp	ip, #12
	orrls	r3, r3, #1
	uxtb	r2, r2
	cmp	r3, #0
	ldrne	r3, [r0, #60]
	addne	r3, r3, #1
	strne	r3, [r0, #60]
	add	r3, r1, #79
	uxtb	r3, r3
	cmp	r3, #4
	movhi	r3, #0
	movls	r3, #1
	cmp	r2, #183
	orrhi	r3, r3, #1
	cmp	r3, #0
	beq	.L410
.L404:
	ldr	r3, [r0, #64]
	add	r3, r3, #1
	str	r3, [r0, #64]
.L400:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L410:
	add	r1, r1, #73
	uxtb	r1, r1
	cmp	r1, #3
	bls	.L404
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L409:
	movw	r1, #1341
	ldr	r3, .L411
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L411+4
	bl	dprint_normal
	b	.L400
.L412:
	.align	2
.L411:
	.word	.LANCHOR1+572
	.word	.LC21
	UNWIND(.fnend)
	.size	CheckData, .-CheckData
	.align	2
	.global	CheckStartCodeCnt
	.type	CheckStartCodeCnt, %function
CheckStartCodeCnt:
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
	beq	.L425
	ldr	r3, [r0, #68]
	cmp	r3, #2
	ble	.L413
	tst	r1, #31
	beq	.L413
	ldr	r3, [r0, #80]
	ldr	r2, [r0, #76]
	rsb	r1, r2, r3
	cmp	r1, #1
	beq	.L426
.L416:
	cmp	r3, r2
	beq	.L427
.L413:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L427:
	ldr	r2, [r0, #72]
	cmp	r3, r2
	bne	.L413
.L417:
	cmp	r3, #1
	cmpne	r3, #20
	beq	.L413
	ldr	r3, [r0, #60]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, #60]
	ldr	r3, [r0, #64]
	add	r3, r3, #1
	str	r3, [r0, #64]
	b	.L413
.L426:
	ldr	r1, [r0, #72]
	rsb	r1, r1, r2
	cmp	r1, #1
	bne	.L416
	b	.L417
.L425:
	movw	r1, #1370
	ldr	r3, .L428
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L428+4
	bl	dprint_normal
	b	.L413
.L429:
	.align	2
.L428:
	.word	.LANCHOR1+584
	.word	.LC21
	UNWIND(.fnend)
	.size	CheckStartCodeCnt, .-CheckStartCodeCnt
	.align	2
	.global	CheckStream
	.type	CheckStream, %function
CheckStream:
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
	cmp	r0, #0
	mov	r5, r1
	movweq	r1, #1394
	beq	.L451
	cmp	r5, #3
	bhi	.L452
	ldr	r3, .L454
	ldr	r4, [r3, r5, asl #2]
	cmp	r4, #0
	beq	.L430
	ldr	r3, [r4, #128]
	cmp	r3, #0
	cmpne	r3, #3
	bne	.L430
	ldr	r3, [r4, #68]
	cmp	r3, #199
	bgt	.L430
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #0
	movne	r6, r2
	bne	.L436
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L450
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	cmp	r2, #1
	ldreqb	r6, [r0, #3]	@ zero_extendqisi2
	andeq	r2, r6, #31
	beq	.L436
	mov	r2, r1
.L450:
	mov	r6, r2
.L436:
	ldr	lr, [r4, #76]
	add	r3, r3, #1
	ldr	ip, [r4, #80]
	mov	r1, r6
	str	r3, [r4, #68]
	mov	r0, r4
	str	lr, [r4, #72]
	str	ip, [r4, #76]
	str	r2, [r4, #80]
	bl	CheckData
	mov	r1, r6
	mov	r0, r4
	bl	CheckStartCodeCnt
	ldr	r3, [r4, #68]
	cmp	r3, #199
	ble	.L430
	ldr	r2, [r4, #60]
	ldr	r3, [r4, #64]
	rsb	r1, r3, r2
	cmp	r1, #49
	ble	.L437
	ldr	r1, [r4, #128]
	cmp	r1, #3
	beq	.L453
.L437:
	rsb	r3, r2, r3
	cmp	r3, #49
	ble	.L430
	ldr	r3, [r4, #128]
	cmp	r3, #0
	bne	.L430
	ldr	r2, .L454+4
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L430
	mov	r0, r5
	mov	r2, r3
	mov	r1, #49
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	bx	ip
.L452:
	movw	r1, #1395
.L451:
	ldr	r3, .L454+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L454+12
	bl	dprint_normal
.L430:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L453:
	ldr	r3, .L454+4
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L430
	mov	r3, #0
	mov	r1, #49
	mov	r2, r3
	mov	r0, r5
	blx	r6
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #60]
	b	.L437
.L455:
	.align	2
.L454:
	.word	s_pstVfmwChan
	.word	g_EventReportFunc
	.word	.LANCHOR1+604
	.word	.LC21
	UNWIND(.fnend)
	.size	CheckStream, .-CheckStream
	.align	2
	.global	InsertStreamSeg
	.type	InsertStreamSeg, %function
InsertStreamSeg:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r7, r1
	beq	.L464
	add	r4, r0, #122880
	movw	r6, #43691
	movt	r6, 10922
	ldr	r3, [r4, #12]
	ldr	ip, [r4, #8]
	add	r3, r3, #1
	smull	r0, r1, r3, r6
	mov	r0, r3, asr #31
	rsb	r1, r0, r1, asr #8
	mov	r0, r1, asl #11
	sub	r1, r0, r1, asl #9
	rsb	r3, r1, r3
	cmp	r3, ip
	mvneq	r0, #3
	beq	.L458
	mov	r1, r2
	ldr	r0, [r7]
	bl	CheckStream
	ldr	r3, [r4, #12]
	ldr	r0, .L465
	mov	r2, #80
	mov	r1, r7
	mov	r8, r3, asl #6
	add	r8, r8, r3, lsl #4
	ldr	r3, [r0, #52]
	add	r0, r8, #8
	add	r8, r5, r8
	add	r0, r5, r0
	blx	r3
	ldr	r0, [r4, #12]
	mov	lr, #1
	add	r1, r0, lr
	mov	ip, r0, asl #6
	smull	r2, r3, r1, r6
	mov	r2, r1, asr #31
	add	ip, ip, r0, lsl #4
	add	r5, r5, ip
	strb	lr, [r5, #12]
	rsb	r2, r2, r3, asr #8
	str	r0, [r8, #28]
	mov	r3, r2, asl #11
	sub	r3, r3, r2, asl #9
	rsb	r3, r3, r1
	str	r3, [r4, #12]
	ldrsb	r3, [r7, #5]
	cmp	r3, #2
	beq	.L459
	ldr	r1, [r7, #12]
	ldr	r3, [r7, #16]
	ldr	r2, [r4, #40]
	add	r3, r3, r1
	str	r3, [r4, #36]
	ldr	r1, [r7, #16]
	ldr	r3, [r4, #44]
	add	r2, r2, r1
	str	r2, [r4, #40]
	ldr	r2, [r7, #16]
	add	r3, r3, r2
	str	r3, [r4, #44]
.L459:
	ldr	r3, [r4, #48]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #48]
.L458:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L464:
	movw	r1, #1448
	ldr	r3, .L465+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L465+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L458
.L466:
	.align	2
.L465:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+616
	.word	.LC10
	UNWIND(.fnend)
	.size	InsertStreamSeg, .-InsertStreamSeg
	.align	2
	.global	SCDDRV_GetStreamSeg
	.type	SCDDRV_GetStreamSeg, %function
SCDDRV_GetStreamSeg:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r0
	mov	r0, r1
	movweq	r1, #1481
	beq	.L488
	add	r7, r6, #122880
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L470
	ldr	ip, [r7, #12]
	cmp	ip, #0
	blt	.L470
	cmp	r3, ip
	beq	.L480
	mov	r4, r3, asl #4
	mov	r5, r3, asl #6
	add	r2, r4, r5
	add	r2, r6, r2
	ldrsb	r2, [r2, #12]
	cmp	r2, #1
	movwne	lr, #43691
	movtne	lr, 10922
	bne	.L474
	b	.L472
.L487:
	add	r2, r6, r2
	ldrsb	r2, [r2, #12]
	cmp	r2, #1
	beq	.L472
.L474:
	add	r1, r3, #1
	smull	r2, r3, r1, lr
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #8
	mov	r2, r3, asl #11
	sub	r3, r2, r3, asl #9
	rsb	r3, r3, r1
	cmp	ip, r3
	mov	r4, r3, asl #4
	mov	r5, r3, asl #6
	add	r2, r4, r5
	bne	.L487
.L480:
	mvn	r0, #2
.L469:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L472:
	add	r8, r4, r5
	add	r1, r8, #8
	adds	r1, r6, r1
	beq	.L480
	ldr	r3, .L489
	mov	r2, #80
	add	r4, r4, r5
	add	r4, r6, r4
	ldr	r3, [r3, #52]
	blx	r3
	add	r3, r6, r8
	mov	r0, #2
	ldrsb	r1, [r3, #13]
	strb	r0, [r3, #12]
	ldr	ip, [r3, #24]
	cmp	r1, r0
	ldr	r2, [r7, #44]
	movw	r1, #1517
	ldr	r3, [r7, #48]
	mov	r0, #21
	rsbne	r2, ip, r2
	sub	r3, r3, #1
	bic	r2, r2, r2, asr #31
	str	r2, [r7, #44]
	bic	r3, r3, r3, asr #31
	str	r3, [r7, #48]
	ldrb	lr, [r4, #14]	@ zero_extendqisi2
	ldr	r3, [r4, #20]
	ldr	r2, .L489+4
	stmia	sp, {ip, lr}
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L470:
	movw	r1, #1482
.L488:
	ldr	r3, .L489+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L489+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L469
.L490:
	.align	2
.L489:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC29
	.word	.LANCHOR1+632
	.word	.LC10
	UNWIND(.fnend)
	.size	SCDDRV_GetStreamSeg, .-SCDDRV_GetStreamSeg
	.align	2
	.global	ReleaseStreamSeg
	.type	ReleaseStreamSeg, %function
ReleaseStreamSeg:
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
	subs	r6, r0, #0
	mov	r4, r1
	movweq	r1, #1533
	beq	.L525
	movw	r3, #63998
	sub	r2, r4, #1536
	movt	r3, 65535
	cmp	r2, r3
	bls	.L526
	cmn	r4, #1
	add	r5, r6, #122880
	beq	.L527
	ldr	r3, [r5, #8]
	ldr	ip, [r5, #12]
	cmp	r3, ip
	beq	.L514
	cmp	r4, r3
	movwne	lr, #43691
	movtne	lr, 43690
	bne	.L499
	b	.L497
.L522:
	cmp	r4, r3
	beq	.L497
.L499:
	add	r2, r3, #1
	umull	r0, r1, r2, lr
	mov	r3, r1, lsr #10
	mov	r1, r3, asl #11
	sub	r3, r1, r3, asl #9
	rsb	r3, r3, r2
	cmp	r3, ip
	bne	.L522
.L514:
	mvn	r0, #2
.L520:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L497:
	mov	r2, r3, asl #6
	add	r3, r2, r3, lsl #4
	add	r2, r6, r3
	ldrsb	r2, [r2, #12]
	cmp	r2, #2
	addeq	r3, r3, #8
	addeq	r7, r6, r3
	bne	.L514
.L496:
	cmp	r7, #0
	beq	.L514
	ldr	r3, [r7, #12]
	mov	r2, #0
	strb	r2, [r7, #4]
	movw	r1, #1573
	str	r4, [sp, #8]
	mov	r0, #21
	ldrb	ip, [r7, #6]	@ zero_extendqisi2
	ldr	r2, .L530
	str	ip, [sp, #4]
	ldr	ip, [r7, #16]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r5, #8]
	cmp	r3, r4
	beq	.L528
.L501:
	ldrsb	r3, [r7, #5]
	cmp	r3, #2
	beq	.L524
	ldr	r2, [r7, #16]
	ldr	r3, [r5, #40]
	rsb	r3, r2, r3
.L505:
	bic	r3, r3, r3, asr #31
	mov	r0, #0
	str	r3, [r5, #40]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L527:
	ldr	r7, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r7, r3
	beq	.L514
	mov	r3, r7, asl #6
	mov	r4, r7
	add	r7, r3, r7, lsl #4
	add	r7, r7, #8
	add	r7, r6, r7
	b	.L496
.L529:
	str	r4, [r5, #8]
	ldrsb	r2, [r7, #5]
	cmp	r2, #2
	ldrne	r3, [r3, #20]
	strne	r3, [r5, #32]
	bne	.L501
.L524:
	ldr	r3, [r5, #40]
	b	.L505
.L528:
	movw	r8, #43691
	movt	r8, 43690
	b	.L506
.L502:
	ldr	r2, [r5, #12]
	cmp	r2, r4
	beq	.L508
	ldrsb	r2, [r3, #12]
	cmp	r2, #0
	bne	.L529
.L515:
	add	r2, r4, #1
	umull	r0, r1, r2, r8
	mov	r4, r1, lsr #10
	mov	r3, r4, asl #11
	sub	r4, r3, r4, asl #9
	rsb	r4, r4, r2
.L506:
	mov	r3, r4, asl #6
	cmp	r4, #1536
	add	r3, r3, r4, lsl #4
	add	r3, r6, r3
	bcc	.L502
	ldr	r2, .L530+4
	movw	r1, #1581
	ldr	r3, .L530+8
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r5, #12]
	cmp	r2, r4
	bne	.L515
.L508:
	ldr	r3, [r5, #36]
	str	r2, [r5, #8]
	str	r3, [r5, #32]
	b	.L501
.L526:
	movw	r1, #1534
.L525:
	ldr	r3, .L530+12
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L530+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L520
.L531:
	.align	2
.L530:
	.word	.LC30
	.word	.LC31
	.word	.LANCHOR1+672
	.word	.LANCHOR1+652
	.word	.LC10
	UNWIND(.fnend)
	.size	ReleaseStreamSeg, .-ReleaseStreamSeg
	.align	2
	.global	GetSegStreamSize
	.type	GetSegStreamSize, %function
GetSegStreamSize:
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
	movweq	r1, #1620
	beq	.L536
	cmp	r1, #0
	beq	.L537
	add	r3, r0, #122880
	mov	r0, #0
	ldr	r3, [r3, #40]
	str	r3, [r1]
.L534:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L537:
	movw	r1, #1621
.L536:
	ldr	r3, .L538
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L538+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L534
.L539:
	.align	2
.L538:
	.word	.LANCHOR1+692
	.word	.LC10
	UNWIND(.fnend)
	.size	GetSegStreamSize, .-GetSegStreamSize
	.align	2
	.global	GetSegStreamNum
	.type	GetSegStreamNum, %function
GetSegStreamNum:
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
	add	r0, r0, #122880
	movw	r2, #43691
	movt	r2, 43690
	ldr	r3, [r0, #12]
	ldr	r1, [r0, #8]
	add	r3, r3, #1536
	rsb	r3, r1, r3
	umull	r0, r1, r3, r2
	mov	r0, r1, lsr #10
	mov	r2, r0, asl #11
	sub	r0, r2, r0, asl #9
	rsb	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegStreamNum, .-GetSegStreamNum
	.align	2
	.global	GetFreshSegStream
	.type	GetFreshSegStream, %function
GetFreshSegStream:
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
	movweq	r1, #1640
	beq	.L548
	cmp	r1, #0
	movweq	r1, #1641
	beq	.L548
	cmp	r2, #0
	beq	.L549
	add	r0, r0, #122880
	ldr	r3, [r0, #48]
	str	r3, [r1]
	ldr	r3, [r0, #44]
	str	r3, [r2]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L549:
	movw	r1, #1642
.L548:
	ldr	r3, .L550
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L550+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L551:
	.align	2
.L550:
	.word	.LANCHOR1+712
	.word	.LC21
	UNWIND(.fnend)
	.size	GetFreshSegStream, .-GetFreshSegStream
	.align	2
	.global	SCDDRV_PrepareSleep
	.type	SCDDRV_PrepareSleep, %function
SCDDRV_PrepareSleep:
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
	bne	.L557
	ldr	r3, .L558
	ldr	r2, [r3, #92]
	cmp	r2, #0
	bne	.L556
	ldr	r0, [r3, #76]
	cmp	r0, #0
	moveq	r2, #2
	movne	r0, r2
	movne	r2, #1
	str	r2, [r3, #92]
.L554:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L556:
	mvn	r0, #0
	b	.L554
.L557:
	movw	r1, #1650
	ldr	r3, .L558+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L558+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L554
.L559:
	.align	2
.L558:
	.word	.LANCHOR0
	.word	.LANCHOR1+732
	.word	.LC10
	UNWIND(.fnend)
	.size	SCDDRV_PrepareSleep, .-SCDDRV_PrepareSleep
	.align	2
	.global	SCDDRV_GetSleepStage
	.type	SCDDRV_GetSleepStage, %function
SCDDRV_GetSleepStage:
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
	ldreq	r3, .L563
	ldreq	r0, [r3, #92]
	movne	r0, #3
	ldmfd	sp, {fp, sp, pc}
.L564:
	.align	2
.L563:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_GetSleepStage, .-SCDDRV_GetSleepStage
	.align	2
	.global	SCDDRV_ForceSleep
	.type	SCDDRV_ForceSleep, %function
SCDDRV_ForceSleep:
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
	bne	.L571
	ldr	r3, .L572
	ldr	r2, [r3, #92]
	cmp	r2, #2
	movne	r2, #2
	strne	r2, [r3, #92]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L571:
	movw	r1, #1681
	ldr	r3, .L572+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L572+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L573:
	.align	2
.L572:
	.word	.LANCHOR0
	.word	.LANCHOR1+752
	.word	.LC21
	UNWIND(.fnend)
	.size	SCDDRV_ForceSleep, .-SCDDRV_ForceSleep
	.align	2
	.global	SCDDRV_ExitSleep
	.type	SCDDRV_ExitSleep, %function
SCDDRV_ExitSleep:
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
	ldreq	r3, .L578
	streq	r0, [r3, #92]
	bne	.L577
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L577:
	movw	r1, #1691
	ldr	r3, .L578+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L578+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L579:
	.align	2
.L578:
	.word	.LANCHOR0
	.word	.LANCHOR1+772
	.word	.LC21
	UNWIND(.fnend)
	.size	SCDDRV_ExitSleep, .-SCDDRV_ExitSleep
	.align	2
	.global	ResetLastUnfinishedSegInfo
	.type	ResetLastUnfinishedSegInfo, %function
ResetLastUnfinishedSegInfo:
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
	cmp	r0, #0
	beq	.L584
	ldr	r1, .L585
	add	r3, r0, #172032
	add	r0, r3, #564
	add	r5, r3, #572
	mov	ip, #0
	mvn	r2, #0
	ldr	lr, [r1, #48]
	mov	r4, #1
	str	r2, [r3, #568]
	mov	r1, ip
	strh	r2, [r0]	@ movhi
	add	r0, r3, #608
	str	r2, [r3, #576]
	strh	r2, [r5]	@ movhi
	mov	r2, #80
	str	r4, [r3, #584]
	str	ip, [r3, #588]
	str	ip, [r3, #592]
	str	ip, [r3, #596]
	str	ip, [r3, #600]
	str	ip, [r3, #580]
	mov	r3, lr
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L584:
	movw	r1, #1698
	ldr	r3, .L585+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L585+8
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L586:
	.align	2
.L585:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+792
	.word	.LC21
	UNWIND(.fnend)
	.size	ResetLastUnfinishedSegInfo, .-ResetLastUnfinishedSegInfo
	.align	2
	.global	SM_ClearInst
	.type	SM_ClearInst, %function
SM_ClearInst:
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
	bhi	.L590
	ldr	r5, .L591
	movw	r2, #49840
	ldr	r3, .L591+4
	movt	r2, 2
	mov	r1, #0
	ldr	r0, [r5, r0, asl #3]
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r0, [r5, r4, asl #3]
	bl	ResetLastUnfinishedSegInfo
	ldr	r3, [r5, r4, asl #3]
	mov	r0, #0
	mvn	r4, #0
	add	r3, r3, #172032
	mvn	r5, #0
	strd	r4, [r3, #248]
.L589:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L590:
	movw	r1, #1796
	ldr	r3, .L591+8
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L591+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L589
.L592:
	.align	2
.L591:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+820
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_ClearInst, .-SM_ClearInst
	.align	2
	.global	SM_InstInit
	.type	SM_InstInit, %function
SM_InstInit:
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
	ldr	r4, .L596
	ldr	r6, .L596+4
	add	r5, r4, #32
.L594:
	mov	r2, #8
	mov	r0, r4
	ldr	r3, [r6, #48]
	add	r4, r4, r2
	mov	r1, #0
	blx	r3
	cmp	r4, r5
	bne	.L594
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L597:
	.align	2
.L596:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_InstInit, .-SM_InstInit
	.align	2
	.global	SM_OpenSCDDrv
	.type	SM_OpenSCDDrv, %function
SM_OpenSCDDrv:
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
	subs	r5, r0, #0
	mov	r7, r1
	mov	r8, r2
	movweq	r1, #1821
	beq	.L607
	cmp	r7, #0
	ble	.L608
	cmp	r2, #0
	movwne	r1, #1823
	bne	.L607
	ldr	r4, .L612
	mov	r3, #49152
	movt	r3, 63683
	ldr	r2, [r4, #68]
	str	r3, [r4, #88]
	cmp	r2, #1
	beq	.L606
	ldr	r3, .L612+4
	mov	r2, #56
	mov	r1, r8
	add	r0, r4, #32
	ldr	r3, [r3, #48]
	blx	r3
	add	r3, r5, #1020
	add	r3, r3, #3
	ldr	r1, .L612+8
	bic	r3, r3, #1020
	ldr	r2, [r4, #88]
	bic	r3, r3, #3
	str	r5, [r4, #36]
	str	r8, [r1, #56]
	rsb	r6, r5, r3
	mov	r0, r3
	str	r3, [r4, #44]
	str	r8, [r4, #92]
	mov	r3, #6144
	str	r7, [r4, #40]
	add	r5, r5, #6144
	str	r2, [r4, #32]
	str	r3, [r4, #52]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	str	r0, [r4, #48]
	beq	.L609
	add	r0, r5, r6
	mov	r3, #18432
	str	r0, [r4, #56]
	add	r6, r6, #24576
	str	r3, [r4, #64]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	mov	r3, r0
	str	r0, [r4, #60]
	beq	.L610
	cmp	r7, r6
	movge	r3, #1
	movge	r0, r8
	strge	r3, [r4, #68]
	blt	.L611
.L600:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L608:
	movw	r1, #1822
.L607:
	ldr	r3, .L612+12
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L612+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L600
.L606:
	mvn	r0, #6
	b	.L600
.L611:
	str	r7, [sp, #4]
	mov	r0, r8
	str	r6, [sp]
	movw	r1, #1866
	ldr	r3, .L612+12
	ldr	r2, .L612+20
	bl	dprint_normal
	mvn	r0, #6
	b	.L600
.L609:
	ldr	r3, .L612+12
	movw	r1, #1849
	ldr	r2, .L612+24
	bl	dprint_normal
	mvn	r0, #6
	b	.L600
.L610:
	ldr	r3, .L612+12
	movw	r1, #1860
	ldr	r2, .L612+28
	bl	dprint_normal
	mvn	r0, #6
	b	.L600
.L613:
	.align	2
.L612:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LANCHOR1+836
	.word	.LC10
	.word	.LC34
	.word	.LC32
	.word	.LC33
	UNWIND(.fnend)
	.size	SM_OpenSCDDrv, .-SM_OpenSCDDrv
	.align	2
	.global	SM_Config
	.type	SM_Config, %function
SM_Config:
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
	mov	r5, r1
	mov	r7, r0
	movwhi	r1, #1903
	bhi	.L628
	cmp	r5, #0
	moveq	r1, #1904
	beq	.L628
	ldr	r3, .L631
	ldr	r6, [r3, r0, asl #3]
	cmn	r3, #32
	cmpne	r6, #0
	beq	.L629
	ldr	r2, [r5, #44]
	add	r4, r6, #172032
	str	r2, [r4, #296]
	ldr	r1, [r6, #16]
	ldr	r2, [r5, #12]
	cmp	r1, r2
	addeq	r6, r6, #4
	ldreq	r8, .L631+4
	beq	.L619
	cmp	r2, #0
	movweq	r1, #1918
	beq	.L628
	ldr	r2, [r5]
	cmp	r2, #0
	beq	.L630
	ldr	ip, [r3, #44]
	mov	r2, #1536
	ldr	r1, [r3, #48]
	add	r0, r6, #49152
	ldr	lr, [r3, #52]
	add	r0, r0, #104
	str	ip, [r4, #184]
	str	r1, [r4, #176]
	ldr	ip, [r3, #56]
	ldr	r1, [r3, #60]
	ldr	r3, [r3, #64]
	str	ip, [r4, #192]
	str	r1, [r4, #188]
	str	lr, [r4, #180]
	str	r3, [r4, #196]
	str	r2, [r4, #200]
	ldr	r3, [r5, #12]
	ldr	r2, [r5]
	add	r1, r3, #3
	bic	r1, r1, #3
	rsb	r3, r3, r1
	add	r1, r1, #4096
	add	ip, r3, #4096
	str	r1, [r4, #204]
	add	r2, r2, ip
	str	r2, [r4, #172]
	ldr	ip, [r5, #16]
	rsb	r3, r3, ip
	sub	r3, r3, #5120
	str	r3, [r4, #208]
	bl	ConfigStreamSegArray
	subs	r9, r0, #0
	bne	.L624
	ldr	r8, .L631+4
	add	r6, r6, #4
	mov	r2, #72
	mov	r1, r5
	mov	r0, r6
	ldr	r3, [r8, #52]
	blx	r3
	str	r9, [r4, #216]
.L619:
	ldr	r3, [r8, #52]
	mov	r2, #72
	mov	r0, r6
	mov	r1, r5
	blx	r3
	mov	r3, #2
	str	r3, [r4, #284]
	mov	r0, #0
	ldr	r2, [r5, #8]
	str	r7, [r4, #212]
	sub	r3, r2, #2
	bics	r3, r3, #2
	moveq	r3, #1
	movne	r3, #0
	cmp	r2, #14
	orreq	r3, r3, #1
	cmp	r3, #0
	movne	r3, #3
	strne	r3, [r4, #284]
.L616:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L630:
	movw	r1, #1919
.L628:
	ldr	r3, .L631+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L631+12
	bl	dprint_normal
.L629:
	mvn	r0, #0
	b	.L616
.L624:
	mvn	r0, #1
	b	.L616
.L632:
	.align	2
.L631:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+852
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_Config, .-SM_Config
	.align	2
	.global	SM_CfgBuf
	.type	SM_CfgBuf, %function
SM_CfgBuf:
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
	bhi	.L641
	cmp	r1, #0
	bne	.L642
	ldr	r2, .L643
	ldr	r3, [r2, r0, asl #3]
	cmn	r2, #32
	cmpne	r3, #0
	moveq	r1, #1
	movne	r1, #0
	beq	.L637
	add	r3, r3, #172032
	ldr	r0, [r3, #216]
	cmp	r0, #0
	beq	.L635
	ldr	r6, [r2, #44]
	mov	r0, r1
	ldr	r5, [r2, #48]
	mov	ip, #1536
	ldr	r4, [r2, #52]
	ldr	lr, [r2, #56]
	str	r1, [r3, #216]
	ldr	r1, [r2, #60]
	ldr	r2, [r2, #64]
	str	r6, [r3, #184]
	str	r5, [r3, #176]
	str	r4, [r3, #180]
	str	lr, [r3, #192]
	str	r1, [r3, #188]
	str	r2, [r3, #196]
	str	ip, [r3, #200]
.L635:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L637:
	mvn	r0, #0
	b	.L635
.L641:
	movw	r3, #1973
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L643+4
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L635
.L642:
	movw	r3, #1980
	str	r1, [sp]
	ldr	r2, .L643+8
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L635
.L644:
	.align	2
.L643:
	.word	.LANCHOR0
	.word	.LC35
	.word	.LC36
	UNWIND(.fnend)
	.size	SM_CfgBuf, .-SM_CfgBuf
	.align	2
	.global	SM_Start
	.type	SM_Start, %function
SM_Start:
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
	bhi	.L652
	ldr	r3, .L654
	ldr	r3, [r3, r0, asl #3]
	cmp	r3, #0
	beq	.L650
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L653
.L650:
	mvn	r0, #6
.L647:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L653:
	add	r3, r3, #172032
	ldr	r0, [r3, #228]
	cmp	r0, #0
	moveq	r2, #1
	streq	r2, [r3, #228]
	bne	.L650
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L652:
	movw	r1, #2015
	ldr	r3, .L654+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L654+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L647
.L655:
	.align	2
.L654:
	.word	.LANCHOR0
	.word	.LANCHOR1+864
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_Start, .-SM_Start
	.align	2
	.global	SM_Stop
	.type	SM_Stop, %function
SM_Stop:
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
	bhi	.L664
	ldr	r3, .L665
	ldr	r0, [r3, r0, asl #3]
	cmp	r0, #0
	beq	.L658
	add	r3, r0, #172032
	ldr	r0, [r3, #228]
	cmp	r0, #0
	beq	.L658
	ldr	r2, [r3, #216]
	cmp	r2, #0
	mvngt	r0, #6
	movle	r0, #0
	strle	r0, [r3, #228]
.L658:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L664:
	movw	r1, #2036
	ldr	r3, .L665+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L665+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L658
.L666:
	.align	2
.L665:
	.word	.LANCHOR0
	.word	.LANCHOR1+876
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_Stop, .-SM_Stop
	.align	2
	.global	SM_Reset
	.type	SM_Reset, %function
SM_Reset:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 344
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #356)
	sub	sp, sp, #356
	cmp	r0, #3
	mov	r2, #0
	mov	r5, r0
	str	r2, [fp, #-376]
	bhi	.L680
	ldr	r3, .L682
	ldr	r6, [r3, r0, asl #3]
	cmp	r6, #0
	beq	.L670
	ldr	r1, [r3, #72]
	ldr	r7, .L682+4
	cmp	r1, r0
	bne	.L672
	str	r2, [r3, #76]
	mov	r0, #1
	ldr	r3, [r7, #128]
	blx	r3
	movw	r3, #1745
	mov	r1, r3
	str	r3, [sp]
	mov	r0, #20
	ldr	r3, .L682+8
	ldr	r2, .L682+12
	bl	dprint_normal
.L672:
	add	r4, r6, #172032
	ldr	r3, [r7, #52]
	mov	r2, #72
	add	r1, r6, #4
	sub	r0, fp, #372
	add	r10, r4, #304
	blx	r3
	ldr	ip, [r4, #300]
	mov	r1, r10
	ldr	r3, [r7, #52]
	mov	r2, #256
	sub	r0, fp, #300
	add	r9, r6, #80
	str	ip, [fp, #-384]
	ldr	r8, [r4, #228]
	blx	r3
	mov	r0, r5
	bl	SM_Stop
	mov	r0, r9
	sub	r1, fp, #376
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L681
.L673:
	mov	r0, r9
	ldr	r1, [fp, #-376]
	bl	DeleteRawPacket
	mov	r1, #1
	mov	r0, r5
	sub	r8, r8, #1
	bl	DeleteRawPacketInBuffer
	ldrb	r9, [r4, #212]	@ zero_extendqisi2
	movw	r2, #49840
	ldr	r3, [r7, #48]
	movt	r2, 2
	mov	r1, #0
	mov	r0, r6
	sxtb	r9, r9
	blx	r3
	mov	r0, r6
	bl	ResetLastUnfinishedSegInfo
	mvn	r3, #0
	mvn	r2, #0
	mov	ip, #2
	strd	r2, [r4, #248]
	sub	r1, fp, #372
	str	ip, [r4, #284]
	mov	r0, r5
	str	r9, [r4, #212]
	bl	SM_Config
	cmp	r8, #1
	sub	r1, fp, #300
	mov	r0, r10
	movls	r3, #1
	movhi	r3, #0
	mov	r2, #256
	str	r3, [r4, #228]
	ldr	r3, [fp, #-384]
	str	r3, [r4, #300]
	ldr	r3, [r7, #52]
	blx	r3
	mov	r0, #0
.L679:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L681:
	movw	r1, #1762
	ldr	r3, .L682+8
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L682+16
	bl	dprint_normal
	b	.L673
.L680:
	mov	r1, #1728
	ldr	r3, .L682+20
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L682+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L679
.L670:
	movw	r3, #1734
	mov	r0, r6
	mov	r1, r3
	ldr	r2, .L682+28
	bl	dprint_normal
	mvn	r0, #0
	b	.L679
.L683:
	.align	2
.L682:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+896
	.word	.LC39
	.word	.LC38
	.word	.LANCHOR1+884
	.word	.LC10
	.word	.LC37
	UNWIND(.fnend)
	.size	SM_Reset, .-SM_Reset
	.align	2
	.global	SM_CloseSCDDrv
	.type	SM_CloseSCDDrv, %function
SM_CloseSCDDrv:
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
	subs	r4, r0, #0
	bne	.L687
	bl	SM_Stop
	mov	r0, #1
	bl	SM_Stop
	mov	r0, #2
	bl	SM_Stop
	mov	r0, #3
	bl	SM_Stop
	ldr	ip, .L688
	ldr	r3, .L688+4
	mov	r2, #56
	mov	r1, r4
	ldr	r0, .L688+8
	str	r4, [ip, #56]
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r4
.L686:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L687:
	movw	r1, #1879
	ldr	r3, .L688+12
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L688+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L686
.L689:
	.align	2
.L688:
	.word	g_VfmwGlobalStat
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+32
	.word	.LANCHOR1+908
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_CloseSCDDrv, .-SM_CloseSCDDrv
	.align	2
	.global	SM_GetInfo
	.type	SM_GetInfo, %function
SM_GetInfo:
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
	mov	r4, r1
	movwhi	r1, #2061
	bhi	.L697
	cmp	r4, #0
	beq	.L698
	ldr	r3, .L699
	ldr	r3, [r3, r0, asl #3]
	cmp	r3, #0
	streqb	r3, [r4]
	mvneq	r0, #0
	beq	.L692
	add	r1, r3, #172032
	add	r0, r3, #49152
	add	r0, r0, #104
	ldr	r2, [r1, #228]
	cmp	r0, #0
	strb	r2, [r4]
	ldr	r2, [r1, #276]
	str	r2, [r4, #20]
	moveq	r2, r0
	beq	.L695
	ldr	r2, [r1, #116]
	movw	r6, #43691
	ldr	r1, [r1, #112]
	movt	r6, 43690
	add	r2, r2, #1536
	rsb	r1, r1, r2
	umull	r6, r7, r1, r6
	mov	r2, r7, lsr #10
	mov	ip, r2, asl #11
	sub	r2, ip, r2, asl #9
	rsb	r2, r2, r1
.L695:
	add	r5, r3, #80
	str	r2, [r4, #8]
	add	r1, r4, #16
	bl	GetSegStreamSize
	add	r1, r4, #4
	mov	r0, r5
	bl	GetRawStreamNum
	mov	r0, r5
	add	r1, r4, #12
	bl	GetRawStreamSize
	mov	r0, #0
.L692:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L698:
	movw	r1, #2062
.L697:
	ldr	r3, .L699+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L699+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L692
.L700:
	.align	2
.L699:
	.word	.LANCHOR0
	.word	.LANCHOR1+924
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_GetInfo, .-SM_GetInfo
	.align	2
	.global	GetRawNumInFrame
	.type	GetRawNumInFrame, %function
GetRawNumInFrame:
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
	add	r6, r0, #49152
	mov	r4, #1
	ldr	r3, [r6]
	mov	ip, r3, asl #5
	mov	r5, r3, asl #7
	rsb	lr, ip, r5
	add	lr, r0, lr
	ldr	lr, [lr, #8]
	str	lr, [r2]
	str	r4, [r1]
	b	.L702
.L704:
	ldr	r4, [r1]
	add	r4, r4, #1
	str	r4, [r1]
	ldr	r4, [lr, #8]
	ldr	lr, [r2]
	add	lr, lr, r4
	str	lr, [r2]
	ldr	lr, [r6, #4]
	cmp	lr, r3
	beq	.L706
	ldr	lr, [r1]
	cmp	lr, #512
	bhi	.L706
.L702:
	rsb	ip, ip, r5
	add	r3, r3, #1
	ubfx	r3, r3, #0, #9
	ldrb	r4, [r0, ip]	@ zero_extendqisi2
	mov	r5, r3, asl #7
	mov	ip, r3, asl #5
	cmp	r4, #0
	rsb	lr, ip, r5
	add	lr, r0, lr
	bne	.L704
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L706:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawNumInFrame, .-GetRawNumInFrame
	.align	2
	.global	AdjustRawPacketVP6A
	.type	AdjustRawPacketVP6A, %function
AdjustRawPacketVP6A:
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
	ldr	r10, [r1]
	add	ip, r0, #49152
	cmp	r10, #0
	ldr	ip, [ip]
	beq	.L712
	mov	r7, ip, asl #5
	mov	r6, ip, asl #7
	rsb	lr, r7, r6
	add	lr, r0, lr
	ldr	r4, [lr, #8]
	cmp	r4, #2
	bgt	.L713
	mov	lr, r4
	mov	r8, #3
	mov	r5, #0
	b	.L710
.L711:
	add	lr, r0, lr
	ldr	lr, [lr, #8]
	add	r4, r4, lr
	cmp	r4, #2
	bgt	.L715
.L710:
	add	ip, ip, #1
	add	r5, r5, #1
	ubfx	ip, ip, #0, #9
	cmp	r5, r10
	rsb	r8, lr, r8
	mov	r7, ip, asl #5
	mov	r6, ip, asl #7
	rsb	lr, r7, r6
	bne	.L711
.L712:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L715:
	mov	r9, r8, asr #31
.L709:
	rsb	r6, r7, r6
	rsb	r5, r5, r10
	add	r6, r0, r6
	str	r5, [r1]
	sub	r4, r4, #3
	mov	r0, #0
	ldrd	r6, [r6, #40]
	adds	r8, r8, r6
	adc	r9, r9, r7
	strd	r8, [r2]
	str	r4, [r3]
	ldr	r3, [fp, #4]
	str	ip, [r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L713:
	mov	r8, #3
	mov	r9, #0
	mov	r5, #0
	b	.L709
	UNWIND(.fnend)
	.size	AdjustRawPacketVP6A, .-AdjustRawPacketVP6A
	.align	2
	.global	SM_CopyRawToSeg
	.type	SM_CopyRawToSeg, %function
SM_CopyRawToSeg:
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
	ldr	r2, .L756
	mov	ip, r0
	mov	r3, #0
	str	r0, [fp, #-80]
	mov	r5, r1
	ldr	r4, [r2, ip, asl #3]
	mov	r1, #0
	mov	r0, #0
	str	r3, [fp, #-64]
	cmp	r4, r3
	strd	r0, [fp, #-52]
	mov	r1, ip
	movweq	r1, #2171
	beq	.L749
	add	r9, r4, #49152
	add	r3, r4, #80
	add	r9, r9, #104
	str	r3, [fp, #-76]
	cmn	r4, #80
	cmpne	r9, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r5, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L753
	add	r10, r4, #49152
	ldr	lr, [r10, #84]
	ldr	r3, [r10, #80]
	cmp	lr, r3
	beq	.L750
	mov	r2, r3, asl #5
	mov	r8, r3, asl #7
	rsb	r1, r2, r8
	mov	ip, #1
	add	r1, r4, r1
	str	r2, [fp, #-72]
	mov	r0, r2
	str	ip, [fp, #-56]
	mov	r2, r8
	ldr	r6, [r1, #88]
	b	.L721
.L723:
	add	ip, ip, #1
	ldr	r7, [r7, #88]
	cmp	ip, #512
	add	r6, r6, r7
	movls	r1, #0
	movhi	r1, #1
	cmp	r3, lr
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L750
.L721:
	rsb	r1, r0, r2
	add	r3, r3, #1
	add	r1, r4, r1
	ubfx	r3, r3, #0, #9
	ldrb	r1, [r1, #80]	@ zero_extendqisi2
	mov	r0, r3, asl #5
	mov	r2, r3, asl #7
	cmp	r1, #0
	rsb	r7, r0, r2
	add	r7, r4, r7
	bne	.L723
	mov	r0, r9
	mov	r7, r1
	str	ip, [fp, #-56]
	bl	ResetStreamSegArray
	add	r2, r4, #172032
	ldr	r3, [r2, #132]
	cmp	r3, r6
	blt	.L754
	ldr	r3, [fp, #-72]
	ldr	r1, [r4, #12]
	rsb	r3, r3, r8
	ldr	r7, [r2, #128]
	add	r3, r4, r3
	ldr	r2, [r10, #80]
	sub	r1, r1, #12
	ldr	r10, [r10, #104]
	ldr	r0, [r3, #88]
	clz	r1, r1
	str	r2, [fp, #-60]
	cmp	r0, #0
	mov	r1, r1, lsr #5
	ldrd	r2, [r3, #120]
	moveq	r1, #0
	cmp	r1, #0
	str	r0, [fp, #-64]
	strd	r2, [fp, #-52]
	bne	.L725
.L728:
	str	r7, [r5, #12]
	mov	r0, r7
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-72]
	mov	r1, #1
	ldr	ip, [fp, #-56]
	rsb	r8, r3, r8
	add	r8, r4, r8
	cmp	ip, #0
	str	r0, [r5]
	rsb	r3, r0, r10
	str	r3, [r5, #16]
	ldrd	r2, [r8, #144]
	strd	r2, [r5, #24]
	ldrd	r2, [r8, #144]
	strd	r2, [r5, #32]
	ldrd	r2, [r8, #128]
	strb	r1, [r5, #6]
	strd	r2, [r5, #40]
	ldrd	r2, [r8, #136]
	strd	r2, [r5, #48]
	ldr	r3, [r8, #100]
	str	r3, [r5, #56]
	ldr	r3, [r8, #104]
	str	r3, [r5, #60]
	ldr	r3, [r8, #108]
	str	r3, [r5, #64]
	ldr	r3, [r8, #112]
	str	r3, [r5, #68]
	beq	.L727
	cmp	r10, #0
	beq	.L750
	ldrd	r2, [fp, #-52]
	orrs	r3, r2, r3
	ldrne	r8, .L756+4
	movne	r7, #0
	bne	.L730
	b	.L750
.L731:
	cmp	r10, #0
	beq	.L750
	orrs	r3, r0, r1
	beq	.L750
.L730:
	mov	r0, #2
	add	r7, r7, #1
	bl	VCTRL_RecordPosTime
	ldr	r3, [r8, #52]
	ldr	r2, [fp, #-64]
	mov	r0, r10
	ldr	r1, [fp, #-52]
	blx	r3
	mov	r0, #3
	bl	VCTRL_RecordPosTime
	ldr	r1, [fp, #-64]
	mov	r0, #0
	bl	VCTRL_RecordData
	ldr	r2, [fp, #-60]
	ldr	r1, [fp, #-64]
	add	r0, r2, #1
	ldr	ip, [fp, #-56]
	mov	r3, r2, asl #7
	ubfx	r0, r0, #0, #9
	sub	r2, r3, r2, asl #5
	str	r0, [fp, #-60]
	add	r2, r4, r2
	mov	r3, r0, asl #7
	sub	r3, r3, r0, asl #5
	add	r10, r10, r1
	ldrb	r0, [r2, #81]	@ zero_extendqisi2
	add	r3, r4, r3
	ldr	r2, [r5, #16]
	cmp	ip, r7
	strb	r0, [r5, #7]
	add	r2, r2, r1
	str	r2, [r5, #16]
	ldrd	r0, [r3, #120]
	ldr	r3, [r3, #88]
	strd	r0, [fp, #-52]
	str	r3, [fp, #-64]
	bhi	.L731
	ldr	r0, [r5]
.L727:
	cmp	r0, #0
	beq	.L755
	ldr	r2, [fp, #-80]
	mov	r1, r5
	mov	r0, r9
	bl	InsertStreamSeg
	mov	r1, r6
	ldr	r0, [fp, #-76]
	bl	DeleteRawLen
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L755:
	movw	r1, #2261
	ldr	r3, .L756+8
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L756+12
	bl	dprint_normal
.L750:
	mvn	r0, #3
.L745:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L754:
	mov	r3, r6
	ldr	r2, .L756+16
	movw	r1, #2196
	mov	r0, r7
	bl	dprint_normal
	mov	r1, r6
	ldr	r0, [fp, #-76]
	bl	DeleteRawLen
	cmp	r0, #0
	beq	.L750
	movw	r3, #2200
	mov	r0, r7
	mov	r1, r3
	ldr	r2, .L756+20
	bl	dprint_normal
	mvn	r0, #3
	b	.L745
.L725:
	sub	r2, fp, #60
	sub	r3, fp, #64
	str	r2, [sp]
	sub	r1, fp, #56
	sub	r2, fp, #52
	ldr	r0, [fp, #-76]
	bl	AdjustRawPacketVP6A
	cmp	r0, #0
	beq	.L728
	b	.L750
.L753:
	mov	r1, #2176
.L749:
	ldr	r3, .L756+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L756+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L745
.L757:
	.align	2
.L756:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+936
	.word	.LC42
	.word	.LC40
	.word	.LC41
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_CopyRawToSeg, .-SM_CopyRawToSeg
	.align	2
	.global	SM_ReadSegStream
	.type	SM_ReadSegStream, %function
SM_ReadSegStream:
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
	mov	r7, r1
	mov	r6, r0
	movwhi	r1, #2279
	bhi	.L771
	cmp	r7, #0
	beq	.L772
	ldr	r3, .L775
	ldr	r4, [r3, r0, asl #3]
	cmp	r4, #0
	movweq	r1, #2283
	beq	.L771
	add	r1, r4, #28
	ldr	r0, [r4, #12]
	bl	SCDDRV_IsSCDByPass
	cmp	r0, #0
	bne	.L773
.L763:
	add	r0, r4, #49152
	mov	r1, r7
	add	r0, r0, #104
	add	r4, r4, #172032
	bl	SCDDRV_GetStreamSeg
	subs	r5, r0, #0
	beq	.L774
	ldr	r3, [r4, #276]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #276]
.L760:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L773:
	mov	r1, r7
	mov	r0, r6
	bl	SM_CopyRawToSeg
	cmp	r0, #0
	beq	.L763
	add	r4, r4, #172032
	ldr	r2, .L775+4
	movw	r1, #2292
	mov	r0, #21
	bl	dprint_normal
	ldr	r3, [r4, #276]
	mvn	r0, #6
	add	r3, r3, #1
	str	r3, [r4, #276]
	b	.L760
.L774:
	mov	r0, r6
	mov	r1, r7
	str	r5, [r4, #276]
	bl	SCDDRV_SaveStreamSeg
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L772:
	movw	r1, #2280
.L771:
	ldr	r3, .L775+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L775+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L760
.L776:
	.align	2
.L775:
	.word	.LANCHOR0
	.word	.LC43
	.word	.LANCHOR1+952
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_ReadSegStream, .-SM_ReadSegStream
	.align	2
	.global	SM_ReleaseStreamSeg
	.type	SM_ReleaseStreamSeg, %function
SM_ReleaseStreamSeg:
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
	movwhi	r1, #2319
	bhi	.L781
	ldr	r3, .L783
	ldr	r0, [r3, r0, asl #3]
	cmp	r0, #0
	beq	.L782
	add	r0, r0, #49152
	add	r0, r0, #104
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseStreamSeg
.L782:
	movw	r1, #2322
.L781:
	ldr	r3, .L783+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L783+8
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L784:
	.align	2
.L783:
	.word	.LANCHOR0
	.word	.LANCHOR1+972
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_ReleaseStreamSeg, .-SM_ReleaseStreamSeg
	.align	2
	.global	SM_GiveThreadEvent
	.type	SM_GiveThreadEvent, %function
SM_GiveThreadEvent:
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
	ldr	r3, .L786
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L787:
	.align	2
.L786:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_GiveThreadEvent, .-SM_GiveThreadEvent
	.align	2
	.global	CalcInstBlockTime
	.type	CalcInstBlockTime, %function
CalcInstBlockTime:
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
	ldr	r3, .L793
	mov	r5, r1
	mov	r4, r0
	ldr	r3, [r3]
	blx	r3
	cmp	r5, #0
	add	r3, r4, #172032
	mov	r1, r0
	bne	.L792
	ldr	r2, [r3, #244]
	cmp	r0, r2
	strls	r5, [r3, #240]
	rsbhi	r0, r2, r0
	strls	r1, [r3, #244]
	strhi	r0, [r3, #240]
	movls	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L792:
	mov	r2, #0
	str	r1, [r3, #244]
	mov	r0, r2
	str	r2, [r3, #240]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L794:
	.align	2
.L793:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CalcInstBlockTime, .-CalcInstBlockTime
	.align	2
	.global	SCDDRV_IsChanDec
	.type	SCDDRV_IsChanDec, %function
SCDDRV_IsChanDec:
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
	ldr	r3, .L798
	ldr	r2, [r3, #76]
	cmp	r2, #1
	ldreq	r3, [r3, #72]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L799:
	.align	2
.L798:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_IsChanDec, .-SCDDRV_IsChanDec
	.align	2
	.global	SCDDRV_GetRawStreamStatus
	.type	SCDDRV_GetRawStreamStatus, %function
SCDDRV_GetRawStreamStatus:
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
	mov	r5, r2
	mov	r4, r0
	bl	GetRawStreamSize
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	GetRawStreamNum
	UNWIND(.fnend)
	.size	SCDDRV_GetRawStreamStatus, .-SCDDRV_GetRawStreamStatus
	.align	2
	.global	GetFreeSegBufSize
	.type	GetFreeSegBufSize, %function
GetFreeSegBufSize:
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
	cmpne	r0, #0
	moveq	r3, #1
	movne	r3, #0
	movweq	r1, #2378
	beq	.L808
	add	r0, r0, #122880
	str	r3, [r1]
	ldr	r2, [r0, #36]
	ldr	r3, [r0, #32]
	cmp	r2, r3
	bhi	.L809
	ldrcs	r0, [r0, #28]
	subcc	r3, r3, #1
	ldrcc	r0, [r0, #28]
	rsbcc	r3, r2, r3
	subcs	r3, r0, #1
	cmp	r3, r0
	strle	r3, [r1]
	bgt	.L810
.L801:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L809:
	ldr	r0, [r0, #28]
	sub	r3, r3, #1
	add	r3, r3, r0
	rsb	r3, r2, r3
	cmp	r3, r0
	strle	r3, [r1]
	ble	.L801
.L810:
	movw	r1, #2395
.L808:
	ldr	r3, .L811
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L811+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L812:
	.align	2
.L811:
	.word	.LANCHOR1+992
	.word	.LC21
	UNWIND(.fnend)
	.size	GetFreeSegBufSize, .-GetFreeSegBufSize
	.align	2
	.global	SCDDRV_GetSegStreamStatus
	.type	SCDDRV_GetSegStreamStatus, %function
SCDDRV_GetSegStreamStatus:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r7, [fp, #4]
	mov	r8, r1
	mov	r5, #0
	mov	r6, r2
	mov	r1, r2
	mov	r9, r0
	str	r5, [r7]
	mov	r4, r3
	bl	GetFreeSegBufSize
	ldr	r2, [r6]
	add	r3, r8, #79
	cmp	r2, r3
	movwcs	r3, #65457
	movtcs	r3, 65535
	rsbcs	r3, r8, r3
	addcs	r5, r3, r2
	add	r3, r9, #122880
	str	r5, [r6]
	ldr	r0, [r3, #28]
	rsb	r0, r0, r0, lsl #3
	add	r2, r0, #7
	cmp	r0, #0
	movlt	r0, r2
	cmp	r8, r0, asr #3
	addcs	r5, r5, r8
	strcs	r5, [r6]
	movcs	r2, #1
	strcs	r2, [r7]
	cmp	r9, #0
	beq	.L818
	ldr	r2, [r3, #12]
	movw	r0, #43691
	ldr	r3, [r3, #8]
	movt	r0, 43690
	add	r2, r2, #1536
	rsb	r2, r3, r2
	umull	r0, r1, r2, r0
	mov	r1, r1, lsr #10
	mov	r3, r1, asl #11
	sub	r3, r3, r1, asl #9
	rsb	r2, r3, r2
	rsb	r2, r2, #1536
	str	r2, [r4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L818:
	mov	r2, #1536
	str	r2, [r4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_GetSegStreamStatus, .-SCDDRV_GetSegStreamStatus
	.align	2
	.global	SCDDRV_IsRawStreamNotEnough
	.type	SCDDRV_IsRawStreamNotEnough, %function
SCDDRV_IsRawStreamNotEnough:
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
	cmpne	r0, #3
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsRawStreamNotEnough, .-SCDDRV_IsRawStreamNotEnough
	.align	2
	.global	SCDDRV_IsFreeSegSlotNotEnough
	.type	SCDDRV_IsFreeSegSlotNotEnough, %function
SCDDRV_IsFreeSegSlotNotEnough:
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
	cmp	r0, #384
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsFreeSegSlotNotEnough, .-SCDDRV_IsFreeSegSlotNotEnough
	.align	2
	.global	SCDDRV_IsFreeSegBufNotEnough
	.type	SCDDRV_IsFreeSegBufNotEnough, %function
SCDDRV_IsFreeSegBufNotEnough:
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
	cmp	r0, r1, lsr #3
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsFreeSegBufNotEnough, .-SCDDRV_IsFreeSegBufNotEnough
	.align	2
	.global	SCDDRV_CheckConditionOfStartSCD
	.type	SCDDRV_CheckConditionOfStartSCD, %function
SCDDRV_CheckConditionOfStartSCD:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 8
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
	mov	r6, r3
	sub	r5, fp, #36
	mov	r7, r0
	mov	r4, r1
	mov	r1, r6
	mov	r3, #0
	mov	r8, r2
	str	r3, [r5, #-4]!
	bl	GetRawStreamSize
	mov	r1, r5
	mov	r0, r7
	bl	GetRawStreamNum
	ldr	r1, [r6]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	cmpne	r1, #3
	bls	.L824
	ldr	r3, [fp, #12]
	mov	r1, r8
	mov	r0, r4
	str	r3, [sp]
	ldmib	fp, {r2, r3}
	bl	SCDDRV_GetSegStreamStatus
	ldr	r3, [fp, #8]
	ldr	r3, [r3]
	cmp	r3, #384
	bls	.L825
	add	r4, r4, #122880
	ldr	r3, [fp, #4]
	ldr	r2, [r4, #28]
	ldr	r3, [r3]
	cmp	r3, r2, lsr #3
	mvnls	r0, #5
	movhi	r0, #0
.L823:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L824:
	mvn	r0, #4
	b	.L823
.L825:
	mvn	r0, #5
	b	.L823
	UNWIND(.fnend)
	.size	SCDDRV_CheckConditionOfStartSCD, .-SCDDRV_CheckConditionOfStartSCD
	.align	2
	.global	SCDDRV_SetCtrlReg
	.type	SCDDRV_SetCtrlReg, %function
SCDDRV_SetCtrlReg:
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
	ldr	r3, [r0, #12]
	cmp	r3, #18
	beq	.L837
	sub	ip, r3, #6
	cmp	r3, #1
	cmpne	r3, #15
	clz	ip, ip
	moveq	r4, #1
	movne	r4, #0
	mov	ip, ip, lsr #5
	mov	lr, ip
.L828:
	add	r0, r0, #172032
	mov	r2, #1
	strb	r2, [r1, #2]
	ldr	r2, [r0, #184]
	str	r2, [r1, #4]
	ldr	r2, [r0, #176]
	str	r2, [r1, #8]
	ldr	r2, [r0, #192]
	str	r2, [r1, #16]
	ldr	r5, [r0, #200]
	ldr	r2, [r0, #284]
	mul	r2, r2, r5
	str	r2, [r1, #20]
	ldr	r2, [r0, #128]
	str	r2, [r1, #24]
	ldr	r2, [r0, #132]
	ldr	r5, [r0, #128]
	add	r2, r2, r5
	str	r2, [r1, #28]
	ldr	r2, [r0, #584]
	cmp	r2, #1
	ldreq	r2, [r0, #140]
	ldrne	r2, [r0, #580]
	addeq	r2, r2, #3
	str	lr, [r1, #60]
	biceq	r2, r2, #3
	cmp	r4, #0
	str	r2, [r1, #32]
	mov	lr, #1
	mov	r2, #0
	strb	lr, [r1]
	str	r2, [r1, #44]
	bne	.L838
	cmp	r3, #3
	orreq	ip, ip, #1
	cmp	ip, r2
	beq	.L840
.L832:
	mov	r2, #1
	strb	r2, [r1, #1]
.L833:
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r1, #36]
	beq	.L835
	cmp	r3, #14
	moveq	r3, #4
	str	r3, [r1, #36]
.L835:
	mov	r3, #0
	mov	r2, #1
	str	r3, [r1, #48]
	str	r2, [r1, #40]
	str	r3, [r1, #52]
	ldr	r3, [r0, #560]
	str	r3, [r1, #56]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L838:
	mov	r3, r2
.L831:
	mov	r2, #0
	strb	r2, [r1, #1]
	b	.L833
.L837:
	mov	lr, #1
	mov	r4, #0
	mov	ip, lr
	mov	r3, #6
	b	.L828
.L840:
	sub	r2, r3, #2
	bics	r2, r2, #2
	beq	.L832
	b	.L831
	UNWIND(.fnend)
	.size	SCDDRV_SetCtrlReg, .-SCDDRV_SetCtrlReg
	.align	2
	.global	SCDDRV_RecordStartState
	.type	SCDDRV_RecordStartState, %function
SCDDRV_RecordStartState:
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
	add	r4, r0, #172032
	cmp	r1, r2
	str	r1, [r4, #256]
	movls	r3, #1
	str	r2, [r4, #260]
	movhi	r3, #0
	strb	r3, [r0, #2]
	mov	r1, #1
	ldr	r3, .L844
	mov	r2, #0
	str	r1, [r4, #220]
	strb	r2, [r0, #3]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r4, #280]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L845:
	.align	2
.L844:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_RecordStartState, .-SCDDRV_RecordStartState
	.align	2
	.global	SCD_ConfigReg
	.type	SCD_ConfigReg, %function
SCD_ConfigReg:
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
	cmp	r0, #4
	mov	r6, r0
	beq	.L850
	ldr	r4, .L852
	mov	r5, r2, asl #2
.L847:
	add	r4, r4, r5
	ldr	r0, [r4, #88]
	add	r0, r6, r0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_WritePhyWord
.L850:
	ldr	r4, .L852
	mov	r5, r2, asl #2
	cmp	r1, #0
	add	r3, r4, r5
	ldr	r0, [r3, #88]
	add	r0, r0, #4
	beq	.L851
	bl	MEM_ReadPhyWord
	mov	r1, r0
	b	.L847
.L851:
	bl	MEM_ReadPhyWord
	bic	r1, r0, #196608
	b	.L847
.L853:
	.align	2
.L852:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCD_ConfigReg, .-SCD_ConfigReg
	.align	2
	.global	WriteScdVtrlReg
	.type	WriteScdVtrlReg, %function
WriteScdVtrlReg:
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
	ldr	r7, .L860
	mov	r5, r2, asl #2
	mov	r8, r0
	mov	r0, r2
	add	r6, r7, r5
	mov	r4, r1
	bl	ResetSCD
	ldr	r1, [r4, #4]
	ldr	r0, [r6, #88]
	add	r0, r0, #2048
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	ldr	r1, [r4, #16]
	add	r0, r0, #2048
	add	r0, r0, #8
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	ldr	r1, [r4, #20]
	add	r0, r0, #2048
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	ldr	r1, [r4, #24]
	add	r0, r0, #2064
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	ldr	r1, [r4, #28]
	add	r0, r0, #2064
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	ldr	r1, [r4, #32]
	add	r0, r0, #2064
	add	r0, r0, #8
	bl	MEM_WritePhyWord
	ldr	r3, [r7, r8, asl #3]
	add	r3, r3, #172032
	ldr	r2, [r3, #584]
	cmp	r2, #1
	beq	.L858
	ldr	r1, [r3, #568]
	mov	r2, #3
	movt	r2, 768
	cmp	r1, r2
	beq	.L859
.L857:
	add	r6, r7, r5
	ldr	r0, [r6, #88]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r3, [r7, r8, asl #3]
	ldr	r0, [r6, #88]
	add	r3, r3, #172032
	add	r3, r3, #564
	add	r0, r0, #2112
	add	r0, r0, #4
	ldrh	r1, [r3]
	bl	MEM_WritePhyWord
.L856:
	ldr	r0, [r4, #52]
	add	r5, r7, r5
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #36]
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	mov	r0, r0, asl #9
	ldr	ip, [r4, #48]
	and	r2, r2, #15
	orr	r3, r0, r3, asl #8
	ldr	r0, [r5, #88]
	orr	r3, r3, r2
	mov	r1, r1, asl #4
	orr	r3, r3, ip, asl #13
	and	r1, r1, #16
	orr	r1, r3, r1
	add	r0, r0, #2080
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #88]
	mov	r1, #0
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #88]
	mov	r1, #0
	ldrb	r4, [r4, #2]	@ zero_extendqisi2
	add	r0, r0, #2048
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #88]
	and	r1, r4, #1
	add	r0, r0, #2048
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MEM_WritePhyWord
.L859:
	add	r3, r3, #564
	ldrh	r9, [r3]
	cmp	r9, #0
	bne	.L857
	ldr	r0, [r6, #88]
	mov	r1, #3
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	mov	r1, r9
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	b	.L856
.L858:
	ldr	r0, [r6, #88]
	mvn	r1, #0
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r0, [r6, #88]
	mvn	r1, #0
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	b	.L856
.L861:
	.align	2
.L860:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	WriteScdVtrlReg, .-WriteScdVtrlReg
	.align	2
	.global	WriteScdMsg
	.type	WriteScdMsg, %function
WriteScdMsg:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #140)
	sub	sp, sp, #140
	mov	r4, r0
	str	r0, [fp, #-168]
	mov	r10, r1
	str	r1, [fp, #-148]
	mov	r9, r2
	str	r2, [fp, #-164]
	mov	r1, #0
	mov	r2, #96
	sub	r0, fp, #140
	mov	r8, r3
	str	r3, [fp, #-160]
	bl	memset
	ldr	r2, .L925
	mov	r1, #0
	ldr	r3, [r2, r4, asl #3]
	mov	r2, #8192
	str	r3, [fp, #-172]
	add	r3, r3, #172032
	add	r0, r3, #688
	str	r3, [fp, #-176]
	mov	r5, r3
	add	r4, r3, #576
	ldr	r3, .L925+4
	add	r6, r5, #572
	str	r0, [fp, #-144]
	mov	r5, #0
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #140
	mov	r0, r8
	bl	GetFirstRawPacket
	ldr	r7, [fp, #-132]
	ldr	r3, [fp, #4]
	cmp	r7, r9
	str	r5, [r3]
	str	r5, [r3, #4]
	str	r5, [r3, #8]
	str	r5, [r10, #4]
	bgt	.L863
	add	r9, r8, #49152
	mov	r10, r5
	mov	r8, r5
	mov	r2, r7
	str	r6, [fp, #-152]
	str	r4, [fp, #-156]
.L868:
	ldr	r1, [fp, #4]
	mov	r3, r8, asl #2
	cmp	r2, #0
	mov	r0, r5, asl #4
	add	ip, r1, r3
	ldr	r1, [fp, #8]
	add	r3, r3, #12
	add	r10, r10, #1
	add	r3, r3, r1
	ldr	r1, [fp, #-144]
	add	lr, r1, r0
	ble	.L864
	ldr	r1, [fp, #-136]
	add	r5, r5, #1
	ldr	r6, [fp, #-136]
	ldr	r4, [fp, #4]
	sub	r1, r1, #1
	add	r1, r1, r2
	str	r6, [r4, r8, asl #2]
	add	r8, r8, #3
	str	r3, [ip, #8]
	str	r1, [ip, #4]
	ldrd	r2, [fp, #-100]
	ldr	r1, [fp, #-144]
	strd	r2, [r1, r0]
	ldrd	r2, [fp, #-100]
	ldr	r1, [fp, #-132]
	subs	r2, r2, #1
	sbc	r3, r3, #0
	adds	r2, r2, r1
	adc	r3, r3, r1, asr #31
	strd	r2, [lr, #8]
	mov	r3, #0
	str	r3, [fp, #-132]
.L864:
	ldr	r3, [fp, #-148]
	str	r7, [r3, #4]
	ldr	r3, [r9, #16]
	cmp	r3, #512
	bcs	.L920
	ldr	ip, [fp, #-160]
	mov	r1, r3, asl #7
	sub	r1, r1, r3, asl #5
	mov	r2, #96
	add	r1, ip, r1
	ldr	ip, [r9, #4]
	sub	r0, fp, #140
	cmp	r3, ip
	beq	.L920
	ldr	r3, .L925+4
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r9, #16]
	ldr	r2, [fp, #-132]
	ldr	r0, [fp, #-164]
	add	r3, r3, #1
	add	r7, r7, r2
	cmp	r0, r7
	mov	r1, r3, asr #31
	movge	r0, #1
	movlt	r0, #0
	cmp	r10, #512
	mov	r1, r1, lsr #23
	add	r3, r3, r1
	movge	r0, #0
	cmp	r0, #0
	ubfx	r3, r3, #0, #9
	rsb	r3, r1, r3
	str	r3, [r9, #16]
	bne	.L868
	cmp	r2, #0
	ldr	r6, [fp, #-152]
	ldr	r4, [fp, #-156]
	bne	.L922
.L869:
	cmp	r10, #0
	beq	.L887
	cmp	r8, #0
	subgt	r8, r8, #-1073741823
	ldrgt	r2, [fp, #4]
	movgt	r3, #0
	strgt	r3, [r2, r8, asl #2]
	ldr	r2, [fp, #-168]
	ldr	r3, .L925
	ldr	r3, [r3, r2, asl #3]
	ldr	r2, [fp, #-148]
	add	r3, r3, #172032
	add	r0, r3, #572
	add	r1, r3, #564
	ldr	r2, [r2, #4]
	ldr	ip, [r3, #576]
	cmp	r2, #6
	str	ip, [r3, #568]
	movge	r2, #6
	ldrh	r3, [r0]
	cmp	r2, #5
	strh	r3, [r1]	@ movhi
	bls	.L923
.L889:
	mov	r8, #2
	mov	r2, #4
.L873:
	cmp	r5, #0
	ldrgt	r3, [fp, #-144]
	addgt	r9, r3, r5, lsl #4
	ble	.L882
.L885:
	ldr	r1, [r9, #-8]
	ldr	r0, [r9, #-16]
	add	r3, r1, #1
	rsb	r0, r0, r3
	cmp	r0, r2
	movcc	lr, r0
	movcs	lr, r2
	cmp	r2, #0
	beq	.L878
	cmp	lr, #0
	beq	.L881
	add	ip, r4, lr
.L880:
	ldrb	r7, [r3, #-1]!	@ zero_extendqisi2
	strb	r7, [r4], #1
	cmp	r4, ip
	bne	.L880
	subs	r2, r2, lr
	beq	.L878
.L881:
	subs	r5, r5, #1
	sub	r9, r9, #16
	bne	.L885
.L882:
	ldr	r2, [fp, #-148]
	mov	r0, #0
	mov	r3, #1
	str	r10, [r2]
	str	r3, [r2, #8]
.L917:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L920:
	ldr	r2, [fp, #-132]
	ldr	r6, [fp, #-152]
	cmp	r2, #0
	ldr	r4, [fp, #-156]
	beq	.L869
.L922:
	ldr	r3, [fp, #-148]
	ldr	r3, [r3, #4]
.L886:
	ldr	r1, [fp, #-164]
	sub	r1, r1, #16
	cmp	r1, r3
	ble	.L869
	ldr	r1, [fp, #-164]
	cmp	r1, r7
	cmplt	r10, #512
	bge	.L869
	rsb	r3, r3, r1
	cmp	r3, r2
	bgt	.L869
	ldr	r2, [fp, #-136]
	mov	r1, r8, asl #2
	ldr	lr, [fp, #4]
	add	r0, r1, #12
	ldr	ip, [fp, #4]
	add	r10, r10, #1
	str	r3, [fp, #-132]
	str	r2, [lr, r8, asl #2]
	sub	r2, r2, #1
	add	r1, ip, r1
	add	r2, r2, r3
	ldr	ip, [fp, #8]
	add	r8, r8, #3
	ldr	r3, [fp, #-144]
	add	r0, r0, ip
	mov	ip, r5, asl #4
	str	r2, [r1, #4]
	add	r5, r5, #1
	str	r0, [r1, #8]
	add	r1, r3, ip
	mov	r0, r3
	ldrd	r2, [fp, #-100]
	strd	r2, [r0, ip]
	ldrd	r2, [fp, #-100]
	ldr	r0, [fp, #-132]
	subs	r2, r2, #1
	sbc	r3, r3, #0
	adds	r2, r2, r0
	adc	r3, r3, r0, asr #31
	strd	r2, [r1, #8]
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-132]
	ldr	r3, [r1, #4]
	add	r3, r3, r2
	mov	r2, r1
	str	r3, [r1, #4]
	b	.L869
.L878:
	cmp	r8, #0
	beq	.L882
	rsb	r0, lr, r0
	rsb	r1, lr, r1
	cmp	r0, r8
	movcs	r0, r8
	cmp	r0, #0
	beq	.L883
	add	r1, r1, #1
	add	r2, r6, r0
.L884:
	ldrb	r3, [r1, #-1]!	@ zero_extendqisi2
	strb	r3, [r6], #1
	cmp	r6, r2
	bne	.L884
	subs	r8, r8, r0
	beq	.L882
	mov	r2, #0
	b	.L881
.L923:
	cmp	r2, #1
	beq	.L924
	rsbs	r0, r2, #6
	rsb	lr, r2, #5
	beq	.L889
	ldr	r3, [fp, #-172]
	movw	ip, #41534
	add	lr, r4, lr
	movt	ip, 2
	add	ip, r3, ip
	mov	r3, #2
.L875:
	subs	r0, r0, #1
	rsb	r7, r3, #3
	sub	r8, r3, #1
	ldrb	r1, [lr], #-1	@ zero_extendqisi2
	movne	r3, #1
	moveq	r3, #0
	cmp	r7, #1
	movhi	r3, #0
	andls	r3, r3, #1
	cmp	r3, #0
	strb	r1, [ip, #-1]!
	mov	r3, r8
	bne	.L875
	cmp	r8, #0
	bne	.L921
	cmp	r0, #0
	rsb	r2, r2, #3
	beq	.L891
	ldr	r3, [fp, #-176]
	rsb	ip, r0, r2
	add	ip, r4, ip
	add	r1, r3, #580
	add	r3, r4, r2
.L876:
	ldrb	r2, [r3], #-1	@ zero_extendqisi2
	cmp	r3, ip
	strb	r2, [r1, #-1]!
	bne	.L876
	rsb	r2, r0, #4
	b	.L873
.L883:
	mov	r2, r0
	b	.L881
.L891:
.L921:
	mov	r2, #4
	b	.L873
.L924:
	ldr	ip, [fp, #-176]
	mov	r8, #0
	ldrb	r1, [ip, #572]	@ zero_extendqisi2
	ldrb	r3, [ip, #579]	@ zero_extendqisi2
	ldrb	r0, [ip, #578]	@ zero_extendqisi2
	strb	r1, [ip, #573]
	strb	r3, [ip, #572]
	ldrb	r1, [ip, #577]	@ zero_extendqisi2
	ldrb	r3, [ip, #576]	@ zero_extendqisi2
	strb	r0, [ip, #579]
	strb	r1, [ip, #578]
	strb	r3, [ip, #577]
	b	.L873
.L863:
	cmp	r7, #0
	bne	.L893
.L887:
	mvn	r0, #5
	b	.L917
.L893:
	mov	r3, r5
	mov	r2, r7
	mov	r8, r3
	mov	r10, r3
	b	.L886
.L926:
	.align	2
.L925:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	WriteScdMsg, .-WriteScdMsg
	.align	2
	.global	SCDDRV_StartSCD
	.type	SCDDRV_StartSCD, %function
SCDDRV_StartSCD:
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
	add	r4, r1, #172032
	mov	r8, r3
	str	r0, [fp, #-52]
	ldr	r3, [r4, #176]
	mov	r9, r2
	ldr	r0, [r4, #212]
	add	r5, r1, #80
	ldr	r10, [r4, #184]
	add	r6, r4, #160
	str	r3, [fp, #-48]
	bl	VCTRL_IfEsBufEnable
	cmp	r0, #0
	beq	.L931
	ldr	r7, .L932
	mov	r2, #12
	mov	r1, #0
	mov	r0, r6
	ldr	r3, [r7, #48]
	blx	r3
	ldr	r2, [fp, #-48]
	ldr	r0, [r4, #212]
	mov	r3, r5
	str	r10, [sp, #4]
	mov	r1, r6
	str	r2, [sp]
	mov	r2, r9
	bl	WriteScdMsg
	subs	r5, r0, #0
	movne	r0, r5
	bne	.L929
	ldr	r3, [r7]
	blx	r3
	ldr	ip, .L932+4
	mov	r3, r8, asl #6
	ldr	r1, [fp, #-52]
	sub	r3, r3, r8, asl #2
	mov	r2, r8
	add	r3, ip, r3
	str	r0, [r3, #48]
	ldr	r0, [r4, #212]
	bl	WriteScdVtrlReg
	mov	r0, r5
.L929:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L931:
	ldr	r3, [r4, #212]
	movw	r1, #2898
	ldr	r2, .L932+8
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #6
	b	.L929
.L933:
	.align	2
.L932:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LC44
	UNWIND(.fnend)
	.size	SCDDRV_StartSCD, .-SCDDRV_StartSCD
	.align	2
	.global	CutStreamWithSCD
	.type	CutStreamWithSCD, %function
CutStreamWithSCD:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #96)
	sub	sp, sp, #96
	add	r6, r0, #172032
	mov	r7, r1
	add	r1, r0, #49152
	ldr	r2, [r6, #592]
	sub	r3, fp, #96
	mov	r5, r0
	str	r3, [sp, #8]
	add	r1, r1, #104
	sub	r3, fp, #104
	add	r0, r0, #80
	str	r3, [sp, #4]
	sub	r3, fp, #100
	str	r3, [sp]
	sub	r3, fp, #108
	mov	ip, #0
	str	ip, [fp, #-108]
	str	ip, [fp, #-104]
	str	ip, [fp, #-100]
	str	ip, [fp, #-96]
	bl	SCDDRV_CheckConditionOfStartSCD
	subs	r4, r0, #0
	bne	.L945
	ldr	r3, [fp, #-96]
	cmp	r3, #0
	bne	.L946
.L937:
	mov	r1, r7
	ldr	r0, [r6, #212]
	bl	SM_CfgBuf
	subs	r4, r0, #0
	bne	.L947
	ldr	r2, [fp, #-104]
	mov	r0, r5
	ldr	r3, [r6, #284]
	sub	r1, fp, #92
	str	r2, [r6, #200]
	mul	r3, r3, r2
	mov	r3, r3, asl #2
	str	r3, [r6, #196]
	bl	SCDDRV_SetCtrlReg
	mov	r3, r7
	sub	r0, fp, #92
	ldr	r2, [fp, #-100]
	mov	r1, r5
	bl	SCDDRV_StartSCD
	cmp	r0, #0
	movne	r3, r0
	bne	.L936
	ldr	r2, [fp, #-100]
	mov	r4, #0
	ldr	r1, [fp, #-108]
	cmp	r1, r2
	str	r2, [r6, #260]
	str	r1, [r6, #256]
	mov	r2, #1
	movls	r3, #1
	strlsb	r3, [r5, #2]
	ldr	r3, .L948
	strhib	r0, [r5, #2]
	str	r2, [r6, #220]
	strb	r4, [r5, #3]
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r6, #280]
.L936:
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L947:
	mov	r3, r4
	ldr	r2, .L948+4
	movw	r1, #2945
	mov	r0, #21
	bl	dprint_normal
	mov	r3, r4
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L946:
	mov	r0, r5
	bl	ResetLastUnfinishedSegInfo
	b	.L937
.L945:
	mov	r3, r4
	ldr	r2, .L948+8
	movw	r1, #2931
	mov	r0, #21
	bl	dprint_normal
	mov	r3, r4
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L949:
	.align	2
.L948:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	.LC45
	UNWIND(.fnend)
	.size	CutStreamWithSCD, .-CutStreamWithSCD
	.align	2
	.global	ReadScdStateReg
	.type	ReadScdStateReg, %function
ReadScdStateReg:
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
	ldr	r4, .L951
	mov	r5, r0
	movw	r6, #2124
	add	r4, r4, r1, lsl #2
	ldr	r0, [r4, #88]
	add	r0, r0, #2112
	bl	MEM_ReadPhyWord
	and	r0, r0, #1
	str	r0, [r5]
	ldr	r0, [r4, #88]
	add	r0, r6, r0
	bl	MEM_ReadPhyWord
	ldr	r2, [r4, #88]
	mov	r3, r0, lsr #22
	add	r0, r6, r2
	str	r3, [r5, #8]
	bl	MEM_ReadPhyWord
	ldr	r2, [r4, #88]
	ubfx	r3, r0, #0, #22
	add	r0, r2, #2128
	str	r3, [r5, #12]
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #88]
	str	r0, [r5, #16]
	add	r0, r3, #2128
	add	r0, r0, #4
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #88]
	str	r0, [r5, #20]
	add	r0, r3, #2048
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #88]
	str	r0, [r5, #24]
	add	r0, r3, #2128
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	str	r0, [r5, #28]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L952:
	.align	2
.L951:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	ReadScdStateReg, .-ReadScdStateReg
	.align	2
	.global	ParseMpeg4UniqueUpMsg
	.type	ParseMpeg4UniqueUpMsg, %function
ParseMpeg4UniqueUpMsg:
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
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r0, #1
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	strb	r3, [r1]
	ldr	r3, [r2, #4]
	ldrb	r0, [r1]	@ zero_extendqisi2
	mov	r3, r3, lsr #30
	bfi	r0, r3, #1, #1
	strb	r0, [r1]
	ldrh	r0, [r2, #10]
	ldrb	r3, [r1]	@ zero_extendqisi2
	bfi	r3, r0, #2, #1
	strb	r3, [r1]
	ldr	r3, [r2, #8]
	ldrb	r0, [r1]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #3
	bfi	r0, r3, #3, #4
	strb	r0, [r1]
	ldr	r3, [r2, #8]
	ldrh	r2, [r1]
	and	r3, r3, #7
	bfi	r2, r3, #7, #4
	strh	r2, [r1]	@ movhi
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ParseMpeg4UniqueUpMsg, .-ParseMpeg4UniqueUpMsg
	.align	2
	.global	ConvertByteOrder
	.type	ConvertByteOrder, %function
ConvertByteOrder:
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
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	orr	r3, r2, r3, asl #24
	orr	r3, r3, r1
	orr	r0, r3, r0, asl #8
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ConvertByteOrder, .-ConvertByteOrder
	.align	2
	.global	CheckSegValid
	.type	CheckSegValid, %function
CheckSegValid:
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
	beq	.L968
	ldr	ip, [r0, #12]
	cmp	ip, #0
	movweq	r1, #3011
	beq	.L967
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L969
	cmp	r1, #0
	beq	.L962
	add	r1, r1, #122880
	ldr	lr, [r1, #36]
	ldr	ip, [r1, #32]
	cmp	lr, ip
	bls	.L963
	ldr	r1, [r1, #28]
	sub	ip, ip, #1
	add	ip, ip, r1
	rsb	r1, lr, ip
.L962:
	ldr	r0, [r0, #16]
	cmp	r0, r1
	movls	r0, #0
	bhi	.L970
.L959:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L963:
	ldrcs	r1, [r1, #28]
	subcc	ip, ip, #1
	rsbcc	r1, lr, ip
	subcs	r1, r1, #1
	b	.L962
.L969:
	movw	r1, #3012
.L967:
	ldr	r3, .L971
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L971+4
	bl	dprint_normal
	mvn	r0, #6
	b	.L959
.L970:
	str	r1, [sp, #4]
	mov	r3, r2
	str	r0, [sp]
	movw	r1, #3018
	ldr	r2, .L971+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #6
	b	.L959
.L968:
	movw	r1, #3010
	ldr	r3, .L971
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L971+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L959
.L972:
	.align	2
.L971:
	.word	.LANCHOR1+1012
	.word	.LC10
	.word	.LC47
	UNWIND(.fnend)
	.size	CheckSegValid, .-CheckSegValid
	.align	2
	.global	GetSegPts
	.type	GetSegPts, %function
GetSegPts:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	mov	r4, r3
	mov	r5, r2
	sub	r3, fp, #36
	sub	r2, fp, #32
	str	r2, [sp]
	sub	r2, fp, #40
	mov	ip, #0
	mov	r6, r0
	str	ip, [fp, #-40]
	str	ip, [fp, #-36]
	str	ip, [fp, #-32]
	bl	GetRawNumOffset
	ldr	r0, [fp, #-32]
	mov	r3, r0, asl #7
	sub	r0, r3, r0, asl #5
	add	r0, r6, r0
	ldrd	r6, [r0, #64]
	strd	r6, [r4, #24]
	ldrd	r2, [r0, #48]
	strd	r2, [r4, #40]
	ldrd	r2, [r0, #64]
	strd	r2, [r4, #32]
	ldrd	r2, [r0, #56]
	strd	r2, [r4, #48]
	ldr	r3, [r0, #20]
	str	r3, [r4, #56]
	ldr	r3, [r0, #24]
	str	r3, [r4, #60]
	ldr	r3, [r0, #28]
	str	r3, [r4, #64]
	ldr	r3, [r0, #32]
	str	r3, [r4, #68]
	ldrb	r3, [r0, #92]	@ zero_extendqisi2
	strb	r3, [r4, #8]
	ldrd	r2, [r5]
	cmp	r7, r3
	cmpeq	r6, r2
	beq	.L976
.L974:
	strd	r6, [r5]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L976:
	ldr	r3, .L977
	ldr	r2, [fp, #4]
	ldr	r3, [r3, r2, asl #2]
	ldr	r3, [r3, #120]
	cmp	r3, #0
	bne	.L974
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [r4, #24]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L978:
	.align	2
.L977:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	GetSegPts, .-GetSegPts
	.align	2
	.global	IsVopHeader
	.type	IsVopHeader, %function
IsVopHeader:
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
	beq	.L984
	cmp	r0, #2
	movne	r0, #0
	beq	.L985
.L981:
	mov	r2, #0
	movt	r2, 65025
	cmp	r1, r2
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L984:
	mov	r3, #0
	movt	r3, 46593
	rsb	r0, r3, r1
	clz	r0, r0
	mov	r0, r0, lsr #5
	b	.L981
.L985:
	ubfx	r3, r1, #16, #8
	sub	r3, r3, #128
	cmp	r3, #4
	movhi	r0, #0
	movls	r0, #1
	b	.L981
	UNWIND(.fnend)
	.size	IsVopHeader, .-IsVopHeader
	.align	2
	.global	GetNextVop
	.type	GetNextVop, %function
GetNextVop:
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
	add	r3, r0, #49152
	add	lr, r0, #172032
	add	r3, r3, #104
	cmp	r3, #0
	ldr	r6, [lr, #284]
	moveq	r8, #1536
	beq	.L987
	ldr	r3, [lr, #116]
	movw	r4, #43691
	ldr	r8, [lr, #112]
	movt	r4, 43690
	add	r3, r3, #1536
	rsb	r3, r8, r3
	umull	r4, r5, r3, r4
	mov	r8, r5, lsr #10
	mov	ip, r8, asl #11
	sub	r8, ip, r8, asl #9
	rsb	r8, r8, r3
	rsb	r8, r8, #1536
.L987:
	sub	r3, r2, #1
	cmp	r3, #0
	mov	ip, r3
	blt	.L996
	mov	r5, r6, asl #2
	mov	r4, #0
	add	r0, r0, #49152
	mov	r9, r4
	ldr	r7, [lr, #128]
	movt	r4, 65025
	mla	r1, r5, r3, r1
	ldr	r6, [r0, #104]
	ldr	lr, [lr, #232]
	movt	r9, 46593
	b	.L994
.L999:
	cmp	lr, #2
	beq	.L998
	cmp	r2, r4
	beq	.L992
.L993:
	sub	ip, ip, #1
	rsb	r1, r5, r1
	cmn	ip, #1
	mov	r2, r3
	beq	.L996
	sub	r3, r3, #1
.L994:
	ldr	r2, [r1]
	cmp	lr, #1
	rsb	r2, r7, r2
	ldr	r2, [r6, r2]
	rsbeq	r0, r9, r2
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	bne	.L999
.L990:
	cmp	r2, r4
	beq	.L992
	cmp	r0, #1
	bne	.L993
.L992:
	cmp	r3, r8
	mov	r2, r3
	bls	.L996
	sub	r3, r3, #1
	b	.L993
.L998:
	ubfx	r0, r2, #16, #8
	sub	r0, r0, #128
	cmp	r0, #4
	movhi	r0, #0
	movls	r0, #1
	b	.L990
.L996:
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetNextVop, .-GetNextVop
	.align	2
	.global	CorrectRollPhyAddr
	.type	CorrectRollPhyAddr, %function
CorrectRollPhyAddr:
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
	cmp	r1, r2
	rsbcc	r1, r2, r1
	addcc	r0, r1, r0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CorrectRollPhyAddr, .-CorrectRollPhyAddr
	.align	2
	.global	CorrectSegNextAddr
	.type	CorrectSegNextAddr, %function
CorrectSegNextAddr:
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
	cmp	r0, r1
	movcc	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CorrectSegNextAddr, .-CorrectSegNextAddr
	.align	2
	.global	SetLastUnfinishedSegInfo
	.type	SetLastUnfinishedSegInfo, %function
SetLastUnfinishedSegInfo:
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
	UNWIND(.pad #100)
	sub	sp, sp, #100
	add	r4, r0, #172032
	mov	r8, r1
	mov	r6, r0
	ldr	r5, [r4, #284]
	mov	r9, r2
	ldr	r7, [r4, #188]
	mov	r2, #80
	mov	r1, #0
	sub	r0, fp, #124
	mul	r5, r5, r8
	bl	memset
	ldr	r3, [r4, #212]
	add	r10, r4, #608
	add	r0, r6, #80
	add	r2, r4, #248
	add	ip, r6, #49152
	add	r5, r5, #1
	str	ip, [fp, #-128]
	add	r8, r6, #49152
	ldr	r1, [r7, r5, asl #2]
	mov	r5, r5, asl #2
	str	r3, [sp]
	mov	r3, r10
	bic	r1, r1, #-1073741824
	add	r5, r7, r5
	cmn	r1, #-1073741820
	add	r8, r8, #104
	movcs	r1, #0
	bl	GetSegPts
	ldr	r3, .L1021
	mov	r1, r10
	sub	r0, fp, #124
	mov	r2, #80
	ldr	r3, [r3, #52]
	blx	r3
	ldr	ip, [r5, #-4]
	ldr	r1, [r4, #128]
	str	ip, [r4, #588]
	ldr	r3, [r9, #28]
	cmp	r1, r3
	movcs	r3, r1
	cmp	ip, r3
	str	r3, [r4, #580]
	bls	.L1006
	mov	r2, #1
	str	r2, [r4, #596]
	ldr	r0, [r9, #28]
	rsb	r5, r1, r3
	ldr	r2, [r9, #16]
	cmp	r1, r0
	addhi	r2, r0, r2
	rsbhi	r2, r1, r2
	str	r2, [r4, #600]
	rsb	lr, ip, r2
	add	r7, lr, r5
	str	r7, [r4, #592]
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L1020
.L1009:
	mov	r3, #0
	str	r3, [r4, #584]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1006:
	rsb	r3, ip, r3
	mov	r2, #0
	cmp	r3, #3
	str	r2, [r4, #596]
	str	r2, [r4, #600]
	str	r3, [r4, #592]
	movls	r2, #0
	ldr	r0, [r6, #44]
	movhi	r2, #1
	cmp	r0, #1
	movne	r2, #0
	cmp	r2, #0
	beq	.L1009
	ldr	r2, [fp, #-128]
	rsb	lr, r1, ip
	mov	r0, r8
	sub	r1, fp, #124
	str	ip, [fp, #-112]
	mov	ip, #2
	ldr	r5, [r2, #104]
	ldr	r2, [r4, #212]
	add	lr, r5, lr
	str	r3, [fp, #-108]
	mov	r5, #1
	str	lr, [fp, #-124]
	strb	r5, [fp, #-118]
	strb	ip, [fp, #-119]
	bl	InsertStreamSeg
	b	.L1009
.L1020:
	cmp	r8, #0
	beq	.L1010
	ldr	r3, [r4, #116]
	movw	r2, #43691
	ldr	r0, [r4, #112]
	movt	r2, 43690
	add	r3, r3, #1536
	rsb	r0, r0, r3
	umull	r2, r3, r0, r2
	mov	r2, r3, lsr #10
	mov	r3, r2, asl #11
	sub	r3, r3, r2, asl #9
	rsb	r3, r3, r0
	rsb	r3, r3, #1536
	cmp	r3, #3
	movls	r3, #0
	movhi	r3, #1
.L1010:
	cmp	r7, #3
	movls	r3, #0
	andhi	r3, r3, #1
	cmp	r3, #0
	beq	.L1009
	ldr	r7, [fp, #-128]
	rsb	r0, r1, ip
	ldr	r2, [r4, #212]
	sub	r1, fp, #124
	str	ip, [fp, #-112]
	mov	r6, #2
	ldr	r3, [r7, #104]
	str	lr, [fp, #-108]
	add	r3, r3, r0
	mov	r0, r8
	str	r3, [fp, #-124]
	mov	r3, #0
	strb	r6, [fp, #-119]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	ldr	lr, [r7, #104]
	sub	r1, fp, #124
	ldr	ip, [r4, #128]
	mov	r0, r8
	ldr	r2, [r4, #212]
	mov	r3, #1
	strb	r6, [fp, #-119]
	str	lr, [fp, #-124]
	str	r5, [fp, #-108]
	str	ip, [fp, #-112]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	b	.L1009
.L1022:
	.align	2
.L1021:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SetLastUnfinishedSegInfo, .-SetLastUnfinishedSegInfo
	.align	2
	.global	ProcessSegRoll
	.type	ProcessSegRoll, %function
ProcessSegRoll:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	add	r5, r0, #172032
	mov	r4, r1
	add	r7, r0, #49152
	ldr	r1, [r5, #188]
	add	r7, r7, #104
	ldr	ip, [r5, #588]
	cmp	r7, #0
	ldr	r9, [r5, #128]
	add	r6, r0, #49152
	str	r3, [fp, #-48]
	rsb	r3, ip, r2
	ldr	r8, [r1]
	ldrsb	r2, [fp, #4]
	rsb	r8, r9, r8
	add	lr, r3, r8
	str	r2, [fp, #-56]
	beq	.L1024
	ldr	r2, [r5, #116]
	movw	r0, #43691
	ldr	r1, [r5, #112]
	movt	r0, 43690
	add	r2, r2, #1536
	str	ip, [r4, #12]
	rsb	r2, r1, r2
	ldr	r10, [r5, #128]
	cmp	lr, #3
	umull	r0, r1, r2, r0
	ldr	r0, [r6, #104]
	rsb	ip, r10, ip
	str	lr, [r4, #16]
	add	ip, r0, ip
	str	ip, [r4]
	mov	r0, r1, lsr #10
	mov	r1, r0, asl #11
	sub	r1, r1, r0, asl #9
	rsb	r2, r1, r2
	rsb	r2, r2, #1536
	bls	.L1030
	cmp	r2, #2
	bls	.L1028
.L1027:
	movw	r2, #3236
	mov	r1, r7
	mov	r0, r4
	str	r3, [fp, #-52]
	bl	CheckSegValid
	subs	r10, r0, #0
	bne	.L1028
	ldr	r3, [fp, #-52]
	cmp	r8, #0
	str	r3, [r4, #16]
	beq	.L1032
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	mov	r1, r4
	strb	r10, [r4, #6]
	mov	r0, r7
	strb	r3, [r4, #5]
	ldr	r2, [r5, #212]
	bl	InsertStreamSeg
	str	r9, [r4, #12]
	ldr	r2, [r5, #128]
	mov	ip, #1
	ldr	r3, [r6, #104]
	mov	r0, r7
	rsb	r9, r2, r9
	str	r8, [r4, #16]
	add	r9, r3, r9
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	str	r9, [r4]
	mov	r1, r4
	strb	ip, [r4, #6]
	strb	r3, [r4, #5]
	ldr	r2, [r5, #212]
	bl	InsertStreamSeg
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1032:
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	mov	r0, r7
	mov	r1, r4
	strb	r3, [r4, #5]
	mov	r3, #1
	strb	r3, [r4, #6]
	ldr	r2, [r5, #212]
	bl	InsertStreamSeg
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1024:
	str	ip, [r4, #12]
	cmp	lr, #3
	ldr	r1, [r5, #128]
	ldr	r2, [r6, #104]
	rsb	ip, r1, ip
	str	lr, [r4, #16]
	add	ip, r2, ip
	str	ip, [r4]
	bhi	.L1027
.L1030:
	movw	r3, #3231
	str	lr, [sp]
	mov	r1, r3
	ldr	r2, .L1033
	mov	r0, #0
	mov	r10, r0
	bl	dprint_normal
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1028:
	mvn	r10, #3
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1034:
	.align	2
.L1033:
	.word	.LC48
	UNWIND(.fnend)
	.size	ProcessSegRoll, .-ProcessSegRoll
	.align	2
	.global	ProcessLastUnfinishedSeg
	.type	ProcessLastUnfinishedSeg, %function
ProcessLastUnfinishedSeg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #88)
	sub	sp, sp, #88
	add	r4, r0, #172032
	mov	r6, r2
	mov	r9, r1
	ldr	r3, [r4, #188]
	mov	r2, #80
	mov	r5, r0
	mov	r1, #0
	sub	r0, fp, #116
	ldr	r7, [r3]
	bl	memset
	ldr	r3, [r6, #28]
	ldr	r2, [r4, #128]
	ldr	r8, [r6, #16]
	cmp	r2, r3
	addhi	r3, r3, r8
	rsbhi	r8, r2, r3
	cmp	r9, #0
	bne	.L1037
	ldr	r3, [r4, #256]
	ldr	r1, [r4, #260]
	cmp	r3, r1
	movle	r3, #0
	movgt	r3, #1
	strb	r3, [r5]
	ldr	r0, [r4, #588]
	cmp	r0, #0
	ldreq	r1, [r4, #164]
	beq	.L1039
	ldr	ip, [r4, #596]
	ldr	r3, [r4, #592]
	ldr	r1, [r4, #164]
	cmp	ip, #0
	add	r3, r1, r3
	str	r3, [r4, #592]
	bne	.L1040
	ldr	r3, [r6, #28]
	cmp	r0, r3
	strhi	r8, [r4, #600]
	movhi	r3, #1
	strhi	r3, [r4, #596]
.L1040:
	mov	r3, #0
	str	r3, [r4, #584]
	ldr	r3, [r6, #28]
	cmp	r3, r2
	movcc	r3, r2
	str	r3, [r4, #580]
.L1039:
	add	r0, r5, #80
	bl	DeleteRawLen
.L1041:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1037:
	mov	r6, #0
	strb	r6, [r5]
	ldr	r0, [r4, #588]
	cmp	r0, r6
	beq	.L1041
	ldr	r3, .L1049
	add	r1, r4, #608
	mov	r2, #80
	sub	r0, fp, #116
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r1, [r4, #596]
	cmp	r1, #1
	beq	.L1047
	ldr	r3, [r4, #588]
	cmp	r7, r3
	bcc	.L1043
	add	r2, r5, #49152
	rsb	r7, r3, r7
	ldr	r1, [r4, #128]
	cmp	r7, #3
	ldr	r2, [r2, #104]
	mov	r0, #1
	rsb	r1, r1, r3
	str	r3, [fp, #-104]
	str	r7, [fp, #-100]
	add	r3, r2, r1
	strb	r0, [fp, #-110]
	str	r3, [fp, #-116]
	strb	r0, [fp, #-111]
	bls	.L1048
	add	r5, r5, #49152
	mov	r2, #3328
	add	r5, r5, #104
	sub	r0, fp, #116
	mov	r1, r5
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L1046
	ldr	r2, [r4, #212]
	sub	r1, fp, #116
	mov	r0, r5
	bl	InsertStreamSeg
	b	.L1041
.L1046:
	mvn	r0, #3
	b	.L1041
.L1043:
	str	r6, [sp]
	mov	r2, r8
	sub	r1, fp, #116
	mov	r0, r5
	mov	r3, #1
	bl	ProcessSegRoll
	b	.L1041
.L1048:
	movw	r3, #3323
	str	r7, [sp]
	mov	r1, r3
	ldr	r2, .L1049+4
	mov	r0, r6
	bl	dprint_normal
	mov	r0, r6
	b	.L1041
.L1047:
	ldr	r2, [r4, #600]
	mov	r3, r1
	str	r1, [sp]
	mov	r0, r5
	sub	r1, fp, #116
	bl	ProcessSegRoll
	b	.L1041
.L1050:
	.align	2
.L1049:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	UNWIND(.fnend)
	.size	ProcessLastUnfinishedSeg, .-ProcessLastUnfinishedSeg
	.align	2
	.global	SetPushRawOverState
	.type	SetPushRawOverState, %function
SetPushRawOverState:
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
	ldr	r3, [r0, #8]
	str	r1, [r0, #8]
	cmp	r1, #2
	cmpeq	r3, #3
	moveq	r3, #1
	movne	r3, #0
	mvneq	r3, #6
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetPushRawOverState, .-SetPushRawOverState
	.align	2
	.global	ProcessExceptionalStartCodeNum
	.type	ProcessExceptionalStartCodeNum, %function
ProcessExceptionalStartCodeNum:
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
	movw	r3, #3362
	mov	r4, r0
	str	r1, [sp]
	ldr	r2, .L1055
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	add	r0, r4, #80
	mov	r1, #1
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	DeleteRawPacket
.L1056:
	.align	2
.L1055:
	.word	.LC49
	UNWIND(.fnend)
	.size	ProcessExceptionalStartCodeNum, .-ProcessExceptionalStartCodeNum
	.global	__aeabi_uidiv
	.align	2
	.global	GetValidStartCodeNum
	.type	GetValidStartCodeNum, %function
GetValidStartCodeNum:
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
	ldr	r0, [r0, #24]
	bl	__aeabi_uidiv
	ldr	r3, [r4, #12]
	cmp	r0, r3
	movcs	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetValidStartCodeNum, .-GetValidStartCodeNum
	.align	2
	.global	ProcessNotMpeg4ScdUpMsg
	.type	ProcessNotMpeg4ScdUpMsg, %function
ProcessNotMpeg4ScdUpMsg:
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
	UNWIND(.pad #140)
	sub	sp, sp, #140
	add	r5, r0, #172032
	str	r1, [fp, #-140]
	mov	r4, r0
	ldr	r1, [r5, #284]
	add	r9, r0, #49152
	str	r2, [fp, #-164]
	movw	r3, #43691
	ldr	r2, [r5, #188]
	add	r9, r9, #104
	mov	ip, r1
	str	r0, [fp, #-136]
	str	r1, [fp, #-172]
	sub	r0, fp, #124
	str	r2, [fp, #-144]
	mov	r1, #0
	mov	r6, r2
	mov	r2, #80
	mov	r10, r1
	str	r3, [fp, #-168]
	mov	r8, ip, asl #2
	bl	memset
	ldr	r3, [fp, #-168]
	add	r2, r4, #80
	str	r9, [fp, #-128]
	mov	r7, r10
	str	r2, [fp, #-160]
	mov	r9, r10
	movt	r3, 43690
	str	r3, [fp, #-168]
	b	.L1059
.L1088:
	ldr	r3, [fp, #-136]
	rsb	r4, r1, r4
	cmp	r4, #3
	mov	r0, #1
	add	r2, r3, #49152
	ldr	r3, [r5, #128]
	str	r4, [fp, #-108]
	ldr	r2, [r2, #104]
	rsb	r3, r3, r1
	str	r1, [fp, #-112]
	add	r3, r2, r3
	strb	r0, [fp, #-118]
	str	r3, [fp, #-124]
	bhi	.L1061
	movw	r3, #3404
	str	r4, [sp]
	mov	r1, r3
	ldr	r2, .L1092
	mov	r0, #0
	bl	dprint_normal
.L1062:
	add	r6, r6, r8
	add	r9, r9, r8
	mov	r7, r10
.L1059:
	ldr	r3, [fp, #-140]
	cmp	r7, r3
	beq	.L1067
	ldr	r3, [fp, #-144]
	add	r10, r7, #1
	ldr	r1, [r6]
	add	r3, r3, r8
	ldr	r4, [r3, r9]
	cmp	r1, r4
	bls	.L1088
	ldr	r3, [fp, #-164]
	ldr	r2, [fp, #-128]
	ldr	lr, [r5, #128]
	ldr	r3, [r3, #16]
	cmp	r2, #0
	ldr	r2, [fp, #-136]
	rsb	r4, lr, r4
	rsb	r3, r1, r3
	add	r2, r2, #49152
	add	ip, r3, r4
	str	r2, [fp, #-132]
	beq	.L1068
	ldr	r0, [r5, #116]
	rsb	lr, lr, r1
	str	r1, [fp, #-112]
	cmp	ip, #3
	ldr	r1, [fp, #-132]
	add	r2, r0, #1536
	ldr	r0, [r5, #112]
	str	ip, [fp, #-108]
	rsb	r2, r0, r2
	ldr	r1, [r1, #104]
	ldr	r0, [fp, #-168]
	str	r1, [fp, #-148]
	umull	r0, r1, r2, r0
	strd	r0, [fp, #-156]
	ldr	r1, [fp, #-148]
	add	lr, r1, lr
	ldr	r1, [fp, #-152]
	str	lr, [fp, #-124]
	mov	r0, r1, lsr #10
	mov	r1, r0, asl #11
	sub	r1, r1, r0, asl #9
	rsb	r2, r1, r2
	rsb	r2, r2, #1536
	bls	.L1078
	cmp	r2, #2
	bls	.L1067
.L1079:
	mov	r2, #3440
	ldr	r1, [fp, #-128]
	sub	r0, fp, #124
	str	r3, [fp, #-156]
	bl	CheckSegValid
	subs	r3, r0, #0
	mov	r2, r3
	bne	.L1067
	ldr	r3, [fp, #-156]
	cmp	r4, #0
	str	r3, [fp, #-108]
	bne	.L1070
	strb	r4, [fp, #-119]
	mov	r2, #1
	strb	r2, [fp, #-118]
	sub	r3, fp, #124
	ldr	r1, [r6, #4]
	add	r2, r5, #248
	ldr	ip, [r5, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-160]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	ldr	r0, [fp, #-128]
	bl	InsertStreamSeg
	b	.L1062
.L1061:
	mov	r2, #3408
	ldr	r1, [fp, #-128]
	sub	r0, fp, #124
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L1067
	strb	r0, [fp, #-119]
	sub	r3, fp, #124
	ldr	r1, [r6, #4]
	add	r2, r5, #248
	ldr	ip, [r5, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-160]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	ldr	r0, [fp, #-128]
	bl	InsertStreamSeg
	cmp	r0, #0
	beq	.L1062
.L1067:
	cmp	r7, #0
	ble	.L1089
	ldr	r3, [fp, #-164]
	ldr	r1, [r3, #12]
	sub	r1, r1, #1
	cmp	r1, r7
	bhi	.L1090
.L1074:
	cmp	r1, r7
	beq	.L1091
.L1077:
	ldr	r2, [fp, #-164]
	mov	r1, #0
	ldr	r0, [fp, #-136]
	bl	SetLastUnfinishedSegInfo
.L1058:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1070:
	mov	r7, r2
	strb	r2, [fp, #-118]
	strb	r7, [fp, #-119]
	sub	r3, fp, #124
	ldr	r1, [r6, #4]
	add	r2, r5, #248
	ldr	ip, [r5, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-160]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	ldr	r0, [fp, #-128]
	bl	InsertStreamSeg
	ldr	r3, [fp, #-132]
	ldr	ip, [r5, #128]
	sub	r1, fp, #124
	ldr	r2, [r5, #212]
	ldr	r3, [r3, #104]
	ldr	r0, [fp, #-128]
	str	r4, [fp, #-108]
	str	r3, [fp, #-124]
	mov	r3, #1
	strb	r7, [fp, #-119]
	str	ip, [fp, #-112]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	b	.L1062
.L1068:
	ldr	r2, [fp, #-132]
	cmp	ip, #3
	rsb	lr, lr, r1
	str	r1, [fp, #-112]
	str	ip, [fp, #-108]
	ldr	r2, [r2, #104]
	add	lr, r2, lr
	str	lr, [fp, #-124]
	bhi	.L1079
.L1078:
	movw	r3, #3436
	str	ip, [sp]
	mov	r1, r3
	ldr	r2, .L1092
	mov	r0, #0
	bl	dprint_normal
	b	.L1062
.L1090:
	ldr	r3, [fp, #-172]
	ldr	r2, [fp, #-144]
	ldr	r0, [fp, #-136]
	mul	r3, r3, r7
	add	r3, r3, #1
	ldr	r1, [r2, r3, asl #2]
	bic	r1, r1, #-1073741824
	cmn	r1, #-1073741819
	movls	r4, r1
	movhi	r4, #0
	bl	ResetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-160]
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1089:
	blt	.L1077
	ldr	r3, [fp, #-164]
	ldr	r1, [r3, #12]
	sub	r1, r1, #1
	b	.L1074
.L1091:
	ldr	r4, [r5, #164]
	ldr	r0, [fp, #-136]
	ldr	r2, [fp, #-164]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-160]
	bl	DeleteRawLen
	b	.L1058
.L1093:
	.align	2
.L1092:
	.word	.LC48
	UNWIND(.fnend)
	.size	ProcessNotMpeg4ScdUpMsg, .-ProcessNotMpeg4ScdUpMsg
	.align	2
	.global	GetMpeg4ModeFlag
	.type	GetMpeg4ModeFlag, %function
GetMpeg4ModeFlag:
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
	add	r6, r0, #172032
	subs	r8, r1, #0
	ldr	r7, [r6, #284]
	ldr	r4, [r6, #188]
	beq	.L1094
	mov	r7, r7, asl #2
	mov	r5, #0
	movw	r9, #438
	b	.L1104
.L1103:
	mov	r3, #2
	str	r3, [r6, #232]
.L1100:
	add	r5, r5, #1
	add	r4, r4, r7
	cmp	r5, r8
	beq	.L1094
.L1104:
	ldr	r0, [r4]
	bl	MEM_Phy2Vir
	mov	ip, #1
	mov	r1, #0
	cmp	r0, #0
	beq	.L1113
	ldrb	lr, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r2, [r0, #3]	@ zero_extendqisi2
	mov	lr, lr, asl #16
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	orr	r3, lr, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, r0, asl #8
	bic	r2, r3, #2032
	cmp	r3, r9
	cmpne	r3, #288
	bic	r2, r2, #15
	streq	ip, [r6, #232]
	streq	r1, [r6, #236]
	cmp	r2, #32768
	bne	.L1100
	ldr	r3, [r6, #232]
	cmp	r3, #1
	bne	.L1103
	ldr	r3, [r6, #236]
	add	r3, r3, #1
	str	r3, [r6, #236]
	cmp	r3, #30
	bls	.L1100
	ldr	r3, .L1114
	mov	r1, #21
	ldr	r10, [r3]
	mov	r3, #0
	mov	r2, r3
	cmp	r10, r3
	beq	.L1103
	ldr	r0, [r6, #212]
	blx	r10
	b	.L1103
.L1113:
	movw	r1, #3505
	ldr	r3, .L1114+4
	str	r1, [sp]
	mov	r0, ip
	ldr	r2, .L1114+8
	bl	dprint_normal
.L1094:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1115:
	.align	2
.L1114:
	.word	g_EventReportFunc
	.word	.LANCHOR1+1028
	.word	.LC50
	UNWIND(.fnend)
	.size	GetMpeg4ModeFlag, .-GetMpeg4ModeFlag
	.align	2
	.global	ProcessMpeg4ScdUpMsg
	.type	ProcessMpeg4ScdUpMsg, %function
ProcessMpeg4ScdUpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #220)
	sub	sp, sp, #220
	add	r5, r0, #172032
	mov	r7, r0
	mov	r9, r1
	ldr	r3, [r5, #284]
	mov	r6, r2
	str	r0, [fp, #-220]
	sub	r0, fp, #204
	str	r1, [fp, #-248]
	mov	r1, #0
	str	r3, [fp, #-244]
	mov	r10, #0
	ldr	r3, [r5, #188]
	str	r2, [fp, #-236]
	mov	r2, #80
	mov	r8, r3
	str	r3, [fp, #-216]
	bl	memset
	mov	r2, #80
	mov	r1, #0
	sub	r0, fp, #124
	bl	memset
	ldr	r0, [r5, #128]
	bl	MEM_Phy2Vir
	mov	r4, r0
	ldr	r0, [r6, #16]
	bl	MEM_Phy2Vir
	ldr	r2, .L1169
	mov	r1, r4
	add	r6, r7, #49152
	add	r6, r6, #104
	mov	r4, r8
	ldr	r3, [r2, #52]
	mov	r2, #4
	blx	r3
	mov	r1, r9
	mov	r0, r7
	bl	GetMpeg4ModeFlag
	movw	ip, #43691
	mov	r2, r9
	mov	r1, r8
	mov	r0, r7
	mov	r9, ip
	bl	GetNextVop
	ldr	r3, [fp, #-244]
	mov	ip, r9
	movt	ip, 43690
	str	ip, [fp, #-240]
	mov	r8, r3, asl #2
	add	r3, r7, #80
	mov	r7, r10
	str	r3, [fp, #-228]
	mov	r10, r6
	mov	r6, r7
	str	r0, [fp, #-212]
	b	.L1117
.L1164:
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L1119
	ldr	r3, [fp, #-108]
	movw	r2, #3576
	mov	r1, r10
	sub	r0, fp, #124
	add	r9, r3, r9
	str	r9, [fp, #-108]
	bl	CheckSegValid
	subs	r3, r0, #0
	bne	.L1123
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	mov	r0, r10
	strb	r3, [fp, #-119]
	str	r3, [fp, #-224]
	bl	InsertStreamSeg
	ldr	r3, [fp, #-224]
	mov	r2, #80
	mov	r1, r3
	ldr	r3, .L1169
	ldr	r3, [r3, #48]
	mov	r9, r0
	sub	r0, fp, #124
	blx	r3
	cmp	r9, #0
	bne	.L1123
.L1124:
	ldr	r7, [fp, #-208]
	add	r4, r4, r8
	add	r6, r6, r8
.L1117:
	ldr	r3, [fp, #-212]
	cmp	r7, r3
	beq	.L1123
	ldr	r3, [fp, #-216]
	add	r1, r7, #1
	ldr	r2, [r4]
	add	r3, r3, r8
	str	r1, [fp, #-208]
	ldr	r0, [r3, r6]
	rsb	r9, r2, r0
	cmp	r9, #3
	bgt	.L1164
	sub	r3, r9, #1
	cmp	r3, #2
	bls	.L1165
	ldr	r3, [fp, #-236]
	cmp	r10, #0
	ldr	r1, [fp, #-220]
	ldr	lr, [r5, #128]
	ldr	r3, [r3, #16]
	add	r9, r1, #49152
	rsb	r1, lr, r0
	str	r1, [fp, #-224]
	rsb	r3, r2, r3
	str	r3, [fp, #-232]
	add	ip, r3, r1
	beq	.L1135
	ldr	r3, [r5, #116]
	rsb	lr, lr, r2
	ldr	r1, [r5, #112]
	cmp	ip, #3
	add	r3, r3, #1536
	str	r2, [fp, #-192]
	rsb	r3, r1, r3
	ldr	r1, [fp, #-240]
	ldr	r2, [r9, #104]
	str	ip, [fp, #-188]
	umull	r0, r1, r3, r1
	add	lr, r2, lr
	str	lr, [fp, #-204]
	mov	r1, r1, lsr #10
	mov	r2, r1, asl #11
	sub	r2, r2, r1, asl #9
	rsb	r3, r2, r3
	rsb	r3, r3, #1536
	bls	.L1149
	cmp	r3, #2
	bls	.L1123
.L1150:
	movw	r2, #3654
	mov	r1, r10
	sub	r0, fp, #204
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L1123
	ldr	r3, [fp, #-224]
	cmp	r3, #0
	ldr	r3, [r5, #232]
	bne	.L1137
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	mov	ip, #0
	ldreq	r2, [fp, #-224]
	orrne	r3, r3, #1
	bfieq	r3, r2, #0, #1
	strb	r3, [fp, #-132]
	ldr	r3, [r4, #4]
	mov	r2, #1
	ldrb	r1, [fp, #-132]	@ zero_extendqisi2
	mov	r3, r3, lsr #30
	bfi	r1, r3, #1, #1
	strb	r1, [fp, #-132]
	ldrh	r0, [r4, #10]
	sub	r3, fp, #204
	uxtb	r1, r1
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r0, [fp, #-232]
	ldr	r1, [r4, #8]
	strb	r2, [fp, #-198]
	add	r2, r5, #248
	str	r0, [fp, #-188]
	and	r1, r1, #7
	ldrh	r0, [fp, #-132]
	strb	ip, [fp, #-199]
	bfi	r0, r1, #7, #4
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	ip, [r5, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-228]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #204
	mov	r0, r10
	bl	InsertStreamSeg
	b	.L1124
.L1119:
	ldr	r3, [fp, #-220]
	str	r2, [fp, #-192]
	add	r1, r3, #49152
	ldr	r3, [r5, #128]
	str	r9, [fp, #-188]
	ldr	r0, [r1, #104]
	rsb	r3, r3, r2
	mov	r1, r10
	movw	r2, #3597
	add	r3, r0, r3
	sub	r0, fp, #204
	str	r3, [fp, #-204]
	mov	r3, #1
	strb	r3, [fp, #-198]
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L1123
	ldr	r3, [r5, #232]
	add	r2, r5, #248
	ldr	ip, [r5, #212]
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r1, [r4, #4]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	mov	r1, r1, lsr #30
	bfi	r0, r1, #1, #1
	strb	r0, [fp, #-132]
	ldrh	lr, [r4, #10]
	uxtb	r1, r0
	ldr	r0, [fp, #-228]
	bfi	r1, lr, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	lr, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	lr, r1, #3, #4
	strb	lr, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrh	lr, [fp, #-132]
	and	r1, r1, #7
	bfi	lr, r1, #7, #4
	strh	lr, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	str	ip, [sp]
	bic	r1, r1, #-1073741824
	cmn	r1, #-1073741819
	movhi	r1, #0
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #204
	mov	r0, r10
	mov	r3, #0
	strb	r3, [fp, #-199]
	bl	InsertStreamSeg
	cmp	r0, #0
	beq	.L1124
.L1123:
	cmp	r7, #0
	ble	.L1122
	ldr	r3, [fp, #-236]
	ldr	r3, [r3, #12]
	sub	r3, r3, #1
	cmp	r3, r7
	bls	.L1145
	ldr	r3, [fp, #-244]
	ldr	r0, [fp, #-220]
	mul	r7, r3, r7
	ldr	r3, [fp, #-216]
	add	r7, r7, #1
	ldr	r1, [r3, r7, asl #2]
	bic	r1, r1, #-1073741824
	cmn	r1, #-1073741819
	movls	r4, r1
	movhi	r4, #0
	bl	ResetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-228]
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1165:
	str	r2, [fp, #-224]
	bl	MEM_Phy2Vir
	ldr	r2, [fp, #-224]
	subs	ip, r0, #0
	beq	.L1166
	ldrb	r1, [ip, #1]	@ zero_extendqisi2
	ldrb	r3, [ip]	@ zero_extendqisi2
	ldrb	r0, [ip, #2]	@ zero_extendqisi2
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r0, asl #8
	cmp	r3, #256
	beq	.L1124
	ldr	r3, [r5, #232]
	cmp	r3, #1
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-52]
	ldr	r1, [r4, #4]
	ldrb	r0, [fp, #-52]	@ zero_extendqisi2
	ldr	r3, [fp, #-220]
	mov	r1, r1, lsr #30
	bfi	r0, r1, #1, #1
	strb	r0, [fp, #-52]
	ldrh	ip, [r4, #10]
	add	r3, r3, #49152
	uxtb	r1, r0
	mov	r0, #1
	bfi	r1, ip, #2, #1
	strb	r1, [fp, #-52]
	ldr	r1, [r4, #8]
	ldrb	ip, [fp, #-52]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	ldr	r3, [r3, #104]
	bfi	ip, r1, #3, #4
	strb	ip, [fp, #-52]
	ldr	ip, [r5, #128]
	ldr	r1, [r4, #8]
	str	r2, [fp, #-112]
	rsb	r2, ip, r2
	ldrh	ip, [fp, #-52]
	and	r1, r1, #7
	add	r2, r3, r2
	strb	r0, [fp, #-118]
	bfi	ip, r1, #7, #4
	str	r2, [fp, #-124]
	strh	ip, [fp, #-52]	@ movhi
	sub	r3, fp, #124
	str	r9, [fp, #-108]
	add	r2, r5, #248
	ldr	r1, [r4, #4]
	ldr	ip, [r5, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-228]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	b	.L1124
.L1137:
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	ldr	ip, [r5, #212]
	mov	r7, #0
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r2, [r4, #4]
	ldrb	r1, [fp, #-132]	@ zero_extendqisi2
	mov	r2, r2, lsr #30
	bfi	r1, r2, #1, #1
	strb	r1, [fp, #-132]
	ldrh	r0, [r4, #10]
	add	r2, r5, #248
	uxtb	r1, r1
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r0, [fp, #-232]
	ldr	r1, [r4, #8]
	strb	r7, [fp, #-198]
	str	r0, [fp, #-188]
	and	r1, r1, #7
	ldrh	r0, [fp, #-132]
	strb	r7, [fp, #-199]
	bfi	r0, r1, #7, #4
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	r0, [fp, #-228]
	bic	r1, r1, #-1073741824
	str	ip, [sp]
	cmn	r1, #-1073741820
	movcs	r1, r7
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #204
	mov	r0, r10
	bl	InsertStreamSeg
	ldr	lr, [r9, #104]
	ldr	ip, [r5, #128]
	sub	r1, fp, #204
	ldr	r2, [r5, #212]
	mov	r0, r10
	str	lr, [fp, #-204]
	mov	r3, #1
	ldr	lr, [fp, #-224]
	strb	r7, [fp, #-199]
	str	ip, [fp, #-192]
	str	lr, [fp, #-188]
	strb	r3, [fp, #-198]
	bl	InsertStreamSeg
	b	.L1124
.L1135:
	ldr	r3, [r9, #104]
	cmp	ip, #3
	rsb	lr, lr, r2
	str	r2, [fp, #-192]
	add	lr, r3, lr
	str	ip, [fp, #-188]
	str	lr, [fp, #-204]
	bhi	.L1150
.L1149:
	movw	r3, #3650
	str	ip, [sp]
	mov	r1, r3
	ldr	r2, .L1169+4
	mov	r0, #0
	bl	dprint_normal
	b	.L1124
.L1145:
	beq	.L1167
.L1122:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-248]
	clz	r3, r3
	cmp	r2, #1024
	mov	r3, r3, lsr #5
	movls	r3, #0
	cmp	r3, #0
	bne	.L1168
.L1148:
	ldr	r0, [fp, #-220]
	bl	ResetLastUnfinishedSegInfo
.L1116:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1168:
	mov	r3, r2
	movw	r1, #3703
	ldr	r2, .L1169+8
	mov	r0, #0
	bl	dprint_normal
	ldr	r0, [fp, #-228]
	mov	r1, #1
	bl	DeleteRawPacket
	b	.L1148
.L1167:
	ldr	r4, [r5, #164]
	mov	r1, r7
	ldr	r0, [fp, #-220]
	ldr	r2, [fp, #-236]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-228]
	bl	DeleteRawLen
	b	.L1116
.L1166:
	movw	r3, #3619
	ldr	r2, .L1169+12
	mov	r1, r3
	bl	dprint_normal
	b	.L1116
.L1170:
	.align	2
.L1169:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LC52
	.word	.LC51
	UNWIND(.fnend)
	.size	ProcessMpeg4ScdUpMsg, .-ProcessMpeg4ScdUpMsg
	.align	2
	.global	ProcessH263ScdUpMsg
	.type	ProcessH263ScdUpMsg, %function
ProcessH263ScdUpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #236)
	sub	sp, sp, #236
	add	r9, r0, #172032
	mov	r5, r0
	mov	r6, r1
	ldr	r3, [r9, #284]
	mov	r10, r2
	str	r0, [fp, #-224]
	sub	r0, fp, #204
	str	r1, [fp, #-248]
	mov	r1, #0
	str	r2, [fp, #-240]
	mov	r2, #80
	mov	r7, r3
	str	r3, [fp, #-212]
	ldr	r8, [r9, #188]
	bl	memset
	mov	r2, #80
	mov	r1, #0
	sub	r0, fp, #124
	bl	memset
	ldr	r0, [r9, #128]
	bl	MEM_Phy2Vir
	add	r3, r5, #49152
	mov	r4, r0
	ldr	r0, [r10, #16]
	mov	r10, r3
	bl	MEM_Phy2Vir
	ldr	r3, .L1247
	mov	r1, r4
	mov	r2, #4
	mov	r4, r5
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r5
	mov	r1, r6
	bl	GetMpeg4ModeFlag
	movw	r3, #43691
	mov	r0, r5
	mov	r2, r6
	mov	r1, r8
	mov	r5, r3
	bl	GetNextVop
	mov	r3, r7, asl #2
	str	r3, [fp, #-216]
	add	r3, r10, #104
	str	r3, [fp, #-220]
	add	r3, r4, #80
	str	r3, [fp, #-232]
	mov	r3, r5
	mov	r5, #0
	movt	r3, 43690
	str	r3, [fp, #-244]
	str	r0, [fp, #-208]
.L1172:
	ldr	r3, [fp, #-208]
	cmp	r3, r5
	bls	.L1214
	ldr	r3, [fp, #-212]
	mul	r3, r3, r5
	add	r2, r8, r3, lsl #2
	ldr	r6, [r8, r3, asl #2]
	ldmib	r2, {r1, r2}
	tst	r1, #1073741824
	beq	.L1173
	orr	r2, r2, r2, lsr #4
	tst	r2, #7
	addne	r5, r5, #1
	bne	.L1172
.L1173:
	ldr	r2, [fp, #-208]
	add	r4, r5, #1
	cmp	r2, r4
	mov	r1, r4
	bcc	.L1175
	ldr	r2, [fp, #-212]
	add	r3, r3, r2
	add	r2, r8, r3, lsl #2
	ldr	r10, [r8, r3, asl #2]
	ldr	r3, [r2, #4]
	ldr	r1, [r2, #8]
	tst	r3, #1073741824
	mov	r2, r1, lsr #4
	beq	.L1209
	ldr	r0, [fp, #-216]
	add	r3, r5, #2
	mov	r5, r4
	mla	r3, r3, r0, r8
.L1177:
	orr	r2, r2, r1
	tst	r2, #7
	mov	r0, r3
	mov	r4, r5
	beq	.L1176
	ldr	r2, [fp, #-208]
	add	r5, r5, #1
	cmp	r2, r5
	mov	r4, r5
	bcc	.L1176
	ldr	r2, [r0, #4]
	ldr	r1, [r3, #8]
	tst	r2, #1073741824
	ldr	r2, [fp, #-216]
	ldr	r10, [r3]
	add	r3, r3, r2
	mov	r2, r1, lsr #4
	bne	.L1177
.L1176:
	cmp	r10, #0
	beq	.L1214
	rsb	r7, r6, r10
	cmp	r7, #3
	ble	.L1179
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L1180
	ldr	r6, [fp, #-220]
	movw	r2, #3784
	ldr	r3, [fp, #-108]
	sub	r0, fp, #124
	mov	r1, r6
	add	r7, r3, r7
	str	r7, [fp, #-108]
	bl	CheckSegValid
	subs	r4, r0, #0
	bne	.L1214
	ldr	r2, [r9, #212]
	sub	r1, fp, #124
	mov	r0, r6
	strb	r4, [fp, #-119]
	bl	InsertStreamSeg
	ldr	r3, .L1247
	mov	r1, r4
	mov	r2, #80
	ldr	r3, [r3, #48]
	mov	r6, r0
	sub	r0, fp, #124
	blx	r3
	cmp	r6, #0
	beq	.L1172
.L1214:
	mov	r1, r5
.L1175:
	cmp	r1, #0
	ble	.L1202
	ldr	r3, [fp, #-240]
	ldr	r3, [r3, #12]
	sub	r3, r3, #1
	cmp	r1, r3
	bcs	.L1203
	ldr	r3, [fp, #-212]
	ldr	r0, [fp, #-224]
	mul	r3, r3, r1
	add	r3, r3, #1
	ldr	r1, [r8, r3, asl #2]
	bic	r1, r1, #-1073741824
	cmn	r1, #-1073741819
	movls	r4, r1
	movhi	r4, #0
	bl	ResetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-232]
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1179:
	sub	r3, r7, #1
	cmp	r3, #2
	bls	.L1242
	ldr	r3, [fp, #-240]
	ldr	r2, [r9, #128]
	ldr	lr, [r3, #16]
	rsb	r1, r2, r10
	ldr	r3, [fp, #-220]
	str	r1, [fp, #-228]
	cmp	r3, #0
	ldr	r3, [fp, #-224]
	add	r7, r3, #49152
	rsb	r3, r6, lr
	add	ip, r1, r3
	str	r3, [fp, #-236]
	beq	.L1190
	ldr	r3, [r9, #116]
	rsb	r2, r2, r6
	ldr	r1, [r9, #112]
	cmp	ip, #3
	add	r3, r3, #1536
	ldr	r0, [r7, #104]
	rsb	r3, r1, r3
	ldr	r1, [fp, #-244]
	add	r2, r0, r2
	str	r2, [fp, #-204]
	str	r6, [fp, #-192]
	umull	r0, r1, r3, r1
	str	ip, [fp, #-188]
	mov	r1, r1, lsr #10
	mov	r2, r1, asl #11
	sub	r2, r2, r1, asl #9
	rsb	r3, r2, r3
	rsb	r3, r3, #1536
	bls	.L1207
	cmp	r3, #2
	bls	.L1192
.L1208:
	movw	r2, #3862
	ldr	r1, [fp, #-220]
	sub	r0, fp, #204
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L1243
	ldr	r3, [fp, #-228]
	cmp	r3, #0
	ldr	r3, [fp, #-212]
	mul	r4, r3, r4
	ldr	r3, [r9, #232]
	bne	.L1194
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	add	r4, r8, r4, lsl #2
	mov	r1, #1
	ldreq	r2, [fp, #-228]
	orrne	r3, r3, #1
	bfieq	r3, r2, #0, #1
	strb	r3, [fp, #-132]
	ldr	r3, [r4, #4]
	ldrb	r2, [fp, #-132]	@ zero_extendqisi2
	strb	r1, [fp, #-198]
	mov	r1, #0
	mov	r3, r3, lsr #30
	strb	r1, [fp, #-199]
	bfi	r2, r3, #1, #1
	strb	r2, [fp, #-132]
	ldrh	r0, [r4, #10]
	sub	r3, fp, #204
	uxtb	r1, r2
	add	r2, r9, #248
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r0, [fp, #-236]
	ldr	r1, [r4, #8]
	str	r0, [fp, #-188]
	and	r1, r1, #7
	ldrh	r0, [fp, #-132]
	bfi	r0, r1, #7, #4
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	ip, [r9, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-232]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	ldr	r2, [r9, #212]
	sub	r1, fp, #204
	ldr	r0, [fp, #-220]
	bl	InsertStreamSeg
	b	.L1172
.L1180:
	ldr	r3, [fp, #-224]
	sub	r0, fp, #204
	ldr	r2, [r9, #128]
	add	r3, r3, #49152
	str	r6, [fp, #-192]
	ldr	r1, [fp, #-220]
	rsb	r6, r2, r6
	ldr	r3, [r3, #104]
	movw	r2, #3805
	str	r7, [fp, #-188]
	add	r6, r3, r6
	mov	r3, #1
	str	r6, [fp, #-204]
	strb	r3, [fp, #-198]
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L1214
	ldr	r3, [fp, #-212]
	add	r2, r9, #248
	mul	r4, r3, r4
	ldr	r3, [r9, #232]
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	add	r4, r8, r4, lsl #2
	strb	r3, [fp, #-132]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	sub	r3, fp, #204
	ldr	r1, [r4, #4]
	mov	r1, r1, lsr #30
	bfi	r0, r1, #1, #1
	strb	r0, [fp, #-132]
	ldrh	ip, [r4, #10]
	uxtb	r1, r0
	ldr	r0, [fp, #-232]
	bfi	r1, ip, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	ip, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	ip, r1, #3, #4
	strb	ip, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrh	ip, [fp, #-132]
	and	r1, r1, #7
	bfi	ip, r1, #7, #4
	strh	ip, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	ip, [r9, #212]
	bic	r1, r1, #-1073741824
	cmn	r1, #-1073741819
	str	ip, [sp]
	movhi	r1, #0
	bl	GetSegPts
	ldr	r2, [r9, #212]
	sub	r1, fp, #204
	ldr	r0, [fp, #-220]
	mov	r3, #0
	strb	r3, [fp, #-199]
	bl	InsertStreamSeg
	cmp	r0, #0
	beq	.L1172
	b	.L1214
.L1242:
	mov	r0, r10
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L1244
	ldrb	r2, [r1, #1]	@ zero_extendqisi2
	ldrb	r3, [r1]	@ zero_extendqisi2
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	orr	r3, r2, r3, asl #24
	orr	r3, r3, r1, asl #8
	cmp	r3, #256
	beq	.L1172
	ldr	r3, [fp, #-212]
	mov	r0, #1
	ldr	r2, [fp, #-224]
	mul	r4, r3, r4
	ldr	r3, [r9, #232]
	add	r2, r2, #49152
	cmp	r3, #1
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	ldr	r2, [r2, #104]
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	add	r4, r8, r4, lsl #2
	strb	r3, [fp, #-52]
	ldrb	r1, [fp, #-52]	@ zero_extendqisi2
	ldr	r3, [r4, #4]
	strb	r0, [fp, #-118]
	ldr	r0, [r9, #128]
	mov	r3, r3, lsr #30
	bfi	r1, r3, #1, #1
	strb	r1, [fp, #-52]
	uxtb	r3, r1
	ldrh	r1, [r4, #10]
	bfi	r3, r1, #2, #1
	strb	r3, [fp, #-52]
	ldr	r3, [r4, #8]
	ldrb	r1, [fp, #-52]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #3
	bfi	r1, r3, #3, #4
	strb	r1, [fp, #-52]
	ldr	r1, [r4, #8]
	sub	r3, fp, #124
	str	r6, [fp, #-112]
	rsb	r6, r0, r6
	ldrh	r0, [fp, #-52]
	and	r1, r1, #7
	add	r6, r2, r6
	str	r7, [fp, #-108]
	bfi	r0, r1, #7, #4
	str	r6, [fp, #-124]
	strh	r0, [fp, #-52]	@ movhi
	add	r2, r9, #248
	ldr	r1, [r4, #4]
	ldr	ip, [r9, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-232]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, #0
	bl	GetSegPts
	b	.L1172
.L1194:
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	add	r4, r8, r4, lsl #2
	mov	r6, #0
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r2, [r4, #4]
	ldrb	r1, [fp, #-132]	@ zero_extendqisi2
	strb	r6, [fp, #-198]
	mov	r2, r2, lsr #30
	strb	r6, [fp, #-199]
	bfi	r1, r2, #1, #1
	strb	r1, [fp, #-132]
	ldrh	r0, [r4, #10]
	add	r2, r9, #248
	uxtb	r1, r1
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r0, [fp, #-236]
	ldr	r1, [r4, #8]
	str	r0, [fp, #-188]
	and	r1, r1, #7
	ldrh	r0, [fp, #-132]
	bfi	r0, r1, #7, #4
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	ip, [r9, #212]
	bic	r1, r1, #-1073741824
	ldr	r0, [fp, #-232]
	cmn	r1, #-1073741820
	str	ip, [sp]
	movcs	r1, r6
	bl	GetSegPts
	ldr	r4, [fp, #-220]
	ldr	r2, [r9, #212]
	sub	r1, fp, #204
	mov	r0, r4
	bl	InsertStreamSeg
	ldr	lr, [r7, #104]
	ldr	ip, [r9, #128]
	sub	r1, fp, #204
	ldr	r2, [r9, #212]
	mov	r0, r4
	str	lr, [fp, #-204]
	mov	r3, #1
	ldr	lr, [fp, #-228]
	strb	r6, [fp, #-199]
	str	ip, [fp, #-192]
	str	lr, [fp, #-188]
	strb	r3, [fp, #-198]
	bl	InsertStreamSeg
	b	.L1172
.L1190:
	ldr	r3, [r7, #104]
	cmp	ip, #3
	rsb	r2, r2, r6
	str	r6, [fp, #-192]
	add	r2, r3, r2
	str	ip, [fp, #-188]
	str	r2, [fp, #-204]
	bhi	.L1208
.L1207:
	movw	r3, #3858
	str	ip, [sp]
	mov	r1, r3
	ldr	r2, .L1247+4
	mov	r0, #0
	bl	dprint_normal
	b	.L1172
.L1203:
	beq	.L1245
.L1202:
	ldr	r3, [fp, #-208]
	ldr	r2, [fp, #-248]
	clz	r3, r3
	cmp	r2, #1024
	mov	r3, r3, lsr #5
	movls	r3, #0
	cmp	r3, #0
	bne	.L1246
.L1206:
	ldr	r0, [fp, #-224]
	bl	ResetLastUnfinishedSegInfo
.L1171:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1209:
	mov	r5, r4
	b	.L1176
.L1246:
	mov	r3, r2
	movw	r1, #3912
	ldr	r2, .L1247+8
	mov	r0, #0
	bl	dprint_normal
	ldr	r0, [fp, #-232]
	mov	r1, #1
	bl	DeleteRawPacket
	b	.L1206
.L1245:
	ldr	r4, [r9, #164]
	ldr	r0, [fp, #-224]
	ldr	r2, [fp, #-240]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-232]
	bl	DeleteRawLen
	b	.L1171
.L1243:
	ldr	r3, [fp, #-240]
	ldr	lr, [r3, #16]
.L1192:
	movw	r3, #3864
	str	r10, [sp, #20]
	mov	r1, r3
	stmia	sp, {r3, r5}
	str	lr, [sp, #16]
	mov	r0, #32
	str	r6, [sp, #12]
	str	r5, [sp, #8]
	ldr	r3, .L1247+12
	ldr	r2, .L1247+16
	bl	dprint_normal
	mov	r1, r5
	b	.L1175
.L1244:
	movw	r3, #3827
	ldr	r2, .L1247+20
	mov	r1, r3
	bl	dprint_normal
	b	.L1171
.L1248:
	.align	2
.L1247:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LC52
	.word	.LANCHOR1+1048
	.word	.LC53
	.word	.LC51
	UNWIND(.fnend)
	.size	ProcessH263ScdUpMsg, .-ProcessH263ScdUpMsg
	.align	2
	.global	ProcessScdReturn
	.type	ProcessScdReturn, %function
ProcessScdReturn:
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
	add	r4, r0, #172032
	mov	r5, r0
	ldr	r3, [r4, #168]
	cmp	r3, #3
	mov	r3, #2
	streq	r3, [r4, #168]
	mvneq	r0, #6
	beq	.L1251
	str	r3, [r4, #168]
	sub	r0, fp, #60
	bl	ReadScdStateReg
	ldr	r6, [fp, #-48]
	movw	r3, #34464
	movt	r3, 1
	cmp	r6, r3
	bls	.L1252
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L1258
.L1252:
	ldr	r1, [r4, #284]
	ldr	r0, [fp, #-36]
	bl	__aeabi_uidiv
	cmp	r0, r6
	movcc	r7, r0
	movcs	r7, r6
	cmp	r6, r7
	bhi	.L1259
.L1254:
	sub	r2, fp, #60
	mov	r1, r7
	mov	r0, r5
	bl	ProcessLastUnfinishedSeg
	clz	r3, r7
	mov	r3, r3, lsr #5
	cmp	r0, #0
	moveq	r6, r3
	orrne	r6, r3, #1
	cmp	r6, #0
	bne	.L1251
	ldr	r3, [r5, #12]
	sub	r2, fp, #60
	sub	r1, r7, #1
	mov	r0, r5
	cmp	r3, #2
	cmpne	r3, #14
	moveq	r4, #1
	movne	r4, #0
	beq	.L1260
	cmp	r3, #4
	beq	.L1261
	bl	ProcessNotMpeg4ScdUpMsg
	mov	r0, r4
.L1251:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1259:
	ldrsb	r3, [r5, #2]
	cmp	r3, #1
	moveq	r3, #0
	streqb	r3, [r5, #2]
	b	.L1254
.L1260:
	bl	ProcessMpeg4ScdUpMsg
	mov	r0, r6
	b	.L1251
.L1258:
	mov	r0, r5
	mov	r1, r6
	bl	ProcessExceptionalStartCodeNum
	mvn	r0, #6
	b	.L1251
.L1261:
	bl	ProcessH263ScdUpMsg
	mov	r0, r4
	b	.L1251
	UNWIND(.fnend)
	.size	ProcessScdReturn, .-ProcessScdReturn
	.align	2
	.global	NeedReadStream
	.type	NeedReadStream, %function
NeedReadStream:
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
	ldr	r3, [r1, #52]
	cmp	r3, #0
	bne	.L1263
	ldr	r3, [r1, #56]
	cmp	r3, #0
	beq	.L1265
.L1263:
	add	r1, r1, #172032
	ldr	r3, [r1, #152]
	cmp	r3, #8
	bgt	.L1266
	ldr	r2, .L1267
	cmp	r3, #0
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r2, r0, asl #2]
	ldr	r0, [r2, #120]
	cmp	r0, #1
	moveq	r0, r3
	orrne	r0, r3, #1
	ldmfd	sp, {fp, sp, pc}
.L1266:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1265:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1268:
	.align	2
.L1267:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	NeedReadStream, .-NeedReadStream
	.align	2
	.global	FillRawData
	.type	FillRawData, %function
FillRawData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #124)
	sub	sp, sp, #124
	ldr	r3, .L1307
	ldr	r7, .L1307+4
	mov	r4, r0
	mov	r2, #96
	mov	r1, #0
	ldr	r5, [r3, r0, asl #3]
	sub	r0, fp, #140
	ldr	r3, [r7, #48]
	blx	r3
	cmp	r5, #0
	beq	.L1269
	ldr	r3, [r5, #12]
	cmp	r3, #20
	beq	.L1269
	ldr	r3, .L1307+8
	mov	r8, #100
	mov	r2, r4, asl #24
	ldr	r6, .L1307+12
	str	r2, [fp, #-152]
	mla	r3, r8, r4, r3
	str	r3, [fp, #-144]
	b	.L1284
.L1306:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	bne	.L1271
.L1272:
	mov	r0, r4
	bl	GetRawState
	cmp	r0, #0
	bne	.L1302
	sub	r1, fp, #140
	mov	r0, r4
	bl	ReadRawStreamData
	cmp	r0, #0
	bne	.L1269
	add	r10, r5, #172032
	ldr	r2, [fp, #-132]
	ldr	r1, [r7]
	ldr	ip, [r10, #264]
	ldr	lr, [r10, #288]
	ldr	r0, [r10, #292]
	add	ip, ip, r2
	add	r2, r2, lr
	str	ip, [r10, #264]
	str	r2, [r10, #288]
	add	r2, r0, #1
	str	r2, [r10, #292]
	blx	r1
	ldr	r3, [fp, #-144]
	ldr	r1, [r10, #268]
	mov	r2, r0
	ldr	r0, [r3, #12]
	cmp	r0, #0
	streq	r2, [r3, #12]
	cmp	r1, #0
	streq	r2, [r10, #268]
	beq	.L1278
	rsb	r1, r1, r2
	cmp	r1, #2000
	bls	.L1278
	ldr	r0, [r10, #264]
	str	r2, [fp, #-148]
	mov	r0, r0, asl #3
	bl	__aeabi_uidiv
	mov	r1, #1000
	ldr	r2, [fp, #-148]
	str	r2, [r10, #268]
	mov	r2, #0
	str	r2, [r10, #264]
	mul	r0, r1, r0
	mov	r0, r0, lsr #10
	str	r0, [r10, #272]
.L1278:
	ldrd	r8, [fp, #-76]
	movw	r1, #4053
	ldr	r2, .L1307+16
	mov	r0, #24
	strd	r8, [sp]
	bl	dprint_normal
	ldr	ip, [fp, #-132]
	ldr	r3, [fp, #-136]
	movw	r1, #4054
	ldr	r2, .L1307+20
	mov	r0, #21
	str	ip, [sp]
	bl	dprint_normal
	ldrd	r2, [fp, #-76]
	mov	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1303
.L1279:
	sub	r1, fp, #140
	mov	r0, r4
	bl	SCDDRV_InsertRawPacket
	cmp	r0, #0
	bne	.L1304
	mov	r3, #1
	strb	r3, [r5, #3]
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L1305
.L1282:
	sub	r2, fp, #140
	mov	r1, r5
	mov	r0, r4
	bl	SCDDRV_SaveRawStream
	ldr	r3, [r6, r4, asl #2]
	ldr	r3, [r3, #120]
	cmp	r3, #1
	beq	.L1269
.L1284:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L1306
.L1271:
	add	r3, r5, #172032
	ldr	r3, [r3, #152]
	cmp	r3, #8
	bgt	.L1269
	ldr	r2, [r6, r4, asl #2]
	cmp	r3, #0
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r2, #120]
	cmp	r2, #1
	orrne	r3, r3, #1
	cmp	r3, #0
	bne	.L1272
.L1269:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1305:
	ldr	r3, [r7]
	blx	r3
	ldr	r3, .L1307
	ldr	r2, .L1307+24
	add	ip, r3, r4, lsl #2
	ldr	r3, [ip, #96]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L1282
	str	r0, [ip, #96]
	movw	r1, #4086
	ldr	r2, [fp, #-152]
	ldr	r0, .L1307+28
	bl	DBG_AddTrace
	b	.L1282
.L1303:
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [fp, #-76]
	b	.L1279
.L1302:
	mov	r3, r4
	ldr	r2, .L1307+32
	movw	r1, #4015
	mov	r0, #23
	bl	dprint_normal
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1304:
	ldr	r2, .L1307+36
	movw	r1, #4063
	mov	r0, #0
	bl	dprint_normal
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1308:
	.align	2
.L1307:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwChanStat
	.word	s_pstVfmwChan
	.word	.LC55
	.word	.LC56
	.word	g_TraceBsPeriod
	.word	.LANCHOR1+1068
	.word	.LC54
	.word	.LC57
	UNWIND(.fnend)
	.size	FillRawData, .-FillRawData
	.align	2
	.global	ReleaseSegArrayPackets
	.type	ReleaseSegArrayPackets, %function
ReleaseSegArrayPackets:
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
	cmp	r1, #1536
	mov	r4, r1
	mov	r8, r0
	mov	r5, r2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r1, r2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r6, #43691
	add	r9, r0, #122880
	movt	r6, 10922
	mov	r7, #2
.L1312:
	mov	r3, r4, asl #6
	mov	r1, r4
	add	r3, r3, r4, lsl #4
	mov	r0, r8
	add	r3, r8, r3
	strb	r7, [r3, #12]
	ldr	ip, [r3, #24]
	ldr	r2, [r9, #44]
	ldr	r3, [r9, #48]
	rsb	r2, ip, r2
	sub	r3, r3, #1
	bic	r2, r2, r2, asr #31
	str	r2, [r9, #44]
	bic	r3, r3, r3, asr #31
	str	r3, [r9, #48]
	bl	ReleaseStreamSeg
	add	r1, r4, #1
	smull	r2, r3, r1, r6
	mov	r4, r1, asr #31
	rsb	r4, r4, r3, asr #8
	mov	r3, r4, asl #11
	sub	r4, r3, r4, asl #9
	rsb	r4, r4, r1
	cmp	r5, r4
	bne	.L1312
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	ReleaseSegArrayPackets, .-ReleaseSegArrayPackets
	.align	2
	.global	SM_SeekPtsInSegArray
	.type	SM_SeekPtsInSegArray, %function
SM_SeekPtsInSegArray:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r7, r0, #122880
	mov	r2, r1
	mov	r5, r0
	str	r1, [fp, #-56]
	movw	r6, #43691
	ldrd	r0, [r1]
	movt	r6, 10922
	ldr	r4, [r7, #8]
	ldr	r3, [r7, #12]
	strd	r0, [fp, #-52]
	ldrd	r0, [r2, #8]
	str	r4, [r7, #16]
	strd	r0, [fp, #-68]
.L1315:
	mov	r2, r4, asl #6
	cmp	r4, r3
	add	r2, r2, r4, lsl #4
	mov	r1, r4
	mov	r0, r5
	add	r2, r5, r2
	beq	.L1326
	ldrsb	ip, [r2, #12]
	add	r10, r2, #40
	cmp	ip, #1
	bne	.L1318
	ldrd	r0, [r2, #40]
	mvn	r9, #0
	mvn	r8, #0
	cmp	r1, r9
	cmpeq	r0, r8
	addeq	r1, r4, #1
	beq	.L1325
	ldrd	r8, [fp, #-52]
	add	r2, r4, #1
	cmp	r9, r1
	mov	ip, r2, asr #31
	cmpeq	r8, r0
	smull	r0, r1, r2, r6
	bls	.L1321
	str	r4, [r7, #16]
	rsb	r4, ip, r1, asr #8
	mov	r1, r4, asl #11
	sub	r4, r1, r4, asl #9
	rsb	r4, r4, r2
	b	.L1315
.L1318:
	bl	ReleaseStreamSeg
	ldr	r3, [r7, #12]
	add	r1, r4, #1
.L1325:
	smull	r8, r9, r1, r6
	mov	r4, r1, asr #31
	rsb	r4, r4, r9, asr #8
	mov	r2, r4, asl #11
	sub	r4, r2, r4, asl #9
	rsb	r4, r4, r1
	b	.L1315
.L1321:
	beq	.L1327
	bcs	.L1315
	ldr	r2, [r7, #16]
	mvn	r9, #0
	mvn	r8, #0
	mov	r3, r2, asl #6
	add	r3, r3, r2, lsl #4
	add	r3, r5, r3
	ldrd	r0, [r3, #40]
	cmp	r1, r9
	cmpeq	r0, r8
	streq	r4, [r7, #16]
	moveq	r2, r4
	beq	.L1324
	ldrd	r8, [fp, #-52]
	cmp	r9, r1
	cmpeq	r8, r0
	bls	.L1324
	subs	r8, r8, r0
	sbc	r9, r9, r1
	mov	r0, r8
	mov	r1, r9
	ldrd	r8, [fp, #-68]
	cmp	r9, r1
	cmpeq	r8, r0
	strcc	r4, [r7, #16]
	movcc	r2, r4
.L1324:
	ldr	r1, [r7, #8]
	mov	r0, r5
	bl	ReleaseSegArrayPackets
	ldr	r2, [r7, #16]
	ldr	r1, [fp, #-56]
	mov	r0, #0
	mov	r3, r2, asl #6
	add	r3, r3, r2, lsl #4
	add	r5, r5, r3
	ldrd	r2, [r5, #40]
	strd	r2, [r1]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1326:
	mov	r2, r4
	ldr	r1, [r7, #8]
	bl	ReleaseSegArrayPackets
	mvn	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1327:
	mov	r2, r4
	ldr	r1, [r7, #8]
	mov	r0, r5
	bl	ReleaseSegArrayPackets
	ldrd	r2, [r10]
	ldr	r1, [fp, #-56]
	mov	r0, #0
	strd	r2, [r1]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	SM_SeekPtsInSegArray, .-SM_SeekPtsInSegArray
	.align	2
	.global	SM_SeekPtsInRawArray
	.type	SM_SeekPtsInRawArray, %function
SM_SeekPtsInRawArray:
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
	ldr	ip, .L1368
	str	r3, [fp, #-68]
	mov	lr, r0
	str	r1, [fp, #-64]
	ldr	r3, [ip, r2, asl #3]
	str	r2, [fp, #-72]
	cmp	r3, #0
	str	r3, [fp, #-76]
	movweq	r1, #4200
	beq	.L1360
	add	r8, r0, #49152
	ldr	r9, [r8]
	cmp	r9, #0
	blt	.L1331
	ldr	r1, [r8, #4]
	cmp	r1, #0
	blt	.L1331
	ldr	r3, [fp, #-68]
	cmp	r3, #1
	ldr	r3, [fp, #-64]
	ldrd	r4, [r3]
	ldrd	r2, [r3, #8]
	strd	r4, [fp, #-60]
	strd	r2, [fp, #-92]
	movne	r3, #0
	strne	r3, [fp, #-80]
	beq	.L1362
.L1333:
	mov	r3, r9
	mvn	r6, #0
	mvn	r7, #0
	str	r9, [r8, #8]
	strd	r6, [fp, #-52]
.L1334:
	mov	r10, r3, asl #5
	mov	ip, r3, asl #7
	add	r2, r3, #1
	cmp	r3, r1
	rsb	r0, r10, ip
	add	r0, lr, r0
	mov	r7, r2, asr #31
	beq	.L1363
	ldrd	r4, [r0, #64]
	mov	r0, r7, lsr #23
	ldrd	r6, [fp, #-52]
	add	r2, r2, r0
	ubfx	r2, r2, #0, #9
	cmp	r5, r7
	cmpeq	r4, r6
	beq	.L1364
	ldrd	r6, [fp, #-60]
	cmp	r7, r5
	cmpeq	r6, r4
	bls	.L1340
	str	r3, [r8, #8]
	rsb	r3, r0, r2
	b	.L1334
.L1364:
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #23
	add	r2, r2, r3
	ubfx	r2, r2, #0, #9
	rsb	r3, r3, r2
	b	.L1334
.L1363:
	cmp	r9, r3
	mov	r0, lr
	addgt	r3, r3, #512
	str	r9, [r8, #8]
	rsb	r1, r9, r3
	bl	DeleteRawPacket
	ldr	r0, [fp, #-72]
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mvn	r0, #1
.L1330:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1340:
	beq	.L1365
	ldr	r2, [r8, #8]
	mvn	r5, #0
	mvn	r4, #0
	mov	r1, r2, asl #7
	sub	r1, r1, r2, asl #5
	add	r1, lr, r1
	ldrd	r0, [r1, #64]
	cmp	r1, r5
	cmpeq	r0, r4
	streq	r3, [r8, #8]
	moveq	r2, r3
	beq	.L1346
	ldrd	r4, [fp, #-60]
	cmp	r5, r1
	cmpeq	r4, r0
	bhi	.L1366
.L1346:
	cmp	r9, r2
	ldr	r3, [fp, #-68]
	addgt	r1, r2, #512
	rsble	r1, r9, r2
	rsbgt	r1, r9, r1
	cmp	r3, #1
	beq	.L1367
.L1349:
	mov	r3, r2, asl #7
	mov	r0, lr
	sub	r2, r3, r2, asl #5
	add	lr, lr, r2
	ldrd	r2, [lr, #64]
.L1361:
	ldr	ip, [fp, #-64]
	strd	r2, [ip]
	ldr	r3, [r8]
	str	r3, [r8, #8]
	bl	DeleteRawPacket
	ldr	r0, [fp, #-72]
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1362:
	ldr	r3, [fp, #-76]
	add	r3, r3, #172032
	ldr	r2, [r3, #168]
	cmp	r2, #1
	str	r2, [fp, #-80]
	moveq	r2, #3
	streq	r2, [r3, #168]
	ldreq	r1, [r8, #4]
	ldreq	r9, [r8]
	b	.L1333
.L1366:
	subs	r4, r4, r0
	sbc	r5, r5, r1
	mov	r0, r4
	mov	r1, r5
	ldrd	r4, [fp, #-92]
	cmp	r5, r1
	cmpeq	r4, r0
	strcc	r3, [r8, #8]
	movcc	r2, r3
	b	.L1346
.L1365:
	cmp	r3, r9
	addlt	r3, r3, #512
	rsb	r1, r9, r3
	ldr	r3, [fp, #-68]
	cmp	r3, #1
	bne	.L1344
	ldr	r3, [fp, #-76]
	ldr	r0, [fp, #-80]
	add	r3, r3, #172032
	ldr	r2, [r3, #160]
	cmp	r1, r2
	cmple	r0, #1
	moveq	r2, r0
	streq	r2, [r3, #168]
.L1344:
	rsb	ip, r10, ip
	mov	r0, lr
	add	r3, lr, ip
	ldrd	r2, [r3, #64]
	b	.L1361
.L1367:
	ldr	r3, [fp, #-76]
	ldr	ip, [fp, #-80]
	add	r3, r3, #172032
	ldr	r0, [r3, #160]
	cmp	r1, r0
	cmple	ip, #1
	moveq	r2, ip
	streq	r2, [r3, #168]
	ldreq	r2, [r8, #8]
	b	.L1349
.L1331:
	movw	r1, #4201
.L1360:
	ldr	r3, .L1368+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L1368+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L1330
.L1369:
	.align	2
.L1368:
	.word	.LANCHOR0
	.word	.LANCHOR1+1080
	.word	.LC10
	UNWIND(.fnend)
	.size	SM_SeekPtsInRawArray, .-SM_SeekPtsInRawArray
	.align	2
	.global	SM_SeekPtsAfterFillNewRaw
	.type	SM_SeekPtsAfterFillNewRaw, %function
SM_SeekPtsAfterFillNewRaw:
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
	mov	r4, r2
	mov	r5, r0
	mov	r6, r1
	mov	r0, r2
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	FillRawData
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	mov	r3, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	SM_SeekPtsInRawArray
	UNWIND(.fnend)
	.size	SM_SeekPtsAfterFillNewRaw, .-SM_SeekPtsAfterFillNewRaw
	.align	2
	.global	SM_SeekPts
	.type	SM_SeekPts, %function
SM_SeekPts:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	cmp	r0, #3
	mov	r6, r1
	mov	r5, r0
	movwhi	r1, #4314
	bhi	.L1394
	cmp	r6, #0
	beq	.L1395
	ldr	r3, .L1397
	ldr	r4, [r3, r0, asl #3]
	cmp	r4, #0
	movweq	r1, #4318
	beq	.L1394
	add	r0, r4, #49152
	add	r0, r0, #104
	bl	SM_SeekPtsInSegArray
	cmp	r0, #0
	bne	.L1376
.L1377:
	mov	r0, #0
.L1373:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1376:
	add	r8, r4, #80
	mov	r1, #0
	mov	r0, r5
	bl	DeleteRawPacketInBuffer
	mov	r0, r8
	mov	r3, #1
	mov	r2, r5
	mov	r1, r6
	bl	SM_SeekPtsInRawArray
	cmp	r0, #0
	beq	.L1377
	add	r4, r4, #49152
	ldrd	r0, [r6, #16]
	ldr	r3, [r4, #84]
	ldr	r2, [r4, #80]
	strd	r0, [fp, #-44]
	cmp	r2, r3
	addgt	r3, r3, #512
	rsb	r2, r2, r3
	mov	r3, r2, asr #31
	cmp	r3, r1
	cmpeq	r2, r0
	bcs	.L1396
	ldrd	r0, [fp, #-44]
	subs	r0, r0, r2
	sbc	r1, r1, r3
	mov	r2, r0
	movw	r0, #511
	mov	r3, r1
	and	r0, r0, r2
	mov	r1, #0
	mov	r7, r2, lsr #9
	and	r1, r1, r3
	orr	r7, r7, r3, asl #23
	orrs	r1, r0, r1
	addne	r7, r7, #1
	cmp	r7, #0
	movge	r4, #0
	blt	.L1385
.L1384:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r8
	add	r4, r4, #1
	bl	SM_SeekPtsAfterFillNewRaw
	cmp	r0, #0
	beq	.L1377
	cmp	r7, r4
	bge	.L1384
.L1385:
	mvn	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1395:
	movw	r1, #4315
.L1394:
	ldr	r3, .L1397+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L1397+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L1373
.L1396:
	strd	r2, [sp, #8]
	movw	r1, #4349
	ldrd	r2, [fp, #-44]
	mov	r0, #1
	strd	r2, [sp]
	ldr	r2, .L1397+12
	bl	dprint_normal
	mvn	r0, #1
	b	.L1373
.L1398:
	.align	2
.L1397:
	.word	.LANCHOR0
	.word	.LANCHOR1+1104
	.word	.LC10
	.word	.LC58
	UNWIND(.fnend)
	.size	SM_SeekPts, .-SM_SeekPts
	.align	2
	.global	SM_MoveRawData
	.type	SM_MoveRawData, %function
SM_MoveRawData:
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
	add	r7, r0, #49152
	mov	r5, r0
	ldr	r3, [r7, #84]
	subs	r6, r3, #1
	addmi	r6, r3, #508
	addmi	r6, r6, #3
	subs	r8, r3, #2
	addmi	r8, r3, #508
	addmi	r8, r8, #2
	mov	r1, r6, asl #7
	sub	r1, r1, r6, asl #5
	mov	r3, r8, asl #7
	add	r9, r0, r1
	sub	r8, r3, r8, asl #5
	add	r1, r1, #80
	add	r8, r0, r8
	ldr	r2, [r9, #88]
	ldr	r0, [r0, #64]
	add	r4, r5, r1
	ldr	r3, [r8, #88]
	add	r1, r3, r2
	cmp	r1, r0
	bgt	.L1402
	ldr	ip, .L1404
	add	r5, r5, #172032
	ldr	r0, [r8, #120]
	ldr	r1, [r9, #120]
	ldr	r10, [ip, #52]
	add	r0, r3, r0
	blx	r10
	ldr	r2, [r9, #88]
	ldr	r3, [r8, #88]
	mov	r1, r4
	add	r3, r3, r2
	str	r3, [r8, #88]
	ldr	r0, [r5, #212]
	bl	ReleaseRawStreamData
	mov	r0, #0
	str	r6, [r7, #84]
.L1403:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1402:
	str	r0, [sp, #4]
	movw	r1, #4397
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L1404+4
	bl	dprint_normal
	mvn	r0, #6
	b	.L1403
.L1405:
	.align	2
.L1404:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC59
	UNWIND(.fnend)
	.size	SM_MoveRawData, .-SM_MoveRawData
	.align	2
	.global	SCDDRV_ProcessSegFull
	.type	SCDDRV_ProcessSegFull, %function
SCDDRV_ProcessSegFull:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r7, r0, #49152
	sub	r2, fp, #36
	add	r7, r7, #104
	mov	r6, r0
	mov	r9, #0
	sub	r1, fp, #44
	mov	r0, r7
	str	r9, [r2, #-4]!
	add	r8, r6, #172032
	str	r9, [fp, #-44]
	bl	GetFreshSegStream
	ldrsb	r5, [r6, #1]
	ldr	r4, [r8, #132]
	cmp	r5, r9
	bne	.L1407
	add	r4, r4, r4, lsr #31
	ldr	r3, [fp, #-40]
	cmp	r3, r4, asr #1
	bge	.L1406
	ldr	r3, [fp, #-44]
	cmp	r3, #127
	ble	.L1421
.L1406:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1407:
	ldr	r3, .L1423
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r8, #244]
	cmp	r0, r3
	strls	r9, [r8, #240]
	strls	r0, [r8, #244]
	bls	.L1406
	rsb	r3, r3, r0
	movw	r2, #5000
	cmp	r3, r2
	str	r3, [r8, #240]
	ble	.L1406
	cmp	r4, #0
	add	r1, r4, #3
	ldr	r2, [fp, #-40]
	movlt	r4, r1
	cmp	r2, r4, asr #2
	bge	.L1406
	ldr	r1, [fp, #-44]
	cmp	r1, #63
	bgt	.L1406
	cmp	r2, #0
	bne	.L1413
	ldr	r1, [r8, #592]
	cmp	r1, #0
	beq	.L1413
	cmp	r7, #0
	beq	.L1416
	ldr	r3, [r8, #116]
	movw	r0, #43691
	ldr	r1, [r8, #112]
	movt	r0, 43690
	add	r3, r3, #1536
	rsb	r3, r1, r3
	umull	r4, r5, r3, r0
	mov	r4, r5, lsr #10
	mov	ip, r4, asl #11
	sub	r4, ip, r4, asl #9
	rsb	r3, r4, r3
	umull	r4, r5, r3, r0
	movs	r5, r5, lsr #1
	beq	.L1416
	mov	r4, r2
	b	.L1417
.L1422:
	ldr	r1, [r8, #112]
.L1417:
	add	r1, r4, r1
	mov	r0, r7
	add	r4, r4, #1
	bl	ReleaseStreamSeg
	cmp	r5, r4
	bne	.L1422
.L1416:
	ldr	r2, .L1423+4
	movw	r1, #4441
	mov	r0, #0
	bl	dprint_normal
.L1415:
	mov	r3, #0
	strb	r3, [r6, #1]
	strb	r3, [r6]
	b	.L1406
.L1421:
	ldr	r3, .L1423
	mov	r2, #1
	strb	r2, [r6, #1]
	ldr	r3, [r3]
	blx	r3
	str	r5, [r8, #240]
	str	r0, [r8, #244]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1413:
	ldr	r2, .L1423+8
	movw	r1, #4445
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r7
	mvn	r1, #0
	bl	ReleaseStreamSeg
	b	.L1415
.L1424:
	.align	2
.L1423:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC60
	.word	.LC61
	UNWIND(.fnend)
	.size	SCDDRV_ProcessSegFull, .-SCDDRV_ProcessSegFull
	.align	2
	.global	SCDDRV_CanNotSelectInst
	.type	SCDDRV_CanNotSelectInst, %function
SCDDRV_CanNotSelectInst:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r3, .L1438
	ldr	r3, [r3, r0, asl #3]
	cmp	r3, #0
	beq	.L1428
	add	r2, r3, #172032
	ldr	r1, [r2, #228]
	cmp	r1, #0
	beq	.L1428
	ldr	r2, [r2, #220]
	cmp	r2, #1
	beq	.L1428
	add	r2, r3, #28
	ldr	ip, [r3, #12]
	sub	r3, fp, #24
	ldmia	r2, {r0, r1, r2}
	cmp	ip, #19
	stmia	r3, {r0, r1, r2}
	beq	.L1428
	mov	r1, r3
	mov	r0, ip
	bl	SCDDRV_IsSCDByPass
	adds	r0, r0, #0
	movne	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1428:
	mov	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1439:
	.align	2
.L1438:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_CanNotSelectInst, .-SCDDRV_CanNotSelectInst
	.align	2
	.global	SM_DoNextInstance
	.type	SM_DoNextInstance, %function
SM_DoNextInstance:
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
	ldr	r8, .L1459
	mov	r6, r0
	str	r1, [fp, #-48]
	add	r2, r8, r0, lsl #2
	ldr	r3, [r2, #92]
	cmp	r3, #0
	beq	.L1441
	cmp	r3, #1
	beq	.L1442
.L1451:
	mvn	r0, #2
.L1443:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1441:
	mov	r3, r0, asl #6
	ldr	r9, .L1459+4
	sub	r3, r3, r0, asl #3
	mov	r5, #4
	add	r3, r8, r3
	ldr	r4, [r3, #72]
	b	.L1450
.L1444:
	subs	r5, r5, #1
	beq	.L1451
.L1450:
	add	r3, r4, #1
	mov	r1, r6
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #30
	add	r3, r3, r4
	and	r3, r3, #3
	rsb	r4, r4, r3
	mov	r0, r4
	bl	SCDDRV_CanNotSelectInst
	cmp	r0, #0
	bne	.L1444
	ldr	r1, [r9]
	ldr	r10, [r8, r4, asl #3]
	blx	r1
	add	r7, r10, #172032
	ldr	r1, [r7, #280]
	subs	r1, r0, r1
	bmi	.L1456
	ldrsh	ip, [r10, #2]
	cmp	ip, #1
	beq	.L1457
.L1446:
	str	r0, [r7, #280]
	ldrsb	r1, [r10]
	cmp	r1, #1
	movne	r1, #0
	strneb	r1, [r10, #1]
	beq	.L1458
.L1449:
	ldr	r3, .L1459+8
	mov	r1, r6
	mov	r0, r10
	ldr	ip, [r3, r4, asl #2]
	ldr	ip, [ip, #84]
	str	ip, [r7, #560]
	bl	CutStreamWithSCD
	cmn	r0, #6
	str	r0, [fp, #-52]
	movne	r1, #0
	moveq	r1, #1
	cmp	r0, #0
	strb	r1, [r10]
	bne	.L1444
	ldr	r2, [fp, #-48]
	mov	r3, #1
	ldr	r0, .L1459+12
	mov	r1, r3
	movw	ip, #4561
	str	r4, [r2]
	add	r2, r0, r4, lsl #2
	str	r3, [r7, #228]
	mov	r0, r4
	ldr	r3, .L1459+16
	str	ip, [sp]
	bl	RecordPOS
	ldr	r0, [fp, #-52]
	b	.L1443
.L1457:
	cmp	r1, #500
	bcc	.L1444
	b	.L1446
.L1456:
	str	r0, [r7, #280]
	ldrsh	r1, [r10, #2]
	cmp	r1, #1
	bne	.L1446
	b	.L1444
.L1442:
	mov	r3, #2
	mvn	r0, #2
	str	r3, [r2, #92]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1458:
	mov	r0, r10
	bl	SCDDRV_ProcessSegFull
	b	.L1449
.L1460:
	.align	2
.L1459:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LANCHOR0+112
	.word	.LANCHOR1+1116
	UNWIND(.fnend)
	.size	SM_DoNextInstance, .-SM_DoNextInstance
	.align	2
	.global	SCDDRV_RecordGlobalState
	.type	SCDDRV_RecordGlobalState, %function
SCDDRV_RecordGlobalState:
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
	ldr	r3, .L1467
	mov	r4, r0
	ldr	r3, [r3]
	blx	r3
	mov	lr, r4, asl #2
	ldr	ip, .L1467+4
	mov	r4, r4, asl #6
	rsb	r3, lr, r4
	add	r3, ip, r3
	add	r6, r3, #48
	ldr	r2, [r3, #48]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r3, r3, #40
	ldr	r1, [r3, #4]
	rsb	r4, lr, r4
	add	r5, r1, #49920
	add	r4, ip, r4
	add	r5, r5, #80
	cmp	r2, r5
	strhi	r2, [r3, #4]
	mov	r5, #0
	str	r5, [r4, #48]
	movhi	r1, r2
	rsb	r1, r1, r0
	ldrls	r6, [r6, #4]
	movhi	r6, #0
	cmp	r1, #1000
	rsb	r0, r2, r0
	add	r0, r0, r6
	str	r0, [r4, #52]
	ldmccfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r3, #1000
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	str	r5, [r4, #44]
	str	r0, [r4, #56]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1468:
	.align	2
.L1467:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	UNWIND(.fnend)
	.size	SCDDRV_RecordGlobalState, .-SCDDRV_RecordGlobalState
	.align	2
	.global	SCDDRV_MoveRawByOmxPath
	.type	SCDDRV_MoveRawByOmxPath, %function
SCDDRV_MoveRawByOmxPath:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L1482
	mov	r2, #0
	str	r2, [fp, #-24]
	ldr	r4, [r3, r0, asl #3]
	ldr	r5, [r4, #52]
	cmp	r5, #1
	beq	.L1480
.L1469:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1480:
	sub	r1, fp, #24
	add	r0, r4, #80
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L1481
.L1472:
	ldrsb	r5, [r4, #2]
	cmp	r5, #1
	bne	.L1469
	ldr	r2, [r4, #60]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L1469
	mov	r0, r4
	bl	SM_MoveRawData
	cmp	r0, #0
	beq	.L1469
	add	r4, r4, #172032
	mov	r0, r5
	ldr	r2, .L1482+4
	movw	r1, #4619
	bl	dprint_normal
	ldr	r0, [r4, #212]
	bl	SM_Reset
	b	.L1469
.L1481:
	mov	r0, r5
	ldr	r2, .L1482+8
	movw	r1, #4611
	bl	dprint_normal
	b	.L1472
.L1483:
	.align	2
.L1482:
	.word	.LANCHOR0
	.word	.LC63
	.word	.LC62
	UNWIND(.fnend)
	.size	SCDDRV_MoveRawByOmxPath, .-SCDDRV_MoveRawByOmxPath
	.align	2
	.global	SM_SCDIntServeProc
	.type	SM_SCDIntServeProc, %function
SM_SCDIntServeProc:
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
	bne	.L1498
	ldr	r5, .L1504
	ldr	r4, .L1504+4
	ldr	r3, [r5, #12]
	blx	r3
	ldr	r0, [r4, #88]
	add	r0, r0, #2112
	bl	MEM_ReadPhyWord
	tst	r0, #1
	bne	.L1499
.L1487:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1498:
	movw	r1, #4634
	ldr	r3, .L1504+8
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L1504+12
	bl	dprint_normal
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1499:
	ldr	r0, [r4, #88]
	mov	r1, #1
	add	r0, r0, #2080
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	ldr	r9, [r4, #72]
	ldr	r0, [r4, #68]
	ldr	r8, [r4, r9, asl #3]
	cmp	r8, #0
	cmpne	r0, #0
	moveq	r7, #1
	movne	r7, #0
	beq	.L1500
	ldr	r3, .L1504+8
	movw	r2, #4654
	mov	r1, #2
	str	r2, [sp]
	mov	r0, r9
	add	r2, r4, #128
	bl	RecordPOS
	mov	r0, r7
	bl	SCDDRV_RecordGlobalState
	ldr	r3, [r4, #76]
	cmp	r3, #1
	beq	.L1501
.L1489:
	ldr	r3, [r5, #128]
	mov	r0, #1
	blx	r3
	ldr	r3, [r5, #128]
	mov	r0, #0
	blx	r3
	b	.L1487
.L1500:
	str	r6, [r4, #76]
	mov	r0, #1
	ldr	r3, [r5, #128]
	blx	r3
	b	.L1487
.L1501:
	add	r10, r8, #172032
	ldr	r3, [r10, #228]
	cmp	r3, #1
	beq	.L1502
.L1490:
	mov	r6, #0
	sub	r1, fp, #48
	str	r6, [r10, #220]
	mov	r0, r6
	bl	SM_DoNextInstance
	cmp	r0, r6
	bne	.L1503
	ldr	r2, [fp, #-48]
	mov	r1, #1
	ldr	r3, [r5]
	str	r1, [r4, #76]
	str	r2, [r4, #72]
	blx	r3
	str	r0, [r4, #80]
	b	.L1489
.L1503:
	str	r6, [r4, #76]
	mov	r0, #1
	ldr	r3, [r5, #128]
	blx	r3
	b	.L1489
.L1502:
	mov	r1, r7
	mov	r0, r8
	bl	ProcessScdReturn
	mov	r0, r9
	bl	SCDDRV_MoveRawByOmxPath
	b	.L1490
.L1505:
	.align	2
.L1504:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR1+1136
	.word	.LC21
	UNWIND(.fnend)
	.size	SM_SCDIntServeProc, .-SM_SCDIntServeProc
	.align	2
	.global	SCDDRV_CheckDevice
	.type	SCDDRV_CheckDevice, %function
SCDDRV_CheckDevice:
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
	subs	r6, r0, #0
	bne	.L1517
	ldr	r5, .L1519
	movw	r3, #4706
	mov	r1, r3
	str	r3, [sp]
	str	r6, [sp, #4]
	mov	r0, #21
	ldr	ip, [r5, #76]
	ldr	r3, .L1519+4
	ldr	r2, .L1519+8
	str	ip, [sp, #8]
	bl	dprint_normal
	ldr	r4, [r5, #76]
	cmp	r4, #0
	beq	.L1518
	ldr	r7, .L1519+12
	movw	r3, #4715
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L1519+8
	mov	r0, #21
	ldr	r3, .L1519+4
	str	r4, [sp, #8]
	str	r6, [sp, #4]
	bl	dprint_normal
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r5, #80]
	cmp	r0, r3
	strcc	r0, [r5, #80]
	bcc	.L1511
	rsb	r0, r3, r0
	movw	r3, #5000
	cmp	r0, r3
	bls	.L1511
	movw	r1, #4727
	ldr	r3, [r5, #72]
	ldr	r2, .L1519+16
	mov	r4, #0
	str	r0, [sp, #4]
	mov	r0, #1
	str	r6, [sp]
	bl	dprint_normal
	mov	r0, r6
	bl	ResetSCD
	ldr	r3, [r7, #128]
	str	r6, [r5, #76]
	mov	r0, #1
	blx	r3
	ldr	r0, [r5, #72]
	ldr	r3, [r5, r0, asl #3]
	cmp	r3, #0
	addne	r3, r3, #172032
	strne	r6, [r3, #220]
	bl	DeleteLastSendRaw
	b	.L1515
.L1511:
	mov	r3, #0
	movw	r1, #4753
	mov	r0, #21
	stmia	sp, {r1, r3}
	ldr	r2, .L1519+20
	mov	r4, #1
	ldr	r3, .L1519+4
	bl	dprint_normal
.L1515:
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1518:
	movw	r1, #4710
	ldr	r3, .L1519+4
	stmia	sp, {r1, r4}
	mov	r0, #21
	ldr	r2, .L1519+24
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1517:
	movw	r1, #4703
	ldr	r3, .L1519+4
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L1519+28
	mvn	r4, #0
	bl	dprint_normal
	b	.L1515
.L1520:
	.align	2
.L1519:
	.word	.LANCHOR0
	.word	.LANCHOR1+1156
	.word	.LC64
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC67
	.word	.LC66
	.word	.LC65
	.word	.LC10
	UNWIND(.fnend)
	.size	SCDDRV_CheckDevice, .-SCDDRV_CheckDevice
	.align	2
	.global	SCDDRV_ActivateSCD
	.type	SCDDRV_ActivateSCD, %function
SCDDRV_ActivateSCD:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r0, #0
	bne	.L1525
	sub	r1, fp, #24
	bl	SM_DoNextInstance
	cmp	r0, #0
	bne	.L1521
	ldr	r4, .L1526
	mov	r1, #1
	ldr	r2, [fp, #-24]
	ldr	r3, .L1526+4
	str	r1, [r4, #76]
	str	r2, [r4, #72]
	ldr	r3, [r3]
	blx	r3
	movw	r3, #4772
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L1526+8
	ldr	r3, .L1526+12
	str	r0, [r4, #80]
	mov	r0, #21
	bl	dprint_normal
.L1521:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1525:
	movw	r1, #4763
	ldr	r3, .L1526+12
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L1526+16
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1527:
	.align	2
.L1526:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC68
	.word	.LANCHOR1+1176
	.word	.LC21
	UNWIND(.fnend)
	.size	SCDDRV_ActivateSCD, .-SCDDRV_ActivateSCD
	.align	2
	.global	SM_Wakeup
	.type	SM_Wakeup, %function
SM_Wakeup:
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
	ldr	r5, .L1539
	mov	r4, #0
.L1530:
	ldr	r3, [r5, r4, asl #3]
	cmp	r3, #0
	add	r2, r3, #172032
	beq	.L1529
	ldr	r3, [r2, #228]
	cmp	r3, #1
	beq	.L1538
.L1529:
	add	r4, r4, #1
	cmp	r4, #4
	bne	.L1530
	mov	r3, #1
	mov	r4, #0
	str	r3, [sp, #4]
	movw	r1, #4792
	ldr	r3, .L1539+4
	mov	r0, #21
	ldr	r2, .L1539+8
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	bl	SCDDRV_CheckDevice
	subs	r5, r0, #0
	beq	.L1531
	movw	r1, #4801
	ldr	r3, .L1539+4
	stmia	sp, {r1, r4}
	mov	r0, #21
	ldr	r2, .L1539+12
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1531:
	movw	r1, #4796
	ldr	r3, .L1539+4
	stmia	sp, {r1, r5}
	mov	r0, #21
	ldr	r2, .L1539+16
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SCDDRV_ActivateSCD
.L1538:
	mov	r0, r4
	bl	FillRawData
	b	.L1529
.L1540:
	.align	2
.L1539:
	.word	.LANCHOR0
	.word	.LANCHOR1+1196
	.word	.LC69
	.word	.LC70
	.word	.LC71
	UNWIND(.fnend)
	.size	SM_Wakeup, .-SM_Wakeup
	.align	2
	.global	PrintScdRawState
	.type	PrintScdRawState, %function
PrintScdRawState:
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
	cmp	r0, #3
	mov	r3, #0
	mov	r4, r0
	mov	r6, r1
	str	r3, [fp, #-40]
	bhi	.L1556
	mov	r0, #21
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L1557
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1556:
	movw	r1, #4813
	ldr	r3, .L1559
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L1559+4
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1557:
	ldr	ip, .L1559+8
	mov	r3, r4
	ldr	r2, .L1559+12
	movw	r1, #4818
	mov	r0, #21
	ldr	r9, [ip, r4, asl #3]
	bl	dprint_normal
	ldr	r2, .L1559+16
	movw	r1, #4820
	add	r7, r9, #49152
	mov	r0, #21
	ldr	r3, [r7, #80]
	bl	dprint_normal
	ldr	r3, [r7, #84]
	ldr	r2, .L1559+20
	movw	r1, #4821
	mov	r0, #21
	bl	dprint_normal
	ldr	r3, [r7, #88]
	ldr	r2, .L1559+24
	movw	r1, #4822
	mov	r0, #21
	bl	dprint_normal
	ldr	r3, [r7, #92]
	ldr	r2, .L1559+28
	movw	r1, #4823
	mov	r0, #21
	bl	dprint_normal
	ldr	r3, [r7, #96]
	ldr	r2, .L1559+32
	movw	r1, #4824
	mov	r0, #21
	bl	dprint_normal
	cmp	r6, #1
	beq	.L1545
.L1547:
	mov	r3, r4
	ldr	r2, .L1559+36
	movw	r1, #4844
	mov	r0, #21
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1545:
	sub	r1, fp, #40
	add	r0, r9, #80
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L1558
.L1546:
	ldr	r3, [fp, #-40]
	ldr	r5, [r7, #80]
	cmp	r3, #0
	ble	.L1547
	mov	r3, r5, asl #7
	mov	r8, #0
	sub	r5, r3, r5, asl #5
	add	r5, r9, r5
.L1548:
	ldr	r3, [r5, #84]
	movw	r1, #4837
	ldr	r2, .L1559+40
	mov	r0, #21
	bl	dprint_normal
	ldrd	r6, [r5, #120]
	ldr	r2, .L1559+44
	movw	r1, #4838
	mov	r0, #21
	add	r8, r8, #1
	strd	r6, [sp]
	add	r5, r5, #96
	bl	dprint_normal
	ldr	r3, [r5, #-8]
	ldr	r2, .L1559+48
	movw	r1, #4839
	mov	r0, #21
	bl	dprint_normal
	ldrd	r6, [r5, #48]
	ldr	r2, .L1559+52
	movw	r1, #4840
	mov	r0, #21
	strd	r6, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #-40]
	cmp	r3, r8
	bgt	.L1548
	b	.L1547
.L1558:
	movw	r1, #4830
	ldr	r3, .L1559+56
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L1559+60
	bl	dprint_normal
	b	.L1546
.L1560:
	.align	2
.L1559:
	.word	.LANCHOR1+1208
	.word	.LC21
	.word	.LANCHOR0
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LANCHOR1+1228
	.word	.LC79
	UNWIND(.fnend)
	.size	PrintScdRawState, .-PrintScdRawState
	.global	s_ScdRegPhyBaseAddr
	.global	g_ScdDrvParam
	.global	s_SmIIS
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.16023, %object
	.size	__func__.16023, 17
__func__.16023:
	.ascii	"FillEopRawStream\000"
	.space	3
.LC0:
	.byte	0
	.byte	0
	.byte	1
	.byte	11
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	98
	.byte	0
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.16051, %object
	.size	__func__.16051, 17
__func__.16051:
	.ascii	"FillEosRawStream\000"
	.space	3
	.type	__func__.16076, %object
	.size	__func__.16076, 17
__func__.16076:
	.ascii	"FillVC1ExtraData\000"
	.space	3
	.type	__func__.16081, %object
	.size	__func__.16081, 19
__func__.16081:
	.ascii	"FillDIVX3ExtraData\000"
	.space	1
	.type	__func__.16086, %object
	.size	__func__.16086, 19
__func__.16086:
	.ascii	"FillREAL8ExtraData\000"
	.space	1
	.type	__func__.16094, %object
	.size	__func__.16094, 14
__func__.16094:
	.ascii	"FillExtraData\000"
	.space	2
	.type	__func__.16109, %object
	.size	__func__.16109, 21
__func__.16109:
	.ascii	"ReleaseRawStreamData\000"
	.space	3
	.type	__func__.16119, %object
	.size	__func__.16119, 18
__func__.16119:
	.ascii	"ReadRawStreamData\000"
	.space	2
	.type	__func__.16148, %object
	.size	__func__.16148, 17
__func__.16148:
	.ascii	"SCDDRV_IsScdIdle\000"
	.space	3
	.type	__func__.16152, %object
	.size	__func__.16152, 20
__func__.16152:
	.ascii	"SCDDRV_SetStateIdle\000"
	.type	__func__.16156, %object
	.size	__func__.16156, 20
__func__.16156:
	.ascii	"SCDDRV_SetStateWork\000"
	.type	__func__.16163, %object
	.size	__func__.16163, 9
__func__.16163:
	.ascii	"ResetSCD\000"
	.space	3
	.type	__func__.16185, %object
	.size	__func__.16185, 23
__func__.16185:
	.ascii	"SCDDRV_InsertRawPacket\000"
	.space	1
	.type	__func__.16190, %object
	.size	__func__.16190, 12
__func__.16190:
	.ascii	"GetRawState\000"
	.type	__func__.16199, %object
	.size	__func__.16199, 15
__func__.16199:
	.ascii	"GetFirstOffset\000"
	.space	1
	.type	__func__.16211, %object
	.size	__func__.16211, 15
__func__.16211:
	.ascii	"SetFirstOffset\000"
	.space	1
	.type	__func__.16220, %object
	.size	__func__.16220, 16
__func__.16220:
	.ascii	"DeleteRawPacket\000"
	.type	__func__.16234, %object
	.size	__func__.16234, 24
__func__.16234:
	.ascii	"DeleteRawPacketInBuffer\000"
	.type	__func__.16269, %object
	.size	__func__.16269, 18
__func__.16269:
	.ascii	"DeleteLastSendRaw\000"
	.space	2
	.type	__func__.16274, %object
	.size	__func__.16274, 17
__func__.16274:
	.ascii	"GetRawStreamSize\000"
	.space	3
	.type	__func__.16279, %object
	.size	__func__.16279, 16
__func__.16279:
	.ascii	"GetRawStreamNum\000"
	.type	__func__.16250, %object
	.size	__func__.16250, 16
__func__.16250:
	.ascii	"GetRawNumOffset\000"
	.type	__func__.16263, %object
	.size	__func__.16263, 13
__func__.16263:
	.ascii	"DeleteRawLen\000"
	.space	3
	.type	__func__.16286, %object
	.size	__func__.16286, 21
__func__.16286:
	.ascii	"ConfigStreamSegArray\000"
	.space	3
	.type	__func__.16290, %object
	.size	__func__.16290, 20
__func__.16290:
	.ascii	"ResetStreamSegArray\000"
	.type	__func__.16299, %object
	.size	__func__.16299, 10
__func__.16299:
	.ascii	"CheckData\000"
	.space	2
	.type	__func__.16304, %object
	.size	__func__.16304, 18
__func__.16304:
	.ascii	"CheckStartCodeCnt\000"
	.space	2
	.type	__func__.16311, %object
	.size	__func__.16311, 12
__func__.16311:
	.ascii	"CheckStream\000"
	.type	__func__.16319, %object
	.size	__func__.16319, 16
__func__.16319:
	.ascii	"InsertStreamSeg\000"
	.type	__func__.16327, %object
	.size	__func__.16327, 20
__func__.16327:
	.ascii	"SCDDRV_GetStreamSeg\000"
	.type	__func__.16336, %object
	.size	__func__.16336, 17
__func__.16336:
	.ascii	"ReleaseStreamSeg\000"
	.space	3
	.type	__FUNCTION__.16339, %object
	.size	__FUNCTION__.16339, 17
__FUNCTION__.16339:
	.ascii	"ReleaseStreamSeg\000"
	.space	3
	.type	__func__.16346, %object
	.size	__func__.16346, 17
__func__.16346:
	.ascii	"GetSegStreamSize\000"
	.space	3
	.type	__func__.16355, %object
	.size	__func__.16355, 18
__func__.16355:
	.ascii	"GetFreshSegStream\000"
	.space	2
	.type	__func__.16359, %object
	.size	__func__.16359, 20
__func__.16359:
	.ascii	"SCDDRV_PrepareSleep\000"
	.type	__func__.16366, %object
	.size	__func__.16366, 18
__func__.16366:
	.ascii	"SCDDRV_ForceSleep\000"
	.space	2
	.type	__func__.16370, %object
	.size	__func__.16370, 17
__func__.16370:
	.ascii	"SCDDRV_ExitSleep\000"
	.space	3
	.type	__func__.16374, %object
	.size	__func__.16374, 27
__func__.16374:
	.ascii	"ResetLastUnfinishedSegInfo\000"
	.space	1
	.type	__func__.16395, %object
	.size	__func__.16395, 13
__func__.16395:
	.ascii	"SM_ClearInst\000"
	.space	3
	.type	__func__.16410, %object
	.size	__func__.16410, 14
__func__.16410:
	.ascii	"SM_OpenSCDDrv\000"
	.space	2
	.type	__func__.16431, %object
	.size	__func__.16431, 10
__func__.16431:
	.ascii	"SM_Config\000"
	.space	2
	.type	__func__.16443, %object
	.size	__func__.16443, 9
__func__.16443:
	.ascii	"SM_Start\000"
	.space	3
	.type	__func__.16448, %object
	.size	__func__.16448, 8
__func__.16448:
	.ascii	"SM_Stop\000"
	.type	__func__.16387, %object
	.size	__func__.16387, 9
__func__.16387:
	.ascii	"SM_Reset\000"
	.space	3
	.type	__FUNCTION__.16388, %object
	.size	__FUNCTION__.16388, 9
__FUNCTION__.16388:
	.ascii	"SM_Reset\000"
	.space	3
	.type	__func__.16415, %object
	.size	__func__.16415, 15
__func__.16415:
	.ascii	"SM_CloseSCDDrv\000"
	.space	1
	.type	__func__.16455, %object
	.size	__func__.16455, 11
__func__.16455:
	.ascii	"SM_GetInfo\000"
	.space	1
	.type	__func__.16497, %object
	.size	__func__.16497, 16
__func__.16497:
	.ascii	"SM_CopyRawToSeg\000"
	.type	__func__.16509, %object
	.size	__func__.16509, 17
__func__.16509:
	.ascii	"SM_ReadSegStream\000"
	.space	3
	.type	__func__.16515, %object
	.size	__func__.16515, 20
__func__.16515:
	.ascii	"SM_ReleaseStreamSeg\000"
	.type	__func__.16537, %object
	.size	__func__.16537, 18
__func__.16537:
	.ascii	"GetFreeSegBufSize\000"
	.space	2
	.type	__func__.16688, %object
	.size	__func__.16688, 14
__func__.16688:
	.ascii	"CheckSegValid\000"
	.space	2
	.type	__func__.16829, %object
	.size	__func__.16829, 17
__func__.16829:
	.ascii	"GetMpeg4ModeFlag\000"
	.space	3
	.type	__func__.16901, %object
	.size	__func__.16901, 20
__func__.16901:
	.ascii	"ProcessH263ScdUpMsg\000"
	.type	__FUNCTION__.16926, %object
	.size	__FUNCTION__.16926, 12
__FUNCTION__.16926:
	.ascii	"FillRawData\000"
	.type	__func__.16959, %object
	.size	__func__.16959, 21
__func__.16959:
	.ascii	"SM_SeekPtsInRawArray\000"
	.space	3
	.type	__func__.16975, %object
	.size	__func__.16975, 11
__func__.16975:
	.ascii	"SM_SeekPts\000"
	.space	1
	.type	__FUNCTION__.17025, %object
	.size	__FUNCTION__.17025, 18
__FUNCTION__.17025:
	.ascii	"SM_DoNextInstance\000"
	.space	2
	.type	__func__.17048, %object
	.size	__func__.17048, 19
__func__.17048:
	.ascii	"SM_SCDIntServeProc\000"
	.space	1
	.type	__func__.17056, %object
	.size	__func__.17056, 19
__func__.17056:
	.ascii	"SCDDRV_CheckDevice\000"
	.space	1
	.type	__func__.17062, %object
	.size	__func__.17062, 19
__func__.17062:
	.ascii	"SCDDRV_ActivateSCD\000"
	.space	1
	.type	__func__.17071, %object
	.size	__func__.17071, 10
__func__.17071:
	.ascii	"SM_Wakeup\000"
	.space	2
	.type	__func__.17083, %object
	.size	__func__.17083, 17
__func__.17083:
	.ascii	"PrintScdRawState\000"
	.space	3
	.type	__FUNCTION__.17084, %object
	.size	__FUNCTION__.17084, 17
__FUNCTION__.17084:
	.ascii	"PrintScdRawState\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	ASCII(.ascii	"%s: pRawPacket = NULL!\012\000" )
.LC2:
	ASCII(.ascii	"%s: unkown standard type = %d!\012\000" )
.LC3:
	ASCII(.ascii	"%s: Length(%d)+FlagLen(%d) > BufLen(%d)\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"%s: FlagLen(%d) > RawPacketLength(%d)\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act: %d, head" )
	ASCII(.ascii	"er_buf: %d)\012\000" )
.LC6:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act: %d, str_" )
	ASCII(.ascii	"buf: %d)\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act:%d, str_b" )
	ASCII(.ascii	"uf: %d, header_buf: %d)\012\000" )
.LC8:
	ASCII(.ascii	"Func: %s, buffer has no enough space, (act: %d, str" )
	ASCII(.ascii	"_buf: %d)\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act:%d, str_b" )
	ASCII(.ascii	"uf:%d)\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"%s %d: ASSERT return!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"%s: RawPacket Length %d <= 0\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"Chan %d has been destroyed or the function pointer " )
	ASCII(.ascii	"-- ReleaseRawStreamData pStreamIntf is NULL!\000" )
.LC13:
	ASCII(.ascii	"%s FATAL: inst %d been destroyed after unlock!\012\000" )
.LC14:
	ASCII(.ascii	"Chan %d has been destroyed or the function pointer " )
	ASCII(.ascii	"-- ReadRawStreamData pStreamIntf is NULL!\000" )
	.space	3
.LC15:
	ASCII(.ascii	"Chan %d FillEosRawStream failed!\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"Chan %d FillExtraData failed!\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"%s release this packet failed!\012\000" )
.LC18:
	ASCII(.ascii	"DKIF\000" )
	.space	3
.LC19:
	ASCII(.ascii	"Save num:%d size:%d\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"%s line %d ScdId %d overrun\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"%s %d: ASSERT!\012\000" )
.LC22:
	ASCII(.ascii	"Ignore the reset request when the SCD[%d] clock is " )
	ASCII(.ascii	"closed.\012\000" )
.LC23:
	ASCII(.ascii	"SCD[%d]   ResetSCD ERROR!!!\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"line: %d Get SmID fail!\000" )
.LC25:
	ASCII(.ascii	"DelRaw err PacketNum = %d, DelNum = %d\012\000" )
.LC26:
	ASCII(.ascii	"%s release RawPhyAddr = 0x%x, Len = %d\012\000" )
.LC27:
	ASCII(.ascii	"line: %d pSmInstArray is NULL!\012\000" )
.LC28:
	ASCII(.ascii	"line: %d DelNum = %d,RawPacketOffSet = %d,DelNum = " )
	ASCII(.ascii	"%d,Next Length = %d,is_extern_eop_flag = %d\012\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC29:
	ASCII(.ascii	"Read_seg SegPacket.PhyAddr=0x%x, LenByte=%d, IsLast" )
	ASCII(.ascii	"Seg=%d\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"Release SegPacket.PhyAddr=0x%x,LenByte=%d,IsLastSeg" )
	ASCII(.ascii	"=%d StreamID=%d\012\000" )
.LC31:
	ASCII(.ascii	"Array out of bound in function %s\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"%s: pDownMsgMemVirAddr = NULL\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"%s: pUpMsgMemVirAddr = NULL\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"%s: need size %d > alloc size %d\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"line: %d, SmID = %d is not expected!\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"line: %d, SmID = %d, ScdId = %d is not expected!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC37:
	ASCII(.ascii	"line: %d, pScdInstance is NULL!\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"%s %d FMW_OK !=  GetRawStreamNum !!\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"%s %d force to clear SCDState = 0\012\000" )
	.space	1
.LC40:
	ASCII(.ascii	"Raw packet TOO BIG! Can't copy to seg! Len: 0x%x\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC41:
	ASCII(.ascii	"line: %d, delet raw failed!\012\000" )
	.space	3
.LC42:
	ASCII(.ascii	"[%s %d] VirAddr is null!!\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"copy raw to seg fail\012\000" )
	.space	2
.LC44:
	ASCII(.ascii	"InstID = %d EsRelease!\012\000" )
.LC45:
	ASCII(.ascii	"Cann't Start SCD, Ret = %d\012\000" )
.LC46:
	ASCII(.ascii	"SM_CfgBuf Err! ret =%d\012\000" )
.LC47:
	ASCII(.ascii	"%d, pSegPacket->LenInByte = %d, SegBufFreeSize = %d" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC48:
	ASCII(.ascii	"Line: %d, The length of seg packet is invalid: %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC49:
	ASCII(.ascii	"Line: %d, start code num from scd state reg: %d, re" )
	ASCII(.ascii	"lease raw packet anyway!\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"[%s %d] pCurrentStartCodeVirAddr is null!!\012\000" )
.LC51:
	ASCII(.ascii	"Line: %d, pNextStartCodeVirAddr is null!\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	"ValidSegNum = %d, FilteredSegNum = 0, release raw p" )
	ASCII(.ascii	"acket anyway!\012\000" )
	.space	2
.LC53:
	ASCII(.ascii	"%s, %d, i = %d, j = %d, CurrentStartCodePhyAddr = 0" )
	ASCII(.ascii	"x%x, pSmStateReg->ScdRollAddr = 0x%x, NextStartCode" )
	ASCII(.ascii	"PhyAddr = 0x%x\012\000" )
	.space	2
.LC54:
	ASCII(.ascii	"Chan%d raw full\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"raw_pts: %lld\012\000" )
	.space	1
.LC56:
	ASCII(.ascii	"Get RawPhyAddr=0x%x,Len=%d\012\000" )
.LC57:
	ASCII(.ascii	"!!!push raw err!!!\012\000" )
.LC58:
	ASCII(.ascii	"RawNum %lld <= RawNumInVfmw %lld\012\000" )
	.space	2
.LC59:
	ASCII(.ascii	"No space for raw move, total:%d+%d > max:%d!\012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"scd buffer is full, reset scd!\012\000" )
.LC61:
	ASCII(.ascii	"(%d ms) not release stream seg, release anyway!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC62:
	ASCII(.ascii	"SCD GetRawStreamNum Fail.\012\000" )
	.space	1
.LC63:
	ASCII(.ascii	"Move raw data failed, force to reset scd.\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) SCDState = %d\012\000" )
	.space	2
.LC65:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) return Idle!\012\000" )
	.space	3
.LC66:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) really busy!\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"Chan %d SCD[%d] Time Out(%d ms), Reset it!\012\000" )
.LC68:
	ASCII(.ascii	"%s,%d, active scd Success!\012\000" )
.LC69:
	ASCII(.ascii	"%s prepare to check SCD(%d)/(MAX_SCD_NUM = %d)\012\000" )
.LC70:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) return BUSY!!\012\000" )
	.space	2
.LC71:
	ASCII(.ascii	"%s,%d,find idle SCD(ID = %d)\012\000" )
	.space	2
.LC72:
	ASCII(.ascii	"********** SmID [%d] RawState begin **********\012\000" )
.LC73:
	ASCII(.ascii	"RawHead=%d\012\000" )
.LC74:
	ASCII(.ascii	"RawTail=%d\012\000" )
.LC75:
	ASCII(.ascii	"RawHistory=%d\012\000" )
	.space	1
.LC76:
	ASCII(.ascii	"RawFirstPacketOffset=%d\012\000" )
	.space	3
.LC77:
	ASCII(.ascii	"CurShowIndex=%d\012\000" )
	.space	3
.LC78:
	ASCII(.ascii	"********** SmID [%d] RawState end   **********\012\000" )
.LC79:
	ASCII(.ascii	"%s %d FMW_OK !=  GetRawStreamNum!!\012\000" )
.LC80:
	ASCII(.ascii	"RawPhyAddr=0x%x\012\000" )
	.space	3
.LC81:
	ASCII(.ascii	"RawVirAddr=0x%x\012\000" )
	.space	3
.LC82:
	ASCII(.ascii	"RawLength=%d\012\000" )
	.space	2
.LC83:
	ASCII(.ascii	"RawPts=%ld\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	s_SmIIS, %object
	.size	s_SmIIS, 32
s_SmIIS:
	.space	32
	.type	g_ScdDrvParam, %object
	.size	g_ScdDrvParam, 56
g_ScdDrvParam:
	.space	56
	.type	s_ScdRegPhyBaseAddr, %object
	.size	s_ScdRegPhyBaseAddr, 4
s_ScdRegPhyBaseAddr:
	.space	4
	.type	s_eScdDrvSleepStage, %object
	.size	s_eScdDrvSleepStage, 4
s_eScdDrvSleepStage:
	.space	4
	.type	last_rec_pos_time.16921, %object
	.size	last_rec_pos_time.16921, 16
last_rec_pos_time.16921:
	.space	16
	.type	LastRecPosTime.17022, %object
	.size	LastRecPosTime.17022, 16
LastRecPosTime.17022:
	.space	16
	.type	last_rec_pos_time.17047, %object
	.size	last_rec_pos_time.17047, 16
last_rec_pos_time.17047:
	.space	16
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
