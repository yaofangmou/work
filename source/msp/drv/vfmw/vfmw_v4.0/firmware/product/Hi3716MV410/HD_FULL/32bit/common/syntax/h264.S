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
	ldr	r2, [r2, #12]
	ldr	r3, [r3, #12]
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
	ldr	r2, [r2, #8]
	ldr	r3, [r3, #8]
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
	ldr	r2, [r2, #628]
	ldr	r3, [r3, #628]
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
	ldr	r2, [r2, #632]
	ldr	r3, [r3, #632]
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
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
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
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
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
	ldr	r2, [r2, #636]
	ldr	r3, [r3, #636]
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
	ldr	r2, [r2, #636]
	ldr	r3, [r3, #636]
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
	.type	RemoveFrameStoreOutDPB.part.1, %function
RemoveFrameStoreOutDPB.part.1:
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
	add	r5, r0, r1, lsl #2
	mov	r4, r1
	add	r5, r5, #24576
	mov	r7, r0
	ldr	r2, [r5, #1864]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r2, #664]
	add	r6, r0, #24576
	mov	r1, #0
	add	r8, r0, #53248
	add	r3, r3, #6656
	add	r3, r3, #6
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #4]
	ldr	r3, [r6, #2336]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r6, #2336]
	ldr	r1, [r2, #620]
	ldr	r0, [r8, #4056]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L32
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L33
	ldr	r3, [r5, #1864]
	mov	r2, #0
	ldr	r0, [r8, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetDisplay
.L33:
	ldr	r3, [r5, #1864]
	mov	r2, #0
	ldr	r0, [r8, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetRef
.L32:
	ldr	r2, [r5, #1864]
	mov	r3, #0
	cmp	r4, #14
	strb	r3, [r2, #1]
	ldr	r2, [r5, #1864]
	strb	r3, [r2, #4]
	ldr	r2, [r5, #1864]
	strb	r3, [r2, #2]
	ldmhifd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r6, #2060]
	sub	r1, r0, #1
	cmp	r4, r1
	addcc	r3, r4, #6592
	addcc	r3, r3, #18
	addcc	r3, r7, r3, lsl #2
	bcs	.L38
.L37:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, #14
	cmpls	r4, r1
	str	r2, [r3, #-4]
	bcc	.L37
.L38:
	cmp	r0, #0
	beq	.L50
	add	r3, r1, #6592
	mov	r2, #0
	add	r3, r3, #18
	str	r2, [r7, r3, asl #2]
	str	r1, [r6, #2060]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L50:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	RemoveFrameStoreOutDPB.part.1, .-RemoveFrameStoreOutDPB.part.1
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
	add	ip, r0, #53248
	add	r0, r0, #24576
	ldr	lr, [ip, #4076]
	ldr	r2, [r0, #2056]
	ldr	r3, [ip, #4072]
	add	r2, r2, lr, lsr #1
	add	r0, r2, #1
	mov	r3, r3, lsr #1
	cmp	r3, r0
	movcc	r3, #0
	strcc	r3, [r1, #84]
	ldmccfd	sp, {fp, sp, pc}
	sub	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movhi	r3, #2
	movls	r3, #1
	strhi	r3, [r1, #84]
	strls	r3, [r1, #84]
	ldrhi	r3, [ip, #4076]
	ldrls	r3, [ip, #4076]
	addhi	r3, r3, #4
	addls	r3, r3, #2
	str	r3, [ip, #4076]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetFrmRepeatCount.part.2, .-SetFrmRepeatCount.part.2
	.align	2
	.type	DumpList.part.6, %function
DumpList.part.6:
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
	add	r9, r0, #26880
	add	r9, r9, #160
	add	r7, r0, #20480
	ldr	r8, .L87
	add	r7, r7, #248
	mov	r6, #0
	mov	r10, r9
	str	r0, [fp, #-48]
.L56:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	movne	r5, r10
	movne	r4, #0
	beq	.L59
.L57:
	ldr	r0, [r5, #4]!
	mov	r3, r4
	mov	r2, r6
	ldr	r1, .L87+4
	add	r4, r4, #1
	ldr	ip, [r0, #4]
	mov	r0, #13
	ldr	lr, [ip, #636]
	str	lr, [sp, #4]
	ldr	ip, [ip, #624]
	str	ip, [sp]
	ldr	ip, [r8, #68]
	blx	ip
	ldr	r3, [r7]
	cmp	r4, r3
	bcc	.L57
.L59:
	add	r6, r6, #1
	add	r10, r10, #132
	cmp	r6, #2
	bne	.L56
	ldr	r3, [fp, #-48]
	add	r5, r3, #20480
	ldr	r3, [r5, #252]
	cmp	r3, #0
	bne	.L83
.L60:
	ldr	r3, [r5, #256]
	cmp	r3, #0
	bne	.L84
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L84:
	ldr	r6, .L87
	mov	r0, #13
	ldr	r1, .L87+8
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r5, #256]
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-48]
	mov	r4, #0
	add	r7, r3, #27136
	add	r7, r7, #36
	b	.L73
.L85:
	bcc	.L71
	cmp	r2, #2
	ldr	r1, .L87+12
	mov	r0, #13
	bne	.L69
	ldr	r2, [r3, #4]
	ldr	r3, [r6, #68]
	ldr	r2, [r2, #636]
	blx	r3
.L69:
	ldr	r3, [r5, #256]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L74
.L73:
	ldr	r3, [r7, #4]!
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L85
	ldr	r2, [r3, #4]
	mov	r0, #13
	ldr	r3, [r6, #68]
	add	r4, r4, #1
	ldr	r1, .L87+16
	ldr	r2, [r2, #636]
	blx	r3
	ldr	r3, [r5, #256]
	cmp	r4, r3
	bcc	.L73
.L74:
	ldr	r3, [r6, #68]
	mov	r0, #13
	ldr	r1, .L87+20
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L71:
	ldr	r2, [r3, #4]
	mov	r0, #13
	ldr	r3, [r6, #68]
	ldr	r1, .L87+24
	ldr	r2, [r2, #636]
	blx	r3
	b	.L69
.L83:
	ldr	r6, .L87
	mov	r0, #13
	ldr	r1, .L87+28
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r5, #252]
	cmp	r3, #0
	movne	r4, #0
	bne	.L61
	b	.L66
.L86:
	bcc	.L64
	cmp	r2, #2
	ldr	r1, .L87+12
	mov	r0, #13
	bne	.L62
	ldr	r2, [r3, #4]
	ldr	r3, [r6, #68]
	ldr	r2, [r2, #636]
	blx	r3
.L62:
	ldr	r3, [r5, #252]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L66
.L61:
	ldr	r3, [r9, #4]!
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L86
	ldr	r2, [r3, #4]
	mov	r0, #13
	ldr	r3, [r6, #68]
	add	r4, r4, #1
	ldr	r1, .L87+16
	ldr	r2, [r2, #636]
	blx	r3
	ldr	r3, [r5, #252]
	cmp	r4, r3
	bcc	.L61
.L66:
	ldr	r3, [r6, #68]
	mov	r0, #13
	ldr	r1, .L87+20
	blx	r3
	b	.L60
.L64:
	ldr	r2, [r3, #4]
	mov	r0, #13
	ldr	r3, [r6, #68]
	ldr	r1, .L87+24
	ldr	r2, [r2, #636]
	blx	r3
	b	.L62
.L88:
	.align	2
.L87:
	.word	vfmw_Osal_Func_Ptr_S
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
	.type	CombinePacket.part.10, %function
CombinePacket.part.10:
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
	ldr	r6, .L90
	mov	r4, r0
	ldr	r1, .L90+4
	mov	r0, #7
	mov	r5, #0
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r1, [r4, #368]
	ldr	r7, [r6, #68]
	mov	r0, #7
	ldr	ip, [r1, #40]
	ldr	r3, [r1, #44]
	ldr	r2, [r1, #16]
	str	ip, [sp, #4]
	ldr	ip, [r1, #12]
	ldr	r1, .L90+8
	str	ip, [sp]
	blx	r7
	ldr	r3, [r4, #368]
	ldr	r7, [r6, #52]
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r3, #8]
	rsb	r0, r2, r0
	blx	r7
	ldr	r3, [r4, #368]
	mov	ip, #1
	ldr	r1, .L90+12
	mov	r0, #7
	ldr	r2, [r3, #60]
	ldr	r7, [r3, #32]
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
	ldr	lr, [r3, #40]
	ldr	r2, [r3, #12]
	add	r2, r2, lr
	str	r2, [r3, #12]
	ldr	r3, [r4, #368]
	str	ip, [r3, #68]
	ldr	r2, [r4, #368]
	ldr	r6, [r6, #68]
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #16]
	blx	r6
	add	r3, r4, #53248
	mov	r1, r7
	ldr	r0, [r3, #4056]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	str	r5, [r3, #36]
	ldr	r3, [r4, #368]
	str	r5, [r3, #52]
	ldr	r3, [r4, #368]
	str	r5, [r3, #40]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L91:
	.align	2
.L90:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC7
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	CombinePacket.part.10, .-CombinePacket.part.10
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
	bls	.L96
	cmp	r0, #31
	bls	.L97
	add	r3, r8, #53248
	mvn	r5, #0
	mov	r7, #32
	mov	r2, #1
	str	r2, [r3, #3996]
.L94:
	ldr	ip, [r8, #368]
	mov	r2, r6
	ldr	lr, .L98
	mov	r3, r5
	ldr	r1, .L98+4
	mov	r0, #21
	ldr	r4, [ip, #64]
	add	r4, r4, r7
	str	r4, [ip, #64]
	ldr	r4, [lr, #68]
	blx	r4
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L96:
	mov	r4, r0, asl #1
	mov	r0, r7
	add	r7, r4, #1
	rsb	r4, r4, #31
	mov	r4, r5, lsr r4
	mov	r1, r7
	sub	r5, r4, #1
	bl	BsSkip
	b	.L94
.L97:
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
	b	.L94
.L99:
	.align	2
.L98:
	.word	vfmw_Osal_Func_Ptr_S
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
	bhi	.L101
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
.L102:
	ldr	lr, [r8, #368]
	mov	r2, r7
	ldr	r6, .L105
	mov	r3, r4
	ldr	r1, .L105+4
	mov	r0, #21
	ldr	ip, [lr, #64]
	add	r5, ip, r5
	str	r5, [lr, #64]
	ldr	r5, [r6, #68]
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L101:
	cmp	r0, #31
	bls	.L104
	add	r3, r8, #53248
	mov	r2, #1
	mvn	r4, #-2147483648
	mov	r5, #32
	str	r2, [r3, #3996]
	b	.L102
.L104:
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
	b	.L102
.L106:
	.align	2
.L105:
	.word	vfmw_Osal_Func_Ptr_S
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
	mov	r5, r0
	add	r0, r0, #13504
	add	r0, r0, #24
	mov	r6, r1
	mov	r7, r2
	bl	BsGet
	ldr	ip, [r5, #368]
	mov	r2, r7
	ldr	lr, .L108
	ldr	r1, [ip, #64]
	add	r1, r1, r6
	str	r1, [ip, #64]
	ldr	r1, .L108+4
	ldr	r5, [lr, #68]
	mov	r4, r0
	mov	r0, #21
	mov	r3, r4
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L109:
	.align	2
.L108:
	.word	vfmw_Osal_Func_Ptr_S
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
	ldr	r5, .L111
	mov	r2, r6
	ldr	r1, .L111+4
	ldr	ip, [lr, #64]
	add	ip, ip, #1
	str	ip, [lr, #64]
	ldr	r5, [r5, #68]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L112:
	.align	2
.L111:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC10
	UNWIND(.fnend)
	.size	u_1, .-u_1
	.align	2
	.global	GetMinPOC
	.type	GetMinPOC, %function
GetMinPOC:
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
	add	r6, r0, #24576
	mov	r8, r2
	mvn	r3, #-2147483648
	mov	r2, #0
	str	r2, [r8]
	mov	r7, r1
	str	r3, [r1]
	ldr	r3, [r6, #2060]
	ldr	r2, [r6, #2056]
	cmp	r3, r2
	strhi	r2, [r6, #2060]
	movhi	r3, r2
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r0, #26368
	ldr	r9, .L124
	add	r5, r5, #68
	mov	r4, #0
	b	.L117
.L116:
	ldr	r3, [r6, #2060]
	add	r4, r4, #1
	cmp	r3, r4
	bls	.L123
.L117:
	ldr	r3, [r5, #4]!
	ldr	ip, [r7]
	ldr	r0, [r3, #636]
	cmp	ip, r0
	ble	.L116
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L116
	ldr	r3, [r9, #112]
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #636]
	str	r3, [r7]
	str	r4, [r8]
	add	r4, r4, #1
	ldr	r3, [r6, #2060]
	cmp	r3, r4
	bhi	.L117
.L123:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L125:
	.align	2
.L124:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	GetMinPOC, .-GetMinPOC
	.align	2
	.global	GetMaxPOC
	.type	GetMaxPOC, %function
GetMaxPOC:
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
	add	r6, r0, #24576
	mov	r3, #0
	mov	r8, r2
	str	r3, [r2]
	str	r3, [r1]
	mov	r7, r1
	ldr	r3, [r6, #2060]
	ldr	r2, [r6, #2056]
	cmp	r3, r2
	strhi	r2, [r6, #2060]
	movhi	r3, r2
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r0, #26368
	ldr	r9, .L137
	add	r5, r5, #68
	mov	r4, #0
	b	.L130
.L129:
	ldr	r3, [r6, #2060]
	add	r4, r4, #1
	cmp	r3, r4
	bls	.L136
.L130:
	ldr	r3, [r5, #4]!
	ldr	ip, [r7]
	ldr	r0, [r3, #636]
	cmp	ip, r0
	bge	.L129
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L129
	ldr	r3, [r9, #112]
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #636]
	str	r3, [r7]
	str	r4, [r8]
	add	r4, r4, #1
	ldr	r3, [r6, #2060]
	cmp	r3, r4
	bhi	.L130
.L136:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L138:
	.align	2
.L137:
	.word	vfmw_Osal_Func_Ptr_S
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
	beq	.L155
	tst	r3, #1
	bne	.L156
.L144:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L148
.L145:
	ldr	r0, [r0, #584]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L148:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L156:
	ldr	r2, [r0, #548]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L144
.L149:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L155:
	ldr	r3, [r0, #512]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L149
	ldr	r3, [r0, #548]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	bne	.L145
	b	.L149
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
	beq	.L172
	tst	r3, #1
	bne	.L173
.L161:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L165
.L162:
	ldr	r0, [r0, #584]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L165:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L173:
	ldr	r2, [r0, #548]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L161
.L166:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L172:
	ldr	r3, [r0, #512]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L166
	ldr	r3, [r0, #548]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	bne	.L162
	b	.L166
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
	ldr	r8, [r9, #2060]
	cmp	r8, #0
	beq	.L181
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #68
	mov	r5, r4
.L177:
	ldr	r7, [r10, #4]!
	add	r5, r5, #1
	mov	r0, r7
	bl	LongTermRefFlg
	add	r3, r4, #6592
	add	r3, r3, #50
	cmp	r0, #0
	strne	r7, [r6, r3, asl #2]
	addne	r4, r4, #1
	cmp	r5, r8
	bne	.L177
.L175:
	ldr	r3, [r9, #2056]
	str	r4, [r9, #2068]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6592
	mov	r2, #0
	add	r0, r0, #49
	add	r0, r6, r0, lsl #2
.L179:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L179
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L181:
	mov	r4, r8
	b	.L175
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
	ldr	r8, [r9, #2060]
	cmp	r8, #0
	beq	.L194
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #68
	mov	r5, r4
.L190:
	ldr	r7, [r10, #4]!
	add	r5, r5, #1
	mov	r0, r7
	bl	ShortTermRefFlg
	add	r3, r4, #6592
	add	r3, r3, #34
	cmp	r0, #0
	strne	r7, [r6, r3, asl #2]
	addne	r4, r4, #1
	cmp	r5, r8
	bne	.L190
.L188:
	ldr	r3, [r9, #2056]
	str	r4, [r9, #2064]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6592
	mov	r2, #0
	add	r0, r0, #33
	add	r0, r6, r0, lsl #2
.L192:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L192
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L194:
	mov	r4, r8
	b	.L188
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
	ldr	r3, [r0, #528]
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
	beq	.L204
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #549]
	and	r2, r2, #2
	strb	ip, [r1, #550]
	strb	r2, [r1, #2]
.L204:
	tst	r3, #2
	beq	.L205
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #585]
	and	r2, r2, #1
	strb	ip, [r1, #586]
	strb	r2, [r1, #2]
.L205:
	cmp	r3, #3
	add	r0, r0, #53248
	moveq	r3, #0
	streqb	r3, [r1, #514]
	streqb	r3, [r1, #513]
	mov	r3, #0
	mov	r2, r3
	strb	r3, [r1, #2]
	ldr	r1, [r1, #620]
	ldr	r0, [r0, #4056]
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
	ldr	r7, [r3, #2060]
	cmp	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r6, r0, #26368
	mov	r4, #0
	add	r6, r6, #68
.L216:
	ldr	r5, [r6, #4]!
	add	r4, r4, #1
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	mov	r0, r5
	cmp	r3, #0
	beq	.L215
	bl	ShortTermRefFlg
	cmp	r0, #0
	bne	.L227
.L215:
	cmp	r4, r7
	bne	.L216
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L227:
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
	ldr	r4, [r3, #2068]
	cmp	r4, #0
	ldmeqfd	sp, {r4, fp, sp, pc}
	ldr	ip, [r3, #1992]
	ldr	r3, [ip, #632]
	cmp	r3, r1
	addne	r2, r0, #26368
	movne	r3, #0
	addne	r2, r2, #200
	bne	.L232
	b	.L230
.L233:
	ldr	ip, [r2, #4]!
	ldr	lr, [ip, #632]
	cmp	lr, r1
	beq	.L230
.L232:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L233
	ldmfd	sp, {r4, fp, sp, pc}
.L230:
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
	ldr	r6, [ip, #2068]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, fp, sp, pc}
	add	r4, r0, #26368
	mov	ip, #0
	add	r4, r4, #196
	b	.L243
.L241:
	cmp	ip, r6
	beq	.L257
.L243:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldr	r5, [lr, #632]
	cmp	r5, r3
	bne	.L241
	cmp	r2, #1
	ldreqb	r5, [lr, #585]	@ zero_extendqisi2
	beq	.L256
	cmp	r2, #2
	bne	.L241
	ldrb	r5, [lr, #549]	@ zero_extendqisi2
.L256:
	clz	r5, r5
	mov	r5, r5, lsr #5
	cmp	lr, r1
	orrne	r5, r5, #1
	cmp	r5, #0
	beq	.L241
	mov	r1, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L257:
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
	bne	.L259
	add	ip, r0, #24576
	ldr	r1, [r1, #528]
	ldr	r4, [ip, #2064]
	sub	r1, r1, #1
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L288
	add	ip, r0, #26368
	add	ip, ip, #132
	b	.L265
.L264:
	cmp	r3, r4
	beq	.L289
.L265:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #524]
	cmp	lr, r2
	bne	.L264
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L264
	ldr	lr, [r1, #512]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L264
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L259:
	add	r3, r0, #24576
	ldr	r1, [r1, #528]
	ldr	r5, [r3, #2064]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L290
	add	r4, r0, #26368
	mov	ip, #0
	add	r4, r4, #132
	b	.L270
.L266:
	tst	r3, #2
	beq	.L268
	ldr	r3, [r1, #584]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L291
.L268:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L292
.L270:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L266
	ldr	lr, [r1, #548]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L266
	ldr	lr, [r1, #560]
	cmp	lr, r2
	bne	.L266
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #1928]
	strb	r1, [r3, #550]
	ldr	r3, [r2, #1928]
	ldrb	ip, [r3, #512]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #514]
	ldreq	r3, [r2, #1928]
	streqb	r1, [r3, #513]
	ldreq	r3, [r2, #1928]
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r3, #660]
	add	lr, r0, #53248
	mov	r2, r1
	add	ip, ip, #13952
	add	ip, ip, #40
	add	r0, r0, ip, lsl #2
	str	r1, [r0, #4]
	ldr	r1, [r3, #620]
.L285:
	ldr	r0, [lr, #4056]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	FSP_SetRef
.L291:
	ldr	r3, [r1, #596]
	cmp	r3, r2
	bne	.L268
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r2, #0
	ldr	r1, [r3, #1928]
	strb	r2, [r1, #586]
	ldr	r1, [r3, #1928]
	ldrb	ip, [r1, #512]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #514]
	ldreq	r1, [r3, #1928]
	streqb	r2, [r1, #513]
	ldreq	r1, [r3, #1928]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r1, #660]
	add	lr, r0, #53248
	mov	r2, r3
	add	ip, ip, #13952
	add	ip, ip, #40
	add	r0, r0, ip, lsl #2
	str	r3, [r0, #4]
	ldr	r1, [r1, #620]
	b	.L285
.L292:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L289:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L288:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L290:
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
	beq	.L294
	add	r3, r0, #24576
	ldr	r5, [r3, #2068]
	cmp	r5, #0
	beq	.L322
	add	r4, r0, #26368
	mov	ip, #0
	add	r4, r4, #196
	b	.L303
.L299:
	tst	r3, #2
	beq	.L301
	ldr	r3, [r1, #584]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L323
.L301:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L324
.L303:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L299
	ldr	lr, [r1, #548]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L299
	ldr	lr, [r1, #556]
	cmp	r2, lr
	bne	.L299
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #1992]
	strb	r1, [r3, #549]
	ldr	r3, [r2, #1992]
	ldrb	ip, [r3, #512]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #514]
	ldreq	r3, [r2, #1992]
	streqb	r1, [r3, #513]
	ldreq	r3, [r2, #1992]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	r3, [r3, #660]
	add	r3, r3, #13952
	add	r3, r3, #40
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #4]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L294:
	add	r1, r0, #24576
	ldr	r4, [r1, #2068]
	cmp	r4, #0
	beq	.L325
	add	ip, r0, #26368
	add	ip, ip, #196
	b	.L305
.L304:
	cmp	r3, r4
	beq	.L326
.L305:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #520]
	cmp	lr, r2
	bne	.L304
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L304
	ldr	lr, [r1, #512]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L304
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L323:
	ldr	r3, [r1, #592]
	cmp	r2, r3
	bne	.L301
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r1, #0
	ldr	r2, [r3, #1992]
	strb	r1, [r2, #585]
	ldr	r2, [r3, #1992]
	ldrb	ip, [r2, #512]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r2, #514]
	ldreq	r2, [r3, #1992]
	streqb	r1, [r2, #513]
	ldreq	r2, [r3, #1992]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	r3, [r2, #660]
	add	r3, r3, #13952
	add	r3, r3, #40
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #4]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L326:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L324:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L325:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L322:
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
	beq	.L328
	ldr	r7, [r3, #2064]
	cmp	r7, #0
	beq	.L357
	add	r6, r0, #26368
	mov	ip, #0
	add	r6, r6, #132
	b	.L342
.L334:
	tst	r4, #2
	beq	.L337
	ldr	lr, [r3, #584]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	beq	.L358
.L337:
	add	ip, ip, #1
	cmp	ip, r7
	beq	.L359
.L342:
	ldr	r3, [r6, #4]!
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L334
	ldr	lr, [r3, #548]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L334
	ldr	lr, [r3, #560]
	cmp	lr, r2
	bne	.L334
	ldrb	lr, [r3, #585]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L338
	ldr	lr, [r3, #632]
	cmp	lr, r1
	bne	.L337
.L338:
	str	r1, [r3, #632]
	sub	r3, r5, #1
	add	r2, r0, ip, lsl #2
	clz	r3, r3
	add	r2, r2, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r0, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r2, #1928]
	str	r1, [r3, #556]
	ldr	r3, [r2, #1928]
	strb	ip, [r3, #549]
	ldr	r3, [r2, #1928]
	strb	r0, [r3, #550]
	ldr	r3, [r2, #1928]
	ldrb	r1, [r3, #512]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L360
	ldrb	r1, [r3, #585]	@ zero_extendqisi2
	ldrb	r0, [r3, #549]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r3, #513]
	ldreq	r3, [r2, #1928]
	ldreqb	r2, [r3, #550]	@ zero_extendqisi2
	streqb	r2, [r3, #514]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L328:
	ldr	r6, [r3, #2064]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	lr, r0, #26368
	mov	r3, r5
	add	lr, lr, #132
	b	.L333
.L332:
	add	r3, r3, #1
	cmp	r3, r6
	beq	.L361
.L333:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #2]	@ zero_extendqisi2
	cmp	r4, #3
	bne	.L332
	ldr	r4, [ip, #512]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	bne	.L332
	ldr	r4, [ip, #524]
	cmp	r4, r2
	bne	.L332
	add	r3, r0, r3, lsl #2
	str	r1, [ip, #632]
	add	r3, r3, #24576
	mov	r0, #1
	mov	r2, #0
	ldr	ip, [r3, #1928]
	str	r1, [ip, #520]
	ldr	r1, [r3, #1928]
	strb	r0, [r1, #513]
	ldr	r1, [r3, #1928]
	strb	r0, [r1, #549]
	ldr	r1, [r3, #1928]
	strb	r0, [r1, #585]
	ldr	r1, [r3, #1928]
	strb	r2, [r1, #514]
	ldr	r1, [r3, #1928]
	strb	r2, [r1, #550]
	ldr	r3, [r3, #1928]
	strb	r2, [r3, #586]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L358:
	ldr	lr, [r3, #596]
	cmp	lr, r2
	bne	.L337
	ldrb	lr, [r3, #549]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L341
	ldr	lr, [r3, #632]
	cmp	lr, r1
	bne	.L337
.L341:
	str	r1, [r3, #632]
	sub	r3, r5, #2
	add	r0, r0, ip, lsl #2
	clz	r3, r3
	add	r0, r0, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r2, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r0, #1928]
	str	r1, [r3, #592]
	ldr	r3, [r0, #1928]
	strb	ip, [r3, #585]
	ldr	r3, [r0, #1928]
	strb	r2, [r3, #586]
	ldr	r3, [r0, #1928]
	ldrb	r2, [r3, #512]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #0
	bne	.L362
	ldrb	r2, [r3, #585]	@ zero_extendqisi2
	ldrb	r1, [r3, #549]	@ zero_extendqisi2
	cmp	r2, r1
	streqb	r2, [r3, #513]
	ldreq	r3, [r0, #1928]
	ldreqb	r2, [r3, #586]	@ zero_extendqisi2
	streqb	r2, [r3, #514]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L359:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L361:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L360:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L362:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L357:
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
	bne	.L364
	ldr	r4, [r5, #528]
	mov	r1, r3
	sub	r4, r4, #1
	rsb	r4, r2, r4
	bl	UnMarkLTFrmByFrmIdx
.L365:
	mov	r3, r5
	mov	r2, r4
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MarkPicLTRef
.L364:
	add	r3, r0, #24576
	ldr	r4, [r5, #528]
	ldr	lr, [r3, #2064]
	rsb	r4, r2, r4, lsl #1
	cmp	lr, #0
	beq	.L365
	add	ip, r0, #26368
	mov	r3, #0
	add	ip, ip, #132
	b	.L368
.L366:
	tst	r2, #2
	beq	.L367
	ldr	r2, [r1, #584]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	beq	.L379
.L367:
	cmp	r3, lr
	beq	.L365
.L368:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L366
	ldr	r0, [r1, #548]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L366
	ldr	r0, [r1, #560]
	cmp	r0, r4
	bne	.L366
	mov	r3, r7
	mov	r2, #1
	mov	r0, r6
	bl	UnMarkLTFldByFrmIdx
	b	.L365
.L379:
	ldr	r2, [r1, #596]
	cmp	r2, r4
	bne	.L367
	mov	r3, r7
	mov	r2, #2
	mov	r0, r6
	bl	UnMarkLTFldByFrmIdx
	b	.L365
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
	ldr	r3, [r6, #2068]
	str	r1, [r6, #2072]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #26368
	mov	r3, r1
	add	r5, r5, #196
	mov	r4, #0
	b	.L384
.L382:
	ldr	r3, [r6, #2068]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r6, #2072]
.L384:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #632]
	cmp	r2, r3
	bcc	.L382
	mov	r0, r7
	bl	UnMarkFrameStoreRef
	b	.L382
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
	ldr	r3, [r7, #2064]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #26368
	mov	r4, #0
	add	r5, r5, #132
.L387:
	ldr	r1, [r5, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r7, #2064]
	add	r4, r4, #1
	cmp	r3, r4
	bhi	.L387
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
	beq	.L393
	mov	r3, r5
	ldr	r1, [r1, #520]
	bl	UnMarkLTFldByFrmIdx
.L392:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #532]
	strb	r2, [r4, #4]
	strb	r3, [r4, #5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L393:
	mov	r1, r5
	bl	UnMarkLTFrmByFrmIdx
	b	.L392
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #15
	ldmhifd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RemoveFrameStoreOutDPB.part.1
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
	beq	.L406
	add	r3, r6, #24576
	ldr	r7, [r3, #2060]
	cmp	r7, #0
	addne	r8, r6, #53248
	movne	r5, #0
	movne	r9, r5
	movne	r10, r5
	bne	.L404
	b	.L405
.L416:
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L402
	ldr	r0, [r2, #640]
	cmp	r0, #1
	beq	.L402
	cmp	r5, #15
	strb	r1, [r2, #1]
	bls	.L414
.L403:
	add	r9, r9, #1
	cmp	r9, r7
	beq	.L405
.L404:
	add	r4, r6, r5, lsl #2
	ldr	r0, [r8, #4056]
	add	r4, r4, #24576
	ldr	r2, [r4, #1864]
	ldr	r1, [r2, #620]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L399
	ldrsh	r2, [r0]
	cmp	r2, #0
	bne	.L400
	ldr	r1, [r4, #1864]
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L401
	ldrsb	r0, [r0]
	cmp	r0, #0
	bne	.L415
.L401:
	mvn	r3, #0
	str	r3, [r1, #620]
	ldr	r2, [r4, #1864]
	strb	r10, [r2, #2]
.L399:
	ldr	r1, [r4, #1864]
	ldr	r2, [r1, #640]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r1, #4]
.L400:
	ldr	r2, [r4, #1864]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L416
.L402:
	add	r9, r9, #1
	add	r5, r5, #1
	cmp	r9, r7
	bne	.L404
.L405:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L415:
	ldr	r1, [r1, #620]
	ldr	r0, [r8, #4056]
	bl	FSP_SetRef
	ldr	r1, [r4, #1864]
	b	.L401
.L414:
	mov	r1, r5
	mov	r0, r6
	bl	RemoveFrameStoreOutDPB.part.1
	b	.L403
.L406:
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
	add	r3, r0, #53248
	mov	r5, r0
	mov	r4, r1
	ldr	r2, [r3, #2808]
	cmp	r2, #0
	bne	.L418
	ldr	r2, [r1, #640]
	cmp	r2, #1
	beq	.L419
	ldr	r2, [r3, #3984]
	cmp	r2, #0
	beq	.L443
.L419:
	mov	r2, #1
	str	r2, [r3, #2808]
.L418:
	ldr	r0, [r3, #4056]
	ldr	r1, [r4, #620]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L421
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L444
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L429
	cmp	r3, #1
	beq	.L429
	ldr	r3, [r4]
	mov	r1, #768
	movt	r1, 768
	bic	r3, r3, #16711680
	bic	r3, r3, #255
	cmp	r3, r1
	beq	.L445
	cmp	r2, #1
	beq	.L446
	cmp	r2, #2
	beq	.L447
.L427:
	ldr	r3, [r5]
	ldr	r2, [r0, #208]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	movls	r0, #0
	bhi	.L448
.L442:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L443:
	ldr	r2, [r0]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	bne	.L419
	mvn	r0, #0
	b	.L442
.L444:
	ldr	ip, .L449
	mov	r0, #1
	ldr	r2, [r4, #620]
	ldr	r1, .L449+4
	ldr	r5, [ip, #68]
	blx	r5
.L423:
	ldr	r3, [r4, #640]
	cmp	r3, #1
	beq	.L430
	mvn	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L446:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L427
	ldr	ip, .L449
	mov	r0, r2
	ldr	r1, .L449+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L442
.L447:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	tst	r3, #2
	beq	.L427
	ldr	ip, .L449
	mov	r0, #1
	ldr	r1, .L449+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L442
.L430:
	mov	r3, #2
	mvn	r0, #2
	str	r3, [r4, #640]
	b	.L442
.L421:
	ldr	lr, .L449
	mov	r2, r4
	ldr	ip, [r4, #620]
	mov	r0, #1
	ldr	r3, [r4, #640]
	ldr	r5, [lr, #68]
	ldr	r1, .L449+16
	str	ip, [sp]
	blx	r5
	b	.L423
.L429:
	ldr	ip, .L449
	mov	r0, #1
	ldr	r1, .L449+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L442
.L448:
	ldr	ip, .L449
	mov	r0, #1
	ldr	r1, .L449+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L442
.L445:
	ldr	ip, .L449
	mov	r0, #1
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	ldr	r1, .L449+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L442
.L450:
	.align	2
.L449:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC11
	.word	.LC15
	.word	.LC16
	.word	.LC12
	.word	.LC13
	.word	.LC17
	.word	.LC14
	UNWIND(.fnend)
	.size	CheckFrameStore, .-CheckFrameStore
	.align	2
	.global	ExchangePts
	.type	ExchangePts, %function
ExchangePts:
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
	ldrd	r2, [r1, #16]
	mvn	r5, #0
	mvn	r4, #0
	cmp	r3, r5
	mov	r10, r1
	cmpeq	r2, r4
	str	r0, [fp, #-52]
	beq	.L451
	add	r9, r0, #24576
	ldr	r3, [r9, #2060]
	cmp	r3, #0
	beq	.L451
	add	r8, r0, #26368
	add	r5, r0, #53248
	add	r8, r8, #68
	mvn	r6, #1
	mvn	r7, #0
	mov	r4, #0
	mvn	r3, #0
	str	r3, [fp, #-48]
.L456:
	ldr	r1, [r8, #4]!
	cmp	r1, #0
	beq	.L455
	ldr	r1, [r1, #620]
	ldr	r0, [r5, #4056]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L455
	ldrsb	r1, [r0, #1]
	cmp	r1, #3
	cmpne	r1, #0
	beq	.L455
	ldr	r1, [r8]
	ldrd	r0, [r1, #16]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r4, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L455:
	ldr	r1, [r9, #2060]
	add	r4, r4, #1
	cmp	r4, r1
	bcc	.L456
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L451
	ldrd	r2, [r10, #16]
	cmp	r3, r7
	cmpeq	r2, r6
	bhi	.L470
.L451:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L470:
	ldr	ip, .L471
	mov	r0, #29
	strd	r6, [sp]
	ldr	r1, .L471+4
	ldr	r4, [ip, #68]
	blx	r4
	ldr	r3, [fp, #-48]
	ldr	r1, [fp, #-52]
	add	r8, r3, #6592
	ldrd	r2, [r10, #16]
	add	r8, r8, #18
	ldr	r1, [r1, r8, asl #2]
	strd	r2, [r1, #16]
	strd	r6, [r10, #16]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L472:
	.align	2
.L471:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	UNWIND(.fnend)
	.size	ExchangePts, .-ExchangePts
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	ip, r0, #12288
	add	r2, r0, #20480
	mov	r4, r1
	ldr	r3, [ip, #1304]
	mov	lr, #2208
	ldr	r1, [r2, #220]
	add	r5, r0, #53248
	ldr	r2, [r4, #168]
	mov	r7, #4000
	ldr	r6, [ip, #1300]
	mla	lr, lr, r1, r3
	bic	ip, r2, #768
	bic	ip, ip, #3
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	ldr	r3, [lr, #28]
	str	ip, [r4, #168]
	ldr	lr, [r5, #2816]
	mla	r3, r7, r3, r6
	mov	lr, lr, asl #10
	str	lr, [r4, #196]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L509
.L476:
	.word	.L475
	.word	.L477
	.word	.L478
	.word	.L475
.L478:
	ldr	r2, [r4, #652]
	mov	r6, #3
	ldr	lr, [r4, #656]
	and	r2, r2, r6
	str	r6, [r4, #160]
	orr	ip, ip, r2
	ldr	r2, [r4, #608]
	add	r6, r0, #24576
	orr	ip, ip, #2816
	str	lr, [r4, #208]
	str	ip, [r4, #168]
	str	r2, [r4, #164]
.L474:
	ldrb	r2, [r3, #18]	@ zero_extendqisi2
	str	r2, [r4, #492]
	str	r2, [r4, #496]
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	cmp	r2, #0
	ldrne	r2, [r3, #68]
	mov	r3, #1
	str	r3, [r4, #500]
	str	r2, [r4, #504]
	ldr	r3, [r0]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L495
	ldrb	r3, [r4, #512]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L495
	cmp	r1, #3
	ldreq	r3, [r4, #168]
	biceq	r3, r3, #768
	streq	r3, [r4, #168]
.L495:
	mov	r1, r4
	bl	ExchangePts
	ldrb	r3, [r6, #1816]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L496
	ldr	r3, [r6, #1832]
	cmp	r3, #3
	moveq	r3, #1
	streq	r3, [r4, #372]
	beq	.L496
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r4, #372]
	beq	.L496
	cmp	r3, #5
	moveq	r3, #3
	streq	r3, [r4, #372]
	beq	.L496
	ldr	ip, .L519
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #372]
	ldr	r1, .L519+4
	ldr	r2, [r6, #1832]
	ldr	r3, [ip, #68]
	blx	r3
.L496:
	ldr	r0, [r5, #4056]
	ldr	r1, [r4, #620]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L473
	ldr	r3, .L519
	mov	r2, #504
	add	r1, r4, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #384]
	mov	r2, #1
	ldrb	r3, [r4, #512]	@ zero_extendqisi2
	strb	r2, [r5, #379]
	cmp	r3, #0
	movne	r3, #4
	strb	r3, [r5, #372]
	ldr	r3, [r4, #540]
	strb	r2, [r5, #377]
	str	r3, [r5, #388]
	str	r3, [r5, #396]
	str	r3, [r5, #392]
.L473:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L477:
	ldr	r2, [r4, #652]
	add	r6, r0, #24576
	ldr	r7, [r4, #656]
	ldr	lr, [r4, #572]
	and	r2, r2, #3
	orr	ip, ip, r2
	mov	r2, #3
	orr	ip, ip, #1792
	str	r7, [r4, #208]
	str	ip, [r4, #168]
	str	lr, [r4, #160]
	str	r2, [r4, #164]
	b	.L474
.L475:
	ldrb	ip, [r4, #512]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L479
	ldr	ip, [r4, #648]
	mov	r7, #3072
	ldr	lr, [r4, #656]
	cmp	ip, #0
	ldr	r10, [r4, #572]
	ldr	ip, [r4, #652]
	ldr	r9, [r4, #608]
	str	lr, [r4, #208]
	moveq	lr, #512
	movne	lr, #768
.L481:
	ldr	r8, [r4, #564]
	ldr	r6, [r4, #600]
	cmp	r8, r6
	beq	.L517
	movle	r6, #1
	movgt	r6, #0
	str	r6, [fp, #-48]
.L492:
	add	r6, r0, #24576
	ldrb	r8, [r6, #1852]	@ zero_extendqisi2
	cmp	r8, #3
	moveq	r8, #4096
	beq	.L493
	cmp	r8, #4
	ldrne	r8, [fp, #-48]
	moveq	r8, #0
	movne	r8, r8, asl #12
.L493:
	bic	r2, r2, #13056
	orr	lr, r7, lr
	bic	r2, r2, #3
	and	ip, ip, #3
	orr	r2, lr, r2
	str	r10, [r4, #160]
	orr	ip, r2, ip
	str	r9, [r4, #164]
	orr	ip, ip, r8
	str	ip, [r4, #168]
	b	.L474
.L479:
	ldr	r10, [r4, #568]
	ldr	ip, [r5, #4052]
	ldr	lr, [r4, #604]
	cmp	r10, ip
	bhi	.L518
	cmp	ip, lr
	bcc	.L485
.L483:
	ldr	r6, [r4, #656]
	mov	r7, #3
	ldr	ip, [r4, #652]
	ldr	r8, [r4, #572]
	str	r6, [r4, #208]
	ldr	r6, [r4, #608]
.L486:
	ldrb	r9, [r4, #3]	@ zero_extendqisi2
	cmp	r9, #1
	streq	lr, [r4, #208]
	moveq	ip, r6
	moveq	r7, #2048
	beq	.L488
	cmp	r9, #2
	streq	r10, [r4, #208]
	movne	r7, r7, asl #10
	moveq	ip, r8
	moveq	r7, #1024
.L488:
	mov	r10, r8
	mov	r9, r6
	str	r8, [r4, #160]
	mov	lr, #768
	str	r6, [r4, #164]
	b	.L481
.L485:
	ldr	ip, [r4, #572]
	mov	r7, #1
	ldr	r6, [r4, #608]
	str	r10, [r4, #208]
	mov	r8, ip
	b	.L486
.L517:
	ldr	r6, [r4, #172]
	cmp	r6, #720
	movne	r6, #1
	strne	r6, [fp, #-48]
	bne	.L492
	ldr	r6, [r4, #176]
	subs	r6, r6, #480
	movne	r6, #1
	str	r6, [fp, #-48]
	b	.L492
.L518:
	cmp	ip, lr
	bcc	.L483
	ldr	ip, [r4, #608]
	mov	r7, #2
	str	lr, [r4, #208]
	ldr	r8, [r4, #572]
	mov	r6, ip
	b	.L486
.L509:
	add	r6, r0, #24576
	b	.L474
.L520:
	.align	2
.L519:
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
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #84]
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
	ldrb	lr, [r0, #513]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #514]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #532]
	ldr	r2, [r0, #536]
	ldr	r3, [r0, #516]
	strb	r5, [r0, #548]
	strb	r4, [r0, #584]
	strb	lr, [r0, #549]
	strb	lr, [r0, #585]
	strb	ip, [r0, #550]
	strb	ip, [r0, #586]
	str	r1, [r0, #568]
	str	r1, [r0, #604]
	str	r2, [r0, #572]
	str	r2, [r0, #608]
	str	r3, [r0, #552]
	str	r3, [r0, #588]
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
	ldr	r2, [r0, #600]
	mov	lr, #3
	ldr	r1, [r0, #564]
	ldr	r3, [r0, #604]
	cmp	r2, r1
	ldr	r5, [r0, #568]
	ldrb	r4, [r0, #585]	@ zero_extendqisi2
	ldr	ip, [r0, #552]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #512]
	mov	r3, r3, lsr #1
	str	ip, [r0, #516]
	str	r2, [r0, #528]
	str	r2, [r0, #636]
	str	r3, [r0, #532]
	beq	.L525
	ldrb	r2, [r0, #549]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L526
.L525:
	ldr	r2, [r0, #584]
	mov	r1, #0
	strb	r1, [r0, #513]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L530
	ldr	r2, [r0, #548]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	ip, #1
	bne	.L528
.L530:
	mov	ip, #0
.L528:
	ldr	r2, [r0, #608]
	ldr	r1, [r0, #572]
	str	r3, [r0, #656]
	cmp	r2, r1
	strb	ip, [r0, #514]
	movcs	r3, r2
	movcc	r3, r1
	str	r3, [r0, #536]
	str	r3, [r0, #652]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L526:
	mov	r1, #1
	strb	r1, [r0, #513]
	b	.L530
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
	beq	.L561
	cmp	r2, #1
	beq	.L542
	cmp	r2, #2
	beq	.L543
	ldr	r8, [r7, #564]
	ldr	r9, [r7, #600]
.L544:
	add	r6, r5, #24576
	ldr	r1, [r6, #2332]
	cmp	r1, #0
	beq	.L553
	ldr	r4, [r6, #2076]
	cmp	r4, #0
	addne	r3, r5, #26624
	movne	r4, #0
	addne	r3, r3, #28
	bne	.L547
	b	.L545
.L551:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L545
.L547:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L551
.L553:
	mvn	r0, #0
.L557:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L543:
	ldr	r8, [r7, #600]
	mov	r9, r8
	b	.L544
.L545:
	add	r3, r5, #53248
	ldr	r1, [r7, #620]
	ldr	r0, [r3, #4056]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L548
	ldr	r3, [r0, #520]
	cmp	r3, #0
	beq	.L548
	add	r5, r5, r4, lsl #2
	mov	r3, #1
	add	r5, r5, #24576
	ldr	r1, .L562
	str	r3, [r5, #2076]
	ldr	r3, [r0, #520]
	mov	r0, #13
	ldr	r3, [r3, #4]
	str	r8, [r5, #2204]
	str	r9, [r5, #2268]
	str	r3, [r5, #2140]
	ldr	r3, [r6, #2336]
	ldr	r5, [r1, #68]
	cmp	r3, #15
	ldr	r1, .L562+4
	addls	r2, r3, #1
	mov	r3, r4
	movhi	r2, #16
	str	r2, [r6, #2336]
	ldr	r2, [r7, #204]
	blx	r5
	mov	r0, #0
	str	r4, [r7, #664]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L542:
	ldr	r8, [r7, #564]
	mov	r9, r8
	b	.L544
.L548:
	ldr	r1, .L562
	ldr	r2, [r7, #620]
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	ldr	r4, [r1, #68]
	mov	r1, #0
	stmia	sp, {r0, r1}
	mov	r0, r1
	ldr	r1, .L562+8
	blx	r4
	mvn	r0, #0
	b	.L557
.L561:
	ldr	ip, .L562
	mov	r0, r7
	movw	r3, #2222
	ldr	r2, .L562+12
	ldr	r1, .L562+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L557
.L563:
	.align	2
.L562:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC22
	.word	.LC23
	.word	.LC20
	.word	.LC21
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
	ldr	r1, [r2, #2068]
	ldr	r3, [r3, #1164]
	ldr	r2, [r2, #2064]
	rsb	r3, r1, r3
	cmp	r2, r3
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SlidingWinMark.part.3
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L577
	mov	r5, r0
	ldr	r3, [r3]
	tst	r3, #16384
	beq	.L566
	add	r7, r0, #24576
	ldr	r3, [r7, #2060]
	cmp	r3, #0
	beq	.L576
	add	r8, r0, #26368
	ldr	r6, .L577+4
	add	r8, r8, #68
	mov	r4, #0
.L571:
	ldr	ip, [r8, #4]!
	mov	r2, r4
	ldr	r9, [r6, #68]
	mov	r0, #14
	ldr	r1, .L577+8
	add	r4, r4, #1
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	ldr	r3, [ip, #624]
	str	lr, [sp, #4]
	ldr	ip, [ip, #636]
	str	ip, [sp]
	blx	r9
	ldr	r3, [r7, #2060]
	cmp	r3, r4
	bhi	.L571
.L572:
	ldr	r3, [r6, #68]
	mov	r0, #14
	ldr	r1, .L577+12
	blx	r3
	ldr	r3, [r7, #2064]
	cmp	r3, #0
	addne	r5, r5, #26368
	movne	r4, #0
	addne	r5, r5, #132
	beq	.L570
.L573:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r8, [r6, #68]
	mov	r0, #14
	ldr	r1, .L577+16
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	ldr	r3, [ip, #624]
	str	lr, [sp, #4]
	ldr	ip, [ip, #636]
	str	ip, [sp]
	blx	r8
	ldr	r3, [r5]
	mov	r2, r4
	ldr	r8, [r6, #68]
	ldr	r1, .L577+20
	mov	r0, #14
	ldr	r3, [r3, #528]
	add	r4, r4, #1
	blx	r8
	ldr	r3, [r7, #2064]
	cmp	r3, r4
	bhi	.L573
.L570:
	ldr	r3, [r6, #68]
	mov	r0, #14
	ldr	r1, .L577+12
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L566:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L576:
	ldr	r6, .L577+4
	b	.L572
.L578:
	.align	2
.L577:
	.word	g_PrintEnable
	.word	vfmw_Osal_Func_Ptr_S
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
	add	r3, r0, #53248
	ldrb	r2, [r3, #946]	@ zero_extendqisi2
	ldr	r4, [r3, #1464]
	strb	r2, [r4]
	ldrb	r2, [r3, #948]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	bne	.L580
	ldrb	r2, [r3, #949]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
.L580:
	strb	r2, [r4, #2]
	ldr	r2, [r3, #1472]
	str	r2, [r4, #624]
	ldr	r2, [r3, #1508]
	str	r2, [r4, #656]
	ldr	r2, [r3, #1500]
	str	r2, [r4, #652]
	ldr	r2, [r3, #1484]
	str	r2, [r4, #636]
	ldr	r2, [r3, #1532]
	str	r2, [r4, #660]
	ldr	r2, [r3, #1476]
	str	r2, [r4, #632]
	ldrb	r2, [r3, #953]	@ zero_extendqisi2
	str	r2, [r4, #648]
	ldrb	r2, [r3, #951]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r1, #3
	movne	r1, #0
	strb	r1, [r4, #3]
	ldrb	r2, [r3, #947]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L583
	bcc	.L584
	cmp	r2, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	str	r4, [r4, #588]
	mov	r0, #1
	strb	r0, [r4, #584]
	mov	r0, #0
	ldrb	ip, [r3, #948]	@ zero_extendqisi2
	strb	ip, [r4, #585]
	ldrb	ip, [r3, #949]	@ zero_extendqisi2
	strb	ip, [r4, #586]
	ldr	ip, [r3, #1492]
	str	ip, [r4, #600]
	ldr	lr, [r3, #1500]
	str	lr, [r4, #608]
	ldr	ip, [r3, #1508]
	str	r0, [r4, #648]
	str	ip, [r4, #604]
	ldrb	r5, [r3, #945]	@ zero_extendqisi2
	cmp	r5, r0
	beq	.L601
	ldr	r2, [r4, #568]
	mov	r5, #3
	strb	r5, [r4, #1]
	mvn	r7, #0
	add	ip, ip, r2
	str	ip, [r4, #656]
	str	ip, [r4, #532]
	mvn	r6, #0
	ldrb	r2, [r3, #951]	@ zero_extendqisi2
	cmp	r2, #1
	add	r2, r3, #944
	orreq	r0, r1, #2
	strb	r0, [r4, #3]
	ldrd	r8, [r2, #24]
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L592
	ldrd	r0, [r4, #16]
	cmp	r1, r7
	cmpeq	r0, r6
	beq	.L602
.L592:
	ldr	r2, [r4, #572]
.L599:
	cmp	r2, lr
	mov	r0, r4
	movcc	r2, lr
	str	r2, [r4, #652]
	ldr	r3, [r3, #1484]
	str	r3, [r4, #636]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	CombineFldsToFrm
.L584:
	str	r4, [r4, #516]
	mov	r1, #3
	mov	r2, #0
	strb	r1, [r4, #1]
	strb	r2, [r4, #512]
	add	r1, r3, #960
	ldrb	r5, [r3, #948]	@ zero_extendqisi2
	mov	r2, #504
	add	r0, r4, #8
	strb	r5, [r4, #513]
	ldrb	r6, [r3, #949]	@ zero_extendqisi2
	strb	r6, [r4, #514]
	ldr	ip, [r3, #1488]
	str	ip, [r4, #528]
	ldr	r7, [r3, #1500]
	str	r7, [r4, #536]
	ldr	r8, [r3, #1508]
	str	r8, [r4, #532]
	ldr	ip, [r3, #1492]
	str	ip, [r4, #564]
	ldr	r3, [r3, #1496]
	str	r3, [r4, #600]
	bl	memcpy
	mov	r2, #1
	mov	r3, #2
	str	r8, [r4, #568]
	str	r8, [r4, #604]
	str	r7, [r4, #572]
	str	r7, [r4, #608]
	strb	r6, [r4, #550]
	strb	r6, [r4, #586]
	strb	r5, [r4, #549]
	strb	r5, [r4, #585]
	str	r4, [r4, #552]
	str	r4, [r4, #588]
	strb	r2, [r4, #548]
	strb	r3, [r4, #584]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L583:
	strb	r2, [r4, #548]
	mov	r0, #0
	str	r4, [r4, #552]
	ldrb	ip, [r3, #948]	@ zero_extendqisi2
	strb	ip, [r4, #549]
	ldrb	ip, [r3, #949]	@ zero_extendqisi2
	strb	ip, [r4, #550]
	ldr	ip, [r3, #1492]
	str	ip, [r4, #564]
	ldr	lr, [r3, #1500]
	str	lr, [r4, #572]
	ldr	ip, [r3, #1508]
	str	r0, [r4, #648]
	str	ip, [r4, #568]
	ldrb	r5, [r3, #945]	@ zero_extendqisi2
	cmp	r5, r0
	beq	.L603
	ldr	r2, [r4, #604]
	mov	r5, #3
	strb	r5, [r4, #1]
	mvn	r7, #0
	add	ip, ip, r2
	str	ip, [r4, #656]
	str	ip, [r4, #532]
	mvn	r6, #0
	ldrb	r2, [r3, #951]	@ zero_extendqisi2
	cmp	r2, #1
	add	r2, r3, #944
	orreq	r0, r1, #1
	strb	r0, [r4, #3]
	ldrd	r8, [r2, #24]
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L588
	ldrd	r0, [r4, #16]
	cmp	r1, r7
	cmpeq	r0, r6
	streqd	r8, [r4, #16]
.L588:
	ldr	r2, [r4, #608]
	b	.L599
.L601:
	strb	r2, [r4, #1]
	add	r1, r3, #960
	str	ip, [r4, #656]
	add	r0, r4, #8
	str	ip, [r4, #532]
	mov	r2, #504
	ldrb	r3, [r3, #951]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r5, #2
	strb	r5, [r4, #3]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L603:
	strb	r2, [r4, #1]
	add	r1, r3, #960
	str	ip, [r4, #656]
	add	r0, r4, #8
	str	ip, [r4, #532]
	mov	r2, #504
	ldrb	r3, [r3, #951]	@ zero_extendqisi2
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #3]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L602:
	strd	r8, [r4, #16]
	b	.L592
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
	ldr	r1, [r3, #2060]
	ldr	r2, [r3, #2056]
	cmp	r1, r2
	bcs	.L610
.L605:
	add	r0, r4, #53248
	mov	r2, #0
	ldr	r3, [r0, #1480]
	strb	r2, [r0, #948]
	cmp	r3, r2
	movne	r3, #1
	strneb	r3, [r0, #949]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L610:
	ldr	r1, [r3, #1864]
	bl	UnMarkFrameStoreRef
	mov	r1, #0
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB.part.1
	b	.L605
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L619
	ldr	r8, .L620
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #4]
.L614:
	ldr	r3, [r4, #8]
	mov	r0, r6
	cmp	r3, #0
	beq	.L613
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #12]
	ldr	r9, [r8, #68]
	mov	r0, #7
	ldr	r2, [r4, #8]
	ldr	r1, .L620+4
	blx	r9
	mov	r3, #0
	str	r3, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
.L613:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L614
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L619:
	ldr	ip, .L620
	mov	r0, r5
	movw	r3, #4186
	ldr	r2, .L620+8
	ldr	r1, .L620+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L621:
	.align	2
.L620:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LC20
	.word	.LC21
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
	beq	.L623
	add	r3, r0, #53248
	ldr	r0, [r3, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L623:
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
	ldr	r3, .L632
	mov	r5, r0
	ldr	r1, .L632+4
	mov	r0, #1
	add	r4, r5, #53248
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L628
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L628:
	ldr	r3, [r4, #4012]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #4012]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L633:
	.align	2
.L632:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC28
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
	add	r6, r0, #53248
	b	.L636
.L635:
	add	r4, r4, #96
	cmp	r4, r5
	beq	.L638
.L636:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L635
	mov	r1, r4
	ldr	r0, [r6, #4056]
	add	r4, r4, #96
	bl	ReleaseNAL
	cmp	r4, r5
	bne	.L636
.L638:
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
	add	r4, r0, #55296
	add	r5, r0, #55808
	add	r4, r4, #128
	add	r5, r5, #160
	add	r6, r0, #53248
	mov	r7, #0
.L641:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L640
	ldr	r0, [r6, #4056]
	bl	ReleaseNAL
	str	r7, [r4]
.L640:
	cmp	r4, r5
	bne	.L641
	mov	r0, #0
	str	r0, [r6, #3980]
	str	r0, [r6, #4040]
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
	str	r1, [r3, #1872]
	strb	ip, [r3, #1857]
	mov	r1, #7
	str	r0, [r3, #1864]
	mov	r0, #32
	str	r1, [r3, #1868]
	mov	r1, #3
	strb	r0, [r3, #1858]
	mvn	r0, #0
	str	r1, [r3, #1880]
	mov	r1, #262144
	str	r0, [r3, #1884]
	mov	r0, r2
	str	r1, [r3, #1896]
	strb	r2, [r3, #1856]
	str	r2, [r3, #1888]
	str	r2, [r3, #1892]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
	.align	2
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 40
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
	ldr	r6, .L655
	mov	r4, r1
	mov	r7, r2
	mov	r5, r0
	mov	r2, #32
	ldr	r3, [r6, #48]
	sub	r0, fp, #68
	mov	r1, #0
	blx	r3
	ldr	r3, [r5]
	str	r7, [fp, #-40]
	mov	r2, #0
	str	r4, [fp, #-60]
	ldr	r3, [r3, #28]
	str	r7, [fp, #-56]
	cmp	r3, #24
	str	r4, [fp, #-52]
	str	r7, [fp, #-48]
	str	r4, [fp, #-44]
	strb	r2, [fp, #-68]
	strb	r2, [fp, #-67]
	beq	.L648
	add	r1, r5, #24576
	ldrb	r3, [fp, #4]	@ zero_extendqisi2
	strb	r2, [fp, #-63]
	mov	r0, #5
	ldr	r2, [r1, #2056]
	strb	r0, [fp, #-62]
	add	r2, r2, #1
	strb	r2, [fp, #-64]
.L652:
	add	r7, r5, #53248
	sub	r1, fp, #68
	strb	r3, [fp, #-61]
	mov	r8, #0
	ldr	r0, [r7, #4056]
	mov	r4, #1
	strb	r8, [fp, #-65]
	strb	r4, [fp, #-66]
	bl	FSP_ConfigInstance
	subs	r9, r0, #0
	bne	.L649
	ldr	r1, [r5]
	sub	r3, fp, #72
	ldr	r0, [r7, #4056]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, r8
	moveq	r0, r4
	bne	.L654
.L653:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L648:
	mov	r3, #1
	strb	r2, [fp, #-63]
	strb	r3, [fp, #-64]
	mov	r2, #5
	strb	r2, [fp, #-62]
	b	.L652
.L649:
	ldr	r3, [r6, #68]
	mov	r0, r8
	ldr	r1, .L655+4
	blx	r3
	mvn	r0, #19
	b	.L653
.L654:
	ldr	r3, [r6, #68]
	mov	r0, r9
	ldr	r1, .L655+8
	blx	r3
	mvn	r0, #19
	b	.L653
.L656:
	.align	2
.L655:
	.word	vfmw_Osal_Func_Ptr_S
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
	add	r3, r0, #20480
	mov	r4, r0
	ldrb	r2, [r3, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L659
	bcc	.L674
	cmp	r2, #2
	bne	.L683
.L675:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L683:
	ldr	r3, .L687
	mov	r0, #1
	ldr	r1, .L687+4
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L674:
	mov	r6, #1
.L660:
	add	lr, r4, #20480
	add	ip, r4, #26880
	add	lr, lr, #248
	mov	r5, #0
	add	ip, ip, #164
	add	r7, r4, #53248
	ldr	r3, [lr, #4]!
	mov	r2, r5
	mov	r8, #1
	cmp	r3, #0
	beq	.L662
.L685:
	ldr	r10, [ip]
	cmp	r10, #0
	bne	.L676
	mov	r0, ip
	mov	r1, r10
	b	.L664
.L665:
	ldr	r9, [r0, #4]!
	cmp	r9, #0
	bne	.L663
.L664:
	add	r1, r1, #1
	cmp	r1, r3
	bne	.L665
	ldr	r1, [r4]
	ldr	r1, [r1, #12]
	cmp	r1, #2
	bne	.L684
	ldr	r5, [r7, #1464]
	add	r5, r5, #512
.L667:
	mov	r9, r10
	mov	r0, ip
	mov	r1, #0
	b	.L673
.L669:
	ldr	r9, [r0, #4]!
.L673:
	add	r1, r1, #1
	cmp	r9, #0
	streq	r5, [r0]
	cmp	r1, r3
	bne	.L669
	add	r2, r2, #1
	add	ip, ip, #132
	cmp	r6, r2
	bls	.L675
.L682:
	ldr	r3, [lr, #4]!
	cmp	r3, #0
	bne	.L685
.L662:
	ldr	r1, [r4]
	ldr	r1, [r1, #12]
	cmp	r1, #2
	bne	.L686
	add	r2, r2, #1
	str	r8, [lr]
	cmp	r6, r2
	ldr	r3, [r7, #1464]
	add	ip, ip, #132
	add	r3, r3, #512
	str	r3, [ip, #-132]
	bhi	.L682
	b	.L675
.L676:
	mov	r9, r10
.L663:
	mov	r5, r9
	b	.L667
.L659:
	mov	r6, #2
	b	.L660
.L686:
	ldr	ip, .L687
	ldr	r1, .L687+8
.L680:
	ldr	r5, [ip, #68]
	mov	r0, #1
	blx	r5
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L684:
	ldr	ip, .L687
	mov	r2, r5
	mov	r3, #0
	ldr	r1, .L687+12
	b	.L680
.L688:
	.align	2
.L687:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC31
	.word	.LC33
	.word	.LC32
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
	beq	.L690
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L690:
	add	r3, r0, #24576
	ldr	r5, [r3, #2064]
	cmp	r5, #0
	beq	.L698
	add	r3, r0, #26368
	mov	r2, #0
	add	r3, r3, #136
	b	.L695
.L708:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L706
.L693:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L707
.L695:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L708
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L694
	ldr	ip, [r0, #548]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L709
.L694:
	tst	lr, #2
	beq	.L693
	ldr	ip, [r0, #584]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L693
	ldr	ip, [r0, #596]
	cmp	ip, r1
	bne	.L693
	add	r0, r0, #584
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L706:
	ldr	ip, [r0, #512]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L693
	ldr	ip, [r0, #524]
	cmp	ip, r1
	bne	.L693
	add	r0, r0, #512
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L709:
	ldr	ip, [r0, #560]
	cmp	ip, r1
	bne	.L694
	add	r0, r0, #548
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L707:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L698:
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
	beq	.L711
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L711:
	add	r3, r0, #24576
	ldr	r5, [r3, #2068]
	cmp	r5, #0
	beq	.L719
	add	r3, r0, #26368
	mov	r2, #0
	add	r3, r3, #200
	b	.L716
.L729:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L727
.L714:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L728
.L716:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L729
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L715
	ldr	ip, [r0, #548]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L730
.L715:
	tst	lr, #2
	beq	.L714
	ldr	ip, [r0, #584]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L714
	ldr	ip, [r0, #592]
	cmp	ip, r1
	bne	.L714
	add	r0, r0, #584
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L727:
	ldr	ip, [r0, #512]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L714
	ldr	ip, [r0, #520]
	cmp	ip, r1
	bne	.L714
	add	r0, r0, #512
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L730:
	ldr	ip, [r0, #556]
	cmp	ip, r1
	bne	.L715
	add	r0, r0, #548
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L728:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L719:
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
	ble	.L732
	add	ip, r4, r2, lsl #2
	mov	r1, r2
.L733:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L733
.L732:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r4, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r7, #2
	add	r3, r4, r0, lsl #2
	mov	ip, r0
.L737:
	ldr	r1, [r3], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L735
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L736
	ldr	lr, [r1, #12]
	cmp	lr, r5
	beq	.L735
.L736:
	str	r1, [r4, ip, asl #2]
	add	ip, ip, #1
.L735:
	cmp	r0, r2
	bne	.L737
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
	ble	.L745
	add	ip, r4, r2, lsl #2
	mov	r1, r2
.L746:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L746
.L745:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r4, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r7, #2
	add	r3, r4, r0, lsl #2
	mov	ip, r0
.L750:
	ldr	r1, [r3], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L748
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L749
	ldr	lr, [r1, #8]
	cmp	lr, r5
	beq	.L748
.L749:
	str	r1, [r4, ip, asl #2]
	add	ip, ip, #1
.L748:
	cmp	r0, r2
	bne	.L750
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
	ldr	r1, [r2, #220]
	mov	lr, #2208
	beq	.L761
	ldr	r0, [r2, #228]
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
	ldr	r3, [r3, #2904]
	add	r3, r3, #4
	mov	r3, r1, asl r3
	str	r3, [fp, #-60]
.L771:
	adds	r10, r9, #2
	beq	.L760
	ldr	r3, [r7]
	cmp	r3, #3
	beq	.L760
	ldr	r6, [fp, #8]
	mov	r4, #0
	ldr	r5, [fp, #-64]
	b	.L764
.L765:
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
	beq	.L760
.L770:
	ldr	r3, [r7, #4]!
	add	r6, r6, #4
	cmp	r3, #3
	beq	.L760
.L764:
	cmp	r3, #1
	bhi	.L765
	cmp	r3, #0
	ldr	r3, [r6]
	bne	.L766
	mvn	r3, r3
	adds	r5, r5, r3
	ldrmi	r3, [fp, #-60]
	addmi	r5, r5, r3
.L767:
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
	bne	.L770
.L760:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L766:
	add	r3, r3, #1
	add	r5, r5, r3
	ldr	r3, [fp, #-60]
	cmp	r3, r5
	rsble	r5, r3, r5
	b	.L767
.L761:
	ldr	r2, [r2, #228]
	mov	ip, #4000
	mov	r0, #1
	str	r2, [fp, #-64]
	ldr	r2, [r3, #1304]
	ldr	r3, [r3, #1300]
	mla	r2, lr, r1, r2
	ldr	r2, [r2, #28]
	mla	r3, ip, r2, r3
	ldr	r3, [r3, #2904]
	add	r3, r3, #4
	mov	r3, r0, asl r3
	str	r3, [fp, #-60]
	b	.L771
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
	beq	.L779
	add	r6, r0, #16384
	ldrb	r2, [r6, #3512]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L791
.L782:
	cmp	r3, #1
	ldr	r3, [r4, #264]
	add	r3, r3, #1
	str	r3, [r4, #252]
	bne	.L779
	ldrb	r3, [r6, #3513]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L792
.L784:
	ldr	r3, [r4, #268]
	add	r3, r3, #1
	str	r3, [r4, #256]
.L779:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L791:
	add	r1, r0, #19968
	ldr	r3, [r4, #264]
	add	r2, r0, #20224
	add	ip, r0, #19712
	add	r1, r1, #196
	str	r1, [sp, #4]
	add	r1, r0, #26880
	add	r2, r2, #204
	add	ip, ip, #188
	str	r2, [sp, #8]
	str	ip, [sp]
	add	r2, r4, #252
	add	r1, r1, #164
	bl	ReorderRefPiclist
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	b	.L782
.L792:
	add	ip, r5, #20480
	add	r0, r5, #20224
	add	r2, r5, #19968
	add	r1, r5, #27136
	ldr	r3, [r4, #268]
	add	ip, ip, #76
	add	r0, r0, #72
	add	r2, r2, #64
	stmib	sp, {r0, ip}
	add	r1, r1, #40
	str	r2, [sp]
	mov	r0, r5
	add	r2, r5, #20736
	bl	ReorderRefPiclist
	b	.L784
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
	ldr	lr, .L856
	movcc	r4, r2
	ldr	ip, .L856+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L796
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L804
.L805:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L804
	cmp	r2, #0
	beq	.L810
	add	r8, r7, r5, lsl #2
	b	.L809
.L806:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L810
.L809:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L806
	add	r0, r0, #584
	blx	r6
	cmp	r0, #0
	beq	.L806
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #584
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L810:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L812
	b	.L805
.L811:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L805
.L812:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	tst	r1, #1
	beq	.L811
	add	r0, r0, #548
	blx	r6
	cmp	r0, #0
	beq	.L811
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #548
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L805
.L855:
	add	r0, r0, #548
	blx	r6
	cmp	r0, #0
	beq	.L797
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #548
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L801:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L803
	b	.L796
.L802:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L796
.L803:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L802
	add	r0, r0, #584
	blx	r6
	cmp	r0, #0
	beq	.L802
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #584
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L796:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L804
	cmp	r2, #0
	beq	.L801
	add	r9, r7, r10, lsl #2
	b	.L800
.L797:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L801
.L800:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L797
	b	.L855
.L804:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L857:
	.align	2
.L856:
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
	bne	.L859
	ldrb	r6, [r9, #947]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L983
	add	r3, r0, #24576
	str	r3, [fp, #-240]
	ldr	ip, [r3, #2064]
	cmp	ip, #0
	beq	.L926
	add	r1, r0, #26368
	mov	r3, r6
	add	r1, r1, #132
	b	.L865
.L864:
	cmp	r3, ip
	beq	.L863
.L865:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L864
	ldr	r0, [r2, #512]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L864
	add	r0, r6, #6720
	cmp	r3, ip
	add	r0, r0, #40
	add	r2, r2, #512
	add	r6, r6, #1
	add	r0, r4, r0, lsl #2
	str	r2, [r0, #4]
	bne	.L865
.L863:
	add	r0, r4, #26880
	ldr	r3, .L991
	mov	r1, r6
	add	r0, r0, #164
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	str	r6, [r7, #252]
	ldr	r1, [r3, #2068]
	cmp	r1, #0
	beq	.L927
	add	r0, r4, #26368
	mov	r5, r6
	add	r0, r0, #196
	mov	r3, #0
	b	.L868
.L867:
	cmp	r3, r1
	beq	.L984
.L868:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L867
	ldr	ip, [r2, #512]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L867
	add	ip, r5, #6720
	cmp	r3, r1
	add	ip, ip, #40
	add	r2, r2, #512
	add	r5, r5, #1
	add	ip, r4, ip, lsl #2
	str	r2, [ip, #4]
	bne	.L868
.L984:
	rsb	r1, r6, r5
.L866:
	add	r0, r4, r6, lsl #2
	ldr	r3, .L991+4
	add	r0, r0, #26880
	mov	r2, #4
	add	r0, r0, #164
	bl	qsort
	mov	r2, r5
	cmp	r2, #0
	mov	r3, #0
	str	r5, [r7, #252]
	str	r3, [r7, #256]
	beq	.L985
.L874:
	ldr	r0, [r7, #264]
	ldr	r1, [r7, #268]
	add	r0, r0, #1
	cmp	r2, r0
	add	r1, r1, #1
	movcs	r2, r0
	cmp	r3, r1
	str	r2, [r7, #252]
	movcs	r3, r1
	cmp	r2, #32
	str	r3, [r7, #256]
	bhi	.L918
	add	r2, r2, #6720
	add	r1, r4, #27136
	add	r2, r2, #40
	add	r1, r1, #36
	mov	r0, #0
	add	r2, r4, r2, lsl #2
.L917:
	str	r0, [r2, #4]!
	cmp	r2, r1
	bne	.L917
.L918:
	cmp	r3, #32
	bhi	.L916
	add	r3, r3, #6784
	add	r2, r4, #27136
	add	r3, r3, #9
	add	r2, r2, #168
	mov	r1, #0
	add	r4, r4, r3, lsl #2
.L919:
	str	r1, [r4, #4]!
	cmp	r4, r2
	bne	.L919
.L916:
	mov	r0, #0
.L969:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L859:
	ldrb	r5, [r9, #947]	@ zero_extendqisi2
	add	r3, r0, #24576
	str	r3, [fp, #-240]
	cmp	r5, #0
	ldr	r10, [r3, #2064]
	beq	.L880
	cmp	r10, #0
	beq	.L986
	add	r6, r0, #26368
	mov	r5, #0
	add	r6, r6, #132
	mov	r3, r5
	mov	r1, r6
.L899:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L898
	sub	r0, fp, #44
	ldr	ip, [r9, #1484]
	add	lr, r0, r5, lsl #2
	ldr	r0, [r2, #636]
	cmp	ip, r0
	strge	r2, [lr, #-192]
	addge	r5, r5, #1
.L898:
	cmp	r3, r10
	bne	.L899
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r5
	mov	r0, r3
	ldr	r3, .L991+8
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2064]
	cmp	r8, #0
	beq	.L980
.L924:
	mov	r10, r5
	mov	r3, #0
.L902:
	ldr	r2, [r6, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L901
	sub	r1, fp, #44
	ldr	r0, [r9, #1484]
	add	ip, r1, r10, lsl #2
	ldr	r1, [r2, #636]
	cmp	r0, r1
	strlt	r2, [ip, #-192]
	addlt	r10, r10, #1
.L901:
	cmp	r3, r8
	bne	.L902
	ldr	r2, [fp, #-244]
	rsb	r8, r5, r10
	mov	r3, r5, asl #2
	str	r3, [fp, #-248]
	add	r0, r2, r3
	mov	r1, r8
	ldr	r3, .L991+12
	mov	r2, #4
	bl	qsort
	cmp	r5, #0
	subeq	r6, fp, #172
	beq	.L903
.L921:
	sub	r6, fp, #172
	ldr	r2, [fp, #-244]
	add	r8, r6, r8, lsl #2
	mov	r3, #0
.L904:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r5
	str	r1, [r8], #4
	bcc	.L904
.L903:
	cmp	r10, r5
	bls	.L905
	ldr	r3, [fp, #-244]
	ldr	r2, [fp, #-248]
	add	r2, r3, r2
	mov	r3, r6
.L906:
	add	r5, r5, #1
	ldr	r1, [r2], #4
	cmp	r5, r10
	str	r1, [r3], #4
	bne	.L906
.L905:
	add	r2, r4, #20480
	add	r8, r4, #27136
	add	r2, r2, #252
	add	r3, r4, #26880
	add	r8, r8, #40
	mov	r5, #0
	mov	ip, r2
	str	r5, [r7, #252]
	str	r5, [r7, #256]
	add	r3, r3, #164
	ldrb	r0, [r9, #947]	@ zero_extendqisi2
	ldr	r1, [fp, #-244]
	str	ip, [sp]
	str	r2, [fp, #-244]
	mov	r2, r10
	str	r5, [sp, #4]
	str	r3, [fp, #-248]
	bl	GenPiclistfromFrmlist
	ldrb	r0, [r9, #947]	@ zero_extendqisi2
	add	ip, r4, #20736
	mov	r2, r10
	mov	r1, r6
	mov	r3, r8
	str	r5, [sp, #4]
	str	ip, [sp]
	str	ip, [fp, #-252]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r6, [r3, #2068]
	cmp	r6, r5
	subeq	r10, fp, #108
	beq	.L907
	add	r3, r4, #26368
	sub	r10, fp, #108
	add	r3, r3, #196
	mov	r2, r10
.L908:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r6
	str	r1, [r2], #4
	bne	.L908
.L907:
	ldr	r3, .L991+16
	mov	r2, #4
	mov	r1, r6
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-244]
	ldrb	r0, [r9, #947]	@ zero_extendqisi2
	mov	r5, #1
	mov	r2, r6
	mov	r1, r10
	str	r3, [sp]
	str	r5, [sp, #4]
	ldr	r3, [fp, #-248]
	bl	GenPiclistfromFrmlist
	ldr	r2, [fp, #-252]
	ldrb	r0, [r9, #947]	@ zero_extendqisi2
	mov	r3, r8
	mov	r1, r10
	str	r5, [sp, #4]
	str	r2, [sp]
	mov	r2, r6
	bl	GenPiclistfromFrmlist
	ldr	r2, [r7, #252]
	ldr	r3, [r7, #256]
	rsb	r1, r3, r2
	clz	r1, r1
	mov	r1, r1, lsr #5
.L897:
	cmp	r2, #1
	movls	r1, #0
	andhi	r1, r1, #1
	cmp	r1, #0
	beq	.L909
	cmp	r2, #0
	ldr	r1, [fp, #-240]
	beq	.L910
	ldr	r6, [r1, #2468]
	ldr	r1, [r1, #2600]
	cmp	r6, r1
	bne	.L909
	add	r0, r4, #27136
	ldr	ip, [fp, #-248]
	add	r0, r0, #40
	mov	r1, #0
	b	.L911
.L912:
	ldr	r5, [ip, #4]!
	ldr	lr, [r0, #4]!
	cmp	r5, lr
	bne	.L909
.L911:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L912
.L913:
	ldr	r0, [fp, #-240]
	ldr	r1, [r0, #2604]
	str	r6, [r0, #2604]
	str	r1, [r0, #2600]
.L909:
	orrs	r1, r2, r3
	bne	.L874
	ldr	r3, .L991+20
	mov	r0, #1
	ldr	r1, .L991+24
.L975:
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L969
.L880:
	cmp	r10, #0
	beq	.L883
	add	r6, r0, #26368
	mov	r3, r5
	add	r6, r6, #132
	mov	r1, r6
	b	.L885
.L884:
	cmp	r3, r10
	beq	.L987
.L885:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L884
	add	r0, r5, #6720
	ldr	ip, [r2, #528]
	add	r0, r0, #40
	ldr	lr, [r9, #1488]
	add	r2, r2, #512
	add	r0, r4, r0, lsl #2
	cmp	lr, ip
	addge	r5, r5, #1
	strge	r2, [r0, #4]
	cmp	r3, r10
	bne	.L885
.L987:
	add	r3, r4, #26880
	mov	r1, r5
	mov	r2, r3
	add	r2, r2, #164
	ldr	r3, .L991+28
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2064]
	cmp	r8, #0
	beq	.L979
.L922:
	mov	r10, r5
	mov	r3, #0
	b	.L888
.L887:
	cmp	r3, r8
	beq	.L988
.L888:
	ldr	r2, [r6, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #3
	bne	.L887
	add	r1, r10, #6720
	ldr	r0, [r2, #528]
	add	r1, r1, #40
	ldr	ip, [r9, #1488]
	add	r2, r2, #512
	add	r1, r4, r1, lsl #2
	cmp	ip, r0
	addlt	r10, r10, #1
	strlt	r2, [r1, #4]
	cmp	r3, r8
	bne	.L888
.L988:
	add	r6, r5, #6720
	rsb	r8, r5, r10
	add	r6, r6, #40
	mov	r2, #4
	ldr	r3, .L991+32
	mov	r1, r8
	add	r0, r4, r6, lsl #2
	add	r9, r4, r10, lsl #2
	add	r0, r0, r2
	add	r9, r9, #26880
	bl	qsort
	cmp	r5, #0
	add	r9, r9, #164
	beq	.L890
.L920:
	add	r8, r8, #6784
	add	r2, r4, #26880
	add	r8, r8, #9
	add	r2, r2, #160
	mov	r3, #0
	add	r8, r4, r8, lsl #2
.L891:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r5
	str	r1, [r8, #4]!
	bcc	.L891
.L890:
	cmp	r10, r5
	bls	.L892
	add	r3, r4, #27136
	add	r6, r4, r6, lsl #2
	add	r3, r3, #36
.L893:
	add	r5, r5, #1
	ldr	r2, [r6, #4]!
	cmp	r5, r10
	str	r2, [r3, #4]!
	bne	.L893
.L892:
	ldr	r3, [fp, #-240]
	str	r10, [r7, #256]
	str	r10, [r7, #252]
	ldr	r1, [r3, #2068]
	cmp	r1, #0
	beq	.L929
	add	r0, r4, #26368
	mov	r5, r10
	add	r0, r0, #196
	mov	r3, #0
	b	.L896
.L895:
	cmp	r3, r1
	beq	.L989
.L896:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L895
	ldrb	ip, [r2, #513]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L895
	add	ip, r4, r5, lsl #2
	cmp	r3, r1
	add	ip, ip, #24576
	add	r2, r2, #512
	add	r5, r5, #1
	str	r2, [ip, #2468]
	str	r2, [ip, #2600]
	bne	.L896
.L989:
	rsb	r1, r10, r5
.L894:
	mov	r0, r9
	ldr	r3, .L991+4
	mov	r2, #4
	bl	qsort
	ldr	r0, [r7, #252]
	ldr	r3, .L991+4
	mov	r2, #4
	rsb	r1, r0, r5
	add	r0, r4, r0, lsl #2
	add	r0, r0, #27136
	add	r0, r0, #40
	bl	qsort
	mov	r3, r5
	str	r5, [r7, #256]
	mov	r2, r5
	str	r5, [r7, #252]
	mov	r1, #1
	b	.L897
.L983:
	add	r2, r0, #24576
	str	r2, [fp, #-240]
	ldr	lr, [r2, #2064]
	cmp	lr, #0
	moveq	r6, lr
	beq	.L862
	add	r1, r0, #26368
	mov	r6, r3
	add	r1, r1, #132
.L871:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r6, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r6, r6, #1
	cmp	r3, lr
	bne	.L871
.L862:
	mov	r1, r6
	ldr	r3, .L991+36
	mov	r2, #4
	sub	r0, fp, #236
	add	r8, r4, #26880
	bl	qsort
	add	r8, r8, #164
	add	r3, r4, #20480
	mov	r5, #0
	mov	r2, r6
	str	r5, [r7, #252]
	mov	ip, r3
	ldrb	r0, [r9, #947]	@ zero_extendqisi2
	add	ip, ip, #252
	mov	r3, r8
	sub	r1, fp, #236
	str	r5, [sp, #4]
	str	ip, [sp]
	str	ip, [fp, #-244]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r6, [r3, #2068]
	cmp	r6, r5
	subeq	r10, fp, #108
	beq	.L872
	add	r3, r4, #26368
	sub	r10, fp, #108
	add	r3, r3, #196
	mov	r2, r10
.L873:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r6
	str	r1, [r2], #4
	bne	.L873
.L872:
	ldr	r3, .L991+16
	mov	r2, #4
	mov	r1, r6
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-244]
	ldrb	r0, [r9, #947]	@ zero_extendqisi2
	mov	r2, r6
	mov	ip, #1
	mov	r1, r10
	str	r3, [sp]
	mov	r3, r8
	str	ip, [sp, #4]
	bl	GenPiclistfromFrmlist
	ldr	r2, [r7, #252]
	mov	r3, #0
	str	r3, [r7, #256]
	cmp	r2, #0
	bne	.L874
.L985:
	ldr	r3, [r4]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L875
	ldrb	r3, [r9, #947]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L990
	cmp	r3, #1
	ldr	r2, [fp, #-240]
	ldr	r3, [r9, #1464]
	addeq	r3, r3, #548
	addne	r3, r3, #584
	str	r3, [r2, #2468]
.L877:
	mov	r3, #0
	mov	r2, #1
	b	.L874
.L990:
	ldr	r2, [fp, #-240]
	ldr	r3, [r9, #1464]
	add	r3, r3, #512
	str	r3, [r2, #2468]
	b	.L877
.L910:
	ldr	r6, [r1, #2600]
	b	.L913
.L979:
	add	r6, r5, #6720
	mov	r2, #4
	add	r6, r6, #40
	ldr	r3, .L991+32
	mov	r1, r8
	add	r9, r4, r6, lsl #2
	add	r9, r9, r2
	mov	r0, r9
	bl	qsort
	subs	r10, r5, #0
	bne	.L920
	b	.L892
.L980:
	mov	r3, r5, asl #2
	ldr	r1, [fp, #-244]
	str	r3, [fp, #-248]
	mov	r2, r3
	ldr	r3, .L991+12
	add	r0, r1, r2
	mov	r2, #4
	mov	r1, r8
	bl	qsort
	subs	r10, r5, #0
	bne	.L921
.L976:
	sub	r6, fp, #172
	b	.L905
.L926:
	mov	r6, ip
	b	.L863
.L986:
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L991+8
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2064]
	cmp	r8, #0
	addne	r6, r4, #26368
	movne	r5, r10
	addne	r6, r6, #132
	bne	.L924
	ldr	r3, .L991+12
	mov	r2, #4
	mov	r1, r8
	ldr	r0, [fp, #-244]
	mov	r10, r8
	bl	qsort
	b	.L976
.L883:
	add	r3, r0, #26880
	mov	r1, r10
	mov	r2, r3
	add	r2, r2, #164
	ldr	r3, .L991+28
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r8, [r3, #2064]
	cmp	r8, #0
	addne	r6, r4, #26368
	movne	r5, r10
	addne	r6, r6, #132
	bne	.L922
	ldr	r9, [fp, #-248]
	mov	r2, #4
	ldr	r3, .L991+32
	mov	r1, r8
	mov	r10, r8
	mov	r0, r9
	bl	qsort
	b	.L892
.L927:
	mov	r5, r6
	b	.L866
.L929:
	mov	r5, r10
	b	.L894
.L875:
	ldr	r3, .L991+20
	mov	r0, #1
	ldr	r1, .L991+40
	b	.L975
.L992:
	.align	2
.L991:
	.word	compare_pic_by_pic_num_desc
	.word	compare_pic_by_lt_pic_num_asc
	.word	compare_fs_by_poc_desc
	.word	compare_fs_by_poc_asc
	.word	compare_fs_by_lt_pic_idx_asc
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC35
	.word	compare_pic_by_poc_desc
	.word	compare_pic_by_poc_asc
	.word	compare_fs_by_frame_num_desc
	.word	.LC34
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
	ldr	r3, .L995
	ldr	r3, [r3]
	tst	r3, #8192
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DumpList.part.6
.L996:
	.align	2
.L995:
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
	ldr	r4, [r3, #2060]
	cmp	r4, #0
	beq	.L1002
	ldr	r3, [r3, #1864]
	add	r2, r0, #53248
	ldr	r5, [r2, #1484]
	ldr	lr, [r3, #636]
	rsb	lr, lr, r5
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	r4, #1
	bls	.L1003
	add	r1, r0, #26368
	mov	r2, #1
	add	r1, r1, #72
	mov	r0, #0
.L1001:
	ldr	ip, [r1, #4]!
	add	r2, r2, #1
	ldr	r3, [ip, #636]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r0, [ip, #204]
	movlt	lr, r3
	cmp	r2, r4
	bne	.L1001
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1003:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1002:
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
	ldrb	ip, [r2, #947]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1035
	ldr	lr, [r3, #252]
	mov	r4, r5
	mov	r6, r5
	add	r4, r4, #40
	add	r5, r5, #36
	add	r6, r6, #160
	mov	r7, ip
.L1009:
	cmp	lr, #0
	beq	.L1013
	mov	r2, r6
	mov	r0, #32
	mov	r3, #0
	b	.L1011
.L1010:
	add	r3, r3, #1
	cmp	r3, #32
	cmpls	r3, lr
	bcs	.L1036
.L1011:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #664]
	cmp	r1, ip
	bne	.L1010
	cmp	r0, r3
	movcs	r0, r3
	add	r3, r3, #1
	cmp	r3, #32
	cmpls	r3, lr
	str	r0, [r4, #-4]
	str	r0, [r5, #4]
	bcc	.L1011
.L1036:
	cmp	r0, #31
	bls	.L1012
.L1013:
	str	r7, [r4, #-4]
	str	r7, [r5, #4]
.L1012:
	add	ip, ip, #1
	add	r5, r5, #8
	cmp	ip, #16
	add	r4, r4, #8
	bne	.L1009
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1035:
	ldr	r4, [r3, #252]
	mov	r6, r5
	mov	ip, #0
	add	r5, r5, #36
	add	r6, r6, #160
	mov	r7, ip
.L1008:
	cmp	r4, #0
	beq	.L1017
	mov	r1, r6
	mov	lr, #32
	mov	r2, #0
	b	.L1015
.L1014:
	add	r2, r2, #1
	cmp	r2, #32
	cmpls	r2, r4
	bcs	.L1037
.L1015:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #4]
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #664]
	mov	r3, r3, asl #1
	cmp	r0, #2
	orreq	r3, r3, #1
	cmp	r3, ip
	bne	.L1014
	cmp	lr, r2
	movcs	lr, r2
	add	r2, r2, #1
	cmp	r2, #32
	cmpls	r2, r4
	str	lr, [r5]
	bcc	.L1015
.L1037:
	cmp	lr, #31
	bls	.L1016
.L1017:
	str	r7, [r5]
.L1016:
	add	ip, ip, #1
	add	r5, r5, #4
	cmp	ip, #32
	bne	.L1008
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	FindMinRefIdx, .-FindMinRefIdx
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
	mov	r6, r0
	bl	FindNearestPOCPicId
	add	r5, r6, #20480
	mvn	r4, #0
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	str	r4, [r5, #1836]
	cmp	r3, #2
	str	r0, [r5, #1840]
	beq	.L1050
	mov	r0, r6
	bl	InitListX
	cmp	r0, #0
	bne	.L1051
	ldr	r7, .L1053
	mov	r0, #13
	ldr	r4, .L1053+4
	ldr	r1, .L1053+8
	ldr	r3, [r7, #68]
	blx	r3
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1052
.L1042:
	mov	r0, r6
	bl	ReorderListX
	mov	r0, r6
	bl	RepairList
	cmp	r0, #0
	bne	.L1044
	mov	r0, r6
	bl	FindMinRefIdx
	add	r3, r6, #24576
	mov	r0, #13
	ldr	r1, .L1053+12
	ldr	r3, [r3, #2468]
	cmp	r3, #0
	ldrne	r3, [r3, #4]
	mvneq	r3, #0
	ldrne	r3, [r3, #204]
	str	r3, [r5, #1836]
	ldr	r3, [r7, #68]
	blx	r3
	ldr	r0, [r4]
	ands	r0, r0, #8192
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r6
	bl	DumpList.part.6
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1050:
	mov	r0, #0
	str	r0, [r5, #252]
	str	r0, [r5, #256]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1052:
	mov	r0, r6
	bl	DumpList.part.6
	b	.L1042
.L1044:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1051:
	ldr	r3, .L1053
	mov	r0, #13
	ldr	r1, .L1053+16
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1054:
	.align	2
.L1053:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_PrintEnable
	.word	.LC37
	.word	.LC38
	.word	.LC36
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
	add	r4, r0, #53248
	ldr	ip, [r4, #2792]
	cmp	ip, #0
	addne	r3, r0, #27904
	movne	r2, #0
	addne	r3, r3, #52
	movne	lr, r2
	bne	.L1061
	b	.L1062
.L1070:
	ldrb	r1, [r3, #-640]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1059
	cmp	r2, #39
	cmpls	r2, ip
	add	r3, r3, #672
	bcs	.L1062
.L1061:
	ldr	r1, [r3]
	add	r2, r2, #1
	cmp	r1, #1
	bne	.L1070
.L1059:
	cmp	r2, #39
	cmpls	r2, ip
	strb	lr, [r3, #-643]
	strb	lr, [r3, #-642]
	add	r3, r3, #672
	bcc	.L1061
.L1062:
	ldr	r1, [r4, #2796]
	cmp	r1, #0
	beq	.L1071
	add	r0, r0, #55808
	mov	r3, #0
	add	r0, r0, #160
	mov	r2, r3
.L1063:
	add	r3, r3, #1
	str	r2, [r0, #4]!
	cmp	r3, #16
	cmpls	r3, r1
	bcc	.L1063
	ldmfd	sp, {r4, fp, sp, pc}
.L1071:
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r8, r0, #53248
	mov	r9, r0
	ldr	r0, [r8, #4056]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1089
.L1073:
	ldr	r3, [r8, #2792]
	cmp	r3, #0
	addne	r5, r9, #27392
	movne	r7, #0
	addne	r5, r5, #152
	movne	r6, r7
	beq	.L1080
.L1079:
	sub	r4, r5, #16
	strb	r6, [r5, #-231]
	strb	r6, [r5, #-230]
.L1078:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L1077
	ldr	r0, [r8, #4056]
	bl	FreeUsdByDec
	str	r6, [r4]
.L1077:
	cmp	r5, r4
	bne	.L1078
	ldr	r3, [r8, #2792]
	add	r7, r7, #1
	add	r5, r5, #672
	cmp	r3, r7
	movhi	r3, #1
	movls	r3, #0
	cmp	r7, #39
	movhi	r3, #0
	cmp	r3, #0
	bne	.L1079
.L1080:
	ldr	r1, [r8, #2796]
	cmp	r1, #0
	beq	.L1090
	add	r9, r9, #55808
	mov	r3, #0
	add	r9, r9, #160
	mov	r2, r3
.L1081:
	add	r3, r3, #1
	str	r2, [r9, #4]!
	cmp	r3, #16
	cmpls	r3, r1
	bcc	.L1081
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1089:
	add	r0, r9, #8
	bl	ResetVoQueue
	b	.L1073
.L1090:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
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
	ldr	r3, [r3, #220]
	mov	r4, #4000
	ldr	r2, [r6, #1300]
	mov	r7, r1
	ldr	ip, [r6, #1276]
	mla	r3, lr, r3, r0
	ldr	r0, [r6, #1280]
	ldr	r3, [r3, #28]
	mla	r4, r4, r3, r2
	ldrb	r3, [r4, #18]	@ zero_extendqisi2
	ldr	r1, [r4, #3960]
	rsb	r3, r3, #2
	ldr	r2, [r4, #3956]
	mla	r3, r1, r3, r3
	add	r2, r2, #1
	cmp	r2, ip
	cmpeq	r3, r0
	movne	r1, #1
	moveq	r1, #0
	bne	.L1093
	add	r8, r5, #24576
	ldr	lr, [r4, #3980]
	ldr	r8, [r8, #2056]
	add	r8, r8, #1
	cmp	lr, r8
	movls	r3, r1
	movls	r0, r3
	bls	.L1094
.L1093:
	ldr	r1, .L1098
	ldr	r8, [r1]
	cmp	r8, #0
	beq	.L1097
	add	r1, r5, #53248
	mov	ip, ip, asl #4
	mov	r0, r0, asl #4
	mov	r2, r2, asl #4
	strh	r0, [fp, #-42]	@ movhi
	mov	r3, r3, asl #4
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #8
	ldr	r0, [r1, #4056]
	mov	r1, #2
	strh	ip, [fp, #-44]	@ movhi
	blx	r8
	ldr	lr, [r4, #3980]
	mov	r3, #1
	mov	r0, r3
.L1094:
	add	r5, r5, #16384
	ldr	r2, [r4, #744]
	ldr	ip, [r6, #2052]
	ldr	r1, [r5, #1192]
	cmp	ip, r2
	cmpeq	r1, lr
	movne	r2, #1
	moveq	r2, #0
	orr	r3, r2, r3
	str	r3, [r7]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1097:
	mov	r3, #1
	ldr	lr, [r4, #3980]
	mov	r0, r3
	b	.L1094
.L1099:
	.align	2
.L1098:
	.word	g_event_report
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
	ldr	r1, [r6, #220]
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
	ldr	r1, [r5, #2908]
	ldr	r3, [r5, #2904]
	cmp	r1, ip
	ldr	lr, [r5, #2912]
	add	r3, r3, #4
	mov	r3, ip, asl r3
	beq	.L1102
	bcc	.L1103
	cmp	r1, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r2, #0
	add	r4, r0, #16384
	bne	.L1158
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	bne	.L1136
	ldr	r2, [r4, #3484]
	ldr	r0, [r4, #3480]
	ldr	r1, [r4, #3492]
	cmp	r2, r0
	addcc	r1, r1, r3
	strcc	r1, [r4, #3488]
	bcs	.L1138
.L1139:
	add	r3, r1, r2
	str	r3, [r4, #3476]
	ldr	r0, [r6, #240]
	mov	r3, r3, asl #1
	cmp	r0, #0
	subeq	r3, r3, #1
	str	r3, [r4, #3464]
	ldrb	r0, [r6, #209]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1142
	str	r3, [r4, #3460]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
.L1135:
	str	r2, [r4, #3480]
	str	r1, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1103:
	cmp	r2, #0
	add	lr, lr, #4
	add	r4, r0, #16384
	mov	ip, ip, asl lr
	bne	.L1109
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	bne	.L1107
	ldr	lr, [r4, #3428]
	ldr	r1, [r4, #3432]
	mov	r2, lr
.L1108:
	ldr	r0, [r4, #3420]
	cmp	r0, r1
	bcs	.L1106
	rsb	r3, r0, r1
	cmp	r3, ip, lsr #1
	addcs	r2, r2, ip
	strcs	r2, [r4, #3436]
	bcc	.L1106
.L1110:
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1112
.L1160:
	ldr	r3, [r4, #3424]
	add	r2, r2, r0
	str	r2, [r4, #3452]
	add	r3, r2, r3
	str	r3, [r4, #3456]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r4, #3464]
.L1113:
	ldr	r2, [r4, #3484]
	ldr	r1, [r4, #3480]
	str	r3, [r4, #3460]
	cmp	r2, r1
	strne	r2, [r4, #3480]
	ldr	r3, [r6, #240]
	cmp	r3, #0
	ldrne	r2, [r4, #3420]
	ldrne	r3, [r4, #3436]
	strne	r2, [r4, #3432]
	strne	r3, [r4, #3428]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1102:
	cmp	r2, #0
	add	r4, r0, #16384
	movne	r3, #0
	strne	r3, [r4, #3488]
	bne	.L1117
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	beq	.L1118
	mov	r3, r2
	str	r2, [r4, #3492]
	str	r2, [r4, #3480]
.L1119:
	str	r3, [r4, #3488]
.L1117:
	ldr	r3, [r5, #2924]
	cmp	r3, #0
	beq	.L1121
	ldr	r3, [r4, #3484]
	ldr	r0, [r4, #3488]
	add	r0, r3, r0
	str	r0, [r4, #3476]
	ldr	r7, [r6, #240]
	cmp	r7, #0
	bne	.L1123
	cmp	r0, #0
	beq	.L1124
	sub	r0, r0, #1
	str	r0, [r4, #3476]
.L1123:
	mov	r3, #0
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2924]
	cmp	r1, r3
	bgt	.L1144
	cmp	r0, #0
	beq	.L1127
.L1161:
	sub	r8, r0, #1
	mov	r0, r8
	bl	__aeabi_uidiv
	mov	r9, r0
	mov	r0, r8
	str	r9, [r4, #3500]
	ldr	r1, [r5, #2924]
	bl	__aeabi_uidivmod
	ldr	r0, [r4, #3508]
	mul	r0, r0, r9
	str	r0, [r4, #3504]
	cmp	r1, #0
	str	r1, [r4, #3496]
	blt	.L1128
	add	r2, r5, #2912
	add	r1, r1, #1
	add	r2, r2, #12
	mov	r3, #0
.L1129:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r4, #3504]
	bne	.L1129
.L1128:
	cmp	r7, #0
	ldreq	r3, [r5, #2916]
	addeq	r0, r0, r3
	streq	r0, [r4, #3504]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1131
	ldr	r2, [r4, #3468]
	ldr	r1, [r4, #3472]
	add	r2, r0, r2
	str	r2, [r4, #3452]
	ldr	r3, [r5, #2920]
	add	r3, r2, r3
	add	r0, r3, r1
	str	r0, [r4, #3456]
	cmp	r0, r2
	movge	r0, r2
	str	r0, [r4, #3464]
.L1132:
	ldr	r2, [r4, #3484]
	ldr	r3, [r4, #3488]
	str	r0, [r4, #3460]
	str	r2, [r4, #3480]
	str	r3, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1107:
	ldr	lr, [r4, #3448]
	cmp	lr, #0
	beq	.L1159
.L1109:
	ldr	r0, [r4, #3420]
	mov	r3, #0
	mov	lr, r3
	mov	r2, r1
	str	r3, [r4, #3428]
	str	r3, [r4, #3432]
.L1106:
	cmp	r0, r1
	bls	.L1111
	rsb	r1, r1, r0
	cmp	r1, ip, lsr #1
	rsbhi	r2, ip, r2
	strhi	r2, [r4, #3436]
	bhi	.L1110
.L1111:
	str	lr, [r4, #3436]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1160
.L1112:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r2, r0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	str	r3, [r4, #3464]
	b	.L1113
.L1158:
	mov	r3, #0
	ldr	r2, [r4, #3484]
	mov	r1, r3
	str	r3, [r4, #3488]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
	str	r3, [r4, #3460]
	str	r3, [r4, #3464]
	b	.L1135
.L1121:
	str	r3, [r4, #3476]
	ldr	r7, [r6, #240]
.L1124:
	mov	r0, #0
	str	r0, [r4, #3508]
	ldr	r3, [r5, #2924]
	cmp	r3, r0
	ble	.L1127
.L1144:
	add	ip, r5, #2912
	mov	r3, #0
	add	ip, ip, #12
	mov	r2, r3
.L1126:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2924]
	cmp	r1, r2
	bgt	.L1126
	cmp	r0, #0
	bne	.L1161
.L1127:
	mov	r0, #0
	str	r0, [r4, #3504]
	b	.L1128
.L1131:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r5, #2920]
	ldreq	r3, [r4, #3468]
	ldrne	r3, [r4, #3468]
	addne	r0, r0, r2
	addeq	r0, r0, r3
	streq	r0, [r4, #3452]
	addne	r0, r0, r3
	strne	r0, [r4, #3456]
	str	r0, [r4, #3464]
	b	.L1132
.L1118:
	ldr	r1, [r4, #3484]
	ldr	r2, [r4, #3480]
	cmp	r1, r2
	bcs	.L1120
	ldr	r2, [r4, #3492]
	add	r3, r3, r2
	str	r3, [r4, #3488]
	b	.L1117
.L1142:
	ldrb	r0, [r6, #210]	@ zero_extendqisi2
	str	r3, [r4, #3460]
	cmp	r0, #0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	b	.L1135
.L1136:
	str	r2, [r4, #3480]
	mov	r1, r2
	str	r2, [r4, #3492]
	ldr	r2, [r4, #3484]
.L1138:
	str	r1, [r4, #3488]
	b	.L1139
.L1159:
	ldr	r3, [r4, #3452]
	mov	r2, r1
	str	lr, [r4, #3428]
	mov	r1, r3
	str	r3, [r4, #3432]
	b	.L1108
.L1120:
	ldr	r3, [r4, #3492]
	b	.L1119
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
	ldr	r2, [r3, #220]
	add	r6, r0, #53248
	ldr	r1, [ip, #1304]
	mov	r7, #1
	ldr	r3, [ip, #1300]
	mla	r1, r4, r2, r1
	ldrb	r2, [r6, #947]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r1, [r1, #28]
	mla	r3, lr, r1, r3
	ldr	r3, [r3, #2904]
	add	r3, r3, #4
	mov	r7, r7, asl r3
	add	r3, r0, #24576
	beq	.L1163
	sub	r5, r2, #1
	sub	r4, r2, #2
	ldr	r2, [r3, #2064]
	clz	r5, r5
	clz	r4, r4
	cmp	r2, #0
	mov	r5, r5, lsr #5
	addne	lr, r0, #26368
	mov	r4, r4, lsr #5
	movne	r1, #0
	addne	lr, lr, #132
	beq	.L1183
.L1182:
	ldr	ip, [lr, #4]!
	ldrb	r2, [ip, #2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1177
	ldr	r2, [ip, #624]
	ldr	r8, [r6, #1472]
	cmp	r2, r8
	rsbhi	r2, r7, r2
	str	r2, [ip, #628]
	ldr	r2, [lr]
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L1180
	ldr	r8, [r2, #548]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	ip, [r2, #628]
	addeq	ip, r5, ip, lsl #1
	streq	ip, [r2, #560]
	ldreq	r2, [lr]
	ldreqb	ip, [r2, #2]	@ zero_extendqisi2
.L1180:
	tst	ip, #2
	beq	.L1177
	ldr	ip, [r2, #584]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	ldreq	ip, [r2, #628]
	addeq	ip, r4, ip, lsl #1
	streq	ip, [r2, #596]
.L1177:
	ldr	r2, [r3, #2064]
	add	r1, r1, #1
	cmp	r2, r1
	bhi	.L1182
.L1183:
	ldr	r2, [r3, #2068]
	cmp	r2, #0
	beq	.L1207
	add	r0, r0, #26368
	mov	r2, #0
	add	r0, r0, #196
.L1188:
	ldr	ip, [r0, #4]!
	add	r2, r2, #1
	ldrb	r1, [ip, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1185
	tst	r1, #1
	beq	.L1186
	ldr	lr, [ip, #548]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	ldreq	r1, [ip, #632]
	addeq	r1, r5, r1, lsl #1
	streq	r1, [ip, #556]
	ldreq	ip, [r0]
	ldreqb	r1, [ip, #2]	@ zero_extendqisi2
.L1186:
	tst	r1, #2
	beq	.L1185
	ldr	r1, [ip, #584]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [ip, #632]
	addeq	r1, r4, r1, lsl #1
	streq	r1, [ip, #592]
.L1185:
	ldr	r1, [r3, #2068]
	cmp	r1, r2
	bhi	.L1188
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1163:
	ldr	r1, [r3, #2064]
	cmp	r1, #0
	addne	ip, r0, #26368
	addne	ip, ip, #132
	bne	.L1172
.L1173:
	ldr	r2, [r3, #2068]
	cmp	r2, #0
	beq	.L1208
	add	r0, r0, #26368
	mov	r2, #0
	add	r0, r0, #196
	b	.L1175
.L1174:
	ldr	r1, [r3, #2068]
	cmp	r1, r2
	bls	.L1209
.L1175:
	ldr	r1, [r0, #4]!
	add	r2, r2, #1
	ldrb	ip, [r1, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1174
	ldr	ip, [r1, #512]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	ldreq	ip, [r1, #632]
	streq	ip, [r1, #520]
	ldr	r1, [r3, #2068]
	cmp	r1, r2
	bhi	.L1175
.L1209:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1210:
	ldr	lr, [r1, #512]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L1169
	ldr	lr, [r1, #624]
	ldr	r4, [r6, #1472]
	rsb	r5, r7, lr
	cmp	lr, r4
	strhi	r5, [r1, #628]
	strls	lr, [r1, #628]
	ldr	r1, [ip]
	ldr	lr, [r1, #628]
	str	lr, [r1, #524]
.L1169:
	ldr	r1, [r3, #2064]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1173
.L1172:
	ldr	r1, [ip, #4]!
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L1169
	b	.L1210
.L1208:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1207:
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
	beq	.L1216
	add	r3, r0, #24576
	ldr	ip, [r3, #2060]
	cmp	ip, #0
	beq	.L1216
	ldr	r3, [r3, #1864]
	cmp	r3, r1
	beq	.L1218
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #72
	b	.L1213
.L1214:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1218
.L1213:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1214
.L1216:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1218:
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
	add	r5, r0, #53248
	ldr	r6, .L1255
	mov	r4, r0
	ldr	ip, [r5, #1532]
	mov	r0, #2
	ldr	r1, [r5, #1156]
	mov	r7, #0
	ldrb	r3, [r5, #947]	@ zero_extendqisi2
	add	r9, r4, #12288
	ldr	r2, [r5, #1480]
	stmia	sp, {r1, ip}
	ldr	r1, .L1255+4
	ldr	r8, [r6, #68]
	blx	r8
	add	r3, r4, #54016
	str	r7, [r5, #3980]
	movw	r2, #56096
	ldrd	r0, [r3, #200]
	add	r8, r4, #16384
	strd	r0, [r4, r2]
	ldr	r0, [r5, #3976]
	ldr	r1, [r5, #1152]
	ldr	r2, [r5, #1480]
	ldrb	r3, [r5, #947]	@ zero_extendqisi2
	str	r0, [r5, #3708]
	str	r1, [r5, #3496]
	strb	r3, [r5, #2840]
	str	r2, [r5, #2856]
	ldr	r1, [r5, #1516]
	ldrb	r2, [r9, #1327]	@ zero_extendqisi2
	ldr	r3, [r5, #1520]
	str	r1, [r5, #2860]
	str	r2, [r5, #2872]
	str	r3, [r5, #2864]
	ldr	r3, [r8, #1168]
	add	r3, r3, #1
	str	r3, [r5, #2868]
	ldrb	r3, [r9, #1326]	@ zero_extendqisi2
	strb	r3, [r5, #2843]
	ldr	r3, [r8, #1272]
	str	r3, [r5, #2876]
	ldrb	r3, [r8, #1212]	@ zero_extendqisi2
	str	r3, [r5, #2880]
	ldr	r3, [r9, #2056]
	strb	r3, [r5, #2841]
	ldrb	r3, [r8, #1216]	@ zero_extendqisi2
	str	r3, [r5, #2884]
	ldr	r3, [r8, #3464]
	str	r3, [r5, #2888]
	ldr	r3, [r8, #3452]
	str	r3, [r5, #2892]
	ldr	r2, [r8, #3456]
	ldr	r3, [r5, #1464]
	ldr	r0, [r5, #4056]
	str	r2, [r5, #2896]
	ldr	r1, [r3, #620]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L1253
	ldr	r2, [r10, #520]
	ldr	r3, [r10, #524]
	cmp	r2, #0
	beq	.L1223
	cmp	r3, #0
	beq	.L1223
	add	r3, r4, #56320
	add	r1, r4, #56576
	add	r1, r1, #76
	ldr	r0, [r5, #4056]
	mov	r2, r3
	add	r3, r3, #204
	add	r2, r2, #76
	add	r6, r4, #24576
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r10, #520]
	add	r2, r4, #56576
	ldr	r0, [r5, #4056]
	ldr	r3, [r3, #4]
	mov	r1, r2
	add	r2, r2, #80
	add	r1, r1, #160
	str	r3, [r5, #3132]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r5, #1532]
	str	r3, [r5, #3140]
	ldr	r3, [r10, #536]
	str	r3, [r5, #3492]
	ldr	r3, [r10, #524]
	ldr	r3, [r3, #12]
	str	r3, [r5, #3136]
	ldr	r3, [r10, #524]
	ldr	r3, [r3, #44]
	str	r3, [r5, #3144]
	ldr	r3, [r6, #2332]
	cmp	r3, #0
	str	r3, [fp, #-48]
	str	r3, [r5, #3700]
	beq	.L1229
	add	r10, r4, #26624
	add	lr, r4, #56576
	add	r2, r4, #56832
	mov	r3, r7
	ldr	r7, [fp, #-48]
	mov	ip, r10
	mov	r0, lr
	mov	r1, r10
	add	lr, lr, #176
	add	r10, r10, #88
	add	ip, ip, #152
	add	r0, r0, #240
	add	r1, r1, #216
	add	r2, r2, #48
	str	r4, [fp, #-52]
.L1228:
	ldr	r4, [r10, #4]!
	add	r3, r3, #1
	cmp	r3, r7
	str	r4, [lr, #4]!
	ldr	r4, [ip, #4]!
	str	r4, [r0, #4]!
	ldr	r4, [r1, #4]!
	str	r4, [r2, #4]!
	bne	.L1228
	ldr	r4, [fp, #-52]
.L1229:
	ldrb	r3, [r9, #1333]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1254
	ldrb	r1, [r8, #1230]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1230
	add	ip, r4, #56064
	ldr	r0, .L1255+8
	add	ip, ip, #80
.L1231:
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
	bne	.L1231
	add	r7, r4, #56064
	mov	lr, #0
	add	r7, r7, #180
.L1232:
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
	bne	.L1232
.L1237:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1234
	add	r7, r4, #26624
	add	r9, r4, #56832
	add	r4, r4, #57088
	add	r7, r7, #92
	add	r9, r9, #252
	add	r4, r4, #60
	mov	r8, #0
.L1240:
	ldr	r2, [r7]
	mov	r1, #0
	ldr	r0, [r5, #4056]
	add	r8, r8, #1
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7], #4
	str	r3, [r4, #4]!
	ldr	r3, [r6, #2332]
	cmp	r3, r8
	bhi	.L1240
.L1234:
	mov	r0, #0
.L1250:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1254:
	ldrb	r1, [r8, #1230]	@ zero_extendqisi2
.L1230:
	cmp	r1, #1
	add	ip, r4, #56064
	mov	r0, #0
	add	ip, ip, #80
	beq	.L1235
.L1238:
	add	r3, r0, #4064
	add	r0, r0, #1
	add	r3, r3, #4
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
	bne	.L1238
	add	r9, r4, #56064
	mov	r10, #1
	add	r9, r9, #180
	mov	r8, #0
.L1239:
	mov	r2, r8, lsr #3
	and	r1, r10, #15
	mov	r3, r8, asl #1
	add	r8, r8, #1
	mov	r2, r2, asl #4
	and	r3, r3, #14
	add	r1, r2, r1
	add	r3, r2, r3
	add	r2, r1, #4080
	add	r3, r3, #4080
	add	r2, r2, #12
	add	r3, r3, #12
	cmp	r8, #16
	add	r10, r10, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	add	r9, r9, #8
	ldr	r1, [r2, #4]
	ldr	r3, [r3, #4]
	and	ip, r1, #-16777216
	ubfx	r0, r1, #8, #8
	uxtb	lr, r1
	mov	r1, r1, lsr #16
	mov	r7, r3, lsr #24
	ubfx	r2, r3, #8, #8
	mov	lr, lr, asl #16
	orr	r1, lr, r1, asl #24
	orr	r2, r2, r7, asl #8
	uxtb	lr, r3
	mov	r3, r3, lsr #8
	orr	r1, r1, lr
	and	r3, r3, #65280
	orr	r2, r2, ip
	orr	r3, r1, r3
	orr	r2, r2, r0, asl #16
	str	r3, [r9, #-8]
	str	r2, [r9, #-4]
	bne	.L1239
	b	.L1237
.L1235:
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
	bne	.L1235
	add	r9, r4, #56064
	mov	r10, #1
	add	r9, r9, #180
	mov	r8, #0
.L1236:
	mov	r2, r8, lsr #3
	and	r1, r10, #15
	mov	r3, r8, asl #1
	add	r8, r8, #1
	mov	r2, r2, asl #4
	and	r3, r3, #14
	add	r1, r2, r1
	add	r3, r2, r3
	add	r2, r1, #4864
	add	r3, r3, #4864
	add	r2, r2, #54
	add	r3, r3, #54
	cmp	r8, #16
	add	r10, r10, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	add	r9, r9, #8
	ldr	r1, [r2, #4]
	ldr	r3, [r3, #4]
	and	ip, r1, #-16777216
	ubfx	r0, r1, #8, #8
	uxtb	lr, r1
	mov	r1, r1, lsr #16
	mov	r7, r3, lsr #24
	ubfx	r2, r3, #8, #8
	mov	lr, lr, asl #16
	orr	r1, lr, r1, asl #24
	orr	r2, r2, r7, asl #8
	uxtb	lr, r3
	mov	r3, r3, lsr #8
	orr	r1, r1, lr
	and	r3, r3, #65280
	orr	r2, r2, ip
	orr	r3, r1, r3
	orr	r2, r2, r0, asl #16
	str	r3, [r9, #-8]
	str	r2, [r9, #-4]
	bne	.L1236
	b	.L1237
.L1223:
	ldr	r4, [r6, #68]
	mov	r0, #0
	ldr	r1, .L1255+12
	blx	r4
	mvn	r0, #0
	b	.L1250
.L1253:
	ldr	r2, [r5, #1464]
	ldr	r3, [r6, #68]
	ldr	r1, .L1255+16
	ldr	r2, [r2, #620]
	blx	r3
	mvn	r0, #0
	b	.L1250
.L1256:
	.align	2
.L1255:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC39
	.word	.LANCHOR0
	.word	.LC41
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
	ldr	r2, [r1, #28]
	ldr	r3, [r1, #32]
	cmp	r2, r0
	movlt	r2, r0
	cmp	r3, r0
	str	r2, [r1, #28]
	movge	r3, r0
	str	r3, [r1, #32]
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
	add	r9, r0, #53248
	add	lr, r0, #12288
	mov	r4, r0
	ldr	r3, [r9, #3980]
	movw	r0, #4060
	ldr	ip, [r9, #3976]
	add	r2, r3, #1
	str	r2, [r9, #3980]
	mul	r0, r0, r3
	ldr	r2, [lr, #1284]
	str	r3, [fp, #-52]
	sub	r2, r2, #1
	cmp	r3, r2
	add	r6, ip, r0
	addcc	r2, r0, #4048
	addcc	r2, r2, #12
	movcs	r2, #0
	addcc	r2, ip, r2
	str	r2, [r6, #4056]
	ldr	r1, [r4, #368]
	ldrb	r5, [r1]	@ zero_extendqisi2
	ldr	r2, [r1, #68]
	cmp	r5, #1
	cmpls	r5, r2
	bcs	.L1261
	add	r7, r5, #3
	add	r7, r6, r7, lsl #2
.L1262:
	mov	r3, r5, asl #5
	sub	r3, r3, r5, asl #2
	add	r5, r5, #1
	add	r1, r1, r3
	ldr	r2, [r1, #24]
	str	r2, [r7, #4]!
	ldr	r2, [r4, #368]
	add	r2, r2, r3
	ldr	r2, [r2, #20]
	str	r2, [r7, #-8]
	ldr	r2, [r4, #368]
	add	r3, r2, r3
	ldr	r3, [r3, #28]
	str	r3, [r7, #8]
	ldr	r1, [r4, #368]
	ldr	r2, [r1, #68]
	cmp	r2, r5
	movhi	r3, #1
	movls	r3, #0
	cmp	r5, #1
	movhi	r3, #0
	cmp	r3, #0
	bne	.L1262
.L1261:
	cmp	r2, #1
	bhi	.L1267
	add	r2, r2, #3
	add	r5, r6, #20
	mov	r1, #0
	add	r2, r6, r2, lsl #2
.L1266:
	str	r1, [r2, #4]!
	cmp	r2, r5
	str	r1, [r2, #-8]
	str	r1, [r2, #8]
	bne	.L1266
.L1267:
	ldrb	r2, [r9, #953]	@ zero_extendqisi2
	add	r3, r4, #16384
	ldr	r1, [fp, #-52]
	add	r5, r4, #20480
	str	r3, [fp, #-48]
	strb	r2, [r6, #1]
	cmp	r1, #0
	ldr	r2, [r3, #1260]
	ldr	r1, [r5, #1820]
	add	r2, r2, #26
	add	r2, r2, r1
	str	r2, [r6, #32]
	bne	.L1363
	ldr	r1, [r9, #1464]
	str	r2, [r1, #540]
	ldr	r2, [r9, #1464]
	ldr	r1, [r6, #32]
	str	r1, [r2, #544]
.L1268:
	ldr	r2, [r5, #1816]
	str	r2, [r6, #36]
	ldr	r2, [r5, #268]
	str	r2, [r6, #40]
	ldr	r2, [r5, #264]
	str	r2, [r6, #44]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	strb	r2, [ip, r0]
	ldr	r2, [r5, #260]
	str	r2, [r6, #48]
	ldrb	r2, [r5, #214]	@ zero_extendqisi2
	strb	r2, [r6, #2]
	ldrb	r2, [lr, #1328]	@ zero_extendqisi2
	strb	r2, [r6, #3]
	ldr	r2, [r5, #252]
	str	r2, [r6, #52]
	ldr	r2, [r5, #256]
	str	r2, [r6, #56]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1364
	cmp	r2, #0
	ldreq	r3, [fp, #-48]
	movne	r2, #0
	ldreqb	r2, [r3, #1214]	@ zero_extendqisi2
	strb	r2, [r6, #4]
.L1270:
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #1264]
	str	r2, [r6, #60]
	ldr	r2, [r3, #1268]
	str	r2, [r6, #64]
	ldr	r2, [r5, #1828]
	str	r2, [r6, #68]
	ldr	r2, [r5, #1832]
	str	r2, [r6, #72]
	ldr	r2, [r5, #1824]
	str	r2, [r6, #76]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L1309
	ldr	lr, [r5, #252]
	cmp	lr, #0
	beq	.L1312
	add	r2, r4, #24576
	ldr	r2, [r2, #2468]
	ldr	r0, [r2, #4]
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r1, r4, #26880
	movne	r2, #0
	addne	r1, r1, #164
	bne	.L1277
	b	.L1275
.L1279:
	ldr	r3, [r1, #4]!
	ldr	r0, [r3, #4]
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1275
.L1277:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L1279
	mov	r3, #0
	str	r3, [fp, #-56]
.L1274:
	ldr	lr, [r5, #256]
	cmp	lr, #0
	beq	.L1313
	add	r2, r4, #24576
	ldr	r2, [r2, #2600]
	ldr	r0, [r2, #4]
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r1, r4, #27136
	movne	r2, #0
	addne	r1, r1, #40
	bne	.L1283
	b	.L1281
.L1285:
	ldr	r3, [r1, #4]!
	ldr	r0, [r3, #4]
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1281
.L1283:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L1285
	mov	r3, #0
	str	r3, [fp, #-60]
.L1280:
	ldrb	r2, [r9, #947]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1286
	ldr	r2, [r5, #252]
	cmp	r2, #0
	beq	.L1301
	add	r7, r4, #26880
	mov	r10, #0
	str	r4, [fp, #-64]
	mov	r8, r6
	mov	r4, r5
	add	r7, r7, #164
	mov	r5, r10
	ldr	r10, [fp, #-56]
	b	.L1300
.L1298:
	strb	r2, [r8, #1630]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #1631]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r8, #1656]
.L1299:
	ldr	r2, [r4, #252]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r8, r8, #36
	cmp	r2, r5
	bls	.L1365
.L1300:
	ldr	r2, [r7]
	ldr	r0, [r9, #4056]
	ldr	r2, [r2, #4]
	ldr	r1, [r2, #620]
	bl	FSP_GetLogicFs
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #660]
	str	r2, [r8, #1636]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #1625]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r10
	beq	.L1297
	cmp	r0, #0
	ldrne	r2, [r0, #520]
	ldrne	r0, [r2, #4]
.L1297:
	str	r0, [r8, #1640]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #664]
	str	r2, [r8, #1644]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #636]
	str	r2, [r8, #1632]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r8, #1624]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #512]	@ zero_extendqisi2
	strb	r2, [r8, #1626]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1298
	strb	r2, [r8, #1628]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #1629]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r8, #1652]
	b	.L1299
.L1365:
	mov	r5, r4
	ldr	r4, [fp, #-64]
.L1301:
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1366
.L1289:
	add	r1, r4, #26880
	add	r2, r6, #3920
	add	ip, r6, #4048
	add	r1, r1, #32
	add	r2, r2, #4
	add	ip, ip, #4
.L1306:
	ldr	r3, [r1, #4]!
	str	r3, [r2, #4]!
	cmp	r2, ip
	bne	.L1306
	ldr	r3, [fp, #-48]
	ldrb	r2, [r3, #1214]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [r9, #3124]
	ldr	r2, [r3, #1256]
	str	r2, [r9, #3128]
	beq	.L1307
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1308
.L1307:
	cmp	r2, #1
	beq	.L1367
.L1309:
	ldr	r3, [fp, #-52]
	mov	r2, #0
	ldr	r1, [r4, #368]
	add	r3, r3, #13824
	add	r3, r3, #32
	add	r3, r4, r3, lsl #2
	str	r1, [r3, #4]
	str	r2, [r4, #368]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1363:
	ldr	r1, [r9, #1464]
	ldr	r8, [r1, #540]
	ldr	r7, [r1, #544]
	cmp	r8, r2
	movlt	r8, r2
	cmp	r7, r2
	str	r8, [r1, #540]
	movge	r7, r2
	str	r7, [r1, #544]
	b	.L1268
.L1275:
	ldr	r1, [r0, #620]
	ldr	r0, [r9, #4056]
	bl	FSP_GetLogicFs
	subs	r2, r0, #0
	ldreq	r3, .L1369
	movweq	r2, #7371
	beq	.L1359
	ldr	r2, [r2, #520]
	ldr	r3, [r2, #4]
	str	r3, [fp, #-56]
	b	.L1274
.L1367:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1309
.L1308:
	ldr	r3, [r5, #272]
	add	r9, r4, #20736
	add	lr, r4, #21504
	add	r7, r4, #20992
	add	r0, r4, #21760
	mov	r8, r9
	str	r3, [r6, #80]
	mov	ip, lr
	ldr	r10, [r5, #276]
	add	r9, r9, #20
	add	r8, r8, #148
	add	r7, r7, #20
	add	lr, lr, #20
	add	ip, ip, #148
	add	r0, r0, #20
	mov	r1, r6
	mov	r3, r6
	mov	r2, #0
	str	r6, [fp, #-48]
	str	r10, [r1, #84]!
.L1310:
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
	ldr	r10, [r5, #264]
	cmp	r10, r2
	bcs	.L1310
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1309
	add	lr, r4, #21248
	add	r1, r4, #22016
	add	r7, r4, #20992
	add	r0, r4, #21760
	ldr	r8, [fp, #-48]
	mov	ip, lr
	mov	r2, r1
	add	r6, r6, #468
	add	r7, r7, #148
	add	lr, lr, #20
	add	ip, ip, #148
	add	r0, r0, #148
	add	r1, r1, #20
	add	r2, r2, #148
	mov	r3, #0
.L1311:
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
	ldr	r9, [r5, #268]
	cmp	r9, r3
	bcs	.L1311
	b	.L1309
.L1286:
	ldr	r1, [r5, #252]
	cmp	r1, #0
	beq	.L1294
	add	r8, r4, #26880
	ldr	r10, [fp, #-56]
	add	r8, r8, #164
	str	r4, [fp, #-64]
	mov	r7, r6
	mov	r4, r5
	mov	r5, r2
.L1293:
	ldr	r2, [r8]
	ldr	r0, [r9, #4056]
	ldr	r2, [r2, #4]
	ldr	r1, [r2, #620]
	bl	FSP_GetLogicFs
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #660]
	str	r2, [r7, #1636]
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r7, #1625]
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r10
	beq	.L1292
	cmp	r0, #0
	ldrne	r2, [r0, #520]
	ldrne	r0, [r2, #4]
.L1292:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r2, [r8]
	add	r5, r5, #1
	add	r7, r7, #36
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #664]
	str	r2, [r7, #1608]
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #636]
	str	r2, [r7, #1596]
	ldr	r2, [r8]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r7, #1591]
	ldr	r2, [r8]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r7, #1590]
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #528]
	str	r2, [r7, #1612]
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #564]
	str	r2, [r7, #1616]
	ldr	r2, [r8], #4
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #600]
	strb	r3, [r7, #1588]
	str	r2, [r7, #1620]
	ldr	r2, [r4, #252]
	cmp	r2, r5
	bhi	.L1293
	mov	r5, r4
	ldr	r4, [fp, #-64]
.L1294:
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1289
	ldr	r2, [r5, #256]
	cmp	r2, #0
	beq	.L1289
	mov	r8, #0
	add	r10, r4, #27136
	str	r4, [fp, #-56]
	mov	r4, r5
	mov	r5, r8
	ldr	r8, [fp, #-60]
	add	r10, r10, #40
	mov	r7, r6
.L1296:
	ldr	r2, [r10]
	ldr	r0, [r9, #4056]
	ldr	r2, [r2, #4]
	ldr	r1, [r2, #620]
	bl	FSP_GetLogicFs
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #660]
	str	r2, [r7, #2788]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r7, #2777]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r8
	beq	.L1295
	cmp	r0, #0
	ldrne	r2, [r0, #520]
	ldrne	r0, [r2, #4]
.L1295:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r2, [r10]
	add	r5, r5, #1
	add	r7, r7, #36
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #664]
	str	r2, [r7, #2760]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #636]
	str	r2, [r7, #2748]
	ldr	r2, [r10]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r7, #2743]
	ldr	r2, [r10]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r7, #2742]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #528]
	str	r2, [r7, #2764]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #564]
	str	r2, [r7, #2768]
	ldr	r2, [r10], #4
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #600]
	strb	r3, [r7, #2740]
	str	r2, [r7, #2772]
	ldr	r2, [r4, #256]
	cmp	r2, r5
	bhi	.L1296
.L1358:
	mov	r5, r4
	ldr	r4, [fp, #-56]
	b	.L1289
.L1281:
	ldr	r1, [r0, #620]
	ldr	r0, [r9, #4056]
	bl	FSP_GetLogicFs
	subs	r2, r0, #0
	beq	.L1368
	ldr	r2, [r2, #520]
	ldr	r3, [r2, #4]
	str	r3, [fp, #-60]
	b	.L1280
.L1364:
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #1256]
	strb	r2, [r6, #4]
	b	.L1270
.L1366:
	ldr	r2, [r5, #256]
	cmp	r2, #0
	beq	.L1289
	add	r7, r4, #27136
	mov	r10, #0
	str	r4, [fp, #-56]
	mov	r8, r6
	mov	r4, r5
	add	r7, r7, #40
	mov	r5, r10
	ldr	r10, [fp, #-60]
	b	.L1305
.L1303:
	strb	r2, [r8, #2782]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #2783]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r8, #2808]
.L1304:
	ldr	r2, [r4, #256]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r8, r8, #36
	cmp	r2, r5
	bls	.L1358
.L1305:
	ldr	r2, [r7]
	ldr	r0, [r9, #4056]
	ldr	r2, [r2, #4]
	ldr	r1, [r2, #620]
	bl	FSP_GetLogicFs
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #660]
	str	r2, [r8, #2788]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #2777]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r10
	beq	.L1302
	cmp	r0, #0
	ldrne	r2, [r0, #520]
	ldrne	r0, [r2, #4]
.L1302:
	str	r0, [r8, #2792]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #664]
	str	r2, [r8, #2796]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #636]
	str	r2, [r8, #2784]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r8, #2776]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #512]	@ zero_extendqisi2
	strb	r2, [r8, #2778]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1303
	strb	r2, [r8, #2780]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #2781]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r8, #2804]
	b	.L1304
.L1368:
	ldr	r3, .L1369
	movw	r2, #7392
.L1359:
	ldr	r1, .L1369+4
	ldr	r3, [r3, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1312:
	str	lr, [fp, #-56]
	b	.L1274
.L1313:
	str	lr, [fp, #-60]
	b	.L1280
.L1370:
	.align	2
.L1369:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC42
	UNWIND(.fnend)
	.size	WriteSliceMsg, .-WriteSliceMsg
	.align	2
	.global	StopPicNum
	.type	StopPicNum, %function
StopPicNum:
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
	.size	StopPicNum, .-StopPicNum
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
	add	r0, r0, #53248
	ldr	r2, [r0, #3708]
	cmp	r2, #0
	beq	.L1375
	mov	r0, #0
.L1374:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1374
	ldmfd	sp, {fp, sp, pc}
.L1375:
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
	ldr	r1, .L1388
	add	r4, r0, #20480
	add	r6, r0, #53248
	mov	r5, r0
	bl	ue_v
	str	r0, [r4, #260]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L1386
	cmp	r0, #262144
	bcs	.L1387
	add	r2, r5, #12288
	ldr	r1, [r2, #1276]
	ldr	r3, [r2, #1280]
	mul	r3, r3, r1
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1386
	mov	r0, r5
	ldr	r1, .L1388+4
	bl	ue_v
	ldr	r7, .L1388+8
	ldr	r1, .L1388+12
	ldr	r3, [r7, #68]
	mov	r2, r0
	mov	r5, r0
	mov	r0, #19
	blx	r3
	ldr	r0, [r6, #3996]
	cmp	r0, #0
	bne	.L1386
	cmp	r5, #9
	bhi	.L1382
	mov	r1, #1
	movw	r3, #297
	mov	r2, r1, asl r5
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L1383
	ands	r0, r2, #660
	bne	.L1384
	tst	r2, #66
	beq	.L1382
	strb	r1, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1383:
	strb	r0, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1382:
	ldr	r3, [r7, #68]
	mov	r2, r5
	ldr	r1, .L1388+16
	mov	r0, #1
	blx	r3
.L1386:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1384:
	mov	r0, r3
	mov	r3, #2
	strb	r3, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1387:
	ldr	r3, .L1388+8
	mov	r0, #1
	ldr	r1, .L1388+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1389:
	.align	2
.L1388:
	.word	.LC43
	.word	.LC45
	.word	vfmw_Osal_Func_Ptr_S
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r6, .L1396
	add	r5, r0, #20480
	mov	r4, r0
	add	r4, r4, #12288
	ldr	r1, .L1396+4
	mov	r0, #19
	ldr	r2, [r5, #220]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r1, [r4, #1304]
	ldr	r2, [r5, #220]
	mov	r3, #2208
	mla	r3, r3, r2, r1
	ldrb	r1, [r3, #19]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1394
	ldr	r2, [r3, #28]
	mov	r3, #4000
	ldr	r1, [r4, #1300]
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1395
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1394:
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r1, .L1396+8
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1395:
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r1, .L1396+12
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1397:
	.align	2
.L1396:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LC49
	.word	.LC50
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1406
	mov	r2, r1
	mov	r6, r1
	mov	r4, r0
	ldr	r1, .L1406+4
	mov	r0, #19
	ldr	r3, [r5, #68]
	blx	r3
	add	r0, r4, #12288
	mov	r3, #2208
	ldr	r2, [r0, #1304]
	mla	r3, r3, r6, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1403
	ldr	r1, [r0, #1288]
	ldr	r2, [r3, #28]
	sub	r3, r1, #1
	cmp	r2, r3
	bhi	.L1404
	ldr	r1, [r0, #1300]
	mov	r3, #4000
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1405
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1403:
	ldr	r3, [r5, #68]
	mov	r2, r6
	ldr	r1, .L1406+8
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1404:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1406+12
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1405:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1406+16
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1407:
	.align	2
.L1406:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
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
	add	r3, r0, #20480
	add	r1, r0, #12288
	ldr	ip, [r3, #1860]
	ldr	r1, [r1, #2052]
	ldr	r2, [r3, #1864]
	ldr	lr, [r3, #220]
	ldr	r5, [r3, #1872]
	cmp	r2, lr
	cmpeq	ip, r1
	ldr	r4, [r3, #228]
	ldrb	lr, [r3, #1856]	@ zero_extendqisi2
	ldrb	ip, [r3, #209]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r5, r4
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	lr, ip
	orrne	r2, r2, #1
	cmp	lr, #0
	cmpne	ip, #0
	beq	.L1410
	ldrb	ip, [r3, #1857]	@ zero_extendqisi2
	ldrb	r1, [r3, #210]	@ zero_extendqisi2
	cmp	ip, r1
	orrne	r2, r2, #1
.L1410:
	ldr	r1, [r3, #1868]
	ldr	ip, [r3, #240]
	cmp	r1, ip
	moveq	r1, #0
	beq	.L1411
	cmp	ip, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
.L1411:
	ldrb	ip, [r3, #1858]	@ zero_extendqisi2
	ldrb	lr, [r3, #211]	@ zero_extendqisi2
	cmp	ip, lr
	orrne	r2, r2, #1
	cmp	lr, #5
	cmpeq	ip, #5
	orr	r2, r2, r1
	beq	.L1419
.L1412:
	add	r0, r0, #16384
	ldr	r1, [r0, #120]
	cmp	r1, #0
	bne	.L1413
	ldr	r1, [r3, #1880]
	ldr	lr, [r0, #3424]
	ldr	ip, [r3, #1884]
	ldr	r0, [r0, #3420]
	cmp	r1, r0
	cmpeq	ip, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
.L1414:
	ldr	r4, [r3, #260]
	mov	r0, #19
	ldr	r3, .L1420
	cmp	r4, #0
	movne	r4, r2
	orreq	r4, r2, #1
	ldr	r1, .L1420+4
	mov	r2, r4
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1413:
	cmp	r1, #1
	bne	.L1414
	ldr	r1, [r3, #1888]
	ldr	lr, [r0, #3472]
	ldr	ip, [r3, #1892]
	ldr	r0, [r0, #3468]
	cmp	r1, r0
	cmpeq	ip, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
	b	.L1414
.L1419:
	ldr	ip, [r3, #1876]
	ldr	r1, [r3, #248]
	cmp	ip, r1
	orrne	r2, r2, #1
	b	.L1412
.L1421:
	.align	2
.L1420:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC55
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
	ldr	r1, [r5, #220]
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
	ldr	r3, [r3, #2904]
	addne	r3, r3, #5
	addeq	r3, r3, #4
	mov	r7, r7, asl r3
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	addhi	r6, r4, #53248
	bls	.L1476
.L1475:
	ldr	r3, [r6, #3996]
.L1441:
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1476:
	ldr	r1, .L1481
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3512]
	cmp	r0, #0
	beq	.L1474
	ldr	r3, [r5, #264]
	cmn	r3, #2
	beq	.L1455
	add	r10, r4, #19712
	add	r6, r4, #53248
	add	r10, r10, #184
	mov	r9, #0
	b	.L1438
.L1433:
	cmp	r0, #2
	beq	.L1477
.L1436:
	ldr	r3, [r5, #264]
	add	r3, r3, #2
	cmp	r3, r9
	bls	.L1478
.L1438:
	ldr	r1, .L1481+4
	mov	r0, r4
	bl	ue_v
	add	r9, r9, #1
	cmp	r0, #3
	str	r0, [r10, #4]!
	ldr	r3, [r6, #3996]
	bhi	.L1429
	cmp	r3, #0
	bne	.L1429
	cmp	r0, #3
	beq	.L1432
	cmp	r0, #1
	bhi	.L1433
	ldr	r1, .L1481+8
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r10, #264]
	ldr	r3, [r6, #3996]
	bls	.L1435
	cmp	r3, #0
	beq	.L1436
.L1435:
	ldr	ip, .L1481+12
	mov	r2, r0
	ldr	r1, .L1481+16
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1477:
	ldr	r1, .L1481+20
	mov	r0, r4
	bl	ue_v
	str	r0, [r10, #528]
	b	.L1436
.L1474:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	add	r6, r4, #53248
.L1425:
	cmp	r3, #1
	bne	.L1475
	ldr	r1, .L1481+24
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3513]
	cmp	r0, #0
	beq	.L1475
	ldr	r3, [r5, #268]
	cmn	r3, #2
	beq	.L1475
	add	r9, r4, #19968
	mov	r8, #0
	add	r9, r9, #60
	b	.L1453
.L1452:
	add	r8, r8, #1
	cmp	r8, r3
	bcs	.L1475
.L1453:
	ldr	r1, .L1481+28
	mov	r0, r4
	bl	ue_v
	cmp	r0, #3
	str	r0, [r9, #4]!
	ldr	r3, [r6, #3996]
	bhi	.L1445
	cmp	r3, #0
	bne	.L1445
	cmp	r0, #3
	beq	.L1441
	cmp	r0, #1
	bls	.L1479
	cmp	r0, #2
	beq	.L1480
	ldr	r3, [r5, #268]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1452
.L1454:
	ldr	r3, .L1481+12
	mov	r0, #1
	ldr	r1, .L1481+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1479:
	ldr	r1, .L1481+36
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r9, #264]
	ldr	r3, [r6, #3996]
	bls	.L1449
	cmp	r3, #0
	bne	.L1449
.L1450:
	ldr	r3, [r5, #268]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1452
	ldr	r2, [r9]
	cmp	r2, #3
	beq	.L1452
	b	.L1454
.L1480:
	ldr	r1, .L1481+40
	mov	r0, r4
	bl	ue_v
	str	r0, [r9, #524]
	b	.L1450
.L1432:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	b	.L1425
.L1429:
	ldr	ip, .L1481+12
	mov	r2, r0
	ldr	r1, .L1481+44
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1445:
	ldr	ip, .L1481+12
	mov	r2, r0
	ldr	r1, .L1481+48
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1478:
	cmp	r9, r3
	bne	.L1432
.L1427:
	add	r3, r3, #4928
	add	r3, r3, #46
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L1474
	ldr	r3, .L1481+12
	mov	r0, #1
	ldr	r1, .L1481+52
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1449:
	ldr	ip, .L1481+12
	mov	r2, r0
	ldr	r1, .L1481+56
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1455:
	mov	r3, #0
	b	.L1427
.L1482:
	.align	2
.L1481:
	.word	.LC56
	.word	.LC57
	.word	.LC59
	.word	vfmw_Osal_Func_Ptr_S
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
	ldr	r1, [r6, #220]
	mov	r5, r0
	ldr	r3, [r3, #1300]
	mov	r4, #1
	mla	r2, r10, r1, r2
	ldr	r1, .L1513
	str	r2, [fp, #-48]
	ldr	r2, [r2, #28]
	mla	r7, r7, r2, r3
	bl	ue_v
	str	r0, [r6, #272]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #748]
	cmp	r9, #0
	bne	.L1507
.L1484:
	cmp	r0, #7
	bhi	.L1487
	ldr	r3, [r6, #276]
	cmp	r3, #7
	bhi	.L1487
	add	r3, r5, #53248
	str	r3, [fp, #-52]
	ldr	r2, [r3, #3996]
	cmp	r2, #0
	addeq	r10, r5, #20736
	moveq	r4, r2
	addeq	r10, r10, #152
	beq	.L1495
	b	.L1486
.L1491:
	ldr	r2, [r7, #748]
	cmp	r2, #0
	bne	.L1508
.L1492:
	str	r2, [r10]
	str	r2, [r10, #768]
	str	r2, [r10, #128]
	str	r2, [r10, #896]
.L1494:
	ldr	r2, [r6, #264]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r2, r4
	bcc	.L1509
.L1495:
	ldr	r1, .L1513+4
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1491
	ldr	r1, .L1513+8
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r2, [r7, #748]
	cmp	r2, #0
	beq	.L1492
.L1508:
	ldr	r1, .L1513+16
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1510
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1494
.L1509:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1496
.L1497:
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #3996]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1489:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1510:
	ldr	r1, .L1513+20
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+24
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1494
.L1507:
	ldr	r1, .L1513+28
	mov	r0, r5
	bl	ue_v
	mov	r3, r0
	ldr	r0, [r6, #272]
	mov	r9, r4, asl r3
	str	r3, [r6, #276]
	b	.L1484
.L1496:
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1497
	add	r10, r5, #21248
	mov	r4, #0
	add	r10, r10, #24
	b	.L1503
.L1499:
	ldr	r3, [r7, #748]
	cmp	r3, #0
	bne	.L1511
.L1500:
	str	r3, [r10]
	str	r3, [r10, #768]
	str	r3, [r10, #128]
	str	r3, [r10, #896]
.L1502:
	ldr	r3, [r6, #268]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r3, r4
	bcc	.L1497
.L1503:
	ldr	r1, .L1513+32
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1499
	ldr	r1, .L1513+36
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+40
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r3, [r7, #748]
	cmp	r3, #0
	beq	.L1500
.L1511:
	ldr	r1, .L1513+44
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1512
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1502
.L1487:
	add	r5, r5, #53248
	ldr	r2, [r5, #3996]
.L1486:
	ldr	r3, .L1513+48
	mov	r0, #1
	ldr	r1, .L1513+52
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1489
.L1512:
	ldr	r1, .L1513+56
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+60
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+56
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1513+60
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1502
.L1514:
	.align	2
.L1513:
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
	.word	vfmw_Osal_Func_Ptr_S
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
	beq	.L1527
	add	r8, r0, #24576
	mov	r10, #0
	b	.L1518
.L1550:
	ldr	r1, .L1556
	mov	r0, r9
	bl	ue_v
	cmp	r4, #2
	beq	.L1548
.L1529:
	cmp	r4, #6
	orreq	r5, r5, #1
	cmp	r5, #0
	bne	.L1532
	cmp	r4, #4
	beq	.L1549
.L1533:
	cmp	r4, #6
	bhi	.L1534
.L1530:
	add	r3, r9, #53248
	ldr	r3, [r3, #3996]
	cmp	r3, #0
	bne	.L1534
	cmp	r4, #0
	beq	.L1536
.L1535:
	subs	r6, r6, #1
	beq	.L1537
.L1527:
	ldr	r1, .L1556+4
	mov	r0, r9
	bl	ue_v
	bic	r3, r0, #2
	sub	r5, r0, #3
	clz	r5, r5
	cmp	r3, #1
	mov	r4, r0
	mov	r5, r5, lsr #5
	beq	.L1550
	cmp	r4, #2
	bne	.L1529
.L1548:
	ldr	r1, .L1556+8
	mov	r0, r9
	bl	ue_v
	cmp	r5, #0
	beq	.L1530
.L1532:
	ldr	r1, .L1556+12
	mov	r0, r9
	bl	ue_v
	cmp	r4, #4
	bne	.L1533
.L1549:
	ldr	r1, .L1556+16
	mov	r0, r9
	bl	ue_v
	add	r3, r9, #53248
	ldr	r3, [r3, #3996]
	cmp	r3, #0
	beq	.L1535
.L1534:
	ldr	r3, .L1556+20
	mov	r0, #1
	ldr	r1, .L1556+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1555:
	ldr	r1, .L1556
	mov	r0, r9
	bl	ue_v
	ldr	r2, [r4, #8]
	cmp	r2, #2
	str	r0, [r4, #12]
	beq	.L1551
.L1521:
	cmp	r2, #3
	cmpne	r2, #6
	beq	.L1552
.L1522:
	cmp	r2, #4
	beq	.L1553
.L1523:
	cmp	r2, #6
	bhi	.L1534
	add	r3, r9, #53248
	ldr	r3, [r3, #3996]
	cmp	r3, #0
	bne	.L1534
	cmp	r2, #0
	add	r10, r10, #1
	beq	.L1536
	cmp	r10, #100
	beq	.L1554
.L1518:
	ldr	r1, .L1556+4
	mov	r0, r9
	ldr	r5, [r8, #1812]
	bl	ue_v
	mov	r6, r10, asl #2
	mov	r7, r10, asl #4
	add	r4, r6, r7
	movw	r3, #2004
	mla	r4, r3, r5, r4
	add	r4, r9, r4
	add	r4, r4, #22272
	add	r4, r4, #104
	bic	r1, r0, #2
	str	r0, [r4, #8]
	cmp	r1, #1
	mov	r2, r0
	beq	.L1555
	cmp	r2, #2
	bne	.L1521
.L1551:
	ldr	r1, .L1556+8
	mov	r0, r9
	bl	ue_v
	add	r3, r6, r7
	movw	r2, #2004
	mla	r3, r2, r5, r3
	add	r3, r9, r3
	add	r2, r3, #22272
	str	r0, [r2, #120]
	ldr	r2, [r2, #112]
	cmp	r2, #3
	cmpne	r2, #6
	bne	.L1522
.L1552:
	ldr	r1, .L1556+12
	mov	r0, r9
	bl	ue_v
	add	r3, r6, r7
	movw	r2, #2004
	mla	r3, r2, r5, r3
	add	r3, r9, r3
	add	r2, r3, #22272
	str	r0, [r2, #124]
	ldr	r2, [r2, #112]
	cmp	r2, #4
	bne	.L1523
.L1553:
	ldr	r1, .L1556+16
	mov	r0, r9
	bl	ue_v
	add	r6, r6, r7
	movw	r7, #2004
	mla	r5, r7, r5, r6
	add	r5, r9, r5
	add	r3, r5, #22272
	add	r5, r3, #104
	ldr	r2, [r3, #112]
	str	r0, [r3, #128]
	b	.L1523
.L1536:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1554:
	ldr	r3, .L1556+20
	mov	r0, #1
	ldr	r1, .L1556+28
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1537:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1557:
	.align	2
.L1556:
	.word	.LC87
	.word	.LC86
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	vfmw_Osal_Func_Ptr_S
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r3, r0, #20480
	add	r6, r0, #24576
	mov	r5, r0
	ldrb	r8, [r3, #213]	@ zero_extendqisi2
	ldr	r7, [r6, #1812]
	cmp	r8, #0
	beq	.L1559
	clz	r8, r7
	mov	r8, r8, lsr #5
	str	r8, [r6, #1812]
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1577
.L1560:
	ldr	r1, .L1582
	mov	r0, r5
	bl	u_1
	movw	r4, #2004
	mla	r4, r4, r8, r5
	ldr	r10, .L1582+4
	ldr	r1, .L1582+8
	add	r4, r4, #22272
	ldr	r8, [r10, #68]
	add	r4, r4, #104
	mov	r3, r0
	uxtb	r2, r0
	strb	r3, [r4, #7]
	mov	r0, #16
	blx	r8
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1562
.L1566:
	mov	r9, #0
.L1574:
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1559:
	movw	r4, #2004
	mla	r4, r4, r7, r0
	add	r4, r4, #22272
	add	r4, r4, #104
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1578
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	mov	r8, r7
	cmp	r3, #5
	bne	.L1560
.L1577:
	ldr	r1, .L1582+12
	mov	r0, r5
	bl	u_1
	movw	r4, #2004
	mla	r4, r4, r8, r5
	ldr	r1, .L1582+16
	mov	r9, #0
	add	r4, r4, #22272
	strb	r0, [r4, #109]
	mov	r0, r5
	bl	u_1
	ldr	r3, .L1582+4
	ldrb	r2, [r4, #109]	@ zero_extendqisi2
	ldr	r1, .L1582+20
	ldr	r3, [r3, #68]
	strb	r0, [r4, #110]
	mov	r0, #16
	blx	r3
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1578:
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1579
	ldr	r1, .L1582
	ldrb	r6, [r4, #7]	@ zero_extendqisi2
	bl	u_1
	cmp	r6, r0
	bne	.L1580
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1566
	mov	r1, r8
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	DecMMCO
.L1562:
	mov	r0, r5
	mov	r1, #1
	bl	DecMMCO
	cmn	r0, #1
	mov	r9, r0
	movne	r3, #1
	movne	r9, #0
	strneb	r3, [r4, #4]
	bne	.L1574
	mov	r2, #0
	ldr	r3, [r10, #68]
	strb	r2, [r4, #4]
	mov	r0, #1
	ldr	r1, .L1582+24
	str	r7, [r6, #1812]
	blx	r3
	b	.L1574
.L1579:
	ldr	r1, .L1582+12
	ldrb	r6, [r4, #5]	@ zero_extendqisi2
	bl	u_1
	cmp	r6, r0
	bne	.L1581
	mov	r0, r5
	ldr	r1, .L1582+16
	ldrb	r4, [r4, #6]	@ zero_extendqisi2
	bl	u_1
	cmp	r4, r0
	beq	.L1566
	ldr	r3, .L1582+4
	mov	r0, #1
	ldr	r1, .L1582+28
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1574
.L1580:
	ldr	r4, .L1582+4
	add	r5, r5, #53248
	ldr	r1, .L1582+32
	mov	r0, #1
	mvn	r9, #0
	ldr	r3, [r4, #68]
	blx	r3
	ldr	ip, [r5, #4000]
	ldr	r4, [r4, #68]
	mov	r0, #1
	ldr	r3, [r5, #4036]
	ldr	r2, [r5, #4020]
	ldr	r1, .L1582+36
	str	ip, [sp]
	blx	r4
	b	.L1574
.L1581:
	ldr	r3, .L1582+4
	mov	r0, #1
	ldr	r1, .L1582+40
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1574
.L1583:
	.align	2
.L1582:
	.word	.LC95
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC96
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC97
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC98
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
	ldr	r1, .L1658
	add	r5, r0, #12288
	mov	r6, r0
	bl	ue_v
	ldr	r3, [r5, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r10, r0
	bhi	.L1585
	add	r8, r6, #53248
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1585
	mov	r1, r0
	mov	r0, r6
	bl	PPSSPSCheckTmpId
	subs	r9, r0, #0
	bne	.L1649
	add	r4, r6, #20480
	mov	r7, #2208
	mov	r1, #4000
	str	r10, [r4, #220]
	ldr	r2, [r5, #1304]
	ldr	r3, [r5, #1300]
	mla	r7, r7, r10, r2
	ldrb	r2, [r4, #211]	@ zero_extendqisi2
	cmp	r2, #5
	ldr	r2, [r7, #28]
	mla	r5, r1, r2, r3
	beq	.L1589
	ldr	r3, [r5, #3952]
	cmp	r3, #0
	beq	.L1589
.L1590:
	ldr	r1, [r5, #2904]
	mov	r0, r6
	ldr	r2, .L1658+4
	add	r1, r1, #4
	bl	u_v
	str	r0, [r4, #228]
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1647
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1650
.L1593:
	mov	r3, #0
	strb	r3, [r4, #209]
	strb	r3, [r4, #210]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1651
	ldr	r2, [r5, #3956]
	ldr	r1, [r5, #3960]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1617:
	ldrb	r2, [r5, #19]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1600
	strb	r2, [r4, #212]
.L1602:
	ldr	r2, [r4, #260]
	cmp	r2, r3
	bcs	.L1652
.L1603:
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1653
.L1605:
	add	r10, r6, #16384
	mov	r3, #0
	str	r3, [r10, #3420]
	str	r3, [r10, #3424]
	ldr	r3, [r5, #2908]
	cmp	r3, #0
	beq	.L1654
.L1609:
	mov	r3, #0
	str	r3, [r10, #3468]
	str	r3, [r10, #3472]
	ldr	r3, [r5, #2908]
	cmp	r3, #1
	beq	.L1655
.L1612:
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1647
	ldrb	r3, [r7, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1615
	ldr	r1, .L1658+8
	mov	r0, r6
	bl	ue_v
	cmp	r0, #0
	bne	.L1616
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1616
.L1615:
	mov	r0, r6
	bl	IsNewPic
	uxtb	r0, r0
	strb	r0, [r4, #213]
	cmp	r0, #0
	bne	.L1629
	ldr	r2, [r4, #260]
	ldr	r3, [r4, #1896]
	cmp	r2, r3
	bls	.L1656
.L1629:
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1589:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1590
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+16
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1629
.L1600:
	mov	r2, #1
	strb	r2, [r4, #212]
.L1620:
	ldr	r2, [r4, #260]
	cmp	r2, r3, lsr #1
	bcc	.L1603
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+20
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1629
.L1616:
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+24
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L1658+28
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1647
	mov	r3, #0
	ldr	r0, [r8, #4056]
	mov	r2, r3
	mov	r1, #102
	blx	r4
.L1647:
	mvn	r9, #0
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1651:
	ldr	r1, .L1658+32
	mov	r0, r6
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #209]
	cmp	r0, #0
	bne	.L1657
	ldr	r2, [r5, #3956]
	ldrb	ip, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3960]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1619
	mov	r3, r3, asl #1
	b	.L1617
.L1654:
	ldr	r1, [r5, #2912]
	mov	r0, r6
	ldr	r2, .L1658+36
	add	r1, r1, #4
	bl	u_v
	str	r0, [r10, #3420]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1609
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1609
	ldr	r1, .L1658+40
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3424]
	b	.L1609
.L1650:
	cmp	r0, #0
	str	r0, [r4, #224]
	beq	.L1593
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+44
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1593
.L1655:
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1612
	ldr	r1, .L1658+48
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3468]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1612
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1612
	ldr	r1, .L1658+52
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3472]
	b	.L1612
.L1657:
	ldr	r1, .L1658+56
	mov	r0, r6
	bl	u_1
	strb	r0, [r4, #210]
	ldr	r2, [r5, #3956]
	ldrb	r0, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3960]
	add	r3, r2, #1
	cmp	r0, #0
	ldrb	r0, [r4, #209]	@ zero_extendqisi2
	mla	r3, r1, r3, r3
	moveq	r2, #2
	beq	.L1598
.L1619:
	mov	r2, #1
.L1598:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1617
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r4, #212]
	bne	.L1602
	b	.L1620
.L1653:
	ldr	r1, .L1658+60
	mov	r0, r6
	bl	ue_v
	cmp	r0, #65536
	str	r0, [r4, #248]
	bcs	.L1606
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	beq	.L1605
.L1606:
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+64
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1605
.L1585:
	ldr	r3, .L1658+12
	mov	r2, r10
	ldr	r1, .L1658+68
	mvn	r9, #0
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1649:
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+72
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1629
.L1652:
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+76
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1629
.L1656:
	ldr	r3, .L1658+12
	mov	r0, #1
	ldr	r1, .L1658+80
	mvn	r9, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1629
.L1659:
	.align	2
.L1658:
	.word	.LC102
	.word	.LC106
	.word	.LC118
	.word	vfmw_Osal_Func_Ptr_S
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
	.word	.LC111
	.word	.LC120
	UNWIND(.fnend)
	.size	ProcessSliceHeaderFirstPart, .-ProcessSliceHeaderFirstPart
	.align	2
	.global	ProcessSliceHeaderSecondPart
	.type	ProcessSliceHeaderSecondPart, %function
ProcessSliceHeaderSecondPart:
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
	add	r6, r0, #12288
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r3, [r6, #1292]
	ldr	r2, [r4, #220]
	sub	r3, r3, #1
	cmp	r3, r2
	bcc	.L1661
	add	r8, r0, #53248
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1661
	bl	PPSSPSCheck
	cmp	r0, #0
	bne	.L1743
	ldr	r2, [r4, #220]
	mov	r7, #2208
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldr	r9, [r6, #1304]
	mul	r7, r7, r2
	cmp	r3, #1
	add	r6, r9, r7
	beq	.L1744
.L1665:
	ldr	r2, [r6, #36]
	cmp	r3, #1
	str	r2, [r4, #264]
	ldr	r2, [r6, #40]
	str	r2, [r4, #268]
	bls	.L1745
	cmp	r3, #2
	beq	.L1692
.L1676:
	mov	r3, #32
	str	r3, [r4, #268]
.L1677:
	mov	r0, r5
	bl	ref_pic_list_reordering
	subs	r3, r0, #0
	str	r3, [fp, #-48]
	bne	.L1746
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1679
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, #1
	moveq	r3, r2
	beq	.L1680
.L1679:
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L1747
.L1696:
	mov	r2, #0
	mov	r3, r2
.L1680:
	ldr	r10, .L1753
	mov	r0, #19
	strb	r3, [r4, #215]
	ldr	r1, .L1753+4
	ldr	r3, [r10, #68]
	blx	r3
	ldrb	r2, [r4, #215]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #272]
	cmp	r2, r3
	str	r3, [r4, #276]
	bne	.L1748
.L1681:
	ldr	r3, [r4, #240]
	cmp	r3, #0
	bne	.L1749
.L1682:
	mov	r3, #0
	str	r3, [r4, #1816]
	ldrb	r3, [r9, r7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1683
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1750
.L1683:
	ldr	r1, .L1753+8
	mov	r0, r5
	bl	se_v
	mov	r3, #0
	str	r3, [r4, #1824]
	str	r3, [r4, #1828]
	str	r3, [r4, #1832]
	str	r0, [r4, #1820]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1751
.L1712:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1692:
	mov	r3, #32
	str	r3, [r4, #264]
	b	.L1676
.L1751:
	ldr	r1, .L1753+12
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1824]
	bhi	.L1686
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1686
	cmp	r0, #1
	beq	.L1712
	ldr	r1, .L1753+16
	mov	r0, r5
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1828]
	cmp	r3, #12
	bhi	.L1689
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1689
	mov	r0, r5
	ldr	r1, .L1753+20
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1832]
	cmp	r3, #12
	bhi	.L1691
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	beq	.L1712
.L1691:
	mvn	r2, #0
	ldr	r3, [r10, #68]
	ldr	r1, .L1753+24
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	b	.L1712
.L1748:
	mov	r0, r5
	bl	pred_weight_table
	cmp	r0, #0
	beq	.L1681
	mvn	r2, #0
	ldr	r3, [r10, #68]
	ldr	r1, .L1753+28
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	b	.L1712
.L1749:
	mov	r0, r5
	bl	dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1682
	mvn	r2, #0
	ldr	r3, [r10, #68]
	ldr	r1, .L1753+32
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	b	.L1712
.L1747:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r2, r3
	bne	.L1696
	b	.L1680
.L1744:
	ldr	r1, .L1753+36
	mov	r0, r5
	bl	u_1
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	strb	r0, [r4, #214]
	b	.L1665
.L1745:
	ldr	r1, .L1753+40
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1667
	ldr	r3, [r4, #264]
.L1668:
	ldrb	r2, [r4, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1669
	cmp	r3, #15
	bhi	.L1670
	ldr	r3, [r4, #268]
	cmp	r3, #15
	bhi	.L1752
.L1671:
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	bne	.L1670
.L1672:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1692
	cmp	r3, #1
	bne	.L1676
	b	.L1677
.L1661:
	ldr	r3, .L1753
	mov	r0, #1
	ldr	r1, .L1753+44
	mvn	ip, #0
	str	ip, [fp, #-48]
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1750:
	ldr	r1, .L1753+48
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1816]
	bhi	.L1684
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	beq	.L1683
.L1684:
	mvn	r2, #0
	ldr	r3, [r10, #68]
	ldr	r1, .L1753+52
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	b	.L1712
.L1669:
	cmp	r3, #31
	bhi	.L1673
	ldr	r3, [r4, #268]
	cmp	r3, #31
	bls	.L1674
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1674
.L1673:
	ldr	r3, .L1753
	mvn	r2, #0
	ldr	r1, .L1753+56
	mov	r0, #1
	str	r2, [fp, #-48]
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1712
.L1674:
	ldr	r3, [r8, #3996]
	cmp	r3, #0
	beq	.L1672
	b	.L1673
.L1752:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1671
.L1670:
	ldr	r3, .L1753
	mvn	r2, #0
	ldr	r1, .L1753+60
	mov	r0, #1
	str	r2, [fp, #-48]
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1712
.L1667:
	ldr	r1, .L1753+64
	mov	r0, r5
	bl	ue_v
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #264]
	bne	.L1668
	ldr	r1, .L1753+68
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #264]
	str	r0, [r4, #268]
	b	.L1668
.L1689:
	mvn	r2, #0
	ldr	r3, [r10, #68]
	ldr	r1, .L1753+72
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	b	.L1712
.L1686:
	mvn	r2, #0
	ldr	r3, [r10, #68]
	ldr	r1, .L1753+76
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	b	.L1712
.L1743:
	ldr	r3, .L1753
	mvn	r2, #0
	ldr	r1, .L1753+80
	mov	r0, #1
	str	r2, [fp, #-48]
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1712
.L1746:
	ldr	r3, .L1753
	mvn	r2, #0
	ldr	r1, .L1753+84
	mov	r0, #1
	str	r2, [fp, #-48]
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1712
.L1754:
	.align	2
.L1753:
	.word	vfmw_Osal_Func_Ptr_S
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
	ldr	ip, [r3, #220]
	ldr	r5, [lr, #1300]
	ldrb	r6, [r3, #209]	@ zero_extendqisi2
	mla	r1, r1, ip, r2
	cmp	r6, #0
	ldr	r4, [r3, #260]
	ldr	lr, [r3, #228]
	ldr	r2, [r1, #28]
	str	ip, [r3, #1864]
	ldr	ip, [r3, #240]
	mla	r2, r7, r2, r5
	ldr	r1, [r2, #744]
	str	r4, [r3, #1896]
	str	lr, [r3, #1872]
	str	r1, [r3, #1860]
	ldrneb	r1, [r3, #210]	@ zero_extendqisi2
	strb	r6, [r3, #1856]
	str	ip, [r3, #1868]
	strneb	r1, [r3, #1857]
	ldrb	r1, [r3, #211]	@ zero_extendqisi2
	cmp	r1, #5
	strb	r1, [r3, #1858]
	ldreq	r1, [r3, #248]
	streq	r1, [r3, #1876]
	ldr	r1, [r2, #2908]
	cmp	r1, #0
	bne	.L1758
	add	r1, r0, #16384
	ldr	ip, [r1, #3420]
	str	ip, [r3, #1880]
	ldr	r1, [r1, #3424]
	str	r1, [r3, #1884]
	ldr	r1, [r2, #2908]
.L1758:
	cmp	r1, #1
	addeq	r2, r0, #16384
	add	r0, r0, #53248
	ldreq	r1, [r2, #3468]
	streq	r1, [r3, #1888]
	ldreq	r2, [r2, #3472]
	streq	r2, [r3, #1892]
	ldr	r3, [r0, #4012]
	add	r3, r3, #1
	str	r3, [r0, #4012]
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
	beq	.L1765
	bcc	.L1766
	cmp	r3, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r2, #211]	@ zero_extendqisi2
	add	r0, r0, #53248
	cmp	r3, #5
	beq	.L1775
.L1768:
	mov	r3, #0
	str	r3, [r0, #1504]
	ldmfd	sp, {fp, sp, pc}
.L1766:
	add	r0, r0, #53248
	ldr	r3, [r0, #1500]
	cmp	r3, #2
	movne	r3, #1
	strne	r3, [r0, #1500]
	b	.L1768
.L1765:
	add	r0, r0, #53248
	mov	r2, #2
	mov	r3, #0
	str	r2, [r0, #1500]
	str	r3, [r0, #1504]
	ldmfd	sp, {fp, sp, pc}
.L1775:
	mov	r3, #1
	str	r3, [r0, #1504]
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r3, r0, #16384
	mov	r4, r0
	ldrb	r3, [r3, #1212]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1777
	ldr	r2, [r0, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #64]
	ldr	r2, [r0, #368]
	ldr	r3, [r2, #72]
	sub	r3, r3, #1
	str	r3, [r2, #72]
.L1777:
	ldr	r0, [r4, #368]
	ldrb	r7, [r0]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L1788
	mov	r3, #0
	mov	r2, r0
	mov	r5, r3
.L1779:
	add	r3, r3, #1
	ldr	r1, [r2, #12]
	cmp	r3, r7
	add	r2, r2, #28
	add	r5, r5, r1
	bne	.L1779
.L1778:
	mov	r8, r7, asl #5
	ldr	r3, [r0, #72]
	sub	r8, r8, r7, asl #2
	ldr	r2, [r0, #64]
	add	r0, r0, r8
	ldr	r6, .L1799
	str	r3, [sp, #4]
	mov	r3, r5
	ldr	ip, [r0, #12]
	mov	r0, #7
	ldr	r1, .L1799+4
	ldr	r9, [r6, #68]
	str	ip, [sp]
	blx	r9
	ldr	r3, [r4, #368]
	mov	r2, r7
	mov	r0, #7
	ldr	r1, .L1799+8
	ldrb	r7, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #64]
	mov	lr, r7, asl #5
	and	ip, ip, r0
	sub	lr, lr, r7, asl #2
	add	r3, r3, lr
	str	ip, [r3, #24]
	ldr	r3, [r4, #368]
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r7, [r3, #64]
	mov	lr, ip, asl #5
	sub	lr, lr, ip, asl #2
	add	r3, r3, lr
	ldr	ip, [r3, #16]
	add	ip, ip, r7, lsr #3
	rsb	ip, r5, ip
	str	ip, [r3, #28]
	ldr	r3, [r4, #368]
	ldrb	r7, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #64]
	mov	lr, r7, asl #5
	sub	lr, lr, r7, asl #2
	add	r3, r3, lr
	ldr	lr, [r3, #12]
	add	r5, r5, lr
	rsb	r5, ip, r5, lsl #3
	str	r5, [r3, #20]
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
	ldr	r5, [r6, #68]
	add	r8, ip, r8
	ldrb	r7, [ip]	@ zero_extendqisi2
	ldr	r3, [r8, #24]
	mov	lr, r7, asl #5
	sub	lr, lr, r7, asl #2
	add	ip, ip, lr
	ldr	ip, [ip, #28]
	str	ip, [sp, #4]
	ldr	ip, [r8, #20]
	str	ip, [sp]
	blx	r5
	ldr	ip, [r4, #368]
	ldr	r2, [ip, #68]
	sub	r3, r2, #1
	cmp	r3, #1
	bhi	.L1798
	ldrb	r5, [ip]	@ zero_extendqisi2
	add	r1, r5, #1
	cmp	r2, r1
	movhi	r2, #1
	movls	r2, #0
	cmp	r1, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L1781
	add	r5, r5, #2
	mov	r7, #0
.L1782:
	sub	r3, r5, #1
	ldr	r1, .L1799+12
	mov	r0, #7
	mov	lr, r3, asl #5
	mov	r2, r3
	sub	r3, lr, r3, asl #2
	add	ip, ip, r3
	str	r7, [ip, #24]
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
	ldr	r8, [ip, #24]
	and	lr, lr, #3
	add	lr, r8, lr, lsl #3
	str	lr, [ip, #24]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	bic	lr, lr, #3
	str	lr, [ip, #28]
	ldr	ip, [r4, #368]
	ldr	r8, [r6, #68]
	add	ip, ip, r3
	ldr	r3, [ip, #24]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	blx	r8
	ldr	ip, [r4, #368]
	ldr	r3, [ip, #68]
	cmp	r5, #1
	cmpls	r5, r3
	add	r5, r5, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L1782
	sub	r3, r3, #1
.L1781:
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
	bcs	.L1776
	sxth	r3, r1
	add	r4, r4, #53248
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L1786:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	ldr	r0, [r4, #1528]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #1528]
	ldrcc	ip, [lr, #68]
	cmp	ip, r1
	bhi	.L1786
.L1776:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1798:
	ldr	r3, [r6, #68]
	mov	r0, #0
	ldr	r1, .L1799+16
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L1788:
	mov	r5, r7
	b	.L1778
.L1800:
	.align	2
.L1799:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC140
	.word	.LC141
	.word	.LC143
	.word	.LC142
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
	ble	.L1801
	mov	r0, #8
	ldr	r3, .L1810
	mov	r6, r0
	mov	r5, #0
	mov	r10, #255
	b	.L1807
.L1806:
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
	beq	.L1801
.L1807:
	cmp	r8, #16
	mov	lr, r6
	ldreq	r2, .L1810+4
	ldrneb	r4, [r5, r3]	@ zero_extendqisi2
	ldreqb	r4, [r5, r2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1806
	ldr	r1, .L1810+8
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
	b	.L1806
.L1801:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1811:
	.align	2
.L1810:
	.word	.LANCHOR1+16
	.word	.LANCHOR1
	.word	.LC144
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
	ldr	r1, .L1870
	mov	r5, r0
	bl	u_1
	add	r6, r5, #53248
	strb	r0, [r4]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L1861
	ldr	r1, .L1870+4
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #1]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L1861
	ldr	r1, .L1870+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	bne	.L1816
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L1817
.L1816:
	ldr	r3, .L1870+12
	mov	r0, #1
	ldr	r1, .L1870+16
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L1870+20
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1861
	mov	r3, #0
	ldr	r0, [r6, #4056]
	mov	r2, r3
	mov	r1, #102
	blx	r4
	mvn	r0, #0
.L1814:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1824:
	ldr	r1, .L1870+24
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1870+28
	str	r0, [r4, #60]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #1
	beq	.L1825
.L1843:
	mov	r0, r5
	ldr	r1, .L1870+32
	bl	se_v
	add	r3, r0, #12
	str	r0, [r4, #56]
	cmp	r3, #24
	bhi	.L1826
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L1844
.L1826:
	ldr	r3, .L1870+12
	mov	r0, #1
	ldr	r1, .L1870+36
	ldr	r3, [r3, #68]
	blx	r3
.L1861:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1817:
	ldr	r1, .L1870+40
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #36]
	bhi	.L1818
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L1818
	ldr	r1, .L1870+44
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #40]
	bhi	.L1820
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L1820
	ldr	r1, .L1870+48
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #2]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L1861
	ldr	r2, .L1870+52
	mov	r1, #2
	mov	r0, r5
	bl	u_v
	cmp	r0, #2
	str	r0, [r4, #44]
	bhi	.L1862
	ldr	r1, .L1870+56
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1870+60
	str	r0, [r4, #48]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1870+64
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1870+68
	str	r0, [r4, #52]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1870+72
	strb	r0, [r4, #3]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1870+76
	strb	r0, [r4, #4]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #17]
	cmp	r0, #0
	bne	.L1863
.L1823:
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
	bcs	.L1824
.L1844:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1863:
	ldr	r3, .L1870+12
	mov	r0, #1
	ldr	r1, .L1870+80
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1823
.L1818:
	ldr	r3, .L1870+12
	mov	r0, #1
	ldr	r1, .L1870+84
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1814
.L1820:
	ldr	r3, .L1870+12
	mov	r0, #1
	ldr	r1, .L1870+88
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1814
.L1825:
	add	r3, r4, #4
	str	r6, [fp, #-80]
	sub	r9, fp, #72
	add	r8, r4, #1984
	add	r10, r4, #64
	mov	r6, r3
	b	.L1834
.L1867:
	ldr	r3, [ip, #1300]
	ldr	ip, [r4, #28]
	mla	r3, lr, ip, r3
	ldrb	ip, [r3, #25]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L1864
	ldr	r3, .L1870+92
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L1870+12
	ldr	r3, [r3, #52]
	blx	r3
.L1829:
	add	r7, r7, #1
	add	r8, r8, #16
	cmp	r7, #6
	add	r10, r10, #64
	beq	.L1865
.L1834:
	ldr	r1, .L1870+96
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
	beq	.L1866
	cmp	r7, #0
	cmpne	r7, #3
	beq	.L1867
	ldr	r3, .L1870+12
	mov	r2, #16
	sub	r1, r8, #16
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1829
.L1865:
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
.L1842:
	ldr	r2, [r4, #60]
	mov	r3, #0
	cmp	r2, #1
	strne	r3, [r8]
	strneb	r3, [r10]
	beq	.L1868
.L1837:
	ldr	r1, [r4, #28]
	mov	ip, #4000
	ldr	r3, [r5, #1300]
	mov	r0, r9
	mov	r2, #64
	mla	r3, ip, r1, r3
	ldrb	r1, [r3, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1869
	ldr	r1, .L1870+100
	cmp	r7, #0
	ldr	r3, .L1870+12
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L1838:
	add	r7, r7, #1
	add	r9, r9, #64
	cmp	r7, #2
	add	r6, r6, #256
	add	r8, r8, #4
	add	r10, r10, #1
	bne	.L1842
	ldr	r5, [fp, #-80]
	ldr	r6, [fp, #-84]
	b	.L1843
.L1866:
	mov	r3, r2
	str	r9, [sp]
	mov	r2, r8
	mov	r1, r10
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r9]
	cmp	r3, #1
	bne	.L1829
	ldr	r1, .L1870+92
	mov	r2, #16
	ldr	r3, .L1870+12
	cmp	r7, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1829
.L1864:
	add	r1, r3, r7, lsl #4
	ldr	r3, .L1870+12
	add	r1, r1, #2672
	mov	r2, #16
	add	r1, r1, #8
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1829
.L1862:
	ldr	r3, .L1870+12
	mov	r0, #1
	ldr	r1, .L1870+104
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1814
.L1868:
	ldr	r1, .L1870+108
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
	bne	.L1837
	str	r8, [sp]
	bl	Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L1838
	ldr	r1, .L1870+100
	mov	r2, #64
	ldr	r3, .L1870+12
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r9
	blx	r3
	b	.L1838
.L1869:
	add	r1, r3, r7, lsl #6
	ldr	r3, .L1870+12
	add	r1, r1, #2768
	add	r1, r1, #8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1838
.L1871:
	.align	2
.L1870:
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC148
	.word	g_event_report
	.word	.LC163
	.word	.LC164
	.word	.LC165
	.word	.LC168
	.word	.LC149
	.word	.LC151
	.word	.LC153
	.word	.LC154
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC150
	.word	.LC152
	.word	.LANCHOR0+80
	.word	.LC166
	.word	.LANCHOR0+112
	.word	.LC155
	.word	.LC167
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
	ldreq	ip, .L1897
	movweq	r3, #9553
	beq	.L1895
	cmp	r1, #0
	beq	.L1896
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
	beq	.L1876
	mov	ip, ip, asl #1
	adds	r2, ip, #6
	str	r2, [fp, #-52]
	beq	.L1876
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
.L1880:
	ldr	r0, [fp, #-48]
	ldrb	r1, [r5, #1]!	@ zero_extendqisi2
	ldrsb	ip, [r0, #1]!
	str	r0, [fp, #-48]
	sxtb	r0, r1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, #0
	beq	.L1894
	cmp	r6, #5
	bhi	.L1881
	add	r7, r4, #64
	add	r4, r4, #128
	mov	r0, r10
	mov	r1, r7
.L1879:
	ldr	lr, [r1], #4
	ldr	ip, [r0], #4
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, r4
	bne	.L1879
.L1877:
	ldr	r1, [fp, #-52]
	add	r6, r6, #1
	add	r9, r9, #256
	add	r8, r8, #256
	cmp	r6, r1
	add	r2, r2, #256
	mov	r4, r7
	add	r10, r10, #64
	bne	.L1880
	ldr	r7, [fp, #-56]
	ldr	r1, [fp, #-60]
.L1876:
	ldr	r0, [r7, #56]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L1874:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1881:
	mov	r0, r8
	mov	r1, r9
.L1878:
	ldr	lr, [r1, #4]!
	ldr	ip, [r0, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r1
	bne	.L1878
.L1894:
	add	r7, r4, #64
	b	.L1877
.L1896:
	ldr	ip, .L1897
	mov	r0, r1
	movw	r3, #9554
.L1895:
	ldr	r2, .L1897+4
	ldr	r1, .L1897+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1874
.L1898:
	.align	2
.L1897:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
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
	ldr	r1, .L1916
	add	r4, r0, #12288
	mov	r5, r0
	bl	ue_v
	ldr	r3, [r4, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r6, r0
	bls	.L1900
	ldr	r3, .L1916+4
	mov	r0, #1
	ldr	r1, .L1916+8
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r4, #1292]
	sub	r2, r3, #1
	cmp	r6, r2
	bls	.L1908
	ldr	r2, .L1916+12
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L1908
	add	r5, r5, #53248
	str	r3, [fp, #-40]
	str	r6, [fp, #-44]
	mov	r3, #8
	ldr	r0, [r5, #4056]
	sub	r2, fp, #44
	mov	r1, #110
	blx	r4
	mvn	r0, #0
.L1901:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1900:
	ldr	r1, .L1916+16
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	ip, r0
	bhi	.L1912
	ldr	r2, [r4, #1300]
	mov	r3, #4000
	mla	r3, r3, r0, r2
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1913
	mov	r8, #2208
	ldr	r3, [r4, #1304]
	mul	r7, r8, r6
	add	r3, r3, r7
	ldrb	r9, [r3, #19]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L1904
	ldr	r9, .L1916+20
	mov	r0, r5
	mov	r1, r9
	str	r6, [r9, #24]
	str	ip, [r9, #28]
	bl	ProcessPPS
	subs	r5, r0, #0
	bne	.L1914
	ldr	r1, [r4, #1304]
	mov	r0, r9
	add	r1, r1, r7
	bl	PPSEqual
	cmp	r0, #0
	beq	.L1901
	ldr	ip, .L1916+4
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
	b	.L1901
.L1904:
	str	r6, [r3, #24]
	mov	r0, r5
	ldr	r3, [r4, #1304]
	add	r3, r3, r7
	str	ip, [r3, #28]
	ldr	r1, [r4, #1304]
	add	r1, r1, r7
	bl	ProcessPPS
	cmp	r0, #0
	bne	.L1915
	ldr	r3, [r4, #1304]
	mov	r2, #1
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r2, [r7, #19]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1908:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1912:
	ldr	r3, .L1916+4
	mov	r0, #1
	ldr	r1, .L1916+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1901
.L1914:
	ldr	r3, .L1916+4
	mov	r0, #1
	ldr	r1, .L1916+28
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1901
.L1913:
	ldr	r3, .L1916+4
	mov	r0, #1
	ldr	r1, .L1916+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1901
.L1915:
	ldr	r3, .L1916+4
	mov	r0, #1
	ldr	r1, .L1916+28
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r4, #1304]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r9, [r7, #19]
	b	.L1901
.L1917:
	.align	2
.L1916:
	.word	.LC169
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC170
	.word	g_event_report
	.word	.LC171
	.word	.LANCHOR2
	.word	.LC172
	.word	.LC174
	.word	.LC173
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
	ldr	r1, .L1969
	mov	r4, r0
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L1963
.L1920:
	ldr	r1, .L1969+4
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L1964
.L1921:
	ldr	r1, .L1969+8
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L1965
.L1923:
	ldr	r1, .L1969+12
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L1966
.L1924:
	ldr	r1, .L1969+16
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L1967
.L1926:
	ldr	r1, .L1969+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L1928
	ldr	r1, .L1969+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L1969+28
	mov	r1, #4
	str	r0, [r5, #96]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+32
	mov	r1, #4
	strb	r0, [r5, #92]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #96]
	cmp	r3, #31
	strb	r0, [r5, #93]
	bhi	.L1934
	add	r9, r4, #53248
	ldr	r6, [r9, #3996]
	cmp	r6, #0
	addeq	r7, r5, #96
	addeq	r8, r5, #59
	bne	.L1934
.L1932:
	ldr	r1, .L1969+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #96]
	cmp	r3, r6
	bcs	.L1932
	ldr	r2, .L1969+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+52
	mov	r1, #5
	str	r0, [r5, #356]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+56
	mov	r1, #5
	str	r0, [r5, #360]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+60
	mov	r1, #5
	str	r0, [r5, #364]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #368]
.L1928:
	ldr	r1, .L1969+64
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L1968
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	add	r9, r4, #53248
	cmp	r3, #0
	bne	.L1939
.L1938:
	ldr	r1, .L1969+68
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1969+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L1940
	ldr	r0, [r9, #3996]
.L1941:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1968:
	ldr	r1, .L1969+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L1969+28
	mov	r1, #4
	str	r0, [r5, #408]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+32
	mov	r1, #4
	strb	r0, [r5, #404]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #408]
	cmp	r3, #31
	strb	r0, [r5, #405]
	bhi	.L1934
	add	r9, r4, #53248
	ldr	r6, [r9, #3996]
	cmp	r6, #0
	addeq	r8, r5, #368
	addeq	r7, r5, #408
	addeq	r8, r8, #3
	bne	.L1934
.L1936:
	ldr	r1, .L1969+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #408]
	cmp	r3, r6
	bcs	.L1936
	ldr	r2, .L1969+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+52
	mov	r1, #5
	str	r0, [r5, #668]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+56
	mov	r1, #5
	str	r0, [r5, #672]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+60
	mov	r1, #5
	str	r0, [r5, #676]
	mov	r0, r4
	bl	u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #680]
	bne	.L1939
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1938
.L1939:
	ldr	r1, .L1969+76
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #14]
	b	.L1938
.L1967:
	ldr	r2, .L1969+80
	mov	r1, #32
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	u_v
	ldr	r1, .L1969+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #9]
	cmp	r0, #1
	bne	.L1926
	ldr	r1, [r5, #52]
	cmp	r1, #0
	beq	.L1926
	ldr	r0, [r5, #56]
	add	r9, r4, #53248
	bl	__aeabi_uidiv
	mov	r0, r0, lsr #1
	str	r0, [r9, #2816]
	b	.L1926
.L1966:
	ldr	r1, .L1969+92
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+96
	str	r0, [r5, #44]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #48]
	b	.L1924
.L1965:
	ldr	r2, .L1969+100
	mov	r1, #3
	mov	r0, r4
	bl	u_v
	ldr	r1, .L1969+104
	str	r0, [r5, #28]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1969+108
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L1923
	ldr	r2, .L1969+112
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+116
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+120
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #40]
	b	.L1923
.L1964:
	ldr	r1, .L1969+124
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #2]
	b	.L1921
.L1963:
	ldr	r2, .L1969+128
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L1920
	ldr	r2, .L1969+132
	mov	r1, #16
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1969+136
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #20]
	b	.L1920
.L1940:
	ldr	r1, .L1969+140
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1969+144
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+148
	str	r0, [r5, #684]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+152
	str	r0, [r5, #688]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+156
	str	r0, [r5, #696]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+160
	str	r0, [r5, #692]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1969+164
	str	r0, [r5, #700]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #704]
	ldr	r0, [r9, #3996]
	cmp	r0, #0
	beq	.L1941
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1934:
	ldr	r3, .L1969+168
	mov	r0, #1
	ldr	r1, .L1969+172
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1970:
	.align	2
.L1969:
	.word	.LC175
	.word	.LC179
	.word	.LC181
	.word	.LC188
	.word	.LC191
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC209
	.word	.LC210
	.word	.LC208
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC189
	.word	.LC190
	.word	.LC182
	.word	.LC183
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC180
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC211
	.word	.LC212
	.word	.LC213
	.word	.LC214
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC199
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
	ldreq	ip, .L2006
	movweq	r3, #9786
	beq	.L2003
	cmp	r1, #0
	beq	.L2004
	ldrb	lr, [r1]	@ zero_extendqisi2
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	ip, [r6, #736]
	ldr	r2, [r1, #736]
	ldrb	r0, [r6, #1]	@ zero_extendqisi2
	cmp	r3, lr
	cmpeq	ip, r2
	ldrb	r5, [r1, #1]	@ zero_extendqisi2
	ldrb	r2, [r6, #2]	@ zero_extendqisi2
	ldrb	r4, [r1, #2]	@ zero_extendqisi2
	moveq	lr, #1
	movne	lr, #0
	ldr	r3, [r6, #740]
	cmp	r0, r5
	movne	ip, #0
	andeq	ip, lr, #1
	ldr	r5, [r1, #740]
	cmp	r2, r4
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	lr, [r1, #744]
	ldr	r4, [r6, #744]
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
	beq	.L1975
	add	r2, r6, #3
	sub	r0, r1, #396
	str	r2, [fp, #-48]
	add	r2, r1, #3
	add	r9, r1, #756
	sub	r10, r6, #396
	sub	r4, r6, #140
	mov	r8, r6
	str	r6, [fp, #-52]
	mov	r7, #0
	mov	r5, r0
	mov	r6, r2
	str	r1, [fp, #-56]
.L1979:
	ldr	r1, [fp, #-48]
	ldrsb	r0, [r6, #1]!
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-48]
	sxtb	r1, r2
	cmp	r0, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L1976
	cmp	r7, #5
	bhi	.L1986
	add	r2, r8, #756
	add	lr, r8, #820
	mov	r1, r9
.L1978:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, lr
	bne	.L1978
.L1976:
	add	r7, r7, #1
	add	r10, r10, #256
	cmp	r7, #8
	add	r5, r5, #256
	add	r4, r4, #256
	add	r8, r8, #64
	add	r9, r9, #64
	bne	.L1979
	ldr	r6, [fp, #-52]
	ldr	r1, [fp, #-56]
.L1975:
	ldr	r2, [r1, #2904]
	ldr	ip, [r6, #2908]
	ldr	r0, [r1, #2908]
	ldr	lr, [r6, #2904]
	cmp	ip, r0
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	beq	.L1981
	cmp	ip, #1
	bne	.L1980
	ldr	r0, [r1, #2916]
	ldr	ip, [r6, #2916]
	ldrb	r2, [r6, #16]	@ zero_extendqisi2
	ldrb	r4, [r1, #16]	@ zero_extendqisi2
	ldr	lr, [r6, #2920]
	cmp	ip, r0
	cmpeq	r2, r4
	ldr	r2, [r1, #2920]
	ldr	r5, [r6, #2924]
	ldr	ip, [r1, #2924]
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
	beq	.L1980
	add	ip, r6, #2912
	add	r0, r1, #2912
	add	ip, ip, #12
	add	r0, r0, #12
	mov	r2, #0
.L1983:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r5
	bne	.L1983
.L1980:
	ldrb	lr, [r6, #17]	@ zero_extendqisi2
	ldrb	r0, [r1, #17]	@ zero_extendqisi2
	ldr	r2, [r6, #3952]
	ldr	r4, [r1, #3952]
	ldr	r7, [r6, #3956]
	cmp	lr, r0
	cmpeq	r2, r4
	ldr	r2, [r1, #3956]
	ldr	r5, [r6, #3960]
	ldr	r4, [r1, #3960]
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
	bne	.L1984
	ldrb	r0, [r6, #19]	@ zero_extendqisi2
	ldrb	r2, [r1, #19]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L1984:
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
	bne	.L2005
.L1985:
	ldrb	r0, [r6, #22]	@ zero_extendqisi2
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L1973:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2005:
	ldr	ip, [r1, #3968]
	ldr	lr, [r6, #3968]
	ldr	r0, [r6, #3964]
	ldr	r2, [r1, #3964]
	ldr	r5, [r6, #3972]
	cmp	lr, ip
	cmpeq	r0, r2
	ldr	r2, [r1, #3972]
	ldr	r4, [r6, #3976]
	ldr	lr, [r1, #3976]
	moveq	ip, #1
	movne	ip, #0
	cmp	r5, r2
	movne	r0, #0
	andeq	r0, ip, #1
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	and	r3, r3, r2
	b	.L1985
.L1986:
	mov	r1, r5
	mov	r2, r10
.L1977:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r4
	bne	.L1977
	b	.L1976
.L1981:
	ldr	r0, [r6, #2912]
	ldr	r2, [r1, #2912]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L1980
.L2004:
	ldr	ip, .L2006
	mov	r0, r1
	movw	r3, #9787
.L2003:
	ldr	r2, .L2006+4
	ldr	r1, .L2006+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1973
.L2007:
	.align	2
.L2006:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	SPSEqual, .-SPSEqual
	.global	__aeabi_idiv
	.align	2
	.global	H264GetDar
	.type	H264GetDar, %function
H264GetDar:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	mov	ip, r1
	moveq	r4, r0
	beq	.L2009
	subs	lr, r0, #255
	movne	lr, #1
	cmp	r0, #16
	movle	r4, #0
	andgt	r4, lr, #1
	cmp	r4, #0
	movne	r4, #0
	bne	.L2009
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
	cmp	r0, #255
	movne	r1, #0
	andeq	r1, r1, #1
	cmp	r1, #0
	bne	.L2009
	cmp	r0, #1
	moveq	r4, #5
	beq	.L2009
	cmp	lr, #0
	str	r3, [fp, #-24]
	ldrne	r2, .L2031
	addne	r0, r2, r0, lsl #3
	ldrne	r2, [r0, #84]
	ldrne	ip, [r0, #80]
	mov	r1, r2
	mov	r0, ip, asl #10
	bl	__aeabi_idiv
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #4]
	mov	r4, r0
	mov	r0, r3, asl #10
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
	bgt	.L2013
	rsb	r2, r0, #2256
	add	r2, r2, #7
	cmp	r3, r2
	bge	.L2014
.L2024:
	mov	r4, #4
.L2009:
	ldr	r3, .L2031+4
	mov	r2, r4
	ldr	r1, .L2031+8
	mov	r0, #22
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L2013:
	sub	r2, r0, #2256
	sub	r2, r2, #7
	cmp	r3, r2
	blt	.L2024
.L2014:
	movw	r3, #1819
	cmp	r0, r3
	bgt	.L2015
	rsb	r3, r0, #1808
	add	r3, r3, #12
	cmp	r2, r3
	blt	.L2026
.L2016:
	movw	r2, #1364
	cmp	r0, r2
	rsble	r0, r0, #1360
	subgt	r0, r0, #1360
	addle	r0, r0, #5
	subgt	r0, r0, #5
	cmp	r3, r0
	movlt	r4, #2
	movge	r4, #1
	b	.L2009
.L2015:
	sub	r3, r0, #1808
	sub	r3, r3, #12
	cmp	r2, r3
	bge	.L2016
.L2026:
	mov	r4, #3
	b	.L2009
.L2032:
	.align	2
.L2031:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC218
	UNWIND(.fnend)
	.size	H264GetDar, .-H264GetDar
	.align	2
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
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
	subs	r4, r1, #0
	mov	r5, r0
	beq	.L2148
	ldr	r2, [r4, #736]
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
	streqb	r3, [r4, #25]
	moveq	r3, #1
	streq	r3, [r4, #748]
	bne	.L2149
.L2048:
	ldr	r1, .L2165
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2904]
	bhi	.L2061
	add	r6, r5, #53248
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2061
	ldr	r1, .L2165+4
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #2908]
	bhi	.L2063
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2063
	cmp	r0, #0
	beq	.L2150
	cmp	r0, #1
	beq	.L2151
.L2069:
	ldr	r1, .L2165+8
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3952]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+12
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #17]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+16
	mov	r0, r5
	bl	ue_v
	movw	r8, #509
	sub	r3, r0, #1
	str	r0, [r4, #3956]
	cmp	r3, r8
	bhi	.L2074
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2074
	ldr	r1, .L2165+20
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3960]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+24
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	cmp	r0, #0
	bne	.L2152
	ldr	r1, .L2165+28
	mov	r0, r5
	bl	u_1
	ldr	r7, [r4, #3960]
	add	r7, r7, #1
	cmp	r7, #255
	strb	r0, [r4, #19]
	bhi	.L2109
	ldr	r9, [r4, #3956]
	add	r9, r9, #1
	cmp	r7, #1
	cmphi	r9, #3
	movhi	r3, #2
	strhi	r3, [fp, #-88]
	bhi	.L2078
.L2109:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+36
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2149:
	ldr	r1, .L2165+40
	bl	ue_v
	cmp	r0, #1
	str	r0, [r4, #748]
	bhi	.L2037
	add	r6, r5, #53248
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2037
	ldr	r1, .L2165+44
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #752]
	cmp	r2, #8
	beq	.L2153
.L2039:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+48
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L2165+52
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2040
	ldr	r0, [r4, #752]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #119
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #4056]
	blx	r7
.L2040:
	ldr	r1, .L2165+56
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #756]
	cmp	r2, #8
	beq	.L2154
.L2042:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+60
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L2165+52
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L2043
	ldr	r0, [r4, #756]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #119
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #4056]
	blx	r7
.L2043:
	ldr	r1, .L2165+64
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L2045
	ldr	r6, [r6, #3996]
	cmp	r6, #0
	bne	.L2045
	ldr	r1, .L2165+68
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #25]
	cmp	r0, #1
	bne	.L2048
	add	r7, r4, #2672
	sub	r8, fp, #72
	add	r7, r7, #8
	add	r10, r4, #3
	add	r9, r4, #760
	b	.L2054
.L2157:
	ldr	r3, .L2165+72
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2165+32
	ldr	r3, [r3, #52]
	blx	r3
.L2050:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2155
.L2054:
	ldr	r1, .L2165+76
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
	beq	.L2156
	cmp	r6, #0
	cmpne	r6, #3
	beq	.L2157
	ldr	r3, .L2165+32
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2050
.L2154:
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L2043
	b	.L2042
.L2153:
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L2040
	b	.L2039
.L2108:
	cmp	ip, r9
	cmpcs	r0, r7
	bcs	.L2107
	ldr	r3, .L2165+52
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2146
	strh	r0, [fp, #-70]	@ movhi
	mov	r3, #8
	strh	r9, [fp, #-76]	@ movhi
	sub	r2, fp, #76
	strh	r7, [fp, #-74]	@ movhi
	mov	r1, #107
	strh	ip, [fp, #-72]	@ movhi
	ldr	r0, [r6, #4056]
	blx	r4
.L2146:
	mvn	r0, #0
.L2139:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2152:
	ldr	r7, [r4, #3960]
	strb	r3, [r4, #19]
	sub	r3, r7, #1
	cmp	r3, r8
	bhi	.L2109
	ldr	r9, [r4, #3956]
	mov	r3, #1
	add	r7, r7, #1
	str	r3, [fp, #-88]
	add	r9, r9, r3
.L2078:
	ldr	r3, [fp, #-88]
	mov	r9, r9, asl #4
	mul	r7, r7, r3
	mov	r7, r7, asl #4
	mul	r1, r9, r7
	add	r1, r1, r1, lsr #1
	cmp	r1, #100663296
	bhi	.L2158
	ldr	r2, [r4, #740]
	sub	r3, r2, #10
	cmp	r3, #31
	ldrls	pc, [pc, r3, asl #2]
	b	.L2080
.L2082:
	.word	.L2081
	.word	.L2083
	.word	.L2117
	.word	.L2117
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2117
	.word	.L2085
	.word	.L2087
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2087
	.word	.L2088
	.word	.L2089
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2080
	.word	.L2091
	.word	.L2091
.L2150:
	ldr	r1, .L2165+80
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2912]
	bhi	.L2066
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L2069
.L2066:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+84
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2117:
	mov	r0, #60416
	movt	r0, 13
.L2084:
	bl	__aeabi_uidiv
	ldr	r10, .L2165+32
	ldr	r1, .L2165+88
	ldr	r3, [r10, #68]
	cmp	r0, #16
	movcc	r8, r0
	movcs	r8, #16
	mov	r2, r8
	mov	r0, #21
	blx	r3
	ldr	r2, [r4, #3952]
	cmp	r2, r8
	bhi	.L2092
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L2093
.L2092:
	mov	r3, r8
	ldr	r1, .L2165+92
	mov	r0, #0
	ldr	ip, [r10, #68]
	blx	ip
	ldr	r3, [r4, #3952]
	cmp	r3, #16
	bhi	.L2143
	cmp	r8, r3
	movcc	r8, r3
.L2143:
	str	r8, [r4, #3952]
.L2093:
	ldr	r1, .L2165+96
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #20]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+100
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #21]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	cmp	r0, #0
	bne	.L2159
.L2095:
	mov	r2, r9, lsr #1
	mov	r3, r7, lsr #1
	str	r9, [r4, #3984]
	str	r7, [r4, #3988]
	str	r2, [r4, #3992]
	str	r3, [r4, #3996]
.L2097:
	ldr	r1, .L2165+104
	mov	r0, r5
	bl	u_1
	uxtb	r3, r0
	strb	r3, [r4, #22]
	ldr	r2, [r6, #3996]
	cmp	r2, #0
	bne	.L2146
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r4, #68]
	bne	.L2160
	mov	r0, r3
	strb	r3, [r4, #43]
	mov	r3, #5
	str	r3, [r4, #56]
.L2100:
	ldr	r2, [r4, #48]
	mov	r3, r9
	ldr	r1, [r4, #44]
	str	r7, [sp]
	bl	H264GetDar
	ldr	r3, [r4, #3952]
	cmp	r3, #0
	str	r0, [r4, #52]
	ldreq	r2, [r5]
	beq	.L2104
	ldr	r2, [r4, #732]
	cmp	r3, r2
	ldr	r2, [r5]
	bhi	.L2106
	ldr	r1, [r2, #12]
	sub	r1, r1, #2
	cmp	r1, #1
	bls	.L2106
.L2104:
	cmp	r8, #16
	add	r5, r5, #12288
	movcs	r8, #16
	str	r8, [r5, #1296]
	ldr	r3, [r2, #28]
	cmp	r3, #25
	beq	.L2161
.L2107:
	add	r8, r8, #1
	mov	r0, #0
	str	r8, [r4, #3980]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2091:
	mov	r0, #12582912
	b	.L2084
.L2087:
	mov	r0, #30208
	movt	r0, 47
	b	.L2084
.L2155:
	add	r6, r4, #2768
	add	r8, r4, #1136
	add	r6, r6, #8
	add	r8, r8, #8
	sub	r9, fp, #88
	add	r10, r4, #9
	mov	r7, #0
.L2059:
	ldr	r1, .L2165+76
	mov	r0, r5
	bl	u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r6
	str	r3, [r9, #4]!
	strb	r3, [r10, #1]!
	beq	.L2162
	ldr	r1, .L2165+108
	cmp	r7, #0
	ldr	r3, .L2165+32
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2056:
	add	r7, r7, #1
	add	r6, r6, #64
	cmp	r7, #2
	add	r8, r8, #256
	bne	.L2059
	b	.L2048
.L2156:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2050
	ldr	r1, .L2165+72
	mov	r2, #16
	ldr	r3, .L2165+32
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2050
.L2037:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+112
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2106:
	cmp	r8, r3
	movcs	r8, r3
	b	.L2104
.L2061:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+116
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2159:
	ldr	r1, .L2165+120
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2165+124
	str	r0, [r4, #3964]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2165+128
	str	r0, [r4, #3968]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2165+132
	str	r0, [r4, #3972]
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #3972]
	ldr	lr, [fp, #-88]
	ldr	r2, [r4, #3964]
	mov	r3, r3, asl #1
	ldr	ip, [r4, #3968]
	mov	r1, lr, asl #1
	mul	r3, lr, r3
	mov	r2, r2, asl #1
	rsb	lr, r2, r9
	sub	ip, lr, ip, asl #1
	rsb	lr, r3, r7
	str	r0, [r4, #3976]
	mls	r0, r0, r1, lr
	cmp	ip, #0
	cmpgt	r0, #0
	ble	.L2095
	add	r2, r2, ip, lsr #1
	add	r3, r3, r0, lsr #1
	str	r2, [r4, #3992]
	str	r3, [r4, #3996]
	str	ip, [r4, #3984]
	str	r0, [r4, #3988]
	b	.L2097
.L2160:
	add	r1, r4, #28
	mov	r0, r5
	bl	vui_parameters
	cmp	r0, #0
	bne	.L2145
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2145
	ldr	r2, [r4, #732]
	clz	r3, r2
	mov	r3, r3, lsr #5
	cmp	r8, r2
	orrcc	r3, r3, #1
	cmp	r3, #0
	bne	.L2163
	ldr	r3, [r4, #3952]
	ldrb	r0, [r4, #43]	@ zero_extendqisi2
	cmp	r2, r3
	movcs	r8, r2
	movcc	r8, r3
	b	.L2100
.L2163:
	ldr	r10, [r10, #68]
	mov	r3, r8
	ldr	r1, .L2165+136
	mov	r0, #1
	blx	r10
.L2145:
	ldrb	r0, [r4, #43]	@ zero_extendqisi2
	b	.L2100
.L2161:
	ldr	r3, [r2, #776]
	cmp	r3, #0
	bne	.L2107
	ldr	r1, [r2, #760]
	ldr	ip, [r2, #736]
	cmp	r8, r1
	ldr	r0, [r2, #740]
	bls	.L2108
	ldr	r3, .L2165+52
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2146
	str	r1, [fp, #-72]
	mov	r3, #8
	str	r8, [fp, #-76]
	sub	r2, fp, #76
	ldr	r0, [r6, #4056]
	mov	r1, #106
	blx	r4
	mvn	r0, #0
	b	.L2139
.L2045:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+140
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2151:
	ldr	r1, .L2165+144
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #16]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+148
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2916]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+152
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2920]
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	bne	.L2146
	ldr	r1, .L2165+156
	mov	r0, r5
	bl	ue_v
	cmp	r0, #255
	str	r0, [r4, #2924]
	bhi	.L2071
	ldr	r7, [r6, #3996]
	cmp	r7, #0
	bne	.L2071
	cmp	r0, #0
	addne	r8, r4, #2912
	addne	r8, r8, #12
	bne	.L2073
	b	.L2069
.L2164:
	ldr	r3, [r4, #2924]
	cmp	r3, r7
	bls	.L2069
.L2073:
	ldr	r1, .L2165+160
	mov	r0, r5
	bl	se_v
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r3, [r6, #3996]
	cmp	r3, #0
	beq	.L2164
	b	.L2146
.L2074:
	ldr	r3, .L2165+32
	mov	r2, r0
	ldr	r1, .L2165+164
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2088:
	mov	r0, #30720
	movt	r0, 105
	b	.L2084
.L2085:
	mov	r0, #55296
	movt	r0, 27
	b	.L2084
.L2089:
	mov	r0, #7864320
	b	.L2084
.L2083:
	mov	r0, #17920
	movt	r0, 5
	b	.L2084
.L2081:
	mov	r0, #20992
	movt	r0, 2
	b	.L2084
.L2080:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+168
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2071:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+172
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2162:
	mov	r3, r2
	str	r9, [sp]
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r9]
	cmp	r3, #1
	bne	.L2056
	ldr	r1, .L2165+108
	mov	r2, #64
	ldr	r3, .L2165+32
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r6
	blx	r3
	b	.L2056
.L2063:
	ldr	r3, .L2165+32
	mov	r0, #1
	ldr	r1, .L2165+176
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2158:
	ldr	r3, .L2165+32
	mov	r0, #0
	ldr	r1, .L2165+180
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2139
.L2148:
	ldr	ip, .L2165+32
	mov	r0, r4
	movw	r3, #9977
	ldr	r2, .L2165+184
	ldr	r1, .L2165+188
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2139
.L2166:
	.align	2
.L2165:
	.word	.LC228
	.word	.LC230
	.word	.LC233
	.word	.LC241
	.word	.LC242
	.word	.LC244
	.word	.LC245
	.word	.LC259
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC246
	.word	.LC219
	.word	.LC221
	.word	.LC222
	.word	g_event_report
	.word	.LC223
	.word	.LC224
	.word	.LC225
	.word	.LC227
	.word	.LANCHOR0+80
	.word	.LC166
	.word	.LC232
	.word	.LC234
	.word	.LC249
	.word	.LC250
	.word	.LC251
	.word	.LC252
	.word	.LC257
	.word	.LANCHOR0+112
	.word	.LC220
	.word	.LC229
	.word	.LC253
	.word	.LC254
	.word	.LC255
	.word	.LC256
	.word	.LC258
	.word	.LC226
	.word	.LC235
	.word	.LC236
	.word	.LC237
	.word	.LC238
	.word	.LC240
	.word	.LC243
	.word	.LC248
	.word	.LC239
	.word	.LC231
	.word	.LC247
	.word	.LC20
	.word	.LC21
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r1, r0, #12288
	add	r2, r0, #20480
	mov	lr, #2208
	ldr	r3, [r1, #1304]
	mov	r4, r0
	ldr	r2, [r2, #220]
	add	r0, r0, #13504
	ldr	ip, [r1, #1300]
	mov	r5, #4000
	mov	r1, #32
	add	r0, r0, #24
	mla	r3, lr, r2, r3
	ldr	r6, .L2181
	ldr	r3, [r3, #28]
	mla	r5, r5, r3, ip
	bl	BsGet
	ldr	r1, .L2181+4
	mov	r7, r0
	mov	r0, r4
	bl	u_1
	ldr	r3, [r6, #68]
	ldr	r1, .L2181+8
	mov	r2, r0
	mov	r0, #17
	blx	r3
	mov	r0, r4
	ldr	r2, .L2181+12
	mov	r1, #2
	bl	u_v
	cmp	r0, #1
	beq	.L2177
	ldr	r3, [r5, #748]
	sub	r2, r3, #1
	cmp	r2, #1
	bls	.L2178
.L2170:
	cmp	r3, #1
	beq	.L2179
.L2171:
	ldr	r1, .L2181+16
	mov	r0, r4
	bl	u_1
	cmp	r0, #0
	bne	.L2180
.L2172:
	mov	r0, r4
	ldr	r1, .L2181+20
	bl	u_1
	cmp	r0, #1
	moveq	r0, #0
	beq	.L2169
	ldr	ip, [r5, #748]
	mov	r2, r0
	mov	r3, r7
	ldr	r4, [r6, #68]
	ldr	r1, .L2181+24
	mov	r0, #1
	str	ip, [sp]
	blx	r4
	mov	r0, #0
.L2169:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2180:
	ldr	r1, .L2181+28
	mov	r0, r4
	bl	u_1
	ldr	r3, [r6, #68]
	ldr	r1, .L2181+32
	mov	r2, r0
	mov	r0, #17
	blx	r3
	b	.L2172
.L2179:
	ldr	r2, .L2181+36
	mov	r1, #2
	mov	r0, r4
	bl	u_v
	ldr	r3, [r6, #68]
	ldr	r1, .L2181+40
	mov	r2, r0
	mov	r0, #17
	blx	r3
	b	.L2171
.L2178:
	ldr	r1, .L2181+44
	mov	r0, r4
	bl	u_1
	ldr	r3, [r6, #68]
	ldr	r1, .L2181+48
	mov	r2, r0
	mov	r0, #17
	blx	r3
	ldr	r3, [r5, #748]
	b	.L2170
.L2177:
	ldr	r3, [r6, #68]
	ldr	r1, .L2181+52
	blx	r3
	mvn	r0, #0
	b	.L2169
.L2182:
	.align	2
.L2181:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC260
	.word	.LC261
	.word	.LC262
	.word	.LC268
	.word	.LC271
	.word	.LC272
	.word	.LC269
	.word	.LC270
	.word	.LC266
	.word	.LC267
	.word	.LC264
	.word	.LC265
	.word	.LC263
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
	ldr	r2, .L2218
	mov	r1, #8
	mov	r4, r0
	add	r7, r0, #53248
	bl	u_v
	ldr	r1, .L2218+4
	mov	r8, r0
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2218+8
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2218+12
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2218+16
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2218+20
	mov	r1, #4
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2218+24
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2218+28
	mov	r6, r0
	mov	r0, r4
	bl	ue_v
	ldr	r3, [r7, #3996]
	cmp	r3, #0
	mov	r9, r0
	bne	.L2212
	add	r5, r4, #12288
	ldr	r3, [r5, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L2213
	sub	r3, r8, #66
	mov	r10, r8
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L2188
.L2190:
	.word	.L2189
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2191
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2191
	.word	.L2188
	.word	.L2188
	.word	.L2191
	.word	.L2188
	.word	.L2192
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2191
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2193
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2193
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2188
	.word	.L2193
.L2189:
	ldr	r3, .L2218+32
	mov	r0, #1
	ldr	r1, .L2218+36
	ldr	r3, [r3, #68]
	blx	r3
.L2191:
	cmp	r6, #9
	bls	.L2211
.L2217:
	cmp	r6, #41
	bhi	.L2211
.L2195:
	mov	r2, #4000
	ldr	r3, [r5, #1300]
	mul	r7, r2, r9
	add	r3, r3, r7
	ldrb	r8, [r3, #23]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L2196
	ldr	r3, .L2218+32
	mov	r1, #0
	ldr	r8, .L2218+40
	ldr	r3, [r3, #48]
	add	r0, r8, #2208
	blx	r3
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	add	r1, r8, #2208
	mov	r0, r4
	str	r10, [r8, #2944]
	strb	r3, [r8, #2208]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	str	r6, [r8, #2948]
	str	r9, [r8, #2952]
	strb	r3, [r8, #2209]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	strb	r3, [r8, #2210]
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	strb	r3, [r8, #2211]
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2214
	ldr	r1, [r5, #1300]
	add	r0, r8, #2208
	add	r1, r1, r7
	bl	SPSEqual
	cmp	r0, #0
	bne	.L2215
.L2198:
	cmp	r10, #83
	cmpne	r10, #86
	beq	.L2200
.L2201:
	mov	r0, #0
.L2185:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2211:
	ldr	ip, .L2218+32
	mov	r2, r6
	mov	r3, #41
	ldr	r1, .L2218+44
	mov	r0, #1
	mov	r6, r3
	ldr	r7, [ip, #68]
	blx	r7
	b	.L2195
.L2196:
	str	r10, [r3, #736]
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
	str	r6, [r3, #740]
	ldr	r3, [r5, #1300]
	add	r3, r3, r7
	str	r9, [r3, #744]
	ldr	r1, [r5, #1300]
	add	r1, r1, r7
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2216
	ldr	r3, [r5, #1300]
	mov	r2, #1
	cmp	r10, #83
	cmpne	r10, #86
	add	r3, r3, r7
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r7, r3, r7
	strb	r2, [r7, #23]
	bne	.L2201
.L2200:
	mov	r0, r4
	bl	Sps_SvcExt
	cmp	r0, #0
	beq	.L2201
	ldr	r3, .L2218+32
	mov	r0, #1
	ldr	r1, .L2218+48
	ldr	r3, [r3, #68]
	blx	r3
.L2212:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2213:
	ldr	r3, .L2218+32
	mov	r0, #1
	ldr	r1, .L2218+52
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r2, [r5, #1288]
	sub	r3, r2, #1
	cmp	r9, r3
	bls	.L2212
	ldr	r3, .L2218+56
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2212
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r9, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r7, #4056]
	mov	r1, #109
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2193:
	ldr	r3, .L2218+32
	mov	r0, #1
	ldr	r1, .L2218+60
	ldr	r3, [r3, #68]
	blx	r3
	cmp	r6, #9
	bhi	.L2217
	b	.L2211
.L2192:
	ldr	r3, .L2218+32
	mov	r0, #1
	ldr	r1, .L2218+64
	ldr	r3, [r3, #68]
	blx	r3
	cmp	r6, #9
	bhi	.L2217
	b	.L2211
.L2188:
	ldr	r3, .L2218+32
	mov	r2, r8
	ldr	r1, .L2218+68
	mov	r0, #1
	mov	r10, #100
	ldr	r3, [r3, #68]
	blx	r3
	cmp	r6, #9
	bhi	.L2217
	b	.L2211
.L2215:
	ldr	r3, .L2218+32
	mov	r2, #4000
	ldr	r0, [r5, #1300]
	add	r1, r8, #2208
	ldr	r5, [r3, #56]
	add	r0, r0, r7
	mov	r3, #1
	strb	r3, [r8, #2232]
	strb	r3, [r8, #2231]
	blx	r5
	b	.L2198
.L2214:
	ldr	r3, .L2218+32
	movw	r2, #10607
	ldr	r1, .L2218+72
	mov	r0, #1
	ldr	r4, [r3, #68]
	mov	r3, r9
	blx	r4
	mvn	r0, #0
	b	.L2185
.L2216:
	ldr	ip, .L2218+32
	mov	r3, r9
	movw	r2, #10632
	ldr	r1, .L2218+72
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	ldr	r3, [r5, #1300]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r7, r3, r7
	strb	r8, [r7, #23]
	b	.L2185
.L2219:
	.align	2
.L2218:
	.word	.LC273
	.word	.LC274
	.word	.LC275
	.word	.LC276
	.word	.LC277
	.word	.LC278
	.word	.LC279
	.word	.LC280
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC281
	.word	.LANCHOR2
	.word	.LC285
	.word	.LC287
	.word	.LC172
	.word	g_event_report
	.word	.LC283
	.word	.LC282
	.word	.LC284
	.word	.LC286
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
	beq	.L2229
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #8
	ldr	lr, [r4, #8]
	cmp	lr, #0
	beq	.L2229
	ldr	lr, [ip, #68]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2229
	cmp	lr, r3
	bls	.L2229
	ldr	lr, [r4, #12]
	mov	r6, r2
	ldr	r4, [r4, #24]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2224
	b	.L2222
.L2225:
	ldr	r4, [r2, #24]
	ldr	r2, [r2, #12]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2222
.L2224:
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
	bhi	.L2225
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2222:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #24]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2229:
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
	beq	.L2244
	ldr	r3, [r0, #368]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L2244
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #8]
	cmp	ip, #0
	beq	.L2244
	ldr	ip, [r3, #68]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2244
	cmp	ip, r7
	bls	.L2244
.L2239:
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
	bcs	.L2235
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2246
.L2237:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2247
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	strb	r3, [r4], #1
.L2246:
	ldr	r3, [r0, #368]
	add	r3, r3, r5
	ldr	r1, [r3, #24]
	add	r1, r1, #8
	str	r1, [r3, #24]
	bcc	.L2237
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2247:
	ldr	r3, [r0, #368]
.L2235:
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r7, r7, #1
	add	ip, ip, #1
	strb	ip, [r3]
	ldr	r3, [r0, #368]
	ldr	ip, [r3, #68]
	cmp	ip, r7
	bhi	.L2239
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2244:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetBytes, .-GetBytes
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
	ldr	r1, .L2255
	mov	r5, r0
	bl	ue_v
	add	r4, r5, #24576
	ldr	r2, .L2255+4
	mov	r1, #1
	str	r0, [r4, #1840]
	mov	r0, r5
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r4, #1817]
	cmp	r0, #0
	beq	.L2254
.L2249:
	mov	r0, r5
	ldr	r2, .L2255+8
	mov	r1, #1
	bl	u_v
	mov	r3, #1
	strb	r3, [r4, #1816]
	strb	r0, [r4, #1818]
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2254:
	ldr	r2, .L2255+12
	mov	r1, #7
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+16
	mov	r1, #1
	str	r0, [r4, #1832]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+20
	mov	r1, #6
	strb	r0, [r4, #1819]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+24
	mov	r1, #1
	str	r0, [r4, #1836]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+28
	mov	r1, #1
	strb	r0, [r4, #1820]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+32
	mov	r1, #1
	strb	r0, [r4, #1821]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+36
	mov	r1, #1
	strb	r0, [r4, #1822]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+40
	mov	r1, #1
	strb	r0, [r4, #1823]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+44
	mov	r1, #1
	strb	r0, [r4, #1824]
	mov	r0, r5
	bl	u_v
	ldrb	r3, [r4, #1819]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #1825]
	bne	.L2250
	ldr	r3, [r4, #1832]
	cmp	r3, #5
	beq	.L2250
	ldr	r2, .L2255+48
	mov	r1, #1
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+52
	mov	r1, #1
	strb	r0, [r4, #1826]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+56
	mov	r1, #1
	strb	r0, [r4, #1827]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2255+60
	mov	r1, #1
	strb	r0, [r4, #1828]
	mov	r0, r5
	bl	u_v
	strb	r0, [r4, #1829]
.L2250:
	ldr	r2, .L2255+64
	mov	r1, #8
	mov	r0, r5
	bl	u_v
	ldr	r1, .L2255+68
	str	r0, [r4, #1844]
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #1848]
	b	.L2249
.L2256:
	.align	2
.L2255:
	.word	.LC288
	.word	.LC289
	.word	.LC305
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
	.word	.LC301
	.word	.LC302
	.word	.LC303
	.word	.LC304
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
	ldr	r1, [r2, #2052]
	ldr	r3, [r2, #1300]
	mla	r4, r4, r1, r3
	ldrb	r1, [r4, #23]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2258
	ldr	r0, [r2, #1288]
	cmp	r0, #0
	ble	.L2259
	ldrb	r2, [r3, #23]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #4000
	beq	.L2262
	b	.L2281
.L2263:
	ldrb	r1, [r3, #-3977]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2260
.L2262:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, r0
	add	r3, r3, #4000
	bne	.L2263
.L2259:
	ldr	r3, .L2283
	mov	r0, #1
	ldr	r1, .L2283+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r3, #0
.L2264:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2281:
	mov	r4, r3
.L2260:
	cmp	r4, #0
	beq	.L2259
.L2258:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2265
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2282
	ldr	r1, [r4, #388]
	ldr	r7, [r4, #392]
	add	r1, r1, #1
	add	r7, r7, #1
.L2268:
	ldr	r2, .L2283+8
	mov	r0, r5
	bl	u_v
	add	r6, r5, #24576
	mov	r1, r7
	ldr	r2, .L2283+12
	str	r0, [r6, #1856]
	mov	r0, r5
	bl	u_v
	str	r0, [r6, #1860]
.L2265:
	ldrb	r0, [r4, #39]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2264
	ldr	r2, .L2283+16
	mov	r1, #4
	mov	r0, r5
	add	r5, r5, #24576
	bl	u_v
	mov	r3, #0
	strb	r0, [r5, #1852]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2282:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2265
	ldr	r1, [r4, #700]
	ldr	r7, [r4, #704]
	add	r1, r1, #1
	add	r7, r7, #1
	b	.L2268
.L2284:
	.align	2
.L2283:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC306
	.word	.LC307
	.word	.LC308
	.word	.LC309
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
	ldr	r2, [r0, #368]
	sub	r10, fp, #44
	mov	r3, #0
	add	r6, r0, #13504
	mov	r1, #32
	mov	r7, r0
	add	r6, r6, #24
	add	r4, r0, #12288
	mov	r8, r3
	strb	r3, [r10, #-1]!
	str	r1, [r2, #24]
	b	.L2288
.L2529:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2287
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2528
.L2288:
	mov	r2, #1
	mov	r1, r10
	mov	r0, r7
	bl	GetBytes
	ldr	r3, [r4, #1264]
	ldr	ip, [r4, #1256]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	ble	.L2529
.L2287:
	ldr	r3, .L2561
	mov	r0, #1
	ldr	r1, .L2561+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2290
.L2528:
	mov	r3, #0
	str	r3, [fp, #-68]
.L2472:
	mov	r5, #0
	b	.L2294
.L2531:
	bl	BsSkip
	cmp	r9, #0
	ble	.L2292
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2530
.L2294:
	mov	r2, #1
	mov	r1, r10
	mov	r0, r7
	bl	GetBytes
	ldr	r3, [r4, #1264]
	ldr	ip, [r4, #1256]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r5, r5, r2
	mov	r9, r0
	mov	r0, r6
	ble	.L2531
.L2292:
	ldr	r3, .L2561
	mov	r0, #1
	ldr	r1, .L2561+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
.L2290:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2530:
	cmp	r5, #409600
	bgt	.L2292
	ldr	r3, [r7, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #2
	ldreq	r2, [r3, #52]
	ldreq	r3, [r3, #24]
	ldrne	r2, [r3, #24]
	addeq	r2, r2, r3
	moveq	r2, r2, lsr #3
	cmp	r8, #45
	ldrls	pc, [pc, r8, asl #2]
	b	.L2297
.L2299:
	.word	.L2298
	.word	.L2300
	.word	.L2301
	.word	.L2302
	.word	.L2303
	.word	.L2303
	.word	.L2304
	.word	.L2305
	.word	.L2306
	.word	.L2307
	.word	.L2308
	.word	.L2309
	.word	.L2310
	.word	.L2311
	.word	.L2312
	.word	.L2313
	.word	.L2314
	.word	.L2315
	.word	.L2316
	.word	.L2317
	.word	.L2318
	.word	.L2319
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2297
	.word	.L2320
.L2320:
	mov	r1, r5
	mov	r0, r7
	ldr	r8, [r4, #1264]
	bl	H264_DecFramePackingSEI
	ldr	r0, [r4, #1264]
	mov	r9, r5, asl #3
	rsb	r3, r8, r0
	cmp	r3, r9
	bge	.L2452
	rsb	r3, r3, r9
	str	r3, [fp, #-56]
	cmp	r3, #0
	add	r8, r3, #7
	movge	r8, r3
	ldr	r3, [r4, #1256]
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2454
	add	r2, r0, #8
	mov	r3, r3, asl #3
	cmp	r2, r3
	bgt	.L2454
	mov	r9, #0
	b	.L2455
.L2456:
	add	r2, r0, #8
	cmp	r2, r3
	bgt	.L2454
.L2455:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r9, r9, #1
	ldr	r3, [r4, #1256]
	cmp	r9, r8
	ldr	r0, [r4, #1264]
	mov	r3, r3, asl #3
	bne	.L2456
.L2454:
	ldr	r2, [fp, #-56]
	mov	r1, r2, asr #31
	mov	r1, r1, lsr #29
	add	r2, r2, r1
	and	r2, r2, #7
	rsb	r1, r1, r2
	add	r2, r1, r0
	cmp	r2, r3
	ble	.L2532
.L2452:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	add	r8, r7, #53248
	cmp	r0, #0
	bge	.L2524
	ldr	r3, .L2561
	ldr	r5, [r3, #68]
	movw	r3, #11717
.L2523:
	ldr	r2, .L2561+120
	mov	r0, #20
	ldr	r1, .L2561+124
	blx	r5
	ldr	r3, [r8, #2820]
	cmp	r3, #3
	bls	.L2464
.L2534:
	ldr	r3, .L2561
	mov	r0, #1
	ldr	r1, .L2561+12
	add	r4, r7, #56064
	mov	r6, r8
	mov	r5, #0
	ldr	r3, [r3, #68]
	mov	r7, r4
	blx	r3
	add	r4, r4, #4
	add	r7, r7, #20
.L2466:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L2465
	ldr	r0, [r6, #4056]
	bl	FreeUsdByDec
	str	r5, [r4]
.L2465:
	cmp	r4, r7
	bne	.L2466
.L2467:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2319:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+16
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2533
.L2446:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2449
.L2450:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2449:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2450
.L2522:
	add	r8, r7, #53248
.L2524:
	ldr	r3, [r8, #2820]
.L2323:
	cmp	r3, #3
	bhi	.L2534
.L2464:
	mov	r8, #0
	b	.L2471
.L2469:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2470
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2535
.L2471:
	mov	r2, #1
	mov	r1, r10
	mov	r0, r7
	bl	GetBytes
	ldr	r3, [r4, #1264]
	ldr	ip, [r4, #1256]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	ble	.L2469
.L2470:
	mov	r0, #0
.L2559:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2318:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+20
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2536
.L2441:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2444
.L2445:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2444:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2445
	b	.L2522
.L2317:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+24
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2537
.L2436:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2439
.L2440:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2439:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2440
	b	.L2522
.L2316:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+28
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2538
.L2431:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2434
.L2435:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2434:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2435
	b	.L2522
.L2315:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+32
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2539
.L2426:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2429
.L2430:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2429:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2430
	b	.L2522
.L2314:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+36
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2540
.L2421:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2424
.L2425:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2424:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2425
	b	.L2522
.L2313:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+40
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2541
.L2416:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2419
.L2420:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2419:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2420
	b	.L2522
.L2312:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+44
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2542
.L2411:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2414
.L2415:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2414:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2415
	b	.L2522
.L2311:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+48
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2543
.L2406:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2409
.L2410:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2409:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2410
	b	.L2522
.L2310:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+52
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2544
.L2401:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2404
.L2405:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2404:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2405
	b	.L2522
.L2309:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+56
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2545
.L2396:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2399
.L2400:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2399:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2400
	b	.L2522
.L2308:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+60
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2546
.L2391:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2394
.L2395:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2394:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2395
	b	.L2522
.L2307:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+64
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2547
.L2386:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2389
.L2390:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2389:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2390
	b	.L2522
.L2306:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+68
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2548
.L2381:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2384
.L2385:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2384:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2385
	b	.L2522
.L2305:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+72
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2549
.L2376:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2379
.L2380:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2379:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2380
	b	.L2522
.L2304:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+76
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	cmp	r5, #0
	ble	.L2373
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2373
	mov	r8, #0
	b	.L2374
.L2375:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2373
.L2374:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2375
.L2373:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	bge	.L2522
	ldr	r3, .L2561
	add	r8, r7, #53248
	ldr	r5, [r3, #68]
	movw	r3, #11289
	b	.L2523
.L2303:
	cmp	r8, #4
	beq	.L2345
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bne	.L2345
	ldr	r3, .L2561
	mov	r0, #20
	ldr	ip, .L2561
	ldr	r1, .L2561+80
	ldr	r8, [r3, #68]
	mov	r3, r5
	str	ip, [fp, #-72]
	blx	r8
.L2347:
	add	r8, r7, #53248
	ldr	r9, [r8, #2820]
	cmp	r9, #3
	bhi	.L2550
.L2348:
	ldr	r0, [r8, #4056]
	bl	GetUsd
	add	r3, r9, #14016
	add	r3, r3, #2
	str	r0, [r7, r3, asl #2]
	ldr	r3, [r8, #2820]
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	lr, [r7, r3, asl #2]
	cmp	lr, #0
	beq	.L2467
	ldr	r1, [r7, #368]
	cmp	r5, #1024
	movlt	r3, r5
	movge	r3, #1024
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	ip, [r1, #68]
	str	r3, [fp, #-56]
	cmp	r0, ip
	bcs	.L2475
	sxth	r3, r0
	mov	r9, #0
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r1, r1, r3
.L2351:
	ldr	r3, [r1, #24]
	add	r0, r0, #1
	ldr	r2, [r1, #12]
	cmp	r0, ip
	add	r3, r3, #7
	add	r1, r1, #28
	sub	r3, r2, r3, lsr #3
	add	r9, r9, r3
	bne	.L2351
	mov	r3, r9
.L2350:
	ldr	r1, [fp, #-56]
	ldrsb	r2, [fp, #-68]
	cmp	r1, r3
	movle	r9, r1
	cmp	r2, #1
	movne	r3, #0
	strne	r3, [fp, #-60]
	strne	r3, [fp, #-64]
	beq	.L2551
.L2353:
	ldr	r3, [fp, #-60]
	rsb	r2, r3, r9
	cmp	r2, #0
	ble	.L2552
	ldr	r3, [r8, #2820]
	mov	r0, r7
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r1, [r7, r3, asl #2]
	bl	GetBytes
	subs	r9, r0, #0
	ble	.L2553
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-64]
	rsb	r3, r2, r3
	cmp	r9, r3
	ldr	r3, [r8, #2820]
	bge	.L2359
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r3, [r7, r3, asl #2]
	str	r9, [r3, #1048]
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2360
	mov	r5, #0
	b	.L2361
.L2364:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2360
.L2361:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r9
	bne	.L2364
.L2360:
	ldr	r3, [r8, #2820]
	mov	r2, #8
	ldr	r1, [r7]
	add	r3, r3, #14016
	ldr	ip, .L2561+84
	add	r3, r3, #2
	ldrd	r0, [r1, #48]
	ldr	r3, [r7, r3, asl #2]
	add	r3, r3, #1056
	strd	r0, [r3]
	ldr	r3, [r8, #2820]
	ldr	r5, [ip]
	add	r3, r3, #14016
	add	r3, r3, #2
	cmp	r5, #0
	ldr	r3, [r7, r3, asl #2]
	str	r2, [r3, #1036]
	ldr	r3, [r8, #2820]
	ldr	r2, [r8, #4016]
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r3, [r7, r3, asl #2]
	str	r2, [r3, #1040]
	beq	.L2363
	ldr	r2, [r8, #2820]
	mov	r3, #1072
	mov	r1, #6
	ldr	r0, [r8, #4056]
	add	r2, r2, #14016
	add	r2, r2, #2
	ldr	r2, [r7, r2, asl #2]
	blx	r5
.L2363:
	ldr	r3, [r8, #2820]
	add	r3, r3, #1
	str	r3, [r8, #2820]
	b	.L2323
.L2301:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+88
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2554
.L2335:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2338
.L2339:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2338:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2339
	b	.L2522
.L2300:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+92
	mov	r9, r5, asl #3
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	ldr	r8, [r4, #1264]
	bl	H264_DecPicTimingSEI
	ldr	r0, [r4, #1264]
	rsb	r3, r8, r0
	cmp	r3, r9
	bge	.L2328
	rsb	r3, r3, r9
	str	r3, [fp, #-56]
	cmp	r3, #0
	add	r8, r3, #7
	movge	r8, r3
	ldr	r3, [r4, #1256]
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2330
	add	r2, r0, #8
	mov	r3, r3, asl #3
	cmp	r2, r3
	bgt	.L2330
	mov	r9, #0
	b	.L2331
.L2332:
	add	r2, r0, #8
	cmp	r2, r3
	bgt	.L2330
.L2331:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r9, r9, #1
	ldr	r3, [r4, #1256]
	cmp	r9, r8
	ldr	r0, [r4, #1264]
	mov	r3, r3, asl #3
	bne	.L2332
.L2330:
	ldr	r2, [fp, #-56]
	mov	r1, r2, asr #31
	mov	r1, r1, lsr #29
	add	r2, r2, r1
	and	r2, r2, #7
	rsb	r1, r1, r2
	add	r2, r1, r0
	cmp	r2, r3
	ble	.L2555
.L2328:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	add	r8, r7, #53248
	cmp	r0, #0
	bge	.L2524
	ldr	r3, .L2561
	ldr	r5, [r3, #68]
	movw	r3, #11035
	b	.L2523
.L2302:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+96
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2556
.L2340:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2343
.L2344:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2343:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2344
	b	.L2522
.L2298:
	ldr	r3, .L2561
	mov	r0, #20
	ldr	r1, .L2561+100
	ldr	r8, [r3, #68]
	mov	r3, r5
	blx	r8
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2557
.L2321:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2325
.L2326:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2325:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2326
	b	.L2522
.L2562:
	.align	2
.L2561:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC310
	.word	.LC311
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
	.word	.LC326
	.word	.LC325
	.word	.LC324
	.word	.LC318
	.word	g_event_report
	.word	.LC315
	.word	.LC314
	.word	.LC316
	.word	.LC312
	.word	.LC317
	.word	.LC319
	.word	.LC321
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+216
	.word	.LC313
	.word	.LC320
	.word	.LC322
	.word	.LC323
.L2297:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2558
.L2459:
	cmp	r5, #0
	ble	.L2522
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
	mov	r8, #0
	b	.L2462
.L2463:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2522
.L2462:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2463
	b	.L2522
.L2535:
	cmp	r3, #128
	bne	.L2472
	mov	r0, #0
	b	.L2559
.L2359:
	add	r3, r3, #14016
	ldr	r2, [fp, #-56]
	add	r3, r3, #2
	cmp	r2, r5
	ldr	r2, [fp, #-64]
	ldr	r3, [r7, r3, asl #2]
	rsb	r9, r2, r5
	str	r9, [r3, #1048]
	bcc	.L2560
.L2366:
	cmp	r9, #0
	ble	.L2360
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2360
	mov	r5, #0
	b	.L2368
.L2369:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bgt	.L2360
.L2368:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r9
	bne	.L2369
	b	.L2360
.L2555:
	mov	r0, r6
	bl	BsSkip
	b	.L2328
.L2532:
	mov	r0, r6
	bl	BsSkip
	b	.L2452
.L2560:
	ldr	r3, [fp, #-56]
	mov	r0, r7
	rsb	r1, r3, r5
	bl	PassBytes
	cmp	r0, #0
	bge	.L2366
	ldr	r3, [fp, #-72]
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r5, [r3, #68]
	movw	r3, #11236
	blx	r5
	b	.L2366
.L2550:
	ldr	r1, [r8, #2824]
	ldr	r0, [r8, #4056]
	bl	FreeUsdByDec
	ldr	r1, [r8, #2828]
	ldr	r0, [r8, #4056]
	bl	FreeUsdByDec
	ldr	r1, [r8, #2832]
	ldr	r0, [r8, #4056]
	bl	FreeUsdByDec
	ldr	r1, [r8, #2836]
	ldr	r0, [r8, #4056]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r9, r3
	str	r3, [r8, #2824]
	str	r3, [r8, #2828]
	str	r3, [r8, #2832]
	str	r3, [r8, #2836]
	str	r3, [r8, #2820]
	b	.L2348
.L2345:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	ip, .L2561+116
	ldr	r1, .L2561+104
	ldr	r8, [r3, #68]
	mov	r3, r5
	str	ip, [fp, #-72]
	blx	r8
	mov	r3, #1
	str	r3, [fp, #-68]
	b	.L2347
.L2549:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11301
	blx	r8
	b	.L2376
.L2548:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11327
	blx	r8
	b	.L2381
.L2547:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11353
	blx	r8
	b	.L2386
.L2546:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11379
	blx	r8
	b	.L2391
.L2545:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11405
	blx	r8
	b	.L2396
.L2544:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11431
	blx	r8
	b	.L2401
.L2543:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11457
	blx	r8
	b	.L2406
.L2558:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11729
	blx	r8
	b	.L2459
.L2556:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11073
	blx	r8
	b	.L2340
.L2554:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11047
	blx	r8
	b	.L2335
.L2551:
	strb	r2, [lr, #1064]
	mov	r1, #8
	ldr	r3, [r8, #2820]
	mov	r0, r7
	ldr	r2, .L2561+108
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r3, [r7, r3, asl #2]
	str	r3, [fp, #-60]
	bl	u_v
	ldr	r3, [fp, #-60]
	strb	r0, [r3, #1065]
	ldr	r3, [r8, #2820]
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r3, [r7, r3, asl #2]
	ldrb	r2, [r3, #1065]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L2354
	mov	r2, #3
	str	r2, [fp, #-60]
	mov	r1, r2
	mov	r2, #0
	str	r1, [fp, #-64]
	strb	r2, [r3, #1066]
.L2355:
	ldr	r3, [r8, #2820]
	mov	r1, #16
	ldr	r2, .L2561+112
	mov	r0, r7
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r3, [r7, r3, asl #2]
	str	r3, [fp, #-76]
	bl	u_v
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-60]
	add	r3, r3, #1056
	strh	r0, [r3, #12]	@ movhi
	mov	r0, r7
	bl	PassBytes
	ldr	r3, [fp, #-60]
	cmp	r9, r3
	bne	.L2353
	b	.L2360
.L2557:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #10982
	blx	r8
	b	.L2321
.L2542:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11483
	blx	r8
	b	.L2411
.L2541:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11509
	blx	r8
	b	.L2416
.L2540:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11535
	blx	r8
	b	.L2421
.L2539:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11561
	blx	r8
	b	.L2426
.L2538:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11587
	blx	r8
	b	.L2431
.L2537:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11613
	blx	r8
	b	.L2436
.L2536:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11639
	blx	r8
	b	.L2441
.L2533:
	ldr	r3, .L2561+116
	mov	r0, #20
	ldr	r2, .L2561+120
	ldr	r1, .L2561+124
	ldr	r8, [r3, #68]
	movw	r3, #11665
	blx	r8
	b	.L2446
.L2475:
	mov	r3, #0
	mov	r9, r3
	b	.L2350
.L2354:
	ldr	r2, .L2561+128
	mov	r1, #8
	mov	r0, r7
	str	r3, [fp, #-76]
	mov	r3, #4
	str	r3, [fp, #-60]
	bl	u_v
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-76]
	strb	r0, [r3, #1066]
	b	.L2355
.L2552:
	ldr	r3, [fp, #-72]
	mov	r0, #1
	ldr	r1, .L2561+132
	mov	r4, r8
	ldr	r3, [r3, #68]
	blx	r3
.L2525:
	ldr	r3, [r4, #2820]
	ldr	r0, [r4, #4056]
	add	r3, r3, #14016
	add	r3, r3, #2
	ldr	r1, [r7, r3, asl #2]
	bl	FreeUsdByDec
	ldr	r3, [r4, #2820]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #14016
	add	r3, r3, #2
	str	r2, [r7, r3, asl #2]
	b	.L2290
.L2553:
	ldr	r3, [fp, #-72]
	mov	r0, #1
	ldr	r1, .L2561+136
	mov	r4, r8
	ldr	r3, [r3, #68]
	blx	r3
	b	.L2525
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
	str	r3, [r0, #1872]
	strb	r2, [r0, #1857]
	mov	r3, #32
	mov	r2, #7
	strb	r3, [r0, #1858]
	str	r2, [r0, #1868]
	mvn	r3, #0
	mov	r2, #3
	str	r3, [r0, #1884]
	str	r2, [r0, #1880]
	mov	r3, #0
	mov	r2, #262144
	str	r1, [r0, #1864]
	str	r2, [r0, #1896]
	strb	r3, [r0, #1856]
	str	r3, [r0, #1888]
	str	r3, [r0, #1892]
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
	b	.L2572
.L2567:
	.word	.L2566
	.word	.L2572
	.word	.L2572
	.word	.L2572
	.word	.L2566
	.word	.L2572
	.word	.L2568
	.word	.L2568
.L2568:
	ldr	r0, [r0]
	mov	r3, #1
	str	r3, [r5]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2566:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L2569
.L2571:
	mvn	r0, #0
.L2570:
	mov	r3, #0
	str	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2572:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2569:
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
	bhi	.L2571
	mov	r0, r0, asl #1
	rsb	r0, r0, #31
	mov	r0, r4, lsr r0
	subs	r0, r0, #1
	mvnne	r0, #0
	b	.L2570
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
	ble	.L2599
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2587
	ldr	r5, .L2600
	ldr	r10, .L2600+4
.L2585:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2600
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
	bne	.L2577
	ldr	r2, .L2600
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2580
	b	.L2578
.L2581:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2578
.L2580:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2581
.L2577:
	mov	r0, r4, asl #3
.L2576:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2589
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2589
.L2584:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2582
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2584
	b	.L2582
.L2578:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2585
	b	.L2577
.L2589:
	mov	r3, #0
.L2582:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2599:
	ldr	r3, .L2600+4
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L2600+8
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2587:
	mov	r0, r4
	b	.L2576
.L2601:
	.align	2
.L2600:
	.word	.LANCHOR3-1976
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC341
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
	beq	.L2608
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2607
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #36]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #40]
	cmp	r0, r2, asl #3
	bcs	.L2611
	cmn	r0, #1
	beq	.L2607
.L2606:
	add	r0, r0, #1
	str	r0, [r3, #72]
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2610
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #72]
	cmp	r2, r1, asl #3
	bcs	.L2612
.L2610:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2612:
	add	r2, r4, #53248
	ldr	r1, [r3, #60]
	ldr	r0, [r2, #4056]
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
.L2611:
	add	r2, r4, #53248
	ldr	r1, [r3, #60]
	ldr	r0, [r2, #4056]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #36]
	ldr	r3, [r4, #368]
	str	r2, [r3, #68]
	ldr	r3, [r4, #368]
.L2607:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	b	.L2606
.L2608:
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
	ldr	r3, [r3, #12]
	cmp	r3, #4096
	ldmcsfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CombinePacket.part.10
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
	beq	.L2620
	mov	r2, ip
	mov	r3, #1
	b	.L2618
.L2617:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2623
.L2618:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L2617
	mov	r0, r3
.L2616:
	mov	r2, r3, asl #7
	mov	r1, #1
	sub	r3, r2, r3, asl #5
	add	ip, ip, r3
	strb	r1, [ip, #377]
	ldmfd	sp, {fp, sp, pc}
.L2623:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2620:
	mov	r3, r0
	b	.L2616
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
	add	r3, r4, #53248
	ldreqb	r0, [r3, #2168]	@ zero_extendqisi2
	beq	.L2626
	ubfx	lr, r0, #16, #6
	ubfx	ip, r0, #15, #1
	ubfx	r1, r0, #12, #3
	strb	lr, [r3, #2169]
	strb	ip, [r3, #2170]
	ubfx	lr, r0, #8, #4
	ubfx	ip, r0, #5, #3
	strb	r1, [r3, #2171]
	strb	lr, [r3, #2172]
	ubfx	r1, r0, #4, #1
	ubfx	lr, r0, #3, #1
	strb	ip, [r3, #2173]
	strb	r1, [r3, #2174]
	ubfx	ip, r0, #2, #1
	and	r1, r0, #3
	strb	lr, [r3, #2175]
	ubfx	r0, r0, #22, #1
	strb	ip, [r3, #2176]
	strb	r1, [r3, #2177]
	strb	r0, [r3, #2168]
.L2626:
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r6, r0, #53248
	ldr	r10, .L2648
	mov	r4, r0
	mov	r9, r1
	ldr	r3, [r6, #4000]
	mov	r5, r2
	ldr	r1, .L2648+4
	mov	r0, #22
	sub	r2, r3, #1
	ldr	r3, [r10, #68]
	blx	r3
	mov	r3, #0
	str	r3, [r5]
	add	r8, r4, #20480
	str	r3, [r9]
	mov	r0, r4
	ldr	r3, [r4, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r8, #211]
	ldr	r3, [r3, #76]
	str	r3, [r8, #240]
	bl	SliceCheck
	subs	r7, r0, #0
	bne	.L2636
	mov	r0, r4
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L2647
	ldrb	r0, [r8, #213]	@ zero_extendqisi2
	add	r2, r4, #12288
	mov	r1, #2208
	mov	lr, #4000
	sub	r0, r0, #1
	add	r4, r4, #24576
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r9]
	ldr	ip, [r2, #1304]
	ldr	r0, [r8, #220]
	ldr	r3, [r2, #1300]
	mla	r1, r1, r0, ip
	ldr	r0, [r2, #1276]
	ldr	ip, [r2, #1280]
	ldr	r2, [r1, #28]
	mla	r3, lr, r2, r3
	ldrb	r1, [r3, #18]	@ zero_extendqisi2
	ldr	lr, [r3, #3960]
	rsb	r2, r1, #2
	ldr	r1, [r3, #3956]
	mla	r2, lr, r2, r2
	add	r1, r1, #1
	cmp	r0, r1
	cmpeq	ip, r2
	beq	.L2631
	mov	r2, #1
	str	r2, [r5]
	ldr	r2, [r4, #2056]
	ldr	r1, [r3, #3980]
	add	r3, r2, #1
	cmp	r1, r3
	bls	.L2633
.L2632:
	mov	r3, #1
	str	r3, [r5]
.L2633:
	ldr	r3, [r6, #4020]
	cmp	r3, #0
	cmpne	r0, #0
	beq	.L2629
	ldr	r3, .L2648+8
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2629
	mov	r3, #0
	ldr	r0, [r6, #4056]
	mov	r2, r3
	mov	r1, #120
	blx	r4
.L2629:
	mov	r0, r7
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2631:
	ldr	r2, [r3, #3980]
	ldr	r3, [r4, #2056]
	add	r3, r3, #1
	cmp	r2, r3
	bhi	.L2632
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L2633
	mov	r0, r7
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2636:
	mvn	r7, #0
	b	.L2629
.L2647:
	ldr	r3, [r10, #68]
	mov	r0, #1
	ldr	r1, .L2648+12
	mvn	r7, #0
	blx	r3
	b	.L2629
.L2649:
	.align	2
.L2648:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC342
	.word	g_event_report
	.word	.LC343
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
	add	r0, r0, #53248
	ldr	r0, [r0, #3980]
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
	ldr	r3, [r6, #252]
	cmp	r3, #0
	beq	.L2652
	add	r5, r0, #26880
	add	r8, r0, #53248
	add	r5, r5, #160
	mov	r4, #0
	b	.L2656
.L2653:
	ldr	r3, [r0, #520]
	cmp	r3, #0
	beq	.L2655
	ldr	r3, [r6, #252]
	cmp	r4, r3
	bcs	.L2678
.L2656:
	ldr	r3, [r5, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #4056]
	ldr	r3, [r3, #4]
	ldr	r1, [r3, #620]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2653
.L2655:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2678:
	cmp	r3, #0
	beq	.L2652
	ldr	r3, [r6, #256]
	cmp	r3, #0
	addne	r7, r7, #27136
	movne	r4, #0
	addne	r7, r7, #36
	bne	.L2659
	b	.L2652
.L2679:
	ldr	r3, [r0, #520]
	cmp	r3, #0
	beq	.L2655
	ldr	r3, [r6, #256]
	cmp	r4, r3
	bcs	.L2652
.L2659:
	ldr	r3, [r7, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #4056]
	ldr	r3, [r3, #4]
	ldr	r1, [r3, #620]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2679
	b	.L2655
.L2652:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	IsRefListWrong, .-IsRefListWrong
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
	add	r6, r0, #53248
	mov	r8, r0
	bl	H264_ClearCurrPic
	mov	r0, r8
	bl	ClearAllNal
	ldr	r3, [r6, #3992]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r6, #3992]
	ldr	r3, [r6, #2820]
	cmp	r3, #0
	beq	.L2682
	add	r5, r8, #56064
	mov	r4, #0
	add	r5, r5, #4
	mov	r7, r4
.L2684:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L2683
	ldr	r0, [r6, #4056]
	bl	FreeUsdByDec
	str	r7, [r5]
.L2683:
	ldr	r3, [r6, #2820]
	cmp	r3, r4
	bhi	.L2684
.L2682:
	add	r5, r8, #27392
	add	r8, r8, #54272
	add	r5, r5, #152
	add	r8, r8, #152
	mov	r7, #0
.L2688:
	sub	r4, r5, #16
.L2686:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L2685
	ldr	r0, [r6, #4056]
	bl	FreeUsdByDec
	str	r7, [r4]
.L2685:
	cmp	r4, r5
	bne	.L2686
	add	r5, r4, #672
	cmp	r5, r8
	bne	.L2688
	ldr	r3, .L2700
	mov	r0, #2
	ldr	r1, .L2700+4
	ldr	r3, [r3, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L2701:
	.align	2
.L2700:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC344
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
	ldr	r3, .L2712
	add	r6, r0, #53248
	mov	r8, r1
	mov	r0, #2
	ldr	r1, .L2712+4
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [r6, #4056]
	mov	r1, r8
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L2707
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	beq	.L2707
	add	r4, r0, #216
	add	r5, r0, #232
	mov	r7, #0
.L2705:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L2704
	ldr	r0, [r6, #4056]
	bl	FreeUsdByDec
	str	r7, [r4]
.L2704:
	cmp	r4, r5
	bne	.L2705
	ldr	r0, [r6, #4056]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2707:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2713:
	.align	2
.L2712:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC345
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
	moveq	ip, #1
	movne	ip, #0
	mov	r5, r1
	beq	.L2753
	ldr	r3, [r0]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L2717
	add	r3, r0, #53248
	ldr	r2, [r3, #3984]
	cmp	r2, #2
	beq	.L2717
	ldr	r2, [r3, #2160]
	cmp	r2, #0
	strneb	ip, [r2, #1]
	movne	r0, #1
	strne	ip, [r3, #2160]
	beq	.L2719
.L2716:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2717:
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	cmn	r0, #3
	beq	.L2719
	add	r6, r4, #53248
	ldr	r1, [r6, #2160]
	cmp	r1, #0
	beq	.L2720
	mov	r0, r4
	bl	GetImagePara
	ldr	r1, [r6, #2160]
	mov	r0, r4
	bl	CheckFrameStore
	subs	r3, r0, #0
	beq	.L2754
	cmn	r3, #3
	beq	.L2727
	ldr	ip, .L2762
	mov	r2, #2048
	ldr	r1, .L2762+4
	mov	r0, #1
	ldr	r8, [ip, #68]
	blx	r8
	ldr	r3, [r6, #2160]
	mov	r0, r4
	ldr	r1, [r3, #204]
	bl	H264DEC_RecycleImage
.L2727:
	ldr	r3, [r6, #2160]
	mov	r0, #0
	strb	r0, [r3, #1]
	ldr	r3, [r6, #2160]
	str	r0, [r6, #2160]
	cmp	r5, r3
	beq	.L2716
.L2720:
	mov	r1, r5
	mov	r0, r4
	bl	GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	subs	r3, r0, #0
	beq	.L2755
	cmn	r3, #3
	beq	.L2719
	ldr	ip, .L2762
	movw	r2, #2106
	ldr	r1, .L2762+4
	mov	r0, #1
	ldr	r6, [ip, #68]
	blx	r6
	ldr	r1, [r5, #204]
	mov	r0, r4
	bl	H264DEC_RecycleImage
	mov	r0, #2
	b	.L2716
.L2753:
	ldr	ip, .L2762
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L2762+8
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2719:
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2755:
	mov	r2, #1
	ldr	r1, [r5, #620]
	ldr	r0, [r6, #4056]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #620]
	ldr	r0, [r6, #4056]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2756
	cmp	r7, #1
	add	r3, r4, #8
	streq	r7, [r8, #244]
	mov	r2, r4
	ldr	r0, [r6, #4056]
	mov	r1, #0
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2757
	ldr	r3, [r4]
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #84]
	bcs	.L2758
.L2734:
	ldr	r2, [r6, #4084]
	mov	r0, #0
	ldr	r3, [r6, #4076]
	add	r2, r2, #1
	str	r2, [r6, #4084]
	add	r3, r3, #2
	str	r3, [r6, #4076]
	b	.L2716
.L2754:
	ldr	r3, [r6, #2160]
	mov	r2, #1
	ldr	r0, [r6, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetDisplay
	ldr	r3, [r6, #2160]
	ldr	r0, [r6, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2759
	ldr	r3, [r6, #2160]
	mov	r2, r4
	mov	r1, #0
	cmp	r5, r3
	cmpeq	r7, #1
	moveq	r3, #1
	streq	r3, [r8, #244]
	add	r3, r4, #8
	ldr	r0, [r6, #4056]
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2760
	ldr	r3, [r4]
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #84]
	bcs	.L2761
.L2726:
	ldr	r2, [r6, #4084]
	ldr	r3, [r6, #4076]
	add	r2, r2, #1
	str	r2, [r6, #4084]
	add	r3, r3, #2
	str	r3, [r6, #4076]
	b	.L2727
.L2758:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.2
	b	.L2734
.L2761:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.2
	b	.L2726
.L2757:
	ldr	r3, .L2762
	mov	r2, r0
	ldr	r1, .L2762+12
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r1, [r5, #620]
	ldr	r0, [r6, #4056]
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2716
.L2760:
	ldr	r3, .L2762
	mov	r2, r0
	ldr	r1, .L2762+12
	mov	r0, #0
	mov	r5, r0
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r6, #2160]
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r3, [r6, #2160]
	ldr	r0, [r6, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetDisplay
	str	r5, [r6, #2160]
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2716
.L2756:
	ldr	r3, .L2762
	movw	r2, #2076
	ldr	r1, .L2762+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2716
.L2759:
	ldr	r3, .L2762
	movw	r2, #2019
	ldr	r1, .L2762+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2716
.L2763:
	.align	2
.L2762:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC349
	.word	.LC346
	.word	.LC348
	.word	.LC350
	.word	.LC347
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
	add	r4, r0, r1, lsl #2
	mov	r5, r1
	add	r4, r4, #24576
	mov	r3, #0
	mov	r2, r3
	mov	r6, r0
	ldr	r1, [r4, #1864]
	strb	r3, [r1, #4]
	ldr	r1, [r4, #1864]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1864]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r5, #15
	cmpls	r3, #0
	mov	r7, r0
	beq	.L2766
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2766:
	mov	r0, r6
	mov	r1, r5
	bl	RemoveFrameStoreOutDPB.part.1
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
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
	ldr	r3, [r6, #2060]
	cmp	r3, #0
	beq	.L2769
	add	r7, r0, #26368
	mov	r5, #0
	add	r7, r7, #68
	b	.L2771
.L2770:
	ldr	r3, [r6, #2060]
	cmp	r3, r5
	bls	.L2769
.L2771:
	ldr	r1, [r7, #4]!
	add	r5, r5, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2770
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r6, #2060]
	cmp	r3, r5
	bhi	.L2771
.L2769:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L2773
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2769
	b	.L2773
.L2775:
	bl	GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	OutputFrmFromDPB
	cmn	r0, #1
	beq	.L2774
.L2773:
	ldr	r3, [r6, #2060]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L2775
	mov	r0, r3
.L2774:
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
	add	r8, r0, #54016
	add	r2, r0, #26368
	ldr	r4, [r3, #1468]
	add	r8, r8, #176
	mov	r6, r0
	str	r3, [fp, #-56]
	add	r7, r4, #2000
	add	r4, r4, #4
	add	r7, r7, #4
	add	r3, r2, #132
	str	r3, [fp, #-52]
	add	r3, r0, #16384
	str	r3, [fp, #-48]
.L2796:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L2784
.L2786:
	.word	.L2785
	.word	.L2787
	.word	.L2788
	.word	.L2789
	.word	.L2790
	.word	.L2791
	.word	.L2792
.L2792:
	ldr	r2, [r4, #12]
	mov	r1, r8
	mov	r0, r6
	bl	MarkCurrPicLT
.L2784:
	add	r4, r4, #20
	cmp	r4, r7
	bne	.L2796
.L2785:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #3444]
	cmp	r3, #1
	movne	r0, #0
	beq	.L2805
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2791:
	add	r9, r6, #24576
	ldr	r3, [r9, #2064]
	cmp	r3, #0
	ldrne	r10, [fp, #-52]
	movne	r5, #0
	beq	.L2795
.L2794:
	ldr	r1, [r10, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r9, #2064]
	add	r5, r5, #1
	cmp	r5, r3
	bcc	.L2794
.L2795:
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
	b	.L2784
.L2790:
	mov	r0, r6
	ldr	r1, [r4, #16]
	bl	UpdateMaxLTFrmIdx
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2784
.L2789:
	ldr	r3, [r4, #12]
	mov	r1, r8
	ldr	r2, [r4, #4]
	mov	r0, r6
	bl	MarkSTToLTRef
	mov	r0, r6
	bl	UpdateReflist
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2784
.L2788:
	mov	r0, r6
	ldr	r2, [r4, #8]
	mov	r1, r8
	bl	UnMarkLTRef
	mov	r0, r6
	bl	UpdateLTReflist
	b	.L2784
.L2787:
	mov	r0, r6
	ldr	r2, [r4, #4]
	mov	r1, r8
	bl	UnMarkSTRef
	mov	r0, r6
	bl	UpdateReflist
	b	.L2784
.L2805:
	ldr	r1, [fp, #-56]
	mov	r3, #0
	ldrb	r2, [r1, #947]	@ zero_extendqisi2
	str	r3, [r1, #1472]
	cmp	r2, #1
	beq	.L2799
	bcc	.L2800
	cmp	r2, #2
	bne	.L2798
	ldr	r2, [fp, #-56]
	str	r3, [r2, #1496]
	str	r3, [r2, #1484]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #3456]
	str	r3, [r2, #3464]
.L2798:
	mov	r0, r6
	bl	FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2800:
	ldr	r0, [fp, #-56]
	ldr	r1, [r0, #1484]
	ldr	r2, [r0, #1492]
	ldr	r3, [r0, #1496]
	rsb	r2, r1, r2
	str	r2, [r0, #1492]
	rsb	r3, r1, r3
	str	r3, [r0, #1496]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r0, #1488]
	str	r3, [r0, #1484]
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
	b	.L2798
.L2799:
	ldr	r2, [fp, #-56]
	str	r3, [r2, #1492]
	str	r3, [r2, #1484]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #3452]
	str	r3, [r2, #3464]
	b	.L2798
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
	add	r6, r0, #53248
	str	r0, [fp, #-48]
	ldr	r3, [r6, #1468]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2807
	add	r10, r0, #24576
	ldr	r3, [r10, #2060]
	cmp	r3, #0
	beq	.L2814
	ldr	r3, [fp, #-48]
	mov	r9, #0
	mov	r4, r9
	add	r5, r3, #26368
	mov	r8, r5
	mov	r7, r5
	add	r8, r8, #132
	add	r5, r5, #72
	add	r7, r7, #196
.L2813:
	ldr	r1, [r5]
	mov	r2, #0
	add	r9, r9, #1
	ldr	r0, [r1, #640]
	cmp	r0, #1
	streq	r0, [r6, #2808]
	strb	r4, [r1, #514]
	strb	r4, [r1, #513]
	ldr	r1, [r5]
	strb	r4, [r1, #550]
	strb	r4, [r1, #549]
	ldr	r1, [r5]
	strb	r4, [r1, #586]
	strb	r4, [r1, #585]
	ldr	r1, [r5]
	strb	r4, [r1, #2]
	ldr	r1, [r5]
	ldr	r0, [r6, #4056]
	ldr	r1, [r1, #620]
	bl	FSP_SetRef
	ldr	r2, [r5]
	mov	r3, #1
	strb	r4, [r2, #1]
	ldr	r2, [r5]
	strb	r4, [r2, #4]
	ldr	r2, [r5]
	str	r3, [r2, #644]
	ldr	r1, [r5]
	ldr	r3, [fp, #-48]
	ldr	r2, [r1, #664]
	add	r2, r2, #6656
	add	r2, r2, #6
	add	r2, r3, r2, lsl #2
	str	r4, [r2, #4]
	ldr	r1, [r1, #620]
	ldr	r0, [r6, #4056]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L2812
	ldr	r1, [r5]
	ldr	r0, [r6, #4056]
	ldr	r1, [r1, #620]
	bl	FSP_SetDisplay
.L2812:
	str	r4, [r5], #4
	str	r4, [r8, #4]!
	str	r4, [r7, #4]!
	ldr	r2, [r10, #2060]
	cmp	r2, r9
	bhi	.L2813
.L2814:
	mov	r3, #0
	str	r3, [r10, #2060]
	ldr	r1, [r6, #2796]
	cmp	r1, r3
	beq	.L2810
	ldr	r2, [fp, #-48]
	mov	r0, r3
	add	r2, r2, #55808
	add	r2, r2, #160
.L2817:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2817
.L2810:
	ldr	r4, [fp, #-48]
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	r3, [r6, #1468]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2827
	str	r3, [r10, #2072]
	mov	r0, r3
	strb	r3, [r6, #948]
	mov	r3, #1
	strb	r3, [r6, #949]
.L2818:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2827:
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r10, #2072]
	strb	r2, [r6, #948]
	str	r3, [r6, #1476]
	strb	r3, [r6, #949]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2807:
	bl	FlushDPB
	cmp	r0, #0
	ldreq	r3, [fp, #-48]
	addeq	r10, r3, #24576
	beq	.L2810
.L2819:
	mvn	r0, #0
	b	.L2818
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
	ldrb	r3, [r4, #947]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r6, #3448]
	ldrb	r3, [r4, #950]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L2829
	ldr	r3, [r4, #1500]
	cmp	r3, #0
	bne	.L2830
	ldr	r3, [r0]
	ldr	r2, [r3, #708]
	cmp	r2, #1
	beq	.L2854
.L2830:
	ldr	r3, [r4, #1468]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #1480]
	beq	.L2855
	cmp	r3, #0
	bne	.L2856
.L2837:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2855:
	cmp	r3, #0
	beq	.L2837
.L2836:
	ldrb	r2, [r4, #945]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2841
	add	r2, r5, #24576
	ldr	r1, [r6, #1164]
	ldr	ip, [r2, #2068]
	ldr	r0, [r2, #2064]
	rsb	r2, ip, r1
	cmp	r0, r2
	beq	.L2857
.L2842:
	mov	r2, #0
	strb	r2, [r4, #948]
.L2839:
	cmp	r3, #0
	beq	.L2837
.L2841:
	ldrb	r3, [r4, #948]	@ zero_extendqisi2
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #949]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2854:
	ldr	r2, [r3, #704]
	cmp	r2, #0
	bne	.L2830
	ldr	r2, [r3, #712]
	cmp	r2, #0
	bne	.L2830
	ldr	r3, [r3, #684]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L2830
.L2829:
	mov	r0, r5
	bl	IDRMemMarking
	cmp	r0, #0
	bne	.L2831
.L2838:
	ldrb	r3, [r4, #950]	@ zero_extendqisi2
	cmp	r3, #5
	ldreq	r3, [r4, #1480]
	beq	.L2839
	ldr	r3, [r4, #1480]
	cmp	r3, #0
	beq	.L2837
	ldr	r2, [r4, #1468]
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2836
	b	.L2841
.L2856:
	mov	r0, r5
	bl	AdaptiveMemMark
	cmp	r0, #0
	beq	.L2838
.L2831:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2857:
	mov	r0, r5
	bl	SlidingWinMark.part.3
	ldr	r3, [r4, #1480]
	b	.L2842
	UNWIND(.fnend)
	.size	Marking, .-Marking
	.align	2
	.global	DirectOutput
	.type	DirectOutput, %function
DirectOutput:
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
	add	r4, r0, #53248
	mov	r5, r0
	ldrb	r6, [r4, #947]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L2860
	bcc	.L2861
	cmp	r6, #2
	beq	.L2862
	mov	r6, #0
.L2859:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2862:
	ldr	r3, [r4, #1464]
	mov	r2, #3
	strb	r2, [r3, #512]
	ldrb	r2, [r4, #945]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2881
	ldr	r1, [r4, #2160]
	cmp	r1, #0
	beq	.L2882
	bl	OutputFrmToVO
	subs	r6, r0, #0
	bne	.L2949
.L2883:
	ldr	r3, [r4, #1464]
	str	r3, [r4, #2160]
	str	r3, [r3, #588]
.L2884:
	ldr	r3, [r4, #2160]
	mov	r8, #2
	ldrb	r0, [r4, #946]	@ zero_extendqisi2
	mov	r7, #0
	mov	r2, #504
	add	r1, r4, #960
	strb	r0, [r3]
	ldr	r3, [r4, #2160]
	strb	r8, [r3, #1]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #4]
	ldr	r3, [r4, #2160]
	str	r7, [r3, #644]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #2]
	ldr	r3, [r4, #2160]
	ldr	r0, [r4, #1500]
	str	r0, [r3, #652]
	ldr	r3, [r4, #2160]
	str	r7, [r3, #648]
	ldr	r0, [r4, #2160]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #2160]
	ldr	r2, [r4, #1508]
	str	r2, [r3, #604]
	ldr	r3, [r4, #2160]
	ldr	r2, [r3, #604]
	str	r2, [r3, #532]
	str	r2, [r3, #656]
	ldr	r3, [r4, #2160]
	strb	r8, [r3, #584]
	ldrb	r2, [r4, #951]	@ zero_extendqisi2
	ldr	r3, [r4, #2160]
	cmp	r2, #1
	moveq	r2, r8
	movne	r2, r7
	strb	r2, [r3, #3]
	ldr	r8, [r4, #3988]
	cmp	r8, #1
	bne	.L2859
.L2944:
	ldr	r3, [r4, #2160]
	mov	r2, r7
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetRef
	mov	r2, r7
	mov	r0, r5
	ldr	r1, [r4, #2160]
	bl	OutputFrmToVO
	ldr	r3, [r4, #2160]
	cmp	r3, r7
	mov	r6, r0
	beq	.L2894
	ldr	r3, [r4, #1464]
	mov	r2, r8
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_ClearLogicFs
	b	.L2894
.L2861:
	ldr	r3, [r4, #1464]
	mov	r2, #0
	strb	r2, [r3, #512]
	ldr	r1, [r4, #2160]
	cmp	r1, r2
	beq	.L2863
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L2950
.L2864:
	ldr	r3, [r4, #2160]
	cmp	r3, #0
	beq	.L2863
	ldr	r3, [r4, #1464]
	mov	r2, #1
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_ClearLogicFs
.L2863:
	ldr	r3, [r4, #1464]
	mov	r0, #3
	mov	r7, #0
	mov	r2, #504
	add	r1, r4, #960
	str	r3, [r4, #2160]
	str	r3, [r3, #516]
	ldr	r3, [r4, #2160]
	ldr	ip, [r4, #1464]
	str	ip, [r3, #552]
	ldr	r3, [r4, #2160]
	ldr	ip, [r4, #1464]
	str	ip, [r3, #588]
	ldrb	ip, [r4, #946]	@ zero_extendqisi2
	ldr	r3, [r4, #2160]
	strb	ip, [r3]
	ldr	r3, [r4, #2160]
	strb	r0, [r3, #1]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #2]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #4]
	ldr	r3, [r4, #2160]
	str	r7, [r3, #644]
	ldr	r0, [r4, #2160]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #2160]
	ldr	r1, [r4, #1508]
	mov	r2, r7
	str	r1, [r3, #532]
	str	r1, [r3, #656]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #512]
	ldr	r3, [r4, #2160]
	ldr	r1, [r4, #1500]
	str	r1, [r3, #652]
	ldr	r3, [r4, #2160]
	ldrb	r1, [r4, #953]	@ zero_extendqisi2
	str	r1, [r3, #648]
	ldrb	r1, [r4, #951]	@ zero_extendqisi2
	ldr	r3, [r4, #2160]
	cmp	r1, #1
	moveq	r6, #3
	strb	r6, [r3, #3]
	ldr	r3, [r4, #2160]
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetRef
	mov	r2, r7
	mov	r0, r5
	ldr	r1, [r4, #2160]
	bl	OutputFrmToVO
	ldr	r3, [r4, #2160]
	cmp	r3, r7
	mov	r6, r0
	beq	.L2894
.L2942:
	ldr	r3, [r4, #1464]
	mov	r2, #1
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_ClearLogicFs
.L2894:
	mov	r3, #0
	mov	r0, r6
	str	r3, [r4, #2160]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2860:
	ldr	r3, [r4, #1464]
	mov	r2, #3
	strb	r2, [r3, #512]
	ldrb	r2, [r4, #945]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2868
	ldr	r1, [r4, #2160]
	cmp	r1, #0
	beq	.L2869
	bl	OutputFrmToVO
	subs	r6, r0, #0
	bne	.L2951
.L2870:
	ldr	r3, [r4, #1464]
	str	r3, [r4, #2160]
	str	r3, [r3, #552]
.L2871:
	ldr	r3, [r4, #2160]
	mov	r8, #1
	ldrb	r0, [r4, #946]	@ zero_extendqisi2
	mov	r7, #0
	mov	r2, #504
	add	r1, r4, #960
	strb	r0, [r3]
	ldr	r3, [r4, #2160]
	strb	r8, [r3, #1]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #4]
	ldr	r3, [r4, #2160]
	str	r7, [r3, #644]
	ldr	r3, [r4, #2160]
	strb	r7, [r3, #2]
	ldr	r3, [r4, #2160]
	ldr	r0, [r4, #1500]
	str	r0, [r3, #652]
	ldr	r3, [r4, #2160]
	str	r7, [r3, #648]
	ldr	r0, [r4, #2160]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #2160]
	ldr	r2, [r4, #1508]
	str	r2, [r3, #568]
	ldr	r3, [r4, #2160]
	ldr	r2, [r3, #568]
	str	r2, [r3, #532]
	str	r2, [r3, #656]
	ldr	r3, [r4, #2160]
	strb	r8, [r3, #548]
	ldrb	r3, [r4, #951]	@ zero_extendqisi2
	ldr	r2, [r4, #2160]
	rsb	r3, r8, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #3]
	ldr	r8, [r4, #3988]
	cmp	r8, #1
	beq	.L2944
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2881:
	ldr	ip, [r4, #2160]
	mov	r2, #504
	add	r1, r4, #960
	cmp	ip, #0
	ldreq	r3, [r4, #1464]
	streq	r3, [r4, #2160]
	streq	r3, [r3, #588]
	ldreq	ip, [r4, #2160]
	add	r0, ip, #8
	ldrd	r6, [ip, #24]
	ldr	r3, [ip, #16]
	ldr	r10, [ip, #20]
	strd	r6, [fp, #-52]
	ldrd	r6, [ip, #32]
	ldr	r9, [ip, #76]
	ldr	r8, [ip, #80]
	strd	r6, [fp, #-60]
	str	r3, [fp, #-64]
	ldr	r7, [ip, #84]
	ldr	r6, [ip, #88]
	bl	memcpy
	add	r2, r5, #54016
	ldr	r3, [fp, #-64]
	add	r2, r2, #208
	ldr	r0, [r2, #-8]
	and	r1, r3, r10
	ldr	r2, [r2, #-4]
	and	r0, r0, r2
	adds	r2, r1, #1
	movne	r2, #1
	cmn	r0, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #2160]
	strne	r3, [r2, #16]
	movw	r3, #54224
	strne	r10, [r2, #20]
	ldrd	r0, [r5, r3]
	ldrd	r2, [fp, #-52]
	ldr	ip, [r4, #2160]
	cmp	r1, r3
	cmpeq	r0, r2
	movhi	r1, r3
	add	r3, r5, #54016
	add	r3, r3, #224
	movhi	r0, r2
	strd	r0, [ip, #24]
	ldrd	r0, [fp, #-60]
	ldrd	r2, [r3, #-8]
	ldr	ip, [r4, #2160]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	strd	r2, [ip, #32]
	mov	ip, #2
	ldr	r3, [r4, #1028]
	mov	r0, #3
	ldr	r2, [r4, #2160]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #76]
	ldr	r3, [r4, #1032]
	ldr	r2, [r4, #2160]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #80]
	ldr	r3, [r4, #1036]
	ldr	r2, [r4, #2160]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #84]
	ldr	r3, [r4, #1040]
	ldr	r2, [r4, #2160]
	cmp	r3, r6
	movcs	r3, r6
	str	r3, [r2, #88]
	ldr	r2, [r4, #2160]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #946]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #2160]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #2160]
	ldr	r1, [r4, #1500]
	ldr	r3, [r2, #652]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #652]
	ldr	r3, [r4, #2160]
	strb	ip, [r3, #584]
	ldr	r3, [r4, #2160]
	strb	r0, [r3, #512]
	ldr	r3, [r4, #2160]
	ldr	r2, [r4, #1508]
	str	r2, [r3, #604]
	ldr	r2, [r4, #2160]
	ldr	r3, [r2, #604]
	ldr	r1, [r2, #568]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #532]
	ldr	r3, [r4, #2160]
	ldr	r2, [r3, #532]
	str	r2, [r3, #656]
	ldr	r3, [r4, #2160]
	ldr	r2, [r3, #588]
	str	r2, [r3, #516]
	ldrb	r3, [r4, #951]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #2160]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	beq	.L2946
.L2893:
	strb	r2, [r3, #3]
	mov	r2, #0
	ldr	r3, [r4, #2160]
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetRef
	mov	r0, r5
	mov	r2, #0
	ldr	r1, [r4, #2160]
	bl	OutputFrmToVO
	ldr	r3, [r4, #2160]
	cmp	r3, #0
	mov	r6, r0
	bne	.L2942
	b	.L2894
.L2868:
	ldr	ip, [r4, #2160]
	mov	r2, #504
	add	r1, r4, #960
	cmp	ip, #0
	ldreq	r3, [r4, #1464]
	streq	r3, [r4, #2160]
	streq	r3, [r3, #552]
	ldreq	ip, [r4, #2160]
	add	r0, ip, #8
	ldrd	r6, [ip, #24]
	ldr	r3, [ip, #16]
	ldr	r10, [ip, #20]
	strd	r6, [fp, #-52]
	ldrd	r6, [ip, #32]
	ldr	r9, [ip, #76]
	ldr	r8, [ip, #80]
	strd	r6, [fp, #-60]
	str	r3, [fp, #-64]
	ldr	r7, [ip, #84]
	ldr	r6, [ip, #88]
	bl	memcpy
	add	r2, r5, #54016
	ldr	r3, [fp, #-64]
	add	r2, r2, #208
	ldr	r0, [r2, #-8]
	and	r1, r3, r10
	ldr	r2, [r2, #-4]
	and	r0, r0, r2
	adds	r2, r1, #1
	movne	r2, #1
	cmn	r0, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #2160]
	strne	r3, [r2, #16]
	movw	r3, #54224
	strne	r10, [r2, #20]
	ldrd	r0, [r5, r3]
	ldrd	r2, [fp, #-52]
	ldr	ip, [r4, #2160]
	cmp	r1, r3
	cmpeq	r0, r2
	movhi	r1, r3
	add	r3, r5, #54016
	add	r3, r3, #224
	movhi	r0, r2
	strd	r0, [ip, #24]
	ldrd	r0, [fp, #-60]
	ldrd	r2, [r3, #-8]
	ldr	ip, [r4, #2160]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	strd	r2, [ip, #32]
	mov	ip, #1
	ldr	r3, [r4, #1028]
	mov	r0, #3
	ldr	r2, [r4, #2160]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #76]
	ldr	r3, [r4, #1032]
	ldr	r2, [r4, #2160]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #80]
	ldr	r3, [r4, #1036]
	ldr	r2, [r4, #2160]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #84]
	ldr	r3, [r4, #1040]
	ldr	r2, [r4, #2160]
	cmp	r3, r6
	movcs	r3, r6
	str	r3, [r2, #88]
	ldr	r2, [r4, #2160]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #946]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #2160]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #2160]
	ldr	r1, [r4, #1500]
	ldr	r3, [r2, #652]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #652]
	ldr	r3, [r4, #2160]
	strb	ip, [r3, #548]
	ldr	r3, [r4, #2160]
	strb	r0, [r3, #512]
	ldr	r3, [r4, #2160]
	ldr	r2, [r4, #1508]
	str	r2, [r3, #568]
	ldr	r2, [r4, #2160]
	ldr	r3, [r2, #604]
	ldr	r1, [r2, #568]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #532]
	ldr	r3, [r4, #2160]
	ldr	r2, [r3, #532]
	str	r2, [r3, #656]
	ldr	r3, [r4, #2160]
	ldr	r2, [r3, #552]
	str	r2, [r3, #516]
	ldrb	r3, [r4, #951]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #2160]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	bne	.L2893
.L2946:
	orr	r2, r2, ip
	b	.L2893
.L2950:
	ldr	r1, .L2952
	movw	r3, #2705
	str	r0, [sp]
	mov	r0, #22
	ldr	r2, .L2952+4
	ldr	r7, [r1, #68]
	ldr	r1, .L2952+8
	blx	r7
	b	.L2864
.L2882:
	ldr	r3, [r4, #1464]
	mov	r6, r1
	str	r3, [r4, #2160]
	str	r3, [r3, #588]
	b	.L2884
.L2869:
	ldr	r3, [r4, #1464]
	mov	r6, r1
	str	r3, [r4, #2160]
	str	r3, [r3, #552]
	b	.L2871
.L2949:
	ldr	r1, .L2952
	movw	r3, #2899
	str	r6, [sp]
	mov	r0, #22
	ldr	r2, .L2952+4
	ldr	r7, [r1, #68]
	ldr	r1, .L2952+8
	blx	r7
	b	.L2883
.L2951:
	ldr	r1, .L2952
	movw	r3, #2757
	str	r6, [sp]
	mov	r0, #22
	ldr	r2, .L2952+4
	ldr	r7, [r1, #68]
	ldr	r1, .L2952+8
	blx	r7
	b	.L2870
.L2953:
	.align	2
.L2952:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+228
	.word	.LC351
	UNWIND(.fnend)
	.size	DirectOutput, .-DirectOutput
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
	add	r5, r0, #24576
	mov	r4, r0
	ldr	r3, [r5, #2060]
	cmp	r3, #0
	beq	.L2956
	add	r7, r0, #26368
	mov	r6, #0
	add	r7, r7, #68
	b	.L2958
.L2957:
	ldr	r3, [r5, #2060]
	cmp	r3, r6
	bls	.L2956
.L2958:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2957
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r5, #2060]
	cmp	r3, r6
	bhi	.L2958
.L2956:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2956
	mvn	r6, #0
.L2960:
	ldr	r3, [r5, #2060]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	beq	.L2972
	bl	GetMinPOC
	ldr	r3, [fp, #-36]
	mov	r1, #0
	mov	r0, r4
	add	r3, r4, r3, lsl #2
	add	r3, r3, #24576
	ldr	r2, [r3, #1864]
	strb	r1, [r2, #4]
	ldr	r1, [r3, #1864]
	ldr	r2, [r5, #2060]
	bl	OutputFrmToVO
	ldr	r1, [fp, #-36]
	add	r3, r1, #6592
	add	r3, r3, #18
	ldr	r3, [r4, r3, asl #2]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #15
	cmpls	r3, #0
	mov	r6, r0
	bne	.L2960
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB.part.1
	b	.L2960
.L2972:
	cmp	r6, #0
	beq	.L2963
	add	r0, r4, #8
	bl	GetVoLastImageID
	mov	r6, r0
.L2963:
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_GetRemainImg, .-H264DEC_GetRemainImg
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
	beq	.L2990
	bl	ClearAllSlice
	add	r6, r7, #26368
	mov	r8, #0
	add	r10, r7, #53248
	mov	r5, r6
	mov	r4, r6
	add	r5, r5, #200
	add	r6, r6, #72
	add	r4, r4, #136
	mov	r9, r8
.L2978:
	ldr	r3, [r6]
	mov	r2, #1
	add	r8, r8, r2
	cmp	r3, #0
	beq	.L2975
	ldr	r1, [r3, #620]
	ldr	r0, [r10, #4056]
	bl	FSP_ClearLogicFs
.L2975:
	ldr	r3, [r4]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2976
	ldr	r1, [r3, #620]
	ldr	r0, [r10, #4056]
	bl	FSP_ClearLogicFs
.L2976:
	ldr	r3, [r5]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2977
	ldr	r1, [r3, #620]
	ldr	r0, [r10, #4056]
	bl	FSP_ClearLogicFs
.L2977:
	cmp	r8, #16
	str	r9, [r5], #4
	mov	r2, #0
	str	r9, [r4], #4
	str	r9, [r6], #4
	bne	.L2978
	add	r3, r7, #16384
	add	r4, r7, #24576
	ldr	r3, [r3, #1192]
	str	r2, [r4, #2060]
	sub	r3, r3, #1
	str	r2, [r4, #2064]
	str	r3, [r4, #2056]
	str	r2, [r4, #2068]
	str	r2, [r4, #2072]
	ldr	r1, [r10, #2160]
	cmp	r1, r2
	ldreq	r5, .L3008
	beq	.L2980
	ldr	r3, [r10, #3984]
	cmp	r3, #2
	beq	.L2981
	ldr	r5, .L3008
.L2985:
	ldr	r3, [r10, #1464]
	cmp	r3, #0
	beq	.L2983
	ldr	r1, [r3, #620]
	mov	r2, #1
	ldr	r0, [r10, #4056]
	bl	FSP_ClearLogicFs
.L2983:
	mov	r3, #0
	str	r3, [r10, #2160]
.L2980:
	add	r0, r7, #26624
	ldr	r3, [r5, #48]
	mov	r2, #392
	mov	r1, #0
	add	r0, r0, #28
	blx	r3
	ldr	r1, [r4, #2056]
	add	r3, r7, #55808
	mov	r0, #0
	str	r0, [r4, #2336]
	mov	r2, r3
	add	r3, r3, #160
	add	r2, r2, #228
	str	r1, [r4, #2332]
	mov	r1, r0
.L2987:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L2987
	add	r2, r7, #26880
	add	r3, r7, #27136
	add	r2, r2, #160
	add	r3, r3, #36
	mov	r0, #0
.L2988:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L2988
	add	r2, r7, #27136
	add	r7, r7, #20480
	add	r2, r2, #168
	mov	ip, r1
	str	r1, [r7, #252]
.L2989:
	str	ip, [r3, #4]!
	cmp	r3, r2
	mov	r0, #0
	bne	.L2989
	str	r0, [r7, #256]
.L2974:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2981:
	mov	r0, r7
	ldr	r5, .L3008
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L3007
.L2984:
	ldr	r3, [r10, #2160]
	cmp	r3, #0
	bne	.L2985
	b	.L2980
.L3007:
	str	r0, [sp]
	movw	r3, #5650
	ldr	r2, .L3008+4
	mov	r0, #22
	ldr	r6, [r5, #68]
	ldr	r1, .L3008+8
	blx	r6
	b	.L2984
.L2990:
	mvn	r0, #0
	b	.L2974
.L3009:
	.align	2
.L3008:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+244
	.word	.LC351
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	bl	FlushDPB
	subs	r3, r0, #0
	beq	.L3011
	ldr	ip, .L3015
	movw	r2, #499
	ldr	r1, .L3015+4
	mov	r0, #0
	ldr	r5, [ip, #68]
	blx	r5
.L3011:
	mov	r0, r4
	add	r4, r4, #53248
	bl	InitDPB
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2808]
	str	r3, [r4, #4060]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3016:
	.align	2
.L3015:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC352
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r4, r0, #53248
	mov	r6, r0
	ldrb	r3, [r4, #947]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3018
	ldrb	r3, [r4, #945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3018
.L3019:
	ldr	r5, [r4, #4044]
	ldr	r3, [r4, #3984]
	ubfx	r5, r5, #16, #3
	cmp	r3, r5
	beq	.L3020
	subs	r2, r5, #2
	sub	r3, r3, #2
	movne	r2, #1
	cmp	r3, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L3020
	cmp	r5, #4
	cmpne	r5, #1
	bls	.L3097
.L3020:
	cmp	r5, #2
	str	r5, [r4, #3984]
	beq	.L3023
	cmp	r5, #3
	beq	.L3024
	cmp	r5, #1
	beq	.L3098
	ldr	r3, [r4, #3980]
	cmp	r3, #0
	beq	.L3093
	cmp	r5, #4
	ldr	r3, [r4, #1500]
	beq	.L3099
.L3034:
	cmp	r3, #2
	beq	.L3048
.L3038:
	cmp	r3, #1
	streq	r3, [r4, #2812]
.L3040:
	ldr	r1, .L3103
	mov	r0, #2
	ldr	r2, [r4, #4020]
	ldrb	r3, [r4, #947]	@ zero_extendqisi2
	ldr	r5, [r1, #68]
	sub	r2, r2, #1
	ldr	r1, .L3103+4
	blx	r5
	ldr	r0, [r4, #4020]
	ldr	ip, [r4, #1524]
	mov	r3, #1
	ldr	r1, [r4, #1528]
	cmp	r0, #0
	ldr	r2, [r4, #3980]
	str	ip, [r4, #3504]
	str	r1, [r4, #3500]
	str	r2, [r4, #3704]
	strb	r3, [r4, #2842]
	beq	.L3090
	ldr	r1, [r4, #1500]
	cmp	r1, #0
	bne	.L3041
	ldr	r3, .L3103+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3042
	ldr	r2, [r4, #3708]
	cmp	r2, #0
	beq	.L3043
.L3044:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3044
.L3043:
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #4056]
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	r5
	ldr	r2, [r6]
.L3045:
	add	r3, r6, #56064
	add	r3, r3, #24
	str	r3, [r6, #360]
	ldr	r1, [r2, #900]
	cmp	r1, #1
	beq	.L3100
	cmp	r1, #2
	beq	.L3101
.L3047:
	ldr	r3, [r2, #676]
	mov	r0, #0
	str	r3, [r4, #3968]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3018:
	ldr	r3, [r4, #4080]
	ldr	r1, [r4, #4084]
	add	r3, r3, #1
	ldr	r2, [r6]
	cmp	r3, r1
	movlt	r3, r1
	str	r3, [r4, #4080]
	str	r3, [r2, #600]
	ldr	r3, [r4, #4080]
	ldr	r1, [r4, #4084]
	rsb	r3, r1, r3
	str	r3, [r2, #604]
	b	.L3019
.L3097:
	ldr	r3, .L3103
	mov	r2, r5
	ldr	r1, .L3103+12
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	str	r5, [r4, #3984]
.L3024:
	mov	r0, r6
	bl	H264_ClearCurrPic
	mov	r0, r6
	bl	ClearDPB
	mvn	r0, #0
.L3090:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3023:
	ldr	r5, [r4, #1500]
	cmp	r5, #0
	bne	.L3030
	ldr	r3, [r4, #3980]
	cmp	r3, #0
	beq	.L3093
	ldr	r3, [r4, #3976]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L3040
	mov	r3, #1
	mov	r0, r6
	strb	r3, [r4, #951]
	bl	H264_ClearCurrPic
	ldr	r3, .L3103
	mov	r0, r5
	ldr	r1, .L3103+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3090
.L3098:
	ldr	r3, [r4, #1500]
	cmp	r3, #2
	beq	.L3102
	ldr	r2, [r4, #3980]
	cmp	r2, #0
	bne	.L3038
.L3093:
	mov	r0, r6
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3090
.L3041:
	add	r3, r6, #24576
	ldr	r3, [r3, #2060]
	cmp	r3, #0
	bne	.L3042
	ldr	r2, [r6]
	ldr	r3, [r2, #12]
	cmp	r3, #2
	beq	.L3045
	b	.L3093
.L3099:
	cmp	r3, #0
	bne	.L3034
	ldr	r3, [r4, #2812]
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r4, #2812]
	movne	r3, #1
	strne	r3, [r4, #2812]
	b	.L3040
.L3102:
	ldr	r3, [r4, #1480]
	cmp	r3, #0
	beq	.L3030
	ldr	r3, [r4, #3980]
	cmp	r3, #0
	beq	.L3093
.L3048:
	ldr	r3, [r4, #2812]
	cmp	r3, #2
	bne	.L3040
	ldr	r3, [r6]
	ldr	r5, [r3, #12]
	cmp	r5, #0
	bne	.L3040
	ldr	r3, .L3103+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3040
	ldr	r1, .L3103
	mov	r0, #1
	ldr	r3, [r4, #1480]
	ldr	r2, [r4, #1484]
	ldr	r7, [r1, #68]
	ldr	r1, .L3103+24
	blx	r7
	mov	r0, r6
	bl	H264_ClearCurrPic
	ldr	r3, [r4, #1464]
	ldr	r0, [r4, #4056]
	mov	r2, r5
	ldr	r1, [r3, #620]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3090
.L3042:
	ldr	r2, [r6]
	b	.L3045
.L3100:
	cmp	r3, #0
	beq	.L3047
	ldr	r3, [r4, #1500]
	cmp	r3, #2
	bne	.L3047
	mov	r2, #0
	str	r2, [r6, #360]
	ldr	r3, [r4, #1464]
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetDisplay
	b	.L3093
.L3101:
	ldr	r1, [r2, #904]
	cmp	r3, #0
	cmpne	r1, #0
	ble	.L3047
	ldr	r3, [r4, #1500]
	cmp	r3, #2
	bne	.L3047
	mov	r2, #0
	str	r2, [r6, #360]
	ldr	r3, [r4, #1464]
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_SetDisplay
	ldr	r2, [r6]
	mov	r0, r6
	ldr	r3, [r2, #904]
	sub	r3, r3, #1
	str	r3, [r2, #904]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3090
.L3030:
	mov	r3, #1
	mov	r0, r6
	strb	r3, [r4, #951]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3090
.L3104:
	.align	2
.L3103:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC356
	.word	g_event_report
	.word	.LC353
	.word	.LC354
	.word	g_allow_B_before_P
	.word	.LC355
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
	str	r1, [r2, #260]
	strb	r4, [r2, #213]
	str	r4, [r0, #364]
	bl	DecVDM
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L3107
	mov	r0, r4
	ldr	r1, .L3107+4
	ldr	r3, [r3, #68]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L3108:
	.align	2
.L3107:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC357
	UNWIND(.fnend)
	.size	H264_FlushDecoder, .-H264_FlushDecoder
	.align	2
	.global	ReceivePacket
	.type	ReceivePacket, %function
ReceivePacket:
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
	ldr	r7, .L3172
	ldr	r3, [r1, #8]
	mov	r5, r1
	ldr	r2, [r1, #4]
	mov	r4, r0
	ldr	r1, [r1, #12]
	add	r6, r4, #53248
	mov	r0, #7
	ldr	r8, [r7, #68]
	str	r1, [sp]
	ldr	r1, .L3172+4
	blx	r8
	mov	r3, #0
	str	r3, [r6, #4088]
	ldr	r3, [r4]
	ldr	r2, [r3, #868]
	cmp	r2, #1
	beq	.L3167
.L3110:
	ldr	r3, [r4, #368]
	cmp	r3, #0
	beq	.L3130
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3168
.L3113:
	ldr	r1, .L3172+8
	mov	r0, #1
	ldr	r3, [r7, #68]
	blx	r3
	ldr	r1, [r4, #368]
	cmp	r1, #0
	beq	.L3130
	ldr	r0, [r6, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L3130:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3117
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3117
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3117
	ldrb	r3, [r4, #377]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3133
	mov	r2, r4
	mov	r3, #1
	b	.L3120
.L3119:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3131
.L3120:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L3119
	mov	r2, r3
.L3118:
	mov	r1, r3, asl #7
	cmn	r2, #1
	sub	r3, r1, r3, asl #5
	mov	r1, #1
	add	r3, r4, r3
	strb	r1, [r3, #377]
	beq	.L3131
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
	ldr	r3, [r4, #368]
	b	.L3123
.L3168:
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bhi	.L3113
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3114
	b	.L3113
.L3167:
	ldr	r3, [r3, #908]
	cmp	r3, #0
	beq	.L3110
	ldr	r3, [r4, #368]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3130
.L3114:
	strb	r2, [r3, #4]
	ldr	r3, [r4]
	ldr	r2, [r3, #868]
	cmp	r2, #1
	beq	.L3169
.L3125:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3126
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3126
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3126
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bls	.L3170
.L3127:
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #4056]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3172+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3164
	mov	r3, #0
	ldr	r0, [r6, #4056]
	mov	r2, r3
	mov	r1, #113
	blx	r5
.L3164:
	ldr	r3, [r4, #368]
.L3123:
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3117:
	ldr	r3, [r7, #68]
	mov	r0, #1
	ldr	r1, .L3172+16
	blx	r3
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #4056]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3172+12
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3166
.L3165:
	mov	r3, #0
	ldr	r0, [r6, #4056]
	mov	r2, r3
	mov	r1, #113
	blx	r4
.L3166:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3126:
	ldr	r3, [r4, #368]
	b	.L3127
.L3169:
	ldr	r3, [r3, #908]
	cmp	r3, #0
	bne	.L3164
	b	.L3125
.L3170:
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
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #12]
	cmp	r2, #4096
	bcc	.L3171
.L3128:
	mov	r2, #1
	str	r2, [r6, #4088]
	b	.L3123
.L3171:
	mov	r0, r4
	bl	CombinePacket.part.10
	ldr	r3, [r4, #368]
	b	.L3128
.L3131:
	ldr	r3, [r7, #68]
	mov	r0, #0
	ldr	r1, .L3172+20
	blx	r3
	mov	r0, r4
	bl	ClearAllNal
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	ldr	r3, .L3172+12
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L3165
	b	.L3166
.L3133:
	mov	r2, r3
	b	.L3118
.L3173:
	.align	2
.L3172:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC358
	.word	.LC359
	.word	g_event_report
	.word	.LC361
	.word	.LC360
	UNWIND(.fnend)
	.size	ReceivePacket, .-ReceivePacket
	.align	2
	.global	ClearAll
	.type	ClearAll, %function
ClearAll:
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
	ldr	r9, .L3200
	mov	r8, r0
	mov	r4, r1
	mov	r0, #22
	ldr	r1, .L3200+4
	add	r7, r8, #53248
	ldr	r3, [r9, #68]
	blx	r3
	mov	r0, r8
	bl	H264_ClearCurrPic
	mov	r0, r8
	bl	ClearAllNal
	mov	r0, r8
	bl	InitDPB
	cmp	r4, #0
	beq	.L3175
	add	r1, r8, #8
	ldr	r0, [r7, #4056]
	bl	FSP_ClearNotInVoQueue
.L3176:
	add	r4, r8, #27392
	mov	r6, #0
	add	r4, r4, #152
	mov	r10, r6
.L3179:
	sub	r5, r4, #16
	sub	r3, r4, #232
	mov	r2, #1
	mvn	lr, #0
	mov	ip, #17
	mov	r0, #16
	mov	r1, #2
	strb	r10, [r4, #-232]
	strb	r10, [r4, #-231]
	strb	r10, [r4, #-230]
	str	r10, [r4, #400]
	str	r10, [r4, #392]
	str	r10, [r4, #404]
	strb	r10, [r4, #-228]
	str	r6, [r4, #-28]
	strb	r10, [r4, #280]
	str	lr, [r4, #396]
	str	r2, [r4, #412]
	strb	r2, [r4, #316]
	str	ip, [r4, #428]
	str	r0, [r4, #432]
	str	r3, [r4, #356]
	str	r3, [r4, #320]
	str	r3, [r4, #284]
	strb	r1, [r4, #352]
.L3178:
	ldr	r1, [r5, #4]!
	cmp	r1, #0
	beq	.L3177
	ldr	r0, [r7, #4056]
	bl	FreeUsdByDec
	str	r10, [r5]
.L3177:
	cmp	r5, r4
	bne	.L3178
	add	r6, r6, #1
	add	r4, r5, #672
	cmp	r6, #40
	bne	.L3179
	add	r4, r8, #54272
	mov	r6, #0
	mov	r5, r4
	add	r4, r4, #144
	add	r5, r5, #160
.L3181:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L3180
	ldr	r0, [r7, #4056]
	bl	FreeUsdByDec
	str	r6, [r4]
.L3180:
	cmp	r4, r5
	bne	.L3181
	ldr	r3, [r7, #2820]
	cmp	r3, #0
	beq	.L3185
	add	r6, r8, #56064
	mov	r4, #0
	add	r6, r6, #4
	mov	r5, r4
.L3184:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3183
	ldr	r0, [r7, #4056]
	bl	FreeUsdByDec
	str	r5, [r6]
.L3183:
	ldr	r3, [r7, #2820]
	cmp	r3, r4
	movhi	r3, #1
	movls	r3, #0
	cmp	r4, #3
	movhi	r3, #0
	cmp	r3, #0
	bne	.L3184
.L3185:
	add	r5, r8, #20480
	add	ip, r8, #24576
	mov	r4, #0
	ldr	r3, [r9, #48]
	str	r4, [r7, #2820]
	add	r0, r5, #208
	str	r4, [r7, #4032]
	mov	r1, r4
	str	r4, [r7, #2800]
	mov	r2, #1648
	str	r4, [r7, #3980]
	str	r4, [r7, #4040]
	str	r4, [r7, #3988]
	str	r4, [r7, #2808]
	str	r4, [r7, #4060]
	str	r4, [r7, #2812]
	str	r4, [r8, #368]
	str	r4, [ip, #1812]
	strb	r4, [r5, #3904]
	strb	r4, [r5, #1900]
	strb	r4, [r5, #3905]
	strb	r4, [r5, #1901]
	blx	r3
	mov	r2, #2
	mov	r3, #1
	strb	r2, [r5, #208]
	strb	r3, [r5, #213]
	mov	r0, r4
	mov	r3, #256
	strb	r4, [r7, #944]
	strb	r4, [r7, #2128]
	str	r4, [r7, #2132]
	str	r3, [r7, #2136]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3175:
	add	r0, r8, #8
	bl	ResetVoQueue
	ldr	r0, [r7, #4056]
	bl	FSP_EmptyInstance
	b	.L3176
.L3201:
	.align	2
.L3200:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC362
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r1, #15
	mov	r5, r1
	mov	r6, r0
	mov	r4, r2
	bhi	.L3241
	ldrb	r8, [r2, #3]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L3205
	bcc	.L3206
	cmp	r8, #2
	bne	.L3301
	ldr	r3, [r2, #520]
	mov	r2, #3
	strb	r2, [r3, #512]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3226
	add	r7, r0, r3
	add	r7, r7, #24576
	ldr	r2, [r7, #1864]
	cmp	r2, #0
	beq	.L3226
	strb	r8, [r2, #584]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #520]
	str	r2, [r3, #588]
	ldr	r3, [r7, #1864]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #585]
	ldr	r3, [r7, #1864]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #586]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #552]
	str	r2, [r3, #600]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #556]
	str	r2, [r3, #608]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #564]
	str	r2, [r3, #604]
	ldr	r3, [r7, #1864]
	ldr	r1, [r3, #568]
	ldr	r2, [r3, #604]
	add	r2, r2, r1
	str	r2, [r3, #532]
	str	r2, [r3, #656]
	add	r1, r4, #16
	ldr	r2, [r7, #1864]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r7, #1864]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #1864]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #3]
	mov	r2, #504
	ldr	ip, [r7, #1864]
	add	r0, ip, #8
	ldr	r3, [ip, #16]
	ldrd	r8, [ip, #24]
	ldr	lr, [ip, #20]
	str	r3, [fp, #-72]
	ldr	r3, [ip, #76]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip, #32]
	str	r3, [fp, #-80]
	ldr	r3, [ip, #84]
	ldr	r10, [ip, #80]
	str	lr, [fp, #-76]
	str	r3, [fp, #-64]
	ldr	r3, [ip, #88]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-68]
	bl	memcpy
	ldr	ip, [fp, #-72]
	ldr	lr, [fp, #-76]
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	and	r2, ip, lr
	adds	r2, r2, #1
	ldrd	r8, [fp, #-52]
	and	r1, r1, r0
	ldr	r3, [fp, #-80]
	movne	r2, #1
	cmn	r1, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r7, #1864]
	strne	ip, [r2, #16]
	strne	lr, [r2, #20]
	ldrd	r0, [r4, #32]
	ldr	r2, [r7, #1864]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r2, #24]
	ldrd	r0, [r4, #40]
	ldr	r2, [r7, #1864]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r1, r9
	movhi	r0, r8
	strd	r0, [r2, #32]
	ldr	r2, [r4, #84]
	ldr	r1, [r7, #1864]
	cmp	r2, r3
	movcs	r2, r3
	str	r2, [r1, #76]
	ldr	r3, [r4, #88]
	ldr	r2, [r7, #1864]
	cmp	r3, r10
	ldr	r1, [fp, #-64]
	movcs	r3, r10
	str	r3, [r2, #80]
	ldr	r3, [r4, #92]
	ldr	r2, [r7, #1864]
	cmp	r3, r1
	movcs	r3, r1
	ldr	r1, [fp, #-68]
	str	r3, [r2, #84]
	ldr	r3, [r4, #96]
	ldr	r2, [r7, #1864]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #88]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3238
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3238
.L3239:
	ldr	r2, [r7, #1864]
	ldr	r3, [r2, #608]
	ldr	r1, [r2, #572]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #652]
	ldr	r2, [r4, #540]
	ldr	r3, [r7, #1864]
	str	r2, [r3, #636]
	ldr	r0, [r7, #1864]
	bl	CombineFldsToFrm
	ldr	r2, [r7, #1864]
	ldr	r3, [r2, #664]
	ldr	r2, [r2, #600]
	add	r3, r3, #6656
	add	r3, r3, #54
	add	r3, r6, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3225
.L3206:
	ldr	r2, [r2, #520]
	add	r7, r0, r1, lsl #2
	add	r7, r7, #24576
	mov	r3, #3
	str	r2, [r7, #1864]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2]
	ldr	r2, [r7, #1864]
	strb	r3, [r2, #1]
	ldr	r1, [r4, #520]
	ldr	r2, [r7, #1864]
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	strb	r1, [r2, #4]
	ldr	r1, [r4, #520]
	ldr	r2, [r7, #1864]
	ldr	r1, [r1, #644]
	str	r1, [r2, #644]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r7, #1864]
	cmp	r1, #0
	beq	.L3302
.L3208:
	strb	r3, [r2, #2]
	add	r1, r4, #16
	ldr	r3, [r7, #1864]
	mov	r2, #504
	ldr	r0, [r4, #588]
	mov	r9, #0
	str	r0, [r3, #660]
	ldr	r0, [r7, #1864]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #564]
	mov	lr, #1
	mov	ip, #2
	mov	r0, r6
	str	r2, [r3, #532]
	str	r2, [r3, #656]
	mov	r2, r9
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #520]
	str	r1, [r3, #588]
	str	r1, [r3, #552]
	str	r1, [r3, #516]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #532]
	str	r1, [r3, #632]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #528]
	str	r1, [r3, #624]
	ldr	r3, [r7, #1864]
	strb	r9, [r3, #512]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #513]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #514]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #556]
	str	r1, [r3, #536]
	str	r1, [r3, #652]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	str	r1, [r3, #648]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #540]
	str	r1, [r3, #636]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #544]
	str	r1, [r3, #528]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #548]
	str	r1, [r3, #564]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #552]
	str	r1, [r3, #600]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, lr
	ldr	r3, [r7, #1864]
	moveq	r8, #3
	strb	r8, [r3, #3]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r3, #513]	@ zero_extendqisi2
	strb	lr, [r3, #548]
	ldrb	r7, [r3, #514]	@ zero_extendqisi2
	strb	ip, [r3, #584]
	ldr	lr, [r3, #532]
	ldr	ip, [r3, #536]
	strb	r1, [r3, #549]
	strb	r1, [r3, #585]
	ldr	r1, [r3, #516]
	strb	r7, [r3, #550]
	strb	r7, [r3, #586]
	str	lr, [r3, #568]
	str	lr, [r3, #604]
	str	ip, [r3, #572]
	str	ip, [r3, #608]
	str	r1, [r3, #552]
	str	r1, [r3, #588]
	ldr	r1, [r4, #520]
	bl	GetAPC
	cmp	r0, #0
	bne	.L3303
.L3225:
	add	r5, r5, #6592
	add	r3, r6, #53248
	add	r5, r5, #18
	mov	r2, #1
	ldr	r0, [r3, #4056]
	ldr	r3, [r6, r5, asl #2]
	ldr	r1, [r3, #620]
	bl	FSP_SetRef
	mov	r0, #0
.L3203:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3301:
	ldr	r3, .L3304
	mov	r2, r8
	ldr	r1, .L3304+4
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r6
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3205:
	ldr	r3, [r2, #520]
	mov	r2, #3
	strb	r2, [r3, #512]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3211
	add	r7, r0, r3
	add	r7, r7, #24576
	ldr	r2, [r7, #1864]
	cmp	r2, #0
	beq	.L3211
	strb	r8, [r2, #548]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #556]
	str	r2, [r3, #572]
	ldr	r3, [r7, #1864]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #549]
	ldr	r3, [r7, #1864]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #550]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #548]
	str	r2, [r3, #564]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #556]
	str	r2, [r3, #572]
	ldr	r3, [r7, #1864]
	ldr	r2, [r4, #564]
	str	r2, [r3, #568]
	ldr	r3, [r7, #1864]
	ldr	r1, [r3, #568]
	ldr	r2, [r3, #604]
	add	r2, r2, r1
	str	r2, [r3, #532]
	str	r2, [r3, #656]
	add	r1, r4, #16
	ldr	r2, [r7, #1864]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r7, #1864]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #1864]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #1
	strb	r2, [r3, #3]
	mov	r2, #504
	ldr	ip, [r7, #1864]
	add	r0, ip, #8
	ldr	r3, [ip, #16]
	ldrd	r8, [ip, #24]
	ldr	lr, [ip, #20]
	str	r3, [fp, #-72]
	ldr	r3, [ip, #76]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip, #32]
	str	r3, [fp, #-80]
	ldr	r3, [ip, #84]
	ldr	r10, [ip, #80]
	str	lr, [fp, #-76]
	str	r3, [fp, #-64]
	ldr	r3, [ip, #88]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-68]
	bl	memcpy
	ldr	ip, [fp, #-72]
	ldr	lr, [fp, #-76]
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	and	r2, ip, lr
	adds	r2, r2, #1
	ldrd	r8, [fp, #-52]
	and	r1, r1, r0
	ldr	r3, [fp, #-80]
	movne	r2, #1
	cmn	r1, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r7, #1864]
	strne	ip, [r2, #16]
	strne	lr, [r2, #20]
	ldrd	r0, [r4, #32]
	ldr	r2, [r7, #1864]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r2, #24]
	ldrd	r0, [r4, #40]
	ldr	r2, [r7, #1864]
	cmp	r1, r9
	cmpeq	r0, r8
	movhi	r1, r9
	movhi	r0, r8
	strd	r0, [r2, #32]
	ldr	r2, [r4, #84]
	ldr	r1, [r7, #1864]
	cmp	r2, r3
	movcs	r2, r3
	str	r2, [r1, #76]
	ldr	r3, [r4, #88]
	ldr	r2, [r7, #1864]
	cmp	r3, r10
	ldr	r1, [fp, #-64]
	movcs	r3, r10
	str	r3, [r2, #80]
	ldr	r3, [r4, #92]
	ldr	r2, [r7, #1864]
	cmp	r3, r1
	movcs	r3, r1
	ldr	r1, [fp, #-68]
	str	r3, [r2, #84]
	ldr	r3, [r4, #96]
	ldr	r2, [r7, #1864]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #88]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3222
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3222
.L3223:
	ldr	r2, [r7, #1864]
	ldr	r3, [r2, #608]
	ldr	r1, [r2, #572]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #652]
	ldr	r2, [r4, #540]
	ldr	r3, [r7, #1864]
	str	r2, [r3, #636]
	ldr	r0, [r7, #1864]
	bl	CombineFldsToFrm
	ldr	r2, [r7, #1864]
	ldr	r3, [r2, #664]
	ldr	r2, [r2, #564]
	add	r3, r3, #6656
	add	r3, r3, #38
	add	r3, r6, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3225
.L3211:
	add	r7, r6, r3
	ldr	r3, [r4, #520]
	add	r7, r7, #24576
	mov	r2, #1
	str	r3, [r7, #1864]
	strb	r2, [r3, #548]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #520]
	str	r1, [r3, #552]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #549]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #550]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #548]
	str	r1, [r3, #564]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #556]
	str	r1, [r3, #572]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #564]
	str	r1, [r3, #568]
	ldr	r3, [r7, #1864]
	ldr	r1, [r3, #568]
	str	r1, [r3, #532]
	str	r1, [r3, #656]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #1864]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #520]
	ldr	r3, [r7, #1864]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #520]
	ldr	r3, [r7, #1864]
	ldr	r2, [r2, #644]
	str	r2, [r3, #644]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3213
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3213
.L3214:
	ldr	r3, [r7, #1864]
	mov	r8, #0
	mov	r2, #504
	add	r1, r4, #16
	str	r8, [r3, #648]
	ldr	r0, [r7, #1864]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #588]
	mov	r2, #1
	mov	r0, r6
	str	r1, [r3, #660]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #528]
	str	r1, [r3, #624]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #540]
	str	r1, [r3, #636]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #556]
	str	r1, [r3, #652]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	ldr	r1, [r7, #1864]
	rsb	r3, r2, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r1, #3]
	ldr	r1, [r4, #520]
	bl	GetAPC
	cmp	r0, #0
	beq	.L3225
	mov	r3, r0
	ldr	ip, .L3304
	mov	r0, r8
	movw	r2, #2395
	b	.L3299
.L3226:
	add	r7, r6, r3
	ldr	r3, [r4, #520]
	add	r7, r7, #24576
	mov	r2, #2
	str	r3, [r7, #1864]
	strb	r2, [r3, #584]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #520]
	str	r1, [r3, #588]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #585]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #586]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #552]
	str	r1, [r3, #600]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #556]
	str	r1, [r3, #608]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #564]
	str	r1, [r3, #604]
	ldr	r3, [r7, #1864]
	ldr	r1, [r3, #568]
	str	r1, [r3, #532]
	str	r1, [r3, #656]
	ldr	r3, [r7, #1864]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #1864]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #520]
	ldr	r3, [r7, #1864]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #520]
	ldr	r3, [r7, #1864]
	ldr	r2, [r2, #644]
	str	r2, [r3, #644]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3228
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3228
.L3229:
	ldr	r3, [r7, #1864]
	mov	r9, #0
	mov	r2, #504
	add	r1, r4, #16
	str	r9, [r3, #648]
	ldr	r0, [r7, #1864]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #588]
	mov	r2, #2
	mov	r0, r6
	str	r1, [r3, #660]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #528]
	str	r1, [r3, #624]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #540]
	str	r1, [r3, #636]
	ldr	r3, [r7, #1864]
	ldr	r1, [r4, #556]
	str	r1, [r3, #608]
	str	r1, [r3, #652]
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	r3, [r7, #1864]
	cmp	r1, #1
	moveq	r8, r2
	movne	r8, r9
	strb	r8, [r3, #3]
	ldr	r1, [r4, #520]
	bl	GetAPC
	cmp	r0, #0
	beq	.L3225
	ldr	ip, .L3304
	mov	r3, r0
	movw	r2, #2540
	mov	r0, r9
.L3299:
	ldr	r1, .L3304+8
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, r6
	bl	ClearDPB
	mvn	r0, #0
	b	.L3203
.L3302:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3208
.L3213:
	ldr	r3, [r7, #1864]
	mov	r2, #1
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r7, #1864]
	ldreq	r2, [r4, #532]
	streq	r2, [r3, #632]
	b	.L3214
.L3228:
	ldr	r3, [r7, #1864]
	mov	r2, #2
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1864]
	ldreq	r2, [r4, #532]
	streq	r2, [r3, #632]
	b	.L3229
.L3238:
	ldr	r2, [r7, #1864]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1864]
	ldreq	r2, [r4, #532]
	streq	r2, [r3, #632]
	b	.L3239
.L3222:
	ldr	r2, [r7, #1864]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #1864]
	ldreq	r2, [r4, #532]
	streq	r2, [r3, #632]
	b	.L3223
.L3241:
	mvn	r0, #0
	b	.L3203
.L3303:
	mov	r3, r0
	ldr	ip, .L3304
	mov	r0, r9
	movw	r2, #2342
	b	.L3299
.L3305:
	.align	2
.L3304:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC364
	.word	.LC363
	UNWIND(.fnend)
	.size	InsertFrmInDPB, .-InsertFrmInDPB
	.align	2
	.global	StorePicInDPB
	.type	StorePicInDPB, %function
StorePicInDPB:
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
	add	r3, r0, #16384
	add	r4, r0, #53248
	mov	r8, #0
	str	r8, [r3, #3444]
	mov	r5, r0
	ldrb	r2, [r4, #947]	@ zero_extendqisi2
	sub	r1, r2, #2
	clz	r1, r1
	mov	r1, r1, lsr #5
	str	r1, [r3, #3448]
	ldrb	r0, [r4, #944]	@ zero_extendqisi2
	cmp	r0, r8
	beq	.L3483
	ldr	r0, [r4, #3984]
	ldr	r3, [r4, #4068]
	cmp	r0, #2
	str	r3, [r4, #4064]
	beq	.L3484
	ldr	r6, [r5]
	ldr	r3, [r6, #12]
	cmp	r3, #0
	ble	.L3485
	ldrb	r0, [r4, #946]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L3314
.L3496:
	sub	r0, r2, #1
	ldr	r8, [r4, #1464]
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	cmp	r2, #0
	beq	.L3315
	ldrb	ip, [r8, #1]	@ zero_extendqisi2
	cmp	ip, #0
	moveq	lr, r0
	orrne	lr, r0, #1
	cmp	lr, #0
	beq	.L3314
	cmp	r0, #0
	beq	.L3486
.L3394:
	ldr	r0, [r4, #4060]
	cmp	r0, #0
	bne	.L3318
	mov	r3, #1
	mov	r2, #592
	str	r3, [r4, #4060]
	add	r1, r4, #944
	add	r0, r5, #54784
	bl	memcpy
	ldr	r3, [r6, #12]
.L3314:
	cmp	r3, #2
	ldr	r3, [r4, #1480]
	beq	.L3487
	cmp	r3, #0
	beq	.L3352
	ldr	r2, [r4, #4048]
	ldr	r3, [r4, #1508]
	cmp	r2, r3
	bcs	.L3353
	ldrb	r3, [r4, #946]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3488
.L3353:
	mov	r0, r5
	bl	Marking
	subs	r2, r0, #0
	beq	.L3355
	ldr	r6, .L3508
	mov	r0, #1
	ldr	r1, .L3508+4
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r5, [r6, #68]
	movw	r3, #3942
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3315:
	cmp	r0, #0
	bne	.L3394
.L3321:
	add	r6, r5, #54016
	add	r6, r6, #176
.L3324:
	cmp	r2, #0
	beq	.L3325
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3489
.L3325:
	ldr	r3, [r6, #564]
	str	r3, [r8, #656]
.L3326:
	mov	r1, r8
	mov	r0, r5
	bl	GetImagePara
	ldr	r1, [r8, #620]
	ldr	r0, [r4, #4056]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3490
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3328
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3491
.L3328:
	ldrd	r2, [r6, #24]
.L3474:
	strd	r2, [r7, #8]
.L3329:
	ldrd	r2, [r6, #32]
	strd	r2, [r7, #16]
	ldrd	r2, [r6, #40]
	strd	r2, [r7, #24]
	ldr	r3, [r6, #84]
	str	r3, [r7, #68]
	ldr	r3, [r6, #88]
	str	r3, [r7, #72]
	ldr	r3, [r6, #92]
	str	r3, [r7, #76]
	ldr	r3, [r6, #96]
	str	r3, [r7, #80]
	ldr	r2, [r8, #656]
	cmp	r2, #0
	str	r2, [r7, #200]
	beq	.L3335
	ldr	r3, [r7, #160]
	ands	r9, r3, #3
	beq	.L3492
.L3333:
	ldr	r3, [r5]
	ldr	r1, [r3, #4]
	cmp	r1, r2
	bcc	.L3493
.L3335:
	mov	r2, #1
	ldr	r1, [r8, #620]
	ldr	r0, [r4, #4056]
	bl	FSP_SetDisplay
	ldr	r0, [r4, #4056]
	add	r3, r5, #8
	str	r7, [sp]
	mov	r2, r5
	mov	r1, #0
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3494
	mov	r2, #0
	ldr	r1, [r8, #620]
	ldr	r0, [r4, #4056]
	bl	FSP_SetDisplay
.L3337:
	ldr	r3, [r5]
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #84]
	bcs	.L3495
.L3339:
	ldr	r2, [r4, #4060]
	ldr	r3, [r4, #4076]
	cmp	r2, #2
	add	r3, r3, #2
	str	r3, [r4, #4076]
	movne	r3, #1
	strne	r3, [r8, #640]
	mov	r3, #2
	str	r3, [r4, #4060]
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	b	.L3314
.L3483:
	ldr	r6, .L3508
	ldr	r1, .L3508+12
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r5, [r6, #68]
	movw	r3, #3650
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
.L3393:
	ldr	r3, [r4, #1464]
	mov	r2, #1
	ldr	r0, [r4, #4056]
	mvn	r7, #0
	ldr	r1, [r3, #620]
	bl	FSP_ClearLogicFs
	mov	r3, r7
	movw	r2, #4162
	ldr	r5, [r6, #68]
	ldr	r1, .L3508+16
	mov	r0, #1
	blx	r5
	ldr	r2, [r4, #1464]
	mov	r3, #0
	strb	r3, [r2, #4]
	ldr	r2, [r4, #1464]
	strb	r3, [r2, #1]
.L3391:
	mov	r0, r7
	mov	r3, #0
	strb	r3, [r4, #944]
.L3471:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3485:
	ldr	r0, [r4, #4060]
	cmp	r0, #2
	beq	.L3314
	ldrb	r0, [r4, #946]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L3314
	b	.L3496
.L3487:
	cmp	r3, #0
	beq	.L3345
	ldrb	r3, [r4, #950]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3346
.L3350:
	mov	r0, r5
	add	r6, r5, #24576
	bl	SimpleSlideDPB
	add	r2, r5, #54016
	ldr	r1, [r6, #2060]
	add	r2, r2, #176
	mov	r0, r5
	bl	InsertFrmInDPB
	subs	r7, r0, #0
	bne	.L3347
	ldr	r3, [r6, #2060]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r6, #2060]
	bl	UpdateReflist
	mov	r0, r5
	bl	UpdateLTReflist
	ldr	ip, .L3508
	mov	r2, r7
	movw	r3, #3916
	ldr	r1, .L3508+8
	mov	r0, #14
	ldr	r5, [ip, #68]
	blx	r5
.L3351:
	mov	r7, #0
	b	.L3391
.L3486:
	cmp	ip, #0
	beq	.L3314
	b	.L3321
.L3355:
	mov	r0, r5
	bl	UpdateReflist
	mov	r0, r5
	bl	UpdateLTReflist
	mov	r0, r5
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L3345
	ldr	r6, .L3508
	mov	r0, #22
	ldr	r1, .L3508+20
	ldr	r3, [r6, #68]
	blx	r3
.L3345:
	ldrb	r3, [r4, #945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3357
	add	r6, r5, #24576
.L3361:
	ldr	r3, [r4, #1480]
	cmp	r3, #0
	beq	.L3497
	ldr	r1, [r6, #2064]
	ldr	r2, [r6, #2068]
	ldr	r3, [r6, #2056]
	add	r0, r2, r1
	cmp	r3, r0
	bhi	.L3369
	ldr	r0, [r5]
	ldr	r0, [r0, #12]
	cmp	r0, #3
	beq	.L3370
	ldr	r0, .L3508+24
	ldrb	r0, [r0]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L3370
	ldr	r6, .L3508
	mov	r0, #1
	str	r2, [sp, #4]
	movw	r2, #4021
	str	r1, [sp]
	ldr	r1, .L3508+28
	ldr	r7, [r6, #68]
	blx	r7
	mov	r0, r5
	bl	ClearDPB
	ldr	r5, [r6, #68]
	movw	r3, #4047
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3370:
	sub	r1, fp, #56
	sub	r2, fp, #52
	mov	r0, r5
	bl	GetMinPOC
	ldr	r1, [fp, #-52]
	cmp	r1, #15
	bls	.L3498
.L3372:
	mov	r0, r5
	bl	UpdateReflist
	mov	r0, r5
	bl	UpdateLTReflist
	ldr	r3, [r6, #2056]
.L3369:
	mvn	r10, #0
	mov	r8, r10
	b	.L3382
.L3383:
	bl	GetMinPOC
	ldr	r3, [r4, #1480]
	cmp	r3, #0
	bne	.L3373
	ldr	r2, [r4, #1484]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L3374
.L3373:
	ldr	r3, [r6, #2056]
	cmp	r3, #0
	beq	.L3374
	ldr	r7, [r6, #2060]
	cmp	r7, r10
	ldrne	r8, [fp, #-52]
	bne	.L3380
	ldr	r3, [fp, #-52]
	cmp	r3, r8
	beq	.L3499
	mov	r8, r3
.L3380:
	mov	r1, r8
	mov	r0, r5
	bl	OutputFrmFromDPB
	mov	r10, r7
	cmn	r0, #1
	mov	r9, r0
	beq	.L3381
	ldr	r3, [r6, #2056]
.L3382:
	ldr	ip, [r6, #2060]
	sub	r2, fp, #52
	sub	r1, fp, #56
	mov	r0, r5
	cmp	ip, r3
	bcs	.L3383
	ldr	r3, [r4, #1480]
	cmp	r3, #0
	beq	.L3384
	ldrb	r3, [r4, #948]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3384
	ldr	r2, [r6, #2064]
	cmp	r2, #0
	beq	.L3384
	add	r2, r5, #26368
	mov	lr, r3
	add	r2, r2, #132
	b	.L3389
.L3386:
	ldr	r1, [r6, #2064]
	cmp	r1, r3
	bls	.L3500
.L3389:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	ldr	r0, [r4, #1472]
	ldr	ip, [r1, #624]
	cmp	ip, r0
	bne	.L3386
	ldr	r0, [r1, #640]
	cmp	r0, #1
	beq	.L3386
	strb	lr, [r1, #2]
	ldr	r0, [r2]
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
	cmp	r1, #1
	streq	r1, [r0, #644]
	ldreq	r1, [r2]
	streqb	lr, [r1, #4]
	ldreq	r0, [r2]
	ldr	r7, [r4, #2796]
	ldr	ip, [r0, #660]
	add	r1, ip, #13952
	cmp	ip, r7
	add	r1, r1, #40
	addne	r1, r5, r1, lsl #2
	strne	lr, [r1, #4]
	strne	r7, [r0, #660]
	b	.L3386
.L3500:
	ldr	ip, [r6, #2060]
.L3384:
	add	r2, r5, #54016
	mov	r1, ip
	add	r2, r2, #176
	mov	r0, r5
	bl	InsertFrmInDPB
	ldr	r2, [r6, #2060]
	str	r2, [r4, #2156]
	subs	r3, r0, #0
	beq	.L3390
	ldr	r6, .L3508
	movw	r2, #4135
	ldr	r1, .L3508+16
	mov	r0, #1
	ldr	r5, [r6, #68]
	blx	r5
	ldr	r5, [r6, #68]
	movw	r3, #4136
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3352:
	ldrb	r3, [r4, #945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3357
	add	r6, r5, #24576
	ldr	r3, [r6, #2056]
	b	.L3369
.L3497:
	ldr	r3, [r6, #2056]
	b	.L3369
.L3357:
	ldr	r3, [r4, #2160]
	ldr	r0, [r4, #1464]
	cmp	r3, #0
	rsb	r1, r3, r0
	clz	r1, r1
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	beq	.L3501
	mov	r0, r5
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3502
	cmp	r0, #1
	ldreq	r2, [r4, #1464]
	moveq	r3, #0
	ldrne	r6, .L3508
	ldreq	r6, .L3508
	streqb	r3, [r2, #4]
	ldreq	r2, [r4, #1464]
	streqb	r3, [r2, #1]
.L3365:
	ldr	r5, [r6, #68]
	movw	r3, #3978
	mov	r2, r7
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3312
.L3484:
	ldr	r6, .L3508
	ldr	r1, .L3508+32
	ldr	r3, [r6, #68]
	blx	r3
	mov	r0, r5
	bl	DirectOutput
	ldr	r3, [r4, #1532]
	ldr	r2, [r4, #2796]
	ldr	r1, .L3508+8
	cmp	r3, r2
	addne	r3, r3, #13952
	addne	r3, r3, #40
	addne	r5, r5, r3, lsl #2
	strne	r8, [r5, #4]
	strne	r2, [r4, #1532]
	cmp	r0, #1
	mov	r7, r0
	ldreq	r2, [r4, #1464]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r4, #1464]
	streqb	r3, [r2, #1]
	mov	r2, r0
	ldr	r5, [r6, #68]
	movw	r3, #3701
	mov	r0, #14
	blx	r5
.L3312:
	cmn	r7, #1
	bne	.L3391
	b	.L3393
.L3374:
	ldr	r3, [r4, #3984]
	cmp	r3, #2
	beq	.L3503
.L3376:
	mov	r0, r5
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3504
	cmp	r0, #1
	ldreq	r2, [r4, #1464]
	moveq	r3, #0
	ldrne	r6, .L3508
	ldreq	r6, .L3508
	streqb	r3, [r2, #4]
	ldreq	r2, [r4, #1464]
	streqb	r3, [r2, #1]
.L3378:
	ldr	r5, [r6, #68]
	movw	r3, #4078
	mov	r2, r7
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3312
.L3318:
	cmp	r0, #1
	beq	.L3505
	cmp	r2, #0
	beq	.L3321
	ldrb	r1, [r8, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3321
	b	.L3314
.L3501:
	add	r6, r5, #24576
	ldr	ip, [r6, #2060]
	cmp	ip, #0
	beq	.L3361
	ldr	r3, [r6, #1864]
	cmp	r0, r3
	addne	r3, r5, #26368
	addne	r3, r3, #72
	beq	.L3362
.L3366:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3361
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	bne	.L3366
.L3362:
	add	r2, r5, #54016
	mov	r0, r5
	add	r2, r2, #176
	bl	InsertFrmInDPB
	cmn	r0, #1
	mov	r7, r0
	beq	.L3506
	mov	r0, r5
	bl	UpdateReflist
	mov	r0, r5
	bl	UpdateLTReflist
	ldr	ip, .L3508
	movw	r3, #3998
	mov	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	ldr	r5, [ip, #68]
	blx	r5
	b	.L3351
.L3381:
	ldr	r6, .L3508
	mov	r3, r0
	movw	r2, #4098
	ldr	r1, .L3508+16
	mov	r0, #1
	ldr	r5, [r6, #68]
	blx	r5
	mov	r2, r9
	ldr	r5, [r6, #68]
	movw	r3, #4099
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3493:
	ldr	r3, .L3508+36
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3342
	str	r2, [fp, #-52]
	mov	r3, #8
	str	r1, [fp, #-48]
	sub	r2, fp, #52
	mov	r1, #104
	ldr	r0, [r4, #4056]
	blx	r5
.L3342:
	ldr	r6, .L3508
	mov	r2, #0
	ldr	r1, [r8, #620]
	ldr	r0, [r4, #4056]
	bl	FSP_SetDisplay
	ldr	r5, [r6, #68]
	movw	r3, #3864
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3347:
	ldr	r6, .L3508
	mov	r3, r7
	movw	r2, #3907
	ldr	r1, .L3508+16
	mov	r0, #0
	ldr	r5, [r6, #68]
	blx	r5
	ldr	r5, [r6, #68]
	movw	r3, #3908
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3390:
	add	r2, r2, #1
	mov	r0, r5
	str	r2, [r6, #2060]
	bl	UpdateReflist
	mov	r0, r5
	bl	UpdateLTReflist
	b	.L3351
.L3492:
	ldr	r6, .L3508
	movw	r2, #3831
	ldr	r1, .L3508+40
	mov	r0, #1
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, .L3508+36
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3334
	mov	r3, r9
	mov	r2, r9
	mov	r1, #111
	ldr	r0, [r4, #4056]
	blx	r6
.L3334:
	ldr	r2, [r7, #200]
	cmp	r2, #0
	bne	.L3333
	b	.L3335
.L3491:
	ldrd	r0, [r6, #24]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r1, r3
	cmpeq	r0, r2
	bne	.L3329
	add	r3, r5, #54784
	add	r3, r3, #32
	ldrd	r2, [r3, #-8]
	cmp	r3, r1
	cmpeq	r2, r0
	bne	.L3474
	b	.L3329
.L3502:
	ldr	r6, .L3508
	mov	r3, r0
	mov	r2, #3968
	ldr	r1, .L3508+16
	mov	r0, #1
	ldr	r5, [r6, #68]
	blx	r5
	b	.L3365
.L3488:
	ldr	r6, .L3508
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r7, [r6, #68]
	ldr	r3, [r4, #4048]
	mov	r0, #1
	ldr	r2, [r4, #1508]
	ldr	r1, .L3508+44
	blx	r7
	ldr	r3, .L3508+36
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L3354
	ldr	r0, [r4, #4048]
	mov	r3, #8
	ldr	ip, [r4, #1508]
	sub	r2, fp, #52
	mov	r1, #104
	str	r0, [fp, #-48]
	str	ip, [fp, #-52]
	ldr	r0, [r4, #4056]
	blx	r7
.L3354:
	mov	r0, r5
	bl	H264_ClearCurrPic
	mov	r0, r5
	bl	ClearDPB
	ldr	r5, [r6, #68]
	movw	r3, #3933
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3494:
	ldr	r3, [r4, #4084]
	add	r3, r3, #1
	str	r3, [r4, #4084]
	b	.L3337
.L3499:
	ldr	r6, .L3508
	mov	r3, r8
	ldr	r2, .L3508+48
	mov	r0, #1
	ldr	r1, .L3508+52
	ldr	r5, [r6, #68]
	blx	r5
	ldr	r5, [r6, #68]
	movw	r3, #4085
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3503:
	ldrb	r3, [r4, #947]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r4, #1464]
	strne	r3, [r4, #2164]
	b	.L3376
.L3495:
	mov	r1, r7
	mov	r0, r5
	bl	SetFrmRepeatCount.part.2
	b	.L3339
.L3346:
	mov	r0, r5
	bl	IDRMemMarking
	cmp	r0, #0
	beq	.L3350
	mvn	r0, #0
	b	.L3471
.L3489:
	mov	r2, #3
	ldr	r3, [r8, #656]
	strb	r2, [r8, #1]
	ldr	r2, [r6, #564]
	add	r3, r3, r2
	str	r3, [r8, #656]
	b	.L3326
.L3505:
	cmp	r2, #1
	add	r6, r5, #54016
	add	r6, r6, #176
	ldr	r8, [r4, #2056]
	beq	.L3507
	cmp	r1, #0
	ldrne	r3, [r4, #1496]
	strne	r3, [r8, #600]
	ldrneb	r2, [r4, #947]	@ zero_extendqisi2
	b	.L3324
.L3504:
	ldr	r6, .L3508
	mov	r3, r0
	movw	r2, #4069
	ldr	r1, .L3508+16
	mov	r0, #1
	ldr	r5, [r6, #68]
	blx	r5
	b	.L3378
.L3506:
	ldr	r6, .L3508
	mov	r3, r0
	movw	r2, #3991
	ldr	r1, .L3508+16
	mov	r0, #1
	ldr	r5, [r6, #68]
	blx	r5
	mov	r2, r7
	ldr	r5, [r6, #68]
	movw	r3, #3992
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3498:
	mov	r0, r5
	bl	RemoveFrameStoreOutDPB.part.1
	b	.L3372
.L3490:
	ldr	r6, .L3508
	movw	r2, #3803
	ldr	r1, .L3508+56
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r5, [r6, #68]
	movw	r3, #3804
	mvn	r2, #0
	ldr	r1, .L3508+8
	mov	r0, #14
	blx	r5
	b	.L3393
.L3507:
	ldr	r3, [r4, #1492]
	str	r3, [r8, #564]
	ldrb	r2, [r4, #947]	@ zero_extendqisi2
	b	.L3324
.L3509:
	.align	2
.L3508:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC372
	.word	.LC366
	.word	.LC365
	.word	.LC370
	.word	.LC373
	.word	g_apple_airplay_mirrorinig_flag
	.word	.LC374
	.word	.LC367
	.word	g_event_report
	.word	.LC369
	.word	.LC371
	.word	.LANCHOR1+252
	.word	.LC375
	.word	.LC368
	UNWIND(.fnend)
	.size	StorePicInDPB, .-StorePicInDPB
	.align	2
	.global	AllocFrameStore
	.type	AllocFrameStore, %function
AllocFrameStore:
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
	add	r7, r0, #20480
	mov	r6, r0
	str	r1, [fp, #-52]
	ldrb	r5, [r7, #209]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L3511
	ldrb	r3, [r7, #210]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3573
	add	r4, r0, #53248
	ldr	r5, [r4, #3984]
	cmp	r5, #2
	beq	.L3549
	ldrb	r3, [r4, #2128]	@ zero_extendqisi2
	mov	r2, #0
	strb	r2, [r4, #945]
	cmp	r3, #1
	mov	r3, #2
	str	r3, [fp, #-48]
	bne	.L3541
.L3537:
	ldr	r2, [r4, #2136]
	ldr	r3, [r7, #228]
	cmp	r2, r3
	bne	.L3541
	ldr	r3, [r7, #240]
	cmp	r3, #0
	ldr	r3, [r4, #2132]
	beq	.L3574
	cmp	r3, #0
	beq	.L3541
.L3517:
	ldr	r3, [r4, #4068]
	ldr	r2, [r4, #4064]
	rsb	r3, r2, r3
	cmp	r3, #2
	bhi	.L3541
	ldr	r1, [r4, #1464]
	mov	r3, #1
	strb	r3, [r4, #945]
	cmp	r1, #0
	beq	.L3519
	ldr	r3, [fp, #-48]
	cmp	r3, #2
	beq	.L3575
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	beq	.L3576
.L3544:
	mov	ip, #0
	b	.L3523
.L3511:
	add	r4, r0, #53248
	ldr	r3, [r4, #3984]
	cmp	r3, #2
	strneb	r5, [r4, #945]
	strne	r5, [fp, #-48]
	beq	.L3549
.L3541:
	ldr	r8, [r4, #2792]
	mov	lr, #0
	strb	lr, [r4, #944]
	cmp	r8, lr
	beq	.L3531
	add	ip, r6, #27136
	add	r10, r6, #26368
	add	ip, ip, #176
	add	r10, r10, #72
	add	r9, r6, #24576
.L3530:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3526
	cmp	ip, #0
	beq	.L3546
	ldr	r0, [r9, #2060]
	cmp	r0, #0
	beq	.L3546
	ldr	r2, [r9, #1864]
	cmp	r2, ip
	beq	.L3526
	mov	r2, r10
	b	.L3528
.L3529:
	ldr	r1, [r2, #4]!
	cmp	r1, ip
	beq	.L3526
.L3528:
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L3529
.L3546:
	mov	r9, #672
	movw	r0, #27968
	mla	r9, r9, lr, r6
	mov	r10, #0
	mov	r8, ip
	str	ip, [r4, #1464]
	mov	r5, #1
	mov	ip, #101
	add	r1, r9, #27136
	strb	r5, [r4, #944]
	mov	r2, #504
	add	r1, r1, #184
	str	r10, [r9, r0]
	add	r0, r4, #960
	str	ip, [r4, #1508]
	bl	memcpy
	add	lr, r9, #27136
	str	r10, [r4, #1160]
	strb	r10, [lr, #179]
	str	r10, [r8, #644]
	ldr	r2, [r4, #1464]
	strb	r10, [r2, #2]
	ldr	r2, [r4, #1464]
	strb	r5, [r2, #4]
	ldr	r3, [r4, #1464]
	str	r10, [r3, #640]
	ldrb	r8, [r4, #944]	@ zero_extendqisi2
	cmp	r8, r5
	bne	.L3531
	ldr	r3, [fp, #-52]
	ldr	r0, [r4, #4056]
	clz	r1, r3
	mov	r1, r1, lsr #5
	bl	FSP_NewLogicFs
	mov	r10, r0
	mov	r1, r0
	ldr	r0, [r4, #4056]
	bl	FSP_GetLogicFs
	mvn	r3, r10
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r9, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L3532
	ldr	r3, [r6]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L3577
.L3533:
	ldr	r8, .L3580
	mov	r2, #504
	ldr	r0, [r4, #1464]
	add	r1, r9, #8
	ldr	r3, [r8, #52]
	add	r0, r0, #8
	blx	r3
	ldr	r1, [r4, #1464]
	add	r0, r6, #54016
	ldr	r3, [r8, #52]
	add	r1, r1, #8
	add	r0, r0, #192
	mov	r2, #504
	blx	r3
	ldr	r3, [r4, #1464]
	mov	ip, r10
	str	r10, [r3, #620]
	ldrsb	r3, [r9, #4]
	ldr	r1, [r4, #1464]
	str	r3, [r4, #1532]
.L3523:
	ldrb	r2, [fp, #-48]	@ zero_extendqisi2
	strb	r2, [r4, #947]
	ldrb	r3, [r7, #209]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	strb	r3, [r1, #512]
	ldrb	r3, [r4, #945]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3578
	ldr	r3, [fp, #-48]
	strb	r2, [r4, #2128]
	cmp	r3, #0
	ldr	r3, [r7, #228]
	ldr	r2, [r4, #4068]
	ldreq	r0, [fp, #-48]
	movne	r0, #0
	str	r3, [r4, #2136]
	ldr	r3, [r7, #240]
	str	ip, [r4, #2148]
	str	r2, [r4, #2144]
	str	r3, [r4, #2132]
	movne	r3, #1
	moveq	r3, r0
	strb	r3, [r4, #2152]
.L3566:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3526:
	add	lr, lr, #1
	add	ip, ip, #672
	cmp	lr, #39
	cmpls	lr, r8
	bcc	.L3530
.L3531:
	ldr	r3, .L3580
	mov	r0, #0
	ldr	r1, .L3580+4
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r6
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3573:
	add	r4, r0, #53248
	ldr	r2, [r4, #3984]
	cmp	r2, #2
	beq	.L3579
	ldrb	r2, [r4, #2128]	@ zero_extendqisi2
	strb	r3, [r4, #945]
	mov	r3, #1
	cmp	r2, #2
	str	r3, [fp, #-48]
	bne	.L3541
	b	.L3537
.L3549:
	str	r5, [fp, #-48]
.L3570:
	mov	r3, #0
	strb	r3, [r4, #945]
	b	.L3541
.L3579:
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L3570
.L3577:
	add	r2, r6, #12288
	ldr	r8, [r0, #200]
	ldr	r0, [r0, #112]
	ldr	r3, [r2, #1280]
	ldr	r2, [r2, #1276]
	mov	r3, r3, asl #4
	str	r3, [r9, #176]
	mov	r2, r2, asl #4
	str	r2, [r9, #172]
	mul	r8, r8, r3
	add	r0, r8, r0
	str	r0, [r9, #116]
	bl	MEM_Phy2Vir
	ldr	r2, [r9, #96]
	ldr	r3, [r9, #128]
	add	r3, r8, r3
	add	r8, r8, r2
	ldr	r2, [r9, #200]
	str	r8, [r9, #100]
	str	r3, [r9, #132]
	add	r8, r8, r2
	str	r8, [r9, #108]
	str	r0, [r9, #44]
	mov	r0, r3
	bl	MEM_Phy2Vir
	str	r0, [r9, #60]
	b	.L3533
.L3578:
	mov	r3, #0
	strb	r3, [r4, #2128]
	ldr	r1, [r7, #228]
	mov	r0, r3
	ldr	r2, [r4, #4068]
	str	r1, [r4, #2136]
	ldr	r1, [r7, #240]
	strb	r3, [r4, #2152]
	str	ip, [r4, #2148]
	str	r1, [r4, #2132]
	str	r2, [r4, #2144]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3574:
	cmp	r3, #0
	beq	.L3517
	b	.L3541
.L3532:
	ldr	ip, [r4, #1464]
	mov	r0, r3
	ldr	r2, .L3580
	strb	r3, [r4, #944]
	ldr	r1, .L3580+8
	strb	r3, [ip, #4]
	ldr	r3, [r2, #68]
	blx	r3
	mov	r1, r8
	mov	r0, r6
	bl	ClearAll
	mvn	r0, #0
	b	.L3566
.L3576:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3570
.L3522:
	ldr	r1, [r4, #1464]
	cmp	r1, #0
	bne	.L3544
	b	.L3541
.L3575:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3570
	b	.L3522
.L3519:
	strb	r1, [r4, #945]
	b	.L3541
.L3581:
	.align	2
.L3580:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC376
	.word	.LC377
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	add	r10, r0, #24576
	add	r2, r0, #12288
	movw	r3, #2004
	ldr	r1, [r10, #1812]
	mov	r9, #0
	ldrb	r2, [r2, #1325]	@ zero_extendqisi2
	mov	r7, r0
	add	r0, r0, #20480
	add	r8, r7, #16384
	mul	r3, r3, r1
	cmp	r2, #1
	ldr	ip, [r0, #228]
	add	r4, r7, #53248
	moveq	r1, #2
	movne	r1, r9
	str	r1, [fp, #-68]
	add	r1, r7, r3
	add	r1, r1, #22272
	str	r0, [fp, #-72]
	str	ip, [fp, #-64]
	mov	r3, r1
	add	r1, r1, #104
	ldr	ip, [r8, #3468]
	add	r3, r3, #108
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	ldr	r0, [r0, #224]
	ldr	r2, [r8, #116]
	str	r1, [fp, #-88]
	ldr	r1, [r8, #3472]
	str	r3, [r4, #1468]
	ldr	r5, [r10, #2060]
	str	ip, [fp, #-80]
	cmp	r5, r9
	str	r1, [fp, #-84]
	str	r9, [fp, #-52]
	str	r9, [fp, #-48]
	beq	.L3598
	add	r2, r2, #4
	mov	r6, #1
	mov	r3, r6, asl r2
	add	r0, r0, r6
	str	r3, [fp, #-76]
	mov	r1, r3
	bl	__aeabi_uidivmod
	ldr	r3, .L3601
	str	r9, [r8, #3472]
	mov	r0, #2
	str	r9, [r8, #3468]
	ldr	r3, [r3, #68]
	mov	r5, r1
	ldr	r1, .L3601+4
	blx	r3
	ldr	r3, .L3601
	ldr	r2, [fp, #-64]
	mov	r0, #2
	ldr	r1, .L3601+8
	ldr	r3, [r3, #68]
	mov	ip, r3
	mov	r3, r5
	blx	ip
	sub	r2, fp, #52
	sub	r1, fp, #48
	mov	r0, r7
	bl	GetMaxPOC
	ldr	r3, [fp, #-64]
	cmp	r3, r5
	strne	r9, [fp, #-60]
	bne	.L3591
	b	.L3590
.L3588:
	mov	r1, r9
	mov	r0, r7
	strb	r9, [r4, #948]
	bl	StorePicInDPB
	ldr	r1, [fp, #-76]
	subs	r3, r0, #0
	add	r0, r5, #1
	bne	.L3599
	ldr	r3, [fp, #-72]
	str	r5, [r3, #224]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-64]
	cmp	r3, r1
	mov	r5, r1
	beq	.L3590
	ldr	r3, [r10, #2060]
	ldr	r2, [fp, #-60]
	cmp	r2, r3
	bhi	.L3590
.L3591:
	mov	r1, #1
	mov	r0, r7
	bl	AllocFrameStore
	mov	r9, #0
	ldr	r1, .L3601+12
	subs	r3, r0, #0
	mov	r0, #2
	bne	.L3600
	str	r3, [fp, #-56]
	ldr	r3, .L3601
	ldr	r2, [r3, #68]
	blx	r2
	ldr	r2, [r4, #1464]
	strb	r6, [r4, #950]
	ldr	r3, [fp, #-68]
	str	r5, [r2, #624]
	ldr	r2, [r4, #1464]
	str	r5, [r4, #1472]
	str	r5, [r2, #524]
	str	r3, [r4, #1480]
	ldr	r2, [r4, #1464]
	ldr	r3, [fp, #-56]
	str	r3, [r2, #520]
	ldr	r2, [r4, #1464]
	str	r6, [r2, #644]
	ldr	r2, [r4, #1464]
	strb	r3, [r2, #4]
	ldr	r2, [r4, #1464]
	strb	r6, [r2]
	ldr	r2, [r4, #1468]
	strb	r6, [r4, #946]
	strb	r3, [r2, #3]
	ldr	r3, [r8, #120]
	cmp	r3, #0
	beq	.L3588
	str	r5, [r8, #3484]
	mov	r0, r7
	bl	DecPOC
	ldr	r3, [r8, #3464]
	ldr	r2, [fp, #-48]
	str	r3, [r4, #1484]
	ldr	r3, [r8, #3460]
	str	r3, [r4, #1488]
	ldr	r3, [r8, #3452]
	cmp	r3, r2
	str	r3, [r4, #1492]
	ldr	r3, [r8, #3456]
	str	r3, [r4, #1496]
	ldrhi	r3, [fp, #-60]
	addhi	r3, r3, #1
	strhi	r3, [fp, #-60]
	b	.L3588
.L3598:
	ldr	r3, .L3601
	mov	r0, r5
	ldr	r1, .L3601+16
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3590:
	ldr	r3, [fp, #-80]
	mov	r0, #0
	ldrb	r2, [fp, #-88]	@ zero_extendqisi2
	str	r3, [r8, #3468]
	ldr	r3, [fp, #-84]
	str	r3, [r8, #3472]
	ldr	r3, [r4, #1468]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3600:
	ldr	r3, [fp, #-80]
	mov	r0, r9
	ldrb	r2, [fp, #-88]	@ zero_extendqisi2
	ldr	r1, .L3601+20
	str	r3, [r8, #3468]
	ldr	r3, [fp, #-84]
	str	r3, [r8, #3472]
	ldr	r3, [r4, #1468]
	strb	r2, [r3, #3]
	ldr	r3, .L3601
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3599:
	ldr	r2, [fp, #-80]
	mov	r0, r9
	ldrb	lr, [fp, #-88]	@ zero_extendqisi2
	ldr	r1, .L3601+24
	str	r2, [r8, #3468]
	ldr	r2, [fp, #-84]
	str	r2, [r8, #3472]
	movw	r2, #6524
	ldr	ip, [r4, #1468]
	strb	lr, [ip, #3]
	ldr	ip, .L3601
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3602:
	.align	2
.L3601:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC379
	.word	.LC380
	.word	.LC382
	.word	.LC378
	.word	.LC381
	.word	.LC383
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r8, .L3616
	mov	r5, r0
	ldr	r4, [r0, #352]
	mov	r7, r1
	movw	r2, #57352
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
	beq	.L3613
	add	r6, r5, #12288
	mov	r1, #32
	mov	r2, #256
	mov	r3, #136
	str	r1, [r6, #1288]
	str	r2, [r6, #1292]
	str	r3, [r6, #1284]
.L3605:
	ldr	r0, [r7, #668]
	add	r4, r5, #53248
	bl	MEM_Phy2Vir
	ldr	lr, [r6, #1288]
	ldr	r3, [r5]
	mov	r2, #4000
	ldr	r1, [r6, #1292]
	mul	r2, r2, lr
	ldr	r3, [r3, #664]
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
	str	r0, [r4, #3976]
	bne	.L3614
	ldr	r7, [r7, #688]
	mov	r10, r7
	adds	r7, r3, #0
	movne	r7, #1
	cmp	r10, #0
	movne	r7, #0
	cmp	ip, #0
	moveq	ip, #0
	andne	ip, r7, #1
	cmp	ip, #0
	beq	.L3608
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
	ldr	r0, [r4, #3976]
.L3608:
	add	ip, r5, #16384
	movw	r2, #4060
	ldr	r3, [r8, #48]
	mov	r7, #1
	str	r1, [ip, #1236]
	mov	r1, #0
	ldr	ip, [r6, #1284]
	str	lr, [r6, #2052]
	mov	r6, r1
	mul	r2, r2, ip
	blx	r3
	add	r3, r5, #57344
	str	r6, [r4, #4000]
	mov	ip, #40
	str	r6, [r4, #4004]
	mov	r1, #17
	str	r6, [r4, #4008]
	mov	r2, #25
	str	r6, [r4, #4012]
	mov	r0, r5
	str	r6, [r4, #4016]
	str	r6, [r4, #4020]
	str	r6, [r4, #4024]
	str	r6, [r4, #4028]
	str	r6, [r4, #3992]
	str	r6, [r4, #2820]
	str	r6, [r4, #2824]
	str	r6, [r4, #2828]
	str	r6, [r4, #2832]
	str	r6, [r4, #2836]
	str	r6, [r4, #2800]
	str	r6, [r4, #2808]
	str	r6, [r4, #4060]
	str	r6, [r4, #2812]
	str	ip, [r4, #2792]
	str	r1, [r4, #2796]
	str	r2, [r4, #2816]
	str	r7, [r3]
	bl	VCTRL_GetChanIDByCtx
	ldr	r3, .L3616
	cmn	r0, #1
	str	r0, [r4, #4056]
	beq	.L3615
	mov	r1, r6
	mov	r0, r5
	bl	ClearAll
	mov	r0, r7
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3613:
	ldr	r3, [r7, #752]
	add	r6, r5, #12288
	str	r3, [r6, #1288]
	ldr	r3, [r7, #756]
	str	r3, [r6, #1292]
	ldr	r3, [r7, #744]
	str	r3, [r6, #1284]
	b	.L3605
.L3614:
	ldr	r4, [r8, #68]
	movw	r3, #12748
	ldr	r2, .L3616+4
	mov	r0, #0
	ldr	r1, .L3616+8
	blx	r4
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3615:
	ldr	r3, [r3, #68]
	mov	r0, r6
	ldr	r1, .L3616+12
	blx	r3
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3617:
	.align	2
.L3616:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+268
	.word	.LC384
	.word	.LC385
	UNWIND(.fnend)
	.size	H264DEC_Init, .-H264DEC_Init
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
	add	r9, r0, #12288
	add	r7, r0, #20480
	mov	r5, r0
	ldr	r2, [r9, #1304]
	mov	r8, #2208
	ldr	r0, [r7, #220]
	add	r4, r5, #53248
	ldr	r3, [r9, #1300]
	mov	r1, #4000
	mla	r8, r8, r0, r2
	ldrb	r2, [r4, #944]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [r8, #28]
	mla	r3, r1, r2, r3
	str	r3, [fp, #-56]
	beq	.L3619
	ldr	r3, [r4, #1464]
	cmp	r3, #0
	beq	.L3620
	ldrb	r6, [r3, #1]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L3762
.L3621:
	mov	r3, #0
	strb	r3, [r4, #944]
.L3619:
	sub	r1, fp, #48
	mov	r0, r5
	bl	GetReRangeFlag
	ldr	r3, [fp, #-56]
	ldr	r2, [r9, #2052]
	ldr	r3, [r3, #744]
	cmp	r2, r3
	mov	r10, r0
	beq	.L3763
.L3622:
	ldr	r3, .L3777
	add	r0, r5, #13568
	ldr	r1, [fp, #-56]
	add	r0, r0, #28
	mov	r2, #4000
	mov	ip, r3
	mov	r3, #0
	strb	r3, [r1, #24]
	ldr	r3, [ip, #56]
	blx	r3
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r5]
	beq	.L3624
.L3774:
	ldr	r6, [r3, #776]
	cmp	r6, #0
	bne	.L3625
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L3764
.L3625:
	ldr	r3, [r4, #4016]
	cmp	r10, #0
	add	r3, r3, #1
	str	r3, [r4, #4016]
	bne	.L3636
	ldr	r3, [r5]
	ldr	r3, [r3, #908]
	cmp	r3, #1
	beq	.L3636
	mov	r0, r5
	bl	FlushDPB
	cmp	r0, #0
	bne	.L3765
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	ldrne	r3, .L3777
	strne	r3, [fp, #-60]
	bne	.L3683
.L3641:
	ldr	r3, [r5]
	ldr	r3, [r3, #908]
	cmp	r3, #1
	beq	.L3644
.L3754:
	add	r6, r5, #16384
.L3635:
	ldr	r2, [r6, #1236]
	ldr	r3, [r8, #24]
	cmp	r2, r3
	bne	.L3647
	ldrb	r3, [r8, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3766
.L3647:
	ldr	r3, .L3777
	add	r0, r5, #17408
	mov	r1, r8
	add	r0, r0, #188
	mov	r2, r3
	str	r3, [fp, #-60]
	mov	r3, #0
	strb	r3, [r8, #20]
	ldr	r3, [r2, #56]
	mov	r2, #2208
	blx	r3
.L3648:
	ldr	r3, [r6, #3444]
	ldr	r2, [r6, #116]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r7, #224]
	strne	r3, [r4, #2136]
	ldr	r3, [r4, #3984]
	cmp	r3, #2
	beq	.L3650
	ldr	r10, [r5]
	ldr	r3, [r10, #12]
	sub	r3, r3, #2
	cmp	r3, #1
	bls	.L3650
	ldr	r3, [r7, #228]
	ldr	r8, [r7, #224]
	cmp	r3, r8
	str	r3, [fp, #-64]
	beq	.L3651
	mov	r1, #1
	add	r2, r2, #4
	mov	r2, r1, asl r2
	add	r0, r8, r1
	str	r2, [fp, #-68]
	mov	r1, r2
	bl	__aeabi_uidivmod
	ldr	r3, [fp, #-64]
	cmp	r3, r1
	beq	.L3684
	ldr	r1, [r10, #680]
	ldr	r2, [fp, #-68]
	cmp	r1, #0
	bne	.L3652
	ldr	r1, [r10, #708]
	cmp	r1, #1
	beq	.L3767
.L3653:
	cmp	r3, r8
	bls	.L3655
	ldr	r1, [r6, #1192]
	rsb	r8, r8, r3
	cmp	r1, r8
	bcs	.L3652
	ldrb	r1, [r7, #208]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L3652
	cmp	r3, #0
	mov	r0, r5
	subeq	r3, r2, #1
	subne	r3, r3, #1
	str	r3, [r7, #224]
	bl	FlushDPB
	subs	r3, r0, #0
	beq	.L3755
	ldr	r2, [fp, #-60]
	mov	r0, #0
	ldr	r1, .L3777+4
	ldr	r4, [r2, #68]
	movw	r2, #6837
	blx	r4
	mvn	r0, #0
.L3752:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3636:
	ldr	r3, .L3777
	mov	r0, #22
	ldr	r1, .L3777+8
	str	r3, [fp, #-60]
	ldr	r3, [r3, #68]
	blx	r3
	add	r3, r5, #57344
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L3768
.L3638:
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	bne	.L3683
	cmp	r10, #0
	beq	.L3641
.L3644:
	add	r6, r5, #16384
	add	r3, r5, #55808
	add	r3, r3, #232
	mov	r0, r5
	ldr	r1, [r6, #1192]
	str	r1, [r4, #2796]
	ldr	r2, [r6, #1172]
	ldrb	ip, [r9, #1326]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	r10, [r6, #1168]
	rsb	ip, ip, #2
	str	r1, [sp]
	mov	r2, r2, asl #4
	add	r10, r10, #1
	mul	r2, ip, r2
	mov	r10, r10, asl #4
	mov	r1, r10
	str	r2, [fp, #-60]
	bl	H264_ArrangeVahbMem
	cmp	r0, #1
	beq	.L3769
.L3758:
	ldr	r3, [r5]
	ldr	r3, [r3, #908]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L3752
	ldr	r3, .L3777
	mov	r4, #0
	mov	r0, r4
	str	r4, [r9, #1276]
	str	r4, [r9, #1280]
	ldr	r3, [r3, #68]
	ldr	r1, .L3777+12
	blx	r3
	mov	r1, r4
	mov	r0, r5
	bl	ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3684:
	mov	r8, r3
.L3651:
	ldr	r3, [r7, #240]
	mov	r0, r5
	cmp	r3, #0
	strne	r8, [r7, #224]
	str	r8, [r6, #3484]
	bl	DecPOC
	mov	r1, #0
	mov	r0, r5
	bl	AllocFrameStore
	cmp	r0, #0
	bne	.L3770
	strb	r0, [r4, #951]
	mov	r1, #1
	strb	r1, [r4, #944]
	mvn	ip, #0
	ldrb	r3, [r7, #211]	@ zero_extendqisi2
	strb	r3, [r4, #950]
	ldr	r2, [r7, #228]
	str	r2, [r4, #1472]
	ldr	r3, [r7, #240]
	str	r2, [fp, #-64]
	str	r3, [r4, #1480]
	ldr	lr, [r6, #3464]
	str	r3, [fp, #-68]
	str	lr, [r4, #1484]
	ldr	lr, [r6, #3460]
	str	lr, [r4, #1488]
	ldr	lr, [r6, #3452]
	str	lr, [r4, #1492]
	ldr	lr, [r6, #3456]
	str	ip, [r4, #1528]
	strb	r0, [r4, #946]
	strb	r0, [r4, #949]
	str	lr, [r4, #1496]
	strb	r0, [r4, #948]
	ldrb	r10, [r7, #209]	@ zero_extendqisi2
	cmp	r10, #0
	strneb	r1, [r7, #209]
	ldrb	r8, [r9, #1326]	@ zero_extendqisi2
	ldr	r0, [r6, #1172]
	movne	r10, r1
	rsb	r8, r8, #2
	movne	r1, #2
	mla	r8, r0, r8, r8
	mov	r0, r8
	bl	__aeabi_uidiv
	str	r8, [r4, #1520]
	cmp	r10, #0
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-68]
	movne	r10, #0
	str	r0, [r4, #1516]
	ldr	ip, [r6, #1168]
	add	r1, ip, #1
	str	r1, [r4, #1512]
	mul	r1, r1, r0
	str	r1, [r4, #1524]
	ldrb	r1, [r6, #1212]	@ zero_extendqisi2
	strb	r1, [r4, #952]
	movne	r1, r10
	bne	.L3671
	ldrb	r1, [r9, #1327]	@ zero_extendqisi2
	cmp	r1, #0
	movne	r10, #1
	movne	r1, r10
.L3671:
	cmp	r3, #0
	add	r3, r5, #24576
	strb	r1, [r4, #953]
	movw	r0, #2004
	str	r10, [r4, #3972]
	add	lr, r5, #54016
	strne	r2, [r7, #224]
	movw	r8, #54224
	ldr	r2, [r3, #1812]
	ldr	r10, [fp, #-56]
	ldr	r1, .L3777+16
	mla	r2, r0, r2, r5
	mov	r0, #29
	add	r2, r2, #22272
	add	r2, r2, #108
	str	r2, [r4, #1468]
	ldr	ip, [r5]
	ldrd	r2, [ip, #48]
	strd	r2, [lr, #200]
	ldrd	r2, [ip, #64]
	strd	r2, [r5, r8]
	ldrd	r2, [ip, #80]
	strd	r2, [lr, #216]
	mvn	r2, #0
	ldr	r7, [ip, #96]
	mvn	r3, #0
	str	r7, [r4, #1028]
	ldr	r7, [ip, #100]
	str	r7, [r4, #1032]
	ldr	r7, [ip, #104]
	str	r7, [r4, #1036]
	ldr	r7, [ip, #120]
	str	r7, [r4, #1040]
	ldr	r7, [r10, #752]
	str	r7, [r4, #1192]
	ldr	r7, [r10, #756]
	ldr	r10, [fp, #-60]
	str	r7, [r4, #1196]
	strd	r2, [ip, #48]
	ldrd	r2, [lr, #200]
	ldr	r7, [r10, #68]
	blx	r7
	ldrd	r2, [r5, r8]
	ldr	r7, [r10, #68]
	mov	r0, #29
	ldr	r1, .L3777+20
	blx	r7
	ldr	r3, [r6, #1168]
	add	r0, r5, #54016
	ldr	r7, .L3777
	add	r3, r3, #1
	add	r0, r0, #192
	mov	r3, r3, asl #4
	str	r3, [r4, #1124]
	ldrb	r2, [r9, #1326]	@ zero_extendqisi2
	ldr	r1, [r6, #1172]
	rsb	r3, r2, #2
	mla	r3, r1, r3, r3
	mov	r3, r3, asl #4
	str	r3, [r4, #1128]
	ldr	r2, [r9, #2056]
	ldr	r3, [r9, #1364]
	subs	r2, r2, #1
	ldr	r1, [r9, #1360]
	movne	r2, #1
	and	r1, r1, #7
	mov	r3, r3, asl #5
	mov	r2, r2, asl #2
	orr	r2, r2, r1, asl #14
	uxtb	r3, r3
	orr	r3, r2, r3
	str	r3, [r4, #1120]
	bl	SetAspectRatio
	ldrb	r3, [r4, #947]	@ zero_extendqisi2
	ldr	r2, [r4, #1464]
	adds	r3, r3, #0
	ldr	r1, [r4, #4016]
	movne	r3, #1
	cmp	r2, #0
	str	r3, [r4, #1108]
	str	r1, [r4, #1164]
	beq	.L3771
	ldr	r3, [r4, #1120]
	ldr	r1, [fp, #-56]
	str	r3, [r2, #168]
	ldr	r3, [r4, #1464]
	ldr	r2, [r4, #1108]
	str	r2, [r3, #156]
	ldr	r3, [r4, #1464]
	ldr	r2, [r4, #1024]
	str	r2, [r3, #72]
	ldr	r3, [r4, #1464]
	ldr	r2, [r4, #1020]
	str	r2, [r3, #68]
	ldr	r3, [r4, #1464]
	ldr	r2, [r4, #1124]
	str	r2, [r3, #172]
	ldr	r3, [r4, #1464]
	ldr	r2, [r4, #1128]
	str	r2, [r3, #176]
	ldr	r3, [r1, #3992]
	ldr	r2, [r4, #1464]
	str	r3, [r2, #188]
	str	r3, [r4, #1140]
	ldr	r2, [r4, #1464]
	ldr	r3, [r1, #3996]
	str	r3, [r2, #192]
	str	r3, [r4, #1144]
	ldr	r2, [r4, #1464]
	ldr	r3, [r1, #3984]
	str	r3, [r2, #180]
	str	r3, [r4, #1132]
	ldr	r2, [r4, #1464]
	ldr	r3, [r1, #3988]
	str	r3, [r2, #184]
	str	r3, [r4, #1136]
	ldr	r3, [r4, #1464]
	ldr	r0, [r4, #4056]
	ldr	r1, [r3, #620]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L3674
	ldr	r3, [r4, #1108]
	mov	r1, #0
	ldr	r2, [r0, #4]
	subs	r3, r3, r1
	ldr	r0, [r4, #4056]
	movne	r3, #1
	bl	FSP_SetStoreType
.L3674:
	add	r8, r5, #54272
	add	lr, r5, #56064
	ldr	r7, [r4, #2820]
	add	lr, lr, #8
	mov	r0, r8
	add	r8, r8, #144
	add	r0, r0, #160
	mov	r6, #0
	mov	r2, r8
.L3678:
	ldr	r3, [r2, #4]!
	cmp	r3, #0
	beq	.L3772
.L3675:
	cmp	r2, r0
	bne	.L3678
	cmp	r7, #0
	beq	.L3679
	ble	.L3679
	add	r6, r7, #14016
	mov	r9, #0
	add	r6, r6, #2
	add	r6, r5, r6, lsl #2
.L3680:
	ldr	r1, [r6, #-4]!
	sub	r7, r7, #1
	ldr	r0, [r4, #4056]
	bl	FreeUsdByDec
	cmp	r7, #0
	str	r9, [r6]
	bne	.L3680
.L3679:
	mov	r3, #0
.L3682:
	ldr	r1, [r8, #4]!
	cmp	r1, #0
	ldrne	r2, [r4, #1464]
	addne	r2, r2, r3, lsl #2
	add	r3, r3, #1
	strne	r1, [r2, #220]
	cmp	r3, #4
	bne	.L3682
	mov	r0, r5
	mov	r5, #0
	str	r5, [r4, #2820]
	str	r5, [r4, #1500]
	bl	CalcPicNum
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3652:
	ldr	r1, [r10, #684]
.L3654:
	bics	r8, r1, #1024
	beq	.L3773
.L3650:
	ldr	r8, [r7, #228]
	b	.L3651
.L3763:
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3622
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r5]
	bne	.L3774
.L3624:
	ldr	r3, [r3, #908]
	cmp	r3, #1
	bne	.L3754
	b	.L3625
.L3772:
	cmp	r7, #0
	beq	.L3675
	ldr	r1, [r4, #2824]
	subs	r7, r7, #1
	str	r1, [r2]
	beq	.L3676
	mov	r1, lr
.L3677:
	add	r3, r3, #1
	ldr	ip, [r1, #4]!
	cmp	r3, r7
	str	ip, [r1, #-4]
	bne	.L3677
.L3676:
	add	r3, r7, #14016
	add	r3, r3, #2
	str	r6, [r5, r3, asl #2]
	str	r7, [r4, #2820]
	b	.L3675
.L3766:
	ldr	r3, .L3777
	str	r3, [fp, #-60]
	b	.L3648
.L3764:
	ldr	r3, [r4, #4016]
	cmp	r10, #0
	add	r3, r3, #1
	str	r3, [r4, #4016]
	beq	.L3626
	mov	r0, r5
	bl	FlushDPB
	subs	r3, r0, #0
	beq	.L3626
	ldr	ip, .L3777
	mov	r0, r6
	movw	r2, #6621
	ldr	r1, .L3777+4
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3752
.L3626:
	mov	r0, r5
	bl	InitDPB
	subs	r3, r0, #0
	bne	.L3775
	add	r6, r5, #16384
	ldrb	r2, [r9, #1326]	@ zero_extendqisi2
	cmp	r10, #0
	ldr	r3, [r6, #1172]
	rsb	r10, r2, #2
	ldr	r2, [r6, #1168]
	add	r3, r3, #1
	add	r2, r2, #1
	mov	r3, r3, asl #4
	mov	r2, r2, asl #4
	str	r2, [fp, #-60]
	mul	r10, r10, r3
	beq	.L3629
	ldr	r3, [r9, #1276]
	cmp	r3, #0
	bne	.L3629
	ldr	ip, [r6, #1192]
	str	ip, [r4, #2796]
	ldr	r3, [r5]
	ldr	r1, [r3, #736]
	cmp	r2, r1
	bhi	.L3630
	ldr	r2, [r3, #740]
	cmp	r10, r2
	str	r2, [fp, #-64]
	bhi	.L3630
	add	lr, r5, #24576
	ldr	r2, [r3, #760]
	ldr	lr, [lr, #2056]
	cmp	r2, lr
	bcc	.L3776
	ldr	r0, [r3, #764]
	cmp	r0, #0
	mov	r0, r5
	moveq	ip, #1
	streq	ip, [r4, #2796]
	ldreq	r1, [r3, #736]
	ldreq	r3, [r3, #740]
	str	ip, [sp]
	streq	r3, [fp, #-64]
	add	r3, r5, #55808
	ldr	r2, [fp, #-64]
	add	r3, r3, #232
	bl	H264_ArrangeVahbMem
	cmp	r0, #1
	bne	.L3758
.L3629:
	ldr	r3, [fp, #-60]
	mov	r10, r10, lsr #4
	str	r10, [r9, #1280]
	mov	r3, r3, lsr #4
	str	r3, [r9, #1276]
	b	.L3635
.L3762:
	ldr	r1, [r3, #620]
	mov	r2, #1
	ldr	r0, [r4, #4056]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #1464]
	strb	r6, [r3, #1]
	ldr	r3, [r4, #1464]
	strb	r6, [r3, #4]
	b	.L3621
.L3769:
	ldr	r3, [fp, #-60]
	mov	r10, r10, lsr #4
	str	r10, [r9, #1276]
	mov	r3, r3, lsr #4
	str	r3, [r9, #1280]
	b	.L3635
.L3768:
	mov	r0, r5
	bl	GetBackPicFromVOQueue
	b	.L3638
.L3773:
	mov	r0, r5
	bl	DecGap
	cmp	r0, #0
	beq	.L3650
	ldr	r3, [fp, #-60]
	mov	r0, r8
	movw	r2, #6870
	ldr	r1, .L3777+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3752
.L3655:
	rsb	r1, r8, r3
	ldr	r0, [r6, #1192]
	add	r1, r1, r2
	cmp	r0, r1
	bcs	.L3652
	ldrb	r1, [r7, #208]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L3652
	cmp	r3, #0
	mov	r0, r5
	subeq	r3, r2, #1
	subne	r3, r3, #1
	str	r3, [r7, #224]
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L3665
.L3755:
	ldr	r3, [r5]
	ldr	r1, [r3, #684]
	b	.L3654
.L3620:
	ldr	r3, .L3777
	mov	r0, #22
	ldr	r2, .L3777+28
	ldr	r1, .L3777+32
	mov	ip, r3
	movw	r3, #6587
	ldr	r6, [ip, #68]
	blx	r6
	b	.L3621
.L3767:
	ldr	r1, [r10, #704]
	cmp	r1, #0
	bne	.L3653
	ldr	r1, [r10, #712]
	cmp	r1, #0
	bne	.L3653
	ldr	r1, [r10, #684]
	add	r0, r1, #1024
	cmp	r0, #2048
	bhi	.L3654
	b	.L3653
.L3770:
	ldr	r3, [fp, #-60]
	movw	r2, #6895
	ldr	r1, .L3777+36
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3752
.L3683:
	ldr	r3, [fp, #-60]
	movw	r2, #6756
	ldr	r1, .L3777+40
	ldr	r4, [r3, #68]
	mov	r3, r0
	mov	r0, #0
	blx	r4
	mvn	r0, #0
	b	.L3752
.L3771:
	ldr	r4, [r7, #68]
	movw	r3, #6982
	ldr	r2, .L3777+28
	mov	r0, #22
	ldr	r1, .L3777+44
	blx	r4
	mvn	r0, #0
	b	.L3752
.L3765:
	ldr	ip, .L3777
	mov	r3, r0
	movw	r2, #6747
	mov	r0, r10
	ldr	r1, .L3777+4
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3752
.L3775:
	ldr	ip, .L3777
	movw	r2, #6630
	ldr	r1, .L3777+40
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3752
.L3630:
	ldr	r3, .L3777
	mov	r0, #0
	ldr	r1, .L3777+48
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3752
.L3776:
	ldr	r3, .L3777
	ldr	r1, .L3777+52
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3752
.L3665:
	ldr	r2, [fp, #-60]
	mov	r0, #0
	ldr	r1, .L3777+4
	ldr	r4, [r2, #68]
	movw	r2, #6855
	blx	r4
	mvn	r0, #0
	b	.L3752
.L3778:
	.align	2
.L3777:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC352
	.word	.LC391
	.word	.LC390
	.word	.LC394
	.word	.LC395
	.word	.LC392
	.word	.LANCHOR1+284
	.word	.LC386
	.word	.LC393
	.word	.LC387
	.word	.LC396
	.word	.LC388
	.word	.LC389
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
	add	r5, r0, #53248
	ldr	r3, .L3832
	mov	r4, r0
	ldr	r2, [r5, #4000]
	mov	r0, #22
	ldr	r1, .L3832+4
	add	r6, r4, #20480
	sub	r2, r2, #1
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r4, #368]
	mov	r0, r4
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r6, #211]
	ldr	r3, [r3, #76]
	str	r3, [r6, #240]
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L3826
	mov	r0, r4
	bl	ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L3826
	ldr	r2, [r5, #3980]
	cmp	r2, #0
	moveq	r3, r2
	beq	.L3786
	add	r10, r4, #55296
	mov	r3, r0
	add	r10, r10, #128
	mov	r8, r0
	mov	r7, r0
.L3794:
	ldr	ip, [r10, #4]!
	ldr	lr, [ip, #8]
	ldr	r1, [ip, #36]
	cmp	lr, #0
	ldrne	r9, [ip, #12]
	moveq	r9, lr
	cmp	r1, #0
	moveq	ip, r1
	ldrne	ip, [ip, #40]
	cmp	r8, #0
	addeq	r3, r9, r3
	addeq	r3, r3, ip
	beq	.L3792
	cmp	lr, r8
	add	r3, ip, r3
	addhi	r0, r8, r0
	rsbhi	r0, r0, lr
	movls	r0, r9
	addhi	r0, r0, r9
	add	r3, r3, r0
.L3792:
	cmp	r1, #0
	add	r7, r7, #1
	movne	r8, r1
	movne	r0, ip
	moveq	r8, lr
	moveq	r0, r9
	cmp	r7, r2
	bne	.L3794
.L3786:
	ldr	ip, [r5, #1516]
	movw	r0, #1620
	ldr	r1, [r5, #1512]
	str	r3, [r5, #4040]
	mul	r1, r1, ip
	cmp	r1, r0
	movgt	r1, r1, asl #8
	ble	.L3827
.L3796:
	add	r7, r4, #12288
	ldr	r0, [r7, #1284]
	cmp	r0, r2
	bls	.L3797
	cmp	r1, r3
	bcc	.L3797
	ldrb	r3, [r6, #213]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3828
.L3800:
	mov	r0, r4
	bl	PicTypeStatistic
	mov	r0, r4
	bl	DecList
	cmp	r0, #0
	bne	.L3829
	mov	r0, r4
	bl	IsRefListWrong
	subs	r6, r0, #0
	bne	.L3830
	mov	r0, r4
	bl	CalcStreamBits
	mov	r0, r4
	bl	WriteSliceMsg
	mov	r0, r4
	bl	ExitSlice
	ldr	r3, [r5, #4036]
	mov	r0, r6
	mov	r2, #1
	add	r3, r3, r2
	str	r2, [r5, #2800]
	str	r3, [r5, #4036]
.L3783:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3827:
	mov	r0, r1, asl #9
	sub	r1, r0, r1, asl #7
	cmp	r1, #16384
	movlt	r1, #16384
	b	.L3796
.L3828:
	ldr	r3, .L3832
	mov	r0, #2
	ldr	r1, .L3832+8
	ldr	r3, [r3, #68]
	blx	r3
	ldrb	r3, [r6, #211]	@ zero_extendqisi2
	ldrb	r1, [r5, #947]	@ zero_extendqisi2
	mov	r2, #0
	cmp	r3, #5
	ldr	r3, [r5, #4020]
	str	r2, [r5, #4036]
	mov	r0, r4
	streq	r3, [r5, #4032]
	cmp	r1, r2
	add	r3, r3, #1
	str	r3, [r5, #4020]
	ldreq	r3, [r5, #4024]
	ldrne	r3, [r5, #4028]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r5, #4024]
	strne	r3, [r5, #4028]
	bl	InitPic
	cmn	r0, #2
	beq	.L3783
	cmp	r0, #0
	bne	.L3831
	mov	r0, r4
	bl	WritePicMsg
	b	.L3800
.L3826:
	ldr	r3, .L3832
	mov	r0, #1
	ldr	r1, .L3832+12
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L3832+16
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3824
	sub	r2, fp, #44
	mvn	r1, #0
	ldr	r0, [r5, #4056]
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #100
	blx	r6
.L3824:
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L3783
.L3797:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L3832
	ldr	r6, [r1, #68]
	ldr	r1, .L3832+20
	blx	r6
	ldr	r2, [r7, #1284]
	ldr	r3, [r5, #3980]
	cmp	r3, r2
	bcc	.L3799
	ldr	r1, .L3832+16
	ldr	r6, [r1]
	cmp	r6, #0
	beq	.L3799
	str	r3, [fp, #-52]
	mov	r1, #108
	str	r2, [fp, #-48]
	mov	r3, #8
	sub	r2, fp, #52
	ldr	r0, [r5, #4056]
	blx	r6
.L3799:
	ldr	r3, .L3832
	mov	r0, #1
	ldr	r1, .L3832+24
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3783
.L3829:
	ldr	r3, .L3832
	mov	r2, r0
	ldr	r1, .L3832+28
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3783
.L3830:
	ldr	r3, .L3832
	mov	r0, #1
	ldr	r1, .L3832+32
	ldr	r3, [r3, #68]
	blx	r3
	b	.L3824
.L3831:
	ldr	r3, .L3832
	mov	r0, #1
	ldr	r1, .L3832+36
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3783
.L3833:
	.align	2
.L3832:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC342
	.word	.LC399
	.word	.LC343
	.word	g_event_report
	.word	.LC397
	.word	.LC398
	.word	.LC401
	.word	.LC402
	.word	.LC400
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	ip, [r0, #368]
	add	r4, r0, #53248
	mov	r6, r1
	mov	r5, r0
	ldr	r3, [ip, #68]
	cmp	r3, #0
	movne	r1, ip
	movne	r2, #0
	ldrne	r3, [r4, #4040]
	beq	.L3839
.L3838:
	ldr	r0, [r1, #12]
	add	r2, r2, #1
	add	r1, r1, #28
	add	r3, r3, r0
	str	r3, [r4, #4040]
	ldr	r0, [ip, #68]
	cmp	r0, r2
	bhi	.L3838
.L3839:
	add	r8, r5, #13504
	mov	r10, #0
	add	r8, r8, #24
	strb	r10, [ip]
	mov	r1, #32
	ldr	r9, .L4004
	mov	r0, r8
	bl	BsGet
	ldr	r3, [r5, #368]
	ldr	r1, .L4004+4
	mov	r7, r0
	and	r0, r0, #31
	strb	r0, [r3, #2]
	ubfx	ip, r7, #5, #2
	ldr	r3, [r5, #368]
	ubfx	r2, r7, #7, #1
	mov	r0, #22
	str	ip, [r3, #76]
	ldr	r3, [r5, #368]
	str	r2, [r3, #80]
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #32
	str	r3, [r2, #64]
	str	r10, [r4, #3996]
	ldr	r3, [r5, #368]
	ldr	r2, [r4, #4000]
	ldr	r10, [r9, #68]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	blx	r10
	ldr	r3, [r4, #4000]
	movw	r2, #371
	cmp	r3, r2
	beq	.L3998
.L3837:
	add	r3, r3, #1
	str	r3, [r4, #4000]
	ldr	r3, [r5, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #20
	beq	.L3999
.L3840:
	sub	r3, r2, #1
	cmp	r3, #29
	ldrls	pc, [pc, r3, asl #2]
	b	.L3848
.L3850:
	.word	.L3849
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3849
	.word	.L3851
	.word	.L3852
	.word	.L3853
	.word	.L3854
	.word	.L3855
	.word	.L3856
	.word	.L3857
	.word	.L3858
	.word	.L3848
	.word	.L3852
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3859
	.word	.L3849
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3848
	.word	.L3860
.L3860:
	ldr	r3, [r9, #68]
	mov	r2, #30
	ldr	r1, .L4004+8
	mov	r0, #22
	blx	r3
	cmp	r6, #0
	bne	.L3875
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L3875
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	str	r6, [r5, #368]
.L3875:
	mov	r1, #32
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r8
	bl	BsGet
	ldr	r3, .L4004+12
	rev	r6, r6
	ldr	r2, [r3, #440]
	ldr	r3, [r3, #436]
	rev	r0, r0
	cmp	r0, r2
	cmpeq	r6, r3
	bne	.L3980
	ldr	r6, .L4004+16
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3876
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #4056]
	blx	r7
.L3876:
	mov	r7, #0
	mov	r0, r5
	str	r7, [r5, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L3980
.L3994:
	ldr	r5, [r6]
	cmp	r5, r7
	beq	.L3978
	ldr	r0, [r4, #4056]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #113
	blx	r5
.L3978:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3849:
	ldr	r6, [r9, #68]
	mov	r0, #22
	ldr	r3, [r4, #4012]
	ldr	r1, .L4004+20
	blx	r6
	ldr	r2, [r5, #368]
	add	r3, r5, #20480
	mov	r0, r5
	ldr	r6, .L4004
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	strb	r1, [r3, #211]
	ldr	r2, [r2, #76]
	str	r2, [r3, #240]
	bl	SliceCheck
	subs	r8, r0, #0
	bne	.L4000
	mov	r0, r5
	bl	H264_DecSlice
	cmn	r0, #2
	beq	.L3976
	cmp	r0, #0
	beq	.L3980
	add	r6, r5, #56064
	add	r7, r5, #54272
	add	r7, r7, #144
	mov	r5, r6
	add	r6, r6, #4
	add	r5, r5, #20
.L3866:
	ldr	r1, [r6, #4]!
	cmp	r1, #0
	beq	.L3864
	ldr	r0, [r4, #4056]
	bl	FreeUsdByDec
	str	r8, [r6]
.L3864:
	ldr	r1, [r7, #4]!
	cmp	r1, #0
	beq	.L3865
	ldr	r0, [r4, #4056]
	bl	FreeUsdByDec
	str	r8, [r7]
.L3865:
	cmp	r6, r5
	bne	.L3866
	ldr	r2, .L4004+16
	mov	r3, #0
	str	r3, [r4, #2820]
	ldr	r5, [r2]
	cmp	r5, r3
	bne	.L3979
	b	.L3978
.L3851:
	ldr	r1, .L4004+24
	mov	r2, #6
	ldr	r3, [r9, #68]
	mov	r0, #22
	blx	r3
	mov	r0, r5
	bl	H264_DecSEI
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L3871
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3871:
	cmp	r6, #0
	bne	.L4001
.L3980:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3852:
	ldr	r1, .L4004+28
	mov	r0, #22
	ldr	r6, [r9, #68]
	ldr	r3, [r4, #4004]
	blx	r6
	mov	r0, r5
	bl	H264_DecSPS
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L3869
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3869:
	cmp	r6, #0
	bne	.L4002
	ldr	r3, [r4, #4004]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r4, #4004]
	b	.L3976
.L3856:
	ldr	r3, [r9, #68]
	mov	r2, #11
	ldr	r1, .L4004+32
	mov	r0, #22
	blx	r3
	mov	r1, #32
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r8
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r6, r3
	bne	.L3989
	ldr	r6, .L4004+16
	add	r3, r5, #12288
	mov	r2, #1
	strb	r2, [r3, #1272]
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3874
	mov	r3, #0
	mov	r1, #117
	mov	r2, r3
	ldr	r0, [r4, #4056]
	blx	r7
.L3874:
	mov	r7, #0
	mov	r0, r5
	str	r7, [r5, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L3989
	b	.L3994
.L3857:
	ldr	r3, [r9, #68]
	mov	r2, #12
	ldr	r1, .L4004+36
.L3987:
	mov	r0, #22
	blx	r3
.L3989:
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L3980
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #368]
.L3976:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3858:
	ldr	r3, [r9, #68]
	mov	r2, #13
	ldr	r1, .L4004+40
	b	.L3987
.L3859:
	ldr	r3, [r9, #68]
	mov	r2, #19
	ldr	r1, .L4004+44
	b	.L3987
.L3854:
	ldr	r3, [r9, #68]
	mov	r2, #9
	ldr	r1, .L4004+48
	b	.L3987
.L3855:
	ldr	r3, [r9, #68]
	mov	r2, #10
	ldr	r1, .L4004+52
	b	.L3987
.L3853:
	ldr	r1, .L4004+56
	mov	r2, #8
	ldr	r6, [r9, #68]
	mov	r0, #22
	ldr	r3, [r4, #4008]
	blx	r6
	mov	r0, r5
	bl	H264_DecPPS
	ldr	r1, [r5, #368]
	cmp	r1, #0
	mov	r6, r0
	beq	.L3867
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3867:
	cmp	r6, #0
	bne	.L4003
	ldr	r3, [r4, #4008]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r4, #4008]
	b	.L3976
.L3848:
	ldr	r6, [r9, #68]
	mov	r3, r7
	ldr	r1, .L4004+60
	mov	r0, #22
	blx	r6
	cmp	r7, #256
	ldr	r6, .L4004+16
	beq	.L3877
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3878
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r4, #4056]
	blx	r7
.L3877:
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L3879
.L3880:
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L3879:
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L3980
.L3983:
	mov	r3, #0
	ldr	r0, [r4, #4056]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	b	.L3980
.L3999:
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
	bne	.L3841
	ldrb	r2, [r4, #2172]	@ zero_extendqisi2
	ldrb	r3, [r4, #2170]	@ zero_extendqisi2
.L3842:
	cmp	r2, #0
	bne	.L3843
	cmp	r3, #1
	beq	.L3844
.L3843:
	ldr	r1, .L4004+64
	mov	r0, #1
	ldr	r6, [r9, #68]
	blx	r6
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L3978
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r5, #368]
	b	.L3976
.L3998:
	ldr	r3, [r9, #68]
	mov	r0, #22
	ldr	r1, .L4004+68
	blx	r3
	ldr	r3, [r4, #4000]
	b	.L3837
.L3841:
	ubfx	r3, r0, #22, #1
	ubfx	r2, r0, #16, #6
	ubfx	ip, r7, #4, #1
	strb	r3, [r4, #2168]
	strb	r2, [r4, #2169]
	ubfx	r3, r0, #15, #1
	ubfx	r2, r7, #8, #4
	ubfx	r0, r0, #12, #3
	strb	ip, [r4, #2174]
	ubfx	ip, r7, #2, #1
	strb	r0, [r4, #2171]
	ubfx	r0, r7, #5, #3
	strb	r3, [r4, #2170]
	strb	r0, [r4, #2173]
	ubfx	r0, r7, #3, #1
	strb	r2, [r4, #2172]
	strb	r0, [r4, #2175]
	and	r0, r7, #3
	strb	ip, [r4, #2176]
	strb	r0, [r4, #2177]
	b	.L3842
.L4000:
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r1, .L4004+72
	blx	r3
	mov	r0, r5
	bl	ClearCurrSlice
	ldr	r3, .L4004+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3978
.L3985:
	mov	r3, #0
.L3979:
	ldr	r0, [r4, #4056]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L3976
.L4003:
	ldr	r5, .L4004+16
	mov	r0, #1
	ldr	r3, [r9, #68]
	ldr	r1, .L4004+76
	blx	r3
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L3978
.L3996:
	sub	r2, fp, #44
	mvn	r7, #0
	mov	r3, #4
	mov	r1, #100
	str	r7, [r2, #-4]!
	ldr	r0, [r4, #4056]
	blx	r6
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L3985
	b	.L3978
.L4002:
	ldr	r5, .L4004+16
	mov	r0, #1
	ldr	r3, [r9, #68]
	ldr	r1, .L4004+80
	blx	r3
	ldr	r6, [r5]
	cmp	r6, #0
	bne	.L3996
	b	.L3978
.L4001:
	ldr	r3, [r9, #68]
	mov	r0, #1
	ldr	r1, .L4004+84
	blx	r3
	ldr	r3, .L4004+16
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L3983
	b	.L3980
.L3878:
	ldr	r1, [r5, #368]
	cmp	r1, #0
	bne	.L3880
	b	.L3980
.L3844:
	ldrb	r3, [r4, #2168]	@ zero_extendqisi2
	mov	r0, #22
	cmp	r3, #1
	moveq	r3, #5
	streqb	r3, [r1, #2]
	ldrb	ip, [r4, #2173]	@ zero_extendqisi2
	ldreqb	r2, [r4, #2172]	@ zero_extendqisi2
	ldrb	r3, [r4, #2171]	@ zero_extendqisi2
	ldr	r1, .L4004+88
	str	ip, [sp]
	ldr	r10, [r9, #68]
	blx	r10
	ldr	r3, [r9, #68]
	mov	r2, r7
	ldr	r1, .L4004+92
	mov	r0, #22
	blx	r3
	ldr	r2, [r5, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #24
	str	r3, [r2, #64]
	ldr	r3, [r5, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	b	.L3840
.L4005:
	.align	2
.L4004:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC403
	.word	.LC421
	.word	.LANCHOR0
	.word	g_event_report
	.word	.LC408
	.word	.LC413
	.word	.LC411
	.word	.LC418
	.word	.LC417
	.word	.LC419
	.word	.LC420
	.word	.LC415
	.word	.LC416
	.word	.LC410
	.word	.LC422
	.word	.LC405
	.word	.LC404
	.word	.LC409
	.word	.LC174
	.word	.LC412
	.word	.LC414
	.word	.LC406
	.word	.LC407
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	cmp	r1, #0
	mov	r5, r0
	mov	r0, #0
	str	r0, [fp, #-40]
	str	r0, [fp, #-44]
	str	r0, [fp, #-48]
	beq	.L4060
	ldr	r2, [r5]
	add	r4, r5, #53248
	ldr	ip, [r4, #2804]
	ldr	r3, [r2, #8]
	cmp	ip, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r4, #4044]
	ldr	r3, [r2]
	str	r3, [r4, #4048]
	ldr	r3, [r2, #4]
	str	r0, [r4, #3996]
	str	r3, [r4, #4052]
	beq	.L4009
	ldr	r3, [r2, #868]
	cmp	r3, #1
	beq	.L4061
.L4010:
	mov	r0, r5
	bl	ReceivePacket
	ldr	r3, [r5, #368]
	str	r3, [r4, #4092]
.L4012:
	cmp	r0, #0
	mov	r3, #0
	str	r3, [r4, #2804]
	beq	.L4013
.L4030:
	mov	r0, #0
.L4058:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4061:
	ldr	r3, [r2, #908]
	cmp	r3, #1
	bne	.L4010
	ldr	r3, [r4, #4088]
	cmp	r3, #1
	bne	.L4010
	ldr	r3, [r4, #4092]
	str	r3, [r5, #368]
	str	r0, [r4, #4088]
	str	r0, [r4, #2804]
	b	.L4011
.L4013:
	ldr	r3, [r5, #368]
.L4011:
	mov	r2, #0
	add	r6, r5, #13504
	str	r2, [r3, #64]
	add	r6, r6, #24
	ldr	r3, [r5, #368]
	mov	r0, r6
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #8]
	bl	BsInit
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
	beq	.L4062
.L4014:
	mov	r0, r5
	bl	FindTrailZeros
	subs	r4, r0, #0
	bne	.L4063
	ldr	r3, [r5, #368]
	mov	r0, r6
	str	r4, [r3, #64]
	ldr	r3, [r5, #368]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	bl	BsInit
	mov	r1, r4
	mov	r0, r5
	bl	H264_DecOneNal
	cmn	r0, #2
	beq	.L4058
	cmp	r0, #0
	beq	.L4030
	ldr	r3, .L4068
	mov	r0, #22
	ldr	r1, .L4068+4
	ldr	r3, [r3, #68]
	blx	r3
.L4059:
	mvn	r0, #0
	b	.L4058
.L4009:
	ldr	r0, [r5, #368]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4012
.L4062:
	cmp	ip, #0
	bne	.L4064
.L4015:
	sub	r2, fp, #32
	sub	r1, fp, #36
	mov	r0, r5
	bl	InquireSliceProperty
	cmp	r0, #0
	beq	.L4065
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4028
	ldr	r0, [r4, #4056]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4028:
	ldr	r3, .L4068+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4059
	mov	r3, #0
	ldr	r0, [r4, #4056]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4058
.L4065:
	ldr	r2, [fp, #-36]
	ldr	r1, [r4, #4068]
	sub	r3, r2, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r3, r1
	str	r3, [r4, #4068]
	bne	.L4066
.L4017:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L4014
	mov	r0, r5
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L4067
.L4024:
	ldr	r0, [r4, #4056]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L4014
	sub	r3, fp, #40
	sub	r2, fp, #44
	sub	r1, fp, #48
	ldr	r0, [r4, #4056]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5]
	ldr	r3, [r3, #776]
	cmp	r3, #1
	bne	.L4014
	ldr	r1, [fp, #-44]
	ldr	r2, [fp, #-40]
	add	r0, r1, r2
	cmp	r0, #1
	ble	.L4025
.L4026:
	add	r5, r5, #57344
	mov	r2, #0
	mov	r3, #1
	mvn	r0, #1
	str	r2, [r5]
	str	r3, [r4, #2804]
	b	.L4058
.L4066:
	add	r7, r5, #20480
	ldrb	r3, [r7, #209]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #4072]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #4072]
	ldr	r3, [r4, #3980]
	cmp	r3, #0
	beq	.L4017
	ldr	r3, [r5, #368]
	mov	ip, #0
	mov	r0, r6
	mov	r2, #20
	ldr	r1, .L4068+12
	str	ip, [r3, #64]
	bl	BsInit
	mov	r0, r5
	mov	r1, #1
	bl	H264_DecOneNal
	ldrb	r3, [r7, #209]	@ zero_extendqisi2
	mvn	r0, #1
	cmp	r3, #1
	ldr	r3, [r4, #4072]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #4072]
	mov	r3, #1
	str	r3, [r4, #2804]
	b	.L4058
.L4064:
	mov	r0, r5
	bl	InquireSliceExtProperty
	b	.L4015
.L4063:
	ldr	r3, .L4068
	mov	r0, #22
	ldr	r1, .L4068+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L4058
.L4067:
	ldr	ip, .L4068
	movw	r2, #12983
	ldr	r1, .L4068+20
	mov	r0, #0
	ldr	r7, [ip, #68]
	blx	r7
	b	.L4024
.L4060:
	ldr	ip, .L4068
	mov	r0, r1
	movw	r3, #12874
	ldr	r2, .L4068+24
	ldr	r1, .L4068+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L4058
.L4025:
	cmp	r1, #0
	cmpeq	r2, #1
	beq	.L4026
	cmp	r1, #1
	cmpeq	r2, #0
	bne	.L4014
	ldrh	r2, [r5, #12]
	add	r2, r5, r2, lsl #2
	ldr	r2, [r2, #20]
	ldr	r0, [r2, #104]
	cmp	r0, #0
	beq	.L4014
	ldr	r1, [r4, #4056]
	ldr	r2, .L4068+32
	ldr	r1, [r2, r1, asl #2]
	add	r1, r1, #229376
	str	r0, [r1, #716]
	ldrh	r0, [r5, #12]
	ldr	r1, [r4, #4056]
	add	r0, r5, r0, lsl #2
	ldr	r1, [r2, r1, asl #2]
	ldr	r0, [r0, #20]
	add	r1, r1, #229376
	ldr	r0, [r0, #32]
	str	r0, [r1, #720]
	ldr	r1, [r4, #4056]
	ldr	r2, [r2, r1, asl #2]
	add	r2, r2, #229376
	str	r3, [r2, #728]
	b	.L4014
.L4069:
	.align	2
.L4068:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC424
	.word	g_event_report
	.word	.LANCHOR0+432
	.word	.LC423
	.word	.LC352
	.word	.LC20
	.word	.LC21
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	2
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r6, [r0, #364]
	mov	r4, r0
	mov	r7, r3
	ldr	r2, [fp, #8]
	cmp	r6, #0
	bne	.L4071
	ldr	r3, [fp, #4]
	add	r5, r0, #53248
	cmp	r3, #0
	str	r1, [r5, #1508]
	beq	.L4072
	ldr	r3, .L4091
	mov	ip, r2, asl #6
	sub	r2, ip, r2, asl #3
	add	r2, r2, r3
	ldr	r3, [r2, #4]
	cmp	r3, #3
	beq	.L4088
	cmp	r3, #1
	beq	.L4072
.L4075:
	mov	r1, r7
	mov	r0, r4
	bl	StorePicInDPB
	cmp	r0, #1
	mov	r7, r0
	bls	.L4076
	ldr	r3, [r5, #1464]
	mov	r2, #1
	ldr	r0, [r5, #4056]
	mvn	r6, #0
	ldr	r1, [r3, #620]
	bl	FSP_ClearLogicFs
	ldr	r3, .L4091+4
	mov	r2, r7
	ldr	r1, .L4091+8
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	mov	r3, #0
	str	r3, [r5, #1464]
.L4074:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4071:
	add	r5, r0, #53248
	str	r1, [r5, #1508]
	bl	ClearAllSlice
	mov	r1, r7
	mov	r0, r4
	bl	StorePicInDPB
	subs	r2, r0, #0
	bne	.L4089
.L4077:
	mov	r0, r4
	bl	FlushDPB
	subs	r2, r0, #0
	bne	.L4090
.L4078:
	add	r2, r4, #12288
	mov	r3, #0
	str	r3, [r5, #2800]
	add	r4, r4, #20480
	ldr	r1, [r2, #1292]
	mov	r6, r3
	movw	r2, #23352
	strb	r3, [r4, #1856]
	str	r3, [r4, #1888]
	movt	r2, 1
	str	r1, [r4, #1864]
	mov	r0, #7
	mov	r1, #2
	str	r3, [r4, #1892]
	str	r2, [r4, #1872]
	mov	r3, #32
	strb	r1, [r4, #1857]
	mvn	r2, #0
	mov	r1, #3
	str	r0, [r4, #1868]
	strb	r3, [r4, #1858]
	mov	r0, r6
	mov	r3, #262144
	str	r1, [r4, #1880]
	str	r2, [r4, #1884]
	str	r3, [r4, #1896]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4072:
	mov	r0, r4
	bl	ClearAllSlice
	b	.L4075
.L4076:
	mov	r3, #1
	mov	r0, r6
	str	r3, [r5, #2800]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4090:
	ldr	r3, .L4091+4
	mov	r0, #1
	ldr	r1, .L4091+12
	ldr	r3, [r3, #68]
	blx	r3
	b	.L4078
.L4089:
	ldr	r3, .L4091+4
	mov	r0, #1
	ldr	r1, .L4091+16
	ldr	r3, [r3, #68]
	blx	r3
	b	.L4077
.L4088:
	bl	ClearAllSlice
	b	.L4074
.L4092:
	.align	2
.L4091:
	.word	g_VdmDrvParam+48
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC425
	.word	.LC427
	.word	.LC426
	UNWIND(.fnend)
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	2
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
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
	add	r6, r0, #53248
	mov	lr, #0
	mov	r10, r0
	ldr	r5, [r6, #2792]
	str	lr, [fp, #-52]
	cmp	r5, lr
	str	lr, [fp, #-48]
	beq	.L4109
	add	r4, r0, #27136
	add	r8, r0, #26368
	add	r4, r4, #176
	add	r8, r8, #72
	add	r7, r0, #24576
	mov	r0, r4
.L4101:
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4096
	cmp	r0, #0
	beq	.L4097
	ldr	ip, [r7, #2060]
	cmp	ip, #0
	beq	.L4097
	ldr	r2, [r7, #1864]
	cmp	r2, r0
	beq	.L4096
	mov	r2, r8
	b	.L4098
.L4099:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L4096
.L4098:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L4099
.L4097:
	ldr	r0, [r6, #4056]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L4109
	cmn	r0, #1
	bne	.L4131
	add	r1, r10, #8
	ldr	r0, [r6, #4056]
	bl	FSP_ClearNotInVoQueue
	b	.L4131
.L4096:
	add	lr, lr, #1
	add	r0, r0, #672
	cmp	lr, r5
	bne	.L4101
	ldr	r9, .L4135
	sub	r2, fp, #48
	sub	r1, fp, #52
	add	r0, r10, #8
	bl	GetQueueImgNum
	ldr	r1, .L4135+4
	ldr	r3, [r9, #68]
	mov	r0, #0
	blx	r3
	ldr	r3, [r9, #68]
	ldr	r1, .L4135+8
	mov	r0, #0
	blx	r3
	ldr	r3, [r6, #2792]
	cmp	r3, #0
	beq	.L4133
	add	r3, r10, #26368
	add	r8, r10, #24576
	add	r3, r3, #72
	str	r10, [fp, #-56]
	mov	r5, #0
	mov	r10, r3
.L4102:
	cmp	r4, #0
	ldr	r7, [r9, #68]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	ldrb	lr, [r4, #4]	@ zero_extendqisi2
	beq	.L4113
	ldr	ip, [r8, #2060]
	cmp	ip, #0
	beq	.L4113
	ldr	r2, [r8, #1864]
	cmp	r4, r2
	beq	.L4115
	mov	r1, r10
	mov	r2, #0
	b	.L4106
.L4107:
	ldr	r0, [r1, #4]!
	cmp	r4, r0
	beq	.L4115
.L4106:
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L4107
.L4113:
	mov	r2, #1
.L4105:
	str	r2, [sp, #4]
	mov	r0, #0
	mov	r2, r5
	str	lr, [sp]
	ldr	r1, .L4135+12
	add	r5, r5, #1
	blx	r7
	ldr	r3, [r6, #2792]
	add	r4, r4, #672
	cmp	r3, r5
	bhi	.L4102
	ldr	r10, [fp, #-56]
.L4108:
	ldr	r3, [fp, #-48]
	mov	r0, #0
	ldr	r2, [fp, #-52]
	ldr	r1, .L4135+16
	ldr	r4, [r9, #68]
	blx	r4
	ldr	r3, [r6, #2792]
	ldr	r0, [r8, #2060]
	ldr	r2, [fp, #-52]
	sub	r3, r3, #2
	ldr	r1, [fp, #-48]
	rsb	r3, r0, r3
	ldr	r0, .L4135
	add	r2, r2, r1
	cmp	r2, r3
	blt	.L4134
.L4131:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4109:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4115:
	mov	r2, #0
	b	.L4105
.L4134:
	ldr	r3, [r0, #68]
	mov	r0, #0
	ldr	r1, .L4135+20
	blx	r3
	mov	r0, r10
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4133:
	add	r8, r10, #24576
	b	.L4108
.L4136:
	.align	2
.L4135:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC428
	.word	.LC429
	.word	.LC431
	.word	.LC430
	.word	.LC432
	UNWIND(.fnend)
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
	.align	2
	.global	H264DEC_GetImageWidth
	.type	H264DEC_GetImageWidth, %function
H264DEC_GetImageWidth:
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
	ldr	r0, [r0, #1168]
	add	r0, r0, #1
	mov	r0, r0, asl #4
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_GetImageWidth, .-H264DEC_GetImageWidth
	.align	2
	.global	H264DEC_GetImageHeight
	.type	H264DEC_GetImageHeight, %function
H264DEC_GetImageHeight:
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
	add	r0, r0, #12288
	ldr	r3, [r3, #1172]
	ldrb	r0, [r0, #1326]	@ zero_extendqisi2
	add	r3, r3, #1
	rsb	r0, r0, #2
	mov	r3, r3, asl #4
	mul	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_GetImageHeight, .-H264DEC_GetImageHeight
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
.LANCHOR1 = . + 0
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
	.type	SarTable.14513, %object
	.size	SarTable.14513, 136
SarTable.14513:
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
	.type	__func__.14665, %object
	.size	__func__.14665, 12
__func__.14665:
	.ascii	"H264_DecSEI\000"
	.type	__func__.13557, %object
	.size	__func__.13557, 13
__func__.13557:
	.ascii	"DirectOutput\000"
	.space	3
	.type	__func__.14020, %object
	.size	__func__.14020, 8
__func__.14020:
	.ascii	"InitDPB\000"
	.type	__func__.13684, %object
	.size	__func__.13684, 14
__func__.13684:
	.ascii	"StorePicInDPB\000"
	.space	2
	.type	__FUNCTION__.14910, %object
	.size	__FUNCTION__.14910, 13
__FUNCTION__.14910:
	.ascii	"H264DEC_Init\000"
	.space	3
	.type	__FUNCTION__.14157, %object
	.size	__FUNCTION__.14157, 8
__FUNCTION__.14157:
	.ascii	"InitPic\000"
	.data
	.align	2
.LANCHOR0 = . + 0
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
	ASCII(.ascii	"frame %d, state=%d, is already output\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\012" )
	ASCII(.ascii	"\000" )
.LC13:
	ASCII(.ascii	"not used frame: (%d,%d)\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"frame skip: is_used=%d,skip=%d\012\000" )
.LC15:
	ASCII(.ascii	"topfield skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"bottom field skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"exg_pts: %lld <-> %lld\012\000" )
.LC19:
	ASCII(.ascii	"stream frame packing type is %d! what can we do?\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC20:
	ASCII(.ascii	"firmware/common/syntax/h264.c\000" )
	.space	2
.LC21:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
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
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
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
	ASCII(.ascii	"   : delta_sl   \000" )
	.space	3
.LC145:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC146:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC147:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC148:
	ASCII(.ascii	"Baseline stream with FMO, not support.\012\000" )
.LC149:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC150:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC151:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC152:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC153:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC154:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC155:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC156:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC157:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC158:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC159:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC160:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC161:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC162:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC163:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC164:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC165:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC166:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC167:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC168:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC169:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC170:
	ASCII(.ascii	"pic_parameter_set_id out of range.\012\000" )
.LC171:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC172:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC173:
	ASCII(.ascii	"SPS haven't decode.\012\000" )
	.space	3
.LC174:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC175:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC176:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC177:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC178:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC179:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC180:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC181:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC182:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC183:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC184:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC185:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC186:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC187:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC188:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC189:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC190:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC191:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC192:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC193:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC194:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC195:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC196:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC197:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC198:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC199:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC200:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC201:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC202:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC203:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC204:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC205:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC206:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC207:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC208:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC209:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC210:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC211:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC212:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC213:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC214:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC215:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC216:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC217:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC218:
	ASCII(.ascii	"dar=%d\012\000" )
.LC219:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC220:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range.\012\000" )
	.space	1
.LC221:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC222:
	ASCII(.ascii	"bit_depth_luma(%d) not equal 8.\012\000" )
	.space	3
.LC223:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC224:
	ASCII(.ascii	"bit_depth_chroma(%d) not equal 8.\012\000" )
	.space	1
.LC225:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC226:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC227:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC228:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC229:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC230:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC231:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC232:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC233:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC234:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC235:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC236:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC237:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC238:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC239:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC240:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC241:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC242:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC243:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC244:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC245:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC246:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC247:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC248:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC249:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC250:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC251:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC252:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC253:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC254:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC255:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC256:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC257:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC258:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC259:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC260:
	ASCII(.ascii	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_" )
	ASCII(.ascii	"present_flag\000" )
.LC261:
	ASCII(.ascii	"inter_layer_present_flag:%d!\012\000" )
	.space	2
.LC262:
	ASCII(.ascii	"SPS_SVC_EXT: extended_spatial_scalability_idc\000" )
	.space	2
.LC263:
	ASCII(.ascii	"spatial scalability not support!!\012\000" )
	.space	1
.LC264:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_x_plus1_flag\000" )
	.space	1
.LC265:
	ASCII(.ascii	"chroma_phase_x_plus1_flag:%d!!\012\000" )
.LC266:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_y_plus1\000" )
	.space	2
.LC267:
	ASCII(.ascii	"chroma_phase_y_plus1:%d!\012\000" )
	.space	2
.LC268:
	ASCII(.ascii	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag\000" )
	.space	2
.LC269:
	ASCII(.ascii	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag\000" )
	.space	1
.LC270:
	ASCII(.ascii	"adaptive_tcoeff_level_prediction_flag:%d!\012\000" )
	.space	1
.LC271:
	ASCII(.ascii	"SPS_SVC_EXT: slice_header_restriction_flag\000" )
	.space	1
.LC272:
	ASCII(.ascii	"slice_header_restriction_flag error:%d,%x,%d\012\000" )
	.space	2
.LC273:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC274:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC275:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC276:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC277:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC278:
	ASCII(.ascii	"SPS: reserved_zero_4bits\000" )
	.space	3
.LC279:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC280:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC281:
	ASCII(.ascii	"Baseline stream, try to decode, exit when FMO occur" )
	ASCII(.ascii	"red.\012\000" )
	.space	3
.LC282:
	ASCII(.ascii	"EXTENDED stream, try to decode, exit when dataparti" )
	ASCII(.ascii	"tion occurred.\012\000" )
	.space	1
.LC283:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC284:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC285:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC286:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC287:
	ASCII(.ascii	"svc ext error:\012\000" )
.LC288:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC289:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC290:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC291:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC292:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC293:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC294:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC295:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC296:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC297:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC298:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC299:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC300:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC301:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC302:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC303:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC304:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC305:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC306:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC307:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC308:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC309:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC310:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC311:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC312:
	ASCII(.ascii	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC313:
	ASCII(.ascii	"PassBytes err [%s][%d]\012\000" )
.LC314:
	ASCII(.ascii	"SEI_PIC_TIMING,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC315:
	ASCII(.ascii	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC316:
	ASCII(.ascii	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC317:
	ASCII(.ascii	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, pa" )
	ASCII(.ascii	"yload_size = %d \012\000" )
	.space	3
.LC318:
	ASCII(.ascii	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_si" )
	ASCII(.ascii	"ze = %d \012\000" )
	.space	3
.LC319:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC320:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC321:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC322:
	ASCII(.ascii	"len_tmp = %d cann't dec usrdata\012\000" )
	.space	3
.LC323:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC324:
	ASCII(.ascii	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC325:
	ASCII(.ascii	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC326:
	ASCII(.ascii	"SEI_SPARE_PIC,offset = %d,payload_size = %d \012\000" )
	.space	2
.LC327:
	ASCII(.ascii	"SEI_SCENE_INFO,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC328:
	ASCII(.ascii	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC329:
	ASCII(.ascii	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC330:
	ASCII(.ascii	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC331:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC332:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_s" )
	ASCII(.ascii	"ize = %d \012\000" )
	.space	2
.LC333:
	ASCII(.ascii	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = " )
	ASCII(.ascii	"%d \012\000" )
.LC334:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC335:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC336:
	ASCII(.ascii	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC337:
	ASCII(.ascii	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_" )
	ASCII(.ascii	"size = %d \012\000" )
	.space	1
.LC338:
	ASCII(.ascii	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC339:
	ASCII(.ascii	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC340:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC341:
	ASCII(.ascii	"\012the stream is error,len:%d\012\000" )
	.space	3
.LC342:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC343:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC344:
	ASCII(.ascii	"H264Dec destroy\012\000" )
	.space	3
.LC345:
	ASCII(.ascii	"H264 recycle image\012\000" )
.LC346:
	ASCII(.ascii	"pH264Ctx is %p, pFrameStore is %p\012\000" )
	.space	1
.LC347:
	ASCII(.ascii	"line; %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC348:
	ASCII(.ascii	"InsertVO err:%d, ClearAll\012\000" )
	.space	1
.LC349:
	ASCII(.ascii	"H264.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC350:
	ASCII(.ascii	"line: %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC351:
	ASCII(.ascii	"[%s][%d] OutputFrmToVO return %d\012\000" )
	.space	2
.LC352:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC353:
	ASCII(.ascii	"----------------- Imode -> %d ------------------\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC354:
	ASCII(.ascii	"I_MODE but first_mb_in_slice != 0\012\000" )
	.space	1
.LC355:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC356:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic." )
	ASCII(.ascii	"structure=%d.\012\000" )
	.space	2
.LC357:
	ASCII(.ascii	"DecVDM ERR\012\000" )
.LC358:
	ASCII(.ascii	"\012 receive streambuff=0x%08x; phy_addr=0x%x; bits" )
	ASCII(.ascii	"tream_length=%d\012\000" )
	.space	3
.LC359:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC360:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC361:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC362:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC363:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC364:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC365:
	ASCII(.ascii	"CurrPic.state is 'EMPTY'\012\000" )
	.space	2
.LC366:
	ASCII(.ascii	"StorePicInDPB return(%d) from L%d\012\000" )
	.space	1
.LC367:
	ASCII(.ascii	"directoutput mode\012\000" )
	.space	1
.LC368:
	ASCII(.ascii	"line: %d pImg is NULL!\012\000" )
.LC369:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC370:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC371:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC372:
	ASCII(.ascii	"marking return %d\012\000" )
	.space	1
.LC373:
	ASCII(.ascii	"return value is unexpeced!\012\000" )
.LC374:
	ASCII(.ascii	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
.LC375:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC376:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC377:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC378:
	ASCII(.ascii	"GAP found while DPB is empty!\012\000" )
	.space	1
.LC379:
	ASCII(.ascii	"frame num gap try to fill it \012\000" )
	.space	1
.LC380:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC381:
	ASCII(.ascii	"cann't allocate frame store when gap find\012\000" )
	.space	1
.LC382:
	ASCII(.ascii	"allocate frame store when gap find\012\000" )
.LC383:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC384:
	ASCII(.ascii	"%s %d unknow error!!\012\000" )
	.space	2
.LC385:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC386:
	ASCII(.ascii	"%s %d frame_store is null!!\012\000" )
	.space	3
.LC387:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC388:
	ASCII(.ascii	"resolution error, the CAP_LEVEL_USER_DEFINE_WITH_OP" )
	ASCII(.ascii	"TION channel with s32ReRangeEn == 0 can't support s" )
	ASCII(.ascii	"uch bitstream.\012\000" )
	.space	2
.LC389:
	ASCII(.ascii	"s32MaxRefFrameNum < pH264Ctx->DPB.size, the CAP_LEV" )
	ASCII(.ascii	"EL_USER_DEFINE_WITH_OPTION channel can't support su" )
	ASCII(.ascii	"ch bitstream.\012\000" )
	.space	3
.LC390:
	ASCII(.ascii	"mem arrange err, ClearAll\012\000" )
	.space	1
.LC391:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC392:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC393:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC394:
	ASCII(.ascii	"dec_pts: %lld\012\000" )
	.space	1
.LC395:
	ASCII(.ascii	"dec_usertag: %lld\012\000" )
	.space	1
.LC396:
	ASCII(.ascii	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\012\000" )
	.space	1
.LC397:
	ASCII(.ascii	"Start Reason: SliceParaNum, MaxBytesReceived = %d, " )
	ASCII(.ascii	"%d(thr=%d)\012\000" )
	.space	1
.LC398:
	ASCII(.ascii	"Too many slice or bitstream, err!\012\000" )
	.space	1
.LC399:
	ASCII(.ascii	"Start Reason: new_pic_flag\012\000" )
.LC400:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC401:
	ASCII(.ascii	"DecList error, ret=%d\012\000" )
	.space	1
.LC402:
	ASCII(.ascii	"dec list err.\012\000" )
	.space	1
.LC403:
	ASCII(.ascii	"pH264Ctx->TotalNal = %d, type:%d\012\000" )
	.space	2
.LC404:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC405:
	ASCII(.ascii	"svc_extension_flag error:priority_id:%d, pred_flag%" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC406:
	ASCII(.ascii	"%d,%d,%d\012\000" )
	.space	2
.LC407:
	ASCII(.ascii	"svc stream,nal_header:%x\012\000" )
	.space	2
.LC408:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC409:
	ASCII(.ascii	"SliceCheck failed, clear current slice.\012\000" )
	.space	3
.LC410:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC411:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC412:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC413:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC414:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC415:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC416:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC417:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC418:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC419:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC420:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC421:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC422:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC423:
	ASCII(.ascii	"FindTrailZeros ERR\012\000" )
.LC424:
	ASCII(.ascii	"H264_DecOneNal ERR\012\000" )
.LC425:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC426:
	ASCII(.ascii	"imode nal store pic err, ret = %d\012\000" )
	.space	1
.LC427:
	ASCII(.ascii	"imode nal flush dpb err, ret = %d\012\000" )
	.space	1
.LC428:
	ASCII(.ascii	"cann't find FrameStore\012\000" )
.LC429:
	ASCII(.ascii	"========== H264 FrameStore state(is_used, is_in_dpb" )
	ASCII(.ascii	", IsOutDPB) ========\012\000" )
	.space	3
.LC430:
	ASCII(.ascii	"ReadImgNum = %d, NewImgNum = %d\012\000" )
	.space	3
.LC431:
	ASCII(.ascii	"%02d: %d %d %d\012\000" )
.LC432:
	ASCII(.ascii	"FrameStore leak, ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.14433, %object
	.size	pps_tmp.14433, 2208
pps_tmp.14433:
	.space	2208
	.type	sps_tmp.14582, %object
	.size	sps_tmp.14582, 4000
sps_tmp.14582:
	.space	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.space	68
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
