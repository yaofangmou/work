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
	ldr	r2, [r2, #664]
	ldr	r3, [r3, #664]
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
	ldr	r2, [r2, #668]
	ldr	r3, [r3, #668]
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
	ldr	r2, [r2, #672]
	ldr	r3, [r3, #672]
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
	ldr	r2, [r2, #672]
	ldr	r3, [r3, #672]
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
	.type	SetFrmRepeatCount.part.7, %function
SetFrmRepeatCount.part.7:
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
	add	ip, r0, #61440
	add	r0, r0, #24576
	ldr	lr, [ip, #2700]
	ldr	r2, [r0, #2136]
	ldr	r3, [ip, #2696]
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
	ldrhi	r3, [ip, #2700]
	ldrls	r3, [ip, #2700]
	addhi	r3, r3, #4
	addls	r3, r3, #2
	str	r3, [ip, #2700]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetFrmRepeatCount.part.7, .-SetFrmRepeatCount.part.7
	.align	2
	.type	DumpList.part.10, %function
DumpList.part.10:
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
	mov	r3, r4
	mov	r2, r6
	ldr	r1, .L64
	mov	r0, #13
	add	r4, r4, #1
	ldr	ip, [ip, #36]
	ldr	lr, [ip, #672]
	str	lr, [sp, #4]
	ldr	ip, [ip, #660]
	str	ip, [sp]
	bl	dprint_vfmw
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
	ldr	r1, .L64+4
	mov	r0, #13
	bl	dprint_vfmw
	ldr	r3, [r5, #252]
	cmp	r3, #0
	addne	r8, r8, #27136
	movne	r4, #0
	addne	r8, r8, #116
	bne	.L50
	b	.L51
.L62:
	bcc	.L48
	cmp	r2, #2
	ldr	r1, .L64+8
	mov	r0, #13
	bne	.L46
	ldr	r3, [r3, #36]
	ldr	r2, [r3, #672]
	bl	dprint_vfmw
.L46:
	ldr	r3, [r5, #252]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L51
.L50:
	ldr	r3, [r8, #4]!
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L62
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+12
	add	r4, r4, #1
	ldr	r2, [r3, #672]
	bl	dprint_vfmw
	ldr	r3, [r5, #252]
	cmp	r4, r3
	bcc	.L50
.L51:
	ldr	r1, .L64+16
	mov	r0, #13
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L48:
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+20
	ldr	r2, [r3, #672]
	bl	dprint_vfmw
	b	.L46
.L60:
	ldr	r1, .L64+24
	mov	r0, #13
	bl	dprint_vfmw
	ldr	r3, [r5, #248]
	cmp	r3, #0
	movne	r4, #0
	bne	.L38
	b	.L43
.L63:
	bcc	.L41
	cmp	r2, #2
	ldr	r1, .L64+8
	mov	r0, #13
	bne	.L39
	ldr	r3, [r3, #36]
	ldr	r2, [r3, #796]
	bl	dprint_vfmw
.L39:
	ldr	r3, [r5, #248]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L43
.L38:
	ldr	r3, [r9, #4]!
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L63
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+12
	add	r4, r4, #1
	ldr	r2, [r3, #756]
	bl	dprint_vfmw
	ldr	r3, [r5, #248]
	cmp	r4, r3
	bcc	.L38
.L43:
	ldr	r1, .L64+16
	mov	r0, #13
	bl	dprint_vfmw
	b	.L37
.L41:
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+20
	ldr	r2, [r3, #672]
	bl	dprint_vfmw
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
	.size	DumpList.part.10, .-DumpList.part.10
	.align	2
	.global	ue_v
	.type	ue_v, %function
ue_v:
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
	add	r7, r0, #13504
	mov	r8, r0
	add	r7, r7, #24
	mov	r6, r1
	mov	r1, #32
	mov	r0, r7
	bl	BsShow
	mov	r5, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r4, r0
	bls	.L70
	cmp	r0, #31
	bls	.L71
	add	r3, r8, #61440
	mvn	r5, #0
	mov	r7, #32
	mov	r2, #1
	str	r2, [r3, #2620]
.L68:
	ldr	ip, [r8, #368]
	mov	r2, r6
	mov	r3, r5
	ldr	r1, .L72
	mov	r0, #21
	ldr	r4, [ip, #64]
	add	r4, r4, r7
	str	r4, [ip, #64]
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L70:
	mov	r4, r0, asl #1
	mov	r0, r7
	add	r7, r4, #1
	rsb	r4, r4, #31
	mov	r4, r5, lsr r4
	mov	r1, r7
	sub	r5, r4, #1
	bl	BsSkip
	b	.L68
.L71:
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
	b	.L68
.L73:
	.align	2
.L72:
	.word	.LC7
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
	add	r6, r0, #13504
	mov	r8, r0
	add	r6, r6, #24
	mov	r7, r1
	mov	r1, #32
	mov	r0, r6
	bl	BsShow
	mov	r4, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r5, r0
	bhi	.L75
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
.L76:
	ldr	lr, [r8, #368]
	mov	r2, r7
	mov	r3, r4
	ldr	r1, .L79
	mov	r0, #21
	ldr	ip, [lr, #64]
	add	r5, ip, r5
	str	r5, [lr, #64]
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L75:
	cmp	r0, #31
	bls	.L78
	add	r3, r8, #61440
	mov	r2, #1
	mvn	r4, #-2147483648
	mov	r5, #32
	str	r2, [r3, #2620]
	b	.L76
.L78:
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
	b	.L76
.L80:
	.align	2
.L79:
	.word	.LC7
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
	mov	r5, r0
	add	r0, r0, #13504
	add	r0, r0, #24
	mov	r6, r1
	mov	r7, r2
	bl	BsGet
	ldr	lr, [r5, #368]
	mov	r2, r7
	ldr	r1, .L82
	ldr	ip, [lr, #64]
	add	ip, ip, r6
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r0, #21
	mov	r3, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L83:
	.align	2
.L82:
	.word	.LC7
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r0
	add	r0, r0, #13504
	mov	r6, r1
	add	r0, r0, #24
	mov	r1, #1
	bl	BsGet
	ldr	lr, [r5, #368]
	mov	r2, r6
	ldr	r1, .L85
	ldr	ip, [lr, #64]
	add	ip, ip, #1
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	.LC7
	UNWIND(.fnend)
	.size	u_1, .-u_1
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L96
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #4]
.L91:
	ldr	r3, [r4, #8]
	mov	r0, r6
	cmp	r3, #0
	beq	.L90
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	mov	r0, #7
	ldr	r1, .L97
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
.L90:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L91
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L96:
	mov	r0, r5
	movw	r3, #422
	ldr	r2, .L97+4
	ldr	r1, .L97+8
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L98:
	.align	2
.L97:
	.word	.LC10
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	ReleaseNAL, .-ReleaseNAL
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
.L103:
	ldr	ip, [r0, #4]!
	ldr	r4, [r1]
	ldr	lr, [ip, #672]
	cmp	r4, lr
	ble	.L102
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	strne	lr, [r1]
	strne	r3, [r2]
.L102:
	ldr	ip, [r5, #2140]
	add	r3, r3, #1
	cmp	ip, r3
	bhi	.L103
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMinPOC, .-GetMinPOC
	.align	2
	.global	RemoveFrameStoreOutDPB
	.type	RemoveFrameStoreOutDPB, %function
RemoveFrameStoreOutDPB:
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
	add	r7, r0, r1, lsl #2
	mov	r4, r1
	add	r7, r7, #24576
	mov	r5, r0
	ldr	r2, [r7, #1944]
	cmp	r2, #0
	beq	.L129
	ldr	r3, [r2, #696]
	add	r6, r0, #24576
	mov	r1, #0
	add	r8, r0, #61440
	add	r3, r3, #6656
	add	r3, r3, #26
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #4]
	ldr	r3, [r6, #2416]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r6, #2416]
	ldr	r1, [r2, #656]
	ldr	r0, [r8, #2680]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L112
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L113
	ldr	r3, [r7, #1944]
	mov	r2, #0
	ldr	r0, [r8, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
.L113:
	ldr	r3, [r7, #1944]
	mov	r2, #0
	ldr	r0, [r8, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetRef
.L112:
	ldr	r1, [r7, #1944]
	mov	r3, #0
	mvn	r2, #0
	strb	r3, [r1, #1]
	ldr	r1, [r7, #1944]
	strb	r3, [r1, #4]
	ldr	r1, [r7, #1944]
	strb	r3, [r1, #2]
	ldr	r3, [r7, #1944]
	str	r2, [r3, #656]
	ldr	r1, [r6, #2140]
	add	r1, r1, r2
	cmp	r4, r1
	addcc	r2, r4, #6592
	addcc	r2, r2, #38
	addcc	r2, r5, r2, lsl #2
	bcs	.L117
.L116:
	add	r4, r4, #1
	ldr	r3, [r2, #4]!
	cmp	r4, r1
	str	r3, [r2, #-4]
	bne	.L116
.L117:
	add	r3, r1, #6592
	mov	r2, #0
	add	r3, r3, #38
	str	r2, [r5, r3, asl #2]
	str	r1, [r6, #2140]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L129:
	mov	r3, r1
	ldr	r2, .L130
	ldr	r1, .L130+4
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L131:
	.align	2
.L130:
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
	beq	.L142
	add	r3, r6, #24576
	ldr	r7, [r3, #2140]
	cmp	r7, #0
	addne	r8, r6, #61440
	movne	r5, #0
	movne	r9, r5
	movne	r10, r5
	bne	.L140
	b	.L141
.L151:
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L138
	ldr	r0, [r2, #824]
	cmp	r0, #1
	beq	.L138
	strb	r1, [r2, #1]
	mov	r0, r6
	mov	r1, r5
	add	r9, r9, #1
	bl	RemoveFrameStoreOutDPB
	cmp	r9, r7
	beq	.L141
.L140:
	add	r4, r6, r5, lsl #2
	ldr	r0, [r8, #2680]
	add	r4, r4, #24576
	ldr	r2, [r4, #1944]
	ldr	r1, [r2, #656]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L135
	ldrsh	r2, [r0]
	cmp	r2, #0
	bne	.L136
	ldr	r1, [r4, #1944]
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L137
	ldrsb	r0, [r0]
	cmp	r0, #0
	bne	.L150
.L137:
	mvn	r3, #0
	str	r3, [r1, #656]
	ldr	r2, [r4, #1944]
	strb	r10, [r2, #2]
.L135:
	ldr	r1, [r4, #1944]
	ldr	r2, [r1, #824]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r1, #4]
.L136:
	ldr	r2, [r4, #1944]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L151
.L138:
	add	r9, r9, #1
	add	r5, r5, #1
	cmp	r9, r7
	bne	.L140
.L141:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L150:
	ldr	r1, [r1, #656]
	ldr	r0, [r8, #2680]
	bl	FSP_SetRef
	ldr	r1, [r4, #1944]
	b	.L137
.L142:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	RemoveUnUsedFrameStore, .-RemoveUnUsedFrameStore
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
	beq	.L153
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #745]
	and	r2, r2, #2
	strb	ip, [r1, #746]
	strb	r2, [r1, #2]
.L153:
	tst	r3, #2
	beq	.L154
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #785]
	and	r2, r2, #1
	strb	ip, [r1, #786]
	strb	r2, [r1, #2]
.L154:
	cmp	r3, #3
	add	r0, r0, #61440
	moveq	r3, #0
	streqb	r3, [r1, #706]
	streqb	r3, [r1, #705]
	mov	r3, #0
	mov	r2, r3
	strb	r3, [r1, #2]
	ldr	r1, [r1, #656]
	ldr	r0, [r0, #2680]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	UnMarkFrameStoreRef, .-UnMarkFrameStoreRef
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
	mov	r2, #262144
	str	r1, [r0, #1856]
	str	r2, [r0, #1888]
	strb	r3, [r0, #1848]
	str	r3, [r0, #1880]
	str	r3, [r0, #1884]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	InitOldSlice, .-InitOldSlice
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
	add	r4, r0, #61952
	add	r5, r0, #62720
	add	r4, r4, #236
	add	r5, r5, #12
	add	r6, r0, #61440
	mov	r7, #0
.L165:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L164
	ldr	r0, [r6, #2680]
	bl	ReleaseNAL
	str	r7, [r4]
.L164:
	cmp	r4, r5
	bne	.L165
	mov	r0, #0
	str	r0, [r6, #2604]
	str	r0, [r6, #2664]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearAllSlice, .-ClearAllSlice
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
	beq	.L172
	add	r3, r0, #61440
	ldr	r0, [r3, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L172:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearCurrNal, .-ClearCurrNal
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
	add	r6, r0, #61440
	b	.L178
.L177:
	add	r4, r4, #96
	cmp	r4, r5
	beq	.L180
.L178:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L177
	mov	r1, r4
	ldr	r0, [r6, #2680]
	add	r4, r4, #96
	bl	ReleaseNAL
	cmp	r4, r5
	bne	.L178
.L180:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearAllNal, .-ClearAllNal
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
	ldr	r1, .L186
	mov	r5, r0
	mov	r0, #1
	add	r4, r5, #61440
	bl	dprint_vfmw
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L182
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L182:
	ldr	r3, [r4, #2636]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #2636]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L187:
	.align	2
.L186:
	.word	.LC12
	UNWIND(.fnend)
	.size	ClearCurrSlice, .-ClearCurrSlice
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
	subs	r4, r0, #0
	beq	.L191
	bl	ClearAllSlice
	add	r1, r4, #12288
	add	r3, r4, #20480
	mov	r2, #0
	ldr	lr, [r1, #1292]
	movw	r1, #23352
	movt	r1, 1
	mov	ip, #2
	str	r1, [r3, #1864]
	mov	r0, r2
	mov	r1, #7
	strb	ip, [r3, #1849]
	str	r1, [r3, #1860]
	mov	ip, #32
	mov	r1, #3
	strb	ip, [r3, #1850]
	str	r1, [r3, #1872]
	mvn	ip, #0
	mov	r1, #262144
	str	lr, [r3, #1856]
	str	ip, [r3, #1876]
	str	r1, [r3, #1888]
	strb	r2, [r3, #1848]
	str	r2, [r3, #1880]
	str	r2, [r3, #1884]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L191:
	movw	r3, #737
	ldr	r2, .L192
	ldr	r1, .L192+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L193:
	.align	2
.L192:
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
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
.L198:
	ldr	ip, [r0, #4]!
	ldr	lr, [r1]
	ldr	ip, [ip, #672]
	cmp	lr, ip
	strgt	ip, [r1]
	strgt	r3, [r2]
	add	r3, r3, #1
	ldr	ip, [r4, #2140]
	cmp	ip, r3
	bhi	.L198
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
.L205:
	ldr	ip, [r0, #4]!
	ldr	r4, [r1]
	ldr	lr, [ip, #672]
	cmp	r4, lr
	bge	.L204
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	strne	lr, [r1]
	strne	r3, [r2]
.L204:
	ldr	ip, [r5, #2140]
	add	r3, r3, #1
	cmp	ip, r3
	bhi	.L205
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMaxPOC, .-GetMaxPOC
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
	beq	.L226
	tst	r3, #1
	bne	.L227
.L215:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L219
.L216:
	ldr	r0, [r0, #784]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L219:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L227:
	ldr	r2, [r0, #744]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L215
.L220:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L226:
	ldr	r3, [r0, #704]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L220
	ldr	r3, [r0, #744]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	bne	.L216
	b	.L220
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
	beq	.L243
	tst	r3, #1
	bne	.L244
.L232:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L236
.L233:
	ldr	r0, [r0, #784]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L236:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L244:
	ldr	r2, [r0, #744]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L232
.L237:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L243:
	ldr	r3, [r0, #704]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L237
	ldr	r3, [r0, #744]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	bne	.L233
	b	.L237
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
	beq	.L252
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #148
	mov	r5, r4
.L248:
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
	bne	.L248
.L246:
	ldr	r3, [r9, #2136]
	str	r4, [r9, #2148]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6656
	mov	r2, #0
	add	r0, r0, #5
	add	r0, r6, r0, lsl #2
.L250:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L250
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L252:
	mov	r4, r8
	b	.L246
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
	beq	.L265
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #148
	mov	r5, r4
.L261:
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
	bne	.L261
.L259:
	ldr	r3, [r9, #2136]
	str	r4, [r9, #2144]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6592
	mov	r2, #0
	add	r0, r0, #53
	add	r0, r6, r0, lsl #2
.L263:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L263
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L265:
	mov	r4, r8
	b	.L259
	UNWIND(.fnend)
	.size	UpdateReflist, .-UpdateReflist
	.align	2
	.type	SlidingWinMark.part.8, %function
SlidingWinMark.part.8:
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
.L274:
	ldr	r5, [r6, #4]!
	add	r4, r4, #1
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	mov	r0, r5
	cmp	r3, #0
	beq	.L273
	bl	ShortTermRefFlg
	cmp	r0, #0
	bne	.L285
.L273:
	cmp	r4, r7
	bne	.L274
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L285:
	mov	r0, r8
	mov	r1, r5
	bl	UnMarkFrameStoreRef
	mov	r0, r8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	UpdateReflist
	UNWIND(.fnend)
	.size	SlidingWinMark.part.8, .-SlidingWinMark.part.8
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
	ldr	r3, [r0, #664]
	mvn	r0, r1
	movne	r3, r3, asl #1
	addne	r3, r3, #1
	add	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetPicNumX, .-GetPicNumX
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
	ldr	r3, [ip, #668]
	cmp	r3, r1
	addne	r2, r0, #26624
	movne	r3, #0
	addne	r2, r2, #24
	bne	.L293
	b	.L291
.L294:
	ldr	ip, [r2, #4]!
	ldr	lr, [ip, #668]
	cmp	lr, r1
	beq	.L291
.L293:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L294
	ldmfd	sp, {r4, fp, sp, pc}
.L291:
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
	b	.L304
.L302:
	cmp	ip, r6
	beq	.L318
.L304:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldr	r5, [lr, #668]
	cmp	r5, r3
	bne	.L302
	cmp	r2, #1
	ldreqb	r5, [lr, #785]	@ zero_extendqisi2
	beq	.L317
	cmp	r2, #2
	bne	.L302
	ldrb	r5, [lr, #745]	@ zero_extendqisi2
.L317:
	clz	r5, r5
	mov	r5, r5, lsr #5
	cmp	lr, r1
	orrne	r5, r5, #1
	cmp	r5, #0
	beq	.L302
	mov	r1, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L318:
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
	bne	.L320
	add	ip, r0, #24576
	ldr	r1, [r1, #664]
	ldr	r4, [ip, #2144]
	sub	r1, r1, #1
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L349
	add	ip, r0, #26368
	add	ip, ip, #212
	b	.L326
.L325:
	cmp	r3, r4
	beq	.L350
.L326:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #712]
	cmp	lr, r2
	bne	.L325
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L325
	ldr	lr, [r1, #704]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L325
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L320:
	add	r3, r0, #24576
	ldr	r1, [r1, #664]
	ldr	r5, [r3, #2144]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L351
	add	r4, r0, #26368
	mov	ip, #0
	add	r4, r4, #212
	b	.L331
.L327:
	tst	r3, #2
	beq	.L329
	ldr	r3, [r1, #784]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L352
.L329:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L353
.L331:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L327
	ldr	lr, [r1, #744]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L327
	ldr	lr, [r1, #752]
	cmp	lr, r2
	bne	.L327
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #2008]
	strb	r1, [r3, #746]
	ldr	r3, [r2, #2008]
	ldrb	ip, [r3, #704]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #706]
	ldreq	r3, [r2, #2008]
	streqb	r1, [r3, #705]
	ldreq	r3, [r2, #2008]
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r3, #692]
	mov	r2, r1
	add	lr, r0, #61440
	add	ip, ip, #15680
	add	ip, ip, #4
	str	r1, [r0, ip, asl #2]
	ldr	r1, [r3, #656]
.L346:
	ldr	r0, [lr, #2680]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	FSP_SetRef
.L352:
	ldr	r3, [r1, #792]
	cmp	r3, r2
	bne	.L329
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r2, #0
	ldr	r1, [r3, #2008]
	strb	r2, [r1, #786]
	ldr	r1, [r3, #2008]
	ldrb	ip, [r1, #704]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #706]
	ldreq	r1, [r3, #2008]
	streqb	r2, [r1, #705]
	ldreq	r1, [r3, #2008]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r1, #692]
	add	lr, r0, #61440
	mov	r2, r3
	add	ip, ip, #15680
	add	ip, ip, #4
	str	r3, [r0, ip, asl #2]
	ldr	r1, [r1, #656]
	b	.L346
.L353:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L350:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L349:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L351:
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
	beq	.L355
	add	r3, r0, #24576
	ldr	r5, [r3, #2148]
	cmp	r5, #0
	beq	.L383
	add	r4, r0, #26624
	mov	ip, #0
	add	r4, r4, #20
	b	.L364
.L360:
	tst	r3, #2
	beq	.L362
	ldr	r3, [r1, #784]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L384
.L362:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L385
.L364:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L360
	ldr	lr, [r1, #744]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L360
	ldr	lr, [r1, #748]
	cmp	r2, lr
	bne	.L360
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #2072]
	strb	r1, [r3, #745]
	ldr	r3, [r2, #2072]
	ldrb	ip, [r3, #704]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #706]
	ldreq	r3, [r2, #2072]
	streqb	r1, [r3, #705]
	ldreq	r3, [r2, #2072]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r3, [r3, #692]
	addeq	r3, r3, #15680
	addeq	r3, r3, #4
	streq	r2, [r0, r3, asl #2]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L355:
	add	r1, r0, #24576
	ldr	r4, [r1, #2148]
	cmp	r4, #0
	beq	.L386
	add	ip, r0, #26624
	add	ip, ip, #20
	b	.L366
.L365:
	cmp	r3, r4
	beq	.L387
.L366:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #708]
	cmp	lr, r2
	bne	.L365
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L365
	ldr	lr, [r1, #704]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L365
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L384:
	ldr	r3, [r1, #788]
	cmp	r2, r3
	bne	.L362
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r1, #0
	ldr	r2, [r3, #2072]
	strb	r1, [r2, #785]
	ldr	r2, [r3, #2072]
	ldrb	ip, [r2, #704]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r2, #706]
	ldreq	r2, [r3, #2072]
	streqb	r1, [r2, #705]
	ldreq	r2, [r3, #2072]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldreq	r3, [r2, #692]
	addeq	r3, r3, #15680
	addeq	r3, r3, #4
	streq	r1, [r0, r3, asl #2]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L387:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L385:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L386:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L383:
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
	beq	.L389
	ldr	r7, [r3, #2144]
	cmp	r7, #0
	beq	.L418
	add	r6, r0, #26368
	mov	ip, #0
	add	r6, r6, #212
	b	.L403
.L395:
	tst	r4, #2
	beq	.L398
	ldr	lr, [r3, #784]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	beq	.L419
.L398:
	add	ip, ip, #1
	cmp	ip, r7
	beq	.L420
.L403:
	ldr	r3, [r6, #4]!
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L395
	ldr	lr, [r3, #744]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L395
	ldr	lr, [r3, #752]
	cmp	lr, r2
	bne	.L395
	ldrb	lr, [r3, #785]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L399
	ldr	lr, [r3, #668]
	cmp	lr, r1
	bne	.L398
.L399:
	str	r1, [r3, #668]
	sub	r3, r5, #1
	add	r2, r0, ip, lsl #2
	clz	r3, r3
	add	r2, r2, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r0, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r2, #2008]
	str	r1, [r3, #748]
	ldr	r3, [r2, #2008]
	strb	ip, [r3, #745]
	ldr	r3, [r2, #2008]
	strb	r0, [r3, #746]
	ldr	r3, [r2, #2008]
	ldrb	r1, [r3, #704]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L421
	ldrb	r1, [r3, #785]	@ zero_extendqisi2
	ldrb	r0, [r3, #745]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r3, #705]
	ldreq	r3, [r2, #2008]
	ldreqb	r2, [r3, #746]	@ zero_extendqisi2
	streqb	r2, [r3, #706]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L389:
	ldr	r6, [r3, #2144]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	lr, r0, #26368
	mov	r3, r5
	add	lr, lr, #212
	b	.L394
.L393:
	add	r3, r3, #1
	cmp	r3, r6
	beq	.L422
.L394:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #2]	@ zero_extendqisi2
	cmp	r4, #3
	bne	.L393
	ldr	r4, [ip, #704]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	bne	.L393
	ldr	r4, [ip, #712]
	cmp	r4, r2
	bne	.L393
	add	r3, r0, r3, lsl #2
	str	r1, [ip, #668]
	add	r3, r3, #24576
	mov	r0, #1
	mov	r2, #0
	ldr	ip, [r3, #2008]
	str	r1, [ip, #708]
	ldr	r1, [r3, #2008]
	strb	r0, [r1, #705]
	ldr	r1, [r3, #2008]
	strb	r0, [r1, #745]
	ldr	r1, [r3, #2008]
	strb	r0, [r1, #785]
	ldr	r1, [r3, #2008]
	strb	r2, [r1, #706]
	ldr	r1, [r3, #2008]
	strb	r2, [r1, #746]
	ldr	r3, [r3, #2008]
	strb	r2, [r3, #786]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L419:
	ldr	lr, [r3, #792]
	cmp	lr, r2
	bne	.L398
	ldrb	lr, [r3, #745]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L402
	ldr	lr, [r3, #668]
	cmp	lr, r1
	bne	.L398
.L402:
	str	r1, [r3, #668]
	sub	r3, r5, #2
	add	r0, r0, ip, lsl #2
	clz	r3, r3
	add	r0, r0, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r2, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r0, #2008]
	str	r1, [r3, #788]
	ldr	r3, [r0, #2008]
	strb	ip, [r3, #785]
	ldr	r3, [r0, #2008]
	strb	r2, [r3, #786]
	ldr	r3, [r0, #2008]
	ldrb	r2, [r3, #704]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #0
	bne	.L423
	ldrb	r2, [r3, #785]	@ zero_extendqisi2
	ldrb	r1, [r3, #745]	@ zero_extendqisi2
	cmp	r2, r1
	streqb	r2, [r3, #705]
	ldreq	r3, [r0, #2008]
	ldreqb	r2, [r3, #786]	@ zero_extendqisi2
	streqb	r2, [r3, #706]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L420:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L422:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L421:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L423:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L418:
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
	bne	.L425
	ldr	r4, [r5, #664]
	mov	r1, r3
	sub	r4, r4, #1
	rsb	r4, r2, r4
	bl	UnMarkLTFrmByFrmIdx
.L426:
	mov	r3, r5
	mov	r2, r4
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MarkPicLTRef
.L425:
	add	r3, r0, #24576
	ldr	r4, [r5, #664]
	ldr	lr, [r3, #2144]
	rsb	r4, r2, r4, lsl #1
	cmp	lr, #0
	beq	.L426
	add	ip, r0, #26368
	mov	r3, #0
	add	ip, ip, #212
	b	.L429
.L427:
	tst	r2, #2
	beq	.L428
	ldr	r2, [r1, #784]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	beq	.L440
.L428:
	cmp	r3, lr
	beq	.L426
.L429:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L427
	ldr	r0, [r1, #744]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L427
	ldr	r0, [r1, #752]
	cmp	r0, r4
	bne	.L427
	mov	r3, r7
	mov	r2, #1
	mov	r0, r6
	bl	UnMarkLTFldByFrmIdx
	b	.L426
.L440:
	ldr	r2, [r1, #792]
	cmp	r2, r4
	bne	.L428
	mov	r3, r7
	mov	r2, #2
	mov	r0, r6
	bl	UnMarkLTFldByFrmIdx
	b	.L426
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
	b	.L445
.L443:
	ldr	r3, [r6, #2148]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r6, #2152]
.L445:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #668]
	cmp	r2, r3
	bcc	.L443
	mov	r0, r7
	bl	UnMarkFrameStoreRef
	b	.L443
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
.L448:
	ldr	r1, [r5, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r7, #2144]
	add	r4, r4, #1
	cmp	r3, r4
	bhi	.L448
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
	beq	.L454
	mov	r3, r5
	ldr	r1, [r1, #656]
	bl	UnMarkLTFldByFrmIdx
.L453:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #668]
	strb	r2, [r4, #4]
	strb	r3, [r4, #5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L454:
	mov	r1, r5
	bl	UnMarkLTFrmByFrmIdx
	b	.L453
	UNWIND(.fnend)
	.size	MarkCurrPicLT, .-MarkCurrPicLT
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
	subs	r3, r0, #0
	beq	.L464
	add	r0, r3, #12288
	add	r1, r3, #20480
	mov	r4, #2208
	add	r3, r3, #24576
	ldr	lr, [r0, #1304]
	mov	r2, #4000
	ldr	r1, [r1, #216]
	ldr	r5, [r0, #1300]
	ldr	r0, [r3, #1864]
	mla	r4, r4, r1, lr
	ldr	r1, [r3, #1860]
	ldr	ip, [r3, #1848]
	add	r0, r0, #1
	add	r1, r1, #1
	ldr	lr, [r3, #1852]
	ldr	r4, [r4, #28]
	str	r0, [r3, #1864]
	subs	r0, r1, #1
	str	ip, [r3, #1868]
	mla	r2, r2, r4, r5
	movne	r0, #1
	cmp	ip, #0
	str	r1, [r3, #1860]
	str	lr, [r3, #1876]
	movne	r0, #0
	cmp	r0, #0
	ldr	r0, [r2, #3344]
	ldrne	ip, [r3, #1872]
	str	r0, [r3, #1912]
	addne	ip, ip, #2
	ldr	r0, [r2, #3348]
	strne	ip, [r3, #1868]
	cmp	r1, #1
	str	r0, [r3, #1916]
	beq	.L465
	ldrb	r1, [r3, #1936]	@ zero_extendqisi2
	add	r4, r3, #1856
	cmp	r1, #1
	ldrd	r0, [r4, #48]
	beq	.L466
	adds	r0, r0, ip
	adc	r1, r1, #0
	strd	r0, [r4, #40]
.L459:
	adds	r0, r0, lr
	mov	lr, #0
	adc	r1, r1, #0
	strb	lr, [r3, #1936]
	ldr	r4, [r2, #3368]
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	ldr	r8, [r2, #3344]
	add	lr, r3, #1856
	subs	r6, r0, r4
	sbc	r7, r1, #0
	umull	r4, r5, r6, r8
	mla	r5, r8, r7, r5
	strd	r4, [lr, #24]
	ldr	r2, [r2, #3368]
	subs	r0, r0, r2
	sbc	r1, r1, #0
	strd	r0, [lr, #32]
	str	ip, [r3, #1872]
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L465:
	mov	r6, #0
	str	r6, [r3, #1896]
	mov	r0, r6
	mov	r1, r6
	str	r6, [r3, #1904]
	str	r6, [r3, #1900]
	str	r6, [r3, #1908]
	b	.L459
.L466:
	adds	r0, r0, ip
	adc	r1, r1, #0
	strd	r0, [r4, #40]
	strd	r0, [r4, #48]
	b	.L459
.L464:
	movw	r3, #1475
	ldr	r2, .L467
	ldr	r1, .L467+4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L468:
	.align	2
.L467:
	.word	.LC8
	.word	.LC9
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r3, r0, #0
	beq	.L472
	cmp	r1, #5
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, [r3]
	mvn	r5, #0
	mvn	r4, #0
	ldrd	r0, [r2, #64]
	cmp	r1, r5
	cmpeq	r0, r4
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	movw	ip, #26464
	add	r2, r3, #26368
	ldrd	r4, [r3, ip]
	movw	ip, #26496
	strd	r0, [r3, ip]
	strd	r4, [r2, #136]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L472:
	movw	r3, #1543
	ldr	r2, .L473
	ldr	r1, .L473+4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L474:
	.align	2
.L473:
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264_Get_Last_IDR_Frame_Info, .-H264_Get_Last_IDR_Frame_Info
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
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
	subs	r4, r0, #0
	beq	.L481
	add	r2, r4, #26368
	add	r3, r4, #24576
	add	r2, r2, #144
	movw	r0, #26496
	ldr	r5, [r3, #1912]
	movw	r1, #26464
	ldr	r10, [r3, #1916]
	ldrd	r2, [r2, #-8]
	cmp	r5, #0
	ldrd	r6, [r4, r1]
	strd	r2, [fp, #-60]
	ldrd	r2, [r4, r0]
	strd	r2, [fp, #-52]
	beq	.L479
	mov	r9, r5
	mov	r0, r10
	b	.L478
.L480:
	mov	r9, r1
.L478:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L480
.L477:
	ldrd	r2, [fp, #-60]
	mov	r1, r9
	mov	r0, r5
	mov	r8, #1000
	subs	r2, r6, r2
	add	r4, r4, #61184
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
	strd	r0, [r4, #88]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L479:
	mov	r9, r10
	b	.L477
.L481:
	movw	r3, #1565
	ldr	r2, .L482
	ldr	r1, .L482+4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L483:
	.align	2
.L482:
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264_Sei_Get_Frame_Pts, .-H264_Sei_Get_Frame_Pts
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
	add	r3, r0, #61440
	mov	r5, r0
	mov	r4, r1
	ldr	r2, [r3, #1380]
	cmp	r2, #0
	bne	.L485
	ldr	r2, [r1, #824]
	cmp	r2, #1
	beq	.L486
	ldr	r2, [r3, #2608]
	cmp	r2, #0
	beq	.L511
.L486:
	mov	r2, #1
	str	r2, [r3, #1380]
.L485:
	ldr	r0, [r3, #2680]
	ldr	r1, [r4, #656]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L488
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L512
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L496
	cmp	r3, #1
	beq	.L496
	ldr	r3, [r4]
	mov	r1, #768
	movt	r1, 768
	bic	r3, r3, #16711680
	bic	r3, r3, #255
	cmp	r3, r1
	beq	.L513
	cmp	r2, #1
	beq	.L514
	cmp	r2, #2
	beq	.L515
.L494:
	ldr	r1, [r5]
	ldr	r2, [r0, #192]
	ldr	r3, [r1, #4]
	cmp	r2, r3
	bls	.L500
	ldr	r1, [r1, #644]
	cmp	r1, #0
	beq	.L516
.L500:
	mov	r0, #0
.L510:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L511:
	ldr	r2, [r0]
	ldr	r2, [r2, #24]
	cmp	r2, #0
	bne	.L486
	mvn	r0, #0
	b	.L510
.L512:
	ldr	r2, [r4, #656]
	mov	r0, #1
	ldr	r1, .L517
	bl	dprint_vfmw
.L490:
	ldr	r3, [r4, #824]
	cmp	r3, #1
	beq	.L497
	mvn	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L514:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L494
	mov	r0, r2
	ldr	r1, .L517+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L510
.L515:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	tst	r3, #2
	beq	.L494
	ldr	r1, .L517+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L510
.L497:
	mov	r3, #2
	mvn	r0, #2
	str	r3, [r4, #824]
	b	.L510
.L488:
	ldr	ip, [r4, #656]
	mov	r2, r4
	ldr	r3, [r4, #824]
	mov	r0, #1
	ldr	r1, .L517+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L490
.L496:
	ldr	r1, .L517+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L510
.L516:
	ldr	r1, .L517+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L510
.L513:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r1, .L517+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L510
.L518:
	.align	2
.L517:
	.word	.LC13
	.word	.LC17
	.word	.LC18
	.word	.LC14
	.word	.LC15
	.word	.LC19
	.word	.LC16
	UNWIND(.fnend)
	.size	CheckFrameStore, .-CheckFrameStore
	.align	2
	.global	GetImagePara
	.type	GetImagePara, %function
GetImagePara:
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
	add	r3, r0, #12288
	add	ip, r0, #20480
	mov	r4, r1
	ldr	r2, [r3, #1304]
	mov	r6, r0
	ldr	r1, [ip, #216]
	mov	r0, #2208
	add	r7, r6, #61440
	ldr	r3, [r3, #1300]
	ldr	lr, [r4, #8]
	mov	r5, #4000
	mla	r2, r0, r1, r2
	ldrb	r1, [r4, #80]	@ zero_extendqisi2
	ldrb	ip, [r4, #82]	@ zero_extendqisi2
	bfc	r1, #0, #2
	ldrb	r8, [r4, #5]	@ zero_extendqisi2
	bfi	ip, r8, #1, #1
	ldr	r0, [r2, #28]
	strb	r1, [r4, #80]
	ldr	r2, [r7, #1388]
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	mla	r3, r5, r0, r3
	str	r2, [r4, #124]
	strb	ip, [r4, #82]
	str	lr, [r4, #136]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L564
.L522:
	.word	.L521
	.word	.L523
	.word	.L524
	.word	.L521
.L524:
	ldr	r2, [r4, #684]
	add	r5, r6, #24576
	ldrb	r0, [r4, #80]	@ zero_extendqisi2
	ldr	lr, [r4, #688]
	bfi	r0, r2, #0, #2
	ldrb	r2, [r4, #81]	@ zero_extendqisi2
	ldr	ip, [r4, #804]
	strb	r0, [r4, #80]
	mov	r0, #2
	bfi	r2, r0, #2, #2
	ldr	r0, [r4, #816]
	strb	r2, [r4, #81]
	mov	r2, #3
	str	lr, [r4, #168]
	str	ip, [r4, #76]
	str	r0, [r4, #736]
	str	r2, [r4, #72]
.L520:
	ldrb	r2, [r3, #18]	@ zero_extendqisi2
	str	r2, [r4, #412]
	str	r2, [r4, #416]
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	cmp	r2, #0
	ldrne	r2, [r3, #3332]
	mov	r3, #1
	str	r3, [r4, #420]
	str	r2, [r4, #424]
	ldr	r3, [r6]
	ldr	r3, [r3, #604]
	str	r3, [r4, #140]
	ldr	r3, [r6]
	ldr	r3, [r3, #608]
	str	r3, [r4, #144]
	ldr	r3, [r6]
	ldr	r3, [r3, #612]
	str	r3, [r4, #148]
	ldr	r3, [r6]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L540
	ldrb	r3, [r4, #704]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L540
	cmp	r1, #3
	ldreqb	r2, [r4, #81]	@ zero_extendqisi2
	bfieq	r2, r3, #0, #2
	streqb	r2, [r4, #81]
.L540:
	add	r9, r4, #608
	mvn	r1, #0
	mvn	r0, #0
	ldrd	r2, [r9, #-8]
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L542
	ldr	r3, [r5, #2140]
	cmp	r3, #0
	beq	.L542
	add	r8, r6, #26368
	mvn	r2, #1
	add	r8, r8, #148
	mvn	r3, #0
	str	r4, [fp, #-60]
	mov	r10, #0
	mov	r4, r8
	str	r9, [fp, #-52]
	mov	r8, r2
	mov	r9, r3
	mvn	r1, #0
	str	r1, [fp, #-48]
.L545:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L544
	ldr	r1, [r1, #656]
	ldr	r0, [r7, #2680]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L544
	ldrsb	r1, [r0, #1]
	cmp	r1, #3
	cmpne	r1, #0
	beq	.L544
	ldr	r1, [r4]
	add	r1, r1, #608
	ldrd	r0, [r1, #-8]
	cmp	r1, r9
	cmpeq	r0, r8
	strcc	r10, [fp, #-48]
	movcc	r8, r0
	movcc	r9, r1
.L544:
	ldr	r1, [r5, #2140]
	add	r10, r10, #1
	cmp	r10, r1
	bcc	.L545
	ldr	r3, [fp, #-48]
	mov	r1, r9
	mov	r0, r8
	ldr	r4, [fp, #-60]
	cmn	r3, #1
	strd	r0, [fp, #-68]
	ldr	r9, [fp, #-52]
	beq	.L542
	ldrd	r2, [r9, #-8]
	cmp	r3, r1
	cmpeq	r2, r8
	bhi	.L583
.L542:
	ldrb	r3, [r5, #1808]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L546
	ldr	r3, [r5, #1824]
	cmp	r3, #3
	moveq	r3, #1
	streq	r3, [r4, #292]
	beq	.L546
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r4, #292]
	beq	.L546
	cmp	r3, #5
	moveq	r3, #3
	streq	r3, [r4, #292]
	beq	.L546
	mov	r0, #0
	ldr	r1, .L586
	str	r0, [r4, #292]
	ldr	r2, [r5, #1824]
	bl	dprint_vfmw
.L546:
	ldr	r0, [r7, #2680]
	ldr	r1, [r4, #656]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L519
	ldr	r3, .L586+4
	mov	r2, #640
	add	r1, r4, #16
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #296]
	mov	r2, #1
	ldrb	r3, [r4, #704]	@ zero_extendqisi2
	strb	r2, [r5, #291]
	cmp	r3, #0
	movne	r3, #4
	strb	r3, [r5, #284]
	ldr	r3, [r4, #728]
	strb	r2, [r5, #289]
	str	r3, [r5, #300]
	str	r3, [r5, #308]
	str	r3, [r5, #304]
	ldr	r3, [r4, #736]
	str	r3, [r5, #236]
.L519:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L523:
	ldr	r2, [r4, #684]
	add	r5, r6, #24576
	ldrb	r0, [r4, #80]	@ zero_extendqisi2
	ldr	ip, [r4, #688]
	bfi	r0, r2, #0, #2
	ldrb	r2, [r4, #81]	@ zero_extendqisi2
	strb	r0, [r4, #80]
	mov	r0, #1
	str	ip, [r4, #168]
	bfi	r2, r0, #2, #2
	ldr	ip, [r4, #764]
	ldr	r0, [r4, #776]
	strb	r2, [r4, #81]
	mov	r2, #3
	str	ip, [r4, #72]
	str	r2, [r4, #76]
	str	r0, [r4, #736]
	b	.L520
.L521:
	ldrb	r2, [r4, #704]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L525
	ldr	r2, [r4, #688]
	mov	r0, #3
	ldr	ip, [r4, #684]
	ldr	r8, [r4, #764]
	ldr	lr, [r4, #804]
	str	r2, [r4, #168]
.L526:
	ldr	r5, [r4, #756]
	ldr	r2, [r4, #796]
	cmp	r5, r2
	beq	.L584
	movle	r9, #1
	movgt	r9, #0
.L537:
	add	r5, r6, #24576
	ldrb	r2, [r5, #1844]	@ zero_extendqisi2
	cmp	r2, #3
	moveq	r9, #1
	beq	.L538
	cmp	r2, #4
	moveq	r9, #0
.L538:
	ldrb	r2, [r4, #81]	@ zero_extendqisi2
	str	r8, [r4, #72]
	ldrb	r8, [r4, #80]	@ zero_extendqisi2
	bfi	r2, r9, #4, #2
	bfi	r2, r0, #2, #2
	str	lr, [r4, #76]
	bfi	r8, ip, #0, #2
	strb	r2, [r4, #81]
	strb	r8, [r4, #80]
	b	.L520
.L583:
	ldr	ip, [r7, #2680]
	strd	r0, [sp]
	mov	r0, ip
	bl	IsPtsRewind
	cmp	r0, #0
	bne	.L542
	ldrd	r2, [r9, #-8]
	mov	r0, #29
	ldr	r1, .L586+8
	strd	r2, [fp, #-60]
	ldrd	r2, [fp, #-68]
	strd	r2, [sp]
	ldrd	r2, [fp, #-60]
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	add	r8, r3, #6592
	ldrd	r2, [r9, #-8]
	add	r8, r8, #38
	ldr	r1, [r6, r8, asl #2]
	add	r1, r1, #608
	strd	r2, [r1, #-8]
	ldrd	r2, [fp, #-68]
	strd	r2, [r9, #-8]
	b	.L542
.L525:
	ldr	r8, [r4, #760]
	ldr	r2, [r7, #2676]
	ldr	r9, [r4, #800]
	cmp	r8, r2
	bhi	.L585
	cmp	r2, r9
	bcc	.L530
.L528:
	ldr	r2, [r4, #688]
	mov	r0, #3
	ldr	ip, [r4, #684]
	ldr	lr, [r4, #764]
	ldr	r5, [r4, #804]
	str	r2, [r4, #168]
.L531:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	cmp	r2, #1
	streq	r9, [r4, #168]
	moveq	ip, r5
	moveq	r0, #2
	beq	.L533
	cmp	r2, #2
	streq	r8, [r4, #168]
	moveq	ip, lr
	moveq	r0, #1
.L533:
	ldr	r2, [r4, #776]
	mov	r8, lr
	ldr	r9, [r4, #816]
	str	lr, [r4, #72]
	mov	lr, r5
	add	r2, r2, r9
	str	r5, [r4, #76]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	str	r2, [r4, #736]
	b	.L526
.L530:
	ldr	ip, [r4, #764]
	mov	r0, #1
	ldr	r5, [r4, #804]
	str	r8, [r4, #168]
	mov	lr, ip
	b	.L531
.L584:
	ldr	r2, [r4, #84]
	cmp	r2, #720
	movne	r9, #1
	bne	.L537
	ldr	r9, [r4, #88]
	subs	r9, r9, #480
	movne	r9, #1
	b	.L537
.L585:
	cmp	r2, r9
	bcc	.L528
	ldr	ip, [r4, #804]
	mov	r0, #2
	str	r9, [r4, #168]
	ldr	lr, [r4, #764]
	mov	r5, ip
	b	.L531
.L564:
	add	r5, r6, #24576
	b	.L520
.L587:
	.align	2
.L586:
	.word	.LC21
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
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
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SetFrmRepeatCount.part.7
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
	ldrb	lr, [r0, #705]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #706]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #720]
	ldr	r2, [r0, #724]
	ldr	r3, [r0, #740]
	strb	r5, [r0, #744]
	strb	r4, [r0, #784]
	strb	lr, [r0, #745]
	strb	lr, [r0, #785]
	strb	ip, [r0, #746]
	strb	ip, [r0, #786]
	str	r1, [r0, #760]
	str	r1, [r0, #800]
	str	r2, [r0, #764]
	str	r2, [r0, #804]
	str	r3, [r0, #780]
	str	r3, [r0, #820]
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
	ldr	r2, [r0, #796]
	mov	lr, #3
	ldr	r1, [r0, #756]
	ldr	r3, [r0, #800]
	cmp	r2, r1
	ldr	r5, [r0, #760]
	ldrb	r4, [r0, #785]	@ zero_extendqisi2
	ldr	ip, [r0, #780]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #704]
	mov	r3, r3, lsr #1
	str	ip, [r0, #740]
	str	r2, [r0, #716]
	str	r2, [r0, #672]
	str	r3, [r0, #720]
	beq	.L592
	ldrb	r2, [r0, #745]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L593
.L592:
	ldr	r2, [r0, #784]
	mov	r1, #0
	strb	r1, [r0, #705]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L599
	ldr	r2, [r0, #744]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	r1, #1
	beq	.L599
.L595:
	ldr	r2, [r0, #764]
	strb	r1, [r0, #706]
	cmp	r2, #0
	beq	.L597
	ldr	r1, [r0, #804]
	cmp	r1, #0
	moveq	r2, r1
	beq	.L597
	cmp	r2, r1
	movcc	r2, r1
.L597:
	str	r2, [r0, #724]
	str	r2, [r0, #684]
	str	r3, [r0, #688]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L593:
	mov	r1, #1
	strb	r1, [r0, #705]
.L599:
	mov	r1, #0
	b	.L595
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r7, r1, #0
	mov	r5, r0
	beq	.L633
	cmp	r2, #1
	beq	.L614
	cmp	r2, #2
	beq	.L615
	ldr	r8, [r7, #756]
	ldr	r9, [r7, #796]
.L616:
	add	r6, r5, #24576
	ldr	r1, [r6, #2412]
	cmp	r1, #0
	beq	.L625
	ldr	r4, [r6, #2156]
	cmp	r4, #0
	addne	r3, r5, #26624
	movne	r4, #0
	addne	r3, r3, #108
	bne	.L619
	b	.L617
.L623:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L617
.L619:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L623
.L625:
	mvn	r0, #0
.L629:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L615:
	ldr	r8, [r7, #796]
	mov	r9, r8
	b	.L616
.L617:
	add	r3, r5, #61440
	ldr	r1, [r7, #656]
	ldr	r0, [r3, #2680]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L620
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L620
	add	r5, r5, r4, lsl #2
	mov	r3, #1
	add	r5, r5, #24576
	ldr	r1, .L634
	str	r3, [r5, #2156]
	ldr	r3, [r0, #28]
	mov	r0, #13
	ldr	r3, [r3, #4]
	str	r8, [r5, #2284]
	str	r9, [r5, #2348]
	str	r3, [r5, #2220]
	ldr	r3, [r6, #2416]
	cmp	r3, #15
	addls	r3, r3, #1
	movhi	r3, #16
	str	r3, [r6, #2416]
	mov	r3, r4
	ldr	r2, [r7, #164]
	bl	dprint_vfmw
	mov	r0, #0
	str	r4, [r7, #696]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L614:
	ldr	r8, [r7, #756]
	mov	r9, r8
	b	.L616
.L620:
	mov	r1, #0
	ldr	r2, [r7, #656]
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	stmia	sp, {r0, r1}
	mov	r0, r1
	ldr	r1, .L634+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L629
.L633:
	mov	r0, r7
	movw	r3, #2518
	ldr	r2, .L634+8
	ldr	r1, .L634+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L629
.L635:
	.align	2
.L634:
	.word	.LC22
	.word	.LC23
	.word	.LC8
	.word	.LC9
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
	b	SlidingWinMark.part.8
	UNWIND(.fnend)
	.size	SlidingWinMark, .-SlidingWinMark
	.align	2
	.global	DumpDPB
	.type	DumpDPB, %function
DumpDPB:
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
	ldr	r3, .L648
	mov	r5, r0
	ldr	r3, [r3]
	tst	r3, #16384
	beq	.L638
	add	r6, r0, #24576
	ldr	r3, [r6, #2140]
	cmp	r3, #0
	addne	r7, r0, #26368
	movne	r4, #0
	addne	r7, r7, #148
	beq	.L644
.L643:
	ldr	ip, [r7, #4]!
	mov	r2, r4
	ldr	r1, .L648+4
	mov	r0, #14
	add	r4, r4, #1
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	ldr	r3, [ip, #660]
	str	lr, [sp, #4]
	ldr	ip, [ip, #672]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6, #2140]
	cmp	r3, r4
	bhi	.L643
.L644:
	ldr	r1, .L648+8
	mov	r0, #14
	bl	dprint_vfmw
	ldr	r3, [r6, #2144]
	cmp	r3, #0
	addne	r5, r5, #26368
	movne	r4, #0
	addne	r5, r5, #212
	beq	.L642
.L645:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L648+12
	mov	r0, #14
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	ldr	r3, [ip, #660]
	str	lr, [sp, #4]
	ldr	ip, [ip, #672]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5]
	mov	r2, r4
	ldr	r1, .L648+16
	mov	r0, #14
	add	r4, r4, #1
	ldr	r3, [r3, #716]
	bl	dprint_vfmw
	ldr	r3, [r6, #2144]
	cmp	r3, r4
	bhi	.L645
.L642:
	ldr	r1, .L648+8
	mov	r0, #14
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L638:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L649:
	.align	2
.L648:
	.word	g_PrintEnable
	.word	.LC24
	.word	.LC2
	.word	.LC25
	.word	.LC26
	UNWIND(.fnend)
	.size	DumpDPB, .-DumpDPB
	.align	2
	.global	UpdateCurrFrameInfo
	.type	UpdateCurrFrameInfo, %function
UpdateCurrFrameInfo:
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
	add	r3, r0, #57344
	ldrb	r2, [r3, #3330]	@ zero_extendqisi2
	ldr	r4, [r3, #3984]
	strb	r2, [r4]
	ldrb	r2, [r3, #3332]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	bne	.L651
	ldrb	r2, [r3, #3333]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
.L651:
	strb	r2, [r4, #2]
	ldr	r2, [r3, #3992]
	str	r2, [r4, #660]
	ldr	r2, [r3, #4028]
	str	r2, [r4, #688]
	ldr	r2, [r3, #4020]
	str	r2, [r4, #684]
	ldr	r2, [r3, #4004]
	str	r2, [r4, #672]
	ldr	r2, [r3, #4052]
	str	r2, [r4, #692]
	ldr	r2, [r3, #3996]
	str	r2, [r4, #668]
	ldrb	r2, [r3, #3337]	@ zero_extendqisi2
	str	r2, [r4, #680]
	ldrb	r2, [r3, #3335]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r1, #3
	movne	r1, #0
	strb	r1, [r4, #3]
	ldrb	r2, [r3, #3331]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L654
	bcc	.L655
	cmp	r2, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	str	r4, [r4, #820]
	mov	ip, #1
	strb	ip, [r4, #784]
	mov	r6, #0
	ldrb	ip, [r3, #3332]	@ zero_extendqisi2
	strb	ip, [r4, #785]
	ldrb	ip, [r3, #3333]	@ zero_extendqisi2
	strb	ip, [r4, #786]
	ldr	ip, [r3, #4012]
	str	ip, [r4, #796]
	ldr	ip, [r3, #4020]
	str	ip, [r4, #804]
	ldr	lr, [r3, #4028]
	str	r6, [r4, #680]
	str	lr, [r4, #800]
	ldrb	r5, [r3, #3329]	@ zero_extendqisi2
	cmp	r5, r6
	beq	.L672
	ldr	r2, [r4, #760]
	mov	r5, #3
	strb	r5, [r4, #1]
	add	r0, r0, #61184
	add	lr, lr, r2
	str	lr, [r4, #688]
	str	lr, [r4, #720]
	mvn	r7, #0
	ldrb	r2, [r3, #3335]	@ zero_extendqisi2
	cmp	r2, #1
	orreq	r6, r1, #2
	strb	r6, [r4, #3]
	ldrd	r8, [r0, #88]
	mvn	r6, #0
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L663
	add	r2, r4, #608
	ldrd	r0, [r2, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	beq	.L673
.L663:
	ldr	r2, [r4, #764]
.L670:
	cmp	r2, ip
	mov	r0, r4
	movcc	r2, ip
	str	r2, [r4, #684]
	ldr	r3, [r3, #4004]
	str	r3, [r4, #672]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	CombineFldsToFrm
.L655:
	str	r4, [r4, #740]
	mov	r1, #3
	mov	r2, #0
	strb	r1, [r4, #1]
	strb	r2, [r4, #704]
	add	r1, r3, #3344
	ldrb	r5, [r3, #3332]	@ zero_extendqisi2
	mov	r2, #640
	add	r0, r4, #16
	strb	r5, [r4, #705]
	ldrb	r6, [r3, #3333]	@ zero_extendqisi2
	strb	r6, [r4, #706]
	ldr	ip, [r3, #4008]
	str	ip, [r4, #716]
	ldr	r7, [r3, #4020]
	str	r7, [r4, #724]
	ldr	r8, [r3, #4028]
	str	r8, [r4, #720]
	ldr	ip, [r3, #4012]
	str	ip, [r4, #756]
	ldr	r3, [r3, #4016]
	str	r3, [r4, #796]
	bl	memcpy
	mov	r2, #1
	mov	r3, #2
	str	r8, [r4, #760]
	str	r8, [r4, #800]
	str	r7, [r4, #764]
	str	r7, [r4, #804]
	strb	r6, [r4, #746]
	strb	r6, [r4, #786]
	strb	r5, [r4, #745]
	strb	r5, [r4, #785]
	str	r4, [r4, #780]
	str	r4, [r4, #820]
	strb	r2, [r4, #744]
	strb	r3, [r4, #784]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L654:
	strb	r2, [r4, #744]
	mov	r5, #0
	str	r4, [r4, #780]
	ldrb	ip, [r3, #3332]	@ zero_extendqisi2
	strb	ip, [r4, #745]
	ldrb	ip, [r3, #3333]	@ zero_extendqisi2
	strb	ip, [r4, #746]
	ldr	ip, [r3, #4012]
	str	ip, [r4, #756]
	ldr	ip, [r3, #4020]
	str	ip, [r4, #764]
	ldr	lr, [r3, #4028]
	str	r5, [r4, #680]
	str	lr, [r4, #760]
	ldrb	r6, [r3, #3329]	@ zero_extendqisi2
	cmp	r6, r5
	beq	.L674
	ldr	r2, [r4, #800]
	mov	r6, #3
	strb	r6, [r4, #1]
	add	r0, r0, #61184
	add	lr, lr, r2
	str	lr, [r4, #688]
	str	lr, [r4, #720]
	mvn	r7, #0
	ldrb	r2, [r3, #3335]	@ zero_extendqisi2
	mvn	r6, #0
	cmp	r2, #1
	orreq	r5, r1, #1
	strb	r5, [r4, #3]
	ldrd	r8, [r0, #88]
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L659
	add	r2, r4, #608
	ldrd	r0, [r2, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	streqd	r8, [r2, #-8]
.L659:
	ldr	r2, [r4, #804]
	b	.L670
.L672:
	strb	r2, [r4, #1]
	add	r1, r3, #3344
	str	lr, [r4, #688]
	add	r0, r4, #16
	str	lr, [r4, #720]
	mov	r2, #640
	ldrb	r3, [r3, #3335]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r5, #2
	strb	r5, [r4, #3]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L674:
	strb	r2, [r4, #1]
	add	r1, r3, #3344
	str	lr, [r4, #688]
	add	r0, r4, #16
	str	lr, [r4, #720]
	mov	r2, #640
	ldrb	r3, [r3, #3335]	@ zero_extendqisi2
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #3]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L673:
	strd	r8, [r2, #-8]
	b	.L663
	UNWIND(.fnend)
	.size	UpdateCurrFrameInfo, .-UpdateCurrFrameInfo
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
	bcs	.L681
.L676:
	add	r0, r4, #57344
	mov	r2, #0
	ldr	r3, [r0, #4000]
	strb	r2, [r0, #3332]
	cmp	r3, r2
	movne	r3, #1
	strneb	r3, [r0, #3333]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L681:
	ldr	r1, [r3, #1944]
	bl	UnMarkFrameStoreRef
	mov	r1, #0
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	b	.L676
	UNWIND(.fnend)
	.size	SimpleSlideDPB, .-SimpleSlideDPB
	.align	2
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 24
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
	mov	r5, r2
	sub	r2, r1, #32
	sub	r3, r5, #32
	mov	r4, r1
	movw	r1, #8160
	cmp	r3, r1
	cmpls	r2, r1
	mov	r6, r0
	movhi	r1, #1
	movls	r1, #0
	bhi	.L694
	ldr	r3, .L698
	mov	r2, #20
	sub	r0, fp, #48
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r6]
	str	r4, [fp, #-44]
	str	r5, [fp, #-40]
	ldr	r3, [r3, #28]
	str	r4, [fp, #-36]
	cmp	r3, #24
	str	r5, [fp, #-32]
	beq	.L685
	add	r2, r6, #24576
	ldrb	r3, [fp, #4]	@ zero_extendqisi2
	mov	r1, #5
	strb	r1, [fp, #-46]
	ldr	r2, [r2, #2136]
	add	r2, r2, #1
	strb	r2, [fp, #-47]
.L691:
	cmp	r5, #63
	cmphi	r4, #63
	strb	r3, [fp, #-45]
	movls	r7, #1
	movhi	r7, #0
	bls	.L695
	add	r4, r6, #61440
	sub	r1, fp, #48
	ldr	r0, [r4, #2680]
	bl	FSP_ConfigInstance
	subs	r5, r0, #0
	bne	.L687
	ldr	r1, [r6]
	sub	r3, fp, #52
	ldr	r0, [r4, #2680]
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L696
	cmp	r0, #0
	moveq	r0, #1
	bne	.L697
.L692:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L685:
	mov	r3, #1
	mov	r2, #5
	strb	r3, [fp, #-47]
	strb	r2, [fp, #-46]
	b	.L691
.L694:
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L698+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L695:
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L698+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L692
.L687:
	mov	r0, r7
	ldr	r1, .L698+12
	bl	dprint_vfmw
.L693:
	mvn	r0, #19
	b	.L692
.L697:
	mov	r0, r5
	ldr	r1, .L698+16
	bl	dprint_vfmw
	b	.L693
.L696:
	add	r0, r6, #8
	bl	ResetVoQueue
	b	.L693
.L699:
	.align	2
.L698:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LC28
	.word	.LC30
	.word	.LC29
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L727
	add	r3, r4, #20480
	ldrb	r2, [r3, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L704
	bcc	.L718
	cmp	r2, #2
	bne	.L728
.L719:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L728:
	ldr	r1, .L732
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L718:
	mov	r6, #1
.L705:
	add	lr, r4, #20480
	add	ip, r4, #26880
	add	lr, lr, #244
	mov	r5, #0
	add	ip, ip, #244
	add	r7, r4, #57344
	ldr	r3, [lr, #4]!
	mov	r2, r5
	mov	r8, #1
	cmp	r3, #0
	beq	.L706
.L730:
	ldr	r10, [ip]
	cmp	r10, #0
	bne	.L720
	mov	r0, ip
	mov	r1, r10
	b	.L708
.L709:
	ldr	r9, [r0, #4]!
	cmp	r9, #0
	bne	.L707
.L708:
	add	r1, r1, #1
	cmp	r1, r3
	bne	.L709
	ldr	r1, [r4]
	ldr	r1, [r1, #24]
	cmp	r1, #2
	bne	.L729
	ldr	r5, [r7, #3984]
	add	r5, r5, #704
.L711:
	mov	r9, r10
	mov	r0, ip
	mov	r1, #0
	b	.L717
.L713:
	ldr	r9, [r0, #4]!
.L717:
	add	r1, r1, #1
	cmp	r9, #0
	streq	r5, [r0]
	cmp	r1, r3
	bne	.L713
	add	r2, r2, #1
	add	ip, ip, #132
	cmp	r6, r2
	bls	.L719
.L726:
	ldr	r3, [lr, #4]!
	cmp	r3, #0
	bne	.L730
.L706:
	ldr	r1, [r4]
	ldr	r1, [r1, #24]
	cmp	r1, #2
	bne	.L731
	add	r2, r2, #1
	str	r8, [lr]
	cmp	r6, r2
	ldr	r3, [r7, #3984]
	add	ip, ip, #132
	add	r3, r3, #704
	str	r3, [ip, #-132]
	bhi	.L726
	b	.L719
.L720:
	mov	r9, r10
.L707:
	mov	r5, r9
	b	.L711
.L704:
	mov	r6, #2
	b	.L705
.L731:
	ldr	r1, .L732+4
.L724:
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L729:
	mov	r2, r5
	mov	r3, #0
	ldr	r1, .L732+8
	b	.L724
.L727:
	movw	r3, #4315
	ldr	r2, .L732+12
	ldr	r1, .L732+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L733:
	.align	2
.L732:
	.word	.LC31
	.word	.LC33
	.word	.LC32
	.word	.LC8
	.word	.LC9
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
	beq	.L735
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L735:
	add	r3, r0, #24576
	ldr	r5, [r3, #2144]
	cmp	r5, #0
	beq	.L743
	add	r3, r0, #26368
	mov	r2, #0
	add	r3, r3, #216
	b	.L740
.L753:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L751
.L738:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L752
.L740:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L753
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L739
	ldr	ip, [r0, #744]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L754
.L739:
	tst	lr, #2
	beq	.L738
	ldr	ip, [r0, #784]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L738
	ldr	ip, [r0, #792]
	cmp	ip, r1
	bne	.L738
	add	r0, r0, #784
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L751:
	ldr	ip, [r0, #704]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L738
	ldr	ip, [r0, #712]
	cmp	ip, r1
	bne	.L738
	add	r0, r0, #704
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L754:
	ldr	ip, [r0, #752]
	cmp	ip, r1
	bne	.L739
	add	r0, r0, #744
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L752:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L743:
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
	beq	.L756
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L756:
	add	r3, r0, #24576
	ldr	r5, [r3, #2148]
	cmp	r5, #0
	beq	.L764
	add	r3, r0, #26624
	mov	r2, #0
	add	r3, r3, #24
	b	.L761
.L774:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L772
.L759:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L773
.L761:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L774
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L760
	ldr	ip, [r0, #744]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L775
.L760:
	tst	lr, #2
	beq	.L759
	ldr	ip, [r0, #784]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L759
	ldr	ip, [r0, #788]
	cmp	ip, r1
	bne	.L759
	add	r0, r0, #784
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L772:
	ldr	ip, [r0, #704]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L759
	ldr	ip, [r0, #708]
	cmp	ip, r1
	bne	.L759
	add	r0, r0, #704
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L775:
	ldr	ip, [r0, #748]
	cmp	ip, r1
	bne	.L760
	add	r0, r0, #744
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L773:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L764:
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
	ble	.L777
	add	ip, r4, r2, lsl #2
	mov	r1, r2
.L778:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L778
.L777:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r4, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r7, #2
	add	r3, r4, r0, lsl #2
	mov	ip, r0
.L782:
	ldr	r1, [r3], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L780
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L781
	ldr	lr, [r1, #8]
	cmp	lr, r5
	beq	.L780
.L781:
	str	r1, [r4, ip, asl #2]
	add	ip, ip, #1
.L780:
	cmp	r0, r2
	bne	.L782
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
	ble	.L790
	add	ip, r4, r2, lsl #2
	mov	r1, r2
.L791:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L791
.L790:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r4, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r7, #2
	add	r3, r4, r0, lsl #2
	mov	ip, r0
.L795:
	ldr	r1, [r3], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L793
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L794
	ldr	lr, [r1, #4]
	cmp	lr, r5
	beq	.L793
.L794:
	str	r1, [r4, ip, asl #2]
	add	ip, ip, #1
.L793:
	cmp	r0, r2
	bne	.L795
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
	beq	.L806
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
.L816:
	adds	r10, r9, #2
	beq	.L805
	ldr	r3, [r7]
	cmp	r3, #3
	beq	.L805
	ldr	r6, [fp, #8]
	mov	r4, #0
	ldr	r5, [fp, #-64]
	b	.L809
.L810:
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
	beq	.L805
.L815:
	ldr	r3, [r7, #4]!
	add	r6, r6, #4
	cmp	r3, #3
	beq	.L805
.L809:
	cmp	r3, #1
	bhi	.L810
	cmp	r3, #0
	ldr	r3, [r6]
	bne	.L811
	mvn	r3, r3
	adds	r5, r5, r3
	ldrmi	r3, [fp, #-60]
	addmi	r5, r5, r3
.L812:
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
	bne	.L815
.L805:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L811:
	add	r3, r3, #1
	add	r5, r5, r3
	ldr	r3, [fp, #-60]
	cmp	r3, r5
	rsble	r5, r3, r5
	b	.L812
.L806:
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
	b	.L816
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
	beq	.L824
	add	r6, r0, #16384
	ldrb	r2, [r6, #3512]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L836
.L827:
	cmp	r3, #1
	ldr	r3, [r4, #260]
	add	r3, r3, #1
	str	r3, [r4, #248]
	bne	.L824
	ldrb	r3, [r6, #3513]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L837
.L829:
	ldr	r3, [r4, #264]
	add	r3, r3, #1
	str	r3, [r4, #252]
.L824:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L836:
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
	b	.L827
.L837:
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
	b	.L829
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
	ldr	lr, .L901
	movcc	r4, r2
	ldr	ip, .L901+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L841
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L849
.L850:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L849
	cmp	r2, #0
	beq	.L855
	add	r8, r7, r5, lsl #2
	b	.L854
.L851:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L855
.L854:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L851
	add	r0, r0, #784
	blx	r6
	cmp	r0, #0
	beq	.L851
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #784
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L855:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L857
	b	.L850
.L856:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L850
.L857:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	tst	r1, #1
	beq	.L856
	add	r0, r0, #744
	blx	r6
	cmp	r0, #0
	beq	.L856
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #744
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L850
.L900:
	add	r0, r0, #744
	blx	r6
	cmp	r0, #0
	beq	.L842
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #744
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L846:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L848
	b	.L841
.L847:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L841
.L848:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L847
	add	r0, r0, #784
	blx	r6
	cmp	r0, #0
	beq	.L847
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #784
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L841:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L849
	cmp	r2, #0
	beq	.L846
	add	r9, r7, r10, lsl #2
	b	.L845
.L842:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L846
.L845:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L842
	b	.L900
.L849:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L902:
	.align	2
.L901:
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
	subs	r4, r0, #0
	beq	.L1029
	add	r7, r4, #20480
	add	r9, r4, #57344
	ldrb	r3, [r7, #208]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1030
	ldrb	r5, [r9, #3331]	@ zero_extendqisi2
	add	r3, r4, #24576
	str	r3, [fp, #-240]
	cmp	r5, #0
	ldr	r10, [r3, #2144]
	beq	.L926
	cmp	r10, #0
	beq	.L1031
	add	r6, r4, #26368
	mov	r5, #0
	add	r6, r6, #212
	mov	r3, r5
	mov	r1, r6
.L945:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L944
	sub	r0, fp, #44
	ldr	ip, [r9, #4004]
	add	lr, r0, r5, lsl #2
	ldr	r0, [r2, #672]
	cmp	ip, r0
	strge	r2, [lr, #-192]
	addge	r5, r5, #1
.L944:
	cmp	r3, r10
	bne	.L945
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r5
	mov	r0, r3
	ldr	r3, .L1038
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	beq	.L1026
.L970:
	mov	r10, r5
	mov	r3, #0
.L948:
	ldr	r2, [r6, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L947
	sub	r1, fp, #44
	ldr	r0, [r9, #4004]
	add	ip, r1, r10, lsl #2
	ldr	r1, [r2, #672]
	cmp	r0, r1
	strlt	r2, [ip, #-192]
	addlt	r10, r10, #1
.L947:
	cmp	r3, r8
	bne	.L948
	ldr	r2, [fp, #-244]
	rsb	r8, r5, r10
	mov	r3, r5, asl #2
	str	r3, [fp, #-248]
	add	r0, r2, r3
	mov	r1, r8
	ldr	r3, .L1038+4
	mov	r2, #4
	bl	qsort
	cmp	r5, #0
	subeq	r6, fp, #172
	beq	.L949
.L967:
	sub	r6, fp, #172
	ldr	r2, [fp, #-244]
	add	r8, r6, r8, lsl #2
	mov	r3, #0
.L950:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r5
	str	r1, [r8], #4
	bcc	.L950
.L949:
	cmp	r10, r5
	bls	.L951
	ldr	r3, [fp, #-244]
	ldr	r2, [fp, #-248]
	add	r2, r3, r2
	mov	r3, r6
.L952:
	add	r5, r5, #1
	ldr	r1, [r2], #4
	cmp	r5, r10
	str	r1, [r3], #4
	bne	.L952
.L951:
	add	r2, r4, #20480
	add	r3, r4, #26880
	add	r2, r2, #248
	mov	r5, #0
	add	r3, r3, #244
	str	r5, [r7, #248]
	str	r5, [r7, #252]
	mov	ip, r2
	ldrb	r0, [r9, #3331]	@ zero_extendqisi2
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
	ldrb	r0, [r9, #3331]	@ zero_extendqisi2
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
	beq	.L953
	add	r3, r4, #26624
	sub	r10, fp, #108
	add	r3, r3, #20
	mov	r2, r10
.L954:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r6
	str	r1, [r2], #4
	bne	.L954
.L953:
	ldr	r3, .L1038+8
	mov	r2, #4
	mov	r1, r6
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-244]
	ldrb	r0, [r9, #3331]	@ zero_extendqisi2
	mov	r5, #1
	mov	r2, r6
	mov	r1, r10
	stmia	sp, {r3, r5}
	ldr	r3, [fp, #-248]
	bl	GenPiclistfromFrmlist
	ldr	r2, [fp, #-252]
	ldrb	r0, [r9, #3331]	@ zero_extendqisi2
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
.L943:
	cmp	r2, #1
	movls	r1, #0
	andhi	r1, r1, #1
	cmp	r1, #0
	beq	.L955
	cmp	r2, #0
	ldr	r1, [fp, #-240]
	beq	.L956
	ldr	r6, [r1, #2548]
	ldr	r1, [r1, #2680]
	cmp	r6, r1
	bne	.L955
	add	r0, r4, #27136
	ldr	ip, [fp, #-248]
	add	r0, r0, #120
	mov	r1, #0
	b	.L957
.L958:
	ldr	r5, [ip, #4]!
	ldr	lr, [r0, #4]!
	cmp	r5, lr
	bne	.L955
.L957:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L958
.L959:
	ldr	r0, [fp, #-240]
	ldr	r1, [r0, #2684]
	str	r6, [r0, #2684]
	str	r1, [r0, #2680]
.L955:
	orrs	r1, r2, r3
	beq	.L1032
.L921:
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
	bhi	.L964
	add	r2, r2, #6720
	add	r1, r4, #27136
	add	r2, r2, #60
	add	r1, r1, #116
	mov	r0, #0
	add	r2, r4, r2, lsl #2
.L963:
	str	r0, [r2, #4]!
	cmp	r2, r1
	bne	.L963
.L964:
	cmp	r3, #32
	bhi	.L962
	add	r3, r3, #6784
	add	r2, r4, #27136
	add	r3, r3, #29
	add	r2, r2, #248
	mov	r1, #0
	add	r4, r4, r3, lsl #2
.L965:
	str	r1, [r4, #4]!
	cmp	r4, r2
	bne	.L965
.L962:
	mov	r0, #0
.L1014:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1030:
	ldrb	r6, [r9, #3331]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L907
	add	r2, r4, #24576
	str	r2, [fp, #-240]
	ldr	lr, [r2, #2144]
	cmp	lr, #0
	moveq	r6, lr
	beq	.L909
	add	r1, r4, #26368
	mov	r6, r3
	add	r1, r1, #212
.L918:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r6, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r6, r6, #1
	cmp	r3, lr
	bne	.L918
.L909:
	mov	r1, r6
	ldr	r3, .L1038+12
	mov	r2, #4
	sub	r0, fp, #236
	bl	qsort
	add	r8, r4, #20480
	add	r3, r4, #26880
	mov	r5, #0
	add	r3, r3, #244
	str	r5, [r7, #248]
	mov	r2, r6
	ldrb	r0, [r9, #3331]	@ zero_extendqisi2
	sub	r1, fp, #236
	str	r5, [sp, #4]
	add	r8, r8, #248
	str	r8, [sp]
	str	r3, [fp, #-244]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r6, [r3, #2148]
	cmp	r6, r5
	subeq	r10, fp, #108
	beq	.L919
	add	r3, r4, #26624
	sub	r10, fp, #108
	add	r3, r3, #20
	mov	r2, r10
.L920:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r6
	str	r1, [r2], #4
	bne	.L920
.L919:
	ldr	r3, .L1038+8
	mov	r2, #4
	mov	r1, r6
	mov	r0, r10
	bl	qsort
	ldrb	r0, [r9, #3331]	@ zero_extendqisi2
	mov	r2, r6
	mov	ip, #1
	ldr	r3, [fp, #-244]
	mov	r1, r10
	str	r8, [sp]
	str	ip, [sp, #4]
	bl	GenPiclistfromFrmlist
	ldr	r2, [r7, #248]
.L916:
	cmp	r2, #0
	mov	r3, #0
	str	r3, [r7, #252]
	bne	.L921
	ldr	r3, [r4]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L922
	ldrb	r3, [r9, #3331]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1033
	cmp	r3, #1
	ldr	r2, [fp, #-240]
	ldr	r3, [r9, #3984]
	addeq	r3, r3, #744
	addne	r3, r3, #784
	str	r3, [r2, #2548]
.L924:
	mov	r3, #0
	mov	r2, #1
	b	.L921
.L907:
	add	r3, r4, #24576
	str	r3, [fp, #-240]
	ldr	ip, [r3, #2144]
	cmp	ip, #0
	beq	.L972
	add	r1, r4, #26368
	mov	r3, r6
	add	r1, r1, #212
	b	.L912
.L911:
	cmp	r3, ip
	beq	.L910
.L912:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L911
	ldr	r0, [r2, #704]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L911
	add	r0, r6, #6720
	cmp	r3, ip
	add	r0, r0, #60
	add	r2, r2, #704
	add	r6, r6, #1
	add	r0, r4, r0, lsl #2
	str	r2, [r0, #4]
	bne	.L912
.L910:
	add	r0, r4, #26880
	ldr	r3, .L1038+16
	mov	r1, r6
	add	r0, r0, #244
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	str	r6, [r7, #248]
	ldr	r1, [r3, #2148]
	cmp	r1, #0
	beq	.L973
	add	r0, r4, #26624
	mov	r5, r6
	add	r0, r0, #20
	mov	r3, #0
	b	.L915
.L914:
	cmp	r3, r1
	beq	.L1034
.L915:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L914
	ldr	ip, [r2, #704]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L914
	add	ip, r5, #6720
	cmp	r3, r1
	add	ip, ip, #60
	add	r2, r2, #704
	add	r5, r5, #1
	add	ip, r4, ip, lsl #2
	str	r2, [ip, #4]
	bne	.L915
.L1034:
	rsb	r1, r6, r5
.L913:
	add	r0, r4, r6, lsl #2
	mov	r2, #4
	add	r0, r0, #26880
	ldr	r3, .L1038+20
	add	r0, r0, #244
	bl	qsort
	str	r5, [r7, #248]
	mov	r2, r5
	b	.L916
.L926:
	cmp	r10, #0
	beq	.L929
	add	r6, r4, #26368
	mov	r3, r5
	add	r6, r6, #212
	mov	r1, r6
	b	.L931
.L930:
	cmp	r3, r10
	beq	.L1035
.L931:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L930
	add	r0, r5, #6720
	ldr	ip, [r2, #716]
	add	r0, r0, #60
	ldr	lr, [r9, #4008]
	add	r2, r2, #704
	add	r0, r4, r0, lsl #2
	cmp	lr, ip
	addge	r5, r5, #1
	strge	r2, [r0, #4]
	cmp	r3, r10
	bne	.L931
.L1035:
	add	r3, r4, #26880
	mov	r1, r5
	mov	r2, r3
	add	r2, r2, #244
	ldr	r3, .L1038+24
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	beq	.L1025
.L968:
	mov	r10, r5
	mov	r3, #0
	b	.L934
.L933:
	cmp	r3, r8
	beq	.L1036
.L934:
	ldr	r2, [r6, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #3
	bne	.L933
	add	r1, r10, #6720
	ldr	r0, [r2, #716]
	add	r1, r1, #60
	ldr	ip, [r9, #4008]
	add	r2, r2, #704
	add	r1, r4, r1, lsl #2
	cmp	ip, r0
	addlt	r10, r10, #1
	strlt	r2, [r1, #4]
	cmp	r3, r8
	bne	.L934
.L1036:
	add	r6, r5, #6720
	rsb	r8, r5, r10
	add	r6, r6, #60
	mov	r2, #4
	ldr	r3, .L1038+28
	mov	r1, r8
	add	r0, r4, r6, lsl #2
	add	r9, r4, r10, lsl #2
	add	r0, r0, r2
	add	r9, r9, #26880
	bl	qsort
	cmp	r5, #0
	add	r9, r9, #244
	beq	.L936
.L966:
	add	r8, r8, #6784
	add	r2, r4, #26880
	add	r8, r8, #29
	add	r2, r2, #240
	mov	r3, #0
	add	r8, r4, r8, lsl #2
.L937:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r5
	str	r1, [r8, #4]!
	bcc	.L937
.L936:
	cmp	r10, r5
	bls	.L938
	add	r3, r4, #27136
	add	r6, r4, r6, lsl #2
	add	r3, r3, #116
.L939:
	add	r5, r5, #1
	ldr	r2, [r6, #4]!
	cmp	r5, r10
	str	r2, [r3, #4]!
	bne	.L939
.L938:
	ldr	r3, [fp, #-240]
	str	r10, [r7, #252]
	str	r10, [r7, #248]
	ldr	r1, [r3, #2148]
	cmp	r1, #0
	beq	.L975
	add	r0, r4, #26624
	mov	r5, r10
	add	r0, r0, #20
	mov	r3, #0
	b	.L942
.L941:
	cmp	r3, r1
	beq	.L1037
.L942:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L941
	ldrb	ip, [r2, #705]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L941
	add	ip, r4, r5, lsl #2
	cmp	r3, r1
	add	ip, ip, #24576
	add	r2, r2, #704
	add	r5, r5, #1
	str	r2, [ip, #2548]
	str	r2, [ip, #2680]
	bne	.L942
.L1037:
	rsb	r1, r10, r5
.L940:
	mov	r0, r9
	ldr	r3, .L1038+20
	mov	r2, #4
	bl	qsort
	ldr	r0, [r7, #248]
	ldr	r3, .L1038+20
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
	b	.L943
.L1033:
	ldr	r2, [fp, #-240]
	ldr	r3, [r9, #3984]
	add	r3, r3, #704
	str	r3, [r2, #2548]
	b	.L924
.L1032:
	ldr	r1, .L1038+32
.L1021:
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L1014
.L956:
	ldr	r6, [r1, #2680]
	b	.L959
.L972:
	mov	r6, ip
	b	.L910
.L1025:
	add	r6, r5, #6720
	mov	r2, #4
	add	r6, r6, #60
	ldr	r3, .L1038+28
	mov	r1, r8
	add	r9, r4, r6, lsl #2
	add	r9, r9, r2
	mov	r0, r9
	bl	qsort
	subs	r10, r5, #0
	bne	.L966
	b	.L938
.L975:
	mov	r5, r10
	b	.L940
.L1031:
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L1038
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2144]
	cmp	r8, #0
	addne	r6, r4, #26368
	movne	r5, r10
	addne	r6, r6, #212
	bne	.L970
	ldr	r3, .L1038+4
	mov	r2, #4
	mov	r1, r8
	ldr	r0, [fp, #-244]
	mov	r10, r8
	bl	qsort
.L1022:
	sub	r6, fp, #172
	b	.L951
.L1026:
	mov	r3, r5, asl #2
	ldr	r1, [fp, #-244]
	str	r3, [fp, #-248]
	mov	r2, r3
	ldr	r3, .L1038+4
	add	r0, r1, r2
	mov	r2, #4
	mov	r1, r8
	bl	qsort
	subs	r10, r5, #0
	bne	.L967
	b	.L1022
.L973:
	mov	r5, r6
	b	.L913
.L929:
	add	r3, r4, #26880
	mov	r1, r10
	mov	r2, r3
	add	r2, r2, #244
	ldr	r3, .L1038+24
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
	bne	.L968
	ldr	r9, [fp, #-248]
	mov	r2, #4
	ldr	r3, .L1038+28
	mov	r1, r8
	mov	r10, r8
	mov	r0, r9
	bl	qsort
	b	.L938
.L922:
	ldr	r1, .L1038+36
	b	.L1021
.L1029:
	movw	r3, #5073
	ldr	r2, .L1038+40
	ldr	r1, .L1038+44
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1014
.L1039:
	.align	2
.L1038:
	.word	compare_fs_by_poc_desc
	.word	compare_fs_by_poc_asc
	.word	compare_fs_by_lt_pic_idx_asc
	.word	compare_fs_by_frame_num_desc
	.word	compare_pic_by_pic_num_desc
	.word	compare_pic_by_lt_pic_num_asc
	.word	compare_pic_by_poc_desc
	.word	compare_pic_by_poc_asc
	.word	.LC35
	.word	.LC34
	.word	.LC8
	.word	.LC9
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
	ldr	r3, .L1042
	ldr	r3, [r3]
	tst	r3, #8192
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DumpList.part.10
.L1043:
	.align	2
.L1042:
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
	beq	.L1049
	ldr	r3, [r3, #1944]
	add	r2, r0, #57344
	ldr	r5, [r2, #4004]
	ldr	lr, [r3, #672]
	rsb	lr, lr, r5
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	r4, #1
	bls	.L1050
	add	r1, r0, #26368
	mov	r2, #1
	add	r1, r1, #152
	mov	r0, #0
.L1048:
	ldr	ip, [r1, #4]!
	add	r2, r2, #1
	ldr	r3, [ip, #672]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r0, [ip, #164]
	movlt	lr, r3
	cmp	r2, r4
	bne	.L1048
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1050:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1049:
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
	add	r2, r0, #57344
	add	r5, r0, #26880
	ldrb	ip, [r2, #3331]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1082
	ldr	lr, [r3, #248]
	mov	r4, r5
	mov	r6, r5
	mov	r7, ip
	cmp	lr, #0
	add	r5, r5, #116
	add	r4, r4, #120
	add	r6, r6, #240
	beq	.L1060
.L1084:
	mov	r2, r6
	mov	r0, #32
	mov	r3, #0
	b	.L1058
.L1057:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L1083
.L1058:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #696]
	cmp	r1, ip
	bne	.L1057
	cmp	r0, r3
	movcs	r0, r3
	add	r3, r3, #1
	cmp	r3, lr
	str	r0, [r4, #-4]
	str	r0, [r5, #4]
	bne	.L1058
.L1083:
	cmp	r0, #31
	bhi	.L1060
.L1059:
	add	ip, ip, #1
	add	r5, r5, #8
	cmp	ip, #16
	add	r4, r4, #8
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	lr, #0
	bne	.L1084
.L1060:
	str	r7, [r4, #-4]
	str	r7, [r5, #4]
	b	.L1059
.L1082:
	ldr	r4, [r3, #248]
	mov	ip, #0
	mov	r6, r5
	mov	r7, ip
	cmp	r4, #0
	add	r5, r5, #116
	add	r6, r6, #240
	beq	.L1064
.L1086:
	mov	r1, r6
	mov	lr, #32
	mov	r2, #0
	b	.L1062
.L1061:
	add	r2, r2, #1
	cmp	r2, r4
	beq	.L1085
.L1062:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #36]
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #696]
	mov	r3, r3, asl #1
	cmp	r0, #2
	orreq	r3, r3, #1
	cmp	r3, ip
	bne	.L1061
	cmp	lr, r2
	movcs	lr, r2
	add	r2, r2, #1
	cmp	r2, r4
	str	lr, [r5]
	bne	.L1062
.L1085:
	cmp	lr, #31
	bhi	.L1064
.L1063:
	add	ip, ip, #1
	add	r5, r5, #4
	cmp	ip, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r4, #0
	bne	.L1086
.L1064:
	str	r7, [r5]
	b	.L1063
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
	ldrb	r2, [r3, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1089
	bcc	.L1096
	cmp	r2, #2
	bne	.L1106
.L1097:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1106:
	ldr	r1, .L1108
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1096:
	mov	r8, #1
.L1090:
	add	r6, r4, #20480
	add	r5, r4, #26880
	add	r6, r6, #244
	add	r5, r5, #240
	add	lr, r4, #61440
	mov	r7, #0
.L1094:
	ldr	ip, [r6, #4]!
	cmp	ip, #0
	movne	r1, r5
	movne	r3, #0
	beq	.L1095
.L1093:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	cmp	r2, #0
	beq	.L1092
	ldr	r0, [r2, #16]
	ldr	r2, [lr, #2672]
	cmp	r0, r2
	bls	.L1092
	ldr	r2, [r4]
	ldr	r2, [r2, #644]
	cmp	r2, #1
	beq	.L1107
.L1092:
	cmp	r3, ip
	bne	.L1093
.L1095:
	add	r7, r7, #1
	add	r5, r5, #132
	cmp	r7, r8
	bcc	.L1094
	b	.L1097
.L1107:
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1089:
	mov	r8, #2
	b	.L1090
.L1109:
	.align	2
.L1108:
	.word	.LC31
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
	subs	r5, r0, #0
	beq	.L1127
	bl	FindNearestPOCPicId
	add	r6, r5, #20480
	mvn	r4, #0
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	str	r4, [r6, #1832]
	cmp	r3, #2
	str	r0, [r6, #1836]
	beq	.L1128
	mov	r0, r5
	bl	InitListX
	cmp	r0, #0
	bne	.L1129
	ldr	r4, .L1131
	mov	r0, #13
	ldr	r1, .L1131+4
	bl	dprint_vfmw
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1130
.L1115:
	mov	r0, r5
	bl	ReorderListX
	mov	r0, r5
	bl	RepairList
	cmp	r0, #0
	bne	.L1120
	mov	r0, r5
	bl	FindMinRefIdx
	ldr	r3, [r5]
	ldr	r3, [r3, #644]
	cmp	r3, #1
	beq	.L1117
.L1121:
	add	r3, r5, #24576
	ldr	r3, [r3, #2548]
	cmp	r3, #0
	mvneq	r3, #0
	ldrne	r3, [r3, #36]
	ldrne	r3, [r3, #164]
.L1119:
	str	r3, [r6, #1832]
	mov	r0, #13
	ldr	r1, .L1131+8
	bl	dprint_vfmw
	ldr	r0, [r4]
	ands	r0, r0, #8192
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r5
	bl	DumpList.part.10
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1128:
	mov	r0, #0
	str	r0, [r6, #248]
	str	r0, [r6, #252]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1130:
	mov	r0, r5
	bl	DumpList.part.10
	b	.L1115
.L1117:
	mov	r0, r5
	bl	UvmosDeleteList
	cmp	r0, #0
	beq	.L1121
.L1120:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1129:
	ldr	r1, .L1131+12
	mov	r0, #13
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1127:
	movw	r3, #5591
	ldr	r2, .L1131+16
	ldr	r1, .L1131+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1132:
	.align	2
.L1131:
	.word	g_PrintEnable
	.word	.LC37
	.word	.LC38
	.word	.LC36
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	DecList, .-DecList
	.align	2
	.global	NoPicOut
	.type	NoPicOut, %function
NoPicOut:
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
	add	r4, r0, #61440
	ldr	ip, [r4, #1364]
	cmp	ip, #0
	addne	r3, r0, #27904
	movne	r2, #0
	addne	r3, r3, #164
	movne	lr, r2
	bne	.L1139
	b	.L1140
.L1148:
	ldrb	r1, [r3, #-672]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1137
	cmp	r2, ip
	add	r3, r3, #832
	beq	.L1140
.L1139:
	ldr	r1, [r3]
	add	r2, r2, #1
	cmp	r1, #1
	bne	.L1148
.L1137:
	cmp	r2, ip
	strb	lr, [r3, #-675]
	strb	lr, [r3, #-674]
	add	r3, r3, #832
	bne	.L1139
.L1140:
	ldr	r2, [r4, #1368]
	cmp	r2, #0
	beq	.L1149
	add	r0, r0, #62720
	mov	r3, #0
	add	r0, r0, #12
	mov	r1, r3
.L1141:
	add	r3, r3, #1
	str	r1, [r0, #4]!
	cmp	r3, r2
	bne	.L1141
	ldmfd	sp, {r4, fp, sp, pc}
.L1149:
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	NoPicOut, .-NoPicOut
	.align	2
	.global	GetBackPicFromVOQueue
	.type	GetBackPicFromVOQueue, %function
GetBackPicFromVOQueue:
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
	add	r5, r0, #61440
	mov	r9, r0
	ldr	r0, [r5, #2680]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1167
.L1151:
	ldr	r3, [r5, #1364]
	cmp	r3, #0
	beq	.L1158
	add	r10, r9, #27904
	mov	r6, #0
	add	r10, r10, #72
	mov	r7, #0
	mov	r8, #0
.L1157:
	sub	r4, r10, #32
	mov	r3, #0
	strb	r3, [r10, #-583]
	strb	r3, [r10, #-582]
.L1156:
	ldr	r1, [r4, #8]!
	cmp	r1, #0
	beq	.L1155
	ldr	r0, [r5, #2680]
	bl	FreeUsdByDec
	strd	r6, [r4]
.L1155:
	cmp	r4, r10
	bne	.L1156
	ldr	r3, [r5, #1364]
	add	r8, r8, #1
	add	r10, r10, #832
	cmp	r3, r8
	bhi	.L1157
.L1158:
	ldr	r2, [r5, #1368]
	cmp	r2, #0
	beq	.L1168
	add	r9, r9, #62720
	mov	r3, #0
	add	r9, r9, #12
	mov	r1, r3
.L1159:
	add	r3, r3, #1
	str	r1, [r9, #4]!
	cmp	r3, r2
	bne	.L1159
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1167:
	add	r0, r9, #8
	bl	ResetVoQueue
	b	.L1151
.L1168:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetBackPicFromVOQueue, .-GetBackPicFromVOQueue
	.align	2
	.global	wait_vo
	.type	wait_vo, %function
wait_vo:
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	wait_vo, .-wait_vo
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
	bne	.L1171
	add	lr, r5, #24576
	ldr	r8, [r4, #3272]
	ldr	lr, [lr, #2136]
	add	lr, lr, #1
	cmp	r8, lr
	moveq	r3, r1
	beq	.L1172
.L1171:
	ldr	r1, .L1176
	ldr	r8, [r1]
	cmp	r8, #0
	beq	.L1175
	add	r1, r5, #61440
	mov	r0, r0, asl #4
	mov	r2, r2, asl #4
	mov	r3, r3, asl #4
	mov	ip, ip, asl #4
	strh	r0, [fp, #-42]	@ movhi
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #8
	ldr	r0, [r1, #2680]
	mov	r1, #2
	strh	ip, [fp, #-44]	@ movhi
	blx	r8
.L1175:
	ldr	lr, [r4, #3272]
	mov	r3, #1
.L1172:
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
.L1177:
	.align	2
.L1176:
	.word	g_event_report
	UNWIND(.fnend)
	.size	GetReRangeFlag, .-GetReRangeFlag
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
	beq	.L1180
	bcc	.L1181
	cmp	r1, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r2, #0
	add	r4, r0, #16384
	bne	.L1236
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	bne	.L1214
	ldr	r2, [r4, #3484]
	ldr	r0, [r4, #3480]
	ldr	r1, [r4, #3492]
	cmp	r2, r0
	addcc	r1, r1, r3
	strcc	r1, [r4, #3488]
	bcs	.L1216
.L1217:
	add	r3, r1, r2
	str	r3, [r4, #3476]
	ldr	r0, [r6, #236]
	mov	r3, r3, asl #1
	cmp	r0, #0
	subeq	r3, r3, #1
	str	r3, [r4, #3464]
	ldrb	r0, [r6, #209]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1220
	str	r3, [r4, #3460]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
.L1213:
	str	r2, [r4, #3480]
	str	r1, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1181:
	cmp	r2, #0
	add	lr, lr, #4
	add	r4, r0, #16384
	mov	ip, ip, asl lr
	bne	.L1187
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	bne	.L1185
	ldr	lr, [r4, #3428]
	ldr	r1, [r4, #3432]
	mov	r2, lr
.L1186:
	ldr	r0, [r4, #3420]
	cmp	r0, r1
	bcs	.L1184
	rsb	r3, r0, r1
	cmp	r3, ip, lsr #1
	addcs	r2, r2, ip
	strcs	r2, [r4, #3436]
	bcc	.L1184
.L1188:
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1190
.L1238:
	ldr	r3, [r4, #3424]
	add	r2, r2, r0
	str	r2, [r4, #3452]
	add	r3, r2, r3
	str	r3, [r4, #3456]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r4, #3464]
.L1191:
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
.L1180:
	cmp	r2, #0
	add	r4, r0, #16384
	movne	r3, #0
	strne	r3, [r4, #3488]
	bne	.L1195
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	beq	.L1196
	mov	r3, r2
	str	r2, [r4, #3492]
	str	r2, [r4, #3480]
.L1197:
	str	r3, [r4, #3488]
.L1195:
	ldr	r3, [r5, #2216]
	cmp	r3, #0
	beq	.L1199
	ldr	r3, [r4, #3484]
	ldr	r0, [r4, #3488]
	add	r0, r3, r0
	str	r0, [r4, #3476]
	ldr	r7, [r6, #236]
	cmp	r7, #0
	bne	.L1201
	cmp	r0, #0
	beq	.L1202
	sub	r0, r0, #1
	str	r0, [r4, #3476]
.L1201:
	mov	r3, #0
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2216]
	cmp	r1, r3
	bgt	.L1222
	cmp	r0, #0
	beq	.L1205
.L1239:
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
	blt	.L1206
	add	r2, r5, #2208
	add	r1, r1, #1
	add	r2, r2, #8
	mov	r3, #0
.L1207:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r4, #3504]
	bne	.L1207
.L1206:
	cmp	r7, #0
	ldreq	r3, [r5, #2208]
	addeq	r0, r0, r3
	streq	r0, [r4, #3504]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1209
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
.L1210:
	ldr	r2, [r4, #3484]
	ldr	r3, [r4, #3488]
	str	r0, [r4, #3460]
	str	r2, [r4, #3480]
	str	r3, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1185:
	ldr	lr, [r4, #3448]
	cmp	lr, #0
	beq	.L1237
.L1187:
	ldr	r0, [r4, #3420]
	mov	r3, #0
	mov	lr, r3
	mov	r2, r1
	str	r3, [r4, #3428]
	str	r3, [r4, #3432]
.L1184:
	cmp	r0, r1
	bls	.L1189
	rsb	r1, r1, r0
	cmp	r1, ip, lsr #1
	rsbhi	r2, ip, r2
	strhi	r2, [r4, #3436]
	bhi	.L1188
.L1189:
	str	lr, [r4, #3436]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1238
.L1190:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r2, r0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	str	r3, [r4, #3464]
	b	.L1191
.L1236:
	mov	r3, #0
	ldr	r2, [r4, #3484]
	mov	r1, r3
	str	r3, [r4, #3488]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
	str	r3, [r4, #3460]
	str	r3, [r4, #3464]
	b	.L1213
.L1199:
	str	r3, [r4, #3476]
	ldr	r7, [r6, #236]
.L1202:
	mov	r0, #0
	str	r0, [r4, #3508]
	ldr	r3, [r5, #2216]
	cmp	r3, r0
	ble	.L1205
.L1222:
	add	ip, r5, #2208
	mov	r3, #0
	add	ip, ip, #8
	mov	r2, r3
.L1204:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2216]
	cmp	r1, r2
	bgt	.L1204
	cmp	r0, #0
	bne	.L1239
.L1205:
	mov	r0, #0
	str	r0, [r4, #3504]
	b	.L1206
.L1209:
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
	b	.L1210
.L1196:
	ldr	r1, [r4, #3484]
	ldr	r2, [r4, #3480]
	cmp	r1, r2
	bcs	.L1198
	ldr	r2, [r4, #3492]
	add	r3, r3, r2
	str	r3, [r4, #3488]
	b	.L1195
.L1220:
	ldrb	r0, [r6, #210]	@ zero_extendqisi2
	str	r3, [r4, #3460]
	cmp	r0, #0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	b	.L1213
.L1214:
	str	r2, [r4, #3480]
	mov	r1, r2
	str	r2, [r4, #3492]
	ldr	r2, [r4, #3484]
.L1216:
	str	r1, [r4, #3488]
	b	.L1217
.L1237:
	ldr	r3, [r4, #3452]
	mov	r2, r1
	str	lr, [r4, #3428]
	mov	r1, r3
	str	r3, [r4, #3432]
	b	.L1186
.L1198:
	ldr	r3, [r4, #3492]
	b	.L1197
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
	add	r6, r0, #57344
	ldr	r1, [ip, #1304]
	mov	r7, #1
	ldr	r3, [ip, #1300]
	mla	r1, r4, r2, r1
	ldrb	r2, [r6, #3331]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r1, [r1, #28]
	mla	r3, lr, r1, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r7, r7, asl r3
	add	r3, r0, #24576
	beq	.L1241
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
	beq	.L1261
.L1260:
	ldr	ip, [lr, #4]!
	ldrb	r2, [ip, #2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1255
	ldr	r2, [ip, #660]
	ldr	r8, [r6, #3992]
	cmp	r2, r8
	rsbhi	r2, r7, r2
	str	r2, [ip, #664]
	ldr	r2, [lr]
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L1258
	ldr	r8, [r2, #744]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	ip, [r2, #664]
	addeq	ip, r5, ip, lsl #1
	streq	ip, [r2, #752]
	ldreq	r2, [lr]
	ldreqb	ip, [r2, #2]	@ zero_extendqisi2
.L1258:
	tst	ip, #2
	beq	.L1255
	ldr	ip, [r2, #784]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	ldreq	ip, [r2, #664]
	addeq	ip, r4, ip, lsl #1
	streq	ip, [r2, #792]
.L1255:
	ldr	r2, [r3, #2144]
	add	r1, r1, #1
	cmp	r2, r1
	bhi	.L1260
.L1261:
	ldr	r2, [r3, #2148]
	cmp	r2, #0
	beq	.L1285
	add	r0, r0, #26624
	mov	r2, #0
	add	r0, r0, #20
.L1266:
	ldr	ip, [r0, #4]!
	add	r2, r2, #1
	ldrb	r1, [ip, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1263
	tst	r1, #1
	beq	.L1264
	ldr	lr, [ip, #744]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	ldreq	r1, [ip, #668]
	addeq	r1, r5, r1, lsl #1
	streq	r1, [ip, #748]
	ldreq	ip, [r0]
	ldreqb	r1, [ip, #2]	@ zero_extendqisi2
.L1264:
	tst	r1, #2
	beq	.L1263
	ldr	r1, [ip, #784]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [ip, #668]
	addeq	r1, r4, r1, lsl #1
	streq	r1, [ip, #788]
.L1263:
	ldr	r1, [r3, #2148]
	cmp	r1, r2
	bhi	.L1266
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1241:
	ldr	r1, [r3, #2144]
	cmp	r1, #0
	addne	ip, r0, #26368
	addne	ip, ip, #212
	bne	.L1250
.L1251:
	ldr	r2, [r3, #2148]
	cmp	r2, #0
	beq	.L1286
	add	r0, r0, #26624
	mov	r2, #0
	add	r0, r0, #20
	b	.L1253
.L1252:
	ldr	r1, [r3, #2148]
	cmp	r1, r2
	bls	.L1287
.L1253:
	ldr	r1, [r0, #4]!
	add	r2, r2, #1
	ldrb	ip, [r1, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1252
	ldr	ip, [r1, #704]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	ldreq	ip, [r1, #668]
	streq	ip, [r1, #708]
	ldr	r1, [r3, #2148]
	cmp	r1, r2
	bhi	.L1253
.L1287:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1288:
	ldr	lr, [r1, #704]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L1247
	ldr	lr, [r1, #660]
	ldr	r4, [r6, #3992]
	rsb	r5, r7, lr
	cmp	lr, r4
	strhi	r5, [r1, #664]
	strls	lr, [r1, #664]
	ldr	r1, [ip]
	ldr	lr, [r1, #664]
	str	lr, [r1, #712]
.L1247:
	ldr	r1, [r3, #2144]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1251
.L1250:
	ldr	r1, [ip, #4]!
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L1247
	b	.L1288
.L1286:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1285:
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
	beq	.L1294
	add	r3, r0, #24576
	ldr	ip, [r3, #2140]
	cmp	ip, #0
	beq	.L1294
	ldr	r3, [r3, #1944]
	cmp	r3, r1
	beq	.L1296
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #152
	b	.L1291
.L1292:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1296
.L1291:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1292
.L1294:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1296:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsOutDPB, .-IsOutDPB
	.align	2
	.global	WritePicMsg
	.type	WritePicMsg, %function
WritePicMsg:
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
	subs	r4, r0, #0
	beq	.L1332
	add	r9, r4, #57344
	add	lr, r4, #12288
	ldr	r1, .L1335
	mov	r0, #2
	ldr	ip, [r9, #4052]
	add	r5, r4, #61440
	ldrb	r3, [r9, #3331]	@ zero_extendqisi2
	mov	r6, lr
	ldr	r2, [r9, #4000]
	mov	r7, #0
	str	ip, [sp, #4]
	add	r8, r4, #16384
	ldr	ip, [r9, #3492]
	str	lr, [fp, #-52]
	str	ip, [sp]
	bl	dprint_vfmw
	add	r3, r4, #61184
	str	r7, [r5, #2604]
	movw	r2, #62880
	ldrd	r0, [r3, #88]
	strd	r0, [r4, r2]
	ldr	r3, [r5, #2600]
	str	r3, [r5, #2360]
	ldr	r3, [r9, #3456]
	str	r3, [r5, #2136]
	ldr	r3, [r9, #3460]
	str	r3, [r5, #2140]
	ldr	r3, [r9, #3480]
	str	r3, [r5, #2144]
	ldr	r3, [r9, #3484]
	str	r3, [r5, #2148]
	ldr	r3, [r9, #4000]
	str	r3, [r5, #1448]
	ldrb	r3, [r9, #3331]	@ zero_extendqisi2
	strb	r3, [r5, #1416]
	ldrb	r3, [r6, #1327]	@ zero_extendqisi2
	str	r3, [r5, #1464]
	ldr	r3, [r9, #4036]
	str	r3, [r5, #1452]
	ldr	r3, [r9, #4040]
	str	r3, [r5, #1456]
	ldr	r3, [r8, #460]
	add	r3, r3, #1
	str	r3, [r5, #1460]
	ldrb	r3, [r6, #1326]	@ zero_extendqisi2
	strb	r3, [r5, #1419]
	ldr	r3, [r8, #1272]
	str	r3, [r5, #1468]
	ldrb	r3, [r8, #1212]	@ zero_extendqisi2
	str	r3, [r5, #1472]
	ldr	r3, [r6, #1348]
	strb	r3, [r5, #1417]
	ldrb	r3, [r8, #1216]	@ zero_extendqisi2
	ldr	r0, [r5, #2680]
	str	r3, [r5, #1476]
	ldr	r3, [r8, #3464]
	str	r3, [r5, #1480]
	ldr	r3, [r8, #3452]
	str	r3, [r5, #1484]
	ldr	r3, [r8, #3456]
	str	r3, [r5, #1488]
	ldr	r3, [r9, #3984]
	ldr	r1, [r3, #656]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L1333
	ldr	r2, [r10, #28]
	ldr	r3, [r10, #32]
	cmp	r2, #0
	beq	.L1302
	cmp	r3, #0
	beq	.L1302
	add	r3, r4, #63232
	add	r2, r4, #62976
	add	r2, r2, #204
	ldr	r0, [r5, #2680]
	mov	r1, r3
	add	r3, r3, #76
	add	r1, r1, #204
	add	r6, r4, #24576
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r10, #28]
	add	r2, r4, #63232
	add	r1, r4, #63488
	add	r2, r2, #208
	add	r1, r1, #80
	ldr	r3, [r3, #4]
	ldr	r0, [r5, #2680]
	str	r3, [r5, #1724]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r9, #4052]
	str	r3, [r5, #1732]
	ldr	r3, [r10, #12]
	str	r3, [r5, #2132]
	ldr	r3, [r10, #32]
	ldr	r3, [r3, #8]
	str	r3, [r5, #1728]
	ldr	r3, [r10, #32]
	ldr	r3, [r3, #64]
	str	r3, [r5, #1736]
	ldr	r3, [r6, #2412]
	cmp	r3, #0
	str	r3, [fp, #-48]
	str	r3, [r5, #2352]
	beq	.L1308
	add	lr, r4, #63488
	add	r9, r4, #26624
	add	r1, r4, #26880
	ldr	r10, [fp, #-48]
	mov	ip, r9
	mov	r0, lr
	mov	r2, lr
	add	r9, r9, #168
	add	lr, lr, #108
	add	ip, ip, #232
	add	r0, r0, #172
	add	r1, r1, #40
	add	r2, r2, #236
	mov	r3, r7
.L1307:
	ldr	r7, [r9, #4]!
	add	r3, r3, #1
	cmp	r3, r10
	str	r7, [lr, #4]!
	ldr	r7, [ip, #4]!
	str	r7, [r0, #4]!
	ldr	r7, [r1, #4]!
	str	r7, [r2, #4]!
	bne	.L1307
.L1308:
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3, #1333]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1334
	ldrb	r1, [r8, #1230]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1309
	add	ip, r4, #62720
	ldr	r0, .L1335+4
	add	ip, ip, #208
.L1310:
	and	r3, r1, #3
	add	r1, r1, #1
	cmp	r1, #24
	ldr	r3, [r0, r3, asl #2]
	bic	r2, r3, #16711680
	ubfx	lr, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, lr, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1310
	add	r7, r4, #62976
	mov	lr, #0
	add	r7, r7, #52
.L1311:
	add	r3, lr, #1
	and	r2, lr, #14
	and	r3, r3, #15
	add	lr, lr, #2
	add	r2, r0, r2, lsl #2
	cmp	lr, #32
	add	r3, r0, r3, lsl #2
	ldr	r1, [r2, #16]
	ldr	ip, [r3, #16]
	ubfx	r3, r1, #8, #8
	mov	r2, r1, lsr #24
	uxtb	r10, r1
	uxtb	r9, ip
	mov	r8, ip, lsr #16
	orr	r3, r3, r2, asl #8
	mov	r1, r1, lsr #8
	mov	r9, r9, asl #16
	and	r2, ip, #-16777216
	orr	r8, r9, r8, asl #24
	ubfx	ip, ip, #8, #8
	orr	r3, r3, r2
	orr	r8, r8, r10
	and	r1, r1, #65280
	orr	r3, r3, ip, asl #16
	orr	r2, r8, r1
	stmia	r7, {r2, r3}
	add	r7, r7, #8
	bne	.L1311
.L1316:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1313
	add	r9, r4, #63744
	add	r7, r4, #26624
	add	r7, r7, #172
	mov	r8, #0
	mov	r4, r9
	add	r9, r9, #160
	add	r4, r4, #224
.L1319:
	ldr	r2, [r7]
	mov	r1, #0
	ldr	r0, [r5, #2680]
	add	r8, r8, #1
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7], #4
	str	r3, [r4, #4]!
	ldr	r3, [r6, #2412]
	cmp	r3, r8
	bhi	.L1319
.L1313:
	mov	r0, #0
.L1329:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1334:
	ldrb	r1, [r8, #1230]	@ zero_extendqisi2
.L1309:
	cmp	r1, #1
	add	ip, r4, #62720
	mov	r0, #0
	add	ip, ip, #208
	beq	.L1314
.L1317:
	add	r3, r0, #3888
	add	r0, r0, #1
	add	r3, r3, #2
	cmp	r0, #24
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1317
	add	r9, r4, #62976
	mov	r10, #1
	add	r9, r9, #52
	mov	r8, #0
.L1318:
	mov	r2, r8, lsr #3
	mov	r3, r8, asl #1
	and	r1, r10, #15
	and	r0, r3, #14
	mov	r3, r2, asl #4
	add	r8, r8, #1
	add	r2, r3, r1
	add	r3, r3, r0
	add	r2, r2, #3904
	add	r3, r3, #3904
	add	r2, r2, #10
	add	r3, r3, #10
	cmp	r8, #16
	add	r10, r10, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r1, [r2, #8]
	ldr	r3, [r3, #8]
	ubfx	r7, r1, #8, #8
	and	r0, r1, #-16777216
	mov	r2, r1, lsr #16
	uxtb	r1, r1
	mov	ip, r3, lsr #24
	uxtb	lr, r3
	mov	r2, r2, asl #24
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r7, asl #16
	mov	r1, r3, lsr #8
	orr	r2, r2, lr
	and	r1, r1, #65280
	ubfx	r3, r3, #8, #8
	orr	r0, ip, r0
	orr	r2, r2, r1
	orr	r3, r0, r3
	stmia	r9, {r2, r3}
	add	r9, r9, #8
	bne	.L1318
	b	.L1316
.L1314:
	add	r3, r0, #4864
	add	r0, r0, #1
	add	r3, r3, #30
	cmp	r0, #24
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1314
	add	ip, r4, #62976
	mov	lr, #1
	add	ip, ip, #52
	mov	r0, #0
.L1315:
	mov	r2, r0, lsr #3
	mov	r3, r0, asl #1
	and	r1, lr, #15
	and	r7, r3, #14
	mov	r3, r2, asl #4
	add	r0, r0, #1
	add	r2, r3, r1
	add	r3, r3, r7
	add	r2, r2, #4864
	add	r3, r3, #4864
	add	r2, r2, #54
	add	r3, r3, #54
	cmp	r0, #16
	add	lr, lr, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r2, [r2, #4]
	ldr	r3, [r3, #4]
	ubfx	r10, r2, #8, #8
	and	r1, r2, #-16777216
	mov	r8, r2, lsr #16
	uxtb	r2, r2
	mov	r7, r3, lsr #24
	uxtb	r9, r3
	mov	r8, r8, asl #24
	mov	r7, r7, asl #8
	orr	r8, r8, r2, asl #16
	orr	r7, r7, r10, asl #16
	mov	r2, r3, lsr #8
	orr	r8, r8, r9
	and	r2, r2, #65280
	ubfx	r3, r3, #8, #8
	orr	r1, r7, r1
	orr	r2, r8, r2
	orr	r3, r1, r3
	stmia	ip, {r2, r3}
	add	ip, ip, #8
	bne	.L1315
	b	.L1316
.L1302:
	ldr	r1, .L1335+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1329
.L1332:
	movw	r3, #6948
	ldr	r2, .L1335+12
	ldr	r1, .L1335+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1329
.L1333:
	ldr	r3, [r9, #3984]
	ldr	r1, .L1335+20
	ldr	r2, [r3, #656]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1329
.L1336:
	.align	2
.L1335:
	.word	.LC39
	.word	.LANCHOR1
	.word	.LC41
	.word	.LC8
	.word	.LC9
	.word	.LC40
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
	add	r8, r0, #61440
	add	lr, r0, #12288
	movw	r1, #4060
	ldr	r3, [r8, #2604]
	mov	r4, r0
	ldr	ip, [r8, #2600]
	mov	r2, r3
	str	r3, [fp, #-48]
	mul	r1, r1, r2
	add	r3, r3, #1
	str	r3, [r8, #2604]
	ldr	r3, [lr, #1284]
	add	r6, ip, r1
	sub	r3, r3, #1
	cmp	r2, r3
	addcc	r3, r1, #4048
	addcc	r3, r3, #12
	movcs	r3, #0
	addcc	r3, ip, r3
	str	r3, [r6, #4056]
	ldr	r2, [r0, #368]
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	r3, [r2, #68]
	cmp	r0, #1
	cmpls	r0, r3
	bcs	.L1341
	add	r5, r0, #3
	add	r5, r6, r5, lsl #2
.L1342:
	mov	r3, r0, asl #5
	sub	r3, r3, r0, asl #2
	add	r0, r0, #1
	add	r2, r2, r3
	ldr	r2, [r2, #24]
	str	r2, [r5, #4]!
	ldr	r2, [r4, #368]
	add	r2, r2, r3
	ldr	r2, [r2, #20]
	str	r2, [r5, #-8]
	ldr	r2, [r4, #368]
	add	r3, r2, r3
	ldr	r3, [r3, #28]
	str	r3, [r5, #8]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #68]
	cmp	r3, r0
	movhi	r7, #1
	movls	r7, #0
	cmp	r0, #1
	movhi	r7, #0
	cmp	r7, #0
	bne	.L1342
.L1341:
	cmp	r3, #1
	bhi	.L1347
	add	r3, r3, #3
	add	r0, r6, #20
	mov	r2, #0
	add	r3, r6, r3, lsl #2
.L1346:
	str	r2, [r3, #4]!
	cmp	r3, r0
	str	r2, [r3, #-8]
	str	r2, [r3, #8]
	bne	.L1346
.L1347:
	add	r7, r4, #57344
	add	r9, r4, #16384
	add	r5, r4, #20480
	ldrb	r3, [r7, #3337]	@ zero_extendqisi2
	strb	r3, [r6, #1]
	ldr	r3, [r9, #1260]
	ldr	r0, [r5, #1816]
	add	r3, r3, #26
	add	r3, r3, r0
	str	r3, [r6, #32]
	ldr	r2, [r5, #1812]
	str	r2, [r6, #36]
	ldr	r2, [r5, #264]
	str	r2, [r6, #40]
	ldr	r2, [r5, #260]
	str	r2, [r6, #44]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	strb	r2, [ip, r1]
	ldr	r2, [r5, #256]
	str	r2, [r6, #48]
	ldrb	r2, [r5, #214]	@ zero_extendqisi2
	strb	r2, [r6, #2]
	ldrb	r2, [lr, #1328]	@ zero_extendqisi2
	strb	r2, [r6, #3]
	ldr	r2, [r5, #248]
	str	r2, [r6, #52]
	ldr	r2, [r5, #252]
	str	r2, [r6, #56]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1446
	cmp	r2, #0
	ldreqb	r2, [r9, #1214]	@ zero_extendqisi2
	movne	r2, #0
	strb	r2, [r6, #4]
.L1348:
	ldr	r2, [r9, #1264]
	str	r2, [r6, #60]
	ldr	r2, [r9, #1268]
	str	r2, [r6, #64]
	ldr	r2, [r5, #1824]
	str	r2, [r6, #68]
	ldr	r2, [r5, #1828]
	str	r2, [r6, #72]
	ldr	r2, [r5, #1820]
	str	r2, [r6, #76]
	ldrb	r2, [r5, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1350
	ldr	r10, [r7, #3984]
	ldr	r2, [fp, #-48]
	ldr	r1, [r8, #2604]
	ldr	r0, [r10, #700]
	mla	r0, r0, r2, r3
	bl	__aeabi_uidiv
	str	r0, [r10, #736]
.L1351:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r7, #3984]
	bne	.L1353
	ldr	r2, [r6, #32]
	str	r2, [r3, #728]
	ldr	r3, [r7, #3984]
	ldr	r2, [r6, #32]
	str	r2, [r3, #732]
.L1354:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1392
	ldr	ip, [r5, #248]
	cmp	ip, #0
	beq	.L1395
	add	r3, r4, #24576
	ldr	r3, [r3, #2548]
	ldr	r1, [r3, #36]
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r2, r4, #26880
	movne	r3, #0
	addne	r2, r2, #244
	bne	.L1360
	b	.L1358
.L1362:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldrb	r0, [r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1358
.L1360:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1362
	mov	r3, #0
	str	r3, [fp, #-52]
.L1357:
	ldr	ip, [r5, #252]
	cmp	ip, #0
	beq	.L1396
	add	r3, r4, #24576
	ldr	r3, [r3, #2680]
	ldr	r1, [r3, #36]
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r2, r4, #27136
	movne	r3, #0
	addne	r2, r2, #120
	bne	.L1366
	b	.L1364
.L1368:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldrb	r0, [r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1364
.L1366:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1368
	mov	r3, #0
	str	r3, [fp, #-56]
.L1363:
	ldrb	r2, [r7, #3331]	@ zero_extendqisi2
	ldr	r3, [r5, #248]
	cmp	r2, #0
	beq	.L1369
	cmp	r3, #0
	beq	.L1384
	add	r7, r4, #26880
	mov	r3, #0
	mov	r10, r6
	str	r6, [fp, #-60]
	str	r4, [fp, #-64]
	mov	r6, r5
	add	r7, r7, #244
	ldr	r4, [fp, #-52]
	mov	r5, r3
	b	.L1383
.L1381:
	strb	r1, [r10, #1630]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1631]
	ldr	r1, [r7]
	ldr	r1, [r1, #12]
	str	r1, [r10, #1656]
.L1382:
	ldr	r1, [r6, #248]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r10, r10, #36
	cmp	r1, r5
	bls	.L1447
.L1383:
	ldr	r1, [r7]
	ldr	r0, [r8, #2680]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #656]
	bl	FSP_GetLogicFs
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #692]
	str	r1, [r10, #1636]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1625]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1380
	cmp	r0, #0
	ldrne	r1, [r0, #28]
	ldrne	r0, [r1, #4]
.L1380:
	str	r0, [r10, #1640]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #696]
	str	r1, [r10, #1644]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	str	r1, [r10, #1632]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #1624]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #704]	@ zero_extendqisi2
	strb	r1, [r10, #1626]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1381
	strb	r1, [r10, #1628]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1629]
	ldr	r1, [r7]
	ldr	r1, [r1, #12]
	str	r1, [r10, #1652]
	b	.L1382
.L1447:
	mov	r5, r6
	ldr	r4, [fp, #-64]
	ldr	r6, [fp, #-60]
.L1384:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1448
.L1372:
	add	r2, r4, #26880
	add	r3, r6, #3920
	add	r0, r6, #4048
	add	r2, r2, #112
	add	r3, r3, #4
	add	r0, r0, #4
.L1389:
	ldr	r1, [r2, #4]!
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L1389
	ldrb	r3, [r9, #1214]	@ zero_extendqisi2
	cmp	r3, #0
	str	r3, [r8, #1716]
	ldr	r3, [r9, #1256]
	str	r3, [r8, #1720]
	beq	.L1390
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1391
.L1390:
	cmp	r3, #1
	beq	.L1449
.L1392:
	ldr	r3, [fp, #-48]
	mov	r2, #0
	ldr	r1, [r4, #368]
	add	r3, r3, #15488
	add	r3, r3, #60
	str	r1, [r4, r3, asl #2]
	str	r2, [r4, #368]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1353:
	ldr	r1, [r6, #32]
	ldr	r0, [r3, #728]
	ldr	r2, [r3, #732]
	cmp	r0, r1
	movlt	r0, r1
	cmp	r2, r1
	str	r0, [r3, #728]
	movge	r2, r1
	str	r2, [r3, #732]
	b	.L1354
.L1350:
	ldr	r10, [r7, #3984]
	ldrb	r2, [r5, #210]	@ zero_extendqisi2
	ldr	r1, [r8, #2604]
	ldr	r0, [r10, #700]
	cmp	r2, #0
	ldr	r2, [fp, #-48]
	mla	r0, r0, r2, r3
	bne	.L1352
	bl	__aeabi_uidiv
	str	r0, [r10, #776]
	b	.L1351
.L1352:
	bl	__aeabi_uidiv
	str	r0, [r10, #816]
	b	.L1351
.L1358:
	ldr	r1, [r1, #656]
	ldr	r0, [r8, #2680]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	movweq	r2, #7311
	beq	.L1442
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-52]
	b	.L1357
.L1449:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1392
.L1391:
	ldr	r3, [r5, #268]
	add	r9, r4, #20736
	add	lr, r4, #21504
	add	r7, r4, #20992
	add	r0, r4, #21760
	mov	r8, r9
	str	r3, [r6, #80]
	mov	ip, lr
	ldr	r10, [r5, #272]
	add	r9, r9, #16
	add	r8, r8, #144
	add	r7, r7, #16
	add	lr, lr, #16
	add	ip, ip, #144
	add	r0, r0, #16
	mov	r1, r6
	mov	r3, r6
	mov	r2, #0
	str	r6, [fp, #-52]
	str	r10, [r1, #84]!
.L1393:
	ldr	r10, [r9, #4]!
	add	r2, r2, #1
	add	r3, r3, #4
	str	r10, [r1, #4]!
	ldr	r10, [r8, #4]!
	str	r10, [r3, #212]
	ldr	r10, [r7, #4]!
	str	r10, [r3, #340]
	ldr	r10, [lr, #4]!
	str	r10, [r3, #852]
	ldr	r10, [ip, #4]!
	str	r10, [r3, #980]
	ldr	r10, [r0, #4]!
	str	r10, [r3, #1108]
	ldr	r10, [r5, #260]
	cmp	r10, r2
	bcs	.L1393
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1392
	add	lr, r4, #21248
	add	r1, r4, #22016
	add	r7, r4, #20992
	add	r0, r4, #21760
	ldr	r8, [fp, #-52]
	mov	ip, lr
	mov	r2, r1
	add	r6, r6, #468
	add	r7, r7, #144
	add	lr, lr, #16
	add	ip, ip, #144
	add	r0, r0, #144
	add	r1, r1, #16
	add	r2, r2, #144
	mov	r3, #0
.L1394:
	ldr	r9, [r7, #4]!
	add	r3, r3, #1
	add	r8, r8, #4
	str	r9, [r6, #4]!
	ldr	r9, [lr, #4]!
	str	r9, [r8, #596]
	ldr	r9, [ip, #4]!
	str	r9, [r8, #724]
	ldr	r9, [r0, #4]!
	str	r9, [r8, #1236]
	ldr	r9, [r1, #4]!
	str	r9, [r8, #1364]
	ldr	r9, [r2, #4]!
	str	r9, [r8, #1492]
	ldr	r9, [r5, #264]
	cmp	r9, r3
	bcs	.L1394
	b	.L1392
.L1369:
	cmp	r3, #0
	beq	.L1377
	add	r3, r4, #26880
	str	r4, [fp, #-64]
	add	r3, r3, #244
	ldr	r4, [fp, #-52]
	mov	r7, r6
	str	r6, [fp, #-60]
	mov	r10, r3
	mov	r6, r5
	mov	r5, r2
.L1376:
	ldr	r1, [r10]
	ldr	r0, [r8, #2680]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #656]
	bl	FSP_GetLogicFs
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #692]
	str	r1, [r7, #1636]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #1625]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1375
	cmp	r0, #0
	ldrne	r1, [r0, #28]
	ldrne	r0, [r1, #4]
.L1375:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r1, [r10]
	add	r5, r5, #1
	add	r7, r7, #36
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #696]
	str	r1, [r7, #1608]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	str	r1, [r7, #1596]
	ldr	r1, [r10]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #1591]
	ldr	r1, [r10]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r7, #1590]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #716]
	str	r1, [r7, #1612]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #756]
	str	r1, [r7, #1616]
	ldr	r1, [r10], #4
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #796]
	strb	r3, [r7, #1588]
	str	r1, [r7, #1620]
	ldr	r1, [r6, #248]
	cmp	r1, r5
	bhi	.L1376
	mov	r5, r6
	ldr	r4, [fp, #-64]
	ldr	r6, [fp, #-60]
.L1377:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1372
	ldr	r3, [r5, #252]
	cmp	r3, #0
	beq	.L1372
	add	r3, r4, #27136
	str	r4, [fp, #-60]
	add	r3, r3, #120
	ldr	r4, [fp, #-56]
	mov	r10, #0
	mov	r7, r6
	str	r6, [fp, #-52]
	mov	r6, r5
	mov	r5, r10
	mov	r10, r3
.L1379:
	ldr	r1, [r10]
	ldr	r0, [r8, #2680]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #656]
	bl	FSP_GetLogicFs
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #692]
	str	r1, [r7, #2788]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #2777]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1378
	cmp	r0, #0
	ldrne	r1, [r0, #28]
	ldrne	r0, [r1, #4]
.L1378:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r1, [r10]
	add	r5, r5, #1
	add	r7, r7, #36
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #696]
	str	r1, [r7, #2760]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	str	r1, [r7, #2748]
	ldr	r1, [r10]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #2743]
	ldr	r1, [r10]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r7, #2742]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #716]
	str	r1, [r7, #2764]
	ldr	r1, [r10]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #756]
	str	r1, [r7, #2768]
	ldr	r1, [r10], #4
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #796]
	strb	r3, [r7, #2740]
	str	r1, [r7, #2772]
	ldr	r1, [r6, #252]
	cmp	r1, r5
	bhi	.L1379
.L1441:
	mov	r5, r6
	ldr	r4, [fp, #-60]
	ldr	r6, [fp, #-52]
	b	.L1372
.L1364:
	ldr	r1, [r1, #656]
	ldr	r0, [r8, #2680]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1450
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-56]
	b	.L1363
.L1446:
	ldr	r2, [r9, #1256]
	strb	r2, [r6, #4]
	b	.L1348
.L1448:
	ldr	r3, [r5, #252]
	cmp	r3, #0
	beq	.L1372
	add	r7, r4, #27136
	mov	r3, #0
	mov	r10, r6
	str	r6, [fp, #-52]
	str	r4, [fp, #-60]
	mov	r6, r5
	add	r7, r7, #120
	ldr	r4, [fp, #-56]
	mov	r5, r3
	b	.L1388
.L1386:
	strb	r1, [r10, #2782]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2783]
	ldr	r1, [r7]
	ldr	r1, [r1, #12]
	str	r1, [r10, #2808]
.L1387:
	ldr	r1, [r6, #252]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r10, r10, #36
	cmp	r1, r5
	bls	.L1441
.L1388:
	ldr	r1, [r7]
	ldr	r0, [r8, #2680]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #656]
	bl	FSP_GetLogicFs
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #692]
	str	r1, [r10, #2788]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2777]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1385
	cmp	r0, #0
	ldrne	r1, [r0, #28]
	ldrne	r0, [r1, #4]
.L1385:
	str	r0, [r10, #2792]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #696]
	str	r1, [r10, #2796]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	str	r1, [r10, #2784]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #2776]
	ldr	r1, [r7]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #704]	@ zero_extendqisi2
	strb	r1, [r10, #2778]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1386
	strb	r1, [r10, #2780]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2781]
	ldr	r1, [r7]
	ldr	r1, [r1, #12]
	str	r1, [r10, #2804]
	b	.L1387
.L1450:
	movw	r2, #7332
.L1442:
	ldr	r1, .L1451
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L1395:
	str	ip, [fp, #-52]
	b	.L1357
.L1396:
	str	ip, [fp, #-56]
	b	.L1363
.L1452:
	.align	2
.L1451:
	.word	.LC42
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
	add	r0, r0, #61440
	ldr	r2, [r0, #2360]
	cmp	r2, #0
	beq	.L1456
	mov	r0, #0
.L1455:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1455
	ldmfd	sp, {fp, sp, pc}
.L1456:
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
	ldr	r1, .L1469
	add	r4, r0, #20480
	add	r6, r0, #61440
	mov	r5, r0
	bl	ue_v
	str	r0, [r4, #256]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L1467
	cmp	r0, #262144
	bcs	.L1468
	add	r2, r5, #12288
	ldr	r1, [r2, #1276]
	ldr	r3, [r2, #1280]
	mul	r3, r3, r1
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1467
	mov	r0, r5
	ldr	r1, .L1469+4
	bl	ue_v
	ldr	r1, .L1469+8
	mov	r2, r0
	mov	r5, r0
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r0, [r6, #2620]
	cmp	r0, #0
	bne	.L1467
	cmp	r5, #9
	bhi	.L1463
	mov	r1, #1
	movw	r3, #297
	mov	r2, r1, asl r5
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L1464
	ands	r0, r2, #660
	bne	.L1465
	tst	r2, #66
	beq	.L1463
	strb	r1, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1464:
	strb	r0, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1463:
	mov	r2, r5
	ldr	r1, .L1469+12
	mov	r0, #1
	bl	dprint_vfmw
.L1467:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1465:
	mov	r0, r3
	mov	r3, #2
	strb	r3, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1468:
	ldr	r1, .L1469+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1470:
	.align	2
.L1469:
	.word	.LC43
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC44
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
	ldr	r1, .L1481
	ldr	r2, [r5, #216]
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r2, [r5, #216]
	mov	r3, #2208
	ldr	r0, [r4, #1304]
	mlas	r0, r3, r2, r0
	beq	.L1477
	ldrb	r1, [r0, #19]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1478
	ldr	r2, [r0, #28]
	mov	r3, #4000
	ldr	r0, [r4, #1300]
	mlas	r0, r3, r2, r0
	beq	.L1479
	ldrb	r3, [r0, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1480
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1478:
	ldr	r1, .L1481+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1480:
	ldr	r1, .L1481+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1477:
	movw	r3, #7798
	ldr	r2, .L1481+12
	ldr	r1, .L1481+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1479:
	movw	r3, #7809
	ldr	r2, .L1481+12
	ldr	r1, .L1481+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1482:
	.align	2
.L1481:
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC8
	.word	.LC9
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
	mov	r4, r0
	mov	r2, r1
	mov	r5, r1
	mov	r0, #19
	ldr	r1, .L1493
	bl	dprint_vfmw
	cmp	r4, #0
	beq	.L1489
	add	r0, r4, #12288
	mov	r3, #2208
	ldr	r2, [r0, #1304]
	mla	r3, r3, r5, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1490
	ldr	r1, [r0, #1288]
	ldr	r2, [r3, #28]
	sub	r3, r1, #1
	cmp	r2, r3
	bhi	.L1491
	ldr	r1, [r0, #1300]
	mov	r3, #4000
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1492
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1490:
	mov	r2, r5
	ldr	r1, .L1493+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1491:
	ldr	r1, .L1493+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1492:
	ldr	r1, .L1493+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1489:
	mov	r0, r4
	movw	r3, #7837
	ldr	r2, .L1493+16
	ldr	r1, .L1493+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1494:
	.align	2
.L1493:
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC8
	.word	.LC9
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
	subs	ip, r0, #0
	beq	.L1508
	add	r3, ip, #20480
	add	lr, ip, #12288
	ldr	r0, [r3, #1852]
	ldr	r1, [lr, #1344]
	ldr	r2, [r3, #1856]
	ldr	r4, [r3, #216]
	ldr	r5, [r3, #1864]
	cmp	r2, r4
	cmpeq	r0, r1
	ldr	r2, [r3, #224]
	ldrb	r4, [r3, #1848]	@ zero_extendqisi2
	ldrb	r0, [r3, #209]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r5, r2
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	r4, r0
	orrne	r2, r2, #1
	cmp	r4, #0
	cmpne	r0, #0
	bne	.L1509
.L1499:
	ldr	r0, [r3, #1860]
	ldr	r1, [r3, #236]
	cmp	r0, r1
	moveq	r0, #0
	beq	.L1500
	cmp	r1, #0
	cmpne	r0, #0
	moveq	r0, #1
	movne	r0, #0
.L1500:
	ldrb	r1, [r3, #1850]	@ zero_extendqisi2
	ldrb	r4, [r3, #211]	@ zero_extendqisi2
	cmp	r1, r4
	orrne	r2, r2, #1
	cmp	r4, #5
	cmpeq	r1, #5
	orr	r2, r2, r0
	beq	.L1510
.L1501:
	ldr	r1, [lr, #3508]
	cmp	r1, #0
	beq	.L1511
	cmp	r1, #1
	bne	.L1503
	add	r1, ip, #16384
	ldr	r0, [r3, #1884]
	ldr	lr, [r3, #1880]
	ldr	r4, [r1, #3472]
	ldr	ip, [r1, #3468]
	cmp	lr, ip
	cmpeq	r0, r4
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
.L1503:
	ldr	r4, [r3, #256]
	mov	r0, #19
	ldr	r1, .L1512
	cmp	r4, #0
	movne	r4, r2
	orreq	r4, r2, #1
	mov	r2, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1511:
	add	ip, ip, #16384
	ldr	r1, [r3, #1872]
	ldr	r0, [r3, #1876]
	ldr	lr, [ip, #3424]
	ldr	ip, [ip, #3420]
	cmp	r1, ip
	cmpeq	r0, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
	b	.L1503
.L1509:
	ldrb	r0, [r3, #1849]	@ zero_extendqisi2
	ldrb	r1, [r3, #210]	@ zero_extendqisi2
	cmp	r0, r1
	orrne	r2, r2, #1
	b	.L1499
.L1508:
	movw	r3, #7877
	ldr	r2, .L1512+4
	ldr	r1, .L1512+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1510:
	ldr	r0, [r3, #1868]
	ldr	r1, [r3, #244]
	cmp	r0, r1
	orrne	r2, r2, #1
	b	.L1501
.L1513:
	.align	2
.L1512:
	.word	.LC55
	.word	.LC8
	.word	.LC9
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r5, r0, #20480
	add	r3, r0, #12288
	mov	lr, #2208
	mov	ip, #4000
	ldr	r2, [r3, #1304]
	add	r8, r0, #16384
	ldr	r1, [r5, #216]
	mov	r4, r0
	ldr	r3, [r3, #1300]
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
	addhi	r6, r4, #61440
	bls	.L1568
.L1567:
	ldr	r3, [r6, #2620]
.L1533:
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1568:
	ldr	r1, .L1573
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3512]
	cmp	r0, #0
	beq	.L1566
	ldr	r3, [r5, #260]
	cmn	r3, #2
	beq	.L1547
	add	r10, r4, #19712
	add	r6, r4, #61440
	add	r10, r10, #184
	mov	r9, #0
	b	.L1530
.L1525:
	cmp	r0, #2
	beq	.L1569
.L1528:
	ldr	r3, [r5, #260]
	add	r3, r3, #2
	cmp	r3, r9
	bls	.L1570
.L1530:
	ldr	r1, .L1573+4
	mov	r0, r4
	bl	ue_v
	add	r9, r9, #1
	cmp	r0, #3
	str	r0, [r10, #4]!
	ldr	r3, [r6, #2620]
	bhi	.L1521
	cmp	r3, #0
	bne	.L1521
	cmp	r0, #3
	beq	.L1524
	cmp	r0, #1
	bhi	.L1525
	ldr	r1, .L1573+8
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r10, #264]
	ldr	r3, [r6, #2620]
	bls	.L1527
	cmp	r3, #0
	beq	.L1528
.L1527:
	mov	r2, r0
	ldr	r1, .L1573+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1569:
	ldr	r1, .L1573+16
	mov	r0, r4
	bl	ue_v
	str	r0, [r10, #528]
	b	.L1528
.L1566:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	add	r6, r4, #61440
.L1517:
	cmp	r3, #1
	bne	.L1567
	ldr	r1, .L1573+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3513]
	cmp	r0, #0
	beq	.L1567
	ldr	r3, [r5, #264]
	cmn	r3, #2
	beq	.L1567
	add	r9, r4, #19968
	mov	r8, #0
	add	r9, r9, #60
	b	.L1545
.L1544:
	add	r8, r8, #1
	cmp	r8, r3
	bcs	.L1567
.L1545:
	ldr	r1, .L1573+24
	mov	r0, r4
	bl	ue_v
	cmp	r0, #3
	str	r0, [r9, #4]!
	ldr	r3, [r6, #2620]
	bhi	.L1537
	cmp	r3, #0
	bne	.L1537
	cmp	r0, #3
	beq	.L1533
	cmp	r0, #1
	bls	.L1571
	cmp	r0, #2
	beq	.L1572
	ldr	r3, [r5, #264]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1544
.L1546:
	ldr	r1, .L1573+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1571:
	ldr	r1, .L1573+32
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r9, #264]
	ldr	r3, [r6, #2620]
	bls	.L1541
	cmp	r3, #0
	bne	.L1541
.L1542:
	ldr	r3, [r5, #264]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1544
	ldr	r2, [r9]
	cmp	r2, #3
	beq	.L1544
	b	.L1546
.L1572:
	ldr	r1, .L1573+36
	mov	r0, r4
	bl	ue_v
	str	r0, [r9, #524]
	b	.L1542
.L1524:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	b	.L1517
.L1521:
	mov	r2, r0
	ldr	r1, .L1573+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1537:
	mov	r2, r0
	ldr	r1, .L1573+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1570:
	cmp	r9, r3
	bne	.L1524
.L1519:
	add	r3, r3, #4928
	add	r3, r3, #46
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L1566
	ldr	r1, .L1573+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1541:
	mov	r2, r0
	ldr	r1, .L1573+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1547:
	mov	r3, #0
	b	.L1519
.L1574:
	.align	2
.L1573:
	.word	.LC56
	.word	.LC57
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC63
	.word	.LC64
	.word	.LC69
	.word	.LC66
	.word	.LC68
	.word	.LC58
	.word	.LC65
	.word	.LC62
	.word	.LC67
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
	ldr	r1, .L1605
	str	r2, [fp, #-48]
	ldr	r2, [r2, #28]
	mla	r7, r7, r2, r3
	bl	ue_v
	str	r0, [r6, #268]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #40]
	cmp	r9, #0
	bne	.L1599
.L1576:
	cmp	r0, #7
	bhi	.L1579
	ldr	r3, [r6, #272]
	cmp	r3, #7
	bhi	.L1579
	add	r3, r5, #61440
	str	r3, [fp, #-52]
	ldr	r2, [r3, #2620]
	cmp	r2, #0
	addeq	r10, r5, #20736
	moveq	r4, r2
	addeq	r10, r10, #148
	beq	.L1587
	b	.L1578
.L1583:
	ldr	r2, [r7, #40]
	cmp	r2, #0
	bne	.L1600
.L1584:
	str	r2, [r10]
	str	r2, [r10, #768]
	str	r2, [r10, #128]
	str	r2, [r10, #896]
.L1586:
	ldr	r2, [r6, #260]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r2, r4
	bcc	.L1601
.L1587:
	ldr	r1, .L1605+4
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1583
	ldr	r1, .L1605+8
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r2, [r7, #40]
	cmp	r2, #0
	beq	.L1584
.L1600:
	ldr	r1, .L1605+16
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1602
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1586
.L1601:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1588
.L1589:
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #2620]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1581:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1602:
	ldr	r1, .L1605+20
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+24
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1586
.L1599:
	ldr	r1, .L1605+28
	mov	r0, r5
	bl	ue_v
	mov	r3, r0
	ldr	r0, [r6, #268]
	mov	r9, r4, asl r3
	str	r3, [r6, #272]
	b	.L1576
.L1588:
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1589
	add	r10, r5, #21248
	mov	r4, #0
	add	r10, r10, #20
	b	.L1595
.L1591:
	ldr	r3, [r7, #40]
	cmp	r3, #0
	bne	.L1603
.L1592:
	str	r3, [r10]
	str	r3, [r10, #768]
	str	r3, [r10, #128]
	str	r3, [r10, #896]
.L1594:
	ldr	r3, [r6, #264]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r3, r4
	bcc	.L1589
.L1595:
	ldr	r1, .L1605+32
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1591
	ldr	r1, .L1605+36
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+40
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L1592
.L1603:
	ldr	r1, .L1605+44
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1604
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1594
.L1579:
	add	r5, r5, #61440
	ldr	r2, [r5, #2620]
.L1578:
	ldr	r1, .L1605+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1581
.L1604:
	ldr	r1, .L1605+52
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+56
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+52
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1605+56
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1594
.L1606:
	.align	2
.L1605:
	.word	.LC70
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC71
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC72
	.word	.LC83
	.word	.LC84
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
	beq	.L1619
	add	r8, r0, #24576
	mov	r10, #0
	b	.L1610
.L1641:
	ldr	r1, .L1647
	mov	r0, r9
	bl	ue_v
	cmp	r4, #2
	beq	.L1639
.L1621:
	cmp	r4, #6
	orreq	r5, r5, #1
	cmp	r5, #0
	bne	.L1624
	cmp	r4, #4
	beq	.L1640
.L1625:
	cmp	r4, #6
	bhi	.L1617
.L1622:
	add	r3, r9, #61440
	ldr	r3, [r3, #2620]
	cmp	r3, #0
	bne	.L1617
	cmp	r4, #0
	beq	.L1627
.L1626:
	subs	r6, r6, #1
	beq	.L1628
.L1619:
	ldr	r1, .L1647+4
	mov	r0, r9
	bl	ue_v
	bic	r3, r0, #2
	sub	r5, r0, #3
	clz	r5, r5
	cmp	r3, #1
	mov	r4, r0
	mov	r5, r5, lsr #5
	beq	.L1641
	cmp	r4, #2
	bne	.L1621
.L1639:
	ldr	r1, .L1647+8
	mov	r0, r9
	bl	ue_v
	cmp	r5, #0
	beq	.L1622
.L1624:
	ldr	r1, .L1647+12
	mov	r0, r9
	bl	ue_v
	cmp	r4, #4
	bne	.L1625
.L1640:
	ldr	r1, .L1647+16
	mov	r0, r9
	bl	ue_v
	add	r3, r9, #61440
	ldr	r3, [r3, #2620]
	cmp	r3, #0
	beq	.L1626
.L1617:
	ldr	r1, .L1647+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1646:
	ldr	r1, .L1647
	mov	r0, r9
	bl	ue_v
	ldr	r2, [r4, #8]
	cmp	r2, #2
	str	r0, [r4, #12]
	beq	.L1642
.L1613:
	cmp	r2, #3
	cmpne	r2, #6
	beq	.L1643
.L1614:
	cmp	r2, #4
	beq	.L1644
.L1615:
	cmp	r2, #6
	bhi	.L1617
	add	r3, r9, #61440
	ldr	r3, [r3, #2620]
	cmp	r3, #0
	bne	.L1617
	cmp	r2, #0
	add	r10, r10, #1
	beq	.L1627
	cmp	r10, #100
	beq	.L1645
.L1610:
	ldr	r1, .L1647+4
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
	beq	.L1646
	cmp	r2, #2
	bne	.L1613
.L1642:
	ldr	r1, .L1647+8
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
	bne	.L1614
.L1643:
	ldr	r1, .L1647+12
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
	bne	.L1615
.L1644:
	ldr	r1, .L1647+16
	mov	r0, r9
	bl	ue_v
	add	r6, r6, r7
	movw	r7, #2004
	mla	r5, r7, r5, r6
	add	r5, r9, r5
	add	r3, r5, #22272
	add	r5, r3, #96
	ldr	r2, [r3, #104]
	str	r0, [r3, #120]
	b	.L1615
.L1627:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1645:
	ldr	r1, .L1647+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1628:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1648:
	.align	2
.L1647:
	.word	.LC87
	.word	.LC86
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC85
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r6, r0, #24576
	cmp	r0, #0
	mov	r5, r0
	ldr	r7, [r6, #1804]
	beq	.L1669
	add	r3, r0, #20480
	ldrb	r8, [r3, #213]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L1670
	movw	r4, #2004
	mla	r4, r4, r7, r0
	add	r4, r4, #22272
	add	r4, r4, #96
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1671
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	mov	r4, r7
	cmp	r3, #5
	beq	.L1672
.L1653:
	ldr	r1, .L1676
	mov	r0, r5
	bl	u_1
	movw	r1, #2004
	mla	r4, r1, r4, r5
	ldr	r1, .L1676+4
	add	r4, r4, #22272
	add	r4, r4, #96
	mov	r3, r0
	uxtb	r2, r0
	strb	r3, [r4, #7]
	mov	r0, #16
	bl	dprint_vfmw
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1654
.L1658:
	mov	r8, #0
.L1666:
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1670:
	clz	r4, r7
	mov	r4, r4, lsr #5
	str	r4, [r6, #1804]
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L1653
.L1672:
	ldr	r1, .L1676+8
	mov	r0, r5
	bl	u_1
	movw	r3, #2004
	mla	r4, r3, r4, r5
	ldr	r1, .L1676+12
	mov	r8, #0
	add	r4, r4, #22272
	strb	r0, [r4, #101]
	mov	r0, r5
	bl	u_1
	ldrb	r2, [r4, #101]	@ zero_extendqisi2
	ldr	r1, .L1676+16
	strb	r0, [r4, #102]
	mov	r0, #16
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1671:
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1673
	ldr	r1, .L1676
	ldrb	r6, [r4, #7]	@ zero_extendqisi2
	bl	u_1
	cmp	r6, r0
	bne	.L1674
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1658
	mov	r1, r8
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	DecMMCO
.L1654:
	mov	r0, r5
	mov	r1, #1
	bl	DecMMCO
	cmn	r0, #1
	mov	r8, r0
	movne	r3, #1
	movne	r8, #0
	strneb	r3, [r4, #4]
	bne	.L1666
	mov	r3, #0
	ldr	r1, .L1676+20
	strb	r3, [r4, #4]
	mov	r0, #1
	str	r7, [r6, #1804]
	bl	dprint_vfmw
	b	.L1666
.L1673:
	ldr	r1, .L1676+8
	ldrb	r6, [r4, #5]	@ zero_extendqisi2
	bl	u_1
	cmp	r6, r0
	bne	.L1675
	mov	r0, r5
	ldr	r1, .L1676+12
	ldrb	r4, [r4, #6]	@ zero_extendqisi2
	bl	u_1
	cmp	r4, r0
	beq	.L1658
	ldr	r1, .L1676+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1666
.L1674:
	add	r5, r5, #61440
	ldr	r1, .L1676+28
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	ldr	ip, [r5, #2624]
	ldr	r3, [r5, #2660]
	mov	r0, #1
	ldr	r2, [r5, #2644]
	ldr	r1, .L1676+32
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1666
.L1675:
	ldr	r1, .L1676+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1666
.L1669:
	movw	r3, #8305
	ldr	r2, .L1676+40
	ldr	r1, .L1676+44
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L1666
.L1677:
	.align	2
.L1676:
	.word	.LC95
	.word	.LC96
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC97
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC98
	.word	.LC8
	.word	.LC9
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
	subs	r6, r0, #0
	beq	.L1744
	ldr	r1, .L1754
	add	r5, r6, #12288
	bl	ue_v
	ldr	r3, [r5, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r10, r0
	bhi	.L1681
	add	r8, r6, #61440
	ldr	r3, [r8, #2620]
	cmp	r3, #0
	bne	.L1681
	mov	r1, r0
	mov	r0, r6
	bl	PPSSPSCheckTmpId
	subs	r9, r0, #0
	bne	.L1745
	add	r4, r6, #20480
	mov	r7, #2208
	mov	r1, #4000
	str	r10, [r4, #216]
	ldr	r2, [r5, #1304]
	ldr	r3, [r5, #1300]
	mla	r7, r7, r10, r2
	ldrb	r2, [r4, #211]	@ zero_extendqisi2
	cmp	r2, #5
	ldr	r2, [r7, #28]
	mla	r5, r1, r2, r3
	beq	.L1684
	ldr	r3, [r5, #3244]
	cmp	r3, #0
	beq	.L1684
.L1685:
	ldr	r1, [r5, #2196]
	mov	r0, r6
	ldr	r2, .L1754+4
	add	r1, r1, #4
	bl	u_v
	str	r0, [r4, #224]
	ldr	r3, [r8, #2620]
	cmp	r3, #0
	bne	.L1742
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1746
.L1688:
	mov	r3, #0
	strb	r3, [r4, #209]
	strb	r3, [r4, #210]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1747
	ldr	r2, [r5, #3248]
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1712:
	ldrb	r2, [r5, #19]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1695
	strb	r2, [r4, #212]
.L1697:
	ldr	r2, [r4, #256]
	cmp	r2, r3
	bcs	.L1748
.L1698:
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1749
.L1700:
	add	r10, r6, #16384
	mov	r3, #0
	str	r3, [r10, #3420]
	str	r3, [r10, #3424]
	ldr	r3, [r5, #2200]
	cmp	r3, #0
	beq	.L1750
.L1704:
	mov	r3, #0
	str	r3, [r10, #3468]
	str	r3, [r10, #3472]
	ldr	r3, [r5, #2200]
	cmp	r3, #1
	beq	.L1751
.L1707:
	ldr	r3, [r8, #2620]
	cmp	r3, #0
	bne	.L1742
	ldrb	r3, [r7, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1710
	ldr	r1, .L1754+8
	mov	r0, r6
	bl	ue_v
	cmp	r0, #0
	bne	.L1711
	ldr	r3, [r8, #2620]
	cmp	r3, #0
	bne	.L1711
.L1710:
	mov	r0, r6
	bl	IsNewPic
	uxtb	r0, r0
	strb	r0, [r4, #213]
	cmp	r0, #0
	bne	.L1724
	ldr	r2, [r4, #256]
	ldr	r3, [r4, #1888]
	cmp	r2, r3
	bls	.L1752
.L1724:
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1684:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1685
	ldr	r1, .L1754+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r9, #0
	b	.L1724
.L1695:
	mov	r2, #1
	strb	r2, [r4, #212]
.L1715:
	ldr	r2, [r4, #256]
	cmp	r2, r3, lsr #1
	bcc	.L1698
	ldr	r1, .L1754+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r9, #0
	b	.L1724
.L1711:
	ldr	r1, .L1754+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L1754+24
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1742
	mov	r3, #0
	ldr	r0, [r8, #2680]
	mov	r2, r3
	mov	r1, #102
	blx	r4
.L1742:
	mvn	r9, #0
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1747:
	ldr	r1, .L1754+28
	mov	r0, r6
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #209]
	cmp	r0, #0
	bne	.L1753
	ldr	r2, [r5, #3248]
	ldrb	ip, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1714
	mov	r3, r3, asl #1
	b	.L1712
.L1750:
	ldr	r1, [r5, #2204]
	mov	r0, r6
	ldr	r2, .L1754+32
	add	r1, r1, #4
	bl	u_v
	str	r0, [r10, #3420]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1704
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1704
	ldr	r1, .L1754+36
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3424]
	b	.L1704
.L1746:
	cmp	r0, #0
	str	r0, [r4, #220]
	beq	.L1688
	ldr	r1, .L1754+40
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1688
.L1751:
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1707
	ldr	r1, .L1754+44
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3468]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1707
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1707
	ldr	r1, .L1754+48
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3472]
	b	.L1707
.L1753:
	ldr	r1, .L1754+52
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
	beq	.L1693
.L1714:
	mov	r2, #1
.L1693:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1712
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r4, #212]
	bne	.L1697
	b	.L1715
.L1749:
	ldr	r1, .L1754+56
	mov	r0, r6
	bl	ue_v
	cmp	r0, #65536
	str	r0, [r4, #244]
	bcs	.L1701
	ldr	r3, [r8, #2620]
	cmp	r3, #0
	beq	.L1700
.L1701:
	ldr	r1, .L1754+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1700
.L1681:
	mov	r2, r10
	ldr	r1, .L1754+64
	mvn	r9, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1745:
	ldr	r1, .L1754+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r9, #0
	b	.L1724
.L1744:
	movw	r3, #8407
	ldr	r2, .L1754+72
	ldr	r1, .L1754+76
	mvn	r9, #0
	bl	dprint_vfmw
	b	.L1724
.L1748:
	ldr	r1, .L1754+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r9, #0
	b	.L1724
.L1752:
	ldr	r1, .L1754+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r9, #0
	b	.L1724
.L1755:
	.align	2
.L1754:
	.word	.LC102
	.word	.LC106
	.word	.LC118
	.word	.LC105
	.word	.LC110
	.word	.LC119
	.word	g_event_report
	.word	.LC108
	.word	.LC114
	.word	.LC115
	.word	.LC107
	.word	.LC116
	.word	.LC117
	.word	.LC109
	.word	.LC112
	.word	.LC113
	.word	.LC103
	.word	.LC104
	.word	.LC8
	.word	.LC9
	.word	.LC111
	.word	.LC120
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
	subs	r5, r0, #0
	beq	.L1841
	add	r7, r5, #12288
	add	r4, r5, #20480
	ldr	r3, [r7, #1292]
	ldr	r2, [r4, #216]
	sub	r3, r3, #1
	cmp	r3, r2
	bcc	.L1759
	add	r9, r5, #61440
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	bne	.L1759
	bl	PPSSPSCheck
	cmp	r0, #0
	bne	.L1842
	ldr	r3, [r4, #216]
	mov	r6, #2208
	ldr	r8, [r7, #1304]
	mul	r6, r6, r3
	adds	r7, r8, r6
	beq	.L1843
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1844
.L1763:
	ldr	r2, [r7, #36]
	cmp	r3, #1
	str	r2, [r4, #260]
	ldr	r2, [r7, #40]
	str	r2, [r4, #264]
	bls	.L1845
	cmp	r3, #2
	beq	.L1790
.L1774:
	mov	r3, #32
	str	r3, [r4, #264]
.L1775:
	mov	r0, r5
	bl	ref_pic_list_reordering
	subs	r10, r0, #0
	bne	.L1846
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1777
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, #1
	moveq	r3, r2
	beq	.L1778
.L1777:
	ldr	r3, [r7, #44]
	cmp	r3, #1
	beq	.L1847
.L1794:
	mov	r2, #0
	mov	r3, r2
.L1778:
	strb	r3, [r4, #215]
	mov	r0, #19
	ldr	r1, .L1853
	bl	dprint_vfmw
	ldrb	r2, [r4, #215]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #268]
	cmp	r2, r3
	str	r3, [r4, #272]
	bne	.L1848
.L1779:
	ldr	r3, [r4, #236]
	cmp	r3, #0
	bne	.L1849
.L1780:
	mov	r3, #0
	str	r3, [r4, #1812]
	ldrb	r3, [r8, r6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1781
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1850
.L1781:
	ldr	r1, .L1853+4
	mov	r0, r5
	bl	se_v
	mov	r3, #0
	str	r3, [r4, #1820]
	str	r3, [r4, #1824]
	str	r3, [r4, #1828]
	str	r0, [r4, #1816]
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1851
.L1810:
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1790:
	mov	r3, #32
	str	r3, [r4, #260]
	b	.L1774
.L1851:
	ldr	r1, .L1853+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1820]
	bhi	.L1784
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	bne	.L1784
	cmp	r0, #1
	beq	.L1810
	ldr	r1, .L1853+12
	mov	r0, r5
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1824]
	cmp	r3, #12
	bhi	.L1787
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	bne	.L1787
	mov	r0, r5
	ldr	r1, .L1853+16
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1828]
	cmp	r3, #12
	bhi	.L1789
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	beq	.L1810
.L1789:
	ldr	r1, .L1853+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1848:
	mov	r0, r5
	bl	pred_weight_table
	cmp	r0, #0
	beq	.L1779
	ldr	r1, .L1853+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1849:
	mov	r0, r5
	bl	dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1780
	ldr	r1, .L1853+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1847:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r2, r3
	bne	.L1794
	b	.L1778
.L1844:
	ldr	r1, .L1853+32
	mov	r0, r5
	bl	u_1
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	strb	r0, [r4, #214]
	b	.L1763
.L1845:
	ldr	r1, .L1853+36
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1765
	ldr	r3, [r4, #260]
.L1766:
	ldrb	r2, [r4, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1767
	cmp	r3, #15
	bhi	.L1768
	ldr	r3, [r4, #264]
	cmp	r3, #15
	bhi	.L1852
.L1769:
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	bne	.L1768
.L1770:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1790
	cmp	r3, #1
	bne	.L1774
	b	.L1775
.L1759:
	ldr	r1, .L1853+40
	mvn	r10, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1850:
	ldr	r1, .L1853+44
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1812]
	bhi	.L1782
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	beq	.L1781
.L1782:
	ldr	r1, .L1853+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1767:
	cmp	r3, #31
	bhi	.L1771
	ldr	r3, [r4, #264]
	cmp	r3, #31
	bls	.L1772
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1772
.L1771:
	ldr	r1, .L1853+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1772:
	ldr	r3, [r9, #2620]
	cmp	r3, #0
	beq	.L1770
	b	.L1771
.L1852:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1769
.L1768:
	ldr	r1, .L1853+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1765:
	ldr	r1, .L1853+60
	mov	r0, r5
	bl	ue_v
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #260]
	bne	.L1766
	ldr	r1, .L1853+64
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #260]
	str	r0, [r4, #264]
	b	.L1766
.L1787:
	ldr	r1, .L1853+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1784:
	ldr	r1, .L1853+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1842:
	ldr	r1, .L1853+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1846:
	ldr	r1, .L1853+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1810
.L1841:
	movw	r3, #8571
	ldr	r2, .L1853+84
	ldr	r1, .L1853+88
	mvn	r10, #0
	bl	dprint_vfmw
	b	.L1810
.L1843:
	movw	r3, #8588
	ldr	r2, .L1853+84
	ldr	r1, .L1853+88
	mvn	r10, #0
	bl	dprint_vfmw
	b	.L1810
.L1854:
	.align	2
.L1853:
	.word	.LC128
	.word	.LC133
	.word	.LC134
	.word	.LC136
	.word	.LC138
	.word	.LC139
	.word	.LC129
	.word	.LC130
	.word	.LC121
	.word	.LC122
	.word	.LC103
	.word	.LC131
	.word	.LC132
	.word	.LC126
	.word	.LC125
	.word	.LC123
	.word	.LC124
	.word	.LC137
	.word	.LC135
	.word	.LC104
	.word	.LC127
	.word	.LC8
	.word	.LC9
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
	subs	r2, r0, #0
	beq	.L1864
	add	r3, r2, #20480
	add	r0, r2, #12288
	mov	ip, #2208
	mov	r7, #4000
	ldr	r1, [r0, #1304]
	ldr	r6, [r3, #216]
	ldr	r4, [r0, #1300]
	ldrb	r5, [r3, #209]	@ zero_extendqisi2
	mla	r0, ip, r6, r1
	cmp	r5, #0
	ldr	ip, [r3, #224]
	ldr	lr, [r3, #256]
	ldr	r1, [r0, #28]
	str	r6, [r3, #1856]
	mla	r1, r7, r1, r4
	ldr	r0, [r1, #36]
	str	ip, [r3, #1864]
	ldr	ip, [r3, #236]
	str	r0, [r3, #1852]
	ldrneb	r0, [r3, #210]	@ zero_extendqisi2
	str	lr, [r3, #1888]
	strb	r5, [r3, #1848]
	strneb	r0, [r3, #1849]
	ldrb	r0, [r3, #211]	@ zero_extendqisi2
	str	ip, [r3, #1860]
	cmp	r0, #5
	strb	r0, [r3, #1850]
	ldreq	r0, [r3, #244]
	streq	r0, [r3, #1868]
	ldr	r0, [r1, #2200]
	cmp	r0, #0
	bne	.L1859
	add	r0, r2, #16384
	ldr	ip, [r0, #3420]
	str	ip, [r3, #1872]
	ldr	r0, [r0, #3424]
	str	r0, [r3, #1876]
	ldr	r0, [r1, #2200]
.L1859:
	cmp	r0, #1
	addeq	r1, r2, #16384
	add	r2, r2, #61440
	ldreq	r0, [r1, #3468]
	streq	r0, [r3, #1880]
	ldreq	r1, [r1, #3472]
	streq	r1, [r3, #1884]
	ldr	r3, [r2, #2636]
	add	r3, r3, #1
	str	r3, [r2, #2636]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1864:
	movw	r3, #8759
	ldr	r2, .L1865
	ldr	r1, .L1865+4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1866:
	.align	2
.L1865:
	.word	.LC8
	.word	.LC9
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
	subs	r3, r0, #0
	beq	.L1880
	add	r1, r3, #20480
	ldrb	r2, [r1, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1870
	bcc	.L1871
	cmp	r2, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r2, [r1, #211]	@ zero_extendqisi2
	add	r3, r3, #57344
	cmp	r2, #5
	bne	.L1873
	mov	r2, #1
	str	r2, [r3, #4024]
	ldmfd	sp, {fp, sp, pc}
.L1871:
	add	r3, r3, #57344
	ldr	r2, [r3, #4020]
	cmp	r2, #2
	movne	r2, #1
	strne	r2, [r3, #4020]
.L1873:
	mov	r2, #0
	str	r2, [r3, #4024]
	ldmfd	sp, {fp, sp, pc}
.L1870:
	add	r3, r3, #57344
	mov	r1, #2
	mov	r2, #0
	str	r1, [r3, #4020]
	str	r2, [r3, #4024]
	ldmfd	sp, {fp, sp, pc}
.L1880:
	movw	r3, #8810
	ldr	r2, .L1881
	ldr	r1, .L1881+4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L1882:
	.align	2
.L1881:
	.word	.LC8
	.word	.LC9
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r4, r0, #0
	beq	.L1906
	add	r3, r4, #16384
	ldrb	r3, [r3, #1212]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1907
.L1885:
	ldr	r0, [r4, #368]
	ldrb	r6, [r0]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L1896
	mov	r5, #0
	mov	r2, r0
	mov	r3, r5
.L1887:
	add	r3, r3, #1
	ldr	r1, [r2, #12]
	cmp	r3, r6
	add	r2, r2, #28
	add	r5, r5, r1
	bne	.L1887
.L1886:
	mov	r7, r6, asl #5
	ldr	ip, [r0, #72]
	sub	r7, r7, r6, asl #2
	ldr	r2, [r0, #64]
	add	r1, r0, r7
	mov	r3, r5
	str	ip, [sp, #4]
	mov	r0, #7
	ldr	ip, [r1, #12]
	ldr	r1, .L1909
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #368]
	mov	r2, r6
	mov	r0, #7
	ldr	r1, .L1909+4
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #64]
	mov	lr, r6, asl #5
	and	ip, ip, r0
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	str	ip, [r3, #24]
	ldr	r3, [r4, #368]
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	r8, [r3, #64]
	mov	lr, r6, asl #5
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	ldr	ip, [r3, #16]
	add	ip, ip, r8, lsr #3
	rsb	ip, r5, ip
	str	ip, [r3, #28]
	ldr	ip, [r4, #368]
	ldrb	r6, [ip]	@ zero_extendqisi2
	ldr	lr, [ip, #64]
	mov	r3, r6, asl #5
	sub	r3, r3, r6, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #12]
	add	r3, r5, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [ip, #20]
	ldr	ip, [r4, #368]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	ldr	lr, [r3, #24]
	and	ip, ip, #3
	add	ip, lr, ip, lsl #3
	str	ip, [r3, #24]
	ldr	ip, [r4, #368]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	bic	ip, ip, #3
	str	ip, [r3, #28]
	ldr	ip, [r4, #368]
	add	r7, ip, r7
	ldrb	r5, [ip]	@ zero_extendqisi2
	ldr	r3, [r7, #24]
	mov	lr, r5, asl #5
	sub	lr, lr, r5, asl #2
	add	ip, ip, lr
	ldr	ip, [ip, #28]
	str	ip, [sp, #4]
	ldr	ip, [r7, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r4, #368]
	ldr	r2, [ip, #68]
	sub	r3, r2, #1
	cmp	r3, #1
	bhi	.L1908
	ldrb	r5, [ip]	@ zero_extendqisi2
	add	r1, r5, #1
	cmp	r2, r1
	movhi	r2, #1
	movls	r2, #0
	cmp	r1, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L1889
	add	r5, r5, #2
	mov	r6, #0
.L1890:
	sub	r3, r5, #1
	ldr	r1, .L1909+8
	mov	r0, #7
	mov	lr, r3, asl #5
	mov	r2, r3
	sub	r3, lr, r3, asl #2
	add	ip, ip, r3
	str	r6, [ip, #24]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #16]
	str	lr, [ip, #28]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #12]
	mov	lr, lr, asl #3
	str	lr, [ip, #20]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	ldr	r7, [ip, #24]
	and	lr, lr, #3
	add	lr, r7, lr, lsl #3
	str	lr, [ip, #24]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	bic	lr, lr, #3
	str	lr, [ip, #28]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	r3, [ip, #24]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r4, #368]
	ldr	r3, [ip, #68]
	cmp	r5, #1
	cmpls	r5, r3
	add	r5, r5, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L1890
	sub	r3, r3, #1
.L1889:
	mov	r2, r3, asl #5
	ldr	r1, [ip, #72]
	sub	r3, r2, r3, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #20]
	rsb	r3, r1, r3
	str	r3, [ip, #20]
	ldr	lr, [r4, #368]
	ldrb	r1, [lr]	@ zero_extendqisi2
	ldr	ip, [lr, #68]
	cmp	r1, ip
	bcs	.L1883
	sxth	r3, r1
	add	r4, r4, #57344
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L1894:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	ldr	r0, [r4, #4048]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #4048]
	ldrcc	ip, [lr, #68]
	cmp	r1, ip
	bcc	.L1894
.L1883:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1907:
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #64]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #72]
	sub	r3, r3, #1
	str	r3, [r2, #72]
	b	.L1885
.L1908:
	ldr	r1, .L1909+12
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L1896:
	mov	r5, r6
	b	.L1886
.L1906:
	movw	r3, #8864
	ldr	r2, .L1909+16
	ldr	r1, .L1909+20
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L1910:
	.align	2
.L1909:
	.word	.LC140
	.word	.LC141
	.word	.LC143
	.word	.LC142
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	CalcStreamBits, .-CalcStreamBits
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
	subs	r7, r0, #0
	beq	.L1940
	add	r6, r7, #20480
	ldr	r3, [r6, #248]
	cmp	r3, #0
	beq	.L1914
	add	r5, r7, #26880
	add	r8, r7, #61440
	add	r5, r5, #240
	mov	r4, #0
	b	.L1918
.L1915:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L1917
	ldr	r3, [r6, #248]
	cmp	r4, r3
	bcs	.L1941
.L1918:
	ldr	r3, [r5, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #2680]
	ldr	r3, [r3, #36]
	ldr	r1, [r3, #656]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L1915
.L1917:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1941:
	cmp	r3, #0
	beq	.L1914
	ldr	r3, [r6, #252]
	cmp	r3, #0
	addne	r7, r7, #27136
	movne	r4, #0
	addne	r7, r7, #116
	bne	.L1921
	b	.L1914
.L1942:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L1917
	ldr	r3, [r6, #252]
	cmp	r4, r3
	bcs	.L1914
.L1921:
	ldr	r3, [r7, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #2680]
	ldr	r3, [r3, #36]
	ldr	r1, [r3, #656]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L1942
	b	.L1917
.L1914:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1940:
	movw	r3, #8973
	ldr	r2, .L1943
	ldr	r1, .L1943+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1944:
	.align	2
.L1943:
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	IsRefListWrong, .-IsRefListWrong
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
	subs	r9, r3, #0
	str	r0, [fp, #-48]
	mov	r8, r1
	ble	.L1954
	mov	r3, r9
	mov	ip, #8
	mov	r7, ip
	mov	r6, #0
	mov	r9, r2
	mov	r10, r3
	b	.L1953
.L1950:
	mov	r0, r5, lsr #2
	and	r4, r5, #3
	str	r7, [r8, r5, asl #2]
	mov	r3, #255
	ldr	r1, [r9, r0, asl #2]
	mov	r4, r4, asl #3
	uxtb	lr, r7
	cmp	r6, r10
	bic	r1, r1, r3, asl r4
	orr	r3, r1, lr, asl r4
	str	r3, [r9, r0, asl #2]
	beq	.L1954
.L1953:
	cmp	r10, #16
	ldreq	r3, .L1962
	ldrne	r3, .L1962+4
	cmp	ip, #0
	ldrb	r5, [r6, r3]	@ zero_extendqisi2
	add	r6, r6, #1
	beq	.L1950
	ldr	r1, .L1962+8
	ldr	r0, [fp, #-48]
	bl	se_v
	mov	r1, r0
	mov	r0, r7
	add	r4, r7, r1
	bl	check_signed_integer_operation_overflow
	mov	r1, #256
	cmp	r0, #0
	mov	r0, r4
	bne	.L1960
	bl	check_signed_integer_operation_overflow
	add	r4, r4, #256
	mov	r1, r4, asr #31
	mov	r1, r1, lsr #24
	add	r4, r4, r1
	uxtb	r4, r4
	rsb	ip, r1, r4
	cmp	r0, #0
	bne	.L1961
	rsb	r4, r1, r4
	ldr	r3, [fp, #4]
	clz	r4, r4
	mov	r4, r4, lsr #5
	cmp	r4, #0
	moveq	r7, ip
	cmp	r5, #0
	movne	r4, #0
	andeq	r4, r4, #1
	str	r4, [r3]
	b	.L1950
.L1954:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1960:
	movw	r3, #9214
.L1959:
	ldr	r2, .L1962+12
	mov	r0, #1
	ldr	r1, .L1962+16
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1961:
	movw	r3, #9220
	b	.L1959
.L1963:
	.align	2
.L1962:
	.word	.LANCHOR0+24
	.word	.LANCHOR0+40
	.word	.LC144
	.word	.LANCHOR0+104
	.word	.LC145
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L2018
	cmp	r1, #0
	beq	.L2019
	ldr	r1, .L2028
	add	r6, r5, #61440
	bl	u_1
	strb	r0, [r4]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2017
	ldr	r1, .L2028+4
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #1]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2017
	ldr	r1, .L2028+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	bne	.L1970
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	beq	.L1971
.L1970:
	ldr	r1, .L2028+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2028+16
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2017
	mov	r3, #0
	ldr	r0, [r6, #2680]
	mov	r2, r3
	mov	r1, #102
	blx	r4
	mvn	r0, #0
.L1966:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2025:
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
.L1998:
	ldr	r3, [r4, #60]
	cmp	r3, #1
	movne	r3, #0
	strne	r3, [r8]
	strneb	r3, [r10]
	beq	.L2020
.L1992:
	ldr	r2, [r4, #28]
	mov	r1, #4000
	ldr	r3, [r5, #1300]
	mla	r3, r1, r2, r3
	ldrb	r2, [r3, #25]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2021
.L1996:
	ldr	r1, .L2028+20
	mov	r2, #64
	ldr	r3, .L2028+24
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r9
	blx	r3
.L1994:
	add	r7, r7, #1
	add	r9, r9, #64
	cmp	r7, #2
	add	r8, r8, #4
	add	r6, r6, #256
	add	r10, r10, #1
	bne	.L1998
	ldr	r5, [fp, #-80]
	ldr	r6, [fp, #-84]
.L1999:
	mov	r0, r5
	ldr	r1, .L2028+28
	bl	se_v
	add	r3, r0, #12
	str	r0, [r4, #56]
	cmp	r3, #24
	bhi	.L1980
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	beq	.L2000
.L1980:
	ldr	r1, .L2028+32
	mov	r0, #1
	bl	dprint_vfmw
.L2017:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1971:
	ldr	r1, .L2028+36
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #36]
	bhi	.L1972
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L1972
	ldr	r1, .L2028+40
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #40]
	bhi	.L1974
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L1974
	ldr	r1, .L2028+44
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #2]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2017
	ldr	r2, .L2028+48
	mov	r1, #2
	mov	r0, r5
	bl	u_v
	cmp	r0, #2
	str	r0, [r4, #44]
	bhi	.L2022
	ldr	r1, .L2028+52
	mov	r0, r5
	bl	se_v
	ldr	r1, .L2028+56
	str	r0, [r4, #48]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L2028+60
	mov	r0, r5
	bl	se_v
	ldr	r1, .L2028+64
	str	r0, [r4, #52]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L2028+68
	strb	r0, [r4, #3]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L2028+72
	strb	r0, [r4, #4]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #17]
	cmp	r0, #0
	bne	.L2023
.L1977:
	ldr	r3, [r4, #52]
	add	r0, r5, #13504
	mov	r7, #0
	add	r0, r0, #24
	str	r7, [r4, #60]
	str	r3, [r4, #56]
	strb	r7, [r4, #18]
	bl	BsResidBits
	ldr	r3, [r5, #368]
	ldr	r3, [r3, #72]
	add	r3, r3, #3
	cmp	r0, r3
	bcs	.L1978
.L2000:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1978:
	ldr	r1, .L2028+76
	mov	r0, r5
	bl	u_1
	ldr	r1, .L2028+80
	str	r0, [r4, #60]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #1
	bne	.L1999
	add	r3, r4, #4
	str	r6, [fp, #-80]
	sub	r9, fp, #72
	add	r8, r4, #1984
	add	r10, r4, #64
	mov	r6, r3
	b	.L1989
.L2027:
	ldr	r3, [ip, #1300]
	ldr	ip, [r4, #28]
	mla	r3, lr, ip, r3
	ldrb	ip, [r3, #25]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L2024
	ldr	r3, .L2028+84
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2028+24
	ldr	r3, [r3, #52]
	blx	r3
.L1984:
	add	r7, r7, #1
	add	r8, r8, #16
	cmp	r7, #6
	add	r10, r10, #64
	beq	.L2025
.L1989:
	ldr	r1, .L2028+88
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
	beq	.L2026
	cmp	r7, #0
	cmpne	r7, #3
	beq	.L2027
	ldr	r3, .L2028+24
	mov	r2, #16
	sub	r1, r8, #16
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1984
.L2023:
	ldr	r1, .L2028+92
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1977
.L1972:
	ldr	r1, .L2028+96
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1966
.L2026:
	mov	r3, r2
	str	r9, [sp]
	mov	r2, r8
	mov	r1, r10
	mov	r0, r5
	bl	Scaling_List
	cmp	r0, #0
	bne	.L1993
	ldr	r3, [r9]
	cmp	r3, #1
	bne	.L1984
	ldr	r1, .L2028+84
	mov	r2, #16
	ldr	r3, .L2028+24
	cmp	r7, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1984
.L1974:
	ldr	r1, .L2028+100
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1966
.L2024:
	add	r1, r3, r7, lsl #4
	ldr	r3, .L2028+24
	add	r1, r1, #1968
	mov	r2, #16
	add	r1, r1, #4
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1984
.L2019:
	mov	r0, r1
	movw	r3, #9259
	ldr	r2, .L2028+104
	ldr	r1, .L2028+108
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1966
.L2020:
	ldr	r1, .L2028+112
	ldr	r0, [fp, #-80]
	bl	u_1
	cmp	r0, #1
	str	r0, [r8]
	strb	r0, [r10]
	bne	.L1992
	str	r8, [sp]
	mov	r3, #64
	mov	r2, r9
	mov	r1, r6
	ldr	r0, [fp, #-80]
	bl	Scaling_List
	cmp	r0, #0
	bne	.L1993
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L1994
	b	.L1996
.L2021:
	add	r1, r3, r7, lsl #6
	ldr	r3, .L2028+24
	add	r1, r1, #2064
	mov	r2, #64
	add	r1, r1, #4
	mov	r0, r9
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1994
.L2022:
	ldr	r1, .L2028+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1966
.L2018:
	movw	r3, #9258
	ldr	r2, .L2028+104
	ldr	r1, .L2028+108
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1966
.L1993:
	ldr	r1, .L2028+120
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1966
.L2029:
	.align	2
.L2028:
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC149
	.word	g_event_report
	.word	.LANCHOR1+112
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC166
	.word	.LC170
	.word	.LC150
	.word	.LC152
	.word	.LC154
	.word	.LC155
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC164
	.word	.LC165
	.word	.LANCHOR1+80
	.word	.LC167
	.word	.LC163
	.word	.LC151
	.word	.LC153
	.word	.LC8
	.word	.LC9
	.word	.LC169
	.word	.LC156
	.word	.LC168
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r7, r0, #0
	beq	.L2053
	cmp	r1, #0
	beq	.L2054
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
	beq	.L2034
	mov	ip, ip, asl #1
	adds	r2, ip, #6
	str	r2, [fp, #-52]
	beq	.L2034
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
.L2038:
	ldr	r0, [fp, #-48]
	ldrb	r1, [r5, #1]!	@ zero_extendqisi2
	ldrsb	ip, [r0, #1]!
	str	r0, [fp, #-48]
	sxtb	r0, r1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, #0
	beq	.L2052
	cmp	r6, #5
	bhi	.L2039
	add	r7, r4, #64
	add	r4, r4, #128
	mov	r0, r10
	mov	r1, r7
.L2037:
	ldr	lr, [r1], #4
	ldr	ip, [r0], #4
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, r4
	bne	.L2037
.L2035:
	ldr	r1, [fp, #-52]
	add	r6, r6, #1
	add	r9, r9, #256
	add	r8, r8, #256
	cmp	r6, r1
	add	r2, r2, #256
	mov	r4, r7
	add	r10, r10, #64
	bne	.L2038
	ldr	r7, [fp, #-56]
	ldr	r1, [fp, #-60]
.L2034:
	ldr	r0, [r7, #56]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L2032:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2039:
	mov	r0, r8
	mov	r1, r9
.L2036:
	ldr	lr, [r1, #4]!
	ldr	ip, [r0, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r1
	bne	.L2036
.L2052:
	add	r7, r4, #64
	b	.L2035
.L2054:
	mov	r0, r1
	movw	r3, #9455
	ldr	r2, .L2055
	ldr	r1, .L2055+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2032
.L2053:
	movw	r3, #9454
	ldr	r2, .L2055
	ldr	r1, .L2055+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2032
.L2056:
	.align	2
.L2055:
	.word	.LC8
	.word	.LC9
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
	subs	r5, r0, #0
	beq	.L2071
	ldr	r1, .L2077
	add	r4, r5, #12288
	bl	ue_v
	ldr	r3, [r4, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r6, r0
	bhi	.L2072
	ldr	r1, .L2077+4
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r2, r0
	bhi	.L2073
	ldr	r1, [r4, #1300]
	mov	r3, #4000
	mla	r3, r3, r0, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2074
	mov	r8, #2208
	ldr	r3, [r4, #1304]
	mul	r7, r8, r6
	add	r3, r3, r7
	ldrb	r9, [r3, #19]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L2063
	ldr	r9, .L2077+8
	mov	r0, r5
	mov	r1, r9
	str	r6, [r9, #24]
	str	r2, [r9, #28]
	bl	ProcessPPS
	subs	r5, r0, #0
	bne	.L2075
	ldr	r1, [r4, #1304]
	mov	r0, r9
	add	r1, r1, r7
	bl	PPSEqual
	cmp	r0, #0
	beq	.L2059
	ldr	ip, .L2077+12
	mov	r3, #1
	ldr	r0, [r4, #1304]
	mov	r2, r8
	strb	r3, [r9, #20]
	mov	r1, r9
	add	r0, r0, r7
	ldr	r4, [ip, #56]
	strb	r3, [r9, #19]
	blx	r4
	mov	r0, r5
	b	.L2059
.L2072:
	ldr	r1, .L2077+16
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #1292]
	sub	r2, r3, #1
	cmp	r6, r2
	bls	.L2067
	ldr	r2, .L2077+20
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L2067
	add	r5, r5, #61440
	str	r3, [fp, #-40]
	str	r6, [fp, #-44]
	mov	r3, #8
	ldr	r0, [r5, #2680]
	sub	r2, fp, #44
	mov	r1, #110
	blx	r4
	mvn	r0, #0
.L2059:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2063:
	str	r6, [r3, #24]
	mov	r0, r5
	ldr	r3, [r4, #1304]
	add	r3, r3, r7
	str	r2, [r3, #28]
	ldr	r1, [r4, #1304]
	add	r1, r1, r7
	bl	ProcessPPS
	cmp	r0, #0
	bne	.L2076
	ldr	r3, [r4, #1304]
	mov	r2, #1
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r2, [r7, #19]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2067:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2075:
	ldr	r2, .L2077+24
	mov	r0, #1
	ldr	r1, .L2077+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2059
.L2073:
	ldr	r1, .L2077+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2059
.L2074:
	ldr	r1, .L2077+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2059
.L2071:
	movw	r3, #9522
	ldr	r2, .L2077+40
	ldr	r1, .L2077+44
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2059
.L2076:
	ldr	r2, .L2077+24
	mov	r0, #1
	ldr	r1, .L2077+48
	bl	dprint_vfmw
	ldr	r3, [r4, #1304]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r9, [r7, #19]
	b	.L2059
.L2078:
	.align	2
.L2077:
	.word	.LC171
	.word	.LC173
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC172
	.word	g_event_report
	.word	.LANCHOR0+120
	.word	.LC176
	.word	.LC174
	.word	.LC175
	.word	.LC8
	.word	.LC9
	.word	.LC177
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
	subs	r4, r0, #0
	mov	r5, r1
	beq	.L2123
	ldr	r1, .L2130
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L2124
.L2083:
	ldr	r1, .L2130+4
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L2125
.L2084:
	ldr	r1, .L2130+8
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L2126
.L2086:
	ldr	r1, .L2130+12
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L2127
.L2087:
	ldr	r1, .L2130+16
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L2128
.L2089:
	ldr	r1, .L2130+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L2091
	ldr	r1, .L2130+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L2130+28
	mov	r1, #4
	str	r0, [r5, #120]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+32
	mov	r1, #4
	strb	r0, [r5, #116]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #120]
	cmp	r3, #31
	strb	r0, [r5, #117]
	bhi	.L2093
	add	r9, r4, #61440
	ldr	r6, [r9, #2620]
	cmp	r6, #0
	bne	.L2093
	add	r7, r5, #120
	add	r8, r5, #83
.L2094:
	ldr	r1, .L2130+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #120]
	cmp	r3, r6
	bcs	.L2094
	ldr	r2, .L2130+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+52
	mov	r1, #5
	str	r0, [r5, #380]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+56
	mov	r1, #5
	str	r0, [r5, #384]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+60
	mov	r1, #5
	str	r0, [r5, #388]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #392]
.L2091:
	ldr	r1, .L2130+64
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L2129
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	add	r9, r4, #61440
	cmp	r3, #0
	bne	.L2099
.L2098:
	ldr	r1, .L2130+68
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2130+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L2100
	ldr	r0, [r9, #2620]
.L2101:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2129:
	ldr	r1, .L2130+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L2130+28
	mov	r1, #4
	str	r0, [r5, #432]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+32
	mov	r1, #4
	strb	r0, [r5, #428]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #432]
	cmp	r3, #31
	strb	r0, [r5, #429]
	bhi	.L2093
	add	r9, r4, #61440
	ldr	r6, [r9, #2620]
	cmp	r6, #0
	bne	.L2093
	add	r8, r5, #392
	add	r7, r5, #432
	add	r8, r8, #3
.L2096:
	ldr	r1, .L2130+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #432]
	cmp	r3, r6
	bcs	.L2096
	ldr	r2, .L2130+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+52
	mov	r1, #5
	str	r0, [r5, #692]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+56
	mov	r1, #5
	str	r0, [r5, #696]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+60
	mov	r1, #5
	str	r0, [r5, #700]
	mov	r0, r4
	bl	u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #704]
	bne	.L2099
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2098
.L2099:
	ldr	r1, .L2130+76
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #14]
	b	.L2098
.L2128:
	ldr	r2, .L2130+80
	mov	r1, #32
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2130+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	u_1
	ldr	r2, [r5, #52]
	cmp	r2, #0
	strb	r0, [r5, #9]
	beq	.L2089
	ldr	r0, [r5, #56]
	movw	r1, #10000
	ldr	r3, .L2130+92
	add	r9, r4, #61440
	umull	r0, r1, r0, r1
	ldr	r3, [r3, #244]
	movs	r1, r1, lsr #1
	mov	r0, r0, rrx
	blx	r3
	movw	r3, #52429
	movt	r3, 52428
	add	r0, r0, #5
	umull	r0, r1, r0, r3
	mov	r3, r1, lsr #3
	str	r3, [r9, #1388]
	b	.L2089
.L2127:
	ldr	r1, .L2130+96
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+100
	str	r0, [r5, #44]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #48]
	b	.L2087
.L2126:
	ldr	r2, .L2130+104
	mov	r1, #3
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2130+108
	str	r0, [r5, #28]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2130+112
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L2086
	ldr	r2, .L2130+116
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+120
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+124
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #40]
	b	.L2086
.L2125:
	ldr	r1, .L2130+128
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #2]
	b	.L2084
.L2124:
	ldr	r2, .L2130+132
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L2083
	ldr	r2, .L2130+136
	mov	r1, #16
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2130+140
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #20]
	b	.L2083
.L2100:
	ldr	r1, .L2130+144
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2130+148
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+152
	str	r0, [r5, #60]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+156
	str	r0, [r5, #64]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+160
	str	r0, [r5, #72]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+164
	str	r0, [r5, #68]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L2130+168
	str	r0, [r5, #76]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #80]
	ldr	r0, [r9, #2620]
	cmp	r0, #0
	beq	.L2101
.L2123:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2093:
	ldr	r1, .L2130+172
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2123
.L2131:
	.align	2
.L2130:
	.word	.LC178
	.word	.LC182
	.word	.LC184
	.word	.LC191
	.word	.LC194
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.word	.LC212
	.word	.LC213
	.word	.LC211
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC192
	.word	.LC193
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC183
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC214
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC218
	.word	.LC219
	.word	.LC220
	.word	.LC202
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r6, r0, #0
	beq	.L2164
	cmp	r1, #0
	beq	.L2165
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
	beq	.L2136
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
.L2140:
	ldr	r1, [fp, #-48]
	ldrsb	r0, [r6, #1]!
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-48]
	sxtb	r1, r2
	cmp	r0, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L2137
	cmp	r7, #5
	bhi	.L2147
	add	r2, r8, #48
	add	lr, r8, #112
	mov	r1, r9
.L2139:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, lr
	bne	.L2139
.L2137:
	add	r7, r7, #1
	add	r10, r10, #256
	cmp	r7, #8
	add	r5, r5, #256
	add	r4, r4, #256
	add	r8, r8, #64
	add	r9, r9, #64
	bne	.L2140
	ldr	r6, [fp, #-52]
	ldr	r1, [fp, #-56]
.L2136:
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
	beq	.L2142
	cmp	ip, #1
	bne	.L2141
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
	beq	.L2141
	add	ip, r6, #2208
	add	r0, r1, #2208
	add	ip, ip, #8
	add	r0, r0, #8
	mov	r2, #0
.L2144:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r5
	bne	.L2144
.L2141:
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
	bne	.L2145
	ldrb	r0, [r6, #19]	@ zero_extendqisi2
	ldrb	r2, [r1, #19]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L2145:
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
	bne	.L2166
.L2146:
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
.L2134:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2166:
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
	b	.L2146
.L2147:
	mov	r1, r5
	mov	r2, r10
.L2138:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r4
	bne	.L2138
	b	.L2137
.L2142:
	ldr	r0, [r6, #2204]
	ldr	r2, [r1, #2204]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L2141
.L2165:
	mov	r0, r1
	movw	r3, #9782
	ldr	r2, .L2167
	ldr	r1, .L2167+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2134
.L2164:
	movw	r3, #9781
	ldr	r2, .L2167
	ldr	r1, .L2167+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2134
.L2168:
	.align	2
.L2167:
	.word	.LC8
	.word	.LC9
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
	subs	r4, r0, #0
	mov	r5, r3
	mov	r0, r1
	beq	.L2197
	subs	r3, r4, #255
	movne	r3, #1
	cmp	r4, #16
	movle	r1, #0
	andgt	r1, r3, #1
	cmp	r1, #0
	movne	r4, #0
	movne	r2, r4
	bne	.L2170
	cmp	r2, #0
	cmpne	r0, #0
	moveq	ip, #1
	movne	ip, #0
	cmp	r4, #255
	movne	ip, #0
	andeq	ip, ip, #1
	cmp	ip, #0
	bne	.L2183
	cmp	r4, #1
	beq	.L2198
	cmp	r3, #0
	ldrne	r0, .L2201
	addne	r4, r0, r4, lsl #3
	ldrne	r2, [r4, #136]
	ldrne	r0, [r4, #132]
	mov	r1, r2
	mov	r0, r0, asl #10
	bl	__aeabi_idiv
	ldr	r1, [fp, #4]
	mov	r4, r0
	mov	r0, r5, asl #10
	bl	__aeabi_idiv
	movw	r3, #2405
	movw	r1, #2262
	mul	r0, r0, r4
	add	r2, r0, #1020
	cmp	r0, #0
	add	r2, r2, #3
	movlt	r0, r2
	mov	r2, r0, asr #10
	cmp	r2, r3
	rsble	r3, r2, #2400
	subgt	r3, r2, #2400
	addle	r3, r3, #6
	subgt	r3, r3, #6
	cmp	r2, r1
	ble	.L2199
	sub	r1, r2, #2256
	sub	r1, r1, #7
	cmp	r3, r1
	bge	.L2176
.L2189:
	mov	r4, #4
.L2170:
	mov	r3, r4
	ldr	r1, .L2201+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2183:
	mov	r4, r1
.L2197:
	mov	r2, r4
	b	.L2170
.L2199:
	rsb	r1, r2, #2256
	add	r1, r1, #7
	cmp	r3, r1
	blt	.L2189
.L2176:
	movw	r3, #1819
	cmp	r2, r3
	bgt	.L2177
	rsb	r3, r2, #1808
	add	r3, r3, #12
	cmp	r1, r3
	blt	.L2191
.L2178:
	movw	r1, #1364
	cmp	r2, r1
	rsble	r4, r2, #1360
	subgt	r4, r2, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r3, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L2170
.L2198:
	ldr	r3, [fp, #4]
	cmp	r5, #3840
	cmpeq	r3, #2160
	moveq	r2, #1
	movne	r2, #0
	moveq	r2, ip
	moveq	r4, #2
	beq	.L2170
	sub	r3, r3, #1072
	sub	r3, r3, #8
	bics	r3, r3, #8
	moveq	r1, #1
	movne	r1, #0
	cmp	r5, #1920
	movne	r1, #0
	andeq	r1, r1, #1
	cmp	r1, #0
	beq	.L2200
.L2196:
	mov	r4, #2
	b	.L2170
.L2177:
	sub	r3, r2, #1808
	sub	r3, r3, #12
	cmp	r1, r3
	bge	.L2178
.L2191:
	mov	r4, #3
	b	.L2170
.L2200:
	ldr	r3, [fp, #4]
	cmp	r5, #1280
	cmpeq	r3, #720
	moveq	r2, #1
	movne	r2, #0
	moveq	r2, r1
	beq	.L2196
	cmp	r5, #640
	cmpeq	r3, #480
	moveq	r4, #1
	movne	r4, #5
	b	.L2170
.L2202:
	.align	2
.L2201:
	.word	.LANCHOR0
	.word	.LC221
	UNWIND(.fnend)
	.size	H264GetDar, .-H264GetDar
	.align	2
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L2324
	cmp	r1, #0
	beq	.L2326
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
	bne	.L2327
.L2221:
	ldr	r1, .L2343
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2196]
	bhi	.L2236
	add	r6, r5, #61440
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2236
	ldr	r1, .L2343+4
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #2200]
	bhi	.L2238
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2238
	cmp	r0, #0
	beq	.L2328
	cmp	r0, #1
	beq	.L2329
.L2243:
	ldr	r1, .L2343+8
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3244]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+12
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #17]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+16
	mov	r0, r5
	bl	ue_v
	movw	r8, #509
	sub	r3, r0, #1
	str	r0, [r4, #3248]
	cmp	r3, r8
	bhi	.L2247
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2247
	ldr	r1, .L2343+20
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3252]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+24
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	cmp	r0, #0
	bne	.L2330
	ldr	r1, .L2343+28
	mov	r0, r5
	bl	u_1
	ldr	r7, [r4, #3252]
	add	r7, r7, #1
	cmp	r7, #255
	strb	r0, [r4, #19]
	bhi	.L2282
	ldr	r3, [r4, #3248]
	add	r3, r3, #1
	cmp	r7, #1
	cmphi	r3, #3
	movhi	r9, #2
	bls	.L2282
.L2251:
	mul	r7, r7, r9
	mov	r10, r3, asl #4
	mov	r7, r7, asl #4
	mul	r1, r10, r7
	add	r1, r1, r1, lsr #1
	cmp	r1, #100663296
	bhi	.L2331
	ldr	r2, [r4, #32]
	sub	r3, r2, #10
	cmp	r3, #31
	ldrls	pc, [pc, r3, asl #2]
	b	.L2253
.L2255:
	.word	.L2254
	.word	.L2256
	.word	.L2289
	.word	.L2289
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2289
	.word	.L2258
	.word	.L2260
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2260
	.word	.L2261
	.word	.L2262
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2253
	.word	.L2264
	.word	.L2264
.L2327:
	ldr	r1, .L2343+32
	bl	ue_v
	cmp	r0, #1
	str	r0, [r4, #40]
	bls	.L2332
.L2208:
	mov	r2, r0
	ldr	r1, .L2343+36
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, .L2343+40
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #44]
	cmp	r2, #8
	beq	.L2333
.L2210:
	ldr	r1, .L2343+44
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2343+48
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L2324
	ldr	r1, [r4, #44]
	add	r5, r5, #61440
	mov	ip, #0
	mov	r3, #8
	ldr	r0, [r5, #2680]
	sub	r2, fp, #68
	str	r1, [fp, #-64]
	mov	r1, #119
	str	ip, [fp, #-68]
	blx	r6
	mvn	r0, #0
.L2317:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2332:
	add	r6, r5, #61440
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2208
	ldr	r1, .L2343+40
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #44]
	cmp	r2, #8
	bne	.L2212
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	beq	.L2213
.L2212:
	ldr	r1, .L2343+44
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2343+48
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2213
	ldr	r0, [r4, #44]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #119
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #2680]
	blx	r7
.L2213:
	ldr	r1, .L2343+52
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #48]
	cmp	r2, #8
	bne	.L2215
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2215
.L2216:
	ldr	r1, .L2343+56
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L2218
	ldr	r6, [r6, #2620]
	cmp	r6, #0
	bne	.L2218
	ldr	r1, .L2343+60
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #25]
	cmp	r0, #1
	bne	.L2221
	add	r7, r4, #1968
	sub	r8, fp, #72
	add	r7, r7, #4
	add	r10, r4, #3
	add	r9, r4, #52
	b	.L2228
.L2336:
	ldr	r3, .L2343+64
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2343+68
	ldr	r3, [r3, #52]
	blx	r3
.L2224:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2334
.L2228:
	ldr	r1, .L2343+72
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
	beq	.L2335
	cmp	r6, #0
	cmpne	r6, #3
	beq	.L2336
	ldr	r3, .L2343+68
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2224
.L2333:
	add	r3, r5, #61440
	ldr	r3, [r3, #2620]
	cmp	r3, #0
	bne	.L2210
.L2324:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2328:
	ldr	r1, .L2343+76
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2204]
	bhi	.L2241
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	beq	.L2243
.L2241:
	ldr	r1, .L2343+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2215:
	ldr	r1, .L2343+84
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2343+48
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2216
	ldr	r0, [r4, #48]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #119
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #2680]
	blx	r7
	b	.L2216
.L2330:
	ldr	r7, [r4, #3252]
	strb	r3, [r4, #19]
	sub	r3, r7, #1
	cmp	r3, r8
	bhi	.L2282
	ldr	r3, [r4, #3248]
	mov	r9, #1
	add	r7, r7, #1
	add	r3, r3, r9
	b	.L2251
.L2289:
	mov	r0, #60416
	movt	r0, 13
.L2257:
	bl	__aeabi_uidiv
	ldr	r1, .L2343+88
	cmp	r0, #16
	movcc	r8, r0
	movcs	r8, #16
	mov	r2, r8
	mov	r0, #21
	bl	dprint_vfmw
	ldr	r2, [r4, #3244]
	cmp	r2, r8
	bhi	.L2265
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	beq	.L2266
.L2265:
	mov	r3, r8
	ldr	r1, .L2343+92
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #3244]
	cmp	r3, #16
	bhi	.L2321
	cmp	r8, r3
	movcc	r8, r3
.L2321:
	str	r8, [r4, #3244]
.L2266:
	ldr	r1, .L2343+96
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #20]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+100
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #21]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	cmp	r0, #0
	bne	.L2337
.L2268:
	mov	r2, r10, lsr #1
	mov	r3, r7, lsr #1
	str	r10, [r4, #3276]
	str	r7, [r4, #3280]
	str	r2, [r4, #3284]
	str	r3, [r4, #3288]
.L2270:
	ldr	r1, .L2343+104
	mov	r0, r5
	bl	u_1
	uxtb	r3, r0
	strb	r3, [r4, #22]
	ldr	r2, [r6, #2620]
	cmp	r2, #0
	bne	.L2324
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r4, #3332]
	bne	.L2338
	mov	r0, r3
	strb	r3, [r4, #3307]
	mov	r3, #5
	str	r3, [r4, #3320]
.L2273:
	ldr	r2, [r4, #3312]
	mov	r3, r10
	ldr	r1, [r4, #3308]
	str	r7, [sp]
	bl	H264GetDar
	ldr	r3, [r4, #3244]
	cmp	r3, #0
	str	r0, [r4, #3316]
	ldreq	r2, [r5]
	beq	.L2277
	ldr	r2, [r4, #3372]
	cmp	r3, r2
	ldr	r2, [r5]
	bhi	.L2279
	ldr	r1, [r2, #24]
	sub	r1, r1, #2
	cmp	r1, #1
	bls	.L2279
.L2277:
	cmp	r8, #16
	add	r5, r5, #12288
	movcs	r8, #16
	str	r8, [r5, #1296]
	ldr	r3, [r2, #28]
	cmp	r3, #25
	beq	.L2339
.L2280:
	add	r8, r8, #1
	mov	r0, #0
	str	r8, [r4, #3272]
	b	.L2317
.L2264:
	mov	r0, #12582912
	b	.L2257
.L2260:
	mov	r0, #30208
	movt	r0, 47
	b	.L2257
.L2256:
	mov	r0, #17920
	movt	r0, 5
	b	.L2257
.L2254:
	mov	r0, #20992
	movt	r0, 2
	b	.L2257
.L2262:
	mov	r0, #7864320
	b	.L2257
.L2261:
	mov	r0, #30720
	movt	r0, 105
	b	.L2257
.L2258:
	mov	r0, #55296
	movt	r0, 27
	b	.L2257
.L2253:
	ldr	r1, .L2343+108
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2236:
	ldr	r1, .L2343+112
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2282:
	ldr	r1, .L2343+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2279:
	cmp	r8, r3
	movcs	r8, r3
	b	.L2277
.L2337:
	ldr	r1, .L2343+120
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2343+124
	str	r0, [r4, #3256]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2343+128
	str	r0, [r4, #3260]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2343+132
	str	r0, [r4, #3264]
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #3264]
	ldr	r2, [r4, #3256]
	mov	r1, r9, asl #1
	ldr	ip, [r4, #3260]
	mov	r3, r3, asl #1
	mov	r2, r2, asl #1
	mul	r9, r9, r3
	rsb	r3, r2, r10
	sub	r3, r3, ip, asl #1
	rsb	ip, r9, r7
	str	r0, [r4, #3268]
	mls	r0, r0, r1, ip
	cmp	r3, #0
	cmpgt	r0, #0
	ble	.L2268
	add	r2, r2, r3, lsr #1
	add	r9, r9, r0, lsr #1
	str	r2, [r4, #3284]
	str	r9, [r4, #3288]
	str	r3, [r4, #3276]
	str	r0, [r4, #3280]
	b	.L2270
.L2338:
	add	r1, r4, #3280
	mov	r0, r5
	add	r1, r1, #12
	bl	vui_parameters
	cmp	r0, #0
	bne	.L2323
	ldrb	r3, [r4, #3304]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2323
	ldr	r2, [r4, #3372]
	clz	r3, r2
	mov	r3, r3, lsr #5
	cmp	r8, r2
	orrcc	r3, r3, #1
	cmp	r3, #0
	bne	.L2340
	ldr	r3, [r4, #3244]
	ldrb	r0, [r4, #3307]	@ zero_extendqisi2
	cmp	r2, r3
	movcs	r8, r2
	movcc	r8, r3
	b	.L2273
.L2339:
	ldr	r3, [r2, #732]
	cmp	r3, #0
	bne	.L2280
	ldr	r1, [r2, #716]
	ldr	ip, [r2, #692]
	cmp	r8, r1
	ldr	r0, [r2, #696]
	bls	.L2281
	ldr	r3, .L2343+48
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2324
	str	r1, [fp, #-72]
	mov	r3, #8
	str	r8, [fp, #-76]
	sub	r2, fp, #76
	ldr	r0, [r6, #2680]
	mov	r1, #106
	blx	r4
	mvn	r0, #0
	b	.L2317
.L2340:
	mov	r3, r8
	ldr	r1, .L2343+136
	mov	r0, #1
	bl	dprint_vfmw
.L2323:
	ldrb	r0, [r4, #3307]	@ zero_extendqisi2
	b	.L2273
.L2329:
	ldr	r1, .L2343+140
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #16]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+144
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2208]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+148
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2212]
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	bne	.L2324
	ldr	r1, .L2343+152
	mov	r0, r5
	bl	ue_v
	cmp	r0, #255
	str	r0, [r4, #2216]
	bhi	.L2244
	ldr	r7, [r6, #2620]
	cmp	r7, #0
	bne	.L2244
	cmp	r0, #0
	addne	r8, r4, #2208
	addne	r8, r8, #8
	bne	.L2246
	b	.L2243
.L2341:
	ldr	r3, [r4, #2216]
	cmp	r3, r7
	bls	.L2243
.L2246:
	ldr	r1, .L2343+156
	mov	r0, r5
	bl	se_v
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r3, [r6, #2620]
	cmp	r3, #0
	beq	.L2341
	b	.L2324
.L2334:
	add	r6, r4, #2064
	sub	r8, fp, #88
	add	r6, r6, #4
	add	r10, r4, #9
	add	r9, r4, #436
	mov	r7, #0
.L2234:
	ldr	r1, .L2343+72
	mov	r0, r5
	bl	u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r6
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2342
	ldr	r1, .L2343+160
	cmp	r7, #0
	ldr	r3, .L2343+68
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2231:
	add	r7, r7, #1
	add	r6, r6, #64
	cmp	r7, #2
	add	r9, r9, #256
	bne	.L2234
	b	.L2221
.L2335:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r5
	bl	Scaling_List
	cmp	r0, #0
	bne	.L2230
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2224
	ldr	r1, .L2343+64
	mov	r2, #16
	ldr	r3, .L2343+68
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2224
.L2247:
	mov	r2, r0
	ldr	r1, .L2343+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2238:
	ldr	r1, .L2343+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2218:
	ldr	r1, .L2343+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2342:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r6
	mov	r1, r9
	mov	r0, r5
	bl	Scaling_List
	cmp	r0, #0
	bne	.L2230
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2231
	ldr	r1, .L2343+160
	mov	r2, #64
	ldr	r3, .L2343+68
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r6
	blx	r3
	b	.L2231
.L2281:
	cmp	ip, r10
	cmpcs	r0, r7
	bcs	.L2280
	ldr	r3, .L2343+48
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2324
	strh	r0, [fp, #-70]	@ movhi
	mov	r3, #8
	strh	r10, [fp, #-76]	@ movhi
	sub	r2, fp, #76
	strh	r7, [fp, #-74]	@ movhi
	mov	r1, #107
	strh	ip, [fp, #-72]	@ movhi
	ldr	r0, [r6, #2680]
	blx	r4
	b	.L2324
.L2326:
	mov	r0, r1
	movw	r3, #9994
	ldr	r2, .L2343+176
	ldr	r1, .L2343+180
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2331:
	ldr	r1, .L2343+184
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2230:
	ldr	r1, .L2343+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2244:
	ldr	r1, .L2343+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2317
.L2344:
	.align	2
.L2343:
	.word	.LC231
	.word	.LC233
	.word	.LC236
	.word	.LC244
	.word	.LC245
	.word	.LC247
	.word	.LC248
	.word	.LC262
	.word	.LC222
	.word	.LC223
	.word	.LC224
	.word	.LC225
	.word	g_event_report
	.word	.LC226
	.word	.LC228
	.word	.LC230
	.word	.LANCHOR1+80
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC167
	.word	.LC235
	.word	.LC237
	.word	.LC227
	.word	.LC252
	.word	.LC253
	.word	.LC254
	.word	.LC255
	.word	.LC260
	.word	.LC251
	.word	.LC232
	.word	.LC249
	.word	.LC256
	.word	.LC257
	.word	.LC258
	.word	.LC259
	.word	.LC261
	.word	.LC238
	.word	.LC239
	.word	.LC240
	.word	.LC241
	.word	.LC243
	.word	.LANCHOR1+112
	.word	.LC246
	.word	.LC234
	.word	.LC229
	.word	.LC8
	.word	.LC9
	.word	.LC250
	.word	.LC168
	.word	.LC242
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
	ldr	r1, .L2359
	mov	r6, r0
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2359+4
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	mov	r0, r4
	ldr	r2, .L2359+8
	mov	r1, #2
	bl	u_v
	cmp	r0, #1
	beq	.L2355
	ldr	r3, [r5, #40]
	sub	r2, r3, #1
	cmp	r2, #1
	bls	.L2356
.L2348:
	cmp	r3, #1
	beq	.L2357
.L2349:
	ldr	r1, .L2359+12
	mov	r0, r4
	bl	u_1
	cmp	r0, #0
	bne	.L2358
.L2350:
	mov	r0, r4
	ldr	r1, .L2359+16
	bl	u_1
	cmp	r0, #1
	moveq	r0, #0
	beq	.L2347
	ldr	ip, [r5, #40]
	mov	r2, r0
	mov	r3, r6
	ldr	r1, .L2359+20
	mov	r0, #1
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, #0
.L2347:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2358:
	ldr	r1, .L2359+24
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2359+28
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	b	.L2350
.L2357:
	ldr	r2, .L2359+32
	mov	r1, #2
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2359+36
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	b	.L2349
.L2356:
	ldr	r1, .L2359+40
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2359+44
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	ldr	r3, [r5, #40]
	b	.L2348
.L2355:
	ldr	r1, .L2359+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2347
.L2360:
	.align	2
.L2359:
	.word	.LC263
	.word	.LC264
	.word	.LC265
	.word	.LC271
	.word	.LC274
	.word	.LC275
	.word	.LC272
	.word	.LC273
	.word	.LC269
	.word	.LC270
	.word	.LC267
	.word	.LC268
	.word	.LC266
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	subs	r4, r0, #0
	beq	.L2392
	ldr	r2, .L2398
	mov	r1, #8
	bl	u_v
	ldr	r1, .L2398+4
	add	r7, r4, #61440
	mov	r8, r0
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2398+8
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2398+12
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2398+16
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2398+20
	mov	r1, #4
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2398+24
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2398+28
	mov	r6, r0
	mov	r0, r4
	bl	ue_v
	ldr	r3, [r7, #2620]
	cmp	r3, #0
	mov	r9, r0
	bne	.L2391
	add	r5, r4, #12288
	ldr	r3, [r5, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L2393
	sub	r3, r8, #66
	mov	r10, r8
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L2367
.L2369:
	.word	.L2368
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2370
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2370
	.word	.L2367
	.word	.L2367
	.word	.L2370
	.word	.L2367
	.word	.L2371
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2370
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2372
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2372
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2367
	.word	.L2372
.L2368:
	ldr	r1, .L2398+32
	mov	r0, #1
	bl	dprint_vfmw
.L2370:
	cmp	r6, #9
	bls	.L2390
.L2397:
	cmp	r6, #41
	bhi	.L2390
.L2374:
	mov	r2, #4000
	ldr	r3, [r5, #1300]
	mul	r7, r2, r9
	add	r3, r3, r7
	ldrb	r8, [r3, #23]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L2375
	ldr	r3, .L2398+36
	mov	r1, #0
	ldr	r8, .L2398+40
	ldr	r3, [r3, #48]
	add	r0, r8, #2208
	blx	r3
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	add	r1, r8, #2208
	mov	r0, r4
	str	r10, [r8, #2236]
	strb	r3, [r8, #2208]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	str	r6, [r8, #2240]
	str	r9, [r8, #2244]
	strb	r3, [r8, #2209]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	strb	r3, [r8, #2210]
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	strb	r3, [r8, #2211]
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2394
	ldr	r1, [r5, #1300]
	add	r0, r8, #2208
	add	r1, r1, r7
	bl	SPSEqual
	cmp	r0, #0
	bne	.L2395
.L2377:
	cmp	r10, #83
	cmpne	r10, #86
	beq	.L2379
.L2380:
	mov	r0, #0
.L2363:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2390:
	mov	r2, r6
	mov	r3, #41
	ldr	r1, .L2398+44
	mov	r0, #1
	bl	dprint_vfmw
	mov	r6, #41
	b	.L2374
.L2375:
	str	r10, [r3, #28]
	mov	r0, r4
	ldr	r3, [r5, #1300]
	ldrb	r2, [fp, #-56]	@ zero_extendqisi2
	strb	r2, [r3, r7]
	ldr	r3, [r5, #1300]
	ldrb	r2, [fp, #-60]	@ zero_extendqisi2
	add	r3, r3, r7
	strb	r2, [r3, #1]
	ldr	r3, [r5, #1300]
	ldrb	r2, [fp, #-64]	@ zero_extendqisi2
	add	r3, r3, r7
	strb	r2, [r3, #2]
	ldr	r3, [r5, #1300]
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	add	r3, r3, r7
	strb	r2, [r3, #3]
	ldr	r3, [r5, #1300]
	add	r3, r3, r7
	str	r6, [r3, #32]
	ldr	r3, [r5, #1300]
	add	r3, r3, r7
	str	r9, [r3, #36]
	ldr	r1, [r5, #1300]
	add	r1, r1, r7
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2396
	ldr	r3, [r5, #1300]
	mov	r2, #1
	cmp	r10, #83
	cmpne	r10, #86
	add	r3, r3, r7
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r7, r3, r7
	strb	r2, [r7, #23]
	bne	.L2380
.L2379:
	mov	r0, r4
	bl	Sps_SvcExt
	cmp	r0, #0
	beq	.L2380
	ldr	r1, .L2398+48
	mov	r0, #1
	bl	dprint_vfmw
.L2391:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2393:
	ldr	r1, .L2398+52
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #1288]
	sub	r3, r2, #1
	cmp	r9, r3
	bls	.L2391
	ldr	r3, .L2398+56
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2391
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r9, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r7, #2680]
	mov	r1, #109
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2372:
	ldr	r1, .L2398+60
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r6, #9
	bhi	.L2397
	b	.L2390
.L2371:
	ldr	r1, .L2398+64
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r6, #9
	bhi	.L2397
	b	.L2390
.L2367:
	mov	r2, r8
	ldr	r1, .L2398+68
	mov	r0, #1
	mov	r10, #100
	bl	dprint_vfmw
	cmp	r6, #9
	bhi	.L2397
	b	.L2390
.L2395:
	ldr	r3, .L2398+36
	mov	r2, #4000
	ldr	r0, [r5, #1300]
	add	r1, r8, #2208
	ldr	r5, [r3, #56]
	add	r0, r0, r7
	mov	r3, #1
	strb	r3, [r8, #2232]
	strb	r3, [r8, #2231]
	blx	r5
	b	.L2377
.L2394:
	mov	r3, r9
	movw	r2, #10620
	ldr	r1, .L2398+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2363
.L2392:
	movw	r3, #10533
	ldr	r2, .L2398+76
	ldr	r1, .L2398+80
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2363
.L2396:
	mov	r3, r9
	movw	r2, #10645
	ldr	r1, .L2398+72
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #1300]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r7, r3, r7
	strb	r8, [r7, #23]
	b	.L2363
.L2399:
	.align	2
.L2398:
	.word	.LC276
	.word	.LC277
	.word	.LC278
	.word	.LC279
	.word	.LC280
	.word	.LC281
	.word	.LC282
	.word	.LC283
	.word	.LC284
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC288
	.word	.LC290
	.word	.LC174
	.word	g_event_report
	.word	.LC286
	.word	.LC285
	.word	.LC287
	.word	.LC289
	.word	.LC8
	.word	.LC9
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
	beq	.L2409
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #8
	ldr	lr, [r4, #8]
	cmp	lr, #0
	beq	.L2409
	ldr	lr, [ip, #68]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2409
	cmp	lr, r3
	bls	.L2409
	ldr	lr, [r4, #12]
	mov	r6, r2
	ldr	r4, [r4, #24]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2404
	b	.L2402
.L2405:
	ldr	r4, [r2, #24]
	ldr	r2, [r2, #12]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2402
.L2404:
	rsb	r2, r6, r5
	add	r3, r3, #1
	add	ip, ip, r2
	mov	r6, r3, asl #2
	mov	r5, r3, asl #5
	str	lr, [ip, #24]
	rsb	r2, r6, r5
	ldr	ip, [r0, #368]
	ldrb	r4, [ip]	@ zero_extendqisi2
	add	r4, r4, #1
	strb	r4, [ip]
	ldr	ip, [r0, #368]
	add	r2, ip, r2
	ldr	r4, [ip, #68]
	cmp	r4, r3
	bhi	.L2405
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2402:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #24]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2409:
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
	beq	.L2424
	ldr	r3, [r0, #368]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L2424
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #8]
	cmp	ip, #0
	beq	.L2424
	ldr	ip, [r3, #68]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2424
	cmp	ip, r7
	bls	.L2424
.L2419:
	mov	r5, r7, asl #5
	sub	r5, r5, r7, asl #2
	add	ip, r3, r5
	ldr	r4, [ip, #24]
	ldr	r8, [ip, #8]
	ldr	r6, [ip, #12]
	add	r4, r4, #7
	add	r6, r8, r6
	add	ip, r8, r4, lsr #3
	cmp	ip, r6
	bcs	.L2415
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2426
.L2417:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2427
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	strb	r3, [r4], #1
.L2426:
	ldr	r3, [r0, #368]
	add	r3, r3, r5
	ldr	r1, [r3, #24]
	add	r1, r1, #8
	str	r1, [r3, #24]
	bcc	.L2417
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2427:
	ldr	r3, [r0, #368]
.L2415:
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r7, r7, #1
	add	ip, ip, #1
	strb	ip, [r3]
	ldr	r3, [r0, #368]
	ldr	ip, [r3, #68]
	cmp	ip, r7
	bhi	.L2419
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2424:
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
	ble	.L2433
	add	r5, r0, #12288
	ldr	r3, [r5, #1264]
	ldr	r2, [r5, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2433
	add	r6, r0, #13504
	mov	r4, #0
	add	r6, r6, #24
	b	.L2430
.L2431:
	ldr	r3, [r5, #1264]
	ldr	r2, [r5, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2434
.L2430:
	add	r4, r4, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r4, r7
	bne	.L2431
.L2429:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2434:
	mov	r7, r4
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2433:
	mov	r7, #0
	b	.L2429
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
	ldr	r1, .L2442
	mov	r5, r0
	bl	ue_v
	add	r4, r5, #24576
	ldr	r2, .L2442+4
	mov	r1, #1
	str	r0, [r4, #1832]
	mov	r0, r5
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r4, #1809]
	cmp	r0, #0
	beq	.L2441
.L2436:
	mov	r0, r5
	ldr	r2, .L2442+8
	mov	r1, #1
	bl	u_v
	mov	r3, #1
	strb	r3, [r4, #1808]
	strb	r0, [r4, #1810]
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2441:
	ldr	r2, .L2442+12
	mov	r1, #7
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+16
	mov	r1, #1
	str	r0, [r4, #1824]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+20
	mov	r1, #6
	strb	r0, [r4, #1811]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+24
	mov	r1, #1
	str	r0, [r4, #1828]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+28
	mov	r1, #1
	strb	r0, [r4, #1812]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+32
	mov	r1, #1
	strb	r0, [r4, #1813]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+36
	mov	r1, #1
	strb	r0, [r4, #1814]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+40
	mov	r1, #1
	strb	r0, [r4, #1815]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+44
	mov	r1, #1
	strb	r0, [r4, #1816]
	mov	r0, r5
	bl	u_v
	ldrb	r3, [r4, #1811]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #1817]
	bne	.L2437
	ldr	r3, [r4, #1824]
	cmp	r3, #5
	beq	.L2437
	ldr	r2, .L2442+48
	mov	r1, #1
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+52
	mov	r1, #1
	strb	r0, [r4, #1818]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+56
	mov	r1, #1
	strb	r0, [r4, #1819]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2442+60
	mov	r1, #1
	strb	r0, [r4, #1820]
	mov	r0, r5
	bl	u_v
	strb	r0, [r4, #1821]
.L2437:
	ldr	r2, .L2442+64
	mov	r1, #8
	mov	r0, r5
	bl	u_v
	ldr	r1, .L2442+68
	str	r0, [r4, #1836]
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #1840]
	b	.L2436
.L2443:
	.align	2
.L2442:
	.word	.LC291
	.word	.LC292
	.word	.LC308
	.word	.LC293
	.word	.LC294
	.word	.LC295
	.word	.LC296
	.word	.LC297
	.word	.LC298
	.word	.LC299
	.word	.LC300
	.word	.LC301
	.word	.LC302
	.word	.LC303
	.word	.LC304
	.word	.LC305
	.word	.LC306
	.word	.LC307
	UNWIND(.fnend)
	.size	H264_DecFramePackingSEI, .-H264_DecFramePackingSEI
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
	bne	.L2445
	ldr	r0, [r2, #1288]
	cmp	r0, #0
	ble	.L2446
	ldrb	r2, [r3, #23]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #4000
	beq	.L2449
	b	.L2467
.L2450:
	ldrb	r1, [r3, #-3977]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2447
.L2449:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, r0
	add	r3, r3, #4000
	bne	.L2450
.L2446:
	ldr	r1, .L2470
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
.L2451:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2467:
	mov	r4, r3
.L2447:
	cmp	r4, #0
	beq	.L2446
.L2445:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2453
	ldrb	r3, [r4, #3299]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2468
	ldr	r1, [r4, #3676]
	ldr	r7, [r4, #3680]
	add	r1, r1, #1
	add	r7, r7, #1
.L2457:
	ldr	r2, .L2470+4
	mov	r0, r5
	bl	u_v
	add	r6, r5, #24576
	ldr	r2, .L2470+8
	mov	r1, r7
	str	r0, [r6, #1848]
	mov	r0, r5
	bl	u_v
	add	r3, r5, #61440
	ldr	r2, .L2470+12
	str	r0, [r6, #1852]
	ldr	r3, [r3, #2680]
	ldr	r3, [r2, r3, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L2469
.L2453:
	ldrb	r0, [r4, #3303]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2451
	ldr	r2, .L2470+16
	mov	r1, #4
	mov	r0, r5
	add	r5, r5, #24576
	bl	u_v
	mov	r3, #0
	strb	r0, [r5, #1844]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2468:
	ldrb	r3, [r4, #3302]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2453
	ldr	r1, [r4, #3988]
	ldr	r7, [r4, #3992]
	add	r1, r1, #1
	add	r7, r7, #1
	b	.L2457
.L2469:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L2453
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L2453
	mov	r0, r5
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2453
.L2471:
	.align	2
.L2470:
	.word	.LC309
	.word	.LC310
	.word	.LC311
	.word	s_pstVfmwChan
	.word	.LC312
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	subs	r4, r0, #0
	mov	r3, #0
	strb	r3, [fp, #-45]
	beq	.L2598
	add	r6, r4, #61440
	ldr	r3, .L2615
	ldr	r2, [r6, #2680]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L2599
.L2475:
	ldr	r3, [r4, #368]
	mov	r2, #32
	str	r2, [r3, #24]
.L2476:
	mov	r7, #0
	b	.L2480
.L2477:
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	add	r7, r7, r3
	bl	SkipBytes
	cmp	r0, #0
	ble	.L2479
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2600
.L2480:
	sub	r1, fp, #45
	mov	r2, #1
	mov	r0, r4
	bl	GetBytes
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L2477
.L2479:
	ldr	r1, .L2615+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2474:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2600:
	add	r8, r4, #13504
	movw	r9, #21572
	add	r8, r8, #24
	movt	r9, 12615
	mov	r10, #0
.L2566:
	mov	r5, #0
	b	.L2483
.L2481:
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	add	r5, r5, r3
	bl	SkipBytes
	cmp	r0, #0
	ble	.L2479
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2601
.L2483:
	sub	r1, fp, #45
	mov	r2, #1
	mov	r0, r4
	bl	GetBytes
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L2481
.L2484:
	ldr	r1, .L2615+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2599:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L2475
	ldr	r2, [r3, #164]
	cmp	r2, #2
	bne	.L2475
	ldr	r3, [r3, #156]
	cmp	r3, #1
	bne	.L2475
	ldr	r3, [r4, #368]
	mov	r2, #48
	str	r2, [r3, #24]
	b	.L2476
.L2601:
	cmp	r5, #409600
	bgt	.L2484
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #68]
	cmp	r3, #2
	ldreq	r3, [r2, #52]
	ldreq	r2, [r2, #24]
	ldrne	r2, [r2, #24]
	addeq	r2, r3, r2
	moveq	r2, r2, lsr #3
	cmp	r7, #45
	ldrls	pc, [pc, r7, asl #2]
	b	.L2487
.L2489:
	.word	.L2488
	.word	.L2490
	.word	.L2491
	.word	.L2492
	.word	.L2493
	.word	.L2493
	.word	.L2494
	.word	.L2495
	.word	.L2496
	.word	.L2497
	.word	.L2498
	.word	.L2499
	.word	.L2500
	.word	.L2501
	.word	.L2502
	.word	.L2503
	.word	.L2504
	.word	.L2505
	.word	.L2506
	.word	.L2507
	.word	.L2508
	.word	.L2509
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2487
	.word	.L2510
.L2510:
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
	blt	.L2602
.L2559:
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	blt	.L2603
.L2593:
	ldr	r3, [r6, #1392]
.L2512:
	cmp	r3, #3
	bhi	.L2604
	mov	r7, #0
	b	.L2565
.L2606:
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	add	r7, r7, r3
	bl	SkipBytes
	cmp	r0, #0
	ble	.L2479
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2605
.L2565:
	sub	r1, fp, #45
	mov	r2, #1
	mov	r0, r4
	bl	GetBytes
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L2606
	b	.L2479
.L2509:
	mov	r3, r5
	ldr	r1, .L2615+12
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	blt	.L2607
.L2562:
	mov	r1, r5
	mov	r0, r4
	bl	SkipBytes
	b	.L2593
.L2508:
	mov	r3, r5
	ldr	r1, .L2615+16
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11454
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2507:
	mov	r3, r5
	ldr	r1, .L2615+28
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11441
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2506:
	mov	r3, r5
	ldr	r1, .L2615+32
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11428
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2505:
	mov	r3, r5
	ldr	r1, .L2615+36
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11415
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2504:
	mov	r3, r5
	ldr	r1, .L2615+40
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11402
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2503:
	mov	r3, r5
	ldr	r1, .L2615+44
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11389
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2502:
	mov	r3, r5
	ldr	r1, .L2615+48
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11376
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2501:
	mov	r3, r5
	ldr	r1, .L2615+52
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11362
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2500:
	mov	r3, r5
	ldr	r1, .L2615+56
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11349
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2499:
	mov	r3, r5
	ldr	r1, .L2615+60
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11336
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2498:
	mov	r3, r5
	ldr	r1, .L2615+64
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11323
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2497:
	mov	r3, r5
	ldr	r1, .L2615+68
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11310
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2496:
	mov	r3, r5
	ldr	r1, .L2615+72
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11297
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2495:
	mov	r3, r5
	ldr	r1, .L2615+76
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11284
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2494:
	mov	r3, r5
	ldr	r1, .L2615+80
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	SkipBytes
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2593
	movw	r3, #11272
.L2594:
	ldr	r2, .L2615+20
	mov	r0, #20
	ldr	r1, .L2615+24
	bl	dprint_vfmw
	ldr	r3, [r6, #1392]
	b	.L2512
.L2493:
	cmp	r7, #4
	mov	r3, r5
	beq	.L2519
	cmp	r10, #0
	bne	.L2519
	ldr	r1, .L2615+84
	mov	r0, #20
	bl	dprint_vfmw
.L2521:
	ldr	r7, [r6, #1392]
	cmp	r7, #3
	bhi	.L2608
.L2522:
	ldr	r0, [r6, #2680]
	add	r7, r7, #15680
	bl	GetUsd
	add	r7, r7, #28
	add	r7, r4, r7, lsl #2
	str	r0, [r7, #4]
	ldr	r3, [r6, #1392]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	lr, [r3, #4]
	cmp	lr, #0
	beq	.L2569
	ldr	r1, [r4, #368]
	cmp	r5, #1024
	movlt	r3, r5
	movge	r3, #1024
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	ip, [r1, #68]
	str	r3, [fp, #-64]
	cmp	r0, ip
	bcs	.L2570
	sxth	r3, r0
	mov	r7, #0
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r1, r1, r3
.L2524:
	ldr	r2, [r1, #24]
	add	r0, r0, #1
	ldr	r3, [r1, #12]
	cmp	r0, ip
	add	r2, r2, #7
	add	r1, r1, #28
	sub	r3, r3, r2, lsr #3
	add	r7, r7, r3
	bne	.L2524
	mov	r3, r7
.L2523:
	ldr	r1, [fp, #-64]
	sxtb	r2, r10
	str	r2, [fp, #-68]
	cmp	r1, r3
	movle	r7, r1
	cmp	r2, #1
	movne	r3, #0
	strne	r3, [fp, #-56]
	strne	r3, [fp, #-60]
	beq	.L2609
.L2526:
	ldr	r3, [fp, #-56]
	rsb	r2, r3, r7
	cmp	r2, #0
	ble	.L2610
	ldr	r3, [r6, #1392]
	mov	r0, r4
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	GetBytes
	subs	r1, r0, #0
	ble	.L2611
	cmp	r1, #4
	bgt	.L2532
	ldr	r3, [r6, #1392]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r0, [r3, #4]
.L2533:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-60]
	rsb	r3, r2, r3
	cmp	r1, r3
	blt	.L2612
	ldr	r3, [fp, #-64]
	cmp	r3, r5
	ldr	r3, [fp, #-60]
	rsb	r7, r3, r5
	str	r7, [r0, #1052]
	bcc	.L2613
.L2538:
	mov	r1, r7
	mov	r0, r4
	bl	SkipBytes
.L2536:
	ldr	r2, [fp, #-68]
	ldr	r3, [r6, #1392]
	cmp	r2, #1
	ldr	r1, [r4]
	add	r3, r3, #15680
	moveq	r2, #8
	movne	r2, #9
.L2597:
	add	r3, r3, #28
	ldrd	r0, [r1, #64]
	ldr	ip, .L2615+88
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	ldr	r5, [ip]
	add	r3, r3, #1056
	cmp	r5, #0
	strd	r0, [r3]
	ldr	r3, [r6, #1392]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r2, [r3, #1040]
	ldr	r3, [r6, #1392]
	ldr	r2, [r6, #2640]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r2, [r3, #1044]
	beq	.L2541
	ldr	r2, [r6, #1392]
	movw	r3, #1064
	mov	r1, #6
	ldr	r0, [r6, #2680]
	add	r2, r2, #15680
	add	r2, r2, #28
	add	r2, r4, r2, lsl #2
	ldr	r2, [r2, #4]
	blx	r5
.L2541:
	ldr	r3, [r6, #1392]
	add	r3, r3, #1
	str	r3, [r6, #1392]
	b	.L2512
.L2492:
	mov	r3, r5
	ldr	r1, .L2615+92
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11100
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2491:
	mov	r3, r5
	ldr	r1, .L2615+96
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11086
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2490:
	add	r7, r4, #12288
	mov	r3, r5
	ldr	r1, .L2615+100
	mov	r0, #20
	bl	dprint_vfmw
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
	blt	.L2614
.L2514:
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2593
	movw	r3, #11074
	b	.L2594
.L2488:
	add	r1, r4, #24576
	mov	ip, #1
	mov	r3, #0
	ldr	r0, [r1, #1856]
	str	r3, [r1, #1864]
	mov	r3, r5
	add	r0, r0, ip
	strb	ip, [r1, #1936]
	str	r0, [r1, #1856]
	mov	r0, #20
	ldr	r1, .L2615+104
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11046
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2487:
	mov	r1, r5
	mov	r0, r4
	bl	PassBytes
	cmp	r0, #0
	bge	.L2562
	movw	r3, #11506
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2605:
	cmp	r3, #128
	bne	.L2566
	mov	r0, #0
	b	.L2474
.L2598:
	movw	r3, #10947
	ldr	r2, .L2615+108
	ldr	r1, .L2615+112
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2474
.L2604:
	ldr	r1, .L2615+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2474
.L2532:
	ldr	r2, [r6, #1392]
	add	r2, r4, r2, lsl #2
	add	r2, r2, #61440
	ldr	r0, [r2, #1396]
	ldr	r3, [r0]
	cmp	r3, r9
	bne	.L2533
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	ldrb	r3, [r6, #2732]	@ zero_extendqisi2
	sub	ip, ip, #65
	clz	ip, ip
	mov	ip, ip, lsr #5
	bfi	r3, ip, #0, #1
	strb	r3, [r6, #2732]
	uxtb	r3, r3
	tst	r3, #1
	ldrneb	r0, [r0, #5]	@ zero_extendqisi2
	bfine	r3, r0, #1, #4
	strneb	r3, [r6, #2732]
	ldr	r0, [r2, #1396]
	b	.L2533
.L2612:
	str	r1, [r0, #1052]
	mov	r0, r4
	bl	SkipBytes
	b	.L2536
.L2609:
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	mov	r1, #8
	ldr	r2, .L2615+120
	mov	r0, r4
	strb	r3, [lr, #1026]
	ldr	r3, [r6, #1392]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [fp, #-56]
	bl	u_v
	ldr	r3, [fp, #-56]
	strb	r0, [r3, #1027]
	ldr	r3, [r6, #1392]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	ldrb	r2, [r3, #1027]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L2527
	mov	r2, #3
	str	r2, [fp, #-56]
	mov	r1, r2
	mov	r2, #0
	str	r1, [fp, #-60]
	strb	r2, [r3, #1028]
.L2528:
	ldr	r3, [r6, #1392]
	mov	r1, #16
	ldr	r2, .L2615+124
	mov	r0, r4
	add	r3, r3, #15680
	add	r3, r3, #28
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
	bne	.L2526
	ldr	r3, [r6, #1392]
	mov	r2, #8
	ldr	r1, [r4]
	add	r3, r3, #15680
	b	.L2597
.L2608:
	ldr	r1, [r6, #1396]
	ldr	r0, [r6, #2680]
	bl	FreeUsdByDec
	ldr	r1, [r6, #1400]
	ldr	r0, [r6, #2680]
	bl	FreeUsdByDec
	ldr	r1, [r6, #1404]
	ldr	r0, [r6, #2680]
	bl	FreeUsdByDec
	ldr	r1, [r6, #1408]
	ldr	r0, [r6, #2680]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r7, r3
	str	r3, [r6, #1396]
	str	r3, [r6, #1400]
	str	r3, [r6, #1404]
	str	r3, [r6, #1408]
	str	r3, [r6, #1392]
	b	.L2522
.L2613:
	ldr	r3, [fp, #-64]
	mov	r0, r4
	rsb	r1, r3, r5
	bl	PassBytes
	cmp	r0, #0
	bge	.L2538
	movw	r3, #11246
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2538
.L2519:
	ldr	r1, .L2615+128
	mov	r0, #20
	bl	dprint_vfmw
	mov	r10, #1
	b	.L2521
.L2607:
	movw	r3, #11467
	ldr	r2, .L2615+20
	ldr	r1, .L2615+24
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2562
.L2614:
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
	bhi	.L2514
	mov	r0, r8
	bl	BsSkip
	b	.L2514
.L2603:
	movw	r3, #11494
	b	.L2594
.L2602:
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
	bhi	.L2559
	mov	r0, r8
	bl	BsSkip
	b	.L2559
.L2570:
	mov	r3, #0
	mov	r7, r3
	b	.L2523
.L2569:
	mvn	r0, #0
	b	.L2474
.L2527:
	ldr	r2, .L2615+132
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
	b	.L2528
.L2611:
	ldr	r1, .L2615+136
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #1392]
	ldr	r0, [r6, #2680]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	FreeUsdByDec
	ldr	r3, [r6, #1392]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r4, r4, r3, lsl #2
	str	r2, [r4, #4]
	b	.L2474
.L2610:
	ldr	r1, .L2615+140
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #1392]
	ldr	r0, [r6, #2680]
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	FreeUsdByDec
	ldr	r3, [r6, #1392]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #15680
	add	r3, r3, #28
	add	r3, r4, r3, lsl #2
	str	r2, [r3, #4]
	b	.L2474
.L2616:
	.align	2
.L2615:
	.word	s_pstVfmwChan
	.word	.LC313
	.word	.LC314
	.word	.LC342
	.word	.LC341
	.word	.LANCHOR0+268
	.word	.LC316
	.word	.LC340
	.word	.LC339
	.word	.LC338
	.word	.LC337
	.word	.LC336
	.word	.LC335
	.word	.LC334
	.word	.LC333
	.word	.LC332
	.word	.LC331
	.word	.LC330
	.word	.LC329
	.word	.LC328
	.word	.LC327
	.word	.LC321
	.word	g_event_report
	.word	.LC319
	.word	.LC318
	.word	.LC317
	.word	.LC315
	.word	.LC8
	.word	.LC9
	.word	.LC343
	.word	.LC322
	.word	.LC324
	.word	.LC320
	.word	.LC323
	.word	.LC326
	.word	.LC325
	UNWIND(.fnend)
	.size	H264_DecSEI, .-H264_DecSEI
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
	b	.L2625
.L2620:
	.word	.L2619
	.word	.L2625
	.word	.L2625
	.word	.L2625
	.word	.L2619
	.word	.L2625
	.word	.L2621
	.word	.L2621
.L2621:
	ldr	r0, [r0]
	mov	r3, #1
	str	r3, [r5]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2619:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L2622
.L2624:
	mvn	r0, #0
.L2623:
	mov	r3, #0
	str	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2625:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2622:
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
	bhi	.L2624
	mov	r0, r0, asl #1
	rsb	r0, r0, #31
	mov	r0, r4, lsr r0
	subs	r0, r0, #1
	mvnne	r0, #0
	b	.L2623
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
	ble	.L2652
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2640
	ldr	r5, .L2653
	ldr	r10, .L2653+4
.L2638:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2653
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
	bne	.L2630
	ldr	r2, .L2653
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2633
	b	.L2631
.L2634:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2631
.L2633:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2634
.L2630:
	mov	r0, r4, asl #3
.L2629:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2642
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2642
.L2637:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2635
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2637
	b	.L2635
.L2631:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2638
	b	.L2630
.L2642:
	mov	r3, #0
.L2635:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2652:
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L2653+8
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2640:
	mov	r0, r4
	b	.L2629
.L2654:
	.align	2
.L2653:
	.word	.LANCHOR3-1976
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC344
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
	beq	.L2661
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2660
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #36]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #40]
	cmp	r0, r2, asl #3
	bcs	.L2664
	cmn	r0, #1
	beq	.L2660
.L2659:
	add	r0, r0, #1
	str	r0, [r3, #72]
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2663
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #72]
	cmp	r2, r1, asl #3
	bcs	.L2665
.L2663:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2665:
	add	r2, r4, #61440
	ldr	r1, [r3, #60]
	ldr	r0, [r2, #2680]
	bl	SM_ReleaseStreamSeg
	ldr	r2, [r4, #368]
	mov	r3, #0
	mov	r1, #1
	mov	r0, r3
	str	r3, [r2, #36]
	ldr	r2, [r4, #368]
	str	r1, [r2, #68]
	ldr	r2, [r4, #368]
	str	r3, [r2, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2664:
	add	r2, r4, #61440
	ldr	r1, [r3, #60]
	ldr	r0, [r2, #2680]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #36]
	ldr	r3, [r4, #368]
	str	r2, [r3, #68]
	ldr	r3, [r4, #368]
.L2660:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	b	.L2659
.L2661:
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
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r4, r0, #0
	beq	.L2666
	ldr	r3, [r4, #368]
	ldr	r3, [r3, #12]
	cmp	r3, #4096
	bcs	.L2666
	ldr	r1, .L2671
	mov	r0, #7
	bl	dprint_vfmw
	ldr	ip, [r4, #368]
	ldr	r1, .L2671+4
	mov	r0, #7
	mov	r5, #0
	ldr	lr, [ip, #40]
	ldr	r3, [ip, #44]
	ldr	r2, [ip, #16]
	str	lr, [sp, #4]
	ldr	ip, [ip, #12]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #368]
	ldr	ip, .L2671+8
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r3, #8]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #368]
	mov	ip, #1
	ldr	r1, .L2671+12
	mov	r0, #7
	ldr	r2, [r3, #60]
	ldr	r6, [r3, #32]
	str	r2, [r3, #32]
	ldr	r3, [r4, #368]
	str	r5, [r3, #24]
	ldr	r3, [r4, #368]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #36]
	rsb	r2, lr, r2
	str	r2, [r3, #8]
	ldr	r3, [r4, #368]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #44]
	rsb	r2, lr, r2
	str	r2, [r3, #16]
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #12]
	ldr	lr, [r3, #40]
	add	r2, r2, lr
	str	r2, [r3, #12]
	ldr	r3, [r4, #368]
	str	ip, [r3, #68]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #16]
	bl	dprint_vfmw
	add	r3, r4, #61440
	mov	r1, r6
	ldr	r0, [r3, #2680]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	str	r5, [r3, #36]
	ldr	r3, [r4, #368]
	str	r5, [r3, #52]
	ldr	r3, [r4, #368]
	str	r5, [r3, #40]
.L2666:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2672:
	.align	2
.L2671:
	.word	.LC345
	.word	.LC346
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC347
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
	subs	ip, r0, #0
	beq	.L2678
	ldrb	r0, [ip, #377]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2679
	mov	r2, ip
	mov	r3, #1
	b	.L2677
.L2676:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2678
.L2677:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L2676
	mov	r0, r3
.L2675:
	mov	r2, r3, asl #7
	mov	r1, #1
	sub	r3, r2, r3, asl #5
	add	ip, ip, r3
	strb	r1, [ip, #377]
	ldmfd	sp, {fp, sp, pc}
.L2678:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2679:
	mov	r3, r0
	b	.L2675
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
	add	r3, r4, #61440
	ldreqb	r0, [r3, #740]	@ zero_extendqisi2
	beq	.L2684
	ubfx	lr, r0, #16, #6
	ubfx	ip, r0, #15, #1
	ubfx	r1, r0, #12, #3
	strb	lr, [r3, #741]
	strb	ip, [r3, #742]
	ubfx	lr, r0, #8, #4
	ubfx	ip, r0, #5, #3
	strb	r1, [r3, #743]
	strb	lr, [r3, #744]
	ubfx	r1, r0, #4, #1
	ubfx	lr, r0, #3, #1
	strb	ip, [r3, #745]
	strb	r1, [r3, #746]
	ubfx	ip, r0, #2, #1
	and	r1, r0, #3
	strb	lr, [r3, #747]
	ubfx	r0, r0, #22, #1
	strb	ip, [r3, #748]
	strb	r1, [r3, #749]
	strb	r0, [r3, #740]
.L2684:
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
	add	r3, r0, #61440
	mov	r5, r2
	mov	r4, r0
	mov	r8, r1
	ldr	r2, [r3, #2624]
	mov	r0, #22
	ldr	r1, .L2695
	add	r6, r4, #20480
	sub	r2, r2, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5]
	mov	r0, r4
	str	r3, [r8]
	ldr	r3, [r4, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r6, #211]
	ldr	r3, [r3, #76]
	str	r3, [r6, #236]
	bl	SliceCheck
	subs	r7, r0, #0
	bne	.L2690
	mov	r0, r4
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L2694
	ldrb	r1, [r6, #213]	@ zero_extendqisi2
	add	r0, r4, #12288
	mov	ip, #2208
	mov	r3, #4000
	sub	r1, r1, #1
	add	r4, r4, #24576
	clz	r1, r1
	mov	r1, r1, lsr #5
	str	r1, [r8]
	ldr	r1, [r6, #216]
	ldr	r2, [r0, #1304]
	ldr	lr, [r0, #1300]
	mla	r2, ip, r1, r2
	ldr	ip, [r0, #1280]
	ldr	r0, [r0, #1276]
	ldr	r2, [r2, #28]
	mla	r3, r3, r2, lr
	ldrb	r1, [r3, #18]	@ zero_extendqisi2
	ldr	lr, [r3, #3252]
	rsb	r2, r1, #2
	ldr	r1, [r3, #3248]
	mla	r2, lr, r2, r2
	add	r1, r1, #1
	cmp	r0, r1
	cmpeq	ip, r2
	movne	r2, #1
	strne	r2, [r5]
	ldr	r2, [r3, #3272]
	ldr	r3, [r4, #2136]
	add	r3, r3, #1
	cmp	r2, r3
	movne	r3, #1
	strne	r3, [r5]
.L2687:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2690:
	mvn	r7, #0
	b	.L2687
.L2694:
	ldr	r1, .L2695+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L2687
.L2696:
	.align	2
.L2695:
	.word	.LC348
	.word	.LC349
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
	add	r0, r0, #61440
	ldr	r0, [r0, #2604]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HaveSliceToDec, .-HaveSliceToDec
	.align	2
	.global	H264DEC_Destroy
	.type	H264DEC_Destroy, %function
H264DEC_Destroy:
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
	subs	r9, r0, #0
	beq	.L2719
	add	r8, r9, #61440
	bl	H264_ClearCurrPic
	mov	r0, r9
	bl	ClearAllNal
	ldr	r3, [r8, #2616]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r8, #2616]
	ldr	r3, [r8, #1392]
	cmp	r3, #0
	beq	.L2701
	add	r5, r9, #62720
	mov	r4, #0
	add	r5, r5, #112
	mov	r6, r4
.L2703:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L2702
	ldr	r0, [r8, #2680]
	bl	FreeUsdByDec
	str	r6, [r5]
.L2702:
	ldr	r3, [r8, #1392]
	cmp	r3, r4
	bhi	.L2703
.L2701:
	add	r5, r9, #27904
	add	r9, r9, #61184
	add	r5, r5, #72
	add	r9, r9, #72
	mov	r6, #0
	mov	r7, #0
.L2707:
	sub	r4, r5, #32
.L2705:
	ldr	r1, [r4, #8]!
	cmp	r1, #0
	beq	.L2704
	ldr	r0, [r8, #2680]
	bl	FreeUsdByDec
	strd	r6, [r4]
.L2704:
	cmp	r4, r5
	bne	.L2705
	add	r5, r4, #832
	cmp	r5, r9
	bne	.L2707
	ldr	r1, .L2720
	mov	r0, #2
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L2719:
	movw	r3, #12475
	ldr	r2, .L2720+4
	ldr	r1, .L2720+8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L2721:
	.align	2
.L2720:
	.word	.LC350
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264DEC_Destroy, .-H264DEC_Destroy
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
	mov	r5, r0
	mov	r8, r1
	mov	r0, #2
	ldr	r1, .L2735
	bl	dprint_vfmw
	cmp	r5, #0
	beq	.L2733
	add	r5, r5, #61440
	mov	r1, r8
	ldr	r0, [r5, #2680]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L2728
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	beq	.L2728
	add	r4, r0, #576
	add	r9, r0, #608
	mov	r6, #0
	mov	r7, #0
.L2726:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L2734
.L2725:
	cmp	r4, r9
	bne	.L2726
	ldr	r0, [r5, #2680]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2734:
	mov	r1, r2
	ldr	r0, [r5, #2680]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L2725
.L2728:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2733:
	mov	r0, r5
	movw	r3, #13211
	ldr	r2, .L2735+4
	ldr	r1, .L2735+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2736:
	.align	2
.L2735:
	.word	.LC351
	.word	.LC8
	.word	.LC9
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
	mov	r7, r2
	mov	r4, r0
	moveq	r3, #1
	movne	r3, #0
	mov	r5, r1
	beq	.L2779
	ldr	r2, [r0]
	ldr	r2, [r2, #24]
	cmp	r2, #0
	beq	.L2740
	add	r2, r0, #61440
	ldr	r1, [r2, #2608]
	cmp	r1, #2
	beq	.L2740
	ldr	r1, [r2, #732]
	cmp	r1, #0
	strneb	r3, [r1, #1]
	movne	r0, #1
	strne	r3, [r2, #732]
	beq	.L2742
.L2739:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2740:
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	cmn	r0, #3
	beq	.L2742
	add	r6, r4, #61440
	ldr	r1, [r6, #732]
	cmp	r1, #0
	beq	.L2743
	mov	r0, r4
	bl	GetImagePara
	ldr	r1, [r6, #732]
	mov	r0, r4
	bl	CheckFrameStore
	subs	r3, r0, #0
	beq	.L2780
	cmn	r3, #3
	beq	.L2750
	ldr	r1, .L2788
	movw	r2, #2194
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #732]
	mov	r0, r4
	ldr	r1, [r3, #164]
	bl	H264DEC_RecycleImage
.L2750:
	ldr	r3, [r6, #732]
	mov	r0, #0
	strb	r0, [r3, #1]
	ldr	r3, [r6, #732]
	str	r0, [r6, #732]
	cmp	r5, r3
	beq	.L2739
.L2743:
	mov	r1, r5
	mov	r0, r4
	bl	GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	subs	r3, r0, #0
	beq	.L2781
	cmn	r3, #3
	beq	.L2742
	movw	r2, #2251
	ldr	r1, .L2788
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #164]
	mov	r0, r4
	bl	H264DEC_RecycleImage
	mov	r0, #2
	b	.L2739
.L2779:
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L2788+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2742:
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2781:
	mov	r2, #1
	ldr	r1, [r5, #656]
	ldr	r0, [r6, #2680]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #656]
	ldr	r0, [r6, #2680]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2782
	cmp	r7, #1
	add	r3, r4, #8
	streq	r7, [r8, #180]
	mov	r2, r4
	ldr	r0, [r6, #2680]
	mov	r1, #0
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2783
	ldr	r3, [r4]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #16]
	bcs	.L2784
.L2757:
	ldr	r2, [r6, #2708]
	mov	r0, #0
	ldr	r3, [r6, #2700]
	add	r2, r2, #1
	str	r2, [r6, #2708]
	add	r3, r3, #2
	str	r3, [r6, #2700]
	b	.L2739
.L2780:
	ldr	r3, [r6, #732]
	mov	r2, #1
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
	ldr	r3, [r6, #732]
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2785
	ldr	r3, [r6, #732]
	mov	r2, r4
	mov	r1, #0
	cmp	r5, r3
	cmpeq	r7, #1
	moveq	r3, #1
	streq	r3, [r8, #180]
	add	r3, r4, #8
	ldr	r0, [r6, #2680]
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2786
	ldr	r3, [r4]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #16]
	bcs	.L2787
.L2749:
	ldr	r2, [r6, #2708]
	ldr	r3, [r6, #2700]
	add	r2, r2, #1
	str	r2, [r6, #2708]
	add	r3, r3, #2
	str	r3, [r6, #2700]
	b	.L2750
.L2784:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.7
	b	.L2757
.L2787:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.7
	b	.L2749
.L2783:
	mov	r2, r0
	ldr	r1, .L2788+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r5, #656]
	ldr	r0, [r6, #2680]
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2739
.L2786:
	mov	r2, r0
	ldr	r1, .L2788+8
	mov	r0, #0
	mov	r5, r0
	bl	dprint_vfmw
	ldr	r3, [r6, #732]
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r3, [r6, #732]
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
	str	r5, [r6, #732]
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2739
.L2782:
	movw	r2, #2221
	ldr	r1, .L2788+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2739
.L2785:
	movw	r2, #2165
	ldr	r1, .L2788+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2739
.L2789:
	.align	2
.L2788:
	.word	.LC355
	.word	.LC352
	.word	.LC354
	.word	.LC356
	.word	.LC353
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
	subs	r6, r0, #0
	mov	r7, r1
	beq	.L2795
	add	r4, r6, r1, lsl #2
	add	r4, r4, #24576
	ldr	r3, [r4, #1944]
	cmp	r3, #0
	beq	.L2796
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r1, [r4, #1944]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1944]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r5, r0
	beq	.L2797
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2797:
	mov	r0, r6
	mov	r1, r7
	bl	RemoveFrameStoreOutDPB
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2796:
	mov	r0, r3
	ldr	r2, .L2798
	movw	r3, #2271
	ldr	r1, .L2798+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2795:
	movw	r3, #2270
	ldr	r2, .L2798
	ldr	r1, .L2798+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2799:
	.align	2
.L2798:
	.word	.LC8
	.word	.LC9
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
	subs	r4, r0, #0
	beq	.L2801
	add	r6, r4, #24576
	ldr	r3, [r6, #2140]
	cmp	r3, #0
	addne	r7, r4, #26368
	movne	r5, #0
	addne	r7, r7, #148
	bne	.L2806
	b	.L2803
.L2805:
	ldr	r3, [r6, #2140]
	cmp	r3, r5
	bls	.L2803
.L2806:
	ldr	r1, [r7, #4]!
	add	r5, r5, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2805
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r6, #2140]
	cmp	r3, r5
	bhi	.L2806
.L2803:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L2808
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2803
	b	.L2808
.L2809:
	bl	GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	OutputFrmFromDPB
	cmn	r0, #1
	beq	.L2804
.L2808:
	ldr	r3, [r6, #2140]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L2809
	mov	r0, r3
.L2804:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2801:
	movw	r3, #2393
	ldr	r2, .L2817
	ldr	r1, .L2817+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2804
.L2818:
	.align	2
.L2817:
	.word	.LC8
	.word	.LC9
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
	add	r3, r0, #57344
	add	r8, r0, #60672
	add	r2, r0, #26368
	ldr	r4, [r3, #3988]
	mov	r6, r0
	str	r3, [fp, #-56]
	add	r1, r0, #16384
	add	r7, r4, #2000
	add	r4, r4, #4
	add	r7, r7, #4
	add	r3, r2, #212
	str	r1, [fp, #-48]
	str	r3, [fp, #-52]
.L2832:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L2820
.L2822:
	.word	.L2821
	.word	.L2823
	.word	.L2824
	.word	.L2825
	.word	.L2826
	.word	.L2827
	.word	.L2828
.L2828:
	ldr	r2, [r4, #12]
	mov	r1, r8
	mov	r0, r6
	bl	MarkCurrPicLT
.L2820:
	add	r4, r4, #20
	cmp	r4, r7
	bne	.L2832
.L2821:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #3444]
	cmp	r3, #1
	movne	r0, #0
	beq	.L2841
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2827:
	add	r9, r6, #24576
	ldr	r3, [r9, #2144]
	cmp	r3, #0
	ldrne	r10, [fp, #-52]
	movne	r5, #0
	beq	.L2831
.L2830:
	ldr	r1, [r10, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r9, #2144]
	add	r5, r5, #1
	cmp	r5, r3
	bcc	.L2830
.L2831:
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
	b	.L2820
.L2826:
	mov	r0, r6
	ldr	r1, [r4, #16]
	bl	UpdateMaxLTFrmIdx
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2820
.L2825:
	ldr	r3, [r4, #12]
	mov	r1, r8
	ldr	r2, [r4, #4]
	mov	r0, r6
	bl	MarkSTToLTRef
	mov	r0, r6
	bl	UpdateReflist
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2820
.L2824:
	mov	r0, r6
	ldr	r2, [r4, #8]
	mov	r1, r8
	bl	UnMarkLTRef
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2820
.L2823:
	mov	r0, r6
	ldr	r2, [r4, #4]
	mov	r1, r8
	bl	UnMarkSTRef
	mov	r0, r6
	bl	UpdateReflist
	b	.L2820
.L2841:
	ldr	r1, [fp, #-56]
	mov	r3, #0
	ldrb	r2, [r1, #3331]	@ zero_extendqisi2
	str	r3, [r1, #3992]
	cmp	r2, #1
	beq	.L2835
	bcc	.L2836
	cmp	r2, #2
	bne	.L2834
	ldr	r2, [fp, #-56]
	str	r3, [r2, #4016]
	str	r3, [r2, #4004]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #3456]
	str	r3, [r2, #3464]
.L2834:
	mov	r0, r6
	bl	FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2836:
	ldr	r0, [fp, #-56]
	ldr	r1, [r0, #4004]
	ldr	r2, [r0, #4012]
	ldr	r3, [r0, #4016]
	rsb	r2, r1, r2
	str	r2, [r0, #4012]
	rsb	r3, r1, r3
	str	r3, [r0, #4016]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r0, #4008]
	str	r3, [r0, #4004]
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
	b	.L2834
.L2835:
	ldr	r2, [fp, #-56]
	str	r3, [r2, #4012]
	str	r3, [r2, #4004]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #3452]
	str	r3, [r2, #3464]
	b	.L2834
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
	add	r3, r0, #57344
	str	r3, [fp, #-52]
	ldr	r3, [r3, #3988]
	str	r0, [fp, #-48]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2843
	add	r10, r0, #24576
	ldr	r3, [r10, #2140]
	cmp	r3, #0
	beq	.L2863
	ldr	r3, [fp, #-48]
	mov	r9, #0
	mov	r4, r9
	add	r5, r3, #26368
	add	r7, r3, #26624
	add	r7, r7, #20
	add	r6, r3, #61440
	mov	r8, r5
	add	r5, r5, #152
	add	r8, r8, #212
.L2849:
	ldr	r1, [r5]
	mov	r2, #0
	add	r9, r9, #1
	ldr	r0, [r1, #824]
	cmp	r0, #1
	streq	r0, [r6, #1380]
	strb	r4, [r1, #706]
	strb	r4, [r1, #705]
	ldr	r1, [r5]
	strb	r4, [r1, #746]
	strb	r4, [r1, #745]
	ldr	r1, [r5]
	strb	r4, [r1, #786]
	strb	r4, [r1, #785]
	ldr	r1, [r5]
	strb	r4, [r1, #2]
	ldr	r1, [r5]
	ldr	r0, [r6, #2680]
	ldr	r1, [r1, #656]
	bl	FSP_SetRef
	ldr	r2, [r5]
	mov	r3, #1
	strb	r4, [r2, #1]
	ldr	r2, [r5]
	strb	r4, [r2, #4]
	ldr	r2, [r5]
	str	r3, [r2, #676]
	ldr	r1, [r5]
	ldr	r3, [fp, #-48]
	ldr	r2, [r1, #696]
	add	r2, r2, #6656
	add	r2, r2, #26
	add	r2, r3, r2, lsl #2
	str	r4, [r2, #4]
	ldr	r1, [r1, #656]
	ldr	r0, [r6, #2680]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L2848
	ldr	r1, [r5]
	ldr	r0, [r6, #2680]
	ldr	r1, [r1, #656]
	bl	FSP_SetDisplay
.L2848:
	str	r4, [r5], #4
	str	r4, [r8, #4]!
	str	r4, [r7, #4]!
	ldr	r2, [r10, #2140]
	cmp	r2, r9
	bhi	.L2849
.L2850:
	mov	r3, #0
	str	r3, [r10, #2140]
	ldr	r1, [r6, #1368]
	cmp	r1, r3
	beq	.L2846
	ldr	r2, [fp, #-48]
	mov	r0, r3
	add	r2, r2, #62720
	add	r2, r2, #12
.L2853:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2853
.L2846:
	ldr	r4, [fp, #-48]
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #3988]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2864
	ldr	r2, [fp, #-52]
	mov	r0, r3
	str	r3, [r10, #2152]
	strb	r3, [r2, #3332]
	mov	r3, #1
	strb	r3, [r2, #3333]
.L2854:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2864:
	ldr	r1, [fp, #-52]
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r10, #2152]
	strb	r2, [r1, #3332]
	str	r3, [r1, #3996]
	strb	r3, [r1, #3333]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2843:
	bl	FlushDPB
	cmp	r0, #0
	bne	.L2855
	ldr	r3, [fp, #-48]
	add	r10, r3, #24576
	b	.L2846
.L2863:
	add	r6, r0, #61440
	b	.L2850
.L2855:
	mvn	r0, #0
	b	.L2854
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
	add	r4, r0, #57344
	mov	r3, #0
	mov	r5, r0
	str	r3, [r6, #3444]
	ldrb	r3, [r4, #3331]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r6, #3448]
	ldrb	r3, [r4, #3334]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L2866
	ldr	r3, [r4, #4020]
	cmp	r3, #0
	bne	.L2867
	ldr	r3, [r0]
	ldr	r2, [r3, #660]
	cmp	r2, #1
	beq	.L2891
.L2867:
	ldr	r3, [r4, #3988]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #4000]
	beq	.L2892
	cmp	r3, #0
	bne	.L2893
.L2874:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2892:
	cmp	r3, #0
	beq	.L2874
.L2873:
	ldrb	r2, [r4, #3329]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2878
	add	r2, r5, #24576
	ldr	r1, [r6, #456]
	ldr	ip, [r2, #2148]
	ldr	r0, [r2, #2144]
	rsb	r2, ip, r1
	cmp	r0, r2
	beq	.L2894
.L2879:
	mov	r2, #0
	strb	r2, [r4, #3332]
.L2876:
	cmp	r3, #0
	beq	.L2874
.L2878:
	ldrb	r3, [r4, #3332]	@ zero_extendqisi2
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #3333]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2891:
	ldr	r2, [r3, #656]
	cmp	r2, #0
	bne	.L2867
	ldr	r2, [r3, #664]
	cmp	r2, #0
	bne	.L2867
	ldr	r3, [r3, #620]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L2867
.L2866:
	mov	r0, r5
	bl	IDRMemMarking
	cmp	r0, #0
	bne	.L2868
.L2875:
	ldrb	r3, [r4, #3334]	@ zero_extendqisi2
	cmp	r3, #5
	ldreq	r3, [r4, #4000]
	beq	.L2876
	ldr	r3, [r4, #4000]
	cmp	r3, #0
	beq	.L2874
	ldr	r2, [r4, #3988]
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2873
	b	.L2878
.L2893:
	mov	r0, r5
	bl	AdaptiveMemMark
	cmp	r0, #0
	beq	.L2875
.L2868:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2894:
	mov	r0, r5
	bl	SlidingWinMark.part.8
	ldr	r3, [r4, #4000]
	b	.L2879
	UNWIND(.fnend)
	.size	Marking, .-Marking
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
	beq	.L2933
	bl	ClearAllSlice
	add	r6, r7, #26368
	add	r5, r7, #26624
	mov	r8, #0
	mov	r4, r6
	add	r5, r5, #24
	add	r6, r6, #152
	add	r4, r4, #216
	add	r10, r7, #61440
	mov	r9, r8
.L2901:
	ldr	r3, [r6]
	mov	r2, #1
	add	r8, r8, r2
	cmp	r3, #0
	beq	.L2898
	ldr	r1, [r3, #656]
	ldr	r0, [r10, #2680]
	bl	FSP_ClearLogicFs
.L2898:
	ldr	r3, [r4]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2899
	ldr	r1, [r3, #656]
	ldr	r0, [r10, #2680]
	bl	FSP_ClearLogicFs
.L2899:
	ldr	r3, [r5]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2900
	ldr	r1, [r3, #656]
	ldr	r0, [r10, #2680]
	bl	FSP_ClearLogicFs
.L2900:
	cmp	r8, #16
	str	r9, [r5], #4
	mov	r2, #0
	str	r9, [r4], #4
	str	r9, [r6], #4
	bne	.L2901
	add	r3, r7, #16384
	add	r4, r7, #24576
	ldr	r3, [r3, #484]
	str	r2, [r4, #2140]
	sub	r3, r3, #1
	str	r2, [r4, #2144]
	str	r3, [r4, #2136]
	str	r2, [r4, #2148]
	str	r2, [r4, #2152]
	ldr	r1, [r10, #732]
	cmp	r1, r2
	beq	.L2903
	ldr	r3, [r10, #2608]
	cmp	r3, #2
	beq	.L2934
.L2904:
	ldr	r1, [r1, #656]
	mov	r2, #1
	ldr	r0, [r10, #2680]
	bl	FSP_ClearLogicFs
	add	r3, r7, #57344
	ldr	r3, [r3, #3984]
	cmp	r3, #0
	beq	.L2907
	ldr	r2, [r10, #732]
	ldr	r1, [r3, #656]
	ldr	r3, [r2, #656]
	cmp	r3, r1
	beq	.L2907
	mov	r2, #1
	ldr	r0, [r10, #2680]
	bl	FSP_ClearLogicFs
.L2907:
	mov	r3, #0
	str	r3, [r10, #732]
.L2903:
	ldr	r3, .L2936
	add	r0, r7, #26624
	mov	r2, #392
	mov	r1, #0
	add	r0, r0, #108
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r1, [r4, #2136]
	add	r3, r7, #62720
	mov	r0, #0
	str	r0, [r4, #2416]
	mov	r2, r3
	add	r3, r3, #12
	add	r2, r2, #80
	str	r1, [r4, #2412]
	mov	r1, r0
.L2908:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L2908
	add	r2, r7, #26880
	add	r3, r7, #27136
	add	r2, r2, #240
	add	r3, r3, #116
	mov	r0, #0
.L2909:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L2909
	add	r2, r7, #27136
	add	r7, r7, #20480
	add	r2, r2, #248
	mov	r0, r1
	str	r1, [r7, #248]
.L2910:
	str	r0, [r3, #4]!
	cmp	r3, r2
	mov	r1, #0
	bne	.L2910
	mov	r0, r1
	str	r1, [r7, #252]
.L2897:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2934:
	mov	r0, r7
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L2935
.L2905:
	ldr	r1, [r10, #732]
	cmp	r1, #0
	beq	.L2903
	b	.L2904
.L2935:
	str	r0, [sp]
	mov	r3, #2336
	ldr	r2, .L2936+4
	mov	r0, #22
	ldr	r1, .L2936+8
	bl	dprint_vfmw
	b	.L2905
.L2933:
	movw	r3, #2298
	ldr	r2, .L2936+12
	ldr	r1, .L2936+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2897
.L2937:
	.align	2
.L2936:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+280
	.word	.LC357
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	InitDPB, .-InitDPB
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
	mov	r5, r0
	str	r0, [fp, #-48]
	mov	r4, r1
	mov	r0, #22
	ldr	r1, .L2967
	bl	dprint_vfmw
	cmp	r5, #0
	beq	.L2966
	ldr	r5, [fp, #-48]
	mov	r0, r5
	bl	H264_ClearCurrPic
	mov	r0, r5
	bl	ClearAllNal
	mov	r0, r5
	bl	InitDPB
	ldr	r3, [fp, #-48]
	cmp	r4, #0
	add	r9, r3, #61440
	beq	.L2941
	add	r1, r3, #8
	ldr	r0, [r9, #2680]
	bl	FSP_ClearNotInVoQueue
.L2942:
	ldr	r3, [fp, #-48]
	mov	r8, #0
	mov	r6, #0
	mov	r7, #0
	add	r4, r3, #27904
	add	r4, r4, #72
.L2945:
	sub	r5, r4, #32
	mov	r3, #0
	sub	r2, r4, #584
	mov	r1, #1
	mvn	r10, #0
	mov	lr, #17
	mov	ip, #16
	mov	r0, #2
	str	r8, [r4, #-420]
	strb	r3, [r4, #-584]
	strb	r3, [r4, #-583]
	strb	r3, [r4, #-582]
	str	r3, [r4, #84]
	str	r3, [r4, #76]
	str	r3, [r4, #88]
	strb	r3, [r4, #-580]
	strb	r3, [r4, #120]
	str	r10, [r4, #80]
	str	r1, [r4, #92]
	strb	r1, [r4, #160]
	str	lr, [r4, #108]
	str	ip, [r4, #112]
	str	r2, [r4, #236]
	str	r2, [r4, #196]
	str	r2, [r4, #156]
	strb	r0, [r4, #200]
.L2944:
	ldr	r1, [r5, #8]!
	cmp	r1, #0
	beq	.L2943
	ldr	r0, [r9, #2680]
	bl	FreeUsdByDec
	strd	r6, [r5]
.L2943:
	cmp	r5, r4
	bne	.L2944
	add	r8, r8, #1
	add	r4, r5, #832
	cmp	r8, #40
	bne	.L2945
	ldr	r3, [fp, #-48]
	mov	r4, #0
	mov	r5, #0
	add	r6, r3, #61184
	mov	r7, r6
	add	r6, r6, #40
	add	r7, r7, #72
.L2947:
	ldr	r1, [r6, #8]!
	cmp	r1, #0
	beq	.L2946
	ldr	r0, [r9, #2680]
	bl	FreeUsdByDec
	strd	r4, [r6]
.L2946:
	cmp	r6, r7
	bne	.L2947
	ldr	r3, [r9, #1392]
	cmp	r3, #0
	beq	.L2951
	ldr	r3, [fp, #-48]
	mov	r4, #0
	mov	r6, r4
	add	r5, r3, #62720
	add	r5, r5, #112
.L2950:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L2949
	ldr	r0, [r9, #2680]
	bl	FreeUsdByDec
	str	r6, [r5]
.L2949:
	ldr	r3, [r9, #1392]
	cmp	r3, r4
	bhi	.L2950
.L2951:
	ldr	r6, [fp, #-48]
	mov	r4, #0
	ldr	r3, .L2967+4
	mov	r1, r4
	add	r5, r6, #20480
	add	ip, r6, #24576
	str	r4, [r9, #1392]
	movw	r2, #1640
	str	r4, [r9, #2656]
	add	r0, r5, #208
	str	r4, [r9, #1372]
	str	r4, [r9, #2604]
	str	r4, [r9, #2664]
	str	r4, [r9, #2612]
	str	r4, [r9, #1380]
	str	r4, [r9, #2684]
	str	r4, [r9, #1384]
	ldr	r3, [r3, #48]
	str	r4, [r6, #368]
	str	r4, [ip, #1804]
	strb	r4, [r5, #3896]
	strb	r4, [r5, #1892]
	strb	r4, [r5, #3897]
	strb	r4, [r5, #1893]
	blx	r3
	add	r2, r6, #57344
	mov	r0, r4
	mov	r3, #1
	mov	r1, #2
	strb	r3, [r5, #213]
	strb	r1, [r5, #208]
	mov	r3, #256
	strb	r4, [r2, #3328]
	strb	r4, [r9, #704]
	str	r4, [r9, #708]
	str	r3, [r9, #712]
.L2965:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2941:
	add	r0, r3, #8
	bl	ResetVoQueue
	ldr	r0, [r9, #2680]
	bl	FSP_EmptyInstance
	b	.L2942
.L2966:
	ldr	r0, [fp, #-48]
	movw	r3, #2012
	ldr	r2, .L2967+8
	ldr	r1, .L2967+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2965
.L2968:
	.align	2
.L2967:
	.word	.LC358
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	ClearAll, .-ClearAll
	.align	2
	.global	AllocFrameStore
	.type	AllocFrameStore, %function
AllocFrameStore:
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
	add	r3, r0, #20480
	mov	r8, r0
	str	r1, [fp, #-60]
	ldrb	r0, [r3, #209]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2970
	ldrb	r2, [r3, #210]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3034
	add	r2, r8, #12288
	ldr	r1, [r3, #216]
	str	r2, [fp, #-64]
	mov	r0, #2208
	mov	lr, r2
	ldr	r2, [r2, #1304]
	mov	ip, #4000
	add	r9, r8, #61440
	mla	r2, r0, r1, r2
	ldr	r0, [lr, #1300]
	ldr	r1, [r9, #2608]
	cmp	r1, #2
	ldr	r2, [r2, #28]
	mla	r2, ip, r2, r0
	str	r2, [fp, #-56]
	beq	.L3035
	add	r6, r8, #57344
	mov	r2, #0
	strb	r2, [r6, #3329]
	ldrb	r2, [r9, #704]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r2, #2
	str	r2, [fp, #-52]
	bne	.L3000
.L2996:
	ldr	r1, [r9, #712]
	ldr	r2, [r3, #224]
	cmp	r1, r2
	bne	.L3000
	ldr	r2, [r3, #236]
	cmp	r2, #0
	ldr	r2, [r9, #708]
	beq	.L3036
	cmp	r2, #0
	beq	.L3000
.L2976:
	ldr	r2, [r9, #2692]
	ldr	r1, [r9, #2688]
	rsb	r2, r1, r2
	cmp	r2, #2
	bhi	.L3000
	ldr	r0, [r6, #3984]
	mov	r2, #1
	strb	r2, [r6, #3329]
	cmp	r0, #0
	beq	.L2978
	ldr	r2, [fp, #-52]
	cmp	r2, #2
	beq	.L3037
	ldr	r2, [fp, #-52]
	cmp	r2, #1
	beq	.L3038
.L3003:
	mov	ip, #0
	b	.L2982
.L2970:
	add	r2, r8, #12288
	ldr	r1, [r3, #216]
	str	r2, [fp, #-64]
	mov	lr, #2208
	mov	r4, r2
	ldr	r2, [r2, #1304]
	mov	ip, #4000
	add	r9, r8, #61440
	mla	r2, lr, r1, r2
	ldr	r1, [r4, #1300]
	ldr	lr, [r9, #2608]
	cmp	lr, #2
	streq	r0, [fp, #-52]
	ldr	r2, [r2, #28]
	mla	r2, ip, r2, r1
	str	r2, [fp, #-56]
	beq	.L2997
	add	r6, r8, #57344
	str	r0, [fp, #-52]
	strb	r0, [r6, #3329]
.L3000:
	mov	lr, #0
	strb	lr, [r6, #3328]
	ldr	r7, [r9, #1364]
	cmp	r7, lr
	addne	r5, r8, #26368
	addne	r4, r8, #27392
	addne	r5, r5, #152
	addne	r10, r8, #24576
	beq	.L2990
.L2989:
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2985
	cmp	r4, #0
	beq	.L2986
	ldr	r0, [r10, #2140]
	cmp	r0, #0
	beq	.L2986
	ldr	r1, [r10, #1944]
	cmp	r1, r4
	beq	.L2985
	mov	r1, r5
	b	.L2987
.L2988:
	ldr	ip, [r1, #4]!
	cmp	ip, r4
	beq	.L2985
.L2987:
	add	r2, r2, #1
	cmp	r2, r0
	bne	.L2988
.L2986:
	mov	r5, #832
	movw	r0, #28080
	mla	r5, r5, lr, r8
	mov	r7, #0
	mov	r10, #1
	str	r4, [r6, #3984]
	strb	r10, [r6, #3328]
	mov	ip, #101
	add	r1, r5, #27392
	mov	r2, #640
	add	r1, r1, #16
	str	r3, [fp, #-48]
	str	r7, [r5, r0]
	add	r5, r5, #27392
	add	r0, r6, #3344
	str	ip, [r6, #4028]
	bl	memcpy
	str	r7, [r6, #3496]
	strb	r7, [r5, #3]
	str	r7, [r4, #676]
	ldr	r2, [r6, #3984]
	ldr	r3, [fp, #-48]
	strb	r7, [r2, #2]
	ldr	r2, [r6, #3984]
	strb	r10, [r2, #4]
	ldr	r2, [r6, #3984]
	str	r7, [r2, #824]
	ldrb	r10, [r6, #3328]	@ zero_extendqisi2
	cmp	r10, #1
	bne	.L2990
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-60]
	ldr	r0, [r9, #2680]
	clz	r1, r3
	mov	r1, r1, lsr #5
	bl	FSP_NewLogicFs
	mov	r5, r0
	mov	r1, r0
	ldr	r0, [r9, #2680]
	bl	FSP_GetLogicFs
	mvn	r2, r5
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r4, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L2991
	ldr	r3, [fp, #-56]
	ldrb	r2, [r3, #3296]	@ zero_extendqisi2
	strb	r2, [r0, #480]
	ldr	r2, [r3, #3324]
	strb	r2, [r0, #481]
	ldr	r2, [r3, #3332]
	strb	r2, [r0, #482]
	ldr	r2, [r3, #3328]
	ldr	r3, [fp, #-48]
	str	r2, [r0, #484]
	ldr	r2, [r8]
	ldr	r2, [r2, #28]
	cmp	r2, #25
	beq	.L3039
.L2992:
	ldr	r7, .L3042
	mov	r2, #640
	ldr	r0, [r6, #3984]
	add	r1, r4, #40
	str	r3, [fp, #-48]
	ldr	r10, [r7, #52]
	add	r0, r0, #16
	blx	r10
	ldr	r1, [r6, #3984]
	add	r0, r8, #60672
	mov	r2, #640
	ldr	r7, [r7, #52]
	add	r0, r0, #16
	add	r1, r1, #16
	blx	r7
	ldr	r2, [r6, #3984]
	ldr	r3, [fp, #-48]
	mov	ip, r5
	str	r5, [r2, #656]
	ldrsb	r2, [r4, #4]
	ldr	r0, [r6, #3984]
	str	r2, [r6, #4052]
.L2982:
	ldrb	r1, [fp, #-52]	@ zero_extendqisi2
	strb	r1, [r6, #3331]
	ldrb	r2, [r3, #209]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	strb	r2, [r0, #704]
	ldrb	r2, [r6, #3329]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3040
	ldr	r2, [fp, #-52]
	strb	r1, [r9, #704]
	ldr	r1, [r3, #224]
	cmp	r2, #0
	ldr	r2, [r9, #2692]
	ldreq	r0, [fp, #-52]
	movne	r0, #0
	str	r1, [r9, #712]
	ldr	r3, [r3, #236]
	str	ip, [r9, #724]
	str	r2, [r9, #720]
	str	r3, [r9, #708]
	movne	r3, #1
	moveq	r3, r0
	strb	r3, [r9, #705]
.L3025:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2985:
	add	lr, lr, #1
	add	r4, r4, #832
	cmp	lr, r7
	bne	.L2989
.L2990:
	ldr	r1, .L3042+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r8
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3034:
	add	r1, r8, #12288
	ldr	r0, [r3, #216]
	str	r1, [fp, #-64]
	mov	lr, #2208
	mov	r4, r1
	ldr	r1, [r1, #1304]
	mov	ip, #4000
	add	r9, r8, #61440
	mla	r1, lr, r0, r1
	ldr	r0, [r4, #1300]
	ldr	lr, [r9, #2608]
	cmp	lr, #2
	ldr	r1, [r1, #28]
	mla	r1, ip, r1, r0
	str	r1, [fp, #-56]
	beq	.L3041
	add	r6, r8, #57344
	strb	r2, [r6, #3329]
	ldrb	r2, [r9, #704]	@ zero_extendqisi2
	cmp	r2, #2
	mov	r2, #1
	str	r2, [fp, #-52]
	bne	.L3000
	b	.L2996
.L3041:
	mov	r2, #1
	str	r2, [fp, #-52]
.L2997:
	add	r6, r8, #57344
	mov	r2, #0
	strb	r2, [r6, #3329]
	b	.L3000
.L3035:
	str	r1, [fp, #-52]
	b	.L2997
.L3039:
	ldr	r3, [fp, #-64]
	ldr	r10, [r0, #152]
	ldr	r2, [r3, #1280]
	ldr	r1, [r3, #1276]
	str	r7, [r0, #280]
	mov	r2, r2, asl #4
	str	r2, [r0, #112]
	mov	r1, r1, asl #4
	str	r7, [r0, #284]
	mul	r10, r10, r2
	ldr	r2, [r0, #76]
	str	r1, [r0, #108]
	str	r7, [r0, #288]
	add	r2, r10, r2
	str	r7, [r0, #292]
	str	r7, [r0, #296]
	mov	r0, r2
	str	r2, [r4, #80]
	bl	MEM_Phy2Vir
	ldr	r1, [r4, #60]
	ldr	r2, [r4, #156]
	add	r10, r10, r1
	str	r7, [r4, #556]
	str	r10, [r4, #64]
	add	r10, r10, r2
	ldr	r3, [fp, #-48]
	str	r10, [r4, #72]
	str	r0, [r4, #552]
	b	.L2992
.L3040:
	mov	r2, #0
	strb	r2, [r9, #704]
	ldr	lr, [r3, #224]
	mov	r0, r2
	ldr	r1, [r9, #2692]
	str	lr, [r9, #712]
	ldr	r3, [r3, #236]
	strb	r2, [r9, #705]
	str	ip, [r9, #724]
	str	r3, [r9, #708]
	str	r1, [r9, #720]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3036:
	cmp	r2, #0
	beq	.L2976
	b	.L3000
.L2991:
	ldr	r3, [r6, #3984]
	mov	r0, r2
	strb	r2, [r6, #3328]
	ldr	r1, .L3042+8
	strb	r2, [r3, #4]
	bl	dprint_vfmw
	mov	r1, r10
	mov	r0, r8
	bl	ClearAll
	mvn	r0, #0
	b	.L3025
.L3038:
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L2981
.L3029:
	mov	r2, #0
	strb	r2, [r6, #3329]
	b	.L3000
.L3037:
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L3029
.L2981:
	ldr	r0, [r6, #3984]
	cmp	r0, #0
	bne	.L3003
	b	.L3000
.L2978:
	strb	r0, [r6, #3329]
	b	.L3000
.L3043:
	.align	2
.L3042:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC359
	.word	.LC360
	UNWIND(.fnend)
	.size	AllocFrameStore, .-AllocFrameStore
	.align	2
	.global	H264DEC_Init
	.type	H264DEC_Init, %function
H264DEC_Init:
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
	subs	r5, r0, #0
	mov	r7, r1
	beq	.L3056
	cmp	r1, #0
	beq	.L3057
	ldr	r8, .L3061
	movw	r2, #64176
	ldr	r4, [r5, #352]
	mov	r1, #0
	ldr	r3, [r8, #48]
	blx	r3
	str	r4, [r5, #352]
	add	r0, r5, #8
	bl	ResetVoQueue
	mov	r3, #0
	str	r7, [r5]
	str	r3, [r5, #360]
	str	r3, [r5, #364]
	ldr	r3, [r7, #28]
	cmp	r3, #25
	beq	.L3058
	add	r6, r5, #12288
	mov	r1, #32
	mov	r2, #256
	mov	r3, #136
	str	r1, [r6, #1288]
	str	r2, [r6, #1292]
	str	r3, [r6, #1284]
.L3049:
	ldr	r0, [r7, #592]
	add	r4, r5, #61440
	bl	MEM_Phy2Vir
	ldr	lr, [r6, #1288]
	ldr	r3, [r5]
	mov	r2, #4000
	ldr	r1, [r6, #1292]
	mul	r2, r2, lr
	ldr	r3, [r3, #588]
	add	r3, r0, r3
	mov	r0, #2208
	add	ip, r3, r2
	str	r3, [r6, #1300]
	cmp	r3, #0
	cmpne	ip, #0
	str	ip, [r6, #1304]
	mla	r0, r0, r1, ip
	moveq	r9, #1
	movne	r9, #0
	cmp	r0, #0
	orreq	r9, r9, #1
	cmp	r9, #0
	str	r0, [r4, #2600]
	bne	.L3059
	ldr	r7, [r7, #624]
	mov	r10, r7
	adds	r7, r3, #0
	movne	r7, #1
	cmp	r10, #0
	movne	r7, #0
	cmp	ip, #0
	moveq	ip, #0
	andne	ip, r7, #1
	cmp	ip, #0
	beq	.L3051
	mov	r0, r3
	mov	r1, r9
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r2, [r6, #1292]
	mov	ip, #2208
	mov	r1, r9
	ldr	r3, [r8, #48]
	ldr	r0, [r6, #1304]
	mul	r2, ip, r2
	blx	r3
	ldr	r1, [r6, #1292]
	ldr	lr, [r6, #1288]
	ldr	r0, [r4, #2600]
.L3051:
	add	ip, r5, #16384
	movw	r7, #4060
	ldr	r3, [r8, #48]
	str	r1, [ip, #1236]
	mov	r1, #0
	ldr	r2, [r6, #1284]
	str	lr, [r6, #1344]
	mov	r6, r1
	mul	r2, r7, r2
	blx	r3
	mov	r2, #40
	mov	r3, #17
	str	r6, [r4, #2624]
	str	r6, [r4, #2628]
	mov	r0, r5
	str	r6, [r4, #2632]
	str	r6, [r4, #2636]
	str	r6, [r4, #2640]
	str	r6, [r4, #2644]
	str	r6, [r4, #2648]
	str	r6, [r4, #2652]
	str	r6, [r4, #2616]
	str	r6, [r4, #1392]
	str	r6, [r4, #1396]
	str	r6, [r4, #1400]
	str	r6, [r4, #1404]
	str	r6, [r4, #1408]
	str	r6, [r4, #1372]
	str	r6, [r4, #1380]
	str	r6, [r4, #2684]
	str	r6, [r4, #1384]
	str	r6, [r4, #1388]
	str	r2, [r4, #1364]
	str	r3, [r4, #1368]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #2680]
	beq	.L3060
	mov	r1, r6
	mov	r0, r5
	bl	ClearAll
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3058:
	ldr	r3, [r7, #708]
	add	r6, r5, #12288
	str	r3, [r6, #1288]
	ldr	r3, [r7, #712]
	str	r3, [r6, #1292]
	ldr	r3, [r7, #700]
	str	r3, [r6, #1284]
	b	.L3049
.L3059:
	movw	r3, #12404
	ldr	r2, .L3061+4
	ldr	r1, .L3061+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3060:
	mov	r0, r6
	ldr	r1, .L3061+12
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3057:
	mov	r0, r1
	movw	r3, #12370
	ldr	r2, .L3061+16
	ldr	r1, .L3061+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3056:
	movw	r3, #12369
	ldr	r2, .L3061+16
	ldr	r1, .L3061+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3062:
	.align	2
.L3061:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+288
	.word	.LC361
	.word	.LC362
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264DEC_Init, .-H264DEC_Init
	.align	2
	.global	ClearDPB
	.type	ClearDPB, %function
ClearDPB:
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
	bl	FlushDPB
	subs	r3, r0, #0
	beq	.L3064
	movw	r2, #2428
	ldr	r1, .L3068
	mov	r0, #0
	bl	dprint_vfmw
.L3064:
	mov	r0, r4
	add	r4, r4, #61440
	bl	InitDPB
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #1380]
	str	r3, [r4, #2684]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3069:
	.align	2
.L3068:
	.word	.LC363
	UNWIND(.fnend)
	.size	ClearDPB, .-ClearDPB
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r1, #15
	mov	r5, r1
	str	r0, [fp, #-48]
	mov	r4, r2
	bhi	.L3166
	ldrb	r8, [r2, #3]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L3074
	bcc	.L3075
	cmp	r8, #2
	bne	.L3167
	ldr	r3, [r2, #656]
	mov	r2, #3
	strb	r2, [r3, #704]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3095
	ldr	r2, [fp, #-48]
	add	r7, r2, r3
	add	r2, r7, #24576
	str	r2, [fp, #-60]
	ldr	r2, [r2, #1944]
	cmp	r2, #0
	beq	.L3095
	ldr	r0, [fp, #-60]
	strb	r8, [r2, #784]
	ldr	r2, [r4, #656]
	ldr	r3, [r0, #1944]
	str	r2, [r3, #820]
	ldr	r3, [r0, #1944]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #785]
	ldr	r3, [r0, #1944]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #786]
	ldr	r3, [r0, #1944]
	ldr	r2, [r4, #688]
	str	r2, [r3, #796]
	ldr	r3, [r0, #1944]
	ldr	r2, [r4, #692]
	str	r2, [r3, #804]
	ldr	r2, [r4, #656]
	ldr	r3, [r0, #1944]
	ldr	r2, [r2, #816]
	str	r2, [r3, #816]
	ldr	r3, [r0, #1944]
	ldr	r2, [r4, #700]
	str	r2, [r3, #800]
	ldr	r3, [r0, #1944]
	ldr	r1, [r3, #760]
	ldr	r2, [r3, #800]
	add	r2, r2, r1
	str	r2, [r3, #720]
	str	r2, [r3, #688]
	add	r1, r4, #16
	ldr	r2, [r0, #1944]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #1944]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #1944]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #3]
	mov	r2, #640
	ldr	r3, [fp, #-60]
	ldr	ip, [r3, #1944]
	add	r8, ip, #608
	add	lr, ip, #624
	ldr	r3, [ip, #16]
	add	r0, ip, #16
	ldrd	r6, [r8, #-8]
	ldrd	r8, [r8]
	str	r3, [fp, #-52]
	ldr	r10, [ip, #20]
	strd	r8, [fp, #-68]
	ldrd	r8, [lr, #-8]
	strd	r8, [fp, #-76]
	ldr	r9, [ip, #24]
	ldr	r8, [ip, #28]
	bl	memcpy
	mvn	r1, #0
	cmp	r7, r1
	mvn	r0, #0
	cmpeq	r6, r0
	ldr	r3, [fp, #-52]
	ldrne	r2, [fp, #-60]
	ldrne	r2, [r2, #1944]
	addne	r2, r2, #608
	strned	r6, [r2, #-8]
.L3104:
	add	r1, r4, #608
	ldr	r2, [fp, #-60]
	ldrd	r6, [fp, #-68]
	add	ip, r4, #624
	ldrd	r0, [r1]
	ldr	r2, [r2, #1944]
	cmp	r1, r7
	cmpeq	r0, r6
	add	r2, r2, #608
	movhi	r0, r6
	movhi	r1, r7
	strd	r0, [r2]
	ldr	r2, [fp, #-60]
	ldrd	r0, [ip, #-8]
	ldrd	r6, [fp, #-76]
	ldr	r2, [r2, #1944]
	cmp	r1, r7
	cmpeq	r0, r6
	add	r2, r2, #624
	movhi	r0, r6
	movhi	r1, r7
	strd	r0, [r2, #-8]
	ldr	r0, [fp, #-60]
	ldr	r2, [r4, #16]
	ldr	r1, [r0, #1944]
	cmp	r2, r3
	movcs	r2, r3
	str	r2, [r1, #16]
	ldr	r3, [r4, #20]
	ldr	r2, [r0, #1944]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #20]
	ldr	r3, [r4, #24]
	ldr	r2, [r0, #1944]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #24]
	ldr	r3, [r4, #28]
	ldr	r2, [r0, #1944]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #28]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3107
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3107
.L3108:
	ldr	r0, [fp, #-60]
	ldr	r2, [r0, #1944]
	ldr	r3, [r2, #804]
	ldr	r1, [r2, #764]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #684]
	ldr	r2, [r4, #676]
	mov	r4, r0
	ldr	r3, [r0, #1944]
	str	r2, [r3, #672]
	ldr	r0, [r0, #1944]
	bl	CombineFldsToFrm
	ldr	r2, [r4, #1944]
	ldr	r1, [fp, #-48]
	ldr	r3, [r2, #696]
	ldr	r2, [r2, #796]
	add	r3, r3, #6720
	add	r3, r3, #10
	add	r3, r1, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3094
.L3075:
	ldr	r3, [fp, #-48]
	ldr	r2, [r2, #656]
	add	r7, r3, r1, lsl #2
	mov	r3, #3
	add	r7, r7, #24576
	str	r2, [r7, #1944]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2]
	ldr	r2, [r7, #1944]
	strb	r3, [r2, #1]
	ldr	r1, [r4, #656]
	ldr	r2, [r7, #1944]
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	strb	r1, [r2, #4]
	ldr	r1, [r4, #656]
	ldr	r2, [r7, #1944]
	ldr	r1, [r1, #676]
	str	r1, [r2, #676]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r7, #1944]
	cmp	r1, #0
	beq	.L3168
.L3077:
	strb	r3, [r2, #2]
	add	r1, r4, #16
	ldr	r3, [r7, #1944]
	mov	r2, #640
	ldr	r0, [r4, #724]
	mov	r9, #0
	str	r0, [r3, #692]
	ldr	r0, [r7, #1944]
	add	r0, r0, #16
	bl	memcpy
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #700]
	mov	lr, #1
	mov	ip, #2
	str	r2, [r3, #720]
	str	r2, [r3, #688]
	mov	r2, r9
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #656]
	str	r1, [r3, #820]
	str	r1, [r3, #780]
	str	r1, [r3, #740]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #668]
	str	r1, [r3, #668]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #664]
	str	r1, [r3, #660]
	ldr	r3, [r7, #1944]
	strb	r9, [r3, #704]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #705]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #706]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #692]
	str	r1, [r3, #724]
	str	r1, [r3, #684]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	str	r1, [r3, #680]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #676]
	str	r1, [r3, #672]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #680]
	ldr	r0, [fp, #-48]
	str	r1, [r3, #716]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #684]
	str	r1, [r3, #756]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #688]
	str	r1, [r3, #796]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, lr
	ldr	r3, [r7, #1944]
	moveq	r8, #3
	strb	r8, [r3, #3]
	ldr	r1, [r4, #656]
	ldr	r3, [r7, #1944]
	ldr	r1, [r1, #736]
	str	r1, [r3, #736]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r3, #705]	@ zero_extendqisi2
	ldrb	r7, [r3, #706]	@ zero_extendqisi2
	strb	lr, [r3, #744]
	strb	ip, [r3, #784]
	ldr	lr, [r3, #720]
	ldr	ip, [r3, #724]
	strb	r1, [r3, #745]
	strb	r1, [r3, #785]
	ldr	r1, [r3, #740]
	strb	r7, [r3, #746]
	strb	r7, [r3, #786]
	str	lr, [r3, #760]
	str	lr, [r3, #800]
	str	ip, [r3, #764]
	str	r1, [r3, #780]
	str	ip, [r3, #804]
	str	r1, [r3, #820]
	ldr	r1, [r4, #656]
	bl	GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2631
	movne	r0, r9
	bne	.L3164
.L3094:
	ldr	r1, [fp, #-48]
	add	r5, r5, #6592
	add	r5, r5, #38
	mov	r2, #1
	add	r3, r1, #61440
	ldr	r0, [r3, #2680]
	ldr	r3, [r1, r5, asl #2]
	ldr	r1, [r3, #656]
	bl	FSP_SetRef
	mov	r0, #0
.L3072:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3167:
	mov	r2, r8
	ldr	r1, .L3169
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r0, [fp, #-48]
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3074:
	ldr	r3, [r2, #656]
	mov	r2, #3
	strb	r2, [r3, #704]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3080
	ldr	r2, [fp, #-48]
	add	r7, r2, r3
	add	r7, r7, #24576
	ldr	r2, [r7, #1944]
	cmp	r2, #0
	beq	.L3080
	strb	r8, [r2, #744]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #692]
	str	r2, [r3, #764]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #745]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #746]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #684]
	str	r2, [r3, #756]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #692]
	str	r2, [r3, #764]
	ldr	r2, [r4, #656]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #776]
	str	r2, [r3, #776]
	ldr	r3, [r7, #1944]
	ldr	r2, [r4, #700]
	str	r2, [r3, #760]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #760]
	ldr	r2, [r3, #800]
	add	r2, r2, r1
	str	r2, [r3, #720]
	str	r2, [r3, #688]
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
	mov	r2, #640
	ldr	ip, [r7, #1944]
	add	r8, ip, #608
	add	lr, ip, #624
	ldr	r3, [ip, #16]
	add	r0, ip, #16
	ldrd	r8, [r8]
	ldr	r6, [ip, #600]
	str	r3, [fp, #-84]
	ldr	r3, [ip, #604]
	strd	r8, [fp, #-60]
	ldrd	r8, [lr, #-8]
	str	r3, [fp, #-80]
	ldr	r3, [ip, #24]
	ldr	r10, [ip, #20]
	strd	r8, [fp, #-68]
	str	r3, [fp, #-76]
	ldr	r3, [ip, #28]
	str	r3, [fp, #-52]
	bl	memcpy
	add	r2, r4, #608
	mov	lr, r6
	ldr	r6, [fp, #-80]
	ldmdb	r2, {r0, ip}
	and	r1, lr, r6
	ldrd	r8, [fp, #-60]
	adds	r1, r1, #1
	and	r0, r0, ip
	add	ip, r4, #624
	ldr	r3, [fp, #-84]
	movne	r1, #1
	cmn	r0, #1
	movne	r1, #0
	cmp	r1, #0
	ldrne	r1, [r7, #1944]
	strne	lr, [r1, #600]
	strne	r6, [r1, #604]
	ldrd	r0, [r2]
	ldr	r2, [r7, #1944]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r2, r2, #608
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-68]
	strd	r0, [r2]
	ldrd	r0, [ip, #-8]
	ldr	r2, [r7, #1944]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r2, r2, #624
	movhi	r1, r9
	movhi	r0, r8
	strd	r0, [r2, #-8]
	ldr	r2, [r4, #16]
	ldr	r1, [r7, #1944]
	cmp	r2, r3
	movcs	r2, r3
	str	r2, [r1, #16]
	ldr	r3, [r4, #20]
	ldr	r2, [r7, #1944]
	cmp	r3, r10
	ldr	r1, [fp, #-76]
	movcs	r3, r10
	str	r3, [r2, #20]
	ldr	r3, [r4, #24]
	ldr	r2, [r7, #1944]
	cmp	r3, r1
	movcs	r3, r1
	ldr	r1, [fp, #-52]
	str	r3, [r2, #24]
	ldr	r3, [r4, #28]
	ldr	r2, [r7, #1944]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #28]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3091
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3091
.L3092:
	ldr	r2, [r7, #1944]
	ldr	r3, [r2, #804]
	ldr	r1, [r2, #764]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #684]
	ldr	r2, [r4, #676]
	ldr	r3, [r7, #1944]
	str	r2, [r3, #672]
	ldr	r0, [r7, #1944]
	bl	CombineFldsToFrm
	ldr	r2, [r7, #1944]
	ldr	r1, [fp, #-48]
	ldr	r3, [r2, #696]
	ldr	r2, [r2, #756]
	add	r3, r3, #6656
	add	r3, r3, #58
	add	r3, r1, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3094
.L3080:
	ldr	r2, [fp, #-48]
	add	r7, r2, r3
	ldr	r3, [r4, #656]
	add	r7, r7, #24576
	mov	r2, #1
	str	r3, [r7, #1944]
	strb	r2, [r3, #744]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #656]
	str	r1, [r3, #780]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #745]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #746]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #684]
	str	r1, [r3, #756]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #692]
	str	r1, [r3, #764]
	ldr	r1, [r4, #656]
	ldr	r3, [r7, #1944]
	ldr	r1, [r1, #776]
	str	r1, [r3, #776]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #700]
	str	r1, [r3, #760]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #760]
	str	r1, [r3, #720]
	str	r1, [r3, #688]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #1944]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #656]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #656]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #676]
	str	r2, [r3, #676]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3082
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3082
.L3083:
	ldr	r3, [r7, #1944]
	mov	r8, #0
	mov	r2, #640
	add	r1, r4, #16
	str	r8, [r3, #680]
	ldr	r0, [r7, #1944]
	add	r0, r0, #16
	bl	memcpy
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #724]
	mov	r2, #1
	ldr	r0, [fp, #-48]
	str	r1, [r3, #692]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #664]
	str	r1, [r3, #660]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #676]
	str	r1, [r3, #672]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #692]
	str	r1, [r3, #684]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	ldr	r1, [r7, #1944]
	rsb	r3, r2, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r1, #3]
	ldr	r1, [r4, #656]
	bl	GetAPC
	cmp	r0, #0
	beq	.L3094
	mov	r3, r0
	movw	r2, #2686
	mov	r0, r8
.L3164:
	ldr	r1, .L3169+4
	bl	dprint_vfmw
	ldr	r0, [fp, #-48]
	bl	ClearDPB
	mvn	r0, #0
	b	.L3072
.L3095:
	ldr	r2, [fp, #-48]
	add	r7, r2, r3
	ldr	r3, [r4, #656]
	add	r7, r7, #24576
	mov	r2, #2
	str	r3, [r7, #1944]
	strb	r2, [r3, #784]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #656]
	str	r1, [r3, #820]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #785]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #786]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #688]
	str	r1, [r3, #796]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #692]
	str	r1, [r3, #804]
	ldr	r1, [r4, #656]
	ldr	r3, [r7, #1944]
	ldr	r1, [r1, #816]
	str	r1, [r3, #816]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #700]
	str	r1, [r3, #800]
	ldr	r3, [r7, #1944]
	ldr	r1, [r3, #760]
	str	r1, [r3, #720]
	str	r1, [r3, #688]
	ldr	r3, [r7, #1944]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #1944]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #656]
	ldr	r3, [r7, #1944]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #656]
	ldr	r3, [r7, #1944]
	ldr	r2, [r2, #676]
	str	r2, [r3, #676]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3097
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3097
.L3098:
	ldr	r3, [r7, #1944]
	mov	r9, #0
	mov	r2, #640
	add	r1, r4, #16
	str	r9, [r3, #680]
	ldr	r0, [r7, #1944]
	add	r0, r0, #16
	bl	memcpy
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #724]
	mov	r2, #2
	ldr	r0, [fp, #-48]
	str	r1, [r3, #692]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #664]
	str	r1, [r3, #660]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #676]
	str	r1, [r3, #672]
	ldr	r3, [r7, #1944]
	ldr	r1, [r4, #692]
	str	r1, [r3, #804]
	str	r1, [r3, #684]
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	r3, [r7, #1944]
	cmp	r1, #1
	moveq	r8, r2
	movne	r8, r9
	strb	r8, [r3, #3]
	ldr	r1, [r4, #656]
	bl	GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2809
	movne	r0, r9
	beq	.L3094
	b	.L3164
.L3168:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3077
.L3082:
	ldr	r3, [r7, #1944]
	mov	r2, #1
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #668]
	b	.L3083
.L3097:
	ldr	r3, [r7, #1944]
	mov	r2, #2
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #668]
	b	.L3098
.L3107:
	ldr	r1, [fp, #-60]
	ldr	r2, [r1, #1944]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r3, r1
	ldreq	r2, [r4, #668]
	ldreq	r3, [r3, #1944]
	streq	r2, [r3, #668]
	b	.L3108
.L3091:
	ldr	r2, [r7, #1944]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1944]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #668]
	b	.L3092
.L3166:
	mov	r3, r1
	mov	r2, #2592
	ldr	r1, .L3169+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3072
.L3170:
	.align	2
.L3169:
	.word	.LC366
	.word	.LC365
	.word	.LC364
	UNWIND(.fnend)
	.size	InsertFrmInDPB, .-InsertFrmInDPB
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r7, r0, #0
	beq	.L3266
	add	r6, r7, #57344
	add	r4, r7, #61440
	ldrb	r3, [r6, #3331]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3267
.L3174:
	ldr	r3, [r4, #2704]
	ldr	r2, [r4, #2708]
	add	r3, r3, #1
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #2704]
	ldr	r1, [r7]
	rsb	r3, r2, r3
	str	r3, [r1, #584]
.L3175:
	ldr	r5, [r4, #2668]
	ldr	r3, [r4, #2608]
	ubfx	r5, r5, #16, #3
	cmp	r3, r5
	beq	.L3176
	subs	r2, r5, #2
	sub	r3, r3, #2
	movne	r2, #1
	cmp	r3, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L3176
	cmp	r5, #4
	cmpne	r5, #1
	bls	.L3268
.L3176:
	cmp	r5, #2
	str	r5, [r4, #2608]
	beq	.L3178
	cmp	r5, #3
	beq	.L3179
	cmp	r5, #1
	beq	.L3269
	ldr	r3, [r4, #2604]
	cmp	r3, #0
	beq	.L3182
	cmp	r5, #4
	ldr	r3, [r6, #4020]
	beq	.L3270
.L3189:
	cmp	r3, #2
	beq	.L3206
.L3193:
	cmp	r3, #1
	streq	r3, [r4, #1384]
.L3195:
	ldr	r2, [r4, #2644]
	mov	r0, #2
	ldrb	r3, [r6, #3331]	@ zero_extendqisi2
	sub	r2, r2, #1
	ldr	r1, .L3275
	bl	dprint_vfmw
	ldr	r0, [r6, #4044]
	ldr	r1, [r4, #2644]
	mov	r3, #1
	ldr	r2, [r4, #2604]
	str	r0, [r4, #2156]
	cmp	r1, #0
	strb	r3, [r4, #1418]
	ldr	r3, [r6, #4048]
	str	r2, [r4, #2356]
	str	r3, [r4, #2152]
	beq	.L3197
	ldr	r1, [r6, #4020]
	cmp	r1, #0
	beq	.L3271
	add	r3, r7, #24576
	ldr	r3, [r3, #2140]
	cmp	r3, #0
	bne	.L3199
	ldr	r2, [r7]
	ldr	r1, [r2, #24]
	cmp	r1, #2
	bne	.L3272
.L3202:
	add	r3, r7, #62720
	add	r3, r3, #136
	str	r3, [r7, #360]
	ldr	r1, [r2, #944]
	cmp	r1, #1
	beq	.L3273
	cmp	r1, #2
	bne	.L3205
	ldr	r1, [r2, #948]
	cmp	r3, #0
	cmpne	r1, #0
	ble	.L3205
	ldr	r3, [r6, #4020]
	cmp	r3, #2
	bne	.L3205
	mov	r2, #0
	str	r2, [r7, #360]
	ldr	r3, [r6, #3984]
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
	ldr	r2, [r7]
	mov	r0, r7
	ldr	r3, [r2, #948]
	sub	r3, r3, #1
	str	r3, [r2, #948]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3258
.L3267:
	ldrb	r3, [r6, #3329]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3175
	b	.L3174
.L3268:
	mov	r2, r5
	ldr	r1, .L3275+4
	mov	r0, #2
	bl	dprint_vfmw
	str	r5, [r4, #2608]
.L3179:
	mov	r0, r7
	bl	H264_ClearCurrPic
	mov	r0, r7
	bl	ClearDPB
	mvn	r0, #0
.L3258:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3197:
	ldr	r2, [r7]
.L3205:
	ldr	r3, [r2, #600]
	mov	r0, #0
	strb	r3, [r4, #1420]
	ldr	r3, [r2, #608]
	str	r3, [r4, #1424]
	ldr	r3, [r2, #612]
	str	r3, [r4, #1428]
	ldr	r3, [r2, #604]
	strb	r3, [r4, #1421]
	ldr	r3, [r2, #652]
	strb	r3, [r4, #1432]
	ldr	ip, [r6, #4060]
	ldr	r1, [r6, #3984]
	ldr	r3, [r6, #4056]
	str	ip, [r6, #4056]
	ldr	r2, [r1, #256]
	rsb	r3, ip, r3
	add	r2, r2, r3
	str	r2, [r1, #256]
	ldr	r2, [r6, #3584]
	add	r3, r3, r2
	str	r3, [r6, #3584]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3178:
	ldr	r5, [r6, #4020]
	cmp	r5, #0
	bne	.L3185
	ldr	r3, [r4, #2604]
	cmp	r3, #0
	beq	.L3182
	ldr	r3, [r4, #2600]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L3195
	mov	r3, #1
	mov	r0, r7
	strb	r3, [r6, #3335]
	bl	H264_ClearCurrPic
	mov	r0, r5
	ldr	r1, .L3275+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3258
.L3269:
	ldr	r3, [r6, #4020]
	cmp	r3, #2
	beq	.L3274
	ldr	r2, [r4, #2604]
	cmp	r2, #0
	bne	.L3193
.L3182:
	mov	r0, r7
	bl	H264_ClearCurrPic
	ldr	r3, .L3275+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3262
	mov	r3, #0
	ldr	r0, [r4, #2680]
	mov	r2, r3
	mov	r1, #127
	blx	r5
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3271:
	ldr	r3, .L3275+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3199
	ldr	r2, [r4, #2360]
	cmp	r2, #0
	beq	.L3200
.L3201:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3201
.L3200:
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #2680]
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	r5
	ldr	r2, [r7]
	b	.L3202
.L3274:
	ldr	r3, [r6, #4000]
	cmp	r3, #0
	beq	.L3185
	ldr	r3, [r4, #2604]
	cmp	r3, #0
	beq	.L3182
.L3206:
	ldr	r3, [r4, #1384]
	cmp	r3, #2
	bne	.L3195
	ldr	r3, [r7]
	ldr	r5, [r3, #24]
	cmp	r5, #0
	bne	.L3195
	ldr	r3, .L3275+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3195
	ldr	r3, [r6, #4000]
	mov	r0, #1
	ldr	r2, [r6, #4004]
	ldr	r1, .L3275+20
	bl	dprint_vfmw
	mov	r0, r7
	bl	H264_ClearCurrPic
	ldr	r3, .L3275+12
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L3196
	mov	r3, r5
	mov	r2, r5
	mov	r1, #127
	ldr	r0, [r4, #2680]
	blx	r7
.L3196:
	ldr	r3, [r6, #3984]
	mov	r2, #0
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3258
.L3273:
	cmp	r3, #0
	beq	.L3205
	ldr	r3, [r6, #4020]
	cmp	r3, #2
	bne	.L3205
	mov	r2, #0
	str	r2, [r7, #360]
	ldr	r3, [r6, #3984]
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
.L3261:
	mov	r0, r7
	bl	H264_ClearCurrPic
.L3262:
	mvn	r0, #0
	b	.L3258
.L3270:
	cmp	r3, #0
	bne	.L3189
	ldr	r3, [r4, #1384]
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r4, #1384]
	movne	r3, #1
	strne	r3, [r4, #1384]
	b	.L3195
.L3199:
	ldr	r2, [r7]
	b	.L3202
.L3272:
	ldr	r2, .L3275+12
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L3261
	ldr	r0, [r4, #2680]
	mov	r2, r3
	mov	r1, #127
	blx	r5
	b	.L3261
.L3185:
	mov	r3, #1
	mov	r0, r7
	strb	r3, [r6, #3335]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3258
.L3266:
	movw	r3, #7510
	ldr	r2, .L3275+24
	ldr	r1, .L3275+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3258
.L3276:
	.align	2
.L3275:
	.word	.LC370
	.word	.LC367
	.word	.LC368
	.word	g_event_report
	.word	g_allow_B_before_P
	.word	.LC369
	.word	.LC8
	.word	.LC9
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
	subs	r3, r0, #0
	beq	.L3280
	add	r2, r3, #20480
	mov	r1, #0
	mov	r4, #1
	str	r1, [r2, #256]
	strb	r4, [r2, #213]
	str	r4, [r3, #364]
	bl	DecVDM
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r4
	ldr	r1, .L3281
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L3280:
	movw	r3, #11558
	ldr	r2, .L3281+4
	ldr	r1, .L3281+8
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L3282:
	.align	2
.L3281:
	.word	.LC371
	.word	.LC8
	.word	.LC9
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r4, r0, #13504
	add	r4, r4, #24
	add	r7, r0, #57344
	mov	r8, r1
	mov	r6, r0
	mov	r1, #24
	mov	r0, r4
	mov	r5, #0
	mov	r9, r3
	mov	r10, r2
	str	r5, [fp, #-48]
	bl	BsSkip
	ldr	r3, [r7, #3776]
	cmp	r8, r5
	str	r5, [r7, #3764]
	str	r3, [fp, #-48]
	beq	.L3285
	cmp	r8, #1
	bne	.L3389
	cmp	r10, #1
	mov	r1, #16
	mov	r0, r4
	beq	.L3390
	bl	BsGet
	mov	r1, #8
	mov	r8, r0
	mov	r0, r4
	bl	BsGet
	movw	r3, #31745
	cmp	r8, r3
	beq	.L3307
	mov	r1, #24
	mov	r0, r4
	bl	BsBack
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	movw	r3, #32257
	cmp	r8, r3
	beq	.L3391
.L3305:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3389:
	mov	r2, r8
	ldr	r1, .L3399
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
.L3370:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3285:
	cmp	r10, #1
	beq	.L3392
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3307:
	and	r0, r0, #31
	cmp	r0, #25
	bne	.L3305
	ldr	r4, .L3399+4
	ldr	r8, [r4]
	cmp	r8, #0
	beq	.L3309
	add	r0, r6, #61440
	mov	r3, r5
	mov	r2, r5
	mov	r1, #112
	ldr	r0, [r0, #2680]
	blx	r8
.L3309:
	mov	r0, r6
	bl	DecVDM
	subs	r8, r0, #0
	beq	.L3310
.L3382:
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L3376
	add	r6, r6, #61440
	mov	r3, #0
	mov	r2, r3
	mov	r1, #113
	ldr	r0, [r6, #2680]
	blx	r4
	mvn	r0, #0
	b	.L3370
.L3392:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	movw	r9, #31745
	mov	r5, r0
	mov	r0, r4
	bl	BsGet
	cmp	r5, r9
	beq	.L3288
	mov	r1, #24
	mov	r0, r4
	bl	BsBack
	bic	r5, r5, #512
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	cmp	r5, r9
	bne	.L3305
.L3306:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3376
	add	r3, r6, #61440
	ldr	r0, [r3, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r6, #368]
	b	.L3370
.L3310:
	ldr	ip, [r6, #368]
	add	r5, r6, #61440
	sub	r2, fp, #48
	ldr	r1, [r7, #3768]
	ldr	r0, [r5, #2680]
	ldr	r3, [ip, #12]
	ldr	ip, [ip, #40]
	add	r3, r3, ip
	sub	r3, r3, #1
	bl	MetadataMapToSec
	cmp	r0, #0
	bne	.L3393
	ldr	r4, .L3399+8
	mov	r2, #5
	ldr	r1, .L3399+12
	ldr	r0, [fp, #-48]
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r0, [fp, #-48]
	ldr	r8, [r4, #52]
	ldr	r2, [r3, #12]
	add	r0, r0, #5
	sub	r2, r2, #6
	str	r2, [r7, #3764]
	ldr	r1, [r3, #8]
	add	r1, r1, #6
	blx	r8
	ldr	r3, [r7, #3764]
	add	r3, r3, #5
	str	r3, [r7, #3764]
	ldr	r1, [r6, #368]
	ldr	r2, [r1, #40]
	cmp	r2, #0
	bne	.L3394
.L3312:
	ldr	r0, [r5, #2680]
	ldr	r8, .L3399+16
	ldr	r3, [r8, r0, asl #2]
	cmp	r3, #0
	beq	.L3313
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r5, #2680]
	ldr	r1, [r7, #3764]
	ldr	r3, [r4, #44]
	ldr	r2, [r8, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r5, #2680]
.L3313:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r4, r0, #0
	beq	.L3314
	movw	r3, #12750
.L3375:
	ldr	r2, .L3399+20
	mov	r0, #0
	ldr	r1, .L3399+24
	bl	dprint_vfmw
.L3376:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3390:
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r4
	bl	BsGet
	movw	r3, #31745
	cmp	r7, r3
	beq	.L3300
	mov	r1, #32
	mov	r0, r4
	bl	BsBack
	ldr	r3, [r6, #368]
	movw	r2, #32257
	cmp	r7, r2
	mov	r2, #16
	str	r2, [r3, #64]
	beq	.L3395
	mov	r1, #8
	mov	r0, r4
	bl	BsSkip
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	and	r0, r0, #31
	cmp	r0, #11
	bne	.L3306
	mov	r0, r6
	bl	H264_IsEosNal
	cmp	r0, #1
	bne	.L3306
	ldr	r3, [r6, #368]
	mov	r0, r4
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #8]
	bl	BsInit
	mov	r0, #3
	b	.L3370
.L3288:
	and	r0, r0, #31
	cmp	r0, #25
	bne	.L3306
	ldr	r4, .L3399+4
	ldr	r5, [r4]
	cmp	r5, #0
	beq	.L3291
	add	r0, r6, #61440
	mov	r3, r8
	mov	r2, r8
	mov	r1, #112
	ldr	r0, [r0, #2680]
	blx	r5
.L3291:
	mov	r0, r6
	bl	DecVDM
	subs	r8, r0, #0
	bne	.L3382
	ldr	ip, [r6, #368]
	add	r5, r6, #61440
	sub	r2, fp, #48
	ldr	r1, [r7, #3768]
	ldr	r0, [r5, #2680]
	ldr	r3, [ip, #12]
	ldr	ip, [ip, #40]
	add	r3, r3, ip
	sub	r3, r3, #1
	bl	MetadataMapToSec
	cmp	r0, #0
	bne	.L3396
	ldr	r4, .L3399+8
	mov	r2, #5
	ldr	r1, .L3399+12
	ldr	r0, [fp, #-48]
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r0, [fp, #-48]
	ldr	r8, [r4, #52]
	ldr	r2, [r3, #12]
	add	r0, r0, #5
	sub	r2, r2, #6
	str	r2, [r7, #3764]
	ldr	r1, [r3, #8]
	add	r1, r1, #6
	blx	r8
	ldr	r3, [r7, #3764]
	add	r3, r3, #5
	str	r3, [r7, #3764]
	ldr	r1, [r6, #368]
	ldr	r2, [r1, #40]
	cmp	r2, #0
	bne	.L3397
.L3295:
	ldr	r0, [r5, #2680]
	ldr	r8, .L3399+16
	ldr	r3, [r8, r0, asl #2]
	cmp	r3, #0
	beq	.L3296
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r5, #2680]
	ldr	r1, [r7, #3764]
	ldr	r3, [r4, #44]
	ldr	r2, [r8, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r5, #2680]
.L3296:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r4, r0, #0
	movwne	r3, #12593
	bne	.L3375
.L3314:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3376
	ldr	r0, [r5, #2680]
	bl	ReleaseNAL
	str	r4, [r6, #368]
	mvn	r0, #0
	b	.L3370
.L3300:
	and	r0, r0, #31
	cmp	r0, #25
	cmpeq	r9, #2
	moveq	r9, #1
	movne	r9, #0
	bne	.L3398
	ldr	r4, .L3399+4
	ldr	r7, [r4]
	cmp	r7, #0
	beq	.L3303
	add	r0, r6, #61440
	mov	r3, r5
	mov	r2, r5
	mov	r1, #112
	ldr	r0, [r0, #2680]
	blx	r7
.L3303:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	bne	.L3382
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3376
	add	r3, r6, #61440
	ldr	r0, [r3, #2680]
	bl	ReleaseNAL
	str	r5, [r6, #368]
	mvn	r0, #0
	b	.L3370
.L3391:
	ldr	r1, .L3399+28
	movw	r3, #12762
	ldr	r2, .L3399+20
	mov	r0, r5
	bl	dprint_vfmw
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3376
	add	r3, r6, #61440
	ldr	r0, [r3, #2680]
	bl	ReleaseNAL
	str	r5, [r6, #368]
	b	.L3376
.L3395:
	add	r8, r6, #61440
	ldr	r7, .L3399+32
	ldr	r3, [r8, #2680]
	ldr	r3, [r7, r3, asl #2]
	cmp	r3, #0
	beq	.L3305
	ldr	r4, .L3399+8
	mov	r0, r5
	ldr	r3, [r4, #16]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r2, [r8, #2680]
	ldr	r6, [r4, #44]
	ldr	r1, [r3, #12]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [r3, #8]
	blx	r6
	ldr	r3, [r4, #12]
	mov	r0, r5
	blx	r3
	mov	r0, r5
	b	.L3370
.L3398:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3376
	add	r3, r6, #61440
	ldr	r0, [r3, #2680]
	bl	ReleaseNAL
	str	r9, [r6, #368]
	mvn	r0, #0
	b	.L3370
.L3394:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #36]
	add	r0, r0, r3
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r2, [r7, #3764]
	ldr	r3, [r3, #40]
	add	r3, r3, r2
	str	r3, [r7, #3764]
	b	.L3312
.L3397:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #36]
	add	r0, r0, r3
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r2, [r7, #3764]
	ldr	r3, [r3, #40]
	add	r3, r3, r2
	str	r3, [r7, #3764]
	b	.L3295
.L3393:
	mov	r0, r8
	movw	r3, #12720
	ldr	r2, .L3399+20
	ldr	r1, .L3399+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3370
.L3396:
	mov	r0, r8
	movw	r3, #12559
	ldr	r2, .L3399+20
	ldr	r1, .L3399+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3370
.L3400:
	.align	2
.L3399:
	.word	.LC375
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_RpuStartCode
	.word	vfmw_save_metadata_file
	.word	.LANCHOR0+304
	.word	.LC373
	.word	.LC374
	.word	vfmw_save_el_file
	.word	.LC372
	UNWIND(.fnend)
	.size	H264_VES_Splitter, .-H264_VES_Splitter
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
	ldr	ip, [r1, #12]
	add	r6, r0, #61440
	ldr	r3, [r1, #8]
	ldr	r2, [r1, #4]
	mov	r4, r0
	mov	r5, r1
	mov	r0, #7
	ldr	r1, .L3467
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r6, #2712]
	ldr	r3, [r4]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L3463
.L3402:
	ldr	r3, [r4, #368]
	cmp	r3, #0
	beq	.L3425
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3464
.L3405:
	ldr	r1, .L3467+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #368]
	cmp	r1, #0
	beq	.L3425
	ldr	r0, [r6, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L3425:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3409
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3409
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3409
	cmp	r4, #0
	beq	.L3416
	ldrb	r3, [r4, #377]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3427
	mov	r2, r4
	mov	r3, #1
	b	.L3415
.L3414:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3416
.L3415:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L3414
	mov	r2, r3
.L3413:
	mov	r1, r3, asl #7
	cmn	r2, #1
	sub	r3, r1, r3, asl #5
	mov	r1, #1
	add	r3, r4, r3
	strb	r1, [r3, #377]
	beq	.L3416
	mov	r3, r2, asl #7
	mov	r0, #0
	sub	r3, r3, r2, asl #5
	add	r2, r3, #376
	add	r3, r4, r3
	add	r2, r4, r2
	str	r2, [r4, #368]
	ldr	r2, [r5, #4]
	str	r2, [r3, #384]
	ldr	r2, [r5, #12]
	str	r2, [r3, #388]
	ldr	r2, [r5, #8]
	str	r2, [r3, #392]
	ldr	r3, [r4, #368]
	str	r0, [r3, #24]
	ldr	r3, [r4, #368]
	ldr	r2, [r5, #16]
	str	r2, [r3, #32]
	ldrd	r2, [r5, #24]
	ldr	ip, [r4, #368]
	strd	r2, [ip, #88]
	ldr	r3, [r4, #368]
	str	r1, [r3, #68]
	ldr	r3, [r4, #368]
	strb	r0, [r3]
	ldr	r3, [r4, #368]
	ldrb	r2, [r5]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r3, [r4]
	ldrb	r3, [r3, #976]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3419
	add	r3, r4, #57344
	ldr	r1, [r5, #12]
	ldr	r2, [r3, #4056]
	ldr	r0, [r3, #4060]
	add	r1, r1, r2
	str	r1, [r3, #4056]
	ldr	r2, [r5, #12]
	add	r2, r2, r0
	str	r2, [r3, #4060]
	b	.L3419
.L3464:
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bhi	.L3405
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3406
	b	.L3405
.L3463:
	ldr	r3, [r3, #952]
	cmp	r3, #0
	beq	.L3402
	ldr	r3, [r4, #368]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3425
.L3406:
	strb	r2, [r3, #4]
	ldr	r3, [r4]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L3465
.L3420:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3422
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3422
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3422
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bls	.L3466
.L3423:
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #2680]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3467+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3419
	mov	r3, #0
	ldr	r0, [r6, #2680]
	mov	r2, r3
	mov	r1, #113
	blx	r5
.L3419:
	ldr	r3, [r4, #368]
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3409:
	ldr	r1, .L3467+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #2680]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3467+8
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3462
.L3461:
	mov	r3, #0
	ldr	r0, [r6, #2680]
	mov	r2, r3
	mov	r1, #113
	blx	r4
.L3462:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3422:
	ldr	r3, [r4, #368]
	b	.L3423
.L3465:
	ldr	r3, [r3, #952]
	cmp	r3, #0
	bne	.L3419
	b	.L3420
.L3466:
	mov	ip, r1, asl #5
	mov	r0, #0
	sub	r1, ip, r1, asl #2
	add	r3, r3, r1
	str	r2, [r3, #8]
	ldr	r3, [r4, #368]
	ldr	ip, [r5, #12]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #12]
	ldr	r3, [r4, #368]
	ldr	ip, [r5, #8]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #16]
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #24]
	ldr	r3, [r4, #368]
	ldr	r0, [r5, #16]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #32]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #68]
	add	r3, r3, #1
	str	r3, [r2, #68]
	ldr	r3, [r4]
	ldrb	r3, [r3, #976]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3424
	add	r3, r4, #57344
	ldr	r1, [r5, #12]
	ldr	r2, [r3, #4056]
	ldr	r0, [r3, #4060]
	add	r1, r1, r2
	str	r1, [r3, #4056]
	ldr	r2, [r5, #12]
	add	r2, r2, r0
	str	r2, [r3, #4060]
.L3424:
	mov	r0, r4
	bl	CombinePacket
	mov	r3, #1
	str	r3, [r6, #2712]
	b	.L3419
.L3416:
	ldr	r1, .L3467+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearAllNal
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	ldr	r3, .L3467+8
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L3461
	b	.L3462
.L3427:
	mov	r2, r3
	b	.L3413
.L3468:
	.align	2
.L3467:
	.word	.LC376
	.word	.LC377
	.word	g_event_report
	.word	.LC379
	.word	.LC378
	UNWIND(.fnend)
	.size	ReceivePacket, .-ReceivePacket
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
	add	r5, r0, #57344
	mov	r6, r0
	ldrb	r7, [r5, #3331]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L3471
	bcc	.L3472
	cmp	r7, #2
	beq	.L3473
	mov	r7, #0
.L3470:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3473:
	ldr	r3, [r5, #3984]
	mov	r2, #3
	add	r4, r0, #61440
	strb	r2, [r3, #704]
	ldrb	r2, [r5, #3329]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3492
	ldr	r1, [r4, #732]
	cmp	r1, #0
	beq	.L3493
	bl	OutputFrmToVO
	subs	r7, r0, #0
	bne	.L3557
.L3494:
	ldr	r3, [r5, #3984]
	str	r3, [r4, #732]
	str	r3, [r3, #820]
.L3495:
	ldr	r3, [r4, #732]
	mov	r9, #2
	ldrb	r0, [r5, #3330]	@ zero_extendqisi2
	mov	r8, #0
	mov	r2, #640
	add	r1, r5, #3344
	strb	r0, [r3]
	ldr	r3, [r4, #732]
	strb	r9, [r3, #1]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #732]
	str	r8, [r3, #676]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #732]
	ldr	r0, [r5, #4020]
	str	r0, [r3, #684]
	ldr	r3, [r4, #732]
	str	r8, [r3, #680]
	ldr	r0, [r4, #732]
	add	r0, r0, #16
	bl	memcpy
	ldr	r3, [r4, #732]
	ldr	r2, [r5, #4028]
	str	r2, [r3, #800]
	ldr	r3, [r4, #732]
	ldr	r2, [r3, #800]
	str	r2, [r3, #720]
	str	r2, [r3, #688]
	ldr	r3, [r4, #732]
	strb	r9, [r3, #784]
	ldrb	r2, [r5, #3335]	@ zero_extendqisi2
	ldr	r3, [r4, #732]
	cmp	r2, #1
	moveq	r2, r9
	movne	r2, r8
	strb	r2, [r3, #3]
	ldr	r9, [r4, #2612]
	cmp	r9, #1
	bne	.L3470
.L3552:
	ldr	r3, [r4, #732]
	mov	r2, r8
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetRef
	mov	r2, r8
	mov	r0, r6
	ldr	r1, [r4, #732]
	bl	OutputFrmToVO
	ldr	r3, [r4, #732]
	cmp	r3, r8
	mov	r7, r0
	beq	.L3505
	ldr	r3, [r5, #3984]
	mov	r2, r9
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_ClearLogicFs
	b	.L3505
.L3472:
	ldr	r3, [r5, #3984]
	add	r4, r0, #61440
	mov	r2, #0
	strb	r2, [r3, #704]
	ldr	r1, [r4, #732]
	cmp	r1, r2
	beq	.L3474
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L3558
.L3475:
	ldr	r3, [r4, #732]
	cmp	r3, #0
	beq	.L3474
	ldr	r3, [r5, #3984]
	mov	r2, #1
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_ClearLogicFs
.L3474:
	ldr	r3, [r5, #3984]
	mov	r0, #3
	mov	r8, #0
	mov	r2, #640
	add	r1, r5, #3344
	str	r3, [r4, #732]
	str	r3, [r3, #740]
	ldr	r3, [r4, #732]
	ldr	ip, [r5, #3984]
	str	ip, [r3, #780]
	ldr	r3, [r4, #732]
	ldr	ip, [r5, #3984]
	str	ip, [r3, #820]
	ldrb	ip, [r5, #3330]	@ zero_extendqisi2
	ldr	r3, [r4, #732]
	strb	ip, [r3]
	ldr	r3, [r4, #732]
	strb	r0, [r3, #1]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #732]
	str	r8, [r3, #676]
	ldr	r0, [r4, #732]
	add	r0, r0, #16
	bl	memcpy
	ldr	r3, [r4, #732]
	ldr	r1, [r5, #4028]
	mov	r2, r8
	str	r1, [r3, #720]
	str	r1, [r3, #688]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #704]
	ldr	r3, [r4, #732]
	ldr	r1, [r5, #4020]
	str	r1, [r3, #684]
	ldr	r3, [r4, #732]
	ldrb	r1, [r5, #3337]	@ zero_extendqisi2
	str	r1, [r3, #680]
	ldrb	r1, [r5, #3335]	@ zero_extendqisi2
	ldr	r3, [r4, #732]
	cmp	r1, #1
	moveq	r7, #3
	strb	r7, [r3, #3]
	ldr	r3, [r4, #732]
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetRef
	mov	r2, r8
	mov	r0, r6
	ldr	r1, [r4, #732]
	bl	OutputFrmToVO
	ldr	r3, [r4, #732]
	cmp	r3, r8
	mov	r7, r0
	beq	.L3505
.L3550:
	ldr	r3, [r5, #3984]
	mov	r2, #1
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_ClearLogicFs
.L3505:
	mov	r3, #0
	mov	r0, r7
	str	r3, [r4, #732]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3471:
	ldr	r3, [r5, #3984]
	mov	r2, #3
	add	r4, r0, #61440
	strb	r2, [r3, #704]
	ldrb	r2, [r5, #3329]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3479
	ldr	r1, [r4, #732]
	cmp	r1, #0
	beq	.L3480
	bl	OutputFrmToVO
	subs	r7, r0, #0
	bne	.L3559
.L3481:
	ldr	r3, [r5, #3984]
	str	r3, [r4, #732]
	str	r3, [r3, #780]
.L3482:
	ldr	r3, [r4, #732]
	mov	r9, #1
	ldrb	r0, [r5, #3330]	@ zero_extendqisi2
	mov	r8, #0
	mov	r2, #640
	add	r1, r5, #3344
	strb	r0, [r3]
	ldr	r3, [r4, #732]
	strb	r9, [r3, #1]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #732]
	str	r8, [r3, #676]
	ldr	r3, [r4, #732]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #732]
	ldr	r0, [r5, #4020]
	str	r0, [r3, #684]
	ldr	r3, [r4, #732]
	str	r8, [r3, #680]
	ldr	r0, [r4, #732]
	add	r0, r0, #16
	bl	memcpy
	ldr	r3, [r4, #732]
	ldr	r2, [r5, #4028]
	str	r2, [r3, #760]
	ldr	r3, [r4, #732]
	ldr	r2, [r3, #760]
	str	r2, [r3, #720]
	str	r2, [r3, #688]
	ldr	r3, [r4, #732]
	strb	r9, [r3, #744]
	ldrb	r3, [r5, #3335]	@ zero_extendqisi2
	ldr	r2, [r4, #732]
	rsb	r3, r9, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #3]
	ldr	r9, [r4, #2612]
	cmp	r9, #1
	beq	.L3552
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3492:
	ldr	r3, [r4, #732]
	mov	r2, #640
	add	r1, r5, #3344
	cmp	r3, #0
	ldreq	r3, [r5, #3984]
	streq	r3, [r4, #732]
	streq	r3, [r3, #820]
	ldreq	r3, [r4, #732]
	add	ip, r3, #608
	add	lr, r3, #624
	add	r0, r3, #16
	ldr	r10, [r3, #16]
	ldrd	r8, [ip, #-8]
	ldr	r7, [r3, #28]
	strd	r8, [fp, #-68]
	ldrd	r8, [ip]
	strd	r8, [fp, #-52]
	ldrd	r8, [lr, #-8]
	strd	r8, [fp, #-60]
	ldr	r9, [r3, #20]
	ldr	r8, [r3, #24]
	bl	memcpy
	ldrd	r0, [fp, #-68]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r1, r3
	cmpeq	r0, r2
	ldrne	r3, [r4, #732]
	addne	r3, r3, #608
	strned	r0, [r3, #-8]
.L3499:
	ldr	r3, [r4, #732]
	movw	r2, #61280
	ldrd	r0, [r6, r2]
	add	ip, r3, #608
	ldrd	r2, [fp, #-52]
	cmp	r1, r3
	cmpeq	r0, r2
	movhi	r0, r2
	movhi	r1, r3
	add	r2, r6, #61184
	strd	r0, [ip]
	ldr	r3, [r4, #732]
	ldrd	r0, [r2, #104]
	add	ip, r3, #624
	ldrd	r2, [fp, #-60]
	cmp	r1, r3
	cmpeq	r0, r2
	movhi	r0, r2
	movhi	r1, r3
	strd	r0, [ip, #-8]
	mov	ip, #2
	ldr	r3, [r5, #3344]
	mov	r0, #3
	ldr	r2, [r4, #732]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #16]
	ldr	r3, [r5, #3348]
	ldr	r2, [r4, #732]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #20]
	ldr	r3, [r5, #3352]
	ldr	r2, [r4, #732]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #24]
	ldr	r3, [r5, #3356]
	ldr	r2, [r4, #732]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #28]
	ldr	r2, [r4, #732]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #3330]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #732]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #732]
	ldr	r1, [r5, #4020]
	ldr	r3, [r2, #684]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #684]
	ldr	r3, [r4, #732]
	strb	ip, [r3, #784]
	ldr	r3, [r4, #732]
	strb	r0, [r3, #704]
	ldr	r3, [r4, #732]
	ldr	r2, [r5, #4028]
	str	r2, [r3, #800]
	ldr	r2, [r4, #732]
	ldr	r3, [r2, #800]
	ldr	r1, [r2, #760]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #720]
	ldr	r3, [r4, #732]
	ldr	r2, [r3, #720]
	str	r2, [r3, #688]
	ldr	r3, [r4, #732]
	ldr	r2, [r3, #820]
	str	r2, [r3, #740]
	ldrb	r3, [r5, #3335]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #732]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	beq	.L3554
.L3504:
	strb	r2, [r3, #3]
	mov	r2, #0
	ldr	r3, [r4, #732]
	ldr	r0, [r4, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetRef
	mov	r0, r6
	mov	r2, #0
	ldr	r1, [r4, #732]
	bl	OutputFrmToVO
	ldr	r3, [r4, #732]
	cmp	r3, #0
	mov	r7, r0
	bne	.L3550
	b	.L3505
.L3479:
	ldr	ip, [r4, #732]
	mov	r2, #640
	add	r1, r5, #3344
	cmp	ip, #0
	ldreq	r3, [r5, #3984]
	streq	r3, [r4, #732]
	streq	r3, [r3, #780]
	ldreq	ip, [r4, #732]
	add	lr, ip, #608
	add	r7, ip, #624
	ldr	r3, [ip, #600]
	add	r0, ip, #16
	ldrd	r8, [lr]
	ldr	r10, [ip, #16]
	str	r3, [fp, #-72]
	strd	r8, [fp, #-52]
	ldr	r3, [ip, #604]
	ldrd	r8, [r7, #-8]
	ldr	r7, [ip, #28]
	str	r3, [fp, #-68]
	strd	r8, [fp, #-60]
	ldr	r9, [ip, #20]
	ldr	r8, [ip, #24]
	bl	memcpy
	add	r2, r6, #61184
	ldr	ip, [fp, #-68]
	add	r2, r2, #96
	ldr	r3, [fp, #-72]
	ldr	r0, [r2, #-8]
	ldr	r2, [r2, #-4]
	and	r1, r3, ip
	and	r0, r0, r2
	adds	r2, r1, #1
	movne	r2, #1
	cmn	r0, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #732]
	strne	ip, [r2, #604]
	strne	r3, [r2, #600]
	movw	r2, #61280
	ldr	r3, [r4, #732]
	ldrd	r0, [r6, r2]
	add	ip, r3, #608
	ldrd	r2, [fp, #-52]
	cmp	r1, r3
	cmpeq	r0, r2
	movhi	r0, r2
	movhi	r1, r3
	add	r2, r6, #61184
	strd	r0, [ip]
	ldr	r3, [r4, #732]
	ldrd	r0, [r2, #104]
	add	ip, r3, #624
	ldrd	r2, [fp, #-60]
	cmp	r1, r3
	cmpeq	r0, r2
	movhi	r0, r2
	movhi	r1, r3
	strd	r0, [ip, #-8]
	mov	ip, #1
	ldr	r3, [r5, #3344]
	mov	r0, #3
	ldr	r2, [r4, #732]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #16]
	ldr	r3, [r5, #3348]
	ldr	r2, [r4, #732]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #20]
	ldr	r3, [r5, #3352]
	ldr	r2, [r4, #732]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #24]
	ldr	r3, [r5, #3356]
	ldr	r2, [r4, #732]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #28]
	ldr	r2, [r4, #732]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #3330]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #732]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #732]
	ldr	r1, [r5, #4020]
	ldr	r3, [r2, #684]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #684]
	ldr	r3, [r4, #732]
	strb	ip, [r3, #744]
	ldr	r3, [r4, #732]
	strb	r0, [r3, #704]
	ldr	r3, [r4, #732]
	ldr	r2, [r5, #4028]
	str	r2, [r3, #760]
	ldr	r2, [r4, #732]
	ldr	r3, [r2, #800]
	ldr	r1, [r2, #760]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #720]
	ldr	r3, [r4, #732]
	ldr	r2, [r3, #720]
	str	r2, [r3, #688]
	ldr	r3, [r4, #732]
	ldr	r2, [r3, #780]
	str	r2, [r3, #740]
	ldrb	r3, [r5, #3335]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #732]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	bne	.L3504
.L3554:
	orr	r2, r2, ip
	b	.L3504
.L3558:
	str	r0, [sp]
	movw	r3, #2940
	ldr	r2, .L3560
	mov	r0, #22
	ldr	r1, .L3560+4
	bl	dprint_vfmw
	b	.L3475
.L3493:
	ldr	r3, [r5, #3984]
	mov	r7, r1
	str	r3, [r4, #732]
	str	r3, [r3, #820]
	b	.L3495
.L3480:
	ldr	r3, [r5, #3984]
	mov	r7, r1
	str	r3, [r4, #732]
	str	r3, [r3, #780]
	b	.L3482
.L3557:
	str	r7, [sp]
	movw	r3, #3108
	ldr	r2, .L3560
	mov	r0, #22
	ldr	r1, .L3560+4
	bl	dprint_vfmw
	b	.L3494
.L3559:
	str	r7, [sp]
	mov	r3, #2992
	ldr	r2, .L3560
	mov	r0, #22
	ldr	r1, .L3560+4
	bl	dprint_vfmw
	b	.L3481
.L3561:
	.align	2
.L3560:
	.word	.LANCHOR0+324
	.word	.LC357
	UNWIND(.fnend)
	.size	DirectOutput, .-DirectOutput
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	subs	r4, r0, #0
	beq	.L3748
	add	r2, r4, #16384
	add	r5, r4, #57344
	mov	r3, #0
	str	r3, [r2, #3444]
	ldrb	r3, [r5, #3331]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r2, #3448]
	ldrb	r3, [r5, #3328]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3749
	add	r6, r4, #61440
	ldr	r3, .L3775
	ldr	r1, [r6, #2680]
	ldr	r2, [r6, #2692]
	ldr	r3, [r3, r1, asl #2]
	str	r2, [r6, #2688]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L3750
.L3567:
	ldr	r0, [r6, #2608]
	cmp	r0, #2
	beq	.L3751
	ldr	r7, [r4]
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L3572
	ldr	r2, [r6, #2684]
	cmp	r2, #2
	beq	.L3574
	ldrb	r2, [r5, #3330]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3574
.L3654:
	ldr	r2, [r5, #3984]
	ldrb	r1, [r5, #3331]	@ zero_extendqisi2
	str	r2, [fp, #-64]
	sub	r2, r1, #1
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	cmp	r1, #0
	beq	.L3576
	ldr	r0, [fp, #-64]
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	ip, r2
	orrne	ip, r2, #1
	cmp	ip, #0
	beq	.L3575
	cmp	r2, #0
	beq	.L3752
.L3657:
	ldr	r2, [r6, #2684]
	cmp	r2, #0
	bne	.L3579
	mov	r3, #1
	mov	r2, #736
	str	r3, [r6, #2684]
	add	r1, r4, #60672
	add	r0, r5, #4064
	bl	memcpy
	ldr	r3, [r7, #24]
.L3575:
	cmp	r3, #2
	beq	.L3753
.L3574:
	ldr	r3, [r5, #4000]
	cmp	r3, #0
	beq	.L3611
	ldr	r3, [r6, #2672]
	ldr	r2, [r5, #4028]
	cmp	r3, r2
	bcs	.L3612
	ldrb	r1, [r5, #3330]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3612
	ldr	r1, [r7, #644]
	cmp	r1, #0
	beq	.L3754
.L3612:
	mov	r0, r4
	bl	Marking
	subs	r2, r0, #0
	bne	.L3755
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L3756
.L3605:
	ldrb	r3, [r5, #3329]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3616
	add	r7, r4, #24576
.L3620:
	ldr	r3, [r5, #4000]
	cmp	r3, #0
	beq	.L3757
	ldr	r2, [r7, #2144]
	ldr	r3, [r7, #2148]
	ldr	ip, [r7, #2136]
	add	r1, r3, r2
	cmp	ip, r1
	bhi	.L3628
	ldr	r1, [r4]
	ldr	r1, [r1, #24]
	cmp	r1, #3
	beq	.L3629
	ldr	r1, .L3775+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L3629
	str	r3, [sp, #4]
	mov	r0, #1
	mov	r3, ip
	str	r2, [sp]
	ldr	r1, .L3775+8
	movw	r2, #4110
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearDPB
	movw	r3, #4112
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3572:
	ldrb	r2, [r5, #3330]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3575
	b	.L3654
.L3576:
	cmp	r2, #0
	bne	.L3657
.L3582:
	add	r8, r4, #60672
.L3585:
	cmp	r1, #0
	beq	.L3586
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3758
.L3586:
	ldr	r3, [r8, #700]
	ldr	r2, [fp, #-64]
	str	r3, [r2, #688]
.L3587:
	ldr	r7, [fp, #-64]
	mov	r0, r4
	mov	r1, r7
	bl	GetImagePara
	ldr	r1, [r7, #656]
	ldr	r0, [r6, #2680]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3759
	ldrb	r3, [r8, #3]	@ zero_extendqisi2
	add	ip, r8, #608
	cmp	r3, #0
	beq	.L3589
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3760
.L3589:
	ldrd	r2, [ip, #-8]
	add	r1, r7, #592
.L3740:
	strd	r2, [r1, #-8]
.L3590:
	ldrd	r2, [ip]
	add	lr, r8, #624
	add	r0, r7, #608
	add	ip, r8, #448
	strd	r2, [r1]
	add	r1, r8, #560
	ldrd	r2, [lr, #-8]
	strd	r2, [r0, #-8]
	add	r3, r7, #432
	ldr	r0, [r8, #16]
	mov	r2, #32
	str	r0, [r7]
	add	r0, r7, #544
	ldr	lr, [r8, #20]
	str	lr, [r7, #4]
	ldr	lr, [r8, #24]
	str	lr, [r7, #8]
	ldr	lr, [r8, #28]
	str	lr, [r7, #12]
	ldr	lr, [fp, #-64]
	ldr	lr, [lr, #688]
	str	lr, [r7, #152]
	ldr	lr, [r8, #440]
	str	lr, [r7, #424]
	ldr	r8, [r8, #436]
	ldr	lr, .L3775+16
	str	r8, [r7, #420]
	ldrd	r8, [ip]
	strd	r8, [r3]
	ldr	r8, [lr, #52]
	blx	r8
	ldr	r2, [r7, #152]
	cmp	r2, #0
	beq	.L3596
	ldrb	r3, [r7, #64]	@ zero_extendqisi2
	ands	r8, r3, #3
	beq	.L3761
.L3594:
	ldr	r3, [r4]
	ldr	r1, [r3, #4]
	cmp	r1, r2
	bcc	.L3762
.L3596:
	ldr	r3, [fp, #-64]
	mov	r2, #1
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
	ldr	r0, [r6, #2680]
	add	r3, r4, #8
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #0
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3763
	ldr	r3, [fp, #-64]
	mov	r2, #0
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
.L3598:
	ldr	r3, [r4]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #16]
	bcs	.L3764
.L3600:
	ldr	r2, [r6, #2684]
	ldr	r3, [r6, #2700]
	cmp	r2, #2
	add	r3, r3, #2
	str	r3, [r6, #2700]
	ldrne	r2, [fp, #-64]
	movne	r3, #1
	strne	r3, [r2, #824]
.L3602:
	mov	r3, #2
	str	r3, [r6, #2684]
	ldr	r7, [r4]
	ldr	r3, [r7, #24]
	b	.L3575
.L3749:
	mov	r0, r3
	ldr	r1, .L3775+20
	bl	dprint_vfmw
	movw	r3, #3787
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	add	r6, r4, #61440
	bl	dprint_vfmw
.L3656:
	ldr	r3, [r5, #3984]
	mov	r2, #1
	ldr	r0, [r6, #2680]
	mvn	r7, #0
	ldr	r1, [r3, #656]
	bl	FSP_ClearLogicFs
	mov	r3, r7
	movw	r2, #4210
	ldr	r1, .L3775+24
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #3984]
	mov	r3, #0
	strb	r3, [r2, #4]
	ldr	r2, [r5, #3984]
	strb	r3, [r2, #1]
.L3653:
	mov	r0, r7
	mov	r3, #0
	strb	r3, [r5, #3328]
.L3729:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3755:
	ldr	r1, .L3775+28
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #4031
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3752:
	cmp	r0, #0
	beq	.L3575
	b	.L3582
.L3629:
	ldr	r8, [r7, #2140]
	mov	r3, #0
	str	r3, [fp, #-52]
	mvn	r3, #-2147483648
	cmp	r8, ip
	strhi	ip, [r7, #2140]
	str	r3, [fp, #-56]
	movhi	r8, ip
	cmp	r8, #0
	beq	.L3662
	add	ip, r4, #26368
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-52]
	add	ip, ip, #148
	mvn	lr, #-2147483648
	mov	r3, #0
.L3634:
	ldr	r0, [ip, #4]!
	ldr	r0, [r0, #672]
	cmp	r0, lr
	movlt	r1, r3
	add	r3, r3, #1
	movlt	r2, r0
	cmp	r3, r8
	mov	lr, r2
	bne	.L3634
	str	r2, [fp, #-56]
	str	r1, [fp, #-52]
.L3632:
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	ip, [r7, #2136]
.L3628:
	mvn	r10, #0
	mov	r9, r10
	b	.L3644
.L3645:
	bl	GetMinPOC
	ldr	r2, [r5, #4000]
	cmp	r2, #0
	bne	.L3635
	ldr	r1, [r5, #4004]
	ldr	r2, [fp, #-56]
	cmp	r1, r2
	blt	.L3636
.L3635:
	ldr	r2, [r7, #2136]
	cmp	r2, #0
	beq	.L3636
	ldr	r8, [r7, #2140]
	cmp	r8, r10
	ldrne	r9, [fp, #-52]
	bne	.L3642
	ldr	r3, [fp, #-52]
	cmp	r3, r9
	beq	.L3765
	mov	r9, r3
.L3642:
	mov	r1, r9
	mov	r0, r4
	bl	OutputFrmFromDPB
	mov	r10, r8
	cmn	r0, #1
	beq	.L3643
	ldr	ip, [r7, #2136]
.L3644:
	ldr	lr, [r7, #2140]
	sub	r2, fp, #52
	sub	r1, fp, #56
	mov	r0, r4
	cmp	lr, ip
	bcs	.L3645
	ldr	r3, [r5, #4000]
	cmp	r3, #0
	beq	.L3646
	ldrb	r3, [r5, #3332]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3646
	ldr	r2, [r7, #2144]
	cmp	r2, #0
	beq	.L3646
	add	r2, r4, #26368
	mov	lr, r3
	add	r2, r2, #212
	b	.L3651
.L3648:
	ldr	r1, [r7, #2144]
	cmp	r1, r3
	bls	.L3766
.L3651:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	ldr	r0, [r5, #3992]
	ldr	ip, [r1, #660]
	cmp	ip, r0
	bne	.L3648
	ldr	r0, [r1, #824]
	cmp	r0, #1
	beq	.L3648
	strb	lr, [r1, #2]
	ldr	r1, [r2]
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	cmp	r0, #1
	streq	r0, [r1, #676]
	ldreq	r1, [r2]
	streqb	lr, [r1, #4]
	ldreq	r1, [r2]
	ldr	r8, [r6, #1368]
	ldr	ip, [r1, #692]
	add	r0, ip, #15680
	cmp	ip, r8
	add	r0, r0, #4
	strne	lr, [r4, r0, asl #2]
	strne	r8, [r1, #692]
	b	.L3648
.L3766:
	ldr	lr, [r7, #2140]
.L3646:
	add	r2, r4, #60672
	mov	r1, lr
	mov	r0, r4
	bl	InsertFrmInDPB
	ldr	r2, [r7, #2140]
	str	r2, [r6, #728]
	subs	r3, r0, #0
	beq	.L3652
	movw	r2, #4196
	ldr	r1, .L3775+24
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #4197
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3750:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L3567
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L3567
	bl	H264_Sei_Get_Frame_Pts
	b	.L3567
.L3611:
	ldrb	r3, [r5, #3329]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3616
	add	r7, r4, #24576
	ldr	ip, [r7, #2136]
	b	.L3628
.L3753:
	ldr	r3, [r5, #4000]
	cmp	r3, #0
	beq	.L3605
	ldrb	r3, [r5, #3334]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3606
.L3609:
	add	r7, r4, #24576
	mov	r0, r4
	bl	SimpleSlideDPB
	add	r2, r4, #60672
	ldr	r1, [r7, #2140]
	mov	r0, r4
	bl	InsertFrmInDPB
	subs	r8, r0, #0
	beq	.L3767
	mov	r3, r8
	movw	r2, #3997
	ldr	r1, .L3775+24
	mov	r0, #0
	bl	dprint_vfmw
	movw	r3, #3998
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3757:
	ldr	ip, [r7, #2136]
	b	.L3628
.L3616:
	ldr	r3, [r6, #732]
	ldr	r0, [r5, #3984]
	cmp	r3, #0
	rsb	r1, r3, r0
	clz	r1, r1
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	beq	.L3768
	mov	r0, r4
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3769
	cmp	r0, #1
	ldreq	r2, [r5, #3984]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #3984]
	streqb	r3, [r2, #1]
.L3624:
	movw	r3, #4067
	mov	r2, r7
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3571
.L3636:
	ldr	r3, [r6, #2608]
	cmp	r3, #2
	beq	.L3770
.L3638:
	mov	r0, r4
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3771
	cmp	r0, #1
	ldreq	r2, [r5, #3984]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #3984]
	streqb	r3, [r2, #1]
.L3640:
	movw	r3, #4141
	mov	r2, r7
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
.L3571:
	cmn	r7, #1
	bne	.L3653
	b	.L3656
.L3751:
	ldr	r1, .L3775+32
	bl	dprint_vfmw
	mov	r0, r4
	bl	DirectOutput
	ldr	r3, [r5, #4052]
	ldr	r2, [r6, #1368]
	cmp	r3, r2
	addne	r3, r3, #15680
	addne	r3, r3, #4
	movne	r1, #0
	strne	r1, [r4, r3, asl #2]
	mov	r7, r0
	strne	r2, [r5, #4052]
	cmp	r0, #1
	ldr	r1, .L3775+12
	ldreq	r2, [r5, #3984]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #3984]
	streqb	r3, [r2, #1]
	mov	r2, r0
	movw	r3, #3821
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3571
.L3768:
	add	r7, r4, #24576
	ldr	ip, [r7, #2140]
	cmp	ip, #0
	beq	.L3620
	ldr	r3, [r7, #1944]
	cmp	r0, r3
	addne	r3, r4, #26368
	addne	r3, r3, #152
	beq	.L3621
.L3625:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3620
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	bne	.L3625
.L3621:
	add	r2, r4, #60672
	mov	r0, r4
	bl	InsertFrmInDPB
	cmn	r0, #1
	mov	r7, r0
	beq	.L3772
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	movw	r3, #4087
	mov	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
.L3610:
	mov	r7, #0
	b	.L3653
.L3579:
	cmp	r2, #1
	beq	.L3773
	cmp	r1, #0
	beq	.L3582
	ldr	r2, [fp, #-64]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3582
	b	.L3575
.L3643:
	mov	r4, r0
	mov	r3, r0
	movw	r2, #4159
	ldr	r1, .L3775+24
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r4
	mov	r3, #4160
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3762:
	ldr	r3, [r3, #644]
	cmp	r3, #1
	beq	.L3596
	ldr	r3, .L3775+36
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3603
	str	r2, [fp, #-52]
	mov	r3, #8
	str	r1, [fp, #-48]
	sub	r2, fp, #52
	mov	r1, #104
	ldr	r0, [r6, #2680]
	blx	r4
.L3603:
	ldr	r3, [fp, #-64]
	mov	r2, #0
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_SetDisplay
	movw	r3, #3954
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3767:
	ldr	r3, [r7, #2140]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r7, #2140]
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	mov	r2, r8
	movw	r3, #4006
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3610
.L3652:
	add	r2, r2, #1
	mov	r0, r4
	str	r2, [r7, #2140]
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	b	.L3610
.L3754:
	ldr	r1, .L3775+40
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3775+36
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L3613
	ldr	r0, [r6, #2672]
	mov	r3, #8
	ldr	ip, [r5, #4028]
	sub	r2, fp, #52
	mov	r1, #104
	str	r0, [fp, #-48]
	str	ip, [fp, #-52]
	ldr	r0, [r6, #2680]
	blx	r7
.L3613:
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	movw	r3, #4023
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3758:
	ldr	r1, [fp, #-64]
	mov	r2, #3
	ldr	r3, [r1, #688]
	strb	r2, [r1, #1]
	ldr	r2, [r8, #700]
	add	r3, r3, r2
	str	r3, [r1, #688]
	b	.L3587
.L3761:
	movw	r2, #3929
	ldr	r1, .L3775+44
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3775+36
	ldr	r10, [r3]
	cmp	r10, #0
	beq	.L3595
	mov	r3, r8
	mov	r2, r8
	mov	r1, #111
	ldr	r0, [r6, #2680]
	blx	r10
.L3595:
	ldr	r2, [r7, #152]
	cmp	r2, #0
	bne	.L3594
	b	.L3596
.L3760:
	ldrd	r0, [ip, #-8]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r1, r3
	cmpeq	r0, r2
	addne	r1, r7, #592
	bne	.L3590
	add	r3, r4, #61952
	add	r3, r3, #64
	ldrd	r2, [r3, #-8]
	cmp	r3, r1
	add	r1, r7, #592
	cmpeq	r2, r0
	bne	.L3740
	b	.L3590
.L3769:
	mov	r3, r0
	movw	r2, #4057
	ldr	r1, .L3775+24
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3624
.L3763:
	ldr	r3, [r6, #2708]
	add	r3, r3, #1
	str	r3, [r6, #2708]
	b	.L3598
.L3765:
	mov	r3, r9
	ldr	r2, .L3775+48
	ldr	r1, .L3775+52
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #4148
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3756:
	ldr	r1, .L3775+56
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3605
.L3770:
	ldrb	r3, [r5, #3331]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r5, #3984]
	strne	r3, [r6, #736]
	b	.L3638
.L3764:
	mov	r1, r7
	mov	r0, r4
	bl	SetFrmRepeatCount.part.7
	b	.L3600
.L3606:
	mov	r0, r4
	bl	IDRMemMarking
	cmp	r0, #0
	beq	.L3609
	mvn	r0, #0
	b	.L3729
.L3773:
	ldr	r3, [r6, #624]
	cmp	r1, #1
	add	r8, r4, #60672
	str	r3, [fp, #-64]
	beq	.L3774
	cmp	r1, #2
	ldreq	r3, [r5, #4016]
	ldreq	r2, [fp, #-64]
	streq	r3, [r2, #796]
	ldreqb	r1, [r5, #3331]	@ zero_extendqisi2
	b	.L3585
.L3771:
	mov	r3, r0
	movw	r2, #4132
	ldr	r1, .L3775+24
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3640
.L3772:
	mov	r3, r0
	mov	r2, #4080
	ldr	r1, .L3775+24
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r7
	movw	r3, #4081
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3759:
	movw	r2, #3894
	ldr	r1, .L3775+60
	bl	dprint_vfmw
	movw	r3, #3895
	mvn	r2, #0
	ldr	r1, .L3775+12
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3656
.L3774:
	ldr	r3, [r5, #4012]
	ldr	r2, [fp, #-64]
	str	r3, [r2, #756]
	ldrb	r1, [r5, #3331]	@ zero_extendqisi2
	b	.L3585
.L3662:
	mov	r1, r8
	b	.L3632
.L3748:
	movw	r3, #3778
	ldr	r2, .L3775+64
	ldr	r1, .L3775+68
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3729
.L3776:
	.align	2
.L3775:
	.word	s_pstVfmwChan
	.word	g_apple_airplay_mirrorinig_flag
	.word	.LC389
	.word	.LC381
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC380
	.word	.LC385
	.word	.LC387
	.word	.LC382
	.word	g_event_report
	.word	.LC386
	.word	.LC384
	.word	.LANCHOR0+340
	.word	.LC390
	.word	.LC388
	.word	.LC383
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	StorePicInDPB, .-StorePicInDPB
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
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
	add	r4, r7, #57344
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
	str	r3, [r4, #3988]
	ldr	r5, [r10, #2140]
	str	ip, [fp, #-84]
	cmp	r5, r6
	str	r1, [fp, #-88]
	str	r6, [fp, #-52]
	str	r6, [fp, #-48]
	beq	.L3793
	add	r2, r2, #4
	mov	r8, #1
	mov	r3, r8, asl r2
	add	r0, r0, r8
	str	r3, [fp, #-80]
	mov	r1, r3
	bl	__aeabi_uidivmod
	str	r6, [r9, #3472]
	str	r6, [r9, #3468]
	mov	r0, #2
	mov	r5, r1
	ldr	r1, .L3796
	bl	dprint_vfmw
	mov	r3, r5
	ldr	r2, [fp, #-60]
	mov	r0, #2
	ldr	r1, .L3796+4
	bl	dprint_vfmw
	sub	r2, fp, #52
	sub	r1, fp, #48
	mov	r0, r7
	bl	GetMaxPOC
	ldr	r3, [fp, #-60]
	cmp	r3, r5
	strne	r6, [fp, #-64]
	movne	r6, r8
	bne	.L3786
	b	.L3785
.L3783:
	mov	r1, r8
	mov	r0, r7
	strb	r8, [r4, #3332]
	bl	StorePicInDPB
	ldr	r1, [fp, #-80]
	subs	r3, r0, #0
	add	r0, r5, #1
	bne	.L3794
	ldr	r3, [fp, #-76]
	str	r5, [r3, #220]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-60]
	cmp	r3, r1
	mov	r5, r1
	beq	.L3785
	ldr	r3, [r10, #2140]
	ldr	r2, [fp, #-64]
	cmp	r2, r3
	bhi	.L3785
.L3786:
	mov	r1, #1
	mov	r0, r7
	bl	AllocFrameStore
	mov	r8, #0
	ldr	r1, .L3796+8
	subs	r3, r0, #0
	mov	r0, #2
	bne	.L3795
	str	r3, [fp, #-56]
	bl	dprint_vfmw
	ldr	r1, [r4, #3984]
	strb	r6, [r4, #3334]
	ldr	r3, [fp, #-68]
	str	r5, [r1, #660]
	ldr	r1, [r4, #3984]
	str	r5, [r4, #3992]
	str	r5, [r1, #712]
	str	r3, [r4, #4000]
	ldr	r1, [r4, #3984]
	ldr	r3, [fp, #-56]
	str	r3, [r1, #708]
	ldr	r1, [r4, #3984]
	str	r6, [r1, #676]
	ldr	r1, [r4, #3984]
	strb	r3, [r1, #4]
	ldr	r1, [r4, #3984]
	strb	r6, [r1]
	ldr	r1, [r4, #3988]
	strb	r6, [r4, #3330]
	strb	r3, [r1, #3]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #3508]
	cmp	r3, #0
	beq	.L3783
	str	r5, [r9, #3484]
	mov	r0, r7
	bl	DecPOC
	ldr	r3, [r9, #3464]
	ldr	r1, [fp, #-48]
	str	r3, [r4, #4004]
	ldr	r3, [r9, #3460]
	str	r3, [r4, #4008]
	ldr	r3, [r9, #3452]
	cmp	r3, r1
	str	r3, [r4, #4012]
	ldr	r3, [r9, #3456]
	str	r3, [r4, #4016]
	bls	.L3783
	cmp	r1, r3
	ldrcc	r3, [fp, #-64]
	addcc	r3, r3, #1
	strcc	r3, [fp, #-64]
	b	.L3783
.L3793:
	ldr	r1, .L3796+12
	mov	r0, r5
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3785:
	ldr	r3, [fp, #-84]
	mov	r0, #0
	ldrb	r2, [fp, #-92]	@ zero_extendqisi2
	str	r3, [r9, #3468]
	ldr	r3, [fp, #-88]
	str	r3, [r9, #3472]
	ldr	r3, [r4, #3988]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3795:
	ldr	r3, [fp, #-84]
	mov	r0, r8
	ldrb	r2, [fp, #-92]	@ zero_extendqisi2
	ldr	r1, .L3796+16
	str	r3, [r9, #3468]
	ldr	r3, [fp, #-88]
	str	r3, [r9, #3472]
	ldr	r3, [r4, #3988]
	strb	r2, [r3, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3794:
	ldr	r2, [fp, #-84]
	mov	r0, r8
	ldrb	lr, [fp, #-92]	@ zero_extendqisi2
	ldr	r1, .L3796+20
	str	r2, [r9, #3468]
	ldr	r2, [fp, #-88]
	str	r2, [r9, #3472]
	movw	r2, #6473
	ldr	ip, [r4, #3988]
	strb	lr, [ip, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3797:
	.align	2
.L3796:
	.word	.LC392
	.word	.LC393
	.word	.LC395
	.word	.LC391
	.word	.LC394
	.word	.LC396
	UNWIND(.fnend)
	.size	DecGap, .-DecGap
	.align	2
	.global	InitPic
	.type	InitPic, %function
InitPic:
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
	subs	r5, r0, #0
	beq	.L3925
	add	r3, r5, #20480
	add	r10, r5, #12288
	str	r3, [fp, #-56]
	mov	r8, #2208
	mov	r2, r3
	ldr	r3, [r10, #1304]
	ldr	r0, [r2, #216]
	add	r4, r5, #57344
	mov	r1, #4000
	ldrb	r2, [r4, #3328]	@ zero_extendqisi2
	mla	r8, r8, r0, r3
	cmp	r2, #0
	ldr	r3, [r10, #1300]
	addeq	r6, r5, #61440
	ldr	r2, [r8, #28]
	mla	r3, r1, r2, r3
	str	r3, [fp, #-60]
	bne	.L3926
.L3801:
	sub	r1, fp, #48
	mov	r0, r5
	bl	GetReRangeFlag
	ldr	r3, [fp, #-60]
	ldr	r2, [r10, #1344]
	ldr	r3, [r3, #36]
	cmp	r2, r3
	mov	r7, r0
	beq	.L3927
.L3804:
	ldr	r3, .L3940
	add	r0, r5, #13568
	ldr	r1, [fp, #-60]
	mov	r2, #0
	add	r0, r0, #28
	strb	r2, [r1, #24]
	mov	r2, #4000
	ldr	r3, [r3, #56]
	blx	r3
.L3805:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L3806
	ldr	r3, [r5]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	beq	.L3806
.L3918:
	add	r7, r5, #16384
.L3807:
	ldr	r2, [r7, #1236]
	ldr	r3, [r8, #24]
	cmp	r2, r3
	bne	.L3815
	ldrb	r3, [r8, #20]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3815
.L3816:
	ldr	r2, [r7, #3444]
	ldr	r3, [r10, #3504]
	cmp	r2, #0
	ldrne	r1, [fp, #-56]
	movne	r2, #0
	strne	r2, [r1, #220]
	strne	r2, [r6, #712]
	ldr	r2, [r6, #2608]
	cmp	r2, #2
	beq	.L3818
	ldr	r9, [r5]
	ldr	r2, [r9, #24]
	sub	r2, r2, #2
	cmp	r2, #1
	bls	.L3818
	ldr	r1, [fp, #-56]
	ldr	r2, [r1, #224]
	ldr	r8, [r1, #220]
	cmp	r2, r8
	str	r2, [fp, #-64]
	beq	.L3819
	mov	r2, #1
	add	r3, r3, #4
	mov	r3, r2, asl r3
	add	r0, r8, r2
	str	r3, [fp, #-68]
	mov	r1, r3
	bl	__aeabi_uidivmod
	ldr	r2, [fp, #-64]
	cmp	r2, r1
	beq	.L3861
	ldr	r2, [r9, #616]
	cmp	r2, #0
	bne	.L3820
	ldr	r2, [r9, #660]
	ldr	r3, [fp, #-68]
	cmp	r2, #1
	beq	.L3928
.L3821:
	ldr	r2, [fp, #-64]
	cmp	r2, r8
	bls	.L3822
	ldr	r1, [fp, #-64]
	ldr	r2, [r7, #484]
	rsb	r8, r8, r1
	cmp	r2, r8
	bcs	.L3820
	ldr	r2, [fp, #-56]
	ldrb	r2, [r2, #208]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L3823
.L3828:
	ldr	r3, [r6, #2676]
	cmp	r3, #0
	bne	.L3820
	mov	r0, r5
	bl	H264_ClearCurrPic
	ldr	r3, .L3940+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3929
.L3829:
	ldr	lr, [r7, #484]
	movw	r2, #6688
	b	.L3921
.L3806:
	ldr	r3, [r6, #2640]
	cmp	r7, #0
	add	r3, r3, #1
	str	r3, [r6, #2640]
	bne	.L3808
	ldr	r3, [r5]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	beq	.L3809
	mov	r0, r5
	bl	FlushDPB
	cmp	r0, #0
	bne	.L3930
.L3917:
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	bne	.L3856
	ldr	r3, [r5]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	bne	.L3918
.L3813:
	add	r7, r5, #16384
	add	r3, r5, #62720
	add	r3, r3, #84
	mov	r0, r5
	ldr	r1, [r7, #484]
	str	r1, [r6, #1368]
	ldr	r2, [r7, #464]
	ldrb	r9, [r10, #1326]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	ip, [r7, #460]
	rsb	r9, r9, #2
	str	r1, [sp]
	mov	r2, r2, asl #4
	add	r1, ip, #1
	mul	r9, r9, r2
	mov	r2, r1, asl #4
	str	r2, [fp, #-64]
	mov	r1, r2
	mov	r2, r9
	bl	H264_ArrangeVahbMem
	cmp	r0, #1
	beq	.L3931
	ldr	r3, [r5]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L3911
	mov	r4, #0
	ldr	r1, .L3940+8
	str	r4, [r10, #1276]
	mov	r0, r4
	str	r4, [r10, #1280]
	bl	dprint_vfmw
	mov	r1, r4
	mov	r0, r5
	bl	ClearAll
	mvn	r0, #0
.L3911:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3926:
	ldr	r3, [r4, #3984]
	cmp	r3, #0
	beq	.L3802
	ldrb	r7, [r3, #1]	@ zero_extendqisi2
	add	r6, r5, #61440
	cmp	r7, #0
	beq	.L3932
.L3803:
	mov	r3, #0
	strb	r3, [r4, #3328]
	b	.L3801
.L3815:
	ldr	r3, .L3940
	add	r0, r5, #17408
	mov	r2, #0
	mov	r1, r8
	strb	r2, [r8, #20]
	add	r0, r0, #188
	ldr	r3, [r3, #56]
	mov	r2, #2208
	blx	r3
	b	.L3816
.L3861:
	ldr	r8, [fp, #-64]
.L3819:
	ldr	r3, [fp, #-56]
	mov	r0, r5
	ldr	r3, [r3, #236]
	cmp	r3, #0
	ldrne	r3, [fp, #-56]
	strne	r8, [r3, #220]
	str	r8, [r7, #3484]
	bl	DecPOC
	mov	r1, #0
	mov	r0, r5
	bl	AllocFrameStore
	cmp	r0, #0
	bne	.L3933
	ldr	lr, [fp, #-56]
	mov	r1, #1
	strb	r0, [r4, #3335]
	mvn	r2, #0
	strb	r1, [r4, #3328]
	ldrb	r3, [lr, #211]	@ zero_extendqisi2
	strb	r3, [r4, #3334]
	ldr	ip, [lr, #224]
	str	ip, [r4, #3992]
	ldr	r3, [lr, #236]
	str	ip, [fp, #-68]
	str	r3, [r4, #4000]
	ldr	ip, [r7, #3464]
	str	r3, [fp, #-64]
	str	ip, [r4, #4004]
	ldr	ip, [r7, #3460]
	str	ip, [r4, #4008]
	ldr	ip, [r7, #3452]
	str	ip, [r4, #4012]
	ldr	ip, [r7, #3456]
	strb	r0, [r4, #3330]
	strb	r0, [r4, #3333]
	strb	r0, [r4, #3332]
	str	r2, [r4, #4048]
	str	ip, [r4, #4016]
	ldrb	r9, [lr, #209]	@ zero_extendqisi2
	cmp	r9, #0
	movne	r2, lr
	movne	r9, r1
	strneb	r1, [r2, #209]
	movne	r1, #2
	ldrb	r8, [r10, #1326]	@ zero_extendqisi2
	ldr	r2, [r7, #464]
	rsb	r8, r8, #2
	mla	r8, r2, r8, r8
	mov	r0, r8
	bl	__aeabi_uidiv
	str	r8, [r4, #4040]
	cmp	r9, #0
	ldr	r3, [fp, #-64]
	movne	r9, #0
	str	r0, [r4, #4036]
	ldr	r1, [r7, #460]
	add	r2, r1, #1
	str	r2, [r4, #4032]
	mul	r2, r2, r0
	str	r2, [r4, #4044]
	ldrb	r2, [r7, #1212]	@ zero_extendqisi2
	strb	r2, [r4, #3336]
	movne	r2, r9
	bne	.L3841
	ldrb	r2, [r10, #1327]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r9, #1
	movne	r2, r9
.L3841:
	cmp	r3, #0
	strb	r2, [r4, #3337]
	str	r9, [r6, #2596]
	movw	r0, #2004
	ldrne	r2, [fp, #-68]
	movw	lr, #61280
	ldrne	r3, [fp, #-56]
	ldr	r1, .L3940+12
	strne	r2, [r3, #220]
	add	r3, r5, #24576
	str	r3, [fp, #-68]
	add	r2, r5, #61184
	ldr	r3, [r3, #1804]
	mov	ip, r2
	add	r2, r2, #96
	mla	r3, r0, r3, r5
	mov	r0, #29
	add	r3, r3, #22272
	add	r3, r3, #100
	str	r3, [r4, #3988]
	ldr	r3, [r5]
	ldrd	r8, [r3, #64]
	strd	r8, [r2, #-8]
	ldrd	r8, [r3, #80]
	strd	r8, [r5, lr]
	ldrd	r8, [r3, #96]
	ldr	lr, [fp, #-60]
	strd	r8, [ip, #104]
	mvn	r9, #0
	ldr	ip, [r3, #112]
	mvn	r8, #0
	str	ip, [r4, #3344]
	ldr	ip, [r3, #116]
	str	ip, [r4, #3348]
	ldr	ip, [r3, #120]
	str	ip, [r4, #3352]
	ldr	ip, [r3, #136]
	str	ip, [r4, #3356]
	ldrb	ip, [r3, #56]	@ zero_extendqisi2
	strb	ip, [r4, #3976]
	ldr	ip, [lr, #44]
	str	ip, [r4, #3512]
	ldr	ip, [lr, #48]
	str	ip, [r4, #3516]
	strd	r8, [r3, #64]
	ldrd	r2, [r2, #-8]
	bl	dprint_vfmw
	movw	r3, #61280
	ldrd	r2, [r3, r5]
	mov	r0, #29
	ldr	r1, .L3940+16
	bl	dprint_vfmw
	ldr	r3, [r7, #460]
	add	r3, r3, #1
	mov	r3, r3, asl #4
	str	r3, [r4, #3412]
	ldrb	r2, [r10, #1326]	@ zero_extendqisi2
	ldr	r1, [r7, #464]
	rsb	r3, r2, #2
	mla	r3, r1, r3, r3
	mov	r3, r3, asl #4
	str	r3, [r4, #3416]
	ldr	r1, [r10, #1348]
	ldr	r3, [r10, #3508]
	subs	r1, r1, #1
	ldr	r9, [r7, #528]
	movne	r1, #1
	cmp	r3, #1
	str	r1, [fp, #-64]
	and	r9, r9, #7
	beq	.L3866
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #256]
	cmp	r3, #0
	bne	.L3866
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #209]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3843
	ldrb	r3, [r10, #1327]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r8, #1
	beq	.L3858
.L3844:
	ldr	r3, .L3940
	add	r0, r5, #60672
	mov	r2, #4
	mov	r1, #0
	add	r0, r0, #80
	ldr	r3, [r3, #48]
	blx	r3
	ldrb	r2, [r4, #3408]	@ zero_extendqisi2
	ldr	r0, [fp, #-64]
	mov	r1, #2
	ldrb	r3, [r4, #3409]	@ zero_extendqisi2
	and	r2, r2, #252
	bfi	r2, r0, #2, #3
	strb	r2, [r4, #3408]
	bfi	r3, r8, #0, #2
	ldr	r0, [r7, #532]
	and	r3, r3, #243
	uxtb	r2, r2
	bfi	r2, r0, #5, #3
	bfi	r3, r1, #4, #2
	strb	r2, [r4, #3408]
	add	r0, r5, #60672
	strb	r3, [r4, #3409]
	add	r0, r0, #16
	ldr	r3, [r4, #3408]
	bfi	r3, r9, #14, #3
	str	r3, [r4, #3408]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, r1
	mov	r1, r9
	ldreqb	r2, [r6, #2732]	@ zero_extendqisi2
	ldreqb	r3, [r6, #2728]	@ zero_extendqisi2
	ubfxeq	ip, r2, #1, #4
	ldrneb	r2, [r6, #2728]	@ zero_extendqisi2
	andeq	r2, r2, #1
	ubfxne	ip, r2, #1, #4
	andne	r2, r2, #1
	bfieq	r3, ip, #1, #4
	bfieq	r3, r2, #0, #1
	streqb	r3, [r6, #2728]
	ldrb	r3, [r4, #3980]	@ zero_extendqisi2
	bfi	r3, ip, #1, #4
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #3980]
	ldrb	r3, [r6, #2732]	@ zero_extendqisi2
	and	r3, r3, #225
	bfc	r3, #0, #1
	strb	r3, [r6, #2732]
	bl	SetAspectRatio
	ldrb	r3, [r4, #3331]	@ zero_extendqisi2
	ldr	r2, [r4, #3984]
	adds	r3, r3, #0
	ldr	r1, [r6, #2640]
	movne	r3, #1
	cmp	r2, #0
	str	r3, [r4, #3396]
	str	r1, [r4, #3500]
	beq	.L3934
	ldr	r3, [r4, #3408]
	ldr	r1, [fp, #-60]
	str	r3, [r2, #80]
	ldr	r3, [r4, #3984]
	ldr	r2, [r4, #3396]
	str	r2, [r3, #68]
	ldr	r3, [r4, #3984]
	ldr	r2, [r4, #3448]
	str	r2, [r3, #120]
	ldr	r3, [r4, #3984]
	ldr	r2, [r4, #3444]
	str	r2, [r3, #116]
	ldr	r3, [r4, #3984]
	ldr	r2, [r4, #3412]
	str	r2, [r3, #84]
	ldr	r3, [r4, #3984]
	ldr	r2, [r4, #3416]
	str	r2, [r3, #88]
	ldr	r3, [r1, #3284]
	ldr	r2, [r4, #3984]
	str	r3, [r2, #100]
	str	r3, [r4, #3428]
	ldr	r2, [r4, #3984]
	ldr	r3, [r1, #3288]
	str	r3, [r2, #104]
	str	r3, [r4, #3432]
	ldr	r2, [r4, #3984]
	ldr	r3, [r1, #3276]
	str	r3, [r2, #92]
	str	r3, [r4, #3420]
	ldr	r2, [r4, #3984]
	ldr	r3, [r1, #3280]
	str	r3, [r2, #96]
	str	r3, [r4, #3424]
	ldr	r3, [r4, #3984]
	ldr	r0, [r6, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L3848
	ldr	r3, [r4, #3396]
	mov	r1, #0
	ldr	r2, [r0, #4]
	subs	r3, r3, r1
	ldr	r0, [r6, #2680]
	movne	r3, #1
	bl	FSP_SetStoreType
.L3848:
	add	r2, r5, #61184
	add	lr, r5, #62720
	ldr	r8, [r6, #1392]
	add	lr, lr, #116
	mov	r0, r2
	add	r2, r2, #40
	add	r0, r0, #72
	mov	r7, #0
.L3852:
	ldr	r3, [r2, #8]!
	cmp	r3, #0
	beq	.L3935
.L3849:
	cmp	r2, r0
	bne	.L3852
	cmp	r8, #0
	beq	.L3854
	ble	.L3854
	add	r7, r8, #15680
	mov	r9, #0
	add	r7, r7, #29
	add	r7, r5, r7, lsl #2
.L3855:
	ldr	r1, [r7, #-4]!
	sub	r8, r8, #1
	ldr	r0, [r6, #2680]
	bl	FreeUsdByDec
	cmp	r8, #0
	str	r9, [r7]
	bne	.L3855
.L3854:
	mov	r0, r5
	mov	r5, #0
	str	r5, [r6, #1392]
	str	r5, [r4, #4020]
	bl	CalcPicNum
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3866:
	mov	r3, #0
.L3843:
	cmp	r2, #1
	beq	.L3858
	adds	r8, r3, #0
	movne	r8, #1
	b	.L3844
.L3823:
	ldr	r2, [fp, #-64]
	mov	r0, r5
	cmp	r2, #0
	ldr	r2, [fp, #-56]
	ldrne	r3, [fp, #-64]
	sub	r3, r3, #1
	str	r3, [r2, #220]
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L3936
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3828
.L3820:
	mov	r0, r5
	bl	DecGap
	cmp	r0, #0
	bne	.L3937
.L3818:
	ldr	r3, [fp, #-56]
	ldr	r8, [r3, #224]
	b	.L3819
.L3927:
	ldr	r3, [fp, #-60]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3805
	b	.L3804
.L3935:
	cmp	r8, #0
	beq	.L3849
	ldr	r1, [r6, #1396]
	subs	r8, r8, #1
	stmia	r2, {r1, r3}
	beq	.L3850
	mov	r1, lr
.L3851:
	add	r3, r3, #1
	ldr	ip, [r1, #4]!
	cmp	r3, r8
	str	ip, [r1, #-4]
	bne	.L3851
.L3850:
	add	r3, r8, #15680
	add	r3, r3, #28
	add	r3, r5, r3, lsl #2
	str	r7, [r3, #4]
	str	r8, [r6, #1392]
	b	.L3849
.L3858:
	ldr	r3, [fp, #-68]
	ldrb	r8, [r3, #1844]	@ zero_extendqisi2
	sub	r8, r8, #3
	cmp	r8, #1
	movhi	r8, #0
	movls	r8, #1
	b	.L3844
.L3809:
	ldr	r1, .L3940+20
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3917
.L3808:
	ldr	r1, .L3940+20
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	beq	.L3813
.L3856:
	mov	r3, r0
	mov	r2, #6592
	ldr	r1, .L3940+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3932:
	ldr	r1, [r3, #656]
	mov	r2, #1
	ldr	r0, [r6, #2680]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #3984]
	strb	r7, [r3, #1]
	ldr	r3, [r4, #3984]
	strb	r7, [r3, #4]
	b	.L3803
.L3931:
	ldr	r3, [fp, #-64]
	mov	r9, r9, lsr #4
	str	r9, [r10, #1280]
	mov	r3, r3, lsr #4
	str	r3, [r10, #1276]
	b	.L3807
.L3822:
	ldr	r2, [fp, #-64]
	ldr	r1, [r7, #484]
	rsb	r2, r8, r2
	add	r2, r2, r3
	cmp	r1, r2
	bcs	.L3820
	ldr	r2, [fp, #-56]
	ldrb	r2, [r2, #208]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L3830
.L3835:
	ldr	r3, [r6, #2676]
	cmp	r3, #0
	bne	.L3820
	mov	r0, r5
	bl	H264_ClearCurrPic
	ldr	r3, .L3940+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3938
.L3836:
	ldr	lr, [r7, #484]
	movw	r2, #6721
.L3921:
	ldr	r3, [fp, #-56]
	mov	r0, #0
	ldr	r1, .L3940+28
	ldr	ip, [r3, #224]
	ldr	r3, [r3, #220]
	str	lr, [sp]
	rsb	r3, r3, ip
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3937:
	movw	r2, #6731
	ldr	r1, .L3940+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3802:
	movw	r3, #6555
	ldr	r2, .L3940+36
	ldr	r1, .L3940+40
	mov	r0, #22
	bl	dprint_vfmw
	add	r6, r5, #61440
	b	.L3803
.L3928:
	ldr	r2, [r9, #656]
	cmp	r2, #0
	bne	.L3821
	ldr	r2, [r9, #664]
	cmp	r2, #0
	bne	.L3821
	ldr	r2, [r9, #620]
	add	r2, r2, #1024
	cmp	r2, #2048
	bhi	.L3820
	b	.L3821
.L3933:
	movw	r2, #6750
	ldr	r1, .L3940+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3830:
	ldr	r2, [fp, #-64]
	mov	r0, r5
	cmp	r2, #0
	ldr	r2, [fp, #-56]
	ldrne	r3, [fp, #-64]
	sub	r3, r3, #1
	str	r3, [r2, #220]
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L3939
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3820
	b	.L3835
.L3934:
	movw	r3, #6872
	ldr	r2, .L3940+36
	ldr	r1, .L3940+48
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3930:
	mov	r3, r0
	movw	r2, #6584
	mov	r0, r7
	ldr	r1, .L3940+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3925:
	movw	r3, #6522
	ldr	r2, .L3940+56
	ldr	r1, .L3940+60
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3936:
	movw	r2, #6672
	ldr	r1, .L3940+52
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3938:
	mov	r0, r5
	bl	ClearDPB
	b	.L3836
.L3929:
	mov	r0, r5
	bl	ClearDPB
	b	.L3829
.L3939:
	movw	r2, #6705
	ldr	r1, .L3940+52
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3911
.L3941:
	.align	2
.L3940:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_apple_airplay_mirrorinig_flag
	.word	.LC399
	.word	.LC403
	.word	.LC404
	.word	.LC406
	.word	.LC398
	.word	.LC400
	.word	.LC401
	.word	.LANCHOR0+356
	.word	.LC397
	.word	.LC402
	.word	.LC405
	.word	.LC363
	.word	.LC8
	.word	.LC9
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
	subs	r4, r0, #0
	beq	.L3992
	add	r5, r4, #61440
	ldr	r1, .L4000
	mov	r0, #22
	add	r6, r4, #20480
	ldr	r2, [r5, #2624]
	sub	r2, r2, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #368]
	ldr	r2, .L4000+4
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	strb	r1, [r6, #211]
	ldr	r3, [r3, #76]
	str	r3, [r6, #236]
	ldr	r3, [r5, #2680]
	ldr	r3, [r2, r3, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L3993
.L3945:
	mov	r0, r4
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L3991
	mov	r0, r4
	bl	ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L3991
	ldr	r2, [r5, #2604]
	cmp	r2, #0
	moveq	r3, r2
	beq	.L3951
	add	r9, r4, #61952
	mov	r3, r0
	add	r9, r9, #236
	mov	r1, r0
	mov	r8, r0
	b	.L3959
.L3994:
	cmp	r7, r1
	add	r3, ip, r3
	rsbhi	r0, r0, r10
	rsbhi	r1, r1, r7
	addhi	r0, r1, r0
	movls	r0, r10
	add	r3, r3, r0
.L3957:
	cmp	lr, #0
	add	r8, r8, #1
	moveq	r1, r7
	moveq	r0, r10
	movne	r1, lr
	movne	r0, ip
	cmp	r8, r2
	beq	.L3951
.L3959:
	ldr	ip, [r9, #4]!
	ldr	r7, [ip, #8]
	ldr	lr, [ip, #36]
	cmp	r7, #0
	ldrne	r10, [ip, #12]
	moveq	r10, r7
	cmp	lr, #0
	ldrne	ip, [ip, #40]
	moveq	ip, lr
	cmp	r1, #0
	bne	.L3994
	add	r3, r10, r3
	add	r3, r3, ip
	b	.L3957
.L3951:
	add	r7, r4, #57344
	str	r3, [r5, #2664]
	movw	r0, #1620
	ldr	ip, [r7, #4036]
	ldr	r1, [r7, #4032]
	mul	r1, r1, ip
	cmp	r1, r0
	movgt	r1, r1, asl #8
	ble	.L3995
.L3961:
	add	r8, r4, #12288
	ldr	r0, [r8, #1284]
	cmp	r0, r2
	bls	.L3962
	cmp	r1, r3
	bcc	.L3962
	ldrb	r3, [r6, #213]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3996
.L3965:
	mov	r0, r4
	bl	PicTypeStatistic
	mov	r0, r4
	bl	DecList
	cmp	r0, #0
	bne	.L3997
	mov	r0, r4
	bl	IsRefListWrong
	subs	r6, r0, #0
	bne	.L3998
	mov	r0, r4
	bl	ExitSlice
	mov	r0, r4
	bl	CalcStreamBits
	mov	r0, r4
	bl	WriteSliceMsg
	ldr	r3, [r5, #2660]
	mov	r0, r6
	mov	r2, #1
	add	r3, r3, r2
	str	r2, [r5, #1372]
	str	r3, [r5, #2660]
.L3944:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3995:
	mov	r0, r1, asl #9
	sub	r1, r0, r1, asl #7
	cmp	r1, #16384
	movlt	r1, #16384
	b	.L3961
.L3996:
	ldr	r1, .L4000+8
	mov	r0, #2
	bl	dprint_vfmw
	ldrb	r3, [r6, #211]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [r5, #2660]
	cmp	r3, #5
	ldr	r3, [r5, #2644]
	mov	r0, r4
	streq	r3, [r5, #2656]
	add	r3, r3, #1
	str	r3, [r5, #2644]
	ldrb	r3, [r7, #3331]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r5, #2648]
	ldrne	r3, [r5, #2652]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r5, #2648]
	strne	r3, [r5, #2652]
	bl	InitPic
	cmn	r0, #2
	beq	.L3944
	cmp	r0, #0
	bne	.L3999
	mov	r0, r4
	bl	WritePicMsg
	b	.L3965
.L3993:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L3945
	ldr	r3, [r3, #164]
	cmp	r3, #2
	bne	.L3945
	mov	r0, r4
	bl	H264_Get_Last_IDR_Frame_Info
	b	.L3945
.L3991:
	ldr	r1, .L4000+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4000+16
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3989
	sub	r2, fp, #44
	mvn	r1, #0
	ldr	r0, [r5, #2680]
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #100
	blx	r6
.L3989:
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L3944
.L3962:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L4000+20
	bl	dprint_vfmw
	ldr	r2, [r8, #1284]
	ldr	r3, [r5, #2604]
	cmp	r3, r2
	bcc	.L3964
	ldr	r1, .L4000+16
	ldr	r6, [r1]
	cmp	r6, #0
	beq	.L3964
	str	r3, [fp, #-52]
	mov	r1, #108
	str	r2, [fp, #-48]
	mov	r3, #8
	sub	r2, fp, #52
	ldr	r0, [r5, #2680]
	blx	r6
.L3964:
	ldr	r1, .L4000+24
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3944
.L3997:
	mov	r2, r0
	ldr	r1, .L4000+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3944
.L3998:
	ldr	r2, [r7, #4004]
	mov	r0, #1
	ldr	r1, .L4000+32
	bl	dprint_vfmw
	b	.L3989
.L3999:
	ldr	r1, .L4000+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3944
.L3992:
	movw	r3, #9029
	ldr	r2, .L4000+40
	ldr	r1, .L4000+44
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3944
.L4001:
	.align	2
.L4000:
	.word	.LC348
	.word	s_pstVfmwChan
	.word	.LC409
	.word	.LC349
	.word	g_event_report
	.word	.LC407
	.word	.LC408
	.word	.LC411
	.word	.LC412
	.word	.LC410
	.word	.LC8
	.word	.LC9
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
	subs	r5, r0, #0
	mov	r6, r1
	beq	.L4138
	ldr	ip, [r5, #368]
	add	r4, r5, #61440
	ldr	r3, [ip, #68]
	cmp	r3, #0
	movne	r1, ip
	movne	r2, #0
	ldrne	r3, [r4, #2664]
	beq	.L4009
.L4008:
	ldr	r0, [r1, #12]
	add	r2, r2, #1
	add	r1, r1, #28
	add	r3, r3, r0
	str	r3, [r4, #2664]
	ldr	r0, [ip, #68]
	cmp	r0, r2
	bhi	.L4008
.L4009:
	mov	r2, #0
	ldr	r3, .L4161
	strb	r2, [ip]
	ldr	r2, [r4, #2680]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L4154
.L4007:
	add	r8, r5, #13504
	mov	r1, #32
	add	r8, r8, #24
	mov	r0, r8
	bl	BsGet
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #32
	str	r3, [r2, #64]
	mov	r7, r0
.L4010:
	ldr	r0, [r5, #368]
	and	r1, r7, #31
	ubfx	r2, r7, #5, #2
	ubfx	r3, r7, #7, #1
	mov	ip, #0
	strb	r1, [r0, #2]
	mov	r0, #22
	ldr	lr, [r5, #368]
	ldr	r1, .L4161+4
	str	r2, [lr, #76]
	ldr	r2, [r5, #368]
	str	r3, [r2, #80]
	str	ip, [r4, #2620]
	ldr	r3, [r5, #368]
	ldr	r2, [r4, #2624]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	bl	dprint_vfmw
	ldr	r3, [r4, #2624]
	movw	r2, #371
	cmp	r3, r2
	beq	.L4155
.L4011:
	add	r3, r3, #1
	str	r3, [r4, #2624]
	ldr	r3, [r5, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #20
	beq	.L4156
.L4012:
	sub	r3, r2, #1
	cmp	r3, #29
	ldrls	pc, [pc, r3, asl #2]
	b	.L4019
.L4021:
	.word	.L4020
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4020
	.word	.L4022
	.word	.L4023
	.word	.L4024
	.word	.L4025
	.word	.L4026
	.word	.L4027
	.word	.L4028
	.word	.L4029
	.word	.L4019
	.word	.L4023
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4030
	.word	.L4020
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4019
	.word	.L4031
.L4154:
	ldr	r2, [r3, #160]
	cmp	r2, #1
	bne	.L4007
	ldr	r2, [r3, #164]
	cmp	r2, #2
	bne	.L4007
	ldr	r3, [r3, #156]
	cmp	r6, #0
	cmpeq	r3, #1
	bne	.L4007
	add	r8, r5, #13504
	mov	r1, #40
	add	r8, r8, #24
	mov	r0, r8
	bl	BsSkip
	mov	r0, r8
	mov	r1, #8
	bl	BsGet
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #48
	str	r3, [r2, #64]
	mov	r7, r0
	b	.L4010
.L4020:
	ldr	r3, [r4, #2636]
	mov	r0, #22
	ldr	r1, .L4161+8
	bl	dprint_vfmw
	ldr	r2, [r5, #368]
	add	r3, r5, #20480
	mov	r0, r5
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	strb	r1, [r3, #211]
	ldr	r2, [r2, #76]
	str	r2, [r3, #236]
	bl	SliceCheck
	subs	r6, r0, #0
	bne	.L4157
	mov	r0, r5
	bl	H264_DecSlice
	cmn	r0, #2
	beq	.L4004
	cmp	r0, #0
	beq	.L4139
	ldr	r3, .L4161+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4138
	ldr	r0, [r4, #2680]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4004
.L4022:
	ldr	r1, .L4161+16
	mov	r2, #6
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	H264_DecSEI
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L4038
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4038:
	cmp	r6, #0
	bne	.L4158
.L4139:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4023:
	ldr	r1, .L4161+20
	mov	r0, #22
	ldr	r3, [r4, #2628]
	bl	dprint_vfmw
	mov	r0, r5
	bl	H264_DecSPS
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L4036
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4036:
	cmp	r6, #0
	bne	.L4159
	ldr	r3, [r4, #2628]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r4, #2628]
	b	.L4004
.L4025:
	ldr	r1, .L4161+24
	mov	r2, #9
.L4149:
	mov	r0, #22
	bl	dprint_vfmw
.L4147:
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4139
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #368]
.L4004:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4026:
	mov	r2, #10
	ldr	r1, .L4161+28
	b	.L4149
.L4024:
	ldr	r1, .L4161+32
	mov	r2, #8
	ldr	r3, [r4, #2632]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	H264_DecPPS
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L4034
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4034:
	cmp	r6, #0
	bne	.L4160
	ldr	r3, [r4, #2632]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r4, #2632]
	b	.L4004
.L4027:
	mov	r2, #11
	ldr	r1, .L4161+36
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	H264_IsEosNal
	cmp	r0, #1
	bne	.L4147
	ldr	r6, .L4161+12
	add	r3, r5, #12288
	strb	r0, [r3, #1272]
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L4041
	mov	r3, #0
	mov	r1, #117
	mov	r2, r3
	ldr	r0, [r4, #2680]
	blx	r7
.L4041:
	mov	r7, #0
	mov	r0, r5
	str	r7, [r5, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L4147
	ldr	r1, [r5, #368]
	cmp	r1, r7
	beq	.L4042
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	str	r7, [r5, #368]
.L4042:
	ldr	r5, [r6]
	cmp	r5, #0
	bne	.L4142
.L4138:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4028:
	mov	r2, #12
	ldr	r1, .L4161+40
	b	.L4149
.L4029:
	mov	r2, #13
	ldr	r1, .L4161+44
	b	.L4149
.L4030:
	mov	r2, #19
	ldr	r1, .L4161+48
	b	.L4149
.L4031:
	mov	r2, #30
	ldr	r1, .L4161+52
	mov	r0, #22
	bl	dprint_vfmw
	mov	r1, #32
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	mov	r7, r0
	mov	r0, r8
	bl	BsGet
	cmp	r6, #0
	mov	r8, r0
	bne	.L4043
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4043
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	str	r6, [r5, #368]
.L4043:
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r8, r2
	cmpeq	r7, r3
	bne	.L4139
	ldr	r6, .L4161+12
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L4044
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #2680]
	blx	r7
.L4044:
	mov	r7, #0
	mov	r0, r5
	str	r7, [r5, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L4139
	ldr	r5, [r6]
	cmp	r5, r7
	beq	.L4138
	ldr	r0, [r4, #2680]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #113
	blx	r5
	b	.L4138
.L4019:
	mov	r3, r7
	ldr	r1, .L4161+56
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r5, #368]
	ldr	r1, .L4161+60
	mov	r0, #0
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	bl	dprint_vfmw
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4045
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4045:
	ldr	r3, .L4161+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4139
.L4143:
	mov	r3, #0
	ldr	r0, [r4, #2680]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	b	.L4139
.L4155:
	ldr	r1, .L4161+64
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #2624]
	b	.L4011
.L4156:
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
	bne	.L4013
	ldrb	r2, [r4, #744]	@ zero_extendqisi2
	ldrb	r3, [r4, #742]	@ zero_extendqisi2
.L4014:
	cmp	r2, #0
	bne	.L4015
	cmp	r3, #1
	beq	.L4016
.L4015:
	ldr	r1, .L4161+68
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4138
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r5, #368]
	b	.L4004
.L4013:
	ubfx	r3, r0, #22, #1
	ubfx	r2, r0, #16, #6
	ubfx	ip, r7, #4, #1
	strb	r3, [r4, #740]
	strb	r2, [r4, #741]
	ubfx	r3, r0, #15, #1
	ubfx	r2, r7, #8, #4
	ubfx	r0, r0, #12, #3
	strb	ip, [r4, #746]
	ubfx	ip, r7, #2, #1
	strb	r0, [r4, #743]
	ubfx	r0, r7, #5, #3
	strb	r3, [r4, #742]
	strb	r0, [r4, #745]
	ubfx	r0, r7, #3, #1
	strb	r2, [r4, #744]
	strb	r0, [r4, #747]
	and	r0, r7, #3
	strb	ip, [r4, #748]
	strb	r0, [r4, #749]
	b	.L4014
.L4157:
	ldr	r1, .L4161+72
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	bl	ClearCurrSlice
	ldr	r3, .L4161+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4138
.L4142:
	mov	r3, #0
	ldr	r0, [r4, #2680]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4004
.L4160:
	ldr	r5, .L4161+12
	mov	r0, #1
	ldr	r2, .L4161+76
	ldr	r1, .L4161+80
	bl	dprint_vfmw
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4138
.L4145:
	sub	r2, fp, #36
	mvn	r7, #0
	mov	r3, #4
	mov	r1, #100
	str	r7, [r2, #-4]!
	ldr	r0, [r4, #2680]
	blx	r6
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L4142
	b	.L4138
.L4159:
	ldr	r5, .L4161+12
	mov	r0, #1
	ldr	r1, .L4161+84
	bl	dprint_vfmw
	ldr	r6, [r5]
	cmp	r6, #0
	bne	.L4145
	b	.L4138
.L4158:
	ldr	r1, .L4161+88
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4161+12
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L4143
	b	.L4139
.L4016:
	ldrb	r3, [r4, #740]	@ zero_extendqisi2
	mov	r0, #22
	cmp	r3, #1
	moveq	r3, #5
	streqb	r3, [r1, #2]
	ldrb	ip, [r4, #745]	@ zero_extendqisi2
	ldreqb	r2, [r4, #744]	@ zero_extendqisi2
	ldrb	r3, [r4, #743]	@ zero_extendqisi2
	ldr	r1, .L4161+92
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r2, r7
	ldr	r1, .L4161+96
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #24
	str	r3, [r2, #64]
	ldr	r3, [r5, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	b	.L4012
.L4162:
	.align	2
.L4161:
	.word	s_pstVfmwChan
	.word	.LC413
	.word	.LC418
	.word	g_event_report
	.word	.LC424
	.word	.LC422
	.word	.LC426
	.word	.LC427
	.word	.LC420
	.word	.LC429
	.word	.LC428
	.word	.LC430
	.word	.LC431
	.word	.LC432
	.word	.LC433
	.word	.LC434
	.word	.LC414
	.word	.LC415
	.word	.LC419
	.word	.LANCHOR0+364
	.word	.LC421
	.word	.LC423
	.word	.LC425
	.word	.LC416
	.word	.LC417
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	subs	r5, r0, #0
	mov	r2, #0
	str	r2, [fp, #-48]
	str	r2, [fp, #-52]
	str	r2, [fp, #-56]
	beq	.L4221
	cmp	r1, #0
	beq	.L4222
	ldr	r0, [r5]
	add	r4, r5, #61440
	ldr	ip, [r4, #1376]
	ldr	r3, [r0, #8]
	cmp	ip, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r4, #2668]
	ldr	r3, [r0]
	str	r3, [r4, #2672]
	ldr	r3, [r0, #4]
	str	r2, [r4, #2620]
	str	r3, [r4, #2676]
	beq	.L4167
	ldr	r3, [r0, #896]
	cmp	r3, #1
	beq	.L4223
.L4168:
	mov	r0, r5
	bl	ReceivePacket
	ldr	r3, [r5, #368]
	str	r3, [r4, #2716]
.L4170:
	cmp	r0, #0
	mov	r0, #0
	str	r0, [r4, #1376]
	beq	.L4224
.L4219:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4223:
	ldr	r3, [r0, #952]
	cmp	r3, #1
	bne	.L4168
	ldr	r3, [r4, #2712]
	cmp	r3, #1
	bne	.L4168
	ldr	r3, [r4, #2716]
	str	r3, [r5, #368]
	str	r2, [r4, #2712]
	str	r2, [r4, #1376]
	b	.L4169
.L4224:
	ldr	r3, [r5, #368]
.L4169:
	mov	r2, #0
	add	r6, r5, #13504
	str	r2, [r3, #64]
	add	r6, r6, #24
	ldr	r3, [r5, #368]
	mov	r0, r6
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #8]
	bl	BsInit
	ldr	r3, .L4232
	ldr	r2, [r4, #2680]
	ldr	ip, [r3, r2, asl #2]
	ldrsb	r7, [ip, #44]
	cmp	r7, #1
	beq	.L4171
.L4173:
	mov	r7, #0
.L4172:
	mov	r1, #32
	mov	r0, r6
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
	str	r0, [r2, #76]
	beq	.L4225
.L4174:
	mov	r0, r5
	bl	FindTrailZeros
	subs	r3, r0, #0
	bne	.L4226
	ldr	r2, [r5, #368]
	mov	r0, r6
	str	r3, [r2, #64]
	ldr	r3, [r5, #368]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	bl	BsInit
	mov	r1, r7
	mov	r0, r5
	bl	H264_DecOneNal
	cmn	r0, #2
	mov	r3, r0
	beq	.L4219
	cmp	r3, #0
	addeq	r5, r5, #57344
	moveq	r0, r3
	streq	r3, [r5, #4060]
	beq	.L4219
	ldr	r1, .L4232+4
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4219
.L4167:
	ldr	r0, [r5, #368]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4170
.L4225:
	cmp	ip, #0
	bne	.L4227
.L4175:
	sub	r2, fp, #40
	sub	r1, fp, #44
	mov	r0, r5
	bl	InquireSliceProperty
	cmp	r0, #0
	beq	.L4228
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4186
	ldr	r0, [r4, #2680]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4186:
	ldr	r3, .L4232+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4220
	mov	r3, #0
	ldr	r0, [r4, #2680]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4219
.L4228:
	ldr	r2, [fp, #-44]
	ldr	r1, [r4, #2692]
	sub	r3, r2, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r3, r1
	str	r3, [r4, #2692]
	bne	.L4229
.L4177:
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L4174
	mov	r0, r5
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L4230
.L4184:
	ldr	r0, [r4, #2680]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L4174
	sub	r3, fp, #48
	sub	r2, fp, #52
	sub	r1, fp, #56
	ldr	r0, [r4, #2680]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5]
	ldr	r3, [r3, #732]
	cmp	r3, #1
	bne	.L4174
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ble	.L4231
.L4181:
	mov	r3, #1
	mvn	r0, #1
	str	r3, [r4, #1376]
	b	.L4219
.L4171:
	ldr	r3, [ip, #164]
	mov	r0, r5
	ldr	r2, [ip, #160]
	ldr	r1, [ip, #156]
	bl	H264_VES_Splitter
	cmp	r0, #3
	beq	.L4172
	cmp	r0, #0
	bne	.L4219
	b	.L4173
.L4227:
	mov	r0, r5
	bl	InquireSliceExtProperty
	b	.L4175
.L4226:
	ldr	r1, .L4232+12
	mov	r0, #22
	bl	dprint_vfmw
.L4220:
	mvn	r0, #0
	b	.L4219
.L4229:
	add	r8, r5, #20480
	ldrb	r3, [r8, #209]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #2696]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #2696]
	ldr	r3, [r4, #2604]
	cmp	r3, #0
	beq	.L4177
	ldr	r3, [r5, #368]
	mov	ip, #0
	mov	r0, r6
	mov	r2, #20
	ldr	r1, .L4232+16
	str	ip, [r3, #64]
	bl	BsInit
	mov	r0, r5
	mov	r1, #1
	bl	H264_DecOneNal
	ldrb	r3, [r8, #209]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #2696]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #2696]
	b	.L4181
.L4230:
	mov	r2, #13120
	ldr	r1, .L4232+20
	mov	r0, #0
	bl	dprint_vfmw
	b	.L4184
.L4221:
	movw	r3, #12999
	ldr	r2, .L4232+24
	ldr	r1, .L4232+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4219
.L4222:
	mov	r0, r1
	movw	r3, #13000
	ldr	r2, .L4232+24
	ldr	r1, .L4232+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4219
.L4231:
	ldr	r3, [fp, #-52]
	cmp	r3, #32
	bgt	.L4181
	ldr	r3, [r5, #360]
	cmp	r3, #0
	bne	.L4181
	ldr	r3, [r4, #2644]
	cmp	r3, #0
	beq	.L4174
	add	r2, r5, #12288
	ldr	r3, [r2, #1276]
	cmp	r3, #0
	beq	.L4174
	ldr	r2, [r2, #1280]
	ldr	r1, [r4, #2720]
	cmp	r2, r1
	beq	.L4174
	ldr	r1, [r4, #2724]
	cmp	r3, r1
	beq	.L4174
	ldr	r1, .L4232+8
	str	r2, [r4, #2720]
	str	r3, [r4, #2724]
	ldr	r8, [r1]
	cmp	r8, #0
	beq	.L4174
	mov	r3, #0
	ldr	r0, [r4, #2680]
	mov	r2, r3
	mov	r1, #120
	blx	r8
	b	.L4174
.L4233:
	.align	2
.L4232:
	.word	s_pstVfmwChan
	.word	.LC436
	.word	g_event_report
	.word	.LC435
	.word	.LANCHOR1+432
	.word	.LC363
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	2
	.global	H264DEC_GetRemainImg
	.type	H264DEC_GetRemainImg, %function
H264DEC_GetRemainImg:
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
	subs	r4, r0, #0
	beq	.L4235
	add	r5, r4, #24576
	ldr	r3, [r5, #2140]
	cmp	r3, #0
	addne	r7, r4, #26368
	movne	r6, #0
	addne	r7, r7, #148
	bne	.L4240
	b	.L4237
.L4239:
	ldr	r3, [r5, #2140]
	cmp	r3, r6
	bls	.L4237
.L4240:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4239
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r5, #2140]
	cmp	r3, r6
	bhi	.L4240
.L4237:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L4237
	mvn	r6, #0
.L4242:
	ldr	r3, [r5, #2140]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	beq	.L4251
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
	mov	r6, r0
	bne	.L4242
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	b	.L4242
.L4251:
	cmp	r6, #0
	moveq	r0, r6
	bne	.L4252
.L4238:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4252:
	add	r0, r4, #8
	bl	GetVoLastImageID
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4235:
	movw	r3, #3235
	ldr	r2, .L4253
	ldr	r1, .L4253+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4238
.L4254:
	.align	2
.L4253:
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	H264DEC_GetRemainImg, .-H264DEC_GetRemainImg
	.align	2
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 16
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
	subs	r4, r0, #0
	mov	r9, r3
	beq	.L4288
	add	r5, r4, #57344
	ldr	r3, [r5, #3984]
	cmp	r3, #0
	beq	.L4289
	ldr	r6, [r4, #360]
	ldr	r2, [r4]
	cmp	r6, #0
	ldr	r8, [r2, #644]
	beq	.L4290
	ldrb	r2, [r6, #17]	@ zero_extendqisi2
	strb	r2, [r3, #5]
	ldrb	r2, [r6, #4]	@ zero_extendqisi2
	str	r2, [r3, #8]
	ldr	r7, [r4, #364]
	cmp	r7, #0
	bne	.L4260
	ldr	r3, [fp, #4]
	str	r1, [r5, #4028]
	cmp	r3, #0
	beq	.L4261
	ldr	r3, [fp, #8]
	ldr	r1, [fp, #8]
	ldr	r2, .L4295
	mov	r3, r3, asl #6
	sub	r3, r3, r1, asl #3
	add	r3, r3, r2
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L4291
	cmp	r3, #1
	beq	.L4261
.L4263:
	cmp	r8, #1
	beq	.L4292
.L4264:
	mov	r1, r9
	mov	r0, r4
	bl	StorePicInDPB
	cmp	r0, #1
	mov	r6, r0
	bls	.L4274
	ldr	r3, [r5, #3984]
	add	r1, r4, #61440
	mov	r2, #1
	mvn	r7, #0
	ldr	r0, [r1, #2680]
	ldr	r1, [r3, #656]
	bl	FSP_ClearLogicFs
	mov	r2, r6
	ldr	r1, .L4295+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	mov	r3, #0
	str	r3, [r5, #3984]
.L4257:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4289:
	mov	r0, r3
	ldr	r2, .L4295+8
	movw	r3, #13270
	ldr	r1, .L4295+12
	bl	dprint_vfmw
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4260:
	str	r1, [r5, #4028]
	bl	ClearAllSlice
	mov	r1, r9
	mov	r0, r4
	bl	StorePicInDPB
	subs	r2, r0, #0
	bne	.L4293
.L4275:
	mov	r0, r4
	bl	FlushDPB
	subs	r2, r0, #0
	bne	.L4294
.L4276:
	add	r1, r4, #61440
	add	r2, r4, #12288
	mov	r3, #0
	add	r4, r4, #20480
	str	r3, [r1, #1372]
	mov	r7, r3
	ldr	r1, [r2, #1292]
	movw	r2, #23352
	strb	r3, [r4, #1848]
	movt	r2, 1
	str	r3, [r4, #1880]
	mov	lr, #2
	str	r1, [r4, #1856]
	mov	ip, #7
	str	r3, [r4, #1884]
	mov	r0, #32
	str	r2, [r4, #1864]
	mov	r1, #3
	mvn	r2, #0
	mov	r3, #262144
	strb	r0, [r4, #1850]
	mov	r0, r7
	strb	lr, [r4, #1849]
	str	ip, [r4, #1860]
	str	r1, [r4, #1872]
	str	r2, [r4, #1876]
	str	r3, [r4, #1888]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4261:
	mov	r0, r4
	bl	ClearAllSlice
	b	.L4263
.L4288:
	movw	r3, #13269
	ldr	r2, .L4295+8
	ldr	r1, .L4295+12
	mvn	r7, #0
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4274:
	add	r4, r4, #61440
	mov	r3, #1
	str	r3, [r4, #1372]
	b	.L4257
.L4292:
	ldr	r6, [r4, #360]
	ldr	r3, [r6, #316]
	add	r3, r3, #146
	ldr	r10, [r6, r3, asl #2]
	mov	r0, r10
	bl	MEM_Phy2Vir
	ldr	r2, [r6, #36]
	ldr	ip, [r6, #44]
	mov	r1, r10
	ldr	r3, .L4295+16
	mul	r2, ip, r2
	ldr	r3, [r3, #140]
	mov	r6, r2
	str	r2, [fp, #-48]
	mov	r2, r2, asl #2
	mov	r8, r0
	blx	r3
	cmp	r6, #0
	mov	r2, r6
	beq	.L4277
	mov	r0, #0
	sub	lr, r8, #4
	str	r7, [fp, #-52]
	mov	r8, r0
	mov	r3, r0
	mvn	r6, #-2147483648
	mov	r7, r0
	mov	r10, r2
	str	r4, [fp, #-56]
.L4271:
	ldr	r2, [lr, #4]!
	add	r3, r3, #1
	ubfx	ip, r2, #0, #14
	ubfx	r1, r2, #0, #13
	mov	r2, r2, asr #14
	tst	ip, #8192
	rsb	r4, ip, #0
	ubfx	ip, r2, #0, #12
	ubfxne	r1, r4, #0, #13
	rsb	ip, ip, #0
	tst	r2, #2048
	ubfx	r2, r2, #0, #11
	ubfxne	r2, ip, #0, #11
	add	r2, r1, r2
	cmp	r6, r2
	add	r0, r0, r2
	movge	r6, r2
	cmp	r8, r2
	movlt	r8, r2
	cmp	r2, #0
	addeq	r7, r7, #1
	cmp	r3, r10
	bne	.L4271
	mov	r3, r7
	mov	r10, #100
	mul	r3, r10, r3
	ldr	r4, [fp, #-56]
	ldr	r7, [fp, #-52]
	str	r3, [fp, #-52]
.L4265:
	ldr	r1, [fp, #-48]
	bl	__aeabi_uidiv
	ldr	r1, [fp, #-48]
	mov	r10, r0
	ldr	r0, [fp, #-52]
	bl	__aeabi_uidiv
	ldr	r1, [r5, #3984]
	cmp	r0, #100
	moveq	r6, #0
	cmp	r1, #0
	beq	.L4273
	ldr	r2, [r1, #260]
	cmp	r2, r8
	movcc	r2, r8
	str	r2, [r1, #260]
	ldr	r1, [r5, #3984]
	ldr	r2, [r1, #264]
	cmp	r2, r6
	movcc	r2, r6
	str	r2, [r1, #264]
	ldr	r2, [r5, #3984]
	str	r10, [r2, #268]
	ldr	r2, [r5, #3984]
	str	r0, [r2, #272]
	ldr	r2, [r5, #3984]
	ldr	r1, [r2, #260]
	str	r1, [r5, #3588]
	ldr	r1, [r2, #264]
	str	r10, [r5, #3596]
	str	r1, [r5, #3592]
	ldr	r3, [r2, #272]
	str	r3, [r5, #3600]
	b	.L4264
.L4293:
	ldr	r1, .L4295+20
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4275
.L4294:
	ldr	r1, .L4295+24
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4276
.L4291:
	bl	ClearAllSlice
	b	.L4257
.L4273:
	mov	r0, r1
	ldr	r1, .L4295+28
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L4257
.L4290:
	ldr	r2, .L4295+32
	mov	r0, #1
	ldr	r1, .L4295+36
	mvn	r7, #0
	bl	dprint_vfmw
	mov	r2, r7
	ldr	r1, .L4295+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	str	r6, [r5, #3984]
	b	.L4257
.L4277:
	ldr	r8, [fp, #-48]
	mvn	r6, #-2147483648
	str	r8, [fp, #-52]
	mov	r0, r8
	b	.L4265
.L4296:
	.align	2
.L4295:
	.word	g_VdmDrvParam+40
	.word	.LC438
	.word	.LC8
	.word	.LC9
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC440
	.word	.LC441
	.word	.LC439
	.word	.LANCHOR0+380
	.word	.LC437
	UNWIND(.fnend)
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	2
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
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
	subs	r6, r0, #0
	beq	.L4339
	add	r5, r6, #61440
	ldr	r7, [r5, #1364]
	cmp	r7, #0
	beq	.L4301
	add	r3, r6, #57344
	ldrb	r3, [r3, #3328]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4301
	add	r4, r6, #27392
	add	r9, r6, #26368
	add	r9, r9, #152
	add	r8, r6, #24576
	mov	r0, r4
	mov	lr, #0
.L4307:
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4302
	cmp	r0, #0
	beq	.L4303
	ldr	ip, [r8, #2140]
	cmp	ip, #0
	beq	.L4303
	ldr	r2, [r8, #1944]
	cmp	r2, r0
	beq	.L4302
	mov	r2, r9
	b	.L4304
.L4305:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L4302
.L4304:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L4305
.L4303:
	ldr	r0, [r5, #2680]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L4301
	cmn	r0, #1
	beq	.L4340
.L4337:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4301:
	mov	r0, #1
.L4335:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4302:
	add	lr, lr, #1
	add	r0, r0, #832
	cmp	lr, r7
	bne	.L4307
	sub	r2, fp, #40
	sub	r1, fp, #44
	add	r0, r6, #8
	bl	GetQueueImgNum
	ldr	r1, .L4342
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, .L4342+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #1364]
	cmp	r3, #0
	addne	r9, r6, #26368
	addne	r8, r6, #24576
	addne	r9, r9, #152
	movne	r7, #0
	beq	.L4341
.L4308:
	cmp	r4, #0
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	ldrb	lr, [r4, #4]	@ zero_extendqisi2
	beq	.L4318
	ldr	ip, [r8, #2140]
	cmp	ip, #0
	beq	.L4318
	ldr	r2, [r8, #1944]
	cmp	r4, r2
	beq	.L4320
	mov	r1, r9
	mov	r2, #0
	b	.L4312
.L4313:
	ldr	r0, [r1, #4]!
	cmp	r4, r0
	beq	.L4320
.L4312:
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L4313
.L4318:
	mov	r2, #1
.L4311:
	str	r2, [sp, #4]
	mov	r0, #0
	mov	r2, r7
	str	lr, [sp]
	ldr	r1, .L4342+8
	add	r7, r7, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #1364]
	add	r4, r4, #832
	cmp	r3, r7
	bhi	.L4308
.L4314:
	ldr	r3, [fp, #-40]
	mov	r0, #0
	ldr	r2, [fp, #-44]
	ldr	r1, .L4342+12
	bl	dprint_vfmw
	ldr	r3, [r5, #1364]
	ldr	r0, [r8, #2140]
	ldr	r2, [fp, #-44]
	sub	r3, r3, #2
	ldr	r1, [fp, #-40]
	rsb	r3, r0, r3
	add	r2, r2, r1
	cmp	r2, r3
	bge	.L4337
	ldr	r1, .L4342+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4320:
	mov	r2, #0
	b	.L4311
.L4340:
	add	r1, r6, #8
	ldr	r0, [r5, #2680]
	bl	FSP_ClearNotInVoQueue
	b	.L4337
.L4341:
	add	r8, r6, #24576
	b	.L4314
.L4339:
	movw	r3, #13512
	ldr	r2, .L4342+20
	ldr	r1, .L4342+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4335
.L4343:
	.align	2
.L4342:
	.word	.LC442
	.word	.LC443
	.word	.LC445
	.word	.LC444
	.word	.LC446
	.word	.LC8
	.word	.LC9
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
	.type	__func__.13732, %object
	.size	__func__.13732, 23
__func__.13732:
	.ascii	"RemoveFrameStoreOutDPB\000"
	.space	1
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
	.type	__func__.14971, %object
	.size	__func__.14971, 13
__func__.14971:
	.ascii	"Scaling_List\000"
	.space	3
	.type	__func__.15014, %object
	.size	__func__.15014, 12
__func__.15014:
	.ascii	"H264_DecPPS\000"
	.type	SarTable.15061, %object
	.size	SarTable.15061, 136
SarTable.15061:
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
	.type	__func__.15224, %object
	.size	__func__.15224, 12
__func__.15224:
	.ascii	"H264_DecSEI\000"
	.type	__func__.14029, %object
	.size	__func__.14029, 8
__func__.14029:
	.ascii	"InitDPB\000"
	.type	__FUNCTION__.15375, %object
	.size	__FUNCTION__.15375, 13
__FUNCTION__.15375:
	.ascii	"H264DEC_Init\000"
	.space	3
	.type	__func__.15406, %object
	.size	__func__.15406, 18
__func__.15406:
	.ascii	"H264_VES_Splitter\000"
	.space	2
	.type	__func__.14112, %object
	.size	__func__.14112, 13
__func__.14112:
	.ascii	"DirectOutput\000"
	.space	3
	.type	__func__.14223, %object
	.size	__func__.14223, 14
__func__.14223:
	.ascii	"StorePicInDPB\000"
	.space	2
	.type	__FUNCTION__.14691, %object
	.size	__FUNCTION__.14691, 8
__FUNCTION__.14691:
	.ascii	"InitPic\000"
	.type	__func__.15292, %object
	.size	__func__.15292, 15
__func__.15292:
	.ascii	"H264_DecOneNal\000"
	.space	1
	.type	__func__.15485, %object
	.size	__func__.15485, 26
__func__.15485:
	.ascii	"H264DEC_GetCurImageFormat\000"
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
	ASCII(.ascii	"%-50s%50d\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"../../core/syntax/h264.c\000" )
	.space	3
.LC9:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"%s DPB.fs[%d] = NULL\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"frame %d, state=%d, is already output\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\012" )
	ASCII(.ascii	"\000" )
.LC15:
	ASCII(.ascii	"not used frame: (%d,%d)\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"frame skip: is_used=%d,skip=%d\012\000" )
.LC17:
	ASCII(.ascii	"topfield skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"bottom field skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"exg_pts: %lld <-> %lld\012\000" )
.LC21:
	ASCII(.ascii	"stream frame packing type is %d! what can we do?\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC22:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%" )
	ASCII(.ascii	"p, pdfs=%p)\012\000" )
.LC24:
	ASCII(.ascii	"pH264Ctx->DPB.fs[%d]: frame_num=%d poc=%d is_refere" )
	ASCII(.ascii	"nce=%d\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"pH264Ctx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_re" )
	ASCII(.ascii	"ference=%d\012\000" )
	.space	1
.LC26:
	ASCII(.ascii	"pH264Ctx->DPB.fs_ref[%d]: frame.poc=%d \012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC28:
	ASCII(.ascii	"resolution error, ImageWidth=%d, ImageHeight=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC29:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance fail!\012\000" )
	.space	3
.LC31:
	ASCII(.ascii	"slice_type %d invalid, clear current slice.\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"pRepairPic(%p)/found(%d) = 0, clear current slice.\012" )
	ASCII(.ascii	"\000" )
.LC33:
	ASCII(.ascii	"listXsize[%d] = %d, clear current slice.\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"for P slice size of list equal 0.\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"for B slice size of two list all equal 0.\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"init list error.\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"L0: list after init.\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"L0: list after reorder.\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC40:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC42:
	ASCII(.ascii	"line: %d pstLogicFs is null\012\000" )
	.space	3
.LC43:
	ASCII(.ascii	"SH: first_mb_in_slice\000" )
	.space	2
.LC44:
	ASCII(.ascii	"slicecheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC e" )
	ASCII(.ascii	"rror.\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"SH: slice_type\000" )
	.space	1
.LC46:
	ASCII(.ascii	"slice type = %d\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"slice type = %d, err\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"slice  pps id = %d\012\000" )
.LC49:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"sps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC51:
	ASCII(.ascii	"tmp slice  pps id = %d\012\000" )
.LC52:
	ASCII(.ascii	"PPSSPSCheckTmpId: pps with this pic_parameter_set_i" )
	ASCII(.ascii	"d = %d havn't decode\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"PPSSPSCheckTmpId: seq_parameter_set_id out of range" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC54:
	ASCII(.ascii	"PPSSPSCheckTmpId: sps with this pic_parameter_set_i" )
	ASCII(.ascii	"d = %d havn't decode\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"new pic flag = %d\012\000" )
	.space	1
.LC56:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l0\000" )
.LC57:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l0\000" )
	.space	2
.LC58:
	ASCII(.ascii	"reorder idc l0 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC59:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l0\000" )
	.space	1
.LC60:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC61:
	ASCII(.ascii	"SH: long_term_pic_idx_l0\000" )
	.space	3
.LC62:
	ASCII(.ascii	"num of idc l0 exceed\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l1\000" )
.LC64:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l1\000" )
	.space	2
.LC65:
	ASCII(.ascii	"reorder idc l1 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC66:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l1\000" )
	.space	1
.LC67:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC68:
	ASCII(.ascii	"SH: long_term_pic_idx_l1\000" )
	.space	3
.LC69:
	ASCII(.ascii	"num of idc l1 exceed\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"SH: luma_log2_weight_denom\000" )
	.space	1
.LC71:
	ASCII(.ascii	"SH: chroma_log2_weight_denom\000" )
	.space	3
.LC72:
	ASCII(.ascii	"WP log2 exceed  and err flag = %d\012\000" )
	.space	1
.LC73:
	ASCII(.ascii	"SH: luma_weight_flag_l0\000" )
.LC74:
	ASCII(.ascii	"SH: luma_weight_l0\000" )
	.space	1
.LC75:
	ASCII(.ascii	"SH: luma_offset_l0\000" )
	.space	1
.LC76:
	ASCII(.ascii	"SH: chroma_weight_flag_l0\000" )
	.space	2
.LC77:
	ASCII(.ascii	"SH: chroma_weight_l0\000" )
	.space	3
.LC78:
	ASCII(.ascii	"SH: chroma_offset_l0\000" )
	.space	3
.LC79:
	ASCII(.ascii	"SH: luma_weight_flag_l1\000" )
.LC80:
	ASCII(.ascii	"SH: luma_weight_l1\000" )
	.space	1
.LC81:
	ASCII(.ascii	"SH: luma_offset_l1\000" )
	.space	1
.LC82:
	ASCII(.ascii	"SH: chroma_weight_flag_l1\000" )
	.space	2
.LC83:
	ASCII(.ascii	"SH: chroma_weight_l1\000" )
	.space	3
.LC84:
	ASCII(.ascii	"SH: chroma_offset_l1\000" )
	.space	3
.LC85:
	ASCII(.ascii	"overflow MAX_MMCO_LEN\012\000" )
	.space	1
.LC86:
	ASCII(.ascii	"SH: memory_management_control_operation\000" )
.LC87:
	ASCII(.ascii	"SH: difference_of_pic_nums_minus1\000" )
	.space	2
.LC88:
	ASCII(.ascii	"SH: long_term_pic_num\000" )
	.space	2
.LC89:
	ASCII(.ascii	"SH: long_term_frame_idx\000" )
.LC90:
	ASCII(.ascii	"SH: max_long_term_frame_idx_plus1\000" )
	.space	2
.LC91:
	ASCII(.ascii	"mmco exceed 6\012\000" )
	.space	1
.LC92:
	ASCII(.ascii	"SH: no_output_of_prior_pics_flag\000" )
	.space	3
.LC93:
	ASCII(.ascii	"SH: long_term_reference_flag\000" )
	.space	3
.LC94:
	ASCII(.ascii	"IDR and no_output_of_prior_pics_flag = %d\012\000" )
	.space	1
.LC95:
	ASCII(.ascii	"SH: adaptive_ref_pic_marking_mode_flag\000" )
	.space	1
.LC96:
	ASCII(.ascii	"adaptive_ref_pic_marking_mode_flag = %d\012\000" )
	.space	3
.LC97:
	ASCII(.ascii	"MMCO para would save dec err\012\000" )
	.space	2
.LC98:
	ASCII(.ascii	"mulitislice diff no_out_of_prior_pics_flag, used fi" )
	ASCII(.ascii	"rst.\012\000" )
	.space	3
.LC99:
	ASCII(.ascii	"mulitislice diff long_term_reference_flag, used fir" )
	ASCII(.ascii	"st.\012\000" )
.LC100:
	ASCII(.ascii	"mulitislice diff adaptive_ref_pic_marking_mode_flag" )
	ASCII(.ascii	", used first.\012\000" )
	.space	2
.LC101:
	ASCII(.ascii	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\012\000" )
	.space	1
.LC102:
	ASCII(.ascii	"SH: pic_parameter_set_id\000" )
	.space	3
.LC103:
	ASCII(.ascii	"pps id:%d in sliceheader err\012\000" )
	.space	2
.LC104:
	ASCII(.ascii	"PPS or SPS of this slice not valid\012\000" )
.LC105:
	ASCII(.ascii	"recover point but isn't I_SLICE.\012\000" )
	.space	2
.LC106:
	ASCII(.ascii	"SH: frame_num\000" )
	.space	2
.LC107:
	ASCII(.ascii	"IDR NAL but frame_num!=0.\012\000" )
	.space	1
.LC108:
	ASCII(.ascii	"SH: field_pic_flag\000" )
	.space	1
.LC109:
	ASCII(.ascii	"SH: bottom_field_flag\000" )
	.space	2
.LC110:
	ASCII(.ascii	"field first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC111:
	ASCII(.ascii	"frame first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC112:
	ASCII(.ascii	"SH: idr_pic_id\000" )
	.space	1
.LC113:
	ASCII(.ascii	"idr_pic_id bigger than 65535\012\000" )
	.space	2
.LC114:
	ASCII(.ascii	"SH: pic_order_cnt_lsb\000" )
	.space	2
.LC115:
	ASCII(.ascii	"SH: delta_pic_order_cnt_bottom\000" )
	.space	1
.LC116:
	ASCII(.ascii	"SH: delta_pic_order_cnt[0]\000" )
	.space	1
.LC117:
	ASCII(.ascii	"SH: delta_pic_order_cnt[1]\000" )
	.space	1
.LC118:
	ASCII(.ascii	"SH: redundant_pic_cnt\000" )
	.space	2
.LC119:
	ASCII(.ascii	"redundant pic not support.\012\000" )
.LC120:
	ASCII(.ascii	"first_mb_in_slice in currslice small than prevslice" )
	ASCII(.ascii	" in same pic\012\000" )
	.space	3
.LC121:
	ASCII(.ascii	"SH: direct_spatial_mv_pred_flag\000" )
.LC122:
	ASCII(.ascii	"SH: num_ref_idx_override_flag\000" )
	.space	2
.LC123:
	ASCII(.ascii	"SH: num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC124:
	ASCII(.ascii	"SH: num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC125:
	ASCII(.ascii	"frame num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC126:
	ASCII(.ascii	"field num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"reordering para dec err\012\000" )
	.space	3
.LC128:
	ASCII(.ascii	"apply_weights_flag=%d\012\000" )
	.space	1
.LC129:
	ASCII(.ascii	"wpt dec err\012\000" )
	.space	3
.LC130:
	ASCII(.ascii	"mark para dec err\012\000" )
	.space	1
.LC131:
	ASCII(.ascii	"SH: cabac_init_idc\000" )
	.space	1
.LC132:
	ASCII(.ascii	"cabac_init_idc bigger than 3\012\000" )
	.space	2
.LC133:
	ASCII(.ascii	"SH: slice_qp_delta\000" )
	.space	1
.LC134:
	ASCII(.ascii	"SH: disable_deblocking_filter_idc\000" )
	.space	2
.LC135:
	ASCII(.ascii	"disable_deblocking_filter_idc dec err\012\000" )
	.space	1
.LC136:
	ASCII(.ascii	"SH: slice_alpha_c0_offset_div2\000" )
	.space	1
.LC137:
	ASCII(.ascii	"slice_alpha_c0_offset_div2 dec err\012\000" )
.LC138:
	ASCII(.ascii	"SH: slice_beta_offset_div2\000" )
	.space	1
.LC139:
	ASCII(.ascii	"slice_beta_offset_div2 dec err\012\000" )
.LC140:
	ASCII(.ascii	"pH264Ctx->pCurrNal->nal_bitoffset = %d; code_len_by" )
	ASCII(.ascii	"te = %d; bitstream_length = %d; pH264Ctx->pCurrNal-" )
	ASCII(.ascii	">nal_trail_zero_bit_num = %d\012\000" )
.LC141:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; byt" )
	ASCII(.ascii	"espos = %x\012\000" )
	.space	1
.LC142:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC143:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\012\000" )
.LC144:
	ASCII(.ascii	": delta_sl\000" )
	.space	1
.LC145:
	ASCII(.ascii	"%s, %d: integer operation overflow\012\000" )
.LC146:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC147:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC148:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC149:
	ASCII(.ascii	"Baseline stream with FMO, not support.\012\000" )
.LC150:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC151:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC152:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC153:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC154:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC155:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC156:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC157:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC158:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC159:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC160:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC161:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC162:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC163:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC164:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC165:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC166:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC167:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC168:
	ASCII(.ascii	"Scaling_List failed\012\000" )
	.space	3
.LC169:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC170:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC171:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC172:
	ASCII(.ascii	"pic_parameter_set_id out of range.\012\000" )
.LC173:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC174:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC175:
	ASCII(.ascii	"SPS haven't decode.\012\000" )
	.space	3
.LC176:
	ASCII(.ascii	"%s: PPS decode error 1.\012\000" )
	.space	3
.LC177:
	ASCII(.ascii	"%s: PPS decode error 2.\012\000" )
	.space	3
.LC178:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC179:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC180:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC181:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC182:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC183:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC184:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC185:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC186:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC187:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC188:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC189:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC190:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC191:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC192:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC193:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC194:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC195:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC196:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC197:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC198:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC199:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC200:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC201:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC202:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC203:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC204:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC205:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC206:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC207:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC208:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC209:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC210:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC211:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC212:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC213:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC214:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC215:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC216:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC217:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC218:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC219:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC220:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC221:
	ASCII(.ascii	"dar=%d, final_dar=%d\012\000" )
	.space	2
.LC222:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC223:
	ASCII(.ascii	"pSPS->chroma_format_idc = %d out of range.\012\000" )
.LC224:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC225:
	ASCII(.ascii	"bit_depth_luma(%d) not equal 8.\012\000" )
	.space	3
.LC226:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC227:
	ASCII(.ascii	"bit_depth_chroma(%d) not equal 8.\012\000" )
	.space	1
.LC228:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC229:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC230:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC231:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC232:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC233:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC234:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC235:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC236:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC237:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC238:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC239:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC240:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC241:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC242:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC243:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC244:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC245:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC246:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC247:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC248:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC249:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC250:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC251:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC252:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC253:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC254:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC255:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC256:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC257:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC258:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC259:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC260:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC261:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC262:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC263:
	ASCII(.ascii	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_" )
	ASCII(.ascii	"present_flag\000" )
.LC264:
	ASCII(.ascii	"inter_layer_present_flag:%d!\012\000" )
	.space	2
.LC265:
	ASCII(.ascii	"SPS_SVC_EXT: extended_spatial_scalability_idc\000" )
	.space	2
.LC266:
	ASCII(.ascii	"spatial scalability not support!!\012\000" )
	.space	1
.LC267:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_x_plus1_flag\000" )
	.space	1
.LC268:
	ASCII(.ascii	"chroma_phase_x_plus1_flag:%d!!\012\000" )
.LC269:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_y_plus1\000" )
	.space	2
.LC270:
	ASCII(.ascii	"chroma_phase_y_plus1:%d!\012\000" )
	.space	2
.LC271:
	ASCII(.ascii	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag\000" )
	.space	2
.LC272:
	ASCII(.ascii	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag\000" )
	.space	1
.LC273:
	ASCII(.ascii	"adaptive_tcoeff_level_prediction_flag:%d!\012\000" )
	.space	1
.LC274:
	ASCII(.ascii	"SPS_SVC_EXT: slice_header_restriction_flag\000" )
	.space	1
.LC275:
	ASCII(.ascii	"slice_header_restriction_flag error:%d,%x,%d\012\000" )
	.space	2
.LC276:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC277:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC278:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC279:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC280:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC281:
	ASCII(.ascii	"SPS: reserved_zero_4bits\000" )
	.space	3
.LC282:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC283:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC284:
	ASCII(.ascii	"Baseline stream, try to decode, exit when FMO occur" )
	ASCII(.ascii	"red.\012\000" )
	.space	3
.LC285:
	ASCII(.ascii	"EXTENDED stream, try to decode, exit when dataparti" )
	ASCII(.ascii	"tion occurred.\012\000" )
	.space	1
.LC286:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC287:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC288:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC289:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC290:
	ASCII(.ascii	"svc ext error:\012\000" )
.LC291:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC292:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC293:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC294:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC295:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC296:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC297:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC298:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC299:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC300:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC301:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC302:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC303:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC304:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC305:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC306:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC307:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC308:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC309:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC310:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC311:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC312:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC313:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC314:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC315:
	ASCII(.ascii	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC316:
	ASCII(.ascii	"PassBytes err [%s][%d]\012\000" )
.LC317:
	ASCII(.ascii	"SEI_PIC_TIMING,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC318:
	ASCII(.ascii	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC319:
	ASCII(.ascii	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC320:
	ASCII(.ascii	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, pa" )
	ASCII(.ascii	"yload_size = %d \012\000" )
	.space	3
.LC321:
	ASCII(.ascii	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_si" )
	ASCII(.ascii	"ze = %d \012\000" )
	.space	3
.LC322:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC323:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC324:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC325:
	ASCII(.ascii	"len_tmp = %d cann't dec usrdata\012\000" )
	.space	3
.LC326:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC327:
	ASCII(.ascii	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC328:
	ASCII(.ascii	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC329:
	ASCII(.ascii	"SEI_SPARE_PIC,offset = %d,payload_size = %d \012\000" )
	.space	2
.LC330:
	ASCII(.ascii	"SEI_SCENE_INFO,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC331:
	ASCII(.ascii	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC332:
	ASCII(.ascii	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC333:
	ASCII(.ascii	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC334:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC335:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_s" )
	ASCII(.ascii	"ize = %d \012\000" )
	.space	2
.LC336:
	ASCII(.ascii	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = " )
	ASCII(.ascii	"%d \012\000" )
.LC337:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC338:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC339:
	ASCII(.ascii	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC340:
	ASCII(.ascii	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_" )
	ASCII(.ascii	"size = %d \012\000" )
	.space	1
.LC341:
	ASCII(.ascii	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC342:
	ASCII(.ascii	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC343:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC344:
	ASCII(.ascii	"\012the stream is error,len:%d\012\000" )
	.space	3
.LC345:
	ASCII(.ascii	"\012\012END of the bit buffer, copy the first packe" )
	ASCII(.ascii	"t!\012\012\000" )
	.space	2
.LC346:
	ASCII(.ascii	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\012\000" )
	.space	3
.LC347:
	ASCII(.ascii	"0:phy:0x%x, len0:%d\012\000" )
	.space	3
.LC348:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC349:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC350:
	ASCII(.ascii	"H264Dec destroy\012\000" )
	.space	3
.LC351:
	ASCII(.ascii	"H264 recycle image\012\000" )
.LC352:
	ASCII(.ascii	"pH264Ctx is %p, pFrameStore is %p\012\000" )
	.space	1
.LC353:
	ASCII(.ascii	"line; %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC354:
	ASCII(.ascii	"InsertVO err:%d, ClearAll\012\000" )
	.space	1
.LC355:
	ASCII(.ascii	"H264.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC356:
	ASCII(.ascii	"line: %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC357:
	ASCII(.ascii	"[%s][%d] OutputFrmToVO return %d\012\000" )
	.space	2
.LC358:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC359:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC360:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC361:
	ASCII(.ascii	"%s %d unknow error!!\012\000" )
	.space	2
.LC362:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC363:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC364:
	ASCII(.ascii	"[%s %d], pos is %d out of range\012\000" )
	.space	3
.LC365:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC366:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC367:
	ASCII(.ascii	"----------------- Imode -> %d ------------------\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC368:
	ASCII(.ascii	"I_MODE but first_mb_in_slice != 0\012\000" )
	.space	1
.LC369:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC370:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic." )
	ASCII(.ascii	"structure=%d.\012\000" )
	.space	2
.LC371:
	ASCII(.ascii	"DecVDM ERR\012\000" )
.LC372:
	ASCII(.ascii	"%s:%d Metadata map failed\012\000" )
	.space	1
.LC373:
	ASCII(.ascii	"%s:%d Metadata unmap failed\012\000" )
	.space	3
.LC374:
	ASCII(.ascii	"*****[%s][%d],EL Codec can only dec EL stream in DV" )
	ASCII(.ascii	"_DUAL_VES_IMP stream!!*****\012\000" )
.LC375:
	ASCII(.ascii	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC376:
	ASCII(.ascii	"\012 receive streambuff=%p; phy_addr=0x%x; bitstrea" )
	ASCII(.ascii	"m_length=%d\012\000" )
	.space	3
.LC377:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC378:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC379:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC380:
	ASCII(.ascii	"CurrPic.state is 'EMPTY'\012\000" )
	.space	2
.LC381:
	ASCII(.ascii	"StorePicInDPB return(%d) from L%d\012\000" )
	.space	1
.LC382:
	ASCII(.ascii	"directoutput mode\012\000" )
	.space	1
.LC383:
	ASCII(.ascii	"line: %d pImg is NULL!\012\000" )
.LC384:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC385:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC386:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC387:
	ASCII(.ascii	"marking return %d\012\000" )
	.space	1
.LC388:
	ASCII(.ascii	"return value is unexpeced!\012\000" )
.LC389:
	ASCII(.ascii	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
.LC390:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC391:
	ASCII(.ascii	"GAP found while DPB is empty!\012\000" )
	.space	1
.LC392:
	ASCII(.ascii	"frame num gap try to fill it \012\000" )
	.space	1
.LC393:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC394:
	ASCII(.ascii	"cann't allocate frame store when gap find\012\000" )
	.space	1
.LC395:
	ASCII(.ascii	"allocate frame store when gap find\012\000" )
.LC396:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC397:
	ASCII(.ascii	"%s %d frame_store is null!!\012\000" )
	.space	3
.LC398:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC399:
	ASCII(.ascii	"mem arrange err, ClearAll\012\000" )
	.space	1
.LC400:
	ASCII(.ascii	"line %d: frame gap(=%d) > dpb size(=%d)\012\000" )
	.space	3
.LC401:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC402:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC403:
	ASCII(.ascii	"dec_pts: %lld\012\000" )
	.space	1
.LC404:
	ASCII(.ascii	"dec_usertag: %lld\012\000" )
	.space	1
.LC405:
	ASCII(.ascii	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\012\000" )
	.space	1
.LC406:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC407:
	ASCII(.ascii	"Start Reason: SliceParaNum, MaxBytesReceived = %d, " )
	ASCII(.ascii	"%d(thr=%d)\012\000" )
	.space	1
.LC408:
	ASCII(.ascii	"Too many slice or bitstream, err!\012\000" )
	.space	1
.LC409:
	ASCII(.ascii	"Start Reason: new_pic_flag\012\000" )
.LC410:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC411:
	ASCII(.ascii	"DecList error, ret=%d\012\000" )
	.space	1
.LC412:
	ASCII(.ascii	"dec list err, cur pic poc %d.\012\000" )
	.space	1
.LC413:
	ASCII(.ascii	"pH264Ctx->TotalNal = %d, type:%d\012\000" )
	.space	2
.LC414:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC415:
	ASCII(.ascii	"svc_extension_flag error:priority_id:%d, pred_flag%" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC416:
	ASCII(.ascii	"%d,%d,%d\012\000" )
	.space	2
.LC417:
	ASCII(.ascii	"svc stream,nal_header:%x\012\000" )
	.space	2
.LC418:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC419:
	ASCII(.ascii	"SliceCheck failed, clear current slice.\012\000" )
	.space	3
.LC420:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC421:
	ASCII(.ascii	"%s: PPS decode error.\012\000" )
	.space	1
.LC422:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC423:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC424:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC425:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC426:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC427:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC428:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC429:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC430:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC431:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC432:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC433:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC434:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d\012\000" )
.LC435:
	ASCII(.ascii	"FindTrailZeros ERR\012\000" )
.LC436:
	ASCII(.ascii	"H264_DecOneNal ERR\012\000" )
.LC437:
	ASCII(.ascii	"%s frame_store or pH264DecParam is null\012\000" )
	.space	3
.LC438:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC439:
	ASCII(.ascii	"pH264Ctx->CurrPic.frame_store is null pointer\012\000" )
	.space	1
.LC440:
	ASCII(.ascii	"imode nal store pic err, ret = %d\012\000" )
	.space	1
.LC441:
	ASCII(.ascii	"imode nal flush dpb err, ret = %d\012\000" )
	.space	1
.LC442:
	ASCII(.ascii	"cann't find FrameStore\012\000" )
.LC443:
	ASCII(.ascii	"========== H264 FrameStore state(is_used, is_in_dpb" )
	ASCII(.ascii	", IsOutDPB) ========\012\000" )
	.space	3
.LC444:
	ASCII(.ascii	"ReadImgNum = %d, NewImgNum = %d\012\000" )
	.space	3
.LC445:
	ASCII(.ascii	"%02d: %d %d %d\012\000" )
.LC446:
	ASCII(.ascii	"FrameStore leak, ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.15010, %object
	.size	pps_tmp.15010, 2208
pps_tmp.15010:
	.space	2208
	.type	sps_tmp.15132, %object
	.size	sps_tmp.15132, 4000
sps_tmp.15132:
	.space	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.space	68
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
