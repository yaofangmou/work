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
	.file	"hevc.c"
	.text
	.align	2
	.type	HEVC_ComparePicByPocAsc, %function
HEVC_ComparePicByPocAsc:
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
	ldr	r2, [r2, #8]
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L3
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L3:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ComparePicByPocAsc, .-HEVC_ComparePicByPocAsc
	.align	2
	.type	HEVC_UpdateInterLayerReflist, %function
HEVC_UpdateInterLayerReflist:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	add	r10, r0, #4096
	mov	r7, r0
	ldr	r3, [r10, #744]
	cmp	r3, #0
	streq	r3, [r0, #3064]
	streq	r3, [r0, #3068]
	beq	.L5
	ldr	r2, [r10, #2072]
	ldr	r1, [r0, #2836]
	cmp	r2, #0
	ble	.L34
	add	r2, r3, #1024
	add	r0, r1, #12288
	add	r2, r2, #8
	add	ip, r7, #6144
	mov	r3, r3, asl #1
	str	r3, [fp, #-52]
	add	r3, r1, #16384
	str	r3, [fp, #-48]
	add	r3, r0, r2, lsl #2
	str	r3, [fp, #-56]
	add	r3, ip, #24
	mov	r8, #0
	mov	r6, r8
	str	r8, [fp, #-64]
	str	r8, [fp, #-68]
	mov	r9, r0
	mov	r8, r3
.L26:
	ldr	r1, [fp, #-52]
	ldr	r3, [r8, #4]!
	ldr	r2, [fp, #-56]
	add	r3, r1, r3
	ldr	r1, [fp, #-48]
	add	r3, r3, #1040
	add	r3, r3, #4
	ldr	r2, [r2, #132]
	ldr	r1, [r1, #164]
	add	r3, r9, r3, lsl #2
	cmp	r2, r1
	ldr	lr, [r3, #132]
	add	r3, lr, #1024
	add	r3, r3, #8
	add	r3, r9, r3, lsl #2
	ldr	r3, [r3, #132]
	ble	.L56
	cmp	r2, r3
	movlt	r3, #0
	movge	r3, #1
	str	r3, [fp, #-60]
.L10:
	ldr	r0, [r7, #3040]
	cmp	r0, #0
	beq	.L12
	add	r2, r7, #3200
	ldr	ip, [r10, #724]
	add	r2, r2, #4
	mov	r4, #0
	b	.L25
.L13:
	add	r4, r4, #1
	cmp	r4, r0
	beq	.L12
.L25:
	ldr	r3, [r2, #4]!
	ldr	r1, [r3, #8]
	cmp	r1, ip
	bne	.L13
	ldr	r1, [r3, #32]
	cmp	r1, lr
	bne	.L13
	add	r4, r7, r4, lsl #2
	mov	r2, #1
	strb	r2, [r3, #1]
	ldr	r3, [r4, #3208]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L57
.L14:
	mov	r5, #0
	str	r5, [r3, #64]
	ldr	r3, [r4, #3208]
	mov	r2, #1
	str	r2, [r3, #60]
	ldr	r3, [r4, #3208]
	str	r2, [r3, #72]
	ldr	r3, [r4, #3208]
	cmp	r3, r5
	beq	.L58
	ldr	r2, [r10, #744]
	mov	r1, #280
	mul	r1, r1, r2
	add	ip, r7, r1
	add	r0, ip, #13120
	add	r0, r0, #40
	ldr	r0, [r0, #4]
	cmp	r0, #0
	beq	.L16
	add	ip, ip, #13120
	add	ip, ip, #48
	ldr	ip, [ip, #4]
	cmp	ip, #0
	addne	r1, r1, #13120
	addne	r1, r1, #52
	addne	r1, r7, r1
	bne	.L19
	b	.L59
.L23:
	ldr	ip, [r1, #4]!
	cmp	ip, #0
	beq	.L17
.L19:
	add	r5, r5, #1
	cmp	r5, r0
	bne	.L23
.L16:
	ldr	r2, [fp, #-60]
	cmp	r2, #0
	beq	.L24
	ldr	r1, [fp, #-64]
	add	r2, r7, r1, lsl #2
	str	r3, [r2, #3072]
	add	r3, r1, #1
	str	r3, [fp, #-64]
.L12:
	ldr	r3, [r10, #2072]
	add	r6, r6, #1
	cmp	r3, r6
	bgt	.L26
	ldr	r9, [fp, #-64]
	ldr	r8, [fp, #-68]
	mov	r1, r9
	mov	r3, r8
.L8:
	ldr	r2, [r7, #3036]
	str	r1, [r7, #3064]
	cmp	r2, r9
	str	r3, [r7, #3068]
	ble	.L31
	add	r3, r9, #764
	mov	r1, #0
	add	r3, r3, #3
	add	r3, r7, r3, lsl #2
.L30:
	add	r9, r9, #1
	str	r1, [r3, #4]!
	cmp	r9, r2
	bne	.L30
.L31:
	cmp	r2, r8
	addgt	r1, r8, #784
	movgt	r3, #0
	addgt	r7, r7, r1, lsl #2
	ble	.L5
.L32:
	add	r8, r8, #1
	str	r3, [r7, #4]!
	cmp	r8, r2
	bne	.L32
.L5:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L56:
	cmp	r2, r3
	movle	r3, #1
	strle	r3, [fp, #-60]
	ble	.L10
	cmp	r2, r1
	movlt	r3, #0
	movge	r3, #1
	str	r3, [fp, #-60]
	b	.L10
.L24:
	ldr	r1, [fp, #-68]
	add	r2, r7, r1, lsl #2
	str	r3, [r2, #3140]
	add	r3, r1, #1
	str	r3, [fp, #-68]
	b	.L12
.L59:
	mov	r5, ip
.L17:
	ldr	r1, [r3, #28]
	ldr	r0, [r7, #276]
	str	r3, [fp, #-72]
	str	r2, [fp, #-76]
	bl	FSP_GetLogicFs
	ldr	r3, [fp, #-72]
	subs	lr, r0, #0
	beq	.L20
	ldr	r1, [lr, #28]
	ldr	r2, [fp, #-76]
	cmp	r1, #0
	beq	.L20
	mov	r1, #70
	mov	r0, #280
	mla	r1, r1, r2, r5
	mla	r2, r0, r2, r7
	mov	r0, #1
	add	r1, r7, r1, lsl #2
	add	ip, r2, #13120
	add	r1, r1, #12288
	add	r2, r2, r5
	add	r2, r2, #13376
	str	r0, [r1, #884]
	ldr	r0, [lr, #28]
	ldr	r0, [r0, #4]
	str	r0, [r1, #948]
	ldr	r0, [r3, #8]
	str	r0, [r1, #1012]
	ldr	r0, [ip, #48]
	add	r0, r0, #1
	str	r0, [ip, #48]
	ldr	r0, [r3, #32]
	str	r0, [r1, #1076]
	str	r5, [r3, #36]
	mov	r3, #1
	strb	r3, [r2, #52]
	ldr	r3, [r4, #3208]
	b	.L16
.L57:
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r7, #276]
	bl	FSP_SetRef
	ldr	r3, [r4, #3208]
	b	.L14
.L34:
	mov	r3, #0
	mov	r1, r3
	mov	r8, r3
	mov	r9, r3
	b	.L8
.L58:
	mov	r0, r3
	ldr	r2, .L60
	mov	r3, #167
	ldr	r1, .L60+4
	bl	dprint_vfmw
	ldr	r3, [r4, #3208]
	b	.L16
.L20:
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	mov	r0, #0
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #28]
	stmia	sp, {r1, lr}
	mov	r3, ip
	str	r0, [sp, #8]
	ldr	r1, .L60+8
	bl	dprint_vfmw
	ldr	r3, [r4, #3208]
	b	.L16
.L61:
	.align	2
.L60:
	.word	.LC2
	.word	.LC3
	.word	.LC4
	UNWIND(.fnend)
	.size	HEVC_UpdateInterLayerReflist, .-HEVC_UpdateInterLayerReflist
	.align	2
	.type	HEVC_CheckThatAllRefPicsAreAvailable.part.15, %function
HEVC_CheckThatAllRefPicsAreAvailable.part.15:
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
	add	r7, r0, #4096
	ldr	r2, [r0, #2820]
	movw	ip, #5036
	ldr	r3, [r7, #748]
	movw	r4, #12668
	str	r1, [fp, #-64]
	ldr	r1, [r7, #1648]
	mla	ip, ip, r3, r2
	ldr	r3, [r7, #1644]
	ldr	lr, [r0, #2816]
	mov	r2, #1
	add	r3, r1, r3
	str	r3, [fp, #-60]
	mov	r5, r3
	ldr	r3, [r7, #1652]
	ldr	r1, [ip, #32]
	cmp	r5, r3
	mla	r1, r4, r1, lr
	ldr	r10, [r1, #116]
	mov	r10, r2, asl r10
	bcs	.L63
	add	r6, r5, #1456
	add	r9, r5, #5696
	add	r6, r6, #4
	add	r9, r9, #56
	ldr	r1, [r0, #3040]
	add	r3, r3, #5696
	sub	r10, r10, #1
	add	r6, r0, r6, lsl #2
	add	r9, r0, r9
	add	r3, r3, #56
	mov	r2, #0
	add	r3, r0, r3
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	str	r2, [fp, #-56]
.L64:
	cmp	r1, #0
	beq	.L70
	add	r3, r0, #3200
	mov	r8, #0
	add	r3, r3, #8
	mov	r2, r8
	ldr	r5, [r6, #-944]
	b	.L67
.L122:
	cmp	lr, #0
	beq	.L66
	ldr	r4, [ip, #8]
	ldr	lr, [r6]
	cmp	r4, lr
	beq	.L120
.L66:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r1
	beq	.L121
.L67:
	ldr	ip, [r3]
	cmp	r5, #0
	ldr	lr, [ip, #60]
	bne	.L122
	cmp	lr, #0
	beq	.L66
	ldr	r4, [r6]
	ldr	lr, [ip, #8]
	eor	lr, lr, r4
	tst	lr, r10
	bne	.L66
.L120:
	ldrb	lr, [ip, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L66
	ldr	lr, [r0, #2856]
	ldr	r4, [ip, #16]
	ldr	ip, [lr, #4]
	cmp	r4, ip
	movls	r8, #1
	bls	.L66
	ldr	ip, [lr, #644]
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	ip, #1
	movne	r8, #1
	cmp	r2, r1
	bne	.L67
.L121:
	cmp	r8, #0
	beq	.L70
.L68:
	ldr	r3, [fp, #-48]
	add	r9, r9, #1
	add	r6, r6, #4
	cmp	r9, r3
	bne	.L64
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L72
.L71:
	add	r5, r0, #5760
	add	r9, r0, #5696
	ldr	r10, [fp, #-60]
	add	r5, r5, #12
	ldr	ip, [fp, #-56]
	add	r9, r9, #56
	mov	r8, #0
.L76:
	cmp	r1, #0
	beq	.L77
	add	r4, r0, #3200
	mov	r6, #0
	add	r4, r4, #4
	mov	r3, r6
	str	ip, [fp, #-48]
	b	.L74
.L73:
	add	r3, r3, #1
	cmp	r3, r1
	beq	.L123
.L74:
	ldr	r2, [r4, #4]!
	ldr	lr, [r2, #60]
	cmp	lr, #0
	bne	.L73
	ldr	ip, [r5]
	ldr	lr, [r7, #724]
	add	lr, lr, ip
	ldr	ip, [r2, #8]
	cmp	ip, lr
	bne	.L73
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L73
	ldr	lr, [r0, #2856]
	ldr	r2, [r2, #16]
	ldr	ip, [lr, #4]
	cmp	r2, ip
	movls	r6, #1
	bls	.L73
	ldr	r2, [lr, #644]
	add	r3, r3, #1
	cmp	r2, #1
	movne	r6, #1
	cmp	r3, r1
	bne	.L74
.L123:
	cmp	r6, #0
	ldr	ip, [fp, #-48]
	beq	.L77
.L75:
	add	r8, r8, #1
	add	r5, r5, #4
	cmp	r10, r8
	add	r9, r9, #1
	bhi	.L76
	str	ip, [fp, #-56]
.L72:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L85
	ldr	r3, [fp, #-64]
	mov	r0, #0
	ldr	r2, [fp, #-52]
	str	r2, [r3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L77:
	ldr	r2, [r7, #744]
	ldr	r3, [r7, #724]
	ldr	lr, [r5]
	add	r2, r0, r2, lsl #2
	add	r3, r3, lr
	ldr	r2, [r2, #244]
	cmp	r3, r2
	blt	.L75
	ldrb	r2, [r9]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [fp, #-52]
	movne	ip, #1
	movne	r2, r3
	str	r2, [fp, #-52]
	b	.L75
.L70:
	ldr	r2, [r7, #744]
	ldr	r3, [r7, #724]
	ldr	ip, [r6, #-68]
	add	r2, r0, r2, lsl #2
	add	r3, r3, ip
	ldr	r2, [r2, #244]
	cmp	r3, r2
	blt	.L68
	ldrb	r2, [r9]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [fp, #-52]
	movne	r2, r3
	ldr	r3, [fp, #-56]
	str	r2, [fp, #-52]
	movne	r3, #1
	str	r3, [fp, #-56]
	b	.L68
.L85:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L63:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L85
	mov	r3, #0
	ldr	r1, [r0, #3040]
	str	r3, [fp, #-52]
	str	r3, [fp, #-56]
	b	.L71
	UNWIND(.fnend)
	.size	HEVC_CheckThatAllRefPicsAreAvailable.part.15, .-HEVC_CheckThatAllRefPicsAreAvailable.part.15
	.align	2
	.type	HEVC_SetFrmRepeatCount.part.16, %function
HEVC_SetFrmRepeatCount.part.16:
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
	ldr	ip, [r0, #316]
	ldr	r2, [r0, #3036]
	ldr	r3, [r0, #312]
	add	r2, r2, ip
	add	ip, r2, #1
	cmp	r3, ip
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movhi	r3, #2
	movls	r3, #1
	strhi	r3, [r1, #16]
	strls	r3, [r1, #16]
	ldrhi	r3, [r0, #316]
	ldrls	r3, [r0, #316]
	addhi	r3, r3, #2
	addls	r3, r3, #1
	str	r3, [r0, #316]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount.part.16, .-HEVC_SetFrmRepeatCount.part.16
	.align	2
	.type	HEVC_OutputFrame, %function
HEVC_OutputFrame:
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
	mov	r6, r1
	ldr	r0, [r0, #276]
	ldr	r1, [r1, #28]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L179
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L180
.L131:
	mov	r2, #1
	ldr	r1, [r6, #28]
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	add	r3, r4, #6144
	ldr	r0, [r4, #276]
	add	r3, r3, #40
	str	r5, [sp]
	mov	r2, r4
	mov	r1, #16
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L181
.L151:
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r5, #16]
	bcs	.L182
.L149:
	ldr	r2, [r4, #324]
	mov	r0, #0
	ldr	r3, [r4, #316]
	add	r2, r2, #1
	str	r2, [r4, #324]
	add	r3, r3, #1
	str	r3, [r4, #316]
.L172:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L182:
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.16
	b	.L149
.L180:
	ldr	r1, [r6, #28]
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	cmp	r3, #6
	beq	.L183
	bics	r2, r3, #4
	bne	.L146
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L131
	b	.L147
.L146:
	cmp	r3, #5
	bne	.L131
	ldr	r3, [r6, #32]
	cmp	r3, #1
	beq	.L131
.L147:
	ldr	r1, [r6, #28]
	mov	r2, #0
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	b	.L151
.L183:
	cmp	r6, #0
	addeq	r3, r4, #2416
	moveq	r9, r3
	beq	.L133
	ldr	r3, [r6, #32]
	cmp	r3, #0
	addne	r7, r4, #2608
	addeq	r3, r4, #2416
	addne	r7, r7, #4
	addne	r3, r4, #2416
	moveq	r7, r3
	moveq	r9, r3
	ldrh	r1, [r7, #2]
	movne	r9, r3
	ldrh	r0, [r7]
	add	r2, r1, #1
	and	r3, r2, #15
	cmp	r3, r0
	beq	.L184
.L136:
	mov	r3, r1, asl #4
	ldr	r0, [r6, #8]
	sub	r3, r3, r1, asl #2
	and	r2, r2, #15
	add	r3, r7, r3
	str	r0, [r3, #4]
	ldr	r1, [r6, #28]
	str	r1, [r3, #8]!
	str	r5, [r3, #4]
	strh	r2, [r7, #2]	@ movhi
.L133:
	add	r3, r4, #6144
	str	r5, [fp, #-52]
	mov	r5, r9
	mov	r1, r3
	ldrh	r3, [r9]
	add	r1, r1, #40
	str	r1, [fp, #-48]
.L137:
	ldrh	r2, [r5, #2]
	cmp	r2, r3
	beq	.L176
.L187:
	add	r8, r4, #2608
	add	r8, r8, #4
	ldrh	r6, [r8]
	ldrh	r2, [r8, #2]
	cmp	r2, r6
	beq	.L176
	mov	r7, r3, asl #4
	sub	r7, r7, r3, asl #2
	add	r7, r4, r7
	ldr	r1, [r7, #2428]
	cmp	r1, #0
	beq	.L176
	mov	r10, r6, asl #2
	mov	r6, r6, asl #4
	rsb	r9, r10, r6
	add	r9, r4, r9
	add	r2, r9, #2608
	add	r2, r2, #12
	ldr	r3, [r2, #4]
	cmp	r3, #0
	beq	.L176
	ldr	r3, [r7, #2420]
	ldr	r0, [r9, #2616]
	cmp	r3, r0
	bgt	.L185
	blt	.L186
	ldr	r3, [r1, #180]
	cmp	r3, #0
	beq	.L142
	mov	r3, #0
	str	r3, [r1, #180]
	ldr	r3, [r2, #4]
	mov	r2, #1
	str	r2, [r3, #180]
	ldr	r1, [r7, #2428]
.L142:
	ldr	r0, [r4, #276]
	mov	r2, r4
	str	r1, [sp]
	mov	r1, #16
	ldr	r3, [fp, #-48]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L143
	ldr	r2, .L188
	mov	r0, #1
	ldr	r1, .L188+4
	ldr	r3, [r7, #2420]
	bl	dprint_vfmw
	ldr	r1, [r7, #2424]
	mov	r2, #0
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
.L143:
	ldrh	r1, [r5]
	rsb	r6, r10, r6
	add	r6, r4, r6
	ldr	r3, [fp, #-48]
	add	r1, r1, #1
	mov	r2, r4
	and	r1, r1, #15
	strh	r1, [r5]	@ movhi
	ldr	ip, [r6, #2624]
	mov	r1, #16
	ldr	r0, [r4, #276]
	str	ip, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L144
	ldr	r3, [r9, #2616]
	mov	r0, #1
	ldr	r2, .L188
	ldr	r1, .L188+8
	bl	dprint_vfmw
.L177:
	ldr	r1, [r9, #2620]
	mov	r2, #0
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
.L144:
	ldrh	r3, [r8]
	add	r3, r3, #1
	and	r3, r3, #15
	strh	r3, [r8]	@ movhi
	ldrh	r3, [r5]
	ldrh	r2, [r5, #2]
	cmp	r2, r3
	bne	.L187
.L176:
	ldr	r5, [fp, #-52]
	b	.L151
.L185:
	str	r0, [sp]
	mov	r0, #1
	ldr	r2, .L188
	ldr	r1, .L188+12
	bl	dprint_vfmw
	b	.L177
.L186:
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L188
	mov	r0, #1
	ldr	r1, .L188+16
	bl	dprint_vfmw
	ldr	r1, [r7, #2424]
	mov	r2, #0
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	ldrh	r3, [r5]
	add	r3, r3, #1
	and	r3, r3, #15
	strh	r3, [r5]	@ movhi
	b	.L137
.L181:
	ldr	r2, .L188+20
	mov	r0, #1
	ldr	r1, .L188+24
	bl	dprint_vfmw
	ldr	r0, [r4, #276]
	ldr	r1, [r6, #28]
	mov	r2, #0
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L172
.L179:
	ldr	r2, .L188+20
	ldr	r1, .L188+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L172
.L184:
	mov	r1, r3, asl #4
	mov	r2, #0
	sub	r3, r1, r3, asl #2
	ldr	r0, [r4, #276]
	add	r3, r7, r3
	ldr	r8, [r3, #8]
	mov	r1, r8
	bl	FSP_SetDisplay
	ldrh	r2, [r7]
	ldr	r1, .L188+32
	mov	r3, r8
	add	r2, r2, #1
	mov	r0, #1
	and	r2, r2, #15
	strh	r2, [r7]	@ movhi
	ldr	r2, [r6, #32]
	bl	dprint_vfmw
	ldrh	r1, [r7, #2]
	add	r2, r1, #1
	b	.L136
.L189:
	.align	2
.L188:
	.word	.LANCHOR0+20
	.word	.LC9
	.word	.LC10
	.word	.LC7
	.word	.LC8
	.word	.LANCHOR0
	.word	.LC11
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	HEVC_OutputFrame, .-HEVC_OutputFrame
	.align	2
	.global	HEVC_CheckVpsExtOverlap
	.type	HEVC_CheckVpsExtOverlap, %function
HEVC_CheckVpsExtOverlap:
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
	beq	.L195
	ldrb	ip, [r0]	@ zero_extendqisi2
	add	r2, r0, #12288
	ldr	r3, [r1]
	mov	r0, #0
	cmp	ip, r0
	orrne	r3, r3, #1
	str	r3, [r1]
	ldrb	r2, [r2, #200]	@ zero_extendqisi2
	cmp	r2, r0
	movne	r2, #2
	moveq	r2, r0
	orr	r3, r2, r3
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L195:
	ldr	r2, .L196
	mov	r0, #1
	ldr	r1, .L196+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L197:
	.align	2
.L196:
	.word	.LANCHOR0+48
	.word	.LC12
	UNWIND(.fnend)
	.size	HEVC_CheckVpsExtOverlap, .-HEVC_CheckVpsExtOverlap
	.align	2
	.global	HEVC_CheckPpsExtOverlap
	.type	HEVC_CheckPpsExtOverlap, %function
HEVC_CheckPpsExtOverlap:
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
	subs	r2, r0, #0
	beq	.L203
	ldrb	ip, [r2]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r3, [r1]
	cmp	ip, r0
	orrne	r3, r3, #1
	str	r3, [r1]
	ldrb	r2, [r2, #3144]	@ zero_extendqisi2
	cmp	r2, r0
	movne	r2, #2
	moveq	r2, r0
	orr	r3, r2, r3
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L203:
	ldr	r2, .L204
	mov	r0, #1
	ldr	r1, .L204+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L205:
	.align	2
.L204:
	.word	.LANCHOR0+72
	.word	.LC13
	UNWIND(.fnend)
	.size	HEVC_CheckPpsExtOverlap, .-HEVC_CheckPpsExtOverlap
	.align	2
	.global	HEVC_CheckSliceExtOverlap
	.type	HEVC_CheckSliceExtOverlap, %function
HEVC_CheckSliceExtOverlap:
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
	subs	r2, r0, #0
	beq	.L211
	ldrb	ip, [r2]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r3, [r1]
	cmp	ip, r0
	orrne	r3, r3, #1
	str	r3, [r1]
	ldrb	r2, [r2, #16]	@ zero_extendqisi2
	cmp	r2, r0
	movne	r2, #2
	moveq	r2, r0
	orr	r3, r2, r3
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L211:
	ldr	r2, .L212
	mov	r0, #1
	ldr	r1, .L212+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L213:
	.align	2
.L212:
	.word	.LANCHOR0+96
	.word	.LC14
	UNWIND(.fnend)
	.size	HEVC_CheckSliceExtOverlap, .-HEVC_CheckSliceExtOverlap
	.align	2
	.global	HEVC_Sei_ParsePts_Init
	.type	HEVC_Sei_ParsePts_Init, %function
HEVC_Sei_ParsePts_Init:
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
	ldr	r3, .L215
	mov	r4, r0
	add	r0, r0, #11712
	mov	r2, #56
	mov	r1, #0
	add	r0, r0, #16
	ldr	r3, [r3, #48]
	blx	r3
	add	r3, r4, #3488
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	strd	r0, [r3, #40]
	strd	r0, [r3, #16]
	strd	r0, [r3, #24]
	strd	r0, [r3, #32]
	str	r2, [r4, #3484]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L216:
	.align	2
.L215:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_Sei_ParsePts_Init, .-HEVC_Sei_ParsePts_Init
	.align	2
	.global	HEVC_Sei_Get_Dpb_Output_Time
	.type	HEVC_Sei_Get_Dpb_Output_Time, %function
HEVC_Sei_Get_Dpb_Output_Time:
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
	add	r3, r0, #4096
	ldr	lr, [r0, #164]
	ldr	ip, [r3, #748]
	cmp	ip, #0
	blt	.L219
	cmp	ip, lr
	bge	.L219
	ldr	r3, [r0, #2820]
	movw	r2, #5036
	mla	ip, r2, ip, r3
	ldr	lr, [ip, #32]
	ldr	ip, [r0, #160]
	cmp	lr, #0
	blt	.L223
	cmp	lr, ip
	bge	.L223
	ldr	r2, [r0, #2816]
	movw	r4, #12668
	ldr	r3, [r1, #36]
	add	ip, r0, #8192
	mla	lr, r4, lr, r2
	str	r3, [ip, #3548]
	ldr	r2, [r1, #40]
	ldr	r3, [ip, #3540]
	str	r2, [ip, #3552]
	cmp	r3, #1
	ldr	r3, [lr, #52]
	add	r3, r3, #90
	ldrb	r6, [lr, r3, asl #2]	@ zero_extendqisi2
	beq	.L231
	ldrb	r3, [ip, #3537]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L227
	ldrb	r3, [r0, #3480]	@ zero_extendqisi2
	add	lr, r0, #3488
	cmp	r3, #0
	beq	.L228
	ldrd	r2, [lr, #24]
	mov	r8, r2
	mov	r9, r3
.L229:
	ldr	r4, [r0, #3496]
	mov	r5, #0
	adds	r2, r2, r4
	adc	r3, r3, r5
	cmp	r2, r8
	sbcs	r7, r3, r9
	strd	r2, [lr, #40]
	strd	r2, [lr, #16]
	bge	.L226
	adds	r2, r4, r8
	adc	r3, r5, r9
	strd	r2, [lr, #40]
	strd	r2, [lr, #16]
	b	.L226
.L223:
	ldr	r3, [r0, #276]
	movw	r2, #2625
	str	ip, [sp, #4]
	mov	r0, #0
	str	lr, [sp]
	ldr	r1, .L233
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L219:
	ldr	r3, [r0, #276]
	movw	r2, #2615
	str	lr, [sp, #4]
	mov	r0, #0
	str	ip, [sp]
	ldr	r1, .L233+4
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L227:
	add	lr, r0, #3488
	ldr	r4, [r0, #3496]
	ldrd	r2, [lr, #16]
	adds	r2, r2, r4
	adc	r3, r3, #0
	strd	r2, [lr, #40]
.L226:
	add	r7, ip, #3536
	strd	r2, [lr, #32]
	mov	lr, #0
	strb	lr, [ip, #3537]
	ldrd	r4, [r7, #32]
	strd	r4, [r7, #48]
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	cmp	r1, lr
	ldr	r1, [r0, #3500]
	bne	.L232
	adds	r2, r2, r1
	adc	r3, r3, #0
	subs	r2, r2, r6
	sbc	r3, r3, #0
	strd	r2, [r7, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L232:
	adds	r2, r2, r1
	adc	r3, r3, #0
	movs	r3, r3, asr #1
	mov	r2, r2, rrx
	subs	r2, r2, r6
	sbc	r3, r3, #0
	strd	r2, [r7, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L231:
	ldr	r2, [r0, #3484]
	add	lr, r0, #3488
	mov	r3, r2, asr #31
	strd	r2, [lr, #40]
	strd	r2, [lr, #16]
	b	.L226
.L228:
	ldrd	r2, [lr, #16]
	ldrd	r8, [lr, #24]
	b	.L229
.L234:
	.align	2
.L233:
	.word	.LC16
	.word	.LC15
	UNWIND(.fnend)
	.size	HEVC_Sei_Get_Dpb_Output_Time, .-HEVC_Sei_Get_Dpb_Output_Time
	.align	2
	.global	HEVC_Get_Last_IDR_Frame_Info
	.type	HEVC_Get_Last_IDR_Frame_Info, %function
HEVC_Get_Last_IDR_Frame_Info:
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
	sub	r3, r1, #19
	cmp	r3, #1
	bls	.L239
.L236:
	sub	r1, r1, #6
	cmp	r1, #3
	addhi	r0, r0, #3488
	ldrhid	r2, [r0, #40]
	strhid	r2, [r0, #24]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L239:
	ldr	ip, [r0, #2856]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r4, [ip, #64]
	cmp	r5, r3
	cmpeq	r4, r2
	beq	.L237
	add	r3, r0, #11712
	movw	ip, #11760
	add	r2, r0, #11776
	strd	r4, [r3, #40]
	ldrd	r4, [r0, ip]
	strd	r4, [r2, #-8]
	strd	r4, [r2]
.L237:
	add	r3, r0, #8192
	mov	r2, #1
	strb	r2, [r3, #3536]
	b	.L236
	UNWIND(.fnend)
	.size	HEVC_Get_Last_IDR_Frame_Info, .-HEVC_Get_Last_IDR_Frame_Info
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.align	2
	.global	HEVC_Sei_Get_Frame_Pts
	.type	HEVC_Sei_Get_Frame_Pts, %function
HEVC_Sei_Get_Frame_Pts:
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
	add	r3, r0, #11712
	add	r2, r0, #8192
	add	r3, r3, #48
	mov	r4, r0
	add	r0, r0, #11776
	ldr	r5, [r2, #3548]
	movw	r1, #11760
	ldr	r10, [r2, #3552]
	ldrd	r2, [r3, #-8]
	cmp	r5, #0
	ldrd	r6, [r4, r1]
	strd	r2, [fp, #-52]
	ldrd	r2, [r0, #-8]
	strd	r2, [fp, #-60]
	beq	.L243
	mov	r9, r5
	mov	r0, r10
	b	.L242
.L244:
	mov	r9, r1
.L242:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L244
.L241:
	ldrd	r2, [fp, #-60]
	mov	r1, r9
	mov	r0, r5
	mov	r8, #1000
	subs	r2, r6, r2
	movw	r5, #4752
	mul	r6, r8, r2
	bl	__aeabi_uidiv
	mov	r1, r9
	mul	r6, r0, r6
	mov	r0, r10
	bl	__aeabi_uidiv
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_uidiv
	ldrd	r2, [fp, #-52]
	adds	r2, r2, r0
	adc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	strd	r0, [r4, r5]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L243:
	mov	r9, r10
	b	.L241
	UNWIND(.fnend)
	.size	HEVC_Sei_Get_Frame_Pts, .-HEVC_Sei_Get_Frame_Pts
	.align	2
	.global	HEVC_InitSigLastScan
	.type	HEVC_InitSigLastScan, %function
HEVC_InitSigLastScan:
	UNWIND(.fnstart)
	@ args = 16, pretend = 0, frame = 24
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
	ldr	r4, [fp, #8]
	str	r0, [fp, #-48]
	cmp	r4, #15
	ldr	r6, [fp, #4]
	bgt	.L246
	cmp	r4, #8
	mul	r9, r4, r4
	beq	.L279
	cmp	r9, #0
	movne	r10, r6
	beq	.L246
.L248:
	mov	r5, #0
	rsb	r7, r4, #1
	mov	r8, r5
.L254:
	cmp	r4, r8
	bgt	.L266
	rsb	lr, r4, r8
	sub	r2, r4, #1
	add	lr, lr, #1
.L255:
	cmp	r2, #0
	cmpge	r4, lr
	ble	.L252
	mla	r0, r2, r4, lr
	add	ip, r10, r5, lsl #2
	mov	r1, r5
.L253:
	add	r1, r1, #1
	sub	r2, r2, #1
	rsb	r3, r5, r1
	str	r0, [ip], #4
	add	r3, r3, lr
	add	r0, r0, r7
	cmp	r2, #0
	cmpge	r4, r3
	bgt	.L253
	mov	r5, r1
.L252:
	cmp	r9, r5
	add	r8, r8, #1
	bhi	.L254
.L246:
	cmp	r4, #4
	ble	.L245
	mov	r3, r4, asr #2
	ldr	r1, [fp, #-48]
	str	r3, [fp, #-60]
	mov	r2, r3
	add	r3, r1, r3
	mul	r2, r2, r2
	mov	r0, r2
	str	r2, [fp, #-56]
	cmp	r0, #0
	ldrsb	r2, [r3, #15]
	add	r2, r2, #1
	beq	.L245
	add	r3, r1, #376
.L250:
	rsb	r5, r4, #1
	mov	r2, r2, asl #14
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r2, [fp, #-64]
	str	r3, [fp, #-48]
.L264:
	ldr	r3, .L280
	cmp	r4, #32
	ldr	r1, [fp, #-48]
	mov	r8, #0
	ldr	r2, [fp, #-64]
	ldr	r3, [r3]
	add	r2, r2, r1
	ldr	r9, [fp, #-60]
	ldr	r7, [r3, r2, asl #2]
	ldreq	r3, [fp, #-52]
	mov	r1, r9
	ldreq	r7, [r3]
	mov	r0, r7
	bl	__aeabi_uidiv
	ldr	ip, [fp, #-48]
	mov	r3, r8
	mov	r2, r8
	mov	lr, r8
	mov	r10, ip, asl #4
	mla	r1, r4, r0, r7
	mls	r1, r9, r0, r1
	mov	r9, r1, asl #2
.L258:
	cmp	lr, #3
	mvn	r1, r2
	mov	r1, r1, lsr #31
	movgt	r1, #0
	cmp	r1, #0
	beq	.L259
	mla	r1, r2, r4, lr
	add	r0, r3, r10
	rsb	lr, r3, lr
	add	r0, r6, r0, lsl #2
	add	r1, r1, r9
.L260:
	add	r3, r3, #1
	sub	r2, r2, #1
	add	r7, lr, r3
	str	r1, [r0], #4
	cmp	r7, #3
	mvn	ip, r2
	mov	ip, ip, lsr #31
	add	r1, r1, r5
	movgt	ip, #0
	cmp	ip, #0
	bne	.L260
.L259:
	cmp	r3, #15
	add	r8, r8, #1
	bhi	.L261
	cmp	r8, #3
	movle	r2, r8
	movle	lr, #0
	subgt	lr, r8, #3
	movgt	r2, #3
	b	.L258
.L261:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	add	r2, r2, #4
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L264
.L245:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L266:
	mov	r2, r8
	mov	lr, #0
	b	.L255
.L279:
	add	r3, r0, #376
	cmp	r9, #0
	mov	r10, r3
	bne	.L248
	ldr	r2, [fp, #-48]
	mov	r1, #2
	str	r1, [fp, #-60]
	mov	r1, #4
	str	r1, [fp, #-56]
	ldrsb	r2, [r2, #17]
	add	r2, r2, #1
	b	.L250
.L281:
	.align	2
.L280:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	HEVC_InitSigLastScan, .-HEVC_InitSigLastScan
	.align	2
	.global	HEVC_InitScalingOrderTable
	.type	HEVC_InitScalingOrderTable, %function
HEVC_InitScalingOrderTable:
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
	add	r3, r0, #14
	add	r1, r0, #143
	mov	r6, r0
	mvn	r2, #0
.L283:
	strb	r2, [r3, #1]!
	cmp	r3, r1
	bne	.L283
	ldr	r7, .L287
	mov	r2, #0
	mov	r3, #2
	mov	r4, r2
	mov	r5, r3
	strb	r2, [r6, #19]
	strb	r3, [r6, #31]
	mov	r2, #1
	mov	r3, #3
	strb	r2, [r6, #23]
	strb	r3, [r6, #47]
	mov	r3, #4
	strb	r3, [r6, #79]
.L284:
	ldr	r1, [r7]
	mov	r3, #0
	str	r4, [sp, #12]
	mov	r2, r3
	add	r1, r1, r4, lsl #16
	str	r5, [sp, #8]
	str	r5, [sp, #4]
	add	r4, r4, #1
	str	r1, [sp]
	mov	r0, r6
	mov	r1, r3
	mov	r5, r5, asl #1
	bl	HEVC_InitSigLastScan
	cmp	r4, #7
	bne	.L284
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L288:
	.align	2
.L287:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	HEVC_InitScalingOrderTable, .-HEVC_InitScalingOrderTable
	.global	__aeabi_idiv
	.align	2
	.global	HEVC_GetDar
	.type	HEVC_GetDar, %function
HEVC_GetDar:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #0
	mov	ip, r1
	mov	r5, r3
	ble	.L302
	subs	lr, r0, #255
	movne	lr, #1
	cmp	r0, #16
	movle	r4, #0
	andgt	r4, lr, #1
	cmp	r4, #0
	bne	.L302
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
	cmp	r0, #255
	movne	r1, #0
	andeq	r1, r1, #1
	cmp	r1, #0
	bne	.L290
	cmp	r0, #1
	beq	.L317
	cmp	lr, #0
	ldrne	r3, .L319
	addne	r0, r3, r0, lsl #3
	ldrne	r2, [r0, #128]
	ldrne	ip, [r0, #124]
	mov	r1, r2
	mov	r0, ip, asl #10
	bl	__aeabi_idiv
	ldr	r1, [fp, #4]
	mov	r4, r0
	mov	r0, r5, asl #10
	bl	__aeabi_idiv
	movw	r3, #2405
	movw	r2, #2262
	mul	r0, r0, r4
	add	r4, r0, #1020
	cmp	r0, #0
	add	r4, r4, #3
	movlt	r0, r4
	mov	r0, r0, asr #10
	cmp	r0, r3
	rsble	r3, r0, #2400
	subgt	r3, r0, #2400
	addle	r3, r3, #6
	subgt	r3, r3, #6
	cmp	r0, r2
	bgt	.L295
	rsb	r2, r0, #2256
	add	r2, r2, #7
	cmp	r3, r2
	blt	.L310
.L296:
	movw	r3, #1819
	cmp	r0, r3
	bgt	.L297
	rsb	r3, r0, #1808
	add	r3, r3, #12
	cmp	r2, r3
	bge	.L298
.L312:
	mov	r4, #3
	b	.L290
.L302:
	mov	r4, #0
.L290:
	mov	r2, r4
	ldr	r1, .L319+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L295:
	sub	r2, r0, #2256
	sub	r2, r2, #7
	cmp	r3, r2
	bge	.L296
.L310:
	mov	r4, #4
	b	.L290
.L317:
	ldr	r2, [fp, #4]
	movw	r3, #4320
	cmp	r5, #7680
	cmpeq	r2, r3
	bne	.L318
.L307:
	mov	r4, #2
	b	.L290
.L297:
	sub	r3, r0, #1808
	sub	r3, r3, #12
	cmp	r2, r3
	blt	.L312
.L298:
	movw	r2, #1364
	cmp	r0, r2
	rsble	r4, r0, #1360
	subgt	r4, r0, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r3, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L290
.L318:
	cmp	r5, #3840
	cmpeq	r2, #2160
	beq	.L307
	sub	r3, r2, #1072
	sub	r3, r3, #8
	bics	r3, r3, #8
	moveq	r3, #1
	movne	r3, #0
	cmp	r5, #1920
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L307
	cmp	r5, #1280
	cmpeq	r2, #720
	beq	.L307
	cmp	r5, #640
	cmpeq	r2, #480
	moveq	r4, #1
	movne	r4, #5
	b	.L290
.L320:
	.align	2
.L319:
	.word	.LANCHOR0
	.word	.LC17
	UNWIND(.fnend)
	.size	HEVC_GetDar, .-HEVC_GetDar
	.align	2
	.global	HEVC_PrintNaluArraySlot
	.type	HEVC_PrintNaluArraySlot, %function
HEVC_PrintNaluArraySlot:
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
	ldr	r1, .L327
	mov	r6, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #168]
	cmn	r3, #1
	movne	r5, #0
	movwne	r7, #52429
	movne	r4, r5
	movtne	r7, 52428
	bne	.L324
	b	.L325
.L323:
	ldr	r3, [r6, #168]
	add	r3, r3, #1
	cmp	r3, r4
	bls	.L325
.L324:
	ldr	r3, [r6, #2852]
	mov	r2, r4
	ldr	r1, .L327+4
	mov	r0, #1
	add	r3, r3, r5
	add	r5, r5, #96
	ldr	ip, [r3, #32]
	str	ip, [sp]
	bl	dprint_vfmw
	umull	r2, r3, r4, r7
	mov	r2, r3, lsr #3
	mov	r3, r2, asl #3
	add	r3, r3, r2, lsl #1
	cmp	r4, r3
	add	r4, r4, #1
	bne	.L323
	ldr	r1, .L327+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #168]
	add	r3, r3, #1
	cmp	r3, r4
	bhi	.L324
.L325:
	ldr	r1, .L327+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, .L327+12
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L328:
	.align	2
.L327:
	.word	.LC18
	.word	.LC21
	.word	.LC19
	.word	.LC20
	UNWIND(.fnend)
	.size	HEVC_PrintNaluArraySlot, .-HEVC_PrintNaluArraySlot
	.align	2
	.global	HEVC_PrintCurrSlicelistX
	.type	HEVC_PrintCurrSlicelistX, %function
HEVC_PrintCurrSlicelistX:
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
	add	r6, r0, #4096
	mov	r7, r0
	ldr	r1, .L350
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #780]
	ldr	r1, .L350+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #780]
	cmp	r3, #0
	addne	r5, r7, #2864
	movne	r4, #0
	beq	.L337
.L336:
	ldr	r3, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L350+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
	ldr	r3, [r5]
	add	r4, r4, r0
	ldr	r1, .L350+12
	cmp	r3, #0
	beq	.L334
	ldr	r2, [r3, #20]
	bl	dprint_vfmw
	ldr	r3, [r5]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L334
	ldr	r1, [r3, #28]
	ldr	r0, [r7, #276]
	bl	FSP_GetLogicFs
	ldr	r1, .L350+16
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
.L334:
	ldr	r1, .L350+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #780]
	cmp	r3, r4
	bhi	.L336
.L337:
	ldr	r2, [r6, #784]
	mov	r0, #1
	ldr	r1, .L350+24
	bl	dprint_vfmw
	ldr	r3, [r6, #784]
	cmp	r3, #0
	addne	r5, r7, #2928
	movne	r4, #0
	addne	r5, r5, #4
	beq	.L332
.L341:
	ldr	r3, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L350+28
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
	ldr	r3, [r5]
	add	r4, r4, r0
	ldr	r1, .L350+12
	cmp	r3, #0
	beq	.L339
	ldr	r2, [r3, #20]
	bl	dprint_vfmw
	ldr	r3, [r5]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L339
	ldr	r1, [r3, #28]
	ldr	r0, [r7, #276]
	bl	FSP_GetLogicFs
	ldr	r1, .L350+16
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
.L339:
	ldr	r1, .L350+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #784]
	cmp	r3, r4
	bhi	.L341
.L332:
	ldr	r1, .L350+32
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L351:
	.align	2
.L350:
	.word	.LC22
	.word	.LC23
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC19
	.word	.LC24
	.word	.LC29
	.word	.LC28
	UNWIND(.fnend)
	.size	HEVC_PrintCurrSlicelistX, .-HEVC_PrintCurrSlicelistX
	.align	2
	.global	HEVC_PrintFrameStoreState
	.type	HEVC_PrintFrameStoreState, %function
HEVC_PrintFrameStoreState:
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
	ldr	r1, .L359
	mov	r10, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r10, #180]
	cmp	r3, #0
	addne	r8, r10, #13696
	movne	r9, #0
	addne	r8, r8, #32
	beq	.L356
.L355:
	ldrb	ip, [r8, #2]	@ zero_extendqisi2
	mov	r3, r8
	mov	r2, r9
	ldr	r1, .L359+4
	mov	r0, #1
	add	r5, r8, #616
	str	ip, [sp, #8]
	mov	r4, #0
	ldrb	ip, [r8, #1]	@ zero_extendqisi2
	str	ip, [sp, #4]
	ldr	ip, [r8, #48]
	str	ip, [sp]
	bl	dprint_vfmw
.L354:
	ldrd	r6, [r5, #8]!
	mov	r2, r4
	ldr	r1, .L359+8
	add	r4, r4, #1
	mov	r0, #1
	strd	r6, [sp]
	bl	dprint_vfmw
	cmp	r4, #4
	bne	.L354
	ldr	r1, .L359+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r10, #180]
	add	r9, r9, #1
	add	r8, r8, #720
	cmp	r3, r9
	bhi	.L355
.L356:
	ldr	r1, .L359+16
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L360:
	.align	2
.L359:
	.word	.LC30
	.word	.LC32
	.word	.LC33
	.word	.LC19
	.word	.LC31
	UNWIND(.fnend)
	.size	HEVC_PrintFrameStoreState, .-HEVC_PrintFrameStoreState
	.align	2
	.global	HEVC_PrintAPCState
	.type	HEVC_PrintAPCState, %function
HEVC_PrintAPCState:
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
	ldr	r1, .L366
	mov	r6, r0
	mov	r0, #1
	bl	dprint_vfmw
	add	r6, r6, #13120
	add	r6, r6, #48
	mov	r7, #0
.L363:
	ldr	ip, [r6, #-4]
	mov	r2, r7
	ldr	r3, [r6]
	mov	r0, #1
	ldr	r1, .L366+4
	mov	r5, r6
	str	ip, [sp]
	mov	r4, #0
	bl	dprint_vfmw
.L362:
	ldr	r3, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L366+8
	add	r4, r4, #1
	mov	r0, #1
	ldr	ip, [r5, #128]
	str	ip, [sp, #4]
	ldr	ip, [r5, #64]
	str	ip, [sp]
	bl	dprint_vfmw
	cmp	r4, #16
	bne	.L362
	add	r7, r7, #1
	add	r6, r6, #280
	cmp	r7, #2
	bne	.L363
	ldr	r1, .L366+12
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L367:
	.align	2
.L366:
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	UNWIND(.fnend)
	.size	HEVC_PrintAPCState, .-HEVC_PrintAPCState
	.align	2
	.global	HEVC_PrintDPBState
	.type	HEVC_PrintDPBState, %function
HEVC_PrintDPBState:
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
	UNWIND(.pad #76)
	sub	sp, sp, #76
	ldr	r1, .L384
	mov	r9, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r9, #3052]
	ldr	lr, [r9, #3048]
	mov	r0, #1
	ldr	ip, [r9, #3056]
	ldr	r3, [r9, #3040]
	ldr	r2, [r9, #3036]
	stmia	sp, {r1, ip, lr}
	ldr	r1, .L384+4
	bl	dprint_vfmw
	ldr	r3, [r9, #3040]
	cmp	r3, #0
	addne	r4, r9, #3200
	movne	r5, #0
	addne	r4, r4, #4
	beq	.L373
.L372:
	ldr	r3, [r4, #4]!
	ldr	r0, [r9, #276]
	ldr	r2, [r3, #32]
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	lr, [r3, #48]
	ldrb	r6, [r3, #1]	@ zero_extendqisi2
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	ldr	r1, [r3, #28]
	str	r2, [fp, #-48]
	str	ip, [fp, #-52]
	str	lr, [fp, #-56]
	ldr	r8, [r3, #8]
	ldr	r10, [r3, #60]
	str	r6, [fp, #-60]
	str	r7, [fp, #-64]
	bl	FSP_GetLogicFs
	ldr	r3, [r4]
	ldr	r1, [r3, #28]
	mov	r6, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetRef
	ldr	r3, [r4]
	ldr	r1, [r3, #28]
	mov	r7, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetDisplay
	ldr	r1, [r4]
	ldr	lr, [fp, #-56]
	mov	r2, r5
	add	r5, r5, #1
	ldr	ip, [r1, #228]
	mov	r3, r1
	str	ip, [sp, #44]
	ldr	r1, [r1, #28]
	ldr	ip, [fp, #-52]
	str	r10, [sp, #24]
	str	r8, [sp, #20]
	str	r1, [sp, #40]
	ldr	r10, [fp, #-64]
	ldr	r1, [fp, #-48]
	ldr	r8, [fp, #-60]
	str	r10, [sp, #16]
	str	r1, [sp]
	str	r8, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	str	r7, [sp, #32]
	str	r6, [sp, #28]
	ldr	r1, .L384+8
	str	r0, [sp, #36]
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #3040]
	cmp	r3, r5
	bhi	.L372
.L373:
	ldr	r1, .L384+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #3040]
	cmp	r3, #0
	addne	r5, r9, #3200
	movne	r6, #0
	addne	r5, r5, #4
	bne	.L380
	b	.L371
.L383:
	bl	dprint_vfmw
	ldr	r2, [r4, #20]
	ldr	r1, .L384+16
	mov	r0, #1
	bl	dprint_vfmw
	ldrsb	r2, [r4]
	ldr	r1, .L384+20
	mov	r0, #1
	bl	dprint_vfmw
	ldrsb	r2, [r4, #1]
	ldr	r1, .L384+24
	mov	r0, #1
	bl	dprint_vfmw
.L375:
	cmp	r8, #0
	mov	r2, r8
	ldr	r1, .L384+28
	mov	r0, #1
	beq	.L376
	bl	dprint_vfmw
	ldr	r2, [r8, #76]
	ldr	r1, .L384+32
	mov	r0, #1
	bl	dprint_vfmw
.L377:
	cmp	r7, #0
	mov	r2, r7
	ldr	r1, .L384+36
	mov	r0, #1
	beq	.L378
	bl	dprint_vfmw
	ldr	r2, [r7, #76]
	ldr	r1, .L384+40
	mov	r0, #1
	bl	dprint_vfmw
.L379:
	ldr	r1, .L384+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #3040]
	add	r6, r6, #1
	cmp	r3, r6
	bls	.L371
.L380:
	ldr	r3, [r5, #4]!
	ldr	r0, [r9, #276]
	ldr	r1, [r3, #28]
	bl	FSP_GetLogicFs
	ldr	r3, [r5]
	ldr	r1, [r3, #28]
	mov	r4, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetDecPhyFs
	ldr	r3, [r5]
	ldr	r1, [r3, #28]
	mov	r8, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetDispPhyFs
	mov	r2, r6
	ldr	r1, .L384+44
	mov	r7, r0
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r4, #0
	mov	r2, r4
	ldr	r1, .L384+48
	mov	r0, #1
	bne	.L383
	ldr	r1, .L384+52
	mov	r0, #1
	bl	dprint_vfmw
	b	.L375
.L378:
	ldr	r1, .L384+56
	mov	r0, #1
	bl	dprint_vfmw
	b	.L379
.L376:
	ldr	r1, .L384+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L377
.L371:
	ldr	r1, .L384+64
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L385:
	.align	2
.L384:
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC19
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC48
	.word	.LC49
	.word	.LC51
	.word	.LC52
	.word	.LC42
	.word	.LC43
	.word	.LC47
	.word	.LC53
	.word	.LC50
	.word	.LC41
	UNWIND(.fnend)
	.size	HEVC_PrintDPBState, .-HEVC_PrintDPBState
	.align	2
	.global	HEVC_IsSliceUnit
	.type	HEVC_IsSliceUnit, %function
HEVC_IsSliceUnit:
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
	cmp	r0, #9
	bls	.L388
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L388:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsSliceUnit, .-HEVC_IsSliceUnit
	.align	2
	.global	HEVC_IsIUnit
	.type	HEVC_IsIUnit, %function
HEVC_IsIUnit:
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
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsIUnit, .-HEVC_IsIUnit
	.align	2
	.global	HEVC_IsNonRefPic
	.type	HEVC_IsNonRefPic, %function
HEVC_IsNonRefPic:
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
	bics	r0, r0, #6
	subne	r0, r0, #8
	clzne	r0, r0
	movne	r0, r0, lsr #5
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsNonRefPic, .-HEVC_IsNonRefPic
	.align	2
	.global	HEVC_IsFlushUnit
	.type	HEVC_IsFlushUnit, %function
HEVC_IsFlushUnit:
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
	sub	r0, r0, #16
	cmp	r0, #4
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsFlushUnit, .-HEVC_IsFlushUnit
	.align	2
	.global	HEVC_IsPVRFlushPic
	.type	HEVC_IsPVRFlushPic, %function
HEVC_IsPVRFlushPic:
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
	bne	.L396
	ldr	r3, [r0, #2856]
	ldr	r2, [r3, #660]
	cmp	r2, #1
	beq	.L400
.L399:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
.L396:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L400:
	ldr	r2, [r3, #656]
	cmp	r2, #1
	bne	.L399
	ldr	r2, [r3, #664]
	cmp	r2, #0
	bne	.L399
	ldr	r0, [r3, #620]
	add	r0, r0, #1024
	cmp	r0, #2048
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsPVRFlushPic, .-HEVC_IsPVRFlushPic
	.align	2
	.global	HEVC_IsEosNal
	.type	HEVC_IsEosNal, %function
HEVC_IsEosNal:
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
	mov	r1, #32
	mov	r4, r0
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	moveq	r0, #1
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsEosNal, .-HEVC_IsEosNal
	.align	2
	.global	HEVC_CalcTileInfo
	.type	HEVC_CalcTileInfo, %function
HEVC_CalcTileInfo:
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
	mov	r7, r1
	ldr	r1, [r0, #2844]
	mov	r5, r2
	ldr	r2, [r0, #2840]
	mov	r4, r0
	str	r3, [fp, #-48]
	ldr	r6, [r1, #68]
	ldr	r2, [r2, #128]
	sub	r3, r6, #1
	ldr	r8, [r1, #72]
	cmp	r3, #9
	str	r2, [fp, #-52]
	bhi	.L430
	sub	r3, r8, #1
	cmp	r3, #10
	bhi	.L431
	ldr	r9, .L432
	mov	r2, #512
	mov	r1, #0
	mov	r0, r7
	ldr	r3, [r9, #48]
	blx	r3
	ldr	r3, [r9, #48]
	mov	r2, #80
	mov	r1, #0
	mov	r0, r5
	blx	r3
	ldr	r3, [r9, #48]
	mov	r2, #88
	mov	r1, #0
	ldr	r0, [fp, #-48]
	blx	r3
	cmp	r6, #0
	ble	.L411
	ldr	r3, [fp, #-52]
	mov	ip, #0
	mov	lr, ip
	mov	r9, r5
	sub	r10, r3, #4
.L410:
	str	ip, [r5, lr, asl #3]
	mov	r3, ip, asl r10
	ldr	r2, [r4, #2844]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #172]
	add	ip, r2, ip
	sub	r2, ip, #1
	str	r2, [r9, #4]
	mov	r1, ip, asl r10
	cmp	r3, r1
	bge	.L416
	cmp	r3, #255
	bhi	.L412
	uxtb	r0, lr
	add	r2, r7, r3
	b	.L414
.L415:
	cmp	r3, #256
	beq	.L412
.L414:
	add	r3, r3, #1
	strb	r0, [r2], #1
	cmp	r3, r1
	bne	.L415
.L416:
	add	lr, lr, #1
	add	r9, r9, #8
	cmp	lr, r6
	bne	.L410
.L411:
	cmp	r8, #0
	ble	.L408
	ldr	r3, [fp, #-52]
	mov	ip, #0
	ldr	r9, [fp, #-48]
	mov	lr, ip
	sub	r5, r3, #4
	mov	r6, r9
.L418:
	str	ip, [r9, lr, asl #3]
	mov	r3, ip, asl r5
	ldr	r2, [r4, #2844]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #212]
	add	ip, r2, ip
	sub	r2, ip, #1
	str	r2, [r6, #4]
	mov	r1, ip, asl r5
	cmp	r3, r1
	bge	.L423
	cmp	r3, #255
	bhi	.L419
	add	r2, r3, #255
	uxtb	r0, lr
	add	r2, r7, r2
	b	.L421
.L422:
	cmp	r3, #256
	beq	.L419
.L421:
	add	r3, r3, #1
	strb	r0, [r2, #1]!
	cmp	r3, r1
	bne	.L422
.L423:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, r8
	bne	.L418
.L408:
	mov	r0, #0
	b	.L404
.L412:
	ldr	r2, .L432+4
	mov	r0, #1
	ldr	r1, .L432+8
	bl	dprint_vfmw
	mvn	r0, #0
.L404:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L419:
	ldr	r2, .L432+4
	mov	r0, #1
	ldr	r1, .L432+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L404
.L431:
	mov	r1, #11
	mov	r3, r8
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L432+4
	ldr	r1, .L432+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L404
.L430:
	mov	r1, #10
	mov	r3, r6
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L432+4
	ldr	r1, .L432+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L404
.L433:
	.align	2
.L432:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+260
	.word	.LC56
	.word	.LC57
	.word	.LC55
	.word	.LC54
	UNWIND(.fnend)
	.size	HEVC_CalcTileInfo, .-HEVC_CalcTileInfo
	.align	2
	.global	HEVC_Sei_More_Data_In_Payload
	.type	HEVC_Sei_More_Data_In_Payload, %function
HEVC_Sei_More_Data_In_Payload:
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
	ldr	r2, [r0, #2808]
	mov	r5, r1
	ldr	r3, [r2, #24]
	mov	r0, r2
	ldr	r4, [r2, #28]
	rsb	r4, r4, r3
	bl	BsIsByteAligned
	cmp	r4, r5, asl #3
	movne	r3, #1
	moveq	r3, #0
	cmp	r0, #0
	moveq	r0, #0
	andne	r0, r3, #1
	eor	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_More_Data_In_Payload, .-HEVC_Sei_More_Data_In_Payload
	.align	2
	.global	HEVC_Sei_Payload_Extension_Present
	.type	HEVC_Sei_Payload_Extension_Present, %function
HEVC_Sei_Payload_Extension_Present:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	r3, .L442
	mov	r5, r1
	mov	r2, #32
	ldr	r1, [r0, #2808]
	sub	r0, fp, #52
	ldr	r3, [r3, #52]
	mov	r5, r5, asl #3
	blx	r3
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	rsb	r3, r2, r3
	cmp	r3, r5
	movcs	r0, #0
	bcc	.L441
.L436:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L441:
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsShow
	cmp	r0, #0
	moveq	r0, #1
	beq	.L436
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
	b	.L437
.L438:
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
.L437:
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsShow
	cmp	r4, r5
	mov	r1, #1
	movcs	r3, #0
	movcc	r3, #1
	cmp	r0, #0
	movne	r2, #0
	andeq	r2, r3, #1
	sub	r0, fp, #52
	cmp	r2, #0
	bne	.L438
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L443:
	.align	2
.L442:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_Sei_Payload_Extension_Present, .-HEVC_Sei_Payload_Extension_Present
	.align	2
	.global	HEVC_Sei_Decoded_Picture_Hash
	.type	HEVC_Sei_Decoded_Picture_Hash, %function
HEVC_Sei_Decoded_Picture_Hash:
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
	beq	.L452
	mov	r1, #8
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r6, #3
	mov	r7, r0
.L451:
	cmp	r7, #0
	bne	.L446
	mov	r4, #16
.L447:
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	subs	r4, r4, #1
	bne	.L447
.L448:
	subs	r6, r6, #1
	bne	.L451
.L456:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L446:
	cmp	r7, #1
	beq	.L455
	cmp	r7, #2
	bne	.L448
	mov	r1, #32
	ldr	r0, [r5, #2808]
	bl	BsGet
	subs	r6, r6, #1
	bne	.L451
	b	.L456
.L455:
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	subs	r6, r6, #1
	bne	.L451
	b	.L456
.L452:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Decoded_Picture_Hash, .-HEVC_Sei_Decoded_Picture_Hash
	.align	2
	.global	HEVC_Sei_Region_Refresh_Info
	.type	HEVC_Sei_Region_Refresh_Info, %function
HEVC_Sei_Region_Refresh_Info:
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
	moveq	r4, #1
	movne	r4, #0
	beq	.L459
	mov	r1, #1
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L459:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Region_Refresh_Info, .-HEVC_Sei_Region_Refresh_Info
	.align	2
	.global	HEVC_Sei_Mastering_Display_Colour_Volume
	.type	HEVC_Sei_Mastering_Display_Colour_Volume, %function
HEVC_Sei_Mastering_Display_Colour_Volume:
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
	mov	r6, r1
	beq	.L463
	add	r7, r1, #12
	mov	r4, r1
	mov	r3, #1
	strb	r3, [r1]
.L462:
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #4]!
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r4, r7
	str	r0, [r4, #12]
	bne	.L462
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #28]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #32]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #36]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r3, #0
	str	r0, [r6, #40]
.L461:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L463:
	mvn	r3, #0
	b	.L461
	UNWIND(.fnend)
	.size	HEVC_Sei_Mastering_Display_Colour_Volume, .-HEVC_Sei_Mastering_Display_Colour_Volume
	.align	2
	.global	HEVC_Sei_Content_Light_Level_Information
	.type	HEVC_Sei_Content_Light_Level_Information, %function
HEVC_Sei_Content_Light_Level_Information:
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
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L467
	mov	r3, #1
	mov	r1, #16
	strb	r3, [r5]
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #2]	@ movhi
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r3, r4
	strh	r0, [r5, #4]	@ movhi
.L466:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L467:
	mvn	r3, #0
	b	.L466
	UNWIND(.fnend)
	.size	HEVC_Sei_Content_Light_Level_Information, .-HEVC_Sei_Content_Light_Level_Information
	.align	2
	.global	HEVC_Sei_HLGHDR_Comapitibility_Info
	.type	HEVC_Sei_HLGHDR_Comapitibility_Info, %function
HEVC_Sei_HLGHDR_Comapitibility_Info:
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
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L470
	ldr	r0, [r0, #2808]
	mov	r1, #8
	bl	BsGet
	mov	r3, r4
	strb	r0, [r5]
.L469:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L470:
	mvn	r3, #0
	b	.L469
	UNWIND(.fnend)
	.size	HEVC_Sei_HLGHDR_Comapitibility_Info, .-HEVC_Sei_HLGHDR_Comapitibility_Info
	.align	2
	.global	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.type	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, %function
HEVC_Sei_Temporal_Sub_Layer_Zero_Index:
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
	moveq	r4, #1
	movne	r4, #0
	beq	.L473
	mov	r1, #1
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r0, [r5, #2808]
	bl	BsToNextByte
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L473:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, .-HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.align	2
	.global	HEVC_Sei_Display_Orientation
	.type	HEVC_Sei_Display_Orientation, %function
HEVC_Sei_Display_Orientation:
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
	mov	r4, r0
	beq	.L477
	mov	r1, #1
	ldr	r0, [r0, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L478
.L476:
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L478:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L476
.L477:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Display_Orientation, .-HEVC_Sei_Display_Orientation
	.align	2
	.global	HEVC_Sei_TSI
	.type	HEVC_Sei_TSI, %function
HEVC_Sei_TSI:
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
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L481
	mov	r1, #4
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #1]
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r3, r4
	mov	r2, #1
	strb	r2, [r5]
	strb	r0, [r5, #2]
.L480:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L481:
	mvn	r3, #0
	b	.L480
	UNWIND(.fnend)
	.size	HEVC_Sei_TSI, .-HEVC_Sei_TSI
	.align	2
	.global	HEVC_Sei_User_Data_Unregistered
	.type	HEVC_Sei_User_Data_Unregistered, %function
HEVC_Sei_User_Data_Unregistered:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	cmp	r2, #15
	mov	r3, #0
	mov	r6, r2
	mov	r5, r0
	str	r3, [fp, #-36]
	strh	r3, [fp, #-32]	@ movhi
	movhi	r4, #16
	bls	.L495
.L485:
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	subs	r4, r4, #1
	bne	.L485
	subs	r6, r6, #16
	beq	.L488
.L486:
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r4, #5
	subls	r3, fp, #36
	strlsb	r0, [r4, r3]
	add	r4, r4, #1
	cmp	r6, r4
	bne	.L486
	cmp	r6, #5
	bls	.L488
	ldr	r2, [fp, #-36]
	movw	r3, #21572
	movt	r3, 12615
	cmp	r2, r3
	beq	.L496
.L488:
	mov	r0, #0
.L484:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L496:
	ldrb	r2, [fp, #-32]	@ zero_extendqisi2
	add	r5, r5, #24576
	sub	r2, r2, #65
	ldrb	r3, [r5, #3556]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	bfi	r3, r2, #0, #1
	strb	r3, [r5, #3556]
	uxtb	r3, r3
	tst	r3, #1
	beq	.L488
	ldrb	r2, [fp, #-31]	@ zero_extendqisi2
	mov	r0, #0
	bfi	r3, r2, #1, #4
	strb	r3, [r5, #3556]
	b	.L484
.L495:
	ldr	r1, .L497
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L484
.L498:
	.align	2
.L497:
	.word	.LC58
	UNWIND(.fnend)
	.size	HEVC_Sei_User_Data_Unregistered, .-HEVC_Sei_User_Data_Unregistered
	.align	2
	.global	HEVC_IsRefListWrong
	.type	HEVC_IsRefListWrong, %function
HEVC_IsRefListWrong:
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
	add	r7, r0, #4096
	mov	r5, r0
	ldr	r3, [r7, #780]
	cmp	r3, #0
	beq	.L500
	ldr	r4, [r0, #2868]
	cmp	r4, #0
	beq	.L501
	ldr	r2, [r4, #20]
	cmp	r2, #0
	addne	r6, r0, #2864
	movne	r4, #0
	addne	r6, r6, #4
	bne	.L506
	b	.L544
.L507:
	ldr	r3, [ip, #28]
	cmp	r3, #0
	beq	.L508
	ldr	r3, [r7, #780]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L545
	ldr	r2, [r6, #4]!
	cmp	r2, #0
	beq	.L501
	ldr	r2, [r2, #20]
	cmp	r2, #0
	beq	.L502
.L506:
	ldr	r1, [r2, #28]
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	bne	.L507
.L508:
	add	r5, r5, r4, lsl #2
	mov	r2, r4
	ldr	r1, .L549
	mov	r0, #1
	ldr	r3, [r5, #2868]
	ldr	r3, [r3, #20]
	str	ip, [sp]
	bl	dprint_vfmw
.L505:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L545:
	cmp	r3, #0
	beq	.L500
	ldr	r2, [r7, #784]
	cmp	r2, #0
	beq	.L500
	ldr	r4, [r5, #2936]
	cmp	r4, #0
	beq	.L513
	ldr	r2, [r4, #20]
	cmp	r2, #0
	addne	r6, r5, #2928
	movne	r4, #0
	addne	r6, r6, #8
	bne	.L517
	b	.L546
.L518:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L519
	ldr	r3, [r7, #784]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L500
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	beq	.L547
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L548
.L517:
	ldr	r1, [r2, #28]
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L518
.L519:
	mov	r3, r0
	mov	r2, r4
	ldr	r1, .L549+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L539
.L500:
	mov	r0, #0
.L539:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L501:
	mov	r2, r4
	ldr	r1, .L549+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L505
.L544:
	mov	r4, r2
.L502:
	mov	r2, r4
	ldr	r1, .L549+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L505
.L547:
	ldr	r3, [r7, #780]
.L513:
	mov	r2, r4
	ldr	r1, .L549+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L539
.L548:
	ldr	r3, [r7, #780]
.L514:
	mov	r2, r4
	ldr	r1, .L549+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L539
.L546:
	mov	r4, r2
	b	.L514
.L550:
	.align	2
.L549:
	.word	.LC61
	.word	.LC64
	.word	.LC59
	.word	.LC60
	.word	.LC62
	.word	.LC63
	UNWIND(.fnend)
	.size	HEVC_IsRefListWrong, .-HEVC_IsRefListWrong
	.align	2
	.global	HEVC_GetUnRefPicWithMinPoc
	.type	HEVC_GetUnRefPicWithMinPoc, %function
HEVC_GetUnRefPicWithMinPoc:
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
	mvn	r4, #0
	str	r4, [r1]
	ldr	r3, [r0, #3040]
	cmp	r3, #16
	bhi	.L552
	cmp	r3, #0
	addne	lr, r0, #3200
	mvnne	r5, #-2147483648
	addne	lr, lr, #4
	movne	r2, #0
	beq	.L554
.L557:
	ldr	ip, [lr, #4]!
	ldr	r4, [ip, #8]
	cmp	r4, r5
	bge	.L556
	ldr	ip, [ip]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #0
	streq	r2, [r1]
	ldreq	r3, [r0, #3040]
	moveq	r5, r4
.L556:
	add	r2, r2, #1
	cmp	r3, r2
	bhi	.L557
	ldr	r3, [r1]
	cmn	r3, #1
	beq	.L554
	str	r5, [sp]
	mov	r0, #1
	ldr	r2, .L560
	ldr	r1, .L560+4
	bl	dprint_vfmw
	mov	r0, #0
.L555:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L552:
	ldr	r2, .L560
	mov	r0, #1
	ldr	r1, .L560+8
	bl	dprint_vfmw
	mov	r0, r4
	b	.L555
.L554:
	ldr	r2, .L560
	mov	r0, #1
	ldr	r1, .L560+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L555
.L561:
	.align	2
.L560:
	.word	.LANCHOR0+280
	.word	.LC67
	.word	.LC65
	.word	.LC66
	UNWIND(.fnend)
	.size	HEVC_GetUnRefPicWithMinPoc, .-HEVC_GetUnRefPicWithMinPoc
	.align	2
	.global	HEVC_IncreaseDPBSize
	.type	HEVC_IncreaseDPBSize, %function
HEVC_IncreaseDPBSize:
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
	ldr	r3, [r0, #3036]
	mov	r5, r0
	cmp	r3, #16
	bhi	.L566
	ldr	r0, [r0, #276]
	bl	FSP_GetTotalValidFsNum
	add	r3, r5, #4096
	ldr	r2, [r5, #276]
	ldr	r1, [r3, #32]
	mov	r4, r0
	ldr	r0, [r3, #28]
	bl	FSP_GetOccupiedNum
	rsb	r0, r0, r4
	bic	r0, r0, r0, asr #31
	cmp	r0, #0
	ble	.L565
	ldr	r3, [r5, #3036]
	add	r3, r3, #1
	cmp	r0, r3
	bcc	.L565
	str	r3, [r5, #3036]
	mov	r0, #13
	ldr	r2, .L567
	ldr	r1, .L567+4
	bl	dprint_vfmw
	mov	r0, #0
.L564:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L565:
	mov	r3, r0
	ldr	r2, .L567
	ldr	r1, .L567+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L564
.L566:
	mov	r4, #17
	ldr	r2, .L567
	mov	r0, #1
	str	r4, [sp]
	ldr	r1, .L567+12
	bl	dprint_vfmw
	str	r4, [r5, #3036]
	mvn	r0, #0
	b	.L564
.L568:
	.align	2
.L567:
	.word	.LANCHOR0+308
	.word	.LC69
	.word	.LC70
	.word	.LC68
	UNWIND(.fnend)
	.size	HEVC_IncreaseDPBSize, .-HEVC_IncreaseDPBSize
	.align	2
	.global	HEVC_PicType
	.type	HEVC_PicType, %function
HEVC_PicType:
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
	add	r0, r0, #4096
	ldr	r3, [r0, #12]
	sub	r3, r3, #16
	cmp	r3, #5
	bls	.L573
	ldr	r0, [r0, #732]
	cmp	r0, #0
	subne	r0, r0, #1
	clzne	r0, r0
	movne	r0, r0, lsr #5
	moveq	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L573:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_PicType, .-HEVC_PicType
	.align	2
	.global	HEVC_PicTypeStatistic
	.type	HEVC_PicTypeStatistic, %function
HEVC_PicTypeStatistic:
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
	add	r0, r0, #4096
	ldr	r3, [r0, #740]
	sub	r2, r3, #16
	cmp	r2, #5
	bls	.L576
	ldr	r3, [r0, #12]
	sub	r3, r3, #16
	cmp	r3, #5
	bls	.L587
	ldr	r3, [r0, #732]
	cmp	r3, #1
	beq	.L579
	cmp	r3, #2
	beq	.L580
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r0, #24]
	ldmfd	sp, {fp, sp, pc}
.L576:
	str	r3, [r0, #12]
	mov	r3, #0
	str	r3, [r0, #24]
	ldmfd	sp, {fp, sp, pc}
.L579:
	ldr	r2, [r0, #24]
	cmp	r2, #2
	beq	.L588
	str	r3, [r0, #24]
	ldmfd	sp, {fp, sp, pc}
.L580:
	ldr	r3, [r0, #24]
	sub	r3, r3, #1
	cmp	r3, #1
	movhi	r3, #0
	strhi	r3, [r0, #24]
	ldmfd	sp, {fp, sp, pc}
.L588:
	ldmfd	sp, {fp, sp, pc}
.L587:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_PicTypeStatistic, .-HEVC_PicTypeStatistic
	.align	2
	.global	HEVC_IsReferenceNalu
	.type	HEVC_IsReferenceNalu, %function
HEVC_IsReferenceNalu:
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
	add	r0, r0, #4096
	ldr	r0, [r0, #740]
	cmp	r0, #15
	bhi	.L590
	tst	r0, #1
	bne	.L592
.L590:
	sub	r0, r0, #16
	cmp	r0, #7
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L592:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsReferenceNalu, .-HEVC_IsReferenceNalu
	.align	2
	.global	HEVC_WriteQmatrix_4x4
	.type	HEVC_WriteQmatrix_4x4, %function
HEVC_WriteQmatrix_4x4:
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
	add	r1, r1, r0, lsl #6
	ldr	r0, [r1, #640]
	ldr	r3, [r1, #644]
	ldrb	ip, [r1, #632]	@ zero_extendqisi2
	ldrb	lr, [r1, #636]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #640]
	ldrb	lr, [r1, #633]	@ zero_extendqisi2
	ldrb	r3, [r1, #645]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #637]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #4]
	ldr	r0, [r1, #636]
	ldrb	lr, [r1, #634]	@ zero_extendqisi2
	ldrb	r3, [r1, #646]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #642]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #8]
	ldr	r0, [r1, #644]
	ldrb	r3, [r1, #639]	@ zero_extendqisi2
	ldrb	lr, [r1, #635]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #643]	@ zero_extendqisi2
	orr	r1, lr, r0
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #12]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_4x4, .-HEVC_WriteQmatrix_4x4
	.align	2
	.global	HEVC_WriteQmatrix_32x32
	.type	HEVC_WriteQmatrix_32x32, %function
HEVC_WriteQmatrix_32x32:
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
	add	lr, r0, #18
	add	r0, r1, r0, lsl #6
	add	lr, r1, lr, lsl #6
	ldr	r1, [r0, #1792]
	ldr	r3, [r0, #1808]
	ldrb	ip, [lr, #632]	@ zero_extendqisi2
	ldrb	r4, [r0, #1800]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1824]
	ldr	r3, [r0, #1840]
	ldrb	ip, [r0, #1816]	@ zero_extendqisi2
	ldrb	r4, [r0, #1832]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1792]
	ldrb	r4, [lr, #633]	@ zero_extendqisi2
	ldrb	r3, [r0, #1809]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1801]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1824]
	ldrb	r4, [r0, #1817]	@ zero_extendqisi2
	ldrb	r3, [r0, #1841]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1833]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1800]
	ldrb	r4, [lr, #634]	@ zero_extendqisi2
	ldrb	r3, [r0, #1810]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1794]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1832]
	ldrb	r4, [r0, #1818]	@ zero_extendqisi2
	ldrb	r3, [r0, #1842]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1826]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1808]
	ldrb	lr, [lr, #635]	@ zero_extendqisi2
	ldrb	r3, [r0, #1803]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1795]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1840]
	ldrb	lr, [r0, #1819]	@ zero_extendqisi2
	ldrb	r3, [r0, #1835]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1827]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1796]
	ldr	r3, [r0, #1812]
	ldrb	ip, [r0, #1788]	@ zero_extendqisi2
	ldrb	lr, [r0, #1804]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1828]
	ldr	r3, [r0, #1844]
	ldrb	ip, [r0, #1820]	@ zero_extendqisi2
	ldrb	lr, [r0, #1836]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1796]
	ldrb	lr, [r0, #1789]	@ zero_extendqisi2
	ldrb	r3, [r0, #1813]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1805]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1828]
	ldrb	lr, [r0, #1821]	@ zero_extendqisi2
	ldrb	r3, [r0, #1845]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1837]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1804]
	ldrb	lr, [r0, #1790]	@ zero_extendqisi2
	ldrb	r3, [r0, #1814]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1798]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1836]
	ldrb	lr, [r0, #1822]	@ zero_extendqisi2
	ldrb	r3, [r0, #1846]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1830]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1812]
	ldrb	lr, [r0, #1791]	@ zero_extendqisi2
	ldrb	r3, [r0, #1807]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1799]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1844]
	ldrb	ip, [r0, #1823]	@ zero_extendqisi2
	ldrb	r3, [r0, #1839]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1831]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_32x32, .-HEVC_WriteQmatrix_32x32
	.align	2
	.global	HEVC_WriteQmatrix_8x8
	.type	HEVC_WriteQmatrix_8x8, %function
HEVC_WriteQmatrix_8x8:
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
	add	lr, r0, #6
	add	r0, r1, r0, lsl #6
	add	lr, r1, lr, lsl #6
	ldr	r1, [r0, #1032]
	ldr	r3, [r0, #1064]
	ldrb	ip, [lr, #632]	@ zero_extendqisi2
	ldrb	r4, [r0, #1048]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1040]
	ldr	r3, [r0, #1072]
	ldrb	ip, [r0, #1024]	@ zero_extendqisi2
	ldrb	r4, [r0, #1056]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1032]
	ldrb	r4, [lr, #633]	@ zero_extendqisi2
	ldrb	r3, [r0, #1065]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1049]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1040]
	ldrb	r4, [r0, #1025]	@ zero_extendqisi2
	ldrb	r3, [r0, #1073]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1057]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1048]
	ldrb	r4, [lr, #634]	@ zero_extendqisi2
	ldrb	r3, [r0, #1066]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1034]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1056]
	ldrb	r4, [r0, #1026]	@ zero_extendqisi2
	ldrb	r3, [r0, #1074]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1042]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1064]
	ldrb	lr, [lr, #635]	@ zero_extendqisi2
	ldrb	r3, [r0, #1051]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1035]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1072]
	ldrb	lr, [r0, #1027]	@ zero_extendqisi2
	ldrb	r3, [r0, #1059]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1043]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1036]
	ldr	r3, [r0, #1068]
	ldrb	ip, [r0, #1020]	@ zero_extendqisi2
	ldrb	lr, [r0, #1052]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1044]
	ldr	r3, [r0, #1076]
	ldrb	ip, [r0, #1028]	@ zero_extendqisi2
	ldrb	lr, [r0, #1060]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1036]
	ldrb	lr, [r0, #1021]	@ zero_extendqisi2
	ldrb	r3, [r0, #1069]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1053]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1044]
	ldrb	lr, [r0, #1029]	@ zero_extendqisi2
	ldrb	r3, [r0, #1077]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1061]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1052]
	ldrb	lr, [r0, #1022]	@ zero_extendqisi2
	ldrb	r3, [r0, #1070]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1038]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1060]
	ldrb	lr, [r0, #1030]	@ zero_extendqisi2
	ldrb	r3, [r0, #1078]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1046]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1068]
	ldrb	lr, [r0, #1023]	@ zero_extendqisi2
	ldrb	r3, [r0, #1055]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1039]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1076]
	ldrb	ip, [r0, #1031]	@ zero_extendqisi2
	ldrb	r3, [r0, #1063]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1047]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_8x8, .-HEVC_WriteQmatrix_8x8
	.align	2
	.global	HEVC_WriteQmatrix_16x16
	.type	HEVC_WriteQmatrix_16x16, %function
HEVC_WriteQmatrix_16x16:
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
	add	lr, r0, #12
	add	r0, r1, r0, lsl #6
	add	lr, r1, lr, lsl #6
	ldr	r1, [r0, #1408]
	ldr	r3, [r0, #1424]
	ldrb	ip, [lr, #632]	@ zero_extendqisi2
	ldrb	r4, [r0, #1416]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1440]
	ldr	r3, [r0, #1456]
	ldrb	ip, [r0, #1432]	@ zero_extendqisi2
	ldrb	r4, [r0, #1448]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1408]
	ldrb	r4, [lr, #633]	@ zero_extendqisi2
	ldrb	r3, [r0, #1425]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1417]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1440]
	ldrb	r4, [r0, #1433]	@ zero_extendqisi2
	ldrb	r3, [r0, #1457]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1449]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1416]
	ldrb	r4, [lr, #634]	@ zero_extendqisi2
	ldrb	r3, [r0, #1426]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1410]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1448]
	ldrb	r4, [r0, #1434]	@ zero_extendqisi2
	ldrb	r3, [r0, #1458]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1442]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1424]
	ldrb	lr, [lr, #635]	@ zero_extendqisi2
	ldrb	r3, [r0, #1419]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1411]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1456]
	ldrb	lr, [r0, #1435]	@ zero_extendqisi2
	ldrb	r3, [r0, #1451]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1443]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1412]
	ldr	r3, [r0, #1428]
	ldrb	ip, [r0, #1404]	@ zero_extendqisi2
	ldrb	lr, [r0, #1420]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1444]
	ldr	r3, [r0, #1460]
	ldrb	ip, [r0, #1436]	@ zero_extendqisi2
	ldrb	lr, [r0, #1452]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1412]
	ldrb	lr, [r0, #1405]	@ zero_extendqisi2
	ldrb	r3, [r0, #1429]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1421]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1444]
	ldrb	lr, [r0, #1437]	@ zero_extendqisi2
	ldrb	r3, [r0, #1461]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1453]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1420]
	ldrb	lr, [r0, #1406]	@ zero_extendqisi2
	ldrb	r3, [r0, #1430]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1414]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1452]
	ldrb	lr, [r0, #1438]	@ zero_extendqisi2
	ldrb	r3, [r0, #1462]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1446]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1428]
	ldrb	lr, [r0, #1407]	@ zero_extendqisi2
	ldrb	r3, [r0, #1423]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1415]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1460]
	ldrb	ip, [r0, #1439]	@ zero_extendqisi2
	ldrb	r3, [r0, #1455]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1447]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_16x16, .-HEVC_WriteQmatrix_16x16
	.global	__aeabi_idivmod
	.align	2
	.global	HEVC_CtbRsAddrToTsAddr
	.type	HEVC_CtbRsAddrToTsAddr, %function
HEVC_CtbRsAddrToTsAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #204)
	sub	sp, sp, #204
	ldr	ip, [r0, #2844]
	mov	r6, r1
	ldrb	r3, [ip, #13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L632
	ldr	r3, [ip, #72]
	ldr	r7, [ip, #68]
	ldrb	r5, [ip, #15]	@ zero_extendqisi2
	mov	r2, r3
	str	r3, [fp, #-236]
	ldr	r3, [r0, #2840]
	cmp	r2, #0
	sub	r8, r2, #1
	sub	r2, r7, #1
	str	r2, [fp, #-240]
	ldr	r4, [r3, #64]
	ldr	r1, [r3, #128]
	ble	.L603
	ldr	r3, [fp, #-236]
	add	r2, ip, #210
	sub	r0, fp, #216
	add	lr, r3, #105
	add	lr, ip, lr, lsl #1
.L602:
	ldrsh	r3, [r2, #2]!
	cmp	r2, lr
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L602
.L603:
	cmp	r7, #0
	ble	.L601
	add	r3, r7, #85
	add	r2, ip, #170
	sub	r0, fp, #128
	add	ip, ip, r3, lsl #1
.L606:
	ldrsh	r3, [r2, #2]!
	cmp	r2, ip
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L606
.L601:
	mov	r10, #1
	mov	r0, r4
	mov	r10, r10, asl r1
	mov	r1, r10
	bl	__aeabi_idiv
	mov	r1, r10
	mov	r9, r0
	mov	r0, r4
	bl	__aeabi_idivmod
	mov	r0, r6
	cmp	r1, #0
	addne	r9, r9, #1
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r0, r6
	mov	r4, r1
	mov	r1, r9
	bl	__aeabi_idiv
	cmp	r5, #0
	beq	.L647
	cmp	r8, #0
	mov	r3, #0
	blt	.L623
	sub	r10, fp, #212
	mov	lr, r3
	mov	r6, r3
	mov	r8, r3
	str	r3, [fp, #-232]
	str	r3, [fp, #-244]
.L609:
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	blt	.L626
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	ip, r2
	add	r8, r8, #1
	sub	r5, fp, #128
	mov	r6, lr
	add	r9, r3, r8
	b	.L612
.L624:
	mov	r6, lr
.L612:
	ldr	r3, [r5, #4]!
	add	ip, ip, #1
	add	r3, r3, #1
	add	r1, r2, r3
	cmp	r4, r1
	mla	lr, r8, r3, lr
	bge	.L610
	cmp	r0, r9
	blt	.L644
.L610:
	cmp	ip, r7
	mov	r2, r1
	bne	.L624
.L615:
	add	r2, r1, r3
	cmp	r4, r2
	bge	.L625
	cmp	r0, r9
	blt	.L642
.L625:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	ip, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, ip
	str	r2, [fp, #-244]
	bne	.L609
.L643:
	rsb	r0, r9, r0
	mov	r2, r1
	mul	r3, r0, r3
.L607:
	rsb	r2, r2, r4
	add	r3, r2, r3
	add	r6, r3, r6
.L632:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L647:
	cmp	r8, #0
	mov	r3, r5
	blt	.L623
	ldr	r2, [fp, #-240]
	sub	r10, fp, #212
	str	r5, [fp, #-232]
	mov	lr, r5
	cmp	r2, #0
	str	r5, [fp, #-244]
	mov	r6, r5
	mov	r8, r5
	blt	.L629
.L648:
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	ip, r2
	add	r8, r8, #1
	sub	r5, fp, #128
	mov	r6, lr
	add	r9, r3, r8
	b	.L618
.L627:
	mov	r6, lr
.L618:
	ldr	r3, [r5, #4]!
	add	ip, ip, #1
	add	r3, r3, #1
	add	r1, r2, r3
	cmp	r4, r1
	mla	lr, r8, r3, lr
	bge	.L616
	cmp	r0, r9
	blt	.L617
.L616:
	cmp	ip, r7
	mov	r2, r1
	bne	.L627
.L621:
	add	r2, r1, r3
	cmp	r4, r2
	bge	.L641
	cmp	r0, r9
	blt	.L642
.L641:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	ip, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, ip
	str	r2, [fp, #-244]
	beq	.L643
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	bge	.L648
.L629:
	ldr	r2, [fp, #-232]
	mov	r1, #0
	add	r9, r2, r8
	b	.L621
.L644:
	ldr	r1, [fp, #-232]
	rsb	r0, r1, r0
	mul	r3, r0, r3
	b	.L607
.L617:
	cmp	r1, r4
	bgt	.L644
	mov	r1, r2
	b	.L641
.L626:
	ldr	r2, [fp, #-232]
	mov	r1, #0
	add	r9, r2, r8
	b	.L615
.L642:
	ldr	r2, [fp, #-232]
	rsb	r0, r2, r0
	mov	r2, r1
	mul	r3, r0, r3
	b	.L607
.L623:
	mov	r2, r3
	mov	r6, r3
	b	.L607
	UNWIND(.fnend)
	.size	HEVC_CtbRsAddrToTsAddr, .-HEVC_CtbRsAddrToTsAddr
	.align	2
	.global	HEVC_CtbTsAddrToRsAddr
	.type	HEVC_CtbTsAddrToRsAddr, %function
HEVC_CtbTsAddrToRsAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #204)
	sub	sp, sp, #204
	ldr	lr, [r0, #2844]
	mov	r6, r1
	ldrb	r3, [lr, #13]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r0, r1
	beq	.L673
	ldr	r3, [lr, #72]
	ldr	r7, [lr, #68]
	mov	r2, r3
	str	r3, [fp, #-232]
	ldr	r3, [r0, #2840]
	cmp	r2, #0
	ldr	r4, [r3, #64]
	ldr	ip, [r3, #128]
	ble	.L655
	ldr	r3, [fp, #-232]
	add	r2, lr, #210
	sub	r1, fp, #216
	add	r0, r3, #105
	add	r0, lr, r0, lsl #1
.L654:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L654
.L655:
	cmp	r7, #0
	ble	.L653
	add	r0, r7, #85
	add	r2, lr, #170
	sub	r1, fp, #128
	add	r0, lr, r0, lsl #1
.L658:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L658
.L653:
	mov	r5, #1
	mov	r0, r4
	mov	r5, r5, asl ip
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, r5
	mov	r8, r0
	mov	r0, r4
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-232]
	cmp	r1, #0
	addne	r8, r8, #1
	cmp	r3, #0
	str	r8, [fp, #-240]
	ble	.L657
	mov	r8, #0
	ldr	r2, [fp, #-124]
	sub	r9, fp, #212
	mov	r10, r8
	mov	r3, r8
	mov	lr, r8
	mov	r0, r8
	mov	r4, r8
	add	r2, r2, #1
	str	r2, [fp, #-236]
.L659:
	cmp	r7, #0
	ble	.L669
	ldr	r0, [r9]
	ldr	r4, [fp, #-236]
	add	r0, r0, #1
	mla	r1, r0, r4, r3
	cmp	r6, r1
	blt	.L670
	mov	r5, #0
	mov	lr, r3
	mov	r2, r5
	mov	r3, r1
	sub	ip, fp, #124
	b	.L664
.L661:
	ldr	r4, [ip, #4]!
	mov	lr, r3
	add	r4, r4, #1
	mla	r1, r0, r4, r3
	cmp	r1, r6
	bgt	.L662
	mov	r3, r1
.L664:
	add	r2, r2, #1
	add	r5, r5, r4
	cmp	r2, r7
	bne	.L661
.L663:
	cmp	r3, r6
	bgt	.L668
	ldr	r2, [fp, #-232]
	add	r10, r10, #1
	add	r8, r8, r0
	add	r9, r9, #4
	cmp	r10, r2
	bne	.L659
.L668:
	mov	r3, lr
.L662:
	cmp	r4, #0
	beq	.L657
	rsb	r6, r3, r6
	mov	r1, r4
	mov	r0, r6
	bl	__aeabi_idiv
	ldr	r3, [fp, #-240]
	mov	r1, r4
	add	r4, r0, r8
	mov	r0, r6
	mul	r4, r4, r3
	bl	__aeabi_idivmod
	add	r1, r1, r5
	add	r0, r4, r1
.L673:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L669:
	mov	r5, #0
	b	.L663
.L670:
	ldr	r4, [fp, #-236]
	mov	r5, #0
	b	.L662
.L657:
	ldr	r1, .L675
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L673
.L676:
	.align	2
.L675:
	.word	.LC71
	UNWIND(.fnend)
	.size	HEVC_CtbTsAddrToRsAddr, .-HEVC_CtbTsAddrToRsAddr
	.align	2
	.global	HEVC_CalcTileMap
	.type	HEVC_CalcTileMap, %function
HEVC_CalcTileMap:
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
	ldr	r4, .L704
	mov	r10, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L703
	ldr	r5, .L704+4
	add	r0, r0, #483328
	mov	r2, #147456
	mov	r1, #0
	add	r0, r0, #336
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r0, [r4]
	ldr	r3, [r5, #48]
	mov	r2, #36864
	add	r0, r0, #630784
	mov	r1, #0
	add	r0, r0, #336
	blx	r3
	add	r0, r10, #9216
	ldr	r3, [r5, #48]
	mov	r2, #880
	mov	r1, #0
	add	r0, r0, #20
	blx	r3
	add	r3, r10, #8192
	str	r3, [fp, #-60]
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #1040]
	ldr	r9, [r10, #2844]
	ldr	r1, [r10, #2840]
	ldr	r2, [r9, #72]
	ldr	r8, [r1, #188]
	cmp	r2, r3
	beq	.L680
	ldr	r2, [r4]
	str	r3, [fp, #-72]
	str	r3, [fp, #-76]
	str	r2, [fp, #-48]
.L681:
	ldr	r2, [r9, #68]
	cmp	r2, #0
	ldr	r2, [fp, #-72]
	add	r2, r2, #104
	streq	r2, [fp, #-80]
	beq	.L687
	mov	r1, r2
	str	r2, [fp, #-80]
	mov	r7, r1, asl #1
	ldr	r1, [fp, #-76]
	mov	r2, #0
	str	r2, [fp, #-52]
	str	r2, [fp, #-56]
	mul	r1, r8, r1
	ldr	r2, [fp, #-60]
	ldr	r2, [r2, #1040]
	str	r1, [fp, #-68]
.L686:
	add	r1, r2, #1152
	add	r0, r9, r7
	add	r1, r1, #2
	add	r1, r10, r1, lsl #3
	str	r3, [r1, #4]
	ldrsh	r1, [r0, #4]
	cmp	r1, #0
	ldreq	r1, [fp, #-52]
	addeq	r1, r1, #84
	streq	r1, [fp, #-64]
	beq	.L682
	ldr	r2, [fp, #-52]
	mov	r5, #0
	ldr	r1, [fp, #-56]
	add	r2, r2, #84
	ldr	r0, [fp, #-68]
	str	r2, [fp, #-64]
	add	r6, r1, r0
	mov	ip, r2, asl #1
.L683:
	add	r2, r9, ip
	ldrsh	r2, [r2, #4]
	cmp	r2, #0
	beq	.L685
	add	r2, r3, #120832
	ldr	r1, [fp, #-48]
	add	r2, r2, #83
	rsb	lr, r3, r6
	mov	r4, r3
	add	r2, r1, r2, lsl #2
.L684:
	add	r1, lr, r3
	str	r1, [r2, #4]!
	ldr	r9, [r10, #2844]
	add	r3, r3, #1
	rsb	r1, r4, r3
	add	r0, r9, ip
	ldrsh	r0, [r0, #4]
	cmp	r0, r1
	bhi	.L684
.L685:
	add	r2, r9, r7
	add	r5, r5, #1
	add	r6, r6, r8
	ldrsh	r2, [r2, #4]
	cmp	r2, r5
	bhi	.L683
	ldr	r2, [fp, #-60]
	ldr	r2, [r2, #1040]
.L682:
	add	r1, r10, r2, lsl #3
	ldr	r0, [fp, #-64]
	add	r1, r1, #9216
	sub	ip, r3, #1
	ldr	lr, [fp, #-52]
	add	r2, r2, #1
	str	ip, [r1, #24]
	add	r0, r9, r0, lsl #1
	ldr	r1, [fp, #-60]
	add	lr, lr, #1
	str	lr, [fp, #-52]
	str	r2, [r1, #1040]
	ldr	r1, [r9, #68]
	ldrsh	r0, [r0, #4]
	cmp	r1, lr
	ldr	r1, [fp, #-56]
	add	r1, r1, r0
	str	r1, [fp, #-56]
	bhi	.L686
.L687:
	ldr	r2, [fp, #-80]
	ldr	r0, [fp, #-72]
	ldr	r1, [r9, #72]
	add	r2, r9, r2, lsl #1
	add	r0, r0, #1
	cmp	r1, r0
	ldr	r1, [fp, #-76]
	ldrsh	r2, [r2, #4]
	str	r0, [fp, #-72]
	add	r2, r1, r2
	str	r2, [fp, #-76]
	bhi	.L681
.L680:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L703:
	ldr	r2, .L704+8
	ldr	r1, .L704+12
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L705:
	.align	2
.L704:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+332
	.word	.LC72
	UNWIND(.fnend)
	.size	HEVC_CalcTileMap, .-HEVC_CalcTileMap
	.align	2
	.global	HEVC_WritePicMsg
	.type	HEVC_WritePicMsg, %function
HEVC_WritePicMsg:
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
	add	r4, r0, #4096
	mov	r5, r0
	ldr	r1, .L729
	mov	r0, #2
	ldr	r3, [r4, #44]
	add	r8, r5, #8192
	ldr	r2, [r4, #220]
	mov	r7, #280
	bl	dprint_vfmw
	ldr	r1, .L729+4
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r2, [r4, #184]
	ldr	r1, [r4, #188]
	mov	ip, #0
	ldr	r0, [r4, #220]
	ldr	r3, [r4, #44]
	ldr	lr, [r4, #216]
	str	r2, [r4, #3736]
	str	r1, [r4, #3740]
	ldr	r2, [r4, #108]
	ldr	r1, [r4, #112]
	str	r0, [r4, #3728]
	str	r3, [r4, #3732]
	rsb	r1, r2, r1
	ldr	r3, [r4, #16]
	ldr	r6, [r4, #208]
	ldr	r0, [r4, #212]
	str	r1, [r4, #3744]
	str	lr, [r4, #3756]
	ldr	r1, [r4, #120]
	ldr	lr, [r4, #116]
	str	r6, [r4, #3748]
	str	r0, [r4, #3752]
	rsb	r2, r2, lr
	str	r3, [r4, #2472]
	add	r0, r5, #6656
	str	r2, [r4, #3760]
	rsb	r2, lr, r1
	str	r2, [r4, #3764]
	add	r0, r0, #8
	ldr	r2, [r5, #2860]
	str	ip, [r5, #204]
	mul	r7, r7, r3
	str	r2, [r8, #836]
	ldr	r3, [r5, #2840]
	mov	r2, #64
	ldr	r6, .L729+8
	add	r1, r5, r7
	ldrb	ip, [r3, #10]	@ zero_extendqisi2
	add	r1, r1, #13248
	add	r1, r1, #52
	strb	ip, [r4, #2446]
	ldrb	ip, [r3, #3]	@ zero_extendqisi2
	strb	ip, [r4, #2447]
	ldrb	ip, [r3, #7]	@ zero_extendqisi2
	strb	ip, [r4, #2448]
	ldrb	ip, [r3, #6]	@ zero_extendqisi2
	ldr	lr, [r4, #20]
	strb	ip, [r4, #2449]
	ldrb	ip, [r3, #5]	@ zero_extendqisi2
	strb	ip, [r4, #2450]
	ldr	ip, [r3, #60]
	str	ip, [r4, #2452]
	ldr	ip, [r3, #104]
	strb	ip, [r4, #2456]
	ldr	ip, [r3, #192]
	sub	ip, ip, #1
	str	ip, [r4, #2460]
	ldr	ip, [r3, #188]
	str	lr, [r4, #2468]
	sub	ip, ip, #1
	str	ip, [r4, #2464]
	ldr	ip, [r5, #2844]
	ldr	lr, [ip, #84]
	sub	lr, lr, #2
	str	lr, [r4, #2476]
	ldrb	lr, [ip, #11]	@ zero_extendqisi2
	strb	lr, [r4, #2480]
	ldrb	ip, [ip, #10]	@ zero_extendqisi2
	strb	ip, [r4, #2481]
	ldr	ip, [r3, #164]
	str	ip, [r4, #2484]
	ldr	ip, [r3, #168]
	str	ip, [r4, #2488]
	ldr	ip, [r3, #156]
	str	ip, [r4, #2492]
	ldr	ip, [r3, #160]
	str	ip, [r4, #2496]
	ldr	ip, [r3, #148]
	str	ip, [r4, #2500]
	ldr	ip, [r3, #152]
	str	ip, [r4, #2504]
	ldr	ip, [r3, #172]
	ldr	r6, [r6, #52]
	str	ip, [r4, #2508]
	ldr	ip, [r3, #124]
	str	ip, [r4, #2512]
	ldr	ip, [r3, #128]
	str	ip, [r4, #2516]
	ldr	ip, [r3, #100]
	str	ip, [r4, #2520]
	ldr	ip, [r3, #92]
	str	ip, [r4, #2524]
	ldr	ip, [r3, #112]
	str	ip, [r4, #2528]
	ldr	ip, [r3, #108]
	str	ip, [r4, #2532]
	ldr	ip, [r3, #96]
	str	ip, [r4, #2536]
	ldr	r3, [r3, #88]
	str	r3, [r4, #2540]
	blx	r6
	ldr	ip, [r5, #2840]
	add	r3, r5, #8832
	add	r2, r5, #8768
	add	r1, r5, #8256
	add	r3, r3, #36
	ldr	lr, [ip, #68]
	add	r2, r2, #20
	add	r1, r1, #20
	mov	r0, r5
	str	lr, [r4, #2632]
	ldr	ip, [ip, #64]
	str	ip, [r4, #2636]
	bl	HEVC_CalcTileInfo
	subs	r6, r0, #0
	bne	.L727
	ldr	r3, [r5, #2844]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	strb	r2, [r4, #2660]
	ldrb	r2, [r3, #7]	@ zero_extendqisi2
	strb	r2, [r4, #2661]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	strb	r2, [r4, #2662]
	ldrb	r2, [r3, #14]	@ zero_extendqisi2
	strb	r2, [r4, #2663]
	ldrb	r2, [r3, #15]	@ zero_extendqisi2
	strb	r2, [r4, #2664]
	ldrb	r2, [r3, #13]	@ zero_extendqisi2
	strb	r2, [r4, #2665]
	ldr	r2, [r5, #2840]
	ldr	r1, [r3, #56]
	ldr	r2, [r2, #128]
	rsb	r2, r1, r2
	str	r2, [r4, #2668]
	ldr	r2, [r3, #52]
	str	r2, [r4, #2672]
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	strb	r2, [r4, #2676]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	strb	r2, [r4, #2677]
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	strb	r2, [r4, #2678]
	ldr	r2, [r3, #60]
	str	r2, [r4, #2680]
	ldr	r2, [r3, #64]
	str	r2, [r4, #2684]
	ldr	r2, [r3, #72]
	sub	r2, r2, #1
	str	r2, [r4, #2688]
	ldr	r2, [r3, #68]
	sub	r2, r2, #1
	str	r2, [r4, #2692]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	strb	r2, [r4, #2481]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	strb	r3, [r4, #2480]
	ldr	r3, [r5, #2368]
	str	r6, [r5, #2384]
	cmp	r3, #1
	beq	.L718
	ldr	r3, [r4, #68]
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #28]
	bl	FSP_GetLogicFs
	subs	r9, r0, #0
	beq	.L728
	ldr	r2, [r9, #28]
	ldr	r3, [r9, #32]
	cmp	r2, #0
	beq	.L711
	cmp	r3, #0
	beq	.L711
	add	r3, r5, #8128
	add	r2, r5, #7872
	add	r1, r5, #8000
	add	r3, r3, #20
	add	r2, r2, #8
	add	r1, r1, #8
	ldr	r0, [r5, #276]
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r9, #28]
	add	r2, r5, #8000
	add	r1, r5, #8128
	add	r2, r2, #12
	add	r1, r1, #12
	ldr	r3, [r3, #4]
	str	r3, [r4, #3728]
	ldr	r0, [r5, #276]
	bl	FSP_GetPmvAddrTab
	ldr	r2, [r4, #44]
	add	r3, r5, r7
	add	r3, r3, #13120
	str	r2, [r4, #3732]
	ldr	r2, [r9, #12]
	str	r2, [r4, #4048]
	ldr	r2, [r9, #32]
	ldr	r2, [r2, #8]
	str	r2, [r8, #1032]
	ldr	r2, [r9, #32]
	ldr	r2, [r2, #64]
	str	r2, [r8, #1036]
	ldr	ip, [r3, #44]
	cmp	ip, #0
	str	ip, [r8, #828]
	beq	.L713
	add	r3, r7, #13184
	add	r2, r5, #8896
	add	r3, r3, #48
	add	r2, r2, #56
	add	r3, r5, r3
	mov	r0, r6
.L714:
	add	r0, r0, #1
	ldr	r1, [r3, #4]!
	cmp	r0, ip
	str	r1, [r2, #4]!
	bne	.L714
.L713:
	add	r7, r5, #6784
	mov	r6, #0
	add	r7, r7, #12
.L715:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_8x8
	cmp	r6, #4
	add	r7, r7, #64
	bne	.L715
	add	r2, r5, #7040
	mov	r0, r6
	add	r2, r2, #12
	mov	r1, r5
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #7104
	add	r2, r2, #12
	mov	r1, r5
	mov	r0, #5
	add	r7, r5, #7296
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #7168
	add	r2, r2, #12
	mov	r1, r5
	mov	r0, #0
	add	r7, r7, #12
	bl	HEVC_WriteQmatrix_16x16
	add	r2, r5, #7232
	add	r2, r2, #12
	mov	r1, r5
	mov	r0, #1
	mov	r6, #2
	bl	HEVC_WriteQmatrix_16x16
.L716:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_16x16
	cmp	r6, #6
	add	r7, r7, #64
	bne	.L716
	add	r2, r5, #7552
	mov	r1, r5
	add	r2, r2, #12
	mov	r0, #0
	bl	HEVC_WriteQmatrix_32x32
	add	r2, r5, #7616
	add	r2, r2, #12
	mov	r1, r5
	mov	r0, #1
	add	r7, r5, #7680
	bl	HEVC_WriteQmatrix_32x32
	add	r7, r7, #12
	mov	r6, #0
.L717:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_4x4
	cmp	r6, #6
	add	r7, r7, #16
	bne	.L717
	ldr	r1, [r5, #2320]
	mov	r0, #0
	ldr	r3, [r5, #2324]
	ldr	r2, [r5, #2312]
	ldr	ip, [r5, #2316]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	ldr	lr, [r4, #44]
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #3692]
	ldr	r1, [r5, #2336]
	ldr	r3, [r5, #2340]
	ldr	r2, [r5, #2328]
	ldr	ip, [r5, #2332]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	str	lr, [r4, #3724]
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #3696]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L718:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L727:
	ldr	r2, .L729+12
	mov	r0, #1
	ldr	r1, .L729+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L711:
	ldr	r1, .L729+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L728:
	ldr	r3, [r4, #68]
	mov	r0, #1
	ldr	r1, .L729+24
	ldr	r2, [r3, #28]
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L730:
	.align	2
.L729:
	.word	.LC73
	.word	.LC74
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+352
	.word	.LC75
	.word	.LC77
	.word	.LC76
	UNWIND(.fnend)
	.size	HEVC_WritePicMsg, .-HEVC_WritePicMsg
	.align	2
	.global	HEVC_CheckListX
	.type	HEVC_CheckListX, %function
HEVC_CheckListX:
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
	add	r3, r0, #4096
	ldrb	r3, [r3, #713]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r3, r0, #4800
	addeq	r3, r3, #8
	beq	.L733
	ldrsb	r3, [r0, #14]
	cmp	r3, #0
	addne	r3, r0, #11776
	addne	r3, r3, #12
	beq	.L766
.L733:
	ldr	ip, [r3, #68]
	ldr	lr, [r3, #72]
	cmp	ip, #16
	bhi	.L767
	cmp	lr, #16
	bhi	.L737
	cmp	ip, #0
	beq	.L738
	ldr	r3, [r0, #2868]
	cmp	r3, #0
	beq	.L751
	ldr	r3, [r3, #20]
	cmp	r3, #0
	addne	r1, r0, #2864
	movne	r2, #0
	addne	r1, r1, #4
	bne	.L743
	b	.L768
.L744:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L739
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L740
.L743:
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L744
.L738:
	cmp	lr, #0
	beq	.L763
	ldr	r3, [r0, #2936]
	cmp	r3, #0
	beq	.L754
	ldr	r3, [r3, #20]
	cmp	r3, #0
	addne	r0, r0, #2928
	movne	r2, #0
	addne	r0, r0, #8
	bne	.L749
	b	.L769
.L750:
	ldr	r3, [r0, #4]!
	cmp	r3, #0
	beq	.L745
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L746
.L749:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L750
.L763:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L751:
	mov	r2, r3
.L739:
	ldr	r1, .L770
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L768:
	mov	r2, r3
.L740:
	ldr	r1, .L770+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L754:
	mov	r2, r3
.L745:
	ldr	r1, .L770+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L769:
	mov	r2, r3
.L746:
	ldr	r1, .L770+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L766:
	mov	r0, r3
	ldr	r2, .L770+16
	ldr	r1, .L770+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L737:
	mov	r2, lr
	mov	r3, #17
	ldr	r1, .L770+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L767:
	mov	r2, ip
	mov	r3, #17
	ldr	r1, .L770+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L771:
	.align	2
.L770:
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LANCHOR0+372
	.word	.LC78
	.word	.LC80
	.word	.LC79
	UNWIND(.fnend)
	.size	HEVC_CheckListX, .-HEVC_CheckListX
	.align	2
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
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
	UNWIND(.pad #132)
	sub	sp, sp, #132
	add	r7, r0, #4096
	mov	r4, r0
	ldr	r9, [r7, #16]
	bl	HEVC_CheckListX
	subs	r3, r0, #0
	str	r3, [fp, #-112]
	bne	.L842
	ldr	r0, [r4, #204]
	ldr	r3, [r4, #152]
	cmp	r0, r3
	bcs	.L915
	ldr	r5, [r4, #2860]
	movw	r6, #1508
	ldr	r10, [fp, #-112]
	mov	r2, r6
	ldr	r3, .L923
	mla	r5, r6, r0, r5
	mov	r1, r10
	ldr	r3, [r3, #48]
	mov	r0, r5
	blx	r3
	ldr	r3, .L923
	mov	r2, #64
	mov	r1, r10
	sub	r0, fp, #108
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #204]
	ldr	r2, [r4, #152]
	add	r3, r3, #1
	str	r3, [r4, #204]
	cmp	r3, r2
	ldrcc	r2, [r4, #2860]
	ldrcs	r3, [fp, #-112]
	mlacc	r3, r6, r3, r2
	str	r3, [r5, #1504]
	ldr	r1, [r7, #748]
	ldr	r2, [r4, #2828]
	ldr	r0, [r4, #176]
	ldr	r3, [r4, #260]
	add	r0, r0, #1
	str	r1, [r4, #208]
	str	r0, [r4, #176]
	add	r3, r3, #1
	str	r3, [r4, #260]
	ldrb	r1, [r2]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	str	r0, [fp, #-120]
	cmp	r1, #1
	cmpls	r1, r3
	bcs	.L777
	add	r0, r5, r1, lsl #2
.L778:
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r1, r1, #1
	add	r2, r2, r3
	ldr	r2, [r2, #56]
	str	r2, [r0, #8]
	ldr	r2, [r4, #2828]
	add	r2, r2, r3
	ldr	r2, [r2, #52]
	str	r2, [r0], #4
	ldr	r2, [r4, #2828]
	add	r3, r2, r3
	ldr	r3, [r3, #60]
	str	r3, [r0, #12]
	ldr	r2, [r4, #2828]
	ldr	r3, [r2, #8]
	cmp	r3, r1
	movhi	ip, #1
	movls	ip, #0
	cmp	r1, #1
	movhi	ip, #0
	cmp	ip, #0
	bne	.L778
.L777:
	cmp	r3, #1
	addls	r3, r5, r3, lsl #2
	addls	r1, r5, #8
	movls	r2, #0
	bhi	.L783
.L782:
	str	r2, [r3, #8]
	str	r2, [r3], #4
	cmp	r3, r1
	str	r2, [r3, #12]
	bne	.L782
.L783:
	ldrb	r3, [r7, #713]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L916
.L781:
	add	r6, r4, #8192
	ldr	r3, [r6, #3664]
	cmp	r3, #0
	beq	.L784
	add	ip, r4, #2864
	add	r1, r5, #112
	mov	r0, #0
	mov	lr, #1
	b	.L788
.L918:
	ldr	r3, [r10, #16]
	cmp	r3, #0
	beq	.L786
	ldr	r3, [r7, #744]
	cmp	r3, #0
	beq	.L786
	ldr	r2, [r10, #20]
	sub	r8, fp, #44
	add	r0, r0, #1
	ldr	r3, [r2, #20]
	ldr	r2, [r2, #36]
	add	r3, r3, #2000
	add	r3, r3, #2
	add	r2, r8, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [r2, #-64]
	ldr	r3, [r10, #20]
	ldr	r3, [r3, #36]
	str	r3, [r1, #256]
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #0
	strne	lr, [r1]
	ldr	r2, [r6, #3664]
	cmp	r2, r0
	bls	.L917
.L788:
	ldr	r3, [ip, #4]!
	ldr	r3, [r3, #4]
	str	r3, [r1, #4]!
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	ldr	r10, [ip]
	cmp	r3, #0
	bne	.L918
.L786:
	ldr	r2, [r10, #20]
	sub	r8, fp, #44
	add	r0, r0, #1
	ldr	r3, [r2, #20]
	ldr	r2, [r2, #24]
	add	r3, r3, #2000
	add	r3, r3, #2
	add	r2, r8, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [r2, #-64]
	ldr	r3, [r10, #20]
	ldr	r3, [r3, #24]
	str	r3, [r1, #256]
	ldr	r2, [r6, #3664]
	cmp	r2, r0
	bhi	.L788
.L917:
	ldr	r0, [r6, #3668]
	cmp	r0, #0
	beq	.L789
.L841:
	add	r1, r4, #2928
	add	ip, r5, #176
	add	r1, r1, #4
	mov	lr, #0
	mov	r10, #1
	b	.L793
.L920:
	ldr	r3, [r0, #16]
	cmp	r3, #0
	beq	.L791
	ldr	r3, [r7, #744]
	cmp	r3, #0
	beq	.L791
	ldr	r2, [r0, #20]
	sub	r8, fp, #44
	add	lr, lr, #1
	ldr	r3, [r2, #20]
	ldr	r2, [r2, #36]
	add	r3, r3, #2000
	add	r3, r3, #2
	add	r2, r8, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [r2, #-64]
	ldr	r3, [r0, #20]
	ldr	r3, [r3, #36]
	str	r3, [ip, #256]
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #0
	strne	r10, [ip]
	ldr	r0, [r6, #3668]
	cmp	r0, lr
	bls	.L919
.L793:
	ldr	r3, [r1, #4]!
	ldr	r3, [r3, #4]
	str	r3, [ip, #4]!
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	ldr	r0, [r1]
	cmp	r3, #0
	bne	.L920
.L791:
	ldr	r2, [r0, #20]
	sub	r8, fp, #44
	add	lr, lr, #1
	ldr	r3, [r2, #20]
	ldr	r2, [r2, #24]
	add	r3, r3, #2000
	add	r3, r3, #2
	add	r2, r8, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [r2, #-64]
	ldr	r3, [r0, #20]
	ldr	r3, [r3, #24]
	str	r3, [ip, #256]
	ldr	r0, [r6, #3668]
	cmp	r0, lr
	bhi	.L793
.L919:
	ldr	r2, [r6, #3664]
.L789:
	cmp	r2, #0
	beq	.L794
	mov	lr, #70
	ldr	r3, [r5, #372]
	mul	lr, lr, r9
	ldr	r10, [r7, #20]
	add	r3, lr, r3
	add	r3, r3, #3312
	add	r3, r3, #12
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r10, r3
	blt	.L848
	add	ip, r5, #372
	mov	r1, #0
	b	.L796
.L797:
	ldr	r3, [ip, #4]!
	add	r3, lr, r3
	add	r3, r3, #3312
	add	r3, r3, #12
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, r10
	bgt	.L848
.L796:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L797
.L794:
	ldr	r2, [r6, #3616]
	cmp	r2, #0
	bne	.L913
	cmp	r0, #0
	beq	.L913
	mov	r1, #70
	ldr	r3, [r5, #436]
	mul	r9, r1, r9
	ldr	ip, [r7, #20]
	add	r3, r9, r3
	add	r3, r3, #3312
	add	r3, r3, #12
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	ip, r3
	blt	.L795
	add	r1, r5, #436
	b	.L798
.L799:
	ldr	r3, [r1, #4]!
	add	r3, r9, r3
	add	r3, r3, #3312
	add	r3, r3, #12
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, ip
	bgt	.L848
.L798:
	add	r2, r2, #1
	cmp	r2, r0
	bne	.L799
.L913:
	mov	r2, #1
.L795:
	strb	r2, [r5, #24]
	ldrb	r3, [r7, #713]	@ zero_extendqisi2
	strb	r3, [r5, #25]
	ldr	r2, [r6, #3612]
	str	r2, [r5, #28]
	ldrb	r3, [r6, #3603]	@ zero_extendqisi2
	strb	r3, [r5, #32]
	ldr	r3, [r6, #3636]
	str	r3, [r5, #36]
	ldr	r3, [r4, #2368]
	cmp	r3, #0
	bne	.L800
	ldr	r9, [r7, #68]
	ldr	r1, [r4, #204]
	ldr	r0, [r9, #316]
	sub	r3, r1, #1
	mla	r0, r0, r3, r2
	bl	__aeabi_uidiv
	str	r0, [r9, #68]
.L800:
	ldr	r3, [r6, #3616]
	cmp	r3, #0
	bne	.L801
	ldrb	r3, [r6, #3604]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L802
	ldr	r3, [r6, #3640]
	add	r3, r5, r3, lsl #2
	ldr	r9, [r3, #436]
.L803:
	str	r9, [r5, #40]
	ldr	r3, [r6, #3640]
	str	r3, [r5, #48]
	ldrb	r3, [r6, #3604]	@ zero_extendqisi2
	strb	r3, [r5, #52]
	ldr	r3, [r6, #3644]
	str	r3, [r5, #44]
	ldr	r3, [r6, #3672]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r5, #60]
	ldr	r3, [r6, #3676]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r5, #56]
	ldrb	r3, [r6, #3600]	@ zero_extendqisi2
	strb	r3, [r5, #64]
	ldrb	r3, [r6, #3602]	@ zero_extendqisi2
	strb	r3, [r5, #65]
	ldr	r3, [r6, #3664]
	str	r3, [r5, #68]
	ldr	r3, [r6, #3668]
	str	r3, [r5, #72]
	ldr	r3, [r6, #3616]
	str	r3, [r5, #76]
	ldr	r3, [r7, #752]
	str	r3, [r5, #80]
	ldr	r3, [r4, #2840]
	ldr	r0, [r7, #752]
	ldr	r1, [r3, #188]
	bl	__aeabi_uidivmod
	str	r1, [r5, #84]
	ldr	r3, [r4, #2840]
	ldr	r0, [r7, #752]
	ldr	r1, [r3, #188]
	bl	__aeabi_uidiv
	str	r0, [r5, #88]
	mov	r0, r4
	ldr	r1, [r7, #752]
	bl	HEVC_CtbRsAddrToTsAddr
	str	r0, [r5, #92]
	ldr	r3, [r6, #3648]
	str	r3, [r5, #96]
	ldr	r3, [r6, #3652]
	str	r3, [r5, #100]
	ldr	r3, [r6, #3660]
	str	r3, [r5, #104]
	ldr	r3, [r6, #3656]
	str	r3, [r5, #108]
	ldrb	r3, [r6, #3599]	@ zero_extendqisi2
	strb	r3, [r5, #112]
	ldrb	r3, [r6, #3598]	@ zero_extendqisi2
	strb	r3, [r5, #113]
	ldrb	r3, [r6, #3605]	@ zero_extendqisi2
	strb	r3, [r5, #114]
	ldrb	r3, [r6, #3606]	@ zero_extendqisi2
	strb	r3, [r5, #115]
	ldr	r3, [r4, #2844]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L808
	ldr	r2, [r6, #3616]
	cmp	r2, #1
	beq	.L809
.L808:
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L921
.L811:
	ldrb	r3, [r6, #3600]	@ zero_extendqisi2
	cmp	r3, #0
	subne	r3, fp, #44
	addne	r9, r3, r9, lsl #2
	ldreq	r3, [r7, #3916]
	ldrne	r3, [r9, #-64]
	str	r3, [r5, #564]
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L815
	ldr	r3, [r7, #744]
	cmp	r3, #0
	beq	.L815
	ldr	r3, [r4, #2860]
	ldr	lr, [r5, #68]
	cmp	r5, r3
	str	r3, [fp, #-116]
	moveq	r3, #0
	streq	r3, [r5, #1360]
	streqb	r3, [r5, #1356]
	cmp	lr, #0
	beq	.L819
	ldr	r9, [fp, #-116]
	mov	r1, #0
	add	r0, r4, #2864
	mov	r3, r1
.L821:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldr	r2, [r2, #20]
	ldr	ip, [r2, #32]
	cmp	ip, #0
	addeq	r1, r2, #80
	cmp	r3, lr
	bne	.L821
	cmp	r1, #0
	str	r9, [fp, #-116]
	beq	.L819
.L822:
	ldr	r3, [r5, #40]
	ldr	r2, [r7, #28]
	add	r3, r4, r3
	add	r3, r3, #13696
	add	r3, r3, #8
	str	r2, [fp, #-140]
	ldr	r2, [r7, #32]
	ldrsb	r3, [r3, #4]
	cmp	r3, #0
	str	r2, [fp, #-144]
	moveq	r3, #1
	movne	r3, #0
	cmp	r1, #0
	strb	r3, [r5, #1357]
	beq	.L827
	ldr	r3, [r1, #168]
	ldr	ip, [fp, #-116]
	ldr	r0, [r1, #68]
	ldr	r2, [r1, #72]
	str	r3, [ip, #1468]
	ldr	r3, [r1, #172]
	mov	r8, r2
	str	r2, [fp, #-136]
	ldr	r9, [fp, #-140]
	str	r3, [ip, #1472]
	ldr	r3, [r1, #112]
	str	r0, [fp, #-124]
	str	r3, [ip, #1476]
	ldr	r2, [r1, #20]
	ldr	r3, [r1, #24]
	rsb	r3, r2, r3
	str	r3, [ip, #1480]
	ldr	r3, [r1, #140]
	str	r3, [ip, #1484]
	ldr	r3, [r1, #144]
	str	r3, [ip, #1488]
	ldr	r2, [r1, #20]
	ldr	r3, [r1, #44]
	rsb	r3, r2, r3
	str	r3, [ip, #1492]
	ldr	r2, [r1, #44]
	ldr	r3, [r1, #48]
	rsb	r3, r2, r3
	str	r3, [ip, #1496]
	ldr	r10, [r4, #2844]
	ldr	r3, [r10, #2984]
	ldr	r2, [r10, #3496]
	ldr	r1, [r10, #1960]
	sub	r3, r0, r3, asl #1
	ldr	r0, [r10, #2472]
	sub	lr, r3, r2, asl #1
	ldr	ip, [r10, #3240]
	sub	r1, r9, r1, asl #1
	str	lr, [fp, #-148]
	mov	r3, lr, asr #31
	sub	r1, r1, r0, asl #1
	str	r1, [fp, #-160]
	mov	r3, r3, asl #16
	ldr	lr, [r10, #3752]
	mov	r0, r1
	mov	r2, r3
	ldr	r3, [fp, #-148]
	orr	r2, r2, r3, lsr #16
	mov	r3, r3, asl #16
	str	r3, [fp, #-132]
	sub	r3, r8, ip, asl #1
	sub	ip, r3, lr, asl #1
	ldr	lr, [r10, #2216]
	ldr	r3, [fp, #-144]
	str	r2, [fp, #-128]
	mov	r2, r1
	sub	r3, r3, lr, asl #1
	ldr	lr, [r10, #2728]
	ldrd	r8, [fp, #-132]
	mov	r1, r1, asr #31
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	str	ip, [fp, #-152]
	adds	r8, r8, r0
	sub	lr, r3, lr, asl #1
	ldr	r3, .L923
	adc	r9, r9, r1
	mov	r0, r8
	str	lr, [fp, #-132]
	mov	r1, r9
	mov	r8, ip
	ldr	r3, [r3, #244]
	blx	r3
	mov	r1, r8, asr #31
	ldr	lr, [fp, #-132]
	mov	ip, r8, asl #16
	mov	r1, r1, asl #16
	ldr	r3, .L923
	mov	r9, r1
	mov	r1, lr, asr #31
	ldr	r3, [r3, #244]
	mov	r2, lr
	str	r0, [fp, #-156]
	mov	r0, lr
	strd	r0, [fp, #-172]
	orr	r1, r9, r8, lsr #16
	mov	r9, r1
	ldrd	r0, [fp, #-172]
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	adds	r8, ip, r0
	adc	r9, r9, r1
	mov	r0, r8
	mov	r1, r9
	blx	r3
	ldr	r9, [fp, #-140]
	mov	r8, r0
	ldr	r0, [fp, #-124]
	cmp	r9, r0
	bgt	.L828
	ldr	r3, [fp, #-156]
	cmp	r3, #65536
	movgt	r3, #0
	movle	r3, #1
	mov	r9, r3
.L829:
	ldr	r3, [fp, #-144]
	ldr	r2, [fp, #-136]
	cmp	r3, r2
	bgt	.L830
	cmp	r8, #65536
	movgt	r2, #0
	movle	r2, #1
.L831:
	ldr	r1, [fp, #-116]
	cmp	r9, #0
	ldr	r3, [fp, #-124]
	str	r3, [r1, #1364]
	ldr	r3, [fp, #-136]
	str	r3, [r1, #1368]
	mov	r3, #1
	strb	r3, [r1, #1356]
	movne	r3, r9
	orrne	r3, r2, r3
	movne	r2, r1
	strne	r3, [r2, #1360]
	ldr	r2, [fp, #-116]
	ldr	r3, [fp, #-156]
	str	r8, [r2, #1384]
	str	r3, [r2, #1380]
	str	r3, [r2, #1388]
	str	r8, [r2, #1392]
	ldrb	r3, [r10, #1890]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L833
	ldr	r2, [fp, #-152]
	add	r0, r10, #4096
	ldr	r3, [r10, #4008]
	ldr	lr, [fp, #-116]
	mov	r2, r2, lsr #1
	ldr	ip, [fp, #-156]
	str	r3, [lr, #1428]
	mov	r9, r2
	ldr	r2, [r0, #168]
	mul	r1, r3, ip
	str	r2, [lr, #1432]
	ldr	r3, [r0, #424]
	mul	r2, r2, r8
	sub	r3, r3, #8
	str	r3, [lr, #1436]
	add	r1, r1, #8
	mul	r3, r3, ip
	add	r2, r2, #8
	mov	r1, r1, asr #4
	ldr	ip, [r0, #680]
	mov	r2, r2, asr #4
	rsb	r1, r1, #0
	add	r3, r3, #8
	rsb	r2, r2, #0
	sub	r0, ip, #8
	str	r0, [lr, #1440]
	mov	r3, r3, asr #4
	rsb	r3, r3, #0
.L834:
	mul	ip, r0, r8
	ldr	r0, [fp, #-160]
	ldr	r8, [fp, #-116]
	ldr	lr, [fp, #-148]
	add	ip, ip, #8
	mov	r0, r0, asl #8
	str	r1, [r8, #1444]
	add	r0, r0, lr, lsr #1
	mov	r1, lr
	mov	ip, ip, asr #4
	mov	lr, r8
	rsb	ip, ip, #0
	str	r3, [r8, #1452]
	str	r2, [r8, #1448]
	movw	r2, #4095
	str	ip, [lr, #1456]
	mov	r8, #61440
	str	r2, [fp, #-140]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-140]
	movt	r8, 65535
	ldr	r1, [fp, #-152]
	cmp	r0, r2
	movge	ip, r2
	ldr	r2, [fp, #-132]
	movlt	ip, r0
	cmp	ip, r8
	add	r0, r9, r2, lsl #8
	ldr	r9, [fp, #-116]
	movlt	ip, r8
	str	ip, [r9, #1460]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-140]
	mov	r1, #1
	cmp	r0, r2
	movge	r0, r2
	cmp	r0, r8
	movlt	r0, r8
	str	r0, [r9, #1464]
	ldr	r2, [r10, #1960]
	ldr	r0, [fp, #-136]
	mov	r2, r2, asl r1
	str	r2, [r9, #1396]
	ldr	r3, [r10, #2216]
	mov	r2, r2, lsr r1
	str	r2, [r9, #1404]
	mov	r3, r3, asl r1
	str	r3, [r9, #1400]
	mov	r3, r3, lsr r1
	str	r3, [r9, #1408]
	ldr	r2, [r10, #2984]
	mov	r2, r2, asl r1
	str	r2, [r9, #1412]
	ldr	r3, [r10, #3240]
	mov	r2, r2, lsr r1
	str	r2, [r9, #1420]
	mov	r3, r3, asl r1
	str	r3, [r9, #1416]
	mov	r3, r3, lsr r1
	str	r3, [r9, #1424]
	ldr	r3, [r4, #2840]
	ldr	r2, [r3, #128]
	ldr	r3, [fp, #-124]
	mov	r2, r1, asl r2
	sub	r1, r2, #1
	rsb	r2, r2, #0
	add	r3, r3, r1
	add	r1, r0, r1
	and	r3, r3, r2
	and	r2, r2, r1
	mov	r1, r9
	str	r3, [r9, #1372]
	str	r2, [r9, #1376]
.L827:
	add	ip, r4, #12288
	mov	r2, #0
	str	r2, [r5, #1500]
	ldr	r3, [ip, #1156]
	cmp	r3, r2
	beq	.L817
	add	r1, r4, #13696
	mov	r3, r2
	add	r1, r1, #11
.L836:
	ldrsb	r0, [r1, #1]!
	orr	r2, r2, r0, asl r3
	str	r2, [r5, #1500]
	ldr	r0, [ip, #1156]
	add	r3, r3, #1
	cmp	r3, r0
	bcc	.L836
	b	.L817
.L848:
	mov	r2, #0
	b	.L795
.L801:
	cmp	r3, #1
	movne	r9, #0
	bne	.L803
.L802:
	ldr	r3, [r6, #3640]
	add	r3, r5, r3, lsl #2
	ldr	r9, [r3, #372]
	b	.L803
.L815:
	mov	r3, #0
	str	r3, [r5, #1360]
	strb	r3, [r5, #1356]
	mov	r3, #1
	strb	r3, [r5, #1357]
.L817:
	ldr	r3, [r4, #2368]
	cmp	r3, #0
	ldreq	r1, [r4, #2828]
	ldreq	r2, [r4, #2848]
	ldreq	r0, [fp, #-120]
	streq	r1, [r2, r0, asl #2]
	streq	r3, [r4, #2828]
	ldrb	r3, [r7, #2665]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L873
	ldr	r3, [r4, #260]
	cmp	r3, #1
	beq	.L922
	add	r2, r4, r3, lsl #3
	sub	r3, r3, #1
	ldr	r0, [r5, #92]
	add	r2, r2, #10048
	add	r1, r3, #1264
	sub	r0, r0, #1
	str	r0, [r2, #56]
	add	r2, r4, r1, lsl #3
	ldr	r1, [r5, #92]
	str	r1, [r2, #4]
.L840:
	ldr	r1, [r7, #2464]
	add	r3, r4, r3, lsl #3
	ldr	r2, [r7, #2460]
	add	r3, r3, #10112
	mla	r2, r1, r2, r2
	add	r2, r2, r1
	str	r2, [r3, #8]
	ldr	r1, [r5, #92]
	sub	r1, r1, #1
	cmp	r1, #36864
	bcs	.L873
	mov	r0, r4
	bl	HEVC_CtbTsAddrToRsAddr
	str	r0, [r5, #568]
.L873:
	ldr	r0, [fp, #-112]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L916:
	ldr	r3, .L923
	add	r1, r4, #4800
	add	r0, r4, #11776
	add	r1, r1, #8
	add	r0, r0, #12
	mov	r2, #1376
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #1
	strb	r3, [r4, #14]
	b	.L781
.L921:
	ldr	r3, [r6, #3616]
	cmp	r3, #0
	bne	.L811
.L809:
	ldr	ip, [r6, #3752]
	add	r1, r4, #12032
	ldr	r3, .L923
	add	r1, r1, #48
	ldr	r10, .L923
	mov	r2, #64
	str	ip, [r5, #580]
	add	r0, r5, #588
	ldr	ip, [r6, #3884]
	ldr	r3, [r3, #52]
	str	ip, [r5, #584]
	blx	r3
	add	r1, r4, #11904
	add	r1, r1, #44
	ldr	r3, [r10, #52]
	mov	r2, #64
	add	r0, r5, #716
	blx	r3
	add	r1, r4, #12096
	add	r1, r1, #48
	ldr	r3, [r10, #52]
	mov	r2, #128
	add	r0, r5, #844
	blx	r3
	add	r1, r4, #12224
	add	r0, r5, #1088
	ldr	r3, [r10, #52]
	add	r1, r1, #48
	add	r0, r0, #12
	mov	r2, #128
	blx	r3
	ldr	r3, [r6, #3616]
	cmp	r3, #0
	bne	.L811
	add	r1, r4, #12352
	ldr	r3, [r10, #52]
	add	r1, r1, #48
	mov	r2, #64
	add	r0, r5, #652
	blx	r3
	add	r1, r4, #11968
	ldr	r3, [r10, #52]
	add	r1, r1, #44
	mov	r2, #64
	add	r0, r5, #780
	blx	r3
	add	r1, r4, #12416
	ldr	r3, [r10, #52]
	add	r1, r1, #48
	mov	r2, #128
	add	r0, r5, #972
	blx	r3
	add	r1, r4, #12544
	add	r0, r5, #1216
	ldr	r3, [r10, #52]
	add	r1, r1, #48
	mov	r2, #128
	add	r0, r0, #12
	blx	r3
	b	.L811
.L828:
	ldr	r3, [fp, #-124]
	ldr	r0, [fp, #-140]
	mov	r2, r3, asl #1
	add	r3, r2, r3
	add	r1, r3, r3, lsr #31
	cmp	r0, r1, asr #1
	movle	r3, #1
	movle	r9, r3
	ble	.L829
	cmp	r0, r2
	movle	r3, #2
	movle	r9, r3
	ble	.L829
	cmp	r0, r3
	mov	r2, r0
	movle	r3, #3
	movle	r9, r3
	ble	.L829
	ldr	r3, [fp, #-124]
	mov	r0, #1
	ldr	r1, .L923+4
	bl	dprint_vfmw
	mov	r3, #3
	mov	r9, r3
	b	.L829
.L922:
	ldr	r2, [r5, #92]
	mov	r3, #0
	str	r2, [r6, #1924]
	b	.L840
.L833:
	ldr	r1, [fp, #-152]
	ldr	ip, [fp, #-116]
	ldr	r0, [fp, #-132]
	mov	r2, r1, lsr #1
	str	r3, [fp, #-140]
	str	r3, [ip, #1428]
	str	r3, [ip, #1432]
	add	r0, r2, r0, lsl #2
	str	r3, [ip, #1436]
	mov	r9, r2
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-140]
	ldr	ip, [fp, #-116]
	mov	r2, r3
	mov	r1, r3
	sub	r0, r0, #4
	str	r0, [ip, #1440]
	b	.L834
.L830:
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	mov	r2, r3, asl #1
	add	r3, r2, r3
	add	r1, r3, r3, lsr #31
	cmp	r0, r1, asr #1
	movle	r2, #1
	ble	.L831
	cmp	r0, r2
	movle	r2, #2
	ble	.L831
	cmp	r0, r3
	mov	r2, r0
	movle	r2, #3
	ble	.L831
	ldr	r3, [fp, #-136]
	mov	r0, #1
	ldr	r1, .L923+8
	bl	dprint_vfmw
	mov	r2, #3
	b	.L831
.L784:
	ldr	r3, [r6, #3668]
	cmp	r3, #0
	bne	.L841
	b	.L913
.L819:
	ldr	lr, [r5, #72]
	cmp	lr, #0
	beq	.L850
	add	r0, r4, #2928
	ldr	r9, [fp, #-116]
	mov	r1, #0
	add	r0, r0, #4
	mov	r3, r1
.L824:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldr	r2, [r2, #20]
	ldr	ip, [r2, #32]
	cmp	ip, #0
	addeq	r1, r2, #80
	cmp	r3, lr
	bne	.L824
	str	r9, [fp, #-116]
	b	.L822
.L850:
	mov	r1, lr
	b	.L822
.L842:
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L873
.L915:
	mov	r2, r0
	ldr	r1, .L923+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L873
.L924:
	.align	2
.L923:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC86
	.word	.LC87
	.word	.LC85
	UNWIND(.fnend)
	.size	HEVC_WriteSliceMsg, .-HEVC_WriteSliceMsg
	.align	2
	.global	HEVC_GetVirAddr
	.type	HEVC_GetVirAddr, %function
HEVC_GetVirAddr:
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
	.size	HEVC_GetVirAddr, .-HEVC_GetVirAddr
	.align	2
	.global	HEVC_GetPhyAddr
	.type	HEVC_GetPhyAddr, %function
HEVC_GetPhyAddr:
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
	.size	HEVC_GetPhyAddr, .-HEVC_GetPhyAddr
	.align	2
	.global	HEVC_CfgVDMReg
	.type	HEVC_CfgVDMReg, %function
HEVC_CfgVDMReg:
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
	add	r2, r0, #4096
	mov	r1, r0
	add	ip, r0, #8192
	mov	r0, #0
	ldr	r3, [r2, #36]
	ldr	lr, [r2, #40]
	clz	r3, r3
	str	lr, [r2, #3772]
	mov	r3, r3, lsr #5
	str	r3, [r2, #3780]
	ldr	r3, [r1, #204]
	str	r3, [ip, #832]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_CfgVDMReg, .-HEVC_CfgVDMReg
	.align	2
	.global	HEVC_IsRefForCurrPic
	.type	HEVC_IsRefForCurrPic, %function
HEVC_IsRefForCurrPic:
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
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r3, #1
	beq	.L957
.L929:
	add	r5, r4, #4096
	ldr	r2, [r4, #164]
	ldr	r3, [r5, #748]
	cmp	r3, #0
	blt	.L946
	cmp	r3, r2
	bge	.L946
	ldr	r2, [r4, #2820]
	movw	r1, #5036
	mla	r3, r1, r3, r2
	ldr	r2, [r4, #160]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	blt	.L933
	cmp	r3, r2
	bge	.L933
	ldr	r2, [r4, #2816]
	movw	r0, #12668
	ldr	ip, [r5, #1644]
	mov	r1, #1
	ldr	r10, [r5, #1648]
	mla	r2, r0, r3, r2
	ldr	r6, [r5, #1652]
	add	lr, r10, ip
	cmp	lr, r6
	mov	r3, lr
	ldr	r8, [r2, #116]
	mov	r8, r1, asl r8
	bcs	.L947
	cmp	lr, #15
	bgt	.L936
	add	r2, lr, #1456
	ldr	r7, [r5, #20]
	add	r2, r2, #3
	sub	r8, r8, #1
	and	r9, r8, r7
	str	ip, [fp, #-48]
	add	r2, r4, r2, lsl #2
	b	.L938
.L959:
	cmp	r3, r6
	bcs	.L958
	cmp	r3, #16
	beq	.L936
.L938:
	ldr	r1, [r2, #4]!
	mov	r0, r7
	add	r3, r3, #1
	ldr	ip, [r2, #-944]
	cmp	ip, #0
	andeq	r1, r1, r8
	moveq	r0, r9
	cmp	r0, r1
	bne	.L959
	ldr	ip, [fp, #-48]
	mov	r6, #1
.L935:
	cmp	lr, #0
	beq	.L950
	ldr	r0, [r5, #724]
	ldr	r3, [r5, #1676]
	ldr	r2, [r5, #20]
	add	r3, r0, r3
	cmp	r2, r3
	beq	.L941
	add	r4, r4, #5760
	mov	r1, #0
	add	r4, r4, #12
	b	.L942
.L943:
	ldr	r3, [r4, #4]!
	add	r3, r0, r3
	cmp	r3, r2
	beq	.L941
.L942:
	add	r1, r1, #1
	cmp	r1, lr
	beq	.L950
	cmp	r1, #17
	bne	.L943
	mov	r3, r1
	str	r1, [sp]
	str	r10, [sp, #8]
	movw	r2, #9101
	str	ip, [sp, #4]
	mov	r0, #0
	ldr	r1, .L960
	bl	dprint_vfmw
	mov	r0, r6
	b	.L955
.L946:
	str	r2, [sp]
	mov	r0, #0
	movw	r2, #9040
	ldr	r1, .L960+4
	bl	dprint_vfmw
	mov	r0, #0
.L955:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L957:
	ldr	r3, [r0, #2856]
	ldr	r3, [r3, #24]
	bics	r3, r3, #4
	beq	.L929
.L941:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L933:
	str	r2, [sp]
	mov	r0, #0
	movw	r2, #9052
	ldr	r1, .L960+8
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L936:
	str	r6, [sp, #4]
	mov	r1, #16
	mov	r0, #0
	str	r1, [sp]
	movw	r2, #9072
	ldr	r1, .L960+12
	mov	r6, r0
	bl	dprint_vfmw
	ldr	ip, [r5, #1644]
	ldr	r10, [r5, #1648]
	add	lr, r10, ip
	b	.L935
.L958:
	ldr	ip, [fp, #-48]
	mov	r6, #0
	b	.L935
.L950:
	mov	r0, r6
	b	.L955
.L947:
	mov	r6, #0
	b	.L935
.L961:
	.align	2
.L960:
	.word	.LC91
	.word	.LC88
	.word	.LC89
	.word	.LC90
	UNWIND(.fnend)
	.size	HEVC_IsRefForCurrPic, .-HEVC_IsRefForCurrPic
	.align	2
	.global	HEVC_IsPicVPSRefresh
	.type	HEVC_IsPicVPSRefresh, %function
HEVC_IsPicVPSRefresh:
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
	ldr	r2, [r0, #2836]
	ldr	r3, [r1, #4]
	ldr	r2, [r2, #4]
	cmp	r2, r3
	beq	.L965
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L965:
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsPicVPSRefresh, .-HEVC_IsPicVPSRefresh
	.align	2
	.global	HEVC_UpdatePicVPS
	.type	HEVC_UpdatePicVPS, %function
HEVC_UpdatePicVPS:
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
	mov	r2, #0
	strb	r2, [r1, #2]
	ldr	r3, [r0, #156]
	movw	r4, #24912
	ldr	ip, .L967
	mov	r5, r0
	ldr	r0, [r0, #2812]
	mov	r2, r4
	mul	r3, r4, r3
	ldr	r6, [ip, #52]
	sub	r3, r3, #24832
	sub	r3, r3, #80
	add	r0, r0, r3
	blx	r6
	ldr	r2, [r5, #156]
	ldr	r3, [r5, #2812]
	mul	r4, r4, r2
	sub	r4, r4, #24832
	sub	r4, r4, #80
	add	r4, r3, r4
	str	r4, [r5, #2836]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L968:
	.align	2
.L967:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_UpdatePicVPS, .-HEVC_UpdatePicVPS
	.align	2
	.global	HEVC_IsPicSPSRefresh
	.type	HEVC_IsPicSPSRefresh, %function
HEVC_IsPicSPSRefresh:
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
	ldr	r2, [r0, #2840]
	ldr	r3, [r1, #56]
	ldr	r2, [r2, #56]
	cmp	r2, r3
	beq	.L972
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L972:
	ldrb	r0, [r1]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsPicSPSRefresh, .-HEVC_IsPicSPSRefresh
	.align	2
	.global	HEVC_UpdatePicSPS
	.type	HEVC_UpdatePicSPS, %function
HEVC_UpdatePicSPS:
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
	mov	r2, #0
	strb	r2, [r1]
	ldr	r3, [r0, #160]
	movw	r5, #12668
	ldr	ip, .L974
	mov	r4, r0
	ldr	r0, [r0, #2816]
	mov	r2, r5
	mul	r3, r5, r3
	ldr	r6, [ip, #52]
	sub	r3, r3, #12608
	sub	r3, r3, #60
	add	r0, r0, r3
	blx	r6
	ldr	r3, [r4, #160]
	ldr	r1, [r4, #2816]
	mul	r3, r5, r3
	sub	r3, r3, #12608
	sub	r3, r3, #60
	add	r3, r1, r3
	str	r3, [r4, #2840]
	ldr	r2, [r3, #56]
	str	r2, [r4, #288]
	ldr	r2, [r3, #64]
	str	r2, [r4, #292]
	ldr	r2, [r3, #68]
	str	r2, [r4, #296]
	ldr	r2, [r3, #128]
	str	r2, [r4, #300]
	ldr	r2, [r3, #88]
	str	r2, [r4, #304]
	ldr	r3, [r3, #96]
	str	r3, [r4, #308]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L975:
	.align	2
.L974:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_UpdatePicSPS, .-HEVC_UpdatePicSPS
	.align	2
	.global	HEVC_IsPicPPSRefresh
	.type	HEVC_IsPicPPSRefresh, %function
HEVC_IsPicPPSRefresh:
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
	ldr	r2, [r0, #2844]
	ldr	r3, [r1, #28]
	ldr	r2, [r2, #28]
	cmp	r2, r3
	beq	.L979
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L979:
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsPicPPSRefresh, .-HEVC_IsPicPPSRefresh
	.align	2
	.global	HEVC_UpdatePicPPS
	.type	HEVC_UpdatePicPPS, %function
HEVC_UpdatePicPPS:
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
	ldrb	r3, [r2, #13]	@ zero_extendqisi2
	mov	r4, #0
	mov	r5, r2
	cmp	r3, r4
	mov	r6, r0
	mov	r7, r1
	strb	r4, [r2, #1]
	beq	.L981
	ldrb	r3, [r2, #15]	@ zero_extendqisi2
	cmp	r3, r4
	bne	.L999
	ldr	lr, [r2, #68]
	ldr	r3, [r1, #188]
	cmp	lr, #1
	add	r0, r2, lr, lsl #1
	strh	r3, [r0, #170]	@ movhi
	ble	.L993
	add	lr, lr, #42
	add	r2, r2, #86
	add	ip, r5, #170
	add	lr, r5, lr, lsl #1
.L992:
	ldrh	r1, [r2, #2]!
	cmp	r2, lr
	strh	r1, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #170]
	rsb	r3, r1, r3
	strh	r3, [r0, #170]	@ movhi
	bne	.L992
.L993:
	ldr	lr, [r5, #72]
	ldr	r3, [r7, #192]
	cmp	lr, #1
	add	r0, r5, lr, lsl #1
	strh	r3, [r0, #210]	@ movhi
	ble	.L988
	add	lr, lr, #62
	add	r2, r5, #126
	add	ip, r5, #210
	add	lr, r5, lr, lsl #1
.L994:
	ldrh	r1, [r2, #2]!
	cmp	r2, lr
	strh	r1, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #210]
	rsb	r3, r1, r3
	strh	r3, [r0, #210]	@ movhi
	bne	.L994
	b	.L988
.L981:
	ldr	r3, [r1, #188]
	strh	r3, [r2, #172]	@ movhi
	ldr	r3, [r1, #192]
	strh	r3, [r2, #212]	@ movhi
.L988:
	ldr	r3, [r6, #164]
	movw	r4, #5036
	ldr	ip, .L1000
	mov	r1, r5
	ldr	r0, [r6, #2820]
	mov	r2, r4
	mul	r3, r4, r3
	ldr	r5, [ip, #52]
	sub	r3, r3, #4992
	sub	r3, r3, #44
	add	r0, r0, r3
	blx	r5
	ldr	r2, [r6, #164]
	ldr	r3, [r6, #2820]
	mul	r4, r4, r2
	sub	r4, r4, #4992
	sub	r4, r4, #44
	add	r4, r3, r4
	str	r4, [r6, #2844]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L999:
	ldr	r9, [r2, #68]
	cmp	r9, r4
	addgt	r3, r2, #170
	ble	.L987
.L986:
	ldr	r10, [r7, #188]
	add	r4, r4, #1
	mov	r1, r9
	str	r3, [fp, #-48]
	mul	r0, r10, r4
	bl	__aeabi_uidiv
	mov	r1, r9
	mov	r8, r0
	sub	r0, r4, #1
	mul	r0, r0, r10
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-48]
	cmp	r4, r9
	rsb	r0, r0, r8
	strh	r0, [r3, #2]!	@ movhi
	bne	.L986
.L987:
	ldr	r9, [r5, #72]
	cmp	r9, #0
	addgt	r3, r5, #210
	movgt	r4, #0
	ble	.L988
.L989:
	ldr	r10, [r7, #192]
	add	r4, r4, #1
	mov	r1, r9
	str	r3, [fp, #-48]
	mul	r0, r10, r4
	bl	__aeabi_uidiv
	mov	r1, r9
	mov	r8, r0
	sub	r0, r4, #1
	mul	r0, r0, r10
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-48]
	cmp	r4, r9
	rsb	r0, r0, r8
	strh	r0, [r3, #2]!	@ movhi
	bne	.L989
	b	.L988
.L1001:
	.align	2
.L1000:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_UpdatePicPPS, .-HEVC_UpdatePicPPS
	.align	2
	.global	HEVC_InitPicInfo
	.type	HEVC_InitPicInfo, %function
HEVC_InitPicInfo:
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
	add	r4, r0, #4096
	mov	r5, r0
	mvn	r3, #0
	mov	r0, #1
	ldr	r2, [r4, #740]
	mov	r1, #0
	ldr	lr, [r4, #724]
	str	r3, [r4, #40]
	strb	r0, [r4, #9]
	str	r2, [r4, #12]
	str	lr, [r4, #20]
	ldr	ip, [r5, #2840]
	ldr	r3, .L1018
	ldr	r2, [ip, #64]
	str	r2, [r4, #28]
	ldr	r2, [ip, #68]
	str	r1, [r4, #36]
	str	r2, [r4, #32]
	ldr	r2, [r5, #276]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, r0
	beq	.L1017
.L1003:
	ldr	r3, [r5, #2368]
	cmp	r3, #0
	bne	.L1006
	ldr	ip, [r5, #2856]
	movw	r7, #4752
	add	lr, r5, #4736
	movw	r6, #4768
	mvn	r0, #0
	mvn	r1, #0
	ldrd	r2, [ip, #64]
	strd	r2, [r5, r7]
	ldrd	r2, [ip, #80]
	strd	r2, [lr, #24]
	ldrd	r2, [ip, #96]
	strd	r2, [r5, r6]
	ldr	r3, [ip, #112]
	str	r3, [r4, #72]
	ldr	r3, [ip, #116]
	str	r3, [r4, #76]
	ldr	r3, [ip, #120]
	str	r3, [r4, #80]
	ldr	r3, [ip, #136]
	str	r3, [r4, #84]
	ldrb	r3, [ip, #56]	@ zero_extendqisi2
	strb	r3, [r4, #704]
	strd	r0, [ip, #64]
	ldr	ip, [r5, #2840]
.L1006:
	ldr	r1, [ip, #64]
	mov	r6, #0
	ldr	r2, [r4, #744]
	add	r0, r5, #4160
	ldrb	r3, [r4, #136]	@ zero_extendqisi2
	add	r0, r0, #8
	str	r1, [r4, #140]
	ldr	r1, [ip, #68]
	str	r2, [r4, #256]
	str	r2, [r4, #16]
	str	r1, [r4, #144]
	str	r6, [r4, #124]
	ldr	r2, [ip, #60]
	ldr	r1, [ip, #2084]
	subs	r2, r2, #1
	bfi	r3, r1, #5, #3
	movne	r2, #1
	bfi	r3, r2, #2, #3
	strb	r3, [r4, #136]
	ldr	r1, [ip, #2068]
	and	r1, r1, #7
	bl	SetAspectRatio
	ldr	r3, [r5, #2368]
	cmp	r3, #1
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #724]
	str	r2, [r3, #8]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #136]
	str	r2, [r3, #144]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #124]
	str	r2, [r3, #132]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #176]
	str	r2, [r3, #184]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #172]
	str	r2, [r3, #180]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #140]
	str	r2, [r3, #148]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #144]
	str	r2, [r3, #152]
	ldr	r3, [r4, #68]
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #28]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L1008
	ldr	r3, [r4, #124]
	mov	r1, r6
	ldr	r2, [r0, #4]
	subs	r3, r3, r6
	ldr	r0, [r5, #276]
	movne	r3, #1
	bl	FSP_SetStoreType
.L1008:
	ldr	r3, [r5, #2840]
	add	r5, r5, #24576
	ldr	ip, [r4, #68]
	ldr	r2, [r3, #72]
	str	r2, [r4, #292]
	ldr	r6, [r3, #76]
	str	r6, [r4, #296]
	ldr	r1, [r3, #80]
	str	r1, [r4, #300]
	ldr	lr, [r3, #84]
	str	lr, [r4, #304]
	ldr	r0, [r3, #64]
	rsb	r2, r2, r0
	rsb	r2, r6, r2
	str	r2, [r4, #148]
	ldr	r0, [r3, #68]
	rsb	r1, r1, r0
	mov	r0, #0
	rsb	r1, lr, r1
	str	r1, [r4, #152]
	ldr	r1, [r3, #60]
	str	r1, [r4, #236]
	ldr	r1, [r3, #88]
	str	r1, [r4, #240]
	ldr	r3, [r3, #96]
	str	r3, [r4, #244]
	ldr	r3, [ip, #164]
	str	r3, [r4, #156]
	ldr	r3, [ip, #168]
	str	r3, [r4, #160]
	str	r2, [ip, #156]
	ldr	r2, [r4, #152]
	ldr	r3, [r4, #68]
	str	r2, [r3, #160]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #156]
	str	r2, [r3, #164]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #160]
	str	r2, [r3, #168]
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #240]
	str	r2, [r3, #248]
	ldr	r2, [r4, #244]
	ldr	r3, [r4, #68]
	str	r2, [r3, #252]
	ldr	r3, [r4, #732]
	cmp	r3, #2
	ldreqb	r3, [r5, #3556]	@ zero_extendqisi2
	ldreqb	r2, [r5, #3552]	@ zero_extendqisi2
	ubfxeq	r1, r3, #1, #4
	andeq	r3, r3, #1
	bfieq	r2, r1, #1, #4
	ldrneb	r3, [r5, #3552]	@ zero_extendqisi2
	bfieq	r2, r3, #0, #1
	streqb	r2, [r5, #3552]
	ldr	r2, [r4, #68]
	andne	r3, r3, #1
	ldrb	r1, [r2, #716]	@ zero_extendqisi2
	bfi	r1, r3, #0, #1
	strb	r1, [r2, #716]
	ldr	r2, [r4, #68]
	ldrb	r3, [r5, #3552]	@ zero_extendqisi2
	ldrb	r1, [r2, #716]	@ zero_extendqisi2
	ubfx	r3, r3, #1, #4
	bfi	r1, r3, #1, #4
	strb	r1, [r2, #716]
	ldrb	r3, [r5, #3556]	@ zero_extendqisi2
	and	r3, r3, #254
	bfc	r3, #1, #4
	strb	r3, [r5, #3556]
	str	r0, [r4, #24]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1017:
	ldr	r2, [r3, #160]
	cmp	r2, r0
	bne	.L1003
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L1003
	add	r3, r5, #8192
	ldrb	r3, [r3, #3536]	@ zero_extendqisi2
	cmp	r3, r0
	bne	.L1003
	add	r3, r5, #11776
	movw	r2, #11760
	ldrd	r0, [r5, r2]
	ldrd	r2, [r3]
	cmp	r1, r3
	cmpeq	r0, r2
	bls	.L1004
	subs	r6, r0, r2
	sbc	r7, r1, r3
	cmp	r7, #0
	cmpeq	r6, #16
	bls	.L1004
.L1005:
	ldr	r0, [r5, #284]
	movw	r1, #11760
	rsb	lr, r0, lr
	adds	r2, r2, lr
	adc	r3, r3, lr, asr #31
	strd	r2, [r5, r1]
	b	.L1003
.L1004:
	cmp	r1, r3
	cmpeq	r0, r2
	bcs	.L1003
	subs	r0, r2, r0
	sbc	r1, r3, r1
	cmp	r1, #0
	cmpeq	r0, #16
	bls	.L1003
	b	.L1005
.L1019:
	.align	2
.L1018:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	HEVC_InitPicInfo, .-HEVC_InitPicInfo
	.align	2
	.global	HEVC_RepairList
	.type	HEVC_RepairList, %function
HEVC_RepairList:
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
	add	r3, r0, #4096
	str	r3, [fp, #-56]
	mov	r2, r0
	ldr	r3, [r3, #732]
	cmp	r3, #1
	beq	.L1037
	cmp	r3, #2
	beq	.L1038
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [fp, #-48]
	beq	.L1022
	ldr	r2, .L1047
	mov	r0, #1
	ldr	r1, .L1047+4
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1037:
	str	r3, [fp, #-48]
.L1022:
	add	r10, r2, #4864
	add	r8, r2, #2864
	add	r10, r10, #8
	add	r8, r8, #4
	mov	r9, #0
	mov	r7, r2
.L1035:
	ldr	r2, [r10, #4]!
	cmp	r2, #0
	beq	.L1025
	ldr	r1, [r8]
	cmp	r1, #0
	bne	.L1039
	mov	r0, r8
	mov	r3, r1
	b	.L1027
.L1029:
	ldr	r5, [r0, #4]!
	cmp	r5, #0
	bne	.L1045
.L1027:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L1029
	mov	r3, #255
	str	r3, [fp, #-52]
.L1028:
	ldr	r3, [r7, #2856]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L1030
	ldr	r3, [fp, #-56]
	ldr	r5, [r3, #68]
	add	r5, r5, #56
.L1026:
	mov	r3, r1
	mov	r6, r8
	mov	r4, #0
	b	.L1036
.L1032:
	ldr	r3, [r6, #4]!
.L1036:
	cmp	r3, #0
	beq	.L1046
.L1031:
	add	r4, r4, #1
	cmp	r2, r4
	bhi	.L1032
.L1033:
	ldr	r3, [fp, #-48]
	add	r9, r9, #1
	add	r8, r8, #68
	cmp	r9, r3
	bcc	.L1035
.L1038:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1025:
	ldr	r3, [r7, #2856]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L1033
	mov	r3, #1
	str	r3, [r10]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #68]
	add	r3, r3, #56
	str	r3, [r8]
	b	.L1033
.L1046:
	ldrsb	r2, [fp, #-52]
	mov	r3, r9
	str	r4, [sp]
	mov	r0, #1
	ldr	r1, .L1047+8
	str	r2, [sp, #4]
	ldr	r2, .L1047
	bl	dprint_vfmw
	str	r5, [r6]
	ldr	r2, [r10]
	b	.L1031
.L1045:
	uxtb	r3, r3
	str	r3, [fp, #-52]
	cmp	r3, #255
	bne	.L1026
	b	.L1028
.L1039:
	mov	r3, #0
	mov	r5, r1
	str	r3, [fp, #-52]
	b	.L1026
.L1030:
	mov	r3, r9
	ldr	r2, .L1047
	ldr	r1, .L1047+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1048:
	.align	2
.L1047:
	.word	.LANCHOR0+388
	.word	.LC92
	.word	.LC94
	.word	.LC93
	UNWIND(.fnend)
	.size	HEVC_RepairList, .-HEVC_RepairList
	.align	2
	.global	HEVC_InitListX
	.type	HEVC_InitListX, %function
HEVC_InitListX:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #148)
	sub	sp, sp, #148
	subs	r4, r0, #0
	beq	.L1112
	ldr	r3, .L1162
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #180
	ldr	r3, [r3, #48]
	blx	r3
	ldr	lr, [r4, #3052]
	cmp	lr, #0
	beq	.L1113
	add	r0, r4, #3264
	mov	r1, #0
	add	r0, r0, #8
	mov	r3, r1
	b	.L1053
.L1052:
	cmp	r3, lr
	beq	.L1051
.L1053:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L1052
	ldr	ip, [r2, #60]
	cmp	ip, #0
	bne	.L1052
	ldr	ip, [r2, #64]
	cmp	ip, #1
	subeq	ip, fp, #44
	addeq	r2, r2, #56
	addeq	ip, ip, r1, lsl #2
	addeq	r1, r1, #1
	streq	r2, [ip, #-136]
	cmp	r3, lr
	bne	.L1053
.L1051:
	ldrb	lr, [r4, #1]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L1155
	ldr	r3, [r4, #3056]
	mov	r5, r1
	cmp	r3, #0
	moveq	r3, lr
	moveq	ip, lr
	beq	.L1111
	mov	ip, lr
.L1110:
	add	r6, r4, #3328
	mov	r2, #0
	add	r6, r6, #12
	b	.L1060
.L1059:
	cmp	r2, r3
	bcs	.L1156
.L1060:
	ldr	r0, [r6, #4]!
	add	r2, r2, #1
	ldrb	r7, [r0, #1]	@ zero_extendqisi2
	cmp	r7, #1
	bne	.L1059
	ldr	r7, [r0, #60]
	cmp	r7, #0
	bne	.L1059
	ldr	r7, [r0, #64]
	cmp	r7, #1
	subeq	r7, fp, #44
	addeq	r0, r0, #56
	addeq	r7, r7, r5, lsl #2
	addeq	r5, r5, #1
	streq	r0, [r7, #-136]
	cmp	r2, r3
	bcc	.L1060
.L1156:
	cmp	lr, #0
	rsbne	r2, r1, r5
	rsbne	r3, ip, r2
	bne	.L1058
	rsb	r3, r1, r5
.L1111:
	ldr	r7, [r4, #3048]
	cmp	r7, #0
	beq	.L1064
.L1062:
	add	r6, r4, #3408
	mov	r2, #0
	b	.L1066
.L1065:
	cmp	r7, r2
	bls	.L1157
.L1066:
	ldr	r0, [r6, #4]!
	add	r2, r2, #1
	ldrb	r8, [r0, #1]	@ zero_extendqisi2
	cmp	r8, #1
	bne	.L1065
	ldr	r8, [r0, #60]
	cmp	r8, #1
	bne	.L1065
	ldr	r8, [r0, #64]
	sub	r9, fp, #44
	add	r9, r9, r5, lsl #2
	add	r0, r0, #56
	cmp	r8, #0
	addeq	r5, r5, #1
	streq	r0, [r9, #-136]
	cmp	r7, r2
	bhi	.L1066
.L1157:
	cmp	lr, #0
	rsbeq	r7, r1, r5
	rsbeq	r7, r3, r7
	beq	.L1064
	rsb	r2, r1, r5
.L1063:
	ldr	r0, [r4, #3068]
	rsb	r7, r3, r2
	rsb	r7, ip, r7
	cmp	r0, #0
	beq	.L1071
	add	r8, r4, #3136
	mov	r2, #0
.L1070:
	ldr	r6, [r8, #4]!
	add	r2, r2, #1
	ldrb	r9, [r6, #1]	@ zero_extendqisi2
	cmp	r9, #1
	subeq	r9, fp, #44
	addeq	r6, r6, #56
	addeq	r9, r9, r5, lsl #2
	addeq	r5, r5, #1
	streq	r6, [r9, #-136]
	cmp	r2, r0
	bne	.L1070
	rsb	r0, r1, r5
	rsb	r0, r3, r0
	rsb	r0, ip, r0
	rsb	r0, r7, r0
.L1071:
	cmp	r5, #0
	beq	.L1158
.L1072:
	add	r2, r4, #4096
	str	r2, [fp, #-184]
	ldr	r2, [r2, #732]
	cmp	r2, #0
	str	r2, [fp, #-188]
	bne	.L1159
	cmp	lr, #0
	beq	.L1160
	cmp	r3, #0
	beq	.L1118
	add	r8, ip, r1
	sub	r6, fp, #180
	ldr	r2, [fp, #-188]
	sub	r9, fp, #116
	add	r8, r6, r8, lsl #2
.L1081:
	add	r2, r2, #1
	ldr	r6, [r8], #4
	cmp	r2, r3
	str	r6, [r9, #4]!
	bne	.L1081
.L1118:
	cmp	r0, #0
	mov	r2, r3
	beq	.L1079
	add	r8, r7, r3
	add	r9, r3, #16
	add	r8, r8, r1
	sub	r6, fp, #180
	add	r8, r8, ip
	add	r9, r6, r9, lsl #2
	mov	r2, #0
	add	r8, r6, r8, lsl #2
.L1082:
	add	r2, r2, #1
	ldr	r6, [r8], #4
	cmp	r2, r0
	str	r6, [r9, #4]!
	bne	.L1082
	add	r2, r3, r2
	b	.L1079
.L1155:
	ldr	ip, [r4, #3064]
	cmp	ip, #0
	beq	.L1114
	add	r0, r4, #3056
	mov	r5, r1
	add	r0, r0, #12
	mov	r3, #0
	b	.L1057
.L1056:
	cmp	r3, ip
	beq	.L1161
.L1057:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	r6, [r2, #1]	@ zero_extendqisi2
	cmp	r6, #1
	bne	.L1056
	ldr	r6, [r2, #72]
	cmp	r6, #1
	subeq	r6, fp, #44
	addeq	r2, r2, #56
	addeq	r6, r6, r5, lsl #2
	addeq	r5, r5, #1
	streq	r2, [r6, #-136]
	cmp	r3, ip
	bne	.L1057
.L1161:
	rsb	ip, r1, r5
.L1055:
	ldr	r3, [r4, #3056]
	cmp	r3, #0
	bne	.L1110
	mov	r2, ip
.L1058:
	ldr	r7, [r4, #3048]
	cmp	r7, #0
	bne	.L1062
	b	.L1063
.L1159:
	ldr	r3, [fp, #-184]
	ldr	r7, [r3, #788]
	ldr	r8, [r3, #792]
	cmp	r7, #0
	str	r7, [r3, #780]
	str	r8, [r3, #784]
	beq	.L1104
.L1075:
	ldr	r3, [fp, #-184]
	add	r10, r4, #2864
	mov	r9, #0
	ldrb	r6, [r3, #1808]	@ zero_extendqisi2
.L1098:
	cmp	r6, #0
	mov	r1, r5
	mov	r0, r9
	ldrne	r1, [r10, #3044]
	bne	.L1097
	bl	__aeabi_uidivmod
.L1097:
	sub	r3, fp, #44
	add	r9, r9, #1
	add	r1, r3, r1, lsl #2
	cmp	r9, r7
	ldr	r3, [r1, #-136]
	str	r3, [r10, #4]!
	bne	.L1098
	ldr	r3, [fp, #-188]
	cmp	r3, #0
	bne	.L1095
.L1094:
	cmp	r8, #0
	beq	.L1100
	ldr	r3, [fp, #-184]
	add	r9, r4, #2928
	add	r9, r9, #4
	mov	r6, #0
	ldrb	r10, [r3, #1809]	@ zero_extendqisi2
.L1103:
	cmp	r10, #0
	mov	r1, r5
	mov	r0, r6
	ldrne	r1, [r9, #3104]
	bne	.L1102
	bl	__aeabi_uidivmod
.L1102:
	sub	r3, fp, #44
	add	r6, r6, #1
	add	r1, r3, r1, lsl #2
	cmp	r6, r8
	ldr	r3, [r1, #-68]
	str	r3, [r9, #4]!
	bne	.L1103
.L1095:
	cmp	r7, #16
	bhi	.L1108
.L1104:
	add	r7, r7, #716
	add	r2, r4, #2928
	add	r2, r2, #4
	add	r7, r4, r7, lsl #2
.L1107:
	ldr	r3, [r4, #2868]
	str	r3, [r7, #4]!
	cmp	r7, r2
	bne	.L1107
.L1108:
	cmp	r8, #16
	bhi	.L1106
	add	r8, r8, #732
	add	r2, r4, #2992
	add	r8, r8, #1
	add	r2, r2, #8
	add	r8, r4, r8, lsl #2
.L1109:
	ldr	r3, [r4, #2936]
	str	r3, [r8, #4]!
	cmp	r8, r2
	bne	.L1109
.L1106:
	mov	r0, #0
.L1148:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1064:
	cmp	r5, #0
	mov	r0, #0
	bne	.L1072
.L1158:
	ldr	r3, .L1162
	add	r6, r4, #4096
	add	r0, r4, #2864
	mov	r2, #136
	add	r0, r0, #4
	str	r5, [r6, #780]
	ldr	r3, [r3, #48]
	mov	r1, r5
	str	r5, [r6, #784]
	blx	r3
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L1106
	ldr	r3, [r6, #68]
	mov	r2, #1
	mov	r0, r5
	str	r2, [r6, #780]
	add	r3, r3, #56
	str	r3, [r4, #2868]
	b	.L1148
.L1160:
	cmp	r3, #0
	beq	.L1150
	sub	r2, fp, #180
	sub	r0, fp, #116
	add	r8, r2, r1, lsl #2
	mov	r2, lr
.L1085:
	add	r2, r2, #1
	ldr	r6, [r8], #4
	cmp	r2, r3
	str	r6, [r0, #4]!
	bne	.L1085
.L1150:
	mov	r2, r3
.L1079:
	cmp	r1, #0
	beq	.L1084
	add	r8, r2, #16
	sub	r9, fp, #180
	mov	r0, #0
	add	r8, r9, r8, lsl #2
.L1086:
	add	r0, r0, #1
	ldr	r6, [r9], #4
	cmp	r0, r1
	str	r6, [r8, #4]!
	bne	.L1086
	add	r2, r2, r1
.L1084:
	cmp	lr, #0
	bne	.L1087
	cmp	r7, #0
	beq	.L1089
	add	r1, r3, r1
	add	r2, r2, #16
	sub	r3, fp, #180
	add	r1, r3, r1, lsl #2
	add	r3, r3, r2, lsl #2
.L1093:
	add	lr, lr, #1
	ldr	r2, [r1], #4
	cmp	lr, r7
	str	r2, [r3, #4]!
	bne	.L1093
.L1089:
	ldr	r3, [fp, #-184]
	ldr	r7, [r3, #788]
	ldr	r8, [r3, #792]
	cmp	r7, #0
	str	r7, [r3, #780]
	str	r8, [r3, #784]
	bne	.L1075
	b	.L1094
.L1087:
	cmp	r7, #0
	beq	.L1090
	add	r0, r3, ip
	add	lr, r2, #16
	add	r0, r0, r1
	sub	r6, fp, #180
	add	lr, r6, lr, lsl #2
	mov	r3, #0
	add	r0, r6, r0, lsl #2
.L1091:
	add	r3, r3, #1
	ldr	r6, [r0], #4
	cmp	r3, r7
	str	r6, [lr, #4]!
	bne	.L1091
	add	r2, r2, r3
.L1090:
	cmp	ip, #0
	beq	.L1089
	add	r2, r2, #16
	sub	r0, fp, #180
	sub	r3, fp, #180
	add	r2, r0, r2, lsl #2
	add	r1, r3, r1, lsl #2
	mov	r3, #0
.L1092:
	add	r3, r3, #1
	ldr	r0, [r1], #4
	cmp	r3, ip
	str	r0, [r2, #4]!
	bne	.L1092
	b	.L1089
.L1113:
	mov	r1, lr
	b	.L1051
.L1114:
	mov	r5, r1
	b	.L1055
.L1100:
	ldr	r3, .L1162
	add	r1, r4, #2864
	add	r0, r4, #2928
	add	r1, r1, #4
	add	r0, r0, #8
	mov	r2, #68
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-184]
	ldr	r7, [r3, #780]
	str	r7, [r3, #784]
	mov	r8, r7
	b	.L1095
.L1112:
	mvn	r0, #0
	b	.L1148
.L1163:
	.align	2
.L1162:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_InitListX, .-HEVC_InitListX
	.align	2
	.global	HEVC_DecList
	.type	HEVC_DecList, %function
HEVC_DecList:
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
	add	r3, r0, #4096
	mov	r4, r0
	ldr	r2, [r3, #732]
	cmp	r2, #2
	beq	.L1169
	bl	HEVC_InitListX
	cmp	r0, #0
	bne	.L1170
	mov	r0, r4
	bl	HEVC_RepairList
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L1171
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1169:
	mov	r0, #0
	str	r0, [r3, #780]
	str	r0, [r3, #784]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1170:
	ldr	r1, .L1171+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1172:
	.align	2
.L1171:
	.word	.LC96
	.word	.LC95
	UNWIND(.fnend)
	.size	HEVC_DecList, .-HEVC_DecList
	.align	2
	.global	HEVC_ArrangeMem
	.type	HEVC_ArrangeMem, %function
HEVC_ArrangeMem:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r2, [r0, #2840]
	movw	r1, #8160
	mov	r4, r0
	ldr	r6, [r2, #188]
	ldr	r5, [r2, #192]
	ldr	r2, [r2, #128]
	mov	r6, r6, asl r2
	mov	r5, r5, asl r2
	sub	r2, r5, #32
	sub	r3, r6, #32
	cmp	r3, r1
	cmpls	r2, r1
	movhi	r1, #1
	movls	r1, #0
	bhi	.L1180
	ldr	r3, .L1182
	mov	r2, #20
	sub	r0, fp, #48
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #2856]
	str	r6, [fp, #-44]
	str	r5, [fp, #-40]
	ldr	r3, [r3, #28]
	str	r6, [fp, #-36]
	cmp	r3, #24
	str	r5, [fp, #-32]
	beq	.L1176
	ldrb	r3, [r4, #3036]	@ zero_extendqisi2
	strb	r3, [fp, #-47]
.L1178:
	sub	r1, fp, #48
	ldr	r0, [r4, #276]
	strb	r3, [fp, #-45]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L1181
	ldr	r1, [r4, #2856]
	sub	r3, fp, #52
	ldr	r0, [r4, #276]
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	bl	FSP_ConfigFrameBuf
.L1179:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1176:
	mov	r3, #1
	strb	r3, [fp, #-47]
	b	.L1178
.L1180:
	str	r5, [sp]
	mov	r3, r6
	ldr	r2, .L1182+4
	mov	r0, #0
	ldr	r1, .L1182+8
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1181:
	ldr	r2, .L1182+4
	mov	r0, #1
	ldr	r1, .L1182+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1179
.L1183:
	.align	2
.L1182:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+404
	.word	.LC97
	.word	.LC98
	UNWIND(.fnend)
	.size	HEVC_ArrangeMem, .-HEVC_ArrangeMem
	.align	2
	.global	HEVC_RemoveApcStore
	.type	HEVC_RemoveApcStore, %function
HEVC_RemoveApcStore:
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
	add	r3, r0, r1, lsl #2
	ldr	ip, [r3, #3208]
	ldr	r2, [ip, #32]
	cmp	r2, #1
	bhi	.L1187
	ldr	r3, [ip, #24]
	cmp	r3, #15
	bhi	.L1184
	mov	r1, #70
	mov	r4, #280
	mla	r1, r1, r2, r3
	mov	lr, #0
	mla	r2, r4, r2, r0
	mov	r4, #16
	add	r3, r2, r3
	add	r1, r0, r1, lsl #2
	add	r1, r1, #12288
	add	r3, r3, #13376
	add	r2, r2, #13120
	str	lr, [r1, #884]
	str	lr, [r1, #948]
	str	lr, [r1, #1012]
	str	lr, [r1, #1076]
	strb	lr, [r3, #52]
	ldr	r3, [ip, #20]
	add	r3, r3, #540
	add	r3, r3, #2
	str	lr, [r0, r3, asl #2]
	str	r4, [ip, #24]
	ldr	r3, [r2, #48]
	sub	r3, r3, #1
	str	r3, [r2, #48]
.L1184:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1187:
	str	r2, [sp]
	mov	r3, r1
	ldr	r2, .L1188
	mov	r0, #1
	ldr	r1, .L1188+4
	bl	dprint_vfmw
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1189:
	.align	2
.L1188:
	.word	.LANCHOR0+420
	.word	.LC99
	UNWIND(.fnend)
	.size	HEVC_RemoveApcStore, .-HEVC_RemoveApcStore
	.align	2
	.global	HEVC_RemoveUnusedApcStore
	.type	HEVC_RemoveUnusedApcStore, %function
HEVC_RemoveUnusedApcStore:
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
	ldr	r2, [r0, #3040]
	mov	r6, r0
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #3200
	mov	r4, #0
	add	r5, r5, #4
	b	.L1193
.L1192:
	add	r4, r4, #1
	cmp	r4, r2
	bcs	.L1196
.L1193:
	ldr	r3, [r5, #4]!
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1192
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_RemoveApcStore
	ldr	r2, [r6, #3040]
	add	r4, r4, #1
	cmp	r4, r2
	bcc	.L1193
.L1196:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveUnusedApcStore, .-HEVC_RemoveUnusedApcStore
	.align	2
	.global	HEVC_ApplyReferencePictureSet
	.type	HEVC_ApplyReferencePictureSet, %function
HEVC_ApplyReferencePictureSet:
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
	add	r4, r0, #4096
	ldr	r2, [r0, #2820]
	movw	lr, #5036
	ldr	r1, [r4, #748]
	movw	ip, #12668
	ldr	r3, [r0, #2816]
	mov	r9, r0
	mov	r0, #1
	mla	r2, lr, r1, r2
	ldr	r1, [r9, #3040]
	cmp	r1, #0
	ldr	r2, [r2, #32]
	mla	r3, ip, r2, r3
	ldr	r3, [r3, #116]
	mov	r3, r0, asl r3
	str	r3, [fp, #-48]
	beq	.L1197
	add	r7, r9, #3200
	add	r3, r9, #5760
	add	r3, r3, #12
	add	r7, r7, #4
	str	r3, [fp, #-52]
	mov	r8, #0
	b	.L1214
.L1200:
	add	r8, r8, #1
	cmp	r8, r1
	bcs	.L1197
.L1214:
	ldr	r0, [r7, #4]!
	ldr	r3, [r4, #744]
	ldr	r2, [r0, #32]
	cmp	r2, r3
	bne	.L1200
	ldr	r1, [r4, #1644]
	ldr	r3, [r4, #1648]
	ldr	r2, [r4, #1652]
	add	r3, r3, r1
	cmp	r3, r2
	mov	r6, r3
	ldrcs	ip, [r0, #8]
	movcs	r1, #0
	bcs	.L1202
	add	r5, r3, #1456
	ldr	r3, [r0, #8]
	add	r5, r5, #4
	mov	r1, #0
	mov	r10, #1
	mov	r2, r3
	mov	r3, r9
	add	r5, r9, r5, lsl #2
	mov	r9, r8
	mov	r8, r3
.L1208:
	ldr	ip, [r5, #-944]
	cmp	ip, #0
	ldr	ip, [r0, #60]
	beq	.L1203
	cmp	ip, #0
	beq	.L1204
	ldr	ip, [r5]
	cmp	ip, r2
	beq	.L1237
.L1204:
	cmp	r1, #0
	bne	.L1219
	ldr	r1, [r5]
	mov	lr, r2
.L1216:
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	rsb	r1, r1, lr
	clz	r1, r1
	cmp	ip, #0
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	bne	.L1238
.L1219:
	mov	ip, r2
.L1207:
	ldr	lr, [r4, #1652]
	add	r6, r6, #1
	add	r5, r5, #4
	mov	r2, ip
	cmp	r6, lr
	bcc	.L1208
	mov	r3, r8
	ldr	r2, [r4, #1644]
	mov	r8, r9
	mov	r9, r3
	ldr	r3, [r4, #1648]
	add	r3, r3, r2
.L1202:
	cmp	r3, #0
	ldr	lr, [r4, #724]
	ldrne	r6, [fp, #-52]
	movne	r5, #0
	movne	r10, #1
	beq	.L1210
.L1212:
	ldr	r3, [r0, #60]
	add	r5, r5, #1
	cmp	r3, #0
	bne	.L1211
	ldr	r2, [r6]
	add	r2, lr, r2
	cmp	r2, ip
	beq	.L1239
.L1211:
	ldr	r3, [r4, #1648]
	add	r6, r6, #4
	ldr	r2, [r4, #1644]
	add	r3, r3, r2
	cmp	r5, r3
	bcc	.L1212
.L1210:
	eor	r1, r1, #1
	cmp	ip, lr
	moveq	ip, #0
	andne	ip, r1, #1
	cmp	ip, #0
	beq	.L1235
	mov	r3, #0
	strb	r3, [r0, #1]
	ldr	r3, [r7]
	mov	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7]
	str	r2, [r3, #72]
	ldr	r3, [r7]
	ldr	r2, [r3, #52]
	cmp	r2, #1
	beq	.L1235
	ldr	r1, [r3, #28]
	mov	r2, #0
	ldr	r0, [r9, #276]
	bl	FSP_SetRef
.L1235:
	ldr	r1, [r9, #3040]
	add	r8, r8, #1
	cmp	r8, r1
	bcc	.L1214
.L1197:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1203:
	cmp	ip, #0
	beq	.L1206
	ldr	lr, [r5]
	ldr	r3, [fp, #-48]
	eor	lr, lr, r2
	sub	ip, r3, #1
	ands	ip, lr, ip
	beq	.L1240
.L1206:
	cmp	r1, #0
	bne	.L1219
	ldr	r3, [fp, #-48]
	ldr	ip, [r5]
	sub	r1, r3, #1
	and	lr, r2, r1
	and	r1, r1, ip
	b	.L1216
.L1238:
	strb	r10, [r0, #1]
	mov	r3, #0
	ldr	r1, [r7]
	mov	r2, #1
	str	r10, [r1, #60]
	ldr	r1, [r7]
	str	r3, [r1, #72]
	ldr	r1, [r7]
	str	r10, [r1, #48]
	ldr	r1, [r7]
	ldr	r0, [r8, #276]
	ldr	r1, [r1, #28]
	bl	FSP_SetRef
	ldr	r0, [r7]
	mov	r1, #1
	ldr	ip, [r0, #8]
	b	.L1207
.L1240:
	strb	r10, [r0, #1]
	mov	r2, #1
	ldr	r1, [r7]
	str	ip, [r1, #72]
.L1236:
	ldr	r1, [r7]
	str	r10, [r1, #48]
	ldr	r1, [r7]
	ldr	r0, [r8, #276]
	ldr	r1, [r1, #28]
	bl	FSP_SetRef
	ldr	r0, [r7]
	mov	r1, #1
	ldr	ip, [r0, #8]
	b	.L1207
.L1239:
	strb	r10, [r0, #1]
	mov	r2, #1
	ldr	r1, [r7]
	str	r3, [r1, #72]
	ldr	r3, [r7]
	str	r10, [r3, #48]
	ldr	r3, [r7]
	ldr	r0, [r9, #276]
	ldr	r1, [r3, #28]
	bl	FSP_SetRef
	ldr	r0, [r7]
	ldr	lr, [r4, #724]
	mov	r1, #1
	ldr	ip, [r0, #8]
	b	.L1211
.L1237:
	strb	r10, [r0, #1]
	mov	r3, #0
	ldr	r1, [r7]
	mov	r2, #1
	str	r3, [r1, #72]
	b	.L1236
	UNWIND(.fnend)
	.size	HEVC_ApplyReferencePictureSet, .-HEVC_ApplyReferencePictureSet
	.align	2
	.global	HEVC_CheckThatAllRefPicsAreAvailable
	.type	HEVC_CheckThatAllRefPicsAreAvailable, %function
HEVC_CheckThatAllRefPicsAreAvailable:
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
	add	r3, r0, #4096
	ldr	r3, [r3, #740]
	sub	r3, r3, #19
	cmp	r3, #2
	bls	.L1242
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_CheckThatAllRefPicsAreAvailable.part.15
.L1242:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_CheckThatAllRefPicsAreAvailable, .-HEVC_CheckThatAllRefPicsAreAvailable
	.align	2
	.global	HEVC_SetFrmRepeatCount
	.type	HEVC_SetFrmRepeatCount, %function
HEVC_SetFrmRepeatCount:
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
	ldr	r3, [r0, #2856]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_SetFrmRepeatCount.part.16
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount, .-HEVC_SetFrmRepeatCount
	.align	2
	.global	HEVC_GetFreeFrameStoreNum
	.type	HEVC_GetFreeFrameStoreNum, %function
HEVC_GetFreeFrameStoreNum:
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
	add	r1, r0, #13696
	add	r4, r0, #27904
	add	r1, r1, #32
	add	r4, r4, #224
	mov	r5, #0
.L1250:
	ldr	r3, [r1, #48]
	cmp	r3, #0
	bne	.L1246
	cmp	r1, #0
	beq	.L1247
	ldr	lr, [r0, #3040]
	cmp	lr, #0
	beq	.L1247
	ldr	r2, [r0, #3208]
	cmp	r2, r1
	beq	.L1246
	add	r2, r0, #3200
	add	r2, r2, #8
	b	.L1248
.L1249:
	ldr	ip, [r2, #4]!
	cmp	ip, r1
	beq	.L1246
.L1248:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L1249
.L1247:
	add	r5, r5, #1
.L1246:
	add	r1, r1, #720
	cmp	r1, r4
	bne	.L1250
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetFreeFrameStoreNum, .-HEVC_GetFreeFrameStoreNum
	.align	2
	.global	HEVC_UpdateReflist
	.type	HEVC_UpdateReflist, %function
HEVC_UpdateReflist:
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
	add	r5, r0, #4096
	mov	r7, r0
	ldr	r1, [r5, #1644]
	cmp	r1, #0
	beq	.L1280
	add	r10, r0, #5696
	add	r9, r0, #5760
	mov	r8, #0
	add	r10, r10, #55
	add	r9, r9, #12
	mov	r6, r8
.L1266:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1262
	ldr	lr, [r7, #3040]
	ldr	ip, [r5, #724]
	ldr	r3, [r9]
	cmp	lr, #0
	add	ip, ip, r3
	beq	.L1262
	add	r1, r7, #3200
	mov	r3, #0
	add	r1, r1, #4
	b	.L1265
.L1263:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L1262
.L1265:
	ldr	r2, [r1, #4]!
	ldr	r0, [r2, #8]
	cmp	r0, ip
	bne	.L1263
	ldr	r4, [r5, #744]
	ldr	r0, [r2, #32]
	cmp	r4, r0
	bne	.L1263
	add	r4, r7, r3, lsl #2
	mov	r3, #1
	strb	r3, [r2, #1]
	ldr	r3, [r4, #3208]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1306
.L1264:
	mov	r2, #1
	str	r2, [r3, #64]
	ldr	r2, [r4, #3208]
	mov	r1, #0
	add	r3, r7, r8, lsl #2
	add	r8, r8, #1
	str	r1, [r2, #60]
	ldr	r2, [r4, #3208]
	str	r2, [r3, #3276]
.L1262:
	ldr	r1, [r5, #1644]
	add	r6, r6, #1
	add	r9, r9, #4
	cmp	r1, r6
	bhi	.L1266
.L1261:
	ldr	r2, [r7, #3036]
	str	r8, [r7, #3052]
	cmp	r2, r8
	bls	.L1271
	add	r3, r8, #816
	mov	r0, #0
	add	r3, r3, #2
	add	r3, r7, r3, lsl #2
.L1270:
	add	r8, r8, #1
	str	r0, [r3, #4]!
	cmp	r8, r2
	bne	.L1270
.L1271:
	ldr	r3, [r5, #1648]
	add	r4, r1, r3
	cmp	r4, r6
	movls	r8, #0
	bls	.L1269
	add	r9, r6, #1440
	add	r10, r6, #5696
	add	r9, r9, #3
	add	r10, r10, #55
	add	r10, r7, r10
	mov	r8, #0
	add	r9, r7, r9, lsl #2
	str	r8, [fp, #-48]
.L1276:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1272
	ldr	ip, [r7, #3040]
	ldr	r0, [r5, #724]
	ldr	r3, [r9]
	cmp	ip, #0
	add	r0, r0, r3
	beq	.L1272
	add	r1, r7, #3200
	mov	r3, #0
	add	r1, r1, #4
	b	.L1275
.L1273:
	add	r3, r3, #1
	cmp	r3, ip
	beq	.L1272
.L1275:
	ldr	r2, [r1, #4]!
	ldr	lr, [r2, #8]
	cmp	lr, r0
	bne	.L1273
	ldr	r8, [r5, #744]
	ldr	lr, [r2, #32]
	cmp	r8, lr
	bne	.L1273
	add	r8, r7, r3, lsl #2
	mov	r3, #1
	strb	r3, [r2, #1]
	ldr	r3, [r8, #3208]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1307
.L1274:
	ldr	r1, [fp, #-48]
	mov	r2, #1
	str	r2, [r3, #64]
	ldr	r2, [r8, #3208]
	add	r3, r7, r1, lsl #2
	add	r1, r1, #1
	str	r1, [fp, #-48]
	mov	r1, #0
	str	r1, [r2, #60]
	ldr	r2, [r8, #3208]
	str	r2, [r3, #3344]
.L1272:
	add	r6, r6, #1
	add	r9, r9, #4
	cmp	r4, r6
	bhi	.L1276
	ldr	r8, [fp, #-48]
	ldr	r2, [r7, #3036]
.L1269:
	cmp	r2, r8
	str	r8, [r7, #3056]
	bls	.L1260
	add	r1, r8, #832
	mov	r3, #0
	add	r1, r1, #3
	add	r7, r7, r1, lsl #2
.L1278:
	add	r8, r8, #1
	str	r3, [r7, #4]!
	cmp	r8, r2
	bne	.L1278
.L1260:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1306:
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r7, #276]
	bl	FSP_SetRef
	ldr	r3, [r4, #3208]
	b	.L1264
.L1307:
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r7, #276]
	bl	FSP_SetRef
	ldr	r3, [r8, #3208]
	b	.L1274
.L1280:
	mov	r8, r1
	mov	r6, r1
	b	.L1261
	UNWIND(.fnend)
	.size	HEVC_UpdateReflist, .-HEVC_UpdateReflist
	.align	2
	.global	HEVC_UpdateLTReflist
	.type	HEVC_UpdateLTReflist, %function
HEVC_UpdateLTReflist:
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
	add	r5, r0, #4096
	ldr	r2, [r0, #2820]
	mov	r7, r0
	ldr	r3, [r5, #748]
	movw	r0, #5036
	ldr	ip, [r7, #2816]
	movw	lr, #12668
	mov	r1, #1
	mla	r0, r0, r3, r2
	ldr	r3, [r5, #1644]
	ldr	r2, [r5, #1648]
	add	r2, r3, r2
	ldr	r3, [r5, #1652]
	sub	r2, r2, #1
	ldr	r0, [r0, #32]
	sub	r10, r3, #1
	cmp	r10, r2
	mla	r2, lr, r0, ip
	ldr	r2, [r2, #116]
	mov	r2, r1, asl r2
	ble	.L1319
	add	r9, r3, #1456
	add	r3, r3, #5696
	add	r9, r9, #3
	add	r3, r3, #56
	add	r3, r7, r3
	sub	r4, r2, #1
	add	r9, r7, r9, lsl #2
	mov	r8, #0
	str	r8, [fp, #-52]
	mov	r8, r3
	str	r1, [fp, #-56]
.L1315:
	ldrb	r3, [r8, #-1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1310
	ldrb	r0, [r9, #-944]	@ zero_extendqisi2
	ldr	ip, [r9]
	ldr	lr, [r7, #3040]
	cmp	r0, #0
	andeq	ip, ip, r4
	cmp	lr, #0
	ble	.L1310
	add	r1, r7, #3200
	mov	r3, #0
	add	r1, r1, #4
	str	r7, [fp, #-48]
	b	.L1314
.L1313:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L1326
.L1314:
	ldr	r2, [r1, #4]!
	cmp	r0, #0
	ldr	r6, [r2, #8]
	andeq	r6, r6, r4
	cmp	ip, r6
	bne	.L1313
	ldr	r6, [r5, #744]
	ldr	r7, [r2, #32]
	cmp	r7, r6
	bne	.L1313
	ldr	r7, [fp, #-48]
	mov	ip, #0
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-56]
	add	r3, r7, r3, lsl #2
	strb	r0, [r2, #1]
	add	r2, r7, r1, lsl #2
	add	r1, r1, #1
	str	r1, [fp, #-52]
	ldr	r1, [r3, #3208]
	str	ip, [r1, #64]
	ldr	r1, [r3, #3208]
	str	r0, [r1, #60]
	ldr	r3, [r3, #3208]
	str	r3, [r2, #3412]
.L1310:
	ldr	r3, [r5, #1644]
	sub	r10, r10, #1
	ldr	r2, [r5, #1648]
	sub	r9, r9, #4
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r10
	blt	.L1315
	ldr	r8, [fp, #-52]
	mov	r3, r8
.L1309:
	ldr	r2, [r7, #3036]
	str	r3, [r7, #3048]
	cmp	r2, r8
	ble	.L1308
	add	r3, r8, #852
	mov	r1, #0
	add	r3, r7, r3, lsl #2
.L1317:
	add	r8, r8, #1
	str	r1, [r3, #4]!
	cmp	r8, r2
	bne	.L1317
.L1308:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1326:
	ldr	r7, [fp, #-48]
	b	.L1310
.L1319:
	mov	r3, #0
	mov	r8, r3
	b	.L1309
	UNWIND(.fnend)
	.size	HEVC_UpdateLTReflist, .-HEVC_UpdateLTReflist
	.align	2
	.global	HEVC_GetAPC
	.type	HEVC_GetAPC, %function
HEVC_GetAPC:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L1345
	add	r2, r0, #4096
	mov	r3, #280
	ldr	r7, [r2, #16]
	mul	r3, r3, r7
	add	r2, r0, r3
	add	r1, r2, #13120
	add	r1, r1, #40
	ldr	r1, [r1, #4]
	cmp	r1, #0
	beq	.L1330
	add	r2, r2, #13120
	ldr	r4, [r2, #52]
	cmp	r4, #0
	addne	r3, r3, #13120
	addne	r3, r3, #52
	movne	r4, #0
	addne	r3, r0, r3
	bne	.L1333
	b	.L1331
.L1336:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1331
.L1333:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L1336
.L1330:
	ldr	r1, .L1346
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L1343:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1331:
	ldr	r1, [r5, #28]
	ldr	r0, [r6, #276]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	beq	.L1334
	ldr	r3, [ip, #28]
	cmp	r3, #0
	beq	.L1334
	mov	r2, #70
	mov	r3, #280
	mla	r2, r2, r7, r4
	mov	lr, #1
	mla	r7, r3, r7, r6
	ldr	r1, .L1346+4
	mov	r3, r4
	mov	r0, #13
	add	r6, r6, r2, lsl #2
	add	r2, r7, #13120
	add	r6, r6, #12288
	add	r7, r7, r4
	str	lr, [r6, #884]
	ldr	ip, [ip, #28]
	ldr	ip, [ip, #4]
	str	ip, [r6, #948]
	ldr	ip, [r5, #8]
	str	ip, [r6, #1012]
	ldr	ip, [r2, #48]
	add	ip, ip, lr
	str	ip, [r2, #48]
	ldr	r2, [r5, #228]
	bl	dprint_vfmw
	ldr	r1, [r5, #32]
	add	r3, r7, #13376
	mov	r2, #0
	str	r4, [r5, #24]
	mov	r0, r2
	str	r1, [r6, #1076]
	strb	r2, [r3, #52]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1334:
	ldrb	r1, [r5, #1]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #8]
	stmia	sp, {r1, ip}
	str	r0, [sp, #8]
	ldr	r1, .L1346+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1343
.L1345:
	mov	r0, r5
	movw	r3, #11694
	ldr	r2, .L1346+12
	ldr	r1, .L1346+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1343
.L1347:
	.align	2
.L1346:
	.word	.LC101
	.word	.LC100
	.word	.LC4
	.word	.LC2
	.word	.LC3
	UNWIND(.fnend)
	.size	HEVC_GetAPC, .-HEVC_GetAPC
	.align	2
	.global	HEVC_CheckFrameStore
	.type	HEVC_CheckFrameStore, %function
HEVC_CheckFrameStore:
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
	subs	r4, r1, #0
	beq	.L1358
	ldr	r0, [r0, #276]
	ldr	r1, [r4, #28]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1350
	ldrsb	r2, [r0, #1]
	cmp	r2, #3
	cmpne	r2, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L1369
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L1355
	ldr	r2, [r4, #48]
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1354
	cmp	r3, #1
	beq	.L1354
.L1366:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1369:
	ldr	r3, [r4, #28]
	mov	r0, #13
	str	r2, [sp]
	ldr	r1, .L1370
	ldr	r2, .L1370+4
	bl	dprint_vfmw
.L1352:
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L1355
	ldr	r3, [r4, #8]
	mov	r0, #1
	ldr	r2, .L1370+4
	ldr	r1, .L1370+8
	bl	dprint_vfmw
	mvn	r0, #2
	b	.L1366
.L1350:
	ldr	ip, [r4, #28]
	mov	r2, r4
	ldr	r3, [r4, #8]
	mov	r0, #1
	ldr	r1, .L1370+12
	str	ip, [sp, #4]
	ldr	ip, [r4, #52]
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1352
.L1354:
	str	r3, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L1370+4
	ldr	r1, .L1370+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1366
.L1358:
	mvn	r0, #0
	b	.L1366
.L1355:
	mov	r2, #1
	mov	r3, #2
	strb	r2, [r4, #2]
	mvn	r0, #2
	str	r3, [r4, #52]
	b	.L1366
.L1371:
	.align	2
.L1370:
	.word	.LC102
	.word	.LANCHOR0+440
	.word	.LC104
	.word	.LC103
	.word	.LC105
	UNWIND(.fnend)
	.size	HEVC_CheckFrameStore, .-HEVC_CheckFrameStore
	.align	2
	.global	HEVC_GetImagePara
	.type	HEVC_GetImagePara, %function
HEVC_GetImagePara:
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
	add	r8, r1, #672
	mov	r4, r1
	mvn	r7, #0
	ldrd	r2, [r8, #-8]
	mvn	r6, #0
	ldr	r1, [r1, #12]
	mov	r5, r0
	cmp	r3, r7
	cmpeq	r2, r6
	str	r1, [fp, #-52]
	beq	.L1374
	ldr	ip, [r0, #3040]
	cmp	ip, #0
	beq	.L1374
	add	r10, r0, #3200
	mvn	r3, #0
	mvn	r6, #1
	mvn	r7, #0
	add	r10, r10, #4
	str	r3, [fp, #-48]
	mov	r9, #0
	b	.L1377
.L1411:
	ldr	r1, [r10]
	ldr	ip, [r5, #3040]
	add	r1, r1, #672
	ldrd	r0, [r1, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r9, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L1376:
	add	r9, r9, #1
	cmp	r9, ip
	bcs	.L1414
.L1377:
	ldr	r1, [r10, #4]!
	cmp	r1, #0
	beq	.L1376
	ldr	r1, [r1, #28]
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1413
	ldrsb	r1, [r0, #1]
	cmp	r1, #3
	cmpne	r1, #0
	bne	.L1411
.L1413:
	ldr	ip, [r5, #3040]
	add	r9, r9, #1
	cmp	r9, ip
	bcc	.L1377
.L1414:
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L1374
	ldrd	r2, [r8, #-8]
	cmp	r3, r7
	cmpeq	r2, r6
	bhi	.L1415
.L1374:
	ldrb	r3, [r4, #145]	@ zero_extendqisi2
	ldrb	r2, [r4, #144]	@ zero_extendqisi2
	and	r3, r3, #195
	bfc	r3, #0, #2
	bfc	r2, #0, #2
	strb	r3, [r4, #145]
	strb	r2, [r4, #144]
	ldr	r3, [r5, #144]
	str	r3, [r4, #188]
	ldr	r3, [r5, #2836]
	ldrh	r3, [r3, #124]
	cmp	r3, #1
	moveq	r2, #0
	beq	.L1378
	movw	r2, #257
	cmp	r3, r2
	movne	r2, #1
	bne	.L1378
	ldr	r2, [r5, #3492]
	subs	r2, r2, #1
	movne	r2, #1
.L1378:
	ldr	r3, [r5, #2840]
	ldrb	r3, [r3, #2066]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r1, #3
	beq	.L1379
	ldr	r3, [r4, #40]
	cmp	r3, #1
	cmpne	r3, #11
	moveq	r1, #1
	bne	.L1416
.L1380:
	ldr	r2, [r4, #44]
	clz	r2, r2
	mov	r2, r2, lsr #5
.L1379:
	ldrb	r3, [r4, #145]	@ zero_extendqisi2
	mov	ip, #2
	ldr	r0, [r4, #48]
	bfi	r3, ip, #4, #2
	ldr	lr, [fp, #-52]
	cmp	r0, #0
	bfi	r3, r1, #2, #2
	ldrb	r0, [r4, #144]	@ zero_extendqisi2
	bfi	r3, r2, #0, #2
	ldrb	ip, [r4, #4]	@ zero_extendqisi2
	strb	r3, [r4, #145]
	bfi	r0, lr, #0, #2
	ldrne	r3, [r4, #16]
	ldrb	r1, [r4, #146]	@ zero_extendqisi2
	ldrb	lr, [r4, #3]	@ zero_extendqisi2
	strne	r3, [r4, #232]
	strb	r0, [r4, #144]
	bfi	r1, lr, #1, #1
	str	ip, [r4, #200]
	strb	r1, [r4, #146]
	ldr	r3, [r5, #2856]
	ldr	r1, [r4, #28]
	ldr	r3, [r3, #604]
	str	r3, [r4, #204]
	ldr	r3, [r5, #2856]
	ldr	r3, [r3, #608]
	str	r3, [r4, #208]
	ldr	r3, [r5, #2856]
	ldr	r3, [r3, #612]
	str	r3, [r4, #212]
	ldr	r0, [r5, #276]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L1372
	ldr	r3, .L1417
	mov	r2, #640
	add	r1, r4, #80
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #16
	str	r3, [r5, #296]
	mov	r3, #1
	ldr	r2, [r4, #56]
	strb	r3, [r5, #291]
	cmp	r2, #0
	strb	r3, [r5, #289]
	moveq	r3, #0
	movne	r3, #4
	strb	r3, [r5, #284]
	ldr	r3, [r4, #68]
	str	r3, [r5, #236]
.L1372:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1415:
	ldr	r0, [r5, #276]
	strd	r6, [sp]
	bl	IsPtsRewind
	cmp	r0, #0
	bne	.L1374
	ldrd	r2, [r8, #-8]
	mov	r0, #29
	ldr	r1, .L1417+4
	strd	r6, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	add	r10, r5, r3, lsl #2
	ldrd	r2, [r8, #-8]
	ldr	r1, [r10, #3208]
	add	r1, r1, #672
	strd	r2, [r1, #-8]
	strd	r6, [r8, #-8]
	b	.L1374
.L1416:
	bic	r3, r3, #8
	cmp	r3, #2
	moveq	r1, #2
	movne	r1, #3
	b	.L1380
.L1418:
	.align	2
.L1417:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC106
	UNWIND(.fnend)
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
	.align	2
	.global	HEVC_CheckOutputImage
	.type	HEVC_CheckOutputImage, %function
HEVC_CheckOutputImage:
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
	cmp	r1, #19
	bhi	.L1421
	mov	r3, #720
	mla	r1, r3, r1, r0
	add	r1, r1, #13696
	ldrb	r0, [r1, #33]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1421:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_CheckOutputImage, .-HEVC_CheckOutputImage
	.align	2
	.global	HEVC_DECRecycleImage
	.type	HEVC_DECRecycleImage, %function
HEVC_DECRecycleImage:
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
	mov	r8, r0
	ldr	r0, [r0, #276]
	mov	r9, r1
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1427
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	addne	r4, r0, #576
	addne	r5, r0, #608
	movne	r6, #0
	movne	r7, #0
	beq	.L1432
.L1426:
	ldr	r1, [r4, #8]!
	cmp	r1, #0
	beq	.L1425
	ldr	r0, [r8, #276]
	bl	FreeUsdByDec
	strd	r6, [r4]
.L1425:
	cmp	r4, r5
	bne	.L1426
	ldr	r0, [r8, #276]
	mov	r1, r9
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1432:
	ldr	r1, .L1433
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1427:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1434:
	.align	2
.L1433:
	.word	.LC107
	UNWIND(.fnend)
	.size	HEVC_DECRecycleImage, .-HEVC_DECRecycleImage
	.align	2
	.global	HEVC_GetSLHDR1MasteringDisplayInfo
	.type	HEVC_GetSLHDR1MasteringDisplayInfo, %function
HEVC_GetSLHDR1MasteringDisplayInfo:
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
	ldr	r3, [r1, #572]
	movw	r2, #14999
	cmp	r3, r2
	bhi	.L1439
	sub	r2, r3, #8448
	movw	ip, #4749
	sub	r2, r2, #52
	cmp	r2, ip
	movls	r3, #1
	strlsb	r3, [r0, #3]
	bls	.L1437
	sub	r3, r3, #13248
	movw	r2, #1749
	sub	r3, r3, #2
	cmp	r3, r2
	bhi	.L1439
	mov	r3, #2
	strb	r3, [r0, #3]
.L1437:
	ldr	r3, [r1, #604]
	movw	r2, #56963
	movt	r2, 17179
	mov	ip, #50
	add	r3, r3, #249856
	movw	lr, #10000
	add	r3, r3, #144
	movw	r4, #2063
	movt	r4, 1526
	umull	r2, r3, r3, r2
	mov	r3, r3, lsr #17
	mul	r3, ip, r3
	cmp	r3, lr
	movcs	r3, lr
	strh	r3, [r0, #4]	@ movhi
	ldr	r3, [r1, #608]
	cmp	r3, r4
	movwls	r2, #5977
	movtls	r2, 53687
	umullls	r2, r3, r3, r2
	ubfxls	lr, r3, #13, #16
	strh	lr, [r0, #6]	@ movhi
	ldmfd	sp, {r4, fp, sp, pc}
.L1439:
	mov	r3, #0
	strb	r3, [r0, #3]
	b	.L1437
	UNWIND(.fnend)
	.size	HEVC_GetSLHDR1MasteringDisplayInfo, .-HEVC_GetSLHDR1MasteringDisplayInfo
	.align	2
	.global	HEVC_PrintSLHDR1Info
	.type	HEVC_PrintSLHDR1Info, %function
HEVC_PrintSLHDR1Info:
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
	ldr	r1, .L1461
	mov	r4, r0
	ldrb	r2, [r0]	@ zero_extendqisi2
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldr	r1, .L1461+4
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r1, .L1461+8
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	ldr	r1, .L1461+12
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r2, [r4, #4]
	ldr	r1, .L1461+16
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r2, [r4, #6]
	ldr	r1, .L1461+20
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ldr	r1, .L1461+24
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #9]	@ zero_extendqisi2
	ldr	r1, .L1461+28
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	mov	r0, #32
	cmp	r5, #0
	bne	.L1443
	ldr	r1, .L1461+32
	bl	dprint_vfmw
	ldrb	r2, [r4, #11]	@ zero_extendqisi2
	ldr	r1, .L1461+36
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	ldr	r1, .L1461+40
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #13]	@ zero_extendqisi2
	ldr	r1, .L1461+44
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #14]	@ zero_extendqisi2
	ldr	r1, .L1461+48
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #15]	@ zero_extendqisi2
	ldr	r1, .L1461+52
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #15
	addne	r6, r4, #26
	beq	.L1448
.L1447:
	mov	r3, r5
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	ldr	r1, .L1461+56
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1461+60
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1447
.L1448:
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1461+64
	bl	dprint_vfmw
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #38
	addne	r6, r4, #45
	movne	r5, #0
	beq	.L1449
.L1450:
	mov	r3, r5
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	ldr	r1, .L1461+68
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1461+72
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1450
.L1449:
	movw	r2, #290
	ldr	r1, .L1461+76
	mov	r0, #32
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1443:
	ldr	r1, .L1461+80
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #10
	addne	r6, r4, #78
	movne	r5, #0
	beq	.L1455
.L1454:
	mov	r2, r5
	ldrh	r3, [r7, #2]!
	ldr	r1, .L1461+84
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r3, [r6, #2]!
	mov	r2, r5
	ldr	r1, .L1461+88
	mov	r0, #32
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1454
.L1455:
	ldrb	r2, [r4, #148]	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1461+92
	bl	dprint_vfmw
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #148
	addne	r6, r4, #216
	movne	r5, #0
	beq	.L1453
.L1456:
	mov	r3, r5
	ldrh	r2, [r7, #2]!
	ldr	r1, .L1461+96
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrh	r2, [r6, #2]!
	mov	r0, #32
	ldr	r1, .L1461+100
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1456
.L1453:
	movw	r3, #286
	ldr	r1, .L1461+104
	ldrh	r2, [r4, r3]
	add	r4, r4, #288
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r1, .L1461+108
	ldrh	r2, [r4]
	mov	r0, #32
	bl	dprint_vfmw
	b	.L1449
.L1462:
	.align	2
.L1461:
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
	.word	.LC121
	.word	.LC123
	.word	.LC124
	.word	.LC122
	.word	.LC125
	.word	.LC126
	.word	.LC135
	.word	.LC127
	.word	.LC129
	.word	.LC130
	.word	.LC128
	.word	.LC133
	.word	.LC134
	.word	.LC131
	.word	.LC132
	UNWIND(.fnend)
	.size	HEVC_PrintSLHDR1Info, .-HEVC_PrintSLHDR1Info
	.align	2
	.global	HEVC_GetSLHDR1Info
	.type	HEVC_GetSLHDR1Info, %function
HEVC_GetSLHDR1Info:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 296
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #312)
	sub	sp, sp, #312
	mov	r4, r2
	mov	r6, r1
	movw	r2, #290
	mov	r1, #0
	mov	r5, r0
	sub	r0, fp, #320
	bl	memset
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	ldrb	r2, [r4, #56]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r1, [r4, #568]	@ zero_extendqisi2
	beq	.L1503
	cmp	r2, #0
	bne	.L1505
.L1503:
	ldrb	ip, [r4, #59]	@ zero_extendqisi2
	ldrb	r0, [r4, #128]	@ zero_extendqisi2
.L1465:
	str	r0, [sp, #12]
	mov	r0, #22
	str	r1, [sp, #4]
	str	r2, [sp]
	str	ip, [sp, #8]
	ldr	r2, .L1508
	ldr	r1, .L1508+4
	bl	dprint_vfmw
	mov	r3, #0
	strb	r3, [r5, #458]
.L1463:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1505:
	cmp	r1, #0
	beq	.L1503
	ldrb	r0, [r4, #59]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1468
	ldrb	r0, [r4, #128]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1506
.L1468:
	mov	r3, #1
	strb	r3, [r5, #458]
	ldr	r0, [r6, #24]
	ldrb	r1, [r4, #57]	@ zero_extendqisi2
	ldrb	r2, [r4, #58]	@ zero_extendqisi2
	cmp	r0, #9
	strb	r1, [fp, #-320]
	strb	r2, [fp, #-319]
	bne	.L1470
	ldr	r2, [r6, #32]
	cmp	r2, #9
	streqb	r3, [fp, #-312]
.L1470:
	ldrb	r3, [r4, #60]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1471
	ldrb	r2, [r4, #129]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1471
	cmp	r2, #9
	cmpne	r3, #9
	ldrneb	r3, [fp, #-312]	@ zero_extendqisi2
	moveq	r3, #1
	strb	r3, [fp, #-318]
.L1471:
	mov	r1, r4
	sub	r0, fp, #320
	bl	HEVC_GetSLHDR1MasteringDisplayInfo
	ldrb	r3, [fp, #-318]	@ zero_extendqisi2
	ldrb	r2, [fp, #-312]	@ zero_extendqisi2
	cmp	r2, r3
	ldreqb	r3, [fp, #-317]	@ zero_extendqisi2
	movne	r3, #0
	strb	r3, [fp, #-311]
	ldrb	r3, [fp, #-319]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1475
	ldrb	r2, [r4, #61]	@ zero_extendqisi2
	ldrb	r7, [r4, #66]	@ zero_extendqisi2
	ldrb	ip, [r4, #62]	@ zero_extendqisi2
	ldrb	r0, [r4, #63]	@ zero_extendqisi2
	cmp	r7, #0
	ldrb	r1, [r4, #64]	@ zero_extendqisi2
	strb	r2, [fp, #-310]
	ldrb	r2, [r4, #65]	@ zero_extendqisi2
	strb	r7, [fp, #-305]
	strb	ip, [fp, #-309]
	strb	r0, [fp, #-308]
	strb	r1, [fp, #-307]
	strb	r2, [fp, #-306]
	beq	.L1480
	sub	r2, fp, #320
	add	ip, r4, #66
	add	r0, r2, #15
	add	r1, r4, #81
	add	r2, r2, #26
.L1479:
	add	r3, r3, #1
	ldrb	r6, [ip, #1]!	@ zero_extendqisi2
	ldrb	lr, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, r7
	strb	r6, [r0, #1]!
	strb	lr, [r2, #1]!
	bne	.L1479
.L1480:
	ldrb	r6, [r4, #97]	@ zero_extendqisi2
	cmp	r6, #0
	strb	r6, [fp, #-282]
	beq	.L1478
	sub	r1, fp, #280
	sub	r2, fp, #272
	add	r0, r4, #97
	sub	r1, r1, #2
	add	r4, r4, #112
	sub	r2, r2, #3
	mov	r3, #0
.L1483:
	add	r3, r3, #1
	ldrb	lr, [r0, #1]!	@ zero_extendqisi2
	ldrb	ip, [r4, #1]!	@ zero_extendqisi2
	cmp	r3, r6
	strb	lr, [r1, #1]!
	strb	ip, [r2, #1]!
	bne	.L1483
.L1478:
	ldr	r3, [r5, #464]
	cmp	r3, #0
	bne	.L1507
	ldr	r2, .L1508
	mov	r0, #1
	ldr	r1, .L1508+8
	bl	dprint_vfmw
	b	.L1463
.L1475:
	ldrb	r7, [r4, #168]	@ zero_extendqisi2
	ldr	r2, [r4, #136]
	add	r7, r7, #1
	ldr	r3, [r4, #140]
	uxtb	r7, r7
	strh	r2, [fp, #-34]	@ movhi
	cmp	r7, #0
	strb	r7, [fp, #-310]
	strh	r3, [fp, #-32]	@ movhi
	beq	.L1487
	sub	r3, fp, #320
	add	ip, r4, #170
	add	r1, r4, #368
	sub	r2, fp, #242
	add	r0, r3, #10
	mov	r3, #0
.L1486:
	add	r3, r3, #1
	ldrh	r6, [ip, #2]!
	ldrh	lr, [r1, #2]!
	cmp	r3, r7
	strh	r6, [r0, #2]!	@ movhi
	strh	lr, [r2, #2]!	@ movhi
	bcc	.L1486
.L1487:
	ldrb	r6, [r4, #169]	@ zero_extendqisi2
	add	r6, r6, #1
	uxtb	r6, r6
	strb	r6, [fp, #-172]
	cmp	r6, #0
	beq	.L1478
	add	r2, r4, #432
	sub	r0, fp, #172
	add	r4, r4, #236
	add	r2, r2, #2
	sub	r1, fp, #104
	mov	r3, #0
.L1488:
	add	r3, r3, #1
	ldrh	lr, [r4, #2]!
	ldrh	ip, [r2, #2]!
	cmp	r3, r6
	strh	lr, [r0, #2]!	@ movhi
	strh	ip, [r1, #2]!	@ movhi
	bcc	.L1488
	b	.L1478
.L1507:
	ldr	r3, .L1508+12
	sub	r1, fp, #320
	movw	r2, #290
	ldr	r0, [r5, #472]
	ldr	r3, [r3, #52]
	blx	r3
	movw	r3, #290
	str	r3, [r5, #460]
	b	.L1463
.L1506:
	mov	ip, r0
	b	.L1465
.L1509:
	.align	2
.L1508:
	.word	.LANCHOR0+464
	.word	.LC136
	.word	.LC137
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_GetSLHDR1Info, .-HEVC_GetSLHDR1Info
	.align	2
	.global	HEVC_ConvertHDRInfo
	.type	HEVC_ConvertHDRInfo, %function
HEVC_ConvertHDRInfo:
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
	ldrb	r4, [r1]	@ zero_extendqisi2
	mov	r3, r0
	mov	r0, r2
	add	lr, r3, #484
	add	lr, lr, #2
	mov	ip, r2
	strb	r4, [r3, #480]
	add	r4, r3, #492
	ldr	r6, [r1, #24]
	add	r5, r2, #580
	mov	r2, #0
	strb	r6, [r3, #481]
	ldr	r6, [r1, #32]
	strb	r6, [r3, #482]
	ldr	r6, [r1, #28]
	str	r6, [r3, #484]
	ldrb	r6, [r0, #568]!	@ zero_extendqisi2
	strb	r6, [r3, #456]
.L1511:
	ldr	r6, [r0, #4]!
	add	r2, r2, #1
	cmp	r2, #3
	strh	r6, [lr, #2]!	@ movhi
	ldr	r6, [r5, #4]!
	strh	r6, [r4, #2]!	@ movhi
	bne	.L1511
	ldr	r0, [ip, #596]
	add	lr, r3, #456
	movw	r5, #614
	add	r4, ip, #616
	mov	r2, ip
	strh	r0, [lr, #44]	@ movhi
	mov	r0, r3
	ldr	r6, [ip, #600]
	strh	r6, [lr, #46]	@ movhi
	ldr	lr, [ip, #604]
	str	lr, [r3, #504]
	ldr	lr, [ip, #608]
	str	lr, [r3, #508]
	ldrb	lr, [ip, #612]	@ zero_extendqisi2
	strb	lr, [r3, #457]
	ldrh	lr, [ip, r5]
	str	lr, [r3, #512]
	ldrh	lr, [r4]
	str	lr, [r3, #516]
	ldrb	ip, [ip, #618]	@ zero_extendqisi2
	strb	ip, [r3, #520]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	HEVC_GetSLHDR1Info
	UNWIND(.fnend)
	.size	HEVC_ConvertHDRInfo, .-HEVC_ConvertHDRInfo
	.align	2
	.global	HEVC_AllocFrameStore
	.type	HEVC_AllocFrameStore, %function
HEVC_AllocFrameStore:
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
	add	r4, r0, #4096
	ldr	r3, [r0, #2820]
	movw	ip, #5036
	ldr	r1, [r0, #2816]
	ldr	r2, [r4, #748]
	movw	r5, #12668
	mov	r6, r0
	add	r0, r0, #13696
	add	r0, r0, #32
	mla	r3, ip, r2, r3
	mov	r2, #0
	mov	lr, r2
	ldr	r3, [r3, #32]
	strb	r2, [r4, #9]
	mla	r5, r5, r3, r1
.L1518:
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bne	.L1514
	cmp	r0, #0
	beq	.L1525
	ldr	ip, [r6, #3040]
	cmp	ip, #0
	beq	.L1525
	ldr	r2, [r6, #3208]
	cmp	r2, r0
	beq	.L1514
	add	r2, r6, #3200
	add	r2, r2, #8
	b	.L1516
.L1517:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L1514
.L1516:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1517
.L1525:
	mov	r8, #720
	mov	r7, r0
	mla	r8, r8, lr, r6
	mov	r3, #101
	mov	r2, #640
	str	r3, [r4, #48]
	add	r0, r4, #72
	mov	r3, #1
	add	r1, r8, #13760
	strb	r3, [r4, #9]
	add	r1, r1, #48
	mov	r9, #0
	bl	memcpy
	add	r3, r8, #13696
	movw	r2, #13744
	str	r7, [r4, #68]
	str	r9, [r4, #224]
	str	r9, [r8, r2]
	strb	r9, [r3, #34]
	strb	r9, [r7]
	ldr	r3, [r4, #68]
	str	r9, [r3, #60]
	ldr	r3, [r4, #68]
	str	r9, [r3, #64]
	ldr	r3, [r4, #68]
	str	r9, [r3, #52]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1522
	ldr	r0, [r6, #276]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r6, #276]
	bl	FSP_GetLogicFs
	mvn	r3, r8
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r7, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1520
	add	r2, r6, #3472
	add	r1, r5, #2064
	add	r2, r2, #8
	bl	HEVC_ConvertHDRInfo
	ldr	r3, [r6, #2856]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L1529
.L1521:
	ldr	r5, .L1530
	add	r1, r7, #40
	ldr	r0, [r4, #68]
	mov	r2, #640
	ldr	r3, [r5, #52]
	add	r0, r0, #80
	blx	r3
	ldr	r1, [r4, #68]
	add	r0, r6, #4160
	ldr	r3, [r5, #52]
	add	r1, r1, #80
	mov	r2, #640
	add	r0, r0, #8
	blx	r3
	ldr	r3, [r4, #68]
	mov	r0, #0
	str	r8, [r3, #28]
	ldrsb	r3, [r7, #4]
	str	r3, [r4, #44]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1514:
	add	lr, lr, #1
	add	r0, r0, #720
	cmp	lr, #20
	bne	.L1518
.L1522:
	ldr	r1, .L1530+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1529:
	ldr	r1, [r6, #2840]
	ldr	r5, [r7, #152]
	ldr	r3, [r7, #76]
	ldr	r2, [r1, #68]
	ldr	r1, [r1, #64]
	str	r9, [r7, #280]
	mul	r5, r5, r2
	str	r2, [r7, #112]
	str	r1, [r7, #108]
	str	r9, [r7, #284]
	add	r3, r5, r3
	str	r9, [r7, #288]
	str	r3, [r7, #80]
	mov	r0, r3
	str	r9, [r7, #292]
	str	r9, [r7, #296]
	bl	MEM_Phy2Vir
	ldr	r2, [r7, #60]
	ldr	r3, [r7, #156]
	add	r5, r5, r2
	str	r9, [r7, #556]
	str	r5, [r7, #64]
	add	r5, r5, r3
	str	r5, [r7, #72]
	str	r0, [r7, #552]
	b	.L1521
.L1520:
	strb	r3, [r4, #9]
	mov	r0, r3
	ldr	r1, .L1530+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1531:
	.align	2
.L1530:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC138
	.word	.LC139
	UNWIND(.fnend)
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
	.align	2
	.global	HEVC_IsVoFinish
	.type	HEVC_IsVoFinish, %function
HEVC_IsVoFinish:
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
	mov	r5, r0
	ldr	r0, [r0, #276]
	bl	FSP_GetFspType
	cmn	r0, #1
	mov	r4, r0
	movne	r4, #0
	bne	.L1536
	b	.L1539
.L1535:
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L1537
	cmp	r4, #32
	beq	.L1540
.L1536:
	mov	r1, r4
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	add	r4, r4, #1
	cmp	r0, #0
	bne	.L1535
	ldr	r1, .L1541
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1539:
	ldr	r1, .L1541+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1537:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1540:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1542:
	.align	2
.L1541:
	.word	.LC141
	.word	.LC140
	UNWIND(.fnend)
	.size	HEVC_IsVoFinish, .-HEVC_IsVoFinish
	.align	2
	.global	HEVC_GetBackPicFromVOQueue
	.type	HEVC_GetBackPicFromVOQueue, %function
HEVC_GetBackPicFromVOQueue:
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
	mov	r8, r0
	add	r0, r0, #6144
	add	r0, r0, #40
	add	r5, r8, #14336
	bl	ResetVoQueue
	add	r9, r8, #28672
	add	r5, r5, #40
	add	r9, r9, #104
	mov	r6, #0
	mov	r7, #0
.L1546:
	sub	r4, r5, #32
	mov	r3, #0
	strb	r3, [r5, #-647]
	str	r3, [r5, #-600]
.L1545:
	ldr	r1, [r4, #8]!
	cmp	r1, #0
	beq	.L1544
	ldr	r0, [r8, #276]
	bl	FreeUsdByDec
	strd	r6, [r4]
.L1544:
	cmp	r4, r5
	bne	.L1545
	add	r5, r4, #720
	cmp	r5, r9
	bne	.L1546
	ldr	r2, [r8, #184]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r8, r8, #2160
	mov	r3, #0
	add	r8, r8, #4
	mov	r1, r3
.L1548:
	add	r3, r3, #1
	str	r1, [r8, #4]!
	cmp	r3, r2
	bne	.L1548
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetBackPicFromVOQueue, .-HEVC_GetBackPicFromVOQueue
	.align	2
	.global	HEVC_RemoveFrameStoreOutDPB
	.type	HEVC_RemoveFrameStoreOutDPB, %function
HEVC_RemoveFrameStoreOutDPB:
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
	add	r6, r0, r1, lsl #2
	mov	r7, #0
	mov	r4, r1
	mov	r5, r0
	ldr	r3, [r6, #3208]
	str	r7, [r3, #48]
	ldr	r3, [r6, #3208]
	ldr	r0, [r0, #276]
	ldr	r1, [r3, #28]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1557
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L1558
	ldr	r3, [r6, #3208]
	mov	r2, r7
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #28]
	bl	FSP_SetDisplay
.L1558:
	ldr	r3, [r6, #3208]
	mov	r2, #0
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #28]
	bl	FSP_SetRef
.L1557:
	ldr	r1, [r5, #3040]
	sub	r1, r1, #1
	cmp	r4, r1
	addls	r3, r4, #800
	addls	r3, r3, #2
	addls	r3, r5, r3, lsl #2
	bhi	.L1561
.L1560:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bls	.L1560
.L1561:
	add	r3, r1, #800
	mov	r2, #0
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #8]
	str	r1, [r5, #3040]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveFrameStoreOutDPB, .-HEVC_RemoveFrameStoreOutDPB
	.align	2
	.global	HEVC_RemoveDummyFrame
	.type	HEVC_RemoveDummyFrame, %function
HEVC_RemoveDummyFrame:
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
	ldr	r1, [r0, #3040]
	mov	r5, r0
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r6, #0
	mov	r4, r6
	mov	r7, r6
	b	.L1573
.L1572:
	add	r4, r4, #1
	cmp	r4, r1
	mov	r6, r4
	bcs	.L1579
.L1573:
	add	r3, r5, r4, lsl #2
	ldr	r3, [r3, #3208]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1572
	mov	r1, r6
	strb	r7, [r3]
	mov	r0, r5
	sub	r4, r4, #1
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	add	r4, r4, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r1, [r5, #3040]
	mov	r6, r4
	cmp	r4, r1
	bcc	.L1573
.L1579:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveDummyFrame, .-HEVC_RemoveDummyFrame
	.align	2
	.global	HEVC_RemoveUnUsedFrameStore
	.type	HEVC_RemoveUnUsedFrameStore, %function
HEVC_RemoveUnUsedFrameStore:
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
	ldr	r5, [r0, #3040]
	mov	r10, r0
	cmp	r5, #0
	beq	.L1589
	mov	r6, #0
	mvn	r8, #0
	mov	r9, r6
	mov	r4, r6
	b	.L1588
.L1599:
	ldrsb	r2, [r0, #1]
	cmp	r2, #0
	cmpne	r2, #3
	ldr	r2, [r7, #3208]
	bne	.L1584
	ldr	r0, [r2, #52]
	cmp	r0, #1
	beq	.L1584
	str	r8, [r2, #28]
	mov	r3, #1
	ldr	r2, [r7, #3208]
	strb	r1, [r2, #1]
	ldr	r2, [r7, #3208]
	strb	r3, [r2, #2]
	ldr	r2, [r7, #3208]
.L1584:
	ldr	r3, [r2]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	addne	r9, r9, #1
	beq	.L1598
	add	r4, r4, #1
	cmp	r4, r5
	beq	.L1581
.L1588:
	add	r7, r10, r9, lsl #2
	ldr	r0, [r10, #276]
	ldr	r2, [r7, #3208]
	ldr	r1, [r2, #28]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1582
	ldrsb	r1, [r0]
	cmp	r1, #0
	beq	.L1599
	ldr	r2, [r7, #3208]
	b	.L1584
.L1582:
	ldr	r2, [r7, #3208]
	ldr	r1, [r2, #52]
	cmp	r1, #1
	beq	.L1584
	str	r8, [r2, #28]
	mov	r3, #1
	ldr	r2, [r7, #3208]
	strb	r0, [r2, #1]
	ldr	r2, [r7, #3208]
	strb	r3, [r2, #2]
	ldr	r2, [r7, #3208]
	b	.L1584
.L1598:
	mov	r1, r9
	mov	r0, r10
	add	r4, r4, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	cmp	r4, r5
	mov	r6, #1
	bne	.L1588
.L1581:
	mov	r0, r6
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1589:
	mov	r6, r5
	b	.L1581
	UNWIND(.fnend)
	.size	HEVC_RemoveUnUsedFrameStore, .-HEVC_RemoveUnUsedFrameStore
	.align	2
	.global	HEVC_SimpleSlideDPB
	.type	HEVC_SimpleSlideDPB, %function
HEVC_SimpleSlideDPB:
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
	add	r3, r0, #12288
	mov	r4, r0
	ldr	r1, [r3, #880]
	ldr	r2, [r3, #876]
	cmp	r1, r2
	bcs	.L1602
	ldr	r2, [r3, #1160]
	ldr	r3, [r3, #1156]
	cmp	r2, r3
	bcs	.L1602
	ldr	r3, [r0, #3036]
	ldr	r2, [r0, #3040]
	cmp	r2, r3
	ldmccfd	sp, {r4, r5, fp, sp, pc}
	cmp	r3, #15
	bls	.L1606
.L1602:
	ldr	r3, [r4, #3208]
	mov	r5, #0
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r1, [r3, #28]
	ldr	r0, [r4, #276]
	bl	FSP_SetRef
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVC_RemoveFrameStoreOutDPB
.L1606:
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L1602
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SimpleSlideDPB, .-HEVC_SimpleSlideDPB
	.align	2
	.global	HEVC_GetMinPOC
	.type	HEVC_GetMinPOC, %function
HEVC_GetMinPOC:
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
	mov	r6, r2
	mvn	r3, #-2147483648
	mov	r2, #0
	str	r2, [r6]
	str	r3, [r1]
	mov	r4, r1
	ldr	r2, [r0, #3040]
	mov	r5, r0
	ldr	r3, [r0, #3036]
	cmp	r2, r3
	bhi	.L1614
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1615:
	add	r1, r5, #3200
	mov	r3, #0
	add	r1, r1, #4
.L1611:
	ldr	r2, [r1, #4]!
	ldr	r0, [r4]
	ldr	r2, [r2, #8]
	cmp	r0, r2
	strgt	r2, [r4]
	strgt	r3, [r6]
	add	r3, r3, #1
	ldr	r2, [r5, #3040]
	cmp	r2, r3
	bhi	.L1611
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1614:
	ldr	r1, .L1616
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #3036]
	cmp	r2, #0
	str	r2, [r5, #3040]
	bne	.L1615
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1617:
	.align	2
.L1616:
	.word	.LC142
	UNWIND(.fnend)
	.size	HEVC_GetMinPOC, .-HEVC_GetMinPOC
	.align	2
	.global	HEVC_GetReRangeFlag
	.type	HEVC_GetReRangeFlag, %function
HEVC_GetReRangeFlag:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #4096
	ldr	lr, [r0, #2820]
	movw	r5, #5036
	movw	r4, #12668
	ldr	ip, [r3, #748]
	ldr	r3, [r0, #2816]
	mla	ip, r5, ip, lr
	ldr	lr, [fp, #4]
	ldr	ip, [ip, #32]
	mla	r3, r4, ip, r3
	ldr	ip, [r3, #64]
	ldr	r3, [r3, #68]
	cmp	r1, ip
	cmpeq	lr, #0
	bne	.L1619
	cmp	r2, r3
	beq	.L1630
.L1619:
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1631
.L1624:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1631:
	ldr	r2, [r0, #2856]
	ldr	r2, [r2, #24]
	bics	r2, r2, #4
	beq	.L1624
	ldr	r2, [r0, #2396]
	cmp	r2, #0
	bne	.L1629
	str	r3, [r0, #2396]
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1630:
	ldr	r3, [r0, #172]
	cmp	r3, #0
	beq	.L1619
	ldr	r3, [r0, #2856]
	ldr	r3, [r3, #968]
	cmp	r3, #0
	bne	.L1619
.L1629:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetReRangeFlag, .-HEVC_GetReRangeFlag
	.align	2
	.global	HEVC_CalcStreamBits
	.type	HEVC_CalcStreamBits, %function
HEVC_CalcStreamBits:
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
	ldr	r4, [r0, #2828]
	ldrb	ip, [r4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1643
	mov	r3, #0
	mov	r2, r4
	mov	lr, r3
.L1634:
	add	r3, r3, #1
	ldr	r1, [r2, #44]
	cmp	r3, ip
	add	r2, r2, #28
	add	lr, lr, r1
	bne	.L1634
.L1633:
	ldr	r2, [r0, #2808]
	mov	r3, ip, asl #5
	sub	ip, r3, ip, asl #2
	add	r4, r4, ip
	ldr	r3, [r2, #24]
	and	r3, r3, #7
	str	r3, [r4, #56]
	ldr	r2, [r0, #2828]
	ldr	r3, [r0, #2808]
	ldrb	r1, [r2]	@ zero_extendqisi2
	ldr	ip, [r3, #24]
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #48]
	add	r2, r2, ip, lsr #3
	rsb	r2, lr, r2
	str	r2, [r3, #60]
	ldr	r1, [r0, #2828]
	ldr	r3, [r0, #2808]
	ldrb	r2, [r1]	@ zero_extendqisi2
	ldr	ip, [r3, #24]
	mov	r3, r2, asl #5
	sub	r2, r3, r2, asl #2
	add	r2, r1, r2
	ldr	r3, [r2, #44]
	add	r3, lr, r3
	rsb	r3, ip, r3, lsl #3
	str	r3, [r2, #52]
	ldr	r2, [r0, #2828]
	ldrb	r1, [r2]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #60]
	ldr	r1, [r3, #56]
	and	r2, r2, #3
	add	r2, r1, r2, lsl #3
	str	r2, [r3, #56]
	ldr	r2, [r0, #2828]
	ldrb	r1, [r2]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #60]
	bic	r2, r2, #3
	str	r2, [r3, #60]
	ldr	r1, [r0, #2828]
	ldr	r2, [r1, #8]
	sub	r3, r2, #1
	cmp	r3, #1
	bhi	.L1650
	ldrb	ip, [r1]	@ zero_extendqisi2
	add	lr, ip, #1
	cmp	r2, lr
	movhi	r2, #1
	movls	r2, #0
	cmp	lr, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L1636
	add	ip, ip, #2
	mov	lr, #0
.L1637:
	sub	r3, ip, #1
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r1, r1, r3
	str	lr, [r1, #56]
	ldr	r2, [r0, #2828]
	add	r2, r2, r3
	ldr	r1, [r2, #48]
	str	r1, [r2, #60]
	ldr	r2, [r0, #2828]
	add	r2, r2, r3
	ldr	r1, [r2, #44]
	mov	r1, r1, asl #3
	str	r1, [r2, #52]
	ldr	r2, [r0, #2828]
	add	r2, r2, r3
	ldr	r1, [r2, #60]
	ldr	r4, [r2, #56]
	and	r1, r1, #15
	add	r1, r4, r1, lsl #3
	str	r1, [r2, #56]
	ldr	r2, [r0, #2828]
	add	r3, r2, r3
	ldr	r2, [r3, #60]
	bic	r2, r2, #15
	str	r2, [r3, #60]
	ldr	r1, [r0, #2828]
	ldr	r3, [r1, #8]
	cmp	ip, #1
	cmpls	ip, r3
	add	ip, ip, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L1637
	sub	r3, r3, #1
.L1636:
	mov	r2, r3, asl #5
	ldr	ip, [r1, #12]
	sub	r3, r2, r3, asl #2
	add	r1, r1, r3
	ldr	r3, [r1, #52]
	rsb	r3, ip, r3
	str	r3, [r1, #52]
	ldr	r4, [r0, #2828]
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	lr, [r4, #8]
	cmp	r1, lr
	ldmcsfd	sp, {r4, fp, sp, pc}
	sxth	r3, r1
	add	r0, r0, #4096
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, r4, r3
.L1641:
	ldr	r2, [r3, #60]
	add	r1, r1, #1
	ldr	ip, [r0, #40]
	add	r3, r3, #28
	cmp	r2, ip
	strcc	r2, [r0, #40]
	ldrcc	lr, [r4, #8]
	cmp	lr, r1
	bhi	.L1641
	ldmfd	sp, {r4, fp, sp, pc}
.L1650:
	ldr	r1, .L1651
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L1643:
	mov	lr, ip
	b	.L1633
.L1652:
	.align	2
.L1651:
	.word	.LC143
	UNWIND(.fnend)
	.size	HEVC_CalcStreamBits, .-HEVC_CalcStreamBits
	.align	2
	.global	HEVC_VpsSpsPpsCheck
	.type	HEVC_VpsSpsPpsCheck, %function
HEVC_VpsSpsPpsCheck:
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
	add	r2, r0, #4096
	ldr	r3, [r0, #164]
	ldr	r2, [r2, #748]
	cmp	r2, r3
	bge	.L1661
	movw	r3, #5036
	ldr	r1, [r0, #2820]
	mul	r3, r3, r2
	add	ip, r1, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1662
	ldr	r2, [ip, #32]
	ldr	r3, [r0, #160]
	cmp	r2, r3
	bge	.L1663
	ldr	r1, [r0, #2816]
	movw	r3, #12668
	mla	r3, r3, r2, r1
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1664
	ldr	r2, [r3, #48]
	ldr	r3, [r0, #156]
	cmp	r2, r3
	bcs	.L1665
	movw	r3, #24912
	ldr	r1, [r0, #2812]
	mul	r3, r3, r2
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1666
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1661:
	ldr	r1, .L1667
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1662:
	ldr	r1, .L1667+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1663:
	ldr	r1, .L1667+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1664:
	ldr	r1, .L1667+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1665:
	ldr	r1, .L1667+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1666:
	ldr	r1, .L1667+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1668:
	.align	2
.L1667:
	.word	.LC144
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC149
	UNWIND(.fnend)
	.size	HEVC_VpsSpsPpsCheck, .-HEVC_VpsSpsPpsCheck
	.align	2
	.global	HEVC_IsNewPic
	.type	HEVC_IsNewPic, %function
HEVC_IsNewPic:
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
	add	r1, r0, #4096
	ldr	lr, [r0, #2828]
	ldr	r3, [r1, #744]
	ldr	r2, [lr, #16]
	add	r4, r0, r3, lsl #2
	ldr	ip, [r4, #244]
	cmn	ip, #-2147483647
	beq	.L1710
	sub	r5, r2, #16
	cmp	r2, #21
	cmpne	r5, #2
	bls	.L1707
.L1686:
	cmp	r2, #1
	bls	.L1711
.L1674:
	sub	r2, r2, #19
	cmp	r2, #1
	movls	ip, #-2147483647
	strls	ip, [r4, #244]
.L1707:
	ldr	r2, [r1, #724]
.L1676:
	cmp	ip, r2
	ble	.L1677
	ldr	r5, [lr, #16]
	sub	r6, r5, #8
	cmp	r6, #1
	addhi	r3, r0, r3
	bls	.L1712
.L1679:
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1680
	ldr	r5, [r4, #252]
	cmp	r5, r2
	ble	.L1680
	ldr	r6, [lr, #16]
	sub	r7, r6, #8
	cmp	r7, #1
	bls	.L1713
.L1680:
	ldrb	ip, [r1, #713]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1681
	ldr	lr, [lr, #16]
	sub	r5, lr, #19
	cmp	r5, #1
	bls	.L1708
	cmp	lr, #21
	beq	.L1708
	sub	lr, lr, #16
	cmp	lr, #2
	strls	r2, [r4, #252]
	movls	ip, #1
	strlsb	ip, [r3, #12]
.L1681:
	ldr	ip, [r0, #260]
	ldrb	r3, [r1, #712]	@ zero_extendqisi2
	cmp	ip, #0
	ldr	r1, [r1, #748]
	beq	.L1685
	ldr	ip, [r0, #208]
	cmp	r1, ip
	movne	r3, #1
.L1685:
	ldr	ip, [r0, #328]
	cmp	ip, r1
	movne	r0, #1
	beq	.L1714
.L1706:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1711:
	ldr	r5, [r1, #732]
	cmp	r5, #2
	bne	.L1674
	cmn	ip, #-2147483647
	bne	.L1707
.L1675:
	ldr	r2, [r1, #724]
	str	r2, [r4, #244]
	ldr	ip, [lr, #16]
	cmp	ip, #1
	bls	.L1715
.L1677:
	add	r3, r0, r3
	ldrb	ip, [r3, #6]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1679
	ldr	r5, [lr, #16]
	sub	r6, r5, #8
	cmp	r6, #1
	bhi	.L1679
	str	r2, [sp]
	movw	r3, #13102
	str	r5, [sp, #8]
	mov	r0, #1
	str	ip, [sp, #4]
	ldr	r2, .L1716
	ldr	r1, .L1716+4
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1706
.L1710:
	sub	r6, r2, #16
	cmp	r6, #5
	movhi	r7, #0
	movls	r7, #1
	cmp	r2, #1
	ldrls	r5, [r1, #732]
	movhi	r5, #0
	subls	r5, r5, #2
	clzls	r5, r5
	movls	r5, r5, lsr #5
	orrs	r5, r5, r7
	moveq	r0, #2
	beq	.L1706
	cmp	r2, #21
	cmpne	r6, #2
	bhi	.L1686
	b	.L1675
.L1714:
	ldr	r0, [r0, #284]
	cmp	r0, r2
	moveq	r0, r3
	movne	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1712:
	str	r2, [sp]
	movw	r3, #13095
	str	r5, [sp, #8]
	mov	r0, #1
	str	ip, [sp, #4]
	ldr	r2, .L1716
	ldr	r1, .L1716+8
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1706
.L1708:
	str	r2, [r4, #252]
	strb	ip, [r3, #12]
	b	.L1681
.L1715:
	mov	ip, #1
	str	ip, [r0, #356]
	ldr	ip, [r4, #244]
	b	.L1676
.L1713:
	str	r2, [sp, #4]
	movw	r3, #13111
	str	r6, [sp, #12]
	mov	r0, #1
	str	r5, [sp, #8]
	str	ip, [sp]
	ldr	r2, .L1716
	ldr	r1, .L1716+12
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1706
.L1717:
	.align	2
.L1716:
	.word	.LANCHOR0+484
	.word	.LC151
	.word	.LC150
	.word	.LC152
	UNWIND(.fnend)
	.size	HEVC_IsNewPic, .-HEVC_IsNewPic
	.align	2
	.global	HEVC_ReadByteAlignment
	.type	HEVC_ReadByteAlignment, %function
HEVC_ReadByteAlignment:
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
	mov	r1, #1
	mov	r4, r0
	ldr	r0, [r0, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L1723
	ldr	r0, [r4, #2808]
	bl	BsBitsToNextByte
	subs	r1, r0, #0
	beq	.L1722
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r1, .L1724
	mov	r2, r0
	mov	r0, #19
	bl	dprint_vfmw
.L1722:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1723:
	ldr	r1, .L1724+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1725:
	.align	2
.L1724:
	.word	.LC154
	.word	.LC153
	UNWIND(.fnend)
	.size	HEVC_ReadByteAlignment, .-HEVC_ReadByteAlignment
	.align	2
	.global	HEVC_GetRapPicFlag
	.type	HEVC_GetRapPicFlag, %function
HEVC_GetRapPicFlag:
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
	add	r0, r0, #4096
	ldr	r0, [r0, #740]
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetRapPicFlag, .-HEVC_GetRapPicFlag
	.align	2
	.global	HEVC_GetIdrPicFlag
	.type	HEVC_GetIdrPicFlag, %function
HEVC_GetIdrPicFlag:
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
	add	r0, r0, #4096
	ldr	r0, [r0, #740]
	sub	r0, r0, #19
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetIdrPicFlag, .-HEVC_GetIdrPicFlag
	.align	2
	.global	HEVC_DecPTL
	.type	HEVC_DecPTL, %function
HEVC_DecPTL:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	subs	r8, r2, #0
	mov	r5, r0
	mov	r9, r1
	mov	r6, r3
	bne	.L1766
.L1729:
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r6, #0
	str	r0, [r9, #4]
	ble	.L1734
	sub	r9, fp, #84
	sub	r7, fp, #92
	mov	r4, #0
	mov	r10, r9
.L1735:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r10], #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r7, r4]
	add	r4, r4, #1
	cmp	r4, #5
	movle	r3, #1
	movgt	r3, #0
	cmp	r6, r4
	movle	r3, #0
	cmp	r3, #0
	bne	.L1735
	cmp	r6, #7
	movle	r4, r6
	ble	.L1739
	b	.L1740
.L1738:
	cmp	r4, #8
	beq	.L1740
.L1739:
	mov	r1, #2
	ldr	r0, [r5, #2808]
	bl	BsGet
	add	r4, r4, #1
	cmp	r0, #0
	beq	.L1738
	ldr	r1, .L1768
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1734:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1740:
	mov	r10, #0
	b	.L1744
.L1743:
	add	r10, r10, #1
	cmp	r10, #5
	movle	r3, #1
	movgt	r3, #0
	cmp	r6, r10
	movle	r3, #0
	cmp	r3, #0
	beq	.L1734
.L1744:
	cmp	r8, #0
	beq	.L1741
	ldrb	r3, [r9, r10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1767
.L1741:
	ldrb	r3, [r7, r10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1743
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	b	.L1743
.L1767:
	mov	r1, #2
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	mov	r4, #32
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r5, #2808]
	bl	BsGet
.L1742:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	subs	r4, r4, #1
	bne	.L1742
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r5, #2808]
	bl	BsGet
	b	.L1741
.L1766:
	mov	r1, #2
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	sub	r4, fp, #77
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r5, #2808]
	sub	r7, fp, #45
	bl	BsGet
	mov	r10, r0
.L1730:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r7
	bne	.L1730
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r9]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r9, #1]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	sub	r3, r10, #4
	cmp	r3, #3
	bls	.L1731
	ldrb	r3, [fp, #-72]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1731
	ldrb	r3, [fp, #-71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1731
	ldrb	r3, [fp, #-70]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1731
	ldrb	r3, [fp, #-69]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1731
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #11
	ldr	r0, [r5, #2808]
	bl	BsGet
	b	.L1733
.L1731:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #2
	ldr	r0, [r5, #2808]
	bl	BsGet
.L1733:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldrb	r2, [fp, #-75]	@ zero_extendqisi2
	ldrb	r3, [fp, #-74]	@ zero_extendqisi2
	str	r10, [r5, #332]
	str	r2, [r5, #336]
	str	r3, [r5, #340]
	b	.L1729
.L1769:
	.align	2
.L1768:
	.word	.LC155
	UNWIND(.fnend)
	.size	HEVC_DecPTL, .-HEVC_DecPTL
	.align	2
	.global	HEVC_SetDefaultScalingList
	.type	HEVC_SetDefaultScalingList, %function
HEVC_SetDefaultScalingList:
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
	ldr	r9, .L1788
	add	r10, r0, #2240
	add	r3, r0, #2256
	add	r10, r10, #4
	mov	r6, #0
	add	r3, r3, #4
	str	r0, [fp, #-52]
	str	r3, [fp, #-48]
.L1771:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L1779
	ldr	r3, [fp, #-52]
	mov	r8, r6, asl #9
	ldr	r7, [fp, #-48]
	sub	r8, r8, r6, asl #7
	add	r5, r3, #632
	mov	r4, #0
.L1777:
	cmp	r6, #0
	add	r0, r5, r8
	mov	r2, #64
	ldr	r3, [r9, #52]
	beq	.L1786
	cmp	r6, #3
	beq	.L1787
	ldr	ip, .L1788+4
	cmp	r4, #2
	ldr	r1, .L1788+8
	movhi	r1, ip
	blx	r3
.L1773:
	mov	r3, #16
	str	r3, [r7, #4]!
	ldr	r3, [r10]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1777
.L1779:
	add	r6, r6, #1
	ldr	r3, [fp, #-48]
	cmp	r6, #4
	add	r3, r3, #24
	str	r3, [fp, #-48]
	bne	.L1771
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1786:
	mov	r2, #16
	ldr	r1, .L1788+12
	mov	r0, r5
	blx	r3
	b	.L1773
.L1787:
	ldr	r0, .L1788+4
	cmp	r4, #0
	ldr	r1, .L1788+8
	mov	r2, #64
	movne	r1, r0
	add	r0, r5, #1152
	blx	r3
	b	.L1773
.L1789:
	.align	2
.L1788:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+500
	.word	.LANCHOR2
	.word	.LANCHOR0+564
	UNWIND(.fnend)
	.size	HEVC_SetDefaultScalingList, .-HEVC_SetDefaultScalingList
	.align	2
	.global	HEVC_CalScalingList
	.type	HEVC_CalScalingList, %function
HEVC_CalScalingList:
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
	add	lr, r2, #90
	mov	ip, r2, asl #3
	sub	r2, ip, r2, asl #1
	mov	r5, #0
	ldr	r7, [r0, lr, asl #2]
	add	r3, r3, r2
	cmp	r7, #64
	mov	r6, r3, asl #4
	movcs	r7, #64
	mov	r8, r7, lsr #2
.L1791:
	cmp	r5, r8
	ldmcsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r7, #0
	beq	.L1791
	add	r3, r5, r6
	ldrb	ip, [r1]	@ zero_extendqisi2
	mov	r4, r1
	mov	r2, #0
	add	r3, r0, r3, lsl #2
	ldr	lr, [r3, #632]
	orr	ip, lr, ip
	str	ip, [r3, #632]
.L1797:
	add	r2, r2, #1
	add	r3, r5, r6
	and	lr, r2, #3
	cmp	r2, r7
	add	r3, r0, r3, lsl #2
	mov	ip, lr, asl #3
	beq	.L1791
	ldrb	r9, [r4, #1]!	@ zero_extendqisi2
	cmp	lr, #3
	ldr	lr, [r3, #632]
	addeq	r5, r5, #1
	orr	ip, lr, r9, asl ip
	str	ip, [r3, #632]
	b	.L1797
	UNWIND(.fnend)
	.size	HEVC_CalScalingList, .-HEVC_CalScalingList
	.align	2
	.global	HEVC_SetScalingList
	.type	HEVC_SetScalingList, %function
HEVC_SetScalingList:
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
	ldr	r1, [r0, #2840]
	mov	r7, r0
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1825
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1836
	ldr	r3, [r0, #2844]
	ldrb	r2, [r3, #21]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1809
	cmn	r3, #256
	add	r2, r3, #256
	str	r2, [fp, #-48]
	movne	r1, #0
	moveq	r1, #1
.L1808:
	cmp	r1, #0
	bne	.L1826
.L1811:
	ldr	r10, .L1839
	mov	r2, #1536
	add	r0, r7, #632
	add	r8, r7, #2240
	mov	r6, r1
	add	r8, r8, #4
	ldr	r3, [r10, #48]
	blx	r3
	ldr	r9, [fp, #-48]
.L1812:
	ldr	r3, [r8, #4]!
	cmp	r3, #0
	movne	r5, r9
	movne	r4, #0
	beq	.L1815
.L1813:
	mov	r3, r4
	mov	r1, r5
	mov	r2, r6
	mov	r0, r7
	bl	HEVC_CalScalingList
	ldr	r3, [r8]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1813
.L1815:
	add	r6, r6, #1
	add	r9, r9, #384
	cmp	r6, #4
	bne	.L1812
	ldr	r2, [fp, #-48]
	add	r0, r7, #2256
	ldr	r3, [r10, #52]
	add	r0, r0, #8
	add	r1, r2, #1536
	mov	r2, #96
	blx	r3
.L1825:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1836:
	ldr	r2, [r0, #2844]
	ldrb	r3, [r2, #1889]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1837
	add	r0, r1, #12288
	ldrb	ip, [r0, #372]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L1838
	ldrb	r3, [r2, #21]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1816
.L1809:
	ldrb	r3, [r1, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1826
.L1831:
	cmn	r1, #432
	add	r3, r1, #432
	str	r3, [fp, #-48]
	movne	r1, #0
	moveq	r1, #1
	cmp	r1, #0
	beq	.L1811
.L1826:
	mov	r0, r7
	bl	HEVC_SetDefaultScalingList
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1805:
	ldrb	r3, [r2, #21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1831
.L1816:
	cmn	r2, #256
	add	r3, r2, #256
	str	r3, [fp, #-48]
	movne	r1, #0
	moveq	r1, #1
	b	.L1808
.L1838:
	ldrb	ip, [r1, #4]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1805
	ldrb	r1, [r2, #21]	@ zero_extendqisi2
	orrs	r3, r1, r3
	bne	.L1806
	ldr	r2, [r0, #376]
	movw	r1, #12668
	ldr	r3, [r7, #2816]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #228]
	mla	r3, r1, r2, r3
.L1834:
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1826
	cmn	r3, #432
	add	r2, r3, #432
	str	r2, [fp, #-48]
	movne	r1, #0
	moveq	r1, #1
	b	.L1808
.L1837:
	ldr	r2, [r2, #1956]
	movw	r0, #5036
	ldr	r1, [r7, #2820]
	movw	lr, #12668
	ldr	r3, [r7, #2816]
	add	r2, r7, r2, lsl #2
	ldr	ip, [r2, #236]
	ldr	r2, [r2, #228]
	mla	r0, r0, ip, r1
	mla	r3, lr, r2, r3
	ldrb	r2, [r0, #21]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1834
	cmn	r0, #256
	add	r3, r0, #256
	str	r3, [fp, #-48]
	movne	r1, #0
	moveq	r1, #1
	b	.L1808
.L1806:
	cmp	r1, #0
	beq	.L1826
	b	.L1816
.L1840:
	.align	2
.L1839:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_SetScalingList, .-HEVC_SetScalingList
	.align	2
	.global	HEVC_GetScalingListDefaultAddress
	.type	HEVC_GetScalingListDefaultAddress, %function
HEVC_GetScalingListDefaultAddress:
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
	ldrls	pc, [pc, r0, asl #2]
	b	.L1842
.L1844:
	.word	.L1848
	.word	.L1846
	.word	.L1846
	.word	.L1847
.L1846:
	ldr	r3, .L1852
	cmp	r1, #2
	add	r0, r3, #64
	movhi	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1848:
	ldr	r0, .L1852+4
	ldmfd	sp, {fp, sp, pc}
.L1847:
	ldr	r3, .L1852
	cmp	r1, #0
	add	r0, r3, #64
	movne	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1842:
	ldr	r1, .L1852+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1853:
	.align	2
.L1852:
	.word	.LANCHOR2+80
	.word	.LANCHOR2+64
	.word	.LC156
	UNWIND(.fnend)
	.size	HEVC_GetScalingListDefaultAddress, .-HEVC_GetScalingListDefaultAddress
	.align	2
	.global	HEVC_DecRefPicListsModification
	.type	HEVC_DecRefPicListsModification, %function
HEVC_DecRefPicListsModification:
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r5, r3
	mov	r7, r1
	mov	r8, r2
	moveq	ip, #1
	movne	ip, #0
	cmp	r0, #0
	orreq	ip, ip, #1
	mov	r6, r0
	cmp	ip, #0
	bne	.L1864
	sub	r2, r3, #1
	mov	r4, #1
	movs	r2, r2, asr #1
	beq	.L1856
.L1857:
	movs	r2, r2, asr #1
	add	r4, r4, #1
	bne	.L1857
.L1856:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	cmp	r5, #1
	movls	r10, #0
	movhi	r10, #1
	uxtb	r0, r0
	strb	r0, [r8]
	cmp	r0, #0
	cmpne	r5, #1
	bls	.L1861
	ldr	r3, [r7, #76]
	cmp	r3, #0
	beq	.L1861
	mov	r9, r8
	mov	r5, #0
.L1862:
	mov	r1, r4
	ldr	r0, [r6, #2808]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7, #76]
	cmp	r3, r5
	bhi	.L1862
.L1861:
	ldr	r5, [r7, #20]
	cmp	r5, #0
	beq	.L1879
.L1860:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1879:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #1]
	cmp	r0, #0
	moveq	r10, #0
	andne	r10, r10, #1
	cmp	r10, #0
	beq	.L1860
	ldr	r3, [r7, #80]
	cmp	r3, #0
	beq	.L1860
	add	r8, r8, #128
.L1863:
	mov	r1, r4
	ldr	r0, [r6, #2808]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r8, #4]!
	ldr	r3, [r7, #80]
	cmp	r3, r5
	bhi	.L1863
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1864:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_DecRefPicListsModification, .-HEVC_DecRefPicListsModification
	.align	2
	.global	HEVC_MoreRbspData
	.type	HEVC_MoreRbspData, %function
HEVC_MoreRbspData:
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
	ldr	r0, [r0, #2808]
	bl	BsResidBits
	cmp	r0, #0
	ble	.L1882
	ldr	r3, [r4, #2828]
	ldr	r3, [r3, #12]
	add	r3, r3, #3
	cmp	r0, r3
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1882:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_MoreRbspData, .-HEVC_MoreRbspData
	.align	2
	.global	HEVC_More_Rbsp_Data
	.type	HEVC_More_Rbsp_Data, %function
HEVC_More_Rbsp_Data:
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
	ldr	r0, [r0, #2808]
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #24]
	mov	r2, r2, asl #3
	cmp	r2, r3
	bls	.L1886
	mov	r1, #8
	bl	BsShow
	subs	r0, r0, #128
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1886:
	ldr	r1, .L1887
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1888:
	.align	2
.L1887:
	.word	.LC157
	UNWIND(.fnend)
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
	.align	2
	.global	HEVC_FindTrailZeros
	.type	HEVC_FindTrailZeros, %function
HEVC_FindTrailZeros:
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
	mov	ip, #0
	mov	r6, r0
.L1901:
	ldr	r1, [r6, #2828]
	ldr	r0, [r1, #8]
	sub	r0, r0, #1
	mov	r7, r0, asl #2
	mov	r0, r0, asl #5
	rsb	r2, r7, r0
	add	r2, r1, r2
	ldr	r3, [r2, #44]
	ldr	r2, [r2, #40]
	sub	r3, r3, #1
	add	r3, r2, r3
.L1890:
	ldrb	r4, [r3]	@ zero_extendqisi2
	rsb	r5, r7, r0
	add	r2, r1, r5
	cmp	r4, #0
	bne	.L1902
	ldr	lr, [r1, #40]
	add	ip, ip, #1
	cmp	lr, r3
	beq	.L1903
	ldr	lr, [r2, #40]
	cmp	lr, r3
	sub	r3, r3, #1
	bne	.L1890
	ldr	r1, [r2, #64]
	ldr	r0, [r6, #276]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r6, #2828]
	mov	ip, r4
	add	r5, r3, r5
	str	r4, [r5, #40]
	ldr	r2, [r6, #2828]
	ldr	r3, [r2, #8]
	sub	r3, r3, #1
	str	r3, [r2, #8]
	b	.L1901
.L1902:
	tst	r4, #1
	mov	r3, #1
	moveq	r2, r3
	bne	.L1897
.L1898:
	ands	r0, r4, r2, asl r3
	add	r3, r3, #1
	bne	.L1897
	cmp	r3, #8
	bne	.L1898
	ldr	r1, .L1904
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1903:
	ldr	r1, .L1904+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1897:
	mov	r0, #0
	str	r0, [r1, #4]
	ldr	r2, [r6, #2828]
	add	ip, r3, ip, lsl #3
	str	ip, [r2, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1905:
	.align	2
.L1904:
	.word	.LC159
	.word	.LC158
	UNWIND(.fnend)
	.size	HEVC_FindTrailZeros, .-HEVC_FindTrailZeros
	.align	2
	.global	HEVC_FindNaluArraySlot
	.type	HEVC_FindNaluArraySlot, %function
HEVC_FindNaluArraySlot:
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
	ldr	r5, [r0, #168]
	mov	r8, r0
	ldr	r3, [r0, #148]
	cmp	r5, #0
	blt	.L1907
	add	r6, r5, #1
	mov	r0, r3
	mov	r1, r6
	bl	__aeabi_uidivmod
	ldr	r7, [r8, #2852]
	mov	r3, r1
	mov	r1, r1, asl #5
	mov	ip, r3, asl #7
	rsb	r2, r1, ip
	add	r2, r7, r2
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	.L1908
	mov	r4, #0
	b	.L1910
.L1911:
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r1, r1, asl #5
	mov	ip, r3, asl #7
	rsb	r2, r1, ip
	add	r2, r7, r2
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	.L1908
.L1910:
	add	r4, r4, #1
	mov	r1, r6
	cmp	r4, r5
	add	r0, r3, r4
	ble	.L1911
.L1907:
	mvn	r0, #0
	str	r3, [r8, #148]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1908:
	cmp	r3, r6
	mov	r0, r3
	str	r3, [r8, #148]
	bcs	.L1921
	rsb	r1, r1, ip
	mov	r3, #1
	add	r7, r7, r1
	str	r3, [r7, #32]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1921:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FindNaluArraySlot, .-HEVC_FindNaluArraySlot
	.align	2
	.global	HEVC_ReleaseNAL
	.type	HEVC_ReleaseNAL, %function
HEVC_ReleaseNAL:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L1930
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	str	r3, [r5, #32]
	str	r3, [r5, #36]
.L1925:
	ldr	r3, [r4, #40]
	mov	r0, r6
	cmp	r3, #0
	beq	.L1924
	ldr	r1, [r4, #64]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #44]
	ldr	r3, [r4, #40]
	mov	r0, #7
	ldr	r2, .L1931
	ldr	r1, .L1931+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #40]
	str	r3, [r4, #56]
	str	r3, [r4, #44]
.L1924:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L1925
	ldr	r3, .L1931+8
	mov	r0, r5
	mov	r2, #96
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L1930:
	mov	r0, r5
	movw	r3, #14430
	ldr	r2, .L1931+12
	ldr	r1, .L1931+16
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1932:
	.align	2
.L1931:
	.word	.LANCHOR0+580
	.word	.LC160
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC3
	UNWIND(.fnend)
	.size	HEVC_ReleaseNAL, .-HEVC_ReleaseNAL
	.align	2
	.global	HEVC_InitDecBuffers
	.type	HEVC_InitDecBuffers, %function
HEVC_InitDecBuffers:
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
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	mov	r6, r0
	cmp	r3, #1
	beq	.L1969
.L1934:
	ldr	r3, [r6, #2840]
	ldr	r3, [r3, #184]
	add	r3, r3, #1
	str	r3, [r6, #3036]
.L1936:
	cmp	r3, #17
	bhi	.L1970
.L1937:
	add	lr, r6, #3264
	add	ip, r6, #3328
	add	r0, r6, #3200
	add	r1, r6, #3056
	mov	r7, #0
	add	lr, lr, #8
	add	ip, ip, #12
	add	r0, r0, #4
	add	r1, r1, #12
	add	r5, r6, #3408
	add	r4, r6, #3136
	mov	r2, r7
	mov	r3, r7
	str	r7, [r6, #3040]
	str	r7, [r6, #3052]
	str	r7, [r6, #3056]
	str	r7, [r6, #3048]
	str	r7, [r6, #3044]
	str	r7, [r6, #3064]
	str	r7, [r6, #3068]
.L1938:
	add	r2, r2, #1
	str	r3, [r5, #4]!
	cmp	r2, #17
	str	r3, [lr, #4]!
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [r1, #4]!
	str	r3, [r4, #4]!
	bne	.L1938
	add	r4, r6, #13760
	ldr	r9, .L1971
	add	r4, r4, #48
	mov	r7, #0
.L1939:
	ldr	r3, [r9, #48]
	mov	r2, #640
	mov	r0, r4
	mov	r1, #0
	blx	r3
	str	r7, [r4, #148]
	add	r7, r7, #1
	mov	r5, #0
	cmp	r7, #20
	sub	r3, r4, #80
	strb	r5, [r4, #-80]
	mov	r2, #20
	str	r5, [r4, #-32]
	mov	r8, #16
	strb	r5, [r4, #-79]
	add	r4, r4, #720
	str	r5, [r4, #-792]
	strb	r5, [r4, #-798]
	str	r5, [r4, #-744]
	str	r2, [r4, #-780]
	str	r8, [r4, #-776]
	str	r3, [r4, #-724]
	ldr	r10, .L1971
	bne	.L1939
	add	r0, r6, #13120
	add	r4, r6, #12288
	ldr	r3, [r10, #48]
	mov	r2, #280
	mov	r1, r5
	add	r0, r0, #44
	blx	r3
	add	r0, r6, #13440
	ldr	r3, [r10, #48]
	mov	r2, #280
	mov	r1, r5
	add	r0, r0, #4
	str	r8, [r4, #876]
	str	r5, [r4, #880]
	blx	r3
	add	r3, r6, #2928
	add	r3, r3, #4
	add	r2, r6, #2864
	mov	r1, r5
	str	r8, [r4, #1156]
	str	r5, [r4, #1160]
.L1940:
	str	r1, [r2, #4]!
	cmp	r2, r3
	mov	r0, #0
	bne	.L1940
	add	r1, r6, #2992
	add	lr, r6, #4096
	add	r1, r1, #8
	mov	ip, r0
	str	r0, [lr, #780]
.L1941:
	str	ip, [r3, #4]!
	cmp	r3, r1
	mov	r2, #0
	bne	.L1941
	str	r2, [lr, #784]
	ldr	r0, [r6, #184]
	cmp	r0, r2
	addne	r1, r6, #2160
	movne	r3, r2
	addne	r1, r1, #4
	movne	r2, r3
	beq	.L1946
.L1945:
	add	r3, r3, #1
	str	r2, [r1, #4]!
	cmp	r3, r0
	bne	.L1945
.L1946:
	ldr	r2, [r6, #168]
	cmp	r2, #0
	movne	r4, #0
	movne	r5, r4
	beq	.L1933
.L1951:
	ldr	r3, [r6, #2848]
	mov	r7, r4, asl #2
	ldr	r1, [r3, r4, asl #2]
	cmp	r1, #0
	beq	.L1947
	ldr	r3, [r6, #2828]
	cmp	r1, r3
	beq	.L1947
	ldr	r0, [r6, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r6, #2848]
	str	r5, [r3, r7]
	ldr	r3, [r6, #204]
	ldr	r2, [r6, #260]
	cmp	r3, #0
	subne	r3, r3, #1
	cmp	r2, #0
	str	r3, [r6, #204]
	subne	r2, r2, #1
	ldr	r3, [r6, #176]
	str	r2, [r6, #260]
	ldr	r2, [r6, #168]
	cmp	r3, #2
	subhi	r3, r3, #1
	movls	r3, #2
	str	r3, [r6, #176]
.L1947:
	add	r4, r4, #1
	cmp	r2, r4
	bhi	.L1951
.L1933:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1970:
	mov	r4, #17
	ldr	r2, .L1971+4
	str	r4, [sp]
	mov	r3, r4
	ldr	r1, .L1971+8
	mov	r0, #1
	bl	dprint_vfmw
	str	r4, [r6, #3036]
	b	.L1937
.L1969:
	ldr	r3, [r0, #2856]
	ldr	r3, [r3, #24]
	bics	r3, r3, #4
	beq	.L1934
	ldr	r2, [r0, #2392]
	cmp	r2, #0
	beq	.L1934
	ldr	r3, [r6, #2840]
	ldr	r3, [r3, #184]
	mul	r3, r3, r2
	add	r3, r3, #1
	str	r3, [r6, #3036]
	b	.L1936
.L1972:
	.align	2
.L1971:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+596
	.word	.LC161
	UNWIND(.fnend)
	.size	HEVC_InitDecBuffers, .-HEVC_InitDecBuffers
	.align	2
	.global	HEVC_EmptyFrmFromDPB
	.type	HEVC_EmptyFrmFromDPB, %function
HEVC_EmptyFrmFromDPB:
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
	subs	r6, r0, #0
	beq	.L1984
	ldr	ip, [r6, #3040]
	add	r8, r6, #3200
	cmp	ip, #0
	addne	r8, r8, #4
	movne	r3, #0
	movne	lr, #1
	movne	r1, r8
	beq	.L1999
.L1978:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	streqb	lr, [r2, #2]
	ldreq	ip, [r6, #3040]
	cmp	ip, r3
	bhi	.L1978
.L1979:
	mov	r4, r6
	mov	r7, #17
	mov	r5, #0
	mov	r3, #-2147483647
	str	r3, [r6, #212]
	str	r3, [r6, #216]
.L1976:
	ldr	r3, [r8, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L1980
	ldr	r1, [r3, #28]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1980:
	ldr	r3, [r4, #3276]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1981
	ldr	r1, [r3, #28]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1981:
	ldr	r3, [r4, #3344]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1982
	ldr	r1, [r3, #28]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1982:
	ldr	r3, [r4, #3412]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1983
	ldr	r1, [r3, #28]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1983:
	subs	r7, r7, #1
	str	r5, [r4, #3412]
	str	r5, [r4, #3344]
	add	r4, r4, #4
	str	r5, [r4, #3272]
	str	r5, [r4, #3204]
	bne	.L1976
	mov	r0, r6
	bl	HEVC_InitDecBuffers
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1999:
	add	r8, r8, #4
	b	.L1979
.L1984:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_EmptyFrmFromDPB, .-HEVC_EmptyFrmFromDPB
	.align	2
	.global	HEVC_CombinePacket
	.type	HEVC_CombinePacket, %function
HEVC_CombinePacket:
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
	ldr	r0, [r0, #2828]
	cmp	r0, #0
	beq	.L2003
	ldr	r3, [r0, #44]
	cmp	r3, #4096
	ldmcsfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L2004
	mov	r0, #7
	bl	dprint_vfmw
	ldr	r3, [r4, #2828]
	ldr	ip, .L2004+4
	mov	r5, #0
	ldr	r2, [r3, #44]
	ldr	r0, [r3, #68]
	ldr	r1, [r3, #40]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #2828]
	mov	r0, #1
	ldr	r2, [r3, #92]
	ldr	r1, [r3, #64]
	str	r2, [r3, #64]
	ldr	r3, [r4, #2828]
	str	r5, [r3, #56]
	ldr	r3, [r4, #2828]
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #68]
	rsb	r2, ip, r2
	str	r2, [r3, #40]
	ldr	r3, [r4, #2828]
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #76]
	rsb	r2, ip, r2
	str	r2, [r3, #48]
	ldr	r3, [r4, #2828]
	ldr	r2, [r3, #44]
	ldr	ip, [r3, #72]
	add	r2, r2, ip
	str	r2, [r3, #44]
	ldr	r3, [r4, #2828]
	str	r0, [r3, #8]
	ldr	r0, [r4, #276]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #2828]
	str	r5, [r3, #68]
	ldr	r3, [r4, #2828]
	str	r5, [r3, #84]
	ldr	r3, [r4, #2828]
	str	r5, [r3, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2003:
	ldr	r1, .L2004+8
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2005:
	.align	2
.L2004:
	.word	.LC163
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC162
	UNWIND(.fnend)
	.size	HEVC_CombinePacket, .-HEVC_CombinePacket
	.align	2
	.global	HEVC_IsOutDPB
	.type	HEVC_IsOutDPB, %function
HEVC_IsOutDPB:
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
	beq	.L2011
	ldr	ip, [r0, #3040]
	cmp	ip, #0
	beq	.L2011
	ldr	r3, [r0, #3208]
	cmp	r3, r1
	beq	.L2013
	add	r0, r0, #3200
	mov	r3, #0
	add	r0, r0, #8
	b	.L2008
.L2009:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L2013
.L2008:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L2009
.L2011:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L2013:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsOutDPB, .-HEVC_IsOutDPB
	.align	2
	.global	HEVC_IsNewPicNal
	.type	HEVC_IsNewPicNal, %function
HEVC_IsNewPicNal:
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
	.size	HEVC_IsNewPicNal, .-HEVC_IsNewPicNal
	.align	2
	.global	HEVC_u_v
	.type	HEVC_u_v, %function
HEVC_u_v:
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
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsGet
	UNWIND(.fnend)
	.size	HEVC_u_v, .-HEVC_u_v
	.align	2
	.global	HEVC_f_v
	.type	HEVC_f_v, %function
HEVC_f_v:
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
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsGet
	UNWIND(.fnend)
	.size	HEVC_f_v, .-HEVC_f_v
	.align	2
	.global	HEVC_ue_v
	.type	HEVC_ue_v, %function
HEVC_ue_v:
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
	mov	r1, #32
	mov	r5, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	bls	.L2020
	movw	r0, #61166
	movt	r0, 65535
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2020:
	add	r4, r0, #1
	mov	r1, r0
	mov	r0, r5
	bl	BsSkip
	mov	r1, r4
	mov	r0, r5
	bl	BsShow
	mov	r1, r4
	sub	r4, r0, #1
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ue_v, .-HEVC_ue_v
	.align	2
	.global	HEVC_Sei_Tone_Mapping_Info
	.type	HEVC_Sei_Tone_Mapping_Info, %function
HEVC_Sei_Tone_Mapping_Info:
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
	ldr	r1, .L2043
	mov	r4, r0
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	ldr	r0, [r4, #2808]
	mov	r1, #1
	bl	BsGet
	tst	r0, #255
	beq	.L2040
.L2026:
	mov	r1, #32
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r0, [r4, #2808]
	mov	r1, #32
	bl	BsGet
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2040:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	mov	r6, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #8
	mov	r7, r0
	bhi	.L2041
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L2037
.L2025:
	.word	.L2026
	.word	.L2026
	.word	.L2027
	.word	.L2028
	.word	.L2029
.L2028:
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #256
	mov	r8, r0
	bhi	.L2033
	cmp	r0, #0
	beq	.L2037
	add	r6, r6, #7
	add	r7, r7, #7
	bic	r6, r6, #7
	bic	r7, r7, #7
	mov	r5, #0
.L2035:
	mov	r1, r6
	ldr	r0, [r4, #2808]
	bl	BsGet
	add	r5, r5, #1
	mov	r1, r7
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r5, r8
	bne	.L2035
.L2037:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2027:
	mov	r2, #1
	movs	r7, r2, asl r7
	addne	r6, r6, #7
	movne	r5, #0
	bicne	r6, r6, #7
	beq	.L2037
.L2031:
	add	r5, r5, #1
	mov	r1, r6
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r7, r5
	bne	.L2031
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2029:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #255
	beq	.L2042
.L2036:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #32
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #32
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r0, [r4, #2808]
	mov	r1, #16
	bl	BsGet
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2042:
	mov	r1, #32
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L2036
.L2041:
	mov	r2, r0
	ldr	r1, .L2043+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2033:
	ldr	r1, .L2043+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2044:
	.align	2
.L2043:
	.word	.LC164
	.word	.LC165
	.word	.LC166
	UNWIND(.fnend)
	.size	HEVC_Sei_Tone_Mapping_Info, .-HEVC_Sei_Tone_Mapping_Info
	.align	2
	.global	HEVC_Sei_Frame_Packing_Arrangement
	.type	HEVC_Sei_Frame_Packing_Arrangement, %function
HEVC_Sei_Frame_Packing_Arrangement:
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
	ldr	r1, .L2055
	mov	r4, r0
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	ldr	r0, [r4, #2808]
	mov	r1, #1
	bl	BsGet
	tst	r0, #255
	bne	.L2046
	mov	r1, #7
	ldr	r0, [r4, #2808]
	bl	BsGet
	sub	r3, r0, #3
	mov	r6, r0
	cmp	r3, #2
	bhi	.L2053
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #6
	mov	r5, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	uxtb	r5, r5
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	clz	r5, r5
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	mov	r5, r5, lsr #5
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r6, #5
	moveq	r5, #0
	cmp	r5, #0
	bne	.L2054
.L2049:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
.L2046:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2054:
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L2049
.L2053:
	mov	r2, r0
	ldr	r1, .L2055+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2056:
	.align	2
.L2055:
	.word	.LC167
	.word	.LC168
	UNWIND(.fnend)
	.size	HEVC_Sei_Frame_Packing_Arrangement, .-HEVC_Sei_Frame_Packing_Arrangement
	.align	2
	.global	HEVC_Sei_Dec_Unit_Info
	.type	HEVC_Sei_Dec_Unit_Info, %function
HEVC_Sei_Dec_Unit_Info:
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r5, r2
	mov	r4, r0
	moveq	r1, #1
	movne	r1, #0
	cmp	r0, #0
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L2061
	ldr	r1, .L2070
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2068
.L2059:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2069
.L2060:
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2068:
	ldr	r1, [r5, #4]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	b	.L2059
.L2069:
	ldr	r1, [r5, #8]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	b	.L2060
.L2061:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2071:
	.align	2
.L2070:
	.word	.LC169
	UNWIND(.fnend)
	.size	HEVC_Sei_Dec_Unit_Info, .-HEVC_Sei_Dec_Unit_Info
	.align	2
	.global	HEVC_Sei_Active_Param_sets
	.type	HEVC_Sei_Active_Param_sets, %function
HEVC_Sei_Active_Param_sets:
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
	mov	r1, #4
	mov	r5, r0
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r0, [r5, #2808]
	ldr	r1, .L2079
	bl	HEVC_ue_v
	cmp	r0, #15
	bgt	.L2073
	cmp	r0, #0
	addge	r6, r0, #1
	movge	r4, #0
	blt	.L2077
.L2076:
	add	r4, r4, #1
	ldr	r1, .L2079+4
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r4, r6
	bne	.L2076
.L2077:
	ldr	r0, [r5, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2073:
	ldr	r1, .L2079+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2080:
	.align	2
.L2079:
	.word	.LC170
	.word	.LC172
	.word	.LC171
	UNWIND(.fnend)
	.size	HEVC_Sei_Active_Param_sets, .-HEVC_Sei_Active_Param_sets
	.align	2
	.global	HEVC_Sei_Buf_Period
	.type	HEVC_Sei_Buf_Period, %function
HEVC_Sei_Buf_Period:
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
	add	r4, r0, #8192
	mov	r5, r0
	mov	r9, r1
	mov	r6, #0
	ldr	r1, .L2110
	mov	r7, r2
	str	r6, [r4, #3544]
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	cmp	r0, #15
	bhi	.L2106
	mov	r1, #1
	strb	r1, [r4, #3537]
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r8, r6
	beq	.L2107
.L2084:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r4, #1
	strb	r0, [r9]
	ldr	r1, [r7, #16]
	ldr	r0, [r5, #2808]
	add	r1, r1, r4
	bl	BsGet
	subs	r3, r4, #1
	beq	.L2108
.L2086:
	cmp	r3, #1
	beq	.L2109
.L2090:
	cmp	r4, #1
	bhi	.L2089
.L2088:
	add	r4, r4, #1
	subs	r3, r4, #1
	bne	.L2086
.L2108:
	ldrb	r2, [r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2090
	ldr	r2, [r7, #24]
	cmn	r2, #1
	beq	.L2088
.L2097:
	mov	r6, #0
	b	.L2093
.L2092:
	ldr	r3, [r7, #24]
	add	r3, r3, #1
	cmp	r3, r6
	bls	.L2090
.L2093:
	ldr	r1, [r7, #12]
	add	r6, r6, #1
	ldr	r0, [r5, #2808]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #2808]
	add	r1, r1, #1
	bl	BsGet
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r8, r3
	beq	.L2092
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #2808]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #2808]
	add	r1, r1, #1
	bl	BsGet
	b	.L2092
.L2109:
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2089
	ldr	r3, [r7, #24]
	cmn	r3, #1
	bne	.L2097
.L2089:
	ldr	r0, [r5, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2107:
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r8, r0
	cmp	r8, #0
	beq	.L2084
	ldr	r1, [r7, #16]
	ldr	r0, [r5, #2808]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r7, #20]
	ldr	r0, [r5, #2808]
	add	r1, r1, #1
	bl	BsGet
	b	.L2084
.L2106:
	mov	r2, r0
	ldr	r1, .L2110+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2111:
	.align	2
.L2110:
	.word	.LC173
	.word	.LC174
	UNWIND(.fnend)
	.size	HEVC_Sei_Buf_Period, .-HEVC_Sei_Buf_Period
	.align	2
	.global	HEVC_Sei_Pic_Timming
	.type	HEVC_Sei_Pic_Timming, %function
HEVC_Sei_Pic_Timming:
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
	add	r3, r0, #8192
	mov	r5, r2
	mov	r6, r1
	mov	r4, r0
	ldr	r1, [r3, #3540]
	ldr	r2, [r3, #3544]
	add	r1, r1, #1
	str	r1, [r3, #3540]
	add	r2, r2, #1
	str	r2, [r3, #3544]
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2140
.L2113:
	ldrh	r3, [r5, #44]
	cmp	r3, #0
	beq	.L2115
	ldr	r1, [r5, #60]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r6, #8]
	ldr	r1, [r5, #64]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #12]
	ldrb	r3, [r5, #46]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2116
.L2119:
	ldr	r2, [r4, #276]
	ldr	r3, .L2143
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L2141
.L2115:
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2140:
	mov	r1, #4
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #2
	str	r0, [r6]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #4]
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L2113
.L2141:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L2115
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L2115
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L2115
.L2116:
	ldr	r1, [r5, #52]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	ldrb	r3, [r5, #46]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2119
	ldrb	r3, [r5, #47]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2119
	ldr	r1, .L2143+4
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	mov	r1, #1
	mov	r7, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r8, r0
	cmp	r8, #0
	bne	.L2142
.L2120:
	cmp	r7, #255
	bhi	.L2124
	add	r7, r7, #1
	mov	r6, #0
	b	.L2123
.L2122:
	cmp	r6, r7
	beq	.L2119
.L2123:
	ldr	r1, .L2143+8
	add	r6, r6, #1
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r8, #0
	bne	.L2122
	ldr	r1, [r5, #48]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	b	.L2122
.L2142:
	ldr	r1, [r5, #48]
	ldr	r0, [r4, #2808]
	add	r1, r1, #1
	bl	BsGet
	b	.L2120
.L2124:
	ldr	r1, .L2143+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2144:
	.align	2
.L2143:
	.word	s_pstVfmwChan
	.word	.LC175
	.word	.LC177
	.word	.LC176
	UNWIND(.fnend)
	.size	HEVC_Sei_Pic_Timming, .-HEVC_Sei_Pic_Timming
	.align	2
	.global	HEVC_Sei_Color_Volume_Reconstruction_Info
	.type	HEVC_Sei_Color_Volume_Reconstruction_Info, %function
HEVC_Sei_Color_Volume_Reconstruction_Info:
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
	beq	.L2155
	ldr	r1, .L2159
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2147
.L2151:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2147:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	beq	.L2158
.L2148:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #2]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #3]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #4]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #5]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #6]
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #7]
	addne	r7, r5, #7
	movne	r6, #0
	beq	.L2153
.L2152:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r7, #15]
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L2152
.L2153:
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #38]
	addne	r7, r5, #38
	movne	r6, #0
	beq	.L2151
.L2154:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r7, #15]
	ldrb	r3, [r5, #38]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L2154
	b	.L2151
.L2155:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2158:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #1]
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L2148
.L2160:
	.align	2
.L2159:
	.word	.LC178
	UNWIND(.fnend)
	.size	HEVC_Sei_Color_Volume_Reconstruction_Info, .-HEVC_Sei_Color_Volume_Reconstruction_Info
	.align	2
	.global	HEVC_Sei_User_Data_Registered_Itu_T_T35
	.type	HEVC_Sei_User_Data_Registered_Itu_T_T35, %function
HEVC_Sei_User_Data_Registered_Itu_T_T35:
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
	mov	r6, r2
	mov	r5, r0
	moveq	r4, #1
	movne	r4, #0
	beq	.L2168
	cmp	r2, #3
	bls	.L2171
	mov	r1, #8
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #2
	beq	.L2172
	cmp	r0, #4
	beq	.L2173
	subs	r6, r6, #4
	beq	.L2167
.L2166:
	add	r4, r4, #1
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r6, r4
	bne	.L2166
.L2167:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2172:
	add	r1, r5, #3536
	mov	r0, r5
	bl	HEVC_Sei_TSI
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2173:
	add	r1, r5, #3536
	mov	r0, r5
	add	r1, r1, #3
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2168:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2171:
	ldr	r1, .L2174
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2175:
	.align	2
.L2174:
	.word	.LC179
	UNWIND(.fnend)
	.size	HEVC_Sei_User_Data_Registered_Itu_T_T35, .-HEVC_Sei_User_Data_Registered_Itu_T_T35
	.align	2
	.global	HEVC_DecShortTermRefPicSet
	.type	HEVC_DecShortTermRefPicSet, %function
HEVC_DecShortTermRefPicSet:
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
	subs	r6, r3, #0
	mov	r5, r0
	mov	r9, r1
	mov	r4, r2
	bne	.L2221
.L2177:
	ldr	r1, .L2230
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4]
	bhi	.L2222
	ldr	r1, .L2230+4
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4, #4]
	bhi	.L2223
	ldr	r6, [r4]
	add	r2, r0, r6
	str	r2, [r4, #8]
	cmp	r2, #16
	bhi	.L2200
	cmp	r6, #0
	addne	r10, r4, #28
	addne	r9, r4, #11
	movne	r7, #0
	movne	r8, r7
	bne	.L2204
	b	.L2202
.L2203:
	str	r8, [r10, #4]!
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r6, [r4]
	cmp	r6, r7
	bls	.L2224
.L2204:
	ldr	r1, .L2230+8
	add	r7, r7, #1
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	mov	r1, #1
	cmp	r0, #32768
	mvn	r3, r0
	add	r8, r8, r3
	bcc	.L2203
	mov	r2, r0
	ldr	r1, .L2230+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2221:
	mov	r1, #1
	ldr	r0, [r0, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L2177
	ldr	r7, [r9, #176]
	cmp	r7, r6
	movne	r0, #0
	beq	.L2225
.L2178:
	sub	r3, r6, #1
	rsb	r8, r0, r3
	cmp	r8, r3
	bhi	.L2226
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r1, .L2230+16
	mov	r6, r0
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	mov	r3, #164
	mul	r8, r3, r8
	mov	r3, r6, asl #1
	rsb	r3, r3, #1
	add	r2, r9, r8
	ldr	r2, [r2, #2172]
	cmp	r2, #16
	mla	r3, r0, r3, r3
	str	r3, [fp, #-56]
	bhi	.L2227
	add	r6, r8, #2192
	mov	r10, #0
	add	r6, r6, #4
	str	r10, [fp, #-48]
	add	r6, r9, r6
	str	r10, [fp, #-52]
	mov	r7, r10
	b	.L2187
.L2182:
	sub	r3, r0, #1
	cmp	r3, #1
	bls	.L2228
.L2183:
	add	r3, r9, r8
	add	r10, r10, #1
	add	r6, r6, #4
	ldr	r3, [r3, #2172]
	cmp	r3, r10
	bcc	.L2229
.L2187:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r0, #0
	bne	.L2182
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r0, r0, asl #1
	sub	r3, r0, #1
	cmp	r3, #1
	bhi	.L2183
.L2228:
	add	r3, r9, r8
	ldr	r2, [fp, #-56]
	add	r1, r4, r7
	add	ip, r7, #8
	ldr	r3, [r3, #2172]
	sub	r0, r0, #1
	clz	r0, r0
	add	r7, r7, #1
	cmp	r3, r10
	mov	r0, r0, lsr #5
	ldrhi	r3, [r6]
	movls	r3, #0
	add	r3, r3, r2
	str	r3, [r4, ip, asl #2]
	cmp	r3, #0
	mov	r3, r1
	strb	r0, [r1, #12]
	ldrlt	r3, [fp, #-52]
	ldrge	r3, [fp, #-48]
	addlt	r3, r3, #1
	addge	r3, r3, #1
	strlt	r3, [fp, #-52]
	strge	r3, [fp, #-48]
	b	.L2183
.L2229:
	ldr	r3, [fp, #-52]
	cmp	r7, #16
	ldr	r2, [fp, #-48]
	str	r7, [r4, #8]
	str	r3, [r4]
	str	r2, [r4, #4]
	bhi	.L2188
	cmp	r3, #16
	bhi	.L2188
	cmp	r2, #16
	bhi	.L2188
	cmp	r7, #1
	subhi	r7, r7, #1
	addhi	r8, r4, #32
	addhi	r6, r4, #12
	movhi	r5, #0
	bls	.L2194
.L2193:
	ldr	ip, [r8, #4]!
	cmp	r5, #0
	ldrb	lr, [r6, #1]!	@ zero_extendqisi2
	mov	r2, r5
	movge	r1, r8
	movge	r3, r6
	blt	.L2196
.L2192:
	ldr	r0, [r1, #-4]!
	sub	r3, r3, #1
	cmp	ip, r0
	strlt	r0, [r1, #4]
	ldrltb	r0, [r3]	@ zero_extendqisi2
	strltb	r0, [r3, #1]
	strlt	ip, [r1]
	strltb	lr, [r3]
	subs	r2, r2, #1
	bpl	.L2192
.L2196:
	add	r5, r5, #1
	cmp	r5, r7
	bne	.L2193
.L2194:
	ldr	r3, [fp, #-52]
	movs	r6, r3, lsr #1
	beq	.L2191
	ldr	r3, [fp, #-52]
	add	r0, r4, #28
	mov	r1, #0
	add	r2, r3, #7
	add	r3, r3, #11
	add	r3, r4, r3
	mov	ip, r0
	add	r2, r4, r2, lsl #2
	add	r4, r4, #12
.L2197:
	ldr	r7, [r2]
	add	r1, r1, #1
	ldr	r5, [ip, #4]!
	cmp	r1, r6
	ldrb	lr, [r4]	@ zero_extendqisi2
	str	r7, [r0, #4]!
	ldrb	r7, [r3]	@ zero_extendqisi2
	strb	r7, [r4], #1
	str	r5, [r2], #-4
	strb	lr, [r3], #-1
	bne	.L2197
.L2191:
	mov	r0, #0
.L2179:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2224:
	ldr	r2, [r4, #8]
.L2202:
	cmp	r2, r6
	bls	.L2191
	add	r8, r6, #7
	add	r9, r6, #11
	add	r9, r4, r9
	mov	r7, #0
	add	r8, r4, r8, lsl #2
.L2205:
	ldr	r1, .L2230+20
	add	r6, r6, #1
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	mov	r1, #1
	add	r0, r0, r1
	add	r7, r7, r0
	str	r7, [r8, #4]!
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r3, [r4, #8]
	cmp	r3, r6
	bhi	.L2205
	b	.L2191
.L2225:
	ldr	r1, .L2230+24
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	add	r2, r0, #1
	cmp	r7, r2
	bcs	.L2178
	mov	r3, r7
	ldr	r1, .L2230+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2188:
	ldr	r1, .L2230+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2223:
	ldr	r2, [r4]
	mov	r0, #1
	ldr	r1, .L2230+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2226:
	mov	r2, r8
	ldr	r1, .L2230+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2227:
	ldr	r1, .L2230+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2222:
	mov	r2, r0
	ldr	r1, .L2230+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2200:
	mov	r3, #16
	ldr	r1, .L2230+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2179
.L2231:
	.align	2
.L2230:
	.word	.LC186
	.word	.LC188
	.word	.LC191
	.word	.LC192
	.word	.LC183
	.word	.LC193
	.word	.LC180
	.word	.LC181
	.word	.LC185
	.word	.LC189
	.word	.LC182
	.word	.LC184
	.word	.LC187
	.word	.LC190
	UNWIND(.fnend)
	.size	HEVC_DecShortTermRefPicSet, .-HEVC_DecShortTermRefPicSet
	.align	2
	.global	HEVC_DecHrdParam
	.type	HEVC_DecHrdParam, %function
HEVC_DecHrdParam:
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
	mov	r8, r3
	mov	r6, r0
	mov	r9, r1
	moveq	ip, #1
	movne	ip, #0
	beq	.L2254
	cmp	r2, #0
	strb	ip, [r1, #2]
	bne	.L2281
.L2237:
	add	r5, r9, #24
	mov	r7, #0
.L2249:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	uxtb	r4, r0
	cmp	r4, #0
	movne	r3, #0
	strne	r3, [r5]
	beq	.L2282
.L2252:
	ldr	r1, .L2287
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
.L2240:
	ldr	r1, .L2287+4
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	mov	r2, r0
	str	r0, [r5]
.L2241:
	cmp	r2, #31
	bhi	.L2283
.L2242:
	mov	r4, #0
.L2253:
	cmp	r4, #0
	beq	.L2284
	cmp	r4, #1
	beq	.L2279
.L2248:
	add	r4, r4, #1
	cmp	r4, #2
	bne	.L2253
.L2247:
	add	r7, r7, #1
	add	r5, r5, #4
	cmp	r8, r7
	bcs	.L2249
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2283:
	ldr	r1, .L2287+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5]
	b	.L2242
.L2282:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	str	r4, [r5]
	tst	r0, #255
	bne	.L2252
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2240
	ldr	r2, [r5]
	b	.L2241
.L2281:
	mov	r1, #1
	ldr	r0, [r0, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r9]
	ldr	r0, [r6, #2808]
	bl	BsGet
	strb	r0, [r9, #1]
	ldrh	r3, [r9]
	cmp	r3, #0
	beq	.L2237
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r9, #2]
	cmp	r0, #0
	bne	.L2285
.L2235:
	mov	r1, #4
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r6, #2808]
	bl	BsGet
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2286
.L2236:
	mov	r1, #5
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #12]
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #16]
	ldr	r0, [r6, #2808]
	bl	BsGet
	str	r0, [r9, #20]
	b	.L2237
.L2254:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2286:
	mov	r1, #4
	ldr	r0, [r6, #2808]
	bl	BsGet
	b	.L2236
.L2285:
	mov	r1, #8
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #1
	str	r0, [r9, #4]
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r9, #3]
	ldr	r0, [r6, #2808]
	bl	BsGet
	str	r0, [r9, #8]
	b	.L2235
.L2284:
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2256
	mov	r4, #1
.L2279:
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2247
.L2256:
	mov	r10, #0
	b	.L2251
.L2250:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	ldr	r3, [r5]
	cmp	r3, r10
	bcc	.L2248
.L2251:
	ldr	r1, .L2287+12
	add	r10, r10, #1
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2287+16
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2250
	ldr	r1, .L2287+20
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2287+24
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	b	.L2250
.L2288:
	.align	2
.L2287:
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	UNWIND(.fnend)
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
	.align	2
	.type	HEVC_ParseVPSExtension, %function
HEVC_ParseVPSExtension:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 672
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #692)
	sub	sp, sp, #692
	mov	r4, #0
	mov	r5, r1
	str	r0, [fp, #-656]
	str	r1, [fp, #-652]
	mov	r2, #64
	mov	r1, r4
	sub	r0, fp, #496
	str	r4, [fp, #-640]
	sub	r9, fp, #304
	str	r4, [fp, #-636]
	bl	memset
	mov	r1, r4
	mov	r2, #128
	sub	r0, fp, #172
	bl	memset
	add	r3, r5, #16384
	mov	r1, r4
	mov	r2, #64
	sub	r0, fp, #432
	mov	r6, r3
	str	r3, [fp, #-664]
	str	r4, [fp, #-632]
	str	r4, [fp, #-628]
	str	r4, [fp, #-624]
	str	r4, [fp, #-620]
	str	r4, [fp, #-608]
	str	r4, [fp, #-604]
	str	r4, [fp, #-600]
	str	r4, [fp, #-596]
	bl	memset
	mov	r1, r4
	mov	r2, #64
	sub	r0, fp, #368
	bl	memset
	mov	r1, r4
	mov	r2, #64
	mov	r0, r9
	bl	memset
	ldr	r3, .L2803
	add	r0, r5, #12416
	mov	r1, r4
	add	r0, r0, #4
	movw	r2, #12492
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r5, #8]
	cmp	r3, #62
	movge	r3, #62
	cmp	r3, #1
	str	r3, [r6, #152]
	bgt	.L2771
	cmp	r3, #0
	ble	.L2292
	ldr	r3, [fp, #-652]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2772
.L2292:
	ldr	r8, [fp, #-656]
	mov	r1, #1
	sub	r7, fp, #500
	sub	r4, fp, #436
	mov	r5, #0
	ldr	r0, [r8, #2808]
	bl	BsGet
	mov	r6, r0
.L2293:
	mov	r1, #1
	ldr	r0, [r8, #2808]
	bl	BsGet
	str	r0, [r7, #4]!
	cmp	r0, #0
	addne	r5, r5, #1
	cmp	r7, r4
	bne	.L2293
	ands	r3, r6, #255
	str	r3, [fp, #-672]
	movne	r6, #1
	moveq	r6, #0
	rsb	r10, r6, r5
	cmp	r10, #0
	movgt	r8, r9
	movgt	r7, #0
	ble	.L2298
.L2297:
	ldr	r3, [fp, #-656]
	mov	r1, #3
	add	r7, r7, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r7, r10
	add	r0, r0, #1
	str	r0, [r8], #4
	bne	.L2297
.L2298:
	cmp	r5, #0
	addge	r7, r5, #1
	subge	lr, fp, #432
	movge	ip, #0
	movge	r8, #6
	blt	.L2296
.L2306:
	cmp	r5, ip
	movne	r2, #0
	andeq	r2, r6, #1
	cmp	r2, #0
	strne	r8, [lr]
	bne	.L2303
	cmp	ip, #0
	ldrgt	r1, [lr]
	movgt	r0, r9
	ble	.L2303
.L2304:
	add	r2, r2, #1
	ldr	r3, [r0], #4
	cmp	r2, ip
	add	r3, r3, #1
	add	r1, r1, r3
	bne	.L2304
	str	r1, [lr]
.L2303:
	add	ip, ip, #1
	add	lr, lr, #4
	cmp	ip, r7
	bne	.L2306
.L2296:
	cmp	r6, #0
	beq	.L2300
	sub	r3, r5, #1
	sub	r2, fp, #44
	add	r3, r2, r3, lsl #2
	ldr	r2, [r3, #-388]
	rsb	r2, r2, #5
	str	r2, [r3, #-260]
.L2300:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #152]
	cmp	r3, #0
	uxtb	r3, r0
	str	r3, [fp, #-680]
	ldr	r3, [fp, #-652]
	ble	.L2773
	add	r2, r3, #16384
	ldr	r6, [fp, #-656]
	add	r10, r3, #12288
	str	r10, [fp, #-676]
	mov	r1, r2
	mov	r2, #1
	mov	r8, r2
	add	r1, r1, #176
	str	r2, [fp, #-648]
	str	r1, [fp, #-668]
	sub	r1, fp, #112
	str	r1, [fp, #-660]
.L2314:
	ldr	r3, [fp, #-680]
	cmp	r3, #0
	bne	.L2774
	ldr	r3, [fp, #-648]
	ldr	r2, [fp, #-668]
	mov	r0, r3
	str	r3, [r2]
.L2311:
	ldr	r2, [fp, #-672]
	add	r3, r0, #1024
	add	r3, r3, #12
	cmp	r2, #0
	ldr	r2, [fp, #-676]
	add	r3, r2, r3, lsl #2
	ldr	r2, [fp, #-648]
	str	r2, [r3, #132]
	beq	.L2312
	cmp	r5, #0
	ble	.L2316
	ldr	r7, [fp, #-432]
	sub	lr, fp, #432
	ldr	ip, [fp, #-660]
	mov	r2, #0
.L2318:
	ldr	r1, [lr, #4]!
	add	r2, r2, #1
	cmp	r2, r5
	mov	r3, r8, asl r1
	sub	r3, r3, #1
	and	r3, r3, r0
	mov	r3, r3, asr r7
	mov	r7, r1
	str	r3, [ip, #4]!
	bne	.L2318
.L2316:
	ldr	r3, [fp, #-664]
	ldr	r2, [fp, #-648]
	ldr	r1, [fp, #-660]
	ldr	r3, [r3, #152]
	add	r2, r2, #1
	add	r1, r1, #64
	str	r1, [fp, #-660]
	cmp	r3, r2
	ldr	r1, [fp, #-668]
	str	r2, [fp, #-648]
	add	r1, r1, #4
	str	r1, [fp, #-668]
	bge	.L2314
	ldr	r10, [fp, #-676]
.L2315:
	ldr	r3, [fp, #-656]
	mov	r1, #4
	ldr	r0, [r3, #2808]
	bl	BsGet
	ldr	r3, [fp, #-664]
	ldr	r9, [r3, #152]
	cmp	r9, #0
	str	r0, [fp, #-648]
	blt	.L2775
	ldr	r3, [fp, #-652]
	mov	r7, #1
	mov	r5, #0
	add	r8, r3, #16384
	ldr	r3, [fp, #-496]
	add	r8, r8, #168
	str	r8, [fp, #-660]
	str	r3, [fp, #-672]
	add	r3, r9, #1
	str	r3, [fp, #-676]
.L2325:
	ldr	r3, [fp, #-660]
	sub	r2, fp, #496
	str	r2, [fp, #-668]
	mov	lr, r5, asl #4
	ldr	r2, [fp, #-672]
	sub	r1, fp, #368
	ldr	r6, [r3, #4]!
	mov	r0, #0
	mov	ip, r2
	str	r3, [fp, #-660]
	mov	r6, r6, asl #2
	sub	r3, fp, #44
	add	r3, r3, r6
	str	r2, [r3, #-596]
	ldr	r2, [fp, #-668]
	b	.L2321
.L2776:
	ldr	ip, [r2, #4]!
.L2321:
	add	r3, lr, r0
	cmp	ip, #0
	sub	ip, fp, #44
	addne	r0, r0, #1
	add	r3, ip, r3, lsl #2
	add	r1, r1, #4
	ldrne	r3, [r3, #-128]
	strne	r3, [r1, #-4]
	cmp	r2, r4
	bne	.L2776
	ldr	r0, [fp, #-364]
	sub	r3, fp, #44
	add	r6, r3, r6
	cmp	r5, #0
	str	r0, [r6, #-596]
	ble	.L2322
	mov	ip, r8
	mov	r2, #0
	mov	r1, #1
.L2324:
	ldr	r3, [ip, #4]!
	sub	lr, fp, #44
	add	r2, r2, #1
	add	r3, lr, r3, lsl #2
	ldr	r3, [r3, #-596]
	cmp	r0, r3
	moveq	r1, #0
	cmp	r2, r5
	bne	.L2324
	cmp	r1, #0
	addne	r7, r7, #1
.L2322:
	ldr	r3, [fp, #-676]
	add	r5, r5, #1
	cmp	r5, r3
	bne	.L2325
	ldr	r3, [fp, #-648]
	cmp	r3, #0
	ble	.L2326
	cmp	r7, #0
	ble	.L2326
.L2327:
	ldr	r3, [fp, #-652]
	mov	r5, #0
	add	r4, r3, #16384
	add	r4, r4, #160
.L2331:
	ldr	r3, [fp, #-656]
	add	r5, r5, #1
	ldr	r1, [fp, #-648]
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r7, r5
	str	r0, [r4, #4]!
	bgt	.L2331
	ldr	r3, [fp, #-664]
	ldr	r9, [r3, #152]
.L2326:
	cmp	r9, #0
	ble	.L2336
	ldr	r3, [fp, #-652]
	ldr	r8, [fp, #-656]
	add	r5, r3, #12416
	add	r2, r3, #16384
	add	r2, r2, #172
	mov	r3, #1
	mov	r7, r5
	add	r5, r5, #11
	add	r7, r7, #10
	str	r2, [fp, #-672]
	str	r2, [fp, #-668]
	str	r3, [fp, #-648]
	str	r7, [fp, #-660]
.L2335:
	ldr	r3, [fp, #-648]
	cmp	r3, #0
	ldr	r3, [fp, #-668]
	ldr	r2, [r3, #4]!
	str	r2, [fp, #-676]
	str	r3, [fp, #-668]
	ble	.L2566
	ldr	r7, [fp, #-672]
	mov	r6, r2, asl #1
	ldr	r4, [fp, #-660]
	mov	r9, #0
.L2334:
	mov	r1, #1
	ldr	r0, [r8, #2808]
	bl	BsGet
	add	r3, r6, r9
	add	r3, r3, #1040
	add	r7, r7, #4
	add	r3, r3, #4
	add	r3, r10, r3, lsl #2
	uxtb	r0, r0
	strb	r0, [r4, #1]!
	cmp	r0, #0
	addne	r9, r9, #1
	ldrne	r2, [r7, #-4]
	strne	r2, [r3, #132]
	cmp	r5, r4
	bne	.L2334
.L2332:
	ldr	r3, [fp, #-676]
	add	r5, r5, #3
	ldr	r2, [fp, #-648]
	add	r3, r3, #1040
	ldr	r1, [fp, #-660]
	add	r2, r2, #1
	str	r2, [fp, #-648]
	add	r3, r10, r3, lsl #2
	add	r1, r1, #2
	str	r1, [fp, #-660]
	str	r9, [r3, #132]
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #152]
	cmp	r3, r2
	bge	.L2335
.L2336:
	ldr	r3, .L2803
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #608
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [fp, #-664]
	ldr	r9, [r3, #152]
	cmp	r9, #0
	blt	.L2570
	ldr	r3, [fp, #-652]
	mov	r6, #1
	add	r8, r3, #16384
	add	r3, r9, #1
	add	r8, r8, #168
	str	r3, [fp, #-668]
	str	r8, [fp, #-660]
	mov	r3, #0
	str	r3, [fp, #-648]
.L2340:
	ldr	r3, [fp, #-660]
	ldr	r2, [r3, #4]!
	str	r3, [fp, #-660]
	add	r3, r2, #1040
	add	r3, r10, r3, lsl #2
	ldr	r4, [r3, #132]
	cmp	r4, #0
	ble	.L2345
	add	lr, r2, #2064
	sub	r3, fp, #44
	mov	r5, r2, asl #1
	add	lr, lr, #10
	add	r2, r3, r2, lsl #3
	ldr	r3, [fp, #-652]
	mov	ip, #0
	str	r8, [fp, #-672]
	add	lr, r3, lr, lsl #3
.L2344:
	ldr	r3, [lr, #4]!
	sub	r8, fp, #44
	sub	r7, fp, #44
	mov	r0, #1
	add	r1, r5, r3
	add	r7, r7, r3, lsl #3
	add	r1, r8, r1, lsl #2
	str	r6, [r1, #-564]
	ldr	r1, [r2, #-564]
	cmp	r1, #0
	bne	.L2342
	ldr	r0, [r7, #-564]
	adds	r0, r0, #0
	movne	r0, #1
.L2342:
	ldr	r1, [r2, #-560]
	sub	r7, fp, #44
	add	r3, r7, r3, lsl #3
	str	r0, [r2, #-564]
	cmp	r1, #0
	mov	r7, #1
	bne	.L2343
	ldr	r7, [r3, #-560]
	adds	r7, r7, #0
	movne	r7, #1
.L2343:
	add	ip, ip, #1
	str	r7, [r2, #-560]
	cmp	ip, r4
	bne	.L2344
	ldr	r8, [fp, #-672]
.L2345:
	ldr	r3, [fp, #-648]
	ldr	r2, [fp, #-668]
	add	r3, r3, #1
	str	r3, [fp, #-648]
	cmp	r3, r2
	bne	.L2340
	cmp	r9, #0
	movgt	r4, r8
	movgt	lr, #0
	ble	.L2351
.L2349:
	ldr	ip, [r4, #4]!
	mov	r1, #0
	add	r3, ip, #1
	cmp	r3, #1
	mov	ip, ip, asl #2
	bgt	.L2346
	sub	r2, fp, #608
	add	r0, r2, ip
.L2348:
	ldr	r2, [r0, r3, asl #3]
	add	r3, r3, #1
	cmp	r2, #0
	addne	r1, r1, #1
	cmp	r3, #2
	bne	.L2348
.L2346:
	add	lr, lr, #1
	sub	r3, fp, #44
	add	ip, r3, ip
	cmp	lr, r9
	str	r1, [ip, #-588]
	bne	.L2349
.L2351:
	mov	r5, #0
	mov	r0, #1
	mov	r2, r5
.L2350:
	ldr	r3, [r8, #4]!
	sub	r1, fp, #44
	add	ip, r1, r5, lsl #2
	sub	lr, fp, #44
	add	r1, r3, #1040
	add	r3, lr, r3, lsl #2
	add	r1, r10, r1, lsl #2
	ldr	r1, [r1, #132]
	cmp	r1, #0
	bne	.L2353
	ldr	r3, [r3, #-588]
	add	r5, r5, #1
	str	r0, [ip, #-580]
	cmp	r3, #0
	add	r3, r3, #1
	strgt	r3, [ip, #-580]
.L2353:
	add	r2, r2, #1
	cmp	r2, r9
	ble	.L2350
	cmp	r5, #1
	ble	.L2570
	ldr	r3, [fp, #-656]
	ldr	r1, .L2803+4
	ldr	r0, [r3, #2808]
	bl	HEVC_ue_v
	cmp	r0, #1024
	mov	r7, r0
	bge	.L2777
	cmp	r0, #0
	ble	.L2352
	ldr	r8, [fp, #-656]
	mov	r6, #0
	mov	r4, #1
	str	r10, [fp, #-648]
.L2361:
	cmp	r5, #1
	ble	.L2362
	sub	r10, fp, #624
	mov	r9, #1
.L2360:
	ldr	r2, [r10, #4]!
	ldr	r0, [r8, #2808]
	add	r2, r2, #1
	cmp	r2, #1
	bls	.L2571
	mov	r3, #0
.L2359:
	add	r3, r3, #1
	cmp	r2, r4, asl r3
	mov	r1, r3
	bhi	.L2359
	add	r9, r9, #1
	bl	BsGet
	cmp	r9, r5
	bne	.L2360
.L2362:
	add	r6, r6, #1
	cmp	r7, r6
	bne	.L2361
	ldr	r10, [fp, #-648]
.L2352:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	uxtb	r3, r0
	cmp	r3, #0
	bne	.L2363
	ldr	r2, [fp, #-664]
	ldr	r1, [r2, #152]
	cmp	r1, #0
	blt	.L2367
	ldr	r0, [fp, #-652]
	add	r1, r1, #1
	add	r2, r0, #16384
	ldr	r0, [r0, #12]
	add	r2, r2, #200
.L2370:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2370
.L2367:
	ldr	r3, [fp, #-652]
	ldr	r8, [r3, #20]
	cmp	r8, #0
	blt	.L2366
	ldr	r3, [fp, #-652]
	add	r8, r8, #1
	mov	r4, #0
	add	lr, r3, #20480
	add	r6, r3, #8320
	add	lr, lr, #228
	add	r5, r3, #128
.L2369:
	ldr	ip, [r6, #4]!
	cmp	ip, #0
	beq	.L2572
	mov	r2, #0
	mov	r0, r5
	mov	r1, r2
.L2371:
	ldr	r3, [r0, #4]!
	add	r1, r1, #1
	add	r3, r3, #1024
	add	r3, r3, #12
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	add	r3, r3, #1040
	add	r3, r3, #2
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r2, r3
	movlt	r2, r3
	cmp	r1, ip
	bne	.L2371
.L2372:
	add	r4, r4, #1
	str	r2, [lr, #4]!
	cmp	r4, r8
	add	r5, r5, #8
	bne	.L2369
.L2366:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	bne	.L2373
	ldr	r3, [fp, #-664]
	mov	ip, r0
	mov	r1, #7
	ldr	r4, [r3, #152]
	ldr	r3, [fp, #-652]
	cmp	ip, r4
	add	r0, r4, #1
	add	lr, r3, #24576
	add	lr, lr, #236
	bge	.L2387
.L2386:
	add	ip, ip, #1
	cmp	ip, r4
	bgt	.L2383
	mov	r2, lr
	mov	r3, ip
.L2384:
	add	r3, r3, #1
	str	r1, [r2, #4]!
	cmp	r3, r0
	bne	.L2384
.L2383:
	cmp	ip, r4
	add	lr, lr, #12
	blt	.L2386
.L2387:
	ldr	r4, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r1, .L2803+8
	strb	r0, [r10, #134]
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-652]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
	cmp	r0, r4
	str	r0, [fp, #-704]
	ldrge	r5, [fp, #-656]
	blt	.L2392
.L2391:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r3, [fp, #-652]
	sub	r1, fp, #616
	add	r4, r4, #1
	ldr	r3, [r3, #12]
	uxtb	r2, r0
	mov	r0, r5
	bl	HEVC_DecPTL
	ldr	r3, [fp, #-704]
	cmp	r3, r4
	bge	.L2391
.L2392:
	ldr	r3, [fp, #-652]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-664]
	add	r2, r7, r2
	add	r2, r2, #1
	cmp	r2, #1
	str	r2, [r3, #148]
	ble	.L2778
	ldr	r5, [fp, #-656]
	ldr	r1, .L2803+12
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	mov	r1, #2
	mov	r4, r0
	ldr	r0, [r5, #2808]
	bl	BsGet
	movw	r1, #1025
	str	r0, [fp, #-708]
	ldr	r0, [fp, #-664]
	ldr	r3, [r0, #148]
	add	r2, r3, r4
	str	r2, [r0, #156]
	cmp	r2, r1
	bgt	.L2564
	ldr	r1, [fp, #-664]
	cmp	r2, #1
	mvn	r2, #0
	str	r2, [r1, #228]
	ble	.L2394
	ldr	r2, [fp, #-652]
	add	r1, r2, #16384
	add	r0, r2, #12416
	add	r2, r2, #14464
	mov	ip, r1
	add	r2, r2, #14
	add	r1, r1, #232
	str	r2, [fp, #-716]
	str	r1, [fp, #-696]
	mov	r2, #0
	add	r1, r0, #14
	str	r1, [fp, #-692]
	add	r1, ip, #224
	str	r1, [fp, #-712]
	mov	r1, #1
	mov	r8, r2
	mov	r9, r1
	str	r2, [fp, #-700]
	str	r1, [fp, #-684]
.L2427:
	cmp	r3, #2
	ldr	r1, [fp, #-684]
	movgt	r2, #1
	movle	r2, #0
	cmp	r3, r1
	movgt	r2, #0
	cmp	r2, #0
	beq	.L2395
	sub	r2, r3, #1
	ldr	r3, [fp, #-656]
	cmp	r2, #1
	ldr	r0, [r3, #2808]
	bls	.L2574
	mov	r3, #0
.L2397:
	add	r3, r3, #1
	cmp	r2, r9, asl r3
	mov	r1, r3
	bhi	.L2397
.L2396:
	bl	BsGet
	ldr	r3, [fp, #-696]
	str	r0, [r3]
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #148]
.L2398:
	ldr	r2, [fp, #-684]
	cmp	r3, r2
	ldrle	r3, [fp, #-696]
	ldrgt	r3, [fp, #-684]
	ldrle	r3, [r3]
	addle	r3, r3, #1
	str	r3, [fp, #-680]
	ldr	r3, [fp, #-680]
	cmp	r3, #1024
	bge	.L2779
	ldr	r3, [fp, #-708]
	ldr	r1, [fp, #-652]
	sub	r3, r3, #2
	ldr	r0, [fp, #-684]
	clz	r3, r3
	ldr	r2, [r1, #20]
	mov	r3, r3, lsr #5
	cmp	r0, r2
	orrgt	r3, r3, #1
	cmp	r3, #0
	bne	.L2401
	mov	r2, r1
	ldr	r1, [fp, #-680]
	add	ip, r2, r1, lsl #2
	add	ip, ip, #8192
	ldr	r2, [ip, #132]
	cmp	r2, #0
	str	r2, [fp, #-688]
	beq	.L2403
	ldr	r2, [fp, #-692]
	ldr	lr, [fp, #-688]
	ldr	r1, [fp, #-708]
	add	r2, r2, #1
	sub	r0, lr, #1
.L2408:
	cmp	r1, #0
	streqb	r9, [r2]
	beq	.L2405
	cmp	r1, #1
	rsbeq	r4, r0, r3
	clzeq	r4, r4
	moveq	r4, r4, lsr #5
	streqb	r4, [r2]
.L2405:
	add	r3, r3, #1
	add	r2, r2, #1
	cmp	r3, lr
	bne	.L2408
	ldr	r3, [ip, #132]
.L2763:
	str	r3, [fp, #-688]
.L2403:
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #156]
	cmp	r3, #0
	str	r3, [fp, #-676]
	beq	.L2414
	ldr	r3, [fp, #-652]
	add	r3, r3, #132
	str	r3, [fp, #-660]
	ldr	r3, [fp, #-712]
	str	r3, [fp, #-672]
	ldr	r3, [fp, #-716]
	str	r3, [fp, #-648]
	mov	r3, #0
	str	r3, [fp, #-668]
.L2413:
	ldr	r3, [fp, #-672]
	ldr	r2, [fp, #-652]
	ldr	r7, [r3, #4]!
	str	r3, [fp, #-672]
	add	r3, r7, #2080
	add	r3, r3, #1
	add	r3, r2, r3, lsl #2
	ldr	r6, [r3, #4]
	cmp	r6, #0
	beq	.L2417
	ldr	r3, [fp, #-648]
	add	r7, r7, #17
	ldr	r2, [fp, #-652]
	mov	lr, #0
	sub	r5, r3, #2048
	ldr	r4, [fp, #-660]
	sub	r5, r5, #2
	add	r7, r2, r7, lsl #3
	mov	r0, r3
.L2416:
	strb	r8, [r0, #1]!
	ldrb	r3, [r5, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2418
	cmp	lr, #0
	strb	r9, [r0]
	ldr	r3, [r4]
	beq	.L2418
	add	r3, r3, #1024
	ldr	r2, [fp, #-648]
	add	r3, r3, #12
	mov	r1, r7
	add	r2, r2, #1
	add	r3, r10, r3, lsl #2
	ldr	ip, [r3, #132]
	add	ip, r10, ip, lsl #1
.L2420:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	add	r3, r3, #1024
	add	r3, r3, #12
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	add	r3, ip, r3
	ldrb	r3, [r3, #137]	@ zero_extendqisi2
	cmp	r3, #0
	strneb	r9, [r2, #-1]
	cmp	r0, r2
	bne	.L2420
.L2418:
	add	lr, lr, #1
	add	r4, r4, #4
	cmp	lr, r6
	bne	.L2416
.L2417:
	ldr	r2, [fp, #-648]
	ldr	r3, [fp, #-668]
	add	r2, r2, #2
	str	r2, [fp, #-648]
	ldr	r2, [fp, #-676]
	add	r3, r3, #1
	str	r3, [fp, #-668]
	cmp	r2, r3
	ldr	r3, [fp, #-660]
	add	r3, r3, #8
	str	r3, [fp, #-660]
	bne	.L2413
.L2414:
	ldr	r3, [fp, #-688]
	cmp	r3, #0
	beq	.L2411
	ldr	r2, [fp, #-684]
	ldr	r3, [fp, #-688]
	ldr	r1, [fp, #-680]
	add	r3, r3, r2, lsl #1
	ldr	r2, [fp, #-652]
	add	r3, r3, #12416
	ldr	r0, [fp, #-692]
	add	ip, r2, r1, lsl #3
	ldr	lr, [fp, #-700]
	add	r3, r3, #12
	add	ip, ip, #132
	add	r1, r2, r3
	mov	r3, #0
.L2422:
	ldrb	r2, [r0, #1]!	@ zero_extendqisi2
	add	ip, ip, #4
	cmp	r2, #0
	addne	r3, r3, #1
	ldrne	lr, [ip, #-4]
	cmp	r0, r1
	bne	.L2422
	ldr	r2, [fp, #-680]
	mov	r5, #0
	str	r10, [fp, #-660]
	add	r7, r2, #2080
	ldr	r2, [fp, #-692]
	str	lr, [fp, #-700]
	add	r6, r2, #2048
	ldr	r2, [fp, #-704]
	add	r6, r6, #2
	str	r3, [fp, #-648]
	add	r4, r2, #1
	ldr	r2, [fp, #-652]
	add	r7, r2, r7, lsl #2
	mov	r10, r2
.L2426:
	ldrb	r1, [r6, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L2423
	ldr	r1, [r10, #20]
	cmp	r1, #0
	ble	.L2423
	ldr	r3, [fp, #-656]
	cmp	r4, #1
	ldr	r0, [r3, #2808]
	bls	.L2576
	mov	ip, #0
.L2425:
	add	ip, ip, #1
	cmp	r4, r9, asl ip
	mov	r1, ip
	bhi	.L2425
.L2424:
	bl	BsGet
.L2423:
	ldr	r1, [r7, #4]
	add	r5, r5, #1
	cmp	r5, r1
	bcc	.L2426
	ldr	r3, [fp, #-648]
	ldr	r10, [fp, #-660]
	cmp	r3, #1
	beq	.L2780
.L2411:
	ldr	r1, [fp, #-664]
	ldr	r2, [fp, #-684]
	ldr	r0, [fp, #-696]
	ldr	r3, [r1, #156]
	add	r2, r2, #1
	add	r0, r0, #4
	str	r0, [fp, #-696]
	cmp	r3, r2
	ldr	r0, [fp, #-692]
	str	r2, [fp, #-684]
	add	r0, r0, #2
	str	r0, [fp, #-692]
	ble	.L2394
	ldr	r3, [r1, #148]
	b	.L2427
.L2571:
	mov	r1, #0
	add	r9, r9, #1
	bl	BsGet
	cmp	r9, r5
	bne	.L2360
	b	.L2362
.L2312:
	cmp	r5, #0
	ble	.L2316
	ldr	r10, [fp, #-660]
	ldr	r7, [fp, #-672]
.L2317:
	ldr	r1, [r9, r7, asl #2]
	add	r7, r7, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	cmp	r7, r5
	str	r0, [r10, #4]!
	bne	.L2317
	b	.L2316
.L2774:
	mov	r1, #6
	ldr	r0, [r6, #2808]
	bl	BsGet
	ldr	r3, [fp, #-668]
	str	r0, [r3]
	b	.L2311
.L2566:
	mov	r9, #0
	b	.L2332
.L2395:
	ldr	r1, [fp, #-696]
	str	r2, [r1]
	b	.L2398
.L2401:
	ldr	r2, [fp, #-680]
	ldr	r3, [fp, #-652]
	add	r4, r3, r2, lsl #2
	add	r4, r4, #8192
	ldr	r3, [r4, #132]
	cmp	r3, #0
	str	r3, [fp, #-688]
	beq	.L2403
	ldr	r6, [fp, #-692]
	mov	r5, #0
	ldr	r7, [fp, #-656]
.L2404:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	add	r5, r5, #1
	strb	r0, [r6, #1]!
	ldr	r3, [r4, #132]
	cmp	r5, r3
	bcc	.L2404
	b	.L2763
.L2576:
	mov	r1, #0
	b	.L2424
.L2780:
	ldr	r2, [fp, #-700]
	add	r2, r2, #1040
	add	r2, r10, r2, lsl #2
	ldr	r2, [r2, #132]
	cmp	r2, #0
	ble	.L2411
	mov	r1, r3
	ldr	r3, [fp, #-656]
	ldr	r0, [r3, #2808]
	bl	BsGet
	b	.L2411
.L2572:
	mov	r2, ip
	b	.L2372
.L2778:
	movw	r3, #1025
	cmp	r2, r3
	ldr	r3, [fp, #-664]
	str	r2, [r3, #156]
	mvnle	r3, #0
	ldrle	r2, [fp, #-664]
	strle	r3, [r2, #228]
	bgt	.L2781
.L2394:
	ldr	r8, [fp, #-656]
	ldr	r1, .L2803+16
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-664]
	cmp	r0, #255
	mov	r2, r0
	str	r0, [r3, #160]
	bhi	.L2561
	ldr	r3, [fp, #-652]
	mov	r5, #0
	add	r7, r3, #24576
	add	r7, r7, #252
	mov	r6, r7
	b	.L2441
.L2431:
	cmp	r9, #0
	beq	.L2435
	ldr	r3, [r9, #12]
	str	r3, [r4, #12]
	ldrb	r3, [r9]	@ zero_extendqisi2
	strb	r3, [r4]
	ldr	r3, [r9, #16]
	str	r3, [r4, #16]
	ldr	r3, [r9, #20]
	str	r3, [r4, #20]
.L2435:
	mov	r1, #1
	ldr	r0, [r8, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	bne	.L2782
	str	r0, [r4, #24]
	str	r0, [r4, #28]
	str	r0, [r4, #32]
	str	r0, [r4, #36]
.L2437:
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #20]
	cmp	r2, #8
	bhi	.L2439
	cmp	r3, #8
	bls	.L2440
.L2439:
	ldr	r1, .L2803+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #16]
	str	r3, [r4, #20]
.L2440:
	ldr	r3, [fp, #-664]
	add	r5, r5, #1
	add	r6, r6, #40
	ldr	r2, [r3, #160]
	cmp	r5, r2
	bhi	.L2783
.L2441:
	cmp	r5, #1
	subgt	r4, fp, #592
	movgt	r9, r7
	ble	.L2784
.L2430:
	mov	r1, #16
	ldr	r0, [r8, #2808]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #4]
	ldr	r0, [r8, #2808]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #8]
	ldr	r0, [r8, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2431
	mov	r1, #2
	ldr	r0, [r8, #2808]
	bl	BsGet
	cmp	r0, #3
	str	r0, [r4, #12]
	beq	.L2785
	cmp	r9, #0
	streqb	r9, [r4]
	ldrneb	r3, [r9]	@ zero_extendqisi2
	strneb	r3, [r4]
.L2433:
	mov	r1, #4
	ldr	r0, [r8, #2808]
	bl	BsGet
	mov	r1, #4
	str	r0, [r4, #16]
	ldr	r0, [r8, #2808]
	bl	BsGet
	str	r0, [r4, #20]
	b	.L2435
.L2804:
	.align	2
.L2803:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC202
	.word	.LC204
	.word	.LC205
	.word	.LC232
	.word	.LC213
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC212
	.word	.LC217
	.word	.LC215
	.word	.LC216
	.word	.LC214
	.word	.LC207
	.word	.LC201
	.word	.LC206
	.word	.LC218
	.word	.LC219
	.word	.LC220
	.word	.LC221
	.word	.LC223
	.word	.LC225
	.word	.LC224
	.word	.LC226
	.word	.LC228
	.word	.LC229
	.word	.LC231
	.word	.LC230
	.word	.LC233
	.word	.LC208
	.word	.LC203
	.word	.LANCHOR0+616
.L2782:
	ldr	r1, .L2803+24
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2803+28
	str	r0, [r4, #24]
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2803+32
	str	r0, [r4, #28]
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2803+36
	str	r0, [r4, #32]
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	str	r0, [r4, #36]
	b	.L2437
.L2784:
	cmp	r5, #0
	mov	r4, r6
	subne	r9, r6, #40
	moveq	r9, r5
	b	.L2430
.L2783:
	cmp	r2, #0
	bne	.L2786
	ldr	r3, [fp, #-652]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ble	.L2445
.L2562:
	ldr	r1, [fp, #-652]
	add	r0, r1, #16384
	mov	r1, #0
	add	r0, r0, #184
	mov	ip, r1
.L2444:
	add	r1, r1, #1
	str	ip, [r0, #4]!
	cmp	r1, r3
	blt	.L2444
.L2443:
	cmp	r2, #0
	beq	.L2445
	ldr	r2, [fp, #-664]
	adds	r4, r3, #0
	movne	r4, #1
	ldr	r2, [r2, #152]
	cmp	r4, r2
	bgt	.L2452
	add	r5, r4, #4096
	ldr	r3, [fp, #-652]
	add	r5, r5, #46
	ldr	r7, [fp, #-664]
	mov	r6, #1
	add	r5, r3, r5, lsl #2
.L2451:
	ldr	r2, [r7, #160]
	ldr	r3, [fp, #-656]
	add	r2, r2, #1
	cmp	r2, #1
	ldr	r0, [r3, #2808]
	bls	.L2578
	mov	r3, #0
.L2450:
	add	r3, r3, #1
	cmp	r2, r6, asl r3
	mov	r1, r3
	bhi	.L2450
.L2449:
	bl	BsGet
	add	r4, r4, #1
	str	r0, [r5, #4]!
	ldr	r3, [r7, #152]
	cmp	r3, r4
	bge	.L2451
.L2452:
	ldr	r4, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r10, #133]
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #152]
	cmp	r3, #0
	ble	.L2448
	ldr	r3, [fp, #-652]
	mov	r6, #1
	ldr	r7, [fp, #-664]
	add	r5, r3, #16384
	add	r4, r3, #12416
	add	r5, r5, #172
	add	r4, r4, #8
.L2457:
	ldr	r3, [r5, #4]!
	add	r6, r6, #1
	add	r3, r3, #1040
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r3, #0
	bne	.L2456
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	strb	r0, [r4]
.L2456:
	ldr	r3, [r7, #152]
	add	r4, r4, #1
	cmp	r3, r6
	bge	.L2457
.L2448:
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #156]
	cmp	r3, #1
	bls	.L2455
	ldr	r3, [fp, #-652]
	ldr	r7, [fp, #-656]
	add	r2, r3, #14464
	add	r1, r3, #16384
	mov	r8, r3
	add	r2, r2, #16
	str	r10, [fp, #-648]
	str	r2, [fp, #-672]
	add	r2, r1, #232
	str	r2, [fp, #-684]
	mov	r2, #1
	str	r2, [fp, #-676]
.L2469:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	ldr	r3, [fp, #-664]
	ldr	r2, [fp, #-676]
	mov	r6, #0
	ldr	r3, [r3, #148]
	cmp	r3, r2
	ldrls	r3, [fp, #-684]
	ldrhi	r3, [fp, #-676]
	ldrls	r3, [r3]
	addls	r3, r3, #1
	add	r1, r3, #2064
	add	r2, r8, r3, lsl #3
	add	r3, r8, r3, lsl #2
	add	r2, r2, #132
	str	r3, [fp, #-680]
	str	r2, [fp, #-688]
	add	r2, r1, #8
	str	r2, [fp, #-668]
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [fp, #-660]
.L2468:
	ldr	r3, [fp, #-660]
	cmp	r6, #0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	clzeq	r0, r6
	moveq	r0, r0, lsr #5
	bne	.L2787
.L2462:
	cmp	r0, #0
	beq	.L2463
	ldr	r3, [fp, #-680]
	add	r10, r3, #8192
	ldr	r1, [r10, #132]
	cmp	r1, #0
	beq	.L2467
	ldr	r5, [fp, #-688]
	mov	r4, #0
	ldr	r9, [fp, #-672]
.L2464:
	ldrb	r3, [r9, #1]!	@ zero_extendqisi2
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L2465
	ldrb	r3, [r8, #3]	@ zero_extendqisi2
	ldr	r1, .L2803+40
	cmp	r3, #0
	bne	.L2466
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L2465
.L2466:
	ldr	r0, [r7, #2808]
	bl	HEVC_ue_v
.L2465:
	ldr	r3, [r10, #132]
	add	r5, r5, #4
	cmp	r4, r3
	bcc	.L2464
.L2467:
	ldr	r1, .L2803+44
	ldr	r0, [r7, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2803+48
	ldr	r0, [r7, #2808]
	bl	HEVC_ue_v
.L2463:
	ldr	r2, [fp, #-668]
	add	r6, r6, #1
	ldr	r3, [fp, #-648]
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #136]
	cmp	r6, r3
	bls	.L2468
	ldr	r3, [fp, #-664]
	ldr	r2, [fp, #-676]
	ldr	r1, [fp, #-672]
	ldr	r3, [r3, #156]
	add	r2, r2, #1
	add	r1, r1, #2
	str	r1, [fp, #-672]
	cmp	r2, r3
	ldr	r1, [fp, #-684]
	str	r2, [fp, #-676]
	add	r1, r1, #4
	str	r1, [fp, #-684]
	bcc	.L2469
	ldr	r10, [fp, #-648]
.L2455:
	ldr	r4, [fp, #-656]
	ldr	r1, .L2803+52
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	mov	r1, #1
	mov	r8, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2788
	ldr	r9, [fp, #-652]
	ldr	r2, [fp, #-664]
	ldrb	r3, [r9, #3]	@ zero_extendqisi2
	ldr	r2, [r2, #152]
	cmp	r3, #0
	movne	r7, #1
	moveq	r7, #2
	cmp	r7, r2
	bgt	.L2470
	mov	r6, r7, asl #1
	add	r8, r8, #2
	add	r5, r6, r7
	add	r5, r5, #12416
	add	r5, r5, #8
	add	r5, r9, r5
.L2479:
	clz	r4, r3
	mov	r4, r4, lsr #5
	cmp	r4, r7
	addlt	r3, r6, #12416
	addlt	r3, r3, #8
	addlt	r3, r3, r4
	addlt	r4, r9, r3
	blt	.L2477
	b	.L2478
.L2476:
	cmp	r4, r5
	beq	.L2478
.L2477:
	ldrb	r3, [r4, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2476
	ldr	r3, [fp, #-656]
	mov	r1, r8
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r4, r5
	bne	.L2477
.L2478:
	ldr	r3, [fp, #-664]
	add	r7, r7, #1
	add	r5, r5, #3
	add	r6, r6, #2
	ldr	r3, [r3, #152]
	cmp	r3, r7
	blt	.L2470
	ldrb	r3, [r9, #3]	@ zero_extendqisi2
	b	.L2479
.L2779:
	str	r3, [sp]
	mov	r2, #1024
	movw	r3, #1658
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r2, .L2803+128
	ldr	r1, .L2803+56
	bl	dprint_vfmw
	mvn	r0, #0
.L2749:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2363:
	ldr	r6, [fp, #-664]
	ldr	r3, [r6, #152]
	cmp	r3, #0
	blt	.L2367
	ldr	r3, [fp, #-652]
	mov	r5, #0
	add	r4, r3, #16384
	add	r4, r4, #200
.L2368:
	ldr	r3, [fp, #-656]
	mov	r1, #3
	add	r5, r5, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	str	r0, [r4, #4]!
	ldr	r3, [r6, #152]
	cmp	r3, r5
	bge	.L2368
	b	.L2367
.L2570:
	mov	r7, #0
	b	.L2352
.L2373:
	ldr	r3, [fp, #-664]
	mov	r9, #0
	ldr	r0, [fp, #-652]
	mov	r8, #7
	str	r10, [fp, #-660]
	mov	r10, r9
	ldr	r3, [r3, #152]
	add	r2, r0, #24576
	str	r7, [fp, #-648]
	add	r2, r2, #240
	mov	r7, r0
	mov	r1, r3
	cmp	r10, r1
	bge	.L2789
.L2380:
	add	r10, r10, #1
	cmp	r1, r10
	blt	.L2376
	sub	r6, r10, #1
	mov	r5, r2
	mov	r4, r10
	str	r2, [fp, #-668]
	mov	r9, r6
	ldr	r6, [fp, #-664]
	b	.L2379
.L2378:
	ldr	r1, [r6, #152]
	add	r4, r4, #1
	add	r5, r5, #4
	cmp	r1, r4
	blt	.L2790
.L2379:
	add	r2, r9, r4, lsl #1
	add	r2, r2, #12416
	add	r2, r2, #9
	ldrb	r2, [r7, r2]	@ zero_extendqisi2
	cmp	r2, #0
	streq	r8, [r5]
	beq	.L2378
	ldr	r3, [fp, #-656]
	mov	r1, #3
	ldr	r0, [r3, #2808]
	bl	BsGet
	str	r0, [r5]
	b	.L2378
.L2790:
	ldr	r2, [fp, #-668]
.L2376:
	cmp	r10, r1
	add	r2, r2, #12
	blt	.L2380
.L2789:
	ldr	r7, [fp, #-648]
	ldr	r10, [fp, #-660]
	b	.L2387
.L2771:
	mov	r0, #1
	ldr	r2, .L2803+128
	str	r0, [sp]
	ldr	r1, .L2803+60
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2781:
	mov	r3, r2
	mov	r4, #0
.L2564:
	str	r3, [sp, #12]
	movw	r1, #1025
	str	r2, [sp]
	movw	r3, #1637
	str	r1, [sp, #4]
	mov	r0, #1
	str	r4, [sp, #8]
	ldr	r2, .L2803+128
	ldr	r1, .L2803+64
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2787:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	b	.L2462
.L2788:
	ldr	r3, [fp, #-656]
	add	r1, r8, #2
	ldr	r0, [r3, #2808]
	bl	BsGet
.L2470:
	ldr	r3, [fp, #-656]
	ldr	r1, .L2803+68
	ldr	r0, [r3, #2808]
	bl	HEVC_ue_v
	subs	r5, r0, #0
	movgt	r4, #1
	ble	.L2483
.L2482:
	ldr	r3, [fp, #-656]
	add	r4, r4, #1
	mov	r1, #8
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r5, r4
	bge	.L2482
.L2483:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	beq	.L2749
	ldr	r4, [fp, #-656]
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L2791
.L2485:
	ldr	r4, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	mov	r8, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	orrs	r3, r0, r8
	mov	r9, r0
	beq	.L2487
	ldr	r3, [fp, #-652]
	ldrb	r4, [r3, #3]	@ zero_extendqisi2
	ldr	r3, [r3, #20]
	clz	r4, r4
	mov	r4, r4, lsr #5
	cmp	r4, r3
	bhi	.L2487
	str	r10, [fp, #-648]
	mov	r5, #0
	ldr	r10, [fp, #-656]
	mov	r7, r5
.L2494:
	mov	r6, #0
	b	.L2493
.L2489:
	cmp	r9, #0
	bne	.L2792
.L2490:
	cmp	r7, #0
	bne	.L2793
.L2491:
	cmp	r5, #0
	bne	.L2794
.L2492:
	ldr	r3, [fp, #-652]
	ldr	r3, [r3, #12]
	cmp	r6, r3
	bhi	.L2795
.L2493:
	cmp	r8, #0
	add	r6, r6, #1
	beq	.L2489
	mov	r1, #1
	ldr	r0, [r10, #2808]
	bl	BsGet
	cmp	r9, #0
	mov	r7, r0
	beq	.L2490
.L2792:
	mov	r1, #1
	ldr	r0, [r10, #2808]
	bl	BsGet
	cmp	r7, #0
	mov	r5, r0
	beq	.L2491
.L2793:
	mov	r1, #16
	ldr	r0, [r10, #2808]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r10, #2808]
	bl	BsGet
	cmp	r5, #0
	beq	.L2492
.L2794:
	mov	r1, #2
	ldr	r0, [r10, #2808]
	bl	BsGet
	mov	r1, #2
	ldr	r0, [r10, #2808]
	bl	BsGet
	ldr	r3, [fp, #-652]
	ldr	r3, [r3, #12]
	cmp	r6, r3
	bls	.L2493
.L2795:
	ldr	r3, [fp, #-652]
	add	r4, r4, #1
	ldr	r3, [r3, #20]
	cmp	r4, r3
	bls	.L2494
	ldr	r10, [fp, #-648]
.L2487:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	subs	r6, r0, #0
	bne	.L2796
	ldr	r3, [fp, #-664]
	ldr	r4, [r3, #152]
.L2496:
	ldr	r7, [fp, #-656]
	mov	r5, #0
.L2497:
	mov	r1, #3
	ldr	r0, [r7, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r7, #2808]
	add	r5, r5, r1
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r7, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r7, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r7, #2808]
	bl	BsGet
	cmp	r5, r4
	bls	.L2497
	cmp	r4, #0
	cmpne	r6, #0
	beq	.L2498
	ldr	r3, [fp, #-652]
	ldr	r5, [fp, #-664]
	ldrb	r4, [r3, #3]	@ zero_extendqisi2
	ldr	r3, [r5, #152]
	clz	r4, r4
	mov	r4, r4, lsr #5
	cmp	r4, r3
	bhi	.L2498
.L2499:
	ldr	r3, [fp, #-656]
	mov	r1, #4
	add	r4, r4, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	ldr	r3, [r5, #152]
	cmp	r4, r3
	bls	.L2499
.L2498:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r0, #0
	bne	.L2563
	sub	r6, fp, #644
	mov	r4, r0
	ldr	r7, [fp, #-656]
	mov	r5, r6
	b	.L2501
.L2500:
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #152]
	cmp	r4, r3
	bhi	.L2797
.L2501:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	add	r4, r4, #1
	uxtb	r0, r0
	strb	r0, [r5], #1
	cmp	r0, #0
	beq	.L2500
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #152]
	cmp	r4, r3
	bls	.L2501
.L2797:
	cmp	r3, #0
	beq	.L2563
	ldr	r3, [fp, #-652]
	mov	r5, #1
	ldr	r8, [fp, #-664]
	add	r4, r3, #16384
	add	r4, r4, #172
.L2503:
	ldr	r2, [r4, #4]!
	add	r3, r2, #1040
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r3, #0
	beq	.L2506
	ldrb	r9, [r6, r5]	@ zero_extendqisi2
	mov	r7, #0
	b	.L2505
.L2504:
	add	r3, r2, #1040
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r7, r3
	bcs	.L2506
.L2505:
	add	r3, r7, r2, lsl #1
	cmp	r9, #0
	add	r3, r3, #1040
	add	r7, r7, #1
	add	r3, r3, #4
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	add	r3, r3, #1024
	add	r3, r3, #12
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	beq	.L2504
	sub	r1, fp, #44
	add	r3, r1, r3
	ldrb	r3, [r3, #-600]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2504
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	ldr	r2, [r4]
	b	.L2504
.L2791:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L2485
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	b	.L2485
.L2796:
	ldr	r3, [fp, #-656]
	mov	r1, #4
	ldr	r0, [r3, #2808]
	bl	BsGet
	mov	r4, r0
	b	.L2496
.L2506:
	ldr	r3, [r8, #152]
	add	r5, r5, #1
	cmp	r5, r3
	bls	.L2503
.L2563:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L2507
.L2511:
	ldr	r4, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L2509
	ldr	r9, [fp, #-664]
	ldr	r3, [r9, #152]
	cmp	r3, #0
	beq	.L2509
	ldr	r3, [fp, #-652]
	mov	r5, #1
	ldr	r8, [fp, #-656]
	mov	r6, #0
	add	r7, r3, #16384
	add	r7, r7, #172
.L2512:
	ldr	r3, [r7, #4]!
	add	r2, r3, #1040
	add	r2, r10, r2, lsl #2
	ldr	r2, [r2, #132]
	cmp	r2, #0
	movne	r4, #0
	bne	.L2518
	b	.L2520
.L2516:
	ldr	r3, [r7]
	add	r2, r3, #1040
	add	r2, r10, r2, lsl #2
	ldr	r2, [r2, #132]
	cmp	r4, r2
	bcs	.L2520
.L2518:
	ldr	r2, [fp, #-652]
	add	r3, r4, r3, lsl #1
	add	r3, r3, #1040
	add	r4, r4, #1
	add	r3, r3, #4
	ldr	r1, .L2803+72
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	add	r3, r10, r3, lsl #2
	cmp	r2, #0
	bne	.L2513
	ldr	r3, [r3, #132]
	cmp	r3, #0
	ble	.L2514
.L2513:
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	mov	r6, r0
.L2514:
	cmp	r6, #0
	beq	.L2516
	mov	r1, #1
	ldr	r0, [r8, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L2516
	ldr	r1, .L2803+76
	ldr	r0, [r8, #2808]
	bl	HEVC_ue_v
	b	.L2516
.L2520:
	ldr	r3, [r9, #152]
	add	r5, r5, #1
	cmp	r5, r3
	bls	.L2512
.L2509:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	cmp	r0, #0
	bne	.L2798
.L2521:
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #152]
	cmp	r3, #0
	beq	.L2560
	ldr	r3, [fp, #-652]
	mov	r5, #1
	ldr	r6, [fp, #-664]
	add	r4, r3, #16384
	add	r4, r4, #172
.L2559:
	ldr	r3, [r4, #4]!
	add	r5, r5, #1
	add	r3, r3, #1040
	add	r3, r10, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r3, #0
	bne	.L2558
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
.L2558:
	ldr	r3, [r6, #152]
	cmp	r5, r3
	bls	.L2559
.L2560:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2798:
	ldr	r2, [fp, #-656]
	mov	r3, #0
	ldr	r1, .L2803+80
	str	r3, [fp, #-552]
	ldr	r0, [r2, #2808]
	str	r3, [fp, #-548]
	str	r3, [fp, #-544]
	str	r3, [fp, #-540]
	str	r3, [fp, #-536]
	str	r3, [fp, #-532]
	str	r3, [fp, #-528]
	str	r3, [fp, #-524]
	str	r3, [fp, #-520]
	str	r3, [fp, #-516]
	str	r3, [fp, #-512]
	str	r3, [fp, #-508]
	str	r3, [fp, #-504]
	str	r3, [fp, #-500]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-652]
	ldr	r5, [r3, #24]
	add	r4, r0, r5
	cmp	r4, #1024
	bhi	.L2522
	cmp	r5, r4
	ldrcc	r6, [fp, #-656]
	bcc	.L2529
	b	.L2530
.L2801:
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r7, r0
.L2526:
	ldr	r1, .L2803+84
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	uxtb	r2, r7
	sub	r1, fp, #552
	mov	ip, r0
	cmp	ip, #7
	mov	r3, r0
	mov	r0, r6
	bhi	.L2799
	bl	HEVC_DecHrdParam
	add	r5, r5, #1
	cmp	r0, #0
	bne	.L2800
	cmp	r4, r5
	bls	.L2530
.L2529:
	cmp	r5, #0
	mov	r1, #1
	bne	.L2801
	mov	r7, #1
	b	.L2526
.L2507:
	ldr	r5, [fp, #-664]
	mov	r4, #0
.L2510:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	add	r4, r4, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	ldr	r3, [r5, #152]
	cmp	r4, r3
	bls	.L2510
	b	.L2511
.L2800:
	ldr	r1, .L2803+88
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2521
.L2799:
	mov	r0, #7
	mov	r2, r5
	str	r0, [sp]
	mov	r0, #1
	ldr	r1, .L2803+92
	bl	dprint_vfmw
	b	.L2521
.L2530:
	cmp	r4, #0
	beq	.L2521
	ldr	r3, [fp, #-664]
	ldr	r3, [r3, #156]
	cmp	r3, #1
	bls	.L2521
	ldr	r3, [fp, #-652]
	mov	r7, #1
	str	r10, [fp, #-660]
	ldr	r10, [fp, #-656]
	add	r2, r3, #8320
	add	r3, r3, #16384
	add	r2, r2, #4
	add	r3, r3, #232
	str	r2, [fp, #-672]
	str	r3, [fp, #-648]
.L2556:
	ldr	r2, [fp, #-672]
	ldr	r1, .L2803+96
	ldr	r0, [r10, #2808]
	ldr	r3, [r2, #4]!
	cmp	r3, #2
	subhi	r3, r3, #1
	str	r2, [fp, #-672]
	movls	r3, #1
	str	r3, [fp, #-240]
	bl	HEVC_ue_v
	cmp	r0, #16
	bhi	.L2534
	add	r3, r0, #1
	str	r3, [fp, #-676]
	cmp	r3, #1
	subhi	r5, fp, #240
	addhi	r3, r5, r0, lsl #2
	strhi	r3, [fp, #-668]
	bls	.L2545
.L2544:
	ldr	r1, .L2803+100
	mov	r6, #0
	ldr	r0, [r10, #2808]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-664]
	ldr	r2, [r3, #148]
	mov	r9, r0
	str	r0, [r5, #4]!
.L2539:
	mov	r8, #0
	b	.L2543
.L2541:
	ldr	r0, [r10, #2808]
	bl	BsGet
	ldr	r3, [fp, #-664]
	ldr	r2, [r3, #148]
.L2543:
	cmp	r2, r7
	mov	r3, r7
	ldr	r0, [fp, #-652]
	mov	r1, #1
	ldrls	r3, [fp, #-648]
	ldrls	r3, [r3]
	addls	r3, r3, #1
	add	r3, r3, #2080
	add	r3, r0, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r8, r3
	add	r8, r8, r1
	bcc	.L2541
	add	r6, r6, r1
	cmp	r9, r6
	bcs	.L2539
	ldr	r3, [fp, #-668]
	cmp	r5, r3
	bne	.L2544
.L2545:
	ldr	r3, [fp, #-676]
	cmp	r3, #0
	beq	.L2537
	ldr	r3, [fp, #-664]
	mov	r8, #0
	mov	r5, #1
	mov	r9, r7
	ldr	r1, [r3, #148]
.L2546:
	mov	r6, #0
	str	r8, [fp, #-668]
.L2555:
	cmp	r1, r9
	ldrls	r3, [fp, #-648]
	movhi	r2, r9
	ldrls	r2, [r3]
	ldr	r3, [fp, #-660]
	addls	r2, r2, #1
	add	r2, r2, #2064
	add	r2, r2, #8
	add	r2, r3, r2, lsl #2
	ldr	r2, [r2, #136]
	cmp	r6, r2
	bhi	.L2802
	ldr	r1, .L2803+104
	ldr	r0, [r10, #2808]
	bl	HEVC_ue_v
	cmp	r0, #31
	bhi	.L2547
	add	r3, r0, #1
	str	r3, [fp, #-684]
	ldr	r3, [fp, #-668]
	sub	r1, fp, #240
	mov	r8, #0
	ldr	r3, [r1, r3, asl #2]
	str	r3, [fp, #-680]
.L2548:
	mov	r7, #0
.L2551:
	cmp	r4, #1
	ldr	r0, [r10, #2808]
	bls	.L2584
	mov	r3, #0
.L2550:
	add	r3, r3, #1
	cmp	r4, r5, asl r3
	mov	r1, r3
	bhi	.L2550
.L2549:
	bl	BsGet
	ldr	r1, .L2803+108
	ldr	r0, [r10, #2808]
	add	r7, r7, #1
	bl	HEVC_ue_v
	ldr	r3, [fp, #-680]
	cmp	r7, r3
	bls	.L2551
	ldr	r3, [fp, #-684]
	add	r8, r8, #1
	cmp	r8, r3
	bne	.L2548
	ldr	r3, [fp, #-664]
	add	r6, r6, #1
	ldr	r1, [r3, #148]
	b	.L2555
.L2584:
	mov	r1, #0
	b	.L2549
.L2547:
	ldr	r8, [fp, #-668]
	mov	r2, r9
	str	r0, [sp, #4]
	mov	r0, #1
	str	r6, [sp]
	mov	r3, r8
	ldr	r1, .L2803+112
	ldr	r10, [fp, #-660]
	bl	dprint_vfmw
.L2538:
	ldr	r1, .L2803+116
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2521
.L2802:
	ldr	r8, [fp, #-668]
	ldr	r3, [fp, #-676]
	add	r8, r8, #1
	cmp	r8, r3
	bne	.L2546
	mov	r7, r9
.L2537:
	ldr	r3, [fp, #-664]
	add	r7, r7, #1
	ldr	r2, [fp, #-648]
	ldr	r3, [r3, #156]
	add	r2, r2, #4
	str	r2, [fp, #-648]
	cmp	r7, r3
	bcc	.L2556
	ldr	r10, [fp, #-660]
	b	.L2521
.L2785:
	mov	r1, #1
	ldr	r0, [r8, #2808]
	bl	BsGet
	strb	r0, [r4]
	b	.L2433
.L2574:
	mov	r1, #0
	b	.L2396
.L2561:
	ldr	r1, .L2803+120
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2777:
	str	r0, [sp]
	mov	r2, #1024
	movw	r3, #1539
	str	r2, [sp, #4]
	ldr	r1, .L2803+124
	mov	r0, #1
	ldr	r2, .L2803+128
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2775:
	ldr	r3, [fp, #-648]
	cmp	r3, #0
	movgt	r7, #1
	bgt	.L2327
	b	.L2326
.L2773:
	add	r10, r3, #12288
	b	.L2315
.L2772:
	ldr	r3, [fp, #-652]
	mov	r2, r4
	sub	r1, fp, #616
	ldr	r0, [fp, #-656]
	ldr	r3, [r3, #12]
	bl	HEVC_DecPTL
	b	.L2292
.L2578:
	mov	r1, #0
	b	.L2449
.L2445:
	ldr	r0, [fp, #-664]
	adds	r3, r3, #0
	movne	r3, #1
	ldr	r1, [r0, #152]
	cmp	r3, r1
	bgt	.L2452
	add	r2, r3, #4096
	ldr	ip, [fp, #-652]
	add	r2, r2, #46
	ldr	r0, [r0, #160]
	add	r1, r1, #1
	add	r2, ip, r2, lsl #2
.L2453:
	cmp	r3, r0
	movcc	ip, r3
	add	r3, r3, #1
	movcs	ip, r0
	cmp	r3, r1
	str	ip, [r2, #4]!
	bne	.L2453
	b	.L2452
.L2786:
	ldr	r3, [fp, #-656]
	mov	r1, #1
	ldr	r0, [r3, #2808]
	bl	BsGet
	ldr	r3, [fp, #-652]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	uxtb	r2, r0
	bgt	.L2562
	b	.L2443
.L2534:
	mov	r3, r0
	mov	r2, r7
	mov	r0, #16
	ldr	r1, .L2805
	str	r0, [sp]
	mov	r0, #1
	ldr	r10, [fp, #-660]
	bl	dprint_vfmw
	b	.L2538
.L2522:
	mov	r2, r4
	mov	r3, #1024
	ldr	r1, .L2805+4
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2521
.L2806:
	.align	2
.L2805:
	.word	.LC227
	.word	.LC222
	UNWIND(.fnend)
	.size	HEVC_ParseVPSExtension, .-HEVC_ParseVPSExtension
	.align	2
	.global	HEVC_ProcessVPS
	.type	HEVC_ProcessVPS, %function
HEVC_ProcessVPS:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r6, r0
	mov	r5, r1
	ldr	r0, [r0, #2808]
	mov	r1, #1
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #3]
	ldr	r0, [r6, #2808]
	bl	BsGet
	uxtb	r2, r0
	cmp	r2, #1
	beq	.L2808
	ldr	r1, .L2873
	mov	r0, #1
	bl	dprint_vfmw
.L2808:
	mov	r1, #6
	ldr	r0, [r6, #2808]
	bl	BsGet
	cmp	r0, #63
	str	r0, [r5, #8]
	bhi	.L2862
	mov	r1, #3
	ldr	r0, [r6, #2808]
	bl	BsGet
	cmp	r0, #7
	str	r0, [fp, #-104]
	bhi	.L2863
	ldr	r3, [fp, #-104]
	mov	r1, #1
	str	r3, [r5, #12]
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #1]
	ldr	r0, [r6, #2808]
	bl	BsGet
	movw	r3, #65535
	cmp	r0, r3
	bne	.L2864
	ldr	r3, [fp, #-104]
	mov	r2, #1
	add	r1, r5, #124
	mov	r0, r6
	bl	HEVC_DecPTL
	subs	r4, r0, #0
	bne	.L2865
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	ldr	r3, [fp, #-104]
	cmp	r3, #0
	addge	r7, r5, #24
	ldrge	r3, [fp, #-104]
	addge	r8, r3, #1
	uxtb	r9, r0
	bge	.L2820
	b	.L2818
.L2817:
	add	r4, r4, #1
	cmp	r4, r8
	beq	.L2818
.L2820:
	ldr	r1, .L2873+4
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2873+8
	add	r0, r0, #1
	str	r0, [r7, #4]!
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2873+12
	str	r0, [r7, #32]
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	cmp	r9, #0
	str	r0, [r7, #64]
	bne	.L2817
	ldr	r3, [fp, #-104]
	add	r2, r4, #1
	cmp	r3, r2
	blt	.L2818
	add	r3, r4, #7
	add	r3, r5, r3, lsl #2
.L2819:
	ldr	r1, [r5, #28]
	add	r2, r2, #1
	cmp	r2, r8
	str	r1, [r3, #4]!
	ldr	r1, [r5, #60]
	str	r1, [r3, #32]
	ldr	r1, [r5, #92]
	str	r1, [r3, #64]
	bne	.L2819
.L2818:
	mov	r1, #6
	ldr	r0, [r6, #2808]
	bl	BsGet
	cmp	r0, #1
	str	r0, [r5, #16]
	bhi	.L2866
	ldr	r3, [r5, #8]
	adds	r0, r0, #0
	sub	r3, r3, #1
	movne	r0, #1
	cmp	r3, #61
	movhi	r0, #0
	cmp	r0, #0
	bne	.L2867
.L2821:
	ldr	r1, .L2873+16
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r5, #20]
	bcs	.L2868
	ldr	r4, .L2873+20
	add	r9, r5, #8320
	add	r9, r9, #4
	mov	r2, #8192
	mov	r1, #0
	add	r0, r5, #132
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r0, r9
	mov	r2, #4096
	mov	r1, #0
	blx	r3
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ble	.L2823
	mov	r8, #1
.L2824:
	mov	r4, #0
	mov	r7, r8, asl #1
	mov	r10, r4
.L2826:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	add	r3, r7, r10
	add	r3, r5, r3, lsl #2
	tst	r0, #255
	strne	r4, [r3, #132]
	ldr	r3, [r5, #16]
	add	r4, r4, #1
	addne	r10, r10, #1
	cmp	r4, r3
	bls	.L2826
	str	r10, [r9, #4]!
	add	r8, r8, #1
	ldr	r3, [r5, #20]
	cmp	r8, r3
	ble	.L2824
.L2823:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2833
	mov	r1, #32
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #32
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2869
.L2830:
	ldr	r1, .L2873+24
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r5, #24]
	bhi	.L2831
	cmp	r0, #0
	ble	.L2833
	ldr	r1, .L2873+28
	mov	r4, #0
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	mov	r0, #1
.L2842:
	uxtb	r2, r0
	sub	r1, fp, #100
	ldr	r3, [fp, #-104]
	mov	r0, r6
	bl	HEVC_DecHrdParam
	add	r4, r4, #1
	ldr	r1, .L2873+28
	cmp	r0, #0
	bne	.L2870
	ldr	r3, [r5, #24]
	cmp	r3, r4
	ble	.L2833
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	cmp	r4, #0
	mov	r0, #1
	beq	.L2842
	mov	r1, r0
	ldr	r0, [r6, #2808]
	bl	BsGet
	b	.L2842
.L2833:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2829
	ldrb	r4, [r6, #1]	@ zero_extendqisi2
	cmp	r4, #1
	bne	.L2838
	b	.L2871
.L2841:
	ldr	r0, [r6, #2808]
	bl	BsGet
.L2838:
	mov	r0, r6
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2841
.L2829:
	mov	r0, #0
.L2859:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2870:
	ldr	r1, .L2873+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2869:
	ldr	r1, .L2873+36
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	b	.L2830
.L2867:
	ldr	r1, .L2873+40
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, #1
	strb	r3, [r6, #1]
	b	.L2821
.L2864:
	ldr	r1, .L2873+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2871:
	ldr	r0, [r6, #2808]
	bl	BsToNextByte
	mov	r1, r5
	mov	r0, r6
	bl	HEVC_ParseVPSExtension
	cmp	r0, #0
	bne	.L2872
	mov	r1, r4
	ldr	r0, [r6, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2829
	b	.L2838
.L2863:
	mov	r2, r0
	ldr	r1, .L2873+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2862:
	mov	r2, r0
	ldr	r1, .L2873+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2865:
	ldr	r1, .L2873+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2868:
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L2873+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2866:
	mov	r2, #1
	ldr	r1, .L2873+64
	mov	r0, r2
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2831:
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L2873+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2872:
	mov	r0, r4
	ldr	r1, .L2873+72
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2859
.L2874:
	.align	2
.L2873:
	.word	.LC234
	.word	.LC239
	.word	.LC240
	.word	.LC241
	.word	.LC244
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC247
	.word	.LC249
	.word	.LC250
	.word	.LC246
	.word	.LC243
	.word	.LC237
	.word	.LC236
	.word	.LC235
	.word	.LC238
	.word	.LC245
	.word	.LC242
	.word	.LC248
	.word	.LC251
	UNWIND(.fnend)
	.size	HEVC_ProcessVPS, .-HEVC_ProcessVPS
	.align	2
	.global	HEVC_DecVPS
	.type	HEVC_DecVPS, %function
HEVC_DecVPS:
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
	ldr	r6, .L2887
	mov	r4, r0
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L2882
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #15
	mov	r7, r0
	bhi	.L2883
	movw	r8, #24912
	ldr	r3, [r4, #2812]
	mul	r5, r8, r0
	add	r2, r3, r5
	ldrb	r10, [r3, r5]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L2884
	str	r0, [r2, #4]
	mov	r0, r4
	ldr	r1, [r4, #2812]
	add	r1, r1, r5
	bl	HEVC_ProcessVPS
	subs	r9, r0, #0
	bne	.L2885
	ldr	r3, [r4, #2812]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2812]
	strb	r2, [r3, r5]
.L2877:
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2884:
	ldr	r6, [r6]
	mov	r2, r8
	ldr	r10, .L2887+4
	mov	r1, #0
	add	r6, r6, #458752
	ldr	r3, [r10, #48]
	mov	r0, r6
	blx	r3
	str	r7, [r6, #4]
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ProcessVPS
	subs	r9, r0, #0
	bne	.L2886
	mov	r3, #1
	strb	r3, [r6, #2]
	strb	r3, [r6]
	mov	r2, r8
	ldr	r0, [r4, #2812]
	mov	r1, r6
	ldr	r3, [r10, #56]
	add	r0, r0, r5
	blx	r3
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2886:
	mov	r2, r7
	ldr	r1, .L2887+8
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_vfmw
	b	.L2877
.L2883:
	ldr	r1, .L2887+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r9, #0
	b	.L2877
.L2885:
	mov	r2, r7
	ldr	r1, .L2887+16
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2812]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2812]
	strb	r10, [r3, r5]
	b	.L2877
.L2882:
	ldr	r2, .L2887+20
	mvn	r9, #0
	ldr	r1, .L2887+24
	bl	dprint_vfmw
	b	.L2877
.L2888:
	.align	2
.L2887:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC253
	.word	.LC252
	.word	.LC254
	.word	.LANCHOR0+640
	.word	.LC72
	UNWIND(.fnend)
	.size	HEVC_DecVPS, .-HEVC_DecVPS
	.align	2
	.global	HEVC_DecVuiParam
	.type	HEVC_DecVuiParam, %function
HEVC_DecVuiParam:
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
	mov	r5, r1
	ldr	r0, [r0, #2808]
	mov	r1, #1
	mov	r6, r2
	bl	BsGet
	tst	r0, #255
	bne	.L2933
.L2891:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2934
.L2893:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2935
.L2895:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2936
.L2897:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #3]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2]
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2898
	ldr	r1, .L2942
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r6, #60]
	cmp	r3, #3
	bhi	.L2937
	ldr	r1, .L2942+4
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2942+8
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2942+12
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
.L2898:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2901
	mov	r1, #32
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #32
	str	r0, [r5, #36]
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r2, [r5, #36]
	cmp	r2, #0
	str	r0, [r5, #40]
	bne	.L2938
.L2902:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2939
.L2903:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L2940
.L2901:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r1, .L2942+16
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #4096
	bcs	.L2941
.L2904:
	ldr	r1, .L2942+20
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2942+24
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2942+28
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r0, [r4, #2808]
	ldr	r1, .L2942+32
	bl	HEVC_ue_v
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2933:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r5, #8]
	bne	.L2891
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	str	r0, [r5, #12]
	ldr	r0, [r4, #2808]
	bl	BsGet
	str	r0, [r5, #16]
	b	.L2891
.L2936:
	ldr	r1, .L2942+36
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L2942+40
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	b	.L2897
.L2935:
	mov	r1, #3
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #20]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5]
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	beq	.L2895
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #24]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #28]
	ldr	r0, [r4, #2808]
	bl	BsGet
	str	r0, [r5, #32]
	b	.L2895
.L2934:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L2893
.L2940:
	ldr	r3, [r6, #52]
	add	r1, r5, #44
	mov	r2, #1
	mov	r0, r4
	bl	HEVC_DecHrdParam
	cmp	r0, #0
	beq	.L2901
	ldr	r1, .L2942+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2939:
	ldr	r1, .L2942+48
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	b	.L2903
.L2938:
	ldr	r3, .L2942+52
	movw	r1, #10000
	umull	r0, r1, r0, r1
	ldr	r3, [r3, #244]
	blx	r3
	movw	r3, #52429
	movt	r3, 52428
	add	r0, r0, #5
	umull	r0, r1, r0, r3
	mov	r3, r1, lsr #3
	str	r3, [r4, #144]
	b	.L2902
.L2941:
	ldr	r1, .L2942+56
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2904
.L2937:
	ldr	r1, .L2942+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2943:
	.align	2
.L2942:
	.word	.LC257
	.word	.LC259
	.word	.LC260
	.word	.LC261
	.word	.LC264
	.word	.LC266
	.word	.LC267
	.word	.LC268
	.word	.LC269
	.word	.LC255
	.word	.LC256
	.word	.LC263
	.word	.LC262
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC265
	.word	.LC258
	UNWIND(.fnend)
	.size	HEVC_DecVuiParam, .-HEVC_DecVuiParam
	.align	2
	.global	HEVC_se_v
	.type	HEVC_se_v, %function
HEVC_se_v:
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
	mov	r1, #32
	mov	r5, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	bls	.L2949
	mvn	r0, #-2147483648
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2949:
	add	r6, r0, #1
	mov	r1, r0
	mov	r0, r5
	bl	BsSkip
	mov	r1, r6
	mov	r0, r5
	bl	BsShow
	mov	r1, r6
	sub	r0, r0, #1
	tst	r0, #1
	mov	r0, r0, asr #1
	addne	r4, r0, #1
	rsbeq	r4, r0, #0
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_se_v, .-HEVC_se_v
	.align	2
	.global	HEVC_Sei_Structure_Of_Pictures_Info
	.type	HEVC_Sei_Structure_Of_Pictures_Info, %function
HEVC_Sei_Structure_Of_Pictures_Info:
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
	ldr	r1, .L2962
	mov	r6, r0
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	ldr	r0, [r6, #2808]
	ldr	r1, .L2962+4
	bl	HEVC_ue_v
	cmp	r0, #1024
	mov	r7, r0
	bhi	.L2951
	cmp	r0, #0
	movne	r4, #0
	beq	.L2957
.L2956:
	mov	r1, #6
	ldr	r0, [r6, #2808]
	bl	BsGet
	mov	r1, #3
	mov	r5, r0
	ldr	r0, [r6, #2808]
	sub	r5, r5, #19
	bl	BsGet
	cmp	r5, #1
	ldr	r1, .L2962+8
	bls	.L2954
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
.L2954:
	cmp	r4, #0
	ldr	r1, .L2962+12
	add	r4, r4, #1
	beq	.L2955
	ldr	r0, [r6, #2808]
	bl	HEVC_se_v
.L2955:
	cmp	r4, r7
	bne	.L2956
.L2957:
	ldr	r0, [r6, #2808]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2951:
	ldr	r1, .L2962+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2963:
	.align	2
.L2962:
	.word	.LC270
	.word	.LC271
	.word	.LC273
	.word	.LC274
	.word	.LC272
	UNWIND(.fnend)
	.size	HEVC_Sei_Structure_Of_Pictures_Info, .-HEVC_Sei_Structure_Of_Pictures_Info
	.align	2
	.global	HEVC_Sei_Recovery_Point
	.type	HEVC_Sei_Recovery_Point, %function
HEVC_Sei_Recovery_Point:
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
	mov	r4, r0
	moveq	r5, #1
	movne	r5, #0
	beq	.L2966
	ldr	r1, .L2967
	ldr	r0, [r0, #2808]
	bl	HEVC_se_v
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2966:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2968:
	.align	2
.L2967:
	.word	.LC275
	UNWIND(.fnend)
	.size	HEVC_Sei_Recovery_Point, .-HEVC_Sei_Recovery_Point
	.align	2
	.global	HEVC_Sei_Color_Remapping_Info
	.type	HEVC_Sei_Color_Remapping_Info, %function
HEVC_Sei_Color_Remapping_Info:
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
	mov	r4, r0
	mov	r8, r1
	beq	.L2986
	ldr	r1, .L2999
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L2971
.L2984:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r8]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2971:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r1, r0
	cmp	r1, #1
	beq	.L2996
.L2972:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2808]
	mov	r7, #3
	bl	BsGet
.L2974:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	beq	.L2977
	add	r6, r0, #1
	mov	r5, #0
.L2976:
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	add	r5, r5, #1
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r5, r6
	bne	.L2976
.L2977:
	subs	r7, r7, #1
	bne	.L2974
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	beq	.L2997
.L2978:
	add	r10, r8, #42
	add	r7, r8, #39
	mov	r9, r10
.L2983:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #32
	bhi	.L2998
	cmp	r0, #0
	beq	.L2985
	mov	r6, r9
	mov	r5, #0
.L2982:
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #16
	add	r5, r5, #1
	strh	r0, [r6, #2]!	@ movhi
	ldr	r0, [r4, #2808]
	bl	BsGet
	strh	r0, [r6, #198]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L2982
.L2985:
	cmp	r10, r7
	add	r9, r9, #66
	bne	.L2983
	b	.L2984
.L2986:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2997:
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	add	r7, r8, #36
	mov	r5, r8
.L2979:
	add	r6, r5, #12
.L2980:
	ldr	r1, .L2999+4
	ldr	r0, [r4, #2808]
	bl	HEVC_se_v
	str	r0, [r5, #4]!
	cmp	r6, r5
	bne	.L2980
	cmp	r5, r7
	bne	.L2979
	b	.L2978
.L2996:
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #1]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L2972
.L2998:
	mov	r2, r0
	ldr	r1, .L2999+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3000:
	.align	2
.L2999:
	.word	.LC276
	.word	.LC277
	.word	.LC278
	UNWIND(.fnend)
	.size	HEVC_Sei_Color_Remapping_Info, .-HEVC_Sei_Color_Remapping_Info
	.align	2
	.global	HEVC_Sei_Payload
	.type	HEVC_Sei_Payload, %function
HEVC_Sei_Payload:
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
	clz	ip, r0
	ldr	r6, [fp, #4]
	mov	r4, r0
	mov	ip, ip, lsr #5
	cmp	r1, #0
	movne	r5, ip
	orreq	r5, ip, #1
	cmp	r5, #0
	bne	.L3027
	ldr	lr, [r0, #2828]
	ldr	lr, [lr, #16]
	cmp	lr, #39
	beq	.L3045
	cmp	r3, #5
	beq	.L3031
	cmp	r3, #132
	beq	.L3032
	cmp	r6, #0
	beq	.L3026
.L3034:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r5, r6
	bne	.L3034
	b	.L3026
.L3031:
	add	r1, r1, #568
	mov	r2, r6
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	bne	.L3027
.L3026:
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_More_Data_In_Payload
	cmp	r0, #0
	bne	.L3035
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3035:
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_Payload_Extension_Present
	cmp	r0, #0
	bne	.L3046
.L3036:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L3037
.L3038:
	ldr	r0, [r4, #2808]
	bl	BsGet
.L3037:
	ldr	r0, [r4, #2808]
	bl	BsIsByteAligned
	mov	r1, #1
	cmp	r0, #0
	beq	.L3038
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3045:
	cmp	r3, #147
	ldrls	pc, [pc, r3, asl #2]
	b	.L3005
.L3007:
	.word	.L3006
	.word	.L3008
	.word	.L3005
	.word	.L3005
	.word	.L3009
	.word	.L3010
	.word	.L3011
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3012
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3013
	.word	.L3005
	.word	.L3014
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3015
	.word	.L3016
	.word	.L3017
	.word	.L3018
	.word	.L3005
	.word	.L3019
	.word	.L3020
	.word	.L3005
	.word	.L3005
	.word	.L3021
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3005
	.word	.L3022
	.word	.L3005
	.word	.L3023
	.word	.L3005
	.word	.L3005
	.word	.L3024
.L3032:
	add	r1, r1, #616
	add	r1, r1, #3
	bl	HEVC_Sei_Decoded_Picture_Hash
	cmp	r0, #0
	beq	.L3026
.L3027:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3046:
	ldr	r1, .L3047
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	b	.L3036
.L3024:
	add	r1, r1, #616
	add	r1, r1, #2
	bl	HEVC_Sei_HLGHDR_Comapitibility_Info
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3006:
	add	r2, r2, #2096
	add	r2, r2, #12
	bl	HEVC_Sei_Buf_Period
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3008:
	add	r2, r2, #2064
	add	r1, r1, #8
	bl	HEVC_Sei_Pic_Timming
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3009:
	add	r1, r1, #56
	mov	r2, r6
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3010:
	add	r1, r1, #568
	mov	r2, r6
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3011:
	add	r1, r1, #568
	bl	HEVC_Sei_Recovery_Point
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3012:
	add	r1, r1, #616
	add	r1, r1, #3
	bl	HEVC_Sei_Tone_Mapping_Info
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3013:
	add	r1, r1, #568
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3014:
	add	r1, r1, #568
	bl	HEVC_Sei_Display_Orientation
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3015:
	add	r1, r1, #616
	mov	r2, r6
	add	r1, r1, #3
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3016:
	add	r1, r1, #568
	bl	HEVC_Sei_Active_Param_sets
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3017:
	add	r2, r2, #2096
	add	r1, r1, #568
	add	r2, r2, #12
	bl	HEVC_Sei_Dec_Unit_Info
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3018:
	add	r1, r1, #568
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3019:
	mov	r3, r6
	bl	HEVC_Sei_Scalable_Nesting
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3020:
	cmn	r1, #568
	movne	r1, #0
	moveq	r1, #1
	orrs	r3, ip, r1
	bne	.L3027
	mov	r1, #1
	ldr	r0, [r0, #2808]
	bl	BsGet
	b	.L3026
.L3021:
	add	r1, r1, #568
	bl	HEVC_Sei_Mastering_Display_Colour_Volume
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3022:
	add	r1, r1, #128
	bl	HEVC_Sei_Color_Remapping_Info
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3023:
	add	r1, r1, #612
	bl	HEVC_Sei_Content_Light_Level_Information
	cmp	r0, #0
	beq	.L3026
	b	.L3027
.L3005:
	cmp	r6, #0
	movne	r5, #0
	beq	.L3026
.L3029:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r5, r6
	bne	.L3029
	b	.L3026
.L3048:
	.align	2
.L3047:
	.word	.LC279
	UNWIND(.fnend)
	.size	HEVC_Sei_Payload, .-HEVC_Sei_Payload
	.align	2
	.global	HEVC_SeiMessage
	.type	HEVC_SeiMessage, %function
HEVC_SeiMessage:
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
	mov	r5, #0
	mov	r4, r0
	mov	r6, r1
	mov	r7, r2
	ldr	r0, [r0, #2808]
	b	.L3050
.L3052:
	bl	BsSkip
	ldr	r0, [r4, #2808]
	add	r5, r5, #255
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #16]
	add	r1, r3, #8
	cmp	r1, r2, asl #3
	bhi	.L3058
.L3050:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2808]
	beq	.L3052
	bl	BsGet
	mov	r8, #0
	mov	r9, r0
	ldr	r0, [r4, #2808]
	b	.L3053
.L3054:
	bl	BsSkip
	ldr	r0, [r4, #2808]
	add	r8, r8, #255
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #16]
	add	r1, r3, #8
	cmp	r1, r2, asl #3
	bhi	.L3059
.L3053:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2808]
	beq	.L3054
	bl	BsGet
	add	r3, r9, r5
	mov	r2, r7
	mov	r1, r6
	add	r8, r0, r8
	mov	r0, r4
	str	r8, [sp]
	bl	HEVC_Sei_Payload
	cmp	r0, #0
	bne	.L3060
.L3051:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3058:
	str	r2, [sp]
	mov	r0, #1
	movw	r2, #5069
	ldr	r1, .L3061
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3059:
	str	r2, [sp]
	mov	r0, #1
	movw	r2, #5090
	ldr	r1, .L3061
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3060:
	ldr	r1, .L3061+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3051
.L3062:
	.align	2
.L3061:
	.word	.LC280
	.word	.LC281
	UNWIND(.fnend)
	.size	HEVC_SeiMessage, .-HEVC_SeiMessage
	.align	2
	.global	HEVC_DecSEI
	.type	HEVC_DecSEI, %function
HEVC_DecSEI:
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
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r3, #1
	beq	.L3069
	ldr	r6, [r0, #2824]
	add	r5, r0, #3472
	add	r5, r5, #8
	cmp	r6, #0
	bne	.L3072
	b	.L3075
.L3067:
	ldr	r0, [r4, #2808]
	bl	BsIsByteAligned
	cmp	r0, #0
	mov	r0, r4
	beq	.L3076
	bl	HEVC_More_Rbsp_Data
	cmp	r0, #0
	beq	.L3077
.L3072:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	beq	.L3067
	ldr	r1, .L3079
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3077:
	ldr	r0, [r4, #2808]
	mov	r1, #8
	bl	BsGet
	cmp	r0, #128
	bne	.L3078
.L3069:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3076:
	ldr	r1, .L3079+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3078:
	mov	r2, r0
	ldr	r1, .L3079+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3075:
	ldr	r1, .L3079+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3080:
	.align	2
.L3079:
	.word	.LC283
	.word	.LC284
	.word	.LC285
	.word	.LC282
	UNWIND(.fnend)
	.size	HEVC_DecSEI, .-HEVC_DecSEI
	.align	2
	.global	HEVC_Sei_Scalable_Nesting
	.type	HEVC_Sei_Scalable_Nesting, %function
HEVC_Sei_Scalable_Nesting:
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
	mov	r4, r0
	mov	r6, r1
	ldr	r0, [r0, #2808]
	mov	r1, #1
	mov	r7, r2
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	tst	r0, #255
	ldr	r0, [r4, #2808]
	beq	.L3082
	bl	BsGet
	ldr	r1, .L3098
	mov	r5, r0
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #63
	mov	r8, r0
	bhi	.L3095
	uxtb	r5, r5
	cmp	r0, r5
	bcc	.L3088
.L3087:
	mov	r1, #3
	ldr	r0, [r4, #2808]
	bl	BsGet
	add	r5, r5, #1
	ldr	r1, .L3098+4
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r8, r5
	bcs	.L3087
.L3088:
	ldr	r0, [r4, #2808]
	bl	BsToNextByte
	b	.L3086
.L3091:
	bl	HEVC_MoreRbspData
	cmp	r0, #0
	beq	.L3096
.L3086:
	mov	r2, r7
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	mov	r0, r4
	beq	.L3091
	ldr	r1, .L3098+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3082:
	bl	BsGet
	uxtb	r5, r0
	cmp	r5, #0
	bne	.L3088
	mov	r1, #3
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r1, .L3098+12
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #63
	addls	r8, r0, #1
	bhi	.L3097
.L3090:
	add	r5, r5, #1
	mov	r1, #6
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r5, r8
	bne	.L3090
	b	.L3088
.L3096:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3095:
	mov	r2, #64
	ldr	r1, .L3098+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3097:
	ldr	r1, .L3098+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3099:
	.align	2
.L3098:
	.word	.LC286
	.word	.LC288
	.word	.LC283
	.word	.LC289
	.word	.LC287
	.word	.LC290
	UNWIND(.fnend)
	.size	HEVC_Sei_Scalable_Nesting, .-HEVC_Sei_Scalable_Nesting
	.align	2
	.global	HEVC_DecScalingListData
	.type	HEVC_DecScalingListData, %function
HEVC_DecScalingListData:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r3, .L3141
	mov	r6, r0
	str	r1, [fp, #-60]
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L3135
	ldr	r3, .L3141+4
	add	r9, r6, #2240
	ldr	r4, [fp, #-60]
	add	r9, r9, #4
	mov	r2, #64
	ldr	r3, [r3, #52]
	add	r1, r4, #1216
	add	r0, r4, #1344
	blx	r3
	add	r3, r4, #1536
	str	r4, [fp, #-64]
	str	r3, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-48]
.L3103:
	ldr	r3, [r9, #4]!
	cmp	r3, #0
	beq	.L3123
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-68]
	ldr	r7, [fp, #-64]
	mov	r3, r2, asl #3
	sub	r3, r3, r2, asl #1
	str	r1, [fp, #-56]
	str	r3, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-52]
.L3122:
	mov	r1, #1
	ldr	r0, [r6, #2808]
	bl	BsGet
	ldr	r5, [r9, #-1888]
	ldr	r3, [fp, #-48]
	cmp	r5, #64
	movge	r5, #64
	cmp	r3, #0
	uxtb	r0, r0
	beq	.L3136
	cmp	r0, #0
	add	r4, r6, #376
	beq	.L3137
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	bls	.L3128
	ldr	r1, .L3141+8
	ldr	r0, [r6, #2808]
	bl	HEVC_se_v
	add	r3, r0, #7
	cmp	r3, #254
	bhi	.L3138
	ldr	r3, [fp, #-56]
	add	r8, r0, #8
	str	r8, [r3]
.L3106:
	cmp	r5, #0
	ble	.L3115
	sub	r4, r4, #4
	mov	r10, #0
	b	.L3119
.L3118:
	mov	r8, r8, lsr #24
	ldr	r2, [r4, #4]!
	add	r3, r3, r8
	cmp	r10, r5
	uxtb	r3, r3
	rsb	r8, r8, r3
	strb	r8, [r7, r2]
	beq	.L3115
.L3119:
	ldr	r1, .L3141+12
	add	r10, r10, #1
	ldr	r0, [r6, #2808]
	bl	HEVC_se_v
	add	r3, r0, r8
	add	r0, r0, #128
	add	r3, r3, #256
	cmp	r0, #255
	mov	r8, r3, asr #31
	bls	.L3118
	ldr	r1, .L3141+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L3133:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3136:
	ldr	r3, .L3141
	cmp	r0, #0
	ldr	r4, [r3]
	add	r4, r4, #65536
	bne	.L3128
	ldr	r1, .L3141+20
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-52]
	cmp	r0, r3
	bhi	.L3125
	ldr	r3, [fp, #-52]
	rsb	r3, r0, r3
	uxtb	r3, r3
.L3110:
	ldr	r2, [fp, #-52]
	cmp	r3, r2
	beq	.L3139
.L3112:
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [fp, #-60]
	add	r1, r2, r3, lsl #6
.L3113:
	cmp	r1, #0
	beq	.L3140
	ldr	r3, .L3141+4
	mov	r2, r5
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
.L3115:
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	cmp	r3, #6
	beq	.L3123
	ldr	r2, [fp, #-56]
	add	r7, r7, #64
	ldr	r3, [r9]
	add	r2, r2, #4
	str	r2, [fp, #-56]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bcc	.L3122
.L3123:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, #4
	ldr	r3, [fp, #-68]
	add	r2, r2, #384
	str	r2, [fp, #-64]
	add	r3, r3, #24
	str	r3, [fp, #-68]
	bne	.L3103
	mov	r0, #0
	b	.L3133
.L3128:
	mov	r8, #8
	b	.L3106
.L3137:
	ldr	r1, .L3141+20
	ldr	r0, [r6, #2808]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-52]
	cmp	r0, r3
	bhi	.L3125
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	rsb	r3, r0, r2
	cmp	r1, #1
	uxtb	r3, r3
	bls	.L3110
	cmp	r2, r3
	ldrne	r2, [fp, #-72]
	moveq	r2, #16
	ldrne	r1, [fp, #-60]
	addne	r2, r2, r3
	addne	r2, r2, #384
	ldrne	r2, [r1, r2, asl #2]
	ldr	r1, [fp, #-56]
	str	r2, [r1]
	ldr	r2, [fp, #-52]
	cmp	r3, r2
	bne	.L3112
.L3139:
	mov	r1, r2
	ldr	r0, [fp, #-48]
	bl	HEVC_GetScalingListDefaultAddress
	mov	r1, r0
	b	.L3113
.L3138:
	ldr	r1, .L3141+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3133
.L3140:
	ldr	r1, .L3141+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3133
.L3125:
	ldr	r1, .L3141+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3133
.L3135:
	ldr	r2, .L3141+36
	ldr	r1, .L3141+40
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3133
.L3142:
	.align	2
.L3141:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC294
	.word	.LC296
	.word	.LC297
	.word	.LC291
	.word	.LC295
	.word	.LC293
	.word	.LC292
	.word	.LANCHOR0+652
	.word	.LC72
	UNWIND(.fnend)
	.size	HEVC_DecScalingListData, .-HEVC_DecScalingListData
	.align	2
	.global	HEVC_ProcessSPS
	.type	HEVC_ProcessSPS, %function
HEVC_ProcessSPS:
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
	mov	r4, r1
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	mov	r5, r0
	cmp	r1, #1
	beq	.L3329
.L3144:
	ldr	r1, .L3357
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #1
	mov	r6, r0
	str	r0, [r4, #60]
	beq	.L3330
	cmp	r6, #3
	bhi	.L3331
	mov	r2, r6
	ldr	r1, .L3357+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L3317:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3331:
	ldr	r1, .L3357+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3329:
	ldr	r3, [r0, #2828]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L3144
	ldrb	r3, [r4, #46]	@ zero_extendqisi2
	cmp	r3, #7
	bne	.L3144
	ldr	r3, [r0, #2812]
	movw	r6, #24912
	ldr	r2, [r4, #48]
	ldr	r0, [r0, #2808]
	mla	r6, r6, r2, r3
	bl	BsGet
	cmp	r0, #0
	bne	.L3332
	ldr	r3, [r5, #2828]
	add	r2, r6, #12288
	ldr	r3, [r3, #24]
	add	r3, r3, #1024
	add	r3, r3, #12
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #132]
	add	r3, r3, #1024
	add	r3, r3, #14
	add	r2, r2, r3, lsl #2
	ldr	r0, [r2, #132]
.L3146:
	cmp	r0, #1
	bhi	.L3333
	mov	r3, r0, asl #5
	add	r6, r6, #12288
	add	r0, r3, r0, lsl #3
	movw	r1, #12540
	add	r0, r6, r0
	movw	lr, #12548
	add	r2, r0, #12544
	add	r3, r0, #12480
	add	r2, r2, #4
	add	r3, r3, #60
	movw	r7, #12556
	add	ip, r0, #12544
	ldr	r2, [r2, #4]
	add	ip, ip, #12
	movw	r6, #12564
	str	r2, [r4, #60]
	ldrb	r2, [r0, r1]	@ zero_extendqisi2
	add	r1, r0, #12544
	add	r1, r1, #20
	strb	r2, [r4, #47]
	add	r2, r0, #12544
	ldr	r3, [r3, #4]
	add	r2, r2, #28
	str	r3, [r4, #64]
	ldr	r3, [r0, lr]
	movw	lr, #12572
	str	r3, [r4, #68]
	ldr	r3, [r0, r7]
	add	r3, r3, #8
	str	r3, [r4, #88]
	ldr	ip, [ip, #4]
	add	ip, ip, #8
	str	ip, [r4, #96]
	ldr	ip, [r0, r6]
	str	ip, [r4, #72]
	ldr	r1, [r1, #4]
	str	r1, [r4, #76]
	ldr	r1, [r0, lr]
	str	r1, [r4, #80]
	ldr	r2, [r2, #4]
	str	r2, [r4, #84]
.L3149:
	str	r3, [r5, #196]
	ldr	r3, [r4, #96]
	ldr	r1, .L3357+12
	str	r3, [r5, #200]
	ldr	r0, [r4, #96]
	ldr	ip, [r4, #88]
	mov	r3, r0, asl #3
	mov	r2, ip, asl #3
	sub	r3, r3, r0, asl #1
	sub	r2, r2, ip, asl #1
	sub	r3, r3, #48
	sub	r2, r2, #48
	str	r3, [r4, #100]
	str	r2, [r4, #92]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #12
	bhi	.L3334
	add	r0, r0, #4
	str	r0, [r4, #116]
	str	r0, [r4, #120]
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3335
.L3176:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r9, #0
	mov	r7, r9
	mov	r6, r4
	mov	r8, r0
	b	.L3184
.L3180:
	ldr	r3, [r4, #52]
	add	r7, r7, #1
	add	r6, r6, #4
	cmp	r3, r7
	bcc	.L3183
.L3184:
	ldr	r1, .L3357+16
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L3357+20
	add	r0, r0, #1
	str	r0, [r6, #328]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L3357+24
	str	r0, [r6, #360]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r6, #328]
	cmp	r9, r3
	movcc	r9, r3
	cmp	r8, #0
	str	r0, [r6, #392]
	bne	.L3180
	ldr	r1, [r4, #52]
	add	r3, r7, #1
	cmp	r3, r1
	addls	r7, r7, #82
	addls	r7, r4, r7, lsl #2
	bhi	.L3183
.L3182:
	ldr	r2, [r4, #328]
	add	r3, r3, #1
	cmp	r3, r1
	str	r2, [r7, #4]!
	ldr	r2, [r4, #360]
	str	r2, [r7, #32]
	ldr	r2, [r4, #392]
	str	r2, [r7, #64]
	bls	.L3182
.L3183:
	ldr	r3, [r4, #184]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r4, #184]
.L3179:
	ldr	r1, .L3357+28
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #3
	mov	r6, r0
	bhi	.L3336
	ldr	r1, .L3357+32
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #3
	mov	r7, r0
	bhi	.L3337
	add	r0, r6, #3
	str	r0, [r4, #124]
	add	r6, r7, r0
	str	r6, [r4, #128]
	sub	r3, r6, #4
	cmp	r3, #2
	bhi	.L3338
	mov	r3, #1
	ldr	r8, [r4, #64]
	mov	r6, r3, asl r6
	mov	r3, r3, asl r0
	str	r6, [r4, #136]
	str	r6, [r4, #140]
	mov	r1, r6
	str	r6, [r4, #144]
	mov	r0, r8
	str	r3, [r4, #132]
	bl	__aeabi_uidivmod
	mov	r0, r8
	cmp	r1, #0
	mov	r1, r6
	beq	.L3188
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L3189:
	ldr	r8, [r4, #68]
	mov	r1, r6
	str	r0, [r4, #188]
	mov	r0, r8
	bl	__aeabi_uidivmod
	mov	r0, r8
	cmp	r1, #0
	mov	r1, r6
	beq	.L3190
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L3191:
	str	r0, [r4, #192]
	ldr	r1, .L3357+36
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #3
	mov	r6, r0
	bhi	.L3339
	ldr	r1, .L3357+40
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #3
	bhi	.L3340
	ldr	r2, [r4, #124]
	add	r3, r6, #2
	str	r3, [r4, #148]
	cmp	r3, r2
	bcs	.L3341
	add	r3, r0, r3
	str	r3, [r4, #152]
	cmp	r3, #5
	bhi	.L3195
	ldr	r2, [r4, #128]
	cmp	r3, r2
	bhi	.L3195
	ldr	r1, .L3357+44
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r4, #128]
	ldr	r2, [r4, #148]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #164]
	bhi	.L3342
	ldr	r1, .L3357+48
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	ip, [r4, #148]
	ldr	r3, [r4, #128]
	rsb	r3, ip, r3
	cmp	r0, r3
	str	r0, [r4, #168]
	bhi	.L3198
	ldr	r1, [r4, #140]
	mov	r0, #1
	mov	r3, #0
	mov	r1, r1, lsr r7
	cmp	r1, r0, asl ip
	bls	.L3200
.L3201:
	add	r3, r3, #1
	add	r2, r3, ip
	cmp	r1, r0, asl r2
	bhi	.L3201
.L3200:
	add	r3, r3, r7
	mov	r1, #1
	str	r3, [r4, #172]
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3]
	cmp	r0, #0
	beq	.L3205
	ldrb	r1, [r5, #1]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L3343
.L3203:
	add	r3, r4, #12288
	mov	r2, #0
	strb	r2, [r3, #372]
.L3236:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #0
	bne	.L3344
.L3205:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #6]
	cmp	r6, #0
	bne	.L3206
	ldr	r2, [r4, #68]
	cmp	r2, #64
	bls	.L3345
.L3206:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #104]
	beq	.L3207
	mov	r1, #4
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #4
	add	r0, r0, #1
	str	r0, [r4, #108]
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r1, .L3357+52
	add	r0, r0, #1
	str	r0, [r4, #112]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #2
	mov	r7, r0
	bhi	.L3346
.L3208:
	ldr	r1, .L3357+56
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #2
	mov	r6, r0
	bhi	.L3347
.L3209:
	add	r0, r7, #3
	str	r0, [r4, #156]
	add	r0, r6, r0
	str	r0, [r4, #160]
	cmp	r0, #5
	bhi	.L3210
	ldr	r3, [r4, #128]
	cmp	r0, r3
	bhi	.L3210
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r4, #7]
.L3207:
	ldr	r1, .L3357+60
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #64
	str	r0, [r4, #176]
	bhi	.L3212
	cmp	r0, #0
	addne	r7, r4, #2160
	movne	r6, #0
	addne	r7, r7, #4
	bne	.L3217
	b	.L3218
.L3216:
	ldr	r3, [r4, #176]
	cmp	r3, r6
	bls	.L3218
.L3217:
	mov	r3, r6
	mov	r2, r7
	mov	r1, r4
	mov	r0, r5
	bl	HEVC_DecShortTermRefPicSet
	add	r6, r6, #1
	add	r7, r7, #164
	cmp	r0, #0
	beq	.L3216
	ldr	r1, .L3357+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3330:
	ldr	r1, .L3357+68
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #8192
	str	r0, [r4, #64]
	bls	.L3151
	ldr	r1, .L3357+72
	mov	r0, r6
.L3322:
	bl	dprint_vfmw
	ldr	r3, .L3357+76
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3320
	mov	r3, #0
	ldr	r0, [r5, #276]
	mov	r2, r3
	mov	r1, #102
	blx	r4
	mvn	r0, #0
	b	.L3317
.L3151:
	ldr	r1, .L3357+80
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #68]
	bhi	.L3348
	ldr	r2, [r4, #428]
	ldr	r3, [r4, #64]
	cmp	r2, #120
	mul	r0, r3, r0
	beq	.L3156
	bgt	.L3157
	cmp	r2, #60
	beq	.L3158
	ble	.L3349
	cmp	r2, #90
	beq	.L3161
	cmp	r2, #93
	beq	.L3162
	cmp	r2, #63
	beq	.L3350
.L3155:
	ldr	r1, .L3357+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3354:
	ldr	r1, .L3357+88
	mov	r0, #1
	bl	dprint_vfmw
.L3320:
	mvn	r0, #0
	b	.L3317
.L3157:
	cmp	r2, #156
	beq	.L3164
	bgt	.L3165
	cmp	r2, #150
	beq	.L3164
	cmp	r2, #153
	beq	.L3164
	cmp	r2, #123
	bne	.L3155
.L3156:
	mov	r2, #557056
	mov	r3, #2228224
.L3163:
	cmp	r0, r2
	movls	r3, #16
	strls	r3, [r4, #184]
	bls	.L3168
	cmp	r0, r3, lsr #1
	movls	r3, #12
	strls	r3, [r4, #184]
	bls	.L3168
	add	r3, r3, r3, lsl #1
	cmp	r0, r3, lsr #2
	movls	r3, #8
	movhi	r3, #6
	str	r3, [r4, #184]
.L3168:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r0, #0
	beq	.L3171
	ldr	r1, .L3357+92
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r4, #60]
	ldr	r6, .L3357+96
	ldr	r1, .L3357+100
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #676]
	mul	r0, r3, r0
	str	r0, [r4, #72]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r2, [r4, #60]
	ldr	r3, [r4, #64]
	ldr	r1, [r4, #72]
	add	r2, r6, r2, lsl #2
	rsb	r3, r1, r3
	ldr	r2, [r2, #676]
	mul	r0, r2, r0
	rsb	r3, r0, r3
	cmp	r3, #0
	str	r0, [r4, #76]
	blt	.L3351
	ldr	r1, .L3357+104
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r4, #60]
	ldr	r1, .L3357+108
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #692]
	mul	r0, r3, r0
	str	r0, [r4, #80]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, [r4, #60]
	ldr	r2, [r4, #80]
	ldr	r3, [r4, #68]
	add	r6, r6, r1, lsl #2
	rsb	r3, r2, r3
	ldr	r2, [r6, #692]
	mul	r0, r2, r0
	rsb	r3, r0, r3
	cmp	r3, #0
	str	r0, [r4, #84]
	blt	.L3352
.L3171:
	ldr	r1, .L3357+112
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #2
	add	r2, r0, #8
	str	r2, [r4, #88]
	bhi	.L3353
	ldr	r1, .L3357+116
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #6
	add	r2, r0, #8
	str	r2, [r4, #96]
	ldrls	r3, [r4, #88]
	bls	.L3149
	ldr	r1, .L3357+120
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3190:
	bl	__aeabi_uidiv
	b	.L3191
.L3188:
	bl	__aeabi_uidiv
	b	.L3189
.L3335:
	ldr	r3, [r5, #2828]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L3176
	ldrb	r3, [r4, #46]	@ zero_extendqisi2
	cmp	r3, #7
	bne	.L3176
	ldr	r3, [r4, #48]
	movw	ip, #24912
	ldr	r0, [r5, #2812]
	mov	r2, #0
	ldr	r9, [r4, #52]
	add	r8, r4, #324
	add	r7, r4, #356
	add	r6, r4, #388
	mla	r0, ip, r3, r0
	mov	r1, r2
	add	lr, r0, #24
	add	ip, r0, #56
	add	r0, r0, #88
.L3178:
	ldr	r3, [lr, #4]!
	add	r1, r1, #1
	cmp	r2, r3
	str	r3, [r8, #4]!
	ldr	r10, [ip, #4]!
	movcc	r2, r3
	cmp	r9, r1
	str	r10, [r7, #4]!
	ldr	r3, [r0, #4]!
	str	r3, [r6, #4]!
	bcs	.L3178
	str	r2, [r4, #184]
	b	.L3179
.L3218:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	beq	.L3215
	ldr	r1, .L3357+124
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #32
	str	r0, [r4, #180]
	bhi	.L3221
	cmp	r0, #0
	addne	r8, r4, #192
	addne	r7, r4, #12
	movne	r6, #0
	beq	.L3215
.L3223:
	ldr	r1, [r4, #116]
	add	r6, r6, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #4]!
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r7, #1]!
	ldr	r3, [r4, #180]
	cmp	r3, r6
	bhi	.L3223
.L3215:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r3, #2
	str	r3, [r4, #2096]
	uxtb	r0, r0
	strb	r0, [r4, #11]
	cmp	r0, #0
	beq	.L3220
	mov	r2, r4
	add	r1, r4, #2064
	mov	r0, r5
	bl	HEVC_DecVuiParam
	cmp	r0, #0
	bne	.L3354
.L3220:
	ldr	r1, [r4, #68]
	ldrb	ip, [r4, #2067]	@ zero_extendqisi2
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #2080]
	mla	ip, ip, r1, r1
	ldr	r0, [r4, #2072]
	ldr	r1, [r4, #2076]
	str	ip, [sp]
	bl	HEVC_GetDar
	str	r0, [r4, #2068]
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	cmp	r6, #1
	movne	r3, #1
	movne	r0, #0
	strneb	r3, [r4]
	bne	.L3317
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	tst	r0, #255
	bne	.L3225
.L3229:
	mov	r0, #0
	b	.L3317
.L3332:
	mov	r1, #8
	ldr	r0, [r5, #2808]
	bl	BsGet
	b	.L3146
.L3345:
	ldr	r1, .L3357+128
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3357+76
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3320
	ldr	r0, [r5, #276]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #102
	blx	r4
	mvn	r0, #0
	b	.L3317
.L3343:
	ldr	r3, [r5, #2828]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L3203
	ldrb	r3, [r4, #46]	@ zero_extendqisi2
	cmp	r3, #7
	bne	.L3203
	ldr	r0, [r5, #2808]
	add	r6, r4, #12288
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #372]
	cmp	r0, #0
	beq	.L3236
	mov	r1, #6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r3, #0
	str	r0, [r6, #376]
	strb	r3, [r4, #4]
	b	.L3205
.L3195:
	ldr	r1, .L3357+132
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3348:
	mov	r0, r6
	ldr	r1, .L3357+136
	b	.L3322
.L3347:
	mov	r2, r0
	ldr	r1, .L3357+140
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3209
.L3346:
	mov	r2, r0
	ldr	r1, .L3357+144
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3208
.L3344:
	add	r1, r4, #432
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	beq	.L3205
	ldr	r1, .L3357+148
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3353:
	ldr	r1, .L3357+152
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3357+76
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3320
	ldr	r1, [r4, #88]
	mov	r2, #0
	ldr	r0, [r5, #276]
	mov	r3, #8
	str	r2, [fp, #-52]
	sub	r2, fp, #52
	str	r1, [fp, #-48]
	mov	r1, #119
	blx	r6
	mvn	r0, #0
	b	.L3317
.L3336:
	ldr	r1, .L3357+156
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3333:
	mov	r2, #1
	ldr	r1, .L3357+160
	mov	r0, r2
	bl	dprint_vfmw
	ldr	r1, .L3357+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3339:
	ldr	r1, .L3357+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3165:
	cmp	r2, #183
	beq	.L3166
	cmp	r2, #186
	beq	.L3166
	cmp	r2, #180
	bne	.L3155
.L3166:
	mov	r2, #8912896
	mov	r3, #35651584
	b	.L3163
.L3349:
	cmp	r2, #0
	beq	.L3160
	cmp	r2, #30
	bne	.L3155
.L3160:
	mov	r2, #9216
	mov	r3, #36864
	b	.L3163
.L3342:
	ldr	r1, .L3357+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3210:
	ldr	r1, .L3357+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3162:
	mov	r2, #245760
	mov	r3, #983040
	b	.L3163
.L3161:
	mov	r2, #138240
	mov	r3, #552960
	b	.L3163
.L3164:
	mov	r2, #2228224
	mov	r3, #8912896
	b	.L3163
.L3158:
	mov	r2, #30720
	mov	r3, #122880
	b	.L3163
.L3350:
	mov	r2, #61440
	mov	r3, #245760
	b	.L3163
.L3334:
	ldr	r1, .L3357+180
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3337:
	ldr	r1, .L3357+184
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3338:
	ldr	r1, .L3357+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3341:
	ldr	r1, .L3357+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3340:
	ldr	r1, .L3357+196
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3198:
	ldr	r1, .L3357+200
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3225:
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	mov	r4, r0
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	uxtb	r7, r0
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r5, #2808]
	bl	BsGet
	tst	r4, #255
	uxtb	r4, r0
	bne	.L3355
.L3226:
	cmp	r7, #0
	bne	.L3356
.L3227:
	cmp	r4, #0
	bne	.L3316
	b	.L3229
.L3230:
	ldr	r0, [r5, #2808]
	bl	BsGet
.L3316:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L3230
	b	.L3229
.L3212:
	mov	r2, #64
	ldr	r1, .L3357+204
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3356:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	b	.L3227
.L3355:
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	b	.L3226
.L3221:
	ldr	r1, .L3357+208
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3351:
	ldr	r1, .L3357+212
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3352:
	ldr	r1, .L3357+216
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3317
.L3358:
	.align	2
.L3357:
	.word	.LC350
	.word	.LC301
	.word	.LC300
	.word	.LC317
	.word	.LC319
	.word	.LC320
	.word	.LC321
	.word	.LC322
	.word	.LC324
	.word	.LC327
	.word	.LC329
	.word	.LC333
	.word	.LC335
	.word	.LC339
	.word	.LC341
	.word	.LC344
	.word	.LC346
	.word	.LC302
	.word	.LC303
	.word	g_event_report
	.word	.LC304
	.word	.LC306
	.word	.LC349
	.word	.LC307
	.word	.LANCHOR0
	.word	.LC308
	.word	.LC310
	.word	.LC311
	.word	.LC313
	.word	.LC315
	.word	.LC316
	.word	.LC347
	.word	.LC338
	.word	.LC332
	.word	.LC305
	.word	.LC342
	.word	.LC340
	.word	.LC337
	.word	.LC314
	.word	.LC323
	.word	.LC298
	.word	.LC299
	.word	.LC328
	.word	.LC334
	.word	.LC343
	.word	.LC318
	.word	.LC325
	.word	.LC326
	.word	.LC331
	.word	.LC330
	.word	.LC336
	.word	.LC345
	.word	.LC348
	.word	.LC309
	.word	.LC312
	UNWIND(.fnend)
	.size	HEVC_ProcessSPS, .-HEVC_ProcessSPS
	.align	2
	.global	HEVC_DecSPS
	.type	HEVC_DecSPS, %function
HEVC_DecSPS:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r10, .L3389
	mov	r4, r0
	ldr	r0, [r10]
	cmp	r0, #0
	beq	.L3381
	ldr	r8, .L3389+4
	mov	r2, #8
	mov	r1, #0
	sub	r0, fp, #60
	ldr	r3, [r8, #48]
	blx	r3
	mov	r1, #4
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r2, [r4, #156]
	cmp	r2, r0
	mov	r9, r0
	bls	.L3382
	ldr	r3, [r4, #2828]
	mov	r1, #3
	ldr	r0, [r4, #2808]
	ldr	r5, [r3, #24]
	cmp	r5, #0
	beq	.L3383
	bl	BsGet
	uxtb	r3, r0
	str	r3, [fp, #-68]
	cmp	r3, #7
	movne	r7, r3
	beq	.L3384
.L3366:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r3, r7
	mov	r2, #1
	sub	r1, fp, #60
	uxtb	r0, r0
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	HEVC_DecPTL
	cmp	r0, #0
	bne	.L3385
.L3367:
	ldr	r1, .L3389+8
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r2, [r4, #160]
	cmp	r0, r2
	mov	r6, r0
	bcs	.L3386
	movw	r3, #12668
	ldr	r2, [r4, #2816]
	mul	r5, r3, r0
	add	r2, r2, r5
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3369
	ldr	r10, [r10]
	movw	r2, #12668
	ldr	r3, [r8, #48]
	mov	r1, #0
	add	r10, r10, #458752
	mov	r0, r10
	blx	r3
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	str	r7, [r10, #52]
	sub	r1, fp, #60
	mov	r2, #8
	str	r9, [r10, #48]
	strb	r3, [r10, #2]
	add	r0, r10, #424
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	strb	r3, [r10, #46]
	ldr	r3, [r8, #52]
	blx	r3
	str	r6, [r10, #56]
	mov	r1, r10
	mov	r0, r4
	bl	HEVC_ProcessSPS
	subs	r7, r0, #0
	bne	.L3387
	mov	r3, #1
	strb	r3, [r10]
	strb	r3, [r10, #1]
	movw	r2, #12668
	ldr	r3, .L3389+4
	mov	r1, r10
	ldr	r0, [r4, #2816]
	ldr	r3, [r3, #56]
	add	r0, r0, r5
	blx	r3
	ldr	r3, [r4, #2816]
	add	r5, r3, r5
	str	r5, [r4, #2824]
.L3380:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3383:
	bl	BsGet
	cmp	r0, #8
	mov	r7, r0
	strls	r5, [fp, #-68]
	bls	.L3366
	mov	r2, #8
	ldr	r1, .L3389+12
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L3380
.L3369:
	str	r9, [r2, #48]
	sub	r1, fp, #60
	ldr	r0, [r4, #2816]
	mov	r2, #8
	str	r3, [fp, #-72]
	add	r0, r0, r5
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	str	r7, [r0, #52]
	ldr	r0, [r4, #2816]
	add	r0, r0, r5
	strb	r3, [r0, #2]
	ldr	r0, [r4, #2816]
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	add	r0, r0, r5
	strb	r3, [r0, #46]
	ldr	r0, [r4, #2816]
	ldr	r7, [r8, #52]
	add	r0, r0, r5
	add	r0, r0, #424
	blx	r7
	ldr	r2, [r4, #2816]
	mov	r0, r4
	add	r2, r2, r5
	str	r6, [r2, #56]
	ldr	r1, [r4, #2816]
	add	r1, r1, r5
	bl	HEVC_ProcessSPS
	ldr	r3, [fp, #-72]
	subs	r7, r0, #0
	bne	.L3388
	ldr	r3, [r4, #2816]
	mov	r2, #1
	mov	r0, r7
	strb	r2, [r3, r5]
	ldr	r3, [r4, #2816]
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2816]
	add	r5, r3, r5
	str	r5, [r4, #2824]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3386:
	ldr	r1, .L3389+16
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #160]
	cmp	r6, r2
	bcc	.L3376
	ldr	r3, .L3389+20
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3376
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r6, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r4, #276]
	mov	r1, #109
	blx	r5
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3376:
	mvn	r7, #0
	b	.L3380
.L3384:
	ldr	r3, [r4, #2828]
	ldr	r7, [r3, #24]
	cmp	r7, #0
	beq	.L3366
	ldr	r2, [r4, #2812]
	movw	r3, #24912
	mla	r3, r3, r9, r2
	ldr	r7, [r3, #12]
	cmp	r7, #0
	moveq	r3, #1
	streq	r3, [fp, #-64]
	ldrneb	r3, [r3, #1]	@ zero_extendqisi2
	strne	r3, [fp, #-64]
	b	.L3367
.L3382:
	ldr	r1, .L3389+24
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L3380
.L3387:
	ldr	r3, [r4, #2816]
	mov	r2, r6
	ldr	r1, .L3389+28
	mov	r0, #1
	add	r5, r3, r5
	str	r5, [r4, #2824]
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L3380
.L3385:
	ldr	r1, .L3389+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L3380
.L3381:
	ldr	r2, .L3389+36
	mvn	r7, #0
	ldr	r1, .L3389+40
	bl	dprint_vfmw
	b	.L3380
.L3388:
	mov	r2, r6
	ldr	r1, .L3389+44
	mov	r0, #1
	str	r3, [fp, #-64]
	bl	dprint_vfmw
	ldr	r2, [r4, #2816]
	mov	r1, #1
	ldr	r3, [fp, #-64]
	mvn	r7, #0
	strb	r1, [r2, r5]
	ldr	r2, [r4, #2816]
	add	r5, r2, r5
	strb	r3, [r5, #1]
	b	.L3380
.L3390:
	.align	2
.L3389:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC354
	.word	.LC352
	.word	.LC355
	.word	g_event_report
	.word	.LC351
	.word	.LC356
	.word	.LC353
	.word	.LANCHOR0+708
	.word	.LC72
	.word	.LC357
	UNWIND(.fnend)
	.size	HEVC_DecSPS, .-HEVC_DecSPS
	.align	2
	.global	HEVC_ProcessPPS
	.type	HEVC_ProcessPPS, %function
HEVC_ProcessPPS:
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
	mov	r4, r1
	mov	r7, #1
	mov	r5, r0
	strb	r7, [r4, #16]
	str	r7, [r4, #68]
	str	r7, [r4, #72]
	ldr	r1, .L3567
	ldr	r0, [r0, #2808]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	blt	.L3392
	ldr	r3, [r5, #160]
	cmp	r0, r3
	bge	.L3392
	ldr	r3, [r5, #2816]
	movw	r6, #12668
	mla	r6, r6, r0, r3
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3541
	mov	r1, r7
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r7
	str	r0, [r4, #36]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #3]
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r1, .L3567+4
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #40]
	cmp	r0, #15
	bhi	.L3542
	ldr	r1, .L3567+8
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #44]
	cmp	r0, #15
	bhi	.L3543
	ldr	r1, .L3567+12
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r3, [r6, #92]
	movw	r2, #65510
	movt	r2, 65535
	rsb	r2, r3, r2
	cmp	r0, #25
	movle	r1, #0
	movgt	r1, #1
	cmp	r0, r2
	movge	r2, r1
	orrlt	r2, r1, #1
	cmp	r2, #0
	bne	.L3544
	add	r0, r0, #26
	mov	r1, r7
	str	r0, [r4, #48]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #6]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	streq	r0, [r4, #52]
	bne	.L3545
.L3401:
	str	r0, [r4, #56]
	ldr	r1, .L3567+16
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #60]
	cmp	r3, #24
	bhi	.L3546
	ldr	r1, .L3567+20
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #64]
	cmp	r3, #24
	bhi	.L3547
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #13]
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #14]
	bne	.L3548
	ldr	r3, [r6, #188]
	strh	r3, [r4, #172]	@ movhi
	ldr	r3, [r6, #192]
	strh	r3, [r4, #212]	@ movhi
.L3441:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	ble	.L3446
.L3440:
	ldr	ip, [r6, #140]
	add	r1, r4, #170
	mov	r3, #0
.L3445:
	ldrsh	r2, [r1, #2]!
	add	r3, r3, #1
	mul	r2, ip, r2
	cmp	r2, #64
	bhi	.L3444
	ldr	lr, [r6, #64]
	cmp	lr, #64
	bhi	.L3549
.L3444:
	cmp	r3, r0
	blt	.L3445
.L3446:
	ldr	r1, [r4, #72]
	cmp	r1, #0
	ble	.L3443
	ldr	r0, [r6, #140]
	ldrsh	r2, [r4, #212]
	mul	r2, r0, r2
	cmp	r2, #63
	addhi	r1, r1, #105
	addhi	r3, r4, #212
	addhi	r1, r4, r1, lsl #1
	bhi	.L3449
	b	.L3447
.L3450:
	ldrsh	r2, [r3, #2]!
	mul	r2, r0, r2
	cmp	r2, #63
	bls	.L3447
.L3449:
	cmp	r3, r1
	bne	.L3450
.L3443:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #0
	bne	.L3550
.L3452:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #21]
	cmp	r0, #0
	beq	.L3455
	add	r1, r4, #256
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	bne	.L3551
.L3455:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r1, .L3567+24
	strb	r0, [r4, #22]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	add	r2, r0, #2
	str	r2, [r4, #84]
	cmp	r2, #1
	ble	.L3456
	ldr	r3, [r6, #128]
	cmp	r2, r3
	bhi	.L3456
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #24]
	cmp	r0, #0
	beq	.L3526
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L3552
.L3481:
	mov	r0, #0
	b	.L3526
.L3545:
	ldr	r1, .L3567+28
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #52]
	bls	.L3401
	mov	r0, r7
	ldr	r1, .L3567+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3548:
	ldr	r1, .L3567+36
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #19
	bhi	.L3553
	add	r0, r0, #1
	ldr	r1, .L3567+40
	str	r0, [r4, #68]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #21
	bhi	.L3554
	ldr	r2, [r4, #68]
	add	r3, r0, #1
	str	r3, [r4, #72]
	cmp	r2, #10
	bgt	.L3555
	cmp	r3, #11
	ble	.L3409
	ldr	r1, .L3567+44
	mov	r2, #11
.L3538:
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3567+48
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3532
.L3534:
	mov	r3, #0
	ldr	r0, [r5, #276]
	mov	r2, r3
	mov	r1, #102
	blx	r4
	mvn	r0, #0
.L3526:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3447:
	ldr	r1, .L3567+52
.L3536:
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3567+48
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L3534
.L3532:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3549:
	ldr	r1, .L3567+56
	b	.L3536
.L3544:
	mov	r2, r0
	add	r3, r3, #26
	mov	r0, r7
	ldr	r1, .L3567+60
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3409:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	ldr	r7, [r4, #68]
	uxtb	r0, r0
	strb	r0, [r4, #15]
	cmp	r0, #0
	bne	.L3423
	cmp	r7, #1
	addgt	r9, r4, #86
	movgt	r8, r0
	bgt	.L3421
	b	.L3556
.L3417:
	strh	r3, [r9, #2]!	@ movhi
	sxth	r3, r3
	cmp	r3, #0
	ldr	r2, [r6, #188]
	blt	.L3419
	cmp	r3, r2
	bhi	.L3419
	ldr	r7, [r4, #68]
	add	r8, r8, #1
	sub	r3, r7, #1
	cmp	r3, r8
	ble	.L3557
.L3421:
	ldr	r1, .L3567+64
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	add	r3, r0, #1
	cmn	r0, #1
	mov	r7, r0
	uxth	r3, r3
	bne	.L3417
	movw	r3, #4749
.L3533:
	ldr	r2, .L3567+68
	mov	r0, #1
	ldr	r1, .L3567+72
	bl	dprint_vfmw
	mov	r0, r7
	b	.L3526
.L3555:
	mov	r3, r2
	ldr	r1, .L3567+76
	mov	r2, #10
	b	.L3538
.L3550:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r7, r0
	strb	r7, [r4, #20]
	cmp	r7, #0
	bne	.L3452
	ldr	r1, .L3567+80
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #76]
	bhi	.L3558
.L3454:
	ldr	r1, .L3567+84
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #80]
	bls	.L3452
	ldr	r1, .L3567+88
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #80]
	b	.L3452
.L3423:
	cmp	r7, #0
	addgt	r3, r4, #170
	movgt	r8, #0
	ble	.L3412
.L3432:
	ldr	r10, [r6, #188]
	add	r8, r8, #1
	mov	r1, r7
	str	r3, [fp, #-48]
	mul	r0, r10, r8
	bl	__aeabi_uidiv
	mov	r1, r7
	mov	r9, r0
	sub	r0, r8, #1
	mul	r0, r10, r0
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-48]
	cmp	r8, r7
	rsb	r0, r0, r9
	strh	r0, [r3, #2]!	@ movhi
	bne	.L3432
.L3412:
	ldr	r10, [r4, #72]
	cmp	r10, #0
	addgt	r3, r4, #210
	movgt	r8, #0
	ble	.L3431
.L3433:
	ldr	r2, [r6, #192]
	add	r8, r8, #1
	mov	r1, r10
	str	r3, [fp, #-52]
	mul	r0, r2, r8
	str	r2, [fp, #-48]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-48]
	mov	r1, r10
	mov	r9, r0
	sub	r0, r8, #1
	mul	r0, r0, r2
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-52]
	cmp	r8, r10
	rsb	r0, r0, r9
	strh	r0, [r3, #2]!	@ movhi
	bne	.L3433
.L3431:
	cmp	r7, #1
	bne	.L3439
	ldr	r0, [r4, #72]
	cmp	r0, #1
	beq	.L3440
.L3439:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r4, #16]
	b	.L3441
.L3392:
	mov	r2, r0
	ldr	r1, .L3567+92
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3541:
	mov	r2, r0
	ldr	r1, .L3567+96
	mov	r0, r7
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3542:
	mov	r0, r7
	ldr	r1, .L3567+100
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3543:
	mov	r0, r7
	ldr	r1, .L3567+104
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3546:
	ldr	r1, .L3567+108
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3547:
	ldr	r1, .L3567+112
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3456:
	ldr	r1, .L3567+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3419:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r8
	ldr	r1, .L3567+120
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3557:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	ble	.L3416
.L3415:
	add	r9, r4, #126
	mov	r8, #0
	b	.L3429
.L3425:
	strh	r3, [r9, #2]!	@ movhi
	sxth	r3, r3
	cmp	r3, #0
	ldr	r2, [r6, #192]
	blt	.L3427
	cmp	r3, r2
	bhi	.L3427
	ldr	r3, [r4, #72]
	add	r8, r8, #1
	sub	r3, r3, #1
	cmp	r3, r8
	ble	.L3559
.L3429:
	ldr	r1, .L3567+124
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	add	r3, r0, #1
	cmn	r0, #1
	mov	r7, r0
	uxth	r3, r3
	bne	.L3425
	movw	r3, #4768
	b	.L3533
.L3552:
	mov	r1, r6
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	mov	r7, r0
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, r6
	uxtb	r8, r0
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r5, #2808]
	bl	BsGet
	tst	r7, #255
	uxtb	r9, r0
	beq	.L3459
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3560
.L3460:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L3464
	ldr	r1, .L3567+128
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L3567+132
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #5
	bgt	.L3462
	cmp	r0, #0
	addge	r7, r0, #1
	movge	r6, #0
	blt	.L3464
.L3466:
	ldr	r1, .L3567+136
	add	r6, r6, #1
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3567+140
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	cmp	r6, r7
	bne	.L3466
.L3464:
	ldr	r1, .L3567+144
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L3567+148
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
.L3459:
	cmp	r8, #0
	beq	.L3458
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #1889]
	cmp	r0, #0
	streq	r0, [r4, #1956]
	bne	.L3561
.L3468:
	ldr	r1, .L3567+152
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	cmp	r0, #63
	bhi	.L3562
	add	r2, r4, #4096
	cmp	r0, #0
	mov	r3, #0
	mov	r1, #8
	str	r3, [r4, #1960]
	str	r3, [r4, #2216]
	str	r3, [r4, #2472]
	str	r3, [r4, #2728]
	str	r3, [r4, #2984]
	str	r3, [r4, #3240]
	str	r3, [r4, #3496]
	str	r3, [r4, #3752]
	str	r3, [r4, #4008]
	str	r3, [r2, #168]
	str	r1, [r2, #424]
	str	r1, [r2, #680]
	beq	.L3479
	add	r0, r0, #1888
	add	r7, r4, #1888
	add	r0, r0, #1
	add	r7, r7, #1
	add	r8, r4, r0
	b	.L3478
.L3472:
	mov	r6, r6, asl #2
	add	r3, r4, r6
	str	r0, [r3, #1960]
	str	r0, [r3, #2216]
	str	r0, [r3, #2472]
	str	r0, [r3, #2728]
.L3473:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	bne	.L3563
	add	r3, r4, r6
	str	r0, [r3, #2984]
	str	r0, [r3, #3240]
	str	r0, [r3, #3496]
	str	r0, [r3, #3752]
.L3475:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #0
	bne	.L3564
	add	r6, r4, r6
	mov	r2, #8
	add	r3, r6, #4096
	str	r0, [r6, #4008]
	str	r0, [r3, #168]
	str	r2, [r3, #424]
	str	r2, [r3, #680]
.L3477:
	cmp	r7, r8
	beq	.L3479
.L3478:
	mov	r1, #6
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r0, #63
	mov	r6, r0
	bgt	.L3565
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	beq	.L3472
	ldr	r1, .L3567+156
	mov	r6, r6, asl #2
	ldr	r0, [r5, #2808]
	add	r10, r4, r6
	bl	HEVC_se_v
	ldr	r1, .L3567+160
	str	r0, [r10, #1960]
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3567+164
	str	r0, [r10, #2216]
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3567+168
	str	r0, [r10, #2472]
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	str	r0, [r10, #2728]
	b	.L3473
.L3479:
	mov	r1, #1
	ldr	r0, [r5, #2808]
	bl	BsGet
.L3458:
	cmp	r9, #0
	bne	.L3525
	b	.L3481
.L3482:
	ldr	r0, [r5, #2808]
	bl	BsGet
	strb	r0, [r4, #25]
.L3525:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L3482
	b	.L3481
.L3564:
	ldr	r1, .L3567+172
	add	r6, r4, r6
	ldr	r0, [r5, #2808]
	add	r10, r6, #4096
	bl	HEVC_ue_v
	ldr	r1, .L3567+176
	str	r0, [r6, #4008]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L3567+180
	str	r0, [r10, #168]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	ldr	r1, .L3567+184
	str	r0, [r10, #424]
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	str	r0, [r10, #680]
	b	.L3477
.L3563:
	ldr	r1, .L3567+188
	add	r10, r4, r6
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3567+192
	str	r0, [r10, #2984]
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3567+196
	str	r0, [r10, #3240]
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3567+200
	str	r0, [r10, #3496]
	ldr	r0, [r5, #2808]
	bl	HEVC_se_v
	str	r0, [r10, #3752]
	b	.L3475
.L3560:
	ldr	r1, .L3567+204
	ldr	r0, [r5, #2808]
	bl	HEVC_ue_v
	b	.L3460
.L3565:
	mov	r2, r0
	mov	r3, #64
	ldr	r1, .L3567+208
	mov	r0, #1
	bl	dprint_vfmw
.L3465:
	ldr	r2, [r4, #84]
	mov	r0, #1
	ldr	r1, .L3567+212
	bl	dprint_vfmw
	b	.L3532
.L3553:
	mov	r2, r0
	mov	r3, #20
	ldr	r1, .L3567+216
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3561:
	mov	r1, #6
	ldr	r0, [r5, #2808]
	bl	BsGet
	cmp	r0, #1
	mov	r2, r0
	str	r0, [r4, #1956]
	ble	.L3468
	mov	r3, #2
	ldr	r1, .L3567+220
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3465
.L3558:
	ldr	r1, .L3567+224
	mov	r0, #1
	bl	dprint_vfmw
	str	r7, [r4, #76]
	b	.L3454
.L3427:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r8
	ldr	r1, .L3567+228
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3554:
	mov	r2, r0
	mov	r3, #22
	ldr	r1, .L3567+232
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3559:
	ldr	r7, [r4, #68]
.L3416:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3423
.L3424:
	sub	r2, r7, #1
	ldrh	r3, [r6, #188]
	add	ip, r4, r7, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #170]	@ movhi
	ble	.L3434
	add	r8, r7, #42
	add	r1, r4, #86
	add	lr, r4, #170
	add	r8, r4, r8, lsl #1
.L3435:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #170]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #170]	@ movhi
	bne	.L3435
.L3434:
	sxth	r3, r3
	cmp	r3, #0
	ble	.L3566
	ldr	r1, [r4, #72]
	ldrh	r3, [r6, #192]
	sub	r2, r1, #1
	add	ip, r4, r1, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #210]	@ movhi
	ble	.L3437
	add	r8, r1, #62
	add	lr, r4, #210
	add	r1, r4, #126
	add	r8, r4, r8, lsl #1
.L3438:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #210]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #210]	@ movhi
	bne	.L3438
.L3437:
	sxth	r3, r3
	cmp	r3, #0
	bgt	.L3431
	ldr	r1, .L3567+236
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3551:
	ldr	r1, .L3567+240
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3556:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	bgt	.L3415
	b	.L3424
.L3462:
	mov	r2, r0
	ldr	r1, .L3567+244
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3465
.L3566:
	ldr	r1, .L3567+248
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3526
.L3562:
	mov	r2, r0
	mov	r3, #64
	ldr	r1, .L3567+252
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3465
.L3568:
	.align	2
.L3567:
	.word	.LC358
	.word	.LC361
	.word	.LC363
	.word	.LC365
	.word	.LC369
	.word	.LC371
	.word	.LC393
	.word	.LC367
	.word	.LC368
	.word	.LC373
	.word	.LC375
	.word	.LC378
	.word	g_event_report
	.word	.LC387
	.word	.LC386
	.word	.LC366
	.word	.LC379
	.word	.LANCHOR0+720
	.word	.LC380
	.word	.LC377
	.word	.LC388
	.word	.LC390
	.word	.LC391
	.word	.LC359
	.word	.LC360
	.word	.LC362
	.word	.LC364
	.word	.LC370
	.word	.LC372
	.word	.LC394
	.word	.LC381
	.word	.LC382
	.word	.LC398
	.word	.LC399
	.word	.LC401
	.word	.LC402
	.word	.LC396
	.word	.LC397
	.word	.LC404
	.word	.LC407
	.word	.LC408
	.word	.LC409
	.word	.LC410
	.word	.LC415
	.word	.LC416
	.word	.LC417
	.word	.LC418
	.word	.LC411
	.word	.LC412
	.word	.LC413
	.word	.LC414
	.word	.LC395
	.word	.LC406
	.word	.LC419
	.word	.LC374
	.word	.LC403
	.word	.LC389
	.word	.LC383
	.word	.LC376
	.word	.LC385
	.word	.LC392
	.word	.LC400
	.word	.LC384
	.word	.LC405
	UNWIND(.fnend)
	.size	HEVC_ProcessPPS, .-HEVC_ProcessPPS
	.align	2
	.global	HEVC_DecPPS
	.type	HEVC_DecPPS, %function
HEVC_DecPPS:
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
	ldr	r6, .L3581
	mov	r4, r0
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L3576
	ldr	r1, .L3581+4
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r4, #164]
	cmp	r0, r3
	mov	r7, r0
	bcs	.L3577
	movw	r8, #5036
	ldr	r3, [r4, #2820]
	mul	r5, r8, r0
	add	r2, r3, r5
	ldrb	r10, [r3, r5]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L3578
	str	r0, [r2, #28]
	mov	r0, r4
	ldr	r1, [r4, #2820]
	add	r1, r1, r5
	bl	HEVC_ProcessPPS
	subs	r9, r0, #0
	bne	.L3579
	ldr	r3, [r4, #2820]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2820]
	strb	r2, [r3, r5]
.L3571:
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3578:
	ldr	r6, [r6]
	mov	r2, r8
	ldr	r10, .L3581+8
	mov	r1, #0
	add	r6, r6, #458752
	ldr	r3, [r10, #48]
	mov	r0, r6
	blx	r3
	str	r7, [r6, #28]
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ProcessPPS
	subs	r9, r0, #0
	bne	.L3580
	mov	r3, #1
	strb	r3, [r6, #1]
	strb	r3, [r6]
	mov	r2, r8
	ldr	r0, [r4, #2820]
	mov	r1, r6
	ldr	r3, [r10, #56]
	add	r0, r0, r5
	blx	r3
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3580:
	mov	r2, r7
	ldr	r1, .L3581+12
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_vfmw
	b	.L3571
.L3577:
	mov	r2, r0
	ldr	r1, .L3581+16
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_vfmw
	b	.L3571
.L3579:
	mov	r2, r7
	ldr	r1, .L3581+12
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2820]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2820]
	strb	r10, [r3, r5]
	b	.L3571
.L3576:
	ldr	r2, .L3581+20
	mvn	r9, #0
	ldr	r1, .L3581+24
	bl	dprint_vfmw
	b	.L3571
.L3582:
	.align	2
.L3581:
	.word	.LANCHOR1
	.word	.LC420
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC422
	.word	.LC421
	.word	.LANCHOR0+736
	.word	.LC72
	UNWIND(.fnend)
	.size	HEVC_DecPPS, .-HEVC_DecPPS
	.align	2
	.global	HEVC_DecPredWeightTable
	.type	HEVC_DecPredWeightTable, %function
HEVC_DecPredWeightTable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 136
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
	add	r4, r0, #4096
	mov	r7, r0
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #108
	bl	memset
	ldr	r2, [r4, #748]
	ldr	r3, [r7, #2820]
	movw	r0, #5036
	ldr	r1, [r4, #732]
	ldr	r5, [r7, #2816]
	mla	r3, r0, r2, r3
	cmp	r1, #1
	ldr	r6, [r3, #32]
	beq	.L3649
	cmp	r1, #0
	bne	.L3587
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3587
.L3585:
	ldr	r1, .L3660
	ldr	r0, [r7, #2808]
	bl	HEVC_ue_v
	cmp	r0, #7
	str	r0, [r4, #868]
	bhi	.L3650
	movw	r9, #12668
	mla	r9, r9, r6, r5
	ldr	r3, [r9, #60]
	cmp	r3, #0
	streq	r0, [r4, #1000]
	bne	.L3651
.L3627:
	ldr	r3, [r4, #788]
	cmp	r3, #0
	subne	r3, fp, #172
	strne	r3, [fp, #-176]
	movne	r5, #0
	movne	r6, r3
	beq	.L3593
.L3594:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	ldr	r3, [r4, #788]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L3594
	ldr	r2, [r9, #60]
	cmp	r2, #0
	beq	.L3595
	cmp	r3, #0
	subne	r6, fp, #108
	movne	r5, #0
	beq	.L3593
.L3599:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	ldr	r3, [r4, #788]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L3599
.L3595:
	cmp	r3, #0
	beq	.L3593
	add	r6, r7, #5056
	add	r10, r7, #5120
	add	r6, r6, #44
	add	r10, r10, #52
	mov	r5, #0
	b	.L3610
.L3600:
	ldr	r2, [r4, #868]
	mov	r3, #1
	str	r1, [r6, #-132]
	mov	r2, r3, asl r2
	str	r2, [r6]
.L3602:
	ldr	r2, [r9, #60]
	cmp	r2, #0
	beq	.L3604
	sub	r3, fp, #108
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	bne	.L3605
	ldr	r1, [r4, #1000]
	mov	r3, #1
	str	r2, [r10, #120]
	mov	r1, r3, asl r1
	str	r2, [r10, #124]
	str	r1, [r10, #-8]
	str	r1, [r10, #-4]
.L3604:
	ldr	r2, [r4, #788]
	add	r5, r5, #1
	add	r6, r6, #4
	add	r10, r10, #8
	cmp	r2, r5
	bls	.L3593
.L3610:
	ldr	r3, [fp, #-176]
	ldr	r1, [r3, r5, asl #2]
	cmp	r1, #0
	beq	.L3600
	ldr	r1, .L3660+4
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r2, r0, #128
	cmp	r2, #255
	bhi	.L3652
	ldr	r2, [r4, #868]
	mov	r3, #1
	ldr	r1, .L3660+8
	add	r0, r0, r3, asl r2
	str	r0, [r6]
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r2, r0, #128
	str	r0, [r6, #-132]
	cmp	r2, #255
	bls	.L3602
	mov	r2, r0
	ldr	r1, .L3660+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3649:
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3585
.L3587:
	mov	r0, #0
.L3648:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3605:
	sub	r8, r10, #8
	str	r5, [fp, #-180]
	mov	r5, r4
.L3608:
	ldr	r1, .L3660+16
	mov	r4, r8
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3660+20
	add	r3, r0, #128
	cmp	r3, #255
	bhi	.L3653
	ldr	r3, [r5, #1000]
	mov	r2, #1
	add	r8, r8, #4
	add	r0, r0, r2, asl r3
	str	r0, [r8, #-4]
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r3, r0, #512
	cmp	r3, #1024
	bcs	.L3654
	ldr	r1, [r4]
	cmp	r10, r8
	ldr	r3, [r5, #1000]
	mov	r1, r1, asl #7
	mov	r3, r1, asr r3
	rsb	r3, r3, #128
	add	r0, r0, r3
	ssat	r0, #8, r0
	str	r0, [r8, #124]
	bne	.L3608
	mov	r4, r5
	ldr	r5, [fp, #-180]
	b	.L3604
.L3593:
	ldr	r5, [r4, #732]
	cmp	r5, #0
	bne	.L3587
	ldr	r3, [r4, #792]
	cmp	r3, #0
	beq	.L3587
	sub	r3, fp, #172
	str	r3, [fp, #-176]
	mov	r6, r3
.L3611:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	ldr	r3, [r4, #792]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L3611
	ldr	r2, [r9, #60]
	cmp	r2, #0
	bne	.L3655
.L3612:
	cmp	r3, #0
	beq	.L3587
	add	r6, r7, #5376
	add	r10, r7, #5440
	add	r6, r6, #44
	add	r10, r10, #52
	mov	r5, #0
	b	.L3626
.L3616:
	ldr	r2, [r4, #868]
	mov	r3, #1
	str	r1, [r6, #-388]
	mov	r2, r3, asl r2
	str	r2, [r6]
.L3618:
	ldr	r2, [r9, #60]
	cmp	r2, #0
	beq	.L3620
	sub	r3, fp, #108
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	bne	.L3621
	ldr	r1, [r4, #1000]
	mov	r3, #1
	str	r2, [r10, #120]
	mov	r1, r3, asl r1
	str	r2, [r10, #124]
	str	r1, [r10, #-8]
	str	r1, [r10, #-4]
.L3620:
	ldr	r2, [r4, #792]
	add	r5, r5, #1
	add	r6, r6, #4
	add	r10, r10, #8
	cmp	r2, r5
	bls	.L3587
.L3626:
	ldr	r3, [fp, #-176]
	ldr	r1, [r3, r5, asl #2]
	cmp	r1, #0
	beq	.L3616
	ldr	r1, .L3660+24
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r2, r0, #128
	cmp	r2, #255
	bhi	.L3656
	ldr	r2, [r4, #868]
	mov	r3, #1
	ldr	r1, .L3660+28
	add	r0, r0, r3, asl r2
	str	r0, [r6]
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r2, r0, #128
	str	r0, [r6, #-388]
	cmp	r2, #255
	bls	.L3618
	ldr	r1, .L3660+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3621:
	sub	r8, r10, #8
	str	r5, [fp, #-180]
	mov	r5, r4
.L3624:
	ldr	r1, .L3660+36
	mov	r4, r8
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	ldr	r1, .L3660+40
	add	r3, r0, #128
	cmp	r3, #255
	bhi	.L3657
	ldr	r3, [r5, #1000]
	mov	r2, #1
	add	r8, r8, #4
	add	r0, r0, r2, asl r3
	str	r0, [r8, #-4]
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r3, r0, #512
	cmp	r3, #1024
	bcs	.L3658
	ldr	r1, [r4]
	cmp	r10, r8
	ldr	r3, [r5, #1000]
	mov	r1, r1, asl #7
	mov	r3, r1, asr r3
	rsb	r3, r3, #128
	add	r3, r0, r3
	ssat	r3, #8, r3
	str	r3, [r8, #124]
	bne	.L3624
	mov	r4, r5
	ldr	r5, [fp, #-180]
	b	.L3620
.L3651:
	ldr	r1, .L3660+44
	ldr	r0, [r7, #2808]
	bl	HEVC_se_v
	add	r3, r0, #7
	cmp	r3, #14
	bhi	.L3659
	ldr	r3, [r4, #868]
	add	r0, r0, r3
	str	r0, [r4, #1000]
	cmp	r0, #7
	bls	.L3627
	ldr	r1, .L3660+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3653:
	ldr	r1, .L3660+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3654:
	ldr	r1, .L3660+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3655:
	cmp	r3, #0
	subne	r6, fp, #108
	movne	r5, #0
	beq	.L3587
.L3615:
	mov	r1, #1
	ldr	r0, [r7, #2808]
	bl	BsGet
	ldr	r3, [r4, #792]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L3615
	b	.L3612
.L3652:
	mov	r2, r0
	ldr	r1, .L3660+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3657:
	ldr	r1, .L3660+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3658:
	ldr	r1, .L3660+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3656:
	ldr	r1, .L3660+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3650:
	ldr	r1, .L3660+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3659:
	ldr	r1, .L3660+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3648
.L3661:
	.align	2
.L3660:
	.word	.LC423
	.word	.LC428
	.word	.LC430
	.word	.LC431
	.word	.LC432
	.word	.LC434
	.word	.LC436
	.word	.LC438
	.word	.LC439
	.word	.LC440
	.word	.LC442
	.word	.LC425
	.word	.LC427
	.word	.LC433
	.word	.LC435
	.word	.LC429
	.word	.LC441
	.word	.LC443
	.word	.LC437
	.word	.LC424
	.word	.LC426
	UNWIND(.fnend)
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
	.align	2
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
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
	UNWIND(.pad #76)
	sub	sp, sp, #76
	ldr	r3, [r0, #2828]
	add	r5, r0, #4096
	mov	r4, r0
	mov	r1, #1
	ldr	r0, [r0, #2808]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-48]
	bl	BsGet
	ldr	r6, [r5, #740]
	sub	r3, r6, #16
	cmp	r3, #5
	movhi	r3, #0
	movls	r3, #1
	cmp	r3, #0
	str	r3, [fp, #-68]
	strb	r0, [r5, #712]
	bne	.L3976
.L3663:
	ldr	r1, .L4022
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r5, #748]
	ldr	r3, [r4, #164]
	blt	.L3665
	cmp	r0, r3
	bge	.L3665
	mov	r0, r4
	bl	HEVC_VpsSpsPpsCheck
	subs	r3, r0, #0
	str	r3, [fp, #-84]
	bne	.L3977
	ldr	r1, [r5, #748]
	movw	r8, #5036
	ldr	r3, [r4, #2820]
	movw	r7, #12668
	ldr	r2, [r4, #2816]
	mla	r8, r8, r1, r3
	ldr	r3, [r4, #2812]
	str	r3, [fp, #-52]
	ldr	r1, [r8, #32]
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	mla	r7, r7, r1, r2
	cmp	r3, #0
	ldr	r3, [r7, #48]
	str	r3, [fp, #-56]
	bne	.L3978
.L3671:
	mov	r3, #0
	strb	r3, [r5, #713]
.L3672:
	ldr	r9, [r7, #140]
	ldr	r3, [r7, #144]
	cmp	r9, #0
	beq	.L3674
	cmp	r3, #0
	beq	.L3674
	ldr	r0, [r7, #68]
	mov	r1, r3
	add	r0, r3, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	mov	r1, r9
	mov	r10, r0
	ldr	r0, [r7, #64]
	add	r0, r9, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	ldr	r2, [r7, #172]
	mov	r1, #1
	mov	r2, r2, asl r1
	mov	r9, r1, asl r2
	mul	r0, r0, r10
	cmp	r0, r1
	ble	.L3837
	mov	r3, r1
	mov	r1, #0
.L3677:
	add	r1, r1, #1
	cmp	r0, r3, asl r1
	bgt	.L3677
.L3676:
	ldrb	r3, [r5, #712]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [fp, #-72]
	beq	.L3979
.L3678:
	ldrb	r3, [r5, #713]	@ zero_extendqisi2
	ldr	r2, [r4, #192]
	cmp	r3, #0
	str	r2, [r5, #724]
	bne	.L3681
	ldrb	r10, [r4, #1]	@ zero_extendqisi2
	cmp	r10, #1
	beq	.L3682
	ldr	r2, [r8, #36]
	cmp	r2, #0
	movne	r10, r3
	beq	.L3686
.L3688:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r8, #36]
	add	r10, r10, #1
	cmp	r3, r10
	bhi	.L3688
.L3686:
	ldr	r1, .L4022+4
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r5, #732]
	bhi	.L3980
	ldrb	r3, [r8, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3981
.L3689:
	sub	r6, r6, #19
	ldr	r1, [fp, #-56]
	cmp	r6, #1
	ldr	r0, [fp, #-52]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	movhi	r2, #0
	movls	r2, #1
	str	r2, [fp, #-80]
	movw	r2, #24912
	mla	r2, r2, r1, r0
	cmp	r3, #1
	str	r2, [fp, #-92]
	movne	r2, #0
	strne	r2, [fp, #-76]
	strne	r2, [fp, #-64]
	beq	.L3982
.L3690:
	ldr	r2, [fp, #-80]
	cmp	r2, #0
	bne	.L3694
	cmp	r3, #0
	beq	.L3983
.L3695:
	ldr	r3, [r7, #116]
	mov	r2, #1
	ldr	r6, [r4, #188]
	mov	r3, r2, asl r3
	str	r3, [fp, #-88]
	mov	r1, r3
	mov	r0, r6
	bl	__aeabi_uidivmod
	ldr	r3, [fp, #-64]
	cmp	r3, r1
	rsb	r3, r1, r6
	bcs	.L3696
	ldr	r0, [fp, #-88]
	ldr	r2, [fp, #-64]
	rsb	r2, r2, r1
	cmp	r2, r0, lsr #1
	movcs	r2, r0
	addcs	r3, r3, r2
	bcs	.L3697
.L3696:
	ldr	r2, [fp, #-64]
	cmp	r2, r1
	bls	.L3697
	rsb	r1, r1, r2
	ldr	r2, [fp, #-88]
	cmp	r1, r2, lsr #1
	rsbhi	r3, r2, r3
.L3697:
	ldr	r1, [r5, #740]
	ldr	r2, [fp, #-48]
	sub	r1, r1, #16
	cmp	r1, #2
	ldr	r1, [fp, #-64]
	add	r2, r4, r2, lsl #2
	movls	r3, #0
	add	r3, r3, r1
	str	r3, [r5, #724]
	ldr	r2, [r2, #212]
	cmp	r3, r2
	bge	.L3699
	ldrb	r0, [r5, #712]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L3984
.L3699:
	ldr	r3, [r4, #2368]
	cmp	r3, #0
	ldreq	r3, [r5, #724]
	streq	r3, [r4, #192]
	ldr	r3, [r5, #736]
	cmp	r3, #0
	bne	.L3701
	ldr	r3, [r5, #740]
	cmp	r3, #15
	bhi	.L3702
	tst	r3, #1
	movne	r2, #1
	beq	.L3702
.L3703:
	sub	r3, r3, #7
	bics	r3, r3, #2
	andne	r3, r2, #1
	moveq	r3, #0
	cmp	r3, #0
	ldrne	r3, [r5, #724]
	strne	r3, [r4, #188]
.L3701:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L3704
	ldr	r3, [r7, #176]
	mov	r1, #0
	cmp	r3, #1
	movhi	r2, #1
	bls	.L3706
.L3708:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L3708
	cmp	r1, #0
	bne	.L3985
.L3709:
	mov	r2, #164
	add	r0, r5, #1632
	mla	r1, r2, r1, r7
	add	r3, r4, #5696
	add	r0, r0, #12
	add	r3, r3, #44
	str	r3, [fp, #-76]
	add	r1, r1, #2160
	add	r1, r1, #4
	bl	memcpy
.L3707:
	ldrb	r3, [r7, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3711
	ldr	r3, [r7, #180]
	ldr	r6, [r5, #1648]
	cmp	r3, #0
	ldr	r2, [r5, #1644]
	streq	r3, [fp, #-96]
	add	r6, r6, r2
	streq	r3, [fp, #-48]
	streq	r3, [fp, #-56]
	bne	.L3986
.L3712:
	ldr	r1, .L4022+8
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r2, [r5, #1644]
	ldr	r3, [r5, #1648]
	ldr	ip, [fp, #-48]
	add	r1, r3, r2
	add	r0, r0, ip
	str	r0, [fp, #-60]
	add	r1, r1, r0
	cmp	r1, #16
	bhi	.L3987
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	add	r3, r6, r3
	str	r3, [fp, #-100]
	beq	.L3728
	ldr	r2, [fp, #-100]
	str	r8, [fp, #-104]
	add	r9, r2, #5696
	add	r3, r2, #1216
	add	r9, r9, #55
	add	r3, r3, #7
	add	r2, r4, r9
	add	r10, r4, r3, lsl #2
	mov	r1, r2
	mov	r2, #0
	mov	r9, r2
	str	r2, [fp, #-52]
	mov	r8, r1
	b	.L3727
.L3991:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ldreq	r0, [fp, #-56]
	bne	.L3988
.L3719:
	add	r1, r7, r0
	add	r0, r7, r0, lsl #2
	ldrb	r1, [r1, #13]	@ zero_extendqisi2
	ldr	r6, [r0, #196]
	strb	r1, [r8]
.L3722:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	bne	.L3989
	ldr	r3, [fp, #-48]
	str	r6, [r10, #944]
	cmp	r9, r3
	cmpne	r9, #0
	ldr	r3, [fp, #-52]
	str	r0, [r10]
	ldr	r1, [r5, #724]
	moveq	r3, #0
	str	r3, [fp, #-52]
	rsb	r6, r1, r6
	str	r6, [r10, #876]
.L3725:
	ldr	r3, [fp, #-60]
	add	r9, r9, #1
	sub	r10, r10, #4
	sub	r8, r8, #1
	cmp	r9, r3
	beq	.L3990
.L3727:
	ldr	r3, [fp, #-48]
	cmp	r3, r9
	bhi	.L3991
	ldr	r1, [r7, #120]
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	mov	r6, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r8]
	b	.L3722
.L4012:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #717]
	cmp	r0, #0
	bne	.L3992
	ldr	r3, [r5, #732]
	ldr	r2, [r8, #40]
	cmp	r3, #0
	str	r2, [r5, #788]
	bne	.L3770
	ldr	r2, [r8, #44]
	mov	r6, r3
	mov	r9, r3
	str	r2, [r5, #792]
.L3771:
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	beq	.L3993
	ldr	r3, [fp, #-76]
	ldr	r2, [r3, #8]
	cmp	r2, #16
	bhi	.L3774
	cmp	r2, #0
	moveq	r3, r2
	beq	.L3776
	ldr	r3, [fp, #-76]
	add	r2, r2, #11
	add	r1, r3, #11
	add	r0, r3, r2
	mov	r3, #0
.L3778:
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	addne	r3, r3, #1
	cmp	r1, r0
	bne	.L3778
.L3776:
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #1
	ldreq	r2, [r5, #2072]
	addeq	r3, r3, r2
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	cmp	r2, #0
	cmpne	r3, #1
	ble	.L3972
	add	r2, r4, #5888
	add	r1, r4, #4800
	add	r2, r2, #16
	add	r1, r1, #8
	mov	r0, r4
	bl	HEVC_DecRefPicListsModification
	cmp	r0, #0
	bne	.L3994
.L3772:
	ldr	r3, [r5, #732]
	cmp	r3, #0
	beq	.L3834
.L3780:
	cmp	r3, #2
	beq	.L3764
.L3835:
	ldrb	r3, [r8, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3995
.L3781:
	ldrb	r3, [r5, #716]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r5, #732]
	beq	.L3790
	cmp	r3, #0
	beq	.L3996
	cmp	r3, #2
	mov	r3, #1
	strb	r3, [r5, #720]
	beq	.L3787
.L3786:
	ldr	r3, [r5, #788]
	cmp	r3, #1
	bls	.L3966
.L3789:
	ldr	r1, .L4022+12
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldrb	r2, [r5, #720]	@ zero_extendqisi2
	cmp	r2, #0
	subne	r6, r9, #1
	subeq	r6, r6, #1
	cmp	r6, r0
	str	r0, [r5, #756]
	movcs	r3, #0
	movcc	r3, #1
	orrs	r3, r3, r0, lsr #31
	bne	.L3793
.L3966:
	ldr	r3, [r5, #732]
.L3790:
	ldrb	r2, [r8, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3794
	cmp	r3, #1
	beq	.L3797
.L3794:
	ldrb	r2, [r8, #11]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3785
	cmp	r3, #0
	bne	.L3785
.L3797:
	mov	r0, r4
	bl	HEVC_DecPredWeightTable
	cmp	r0, #0
	ldreq	r3, [r5, #732]
	bne	.L3997
.L3785:
	cmp	r3, #2
	beq	.L3798
	ldr	r1, .L4022+16
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	rsb	r3, r0, #4
	rsb	r2, r0, #5
	cmp	r3, #4
	str	r2, [r5, #760]
	bhi	.L3998
.L3798:
	ldr	r1, .L4022+20
	ldr	r0, [r4, #2808]
	bl	HEVC_se_v
	ldr	r2, [r8, #48]
	add	r2, r0, r2
	str	r2, [r5, #728]
	ldr	r3, [r7, #92]
	cmp	r2, #51
	rsb	r0, r3, #0
	movle	r1, #0
	movgt	r1, #1
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	bne	.L3999
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4000
.L3800:
	ldrb	r3, [r8, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3967
	ldrb	r3, [r8, #19]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4001
.L3806:
	ldrb	r0, [r8, #20]	@ zero_extendqisi2
	strb	r0, [r5, #721]
	ldr	r3, [r8, #76]
	str	r3, [r5, #772]
	ldr	r3, [r8, #80]
	str	r3, [r5, #776]
.L3805:
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3809
	movw	r3, #714
	ldrh	r2, [r5, r3]
	adds	r3, r2, #0
	movne	r3, #1
.L3809:
	ldrb	r2, [r8, #17]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3810
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L4002
.L3810:
	strb	r2, [r5, #722]
.L3681:
	ldr	r3, [r8, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	bne	.L3811
.L3818:
	ldrb	r3, [r8, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4003
.L3813:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bne	.L4004
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [fp, #-68]
	beq	.L3829
	cmp	r3, #0
	beq	.L3830
	ldr	r3, [r5, #744]
	mov	r2, #1
	add	r3, r4, r3
	strb	r2, [r3, #6]
.L3827:
	ldr	r2, [r5, #724]
	ldr	r1, [fp, #-68]
	cmp	r2, #0
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	bne	.L4005
.L3828:
	mov	r2, #0
	strb	r2, [r3, #4]
.L3832:
	mov	r0, r4
	bl	HEVC_IsNewPic
	str	r0, [r5, #864]
	mov	r0, r4
	bl	HEVC_ReadByteAlignment
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L3962:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3978:
	ldrb	r3, [r5, #712]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3671
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r5, #713]
	b	.L3672
.L4004:
	ldr	r3, [r5, #744]
	add	r3, r4, r3
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3827
	b	.L3828
.L3976:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L3663
.L3979:
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r5, #752]
	blt	.L4006
	ldr	r1, [r7, #192]
	ldr	r3, [r7, #188]
	mul	r3, r3, r1
	cmp	r3, r0
	bls	.L3680
	mul	r3, r9, r0
	str	r3, [fp, #-72]
	b	.L3678
.L3811:
	ldr	r1, .L4022+24
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r8, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	ldreq	r3, [r7, #192]
	subeq	r3, r3, #1
	mov	r6, r0
	beq	.L3815
	cmp	r3, #256
	ldreq	r2, [r8, #68]
	ldreq	r3, [r8, #72]
	ldrne	r3, [r7, #192]
	ldrne	r2, [r8, #68]
	mul	r3, r3, r2
	sub	r3, r3, #1
.L3815:
	cmp	r3, #255
	movcs	r3, #255
	cmp	r6, r3
	bhi	.L4007
	cmp	r6, #0
	beq	.L3818
	ldr	r1, .L4022+28
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #31
	add	r7, r0, #1
	movls	r9, #0
	bhi	.L4008
.L3820:
	add	r9, r9, #1
	mov	r1, r7
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r9, r6
	bne	.L3820
	ldrb	r3, [r8, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3813
.L4003:
	ldr	r1, .L4022+32
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	cmp	r0, #256
	mov	r7, r0
	bhi	.L4009
	ldr	r0, [r4, #2808]
	bl	BsResidBits
	cmp	r7, r0
	bhi	.L3824
	cmp	r7, #0
	movne	r6, #0
	beq	.L3813
.L3826:
	add	r6, r6, #1
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	cmp	r6, r7
	bne	.L3826
	b	.L3813
.L3694:
	mov	r2, #0
	str	r2, [r5, #724]
	ldr	r2, [r4, #2368]
	cmp	r2, #0
	streq	r2, [r4, #192]
	ldr	r2, [r5, #736]
	cmp	r2, #0
	streq	r2, [r4, #188]
.L3730:
	cmp	r3, #1
	beq	.L4010
.L3732:
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4011
.L3762:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	movne	r3, #0
	strneb	r3, [r5, #716]
	ldr	r3, [r5, #732]
	cmp	r3, #2
	bne	.L4012
.L3764:
	ldrb	r3, [r5, #716]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3787
	mov	r3, #1
	strb	r3, [r5, #720]
	mov	r3, #2
	b	.L3790
.L3829:
	cmp	r3, #0
	beq	.L3830
	ldr	r3, [r5, #744]
	ldrb	r2, [fp, #-72]	@ zero_extendqisi2
	add	r3, r4, r3
	strb	r2, [r3, #6]
	b	.L3828
.L4005:
	ldr	r2, [r5, #740]
	cmp	r2, #21
	moveq	r2, #1
	streqb	r2, [r3, #4]
	bne	.L3828
	b	.L3832
.L3702:
	sub	r2, r3, #16
	cmp	r2, #7
	movhi	r2, #0
	movls	r2, #1
	b	.L3703
.L3989:
	ldr	r1, .L4022+36
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-48]
	cmp	r9, #0
	cmpne	r9, r3
	ldrne	r3, [fp, #-52]
	addne	r0, r0, r3
	mov	r3, #1
	str	r3, [r10]
	ldr	r3, [fp, #-64]
	ldr	r1, [r5, #724]
	str	r0, [fp, #-52]
	rsb	ip, r3, r1
	ldr	r3, [fp, #-88]
	add	r6, ip, r6
	mls	r0, r3, r0, r6
	rsb	r1, r1, r0
	str	r1, [r10, #876]
	str	r0, [r10, #944]
	b	.L3725
.L3988:
	ldr	r1, [fp, #-96]
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r1, [r7, #180]
	sub	r1, r1, #1
	cmp	r0, #0
	blt	.L3721
	cmp	r1, r0
	bcs	.L3719
.L3721:
	str	r1, [sp]
	mov	r3, r0
	mov	r2, r9
	ldr	r1, .L4022+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3830:
	ldr	r3, [r5, #744]
	add	r3, r4, r3
	b	.L3828
.L3967:
	ldrb	r0, [r5, #721]	@ zero_extendqisi2
	b	.L3805
.L3990:
	ldr	r8, [fp, #-104]
.L3728:
	ldr	r3, [fp, #-100]
	cmp	r3, #16
	str	r3, [r5, #1652]
	bhi	.L4013
.L3711:
	ldrb	r3, [r7, #9]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r5, #716]
	ldreqb	r3, [r4, #1]	@ zero_extendqisi2
	beq	.L3730
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r5, #716]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	b	.L3730
.L3972:
	ldr	r3, [r5, #732]
	cmp	r3, #0
	bne	.L3835
.L3834:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r5, #732]
	strb	r0, [r5, #718]
	b	.L3780
.L3981:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	b	.L3689
.L3982:
	ldr	r1, [fp, #-48]
	add	r2, r1, #4096
	cmp	r1, #0
	add	r2, r2, #44
	ldr	r1, [fp, #-92]
	add	r2, r1, r2, lsl #2
	ldr	r2, [r2, #4]
	beq	.L3691
	add	r2, r1, r2
	add	r2, r2, #12416
	ldrb	r2, [r2, #7]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3691
.L3692:
	ldr	r1, [r7, #120]
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	str	r0, [fp, #-64]
.L3693:
	add	r2, r4, #5696
	add	r2, r2, #44
	str	r2, [fp, #-76]
	b	.L3690
.L3691:
	ldr	r2, [fp, #-80]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [fp, #-64]
	bne	.L3693
	b	.L3692
.L4011:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #714]
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r5, #715]
	b	.L3762
.L3665:
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L4022+44
	mov	r0, #1
	ldr	r1, .L4022+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4000:
	ldr	r1, .L4022+52
	ldr	r0, [r4, #2808]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r5, #764]
	cmp	r3, #24
	bhi	.L4014
	ldr	r3, [r8, #60]
	add	r2, r0, r3
	add	r2, r2, #12
	cmp	r2, #24
	bhi	.L4015
	ldr	r1, .L4022+56
	ldr	r0, [r4, #2808]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r5, #768]
	cmp	r3, #24
	bhi	.L4016
	ldr	r2, [r8, #64]
	add	r2, r0, r2
	add	r3, r2, #12
	cmp	r3, #24
	bls	.L3800
	ldr	r1, .L4022+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3995:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r5, #719]
	b	.L3781
.L3837:
	mov	r1, #0
	b	.L3676
.L3770:
	mov	r6, r0
	mov	r9, r0
	str	r0, [r5, #792]
.L3769:
	cmp	r3, #2
	bne	.L3771
	b	.L3772
.L3983:
	ldr	r1, [r7, #120]
	ldr	r0, [r4, #2808]
	bl	BsGet
	str	r0, [fp, #-64]
	b	.L3695
.L3704:
	add	r6, r4, #5696
	ldr	r3, [r7, #176]
	add	r6, r6, #44
	mov	r1, r7
	mov	r0, r4
	mov	r2, r6
	bl	HEVC_DecShortTermRefPicSet
	cmp	r0, #0
	streq	r6, [fp, #-76]
	beq	.L3707
	ldr	r1, .L4022+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3682:
	ldr	r3, [r8, #36]
	cmp	r3, #0
	beq	.L3686
	mov	r1, r10
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r8, #36]
	cmp	r3, #1
	bls	.L3686
	mov	r1, r10
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r8, #36]
	cmp	r3, #2
	bls	.L3686
	mov	r1, r10
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r8, #36]
	cmp	r3, #3
	bls	.L3686
	mov	r10, #3
.L3687:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r8, #36]
	add	r10, r10, #1
	cmp	r10, r3
	bcc	.L3687
	b	.L3686
.L3992:
	ldr	r1, .L4022+68
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	add	r9, r0, #1
	cmp	r9, #16
	bhi	.L4017
	ldr	r3, [r5, #732]
	str	r9, [r5, #788]
	cmp	r3, #0
	movne	r6, #0
	strne	r6, [r5, #792]
	bne	.L3769
	ldr	r1, .L4022+72
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	add	r6, r0, #1
	cmp	r6, #16
	strls	r6, [r5, #792]
	ldrls	r3, [r5, #732]
	bls	.L3769
	mov	r2, r6
	mov	r3, #16
	ldr	r1, .L4022+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3985:
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r7, #176]
	subs	r1, r0, #0
	sublt	r3, r3, #1
	blt	.L3710
.L3706:
	sub	r3, r3, #1
	cmp	r3, r1
	bcs	.L3709
.L3710:
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L4022+80
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3996:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	ldr	r3, [r5, #732]
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r5, #720]
	beq	.L3798
	cmp	r0, #0
	bne	.L3786
	ldr	r2, [r5, #792]
	cmp	r2, #1
	bhi	.L3789
	b	.L3790
.L3787:
	mov	r3, #2
	b	.L3794
.L4009:
	mov	r2, r0
	ldr	r1, .L4022+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4013:
	ldr	r2, [fp, #-100]
	mov	r3, #16
	ldr	r1, .L4022+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4010:
	ldr	r1, [r4, #2828]
	ldr	r0, [r1, #24]
	cmp	r0, #0
	beq	.L3733
	ldr	r2, [fp, #-92]
	add	r10, r2, #12288
	ldrb	r6, [r10, #134]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L3734
	add	r9, r2, r0, lsl #2
	add	r9, r9, #16384
	ldr	r2, [r9, #196]
	cmp	r2, #0
	ble	.L3735
	mov	r1, r3
	ldr	r0, [r4, #2808]
	str	r3, [fp, #-48]
	bl	BsGet
	ldr	ip, [r9, #196]
	ldr	r3, [fp, #-48]
	tst	r0, #255
	beq	.L3737
	cmp	ip, #1
	ble	.L3737
	ldrb	r2, [r10, #133]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3738
	cmp	ip, #1
	ldr	r0, [r4, #2808]
	bls	.L3848
.L3740:
	add	r2, r2, #1
	cmp	ip, r3, asl r2
	mov	r1, r2
	bhi	.L3740
.L3739:
	bl	BsGet
	add	r2, r0, #1
	str	r2, [r5, #2072]
	ldr	r3, [r9, #196]
	cmp	r2, r3
	streq	r2, [fp, #-84]
	moveq	r6, #0
	beq	.L3742
	cmp	r2, #2
	bgt	.L4018
	cmp	r2, #0
	bgt	.L3743
	mov	r6, #1
	str	r2, [fp, #-84]
.L3744:
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	ble	.L3732
.L3756:
	add	r1, r4, #6144
	mov	r2, #0
	add	r1, r1, #28
	ldr	r0, [fp, #-84]
	b	.L3761
.L3760:
	add	r2, r2, #1
	cmp	r2, r0
	beq	.L3732
.L3761:
	cmp	r6, #0
	mov	r3, r2
	streq	r2, [r1]
	add	r1, r1, #4
	ldrne	r3, [r1, #-4]
	cmp	r3, #2
	ble	.L3760
	mov	r0, #2
	ldr	r1, .L4022+92
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_vfmw
.L3746:
	ldr	r1, .L4022+96
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3674:
	mov	r2, r9
	ldr	r1, .L4022+100
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4002:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	strb	r0, [r5, #722]
	b	.L3681
.L4023:
	.align	2
.L4022:
	.word	.LC444
	.word	.LC449
	.word	.LC456
	.word	.LC471
	.word	.LC474
	.word	.LC476
	.word	.LC488
	.word	.LC490
	.word	.LC492
	.word	.LC459
	.word	.LC458
	.word	.LANCHOR0+748
	.word	.LC445
	.word	.LC478
	.word	.LC481
	.word	.LC483
	.word	.LC452
	.word	.LC464
	.word	.LC466
	.word	.LC467
	.word	.LC453
	.word	.LC493
	.word	.LC460
	.word	.LC463
	.word	.LC495
	.word	.LC447
	.word	.LC484
	.word	.LC486
	.word	.LC487
	.word	.LC446
	.word	.LC454
	.word	.LC477
	.word	.LC462
	.word	.LC451
	.word	.LC448
	.word	.LC450
	.word	.LC469
	.word	.LC475
	.word	.LC472
	.word	.LC485
	.word	.LC489
	.word	.LC494
	.word	.LC480
	.word	.LC482
	.word	.LC479
	.word	.LC473
	.word	.LC457
	.word	.LC468
	.word	.LC465
	.word	.LC491
	.word	.LC455
	.word	.LC470
	.word	.LC461
.L4001:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	tst	r0, #255
	beq	.L3806
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #721]
	cmp	r0, #0
	bne	.L3805
	ldr	r1, .L4022+104
	ldr	r0, [r4, #2808]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r5, #772]
	bhi	.L4019
.L3807:
	ldr	r1, .L4022+108
	ldr	r0, [r4, #2808]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r5, #776]
	bls	.L3967
	ldr	r1, .L4022+112
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r8, #80]
	ldrb	r0, [r5, #721]	@ zero_extendqisi2
	str	r3, [r5, #776]
	b	.L3805
.L3733:
	ldr	r3, [fp, #-92]
	add	r9, r3, #12288
	ldrb	r6, [r9, #134]	@ zero_extendqisi2
.L3734:
	cmp	r6, #1
	beq	.L4020
.L3735:
	mov	r3, #0
	str	r3, [r5, #2072]
.L3750:
	mov	r6, #0
	b	.L3744
.L3977:
	ldr	r3, [r4, #260]
	mov	r0, r4
	cmp	r3, #0
	ldrne	r3, [r4, #192]
	str	r3, [r5, #724]
	bl	HEVC_IsNewPic
	ldr	r1, .L4022+116
	str	r0, [r5, #864]
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3986:
	ldr	r1, .L4022+120
	ldr	r0, [r4, #2808]
	bl	HEVC_ue_v
	ldr	r3, [r7, #180]
	cmp	r0, r3
	mov	r2, r0
	str	r0, [fp, #-48]
	bhi	.L4021
	cmp	r3, #1
	bls	.L3845
	mov	r2, #0
	mov	r1, r2
	mov	r2, #1
.L3714:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L3714
	str	r1, [fp, #-96]
	str	r1, [fp, #-56]
	b	.L3712
.L3999:
	ldr	r1, .L4022+124
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3849:
	mov	r1, #0
.L3747:
	str	r3, [fp, #-48]
	bl	BsGet
	add	r4, r4, #1
	ldr	r3, [fp, #-48]
	str	r0, [r10, #4]!
	ldr	r2, [r7, #2072]
	cmp	r4, r2
	blt	.L3749
	mov	r4, r5
	mov	r6, #1
	mov	r5, r7
	mov	r7, r3
	str	r2, [fp, #-84]
.L3742:
	ldr	r3, [fp, #-84]
	cmp	r3, #2
	ble	.L3744
	ldr	r2, [fp, #-84]
	mov	r3, #2
	ldr	r1, .L4022+128
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3746
.L3984:
	ldr	r1, .L4022+132
	bl	dprint_vfmw
	b	.L3699
.L4020:
	ldr	r2, [r4, #2812]
	add	r10, r2, r0, lsl #2
	add	r10, r10, #16384
	ldr	r6, [r10, #196]
	cmp	r6, #0
	ble	.L3850
	add	r3, r0, #2064
	mov	r9, #0
	add	r3, r3, #10
	add	ip, r2, #12288
	ldr	lr, [r1, #28]
	mov	r1, r9
	add	r0, r2, r3, lsl #3
.L3754:
	ldr	r3, [r0, #4]!
	add	r1, r1, #1
	add	r3, r3, #1024
	add	r3, r3, #12
	add	r3, ip, r3, lsl #2
	ldr	r2, [r3, #132]
	add	r3, r2, #1040
	add	r3, r3, #2
	add	r3, ip, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r3, lr
	blt	.L3752
	cmp	lr, #0
	beq	.L3753
	ldr	r3, [r10, #180]
	add	r3, r3, r2, lsl #1
	add	r3, r3, #3088
	add	r3, r3, #10
	add	r3, ip, r3, lsl #2
	ldr	r3, [r3, #132]
	cmp	r3, #0
	beq	.L3752
.L3753:
	add	r9, r9, #1
.L3752:
	cmp	r1, r6
	bne	.L3754
.L3751:
	str	r9, [fp, #-84]
	mov	r6, #0
	str	r9, [r5, #2072]
	b	.L3742
.L4006:
	ldr	r2, [r7, #192]
	ldr	r3, [r7, #188]
	mul	r3, r3, r2
.L3680:
	mov	r2, r0
	ldr	r1, .L4022+136
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3980:
	mov	r2, r0
	ldr	r1, .L4022+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3737:
	cmp	ip, #1
	streq	ip, [r5, #2072]
	streq	ip, [fp, #-84]
	bne	.L3735
	b	.L3750
.L3774:
	mov	r3, #16
	ldr	r1, .L4022+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3998:
	ldr	r1, .L4022+148
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3793:
	mov	r3, r0
	str	r6, [sp]
	ldr	r1, .L4022+152
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4019:
	ldr	r1, .L4022+156
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r8, #76]
	str	r3, [r5, #772]
	b	.L3807
.L4007:
	mov	r2, r6
	ldr	r1, .L4022+160
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3824:
	mov	r2, r0
	mov	r3, r7
	ldr	r1, .L4022+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4015:
	mov	r2, r0
	ldr	r1, .L4022+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4016:
	mov	r2, r0
	ldr	r1, .L4022+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4014:
	mov	r2, r0
	ldr	r1, .L4022+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3997:
	ldr	r1, .L4022+180
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3987:
	str	r0, [sp]
	mov	ip, #16
	ldr	r1, .L4022+184
	mov	r0, #1
	str	ip, [sp, #4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3993:
	ldr	r1, .L4022+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3738:
	str	r3, [r5, #2072]
	ldr	r2, [r9, #196]
	cmp	r2, #1
	streq	r3, [fp, #-84]
	beq	.L3756
.L3743:
	add	r10, r4, #6144
	mov	r3, #0
	mov	r2, r5
	add	r10, r10, #24
	mov	r5, r4
	mov	r6, #1
	mov	r4, r3
	mov	r3, r7
	mov	r7, r2
.L3749:
	ldr	ip, [r9, #196]
	ldr	r0, [r5, #2808]
	cmp	ip, #1
	bls	.L3849
	mov	r2, #0
.L3748:
	add	r2, r2, #1
	cmp	ip, r6, asl r2
	mov	r1, r2
	bhi	.L3748
	b	.L3747
.L3850:
	mov	r9, #0
	b	.L3751
.L4017:
	mov	r2, r9
	mov	r3, #16
	ldr	r1, .L4022+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4008:
	mov	r2, r7
	ldr	r1, .L4022+196
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L4021:
	ldr	r1, .L4022+200
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3994:
	ldr	r1, .L4022+204
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3962
.L3845:
	mov	r3, #0
	str	r3, [fp, #-96]
	str	r3, [fp, #-56]
	b	.L3712
.L4018:
	mov	r3, #2
	ldr	r1, .L4022+208
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3746
.L3848:
	mov	r1, r2
	b	.L3739
	UNWIND(.fnend)
	.size	HEVC_DecSliceSegmentHeader, .-HEVC_DecSliceSegmentHeader
	.align	2
	.global	HEVC_ClearCurrNal
	.type	HEVC_ClearCurrNal, %function
HEVC_ClearCurrNal:
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
	ldr	r1, [r0, #2828]
	mov	r4, r0
	cmp	r1, #0
	beq	.L4025
	ldr	r0, [r0, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4025:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearCurrNal, .-HEVC_ClearCurrNal
	.align	2
	.global	HEVC_FrameStoreRefFlg
	.type	HEVC_FrameStoreRefFlg, %function
HEVC_FrameStoreRefFlg:
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
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FrameStoreRefFlg, .-HEVC_FrameStoreRefFlg
	.align	2
	.global	HEVC_ClearCurrSlice
	.type	HEVC_ClearCurrSlice, %function
HEVC_ClearCurrSlice:
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
	ldr	r1, [r0, #2828]
	mov	r4, r0
	cmp	r1, #0
	beq	.L4031
	ldr	r0, [r0, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4031:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearCurrSlice, .-HEVC_ClearCurrSlice
	.align	2
	.global	HEVC_ClearAllSlice
	.type	HEVC_ClearAllSlice, %function
HEVC_ClearAllSlice:
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
	ldr	r2, [r0, #168]
	mov	r5, r0
	cmp	r2, #0
	beq	.L4039
	mov	r4, #0
	mov	r6, r4
.L4038:
	ldr	r3, [r5, #2848]
	ldr	r1, [r3, r4, asl #2]
	cmp	r1, #0
	beq	.L4037
	ldr	r0, [r5, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r5, #2848]
	str	r6, [r3, r4, asl #2]
	ldr	r2, [r5, #168]
.L4037:
	add	r4, r4, #1
	cmp	r2, r4
	bhi	.L4038
.L4039:
	mov	r0, #0
	mov	r3, #2
	str	r0, [r5, #204]
	str	r0, [r5, #268]
	str	r0, [r5, #260]
	strb	r0, [r5, #14]
	str	r3, [r5, #176]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearAllSlice, .-HEVC_ClearAllSlice
	.align	2
	.global	HEVC_InitDPB
	.type	HEVC_InitDPB, %function
HEVC_InitDPB:
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
	mov	r4, r0
	mov	r9, r1
	bl	HEVC_ClearAllSlice
	add	r8, r4, #3200
	mov	r6, r4
	add	r8, r8, #4
	mov	r5, #17
	mov	r7, #0
.L4052:
	ldr	r3, [r8, #4]!
	cmp	r3, #0
	beq	.L4046
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
.L4046:
	ldr	r3, [r6, #3276]
	cmp	r3, #0
	beq	.L4047
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
.L4047:
	ldr	r3, [r6, #3344]
	cmp	r3, #0
	beq	.L4048
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
.L4048:
	ldr	r3, [r6, #3412]
	cmp	r3, #0
	beq	.L4049
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
.L4049:
	ldr	r3, [r6, #3072]
	str	r7, [r6, #3412]
	cmp	r3, #0
	str	r7, [r6, #3344]
	str	r7, [r6, #3276]
	str	r7, [r6, #3208]
	beq	.L4050
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
.L4050:
	ldr	r3, [r6, #3140]
	cmp	r3, #0
	beq	.L4051
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
.L4051:
	subs	r5, r5, #1
	str	r7, [r6, #3140]
	str	r7, [r6, #3072]
	add	r6, r6, #4
	bne	.L4052
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4116
.L4053:
	ldr	r3, [r4, #2840]
	ldr	r3, [r3, #184]
	add	r3, r3, #1
	str	r3, [r4, #3036]
.L4055:
	cmp	r3, #17
	bhi	.L4117
.L4056:
	ldr	r3, .L4125
	mov	r6, #0
	add	r0, r4, #13120
	mov	r1, r6
	mov	r2, #280
	str	r6, [r4, #3040]
	ldr	r3, [r3, #48]
	add	r0, r0, #44
	str	r6, [r4, #3052]
	add	r10, r4, #12288
	str	r6, [r4, #3056]
	mov	r7, #16
	str	r6, [r4, #3048]
	str	r6, [r4, #3044]
	str	r6, [r4, #3064]
	str	r6, [r4, #3068]
	blx	r3
	ldr	r3, .L4125
	add	r0, r4, #13440
	mov	r2, #280
	str	r6, [r10, #880]
	mov	r1, r6
	ldr	r3, [r3, #48]
	add	r0, r0, #4
	str	r7, [r10, #876]
	blx	r3
	add	r3, r4, #2928
	add	r3, r3, #4
	add	r2, r4, #2864
	mov	r0, r6
	str	r7, [r10, #1156]
	str	r6, [r10, #1160]
.L4057:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L4057
	add	r2, r4, #2992
	add	r0, r4, #4096
	add	r2, r2, #8
	mov	ip, r1
	str	r1, [r0, #780]
.L4058:
	str	ip, [r3, #4]!
	cmp	r3, r2
	mov	r1, #0
	bne	.L4058
	cmp	r9, r1
	str	r1, [r0, #784]
	bne	.L4059
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	beq	.L4059
.L4060:
	ldr	r1, [r4, #184]
	cmp	r1, #0
	addne	r2, r4, #2160
	movne	r3, #0
	addne	r2, r2, #4
	movne	r0, r3
	beq	.L4077
.L4076:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L4076
.L4077:
	ldr	r2, [r4, #168]
	cmp	r2, #0
	movne	r5, #0
	movne	r6, r5
	beq	.L4075
.L4079:
	ldr	r3, [r4, #2848]
	mov	r7, r5, asl #2
	ldr	r3, [r3, r5, asl #2]
	add	r5, r5, #1
	cmp	r3, #0
	mov	r1, r3
	beq	.L4078
	ldr	r0, [r4, #2828]
	cmp	r3, r0
	beq	.L4078
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r4, #2848]
	str	r6, [r3, r7]
	ldr	r2, [r4, #168]
.L4078:
	cmp	r2, r5
	bhi	.L4079
.L4075:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4059:
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	mov	r3, #20
	str	r3, [r4, #180]
	cmp	r2, #1
	str	r3, [r4, #184]
	beq	.L4118
.L4061:
	mov	r0, r4
	bl	HEVC_ArrangeMem
.L4083:
	cmp	r0, #0
	beq	.L4069
	cmp	r0, #2
	beq	.L4119
.L4070:
	ldr	r2, .L4125+4
	mov	r0, #0
	ldr	r1, .L4125+8
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4117:
	mov	r6, #17
	ldr	r2, .L4125+4
	str	r6, [sp]
	mov	r3, r6
	ldr	r1, .L4125+12
	mov	r0, #1
	bl	dprint_vfmw
	str	r6, [r4, #3036]
	b	.L4056
.L4116:
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	bics	r3, r3, #4
	beq	.L4053
	ldr	r2, [r4, #2392]
	cmp	r2, #0
	beq	.L4053
	ldr	r3, [r4, #2840]
	ldr	r3, [r3, #184]
	mul	r3, r3, r2
	add	r3, r3, #1
	str	r3, [r4, #3036]
	b	.L4055
.L4069:
	ldr	r0, [r4, #276]
	bl	FSP_GetTotalValidFsNum
	cmp	r0, #20
	movgt	r0, #20
	ble	.L4120
.L4072:
	str	r0, [r4, #180]
	b	.L4060
.L4118:
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	bics	r3, r3, #4
	beq	.L4061
	ldr	r3, [r4, #2392]
	ldr	r10, [r4, #2840]
	cmp	r3, #0
	str	r3, [fp, #-88]
	beq	.L4121
	ldr	r2, [r10, #140]
	mov	r6, #0
	ldr	r3, [r10, #144]
	mov	r7, r6
	rsb	r1, r2, #0
	str	r1, [fp, #-76]
	ldr	r1, [r4, #3036]
	sub	r2, r2, #1
	ldr	r9, [r0, #744]
	movw	r0, #8160
	str	r2, [fp, #-80]
	rsb	r2, r3, #0
	str	r1, [fp, #-92]
	sub	r3, r3, #1
	str	r2, [fp, #-72]
	str	r3, [fp, #-84]
	mov	r3, r6
	b	.L4066
.L4064:
	cmp	r7, r1
	movcc	r7, r1
	cmp	r6, r2
	sub	r1, r7, #32
	movcc	r6, r2
	sub	r2, r6, #32
	cmp	r1, r0
	cmpls	r2, r0
	movhi	r1, #1
	movls	r1, #0
	bhi	.L4122
	ldr	r2, [fp, #-88]
	uxtb	r3, ip
	cmp	r2, r3
	mov	r5, r3
	bls	.L4123
.L4066:
	add	r2, r4, r3, lsl #2
	ldr	lr, [fp, #-80]
	cmp	r9, r5
	add	ip, r3, #1
	ldr	r1, [r2, #2400]
	ldr	r2, [r2, #2408]
	add	r1, lr, r1
	ldr	lr, [fp, #-84]
	add	r2, lr, r2
	ldr	lr, [fp, #-76]
	and	r1, r1, lr
	ldr	lr, [fp, #-72]
	and	r2, r2, lr
	bne	.L4064
	ldr	r5, [r10, #188]
	ldr	lr, [r10, #128]
	ldr	r8, [r10, #192]
	mov	r5, r5, asl lr
	cmp	r1, r5
	mov	lr, r8, asl lr
	movcc	r1, r5
	cmp	r2, lr
	movcc	r2, lr
	b	.L4064
.L4122:
	str	r6, [sp, #4]
	mov	r0, #0
	str	r7, [sp]
	ldr	r2, .L4125+16
	ldr	r1, .L4125+20
	bl	dprint_vfmw
	b	.L4070
.L4119:
	add	r0, r4, #6144
	add	r0, r0, #40
	bl	ResetVoQueue
	mvn	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4123:
	ldr	r3, .L4125
	mov	r2, #20
	sub	r0, fp, #64
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #2856]
	str	r7, [fp, #-60]
	str	r6, [fp, #-56]
	ldr	r3, [r3, #28]
	str	r7, [fp, #-52]
	cmp	r3, #24
	str	r6, [fp, #-48]
	beq	.L4067
	ldrb	r3, [fp, #-92]	@ zero_extendqisi2
	strb	r3, [fp, #-63]
.L4084:
	sub	r1, fp, #64
	ldr	r0, [r4, #276]
	strb	r3, [fp, #-61]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L4124
	ldr	r1, [r4, #2856]
	sub	r3, fp, #68
	ldr	r0, [r4, #276]
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	bl	FSP_ConfigFrameBuf
	b	.L4083
.L4120:
	ldr	r0, [r4, #276]
	bl	FSP_GetTotalValidFsNum
	b	.L4072
.L4067:
	mov	r3, #1
	strb	r3, [fp, #-63]
	b	.L4084
.L4121:
	ldr	r3, [fp, #-88]
	ldr	r2, .L4125+16
	ldr	r1, .L4125+24
	mov	r0, r3
	bl	dprint_vfmw
	b	.L4070
.L4124:
	ldr	r2, .L4125+16
	mov	r0, #1
	ldr	r1, .L4125+28
	bl	dprint_vfmw
	b	.L4070
.L4126:
	.align	2
.L4125:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+776
	.word	.LC498
	.word	.LC161
	.word	.LANCHOR0+792
	.word	.LC497
	.word	.LC496
	.word	.LC98
	UNWIND(.fnend)
	.size	HEVC_InitDPB, .-HEVC_InitDPB
	.align	2
	.global	HEVC_ClearAllNal
	.type	HEVC_ClearAllNal, %function
HEVC_ClearAllNal:
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
	ldr	r2, [r0, #168]
	mov	r6, r0
	cmn	r2, #1
	beq	.L4131
	mov	r4, #0
	mov	r5, r4
	b	.L4130
.L4129:
	add	r3, r2, #1
	cmp	r3, r5
	bls	.L4131
.L4130:
	ldr	r1, [r6, #2852]
	add	r5, r5, #1
	add	r1, r1, r4
	add	r4, r4, #96
	ldr	r3, [r1, #32]
	cmp	r3, #1
	bne	.L4129
	ldr	r0, [r6, #276]
	bl	HEVC_ReleaseNAL
	ldr	r2, [r6, #168]
	add	r3, r2, #1
	cmp	r3, r5
	bhi	.L4130
.L4131:
	mov	r0, #0
	strb	r0, [r6, #9]
	str	r0, [r6, #148]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearAllNal, .-HEVC_ClearAllNal
	.align	2
	.global	HEVC_InitDecPara
	.type	HEVC_InitDecPara, %function
HEVC_InitDecPara:
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
	ldr	r1, .L4150
	mov	r7, r0
	mov	r0, #22
	mov	r8, #0
	bl	dprint_vfmw
	mov	r3, #-2147483647
	mov	r1, #1
	mvn	r2, #-2147483648
	strb	r8, [r7, #4]
	mov	r0, r7
	strb	r8, [r7, #12]
	add	r4, r7, #13760
	strb	r8, [r7, #5]
	mov	r6, r8
	strb	r8, [r7, #13]
	mov	r5, r8
	str	r3, [r7, #212]
	add	r4, r4, #48
	str	r3, [r7, #252]
	mov	r9, #20
	str	r3, [r7, #216]
	str	r3, [r7, #256]
	strb	r1, [r7, #6]
	strb	r1, [r7, #7]
	str	r2, [r7, #244]
	str	r2, [r7, #248]
	bl	HEVC_ClearAllNal
	add	r0, r7, #6144
	add	r0, r0, #40
	ldr	r8, .L4150+4
	bl	ResetVoQueue
.L4135:
	strb	r5, [r4, #-80]
	mov	r3, #16
	str	r5, [r4, #-32]
	mov	r0, r4
	strb	r5, [r4, #-79]
	mov	r2, #640
	str	r5, [r4, #-72]
	mov	r1, #0
	strb	r5, [r4, #-78]
	str	r9, [r4, #-60]
	str	r3, [r4, #-56]
	ldr	r3, [r8, #48]
	blx	r3
	str	r6, [r4, #148]
	add	r6, r6, #1
	sub	r3, r4, #80
	cmp	r6, #20
	str	r5, [r4, #-24]
	str	r3, [r4, #-4]
	add	r4, r4, #720
	bne	.L4135
	add	r3, r7, #2160
	add	r2, r7, #2240
	add	r3, r3, #4
	add	r2, r2, #4
	mov	r1, #0
.L4136:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L4136
	ldr	r3, [r7, #168]
	cmp	r3, #0
	beq	.L4137
	mov	r3, #0
	mov	r1, r3
.L4138:
	ldr	r2, [r7, #2848]
	str	r1, [r2, r3, asl #2]
	add	r3, r3, #1
	ldr	r2, [r7, #168]
	cmp	r2, r3
	bhi	.L4138
.L4137:
	add	r0, r7, #13120
	ldr	r3, [r8, #48]
	mov	r2, #280
	mov	r1, #0
	add	r4, r7, #12288
	add	r0, r0, #44
	blx	r3
	add	r0, r7, #13440
	mov	r5, #16
	mov	r2, #280
	ldr	r3, [r8, #48]
	mov	r1, #0
	add	r0, r0, #4
	str	r5, [r4, #876]
	blx	r3
	add	ip, r7, #3328
	add	r0, r7, #3264
	add	r1, r7, #3200
	add	ip, ip, #12
	add	r0, r0, #8
	add	r1, r1, #4
	add	lr, r7, #3408
	mov	r2, #17
	mov	r3, #0
	str	r5, [r4, #1156]
.L4139:
	subs	r2, r2, #1
	str	r3, [lr, #4]!
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [r1, #4]!
	bne	.L4139
	add	r3, r7, #2928
	add	ip, r7, #2992
	add	r3, r3, #4
	add	ip, ip, #8
	add	r0, r7, #2864
	mov	r1, r2
	mov	lr, #17
	str	r2, [r7, #3040]
	str	r2, [r7, #3044]
	str	r2, [r7, #3048]
	str	r2, [r7, #3052]
	str	r2, [r7, #3056]
	str	lr, [r7, #3036]
.L4140:
	str	r1, [r3, #4]!
	cmp	r3, ip
	str	r1, [r0, #4]!
	mov	r4, #0
	bne	.L4140
	add	r0, r7, #4800
	mov	r6, #2
	mov	r1, r4
	str	r4, [r7, #2828]
	str	r4, [r7, #204]
	mov	r2, #1376
	str	r4, [r7, #268]
	add	r0, r0, #8
	str	r4, [r7, #260]
	add	r5, r7, #2992
	str	r6, [r7, #176]
	add	r5, r5, #12
	ldr	r3, [r8, #48]
	mov	r9, #16
	blx	r3
	add	r2, r7, #4096
	mov	r3, #1
	mov	r1, r4
	str	r6, [r2, #732]
	mov	lr, #256
	str	r3, [r2, #864]
	movw	ip, #1025
	mov	r2, #20
	strb	r3, [r7, #3]
	str	r6, [r7, #2260]
	mov	r3, #8
	strb	r4, [r7, #8]
	mov	r0, r5
	str	r4, [r7, #172]
	mov	r6, #64
	str	r2, [r7, #180]
	str	r2, [r7, #184]
	mov	r2, #32
	str	r3, [r7, #196]
	str	r3, [r7, #200]
	mov	r3, #6
	ldr	r4, [r8, #48]
	str	r9, [r7, #360]
	str	r6, [r7, #364]
	str	lr, [r7, #368]
	str	ip, [r7, #372]
	str	r3, [r7, #2248]
	str	r3, [r7, #2252]
	str	r3, [r7, #2256]
	blx	r4
	str	r5, [r7, #2808]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4151:
	.align	2
.L4150:
	.word	.LC499
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_InitDecPara, .-HEVC_InitDecPara
	.align	2
	.global	HEVC_ClearCurrPic
	.type	HEVC_ClearCurrPic, %function
HEVC_ClearCurrPic:
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
	add	r4, r0, #4096
	mov	r5, r0
	bl	HEVC_ClearAllSlice
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L4153
	ldr	r1, [r3, #28]
	mov	r2, #1
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #68]
	mov	r3, #0
	str	r3, [r2, #48]
	str	r3, [r4, #68]
.L4153:
	mov	r0, #0
	strb	r0, [r4, #9]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearCurrPic, .-HEVC_ClearCurrPic
	.align	2
	.global	HEVC_ClearAll
	.type	HEVC_ClearAll, %function
HEVC_ClearAll:
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
	mov	r5, r1
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	cmp	r5, #0
	bne	.L4160
	add	r0, r4, #6144
	add	r0, r0, #40
	bl	ResetVoQueue
	ldr	r0, [r4, #276]
	bl	FSP_EmptyInstance
.L4159:
	mov	r0, r4
	bl	HEVC_InitDecPara
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4160:
	add	r1, r4, #6144
	ldr	r0, [r4, #276]
	add	r1, r1, #40
	bl	FSP_ClearNotInVoQueue
	b	.L4159
	UNWIND(.fnend)
	.size	HEVC_ClearAll, .-HEVC_ClearAll
	.align	2
	.global	HEVC_InitPic
	.type	HEVC_InitPic, %function
HEVC_InitPic:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #76)
	sub	sp, sp, #76
	ldr	r1, [r0, #292]
	ldr	r3, [r0, #288]
	add	r2, r0, #4096
	mov	r10, r0
	ldr	r6, [r0, #304]
	mov	r4, r1
	str	r1, [fp, #-84]
	ldr	r1, [r0, #296]
	str	r3, [fp, #-76]
	ldr	r3, [r2, #748]
	str	r1, [fp, #-80]
	ldr	r1, [r0, #300]
	cmp	r3, #0
	ldr	r7, [r0, #308]
	str	r1, [fp, #-68]
	blt	.L4191
	ldr	r1, [r0, #164]
	cmp	r3, r1
	bge	.L4191
	ldr	r1, [r0, #2820]
	movw	r5, #5036
	movw	r8, #12668
	ldr	r2, [r2, #744]
	ldr	r9, [r0, #2816]
	movw	ip, #24912
	mla	r5, r5, r3, r1
	add	r2, r0, r2, lsl #2
	ldr	r0, [r0, #2812]
	ldr	r1, [r5, #32]
	mul	r8, r8, r1
	add	r1, r9, r8
	str	r1, [fp, #-64]
	mov	lr, r1
	ldr	r1, [r1, #48]
	str	r3, [r2, #236]
	ldr	r3, [r5, #32]
	mla	r1, ip, r1, r0
	str	r3, [r2, #228]
	ldr	r3, [lr, #48]
	str	r3, [r2, #220]
	ldr	r2, [r10, #172]
	ldr	r3, [lr, #128]
	clz	ip, r2
	ldr	r2, [fp, #-68]
	ldr	r0, [lr, #64]
	subs	r3, r2, r3
	mov	r2, ip, lsr #5
	str	r2, [fp, #-72]
	movne	r3, #1
	cmp	r4, r0
	movne	r2, #1
	strne	r2, [fp, #-88]
	beq	.L4217
.L4163:
	ldr	r0, [fp, #-72]
	ldr	r2, [r10, #2836]
	ldr	ip, [fp, #-88]
	orr	r3, r3, r0
	ldr	r0, [r1, #4]
	orr	r4, ip, r3
	ldr	r3, [r2, #4]
	cmp	r3, r0
	movne	r3, #1
	beq	.L4218
.L4164:
	ldr	r2, [fp, #-72]
	orrs	r3, r3, r2
	beq	.L4165
	mov	r0, r10
	bl	HEVC_UpdatePicVPS
.L4165:
	ldr	r3, [r10, #2840]
	ldr	r2, [fp, #-64]
	ldr	r1, [r3, #56]
	ldr	r2, [r2, #56]
	cmp	r1, r2
	movne	r2, #1
	beq	.L4219
.L4166:
	orrs	r2, r2, r4
	streq	r2, [fp, #-92]
	beq	.L4167
	ldr	r2, [fp, #-64]
	mov	r0, r10
	ldr	r3, [r3, #184]
	mov	r1, r2
	ldr	r2, [r2, #184]
	subs	r3, r2, r3
	movne	r3, #1
	str	r3, [fp, #-92]
	bl	HEVC_UpdatePicSPS
.L4167:
	ldr	r2, [r10, #2844]
	ldr	r3, [r5, #28]
	ldr	r2, [r2, #28]
	cmp	r2, r3
	movne	r3, #1
	beq	.L4220
.L4168:
	orrs	r3, r3, r4
	beq	.L4169
	mov	r2, r5
	ldr	r1, [fp, #-64]
	mov	r0, r10
	bl	HEVC_UpdatePicPPS
.L4169:
	ldr	r3, [r10, #304]
	cmp	r6, r3
	movne	r3, #1
	strne	r3, [fp, #-96]
	beq	.L4221
.L4170:
	ldr	r2, [r10, #2840]
	ldr	r1, [r10, #2856]
	ldr	r3, [r2, #96]
	ldr	r2, [r2, #88]
	cmp	r3, r2
	movcc	r3, r2
	str	r3, [r1, #964]
	ldr	r3, [r10, #2836]
	str	r3, [fp, #-60]
	add	r3, r3, #16384
	ldr	r3, [r3, #160]
	cmp	r3, #0
	beq	.L4184
	add	r9, r3, #1
	add	r3, r10, #2384
	cmp	r9, #2
	add	r3, r3, #12
	mov	r8, #0
	str	r3, [fp, #-52]
	movcs	r9, #2
	ldr	r3, [fp, #-60]
	cmp	r8, r9
	str	r9, [r10, #2392]
	add	r3, r3, #24832
	str	r3, [fp, #-48]
	bcs	.L4184
.L4183:
	add	r3, r8, #1
	ldr	r4, [r10, #2836]
	cmp	r3, r9
	str	r3, [fp, #-56]
	bcs	.L4181
	mov	r2, r8, asl #5
	add	r7, r4, #12288
	add	r2, r2, r8, lsl #3
	ldr	r3, [fp, #-60]
	add	r7, r7, r2
	ldr	r2, [fp, #-48]
	rsb	r3, r3, #40
	add	r6, r7, #12480
	add	r3, r3, r2
	add	r7, r7, #12544
	add	r6, r6, #60
	add	r7, r7, #4
	add	r4, r4, r3
	ldr	r5, [fp, #-56]
	b	.L4180
.L4178:
	ldrb	r3, [r10, #2]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4179
	mov	r3, #1
	strb	r3, [r10, #2]
	ldr	ip, [r4, #4]
	ldr	r3, [r6, #4]
	str	ip, [sp, #12]
	ldr	ip, [r4]
	stmib	sp, {r5, ip}
	ldr	ip, [r7]
	str	ip, [sp]
	bl	dprint_vfmw
.L4179:
	add	r5, r5, #1
	add	r4, r4, #40
	cmp	r5, r9
	bcs	.L4181
.L4180:
	ldr	ip, [r6, #4]
	mov	r2, r8
	ldr	r3, [r4]
	mov	r0, #32
	ldr	r1, .L4224
	cmp	ip, r3
	bne	.L4178
	ldr	ip, [r7]
	ldr	r3, [r4, #4]
	cmp	ip, r3
	bne	.L4178
	add	r5, r5, #1
	add	r4, r4, #40
	cmp	r5, r9
	bcc	.L4180
.L4181:
	ldr	r1, [fp, #-52]
	ldr	r3, [fp, #-48]
	ldr	r2, [r1, #4]!
	ldr	r3, [r3]
	cmp	r2, r3
	str	r1, [fp, #-52]
	bne	.L4176
	ldr	r2, [fp, #-52]
	ldr	r1, [r2, #8]
	ldr	r2, [fp, #-48]
	ldr	r2, [r2, #4]
	cmp	r1, r2
	beq	.L4182
.L4176:
	ldr	lr, [fp, #-52]
	mov	r0, #32
	ldr	r2, [fp, #-48]
	ldr	r1, .L4224+4
	str	r3, [lr]
	ldr	ip, [r2, #4]
	mov	r2, r8
	str	ip, [lr, #8]
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r10, #2396]
.L4182:
	ldr	r9, [r10, #2392]
	ldr	r8, [fp, #-56]
	ldr	r3, [fp, #-48]
	cmp	r8, r9
	add	r3, r3, #40
	str	r3, [fp, #-48]
	bcc	.L4183
.L4184:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-76]
	ldr	r3, [r3, #56]
	cmp	r2, r3
	beq	.L4222
.L4172:
	ldr	r3, [fp, #-92]
	mov	r0, r10
	ldr	r2, [fp, #-80]
	ldr	r1, [fp, #-84]
	str	r3, [sp]
	ldr	r3, [fp, #-68]
	bl	HEVC_GetReRangeFlag
	cmp	r0, #0
	bne	.L4186
	ldr	r3, [r10, #2856]
	ldr	r2, [r3, #952]
	cmp	r2, #1
	beq	.L4186
.L4187:
	mov	r2, #0
	str	r2, [r3, #968]
.L4185:
	ldr	r3, [r10, #2368]
	cmp	r3, #0
	bne	.L4189
	mov	r0, r10
	bl	HEVC_AllocFrameStore
	subs	r4, r0, #0
	bne	.L4223
.L4189:
	mov	r0, r10
	bl	HEVC_InitPicInfo
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4191:
	mov	r0, #0
.L4162:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4186:
	mov	r1, #1
	mov	r0, r10
	bl	HEVC_InitDPB
	cmn	r0, #2
	beq	.L4162
	cmp	r0, #0
	bne	.L4188
	ldr	r3, [r10, #2856]
	b	.L4187
.L4222:
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-88]
	orr	r3, r3, r2
	ldr	r2, [fp, #-92]
	orr	r3, r3, r2
	ldr	r2, [fp, #-96]
	orrs	r3, r3, r2
	bne	.L4172
	ldr	r3, [r10, #2856]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	bne	.L4185
	b	.L4172
.L4221:
	ldr	r3, [r10, #308]
	subs	r3, r7, r3
	movne	r3, #1
	str	r3, [fp, #-96]
	b	.L4170
.L4220:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	adds	r3, r3, #0
	movne	r3, #1
	b	.L4168
.L4219:
	ldrb	r2, [r9, r8]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	b	.L4166
.L4218:
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	adds	r3, r3, #0
	movne	r3, #1
	b	.L4164
.L4217:
	ldr	r2, [lr, #68]
	ldr	r0, [fp, #-80]
	subs	r2, r0, r2
	movne	r2, #1
	str	r2, [fp, #-88]
	b	.L4163
.L4223:
	ldr	r1, .L4224+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	b	.L4162
.L4188:
	mov	r2, r0
	ldr	r1, .L4224+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r10
	mov	r1, #0
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L4162
.L4225:
	.align	2
.L4224:
	.word	.LC500
	.word	.LC501
	.word	.LC503
	.word	.LC502
	UNWIND(.fnend)
	.size	HEVC_InitPic, .-HEVC_InitPic
	.align	2
	.global	HEVC_OutputCurrPic
	.type	HEVC_OutputCurrPic, %function
HEVC_OutputCurrPic:
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
	add	r5, r0, #4096
	mov	r6, r0
	mov	r2, #640
	add	r1, r5, #72
	ldr	r4, [r5, #68]
	add	r0, r4, #80
	ldr	r3, [r4, #48]
	cmp	r3, #1
	movne	r3, #2
	strne	r3, [r4, #48]
	ldr	r3, [r5, #48]
	str	r3, [r4, #16]
	bl	memcpy
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_GetImagePara
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4237
.L4228:
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_OutputFrame
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r2, .L4238
	mov	r0, #0
	ldr	r1, .L4238+4
	bl	dprint_vfmw
	mov	r0, r6
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4237:
	mov	r2, #1
	ldr	r1, [r4, #28]
	ldr	r0, [r6, #276]
	bl	FSP_SetRef
	b	.L4228
.L4239:
	.align	2
.L4238:
	.word	.LANCHOR0+812
	.word	.LC504
	UNWIND(.fnend)
	.size	HEVC_OutputCurrPic, .-HEVC_OutputCurrPic
	.align	2
	.global	HEVC_FirstFrameFastOut
	.type	HEVC_FirstFrameFastOut, %function
HEVC_FirstFrameFastOut:
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
	bl	HEVC_OutputCurrPic
	subs	r5, r0, #0
	bne	.L4243
	add	r3, r4, #4096
	add	r1, r4, #8192
	mov	r2, #1
	mov	ip, #2
	ldr	r0, [r3, #68]
	str	ip, [r0, #52]
	str	r2, [r1, #3592]
	ldr	r0, [r3, #16]
	ldr	r1, [r3, #20]
	add	r4, r4, r0, lsl #2
	mov	r0, r5
	str	r1, [r4, #212]
	ldr	r3, [r3, #68]
	strb	r2, [r3, #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4243:
	ldr	r2, .L4244
	mov	r0, #1
	ldr	r1, .L4244+4
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4245:
	.align	2
.L4244:
	.word	.LANCHOR0+832
	.word	.LC505
	UNWIND(.fnend)
	.size	HEVC_FirstFrameFastOut, .-HEVC_FirstFrameFastOut
	.align	2
	.global	HEVC_OutputFrmToVO
	.type	HEVC_OutputFrmToVO, %function
HEVC_OutputFrmToVO:
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
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L4251
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r6, r0, #0
	beq	.L4255
	cmn	r6, #3
	bne	.L4256
.L4250:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4255:
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_OutputFrame
	cmp	r0, #0
	beq	.L4250
	ldr	r2, .L4257
	mov	r0, r6
	ldr	r1, .L4257+4
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4256:
	mov	r3, r6
	movw	r2, #12005
	ldr	r1, .L4257+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #228]
	mov	r0, r4
	bl	HEVC_DECRecycleImage
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4251:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4258:
	.align	2
.L4257:
	.word	.LANCHOR0+856
	.word	.LC504
	.word	.LC506
	UNWIND(.fnend)
	.size	HEVC_OutputFrmToVO, .-HEVC_OutputFrmToVO
	.align	2
	.global	HEVC_DirectOutput
	.type	HEVC_DirectOutput, %function
HEVC_DirectOutput:
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
	add	r3, r0, #4096
	mov	r5, #0
	mov	r6, r0
	mov	ip, #1
	ldr	r4, [r3, #68]
	mov	r0, #2
	add	r1, r3, #72
	mov	r2, #640
	str	r0, [r4, #48]
	add	r0, r4, #80
	strb	ip, [r4, #2]
	strb	r5, [r4, #1]
	ldr	ip, [r3, #24]
	str	ip, [r4, #12]
	ldr	r3, [r3, #48]
	str	r3, [r4, #16]
	bl	memcpy
	mov	r2, r5
	str	r5, [r4, #56]
	ldr	r1, [r4, #28]
	ldr	r0, [r6, #276]
	bl	FSP_SetRef
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_OutputFrmToVO
	ldr	r3, .L4260
	str	r5, [r4, #48]
	mov	r1, r5
	mov	r2, #704
	ldr	r3, [r3, #48]
	mov	r7, r0
	add	r0, r6, #4096
	add	r0, r0, #8
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4261:
	.align	2
.L4260:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_DirectOutput, .-HEVC_DirectOutput
	.align	2
	.global	HEVC_IModeProcess
	.type	HEVC_IModeProcess, %function
HEVC_IModeProcess:
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
	bl	HEVC_DirectOutput
	add	r2, r4, #4096
	ldr	r1, [r4, #184]
	ldr	r3, [r2, #44]
	cmp	r3, r1
	addne	r3, r3, #540
	addne	r3, r3, #2
	movne	ip, #0
	strne	ip, [r4, r3, asl #2]
	strne	r1, [r2, #44]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IModeProcess, .-HEVC_IModeProcess
	.align	2
	.global	HEVC_RemoveFrmFullDPB
	.type	HEVC_RemoveFrmFullDPB, %function
HEVC_RemoveFrmFullDPB:
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
	ldr	lr, [r0, #3040]
	mov	r5, r0
	cmp	lr, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #3200
	mvn	ip, #-2147483648
	add	r0, r0, #4
	mvn	r4, #0
	mov	r3, #0
.L4267:
	ldr	r2, [r0, #4]!
	ldr	r1, [r2, #8]
	cmp	r1, ip
	bge	.L4266
	ldr	r2, [r2]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	moveq	ip, r1
	moveq	r4, r3
.L4266:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L4267
	cmn	r4, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r3, r5, r4, lsl #2
	mov	r1, #1
	mov	r0, r5
	ldr	r2, [r3, #3208]
	strb	r1, [r2, #2]
	ldr	r1, [r3, #3208]
	bl	HEVC_OutputFrmToVO
	mov	r1, r4
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVC_RemoveFrameStoreOutDPB
	UNWIND(.fnend)
	.size	HEVC_RemoveFrmFullDPB, .-HEVC_RemoveFrmFullDPB
	.align	2
	.global	HEVC_OutputFrmFromDPB
	.type	HEVC_OutputFrmFromDPB, %function
HEVC_OutputFrmFromDPB:
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
	add	r8, r0, #4096
	mov	r5, r0
	ldr	r0, [r0, #3040]
	ldr	r7, [r8, #16]
	cmp	r0, #0
	beq	.L4294
	add	r10, r7, #52
	mov	r3, #0
	add	r6, r5, #3200
	str	r3, [fp, #-48]
	add	r6, r6, #4
	add	r10, r5, r10, lsl #2
	mov	r4, r3
	b	.L4279
.L4277:
	add	r4, r4, #1
	cmp	r0, r4
	bls	.L4276
.L4279:
	ldr	r3, [r6, #4]!
	ldrb	r9, [r3, #2]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L4277
	ldr	r2, [r3, #32]
	cmp	r2, r7
	bne	.L4277
	ldr	r3, [r3, #8]
	ldr	r2, [r10, #4]
	cmp	r3, r2
	blt	.L4278
	add	r4, r4, #1
	ldr	r3, [fp, #-48]
	cmp	r0, r4
	add	r3, r3, #1
	str	r3, [fp, #-48]
	bhi	.L4279
.L4276:
	ldr	r3, [r5, #2376]
	cmp	r3, #1
	beq	.L4312
	ldr	r3, [r8, #736]
	ldr	r2, [r5, #2840]
	add	r3, r3, #90
	ldr	r9, [r2, r3, asl #2]
.L4281:
	cmp	r0, #0
	beq	.L4295
	add	r6, r5, #3200
	mov	r4, #0
	add	r6, r6, #4
	add	r10, r5, r7, lsl #2
	str	r4, [fp, #-52]
	b	.L4292
.L4315:
	ldr	ip, [r5, #356]
	cmp	ip, #1
	beq	.L4288
.L4289:
	cmp	r2, #0
	bne	.L4287
	ldr	r3, [r8, #724]
	ldr	r2, [r1, #8]
	add	r3, r3, #100
	cmp	r2, r3
	ble	.L4287
	ldr	r3, [r10, #244]
	cmp	r3, #-2147483647
	beq	.L4287
	ldr	r3, [r5, #356]
	cmp	r3, #1
	beq	.L4313
.L4287:
	add	r4, r4, #1
	cmp	r0, r4
	bls	.L4311
.L4292:
	ldr	r1, [r6, #4]!
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L4283
	ldr	r3, [r1, #32]
	cmp	r3, r7
	beq	.L4314
.L4283:
	add	r3, r5, r7, lsl #2
	ldr	r3, [r3, #212]
.L4285:
	cmp	r3, #0
	bne	.L4315
.L4288:
	ldr	ip, [r1, #8]
	cmp	r3, ip
	ble	.L4289
	cmp	r2, #0
	beq	.L4316
.L4290:
	str	ip, [sp]
	mov	r0, #31
	ldr	r2, .L4317
	add	r4, r4, #1
	ldr	r1, .L4317+4
	bl	dprint_vfmw
	ldr	r0, [r5, #3040]
	cmp	r0, r4
	bhi	.L4292
.L4311:
	ldr	r0, [fp, #-52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4314:
	ldr	ip, [r1, #8]
	ldr	r3, [r10, #212]
	cmp	ip, r3
	str	ip, [fp, #-56]
	ble	.L4285
	ldr	lr, [fp, #-48]
	ldr	ip, [r8, #736]
	cmp	lr, r9
	movhi	lr, #1
	movls	lr, #0
	cmp	ip, #7
	movhi	lr, #0
	cmp	lr, #0
	beq	.L4285
	ldr	lr, [r8, #724]
	ldr	ip, [fp, #-56]
	cmp	ip, lr
	blt	.L4286
	add	ip, r5, r7
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L4285
.L4286:
	mov	r3, #1
	mov	r0, r5
	strb	r3, [r1, #2]
	ldr	r1, [r6]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r6]
	ldr	r2, [fp, #-48]
	ldr	r3, [r3, #8]
	sub	r2, r2, #1
	str	r2, [fp, #-48]
	str	r3, [r10, #212]
	str	r0, [fp, #-52]
	ldr	r0, [r5, #3040]
	b	.L4287
.L4316:
	ldr	r1, [r1, #28]
	ldr	r0, [r5, #276]
	bl	FSP_SetDisplay
	ldr	r2, [r6]
	add	r3, r5, r7, lsl #2
	ldr	ip, [r2, #8]
	ldr	r3, [r3, #212]
	b	.L4290
.L4278:
	str	r2, [sp]
	mov	r0, #31
	ldr	r2, .L4317
	ldr	r1, .L4317+8
	bl	dprint_vfmw
	ldr	r3, [r6]
	ldr	r0, [r5, #276]
	mov	r2, r9
	ldr	r1, [r3, #28]
	bl	FSP_SetDisplay
	ldr	r0, [r5, #3040]
	b	.L4277
.L4312:
	ldr	r1, [r5, #2840]
	mov	r9, #0
	add	r3, r1, #356
	add	r1, r1, #388
.L4280:
	ldr	r2, [r3, #4]!
	cmp	r9, r2
	movcc	r9, r2
	cmp	r3, r1
	bne	.L4280
	b	.L4281
.L4313:
	strb	r3, [r1, #2]
	mov	r0, r5
	ldr	r3, [fp, #-48]
	ldr	r1, [r6]
	sub	r3, r3, #1
	str	r3, [fp, #-48]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r10, #212]
	ldr	ip, [r8, #724]
	ldr	r2, .L4317
	cmp	ip, r3
	ldr	r1, .L4317+12
	sublt	r3, ip, #1
	strlt	r3, [r10, #212]
	ldr	r3, [r6]
	ldr	r3, [r3, #8]
	str	ip, [sp]
	str	r0, [fp, #-52]
	mov	r0, #31
	bl	dprint_vfmw
	ldr	r0, [r5, #3040]
	b	.L4287
.L4294:
	str	r0, [fp, #-48]
	b	.L4276
.L4295:
	str	r0, [fp, #-52]
	b	.L4311
.L4318:
	.align	2
.L4317:
	.word	.LANCHOR0+876
	.word	.LC508
	.word	.LC507
	.word	.LC509
	UNWIND(.fnend)
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
	.align	2
	.global	HEVC_OutputOneFrmFromDPB
	.type	HEVC_OutputOneFrmFromDPB, %function
HEVC_OutputOneFrmFromDPB:
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
	add	r4, r0, r1, lsl #2
	mov	r2, #1
	mov	r6, r1
	mov	r5, r0
	ldr	r3, [r4, #3208]
	strb	r2, [r3, #2]
	ldr	r1, [r4, #3208]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r4, #3208]
	ldr	r2, [r3, #32]
	ldr	r1, [r3, #8]
	add	r2, r5, r2, lsl #2
	str	r1, [r2, #212]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r0
	bne	.L4320
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
.L4320:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_OutputOneFrmFromDPB, .-HEVC_OutputOneFrmFromDPB
	.align	2
	.global	HEVC_OutputUnRefPicWithMinPoc
	.type	HEVC_OutputUnRefPicWithMinPoc, %function
HEVC_OutputUnRefPicWithMinPoc:
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
	sub	r1, fp, #24
	mov	r4, r0
	bl	HEVC_GetUnRefPicWithMinPoc
	cmp	r0, #0
	bne	.L4325
	mov	r0, r4
	ldr	r1, [fp, #-24]
	bl	HEVC_OutputOneFrmFromDPB
	cmp	r0, #0
	bne	.L4326
.L4323:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L4325:
	ldr	r2, .L4327
	mov	r0, #1
	ldr	r1, .L4327+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4323
.L4326:
	ldr	r2, .L4327
	mov	r0, #1
	ldr	r1, .L4327+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4323
.L4328:
	.align	2
.L4327:
	.word	.LANCHOR0+900
	.word	.LC510
	.word	.LC511
	UNWIND(.fnend)
	.size	HEVC_OutputUnRefPicWithMinPoc, .-HEVC_OutputUnRefPicWithMinPoc
	.align	2
	.global	HEVC_FlushOutputFrmFromDPB
	.type	HEVC_FlushOutputFrmFromDPB, %function
HEVC_FlushOutputFrmFromDPB:
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
	subs	r4, r0, #0
	beq	.L4338
	ldr	r3, [r4, #3040]
	cmp	r3, #0
	addne	r5, r4, #3200
	movne	r6, #0
	addne	r5, r5, #4
	movne	r8, #1
	bne	.L4336
	b	.L4337
.L4344:
	strb	r8, [r3, #2]
	ldr	r1, [r5]
	bl	HEVC_OutputFrmToVO
	cmn	r0, #1
	mov	r9, r0
	beq	.L4343
.L4334:
	ldr	r3, [r4, #3040]
	cmp	r3, r6
	bls	.L4337
.L4336:
	ldr	r3, [r5, #4]!
	mov	r2, #0
	ldr	r0, [r4, #276]
	add	r6, r6, #1
	ldr	r1, [r3, #28]
	bl	FSP_SetRef
	ldr	r3, [r5]
	mov	r0, r4
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L4344
	ldr	r1, [r3, #28]
	ldr	r0, [r4, #276]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L4334
	ldr	r3, [r5]
	ldr	r0, [r4, #276]
	ldr	r1, [r3, #28]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #3040]
	cmp	r3, r6
	bhi	.L4336
.L4337:
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	mov	r9, #0
	str	r3, [r4, #216]
	bl	HEVC_InitDecBuffers
.L4330:
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4343:
	mov	r0, r7
	ldr	r2, .L4345
	ldr	r1, .L4345+4
	bl	dprint_vfmw
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4338:
	mvn	r9, #0
	b	.L4330
.L4346:
	.align	2
.L4345:
	.word	.LANCHOR0+932
	.word	.LC512
	UNWIND(.fnend)
	.size	HEVC_FlushOutputFrmFromDPB, .-HEVC_FlushOutputFrmFromDPB
	.align	2
	.global	HEVC_ReceivePacket
	.type	HEVC_ReceivePacket, %function
HEVC_ReceivePacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r6, [r0, #2828]
	mov	r3, #0
	mov	r4, r0
	cmp	r6, r3
	str	r3, [r0, #352]
	beq	.L4377
	ldrb	r3, [r1]	@ zero_extendqisi2
	str	r3, [r6, #36]
	ldr	r3, [r0, #2856]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L4378
.L4354:
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4355
	ldr	r3, [r4, #2828]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bls	.L4356
	ldr	r0, [r3, #36]
	cmp	r0, #1
	beq	.L4355
.L4356:
	ldr	r0, [r1, #16]
	cmp	r0, #0
	ble	.L4357
	ldr	r0, [r1, #4]
	cmp	r0, #0
	beq	.L4357
	ldr	ip, [r1, #8]
	cmp	ip, #0
	bne	.L4379
.L4357:
	mov	r2, #1
	str	r2, [r3, #36]
	ldr	r1, [r1, #20]
	ldr	r0, [r4, #276]
	bl	SM_ReleaseStreamSeg
.L4353:
	ldr	r3, [r4, #2828]
	ldr	r0, [r3, #36]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
.L4351:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L4379:
	mov	lr, r2, asl #5
	mov	ip, #0
	sub	r2, lr, r2, asl #2
	add	r3, r3, r2
	str	r0, [r3, #40]
	ldr	r3, [r4, #2828]
	ldr	lr, [r1, #16]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #44]
	ldr	r3, [r4, #2828]
	ldr	lr, [r1, #8]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #48]
	ldr	r3, [r4, #2828]
	ldr	lr, [r1, #20]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #64]
	ldr	r3, [r4, #2828]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	ip, [r3, #56]
	ldr	r2, [r4, #2828]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	ldr	r3, [r4, #2856]
	ldrb	r3, [r3, #976]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4358
	add	r3, r4, #4096
	ldr	r0, [r1, #16]
	ldr	r2, [r3, #60]
	ldr	ip, [r3, #64]
	add	r0, r0, r2
	str	r0, [r3, #60]
	ldr	r2, [r1, #16]
	add	r2, r2, ip
	str	r2, [r3, #64]
.L4358:
	mov	r0, r4
	bl	HEVC_CombinePacket
	mov	r3, #1
	str	r3, [r4, #352]
	b	.L4353
.L4378:
	ldr	r3, [r3, #952]
	cmp	r3, #0
	bne	.L4353
	b	.L4354
.L4377:
	ldr	r3, [r1, #16]
	cmp	r3, #0
	ble	.L4349
	ldr	r3, [r1, #4]
	cmp	r3, #0
	beq	.L4349
	ldr	r3, [r1, #8]
	str	r1, [fp, #-32]
	cmp	r3, #0
	beq	.L4349
	bl	HEVC_FindNaluArraySlot
	ldr	r1, [fp, #-32]
	cmn	r0, #1
	mov	r5, r0
	beq	.L4380
	ldr	r3, [r4, #2852]
	mov	r0, r0, asl #7
	sub	r0, r0, r5, asl #5
	mov	r2, #1
	add	r0, r3, r0
	str	r0, [r4, #2828]
	ldr	r3, [r1, #4]
	str	r3, [r0, #40]
	ldr	r3, [r4, #2828]
	ldr	r0, [r1, #16]
	str	r0, [r3, #44]
	ldr	r3, [r4, #2828]
	ldr	r0, [r1, #20]
	str	r0, [r3, #64]
	ldr	r3, [r4, #2828]
	ldr	r0, [r1, #8]
	str	r0, [r3, #48]
	ldr	r3, [r4, #2828]
	str	r6, [r3, #56]
	ldr	r3, [r4, #2828]
	str	r2, [r3, #8]
	ldr	r3, [r4, #2828]
	strb	r6, [r3]
	ldr	r3, [r4, #2828]
	ldrb	r2, [r1]	@ zero_extendqisi2
	str	r2, [r3, #36]
	ldr	r3, [r4, #2856]
	ldrb	r3, [r3, #976]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4352
	add	r3, r4, #4096
	ldr	r0, [r1, #16]
	ldr	r2, [r3, #60]
	ldr	ip, [r3, #64]
	add	r0, r0, r2
	str	r0, [r3, #60]
	ldr	r2, [r1, #16]
	add	r2, r2, ip
	str	r2, [r3, #64]
.L4352:
	ldr	r3, [r1, #12]
	str	r3, [r4, #2364]
	b	.L4353
.L4355:
	ldr	r1, .L4381
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4351
.L4349:
	ldr	r1, .L4381+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4351
.L4380:
	ldr	r1, .L4381+8
	mov	r0, r6
	bl	dprint_vfmw
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ClearAll
	mov	r0, r5
	b	.L4351
.L4382:
	.align	2
.L4381:
	.word	.LC515
	.word	.LC514
	.word	.LC513
	UNWIND(.fnend)
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
	.align	2
	.global	HEVC_FlushDPB
	.type	HEVC_FlushDPB, %function
HEVC_FlushDPB:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r1, [r0, #3040]
	mov	r4, r0
	cmp	r1, #0
	beq	.L4385
	add	r6, r0, #3200
	mov	r5, #0
	add	r6, r6, #4
	mov	r7, r5
	b	.L4387
.L4386:
	cmp	r1, r5
	bls	.L4385
.L4387:
	ldr	r3, [r6, #4]!
	add	r5, r5, #1
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L4386
	strb	r7, [r3, #1]
	mov	r2, #0
	ldr	r1, [r3, #28]
	ldr	r0, [r4, #276]
	bl	FSP_SetRef
	ldr	r1, [r4, #3040]
	cmp	r1, r5
	bhi	.L4387
.L4385:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L4389
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L4385
	b	.L4389
.L4391:
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	beq	.L4390
.L4389:
	ldr	r3, [r4, #3040]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L4391
	mov	r0, r3
.L4390:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FlushDPB, .-HEVC_FlushDPB
	.align	2
	.global	HEVC_ClearDPB
	.type	HEVC_ClearDPB, %function
HEVC_ClearDPB:
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
	bl	HEVC_FlushDPB
	subs	r3, r0, #0
	beq	.L4400
	ldr	r2, .L4404
	mov	r0, #0
	ldr	r1, .L4404+4
	bl	dprint_vfmw
.L4400:
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4405:
	.align	2
.L4404:
	.word	.LANCHOR0+960
	.word	.LC516
	UNWIND(.fnend)
	.size	HEVC_ClearDPB, .-HEVC_ClearDPB
	.align	2
	.global	HEVC_RecoverDPBProcess
	.type	HEVC_RecoverDPBProcess, %function
HEVC_RecoverDPBProcess:
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
	mov	r4, r0
	b	.L4407
.L4409:
	str	lr, [sp]
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L4415
.L4407:
	ldr	ip, [r4, #3040]
	mov	r0, #13
	ldr	lr, [r4, #3036]
	ldr	r2, .L4416
	cmp	ip, lr
	ldr	r1, .L4416+4
	mov	r3, ip
	bcs	.L4409
	b	.L4411
.L4412:
	str	lr, [sp]
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_OutputUnRefPicWithMinPoc
	cmp	r0, #0
	bne	.L4410
	ldr	ip, [r4, #3040]
	ldr	lr, [r4, #3036]
.L4411:
	cmp	ip, lr
	mov	r3, ip
	ldr	r2, .L4416
	mov	r0, #1
	ldr	r1, .L4416+8
	bcs	.L4412
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L4415:
	ldr	r2, .L4416
	mov	r0, #1
	ldr	r1, .L4416+12
	bl	dprint_vfmw
	ldr	ip, [r4, #3040]
	ldr	lr, [r4, #3036]
	b	.L4411
.L4410:
	ldr	r2, .L4416
	mov	r0, #1
	ldr	r1, .L4416+16
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_PrintDPBState
	mov	r0, r4
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	HEVC_ClearDPB
.L4417:
	.align	2
.L4416:
	.word	.LANCHOR0+976
	.word	.LC517
	.word	.LC519
	.word	.LC518
	.word	.LC511
	UNWIND(.fnend)
	.size	HEVC_RecoverDPBProcess, .-HEVC_RecoverDPBProcess
	.align	2
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
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
	cmp	r1, #16
	mov	r7, r1
	mov	r6, r0
	mov	r4, r2
	bhi	.L4422
	ldr	r3, [r2, #60]
	add	r5, r0, r1, lsl #2
	mov	r1, #1
	mov	r8, #0
	mov	r2, r1
	str	r3, [r5, #3208]
	str	r1, [r3, #48]
	ldr	r3, [r5, #3208]
	ldr	r0, [r0, #276]
	ldr	r1, [r3, #28]
	bl	FSP_SetRef
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r1, [r5, #3208]
	mov	r2, #640
	subs	r3, r3, r8
	movne	r3, #1
	strb	r3, [r1, #1]
	ldr	r3, [r5, #3208]
	add	r1, r4, #64
	ldr	r0, [r4, #36]
	str	r0, [r3, #20]
	ldr	r0, [r5, #3208]
	add	r0, r0, #80
	bl	memcpy
	ldr	r3, [r5, #3208]
	ldr	r2, [r4, #40]
	add	r0, r6, #3200
	add	r1, r7, #1
	add	r0, r0, #8
	str	r2, [r3, #16]
	mov	r2, #4
	ldr	r3, [r5, #3208]
	ldr	ip, [r4, #60]
	str	ip, [r3, #76]
	ldr	r3, [r5, #3208]
	ldr	ip, [r4, #16]
	str	ip, [r3, #12]
	ldr	r3, [r5, #3208]
	ldr	ip, [r4, #12]
	str	ip, [r3, #8]
	ldr	r3, [r5, #3208]
	ldr	ip, [r4, #8]
	str	ip, [r3, #32]
	ldr	ip, [r5, #3208]
	ldr	r3, .L4424
	str	r8, [ip, #72]
	bl	qsort
	ldr	r3, [r6, #3040]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r6, #3040]
	ldr	r1, [r4, #60]
	bl	HEVC_GetAPC
	subs	r3, r0, #0
	bne	.L4423
	mov	r0, r3
	strb	r3, [r4, #1]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4422:
	mov	r3, r1
	ldr	r2, .L4424+4
	ldr	r1, .L4424+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	bl	HEVC_ClearDPB
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4423:
	ldr	r2, .L4424+4
	mov	r0, r8
	ldr	r1, .L4424+12
	bl	dprint_vfmw
	mov	r0, r6
	bl	HEVC_PrintDPBState
	mov	r0, r6
	bl	HEVC_ClearDPB
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4425:
	.align	2
.L4424:
	.word	HEVC_ComparePicByPocAsc
	.word	.LANCHOR0+1000
	.word	.LC520
	.word	.LC521
	UNWIND(.fnend)
	.size	HEVC_InsertFrmInDPB, .-HEVC_InsertFrmInDPB
	.align	2
	.global	HEVC_SimpleDPBProcess
	.type	HEVC_SimpleDPBProcess, %function
HEVC_SimpleDPBProcess:
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
	add	r4, r0, #4096
	mov	r5, r0
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4439
	ldr	r3, [r4, #68]
	mov	r2, #2
	str	r2, [r3, #48]
.L4428:
	ldr	r3, [r4, #68]
	mov	r2, #1
	mov	r0, r5
	strb	r2, [r3, #2]
	ldr	r1, [r4, #68]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r4, r0
	beq	.L4440
	cmn	r0, #3
	beq	.L4432
	mov	r0, r5
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L4441
.L4432:
	mov	r0, #0
.L4429:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4439:
	bl	HEVC_SimpleSlideDPB
	add	r2, r4, #8
	ldr	r1, [r5, #3040]
	mov	r0, r5
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	beq	.L4428
	str	r0, [sp]
	movw	r3, #11097
	ldr	r2, .L4442
	mov	r0, #0
	ldr	r1, .L4442+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4429
.L4441:
	ldr	r2, .L4442
	mov	r0, #0
	ldr	r1, .L4442+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4429
.L4440:
	ldr	r2, .L4442
	mov	r0, #0
	ldr	r1, .L4442+12
	bl	dprint_vfmw
	mov	r0, r4
	b	.L4429
.L4443:
	.align	2
.L4442:
	.word	.LANCHOR0+1020
	.word	.LC522
	.word	.LC505
	.word	.LC523
	UNWIND(.fnend)
	.size	HEVC_SimpleDPBProcess, .-HEVC_SimpleDPBProcess
	.align	2
	.global	HEVC_DecOrderProcess
	.type	HEVC_DecOrderProcess, %function
HEVC_DecOrderProcess:
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
	ldr	r1, [r0, #3040]
	mov	r4, r0
	ldr	r3, [r0, #3036]
	cmp	r1, r3
	bcs	.L4456
.L4445:
	add	r2, r4, #4096
	mov	r0, r4
	add	r2, r2, #8
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L4457
	add	r3, r4, #4096
	mov	r0, r4
	ldr	r1, [r3, #68]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r5, r0
	beq	.L4458
	cmn	r0, #3
	beq	.L4451
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L4459
.L4451:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4456:
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L4455
	ldr	r2, .L4460
	mov	r0, #0
	ldr	r1, .L4460+4
	bl	dprint_vfmw
.L4455:
	ldr	r1, [r4, #3040]
	b	.L4445
.L4457:
	ldr	r2, .L4460
	mov	r0, #0
	ldr	r1, .L4460+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4459:
	mov	r0, r6
	ldr	r2, .L4460
	ldr	r1, .L4460+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4458:
	mov	r0, r6
	ldr	r2, .L4460
	ldr	r1, .L4460+16
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4461:
	.align	2
.L4460:
	.word	.LANCHOR0+1044
	.word	.LC524
	.word	.LC525
	.word	.LC505
	.word	.LC523
	UNWIND(.fnend)
	.size	HEVC_DecOrderProcess, .-HEVC_DecOrderProcess
	.align	2
	.global	HEVC_DispOrderProcess
	.type	HEVC_DispOrderProcess, %function
HEVC_DispOrderProcess:
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
	add	r3, r0, #8192
	mov	r4, r0
	ldr	r3, [r3, #3592]
	cmp	r3, #1
	beq	.L4463
	bl	HEVC_FirstFrameFastOut
	cmp	r0, #0
	bne	.L4486
.L4463:
	ldr	r1, [r4, #3040]
	ldr	r3, [r4, #3036]
	cmp	r1, r3
	bcs	.L4487
.L4465:
	add	r2, r4, #4096
	mov	r0, r4
	add	r2, r2, #8
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L4488
	ldr	r3, [r4, #3040]
	cmp	r3, #0
	bne	.L4489
.L4468:
	ldr	r2, [r4, #3036]
	cmp	r2, r3
	bls	.L4490
.L4485:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4490:
	add	r1, r4, #6144
	ldr	r0, [r4, #276]
	add	r1, r1, #40
	bl	FSP_IfCanGetDecFs
	cmp	r0, #0
	beq	.L4485
	mov	r0, r4
	bl	HEVC_RemoveFrmFullDPB
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4487:
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L4484
	ldr	r1, .L4491
	mov	r0, #0
	bl	dprint_vfmw
.L4484:
	ldr	r1, [r4, #3040]
	b	.L4465
.L4489:
	mov	r0, r4
	bl	HEVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L4469
	ldr	r3, [r4, #3040]
	b	.L4468
.L4488:
	mov	r2, r0
	ldr	r1, .L4491+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4486:
	ldr	r2, .L4491+8
	mov	r0, #0
	ldr	r1, .L4491+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4469:
	ldr	r2, .L4491+8
	mov	r0, #1
	ldr	r1, .L4491+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4492:
	.align	2
.L4491:
	.word	.LC527
	.word	.LC528
	.word	.LANCHOR0+1068
	.word	.LC526
	.word	.LC529
	UNWIND(.fnend)
	.size	HEVC_DispOrderProcess, .-HEVC_DispOrderProcess
	.align	2
	.global	HEVC_StorePicInDPB
	.type	HEVC_StorePicInDPB, %function
HEVC_StorePicInDPB:
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
	add	r6, r0, #4096
	mov	r4, r0
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L4545
	ldr	r2, [r0, #276]
	ldr	r3, .L4557
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L4546
.L4496:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4547
.L4497:
	ldrb	r5, [r6, #9]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L4548
	ldr	r2, [r6, #48]
	cmp	r2, #0
	beq	.L4502
	ldr	r5, [r6, #24]
	cmp	r5, #0
	beq	.L4549
.L4503:
	ldr	r3, [r4, #2856]
	ldr	r1, [r3, #4]
	cmp	r1, r2
	bcs	.L4502
	ldr	r5, [r3, #644]
	cmp	r5, #0
	beq	.L4550
.L4502:
	ldr	r3, [r4, #2864]
	ldr	r2, [r6, #68]
	add	r3, r3, #4096
	ldr	r3, [r3, #1088]
	str	r3, [r2, #40]
	ldr	r3, [r4, #2864]
	ldr	r2, [r6, #68]
	add	r3, r3, #4096
	ldr	r3, [r3, #1092]
	str	r3, [r2, #44]
	ldr	r3, [r4, #280]
	cmp	r3, #2
	beq	.L4551
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	beq	.L4552
	cmp	r3, #1
	beq	.L4553
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bls	.L4513
.L4495:
	mov	r0, r4
	mvn	r5, #0
	bl	HEVC_ClearCurrPic
	ldr	r2, .L4557+4
	ldr	r1, .L4557+8
	mov	r0, #1
	bl	dprint_vfmw
.L4514:
	mov	r3, #0
	strb	r3, [r6, #9]
.L4543:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4547:
	ldr	lr, [r6, #16]
	cmp	lr, #0
	beq	.L4497
	mov	r3, #280
	mul	r3, r3, lr
	add	r2, r4, r3
	add	r2, r2, #13120
	ldr	ip, [r2, #44]
	cmp	ip, #0
	beq	.L4497
	add	r1, r3, #13120
	add	r3, r3, #13376
	add	r1, r1, #48
	add	r3, r3, #52
	add	r1, r4, r1
	add	r3, r4, r3
	mov	r2, #0
	b	.L4499
.L4498:
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, ip
	beq	.L4497
.L4499:
	ldr	r0, [r1, #4]!
	cmp	r0, #0
	beq	.L4498
	ldrsb	r0, [r3]
	cmp	r0, #0
	beq	.L4498
	mov	r3, #70
	mov	r0, #280
	mla	r3, r3, lr, r2
	mov	r1, #0
	mla	lr, r0, lr, r4
	add	r3, r4, r3, lsl #2
	add	r0, lr, #13120
	add	r3, r3, #12288
	add	r2, lr, r2
	add	r2, r2, #13376
	str	r1, [r3, #884]
	str	r1, [r3, #948]
	str	r1, [r3, #1012]
	ldr	ip, [r0, #48]
	sub	ip, ip, #1
	str	ip, [r0, #48]
	strb	r1, [r2, #52]
	str	r1, [r3, #1076]
	b	.L4497
.L4546:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L4496
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L4496
	add	r3, r0, #8192
	ldrb	r3, [r3, #3536]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4496
	bl	HEVC_Sei_Get_Frame_Pts
	b	.L4496
.L4552:
	mov	r0, r4
	bl	HEVC_SimpleDPBProcess
	subs	r5, r0, #0
	bne	.L4554
.L4510:
	movw	r3, #11418
	mov	r2, r5
	ldr	r1, .L4557+12
	mov	r0, #14
	bl	dprint_vfmw
.L4508:
	cmn	r5, #1
	bne	.L4514
	b	.L4495
.L4550:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, [r4, #2856]
	ldr	r2, [r6, #48]
	mov	r0, #1
	ldr	r1, .L4557+16
	ldr	r3, [r3, #4]
	bl	dprint_vfmw
	b	.L4543
.L4548:
	ldr	r2, .L4557+4
	mov	r0, #1
	ldr	r1, .L4557+20
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4553:
	mov	r0, r4
	bl	HEVC_DecOrderProcess
	subs	r5, r0, #0
	beq	.L4555
	ldr	r2, .L4557+4
	mov	r0, #0
	ldr	r1, .L4557+24
	bl	dprint_vfmw
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bhi	.L4508
.L4513:
	mov	r0, r4
	bl	HEVC_DispOrderProcess
	subs	r5, r0, #0
	beq	.L4514
	ldr	r2, .L4557+4
	mov	r0, #0
	ldr	r1, .L4557+28
	bl	dprint_vfmw
	b	.L4508
.L4549:
	ldr	r2, .L4557+4
	mov	r0, #1
	ldr	r1, .L4557+32
	bl	dprint_vfmw
	ldr	r3, .L4557+36
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L4544
	mov	r3, r5
	mov	r2, r5
	mov	r1, #111
	ldr	r0, [r4, #276]
	blx	r7
.L4544:
	ldr	r2, [r6, #48]
	b	.L4503
.L4551:
	mov	r0, r4
	bl	HEVC_DirectOutput
	ldr	r3, [r6, #44]
	ldr	r2, [r4, #184]
	cmp	r3, r2
	addne	r3, r3, #540
	addne	r3, r3, #2
	movne	r1, #0
	strne	r1, [r4, r3, asl #2]
	mov	r5, r0
	strne	r2, [r6, #44]
	cmp	r0, #0
	bne	.L4556
.L4507:
	movw	r3, #11403
	mov	r2, r5
	ldr	r1, .L4557+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L4508
.L4545:
	mov	r0, r3
	ldr	r1, .L4557+40
	bl	dprint_vfmw
	movw	r3, #11337
	mvn	r2, #0
	ldr	r1, .L4557+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L4495
.L4555:
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bls	.L4513
	b	.L4514
.L4556:
	ldr	r2, .L4557+4
	mov	r0, #0
	ldr	r1, .L4557+44
	bl	dprint_vfmw
	b	.L4507
.L4554:
	ldr	r2, .L4557+4
	mov	r0, #0
	ldr	r1, .L4557+48
	bl	dprint_vfmw
	b	.L4510
.L4558:
	.align	2
.L4557:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+1092
	.word	.LC539
	.word	.LC531
	.word	.LC534
	.word	.LC532
	.word	.LC537
	.word	.LC538
	.word	.LC533
	.word	g_event_report
	.word	.LC530
	.word	.LC535
	.word	.LC536
	UNWIND(.fnend)
	.size	HEVC_StorePicInDPB, .-HEVC_StorePicInDPB
	.align	2
	.global	HEVC_CreateLostPicture
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 704
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #704)
	sub	sp, sp, #704
	ldr	r3, .L4604
	mov	r4, r0
	mov	r5, r1
	sub	r0, fp, #740
	mov	r2, #704
	ldr	r3, [r3, #48]
	mov	r1, #0
	blx	r3
	add	r0, r4, #13696
	add	r0, r0, #32
	mov	r6, #0
.L4564:
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bne	.L4560
	cmp	r0, #0
	beq	.L4581
	ldr	ip, [r4, #3040]
	cmp	ip, #0
	beq	.L4581
	ldr	r2, [r4, #3208]
	cmp	r0, r2
	beq	.L4560
	add	r2, r4, #3200
	add	r2, r2, #8
	b	.L4562
.L4563:
	ldr	r1, [r2, #4]!
	cmp	r0, r1
	beq	.L4560
.L4562:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L4563
.L4581:
	mov	r8, #720
	mov	r7, r0
	mla	r8, r8, r6, r4
	mov	r2, #640
	sub	r0, fp, #676
	mov	r9, #1
	mov	r3, #101
	str	r5, [fp, #-728]
	add	r1, r8, #13760
	str	r3, [fp, #-700]
	add	r1, r1, #48
	strb	r9, [fp, #-739]
	strb	r9, [fp, #-740]
	bl	memcpy
	add	r2, r8, #13696
	add	r3, r8, #13760
	cmp	r6, #19
	movw	r1, #13728
	strb	r9, [r2, #34]
	mov	r6, #0
	str	r7, [fp, #-680]
	str	r6, [r3, #20]
	str	r6, [fp, #-524]
	strb	r9, [r8, r1]
	bgt	.L4565
	ldr	r0, [r4, #3040]
	cmp	r0, #0
	beq	.L4567
	add	r1, r4, #3200
	mov	ip, r6
	add	r1, r1, #4
	mvn	r2, #-2147483648
	mov	r8, r1
.L4570:
	ldr	lr, [r8, #4]!
	add	ip, ip, #1
	ldr	r3, [lr, #8]
	rsb	r3, r5, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bge	.L4569
	ldrb	lr, [lr, #1]	@ zero_extendqisi2
	cmp	lr, #0
	movne	r2, r3
	movne	r6, #1
.L4569:
	cmp	ip, r0
	bne	.L4570
	cmp	r6, #0
	beq	.L4567
	mov	r6, #0
	b	.L4571
.L4572:
	add	r6, r6, #1
	cmp	r6, r0
	beq	.L4573
.L4571:
	ldr	ip, [r1, #4]!
	ldr	r3, [ip, #8]
	rsb	r3, r5, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bne	.L4572
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4572
	ldr	r1, [ip, #28]
	add	r6, r4, r6, lsl #2
	ldr	r0, [r4, #276]
	ldr	r9, [ip, #32]
	bl	FSP_GetLogicFs
	ldr	r2, [r6, #3208]
	mov	r3, r5
	ldr	r1, .L4604+4
	ldr	r2, [r2, #8]
	mov	r8, r0
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r8, #0
	beq	.L4573
	ldr	r0, [r8, #28]
	cmp	r0, #0
	beq	.L4602
	mov	r1, #0
	ldr	r0, [r4, #276]
	bl	FSP_NewLogicFs
	mov	r7, r0
	mov	r1, r0
	ldr	r0, [r4, #276]
	bl	FSP_GetLogicFs
	mvn	r2, r7
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r3, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L4576
	ldr	r1, [fp, #-680]
	sub	r2, fp, #740
	mov	r0, r4
	str	r7, [r1, #28]
	ldr	r1, [r8, #28]
	str	r1, [r3, #28]
	ldr	r1, [r8, #32]
	str	r1, [r3, #32]
	ldrsb	r3, [r8, #4]
	ldr	r1, [r4, #3040]
	str	r9, [fp, #-732]
	str	r3, [fp, #-704]
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L4603
	ldr	r0, [r4, #276]
	mov	r1, r7
	mov	r2, r6
	bl	FSP_SetDisplay
	add	r3, r4, #4096
	mov	r0, r6
	ldr	r3, [r3, #744]
	add	r4, r4, r3, lsl #2
	ldr	r3, [r4, #244]
	cmn	r3, #-2147483647
	streq	r5, [r4, #244]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4560:
	add	r6, r6, #1
	add	r0, r0, #720
	cmp	r6, #20
	bne	.L4564
.L4565:
	ldr	r1, .L4604+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L4597:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4573:
	ldr	r1, .L4604+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4576:
	ldr	r3, [fp, #-680]
	mov	r0, r2
	ldr	r1, .L4604+16
	strb	r2, [r3]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4597
.L4603:
	ldr	r3, [fp, #-680]
	mov	r1, r7
	mov	r5, #0
	mov	r2, #1
	strb	r5, [r3]
	ldr	r0, [r4, #276]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	ldr	r1, .L4604+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4597
.L4567:
	mov	r0, #0
	ldr	r1, .L4604+24
	strb	r0, [r7]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4597
.L4602:
	ldr	r1, .L4604+28
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	b	.L4597
.L4605:
	.align	2
.L4604:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC543
	.word	.LC540
	.word	.LC541
	.word	.LC545
	.word	.LC546
	.word	.LC542
	.word	.LC544
	UNWIND(.fnend)
	.size	HEVC_CreateLostPicture, .-HEVC_CreateLostPicture
	.align	2
	.global	HEVC_RefPicProcess
	.type	HEVC_RefPicProcess, %function
HEVC_RefPicProcess:
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
	mov	r4, r0
	bl	HEVC_RemoveDummyFrame
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L4607
.L4611:
	mov	r0, r4
	add	r5, r4, #4096
	bl	HEVC_ApplyReferencePictureSet
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	b	.L4608
.L4617:
	bl	HEVC_CheckThatAllRefPicsAreAvailable.part.15
	ldr	r1, .L4629
	cmp	r0, #0
	mov	r0, #1
	bne	.L4621
	ldr	r2, [fp, #-24]
	bl	dprint_vfmw
	ldr	r3, [r4, #2856]
	mov	r0, r4
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L4615
	ldr	r1, [fp, #-24]
	bl	HEVC_CreateLostPicture
	cmp	r0, #0
	bne	.L4627
.L4608:
	ldr	r3, [r5, #740]
	sub	r1, fp, #24
	mov	r0, r4
	sub	r3, r3, #19
	cmp	r3, #2
	bhi	.L4617
.L4621:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4628
.L4619:
	mov	r0, r4
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	mov	r0, r4
	bl	HEVC_RecoverDPBProcess
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4615:
	ldr	ip, [fp, #-24]
	mov	r0, #1
	ldr	r3, [r5, #724]
	ldr	r1, .L4629+4
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4627:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4607:
	ldr	r3, [r4, #3064]
	cmp	r3, #0
	addne	r3, r4, #3056
	movne	r2, #0
	addne	r3, r3, #12
	movne	ip, r2
	beq	.L4613
.L4612:
	ldr	r1, [r3, #4]!
	add	r2, r2, #1
	str	ip, [r1, #60]
	ldr	r1, [r3]
	str	r0, [r1, #64]
	ldr	r1, [r4, #3064]
	cmp	r2, r1
	bcc	.L4612
.L4613:
	ldr	r3, [r4, #3068]
	cmp	r3, #0
	addne	r2, r4, #3136
	movne	r3, #0
	movne	r0, #1
	movne	ip, r3
	beq	.L4611
.L4614:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	str	ip, [r1, #60]
	ldr	r1, [r2]
	str	r0, [r1, #64]
	ldr	r1, [r4, #3068]
	cmp	r3, r1
	bcc	.L4614
	b	.L4611
.L4628:
	mov	r0, r4
	bl	HEVC_UpdateInterLayerReflist
	b	.L4619
.L4630:
	.align	2
.L4629:
	.word	.LC547
	.word	.LC548
	UNWIND(.fnend)
	.size	HEVC_RefPicProcess, .-HEVC_RefPicProcess
	.align	2
	.global	HEVC_DecVDM
	.type	HEVC_DecVDM, %function
HEVC_DecVDM:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r3, [r0, #176]
	mov	r4, r0
	cmp	r3, #2
	bls	.L4690
	ldr	r3, [r0, #320]
	add	r5, r0, #4096
	ldr	r2, [r0, #324]
	mov	r0, #1
	ldr	r1, [r4, #2856]
	add	r3, r3, r0
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #320]
	rsb	r3, r2, r3
	str	r3, [r1, #584]
	strb	r0, [r5, #8]
	ldr	r6, [r4, #272]
	ldr	r2, [r4, #280]
	ubfx	r6, r6, #16, #3
	cmp	r2, r6
	beq	.L4636
	subs	r3, r6, #2
	sub	r1, r2, #2
	movne	r3, #1
	cmp	r1, r0
	movhi	r3, #0
	cmp	r3, #0
	beq	.L4636
	cmp	r6, #4
	cmpne	r6, r0
	bls	.L4691
.L4636:
	cmp	r6, #2
	str	r6, [r4, #280]
	beq	.L4638
	cmp	r6, #3
	bne	.L4686
.L4687:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
.L4685:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L4686:
	ldr	r3, [r4, #260]
	cmp	r3, #0
	beq	.L4655
	cmp	r6, #4
	ldr	r3, [r5, #24]
	beq	.L4692
.L4644:
	cmp	r3, #2
	bne	.L4646
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4693
.L4657:
	ldr	r2, [r4, #264]
	mov	r0, #2
	ldr	r1, .L4695
	sub	r2, r2, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #204]
	cmp	r3, #0
	beq	.L4694
	ldr	r1, [r5, #36]
	add	r0, r4, #8192
	ldr	ip, [r5, #40]
	clz	r2, r1
	str	ip, [r5, #3772]
	mov	r2, r2, lsr #5
	str	r2, [r5, #3780]
	str	r3, [r0, #832]
	ldr	r3, [r4, #2856]
	ldr	r2, [r3, #600]
	strb	r2, [r5, #2440]
	ldr	r2, [r3, #604]
	strb	r2, [r5, #2441]
	ldr	r2, [r3, #608]
	strb	r2, [r5, #2443]
	ldr	r2, [r3, #612]
	strb	r2, [r5, #2444]
	ldr	r3, [r3, #652]
	str	r3, [r5, #3768]
	ldr	r3, [r4, #264]
	cmp	r3, #0
	beq	.L4651
	add	r2, r4, #6528
	add	r3, r5, #4096
	add	r2, r2, #8
	str	r2, [r4, #2864]
	ldr	ip, [r5, #52]
	add	r1, r1, #1
	mov	r2, #0
	str	ip, [r3, #3528]
	ldr	ip, [r5, #56]
	str	ip, [r3, #3532]
	str	r1, [r5, #36]
	str	r2, [r3, #3524]
	ldr	r1, [r5, #24]
	cmp	r1, r2
	bne	.L4651
	ldr	r2, [r0, #836]
	cmp	r2, #0
	beq	.L4660
.L4654:
	ldr	r3, [r2]
	ldr	r0, [r2, #4]
	ldr	r2, [r2, #1504]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L4654
.L4653:
	ldr	r3, .L4695+4
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L4651
	sub	r2, fp, #28
	ldr	r0, [r4, #276]
	mov	r3, #4
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	r6
.L4651:
	ldr	ip, [r5, #64]
	mov	r0, #0
	ldr	r1, [r5, #68]
	ldr	r3, [r5, #60]
	str	ip, [r5, #60]
	ldr	r2, [r1, #320]
	rsb	r3, ip, r3
	add	r2, r2, r3
	str	r2, [r1, #320]
	ldr	r2, [r5, #312]
	add	r3, r3, r2
	str	r3, [r5, #312]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L4646:
	cmp	r3, #1
	streqb	r3, [r4, #8]
	b	.L4657
.L4638:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L4642
	ldr	r3, [r4, #260]
	cmp	r3, #0
	bne	.L4657
.L4655:
	ldr	r3, .L4695+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4642
	mov	r3, #0
	mov	r1, #127
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r5
.L4642:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L4685
.L4692:
	cmp	r3, #0
	moveq	r3, #2
	streqb	r3, [r4, #8]
	beq	.L4657
	b	.L4644
.L4693:
	ldr	r3, .L4695+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4657
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bhi	.L4657
	mov	r3, #1
	ldr	r2, [r5, #20]
	mov	r0, r3
	ldr	r1, .L4695+12
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, .L4695+4
	ldr	r5, [r3]
	cmp	r5, #0
	mvneq	r0, #0
	beq	.L4685
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #127
	blx	r5
	mvn	r0, #0
	b	.L4685
.L4691:
	mov	r3, r6
	ldr	r1, .L4695+16
	bl	dprint_vfmw
	str	r6, [r4, #280]
	b	.L4687
.L4694:
	ldr	r2, .L4695+4
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L4649
	mov	r2, r3
	mov	r1, #127
	ldr	r0, [r4, #276]
	blx	r5
.L4649:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r2, .L4695+20
	ldr	r1, .L4695+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4685
.L4690:
	bl	HEVC_ClearCurrPic
	ldr	r3, .L4695+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4633
	mov	r3, #0
	mov	r1, #127
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r5
.L4633:
	ldr	r3, [r4, #268]
	cmp	r3, #524288
	bls	.L4634
	ldr	r1, .L4695+28
	mov	r0, #0
	bl	dprint_vfmw
.L4634:
	ldr	r1, .L4695+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4685
.L4660:
	mov	r1, r2
	b	.L4653
.L4696:
	.align	2
.L4695:
	.word	.LC553
	.word	g_event_report
	.word	g_allow_B_before_P
	.word	.LC552
	.word	.LC551
	.word	.LANCHOR0+1112
	.word	.LC554
	.word	.LC549
	.word	.LC550
	UNWIND(.fnend)
	.size	HEVC_DecVDM, .-HEVC_DecVDM
	.align	2
	.global	HEVC_VES_Splitter
	.type	HEVC_VES_Splitter, %function
HEVC_VES_Splitter:
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
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r0, #2808]
	mov	r1, #16
	mov	r9, r2
	str	r3, [fp, #-56]
	mov	r10, #0
	str	r10, [fp, #-48]
	bl	BsGet
	mov	r1, #8
	add	r6, r4, #4096
	mov	r7, r0
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #24
	and	r8, r0, #31
	ldr	r0, [r4, #2808]
	bl	BsBack
	ldr	r2, [r6, #504]
	cmp	r5, r10
	str	r10, [r6, #492]
	str	r2, [fp, #-48]
	beq	.L4699
	cmp	r5, #1
	bne	.L4847
	cmp	r9, #1
	beq	.L4848
	movw	r0, #31745
	cmp	r8, #25
	cmpeq	r7, r0
	moveq	r8, #1
	movne	r8, #0
	bne	.L4728
	ldr	r7, .L4858
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L4729
	mov	r3, r10
	mov	r2, r10
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	r5
.L4729:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2828]
	subs	r5, r0, #0
	beq	.L4730
.L4844:
	cmp	r1, #0
	beq	.L4733
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4733:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L4835
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4707
.L4847:
	mov	r2, r5
	ldr	r1, .L4858+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
.L4707:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4699:
	cmp	r9, #1
	beq	.L4849
	bic	r7, r7, #512
	movw	r3, #31745
	cmp	r7, r3
	beq	.L4850
.L4742:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4728:
	movw	r3, #32257
	cmp	r7, r3
	movne	r0, r5
	bne	.L4707
	ldr	r1, .L4858+8
	movw	r3, #2553
	ldr	r2, .L4858+12
	mov	r0, r8
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4835
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2828]
	mvn	r0, #0
	b	.L4707
.L4850:
	ldr	r1, .L4858+16
	movw	r3, #2408
	ldr	r2, .L4858+12
	mov	r0, r5
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4835
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2828]
	mvn	r0, #0
	b	.L4707
.L4730:
	ldr	r3, [r1, #44]
	sub	r2, r3, #1
	sub	r3, r3, #6
	cmp	r2, #4096
	str	r3, [r6, #492]
	bhi	.L4851
	ldr	r0, [r1, #72]
	sub	r2, fp, #48
	ldr	r3, [r1, #44]
	ldr	r1, [r6, #496]
	add	r3, r3, r0
	ldr	r0, [r4, #276]
	sub	r3, r3, #1
	bl	MetadataMapToSec
	subs	r8, r0, #0
	bne	.L4852
	ldr	r5, .L4858+20
	mov	r2, #5
	ldr	r1, .L4858+24
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2828]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #40]
	add	r0, r0, #5
	ldr	r2, [r6, #492]
	add	r1, r1, #6
	blx	r3
	ldr	r0, [r6, #492]
	add	r3, r0, #5
	str	r3, [r6, #492]
	ldr	r1, [r4, #2828]
	ldr	r2, [r1, #72]
	cmp	r2, #0
	beq	.L4735
	add	ip, r3, r2
	cmp	ip, #4096
	bls	.L4736
	add	r2, r0, #10
	ldr	r1, .L4858+28
	movw	r3, #2511
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4737
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2828]
.L4737:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L4738
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r5
.L4738:
	ldr	r0, [r4, #276]
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movwne	r3, #2518
	beq	.L4835
.L4834:
	ldr	r2, .L4858+12
	mov	r0, #0
	ldr	r1, .L4858+32
	bl	dprint_vfmw
.L4835:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4848:
	ldr	r3, [fp, #-56]
	movw	r2, #31745
	cmp	r7, r2
	cmpeq	r3, #2
	moveq	r5, #1
	movne	r5, #0
	cmp	r8, #25
	movne	r5, #0
	andeq	r5, r5, #1
	cmp	r5, #0
	bne	.L4853
	movw	r3, #32257
	cmp	r7, r3
	beq	.L4854
	cmp	r7, r2
	bne	.L4855
.L4717:
	ldr	r1, [r4, #2828]
.L4841:
	cmp	r1, #0
	beq	.L4719
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2828]
	mov	r0, r5
	b	.L4707
.L4849:
	movw	r0, #31745
	cmp	r8, #25
	cmpeq	r7, r0
	moveq	r8, #1
	movne	r8, #0
	bne	.L4702
	ldr	r7, .L4858
	ldr	r8, [r7]
	cmp	r8, #0
	beq	.L4703
	mov	r3, r5
	mov	r2, r5
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	r8
.L4703:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2828]
	subs	r5, r0, #0
	beq	.L4704
	cmp	r1, #0
	beq	.L4709
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4709:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L4835
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	b	.L4835
.L4702:
	movw	r3, #32257
	cmp	r7, r3
	bne	.L4742
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4719
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2828]
	mov	r0, r8
	b	.L4707
.L4851:
	ldr	r1, .L4858+28
	movw	r3, #2487
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4733
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2828]
	b	.L4733
.L4719:
	mov	r0, #0
	b	.L4707
.L4704:
	ldr	r3, [r1, #44]
	sub	r2, r3, #1
	sub	r3, r3, #6
	cmp	r2, #4096
	str	r3, [r6, #492]
	bls	.L4708
	ldr	r1, .L4858+28
	movw	r3, #2322
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4709
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2828]
	b	.L4709
.L4736:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #68]
	add	r0, r0, r3
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r4, #2828]
	ldr	r2, [r6, #492]
	ldr	r3, [r3, #72]
	add	r3, r3, r2
	str	r3, [r6, #492]
.L4735:
	ldr	r0, [r4, #276]
	ldr	r7, .L4858+36
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L4739
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r4, #276]
	ldr	r1, [r6, #492]
	ldr	r3, [r5, #44]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r4, #276]
.L4739:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	movwne	r3, #2541
	beq	.L4717
	b	.L4834
.L4855:
	mov	r1, #8
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	ldr	r0, [r4, #2808]
	ubfx	r5, r5, #1, #6
	bl	BsSkip
	cmp	r5, #49
	beq	.L4856
.L4727:
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4719
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2828]
	b	.L4707
.L4853:
	ldr	r7, .L4858
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L4722
	mov	r3, r10
	mov	r2, r10
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	r5
.L4722:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2828]
	subs	r5, r0, #0
	beq	.L4841
	b	.L4844
.L4708:
	ldr	r0, [r1, #72]
	sub	r2, fp, #48
	ldr	r3, [r1, #44]
	ldr	r1, [r6, #496]
	add	r3, r3, r0
	ldr	r0, [r4, #276]
	sub	r3, r3, #1
	bl	MetadataMapToSec
	subs	r8, r0, #0
	bne	.L4857
	ldr	r5, .L4858+20
	mov	r2, #5
	ldr	r1, .L4858+24
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2828]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #40]
	add	r0, r0, #5
	ldr	r2, [r6, #492]
	add	r1, r1, #6
	blx	r3
	ldr	r0, [r6, #492]
	add	r3, r0, #5
	str	r3, [r6, #492]
	ldr	r1, [r4, #2828]
	ldr	r2, [r1, #72]
	cmp	r2, #0
	beq	.L4712
	add	ip, r3, r2
	cmp	ip, #4096
	bls	.L4713
	add	r2, r0, #10
	ldr	r1, .L4858+28
	movw	r3, #2346
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4714
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2828]
.L4714:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L4715
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r5
.L4715:
	ldr	r0, [r4, #276]
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movwne	r3, #2353
	beq	.L4835
	b	.L4834
.L4713:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #68]
	add	r0, r0, r3
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r4, #2828]
	ldr	r2, [r6, #492]
	ldr	r3, [r3, #72]
	add	r3, r3, r2
	str	r3, [r6, #492]
.L4712:
	ldr	r0, [r4, #276]
	ldr	r7, .L4858+36
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L4716
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r4, #276]
	ldr	r1, [r6, #492]
	ldr	r3, [r5, #44]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r4, #276]
.L4716:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	beq	.L4717
	movw	r3, #2381
	b	.L4834
.L4854:
	ldr	r0, [r4, #2808]
	mov	r1, #16
	bl	BsSkip
	mov	r0, r9
	b	.L4707
.L4856:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	bne	.L4727
	ldr	r3, [r4, #2828]
	ldr	r0, [r4, #2808]
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	ldr	r0, [r4, #2808]
	mov	r1, #24
	bl	BsSkip
	mov	r0, #2
	b	.L4707
.L4852:
	mov	r0, r5
	movw	r3, #2499
	ldr	r2, .L4858+12
	ldr	r1, .L4858+40
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4707
.L4857:
	mov	r0, r5
	movw	r3, #2334
	ldr	r2, .L4858+12
	ldr	r1, .L4858+40
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4707
.L4859:
	.align	2
.L4858:
	.word	g_event_report
	.word	.LC560
	.word	.LC559
	.word	.LANCHOR0+1124
	.word	.LC558
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+208
	.word	.LC555
	.word	.LC557
	.word	vfmw_save_metadata_file
	.word	.LC556
	UNWIND(.fnend)
	.size	HEVC_VES_Splitter, .-HEVC_VES_Splitter
	.align	2
	.global	HEVC_CRAOutputFrame
	.type	HEVC_CRAOutputFrame, %function
HEVC_CRAOutputFrame:
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
	ldr	r0, [r0, #3040]
	cmp	r0, #0
	beq	.L4872
	add	r2, r4, #3200
	mov	r5, #0
	add	r2, r2, #4
	mov	r3, r5
.L4863:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	cmp	r1, #0
	addeq	r5, r5, #1
	cmp	r3, r0
	bne	.L4863
.L4864:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L4864
	cmp	r5, #0
	ble	.L4866
.L4870:
	ldr	r1, [r4, #3040]
	cmp	r1, #0
	beq	.L4867
	ldr	r3, [r4, #3208]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4874
	add	r2, r4, #3200
	mov	r3, #0
	add	r2, r2, #8
	b	.L4871
.L4868:
	ldr	r0, [r2, #4]!
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L4874
.L4871:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L4868
.L4867:
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	subs	r5, r5, #1
	bne	.L4870
.L4866:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4874:
	mov	r1, r3
	b	.L4867
.L4872:
	mov	r5, r0
	b	.L4864
	UNWIND(.fnend)
	.size	HEVC_CRAOutputFrame, .-HEVC_CRAOutputFrame
	.align	2
	.global	HEVC_DecSlice
	.type	HEVC_DecSlice, %function
HEVC_DecSlice:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r3, [r0, #2828]
	add	r5, r0, #4096
	ldr	r2, .L4969
	mov	ip, #0
	mov	r4, r0
	ldr	r1, [r3, #16]
	str	r1, [r5, #740]
	ldr	r1, [r3, #28]
	str	r1, [r5, #736]
	ldr	r6, [r3, #24]
	str	r6, [r5, #744]
	ldr	r1, [r0, #276]
	strb	ip, [r0, #3]
	ldr	r2, [r2, r1, asl #2]
	ldrsb	r1, [r2, #44]
	cmp	r1, #1
	beq	.L4955
.L4885:
	ldr	r3, [r5, #864]
	cmp	r3, #1
	beq	.L4956
.L4886:
	ldr	r2, [r4, #204]
	ldr	r3, [r4, #152]
	cmp	r2, r3
	bcs	.L4957
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4958
	mov	r0, r4
	bl	HEVC_PicTypeStatistic
	mov	r0, r4
	bl	HEVC_CalcStreamBits
	ldr	r3, [r5, #864]
	cmp	r3, #2
	beq	.L4907
	ldr	r3, [r4, #2368]
	cmp	r3, #0
	bne	.L4908
	ldrb	r3, [r5, #713]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4959
.L4908:
	mov	r0, r4
	bl	HEVC_WriteSliceMsg
	cmp	r0, #0
	bne	.L4960
.L4911:
	ldr	r3, [r4, #2368]
	cmp	r3, #0
	beq	.L4961
.L4913:
	ldr	r3, [r4, #3488]
	mov	r0, #0
	str	r3, [r5, #52]
	ldr	r3, [r4, #3492]
	str	r3, [r5, #56]
.L4894:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4961:
	ldr	r3, [r5, #748]
	mov	r2, #1
	str	r3, [r4, #328]
	ldr	r3, [r5, #724]
	str	r2, [r4, #172]
	str	r3, [r4, #284]
	b	.L4913
.L4956:
	ldr	r3, [r5, #12]
	sub	r3, r3, #16
	cmp	r3, #5
	movls	r1, #0
	bls	.L4887
	ldr	r1, [r5, #732]
	cmp	r1, #0
	subne	r1, r1, #1
	clzne	r1, r1
	moveq	r1, #2
	movne	r1, r1, lsr #5
.L4887:
	ldr	r3, [r4, #2368]
	cmp	r3, #0
	bne	.L4891
	ldr	r3, [r5, #740]
	clz	r7, r6
	sub	r3, r3, #16
	mov	r7, r7, lsr #5
	cmp	r3, #4
	cmpls	r6, #0
	bne	.L4962
.L4892:
	mov	r0, r4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L4963
.L4893:
	cmp	r7, #0
	beq	.L4895
	add	r3, r4, r6
	ldrb	r8, [r3, #4]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L4964
.L4895:
	ldr	r0, [r4, #2856]
	ldr	r1, [r0, #12]
	cmp	r1, #0
	bne	.L4896
	ldr	r3, [r4, #2376]
	cmp	r3, #1
	beq	.L4965
	ldr	r3, [r5, #736]
	ldr	r2, [r4, #2840]
	add	r3, r3, #90
	ldr	r1, [r2, r3, asl #2]
.L4899:
	cmp	r7, #0
	beq	.L4896
	add	r6, r4, r6, lsl #2
	ldr	r3, [r6, #212]
	cmp	r3, #-2147483647
	beq	.L4896
	ldr	r2, [r5, #724]
	add	r1, r1, r3
	cmp	r2, r1
	bge	.L4896
	ldr	r1, [r5, #740]
	cmp	r1, #21
	bne	.L4896
	ldr	r1, .L4969+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_CRAOutputFrame
	mov	r3, #-2147483647
	str	r3, [r6, #212]
	ldr	r0, [r4, #2856]
.L4896:
	ldr	r3, [r0, #8]
	cmp	r3, #2
	beq	.L4891
	ldr	r3, [r0, #24]
	cmp	r3, #2
	bne	.L4901
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4966
.L4902:
	mov	r0, r4
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
.L4891:
	mov	r0, r4
	bl	HEVC_InitPic
	cmn	r0, #2
	beq	.L4894
	cmp	r0, #0
	bne	.L4967
	ldr	r3, [r4, #264]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r4, #264]
	bl	HEVC_SetScalingList
	mov	r0, r4
	bl	HEVC_WritePicMsg
	cmp	r0, #0
	beq	.L4886
	ldr	r1, .L4969+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4955:
	ldr	r1, [r2, #160]
	cmp	r1, #1
	bne	.L4885
	ldr	r2, [r2, #164]
	cmp	r2, #2
	bne	.L4885
	ldr	r1, [r3, #16]
	bl	HEVC_Get_Last_IDR_Frame_Info
	b	.L4885
.L4907:
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4911
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
	b	.L4911
.L4959:
	mov	r0, r4
	bl	HEVC_DecList
	cmp	r0, #0
	bne	.L4968
	mov	r0, r4
	bl	HEVC_IsRefListWrong
	cmp	r0, #0
	beq	.L4908
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r1, .L4969+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4962:
	mov	r0, r4
	bl	HEVC_IsPVRFlushPic
	cmp	r0, #0
	beq	.L4893
	b	.L4892
.L4901:
	mov	r0, r4
	bl	HEVC_RefPicProcess
	cmp	r0, #0
	beq	.L4891
	mvn	r0, #0
	b	.L4894
.L4958:
	ldr	r1, .L4969+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4965:
	ldr	ip, [r4, #2840]
	add	r3, ip, #356
	add	ip, ip, #388
.L4898:
	ldr	r2, [r3, #4]!
	cmp	r1, r2
	movcc	r1, r2
	cmp	r3, ip
	bne	.L4898
	b	.L4899
.L4964:
	ldr	r3, [r4, #3040]
	cmp	r3, #0
	beq	.L4895
	mov	r0, r4
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L4895
	mov	r0, r8
	ldr	r2, .L4969+20
	ldr	r1, .L4969+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4957:
	ldr	r1, .L4969+28
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #204]
	ldr	r2, [r4, #152]
	cmp	r3, r2
	bcc	.L4905
	ldr	r1, .L4969+32
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L4905
	str	r3, [fp, #-44]
	mov	r1, #108
	str	r2, [fp, #-40]
	mov	r3, #8
	sub	r2, fp, #44
	ldr	r0, [r4, #276]
	blx	r5
.L4905:
	ldr	r1, .L4969+36
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L4894
.L4960:
	ldr	r1, .L4969+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4967:
	ldr	r1, .L4969+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4966:
	mov	r0, r4
	bl	HEVC_UpdateInterLayerReflist
	b	.L4902
.L4968:
	mov	r2, r0
	ldr	r1, .L4969+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4963:
	ldr	r2, .L4969+20
	mov	r0, #1
	ldr	r1, .L4969+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4894
.L4970:
	.align	2
.L4969:
	.word	s_pstVfmwChan
	.word	.LC563
	.word	.LC565
	.word	.LC570
	.word	.LC568
	.word	.LANCHOR0+1144
	.word	.LC562
	.word	.LC566
	.word	g_event_report
	.word	.LC567
	.word	.LC571
	.word	.LC564
	.word	.LC569
	.word	.LC561
	UNWIND(.fnend)
	.size	HEVC_DecSlice, .-HEVC_DecSlice
	.align	2
	.global	HEVC_DecOneNal
	.type	HEVC_DecOneNal, %function
HEVC_DecOneNal:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	ip, [r0, #2828]
	mov	r4, r0
	ldr	r3, [ip, #8]
	cmp	r3, #0
	ldrne	r1, [r0, #268]
	movne	r2, ip
	movne	r3, #0
	beq	.L4976
.L4975:
	ldr	r0, [r2, #44]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, r0
	str	r1, [r4, #268]
	ldr	r0, [ip, #8]
	cmp	r0, r3
	bhi	.L4975
.L4976:
	mov	r3, #0
	strb	r3, [ip]
	ldr	r3, [r4, #2828]
	ldr	r2, [r3, #16]
	sub	r2, r2, #36
	cmp	r2, #1
	bls	.L5117
.L4974:
	ldr	r2, [r3, #4]
	add	r2, r2, #16
	str	r2, [r3, #4]
	ldr	r3, [r4, #2828]
	ldr	r2, [r3, #16]
	cmp	r2, #49
	ldrls	pc, [pc, r2, asl #2]
	b	.L4977
.L4979:
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4978
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4980
	.word	.L4981
	.word	.L4982
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4983
	.word	.L4983
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4977
	.word	.L4984
	.word	.L4985
.L5117:
	mov	r2, #1
	strb	r2, [r4, #3]
	b	.L4974
.L4985:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	beq	.L5118
.L5001:
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5104
.L5106:
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2828]
.L5103:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4978:
	mov	r0, r4
	bl	HEVC_DecSlice
	cmn	r0, #2
	beq	.L5103
	cmp	r0, #0
	beq	.L5104
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5115
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L5115:
	ldr	r3, .L5120
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L5105
.L5107:
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	r5
.L5105:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4980:
	mov	r0, r4
	bl	HEVC_DecVPS
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4986
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4986:
	cmp	r5, #0
	bne	.L5119
.L5104:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4981:
	mov	r0, r4
	bl	HEVC_DecSPS
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4991
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4991:
	cmp	r5, #0
	beq	.L5104
	ldr	r6, .L5120
	mov	r0, #1
	ldr	r1, .L5120+4
	bl	dprint_vfmw
	ldr	r7, [r6]
	cmp	r7, #0
	bne	.L5111
	b	.L5105
.L4982:
	mov	r0, r4
	bl	HEVC_DecPPS
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4993
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4993:
	cmp	r5, #0
	beq	.L5104
	ldr	r6, .L5120
	mov	r0, #1
	ldr	r1, .L5120+8
	bl	dprint_vfmw
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L5105
.L5111:
	sub	r2, fp, #28
	mvn	r5, #0
	mov	r3, #4
	mov	r1, #100
	str	r5, [r2, #-4]!
	ldr	r0, [r4, #276]
	blx	r7
	ldr	r6, [r6]
	cmp	r6, #0
	beq	.L5105
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4983:
	mov	r0, r4
	bl	HEVC_DecSEI
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4994
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4994:
	cmp	r5, #0
	beq	.L5104
	ldr	r1, .L5120+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L5115
.L4984:
	add	r5, r4, #2992
	mov	r1, #32
	add	r5, r5, #12
	mov	r0, r5
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r5, r0
	beq	.L4999
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L4998
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L4998:
	add	r3, r4, #4096
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L5104
.L4999:
	movw	r2, #20036
	movw	r3, #20553
	movt	r3, 18515
	movt	r2, 17221
	cmp	r5, r2
	cmpeq	r6, r3
	mov	r3, #0
	strb	r3, [r4, #10]
	bne	.L5104
	ldr	r5, .L5120
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L5000
	mov	r2, r3
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	r6
.L5000:
	add	r3, r4, #4096
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L5104
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L5104
.L5003:
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L5107
	b	.L5105
.L4977:
	ldr	r1, .L5120+16
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	ldr	r3, [r1, #16]
	cmp	r3, #63
	bhi	.L5004
	cmp	r1, #0
	bne	.L5106
	b	.L5104
.L5004:
	ldr	r5, .L5120
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L5005
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r6
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5006
.L5007:
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L5006:
	ldr	r5, [r5]
	cmp	r5, #0
	beq	.L5104
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	b	.L5104
.L5005:
	cmp	r1, #0
	bne	.L5007
	b	.L5104
.L5119:
	ldr	r6, .L5120
	mov	r0, #1
	ldr	r1, .L5120+20
	bl	dprint_vfmw
	ldr	r7, [r6]
	cmp	r7, #0
	bne	.L5111
	b	.L5105
.L5118:
	ldr	r5, .L5120
	strb	r0, [r4, #11]
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L5002
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r6
.L5002:
	add	r3, r4, #4096
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L5001
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L5001
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5003
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
	b	.L5003
.L5121:
	.align	2
.L5120:
	.word	g_event_report
	.word	.LC573
	.word	.LC574
	.word	.LC575
	.word	.LC576
	.word	.LC572
	UNWIND(.fnend)
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
	.align	2
	.global	HEVC_UnMarkFrameStoreRef
	.type	HEVC_UnMarkFrameStoreRef, %function
HEVC_UnMarkFrameStoreRef:
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
	mov	r3, #0
	strb	r3, [r1, #1]
	mov	r2, r3
	ldr	r1, [r1, #28]
	ldr	r0, [r0, #276]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	HEVC_UnMarkFrameStoreRef, .-HEVC_UnMarkFrameStoreRef
	.align	2
	.global	HEVC_InquireSliceProperty
	.type	HEVC_InquireSliceProperty, %function
HEVC_InquireSliceProperty:
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
	ldr	ip, .L5148
	mov	r4, r0
	mov	r3, #0
	mov	r8, r1
	add	r0, r0, #4800
	str	r3, [r2]
	mov	r1, r3
	str	r3, [r8]
	mov	r6, r2
	ldr	r3, [ip, #48]
	mov	r2, #1376
	add	r0, r0, #8
	add	r5, r4, #4096
	blx	r3
	ldr	r3, [r4, #2828]
	mov	r0, r4
	ldr	r2, [r3, #16]
	str	r2, [r5, #740]
	ldr	r2, [r3, #28]
	str	r2, [r5, #736]
	ldr	r3, [r3, #24]
	str	r3, [r5, #744]
	bl	HEVC_DecSliceSegmentHeader
	cmp	r0, #0
	bne	.L5143
	ldr	r2, [r5, #748]
	movw	r1, #5036
	ldr	r3, [r4, #2820]
	movw	r7, #12668
	ldr	r9, [r4, #2368]
	mla	r3, r1, r2, r3
	ldr	r2, [r4, #2816]
	cmp	r9, #1
	ldr	r3, [r3, #32]
	mla	r7, r7, r3, r2
	beq	.L5144
	ldr	r3, [r5, #864]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r8]
	ldr	r0, [r4, #2840]
	ldr	ip, [r4, #2856]
	ldr	r2, [r7, #184]
	ldr	r3, [r0, #184]
	ldr	lr, [ip, #896]
	subs	r1, r2, r3
	ldr	r2, [r0, #64]
	ldr	r3, [r7, #64]
	movne	r1, #1
	cmp	lr, #1
	ldr	r0, [r0, #68]
	ldr	lr, [r7, #68]
	beq	.L5145
.L5129:
	cmp	r3, r2
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	lr, r0
	moveq	r3, r2
	orrne	r3, r2, #1
	cmp	r3, #0
	beq	.L5132
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L5146
.L5133:
	mov	r0, #0
	mov	r3, #1
	str	r3, [r6]
.L5142:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L5144:
	ldr	r0, [r4, #2808]
	bl	BsResidBits
	ldr	r3, [r7, #188]
	ldr	r1, [r4, #204]
	add	r1, r1, #1
	mov	r5, r0
	ldr	r0, [r7, #192]
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	cmp	r5, r0
	movge	r3, #0
	movlt	r3, #1
	orrs	r3, r3, r5, lsr #31
	bne	.L5127
.L5132:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L5143:
	ldr	r1, .L5148+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L5148+8
	ldr	r5, [r3]
	cmp	r5, #0
	mvneq	r0, #0
	beq	.L5142
	sub	r2, fp, #36
	ldr	r0, [r4, #276]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #100
	str	r4, [r2, #-4]!
	blx	r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L5145:
	ldr	r5, [r7, #96]
	ldr	r7, [r7, #88]
	cmp	r5, r7
	movcc	r5, r7
	str	r5, [ip, #964]
	ldr	r5, [r4, #2840]
	ldr	r7, [r4, #2856]
	ldr	ip, [r5, #96]
	ldr	r5, [r5, #88]
	ldr	r8, [r7, #964]
	cmp	ip, r5
	movcc	ip, r5
	cmp	ip, #8
	movls	r5, #0
	movhi	r5, #1
	cmp	r8, #8
	movne	r5, #0
	cmp	r5, #0
	beq	.L5147
.L5130:
	mov	ip, #1
	str	ip, [r7, #968]
	str	ip, [r6]
	b	.L5129
.L5146:
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	bics	r3, r3, #4
	beq	.L5133
	ldr	r3, [r4, #2396]
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r6]
	b	.L5142
.L5147:
	sub	ip, ip, #8
	cmp	r8, #8
	clz	ip, ip
	mov	ip, ip, lsr #5
	movle	ip, #0
	cmp	ip, #0
	beq	.L5129
	b	.L5130
.L5127:
	mov	r3, r0
	mov	r2, r5
	mov	r0, r9
	ldr	r1, .L5148+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L5142
.L5149:
	.align	2
.L5148:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC577
	.word	g_event_report
	.word	.LC578
	UNWIND(.fnend)
	.size	HEVC_InquireSliceProperty, .-HEVC_InquireSliceProperty
	.align	2
	.global	HEVC_HaveSliceToDec
	.type	HEVC_HaveSliceToDec, %function
HEVC_HaveSliceToDec:
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
	ldr	r0, [r0, #204]
	cmp	r0, #0
	bne	.L5152
	add	r3, r4, #4096
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5154
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5152:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5154:
	ldr	r2, .L5155
	ldr	r1, .L5155+4
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5156:
	.align	2
.L5155:
	.word	.LANCHOR0+1160
	.word	.LC579
	UNWIND(.fnend)
	.size	HEVC_HaveSliceToDec, .-HEVC_HaveSliceToDec
	.align	2
	.global	HEVC_GetPicStreamSize
	.type	HEVC_GetPicStreamSize, %function
HEVC_GetPicStreamSize:
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
	add	r0, r0, #8192
	ldr	r2, [r0, #836]
	cmp	r2, #0
	beq	.L5160
	mov	r0, #0
.L5159:
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #1504]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L5159
	ldmfd	sp, {fp, sp, pc}
.L5160:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetPicStreamSize, .-HEVC_GetPicStreamSize
	.align	2
	.global	HEVC_IsFrameEndNal
	.type	HEVC_IsFrameEndNal, %function
HEVC_IsFrameEndNal:
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
	bic	r0, r0, #16
	sub	r0, r0, #32
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsFrameEndNal, .-HEVC_IsFrameEndNal
	.align	2
	.global	HEVCDEC_CheckSedOnly
	.type	HEVCDEC_CheckSedOnly, %function
HEVCDEC_CheckSedOnly:
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
	ldr	r3, [r0, #2364]
	mov	r5, #0
	mov	r4, r0
	str	r5, [r0, #2368]
	cmp	r3, #2
	str	r5, [r0, #2376]
	beq	.L5190
	cmp	r3, #1
	beq	.L5191
.L5177:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5191:
	ldr	r3, [r0, #2372]
	cmp	r3, #1
	bne	.L5177
	str	r5, [r0, #2372]
.L5189:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5190:
	ldr	r3, [r0, #2360]
	cmp	r3, r5
	beq	.L5189
	ldr	r3, [r0, #2372]
	cmp	r3, #1
	beq	.L5177
	ldr	r0, [r0, #276]
	bl	VCTRL_CheckFreshSeg
	cmp	r0, #0
	beq	.L5189
	ldr	r0, [r4, #276]
	bl	VCTRL_CheckFreshRaw
	cmp	r0, #0
	beq	.L5189
	ldr	r3, [r4, #2828]
	ldr	r0, [r4, #2808]
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2808]
	bl	BsSkip
	ldr	r0, [r4, #2808]
	bl	BsResidBits
	cmp	r0, #15
	ble	.L5189
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsSkip
	mov	r1, #6
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #9
	mov	r6, r0
	ldr	r0, [r4, #2808]
	bl	BsSkip
	mov	r0, r6
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r7, r0
	beq	.L5192
	ldr	r3, [r4, #204]
	cmp	r3, #0
	beq	.L5189
	mov	r0, r5
.L5172:
	bic	r5, r6, #16
	sub	r5, r5, #32
	cmp	r5, #1
	movhi	r5, r0
	orrls	r5, r0, #1
	cmp	r5, #0
	bne	.L5170
	add	r1, r4, #4096
	ldr	r3, [r1, #864]
	cmp	r3, #2
	beq	.L5170
	cmp	r7, #1
	bne	.L5189
.L5173:
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r4, #2368]
	str	r3, [r4, #2372]
	ldrb	r3, [r1, #9]	@ zero_extendqisi2
	str	r3, [r4, #2380]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5170:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	bne	.L5189
	add	r2, r4, #4096
	mov	r3, #1
	mvn	r0, #0
	str	r3, [r4, #2376]
	strb	r3, [r2, #8]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5192:
	ldr	r0, [r4, #2808]
	bl	BsResidBits
	cmp	r0, #0
	movle	r0, r5
	ble	.L5169
	mov	r1, r7
	ldr	r0, [r4, #2808]
	bl	BsGet
.L5169:
	ldr	r3, [r4, #204]
	cmp	r3, #0
	addeq	r1, r4, #4096
	beq	.L5173
	adds	r0, r0, #0
	movne	r0, #1
	b	.L5172
	UNWIND(.fnend)
	.size	HEVCDEC_CheckSedOnly, .-HEVCDEC_CheckSedOnly
	.align	2
	.global	HEVCDEC_IsNeedSedOnly
	.type	HEVCDEC_IsNeedSedOnly, %function
HEVCDEC_IsNeedSedOnly:
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
	ldr	r3, [r0, #204]
	mov	r4, r0
	cmp	r3, #0
	beq	.L5196
	ldr	r2, [r0, #2864]
	cmp	r2, #0
	beq	.L5201
.L5196:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5201:
	add	r2, r0, #4096
	ldr	r2, [r2, #2464]
	cmp	r2, #1
	bls	.L5196
	ldr	r2, [r0, #2384]
	cmp	r3, r2
	beq	.L5196
	ldr	r3, [r0, #2368]
	cmp	r3, #1
	beq	.L5202
	cmp	r3, #0
	bne	.L5196
	ldr	r0, [r0, #276]
	bl	VCTRL_CheckFreshRaw
	cmp	r0, #0
	beq	.L5196
	ldr	r0, [r4, #276]
	bl	VCTRL_CheckFreshSeg
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5202:
	ldr	r0, [r0, #2828]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_IsNeedSedOnly, .-HEVCDEC_IsNeedSedOnly
	.align	2
	.global	HEVCDEC_SetDecParam
	.type	HEVCDEC_SetDecParam, %function
HEVCDEC_SetDecParam:
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
	ldr	r5, [r0, #2372]
	mov	r4, r0
	cmp	r5, #1
	beq	.L5216
.L5204:
	mov	r0, r4
	bl	HEVCDEC_IsNeedSedOnly
	cmp	r0, #1
	beq	.L5217
	ldr	r3, [r4, #2368]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	ip, [r4, #2380]
	add	r3, r4, #4096
	ldr	r0, [r4, #204]
	ldr	r1, [r4, #176]
	ldr	r2, [r4, #260]
	sub	r0, r0, #1
	sub	r1, r1, #1
	str	r0, [r4, #204]
	str	r1, [r4, #176]
	sub	r2, r2, #1
	str	r2, [r4, #260]
	strb	ip, [r3, #9]
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5216:
	ldr	r3, [r0, #204]
	cmp	r3, #0
	beq	.L5204
	ldr	r6, [r0, #2864]
	cmp	r6, #0
	bne	.L5204
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L5218
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r6, [r4, #2828]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5217:
	add	r2, r4, #8192
	add	lr, r4, #4096
	add	r3, r4, #6528
	mov	ip, #0
	str	r0, [r2, #3524]
	add	r3, r3, #8
	ldr	r1, [r4, #204]
	str	r1, [r4, #2384]
	str	r1, [r2, #832]
	ldr	r2, [r4, #2856]
	ldr	r2, [r2, #652]
	str	r2, [lr, #3768]
	str	r3, [r4, #2864]
	str	ip, [r4, #2372]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5218:
	add	r3, r4, #4096
	str	r5, [r4, #2376]
	strb	r5, [r3, #8]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_SetDecParam, .-HEVCDEC_SetDecParam
	.align	2
	.global	HEVCDEC_VDMProcSedOnly
	.type	HEVCDEC_VDMProcSedOnly, %function
HEVCDEC_VDMProcSedOnly:
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
	ldr	r6, .L5231
	mov	r3, #180
	ldr	r2, [r0, #2864]
	mov	r4, r0
	ldr	lr, [r0, #276]
	mov	r0, #22
	mla	r1, r3, r1, r6
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #20]
	ldr	ip, .L5231+4
	add	r6, r1, #16
	ldr	r1, .L5231+8
	mla	r5, r2, r3, r3
	ldr	r3, [r6, #4]
	ldr	r7, [ip, lr, asl #2]
	add	r5, r5, r2
	mov	r2, r5
	bl	dprint_vfmw
	ldr	r3, [r6, #4]
	cmp	r3, r5
	ldr	r3, [r4, #2368]
	beq	.L5229
	cmp	r3, #1
	beq	.L5230
.L5224:
	mov	r3, #0
	str	r3, [r4, #2864]
.L5222:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5229:
	cmp	r3, #1
	beq	.L5221
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	addeq	r2, r4, #4096
	moveq	r3, #1
	streq	r3, [r4, #2376]
	streqb	r3, [r2, #8]
	b	.L5222
.L5230:
	ldr	ip, [r4, #2380]
	add	r3, r4, #4096
	ldr	r0, [r4, #204]
	mov	r5, #0
	ldr	r1, [r4, #176]
	ldr	r2, [r4, #260]
	sub	r0, r0, #1
	sub	r1, r1, #1
	str	r0, [r4, #204]
	str	r1, [r4, #176]
	sub	r2, r2, #1
	str	r5, [r4, #2372]
	str	r2, [r4, #260]
	strb	ip, [r3, #9]
	ldr	r1, [r4, #2828]
	cmp	r1, r5
	beq	.L5224
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2828]
	b	.L5224
.L5221:
	ldr	r5, [r4, #2380]
	add	lr, r4, #4096
	ldr	r0, [r4, #204]
	mov	ip, #0
	ldr	r1, [r4, #176]
	ldr	r2, [r4, #260]
	sub	r0, r0, #1
	str	r3, [r4, #2372]
	sub	r1, r1, #1
	str	r0, [r4, #204]
	sub	r2, r2, #1
	str	r1, [r4, #176]
	mov	r0, #0
	str	r2, [r4, #260]
	strb	r5, [lr, #9]
	strb	r3, [r7, #753]
	strb	r3, [r4, #9]
	str	ip, [r4, #2864]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5232:
	.align	2
.L5231:
	.word	g_BackUp
	.word	s_pstVfmwChan
	.word	.LC580
	UNWIND(.fnend)
	.size	HEVCDEC_VDMProcSedOnly, .-HEVCDEC_VDMProcSedOnly
	.align	2
	.global	HEVCDEC_AllocHevcGlbMem
	.type	HEVCDEC_AllocHevcGlbMem, %function
HEVCDEC_AllocHevcGlbMem:
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
	ldr	r5, .L5239
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L5237
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5237:
	ldr	r6, .L5239+4
	movw	r0, #12624
	movt	r0, 10
	ldr	r3, [r6, #216]
	blx	r3
	cmp	r0, #0
	str	r0, [r5]
	beq	.L5238
	movw	r2, #12624
	ldr	r3, [r6, #48]
	movt	r2, 10
	mov	r1, r4
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5238:
	movw	r2, #15336
	ldr	r1, .L5239+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5240:
	.align	2
.L5239:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC581
	UNWIND(.fnend)
	.size	HEVCDEC_AllocHevcGlbMem, .-HEVCDEC_AllocHevcGlbMem
	.align	2
	.global	HEVCDEC_ReleaseHevcGlbMem
	.type	HEVCDEC_ReleaseHevcGlbMem, %function
HEVCDEC_ReleaseHevcGlbMem:
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
	ldr	r4, .L5246
	ldr	r0, [r4]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L5246+4
	ldr	r3, [r3, #220]
	blx	r3
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5247:
	.align	2
.L5246:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVCDEC_ReleaseHevcGlbMem, .-HEVCDEC_ReleaseHevcGlbMem
	.align	2
	.global	HEVCDEC_Init
	.type	HEVCDEC_Init, %function
HEVCDEC_Init:
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
	ldr	r3, .L5264
	mov	r5, r1
	mov	r4, r0
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L5259
	add	r7, r0, #4096
	ldr	r6, .L5264+4
	movw	r2, #28136
	mov	r1, #0
	ldr	r8, [r7, #2432]
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, #0
	str	r8, [r7, #2432]
	str	r5, [r4, #2856]
	str	r3, [r4, #2864]
	ldr	r3, [r5, #28]
	cmp	r3, #25
	beq	.L5260
	mov	r3, #17
	mov	r1, #65
	str	r3, [r4, #156]
	mov	r2, #200
	str	r3, [r4, #160]
	mov	r3, #210
	str	r1, [r4, #164]
	str	r2, [r4, #152]
	str	r3, [r4, #168]
.L5252:
	ldr	r0, [r5, #592]
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L5261
	ldr	r3, [r4, #156]
	movw	lr, #24912
	ldr	r0, [r4, #160]
	movw	r8, #12668
	ldr	r2, [r4, #152]
	movw	r7, #5036
	mul	lr, lr, r3
	ldr	r3, [r4, #2856]
	ldr	ip, [r3, #588]
	add	r9, r1, ip
	add	ip, lr, ip
	add	r3, r1, ip
	str	r3, [r4, #2816]
	mla	ip, r8, r0, ip
	ldr	r0, [r4, #168]
	str	r9, [r4, #2812]
	add	r10, r0, #1
	movw	r0, #1508
	mul	r2, r0, r2
	add	r0, r1, ip
	str	r0, [r4, #2820]
	mov	r3, r10, asl #7
	ldr	r0, [r4, #164]
	sub	r3, r3, r10, asl #5
	mla	r0, r7, r0, ip
	ldr	ip, [r4, #168]
	add	r10, r0, r2
	add	r0, r1, r0
	add	r3, r10, r3
	add	r10, r1, r10
	add	r1, r1, r3
	str	r1, [r4, #2848]
	ldr	r1, [r4, #2856]
	add	r3, r3, ip, lsl #2
	str	r0, [r4, #2860]
	str	r10, [r4, #2852]
	ldr	r1, [r1, #596]
	cmp	r3, r1
	bhi	.L5262
	ldr	r5, [r5, #624]
	cmp	r5, #0
	beq	.L5263
.L5255:
	ldr	r3, [r6, #48]
	mov	r1, #0
	blx	r3
	ldr	r3, [r4, #168]
	mov	r1, #0
	ldr	r5, [r6, #48]
	add	r3, r3, #1
	ldr	r0, [r4, #2852]
	mov	r2, r3, asl #7
	sub	r2, r2, r3, asl #5
	blx	r5
	ldr	r2, [r4, #168]
	ldr	r3, [r6, #48]
	mov	r1, #0
	ldr	r0, [r4, #2848]
	mov	r2, r2, asl #2
	blx	r3
	ldr	ip, [r4, #156]
	ldr	r0, [r4, #164]
	movw	r1, #24912
	ldr	lr, [r4, #160]
	movw	r2, #5036
	mul	r1, r1, ip
	movw	r3, #12668
	mul	r2, r2, r0
	ldr	r0, [r4, #2812]
	mul	r3, r3, lr
	sub	r1, r1, #24832
	sub	r1, r1, #80
	ldr	lr, [r4, #2820]
	add	r1, r0, r1
	sub	r2, r2, #4992
	ldr	r0, [r4, #2816]
	sub	r3, r3, #12608
	sub	r2, r2, #44
	sub	r3, r3, #60
	str	r1, [r4, #2836]
	add	r2, lr, r2
	add	r3, r0, r3
	str	r2, [r4, #2844]
	str	r3, [r4, #2840]
	mov	r0, r4
	str	ip, [r1, #4]
	ldr	r3, [r4, #2844]
	ldr	r2, [r4, #160]
	str	r2, [r3, #28]
	ldr	r3, [r4, #2840]
	ldr	r2, [r4, #164]
	str	r2, [r3, #56]
	bl	HEVC_InitScalingOrderTable
	mov	r0, r4
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #276]
	beq	.L5256
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	str	r3, [r4, #216]
	bl	HEVC_InitDecPara
	add	r3, r4, #8192
	mov	r2, #0
	movw	r0, #9999
	str	r2, [r3, #3592]
	mov	r2, #1
	ldr	r1, [r4, #164]
	ldr	r3, [r4, #2856]
	str	r0, [r4, #284]
	str	r1, [r4, #328]
	strb	r2, [r4]
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L5257
.L5258:
	mov	r0, #0
	str	r0, [r4, #2388]
	ldr	r3, [r3, #640]
	str	r3, [r4, #2360]
.L5250:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L5257:
	mov	r2, #6
	str	r2, [r3, #24]
	ldr	r3, [r4, #2856]
	b	.L5258
.L5263:
	mov	r2, lr
	ldr	r3, [r6, #48]
	mov	r1, r5
	mov	r0, r9
	blx	r3
	ldr	r2, [r4, #160]
	ldr	r3, [r6, #48]
	mov	r1, r5
	ldr	r0, [r4, #2816]
	mul	r2, r8, r2
	blx	r3
	ldr	r2, [r4, #164]
	ldr	r3, [r6, #48]
	mov	r1, r5
	ldr	r0, [r4, #2820]
	mul	r2, r7, r2
	blx	r3
	ldr	r2, [r4, #152]
	movw	r3, #1508
	ldr	r0, [r4, #2860]
	mul	r2, r3, r2
	b	.L5255
.L5260:
	ldr	r3, [r5, #704]
	str	r3, [r4, #156]
	ldr	r3, [r5, #708]
	str	r3, [r4, #160]
	ldr	r3, [r5, #712]
	str	r3, [r4, #164]
	ldr	r3, [r5, #700]
	add	r2, r3, #5
	str	r2, [r4, #168]
	str	r3, [r4, #152]
	b	.L5252
.L5262:
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L5264+8
	ldr	r1, .L5264+12
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L5250
.L5259:
	mov	r0, r3
	ldr	r2, .L5264+8
	ldr	r1, .L5264+16
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L5250
.L5256:
	ldr	r2, .L5264+8
	mov	r0, #0
	ldr	r1, .L5264+20
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L5250
.L5261:
	ldr	r2, .L5264+8
	ldr	r1, .L5264+24
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L5250
.L5265:
	.align	2
.L5264:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1180
	.word	.LC583
	.word	.LC72
	.word	.LC584
	.word	.LC582
	UNWIND(.fnend)
	.size	HEVCDEC_Init, .-HEVCDEC_Init
	.align	2
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
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
	ldr	r3, [r0, #180]
	mov	r4, r0
	cmp	r3, #0
	beq	.L5269
	add	r3, r0, #4096
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L5269
	add	r1, r0, #13696
	add	lr, r0, #27904
	add	r1, r1, #32
	add	lr, lr, #224
.L5275:
	ldr	r3, [r1, #48]
	cmp	r3, #0
	bne	.L5270
	cmp	r1, #0
	beq	.L5271
	ldr	ip, [r4, #3040]
	cmp	ip, #0
	beq	.L5271
	ldr	r2, [r4, #3208]
	cmp	r2, r1
	beq	.L5270
	add	r2, r4, #3200
	add	r2, r2, #8
	b	.L5272
.L5273:
	ldr	r0, [r2, #4]!
	cmp	r0, r1
	beq	.L5270
.L5272:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L5273
.L5271:
	ldr	r0, [r4, #276]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L5269
	cmn	r0, #1
	beq	.L5294
.L5293:
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L5269:
	mov	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L5270:
	add	r1, r1, #720
	cmp	r1, lr
	bne	.L5275
	add	r0, r4, #6144
	sub	r2, fp, #24
	sub	r1, fp, #28
	add	r0, r0, #40
	bl	GetQueueImgNum
	mov	r0, r4
	bl	HEVC_PrintFrameStoreState
	ldr	r1, .L5295
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r2, [r4, #180]
	ldr	r0, [r4, #3040]
	ldr	r3, [fp, #-28]
	sub	r2, r2, #2
	ldr	r1, [fp, #-24]
	rsb	r2, r0, r2
	add	r0, r3, r1
	cmp	r0, r2
	bge	.L5293
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L5295+4
	ldr	r1, .L5295+8
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L5294:
	ldr	r1, .L5295+12
	mov	r0, #1
	bl	dprint_vfmw
	add	r1, r4, #6144
	add	r1, r1, #40
	ldr	r0, [r4, #276]
	bl	FSP_ClearNotInVoQueue
	b	.L5293
.L5296:
	.align	2
.L5295:
	.word	.LC586
	.word	.LANCHOR0+1196
	.word	.LC587
	.word	.LC585
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageBuffer, .-HEVCDEC_GetImageBuffer
	.align	2
	.global	HEVCDEC_DecodePacket
	.type	HEVCDEC_DecodePacket, %function
HEVCDEC_DecodePacket:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r1, #0
	mov	lr, #0
	mov	r4, r0
	str	lr, [fp, #-64]
	str	lr, [fp, #-60]
	str	lr, [fp, #-56]
	beq	.L5384
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L5385
	ldr	r2, [r0, #2856]
	ldrb	ip, [r0, #9]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	ip, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r0, #272]
	beq	.L5301
	ldr	r3, [r2, #896]
	cmp	r3, #1
	beq	.L5386
.L5302:
	mov	r0, r4
	bl	HEVC_ReceivePacket
	ldr	r3, [r4, #2828]
	str	r3, [r4, #2832]
	mov	r5, r0
.L5303:
	cmp	r5, #0
	mov	r3, #0
	strb	r3, [r4, #9]
	beq	.L5304
.L5331:
	mov	r0, #0
.L5381:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L5386:
	ldr	r3, [r2, #952]
	cmp	r3, #1
	bne	.L5302
	ldr	r3, [r0, #352]
	cmp	r3, #1
	bne	.L5302
	ldr	r3, [r0, #2832]
	mov	r0, lr
	str	lr, [r4, #352]
	strb	lr, [r4, #9]
	str	r3, [r4, #2828]
	b	.L5381
.L5304:
	mov	r0, r4
	bl	HEVCDEC_CheckSedOnly
	cmp	r0, #0
	beq	.L5305
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	bne	.L5387
.L5305:
	ldr	r3, [r4, #2828]
	mov	r5, #0
	ldr	r6, .L5395
	str	r5, [r3, #4]
	ldr	r3, [r4, #2828]
	ldr	r0, [r4, #2808]
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2808]
	bl	BsSkip
	ldr	r3, [r4, #276]
	ldr	r3, [r6, r3, asl #2]
	ldrsb	r9, [r3, #44]
	cmp	r9, #1
	movne	r7, #3
	movne	r8, #2
	beq	.L5388
.L5307:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #6
	ldr	r0, [r4, #2808]
	ldr	r9, [r4, #2828]
	bl	BsGet
	mov	r1, #6
	str	r0, [r9, #16]
	ldr	r0, [r4, #2808]
	ldr	r9, [r4, #2828]
	bl	BsGet
	str	r0, [r9, #24]
	ldr	r9, [r4, #2828]
	ldr	r2, [r9, #24]
	cmp	r2, #1
	bls	.L5308
	mov	r3, #1
	ldr	r1, .L5395+4
	mov	r0, r3
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5382
.L5383:
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2828]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L5301:
	ldr	r3, [r0, #2828]
	cmp	r3, #0
	movne	r5, #0
	mvneq	r5, #0
	cmp	r3, #0
	bne	.L5303
	mov	r0, lr
	ldr	r1, .L5395+8
	bl	dprint_vfmw
	mov	r0, r5
	b	.L5381
.L5308:
	ldr	r3, [r4, #2856]
	ldr	r3, [r3, #24]
	bics	r1, r3, #4
	moveq	r1, #1
	movne	r1, #0
	cmp	r2, #0
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	bne	.L5389
	mov	r1, #3
	ldr	r0, [r4, #2808]
	bl	BsGet
	str	r0, [r9, #28]
	ldr	r9, [r4, #2828]
	ldr	r3, [r9, #28]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r9, #28]
	ldrne	r9, [r4, #2828]
	ldr	r0, [r9, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r10, r0
	beq	.L5390
	mov	r3, #0
	str	r3, [r9, #4]
	ldr	r3, [r4, #2828]
	add	r0, r4, #2992
	add	r0, r0, #12
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2808]
	bl	BsSkip
	cmp	r7, #1
	cmpeq	r8, #1
	moveq	r7, #1
	movne	r7, #0
	cmp	r5, #1
	moveq	r5, #0
	andne	r5, r7, #1
	cmp	r5, #0
	beq	.L5329
	mov	r1, #16
	ldr	r0, [r4, #2808]
	bl	BsSkip
.L5329:
	mov	r1, #1
	ldr	r0, [r4, #2808]
	bl	BsGet
	mov	r1, #6
	ldr	r0, [r4, #2808]
	ldr	r5, [r4, #2828]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #16]
	ldr	r0, [r4, #2808]
	ldr	r5, [r4, #2828]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #24]
	ldr	r0, [r4, #2808]
	ldr	r5, [r4, #2828]
	bl	BsGet
	str	r0, [r5, #28]
	ldr	r2, [r4, #2828]
	ldr	r3, [r2, #28]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r2, #28]
.L5319:
	mov	r0, r4
	bl	HEVC_DecOneNal
	cmn	r0, #2
	mov	r5, r0
	beq	.L5381
	cmp	r0, #0
	bne	.L5391
	add	r3, r4, #4096
	str	r0, [r3, #64]
	ldr	r3, [r4, #2360]
	cmp	r3, #1
	bne	.L5331
	mov	r0, r4
	bl	HEVCDEC_SetDecParam
	mov	r0, r5
	b	.L5381
.L5388:
	ldr	r8, [r3, #156]
	mov	r0, r4
	ldr	r7, [r3, #160]
	ldr	r3, [r3, #164]
	mov	r1, r8
	mov	r2, r7
	bl	HEVC_VES_Splitter
	cmp	r0, #2
	beq	.L5333
	cmp	r0, #1
	bne	.L5381
	b	.L5307
.L5391:
	ldr	r1, .L5395+12
	mov	r0, #22
	bl	dprint_vfmw
.L5382:
	mvn	r0, #0
	b	.L5381
.L5385:
	mov	r0, lr
	ldr	r1, .L5395+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L5381
.L5390:
	sub	r2, fp, #48
	sub	r1, fp, #52
	mov	r0, r4
	bl	HEVC_InquireSliceProperty
	subs	r3, r0, #0
	bne	.L5314
	ldr	r5, [fp, #-52]
	cmp	r5, #1
	beq	.L5392
.L5315:
	ldr	r5, [fp, #-48]
	cmp	r5, #1
	bne	.L5319
	ldr	r3, [r4, #2828]
	mov	r0, r4
	ldr	r3, [r3, #24]
	add	r3, r4, r3
	ldrb	r7, [r3, #4]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L5393
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L5394
.L5322:
	ldr	r0, [r4, #276]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L5319
	sub	r3, fp, #56
	ldr	r0, [r4, #276]
	sub	r2, fp, #60
	sub	r1, fp, #64
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #2856]
	ldr	r0, [r3, #732]
	cmp	r0, #1
	bne	.L5319
	ldr	r5, [fp, #-56]
	cmp	r5, #0
	bgt	.L5325
	ldr	r3, [fp, #-60]
	cmp	r3, #32
	bgt	.L5325
	ldr	r3, [r4, #2864]
	cmp	r3, #0
	bne	.L5325
	ldr	r2, [fp, #-48]
	cmp	r2, #0
	beq	.L5319
	ldr	r3, [r4, #264]
	cmp	r3, #0
	beq	.L5319
	ldr	r3, [r4, #2840]
	ldr	r1, [r4, #344]
	ldr	lr, [r3, #68]
	cmp	lr, r1
	beq	.L5319
	ldr	ip, [r3, #64]
	ldr	r3, [r4, #348]
	subs	r6, ip, r3
	movne	r6, #1
	cmp	r5, #0
	movne	r6, #0
	cmp	r6, #0
	beq	.L5319
	stmia	sp, {r1, ip, lr}
	ldr	r1, .L5395+20
	bl	dprint_vfmw
	ldr	r3, [r4, #2840]
	ldr	r1, .L5395+24
	ldr	r2, [r3, #68]
	ldr	r5, [r1]
	str	r2, [r4, #344]
	cmp	r5, #0
	ldr	r3, [r3, #64]
	str	r3, [r4, #348]
	beq	.L5319
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r5
	b	.L5319
.L5389:
	ldr	r1, .L5395+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	bne	.L5383
	b	.L5382
.L5333:
	mov	r5, r9
	b	.L5307
.L5387:
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5306
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2828]
.L5306:
	mov	r0, r4
	bl	HEVCDEC_SetDecParam
	mvn	r0, #0
	b	.L5381
.L5314:
	ldr	r1, .L5395+32
	mov	r0, r10
	bl	dprint_vfmw
	ldr	r1, [r4, #2828]
	cmp	r1, #0
	beq	.L5327
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2828]
.L5327:
	ldr	r3, .L5395+24
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L5328
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	r5
.L5328:
	ldr	r3, [r4, #276]
	ldr	r3, [r6, r3, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	bne	.L5382
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L5382
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L5382
	add	r3, r4, #8192
	ldrb	r5, [r3, #3536]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L5382
	ldr	r3, .L5395+36
	add	r0, r4, #11712
	add	r0, r0, #16
	mov	r2, #56
	mov	r1, r5
	mov	r6, #0
	ldr	r3, [r3, #48]
	mov	r7, #0
	blx	r3
	add	r3, r4, #3488
	mvn	r0, #0
	strd	r6, [r3, #40]
	strd	r6, [r3, #16]
	strd	r6, [r3, #24]
	strd	r6, [r3, #32]
	str	r5, [r4, #3484]
	b	.L5381
.L5392:
	ldr	r2, [r4, #204]
	cmp	r2, #0
	bne	.L5316
	add	r3, r4, #4096
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L5315
	ldr	r2, .L5395+40
	ldr	r1, .L5395+44
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	b	.L5315
.L5384:
	mov	r0, r1
	ldr	r1, .L5395+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L5381
.L5316:
	ldr	ip, [r4, #2828]
	add	r0, r4, #2992
	mov	r2, #21
	add	r0, r0, #12
	ldr	r1, .L5395+52
	str	r3, [ip, #4]
	bl	BsInit
	mov	r1, #40
	ldr	r0, [r4, #2808]
	bl	BsSkip
	ldr	r3, [r4, #2828]
	mov	r2, #48
	mov	r0, r4
	str	r2, [r3, #16]
	strb	r5, [r4, #10]
	bl	HEVC_DecOneNal
	ldr	r3, [r4, #312]
	mvn	r0, #1
	strb	r5, [r4, #9]
	add	r3, r3, #1
	str	r3, [r4, #312]
	b	.L5381
.L5393:
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L5322
	mov	r0, r7
	ldr	r2, .L5395+56
	ldr	r1, .L5395+60
	bl	dprint_vfmw
	b	.L5322
.L5394:
	mov	r0, r5
	ldr	r2, .L5395+56
	ldr	r1, .L5395+64
	bl	dprint_vfmw
	b	.L5322
.L5325:
	ldr	r2, [r4, #276]
	mov	r3, #1
	mvn	r0, #1
	ldr	r2, [r6, r2, asl #2]
	str	r3, [r2, #1592]
	strb	r3, [r4, #9]
	b	.L5381
.L5396:
	.align	2
.L5395:
	.word	s_pstVfmwChan
	.word	.LC591
	.word	.LC590
	.word	.LC595
	.word	.LC589
	.word	.LC593
	.word	g_event_report
	.word	.LC592
	.word	.LC594
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1160
	.word	.LC579
	.word	.LC588
	.word	.LANCHOR0+1244
	.word	.LANCHOR0+1220
	.word	.LC562
	.word	.LC561
	UNWIND(.fnend)
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	2
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 8
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
	add	r5, r0, #4096
	ldr	r2, [r0, #2856]
	mov	r4, r0
	ldr	r0, [r5, #68]
	mov	r8, r3
	ldr	ip, [fp, #4]
	cmp	r0, #0
	ldr	r6, [r2, #644]
	str	r1, [r5, #48]
	ldrneb	r2, [r5, #2445]	@ zero_extendqisi2
	ldr	r3, [fp, #8]
	strneb	r2, [r0, #3]
	ldrneb	r2, [r5, #2440]	@ zero_extendqisi2
	strneb	r2, [r0, #4]
	ldr	r1, [r4, #2388]
	ldrne	r2, [r4, #2856]
	cmp	r1, #1
	bls	.L5399
	ldr	r1, [r5, #28]
	cmp	r1, #1920
	bhi	.L5429
.L5400:
	ldr	r2, [r2, #640]
	str	r2, [r4, #2360]
.L5416:
	cmp	ip, #0
	beq	.L5401
.L5433:
	mov	r2, r3, asl #6
	ldr	r1, .L5434
	sub	r3, r2, r3, asl #3
	add	r3, r3, r1
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L5430
	cmp	r3, #1
	beq	.L5401
	cmp	r6, #1
	beq	.L5431
.L5405:
	mov	r1, r8
	mov	r0, r4
	bl	HEVC_StorePicInDPB
	subs	r2, r0, #0
	bne	.L5432
	mov	r0, r2
	mov	r3, #1
	str	r3, [r4, #172]
.L5428:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L5429:
	ldr	r1, [r2, #8]
	cmp	r1, #2
	beq	.L5400
	cmp	ip, #0
	mov	r2, #0
	str	r2, [r4, #2360]
	bne	.L5433
.L5401:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	cmp	r6, #1
	bne	.L5405
.L5431:
	ldr	r9, [r4, #2864]
	ldr	r3, [r9, #1292]
	add	r3, r9, r3, lsl #2
	ldr	r10, [r3, #1476]
	mov	r0, r10
	bl	MEM_Phy2Vir
	ldr	r7, [r9, #192]
	ldr	r3, [r9, #196]
	mov	r1, r10
	add	r7, r7, #15
	ldr	r2, .L5434+4
	add	r3, r3, #15
	bic	r7, r7, #15
	bic	r3, r3, #15
	ldr	r9, [r2, #140]
	mul	r7, r3, r7
	mov	r7, r7, lsr #8
	mov	r2, r7, asl #4
	mov	r6, r0
	blx	r9
	cmp	r7, #0
	beq	.L5417
	mov	r0, #0
	mov	r3, r6
	mov	r10, r0
	mov	r9, r0
	mov	lr, r0
	mvn	r6, #-2147483648
	str	r4, [fp, #-48]
.L5412:
	ldrh	r1, [r3, #4]
	add	lr, lr, #1
	add	r3, r3, #16
	ubfx	r2, r1, #0, #15
	sxth	r1, r1
	rsb	ip, r1, #0
	tst	r1, #32768
	ldrh	r1, [r3, #-10]
	ubfxne	r2, ip, #0, #15
	ubfx	ip, r1, #0, #15
	sxth	r1, r1
	tst	r1, #32768
	rsb	r4, r1, #0
	ubfxne	ip, r4, #0, #15
	add	r2, r2, ip
	cmp	r6, r2
	add	r0, r0, r2
	movge	r6, r2
	cmp	r9, r2
	movlt	r9, r2
	cmp	r2, #0
	addeq	r10, r10, #1
	cmp	lr, r7
	bne	.L5412
	mov	r3, r10
	mov	r10, #100
	mul	r3, r10, r3
	ldr	r4, [fp, #-48]
	str	r3, [fp, #-48]
.L5406:
	mov	r1, r7
	bl	__aeabi_uidiv
	mov	r1, r7
	mov	r10, r0
	ldr	r0, [fp, #-48]
	bl	__aeabi_uidiv
	ldr	r2, [r5, #68]
	cmp	r0, #100
	moveq	r6, #0
	cmp	r2, #0
	beq	.L5414
	str	r9, [r2, #324]
	ldr	r2, [r5, #68]
	str	r6, [r2, #328]
	ldr	r2, [r5, #68]
	str	r10, [r2, #332]
	ldr	r2, [r5, #68]
	str	r0, [r2, #336]
	str	r9, [r5, #316]
	str	r6, [r5, #320]
	str	r10, [r5, #324]
	str	r0, [r5, #328]
	b	.L5405
.L5432:
	ldr	r1, .L5434+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L5399:
	ldr	r2, [r2, #640]
	add	r1, r1, #1
	str	r1, [r4, #2388]
	str	r2, [r4, #2360]
	b	.L5416
.L5430:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	mov	r0, #0
	b	.L5428
.L5417:
	str	r7, [fp, #-48]
	mov	r0, r7
	mvn	r6, #-2147483648
	mov	r9, r7
	b	.L5406
.L5414:
	mov	r0, r2
	ldr	r1, .L5434+12
	bl	dprint_vfmw
	b	.L5405
.L5435:
	.align	2
.L5434:
	.word	g_VdmDrvParam+40
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC596
	.word	.LC530
	UNWIND(.fnend)
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	2
	.global	HEVCDEC_GetImageWidth
	.type	HEVCDEC_GetImageWidth, %function
HEVCDEC_GetImageWidth:
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
	ldrne	r2, [r0, #2840]
	ldrne	r3, [r2, #132]
	ldrne	r2, [r2, #64]
	rsbne	r0, r3, #0
	addne	r3, r3, r2
	subne	r3, r3, #1
	andne	r0, r0, r3
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageWidth, .-HEVCDEC_GetImageWidth
	.align	2
	.global	HEVCDEC_GetImageHeight
	.type	HEVCDEC_GetImageHeight, %function
HEVCDEC_GetImageHeight:
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
	ldrne	r2, [r0, #2840]
	ldrne	r3, [r2, #132]
	ldrne	r2, [r2, #68]
	rsbne	r0, r3, #0
	addne	r3, r3, r2
	subne	r3, r3, #1
	andne	r0, r0, r3
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageHeight, .-HEVCDEC_GetImageHeight
	.align	2
	.global	HEVCDEC_GetRemainImg
	.type	HEVCDEC_GetRemainImg, %function
HEVCDEC_GetRemainImg:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, [r0, #3040]
	mov	r4, r0
	cmp	r3, #0
	bne	.L5443
	b	.L5447
.L5457:
	ldr	r3, [fp, #-36]
.L5444:
	mov	r1, r3
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r3, [r4, #3040]
	cmp	r3, #0
	beq	.L5447
.L5443:
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	mov	r6, #1
	bl	HEVC_GetMinPOC
	ldr	r3, [fp, #-36]
	mov	r0, r4
	add	r2, r4, r3, lsl #2
	ldr	r5, [r2, #3208]
	cmp	r5, #0
	mov	r1, r5
	beq	.L5444
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	cmp	r2, r6
	beq	.L5444
	strb	r6, [r5, #2]
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r7, r0, #0
	bne	.L5457
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_OutputFrame
	cmp	r0, #0
	beq	.L5457
	mov	r0, r7
	ldr	r2, .L5458
	ldr	r1, .L5458+4
	bl	dprint_vfmw
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ClearAll
	b	.L5457
.L5447:
	add	r0, r4, #6144
	add	r0, r0, #40
	bl	GetVoLastImageID
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5459:
	.align	2
.L5458:
	.word	.LANCHOR0+1268
	.word	.LC504
	UNWIND(.fnend)
	.size	HEVCDEC_GetRemainImg, .-HEVCDEC_GetRemainImg
	.global	g_pGlbVar
	.global	g_RpuStartCode
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.16411, %object
	.size	__func__.16411, 17
__func__.16411:
	.ascii	"HEVC_OutputFrame\000"
	.space	3
	.type	__func__.14849, %object
	.size	__func__.14849, 26
__func__.14849:
	.ascii	"HEVC_OutputImgToViewQueue\000"
	.space	2
	.type	__func__.14279, %object
	.size	__func__.14279, 24
__func__.14279:
	.ascii	"HEVC_CheckVpsExtOverlap\000"
	.type	__func__.14284, %object
	.size	__func__.14284, 24
__func__.14284:
	.ascii	"HEVC_CheckPpsExtOverlap\000"
	.type	__func__.14289, %object
	.size	__func__.14289, 26
__func__.14289:
	.ascii	"HEVC_CheckSliceExtOverlap\000"
	.space	2
	.type	SarTable.15043, %object
	.size	SarTable.15043, 136
SarTable.15043:
	.word	1
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.word	4
	.word	3
	.word	3
	.word	2
	.word	2
	.word	1
	.type	__func__.15202, %object
	.size	__func__.15202, 18
__func__.15202:
	.ascii	"HEVC_CalcTileInfo\000"
	.space	2
	.type	__func__.15684, %object
	.size	__func__.15684, 27
__func__.15684:
	.ascii	"HEVC_GetUnRefPicWithMinPoc\000"
	.space	1
	.type	__func__.15693, %object
	.size	__func__.15693, 21
__func__.15693:
	.ascii	"HEVC_IncreaseDPBSize\000"
	.space	3
	.type	__func__.15936, %object
	.size	__func__.15936, 17
__func__.15936:
	.ascii	"HEVC_CalcTileMap\000"
	.space	3
	.type	__func__.15956, %object
	.size	__func__.15956, 17
__func__.15956:
	.ascii	"HEVC_WritePicMsg\000"
	.space	3
	.type	__func__.15985, %object
	.size	__func__.15985, 16
__func__.15985:
	.ascii	"HEVC_CheckListX\000"
	.type	__func__.16152, %object
	.size	__func__.16152, 16
__func__.16152:
	.ascii	"HEVC_RepairList\000"
	.type	__func__.16239, %object
	.size	__func__.16239, 16
__func__.16239:
	.ascii	"HEVC_ArrangeMem\000"
	.type	__func__.16312, %object
	.size	__func__.16312, 20
__func__.16312:
	.ascii	"HEVC_RemoveApcStore\000"
	.type	__func__.16590, %object
	.size	__func__.16590, 21
__func__.16590:
	.ascii	"HEVC_CheckFrameStore\000"
	.space	3
	.type	__func__.16658, %object
	.size	__func__.16658, 19
__func__.16658:
	.ascii	"HEVC_GetSLHDR1Info\000"
	.space	1
	.type	__func__.16785, %object
	.size	__func__.16785, 14
__func__.16785:
	.ascii	"HEVC_IsNewPic\000"
	.space	2
	.type	g_Quant8InterDefault, %object
	.size	g_Quant8InterDefault, 64
g_Quant8InterDefault:
	.word	269488144
	.word	403968529
	.word	286265360
	.word	421008402
	.word	303108112
	.word	471406612
	.word	336728336
	.word	555489560
	.word	403968529
	.word	690035737
	.word	421008402
	.word	908665116
	.word	471406612
	.word	1194731809
	.word	555489560
	.word	1531393577
	.type	g_QuantTsDefault, %object
	.size	g_QuantTsDefault, 16
g_QuantTsDefault:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	__func__.17101, %object
	.size	__func__.17101, 16
__func__.17101:
	.ascii	"HEVC_ReleaseNAL\000"
	.type	__func__.16271, %object
	.size	__func__.16271, 20
__func__.16271:
	.ascii	"HEVC_InitDecBuffers\000"
	.type	__func__.14698, %object
	.size	__func__.14698, 23
__func__.14698:
	.ascii	"HEVC_ParseVPSExtension\000"
	.space	1
	.type	__func__.15247, %object
	.size	__func__.15247, 12
__func__.15247:
	.ascii	"HEVC_DecVPS\000"
	.type	__func__.16843, %object
	.size	__func__.16843, 24
__func__.16843:
	.ascii	"HEVC_DecScalingListData\000"
	.type	g_CropUnitX, %object
	.size	g_CropUnitX, 16
g_CropUnitX:
	.word	1
	.word	2
	.word	2
	.word	1
	.type	g_CropUnitY, %object
	.size	g_CropUnitY, 16
g_CropUnitY:
	.word	1
	.word	2
	.word	1
	.word	1
	.type	__func__.15313, %object
	.size	__func__.15313, 12
__func__.15313:
	.ascii	"HEVC_DecSPS\000"
	.type	__func__.15327, %object
	.size	__func__.15327, 16
__func__.15327:
	.ascii	"HEVC_ProcessPPS\000"
	.type	__func__.15357, %object
	.size	__func__.15357, 12
__func__.15357:
	.ascii	"HEVC_DecPPS\000"
	.type	__func__.15808, %object
	.size	__func__.15808, 27
__func__.15808:
	.ascii	"HEVC_DecSliceSegmentHeader\000"
	.space	1
	.type	__func__.16250, %object
	.size	__func__.16250, 13
__func__.16250:
	.ascii	"HEVC_InitDPB\000"
	.space	3
	.type	__func__.14906, %object
	.size	__func__.14906, 20
__func__.14906:
	.ascii	"HEVC_ArrangeShvcMem\000"
	.type	__func__.16418, %object
	.size	__func__.16418, 19
__func__.16418:
	.ascii	"HEVC_OutputCurrPic\000"
	.space	1
	.type	__func__.16423, %object
	.size	__func__.16423, 23
__func__.16423:
	.ascii	"HEVC_FirstFrameFastOut\000"
	.space	1
	.type	__func__.16582, %object
	.size	__func__.16582, 19
__func__.16582:
	.ascii	"HEVC_OutputFrmToVO\000"
	.space	1
	.type	__func__.16538, %object
	.size	__func__.16538, 22
__func__.16538:
	.ascii	"HEVC_OutputFrmFromDPB\000"
	.space	2
	.type	__func__.15699, %object
	.size	__func__.15699, 30
__func__.15699:
	.ascii	"HEVC_OutputUnRefPicWithMinPoc\000"
	.space	2
	.type	__func__.16557, %object
	.size	__func__.16557, 27
__func__.16557:
	.ascii	"HEVC_FlushOutputFrmFromDPB\000"
	.space	1
	.type	__func__.17164, %object
	.size	__func__.17164, 14
__func__.17164:
	.ascii	"HEVC_ClearDPB\000"
	.space	2
	.type	__func__.15704, %object
	.size	__func__.15704, 23
__func__.15704:
	.ascii	"HEVC_RecoverDPBProcess\000"
	.space	1
	.type	__func__.16518, %object
	.size	__func__.16518, 20
__func__.16518:
	.ascii	"HEVC_InsertFrmInDPB\000"
	.type	__func__.16428, %object
	.size	__func__.16428, 22
__func__.16428:
	.ascii	"HEVC_SimpleDPBProcess\000"
	.space	2
	.type	__func__.16433, %object
	.size	__func__.16433, 21
__func__.16433:
	.ascii	"HEVC_DecOrderProcess\000"
	.space	3
	.type	__func__.16447, %object
	.size	__func__.16447, 22
__func__.16447:
	.ascii	"HEVC_DispOrderProcess\000"
	.space	2
	.type	__func__.16462, %object
	.size	__func__.16462, 19
__func__.16462:
	.ascii	"HEVC_StorePicInDPB\000"
	.space	1
	.type	__func__.16071, %object
	.size	__func__.16071, 12
__func__.16071:
	.ascii	"HEVC_DecVDM\000"
	.type	__func__.14932, %object
	.size	__func__.14932, 18
__func__.14932:
	.ascii	"HEVC_VES_Splitter\000"
	.space	2
	.type	__func__.15745, %object
	.size	__func__.15745, 14
__func__.15745:
	.ascii	"HEVC_DecSlice\000"
	.space	2
	.type	__func__.17246, %object
	.size	__func__.17246, 20
__func__.17246:
	.ascii	"HEVC_HaveSliceToDec\000"
	.type	__func__.17298, %object
	.size	__func__.17298, 13
__func__.17298:
	.ascii	"HEVCDEC_Init\000"
	.space	3
	.type	__func__.17312, %object
	.size	__func__.17312, 23
__func__.17312:
	.ascii	"HEVCDEC_GetImageBuffer\000"
	.space	1
	.type	__func__.17327, %object
	.size	__func__.17327, 21
__func__.17327:
	.ascii	"HEVCDEC_DecodePacket\000"
	.space	3
	.type	g_HevcNalTypeEOP, %object
	.size	g_HevcNalTypeEOP, 21
g_HevcNalTypeEOP:
	.byte	0
	.byte	0
	.byte	1
	.byte	96
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.space	3
	.type	__func__.17376, %object
	.size	__func__.17376, 21
__func__.17376:
	.ascii	"HEVCDEC_GetRemainImg\000"
	.data
	.align	2
.LANCHOR2 = . + 0
	.type	g_Quant8IntraDefault, %object
	.size	g_Quant8IntraDefault, 64
g_Quant8IntraDefault:
	.word	269488144
	.word	404034065
	.word	269488144
	.word	420877073
	.word	303108112
	.word	488183316
	.word	353505296
	.word	606018328
	.word	403968273
	.word	791225118
	.word	454431506
	.word	1094069283
	.word	521737749
	.word	1480996393
	.word	605886744
	.word	1935163695
	.type	g_QuantTSDefault4x4, %object
	.size	g_QuantTSDefault4x4, 16
g_QuantTSDefault4x4:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.type	g_QuantInterDefault8x8, %object
	.size	g_QuantInterDefault8x8, 64
g_QuantInterDefault8x8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	91
	.type	g_QuantIntraDefault8x8, %object
	.size	g_QuantIntraDefault8x8, 64
g_QuantIntraDefault8x8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	21
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	19
	.byte	22
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	22
	.byte	25
	.byte	29
	.byte	16
	.byte	16
	.byte	18
	.byte	21
	.byte	24
	.byte	27
	.byte	31
	.byte	36
	.byte	17
	.byte	17
	.byte	20
	.byte	24
	.byte	30
	.byte	35
	.byte	41
	.byte	47
	.byte	18
	.byte	19
	.byte	22
	.byte	27
	.byte	35
	.byte	44
	.byte	54
	.byte	65
	.byte	21
	.byte	22
	.byte	25
	.byte	31
	.byte	41
	.byte	54
	.byte	70
	.byte	88
	.byte	24
	.byte	25
	.byte	29
	.byte	36
	.byte	47
	.byte	65
	.byte	88
	.byte	115
	.type	g_RpuStartCode, %object
	.size	g_RpuStartCode, 5
g_RpuStartCode:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	25
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	ASCII(.ascii	"../../core/syntax/hevc.c\000" )
	.space	3
.LC3:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%" )
	ASCII(.ascii	"d, logic_fs=%p, dec_fs=%p)\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s: pImg is NULL!\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"View %d image queue is full, discard head image %d." )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"%s: view0 frame poc(%d) > view1 frame poc(%d)\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"%s: view1 frame poc(%d) > view0 frame poc(%d)\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"%s: Image(view=0, poc=%d) output failed!\012\000" )
	.space	2
.LC10:
	ASCII(.ascii	"%s: Image(view=1, poc=%d) output failed!\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"%s: InsertImgToVoQueue failed!\012\000" )
.LC12:
	ASCII(.ascii	"%s pVPSExt = NULL\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"%s pPPSExt = NULL\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"%s pSlcExt = NULL\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"line:%d ChanID(%d), pic_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range(0,%d).\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"line:%d ChanID(%d), seq_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range[0,%d].\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"dar=%d\012\000" )
.LC18:
	ASCII(.ascii	"--------------- PrintNaluArraySlot START ----------" )
	ASCII(.ascii	"-----\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"--------------- PrintNaluArraySlot END ------------" )
	ASCII(.ascii	"---\012\000" )
.LC21:
	ASCII(.ascii	"NalArray[%d]=%p,is_valid=%d   \000" )
	.space	1
.LC22:
	ASCII(.ascii	"--------------- PrintCurrSlicelistX START ---------" )
	ASCII(.ascii	"------\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"List0, size: %d\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"List1, size: %d\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"pListX[0][%d]:%p \000" )
	.space	2
.LC26:
	ASCII(.ascii	"pFrameStore:%p \000" )
.LC27:
	ASCII(.ascii	"pLogicFs:%p \000" )
	.space	3
.LC28:
	ASCII(.ascii	"--------------- PrintCurrSlicelistX END -----------" )
	ASCII(.ascii	"----\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"pListX[1][%d]: %p\000" )
	.space	2
.LC30:
	ASCII(.ascii	"--------------- PrintFrameStoreState START --------" )
	ASCII(.ascii	"-------\012\000" )
.LC31:
	ASCII(.ascii	"--------------- PrintFrameStoreState END ----------" )
	ASCII(.ascii	"-----\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"Fs=%d, pFs=%p, state=%d, is_reference=%d, is_displa" )
	ASCII(.ascii	"yed=%d \000" )
	.space	1
.LC33:
	ASCII(.ascii	"p_usrdat[%d]=%p \000" )
	.space	3
.LC34:
	ASCII(.ascii	"--------------- PrintAPCState START ---------------" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"Layer %d: APC.used_size:%d, APC.size:%d\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"%d: is_used=%d, idc=%d, poc=%d\012\000" )
.LC37:
	ASCII(.ascii	"--------------- PrintAPCState END ---------------\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC38:
	ASCII(.ascii	"--------------- PrintDPBState START ---------------" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"DPB: size:%d, used_size:%d, negative:%d, positive:%" )
	ASCII(.ascii	"d, longterm:%d\012\000" )
	.space	1
.LC40:
	ASCII(.ascii	"fs[%d]:%p view %d non_existing:%d state:%d is_ref:%" )
	ASCII(.ascii	"d displayed:%d poc:%d long_term:%d LogicFs:%p, fsp_" )
	ASCII(.ascii	"ref:%d fsp_disp:%d logic_id:%d img_id:%d\012\000" )
.LC41:
	ASCII(.ascii	"--------------- PrintDPBState END ---------------\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC42:
	ASCII(.ascii	"fs[%d]\011\000" )
.LC43:
	ASCII(.ascii	"LogicFs:%p\011\000" )
.LC44:
	ASCII(.ascii	"LogicTick:%d\011\000" )
	.space	2
.LC45:
	ASCII(.ascii	"IsRef:%d\011\000" )
	.space	2
.LC46:
	ASCII(.ascii	"DispState:%d\011\000" )
	.space	2
.LC47:
	ASCII(.ascii	"LogicFs:Null\011\000" )
	.space	2
.LC48:
	ASCII(.ascii	"DecFs:%p\011\000" )
	.space	2
.LC49:
	ASCII(.ascii	"DecTick:%d\011\000" )
.LC50:
	ASCII(.ascii	"DecFs:Null\011\000" )
.LC51:
	ASCII(.ascii	"DispFs:%p\011\000" )
	.space	1
.LC52:
	ASCII(.ascii	"DispTick:%d\011\000" )
	.space	3
.LC53:
	ASCII(.ascii	"DispFs:Null\011\000" )
	.space	3
.LC54:
	ASCII(.ascii	"%s num_tile_columns(%d) out of range(0, %d].\012\000" )
	.space	2
.LC55:
	ASCII(.ascii	"%s num_tile_rows(%d) out of range(0, %d].\012\000" )
	.space	1
.LC56:
	ASCII(.ascii	"%s 0 idx(%d) out of range(0, 512).\012\000" )
.LC57:
	ASCII(.ascii	"%s 1 idx(%d) out of range(0, 512).\012\000" )
.LC58:
	ASCII(.ascii	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC59:
	ASCII(.ascii	"pListX[0][%d] = NULL, listXsize[0] = %d\012\000" )
	.space	3
.LC60:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC61:
	ASCII(.ascii	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) inval" )
	ASCII(.ascii	"id\012\000" )
	.space	1
.LC62:
	ASCII(.ascii	"pListX[1][%d] = NULL, listXsize[1] = %d\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC64:
	ASCII(.ascii	"pListX[i][%d] pstLogicFs(%p) invalid\012\000" )
	.space	2
.LC65:
	ASCII(.ascii	"%s DPB.used_size(%d) >= 17.\012\000" )
	.space	3
.LC66:
	ASCII(.ascii	"%s can't find such pic.\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"%s find pos=%d, poc=%d.\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"%s DPB.size(%d) already reached max(%d).\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"%s increase DPB size to %d\012\000" )
.LC70:
	ASCII(.ascii	"%s no enough fs(total_fs_num=%d) to increase DPB si" )
	ASCII(.ascii	"ze.\012\000" )
.LC71:
	ASCII(.ascii	"TileWidthInCtb is 0\012\000" )
	.space	3
.LC72:
	ASCII(.ascii	"%s: g_pGlbVar is NULL!\012\000" )
.LC73:
	ASCII(.ascii	"image_id=%d, pmv_idc=%d\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"pic msg burst0:\012\000" )
	.space	3
.LC75:
	ASCII(.ascii	"%s call HEVC_CalcTileInfo failed.\012\000" )
	.space	1
.LC76:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC77:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC78:
	ASCII(.ascii	"%s ERROR: bHaveIndependentSlice = 0\012\012\000" )
	.space	2
.LC79:
	ASCII(.ascii	"ListX ERROR: list0size >= %d\012\000" )
	.space	2
.LC80:
	ASCII(.ascii	"ListX ERROR: list1size >= %d\012\000" )
	.space	2
.LC81:
	ASCII(.ascii	"pListX[0][%d] = NULL\012\000" )
	.space	2
.LC82:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL\012\000" )
	.space	1
.LC83:
	ASCII(.ascii	"pListX[1][%d] = NULL\012\000" )
	.space	2
.LC84:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL\012\000" )
	.space	1
.LC85:
	ASCII(.ascii	"NumSlicePara(%d) >= MaxSliceNum(%d)\012\000" )
	.space	3
.LC86:
	ASCII(.ascii	"width is larger than 3! (%d, %d)\012\000" )
	.space	2
.LC87:
	ASCII(.ascii	"height is larger than 3! (%d, %d)\012\000" )
	.space	1
.LC88:
	ASCII(.ascii	"line:%d pic_parameter_set_id(%d) out of range(0,%d)" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC89:
	ASCII(.ascii	"line:%d seq_parameter_set_id(%d) out of range[0,%d]" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC90:
	ASCII(.ascii	"line:%d, i(%d) > Max(%d) num_of_pics %d\012\000" )
	.space	3
.LC91:
	ASCII(.ascii	"line:%d, i(%d) > Max(%d)(neg%d + pos%d)\012\000" )
	.space	3
.LC92:
	ASCII(.ascii	"%s unkown slice type(%d).\012\000" )
	.space	1
.LC93:
	ASCII(.ascii	"%s pListX[%d] no available pic to repair.\012\000" )
	.space	1
.LC94:
	ASCII(.ascii	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\012" )
	ASCII(.ascii	"\000" )
.LC95:
	ASCII(.ascii	"HEVC_InitListX error.\012\000" )
	.space	1
.LC96:
	ASCII(.ascii	"HEVC_RepairList error.\012\000" )
.LC97:
	ASCII(.ascii	"%s image size abnormal(%dx%d)\012\000" )
	.space	1
.LC98:
	ASCII(.ascii	"%s HEVC FSP_ConfigInstance failed!\012\000" )
.LC99:
	ASCII(.ascii	"%s fs[%d]->view_id = %d invalid.\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC101:
	ASCII(.ascii	"Cant find free apc slot.\012\000" )
	.space	2
.LC102:
	ASCII(.ascii	"%s frame logic_fs_id=%d, state=%d\012\000" )
	.space	1
.LC103:
	ASCII(.ascii	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null," )
	ASCII(.ascii	" logic_fs_id = %d\012\000" )
	.space	2
.LC104:
	ASCII(.ascii	"%s frame poc=%d, is already output\012\000" )
.LC105:
	ASCII(.ascii	"%s frame(%p) invalid, state:%d, non_existing:%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC106:
	ASCII(.ascii	"exg_pts: %lld <-> %lld\012\000" )
.LC107:
	ASCII(.ascii	"HEVC_DECRecycleImage ERROR, DispState = FS_DISP_STA" )
	ASCII(.ascii	"TE_NOT_USED\012\000" )
.LC108:
	ASCII(.ascii	"%-5d   specVersion\012\000" )
.LC109:
	ASCII(.ascii	"%-5d   payloadMode\012\000" )
.LC110:
	ASCII(.ascii	"%-5d   hdrPicColourSpace\012\000" )
	.space	2
.LC111:
	ASCII(.ascii	"%-5d   hdrMasterDisplayColourSpace\012\000" )
.LC112:
	ASCII(.ascii	"%-5d   hdrMasterDisplayMaxLuminance\012\000" )
	.space	3
.LC113:
	ASCII(.ascii	"%-5d   hdrMasterDisplayMinLuminance\012\000" )
	.space	3
.LC114:
	ASCII(.ascii	"%-5d   sdrPicColourSpace\012\000" )
	.space	2
.LC115:
	ASCII(.ascii	"%-5d   sdrMasterDisplayColourSpace\012\000" )
.LC116:
	ASCII(.ascii	"%-5d   tmInputSignalBlackLevelOffset\012\000" )
	.space	2
.LC117:
	ASCII(.ascii	"%-5d   tmInputSignalWhiteLevelOffset\012\000" )
	.space	2
.LC118:
	ASCII(.ascii	"%-5d   shadowGain\012\000" )
	.space	1
.LC119:
	ASCII(.ascii	"%-5d   highlightGain\012\000" )
	.space	2
.LC120:
	ASCII(.ascii	"%-5d   midToneWidthAdjFactor\012\000" )
	.space	2
.LC121:
	ASCII(.ascii	"%-5d   tmOutputFineTuningNumVal\012\000" )
	.space	3
.LC122:
	ASCII(.ascii	"%-5d   saturationGainNumVal\012\000" )
	.space	3
.LC123:
	ASCII(.ascii	"%-5d   tmOutputFineTuningX[%d]\012\000" )
.LC124:
	ASCII(.ascii	"%-5d   tmOutputFineTuningY[%d]\012\000" )
.LC125:
	ASCII(.ascii	"%-5d   saturationGainX[%d]\012\000" )
.LC126:
	ASCII(.ascii	"%-5d   saturationGainY[%d]\012\000" )
.LC127:
	ASCII(.ascii	"%-5d   luminanceMappingNumVal\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"%-5d   colourCorrectionNumVal\012\000" )
	.space	1
.LC129:
	ASCII(.ascii	"%-5d   luminanceMappingX[%d]\012\000" )
	.space	2
.LC130:
	ASCII(.ascii	"%-5d   luminanceMappingY[%d]\012\000" )
	.space	2
.LC131:
	ASCII(.ascii	"%-5d   chromaToLumaInjectionMuA\012\000" )
	.space	3
.LC132:
	ASCII(.ascii	"%-5d   chromaToLumaInjectionMuB\012\000" )
	.space	3
.LC133:
	ASCII(.ascii	"%-5d   colourCorrectionX[%d]\012\000" )
	.space	2
.LC134:
	ASCII(.ascii	"%-5d   colourCorrectionY[%d]\012\000" )
	.space	2
.LC135:
	ASCII(.ascii	"======SL_HDR1_METADATA= %d=======\012\000" )
	.space	1
.LC136:
	ASCII(.ascii	"%s, [%d %d %d %d %d]\012\000" )
	.space	2
.LC137:
	ASCII(.ascii	"%s HDR_Metadata_phy_addr is invalid!!\012\000" )
	.space	1
.LC138:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC139:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC140:
	ASCII(.ascii	"FSP_GetFspType -1\012\000" )
	.space	1
.LC141:
	ASCII(.ascii	"FSP_GetLogicFs return NULL\012\000" )
.LC142:
	ASCII(.ascii	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), err" )
	ASCII(.ascii	"or resilence.\012\000" )
	.space	2
.LC143:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC144:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC145:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC146:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC147:
	ASCII(.ascii	"sps with this seq_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC148:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of r" )
	ASCII(.ascii	"ange\012\000" )
	.space	3
.LC149:
	ASCII(.ascii	"vps with this video_parameter_set_id = %d havn't be" )
	ASCII(.ascii	" decoded\012\000" )
	.space	3
.LC150:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, n" )
	ASCII(.ascii	"al_unit_type = %d, should skip this frame\012\000" )
	.space	2
.LC151:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d," )
	ASCII(.ascii	" nal_unit_type = %d, should skip this frame\012\000" )
.LC152:
	ASCII(.ascii	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocC" )
	ASCII(.ascii	"RA = %d, nal_unit_type = %d, should skip this frame" )
	ASCII(.ascii	"\012\000" )
.LC153:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code should not be zero.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC154:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code:%d\012\000" )
	.space	3
.LC155:
	ASCII(.ascii	"reserved_zero_2bits not equal 0.\012\000" )
	.space	2
.LC156:
	ASCII(.ascii	"HEVC_GetScalingListDefaultAddress NULL.\012\000" )
	.space	3
.LC157:
	ASCII(.ascii	"Error, BsLen: 0x%x, TotalPos: 0x%x\012\000" )
.LC158:
	ASCII(.ascii	"Panic: All zero data sequence in RBSP \012\000" )
.LC159:
	ASCII(.ascii	"nal_trail_zero_bit_num err\012\000" )
.LC160:
	ASCII(.ascii	"%s release streambuff=%p, bitstream_length=%d\012\000" )
	.space	1
.LC161:
	ASCII(.ascii	"%s DPB size exceed %d, force to %d\012\000" )
.LC162:
	ASCII(.ascii	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\012\000" )
	.space	2
.LC163:
	ASCII(.ascii	"END of the bit buffer, copy the first packet!\012\000" )
	.space	1
.LC164:
	ASCII(.ascii	"tone_map_id\000" )
.LC165:
	ASCII(.ascii	"Unsupport: target_bit_depth(%d) > 8\012\000" )
	.space	3
.LC166:
	ASCII(.ascii	"pTon->num_pivots > 256\012\000" )
.LC167:
	ASCII(.ascii	"frame_packing_arrangement_id\000" )
	.space	3
.LC168:
	ASCII(.ascii	"frame_packing_arrangement_type(%d) out of range\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC169:
	ASCII(.ascii	"decoding_unit_idx\000" )
	.space	2
.LC170:
	ASCII(.ascii	"num_sps_ids_minus1\000" )
	.space	1
.LC171:
	ASCII(.ascii	"pAct->num_sps_ids_minus1 > 15\012\000" )
	.space	1
.LC172:
	ASCII(.ascii	"active_seq_parameter_set_id\000" )
.LC173:
	ASCII(.ascii	"bp_seq_parameter_set_id\000" )
.LC174:
	ASCII(.ascii	"Wrong bp_seq_parameter_set_id = %d, should be 0 to " )
	ASCII(.ascii	"15!\012\000" )
.LC175:
	ASCII(.ascii	"num_decoding_units_minus1\000" )
	.space	2
.LC176:
	ASCII(.ascii	"pPic->num_decoding_units_minus1 > 255\012\000" )
	.space	1
.LC177:
	ASCII(.ascii	"num_nalus_in_du_minus1\000" )
	.space	1
.LC178:
	ASCII(.ascii	"cv_rec_id\000" )
	.space	2
.LC179:
	ASCII(.ascii	"HEVC_Sei_User_Data_Registered_Itu_T_T35 payloadSize" )
	ASCII(.ascii	" < 4!!\012\000" )
	.space	1
.LC180:
	ASCII(.ascii	"delta_idx_minus1\000" )
	.space	3
.LC181:
	ASCII(.ascii	"delta_idx(%d) > idx(%d).\012\000" )
	.space	2
.LC182:
	ASCII(.ascii	"rIdx(%d) > (idx-1)(%d) or < 0).\012\000" )
	.space	3
.LC183:
	ASCII(.ascii	"abs_delta_rps_minus1\000" )
	.space	3
.LC184:
	ASCII(.ascii	"pTempRPset->num_of_pics(%d) out of range(0,15).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC185:
	ASCII(.ascii	"num_of_pics out of range(0,15).\012\000" )
	.space	3
.LC186:
	ASCII(.ascii	"num_negative_pics\000" )
	.space	2
.LC187:
	ASCII(.ascii	"pTempRPset->num_negative_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC188:
	ASCII(.ascii	"num_positive_pics\000" )
	.space	2
.LC189:
	ASCII(.ascii	"pTempRPset->num_positive_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC190:
	ASCII(.ascii	"pShortTermRpset->num_of_pics(%d) out of range[0,%d]" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC191:
	ASCII(.ascii	"delta_poc_s0_minus1\000" )
.LC192:
	ASCII(.ascii	"delta_poc_s0_minus1(%d) out of range.\012\000" )
	.space	1
.LC193:
	ASCII(.ascii	"delta_poc_s1_minus1\000" )
.LC194:
	ASCII(.ascii	"elemental_duration_in_tc_minus1\000" )
.LC195:
	ASCII(.ascii	"cpb_cnt_minus1\000" )
	.space	1
.LC196:
	ASCII(.ascii	"cpb_cnt_minus1(%d) out of range(0,31).\012\000" )
.LC197:
	ASCII(.ascii	"bit_rate_value_minus1\000" )
	.space	2
.LC198:
	ASCII(.ascii	"cpb_size_value_minus1\000" )
	.space	2
.LC199:
	ASCII(.ascii	"cpb_size_du_value_minus1\000" )
	.space	3
.LC200:
	ASCII(.ascii	"bit_rate_du_value_minus1\000" )
	.space	3
.LC201:
	ASCII(.ascii	"%s: vps_max_layers_minus1 %d out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC202:
	ASCII(.ascii	"num_add_layer_sets\000" )
	.space	1
.LC203:
	ASCII(.ascii	"%s %d: num_add_layer_sets %d >= HEVC_MAX_VPS_OP_SET" )
	ASCII(.ascii	"S_PLUS1 %d\012\000" )
	.space	1
.LC204:
	ASCII(.ascii	"vps_num_profile_tier_level_minus1\000" )
	.space	2
.LC205:
	ASCII(.ascii	"num_add_olss\000" )
	.space	3
.LC206:
	ASCII(.ascii	"%s %d: num_output_layer_sets %d >= HEVC_MAX_VPS_OUT" )
	ASCII(.ascii	"PUTLAYER_SETS %d, num_add_olss %d, num_layer_sets %" )
	ASCII(.ascii	"d\012\000" )
	.space	3
.LC207:
	ASCII(.ascii	"%s %d: Idx %d >= HEVC_MAX_VPS_OP_SETS_PLUS1\012\000" )
	.space	3
.LC208:
	ASCII(.ascii	"vps_num_rep_formats_minus1 > 255.\012\000" )
	.space	1
.LC209:
	ASCII(.ascii	"conf_win_vps_left_offset\000" )
	.space	3
.LC210:
	ASCII(.ascii	"conf_win_vps_right_offset\000" )
	.space	2
.LC211:
	ASCII(.ascii	"conf_win_vps_top_offset\000" )
.LC212:
	ASCII(.ascii	"conf_win_vps_bottom_offset\000" )
	.space	1
.LC213:
	ASCII(.ascii	"bit_depth_vps_luma_minus8(%d) or bit_depth_vps_chro" )
	ASCII(.ascii	"ma_minus8(%d) out of range [0,8]\012\000" )
	.space	3
.LC214:
	ASCII(.ascii	"direct_dep_type_len_minus2\000" )
	.space	1
.LC215:
	ASCII(.ascii	"max_vps_num_reorder_pics\000" )
	.space	3
.LC216:
	ASCII(.ascii	"max_vps_latency_increase_plus1\000" )
	.space	1
.LC217:
	ASCII(.ascii	"max_vps_dec_pic_buffering_minus1\000" )
	.space	3
.LC218:
	ASCII(.ascii	"vps_non_vui_extension_length\000" )
	.space	3
.LC219:
	ASCII(.ascii	"min_spatial_segment_offset_plus1\000" )
	.space	3
.LC220:
	ASCII(.ascii	"min_horizontal_ctu_offset_plus1\000" )
.LC221:
	ASCII(.ascii	"vps_num_add_hrd_params\000" )
	.space	1
.LC222:
	ASCII(.ascii	"vps_num_hrd_params %d out of range [0,%d]\012\000" )
	.space	1
.LC223:
	ASCII(.ascii	"num_sub_layer_hrd_minus1\000" )
	.space	3
.LC224:
	ASCII(.ascii	"hrd %d num_sub_layer_hrd_minus1 %d out of range [0," )
	ASCII(.ascii	"%d]\012\000" )
.LC225:
	ASCII(.ascii	"HEVC_DecHrdParam failed.\012\000" )
	.space	2
.LC226:
	ASCII(.ascii	"num_signalled_partitioning_schemes\000" )
	.space	1
.LC227:
	ASCII(.ascii	"OPL %d num_signalled_partitioning_schemes %d out of" )
	ASCII(.ascii	" range [0,%d]\012\000" )
	.space	2
.LC228:
	ASCII(.ascii	"num_partitions_in_scheme_minus1\000" )
.LC229:
	ASCII(.ascii	"num_bsp_schedules_minus1\000" )
	.space	3
.LC230:
	ASCII(.ascii	"OPL %d Partition %d Tid %dnum_bsp_schedules_minus1 " )
	ASCII(.ascii	"%d out of range [0,31]\012\000" )
	.space	1
.LC231:
	ASCII(.ascii	"bsp_sched_idx\000" )
	.space	2
.LC232:
	ASCII(.ascii	"vps_num_rep_formats_minus1\000" )
	.space	1
.LC233:
	ASCII(.ascii	"HEVCC_ParseBspPartitonParameters failed.\012\000" )
	.space	2
.LC234:
	ASCII(.ascii	"vps_base_layer_available_flag(%d) not equal 0x1.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC235:
	ASCII(.ascii	"vps_max_layers_minus1 %d out of range[0,63].\012\000" )
	.space	2
.LC236:
	ASCII(.ascii	"vps_max_sub_layers_minus1=%d\012\000" )
	.space	2
.LC237:
	ASCII(.ascii	"vps_reserved_0xffff_16bits not equal 0xffff.\012\000" )
	.space	2
.LC238:
	ASCII(.ascii	"VPS HEVC_DecPTL error.\012\000" )
.LC239:
	ASCII(.ascii	"vps_max_dec_pic_buffering_minus1[i]\000" )
.LC240:
	ASCII(.ascii	"vps_num_reorder_pics[i]\000" )
.LC241:
	ASCII(.ascii	"vps_max_latency_increase_plus1[i]\000" )
	.space	2
.LC242:
	ASCII(.ascii	"vps_max_layer_id out of range[0,%d].\012\000" )
	.space	2
.LC243:
	ASCII(.ascii	"This is MV_HEVC!\012\000" )
	.space	2
.LC244:
	ASCII(.ascii	"vps_num_layer_sets_minus1\000" )
	.space	2
.LC245:
	ASCII(.ascii	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC246:
	ASCII(.ascii	"vps_num_ticks_poc_diff_one_minus1\000" )
	.space	2
.LC247:
	ASCII(.ascii	"vps_num_hrd_parameters\000" )
	.space	1
.LC248:
	ASCII(.ascii	"vps_num_hrd_parameters(%d) out of range[0,%d].\012\000" )
.LC249:
	ASCII(.ascii	"hrd_layer_set_idx\000" )
	.space	2
.LC250:
	ASCII(.ascii	"VPS HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC251:
	ASCII(.ascii	"HEVC VPSExtension error.\012\000" )
	.space	2
.LC252:
	ASCII(.ascii	"pVPS->vps_video_parameter_set_id out of range(0,15)" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC253:
	ASCII(.ascii	"VPS[%d] decode error0.\012\000" )
.LC254:
	ASCII(.ascii	"VPS[%d] decode error1.\012\000" )
.LC255:
	ASCII(.ascii	"chroma_sample_loc_type_top_field\000" )
	.space	3
.LC256:
	ASCII(.ascii	"chroma_sample_loc_type_bottom_field\000" )
.LC257:
	ASCII(.ascii	"def_disp_win_left_offset\000" )
	.space	3
.LC258:
	ASCII(.ascii	"VUI pSps->chroma_format_idc out of range(0,3).\012\000" )
.LC259:
	ASCII(.ascii	"def_disp_win_right_offset\000" )
	.space	2
.LC260:
	ASCII(.ascii	"def_disp_win_top_offset\000" )
.LC261:
	ASCII(.ascii	"def_disp_win_bottom_offset\000" )
	.space	1
.LC262:
	ASCII(.ascii	"vui_num_ticks_poc_diff_one_minus1\000" )
	.space	2
.LC263:
	ASCII(.ascii	"VUI HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC264:
	ASCII(.ascii	"min_spatial_segmentation_idc\000" )
	.space	3
.LC265:
	ASCII(.ascii	"VUI min_spatial_segmentation_idc out of range(0,409" )
	ASCII(.ascii	"5).\012\000" )
.LC266:
	ASCII(.ascii	"max_bytes_per_pic_denom\000" )
.LC267:
	ASCII(.ascii	"max_bits_per_min_cu_denom\000" )
	.space	2
.LC268:
	ASCII(.ascii	"log2_max_mv_length_horizontal\000" )
	.space	2
.LC269:
	ASCII(.ascii	"log2_max_mv_length_vertical\000" )
.LC270:
	ASCII(.ascii	"sop_seq_parameter_set_id\000" )
	.space	3
.LC271:
	ASCII(.ascii	"num_entries_in_sop_minus1\000" )
	.space	2
.LC272:
	ASCII(.ascii	"num_entries_in_sop_minus1 out of range(0,1024)\012\000" )
.LC273:
	ASCII(.ascii	"sop_short_term_rps_idx\000" )
	.space	1
.LC274:
	ASCII(.ascii	"sop_poc_delta\000" )
	.space	2
.LC275:
	ASCII(.ascii	"recovery_poc_cnt\000" )
	.space	3
.LC276:
	ASCII(.ascii	"colour_remap_id\000" )
.LC277:
	ASCII(.ascii	"colour_remap_coeffs\000" )
.LC278:
	ASCII(.ascii	"ERROR: post_lut_num_val_minus1 %d out of range[0, 3" )
	ASCII(.ascii	"2]\012\000" )
	.space	1
.LC279:
	ASCII(.ascii	"reserved_payload_extension_data\000" )
.LC280:
	ASCII(.ascii	"line:%d Cosume TotalPos(%d > %d)!!!\012\000" )
	.space	3
.LC281:
	ASCII(.ascii	"HEVC_SeiMessage HEVC_Sei_Payload error.\012\000" )
	.space	3
.LC282:
	ASCII(.ascii	"SEI pSEISPS = NULL.\012\000" )
	.space	3
.LC283:
	ASCII(.ascii	"SEI HEVC_SeiMessage error.\012\000" )
.LC284:
	ASCII(.ascii	"SEI BsIsByteAligned error.\012\000" )
.LC285:
	ASCII(.ascii	"SEI rbsp_trailing_bits(%d) not equal 0x80.\012\000" )
.LC286:
	ASCII(.ascii	"nesting_num_ops_minus1\000" )
	.space	1
.LC287:
	ASCII(.ascii	"nesting_num_ops_minus1 out of range(0,%d)\012\000" )
	.space	1
.LC288:
	ASCII(.ascii	"nesting_op_idx\000" )
	.space	1
.LC289:
	ASCII(.ascii	"nesting_num_layers_minus1\000" )
	.space	2
.LC290:
	ASCII(.ascii	"nesting_num_layers_minus1 out of range(0,63)\012\000" )
	.space	2
.LC291:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta\000" )
	.space	2
.LC292:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta out of range(0,ma" )
	ASCII(.ascii	"trixId).\012\000" )
	.space	3
.LC293:
	ASCII(.ascii	"HEVC_DecScalingListData pMatrixAddress NULL.\012\000" )
	.space	2
.LC294:
	ASCII(.ascii	"scaling_list_dc_coef_minus8\000" )
.LC295:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-7,247).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC296:
	ASCII(.ascii	"scaling_list_delta_coef\000" )
.LC297:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-128,127)." )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC298:
	ASCII(.ascii	"sps_rep_format_idx %d > HEVC_MAX_NUM_LAYERS %d\012\000" )
.LC299:
	ASCII(.ascii	"HEVC_DeriveSPSRepFormat failed.\012\000" )
	.space	3
.LC300:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range(0,3).\012\000" )
.LC301:
	ASCII(.ascii	"pSPS->chroma_format_idc not equal(%d) 1.\012\000" )
	.space	2
.LC302:
	ASCII(.ascii	"pic_width_in_luma_samples\000" )
	.space	2
.LC303:
	ASCII(.ascii	"pic_width_in_luma_samples out of range(0,8192).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC304:
	ASCII(.ascii	"pic_height_in_luma_samples\000" )
	.space	1
.LC305:
	ASCII(.ascii	"pic_height_in_luma_samples out of range(0,4096).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC306:
	ASCII(.ascii	"ERROR Unkown level: %d\012\000" )
.LC307:
	ASCII(.ascii	"conf_win_left_offset\000" )
	.space	3
.LC308:
	ASCII(.ascii	"conf_win_right_offset\000" )
	.space	2
.LC309:
	ASCII(.ascii	"conf_win_left_offset+conf_win_right_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC310:
	ASCII(.ascii	"conf_win_top_offset\000" )
.LC311:
	ASCII(.ascii	"conf_win_bottom_offset\000" )
	.space	1
.LC312:
	ASCII(.ascii	"conf_win_top_offset+conf_win_bottom_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC313:
	ASCII(.ascii	"bit_depth_luma_minus8\000" )
	.space	2
.LC314:
	ASCII(.ascii	"bit_depth_luma(%d) out of range(8,10).\012\000" )
.LC315:
	ASCII(.ascii	"bit_depth_chroma_minus8\000" )
.LC316:
	ASCII(.ascii	"bit_depth_chroma(%d) out of range[8,14].\012\000" )
	.space	2
.LC317:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	2
.LC318:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12" )
	ASCII(.ascii	"].\012\000" )
	.space	1
.LC319:
	ASCII(.ascii	"sps_max_dec_pic_buffering_minus1\000" )
	.space	3
.LC320:
	ASCII(.ascii	"sps_num_reorder_pics\000" )
	.space	3
.LC321:
	ASCII(.ascii	"sps_max_latency_increase_plus1\000" )
	.space	1
.LC322:
	ASCII(.ascii	"log2_min_coding_block_size_minus3\000" )
	.space	2
.LC323:
	ASCII(.ascii	"log2_min_luma_coding_block_size_minus3 out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC324:
	ASCII(.ascii	"log2_diff_max_min_coding_block_size\000" )
.LC325:
	ASCII(.ascii	"log2_diff_max_min_luma_coding_block_size out of ran" )
	ASCII(.ascii	"ge(0,3).\012\000" )
	.space	3
.LC326:
	ASCII(.ascii	"log2_ctb_sizeY out of range(4,6).\012\000" )
	.space	1
.LC327:
	ASCII(.ascii	"log2_min_transform_block_size_minus2\000" )
	.space	3
.LC328:
	ASCII(.ascii	"log2_min_transform_block_size_minus2 out of range(0" )
	ASCII(.ascii	",3).\012\000" )
	.space	3
.LC329:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size\000" )
	.space	1
.LC330:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC331:
	ASCII(.ascii	"quadtree_tu_log2_min_size not less than log2_min_cb" )
	ASCII(.ascii	"_sizeY.\012\000" )
.LC332:
	ASCII(.ascii	"quadtree_tu_log2_max_size greater than Min( CtbLog2" )
	ASCII(.ascii	"SizeY, 5 ).\012\000" )
.LC333:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter\000" )
.LC334:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC335:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra\000" )
.LC336:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC337:
	ASCII(.ascii	"SPS HEVC_DecScalingListData error.\012\000" )
.LC338:
	ASCII(.ascii	"SPS sao is off and pic height(%d) is too small.(Log" )
	ASCII(.ascii	"ic Unsupported).\012\000" )
	.space	3
.LC339:
	ASCII(.ascii	"log2_min_pcm_luma_coding_block_size_minus3\000" )
	.space	1
.LC340:
	ASCII(.ascii	"log2_min_pcm_coding_block_size_minus3(%d) out of ra" )
	ASCII(.ascii	"nge[0,2].\012\000" )
	.space	2
.LC341:
	ASCII(.ascii	"log2_diff_max_min_pcm_luma_coding_block_size\000" )
	.space	3
.LC342:
	ASCII(.ascii	"log2_diff_max_min_pcm_coding_block_size(%d) out of " )
	ASCII(.ascii	"range[0,2].\012\000" )
.LC343:
	ASCII(.ascii	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5" )
	ASCII(.ascii	" ).\012\000" )
.LC344:
	ASCII(.ascii	"num_short_term_ref_pic_sets\000" )
.LC345:
	ASCII(.ascii	"num_short_term_ref_pic_sets out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC346:
	ASCII(.ascii	"SPS HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	1
.LC347:
	ASCII(.ascii	"num_long_term_ref_pic_sps\000" )
	.space	2
.LC348:
	ASCII(.ascii	"num_long_term_ref_pic_sps out of range[0,32].\012\000" )
	.space	1
.LC349:
	ASCII(.ascii	"SPS HEVC_DecVuiParam error.\012\000" )
	.space	3
.LC350:
	ASCII(.ascii	"chroma_format_idc\000" )
	.space	2
.LC351:
	ASCII(.ascii	"sps_video_parameter_set_id out of range(0,%d).\012\000" )
.LC352:
	ASCII(.ascii	"sps_max_sub_layers_minus1 out of range(0,%d).\012\000" )
	.space	1
.LC353:
	ASCII(.ascii	"SPS HEVC_DecPTL error.\012\000" )
.LC354:
	ASCII(.ascii	"sps_seq_parameter_set_id\000" )
	.space	3
.LC355:
	ASCII(.ascii	"sps_seq_parameter_set_id out of range(0,%d).\012\000" )
	.space	2
.LC356:
	ASCII(.ascii	"SPS[%d] decode error0.\012\000" )
.LC357:
	ASCII(.ascii	"SPS[%d] decode error.\012\000" )
	.space	1
.LC358:
	ASCII(.ascii	"pps_seq_parameter_set_id\000" )
	.space	3
.LC359:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range[0,15].\012\000" )
	.space	2
.LC360:
	ASCII(.ascii	"SPS(%d) haven't decode.\012\000" )
	.space	3
.LC361:
	ASCII(.ascii	"num_ref_idx_l0_default_active_minus1\000" )
	.space	3
.LC362:
	ASCII(.ascii	"num_ref_idx_l0_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC363:
	ASCII(.ascii	"num_ref_idx_l1_default_active_minus1\000" )
	.space	3
.LC364:
	ASCII(.ascii	"num_ref_idx_l1_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC365:
	ASCII(.ascii	"init_qp_minus26\000" )
.LC366:
	ASCII(.ascii	"init_qp_minus26(%d) out of range[-%d,51].\012\000" )
	.space	1
.LC367:
	ASCII(.ascii	"diff_cu_qp_delta_depth\000" )
	.space	1
.LC368:
	ASCII(.ascii	"diff_cu_qp_delta_depth out of range[0,3].\012\000" )
	.space	1
.LC369:
	ASCII(.ascii	"pps_cb_qp_offset\000" )
	.space	3
.LC370:
	ASCII(.ascii	"pic_cb_qp_offset out of range[-12,12].\012\000" )
.LC371:
	ASCII(.ascii	"pps_cr_qp_offset\000" )
	.space	3
.LC372:
	ASCII(.ascii	"pic_cr_qp_offset out of range[-12,12].\012\000" )
.LC373:
	ASCII(.ascii	"num_tile_columns_minus1\000" )
.LC374:
	ASCII(.ascii	"num_tile_columns_minus1(%d) out of range(0, %d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC375:
	ASCII(.ascii	"num_tile_rows_minus1\000" )
	.space	3
.LC376:
	ASCII(.ascii	"num_tile_rows_minus1 out(%d) of range(0, %d).\012\000" )
	.space	1
.LC377:
	ASCII(.ascii	"Logic limit(%d), num_tile_columns(%d) exceed.\012\000" )
	.space	1
.LC378:
	ASCII(.ascii	"Logic limit(%d), num_tile_rows(%d) exceed.\012\000" )
.LC379:
	ASCII(.ascii	"column_width_minus1\000" )
.LC380:
	ASCII(.ascii	"%s, %d: unsigned interger overflow\012\000" )
.LC381:
	ASCII(.ascii	"column_width[%d](%d) out of range (0 %d)\012\000" )
	.space	2
.LC382:
	ASCII(.ascii	"row_height_minus1\000" )
	.space	2
.LC383:
	ASCII(.ascii	"row_height[%d](%d) out of range (0 %d)\012\000" )
.LC384:
	ASCII(.ascii	"column_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	2
.LC385:
	ASCII(.ascii	"row_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	1
.LC386:
	ASCII(.ascii	"PPS tile width(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC387:
	ASCII(.ascii	"PPS tile height(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
.LC388:
	ASCII(.ascii	"pps_beta_offset_div2\000" )
	.space	3
.LC389:
	ASCII(.ascii	"pps_beta_offset_div2(%d) out of range(-6,6).\012\000" )
	.space	2
.LC390:
	ASCII(.ascii	"pps_tc_offset_div2\000" )
	.space	1
.LC391:
	ASCII(.ascii	"pps_tc_offset_div2(%d) out of range(-6,6).\012\000" )
.LC392:
	ASCII(.ascii	"PPS HEVC_DecScalingListData error.\012\000" )
.LC393:
	ASCII(.ascii	"log2_parallel_merge_level_minus2\000" )
	.space	3
.LC394:
	ASCII(.ascii	"log2_parallel_merge_level(%d) out of range(2,log2_c" )
	ASCII(.ascii	"tb_sizeY).\012\000" )
	.space	1
.LC395:
	ASCII(.ascii	"log2_max_transform_skip_block_size_minus2\000" )
	.space	2
.LC396:
	ASCII(.ascii	"log2_sao_offset_scale_luma\000" )
	.space	1
.LC397:
	ASCII(.ascii	"log2_sao_offset_scale_chroma\000" )
	.space	3
.LC398:
	ASCII(.ascii	"diff_cu_chroma_qp_offset_depth\000" )
	.space	1
.LC399:
	ASCII(.ascii	"chroma_qp_offset_list_len_minus1\000" )
	.space	3
.LC400:
	ASCII(.ascii	"chroma_qp_offset_list_len_minus1 %d > 5\012\000" )
	.space	3
.LC401:
	ASCII(.ascii	"cb_qp_offset_list\000" )
	.space	2
.LC402:
	ASCII(.ascii	"cr_qp_offset_list\000" )
	.space	2
.LC403:
	ASCII(.ascii	"pps_scaling_list_ref_layer_id %d > HEVC_MAX_NUM_LAY" )
	ASCII(.ascii	"ERS %d\012\000" )
	.space	1
.LC404:
	ASCII(.ascii	"num_ref_loc_offsets\000" )
.LC405:
	ASCII(.ascii	"num_ref_loc_offsets %d > HEVC_EXT_MAX_REF_LOC_OFFSE" )
	ASCII(.ascii	"T %d\012\000" )
	.space	3
.LC406:
	ASCII(.ascii	"ref_loc_offset_layer_id %d > HEVC_EXT_MAX_REF_LOC_O" )
	ASCII(.ascii	"FFSET %d\012\000" )
	.space	3
.LC407:
	ASCII(.ascii	"scaled_ref_layer_left_offset\000" )
	.space	3
.LC408:
	ASCII(.ascii	"scaled_ref_layer_top_offset\000" )
.LC409:
	ASCII(.ascii	"scaled_ref_layer_right_offset\000" )
	.space	2
.LC410:
	ASCII(.ascii	"scaled_ref_layer_bottom_offset\000" )
	.space	1
.LC411:
	ASCII(.ascii	"ref_region_left_offset\000" )
	.space	1
.LC412:
	ASCII(.ascii	"ref_region_top_offset\000" )
	.space	2
.LC413:
	ASCII(.ascii	"ref_region_right_offset\000" )
.LC414:
	ASCII(.ascii	"ref_region_bottom_offset\000" )
	.space	3
.LC415:
	ASCII(.ascii	"phase_hor_luma\000" )
	.space	1
.LC416:
	ASCII(.ascii	"phase_ver_luma\000" )
	.space	1
.LC417:
	ASCII(.ascii	"phase_hor_chroma_plus8\000" )
	.space	1
.LC418:
	ASCII(.ascii	"phase_ver_chroma_plus8\000" )
	.space	1
.LC419:
	ASCII(.ascii	"HEVC_ParsePPSExtension failed.\012\000" )
.LC420:
	ASCII(.ascii	"pps_pic_parameter_set_id\000" )
	.space	3
.LC421:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range(0,%d).\012\000" )
	.space	2
.LC422:
	ASCII(.ascii	"PPS[%d] decode error.\012\000" )
	.space	1
.LC423:
	ASCII(.ascii	"luma_log2_weight_denom\000" )
	.space	1
.LC424:
	ASCII(.ascii	"luma_log2_weight_denom out of range(0,7).\012\000" )
	.space	1
.LC425:
	ASCII(.ascii	"delta_chroma_log2_weight_denom\000" )
	.space	1
.LC426:
	ASCII(.ascii	"delta_chroma_log2_weight_denom out of range(-7,7).\012" )
	ASCII(.ascii	"\000" )
.LC427:
	ASCII(.ascii	"chroma_log2_weight_denom out of range(0,7).\012\000" )
	.space	3
.LC428:
	ASCII(.ascii	"delta_luma_weight_l0\000" )
	.space	3
.LC429:
	ASCII(.ascii	"delta_luma_weight_l0(%d) out of range(-128,127).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC430:
	ASCII(.ascii	"luma_offset_l0\000" )
	.space	1
.LC431:
	ASCII(.ascii	"luma_offset_l0(%d) out of range(-128,127).\012\000" )
.LC432:
	ASCII(.ascii	"delta_chroma_weight_l0\000" )
	.space	1
.LC433:
	ASCII(.ascii	"delta_chroma_weight_l0 out of range(-128,127).\012\000" )
.LC434:
	ASCII(.ascii	"delta_chroma_offset_l0\000" )
	.space	1
.LC435:
	ASCII(.ascii	"delta_chroma_offset_l0 out of range(-512,511).\012\000" )
.LC436:
	ASCII(.ascii	"delta_luma_weight_l1\000" )
	.space	3
.LC437:
	ASCII(.ascii	"delta_luma_weight_l1 out of range(-128,127).\012\000" )
	.space	2
.LC438:
	ASCII(.ascii	"luma_offset_l1\000" )
	.space	1
.LC439:
	ASCII(.ascii	"luma_offset_l1 out of range(-128,127).\012\000" )
.LC440:
	ASCII(.ascii	"delta_chroma_weight_l1\000" )
	.space	1
.LC441:
	ASCII(.ascii	"delta_chroma_weight_l1 out of range(-128,127).\012\000" )
.LC442:
	ASCII(.ascii	"delta_chroma_offset_l1\000" )
	.space	1
.LC443:
	ASCII(.ascii	"delta_chroma_offset_l1 out of range(-512,511).\012\000" )
.LC444:
	ASCII(.ascii	"slice_pic_parameter_set_id\000" )
	.space	1
.LC445:
	ASCII(.ascii	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC446:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\012\000" )
.LC447:
	ASCII(.ascii	"max_cu_width(%d)/max_cu_height(%d) = 0\012\000" )
.LC448:
	ASCII(.ascii	"slice_segment_address(%d) out of range(0, %d).\012\000" )
.LC449:
	ASCII(.ascii	"slice_type\000" )
	.space	1
.LC450:
	ASCII(.ascii	"slice_type(%d) out of range(0,2].\012\000" )
	.space	1
.LC451:
	ASCII(.ascii	"HEVC_ClearDPB,LastDisplayPoc:%d poc:%d \012\000" )
	.space	3
.LC452:
	ASCII(.ascii	"SH HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	2
.LC453:
	ASCII(.ascii	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
.LC454:
	ASCII(.ascii	"num_long_term_sps\000" )
	.space	2
.LC455:
	ASCII(.ascii	"num_long_term_sps(%d) out of range[0,%d].\012\000" )
	.space	1
.LC456:
	ASCII(.ascii	"num_long_term_pics\000" )
	.space	1
.LC457:
	ASCII(.ascii	"SH ERROR: (num_negative_pics(%d) + num_positive_pic" )
	ASCII(.ascii	"s(%d) + num_of_longterm_pics(%d)) > %d\012\000" )
	.space	1
.LC458:
	ASCII(.ascii	"lt_idx_sps[%d] = %d, but out of range[0,%d].\012\000" )
	.space	2
.LC459:
	ASCII(.ascii	"delta_poc_msb_cycle_lt\000" )
	.space	1
.LC460:
	ASCII(.ascii	"ERROR: pRPS->num_of_pics(%d) > %d.\012\000" )
.LC461:
	ASCII(.ascii	"Error0: Parse num_active_ref_layer_pics %d > HEVC_M" )
	ASCII(.ascii	"AX_NUM_LAYERS %d, not support\012\000" )
	.space	2
.LC462:
	ASCII(.ascii	"Error1: Parse num_active_ref_layer_pics %d > HEVC_M" )
	ASCII(.ascii	"AX_NUM_LAYERS %d, not support\012\000" )
	.space	2
.LC463:
	ASCII(.ascii	"Parse inter_layer_pred_layer_idc[%d] %d > HEVC_MAX_" )
	ASCII(.ascii	"NUM_LAYERS %d, not support\000" )
	.space	2
.LC464:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC465:
	ASCII(.ascii	"num_ref_idx_l0_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC466:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC467:
	ASCII(.ascii	"num_ref_idx_l1_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC468:
	ASCII(.ascii	"pRPS is null.\012\000" )
	.space	1
.LC469:
	ASCII(.ascii	"pRPS->num_of_pics out(%d) of range(0,%d).\012\000" )
	.space	1
.LC470:
	ASCII(.ascii	"SH HEVC_DecRefPicListsModification error.\012\000" )
	.space	1
.LC471:
	ASCII(.ascii	"collocated_ref_idx\000" )
	.space	1
.LC472:
	ASCII(.ascii	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) " )
	ASCII(.ascii	"out of range(0,%d).\012\000" )
.LC473:
	ASCII(.ascii	"SH HEVC_DecPredWeightTable error.\012\000" )
	.space	1
.LC474:
	ASCII(.ascii	"five_minus_max_num_merge_cand\000" )
	.space	2
.LC475:
	ASCII(.ascii	"SH max_num_merge_cand(%d) out of range(1,5).\012\000" )
	.space	2
.LC476:
	ASCII(.ascii	"slice_qp_delta\000" )
	.space	1
.LC477:
	ASCII(.ascii	"SH slice_qp(%d) out of range [-%d,51].\012\000" )
.LC478:
	ASCII(.ascii	"slice_cb_qp_offset\000" )
	.space	1
.LC479:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC480:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out " )
	ASCII(.ascii	"of range[-12,12].\012\000" )
	.space	2
.LC481:
	ASCII(.ascii	"slice_cr_qp_offset\000" )
	.space	1
.LC482:
	ASCII(.ascii	"SH slice_cr_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC483:
	ASCII(.ascii	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) ou" )
	ASCII(.ascii	"t of range[-12,12].\012\000" )
.LC484:
	ASCII(.ascii	"slice_beta_offset_div2\000" )
	.space	1
.LC485:
	ASCII(.ascii	"SH slice_beta_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC486:
	ASCII(.ascii	"slice_tc_offset_div2\000" )
	.space	3
.LC487:
	ASCII(.ascii	"SH slice_tc_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC488:
	ASCII(.ascii	"num_entry_point_offsets\000" )
.LC489:
	ASCII(.ascii	"CurrSlice.num_entry_point_offsets(%d) out of range[" )
	ASCII(.ascii	"0,%d].\012\000" )
	.space	1
.LC490:
	ASCII(.ascii	"offset_len_minus1\000" )
	.space	2
.LC491:
	ASCII(.ascii	"CurrSlice.offset_len(%d) out of range[1,32].\012\000" )
	.space	2
.LC492:
	ASCII(.ascii	"slice_segment_header_extension_length\000" )
	.space	2
.LC493:
	ASCII(.ascii	"slice_segment_header_extension_length(%d) out of ra" )
	ASCII(.ascii	"nge [0,256]\012\000" )
.LC494:
	ASCII(.ascii	"bitsLeft(%d) < slice_segment_header_extension_lengt" )
	ASCII(.ascii	"h(%d)\012\000" )
	.space	2
.LC495:
	ASCII(.ascii	"HEVC_ParseSliceExtension failed\012\000" )
	.space	3
.LC496:
	ASCII(.ascii	"%s layer num %d invalid!\012\000" )
	.space	2
.LC497:
	ASCII(.ascii	"%s layer %d image size abnormal(%dx%d)\012\000" )
.LC498:
	ASCII(.ascii	"%s arrange mem failed.\012\000" )
.LC499:
	ASCII(.ascii	"Init dec para\012\000" )
	.space	1
.LC500:
	ASCII(.ascii	"Is SHVC: layer%d %dx%d, layer%d %dx%d.\012\000" )
.LC501:
	ASCII(.ascii	"Layer %d: %d x %d\012\000" )
	.space	1
.LC502:
	ASCII(.ascii	"HEVC_InitDPB error, return %d\012\000" )
	.space	1
.LC503:
	ASCII(.ascii	"HEVC_AllocFrameStore error\012\000" )
.LC504:
	ASCII(.ascii	"%s: HEVC_OutputFrame failed!\012\000" )
	.space	2
.LC505:
	ASCII(.ascii	"%s output current picture failed\012\000" )
	.space	2
.LC506:
	ASCII(.ascii	"HEVC.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC507:
	ASCII(.ascii	"%s: BlockFsPoc:%d, LastPoc:%d!\012\000" )
.LC508:
	ASCII(.ascii	"%s: FirstFrameFastOut LastPoc: %d, CurPos: %d!\012\000" )
.LC509:
	ASCII(.ascii	"%s: poc:%d, CurPos: %d !\012\000" )
	.space	2
.LC510:
	ASCII(.ascii	"%s call HEVC_GetUnRefPicWithMinPoc failed\012\000" )
	.space	1
.LC511:
	ASCII(.ascii	"%s call HEVC_OutputOneFrmFromDPB failed\012\000" )
	.space	3
.LC512:
	ASCII(.ascii	"%s: HEVC_OutputFrmToVO err!\012\000" )
	.space	3
.LC513:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC514:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC515:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC516:
	ASCII(.ascii	"%s: flush dpb failed, return %d\012\000" )
	.space	3
.LC517:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), need to incr" )
	ASCII(.ascii	"ease DPB size.\012\000" )
	.space	1
.LC518:
	ASCII(.ascii	"%s call HEVC_IncreaseDPBSize failed\012\000" )
	.space	3
.LC519:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpo" )
	ASCII(.ascii	"c frame.\012\000" )
	.space	3
.LC520:
	ASCII(.ascii	"%s with invalid pos(%d)\012\000" )
	.space	3
.LC521:
	ASCII(.ascii	"%s get APC error, ret %d\012\000" )
	.space	2
.LC522:
	ASCII(.ascii	"%s %d: InsertFrmInDPB failed, return %d\012\000" )
	.space	3
.LC523:
	ASCII(.ascii	"%s call HEVC_CheckFrameStore failed!\012\000" )
	.space	2
.LC524:
	ASCII(.ascii	"%s call HEVC_RemoveUnUsedFrameStore Failed.\012\000" )
	.space	3
.LC525:
	ASCII(.ascii	"%s call HEVC_InsertFrmInDPB Failed.\012\000" )
	.space	3
.LC526:
	ASCII(.ascii	"%s call HEVC_FirstFrameFastOut Failed\012\000" )
	.space	1
.LC527:
	ASCII(.ascii	"DPB.used_size may bigger than DPB.size\012\000" )
.LC528:
	ASCII(.ascii	"HEVC_InsertFrmInDPB Failed, ret = %d\012\000" )
	.space	2
.LC529:
	ASCII(.ascii	"%s call HEVC_OutputFrmFromDPB failed\012\000" )
	.space	2
.LC530:
	ASCII(.ascii	"pHevcCtx->CurrPic.frame_store is null pointer\012\000" )
	.space	1
.LC531:
	ASCII(.ascii	"HEVC_StorePicInDpb return(%d) from L%d\012\000" )
.LC532:
	ASCII(.ascii	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_" )
	ASCII(.ascii	"NORMAL\012\000" )
	.space	1
.LC533:
	ASCII(.ascii	"%s, REPORT_IFRAME_ERR\012\000" )
	.space	1
.LC534:
	ASCII(.ascii	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\012\000" )
	.space	1
.LC535:
	ASCII(.ascii	"%s call HEVC_IModeProcess Failed\012\000" )
	.space	2
.LC536:
	ASCII(.ascii	"%s call HEVC_SimpleDPBProcess Failed\012\000" )
	.space	2
.LC537:
	ASCII(.ascii	"%s call HEVC_DecOrderProcess Failed\012\000" )
	.space	3
.LC538:
	ASCII(.ascii	"%s call HEVC_DispOrderProcess Failed\012\000" )
	.space	2
.LC539:
	ASCII(.ascii	"%s return HEVC_DEC_ERR\012\000" )
.LC540:
	ASCII(.ascii	"No frame store for lost pic.\012\000" )
	.space	2
.LC541:
	ASCII(.ascii	"DPB ERROR: Can not get ref_fs!\012\000" )
.LC542:
	ASCII(.ascii	"DPB no suited fs for lost pic.\012\000" )
.LC543:
	ASCII(.ascii	"Take poc(%d) to creat lost poc(%d).\012\000" )
	.space	3
.LC544:
	ASCII(.ascii	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\012\000" )
	.space	1
.LC545:
	ASCII(.ascii	"ERROR: Can not new logic fs!\012\000" )
	.space	2
.LC546:
	ASCII(.ascii	"Lost pic insert in DPB Failed!\012\000" )
.LC547:
	ASCII(.ascii	"Ref frame(poc %d) lost.\012\000" )
	.space	3
.LC548:
	ASCII(.ascii	"s32OutErrThr = %d,drop poc %d because lost ref fram" )
	ASCII(.ascii	"e(pod %d)\012\000" )
	.space	2
.LC549:
	ASCII(.ascii	"DecVDM MaxBytesReceived exceed threshold!\012\000" )
	.space	1
.LC550:
	ASCII(.ascii	"DecVDM no slice and needn't start VDM\012\000" )
	.space	1
.LC551:
	ASCII(.ascii	"IPBDecMode Changed (%d -> %d)\012\000" )
	.space	1
.LC552:
	ASCII(.ascii	"Discard this B(poc=%d) before P, is_ref_idc=%d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC553:
	ASCII(.ascii	"VDM start, TotalPicNum=%d.\012\000" )
.LC554:
	ASCII(.ascii	"%s no correct slice in the pic\012\000" )
.LC555:
	ASCII(.ascii	"metadatasize is too large:%d at line:%d\012\000" )
	.space	3
.LC556:
	ASCII(.ascii	"%s:%d Metadata map failed\012\000" )
	.space	1
.LC557:
	ASCII(.ascii	"%s:%d Metadata unmap failed\012\000" )
	.space	3
.LC558:
	ASCII(.ascii	"*****[%s][%d],BL Codec can only dec BL stream!!****" )
	ASCII(.ascii	"*\012\000" )
	.space	2
.LC559:
	ASCII(.ascii	"*****[%s][%d],EL Codec can only dec EL stream in DV" )
	ASCII(.ascii	"_DUAL_VES_IMP stream!!*****\012\000" )
.LC560:
	ASCII(.ascii	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC561:
	ASCII(.ascii	"%s call HEVC_FlushOutputFrmFromDPB failed\012\000" )
	.space	1
.LC562:
	ASCII(.ascii	"%s call HEVC_EmptyFrmFromDPB failed\012\000" )
	.space	3
.LC563:
	ASCII(.ascii	"Meet CRA frame, force output remain frame, CurPoc %" )
	ASCII(.ascii	"d, LastPoc %d\012\000" )
	.space	2
.LC564:
	ASCII(.ascii	"Init pic err, exit\012\000" )
.LC565:
	ASCII(.ascii	"HEVC_WritePicMsg failed!\012\000" )
	.space	2
.LC566:
	ASCII(.ascii	"Start Reason: SliceParaNum= %d\012\000" )
.LC567:
	ASCII(.ascii	"Too many slice , err!\012\000" )
	.space	1
.LC568:
	ASCII(.ascii	"Cur pic not init yet, discard this slice!\012\000" )
	.space	1
.LC569:
	ASCII(.ascii	"Dec List error, ret=%d\012\000" )
.LC570:
	ASCII(.ascii	"Ref List is Wrong!\012\000" )
.LC571:
	ASCII(.ascii	"HEVC_WriteSliceMsg err.\012\000" )
	.space	3
.LC572:
	ASCII(.ascii	"VPS decode error.\012\000" )
	.space	1
.LC573:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC574:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC575:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC576:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d\012\000" )
.LC577:
	ASCII(.ascii	"HEVC_DecSliceSegmentHeader dec err\012\000" )
.LC578:
	ASCII(.ascii	"CurBitsLen = %d, MinBitsLen = %d\012\000" )
	.space	2
.LC579:
	ASCII(.ascii	"%s last frame fs unrelease, fix it!\012\000" )
	.space	3
.LC580:
	ASCII(.ascii	"CtbNumOneFrame=%d, SedEnd0=%d\012\000" )
	.space	1
.LC581:
	ASCII(.ascii	"OSAL_FP_alloc_virmem g_pGlbVar fail %d\012\000" )
.LC582:
	ASCII(.ascii	"%s: Get context addr failed!\012\000" )
	.space	2
.LC583:
	ASCII(.ascii	"%s FATAL: MemOffset %d > ContextMemSize %d.\012\000" )
	.space	3
.LC584:
	ASCII(.ascii	"%s: VCTRL_GetChanIDByCtx() return -1!\012\000" )
	.space	1
.LC585:
	ASCII(.ascii	"Fs leak, clear dpb fs not in vo queue.\012\000" )
.LC586:
	ASCII(.ascii	"No frame store available!\012\000" )
	.space	1
.LC587:
	ASCII(.ascii	"%s ReadImgNum = %d, NewImgNum = %d, FrameStore leak" )
	ASCII(.ascii	", ClearAll!\012\000" )
.LC588:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pPacket!\012\000" )
	.space	1
.LC589:
	ASCII(.ascii	"HevcCtx not init!\012\000" )
	.space	1
.LC590:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC591:
	ASCII(.ascii	"nal_layer_id out %d of range[0,1].\012\000" )
.LC592:
	ASCII(.ascii	"Not need nal of layer %d in output order %d.\012\000" )
	.space	2
.LC593:
	ASCII(.ascii	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\012" )
	ASCII(.ascii	"\000" )
.LC594:
	ASCII(.ascii	"HEVC_InquireSliceProperty error.\012\000" )
	.space	2
.LC595:
	ASCII(.ascii	"HEVC_DecOneNal ERR\012\000" )
.LC596:
	ASCII(.ascii	"HEVC_StorePicInDPB failed, ret = %d\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	g_pGlbVar, %object
	.size	g_pGlbVar, 4
g_pGlbVar:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
