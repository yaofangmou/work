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
	.file	"h264.c"
	.text
	.align	2
	.global	IsSTRefFlg
	.type	IsSTRefFlg, %function
IsSTRefFlg:
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
	ldr	r0, [r0]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsSTRefFlg, .-IsSTRefFlg
	.align	2
	.global	IsLTRefFlg
	.type	IsLTRefFlg, %function
IsLTRefFlg:
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
	ldr	r0, [r0]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsLTRefFlg, .-IsLTRefFlg
	.align	2
	.global	compare_pic_by_pic_num_desc
	.type	compare_pic_by_pic_num_desc, %function
compare_pic_by_pic_num_desc:
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
	blt	.L5
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L5:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_pic_num_desc, .-compare_pic_by_pic_num_desc
	.align	2
	.global	compare_pic_by_lt_pic_num_asc
	.type	compare_pic_by_lt_pic_num_asc, %function
compare_pic_by_lt_pic_num_asc:
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
	ldr	r2, [r2, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	blt	.L9
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L9:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_lt_pic_num_asc, .-compare_pic_by_lt_pic_num_asc
	.align	2
	.global	compare_fs_by_frame_num_desc
	.type	compare_fs_by_frame_num_desc, %function
compare_fs_by_frame_num_desc:
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
	ldr	r2, [r2, #552]
	ldr	r3, [r3, #552]
	cmp	r2, r3
	blt	.L12
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L12:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_frame_num_desc, .-compare_fs_by_frame_num_desc
	.align	2
	.global	compare_fs_by_lt_pic_idx_asc
	.type	compare_fs_by_lt_pic_idx_asc, %function
compare_fs_by_lt_pic_idx_asc:
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
	ldr	r2, [r2, #556]
	ldr	r3, [r3, #556]
	cmp	r2, r3
	bcc	.L15
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L15:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_lt_pic_idx_asc, .-compare_fs_by_lt_pic_idx_asc
	.align	2
	.global	compare_pic_by_poc_asc
	.type	compare_pic_by_poc_asc, %function
compare_pic_by_poc_asc:
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
	ldr	r2, [r2, #12]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	blt	.L18
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L18:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.align	2
	.global	compare_pic_by_poc_desc
	.type	compare_pic_by_poc_desc, %function
compare_pic_by_poc_desc:
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
	ldr	r2, [r2, #12]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	blt	.L21
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L21:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_poc_desc, .-compare_pic_by_poc_desc
	.align	2
	.global	compare_fs_by_poc_asc
	.type	compare_fs_by_poc_asc, %function
compare_fs_by_poc_asc:
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
	ldr	r2, [r2, #560]
	ldr	r3, [r3, #560]
	cmp	r2, r3
	blt	.L24
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L24:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_poc_asc, .-compare_fs_by_poc_asc
	.align	2
	.global	compare_fs_by_poc_desc
	.type	compare_fs_by_poc_desc, %function
compare_fs_by_poc_desc:
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
	ldr	r2, [r2, #560]
	ldr	r3, [r3, #560]
	cmp	r2, r3
	blt	.L27
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L27:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_poc_desc, .-compare_fs_by_poc_desc
	.align	2
	.type	SetFrmRepeatCount.part.2, %function
SetFrmRepeatCount.part.2:
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
	add	ip, r0, #57344
	add	r0, r0, #24576
	ldr	lr, [ip, #1888]
	ldr	r2, [r0, #2136]
	ldr	r3, [ip, #1884]
	add	r2, r2, lr, lsr #1
	add	r0, r2, #1
	mov	r3, r3, lsr #1
	cmp	r3, r0
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
	ldrhi	r3, [ip, #1888]
	ldrls	r3, [ip, #1888]
	addhi	r3, r3, #4
	addls	r3, r3, #2
	str	r3, [ip, #1888]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetFrmRepeatCount.part.2, .-SetFrmRepeatCount.part.2
	.align	2
	.type	DumpList.part.6, %function
DumpList.part.6:
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
	add	r9, r0, #26880
	add	r9, r9, #240
	add	r7, r0, #20480
	add	r7, r7, #244
	mov	r8, r0
	mov	r6, #0
	mov	r10, r9
.L33:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	movne	r5, r10
	movne	r4, #0
	beq	.L36
.L34:
	ldr	ip, [r5, #4]!
	mov	r3, r6
	ldr	r2, .L64
	movw	r1, #4185
	mov	r0, #11
	ldr	ip, [ip, #36]
	ldr	lr, [ip, #560]
	str	lr, [sp, #8]
	ldr	ip, [ip, #548]
	str	r4, [sp]
	add	r4, r4, #1
	str	ip, [sp, #4]
	bl	dprint_normal
	ldr	r3, [r7]
	cmp	r4, r3
	bcc	.L34
.L36:
	add	r6, r6, #1
	add	r10, r10, #132
	cmp	r6, #2
	bne	.L33
	add	r5, r8, #20480
	ldr	r3, [r5, #248]
	cmp	r3, #0
	bne	.L60
.L37:
	ldr	r3, [r5, #252]
	cmp	r3, #0
	bne	.L61
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L61:
	ldr	r2, .L64+4
	movw	r1, #4219
	mov	r0, #11
	bl	dprint_normal
	ldr	r3, [r5, #252]
	cmp	r3, #0
	addne	r8, r8, #27136
	movne	r4, #0
	addne	r8, r8, #116
	bne	.L50
	b	.L51
.L62:
	bcc	.L48
	cmp	ip, #2
	ldr	r2, .L64+8
	movw	r1, #4234
	mov	r0, #11
	bne	.L46
	ldr	r3, [r3, #36]
	ldr	r3, [r3, #560]
	bl	dprint_normal
.L46:
	ldr	r3, [r5, #252]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L51
.L50:
	ldr	r3, [r8, #4]!
	ldrb	ip, [r3]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L62
	ldr	r3, [r3, #36]
	movw	r1, #4230
	ldr	r2, .L64+12
	mov	r0, #11
	add	r4, r4, #1
	ldr	r3, [r3, #560]
	bl	dprint_normal
	ldr	r3, [r5, #252]
	cmp	r4, r3
	bcc	.L50
.L51:
	ldr	r2, .L64+16
	movw	r1, #4242
	mov	r0, #11
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L48:
	ldr	r3, [r3, #36]
	movw	r1, #4226
	ldr	r2, .L64+20
	mov	r0, #11
	ldr	r3, [r3, #560]
	bl	dprint_normal
	b	.L46
.L60:
	ldr	r2, .L64+24
	movw	r1, #4191
	mov	r0, #11
	bl	dprint_normal
	ldr	r3, [r5, #248]
	cmp	r3, #0
	movne	r4, #0
	bne	.L38
	b	.L43
.L63:
	bcc	.L41
	cmp	ip, #2
	ldr	r2, .L64+8
	movw	r1, #4206
	mov	r0, #11
	bne	.L39
	ldr	r3, [r3, #36]
	ldr	r3, [r3, #684]
	bl	dprint_normal
.L39:
	ldr	r3, [r5, #248]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L43
.L38:
	ldr	r3, [r9, #4]!
	ldrb	ip, [r3]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L63
	ldr	r3, [r3, #36]
	movw	r1, #4202
	ldr	r2, .L64+12
	mov	r0, #11
	add	r4, r4, #1
	ldr	r3, [r3, #644]
	bl	dprint_normal
	ldr	r3, [r5, #248]
	cmp	r4, r3
	bcc	.L38
.L43:
	ldr	r2, .L64+16
	movw	r1, #4214
	mov	r0, #11
	bl	dprint_normal
	b	.L37
.L41:
	ldr	r3, [r3, #36]
	movw	r1, #4198
	ldr	r2, .L64+20
	mov	r0, #11
	ldr	r3, [r3, #560]
	bl	dprint_normal
	b	.L39
.L65:
	.align	2
.L64:
	.word	.LC0
	.word	.LC6
	.word	.LC5
	.word	.LC4
	.word	.LC2
	.word	.LC3
	.word	.LC1
	UNWIND(.fnend)
	.size	DumpList.part.6, .-DumpList.part.6
	.align	2
	.type	CombinePacket.part.12, %function
CombinePacket.part.12:
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
	ldr	r2, .L67
	mov	r4, r0
	movw	r1, #10375
	mov	r0, #8
	mov	r5, #0
	bl	dprint_normal
	ldr	ip, [r4, #368]
	ldr	r2, .L67+4
	movw	r1, #10379
	mov	r0, #8
	ldr	lr, [ip, #72]
	ldr	r3, [ip, #48]
	str	lr, [sp, #8]
	ldr	lr, [ip, #44]
	str	lr, [sp, #4]
	ldr	ip, [ip, #76]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r4, #368]
	ldr	ip, .L67+8
	ldr	r2, [r3, #44]
	ldr	r0, [r3, #68]
	ldr	r1, [r3, #40]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #368]
	mov	lr, #1
	ldr	r2, .L67+12
	movw	r1, #10390
	ldr	r0, [r3, #92]
	ldr	r6, [r3, #64]
	str	r0, [r3, #64]
	mov	r0, #8
	ldr	r3, [r4, #368]
	str	r5, [r3, #56]
	ldr	r3, [r4, #368]
	ldr	r7, [r3, #44]
	ldr	ip, [r3, #68]
	rsb	ip, r7, ip
	str	ip, [r3, #40]
	ldr	r3, [r4, #368]
	ldr	r7, [r3, #44]
	ldr	ip, [r3, #76]
	rsb	ip, r7, ip
	str	ip, [r3, #48]
	ldr	r3, [r4, #368]
	ldr	ip, [r3, #44]
	ldr	r7, [r3, #72]
	add	ip, ip, r7
	str	ip, [r3, #44]
	ldr	r3, [r4, #368]
	str	lr, [r3, #12]
	ldr	ip, [r4, #368]
	ldr	r3, [ip, #48]
	ldr	ip, [ip, #44]
	str	ip, [sp]
	bl	dprint_normal
	add	r3, r4, #57344
	mov	r1, r6
	ldr	r0, [r3, #1840]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	str	r5, [r3, #68]
	ldr	r3, [r4, #368]
	str	r5, [r3, #84]
	ldr	r3, [r4, #368]
	str	r5, [r3, #72]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	.LC7
	.word	.LC8
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	UNWIND(.fnend)
	.size	CombinePacket.part.12, .-CombinePacket.part.12
	.align	2
	.global	ue_v
	.type	ue_v, %function
ue_v:
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
	add	r7, r0, #13504
	add	r7, r7, #24
	mov	r8, r0
	mov	r6, r1
	mov	r1, #32
	mov	r0, r7
	bl	BsShow
	mov	r5, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r4, r0
	bls	.L73
	cmp	r0, #31
	bls	.L74
	add	r3, r8, #57344
	mvn	r5, #0
	mov	r7, #32
	mov	r2, #1
	str	r2, [r3, #1780]
.L71:
	ldr	ip, [r8, #368]
	mov	r3, r6
	ldr	r2, .L75
	movw	r1, #289
	mov	r0, #19
	ldr	r4, [ip, #8]
	add	r4, r4, r7
	str	r4, [ip, #8]
	str	r5, [sp]
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L73:
	mov	r4, r0, asl #1
	mov	r0, r7
	add	r7, r4, #1
	rsb	r4, r4, #31
	mov	r4, r5, lsr r4
	mov	r1, r7
	sub	r5, r4, #1
	bl	BsSkip
	b	.L71
.L74:
	add	r5, r0, #1
	mov	r1, r0
	mov	r0, r7
	bl	BsSkip
	mov	r1, r5
	mov	r0, r7
	bl	BsShow
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r7
	bl	BsSkip
	mov	r3, r4, asl #1
	add	r7, r3, #1
	b	.L71
.L76:
	.align	2
.L75:
	.word	.LC10
	UNWIND(.fnend)
	.size	ue_v, .-ue_v
	.align	2
	.global	se_v
	.type	se_v, %function
se_v:
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
	add	r6, r0, #13504
	add	r6, r6, #24
	mov	r8, r0
	mov	r7, r1
	mov	r1, #32
	mov	r0, r6
	bl	BsShow
	mov	r4, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r5, r0
	bhi	.L78
	mov	r5, r0, asl #1
	mov	r0, r6
	rsb	r3, r5, #31
	add	r5, r5, #1
	mov	r3, r4, lsr r3
	and	r2, r3, #1
	mov	r1, r5
	rsb	r4, r2, #0
	eor	r4, r4, r3, lsr #1
	add	r4, r4, r2
	bl	BsSkip
.L79:
	ldr	lr, [r8, #368]
	mov	r3, r7
	ldr	r2, .L82
	movw	r1, #329
	mov	r0, #19
	ldr	ip, [lr, #8]
	add	r5, ip, r5
	str	r5, [lr, #8]
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L78:
	cmp	r0, #31
	bls	.L81
	add	r3, r8, #57344
	mov	r2, #1
	mvn	r4, #-2147483648
	mov	r5, #32
	str	r2, [r3, #1780]
	b	.L79
.L81:
	mov	r1, r0
	mov	r0, r6
	bl	BsSkip
	mov	r1, r5
	mov	r0, r6
	mov	r5, r5, asl #1
	bl	BsGet
	mov	r1, #1
	add	r5, r5, #1
	mov	r9, r0
	mov	r0, r6
	bl	BsGet
	and	r0, r0, #1
	rsb	r4, r0, #0
	eor	r9, r9, r4
	add	r4, r9, r0
	b	.L79
.L83:
	.align	2
.L82:
	.word	.LC10
	UNWIND(.fnend)
	.size	se_v, .-se_v
	.align	2
	.global	u_v
	.type	u_v, %function
u_v:
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
	add	r0, r0, #13504
	mov	r7, r2
	add	r0, r0, #24
	mov	r6, r1
	bl	BsGet
	ldr	lr, [r5, #368]
	mov	r3, r7
	ldr	r2, .L85
	movw	r1, #341
	ldr	ip, [lr, #8]
	add	ip, ip, r6
	str	ip, [lr, #8]
	mov	r4, r0
	mov	r0, #19
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	.LC10
	UNWIND(.fnend)
	.size	u_v, .-u_v
	.align	2
	.global	u_1
	.type	u_1, %function
u_1:
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
	mov	r5, r0
	add	r0, r0, #13504
	mov	r6, r1
	add	r0, r0, #24
	mov	r1, #1
	bl	BsGet
	ldr	lr, [r5, #368]
	mov	r3, r6
	ldr	r2, .L88
	mov	r1, #352
	ldr	ip, [lr, #8]
	add	ip, ip, #1
	str	ip, [lr, #8]
	mov	r4, r0
	mov	r0, #19
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L89:
	.align	2
.L88:
	.word	.LC10
	UNWIND(.fnend)
	.size	u_1, .-u_1
	.align	2
	.global	H264_IsEosNal
	.type	H264_IsEosNal, %function
H264_IsEosNal:
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
	add	r4, r0, #13504
	mov	r1, #32
	add	r4, r4, #24
	mov	r0, r4
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r4
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
	.size	H264_IsEosNal, .-H264_IsEosNal
	.align	2
	.global	GetMinPOC
	.type	GetMinPOC, %function
GetMinPOC:
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
	add	r5, r0, #24576
	mov	ip, #0
	mvn	r3, #-2147483648
	str	ip, [r2]
	str	r3, [r1]
	ldr	r3, [r5, #2140]
	ldr	ip, [r5, #2136]
	cmp	r3, ip
	strhi	ip, [r5, #2140]
	movhi	r3, ip
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #148
.L95:
	ldr	ip, [r0, #4]!
	ldr	r4, [r1]
	ldr	lr, [ip, #560]
	cmp	r4, lr
	ble	.L94
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	strne	lr, [r1]
	strne	r3, [r2]
.L94:
	ldr	ip, [r5, #2140]
	add	r3, r3, #1
	cmp	ip, r3
	bhi	.L95
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMinPOC, .-GetMinPOC
	.align	2
	.global	GetMinPOCInDPB
	.type	GetMinPOCInDPB, %function
GetMinPOCInDPB:
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
	add	r4, r0, #24576
	mov	ip, #0
	mvn	r3, #-2147483648
	str	ip, [r2]
	str	r3, [r1]
	ldr	r3, [r4, #2140]
	ldr	ip, [r4, #2136]
	cmp	r3, ip
	strhi	ip, [r4, #2140]
	movhi	r3, ip
	cmp	r3, #0
	ldmeqfd	sp, {r4, fp, sp, pc}
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #148
.L105:
	ldr	ip, [r0, #4]!
	ldr	lr, [r1]
	ldr	ip, [ip, #560]
	cmp	lr, ip
	strgt	ip, [r1]
	strgt	r3, [r2]
	add	r3, r3, #1
	ldr	ip, [r4, #2140]
	cmp	ip, r3
	bhi	.L105
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMinPOCInDPB, .-GetMinPOCInDPB
	.align	2
	.global	GetMaxPOC
	.type	GetMaxPOC, %function
GetMaxPOC:
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
	add	r5, r0, #24576
	mov	r3, #0
	str	r3, [r2]
	str	r3, [r1]
	ldr	r3, [r5, #2140]
	ldr	ip, [r5, #2136]
	cmp	r3, ip
	strhi	ip, [r5, #2140]
	movhi	r3, ip
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #148
.L112:
	ldr	ip, [r0, #4]!
	ldr	r4, [r1]
	ldr	lr, [ip, #560]
	cmp	r4, lr
	bge	.L111
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	strne	lr, [r1]
	strne	r3, [r2]
.L111:
	ldr	ip, [r5, #2140]
	add	r3, r3, #1
	cmp	ip, r3
	bhi	.L112
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMaxPOC, .-GetMaxPOC
	.align	2
	.global	FrameStoreRefFlg
	.type	FrameStoreRefFlg, %function
FrameStoreRefFlg:
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
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FrameStoreRefFlg, .-FrameStoreRefFlg
	.align	2
	.global	ShortTermRefFlg
	.type	ShortTermRefFlg, %function
ShortTermRefFlg:
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
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L134
	tst	r3, #1
	bne	.L135
.L123:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L127
.L124:
	ldr	r0, [r0, #672]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L127:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L135:
	ldr	r2, [r0, #632]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L123
.L128:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L134:
	ldr	r3, [r0, #592]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L128
	ldr	r3, [r0, #632]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	bne	.L124
	b	.L128
	UNWIND(.fnend)
	.size	ShortTermRefFlg, .-ShortTermRefFlg
	.align	2
	.global	LongTermRefFlg
	.type	LongTermRefFlg, %function
LongTermRefFlg:
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
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L151
	tst	r3, #1
	bne	.L152
.L140:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L144
.L141:
	ldr	r0, [r0, #672]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L144:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L152:
	ldr	r2, [r0, #632]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L140
.L145:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L151:
	ldr	r3, [r0, #592]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L145
	ldr	r3, [r0, #632]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	bne	.L141
	b	.L145
	UNWIND(.fnend)
	.size	LongTermRefFlg, .-LongTermRefFlg
	.align	2
	.global	UpdateLTReflist
	.type	UpdateLTReflist, %function
UpdateLTReflist:
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
	add	r9, r0, #24576
	mov	r6, r0
	ldr	r8, [r9, #2140]
	cmp	r8, #0
	beq	.L160
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #148
	mov	r5, r4
.L156:
	ldr	r7, [r10, #4]!
	add	r5, r5, #1
	mov	r0, r7
	bl	LongTermRefFlg
	add	r3, r4, #6656
	add	r3, r3, #6
	cmp	r0, #0
	strne	r7, [r6, r3, asl #2]
	addne	r4, r4, #1
	cmp	r5, r8
	bne	.L156
.L154:
	ldr	r3, [r9, #2136]
	str	r4, [r9, #2148]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6656
	mov	r2, #0
	add	r0, r0, #5
	add	r0, r6, r0, lsl #2
.L158:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L158
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L160:
	mov	r4, r8
	b	.L154
	UNWIND(.fnend)
	.size	UpdateLTReflist, .-UpdateLTReflist
	.align	2
	.global	UpdateReflist
	.type	UpdateReflist, %function
UpdateReflist:
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
	add	r9, r0, #24576
	mov	r6, r0
	ldr	r8, [r9, #2140]
	cmp	r8, #0
	beq	.L173
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #148
	mov	r5, r4
.L169:
	ldr	r7, [r10, #4]!
	add	r5, r5, #1
	mov	r0, r7
	bl	ShortTermRefFlg
	add	r3, r4, #6592
	add	r3, r3, #54
	cmp	r0, #0
	strne	r7, [r6, r3, asl #2]
	addne	r4, r4, #1
	cmp	r5, r8
	bne	.L169
.L167:
	ldr	r3, [r9, #2136]
	str	r4, [r9, #2144]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6592
	mov	r2, #0
	add	r0, r0, #53
	add	r0, r6, r0, lsl #2
.L171:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L171
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L173:
	mov	r4, r8
	b	.L167
	UNWIND(.fnend)
	.size	UpdateReflist, .-UpdateReflist
	.align	2
	.global	GetPicNumX
	.type	GetPicNumX, %function
GetPicNumX:
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
	ldrb	r3, [r0, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r0, #560]
	mvn	r0, r1
	movne	r3, r3, asl #1
	addne	r3, r3, #1
	add	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetPicNumX, .-GetPicNumX
	.align	2
	.global	UnMarkFrameStoreRef
	.type	UnMarkFrameStoreRef, %function
UnMarkFrameStoreRef:
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
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L183
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #633]
	and	r2, r2, #2
	strb	ip, [r1, #634]
	strb	r2, [r1, #2]
.L183:
	tst	r3, #2
	beq	.L184
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #673]
	and	r2, r2, #1
	strb	ip, [r1, #674]
	strb	r2, [r1, #2]
.L184:
	cmp	r3, #3
	add	r0, r0, #57344
	moveq	r3, #0
	streqb	r3, [r1, #594]
	streqb	r3, [r1, #593]
	mov	r3, #0
	mov	r2, r3
	strb	r3, [r1, #2]
	ldr	r1, [r1, #544]
	ldr	r0, [r0, #1840]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	UnMarkFrameStoreRef, .-UnMarkFrameStoreRef
	.align	2
	.type	SlidingWinMark.part.3, %function
SlidingWinMark.part.3:
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
	add	r3, r0, #24576
	mov	r8, r0
	ldr	r7, [r3, #2140]
	cmp	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r6, r0, #26368
	mov	r4, #0
	add	r6, r6, #148
.L195:
	ldr	r5, [r6, #4]!
	add	r4, r4, #1
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	mov	r0, r5
	cmp	r3, #0
	beq	.L194
	bl	ShortTermRefFlg
	cmp	r0, #0
	bne	.L206
.L194:
	cmp	r4, r7
	bne	.L195
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L206:
	mov	r0, r8
	mov	r1, r5
	bl	UnMarkFrameStoreRef
	mov	r0, r8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	UpdateReflist
	UNWIND(.fnend)
	.size	SlidingWinMark.part.3, .-SlidingWinMark.part.3
	.align	2
	.global	UnMarkLTFrmByFrmIdx
	.type	UnMarkLTFrmByFrmIdx, %function
UnMarkLTFrmByFrmIdx:
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
	add	r3, r0, #24576
	ldr	r4, [r3, #2148]
	cmp	r4, #0
	ldmeqfd	sp, {r4, fp, sp, pc}
	ldr	ip, [r3, #2072]
	ldr	r3, [ip, #556]
	cmp	r3, r1
	addne	r2, r0, #26624
	movne	r3, #0
	addne	r2, r2, #24
	bne	.L211
	b	.L209
.L212:
	ldr	ip, [r2, #4]!
	ldr	lr, [ip, #556]
	cmp	lr, r1
	beq	.L209
.L211:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L212
	ldmfd	sp, {r4, fp, sp, pc}
.L209:
	mov	r1, ip
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	UnMarkFrameStoreRef
	UNWIND(.fnend)
	.size	UnMarkLTFrmByFrmIdx, .-UnMarkLTFrmByFrmIdx
	.align	2
	.global	UnMarkLTFldByFrmIdx
	.type	UnMarkLTFldByFrmIdx, %function
UnMarkLTFldByFrmIdx:
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
	add	ip, r0, #24576
	ldr	r6, [ip, #2148]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, fp, sp, pc}
	add	r4, r0, #26624
	mov	ip, #0
	add	r4, r4, #20
	b	.L222
.L220:
	cmp	ip, r6
	beq	.L236
.L222:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldr	r5, [lr, #556]
	cmp	r5, r3
	bne	.L220
	cmp	r2, #1
	ldreqb	r5, [lr, #673]	@ zero_extendqisi2
	beq	.L235
	cmp	r2, #2
	bne	.L220
	ldrb	r5, [lr, #633]	@ zero_extendqisi2
.L235:
	clz	r5, r5
	mov	r5, r5, lsr #5
	cmp	lr, r1
	orrne	r5, r5, #1
	cmp	r5, #0
	beq	.L220
	mov	r1, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L236:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkLTFldByFrmIdx, .-UnMarkLTFldByFrmIdx
	.align	2
	.global	UnMarkSTRef
	.type	UnMarkSTRef, %function
UnMarkSTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L238
	add	ip, r0, #24576
	ldr	r1, [r1, #560]
	ldr	r4, [ip, #2144]
	sub	r1, r1, #1
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L267
	add	ip, r0, #26368
	add	ip, ip, #212
	b	.L244
.L243:
	cmp	r3, r4
	beq	.L268
.L244:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #600]
	cmp	lr, r2
	bne	.L243
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L243
	ldr	lr, [r1, #592]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L243
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L238:
	add	r3, r0, #24576
	ldr	r1, [r1, #560]
	ldr	r5, [r3, #2144]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L269
	add	r4, r0, #26368
	mov	ip, #0
	add	r4, r4, #212
	b	.L249
.L245:
	tst	r3, #2
	beq	.L247
	ldr	r3, [r1, #672]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L270
.L247:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L271
.L249:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L245
	ldr	lr, [r1, #632]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L245
	ldr	lr, [r1, #640]
	cmp	lr, r2
	bne	.L245
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #2008]
	strb	r1, [r3, #634]
	ldr	r3, [r2, #2008]
	ldrb	ip, [r3, #592]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #594]
	ldreq	r3, [r2, #2008]
	streqb	r1, [r3, #593]
	ldreq	r3, [r2, #2008]
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r3, #580]
	mov	r2, r1
	add	lr, r0, #57344
	add	ip, ip, #14464
	add	ip, ip, #48
	str	r1, [r0, ip, asl #2]
	ldr	r1, [r3, #544]
.L264:
	ldr	r0, [lr, #1840]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	FSP_SetRef
.L270:
	ldr	r3, [r1, #680]
	cmp	r3, r2
	bne	.L247
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r2, #0
	ldr	r1, [r3, #2008]
	strb	r2, [r1, #674]
	ldr	r1, [r3, #2008]
	ldrb	ip, [r1, #592]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #594]
	ldreq	r1, [r3, #2008]
	streqb	r2, [r1, #593]
	ldreq	r1, [r3, #2008]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r1, #580]
	add	lr, r0, #57344
	mov	r2, r3
	add	ip, ip, #14464
	add	ip, ip, #48
	str	r3, [r0, ip, asl #2]
	ldr	r1, [r1, #544]
	b	.L264
.L271:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L268:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L267:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L269:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkSTRef, .-UnMarkSTRef
	.align	2
	.global	UnMarkLTRef
	.type	UnMarkLTRef, %function
UnMarkLTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L273
	add	r3, r0, #24576
	ldr	r5, [r3, #2148]
	cmp	r5, #0
	beq	.L301
	add	r4, r0, #26624
	mov	ip, #0
	add	r4, r4, #20
	b	.L282
.L278:
	tst	r3, #2
	beq	.L280
	ldr	r3, [r1, #672]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L302
.L280:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L303
.L282:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L278
	ldr	lr, [r1, #632]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L278
	ldr	lr, [r1, #636]
	cmp	r2, lr
	bne	.L278
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #2072]
	strb	r1, [r3, #633]
	ldr	r3, [r2, #2072]
	ldrb	ip, [r3, #592]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #594]
	ldreq	r3, [r2, #2072]
	streqb	r1, [r3, #593]
	ldreq	r3, [r2, #2072]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r3, [r3, #580]
	addeq	r3, r3, #14464
	addeq	r3, r3, #48
	streq	r2, [r0, r3, asl #2]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L273:
	add	r1, r0, #24576
	ldr	r4, [r1, #2148]
	cmp	r4, #0
	beq	.L304
	add	ip, r0, #26624
	add	ip, ip, #20
	b	.L284
.L283:
	cmp	r3, r4
	beq	.L305
.L284:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #596]
	cmp	lr, r2
	bne	.L283
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L283
	ldr	lr, [r1, #592]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L283
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L302:
	ldr	r3, [r1, #676]
	cmp	r2, r3
	bne	.L280
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r1, #0
	ldr	r2, [r3, #2072]
	strb	r1, [r2, #673]
	ldr	r2, [r3, #2072]
	ldrb	ip, [r2, #592]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r2, #594]
	ldreq	r2, [r3, #2072]
	streqb	r1, [r2, #593]
	ldreq	r2, [r3, #2072]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldreq	r3, [r2, #580]
	addeq	r3, r3, #14464
	addeq	r3, r3, #48
	streq	r1, [r0, r3, asl #2]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L305:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L303:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L304:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L301:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkLTRef, .-UnMarkLTRef
	.align	2
	.global	MarkPicLTRef
	.type	MarkPicLTRef, %function
MarkPicLTRef:
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
	ldrb	r5, [r3, #3]	@ zero_extendqisi2
	add	r3, r0, #24576
	cmp	r5, #0
	beq	.L307
	ldr	r7, [r3, #2144]
	cmp	r7, #0
	beq	.L336
	add	r6, r0, #26368
	mov	ip, #0
	add	r6, r6, #212
	b	.L321
.L313:
	tst	r4, #2
	beq	.L316
	ldr	lr, [r3, #672]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	beq	.L337
.L316:
	add	ip, ip, #1
	cmp	ip, r7
	beq	.L338
.L321:
	ldr	r3, [r6, #4]!
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L313
	ldr	lr, [r3, #632]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L313
	ldr	lr, [r3, #640]
	cmp	lr, r2
	bne	.L313
	ldrb	lr, [r3, #673]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L317
	ldr	lr, [r3, #556]
	cmp	lr, r1
	bne	.L316
.L317:
	str	r1, [r3, #556]
	sub	r3, r5, #1
	add	r2, r0, ip, lsl #2
	clz	r3, r3
	add	r2, r2, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r0, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r2, #2008]
	str	r1, [r3, #636]
	ldr	r3, [r2, #2008]
	strb	ip, [r3, #633]
	ldr	r3, [r2, #2008]
	strb	r0, [r3, #634]
	ldr	r3, [r2, #2008]
	ldrb	r1, [r3, #592]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L339
	ldrb	r1, [r3, #673]	@ zero_extendqisi2
	ldrb	r0, [r3, #633]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r3, #593]
	ldreq	r3, [r2, #2008]
	ldreqb	r2, [r3, #634]	@ zero_extendqisi2
	streqb	r2, [r3, #594]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L307:
	ldr	r6, [r3, #2144]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	lr, r0, #26368
	mov	r3, r5
	add	lr, lr, #212
	b	.L312
.L311:
	add	r3, r3, #1
	cmp	r3, r6
	beq	.L340
.L312:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #2]	@ zero_extendqisi2
	cmp	r4, #3
	bne	.L311
	ldr	r4, [ip, #592]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	bne	.L311
	ldr	r4, [ip, #600]
	cmp	r4, r2
	bne	.L311
	add	r3, r0, r3, lsl #2
	str	r1, [ip, #556]
	add	r3, r3, #24576
	mov	r0, #1
	mov	r2, #0
	ldr	ip, [r3, #2008]
	str	r1, [ip, #596]
	ldr	r1, [r3, #2008]
	strb	r0, [r1, #593]
	ldr	r1, [r3, #2008]
	strb	r0, [r1, #633]
	ldr	r1, [r3, #2008]
	strb	r0, [r1, #673]
	ldr	r1, [r3, #2008]
	strb	r2, [r1, #594]
	ldr	r1, [r3, #2008]
	strb	r2, [r1, #634]
	ldr	r3, [r3, #2008]
	strb	r2, [r3, #674]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L337:
	ldr	lr, [r3, #680]
	cmp	lr, r2
	bne	.L316
	ldrb	lr, [r3, #633]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L320
	ldr	lr, [r3, #556]
	cmp	lr, r1
	bne	.L316
.L320:
	str	r1, [r3, #556]
	sub	r3, r5, #2
	add	r0, r0, ip, lsl #2
	clz	r3, r3
	add	r0, r0, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r2, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r0, #2008]
	str	r1, [r3, #676]
	ldr	r3, [r0, #2008]
	strb	ip, [r3, #673]
	ldr	r3, [r0, #2008]
	strb	r2, [r3, #674]
	ldr	r3, [r0, #2008]
	ldrb	r2, [r3, #592]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #0
	bne	.L341
	ldrb	r2, [r3, #673]	@ zero_extendqisi2
	ldrb	r1, [r3, #633]	@ zero_extendqisi2
	cmp	r2, r1
	streqb	r2, [r3, #593]
	ldreq	r3, [r0, #2008]
	ldreqb	r2, [r3, #674]	@ zero_extendqisi2
	streqb	r2, [r3, #594]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L338:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L340:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L339:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L341:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L336:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MarkPicLTRef, .-MarkPicLTRef
	.align	2
	.global	MarkSTToLTRef
	.type	MarkSTToLTRef, %function
MarkSTToLTRef:
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
	mov	r5, r1
	ldrb	r1, [r1, #3]	@ zero_extendqisi2
	mov	r7, r3
	mov	r6, r0
	cmp	r1, #0
	bne	.L343
	ldr	r4, [r5, #560]
	mov	r1, r3
	sub	r4, r4, #1
	rsb	r4, r2, r4
	bl	UnMarkLTFrmByFrmIdx
.L344:
	mov	r3, r5
	mov	r2, r4
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MarkPicLTRef
.L343:
	add	r3, r0, #24576
	ldr	r4, [r5, #560]
	ldr	lr, [r3, #2144]
	rsb	r4, r2, r4, lsl #1
	cmp	lr, #0
	beq	.L344
	add	ip, r0, #26368
	mov	r3, #0
	add	ip, ip, #212
	b	.L347
.L345:
	tst	r2, #2
	beq	.L346
	ldr	r2, [r1, #672]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	beq	.L358
.L346:
	cmp	r3, lr
	beq	.L344
.L347:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L345
	ldr	r0, [r1, #632]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L345
	ldr	r0, [r1, #640]
	cmp	r0, r4
	bne	.L345
	mov	r3, r7
	mov	r2, #1
	mov	r0, r6
	bl	UnMarkLTFldByFrmIdx
	b	.L344
.L358:
	ldr	r2, [r1, #680]
	cmp	r2, r4
	bne	.L346
	mov	r3, r7
	mov	r2, #2
	mov	r0, r6
	bl	UnMarkLTFldByFrmIdx
	b	.L344
	UNWIND(.fnend)
	.size	MarkSTToLTRef, .-MarkSTToLTRef
	.align	2
	.global	UpdateMaxLTFrmIdx
	.type	UpdateMaxLTFrmIdx, %function
UpdateMaxLTFrmIdx:
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
	add	r6, r0, #24576
	mov	r7, r0
	ldr	r3, [r6, #2148]
	str	r1, [r6, #2152]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #26624
	mov	r3, r1
	add	r5, r5, #20
	mov	r4, #0
	b	.L363
.L361:
	ldr	r3, [r6, #2148]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r6, #2152]
.L363:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #556]
	cmp	r2, r3
	bcc	.L361
	mov	r0, r7
	bl	UnMarkFrameStoreRef
	b	.L361
	UNWIND(.fnend)
	.size	UpdateMaxLTFrmIdx, .-UpdateMaxLTFrmIdx
	.align	2
	.global	UnMarkAllSTRef
	.type	UnMarkAllSTRef, %function
UnMarkAllSTRef:
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
	add	r7, r0, #24576
	mov	r6, r0
	ldr	r3, [r7, #2144]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #26368
	mov	r4, #0
	add	r5, r5, #212
.L366:
	ldr	r1, [r5, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r7, #2144]
	add	r4, r4, #1
	cmp	r3, r4
	bhi	.L366
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkAllSTRef, .-UnMarkAllSTRef
	.align	2
	.global	MarkCurrPicLT
	.type	MarkCurrPicLT, %function
MarkCurrPicLT:
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
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	mov	r4, r1
	cmp	r2, #0
	beq	.L372
	mov	r3, r5
	ldr	r1, [r1, #552]
	bl	UnMarkLTFldByFrmIdx
.L371:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #564]
	strb	r2, [r4, #4]
	strb	r3, [r4, #5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L372:
	mov	r1, r5
	bl	UnMarkLTFrmByFrmIdx
	b	.L371
	UNWIND(.fnend)
	.size	MarkCurrPicLT, .-MarkCurrPicLT
	.align	2
	.global	RemoveFrameStoreOutDPB
	.type	RemoveFrameStoreOutDPB, %function
RemoveFrameStoreOutDPB:
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
	add	r7, r0, r1, lsl #2
	add	r7, r7, #24576
	mov	r4, r1
	mov	r5, r0
	ldr	r2, [r7, #1944]
	cmp	r2, #0
	beq	.L392
	ldr	r3, [r2, #584]
	add	r6, r0, #24576
	mov	r1, #0
	add	r8, r0, #57344
	add	r3, r3, #6656
	add	r3, r3, #26
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #4]
	ldr	r3, [r6, #2416]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r6, #2416]
	ldr	r1, [r2, #544]
	ldr	r0, [r8, #1840]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L377
	ldr	r3, [r0, #20]
	cmp	r3, #3
	beq	.L378
	ldr	r3, [r7, #1944]
	mov	r2, #0
	ldr	r0, [r8, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
.L378:
	ldr	r3, [r7, #1944]
	mov	r2, #0
	ldr	r0, [r8, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetRef
.L377:
	ldr	r1, [r7, #1944]
	mov	r3, #0
	mvn	r2, #0
	strb	r3, [r1, #1]
	ldr	r1, [r7, #1944]
	strb	r3, [r1, #4]
	ldr	r1, [r7, #1944]
	strb	r3, [r1, #2]
	ldr	r3, [r7, #1944]
	str	r2, [r3, #544]
	ldr	r1, [r6, #2140]
	add	r1, r1, r2
	cmp	r4, r1
	addcc	r3, r4, #6592
	addcc	r3, r3, #38
	addcc	r3, r5, r3, lsl #2
	bcs	.L381
.L380:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bne	.L380
.L381:
	add	r3, r1, #6592
	mov	r2, #0
	add	r3, r3, #38
	str	r2, [r5, r3, asl #2]
	str	r1, [r6, #2140]
.L373:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L392:
	str	r1, [sp]
	mov	r0, #1
	movw	r1, #1207
	ldr	r3, .L393
	ldr	r2, .L393+4
	bl	dprint_normal
	b	.L373
.L394:
	.align	2
.L393:
	.word	.LANCHOR0
	.word	.LC11
	UNWIND(.fnend)
	.size	RemoveFrameStoreOutDPB, .-RemoveFrameStoreOutDPB
	.align	2
	.global	RemoveUnUsedFrameStore
	.type	RemoveUnUsedFrameStore, %function
RemoveUnUsedFrameStore:
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
	subs	r6, r0, #0
	beq	.L405
	add	r3, r6, #24576
	ldr	r7, [r3, #2140]
	cmp	r7, #0
	addne	r8, r6, #57344
	movne	r5, #0
	movne	r9, r5
	movne	r10, r5
	bne	.L403
	b	.L404
.L414:
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L401
	ldr	r0, [r2, #712]
	cmp	r0, #1
	beq	.L401
	strb	r1, [r2, #1]
	mov	r0, r6
	mov	r1, r5
	add	r9, r9, #1
	bl	RemoveFrameStoreOutDPB
	cmp	r9, r7
	beq	.L404
.L403:
	add	r4, r6, r5, lsl #2
	ldr	r0, [r8, #1840]
	add	r4, r4, #24576
	ldr	r2, [r4, #1944]
	ldr	r1, [r2, #544]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L398
	ldrsb	r2, [r0]
	cmp	r2, #0
	bne	.L399
	ldr	r2, [r0, #20]
	cmp	r2, #0
	cmpne	r2, #3
	bne	.L399
	ldr	r1, [r4, #1944]
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L413
.L400:
	mvn	r3, #0
	str	r3, [r1, #544]
	ldr	r2, [r4, #1944]
	strb	r10, [r2, #2]
.L398:
	ldr	r1, [r4, #1944]
	ldr	r2, [r1, #712]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r1, #4]
.L399:
	ldr	r2, [r4, #1944]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L414
.L401:
	add	r9, r9, #1
	add	r5, r5, #1
	cmp	r9, r7
	bne	.L403
.L404:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L413:
	ldr	r1, [r1, #544]
	ldr	r0, [r8, #1840]
	bl	FSP_SetRef
	ldr	r1, [r4, #1944]
	b	.L400
.L405:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	RemoveUnUsedFrameStore, .-RemoveUnUsedFrameStore
	.align	2
	.global	CheckFrameStore
	.type	CheckFrameStore, %function
CheckFrameStore:
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
	add	r3, r0, #57344
	mov	r5, r0
	mov	r4, r1
	ldr	r2, [r3, #788]
	cmp	r2, #0
	bne	.L416
	ldr	r2, [r1, #712]
	cmp	r2, #1
	beq	.L417
	ldr	r2, [r3, #1768]
	cmp	r2, #0
	beq	.L449
.L417:
	mov	r2, #1
	str	r2, [r3, #788]
.L416:
	ldr	r0, [r3, #1840]
	ldr	r1, [r4, #544]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L419
	ldr	r3, [r0, #20]
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L420
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L423
	cmp	r2, #1
	beq	.L423
	ldr	r2, [r4]
	mov	r1, #768
	movt	r1, 768
	bic	r2, r2, #16711680
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L450
	cmp	r3, #1
	beq	.L451
	cmp	r3, #2
	beq	.L452
.L427:
	ldr	r2, [r5]
	ldr	r3, [r0, #136]
	ldr	r1, [r2, #4]
	cmp	r3, r1
	bls	.L434
	ldr	r2, [r2, #616]
	cmp	r2, #0
	beq	.L453
.L434:
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L420:
	ldr	r2, [r4, #712]
	cmp	r2, #1
	beq	.L454
.L431:
	str	r3, [sp]
	movw	r1, #1327
	ldr	r3, .L456
	mov	r0, #1
	ldr	r2, .L456+4
	bl	dprint_normal
	mvn	r0, #2
.L445:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L449:
	ldr	r2, [r0]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	bne	.L417
	mvn	r0, #0
	b	.L445
.L452:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	tst	r2, #2
	beq	.L427
	str	r2, [sp]
	movw	r1, #1354
	ldr	r2, .L456+8
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L445
.L419:
	ldr	r3, [r4, #712]
	cmp	r3, #1
	beq	.L455
.L429:
	ldr	r3, .L456
	movw	r1, #1323
	ldr	r2, .L456+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L454:
	mov	r3, #2
	str	r3, [r4, #712]
	ldr	r3, [r0, #20]
	b	.L431
.L451:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L427
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L456+16
	movw	r1, #1348
	bl	dprint_normal
	mvn	r0, #0
	b	.L445
.L453:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L456+20
	movw	r1, #1361
	bl	dprint_normal
	mvn	r0, #0
	b	.L445
.L455:
	mov	r3, #2
	str	r3, [r4, #712]
	b	.L429
.L423:
	str	r2, [sp]
	movw	r1, #1336
	ldr	r2, .L456+24
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L445
.L450:
	ldrb	ip, [r4, #3]	@ zero_extendqisi2
	movw	r1, #1342
	ldr	r2, .L456+28
	mov	r0, #1
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L445
.L457:
	.align	2
.L456:
	.word	.LANCHOR0+24
	.word	.LC13
	.word	.LC17
	.word	.LC12
	.word	.LC16
	.word	.LC18
	.word	.LC14
	.word	.LC15
	UNWIND(.fnend)
	.size	CheckFrameStore, .-CheckFrameStore
	.align	2
	.global	GetImagePara
	.type	GetImagePara, %function
GetImagePara:
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
	add	r3, r0, #12288
	add	ip, r0, #20480
	mov	r4, r1
	ldr	r2, [r3, #1304]
	mov	r9, r0
	ldr	r1, [ip, #216]
	mov	r0, #2208
	add	r8, r9, #57344
	ldr	ip, [r3, #1300]
	mov	lr, #4000
	mla	r2, r0, r1, r2
	ldrb	r0, [r4, #164]	@ zero_extendqisi2
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	bfc	r0, #0, #2
	ldr	r3, [r2, #28]
	strb	r0, [r4, #164]
	ldr	r2, [r8, #796]
	mla	r3, lr, r3, ip
	str	r2, [r4, #72]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L500
.L461:
	.word	.L460
	.word	.L462
	.word	.L463
	.word	.L460
.L463:
	ldr	r2, [r4, #572]
	add	r5, r9, #24576
	ldrb	r0, [r4, #164]	@ zero_extendqisi2
	ldr	lr, [r4, #576]
	bfi	r0, r2, #0, #2
	ldrb	r2, [r4, #165]	@ zero_extendqisi2
	ldr	ip, [r4, #692]
	strb	r0, [r4, #164]
	mov	r0, #2
	bfi	r2, r0, #2, #2
	ldr	r0, [r4, #704]
	strb	r2, [r4, #165]
	mov	r2, #3
	str	lr, [r4, #104]
	str	ip, [r4, #36]
	str	r0, [r4, #624]
	str	r2, [r4, #32]
.L459:
	ldrb	r2, [r3, #18]	@ zero_extendqisi2
	str	r2, [r4, #508]
	str	r2, [r4, #512]
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	cmp	r2, #0
	ldrne	r2, [r3, #3332]
	mov	r3, #1
	str	r3, [r4, #516]
	str	r2, [r4, #520]
	ldr	r3, [r9]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L479
	ldrb	r3, [r4, #592]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L479
	cmp	r1, #3
	ldreqb	r2, [r4, #165]	@ zero_extendqisi2
	bfieq	r2, r3, #0, #2
	streqb	r2, [r4, #165]
.L479:
	ldrd	r2, [r4, #216]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L481
	ldr	r3, [r5, #2140]
	sub	r3, r3, #1
	cmp	r3, #14
	bhi	.L481
	add	r6, r9, #26368
	mvn	r7, #0
	add	r6, r6, #148
	mov	r10, #0
	mvn	r2, #1
	mvn	r3, #0
	strd	r2, [fp, #-52]
.L484:
	ldr	r1, [r6, #4]!
	cmp	r1, #0
	beq	.L483
	ldr	r1, [r1, #544]
	ldr	r0, [r8, #1840]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L483
	ldr	r1, [r0, #20]
	cmp	r1, #3
	cmpne	r1, #0
	beq	.L483
	ldr	r1, [r6]
	ldrd	r2, [fp, #-52]
	ldrd	r0, [r1, #216]
	cmp	r1, r3
	cmpeq	r0, r2
	movcc	r7, r10
	strccd	r0, [fp, #-52]
.L483:
	ldr	r1, [r5, #2140]
	add	r10, r10, #1
	cmp	r1, #15
	cmpls	r10, r1
	bcc	.L484
	cmn	r7, #1
	beq	.L481
	ldrd	r2, [r4, #216]
	ldrd	r0, [fp, #-52]
	cmp	r3, r1
	cmpeq	r2, r0
	bhi	.L516
.L481:
	ldrb	r3, [r5, #1808]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L485
	ldr	r3, [r5, #1824]
	cmp	r3, #3
	moveq	r3, #1
	streq	r3, [r4, #160]
	beq	.L485
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r4, #160]
	beq	.L485
	cmp	r3, #5
	moveq	r3, #3
	streq	r3, [r4, #160]
	beq	.L485
	mov	r0, #0
	ldr	r2, .L519
	str	r0, [r4, #160]
	movw	r1, #1606
	ldr	r3, [r5, #1824]
	bl	dprint_normal
.L485:
	ldr	r0, [r8, #1840]
	ldr	r1, [r4, #544]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L458
	ldr	r3, [r5, #68]
	mov	r2, #536
	ldrb	ip, [r4, #166]	@ zero_extendqisi2
	add	r1, r4, #8
	ldr	lr, .L519+4
	str	r3, [r4, #76]
	ldrb	r3, [r5, #158]	@ zero_extendqisi2
	ubfx	r3, r3, #1, #1
	bfi	ip, r3, #1, #1
	strb	ip, [r4, #166]
	ldrb	ip, [r5, #420]	@ zero_extendqisi2
	ldr	r3, [lr, #52]
	strb	ip, [r4, #428]
	ldr	ip, [r5, #432]
	str	ip, [r4, #440]
	ldr	ip, [r5, #436]
	str	ip, [r4, #444]
	ldr	ip, [r5, #424]
	str	ip, [r4, #432]
	ldr	ip, [r5, #428]
	str	ip, [r4, #436]
	ldr	ip, [r5, #452]
	str	ip, [r4, #460]
	blx	r3
	ldr	r3, [r4, #624]
	str	r3, [r5, #232]
.L458:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L462:
	ldr	r2, [r4, #572]
	add	r5, r9, #24576
	ldrb	r0, [r4, #164]	@ zero_extendqisi2
	ldr	ip, [r4, #576]
	bfi	r0, r2, #0, #2
	ldrb	r2, [r4, #165]	@ zero_extendqisi2
	strb	r0, [r4, #164]
	mov	r0, #1
	str	ip, [r4, #104]
	bfi	r2, r0, #2, #2
	ldr	ip, [r4, #652]
	ldr	r0, [r4, #664]
	strb	r2, [r4, #165]
	mov	r2, #3
	str	ip, [r4, #32]
	str	r2, [r4, #36]
	str	r0, [r4, #624]
	b	.L459
.L460:
	ldrb	r2, [r4, #592]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L464
	ldr	r2, [r4, #576]
	mov	r0, #3
	ldr	ip, [r4, #572]
	ldr	r6, [r4, #652]
	ldr	lr, [r4, #692]
	str	r2, [r4, #104]
.L465:
	ldr	r5, [r4, #644]
	ldr	r2, [r4, #684]
	cmp	r5, r2
	beq	.L517
	movle	r7, #1
	movgt	r7, #0
.L476:
	add	r5, r9, #24576
	ldrb	r2, [r5, #1844]	@ zero_extendqisi2
	cmp	r2, #3
	moveq	r7, #1
	beq	.L477
	cmp	r2, #4
	moveq	r7, #0
.L477:
	ldrb	r2, [r4, #165]	@ zero_extendqisi2
	str	r6, [r4, #32]
	ldrb	r6, [r4, #164]	@ zero_extendqisi2
	bfi	r2, r7, #4, #2
	bfi	r2, r0, #2, #2
	str	lr, [r4, #36]
	bfi	r6, ip, #0, #2
	strb	r2, [r4, #165]
	strb	r6, [r4, #164]
	b	.L459
.L516:
	ldr	ip, [r8, #1840]
	strd	r0, [sp]
	mov	r0, ip
	bl	IsPtsRewind
	cmp	r0, #0
	bne	.L481
	ldrd	r2, [r4, #216]
	add	r10, r7, #6592
	ldr	ip, [r8, #1840]
	add	r10, r10, #38
	movw	r1, #1414
	mov	r0, #24
	strd	r2, [sp]
	ldrd	r2, [fp, #-52]
	strd	r2, [sp, #8]
	mov	r3, ip
	ldr	r2, .L519+8
	bl	dprint_normal
	ldrd	r2, [r4, #216]
	ldr	r1, [r9, r10, asl #2]
	strd	r2, [r1, #216]
	ldrd	r2, [fp, #-52]
	strd	r2, [r4, #216]
	b	.L481
.L464:
	ldr	r6, [r4, #648]
	ldr	r2, [r8, #1836]
	ldr	r7, [r4, #688]
	cmp	r6, r2
	bhi	.L518
	cmp	r2, r7
	bcc	.L469
.L467:
	ldr	r2, [r4, #576]
	mov	r0, #3
	ldr	ip, [r4, #572]
	ldr	lr, [r4, #652]
	ldr	r5, [r4, #692]
	str	r2, [r4, #104]
.L470:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	cmp	r2, #1
	streq	r7, [r4, #104]
	moveq	ip, r5
	moveq	r0, #2
	beq	.L472
	cmp	r2, #2
	streq	r6, [r4, #104]
	moveq	ip, lr
	moveq	r0, #1
.L472:
	ldr	r2, [r4, #664]
	mov	r6, lr
	ldr	r7, [r4, #704]
	str	lr, [r4, #32]
	mov	lr, r5
	add	r2, r2, r7
	str	r5, [r4, #36]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	str	r2, [r4, #624]
	b	.L465
.L469:
	ldr	ip, [r4, #652]
	mov	r0, #1
	ldr	r5, [r4, #692]
	str	r6, [r4, #104]
	mov	lr, ip
	b	.L470
.L517:
	ldr	r2, [r4, #40]
	cmp	r2, #720
	movne	r7, #1
	bne	.L476
	ldr	r7, [r4, #44]
	subs	r7, r7, #480
	movne	r7, #1
	b	.L476
.L518:
	cmp	r2, r7
	bcc	.L467
	ldr	ip, [r4, #692]
	mov	r0, #2
	str	r7, [r4, #104]
	ldr	lr, [r4, #652]
	mov	r5, ip
	b	.L470
.L500:
	add	r5, r9, #24576
	b	.L459
.L520:
	.align	2
.L519:
	.word	.LC20
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC19
	UNWIND(.fnend)
	.size	GetImagePara, .-GetImagePara
	.align	2
	.global	SetFrmRepeatCount
	.type	SetFrmRepeatCount, %function
SetFrmRepeatCount:
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
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SetFrmRepeatCount.part.2
	UNWIND(.fnend)
	.size	SetFrmRepeatCount, .-SetFrmRepeatCount
	.align	2
	.global	SplitFrmToFlds
	.type	SplitFrmToFlds, %function
SplitFrmToFlds:
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
	ldrb	lr, [r0, #593]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #594]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #608]
	ldr	r2, [r0, #612]
	ldr	r3, [r0, #628]
	strb	r5, [r0, #632]
	strb	r4, [r0, #672]
	strb	lr, [r0, #633]
	strb	lr, [r0, #673]
	strb	ip, [r0, #634]
	strb	ip, [r0, #674]
	str	r1, [r0, #648]
	str	r1, [r0, #688]
	str	r2, [r0, #652]
	str	r2, [r0, #692]
	str	r3, [r0, #668]
	str	r3, [r0, #708]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	SplitFrmToFlds, .-SplitFrmToFlds
	.align	2
	.global	CombineFldsToFrm
	.type	CombineFldsToFrm, %function
CombineFldsToFrm:
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
	ldr	r2, [r0, #684]
	mov	lr, #3
	ldr	r1, [r0, #644]
	ldr	r3, [r0, #688]
	cmp	r2, r1
	ldr	r5, [r0, #648]
	ldrb	r4, [r0, #673]	@ zero_extendqisi2
	ldr	ip, [r0, #668]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #592]
	mov	r3, r3, lsr #1
	str	ip, [r0, #628]
	str	r2, [r0, #604]
	str	r2, [r0, #560]
	str	r3, [r0, #608]
	beq	.L525
	ldrb	r2, [r0, #633]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L526
.L525:
	ldr	r2, [r0, #672]
	mov	r1, #0
	strb	r1, [r0, #593]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L532
	ldr	r2, [r0, #632]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	r1, #1
	beq	.L532
.L528:
	ldr	r2, [r0, #652]
	strb	r1, [r0, #594]
	cmp	r2, #0
	beq	.L530
	ldr	r1, [r0, #692]
	cmp	r1, #0
	moveq	r2, r1
	beq	.L530
	cmp	r2, r1
	movcc	r2, r1
.L530:
	str	r2, [r0, #612]
	str	r2, [r0, #572]
	str	r3, [r0, #576]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L526:
	mov	r1, #1
	strb	r1, [r0, #593]
.L532:
	mov	r1, #0
	b	.L528
	UNWIND(.fnend)
	.size	CombineFldsToFrm, .-CombineFldsToFrm
	.align	2
	.global	GetAPC
	.type	GetAPC, %function
GetAPC:
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
	subs	r7, r1, #0
	mov	r5, r0
	beq	.L566
	cmp	r2, #1
	beq	.L547
	cmp	r2, #2
	beq	.L548
	ldr	r8, [r7, #644]
	ldr	r9, [r7, #684]
.L549:
	add	r6, r5, #24576
	ldr	r1, [r6, #2412]
	cmp	r1, #0
	beq	.L558
	ldr	r4, [r6, #2156]
	cmp	r4, #0
	addne	r3, r5, #26624
	movne	r4, #0
	addne	r3, r3, #108
	bne	.L552
	b	.L550
.L556:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L550
.L552:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L556
.L558:
	mvn	r0, #0
.L562:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L548:
	ldr	r8, [r7, #684]
	mov	r9, r8
	b	.L549
.L550:
	add	r3, r5, #57344
	ldr	r1, [r7, #544]
	ldr	r0, [r3, #1840]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L553
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L553
	add	r5, r5, r4, lsl #2
	mov	r3, #1
	add	r5, r5, #24576
	movw	r1, #1884
	ldr	r2, .L567
	str	r3, [r5, #2156]
	ldr	r3, [r0, #24]
	mov	r0, #11
	ldr	r3, [r3, #36]
	str	r8, [r5, #2284]
	str	r9, [r5, #2348]
	str	r3, [r5, #2220]
	ldr	r3, [r6, #2416]
	cmp	r3, #15
	addls	r3, r3, #1
	movhi	r3, #16
	str	r3, [r6, #2416]
	ldr	r3, [r7, #96]
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, #0
	str	r4, [r7, #584]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L547:
	ldr	r8, [r7, #644]
	mov	r9, r8
	b	.L549
.L553:
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	mov	r1, #0
	ldr	r3, [r7, #544]
	str	r0, [sp, #4]
	mov	r0, r1
	str	r2, [sp]
	str	r1, [sp, #8]
	movw	r1, #1892
	ldr	r2, .L567+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L562
.L566:
	movw	r1, #1850
	mov	r0, r7
	str	r1, [sp]
	ldr	r3, .L567+8
	ldr	r2, .L567+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L562
.L568:
	.align	2
.L567:
	.word	.LC23
	.word	.LC24
	.word	.LC21
	.word	.LC22
	UNWIND(.fnend)
	.size	GetAPC, .-GetAPC
	.align	2
	.global	SlidingWinMark
	.type	SlidingWinMark, %function
SlidingWinMark:
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
	add	r2, r0, #24576
	add	r3, r0, #16384
	ldr	r1, [r2, #2148]
	ldr	r3, [r3, #456]
	ldr	r2, [r2, #2144]
	rsb	r3, r1, r3
	cmp	r2, r3
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SlidingWinMark.part.3
	UNWIND(.fnend)
	.size	SlidingWinMark, .-SlidingWinMark
	.align	2
	.global	SimpleSlideDPB
	.type	SimpleSlideDPB, %function
SimpleSlideDPB:
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
	add	r3, r0, #24576
	mov	r4, r0
	ldr	r1, [r3, #2140]
	ldr	r2, [r3, #2136]
	cmp	r1, r2
	bcs	.L577
.L572:
	add	r0, r4, #53248
	mov	r2, #0
	ldr	r3, [r0, #3512]
	strb	r2, [r0, #2948]
	cmp	r3, r2
	movne	r3, #1
	strneb	r3, [r0, #2949]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L577:
	ldr	r1, [r3, #1944]
	bl	UnMarkFrameStoreRef
	mov	r1, #0
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	b	.L572
	UNWIND(.fnend)
	.size	SimpleSlideDPB, .-SimpleSlideDPB
	.align	2
	.global	ReleaseNAL
	.type	ReleaseNAL, %function
ReleaseNAL:
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
	beq	.L587
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #4]
.L582:
	ldr	r3, [r4, #40]
	mov	r0, r6
	cmp	r3, #0
	beq	.L581
	ldr	r1, [r4, #64]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #44]
	ldr	r3, [r4, #40]
	movw	r1, #3285
	ldr	r2, .L588
	mov	r0, #8
	str	ip, [sp]
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r4, #40]
	str	r3, [r4, #56]
	str	r3, [r4, #44]
.L581:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L582
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #12]
.L578:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L587:
	movw	r1, #3272
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L588+4
	ldr	r2, .L588+8
	bl	dprint_normal
	b	.L578
.L589:
	.align	2
.L588:
	.word	.LC25
	.word	.LC21
	.word	.LC22
	UNWIND(.fnend)
	.size	ReleaseNAL, .-ReleaseNAL
	.align	2
	.global	ClearCurrNal
	.type	ClearCurrNal, %function
ClearCurrNal:
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
	ldr	r1, [r0, #368]
	mov	r4, r0
	cmp	r1, #0
	beq	.L591
	add	r3, r0, #57344
	ldr	r0, [r3, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L591:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearCurrNal, .-ClearCurrNal
	.align	2
	.global	ClearCurrSlice
	.type	ClearCurrSlice, %function
ClearCurrSlice:
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
	movw	r1, #405
	mov	r5, r0
	ldr	r2, .L600
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #368]
	add	r4, r5, #57344
	cmp	r1, #0
	beq	.L596
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L596:
	ldr	r3, [r4, #1796]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #1796]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L601:
	.align	2
.L600:
	.word	.LC26
	UNWIND(.fnend)
	.size	ClearCurrSlice, .-ClearCurrSlice
	.align	2
	.global	ClearAllNal
	.type	ClearAllNal, %function
ClearAllNal:
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
	add	r5, r0, #13504
	add	r4, r0, #376
	add	r5, r5, #24
	add	r6, r0, #57344
	b	.L604
.L603:
	add	r4, r4, #96
	cmp	r4, r5
	beq	.L606
.L604:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L603
	mov	r1, r4
	ldr	r0, [r6, #1840]
	add	r4, r4, #96
	bl	ReleaseNAL
	cmp	r4, r5
	bne	.L604
.L606:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearAllNal, .-ClearAllNal
	.align	2
	.global	ClearAllSlice
	.type	ClearAllSlice, %function
ClearAllSlice:
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
	add	r4, r0, #57344
	add	r5, r0, #57856
	add	r4, r4, #156
	add	r5, r5, #188
	add	r6, r0, #57344
	mov	r7, #0
.L609:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L608
	ldr	r0, [r6, #1840]
	bl	ReleaseNAL
	str	r7, [r4]
.L608:
	cmp	r4, r5
	bne	.L609
	mov	r0, #0
	str	r0, [r6, #1764]
	str	r0, [r6, #1824]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearAllSlice, .-ClearAllSlice
	.align	2
	.global	H264_ClearCurrPic
	.type	H264_ClearCurrPic, %function
H264_ClearCurrPic:
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
	bl	ClearAllSlice
	add	r0, r4, #12288
	add	r3, r4, #20480
	mov	r2, #0
	movw	r1, #23352
	ldr	r0, [r0, #1292]
	movt	r1, 1
	mov	ip, #2
	str	r1, [r3, #1864]
	strb	ip, [r3, #1849]
	mov	r1, #7
	str	r0, [r3, #1856]
	mov	r0, #32
	str	r1, [r3, #1860]
	mov	r1, #3
	strb	r0, [r3, #1850]
	mvn	r0, #0
	str	r1, [r3, #1872]
	mov	r1, #1048576
	str	r0, [r3, #1876]
	mov	r0, r2
	str	r1, [r3, #1888]
	strb	r2, [r3, #1848]
	str	r2, [r3, #1880]
	str	r2, [r3, #1884]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
	.align	2
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldr	r3, .L625
	mov	r5, r0
	add	r0, r0, #24576
	mov	r8, r1
	mov	r7, r2
	ldr	r4, [r0, #2136]
	mov	r2, #36
	ldr	r3, [r3, #48]
	mov	r1, #0
	sub	r0, fp, #72
	add	r4, r4, #1
	blx	r3
	add	r2, r5, #16384
	ldr	r3, [r5]
	add	r0, r5, #57344
	ldr	lr, [r2, #488]
	mov	r6, #0
	ldr	ip, [r2, #492]
	sub	r1, fp, #72
	ldr	r0, [r0, #1840]
	mov	r2, r6
	str	lr, [fp, #-56]
	str	ip, [fp, #-52]
	mov	ip, #8
	ldr	lr, [r3, #16]
	str	r8, [fp, #-64]
	cmp	lr, #24
	str	r7, [fp, #-60]
	str	r6, [fp, #-72]
	movne	lr, r4
	moveq	lr, #1
	str	lr, [fp, #-48]
	ldr	r3, [r3, #16]
	strb	ip, [fp, #-67]
	cmp	r3, #24
	moveq	r4, #1
	str	r4, [fp, #-44]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L623
	cmp	r0, #0
	moveq	r0, #1
	bne	.L624
.L619:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L624:
	mov	r0, r6
	ldr	r3, .L625+4
	ldr	r2, .L625+8
	movw	r1, #3329
	bl	dprint_normal
	mvn	r0, #19
	b	.L619
.L623:
	add	r0, r5, #8
	bl	ResetVoQueue
	mvn	r0, #19
	b	.L619
.L626:
	.align	2
.L625:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+40
	.word	.LC27
	UNWIND(.fnend)
	.size	H264_ArrangeVahbMem, .-H264_ArrangeVahbMem
	.align	2
	.global	RepairList
	.type	RepairList, %function
RepairList:
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
	add	r3, r0, #20480
	mov	r4, r0
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L629
	bcc	.L644
	cmp	r3, #2
	bne	.L653
.L645:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L653:
	ldr	r2, .L657
	movw	r1, #3357
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L644:
	mov	r6, #1
.L630:
	add	lr, r4, #20480
	add	ip, r4, #26880
	add	lr, lr, #244
	mov	r5, #0
	add	ip, ip, #244
	add	r7, r4, #53248
	ldr	r1, [lr, #4]!
	mov	r3, r5
	mov	r8, #1
	cmp	r1, #0
	beq	.L632
.L655:
	ldr	r10, [ip]
	cmp	r10, #0
	bne	.L646
	mov	r0, ip
	mov	r2, r10
	b	.L634
.L635:
	ldr	r9, [r0, #4]!
	cmp	r9, #0
	bne	.L633
.L634:
	add	r2, r2, #1
	cmp	r2, r1
	bne	.L635
	ldr	r2, [r4]
	ldr	r2, [r2, #12]
	cmp	r2, #2
	bne	.L654
	ldr	r5, [r7, #3496]
	add	r5, r5, #592
.L637:
	mov	r9, r10
	mov	r0, ip
	mov	r2, #0
	b	.L643
.L639:
	ldr	r9, [r0, #4]!
.L643:
	add	r2, r2, #1
	cmp	r9, #0
	streq	r5, [r0]
	cmp	r2, r1
	bne	.L639
	add	r3, r3, #1
	add	ip, ip, #132
	cmp	r6, r3
	bls	.L645
.L652:
	ldr	r1, [lr, #4]!
	cmp	r1, #0
	bne	.L655
.L632:
	ldr	r2, [r4]
	ldr	r2, [r2, #12]
	cmp	r2, #2
	bne	.L656
	add	r3, r3, #1
	str	r8, [lr]
	cmp	r6, r3
	ldr	r2, [r7, #3496]
	add	ip, ip, #132
	add	r2, r2, #592
	str	r2, [ip, #-132]
	bhi	.L652
	b	.L645
.L646:
	mov	r9, r10
.L633:
	mov	r5, r9
	b	.L637
.L629:
	mov	r6, #2
	b	.L630
.L656:
	ldr	r2, .L657+4
	str	r1, [sp]
	movw	r1, #3412
.L650:
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L654:
	mov	r0, #0
	mov	r3, r5
	ldr	r2, .L657+8
	movw	r1, #3389
	str	r0, [sp]
	b	.L650
.L658:
	.align	2
.L657:
	.word	.LC28
	.word	.LC30
	.word	.LC29
	UNWIND(.fnend)
	.size	RepairList, .-RepairList
	.align	2
	.global	GetShortTermPicPoint
	.type	GetShortTermPicPoint, %function
GetShortTermPicPoint:
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
	add	r3, r0, #20480
	ldrb	r4, [r3, #209]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L660
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L660:
	add	r3, r0, #24576
	ldr	r5, [r3, #2144]
	cmp	r5, #0
	beq	.L668
	add	r3, r0, #26368
	mov	r2, #0
	add	r3, r3, #216
	b	.L665
.L678:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L676
.L663:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L677
.L665:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L678
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L664
	ldr	ip, [r0, #632]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L679
.L664:
	tst	lr, #2
	beq	.L663
	ldr	ip, [r0, #672]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L663
	ldr	ip, [r0, #680]
	cmp	ip, r1
	bne	.L663
	add	r0, r0, #672
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L676:
	ldr	ip, [r0, #592]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L663
	ldr	ip, [r0, #600]
	cmp	ip, r1
	bne	.L663
	add	r0, r0, #592
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L679:
	ldr	ip, [r0, #640]
	cmp	ip, r1
	bne	.L664
	add	r0, r0, #632
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L677:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L668:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetShortTermPicPoint, .-GetShortTermPicPoint
	.align	2
	.global	GetLongTermPicPoint
	.type	GetLongTermPicPoint, %function
GetLongTermPicPoint:
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
	add	r3, r0, #20480
	ldrb	r4, [r3, #209]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L681
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L681:
	add	r3, r0, #24576
	ldr	r5, [r3, #2148]
	cmp	r5, #0
	beq	.L689
	add	r3, r0, #26624
	mov	r2, #0
	add	r3, r3, #24
	b	.L686
.L699:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L697
.L684:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L698
.L686:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L699
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L685
	ldr	ip, [r0, #632]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L700
.L685:
	tst	lr, #2
	beq	.L684
	ldr	ip, [r0, #672]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L684
	ldr	ip, [r0, #676]
	cmp	ip, r1
	bne	.L684
	add	r0, r0, #672
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L697:
	ldr	ip, [r0, #592]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L684
	ldr	ip, [r0, #596]
	cmp	ip, r1
	bne	.L684
	add	r0, r0, #592
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L700:
	ldr	ip, [r0, #636]
	cmp	ip, r1
	bne	.L685
	add	r0, r0, #632
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L698:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L689:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetLongTermPicPoint, .-GetLongTermPicPoint
	.align	2
	.global	ReorderSTList
	.type	ReorderSTList, %function
ReorderSTList:
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
	ldr	r6, [fp, #4]
	mov	r4, r1
	mov	r1, r3
	mov	r7, r2
	mov	r5, r3
	bl	GetShortTermPicPoint
	ldr	lr, [r6]
	add	r2, r7, #1
	cmp	r2, lr
	ble	.L702
	add	ip, r4, r2, lsl #2
	mov	r1, r2
.L703:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L703
.L702:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r4, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r7, #2
	add	r3, r4, r0, lsl #2
	mov	ip, r0
.L707:
	ldr	r1, [r3], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L705
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L706
	ldr	lr, [r1, #8]
	cmp	lr, r5
	beq	.L705
.L706:
	str	r1, [r4, ip, asl #2]
	add	ip, ip, #1
.L705:
	cmp	r0, r2
	bne	.L707
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ReorderSTList, .-ReorderSTList
	.align	2
	.global	ReorderLTList
	.type	ReorderLTList, %function
ReorderLTList:
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
	ldr	r6, [fp, #4]
	mov	r4, r1
	mov	r1, r3
	mov	r7, r2
	mov	r5, r3
	bl	GetLongTermPicPoint
	ldr	lr, [r6]
	add	r2, r7, #1
	cmp	r2, lr
	ble	.L715
	add	ip, r4, r2, lsl #2
	mov	r1, r2
.L716:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L716
.L715:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r4, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r7, #2
	add	r3, r4, r0, lsl #2
	mov	ip, r0
.L720:
	ldr	r1, [r3], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L718
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L719
	ldr	lr, [r1, #4]
	cmp	lr, r5
	beq	.L718
.L719:
	str	r1, [r4, ip, asl #2]
	add	ip, ip, #1
.L718:
	cmp	r0, r2
	bne	.L720
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ReorderLTList, .-ReorderLTList
	.align	2
	.global	ReorderRefPiclist
	.type	ReorderRefPiclist, %function
ReorderRefPiclist:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 24
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
	add	r2, r0, #20480
	str	r1, [fp, #-56]
	mov	r9, r3
	ldrb	r1, [r2, #209]	@ zero_extendqisi2
	mov	r3, #0
	mov	r8, r0
	str	r3, [fp, #-48]
	cmp	r1, r3
	ldr	r7, [fp, #4]
	add	r3, r0, #12288
	ldr	r1, [r2, #216]
	mov	lr, #2208
	beq	.L731
	ldr	r0, [r2, #224]
	mov	ip, #4000
	ldr	r2, [r3, #1304]
	ldr	r3, [r3, #1300]
	mov	r0, r0, asl #1
	mla	r2, lr, r1, r2
	mov	r1, #2
	add	r0, r0, #1
	str	r0, [fp, #-64]
	ldr	r2, [r2, #28]
	mla	r3, ip, r2, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r3, r1, asl r3
	str	r3, [fp, #-60]
.L741:
	adds	r10, r9, #2
	beq	.L730
	ldr	r3, [r7]
	cmp	r3, #3
	beq	.L730
	ldr	r6, [fp, #8]
	mov	r4, #0
	ldr	r5, [fp, #-64]
	b	.L734
.L735:
	ldr	r3, [fp, #12]
	sub	r1, fp, #48
	mov	r2, r9
	mov	r0, r8
	ldr	r3, [r3, r4, asl #2]
	add	r4, r4, #1
	str	r1, [sp]
	ldr	r1, [fp, #-56]
	bl	ReorderLTList
	cmp	r4, r10
	beq	.L730
.L740:
	ldr	r3, [r7, #4]!
	add	r6, r6, #4
	cmp	r3, #3
	beq	.L730
.L734:
	cmp	r3, #1
	bhi	.L735
	cmp	r3, #0
	ldr	r3, [r6]
	bne	.L736
	mvn	r3, r3
	adds	r5, r5, r3
	ldrmi	r3, [fp, #-60]
	addmi	r5, r5, r3
.L737:
	ldr	r3, [fp, #-64]
	sub	r2, fp, #48
	ldr	r1, [fp, #-56]
	mov	r0, r8
	cmp	r3, r5
	str	r2, [sp]
	add	r4, r4, #1
	mov	r2, r9
	ldrlt	r3, [fp, #-60]
	movge	r3, r5
	rsblt	r3, r3, r5
	bl	ReorderSTList
	cmp	r4, r10
	bne	.L740
.L730:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L736:
	add	r3, r3, #1
	add	r5, r5, r3
	ldr	r3, [fp, #-60]
	cmp	r3, r5
	rsble	r5, r3, r5
	b	.L737
.L731:
	ldr	r2, [r2, #224]
	mov	ip, #4000
	mov	r0, #1
	str	r2, [fp, #-64]
	ldr	r2, [r3, #1304]
	ldr	r3, [r3, #1300]
	mla	r2, lr, r1, r2
	ldr	r2, [r2, #28]
	mla	r3, ip, r2, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r3, r0, asl r3
	str	r3, [fp, #-60]
	b	.L741
	UNWIND(.fnend)
	.size	ReorderRefPiclist, .-ReorderRefPiclist
	.align	2
	.global	ReorderListX
	.type	ReorderListX, %function
ReorderListX:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r4, r0, #20480
	mov	r5, r0
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L749
	add	r6, r0, #16384
	ldrb	r2, [r6, #3512]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L761
.L752:
	cmp	r3, #1
	ldr	r3, [r4, #260]
	add	r3, r3, #1
	str	r3, [r4, #248]
	bne	.L749
	ldrb	r3, [r6, #3513]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L762
.L754:
	ldr	r3, [r4, #264]
	add	r3, r3, #1
	str	r3, [r4, #252]
.L749:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L761:
	add	r1, r0, #19968
	ldr	r3, [r4, #260]
	add	r2, r0, #20224
	add	ip, r0, #19712
	add	r1, r1, #196
	str	r1, [sp, #4]
	add	r1, r0, #26880
	add	r2, r2, #204
	add	ip, ip, #188
	str	r2, [sp, #8]
	str	ip, [sp]
	add	r2, r4, #248
	add	r1, r1, #244
	bl	ReorderRefPiclist
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	b	.L752
.L762:
	add	lr, r5, #20480
	add	ip, r5, #20224
	add	r0, r5, #19968
	add	r1, r5, #27136
	ldr	r3, [r4, #264]
	mov	r2, lr
	add	ip, ip, #72
	add	lr, lr, #76
	add	r0, r0, #64
	str	lr, [sp, #8]
	stmia	sp, {r0, ip}
	add	r2, r2, #252
	add	r1, r1, #120
	mov	r0, r5
	bl	ReorderRefPiclist
	b	.L754
	UNWIND(.fnend)
	.size	ReorderListX, .-ReorderListX
	.align	2
	.global	GenPiclistfromFrmlist
	.type	GenPiclistfromFrmlist, %function
GenPiclistfromFrmlist:
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
	cmp	r2, #31
	ldr	r6, [fp, #8]
	mov	r7, r1
	ldr	lr, .L826
	movcc	r4, r2
	ldr	ip, .L826+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L766
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L774
.L775:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L774
	cmp	r2, #0
	beq	.L780
	add	r8, r7, r5, lsl #2
	b	.L779
.L776:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L780
.L779:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L776
	add	r0, r0, #672
	blx	r6
	cmp	r0, #0
	beq	.L776
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #672
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L780:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L782
	b	.L775
.L781:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L775
.L782:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	tst	r1, #1
	beq	.L781
	add	r0, r0, #632
	blx	r6
	cmp	r0, #0
	beq	.L781
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #632
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L775
.L825:
	add	r0, r0, #632
	blx	r6
	cmp	r0, #0
	beq	.L767
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #632
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L771:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L773
	b	.L766
.L772:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L766
.L773:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L772
	add	r0, r0, #672
	blx	r6
	cmp	r0, #0
	beq	.L772
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #672
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L766:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L774
	cmp	r2, #0
	beq	.L771
	add	r9, r7, r10, lsl #2
	b	.L770
.L767:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L771
.L770:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L767
	b	.L825
.L774:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L827:
	.align	2
.L826:
	.word	IsLTRefFlg
	.word	IsSTRefFlg
	UNWIND(.fnend)
	.size	GenPiclistfromFrmlist, .-GenPiclistfromFrmlist
	.align	2
	.global	InitListX
	.type	InitListX, %function
InitListX:
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
	add	r7, r0, #20480
	mov	r4, r0
	add	r9, r0, #53248
	ldrb	r3, [r7, #208]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L829
	ldrb	r6, [r9, #2947]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L953
	add	r3, r0, #24576
	str	r3, [fp, #-240]
	ldr	ip, [r3, #2144]
	cmp	ip, #0
	beq	.L896
	add	r1, r0, #26368
	mov	r3, r6
	add	r1, r1, #212
	b	.L835
.L834:
	cmp	r3, ip
	beq	.L833
.L835:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L834
	ldr	r0, [r2, #592]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L834
	add	r0, r6, #6720
	cmp	r3, ip
	add	r0, r0, #60
	add	r2, r2, #592
	add	r6, r6, #1
	add	r0, r4, r0, lsl #2
	str	r2, [r0, #4]
	bne	.L835
.L833:
	add	r0, r4, #26880
	ldr	r3, .L961
	mov	r1, r6
	add	r0, r0, #244
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	str	r6, [r7, #248]
	ldr	r1, [r3, #2148]
	cmp	r1, #0
	beq	.L897
	add	r0, r4, #26624
	mov	r5, r6
	add	r0, r0, #20
	mov	r3, #0
	b	.L838
.L837:
	cmp	r3, r1
	beq	.L954
.L838:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L837
	ldr	ip, [r2, #592]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L837
	add	ip, r5, #6720
	cmp	r3, r1
	add	ip, ip, #60
	add	r2, r2, #592
	add	r5, r5, #1
	add	ip, r4, ip, lsl #2
	str	r2, [ip, #4]
	bne	.L838
.L954:
	rsb	r1, r6, r5
.L836:
	add	r0, r4, r6, lsl #2
	ldr	r3, .L961+4
	add	r0, r0, #26880
	mov	r2, #4
	add	r0, r0, #244
	bl	qsort
	mov	r2, r5
	cmp	r2, #0
	mov	r3, #0
	str	r5, [r7, #248]
	str	r3, [r7, #252]
	beq	.L955
.L844:
	ldr	r0, [r7, #260]
	ldr	r1, [r7, #264]
	add	r0, r0, #1
	cmp	r2, r0
	add	r1, r1, #1
	movcs	r2, r0
	cmp	r3, r1
	str	r2, [r7, #248]
	movcs	r3, r1
	cmp	r2, #32
	str	r3, [r7, #252]
	bhi	.L888
	add	r2, r2, #6720
	add	r1, r4, #27136
	add	r2, r2, #60
	add	r1, r1, #116
	mov	r0, #0
	add	r2, r4, r2, lsl #2
.L887:
	str	r0, [r2, #4]!
	cmp	r2, r1
	bne	.L887
.L888:
	cmp	r3, #32
	bhi	.L886
	add	r3, r3, #6784
	add	r2, r4, #27136
	add	r3, r3, #29
	add	r2, r2, #248
	mov	r1, #0
	add	r4, r4, r3, lsl #2
.L889:
	str	r1, [r4, #4]!
	cmp	r4, r2
	bne	.L889
.L886:
	mov	r0, #0
.L939:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L829:
	ldrb	r5, [r9, #2947]	@ zero_extendqisi2
	add	r3, r0, #24576
	str	r3, [fp, #-240]
	cmp	r5, #0
	ldr	r10, [r3, #2144]
	beq	.L850
	cmp	r10, #0
	beq	.L956
	add	r6, r0, #26368
	mov	r5, #0
	add	r6, r6, #212
	mov	r3, r5
	mov	r1, r6
.L869:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L868
	sub	r0, fp, #44
	ldr	ip, [r9, #3516]
	add	lr, r0, r5, lsl #2
	ldr	r0, [r2, #560]
	cmp	ip, r0
	strge	r2, [lr, #-192]
	addge	r5, r5, #1
.L868:
	cmp	r3, r10
	bne	.L869
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r5
	mov	r0, r3
	ldr	r3, .L961+8
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	beq	.L950
.L894:
	mov	r10, r5
	mov	r3, #0
.L872:
	ldr	r2, [r6, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L871
	sub	r1, fp, #44
	ldr	r0, [r9, #3516]
	add	ip, r1, r10, lsl #2
	ldr	r1, [r2, #560]
	cmp	r0, r1
	strlt	r2, [ip, #-192]
	addlt	r10, r10, #1
.L871:
	cmp	r3, r8
	bne	.L872
	ldr	r2, [fp, #-244]
	rsb	r8, r5, r10
	mov	r3, r5, asl #2
	str	r3, [fp, #-248]
	add	r0, r2, r3
	mov	r1, r8
	ldr	r3, .L961+12
	mov	r2, #4
	bl	qsort
	cmp	r5, #0
	subeq	r6, fp, #172
	beq	.L873
.L891:
	sub	r6, fp, #172
	ldr	r2, [fp, #-244]
	add	r8, r6, r8, lsl #2
	mov	r3, #0
.L874:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r5
	str	r1, [r8], #4
	bcc	.L874
.L873:
	cmp	r10, r5
	bls	.L875
	ldr	r3, [fp, #-244]
	ldr	r2, [fp, #-248]
	add	r2, r3, r2
	mov	r3, r6
.L876:
	add	r5, r5, #1
	ldr	r1, [r2], #4
	cmp	r5, r10
	str	r1, [r3], #4
	bne	.L876
.L875:
	add	r2, r4, #20480
	add	r3, r4, #26880
	add	r2, r2, #248
	mov	r5, #0
	add	r3, r3, #244
	str	r5, [r7, #248]
	str	r5, [r7, #252]
	mov	ip, r2
	ldrb	r0, [r9, #2947]	@ zero_extendqisi2
	add	r8, r4, #27136
	ldr	r1, [fp, #-244]
	add	r8, r8, #120
	str	r2, [fp, #-244]
	mov	r2, r10
	str	ip, [sp]
	str	r5, [sp, #4]
	str	r3, [fp, #-248]
	bl	GenPiclistfromFrmlist
	add	r3, r4, #20480
	ldrb	r0, [r9, #2947]	@ zero_extendqisi2
	mov	r2, r10
	mov	r1, r6
	mov	ip, r3
	str	r5, [sp, #4]
	add	ip, ip, #252
	mov	r3, r8
	str	ip, [sp]
	str	ip, [fp, #-252]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r6, [r3, #2148]
	cmp	r6, r5
	subeq	r10, fp, #108
	beq	.L877
	add	r3, r4, #26624
	sub	r10, fp, #108
	add	r3, r3, #20
	mov	r2, r10
.L878:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r6
	str	r1, [r2], #4
	bne	.L878
.L877:
	ldr	r3, .L961+16
	mov	r2, #4
	mov	r1, r6
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-244]
	ldrb	r0, [r9, #2947]	@ zero_extendqisi2
	mov	r5, #1
	mov	r2, r6
	mov	r1, r10
	str	r3, [sp]
	str	r5, [sp, #4]
	ldr	r3, [fp, #-248]
	bl	GenPiclistfromFrmlist
	ldr	r2, [fp, #-252]
	ldrb	r0, [r9, #2947]	@ zero_extendqisi2
	mov	r3, r8
	mov	r1, r10
	str	r5, [sp, #4]
	str	r2, [sp]
	mov	r2, r6
	bl	GenPiclistfromFrmlist
	ldr	r2, [r7, #248]
	ldr	r3, [r7, #252]
	rsb	r1, r3, r2
	clz	r1, r1
	mov	r1, r1, lsr #5
.L867:
	cmp	r2, #1
	movls	r1, #0
	andhi	r1, r1, #1
	cmp	r1, #0
	beq	.L879
	cmp	r2, #0
	ldr	r1, [fp, #-240]
	beq	.L880
	ldr	r6, [r1, #2548]
	ldr	r1, [r1, #2680]
	cmp	r6, r1
	bne	.L879
	add	r0, r4, #27136
	ldr	ip, [fp, #-248]
	add	r0, r0, #120
	mov	r1, #0
	b	.L881
.L882:
	ldr	r5, [ip, #4]!
	ldr	lr, [r0, #4]!
	cmp	r5, lr
	bne	.L879
.L881:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L882
.L883:
	ldr	r0, [fp, #-240]
	ldr	r1, [r0, #2684]
	str	r6, [r0, #2684]
	str	r1, [r0, #2680]
.L879:
	orrs	r1, r2, r3
	bne	.L844
	ldr	r2, .L961+20
	movw	r1, #4147
.L945:
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L939
.L850:
	cmp	r10, #0
	beq	.L853
	add	r6, r0, #26368
	mov	r3, r5
	add	r6, r6, #212
	mov	r1, r6
	b	.L855
.L854:
	cmp	r3, r10
	beq	.L957
.L855:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L854
	add	r0, r5, #6720
	ldr	ip, [r2, #604]
	add	r0, r0, #60
	ldr	lr, [r9, #3520]
	add	r2, r2, #592
	add	r0, r4, r0, lsl #2
	cmp	lr, ip
	addge	r5, r5, #1
	strge	r2, [r0, #4]
	cmp	r3, r10
	bne	.L855
.L957:
	add	r3, r4, #26880
	mov	r1, r5
	mov	r2, r3
	add	r2, r2, #244
	ldr	r3, .L961+24
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	beq	.L949
.L892:
	mov	r10, r5
	mov	r3, #0
	b	.L858
.L857:
	cmp	r3, r8
	beq	.L958
.L858:
	ldr	r2, [r6, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #3
	bne	.L857
	add	r1, r10, #6720
	ldr	r0, [r2, #604]
	add	r1, r1, #60
	ldr	ip, [r9, #3520]
	add	r2, r2, #592
	add	r1, r4, r1, lsl #2
	cmp	ip, r0
	addlt	r10, r10, #1
	strlt	r2, [r1, #4]
	cmp	r3, r8
	bne	.L858
.L958:
	add	r6, r5, #6720
	rsb	r8, r5, r10
	add	r6, r6, #60
	mov	r2, #4
	ldr	r3, .L961+28
	mov	r1, r8
	add	r0, r4, r6, lsl #2
	add	r9, r4, r10, lsl #2
	add	r0, r0, r2
	add	r9, r9, #26880
	bl	qsort
	cmp	r5, #0
	add	r9, r9, #244
	beq	.L860
.L890:
	add	r8, r8, #6784
	add	r2, r4, #26880
	add	r8, r8, #29
	add	r2, r2, #240
	mov	r3, #0
	add	r8, r4, r8, lsl #2
.L861:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r5
	str	r1, [r8, #4]!
	bcc	.L861
.L860:
	cmp	r10, r5
	bls	.L862
	add	r3, r4, #27136
	add	r6, r4, r6, lsl #2
	add	r3, r3, #116
.L863:
	add	r5, r5, #1
	ldr	r2, [r6, #4]!
	cmp	r5, r10
	str	r2, [r3, #4]!
	bne	.L863
.L862:
	ldr	r3, [fp, #-240]
	str	r10, [r7, #252]
	str	r10, [r7, #248]
	ldr	r1, [r3, #2148]
	cmp	r1, #0
	beq	.L899
	add	r0, r4, #26624
	mov	r5, r10
	add	r0, r0, #20
	mov	r3, #0
	b	.L866
.L865:
	cmp	r3, r1
	beq	.L959
.L866:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L865
	ldrb	ip, [r2, #593]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L865
	add	ip, r4, r5, lsl #2
	cmp	r3, r1
	add	ip, ip, #24576
	add	r2, r2, #592
	add	r5, r5, #1
	str	r2, [ip, #2548]
	str	r2, [ip, #2680]
	bne	.L866
.L959:
	rsb	r1, r10, r5
.L864:
	mov	r0, r9
	ldr	r3, .L961+4
	mov	r2, #4
	bl	qsort
	ldr	r0, [r7, #248]
	ldr	r3, .L961+4
	mov	r2, #4
	rsb	r1, r0, r5
	add	r0, r4, r0, lsl #2
	add	r0, r0, #27136
	add	r0, r0, #120
	bl	qsort
	mov	r3, r5
	str	r5, [r7, #252]
	mov	r2, r5
	str	r5, [r7, #248]
	mov	r1, #1
	b	.L867
.L953:
	add	r2, r0, #24576
	str	r2, [fp, #-240]
	ldr	lr, [r2, #2144]
	cmp	lr, #0
	moveq	r6, lr
	beq	.L832
	add	r1, r0, #26368
	mov	r6, r3
	add	r1, r1, #212
.L841:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r6, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r6, r6, #1
	cmp	r3, lr
	bne	.L841
.L832:
	mov	r1, r6
	ldr	r3, .L961+32
	mov	r2, #4
	sub	r0, fp, #236
	add	r8, r4, #26880
	bl	qsort
	add	r8, r8, #244
	add	r3, r4, #20480
	mov	r5, #0
	mov	r2, r6
	str	r5, [r7, #248]
	mov	ip, r3
	ldrb	r0, [r9, #2947]	@ zero_extendqisi2
	add	ip, ip, #248
	mov	r3, r8
	sub	r1, fp, #236
	str	r5, [sp, #4]
	str	ip, [sp]
	str	ip, [fp, #-244]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r6, [r3, #2148]
	cmp	r6, r5
	subeq	r10, fp, #108
	beq	.L842
	add	r3, r4, #26624
	sub	r10, fp, #108
	add	r3, r3, #20
	mov	r2, r10
.L843:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r6
	str	r1, [r2], #4
	bne	.L843
.L842:
	ldr	r3, .L961+16
	mov	r2, #4
	mov	r1, r6
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-244]
	ldrb	r0, [r9, #2947]	@ zero_extendqisi2
	mov	r2, r6
	mov	ip, #1
	mov	r1, r10
	str	r3, [sp]
	mov	r3, r8
	str	ip, [sp, #4]
	bl	GenPiclistfromFrmlist
	ldr	r2, [r7, #248]
	mov	r3, #0
	str	r3, [r7, #252]
	cmp	r2, #0
	bne	.L844
.L955:
	ldr	r3, [r4]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L845
	ldrb	r3, [r9, #2947]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L960
	cmp	r3, #1
	ldr	r2, [fp, #-240]
	ldr	r3, [r9, #3496]
	addeq	r3, r3, #632
	addne	r3, r3, #672
	str	r3, [r2, #2548]
.L847:
	mov	r3, #0
	mov	r2, #1
	b	.L844
.L960:
	ldr	r2, [fp, #-240]
	ldr	r3, [r9, #3496]
	add	r3, r3, #592
	str	r3, [r2, #2548]
	b	.L847
.L880:
	ldr	r6, [r1, #2680]
	b	.L883
.L949:
	add	r6, r5, #6720
	mov	r2, #4
	add	r6, r6, #60
	ldr	r3, .L961+28
	mov	r1, r8
	add	r9, r4, r6, lsl #2
	add	r9, r9, r2
	mov	r0, r9
	bl	qsort
	subs	r10, r5, #0
	bne	.L890
	b	.L862
.L950:
	mov	r3, r5, asl #2
	ldr	r1, [fp, #-244]
	str	r3, [fp, #-248]
	mov	r2, r3
	ldr	r3, .L961+12
	add	r0, r1, r2
	mov	r2, #4
	mov	r1, r8
	bl	qsort
	subs	r10, r5, #0
	bne	.L891
.L946:
	sub	r6, fp, #172
	b	.L875
.L896:
	mov	r6, ip
	b	.L833
.L956:
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L961+8
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	addne	r6, r4, #26368
	movne	r5, r10
	addne	r6, r6, #212
	bne	.L894
	ldr	r3, .L961+12
	mov	r2, #4
	mov	r1, r8
	ldr	r0, [fp, #-244]
	mov	r10, r8
	bl	qsort
	b	.L946
.L853:
	add	r3, r0, #26880
	mov	r1, r10
	mov	r2, r3
	add	r2, r2, #244
	ldr	r3, .L961+24
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	addne	r6, r4, #26368
	movne	r5, r10
	addne	r6, r6, #212
	bne	.L892
	ldr	r9, [fp, #-248]
	mov	r2, #4
	ldr	r3, .L961+28
	mov	r1, r8
	mov	r10, r8
	mov	r0, r9
	bl	qsort
	b	.L862
.L897:
	mov	r5, r6
	b	.L836
.L899:
	mov	r5, r10
	b	.L864
.L845:
	ldr	r2, .L961+36
	movw	r1, #4001
	b	.L945
.L962:
	.align	2
.L961:
	.word	compare_pic_by_pic_num_desc
	.word	compare_pic_by_lt_pic_num_asc
	.word	compare_fs_by_poc_desc
	.word	compare_fs_by_poc_asc
	.word	compare_fs_by_lt_pic_idx_asc
	.word	.LC32
	.word	compare_pic_by_poc_desc
	.word	compare_pic_by_poc_asc
	.word	compare_fs_by_frame_num_desc
	.word	.LC31
	UNWIND(.fnend)
	.size	InitListX, .-InitListX
	.align	2
	.global	DumpList
	.type	DumpList, %function
DumpList:
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
	ldr	r3, .L965
	ldr	r3, [r3]
	tst	r3, #2048
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DumpList.part.6
.L966:
	.align	2
.L965:
	.word	g_PrintEnable
	UNWIND(.fnend)
	.size	DumpList, .-DumpList
	.align	2
	.global	FindNearestPOCPicId
	.type	FindNearestPOCPicId, %function
FindNearestPOCPicId:
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
	add	r3, r0, #24576
	ldr	r4, [r3, #2140]
	cmp	r4, #0
	beq	.L972
	ldr	r3, [r3, #1944]
	add	r2, r0, #53248
	ldr	r5, [r2, #3516]
	ldr	lr, [r3, #560]
	rsb	lr, lr, r5
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	r4, #1
	bls	.L973
	add	r1, r0, #26368
	mov	r2, #1
	add	r1, r1, #152
	mov	r0, #0
.L971:
	ldr	ip, [r1, #4]!
	add	r2, r2, #1
	ldr	r3, [ip, #560]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r0, [ip, #96]
	movlt	lr, r3
	cmp	r2, r4
	bne	.L971
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L973:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L972:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	FindNearestPOCPicId, .-FindNearestPOCPicId
	.align	2
	.global	FindMinRefIdx
	.type	FindMinRefIdx, %function
FindMinRefIdx:
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
	add	r3, r0, #20480
	ldrb	r2, [r3, #208]	@ zero_extendqisi2
	cmp	r2, #2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	add	r2, r0, #53248
	add	r5, r0, #26880
	ldrb	ip, [r2, #2947]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1005
	ldr	lr, [r3, #248]
	mov	r4, r5
	mov	r6, r5
	mov	r7, ip
	cmp	lr, #0
	add	r5, r5, #116
	add	r4, r4, #120
	add	r6, r6, #240
	beq	.L983
.L1007:
	mov	r2, r6
	mov	r0, #32
	mov	r3, #0
	b	.L981
.L980:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L1006
.L981:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #584]
	cmp	r1, ip
	bne	.L980
	cmp	r0, r3
	movcs	r0, r3
	add	r3, r3, #1
	cmp	r3, lr
	str	r0, [r4, #-4]
	str	r0, [r5, #4]
	bne	.L981
.L1006:
	cmp	r0, #31
	bhi	.L983
.L982:
	add	ip, ip, #1
	add	r5, r5, #8
	cmp	ip, #16
	add	r4, r4, #8
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	lr, #0
	bne	.L1007
.L983:
	str	r7, [r4, #-4]
	str	r7, [r5, #4]
	b	.L982
.L1005:
	ldr	r4, [r3, #248]
	mov	ip, #0
	mov	r6, r5
	mov	r7, ip
	cmp	r4, #0
	add	r5, r5, #116
	add	r6, r6, #240
	beq	.L987
.L1009:
	mov	r1, r6
	mov	lr, #32
	mov	r2, #0
	b	.L985
.L984:
	add	r2, r2, #1
	cmp	r2, r4
	beq	.L1008
.L985:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #36]
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #584]
	mov	r3, r3, asl #1
	cmp	r0, #2
	orreq	r3, r3, #1
	cmp	r3, ip
	bne	.L984
	cmp	lr, r2
	movcs	lr, r2
	add	r2, r2, #1
	cmp	r2, r4
	str	lr, [r5]
	bne	.L985
.L1008:
	cmp	lr, #31
	bhi	.L987
.L986:
	add	ip, ip, #1
	add	r5, r5, #4
	cmp	ip, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r4, #0
	bne	.L1009
.L987:
	str	r7, [r5]
	b	.L986
	UNWIND(.fnend)
	.size	FindMinRefIdx, .-FindMinRefIdx
	.align	2
	.global	UvmosDeleteList
	.type	UvmosDeleteList, %function
UvmosDeleteList:
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
	mov	r4, r0
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1012
	bcc	.L1019
	cmp	r3, #2
	bne	.L1029
.L1020:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1029:
	ldr	r2, .L1031
	movw	r1, #4360
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1019:
	mov	r8, #1
.L1013:
	add	r6, r4, #20480
	add	r5, r4, #26880
	add	r6, r6, #244
	add	r5, r5, #240
	add	lr, r4, #57344
	mov	r7, #0
.L1017:
	ldr	ip, [r6, #4]!
	cmp	ip, #0
	movne	r1, r5
	movne	r3, #0
	beq	.L1018
.L1016:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	cmp	r2, #0
	beq	.L1015
	ldr	r0, [r2, #16]
	ldr	r2, [lr, #1832]
	cmp	r0, r2
	bls	.L1015
	ldr	r2, [r4]
	ldr	r2, [r2, #616]
	cmp	r2, #1
	beq	.L1030
.L1015:
	cmp	r3, ip
	bne	.L1016
.L1018:
	add	r7, r7, #1
	add	r5, r5, #132
	cmp	r7, r8
	bcc	.L1017
	b	.L1020
.L1030:
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1012:
	mov	r8, #2
	b	.L1013
.L1032:
	.align	2
.L1031:
	.word	.LC28
	UNWIND(.fnend)
	.size	UvmosDeleteList, .-UvmosDeleteList
	.align	2
	.global	DecList
	.type	DecList, %function
DecList:
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
	bl	FindNearestPOCPicId
	add	r6, r5, #20480
	mvn	r4, #0
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	str	r4, [r6, #1832]
	cmp	r3, #2
	str	r0, [r6, #1836]
	beq	.L1049
	mov	r0, r5
	bl	InitListX
	cmp	r0, #0
	bne	.L1050
	ldr	r4, .L1052
	movw	r1, #4406
	ldr	r2, .L1052+4
	mov	r0, #11
	bl	dprint_normal
	ldr	r3, [r4]
	tst	r3, #2048
	bne	.L1051
.L1037:
	mov	r0, r5
	bl	ReorderListX
	mov	r0, r5
	bl	RepairList
	cmp	r0, #0
	bne	.L1042
	mov	r0, r5
	bl	FindMinRefIdx
	ldr	r3, [r5]
	ldr	r3, [r3, #616]
	cmp	r3, #1
	beq	.L1039
.L1043:
	add	r3, r5, #24576
	ldr	r3, [r3, #2548]
	cmp	r3, #0
	mvneq	r3, #0
	ldrne	r3, [r3, #36]
	ldrne	r3, [r3, #96]
.L1041:
	str	r3, [r6, #1832]
	movw	r1, #4429
	ldr	r2, .L1052+8
	mov	r0, #11
	bl	dprint_normal
	ldr	r0, [r4]
	ands	r0, r0, #2048
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r5
	bl	DumpList.part.6
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1049:
	mov	r0, #0
	str	r0, [r6, #248]
	str	r0, [r6, #252]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1051:
	mov	r0, r5
	bl	DumpList.part.6
	b	.L1037
.L1039:
	mov	r0, r5
	bl	UvmosDeleteList
	cmp	r0, #0
	beq	.L1043
.L1042:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1050:
	ldr	r2, .L1052+12
	movw	r1, #4402
	mov	r0, #11
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1053:
	.align	2
.L1052:
	.word	g_PrintEnable
	.word	.LC34
	.word	.LC35
	.word	.LC33
	UNWIND(.fnend)
	.size	DecList, .-DecList
	.align	2
	.global	GetReRangeFlag
	.type	GetReRangeFlag, %function
GetReRangeFlag:
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
	add	r6, r0, #12288
	add	r3, r0, #20480
	mov	r5, r0
	ldr	r0, [r6, #1304]
	mov	lr, #2208
	ldr	r3, [r3, #216]
	mov	r4, #4000
	ldr	r2, [r6, #1300]
	mov	r7, r1
	ldr	ip, [r6, #1276]
	mla	r3, lr, r3, r0
	ldr	r0, [r6, #1280]
	ldr	r3, [r3, #28]
	mla	r4, r4, r3, r2
	ldrb	r3, [r4, #18]	@ zero_extendqisi2
	ldr	r1, [r4, #3252]
	rsb	r3, r3, #2
	ldr	r2, [r4, #3248]
	mla	r3, r1, r3, r3
	add	r2, r2, #1
	cmp	r2, ip
	cmpeq	r3, r0
	movne	r1, #1
	moveq	r1, #0
	bne	.L1055
	add	lr, r5, #24576
	ldr	r8, [r4, #3272]
	ldr	lr, [lr, #2136]
	add	lr, lr, #1
	cmp	r8, lr
	moveq	r3, r1
	beq	.L1056
.L1055:
	ldr	r1, .L1060
	ldr	r8, [r1]
	cmp	r8, #0
	beq	.L1059
	add	r1, r5, #57344
	mov	r0, r0, asl #4
	mov	r2, r2, asl #4
	mov	r3, r3, asl #4
	mov	ip, ip, asl #4
	strh	r0, [fp, #-42]	@ movhi
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #8
	ldr	r0, [r1, #1840]
	mov	r1, #1
	strh	ip, [fp, #-44]	@ movhi
	blx	r8
.L1059:
	ldr	lr, [r4, #3272]
	mov	r3, #1
.L1056:
	add	r5, r5, #16384
	ldr	r2, [r4, #36]
	ldr	ip, [r6, #1344]
	mov	r0, r3
	ldr	r1, [r5, #484]
	cmp	ip, r2
	cmpeq	r1, lr
	movne	r2, #1
	moveq	r2, #0
	orr	r3, r2, r3
	str	r3, [r7]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1061:
	.align	2
.L1060:
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	GetReRangeFlag, .-GetReRangeFlag
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	DecPOC
	.type	DecPOC, %function
DecPOC:
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
	add	r2, r0, #12288
	add	r6, r0, #20480
	mov	r4, #2208
	mov	r5, #4000
	ldr	r1, [r6, #216]
	mov	ip, #1
	ldr	r3, [r2, #1304]
	ldr	lr, [r2, #1300]
	ldrb	r2, [r6, #211]	@ zero_extendqisi2
	mla	r3, r4, r1, r3
	sub	r2, r2, #5
	clz	r2, r2
	mov	r2, r2, lsr #5
	ldr	r3, [r3, #28]
	mla	r5, r5, r3, lr
	ldr	r1, [r5, #2200]
	ldr	r3, [r5, #2196]
	cmp	r1, ip
	ldr	lr, [r5, #2204]
	add	r3, r3, #4
	mov	r3, ip, asl r3
	beq	.L1064
	bcc	.L1065
	cmp	r1, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r2, #0
	add	r4, r0, #16384
	bne	.L1120
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	bne	.L1098
	ldr	r2, [r4, #3484]
	ldr	r0, [r4, #3480]
	ldr	r1, [r4, #3492]
	cmp	r2, r0
	addcc	r1, r1, r3
	strcc	r1, [r4, #3488]
	bcs	.L1100
.L1101:
	add	r3, r1, r2
	str	r3, [r4, #3476]
	ldr	r0, [r6, #236]
	mov	r3, r3, asl #1
	cmp	r0, #0
	subeq	r3, r3, #1
	str	r3, [r4, #3464]
	ldrb	r0, [r6, #209]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1104
	str	r3, [r4, #3460]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
.L1097:
	str	r2, [r4, #3480]
	str	r1, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1065:
	cmp	r2, #0
	add	lr, lr, #4
	add	r4, r0, #16384
	mov	ip, ip, asl lr
	bne	.L1071
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	bne	.L1069
	ldr	lr, [r4, #3428]
	ldr	r1, [r4, #3432]
	mov	r2, lr
.L1070:
	ldr	r0, [r4, #3420]
	cmp	r0, r1
	bcs	.L1068
	rsb	r3, r0, r1
	cmp	r3, ip, lsr #1
	addcs	r2, r2, ip
	strcs	r2, [r4, #3436]
	bcc	.L1068
.L1072:
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1074
.L1122:
	ldr	r3, [r4, #3424]
	add	r2, r2, r0
	str	r2, [r4, #3452]
	add	r3, r2, r3
	str	r3, [r4, #3456]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r4, #3464]
.L1075:
	ldr	r2, [r4, #3484]
	ldr	r1, [r4, #3480]
	str	r3, [r4, #3460]
	cmp	r2, r1
	strne	r2, [r4, #3480]
	ldr	r3, [r6, #236]
	cmp	r3, #0
	ldrne	r2, [r4, #3420]
	ldrne	r3, [r4, #3436]
	strne	r2, [r4, #3432]
	strne	r3, [r4, #3428]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1064:
	cmp	r2, #0
	add	r4, r0, #16384
	movne	r3, #0
	strne	r3, [r4, #3488]
	bne	.L1079
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	beq	.L1080
	mov	r3, r2
	str	r2, [r4, #3492]
	str	r2, [r4, #3480]
.L1081:
	str	r3, [r4, #3488]
.L1079:
	ldr	r3, [r5, #2216]
	cmp	r3, #0
	beq	.L1083
	ldr	r3, [r4, #3484]
	ldr	r0, [r4, #3488]
	add	r0, r3, r0
	str	r0, [r4, #3476]
	ldr	r7, [r6, #236]
	cmp	r7, #0
	bne	.L1085
	cmp	r0, #0
	beq	.L1086
	sub	r0, r0, #1
	str	r0, [r4, #3476]
.L1085:
	mov	r3, #0
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2216]
	cmp	r1, r3
	bgt	.L1106
	cmp	r0, #0
	beq	.L1089
.L1123:
	sub	r8, r0, #1
	mov	r0, r8
	bl	__aeabi_uidiv
	mov	r9, r0
	mov	r0, r8
	str	r9, [r4, #3500]
	ldr	r1, [r5, #2216]
	bl	__aeabi_uidivmod
	ldr	r0, [r4, #3508]
	mul	r0, r0, r9
	str	r0, [r4, #3504]
	cmp	r1, #0
	str	r1, [r4, #3496]
	blt	.L1090
	add	r2, r5, #2208
	add	r1, r1, #1
	add	r2, r2, #8
	mov	r3, #0
.L1091:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r4, #3504]
	bne	.L1091
.L1090:
	cmp	r7, #0
	ldreq	r3, [r5, #2208]
	addeq	r0, r0, r3
	streq	r0, [r4, #3504]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1093
	ldr	r2, [r4, #3468]
	ldr	r1, [r4, #3472]
	add	r2, r0, r2
	str	r2, [r4, #3452]
	ldr	r3, [r5, #2212]
	add	r3, r2, r3
	add	r0, r3, r1
	str	r0, [r4, #3456]
	cmp	r0, r2
	movge	r0, r2
	str	r0, [r4, #3464]
.L1094:
	ldr	r2, [r4, #3484]
	ldr	r3, [r4, #3488]
	str	r0, [r4, #3460]
	str	r2, [r4, #3480]
	str	r3, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1069:
	ldr	lr, [r4, #3448]
	cmp	lr, #0
	beq	.L1121
.L1071:
	ldr	r0, [r4, #3420]
	mov	r3, #0
	mov	lr, r3
	mov	r2, r1
	str	r3, [r4, #3428]
	str	r3, [r4, #3432]
.L1068:
	cmp	r0, r1
	bls	.L1073
	rsb	r1, r1, r0
	cmp	r1, ip, lsr #1
	rsbhi	r2, ip, r2
	strhi	r2, [r4, #3436]
	bhi	.L1072
.L1073:
	str	lr, [r4, #3436]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1122
.L1074:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r2, r0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	str	r3, [r4, #3464]
	b	.L1075
.L1120:
	mov	r3, #0
	ldr	r2, [r4, #3484]
	mov	r1, r3
	str	r3, [r4, #3488]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
	str	r3, [r4, #3460]
	str	r3, [r4, #3464]
	b	.L1097
.L1083:
	str	r3, [r4, #3476]
	ldr	r7, [r6, #236]
.L1086:
	mov	r0, #0
	str	r0, [r4, #3508]
	ldr	r3, [r5, #2216]
	cmp	r3, r0
	ble	.L1089
.L1106:
	add	ip, r5, #2208
	mov	r3, #0
	add	ip, ip, #8
	mov	r2, r3
.L1088:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2216]
	cmp	r1, r2
	bgt	.L1088
	cmp	r0, #0
	bne	.L1123
.L1089:
	mov	r0, #0
	str	r0, [r4, #3504]
	b	.L1090
.L1093:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r5, #2212]
	ldreq	r3, [r4, #3468]
	ldrne	r3, [r4, #3468]
	addne	r0, r0, r2
	addeq	r0, r0, r3
	streq	r0, [r4, #3452]
	addne	r0, r0, r3
	strne	r0, [r4, #3456]
	str	r0, [r4, #3464]
	b	.L1094
.L1080:
	ldr	r1, [r4, #3484]
	ldr	r2, [r4, #3480]
	cmp	r1, r2
	bcs	.L1082
	ldr	r2, [r4, #3492]
	add	r3, r3, r2
	str	r3, [r4, #3488]
	b	.L1079
.L1104:
	ldrb	r0, [r6, #210]	@ zero_extendqisi2
	str	r3, [r4, #3460]
	cmp	r0, #0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	b	.L1097
.L1098:
	str	r2, [r4, #3480]
	mov	r1, r2
	str	r2, [r4, #3492]
	ldr	r2, [r4, #3484]
.L1100:
	str	r1, [r4, #3488]
	b	.L1101
.L1121:
	ldr	r3, [r4, #3452]
	mov	r2, r1
	str	lr, [r4, #3428]
	mov	r1, r3
	str	r3, [r4, #3432]
	b	.L1070
.L1082:
	ldr	r3, [r4, #3492]
	b	.L1081
	UNWIND(.fnend)
	.size	DecPOC, .-DecPOC
	.align	2
	.global	CalcPicNum
	.type	CalcPicNum, %function
CalcPicNum:
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
	add	r3, r0, #20480
	add	ip, r0, #12288
	mov	r4, #2208
	mov	lr, #4000
	ldr	r2, [r3, #216]
	add	r6, r0, #53248
	ldr	r1, [ip, #1304]
	mov	r7, #1
	ldr	r3, [ip, #1300]
	mla	r1, r4, r2, r1
	ldrb	r2, [r6, #2947]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r1, [r1, #28]
	mla	r3, lr, r1, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r7, r7, asl r3
	add	r3, r0, #24576
	beq	.L1125
	sub	r5, r2, #1
	sub	r4, r2, #2
	ldr	r2, [r3, #2144]
	clz	r5, r5
	clz	r4, r4
	cmp	r2, #0
	mov	r5, r5, lsr #5
	addne	lr, r0, #26368
	mov	r4, r4, lsr #5
	movne	r1, #0
	addne	lr, lr, #212
	beq	.L1145
.L1144:
	ldr	ip, [lr, #4]!
	ldrb	r2, [ip, #2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1139
	ldr	r2, [ip, #548]
	ldr	r8, [r6, #3504]
	cmp	r2, r8
	rsbhi	r2, r7, r2
	str	r2, [ip, #552]
	ldr	r2, [lr]
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L1142
	ldr	r8, [r2, #632]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	ip, [r2, #552]
	addeq	ip, r5, ip, lsl #1
	streq	ip, [r2, #640]
	ldreq	r2, [lr]
	ldreqb	ip, [r2, #2]	@ zero_extendqisi2
.L1142:
	tst	ip, #2
	beq	.L1139
	ldr	ip, [r2, #672]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	ldreq	ip, [r2, #552]
	addeq	ip, r4, ip, lsl #1
	streq	ip, [r2, #680]
.L1139:
	ldr	r2, [r3, #2144]
	add	r1, r1, #1
	cmp	r2, r1
	bhi	.L1144
.L1145:
	ldr	r2, [r3, #2148]
	cmp	r2, #0
	beq	.L1169
	add	r0, r0, #26624
	mov	r2, #0
	add	r0, r0, #20
.L1150:
	ldr	ip, [r0, #4]!
	add	r2, r2, #1
	ldrb	r1, [ip, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1147
	tst	r1, #1
	beq	.L1148
	ldr	lr, [ip, #632]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	ldreq	r1, [ip, #556]
	addeq	r1, r5, r1, lsl #1
	streq	r1, [ip, #636]
	ldreq	ip, [r0]
	ldreqb	r1, [ip, #2]	@ zero_extendqisi2
.L1148:
	tst	r1, #2
	beq	.L1147
	ldr	r1, [ip, #672]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [ip, #556]
	addeq	r1, r4, r1, lsl #1
	streq	r1, [ip, #676]
.L1147:
	ldr	r1, [r3, #2148]
	cmp	r1, r2
	bhi	.L1150
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1125:
	ldr	r1, [r3, #2144]
	cmp	r1, #0
	addne	ip, r0, #26368
	addne	ip, ip, #212
	bne	.L1134
.L1135:
	ldr	r2, [r3, #2148]
	cmp	r2, #0
	beq	.L1170
	add	r0, r0, #26624
	mov	r2, #0
	add	r0, r0, #20
	b	.L1137
.L1136:
	ldr	r1, [r3, #2148]
	cmp	r1, r2
	bls	.L1171
.L1137:
	ldr	r1, [r0, #4]!
	add	r2, r2, #1
	ldrb	ip, [r1, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1136
	ldr	ip, [r1, #592]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	ldreq	ip, [r1, #556]
	streq	ip, [r1, #596]
	ldr	r1, [r3, #2148]
	cmp	r1, r2
	bhi	.L1137
.L1171:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1172:
	ldr	lr, [r1, #592]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L1131
	ldr	lr, [r1, #548]
	ldr	r4, [r6, #3504]
	rsb	r5, r7, lr
	cmp	lr, r4
	strhi	r5, [r1, #552]
	strls	lr, [r1, #552]
	ldr	r1, [ip]
	ldr	lr, [r1, #552]
	str	lr, [r1, #600]
.L1131:
	ldr	r1, [r3, #2144]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1135
.L1134:
	ldr	r1, [ip, #4]!
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L1131
	b	.L1172
.L1170:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1169:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	CalcPicNum, .-CalcPicNum
	.align	2
	.global	IsOutDPB
	.type	IsOutDPB, %function
IsOutDPB:
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
	beq	.L1178
	add	r3, r0, #24576
	ldr	ip, [r3, #2140]
	cmp	ip, #0
	beq	.L1178
	ldr	r3, [r3, #1944]
	cmp	r3, r1
	beq	.L1180
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #152
	b	.L1175
.L1176:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1180
.L1175:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1176
.L1178:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1180:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsOutDPB, .-IsOutDPB
	.align	2
	.global	WritePicMsg
	.type	WritePicMsg, %function
WritePicMsg:
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
	add	r7, r0, #53248
	add	r5, r0, #57344
	movw	r1, #5620
	ldr	r6, [r7, #3564]
	mov	r4, r0
	ldr	lr, [r7, #3048]
	mov	r0, #3
	ldrb	ip, [r7, #2947]	@ zero_extendqisi2
	ldr	r3, [r7, #3512]
	ldr	r2, .L1219
	str	r6, [sp, #8]
	stmia	sp, {ip, lr}
	bl	dprint_normal
	ldr	r1, [r5, #1852]
	mov	r3, #0
	str	r3, [r5, #1764]
	cmp	r1, #1
	str	r3, [r5, #1864]
	beq	.L1182
	add	r2, r4, #17408
	add	r3, r4, #13568
	add	r2, r2, #188
	add	r3, r3, #28
.L1183:
	ldr	r0, [r5, #1760]
	cmp	r1, #1
	add	r8, r4, #16384
	str	r0, [r5, #1620]
	ldr	r1, [r7, #3332]
	str	r1, [r5, #1396]
	ldr	r1, [r7, #3336]
	str	r1, [r5, #1400]
	ldr	r1, [r7, #3340]
	str	r1, [r5, #1404]
	ldr	r1, [r7, #3344]
	str	r1, [r5, #1408]
	ldr	r1, [r7, #3512]
	str	r1, [r5, #828]
	ldrb	r1, [r7, #2947]	@ zero_extendqisi2
	strb	r1, [r5, #820]
	ldrb	r1, [r3, #19]	@ zero_extendqisi2
	str	r1, [r5, #844]
	ldr	r1, [r7, #3548]
	str	r1, [r5, #832]
	ldr	r1, [r7, #3552]
	str	r1, [r5, #836]
	ldr	r1, [r3, #3248]
	add	r1, r1, #1
	str	r1, [r5, #840]
	ldrb	r1, [r3, #18]	@ zero_extendqisi2
	strb	r1, [r5, #823]
	ldr	r1, [r2, #60]
	str	r1, [r5, #848]
	ldrb	r1, [r2]	@ zero_extendqisi2
	str	r1, [r5, #852]
	ldr	r3, [r3, #40]
	strb	r3, [r5, #821]
	ldrb	r3, [r2, #4]	@ zero_extendqisi2
	str	r3, [r5, #856]
	ldr	r3, [r8, #3464]
	str	r3, [r5, #860]
	ldr	r3, [r8, #3452]
	str	r3, [r5, #864]
	ldr	r3, [r8, #3456]
	str	r3, [r5, #868]
	beq	.L1199
	ldr	r3, [r7, #3496]
	ldr	r0, [r5, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_GetLogicFs
	subs	r9, r0, #0
	beq	.L1218
	ldr	r3, [r9, #24]
	ldr	r2, [r9, #32]
	cmp	r3, #0
	beq	.L1188
	cmp	r2, #0
	beq	.L1188
	add	r2, r4, #58368
	ldr	r0, [r5, #1840]
	add	r6, r4, #24576
	mov	r1, r2
	add	r2, r2, #96
	add	r1, r1, #232
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r9, #184]
	add	r2, r4, #58368
	add	r1, r4, #58624
	add	r1, r1, #108
	add	r2, r2, #236
	str	r3, [r5, #1248]
	ldr	r3, [r9, #24]
	ldr	r0, [r5, #1840]
	ldr	r3, [r3, #12]
	str	r3, [r5, #1252]
	ldr	r3, [r9, #24]
	ldr	r3, [r3, #36]
	str	r3, [r5, #1104]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r7, #3564]
	str	r3, [r5, #1112]
	ldr	r3, [r9, #32]
	ldr	r3, [r3, #16]
	str	r3, [r5, #1392]
	ldr	r3, [r9, #24]
	ldr	r3, [r3, #4]
	str	r3, [r5, #1108]
	ldr	r3, [r9, #24]
	ldr	r3, [r3, #72]
	str	r3, [r5, #1116]
	ldrb	r3, [r9, #408]	@ zero_extendqisi2
	strb	r3, [r5, #824]
	ldr	r1, [r6, #2412]
	cmp	r1, #0
	str	r1, [r5, #1612]
	beq	.L1194
	add	r9, r4, #26624
	add	r7, r4, #58624
	add	r0, r4, #26880
	add	r2, r4, #58880
	mov	lr, r9
	mov	ip, r7
	add	r9, r9, #168
	add	r7, r7, #136
	add	lr, lr, #232
	add	ip, ip, #200
	add	r0, r0, #40
	add	r2, r2, #8
	mov	r3, #0
.L1193:
	ldr	r10, [r9, #4]!
	add	r3, r3, #1
	cmp	r3, r1
	str	r10, [r7, #4]!
	ldr	r10, [lr, #4]!
	str	r10, [ip, #4]!
	ldr	r10, [r0, #4]!
	str	r10, [r2, #4]!
	bne	.L1193
.L1194:
	add	r3, r4, #12288
	ldrb	r3, [r3, #1333]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1191
	ldrb	r0, [r8, #1230]	@ zero_extendqisi2
.L1195:
	cmp	r0, #1
	add	ip, r4, #58112
	mov	r0, #0
	add	ip, ip, #100
	beq	.L1200
.L1203:
	add	r3, r0, #3888
	add	r0, r0, #1
	add	r3, r3, #2
	cmp	r0, #24
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	bic	r2, r3, #16711680
	ubfx	lr, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, lr, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1203
	add	ip, r4, #58112
	mov	lr, #1
	add	ip, ip, #200
	mov	r0, #0
.L1204:
	mov	r2, r0, lsr #3
	mov	r3, r0, asl #1
	and	r7, lr, #15
	and	r8, r3, #14
	mov	r3, r2, asl #4
	add	r0, r0, #1
	add	r2, r3, r7
	add	r3, r3, r8
	add	r2, r2, #3904
	add	r3, r3, #3904
	add	r2, r2, #10
	add	r3, r3, #10
	cmp	r0, #16
	add	lr, lr, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r2, [r2, #8]
	ldr	r3, [r3, #8]
	ubfx	r9, r2, #8, #8
	and	r8, r2, #-16777216
	mov	r7, r2, lsr #16
	uxtb	r2, r2
	mov	r10, r3, lsr #24
	mov	r7, r7, asl #24
	mov	r10, r10, asl #8
	orr	r2, r7, r2, asl #16
	orr	r10, r10, r9, asl #16
	uxtb	r7, r3
	mov	r9, r3, lsr #8
	orr	r7, r2, r7
	ubfx	r3, r3, #8, #8
	and	r2, r9, #65280
	orr	r10, r10, r8
	orr	r2, r7, r2
	orr	r3, r10, r3
	stmia	ip, {r2, r3}
	add	ip, ip, #8
	bne	.L1204
.L1202:
	cmp	r1, #0
	beq	.L1199
	add	r9, r4, #58880
	add	r7, r4, #26624
	add	r7, r7, #172
	mov	r8, #0
	mov	r4, r9
	add	r9, r9, #84
	add	r4, r4, #148
.L1205:
	ldr	r1, [r7]
	add	r8, r8, #1
	ldr	r0, [r5, #1840]
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7], #4
	str	r3, [r4, #4]!
	ldr	r3, [r6, #2412]
	cmp	r3, r8
	bhi	.L1205
.L1199:
	mov	r0, #0
.L1215:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1200:
	add	r3, r0, #4864
	add	r0, r0, #1
	add	r3, r3, #30
	cmp	r0, #24
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	bic	r2, r3, #16711680
	ubfx	lr, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, lr, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1200
	add	ip, r4, #58112
	mov	lr, #1
	add	ip, ip, #200
	mov	r0, #0
.L1201:
	mov	r2, r0, lsr #3
	mov	r3, r0, asl #1
	and	r7, lr, #15
	and	r8, r3, #14
	mov	r3, r2, asl #4
	add	r0, r0, #1
	add	r2, r3, r7
	add	r3, r3, r8
	add	r2, r2, #4864
	add	r3, r3, #4864
	add	r2, r2, #54
	add	r3, r3, #54
	cmp	r0, #16
	add	lr, lr, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	add	ip, ip, #8
	ldr	r2, [r2, #4]
	ldr	r3, [r3, #4]
	ubfx	r9, r2, #8, #8
	mov	r8, r2, lsr #16
	uxtb	r10, r2
	mov	r7, r3, lsr #24
	and	r2, r2, #-16777216
	mov	r8, r8, asl #24
	mov	r7, r7, asl #8
	orr	r8, r8, r10, asl #16
	orr	r7, r7, r9, asl #16
	uxtb	r10, r3
	mov	r9, r3, lsr #8
	orr	r10, r8, r10
	and	r9, r9, #65280
	ubfx	r3, r3, #8, #8
	orr	r2, r7, r2
	orr	r10, r10, r9
	orr	r3, r2, r3
	str	r10, [ip, #-8]
	str	r3, [ip, #-4]
	bne	.L1201
	b	.L1202
.L1191:
	ldrb	r0, [r8, #1230]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1195
	add	lr, r4, #58112
	ldr	ip, .L1219+4
	add	lr, lr, #100
.L1196:
	and	r3, r0, #3
	add	r0, r0, #1
	cmp	r0, #24
	ldr	r3, [ip, r3, asl #2]
	bic	r2, r3, #16711680
	ubfx	r7, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r7, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [lr, #4]!
	bne	.L1196
	add	r7, r4, #58112
	mov	lr, #0
	add	r7, r7, #200
.L1197:
	add	r3, lr, #1
	and	r2, lr, #14
	and	r3, r3, #15
	add	lr, lr, #2
	add	r2, ip, r2, lsl #2
	cmp	lr, #32
	add	r3, ip, r3, lsl #2
	ldr	r0, [r2, #16]
	ldr	r8, [r3, #16]
	ubfx	r3, r0, #8, #8
	mov	r10, r0, lsr #24
	uxtb	r2, r8
	mov	r9, r8, lsr #16
	orr	r3, r3, r10, asl #8
	mov	r2, r2, asl #16
	orr	r9, r2, r9, asl #24
	uxtb	r2, r0
	orr	r9, r9, r2
	mov	r0, r0, lsr #8
	and	r2, r8, #-16777216
	ubfx	r8, r8, #8, #8
	orr	r3, r3, r2
	and	r0, r0, #65280
	orr	r2, r9, r0
	orr	r3, r3, r8, asl #16
	stmia	r7, {r2, r3}
	add	r7, r7, #8
	bne	.L1197
	b	.L1202
.L1182:
	add	r0, r4, #12288
	add	ip, r4, #20480
	mov	r6, #2208
	mov	lr, #4000
	ldr	r3, [r0, #1304]
	ldr	r2, [ip, #216]
	ldr	r0, [r0, #1300]
	mla	r2, r6, r2, r3
	ldr	r3, [r2, #28]
	mla	r3, lr, r3, r0
	b	.L1183
.L1188:
	str	r2, [sp]
	movw	r1, #5676
	ldr	r2, .L1219+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L1215
.L1218:
	ldr	r3, [r7, #3496]
	movw	r1, #5670
	ldr	r2, .L1219+12
	ldr	r3, [r3, #544]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1215
.L1220:
	.align	2
.L1219:
	.word	.LC36
	.word	.LANCHOR1
	.word	.LC38
	.word	.LC37
	UNWIND(.fnend)
	.size	WritePicMsg, .-WritePicMsg
	.align	2
	.global	UpdatePicQpInf
	.type	UpdatePicQpInf, %function
UpdatePicQpInf:
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
	ldr	r2, [r1, #24]
	ldr	r3, [r1, #28]
	cmp	r2, r0
	movlt	r2, r0
	cmp	r3, r0
	str	r2, [r1, #24]
	movge	r3, r0
	str	r3, [r1, #28]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	UpdatePicQpInf, .-UpdatePicQpInf
	.align	2
	.global	WriteSliceMsg
	.type	WriteSliceMsg, %function
WriteSliceMsg:
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
	add	r3, r0, #57344
	mov	r4, r0
	ldr	r2, [r3, #1852]
	ldr	r1, [r3, #1764]
	cmp	r2, #1
	str	r1, [fp, #-48]
	beq	.L1223
	add	lr, r0, #17408
	add	r9, r0, #13568
	add	lr, lr, #188
	add	r9, r9, #28
	add	r2, r0, #12288
	add	r7, r0, #20480
.L1224:
	ldr	r0, [fp, #-48]
	movw	r5, #4060
	ldr	r10, [r3, #1760]
	add	r1, r0, #1
	str	r1, [r3, #1764]
	mul	r5, r5, r0
	ldr	r2, [r2, #1284]
	sub	r2, r2, #1
	cmp	r0, r2
	add	r8, r10, r5
	addcc	r2, r5, #4048
	addcc	r2, r2, #12
	movcs	r2, #0
	addcc	r2, r10, r2
	str	r2, [r8, #4056]
	ldr	r0, [r4, #368]
	ldrb	r1, [r0]	@ zero_extendqisi2
	ldr	r2, [r0, #12]
	cmp	r1, #1
	cmpls	r1, r2
	bcs	.L1227
	add	ip, r1, #3
	add	ip, r8, ip, lsl #2
.L1228:
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r1, r1, #1
	add	r0, r0, r2
	ldr	r0, [r0, #56]
	str	r0, [ip, #4]!
	ldr	r0, [r4, #368]
	add	r0, r0, r2
	ldr	r0, [r0, #52]
	str	r0, [ip, #-8]
	ldr	r0, [r4, #368]
	add	r2, r0, r2
	ldr	r2, [r2, #60]
	str	r2, [ip, #8]
	ldr	r0, [r4, #368]
	ldr	r2, [r0, #12]
	cmp	r2, r1
	movhi	r6, #1
	movls	r6, #0
	cmp	r1, #1
	movhi	r6, #0
	cmp	r6, #0
	bne	.L1228
.L1227:
	cmp	r2, #1
	bhi	.L1233
	add	r2, r2, #3
	add	r0, r8, #20
	mov	r1, #0
	add	r2, r8, r2, lsl #2
.L1232:
	str	r1, [r2, #4]!
	cmp	r2, r0
	str	r1, [r2, #-8]
	str	r1, [r2, #8]
	bne	.L1232
.L1233:
	add	r6, r4, #53248
	ldrb	r2, [r6, #2953]	@ zero_extendqisi2
	strb	r2, [r8, #1]
	ldr	r2, [lr, #48]
	ldr	r1, [r7, #1816]
	add	r2, r2, #26
	add	r2, r2, r1
	str	r2, [r8, #32]
	ldr	r1, [r7, #1812]
	str	r1, [r8, #36]
	ldr	r1, [r7, #264]
	str	r1, [r8, #40]
	ldr	r1, [r7, #260]
	str	r1, [r8, #44]
	ldrb	r1, [r7, #208]	@ zero_extendqisi2
	strb	r1, [r10, r5]
	ldr	r1, [r7, #256]
	str	r1, [r8, #48]
	ldrb	r1, [r7, #214]	@ zero_extendqisi2
	strb	r1, [r8, #2]
	ldrb	r1, [r9, #20]	@ zero_extendqisi2
	strb	r1, [r8, #3]
	ldr	r1, [r7, #248]
	str	r1, [r8, #52]
	ldr	r1, [r7, #252]
	str	r1, [r8, #56]
	ldrb	r1, [r7, #208]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1330
	cmp	r1, #0
	ldreqb	r1, [lr, #2]	@ zero_extendqisi2
	movne	r1, #0
	strb	r1, [r8, #4]
.L1234:
	ldr	r1, [lr, #52]
	str	r1, [r8, #60]
	ldr	r1, [lr, #56]
	str	r1, [r8, #64]
	ldr	r1, [r7, #1824]
	str	r1, [r8, #68]
	ldr	r1, [r7, #1828]
	str	r1, [r8, #72]
	ldr	r1, [r7, #1820]
	str	r1, [r8, #76]
	ldr	r1, [r3, #1852]
	cmp	r1, #1
	beq	.L1222
	ldr	r1, [fp, #-48]
	cmp	r1, #0
	ldr	r1, [r6, #3496]
	beq	.L1331
	ldr	ip, [r1, #616]
	ldr	r0, [r1, #620]
	cmp	ip, r2
	movlt	ip, r2
	cmp	r0, r2
	str	ip, [r1, #616]
	movge	r0, r2
	str	r0, [r1, #620]
.L1238:
	ldrb	r2, [r7, #208]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L1275
	ldr	r9, [r7, #248]
	cmp	r9, #0
	beq	.L1278
	add	r2, r4, #24576
	ldr	r2, [r2, #2548]
	ldr	r0, [r2, #36]
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r1, r4, #26880
	movne	r2, #0
	addne	r1, r1, #244
	bne	.L1243
	b	.L1241
.L1245:
	ldr	r0, [r1, #4]!
	ldr	r0, [r0, #36]
	ldrb	ip, [r0]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1241
.L1243:
	add	r2, r2, #1
	cmp	r2, r9
	bne	.L1245
	mov	r2, #0
	str	r2, [fp, #-52]
.L1240:
	ldr	lr, [r7, #252]
	cmp	lr, #0
	beq	.L1279
	add	r2, r4, #24576
	ldr	r2, [r2, #2680]
	ldr	r0, [r2, #36]
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r1, r4, #27136
	movne	r2, #0
	addne	r1, r1, #120
	bne	.L1249
	b	.L1247
.L1251:
	ldr	r0, [r1, #4]!
	ldr	r0, [r0, #36]
	ldrb	ip, [r0]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1247
.L1249:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L1251
	mov	r2, #0
	str	r2, [fp, #-56]
.L1246:
	ldrb	r2, [r6, #2947]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1252
	ldr	r2, [r7, #248]
	cmp	r2, #0
	beq	.L1267
	add	r5, r4, #26880
	mov	r10, #0
	str	r4, [fp, #-60]
	mov	r6, r8
	mov	r4, r7
	add	r5, r5, #244
	mov	r7, r10
	mov	r9, r3
	ldr	r10, [fp, #-52]
	b	.L1266
.L1264:
	strb	r2, [r6, #1630]
	ldr	r2, [r5]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r6, #1631]
	ldr	r2, [r5]
	ldr	r2, [r2, #12]
	str	r2, [r6, #1656]
.L1265:
	ldr	r2, [r4, #248]
	add	r7, r7, #1
	add	r5, r5, #4
	add	r6, r6, #36
	cmp	r2, r7
	bls	.L1332
.L1266:
	ldr	r2, [r5]
	ldr	r0, [r9, #1840]
	ldr	r2, [r2, #36]
	ldr	r1, [r2, #544]
	bl	FSP_GetLogicFs
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldr	r2, [r2, #580]
	str	r2, [r6, #1636]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r6, #1625]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r10
	beq	.L1263
	cmp	r0, #0
	ldrne	r2, [r0, #24]
	ldrne	r0, [r2, #36]
.L1263:
	str	r0, [r6, #1640]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldr	r2, [r2, #584]
	str	r2, [r6, #1644]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldr	r2, [r2, #560]
	str	r2, [r6, #1632]
	ldr	r2, [r5]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r6, #1624]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldrb	r2, [r2, #592]	@ zero_extendqisi2
	strb	r2, [r6, #1626]
	ldr	r2, [r5]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1264
	strb	r2, [r6, #1628]
	ldr	r2, [r5]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r6, #1629]
	ldr	r2, [r5]
	ldr	r2, [r2, #12]
	str	r2, [r6, #1652]
	b	.L1265
.L1332:
	mov	r7, r4
	ldr	r4, [fp, #-60]
	mov	r3, r9
.L1267:
	ldrb	r2, [r7, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1333
.L1255:
	add	r1, r4, #26880
	add	r2, r8, #3920
	add	ip, r8, #4048
	add	r1, r1, #112
	add	r2, r2, #4
	add	ip, ip, #4
.L1272:
	ldr	r0, [r1, #4]!
	str	r0, [r2, #4]!
	cmp	r2, ip
	bne	.L1272
	add	r2, r4, #16384
	ldrb	r1, [r2, #1214]	@ zero_extendqisi2
	cmp	r1, #0
	str	r1, [r3, #1096]
	ldr	r2, [r2, #1256]
	str	r2, [r3, #1100]
	beq	.L1273
	ldrb	r3, [r7, #208]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1274
.L1273:
	cmp	r2, #1
	beq	.L1334
.L1275:
	ldr	r3, [fp, #-48]
	mov	r2, #0
	ldr	r1, [r4, #368]
	add	r3, r3, #14336
	add	r3, r3, #40
	str	r1, [r4, r3, asl #2]
	str	r2, [r4, #368]
.L1222:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1331:
	str	r2, [r1, #616]
	ldr	r2, [r6, #3496]
	ldr	r1, [r8, #32]
	str	r1, [r2, #620]
	b	.L1238
.L1241:
	ldr	r1, [r0, #544]
	ldr	r0, [r3, #1840]
	str	r3, [fp, #-52]
	bl	FSP_GetLogicFs
	ldr	r3, [fp, #-52]
	subs	r2, r0, #0
	movweq	r3, #5907
	beq	.L1326
	ldr	r2, [r2, #24]
	ldr	r2, [r2, #36]
	str	r2, [fp, #-52]
	b	.L1240
.L1330:
	ldr	r1, [lr, #44]
	strb	r1, [r8, #4]
	b	.L1234
.L1223:
	add	r2, r0, #12288
	add	r7, r0, #20480
	mov	lr, #2208
	mov	r9, #4000
	ldr	r0, [r2, #1304]
	ldr	ip, [r7, #216]
	ldr	r1, [r2, #1300]
	mla	lr, lr, ip, r0
	ldr	r0, [lr, #28]
	mla	r9, r9, r0, r1
	b	.L1224
.L1252:
	ldr	r1, [r7, #248]
	cmp	r1, #0
	beq	.L1260
	add	r6, r4, #26880
	str	r4, [fp, #-64]
	ldr	r4, [fp, #-52]
	add	r6, r6, #244
	mov	r5, r8
	str	r8, [fp, #-60]
	mov	r10, r2
	mov	r8, r7
	mov	r9, r3
	mov	r7, r2
.L1259:
	ldr	r1, [r6]
	ldr	r0, [r9, #1840]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #544]
	bl	FSP_GetLogicFs
	ldr	r1, [r6]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #580]
	str	r1, [r5, #1636]
	ldr	r1, [r6]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r5, #1625]
	ldr	r1, [r6]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1258
	cmp	r0, #0
	ldrne	r1, [r0, #24]
	ldrne	r0, [r1, #36]
.L1258:
	str	r0, [r5, #1640]
	add	r7, r7, #1
	ldr	r1, [r6]
	add	r5, r5, #36
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #584]
	str	r1, [r5, #1608]
	ldr	r1, [r6]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #560]
	str	r1, [r5, #1596]
	ldr	r1, [r6]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r5, #1591]
	ldr	r1, [r6]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r5, #1590]
	ldr	r1, [r6]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #604]
	str	r1, [r5, #1612]
	ldr	r1, [r6]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #644]
	str	r1, [r5, #1616]
	ldr	r1, [r6], #4
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #684]
	strb	r10, [r5, #1588]
	str	r1, [r5, #1620]
	ldr	r1, [r8, #248]
	cmp	r1, r7
	bhi	.L1259
	mov	r7, r8
	ldr	r4, [fp, #-64]
	ldr	r8, [fp, #-60]
	mov	r3, r9
.L1260:
	ldrb	r2, [r7, #208]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1255
	ldr	r2, [r7, #252]
	cmp	r2, #0
	beq	.L1255
	add	r9, r4, #27136
	str	r4, [fp, #-60]
	ldr	r4, [fp, #-56]
	mov	r10, #0
	add	r9, r9, #120
	mov	r6, r10
	mov	r5, r8
	str	r8, [fp, #-52]
	mov	r8, r7
	mov	r7, r10
	mov	r10, r3
.L1262:
	ldr	r1, [r9]
	ldr	r0, [r10, #1840]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #544]
	bl	FSP_GetLogicFs
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #580]
	str	r1, [r5, #2788]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r5, #2777]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1261
	cmp	r0, #0
	ldrne	r1, [r0, #24]
	ldrne	r0, [r1, #36]
.L1261:
	str	r0, [r5, #1640]
	add	r7, r7, #1
	ldr	r1, [r9]
	add	r5, r5, #36
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #584]
	str	r1, [r5, #2760]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #560]
	str	r1, [r5, #2748]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r5, #2743]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r5, #2742]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #604]
	str	r1, [r5, #2764]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #644]
	str	r1, [r5, #2768]
	ldr	r1, [r9], #4
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #684]
	strb	r6, [r5, #2740]
	str	r1, [r5, #2772]
	ldr	r1, [r8, #252]
	cmp	r1, r7
	bhi	.L1262
	mov	r7, r8
	ldr	r4, [fp, #-60]
	ldr	r8, [fp, #-52]
	mov	r3, r10
	b	.L1255
.L1247:
	ldr	r1, [r0, #544]
	ldr	r0, [r3, #1840]
	str	r3, [fp, #-56]
	bl	FSP_GetLogicFs
	ldr	r3, [fp, #-56]
	subs	r2, r0, #0
	beq	.L1335
	ldr	r2, [r2, #24]
	ldr	r2, [r2, #36]
	str	r2, [fp, #-56]
	b	.L1246
.L1334:
	ldrb	r3, [r7, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1275
.L1274:
	ldr	r3, [r7, #268]
	add	r6, r4, #20736
	add	ip, r4, #21504
	add	lr, r4, #20992
	add	r1, r4, #21760
	mov	r5, r6
	str	r3, [r8, #80]
	mov	r0, ip
	ldr	r9, [r7, #272]
	add	r6, r6, #16
	add	r5, r5, #144
	add	lr, lr, #16
	add	ip, ip, #16
	add	r0, r0, #144
	add	r1, r1, #16
	mov	r10, r8
	mov	r3, r8
	mov	r2, #0
	str	r8, [fp, #-52]
	str	r9, [r10, #84]!
.L1276:
	ldr	r9, [r6, #4]!
	add	r2, r2, #1
	add	r3, r3, #4
	str	r9, [r10, #4]!
	ldr	r9, [r5, #4]!
	str	r9, [r3, #212]
	ldr	r9, [lr, #4]!
	str	r9, [r3, #340]
	ldr	r9, [ip, #4]!
	str	r9, [r3, #852]
	ldr	r9, [r0, #4]!
	str	r9, [r3, #980]
	ldr	r9, [r1, #4]!
	str	r9, [r3, #1108]
	ldr	r9, [r7, #260]
	cmp	r9, r2
	bcs	.L1276
	ldrb	r3, [r7, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1275
	add	lr, r4, #21248
	add	r1, r4, #22016
	add	r5, r4, #20992
	add	r0, r4, #21760
	ldr	r6, [fp, #-52]
	mov	ip, lr
	mov	r2, r1
	add	r8, r8, #468
	add	r5, r5, #144
	add	lr, lr, #16
	add	ip, ip, #144
	add	r0, r0, #144
	add	r1, r1, #16
	add	r2, r2, #144
	mov	r3, #0
.L1277:
	ldr	r9, [r5, #4]!
	add	r3, r3, #1
	add	r6, r6, #4
	str	r9, [r8, #4]!
	ldr	r9, [lr, #4]!
	str	r9, [r6, #596]
	ldr	r9, [ip, #4]!
	str	r9, [r6, #724]
	ldr	r9, [r0, #4]!
	str	r9, [r6, #1236]
	ldr	r9, [r1, #4]!
	str	r9, [r6, #1364]
	ldr	r9, [r2, #4]!
	str	r9, [r6, #1492]
	ldr	r9, [r7, #264]
	cmp	r9, r3
	bcs	.L1277
	b	.L1275
.L1333:
	ldr	r2, [r7, #252]
	cmp	r2, #0
	beq	.L1255
	add	r5, r4, #27136
	mov	r9, #0
	str	r4, [fp, #-52]
	mov	r6, r8
	mov	r4, r7
	add	r5, r5, #120
	mov	r7, r9
	mov	r10, r3
	ldr	r9, [fp, #-56]
	b	.L1271
.L1269:
	strb	r2, [r6, #2782]
	ldr	r2, [r5]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r6, #2783]
	ldr	r2, [r5]
	ldr	r2, [r2, #12]
	str	r2, [r6, #2808]
.L1270:
	ldr	r2, [r4, #252]
	add	r7, r7, #1
	add	r5, r5, #4
	add	r6, r6, #36
	cmp	r2, r7
	bls	.L1336
.L1271:
	ldr	r2, [r5]
	ldr	r0, [r10, #1840]
	ldr	r2, [r2, #36]
	ldr	r1, [r2, #544]
	bl	FSP_GetLogicFs
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldr	r2, [r2, #580]
	str	r2, [r6, #2788]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r6, #2777]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r9
	beq	.L1268
	cmp	r0, #0
	ldrne	r2, [r0, #24]
	ldrne	r0, [r2, #36]
.L1268:
	str	r0, [r6, #2792]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldr	r2, [r2, #584]
	str	r2, [r6, #2796]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldr	r2, [r2, #560]
	str	r2, [r6, #2784]
	ldr	r2, [r5]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r6, #2776]
	ldr	r2, [r5]
	ldr	r2, [r2, #36]
	ldrb	r2, [r2, #592]	@ zero_extendqisi2
	strb	r2, [r6, #2778]
	ldr	r2, [r5]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1269
	strb	r2, [r6, #2780]
	ldr	r2, [r5]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r6, #2781]
	ldr	r2, [r5]
	ldr	r2, [r2, #12]
	str	r2, [r6, #2804]
	b	.L1270
.L1336:
	mov	r7, r4
	mov	r3, r10
	ldr	r4, [fp, #-52]
	b	.L1255
.L1278:
	str	r9, [fp, #-52]
	b	.L1240
.L1279:
	str	lr, [fp, #-56]
	b	.L1246
.L1335:
	movw	r3, #5928
.L1326:
	ldr	r2, .L1337
	mov	r1, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L1338:
	.align	2
.L1337:
	.word	.LC39
	UNWIND(.fnend)
	.size	WriteSliceMsg, .-WriteSliceMsg
	.align	2
	.global	H264_GetPicStreamSize
	.type	H264_GetPicStreamSize, %function
H264_GetPicStreamSize:
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
	add	r0, r0, #57344
	ldr	r2, [r0, #1620]
	cmp	r2, #0
	beq	.L1342
	mov	r0, #0
.L1341:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1341
	ldmfd	sp, {fp, sp, pc}
.L1342:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_GetPicStreamSize, .-H264_GetPicStreamSize
	.align	2
	.global	SliceCheck
	.type	SliceCheck, %function
SliceCheck:
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
	ldr	r1, .L1355
	add	r4, r0, #20480
	add	r6, r0, #57344
	mov	r5, r0
	bl	ue_v
	str	r0, [r4, #256]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L1353
	cmp	r0, #1048576
	bcs	.L1354
	add	r2, r5, #12288
	ldr	r1, [r2, #1276]
	ldr	r3, [r2, #1280]
	mul	r3, r3, r1
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1353
	mov	r0, r5
	ldr	r1, .L1355+4
	bl	ue_v
	ldr	r2, .L1355+8
	movw	r1, #6330
	mov	r3, r0
	mov	r5, r0
	mov	r0, #17
	bl	dprint_normal
	ldr	r0, [r6, #1780]
	cmp	r0, #0
	bne	.L1353
	cmp	r5, #9
	bhi	.L1349
	mov	r1, #1
	movw	r3, #297
	mov	r2, r1, asl r5
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L1350
	ands	r0, r2, #660
	bne	.L1351
	tst	r2, #66
	beq	.L1349
	strb	r1, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1350:
	strb	r0, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1349:
	mov	r3, r5
	ldr	r2, .L1355+12
	movw	r1, #6355
	mov	r0, #1
	bl	dprint_normal
.L1353:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1351:
	mov	r0, r3
	mov	r3, #2
	strb	r3, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1354:
	ldr	r2, .L1355+16
	movw	r1, #6317
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1356:
	.align	2
.L1355:
	.word	.LC40
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC41
	UNWIND(.fnend)
	.size	SliceCheck, .-SliceCheck
	.align	2
	.global	PPSSPSCheck
	.type	PPSSPSCheck, %function
PPSSPSCheck:
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
	add	r5, r0, #20480
	mov	r4, r0
	add	r4, r4, #12288
	ldr	r2, .L1363
	movw	r1, #6368
	ldr	r3, [r5, #216]
	mov	r0, #17
	bl	dprint_normal
	ldr	r1, [r4, #1304]
	ldr	r3, [r5, #216]
	mov	r2, #2208
	mla	r2, r2, r3, r1
	ldrb	r1, [r2, #19]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1361
	ldr	r3, [r2, #28]
	mov	r2, #4000
	ldr	r1, [r4, #1300]
	mla	r2, r2, r3, r1
	ldrb	r2, [r2, #23]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1362
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1361:
	ldr	r2, .L1363+4
	movw	r1, #6374
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1362:
	ldr	r2, .L1363+8
	movw	r1, #6383
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1364:
	.align	2
.L1363:
	.word	.LC45
	.word	.LC46
	.word	.LC47
	UNWIND(.fnend)
	.size	PPSSPSCheck, .-PPSSPSCheck
	.align	2
	.global	PPSSPSCheckTmpId
	.type	PPSSPSCheckTmpId, %function
PPSSPSCheckTmpId:
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
	ldr	r2, .L1373
	mov	r3, r1
	mov	r5, r1
	mov	r4, r0
	movw	r1, #6396
	mov	r0, #17
	bl	dprint_normal
	add	r0, r4, #12288
	mov	r3, #2208
	ldr	r2, [r0, #1304]
	mla	r3, r3, r5, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1370
	ldr	r2, [r0, #1288]
	ldr	r3, [r3, #28]
	sub	r2, r2, #1
	cmp	r3, r2
	bhi	.L1371
	ldr	r1, [r0, #1300]
	mov	r2, #4000
	mla	r2, r2, r3, r1
	ldrb	r2, [r2, #23]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1372
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1370:
	mov	r3, r5
	ldr	r2, .L1373+4
	movw	r1, #6402
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1371:
	ldr	r2, .L1373+8
	movw	r1, #6408
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1372:
	ldr	r2, .L1373+12
	movw	r1, #6417
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1374:
	.align	2
.L1373:
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	UNWIND(.fnend)
	.size	PPSSPSCheckTmpId, .-PPSSPSCheckTmpId
	.align	2
	.global	IsNewPic
	.type	IsNewPic, %function
IsNewPic:
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
	add	r2, r0, #20480
	add	lr, r0, #12288
	ldr	ip, [r2, #1852]
	ldr	r1, [lr, #1344]
	ldr	r3, [r2, #1856]
	ldr	r4, [r2, #216]
	ldr	r5, [r2, #1864]
	cmp	r3, r4
	cmpeq	ip, r1
	ldr	r3, [r2, #224]
	ldrb	r4, [r2, #1848]	@ zero_extendqisi2
	ldrb	ip, [r2, #209]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r5, r3
	moveq	r3, r1
	orrne	r3, r1, #1
	cmp	r4, ip
	orrne	r3, r3, #1
	cmp	r4, #0
	cmpne	ip, #0
	beq	.L1377
	ldrb	ip, [r2, #1849]	@ zero_extendqisi2
	ldrb	r1, [r2, #210]	@ zero_extendqisi2
	cmp	ip, r1
	orrne	r3, r3, #1
.L1377:
	ldr	r1, [r2, #1860]
	ldr	ip, [r2, #236]
	cmp	r1, ip
	moveq	r1, #0
	beq	.L1378
	cmp	ip, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
.L1378:
	ldrb	ip, [r2, #1850]	@ zero_extendqisi2
	ldrb	r4, [r2, #211]	@ zero_extendqisi2
	cmp	ip, r4
	orrne	r3, r3, #1
	cmp	r4, #5
	cmpeq	ip, #5
	orr	r3, r3, r1
	beq	.L1386
.L1379:
	ldr	r1, [lr, #3508]
	cmp	r1, #0
	bne	.L1380
	add	r0, r0, #16384
	ldr	r1, [r2, #1872]
	ldr	ip, [r2, #1876]
	ldr	lr, [r0, #3424]
	ldr	r0, [r0, #3420]
	cmp	r1, r0
	cmpeq	ip, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r3, r3, r1
.L1381:
	ldr	r4, [r2, #256]
	movw	r1, #6460
	ldr	r2, .L1387
	mov	r0, #17
	cmp	r4, #0
	movne	r4, r3
	orreq	r4, r3, #1
	mov	r3, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1380:
	cmp	r1, #1
	bne	.L1381
	add	r0, r0, #16384
	ldr	r1, [r2, #1880]
	ldr	ip, [r2, #1884]
	ldr	lr, [r0, #3472]
	ldr	r0, [r0, #3468]
	cmp	r1, r0
	cmpeq	ip, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r3, r3, r1
	b	.L1381
.L1386:
	ldr	ip, [r2, #1868]
	ldr	r1, [r2, #244]
	cmp	ip, r1
	orrne	r3, r3, #1
	b	.L1379
.L1388:
	.align	2
.L1387:
	.word	.LC52
	UNWIND(.fnend)
	.size	IsNewPic, .-IsNewPic
	.align	2
	.global	ref_pic_list_reordering
	.type	ref_pic_list_reordering, %function
ref_pic_list_reordering:
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
	add	r5, r0, #20480
	add	r3, r0, #12288
	mov	lr, #2208
	ldr	r1, [r5, #216]
	mov	ip, #4000
	ldr	r2, [r3, #1304]
	add	r8, r0, #16384
	ldr	r3, [r3, #1300]
	mov	r4, r0
	mov	r0, #0
	mov	r7, #1
	mla	r2, lr, r1, r2
	ldr	r2, [r2, #28]
	strb	r0, [r8, #3512]
	strb	r0, [r8, #3513]
	mla	r3, ip, r2, r3
	ldrb	r1, [r5, #209]	@ zero_extendqisi2
	cmp	r1, r0
	ldr	r3, [r3, #2196]
	addne	r3, r3, #5
	addeq	r3, r3, #4
	mov	r7, r7, asl r3
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	addhi	r6, r4, #57344
	bls	.L1443
.L1442:
	ldr	r2, [r6, #1780]
.L1408:
	adds	r0, r2, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1440:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1443:
	ldr	r1, .L1448
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3512]
	cmp	r0, #0
	beq	.L1441
	ldr	r3, [r5, #260]
	cmn	r3, #2
	beq	.L1422
	add	r10, r4, #19712
	add	r6, r4, #57344
	add	r10, r10, #184
	mov	r9, #0
	b	.L1405
.L1400:
	cmp	r0, #2
	beq	.L1444
.L1403:
	ldr	r3, [r5, #260]
	add	r3, r3, #2
	cmp	r3, r9
	bls	.L1445
.L1405:
	ldr	r1, .L1448+4
	mov	r0, r4
	bl	ue_v
	add	r9, r9, #1
	cmp	r0, #3
	str	r0, [r10, #4]!
	ldr	r3, [r6, #1780]
	bhi	.L1396
	cmp	r3, #0
	bne	.L1396
	cmp	r0, #3
	beq	.L1399
	cmp	r0, #1
	bhi	.L1400
	ldr	r1, .L1448+8
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r10, #264]
	ldr	r3, [r6, #1780]
	bls	.L1402
	cmp	r3, #0
	beq	.L1403
.L1402:
	str	r3, [sp]
	movw	r1, #6512
	mov	r3, r0
	ldr	r2, .L1448+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1440
.L1444:
	ldr	r1, .L1448+16
	mov	r0, r4
	bl	ue_v
	str	r0, [r10, #528]
	b	.L1403
.L1441:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	add	r6, r4, #57344
.L1392:
	cmp	r3, #1
	bne	.L1442
	ldr	r1, .L1448+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3513]
	cmp	r0, #0
	beq	.L1442
	ldr	r3, [r5, #264]
	cmn	r3, #2
	beq	.L1442
	add	r9, r4, #19968
	mov	r8, #0
	add	r9, r9, #60
	b	.L1420
.L1419:
	add	r8, r8, #1
	cmp	r8, r3
	bcs	.L1442
.L1420:
	ldr	r1, .L1448+24
	mov	r0, r4
	bl	ue_v
	cmp	r0, #3
	str	r0, [r9, #4]!
	ldr	r2, [r6, #1780]
	bhi	.L1412
	cmp	r2, #0
	bne	.L1412
	cmp	r0, #3
	beq	.L1408
	cmp	r0, #1
	bls	.L1446
	cmp	r0, #2
	beq	.L1447
	ldr	r3, [r5, #264]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1419
.L1421:
	ldr	r2, .L1448+28
	movw	r1, #6572
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1446:
	ldr	r1, .L1448+32
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r9, #264]
	ldr	r3, [r6, #1780]
	bls	.L1416
	cmp	r3, #0
	bne	.L1416
.L1417:
	ldr	r3, [r5, #264]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1419
	ldr	r2, [r9]
	cmp	r2, #3
	beq	.L1419
	b	.L1421
.L1447:
	ldr	r1, .L1448+36
	mov	r0, r4
	bl	ue_v
	str	r0, [r9, #524]
	b	.L1417
.L1399:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	b	.L1392
.L1396:
	str	r3, [sp]
	movw	r1, #6496
	mov	r3, r0
	ldr	r2, .L1448+40
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1440
.L1412:
	str	r2, [sp]
	mov	r3, r0
	ldr	r2, .L1448+44
	movw	r1, #6544
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1440
.L1445:
	cmp	r9, r3
	bne	.L1399
.L1394:
	add	r3, r3, #4928
	add	r3, r3, #46
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L1441
	ldr	r2, .L1448+48
	movw	r1, #6525
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1440
.L1416:
	str	r3, [sp]
	movw	r1, #6560
	mov	r3, r0
	ldr	r2, .L1448+52
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1440
.L1422:
	mov	r3, #0
	b	.L1394
.L1449:
	.align	2
.L1448:
	.word	.LC53
	.word	.LC54
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC60
	.word	.LC61
	.word	.LC66
	.word	.LC63
	.word	.LC65
	.word	.LC55
	.word	.LC62
	.word	.LC59
	.word	.LC64
	UNWIND(.fnend)
	.size	ref_pic_list_reordering, .-ref_pic_list_reordering
	.align	2
	.global	pred_weight_table
	.type	pred_weight_table, %function
pred_weight_table:
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
	add	r3, r0, #12288
	add	r6, r0, #20480
	mov	r10, #2208
	ldr	r2, [r3, #1304]
	mov	r7, #4000
	ldr	r1, [r6, #216]
	mov	r5, r0
	ldr	r3, [r3, #1300]
	mov	r4, #1
	mla	r2, r10, r1, r2
	ldr	r1, .L1480
	str	r2, [fp, #-48]
	ldr	r2, [r2, #28]
	mla	r7, r7, r2, r3
	bl	ue_v
	str	r0, [r6, #268]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #40]
	cmp	r9, #0
	bne	.L1474
.L1451:
	cmp	r0, #7
	bhi	.L1454
	ldr	r3, [r6, #272]
	cmp	r3, #7
	bhi	.L1454
	add	r3, r5, #57344
	str	r3, [fp, #-52]
	ldr	r3, [r3, #1780]
	cmp	r3, #0
	addeq	r10, r5, #20736
	moveq	r4, r3
	addeq	r10, r10, #148
	beq	.L1462
	b	.L1453
.L1458:
	ldr	r3, [r7, #40]
	cmp	r3, #0
	bne	.L1475
.L1459:
	str	r3, [r10]
	str	r3, [r10, #768]
	str	r3, [r10, #128]
	str	r3, [r10, #896]
.L1461:
	ldr	r3, [r6, #260]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r3, r4
	bcc	.L1476
.L1462:
	ldr	r1, .L1480+4
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1458
	ldr	r1, .L1480+8
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L1459
.L1475:
	ldr	r1, .L1480+16
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1477
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1461
.L1476:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1463
.L1464:
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #1780]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1456:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1477:
	ldr	r1, .L1480+20
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+24
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1461
.L1474:
	ldr	r1, .L1480+28
	mov	r0, r5
	bl	ue_v
	mov	r3, r0
	ldr	r0, [r6, #268]
	mov	r9, r4, asl r3
	str	r3, [r6, #272]
	b	.L1451
.L1463:
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1464
	add	r10, r5, #21248
	mov	r4, #0
	add	r10, r10, #20
	b	.L1470
.L1466:
	ldr	r3, [r7, #40]
	cmp	r3, #0
	bne	.L1478
.L1467:
	str	r3, [r10]
	str	r3, [r10, #768]
	str	r3, [r10, #128]
	str	r3, [r10, #896]
.L1469:
	ldr	r3, [r6, #264]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r3, r4
	bcc	.L1464
.L1470:
	ldr	r1, .L1480+32
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1466
	ldr	r1, .L1480+36
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+40
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L1467
.L1478:
	ldr	r1, .L1480+44
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1479
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1469
.L1454:
	add	r5, r5, #57344
	ldr	r3, [r5, #1780]
.L1453:
	ldr	r2, .L1480+48
	movw	r1, #6605
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1456
.L1479:
	ldr	r1, .L1480+52
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+56
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+52
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1480+56
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1469
.L1481:
	.align	2
.L1480:
	.word	.LC67
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC68
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC69
	.word	.LC80
	.word	.LC81
	UNWIND(.fnend)
	.size	pred_weight_table, .-pred_weight_table
	.align	2
	.global	DecMMCO
	.type	DecMMCO, %function
DecMMCO:
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
	mov	r9, r0
	moveq	r6, #100
	beq	.L1494
	add	r8, r0, #24576
	mov	r10, #0
	b	.L1485
.L1517:
	ldr	r1, .L1524
	mov	r0, r9
	bl	ue_v
	cmp	r4, #2
	beq	.L1515
.L1496:
	cmp	r4, #6
	orreq	r5, r5, #1
	cmp	r5, #0
	bne	.L1499
	cmp	r4, #4
	beq	.L1516
.L1500:
	cmp	r4, #6
	bhi	.L1501
.L1497:
	add	r3, r9, #57344
	ldr	r3, [r3, #1780]
	cmp	r3, #0
	bne	.L1501
	cmp	r4, #0
	beq	.L1503
.L1502:
	subs	r6, r6, #1
	beq	.L1504
.L1494:
	ldr	r1, .L1524+4
	mov	r0, r9
	bl	ue_v
	bic	r3, r0, #2
	sub	r5, r0, #3
	clz	r5, r5
	cmp	r3, #1
	mov	r4, r0
	mov	r5, r5, lsr #5
	beq	.L1517
	cmp	r4, #2
	bne	.L1496
.L1515:
	ldr	r1, .L1524+8
	mov	r0, r9
	bl	ue_v
	cmp	r5, #0
	beq	.L1497
.L1499:
	ldr	r1, .L1524+12
	mov	r0, r9
	bl	ue_v
	cmp	r4, #4
	bne	.L1500
.L1516:
	ldr	r1, .L1524+16
	mov	r0, r9
	bl	ue_v
	add	r3, r9, #57344
	ldr	r3, [r3, #1780]
	cmp	r3, #0
	beq	.L1502
.L1501:
	ldr	r2, .L1524+20
	movw	r1, #6795
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1522:
	ldr	r1, .L1524
	mov	r0, r9
	bl	ue_v
	ldr	r2, [r4, #8]
	cmp	r2, #2
	str	r0, [r4, #12]
	beq	.L1518
.L1488:
	cmp	r2, #3
	cmpne	r2, #6
	beq	.L1519
.L1489:
	cmp	r2, #4
	beq	.L1520
.L1490:
	cmp	r2, #6
	bhi	.L1491
.L1523:
	add	r3, r9, #57344
	ldr	r3, [r3, #1780]
	cmp	r3, #0
	bne	.L1491
	cmp	r2, #0
	add	r10, r10, #1
	beq	.L1503
	cmp	r10, #100
	beq	.L1521
.L1485:
	ldr	r1, .L1524+4
	mov	r0, r9
	ldr	r5, [r8, #1804]
	bl	ue_v
	mov	r6, r10, asl #2
	mov	r7, r10, asl #4
	add	r4, r6, r7
	movw	r3, #2004
	mla	r4, r3, r5, r4
	add	r4, r9, r4
	add	r4, r4, #22272
	add	r4, r4, #96
	bic	r1, r0, #2
	str	r0, [r4, #8]
	cmp	r1, #1
	mov	r2, r0
	beq	.L1522
	cmp	r2, #2
	bne	.L1488
.L1518:
	ldr	r1, .L1524+8
	mov	r0, r9
	bl	ue_v
	add	r3, r6, r7
	movw	r2, #2004
	mla	r3, r2, r5, r3
	add	r3, r9, r3
	add	r2, r3, #22272
	str	r0, [r2, #112]
	ldr	r2, [r2, #104]
	cmp	r2, #3
	cmpne	r2, #6
	bne	.L1489
.L1519:
	ldr	r1, .L1524+12
	mov	r0, r9
	bl	ue_v
	add	r3, r6, r7
	movw	r2, #2004
	mla	r3, r2, r5, r3
	add	r3, r9, r3
	add	r2, r3, #22272
	str	r0, [r2, #116]
	ldr	r2, [r2, #104]
	cmp	r2, #4
	bne	.L1490
.L1520:
	ldr	r1, .L1524+16
	mov	r0, r9
	bl	ue_v
	add	r6, r6, r7
	movw	r7, #2004
	mla	r5, r7, r5, r6
	add	r5, r9, r5
	add	r3, r5, #22272
	add	r5, r3, #96
	ldr	r2, [r3, #104]
	cmp	r2, #6
	str	r0, [r3, #120]
	bls	.L1523
.L1491:
	ldr	r2, .L1524+20
	movw	r1, #6748
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1503:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1521:
	ldr	r2, .L1524+24
	movw	r1, #6712
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1504:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1525:
	.align	2
.L1524:
	.word	.LC84
	.word	.LC83
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC82
	UNWIND(.fnend)
	.size	DecMMCO, .-DecMMCO
	.align	2
	.global	dec_ref_pic_marking
	.type	dec_ref_pic_marking, %function
dec_ref_pic_marking:
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
	add	r9, r0, #57344
	add	r8, r0, #24576
	mov	r4, r0
	ldr	r3, [r9, #1852]
	ldr	r7, [r8, #1804]
	cmp	r3, #1
	movne	r5, r7
	beq	.L1550
.L1527:
	add	r3, r4, #20480
	ldrb	r10, [r3, #213]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L1529
	clz	r5, r5
	mov	r5, r5, lsr #5
	str	r5, [r8, #1804]
.L1537:
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1551
	ldr	r1, .L1555
	mov	r0, r4
	bl	u_1
	movw	r3, #2004
	mla	r5, r3, r5, r4
	add	r5, r5, #22272
	add	r5, r5, #96
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	bne	.L1531
.L1535:
	mov	r6, #0
.L1547:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1529:
	movw	r6, #2004
	mla	r6, r6, r5, r4
	add	r6, r6, #22272
	add	r6, r6, #96
	ldrb	r2, [r6, #4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1537
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1552
	ldr	r1, .L1555
	mov	r0, r4
	ldrb	r5, [r6, #7]	@ zero_extendqisi2
	bl	u_1
	cmp	r5, r0
	bne	.L1553
	ldrb	r3, [r6, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1535
	mov	r1, r10
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	DecMMCO
.L1531:
	mov	r0, r4
	mov	r1, #1
	bl	DecMMCO
	cmn	r0, #1
	mov	r6, r0
	movne	r3, #1
	movne	r6, #0
	strneb	r3, [r5, #4]
	bne	.L1547
	mov	r3, #0
	ldr	r2, .L1555+4
	strb	r3, [r5, #4]
	movw	r1, #6844
	str	r7, [r8, #1804]
	mov	r0, #1
	bl	dprint_normal
	b	.L1547
.L1552:
	ldr	r1, .L1555+8
	mov	r0, r4
	ldrb	r5, [r6, #5]	@ zero_extendqisi2
	bl	u_1
	cmp	r5, r0
	bne	.L1554
	mov	r0, r4
	ldr	r1, .L1555+12
	ldrb	r4, [r6, #6]	@ zero_extendqisi2
	bl	u_1
	cmp	r4, r0
	beq	.L1535
	ldr	r2, .L1555+16
	movw	r1, #6866
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_normal
	b	.L1547
.L1551:
	ldr	r1, .L1555+8
	mov	r0, r4
	bl	u_1
	movw	r3, #2004
	mla	r5, r3, r5, r4
	ldr	r1, .L1555+12
	mov	r6, #0
	add	r5, r5, #22272
	strb	r0, [r5, #101]
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #102]
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1550:
	add	r0, r0, #13504
	add	r0, r0, #24
	bl	BsResidBits
	cmp	r0, #15
	ble	.L1540
	ldr	r5, [r8, #1804]
	b	.L1527
.L1553:
	ldr	r2, .L1555+20
	movw	r1, #6875
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_normal
	ldr	lr, [r9, #1784]
	ldr	ip, [r9, #1820]
	movw	r1, #6877
	ldr	r3, [r9, #1804]
	mov	r0, #1
	ldr	r2, .L1555+24
	stmia	sp, {ip, lr}
	bl	dprint_normal
	b	.L1547
.L1554:
	ldr	r2, .L1555+28
	movw	r1, #6859
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_normal
	b	.L1547
.L1540:
	mvn	r6, #0
	b	.L1547
.L1556:
	.align	2
.L1555:
	.word	.LC91
	.word	.LC92
	.word	.LC89
	.word	.LC90
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC93
	UNWIND(.fnend)
	.size	dec_ref_pic_marking, .-dec_ref_pic_marking
	.align	2
	.global	ProcessSliceHeaderFirstPart
	.type	ProcessSliceHeaderFirstPart, %function
ProcessSliceHeaderFirstPart:
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
	ldr	r1, .L1631
	add	r5, r0, #12288
	mov	r6, r0
	bl	ue_v
	ldr	r3, [r5, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r10, r0
	bhi	.L1558
	add	r8, r6, #57344
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1558
	mov	r1, r0
	mov	r0, r6
	bl	PPSSPSCheckTmpId
	subs	r9, r0, #0
	bne	.L1622
	add	r4, r6, #20480
	mov	r7, #2208
	mov	r1, #4000
	str	r10, [r4, #216]
	ldr	r3, [r5, #1304]
	ldr	r2, [r5, #1300]
	mla	r7, r7, r10, r3
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	ldr	r3, [r7, #28]
	mla	r5, r1, r3, r2
	beq	.L1562
	ldr	r3, [r5, #3244]
	cmp	r3, #0
	beq	.L1562
.L1563:
	ldr	r1, [r5, #2196]
	mov	r0, r6
	ldr	r2, .L1631+4
	add	r1, r1, #4
	bl	u_v
	str	r0, [r4, #224]
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1620
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1623
.L1566:
	mov	r3, #0
	strb	r3, [r4, #209]
	strb	r3, [r4, #210]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1624
	ldr	r2, [r5, #3248]
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1590:
	ldrb	r2, [r5, #19]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1573
	strb	r2, [r4, #212]
.L1575:
	ldr	r2, [r4, #256]
	cmp	r2, r3
	bcs	.L1625
.L1576:
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1626
.L1578:
	add	r10, r6, #16384
	mov	r3, #0
	str	r3, [r10, #3420]
	str	r3, [r10, #3424]
	ldr	r3, [r5, #2200]
	cmp	r3, #0
	beq	.L1627
.L1582:
	mov	r3, #0
	str	r3, [r10, #3468]
	str	r3, [r10, #3472]
	ldr	r3, [r5, #2200]
	cmp	r3, #1
	beq	.L1628
.L1585:
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1620
	ldrb	r3, [r7, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1588
	ldr	r1, .L1631+8
	mov	r0, r6
	bl	ue_v
	cmp	r0, #0
	bne	.L1589
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1589
.L1588:
	mov	r0, r6
	bl	IsNewPic
	uxtb	r0, r0
	strb	r0, [r4, #213]
	cmp	r0, #0
	bne	.L1602
	ldr	r2, [r4, #256]
	ldr	r3, [r4, #1888]
	cmp	r2, r3
	bls	.L1629
.L1602:
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1562:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1563
	ldr	r2, .L1631+12
	movw	r1, #6924
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_normal
	b	.L1602
.L1573:
	mov	r2, #1
	strb	r2, [r4, #212]
.L1593:
	ldr	r2, [r4, #256]
	cmp	r2, r3, lsr #1
	bcc	.L1576
	ldr	r2, .L1631+16
	movw	r1, #6967
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_normal
	b	.L1602
.L1589:
	ldr	r2, .L1631+20
	movw	r1, #7028
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L1631+24
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1620
	mov	r3, #0
	ldr	r0, [r8, #1840]
	mov	r2, r3
	mov	r1, #21
	blx	r4
.L1620:
	mvn	r9, #0
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1624:
	ldr	r1, .L1631+28
	mov	r0, r6
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #209]
	cmp	r0, #0
	bne	.L1630
	ldr	r2, [r5, #3248]
	ldrb	ip, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1592
	mov	r3, r3, asl #1
	b	.L1590
.L1627:
	ldr	r1, [r5, #2204]
	mov	r0, r6
	ldr	r2, .L1631+32
	add	r1, r1, #4
	bl	u_v
	str	r0, [r10, #3420]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1582
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1582
	ldr	r1, .L1631+36
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3424]
	b	.L1582
.L1623:
	cmp	r0, #0
	str	r0, [r4, #220]
	beq	.L1566
	ldr	r2, .L1631+40
	movw	r1, #6937
	mov	r0, #1
	bl	dprint_normal
	b	.L1566
.L1628:
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1585
	ldr	r1, .L1631+44
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3468]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1585
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1585
	ldr	r1, .L1631+48
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3472]
	b	.L1585
.L1630:
	ldr	r1, .L1631+52
	mov	r0, r6
	bl	u_1
	strb	r0, [r4, #210]
	ldr	r2, [r5, #3248]
	ldrb	r0, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	cmp	r0, #0
	ldrb	r0, [r4, #209]	@ zero_extendqisi2
	mla	r3, r1, r3, r3
	moveq	r2, #2
	beq	.L1571
.L1592:
	mov	r2, #1
.L1571:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1590
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r4, #212]
	bne	.L1575
	b	.L1593
.L1626:
	ldr	r1, .L1631+56
	mov	r0, r6
	bl	ue_v
	cmp	r0, #65536
	str	r0, [r4, #244]
	bcs	.L1579
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	beq	.L1578
.L1579:
	ldr	r2, .L1631+60
	movw	r1, #6988
	mov	r0, #1
	bl	dprint_normal
	b	.L1578
.L1558:
	mov	r3, r10
	ldr	r2, .L1631+64
	movw	r1, #6906
	mvn	r9, #0
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1622:
	ldr	r2, .L1631+68
	mov	r1, #6912
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_normal
	b	.L1602
.L1625:
	ldr	r2, .L1631+72
	mov	r1, #6976
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_normal
	b	.L1602
.L1629:
	ldr	r2, .L1631+76
	movw	r1, #7039
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_normal
	b	.L1602
.L1632:
	.align	2
.L1631:
	.word	.LC97
	.word	.LC101
	.word	.LC113
	.word	.LC100
	.word	.LC105
	.word	.LC114
	.word	g_EventReportFunc
	.word	.LC103
	.word	.LC109
	.word	.LC110
	.word	.LC102
	.word	.LC111
	.word	.LC112
	.word	.LC104
	.word	.LC107
	.word	.LC108
	.word	.LC98
	.word	.LC99
	.word	.LC106
	.word	.LC115
	UNWIND(.fnend)
	.size	ProcessSliceHeaderFirstPart, .-ProcessSliceHeaderFirstPart
	.align	2
	.global	ProcessSliceHeaderSecondPart
	.type	ProcessSliceHeaderSecondPart, %function
ProcessSliceHeaderSecondPart:
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
	add	r6, r0, #12288
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r2, [r6, #1292]
	ldr	r3, [r4, #216]
	sub	r2, r2, #1
	cmp	r2, r3
	bcc	.L1634
	add	r8, r0, #57344
	ldr	r2, [r8, #1780]
	cmp	r2, #0
	bne	.L1634
	bl	PPSSPSCheck
	cmp	r0, #0
	bne	.L1716
	ldr	r2, [r4, #216]
	mov	r7, #2208
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldr	r9, [r6, #1304]
	mul	r7, r7, r2
	cmp	r3, #1
	add	r6, r9, r7
	beq	.L1717
.L1638:
	ldr	r2, [r6, #36]
	cmp	r3, #1
	str	r2, [r4, #260]
	ldr	r2, [r6, #40]
	str	r2, [r4, #264]
	bls	.L1718
	cmp	r3, #2
	beq	.L1665
.L1649:
	mov	r3, #32
	str	r3, [r4, #264]
.L1650:
	mov	r0, r5
	bl	ref_pic_list_reordering
	subs	r10, r0, #0
	bne	.L1719
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1652
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	moveq	r2, r3
	beq	.L1653
.L1652:
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L1720
.L1669:
	mov	r3, #0
	mov	r2, r3
.L1653:
	strb	r2, [r4, #215]
	movw	r1, #7134
	ldr	r2, .L1726
	mov	r0, #17
	bl	dprint_normal
	ldrb	r2, [r4, #215]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #268]
	cmp	r2, r3
	str	r3, [r4, #272]
	bne	.L1721
.L1654:
	ldr	r3, [r4, #236]
	cmp	r3, #0
	bne	.L1722
.L1655:
	mov	r3, #0
	str	r3, [r4, #1812]
	ldrb	r3, [r9, r7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1656
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1723
.L1656:
	ldr	r1, .L1726+4
	mov	r0, r5
	bl	se_v
	mov	r3, #0
	str	r3, [r4, #1820]
	str	r3, [r4, #1824]
	str	r3, [r4, #1828]
	str	r0, [r4, #1816]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1724
.L1685:
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1665:
	mov	r3, #32
	str	r3, [r4, #260]
	b	.L1649
.L1724:
	ldr	r1, .L1726+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1820]
	bhi	.L1659
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1659
	cmp	r0, #1
	beq	.L1685
	ldr	r1, .L1726+12
	mov	r0, r5
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1824]
	cmp	r3, #12
	bhi	.L1662
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1662
	mov	r0, r5
	ldr	r1, .L1726+16
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1828]
	cmp	r3, #12
	bhi	.L1664
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	beq	.L1685
.L1664:
	ldr	r2, .L1726+20
	movw	r1, #7206
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1721:
	mov	r0, r5
	bl	pred_weight_table
	cmp	r0, #0
	beq	.L1654
	ldr	r2, .L1726+24
	movw	r1, #7142
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1722:
	mov	r0, r5
	bl	dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1655
	ldr	r2, .L1726+28
	movw	r1, #7152
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1720:
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r3, r2
	bne	.L1669
	b	.L1653
.L1717:
	ldr	r1, .L1726+32
	mov	r0, r5
	bl	u_1
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	strb	r0, [r4, #214]
	b	.L1638
.L1718:
	ldr	r1, .L1726+36
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1640
	ldr	r3, [r4, #260]
.L1641:
	ldrb	r2, [r4, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1642
	cmp	r3, #15
	bhi	.L1643
	ldr	r3, [r4, #264]
	cmp	r3, #15
	bhi	.L1725
.L1644:
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	bne	.L1643
.L1645:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1665
	cmp	r3, #1
	bne	.L1649
	b	.L1650
.L1634:
	ldr	r2, .L1726+40
	movw	r1, #7053
	mvn	r10, #0
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1723:
	ldr	r1, .L1726+44
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1812]
	bhi	.L1657
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	beq	.L1656
.L1657:
	ldr	r2, .L1726+48
	movw	r1, #7166
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1642:
	cmp	r3, #31
	bhi	.L1646
	ldr	r3, [r4, #264]
	cmp	r3, #31
	bls	.L1647
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1647
.L1646:
	ldr	r2, .L1726+52
	movw	r1, #7107
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1647:
	ldr	r3, [r8, #1780]
	cmp	r3, #0
	beq	.L1645
	b	.L1646
.L1725:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1644
.L1643:
	ldr	r2, .L1726+56
	movw	r1, #7096
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1640:
	ldr	r1, .L1726+60
	mov	r0, r5
	bl	ue_v
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #260]
	bne	.L1641
	ldr	r1, .L1726+64
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #260]
	str	r0, [r4, #264]
	b	.L1641
.L1662:
	ldr	r2, .L1726+68
	movw	r1, #7197
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1659:
	ldr	r2, .L1726+72
	movw	r1, #7186
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1716:
	ldr	r2, .L1726+76
	movw	r1, #7059
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1719:
	ldr	r2, .L1726+80
	movw	r1, #7127
	mov	r0, #1
	mvn	r10, #0
	bl	dprint_normal
	b	.L1685
.L1727:
	.align	2
.L1726:
	.word	.LC123
	.word	.LC128
	.word	.LC129
	.word	.LC131
	.word	.LC133
	.word	.LC134
	.word	.LC124
	.word	.LC125
	.word	.LC116
	.word	.LC117
	.word	.LC98
	.word	.LC126
	.word	.LC127
	.word	.LC121
	.word	.LC120
	.word	.LC118
	.word	.LC119
	.word	.LC132
	.word	.LC130
	.word	.LC99
	.word	.LC122
	UNWIND(.fnend)
	.size	ProcessSliceHeaderSecondPart, .-ProcessSliceHeaderSecondPart
	.align	2
	.global	ExitSlice
	.type	ExitSlice, %function
ExitSlice:
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
	add	r3, r0, #20480
	add	lr, r0, #12288
	mov	r1, #2208
	mov	r7, #4000
	ldr	r2, [lr, #1304]
	ldr	ip, [r3, #216]
	ldr	r5, [lr, #1300]
	ldrb	r6, [r3, #209]	@ zero_extendqisi2
	mla	r1, r1, ip, r2
	cmp	r6, #0
	ldr	r4, [r3, #256]
	ldr	lr, [r3, #224]
	ldr	r2, [r1, #28]
	str	ip, [r3, #1856]
	ldr	ip, [r3, #236]
	mla	r2, r7, r2, r5
	ldr	r1, [r2, #36]
	str	r4, [r3, #1888]
	str	lr, [r3, #1864]
	str	r1, [r3, #1852]
	ldrneb	r1, [r3, #210]	@ zero_extendqisi2
	strb	r6, [r3, #1848]
	str	ip, [r3, #1860]
	strneb	r1, [r3, #1849]
	ldrb	r1, [r3, #211]	@ zero_extendqisi2
	cmp	r1, #5
	strb	r1, [r3, #1850]
	ldreq	r1, [r3, #244]
	streq	r1, [r3, #1868]
	ldr	r1, [r2, #2200]
	cmp	r1, #0
	bne	.L1731
	add	r1, r0, #16384
	ldr	ip, [r1, #3420]
	str	ip, [r3, #1872]
	ldr	r1, [r1, #3424]
	str	r1, [r3, #1876]
	ldr	r1, [r2, #2200]
.L1731:
	cmp	r1, #1
	addeq	r2, r0, #16384
	add	r0, r0, #57344
	ldreq	r1, [r2, #3468]
	streq	r1, [r3, #1880]
	ldreq	r2, [r2, #3472]
	streq	r2, [r3, #1884]
	ldr	r3, [r0, #1796]
	add	r3, r3, #1
	str	r3, [r0, #1796]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ExitSlice, .-ExitSlice
	.align	2
	.global	PicTypeStatistic
	.type	PicTypeStatistic, %function
PicTypeStatistic:
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
	add	r2, r0, #20480
	ldrb	r3, [r2, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1738
	bcc	.L1739
	cmp	r3, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r2, #211]	@ zero_extendqisi2
	add	r0, r0, #53248
	cmp	r3, #5
	beq	.L1748
.L1741:
	mov	r3, #0
	str	r3, [r0, #3536]
	ldmfd	sp, {fp, sp, pc}
.L1739:
	add	r0, r0, #53248
	ldr	r3, [r0, #3532]
	cmp	r3, #2
	movne	r3, #1
	strne	r3, [r0, #3532]
	b	.L1741
.L1738:
	add	r0, r0, #53248
	mov	r2, #2
	mov	r3, #0
	str	r2, [r0, #3532]
	str	r3, [r0, #3536]
	ldmfd	sp, {fp, sp, pc}
.L1748:
	mov	r3, #1
	str	r3, [r0, #3536]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	PicTypeStatistic, .-PicTypeStatistic
	.align	2
	.global	CalcStreamBits
	.type	CalcStreamBits, %function
CalcStreamBits:
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
	add	r3, r0, #16384
	mov	r4, r0
	ldrb	r3, [r3, #1212]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1750
	ldr	r2, [r0, #368]
	ldr	r3, [r2, #8]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #8]
	ldr	r2, [r0, #368]
	ldr	r3, [r2, #16]
	sub	r3, r3, #1
	str	r3, [r2, #16]
.L1750:
	ldr	r0, [r4, #368]
	ldrb	r6, [r0]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L1761
	mov	r3, #0
	mov	r2, r0
	mov	r5, r3
.L1752:
	add	r3, r3, #1
	ldr	r1, [r2, #44]
	cmp	r3, r6
	add	r2, r2, #28
	add	r5, r5, r1
	bne	.L1752
.L1751:
	mov	r7, r6, asl #5
	ldr	r1, [r0, #16]
	sub	r7, r7, r6, asl #2
	ldr	r3, [r0, #8]
	add	r0, r0, r7
	ldr	r2, .L1772
	str	r1, [sp, #8]
	movw	r1, #7323
	ldr	ip, [r0, #44]
	mov	r0, #8
	str	r5, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	ldr	ip, [r4, #368]
	mov	r3, r6
	ldr	r2, .L1772+4
	movw	r1, #7341
	mov	r0, #8
	ldrb	r6, [ip]	@ zero_extendqisi2
	mov	lr, r6, asl #5
	sub	r6, lr, r6, asl #2
	ldr	lr, [ip, #8]
	add	ip, ip, r6
	and	lr, lr, #7
	str	lr, [ip, #56]
	ldr	ip, [r4, #368]
	ldrb	r6, [ip]	@ zero_extendqisi2
	ldr	r8, [ip, #8]
	mov	lr, r6, asl #5
	sub	r6, lr, r6, asl #2
	add	ip, ip, r6
	ldr	lr, [ip, #48]
	add	lr, lr, r8, lsr #3
	rsb	lr, r5, lr
	str	lr, [ip, #60]
	ldr	ip, [r4, #368]
	ldrb	r6, [ip]	@ zero_extendqisi2
	mov	lr, r6, asl #5
	sub	r6, lr, r6, asl #2
	ldr	lr, [ip, #8]
	add	ip, ip, r6
	ldr	r6, [ip, #44]
	add	r5, r5, r6
	rsb	r5, lr, r5, lsl #3
	str	r5, [ip, #52]
	ldr	lr, [r4, #368]
	ldrb	r5, [lr]	@ zero_extendqisi2
	mov	ip, r5, asl #5
	sub	ip, ip, r5, asl #2
	add	ip, lr, ip
	ldr	lr, [ip, #60]
	ldr	r5, [ip, #56]
	and	lr, lr, #3
	add	lr, r5, lr, lsl #3
	str	lr, [ip, #56]
	ldr	lr, [r4, #368]
	ldrb	r5, [lr]	@ zero_extendqisi2
	mov	ip, r5, asl #5
	sub	ip, ip, r5, asl #2
	add	ip, lr, ip
	ldr	lr, [ip, #60]
	bic	lr, lr, #3
	str	lr, [ip, #60]
	ldr	ip, [r4, #368]
	add	r7, ip, r7
	ldrb	r5, [ip]	@ zero_extendqisi2
	mov	lr, r5, asl #5
	sub	lr, lr, r5, asl #2
	add	ip, ip, lr
	ldr	ip, [ip, #60]
	str	ip, [sp, #8]
	ldr	ip, [r7, #52]
	str	ip, [sp, #4]
	ldr	ip, [r7, #56]
	str	ip, [sp]
	bl	dprint_normal
	ldr	lr, [r4, #368]
	ldr	r3, [lr, #12]
	sub	r2, r3, #1
	cmp	r2, #1
	bhi	.L1771
	ldrb	r5, [lr]	@ zero_extendqisi2
	add	r1, r5, #1
	cmp	r3, r1
	movhi	r3, #1
	movls	r3, #0
	cmp	r1, #1
	movhi	r3, #0
	cmp	r3, #0
	beq	.L1754
	add	r5, r5, #2
	mov	r6, #0
.L1755:
	sub	ip, r5, #1
	ldr	r2, .L1772+8
	movw	r1, #7368
	mov	r0, #8
	mov	r7, ip, asl #5
	mov	r3, ip
	sub	ip, r7, ip, asl #2
	add	lr, lr, ip
	str	r6, [lr, #56]
	ldr	lr, [r4, #368]
	add	lr, lr, ip
	ldr	r7, [lr, #48]
	str	r7, [lr, #60]
	ldr	lr, [r4, #368]
	add	lr, lr, ip
	ldr	r7, [lr, #44]
	mov	r7, r7, asl #3
	str	r7, [lr, #52]
	ldr	lr, [r4, #368]
	add	lr, lr, ip
	ldr	r7, [lr, #60]
	ldr	r8, [lr, #56]
	and	r7, r7, #3
	add	r7, r8, r7, lsl #3
	str	r7, [lr, #56]
	ldr	lr, [r4, #368]
	add	lr, lr, ip
	ldr	r7, [lr, #60]
	bic	r7, r7, #3
	str	r7, [lr, #60]
	ldr	lr, [r4, #368]
	add	ip, lr, ip
	ldr	lr, [ip, #52]
	str	lr, [sp, #4]
	ldr	ip, [ip, #56]
	str	ip, [sp]
	bl	dprint_normal
	ldr	lr, [r4, #368]
	ldr	r3, [lr, #12]
	cmp	r5, #1
	cmpls	r5, r3
	add	r5, r5, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L1755
	sub	r2, r3, #1
.L1754:
	mov	r1, r2, asl #5
	ldr	r0, [lr, #16]
	sub	r2, r1, r2, asl #2
	add	lr, lr, r2
	ldr	r3, [lr, #52]
	rsb	r3, r0, r3
	str	r3, [lr, #52]
	ldr	lr, [r4, #368]
	ldrb	r1, [lr]	@ zero_extendqisi2
	ldr	ip, [lr, #12]
	cmp	r1, ip
	bcs	.L1749
	sxth	r3, r1
	add	r4, r4, #53248
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L1759:
	ldr	r2, [r3, #60]
	add	r1, r1, #1
	ldr	r0, [r4, #3560]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #3560]
	ldrcc	ip, [lr, #12]
	cmp	ip, r1
	bhi	.L1759
.L1749:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1771:
	ldr	r2, .L1772+12
	movw	r1, #7346
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_normal
.L1761:
	mov	r5, r6
	b	.L1751
.L1773:
	.align	2
.L1772:
	.word	.LC135
	.word	.LC136
	.word	.LC138
	.word	.LC137
	UNWIND(.fnend)
	.size	CalcStreamBits, .-CalcStreamBits
	.align	2
	.global	Scaling_List
	.type	Scaling_List, %function
Scaling_List:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r8, r3, #0
	str	r0, [fp, #-52]
	mov	r9, r1
	mov	r7, r2
	ble	.L1774
	mov	r0, #8
	ldr	r3, .L1783
	mov	r6, r0
	mov	r5, #0
	mov	r10, #255
	b	.L1780
.L1779:
	mov	ip, r4, lsr #2
	and	r2, r4, #3
	str	lr, [r9, r4, asl #2]
	add	r5, r5, #1
	ldr	lr, [r7, ip, asl #2]
	mov	r2, r2, asl #3
	uxtb	r1, r6
	cmp	r5, r8
	bic	lr, lr, r10, asl r2
	orr	r2, lr, r1, asl r2
	str	r2, [r7, ip, asl #2]
	beq	.L1774
.L1780:
	cmp	r8, #16
	mov	lr, r6
	ldreq	r2, .L1783+4
	ldrneb	r4, [r5, r3]	@ zero_extendqisi2
	ldreqb	r4, [r5, r2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1779
	ldr	r1, .L1783+8
	ldr	r0, [fp, #-52]
	str	r3, [fp, #-48]
	bl	se_v
	ldr	r3, [fp, #4]
	add	r0, r0, r6
	ands	r0, r0, #255
	moveq	r2, #1
	movne	r2, #0
	cmp	r4, #0
	movne	r1, #0
	andeq	r1, r2, #1
	cmp	r2, #0
	str	r1, [r3]
	movne	lr, r6
	moveq	lr, r0
	moveq	r6, r0
	ldr	r3, [fp, #-48]
	b	.L1779
.L1774:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1784:
	.align	2
.L1783:
	.word	.LANCHOR0+76
	.word	.LANCHOR0+60
	.word	.LC139
	UNWIND(.fnend)
	.size	Scaling_List, .-Scaling_List
	.align	2
	.global	ProcessPPS
	.type	ProcessPPS, %function
ProcessPPS:
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
	mov	r4, r1
	ldr	r1, .L1843
	mov	r5, r0
	bl	u_1
	add	r6, r5, #57344
	strb	r0, [r4]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L1834
	ldr	r1, .L1843+4
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #1]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L1834
	ldr	r1, .L1843+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	bne	.L1789
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	beq	.L1790
.L1789:
	ldr	r2, .L1843+12
	movw	r1, #7712
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L1843+16
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1834
	mov	r3, #0
	ldr	r0, [r6, #1840]
	mov	r2, r3
	mov	r1, #21
	blx	r4
	mvn	r0, #0
.L1787:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1797:
	ldr	r1, .L1843+20
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1843+24
	str	r0, [r4, #60]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #1
	beq	.L1798
.L1816:
	mov	r0, r5
	ldr	r1, .L1843+28
	bl	se_v
	add	r3, r0, #12
	str	r0, [r4, #56]
	cmp	r3, #24
	bhi	.L1799
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	beq	.L1817
.L1799:
	ldr	r2, .L1843+32
	movw	r1, #7850
	mov	r0, #1
	bl	dprint_normal
.L1834:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1790:
	ldr	r1, .L1843+36
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #36]
	bhi	.L1791
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L1791
	ldr	r1, .L1843+40
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #40]
	bhi	.L1793
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L1793
	ldr	r1, .L1843+44
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #2]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L1834
	ldr	r2, .L1843+48
	mov	r1, #2
	mov	r0, r5
	bl	u_v
	cmp	r0, #2
	str	r0, [r4, #44]
	bhi	.L1835
	ldr	r1, .L1843+52
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1843+56
	str	r0, [r4, #48]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1843+60
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1843+64
	str	r0, [r4, #52]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1843+68
	strb	r0, [r4, #3]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1843+72
	strb	r0, [r4, #4]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #17]
	cmp	r0, #0
	bne	.L1836
.L1796:
	ldr	r3, [r4, #52]
	add	r0, r5, #13504
	mov	r7, #0
	add	r0, r0, #24
	str	r7, [r4, #60]
	str	r3, [r4, #56]
	strb	r7, [r4, #18]
	bl	BsResidBits
	ldr	r3, [r5, #368]
	ldr	r3, [r3, #16]
	add	r3, r3, #3
	cmp	r0, r3
	bcs	.L1797
.L1817:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1836:
	ldr	r2, .L1843+76
	movw	r1, #7757
	mov	r0, #1
	bl	dprint_normal
	b	.L1796
.L1791:
	ldr	r2, .L1843+80
	movw	r1, #7721
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1787
.L1793:
	ldr	r2, .L1843+84
	movw	r1, #7730
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1787
.L1798:
	add	r3, r4, #4
	str	r6, [fp, #-80]
	sub	r9, fp, #72
	add	r8, r4, #1984
	add	r10, r4, #64
	mov	r6, r3
	b	.L1807
.L1840:
	ldr	r3, [ip, #1300]
	ldr	ip, [r4, #28]
	mla	r3, lr, ip, r3
	ldrb	ip, [r3, #25]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L1837
	ldr	r3, .L1843+88
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L1843+92
	ldr	r3, [r3, #52]
	blx	r3
.L1802:
	add	r7, r7, #1
	add	r8, r8, #16
	cmp	r7, #6
	add	r10, r10, #64
	beq	.L1838
.L1807:
	ldr	r1, .L1843+96
	mov	r0, r5
	bl	u_1
	clz	r1, r7
	add	ip, r5, #12288
	mov	lr, #4000
	mov	r2, #16
	mov	r1, r1, lsr #5
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r8
	str	r3, [r9, #4]!
	strb	r3, [r6, #1]!
	beq	.L1839
	cmp	r7, #0
	cmpne	r7, #3
	beq	.L1840
	ldr	r3, .L1843+92
	mov	r2, #16
	sub	r1, r8, #16
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1802
.L1838:
	ldr	r6, [fp, #-80]
	add	r3, r4, #448
	add	r2, r5, #12288
	add	r9, r4, #2080
	sub	r8, fp, #76
	add	r10, r4, #11
	str	r5, [fp, #-80]
	mov	r7, #0
	str	r6, [fp, #-84]
	mov	r5, r2
	mov	r6, r3
.L1815:
	ldr	r2, [r4, #60]
	mov	r3, #0
	cmp	r2, #1
	strne	r3, [r8]
	strneb	r3, [r10]
	beq	.L1841
.L1810:
	ldr	r1, [r4, #28]
	mov	ip, #4000
	ldr	r3, [r5, #1300]
	mov	r0, r9
	mov	r2, #64
	mla	r3, ip, r1, r3
	ldrb	r1, [r3, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1842
	ldr	r1, .L1843+100
	cmp	r7, #0
	ldr	r3, .L1843+92
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L1811:
	add	r7, r7, #1
	add	r9, r9, #64
	cmp	r7, #2
	add	r6, r6, #256
	add	r8, r8, #4
	add	r10, r10, #1
	bne	.L1815
	ldr	r5, [fp, #-80]
	ldr	r6, [fp, #-84]
	b	.L1816
.L1839:
	mov	r3, r2
	str	r9, [sp]
	mov	r2, r8
	mov	r1, r10
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r9]
	cmp	r3, #1
	bne	.L1802
	ldr	r1, .L1843+88
	mov	r2, #16
	ldr	r3, .L1843+92
	cmp	r7, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1802
.L1837:
	add	r1, r3, r7, lsl #4
	ldr	r3, .L1843+92
	add	r1, r1, #1968
	mov	r2, #16
	add	r1, r1, #4
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1802
.L1835:
	ldr	r2, .L1843+104
	movw	r1, #7742
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1787
.L1841:
	ldr	r1, .L1843+108
	ldr	r0, [fp, #-80]
	bl	u_1
	mov	r2, r9
	mov	r1, r6
	mov	r3, #64
	mov	ip, r0
	cmp	ip, #1
	ldr	r0, [fp, #-80]
	str	ip, [r8]
	strb	ip, [r10]
	bne	.L1810
	str	r8, [sp]
	bl	Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L1811
	ldr	r1, .L1843+100
	mov	r2, #64
	ldr	r3, .L1843+92
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r9
	blx	r3
	b	.L1811
.L1842:
	add	r1, r3, r7, lsl #6
	ldr	r3, .L1843+92
	add	r1, r1, #2064
	add	r1, r1, #4
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1811
.L1844:
	.align	2
.L1843:
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	g_EventReportFunc
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC163
	.word	.LC144
	.word	.LC146
	.word	.LC148
	.word	.LC149
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC145
	.word	.LC147
	.word	.LANCHOR1+80
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC161
	.word	.LANCHOR1+112
	.word	.LC150
	.word	.LC162
	UNWIND(.fnend)
	.size	ProcessPPS, .-ProcessPPS
	.align	2
	.global	PPSEqual
	.type	PPSEqual, %function
PPSEqual:
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
	subs	r7, r0, #0
	beq	.L1868
	cmp	r1, #0
	beq	.L1869
	ldr	ip, [r1, #28]
	ldr	r3, [r7, #28]
	ldr	r0, [r7, #24]
	ldr	lr, [r1, #24]
	ldrb	r4, [r7]	@ zero_extendqisi2
	cmp	r3, ip
	cmpeq	r0, lr
	ldrb	r2, [r1]	@ zero_extendqisi2
	ldrb	lr, [r7, #1]	@ zero_extendqisi2
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	moveq	ip, #1
	movne	ip, #0
	cmp	r4, r2
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	r4, [r7, #36]
	cmp	lr, r3
	movne	r2, #0
	andeq	r2, r0, #1
	ldr	ip, [r1, #36]
	ldr	lr, [r7, #40]
	ldr	r0, [r1, #40]
	cmp	r4, ip
	movne	r3, #0
	andeq	r3, r2, #1
	ldrb	r4, [r7, #2]	@ zero_extendqisi2
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	lr, r0
	movne	ip, #0
	andeq	ip, r3, #1
	ldr	lr, [r7, #44]
	ldr	r3, [r1, #44]
	cmp	r4, r2
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	r4, [r7, #48]
	ldr	ip, [r1, #48]
	cmp	lr, r3
	movne	r2, #0
	andeq	r2, r0, #1
	ldr	lr, [r7, #52]
	ldr	r0, [r1, #52]
	cmp	r4, ip
	movne	r3, #0
	andeq	r3, r2, #1
	ldrb	r5, [r7, #3]	@ zero_extendqisi2
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	cmp	lr, r0
	movne	ip, #0
	andeq	ip, r3, #1
	ldrb	r4, [r7, #4]	@ zero_extendqisi2
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	cmp	r5, r2
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	r3, [r1, #60]
	ldr	ip, [r7, #60]
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	ldrb	r0, [r7, #18]	@ zero_extendqisi2
	ldrb	lr, [r1, #18]	@ zero_extendqisi2
	cmp	ip, r3
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	lr, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L1849
	mov	ip, ip, asl #1
	adds	r2, ip, #6
	str	r2, [fp, #-52]
	beq	.L1849
	add	r2, r7, #4
	sub	r9, r7, #1088
	sub	r8, r1, #1088
	sub	r9, r9, #4
	mov	r0, r2
	sub	r8, r8, #4
	add	r2, r1, #4
	add	r10, r1, #64
	str	r2, [fp, #-48]
	sub	r2, r7, #836
	mov	r6, #0
	mov	r4, r7
	mov	r5, r0
	str	r7, [fp, #-56]
	str	r1, [fp, #-60]
.L1853:
	ldr	r0, [fp, #-48]
	ldrb	r1, [r5, #1]!	@ zero_extendqisi2
	ldrsb	ip, [r0, #1]!
	str	r0, [fp, #-48]
	sxtb	r0, r1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, #0
	beq	.L1867
	cmp	r6, #5
	bhi	.L1854
	add	r7, r4, #64
	add	r4, r4, #128
	mov	r0, r10
	mov	r1, r7
.L1852:
	ldr	lr, [r1], #4
	ldr	ip, [r0], #4
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, r4
	bne	.L1852
.L1850:
	ldr	r1, [fp, #-52]
	add	r6, r6, #1
	add	r9, r9, #256
	add	r8, r8, #256
	cmp	r6, r1
	add	r2, r2, #256
	mov	r4, r7
	add	r10, r10, #64
	bne	.L1853
	ldr	r7, [fp, #-56]
	ldr	r1, [fp, #-60]
.L1849:
	ldr	r0, [r7, #56]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L1847:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1854:
	mov	r0, r8
	mov	r1, r9
.L1851:
	ldr	lr, [r1, #4]!
	ldr	ip, [r0, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r1
	bne	.L1851
.L1867:
	add	r7, r4, #64
	b	.L1850
.L1869:
	movw	r3, #7865
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L1870
	ldr	r3, .L1870+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L1847
.L1868:
	movw	r1, #7864
	ldr	r3, .L1870+4
	str	r1, [sp]
	ldr	r2, .L1870
	bl	dprint_normal
	mvn	r0, #0
	b	.L1847
.L1871:
	.align	2
.L1870:
	.word	.LC22
	.word	.LC21
	UNWIND(.fnend)
	.size	PPSEqual, .-PPSEqual
	.align	2
	.global	H264_DecPPS
	.type	H264_DecPPS, %function
H264_DecPPS:
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
	ldr	r1, .L1889
	add	r4, r0, #12288
	mov	r5, r0
	bl	ue_v
	ldr	r3, [r4, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r6, r0
	bls	.L1873
	ldr	r2, .L1889+4
	movw	r1, #7630
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #1292]
	sub	r2, r3, #1
	cmp	r6, r2
	bls	.L1881
	ldr	r2, .L1889+8
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L1881
	add	r5, r5, #57344
	str	r3, [fp, #-40]
	str	r6, [fp, #-44]
	mov	r3, #8
	ldr	r0, [r5, #1840]
	sub	r2, fp, #44
	mov	r1, #29
	blx	r4
	mvn	r0, #0
.L1874:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1873:
	ldr	r1, .L1889+12
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r2, r0
	bhi	.L1885
	ldr	r1, [r4, #1300]
	mov	r3, #4000
	mla	r3, r3, r0, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1886
	mov	r9, #2208
	ldr	r3, [r4, #1304]
	mul	r7, r9, r6
	add	r3, r3, r7
	ldrb	r8, [r3, #19]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L1877
	ldr	r8, .L1889+16
	mov	r0, r5
	mov	r1, r8
	str	r6, [r8, #24]
	str	r2, [r8, #28]
	bl	ProcessPPS
	subs	r5, r0, #0
	bne	.L1887
	ldr	r1, [r4, #1304]
	mov	r0, r8
	add	r1, r1, r7
	bl	PPSEqual
	cmp	r0, #0
	beq	.L1874
	ldr	ip, .L1889+20
	mov	r3, #1
	ldr	r0, [r4, #1304]
	mov	r2, r9
	strb	r3, [r8, #20]
	mov	r1, r8
	add	r0, r0, r7
	ldr	r4, [ip, #56]
	strb	r3, [r8, #19]
	blx	r4
	mov	r0, r5
	b	.L1874
.L1877:
	str	r6, [r3, #24]
	mov	r0, r5
	ldr	r3, [r4, #1304]
	add	r3, r3, r7
	str	r2, [r3, #28]
	ldr	r1, [r4, #1304]
	add	r1, r1, r7
	bl	ProcessPPS
	cmp	r0, #0
	bne	.L1888
	ldr	r3, [r4, #1304]
	mov	r2, #1
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r2, [r7, #19]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1881:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1885:
	ldr	r2, .L1889+24
	movw	r1, #7644
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1874
.L1887:
	ldr	r3, .L1889+28
	movw	r1, #7661
	ldr	r2, .L1889+32
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1874
.L1886:
	ldr	r2, .L1889+36
	movw	r1, #7650
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1874
.L1888:
	ldr	r3, .L1889+28
	mov	r1, #7680
	ldr	r2, .L1889+40
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #1304]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r8, [r7, #19]
	b	.L1874
.L1890:
	.align	2
.L1889:
	.word	.LC164
	.word	.LC165
	.word	g_EventReportFunc
	.word	.LC166
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC167
	.word	.LANCHOR0+140
	.word	.LC169
	.word	.LC168
	.word	.LC170
	UNWIND(.fnend)
	.size	H264_DecPPS, .-H264_DecPPS
	.align	2
	.global	vui_parameters
	.type	vui_parameters, %function
vui_parameters:
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
	mov	r5, r1
	ldr	r1, .L1942
	mov	r4, r0
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L1936
.L1893:
	ldr	r1, .L1942+4
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L1937
.L1894:
	ldr	r1, .L1942+8
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L1938
.L1896:
	ldr	r1, .L1942+12
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L1939
.L1897:
	ldr	r1, .L1942+16
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L1940
.L1899:
	ldr	r1, .L1942+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L1901
	ldr	r1, .L1942+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L1942+28
	mov	r1, #4
	str	r0, [r5, #120]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+32
	mov	r1, #4
	strb	r0, [r5, #116]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #120]
	cmp	r3, #31
	strb	r0, [r5, #117]
	bhi	.L1902
	add	r9, r4, #57344
	ldr	r6, [r9, #1780]
	cmp	r6, #0
	addeq	r7, r5, #120
	addeq	r8, r5, #83
	bne	.L1902
.L1905:
	ldr	r1, .L1942+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #120]
	cmp	r3, r6
	bcs	.L1905
	ldr	r2, .L1942+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+52
	mov	r1, #5
	str	r0, [r5, #380]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+56
	mov	r1, #5
	str	r0, [r5, #384]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+60
	mov	r1, #5
	str	r0, [r5, #388]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #392]
.L1901:
	ldr	r1, .L1942+64
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L1941
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	add	r9, r4, #57344
	cmp	r3, #0
	bne	.L1912
.L1911:
	ldr	r1, .L1942+68
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1942+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L1913
	ldr	r0, [r9, #1780]
.L1914:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1941:
	ldr	r1, .L1942+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L1942+28
	mov	r1, #4
	str	r0, [r5, #432]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+32
	mov	r1, #4
	strb	r0, [r5, #428]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #432]
	cmp	r3, #31
	strb	r0, [r5, #429]
	bhi	.L1907
	add	r9, r4, #57344
	ldr	r6, [r9, #1780]
	cmp	r6, #0
	addeq	r8, r5, #392
	addeq	r7, r5, #432
	addeq	r8, r8, #3
	bne	.L1907
.L1909:
	ldr	r1, .L1942+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #432]
	cmp	r3, r6
	bcs	.L1909
	ldr	r2, .L1942+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+52
	mov	r1, #5
	str	r0, [r5, #692]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+56
	mov	r1, #5
	str	r0, [r5, #696]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+60
	mov	r1, #5
	str	r0, [r5, #700]
	mov	r0, r4
	bl	u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #704]
	bne	.L1912
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1911
.L1912:
	ldr	r1, .L1942+76
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #14]
	b	.L1911
.L1940:
	ldr	r2, .L1942+80
	mov	r1, #32
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	u_v
	ldr	r1, .L1942+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	u_1
	ldr	r2, [r5, #52]
	cmp	r2, #0
	strb	r0, [r5, #9]
	beq	.L1899
	ldr	r0, [r5, #56]
	movw	r1, #10000
	ldr	r3, .L1942+92
	add	r9, r4, #57344
	umull	r0, r1, r0, r1
	ldr	r3, [r3, #248]
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	blx	r3
	movw	r3, #52429
	movt	r3, 52428
	add	r0, r0, #5
	umull	r0, r1, r0, r3
	mov	r3, r1, lsr #3
	str	r3, [r9, #796]
	b	.L1899
.L1939:
	ldr	r1, .L1942+96
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+100
	str	r0, [r5, #44]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #48]
	b	.L1897
.L1938:
	ldr	r2, .L1942+104
	mov	r1, #3
	mov	r0, r4
	bl	u_v
	ldr	r1, .L1942+108
	str	r0, [r5, #28]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1942+112
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L1896
	ldr	r2, .L1942+116
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+120
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+124
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #40]
	b	.L1896
.L1937:
	ldr	r1, .L1942+128
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #2]
	b	.L1894
.L1936:
	ldr	r2, .L1942+132
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L1893
	ldr	r2, .L1942+136
	mov	r1, #16
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1942+140
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #20]
	b	.L1893
.L1913:
	ldr	r1, .L1942+144
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1942+148
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+152
	str	r0, [r5, #60]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+156
	str	r0, [r5, #64]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+160
	str	r0, [r5, #72]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+164
	str	r0, [r5, #68]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1942+168
	str	r0, [r5, #76]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #80]
	ldr	r0, [r9, #1780]
	cmp	r0, #0
	beq	.L1914
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1902:
	ldr	r2, .L1942+172
	movw	r1, #8003
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1907:
	ldr	r2, .L1942+172
	movw	r1, #8033
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1943:
	.align	2
.L1942:
	.word	.LC171
	.word	.LC175
	.word	.LC177
	.word	.LC184
	.word	.LC187
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC205
	.word	.LC206
	.word	.LC204
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC185
	.word	.LC186
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC176
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC207
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC212
	.word	.LC213
	.word	.LC195
	UNWIND(.fnend)
	.size	vui_parameters, .-vui_parameters
	.align	2
	.global	SPSEqual
	.type	SPSEqual, %function
SPSEqual:
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
	subs	r6, r0, #0
	beq	.L1976
	cmp	r1, #0
	beq	.L1977
	ldrb	lr, [r1]	@ zero_extendqisi2
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	ip, [r6, #28]
	ldr	r2, [r1, #28]
	ldrb	r0, [r6, #1]	@ zero_extendqisi2
	cmp	r3, lr
	cmpeq	ip, r2
	ldrb	r5, [r1, #1]	@ zero_extendqisi2
	ldrb	r2, [r6, #2]	@ zero_extendqisi2
	ldrb	r4, [r1, #2]	@ zero_extendqisi2
	moveq	lr, #1
	movne	lr, #0
	ldr	r3, [r6, #32]
	cmp	r0, r5
	movne	ip, #0
	andeq	ip, lr, #1
	ldr	r5, [r1, #32]
	cmp	r2, r4
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	lr, [r1, #36]
	ldr	r4, [r6, #36]
	cmp	r3, r5
	movne	r2, #0
	andeq	r2, r0, #1
	ldrb	ip, [r1, #25]	@ zero_extendqisi2
	ldrb	r0, [r6, #25]	@ zero_extendqisi2
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L1948
	add	r2, r6, #3
	sub	r0, r1, #1104
	str	r2, [fp, #-48]
	add	r2, r1, #3
	add	r9, r1, #48
	sub	r10, r6, #1104
	sub	r4, r6, #848
	mov	r8, r6
	str	r6, [fp, #-52]
	mov	r7, #0
	mov	r5, r0
	mov	r6, r2
	str	r1, [fp, #-56]
.L1952:
	ldr	r1, [fp, #-48]
	ldrsb	r0, [r6, #1]!
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-48]
	sxtb	r1, r2
	cmp	r0, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L1949
	cmp	r7, #5
	bhi	.L1959
	add	r2, r8, #48
	add	lr, r8, #112
	mov	r1, r9
.L1951:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, lr
	bne	.L1951
.L1949:
	add	r7, r7, #1
	add	r10, r10, #256
	cmp	r7, #8
	add	r5, r5, #256
	add	r4, r4, #256
	add	r8, r8, #64
	add	r9, r9, #64
	bne	.L1952
	ldr	r6, [fp, #-52]
	ldr	r1, [fp, #-56]
.L1948:
	ldr	r2, [r1, #2196]
	ldr	ip, [r6, #2200]
	ldr	r0, [r1, #2200]
	ldr	lr, [r6, #2196]
	cmp	ip, r0
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	beq	.L1954
	cmp	ip, #1
	bne	.L1953
	ldr	r0, [r1, #2208]
	ldr	ip, [r6, #2208]
	ldrb	r2, [r6, #16]	@ zero_extendqisi2
	ldrb	r4, [r1, #16]	@ zero_extendqisi2
	ldr	lr, [r6, #2212]
	cmp	ip, r0
	cmpeq	r2, r4
	ldr	r2, [r1, #2212]
	ldr	r5, [r6, #2216]
	ldr	ip, [r1, #2216]
	moveq	r0, #1
	movne	r0, #0
	cmp	lr, r2
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	r5, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r5, #0
	and	r3, r3, r2
	beq	.L1953
	add	ip, r6, #2208
	add	r0, r1, #2208
	add	ip, ip, #8
	add	r0, r0, #8
	mov	r2, #0
.L1956:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r5
	bne	.L1956
.L1953:
	ldrb	lr, [r6, #17]	@ zero_extendqisi2
	ldrb	r0, [r1, #17]	@ zero_extendqisi2
	ldr	r2, [r6, #3244]
	ldr	r4, [r1, #3244]
	ldr	r7, [r6, #3248]
	cmp	lr, r0
	cmpeq	r2, r4
	ldr	r2, [r1, #3248]
	ldr	r5, [r6, #3252]
	ldr	r4, [r1, #3252]
	moveq	ip, #1
	movne	ip, #0
	ldrb	lr, [r1, #18]	@ zero_extendqisi2
	cmp	r7, r2
	movne	r0, #0
	andeq	r0, ip, #1
	ldrb	ip, [r6, #18]	@ zero_extendqisi2
	cmp	r5, r4
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	lr, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L1957
	ldrb	r0, [r6, #19]	@ zero_extendqisi2
	ldrb	r2, [r1, #19]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L1957:
	ldrb	r2, [r1, #20]	@ zero_extendqisi2
	ldrb	ip, [r6, #21]	@ zero_extendqisi2
	ldrb	r0, [r1, #21]	@ zero_extendqisi2
	ldrb	lr, [r6, #20]	@ zero_extendqisi2
	cmp	r0, ip
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L1978
.L1958:
	ldrb	r2, [r6, #22]	@ zero_extendqisi2
	ldr	r0, [r6, #3316]
	ldr	ip, [r1, #3316]
	ldrb	r1, [r1, #22]	@ zero_extendqisi2
	cmp	r0, ip
	cmpeq	r2, r1
	moveq	r2, #1
	movne	r2, #0
	tst	r3, r2
	mvneq	r0, #0
	movne	r0, #0
.L1946:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1978:
	ldr	ip, [r1, #3260]
	ldr	lr, [r6, #3260]
	ldr	r0, [r6, #3256]
	ldr	r2, [r1, #3256]
	ldr	r5, [r6, #3264]
	cmp	lr, ip
	cmpeq	r0, r2
	ldr	r2, [r1, #3264]
	ldr	r4, [r6, #3268]
	ldr	lr, [r1, #3268]
	moveq	ip, #1
	movne	ip, #0
	cmp	r5, r2
	movne	r0, #0
	andeq	r0, ip, #1
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	and	r3, r3, r2
	b	.L1958
.L1959:
	mov	r1, r5
	mov	r2, r10
.L1950:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r4
	bne	.L1950
	b	.L1949
.L1954:
	ldr	r0, [r6, #2204]
	ldr	r2, [r1, #2204]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L1953
.L1977:
	movw	r3, #8082
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L1979
	ldr	r3, .L1979+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L1946
.L1976:
	movw	r1, #8081
	ldr	r3, .L1979+4
	str	r1, [sp]
	ldr	r2, .L1979
	bl	dprint_normal
	mvn	r0, #0
	b	.L1946
.L1980:
	.align	2
.L1979:
	.word	.LC22
	.word	.LC21
	UNWIND(.fnend)
	.size	SPSEqual, .-SPSEqual
	.global	__aeabi_idiv
	.align	2
	.global	H264GetDar
	.type	H264GetDar, %function
H264GetDar:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r4, r0, #0
	mov	r5, r3
	mov	r0, r1
	beq	.L2009
	subs	r3, r4, #255
	movne	r3, #1
	cmp	r4, #16
	movle	r1, #0
	andgt	r1, r3, #1
	cmp	r1, #0
	movne	r4, #0
	movne	r3, r4
	bne	.L1982
	cmp	r2, #0
	cmpne	r0, #0
	moveq	ip, #1
	movne	ip, #0
	cmp	r4, #255
	movne	ip, #0
	andeq	ip, ip, #1
	cmp	ip, #0
	bne	.L1995
	cmp	r4, #1
	beq	.L2010
	cmp	r3, #0
	ldrne	r0, .L2013
	addne	r4, r0, r4, lsl #3
	ldrne	r2, [r4, #156]
	ldrne	r0, [r4, #152]
	mov	r1, r2
	mov	r0, r0, asl #10
	bl	__aeabi_idiv
	ldr	r1, [fp, #4]
	mov	r4, r0
	mov	r0, r5, asl #10
	bl	__aeabi_idiv
	movw	r2, #2405
	movw	r1, #2262
	mul	r0, r0, r4
	add	r3, r0, #1020
	cmp	r0, #0
	add	r3, r3, #3
	movlt	r0, r3
	mov	r3, r0, asr #10
	cmp	r3, r2
	rsble	r2, r3, #2400
	subgt	r2, r3, #2400
	addle	r2, r2, #6
	subgt	r2, r2, #6
	cmp	r3, r1
	ble	.L2011
	sub	r1, r3, #2256
	sub	r1, r1, #7
	cmp	r2, r1
	bge	.L1988
.L2001:
	mov	r4, #4
.L1982:
	str	r4, [sp]
	movw	r1, #8239
	ldr	r2, .L2013+4
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1995:
	mov	r4, r1
.L2009:
	mov	r3, r4
	b	.L1982
.L2011:
	rsb	r1, r3, #2256
	add	r1, r1, #7
	cmp	r2, r1
	blt	.L2001
.L1988:
	movw	r2, #1819
	cmp	r3, r2
	bgt	.L1989
	rsb	r2, r3, #1808
	add	r2, r2, #12
	cmp	r1, r2
	blt	.L2003
.L1990:
	movw	r1, #1364
	cmp	r3, r1
	rsble	r4, r3, #1360
	subgt	r4, r3, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r2, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L1982
.L2010:
	ldr	r3, [fp, #4]
	cmp	r5, #3840
	cmpeq	r3, #2160
	moveq	r3, #1
	movne	r3, #0
	moveq	r3, ip
	moveq	r4, #2
	beq	.L1982
	ldr	r2, [fp, #4]
	sub	r2, r2, #1072
	sub	r2, r2, #8
	bics	r2, r2, #8
	moveq	r2, #1
	movne	r2, #0
	cmp	r5, #1920
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r2, #0
	beq	.L2012
.L2008:
	mov	r4, #2
	b	.L1982
.L1989:
	sub	r2, r3, #1808
	sub	r2, r2, #12
	cmp	r1, r2
	bge	.L1990
.L2003:
	mov	r4, #3
	b	.L1982
.L2012:
	ldr	r3, [fp, #4]
	cmp	r5, #1280
	cmpeq	r3, #720
	moveq	r3, #1
	movne	r3, #0
	moveq	r3, r2
	beq	.L2008
	ldr	r2, [fp, #4]
	cmp	r5, #640
	cmpeq	r2, #480
	moveq	r4, #1
	movne	r4, #5
	b	.L1982
.L2014:
	.align	2
.L2013:
	.word	.LANCHOR0
	.word	.LC214
	UNWIND(.fnend)
	.size	H264GetDar, .-H264GetDar
	.align	2
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L2129
	cmp	r1, #0
	beq	.L2131
	ldr	r2, [r1, #28]
	cmp	r2, #100
	cmpne	r2, #110
	moveq	r3, #1
	movne	r3, #0
	cmp	r2, #122
	orreq	r3, r3, #1
	cmp	r2, #144
	orreq	r3, r3, #1
	cmp	r2, #83
	orreq	r3, r3, #1
	cmp	r2, #86
	orreq	r3, r3, #1
	cmp	r3, #0
	streqb	r3, [r1, #25]
	moveq	r3, #1
	streq	r3, [r1, #40]
	bne	.L2132
.L2033:
	ldr	r1, .L2147
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2196]
	bhi	.L2046
	add	r6, r5, #57344
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2046
	ldr	r1, .L2147+4
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #2200]
	bhi	.L2048
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2048
	cmp	r0, #0
	beq	.L2133
	cmp	r0, #1
	beq	.L2134
.L2053:
	ldr	r1, .L2147+8
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3244]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+12
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #17]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+16
	mov	r0, r5
	bl	ue_v
	sub	r3, r0, #1
	str	r0, [r4, #3248]
	cmp	r3, #254
	bhi	.L2057
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2057
	ldr	r1, .L2147+20
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3252]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+24
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	cmp	r0, #0
	bne	.L2135
	ldr	r1, .L2147+28
	mov	r0, r5
	bl	u_1
	ldr	r7, [r4, #3252]
	add	r7, r7, #1
	cmp	r7, #128
	strb	r0, [r4, #19]
	bhi	.L2092
	ldr	r3, [r4, #3248]
	add	r3, r3, #1
	cmp	r7, #1
	cmphi	r3, #3
	movhi	r8, #2
	bls	.L2092
.L2061:
	mul	r7, r7, r8
	mov	r10, r3, asl #4
	mov	r7, r7, asl #4
	mul	r1, r10, r7
	add	r1, r1, r1, lsr #1
	cmp	r1, #25165824
	bhi	.L2136
	ldr	r3, [r4, #32]
	sub	r2, r3, #10
	cmp	r2, #41
	ldrls	pc, [pc, r2, asl #2]
	b	.L2063
.L2065:
	.word	.L2064
	.word	.L2066
	.word	.L2100
	.word	.L2100
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2100
	.word	.L2068
	.word	.L2070
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2070
	.word	.L2071
	.word	.L2072
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2074
	.word	.L2074
	.word	.L2075
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2063
	.word	.L2076
	.word	.L2077
.L2132:
	ldr	r1, .L2147+32
	bl	ue_v
	cmp	r0, #1
	str	r0, [r4, #40]
	bls	.L2137
.L2020:
	mov	r3, r0
	ldr	r2, .L2147+36
	movw	r1, #8280
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, .L2147+40
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r3, r0, #8
	str	r3, [r4, #44]
	cmp	r3, #8
	beq	.L2138
.L2022:
	ldr	r2, .L2147+44
	movw	r1, #8286
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2147+48
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L2129
	ldr	r1, [r4, #44]
	add	r5, r5, #57344
	mov	ip, #0
	mov	r3, #8
	ldr	r0, [r5, #1840]
	sub	r2, fp, #68
	str	r1, [fp, #-64]
	mov	r1, #47
	str	ip, [fp, #-68]
	blx	r6
	mvn	r0, #0
.L2122:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2137:
	add	r6, r5, #57344
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2020
	ldr	r1, .L2147+40
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r3, r0, #8
	str	r3, [r4, #44]
	cmp	r3, #8
	bne	.L2024
	ldr	r2, [r6, #1780]
	cmp	r2, #0
	beq	.L2025
.L2024:
	ldr	r2, .L2147+44
	movw	r1, #8297
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2147+48
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2025
	ldr	r0, [r4, #44]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #47
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #1840]
	blx	r7
.L2025:
	ldr	r1, .L2147+52
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r3, r0, #8
	str	r3, [r4, #48]
	cmp	r3, #8
	bne	.L2027
	ldr	r2, [r6, #1780]
	cmp	r2, #0
	bne	.L2027
.L2028:
	ldr	r1, .L2147+56
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L2030
	ldr	r6, [r6, #1780]
	cmp	r6, #0
	bne	.L2030
	ldr	r1, .L2147+60
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #25]
	cmp	r0, #1
	bne	.L2033
	add	r7, r4, #1968
	sub	r8, fp, #72
	add	r7, r7, #4
	add	r10, r4, #3
	add	r9, r4, #52
	b	.L2039
.L2141:
	ldr	r3, .L2147+64
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2147+68
	ldr	r3, [r3, #52]
	blx	r3
.L2035:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2139
.L2039:
	ldr	r1, .L2147+72
	mov	r0, r5
	bl	u_1
	clz	r1, r6
	mov	r2, #16
	mov	r1, r1, lsr #5
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r7
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2140
	cmp	r6, #0
	cmpne	r6, #3
	beq	.L2141
	ldr	r3, .L2147+68
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2035
.L2138:
	add	r2, r5, #57344
	ldr	r2, [r2, #1780]
	cmp	r2, #0
	bne	.L2022
.L2129:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2133:
	ldr	r1, .L2147+76
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2204]
	bhi	.L2051
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	beq	.L2053
.L2051:
	ldr	r2, .L2147+80
	movw	r1, #8405
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2027:
	ldr	r2, .L2147+84
	movw	r1, #8307
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2147+48
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2028
	ldr	r0, [r4, #48]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #47
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #1840]
	blx	r7
	b	.L2028
.L2135:
	ldr	r7, [r4, #3252]
	strb	r3, [r4, #19]
	sub	r3, r7, #1
	cmp	r3, #254
	bhi	.L2094
	ldr	r3, [r4, #3248]
	mov	r8, #1
	add	r7, r7, #1
	add	r3, r3, r8
	b	.L2061
.L2100:
	mov	r0, #60416
	movt	r0, 13
.L2067:
	bl	__aeabi_uidiv
	ldr	r2, .L2147+88
	movw	r1, #8579
	cmp	r0, #16
	movcc	r9, r0
	movcs	r9, #16
	mov	r3, r9
	mov	r0, #19
	bl	dprint_normal
	ldr	r3, [r4, #3244]
	cmp	r3, r9
	bhi	.L2078
	ldr	r2, [r6, #1780]
	cmp	r2, #0
	beq	.L2079
.L2078:
	str	r9, [sp]
	movw	r1, #8584
	ldr	r2, .L2147+92
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r4, #3244]
	cmp	r3, #16
	bhi	.L2126
	cmp	r9, r3
	movcc	r9, r3
.L2126:
	str	r9, [r4, #3244]
.L2079:
	ldr	r1, .L2147+96
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #20]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+100
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #21]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	cmp	r0, #0
	bne	.L2142
.L2081:
	mov	r2, r10, lsr #1
	mov	r3, r7, lsr #1
	str	r10, [r4, #3276]
	str	r7, [r4, #3280]
	str	r2, [r4, #3284]
	str	r3, [r4, #3288]
.L2083:
	ldr	r1, .L2147+104
	mov	r0, r5
	bl	u_1
	uxtb	r3, r0
	strb	r3, [r4, #22]
	ldr	r2, [r6, #1780]
	cmp	r2, #0
	bne	.L2129
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r4, #3332]
	bne	.L2143
	mov	r0, r3
	strb	r3, [r4, #3307]
	mov	r3, #5
	str	r3, [r4, #3320]
.L2086:
	ldr	r2, [r4, #3312]
	mov	r3, r10
	ldr	r1, [r4, #3308]
	str	r7, [sp]
	bl	H264GetDar
	ldr	r3, [r4, #3244]
	cmp	r3, #0
	str	r0, [r4, #3316]
	beq	.L2089
	ldr	r2, [r4, #3372]
	cmp	r3, r2
	bls	.L2089
.L2090:
	cmp	r9, r3
	movcs	r9, r3
.L2091:
	cmp	r9, #16
	add	r5, r5, #12288
	mov	r0, #0
	movcc	r3, r9
	movcs	r3, #16
	str	r3, [r5, #1296]
	add	r3, r3, #1
	str	r3, [r4, #3272]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2074:
	mov	r0, #12582912
	b	.L2067
.L2070:
	mov	r0, #30208
	movt	r0, 47
	b	.L2067
.L2075:
	mov	r0, #13369344
	b	.L2067
.L2066:
	mov	r0, #17920
	movt	r0, 5
	b	.L2067
.L2064:
	mov	r0, #20992
	movt	r0, 2
	b	.L2067
.L2068:
	mov	r0, #55296
	movt	r0, 27
	b	.L2067
.L2077:
	mov	r0, #0
	movt	r0, 1080
	b	.L2067
.L2076:
	mov	r0, #57344
	movt	r0, 646
	b	.L2067
.L2072:
	mov	r0, #7864320
	b	.L2067
.L2071:
	mov	r0, #30720
	movt	r0, 105
	b	.L2067
.L2046:
	ldr	r2, .L2147+108
	movw	r1, #8387
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2063:
	ldr	r2, .L2147+112
	movw	r1, #8559
	mov	r0, #1
	bl	dprint_normal
	b	.L2129
.L2092:
	ldr	r2, .L2147+116
	movw	r1, #8471
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2089:
	ldr	r2, [r5]
	ldr	r2, [r2, #12]
	sub	r2, r2, #2
	cmp	r2, #1
	bhi	.L2091
	b	.L2090
.L2142:
	ldr	r1, .L2147+120
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2147+124
	str	r0, [r4, #3256]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2147+128
	str	r0, [r4, #3260]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2147+132
	str	r0, [r4, #3264]
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #3264]
	ldr	r2, [r4, #3256]
	mov	r1, r8, asl #1
	ldr	ip, [r4, #3260]
	mov	r3, r3, asl #1
	mov	r2, r2, asl #1
	mul	r8, r8, r3
	rsb	r3, r2, r10
	sub	r3, r3, ip, asl #1
	rsb	ip, r8, r7
	str	r0, [r4, #3268]
	mls	r0, r0, r1, ip
	cmp	r3, #0
	cmpgt	r0, #0
	ble	.L2081
	add	r2, r2, r3, lsr #1
	add	r8, r8, r0, lsr #1
	str	r2, [r4, #3284]
	str	r8, [r4, #3288]
	str	r3, [r4, #3276]
	str	r0, [r4, #3280]
	b	.L2083
.L2143:
	add	r1, r4, #3280
	mov	r0, r5
	add	r1, r1, #12
	bl	vui_parameters
	cmp	r0, #0
	bne	.L2128
	ldrb	r3, [r4, #3304]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2128
	ldr	r3, [r4, #3372]
	clz	r2, r3
	mov	r2, r2, lsr #5
	cmp	r9, r3
	orrcc	r2, r2, #1
	cmp	r2, #0
	bne	.L2144
	ldr	r2, [r4, #3244]
	ldrb	r0, [r4, #3307]	@ zero_extendqisi2
	cmp	r3, r2
	movcs	r9, r3
	movcc	r9, r2
	b	.L2086
.L2144:
	str	r9, [sp]
	movw	r1, #8659
	ldr	r2, .L2147+136
	mov	r0, #1
	bl	dprint_normal
.L2128:
	ldrb	r0, [r4, #3307]	@ zero_extendqisi2
	b	.L2086
.L2134:
	ldr	r1, .L2147+140
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #16]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+144
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2208]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+148
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2212]
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	bne	.L2129
	ldr	r1, .L2147+152
	mov	r0, r5
	bl	ue_v
	cmp	r0, #255
	str	r0, [r4, #2216]
	bhi	.L2054
	ldr	r7, [r6, #1780]
	cmp	r7, #0
	bne	.L2054
	cmp	r0, #0
	addne	r8, r4, #2208
	addne	r8, r8, #8
	bne	.L2056
	b	.L2053
.L2145:
	ldr	r3, [r4, #2216]
	cmp	r3, r7
	bls	.L2053
.L2056:
	ldr	r1, .L2147+156
	mov	r0, r5
	bl	se_v
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r3, [r6, #1780]
	cmp	r3, #0
	beq	.L2145
	b	.L2129
.L2139:
	add	r6, r4, #2064
	sub	r8, fp, #80
	add	r6, r6, #4
	add	r10, r4, #9
	add	r9, r4, #436
	mov	r7, #0
.L2044:
	ldr	r1, .L2147+72
	mov	r0, r5
	bl	u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r6
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2146
	ldr	r1, .L2147+160
	cmp	r7, #0
	ldr	r3, .L2147+68
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2041:
	add	r7, r7, #1
	add	r6, r6, #64
	cmp	r7, #2
	add	r9, r9, #256
	bne	.L2044
	b	.L2033
.L2140:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2035
	ldr	r1, .L2147+64
	mov	r2, #16
	ldr	r3, .L2147+68
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2035
.L2057:
	mov	r3, r0
	ldr	r2, .L2147+164
	movw	r1, #8447
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2048:
	ldr	r2, .L2147+168
	movw	r1, #8395
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2030:
	ldr	r2, .L2147+172
	movw	r1, #8316
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2146:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r6
	mov	r1, r9
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2041
	ldr	r1, .L2147+160
	mov	r2, #64
	ldr	r3, .L2147+68
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r6
	blx	r3
	b	.L2041
.L2131:
	movw	r1, #8266
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L2147+176
	ldr	r2, .L2147+180
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2136:
	ldr	r2, .L2147+184
	movw	r1, #8492
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2094:
	ldr	r2, .L2147+116
	movw	r1, #8481
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2054:
	ldr	r2, .L2147+188
	movw	r1, #8424
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2122
.L2148:
	.align	2
.L2147:
	.word	.LC224
	.word	.LC226
	.word	.LC229
	.word	.LC237
	.word	.LC238
	.word	.LC240
	.word	.LC241
	.word	.LC255
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC218
	.word	g_EventReportFunc
	.word	.LC219
	.word	.LC221
	.word	.LC223
	.word	.LANCHOR1+80
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC161
	.word	.LC228
	.word	.LC230
	.word	.LC220
	.word	.LC245
	.word	.LC246
	.word	.LC247
	.word	.LC248
	.word	.LC253
	.word	.LC225
	.word	.LC244
	.word	.LC242
	.word	.LC249
	.word	.LC250
	.word	.LC251
	.word	.LC252
	.word	.LC254
	.word	.LC231
	.word	.LC232
	.word	.LC233
	.word	.LC234
	.word	.LC236
	.word	.LANCHOR1+112
	.word	.LC239
	.word	.LC227
	.word	.LC222
	.word	.LC21
	.word	.LC22
	.word	.LC243
	.word	.LC235
	UNWIND(.fnend)
	.size	ProcessSPS, .-ProcessSPS
	.align	2
	.global	Sps_SvcExt
	.type	Sps_SvcExt, %function
Sps_SvcExt:
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
	add	r1, r0, #12288
	add	r2, r0, #20480
	mov	lr, #2208
	ldr	r3, [r1, #1304]
	mov	r4, r0
	ldr	r2, [r2, #216]
	add	r0, r0, #13504
	ldr	ip, [r1, #1300]
	mov	r5, #4000
	mov	r1, #32
	add	r0, r0, #24
	mla	r3, lr, r2, r3
	ldr	r3, [r3, #28]
	mla	r5, r5, r3, ip
	bl	BsGet
	ldr	r1, .L2163
	mov	r6, r0
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2163+4
	movw	r1, #8713
	mov	r3, r0
	mov	r0, #15
	bl	dprint_normal
	mov	r0, r4
	ldr	r2, .L2163+8
	mov	r1, #2
	bl	u_v
	cmp	r0, #1
	beq	.L2159
	ldr	r3, [r5, #40]
	sub	r2, r3, #1
	cmp	r2, #1
	bls	.L2160
.L2152:
	cmp	r3, #1
	beq	.L2161
.L2153:
	ldr	r1, .L2163+12
	mov	r0, r4
	bl	u_1
	cmp	r0, #0
	bne	.L2162
.L2154:
	mov	r0, r4
	ldr	r1, .L2163+16
	bl	u_1
	cmp	r0, #1
	moveq	r0, #0
	beq	.L2151
	ldr	ip, [r5, #40]
	mov	r3, r0
	str	r6, [sp]
	movw	r1, #8747
	ldr	r2, .L2163+20
	mov	r0, #1
	str	ip, [sp, #4]
	bl	dprint_normal
	mov	r0, #0
.L2151:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2162:
	ldr	r1, .L2163+24
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2163+28
	movw	r1, #8739
	mov	r3, r0
	mov	r0, #15
	bl	dprint_normal
	b	.L2154
.L2161:
	ldr	r2, .L2163+32
	mov	r1, #2
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2163+36
	movw	r1, #8731
	mov	r3, r0
	mov	r0, #15
	bl	dprint_normal
	b	.L2153
.L2160:
	ldr	r1, .L2163+40
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2163+44
	movw	r1, #8725
	mov	r3, r0
	mov	r0, #15
	bl	dprint_normal
	ldr	r3, [r5, #40]
	b	.L2152
.L2159:
	ldr	r2, .L2163+48
	movw	r1, #8718
	bl	dprint_normal
	mvn	r0, #0
	b	.L2151
.L2164:
	.align	2
.L2163:
	.word	.LC256
	.word	.LC257
	.word	.LC258
	.word	.LC264
	.word	.LC267
	.word	.LC268
	.word	.LC265
	.word	.LC266
	.word	.LC262
	.word	.LC263
	.word	.LC260
	.word	.LC261
	.word	.LC259
	UNWIND(.fnend)
	.size	Sps_SvcExt, .-Sps_SvcExt
	.align	2
	.global	H264_DecSPS
	.type	H264_DecSPS, %function
H264_DecSPS:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r2, .L2230
	mov	r1, #8
	mov	r4, r0
	add	r9, r0, #57344
	bl	u_v
	ldr	r1, .L2230+4
	mov	r10, r0
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2230+8
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2230+12
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2230+16
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2230+20
	mov	r1, #4
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2230+24
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2230+28
	mov	r6, r0
	mov	r0, r4
	bl	ue_v
	ldr	r3, [r9, #1780]
	cmp	r3, #0
	mov	r8, r0
	bne	.L2223
	add	r5, r4, #12288
	ldr	r3, [r5, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L2224
	cmp	r10, #88
	mov	r7, r10
	beq	.L2171
	bhi	.L2172
	cmp	r10, #77
	beq	.L2173
	bhi	.L2174
	cmp	r10, #66
	bne	.L2170
	ldr	r2, .L2230+32
	movw	r1, #8794
	mov	r0, #1
	bl	dprint_normal
.L2173:
	cmp	r6, #9
	mov	r3, r6
	bls	.L2225
.L2179:
	cmp	r6, #51
	bls	.L2180
	mov	r6, #51
	ldr	r2, .L2230+36
	movw	r1, #8834
	str	r6, [sp]
	mov	r0, #1
	bl	dprint_normal
	mov	r3, r6
.L2180:
	mov	r6, #4000
	ldr	r2, [r5, #1300]
	mul	r9, r6, r8
	add	r2, r2, r9
	ldrb	r10, [r2, #23]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L2181
	ldr	r10, .L2230+40
	mov	r0, r4
	ldrb	r2, [fp, #-56]	@ zero_extendqisi2
	add	r1, r10, #2208
	str	r7, [r10, #2236]
	strb	r2, [r10, #2208]
	ldrb	r2, [fp, #-60]	@ zero_extendqisi2
	str	r3, [r10, #2240]
	str	r8, [r10, #2244]
	strb	r2, [r10, #2209]
	ldrb	r2, [fp, #-64]	@ zero_extendqisi2
	strb	r2, [r10, #2210]
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	strb	r2, [r10, #2211]
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2226
	ldr	r1, [r5, #1300]
	add	r0, r10, #2208
	add	r1, r1, r9
	bl	SPSEqual
	cmp	r0, #0
	bne	.L2227
.L2183:
	cmp	r7, #83
	cmpne	r7, #86
	beq	.L2185
.L2186:
	mov	r0, #0
.L2167:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2172:
	cmp	r10, #122
	beq	.L2176
	bls	.L2228
	cmp	r10, #144
	beq	.L2176
	cmp	r10, #244
	bne	.L2170
.L2176:
	ldr	r3, .L2230+44
	ldr	r10, [r3]
	cmp	r10, #0
	beq	.L2178
	mov	r3, #0
	ldr	r0, [r9, #1840]
	mov	r2, r3
	mov	r1, #21
	blx	r10
.L2178:
	ldr	r2, .L2230+48
	movw	r1, #8817
	mov	r0, #1
	bl	dprint_normal
	cmp	r6, #9
	mov	r3, r6
	bhi	.L2179
.L2225:
	mov	r6, #51
	ldr	r2, .L2230+36
	movw	r1, #8828
	str	r6, [sp]
	mov	r0, #1
	bl	dprint_normal
	mov	r3, r6
	b	.L2180
.L2181:
	str	r7, [r2, #28]
	mov	r0, r4
	ldr	r2, [r5, #1300]
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	strb	r1, [r2, r9]
	ldr	r2, [r5, #1300]
	ldrb	r1, [fp, #-60]	@ zero_extendqisi2
	add	r2, r2, r9
	strb	r1, [r2, #1]
	ldr	r2, [r5, #1300]
	ldrb	r1, [fp, #-64]	@ zero_extendqisi2
	add	r2, r2, r9
	strb	r1, [r2, #2]
	ldr	r2, [r5, #1300]
	ldrb	r1, [fp, #-68]	@ zero_extendqisi2
	add	r2, r2, r9
	strb	r1, [r2, #3]
	ldr	r2, [r5, #1300]
	add	r2, r2, r9
	str	r3, [r2, #32]
	ldr	r3, [r5, #1300]
	add	r3, r3, r9
	str	r8, [r3, #36]
	ldr	r1, [r5, #1300]
	add	r1, r1, r9
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2229
	ldr	r3, [r5, #1300]
	mov	r2, #1
	cmp	r7, #83
	cmpne	r7, #86
	add	r3, r3, r9
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r9, r3, r9
	strb	r2, [r9, #23]
	bne	.L2186
.L2185:
	mov	r0, r4
	bl	Sps_SvcExt
	cmp	r0, #0
	beq	.L2186
	ldr	r2, .L2230+52
	movw	r1, #8889
	mov	r0, #1
	bl	dprint_normal
.L2223:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2224:
	ldr	r2, .L2230+56
	movw	r1, #8781
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r5, #1288]
	sub	r3, r2, #1
	cmp	r8, r3
	bls	.L2223
	ldr	r3, .L2230+44
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2223
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r8, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r9, #1840]
	mov	r1, #28
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2228:
	cmp	r10, #100
	beq	.L2173
	cmp	r10, #110
	beq	.L2176
.L2170:
	mov	r3, r10
	ldr	r2, .L2230+60
	movw	r1, #8821
	mov	r0, #1
	bl	dprint_normal
	mov	r7, #100
	b	.L2173
.L2174:
	cmp	r10, #83
	beq	.L2173
	cmp	r10, #86
	beq	.L2173
	b	.L2170
.L2171:
	ldr	r2, .L2230+64
	movw	r1, #8798
	mov	r0, #1
	bl	dprint_normal
	b	.L2173
.L2227:
	ldr	r1, .L2230+68
	mov	r3, #1
	ldr	r0, [r5, #1300]
	mov	r2, r6
	strb	r3, [r10, #2232]
	ldr	r5, [r1, #56]
	add	r0, r0, r9
	strb	r3, [r10, #2231]
	add	r1, r10, #2208
	blx	r5
	b	.L2183
.L2226:
	movw	r3, #8850
	str	r8, [sp]
	mov	r1, r3
	ldr	r2, .L2230+72
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2167
.L2229:
	movw	r3, #8874
	ldr	r2, .L2230+72
	mov	r1, r3
	str	r8, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r5, #1300]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r9
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r9, r3, r9
	strb	r10, [r9, #23]
	b	.L2167
.L2231:
	.align	2
.L2230:
	.word	.LC269
	.word	.LC270
	.word	.LC271
	.word	.LC272
	.word	.LC273
	.word	.LC274
	.word	.LC275
	.word	.LC276
	.word	.LC277
	.word	.LC281
	.word	.LANCHOR2
	.word	g_EventReportFunc
	.word	.LC279
	.word	.LC283
	.word	.LC167
	.word	.LC280
	.word	.LC278
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC282
	UNWIND(.fnend)
	.size	H264_DecSPS, .-H264_DecSPS
	.align	2
	.global	PassBytes
	.type	PassBytes, %function
PassBytes:
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
	ldr	ip, [r0, #368]
	cmp	ip, #0
	cmpne	r1, #0
	beq	.L2241
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #40
	ldr	lr, [r4, #40]
	cmp	lr, #0
	beq	.L2241
	ldr	lr, [ip, #12]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2241
	cmp	lr, r3
	bls	.L2241
	ldr	lr, [r4, #44]
	mov	r6, r2
	ldr	r4, [r4, #56]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2236
	b	.L2234
.L2237:
	ldr	r4, [r2, #56]
	ldr	r2, [r2, #44]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2234
.L2236:
	rsb	r2, r6, r5
	add	r3, r3, #1
	add	ip, ip, r2
	mov	r6, r3, asl #2
	mov	r5, r3, asl #5
	str	lr, [ip, #56]
	rsb	r2, r6, r5
	ldr	ip, [r0, #368]
	ldrb	r4, [ip]	@ zero_extendqisi2
	add	r4, r4, #1
	strb	r4, [ip]
	ldr	ip, [r0, #368]
	add	r2, ip, r2
	ldr	r4, [ip, #12]
	cmp	r4, r3
	bhi	.L2237
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2234:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #56]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2241:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	PassBytes, .-PassBytes
	.align	2
	.global	GetBytes
	.type	GetBytes, %function
GetBytes:
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
	cmp	r1, #0
	beq	.L2256
	ldr	r3, [r0, #368]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L2256
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #40]
	cmp	ip, #0
	beq	.L2256
	ldr	ip, [r3, #12]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2256
	cmp	ip, r7
	bls	.L2256
.L2251:
	mov	r5, r7, asl #5
	sub	r5, r5, r7, asl #2
	add	ip, r3, r5
	ldr	r4, [ip, #56]
	ldr	r8, [ip, #40]
	ldr	r6, [ip, #44]
	add	r4, r4, #7
	add	r6, r8, r6
	add	ip, r8, r4, lsr #3
	cmp	ip, r6
	bcs	.L2247
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2258
.L2249:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2259
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	strb	r3, [r4], #1
.L2258:
	ldr	r3, [r0, #368]
	add	r3, r3, r5
	ldr	r1, [r3, #56]
	add	r1, r1, #8
	str	r1, [r3, #56]
	bcc	.L2249
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2259:
	ldr	r3, [r0, #368]
.L2247:
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r7, r7, #1
	add	ip, ip, #1
	strb	ip, [r3]
	ldr	r3, [r0, #368]
	ldr	ip, [r3, #12]
	cmp	ip, r7
	bhi	.L2251
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2256:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetBytes, .-GetBytes
	.align	2
	.global	SkipBytes
	.type	SkipBytes, %function
SkipBytes:
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
	subs	r7, r1, #0
	ble	.L2265
	add	r5, r0, #12288
	ldr	r3, [r5, #1264]
	ldr	r2, [r5, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2265
	add	r6, r0, #13504
	mov	r4, #0
	add	r6, r6, #24
	b	.L2262
.L2263:
	ldr	r3, [r5, #1264]
	ldr	r2, [r5, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2266
.L2262:
	add	r4, r4, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r4, r7
	bne	.L2263
.L2261:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2266:
	mov	r7, r4
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2265:
	mov	r7, #0
	b	.L2261
	UNWIND(.fnend)
	.size	SkipBytes, .-SkipBytes
	.align	2
	.global	H264_DecFramePackingSEI
	.type	H264_DecFramePackingSEI, %function
H264_DecFramePackingSEI:
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
	ldr	r1, .L2274
	mov	r5, r0
	bl	ue_v
	add	r4, r5, #24576
	ldr	r2, .L2274+4
	mov	r1, #1
	str	r0, [r4, #1832]
	mov	r0, r5
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r4, #1809]
	cmp	r0, #0
	beq	.L2273
.L2268:
	mov	r0, r5
	ldr	r2, .L2274+8
	mov	r1, #1
	bl	u_v
	mov	r3, #1
	strb	r3, [r4, #1808]
	strb	r0, [r4, #1810]
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2273:
	ldr	r2, .L2274+12
	mov	r1, #7
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+16
	mov	r1, #1
	str	r0, [r4, #1824]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+20
	mov	r1, #6
	strb	r0, [r4, #1811]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+24
	mov	r1, #1
	str	r0, [r4, #1828]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+28
	mov	r1, #1
	strb	r0, [r4, #1812]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+32
	mov	r1, #1
	strb	r0, [r4, #1813]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+36
	mov	r1, #1
	strb	r0, [r4, #1814]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+40
	mov	r1, #1
	strb	r0, [r4, #1815]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+44
	mov	r1, #1
	strb	r0, [r4, #1816]
	mov	r0, r5
	bl	u_v
	ldrb	r3, [r4, #1811]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #1817]
	bne	.L2269
	ldr	r3, [r4, #1824]
	cmp	r3, #5
	beq	.L2269
	ldr	r2, .L2274+48
	mov	r1, #1
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+52
	mov	r1, #1
	strb	r0, [r4, #1818]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+56
	mov	r1, #1
	strb	r0, [r4, #1819]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2274+60
	mov	r1, #1
	strb	r0, [r4, #1820]
	mov	r0, r5
	bl	u_v
	strb	r0, [r4, #1821]
.L2269:
	ldr	r2, .L2274+64
	mov	r1, #8
	mov	r0, r5
	bl	u_v
	ldr	r1, .L2274+68
	str	r0, [r4, #1836]
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #1840]
	b	.L2268
.L2275:
	.align	2
.L2274:
	.word	.LC284
	.word	.LC285
	.word	.LC301
	.word	.LC286
	.word	.LC287
	.word	.LC288
	.word	.LC289
	.word	.LC290
	.word	.LC291
	.word	.LC292
	.word	.LC293
	.word	.LC294
	.word	.LC295
	.word	.LC296
	.word	.LC297
	.word	.LC298
	.word	.LC299
	.word	.LC300
	UNWIND(.fnend)
	.size	H264_DecFramePackingSEI, .-H264_DecFramePackingSEI
	.align	2
	.global	H264_Sei_Get_Dpb_Output_Time
	.type	H264_Sei_Get_Dpb_Output_Time, %function
H264_Sei_Get_Dpb_Output_Time:
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
	add	r2, r0, #12288
	add	r3, r0, #20480
	mov	r4, #2208
	add	r0, r0, #24576
	ldr	lr, [r2, #1304]
	mov	r1, #4000
	ldr	r3, [r3, #216]
	ldr	r5, [r2, #1300]
	ldr	r2, [r0, #1864]
	mla	r4, r4, r3, lr
	ldr	r3, [r0, #1860]
	ldr	ip, [r0, #1848]
	add	r2, r2, #1
	add	r3, r3, #1
	ldr	lr, [r0, #1852]
	ldr	r4, [r4, #28]
	str	r2, [r0, #1864]
	subs	r2, r3, #1
	str	ip, [r0, #1868]
	mla	r1, r1, r4, r5
	movne	r2, #1
	cmp	ip, #0
	str	r3, [r0, #1860]
	str	lr, [r0, #1876]
	movne	r2, #0
	cmp	r2, #0
	ldr	r2, [r1, #3344]
	ldrne	ip, [r0, #1872]
	str	r2, [r0, #1912]
	addne	ip, ip, #2
	ldr	r2, [r1, #3348]
	strne	ip, [r0, #1868]
	cmp	r3, #1
	str	r2, [r0, #1916]
	beq	.L2284
	ldrb	r3, [r0, #1936]	@ zero_extendqisi2
	add	r4, r0, #1856
	cmp	r3, #1
	ldrd	r2, [r4, #48]
	beq	.L2285
	adds	r2, r2, ip
	adc	r3, r3, #0
	strd	r2, [r4, #40]
.L2279:
	adds	r2, r2, lr
	mov	lr, #0
	adc	r3, r3, #0
	strb	lr, [r0, #1936]
	ldr	r4, [r1, #3368]
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	ldr	r8, [r1, #3344]
	add	lr, r0, #1856
	subs	r6, r2, r4
	sbc	r7, r3, #0
	umull	r4, r5, r6, r8
	mla	r5, r8, r7, r5
	strd	r4, [lr, #24]
	ldr	r1, [r1, #3368]
	subs	r2, r2, r1
	sbc	r3, r3, #0
	strd	r2, [lr, #32]
	str	ip, [r0, #1872]
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2284:
	mov	r6, #0
	str	r6, [r0, #1896]
	mov	r2, r6
	mov	r3, r6
	str	r6, [r0, #1904]
	str	r6, [r0, #1900]
	str	r6, [r0, #1908]
	b	.L2279
.L2285:
	adds	r2, r2, ip
	adc	r3, r3, #0
	strd	r2, [r4, #40]
	strd	r2, [r4, #48]
	b	.L2279
	UNWIND(.fnend)
	.size	H264_Sei_Get_Dpb_Output_Time, .-H264_Sei_Get_Dpb_Output_Time
	.align	2
	.global	H264_Get_Last_IDR_Frame_Info
	.type	H264_Get_Last_IDR_Frame_Info, %function
H264_Get_Last_IDR_Frame_Info:
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
	cmp	r1, #5
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r0]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r4, [r1, #32]
	cmp	r5, r3
	cmpeq	r4, r2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	movw	r2, #26464
	add	r3, r0, #26368
	ldrd	r6, [r0, r2]
	movw	r2, #26496
	strd	r4, [r0, r2]
	strd	r6, [r3, #136]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_Get_Last_IDR_Frame_Info, .-H264_Get_Last_IDR_Frame_Info
	.align	2
	.global	H264_Sei_Get_Frame_Pts
	.type	H264_Sei_Get_Frame_Pts, %function
H264_Sei_Get_Frame_Pts:
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
	add	r3, r0, #26368
	add	r2, r0, #24576
	add	r3, r3, #144
	mov	r4, r0
	movw	r0, #26496
	ldr	r5, [r2, #1912]
	movw	r1, #26464
	ldr	r10, [r2, #1916]
	ldrd	r2, [r3, #-8]
	cmp	r5, #0
	ldrd	r6, [r4, r1]
	strd	r2, [fp, #-60]
	ldrd	r2, [r4, r0]
	strd	r2, [fp, #-52]
	beq	.L2291
	mov	r9, r5
	mov	r0, r10
	b	.L2290
.L2292:
	mov	r9, r1
.L2290:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L2292
.L2289:
	ldrd	r2, [fp, #-60]
	mov	r1, r9
	mov	r0, r5
	mov	r8, #1000
	subs	r2, r6, r2
	movw	r5, #56416
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
.L2291:
	mov	r9, r10
	b	.L2289
	UNWIND(.fnend)
	.size	H264_Sei_Get_Frame_Pts, .-H264_Sei_Get_Frame_Pts
	.align	2
	.global	H264_DecPicTimingSEI
	.type	H264_DecPicTimingSEI, %function
H264_DecPicTimingSEI:
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
	add	r2, r0, #12288
	mov	r4, #4000
	mov	r5, r0
	ldr	r1, [r2, #1344]
	ldr	r3, [r2, #1300]
	mla	r4, r4, r1, r3
	ldrb	r1, [r4, #23]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2294
	ldr	r0, [r2, #1288]
	cmp	r0, #0
	ble	.L2295
	ldrb	r2, [r3, #23]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #4000
	beq	.L2298
	b	.L2316
.L2299:
	ldrb	r1, [r3, #-3977]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2296
.L2298:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, r0
	add	r3, r3, #4000
	bne	.L2299
.L2295:
	ldr	r2, .L2319
	movw	r1, #9210
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
.L2300:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2316:
	mov	r4, r3
.L2296:
	cmp	r4, #0
	beq	.L2295
.L2294:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2302
	ldrb	r3, [r4, #3299]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2317
	ldr	r1, [r4, #3676]
	ldr	r7, [r4, #3680]
	add	r1, r1, #1
	add	r7, r7, #1
.L2306:
	ldr	r2, .L2319+4
	mov	r0, r5
	bl	u_v
	add	r6, r5, #24576
	ldr	r2, .L2319+8
	mov	r1, r7
	str	r0, [r6, #1848]
	mov	r0, r5
	bl	u_v
	add	r3, r5, #57344
	ldr	r2, .L2319+12
	str	r0, [r6, #1852]
	ldr	r3, [r3, #1840]
	ldr	r3, [r2, r3, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2318
.L2302:
	ldrb	r0, [r4, #3303]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2300
	ldr	r2, .L2319+16
	mov	r1, #4
	mov	r0, r5
	add	r5, r5, #24576
	bl	u_v
	mov	r3, #0
	strb	r0, [r5, #1844]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2317:
	ldrb	r3, [r4, #3302]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2302
	ldr	r1, [r4, #3988]
	ldr	r7, [r4, #3992]
	add	r1, r1, #1
	add	r7, r7, #1
	b	.L2306
.L2318:
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L2302
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L2302
	mov	r0, r5
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2302
.L2320:
	.align	2
.L2319:
	.word	.LC302
	.word	.LC303
	.word	.LC304
	.word	s_pstVfmwChan
	.word	.LC305
	UNWIND(.fnend)
	.size	H264_DecPicTimingSEI, .-H264_DecPicTimingSEI
	.align	2
	.global	H264_DecSEI
	.type	H264_DecSEI, %function
H264_DecSEI:
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
	add	r6, r0, #57344
	ldr	r3, .L2470
	mov	r1, #0
	ldr	r2, [r6, #1840]
	mov	r4, r0
	strb	r1, [fp, #-45]
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2451
.L2322:
	ldr	r3, [r4, #368]
	mov	r2, #32
	str	r2, [r3, #56]
.L2323:
	mov	r7, #0
	b	.L2328
.L2324:
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	add	r7, r7, r3
	bl	SkipBytes
	cmp	r0, #0
	ble	.L2452
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2453
.L2328:
	sub	r1, fp, #45
	mov	r2, #1
	mov	r0, r4
	bl	GetBytes
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L2324
	ldr	r2, .L2470+4
	movw	r1, #9298
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
.L2443:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2452:
	ldr	r2, .L2470+4
	movw	r1, #9306
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2453:
	add	r8, r4, #13504
	movw	r9, #21572
	add	r8, r8, #24
	movt	r9, 12615
	mov	r10, #0
.L2417:
	mov	r5, #0
	b	.L2332
.L2329:
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	add	r5, r5, r3
	bl	SkipBytes
	cmp	r0, #0
	ble	.L2454
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2455
.L2332:
	sub	r1, fp, #45
	mov	r2, #1
	mov	r0, r4
	bl	GetBytes
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L2329
	ldr	r2, .L2470+8
	movw	r1, #9328
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2451:
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L2322
	ldr	r2, [r3, #2576]
	cmp	r2, #2
	bne	.L2322
	ldr	r3, [r3, #2568]
	cmp	r3, #1
	bne	.L2322
	ldr	r3, [r0, #368]
	mov	r2, #48
	str	r2, [r3, #56]
	b	.L2323
.L2454:
	ldr	r2, .L2470+8
	movw	r1, #9336
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2455:
	cmp	r5, #409600
	bgt	.L2456
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #12]
	cmp	r3, #2
	ldreq	r3, [r2, #84]
	ldreq	r2, [r2, #56]
	ldrne	r3, [r2, #56]
	addeq	r3, r3, r2
	moveq	r3, r3, lsr #3
	cmp	r7, #45
	ldrls	pc, [pc, r7, asl #2]
	b	.L2336
.L2338:
	.word	.L2337
	.word	.L2339
	.word	.L2340
	.word	.L2341
	.word	.L2342
	.word	.L2342
	.word	.L2343
	.word	.L2344
	.word	.L2345
	.word	.L2346
	.word	.L2347
	.word	.L2348
	.word	.L2349
	.word	.L2350
	.word	.L2351
	.word	.L2352
	.word	.L2353
	.word	.L2354
	.word	.L2355
	.word	.L2356
	.word	.L2357
	.word	.L2358
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2336
	.word	.L2359
.L2359:
	add	r3, r4, #12288
	mov	r1, r5
	mov	r0, r4
	str	r3, [fp, #-56]
	ldr	r7, [r3, #1264]
	bl	H264_DecFramePackingSEI
	ldr	r3, [fp, #-56]
	mov	r1, r5, asl #3
	ldr	r2, [r3, #1264]
	rsb	r2, r7, r2
	cmp	r2, r1
	blt	.L2457
.L2408:
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	blt	.L2458
.L2445:
	ldr	r3, [r6, #800]
.L2361:
	cmp	r3, #3
	bhi	.L2459
	mov	r7, #0
	b	.L2416
.L2413:
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	add	r7, r7, r3
	bl	SkipBytes
	cmp	r0, #0
	ble	.L2460
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2461
.L2416:
	sub	r1, fp, #45
	mov	r2, #1
	mov	r0, r4
	bl	GetBytes
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L2413
	ldr	r2, .L2470+8
	movw	r1, #9875
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2443
.L2358:
	ldr	r2, .L2470+12
	movw	r1, #9808
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9814
	blt	.L2448
.L2411:
	mov	r1, r5
	mov	r0, r4
	bl	SkipBytes
	b	.L2445
.L2355:
	ldr	r2, .L2470+16
	movw	r1, #9766
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9772
	bge	.L2411
.L2448:
	ldr	r3, .L2470+20
	mov	r0, #18
	str	r1, [sp]
	ldr	r2, .L2470+24
	bl	dprint_normal
	b	.L2411
.L2357:
	ldr	r2, .L2470+28
	movw	r1, #9794
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9800
	bge	.L2411
	b	.L2448
.L2356:
	ldr	r2, .L2470+32
	movw	r1, #9780
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9786
	bge	.L2411
	b	.L2448
.L2353:
	ldr	r2, .L2470+36
	movw	r1, #9738
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9744
	bge	.L2411
	b	.L2448
.L2354:
	ldr	r2, .L2470+40
	movw	r1, #9752
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9758
	bge	.L2411
	b	.L2448
.L2352:
	ldr	r2, .L2470+44
	movw	r1, #9724
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9730
	bge	.L2411
	b	.L2448
.L2351:
	ldr	r2, .L2470+48
	movw	r1, #9710
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9716
	bge	.L2411
	b	.L2448
.L2350:
	ldr	r2, .L2470+52
	movw	r1, #9696
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9702
	bge	.L2411
	b	.L2448
.L2349:
	ldr	r2, .L2470+56
	movw	r1, #9682
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9688
	bge	.L2411
	b	.L2448
.L2348:
	ldr	r2, .L2470+60
	movw	r1, #9668
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9674
	bge	.L2411
	b	.L2448
.L2347:
	ldr	r2, .L2470+64
	movw	r1, #9654
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9660
	bge	.L2411
	b	.L2448
.L2346:
	ldr	r2, .L2470+68
	movw	r1, #9640
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9646
	bge	.L2411
	b	.L2448
.L2345:
	ldr	r2, .L2470+72
	movw	r1, #9626
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9632
	bge	.L2411
	b	.L2448
.L2344:
	ldr	r2, .L2470+76
	movw	r1, #9612
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9618
	bge	.L2411
	b	.L2448
.L2343:
	ldr	r2, .L2470+80
	movw	r1, #9596
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	SkipBytes
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2445
	movw	r1, #9606
.L2446:
	ldr	r3, .L2470+20
	mov	r0, #18
	str	r1, [sp]
	ldr	r2, .L2470+24
	bl	dprint_normal
	ldr	r3, [r6, #800]
	b	.L2361
.L2342:
	cmp	r7, #4
	str	r5, [sp]
	beq	.L2368
	cmp	r10, #0
	bne	.L2368
	ldr	r2, .L2470+84
	movw	r1, #9448
	mov	r0, #18
	bl	dprint_normal
.L2370:
	ldr	r7, [r6, #800]
	cmp	r7, #3
	bhi	.L2462
.L2371:
	ldr	r0, [r6, #1840]
	add	r7, r7, #14528
	bl	GetUsd
	add	r7, r7, #8
	add	r7, r4, r7, lsl #2
	str	r0, [r7, #4]
	ldr	r3, [r6, #800]
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	lr, [r3, #4]
	cmp	lr, #0
	beq	.L2420
	ldr	r1, [r4, #368]
	cmp	r5, #1024
	movlt	r3, r5
	movge	r3, #1024
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	ip, [r1, #12]
	str	r3, [fp, #-64]
	cmp	r0, ip
	bcs	.L2421
	sxth	r3, r0
	mov	r7, #0
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r1, r1, r3
.L2373:
	ldr	r2, [r1, #56]
	add	r0, r0, #1
	ldr	r3, [r1, #44]
	cmp	r0, ip
	add	r2, r2, #7
	add	r1, r1, #28
	sub	r3, r3, r2, lsr #3
	add	r7, r7, r3
	bne	.L2373
	mov	r3, r7
.L2372:
	ldr	r1, [fp, #-64]
	sxtb	r2, r10
	str	r2, [fp, #-68]
	cmp	r1, r3
	movle	r7, r1
	cmp	r2, #1
	movne	r3, #0
	strne	r3, [fp, #-56]
	strne	r3, [fp, #-60]
	beq	.L2463
.L2375:
	ldr	r3, [fp, #-56]
	rsb	r2, r3, r7
	cmp	r2, #0
	ble	.L2464
	ldr	r1, [r6, #800]
	mov	r0, r4
	add	r3, r1, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	GetBytes
	subs	r7, r0, #0
	ble	.L2465
	cmp	r7, #4
	ble	.L2444
	ldr	r2, [r6, #800]
	add	r2, r4, r2, lsl #2
	add	r2, r2, #57344
	ldr	r3, [r2, #804]
	ldr	r1, [r3]
	cmp	r1, r9
	beq	.L2466
.L2382:
	ldr	r2, [fp, #-64]
	ldr	r1, [fp, #-60]
	rsb	r2, r1, r2
	cmp	r7, r2
	blt	.L2467
	ldr	r2, [fp, #-64]
	cmp	r2, r5
	ldr	r2, [fp, #-60]
	rsb	r7, r2, r5
	str	r7, [r3, #1052]
	bcc	.L2468
.L2387:
	mov	r1, r7
	mov	r0, r4
	bl	SkipBytes
.L2385:
	ldr	r3, [r6, #800]
	ldr	r1, [r4]
	add	r3, r3, #14528
	ldr	ip, .L2470+88
	add	r3, r3, #8
	ldr	r2, [fp, #-68]
	ldrd	r0, [r1, #32]
	add	r3, r4, r3, lsl #2
	cmp	r2, #1
	ldr	r5, [ip]
	ldr	r3, [r3, #4]
	moveq	r2, #8
	movne	r2, #9
	cmp	r5, #0
	add	r3, r3, #1056
	strd	r0, [r3]
	ldr	r3, [r6, #800]
	add	r3, r3, #14528
	add	r3, r3, #8
.L2450:
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r2, [r3, #1040]
	ldr	r3, [r6, #800]
	ldr	r2, [r6, #1800]
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r2, [r3, #1044]
	beq	.L2390
	ldr	r2, [r6, #800]
	movw	r3, #1064
	mov	r1, #5
	ldr	r0, [r6, #1840]
	add	r2, r2, #14528
	add	r2, r2, #8
	add	r2, r4, r2, lsl #2
	ldr	r2, [r2, #4]
	blx	r5
.L2390:
	ldr	r3, [r6, #800]
	add	r3, r3, #1
	str	r3, [r6, #800]
	b	.L2361
.L2341:
	ldr	r2, .L2470+92
	movw	r1, #9422
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9428
	bge	.L2411
	b	.L2448
.L2340:
	ldr	r2, .L2470+96
	mov	r1, #9408
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9414
	bge	.L2411
	b	.L2448
.L2339:
	add	r7, r4, #12288
	ldr	r2, .L2470+100
	movw	r1, #9381
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	ldr	r3, [r7, #1264]
	mov	r1, r5
	mov	r0, r4
	str	r3, [fp, #-56]
	bl	H264_DecPicTimingSEI
	ldr	r2, [r7, #1264]
	mov	r1, r5, asl #3
	ldr	r3, [fp, #-56]
	rsb	r3, r3, r2
	cmp	r3, r1
	blt	.L2469
.L2363:
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2445
	movw	r1, #9402
	b	.L2446
.L2337:
	add	r2, r4, #24576
	str	r5, [sp]
	mov	ip, #1
	mov	r1, #0
	ldr	r0, [r2, #1856]
	str	r1, [r2, #1864]
	movw	r1, #9367
	add	r0, r0, ip
	strb	ip, [r2, #1936]
	str	r0, [r2, #1856]
	mov	r0, #18
	ldr	r2, .L2470+104
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	movwlt	r1, #9373
	bge	.L2411
	b	.L2448
.L2336:
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2411
	movw	r1, #9854
	b	.L2448
.L2460:
	ldr	r2, .L2470+8
	movw	r1, #9883
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2443
.L2461:
	cmp	r3, #128
	bne	.L2417
	mov	r0, #0
	b	.L2443
.L2383:
	movw	r1, #9557
	ldr	r3, .L2470+20
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L2470+108
	bl	dprint_normal
.L2444:
	ldr	r3, [r6, #800]
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	b	.L2382
.L2456:
	ldr	r2, .L2470+112
	mov	r1, #9344
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2443
.L2459:
	ldr	r2, .L2470+116
	movw	r1, #9864
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2443
.L2458:
	movw	r1, #9842
	b	.L2446
.L2466:
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	sub	r1, r1, #65
	clz	r1, r1
	mov	r1, r1, lsr #5
	str	r1, [r6, #1924]
	cmp	r1, #0
	beq	.L2383
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	and	r3, r3, #15
	str	r3, [r6, #1928]
	ldr	r3, [r2, #804]
	b	.L2382
.L2469:
	rsb	r3, r3, r1
	mov	r0, r4
	cmp	r3, #0
	add	r1, r3, #7
	str	r3, [fp, #-56]
	movge	r1, r3
	mov	r1, r1, asr #3
	bl	SkipBytes
	ldr	r3, [fp, #-56]
	ldr	r2, [r7, #1264]
	ldr	r0, [r7, #1256]
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #29
	add	r3, r3, r1
	and	r3, r3, #7
	rsb	r1, r1, r3
	add	r2, r1, r2
	cmp	r2, r0, asl #3
	bhi	.L2363
	mov	r0, r8
	bl	BsSkip
	b	.L2363
.L2468:
	ldr	r3, [fp, #-64]
	mov	r0, r4
	rsb	r1, r3, r5
	bl	PassBytes
	cmp	r0, #0
	bge	.L2387
	movw	r1, #9580
	ldr	r3, .L2470+20
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2470+24
	bl	dprint_normal
	b	.L2387
.L2467:
	str	r7, [r3, #1052]
	mov	r1, r7
	mov	r0, r4
	bl	SkipBytes
	b	.L2385
.L2368:
	ldr	r2, .L2470+120
	movw	r1, #9444
	mov	r0, #18
	mov	r10, #1
	bl	dprint_normal
	b	.L2370
.L2457:
	rsb	r7, r2, r1
	mov	r0, r4
	cmp	r7, #0
	add	r1, r7, #7
	movge	r1, r7
	mov	r1, r1, asr #3
	bl	SkipBytes
	ldr	r3, [fp, #-56]
	mov	r1, r7, asr #31
	mov	r1, r1, lsr #29
	ldr	r2, [r3, #1264]
	ldr	r0, [r3, #1256]
	add	r3, r7, r1
	and	r3, r3, #7
	rsb	r1, r1, r3
	add	r2, r1, r2
	cmp	r2, r0, asl #3
	bhi	.L2408
	mov	r0, r8
	bl	BsSkip
	b	.L2408
.L2463:
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	mov	r1, #8
	ldr	r2, .L2470+124
	mov	r0, r4
	strb	r3, [lr, #1026]
	ldr	r3, [r6, #800]
	add	r3, r3, #14528
	add	r3, r3, r1
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [fp, #-56]
	bl	u_v
	ldr	r3, [fp, #-56]
	strb	r0, [r3, #1027]
	ldr	r3, [r6, #800]
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	ldrb	r2, [r3, #1027]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L2376
	mov	r2, #3
	str	r2, [fp, #-56]
	mov	r1, r2
	mov	r2, #0
	str	r1, [fp, #-60]
	strb	r2, [r3, #1028]
.L2377:
	ldr	r3, [r6, #800]
	mov	r1, #16
	ldr	r2, .L2470+128
	mov	r0, r4
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [fp, #-72]
	bl	u_v
	ldr	r3, [fp, #-72]
	ldr	r1, [fp, #-56]
	add	r3, r3, #1024
	strh	r0, [r3, #6]	@ movhi
	mov	r0, r4
	bl	PassBytes
	ldr	r3, [fp, #-56]
	cmp	r7, r3
	bne	.L2375
	ldr	r3, [r6, #800]
	mov	r2, #8
	ldr	r1, [r4]
	add	r3, r3, #14528
	ldr	ip, .L2470+88
	add	r3, r3, r2
	ldrd	r0, [r1, #32]
	add	r3, r4, r3, lsl #2
	ldr	r5, [ip]
	ldr	r3, [r3, #4]
	cmp	r5, #0
	add	r3, r3, #1056
	strd	r0, [r3]
	ldr	r3, [r6, #800]
	add	r3, r3, #14528
	add	r3, r3, r2
	b	.L2450
.L2462:
	ldr	r1, [r6, #804]
	ldr	r0, [r6, #1840]
	bl	FreeUsdByDec
	ldr	r1, [r6, #808]
	ldr	r0, [r6, #1840]
	bl	FreeUsdByDec
	ldr	r1, [r6, #812]
	ldr	r0, [r6, #1840]
	bl	FreeUsdByDec
	ldr	r1, [r6, #816]
	ldr	r0, [r6, #1840]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r7, r3
	str	r3, [r6, #804]
	str	r3, [r6, #808]
	str	r3, [r6, #812]
	str	r3, [r6, #816]
	str	r3, [r6, #800]
	b	.L2371
.L2421:
	mov	r3, #0
	mov	r7, r3
	b	.L2372
.L2465:
	ldr	r2, .L2470+132
	movw	r1, #9538
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r6, #800]
	ldr	r0, [r6, #1840]
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	FreeUsdByDec
	ldr	r3, [r6, #800]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r4, r4, r3, lsl #2
	str	r2, [r4, #4]
	b	.L2443
.L2464:
	mov	r3, r2
	movw	r1, #9528
	ldr	r2, .L2470+136
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r6, #800]
	ldr	r0, [r6, #1840]
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	FreeUsdByDec
	ldr	r3, [r6, #800]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #14528
	add	r3, r3, #8
	add	r3, r4, r3, lsl #2
	str	r2, [r3, #4]
	b	.L2443
.L2420:
	mvn	r0, #0
	b	.L2443
.L2376:
	ldr	r2, .L2470+140
	mov	r1, #8
	mov	r0, r4
	str	r3, [fp, #-72]
	mov	r3, #4
	str	r3, [fp, #-56]
	bl	u_v
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-72]
	strb	r0, [r3, #1028]
	b	.L2377
.L2471:
	.align	2
.L2470:
	.word	s_pstVfmwChan
	.word	.LC306
	.word	.LC307
	.word	.LC336
	.word	.LC333
	.word	.LANCHOR0+288
	.word	.LC310
	.word	.LC335
	.word	.LC334
	.word	.LC331
	.word	.LC332
	.word	.LC330
	.word	.LC329
	.word	.LC328
	.word	.LC327
	.word	.LC326
	.word	.LC325
	.word	.LC324
	.word	.LC323
	.word	.LC322
	.word	.LC321
	.word	.LC315
	.word	g_EventReportFunc
	.word	.LC313
	.word	.LC312
	.word	.LC311
	.word	.LC309
	.word	.LC338
	.word	.LC308
	.word	.LC337
	.word	.LC314
	.word	.LC316
	.word	.LC318
	.word	.LC320
	.word	.LC319
	.word	.LC317
	UNWIND(.fnend)
	.size	H264_DecSEI, .-H264_DecSEI
	.align	2
	.global	InitOldSlice
	.type	InitOldSlice, %function
InitOldSlice:
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
	add	r2, r0, #12288
	add	r0, r0, #20480
	movw	r3, #23352
	ldr	r1, [r2, #1292]
	movt	r3, 1
	mov	r2, #2
	str	r3, [r0, #1864]
	strb	r2, [r0, #1849]
	mov	r3, #32
	mov	r2, #7
	strb	r3, [r0, #1850]
	str	r2, [r0, #1860]
	mvn	r3, #0
	mov	r2, #3
	str	r3, [r0, #1876]
	str	r2, [r0, #1872]
	mov	r3, #0
	mov	r2, #1048576
	str	r1, [r0, #1856]
	str	r2, [r0, #1888]
	strb	r3, [r0, #1848]
	str	r3, [r0, #1880]
	str	r3, [r0, #1884]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	InitOldSlice, .-InitOldSlice
	.align	2
	.global	H264_IsNewPicNal
	.type	H264_IsNewPicNal, %function
H264_IsNewPicNal:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	mov	r5, r0
	and	r3, r3, #31
	sub	r3, r3, #1
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L2481
.L2476:
	.word	.L2475
	.word	.L2481
	.word	.L2481
	.word	.L2481
	.word	.L2475
	.word	.L2481
	.word	.L2477
	.word	.L2477
.L2477:
	ldr	r0, [r0]
	mov	r3, #1
	str	r3, [r5]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2475:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L2478
.L2480:
	mvn	r0, #0
.L2479:
	mov	r3, #0
	str	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2481:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2478:
	ldrb	r3, [r1, #5]	@ zero_extendqisi2
	ldrb	r0, [r1, #6]	@ zero_extendqisi2
	ldrb	r2, [r1, #7]	@ zero_extendqisi2
	ldrb	r4, [r1, #4]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	orr	r3, r3, r0, asl #8
	orr	r3, r3, r2
	orr	r4, r3, r4, asl #24
	mov	r0, r4
	bl	ZerosMS_32
	cmp	r0, #15
	bhi	.L2480
	mov	r0, r0, asl #1
	rsb	r0, r0, #31
	mov	r0, r4, lsr r0
	subs	r0, r0, #1
	mvnne	r0, #0
	b	.L2479
	UNWIND(.fnend)
	.size	H264_IsNewPicNal, .-H264_IsNewPicNal
	.align	2
	.global	FindZeroBitsInSeg
	.type	FindZeroBitsInSeg, %function
FindZeroBitsInSeg:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r9, r0
	str	r1, [fp, #-48]
	movle	r4, #1
	movgt	r4, #0
	ble	.L2508
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2496
	ldr	r5, .L2509
	ldr	r10, .L2509+4
.L2494:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2509
	movcc	r6, r7
	movcs	r6, #64
	mov	r2, r6
	rsb	r1, r6, r7
	sub	r6, r6, #1
	add	r1, r9, r1
	blx	r3
	add	r3, r5, r6
	ldrb	r2, [r5, r6]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2486
	ldr	r2, .L2509
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2489
	b	.L2487
.L2490:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2487
.L2489:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2490
.L2486:
	mov	r0, r4, asl #3
.L2485:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2498
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2498
.L2493:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2491
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2493
	b	.L2491
.L2487:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2494
	b	.L2486
.L2498:
	mov	r3, #0
.L2491:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2508:
	mov	r3, r1
	ldr	r2, .L2509+8
	movw	r1, #10250
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2496:
	mov	r0, r4
	b	.L2485
.L2510:
	.align	2
.L2509:
	.word	.LANCHOR3-1976
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC339
	UNWIND(.fnend)
	.size	FindZeroBitsInSeg, .-FindZeroBitsInSeg
	.align	2
	.global	FindTrailZeros
	.type	FindTrailZeros, %function
FindTrailZeros:
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
	beq	.L2517
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bls	.L2516
	ldr	r1, [r3, #72]
	ldr	r0, [r3, #68]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #72]
	cmp	r0, r2, asl #3
	bcs	.L2520
	cmn	r0, #1
	beq	.L2516
.L2515:
	add	r0, r0, #1
	str	r0, [r3, #16]
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bls	.L2519
	ldr	r1, [r3, #72]
	ldr	r2, [r3, #16]
	cmp	r2, r1, asl #3
	bcs	.L2521
.L2519:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2521:
	add	r2, r4, #57344
	ldr	r1, [r3, #92]
	ldr	r0, [r2, #1840]
	bl	SM_ReleaseStreamSeg
	ldr	r2, [r4, #368]
	mov	r3, #0
	mov	r1, #1
	mov	r0, r3
	str	r3, [r2, #68]
	ldr	r2, [r4, #368]
	str	r1, [r2, #12]
	ldr	r2, [r4, #368]
	str	r3, [r2, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2520:
	add	r2, r4, #57344
	ldr	r1, [r3, #92]
	ldr	r0, [r2, #1840]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #68]
	ldr	r3, [r4, #368]
	str	r2, [r3, #12]
	ldr	r3, [r4, #368]
.L2516:
	ldr	r1, [r3, #44]
	ldr	r0, [r3, #40]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	b	.L2515
.L2517:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	FindTrailZeros, .-FindTrailZeros
	.align	2
	.global	CombinePacket
	.type	CombinePacket, %function
CombinePacket:
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
	ldr	r3, [r0, #368]
	ldr	r3, [r3, #44]
	cmp	r3, #4096
	ldmcsfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CombinePacket.part.12
	UNWIND(.fnend)
	.size	CombinePacket, .-CombinePacket
	.align	2
	.global	FindNaluArraySlot
	.type	FindNaluArraySlot, %function
FindNaluArraySlot:
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
	mov	ip, r0
	ldrb	r0, [r0, #377]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2529
	mov	r2, ip
	mov	r3, #1
	b	.L2527
.L2526:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2532
.L2527:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L2526
	mov	r0, r3
.L2525:
	mov	r2, r3, asl #7
	mov	r1, #1
	sub	r3, r2, r3, asl #5
	add	ip, ip, r3
	strb	r1, [ip, #377]
	ldmfd	sp, {fp, sp, pc}
.L2532:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2529:
	mov	r3, r0
	b	.L2525
	UNWIND(.fnend)
	.size	FindNaluArraySlot, .-FindNaluArraySlot
	.align	2
	.global	InquireSliceExtProperty
	.type	InquireSliceExtProperty, %function
InquireSliceExtProperty:
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
	add	r0, r0, #13504
	add	r0, r0, #24
	mov	r1, #24
	bl	BsGet
	ldr	r3, [r4, #368]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #3]
	ldr	r2, [r4, #368]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r4, #57344
	ldreqb	r0, [r3, #148]	@ zero_extendqisi2
	beq	.L2535
	ubfx	lr, r0, #16, #6
	ubfx	ip, r0, #15, #1
	ubfx	r1, r0, #12, #3
	strb	lr, [r3, #149]
	strb	ip, [r3, #150]
	ubfx	lr, r0, #8, #4
	ubfx	ip, r0, #5, #3
	strb	r1, [r3, #151]
	strb	lr, [r3, #152]
	ubfx	r1, r0, #4, #1
	ubfx	lr, r0, #3, #1
	strb	ip, [r3, #153]
	strb	r1, [r3, #154]
	ubfx	ip, r0, #2, #1
	and	r1, r0, #3
	strb	lr, [r3, #155]
	ubfx	r0, r0, #22, #1
	strb	ip, [r3, #156]
	strb	r1, [r3, #157]
	strb	r0, [r3, #148]
.L2535:
	cmp	r0, #1
	mov	r0, #0
	moveq	r3, #5
	streqb	r3, [r2, #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	InquireSliceExtProperty, .-InquireSliceExtProperty
	.align	2
	.global	InquireSliceProperty
	.type	InquireSliceProperty, %function
InquireSliceProperty:
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
	add	r6, r0, #57344
	mov	r4, r0
	mov	r9, r1
	mov	r7, r2
	ldr	r3, [r6, #1784]
	movw	r1, #10567
	ldr	r2, .L2548
	mov	r0, #20
	sub	r3, r3, #1
	add	r5, r4, #20480
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r7]
	mov	r0, r4
	str	r3, [r9]
	ldr	r3, [r4, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r5, #211]
	ldr	r3, [r3, #20]
	str	r3, [r5, #236]
	bl	SliceCheck
	subs	r8, r0, #0
	bne	.L2542
	mov	r0, r4
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L2546
	ldrb	r0, [r5, #213]	@ zero_extendqisi2
	add	r3, r4, #12288
	mov	r1, #2208
	mov	ip, #4000
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r9]
	ldr	r0, [r5, #216]
	ldr	lr, [r3, #1304]
	ldr	r2, [r3, #1300]
	mla	r1, r1, r0, lr
	ldr	lr, [r6, #1852]
	ldr	r0, [r3, #1276]
	cmp	lr, #1
	ldr	lr, [r3, #1280]
	ldr	r3, [r1, #28]
	mla	r2, ip, r3, r2
	ldrb	r3, [r2, #18]	@ zero_extendqisi2
	ldr	r5, [r2, #3252]
	rsb	r3, r3, #2
	ldr	r1, [r2, #3248]
	mla	r5, r5, r3, r3
	add	r9, r1, #1
	beq	.L2547
	cmp	r0, r9
	cmpeq	lr, r5
	add	r4, r4, #24576
	movne	r3, #1
	strne	r3, [r7]
	ldr	r3, [r4, #2136]
	ldr	r2, [r2, #3272]
	add	r3, r3, #1
	cmp	r2, r3
	movne	r3, #1
	strne	r3, [r7]
.L2538:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2547:
	add	r0, r4, #13504
	add	r0, r0, #24
	bl	BsResidBits
	ldr	r1, [r6, #1764]
	add	r1, r1, #1
	mov	r8, r0
	mul	r0, r5, r9
	bl	__aeabi_uidiv
	mov	r3, r8, lsr #31
	cmp	r8, r0
	movge	r0, r3
	orrlt	r0, r3, #1
	rsb	r8, r0, #0
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2542:
	mvn	r8, #0
	b	.L2538
.L2546:
	ldr	r2, .L2548+4
	movw	r1, #10583
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2538
.L2549:
	.align	2
.L2548:
	.word	.LC340
	.word	.LC341
	UNWIND(.fnend)
	.size	InquireSliceProperty, .-InquireSliceProperty
	.align	2
	.global	HaveSliceToDec
	.type	HaveSliceToDec, %function
HaveSliceToDec:
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
	add	r0, r0, #57344
	ldr	r0, [r0, #1764]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HaveSliceToDec, .-HaveSliceToDec
	.align	2
	.global	IsRefListWrong
	.type	IsRefListWrong, %function
IsRefListWrong:
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
	add	r6, r0, #20480
	mov	r7, r0
	ldr	r3, [r6, #248]
	cmp	r3, #0
	beq	.L2552
	add	r5, r0, #26880
	add	r8, r0, #57344
	add	r5, r5, #240
	mov	r4, #0
	b	.L2556
.L2553:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L2555
	ldr	r3, [r6, #248]
	cmp	r4, r3
	bcs	.L2578
.L2556:
	ldr	r3, [r5, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #1840]
	ldr	r3, [r3, #36]
	ldr	r1, [r3, #544]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2553
.L2555:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2578:
	cmp	r3, #0
	beq	.L2552
	ldr	r3, [r6, #252]
	cmp	r3, #0
	addne	r7, r7, #27136
	movne	r4, #0
	addne	r7, r7, #116
	bne	.L2559
	b	.L2552
.L2579:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L2555
	ldr	r3, [r6, #252]
	cmp	r4, r3
	bcs	.L2552
.L2559:
	ldr	r3, [r7, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #1840]
	ldr	r3, [r3, #36]
	ldr	r1, [r3, #544]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2579
	b	.L2555
.L2552:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	IsRefListWrong, .-IsRefListWrong
	.align	2
	.global	H264_SaveMetadata
	.type	H264_SaveMetadata, %function
H264_SaveMetadata:
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
	ldr	r5, .L2582
	mov	r6, r0
	mov	r7, r1
	mov	r8, r2
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r4, .L2582+4
	mov	r0, #0
	ldr	r3, [r4, #16]
	blx	r3
	ldr	r3, [r4, #44]
	ldr	r2, [r5, r6, asl #2]
	mov	r1, r8
	mov	r0, r7
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L2583:
	.align	2
.L2582:
	.word	g_SaveMetadataFileHandler
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	H264_SaveMetadata, .-H264_SaveMetadata
	.align	2
	.global	H264_SaveElStream
	.type	H264_SaveElStream, %function
H264_SaveElStream:
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
	ldr	r5, .L2586
	mov	r6, r0
	mov	r7, r1
	mov	r8, r2
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r4, .L2586+4
	mov	r0, #0
	ldr	r3, [r4, #16]
	blx	r3
	ldr	r3, [r4, #44]
	ldr	r2, [r5, r6, asl #2]
	mov	r1, r8
	mov	r0, r7
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L2587:
	.align	2
.L2586:
	.word	g_SaveElFileHandler
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	H264_SaveElStream, .-H264_SaveElStream
	.align	2
	.global	H264DEC_IsNeedSedOnly
	.type	H264DEC_IsNeedSedOnly, %function
H264DEC_IsNeedSedOnly:
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
	add	r2, r0, #57344
	ldr	r3, [r2, #1764]
	cmp	r3, #0
	beq	.L2591
	ldr	r1, [r0, #360]
	cmp	r1, #0
	beq	.L2595
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2591:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2595:
	ldr	ip, [r2, #1864]
	cmp	r3, ip
	beq	.L2594
	ldr	r3, [r2, #1852]
	cmp	r3, #1
	beq	.L2596
	cmp	r3, #0
	beq	.L2597
.L2594:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
.L2597:
	ldr	r0, [r2, #1840]
	bl	VCTRL_CheckFreshSeg
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L2596:
	ldr	r3, [r0, #368]
	adds	r0, r3, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_IsNeedSedOnly, .-H264DEC_IsNeedSedOnly
	.align	2
	.global	H264DEC_IsSliceUnit
	.type	H264DEC_IsSliceUnit, %function
H264DEC_IsSliceUnit:
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
	bic	r3, r0, #4
	cmp	r0, #20
	cmpne	r3, #1
	moveq	r0, #1
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_IsSliceUnit, .-H264DEC_IsSliceUnit
	.align	2
	.global	H264DEC_IsFrameEndNal
	.type	H264DEC_IsFrameEndNal, %function
H264DEC_IsFrameEndNal:
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
	sub	r3, r0, #7
	cmp	r3, #1
	bls	.L2601
	bic	r3, r0, #4
	cmp	r3, #11
	cmpne	r0, #30
	moveq	r0, #1
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2601:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_IsFrameEndNal, .-H264DEC_IsFrameEndNal
	.align	2
	.global	H264DEC_RecycleImage
	.type	H264DEC_RecycleImage, %function
H264DEC_RecycleImage:
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
	add	r5, r0, #57344
	mov	r8, r1
	ldr	r2, .L2613
	movw	r1, #11435
	mov	r0, #3
	bl	dprint_normal
	ldr	r0, [r5, #1840]
	mov	r1, r8
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L2607
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L2607
	add	r4, r0, #200
	add	r9, r0, #232
	mov	r6, #0
	mov	r7, #0
.L2605:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L2612
.L2604:
	cmp	r4, r9
	bne	.L2605
	ldr	r0, [r5, #1840]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2612:
	mov	r1, r2
	ldr	r0, [r5, #1840]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L2604
.L2607:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2614:
	.align	2
.L2613:
	.word	.LC342
	UNWIND(.fnend)
	.size	H264DEC_RecycleImage, .-H264DEC_RecycleImage
	.align	2
	.global	OutputFrmToVO
	.type	OutputFrmToVO, %function
OutputFrmToVO:
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
	mov	r4, r0
	mov	r5, r1
	moveq	r3, #1
	movne	r3, #0
	beq	.L2652
	ldr	r2, [r0]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L2618
	add	r2, r0, #57344
	ldr	r1, [r2, #1768]
	cmp	r1, #2
	beq	.L2618
	ldr	r1, [r2, #140]
	cmp	r1, #0
	strneb	r3, [r1, #1]
	movne	r0, #1
	strne	r3, [r2, #140]
	beq	.L2620
.L2617:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2618:
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	cmn	r0, #3
	beq	.L2620
	add	r6, r4, #57344
	ldr	r1, [r6, #140]
	cmp	r1, #0
	beq	.L2621
	mov	r0, r4
	bl	GetImagePara
	ldr	r1, [r6, #140]
	mov	r0, r4
	bl	CheckFrameStore
	subs	r7, r0, #0
	beq	.L2653
	cmn	r7, #3
	beq	.L2627
	movw	r3, #1718
	str	r7, [sp]
	mov	r1, r3
	ldr	r2, .L2661
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r6, #140]
	mov	r0, r4
	ldr	r1, [r3, #96]
	bl	H264DEC_RecycleImage
.L2627:
	ldr	r3, [r6, #140]
	mov	r0, #0
	strb	r0, [r3, #1]
	ldr	r3, [r6, #140]
	str	r0, [r6, #140]
	cmp	r5, r3
	beq	.L2617
.L2621:
	mov	r1, r5
	mov	r0, r4
	bl	GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	subs	r7, r0, #0
	beq	.L2654
	cmn	r7, #3
	beq	.L2620
	movw	r3, #1771
	ldr	r2, .L2661
	mov	r1, r3
	str	r7, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #96]
	mov	r0, r4
	bl	H264DEC_RecycleImage
	mov	r0, #2
	b	.L2617
.L2652:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L2661+4
	movw	r1, #1660
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2620:
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2654:
	ldr	r1, [r5, #544]
	ldr	r0, [r6, #1840]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2655
	mov	r2, #1
	ldr	r1, [r5, #544]
	ldr	r0, [r6, #1840]
	bl	FSP_SetDisplay
	ldr	r0, [r6, #1840]
	add	r3, r4, #8
	str	r8, [sp]
	mov	r2, r4
	mov	r1, r7
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2656
	ldr	r3, [r4]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	strcc	r7, [r8, #16]
	bcs	.L2657
.L2633:
	ldr	r2, [r6, #1896]
	mov	r0, #0
	ldr	r3, [r6, #1888]
	add	r2, r2, #1
	str	r2, [r6, #1896]
	add	r3, r3, #2
	str	r3, [r6, #1888]
	b	.L2617
.L2653:
	ldr	r3, [r6, #140]
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2658
	ldr	r3, [r6, #140]
	mov	r2, #1
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
	ldr	r0, [r6, #1840]
	add	r3, r4, #8
	str	r8, [sp]
	mov	r2, r4
	mov	r1, r7
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2659
	ldr	r3, [r4]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	strcc	r7, [r8, #16]
	bcs	.L2660
.L2626:
	ldr	r2, [r6, #1896]
	ldr	r3, [r6, #1888]
	add	r2, r2, #1
	str	r2, [r6, #1896]
	add	r3, r3, #2
	str	r3, [r6, #1888]
	b	.L2627
.L2657:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.2
	b	.L2633
.L2660:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.2
	b	.L2626
.L2656:
	mov	r3, r0
	ldr	r2, .L2661+8
	movw	r1, #1755
	mov	r0, r7
	bl	dprint_normal
	mov	r2, r7
	ldr	r1, [r5, #544]
	ldr	r0, [r6, #1840]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2617
.L2659:
	mov	r3, r0
	ldr	r2, .L2661+8
	movw	r1, #1703
	mov	r0, r7
	bl	dprint_normal
	ldr	r3, [r6, #140]
	mov	r2, r7
	strb	r7, [r3, #1]
	ldr	r3, [r6, #140]
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
	str	r7, [r6, #140]
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2617
.L2655:
	movw	r3, #1745
	ldr	r2, .L2661+12
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L2617
.L2658:
	movw	r3, #1693
	ldr	r2, .L2661+16
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L2617
.L2662:
	.align	2
.L2661:
	.word	.LC346
	.word	.LC343
	.word	.LC345
	.word	.LC347
	.word	.LC344
	UNWIND(.fnend)
	.size	OutputFrmToVO, .-OutputFrmToVO
	.align	2
	.global	OutputFrmFromDPB
	.type	OutputFrmFromDPB, %function
OutputFrmFromDPB:
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
	add	r4, r0, r1, lsl #2
	add	r4, r4, #24576
	mov	r7, r1
	mov	r6, r0
	ldr	r3, [r4, #1944]
	cmp	r3, #0
	beq	.L2667
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r1, [r4, #1944]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1944]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r5, r0
	beq	.L2668
.L2665:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2668:
	mov	r0, r6
	mov	r1, r7
	bl	RemoveFrameStoreOutDPB
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2667:
	movw	r1, #1785
	ldr	r3, .L2669
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L2669+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L2665
.L2670:
	.align	2
.L2669:
	.word	.LANCHOR0+300
	.word	.LC348
	UNWIND(.fnend)
	.size	OutputFrmFromDPB, .-OutputFrmFromDPB
	.align	2
	.global	FlushDPB
	.type	FlushDPB, %function
FlushDPB:
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
	add	r6, r0, #24576
	mov	r4, r0
	ldr	r3, [r6, #2140]
	cmp	r3, #0
	beq	.L2673
	add	r7, r0, #26368
	mov	r5, #0
	add	r7, r7, #148
	b	.L2675
.L2674:
	ldr	r3, [r6, #2140]
	cmp	r3, r5
	bls	.L2673
.L2675:
	ldr	r1, [r7, #4]!
	add	r5, r5, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2674
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r6, #2140]
	cmp	r3, r5
	bhi	.L2675
.L2673:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L2677
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2673
	b	.L2677
.L2679:
	bl	GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	OutputFrmFromDPB
	cmn	r0, #1
	beq	.L2678
.L2677:
	ldr	r3, [r6, #2140]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L2679
	mov	r0, r3
.L2678:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	FlushDPB, .-FlushDPB
	.align	2
	.global	AdaptiveMemMark
	.type	AdaptiveMemMark, %function
AdaptiveMemMark:
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
	add	r3, r0, #53248
	add	r8, r0, #56064
	add	r2, r0, #26368
	ldr	r4, [r3, #3500]
	add	r8, r8, #128
	mov	r6, r0
	str	r3, [fp, #-56]
	add	r7, r4, #2000
	add	r4, r4, #4
	add	r7, r7, #4
	add	r3, r2, #212
	str	r3, [fp, #-52]
	add	r3, r0, #16384
	str	r3, [fp, #-48]
.L2700:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L2688
.L2690:
	.word	.L2689
	.word	.L2691
	.word	.L2692
	.word	.L2693
	.word	.L2694
	.word	.L2695
	.word	.L2696
.L2696:
	ldr	r2, [r4, #12]
	mov	r1, r8
	mov	r0, r6
	bl	MarkCurrPicLT
.L2688:
	add	r4, r4, #20
	cmp	r4, r7
	bne	.L2700
.L2689:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #3444]
	cmp	r3, #1
	movne	r0, #0
	beq	.L2709
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2695:
	add	r9, r6, #24576
	ldr	r3, [r9, #2144]
	cmp	r3, #0
	ldrne	r10, [fp, #-52]
	movne	r5, #0
	beq	.L2699
.L2698:
	ldr	r1, [r10, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r9, #2144]
	add	r5, r5, #1
	cmp	r5, r3
	bcc	.L2698
.L2699:
	mov	r0, r6
	bl	UpdateReflist
	mov	r1, #0
	mov	r0, r6
	bl	UpdateMaxLTFrmIdx
	mov	r0, r6
	bl	UpdateLTReflist
	ldr	r2, [fp, #-48]
	mov	r3, #1
	str	r3, [r2, #3444]
	b	.L2688
.L2694:
	mov	r0, r6
	ldr	r1, [r4, #16]
	bl	UpdateMaxLTFrmIdx
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2688
.L2693:
	ldr	r3, [r4, #12]
	mov	r1, r8
	ldr	r2, [r4, #4]
	mov	r0, r6
	bl	MarkSTToLTRef
	mov	r0, r6
	bl	UpdateReflist
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2688
.L2692:
	mov	r0, r6
	ldr	r2, [r4, #8]
	mov	r1, r8
	bl	UnMarkLTRef
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2688
.L2691:
	mov	r0, r6
	ldr	r2, [r4, #4]
	mov	r1, r8
	bl	UnMarkSTRef
	mov	r0, r6
	bl	UpdateReflist
	b	.L2688
.L2709:
	ldr	r1, [fp, #-56]
	mov	r3, #0
	ldrb	r2, [r1, #2947]	@ zero_extendqisi2
	str	r3, [r1, #3504]
	cmp	r2, #1
	beq	.L2703
	bcc	.L2704
	cmp	r2, #2
	bne	.L2702
	ldr	r2, [fp, #-56]
	str	r3, [r2, #3528]
	str	r3, [r2, #3516]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #3456]
	str	r3, [r2, #3464]
.L2702:
	mov	r0, r6
	bl	FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2704:
	ldr	r0, [fp, #-56]
	ldr	r1, [r0, #3516]
	ldr	r2, [r0, #3524]
	ldr	r3, [r0, #3528]
	rsb	r2, r1, r2
	str	r2, [r0, #3524]
	rsb	r3, r1, r3
	str	r3, [r0, #3528]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r0, #3520]
	str	r3, [r0, #3516]
	ldr	r0, [fp, #-48]
	ldr	r1, [r0, #3464]
	ldr	r2, [r0, #3452]
	ldr	r3, [r0, #3456]
	rsb	r2, r1, r2
	str	r2, [r0, #3452]
	rsb	r3, r1, r3
	str	r3, [r0, #3456]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r0, #3460]
	str	r3, [r0, #3464]
	b	.L2702
.L2703:
	ldr	r2, [fp, #-56]
	str	r3, [r2, #3524]
	str	r3, [r2, #3516]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #3452]
	str	r3, [r2, #3464]
	b	.L2702
	UNWIND(.fnend)
	.size	AdaptiveMemMark, .-AdaptiveMemMark
	.align	2
	.global	IDRMemMarking
	.type	IDRMemMarking, %function
IDRMemMarking:
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
	add	r3, r0, #53248
	str	r3, [fp, #-52]
	ldr	r3, [r3, #3500]
	str	r0, [fp, #-48]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2711
	add	r10, r0, #24576
	ldr	r3, [r10, #2140]
	cmp	r3, #0
	beq	.L2731
	ldr	r3, [fp, #-48]
	mov	r9, #0
	mov	r4, r9
	add	r5, r3, #26368
	add	r7, r3, #26624
	add	r7, r7, #20
	add	r6, r3, #57344
	mov	r8, r5
	add	r5, r5, #152
	add	r8, r8, #212
.L2717:
	ldr	r1, [r5]
	mov	r2, #0
	add	r9, r9, #1
	ldr	r0, [r1, #712]
	cmp	r0, #1
	streq	r0, [r6, #788]
	strb	r4, [r1, #594]
	strb	r4, [r1, #593]
	ldr	r1, [r5]
	strb	r4, [r1, #634]
	strb	r4, [r1, #633]
	ldr	r1, [r5]
	strb	r4, [r1, #674]
	strb	r4, [r1, #673]
	ldr	r1, [r5]
	strb	r4, [r1, #2]
	ldr	r1, [r5]
	ldr	r0, [r6, #1840]
	ldr	r1, [r1, #544]
	bl	FSP_SetRef
	ldr	r2, [r5]
	mov	r3, #1
	strb	r4, [r2, #1]
	ldr	r2, [r5]
	strb	r4, [r2, #4]
	ldr	r2, [r5]
	str	r3, [r2, #564]
	ldr	r1, [r5]
	ldr	r3, [fp, #-48]
	ldr	r2, [r1, #584]
	add	r2, r2, #6656
	add	r2, r2, #26
	add	r2, r3, r2, lsl #2
	str	r4, [r2, #4]
	ldr	r1, [r1, #544]
	ldr	r0, [r6, #1840]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L2716
	ldr	r1, [r5]
	ldr	r0, [r6, #1840]
	ldr	r1, [r1, #544]
	bl	FSP_SetDisplay
.L2716:
	str	r4, [r5], #4
	str	r4, [r8, #4]!
	str	r4, [r7, #4]!
	ldr	r2, [r10, #2140]
	cmp	r2, r9
	bhi	.L2717
.L2718:
	mov	r3, #0
	str	r3, [r10, #2140]
	ldr	r1, [r6, #776]
	cmp	r1, r3
	beq	.L2714
	ldr	r2, [fp, #-48]
	mov	r0, r3
	add	r2, r2, #57856
	add	r2, r2, #188
.L2721:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2721
.L2714:
	ldr	r4, [fp, #-48]
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #3500]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2732
	ldr	r2, [fp, #-52]
	mov	r0, r3
	str	r3, [r10, #2152]
	strb	r3, [r2, #2948]
	mov	r3, #1
	strb	r3, [r2, #2949]
.L2722:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2732:
	ldr	r1, [fp, #-52]
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r10, #2152]
	strb	r2, [r1, #2948]
	str	r3, [r1, #3508]
	strb	r3, [r1, #2949]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2711:
	bl	FlushDPB
	cmp	r0, #0
	bne	.L2723
	ldr	r3, [fp, #-48]
	add	r10, r3, #24576
	b	.L2714
.L2731:
	add	r6, r0, #57344
	b	.L2718
.L2723:
	mvn	r0, #0
	b	.L2722
	UNWIND(.fnend)
	.size	IDRMemMarking, .-IDRMemMarking
	.align	2
	.global	Marking
	.type	Marking, %function
Marking:
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
	add	r6, r0, #16384
	add	r4, r0, #53248
	mov	r3, #0
	mov	r5, r0
	str	r3, [r6, #3444]
	ldrb	r3, [r4, #2947]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r6, #3448]
	ldrb	r3, [r4, #2950]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L2734
	ldr	r3, [r4, #3532]
	cmp	r3, #0
	bne	.L2735
	ldr	r3, [r0]
	ldr	r2, [r3, #632]
	cmp	r2, #1
	beq	.L2759
.L2735:
	ldr	r3, [r4, #3500]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #3512]
	beq	.L2760
	cmp	r3, #0
	bne	.L2761
.L2742:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2760:
	cmp	r3, #0
	beq	.L2742
.L2741:
	ldrb	r2, [r4, #2945]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2746
	add	r2, r5, #24576
	ldr	r1, [r6, #456]
	ldr	ip, [r2, #2148]
	ldr	r0, [r2, #2144]
	rsb	r2, ip, r1
	cmp	r0, r2
	beq	.L2762
.L2747:
	mov	r2, #0
	strb	r2, [r4, #2948]
.L2744:
	cmp	r3, #0
	beq	.L2742
.L2746:
	ldrb	r3, [r4, #2948]	@ zero_extendqisi2
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #2949]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2759:
	ldr	r2, [r3, #628]
	cmp	r2, #0
	bne	.L2735
	ldr	r2, [r3, #636]
	cmp	r2, #0
	bne	.L2735
	ldr	r3, [r3, #592]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L2735
.L2734:
	mov	r0, r5
	bl	IDRMemMarking
	cmp	r0, #0
	bne	.L2736
.L2743:
	ldrb	r3, [r4, #2950]	@ zero_extendqisi2
	cmp	r3, #5
	ldreq	r3, [r4, #3512]
	beq	.L2744
	ldr	r3, [r4, #3512]
	cmp	r3, #0
	beq	.L2742
	ldr	r2, [r4, #3500]
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2741
	b	.L2746
.L2761:
	mov	r0, r5
	bl	AdaptiveMemMark
	cmp	r0, #0
	beq	.L2743
.L2736:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2762:
	mov	r0, r5
	bl	SlidingWinMark.part.3
	ldr	r3, [r4, #3512]
	b	.L2747
	UNWIND(.fnend)
	.size	Marking, .-Marking
	.align	2
	.global	DirectOutput
	.type	DirectOutput, %function
DirectOutput:
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
	add	r5, r0, #53248
	mov	r6, r0
	ldrb	r7, [r5, #2947]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L2765
	bcc	.L2766
	cmp	r7, #2
	beq	.L2767
	mov	r7, #0
.L2764:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2767:
	ldr	r3, [r5, #3496]
	mov	r2, #3
	add	r4, r0, #57344
	strb	r2, [r3, #592]
	ldrb	r2, [r5, #2945]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2786
	ldr	r1, [r4, #140]
	cmp	r1, #0
	beq	.L2787
	bl	OutputFrmToVO
	subs	r7, r0, #0
	bne	.L2852
.L2788:
	ldr	r3, [r5, #3496]
	str	r3, [r4, #140]
	str	r3, [r3, #708]
.L2789:
	ldr	r3, [r4, #140]
	mov	r9, #2
	ldrb	r0, [r5, #2946]	@ zero_extendqisi2
	mov	r8, #0
	mov	r2, #536
	add	r1, r5, #2960
	strb	r0, [r3]
	ldr	r3, [r4, #140]
	strb	r9, [r3, #1]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #140]
	str	r8, [r3, #564]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #140]
	ldr	r0, [r5, #3532]
	str	r0, [r3, #572]
	ldr	r3, [r4, #140]
	str	r8, [r3, #568]
	ldr	r0, [r4, #140]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #140]
	ldr	r2, [r5, #3540]
	str	r2, [r3, #688]
	ldr	r3, [r4, #140]
	ldr	r2, [r3, #688]
	str	r2, [r3, #608]
	str	r2, [r3, #576]
	ldr	r3, [r4, #140]
	strb	r9, [r3, #672]
	ldrb	r2, [r5, #2951]	@ zero_extendqisi2
	ldr	r3, [r4, #140]
	cmp	r2, #1
	movne	r2, r8
	moveq	r2, r9
	strb	r2, [r3, #3]
	ldr	r3, [r4, #1772]
	cmp	r3, #1
	bne	.L2764
.L2845:
	ldr	r3, [r4, #140]
	mov	r2, r8
	b	.L2848
.L2766:
	ldr	r3, [r5, #3496]
	add	r4, r0, #57344
	mov	r2, #0
	strb	r2, [r3, #592]
	ldr	r1, [r4, #140]
	cmp	r1, r2
	beq	.L2768
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L2853
.L2769:
	ldr	r3, [r4, #140]
	cmp	r3, #0
	beq	.L2768
	ldr	r3, [r5, #3496]
	ldr	r0, [r4, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_ClearLogicFs
.L2768:
	ldr	r3, [r5, #3496]
	mov	r0, #3
	mov	r8, #0
	mov	r2, #536
	add	r1, r5, #2960
	str	r3, [r4, #140]
	str	r3, [r3, #628]
	ldr	r3, [r4, #140]
	ldr	ip, [r5, #3496]
	str	ip, [r3, #668]
	ldr	r3, [r4, #140]
	ldr	ip, [r5, #3496]
	str	ip, [r3, #708]
	ldr	r3, [r4, #140]
	ldrb	ip, [r5, #2946]	@ zero_extendqisi2
	strb	ip, [r3]
	ldr	r3, [r4, #140]
	strb	r0, [r3, #1]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #140]
	str	r8, [r3, #564]
	ldr	r0, [r4, #140]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #140]
	ldr	r1, [r5, #3540]
	mov	r2, r8
	str	r1, [r3, #608]
	str	r1, [r3, #576]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #592]
	ldr	r3, [r4, #140]
	ldr	r1, [r5, #3532]
	str	r1, [r3, #572]
	ldr	r3, [r4, #140]
	ldrb	r1, [r5, #2953]	@ zero_extendqisi2
	str	r1, [r3, #568]
	ldrb	r1, [r5, #2951]	@ zero_extendqisi2
	ldr	r3, [r4, #140]
	cmp	r1, #1
	moveq	r7, #3
	strb	r7, [r3, #3]
	ldr	r3, [r4, #140]
.L2848:
	ldr	r1, [r3, #544]
	ldr	r0, [r4, #1840]
	bl	FSP_SetRef
	mov	r2, r8
	mov	r0, r6
	ldr	r1, [r4, #140]
	bl	OutputFrmToVO
	ldr	r3, [r4, #140]
	cmp	r3, r8
	mov	r7, r0
	beq	.L2799
.L2843:
	ldr	r3, [r5, #3496]
	ldr	r0, [r4, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_ClearLogicFs
.L2799:
	mov	r3, #0
	mov	r0, r7
	str	r3, [r4, #140]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2765:
	ldr	r3, [r5, #3496]
	mov	r2, #3
	add	r4, r0, #57344
	strb	r2, [r3, #592]
	ldrb	r2, [r5, #2945]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2773
	ldr	r1, [r4, #140]
	cmp	r1, #0
	beq	.L2774
	bl	OutputFrmToVO
	subs	r7, r0, #0
	bne	.L2854
.L2775:
	ldr	r3, [r5, #3496]
	str	r3, [r4, #140]
	str	r3, [r3, #668]
.L2776:
	ldr	r3, [r4, #140]
	mov	r9, #1
	ldrb	r0, [r5, #2946]	@ zero_extendqisi2
	mov	r8, #0
	mov	r2, #536
	add	r1, r5, #2960
	strb	r0, [r3]
	ldr	r3, [r4, #140]
	strb	r9, [r3, #1]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #140]
	str	r8, [r3, #564]
	ldr	r3, [r4, #140]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #140]
	ldr	r0, [r5, #3532]
	str	r0, [r3, #572]
	ldr	r3, [r4, #140]
	str	r8, [r3, #568]
	ldr	r0, [r4, #140]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #140]
	ldr	r2, [r5, #3540]
	str	r2, [r3, #648]
	ldr	r3, [r4, #140]
	ldr	r2, [r3, #648]
	str	r2, [r3, #608]
	str	r2, [r3, #576]
	ldr	r3, [r4, #140]
	strb	r9, [r3, #632]
	ldrb	r3, [r5, #2951]	@ zero_extendqisi2
	ldr	r2, [r4, #140]
	rsb	r3, r9, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #3]
	ldr	r3, [r4, #1772]
	cmp	r3, r9
	beq	.L2845
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2786:
	ldr	r3, [r4, #140]
	mov	r2, #536
	cmp	r3, #0
	ldreq	r3, [r5, #3496]
	streq	r3, [r4, #140]
	streq	r3, [r3, #708]
	ldreq	r3, [r4, #140]
	ldrd	r8, [r3, #224]
	ldrd	r0, [r3, #216]
	ldr	r10, [r3, #8]
	strd	r8, [fp, #-52]
	ldrd	r8, [r3, #232]
	strd	r0, [fp, #-68]
	add	r1, r5, #2960
	add	r0, r3, #8
	ldr	r7, [r3, #20]
	strd	r8, [fp, #-60]
	ldr	r9, [r3, #12]
	ldr	r8, [r3, #16]
	bl	memcpy
	ldrd	r0, [fp, #-68]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r1, r3
	cmpeq	r0, r2
	ldrne	r3, [r4, #140]
	strned	r0, [r3, #216]
.L2793:
	add	r3, r6, #56320
	ldrd	r0, [fp, #-52]
	add	r3, r3, #112
	ldr	ip, [r4, #140]
	ldrd	r2, [r3, #-8]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r3, r1
	movw	r1, #56432
	movhi	r2, r0
	strd	r2, [ip, #224]
	ldrd	r2, [r6, r1]
	ldrd	r0, [fp, #-60]
	ldr	ip, [r4, #140]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	strd	r2, [ip, #232]
	mov	ip, #2
	ldr	r3, [r5, #2960]
	mov	r0, #3
	ldr	r2, [r4, #140]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #8]
	ldr	r3, [r5, #2964]
	ldr	r2, [r4, #140]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #12]
	ldr	r3, [r5, #2968]
	ldr	r2, [r4, #140]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #16]
	ldr	r3, [r5, #2972]
	ldr	r2, [r4, #140]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #20]
	ldr	r2, [r4, #140]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #2946]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #140]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #140]
	ldr	r1, [r5, #3532]
	ldr	r3, [r2, #572]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #572]
	ldr	r3, [r4, #140]
	strb	ip, [r3, #672]
	ldr	r3, [r4, #140]
	strb	r0, [r3, #592]
	ldr	r3, [r4, #140]
	ldr	r2, [r5, #3540]
	str	r2, [r3, #688]
	ldr	r2, [r4, #140]
	ldr	r3, [r2, #688]
	ldr	r1, [r2, #648]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #608]
	ldr	r3, [r4, #140]
	ldr	r2, [r3, #608]
	str	r2, [r3, #576]
	ldr	r3, [r4, #140]
	ldr	r2, [r3, #708]
	str	r2, [r3, #628]
	ldrb	r3, [r5, #2951]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #140]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	beq	.L2849
.L2798:
	strb	r2, [r3, #3]
	mov	r2, #0
	ldr	r3, [r4, #140]
	ldr	r0, [r4, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetRef
	mov	r0, r6
	mov	r2, #0
	ldr	r1, [r4, #140]
	bl	OutputFrmToVO
	ldr	r3, [r4, #140]
	cmp	r3, #0
	mov	r7, r0
	bne	.L2843
	b	.L2799
.L2773:
	ldr	ip, [r4, #140]
	mov	r2, #536
	add	r1, r5, #2960
	cmp	ip, #0
	ldreq	r3, [r5, #3496]
	streq	r3, [r4, #140]
	streq	r3, [r3, #668]
	ldreq	ip, [r4, #140]
	add	r0, ip, #8
	ldrd	r8, [ip, #224]
	ldr	r3, [ip, #216]
	ldr	lr, [ip, #220]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip, #232]
	ldr	r10, [ip, #8]
	ldr	r7, [ip, #20]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-72]
	ldr	r9, [ip, #12]
	ldr	r8, [ip, #16]
	str	lr, [fp, #-68]
	bl	memcpy
	ldr	r3, [fp, #-72]
	add	r0, r6, #56320
	ldr	lr, [fp, #-68]
	movw	r2, #56416
	ldr	ip, [r6, r2]
	ldr	r1, [r0, #100]
	and	r2, r3, lr
	adds	r2, r2, #1
	and	r1, r1, ip
	movne	r2, #1
	cmn	r1, #1
	ldrd	r0, [fp, #-52]
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #140]
	strne	r3, [r2, #216]
	add	r3, r6, #56320
	add	r3, r3, #112
	strne	lr, [r2, #220]
	ldr	ip, [r4, #140]
	ldrd	r2, [r3, #-8]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r3, r1
	movw	r1, #56432
	movhi	r2, r0
	strd	r2, [ip, #224]
	ldrd	r2, [r6, r1]
	ldrd	r0, [fp, #-60]
	ldr	ip, [r4, #140]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	strd	r2, [ip, #232]
	mov	ip, #1
	ldr	r3, [r5, #2960]
	mov	r0, #3
	ldr	r2, [r4, #140]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #8]
	ldr	r3, [r5, #2964]
	ldr	r2, [r4, #140]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #12]
	ldr	r3, [r5, #2968]
	ldr	r2, [r4, #140]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #16]
	ldr	r3, [r5, #2972]
	ldr	r2, [r4, #140]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #20]
	ldr	r2, [r4, #140]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #2946]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #140]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #140]
	ldr	r1, [r5, #3532]
	ldr	r3, [r2, #572]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #572]
	ldr	r3, [r4, #140]
	strb	ip, [r3, #632]
	ldr	r3, [r4, #140]
	strb	r0, [r3, #592]
	ldr	r3, [r4, #140]
	ldr	r2, [r5, #3540]
	str	r2, [r3, #648]
	ldr	r2, [r4, #140]
	ldr	r3, [r2, #688]
	ldr	r1, [r2, #648]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #608]
	ldr	r3, [r4, #140]
	ldr	r2, [r3, #608]
	str	r2, [r3, #576]
	ldr	r3, [r4, #140]
	ldr	r2, [r3, #668]
	str	r2, [r3, #628]
	ldrb	r3, [r5, #2951]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #140]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	bne	.L2798
.L2849:
	orr	r2, r2, ip
	b	.L2798
.L2853:
	movw	r1, #2234
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #20
	ldr	r3, .L2855
	ldr	r2, .L2855+4
	bl	dprint_normal
	b	.L2769
.L2787:
	ldr	r3, [r5, #3496]
	mov	r7, r1
	str	r3, [r4, #140]
	str	r3, [r3, #708]
	b	.L2789
.L2774:
	ldr	r3, [r5, #3496]
	mov	r7, r1
	str	r3, [r4, #140]
	str	r3, [r3, #668]
	b	.L2776
.L2852:
	movw	r1, #2396
	ldr	r3, .L2855
	stmia	sp, {r1, r7}
	mov	r0, #20
	ldr	r2, .L2855+4
	bl	dprint_normal
	b	.L2788
.L2854:
	movw	r1, #2284
	ldr	r3, .L2855
	stmia	sp, {r1, r7}
	mov	r0, #20
	ldr	r2, .L2855+4
	bl	dprint_normal
	b	.L2775
.L2856:
	.align	2
.L2855:
	.word	.LANCHOR0+320
	.word	.LC349
	UNWIND(.fnend)
	.size	DirectOutput, .-DirectOutput
	.align	2
	.global	H264DEC_FlushRemainImg
	.type	H264DEC_FlushRemainImg, %function
H264DEC_FlushRemainImg:
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
	add	r5, r0, #24576
	mov	r4, r0
	ldr	r3, [r5, #2140]
	cmp	r3, #0
	beq	.L2859
	add	r7, r0, #26368
	mov	r6, #0
	add	r7, r7, #148
	b	.L2861
.L2860:
	ldr	r3, [r5, #2140]
	cmp	r3, r6
	bls	.L2859
.L2861:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2860
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r5, #2140]
	cmp	r3, r6
	bhi	.L2861
.L2859:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L2864
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2859
	b	.L2864
.L2865:
	bl	GetMinPOC
	ldr	r3, [fp, #-36]
	mov	r1, #0
	mov	r0, r4
	add	r3, r4, r3, lsl #2
	add	r3, r3, #24576
	ldr	r2, [r3, #1944]
	strb	r1, [r2, #4]
	ldr	r1, [r3, #1944]
	ldr	r2, [r5, #2140]
	bl	OutputFrmToVO
	ldr	r1, [fp, #-36]
	add	r3, r1, #6592
	add	r3, r3, #38
	ldr	r3, [r4, r3, asl #2]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2873
.L2864:
	ldr	r3, [r5, #2140]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L2865
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2873:
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	b	.L2864
	UNWIND(.fnend)
	.size	H264DEC_FlushRemainImg, .-H264DEC_FlushRemainImg
	.align	2
	.global	InitDPB
	.type	InitDPB, %function
InitDPB:
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
	subs	r7, r0, #0
	beq	.L2890
	bl	ClearAllSlice
	add	r6, r7, #26368
	add	r5, r7, #26624
	mov	r8, #0
	mov	r4, r6
	add	r5, r5, #24
	add	r6, r6, #152
	add	r4, r4, #216
	add	r10, r7, #57344
	mov	r9, r8
.L2879:
	ldr	r3, [r6]
	add	r8, r8, #1
	cmp	r3, #0
	beq	.L2876
	ldr	r1, [r3, #544]
	ldr	r0, [r10, #1840]
	bl	FSP_ClearLogicFs
.L2876:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L2877
	ldr	r1, [r3, #544]
	ldr	r0, [r10, #1840]
	bl	FSP_ClearLogicFs
.L2877:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L2878
	ldr	r1, [r3, #544]
	ldr	r0, [r10, #1840]
	bl	FSP_ClearLogicFs
.L2878:
	cmp	r8, #16
	str	r9, [r5], #4
	mov	r2, #0
	str	r9, [r4], #4
	str	r9, [r6], #4
	bne	.L2879
	add	r3, r7, #16384
	add	r4, r7, #24576
	ldr	r3, [r3, #484]
	str	r2, [r4, #2140]
	sub	r3, r3, #1
	str	r2, [r4, #2144]
	str	r3, [r4, #2136]
	str	r2, [r4, #2148]
	str	r2, [r4, #2152]
	ldr	r1, [r10, #140]
	cmp	r1, r2
	beq	.L2881
	ldr	r3, [r10, #1768]
	cmp	r3, #2
	beq	.L2910
.L2882:
	ldr	r1, [r1, #544]
	ldr	r0, [r10, #1840]
	bl	FSP_ClearLogicFs
	add	r3, r7, #53248
	ldr	r2, [r10, #140]
	ldr	r3, [r3, #3496]
	cmp	r3, #0
	beq	.L2886
	ldr	r1, [r3, #544]
	ldr	r3, [r2, #544]
	cmp	r3, r1
	beq	.L2886
	ldr	r0, [r10, #1840]
	bl	FSP_ClearLogicFs
	ldr	r2, [r10, #140]
.L2886:
	mov	r3, #0
	strb	r3, [r2, #1]
	ldr	r2, [r10, #140]
	strb	r3, [r2, #4]
	str	r3, [r10, #140]
.L2881:
	ldr	r3, .L2912
	add	r0, r7, #26624
	mov	r2, #392
	mov	r1, #0
	add	r0, r0, #108
	ldr	r3, [r3, #48]
	blx	r3
	ldr	ip, [r4, #2136]
	add	r3, r7, #57856
	mov	r0, #0
	add	r3, r3, #188
	add	r1, r7, #58112
	mov	r2, r0
	str	ip, [r4, #2412]
	str	r0, [r4, #2416]
.L2887:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L2887
	add	r2, r7, #26880
	add	r3, r7, #27136
	add	r2, r2, #240
	add	r3, r3, #116
	mov	r0, #0
.L2888:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L2888
	add	r2, r7, #27136
	add	r7, r7, #20480
	add	r2, r2, #248
	mov	ip, r1
	str	r1, [r7, #248]
.L2889:
	str	ip, [r3, #4]!
	cmp	r3, r2
	mov	r0, #0
	bne	.L2889
	str	r0, [r7, #252]
.L2875:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2910:
	mov	r0, r7
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L2911
.L2883:
	ldr	r1, [r10, #140]
	cmp	r1, #0
	beq	.L2881
	b	.L2882
.L2911:
	mov	r1, #4480
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #20
	ldr	r3, .L2912+4
	ldr	r2, .L2912+8
	bl	dprint_normal
	b	.L2883
.L2890:
	mvn	r0, #0
	b	.L2875
.L2913:
	.align	2
.L2912:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+336
	.word	.LC349
	UNWIND(.fnend)
	.size	InitDPB, .-InitDPB
	.align	2
	.global	ClearDPB
	.type	ClearDPB, %function
ClearDPB:
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
	bl	FlushDPB
	cmp	r0, #0
	beq	.L2915
	movw	r3, #450
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L2919
	mov	r0, #0
	bl	dprint_normal
.L2915:
	mov	r0, r4
	add	r4, r4, #57344
	bl	InitDPB
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #788]
	str	r3, [r4, #1872]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L2920:
	.align	2
.L2919:
	.word	.LC350
	UNWIND(.fnend)
	.size	ClearDPB, .-ClearDPB
	.align	2
	.global	DecVDM
	.type	DecVDM, %function
DecVDM:
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
	add	r5, r0, #53248
	mov	r7, r0
	add	r4, r0, #57344
	ldrb	r3, [r5, #2947]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2922
	ldrb	r3, [r5, #2945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2922
.L2923:
	ldr	r6, [r4, #1828]
	ldr	r3, [r4, #1768]
	ubfx	r6, r6, #16, #3
	cmp	r3, r6
	beq	.L2924
	subs	r2, r6, #2
	sub	r3, r3, #2
	movne	r2, #1
	cmp	r3, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L2924
	cmp	r6, #4
	cmpne	r6, #1
	bls	.L3021
.L2924:
	cmp	r6, #2
	str	r6, [r4, #1768]
	beq	.L2927
	cmp	r6, #3
	beq	.L2928
	cmp	r6, #1
	beq	.L3022
	ldr	r3, [r4, #1764]
	cmp	r3, #0
	beq	.L2931
	cmp	r6, #4
	ldr	r3, [r5, #3532]
	beq	.L3023
.L2938:
	cmp	r3, #2
	beq	.L2957
.L2942:
	cmp	r3, #1
	streq	r3, [r4, #792]
.L2944:
	ldrb	ip, [r5, #2947]	@ zero_extendqisi2
	movw	r1, #6217
	ldr	r3, [r4, #1804]
	mov	r0, #3
	ldr	r2, .L3031
	sub	r3, r3, #1
	str	ip, [sp]
	bl	dprint_normal
	ldr	r0, [r5, #3556]
	ldr	r1, [r4, #1804]
	mov	r3, #1
	ldr	r2, [r4, #1764]
	str	r0, [r4, #1416]
	cmp	r1, #0
	strb	r3, [r4, #822]
	ldr	r3, [r5, #3560]
	str	r2, [r4, #1616]
	str	r3, [r4, #1412]
	beq	.L2946
	ldr	r1, [r5, #3532]
	cmp	r1, #0
	beq	.L3024
	add	r3, r7, #24576
	ldr	r3, [r3, #2140]
	cmp	r3, #0
	bne	.L2948
	ldr	r1, [r7]
	ldr	r2, [r1, #12]
	cmp	r2, #2
	bne	.L3025
.L2951:
	add	r3, r7, #58112
	add	r3, r3, #52
	str	r3, [r7, #360]
	ldr	r2, [r1, #840]
	cmp	r2, #1
	beq	.L3026
	cmp	r2, #2
	beq	.L3027
.L2954:
	mov	r3, #0
	str	r3, [r4, #1756]
.L2946:
	ldr	r0, [r5, #3572]
	ldr	r1, [r5, #3496]
	ldr	r3, [r5, #3568]
	str	r0, [r5, #3568]
	ldr	r2, [r1, #244]
	rsb	r3, r0, r3
	add	r2, r2, r3
	str	r2, [r1, #244]
	ldr	r0, [r5, #3532]
	ldr	r2, [r5, #3196]
	cmp	r0, #0
	add	r3, r3, r2
	str	r3, [r5, #3196]
	beq	.L3028
	cmp	r0, #1
	beq	.L3029
	cmp	r0, #2
	ldreq	r3, .L3031+4
	moveq	r0, #0
	ldreq	r2, [r4, #1840]
	movne	r0, #0
	ldreq	r2, [r3, r2, asl #2]
	ldreq	r3, [r2, #104]
	addeq	r3, r3, #1
	streq	r3, [r2, #104]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2922:
	ldr	r3, [r4, #1892]
	ldr	r2, [r4, #1896]
	add	r3, r3, #1
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #1892]
	ldr	r1, [r7]
	rsb	r3, r2, r3
	str	r3, [r1, #552]
	b	.L2923
.L3021:
	mov	r3, r6
	ldr	r2, .L3031+8
	movw	r1, #6126
	mov	r0, #3
	bl	dprint_normal
	str	r6, [r4, #1768]
.L2928:
	mov	r0, r7
	bl	H264_ClearCurrPic
	mov	r0, r7
	bl	ClearDPB
	mvn	r0, #0
.L3013:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2927:
	ldr	r6, [r5, #3532]
	cmp	r6, #0
	bne	.L2934
	ldr	r3, [r4, #1764]
	cmp	r3, #0
	beq	.L2931
	ldr	r3, [r4, #1760]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L2944
	mov	r3, #1
	mov	r0, r7
	strb	r3, [r5, #2951]
	bl	H264_ClearCurrPic
	mov	r0, r6
	ldr	r2, .L3031+12
	movw	r1, #6159
	bl	dprint_normal
	mvn	r0, #0
	b	.L3013
.L3022:
	ldr	r3, [r5, #3532]
	cmp	r3, #2
	beq	.L3030
	ldr	r2, [r4, #1764]
	cmp	r2, #0
	bne	.L2942
.L2931:
	mov	r0, r7
	bl	H264_ClearCurrPic
	ldr	r3, .L3031+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3017
	mov	r3, #0
	ldr	r0, [r4, #1840]
	mov	r2, r3
	mov	r1, #60
	blx	r5
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3028:
	ldr	r2, [r4, #1840]
	ldr	r3, .L3031+4
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [r2, #96]
	add	r3, r3, #1
	str	r3, [r2, #96]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3024:
	ldr	r3, .L3031+16
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L2948
	ldr	r2, [r4, #1620]
	cmp	r2, #0
	beq	.L2949
.L2950:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L2950
.L2949:
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #1840]
	str	r1, [r2, #-4]!
	mov	r1, #8
	blx	r6
	ldr	r1, [r7]
	b	.L2951
.L3030:
	ldr	r3, [r5, #3512]
	cmp	r3, #0
	beq	.L2934
	ldr	r3, [r4, #1764]
	cmp	r3, #0
	beq	.L2931
.L2957:
	ldr	r3, [r4, #792]
	cmp	r3, #2
	bne	.L2944
	ldr	r3, [r7]
	ldr	r6, [r3, #12]
	cmp	r6, #0
	bne	.L2944
	ldr	r3, .L3031+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2944
	ldr	ip, [r5, #3512]
	movw	r1, #6206
	ldr	r3, [r5, #3516]
	mov	r0, #1
	ldr	r2, .L3031+24
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r7
	bl	H264_ClearCurrPic
	ldr	r3, .L3031+16
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2945
	mov	r3, r6
	mov	r2, r6
	mov	r1, #60
	ldr	r0, [r4, #1840]
	blx	r7
.L2945:
	ldr	r3, [r5, #3496]
	mov	r2, #0
	ldr	r0, [r4, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3013
.L3026:
	cmp	r3, #0
	beq	.L2954
	ldr	r3, [r5, #3532]
	cmp	r3, #2
	bne	.L2954
	mov	r2, #0
	str	r2, [r7, #360]
	ldr	r3, [r5, #3496]
	ldr	r0, [r4, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
.L3016:
	mov	r0, r7
	bl	H264_ClearCurrPic
.L3017:
	mvn	r0, #0
	b	.L3013
.L3023:
	cmp	r3, #0
	bne	.L2938
	ldr	r3, [r4, #792]
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r4, #792]
	movne	r3, #1
	strne	r3, [r4, #792]
	b	.L2944
.L2948:
	ldr	r1, [r7]
	b	.L2951
.L3029:
	ldr	r2, [r4, #1840]
	mov	r0, #0
	ldr	r3, .L3031+4
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [r2, #100]
	add	r3, r3, #1
	str	r3, [r2, #100]
	b	.L3013
.L3027:
	ldr	r2, [r1, #844]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L2954
	ldr	r3, [r5, #3532]
	cmp	r3, #2
	bne	.L2954
	mov	r2, #0
	str	r2, [r7, #360]
	ldr	r3, [r5, #3496]
	ldr	r0, [r4, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
	ldr	r2, [r7]
	mov	r0, r7
	ldr	r3, [r2, #844]
	sub	r3, r3, #1
	str	r3, [r2, #844]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3013
.L3025:
	ldr	r2, .L3031+16
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L3016
	ldr	r0, [r4, #1840]
	mov	r2, r3
	mov	r1, #60
	blx	r5
	b	.L3016
.L2934:
	mov	r3, #1
	mov	r0, r7
	strb	r3, [r5, #2951]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3013
.L3032:
	.align	2
.L3031:
	.word	.LC354
	.word	s_pstVfmwChan
	.word	.LC351
	.word	.LC352
	.word	g_EventReportFunc
	.word	g_AllowBPicBeforePPic
	.word	.LC353
	UNWIND(.fnend)
	.size	DecVDM, .-DecVDM
	.align	2
	.global	H264_FlushDecoder
	.type	H264_FlushDecoder, %function
H264_FlushDecoder:
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
	add	r2, r0, #20480
	mov	r1, #0
	mov	r4, #1
	str	r1, [r2, #256]
	strb	r4, [r2, #213]
	str	r4, [r0, #364]
	bl	DecVDM
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r4
	ldr	r2, .L3035
	movw	r1, #9924
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L3036:
	.align	2
.L3035:
	.word	.LC355
	UNWIND(.fnend)
	.size	H264_FlushDecoder, .-H264_FlushDecoder
	.align	2
	.global	H264_VES_Splitter
	.type	H264_VES_Splitter, %function
H264_VES_Splitter:
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
	add	r4, r0, #13504
	add	r4, r4, #24
	add	r8, r0, #53248
	mov	r7, r1
	mov	r6, r0
	mov	r1, #24
	mov	r0, r4
	mov	r5, #0
	mov	r9, r3
	mov	r10, r2
	str	r5, [fp, #-48]
	bl	BsSkip
	ldr	r3, [r8, #3240]
	cmp	r7, r5
	str	r5, [r8, #3232]
	str	r3, [fp, #-48]
	beq	.L3039
	cmp	r7, #1
	bne	.L3133
	cmp	r10, #1
	mov	r1, #16
	mov	r0, r4
	beq	.L3134
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r4
	bl	BsGet
	movw	r3, #31745
	cmp	r7, r3
	beq	.L3059
	mov	r1, #24
	mov	r0, r4
	bl	BsBack
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	movw	r3, #32257
	cmp	r7, r3
	beq	.L3135
.L3061:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3133:
	mov	r3, r7
	ldr	r2, .L3142
	movw	r1, #11020
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
.L3113:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3039:
	cmp	r10, #1
	beq	.L3136
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3059:
	and	r0, r0, #31
	cmp	r0, #25
	bne	.L3061
	ldr	r4, .L3142+4
	ldr	r7, [r4]
	cmp	r7, #0
	beq	.L3062
	add	r0, r6, #57344
	mov	r3, r5
	mov	r2, r5
	mov	r1, #41
	ldr	r0, [r0, #1840]
	blx	r7
.L3062:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	beq	.L3063
.L3126:
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L3119
	add	r6, r6, #57344
	mov	r3, #0
	mov	r2, r3
	mov	r1, #42
	ldr	r0, [r6, #1840]
	blx	r4
	mvn	r0, #0
	b	.L3113
.L3136:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	movw	r9, #31745
	mov	r5, r0
	mov	r0, r4
	bl	BsGet
	cmp	r5, r9
	beq	.L3042
	mov	r1, #24
	mov	r0, r4
	bl	BsBack
	bic	r5, r5, #512
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	cmp	r5, r9
	bne	.L3061
.L3058:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3119
	add	r3, r6, #57344
	ldr	r0, [r3, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r6, #368]
	b	.L3113
.L3135:
	mov	r1, #11008
	ldr	r3, .L3142+8
	str	r1, [sp]
	mov	r0, r5
	ldr	r2, .L3142+12
	bl	dprint_normal
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3119
	add	r3, r6, #57344
	ldr	r0, [r3, #1840]
	bl	ReleaseNAL
	str	r5, [r6, #368]
.L3119:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3134:
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r4
	bl	BsGet
	movw	r3, #31745
	cmp	r7, r3
	beq	.L3053
	mov	r1, #32
	mov	r0, r4
	bl	BsBack
	ldr	r3, [r6, #368]
	movw	r2, #32257
	cmp	r7, r2
	mov	r2, #16
	str	r2, [r3, #8]
	beq	.L3137
	mov	r1, #8
	mov	r0, r4
	bl	BsSkip
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	and	r0, r0, #31
	cmp	r0, #11
	bne	.L3058
	mov	r0, r6
	bl	H264_IsEosNal
	cmp	r0, #1
	bne	.L3058
	ldr	r3, [r6, #368]
	mov	r0, r4
	ldr	r2, [r3, #44]
	ldr	r1, [r3, #40]
	bl	BsInit
	mov	r0, #3
	b	.L3113
.L3042:
	and	r0, r0, #31
	cmp	r0, #25
	bne	.L3058
	ldr	r4, .L3142+4
	ldr	r5, [r4]
	cmp	r5, #0
	beq	.L3045
	add	r0, r6, #57344
	mov	r3, r7
	mov	r2, r7
	mov	r1, #41
	ldr	r0, [r0, #1840]
	blx	r5
.L3045:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	bne	.L3126
	ldr	ip, [r6, #368]
	add	r4, r6, #57344
	ldr	r1, [r8, #3236]
	sub	r2, fp, #48
	ldr	r0, [r4, #1840]
	ldr	r3, [ip, #44]
	ldr	ip, [ip, #72]
	add	r3, r3, ip
	sub	r3, r3, #1
	bl	MetadataMapToSec
	cmp	r0, #0
	movwne	r1, #10838
	bne	.L3118
	ldr	r5, .L3142+16
	mov	r2, #5
	ldr	r1, .L3142+20
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r0, [fp, #-48]
	ldr	r7, [r5, #52]
	ldr	r2, [r3, #44]
	add	r0, r0, #5
	sub	r2, r2, #6
	str	r2, [r8, #3232]
	ldr	r1, [r3, #40]
	add	r1, r1, #6
	blx	r7
	ldr	r3, [r8, #3232]
	add	r3, r3, #5
	str	r3, [r8, #3232]
	ldr	r1, [r6, #368]
	ldr	r2, [r1, #72]
	cmp	r2, #0
	bne	.L3138
.L3049:
	mov	r2, r3
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #1840]
	bl	H264_SaveMetadata
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #1840]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	movwne	r1, #10861
	bne	.L3120
.L3066:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3119
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	str	r5, [r6, #368]
	mvn	r0, #0
	b	.L3113
.L3053:
	and	r0, r0, #31
	cmp	r0, #25
	cmpeq	r9, #2
	moveq	r9, #1
	movne	r9, #0
	bne	.L3139
	ldr	r4, .L3142+4
	ldr	r7, [r4]
	cmp	r7, #0
	beq	.L3056
	add	r0, r6, #57344
	mov	r3, r5
	mov	r2, r5
	mov	r1, #41
	ldr	r0, [r0, #1840]
	blx	r7
.L3056:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	bne	.L3126
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3119
	add	r3, r6, #57344
	ldr	r0, [r3, #1840]
	bl	ReleaseNAL
	str	r5, [r6, #368]
	mvn	r0, #0
	b	.L3113
.L3063:
	ldr	ip, [r6, #368]
	add	r4, r6, #57344
	sub	r2, fp, #48
	ldr	r1, [r8, #3236]
	ldr	r0, [r4, #1840]
	ldr	r3, [ip, #44]
	ldr	ip, [ip, #72]
	add	r3, r3, ip
	sub	r3, r3, #1
	bl	MetadataMapToSec
	cmp	r0, #0
	bne	.L3140
	ldr	r5, .L3142+16
	mov	r2, #5
	ldr	r1, .L3142+20
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r0, [fp, #-48]
	ldr	r7, [r5, #52]
	ldr	r2, [r3, #44]
	add	r0, r0, #5
	sub	r2, r2, #6
	str	r2, [r8, #3232]
	ldr	r1, [r3, #40]
	add	r1, r1, #6
	blx	r7
	ldr	r3, [r8, #3232]
	add	r3, r3, #5
	str	r3, [r8, #3232]
	ldr	r1, [r6, #368]
	ldr	r2, [r1, #72]
	cmp	r2, #0
	bne	.L3141
.L3065:
	mov	r2, r3
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #1840]
	bl	H264_SaveMetadata
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #1840]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	beq	.L3066
	movw	r1, #10998
.L3120:
	ldr	r3, .L3142+8
	mov	r0, #0
	str	r1, [sp]
	ldr	r2, .L3142+24
	bl	dprint_normal
	mvn	r0, #0
	b	.L3113
.L3139:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3119
	add	r3, r6, #57344
	ldr	r0, [r3, #1840]
	bl	ReleaseNAL
	str	r9, [r6, #368]
	mvn	r0, #0
	b	.L3113
.L3141:
	ldr	r0, [fp, #-48]
	ldr	r5, [r5, #52]
	add	r0, r0, r3
	ldr	r1, [r1, #68]
	blx	r5
	ldr	r3, [r6, #368]
	ldr	r2, [r8, #3232]
	ldr	r3, [r3, #72]
	add	r3, r3, r2
	str	r3, [r8, #3232]
	b	.L3065
.L3137:
	ldr	r3, [r6, #368]
	add	r6, r6, #57344
	ldr	r0, [r6, #1840]
	ldr	r2, [r3, #44]
	ldr	r1, [r3, #40]
	bl	H264_SaveElStream
	mov	r0, r5
	b	.L3113
.L3138:
	ldr	r0, [fp, #-48]
	ldr	r5, [r5, #52]
	add	r0, r0, r3
	ldr	r1, [r1, #68]
	blx	r5
	ldr	r3, [r6, #368]
	ldr	r2, [r8, #3232]
	ldr	r3, [r3, #72]
	add	r3, r3, r2
	str	r3, [r8, #3232]
	b	.L3049
.L3140:
	movw	r1, #10974
.L3118:
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L3142+8
	ldr	r2, .L3142+28
	bl	dprint_normal
	b	.L3119
.L3143:
	.align	2
.L3142:
	.word	.LC359
	.word	g_EventReportFunc
	.word	.LANCHOR0+344
	.word	.LC358
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_RpuStartCode
	.word	.LC357
	.word	.LC356
	UNWIND(.fnend)
	.size	H264_VES_Splitter, .-H264_VES_Splitter
	.align	2
	.global	H264DEC_SetDecParam
	.type	H264DEC_SetDecParam, %function
H264DEC_SetDecParam:
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
	add	r4, r0, #57344
	mov	r5, r0
	ldr	r3, [r4, #1856]
	cmp	r3, #1
	beq	.L3167
.L3145:
	mov	r0, r5
	bl	H264DEC_IsNeedSedOnly
	cmp	r0, #1
	beq	.L3168
	ldr	r3, [r4, #1852]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #1764]
	sub	r3, r3, #1
	str	r3, [r4, #1764]
	ldr	r1, [r5, #368]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3167:
	ldr	r3, [r4, #1764]
	cmp	r3, #0
	beq	.L3145
	ldr	r3, [r0, #360]
	cmp	r3, #0
	bne	.L3145
	ldr	r2, .L3170
	ldr	r6, [r2]
	cmp	r6, #0
	beq	.L3146
	mov	r2, r3
	mov	r1, #41
	ldr	r0, [r4, #1840]
	blx	r6
.L3146:
	mov	r0, r5
	bl	DecVDM
	cmp	r0, #0
	bne	.L3169
.L3147:
	ldr	r6, [r5, #360]
	cmp	r6, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r5, #368]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	str	r6, [r5, #368]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3168:
	ldr	r2, [r4, #1764]
	add	ip, r5, #53248
	str	r0, [r4, #1756]
	add	r3, r5, #58112
	add	r3, r3, #52
	mov	r1, #0
	str	r2, [r4, #1864]
	ldr	r0, [ip, #3556]
	str	r2, [r4, #1616]
	str	r0, [r4, #1416]
	str	r3, [r5, #360]
	str	r1, [r4, #1856]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3169:
	ldr	r2, .L3170+4
	movw	r1, #11063
	mov	r0, #1
	bl	dprint_normal
	b	.L3147
.L3171:
	.align	2
.L3170:
	.word	g_EventReportFunc
	.word	.LC360
	UNWIND(.fnend)
	.size	H264DEC_SetDecParam, .-H264DEC_SetDecParam
	.align	2
	.global	H264DEC_CheckSedOnly
	.type	H264DEC_CheckSedOnly, %function
H264DEC_CheckSedOnly:
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
	add	r4, r0, #57344
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r4, #1848]
	str	r0, [r4, #1852]
	cmp	r3, #2
	beq	.L3208
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #1856]
	cmp	r3, #1
	streq	r0, [r4, #1856]
	mvneq	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3208:
	ldr	r3, [r4, #1844]
	cmp	r3, r0
	beq	.L3207
	ldr	r3, [r4, #1856]
	cmp	r3, #1
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #1840]
	bl	VCTRL_CheckFreshSeg
	cmp	r0, #0
	beq	.L3176
.L3179:
	ldr	r3, [r5, #368]
	ldr	r2, [r3, #44]
	ldr	r1, [r3, #40]
	cmp	r2, #3
	bls	.L3207
	add	r6, r5, #13504
	add	r6, r6, #24
	mov	r0, r6
	bl	BsInit
	mov	r1, #24
	mov	r0, r6
	bl	BsSkip
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #7
	ble	.L3207
	mov	r1, #3
	mov	r0, r6
	bl	BsSkip
	mov	r1, #5
	mov	r0, r6
	bl	BsGet
	cmp	r0, #20
	mov	r7, r0
	beq	.L3209
	bic	r3, r0, #4
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #1
	beq	.L3181
	ldr	r2, [r4, #1764]
	cmp	r2, #0
	beq	.L3207
	mov	r0, #0
.L3188:
	bic	r2, r7, #8
	cmp	r2, #7
	beq	.L3185
	cmp	r7, #8
	cmpne	r7, #30
	moveq	r2, #1
	movne	r2, #0
	cmp	r7, #11
	movne	r7, r2
	orreq	r7, r2, #1
	cmp	r0, #0
	moveq	r0, r7
	orrne	r0, r7, #1
	cmp	r0, #0
	bne	.L3185
	cmp	r3, #1
	bne	.L3207
.L3189:
	add	r5, r5, #53248
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #1852]
	str	r0, [r4, #1856]
	ldrb	r3, [r5, #2944]	@ zero_extendqisi2
	str	r3, [r4, #1860]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3185:
	ldr	r3, .L3212
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3187
	mov	r3, #0
	ldr	r0, [r4, #1840]
	mov	r2, r3
	mov	r1, #41
	blx	r6
.L3187:
	mov	r0, r5
	bl	DecVDM
	cmp	r0, #0
	bne	.L3210
.L3207:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3210:
	ldr	r2, .L3212+4
	movw	r1, #11194
	mov	r0, #1
	bl	dprint_normal
	b	.L3207
.L3176:
	ldr	r0, [r4, #1840]
	bl	VCTRL_GetChanCrcMode
	cmp	r0, #0
	bne	.L3179
	ldr	r3, [r5]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L3179
	b	.L3207
.L3209:
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #23
	ble	.L3207
	mov	r1, #24
	mov	r0, r6
	bl	BsGet
	tst	r0, #8388608
	bne	.L3211
.L3181:
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #0
	movle	r0, #0
	ble	.L3184
	mov	r0, r6
	mov	r1, #1
	bl	BsGet
.L3184:
	ldr	r3, [r4, #1764]
	cmp	r3, #0
	beq	.L3189
	mov	r3, #1
	b	.L3188
.L3211:
	tst	r0, #4194304
	moveq	r7, #20
	movne	r7, #5
	b	.L3181
.L3213:
	.align	2
.L3212:
	.word	g_EventReportFunc
	.word	.LC360
	UNWIND(.fnend)
	.size	H264DEC_CheckSedOnly, .-H264DEC_CheckSedOnly
	.align	2
	.global	ReceivePacket
	.type	ReceivePacket, %function
ReceivePacket:
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
	mov	r5, r1
	ldr	ip, [r1, #12]
	add	r6, r0, #57344
	ldr	r2, [r5, #8]
	mov	r4, r0
	ldr	r3, [r1, #4]
	mov	r0, #8
	movw	r1, #10403
	stmia	sp, {r2, ip}
	ldr	r2, .L3282
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r6, #1900]
	ldr	r3, [r4]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L3277
.L3215:
	ldr	r3, [r4, #368]
	cmp	r3, #0
	beq	.L3237
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3278
.L3218:
	movw	r1, #10412
	ldr	r2, .L3282+4
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r4, #368]
	cmp	r1, #0
	beq	.L3237
	ldr	r0, [r6, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L3237:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3222
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3222
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3222
	ldrb	r3, [r4, #377]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3240
	mov	r2, r4
	mov	r3, #1
	b	.L3225
.L3224:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3238
.L3225:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L3224
	mov	r2, r3
.L3223:
	mov	r1, r3, asl #7
	cmn	r2, #1
	sub	r3, r1, r3, asl #5
	mov	r1, #1
	add	r3, r4, r3
	strb	r1, [r3, #377]
	beq	.L3238
	mov	r3, r2, asl #7
	mov	r0, #0
	sub	r3, r3, r2, asl #5
	add	r2, r3, #376
	add	r3, r4, r3
	add	r2, r4, r2
	str	r2, [r4, #368]
	ldr	r2, [r5, #4]
	str	r2, [r3, #416]
	ldr	r2, [r5, #12]
	str	r2, [r3, #420]
	ldr	r2, [r5, #8]
	str	r2, [r3, #424]
	ldr	r3, [r4, #368]
	str	r0, [r3, #56]
	ldr	r3, [r4, #368]
	ldr	r2, [r5, #16]
	str	r2, [r3, #64]
	ldrd	r2, [r5, #24]
	ldr	ip, [r4, #368]
	strd	r2, [ip, #32]
	ldr	r3, [r4, #368]
	str	r1, [r3, #12]
	ldr	r3, [r4, #368]
	strb	r0, [r3]
	ldr	r3, [r4, #368]
	ldrb	r2, [r5]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r3, [r5, #20]
	str	r3, [r6, #1848]
	ldr	r3, [r4]
	ldrb	r3, [r3, #864]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3274
	add	r3, r4, #53248
	ldr	r1, [r5, #12]
	ldr	r2, [r3, #3568]
	ldr	r0, [r3, #3572]
	add	r1, r1, r2
	str	r1, [r3, #3568]
	ldr	r2, [r5, #12]
	add	r2, r2, r0
	str	r2, [r3, #3572]
	ldr	r3, [r4, #368]
	b	.L3229
.L3278:
	ldr	r1, [r3, #12]
	cmp	r1, #1
	bhi	.L3218
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3219
	b	.L3218
.L3277:
	ldr	r3, [r3, #848]
	cmp	r3, #0
	beq	.L3215
	ldr	r3, [r4, #368]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3237
.L3219:
	strb	r2, [r3, #4]
	ldr	r3, [r4]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L3279
.L3231:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3232
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3232
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3232
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #12]
	cmp	r1, #1
	bls	.L3280
.L3233:
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #1840]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3282+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3274
	mov	r3, #0
	ldr	r0, [r6, #1840]
	mov	r2, r3
	mov	r1, #42
	blx	r5
.L3274:
	ldr	r3, [r4, #368]
.L3229:
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3222:
	ldr	r2, .L3282+12
	movw	r1, #10459
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #1840]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3282+8
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3276
.L3275:
	mov	r3, #0
	ldr	r0, [r6, #1840]
	mov	r2, r3
	mov	r1, #42
	blx	r4
.L3276:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3232:
	ldr	r3, [r4, #368]
	b	.L3233
.L3279:
	ldr	r3, [r3, #848]
	cmp	r3, #0
	bne	.L3274
	b	.L3231
.L3280:
	mov	ip, r1, asl #5
	mov	r0, #0
	sub	r1, ip, r1, asl #2
	add	r3, r3, r1
	str	r2, [r3, #40]
	ldr	r3, [r4, #368]
	ldr	ip, [r5, #12]
	ldr	r1, [r3, #12]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #44]
	ldr	r3, [r4, #368]
	ldr	ip, [r5, #8]
	ldr	r1, [r3, #12]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #48]
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #12]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #56]
	ldr	r3, [r4, #368]
	ldr	r0, [r5, #16]
	ldr	r1, [r3, #12]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #64]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #12]
	add	r3, r3, #1
	str	r3, [r2, #12]
	ldr	r3, [r4]
	ldrb	r3, [r3, #864]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3234
	add	r3, r4, #53248
	ldr	r1, [r5, #12]
	ldr	r2, [r3, #3568]
	ldr	r0, [r3, #3572]
	add	r1, r1, r2
	str	r1, [r3, #3568]
	ldr	r2, [r5, #12]
	add	r2, r2, r0
	str	r2, [r3, #3572]
.L3234:
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #44]
	cmp	r2, #4096
	bcc	.L3281
.L3235:
	mov	r2, #1
	str	r2, [r6, #1900]
	b	.L3229
.L3281:
	mov	r0, r4
	bl	CombinePacket.part.12
	ldr	r3, [r4, #368]
	b	.L3235
.L3238:
	ldr	r2, .L3282+16
	movw	r1, #10426
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r4
	bl	ClearAllNal
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	ldr	r3, .L3282+8
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L3275
	b	.L3276
.L3240:
	mov	r2, r3
	b	.L3223
.L3283:
	.align	2
.L3282:
	.word	.LC361
	.word	.LC362
	.word	g_EventReportFunc
	.word	.LC364
	.word	.LC363
	UNWIND(.fnend)
	.size	ReceivePacket, .-ReceivePacket
	.align	2
	.global	ClearAll
	.type	ClearAll, %function
ClearAll:
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
	ldr	r2, .L3310
	mov	r5, r0
	str	r0, [fp, #-48]
	mov	r4, r1
	mov	r0, #20
	movw	r1, #467
	bl	dprint_normal
	mov	r0, r5
	bl	H264_ClearCurrPic
	mov	r0, r5
	bl	ClearAllNal
	mov	r0, r5
	bl	InitDPB
	ldr	r3, [fp, #-48]
	cmp	r4, #0
	add	r9, r3, #57344
	beq	.L3285
	add	r1, r3, #8
	ldr	r0, [r9, #1840]
	bl	FSP_ClearNotInVoQueue
.L3286:
	ldr	r3, [fp, #-48]
	mov	r8, #0
	mov	r6, #0
	mov	r7, #0
	add	r4, r3, #27392
	add	r4, r4, #200
.L3289:
	sub	r5, r4, #32
	mov	r3, #0
	sub	r2, r4, #200
	mov	r1, #1
	mvn	r10, #0
	mov	lr, #17
	mov	ip, #16
	mov	r0, #2
	str	r8, [r4, #-104]
	strb	r3, [r4, #-200]
	strb	r3, [r4, #-199]
	strb	r3, [r4, #-198]
	str	r3, [r4, #356]
	str	r3, [r4, #348]
	str	r3, [r4, #360]
	strb	r3, [r4, #-196]
	strb	r3, [r4, #392]
	str	r10, [r4, #352]
	str	r1, [r4, #364]
	strb	r1, [r4, #432]
	str	lr, [r4, #380]
	str	ip, [r4, #384]
	str	r2, [r4, #508]
	str	r2, [r4, #468]
	str	r2, [r4, #428]
	strb	r0, [r4, #472]
.L3288:
	ldr	r1, [r5, #8]!
	cmp	r1, #0
	beq	.L3287
	ldr	r0, [r9, #1840]
	bl	FreeUsdByDec
	strd	r6, [r5]
.L3287:
	cmp	r5, r4
	bne	.L3288
	add	r8, r8, #1
	add	r4, r5, #720
	cmp	r8, #40
	bne	.L3289
	ldr	r3, [fp, #-48]
	mov	r4, #0
	mov	r5, #0
	add	r6, r3, #56320
	mov	r7, r6
	add	r6, r6, #48
	add	r7, r7, #80
.L3291:
	ldr	r1, [r6, #8]!
	cmp	r1, #0
	beq	.L3290
	ldr	r0, [r9, #1840]
	bl	FreeUsdByDec
	strd	r4, [r6]
.L3290:
	cmp	r6, r7
	bne	.L3291
	ldr	r3, [r9, #800]
	cmp	r3, #0
	beq	.L3295
	ldr	r3, [fp, #-48]
	mov	r4, #0
	mov	r6, r4
	add	r5, r3, #58112
	add	r5, r5, #32
.L3294:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3293
	ldr	r0, [r9, #1840]
	bl	FreeUsdByDec
	str	r6, [r5]
.L3293:
	ldr	r3, [r9, #800]
	cmp	r3, r4
	bhi	.L3294
.L3295:
	ldr	r6, [fp, #-48]
	mov	r4, #0
	ldr	r3, .L3310+4
	mov	r1, r4
	add	r5, r6, #20480
	add	ip, r6, #24576
	str	r4, [r9, #800]
	add	r0, r5, #208
	str	r4, [r9, #1816]
	movw	r2, #1640
	str	r4, [r9, #780]
	str	r4, [r9, #1764]
	str	r4, [r9, #1824]
	str	r4, [r9, #1772]
	str	r4, [r9, #788]
	str	r4, [r9, #1872]
	str	r4, [r9, #792]
	ldr	r3, [r3, #48]
	str	r4, [r6, #368]
	str	r4, [ip, #1804]
	strb	r4, [r5, #3896]
	strb	r4, [r5, #1892]
	strb	r4, [r5, #3897]
	strb	r4, [r5, #1893]
	blx	r3
	add	r2, r6, #53248
	mov	r3, #2
	mov	r1, #1
	strb	r3, [r5, #208]
	mov	r0, r4
	strb	r1, [r5, #213]
	mov	r3, #256
	strb	r4, [r2, #2944]
	strb	r4, [r9, #112]
	str	r4, [r9, #116]
	str	r3, [r9, #120]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3285:
	add	r0, r3, #8
	bl	ResetVoQueue
	ldr	r0, [r9, #1840]
	bl	FSP_ResetInstance
	b	.L3286
.L3311:
	.align	2
.L3310:
	.word	.LC365
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ClearAll, .-ClearAll
	.align	2
	.global	InsertFrmInDPB
	.type	InsertFrmInDPB, %function
InsertFrmInDPB:
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
	cmp	r1, #15
	mov	r5, r1
	mov	r6, r0
	mov	r4, r2
	bhi	.L3408
	ldrb	r8, [r2, #3]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L3316
	bcc	.L3317
	cmp	r8, #2
	bne	.L3409
	ldr	r3, [r2, #552]
	mov	r2, #3
	strb	r2, [r3, #592]
	mov	r2, r1, asl #2
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3337
	add	r7, r0, r2
	add	r7, r7, #24576
	ldr	r3, [r7, #1944]
	cmp	r3, #0
	beq	.L3337
	strb	r8, [r3, #672]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #552]
	str	r2, [r3, #708]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #673]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #674]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #584]
	str	r2, [r3, #684]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #588]
	str	r2, [r3, #692]
	ldr	r2, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #704]
	str	r2, [r3, #704]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #596]
	str	r2, [r3, #688]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #648]
	ldr	r2, [r3, #688]
	add	r2, r2, r1
	str	r2, [r3, #608]
	str	r2, [r3, #576]
	add	r1, r4, #16
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #1944]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #3]
	mov	r2, #536
	ldr	ip, [r7, #1944]
	add	r0, ip, #8
	ldrd	r8, [ip, #216]
	ldr	r3, [ip, #8]
	ldr	r10, [ip, #12]
	strd	r8, [fp, #-68]
	str	r3, [fp, #-80]
	ldrd	r8, [ip, #224]
	ldr	r3, [ip, #16]
	strd	r8, [fp, #-52]
	str	r3, [fp, #-72]
	ldrd	r8, [ip, #232]
	ldr	r3, [ip, #20]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-76]
	bl	memcpy
	ldrd	r8, [fp, #-68]
	mvn	r1, #0
	mvn	r0, #0
	ldr	r3, [fp, #-80]
	cmp	r9, r1
	cmpeq	r8, r0
	ldrne	r2, [r7, #1944]
	movne	r0, r8
	movne	r1, r9
	strned	r0, [r2, #216]
.L3346:
	ldrd	r0, [r4, #232]
	ldrd	r8, [fp, #-52]
	ldr	r2, [r7, #1944]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r2, #224]
	ldrd	r0, [r4, #240]
	ldr	r2, [r7, #1944]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r1, r9
	movhi	r0, r8
	strd	r0, [r2, #232]
	ldr	r2, [r4, #16]
	ldr	r1, [r7, #1944]
	cmp	r2, r3
	movcs	r2, r3
	str	r2, [r1, #8]
	ldr	r3, [r4, #20]
	ldr	r2, [r7, #1944]
	cmp	r3, r10
	ldr	r1, [fp, #-72]
	movcs	r3, r10
	str	r3, [r2, #12]
	ldr	r3, [r4, #24]
	ldr	r2, [r7, #1944]
	cmp	r3, r1
	movcs	r3, r1
	ldr	r1, [fp, #-76]
	str	r3, [r2, #16]
	ldr	r3, [r4, #28]
	ldr	r2, [r7, #1944]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #20]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3349
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3349
.L3350:
	ldr	r2, [r7, #1944]
	ldr	r3, [r2, #692]
	ldr	r1, [r2, #652]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #572]
	ldr	r2, [r4, #572]
	ldr	r3, [r7, #1944]
	str	r2, [r3, #560]
	ldr	r0, [r7, #1944]
	bl	CombineFldsToFrm
	ldr	r2, [r7, #1944]
	ldr	r3, [r2, #584]
	ldr	r2, [r2, #684]
	add	r3, r3, #6720
	add	r3, r3, #10
	add	r3, r6, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3336
.L3317:
	ldr	r2, [r2, #552]
	add	r7, r0, r1, lsl #2
	add	r7, r7, #24576
	mov	r3, #3
	str	r2, [r7, #1944]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2]
	ldr	r2, [r7, #1944]
	strb	r3, [r2, #1]
	ldr	r1, [r4, #552]
	ldr	r2, [r7, #1944]
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	strb	r1, [r2, #4]
	ldr	r1, [r4, #552]
	ldr	r2, [r7, #1944]
	ldr	r1, [r1, #564]
	str	r1, [r2, #564]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r7, #1944]
	cmp	r1, #0
	beq	.L3410
.L3319:
	strb	r3, [r2, #2]
	add	r1, r4, #16
	ldr	r3, [r7, #1944]
	mov	r2, #536
	ldr	r0, [r4, #620]
	mov	r9, #0
	str	r0, [r3, #580]
	ldr	r0, [r7, #1944]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #596]
	mov	lr, #1
	mov	ip, #2
	mov	r0, r6
	str	r2, [r3, #608]
	str	r2, [r3, #576]
	mov	r2, r9
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #552]
	str	r1, [r3, #708]
	str	r1, [r3, #668]
	str	r1, [r3, #628]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #564]
	str	r1, [r3, #556]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #560]
	str	r1, [r3, #548]
	ldr	r3, [r7, #1944]
	strb	r9, [r3, #592]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #593]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #594]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #588]
	str	r1, [r3, #612]
	str	r1, [r3, #572]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	str	r1, [r3, #568]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #572]
	str	r1, [r3, #560]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #576]
	str	r1, [r3, #604]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #580]
	str	r1, [r3, #644]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #584]
	str	r1, [r3, #684]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, lr
	ldr	r3, [r7, #1944]
	moveq	r8, #3
	strb	r8, [r3, #3]
	ldr	r1, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r1, [r1, #624]
	str	r1, [r3, #624]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r3, #593]	@ zero_extendqisi2
	ldrb	r7, [r3, #594]	@ zero_extendqisi2
	strb	lr, [r3, #632]
	strb	ip, [r3, #672]
	ldr	lr, [r3, #608]
	ldr	ip, [r3, #612]
	strb	r1, [r3, #633]
	strb	r1, [r3, #673]
	ldr	r1, [r3, #628]
	strb	r7, [r3, #634]
	strb	r7, [r3, #674]
	str	r1, [r3, #668]
	str	lr, [r3, #648]
	str	lr, [r3, #688]
	str	ip, [r3, #652]
	str	ip, [r3, #692]
	str	r1, [r3, #708]
	ldr	r1, [r4, #552]
	bl	GetAPC
	cmp	r0, #0
	strne	r0, [sp]
	movwne	r3, #1953
	movne	r0, r9
	bne	.L3406
.L3336:
	add	r5, r5, #6592
	add	r3, r6, #57344
	add	r5, r5, #38
	mov	r2, #1
	ldr	r0, [r3, #1840]
	ldr	r3, [r6, r5, asl #2]
	ldr	r1, [r3, #544]
	bl	FSP_SetRef
	mov	r0, #0
.L3314:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3409:
	mov	r3, r8
	ldr	r2, .L3411
	movw	r1, #2199
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3316:
	ldr	r3, [r2, #552]
	mov	r2, #3
	strb	r2, [r3, #592]
	mov	r2, r1, asl #2
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3322
	add	r7, r0, r2
	add	r7, r7, #24576
	ldr	r3, [r7, #1944]
	cmp	r3, #0
	beq	.L3322
	strb	r8, [r3, #632]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #588]
	str	r2, [r3, #652]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #633]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #634]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #580]
	str	r2, [r3, #644]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #588]
	str	r2, [r3, #652]
	ldr	r2, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #664]
	str	r2, [r3, #664]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #596]
	str	r2, [r3, #648]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #648]
	ldr	r2, [r3, #688]
	add	r2, r2, r1
	str	r2, [r3, #608]
	str	r2, [r3, #576]
	add	r1, r4, #16
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #1944]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #1
	strb	r2, [r3, #3]
	mov	r2, #536
	ldr	ip, [r7, #1944]
	add	r0, ip, #8
	ldr	r3, [ip, #216]
	ldrd	r8, [ip, #224]
	ldr	lr, [ip, #220]
	str	r3, [fp, #-76]
	ldr	r3, [ip, #8]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip, #232]
	str	r3, [fp, #-84]
	ldr	r3, [ip, #16]
	ldr	r10, [ip, #12]
	str	lr, [fp, #-80]
	str	r3, [fp, #-68]
	ldr	r3, [ip, #20]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-72]
	bl	memcpy
	ldr	ip, [fp, #-76]
	ldr	lr, [fp, #-80]
	ldr	r0, [r4, #224]
	ldr	r1, [r4, #228]
	and	r2, ip, lr
	adds	r2, r2, #1
	ldrd	r8, [fp, #-52]
	and	r1, r1, r0
	ldr	r3, [fp, #-84]
	movne	r2, #1
	cmn	r1, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r7, #1944]
	strne	ip, [r2, #216]
	strne	lr, [r2, #220]
	ldrd	r0, [r4, #232]
	ldr	r2, [r7, #1944]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r2, #224]
	ldrd	r0, [r4, #240]
	ldr	r2, [r7, #1944]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r1, r9
	movhi	r0, r8
	strd	r0, [r2, #232]
	ldr	r2, [r4, #16]
	ldr	r1, [r7, #1944]
	cmp	r2, r3
	movcs	r2, r3
	str	r2, [r1, #8]
	ldr	r3, [r4, #20]
	ldr	r2, [r7, #1944]
	cmp	r3, r10
	ldr	r1, [fp, #-68]
	movcs	r3, r10
	str	r3, [r2, #12]
	ldr	r3, [r4, #24]
	ldr	r2, [r7, #1944]
	cmp	r3, r1
	movcs	r3, r1
	ldr	r1, [fp, #-72]
	str	r3, [r2, #16]
	ldr	r3, [r4, #28]
	ldr	r2, [r7, #1944]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #20]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3333
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3333
.L3334:
	ldr	r2, [r7, #1944]
	ldr	r3, [r2, #692]
	ldr	r1, [r2, #652]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #572]
	ldr	r2, [r4, #572]
	ldr	r3, [r7, #1944]
	str	r2, [r3, #560]
	ldr	r0, [r7, #1944]
	bl	CombineFldsToFrm
	ldr	r2, [r7, #1944]
	ldr	r3, [r2, #584]
	ldr	r2, [r2, #644]
	add	r3, r3, #6656
	add	r3, r3, #58
	add	r3, r6, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3336
.L3322:
	ldr	r3, [r4, #552]
	add	r7, r6, r2
	add	r7, r7, #24576
	mov	r2, #1
	str	r3, [r7, #1944]
	strb	r2, [r3, #632]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #552]
	str	r1, [r3, #668]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #633]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #634]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #580]
	str	r1, [r3, #644]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #588]
	str	r1, [r3, #652]
	ldr	r1, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r1, [r1, #664]
	str	r1, [r3, #664]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #596]
	str	r1, [r3, #648]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #648]
	str	r1, [r3, #608]
	str	r1, [r3, #576]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #1944]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #552]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #564]
	str	r2, [r3, #564]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3324
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3324
.L3325:
	ldr	r3, [r7, #1944]
	mov	r8, #0
	mov	r2, #536
	add	r1, r4, #16
	str	r8, [r3, #568]
	ldr	r0, [r7, #1944]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #620]
	mov	r2, #1
	mov	r0, r6
	str	r1, [r3, #580]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #560]
	str	r1, [r3, #548]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #572]
	str	r1, [r3, #560]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #588]
	str	r1, [r3, #572]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	ldr	r1, [r7, #1944]
	rsb	r3, r2, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r1, #3]
	ldr	r1, [r4, #552]
	bl	GetAPC
	cmp	r0, #0
	beq	.L3336
	str	r0, [sp]
	movw	r3, #2004
	mov	r0, r8
.L3406:
	mov	r1, r3
	ldr	r2, .L3411+4
	bl	dprint_normal
	mov	r0, r6
	bl	ClearDPB
	mvn	r0, #0
	b	.L3314
.L3337:
	ldr	r3, [r4, #552]
	add	r7, r6, r2
	add	r7, r7, #24576
	mov	r2, #2
	str	r3, [r7, #1944]
	strb	r2, [r3, #672]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #552]
	str	r1, [r3, #708]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #673]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #674]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #584]
	str	r1, [r3, #684]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #588]
	str	r1, [r3, #692]
	ldr	r1, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r1, [r1, #704]
	str	r1, [r3, #704]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #596]
	str	r1, [r3, #688]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #648]
	str	r1, [r3, #608]
	str	r1, [r3, #576]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #1944]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #552]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #552]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #564]
	str	r2, [r3, #564]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3339
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3339
.L3340:
	ldr	r3, [r7, #1944]
	mov	r9, #0
	mov	r2, #536
	add	r1, r4, #16
	str	r9, [r3, #568]
	ldr	r0, [r7, #1944]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #620]
	mov	r2, #2
	mov	r0, r6
	str	r1, [r3, #580]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #560]
	str	r1, [r3, #548]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #572]
	str	r1, [r3, #560]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #588]
	str	r1, [r3, #692]
	str	r1, [r3, #572]
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	r3, [r7, #1944]
	cmp	r1, #1
	moveq	r8, r2
	movne	r8, r9
	strb	r8, [r3, #3]
	ldr	r1, [r4, #552]
	bl	GetAPC
	cmp	r0, #0
	strne	r0, [sp]
	movwne	r3, #2125
	movne	r0, r9
	beq	.L3336
	b	.L3406
.L3410:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3319
.L3324:
	ldr	r3, [r7, #1944]
	mov	r2, #1
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #556]
	b	.L3325
.L3339:
	ldr	r3, [r7, #1944]
	mov	r2, #2
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #556]
	b	.L3340
.L3349:
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #556]
	b	.L3350
.L3333:
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #556]
	b	.L3334
.L3408:
	movw	r3, #1914
	str	r1, [sp]
	ldr	r2, .L3411+8
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3314
.L3412:
	.align	2
.L3411:
	.word	.LC368
	.word	.LC367
	.word	.LC366
	UNWIND(.fnend)
	.size	InsertFrmInDPB, .-InsertFrmInDPB
	.align	2
	.global	StorePicInDPB
	.type	StorePicInDPB, %function
StorePicInDPB:
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
	add	r2, r0, #16384
	add	r5, r0, #53248
	mov	r3, #0
	str	r3, [r2, #3444]
	mov	r4, r0
	ldrb	r3, [r5, #2947]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r2, #3448]
	ldrb	r3, [r5, #2944]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3593
	add	r6, r0, #57344
	ldr	r3, .L3619
	ldr	r1, [r6, #1840]
	ldr	r2, [r6, #1880]
	ldr	r3, [r3, r1, asl #2]
	str	r2, [r6, #1876]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3594
.L3416:
	ldr	r3, [r6, #1768]
	cmp	r3, #2
	beq	.L3595
	ldr	r7, [r4]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L3421
	ldr	r2, [r6, #1872]
	cmp	r2, #2
	beq	.L3423
	ldrb	r2, [r5, #2946]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3423
.L3504:
	ldr	r2, [r5, #3496]
	ldrb	r1, [r5, #2947]	@ zero_extendqisi2
	str	r2, [fp, #-64]
	sub	r2, r1, #1
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	cmp	r1, #0
	beq	.L3425
	ldr	r0, [fp, #-64]
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	ip, r2
	orrne	ip, r2, #1
	cmp	ip, #0
	beq	.L3424
	cmp	r2, #0
	beq	.L3596
.L3507:
	ldr	r2, [r6, #1872]
	cmp	r2, #0
	bne	.L3428
	add	r0, r5, #3568
	mov	r3, #1
	add	r0, r0, #8
	str	r3, [r6, #1872]
	mov	r2, #632
	add	r1, r5, #2944
	bl	memcpy
	ldr	r3, [r7, #12]
.L3424:
	cmp	r3, #2
	beq	.L3597
.L3423:
	ldr	r3, [r5, #3512]
	cmp	r3, #0
	beq	.L3461
	ldr	r2, [r6, #1832]
	ldr	r3, [r5, #3540]
	cmp	r2, r3
	bcs	.L3462
	ldrb	r1, [r5, #2946]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3462
	ldr	r1, [r7, #616]
	cmp	r1, #0
	beq	.L3598
.L3462:
	mov	r0, r4
	bl	Marking
	subs	r3, r0, #0
	bne	.L3599
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L3600
.L3454:
	ldrb	r3, [r5, #2945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3466
	add	r7, r4, #24576
.L3470:
	ldr	r3, [r5, #3512]
	cmp	r3, #0
	beq	.L3601
	ldr	r2, [r7, #2144]
	ldr	r1, [r7, #2148]
	ldr	ip, [r7, #2136]
	add	r3, r1, r2
	cmp	ip, r3
	bhi	.L3478
	ldr	r3, [r4]
	ldr	r3, [r3, #12]
	cmp	r3, #3
	beq	.L3479
	ldr	r3, .L3619+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3479
	movw	r3, #3161
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	mov	r1, r3
	str	ip, [sp]
	mov	r0, #1
	ldr	r2, .L3619+8
	bl	dprint_normal
	mov	r0, r4
	bl	ClearDPB
	movw	r3, #3163
	b	.L3585
.L3421:
	ldrb	r2, [r5, #2946]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3424
	b	.L3504
.L3425:
	cmp	r2, #0
	bne	.L3507
.L3431:
	add	r7, r4, #56064
	add	r7, r7, #128
.L3434:
	cmp	r1, #0
	beq	.L3435
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3602
.L3435:
	ldr	r3, [r7, #596]
	ldr	r2, [fp, #-64]
	str	r3, [r2, #576]
.L3436:
	ldr	r8, [fp, #-64]
	mov	r0, r4
	mov	r1, r8
	bl	GetImagePara
	ldr	r1, [r8, #544]
	ldr	r0, [r6, #1840]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	str	r3, [fp, #-68]
	beq	.L3603
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3438
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3604
.L3438:
	ldrd	r2, [r7, #224]
.L3583:
	ldr	r1, [fp, #-68]
	strd	r2, [r1, #208]
.L3439:
	ldrd	r2, [r7, #232]
	add	ip, r7, #304
	ldr	r8, [fp, #-68]
	add	r1, r7, #184
	ldr	lr, .L3619+12
	add	r0, r8, #288
	strd	r2, [r8, #216]
	ldrd	r2, [r7, #240]
	strd	r2, [r8, #224]
	mov	r2, #32
	ldr	r3, [r7, #16]
	str	r3, [r8]
	ldr	r3, [r7, #20]
	str	r3, [r8, #4]
	ldr	r3, [r7, #24]
	str	r3, [r8, #8]
	ldr	r3, [r7, #28]
	str	r3, [r8, #12]
	ldr	r3, [fp, #-64]
	ldr	r10, [r3, #576]
	ldr	r3, [lr, #52]
	str	r10, [r8, #96]
	mov	r10, r8
	ldr	lr, [r7, #292]
	str	lr, [r8, #276]
	ldr	lr, [r7, #288]
	str	lr, [r8, #272]
	ldrd	r8, [ip, #-8]
	strd	r8, [r0, #-8]
	add	r0, r10, #168
	ldr	ip, [r7, #544]
	str	ip, [r10, #528]
	ldr	ip, [r7, #548]
	str	ip, [r10, #532]
	blx	r3
	ldr	r3, [r10, #96]
	cmp	r3, #0
	beq	.L3445
	ldr	r2, [fp, #-68]
	ldrb	r2, [r2, #156]	@ zero_extendqisi2
	ands	r7, r2, #3
	beq	.L3605
.L3443:
	ldr	r2, [r4]
	ldr	r1, [r2, #4]
	cmp	r1, r3
	bcc	.L3606
.L3445:
	ldr	r3, [fp, #-64]
	mov	r2, #1
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
	ldr	r3, [fp, #-68]
	ldr	r0, [r6, #1840]
	mov	r2, r4
	mov	r1, #0
	str	r3, [sp]
	add	r3, r4, #8
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3607
	ldr	r3, [fp, #-64]
	mov	r2, #0
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
.L3447:
	ldr	r3, [r4]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	bcs	.L3608
	ldr	r2, [fp, #-68]
	mov	r3, #0
	str	r3, [r2, #16]
.L3449:
	ldr	r2, [r6, #1872]
	ldr	r3, [r6, #1888]
	cmp	r2, #2
	add	r3, r3, #2
	str	r3, [r6, #1888]
	ldrne	r2, [fp, #-64]
	movne	r3, #1
	strne	r3, [r2, #712]
.L3451:
	mov	r3, #2
	str	r3, [r6, #1872]
	ldr	r7, [r4]
	ldr	r3, [r7, #12]
	b	.L3424
.L3593:
	mov	r0, r3
	ldr	r2, .L3619+16
	movw	r1, #2861
	add	r6, r4, #57344
	bl	dprint_normal
	movw	r3, #2862
.L3585:
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L3619+20
	mvn	r3, #0
	mov	r0, #12
	bl	dprint_normal
.L3506:
	ldr	r3, [r5, #3496]
	mvn	r4, #0
	ldr	r0, [r6, #1840]
	mov	r7, r4
	ldr	r1, [r3, #544]
	bl	FSP_ClearLogicFs
	movw	r3, #3257
	mov	r1, r3
	ldr	r2, .L3619+24
	str	r4, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r5, #3496]
	mov	r3, #0
	strb	r3, [r2, #4]
	ldr	r2, [r5, #3496]
	strb	r3, [r2, #1]
.L3503:
	mov	r0, r7
	mov	r3, #0
	strb	r3, [r5, #2944]
.L3580:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3599:
	ldr	r2, .L3619+28
	movw	r1, #3090
	mov	r0, #1
	bl	dprint_normal
	movw	r3, #3091
	b	.L3585
.L3596:
	cmp	r0, #0
	beq	.L3424
	b	.L3431
.L3479:
	ldr	r8, [r7, #2140]
	mov	r3, #0
	str	r3, [fp, #-52]
	mvn	r3, #-2147483648
	cmp	r8, ip
	strhi	ip, [r7, #2140]
	str	r3, [fp, #-56]
	movhi	r8, ip
	cmp	r8, #0
	beq	.L3512
	add	ip, r4, #26368
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-52]
	add	ip, ip, #148
	mvn	lr, #-2147483648
	mov	r3, #0
.L3484:
	ldr	r0, [ip, #4]!
	ldr	r0, [r0, #560]
	cmp	r0, lr
	movlt	r1, r3
	add	r3, r3, #1
	movlt	r2, r0
	cmp	r3, r8
	mov	lr, r2
	bne	.L3484
	str	r2, [fp, #-56]
	str	r1, [fp, #-52]
.L3482:
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	ip, [r7, #2136]
.L3478:
	mvn	r10, #0
	mov	r9, r10
	b	.L3494
.L3495:
	bl	GetMinPOC
	ldr	r2, [r5, #3512]
	cmp	r2, #0
	bne	.L3485
	ldr	r1, [r5, #3516]
	ldr	r2, [fp, #-56]
	cmp	r1, r2
	blt	.L3486
.L3485:
	ldr	r2, [r7, #2136]
	cmp	r2, #0
	beq	.L3486
	ldr	r8, [r7, #2140]
	cmp	r8, r10
	ldrne	r9, [fp, #-52]
	bne	.L3492
	ldr	r3, [fp, #-52]
	cmp	r3, r9
	beq	.L3609
	mov	r9, r3
.L3492:
	mov	r1, r9
	mov	r0, r4
	bl	OutputFrmFromDPB
	mov	r10, r8
	cmn	r0, #1
	beq	.L3493
	ldr	ip, [r7, #2136]
.L3494:
	ldr	lr, [r7, #2140]
	sub	r2, fp, #52
	sub	r1, fp, #56
	mov	r0, r4
	cmp	lr, ip
	bcs	.L3495
	ldr	r3, [r5, #3512]
	cmp	r3, #0
	beq	.L3496
	ldrb	r3, [r5, #2948]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3496
	ldr	r2, [r7, #2144]
	cmp	r2, #0
	beq	.L3496
	add	r2, r4, #26368
	mov	lr, r3
	add	r2, r2, #212
	b	.L3501
.L3498:
	ldr	r1, [r7, #2144]
	cmp	r1, r3
	bls	.L3610
.L3501:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	ldr	r0, [r5, #3504]
	ldr	ip, [r1, #548]
	cmp	ip, r0
	bne	.L3498
	strb	lr, [r1, #2]
	ldr	r1, [r2]
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	cmp	r0, #1
	streq	r0, [r1, #564]
	ldreq	r1, [r2]
	streqb	lr, [r1, #4]
	ldreq	r1, [r2]
	ldr	r8, [r6, #776]
	ldr	ip, [r1, #580]
	add	r0, ip, #14464
	cmp	ip, r8
	add	r0, r0, #48
	strne	lr, [r4, r0, asl #2]
	strne	r8, [r1, #580]
	b	.L3498
.L3610:
	ldr	lr, [r7, #2140]
.L3496:
	add	r2, r4, #56064
	mov	r1, lr
	add	r2, r2, #128
	mov	r0, r4
	bl	InsertFrmInDPB
	ldr	r3, [r7, #2140]
	str	r3, [r6, #136]
	cmp	r0, #0
	beq	.L3502
	movw	r3, #3243
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3619+24
	mov	r0, #1
	bl	dprint_normal
	movw	r3, #3244
	b	.L3585
.L3594:
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L3416
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L3416
	bl	H264_Sei_Get_Frame_Pts
	b	.L3416
.L3461:
	ldrb	r3, [r5, #2945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3466
	add	r7, r4, #24576
	ldr	ip, [r7, #2136]
	b	.L3478
.L3597:
	ldr	r3, [r5, #3512]
	cmp	r3, #0
	beq	.L3454
	ldrb	r3, [r5, #2950]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3455
.L3459:
	mov	r0, r4
	add	r7, r4, #24576
	bl	SimpleSlideDPB
	add	r2, r4, #56064
	ldr	r1, [r7, #2140]
	add	r2, r2, #128
	mov	r0, r4
	bl	InsertFrmInDPB
	subs	r8, r0, #0
	beq	.L3611
	movw	r3, #3058
	str	r8, [sp]
	mov	r1, r3
	ldr	r2, .L3619+24
	mov	r0, #0
	bl	dprint_normal
	movw	r3, #3059
	b	.L3585
.L3601:
	ldr	ip, [r7, #2136]
	b	.L3478
.L3466:
	ldr	r3, [r6, #140]
	ldr	r0, [r5, #3496]
	cmp	r3, #0
	rsb	r1, r3, r0
	clz	r1, r1
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	beq	.L3612
	mov	r0, r4
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3613
	cmp	r0, #1
	ldreq	r2, [r5, #3496]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #3496]
	streqb	r3, [r2, #1]
.L3474:
	movw	r1, #3122
	b	.L3584
.L3486:
	ldr	r3, [r6, #1768]
	cmp	r3, #2
	beq	.L3614
.L3488:
	mov	r0, r4
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3615
	cmp	r0, #1
	ldreq	r2, [r5, #3496]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #3496]
	streqb	r3, [r2, #1]
.L3490:
	movw	r1, #3192
.L3584:
.L3420:
	mov	r3, r7
	str	r1, [sp]
	ldr	r2, .L3619+20
	mov	r0, #12
	bl	dprint_normal
	cmn	r7, #1
	bne	.L3503
	b	.L3506
.L3595:
	movw	r1, #2881
	ldr	r2, .L3619+32
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r4
	bl	DirectOutput
	ldr	r3, [r5, #3564]
	ldr	r2, [r6, #776]
	cmp	r3, r2
	addne	r3, r3, #14464
	addne	r3, r3, #48
	movne	r1, #0
	strne	r1, [r4, r3, asl #2]
	mov	r7, r0
	strne	r2, [r5, #3564]
	cmp	r0, #1
	mov	r1, #2896
	ldreq	r2, [r5, #3496]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #3496]
	streqb	r3, [r2, #1]
	b	.L3584
.L3612:
	add	r7, r4, #24576
	ldr	ip, [r7, #2140]
	cmp	ip, #0
	beq	.L3470
	ldr	r3, [r7, #1944]
	cmp	r0, r3
	addne	r3, r4, #26368
	addne	r3, r3, #152
	beq	.L3471
.L3475:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3470
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	bne	.L3475
.L3471:
	add	r2, r4, #56064
	mov	r0, r4
	add	r2, r2, #128
	bl	InsertFrmInDPB
	cmn	r0, #1
	mov	r7, r0
	beq	.L3616
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	movw	r3, #3142
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L3619+20
	mov	r3, #0
	mov	r0, #12
	bl	dprint_normal
.L3460:
	mov	r7, #0
	b	.L3503
.L3428:
	cmp	r2, #1
	beq	.L3617
	cmp	r1, #0
	beq	.L3431
	ldr	r2, [fp, #-64]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3431
	b	.L3424
.L3493:
	movw	r3, #3210
	mov	r4, r0
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3619+24
	mov	r0, #1
	bl	dprint_normal
	movw	r1, #3211
	mov	r3, r4
	str	r1, [sp]
	ldr	r2, .L3619+20
	mov	r0, #12
	bl	dprint_normal
	b	.L3506
.L3606:
	ldr	r2, [r2, #616]
	cmp	r2, #1
	beq	.L3445
	ldr	r2, .L3619+36
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L3452
	str	r3, [fp, #-52]
	sub	r2, fp, #52
	str	r1, [fp, #-48]
	mov	r3, #8
	mov	r1, #23
	ldr	r0, [r6, #1840]
	blx	r4
.L3452:
	ldr	r3, [fp, #-64]
	mov	r2, #0
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_SetDisplay
	movw	r3, #3023
	b	.L3585
.L3611:
	ldr	r3, [r7, #2140]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r7, #2140]
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	movw	r1, #3067
	mov	r3, r8
	str	r1, [sp]
	ldr	r2, .L3619+20
	mov	r0, #12
	bl	dprint_normal
	b	.L3460
.L3502:
	add	r3, r3, #1
	mov	r0, r4
	str	r3, [r7, #2140]
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	b	.L3460
.L3598:
	str	r2, [sp]
	movw	r1, #3076
	ldr	r2, .L3619+40
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3619+36
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L3463
	ldr	r0, [r6, #1832]
	mov	r3, #8
	ldr	ip, [r5, #3540]
	sub	r2, fp, #52
	mov	r1, #23
	str	r0, [fp, #-48]
	str	ip, [fp, #-52]
	ldr	r0, [r6, #1840]
	blx	r7
.L3463:
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	movw	r3, #3082
	b	.L3585
.L3602:
	ldr	r1, [fp, #-64]
	mov	r2, #3
	ldr	r3, [r1, #576]
	strb	r2, [r1, #1]
	ldr	r2, [r7, #596]
	add	r3, r3, r2
	str	r3, [r1, #576]
	b	.L3436
.L3605:
	movw	r3, #2998
	ldr	r2, .L3619+44
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3619+36
	ldr	r10, [r3]
	cmp	r10, #0
	beq	.L3444
	mov	r3, r7
	mov	r2, r7
	mov	r1, #40
	ldr	r0, [r6, #1840]
	blx	r10
.L3444:
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #96]
	cmp	r3, #0
	bne	.L3443
	b	.L3445
.L3604:
	ldrd	r0, [r7, #224]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r1, r3
	cmpeq	r0, r2
	bne	.L3439
	add	r3, r4, #56832
	add	r3, r3, #224
	ldrd	r2, [r3, #-8]
	cmp	r3, r1
	cmpeq	r2, r0
	bne	.L3583
	b	.L3439
.L3613:
	movw	r3, #3112
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3619+24
	mov	r0, #1
	bl	dprint_normal
	b	.L3474
.L3607:
	ldr	r3, [r6, #1896]
	add	r3, r3, #1
	str	r3, [r6, #1896]
	b	.L3447
.L3609:
	ldr	r3, .L3619+48
	movw	r1, #3197
	str	r9, [sp]
	mov	r0, #1
	ldr	r2, .L3619+52
	bl	dprint_normal
	movw	r3, #3198
	b	.L3585
.L3600:
	ldr	r2, .L3619+56
	movw	r1, #3099
	mov	r0, #20
	bl	dprint_normal
	b	.L3454
.L3614:
	ldrb	r3, [r5, #2947]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r5, #3496]
	strne	r3, [r6, #144]
	b	.L3488
.L3608:
	ldr	r1, [fp, #-68]
	mov	r0, r4
	bl	SetFrmRepeatCount.part.2
	b	.L3449
.L3455:
	mov	r0, r4
	bl	IDRMemMarking
	cmp	r0, #0
	beq	.L3459
	mvn	r0, #0
	b	.L3580
.L3617:
	ldr	r3, [r6, #32]
	cmp	r1, #1
	add	r7, r4, #56064
	add	r7, r7, #128
	str	r3, [fp, #-64]
	beq	.L3618
	cmp	r1, #2
	ldreq	r3, [r5, #3528]
	ldreq	r2, [fp, #-64]
	streq	r3, [r2, #684]
	ldreqb	r1, [r5, #2947]	@ zero_extendqisi2
	b	.L3434
.L3615:
	movw	r3, #3183
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3619+24
	mov	r0, #1
	bl	dprint_normal
	b	.L3490
.L3616:
	movw	r3, #3135
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3619+24
	mov	r0, #1
	bl	dprint_normal
	mov	r1, #3136
	mov	r3, r7
	str	r1, [sp]
	ldr	r2, .L3619+20
	mov	r0, #12
	bl	dprint_normal
	b	.L3506
.L3603:
	mov	r3, #2960
	ldr	r2, .L3619+60
	mov	r1, r3
	bl	dprint_normal
	movw	r3, #2961
	b	.L3585
.L3618:
	ldr	r3, [r5, #3524]
	ldr	r2, [fp, #-64]
	str	r3, [r2, #644]
	ldrb	r1, [r5, #2947]	@ zero_extendqisi2
	b	.L3434
.L3512:
	mov	r1, r8
	b	.L3482
.L3620:
	.align	2
.L3619:
	.word	s_pstVfmwChan
	.word	g_AppleAirplayMirrorinigFlag
	.word	.LC378
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC369
	.word	.LC370
	.word	.LC374
	.word	.LC376
	.word	.LC371
	.word	g_EventReportFunc
	.word	.LC375
	.word	.LC373
	.word	.LANCHOR0+364
	.word	.LC379
	.word	.LC377
	.word	.LC372
	UNWIND(.fnend)
	.size	StorePicInDPB, .-StorePicInDPB
	.align	2
	.global	AllocFrameStore
	.type	AllocFrameStore, %function
AllocFrameStore:
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
	add	r7, r0, #20480
	str	r1, [fp, #-60]
	mov	r6, r0
	ldrb	r1, [r7, #209]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L3622
	ldrb	r2, [r7, #210]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3690
	add	r3, r0, #12288
	ldr	r2, [r7, #216]
	mov	lr, #2208
	add	r5, r0, #57344
	ldr	ip, [r3, #1304]
	mov	r0, #4000
	ldr	r1, [r3, #1300]
	mla	r3, lr, r2, ip
	ldr	r2, [r5, #1768]
	cmp	r2, #2
	ldr	r3, [r3, #28]
	mla	r3, r0, r3, r1
	str	r3, [fp, #-56]
	beq	.L3691
	add	r4, r6, #53248
	mov	r3, #0
	strb	r3, [r4, #2945]
	ldrb	r3, [r5, #112]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r3, #2
	str	r3, [fp, #-52]
	bne	.L3653
.L3649:
	ldr	r2, [r5, #120]
	ldr	r3, [r7, #224]
	cmp	r2, r3
	bne	.L3653
	ldr	r3, [r7, #236]
	cmp	r3, #0
	ldr	r3, [r5, #116]
	beq	.L3692
	cmp	r3, #0
	beq	.L3653
.L3628:
	ldr	r3, [r5, #1880]
	ldr	r2, [r5, #1876]
	rsb	r3, r2, r3
	cmp	r3, #2
	bhi	.L3653
	ldr	r1, [r4, #3496]
	mov	r3, #1
	strb	r3, [r4, #2945]
	cmp	r1, #0
	beq	.L3630
	ldr	r3, [fp, #-52]
	cmp	r3, #2
	beq	.L3693
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	beq	.L3694
.L3656:
	mov	r9, #0
	b	.L3634
.L3622:
	add	r3, r0, #12288
	ldr	r2, [r7, #216]
	mov	r4, #2208
	add	r5, r0, #57344
	ldr	lr, [r3, #1304]
	mov	ip, #4000
	ldr	r0, [r3, #1300]
	mla	r3, r4, r2, lr
	ldr	r2, [r5, #1768]
	cmp	r2, #2
	streq	r1, [fp, #-52]
	ldr	r3, [r3, #28]
	mla	r3, ip, r3, r0
	str	r3, [fp, #-56]
	beq	.L3650
	add	r4, r6, #53248
	str	r1, [fp, #-52]
	strb	r1, [r4, #2945]
.L3653:
	mov	lr, #0
	strb	lr, [r4, #2944]
	ldr	r8, [r5, #772]
	cmp	r8, lr
	addne	r10, r6, #26368
	addne	r0, r6, #27392
	addne	r10, r10, #152
	addne	r9, r6, #24576
	beq	.L3642
.L3641:
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3637
	cmp	r0, #0
	beq	.L3658
	ldr	r1, [r9, #2140]
	cmp	r1, #0
	beq	.L3658
	ldr	r2, [r9, #1944]
	cmp	r2, r0
	beq	.L3637
	mov	r2, r10
	b	.L3639
.L3640:
	ldr	ip, [r2, #4]!
	cmp	ip, r0
	beq	.L3637
.L3639:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3640
.L3658:
	mov	r9, #720
	mov	r8, r0
	mla	r9, r9, lr, r6
	movw	r0, #27968
	mov	r10, #0
	mov	r3, #1
	str	r8, [r4, #3496]
	mov	ip, #101
	add	r1, r9, #27392
	strb	r3, [r4, #2944]
	mov	r2, #536
	add	r1, r1, #8
	str	r10, [r9, r0]
	add	r0, r4, #2960
	str	ip, [r4, #3540]
	str	r3, [fp, #-48]
	bl	memcpy
	add	lr, r9, #27392
	str	r10, [r4, #3056]
	ldr	r3, [fp, #-48]
	strb	r10, [lr, #3]
	str	r10, [r8, #564]
	ldr	r2, [r4, #3496]
	strb	r10, [r2, #2]
	ldr	r2, [r4, #3496]
	strb	r3, [r2, #4]
	ldr	r3, [r4, #3496]
	str	r10, [r3, #712]
	ldrb	r8, [r4, #2944]	@ zero_extendqisi2
	cmp	r8, #1
	bne	.L3642
	ldr	r3, [fp, #-60]
	ldr	r0, [r5, #1840]
	cmp	r3, #0
	movne	r1, #3
	moveq	r1, #0
	bl	FSP_NewLogicFs
	mov	r9, r0
	mov	r1, r0
	ldr	r0, [r5, #1840]
	bl	FSP_GetLogicFs
	mvn	r3, r9
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r10, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L3644
	ldr	ip, [fp, #-56]
	add	r1, r0, #40
	ldr	r8, .L3697
	mov	r2, #536
	ldrb	r3, [ip, #22]	@ zero_extendqisi2
	strb	r3, [r0, #328]
	ldr	r0, [ip, #3324]
	ldr	r3, [r8, #52]
	strb	r0, [r10, #329]
	ldr	r0, [ip, #3332]
	strb	r0, [r10, #330]
	ldr	r0, [ip, #3328]
	str	r0, [r10, #332]
	ldr	r0, [r4, #3496]
	add	r0, r0, #8
	blx	r3
	ldr	r1, [r4, #3496]
	add	r0, r6, #56064
	ldr	r3, [r8, #52]
	add	r1, r1, #8
	add	r0, r0, #144
	mov	r2, #536
	blx	r3
	ldr	r3, [r4, #3496]
	str	r9, [r3, #544]
	ldr	r3, [r10, #32]
	ldr	r1, [r4, #3496]
	cmp	r3, #0
	ldrne	r3, [r3, #4]
	str	r3, [r4, #3564]
.L3634:
	ldrb	r2, [fp, #-52]	@ zero_extendqisi2
	strb	r2, [r4, #2947]
	ldrb	r3, [r7, #209]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	strb	r3, [r1, #592]
	ldrb	r3, [r4, #2945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3695
	ldr	r3, [fp, #-52]
	strb	r2, [r5, #112]
	cmp	r3, #0
	ldr	r3, [r7, #224]
	ldr	r2, [r5, #1880]
	ldreq	r0, [fp, #-52]
	movne	r0, #0
	str	r3, [r5, #120]
	ldr	r3, [r7, #236]
	str	r9, [r5, #132]
	str	r2, [r5, #128]
	str	r3, [r5, #116]
	movne	r3, #1
	moveq	r3, r0
	strb	r3, [r5, #113]
.L3680:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3637:
	add	lr, lr, #1
	add	r0, r0, #720
	cmp	lr, r8
	bne	.L3641
.L3642:
	ldr	r2, .L3697+4
	movw	r1, #5021
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3690:
	add	r3, r0, #12288
	ldr	r1, [r7, #216]
	mov	r4, #2208
	add	r5, r0, #57344
	ldr	lr, [r3, #1304]
	mov	ip, #4000
	ldr	r0, [r3, #1300]
	mla	r3, r4, r1, lr
	ldr	r1, [r5, #1768]
	cmp	r1, #2
	ldr	r3, [r3, #28]
	mla	r3, ip, r3, r0
	str	r3, [fp, #-56]
	beq	.L3696
	add	r4, r6, #53248
	strb	r2, [r4, #2945]
	ldrb	r3, [r5, #112]	@ zero_extendqisi2
	cmp	r3, #2
	mov	r3, #1
	str	r3, [fp, #-52]
	bne	.L3653
	b	.L3649
.L3696:
	mov	r3, #1
	str	r3, [fp, #-52]
.L3650:
	add	r4, r6, #53248
	mov	r3, #0
	strb	r3, [r4, #2945]
	b	.L3653
.L3691:
	str	r2, [fp, #-52]
	b	.L3650
.L3695:
	mov	r3, #0
	strb	r3, [r5, #112]
	ldr	r1, [r7, #224]
	mov	r0, r3
	ldr	r2, [r5, #1880]
	str	r1, [r5, #120]
	ldr	r1, [r7, #236]
	strb	r3, [r5, #113]
	str	r9, [r5, #132]
	str	r1, [r5, #116]
	str	r2, [r5, #128]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3692:
	cmp	r3, #0
	beq	.L3628
	b	.L3653
.L3644:
	ldr	ip, [r4, #3496]
	mov	r0, r3
	strb	r3, [r4, #2944]
	movw	r1, #5047
	ldr	r2, .L3697+8
	strb	r3, [ip, #4]
	bl	dprint_normal
	mov	r1, r8
	mov	r0, r6
	bl	ClearAll
	mvn	r0, #0
	b	.L3680
.L3694:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3633
.L3685:
	mov	r3, #0
	strb	r3, [r4, #2945]
	b	.L3653
.L3693:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3685
.L3633:
	ldr	r1, [r4, #3496]
	cmp	r1, #0
	bne	.L3656
	b	.L3653
.L3630:
	strb	r1, [r4, #2945]
	b	.L3653
.L3698:
	.align	2
.L3697:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC380
	.word	.LC381
	UNWIND(.fnend)
	.size	AllocFrameStore, .-AllocFrameStore
	.global	__aeabi_idivmod
	.align	2
	.global	DecGap
	.type	DecGap, %function
DecGap:
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
	add	r10, r0, #24576
	mov	r7, r0
	add	r2, r0, #12288
	ldr	r0, [r10, #1804]
	add	r1, r7, #20480
	movw	r3, #2004
	str	r1, [fp, #-76]
	mov	ip, r1
	ldrb	r1, [r2, #1325]	@ zero_extendqisi2
	mul	r3, r3, r0
	cmp	r1, #1
	mov	r6, #0
	mov	r1, ip
	moveq	r1, #2
	movne	r1, r6
	str	r1, [fp, #-68]
	add	r1, r7, r3
	add	r1, r1, #22272
	ldr	r0, [ip, #224]
	add	r9, r7, #16384
	add	r4, r7, #53248
	mov	r3, r1
	add	r1, r1, #96
	str	r2, [fp, #-72]
	add	r3, r3, #100
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	ldr	r2, [r2, #3504]
	str	r0, [fp, #-60]
	str	r1, [fp, #-92]
	ldr	r0, [ip, #220]
	ldr	r1, [r9, #3472]
	ldr	ip, [r9, #3468]
	str	r3, [r4, #3500]
	ldr	r5, [r10, #2140]
	str	ip, [fp, #-84]
	cmp	r5, r6
	str	r1, [fp, #-88]
	str	r6, [fp, #-52]
	str	r6, [fp, #-48]
	beq	.L3715
	add	r2, r2, #4
	mov	r8, #1
	mov	r3, r8, asl r2
	add	r0, r0, r8
	str	r3, [fp, #-80]
	mov	r1, r3
	bl	__aeabi_uidivmod
	str	r6, [r9, #3472]
	str	r6, [r9, #3468]
	mov	r0, #3
	ldr	r2, .L3718
	mov	r5, r1
	movw	r1, #5117
	bl	dprint_normal
	ldr	r3, [fp, #-60]
	ldr	r2, .L3718+4
	movw	r1, #5118
	str	r5, [sp]
	mov	r0, #3
	bl	dprint_normal
	sub	r2, fp, #52
	sub	r1, fp, #48
	mov	r0, r7
	bl	GetMaxPOC
	ldr	r3, [fp, #-60]
	cmp	r3, r5
	strne	r6, [fp, #-64]
	movne	r6, r8
	bne	.L3708
	b	.L3707
.L3705:
	mov	r1, r8
	mov	r0, r7
	strb	r8, [r4, #2948]
	bl	StorePicInDPB
	ldr	r1, [fp, #-80]
	subs	ip, r0, #0
	add	r0, r5, #1
	bne	.L3716
	ldr	r3, [fp, #-76]
	str	r5, [r3, #220]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-60]
	cmp	r3, r1
	mov	r5, r1
	beq	.L3707
	ldr	r3, [r10, #2140]
	ldr	r2, [fp, #-64]
	cmp	r2, r3
	bhi	.L3707
.L3708:
	mov	r1, #1
	mov	r0, r7
	bl	AllocFrameStore
	mov	r8, #0
	ldr	r2, .L3718+8
	movw	r1, #5136
	subs	r3, r0, #0
	mov	r0, #3
	bne	.L3717
	str	r3, [fp, #-56]
	bl	dprint_normal
	ldr	r2, [r4, #3496]
	strb	r6, [r4, #2950]
	ldr	r3, [fp, #-68]
	str	r5, [r2, #548]
	ldr	r2, [r4, #3496]
	str	r5, [r4, #3504]
	str	r5, [r2, #600]
	str	r3, [r4, #3512]
	ldr	r2, [r4, #3496]
	ldr	r3, [fp, #-56]
	str	r3, [r2, #596]
	ldr	r2, [r4, #3496]
	str	r6, [r2, #564]
	ldr	r2, [r4, #3496]
	strb	r3, [r2, #4]
	ldr	r2, [r4, #3496]
	strb	r6, [r2]
	ldr	r2, [r4, #3500]
	strb	r6, [r4, #2946]
	strb	r3, [r2, #3]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #3508]
	cmp	r3, #0
	beq	.L3705
	str	r5, [r9, #3484]
	mov	r0, r7
	bl	DecPOC
	ldr	r3, [r9, #3464]
	ldr	r2, [fp, #-48]
	str	r3, [r4, #3516]
	ldr	r3, [r9, #3460]
	str	r3, [r4, #3520]
	ldr	r3, [r9, #3452]
	cmp	r3, r2
	str	r3, [r4, #3524]
	ldr	r3, [r9, #3456]
	str	r3, [r4, #3528]
	bls	.L3705
	cmp	r2, r3
	ldrcc	r3, [fp, #-64]
	addcc	r3, r3, #1
	strcc	r3, [fp, #-64]
	b	.L3705
.L3715:
	ldr	r2, .L3718+12
	movw	r1, #5110
	mov	r0, r5
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3707:
	ldr	r3, [fp, #-84]
	mov	r0, #0
	ldrb	r2, [fp, #-92]	@ zero_extendqisi2
	str	r3, [r9, #3468]
	ldr	r3, [fp, #-88]
	str	r3, [r9, #3472]
	ldr	r3, [r4, #3500]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3717:
	ldr	r3, [fp, #-84]
	movw	r1, #5132
	ldrb	ip, [fp, #-92]	@ zero_extendqisi2
	mov	r0, r8
	ldr	r2, .L3718+16
	str	r3, [r9, #3468]
	ldr	r3, [fp, #-88]
	str	r3, [r9, #3472]
	ldr	r3, [r4, #3500]
	strb	ip, [r3, #3]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3716:
	ldr	r3, [fp, #-84]
	mov	r0, r8
	ldr	r2, [fp, #-88]
	str	r3, [r9, #3468]
	movw	r3, #5177
	str	r2, [r9, #3472]
	mov	r1, r3
	ldr	lr, [r4, #3500]
	ldrb	r4, [fp, #-92]	@ zero_extendqisi2
	ldr	r2, .L3718+20
	strb	r4, [lr, #3]
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3719:
	.align	2
.L3718:
	.word	.LC383
	.word	.LC384
	.word	.LC386
	.word	.LC382
	.word	.LC385
	.word	.LC387
	UNWIND(.fnend)
	.size	DecGap, .-DecGap
	.align	2
	.global	H264DEC_Init
	.type	H264DEC_Init, %function
H264DEC_Init:
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
	ldr	r10, .L3730
	ldr	r4, [r0, #352]
	mov	r5, r0
	mov	r7, r1
	movw	r2, #59280
	mov	r1, #0
	ldr	r3, [r10, #48]
	mov	r9, r1
	blx	r3
	str	r4, [r5, #352]
	add	r0, r5, #8
	bl	ResetVoQueue
	str	r7, [r5]
	str	r9, [r5, #360]
	add	r6, r5, #12288
	str	r9, [r5, #364]
	add	r4, r5, #57344
	ldr	r3, [r7, #676]
	str	r3, [r6, #1288]
	ldr	r3, [r7, #680]
	str	r3, [r6, #1292]
	ldr	r3, [r7, #668]
	str	r3, [r6, #1284]
	ldr	r0, [r7, #560]
	bl	MEM_Phy2Vir
	ldr	ip, [r6, #1288]
	ldr	r3, [r5]
	mov	r2, #4000
	ldr	lr, [r6, #1292]
	mul	r2, r2, ip
	ldr	r3, [r3, #556]
	add	r3, r0, r3
	mov	r0, #2208
	add	r1, r3, r2
	str	r3, [r6, #1300]
	cmp	r3, r9
	cmpne	r1, r9
	str	r1, [r6, #1304]
	mla	r0, r0, lr, r1
	moveq	r8, #1
	movne	r8, #0
	cmp	r0, r9
	orreq	r8, r8, #1
	cmp	r8, r9
	str	r0, [r4, #1760]
	bne	.L3728
	ldr	r9, [r7, #596]
	adds	r7, r3, #0
	movne	r7, #1
	cmp	r9, #0
	movne	r7, #0
	cmp	r1, #0
	moveq	r1, #0
	andne	r1, r7, #1
	cmp	r1, #0
	beq	.L3723
	mov	r0, r3
	mov	r1, r8
	ldr	r3, [r10, #48]
	blx	r3
	ldr	r2, [r6, #1292]
	mov	ip, #2208
	mov	r1, r8
	ldr	r3, [r10, #48]
	mul	r2, ip, r2
	ldr	r0, [r6, #1304]
	blx	r3
	ldr	lr, [r6, #1292]
	ldr	ip, [r6, #1288]
	ldr	r0, [r4, #1760]
.L3723:
	add	r1, r5, #16384
	movw	r7, #4060
	ldr	r3, [r10, #48]
	str	lr, [r1, #1236]
	mov	r1, #0
	ldr	r2, [r6, #1284]
	str	ip, [r6, #1344]
	mov	r6, r1
	mul	r2, r7, r2
	blx	r3
	mov	r2, #40
	mov	r3, #17
	str	r6, [r4, #1784]
	str	r6, [r4, #1788]
	mov	r0, r5
	str	r6, [r4, #1792]
	str	r6, [r4, #1796]
	str	r6, [r4, #1800]
	str	r6, [r4, #1804]
	str	r6, [r4, #1808]
	str	r6, [r4, #1812]
	str	r6, [r4, #1776]
	str	r6, [r4, #800]
	str	r6, [r4, #804]
	str	r6, [r4, #808]
	str	r6, [r4, #812]
	str	r6, [r4, #816]
	str	r6, [r4, #780]
	str	r6, [r4, #788]
	str	r6, [r4, #1872]
	str	r6, [r4, #792]
	str	r6, [r4, #796]
	str	r2, [r4, #772]
	str	r3, [r4, #776]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #1840]
	beq	.L3729
	mov	r1, r6
	mov	r0, r5
	bl	ClearAll
	str	r6, [r4, #1868]
	ldr	r3, [r5]
	mov	r0, #1
	ldr	r3, [r3, #612]
	str	r3, [r4, #1844]
.L3722:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3728:
	movw	r1, #10704
	mov	r0, r9
	str	r1, [sp]
	ldr	r3, .L3730+4
	ldr	r2, .L3730+8
	bl	dprint_normal
	mvn	r0, #19
	b	.L3722
.L3729:
	mov	r0, r6
	ldr	r2, .L3730+12
	movw	r1, #10748
	bl	dprint_normal
	mvn	r0, #19
	b	.L3722
.L3731:
	.align	2
.L3730:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+380
	.word	.LC388
	.word	.LC389
	UNWIND(.fnend)
	.size	H264DEC_Init, .-H264DEC_Init
	.align	2
	.global	InitPic
	.type	InitPic, %function
InitPic:
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
	add	r3, r0, #20480
	mov	r7, #2208
	add	r2, r0, #12288
	ldr	r1, [r3, #216]
	mov	r5, r0
	str	r3, [fp, #-56]
	mov	r0, #4000
	ldr	r3, [r2, #1304]
	add	r6, r5, #57344
	mul	r7, r7, r1
	str	r2, [fp, #-60]
	ldr	r2, [r2, #1300]
	ldr	r10, [r6, #1852]
	add	r9, r3, r7
	cmp	r10, #1
	ldr	r1, [r9, #28]
	mla	r2, r0, r1, r2
	str	r2, [fp, #-64]
	beq	.L3860
	add	r4, r5, #53248
	ldrb	r3, [r4, #2944]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3736
	ldr	r3, [r4, #3496]
	cmp	r3, #0
	beq	.L3737
	ldrb	r7, [r3, #1]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L3861
.L3738:
	mov	r3, #0
	strb	r3, [r4, #2944]
.L3736:
	sub	r1, fp, #48
	mov	r0, r5
	bl	GetReRangeFlag
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #1344]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #36]
	cmp	r2, r3
	mov	r7, r0
	beq	.L3862
.L3739:
	ldr	r3, .L3877
	add	r0, r5, #13568
	ldr	r1, [fp, #-64]
	mov	r2, #0
	add	r0, r0, #28
	strb	r2, [r1, #24]
	mov	r2, #4000
	ldr	r3, [r3, #56]
	blx	r3
.L3740:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L3741
	ldr	r3, [r5]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L3741
.L3854:
	add	r7, r5, #16384
.L3742:
	ldr	r2, [r7, #1236]
	ldr	r3, [r9, #24]
	cmp	r2, r3
	bne	.L3750
	ldrb	r3, [r9, #20]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3750
.L3751:
	ldr	r3, [r7, #3444]
	ldr	r2, [fp, #-60]
	cmp	r3, #0
	ldrne	r1, [fp, #-56]
	movne	r3, #0
	ldr	r2, [r2, #3504]
	strne	r3, [r1, #220]
	strne	r3, [r6, #120]
	ldr	r3, [r6, #1768]
	cmp	r3, #2
	beq	.L3753
	ldr	r10, [r5]
	ldr	r3, [r10, #12]
	sub	r3, r3, #2
	cmp	r3, #1
	bls	.L3753
	ldr	r1, [fp, #-56]
	ldr	r3, [r1, #224]
	ldr	r9, [r1, #220]
	cmp	r3, r9
	str	r3, [fp, #-68]
	beq	.L3754
	mov	r1, #1
	add	r2, r2, #4
	mov	r2, r1, asl r2
	add	r0, r9, r1
	str	r2, [fp, #-72]
	mov	r1, r2
	bl	__aeabi_uidivmod
	ldr	r3, [fp, #-68]
	cmp	r3, r1
	beq	.L3798
	ldr	r1, [r10, #588]
	cmp	r1, #0
	bne	.L3755
	ldr	r1, [r10, #632]
	ldr	r2, [fp, #-72]
	cmp	r1, #1
	beq	.L3863
.L3756:
	cmp	r3, r9
	bhi	.L3864
	rsb	r1, r9, r3
	ldr	r0, [r7, #484]
	add	r1, r1, r2
	cmp	r0, r1
	bcs	.L3755
	ldr	r1, [fp, #-56]
	ldrb	r1, [r1, #208]	@ zero_extendqisi2
	cmp	r1, #2
	beq	.L3765
.L3770:
	ldr	r3, [r6, #1836]
	cmp	r3, #0
	bne	.L3755
	mov	r0, r5
	bl	H264_ClearCurrPic
	ldr	r3, .L3877+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3865
.L3771:
	ldr	lr, [r7, #484]
	movw	r3, #5403
.L3856:
	ldr	r0, [fp, #-56]
	mov	r1, r3
	ldr	r2, [r0, #224]
	ldr	ip, [r0, #220]
	mov	r0, #0
	str	lr, [sp, #4]
	rsb	ip, ip, r2
	ldr	r2, .L3877+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3741:
	ldr	r3, [r6, #1800]
	cmp	r7, #0
	add	r3, r3, #1
	str	r3, [r6, #1800]
	bne	.L3743
	ldr	r3, [r5]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L3744
	mov	r0, r5
	bl	FlushDPB
	cmp	r0, #0
	bne	.L3866
.L3853:
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	bne	.L3791
	ldr	r3, [r5]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	bne	.L3854
.L3748:
	add	r7, r5, #16384
	ldr	r3, [fp, #-60]
	mov	r0, r5
	ldr	r2, [r7, #464]
	ldrb	r10, [r3, #1326]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	r3, [r7, #460]
	rsb	r10, r10, #2
	mov	r2, r2, asl #4
	add	r3, r3, #1
	mul	r10, r10, r2
	mov	r3, r3, asl #4
	str	r3, [fp, #-68]
	mov	r1, r3
	mov	r2, r10
	bl	H264_ArrangeVahbMem
	ldr	r3, [fp, #-68]
	cmp	r0, #1
	beq	.L3867
	ldr	r3, [r5]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L3848
	ldr	r3, [fp, #-60]
	mov	r4, #0
	ldr	r2, .L3877+12
	movw	r1, #5298
	mov	r0, r4
	str	r4, [r3, #1276]
	str	r4, [r3, #1280]
	bl	dprint_normal
	mov	r1, r4
	mov	r0, r5
	bl	ClearAll
	mvn	r0, #0
	b	.L3848
.L3862:
	ldr	r3, [fp, #-64]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3740
	b	.L3739
.L3750:
	ldr	r3, .L3877
	add	r0, r5, #17408
	mov	r2, #0
	mov	r1, r9
	strb	r2, [r9, #20]
	add	r0, r0, #188
	ldr	r3, [r3, #56]
	mov	r2, #2208
	blx	r3
	b	.L3751
.L3798:
	mov	r9, r3
.L3754:
	ldr	r3, [fp, #-56]
	mov	r0, r5
	ldr	r3, [r3, #236]
	cmp	r3, #0
	ldrne	r3, [fp, #-56]
	strne	r9, [r3, #220]
	str	r9, [r7, #3484]
	bl	DecPOC
	mov	r1, #0
	mov	r0, r5
	bl	AllocFrameStore
	cmp	r0, #0
	bne	.L3868
	ldr	r9, [fp, #-56]
	mov	r1, #1
	strb	r0, [r4, #2951]
	mvn	ip, #0
	strb	r1, [r4, #2944]
	ldrb	r3, [r9, #211]	@ zero_extendqisi2
	strb	r3, [r4, #2950]
	ldr	r2, [r9, #224]
	str	r2, [r4, #3504]
	ldr	r3, [r9, #236]
	str	r2, [fp, #-68]
	str	r3, [r4, #3512]
	ldr	lr, [r7, #3464]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-60]
	str	lr, [r4, #3516]
	ldr	lr, [r7, #3460]
	str	lr, [r4, #3520]
	ldr	lr, [r7, #3452]
	str	lr, [r4, #3524]
	ldr	lr, [r7, #3456]
	strb	r0, [r4, #2946]
	strb	r0, [r4, #2949]
	strb	r0, [r4, #2948]
	str	ip, [r4, #3560]
	str	lr, [r4, #3528]
	ldrb	r10, [r9, #209]	@ zero_extendqisi2
	cmp	r10, #0
	movne	r0, r9
	movne	r10, r1
	strneb	r1, [r0, #209]
	movne	r1, #2
	ldrb	r9, [r3, #1326]	@ zero_extendqisi2
	ldr	r0, [r7, #464]
	rsb	r9, r9, #2
	mla	r9, r0, r9, r9
	mov	r0, r9
	bl	__aeabi_uidiv
	str	r9, [r4, #3552]
	cmp	r10, #0
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-72]
	movne	r10, #0
	str	r0, [r4, #3548]
	ldr	ip, [r7, #460]
	add	r1, ip, #1
	str	r1, [r4, #3544]
	mul	r1, r1, r0
	str	r1, [r4, #3556]
	ldrb	r1, [r7, #1212]	@ zero_extendqisi2
	strb	r1, [r4, #2952]
	movne	r1, r10
	bne	.L3776
	ldr	r1, [fp, #-60]
	ldrb	r1, [r1, #1327]	@ zero_extendqisi2
	cmp	r1, #0
	movne	r10, #1
	movne	r1, r10
.L3776:
	cmp	r3, #0
	strb	r1, [r4, #2953]
	str	r10, [r6, #1752]
	movw	r1, #2004
	ldrne	r3, [fp, #-56]
	movw	ip, #56416
	movw	lr, #56432
	mov	r0, #24
	strne	r2, [r3, #220]
	add	r3, r5, #24576
	str	r3, [fp, #-68]
	add	r2, r5, #56320
	ldr	r3, [r3, #1804]
	add	r10, r2, #112
	ldr	r2, .L3877+16
	mla	r3, r1, r3, r5
	movw	r1, #5482
	add	r3, r3, #22272
	add	r3, r3, #100
	str	r3, [r4, #3500]
	ldr	r3, [r5]
	ldrd	r8, [r3, #32]
	strd	r8, [r5, ip]
	ldrd	r8, [r3, #48]
	strd	r8, [r10, #-8]
	ldrd	r8, [r3, #64]
	strd	r8, [r5, lr]
	mvn	r9, #0
	ldr	lr, [r3, #80]
	ldr	r8, [fp, #-64]
	str	lr, [r4, #2960]
	ldr	lr, [r3, #84]
	str	lr, [r4, #2964]
	ldr	lr, [r3, #88]
	str	lr, [r4, #2968]
	ldr	lr, [r3, #104]
	str	lr, [r4, #2972]
	ldrb	lr, [r3, #28]	@ zero_extendqisi2
	strb	lr, [r4, #3484]
	ldr	lr, [r8, #44]
	str	lr, [r4, #3352]
	ldr	lr, [r8, #48]
	mvn	r8, #0
	str	lr, [r4, #3356]
	strd	r8, [r3, #32]
	ldrd	r8, [r5, ip]
	ldr	r3, [r6, #1840]
	strd	r8, [sp]
	bl	dprint_normal
	ldrd	r2, [r10, #-8]
	movw	r1, #5483
	mov	r0, #24
	mov	r8, r2
	mov	r9, r3
	ldr	r2, .L3877+20
	ldr	r3, [r6, #1840]
	strd	r8, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #-60]
	ldr	r1, [r7, #528]
	ldr	r0, [r3, #1348]
	and	r1, r1, #7
	ldr	r3, [r3, #3508]
	subs	r0, r0, #1
	movne	r0, #1
	cmp	r3, #1
	beq	.L3803
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #256]
	cmp	r3, #0
	beq	.L3869
.L3803:
	mov	r2, #0
.L3778:
	ldr	r3, [fp, #-60]
	ldrb	r3, [r3, #1326]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3793
	adds	r2, r2, #0
	movne	r2, #1
.L3779:
	ldrb	ip, [r4, #3116]	@ zero_extendqisi2
	mov	lr, #2
	ldrb	r3, [r4, #3117]	@ zero_extendqisi2
	and	ip, ip, #252
	bfi	ip, r0, #2, #3
	bfi	r3, r2, #0, #2
	strb	ip, [r4, #3116]
	and	r3, r3, #243
	ldr	r0, [r7, #532]
	uxtb	r2, ip
	bfi	r3, lr, #4, #2
	strb	r3, [r4, #3117]
	bfi	r2, r0, #5, #3
	strb	r2, [r4, #3116]
	ldr	r3, [r4, #3116]
	add	r0, r5, #56064
	add	r0, r0, #144
	bfi	r3, r1, #14, #3
	str	r3, [r4, #3116]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, lr
	ldreq	r2, [r6, #1924]
	ldreq	r3, [r6, #1928]
	ldrne	r2, [r6, #1916]
	ldrne	r3, [r6, #1920]
	streq	r2, [r6, #1916]
	streq	r3, [r6, #1920]
	str	r2, [r4, #3488]
	str	r3, [r4, #3492]
	mov	r3, #0
	str	r3, [r6, #1924]
	str	r3, [r6, #1928]
	bl	SetAspectRatio
	ldrb	r3, [r4, #2947]	@ zero_extendqisi2
	ldr	r2, [r4, #3496]
	adds	r3, r3, #0
	ldr	r1, [r6, #1800]
	movne	r3, #1
	cmp	r2, #0
	str	r3, [r4, #2980]
	str	r1, [r4, #3060]
	beq	.L3870
	ldr	r3, [r4, #3116]
	ldr	r1, [fp, #-64]
	str	r3, [r2, #164]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #2980]
	str	r2, [r3, #28]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #3020]
	str	r2, [r3, #68]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #3016]
	str	r2, [r3, #64]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #2992]
	str	r2, [r3, #40]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #2996]
	str	r2, [r3, #44]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #3000]
	str	r2, [r3, #48]
	ldr	r3, [r4, #3496]
	ldr	r2, [r4, #3004]
	str	r2, [r3, #52]
	ldr	r3, [r1, #3284]
	ldr	r2, [r4, #3496]
	str	r3, [r2, #56]
	str	r3, [r4, #3008]
	ldr	r2, [r4, #3496]
	ldr	r3, [r1, #3288]
	str	r3, [r2, #60]
	str	r3, [r4, #3012]
	ldr	r2, [r4, #2980]
	ldr	r3, [r4, #3496]
	adds	r2, r2, #0
	ldr	r0, [r6, #1840]
	movne	r2, #1
	ldr	r1, [r3, #544]
	bl	FSP_SetStoreType
	cmp	r0, #0
	bne	.L3871
.L3783:
	add	r2, r5, #56320
	add	lr, r5, #58112
	ldr	r8, [r6, #800]
	add	lr, lr, #36
	mov	r0, r2
	add	r2, r2, #48
	add	r0, r0, #80
	mov	r7, #0
.L3787:
	ldr	r3, [r2, #8]!
	cmp	r3, #0
	beq	.L3872
.L3784:
	cmp	r2, r0
	bne	.L3787
	cmp	r8, #0
	beq	.L3789
	ble	.L3789
	add	r7, r8, #14528
	mov	r9, #0
	add	r7, r7, #9
	add	r7, r5, r7, lsl #2
.L3790:
	ldr	r1, [r7, #-4]!
	sub	r8, r8, #1
	ldr	r0, [r6, #1840]
	bl	FreeUsdByDec
	cmp	r8, #0
	str	r9, [r7]
	bne	.L3790
.L3789:
	mov	r0, r5
	mov	r5, #0
	str	r5, [r6, #800]
	str	r5, [r4, #3532]
	bl	CalcPicNum
	mov	r0, r5
.L3848:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3758:
	cmp	r3, #0
	mov	r0, r5
	subeq	r3, r2, #1
	ldr	r2, [fp, #-56]
	subne	r3, r3, #1
	str	r3, [r2, #220]
	bl	FlushDPB
	cmp	r0, #0
	movwne	r3, #5356
	bne	.L3855
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3763
.L3755:
	mov	r0, r5
	bl	DecGap
	cmp	r0, #0
	bne	.L3873
.L3753:
	ldr	r3, [fp, #-56]
	ldr	r9, [r3, #224]
	b	.L3754
.L3872:
	cmp	r8, #0
	beq	.L3784
	ldr	r1, [r6, #804]
	subs	r8, r8, #1
	stmia	r2, {r1, r3}
	beq	.L3785
	mov	r1, lr
.L3786:
	add	r3, r3, #1
	ldr	ip, [r1, #4]!
	cmp	r3, r8
	str	ip, [r1, #-4]
	bne	.L3786
.L3785:
	add	r3, r8, #14528
	add	r3, r3, #8
	add	r3, r5, r3, lsl #2
	str	r7, [r3, #4]
	str	r8, [r6, #800]
	b	.L3784
.L3860:
	str	r3, [fp, #-60]
	mov	r8, r2
	ldr	r3, [fp, #-56]
	add	r4, r5, #53248
	ldrb	r0, [r2, #18]	@ zero_extendqisi2
	ldr	r2, [r2, #3252]
	ldrb	r5, [r3, #209]	@ zero_extendqisi2
	rsb	r0, r0, #2
	add	r1, r5, #1
	mla	r0, r2, r0, r0
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-60]
	cmp	r5, #0
	str	r0, [r4, #3548]
	ldrb	ip, [r8, #18]	@ zero_extendqisi2
	ldr	r2, [r8, #3252]
	rsb	r1, ip, #2
	mla	r1, r2, r1, r1
	str	r1, [r4, #3552]
	ldr	r1, [r8, #3248]
	add	r2, r1, #1
	str	r2, [r4, #3544]
	mul	r2, r2, r0
	str	r2, [r4, #3556]
	ldrb	r3, [r3, r7]	@ zero_extendqisi2
	strb	r3, [r4, #2952]
	beq	.L3874
	mov	r10, #0
.L3851:
	mov	r3, r10
.L3734:
	strb	r3, [r4, #2953]
	mov	r0, #0
	str	r10, [r6, #1752]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3869:
	ldr	r3, [fp, #-56]
	ldrb	r2, [r3, #209]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3778
	ldr	r3, [fp, #-60]
	ldrb	r3, [r3, #1327]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r2, #1
	bne	.L3779
.L3793:
	ldr	r3, [fp, #-68]
	ldrb	r2, [r3, #1844]	@ zero_extendqisi2
	sub	r2, r2, #3
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	b	.L3779
.L3744:
	ldr	r2, .L3877+24
	movw	r1, #5265
	mov	r0, #20
	bl	dprint_normal
	b	.L3853
.L3874:
	ldr	r3, [fp, #-64]
	ldrb	r3, [r3, #19]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r10, r3
	beq	.L3734
	b	.L3851
.L3871:
	ldr	r3, .L3877+28
	movw	r1, #5571
	ldr	r2, .L3877+32
	mov	r0, #1
	bl	dprint_normal
	b	.L3783
.L3743:
	ldr	r2, .L3877+24
	movw	r1, #5265
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	beq	.L3748
.L3791:
	movw	r3, #5282
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3877+36
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3861:
	ldr	r1, [r3, #544]
	ldr	r0, [r6, #1840]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #3496]
	strb	r7, [r3, #1]
	ldr	r3, [r4, #3496]
	strb	r7, [r3, #4]
	b	.L3738
.L3867:
	ldr	r2, [fp, #-60]
	mov	r3, r3, lsr #4
	mov	r10, r10, lsr #4
	str	r3, [r2, #1276]
	str	r10, [r2, #1280]
	b	.L3742
.L3864:
	ldr	r1, [r7, #484]
	rsb	r9, r9, r3
	cmp	r1, r9
	bcs	.L3755
	ldr	r1, [fp, #-56]
	ldrb	r1, [r1, #208]	@ zero_extendqisi2
	cmp	r1, #2
	beq	.L3758
.L3763:
	ldr	r3, [r6, #1836]
	cmp	r3, #0
	bne	.L3755
	mov	r0, r5
	bl	H264_ClearCurrPic
	ldr	r3, .L3877+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3875
.L3764:
	ldr	lr, [r7, #484]
	movw	r3, #5371
	b	.L3856
.L3873:
	movw	r3, #5414
	ldr	r2, .L3877+40
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3737:
	movw	r1, #5243
	ldr	r3, .L3877+44
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L3877+48
	bl	dprint_normal
	b	.L3738
.L3863:
	ldr	r1, [r10, #628]
	cmp	r1, #0
	bne	.L3756
	ldr	r1, [r10, #636]
	cmp	r1, #0
	bne	.L3756
	ldr	r1, [r10, #592]
	add	r1, r1, #1024
	cmp	r1, #2048
	bhi	.L3755
	b	.L3756
.L3868:
	movw	r3, #5432
	ldr	r2, .L3877+52
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3765:
	cmp	r3, #0
	mov	r0, r5
	subeq	r3, r2, #1
	ldr	r2, [fp, #-56]
	subne	r3, r3, #1
	str	r3, [r2, #220]
	bl	FlushDPB
	cmp	r0, #0
	bne	.L3876
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3755
	b	.L3770
.L3870:
	movw	r1, #5550
	ldr	r3, .L3877+28
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L3877+56
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3866:
	movw	r3, #5273
	str	r0, [sp]
	mov	r1, r3
	mov	r0, r7
	ldr	r2, .L3877+60
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3865:
	mov	r0, r5
	bl	ClearDPB
	b	.L3771
.L3876:
	movw	r3, #5388
.L3855:
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3877+60
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3848
.L3875:
	mov	r0, r5
	bl	ClearDPB
	b	.L3764
.L3878:
	.align	2
.L3877:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_AppleAirplayMirrorinigFlag
	.word	.LC393
	.word	.LC392
	.word	.LC396
	.word	.LC397
	.word	.LC400
	.word	.LANCHOR0+404
	.word	.LC399
	.word	.LC391
	.word	.LC394
	.word	.LANCHOR0+396
	.word	.LC390
	.word	.LC395
	.word	.LC398
	.word	.LC350
	UNWIND(.fnend)
	.size	InitPic, .-InitPic
	.align	2
	.global	H264_DecSlice
	.type	H264_DecSlice, %function
H264_DecSlice:
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
	add	r5, r0, #57344
	mov	r4, r0
	ldr	r2, .L3943
	ldr	r3, [r5, #1784]
	movw	r1, #7427
	mov	r0, #20
	add	r6, r4, #20480
	sub	r3, r3, #1
	bl	dprint_normal
	ldr	r3, [r4, #368]
	ldr	r1, .L3943+4
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r6, #211]
	ldr	r3, [r3, #20]
	str	r3, [r6, #236]
	ldr	r3, [r5, #1840]
	ldr	r3, [r1, r3, asl #2]
	add	r3, r3, #204800
	ldrb	r1, [r3, #2456]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L3935
.L3880:
	mov	r0, r4
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L3936
	mov	r0, r4
	bl	ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L3885
	ldr	r10, [r5, #1764]
	cmp	r10, #0
	moveq	r3, r10
	beq	.L3887
	add	r8, r4, #57344
	mov	r3, r0
	add	r8, r8, #156
	mov	r2, r0
	mov	r7, r0
	b	.L3895
.L3937:
	cmp	lr, r2
	add	r3, r1, r3
	rsbhi	r0, r0, r9
	rsbhi	r2, r2, lr
	addhi	r0, r2, r0
	movls	r0, r9
	add	r3, r3, r0
.L3893:
	cmp	ip, #0
	add	r7, r7, #1
	moveq	r2, lr
	moveq	r0, r9
	movne	r2, ip
	movne	r0, r1
	cmp	r7, r10
	beq	.L3887
.L3895:
	ldr	r1, [r8, #4]!
	ldr	lr, [r1, #40]
	ldr	ip, [r1, #68]
	cmp	lr, #0
	ldrne	r9, [r1, #44]
	moveq	r9, lr
	cmp	ip, #0
	ldrne	r1, [r1, #72]
	moveq	r1, ip
	cmp	r2, #0
	bne	.L3937
	add	r3, r9, r3
	add	r3, r3, r1
	b	.L3893
.L3887:
	add	r8, r4, #53248
	str	r3, [r5, #1824]
	movw	r1, #1620
	ldr	r0, [r8, #3548]
	ldr	r2, [r8, #3544]
	mul	r2, r2, r0
	cmp	r2, r1
	movgt	r2, r2, asl #8
	ble	.L3938
.L3897:
	add	r7, r4, #12288
	ldr	r1, [r7, #1284]
	cmp	r1, r10
	bls	.L3898
	cmp	r2, r3
	bcc	.L3939
	ldrb	r3, [r6, #213]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3901
	ldrb	r3, [r6, #211]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [r5, #1820]
	mov	r0, r4
	cmp	r3, #5
	ldr	r3, [r5, #1804]
	streq	r3, [r5, #1816]
	add	r3, r3, #1
	str	r3, [r5, #1804]
	ldrb	r3, [r8, #2947]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r5, #1808]
	ldrne	r3, [r5, #1812]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r5, #1808]
	strne	r3, [r5, #1812]
	bl	InitPic
	cmn	r0, #2
	beq	.L3927
	cmp	r0, #0
	bne	.L3940
	mov	r0, r4
	bl	WritePicMsg
.L3901:
	mov	r0, r4
	bl	PicTypeStatistic
	ldr	r3, [r5, #1852]
	cmp	r3, #0
	bne	.L3907
	mov	r0, r4
	bl	DecList
	cmp	r0, #0
	bne	.L3941
	mov	r0, r4
	bl	IsRefListWrong
	cmp	r0, #0
	bne	.L3942
	mov	r0, r4
	bl	ExitSlice
.L3907:
	mov	r0, r4
	bl	CalcStreamBits
	mov	r0, r4
	bl	WriteSliceMsg
	ldr	r3, [r5, #1820]
	mov	r0, #0
	mov	r2, #1
	add	r3, r3, r2
	str	r2, [r5, #780]
	str	r3, [r5, #1820]
.L3927:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3938:
	mov	r1, r2, asl #9
	sub	r2, r1, r2, asl #7
	cmp	r2, #16384
	movlt	r2, #16384
	b	.L3897
.L3935:
	ldr	r1, [r3, #2572]
	cmp	r1, #1
	bne	.L3880
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	cmpeq	r2, #5
	bne	.L3880
	ldr	r3, [r4]
	mvn	r1, #0
	mvn	r0, #0
	ldrd	r2, [r3, #32]
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L3880
	movw	r1, #26464
	add	ip, r4, #26368
	ldrd	r0, [r1, r4]
	movw	lr, #26496
	strd	r2, [r4, lr]
	strd	r0, [ip, #136]
	b	.L3880
.L3936:
	ldr	r2, .L3943+8
	movw	r1, #7448
.L3932:
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3943+12
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3930
	sub	r2, fp, #44
	mvn	r1, #0
	ldr	r0, [r5, #1840]
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #9
	blx	r6
.L3930:
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L3927
.L3898:
	str	r1, [sp]
	mov	r3, r10
	ldr	r2, .L3943+16
	movw	r1, #7506
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3943+12
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3911
	ldr	lr, [r7, #1284]
	mov	r3, #8
	ldr	ip, [r5, #1764]
	sub	r2, fp, #52
	ldr	r0, [r5, #1840]
	mov	r1, #27
	str	lr, [fp, #-48]
	str	ip, [fp, #-52]
	blx	r6
.L3911:
	mov	r0, r4
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3927
.L3939:
	str	r2, [sp]
	movw	r1, #7511
	ldr	r2, .L3943+20
	mov	r0, #1
	bl	dprint_normal
	b	.L3911
.L3940:
	ldr	r2, .L3943+24
	movw	r1, #7544
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3927
.L3885:
	ldr	r2, .L3943+8
	movw	r1, #7458
	b	.L3932
.L3941:
	mov	r3, r0
	ldr	r2, .L3943+28
	movw	r1, #7561
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3927
.L3942:
	ldr	r3, [r8, #3516]
	movw	r1, #7569
	ldr	r2, .L3943+32
	mov	r0, #1
	bl	dprint_normal
	b	.L3930
.L3944:
	.align	2
.L3943:
	.word	.LC340
	.word	s_pstVfmwChan
	.word	.LC341
	.word	g_EventReportFunc
	.word	.LC404
	.word	.LC405
	.word	.LC401
	.word	.LC402
	.word	.LC403
	UNWIND(.fnend)
	.size	H264_DecSlice, .-H264_DecSlice
	.align	2
	.global	H264_DecOneNal
	.type	H264_DecOneNal, %function
H264_DecOneNal:
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
	ldr	ip, [r0, #368]
	add	r4, r0, #57344
	mov	r6, r1
	mov	r5, r0
	ldr	r3, [ip, #12]
	cmp	r3, #0
	movne	r1, ip
	movne	r2, #0
	ldrne	r3, [r4, #1824]
	beq	.L3950
.L3949:
	ldr	r0, [r1, #44]
	add	r2, r2, #1
	add	r1, r1, #28
	add	r3, r3, r0
	str	r3, [r4, #1824]
	ldr	r0, [ip, #12]
	cmp	r0, r2
	bhi	.L3949
.L3950:
	mov	r2, #0
	ldr	r3, .L4102
	strb	r2, [ip]
	ldr	r2, [r4, #1840]
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4095
.L3948:
	add	r8, r5, #13504
	mov	r1, #32
	add	r8, r8, #24
	mov	r0, r8
	bl	BsGet
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #8]
	add	r3, r3, #32
	str	r3, [r2, #8]
	mov	r7, r0
.L3951:
	ldr	r0, [r5, #368]
	and	r1, r7, #31
	ubfx	r2, r7, #5, #2
	ubfx	r3, r7, #7, #1
	mov	ip, #0
	strb	r1, [r0, #2]
	movw	r1, #10013
	ldr	lr, [r5, #368]
	mov	r0, #20
	str	r2, [lr, #20]
	ldr	lr, [r5, #368]
	ldr	r2, .L4102+4
	str	r3, [lr, #24]
	str	ip, [r4, #1780]
	ldr	ip, [r5, #368]
	ldr	r3, [r4, #1784]
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r4, #1784]
	movw	r2, #371
	cmp	r3, r2
	beq	.L4096
.L3952:
	add	r3, r3, #1
	str	r3, [r4, #1784]
	ldr	r3, [r5, #368]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #20
	beq	.L4097
.L3953:
	sub	r2, r3, #1
	cmp	r2, #29
	ldrls	pc, [pc, r2, asl #2]
	b	.L3961
.L3963:
	.word	.L3962
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3962
	.word	.L3964
	.word	.L3965
	.word	.L3966
	.word	.L3967
	.word	.L3968
	.word	.L3969
	.word	.L3970
	.word	.L3971
	.word	.L3961
	.word	.L3965
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3972
	.word	.L3962
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3961
	.word	.L3973
.L4095:
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L3948
	ldr	r2, [r3, #2576]
	cmp	r2, #2
	bne	.L3948
	ldr	r3, [r3, #2568]
	cmp	r6, #0
	cmpeq	r3, #1
	bne	.L3948
	add	r8, r5, #13504
	mov	r1, #40
	add	r8, r8, #24
	mov	r0, r8
	bl	BsLongSkip
	mov	r0, r8
	mov	r1, #8
	bl	BsGet
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #8]
	add	r3, r3, #48
	str	r3, [r2, #8]
	mov	r7, r0
	b	.L3951
.L3962:
	ldr	ip, [r4, #1796]
	movw	r1, #10066
	ldr	r2, .L4102+8
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, [r5, #368]
	add	r3, r5, #20480
	mov	r0, r5
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	strb	r1, [r3, #211]
	ldr	r2, [r2, #20]
	str	r2, [r3, #236]
	bl	SliceCheck
	subs	r6, r0, #0
	bne	.L4098
	mov	r0, r5
	bl	H264_DecSlice
	cmn	r0, #2
	beq	.L3959
	cmp	r0, #0
	beq	.L4081
	ldr	r3, .L4102+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4080
	ldr	r0, [r4, #1840]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #42
	blx	r5
.L4080:
	mvn	r0, #0
	b	.L3959
.L3964:
	movw	r1, #10130
	mov	r3, #6
	ldr	r2, .L4102+16
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r5
	bl	H264_DecSEI
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L3981
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3981:
	cmp	r6, #0
	bne	.L4099
.L4081:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3965:
	ldr	ip, [r4, #1788]
	movw	r1, #10113
	ldr	r2, .L4102+20
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r5
	bl	H264_DecSPS
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L3979
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3979:
	cmp	r6, #0
	bne	.L4100
	ldr	r3, [r4, #1788]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r4, #1788]
	b	.L3959
.L3966:
	ldr	ip, [r4, #1792]
	movw	r1, #10096
	mov	r3, #8
	ldr	r2, .L4102+24
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r5
	bl	H264_DecPPS
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L3977
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3977:
	cmp	r6, #0
	bne	.L4101
	ldr	r3, [r4, #1792]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r4, #1792]
	b	.L3959
.L3967:
	ldr	r2, .L4102+28
	mov	r3, #9
	movw	r1, #10143
.L4088:
	mov	r0, #20
	bl	dprint_normal
.L4090:
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4081
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #368]
.L3959:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3968:
	mov	r3, #10
	ldr	r2, .L4102+32
	movw	r1, #10148
	b	.L4088
.L3969:
	mov	r3, #11
	ldr	r2, .L4102+36
	movw	r1, #10158
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r5
	bl	H264_IsEosNal
	cmp	r0, #1
	bne	.L4090
	ldr	r6, .L4102+12
	add	r3, r5, #12288
	strb	r0, [r3, #1272]
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3984
	mov	r3, #0
	mov	r1, #46
	mov	r2, r3
	ldr	r0, [r4, #1840]
	blx	r7
.L3984:
	mov	r7, #0
	mov	r0, r5
	str	r7, [r5, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L4090
	ldr	r1, [r5, #368]
	cmp	r1, r7
	beq	.L3985
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	str	r7, [r5, #368]
.L3985:
	ldr	r5, [r6]
	cmp	r5, #0
	bne	.L4084
	b	.L4080
.L3970:
	mov	r3, #12
	ldr	r2, .L4102+40
	movw	r1, #10153
	b	.L4088
.L3971:
	mov	r3, #13
	ldr	r2, .L4102+44
	movw	r1, #10179
	b	.L4088
.L3972:
	mov	r3, #19
	ldr	r2, .L4102+48
	movw	r1, #10184
	b	.L4088
.L3973:
	mov	r3, #30
	ldr	r2, .L4102+52
	movw	r1, #10189
	mov	r0, #20
	bl	dprint_normal
	mov	r1, #32
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	mov	r7, r0
	mov	r0, r8
	bl	BsGet
	cmp	r6, #0
	mov	r8, r0
	bne	.L3986
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L3986
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	str	r6, [r5, #368]
.L3986:
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r8, r2
	cmpeq	r7, r3
	bne	.L4081
	ldr	r6, .L4102+12
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3987
	mov	r3, #0
	mov	r1, #41
	mov	r2, r3
	ldr	r0, [r4, #1840]
	blx	r7
.L3987:
	mov	r7, #0
	mov	r0, r5
	str	r7, [r5, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L4081
	ldr	r5, [r6]
	cmp	r5, r7
	beq	.L4080
	ldr	r0, [r4, #1840]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #42
	blx	r5
	mvn	r0, #0
	b	.L3959
.L3961:
	movw	r1, #10215
	ldr	r2, .L4102+56
	str	r7, [sp]
	mov	r0, #20
	bl	dprint_normal
	ldr	r3, [r5, #368]
	mov	r0, #20
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	sub	r2, r3, #24
	cmp	r3, #0
	cmpne	r2, #7
	ldr	r2, .L4102+60
	movwls	r1, #10221
	movwhi	r1, #10226
	bl	dprint_normal
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L3990
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3990:
	ldr	r3, .L4102+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4081
.L4083:
	mov	r3, #0
	ldr	r0, [r4, #1840]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	b	.L4081
.L4096:
	ldr	r2, .L4102+64
	movw	r1, #10017
	mov	r0, #20
	bl	dprint_normal
	ldr	r3, [r4, #1784]
	b	.L3952
.L4097:
	mov	r1, #24
	mov	r0, r8
	bl	BsGet
	ldr	r3, [r5, #368]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #3]
	ldr	r1, [r5, #368]
	mov	r7, r0
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3954
	ldrb	r3, [r4, #152]	@ zero_extendqisi2
	ldrb	r2, [r4, #150]	@ zero_extendqisi2
.L3955:
	cmp	r3, #0
	bne	.L3956
	cmp	r2, #1
	beq	.L3957
.L3956:
	str	r2, [sp]
	movw	r1, #10045
	ldr	r2, .L4102+68
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4080
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r5, #368]
	b	.L3959
.L3954:
	ubfx	r2, r0, #22, #1
	ubfx	r3, r0, #16, #6
	ubfx	ip, r7, #4, #1
	strb	r2, [r4, #148]
	strb	r3, [r4, #149]
	ubfx	r2, r0, #15, #1
	ubfx	r3, r7, #8, #4
	ubfx	r0, r0, #12, #3
	strb	ip, [r4, #154]
	ubfx	ip, r7, #2, #1
	strb	r0, [r4, #151]
	ubfx	r0, r7, #5, #3
	strb	r2, [r4, #150]
	strb	r0, [r4, #153]
	ubfx	r0, r7, #3, #1
	strb	r3, [r4, #152]
	strb	r0, [r4, #155]
	and	r0, r7, #3
	strb	ip, [r4, #156]
	strb	r0, [r4, #157]
	b	.L3955
.L4098:
	ldr	r2, .L4102+72
	movw	r1, #10075
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	bl	ClearCurrSlice
	ldr	r3, .L4102+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4080
.L4084:
	mov	r3, #0
	ldr	r0, [r4, #1840]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	mvn	r0, #0
	b	.L3959
.L4101:
	ldr	r5, .L4102+12
	movw	r1, #10102
	ldr	r3, .L4102+76
	mov	r0, #1
	ldr	r2, .L4102+80
	bl	dprint_normal
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4080
.L4086:
	sub	r2, fp, #36
	mvn	r7, #0
	mov	r3, #4
	mov	r1, #9
	str	r7, [r2, #-4]!
	ldr	r0, [r4, #1840]
	blx	r6
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L4084
	b	.L4080
.L4100:
	ldr	r5, .L4102+12
	movw	r1, #10119
	ldr	r2, .L4102+84
	mov	r0, #1
	bl	dprint_normal
	ldr	r6, [r5]
	cmp	r6, #0
	bne	.L4086
	b	.L4080
.L4099:
	ldr	r2, .L4102+88
	movw	r1, #10136
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L4102+12
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L4083
	b	.L4081
.L3957:
	ldrb	r2, [r4, #148]	@ zero_extendqisi2
	cmp	r2, #1
	ldr	r2, .L4102+92
	moveq	r3, #5
	streqb	r3, [r1, #2]
	ldrb	r0, [r4, #153]	@ zero_extendqisi2
	movw	r1, #10056
	ldrb	ip, [r4, #151]	@ zero_extendqisi2
	ldreqb	r3, [r4, #152]	@ zero_extendqisi2
	str	r0, [sp, #4]
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	mov	r3, r7
	ldr	r2, .L4102+96
	movw	r1, #10057
	mov	r0, #20
	bl	dprint_normal
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #8]
	add	r3, r3, #24
	str	r3, [r2, #8]
	ldr	r3, [r5, #368]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	b	.L3953
.L4103:
	.align	2
.L4102:
	.word	s_pstVfmwChan
	.word	.LC406
	.word	.LC411
	.word	g_EventReportFunc
	.word	.LC417
	.word	.LC415
	.word	.LC413
	.word	.LC419
	.word	.LC420
	.word	.LC422
	.word	.LC421
	.word	.LC423
	.word	.LC424
	.word	.LC425
	.word	.LC426
	.word	.LC427
	.word	.LC407
	.word	.LC408
	.word	.LC412
	.word	.LANCHOR0+412
	.word	.LC414
	.word	.LC416
	.word	.LC418
	.word	.LC409
	.word	.LC410
	UNWIND(.fnend)
	.size	H264_DecOneNal, .-H264_DecOneNal
	.align	2
	.global	H264DEC_DecodePacket
	.type	H264DEC_DecodePacket, %function
H264DEC_DecodePacket:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	cmp	r1, #0
	mov	r5, r0
	mov	r0, #0
	str	r0, [fp, #-56]
	str	r0, [fp, #-60]
	str	r0, [fp, #-64]
	beq	.L4168
	ldr	r2, [r5]
	add	r4, r5, #57344
	ldr	ip, [r4, #784]
	ldr	r3, [r2, #8]
	cmp	ip, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r4, #1828]
	ldr	r3, [r2]
	str	r3, [r4, #1832]
	ldr	r3, [r2, #4]
	str	r0, [r4, #1780]
	str	r3, [r4, #1836]
	beq	.L4107
	ldr	r3, [r2, #816]
	cmp	r3, #1
	beq	.L4169
.L4108:
	mov	r0, r5
	bl	ReceivePacket
	ldr	r3, [r5, #368]
	str	r3, [r4, #1904]
.L4110:
	cmp	r0, #0
	mov	r3, #0
	str	r3, [r4, #784]
	beq	.L4109
.L4133:
	mov	r6, #0
.L4167:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4169:
	ldr	r3, [r2, #848]
	cmp	r3, #1
	bne	.L4108
	ldr	r3, [r4, #1900]
	cmp	r3, #1
	bne	.L4108
	ldr	r3, [r4, #1904]
	str	r3, [r5, #368]
	str	r0, [r4, #1900]
	str	r0, [r4, #784]
.L4109:
	mov	r0, r5
	bl	H264DEC_CheckSedOnly
	subs	r6, r0, #0
	beq	.L4111
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4135
	ldr	r0, [r4, #1840]
	mvn	r6, #0
	bl	ReleaseNAL
	mov	r3, #0
	mov	r0, r6
	str	r3, [r5, #368]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4107:
	ldr	r0, [r5, #368]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4110
.L4135:
	mvn	r6, #0
	b	.L4167
.L4111:
	ldr	r3, [r5, #368]
	add	r7, r5, #13504
	add	r7, r7, #24
	ldr	r9, .L4178
	str	r6, [r3, #8]
	mov	r0, r7
	ldr	r3, [r5, #368]
	ldr	r2, [r3, #44]
	ldr	r1, [r3, #40]
	bl	BsInit
	ldr	r2, [r4, #1840]
	movw	r3, #2456
	ldr	r1, [r9, r2, asl #2]
	add	r1, r1, #204800
	ldrsb	r8, [r1, r3]
	cmp	r8, #1
	beq	.L4112
.L4114:
	mov	r8, #0
.L4113:
	mov	r1, #32
	mov	r0, r7
	bl	BsGet
	ldr	r2, [r5, #368]
	uxtb	r0, r0
	and	r3, r0, #31
	and	r1, r0, #27
	strb	r3, [r2, #2]
	sub	ip, r3, #20
	ldr	r2, [r5, #368]
	clz	ip, ip
	cmp	r3, #20
	cmpne	r1, #1
	ubfx	r0, r0, #5, #2
	mov	ip, ip, lsr #5
	str	r0, [r2, #20]
	beq	.L4170
.L4115:
	mov	r0, r5
	bl	FindTrailZeros
	subs	r3, r0, #0
	bne	.L4171
	ldr	r2, [r5, #368]
	mov	r0, r7
	str	r3, [r2, #8]
	ldr	r3, [r5, #368]
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	mov	r1, r8
	mov	r0, r5
	bl	H264_DecOneNal
	cmn	r0, #2
	beq	.L4139
	cmp	r0, #0
	bne	.L4172
	add	r3, r5, #53248
	str	r0, [r3, #3572]
	ldr	r3, [r4, #1844]
	cmp	r3, #1
	bne	.L4133
	mov	r0, r5
	bl	H264DEC_SetDecParam
	b	.L4167
.L4170:
	cmp	ip, #0
	bne	.L4173
.L4116:
	sub	r2, fp, #48
	sub	r1, fp, #52
	mov	r0, r5
	bl	InquireSliceProperty
	cmp	r0, #0
	bne	.L4117
	ldr	r2, [fp, #-52]
	ldr	r1, [r4, #1880]
	sub	r3, r2, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r3, r1
	str	r3, [r4, #1880]
	bne	.L4174
.L4118:
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	bne	.L4115
	ldr	r1, [r4, #1840]
	mov	r0, #100
	ldr	r2, .L4178+4
	mla	r2, r0, r1, r2
	add	r10, r2, #64
	ldr	r1, [r2, #64]
	cmp	r1, #0
	beq	.L4175
.L4125:
	mov	r0, r5
	bl	FlushDPB
	cmp	r0, #0
	bne	.L4176
.L4126:
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	ldr	r0, [r4, #1840]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5]
	ldr	r3, [r3, #696]
	cmp	r3, #1
	bne	.L4115
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ble	.L4177
.L4127:
	ldr	r3, [r4, #1840]
	mov	r2, #1
	mvn	r6, #1
	ldr	r3, [r9, r3, asl #2]
	add	r3, r3, #204800
	str	r2, [r3, #3540]
	str	r2, [r4, #784]
	b	.L4167
.L4117:
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4130
	ldr	r0, [r4, #1840]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4130:
	ldr	r3, .L4178+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4135
	mov	r3, #0
	ldr	r0, [r4, #1840]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	mvn	r6, #0
	b	.L4167
.L4112:
	ldr	r3, [r1, #2576]
	mov	r0, r5
	ldr	r2, [r1, #2572]
	ldr	r1, [r1, #2568]
	bl	H264_VES_Splitter
	cmp	r0, #3
	beq	.L4113
	cmp	r0, #0
	beq	.L4114
.L4139:
	mov	r6, r0
	b	.L4167
.L4174:
	add	r10, r5, #20480
	ldrb	r3, [r10, #209]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #1884]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #1884]
	ldr	r3, [r4, #1764]
	cmp	r3, #0
	beq	.L4118
	ldr	r3, [r5, #368]
	mov	ip, #0
	mov	r0, r7
	mov	r2, #20
	ldr	r1, .L4178+12
	mvn	r6, #1
	str	ip, [r3, #8]
	bl	BsInit
	mov	r0, r5
	mov	r1, #1
	bl	H264_DecOneNal
	ldrb	r3, [r10, #209]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #1884]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #1884]
	mov	r3, #1
	str	r3, [r4, #784]
	b	.L4167
.L4173:
	mov	r0, r5
	bl	InquireSliceExtProperty
	b	.L4116
.L4168:
	movw	r3, #11240
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L4178+16
	mvn	r6, #0
	ldr	r3, .L4178+20
	bl	dprint_normal
	b	.L4167
.L4171:
	ldr	r2, .L4178+24
	movw	r1, #11398
	mov	r0, #20
	mvn	r6, #0
	bl	dprint_normal
	b	.L4167
.L4175:
	ldr	r1, .L4178+28
	str	r3, [r2, #64]
	ldr	r3, [r1]
	blx	r3
	str	r0, [r10, #4]
	b	.L4125
.L4176:
	movw	r3, #11361
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L4178+32
	mov	r0, #0
	bl	dprint_normal
	b	.L4126
.L4172:
	ldr	r2, .L4178+36
	movw	r1, #11413
	mov	r0, #20
	mvn	r6, #0
	bl	dprint_normal
	b	.L4167
.L4177:
	ldr	r3, [fp, #-60]
	cmp	r3, #32
	bgt	.L4127
	ldr	r3, [r5, #360]
	cmp	r3, #0
	bne	.L4127
	ldr	r2, [r4, #1804]
	cmp	r2, #0
	beq	.L4115
	add	r1, r5, #12288
	ldr	r2, [r1, #1276]
	cmp	r2, #0
	beq	.L4115
	ldr	r1, [r1, #1280]
	ldr	r0, [r4, #1908]
	cmp	r1, r0
	beq	.L4115
	ldr	r0, [r4, #1912]
	cmp	r2, r0
	beq	.L4115
	ldr	r0, .L4178+8
	str	r1, [r4, #1908]
	str	r2, [r4, #1912]
	ldr	r9, [r0]
	cmp	r9, #0
	beq	.L4115
	mov	r2, r3
	mov	r1, #48
	ldr	r0, [r4, #1840]
	blx	r9
	b	.L4115
.L4179:
	.align	2
.L4178:
	.word	s_pstVfmwChan
	.word	g_VfmwChanStat
	.word	g_EventReportFunc
	.word	.LANCHOR1+432
	.word	.LC22
	.word	.LC21
	.word	.LC428
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC350
	.word	.LC429
	UNWIND(.fnend)
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	2
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 32
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
	add	r6, r0, #57344
	ldr	r2, [r0]
	mov	r4, r0
	ldr	r0, [r6, #1868]
	mov	r8, r3
	mov	r3, #0
	str	r3, [fp, #-64]
	cmp	r0, #1
	ldr	r9, [r2, #616]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
	bls	.L4181
	ldr	r0, [r2, #8]
	add	r5, r4, #53248
	cmp	r0, #2
	beq	.L4182
	ldr	r0, [r5, #3544]
	mov	r0, r0, asl #4
	cmp	r0, #1920
	bhi	.L4211
.L4182:
	ldr	r3, [r2, #612]
	str	r3, [r6, #1844]
.L4196:
	ldr	r7, [r4, #364]
	mov	r0, r4
	str	r1, [r5, #3540]
	cmp	r7, #0
	bne	.L4183
	bl	ClearAllSlice
	cmp	r9, #0
	beq	.L4184
	ldr	r9, [r5, #3496]
	str	r7, [fp, #-40]
	cmp	r9, #0
	beq	.L4185
	ldr	r3, .L4214
	ldr	r3, [r3, #132]
	cmp	r3, #0
	beq	.L4186
	ldr	r1, [fp, #8]
	sub	r0, fp, #64
	blx	r3
	cmp	r0, #0
	bne	.L4187
	add	r3, r4, #20480
	ldrb	r2, [r3, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L4189
	ldr	r3, [fp, #-64]
	str	r3, [r9, #624]
.L4190:
	ldr	r2, [r9, #248]
	ldr	r0, [fp, #-56]
	ldr	r3, [r9, #252]
	ldr	r1, [fp, #-52]
	cmp	r2, r0
	ldr	ip, [fp, #-48]
	ldr	lr, [fp, #-44]
	movcc	r2, r0
	cmp	r3, r1
	str	r2, [r9, #248]
	str	ip, [r9, #256]
	str	lr, [r9, #260]
	movcs	r3, r1
	str	r3, [r9, #252]
	str	r0, [r5, #3200]
	str	r1, [r5, #3204]
	str	ip, [r5, #3208]
	str	lr, [r5, #3212]
.L4184:
	mov	r1, r8
	mov	r0, r4
	bl	StorePicInDPB
	cmp	r0, #1
	mov	r8, r0
	bls	.L4192
	ldr	r3, [r5, #3496]
	mvn	r7, #0
	ldr	r0, [r6, #1840]
	ldr	r1, [r3, #544]
	bl	FSP_ClearLogicFs
	mov	r3, r8
	ldr	r2, .L4214+4
	movw	r1, #11571
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	ldr	r2, [r5, #3496]
	mov	r3, #0
	mov	r0, r7
	strb	r3, [r2, #1]
	ldr	r2, [r5, #3496]
	strb	r3, [r2, #4]
	str	r3, [r5, #3496]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4211:
	str	r3, [r6, #1844]
	b	.L4196
.L4183:
	bl	ClearAllSlice
	mov	r1, r8
	mov	r0, r4
	bl	StorePicInDPB
	subs	r3, r0, #0
	bne	.L4212
.L4194:
	mov	r0, r4
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L4213
.L4195:
	add	r2, r4, #12288
	mov	r3, #0
	str	r3, [r6, #780]
	add	r4, r4, #20480
	ldr	r1, [r2, #1292]
	mov	r7, r3
	movw	r2, #23352
	strb	r3, [r4, #1848]
	str	r3, [r4, #1880]
	movt	r2, 1
	str	r1, [r4, #1856]
	mov	r0, #7
	mov	r1, #2
	str	r3, [r4, #1884]
	str	r2, [r4, #1864]
	mov	r3, #32
	strb	r1, [r4, #1849]
	mvn	r2, #0
	mov	r1, #3
	str	r0, [r4, #1860]
	strb	r3, [r4, #1850]
	mov	r0, r7
	mov	r3, #1048576
	str	r1, [r4, #1872]
	str	r2, [r4, #1876]
	str	r3, [r4, #1888]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4181:
	ldr	r3, [r2, #612]
	add	r0, r0, #1
	add	r5, r4, #53248
	str	r0, [r6, #1868]
	str	r3, [r6, #1844]
	b	.L4196
.L4192:
	mov	r3, #1
	mov	r0, r7
	str	r3, [r6, #780]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4213:
	ldr	r2, .L4214+8
	movw	r1, #11600
	mov	r0, #1
	bl	dprint_normal
	b	.L4195
.L4212:
	ldr	r2, .L4214+12
	movw	r1, #11593
	mov	r0, #1
	bl	dprint_normal
	b	.L4194
.L4189:
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [fp, #-64]
	streq	r3, [r9, #664]
	strne	r3, [r9, #704]
	b	.L4190
.L4186:
	movw	r3, #11526
	ldr	r2, .L4214+16
	mov	r1, r3
	mov	r0, r7
	bl	dprint_normal
.L4187:
	ldr	r2, .L4214+20
	movw	r1, #11529
	mov	r0, #1
	bl	dprint_normal
	b	.L4184
.L4185:
	ldr	r2, .L4214+24
	movw	r1, #11562
	mov	r0, r7
	bl	dprint_normal
	b	.L4184
.L4215:
	.align	2
.L4214:
	.word	g_vdm_hal_fun_ptr
	.word	.LC433
	.word	.LC435
	.word	.LC434
	.word	.LC430
	.word	.LC431
	.word	.LC432
	UNWIND(.fnend)
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	2
	.global	H264DEC_VDMProcSedOnly
	.type	H264DEC_VDMProcSedOnly, %function
H264DEC_VDMProcSedOnly:
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
	ldr	r5, .L4236
	ldr	r2, [r0, #360]
	mov	r3, #184
	add	r7, r0, #57344
	ldr	ip, .L4236+4
	mla	r5, r3, r1, r5
	ldr	r4, [r2, #12]
	ldr	r3, [r2, #20]
	mov	r6, r0
	ldr	r2, [r7, #1840]
	movw	r1, #11623
	mov	r0, #20
	mul	r4, r3, r4
	ldr	r3, [r5, #20]
	ldr	r8, [ip, r2, asl #2]
	ldr	r2, .L4236+8
	sub	r4, r4, #1
	str	r3, [sp]
	mov	r3, r4
	bl	dprint_normal
	ldr	r3, [r5, #20]
	cmp	r3, r4
	ldr	r3, [r7, #1852]
	beq	.L4234
	cmp	r3, #1
	beq	.L4235
.L4222:
	mov	r3, #0
	str	r3, [r6, #360]
.L4220:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4234:
	cmp	r3, #1
	beq	.L4218
	ldr	r3, .L4236+12
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L4219
	mov	r3, #0
	ldr	r0, [r7, #1840]
	mov	r2, r3
	mov	r1, #41
	blx	r4
.L4219:
	mov	r0, r6
	bl	DecVDM
	cmp	r0, #0
	bne	.L4222
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4235:
	ldr	r3, [r7, #1764]
	mov	r4, #0
	str	r4, [r7, #1856]
	sub	r3, r3, #1
	str	r3, [r7, #1764]
	ldr	r1, [r6, #368]
	cmp	r1, r4
	beq	.L4222
	ldr	r0, [r7, #1840]
	bl	ReleaseNAL
	str	r4, [r6, #368]
	b	.L4222
.L4218:
	ldr	r2, [r7, #1764]
	add	r8, r8, #204800
	str	r3, [r7, #1856]
	mov	r1, #0
	sub	r2, r2, #1
	str	r2, [r7, #1764]
	strb	r3, [r8, #2785]
	str	r3, [r7, #784]
	str	r1, [r6, #360]
	b	.L4220
.L4237:
	.align	2
.L4236:
	.word	g_BackUp
	.word	s_pstVfmwChan
	.word	.LC436
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	H264DEC_VDMProcSedOnly, .-H264DEC_VDMProcSedOnly
	.align	2
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
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
	add	r6, r0, #57344
	mov	r7, r0
	ldr	r5, [r6, #772]
	cmp	r5, #0
	beq	.L4241
	add	r3, r0, #53248
	ldrb	r3, [r3, #2944]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4241
	add	r8, r0, #26368
	add	ip, r0, #27392
	add	r8, r8, #152
	add	r1, r0, #24576
	mov	r4, #0
.L4246:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4242
	cmp	ip, #0
	beq	.L4243
	ldr	lr, [r1, #2140]
	cmp	lr, #0
	beq	.L4243
	ldr	r2, [r1, #1944]
	cmp	r2, ip
	beq	.L4242
	mov	r2, r8
	b	.L4244
.L4245:
	ldr	r0, [r2, #4]!
	cmp	r0, ip
	beq	.L4242
.L4244:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L4245
.L4243:
	cmp	r5, r4
	bls	.L4261
	ldr	r0, [r6, #1840]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	beq	.L4241
	cmn	r0, #1
	beq	.L4262
.L4261:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4241:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4242:
	add	r4, r4, #1
	add	ip, ip, #720
	cmp	r4, r5
	bne	.L4246
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4262:
	add	r1, r7, #8
	ldr	r0, [r6, #1840]
	bl	FSP_ClearNotInVoQueue
	b	.L4261
	UNWIND(.fnend)
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
	.global	TmpBuf
	.global	g_CabacMN
	.global	quant8_org
	.global	quant_org
	.global	quant8_inter_default
	.global	quant8_intra_default
	.global	quant_inter_default
	.global	quant_intra_default
	.global	g_ZZ_SCAN8
	.global	g_ZZ_SCAN
	.global	CalcZeroNum
	.global	g_AspecRatioIdc
	.global	g_NalTypeEOPIC
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12738, %object
	.size	__func__.12738, 23
__func__.12738:
	.ascii	"RemoveFrameStoreOutDPB\000"
	.space	1
	.type	__func__.12757, %object
	.size	__func__.12757, 16
__func__.12757:
	.ascii	"CheckFrameStore\000"
	.type	__func__.12990, %object
	.size	__func__.12990, 20
__func__.12990:
	.ascii	"H264_ArrangeVahbMem\000"
	.type	g_ZZ_SCAN, %object
	.size	g_ZZ_SCAN, 16
g_ZZ_SCAN:
	.byte	0
	.byte	1
	.byte	4
	.byte	8
	.byte	5
	.byte	2
	.byte	3
	.byte	6
	.byte	9
	.byte	12
	.byte	13
	.byte	10
	.byte	7
	.byte	11
	.byte	14
	.byte	15
	.type	g_ZZ_SCAN8, %object
	.size	g_ZZ_SCAN8, 64
g_ZZ_SCAN8:
	.byte	0
	.byte	1
	.byte	8
	.byte	16
	.byte	9
	.byte	2
	.byte	3
	.byte	10
	.byte	17
	.byte	24
	.byte	32
	.byte	25
	.byte	18
	.byte	11
	.byte	4
	.byte	5
	.byte	12
	.byte	19
	.byte	26
	.byte	33
	.byte	40
	.byte	48
	.byte	41
	.byte	34
	.byte	27
	.byte	20
	.byte	13
	.byte	6
	.byte	7
	.byte	14
	.byte	21
	.byte	28
	.byte	35
	.byte	42
	.byte	49
	.byte	56
	.byte	57
	.byte	50
	.byte	43
	.byte	36
	.byte	29
	.byte	22
	.byte	15
	.byte	23
	.byte	30
	.byte	37
	.byte	44
	.byte	51
	.byte	58
	.byte	59
	.byte	52
	.byte	45
	.byte	38
	.byte	31
	.byte	39
	.byte	46
	.byte	53
	.byte	60
	.byte	61
	.byte	54
	.byte	47
	.byte	55
	.byte	62
	.byte	63
	.type	__func__.13710, %object
	.size	__func__.13710, 12
__func__.13710:
	.ascii	"H264_DecPPS\000"
	.type	SarTable.13788, %object
	.size	SarTable.13788, 136
SarTable.13788:
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
	.type	__func__.13978, %object
	.size	__func__.13978, 12
__func__.13978:
	.ascii	"H264_DecSEI\000"
	.type	__func__.12806, %object
	.size	__func__.12806, 17
__func__.12806:
	.ascii	"OutputFrmFromDPB\000"
	.space	3
	.type	__func__.12860, %object
	.size	__func__.12860, 13
__func__.12860:
	.ascii	"DirectOutput\000"
	.space	3
	.type	__func__.13309, %object
	.size	__func__.13309, 8
__func__.13309:
	.ascii	"InitDPB\000"
	.type	__func__.14175, %object
	.size	__func__.14175, 18
__func__.14175:
	.ascii	"H264_VES_Splitter\000"
	.space	2
	.type	__func__.12966, %object
	.size	__func__.12966, 14
__func__.12966:
	.ascii	"StorePicInDPB\000"
	.space	2
	.type	__FUNCTION__.14146, %object
	.size	__FUNCTION__.14146, 13
__FUNCTION__.14146:
	.ascii	"H264DEC_Init\000"
	.space	3
	.type	__FUNCTION__.13432, %object
	.size	__FUNCTION__.13432, 8
__FUNCTION__.13432:
	.ascii	"InitPic\000"
	.type	__func__.13433, %object
	.size	__func__.13433, 8
__func__.13433:
	.ascii	"InitPic\000"
	.type	__func__.14049, %object
	.size	__func__.14049, 15
__func__.14049:
	.ascii	"H264_DecOneNal\000"
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	quant_org, %object
	.size	quant_org, 16
quant_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	quant8_org, %object
	.size	quant8_org, 64
quant8_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	quant_intra_default, %object
	.size	quant_intra_default, 16
quant_intra_default:
	.word	471076102
	.word	538711053
	.word	622861332
	.word	707076124
	.type	quant_inter_default, %object
	.size	quant_inter_default, 16
quant_inter_default:
	.word	403967498
	.word	454562830
	.word	505092116
	.word	572398360
	.type	quant8_intra_default, %object
	.size	quant8_intra_default, 64
quant8_intra_default:
	.word	269289990
	.word	454629138
	.word	303041290
	.word	488315159
	.word	387059725
	.word	522001177
	.word	420942352
	.word	555687195
	.word	454629138
	.word	606150429
	.word	488315159
	.word	639901983
	.word	522001177
	.word	673588257
	.word	555687195
	.word	707274276
	.type	quant8_inter_default, %object
	.size	quant8_inter_default, 256
quant8_inter_default:
	.word	286199049
	.word	404100371
	.word	319884557
	.word	421008917
	.word	353571087
	.word	454629398
	.word	370479889
	.word	471537944
	.word	404100371
	.word	505158425
	.word	421008917
	.word	538844187
	.word	454629398
	.word	555752988
	.word	471537944
	.word	589373470
	.space	192
	.type	g_NalTypeEOPIC, %object
	.size	g_NalTypeEOPIC, 20
g_NalTypeEOPIC:
	.byte	0
	.byte	0
	.byte	1
	.byte	30
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
	.type	g_CabacMN, %object
	.size	g_CabacMN, 5120
g_CabacMN:
	.word	388044546
	.word	352326208
	.word	153820416
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	87683918
	.word	-180289218
	.word	17367089
	.word	-613020375
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	21230414
	.word	-180289218
	.word	440602714
	.word	157864575
	.word	-328728576
	.word	0
	.word	0
	.word	0
	.word	204602441
	.word	288553558
	.word	-278922691
	.word	154007875
	.word	-78971830
	.word	-78579384
	.word	20578304
	.word	0
	.word	-45745583
	.word	-178256329
	.word	121895766
	.word	39321658
	.word	-45287842
	.word	87426117
	.word	-45023144
	.word	0
	.word	370745856
	.word	268442146
	.word	320219136
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	37878343
	.word	-212925132
	.word	-32963543
	.word	-478802647
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-62064057
	.word	-212925132
	.word	956442916
	.word	440783743
	.word	-245039104
	.word	0
	.word	0
	.word	0
	.word	154336582
	.word	171312709
	.word	-212205516
	.word	137101122
	.word	-11730618
	.word	-27854008
	.word	3997696
	.word	0
	.word	-28968110
	.word	-161480133
	.word	38534487
	.word	-43777736
	.word	-45417899
	.word	3931473
	.word	-111740065
	.word	0
	.word	487594240
	.word	234886184
	.word	336207104
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	437320789
	.word	-395967175
	.word	-164364994
	.word	-446493399
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-28640171
	.word	-395967175
	.word	905979178
	.word	207741055
	.word	-361431040
	.word	0
	.word	0
	.word	0
	.word	104460105
	.word	238680669
	.word	-229049812
	.word	70714167
	.word	-61866421
	.word	-194905806
	.word	20709376
	.word	0
	.word	-178654873
	.word	-344714439
	.word	339346516
	.word	106955071
	.word	-78253206
	.word	88016459
	.word	-44368027
	.word	0
	.word	388044546
	.word	352326208
	.word	153820416
	.word	3013710
	.word	-44040151
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	203950899
	.word	238747648
	.word	0
	.word	0
	.word	87683918
	.word	-180289218
	.word	17367089
	.word	-613020375
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	21230414
	.word	-180289218
	.word	440602714
	.word	157864575
	.word	-328728576
	.word	0
	.word	0
	.word	0
	.word	204602441
	.word	288553558
	.word	-278922691
	.word	154007875
	.word	-78971830
	.word	-78579384
	.word	20578304
	.word	0
	.word	-45745583
	.word	-178256329
	.word	121895766
	.word	39321658
	.word	-45287842
	.word	87426117
	.word	-45023144
	.word	0
	.word	370745856
	.word	268442146
	.word	320219136
	.word	219088691
	.word	38797353
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	421532977
	.word	355860480
	.word	0
	.word	0
	.word	37878343
	.word	-212925132
	.word	-32963543
	.word	-478802647
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-62064057
	.word	-212925132
	.word	956442916
	.word	440783743
	.word	-245039104
	.word	0
	.word	0
	.word	0
	.word	154336582
	.word	171312709
	.word	-212205516
	.word	137101122
	.word	-11730618
	.word	-27854008
	.word	3997696
	.word	0
	.word	-28968110
	.word	-161480133
	.word	38534487
	.word	-43777736
	.word	-45417899
	.word	3931473
	.word	-111740065
	.word	0
	.word	487594240
	.word	234886184
	.word	336207104
	.word	119732056
	.word	-327221207
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	354489138
	.word	289210368
	.word	0
	.word	0
	.word	437320789
	.word	-395967175
	.word	-164364994
	.word	-446493399
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-28640171
	.word	-395967175
	.word	905979178
	.word	207741055
	.word	-361431040
	.word	0
	.word	0
	.word	0
	.word	104460105
	.word	238680669
	.word	-229049812
	.word	70714167
	.word	-61866421
	.word	-194905806
	.word	20709376
	.word	0
	.word	-178654873
	.word	-344714439
	.word	339346516
	.word	106955071
	.word	-78253206
	.word	88016459
	.word	-44368027
	.word	0
	.word	-276827290
	.word	5437770
	.word	-345250433
	.word	-511711105
	.word	-295705217
	.word	-344792449
	.word	0
	.word	0
	.word	-277089165
	.word	-260377229
	.word	-45614550
	.word	-80544458
	.word	-29491142
	.word	20971080
	.word	-11864229
	.word	0
	.word	-111282857
	.word	-45221049
	.word	-62915516
	.word	-195757762
	.word	-113178563
	.word	87621186
	.word	20971581
	.word	-28442624
	.word	402657033
	.word	135859474
	.word	252251411
	.word	170200082
	.word	102568993
	.word	253625389
	.word	20578366
	.word	121438208
	.word	-94504364
	.word	-129040318
	.word	-12124098
	.word	-29557189
	.word	-78906050
	.word	-63244478
	.word	-11599801
	.word	54788096
	.word	252053011
	.word	118492174
	.word	302845195
	.word	219090704
	.word	202837271
	.word	252972570
	.word	237769000
	.word	288292864
	.word	-197132732
	.word	-246090904
	.word	-79430885
	.word	-47710676
	.word	3076160
	.word	-129698226
	.word	-95553962
	.word	0
	.word	20055860
	.word	170065964
	.word	187040045
	.word	3015980
	.word	521208115
	.word	120724499
	.word	270601790
	.word	0
	.word	203819821
	.word	254217002
	.word	220991533
	.word	204016177
	.word	505549354
	.word	171381043
	.word	288227417
	.word	0
	.word	170719550
	.word	254021160
	.word	270208029
	.word	19665956
	.word	304088362
	.word	19925566
	.word	288229696
	.word	0
	.word	403772693
	.word	420880155
	.word	371004195
	.word	238160441
	.word	121634381
	.word	-61670050
	.word	155579501
	.word	0
	.word	-45680547
	.word	-161815937
	.word	-195235529
	.word	-163775938
	.word	-62786487
	.word	-129173168
	.word	-145166482
	.word	0
	.word	-210964124
	.word	-211422373
	.word	-195103144
	.word	-262867370
	.word	-111938729
	.word	-312606394
	.word	4782922
	.word	305856512
	.word	451745519
	.word	451878631
	.word	485237225
	.word	635773417
	.word	686040815
	.word	569714929
	.word	704259585
	.word	688979968
	.word	-194448031
	.word	-262080168
	.word	-128583339
	.word	-145362088
	.word	71499085
	.word	-45286836
	.word	171638604
	.word	-11337728
	.word	618472670
	.word	551953890
	.word	752886510
	.word	586230001
	.word	569975803
	.word	553657858
	.word	554506019
	.word	221904896
	.word	-11863455
	.word	-111416193
	.word	-178131884
	.word	-179307959
	.word	-62196906
	.word	-211749535
	.word	-311099392
	.word	0
	.word	-127471260
	.word	6225920
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	519707395
	.word	437649408
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-110890401
	.word	39780352
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	503126528
	.word	371064832
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-63374510
	.word	-112399747
	.word	-129041631
	.word	-63898059
	.word	-46206137
	.word	-162532266
	.word	-212143519
	.word	0
	.word	-62193080
	.word	-179569337
	.word	254735173
	.word	4063297
	.word	354808136
	.word	154734646
	.word	4066376
	.word	0
	.word	636494844
	.word	653797117
	.word	620963333
	.word	704652048
	.word	655756848
	.word	455415100
	.word	205783649
	.word	0
	.word	5045066
	.word	4650315
	.word	21233729
	.word	-230096066
	.word	71237444
	.word	-213185737
	.word	88083526
	.word	0
	.word	536421361
	.word	587014659
	.word	620700165
	.word	537600773
	.word	571221771
	.word	505225754
	.word	489100098
	.word	0
	.word	0
	.word	0
	.word	-45351145
	.word	19005739
	.word	3604023
	.word	3998016
	.word	4519772
	.word	0
	.word	-277287824
	.word	-294455979
	.word	-245566887
	.word	-431492783
	.word	-229638076
	.word	-230234056
	.word	-381360078
	.word	-179699712
	.word	401808115
	.word	686895602
	.word	738405638
	.word	740434230
	.word	324141056
	.word	0
	.word	0
	.word	0
	.word	-227871903
	.word	-245697446
	.word	-296159671
	.word	-145755562
	.word	-162924986
	.word	-163185854
	.word	-146736326
	.word	37421056
	.word	368449781
	.word	486022399
	.word	486743305
	.word	588520740
	.word	239271936
	.word	0
	.word	0
	.word	0
	.word	-444668830
	.word	-412751549
	.word	-464327586
	.word	-262935954
	.word	-346296730
	.word	-211950721
	.word	0
	.word	0
	.word	-111346855
	.word	-111086740
	.word	-95617492
	.word	2949172
	.word	-46072261
	.word	-62456757
	.word	-128782490
	.word	0
	.word	-27919794
	.word	-11798195
	.word	37094706
	.word	-45874894
	.word	103480401
	.word	20970566
	.word	4391481
	.word	-28573696
	.word	186384936
	.word	53215281
	.word	3015212
	.word	36896815
	.word	69665342
	.word	103678006
	.word	53871162
	.word	71237632
	.word	-211095446
	.word	-162010254
	.word	-294718878
	.word	-361829526
	.word	-295179413
	.word	-378739088
	.word	-161418145
	.word	-77922304
	.word	235604750
	.word	151720459
	.word	352917502
	.word	552673521
	.word	585836521
	.word	719268321
	.word	786704116
	.word	354222080
	.word	-47251647
	.word	-12978339
	.word	-145947880
	.word	2752560
	.word	3668539
	.word	-112724909
	.word	-178789769
	.word	0
	.word	186844224
	.word	20777763
	.word	303631384
	.word	220007716
	.word	-161613495
	.word	-28766930
	.word	154270052
	.word	0
	.word	104007225
	.word	120915508
	.word	104270637
	.word	237242421
	.word	-11401417
	.word	-45215954
	.word	371195732
	.word	0
	.word	-144840098
	.word	-78247613
	.word	-61802923
	.word	-12187844
	.word	154797373
	.word	204607282
	.word	305205558
	.word	0
	.word	770192851
	.word	820396501
	.word	736962550
	.word	503910938
	.word	337313849
	.word	-229442741
	.word	-312353411
	.word	0
	.word	-45418660
	.word	-128456322
	.word	20643101
	.word	-14417626
	.word	36436535
	.word	3801152
	.word	-45418918
	.word	0
	.word	154468917
	.word	87424573
	.word	3670072
	.word	-213910724
	.word	-12712903
	.word	-96140231
	.word	237438003
	.word	222560256
	.word	419897081
	.word	469965828
	.word	536879871
	.word	503717382
	.word	537468691
	.word	437983774
	.word	622074914
	.word	289800192
	.word	170460974
	.word	-13433039
	.word	137627945
	.word	103744055
	.word	220793388
	.word	103941429
	.word	221316159
	.word	104857600
	.word	452992000
	.word	536615686
	.word	570957322
	.word	404103443
	.word	371202591
	.word	355015212
	.word	388960321
	.word	239534080
	.word	87426620
	.word	104531525
	.word	4652061
	.word	85919530
	.word	20708922
	.word	-45548207
	.word	-178192384
	.word	0
	.word	54526269
	.word	155123712
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	21169467
	.word	155385856
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-28967365
	.word	105250816
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	138151487
	.word	289472512
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-13631420
	.word	-62523304
	.word	3803141
	.word	168693266
	.word	219873832
	.word	3865926
	.word	-95422379
	.word	0
	.word	120721447
	.word	86770740
	.word	187759420
	.word	-12910533
	.word	371262764
	.word	237764430
	.word	3934533
	.word	0
	.word	270406176
	.word	304289309
	.word	404690726
	.word	304813097
	.word	188680507
	.word	155254622
	.word	-27658388
	.word	0
	.word	170658079
	.word	204145461
	.word	237111846
	.word	-46920408
	.word	287311660
	.word	119934258
	.word	171514411
	.word	0
	.word	353900308
	.word	437721888
	.word	471276568
	.word	388503584
	.word	471668522
	.word	322508341
	.word	373099350
	.word	0
	.word	0
	.word	0
	.word	-96274141
	.word	-114624467
	.word	-80677832
	.word	-96666818
	.word	-129828788
	.word	0
	.word	-61867705
	.word	-79300794
	.word	-129829308
	.word	-313920443
	.word	-263786173
	.word	-331420346
	.word	-264050111
	.word	-331415552
	.word	167647991
	.word	569845753
	.word	704523523
	.word	822684955
	.word	607846400
	.word	0
	.word	0
	.word	0
	.word	-78251439
	.word	-162662063
	.word	-279908791
	.word	-62196141
	.word	-146278589
	.word	-12715966
	.word	-230555589
	.word	37421056
	.word	368255474
	.word	670641918
	.word	855784454
	.word	1024538402
	.word	708706304
	.word	0
	.word	0
	.word	0
	.word	-645927333
	.word	-278862255
	.word	-580720538
	.word	-379460233
	.word	-396104850
	.word	-295248769
	.word	0
	.word	0
	.word	5307225
	.word	-111215524
	.word	-378474169
	.word	-113442763
	.word	-79497907
	.word	-145688748
	.word	-162013569
	.word	0
	.word	-211291301
	.word	-145100196
	.word	-129174441
	.word	-378607511
	.word	-162599824
	.word	-278678913
	.word	-1166029185
	.word	-763428864
	.word	70060572
	.word	169812469
	.word	886379023
	.word	469771242
	.word	652681728
	.word	669917428
	.word	1721892864
	.word	955318272
	.word	-344004228
	.word	-328276354
	.word	-411242647
	.word	-444996235
	.word	-278469003
	.word	-445325446
	.word	-161484188
	.word	-127991808
	.word	335155962
	.word	234887924
	.word	535831015
	.word	568993252
	.word	669133538
	.word	802565596
	.word	836643311
	.word	537460736
	.word	2555969
	.word	-246096513
	.word	-345637593
	.word	-80348867
	.word	-179572403
	.word	-279189653
	.word	-412097414
	.word	0
	.word	-62719154
	.word	-62392248
	.word	37486391
	.word	-112788917
	.word	-128328073
	.word	-45408236
	.word	504812671
	.word	0
	.word	570170634
	.word	637219811
	.word	670512350
	.word	1170621377
	.word	754655239
	.word	937631745
	.word	6948
	.word	0
	.word	-277879694
	.word	-94765488
	.word	-61671595
	.word	-128843960
	.word	88080707
	.word	154665029
	.word	21301061
	.word	0
	.word	1169768385
	.word	1119899062
	.word	920204509
	.word	703996928
	.word	687808014
	.word	471471909
	.word	204933953
	.word	0
	.word	-28707736
	.word	-144973441
	.word	-179505620
	.word	-164301255
	.word	-147132344
	.word	-112853947
	.word	-78973098
	.word	0
	.word	3603261
	.word	3866428
	.word	-46270397
	.word	-413863350
	.word	-79624908
	.word	37290045
	.word	-146410170
	.word	305594368
	.word	568795874
	.word	618931940
	.word	652550894
	.word	602940146
	.word	553133562
	.word	587210250
	.word	470948377
	.word	489226240
	.word	-112854461
	.word	-263324096
	.word	37616195
	.word	-46136775
	.word	-46006974
	.word	4065587
	.word	-12386745
	.word	-28639232
	.word	635381724
	.word	685450978
	.word	786377442
	.word	686305763
	.word	653535478
	.word	654126843
	.word	521411870
	.word	422313984
	.word	53937976
	.word	121047101
	.word	37943074
	.word	18877215
	.word	87359031
	.word	-29163447
	.word	-128385024
	.word	0
	.word	-62455750
	.word	121438208
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	4915784
	.word	139264000
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-12126392
	.word	238813184
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	204475185
	.word	439156736
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-46858172
	.word	-112527528
	.word	53741316
	.word	168300808
	.word	269681445
	.word	-12715191
	.word	-12125106
	.word	0
	.word	153686553
	.word	153093419
	.word	154075180
	.word	3342894
	.word	321322050
	.word	254151722
	.word	153223257
	.word	0
	.word	237179423
	.word	287511838
	.word	288166954
	.word	304945946
	.word	271976258
	.word	272108361
	.word	172226164
	.word	0
	.word	270860335
	.word	304286501
	.word	204016169
	.word	36703273
	.word	220790843
	.word	53613352
	.word	54661682
	.word	0
	.word	370546454
	.word	454369556
	.word	438050328
	.word	455217706
	.word	421990962
	.word	205919542
	.word	239536979
	.word	0
	.word	0
	.word	0
	.word	-79233000
	.word	-14352854
	.word	-30083271
	.word	-96469951
	.word	-62654126
	.word	0
	.word	-78251439
	.word	-162662063
	.word	-279908791
	.word	-62196141
	.word	-146278589
	.word	-12715966
	.word	-230555589
	.word	37421056
	.word	301342963
	.word	720843259
	.word	889208835
	.word	1141522971
	.word	792264704
	.word	0
	.word	0
	.word	0
	.word	-44958388
	.word	-112657842
	.word	-196545980
	.word	-45680052
	.word	-79496386
	.word	3800125
	.word	-147062474
	.word	37355520
	.word	301342963
	.word	720843259
	.word	889208835
	.word	1141522971
	.word	792264704
	.word	0
	.word	0
	.word	0
	.word	-595595429
	.word	-228595884
	.word	-413731751
	.word	-279191169
	.word	-229839257
	.word	-212149377
	.word	0
	.word	0
	.word	189793612
	.word	39060814
	.word	-395056558
	.word	-146931659
	.word	3928661
	.word	-212208802
	.word	-178461825
	.word	0
	.word	-61410216
	.word	-78447288
	.word	-62654392
	.word	-262539451
	.word	-12909246
	.word	70908999
	.word	-28900806
	.word	-11927552
	.word	69664810
	.word	119671581
	.word	136250917
	.word	120193832
	.word	136383787
	.word	220464175
	.word	53936698
	.word	104595456
	.word	-360716417
	.word	-411507329
	.word	-311236235
	.word	-411638155
	.word	-395189130
	.word	-512173188
	.word	-161549978
	.word	-161284096
	.word	301142263
	.word	301210603
	.word	635578840
	.word	718745809
	.word	669003480
	.word	885862103
	.word	886647789
	.word	537591808
	.word	-97057731
	.word	-229385345
	.word	-345705927
	.word	-196872889
	.word	-162665643
	.word	-262608536
	.word	-245179521
	.word	0
	.word	-64159931
	.word	4127027
	.word	-63964630
	.word	-47580619
	.word	139261774
	.word	-179107532
	.word	4455258
	.word	0
	.word	137104172
	.word	237635376
	.word	70779956
	.word	220530993
	.word	322570800
	.word	204275781
	.word	337709119
	.word	0
	.word	-211104129
	.word	-77852359
	.word	-78187682
	.word	-195297715
	.word	4718409
	.word	71366993
	.word	88084281
	.word	0
	.word	1036597458
	.word	1053708733
	.word	770450430
	.word	470753793
	.word	654384657
	.word	338039341
	.word	255197263
	.word	0
	.word	-78645912
	.word	-178527617
	.word	-162334672
	.word	-130156478
	.word	-112790965
	.word	-162531501
	.word	-195236244
	.word	0
	.word	21229896
	.word	-78907312
	.word	-346821824
	.word	-216012992
	.word	-480376501
	.word	289405002
	.word	-81527269
	.word	224067584
	.word	602808807
	.word	486348810
	.word	452993778
	.word	886319080
	.word	319889177
	.word	605886497
	.word	571416084
	.word	373882880
	.word	21168196
	.word	-163380924
	.word	5046848
	.word	4520782
	.word	121046331
	.word	37817910
	.word	254543164
	.word	38141952
	.word	619718130
	.word	636428289
	.word	571415823
	.word	404300310
	.word	521151250
	.word	521937193
	.word	605821743
	.word	356384768
	.word	4324943
	.word	4783196
	.word	-61871547
	.word	-263455174
	.word	20640590
	.word	-145490863
	.word	-211615744
	.word	0
	.word	54655301
	.word	139264000
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	337777439
	.word	455868416
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-28512682
	.word	205914112
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	304026394
	.word	605552640
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-96992444
	.word	-129502366
	.word	-212731354
	.word	-213976518
	.word	-29626295
	.word	-162729130
	.word	-145492393
	.word	0
	.word	-163445954
	.word	-45814703
	.word	1966343
	.word	-48764086
	.word	272820604
	.word	287649006
	.word	853469823
	.word	0
	.word	319819556
	.word	254022940
	.word	420814356
	.word	520887056
	.word	405405789
	.word	238554937
	.word	438757503
	.word	0
	.word	88142918
	.word	188155192
	.word	4522561
	.word	-95812298
	.word	121043532
	.word	-179110323
	.word	-28501718
	.word	0
	.word	404167440
	.word	404627229
	.word	371791402
	.word	272371508
	.word	238814030
	.word	-260369099
	.word	372775229
	.word	0
	.word	0
	.word	0
	.word	-146278107
	.word	-131271375
	.word	-164039621
	.word	-130025661
	.word	-96143793
	.word	0
	.word	-45156278
	.word	-146213304
	.word	-297012153
	.word	-180356282
	.word	-280235448
	.word	-263981003
	.word	-230951116
	.word	-180092928
	.word	167649014
	.word	536617471
	.word	554114828
	.word	622272294
	.word	339738624
	.word	0
	.word	0
	.word	0
	.word	-45156278
	.word	-146213304
	.word	-297012153
	.word	-180356282
	.word	-280235448
	.word	-263981003
	.word	-230951116
	.word	-180092928
	.word	167649014
	.word	536617471
	.word	554114828
	.word	622272294
	.word	339738624
	.word	0
	.word	0
	.word	0
	.type	CalcZeroNum, %object
	.size	CalcZeroNum, 256
CalcZeroNum:
	.byte	8
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
	.type	g_AspecRatioIdc, %object
	.size	g_AspecRatioIdc, 112
g_AspecRatioIdc:
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"list[%d][%d]: frame_num=%d, poc=%d\012\000" )
.LC1:
	ASCII(.ascii	"L0: \000" )
	.space	3
.LC2:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%d \000" )
.LC4:
	ASCII(.ascii	"%dt \000" )
	.space	3
.LC5:
	ASCII(.ascii	"%db \000" )
	.space	3
.LC6:
	ASCII(.ascii	"L1:\000" )
.LC7:
	ASCII(.ascii	"\012\012END of the bit buffer, copy the first packe" )
	ASCII(.ascii	"t!\012\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"0:phy:0x%x, len0:%d\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"%-50s%50d\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"%s DPB.fs[%d] = NULL\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"%s pstLogicFs = NULL!\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"%s LogicFs FsState %d invalid!\012\000" )
.LC14:
	ASCII(.ascii	"not used frame: (%d,%d)\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"frame skip: is_used=%d,skip=%d\012\000" )
.LC16:
	ASCII(.ascii	"topfield skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"bottom field skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"Chan:%d exg_pts: %lld <-> %lld\012\000" )
.LC20:
	ASCII(.ascii	"stream frame packing type is %d! what can we do?\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC21:
	ASCII(.ascii	"../../core/syntax/h264.c\000" )
	.space	3
.LC22:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%" )
	ASCII(.ascii	"p, pdfs=%p)\012\000" )
.LC25:
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC26:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC28:
	ASCII(.ascii	"slice_type %d invalid, clear current slice.\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"pRepairPic(%p)/found(%d) = 0, clear current slice.\012" )
	ASCII(.ascii	"\000" )
.LC30:
	ASCII(.ascii	"listXsize[%d] = %d, clear current slice.\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"for P slice size of list equal 0.\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"for B slice size of two list all equal 0.\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"init list error.\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"L0: list after init.\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"L0: list after reorder.\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstPmv = %p\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"line: %d pstLogicFs is null\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"SH: first_mb_in_slice\000" )
	.space	2
.LC41:
	ASCII(.ascii	"slicecheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC e" )
	ASCII(.ascii	"rror.\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"SH: slice_type\000" )
	.space	1
.LC43:
	ASCII(.ascii	"slice type = %d\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	"slice type = %d, err\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"slice  pps id = %d\012\000" )
.LC46:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC47:
	ASCII(.ascii	"sps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"tmp slice  pps id = %d\012\000" )
.LC49:
	ASCII(.ascii	"PPSSPSCheckTmpId: pps with this pic_parameter_set_i" )
	ASCII(.ascii	"d = %d havn't decode\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"PPSSPSCheckTmpId: seq_parameter_set_id out of range" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC51:
	ASCII(.ascii	"PPSSPSCheckTmpId: sps with this pic_parameter_set_i" )
	ASCII(.ascii	"d = %d havn't decode\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"new pic flag = %d\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l0\000" )
.LC54:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l0\000" )
	.space	2
.LC55:
	ASCII(.ascii	"reorder idc l0 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC56:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l0\000" )
	.space	1
.LC57:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC58:
	ASCII(.ascii	"SH: long_term_pic_idx_l0\000" )
	.space	3
.LC59:
	ASCII(.ascii	"num of idc l0 exceed\012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l1\000" )
.LC61:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l1\000" )
	.space	2
.LC62:
	ASCII(.ascii	"reorder idc l1 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l1\000" )
	.space	1
.LC64:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC65:
	ASCII(.ascii	"SH: long_term_pic_idx_l1\000" )
	.space	3
.LC66:
	ASCII(.ascii	"num of idc l1 exceed\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	"SH: luma_log2_weight_denom\000" )
	.space	1
.LC68:
	ASCII(.ascii	"SH: chroma_log2_weight_denom\000" )
	.space	3
.LC69:
	ASCII(.ascii	"WP log2 exceed  and err flag = %d\012\000" )
	.space	1
.LC70:
	ASCII(.ascii	"SH: luma_weight_flag_l0\000" )
.LC71:
	ASCII(.ascii	"SH: luma_weight_l0\000" )
	.space	1
.LC72:
	ASCII(.ascii	"SH: luma_offset_l0\000" )
	.space	1
.LC73:
	ASCII(.ascii	"SH: chroma_weight_flag_l0\000" )
	.space	2
.LC74:
	ASCII(.ascii	"SH: chroma_weight_l0\000" )
	.space	3
.LC75:
	ASCII(.ascii	"SH: chroma_offset_l0\000" )
	.space	3
.LC76:
	ASCII(.ascii	"SH: luma_weight_flag_l1\000" )
.LC77:
	ASCII(.ascii	"SH: luma_weight_l1\000" )
	.space	1
.LC78:
	ASCII(.ascii	"SH: luma_offset_l1\000" )
	.space	1
.LC79:
	ASCII(.ascii	"SH: chroma_weight_flag_l1\000" )
	.space	2
.LC80:
	ASCII(.ascii	"SH: chroma_weight_l1\000" )
	.space	3
.LC81:
	ASCII(.ascii	"SH: chroma_offset_l1\000" )
	.space	3
.LC82:
	ASCII(.ascii	"overflow MAX_MMCO_LEN\012\000" )
	.space	1
.LC83:
	ASCII(.ascii	"SH: memory_management_control_operation\000" )
.LC84:
	ASCII(.ascii	"SH: difference_of_pic_nums_minus1\000" )
	.space	2
.LC85:
	ASCII(.ascii	"SH: long_term_pic_num\000" )
	.space	2
.LC86:
	ASCII(.ascii	"SH: long_term_frame_idx\000" )
.LC87:
	ASCII(.ascii	"SH: max_long_term_frame_idx_plus1\000" )
	.space	2
.LC88:
	ASCII(.ascii	"mmco exceed 6\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"SH: no_output_of_prior_pics_flag\000" )
	.space	3
.LC90:
	ASCII(.ascii	"SH: long_term_reference_flag\000" )
	.space	3
.LC91:
	ASCII(.ascii	"SH: adaptive_ref_pic_marking_mode_flag\000" )
	.space	1
.LC92:
	ASCII(.ascii	"MMCO para would save dec err\012\000" )
	.space	2
.LC93:
	ASCII(.ascii	"mulitislice diff no_out_of_prior_pics_flag, used fi" )
	ASCII(.ascii	"rst.\012\000" )
	.space	3
.LC94:
	ASCII(.ascii	"mulitislice diff long_term_reference_flag, used fir" )
	ASCII(.ascii	"st.\012\000" )
.LC95:
	ASCII(.ascii	"mulitislice diff adaptive_ref_pic_marking_mode_flag" )
	ASCII(.ascii	", used first.\012\000" )
	.space	2
.LC96:
	ASCII(.ascii	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\012\000" )
	.space	1
.LC97:
	ASCII(.ascii	"SH: pic_parameter_set_id\000" )
	.space	3
.LC98:
	ASCII(.ascii	"pps id:%d in sliceheader err\012\000" )
	.space	2
.LC99:
	ASCII(.ascii	"PPS or SPS of this slice not valid\012\000" )
.LC100:
	ASCII(.ascii	"recover point but isn't I_SLICE.\012\000" )
	.space	2
.LC101:
	ASCII(.ascii	"SH: frame_num\000" )
	.space	2
.LC102:
	ASCII(.ascii	"IDR NAL but frame_num!=0.\012\000" )
	.space	1
.LC103:
	ASCII(.ascii	"SH: field_pic_flag\000" )
	.space	1
.LC104:
	ASCII(.ascii	"SH: bottom_field_flag\000" )
	.space	2
.LC105:
	ASCII(.ascii	"field first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC106:
	ASCII(.ascii	"frame first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC107:
	ASCII(.ascii	"SH: idr_pic_id\000" )
	.space	1
.LC108:
	ASCII(.ascii	"idr_pic_id bigger than 65535\012\000" )
	.space	2
.LC109:
	ASCII(.ascii	"SH: pic_order_cnt_lsb\000" )
	.space	2
.LC110:
	ASCII(.ascii	"SH: delta_pic_order_cnt_bottom\000" )
	.space	1
.LC111:
	ASCII(.ascii	"SH: delta_pic_order_cnt[0]\000" )
	.space	1
.LC112:
	ASCII(.ascii	"SH: delta_pic_order_cnt[1]\000" )
	.space	1
.LC113:
	ASCII(.ascii	"SH: redundant_pic_cnt\000" )
	.space	2
.LC114:
	ASCII(.ascii	"redundant pic not support.\012\000" )
.LC115:
	ASCII(.ascii	"first_mb_in_slice in currslice small than prevslice" )
	ASCII(.ascii	" in same pic\012\000" )
	.space	3
.LC116:
	ASCII(.ascii	"SH: direct_spatial_mv_pred_flag\000" )
.LC117:
	ASCII(.ascii	"SH: num_ref_idx_override_flag\000" )
	.space	2
.LC118:
	ASCII(.ascii	"SH: num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC119:
	ASCII(.ascii	"SH: num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC120:
	ASCII(.ascii	"frame num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC121:
	ASCII(.ascii	"field num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC122:
	ASCII(.ascii	"reordering para dec err\012\000" )
	.space	3
.LC123:
	ASCII(.ascii	"apply_weights_flag=%d\012\000" )
	.space	1
.LC124:
	ASCII(.ascii	"wpt dec err\012\000" )
	.space	3
.LC125:
	ASCII(.ascii	"mark para dec err\012\000" )
	.space	1
.LC126:
	ASCII(.ascii	"SH: cabac_init_idc\000" )
	.space	1
.LC127:
	ASCII(.ascii	"cabac_init_idc bigger than 3\012\000" )
	.space	2
.LC128:
	ASCII(.ascii	"SH: slice_qp_delta\000" )
	.space	1
.LC129:
	ASCII(.ascii	"SH: disable_deblocking_filter_idc\000" )
	.space	2
.LC130:
	ASCII(.ascii	"disable_deblocking_filter_idc dec err\012\000" )
	.space	1
.LC131:
	ASCII(.ascii	"SH: slice_alpha_c0_offset_div2\000" )
	.space	1
.LC132:
	ASCII(.ascii	"slice_alpha_c0_offset_div2 dec err\012\000" )
.LC133:
	ASCII(.ascii	"SH: slice_beta_offset_div2\000" )
	.space	1
.LC134:
	ASCII(.ascii	"slice_beta_offset_div2 dec err\012\000" )
.LC135:
	ASCII(.ascii	"pH264Ctx->pCurrNal->nal_bitoffset = %d; code_len_by" )
	ASCII(.ascii	"te = %d; bitstream_length = %d; pH264Ctx->pCurrNal-" )
	ASCII(.ascii	">nal_trail_zero_bit_num = %d\012\000" )
.LC136:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; byt" )
	ASCII(.ascii	"espos = %x\012\000" )
	.space	1
.LC137:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC138:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\012\000" )
.LC139:
	ASCII(.ascii	"   : delta_sl   \000" )
	.space	3
.LC140:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC141:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC142:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC143:
	ASCII(.ascii	"Baseline stream with FMO, not support.\012\000" )
.LC144:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC145:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC146:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC147:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC148:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC149:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC150:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC151:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC152:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC153:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC154:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC155:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC156:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC157:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC158:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC159:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC160:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC161:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC162:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC163:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC164:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC165:
	ASCII(.ascii	"pic_parameter_set_id out of range.\012\000" )
.LC166:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC167:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC168:
	ASCII(.ascii	"SPS haven't decode.\012\000" )
	.space	3
.LC169:
	ASCII(.ascii	"%s: PPS decode error 1.\012\000" )
	.space	3
.LC170:
	ASCII(.ascii	"%s: PPS decode error 2.\012\000" )
	.space	3
.LC171:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC172:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC173:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC174:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC175:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC176:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC177:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC178:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC179:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC180:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC181:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC182:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC183:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC184:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC185:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC186:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC187:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC188:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC189:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC190:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC191:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC192:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC193:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC194:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC195:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC196:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC197:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC198:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC199:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC200:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC201:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC202:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC203:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC204:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC205:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC206:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC207:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC208:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC209:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC210:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC211:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC212:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC213:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC214:
	ASCII(.ascii	"dar=%d, final_dar=%d\012\000" )
	.space	2
.LC215:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC216:
	ASCII(.ascii	"pSPS->chroma_format_idc = %d out of range.\012\000" )
.LC217:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC218:
	ASCII(.ascii	"bit_depth_luma(%d) not equal 8.\012\000" )
	.space	3
.LC219:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC220:
	ASCII(.ascii	"bit_depth_chroma(%d) not equal 8.\012\000" )
	.space	1
.LC221:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC222:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC223:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC224:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC225:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC226:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC227:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC228:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC229:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC230:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC231:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC232:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC233:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC234:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC235:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC236:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC237:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC238:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC239:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC240:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC241:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC242:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC243:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC244:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC245:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC246:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC247:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC248:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC249:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC250:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC251:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC252:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC253:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC254:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC255:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC256:
	ASCII(.ascii	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_" )
	ASCII(.ascii	"present_flag\000" )
.LC257:
	ASCII(.ascii	"inter_layer_present_flag:%d!\012\000" )
	.space	2
.LC258:
	ASCII(.ascii	"SPS_SVC_EXT: extended_spatial_scalability_idc\000" )
	.space	2
.LC259:
	ASCII(.ascii	"spatial scalability not support!!\012\000" )
	.space	1
.LC260:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_x_plus1_flag\000" )
	.space	1
.LC261:
	ASCII(.ascii	"chroma_phase_x_plus1_flag:%d!!\012\000" )
.LC262:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_y_plus1\000" )
	.space	2
.LC263:
	ASCII(.ascii	"chroma_phase_y_plus1:%d!\012\000" )
	.space	2
.LC264:
	ASCII(.ascii	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag\000" )
	.space	2
.LC265:
	ASCII(.ascii	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag\000" )
	.space	1
.LC266:
	ASCII(.ascii	"adaptive_tcoeff_level_prediction_flag:%d!\012\000" )
	.space	1
.LC267:
	ASCII(.ascii	"SPS_SVC_EXT: slice_header_restriction_flag\000" )
	.space	1
.LC268:
	ASCII(.ascii	"slice_header_restriction_flag error:%d,%x,%d\012\000" )
	.space	2
.LC269:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC270:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC271:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC272:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC273:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC274:
	ASCII(.ascii	"SPS: reserved_zero_4bits\000" )
	.space	3
.LC275:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC276:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC277:
	ASCII(.ascii	"Baseline stream, try to decode, exit when FMO occur" )
	ASCII(.ascii	"red.\012\000" )
	.space	3
.LC278:
	ASCII(.ascii	"EXTENDED stream, try to decode, exit when dataparti" )
	ASCII(.ascii	"tion occurred.\012\000" )
	.space	1
.LC279:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC280:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC281:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC282:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC283:
	ASCII(.ascii	"svc ext error:\012\000" )
.LC284:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC285:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC286:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC287:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC288:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC289:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC290:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC291:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC292:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC293:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC294:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC295:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC296:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC297:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC298:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC299:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC300:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC301:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC302:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC303:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC304:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC305:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC306:
	ASCII(.ascii	"SEI nal parse payload type error\012\000" )
	.space	2
.LC307:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC308:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC309:
	ASCII(.ascii	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC310:
	ASCII(.ascii	"PassBytes err [%s][%d]\012\000" )
.LC311:
	ASCII(.ascii	"SEI_PIC_TIMING,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC312:
	ASCII(.ascii	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC313:
	ASCII(.ascii	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC314:
	ASCII(.ascii	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, pa" )
	ASCII(.ascii	"yload_size = %d \012\000" )
	.space	3
.LC315:
	ASCII(.ascii	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_si" )
	ASCII(.ascii	"ze = %d \012\000" )
	.space	3
.LC316:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC317:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC318:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC319:
	ASCII(.ascii	"len_tmp = %d cann't dec usrdata\012\000" )
	.space	3
.LC320:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC321:
	ASCII(.ascii	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC322:
	ASCII(.ascii	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC323:
	ASCII(.ascii	"SEI_SPARE_PIC,offset = %d,payload_size = %d \012\000" )
	.space	2
.LC324:
	ASCII(.ascii	"SEI_SCENE_INFO,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC325:
	ASCII(.ascii	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC326:
	ASCII(.ascii	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC327:
	ASCII(.ascii	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC328:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC329:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_s" )
	ASCII(.ascii	"ize = %d \012\000" )
	.space	2
.LC330:
	ASCII(.ascii	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = " )
	ASCII(.ascii	"%d \012\000" )
.LC331:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC332:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC333:
	ASCII(.ascii	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC334:
	ASCII(.ascii	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_" )
	ASCII(.ascii	"size = %d \012\000" )
	.space	1
.LC335:
	ASCII(.ascii	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC336:
	ASCII(.ascii	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC337:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC338:
	ASCII(.ascii	"%s, %d\012\000" )
.LC339:
	ASCII(.ascii	"\012the stream is error,len:%d\012\000" )
	.space	3
.LC340:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC341:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC342:
	ASCII(.ascii	"H264 recycle image\012\000" )
.LC343:
	ASCII(.ascii	"pH264Ctx is %p, pFrameStore is %p\012\000" )
	.space	1
.LC344:
	ASCII(.ascii	"line; %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC345:
	ASCII(.ascii	"InsertVO err:%d, ClearAll\012\000" )
	.space	1
.LC346:
	ASCII(.ascii	"H264.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC347:
	ASCII(.ascii	"line: %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC348:
	ASCII(.ascii	"%s:%d fs is null, return err\012\000" )
	.space	2
.LC349:
	ASCII(.ascii	"[%s][%d] OutputFrmToVO return %d\012\000" )
	.space	2
.LC350:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC351:
	ASCII(.ascii	"----------------- Imode -> %d ------------------\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC352:
	ASCII(.ascii	"I_MODE but first_mb_in_slice != 0\012\000" )
	.space	1
.LC353:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC354:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic." )
	ASCII(.ascii	"structure=%d.\012\000" )
	.space	2
.LC355:
	ASCII(.ascii	"DecVDM ERR\012\000" )
.LC356:
	ASCII(.ascii	"%s:%d Metadata map failed\012\000" )
	.space	1
.LC357:
	ASCII(.ascii	"%s:%d Metadata unmap failed\012\000" )
	.space	3
.LC358:
	ASCII(.ascii	"*****[%s][%d],EL Codec can only dec EL stream in DV" )
	ASCII(.ascii	"_DUAL_VES_IMP stream!!*****\012\000" )
.LC359:
	ASCII(.ascii	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC360:
	ASCII(.ascii	"%s, %d: DecVDM failed\012\000" )
	.space	1
.LC361:
	ASCII(.ascii	"\012 receive streambuff=%p; phy_addr=0x%x; bitstrea" )
	ASCII(.ascii	"m_length=%d\012\000" )
	.space	3
.LC362:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC363:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC364:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC365:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC366:
	ASCII(.ascii	"[%s %d], pos is %d out of range\012\000" )
	.space	3
.LC367:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC368:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC369:
	ASCII(.ascii	"CurrPic.state is 'EMPTY'\012\000" )
	.space	2
.LC370:
	ASCII(.ascii	"StorePicInDPB return(%d) from L%d\012\000" )
	.space	1
.LC371:
	ASCII(.ascii	"directoutput mode\012\000" )
	.space	1
.LC372:
	ASCII(.ascii	"line: %d pImg is NULL!\012\000" )
.LC373:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC374:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC375:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC376:
	ASCII(.ascii	"marking return %d\012\000" )
	.space	1
.LC377:
	ASCII(.ascii	"return value is unexpeced!\012\000" )
.LC378:
	ASCII(.ascii	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
.LC379:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC380:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC381:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC382:
	ASCII(.ascii	"GAP found while DPB is empty!\012\000" )
	.space	1
.LC383:
	ASCII(.ascii	"frame num gap try to fill it \012\000" )
	.space	1
.LC384:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC385:
	ASCII(.ascii	"cann't allocate frame store when gap find\012\000" )
	.space	1
.LC386:
	ASCII(.ascii	"allocate frame store when gap find\012\000" )
.LC387:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC388:
	ASCII(.ascii	"%s %d unknow error!!\012\000" )
	.space	2
.LC389:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC390:
	ASCII(.ascii	"%s %d frame_store is null!!\012\000" )
	.space	3
.LC391:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC392:
	ASCII(.ascii	"mem arrange err, ClearAll\012\000" )
	.space	1
.LC393:
	ASCII(.ascii	"line %d: frame gap(=%d) > dpb size(=%d)\012\000" )
	.space	3
.LC394:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC395:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC396:
	ASCII(.ascii	"Chan:%d dec_pts: %lld\012\000" )
	.space	1
.LC397:
	ASCII(.ascii	"Chan:%d dec_usertag: %lld\012\000" )
	.space	1
.LC398:
	ASCII(.ascii	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\012\000" )
	.space	1
.LC399:
	ASCII(.ascii	"%s set fs store type failed.\012\000" )
	.space	2
.LC400:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC401:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC402:
	ASCII(.ascii	"DecList error, ret=%d\012\000" )
	.space	1
.LC403:
	ASCII(.ascii	"dec list err, cur pic poc %d.\012\000" )
	.space	1
.LC404:
	ASCII(.ascii	"Too many slice %d > MaxSliceNum %d, discrad this pi" )
	ASCII(.ascii	"c.\012\000" )
	.space	1
.LC405:
	ASCII(.ascii	"Too many stream %d > MaxStreamThr %d, discrad this " )
	ASCII(.ascii	"pic.\012\000" )
	.space	3
.LC406:
	ASCII(.ascii	"pH264Ctx->TotalNal = %d, type:%d\012\000" )
	.space	2
.LC407:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC408:
	ASCII(.ascii	"svc_extension_flag error:priority_id:%d, pred_flag%" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC409:
	ASCII(.ascii	"%d,%d,%d\012\000" )
	.space	2
.LC410:
	ASCII(.ascii	"svc stream,nal_header:%x\012\000" )
	.space	2
.LC411:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC412:
	ASCII(.ascii	"SliceCheck failed, clear current slice.\012\000" )
	.space	3
.LC413:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC414:
	ASCII(.ascii	"%s: PPS decode error.\012\000" )
	.space	1
.LC415:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC416:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC417:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC418:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC419:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC420:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC421:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC422:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC423:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC424:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC425:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC426:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC427:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d\012\000" )
.LC428:
	ASCII(.ascii	"FindTrailZeros ERR\012\000" )
.LC429:
	ASCII(.ascii	"H264_DecOneNal ERR\012\000" )
.LC430:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC431:
	ASCII(.ascii	"VDMDRV_GetUvMOSParam failed\012\000" )
	.space	3
.LC432:
	ASCII(.ascii	"pH264Ctx->CurrPic.frame_store is null pointer\012\000" )
	.space	1
.LC433:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC434:
	ASCII(.ascii	"imode nal store pic err, ret = %d\012\000" )
	.space	1
.LC435:
	ASCII(.ascii	"imode nal flush dpb err, ret = %d\012\000" )
	.space	1
.LC436:
	ASCII(.ascii	"CtbNumOneFrame=%d, SedEnd0=%d\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.13706, %object
	.size	pps_tmp.13706, 2208
pps_tmp.13706:
	.space	2208
	.type	sps_tmp.13856, %object
	.size	sps_tmp.13856, 4000
sps_tmp.13856:
	.space	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.space	68
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
