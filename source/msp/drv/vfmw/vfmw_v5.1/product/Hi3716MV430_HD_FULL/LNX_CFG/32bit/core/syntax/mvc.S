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
	.file	"mvc.c"
	.text
	.align	2
	.global	MVC_IsSTRefFlg
	.type	MVC_IsSTRefFlg, %function
MVC_IsSTRefFlg:
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
	.size	MVC_IsSTRefFlg, .-MVC_IsSTRefFlg
	.align	2
	.global	MVC_IsLTRefFlg
	.type	MVC_IsLTRefFlg, %function
MVC_IsLTRefFlg:
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
	.size	MVC_IsLTRefFlg, .-MVC_IsLTRefFlg
	.align	2
	.global	MVC_compare_pic_by_pic_num_desc
	.type	MVC_compare_pic_by_pic_num_desc, %function
MVC_compare_pic_by_pic_num_desc:
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
	.size	MVC_compare_pic_by_pic_num_desc, .-MVC_compare_pic_by_pic_num_desc
	.align	2
	.global	MVC_compare_pic_by_lt_pic_num_asc
	.type	MVC_compare_pic_by_lt_pic_num_asc, %function
MVC_compare_pic_by_lt_pic_num_asc:
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
	.size	MVC_compare_pic_by_lt_pic_num_asc, .-MVC_compare_pic_by_lt_pic_num_asc
	.align	2
	.global	MVC_compare_fs_by_frame_num_desc
	.type	MVC_compare_fs_by_frame_num_desc, %function
MVC_compare_fs_by_frame_num_desc:
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
	ldr	r2, [r2, #24]
	ldr	r3, [r3, #24]
	cmp	r2, r3
	blt	.L12
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L12:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_frame_num_desc, .-MVC_compare_fs_by_frame_num_desc
	.align	2
	.global	MVC_compare_fs_by_lt_pic_idx_asc
	.type	MVC_compare_fs_by_lt_pic_idx_asc, %function
MVC_compare_fs_by_lt_pic_idx_asc:
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
	ldr	r2, [r2, #28]
	ldr	r3, [r3, #28]
	cmp	r2, r3
	bcc	.L15
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L15:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_lt_pic_idx_asc, .-MVC_compare_fs_by_lt_pic_idx_asc
	.align	2
	.global	MVC_compare_pic_by_poc_asc
	.type	MVC_compare_pic_by_poc_asc, %function
MVC_compare_pic_by_poc_asc:
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
	.size	MVC_compare_pic_by_poc_asc, .-MVC_compare_pic_by_poc_asc
	.align	2
	.global	MVC_compare_pic_by_poc_desc
	.type	MVC_compare_pic_by_poc_desc, %function
MVC_compare_pic_by_poc_desc:
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
	.size	MVC_compare_pic_by_poc_desc, .-MVC_compare_pic_by_poc_desc
	.align	2
	.global	MVC_compare_fs_by_poc_asc
	.type	MVC_compare_fs_by_poc_asc, %function
MVC_compare_fs_by_poc_asc:
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
	ldr	r2, [r2, #32]
	ldr	r3, [r3, #32]
	cmp	r2, r3
	blt	.L24
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L24:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_poc_asc, .-MVC_compare_fs_by_poc_asc
	.align	2
	.global	MVC_compare_fs_by_poc_desc
	.type	MVC_compare_fs_by_poc_desc, %function
MVC_compare_fs_by_poc_desc:
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
	ldr	r2, [r2, #32]
	ldr	r3, [r3, #32]
	cmp	r2, r3
	blt	.L27
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L27:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_poc_desc, .-MVC_compare_fs_by_poc_desc
	.align	2
	.type	MVC_SetFrmRepeatCount.part.1, %function
MVC_SetFrmRepeatCount.part.1:
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
	add	ip, r0, #11075584
	ldr	lr, [r0, #136]
	add	ip, ip, #45056
	ldr	r3, [r0, #132]
	ldr	r2, [ip, #2504]
	mov	r3, r3, lsr #1
	add	r2, r2, lr, lsr #1
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
	ldrhi	r3, [r0, #136]
	ldrls	r3, [r0, #136]
	addhi	r3, r3, #4
	addls	r3, r3, #2
	str	r3, [r0, #136]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_SetFrmRepeatCount.part.1, .-MVC_SetFrmRepeatCount.part.1
	.align	2
	.type	MVC_CombinePacket.part.11, %function
MVC_CombinePacket.part.11:
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
	ldr	r2, .L33
	mov	r4, r0
	movw	r1, #11097
	mov	r0, #8
	mov	r5, #0
	bl	dprint_normal
	ldr	ip, [r4, #232]
	ldr	r2, .L33+4
	movw	r1, #11100
	mov	r0, #8
	ldr	lr, [ip, #40]
	ldr	r3, [ip, #16]
	str	lr, [sp, #8]
	ldr	lr, [ip, #12]
	str	lr, [sp, #4]
	ldr	ip, [ip, #44]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r4, #232]
	ldr	ip, .L33+8
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r3, #8]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #232]
	mov	lr, #1
	ldr	r2, .L33+12
	movw	r1, #11111
	ldr	r0, [r3, #60]
	ldr	r6, [r3, #32]
	str	r0, [r3, #32]
	mov	r0, #8
	ldr	r3, [r4, #232]
	str	r5, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	r7, [r3, #12]
	ldr	ip, [r3, #36]
	rsb	ip, r7, ip
	str	ip, [r3, #8]
	ldr	r3, [r4, #232]
	ldr	r7, [r3, #12]
	ldr	ip, [r3, #44]
	rsb	ip, r7, ip
	str	ip, [r3, #16]
	ldr	r3, [r4, #232]
	ldr	ip, [r3, #12]
	ldr	r7, [r3, #40]
	add	ip, ip, r7
	str	ip, [r3, #12]
	ldr	r3, [r4, #232]
	str	lr, [r3, #68]
	ldr	ip, [r4, #232]
	ldr	r3, [ip, #16]
	ldr	ip, [ip, #12]
	str	ip, [sp]
	bl	dprint_normal
	mov	r1, r6
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #232]
	str	r5, [r3, #36]
	ldr	r3, [r4, #232]
	str	r5, [r3, #52]
	ldr	r3, [r4, #232]
	str	r5, [r3, #40]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	.LC0
	.word	.LC1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	UNWIND(.fnend)
	.size	MVC_CombinePacket.part.11, .-MVC_CombinePacket.part.11
	.align	2
	.global	mvc_ue_v
	.type	mvc_ue_v, %function
mvc_ue_v:
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
	add	r8, r0, #548
	mov	r6, r0
	mov	r7, r1
	mov	r0, r8
	mov	r1, #32
	bl	BsShow
	mov	r5, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r4, r0
	bls	.L39
	cmp	r0, #31
	bls	.L40
	mvn	r5, #0
	mov	r8, #32
	mov	r3, #1
	strb	r3, [r6, #10]
.L37:
	ldr	lr, [r6, #232]
	mov	r3, r7
	ldr	r2, .L41
	mov	r1, #111
	mov	r0, #19
	ldr	ip, [lr, #64]
	add	r4, ip, r8
	str	r4, [lr, #64]
	str	r5, [sp]
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L39:
	mov	r4, r0, asl #1
	mov	r0, r8
	add	r8, r4, #1
	rsb	r4, r4, #31
	mov	r4, r5, lsr r4
	mov	r1, r8
	sub	r5, r4, #1
	bl	BsSkip
	b	.L37
.L40:
	add	r5, r0, #1
	mov	r1, r0
	mov	r0, r8
	bl	BsSkip
	mov	r1, r5
	mov	r0, r8
	bl	BsShow
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r8
	bl	BsSkip
	mov	r3, r4, asl #1
	add	r8, r3, #1
	b	.L37
.L42:
	.align	2
.L41:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_ue_v, .-mvc_ue_v
	.align	2
	.global	mvc_se_v
	.type	mvc_se_v, %function
mvc_se_v:
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
	add	r8, r0, #548
	mov	r6, r0
	mov	r7, r1
	mov	r0, r8
	mov	r1, #32
	bl	BsShow
	mov	r4, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r5, r0
	bhi	.L44
	mov	r5, r0, asl #1
	mov	r0, r8
	rsb	r3, r5, #31
	add	r5, r5, #1
	mov	r3, r4, lsr r3
	and	r2, r3, #1
	mov	r1, r5
	rsb	r4, r2, #0
	eor	r3, r4, r3, lsr #1
	add	r4, r3, r2
	bl	BsSkip
.L45:
	ldr	lr, [r6, #232]
	mov	r3, r7
	ldr	r2, .L48
	mov	r1, #151
	mov	r0, #19
	ldr	ip, [lr, #64]
	add	r5, ip, r5
	str	r5, [lr, #64]
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L44:
	cmp	r0, #31
	bls	.L47
	mov	r3, #1
	mvn	r4, #-2147483648
	mov	r5, #32
	strb	r3, [r6, #10]
	b	.L45
.L47:
	mov	r1, r0
	mov	r0, r8
	bl	BsSkip
	mov	r1, r5
	mov	r0, r8
	mov	r5, r5, asl #1
	bl	BsGet
	mov	r1, #1
	add	r5, r5, #1
	mov	r9, r0
	mov	r0, r8
	bl	BsGet
	and	r0, r0, #1
	rsb	r4, r0, #0
	eor	r9, r9, r4
	add	r4, r9, r0
	b	.L45
.L49:
	.align	2
.L48:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_se_v, .-mvc_se_v
	.align	2
	.global	mvc_u_v
	.type	mvc_u_v, %function
mvc_u_v:
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
	add	r0, r0, #548
	mov	r7, r2
	mov	r6, r1
	bl	BsGet
	ldr	lr, [r5, #232]
	mov	r3, r7
	ldr	r2, .L51
	mov	r1, #163
	ldr	ip, [lr, #64]
	add	ip, ip, r6
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r0, #19
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_u_v, .-mvc_u_v
	.align	2
	.global	mvc_u_1
	.type	mvc_u_1, %function
mvc_u_1:
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
	mov	r6, r1
	add	r0, r0, #548
	mov	r1, #1
	bl	BsGet
	ldr	lr, [r5, #232]
	mov	r3, r6
	ldr	r2, .L54
	mov	r1, #174
	ldr	ip, [lr, #64]
	add	ip, ip, #1
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r0, #19
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_u_1, .-mvc_u_1
	.align	2
	.global	MVC_GetMinPOC
	.type	MVC_GetMinPOC, %function
MVC_GetMinPOC:
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
	add	r5, r0, #11075584
	add	r5, r5, #45056
	mov	r9, r3
	mov	r8, r2
	mvn	r3, #-2147483648
	mvn	r2, #0
	str	r2, [r9]
	str	r3, [r8]
	mov	r6, r0
	ldr	r3, [r5, #2504]
	mov	r7, r1
	ldr	r2, [r5, #2508]
	cmp	r2, r3
	strhi	r3, [r5, #2508]
	cmp	r3, #0
	beq	.L63
	movw	r10, #47364
	mvn	r3, #0
	movt	r10, 169
	str	r3, [fp, #-48]
	add	r10, r0, r10
	mov	r4, #0
	b	.L62
.L60:
	ldr	ip, [r8]
	ldr	r1, [r2, #32]
	cmp	ip, r1
	ble	.L59
	ldrb	ip, [r2, #5]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L59
	ldr	r0, [r0, #20]
	sub	r0, r0, #1
	cmp	r0, #1
	bls	.L78
.L59:
	ldr	r2, [r5, #2504]
	add	r4, r4, #1
	cmp	r2, r4
	bls	.L63
.L62:
	ldr	r2, [r10, #4]!
	cmp	r2, #0
	beq	.L59
	ldrsb	r1, [r2, #6]
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L59
	cmn	r7, #1
	ldr	r2, [r10]
	bne	.L60
	ldrb	r1, [r2, #5]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L59
	ldr	r1, [r0, #20]
	sub	r1, r1, #1
	cmp	r1, #1
	bhi	.L59
	ldr	r0, [r8]
	ldr	r1, [r2, #32]
	cmp	r0, r1
	ble	.L61
	str	r1, [r8]
	str	r4, [r9]
	add	r4, r4, #1
	ldr	r2, [r10]
	ldr	r3, [r2, #56]
	ldr	r2, [r5, #2504]
	cmp	r2, r4
	str	r3, [fp, #-48]
	bhi	.L62
.L63:
	ldr	r0, [r9]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L78:
	ldr	r2, [r2, #56]
	cmp	r7, r2
	streq	r1, [r8]
	streq	r4, [r9]
	b	.L59
.L61:
	bne	.L59
	ldr	r2, [r2, #56]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	strlt	r4, [r9]
	ldrlt	r2, [r10]
	ldrlt	r3, [r2, #56]
	strlt	r3, [fp, #-48]
	b	.L59
	UNWIND(.fnend)
	.size	MVC_GetMinPOC, .-MVC_GetMinPOC
	.align	2
	.global	MVC_FrameStoreRefFlg
	.type	MVC_FrameStoreRefFlg, %function
MVC_FrameStoreRefFlg:
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
	ldrb	r0, [r0, #3]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FrameStoreRefFlg, .-MVC_FrameStoreRefFlg
	.align	2
	.global	MVC_NonLongTermRefFlg
	.type	MVC_NonLongTermRefFlg, %function
MVC_NonLongTermRefFlg:
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
	cmp	r3, #3
	beq	.L95
	tst	r3, #1
	bne	.L96
.L84:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L88
.L85:
	ldrb	r0, [r0, #681]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L88:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L96:
	ldrb	r2, [r0, #645]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L84
.L89:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L95:
	ldrb	r3, [r0, #609]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L89
	ldrb	r3, [r0, #645]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L85
	b	.L89
	UNWIND(.fnend)
	.size	MVC_NonLongTermRefFlg, .-MVC_NonLongTermRefFlg
	.align	2
	.global	MVC_ShortTermRefFlg
	.type	MVC_ShortTermRefFlg, %function
MVC_ShortTermRefFlg:
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
	cmp	r3, #3
	beq	.L112
	tst	r3, #1
	bne	.L113
.L101:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L105
.L102:
	ldr	r0, [r0, #680]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L105:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L113:
	ldr	r2, [r0, #644]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L101
.L106:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L112:
	ldr	r3, [r0, #608]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L106
	ldr	r3, [r0, #644]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	bne	.L102
	b	.L106
	UNWIND(.fnend)
	.size	MVC_ShortTermRefFlg, .-MVC_ShortTermRefFlg
	.align	2
	.global	MVC_LongTermRefFlg
	.type	MVC_LongTermRefFlg, %function
MVC_LongTermRefFlg:
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
	cmp	r3, #3
	beq	.L129
	tst	r3, #1
	bne	.L130
.L118:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L122
.L119:
	ldr	r0, [r0, #680]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L122:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L130:
	ldr	r2, [r0, #644]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L118
.L123:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L129:
	ldr	r3, [r0, #608]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L123
	ldr	r3, [r0, #644]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	bne	.L119
	b	.L123
	UNWIND(.fnend)
	.size	MVC_LongTermRefFlg, .-MVC_LongTermRefFlg
	.align	2
	.global	MVC_UpdateLTReflist
	.type	MVC_UpdateLTReflist, %function
MVC_UpdateLTReflist:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	mov	r7, r0
	str	r3, [fp, #-48]
	ldr	r10, [r3, #2504]
	cmp	r10, #0
	beq	.L132
	movw	r8, #47364
	add	r9, r0, #11141120
	movt	r8, 169
	mov	r4, #0
	add	r9, r9, #8192
	add	r8, r0, r8
	mov	r6, r4
.L134:
	ldr	r5, [r8, #4]!
	add	r6, r6, #1
	cmp	r5, #0
	mov	r0, r5
	beq	.L133
	bl	MVC_LongTermRefFlg
	cmp	r0, #0
	beq	.L133
	ldr	r2, [r9, #3632]
	ldr	r1, [r5, #56]
	cmp	r1, r2
	movweq	r2, #28258
	movteq	r2, 42
	addeq	r2, r4, r2
	addeq	r4, r4, #1
	streq	r5, [r7, r2, asl #2]
.L133:
	cmp	r6, r10
	bne	.L134
	ldr	r3, [fp, #-48]
	cmp	r4, r10
	str	r4, [r3, #2516]
	bcs	.L131
	movw	r0, #28257
	mov	r2, #0
	movt	r0, 42
	add	r0, r4, r0
	add	r0, r7, r0, lsl #2
.L137:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r10
	bne	.L137
.L131:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L132:
	ldr	r3, [fp, #-48]
	str	r10, [r3, #2516]
	b	.L131
	UNWIND(.fnend)
	.size	MVC_UpdateLTReflist, .-MVC_UpdateLTReflist
	.align	2
	.global	MVC_UpdateReflist
	.type	MVC_UpdateReflist, %function
MVC_UpdateReflist:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	mov	r7, r0
	str	r3, [fp, #-48]
	ldr	r10, [r3, #2504]
	cmp	r10, #0
	beq	.L148
	movw	r8, #47364
	add	r9, r0, #11141120
	movt	r8, 169
	mov	r4, #0
	add	r9, r9, #8192
	add	r8, r0, r8
	mov	r6, r4
.L150:
	ldr	r5, [r8, #4]!
	add	r6, r6, #1
	cmp	r5, #0
	mov	r0, r5
	beq	.L149
	bl	MVC_ShortTermRefFlg
	cmp	r0, #0
	beq	.L149
	ldr	r2, [r9, #3632]
	ldr	r1, [r5, #56]
	cmp	r1, r2
	movweq	r2, #28242
	movteq	r2, 42
	addeq	r2, r4, r2
	addeq	r4, r4, #1
	streq	r5, [r7, r2, asl #2]
.L149:
	cmp	r6, r10
	bne	.L150
	ldr	r3, [fp, #-48]
	cmp	r4, r10
	str	r4, [r3, #2512]
	bcs	.L147
	movw	r0, #28241
	mov	r2, #0
	movt	r0, 42
	add	r0, r4, r0
	add	r0, r7, r0, lsl #2
.L153:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r10
	bne	.L153
.L147:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L148:
	ldr	r3, [fp, #-48]
	str	r10, [r3, #2512]
	b	.L147
	UNWIND(.fnend)
	.size	MVC_UpdateReflist, .-MVC_UpdateReflist
	.align	2
	.global	MVC_GetPicNumX
	.type	MVC_GetPicNumX, %function
MVC_GetPicNumX:
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
	.size	MVC_GetPicNumX, .-MVC_GetPicNumX
	.align	2
	.global	MVC_UnMarkFrameStoreRef
	.type	MVC_UnMarkFrameStoreRef, %function
MVC_UnMarkFrameStoreRef:
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
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	r3, r1
	tst	r2, #1
	beq	.L167
	ldrb	r1, [r1, #3]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r3, #645]
	and	r1, r1, #2
	strb	ip, [r3, #646]
	strb	r1, [r3, #3]
.L167:
	tst	r2, #2
	beq	.L168
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r3, #681]
	and	r1, r1, #1
	strb	ip, [r3, #682]
	strb	r1, [r3, #3]
.L168:
	cmp	r2, #3
	ldrsb	r1, [r3, #6]
	moveq	r2, #0
	streqb	r2, [r3, #610]
	streqb	r2, [r3, #609]
	mov	r2, #0
	strb	r2, [r3, #3]
	ldr	r0, [r0, #120]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	MVC_UnMarkFrameStoreRef, .-MVC_UnMarkFrameStoreRef
	.align	2
	.global	MVC_UnMarkLTFrmByFrmIdx
	.type	MVC_UnMarkLTFrmByFrmIdx, %function
MVC_UnMarkLTFrmByFrmIdx:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	r4, [r3, #2516]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, fp, sp, pc}
	movw	ip, #47492
	add	r6, r0, #11141120
	movt	ip, 169
	add	r6, r6, #8192
	add	ip, r0, ip
	mov	r3, #0
	b	.L179
.L178:
	cmp	r3, r4
	beq	.L184
.L179:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r2, #28]
	cmp	lr, r1
	bne	.L178
	ldr	r5, [r2, #56]
	ldr	lr, [r6, #3632]
	cmp	r5, lr
	bne	.L178
	mov	r1, r2
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L184:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkLTFrmByFrmIdx, .-MVC_UnMarkLTFrmByFrmIdx
	.align	2
	.global	MVC_UnMarkLTFldByFrmIdx
	.type	MVC_UnMarkLTFldByFrmIdx, %function
MVC_UnMarkLTFldByFrmIdx:
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
	add	ip, r0, #11075584
	add	ip, ip, #45056
	ldr	r6, [ip, #2516]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	movw	r4, #47492
	add	r8, r0, #11141120
	movt	r4, 169
	add	r8, r8, #8192
	add	r4, r0, r4
	mov	ip, #0
	b	.L189
.L187:
	cmp	ip, r6
	beq	.L203
.L189:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldr	r5, [lr, #28]
	cmp	r5, r3
	bne	.L187
	ldr	r7, [lr, #56]
	ldr	r5, [r8, #3632]
	cmp	r7, r5
	bne	.L187
	cmp	r2, #1
	ldreqb	r5, [lr, #681]	@ zero_extendqisi2
	beq	.L202
	cmp	r2, #2
	bne	.L187
	ldrb	r5, [lr, #645]	@ zero_extendqisi2
.L202:
	clz	r5, r5
	mov	r5, r5, lsr #5
	cmp	lr, r1
	orrne	r5, r5, #1
	cmp	r5, #0
	beq	.L187
	mov	r1, lr
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L203:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkLTFldByFrmIdx, .-MVC_UnMarkLTFldByFrmIdx
	.align	2
	.global	MVC_UnMarkSTRef
	.type	MVC_UnMarkSTRef, %function
MVC_UnMarkSTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L205
	add	ip, r0, #11075584
	ldr	r1, [r1, #560]
	add	ip, ip, #45056
	sub	r1, r1, #1
	ldr	r4, [ip, #2512]
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L234
	movw	ip, #47428
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #8192
	add	ip, r0, ip
	b	.L211
.L210:
	cmp	r3, r4
	beq	.L235
.L211:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #620]
	cmp	lr, r2
	bne	.L210
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L210
	ldr	lr, [r1, #608]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L210
	ldr	r6, [r1, #56]
	ldr	lr, [r5, #3632]
	cmp	r6, lr
	bne	.L210
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L205:
	add	r3, r0, #11075584
	ldr	r1, [r1, #560]
	add	r3, r3, #45056
	ldr	r5, [r3, #2512]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L236
	movw	r4, #47428
	add	r7, r0, #11141120
	movt	r4, 169
	add	r7, r7, #8192
	add	r4, r0, r4
	mov	ip, #0
	b	.L216
.L212:
	tst	r3, #2
	beq	.L214
	ldr	r3, [r1, #680]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L237
.L214:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L238
.L216:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L212
	ldr	lr, [r1, #644]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L212
	ldr	r8, [r1, #56]
	ldr	lr, [r7, #3632]
	cmp	r8, lr
	bne	.L212
	ldr	lr, [r1, #656]
	cmp	lr, r2
	bne	.L212
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #11075584
	strb	r3, [r1, #3]
	add	r2, r2, #45056
	mov	r1, #0
	ldr	r3, [r2, #2376]
	strb	r1, [r3, #646]
	ldr	r3, [r2, #2376]
	ldrb	ip, [r3, #608]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #610]
	ldreq	r3, [r2, #2376]
	streqb	r1, [r3, #609]
	ldreq	r3, [r2, #2376]
	ldrb	ip, [r3, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r1, [r3, #48]
	mov	r2, ip
	add	r1, r0, r1, lsl #2
	str	ip, [r1, #148]
	ldrsb	r1, [r3, #6]
	b	.L231
.L237:
	ldr	lr, [r1, #56]
	ldr	r3, [r7, #3632]
	cmp	lr, r3
	bne	.L214
	ldr	r3, [r1, #692]
	cmp	r3, r2
	bne	.L214
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #3]
	add	r3, r3, #11075584
	mov	r2, #0
	add	r3, r3, #45056
	ldr	r1, [r3, #2376]
	strb	r2, [r1, #682]
	ldr	r1, [r3, #2376]
	ldrb	ip, [r1, #608]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #610]
	ldreq	r1, [r3, #2376]
	streqb	r2, [r1, #609]
	ldreq	r1, [r3, #2376]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r3, [r1, #48]
	mov	r2, ip
	add	r3, r0, r3, lsl #2
	str	ip, [r3, #148]
	ldrsb	r1, [r1, #6]
.L231:
	ldr	r0, [r0, #120]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	FSP_SetRef
.L238:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L235:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L234:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L236:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkSTRef, .-MVC_UnMarkSTRef
	.align	2
	.global	MVC_UnMarkLTRef
	.type	MVC_UnMarkLTRef, %function
MVC_UnMarkLTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L240
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	r5, [r3, #2516]
	cmp	r5, #0
	beq	.L269
	movw	r4, #47492
	add	r7, r0, #11141120
	movt	r4, 169
	add	r7, r7, #8192
	add	r4, r0, r4
	mov	ip, #0
	b	.L249
.L245:
	tst	r3, #2
	beq	.L247
	ldr	r3, [r1, #680]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L270
.L247:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L271
.L249:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L245
	ldr	lr, [r1, #644]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L245
	ldr	r8, [r1, #56]
	ldr	lr, [r7, #3632]
	cmp	r8, lr
	bne	.L245
	ldr	lr, [r1, #652]
	cmp	r2, lr
	bne	.L245
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #11075584
	strb	r3, [r1, #3]
	add	r2, r2, #45056
	mov	r1, #0
	ldr	r3, [r2, #2440]
	strb	r1, [r3, #645]
	ldr	r3, [r2, #2440]
	ldrb	ip, [r3, #608]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #610]
	ldreq	r3, [r2, #2440]
	streqb	r1, [r3, #609]
	ldreq	r3, [r2, #2440]
	ldrb	ip, [r3, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r1, [r3, #48]
	mov	r2, ip
	add	r1, r0, r1, lsl #2
	str	ip, [r1, #148]
	ldrsb	r1, [r3, #6]
	b	.L266
.L240:
	add	r1, r0, #11075584
	add	r1, r1, #45056
	ldr	r4, [r1, #2516]
	cmp	r4, #0
	beq	.L272
	movw	ip, #47492
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #8192
	add	ip, r0, ip
	b	.L251
.L250:
	cmp	r3, r4
	beq	.L273
.L251:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #616]
	cmp	lr, r2
	bne	.L250
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L250
	ldr	lr, [r1, #608]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L250
	ldr	r6, [r1, #56]
	ldr	lr, [r5, #3632]
	cmp	r6, lr
	bne	.L250
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L270:
	ldr	lr, [r1, #56]
	ldr	r3, [r7, #3632]
	cmp	lr, r3
	bne	.L247
	ldr	r3, [r1, #688]
	cmp	r2, r3
	bne	.L247
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #3]
	add	r3, r3, #11075584
	mov	r2, #0
	add	r3, r3, #45056
	ldr	r1, [r3, #2440]
	strb	r2, [r1, #681]
	ldr	r1, [r3, #2440]
	ldrb	ip, [r1, #608]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #610]
	ldreq	r1, [r3, #2440]
	streqb	r2, [r1, #609]
	ldreq	r1, [r3, #2440]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r3, [r1, #48]
	mov	r2, ip
	add	r3, r0, r3, lsl #2
	str	ip, [r3, #148]
	ldrsb	r1, [r1, #6]
.L266:
	ldr	r0, [r0, #120]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	FSP_SetRef
.L273:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L271:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L272:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L269:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkLTRef, .-MVC_UnMarkLTRef
	.align	2
	.global	MVC_MarkPicLTRef
	.type	MVC_MarkPicLTRef, %function
MVC_MarkPicLTRef:
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
	ldrb	r6, [r3, #3]	@ zero_extendqisi2
	add	r3, r0, #11075584
	add	r3, r3, #45056
	cmp	r6, #0
	beq	.L275
	ldr	r7, [r3, #2512]
	cmp	r7, #0
	beq	.L304
	movw	r5, #47428
	add	r8, r0, #11141120
	movt	r5, 169
	add	r8, r8, #8192
	add	r5, r0, r5
	mov	ip, #0
	b	.L289
.L281:
	tst	r4, #2
	beq	.L284
	ldr	lr, [r3, #680]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	beq	.L305
.L284:
	add	ip, ip, #1
	cmp	ip, r7
	beq	.L306
.L289:
	ldr	r3, [r5, #4]!
	ldrb	r4, [r3, #3]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L281
	ldr	lr, [r3, #644]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L281
	ldr	lr, [r3, #656]
	cmp	lr, r2
	bne	.L281
	ldr	r9, [r3, #56]
	ldr	lr, [r8, #3632]
	cmp	r9, lr
	bne	.L281
	ldrb	lr, [r3, #681]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L285
	ldr	lr, [r3, #28]
	cmp	lr, r1
	bne	.L284
.L285:
	add	r0, r0, ip, lsl #2
	str	r1, [r3, #28]
	add	r3, r0, #11075584
	sub	r6, r6, #1
	add	r3, r3, #45056
	clz	r6, r6
	mov	ip, #1
	mov	r0, #0
	ldr	r2, [r3, #2376]
	mov	r6, r6, lsr #5
	add	r1, r6, r1, lsl #1
	str	r1, [r2, #652]
	ldr	r2, [r3, #2376]
	strb	ip, [r2, #645]
	ldr	r2, [r3, #2376]
	strb	r0, [r2, #646]
	ldr	r2, [r3, #2376]
	ldrb	r1, [r2, #608]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L307
	ldrb	r1, [r2, #681]	@ zero_extendqisi2
	ldrb	r0, [r2, #645]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r2, #609]
	ldreq	r3, [r3, #2376]
	ldreqb	r2, [r3, #646]	@ zero_extendqisi2
	streqb	r2, [r3, #610]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L275:
	ldr	r4, [r3, #2512]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	ip, #47428
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #8192
	add	ip, r0, ip
	b	.L280
.L279:
	add	r6, r6, #1
	cmp	r6, r4
	beq	.L308
.L280:
	ldr	r3, [ip, #4]!
	ldrb	lr, [r3, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L279
	ldr	lr, [r3, #608]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L279
	ldr	lr, [r3, #620]
	cmp	lr, r2
	bne	.L279
	ldr	r7, [r3, #56]
	ldr	lr, [r5, #3632]
	cmp	r7, lr
	bne	.L279
	add	r6, r0, r6, lsl #2
	str	r1, [r3, #28]
	add	r3, r6, #11075584
	mov	r0, #1
	add	r3, r3, #45056
	mov	r2, #0
	ldr	ip, [r3, #2376]
	str	r1, [ip, #616]
	ldr	r1, [r3, #2376]
	strb	r0, [r1, #609]
	ldr	r1, [r3, #2376]
	strb	r0, [r1, #645]
	ldr	r1, [r3, #2376]
	strb	r0, [r1, #681]
	ldr	r1, [r3, #2376]
	strb	r2, [r1, #610]
	ldr	r1, [r3, #2376]
	strb	r2, [r1, #646]
	ldr	r3, [r3, #2376]
	strb	r2, [r3, #682]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L305:
	ldr	lr, [r3, #692]
	cmp	lr, r2
	bne	.L284
	ldr	r4, [r3, #56]
	ldr	lr, [r8, #3632]
	cmp	r4, lr
	bne	.L284
	ldrb	lr, [r3, #645]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L288
	ldr	lr, [r3, #28]
	cmp	lr, r1
	bne	.L284
.L288:
	add	r0, r0, ip, lsl #2
	str	r1, [r3, #28]
	add	r3, r0, #11075584
	sub	r6, r6, #2
	add	r3, r3, #45056
	clz	r6, r6
	mov	ip, #1
	mov	r0, #0
	ldr	r2, [r3, #2376]
	mov	r6, r6, lsr #5
	add	r1, r6, r1, lsl #1
	str	r1, [r2, #688]
	ldr	r2, [r3, #2376]
	strb	ip, [r2, #681]
	ldr	r2, [r3, #2376]
	strb	r0, [r2, #682]
	ldr	r2, [r3, #2376]
	ldrb	r1, [r2, #608]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L309
	ldrb	r1, [r2, #681]	@ zero_extendqisi2
	ldrb	r0, [r2, #645]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r2, #609]
	ldreq	r3, [r3, #2376]
	ldreqb	r2, [r3, #682]	@ zero_extendqisi2
	streqb	r2, [r3, #610]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L306:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L308:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L307:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L309:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L304:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_MarkPicLTRef, .-MVC_MarkPicLTRef
	.align	2
	.global	MVC_MarkSTToLTRef
	.type	MVC_MarkSTToLTRef, %function
MVC_MarkSTToLTRef:
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
	ldrb	r1, [r1, #3]	@ zero_extendqisi2
	mov	r7, r3
	mov	r6, r0
	cmp	r1, #0
	bne	.L311
	ldr	r4, [r5, #560]
	mov	r1, r3
	sub	r4, r4, #1
	rsb	r4, r2, r4
	bl	MVC_UnMarkLTFrmByFrmIdx
.L312:
	mov	r3, r5
	mov	r2, r4
	mov	r1, r7
	mov	r0, r6
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MVC_MarkPicLTRef
.L311:
	add	r3, r0, #11075584
	ldr	r4, [r5, #560]
	add	r3, r3, #45056
	ldr	lr, [r3, #2512]
	rsb	r4, r2, r4, lsl #1
	cmp	lr, #0
	beq	.L312
	movw	ip, #47428
	add	r8, r0, #11141120
	movt	ip, 169
	add	r8, r8, #8192
	add	ip, r0, ip
	mov	r3, #0
	b	.L315
.L313:
	tst	r2, #2
	beq	.L314
	ldr	r2, [r1, #680]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	beq	.L326
.L314:
	cmp	r3, lr
	beq	.L312
.L315:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L313
	ldr	r0, [r1, #644]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L313
	ldr	r0, [r1, #656]
	cmp	r0, r4
	bne	.L313
	ldr	r9, [r1, #56]
	ldr	r0, [r8, #3632]
	cmp	r9, r0
	bne	.L313
	mov	r3, r7
	mov	r2, #1
	mov	r0, r6
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L312
.L326:
	ldr	r2, [r1, #692]
	cmp	r2, r4
	bne	.L314
	ldr	r0, [r1, #56]
	ldr	r2, [r8, #3632]
	cmp	r0, r2
	bne	.L314
	mov	r3, r7
	mov	r2, #2
	mov	r0, r6
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L312
	UNWIND(.fnend)
	.size	MVC_MarkSTToLTRef, .-MVC_MarkSTToLTRef
	.align	2
	.global	MVC_UpdateMaxLTFrmIdx
	.type	MVC_UpdateMaxLTFrmIdx, %function
MVC_UpdateMaxLTFrmIdx:
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
	add	r5, r0, #11075584
	mov	r8, r0
	add	r5, r5, #45056
	ldr	r3, [r5, #2516]
	str	r1, [r5, #2520]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r6, #47492
	add	r7, r0, #11141120
	movt	r6, 169
	add	r7, r7, #8192
	add	r6, r0, r6
	mov	r3, r1
	mov	r4, #0
	b	.L331
.L329:
	ldr	r3, [r5, #2516]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r5, #2520]
.L331:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #28]
	cmp	r2, r3
	bcc	.L329
	ldr	r2, [r1, #56]
	ldr	r3, [r7, #3632]
	cmp	r2, r3
	bne	.L329
	mov	r0, r8
	bl	MVC_UnMarkFrameStoreRef
	b	.L329
	UNWIND(.fnend)
	.size	MVC_UpdateMaxLTFrmIdx, .-MVC_UpdateMaxLTFrmIdx
	.align	2
	.global	MVC_UnMarkAllSTRef
	.type	MVC_UnMarkAllSTRef, %function
MVC_UnMarkAllSTRef:
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
	add	r6, r0, #11075584
	mov	r8, r0
	add	r6, r6, #45056
	ldr	r3, [r6, #2512]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r5, #47428
	add	r7, r0, #11141120
	movt	r5, 169
	add	r7, r7, #8192
	add	r5, r0, r5
	mov	r4, #0
	b	.L335
.L334:
	ldr	r3, [r6, #2512]
	cmp	r3, r4
	bls	.L338
.L335:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r3, [r7, #3632]
	ldr	r2, [r1, #56]
	cmp	r2, r3
	bne	.L334
	mov	r0, r8
	bl	MVC_UnMarkFrameStoreRef
	ldr	r3, [r6, #2512]
	cmp	r3, r4
	bhi	.L335
.L338:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkAllSTRef, .-MVC_UnMarkAllSTRef
	.align	2
	.global	MVC_MarkCurrPicLT
	.type	MVC_MarkCurrPicLT, %function
MVC_MarkCurrPicLT:
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
	beq	.L342
	mov	r3, r5
	ldr	r1, [r1, #552]
	bl	MVC_UnMarkLTFldByFrmIdx
.L341:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #564]
	strb	r2, [r4, #4]
	strb	r3, [r4, #5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L342:
	mov	r1, r5
	bl	MVC_UnMarkLTFrmByFrmIdx
	b	.L341
	UNWIND(.fnend)
	.size	MVC_MarkCurrPicLT, .-MVC_MarkCurrPicLT
	.align	2
	.global	MVC_RemoveFrameStoreOutDPB
	.type	MVC_RemoveFrameStoreOutDPB, %function
MVC_RemoveFrameStoreOutDPB:
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
	add	r1, r0, r1, lsl #2
	mov	r5, r0
	add	r4, r1, #11075584
	add	r7, r4, #45056
	ldr	r2, [r7, #2312]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r2, #52]
	movw	r3, #47576
	add	r6, r0, #11075584
	movt	r3, 169
	add	r1, r0, r1
	add	r0, r6, #45056
	add	r3, r1, r3
	mov	r1, #0
	strb	r1, [r3, #4]
	ldr	r3, [r0, #2736]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r0, #2736]
	ldrsb	r1, [r2, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L346
	ldr	r3, [r0, #20]
	cmp	r3, #3
	beq	.L347
	ldr	r3, [r7, #2312]
	mov	r2, #0
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
.L347:
	ldr	r3, [r7, #2312]
	mov	r2, #0
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
.L346:
	add	r1, r4, #45056
	mov	r3, #0
	add	r6, r6, #45056
	ldr	r2, [r1, #2312]
	strb	r3, [r2, #2]
	ldr	r2, [r1, #2312]
	strb	r3, [r2, #5]
	ldr	r2, [r1, #2312]
	strb	r3, [r2, #3]
	str	r3, [r1, #2312]
	ldr	r3, [r6, #2508]
	sub	r3, r3, #1
	str	r3, [r6, #2508]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_RemoveFrameStoreOutDPB, .-MVC_RemoveFrameStoreOutDPB
	.align	2
	.global	MVC_RemoveUnUsedFrameStore
	.type	MVC_RemoveUnUsedFrameStore, %function
MVC_RemoveUnUsedFrameStore:
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
	add	r3, r0, #11075584
	mov	r8, r0
	add	r3, r3, #45056
	mov	r7, r1
	ldr	r6, [r3, #2504]
	cmp	r6, #0
	beq	.L375
	movw	r5, #47364
	mov	r4, #0
	movt	r5, 169
	add	r5, r0, r5
.L363:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	beq	.L362
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L362
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L362
	ldr	r1, [r3, #56]
	cmn	r7, #1
	cmpne	r1, r7
	beq	.L376
.L362:
	add	r4, r4, #1
	cmp	r4, r6
	bne	.L363
.L375:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L376:
	ldr	ip, [r3, #16]
	mov	r1, r4
	mov	r0, r8
	cmp	ip, #1
	beq	.L362
	strb	r2, [r3, #2]
	bl	MVC_RemoveFrameStoreOutDPB
	b	.L362
	UNWIND(.fnend)
	.size	MVC_RemoveUnUsedFrameStore, .-MVC_RemoveUnUsedFrameStore
	.align	2
	.global	MVC_CheckFrameStore
	.type	MVC_CheckFrameStore, %function
MVC_CheckFrameStore:
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
	ldrb	r3, [r0, #6]	@ zero_extendqisi2
	mov	r5, r0
	mov	r4, r1
	cmp	r3, #0
	bne	.L378
	ldrsb	r3, [r1, #8]
	cmp	r3, #1
	bne	.L393
	strb	r3, [r0, #6]
.L378:
	ldrsb	r1, [r4, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L380
	ldr	r3, [r0, #20]
	cmp	r3, #0
	cmpne	r3, #3
	bne	.L406
	ldr	r2, [r4, #16]
	cmp	r2, #1
	beq	.L407
.L392:
	str	r3, [sp]
	movw	r1, #1143
	ldr	r3, .L412
	mov	r0, #1
	ldr	r2, .L412+4
	bl	dprint_normal
	mvn	r0, #2
.L402:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L406:
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L384
	cmp	r2, #1
	beq	.L384
	cmp	r3, #3
	beq	.L408
	cmp	r3, #1
	beq	.L409
	cmp	r3, #2
	beq	.L410
.L387:
	ldr	r2, [r5, #224]
	ldr	r3, [r0, #136]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	movls	r0, #0
	bls	.L402
	str	r2, [sp]
	movw	r1, #1176
	ldr	r2, .L412+8
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L402
.L408:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L387
	str	r3, [sp]
	movw	r1, #1158
	ldr	r2, .L412+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L402
.L409:
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L387
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L412+16
	movw	r1, #1164
	bl	dprint_normal
	mvn	r0, #0
	b	.L402
.L380:
	ldr	r3, [r4, #16]
	cmp	r3, #1
	beq	.L411
.L390:
	ldr	r3, .L412
	movw	r1, #1139
	ldr	r2, .L412+20
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L407:
	mov	r3, #2
	str	r3, [r4, #16]
	ldr	r3, [r0, #20]
	b	.L392
.L410:
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	tst	r2, #2
	beq	.L387
	str	r2, [sp]
	movw	r1, #1170
	ldr	r2, .L412+24
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L402
.L393:
	mvn	r0, #0
	b	.L402
.L411:
	mov	r3, #2
	str	r3, [r4, #16]
	b	.L390
.L384:
	str	r2, [sp]
	mov	r1, #1152
	ldr	r2, .L412+28
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L402
.L413:
	.align	2
.L412:
	.word	.LANCHOR0
	.word	.LC5
	.word	.LC10
	.word	.LC7
	.word	.LC8
	.word	.LC4
	.word	.LC9
	.word	.LC6
	UNWIND(.fnend)
	.size	MVC_CheckFrameStore, .-MVC_CheckFrameStore
	.align	2
	.global	MVC_ExchangePts
	.type	MVC_ExchangePts, %function
MVC_ExchangePts:
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
	add	r8, r1, #288
	mvn	r7, #0
	mvn	r6, #0
	ldrd	r2, [r8, #-8]
	mov	r5, r0
	cmp	r3, r7
	cmpeq	r2, r6
	beq	.L414
	add	r9, r0, #11075584
	add	r9, r9, #45056
	ldr	r3, [r9, #2504]
	cmp	r3, #0
	beq	.L414
	movw	r10, #47364
	mvn	r6, #1
	movt	r10, 169
	add	r10, r0, r10
	mvn	r7, #0
	mov	r4, #0
	mvn	r3, #0
	str	r3, [fp, #-48]
.L419:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L418
	ldrsb	r1, [r3, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L418
	ldr	r3, [r0, #20]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L418
	ldr	r3, [r10]
	add	r3, r3, #288
	ldrd	r0, [r3, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r4, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L418:
	ldr	r3, [r9, #2504]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L419
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L414
	ldrd	r2, [r8, #-8]
	cmp	r3, r7
	cmpeq	r2, r6
	bhi	.L433
.L414:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L433:
	ldr	ip, [r5, #120]
	movw	r1, #1224
	strd	r2, [sp]
	mov	r0, #24
	strd	r6, [sp, #8]
	mov	r3, ip
	ldr	r2, .L434
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	movw	r1, #28226
	movt	r1, 42
	add	r1, r3, r1
	ldrd	r2, [r8, #-8]
	ldr	r1, [r5, r1, asl #2]
	add	r1, r1, #288
	strd	r2, [r1, #-8]
	strd	r6, [r8, #-8]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L435:
	.align	2
.L434:
	.word	.LC11
	UNWIND(.fnend)
	.size	MVC_ExchangePts, .-MVC_ExchangePts
	.align	2
	.global	MVC_GetImagePara
	.type	MVC_GetImagePara, %function
MVC_GetImagePara:
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
	UNWIND(.pad #4)
	sub	sp, sp, #4
	add	r3, r0, #11075584
	add	ip, r3, #40960
	mov	r4, r1
	ldr	r2, [r0, #252]
	mov	r5, r0
	ldr	r1, [ip, #664]
	mov	r0, #2240
	ldrb	r7, [r4, #229]	@ zero_extendqisi2
	movw	r8, #3992
	ldrb	lr, [r4, #228]	@ zero_extendqisi2
	mla	r1, r0, r1, r2
	ldr	r6, [r5, #248]
	bfc	r7, #0, #2
	bfc	lr, #0, #2
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	ldr	r2, [r1, #28]
	strb	r7, [r4, #229]
	strb	lr, [r4, #228]
	ldr	r1, [r5, #56]
	mla	r2, r8, r2, r6
	str	r1, [r4, #136]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L472
.L439:
	.word	.L438
	.word	.L440
	.word	.L441
	.word	.L438
.L441:
	ldrb	r1, [r4, #229]	@ zero_extendqisi2
	add	r3, r5, #11075584
	ldr	r6, [r4, #44]
	add	r3, r3, #45056
	and	r1, r1, #240
	ldrb	lr, [r4, #228]	@ zero_extendqisi2
	orr	r1, r1, #11
	strb	r1, [r4, #229]
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r6, [r4, #168]
	bfi	lr, r1, #0, #2
	strb	lr, [r4, #228]
.L437:
	ldrb	r1, [r2, #20]	@ zero_extendqisi2
	str	r1, [r4, #572]
	str	r1, [r4, #576]
	ldrb	r1, [r2, #24]	@ zero_extendqisi2
	cmp	r1, #0
	ldrne	r1, [r2, #68]
	mov	r2, #1
	str	r2, [r4, #580]
	str	r1, [r4, #584]
	ldrb	r2, [ip, #659]	@ zero_extendqisi2
	cmp	r2, #1
	movne	r2, #0
	str	r2, [r4, #188]
	ldr	r2, [r5, #224]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L459
	ldrb	r2, [r4, #608]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L459
	cmp	r0, #3
	ldreqb	r1, [r4, #229]	@ zero_extendqisi2
	bfieq	r1, r2, #0, #2
	streqb	r1, [r4, #229]
.L459:
	ldrb	r2, [r3, #2264]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L460
	ldr	r2, [r3, #2280]
	cmp	r2, #3
	moveq	r3, #1
	streq	r3, [r4, #224]
	beq	.L460
	cmp	r2, #4
	moveq	r3, #2
	streq	r3, [r4, #224]
	beq	.L460
	cmp	r2, #5
	moveq	r3, #3
	streq	r3, [r4, #224]
	beq	.L460
	mov	r0, #0
	ldr	r2, .L483
	str	r0, [r4, #224]
	movw	r1, #1427
	ldr	r3, [r3, #2280]
	bl	dprint_normal
.L460:
	ldr	r0, [r5, #120]
	ldrsb	r1, [r4, #6]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	ip, [r3, #68]
	add	r1, r4, #72
	ldrb	lr, [r4, #230]	@ zero_extendqisi2
	mov	r2, #536
	ldr	r5, .L483+4
	str	ip, [r4, #140]
	ldrb	ip, [r3, #158]	@ zero_extendqisi2
	ubfx	ip, ip, #1, #1
	bfi	lr, ip, #1, #1
	strb	lr, [r4, #230]
	ldrb	lr, [r3, #420]	@ zero_extendqisi2
	ldr	ip, [r5, #52]
	strb	lr, [r4, #492]
	ldr	lr, [r3, #432]
	str	lr, [r4, #504]
	ldr	lr, [r3, #436]
	str	lr, [r4, #508]
	ldr	lr, [r3, #424]
	str	lr, [r4, #496]
	ldr	lr, [r3, #428]
	str	lr, [r4, #500]
	ldr	r3, [r3, #452]
	str	r3, [r4, #524]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	ip
.L440:
	ldrb	r1, [r4, #229]	@ zero_extendqisi2
	add	r3, r5, #11075584
	ldr	r6, [r4, #44]
	add	r3, r3, #45056
	ldrb	lr, [r4, #228]	@ zero_extendqisi2
	orr	r1, r1, #3
	strb	r1, [r4, #229]
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r6, [r4, #168]
	bfi	lr, r1, #0, #2
	strb	lr, [r4, #228]
	b	.L437
.L438:
	ldrb	r1, [r4, #608]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L442
	ldr	lr, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	lr, #0
	ldrb	r8, [r4]	@ zero_extendqisi2
	movne	r6, #3
	str	r1, [r4, #168]
	movne	r7, r6
	moveq	r6, #2
	moveq	r7, #3
.L443:
	ldr	lr, [r4, #660]
	ldr	r1, [r4, #696]
	cmp	lr, r1
	beq	.L481
	movle	lr, #1
	movgt	lr, #0
.L454:
	add	r3, r3, #45056
	ldrb	r1, [r3, #2300]	@ zero_extendqisi2
	cmp	r1, #3
	moveq	lr, #1
	beq	.L455
	cmp	r1, #4
	moveq	lr, #0
.L455:
	ldrb	r1, [r4, #229]	@ zero_extendqisi2
	ldrb	r9, [r4, #228]	@ zero_extendqisi2
	bfi	r1, lr, #4, #2
	bfi	r1, r7, #2, #2
	bfi	r9, r8, #0, #2
	bfi	r1, r6, #0, #2
	strb	r9, [r4, #228]
	strb	r1, [r4, #229]
	b	.L437
.L442:
	ldr	lr, [r4, #668]
	ldr	r1, [r5, #116]
	ldr	r10, [r4, #704]
	cmp	lr, r1
	bhi	.L482
	cmp	r1, r10
	bcc	.L447
.L445:
	ldr	r1, [r4, #44]
	mov	r7, #3
	ldrb	r8, [r4]	@ zero_extendqisi2
	ldrb	r6, [r4, #647]	@ zero_extendqisi2
	ldrb	r9, [r4, #683]	@ zero_extendqisi2
	str	r1, [r4, #168]
.L448:
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	cmp	r1, #1
	streq	r10, [r4, #168]
	moveq	r8, r9
	moveq	r7, #2
	beq	.L450
	cmp	r1, #2
	streq	lr, [r4, #168]
	moveq	r8, r6
	moveq	r7, #1
.L450:
	str	r6, [r4, #96]
	mov	r6, #3
	str	r9, [r4, #100]
	b	.L443
.L447:
	ldrb	r8, [r4, #647]	@ zero_extendqisi2
	mov	r7, #1
	ldrb	r9, [r4, #683]	@ zero_extendqisi2
	str	lr, [r4, #168]
	mov	r6, r8
	b	.L448
.L481:
	ldr	r1, [r4, #104]
	cmp	r1, #720
	movne	lr, #1
	bne	.L454
	ldr	lr, [r4, #108]
	subs	lr, lr, #480
	movne	lr, #1
	b	.L454
.L482:
	cmp	r1, r10
	bcc	.L445
	ldrb	r8, [r4, #683]	@ zero_extendqisi2
	mov	r7, #2
	str	r10, [r4, #168]
	ldrb	r6, [r4, #647]	@ zero_extendqisi2
	mov	r9, r8
	b	.L448
.L472:
	add	r3, r5, #11075584
	add	r3, r3, #45056
	b	.L437
.L484:
	.align	2
.L483:
	.word	.LC12
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MVC_GetImagePara, .-MVC_GetImagePara
	.align	2
	.global	MVC_SetFrmRepeatCount
	.type	MVC_SetFrmRepeatCount, %function
MVC_SetFrmRepeatCount:
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
	ldr	r3, [r0, #224]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_SetFrmRepeatCount.part.1
	UNWIND(.fnend)
	.size	MVC_SetFrmRepeatCount, .-MVC_SetFrmRepeatCount
	.align	2
	.global	MVC_SplitFrmToFlds
	.type	MVC_SplitFrmToFlds, %function
MVC_SplitFrmToFlds:
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
	ldrb	lr, [r0, #609]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #610]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #632]
	ldrb	r2, [r0, #611]	@ zero_extendqisi2
	ldr	r3, [r0, #612]
	strb	r5, [r0, #644]
	strb	r4, [r0, #680]
	strb	lr, [r0, #645]
	strb	lr, [r0, #681]
	strb	ip, [r0, #646]
	strb	ip, [r0, #682]
	str	r1, [r0, #668]
	str	r1, [r0, #704]
	strb	r2, [r0, #647]
	strb	r2, [r0, #683]
	str	r3, [r0, #648]
	str	r3, [r0, #684]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_SplitFrmToFlds, .-MVC_SplitFrmToFlds
	.align	2
	.global	MVC_CombineFldsToFrm
	.type	MVC_CombineFldsToFrm, %function
MVC_CombineFldsToFrm:
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
	ldr	r2, [r0, #696]
	mov	lr, #3
	ldr	r1, [r0, #660]
	ldr	r3, [r0, #704]
	cmp	r2, r1
	ldr	r5, [r0, #668]
	ldrb	r4, [r0, #681]	@ zero_extendqisi2
	ldr	ip, [r0, #648]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #608]
	mov	r3, r3, lsr #1
	str	ip, [r0, #612]
	str	r2, [r0, #624]
	str	r2, [r0, #32]
	str	r3, [r0, #632]
	beq	.L489
	ldrb	r2, [r0, #645]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L490
.L489:
	ldr	r2, [r0, #680]
	mov	r1, #0
	strb	r1, [r0, #609]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L494
	ldr	r2, [r0, #644]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	ip, #1
	bne	.L492
.L494:
	mov	ip, #0
.L492:
	ldrb	r2, [r0, #683]	@ zero_extendqisi2
	ldrb	r1, [r0, #647]	@ zero_extendqisi2
	str	r3, [r0, #44]
	cmp	r2, r1
	strb	ip, [r0, #610]
	movcs	r3, r2
	movcc	r3, r1
	strb	r3, [r0, #611]
	strb	r3, [r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L490:
	mov	r1, #1
	strb	r1, [r0, #609]
	b	.L494
	UNWIND(.fnend)
	.size	MVC_CombineFldsToFrm, .-MVC_CombineFldsToFrm
	.align	2
	.global	MVC_GetAPC
	.type	MVC_GetAPC, %function
MVC_GetAPC:
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
	subs	r6, r1, #0
	mov	r5, r0
	beq	.L525
	cmp	r2, #1
	beq	.L506
	cmp	r2, #2
	beq	.L507
	ldr	r9, [r6, #660]
	ldr	r10, [r6, #696]
.L508:
	add	r8, r5, #11075584
	add	r7, r8, #45056
	ldr	r1, [r7, #2732]
	cmp	r1, #0
	beq	.L517
	ldrb	r4, [r7, #2524]	@ zero_extendqisi2
	cmp	r4, #0
	movwne	r3, #47580
	movne	r4, #0
	movtne	r3, 169
	addne	r3, r5, r3
	bne	.L511
	b	.L509
.L515:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L509
.L511:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L515
.L517:
	mvn	r0, #0
.L521:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L507:
	ldr	r9, [r6, #696]
	mov	r10, r9
	b	.L508
.L509:
	ldrsb	r1, [r6, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L512
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L512
	add	r2, r5, r4
	movw	r3, #47576
	movt	r3, 169
	add	r3, r2, r3
	mov	r2, #1
	add	r5, r5, r4, lsl #2
	strb	r2, [r3, #4]
	add	r5, r5, #11075584
	ldr	r3, [r0, #24]
	add	r5, r5, #45056
	add	r8, r8, #45056
	movw	r1, #1722
	mov	r0, #11
	ldr	r3, [r3, #36]
	str	r9, [r5, #2604]
	str	r10, [r5, #2668]
	str	r3, [r5, #2540]
	ldr	r3, [r7, #2736]
	cmp	r3, #15
	addls	r3, r3, r2
	ldr	r2, .L526
	movhi	r3, #16
	str	r3, [r8, #2736]
	ldr	r3, [r6, #160]
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, #0
	str	r4, [r6, #52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L506:
	ldr	r9, [r6, #660]
	mov	r10, r9
	b	.L508
.L512:
	ldrb	r2, [r6, #3]	@ zero_extendqisi2
	mov	r1, #0
	ldrsb	r3, [r6, #6]
	str	r0, [sp, #4]
	mov	r0, r1
	str	r2, [sp]
	str	r1, [sp, #8]
	movw	r1, #1730
	ldr	r2, .L526+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L521
.L525:
	movw	r1, #1688
	mov	r0, r6
	str	r1, [sp]
	ldr	r3, .L526+8
	ldr	r2, .L526+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L521
.L527:
	.align	2
.L526:
	.word	.LC15
	.word	.LC16
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_GetAPC, .-MVC_GetAPC
	.align	2
	.global	MVC_SlidingWinMark
	.type	MVC_SlidingWinMark, %function
MVC_SlidingWinMark:
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
	add	r3, r0, #11075584
	ldr	r2, [r0, #236]
	add	r3, r3, #45056
	mov	r10, r0
	ldr	r0, [r3, #2516]
	ldr	r2, [r2, #3944]
	ldr	r1, [r3, #2512]
	rsb	r2, r0, r2
	cmp	r1, r2
	beq	.L553
.L528:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L553:
	ldr	r8, [r3, #2504]
	cmp	r8, #0
	beq	.L533
	movw	r6, #47364
	add	r1, r10, #11141120
	movt	r6, 169
	mov	r2, #0
	add	r1, r1, #8192
	add	r6, r10, r6
	mov	r5, r2
	mvn	r9, #-2147483648
.L532:
	ldr	r4, [r6, #4]!
	cmp	r4, #0
	beq	.L531
	ldr	r7, [r4, #64]
	cmp	r9, r7
	bls	.L531
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r4
	cmp	r3, #0
	beq	.L531
	str	r1, [fp, #-52]
	str	r2, [fp, #-48]
	bl	MVC_NonLongTermRefFlg
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-52]
	cmp	r0, #0
	beq	.L531
	ldr	r0, [r4, #56]
	ldr	r3, [r1, #3632]
	cmp	r0, r3
	moveq	r9, r7
	moveq	r2, r5
.L531:
	add	r5, r5, #1
	cmp	r5, r8
	bne	.L532
.L530:
	movw	r3, #28226
	movt	r3, 42
	add	r3, r2, r3
	ldr	r4, [r10, r3, asl #2]
	cmp	r4, #0
	beq	.L528
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L528
	mov	r0, r4
	bl	MVC_NonLongTermRefFlg
	cmp	r0, #0
	beq	.L528
	add	r3, r10, #11141120
	ldr	r2, [r4, #56]
	add	r3, r3, #8192
	ldr	r3, [r3, #3632]
	cmp	r2, r3
	bne	.L528
	mov	r0, r10
	mov	r1, r4
	bl	MVC_UnMarkFrameStoreRef
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	MVC_UpdateReflist
.L533:
	mov	r2, r8
	b	.L530
	UNWIND(.fnend)
	.size	MVC_SlidingWinMark, .-MVC_SlidingWinMark
	.align	2
	.global	MVC_SimpleSlideDPB
	.type	MVC_SimpleSlideDPB, %function
MVC_SimpleSlideDPB:
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
	add	r3, r0, #11075584
	mov	r6, r0
	add	r3, r3, #45056
	ldr	r4, [r3, #2504]
	ldr	r3, [r3, #2508]
	cmp	r3, r4
	addcc	r5, r0, #11141120
	bcc	.L555
	cmp	r4, #0
	beq	.L560
	movw	r1, #47364
	add	r5, r0, #11141120
	movt	r1, 169
	mov	lr, #0
	add	r8, r5, #8192
	add	r1, r0, r1
	mov	r3, lr
	mvn	ip, #-2147483648
.L558:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L557
	ldr	r0, [r2, #64]
	cmp	ip, r0
	bls	.L557
	ldr	r7, [r2, #56]
	ldr	r2, [r8, #3632]
	cmp	r7, r2
	moveq	ip, r0
	moveq	lr, r3
.L557:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L558
	mov	r4, lr
.L556:
	movw	r3, #28226
	mov	r0, r6
	movt	r3, 42
	add	r3, lr, r3
	ldr	r1, [r6, r3, asl #2]
	bl	MVC_UnMarkFrameStoreRef
	mov	r1, r4
	mov	r0, r6
	bl	MVC_RemoveFrameStoreOutDPB
.L555:
	add	r3, r5, #8192
	mov	r1, #0
	ldr	r2, [r3, #3568]
	strb	r1, [r3, #3004]
	cmp	r2, r1
	movne	r2, #1
	strneb	r2, [r3, #3005]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L560:
	add	r5, r0, #11141120
	mov	lr, r4
	b	.L556
	UNWIND(.fnend)
	.size	MVC_SimpleSlideDPB, .-MVC_SimpleSlideDPB
	.align	2
	.global	MVC_ReleaseNAL
	.type	MVC_ReleaseNAL, %function
MVC_ReleaseNAL:
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
	beq	.L579
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #3]
.L574:
	ldr	r3, [r4, #8]
	mov	r0, r6
	cmp	r3, #0
	beq	.L573
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #12]
	ldr	r3, [r4, #8]
	movw	r1, #3254
	ldr	r2, .L580
	mov	r0, #8
	str	ip, [sp]
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
.L573:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L574
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #68]
.L570:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L579:
	movw	r1, #3241
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L580+4
	ldr	r2, .L580+8
	bl	dprint_normal
	b	.L570
.L581:
	.align	2
.L580:
	.word	.LC17
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_ReleaseNAL, .-MVC_ReleaseNAL
	.align	2
	.global	MVC_ClearCurrNal
	.type	MVC_ClearCurrNal, %function
MVC_ClearCurrNal:
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
	ldr	r1, [r0, #232]
	mov	r4, r0
	cmp	r1, #0
	beq	.L583
	ldr	r0, [r0, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L583:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearCurrNal, .-MVC_ClearCurrNal
	.align	2
	.global	MVC_ClearCurrSlice
	.type	MVC_ClearCurrSlice, %function
MVC_ClearCurrSlice:
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
	mov	r1, #210
	mov	r4, r0
	ldr	r2, .L592
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L588
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L588:
	ldr	r3, [r4, #80]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #80]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L593:
	.align	2
.L592:
	.word	.LC18
	UNWIND(.fnend)
	.size	MVC_ClearCurrSlice, .-MVC_ClearCurrSlice
	.align	2
	.global	MVC_ClearAllNal
	.type	MVC_ClearAllNal, %function
MVC_ClearAllNal:
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
	add	r4, r0, #936
	add	r5, r0, #12992
	b	.L596
.L595:
	add	r4, r4, #88
	cmp	r4, r5
	beq	.L598
.L596:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L595
	mov	r1, r4
	ldr	r0, [r6, #120]
	add	r4, r4, #88
	bl	MVC_ReleaseNAL
	cmp	r4, r5
	bne	.L596
.L598:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearAllNal, .-MVC_ClearAllNal
	.align	2
	.global	MVC_ClearAllSlice
	.type	MVC_ClearAllSlice, %function
MVC_ClearAllSlice:
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
	movw	r4, #12496
	movw	r5, #13040
	movt	r4, 170
	movt	r5, 170
	add	r4, r0, r4
	add	r5, r0, r5
	mov	r6, r0
	mov	r7, #0
.L601:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L600
	ldr	r0, [r6, #120]
	bl	MVC_ReleaseNAL
	str	r7, [r4]
.L600:
	cmp	r4, r5
	bne	.L601
	mov	r0, #0
	str	r0, [r6, #64]
	str	r0, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearAllSlice, .-MVC_ClearAllSlice
	.align	2
	.global	MVC_ClearCurrPic
	.type	MVC_ClearCurrPic, %function
MVC_ClearCurrPic:
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
	bl	MVC_ClearAllSlice
	ldr	r0, [r4, #40]
	add	r3, r4, #11075584
	add	r3, r3, #40960
	mov	r2, #0
	movw	r1, #23352
	movt	r1, 1
	str	r0, [r3, #2316]
	str	r1, [r3, #2320]
	mov	r0, #2
	mov	r1, #7
	strb	r0, [r3, #2305]
	strb	r1, [r3, #2307]
	mov	r0, #32
	mov	r1, #3
	strb	r0, [r3, #2306]
	str	r1, [r3, #2328]
	mvn	r0, #0
	mov	r1, #1048576
	str	r0, [r3, #2332]
	str	r1, [r3, #2344]
	mov	r0, r2
	strb	r2, [r3, #2304]
	str	r2, [r3, #2336]
	str	r2, [r3, #2340]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearCurrPic, .-MVC_ClearCurrPic
	.align	2
	.global	MVC_ArrangeVahbMem
	.type	MVC_ArrangeVahbMem, %function
MVC_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
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
	ldr	r3, .L617
	add	r5, r0, #11075584
	mov	r6, r0
	add	r0, r5, #45056
	add	r5, r5, #36864
	mov	r8, r1
	mov	r7, r2
	ldr	r4, [r0, #2504]
	mov	r2, #36
	ldr	r3, [r3, #48]
	mov	r1, #0
	sub	r0, fp, #72
	add	r4, r4, #3
	blx	r3
	ldr	r3, [r6, #224]
	ldr	r9, [r5, #1352]
	mov	ip, #8
	ldr	r5, [r5, #1356]
	sub	r1, fp, #72
	strb	ip, [fp, #-67]
	mov	r2, #0
	str	r9, [fp, #-56]
	mov	lr, #15
	str	r5, [fp, #-52]
	ldr	r5, [r3, #16]
	ldr	r0, [r6, #120]
	cmp	r5, #24
	str	r8, [fp, #-64]
	str	r7, [fp, #-60]
	movne	ip, r4
	moveq	ip, #1
	str	ip, [fp, #-48]
	ldr	r3, [r3, #16]
	str	lr, [fp, #-72]
	cmp	r3, #24
	moveq	r4, #1
	str	r4, [fp, #-44]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L615
	cmp	r0, #0
	moveq	r0, #1
	bne	.L616
.L611:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L616:
	ldr	r3, .L617+4
	movw	r1, #3298
	ldr	r2, .L617+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #19
	b	.L611
.L615:
	add	r0, r6, #584
	bl	ResetVoQueue
	mvn	r0, #19
	b	.L611
.L618:
	.align	2
.L617:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+20
	.word	.LC19
	UNWIND(.fnend)
	.size	MVC_ArrangeVahbMem, .-MVC_ArrangeVahbMem
	.align	2
	.global	MVC_RepairList
	.type	MVC_RepairList, %function
MVC_RepairList:
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
	add	r3, r0, #11075584
	mov	r6, r0
	add	r3, r3, #40960
	ldrb	r3, [r3, #648]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L621
	bcc	.L636
	cmp	r3, #2
	bne	.L642
.L637:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L633:
	mov	r0, r6
.L642:
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L621:
	mov	r7, #2
.L622:
	movw	r5, #41652
	add	r8, r6, #11141120
	movt	r5, 169
	add	r5, r6, r5
	add	r8, r8, #8192
	add	r4, r6, #256
	ldr	r2, [r5, #4]!
	mov	ip, r6
	mov	lr, #0
	mov	r9, #1
	cmp	r2, #0
	beq	.L624
.L644:
	ldr	r10, [ip, #256]
	cmp	r10, #0
	bne	.L638
	mov	r0, r4
	mov	r3, r10
	b	.L626
.L627:
	ldr	r1, [r0, #4]!
	cmp	r1, #0
	bne	.L629
.L626:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L627
	ldr	r3, [r6, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L633
	ldr	r1, [r8, #3552]
	add	r1, r1, #608
.L629:
	mov	r0, r4
	mov	r3, #0
	b	.L635
.L631:
	ldr	r10, [r0, #4]!
.L635:
	add	r3, r3, #1
	cmp	r10, #0
	streq	r1, [r0]
	cmp	r3, r2
	bne	.L631
.L632:
	add	lr, lr, #1
	add	r4, r4, #132
	cmp	r7, lr
	add	ip, ip, #132
	bls	.L637
	ldr	r2, [r5, #4]!
	cmp	r2, #0
	bne	.L644
.L624:
	ldr	r3, [r6, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L633
	str	r9, [r5]
	ldr	r3, [r8, #3552]
	add	r3, r3, #608
	str	r3, [ip, #256]
	b	.L632
.L638:
	mov	r1, r10
	b	.L629
.L636:
	mov	r7, #1
	b	.L622
	UNWIND(.fnend)
	.size	MVC_RepairList, .-MVC_RepairList
	.align	2
	.global	MVC_GetShortTermPicPoint
	.type	MVC_GetShortTermPicPoint, %function
MVC_GetShortTermPicPoint:
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
	add	r3, r0, #11075584
	add	r2, r3, #40960
	ldrb	r4, [r2, #649]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L646
	ldrb	r2, [r2, #650]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #2
	moveq	r4, #1
.L646:
	add	r3, r3, #45056
	ldr	r5, [r3, #2512]
	cmp	r5, #0
	beq	.L654
	movw	r3, #47432
	mov	r2, #0
	movt	r3, 169
	add	r3, r0, r3
	b	.L651
.L664:
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L662
.L649:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L663
.L651:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L664
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L650
	ldr	ip, [r0, #644]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L665
.L650:
	tst	lr, #2
	beq	.L649
	ldr	ip, [r0, #680]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L649
	ldr	ip, [r0, #692]
	cmp	ip, r1
	bne	.L649
	add	r0, r0, #680
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L662:
	ldr	ip, [r0, #608]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L649
	ldr	ip, [r0, #620]
	cmp	ip, r1
	bne	.L649
	add	r0, r0, #608
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L665:
	ldr	ip, [r0, #656]
	cmp	ip, r1
	bne	.L650
	add	r0, r0, #644
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L663:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L654:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetShortTermPicPoint, .-MVC_GetShortTermPicPoint
	.align	2
	.global	MVC_GetLongTermPicPoint
	.type	MVC_GetLongTermPicPoint, %function
MVC_GetLongTermPicPoint:
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
	add	r3, r0, #11075584
	add	r2, r3, #40960
	ldrb	r4, [r2, #649]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L667
	ldrb	r2, [r2, #650]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #2
	moveq	r4, #1
.L667:
	add	r3, r3, #45056
	ldr	r5, [r3, #2516]
	cmp	r5, #0
	beq	.L675
	movw	r3, #47496
	mov	r2, #0
	movt	r3, 169
	add	r3, r0, r3
	b	.L672
.L685:
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L683
.L670:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L684
.L672:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L685
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L671
	ldr	ip, [r0, #644]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L686
.L671:
	tst	lr, #2
	beq	.L670
	ldr	ip, [r0, #680]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L670
	ldr	ip, [r0, #688]
	cmp	ip, r1
	bne	.L670
	add	r0, r0, #680
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L683:
	ldr	ip, [r0, #608]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L670
	ldr	ip, [r0, #616]
	cmp	ip, r1
	bne	.L670
	add	r0, r0, #608
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L686:
	ldr	ip, [r0, #652]
	cmp	ip, r1
	bne	.L671
	add	r0, r0, #644
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L684:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L675:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetLongTermPicPoint, .-MVC_GetLongTermPicPoint
	.align	2
	.global	MVC_ReorderSTList
	.type	MVC_ReorderSTList, %function
MVC_ReorderSTList:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	ip, r1, asl #7
	ldr	r6, [fp, #4]
	add	r5, ip, r1, lsl #2
	mov	r1, r3
	add	r5, r5, #256
	mov	r7, r2
	mov	r4, r3
	add	r5, r0, r5
	bl	MVC_GetShortTermPicPoint
	ldr	lr, [r6]
	add	r2, r7, #1
	ldr	r8, [fp, #8]
	cmp	r2, lr
	ble	.L688
	add	ip, r5, r2, lsl #2
	mov	r1, r2
.L689:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L689
.L688:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r5, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r7, r7, #2
	add	lr, r5, r0, lsl #2
	mov	ip, r0
	b	.L693
.L692:
	str	r1, [r5, ip, asl #2]
	add	ip, ip, #1
.L691:
	cmp	r0, r7
	beq	.L701
.L693:
	ldr	r1, [lr], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L691
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L692
	ldr	r3, [r1, #12]
	cmp	r3, r4
	bne	.L692
	ldr	r3, [r1, #4]
	ldr	r3, [r3, #56]
	cmp	r3, r8
	bne	.L692
	cmp	r0, r7
	bne	.L693
.L701:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ReorderSTList, .-MVC_ReorderSTList
	.align	2
	.global	MVC_ReorderLTList
	.type	MVC_ReorderLTList, %function
MVC_ReorderLTList:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	ip, r1, asl #7
	ldr	r6, [fp, #4]
	add	r5, ip, r1, lsl #2
	mov	r1, r3
	add	r5, r5, #256
	mov	r7, r2
	mov	r4, r3
	add	r5, r0, r5
	bl	MVC_GetLongTermPicPoint
	ldr	lr, [r6]
	add	r2, r7, #1
	ldr	r8, [fp, #8]
	cmp	r2, lr
	ble	.L703
	add	ip, r5, r2, lsl #2
	mov	r1, r2
.L704:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L704
.L703:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r5, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r7, r7, #2
	add	lr, r5, r0, lsl #2
	mov	ip, r0
	b	.L708
.L707:
	str	r1, [r5, ip, asl #2]
	add	ip, ip, #1
.L706:
	cmp	r0, r7
	beq	.L719
.L708:
	ldr	r1, [lr], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L706
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L707
	ldr	r3, [r1, #8]
	cmp	r3, r4
	bne	.L707
	ldr	r3, [r1, #4]
	ldr	r3, [r3, #56]
	cmp	r3, r8
	bne	.L707
	cmp	r0, r7
	bne	.L708
.L719:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ReorderLTList, .-MVC_ReorderLTList
	.align	2
	.global	MVC_GetMaxViewIdx
	.type	MVC_GetMaxViewIdx, %function
MVC_GetMaxViewIdx:
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
	add	ip, r0, #10747904
	movw	lr, #22868
	add	ip, ip, #20480
	movt	lr, 164
	add	lr, r0, lr
	ldr	r5, [ip, #2384]
	adds	r5, r5, #1
	beq	.L727
	ldr	ip, [ip, #2388]
	cmp	r1, ip
	beq	.L728
	mov	r6, r5
	mov	ip, #0
	b	.L722
.L724:
	ldr	r4, [lr, #4]!
	cmp	r1, r4
	beq	.L730
.L722:
	add	ip, ip, #1
	cmp	ip, r5
	bne	.L724
	cmp	r6, #0
	blt	.L731
.L721:
	cmp	r2, #0
	add	r6, r6, r3, lsl #1
	movwne	r3, #5718
	movweq	r3, #5726
	movt	r3, 41
	add	r3, r6, r3
	add	r0, r0, r3, lsl #2
	ldr	r0, [r0, #4]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L730:
	mov	r6, ip
	cmp	r6, #0
	bge	.L721
.L731:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L727:
	mov	r6, r5
	b	.L721
.L728:
	mov	r6, #0
	b	.L721
	UNWIND(.fnend)
	.size	MVC_GetMaxViewIdx, .-MVC_GetMaxViewIdx
	.align	2
	.global	mvc_get_inter_view_pic
	.type	mvc_get_inter_view_pic, %function
mvc_get_inter_view_pic:
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
	movw	ip, #27198
	mov	r4, #1440
	movt	ip, 42
	add	ip, r3, ip
	mla	r3, r4, r3, r0
	ldr	lr, [r0, ip, asl #2]
	movw	ip, #31360
	cmp	lr, #0
	movt	ip, 169
	add	ip, r3, ip
	beq	.L738
	add	r4, r0, #11141120
	mov	r3, #0
	mov	r0, ip
	add	r4, r4, #8192
	b	.L737
.L734:
	cmp	r3, lr
	add	r0, r0, #720
	beq	.L740
.L737:
	ldr	ip, [r0, #56]
	add	r3, r3, #1
	cmp	ip, r1
	bne	.L734
	ldrb	ip, [r4, #3003]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L735
	ldr	ip, [r0, #628]
	cmp	ip, r2
	bne	.L734
	add	r0, r0, #608
	ldmfd	sp, {r4, fp, sp, pc}
.L735:
	cmp	ip, #1
	beq	.L741
	cmp	ip, #2
	bne	.L734
	ldr	ip, [r0, #700]
	cmp	ip, r2
	bne	.L734
	add	r0, r0, #680
	ldmfd	sp, {r4, fp, sp, pc}
.L741:
	ldr	ip, [r0, #664]
	cmp	ip, r2
	bne	.L734
	add	r0, r0, #644
	ldmfd	sp, {r4, fp, sp, pc}
.L740:
	mov	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L738:
	mov	r0, lr
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	mvc_get_inter_view_pic, .-mvc_get_inter_view_pic
	.align	2
	.global	mvc_reorder_interview
	.type	mvc_reorder_interview, %function
mvc_reorder_interview:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [fp, #8]
	mov	r7, r2
	ldr	r6, [fp, #4]
	mov	r5, r3
	mov	r8, r1
	mov	r1, r3
	mov	r2, r4, asl #7
	mov	r3, r4
	add	r4, r2, r4, lsl #2
	mov	r2, r6
	add	r4, r4, #256
	add	r4, r0, r4
	bl	mvc_get_inter_view_pic
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	ip, [r7]
	add	r1, r8, #1
	cmp	r1, ip
	bls	.L744
	add	r2, r4, r1, lsl #2
	mov	r3, r1
.L745:
	ldr	ip, [r2, #-4]!
	sub	r3, r3, #1
	str	ip, [r2, #4]
	ldr	ip, [r7]
	cmp	ip, r3
	bcc	.L745
.L744:
	add	r3, ip, #1
	str	r3, [r7]
	str	r0, [r4, ip, asl #2]
	ldr	r2, [r7]
	cmp	r1, r2
	ldmccfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	ip, r4, r2, lsl #2
	mov	r0, r2
	b	.L749
.L747:
	cmp	r1, r2
	str	r3, [r4, r0, asl #2]
	add	r0, r0, #1
	bcc	.L756
.L749:
	ldr	r3, [ip], #4
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L747
	ldr	lr, [r3, #4]
	ldr	lr, [lr, #56]
	cmp	lr, r5
	bne	.L747
	ldr	lr, [r3, #20]
	cmp	lr, r6
	bne	.L747
	cmp	r1, r2
	bcs	.L749
.L756:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	mvc_reorder_interview, .-mvc_reorder_interview
	.align	2
	.global	MVC_ReorderRefPiclist
	.type	MVC_ReorderRefPiclist, %function
MVC_ReorderRefPiclist:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r5, r0
	add	r0, r0, #11075584
	str	r2, [fp, #-64]
	add	r9, r0, #40960
	mov	r2, #0
	mov	r10, r1
	str	r2, [fp, #-48]
	ldrb	r3, [r9, #649]	@ zero_extendqisi2
	cmp	r3, r2
	beq	.L758
	ldrb	r3, [r9, #650]	@ zero_extendqisi2
	cmp	r3, r2
	movne	r3, #2
	moveq	r3, #1
.L758:
	cmp	r10, #1
	bls	.L806
.L757:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L806:
	cmp	r10, #0
	beq	.L807
	movw	r1, #40692
	movw	r8, #40956
	movw	r7, #41476
	movt	r1, 169
	movt	r8, 169
	movt	r7, 169
	add	r1, r5, r1
	add	r8, r5, r8
	add	r7, r5, r7
	add	r2, r0, #41216
	str	r2, [fp, #-100]
.L761:
	ldr	r0, [r5, #236]
	cmp	r3, #0
	mov	r2, #1
	ldr	r3, [r0, #2896]
	add	r3, r3, #4
	mov	r3, r2, asl r3
	str	r3, [fp, #-88]
	ldr	r3, [r9, #676]
	ldrne	r2, [fp, #-88]
	movne	r3, r3, asl #1
	addne	r3, r3, #1
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-64]
	movne	r2, r2, asl #1
	strne	r2, [fp, #-88]
	adds	r3, r3, #2
	str	r3, [fp, #-72]
	beq	.L757
	ldr	r2, [r1]
	cmp	r2, #3
	beq	.L757
	movw	r3, #22868
	str	r9, [fp, #-68]
	mov	r0, r3
	mov	r3, #0
	mov	r4, r3
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
	mov	r6, r3
	ldr	r3, [fp, #-92]
	movt	r0, 164
	mov	r9, r1
	add	r0, r5, r0
	str	r0, [fp, #-96]
	str	r3, [fp, #-60]
	mov	r3, #1
	str	r3, [fp, #-84]
	b	.L765
.L766:
	cmp	r2, #2
	beq	.L808
	ldr	r3, [fp, #-84]
	cmp	r3, #1
	beq	.L772
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #657]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	mov	r3, r10, asl #1
.L773:
	cmp	r2, #4
	ldr	r2, [r7]
	beq	.L809
	add	r2, r2, #1
	add	r4, r2, r4
	ldr	r2, [fp, #-76]
	cmp	r2, r4
	rsble	r4, r2, r4
.L783:
	ldr	r2, [fp, #-56]
	add	r0, r5, #11141120
	add	r0, r0, #8192
	ldr	r1, [fp, #-64]
	cmp	r2, #0
	ldr	r2, [fp, #-80]
	add	r3, r3, r2
	movwne	r2, #5722
	add	r3, r3, r4
	movweq	r2, #5730
	movt	r2, 41
	add	r2, r3, r2
	add	r2, r5, r2, lsl #2
	ldr	r3, [r2, #4]
	sub	r2, fp, #48
	str	r10, [sp, #4]
	ldr	ip, [r0, #3572]
	mov	r0, r5
	str	ip, [sp]
	bl	mvc_reorder_interview
.L770:
	ldr	r3, [fp, #-72]
	add	r6, r6, #1
	cmp	r6, r3
	beq	.L757
	ldr	r2, [r9, #4]!
	add	r7, r7, #4
	add	r8, r8, #4
	cmp	r2, #3
	beq	.L757
.L765:
	cmp	r2, #1
	bhi	.L766
	cmp	r2, #0
	ldr	r3, [r8]
	bne	.L767
	ldr	r2, [fp, #-60]
	mvn	r3, r3
	adds	r3, r2, r3
	str	r3, [fp, #-60]
	bmi	.L810
.L768:
	ldr	r2, [fp, #-60]
	mov	r1, r10
	ldr	r3, [fp, #-92]
	mov	r0, r5
	cmp	r3, r2
	movlt	r3, r2
	ldrlt	r2, [fp, #-88]
	ldrge	r3, [fp, #-60]
	rsblt	r3, r2, r3
	ldr	r2, [fp, #-68]
	ldr	ip, [r2, #2288]
	sub	r2, fp, #48
	str	r2, [sp]
	ldr	r2, [fp, #-64]
	str	ip, [sp, #4]
	bl	MVC_ReorderSTList
	b	.L770
.L807:
	movw	r1, #40560
	movw	r8, #40824
	movw	r2, #41088
	movw	r7, #41344
	movt	r1, 169
	movt	r8, 169
	movt	r2, 169
	movt	r7, 169
	add	r2, r5, r2
	add	r1, r5, r1
	add	r8, r5, r8
	str	r2, [fp, #-100]
	add	r7, r5, r7
	b	.L761
.L809:
	mvn	r2, r2
	adds	r4, r2, r4
	ldrmi	r2, [fp, #-76]
	addmi	r4, r4, r2
	b	.L783
.L772:
	ldr	r1, [fp, #-68]
	add	r3, r5, #10747904
	add	r3, r3, #20480
	ldr	r0, [r1, #2288]
	ldr	r1, [r3, #2384]
	adds	r1, r1, #1
	beq	.L774
	ldr	r3, [r3, #2388]
	cmp	r0, r3
	beq	.L775
	ldr	ip, [fp, #-96]
	mov	r3, #0
	str	r1, [fp, #-80]
	b	.L776
.L778:
	ldr	lr, [ip, #4]!
	cmp	r0, lr
	beq	.L792
.L776:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L778
.L777:
	ldr	r3, [fp, #-68]
	mov	r4, r1
	ldr	ip, [fp, #-96]
	ldrb	r3, [r3, #657]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	mov	r3, #0
	b	.L788
.L780:
	ldr	lr, [ip, #4]!
	cmp	r0, lr
	beq	.L793
.L788:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L780
	cmp	r4, #0
	blt	.L794
.L787:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	mov	r3, r10, asl #1
	beq	.L781
	add	r4, r3, r4
	movw	r1, #5718
	movt	r1, 41
	add	r1, r4, r1
	mov	r0, #0
	str	r0, [fp, #-84]
	add	r1, r5, r1, lsl #2
	mvn	r4, #0
	ldr	r1, [r1, #4]
	str	r1, [fp, #-76]
	b	.L773
.L767:
	ldr	r2, [fp, #-60]
	add	r3, r3, #1
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	str	r3, [fp, #-60]
	cmp	r2, r3
	rsble	r3, r2, r3
	strle	r3, [fp, #-60]
	b	.L768
.L808:
	ldr	r1, [fp, #-68]
	sub	r0, fp, #48
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-64]
	ldr	ip, [r1, #2288]
	mov	r1, r10
	ldr	r3, [r3, r6, asl #2]
	str	r0, [sp]
	mov	r0, r5
	str	ip, [sp, #4]
	bl	MVC_ReorderLTList
	b	.L770
.L792:
	str	r3, [fp, #-80]
	b	.L777
.L793:
	mov	r4, r3
	cmp	r4, #0
	bge	.L787
.L794:
	mov	r3, #0
	mvn	r4, #0
	mov	r1, r3
	str	r3, [fp, #-84]
	str	r1, [fp, #-76]
	mov	r3, r10, asl #1
	b	.L773
.L781:
	add	r4, r3, r4
	movw	r1, #5726
	movt	r1, 41
	add	r1, r4, r1
	ldr	r0, [fp, #-56]
	mvn	r4, #0
	add	r1, r5, r1, lsl #2
	str	r0, [fp, #-84]
	ldr	r1, [r1, #4]
	str	r1, [fp, #-76]
	b	.L773
.L810:
	ldr	r2, [fp, #-88]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	b	.L768
.L774:
	ldr	r3, [fp, #-68]
	mov	r4, r1
	str	r1, [fp, #-80]
	ldrb	r3, [r3, #657]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	b	.L787
.L775:
	ldr	r1, [fp, #-68]
	mov	r3, #0
	mov	r4, r3
	str	r3, [fp, #-80]
	ldrb	r1, [r1, #657]	@ zero_extendqisi2
	str	r1, [fp, #-56]
	b	.L787
	UNWIND(.fnend)
	.size	MVC_ReorderRefPiclist, .-MVC_ReorderRefPiclist
	.align	2
	.global	MVC_ReorderListX
	.type	MVC_ReorderListX, %function
MVC_ReorderListX:
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
	add	r4, r0, #11075584
	mov	r6, r0
	add	r5, r4, #40960
	ldrb	r1, [r5, #648]	@ zero_extendqisi2
	cmp	r1, #2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r7, r4, #36864
	ldrb	r3, [r7, #3692]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L823
.L814:
	ldr	r3, [r5, #708]
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r5, #696]
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r7, #3693]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L824
.L816:
	add	r4, r4, #40960
	ldr	r3, [r4, #712]
	add	r3, r3, #1
	str	r3, [r4, #700]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L823:
	mov	r1, #0
	ldr	r2, [r5, #708]
	bl	MVC_ReorderRefPiclist
	ldrb	r1, [r5, #648]	@ zero_extendqisi2
	b	.L814
.L824:
	ldr	r2, [r5, #712]
	mov	r0, r6
	bl	MVC_ReorderRefPiclist
	b	.L816
	UNWIND(.fnend)
	.size	MVC_ReorderListX, .-MVC_ReorderListX
	.align	2
	.global	MVC_GenPiclistfromFrmlist
	.type	MVC_GenPiclistfromFrmlist, %function
MVC_GenPiclistfromFrmlist:
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
	ldr	lr, .L888
	movcc	r4, r2
	ldr	ip, .L888+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L828
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L836
.L837:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L836
	cmp	r2, #0
	beq	.L842
	add	r8, r7, r5, lsl #2
	b	.L841
.L838:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L842
.L841:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L838
	add	r0, r0, #680
	blx	r6
	cmp	r0, #0
	beq	.L838
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #680
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L842:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L844
	b	.L837
.L843:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L837
.L844:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	tst	r1, #1
	beq	.L843
	add	r0, r0, #644
	blx	r6
	cmp	r0, #0
	beq	.L843
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #644
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L837
.L887:
	add	r0, r0, #644
	blx	r6
	cmp	r0, #0
	beq	.L829
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #644
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L833:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L835
	b	.L828
.L834:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L828
.L835:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L834
	add	r0, r0, #680
	blx	r6
	cmp	r0, #0
	beq	.L834
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #680
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L828:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L836
	cmp	r2, #0
	beq	.L833
	add	r9, r7, r10, lsl #2
	b	.L832
.L829:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L833
.L832:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L829
	b	.L887
.L836:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L889:
	.align	2
.L888:
	.word	MVC_IsLTRefFlg
	.word	MVC_IsSTRefFlg
	UNWIND(.fnend)
	.size	MVC_GenPiclistfromFrmlist, .-MVC_GenPiclistfromFrmlist
	.align	2
	.global	MVC_GetBaseViewId
	.type	MVC_GetBaseViewId, %function
MVC_GetBaseViewId:
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
	add	r3, r0, #12992
	mov	r2, #0
	add	r3, r3, #16
.L893:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L891
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L901
.L891:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L893
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L901:
	movw	r3, #8500
	movt	r3, 5
	mla	r2, r3, r2, r0
	add	r2, r2, #12992
	ldr	r0, [r2, #20]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBaseViewId, .-MVC_GetBaseViewId
	.align	2
	.global	MVC_GetVOIdx
	.type	MVC_GetVOIdx, %function
MVC_GetVOIdx:
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
	beq	.L906
	ldr	r3, [r0]
	cmp	r3, r2
	beq	.L907
	mov	ip, r0
	mov	r3, #0
	mov	r0, r1
	b	.L904
.L905:
	ldr	lr, [ip, #4]!
	cmp	lr, r2
	beq	.L908
.L904:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L905
	ldmfd	sp, {fp, sp, pc}
.L908:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L906:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
.L907:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetVOIdx, .-MVC_GetVOIdx
	.align	2
	.global	MVC_is_view_id_in_ref_view_list
	.type	MVC_is_view_id_in_ref_view_list, %function
MVC_is_view_id_in_ref_view_list:
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
	cmp	r2, #0
	beq	.L913
	ldr	r3, [r1]
	cmp	r3, r0
	beq	.L914
	mov	r3, #0
	b	.L911
.L912:
	ldr	ip, [r1, #4]!
	cmp	ip, r0
	beq	.L910
.L911:
	add	r3, r3, #1
	cmp	r3, r2
	mov	lr, r3
	bne	.L912
.L910:
	cmp	r2, #0
	cmpne	r2, lr
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L913:
	mov	lr, r2
	b	.L910
.L914:
	mov	lr, #0
	b	.L910
	UNWIND(.fnend)
	.size	MVC_is_view_id_in_ref_view_list, .-MVC_is_view_id_in_ref_view_list
	.align	2
	.global	MVC_GenPiclistfromFrmlist_Interview
	.type	MVC_GenPiclistfromFrmlist_Interview, %function
MVC_GenPiclistfromFrmlist_Interview:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #1
	ldr	ip, [fp, #4]
	beq	.L931
	cmp	r0, #2
	ldmnefd	sp, {fp, sp, pc}
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [ip]
	add	r1, r1, #680
	mov	lr, #0
.L922:
	add	lr, lr, #1
	str	r1, [r3, r0, asl #2]
	cmp	lr, r2
	ldr	r0, [ip]
	add	r1, r1, #720
	add	r0, r0, #1
	str	r0, [ip]
	bne	.L922
	ldmfd	sp, {fp, sp, pc}
.L931:
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [ip]
	add	r1, r1, #644
	mov	lr, #0
.L918:
	add	lr, lr, #1
	str	r1, [r3, r0, asl #2]
	cmp	lr, r2
	ldr	r0, [ip]
	add	r1, r1, #720
	add	r0, r0, #1
	str	r0, [ip]
	bne	.L918
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GenPiclistfromFrmlist_Interview, .-MVC_GenPiclistfromFrmlist_Interview
	.align	2
	.global	mvc_append_interview_list
	.type	mvc_append_interview_list, %function
mvc_append_interview_list:
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
	add	lr, r0, #10747904
	add	lr, lr, #20480
	add	ip, r0, #11075584
	add	r4, ip, #40960
	mov	r9, r0
	ldr	r5, [lr, #2384]
	movw	r0, #22868
	movt	r0, 164
	str	r2, [fp, #-52]
	adds	r5, r5, #1
	str	r3, [fp, #-48]
	ldr	r6, [r4, #2288]
	add	r0, r9, r0
	beq	.L951
	ldr	r3, [lr, #2388]
	cmp	r6, r3
	beq	.L952
	mov	r2, r0
	mov	r3, #0
	b	.L934
.L935:
	ldr	r0, [r2, #4]!
	cmp	r6, r0
	beq	.L933
.L934:
	add	r3, r3, #1
	cmp	r3, r5
	mov	lr, r3
	bne	.L935
.L933:
	ldrb	r3, [r4, #657]	@ zero_extendqisi2
	add	lr, lr, r1, lsl #1
	add	r6, r9, #11141120
	add	ip, ip, #45056
	cmp	r3, #0
	add	r6, r6, #8192
	movwne	r3, #5718
	movweq	r3, #5726
	movtne	r3, 41
	movteq	r3, 41
	addne	r3, lr, r3
	addeq	r3, lr, r3
	ldrb	r8, [r6, #3003]	@ zero_extendqisi2
	addne	lr, r9, lr, lsl #2
	add	r3, r9, r3, lsl #2
	movwne	r10, #22892
	sub	r8, r8, #2
	addeq	lr, r9, lr, lsl #2
	ldr	r7, [r3, #4]
	movweq	r10, #22924
	ldr	r3, [ip, #2504]
	clz	r8, r8
	movt	r10, 164
	add	r10, lr, r10
	subs	r4, r3, #1
	mov	r8, r8, lsr #5
	bmi	.L932
	movw	r5, #28226
	str	r9, [fp, #-56]
	movt	r5, 42
	add	r5, r3, r5
	add	r5, r9, r5, lsl #2
	ldr	r9, [fp, #-48]
	b	.L949
.L975:
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #3
	ldreq	r2, [r1, #628]
	bne	.L939
.L941:
	add	r3, r1, r8
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L939
	ldr	r3, [r6, #3572]
	cmp	r3, r2
	beq	.L974
.L939:
	subs	r4, r4, #1
	bmi	.L932
.L949:
	ldr	r1, [r5, #-4]!
	cmp	r1, #0
	beq	.L939
	ldrb	r3, [r6, #3003]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L975
	cmp	r3, #1
	beq	.L976
	cmp	r3, #2
	bne	.L939
	ldrb	r2, [r6, #3001]	@ zero_extendqisi2
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	ubfx	r3, r3, #1, #1
	beq	.L944
	ldr	r2, [r6, #3552]
	ldr	r0, [r1, #664]
	ldr	r2, [r2, #664]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L944:
	cmp	r3, #0
	ldrne	r2, [r1, #700]
	bne	.L941
	subs	r4, r4, #1
	bpl	.L949
.L932:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L976:
	ldrb	r2, [r6, #3001]	@ zero_extendqisi2
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	and	r3, r3, #1
	beq	.L943
	ldr	r2, [r6, #3552]
	ldr	r0, [r1, #700]
	ldr	r2, [r2, #700]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L943:
	cmp	r3, #0
	ldrne	r2, [r1, #664]
	bne	.L941
	b	.L939
.L974:
	cmp	r7, #0
	ldr	ip, [r1, #56]
	beq	.L939
	ldr	r3, [r10]
	cmp	ip, r3
	beq	.L945
	mov	r2, r10
	mov	r3, #0
.L946:
	add	r3, r3, #1
	cmp	r3, r7
	beq	.L939
	ldr	r0, [r2, #4]!
	cmp	ip, r0
	bne	.L946
.L945:
	ldr	ip, [fp, #-52]
	mov	r2, #720
	ldr	r0, [r9]
	ldr	r3, .L977
	mla	r0, r2, r0, ip
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r9]
	ldr	ip, [fp, #-52]
	mov	r2, #720
	mov	r1, #720
	mla	r3, r2, r3, ip
	ldr	r2, [fp, #-56]
	str	r3, [r3, #684]
	str	r3, [r3, #648]
	str	r3, [r3, #612]
	ldr	r3, [r9]
	ldr	r2, [r2, #52]
	mla	r3, r1, r3, ip
	sub	r2, r2, #1
	str	r2, [r3, #48]
	ldr	r3, [r9]
	cmp	r3, r7
	beq	.L932
	add	r3, r3, #1
	str	r3, [r9]
	b	.L939
.L951:
	mov	lr, r5
	b	.L933
.L952:
	mov	lr, #0
	b	.L933
.L978:
	.align	2
.L977:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	mvc_append_interview_list, .-mvc_append_interview_list
	.align	2
	.global	MVC_InitListX
	.type	MVC_InitListX, %function
MVC_InitListX:
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
	add	r2, r0, #11075584
	add	r4, r2, #40960
	mov	r3, #0
	add	r6, r0, #11141120
	mov	r5, r0
	ldrb	r9, [r4, #648]	@ zero_extendqisi2
	add	r6, r6, #8192
	str	r3, [r4, #2300]
	cmp	r9, r3
	str	r3, [r4, #2296]
	bne	.L980
	ldrb	r7, [r6, #3003]	@ zero_extendqisi2
	cmp	r7, r3
	add	r3, r2, #45056
	str	r3, [fp, #-240]
	bne	.L1138
	ldr	ip, [r3, #2512]
	cmp	ip, #0
	beq	.L1064
	movw	r1, #47428
	mov	r3, r7
	movt	r1, 169
	add	r1, r0, r1
	b	.L986
.L985:
	cmp	r3, ip
	beq	.L984
.L986:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L985
	ldr	r0, [r2, #608]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	addeq	r0, r7, #64
	addeq	r2, r2, #608
	addeq	r7, r7, #1
	streq	r2, [r5, r0, asl #2]
	cmp	r3, ip
	bne	.L986
.L984:
	add	r3, r5, #256
	mov	r1, r7
	str	r3, [fp, #-244]
	mov	r2, #4
	mov	r0, r3
	ldr	r3, .L1148
	bl	qsort
	ldr	r3, [fp, #-240]
	str	r7, [r4, #696]
	ldr	r1, [r3, #2516]
	cmp	r1, #0
	beq	.L1065
	movw	r0, #47492
	mov	r8, r7
	movt	r0, 169
	mov	r3, #0
	add	r0, r5, r0
	b	.L989
.L988:
	cmp	r3, r1
	beq	.L1139
.L989:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L988
	ldr	ip, [r2, #608]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	addeq	ip, r8, #64
	addeq	r2, r2, #608
	addeq	r8, r8, #1
	streq	r2, [r5, ip, asl #2]
	cmp	r3, r1
	bne	.L989
.L1139:
	rsb	r1, r7, r8
.L987:
	add	r0, r7, #64
	ldr	r3, .L1148+4
	mov	r2, #4
	add	r0, r5, r0, lsl #2
	bl	qsort
	str	r8, [r4, #696]
	b	.L990
.L980:
	ldrb	r8, [r6, #3003]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L1007
	add	r2, r2, #45056
	str	r2, [fp, #-240]
	ldr	r10, [r2, #2512]
	cmp	r10, #0
	beq	.L1140
	movw	r7, #47428
	mov	r8, r3
	movt	r7, 169
	add	r7, r0, r7
	mov	r1, r7
.L1026:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1025
	sub	r0, fp, #44
	ldr	ip, [r6, #3572]
	add	lr, r0, r8, lsl #2
	ldr	r0, [r2, #32]
	cmp	ip, r0
	strge	r2, [lr, #-192]
	addge	r8, r8, #1
.L1025:
	cmp	r3, r10
	bne	.L1026
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-248]
	mov	r1, r8
	mov	r0, r3
	ldr	r3, .L1148+8
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #2512]
	cmp	r9, #0
	beq	.L1135
.L1062:
	mov	r1, r7
	mov	r3, #0
	mov	r7, r8
.L1029:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1028
	sub	r0, fp, #44
	ldr	ip, [r6, #3572]
	add	lr, r0, r7, lsl #2
	ldr	r0, [r2, #32]
	cmp	ip, r0
	strlt	r2, [lr, #-192]
	addlt	r7, r7, #1
.L1028:
	cmp	r3, r9
	bne	.L1029
	ldr	r2, [fp, #-248]
	rsb	r9, r8, r7
	mov	r3, r8, asl #2
	str	r3, [fp, #-244]
	add	r0, r2, r3
	mov	r1, r9
	ldr	r3, .L1148+12
	mov	r2, #4
	bl	qsort
	cmp	r8, #0
	subeq	r10, fp, #172
	beq	.L1030
.L1057:
	sub	r10, fp, #172
	ldr	r2, [fp, #-248]
	add	r9, r10, r9, lsl #2
	mov	r3, #0
.L1031:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r8
	str	r1, [r9], #4
	bcc	.L1031
.L1030:
	cmp	r7, r8
	bls	.L1032
	ldr	r3, [fp, #-248]
	ldr	r2, [fp, #-244]
	add	r2, r3, r2
	mov	r3, r10
.L1033:
	add	r8, r8, #1
	ldr	r1, [r2], #4
	cmp	r8, r7
	str	r1, [r3], #4
	bne	.L1033
.L1032:
	movw	r9, #41656
	mov	r3, #0
	ldr	r1, [fp, #-248]
	mov	r2, #0
	str	r3, [r4, #696]
	movt	r9, 169
	str	r3, [r4, #700]
	add	r9, r5, r9
	add	r3, r5, #256
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	movw	r8, #41660
	str	r2, [sp, #4]
	str	r9, [sp]
	mov	r2, r7
	str	r3, [fp, #-244]
	movt	r8, 169
	bl	MVC_GenPiclistfromFrmlist
	add	r8, r5, r8
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	add	r3, r5, #388
	mov	r2, #0
	mov	r1, r10
	str	r2, [sp, #4]
	mov	r2, r7
	str	r8, [sp]
	str	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2516]
	cmp	r7, #0
	subeq	r10, fp, #108
	beq	.L1034
	movw	r2, #47492
	sub	r10, fp, #108
	movt	r2, 169
	add	r2, r5, r2
	mov	r3, #0
	mov	r1, r10
.L1035:
	add	r3, r3, #1
	ldr	r0, [r2, #4]!
	cmp	r3, r7
	str	r0, [r1], #4
	bne	.L1035
.L1034:
	ldr	r3, .L1148+16
	mov	r2, #4
	mov	r1, r7
	mov	r0, r10
	bl	qsort
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	ldr	r3, [fp, #-244]
	mov	r2, r7
	str	r9, [sp]
	mov	r1, r10
	mov	r9, #1
	str	r9, [sp, #4]
	bl	MVC_GenPiclistfromFrmlist
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	ldr	r3, [fp, #-248]
	mov	r2, r7
	str	r8, [sp]
	mov	r1, r10
	str	r9, [sp, #4]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r8, [r4, #696]
	ldr	r3, [r4, #700]
	rsb	r3, r3, r8
	clz	r3, r3
	mov	r3, r3, lsr #5
.L1024:
	cmp	r8, #1
	movls	r3, #0
	andhi	r3, r3, #1
	cmp	r3, #0
	beq	.L1036
	cmp	r8, #0
	beq	.L1037
	ldr	lr, [r5, #256]
	ldr	r3, [r5, #388]
	cmp	lr, r3
	bne	.L1036
	ldr	r1, [fp, #-244]
	add	r2, r5, #388
	mov	r3, #0
	b	.L1038
.L1039:
	ldr	ip, [r1, #4]!
	ldr	r0, [r2, #4]!
	cmp	ip, r0
	bne	.L1036
.L1038:
	add	r3, r3, #1
	cmp	r3, r8
	bne	.L1039
.L1040:
	ldr	r3, [r5, #392]
	str	lr, [r5, #392]
	str	r3, [r5, #388]
	ldrb	r3, [r4, #660]	@ zero_extendqisi2
.L1058:
	cmp	r3, #0
	bne	.L1127
.L1041:
	movw	r7, #31360
	movw	r3, #43256
	movt	r7, 169
	add	r7, r5, r7
	mov	r0, r5
	movt	r3, 169
	mov	r1, #0
	mov	r2, r7
	add	r3, r5, r3
	bl	mvc_append_interview_list
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1141
	ldr	r1, [r4, #2296]
	ldr	ip, [r4, #696]
	cmp	r1, #0
	beq	.L1043
	add	r2, ip, #63
	movw	r3, #31968
	movt	r3, 169
	add	r3, r5, r3
	add	r2, r5, r2, lsl #2
.L1044:
	add	r0, r0, #1
	str	r3, [r2, #4]!
	cmp	r0, r1
	add	r3, r3, #720
	bne	.L1044
	add	ip, ip, r0
.L1043:
	str	ip, [r4, #696]
.L1045:
	ldrb	r1, [r4, #648]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1142
.L1128:
	ldr	r0, [r4, #696]
.L1042:
	cmp	r1, #0
	bne	.L1000
	cmp	r0, #0
	ldreq	r2, .L1148+20
	movweq	r1, #4471
	beq	.L1129
.L999:
	ldr	r2, [r4, #708]
	ldr	r3, [r4, #712]
	add	r2, r2, #1
	ldr	r1, [r4, #700]
	cmp	r0, r2
	add	r3, r3, #1
	movcc	r2, r0
	cmp	r3, r1
	str	r2, [r4, #696]
	movcs	r3, r1
	cmp	r2, #32
	str	r3, [r4, #700]
	bhi	.L1051
.L1059:
	add	r1, r2, #63
	mov	r0, #0
	add	r1, r5, r1, lsl #2
.L1052:
	add	r2, r2, #1
	str	r0, [r1, #4]!
	cmp	r2, #32
	bls	.L1052
.L1051:
	cmp	r3, #32
	bhi	.L1055
	add	r3, r3, #96
	add	r1, r5, #516
	mov	r2, #0
	add	r5, r5, r3, lsl #2
.L1054:
	str	r2, [r5, #4]!
	cmp	r5, r1
	bne	.L1054
.L1055:
	mov	r0, #0
.L1121:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1007:
	add	r3, r2, #45056
	str	r3, [fp, #-240]
	ldr	r10, [r3, #2512]
	cmp	r10, #0
	beq	.L1010
	movw	r7, #47428
	mov	r3, r8
	movt	r7, 169
	add	r7, r0, r7
	mov	r1, r7
	b	.L1012
.L1011:
	cmp	r3, r10
	beq	.L1143
.L1012:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1011
	ldr	r0, [r2, #624]
	add	lr, r8, #64
	ldr	ip, [r6, #3576]
	add	r2, r2, #608
	cmp	ip, r0
	strge	r2, [r5, lr, asl #2]
	addge	r8, r8, #1
	cmp	r3, r10
	bne	.L1012
.L1143:
	add	r3, r5, #256
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r8
	mov	r0, r3
	ldr	r3, .L1148+24
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #2512]
	cmp	r9, #0
	beq	.L1134
.L1060:
	mov	r10, r8
	mov	r3, #0
	b	.L1015
.L1014:
	cmp	r3, r9
	beq	.L1144
.L1015:
	ldr	r2, [r7, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #3]	@ zero_extendqisi2
	cmp	r1, #3
	bne	.L1014
	ldr	r1, [r2, #624]
	add	ip, r10, #64
	ldr	r0, [r6, #3576]
	add	r2, r2, #608
	cmp	r0, r1
	strlt	r2, [r5, ip, asl #2]
	addlt	r10, r10, #1
	cmp	r3, r9
	bne	.L1015
.L1144:
	rsb	r9, r8, r10
	add	r0, r8, #64
	ldr	r3, .L1148+28
	mov	r2, #4
	mov	r1, r9
	add	r0, r5, r0, lsl #2
	bl	qsort
	add	r7, r10, #64
	cmp	r8, #0
	add	r7, r5, r7, lsl #2
	beq	.L1017
.L1056:
	add	r9, r9, #96
	add	r2, r5, #252
	mov	r3, #0
	add	r9, r5, r9, lsl #2
.L1018:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r8
	str	r1, [r9, #4]!
	bcc	.L1018
.L1017:
	cmp	r10, r8
	bls	.L1019
	add	r3, r8, #63
	add	r2, r5, #384
	add	r3, r5, r3, lsl #2
.L1020:
	add	r8, r8, #1
	ldr	r1, [r3, #4]!
	cmp	r8, r10
	str	r1, [r2, #4]!
	bne	.L1020
.L1019:
	ldr	r3, [fp, #-240]
	str	r10, [r4, #700]
	str	r10, [r4, #696]
	ldr	r1, [r3, #2516]
	cmp	r1, #0
	beq	.L1066
	movw	r0, #47492
	mov	r8, r10
	movt	r0, 169
	mov	r3, #0
	add	r0, r5, r0
	b	.L1023
.L1022:
	cmp	r3, r1
	beq	.L1145
.L1023:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1022
	ldrb	ip, [r2, #609]	@ zero_extendqisi2
	cmp	ip, #1
	addeq	ip, r5, r8, lsl #2
	addeq	r2, r2, #608
	addeq	r8, r8, #1
	streq	r2, [ip, #256]
	streq	r2, [ip, #388]
	cmp	r3, r1
	bne	.L1023
.L1145:
	rsb	r1, r10, r8
.L1021:
	mov	r0, r7
	ldr	r3, .L1148+4
	mov	r2, #4
	bl	qsort
	ldr	r1, [r4, #696]
	ldr	r3, .L1148+4
	mov	r2, #4
	add	r0, r1, #97
	rsb	r1, r1, r8
	add	r0, r5, r0, lsl #2
	bl	qsort
	str	r8, [r4, #700]
	str	r8, [r4, #696]
	mov	r3, #1
	b	.L1024
.L1138:
	ldr	lr, [r3, #2512]
	cmp	lr, #0
	moveq	r9, lr
	beq	.L983
	movw	r1, #47428
	mov	r3, r9
	movt	r1, 169
	add	r1, r0, r1
.L992:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r9, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r9, r9, #1
	cmp	r3, lr
	bne	.L992
.L983:
	mov	r1, r9
	ldr	r3, .L1148+32
	mov	r2, #4
	sub	r0, fp, #236
	movw	r8, #41656
	bl	qsort
	mov	r7, #0
	add	r3, r5, #256
	str	r7, [r4, #696]
	mov	r2, r9
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	sub	r1, fp, #236
	str	r7, [sp, #4]
	movt	r8, 169
	add	r8, r5, r8
	str	r8, [sp]
	str	r3, [fp, #-244]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #2516]
	cmp	r9, r7
	subeq	r10, fp, #108
	beq	.L993
	movw	r3, #47492
	sub	r10, fp, #108
	movt	r3, 169
	add	r3, r5, r3
	mov	r2, r10
.L994:
	add	r7, r7, #1
	ldr	r1, [r3, #4]!
	cmp	r7, r9
	str	r1, [r2], #4
	bne	.L994
.L993:
	ldr	r3, .L1148+16
	mov	r2, #4
	mov	r1, r9
	mov	r0, r10
	bl	qsort
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	mov	r3, #1
	str	r8, [sp]
	str	r3, [sp, #4]
	mov	r2, r9
	mov	r1, r10
	ldr	r3, [fp, #-244]
	bl	MVC_GenPiclistfromFrmlist
.L990:
	ldrb	r3, [r4, #660]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [r4, #700]
	cmp	r3, r2
	beq	.L1041
	ldr	r0, [r4, #696]
	cmp	r0, #0
	bne	.L1146
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L1001
	ldrb	r3, [r6, #3003]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1002
	ldr	r3, [r6, #3552]
	add	r3, r3, #608
	str	r3, [r5, #256]
.L1003:
	mov	r3, #1
	str	r3, [r4, #696]
.L1127:
	ldrb	r1, [r4, #648]	@ zero_extendqisi2
	b	.L1128
.L1146:
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L999
.L1000:
	cmp	r0, #0
	bne	.L999
	ldr	r1, [r4, #700]
	cmp	r1, #0
	beq	.L1147
	ldr	r3, [r4, #712]
	mov	r2, r0
	str	r0, [r4, #696]
	add	r3, r3, #1
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r4, #700]
	b	.L1059
.L1036:
	ldrb	r3, [r4, #660]	@ zero_extendqisi2
	b	.L1058
.L1141:
	movw	ip, #41656
	ldr	r2, [r4, #2296]
	ldr	r3, [fp, #-244]
	mov	r1, r7
	movt	ip, 169
	add	ip, r5, ip
	str	ip, [sp]
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1045
.L1002:
	cmp	r3, #1
	ldr	r3, [r6, #3552]
	addeq	r3, r3, #644
	addne	r3, r3, #680
	str	r3, [r5, #256]
	b	.L1003
.L1037:
	ldr	lr, [r5, #388]
	b	.L1040
.L1142:
	movw	r7, #32800
	movw	r3, #43260
	movt	r7, 169
	add	r7, r5, r7
	mov	r0, r5
	movt	r3, 169
	mov	r2, r7
	add	r3, r5, r3
	bl	mvc_append_interview_list
	ldrb	r0, [r6, #3003]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1047
	ldr	r1, [r4, #2300]
	ldr	ip, [r4, #700]
	cmp	r1, #0
	beq	.L1048
	add	r2, ip, #96
	movw	r3, #33408
	movt	r3, 169
	add	r3, r5, r3
	add	r2, r5, r2, lsl #2
.L1049:
	add	r0, r0, #1
	str	r3, [r2, #4]!
	cmp	r0, r1
	add	r3, r3, #720
	bne	.L1049
	add	ip, ip, r0
.L1048:
	str	ip, [r4, #700]
	ldrb	r1, [r4, #648]	@ zero_extendqisi2
	ldr	r0, [r4, #696]
	b	.L1042
.L1135:
	mov	r3, r8, asl #2
	ldr	r1, [fp, #-248]
	str	r3, [fp, #-244]
	mov	r2, r3
	ldr	r3, .L1148+12
	add	r0, r1, r2
	mov	r2, #4
	mov	r1, r9
	bl	qsort
	subs	r7, r8, #0
	bne	.L1057
.L1130:
	sub	r10, fp, #172
	b	.L1032
.L1134:
	add	r7, r8, #64
	ldr	r3, .L1148+28
	mov	r2, #4
	mov	r1, r9
	add	r7, r5, r7, lsl #2
	mov	r0, r7
	bl	qsort
	subs	r10, r8, #0
	bne	.L1056
	b	.L1019
.L1064:
	mov	r7, ip
	b	.L984
.L1065:
	mov	r8, r7
	b	.L987
.L1066:
	mov	r8, r10
	b	.L1021
.L1140:
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-248]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L1148+8
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #2512]
	cmp	r9, #0
	movwne	r7, #47428
	movne	r8, r10
	movtne	r7, 169
	addne	r7, r5, r7
	bne	.L1062
	ldr	r3, .L1148+12
	mov	r2, #4
	mov	r1, r9
	ldr	r0, [fp, #-248]
	mov	r7, r9
	bl	qsort
	b	.L1130
.L1010:
	add	r3, r0, #256
	mov	r2, #4
	str	r3, [fp, #-244]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L1148+24
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #2512]
	cmp	r9, #0
	movwne	r7, #47428
	movne	r8, r10
	movtne	r7, 169
	addne	r7, r5, r7
	bne	.L1060
	ldr	r7, [fp, #-244]
	mov	r2, #4
	ldr	r3, .L1148+28
	mov	r1, r9
	mov	r10, r9
	mov	r0, r7
	bl	qsort
	b	.L1019
.L1147:
	ldr	r2, .L1148+36
	mov	r1, #4480
.L1129:
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	b	.L1121
.L1047:
	movw	ip, #41660
	ldr	r2, [r4, #2300]
	mov	r1, r7
	movt	ip, 169
	add	r3, r5, #388
	add	ip, r5, ip
	str	ip, [sp]
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1127
.L1001:
	ldr	r2, .L1148+40
	movw	r1, #4277
	b	.L1129
.L1149:
	.align	2
.L1148:
	.word	MVC_compare_pic_by_pic_num_desc
	.word	MVC_compare_pic_by_lt_pic_num_asc
	.word	MVC_compare_fs_by_poc_desc
	.word	MVC_compare_fs_by_poc_asc
	.word	MVC_compare_fs_by_lt_pic_idx_asc
	.word	.LC21
	.word	MVC_compare_pic_by_poc_desc
	.word	MVC_compare_pic_by_poc_asc
	.word	MVC_compare_fs_by_frame_num_desc
	.word	.LC22
	.word	.LC20
	UNWIND(.fnend)
	.size	MVC_InitListX, .-MVC_InitListX
	.align	2
	.global	MVC_FindNearestPOCPicId
	.type	MVC_FindNearestPOCPicId, %function
MVC_FindNearestPOCPicId:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	r2, [r3, #2508]
	cmp	r2, #0
	beq	.L1155
	ldr	r4, [r3, #2504]
	add	r3, r0, #11141120
	add	r3, r3, #8192
	cmp	r4, #0
	ldr	r5, [r3, #3572]
	beq	.L1156
	movw	ip, #47364
	mov	r6, #0
	movt	ip, 169
	add	ip, r0, ip
	mov	r1, r6
	mvn	lr, #-2147483648
.L1154:
	ldr	r2, [ip, #4]!
	add	r1, r1, #1
	cmp	r2, #0
	beq	.L1153
	ldr	r3, [r2, #32]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r6, [r2, #160]
	movlt	lr, r3
.L1153:
	cmp	r1, r4
	bne	.L1154
.L1152:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1156:
	mov	r6, r4
	b	.L1152
.L1155:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FindNearestPOCPicId, .-MVC_FindNearestPOCPicId
	.align	2
	.global	MVC_FindMinRefIdx
	.type	MVC_FindMinRefIdx, %function
MVC_FindMinRefIdx:
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
	add	r3, r0, #11075584
	add	r3, r3, #40960
	ldrb	r2, [r3, #648]	@ zero_extendqisi2
	cmp	r2, #2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	add	r2, r0, #11141120
	movw	r6, #47796
	add	r2, r2, #8192
	ldrb	lr, [r2, #3003]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L1191
	ldr	r4, [r3, #696]
	movw	r5, #47800
	movt	r6, 169
	movt	r5, 169
	cmp	r4, #0
	add	r6, r0, r6
	add	r5, r0, r5
	mov	r7, lr
	beq	.L1169
.L1193:
	add	r2, r0, #252
	mov	ip, #32
	mov	r3, #0
	b	.L1167
.L1166:
	add	r3, r3, #1
	cmp	r3, r4
	beq	.L1192
.L1167:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	cmp	r1, lr
	bne	.L1166
	cmp	ip, r3
	movcs	ip, r3
	add	r3, r3, #1
	cmp	r3, r4
	str	ip, [r5, #-4]
	str	ip, [r6, #4]
	bne	.L1167
.L1192:
	cmp	ip, #31
	bhi	.L1169
.L1168:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, #16
	add	r5, r5, #8
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r4, #0
	bne	.L1193
.L1169:
	str	r7, [r5, #-4]
	str	r7, [r6, #4]
	b	.L1168
.L1191:
	ldr	r5, [r3, #696]
	mov	lr, #0
	movt	r6, 169
	mov	r7, lr
	cmp	r5, #0
	add	r6, r0, r6
	beq	.L1173
.L1195:
	add	r1, r0, #252
	mov	r4, #32
	mov	r2, #0
	b	.L1171
.L1170:
	add	r2, r2, #1
	cmp	r2, r5
	beq	.L1194
.L1171:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #4]
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #52]
	mov	r3, r3, asl #1
	cmp	ip, #2
	orreq	r3, r3, #1
	cmp	r3, lr
	bne	.L1170
	cmp	r4, r2
	movcs	r4, r2
	add	r2, r2, #1
	cmp	r2, r5
	str	r4, [r6]
	bne	.L1171
.L1194:
	cmp	r4, #31
	bhi	.L1173
.L1172:
	add	lr, lr, #1
	add	r6, r6, #4
	cmp	lr, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r5, #0
	bne	.L1195
.L1173:
	str	r7, [r6]
	b	.L1172
	UNWIND(.fnend)
	.size	MVC_FindMinRefIdx, .-MVC_FindMinRefIdx
	.align	2
	.global	MVC_DecList
	.type	MVC_DecList, %function
MVC_DecList:
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
	bl	MVC_FindNearestPOCPicId
	add	r5, r4, #11075584
	mvn	r6, #0
	add	r3, r5, #40960
	ldrb	r2, [r3, #648]	@ zero_extendqisi2
	str	r6, [r3, #2280]
	cmp	r2, #2
	str	r0, [r3, #2284]
	beq	.L1203
	mov	r0, r4
	bl	MVC_InitListX
	cmp	r0, #0
	bne	.L1204
	mov	r0, r4
	bl	MVC_ReorderListX
	mov	r0, r4
	bl	MVC_RepairList
	cmp	r0, #0
	bne	.L1201
	mov	r0, r4
	add	r5, r5, #40960
	bl	MVC_FindMinRefIdx
	ldr	r3, [r4, #256]
	mov	r0, #0
	cmp	r3, #0
	ldrne	r3, [r3, #4]
	ldrne	r6, [r3, #160]
	str	r6, [r5, #2280]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1203:
	mov	r0, #0
	str	r0, [r3, #696]
	str	r0, [r3, #700]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1201:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1204:
	ldr	r2, .L1205
	movw	r1, #4619
	mov	r0, #11
	bl	dprint_normal
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1206:
	.align	2
.L1205:
	.word	.LC23
	UNWIND(.fnend)
	.size	MVC_DecList, .-MVC_DecList
	.align	2
	.global	MVC_GetBackPicFromVOQueue
	.type	MVC_GetBackPicFromVOQueue, %function
MVC_GetBackPicFromVOQueue:
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
	add	r0, r0, #584
	bl	ResetVoQueue
	ldr	r3, [r8, #48]
	cmp	r3, #0
	beq	.L1214
	movw	r5, #48192
	mov	r6, #0
	movt	r5, 169
	add	r5, r8, r5
	mov	r7, #0
	mov	r9, #0
.L1213:
	sub	r4, r5, #32
	mov	r3, #0
	strb	r3, [r5, #-262]
	strb	r3, [r5, #-261]
.L1212:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1223
.L1211:
	cmp	r4, r5
	bne	.L1212
	ldr	r3, [r8, #48]
	add	r9, r9, #1
	add	r5, r5, #720
	cmp	r3, r9
	bhi	.L1213
.L1214:
	ldr	r2, [r8, #52]
	cmp	r2, #0
	beq	.L1224
	mov	r3, #0
	add	r8, r8, #144
	mov	r1, r3
.L1215:
	add	r3, r3, #1
	str	r1, [r8, #4]!
	cmp	r3, r2
	bne	.L1215
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1223:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1211
.L1224:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBackPicFromVOQueue, .-MVC_GetBackPicFromVOQueue
	.align	2
	.global	MVC_RoundLog2
	.type	MVC_RoundLog2, %function
MVC_RoundLog2:
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
	mul	r0, r0, r0
	mov	r3, #0
	mov	r2, #1
.L1226:
	add	r3, r3, #1
	cmp	r0, r2, asl r3
	bge	.L1226
	mov	r0, r3, asr #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_RoundLog2, .-MVC_RoundLog2
	.align	2
	.global	MVC_GetReRangeFlag
	.type	MVC_GetReRangeFlag, %function
MVC_GetReRangeFlag:
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
	mov	r4, r0
	add	r0, r0, #11075584
	mov	r5, r1
	add	r7, r0, #40960
	ldr	ip, [r4, #252]
	mov	lr, #2240
	ldrb	r1, [r7, #660]	@ zero_extendqisi2
	ldr	r2, [r7, #664]
	sxtb	r3, r1
	cmn	r3, #1
	mla	r2, lr, r2, ip
	beq	.L1245
	cmp	r1, #0
	bne	.L1231
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r2, #28]
	beq	.L1246
	ldr	r2, [r4, #28]
	cmp	r2, r3
	beq	.L1233
	ldr	r2, .L1248
	movw	r1, #4808
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1231:
	ldr	r2, .L1248+4
	movw	r1, #4817
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1245:
	ldr	r2, [r2, #28]
	movw	r6, #3992
	ldr	r3, [r4, #248]
	mla	r6, r6, r2, r3
.L1230:
	ldrb	r3, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	rsb	r3, r3, #2
	ldr	r2, [r6, #3948]
	ldr	lr, [r4, #12]
	mla	r3, r1, r3, r3
	ldr	ip, [r4, #16]
	add	r2, r2, #1
	cmp	r2, lr
	cmpeq	r3, ip
	movne	r8, #1
	moveq	r8, #0
	bne	.L1235
	add	r1, r0, #45056
	ldr	r0, [r6, #3972]
	ldr	r1, [r1, #2504]
	add	r1, r1, #1
	cmp	r0, r1
	movls	ip, r8
	bls	.L1236
.L1235:
	ldr	r1, .L1248+8
	ldr	r8, [r1]
	cmp	r8, #0
	moveq	ip, #1
	beq	.L1236
	mov	ip, ip, asl #4
	mov	r1, r3, asl #4
	mov	lr, lr, asl #4
	mov	r2, r2, asl #4
	strh	ip, [fp, #-42]	@ movhi
	mov	r3, #8
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	strh	r1, [fp, #-38]	@ movhi
	mov	r1, #1
	strh	lr, [fp, #-44]	@ movhi
	ldr	r0, [r4, #120]
	blx	r8
	mov	ip, #1
.L1236:
	ldrb	r3, [r7, #659]	@ zero_extendqisi2
	cmp	r3, #1
	ldrne	r1, [r6, #3972]
	subne	r1, r1, #1
	beq	.L1247
.L1239:
	ldr	r3, [r4, #44]
	mov	r0, ip
	cmp	r3, r1
	orrne	ip, ip, #1
	str	ip, [r5]
	str	r1, [r4, #44]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1233:
	movw	r6, #35364
	movt	r6, 168
	add	r6, r4, r6
	b	.L1230
.L1247:
	movw	r0, #39336
	add	r3, r4, #290816
	movt	r0, 168
	add	r3, r3, #808
	add	r0, r4, r0
	mov	r1, #0
.L1238:
	ldr	r2, [r3]
	add	r3, r3, #335872
	add	r3, r3, #308
	cmp	r2, r1
	subhi	r1, r2, #1
	cmp	r3, r0
	bne	.L1238
	add	r1, r1, #1
	mov	r1, r1, asl #1
	cmp	r1, #16
	movcs	r1, #16
	b	.L1239
.L1246:
	movw	r6, #8500
	movt	r6, 5
	mla	r6, r6, r3, r4
	add	r6, r6, #286720
	add	r6, r6, #932
	b	.L1230
.L1249:
	.align	2
.L1248:
	.word	.LC24
	.word	.LC25
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	MVC_GetReRangeFlag, .-MVC_GetReRangeFlag
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	MVC_DecPOC
	.type	MVC_DecPOC, %function
MVC_DecPOC:
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
	add	r6, r0, #11075584
	ldr	r5, [r0, #236]
	add	r7, r6, #40960
	mov	r2, #1
	ldrb	r1, [r7, #651]	@ zero_extendqisi2
	ldr	ip, [r5, #2900]
	ldr	r3, [r5, #2896]
	sub	r1, r1, #5
	clz	r1, r1
	cmp	ip, r2
	add	r3, r3, #4
	ldr	lr, [r5, #2904]
	mov	r1, r1, lsr #5
	mov	r3, r2, asl r3
	beq	.L1252
	bcc	.L1253
	cmp	ip, #2
	ldmnefd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r1, #0
	bne	.L1308
	add	r4, r6, #36864
	ldrb	r2, [r4, #3608]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1286
	ldr	r1, [r4, #3664]
	ldr	r0, [r4, #3660]
	ldr	r2, [r4, #3672]
	cmp	r1, r0
	addcc	r2, r2, r3
	strcc	r2, [r4, #3668]
	bcs	.L1288
.L1289:
	add	r3, r2, r1
	str	r3, [r4, #3656]
	ldrb	r0, [r7, #656]	@ zero_extendqisi2
	mov	r3, r3, asl #1
	cmp	r0, #0
	subeq	r3, r3, #1
	str	r3, [r4, #3644]
	ldrb	r0, [r7, #649]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1292
	str	r3, [r4, #3640]
	str	r3, [r4, #3636]
	str	r3, [r4, #3632]
.L1285:
	add	r6, r6, #36864
	str	r1, [r6, #3660]
	str	r2, [r6, #3672]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1253:
	cmp	r1, #0
	add	lr, lr, #4
	mov	r2, r2, asl lr
	bne	.L1309
	add	r4, r6, #36864
	ldrb	r3, [r4, #3608]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1257
	ldr	lr, [r4, #3620]
	ldr	ip, [r4, #3624]
	mov	r1, lr
.L1258:
	ldr	r0, [r4, #3612]
	cmp	r0, ip
	bcs	.L1256
	rsb	r3, r0, ip
	cmp	r3, r2, lsr #1
	addcs	r1, r1, r2
	strcs	r1, [r4, #3628]
	bcs	.L1260
.L1256:
	cmp	r0, ip
	bls	.L1261
	rsb	r3, ip, r0
	cmp	r3, r2, lsr #1
	rsbhi	r1, r2, r1
	strhi	r1, [r4, #3628]
	bls	.L1261
.L1260:
	ldrb	r3, [r7, #649]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1262
.L1311:
	ldr	r3, [r4, #3616]
	add	r1, r1, r0
	str	r1, [r4, #3632]
	add	r3, r1, r3
	str	r3, [r4, #3636]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r4, #3644]
.L1263:
	ldr	r2, [r4, #3664]
	str	r3, [r4, #3640]
	add	r3, r6, #40960
	ldr	r1, [r4, #3660]
	cmp	r2, r1
	strne	r2, [r4, #3660]
	ldrb	r3, [r3, #656]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r6, r6, #36864
	ldrne	r2, [r6, #3612]
	ldrne	r3, [r6, #3628]
	strne	r2, [r6, #3624]
	strne	r3, [r6, #3620]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1252:
	cmp	r1, #0
	add	r4, r6, #36864
	movne	r3, #0
	strne	r3, [r4, #3668]
	bne	.L1267
	ldrb	r2, [r4, #3608]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1268
	mov	r3, r1
	str	r1, [r4, #3672]
	str	r1, [r4, #3660]
.L1269:
	str	r3, [r4, #3668]
.L1267:
	ldr	r3, [r5, #2916]
	cmp	r3, #0
	beq	.L1271
	ldr	r3, [r4, #3664]
	ldr	r0, [r4, #3668]
	add	r0, r3, r0
	str	r0, [r4, #3656]
	ldrb	r8, [r7, #656]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L1273
	cmp	r0, #0
	beq	.L1274
	sub	r0, r0, #1
	str	r0, [r4, #3656]
.L1273:
	mov	r3, #0
	str	r3, [r4, #3688]
	ldr	r1, [r5, #2916]
	cmp	r1, r3
	bgt	.L1294
	cmp	r0, #0
	beq	.L1277
.L1310:
	sub	r9, r0, #1
	mov	r0, r9
	bl	__aeabi_uidiv
	mov	r10, r0
	mov	r0, r9
	str	r10, [r4, #3680]
	ldr	r1, [r5, #2916]
	bl	__aeabi_uidivmod
	ldr	r0, [r4, #3688]
	mul	r0, r0, r10
	str	r0, [r4, #3684]
	cmp	r1, #0
	str	r1, [r4, #3676]
	blt	.L1278
	add	r2, r5, #2912
	add	r1, r1, #1
	add	r2, r2, #4
	mov	r3, #0
.L1279:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r4, #3684]
	bne	.L1279
.L1278:
	cmp	r8, #0
	ldreq	r3, [r5, #2908]
	addeq	r0, r0, r3
	streq	r0, [r4, #3684]
	ldrb	r3, [r7, #649]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1281
	ldr	r2, [r4, #3648]
	ldr	r1, [r4, #3652]
	add	r2, r0, r2
	str	r2, [r4, #3632]
	ldr	r3, [r5, #2912]
	add	r3, r2, r3
	add	r0, r3, r1
	str	r0, [r4, #3636]
	cmp	r0, r2
	movge	r0, r2
	str	r0, [r4, #3644]
.L1282:
	add	r6, r6, #36864
	ldr	r2, [r6, #3664]
	ldr	r3, [r6, #3668]
	str	r0, [r6, #3640]
	str	r2, [r6, #3660]
	str	r3, [r6, #3672]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1271:
	str	r3, [r4, #3656]
	ldrb	r8, [r7, #656]	@ zero_extendqisi2
.L1274:
	mov	r0, #0
	str	r0, [r4, #3688]
	ldr	r3, [r5, #2916]
	cmp	r3, r0
	ble	.L1277
.L1294:
	add	ip, r5, #2912
	mov	r3, #0
	add	ip, ip, #4
	mov	r2, r3
.L1276:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r4, #3688]
	ldr	r1, [r5, #2916]
	cmp	r1, r2
	bgt	.L1276
	cmp	r0, #0
	bne	.L1310
.L1277:
	mov	r0, #0
	str	r0, [r4, #3684]
	b	.L1278
.L1309:
	add	r4, r0, #11075584
	add	r4, r4, #36864
.L1259:
	mov	r3, #0
	ldr	r0, [r4, #3612]
	str	r3, [r4, #3620]
	mov	lr, r3
	str	r3, [r4, #3624]
	mov	r1, ip
	b	.L1256
.L1308:
	add	r3, r6, #36864
	mov	r1, #0
	mov	r2, r1
	str	r1, [r3, #3668]
	str	r1, [r3, #3636]
	str	r1, [r3, #3632]
	str	r1, [r3, #3640]
	str	r1, [r3, #3644]
	ldr	r1, [r3, #3664]
	b	.L1285
.L1261:
	str	lr, [r4, #3628]
	ldrb	r3, [r7, #649]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1311
.L1262:
	ldrb	r3, [r7, #650]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r1, r0
	streq	r3, [r4, #3632]
	strne	r3, [r4, #3636]
	str	r3, [r4, #3644]
	b	.L1263
.L1281:
	ldrb	r3, [r7, #650]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r5, #2912]
	ldreq	r3, [r4, #3648]
	ldrne	r3, [r4, #3648]
	addne	r0, r0, r2
	addeq	r0, r0, r3
	streq	r0, [r4, #3632]
	addne	r0, r0, r3
	strne	r0, [r4, #3636]
	str	r0, [r4, #3644]
	b	.L1282
.L1257:
	movw	r3, #3609
	ldrsb	r3, [r4, r3]
	cmp	r3, #0
	bne	.L1259
	ldr	r0, [r4, #3632]
	mov	r1, ip
	mov	lr, r3
	str	r3, [r4, #3620]
	mov	ip, r0
	str	r0, [r4, #3624]
	b	.L1258
.L1268:
	ldr	r1, [r4, #3664]
	ldr	r2, [r4, #3660]
	cmp	r1, r2
	bcs	.L1270
	ldr	r2, [r4, #3672]
	add	r3, r3, r2
	str	r3, [r4, #3668]
	b	.L1267
.L1292:
	ldrb	r0, [r7, #650]	@ zero_extendqisi2
	str	r3, [r4, #3640]
	cmp	r0, #0
	streq	r3, [r4, #3632]
	strne	r3, [r4, #3636]
	b	.L1285
.L1286:
	str	r1, [r4, #3660]
	mov	r2, r1
	str	r1, [r4, #3672]
	ldr	r1, [r4, #3664]
.L1288:
	str	r2, [r4, #3668]
	b	.L1289
.L1270:
	ldr	r3, [r4, #3672]
	b	.L1269
	UNWIND(.fnend)
	.size	MVC_DecPOC, .-MVC_DecPOC
	.align	2
	.global	MVC_CalcPicNum
	.type	MVC_CalcPicNum, %function
MVC_CalcPicNum:
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
	add	r5, r0, #11141120
	ldr	r3, [r0, #236]
	add	r5, r5, #8192
	mov	r6, #1
	ldrb	r2, [r5, #3003]	@ zero_extendqisi2
	ldr	r3, [r3, #2896]
	cmp	r2, #0
	add	r3, r3, #4
	mov	r6, r6, asl r3
	add	r3, r0, #11075584
	beq	.L1313
	add	r3, r3, #45056
	sub	r7, r2, #1
	sub	r2, r2, #2
	clz	r7, r7
	ldr	r1, [r3, #2512]
	clz	r2, r2
	mov	r7, r7, lsr #5
	cmp	r1, #0
	mov	r2, r2, lsr #5
	movwne	lr, #47428
	movne	r1, #0
	movtne	lr, 169
	addne	lr, r0, lr
	beq	.L1333
.L1332:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #3]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L1327
	ldr	r4, [ip, #20]
	ldr	r8, [r5, #3560]
	cmp	r4, r8
	rsbhi	r4, r6, r4
	str	r4, [ip, #24]
	ldr	ip, [lr]
	ldrb	r4, [ip, #3]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L1330
	ldr	r8, [ip, #644]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	r4, [ip, #24]
	addeq	r4, r7, r4, lsl #1
	streq	r4, [ip, #656]
	ldreq	ip, [lr]
	ldreqb	r4, [ip, #3]	@ zero_extendqisi2
.L1330:
	tst	r4, #2
	beq	.L1327
	ldr	r4, [ip, #680]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	ldreq	r4, [ip, #24]
	addeq	r4, r2, r4, lsl #1
	streq	r4, [ip, #692]
.L1327:
	ldr	ip, [r3, #2512]
	add	r1, r1, #1
	cmp	ip, r1
	bhi	.L1332
.L1333:
	ldr	r1, [r3, #2516]
	cmp	r1, #0
	beq	.L1357
	movw	r4, #47492
	mov	ip, #0
	movt	r4, 169
	add	r4, r0, r4
.L1338:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldrb	r1, [lr, #3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1335
	tst	r1, #1
	beq	.L1336
	ldr	r0, [lr, #644]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #256
	ldreq	r1, [lr, #28]
	addeq	r1, r7, r1, lsl #1
	streq	r1, [lr, #652]
	ldreq	lr, [r4]
	ldreqb	r1, [lr, #3]	@ zero_extendqisi2
.L1336:
	tst	r1, #2
	beq	.L1335
	ldr	r1, [lr, #680]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [lr, #28]
	addeq	r1, r2, r1, lsl #1
	streq	r1, [lr, #688]
.L1335:
	ldr	r1, [r3, #2516]
	cmp	r1, ip
	bhi	.L1338
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1313:
	add	r3, r3, #45056
	ldr	r1, [r3, #2512]
	cmp	r1, #0
	movwne	lr, #47428
	movtne	lr, 169
	addne	lr, r0, lr
	bne	.L1322
.L1323:
	ldr	r2, [r3, #2516]
	cmp	r2, #0
	beq	.L1358
	movw	ip, #47492
	mov	r2, #0
	movt	ip, 169
	add	ip, r0, ip
	b	.L1325
.L1324:
	ldr	r1, [r3, #2516]
	cmp	r1, r2
	bls	.L1359
.L1325:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	ldrb	r0, [r1, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1324
	ldr	r0, [r1, #608]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #256
	ldreq	r0, [r1, #28]
	streq	r0, [r1, #616]
	ldr	r1, [r3, #2516]
	cmp	r1, r2
	bhi	.L1325
.L1359:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1360:
	ldr	ip, [r1, #608]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L1319
	ldr	ip, [r1, #20]
	ldr	r4, [r5, #3560]
	rsb	r7, r6, ip
	cmp	ip, r4
	strhi	r7, [r1, #24]
	strls	ip, [r1, #24]
	ldr	r1, [lr]
	ldr	ip, [r1, #24]
	str	ip, [r1, #620]
.L1319:
	ldr	r1, [r3, #2512]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1323
.L1322:
	ldr	r1, [lr, #4]!
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1319
	b	.L1360
.L1358:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1357:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_CalcPicNum, .-MVC_CalcPicNum
	.align	2
	.global	MVC_IsOutDPB
	.type	MVC_IsOutDPB, %function
MVC_IsOutDPB:
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
	beq	.L1366
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	lr, [r3, #2504]
	cmp	lr, #0
	beq	.L1366
	ldr	r2, [r3, #2312]
	rsb	r3, r2, r1
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L1368
	movw	ip, #47368
	movt	ip, 169
	add	ip, r0, ip
	b	.L1363
.L1364:
	ldr	r2, [ip, #4]!
	rsb	r0, r2, r1
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L1368
.L1363:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L1364
.L1366:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1368:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_IsOutDPB, .-MVC_IsOutDPB
	.align	2
	.global	mvc_assign_quant_params
	.type	mvc_assign_quant_params, %function
mvc_assign_quant_params:
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
	subs	r3, r0, #0
	str	r1, [fp, #-48]
	str	r3, [fp, #-52]
	beq	.L1400
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1401
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1389
	ldr	r3, [fp, #-48]
	mov	r4, #0
	ldr	r1, [fp, #-52]
	add	r2, r3, #2016
	add	r8, r3, #1728
	str	r2, [fp, #-56]
	add	r9, r1, #2384
	mov	r6, r2
	add	r7, r3, #1984
	add	r5, r3, #5
	ldr	r10, .L1406
	b	.L1374
.L1404:
	cmp	r4, #0
	beq	.L1402
	cmp	r4, #3
	beq	.L1403
	ldr	r3, [r10, #52]
	mov	r2, #16
	sub	r1, r6, #16
	mov	r0, r6
	blx	r3
.L1382:
	add	r4, r4, #1
	cmp	r4, #7
	bhi	.L1389
.L1388:
	add	r8, r8, #64
	add	r9, r9, #64
	add	r6, r6, #16
	add	r7, r7, #4
	add	r5, r5, #1
.L1374:
	cmp	r4, #5
	ldrsb	r3, [r5]
	bhi	.L1375
	cmp	r3, #0
	beq	.L1404
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1382
	ldr	r1, .L1406+4
	cmp	r4, #2
	mov	r2, #16
	ldr	r3, [r10, #52]
	add	r0, r1, r2
	add	r4, r4, #1
	movhi	r1, r0
	mov	r0, r6
	blx	r3
	cmp	r4, #7
	bls	.L1388
.L1389:
	mov	r0, #0
.L1371:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1375:
	cmp	r3, #0
	bne	.L1384
	ldr	r3, [fp, #-52]
	mov	r2, #64
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #52]
	bne	.L1405
.L1399:
	ldr	r1, .L1406+8
	cmp	r4, #6
	add	r0, r1, r2
	movne	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1382
.L1384:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1382
	ldr	r3, [r10, #52]
	mov	r2, #64
	b	.L1399
.L1405:
	mov	r1, r9
	mov	r0, r8
	blx	r3
	b	.L1382
.L1400:
	movw	r1, #5536
	ldr	r3, .L1406+12
	str	r1, [sp]
	ldr	r2, .L1406+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L1371
.L1401:
	movw	r1, #5537
	mov	r0, r3
	str	r1, [sp]
	ldr	r3, .L1406+12
	ldr	r2, .L1406+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L1371
.L1403:
	ldr	r3, [fp, #-52]
	mov	r2, #16
	ldr	r0, [fp, #-48]
	mov	r4, #4
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	add	r0, r0, #2064
	cmp	r3, #0
	ldr	r3, [r10, #52]
	ldrne	r1, [fp, #-52]
	ldreq	r1, .L1406+20
	addne	r1, r1, #2720
	blx	r3
	b	.L1388
.L1402:
	ldr	r3, [fp, #-52]
	mov	r2, #16
	ldr	r0, [fp, #-56]
	mov	r4, #1
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #52]
	ldrne	r1, [fp, #-52]
	ldreq	r1, .L1406+4
	addne	r1, r1, #2672
	blx	r3
	b	.L1388
.L1407:
	.align	2
.L1406:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR1+32
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR1+16
	UNWIND(.fnend)
	.size	mvc_assign_quant_params, .-mvc_assign_quant_params
	.align	2
	.global	MVC_WritePicMsg
	.type	MVC_WritePicMsg, %function
MVC_WritePicMsg:
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
	add	r6, r0, #11141120
	add	r8, r6, #8192
	mov	r4, r0
	ldr	r2, .L1444
	movw	r1, #6065
	ldr	r7, [r8, #3628]
	mov	r0, #3
	ldrb	ip, [r8, #3003]	@ zero_extendqisi2
	add	r6, r6, #12288
	ldr	lr, [r8, #3104]
	mov	r5, #0
	ldr	r3, [r8, #3568]
	str	r7, [sp, #8]
	add	r7, r4, #11075584
	str	ip, [sp]
	add	ip, r7, #32768
	str	lr, [sp, #4]
	add	r10, r7, #36864
	mov	r9, ip
	str	ip, [fp, #-52]
	bl	dprint_normal
	ldr	r2, [r4, #544]
	str	r5, [r4, #64]
	str	r2, [r6, #1556]
	ldr	r2, [r8, #3388]
	str	r2, [r6, #1332]
	ldr	r2, [r8, #3392]
	str	r2, [r6, #1336]
	ldr	r2, [r8, #3396]
	str	r2, [r6, #1340]
	ldr	r2, [r8, #3400]
	str	r2, [r6, #1344]
	ldr	r2, [r8, #3568]
	str	r2, [r6, #764]
	ldrb	r2, [r8, #3003]	@ zero_extendqisi2
	strb	r2, [r6, #756]
	ldr	r2, [r4, #236]
	ldrb	r1, [r2, #21]	@ zero_extendqisi2
	str	r1, [r6, #780]
	ldr	r1, [r8, #3612]
	str	r1, [r6, #768]
	ldr	r1, [r8, #3616]
	str	r1, [r6, #772]
	ldr	r1, [r2, #3948]
	add	r1, r1, #1
	str	r1, [r6, #776]
	ldrb	r1, [r9, #1492]	@ zero_extendqisi2
	strb	r1, [r6, #759]
	ldr	r1, [r10, #1428]
	str	r1, [r6, #784]
	ldrb	r1, [r10, #1368]	@ zero_extendqisi2
	str	r1, [r6, #788]
	ldr	r2, [r2, #748]
	strb	r2, [r6, #757]
	ldrb	r2, [r10, #1372]	@ zero_extendqisi2
	str	r2, [r6, #792]
	ldr	r2, [r10, #3644]
	str	r2, [r6, #796]
	ldr	r2, [r10, #3632]
	str	r2, [r6, #800]
	ldr	r2, [r10, #3636]
	str	r2, [r6, #804]
	ldr	r2, [r8, #3552]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r2, #6]
	bl	FSP_GetLogicFs
	subs	r9, r0, #0
	beq	.L1442
	ldr	r3, [r9, #24]
	ldr	r2, [r9, #32]
	cmp	r3, #0
	beq	.L1412
	cmp	r2, #0
	beq	.L1412
	movw	r2, #13344
	movw	r1, #13480
	ldr	r0, [r4, #120]
	movt	r2, 170
	movt	r1, 170
	add	r2, r4, r2
	add	r1, r4, r1
	add	r7, r7, #45056
	bl	FSP_GetDecFsAddrTab
	ldr	r0, [r9, #184]
	movw	r2, #13484
	movw	r1, #13612
	movt	r2, 170
	movt	r1, 170
	str	r0, [r6, #1184]
	add	r2, r4, r2
	ldr	r0, [r9, #24]
	add	r1, r4, r1
	ldr	r0, [r0, #36]
	str	r0, [r6, #1040]
	ldrb	r0, [r9, #408]	@ zero_extendqisi2
	strb	r0, [r6, #760]
	ldr	r0, [r4, #120]
	bl	FSP_GetPmvAddrTab
	ldr	r2, [r8, #3628]
	str	r2, [r6, #1048]
	ldr	r2, [r9, #32]
	ldr	r2, [r2, #16]
	str	r2, [r6, #1328]
	ldr	r2, [r9, #24]
	ldr	r2, [r2, #4]
	str	r2, [r6, #1044]
	ldr	r2, [r9, #24]
	ldr	r2, [r2, #72]
	str	r2, [r6, #1052]
	ldr	r3, [r7, #2732]
	cmp	r3, #0
	str	r3, [fp, #-48]
	str	r3, [r6, #1548]
	beq	.L1418
	movw	r6, #47592
	movw	lr, #13640
	movw	ip, #47656
	movw	r0, #13704
	movw	r1, #47720
	movw	r2, #13768
	ldr	r8, [fp, #-48]
	movt	r6, 169
	movt	lr, 170
	movt	ip, 169
	movt	r0, 170
	movt	r1, 169
	movt	r2, 170
	add	r6, r4, r6
	add	lr, r4, lr
	add	ip, r4, ip
	add	r0, r4, r0
	add	r1, r4, r1
	add	r2, r4, r2
.L1417:
	ldr	r3, [r6, #4]!
	add	r5, r5, #1
	cmp	r5, r8
	str	r3, [lr, #4]!
	ldr	r3, [ip, #4]!
	str	r3, [r0, #4]!
	ldr	r3, [r1, #4]!
	str	r3, [r2, #4]!
	bne	.L1417
.L1418:
	ldr	r3, [fp, #-52]
	ldrb	r2, [r3, #1499]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1443
	ldrb	ip, [r10, #1386]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1419
	movw	lr, #13092
	ldr	r0, .L1444+4
	movt	lr, 170
	add	lr, r4, lr
.L1420:
	and	r3, ip, #3
	add	ip, ip, #1
	cmp	ip, #24
	add	r3, r0, r3, lsl #2
	ldr	r3, [r3, #352]
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [lr, #4]!
	bne	.L1420
	movw	r8, #13192
	mov	r6, #0
	movt	r8, 170
	add	r8, r4, r8
.L1421:
	add	r3, r6, #1
	and	r2, r6, #14
	and	r3, r3, #15
	add	r6, r6, #2
	add	r2, r0, r2, lsl #2
	cmp	r6, #32
	add	r3, r0, r3, lsl #2
	ldr	r1, [r2, #368]
	ldr	ip, [r3, #368]
	ubfx	r3, r1, #8, #8
	mov	r2, r1, lsr #24
	uxtb	r9, r1
	uxtb	r5, ip
	mov	lr, ip, lsr #16
	orr	r3, r3, r2, asl #8
	mov	r1, r1, lsr #8
	mov	r5, r5, asl #16
	and	r2, ip, #-16777216
	orr	lr, r5, lr, asl #24
	ubfx	ip, ip, #8, #8
	orr	r3, r3, r2
	orr	lr, lr, r9
	and	r1, r1, #65280
	orr	r3, r3, ip, asl #16
	orr	r2, lr, r1
	stmia	r8, {r2, r3}
	add	r8, r8, #8
	bne	.L1421
.L1426:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1423
	movw	r5, #47596
	movw	r9, #13844
	movw	r8, #13908
	movt	r5, 169
	movt	r9, 170
	movt	r8, 170
	add	r5, r4, r5
	add	r9, r4, r9
	add	r8, r4, r8
	mov	r6, #0
.L1429:
	ldr	r1, [r5]
	add	r6, r6, #1
	ldr	r0, [r4, #120]
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r9, #4]!
	ldr	r3, [r5], #4
	str	r3, [r8, #4]!
	ldr	r3, [r7, #2732]
	cmp	r3, r6
	bhi	.L1429
.L1423:
	mov	r0, #0
.L1439:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1443:
	ldrb	ip, [r10, #1386]	@ zero_extendqisi2
.L1419:
	cmp	ip, #1
	movw	ip, #13092
	movt	ip, 170
	mov	r0, #0
	add	ip, r4, ip
	beq	.L1424
.L1427:
	movw	r3, #25612
	movt	r3, 42
	add	r3, r0, r3
	add	r0, r0, #1
	ldr	r3, [r4, r3, asl #2]
	cmp	r0, #24
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1427
	movw	r9, #13192
	mov	r10, #1
	movt	r9, 170
	add	r9, r4, r9
	mov	r8, #0
.L1428:
	mov	r2, r8, lsr #3
	mov	r3, r8, asl #1
	and	r1, r3, #14
	and	r0, r10, #15
	mov	r3, r2, asl #4
	movw	r2, #25636
	add	r0, r3, r0
	add	r3, r3, r1
	mov	r1, r2
	movt	r2, 42
	movt	r1, 42
	add	r2, r0, r2
	add	r1, r3, r1
	add	r8, r8, #1
	ldr	r2, [r4, r2, asl #2]
	cmp	r8, #16
	ldr	r3, [r4, r1, asl #2]
	add	r10, r10, #2
	ubfx	r6, r2, #8, #8
	and	lr, r2, #-16777216
	mov	r0, r2, lsr #16
	uxtb	r1, r2
	mov	ip, r3, lsr #24
	uxtb	r5, r3
	mov	r2, r0, asl #24
	mov	r0, r3, lsr #8
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r6, asl #16
	orr	r1, r2, r5
	ubfx	r3, r3, #8, #8
	and	r2, r0, #65280
	orr	ip, ip, lr
	orr	r2, r1, r2
	orr	r3, ip, r3
	stmia	r9, {r2, r3}
	add	r9, r9, #8
	bne	.L1428
	b	.L1426
.L1424:
	movw	r3, #26446
	movt	r3, 42
	add	r3, r0, r3
	add	r0, r0, #1
	ldr	r3, [r4, r3, asl #2]
	cmp	r0, #24
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1424
	movw	ip, #13192
	mov	lr, #1
	movt	ip, 170
	add	ip, r4, ip
	mov	r0, #0
.L1425:
	mov	r2, r0, lsr #3
	mov	r3, r0, asl #1
	and	r6, r3, #14
	and	r5, lr, #15
	mov	r3, r2, asl #4
	movw	r1, #26470
	add	r5, r3, r5
	mov	r2, r1
	add	r3, r3, r6
	movt	r1, 42
	movt	r2, 42
	add	r1, r5, r1
	add	r2, r3, r2
	add	r0, r0, #1
	ldr	r1, [r4, r1, asl #2]
	cmp	r0, #16
	ldr	r3, [r4, r2, asl #2]
	add	lr, lr, #2
	ubfx	r9, r1, #8, #8
	and	r6, r1, #-16777216
	mov	r5, r1, lsr #16
	uxtb	r1, r1
	mov	r2, r3, lsr #24
	uxtb	r8, r3
	mov	r5, r5, asl #24
	mov	r2, r2, asl #8
	orr	r1, r5, r1, asl #16
	orr	r9, r2, r9, asl #16
	mov	r2, r3, lsr #8
	orr	r1, r1, r8
	and	r2, r2, #65280
	ubfx	r3, r3, #8, #8
	orr	r9, r9, r6
	orr	r2, r1, r2
	orr	r3, r9, r3
	stmia	ip, {r2, r3}
	add	ip, ip, #8
	bne	.L1425
	b	.L1426
.L1412:
	str	r2, [sp]
	movw	r1, #6100
	ldr	r2, .L1444+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L1439
.L1442:
	ldr	r3, [r8, #3552]
	movw	r1, #6094
	ldr	r2, .L1444+12
	ldrsb	r3, [r3, #6]
	bl	dprint_normal
	mvn	r0, #0
	b	.L1439
.L1445:
	.align	2
.L1444:
	.word	.LC26
	.word	.LANCHOR1
	.word	.LC28
	.word	.LC27
	UNWIND(.fnend)
	.size	MVC_WritePicMsg, .-MVC_WritePicMsg
	.align	2
	.global	MVC_UpdatePicQpInf
	.type	MVC_UpdatePicQpInf, %function
MVC_UpdatePicQpInf:
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
	.size	MVC_UpdatePicQpInf, .-MVC_UpdatePicQpInf
	.align	2
	.global	MVC_WriteSliceMsg
	.type	MVC_WriteSliceMsg, %function
MVC_WriteSliceMsg:
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
	ldr	r3, [r0, #64]
	movw	r1, #4060
	mov	r4, r0
	mov	ip, r3
	str	r3, [fp, #-48]
	mul	r1, r1, ip
	ldr	r3, [r0, #32]
	ldr	r0, [r0, #544]
	add	r2, ip, #1
	sub	r3, r3, #1
	str	r2, [r4, #64]
	cmp	ip, r3
	add	r6, r0, r1
	addcc	r3, r1, #4048
	addcc	r3, r3, #12
	movcs	r3, #0
	addcc	r3, r0, r3
	str	r3, [r6, #4056]
	ldr	r2, [r4, #232]
	ldrb	ip, [r2]	@ zero_extendqisi2
	ldr	r3, [r2, #68]
	cmp	ip, #1
	cmpls	ip, r3
	bcs	.L1450
	add	lr, ip, #3
	add	lr, r6, lr, lsl #2
.L1451:
	mov	r3, ip, asl #5
	sub	r3, r3, ip, asl #2
	add	ip, ip, #1
	add	r2, r2, r3
	ldr	r2, [r2, #24]
	str	r2, [lr, #4]!
	ldr	r2, [r4, #232]
	add	r2, r2, r3
	ldr	r2, [r2, #20]
	str	r2, [lr, #-8]
	ldr	r2, [r4, #232]
	add	r3, r2, r3
	ldr	r3, [r3, #28]
	str	r3, [lr, #8]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #68]
	cmp	r3, ip
	movhi	r5, #1
	movls	r5, #0
	cmp	ip, #1
	movhi	r5, #0
	cmp	r5, #0
	bne	.L1451
.L1450:
	cmp	r3, #1
	bhi	.L1456
	add	r3, r3, #3
	add	ip, r6, #20
	mov	r2, #0
	add	r3, r6, r3, lsl #2
.L1455:
	str	r2, [r3, #4]!
	cmp	r3, ip
	str	r2, [r3, #-8]
	str	r2, [r3, #8]
	bne	.L1455
.L1456:
	add	r3, r4, #11141120
	str	r3, [fp, #-52]
	add	r7, r3, #8192
	ldr	r3, [fp, #-48]
	add	r5, r4, #11075584
	cmp	r3, #0
	ldrb	r3, [r7, #3009]	@ zero_extendqisi2
	add	r9, r5, #36864
	add	r5, r5, #40960
	strb	r3, [r6, #1]
	ldr	r3, [r9, #1416]
	ldr	r2, [r5, #2264]
	add	r3, r3, #26
	add	r3, r3, r2
	str	r3, [r6, #32]
	bne	.L1550
	ldr	r2, [r7, #3552]
	str	r3, [r2, #636]
	ldr	r3, [r7, #3552]
	ldr	r2, [r6, #32]
	str	r2, [r3, #640]
.L1457:
	ldr	r3, [r5, #2260]
	str	r3, [r6, #36]
	ldr	r3, [r5, #712]
	str	r3, [r6, #40]
	ldr	r3, [r5, #708]
	str	r3, [r6, #44]
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	strb	r3, [r0, r1]
	ldr	r3, [r5, #704]
	str	r3, [r6, #48]
	ldrb	r3, [r5, #654]	@ zero_extendqisi2
	strb	r3, [r6, #2]
	ldr	r3, [r4, #236]
	ldrb	r3, [r3, #22]	@ zero_extendqisi2
	strb	r3, [r6, #3]
	ldr	r3, [r5, #696]
	str	r3, [r6, #52]
	ldr	r3, [r5, #700]
	str	r3, [r6, #56]
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r9, #1412]
	streqb	r3, [r6, #4]
	beq	.L1459
	cmp	r3, #0
	ldreqb	r3, [r9, #1370]	@ zero_extendqisi2
	movne	r3, #0
	strb	r3, [r6, #4]
.L1459:
	ldr	r3, [r9, #1420]
	str	r3, [r6, #60]
	ldr	r3, [r9, #1424]
	str	r3, [r6, #64]
	ldr	r3, [r5, #2272]
	str	r3, [r6, #68]
	ldr	r3, [r5, #2276]
	str	r3, [r6, #72]
	ldr	r3, [r5, #2268]
	str	r3, [r6, #76]
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1498
	ldr	r8, [r5, #696]
	cmp	r8, #0
	beq	.L1501
	ldr	r3, [r4, #256]
	ldr	r2, [r3, #4]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r4, #256
	movne	r3, #0
	bne	.L1466
	b	.L1464
.L1468:
	ldr	r2, [r1, #4]!
	ldr	r2, [r2, #4]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1464
.L1466:
	add	r3, r3, #1
	cmp	r3, r8
	bne	.L1468
	mov	r3, #0
	str	r3, [fp, #-56]
.L1463:
	ldr	ip, [r5, #700]
	cmp	ip, #0
	beq	.L1502
	ldr	r3, [r4, #388]
	ldr	r2, [r3, #4]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r4, #388
	movne	r3, #0
	bne	.L1472
	b	.L1470
.L1474:
	ldr	r2, [r1, #4]!
	ldr	r2, [r2, #4]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1470
.L1472:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1474
	mov	r3, #0
	str	r3, [fp, #-60]
.L1469:
	ldrb	r2, [r7, #3003]	@ zero_extendqisi2
	ldr	r3, [r5, #696]
	cmp	r2, #0
	beq	.L1475
	cmp	r3, #0
	beq	.L1490
	mov	r8, #0
	mov	r10, r6
	str	r6, [fp, #-64]
	add	r7, r4, #256
	mov	r6, r5
	mov	r5, r8
	ldr	r8, [fp, #-56]
	b	.L1489
.L1487:
	strb	r2, [r10, #1630]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r10, #1631]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r10, #1656]
.L1488:
	ldr	r2, [r6, #696]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r10, r10, #36
	cmp	r2, r5
	bls	.L1551
.L1489:
	ldr	r2, [r7]
	ldr	r0, [r4, #120]
	ldr	r2, [r2, #4]
	ldrsb	r1, [r2, #6]
	bl	FSP_GetLogicFs
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #48]
	str	r2, [r10, #1636]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strb	r2, [r10, #1625]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r8
	beq	.L1486
	cmp	r0, #0
	ldrne	r2, [r0, #24]
	ldrne	r0, [r2, #36]
.L1486:
	str	r0, [r10, #1640]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #52]
	str	r2, [r10, #1644]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #32]
	str	r2, [r10, #1632]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r10, #1624]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #608]	@ zero_extendqisi2
	strb	r2, [r10, #1626]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1487
	strb	r2, [r10, #1628]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r10, #1629]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r10, #1652]
	b	.L1488
.L1551:
	mov	r5, r6
	ldr	r6, [fp, #-64]
.L1490:
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1552
.L1478:
	movw	r2, #47792
	add	r3, r6, #3920
	add	r0, r6, #4048
	movt	r2, 169
	add	r3, r3, #4
	add	r2, r4, r2
	add	r0, r0, #4
.L1495:
	ldr	r1, [r2, #4]!
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L1495
	ldr	r3, [fp, #-52]
	ldrb	r2, [r9, #1370]	@ zero_extendqisi2
	add	r3, r3, #12288
	cmp	r2, #0
	str	r2, [r3, #1032]
	ldr	r2, [r9, #1412]
	str	r2, [r3, #1036]
	beq	.L1496
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1497
.L1496:
	cmp	r2, #1
	beq	.L1553
.L1498:
	ldr	r2, [fp, #-48]
	movw	r3, #35892
	movt	r3, 42
	ldr	r1, [r4, #232]
	add	r3, r2, r3
	mov	r2, #0
	add	r3, r4, r3, lsl #2
	str	r1, [r3, #4]
	str	r2, [r4, #232]
.L1447:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1550:
	ldr	r2, [r7, #3552]
	ldr	lr, [r2, #636]
	ldr	ip, [r2, #640]
	cmp	lr, r3
	movlt	lr, r3
	cmp	ip, r3
	str	lr, [r2, #636]
	movge	ip, r3
	str	ip, [r2, #640]
	b	.L1457
.L1464:
	ldrsb	r1, [r2, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1554
	ldr	r3, [r3, #24]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-56]
	b	.L1463
.L1553:
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1498
.L1497:
	ldr	r3, [r5, #716]
	movw	r8, #41680
	movw	r7, #41808
	movw	lr, #41936
	movw	ip, #42448
	movw	r0, #42576
	str	r3, [r6, #80]
	movw	r1, #42704
	ldr	r10, [r5, #720]
	movt	r8, 169
	movt	r7, 169
	movt	lr, 169
	movt	ip, 169
	movt	r0, 169
	movt	r1, 169
	add	r8, r4, r8
	add	r7, r4, r7
	add	lr, r4, lr
	add	ip, r4, ip
	add	r0, r4, r0
	add	r1, r4, r1
	mov	r9, r6
	mov	r3, r6
	mov	r2, #0
	str	r6, [fp, #-52]
	str	r10, [r9, #84]!
.L1499:
	ldr	r10, [r8, #4]!
	add	r2, r2, #1
	add	r3, r3, #4
	str	r10, [r9, #4]!
	ldr	r10, [r7, #4]!
	str	r10, [r3, #212]
	ldr	r10, [lr, #4]!
	str	r10, [r3, #340]
	ldr	r10, [ip, #4]!
	str	r10, [r3, #852]
	ldr	r10, [r0, #4]!
	str	r10, [r3, #980]
	ldr	r10, [r1, #4]!
	str	r10, [r3, #1108]
	ldr	r10, [r5, #708]
	cmp	r10, r2
	bcs	.L1499
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1498
	movw	r7, #42064
	movw	lr, #42192
	movw	ip, #42320
	movw	r0, #42832
	movw	r1, #42960
	movw	r2, #43088
	ldr	r8, [fp, #-52]
	movt	r7, 169
	movt	lr, 169
	movt	ip, 169
	movt	r0, 169
	movt	r1, 169
	movt	r2, 169
	add	r6, r6, #468
	add	r7, r4, r7
	add	lr, r4, lr
	add	ip, r4, ip
	add	r0, r4, r0
	add	r1, r4, r1
	add	r2, r4, r2
	mov	r3, #0
.L1500:
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
	ldr	r9, [r5, #712]
	cmp	r9, r3
	bcs	.L1500
	b	.L1498
.L1475:
	cmp	r3, #0
	beq	.L1483
	ldr	r8, [fp, #-56]
	add	r10, r4, #256
	mov	r7, r6
	str	r6, [fp, #-64]
	mov	r6, r5
	mov	r5, r2
.L1482:
	ldr	r2, [r10]
	ldr	r0, [r4, #120]
	ldr	r2, [r2, #4]
	ldrsb	r1, [r2, #6]
	bl	FSP_GetLogicFs
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #48]
	str	r2, [r7, #1636]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strb	r2, [r7, #1625]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r8
	beq	.L1481
	cmp	r0, #0
	ldrne	r2, [r0, #24]
	ldrne	r0, [r2, #36]
.L1481:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r2, [r10]
	add	r5, r5, #1
	add	r7, r7, #36
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #52]
	str	r2, [r7, #1608]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #32]
	str	r2, [r7, #1596]
	ldr	r2, [r10]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r7, #1591]
	ldr	r2, [r10]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r7, #1590]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #624]
	str	r2, [r7, #1612]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #660]
	str	r2, [r7, #1616]
	ldr	r2, [r10], #4
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #696]
	strb	r3, [r7, #1588]
	str	r2, [r7, #1620]
	ldr	r2, [r6, #696]
	cmp	r2, r5
	bhi	.L1482
	mov	r5, r6
	ldr	r6, [fp, #-64]
.L1483:
	ldrb	r3, [r5, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1478
	ldr	r3, [r5, #700]
	cmp	r3, #0
	beq	.L1478
	mov	r8, #0
	mov	r7, r6
	str	r6, [fp, #-56]
	mov	r6, r5
	mov	r5, r8
	ldr	r8, [fp, #-60]
	add	r10, r4, #388
.L1485:
	ldr	r2, [r10]
	ldr	r0, [r4, #120]
	ldr	r2, [r2, #4]
	ldrsb	r1, [r2, #6]
	bl	FSP_GetLogicFs
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #48]
	str	r2, [r7, #2788]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strb	r2, [r7, #2777]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r8
	beq	.L1484
	cmp	r0, #0
	ldrne	r2, [r0, #24]
	ldrne	r0, [r2, #36]
.L1484:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r2, [r10]
	add	r5, r5, #1
	add	r7, r7, #36
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #52]
	str	r2, [r7, #2760]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #32]
	str	r2, [r7, #2748]
	ldr	r2, [r10]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r7, #2743]
	ldr	r2, [r10]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r7, #2742]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #624]
	str	r2, [r7, #2764]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #660]
	str	r2, [r7, #2768]
	ldr	r2, [r10], #4
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #696]
	strb	r3, [r7, #2740]
	str	r2, [r7, #2772]
	ldr	r2, [r6, #700]
	cmp	r2, r5
	bhi	.L1485
.L1546:
	mov	r5, r6
	ldr	r6, [fp, #-56]
	b	.L1478
.L1470:
	ldrsb	r1, [r2, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1555
	ldr	r3, [r3, #24]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-60]
	b	.L1469
.L1552:
	ldr	r3, [r5, #700]
	cmp	r3, #0
	beq	.L1478
	mov	r10, #0
	mov	r8, r6
	str	r6, [fp, #-56]
	add	r7, r4, #388
	mov	r6, r5
	mov	r5, r10
	ldr	r10, [fp, #-60]
	b	.L1494
.L1492:
	strb	r2, [r8, #2782]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #2783]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r8, #2808]
.L1493:
	ldr	r2, [r6, #700]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r8, r8, #36
	cmp	r2, r5
	bls	.L1546
.L1494:
	ldr	r2, [r7]
	ldr	r0, [r4, #120]
	ldr	r2, [r2, #4]
	ldrsb	r1, [r2, #6]
	bl	FSP_GetLogicFs
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #48]
	str	r2, [r8, #2788]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strb	r2, [r8, #2777]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r10
	beq	.L1491
	cmp	r0, #0
	ldrne	r2, [r0, #24]
	ldrne	r0, [r2, #36]
.L1491:
	str	r0, [r8, #2792]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #52]
	str	r2, [r8, #2796]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #32]
	str	r2, [r8, #2784]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r8, #2776]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #608]	@ zero_extendqisi2
	strb	r2, [r8, #2778]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1492
	strb	r2, [r8, #2780]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r8, #2781]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r8, #2804]
	b	.L1493
.L1502:
	str	ip, [fp, #-60]
	b	.L1469
.L1501:
	str	r8, [fp, #-56]
	b	.L1463
.L1555:
	movw	r1, #6332
	ldr	r3, .L1556
	str	r1, [sp]
	ldr	r2, .L1556+4
	bl	dprint_normal
	b	.L1447
.L1554:
	movw	r1, #6312
	ldr	r3, .L1556
	str	r1, [sp]
	ldr	r2, .L1556+4
	bl	dprint_normal
	b	.L1447
.L1557:
	.align	2
.L1556:
	.word	.LANCHOR0+40
	.word	.LC29
	UNWIND(.fnend)
	.size	MVC_WriteSliceMsg, .-MVC_WriteSliceMsg
	.align	2
	.global	MVC_GetPicStreamSize
	.type	MVC_GetPicStreamSize, %function
MVC_GetPicStreamSize:
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
	add	r0, r0, #11141120
	add	r0, r0, #12288
	ldr	r2, [r0, #1556]
	cmp	r2, #0
	beq	.L1561
	mov	r0, #0
.L1560:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1560
	ldmfd	sp, {fp, sp, pc}
.L1561:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetPicStreamSize, .-MVC_GetPicStreamSize
	.align	2
	.global	MVC_SliceCheck
	.type	MVC_SliceCheck, %function
MVC_SliceCheck:
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
	ldr	r1, .L1574
	mov	r4, r0
	add	r5, r0, #11075584
	bl	mvc_ue_v
	add	r5, r5, #40960
	str	r0, [r5, #704]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1572
	cmp	r0, #1048576
	bcs	.L1573
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #16]
	mul	r3, r3, r2
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1572
	ldr	r1, .L1574+4
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L1574+8
	movw	r1, #6711
	mov	r3, r0
	mov	r6, r0
	mov	r0, #17
	bl	dprint_normal
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1572
	cmp	r6, #9
	bhi	.L1568
	mov	r1, #1
	movw	r3, #297
	mov	r2, r1, asl r6
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L1569
	ands	r0, r2, #660
	bne	.L1570
	tst	r2, #66
	beq	.L1568
	strb	r1, [r5, #648]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1569:
	strb	r0, [r5, #648]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1568:
	mov	r3, r6
	ldr	r2, .L1574+12
	movw	r1, #6736
	mov	r0, #1
	bl	dprint_normal
.L1572:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1570:
	mov	r0, r3
	mov	r3, #2
	strb	r3, [r5, #648]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1573:
	ldr	r2, .L1574+16
	movw	r1, #6699
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1575:
	.align	2
.L1574:
	.word	.LC30
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC31
	UNWIND(.fnend)
	.size	MVC_SliceCheck, .-MVC_SliceCheck
	.align	2
	.global	MVC_PPSSPSCheck
	.type	MVC_PPSSPSCheck, %function
MVC_PPSSPSCheck:
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
	add	r5, r0, #11075584
	mov	r4, r0
	add	r5, r5, #40960
	ldr	r2, .L1588
	movw	r1, #6750
	mov	r0, #17
	ldr	r3, [r5, #664]
	bl	dprint_normal
	ldr	r2, [r4, #252]
	ldr	r3, [r5, #664]
	mov	r1, #2240
	mla	r1, r1, r3, r2
	ldrb	r2, [r1, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1586
	ldrb	r3, [r5, #660]	@ zero_extendqisi2
	sxtb	r5, r3
	cmn	r5, #1
	beq	.L1587
	cmp	r3, #0
	bne	.L1581
	ldr	r3, [r1, #28]
	movw	r2, #8500
	movt	r2, 5
	mul	r2, r2, r3
	add	r0, r4, r2
	add	ip, r0, #12992
	add	r2, r0, #286720
	add	ip, ip, #8
	add	r2, r2, #932
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1582
	add	r0, r0, #286720
	ldrb	r0, [r0, #957]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1582
.L1580:
	mov	r0, #0
	str	r1, [r4, #244]
	str	r2, [r4, #240]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1587:
	ldr	r0, [r4, #248]
	movw	r2, #3992
	ldr	r3, [r1, #28]
	mla	r2, r2, r3, r0
	ldrb	r0, [r2, #25]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1580
	ldr	r2, .L1588+4
	movw	r1, #6767
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1582:
	ldr	r2, .L1588+8
	movw	r1, #6778
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1586:
	ldr	r2, .L1588+12
	movw	r1, #6756
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1581:
	mov	r3, r5
	ldr	r2, .L1588+16
	mov	r1, #6784
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1589:
	.align	2
.L1588:
	.word	.LC35
	.word	.LC37
	.word	.LC38
	.word	.LC36
	.word	.LC25
	UNWIND(.fnend)
	.size	MVC_PPSSPSCheck, .-MVC_PPSSPSCheck
	.align	2
	.global	MVC_PPSSPSCheckTmpId
	.type	MVC_PPSSPSCheckTmpId, %function
MVC_PPSSPSCheckTmpId:
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
	ldr	r2, .L1599
	mov	r3, r1
	mov	r5, r1
	mov	r4, r0
	movw	r1, #6800
	mov	r0, #17
	bl	dprint_normal
	ldr	r2, [r4, #252]
	mov	r3, #2240
	mla	r3, r3, r5, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1596
	ldr	r2, [r4, #36]
	ldr	r3, [r3, #28]
	sub	r2, r2, #1
	cmp	r3, r2
	bhi	.L1597
	movw	r2, #41620
	movt	r2, 169
	add	r2, r4, r2
	ldrsb	r5, [r2]
	cmn	r5, #1
	beq	.L1598
.L1595:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1598:
	ldr	r1, [r4, #248]
	movw	r2, #3992
	mla	r2, r2, r3, r1
	ldrb	r2, [r2, #25]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1595
	ldr	r2, .L1599+4
	movw	r1, #6823
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1596:
	mov	r3, r5
	ldr	r2, .L1599+8
	movw	r1, #6806
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1597:
	ldr	r2, .L1599+12
	movw	r1, #6812
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1600:
	.align	2
.L1599:
	.word	.LC39
	.word	.LC42
	.word	.LC40
	.word	.LC41
	UNWIND(.fnend)
	.size	MVC_PPSSPSCheckTmpId, .-MVC_PPSSPSCheckTmpId
	.align	2
	.global	MVC_IsNewPic
	.type	MVC_IsNewPic, %function
MVC_IsNewPic:
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
	add	ip, r0, #11075584
	ldr	lr, [r0, #236]
	add	r2, ip, #40960
	ldr	r1, [lr, #744]
	ldr	r0, [r2, #2312]
	ldr	r3, [r2, #2316]
	ldr	r4, [r2, #664]
	ldr	r5, [r2, #2320]
	cmp	r3, r4
	cmpeq	r0, r1
	ldr	r3, [r2, #676]
	ldrb	r4, [r2, #2304]	@ zero_extendqisi2
	ldrb	r0, [r2, #649]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r5, r3
	moveq	r3, r1
	orrne	r3, r1, #1
	cmp	r4, r0
	orrne	r3, r3, #1
	cmp	r4, #0
	cmpne	r0, #0
	beq	.L1603
	ldrb	r0, [r2, #2305]	@ zero_extendqisi2
	ldrb	r1, [r2, #650]	@ zero_extendqisi2
	cmp	r0, r1
	orrne	r3, r3, #1
.L1603:
	ldrb	r1, [r2, #2307]	@ zero_extendqisi2
	ldrb	r0, [r2, #656]	@ zero_extendqisi2
	cmp	r1, r0
	moveq	r1, #0
	beq	.L1604
	cmp	r0, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
.L1604:
	ldrb	r0, [r2, #2306]	@ zero_extendqisi2
	ldrb	r4, [r2, #651]	@ zero_extendqisi2
	cmp	r0, r4
	orrne	r3, r3, #1
	cmp	r4, #5
	cmpeq	r0, #5
	orr	r3, r3, r1
	beq	.L1616
.L1605:
	ldr	r1, [lr, #2900]
	cmp	r1, #0
	bne	.L1606
	add	r1, ip, #36864
	ldr	r0, [r2, #2332]
	ldr	r4, [r2, #2328]
	ldr	r5, [r1, #3616]
	ldr	lr, [r1, #3612]
	cmp	r4, lr
	cmpeq	r0, r5
	movne	r1, #1
	moveq	r1, #0
	orr	r3, r3, r1
.L1607:
	ldrb	r1, [r2, #659]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1608
	ldr	r1, [r2, #2348]
	ldrb	r0, [r2, #2308]	@ zero_extendqisi2
	ldrb	r6, [r2, #657]	@ zero_extendqisi2
	ldr	r5, [r2, #2288]
	ldrb	r4, [r2, #2309]	@ zero_extendqisi2
	cmp	r1, r5
	cmpeq	r0, r6
	ldrb	lr, [r2, #658]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r4, lr
	moveq	r2, r1
	orrne	r2, r1, #1
	orr	r3, r3, r2
.L1608:
	add	ip, ip, #40960
	ldr	r2, .L1617
	movw	r1, #6875
	mov	r0, #17
	ldr	r4, [ip, #704]
	cmp	r4, #0
	movne	r4, r3
	orreq	r4, r3, #1
	mov	r3, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1606:
	cmp	r1, #1
	bne	.L1607
	add	r1, ip, #36864
	ldr	r0, [r2, #2340]
	ldr	r4, [r2, #2336]
	ldr	r5, [r1, #3652]
	ldr	lr, [r1, #3648]
	cmp	r4, lr
	cmpeq	r0, r5
	movne	r1, #1
	moveq	r1, #0
	orr	r3, r3, r1
	b	.L1607
.L1616:
	ldr	r0, [r2, #2324]
	ldr	r1, [r2, #692]
	cmp	r0, r1
	orrne	r3, r3, #1
	b	.L1605
.L1618:
	.align	2
.L1617:
	.word	.LC43
	UNWIND(.fnend)
	.size	MVC_IsNewPic, .-MVC_IsNewPic
	.align	2
	.global	mvc_ref_pic_list_reordering
	.type	mvc_ref_pic_list_reordering, %function
mvc_ref_pic_list_reordering:
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
	add	r5, r0, #11075584
	add	r8, r5, #40960
	add	r5, r5, #36864
	ldr	r2, [r0, #240]
	mov	r3, #0
	ldrb	r1, [r8, #659]	@ zero_extendqisi2
	mov	r6, #1
	strb	r3, [r5, #3692]
	mov	r4, r0
	cmp	r1, r3
	strb	r3, [r5, #3693]
	ldrb	r3, [r8, #649]	@ zero_extendqisi2
	movne	r7, #5
	moveq	r7, #3
	cmp	r3, #0
	ldr	r3, [r2, #2896]
	addne	r3, r3, #5
	addeq	r3, r3, #4
	mov	r6, r6, asl r3
	ldrb	r3, [r8, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1674
.L1673:
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
.L1640:
	adds	r0, r2, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1672:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1674:
	ldr	r1, .L1681
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #3692]
	cmp	r0, #0
	beq	.L1630
	ldr	r3, [r8, #708]
	cmn	r3, #2
	beq	.L1656
	movw	r10, #40556
	mov	r9, #0
	movt	r10, 169
	add	r10, r4, r10
	b	.L1637
.L1631:
	cmp	r0, #2
	beq	.L1675
	sub	r0, r0, #4
	cmp	r0, #1
	bls	.L1676
.L1634:
	ldr	r3, [r8, #708]
	add	r9, r9, #1
	add	r3, r3, #2
	cmp	r3, r9
	bls	.L1677
.L1637:
	ldr	r1, .L1681+4
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r7, r0
	str	r0, [r10, #4]!
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	bcc	.L1627
	cmp	r3, #0
	bne	.L1627
	cmp	r0, #3
	beq	.L1630
	cmp	r0, #1
	bhi	.L1631
	ldr	r1, .L1681+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r6, r0
	str	r0, [r10, #264]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	bls	.L1633
	cmp	r3, #0
	beq	.L1634
.L1633:
	str	r3, [sp]
	movw	r1, #6929
	mov	r3, r0
	ldr	r2, .L1681+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1672
.L1630:
	ldrb	r3, [r8, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1673
	ldr	r1, .L1681+16
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #3693]
	cmp	r0, #0
	beq	.L1673
	ldr	r3, [r8, #712]
	cmn	r3, #2
	beq	.L1673
	movw	r9, #40688
	mov	r5, #0
	movt	r9, 169
	add	r9, r4, r9
	b	.L1653
.L1652:
	add	r5, r5, #1
	cmp	r5, r3
	bcs	.L1673
.L1653:
	ldr	r1, .L1681+20
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r7, r0
	str	r0, [r9, #4]!
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	bcc	.L1644
	cmp	r2, #0
	bne	.L1644
	cmp	r0, #3
	beq	.L1640
	cmp	r0, #1
	bls	.L1678
	cmp	r0, #2
	beq	.L1679
	sub	r0, r0, #4
	cmp	r0, #1
	bls	.L1680
	ldr	r3, [r8, #712]
	add	r3, r3, #2
	cmp	r3, r5
	bne	.L1652
.L1654:
	ldr	r2, .L1681+24
	movw	r1, #6997
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1678:
	ldr	r1, .L1681+28
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r6, r0
	str	r0, [r9, #264]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	bls	.L1648
	cmp	r3, #0
	bne	.L1648
.L1649:
	ldr	r3, [r8, #712]
	add	r3, r3, #2
	cmp	r3, r5
	bne	.L1652
	ldr	r2, [r9]
	cmp	r2, #3
	beq	.L1652
	b	.L1654
.L1675:
	ldr	r1, .L1681+32
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r10, #528]
	b	.L1634
.L1679:
	ldr	r1, .L1681+36
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #524]
	b	.L1649
.L1676:
	ldr	r1, .L1681+40
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r10, #784]
	b	.L1634
.L1680:
	ldr	r1, .L1681+44
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #784]
	b	.L1649
.L1627:
	str	r3, [sp]
	movw	r1, #6913
	mov	r3, r0
	ldr	r2, .L1681+48
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1672
.L1644:
	str	r2, [sp]
	mov	r3, r0
	ldr	r2, .L1681+52
	movw	r1, #6965
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1672
.L1677:
	cmp	r9, r3
	bne	.L1630
.L1625:
	movw	r2, #26522
	movt	r2, 42
	add	r2, r3, r2
	add	r2, r4, r2, lsl #2
	ldr	r3, [r2, #8]
	cmp	r3, #3
	beq	.L1630
	ldr	r2, .L1681+56
	movw	r1, #6946
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1672
.L1648:
	str	r3, [sp]
	movw	r1, #6981
	mov	r3, r0
	ldr	r2, .L1681+60
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1672
.L1656:
	mov	r3, #0
	b	.L1625
.L1682:
	.align	2
.L1681:
	.word	.LC44
	.word	.LC45
	.word	.LC47
	.word	.LC48
	.word	.LC52
	.word	.LC53
	.word	.LC59
	.word	.LC55
	.word	.LC49
	.word	.LC57
	.word	.LC50
	.word	.LC58
	.word	.LC46
	.word	.LC54
	.word	.LC51
	.word	.LC56
	UNWIND(.fnend)
	.size	mvc_ref_pic_list_reordering, .-mvc_ref_pic_list_reordering
	.align	2
	.global	mvc_pred_weight_table
	.type	mvc_pred_weight_table, %function
mvc_pred_weight_table:
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
	ldr	r3, [r0, #244]
	ldr	r1, .L1713
	add	r6, r0, #11075584
	ldr	r7, [r0, #240]
	mov	r5, r0
	str	r3, [fp, #-48]
	bl	mvc_ue_v
	add	r6, r6, #40960
	mov	r4, #1
	str	r0, [r6, #716]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #748]
	cmp	r9, #0
	bne	.L1707
.L1684:
	cmp	r0, #7
	bhi	.L1687
	ldr	r3, [r6, #720]
	cmp	r3, #7
	bhi	.L1687
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	movweq	r10, #41812
	moveq	r4, r3
	movteq	r10, 169
	addeq	r10, r5, r10
	beq	.L1695
	b	.L1686
.L1691:
	ldr	r3, [r7, #748]
	cmp	r3, #0
	bne	.L1708
.L1692:
	str	r3, [r10]
	str	r3, [r10, #768]
	str	r3, [r10, #128]
	str	r3, [r10, #896]
.L1694:
	ldr	r3, [r6, #708]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r3, r4
	bcc	.L1709
.L1695:
	ldr	r1, .L1713+4
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1691
	ldr	r1, .L1713+8
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r10, #640]
	ldr	r3, [r7, #748]
	cmp	r3, #0
	beq	.L1692
.L1708:
	ldr	r1, .L1713+16
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1710
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1694
.L1709:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1696
.L1697:
	ldrb	r0, [r5, #10]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1689:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1710:
	ldr	r1, .L1713+20
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+24
	str	r0, [r10]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r10, #896]
	b	.L1694
.L1707:
	ldr	r1, .L1713+28
	mov	r0, r5
	bl	mvc_ue_v
	mov	r3, r0
	ldr	r0, [r6, #716]
	mov	r9, r4, asl r3
	str	r3, [r6, #720]
	b	.L1684
.L1696:
	ldrb	r3, [r6, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1697
	movw	r4, #42196
	mov	r10, #0
	movt	r4, 169
	add	r4, r5, r4
	b	.L1703
.L1699:
	ldr	r3, [r7, #748]
	cmp	r3, #0
	bne	.L1711
.L1700:
	str	r3, [r4]
	str	r3, [r4, #768]
	str	r3, [r4, #128]
	str	r3, [r4, #896]
.L1702:
	ldr	r3, [r6, #712]
	add	r10, r10, #1
	add	r4, r4, #4
	cmp	r3, r10
	bcc	.L1697
.L1703:
	ldr	r1, .L1713+32
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	streq	r8, [r4, #-128]
	streq	r0, [r4, #640]
	beq	.L1699
	ldr	r1, .L1713+36
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+40
	str	r0, [r4, #-128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r4, #640]
	ldr	r3, [r7, #748]
	cmp	r3, #0
	beq	.L1700
.L1711:
	ldr	r1, .L1713+44
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1712
	str	r9, [r4]
	str	r0, [r4, #768]
	str	r9, [r4, #128]
	str	r0, [r4, #896]
	b	.L1702
.L1687:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
.L1686:
	ldr	r2, .L1713+48
	movw	r1, #7030
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1689
.L1712:
	ldr	r1, .L1713+52
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+56
	str	r0, [r4]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+52
	str	r0, [r4, #768]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1713+56
	str	r0, [r4, #128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r4, #896]
	b	.L1702
.L1714:
	.align	2
.L1713:
	.word	.LC60
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC61
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC62
	.word	.LC73
	.word	.LC74
	UNWIND(.fnend)
	.size	mvc_pred_weight_table, .-mvc_pred_weight_table
	.align	2
	.global	MVC_DecMMCO
	.type	MVC_DecMMCO, %function
MVC_DecMMCO:
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
	cmp	r1, #0
	mov	r4, r0
	moveq	r7, #100
	beq	.L1727
	mov	r9, #0
	b	.L1718
.L1750:
	ldr	r1, .L1757
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r5, #2
	beq	.L1748
.L1729:
	cmp	r5, #6
	orreq	r6, r6, #1
	cmp	r6, #0
	bne	.L1732
	cmp	r5, #4
	beq	.L1749
.L1733:
	cmp	r5, #6
	bhi	.L1734
.L1730:
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1734
	cmp	r5, #0
	beq	.L1736
.L1735:
	subs	r7, r7, #1
	beq	.L1737
.L1727:
	ldr	r1, .L1757+4
	mov	r0, r4
	bl	mvc_ue_v
	bic	r3, r0, #2
	sub	r6, r0, #3
	clz	r6, r6
	cmp	r3, #1
	mov	r5, r0
	mov	r6, r6, lsr #5
	beq	.L1750
	cmp	r5, #2
	bne	.L1729
.L1748:
	ldr	r1, .L1757+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r6, #0
	beq	.L1730
.L1732:
	ldr	r1, .L1757+12
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r5, #4
	bne	.L1733
.L1749:
	ldr	r1, .L1757+16
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1735
.L1734:
	ldr	r2, .L1757+20
	movw	r1, #7220
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1755:
	ldr	r1, .L1757
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r8, #4]
	cmp	r3, #2
	str	r0, [r8, #8]
	beq	.L1751
.L1721:
	cmp	r3, #3
	cmpne	r3, #6
	beq	.L1752
.L1722:
	cmp	r3, #4
	beq	.L1753
.L1723:
	cmp	r3, #6
	bhi	.L1724
.L1756:
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1724
	cmp	r3, #0
	add	r9, r9, #1
	beq	.L1736
	cmp	r9, #100
	beq	.L1754
.L1718:
	ldr	r1, .L1757+4
	mov	r0, r4
	ldrb	r5, [r4, #3]	@ zero_extendqisi2
	bl	mvc_ue_v
	mov	r6, r9, asl #2
	mov	r7, r9, asl #4
	add	r1, r6, r7
	movw	r2, #2004
	movw	r8, #43312
	mla	r2, r2, r5, r1
	movt	r8, 169
	add	r2, r4, r2
	add	r8, r2, r8
	mov	r3, r0
	bic	r0, r0, #2
	cmp	r0, #1
	str	r3, [r8, #4]
	beq	.L1755
	cmp	r3, #2
	bne	.L1721
.L1751:
	ldr	r1, .L1757+8
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r6, r7
	movw	r2, #2004
	movw	r1, #43320
	mla	r3, r2, r5, r3
	movw	r2, #43312
	movt	r1, 169
	movt	r2, 169
	add	r3, r4, r3
	add	r1, r3, r1
	add	r2, r3, r2
	str	r0, [r1, #4]
	ldr	r3, [r2, #4]
	cmp	r3, #3
	cmpne	r3, #6
	bne	.L1722
.L1752:
	ldr	r1, .L1757+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r6, r7
	movw	r2, #2004
	movw	r1, #43320
	mla	r3, r2, r5, r3
	movw	r2, #43312
	movt	r1, 169
	movt	r2, 169
	add	r3, r4, r3
	add	r1, r3, r1
	add	r2, r3, r2
	str	r0, [r1, #8]
	ldr	r3, [r2, #4]
	cmp	r3, #4
	bne	.L1723
.L1753:
	ldr	r1, .L1757+16
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, r7
	movw	r7, #2004
	movw	r2, #43328
	mla	r5, r7, r5, r6
	movw	r3, #43312
	movt	r2, 169
	movt	r3, 169
	add	r5, r4, r5
	add	r2, r5, r2
	add	r3, r5, r3
	str	r0, [r2, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #6
	bls	.L1756
.L1724:
	ldr	r2, .L1757+20
	movw	r1, #7173
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1736:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1754:
	ldr	r2, .L1757+24
	movw	r1, #7137
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1737:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1758:
	.align	2
.L1757:
	.word	.LC77
	.word	.LC76
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC75
	UNWIND(.fnend)
	.size	MVC_DecMMCO, .-MVC_DecMMCO
	.align	2
	.global	mvc_dec_ref_pic_marking
	.type	mvc_dec_ref_pic_marking, %function
mvc_dec_ref_pic_marking:
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
	add	r3, r0, #11075584
	add	r3, r3, #40960
	mov	r4, r0
	ldrb	r6, [r0, #3]	@ zero_extendqisi2
	ldrb	r8, [r3, #653]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L1760
	clz	r2, r6
	mov	r2, r2, lsr #5
	strb	r2, [r0, #3]
	mov	r5, r2
.L1769:
	ldrb	r3, [r3, #651]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1780
	ldr	r1, .L1784
	mov	r0, r4
	bl	mvc_u_1
	movw	r2, #2004
	mla	r2, r2, r5, r4
	movw	r5, #43312
	movt	r5, 169
	add	r5, r2, r5
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	bne	.L1763
.L1767:
	mov	r7, #0
.L1777:
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1760:
	movw	r2, #2004
	movw	r1, #43312
	mla	r2, r2, r6, r0
	movt	r1, 169
	movw	r7, #43312
	mov	r5, r6
	movt	r7, 169
	add	r7, r2, r7
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1769
	ldrb	r3, [r3, #651]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1781
	ldr	r1, .L1784
	ldrb	r5, [r7, #3]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r5, r0
	bne	.L1782
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1767
	mov	r1, r8
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_DecMMCO
.L1763:
	mov	r1, #1
	mov	r0, r4
	bl	MVC_DecMMCO
	cmn	r0, #1
	mov	r7, r0
	movne	r3, #1
	movne	r7, #0
	strneb	r3, [r5]
	bne	.L1777
	mov	r3, #0
	ldr	r2, .L1784+4
	strb	r3, [r5]
	movw	r1, #7261
	strb	r6, [r4, #3]
	mov	r0, #1
	bl	dprint_normal
	b	.L1777
.L1781:
	ldr	r1, .L1784+8
	ldrb	r5, [r7, #1]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r5, r0
	bne	.L1783
	mov	r0, r4
	ldr	r1, .L1784+12
	ldrb	r4, [r7, #2]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r4, r0
	beq	.L1767
	ldr	r2, .L1784+16
	movw	r1, #7283
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_normal
	b	.L1777
.L1780:
	ldr	r1, .L1784+8
	mov	r0, r4
	bl	mvc_u_1
	movw	r2, #2004
	mla	r2, r2, r5, r4
	movw	r6, #43312
	movt	r6, 169
	ldr	r1, .L1784+12
	mov	r7, #0
	add	r6, r2, r6
	strb	r0, [r6, #1]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r6, #2]
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1782:
	ldr	r2, .L1784+20
	movw	r1, #7292
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_normal
	ldr	lr, [r4, #68]
	ldr	ip, [r4, #100]
	movw	r1, #7294
	ldr	r3, [r4, #88]
	mov	r0, #1
	ldr	r2, .L1784+24
	stmia	sp, {ip, lr}
	bl	dprint_normal
	b	.L1777
.L1783:
	ldr	r2, .L1784+28
	movw	r1, #7276
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_normal
	b	.L1777
.L1785:
	.align	2
.L1784:
	.word	.LC84
	.word	.LC85
	.word	.LC82
	.word	.LC83
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC86
	UNWIND(.fnend)
	.size	mvc_dec_ref_pic_marking, .-mvc_dec_ref_pic_marking
	.align	2
	.global	MVC_ProcessSliceHeaderFirstPart
	.type	MVC_ProcessSliceHeaderFirstPart, %function
MVC_ProcessSliceHeaderFirstPart:
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
	ldr	r1, .L1851
	mov	r4, r0
	bl	mvc_ue_v
	ldr	r2, [r4, #40]
	sub	r2, r2, #1
	cmp	r0, r2
	mov	r6, r0
	bhi	.L1787
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1787
	mov	r1, r0
	mov	r0, r4
	bl	MVC_PPSSPSCheckTmpId
	cmp	r0, #0
	bne	.L1842
	add	r7, r4, #11075584
	mov	r0, r4
	add	r5, r7, #40960
	str	r6, [r5, #664]
	bl	MVC_PPSSPSCheck
	subs	r8, r0, #0
	bne	.L1843
	ldr	r6, [r4, #240]
	mov	r0, r4
	ldr	r2, .L1851+4
	ldr	r9, [r4, #244]
	ldr	r1, [r6, #2896]
	add	r1, r1, #4
	bl	mvc_u_v
	str	r0, [r5, #676]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1840
	adds	r0, r0, #0
	ldrb	r3, [r5, #651]	@ zero_extendqisi2
	movne	r0, #1
	cmp	r3, #5
	movne	r0, #0
	cmp	r0, #0
	bne	.L1844
.L1793:
	mov	r3, #0
	strb	r3, [r5, #649]
	strb	r3, [r5, #650]
	ldrb	r3, [r6, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1845
	ldr	r2, [r6, #3948]
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1816:
	ldrb	r2, [r6, #21]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1799
	strb	r2, [r5, #652]
.L1801:
	ldr	r2, [r5, #704]
	cmp	r2, r3
	bcs	.L1846
.L1802:
	ldrb	r3, [r5, #651]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1847
.L1804:
	add	r10, r7, #36864
	mov	r3, #0
	str	r3, [r10, #3612]
	str	r3, [r10, #3616]
	ldr	r3, [r6, #2900]
	cmp	r3, #0
	beq	.L1848
.L1808:
	mov	r3, #0
	str	r3, [r10, #3648]
	str	r3, [r10, #3652]
	ldr	r3, [r6, #2900]
	cmp	r3, #1
	beq	.L1849
.L1811:
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1840
	ldrb	r3, [r9, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1814
	ldr	r1, .L1851+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L1815
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1814
.L1815:
	ldr	r2, .L1851+12
	movw	r1, #7443
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L1851+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L1840
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #21
	blx	r5
.L1840:
	mvn	r8, #0
.L1826:
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1845:
	ldr	r1, .L1851+20
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #649]
	cmp	r0, #0
	bne	.L1850
	ldr	r2, [r6, #3948]
	ldrb	ip, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1818
	mov	r3, r3, asl #1
	b	.L1816
.L1799:
	mov	r2, #1
	strb	r2, [r5, #652]
.L1819:
	ldr	r2, [r5, #704]
	cmp	r2, r3, lsr #1
	bcc	.L1802
	ldr	r2, .L1851+24
	movw	r1, #7382
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1826
.L1850:
	ldr	r1, .L1851+28
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #650]
	ldr	r2, [r6, #3948]
	ldrb	r0, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	cmp	r0, #0
	ldrb	r0, [r5, #649]	@ zero_extendqisi2
	mla	r3, r1, r3, r3
	moveq	r2, #2
	beq	.L1797
.L1818:
	mov	r2, #1
.L1797:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1816
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r5, #652]
	bne	.L1801
	b	.L1819
.L1814:
	mov	r0, r4
	add	r7, r7, #40960
	bl	MVC_IsNewPic
	uxtb	r0, r0
	strb	r0, [r7, #653]
	cmp	r0, #0
	bne	.L1826
	ldr	r2, [r7, #704]
	ldr	r3, [r7, #2344]
	cmp	r2, r3
	bhi	.L1826
	ldr	r2, .L1851+32
	movw	r1, #7454
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1826
.L1848:
	ldr	r1, [r6, #2904]
	mov	r0, r4
	ldr	r2, .L1851+36
	add	r1, r1, #4
	bl	mvc_u_v
	str	r0, [r10, #3612]
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1808
	ldrb	r3, [r5, #649]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1808
	ldr	r1, .L1851+40
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r10, #3616]
	b	.L1808
.L1849:
	ldrb	r3, [r6, #18]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1811
	ldr	r1, .L1851+44
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r10, #3648]
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1811
	ldrb	r3, [r5, #649]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1811
	ldr	r1, .L1851+48
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r10, #3652]
	b	.L1811
.L1787:
	mov	r3, r6
	ldr	r2, .L1851+52
	movw	r1, #7323
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1847:
	ldr	r1, .L1851+56
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #65536
	str	r0, [r5, #692]
	bcs	.L1805
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1804
.L1805:
	ldr	r2, .L1851+60
	movw	r1, #7403
	mov	r0, #1
	bl	dprint_normal
	b	.L1804
.L1842:
	ldr	r2, .L1851+64
	movw	r1, #7329
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1826
.L1843:
	ldr	r2, .L1851+68
	movw	r1, #7337
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1826
.L1844:
	ldr	r3, [r5, #2288]
	cmp	r3, #0
	bgt	.L1793
	ldr	r2, .L1851+72
	movw	r1, #7352
	mov	r0, #1
	bl	dprint_normal
	b	.L1793
.L1846:
	ldr	r2, .L1851+76
	movw	r1, #7391
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1826
.L1852:
	.align	2
.L1851:
	.word	.LC90
	.word	.LC94
	.word	.LC106
	.word	.LC107
	.word	g_EventReportFunc
	.word	.LC96
	.word	.LC98
	.word	.LC97
	.word	.LC108
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC91
	.word	.LC100
	.word	.LC101
	.word	.LC92
	.word	.LC93
	.word	.LC95
	.word	.LC99
	UNWIND(.fnend)
	.size	MVC_ProcessSliceHeaderFirstPart, .-MVC_ProcessSliceHeaderFirstPart
	.align	2
	.global	MVC_ProcessSliceHeaderSecondPart
	.type	MVC_ProcessSliceHeaderSecondPart, %function
MVC_ProcessSliceHeaderSecondPart:
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
	add	r4, r0, #11075584
	ldr	r2, [r0, #40]
	add	r4, r4, #40960
	mov	r5, r0
	sub	r2, r2, #1
	ldr	r6, [r0, #244]
	ldr	r3, [r4, #664]
	cmp	r2, r3
	bcc	.L1854
	ldrb	r7, [r0, #10]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L1854
	bl	MVC_PPSSPSCheck
	cmp	r0, #0
	bne	.L1936
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1937
.L1858:
	ldr	r2, [r6, #36]
	cmp	r3, #1
	str	r2, [r4, #708]
	ldr	r2, [r6, #40]
	str	r2, [r4, #712]
	bls	.L1938
	cmp	r3, #2
	beq	.L1885
.L1869:
	mov	r3, #32
	str	r3, [r4, #712]
.L1870:
	mov	r0, r5
	bl	mvc_ref_pic_list_reordering
	subs	r8, r0, #0
	bne	.L1939
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1872
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #1
	moveq	r3, r7
	beq	.L1873
.L1872:
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L1940
.L1889:
	mov	r3, #0
.L1873:
	ldr	r2, .L1946
	movw	r1, #7547
	strb	r7, [r4, #655]
	mov	r0, #17
	bl	dprint_normal
	ldrb	r2, [r4, #655]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #716]
	cmp	r2, r3
	str	r3, [r4, #720]
	bne	.L1941
.L1874:
	ldrb	r3, [r4, #656]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1942
.L1875:
	mov	r3, #0
	str	r3, [r4, #2260]
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1876
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1943
.L1876:
	ldr	r1, .L1946+4
	mov	r0, r5
	bl	mvc_se_v
	mov	r3, #0
	str	r3, [r4, #2268]
	str	r3, [r4, #2272]
	str	r3, [r4, #2276]
	str	r0, [r4, #2264]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1944
.L1905:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1885:
	mov	r3, #32
	str	r3, [r4, #708]
	b	.L1869
.L1944:
	ldr	r1, .L1946+8
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r4, #2268]
	bhi	.L1879
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1879
	cmp	r0, #1
	beq	.L1905
	ldr	r1, .L1946+12
	mov	r0, r5
	bl	mvc_se_v
	add	r3, r0, #6
	str	r0, [r4, #2272]
	cmp	r3, #12
	bhi	.L1882
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1882
	ldr	r1, .L1946+16
	mov	r0, r5
	bl	mvc_se_v
	add	r3, r0, #6
	str	r0, [r4, #2276]
	cmp	r3, #12
	bhi	.L1884
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1905
.L1884:
	ldr	r2, .L1946+20
	movw	r1, #7618
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1941:
	mov	r0, r5
	bl	mvc_pred_weight_table
	cmp	r0, #0
	beq	.L1874
	ldr	r2, .L1946+24
	movw	r1, #7555
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1942:
	mov	r0, r5
	bl	mvc_dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1875
	ldr	r2, .L1946+28
	movw	r1, #7565
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1940:
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r7, r3
	bne	.L1889
	b	.L1873
.L1937:
	ldr	r1, .L1946+32
	mov	r0, r5
	bl	mvc_u_1
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	strb	r0, [r4, #654]
	b	.L1858
.L1938:
	ldr	r1, .L1946+36
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1860
	ldr	r3, [r4, #708]
.L1861:
	ldrb	r2, [r4, #649]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1862
	cmp	r3, #15
	bhi	.L1863
	ldr	r3, [r4, #712]
	cmp	r3, #15
	bhi	.L1945
.L1864:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1863
.L1865:
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1885
	cmp	r3, #1
	bne	.L1869
	b	.L1870
.L1854:
	ldr	r2, .L1946+40
	movw	r1, #7468
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1943:
	ldr	r1, .L1946+44
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r4, #2260]
	bhi	.L1877
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1876
.L1877:
	ldr	r2, .L1946+48
	movw	r1, #7579
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1862:
	cmp	r3, #31
	bhi	.L1866
	ldr	r3, [r4, #712]
	cmp	r3, #31
	bls	.L1867
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1867
.L1866:
	ldr	r2, .L1946+52
	movw	r1, #7520
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1867:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1865
	b	.L1866
.L1945:
	ldrb	r3, [r4, #648]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1864
.L1863:
	ldr	r2, .L1946+56
	movw	r1, #7509
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1860:
	ldr	r1, .L1946+60
	mov	r0, r5
	bl	mvc_ue_v
	ldrb	r2, [r4, #648]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #708]
	bne	.L1861
	ldr	r1, .L1946+64
	mov	r0, r5
	bl	mvc_ue_v
	ldr	r3, [r4, #708]
	str	r0, [r4, #712]
	b	.L1861
.L1882:
	ldr	r2, .L1946+68
	movw	r1, #7609
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1879:
	ldr	r2, .L1946+72
	movw	r1, #7598
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1936:
	ldr	r2, .L1946+76
	movw	r1, #7474
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1939:
	ldr	r2, .L1946+80
	movw	r1, #7540
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1905
.L1947:
	.align	2
.L1946:
	.word	.LC116
	.word	.LC121
	.word	.LC122
	.word	.LC124
	.word	.LC126
	.word	.LC127
	.word	.LC117
	.word	.LC118
	.word	.LC109
	.word	.LC110
	.word	.LC91
	.word	.LC119
	.word	.LC120
	.word	.LC114
	.word	.LC113
	.word	.LC111
	.word	.LC112
	.word	.LC125
	.word	.LC123
	.word	.LC92
	.word	.LC115
	UNWIND(.fnend)
	.size	MVC_ProcessSliceHeaderSecondPart, .-MVC_ProcessSliceHeaderSecondPart
	.align	2
	.global	MVC_ExitSlice
	.type	MVC_ExitSlice, %function
MVC_ExitSlice:
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
	add	r2, r0, #11075584
	ldr	ip, [r0, #236]
	add	r3, r2, #40960
	ldrb	r1, [r3, #649]	@ zero_extendqisi2
	ldr	lr, [r3, #664]
	cmp	r1, #0
	ldr	r5, [r3, #704]
	str	lr, [r3, #2316]
	ldr	r4, [ip, #744]
	strb	r1, [r3, #2304]
	ldrneb	r1, [r3, #650]	@ zero_extendqisi2
	ldr	lr, [r3, #676]
	str	r5, [r3, #2344]
	strneb	r1, [r3, #2305]
	ldrb	r1, [r3, #651]	@ zero_extendqisi2
	str	lr, [r3, #2320]
	cmp	r1, #5
	ldrb	lr, [r3, #656]	@ zero_extendqisi2
	strb	r1, [r3, #2306]
	ldreq	r1, [r3, #692]
	str	r4, [r3, #2312]
	strb	lr, [r3, #2307]
	streq	r1, [r3, #2324]
	ldr	r1, [ip, #2900]
	cmp	r1, #0
	bne	.L1951
	add	r1, r2, #36864
	ldr	lr, [r1, #3612]
	str	lr, [r3, #2328]
	ldr	r1, [r1, #3616]
	str	r1, [r3, #2332]
	ldr	r1, [ip, #2900]
.L1951:
	cmp	r1, #1
	addeq	r2, r2, #36864
	ldreq	r1, [r2, #3648]
	streq	r1, [r3, #2336]
	ldreq	r2, [r2, #3652]
	streq	r2, [r3, #2340]
	ldrb	r2, [r3, #659]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1953
	ldr	ip, [r3, #2288]
	ldrb	r1, [r3, #657]	@ zero_extendqisi2
	ldrb	r2, [r3, #658]	@ zero_extendqisi2
	str	ip, [r3, #2348]
	strb	r1, [r3, #2308]
	strb	r2, [r3, #2309]
.L1953:
	ldr	r3, [r0, #80]
	add	r3, r3, #1
	str	r3, [r0, #80]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ExitSlice, .-MVC_ExitSlice
	.align	2
	.global	MVC_PicTypeStatistic
	.type	MVC_PicTypeStatistic, %function
MVC_PicTypeStatistic:
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
	add	r3, r0, #11075584
	add	r3, r3, #40960
	ldrb	r2, [r3, #648]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1959
	bcc	.L1960
	cmp	r2, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r3, #651]	@ zero_extendqisi2
	add	r0, r0, #11141120
	cmp	r3, #5
	beq	.L1969
.L1962:
	add	r0, r0, #8192
	mov	r3, #0
	strb	r3, [r0, #3013]
	ldmfd	sp, {fp, sp, pc}
.L1960:
	add	r0, r0, #11141120
	add	r3, r0, #8192
	ldrb	r2, [r3, #3012]	@ zero_extendqisi2
	cmp	r2, #2
	movne	r2, #1
	strneb	r2, [r3, #3012]
	b	.L1962
.L1959:
	add	r0, r0, #11141120
	mov	r2, #2
	add	r0, r0, #8192
	mov	r3, #0
	strb	r2, [r0, #3012]
	strb	r3, [r0, #3013]
	ldmfd	sp, {fp, sp, pc}
.L1969:
	add	r0, r0, #8192
	mov	r3, #1
	strb	r3, [r0, #3013]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_PicTypeStatistic, .-MVC_PicTypeStatistic
	.align	2
	.global	MVC_CalcStreamBits
	.type	MVC_CalcStreamBits, %function
MVC_CalcStreamBits:
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
	add	r3, r0, #11075584
	add	r3, r3, #36864
	mov	r4, r0
	ldrb	r3, [r3, #1368]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1971
	ldr	r2, [r0, #232]
	ldr	r3, [r2, #64]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #64]
	ldr	r2, [r0, #232]
	ldr	r3, [r2, #72]
	sub	r3, r3, #1
	str	r3, [r2, #72]
.L1971:
	ldr	r0, [r4, #232]
	ldrb	r6, [r0]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L1982
	mov	r3, #0
	mov	r2, r0
	mov	r5, r3
.L1973:
	add	r3, r3, #1
	ldr	r1, [r2, #12]
	cmp	r3, r6
	add	r2, r2, #28
	add	r5, r5, r1
	bne	.L1973
.L1972:
	mov	r7, r6, asl #5
	ldr	r1, [r0, #72]
	sub	r7, r7, r6, asl #2
	ldr	r3, [r0, #64]
	add	r0, r0, r7
	ldr	r2, .L1993
	str	r1, [sp, #8]
	movw	r1, #7742
	ldr	ip, [r0, #12]
	mov	r0, #8
	str	r5, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	ldr	ip, [r4, #232]
	mov	r3, r6
	ldr	r2, .L1993+4
	movw	r1, #7751
	mov	r0, #8
	ldrb	r6, [ip]	@ zero_extendqisi2
	mov	lr, r6, asl #5
	sub	r6, lr, r6, asl #2
	ldr	lr, [ip, #64]
	add	ip, ip, r6
	and	lr, lr, #7
	str	lr, [ip, #24]
	ldr	ip, [r4, #232]
	ldrb	r6, [ip]	@ zero_extendqisi2
	ldr	r8, [ip, #64]
	mov	lr, r6, asl #5
	sub	r6, lr, r6, asl #2
	add	ip, ip, r6
	ldr	lr, [ip, #16]
	add	lr, lr, r8, lsr #3
	rsb	lr, r5, lr
	str	lr, [ip, #28]
	ldr	ip, [r4, #232]
	ldrb	r6, [ip]	@ zero_extendqisi2
	mov	lr, r6, asl #5
	sub	r6, lr, r6, asl #2
	ldr	lr, [ip, #64]
	add	ip, ip, r6
	ldr	r6, [ip, #12]
	add	r5, r5, r6
	rsb	r5, lr, r5, lsl #3
	str	r5, [ip, #20]
	ldr	lr, [r4, #232]
	ldrb	r5, [lr]	@ zero_extendqisi2
	mov	ip, r5, asl #5
	sub	ip, ip, r5, asl #2
	add	ip, lr, ip
	ldr	lr, [ip, #28]
	ldr	r5, [ip, #24]
	and	lr, lr, #3
	add	lr, r5, lr, lsl #3
	str	lr, [ip, #24]
	ldr	lr, [r4, #232]
	ldrb	r5, [lr]	@ zero_extendqisi2
	mov	ip, r5, asl #5
	sub	ip, ip, r5, asl #2
	add	ip, lr, ip
	ldr	lr, [ip, #28]
	bic	lr, lr, #3
	str	lr, [ip, #28]
	ldr	ip, [r4, #232]
	add	r7, ip, r7
	ldrb	r5, [ip]	@ zero_extendqisi2
	mov	lr, r5, asl #5
	sub	lr, lr, r5, asl #2
	add	ip, ip, lr
	ldr	ip, [ip, #28]
	str	ip, [sp, #8]
	ldr	ip, [r7, #20]
	str	ip, [sp, #4]
	ldr	ip, [r7, #24]
	str	ip, [sp]
	bl	dprint_normal
	ldr	lr, [r4, #232]
	ldr	r3, [lr, #68]
	sub	r2, r3, #1
	cmp	r2, #1
	bhi	.L1992
	ldrb	r5, [lr]	@ zero_extendqisi2
	add	r1, r5, #1
	cmp	r3, r1
	movhi	r3, #1
	movls	r3, #0
	cmp	r1, #1
	movhi	r3, #0
	cmp	r3, #0
	beq	.L1975
	add	r5, r5, #2
	mov	r6, #0
.L1976:
	sub	ip, r5, #1
	ldr	r2, .L1993+8
	movw	r1, #7769
	mov	r0, #8
	mov	r7, ip, asl #5
	mov	r3, ip
	sub	ip, r7, ip, asl #2
	add	lr, lr, ip
	str	r6, [lr, #24]
	ldr	lr, [r4, #232]
	add	lr, lr, ip
	ldr	r7, [lr, #16]
	str	r7, [lr, #28]
	ldr	lr, [r4, #232]
	add	lr, lr, ip
	ldr	r7, [lr, #12]
	mov	r7, r7, asl #3
	str	r7, [lr, #20]
	ldr	lr, [r4, #232]
	add	lr, lr, ip
	ldr	r7, [lr, #28]
	ldr	r8, [lr, #24]
	and	r7, r7, #3
	add	r7, r8, r7, lsl #3
	str	r7, [lr, #24]
	ldr	lr, [r4, #232]
	add	lr, lr, ip
	ldr	r7, [lr, #28]
	bic	r7, r7, #3
	str	r7, [lr, #28]
	ldr	lr, [r4, #232]
	add	ip, lr, ip
	ldr	lr, [ip, #20]
	str	lr, [sp, #4]
	ldr	ip, [ip, #24]
	str	ip, [sp]
	bl	dprint_normal
	ldr	lr, [r4, #232]
	ldr	r3, [lr, #68]
	cmp	r5, #1
	cmpls	r5, r3
	add	r5, r5, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L1976
	sub	r2, r3, #1
.L1975:
	mov	r1, r2, asl #5
	ldr	r0, [lr, #72]
	sub	r2, r1, r2, asl #2
	add	lr, lr, r2
	ldr	r3, [lr, #20]
	rsb	r3, r0, r3
	str	r3, [lr, #20]
	ldr	lr, [r4, #232]
	ldrb	r1, [lr]	@ zero_extendqisi2
	ldr	ip, [lr, #68]
	cmp	r1, ip
	bcs	.L1970
	sxth	r3, r1
	add	r4, r4, #11141120
	add	r4, r4, #8192
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L1980:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	ldr	r0, [r4, #3624]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #3624]
	ldrcc	ip, [lr, #68]
	cmp	ip, r1
	bhi	.L1980
.L1970:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1992:
	ldr	r2, .L1993+12
	movw	r1, #7756
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_normal
.L1982:
	mov	r5, r6
	b	.L1972
.L1994:
	.align	2
.L1993:
	.word	.LC128
	.word	.LC129
	.word	.LC131
	.word	.LC130
	UNWIND(.fnend)
	.size	MVC_CalcStreamBits, .-MVC_CalcStreamBits
	.align	2
	.global	MVC_Scaling_List
	.type	MVC_Scaling_List, %function
MVC_Scaling_List:
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
	ble	.L1995
	mov	r0, #8
	ldr	r3, .L2004
	mov	r6, r0
	mov	r5, #0
	mov	r10, #255
	b	.L2001
.L2000:
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
	beq	.L1995
.L2001:
	cmp	r8, #16
	mov	lr, r6
	ldreq	r2, .L2004+4
	ldrneb	r4, [r5, r3]	@ zero_extendqisi2
	ldreqb	r4, [r5, r2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2000
	ldr	r1, .L2004+8
	ldr	r0, [fp, #-52]
	str	r3, [fp, #-48]
	bl	mvc_se_v
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
	b	.L2000
.L1995:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2005:
	.align	2
.L2004:
	.word	.LANCHOR0+76
	.word	.LANCHOR0+60
	.word	.LC132
	UNWIND(.fnend)
	.size	MVC_Scaling_List, .-MVC_Scaling_List
	.align	2
	.global	MVC_ProcessPPS
	.type	MVC_ProcessPPS, %function
MVC_ProcessPPS:
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
	mov	r5, r1
	ldr	r1, .L2064
	mov	r4, r0
	bl	mvc_u_1
	strb	r0, [r5]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2055
	ldr	r1, .L2064+4
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #1]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2055
	ldr	r1, .L2064+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	str	r0, [r5, #32]
	bne	.L2010
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2011
.L2010:
	ldr	r2, .L2064+12
	movw	r1, #8089
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2064+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2055
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #21
	blx	r5
	mvn	r0, #0
.L2008:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2018:
	ldr	r1, .L2064+20
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2064+24
	str	r0, [r5, #60]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #18]
	cmp	r0, #1
	beq	.L2019
.L2037:
	ldr	r1, .L2064+28
	mov	r0, r4
	bl	mvc_se_v
	add	r3, r0, #12
	str	r0, [r5, #56]
	cmp	r3, #24
	bhi	.L2020
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2038
.L2020:
	ldr	r2, .L2064+32
	movw	r1, #8226
	mov	r0, #1
	bl	dprint_normal
.L2055:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2011:
	ldr	r1, .L2064+36
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #31
	str	r0, [r5, #36]
	bhi	.L2012
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2012
	ldr	r1, .L2064+40
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #31
	str	r0, [r5, #40]
	bhi	.L2014
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2014
	ldr	r1, .L2064+44
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #2]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2055
	ldr	r2, .L2064+48
	mov	r1, #2
	mov	r0, r4
	bl	mvc_u_v
	cmp	r0, #2
	str	r0, [r5, #44]
	bhi	.L2056
	ldr	r1, .L2064+52
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2064+56
	str	r0, [r5, #48]
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2064+60
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2064+64
	str	r0, [r5, #52]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2064+68
	strb	r0, [r5, #3]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2064+72
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #17]
	cmp	r0, #0
	bne	.L2057
.L2017:
	ldr	r3, [r5, #52]
	mov	r6, #0
	add	r0, r4, #548
	str	r6, [r5, #60]
	strb	r6, [r5, #18]
	str	r3, [r5, #56]
	bl	BsResidBits
	ldr	r3, [r4, #232]
	ldr	r3, [r3, #72]
	add	r3, r3, #3
	cmp	r0, r3
	bcs	.L2018
.L2038:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2057:
	ldr	r2, .L2064+76
	movw	r1, #8134
	mov	r0, #1
	bl	dprint_normal
	b	.L2017
.L2012:
	ldr	r2, .L2064+80
	movw	r1, #8098
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2008
.L2014:
	ldr	r2, .L2064+84
	movw	r1, #8107
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2008
.L2019:
	sub	r8, fp, #72
	add	r10, r5, #4
	add	r7, r5, #2016
	add	r9, r5, #64
	b	.L2028
.L2061:
	ldr	r3, [r4, #248]
	ldr	ip, [r5, #28]
	mla	ip, lr, ip, r3
	ldrb	r3, [ip, #27]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2058
	ldr	r3, .L2064+88
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2064+92
	ldr	r3, [r3, #52]
	blx	r3
.L2023:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2059
.L2028:
	ldr	r1, .L2064+96
	mov	r0, r4
	bl	mvc_u_1
	movw	lr, #3992
	clz	r1, r6
	mov	r2, #16
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r7
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2060
	cmp	r6, #0
	cmpne	r6, #3
	mov	r1, r1, lsr #5
	beq	.L2061
	ldr	r3, .L2064+92
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2023
.L2059:
	add	r8, r5, #2112
	add	r10, r5, #448
	sub	r7, fp, #76
	add	r9, r5, #11
	mov	r6, #0
.L2036:
	ldr	r2, [r5, #60]
	mov	r3, #0
	cmp	r2, #1
	strne	r3, [r7]
	strneb	r3, [r9]
	beq	.L2062
.L2031:
	ldr	r1, [r4, #248]
	movw	ip, #3992
	ldr	r3, [r5, #28]
	mov	r0, r8
	mov	r2, #64
	mla	r3, ip, r3, r1
	ldrb	r1, [r3, #27]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L2063
	ldr	r1, .L2064+100
	cmp	r6, #0
	ldr	r3, .L2064+92
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2032:
	add	r6, r6, #1
	add	r8, r8, #64
	cmp	r6, #2
	add	r10, r10, #256
	add	r7, r7, #4
	add	r9, r9, #1
	bne	.L2036
	b	.L2037
.L2060:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2023
	ldr	r1, .L2064+88
	mov	r2, #16
	ldr	r3, .L2064+92
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2023
.L2058:
	ldr	r3, .L2064+92
	add	r1, r6, #167
	mov	r2, #16
	mov	r0, r7
	add	r1, ip, r1, lsl #4
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2023
.L2056:
	ldr	r2, .L2064+104
	movw	r1, #8119
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2008
.L2062:
	ldr	r1, .L2064+108
	mov	r0, r4
	bl	mvc_u_1
	mov	r2, r8
	mov	r1, r10
	mov	r3, #64
	mov	ip, r0
	cmp	ip, #1
	mov	r0, r4
	str	ip, [r7]
	strb	ip, [r9]
	bne	.L2031
	str	r7, [sp]
	bl	MVC_Scaling_List
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2032
	ldr	r1, .L2064+100
	mov	r2, #64
	ldr	r3, .L2064+92
	cmp	r6, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r8
	blx	r3
	b	.L2032
.L2063:
	add	r1, r3, r6, lsl #6
	ldr	r3, .L2064+92
	add	r1, r1, #2768
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2032
.L2065:
	.align	2
.L2064:
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	g_EventReportFunc
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC156
	.word	.LC137
	.word	.LC139
	.word	.LC141
	.word	.LC142
	.word	.LC144
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC149
	.word	.LC150
	.word	.LC138
	.word	.LC140
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC154
	.word	.LANCHOR1+32
	.word	.LC143
	.word	.LC155
	UNWIND(.fnend)
	.size	MVC_ProcessPPS, .-MVC_ProcessPPS
	.align	2
	.global	MVC_PPSEqual
	.type	MVC_PPSEqual, %function
MVC_PPSEqual:
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
	subs	r7, r0, #0
	beq	.L2093
	cmp	r1, #0
	beq	.L2094
	ldr	r2, [r1, #28]
	ldr	r0, [r7, #28]
	ldr	r3, [r7, #24]
	ldr	ip, [r1, #24]
	ldrb	lr, [r7]	@ zero_extendqisi2
	cmp	r0, r2
	cmpeq	r3, ip
	ldrb	r4, [r1]	@ zero_extendqisi2
	ldrb	ip, [r7, #1]	@ zero_extendqisi2
	ldrb	r5, [r1, #1]	@ zero_extendqisi2
	moveq	r2, #1
	movne	r2, #0
	ldr	r0, [r7, #36]
	cmp	lr, r4
	movne	r3, #0
	andeq	r3, r2, #1
	ldr	r4, [r1, #36]
	cmp	ip, r5
	movne	lr, #0
	andeq	lr, r3, #1
	ldr	r2, [r7, #40]
	ldr	r5, [r1, #40]
	cmp	r0, r4
	movne	ip, #0
	andeq	ip, lr, #1
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	ldrb	r4, [r1, #2]	@ zero_extendqisi2
	cmp	r2, r5
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	lr, [r7, #44]
	ldr	r5, [r1, #44]
	cmp	r3, r4
	movne	r2, #0
	andeq	r2, r0, #1
	ldr	ip, [r7, #48]
	ldr	r4, [r1, #48]
	cmp	lr, r5
	movne	r3, #0
	andeq	r3, r2, #1
	ldr	r0, [r7, #52]
	ldr	r5, [r1, #52]
	cmp	ip, r4
	movne	lr, #0
	andeq	lr, r3, #1
	ldrb	r2, [r7, #3]	@ zero_extendqisi2
	ldrb	r4, [r1, #3]	@ zero_extendqisi2
	cmp	r0, r5
	movne	ip, #0
	andeq	ip, lr, #1
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	cmp	r2, r4
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	ip, [r7, #60]
	ldr	r4, [r1, #60]
	cmp	r3, lr
	movne	r2, #0
	andeq	r2, r0, #1
	ldrb	r0, [r7, #18]	@ zero_extendqisi2
	ldrb	lr, [r1, #18]	@ zero_extendqisi2
	cmp	ip, r4
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	lr, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L2070
	mov	ip, ip, asl #1
	adds	r2, ip, #6
	str	r2, [fp, #-60]
	beq	.L2070
	sub	r2, r7, #1088
	sub	r10, r1, #1088
	add	r0, r1, #64
	sub	r2, r2, #4
	sub	r10, r10, #4
	str	r2, [fp, #-48]
	add	r9, r7, #1984
	add	r2, r7, #4
	add	r8, r1, #1984
	str	r2, [fp, #-56]
	add	r2, r1, #4
	str	r2, [fp, #-52]
	sub	r2, r7, #836
	mov	ip, r7
	mov	r6, #0
	mov	r5, r0
	str	r7, [fp, #-64]
	str	r1, [fp, #-68]
.L2075:
	ldr	r0, [fp, #-56]
	ldrb	r1, [r0, #1]!	@ zero_extendqisi2
	str	r0, [fp, #-56]
	ldr	r0, [fp, #-52]
	ldrsb	lr, [r0, #1]!
	str	r0, [fp, #-52]
	sxtb	r0, r1
	cmp	lr, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, #0
	beq	.L2092
	ldr	r1, [r9]
	ldr	r0, [r8]
	cmp	r1, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r6, #5
	bhi	.L2072
	cmp	r1, #0
	add	r7, ip, #64
	bne	.L2071
	add	r0, ip, #128
	mov	r1, r7
	mov	ip, r5
.L2073:
	ldr	r4, [r1], #4
	ldr	lr, [ip], #4
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, r0
	bne	.L2073
.L2071:
	ldr	r1, [fp, #-60]
	add	r6, r6, #1
	add	r9, r9, #4
	add	r8, r8, #4
	cmp	r6, r1
	ldr	r1, [fp, #-48]
	add	r10, r10, #256
	add	r2, r2, #256
	add	r1, r1, #256
	mov	ip, r7
	str	r1, [fp, #-48]
	add	r5, r5, #64
	bne	.L2075
	ldr	r7, [fp, #-64]
	ldr	r1, [fp, #-68]
.L2070:
	ldr	r0, [r7, #56]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L2068:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2072:
	cmp	r1, #0
	bne	.L2092
	ldr	r1, [fp, #-48]
	mov	lr, r10
.L2074:
	ldr	r4, [r1, #4]!
	ldr	r0, [lr, #4]!
	cmp	r4, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r1
	bne	.L2074
.L2092:
	add	r7, ip, #64
	b	.L2071
.L2094:
	movw	r3, #8242
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L2095
	ldr	r3, .L2095+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L2068
.L2093:
	movw	r1, #8241
	ldr	r3, .L2095+4
	str	r1, [sp]
	ldr	r2, .L2095
	bl	dprint_normal
	mvn	r0, #0
	b	.L2068
.L2096:
	.align	2
.L2095:
	.word	.LC14
	.word	.LC13
	UNWIND(.fnend)
	.size	MVC_PPSEqual, .-MVC_PPSEqual
	.align	2
	.global	MVC_DecPPS
	.type	MVC_DecPPS, %function
MVC_DecPPS:
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
	ldr	r1, .L2112
	mov	r4, r0
	bl	mvc_ue_v
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r5, r0
	bls	.L2098
	mov	r3, r0
	ldr	r2, .L2112+4
	movw	r1, #8006
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r4, #40]
	sub	r3, r2, #1
	cmp	r5, r3
	bls	.L2105
	ldr	r3, .L2112+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L2105
	str	r2, [fp, #-40]
	mov	r3, #8
	str	r5, [fp, #-44]
	sub	r2, fp, #44
	ldr	r0, [r4, #120]
	mov	r1, #29
	blx	r6
	mvn	r0, #0
.L2099:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2098:
	ldr	r1, .L2112+12
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	ip, r0
	bhi	.L2109
	mov	r8, #2240
	ldr	r3, [r4, #252]
	mul	r6, r8, r5
	add	r3, r3, r6
	ldrb	r7, [r3, #19]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L2101
	ldr	r7, .L2112+16
	mov	r0, r4
	mov	r1, r7
	str	r5, [r7, #24]
	str	ip, [r7, #28]
	bl	MVC_ProcessPPS
	subs	r5, r0, #0
	bne	.L2110
	ldr	r1, [r4, #252]
	mov	r0, r7
	add	r1, r1, r6
	bl	MVC_PPSEqual
	cmp	r0, #0
	beq	.L2099
	ldr	ip, .L2112+20
	mov	r3, #1
	ldr	r0, [r4, #252]
	mov	r2, r8
	strb	r3, [r7, #20]
	mov	r1, r7
	add	r0, r0, r6
	ldr	r4, [ip, #56]
	strb	r3, [r7, #19]
	blx	r4
	mov	r0, r5
	b	.L2099
.L2101:
	str	r5, [r3, #24]
	mov	r0, r4
	ldr	r3, [r4, #252]
	add	r3, r3, r6
	str	ip, [r3, #28]
	ldr	r1, [r4, #252]
	add	r1, r1, r6
	bl	MVC_ProcessPPS
	cmp	r0, #0
	bne	.L2111
	ldr	r3, [r4, #252]
	mov	r2, #1
	add	r3, r3, r6
	strb	r2, [r3, #20]
	ldr	r3, [r4, #252]
	add	r6, r3, r6
	strb	r2, [r6, #19]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2105:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2109:
	ldr	r2, .L2112+24
	movw	r1, #8020
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2099
.L2110:
	movw	r3, #8038
	ldr	r2, .L2112+28
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2099
.L2111:
	movw	r3, #8057
	ldr	r2, .L2112+28
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #252]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r6
	strb	r2, [r3, #20]
	ldr	r3, [r4, #252]
	add	r6, r3, r6
	strb	r7, [r6, #19]
	b	.L2099
.L2113:
	.align	2
.L2112:
	.word	.LC157
	.word	.LC158
	.word	g_EventReportFunc
	.word	.LC159
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC160
	.word	.LC161
	UNWIND(.fnend)
	.size	MVC_DecPPS, .-MVC_DecPPS
	.align	2
	.global	mvc_vui_parameters
	.type	mvc_vui_parameters, %function
mvc_vui_parameters:
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
	ldr	r1, .L2164
	mov	r4, r0
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L2158
.L2116:
	ldr	r1, .L2164+4
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L2159
.L2117:
	ldr	r1, .L2164+8
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L2160
.L2119:
	ldr	r1, .L2164+12
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L2161
.L2120:
	ldr	r1, .L2164+16
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L2162
.L2122:
	ldr	r1, .L2164+20
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L2124
	ldr	r1, .L2164+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L2164+28
	mov	r1, #4
	str	r0, [r5, #96]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+32
	mov	r1, #4
	strb	r0, [r5, #92]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [r5, #96]
	cmp	r3, #31
	strb	r0, [r5, #93]
	bhi	.L2125
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	addeq	r7, r5, #96
	addeq	r8, r5, #59
	bne	.L2125
.L2128:
	ldr	r1, .L2164+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #96]
	cmp	r3, r6
	bcs	.L2128
	ldr	r2, .L2164+48
	mov	r1, #5
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+52
	mov	r1, #5
	str	r0, [r5, #356]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+56
	mov	r1, #5
	str	r0, [r5, #360]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+60
	mov	r1, #5
	str	r0, [r5, #364]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #368]
.L2124:
	ldr	r1, .L2164+64
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L2163
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2135
.L2134:
	ldr	r1, .L2164+68
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2164+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L2136
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
.L2137:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2163:
	ldr	r1, .L2164+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L2164+28
	mov	r1, #4
	str	r0, [r5, #408]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+32
	mov	r1, #4
	strb	r0, [r5, #404]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [r5, #408]
	cmp	r3, #31
	strb	r0, [r5, #405]
	bhi	.L2130
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	addeq	r8, r5, #368
	addeq	r7, r5, #408
	addeq	r8, r8, #3
	bne	.L2130
.L2132:
	ldr	r1, .L2164+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #408]
	cmp	r3, r6
	bcs	.L2132
	ldr	r2, .L2164+48
	mov	r1, #5
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+52
	mov	r1, #5
	str	r0, [r5, #668]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+56
	mov	r1, #5
	str	r0, [r5, #672]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+60
	mov	r1, #5
	str	r0, [r5, #676]
	mov	r0, r4
	bl	mvc_u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #680]
	bne	.L2135
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2134
.L2135:
	ldr	r1, .L2164+76
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #14]
	b	.L2134
.L2162:
	ldr	r2, .L2164+80
	mov	r1, #32
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2164+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, [r5, #52]
	cmp	r1, #0
	strb	r0, [r5, #9]
	beq	.L2122
	ldr	r3, [r5, #56]
	mov	r0, #1000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	mov	r0, r0, lsr #1
	str	r0, [r4, #56]
	b	.L2122
.L2161:
	ldr	r1, .L2164+92
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+96
	str	r0, [r5, #44]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #48]
	b	.L2120
.L2160:
	ldr	r2, .L2164+100
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2164+104
	str	r0, [r5, #28]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2164+108
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L2119
	ldr	r2, .L2164+112
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+116
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+120
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #40]
	b	.L2119
.L2159:
	ldr	r1, .L2164+124
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #2]
	b	.L2117
.L2158:
	ldr	r2, .L2164+128
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L2116
	ldr	r2, .L2164+132
	mov	r1, #16
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2164+136
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #20]
	b	.L2116
.L2136:
	ldr	r1, .L2164+140
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2164+144
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+148
	str	r0, [r5, #684]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+152
	str	r0, [r5, #688]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+156
	str	r0, [r5, #696]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+160
	str	r0, [r5, #692]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2164+164
	str	r0, [r5, #700]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #704]
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2137
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2125:
	ldr	r2, .L2164+168
	movw	r1, #8387
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2130:
	ldr	r2, .L2164+168
	movw	r1, #8417
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2165:
	.align	2
.L2164:
	.word	.LC162
	.word	.LC166
	.word	.LC168
	.word	.LC175
	.word	.LC178
	.word	.LC182
	.word	.LC183
	.word	.LC184
	.word	.LC185
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC196
	.word	.LC197
	.word	.LC195
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC176
	.word	.LC177
	.word	.LC169
	.word	.LC170
	.word	.LC171
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC167
	.word	.LC163
	.word	.LC164
	.word	.LC165
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC186
	UNWIND(.fnend)
	.size	mvc_vui_parameters, .-mvc_vui_parameters
	.align	2
	.global	MVC_SPSEqual
	.type	MVC_SPSEqual, %function
MVC_SPSEqual:
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
	beq	.L2198
	cmp	r1, #0
	beq	.L2199
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
	ldrb	ip, [r1, #27]	@ zero_extendqisi2
	ldrb	r0, [r6, #27]	@ zero_extendqisi2
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L2170
	add	r2, r6, #5
	sub	r0, r1, #404
	str	r2, [fp, #-48]
	add	r2, r1, #5
	add	r9, r1, #748
	sub	r10, r6, #404
	sub	r4, r6, #148
	mov	r8, r6
	str	r6, [fp, #-52]
	mov	r7, #0
	mov	r5, r0
	mov	r6, r2
	str	r1, [fp, #-56]
.L2174:
	ldr	r1, [fp, #-48]
	ldrsb	r0, [r6, #1]!
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-48]
	sxtb	r1, r2
	cmp	r0, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L2171
	cmp	r7, #5
	bhi	.L2181
	add	r2, r8, #748
	add	lr, r8, #812
	mov	r1, r9
.L2173:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, lr
	bne	.L2173
.L2171:
	add	r7, r7, #1
	add	r10, r10, #256
	cmp	r7, #8
	add	r5, r5, #256
	add	r4, r4, #256
	add	r8, r8, #64
	add	r9, r9, #64
	bne	.L2174
	ldr	r6, [fp, #-52]
	ldr	r1, [fp, #-56]
.L2170:
	ldr	r2, [r1, #2896]
	ldr	ip, [r6, #2900]
	ldr	r0, [r1, #2900]
	ldr	lr, [r6, #2896]
	cmp	ip, r0
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	beq	.L2176
	cmp	ip, #1
	bne	.L2175
	ldr	r0, [r1, #2908]
	ldr	ip, [r6, #2908]
	ldrb	r2, [r6, #18]	@ zero_extendqisi2
	ldrb	r4, [r1, #18]	@ zero_extendqisi2
	ldr	lr, [r6, #2912]
	cmp	ip, r0
	cmpeq	r2, r4
	ldr	r2, [r1, #2912]
	ldr	r5, [r6, #2916]
	ldr	ip, [r1, #2916]
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
	beq	.L2175
	add	ip, r6, #2912
	add	r0, r1, #2912
	add	ip, ip, #4
	add	r0, r0, #4
	mov	r2, #0
.L2178:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r5
	bne	.L2178
.L2175:
	ldrb	lr, [r6, #19]	@ zero_extendqisi2
	ldrb	r0, [r1, #19]	@ zero_extendqisi2
	ldr	r2, [r6, #3944]
	ldr	r4, [r1, #3944]
	ldr	r7, [r6, #3948]
	cmp	lr, r0
	cmpeq	r2, r4
	ldr	r2, [r1, #3948]
	ldr	r5, [r6, #3952]
	ldr	r4, [r1, #3952]
	moveq	ip, #1
	movne	ip, #0
	ldrb	lr, [r1, #20]	@ zero_extendqisi2
	cmp	r7, r2
	movne	r0, #0
	andeq	r0, ip, #1
	ldrb	ip, [r6, #20]	@ zero_extendqisi2
	cmp	r5, r4
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	lr, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L2179
	ldrb	r0, [r6, #21]	@ zero_extendqisi2
	ldrb	r2, [r1, #21]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L2179:
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	ldrb	ip, [r6, #23]	@ zero_extendqisi2
	ldrb	r0, [r1, #23]	@ zero_extendqisi2
	ldrb	lr, [r6, #22]	@ zero_extendqisi2
	cmp	r0, ip
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L2200
.L2180:
	ldrb	r2, [r6, #24]	@ zero_extendqisi2
	ldr	r0, [r6, #52]
	ldr	ip, [r1, #52]
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	cmp	r0, ip
	cmpeq	r2, r1
	moveq	r2, #1
	movne	r2, #0
	tst	r3, r2
	mvneq	r0, #0
	movne	r0, #0
.L2168:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2200:
	ldr	ip, [r1, #3960]
	ldr	lr, [r6, #3960]
	ldr	r0, [r6, #3956]
	ldr	r2, [r1, #3956]
	ldr	r5, [r6, #3964]
	cmp	lr, ip
	cmpeq	r0, r2
	ldr	r2, [r1, #3964]
	ldr	r4, [r6, #3968]
	ldr	lr, [r1, #3968]
	moveq	ip, #1
	movne	ip, #0
	cmp	r5, r2
	movne	r0, #0
	andeq	r0, ip, #1
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	and	r3, r3, r2
	b	.L2180
.L2181:
	mov	r1, r5
	mov	r2, r10
.L2172:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r4
	bne	.L2172
	b	.L2171
.L2176:
	ldr	r0, [r6, #2904]
	ldr	r2, [r1, #2904]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L2175
.L2199:
	movw	r3, #8466
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L2201
	ldr	r3, .L2201+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L2168
.L2198:
	movw	r1, #8465
	ldr	r3, .L2201+4
	str	r1, [sp]
	ldr	r2, .L2201
	bl	dprint_normal
	mvn	r0, #0
	b	.L2168
.L2202:
	.align	2
.L2201:
	.word	.LC14
	.word	.LC13
	UNWIND(.fnend)
	.size	MVC_SPSEqual, .-MVC_SPSEqual
	.global	__aeabi_idiv
	.align	2
	.global	MVC_GetDar
	.type	MVC_GetDar, %function
MVC_GetDar:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
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
	beq	.L2226
	subs	ip, r4, #255
	movne	ip, #1
	cmp	r4, #16
	movle	lr, #0
	andgt	lr, ip, #1
	cmp	lr, #0
	bne	.L2215
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r0, #1
	movne	r0, #0
	cmp	r4, #255
	movne	r0, #0
	andeq	r0, r0, #1
	cmp	r0, #0
	bne	.L2216
	cmp	r4, #1
	moveq	r3, r0
	moveq	r4, #5
	beq	.L2204
	cmp	ip, #0
	ldrne	r0, .L2227
	addne	r4, r0, r4, lsl #3
	ldrne	r1, [r4, #140]
	ldrne	r2, [r4, #144]
	mul	r0, r3, r1
	ldr	r3, [fp, #4]
	mul	r1, r3, r2
	mov	r0, r0, asl #10
	bl	__aeabi_idiv
	movw	r2, #2405
	movw	r1, #2262
	cmp	r0, r2
	mov	r3, r0
	rsble	r2, r0, #2400
	subgt	r2, r0, #2400
	addle	r2, r2, #6
	subgt	r2, r2, #6
	cmp	r0, r1
	bgt	.L2208
	rsb	r1, r0, #2256
	add	r1, r1, #7
	cmp	r2, r1
	bge	.L2209
.L2219:
	mov	r4, #4
	b	.L2204
.L2215:
	mov	r4, #0
.L2226:
	mov	r3, r4
.L2204:
	str	r4, [sp]
	movw	r1, #8609
	ldr	r2, .L2227+4
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L2208:
	sub	r1, r0, #2256
	sub	r1, r1, #7
	cmp	r2, r1
	blt	.L2219
.L2209:
	movw	r2, #1819
	cmp	r3, r2
	bgt	.L2210
	rsb	r2, r3, #1808
	add	r2, r2, #12
	cmp	r1, r2
	blt	.L2221
.L2211:
	movw	r1, #1364
	cmp	r3, r1
	rsble	r4, r3, #1360
	subgt	r4, r3, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r2, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L2204
.L2216:
	mov	r4, lr
	mov	r3, lr
	b	.L2204
.L2210:
	sub	r2, r3, #1808
	sub	r2, r2, #12
	cmp	r1, r2
	bge	.L2211
.L2221:
	mov	r4, #3
	b	.L2204
.L2228:
	.align	2
.L2227:
	.word	.LANCHOR0
	.word	.LC205
	UNWIND(.fnend)
	.size	MVC_GetDar, .-MVC_GetDar
	.align	2
	.global	MVC_ProcessSPS
	.type	MVC_ProcessSPS, %function
MVC_ProcessSPS:
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
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L2332
	ldr	r3, [r5, #736]
	cmp	r3, #100
	cmpne	r3, #122
	bic	r1, r3, #16
	sub	r3, r3, #110
	moveq	r2, #1
	movne	r2, #0
	cmp	r1, #128
	orreq	r2, r2, #1
	bics	r3, r3, #8
	orreq	r3, r2, #1
	movne	r3, r2
	cmp	r3, #0
	streqb	r3, [r5, #27]
	moveq	r3, #1
	streq	r3, [r5, #748]
	bne	.L2333
.L2242:
	ldr	r1, .L2346
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #12
	str	r0, [r5, #2896]
	bhi	.L2255
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2255
	ldr	r1, .L2346+4
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r5, #2900]
	bhi	.L2257
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2257
	cmp	r0, #0
	beq	.L2334
	cmp	r0, #1
	beq	.L2335
.L2263:
	ldr	r1, .L2346+8
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #3944]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+12
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #19]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+16
	mov	r0, r4
	bl	mvc_ue_v
	sub	r3, r0, #1
	str	r0, [r5, #3948]
	cmp	r3, #253
	bhi	.L2268
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2268
	ldr	r1, .L2346+20
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #3952]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+24
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #20]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	cmp	r0, #0
	bne	.L2336
	ldr	r1, .L2346+28
	mov	r0, r4
	bl	mvc_u_1
	ldr	r6, [r5, #3952]
	add	r6, r6, #1
	cmp	r6, #127
	strb	r0, [r5, #21]
	bhi	.L2300
	ldr	r3, [r5, #3948]
	add	r3, r3, #1
	cmp	r6, #1
	cmphi	r3, #3
	movhi	r8, #2
	bhi	.L2272
.L2300:
	ldr	r2, .L2346+32
	movw	r1, #8823
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2333:
	ldr	r1, .L2346+36
	bl	mvc_ue_v
	cmp	r0, #1
	str	r0, [r5, #748]
	bhi	.L2233
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2233
	ldr	r1, .L2346+40
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L2235
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2236
.L2235:
	ldr	r2, .L2346+44
	movw	r1, #8652
	mov	r0, #1
	bl	dprint_normal
.L2236:
	ldr	r1, .L2346+48
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L2237
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2238
.L2237:
	ldr	r2, .L2346+52
	movw	r1, #8660
	mov	r0, #1
	bl	dprint_normal
.L2238:
	ldr	r1, .L2346+56
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L2239
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2239
	ldr	r1, .L2346+60
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #27]
	cmp	r0, #1
	bne	.L2242
	sub	r8, fp, #72
	add	r10, r5, #5
	add	r7, r5, #2672
	add	r9, r5, #752
	b	.L2248
.L2339:
	ldr	r3, .L2346+64
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2346+68
	ldr	r3, [r3, #52]
	blx	r3
.L2244:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2337
.L2248:
	ldr	r1, .L2346+72
	mov	r0, r4
	bl	mvc_u_1
	clz	r1, r6
	mov	r2, #16
	mov	r1, r1, lsr #5
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r7
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2338
	cmp	r6, #0
	cmpne	r6, #3
	beq	.L2339
	ldr	r3, .L2346+68
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2244
.L2274:
	ldr	r2, .L2346+76
	movw	r1, #8899
	mov	r0, #1
	bl	dprint_normal
.L2330:
	mvn	r0, #0
.L2323:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2336:
	ldr	r6, [r5, #3952]
	strb	r3, [r5, #21]
	sub	r3, r6, #1
	cmp	r3, #253
	bhi	.L2299
	ldr	r3, [r5, #3948]
	mov	r8, #1
	add	r6, r6, #1
	add	r3, r3, r8
.L2272:
	mul	r6, r6, r8
	mov	r9, r3, asl #4
	mov	r6, r6, asl #4
	mul	r1, r9, r6
	add	r1, r1, r1, lsr #1
	cmp	r1, #25165824
	bhi	.L2340
	ldr	r3, [r5, #740]
	sub	r2, r3, #10
	cmp	r2, #31
	ldrls	pc, [pc, r2, asl #2]
	b	.L2274
.L2276:
	.word	.L2275
	.word	.L2277
	.word	.L2307
	.word	.L2307
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2307
	.word	.L2279
	.word	.L2281
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2281
	.word	.L2282
	.word	.L2283
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2274
	.word	.L2285
	.word	.L2285
.L2334:
	ldr	r1, .L2346+80
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #12
	str	r0, [r5, #2904]
	bhi	.L2260
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2263
.L2260:
	ldr	r2, .L2346+84
	movw	r1, #8757
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2307:
	mov	r0, #60416
	movt	r0, 13
.L2278:
	bl	__aeabi_uidiv
	ldr	r2, .L2346+88
	movw	r1, #8910
	cmp	r0, #16
	movcc	r7, r0
	movcs	r7, #16
	mov	r3, r7
	mov	r0, #19
	bl	dprint_normal
	ldr	r3, [r5, #3944]
	cmp	r3, r7
	bhi	.L2286
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2287
.L2286:
	str	r7, [sp]
	movw	r1, #8915
	ldr	r2, .L2346+92
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r5, #3944]
	cmp	r3, #16
	bhi	.L2327
	cmp	r7, r3
	movcc	r7, r3
.L2327:
	str	r7, [r5, #3944]
.L2287:
	ldr	r1, .L2346+96
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #22]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+100
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #23]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	cmp	r0, #0
	bne	.L2341
.L2289:
	mov	r2, r9, lsr #1
	mov	r3, r6, lsr #1
	str	r9, [r5, #3976]
	str	r6, [r5, #3980]
	str	r2, [r5, #3984]
	str	r3, [r5, #3988]
.L2291:
	ldr	r1, .L2346+104
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r3, r0
	strb	r3, [r5, #24]
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2330
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r5, #68]
	bne	.L2342
	mov	r0, r3
	strb	r3, [r5, #43]
	mov	r3, #5
	str	r3, [r5, #56]
.L2294:
	ldr	r2, [r5, #48]
	mov	r3, r9
	ldr	r1, [r5, #44]
	str	r6, [sp]
	bl	MVC_GetDar
	ldr	r3, [r5, #3944]
	cmp	r3, #0
	str	r0, [r5, #52]
	beq	.L2297
	cmp	r7, r3
	movcs	r7, r3
.L2297:
	cmp	r7, #16
	movcc	r3, r7
	movcs	r3, #16
	cmp	r6, #1920
	bcc	.L2298
	cmp	r7, #4
	movcc	r3, r7
	movcs	r3, #4
.L2298:
	add	r3, r3, #1
	mov	r0, #0
	str	r3, [r5, #3972]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2285:
	mov	r0, #12582912
	b	.L2278
.L2281:
	mov	r0, #30208
	movt	r0, 47
	b	.L2278
.L2337:
	sub	r8, fp, #80
	add	r10, r5, #11
	add	r7, r5, #2768
	add	r9, r5, #1136
	mov	r6, #0
.L2253:
	ldr	r1, .L2346+72
	mov	r0, r4
	bl	mvc_u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r7
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2343
	ldr	r1, .L2346+108
	cmp	r6, #0
	ldr	r3, .L2346+68
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2250:
	add	r6, r6, #1
	add	r7, r7, #64
	cmp	r6, #2
	add	r9, r9, #256
	bne	.L2253
	b	.L2242
.L2338:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2244
	ldr	r1, .L2346+64
	mov	r2, #16
	ldr	r3, .L2346+68
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2244
.L2233:
	ldr	r2, .L2346+112
	movw	r1, #8644
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2255:
	ldr	r2, .L2346+116
	movw	r1, #8739
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2341:
	ldr	r1, .L2346+120
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2346+124
	str	r0, [r5, #3956]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2346+128
	str	r0, [r5, #3960]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2346+132
	str	r0, [r5, #3964]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r5, #3964]
	ldr	r2, [r5, #3956]
	mov	r1, r8, asl #1
	ldr	ip, [r5, #3960]
	mov	r3, r3, asl #1
	mov	r2, r2, asl #1
	mul	r8, r8, r3
	rsb	r3, r2, r9
	sub	r3, r3, ip, asl #1
	rsb	ip, r8, r6
	str	r0, [r5, #3968]
	mls	r0, r0, r1, ip
	cmp	r3, #0
	cmpgt	r0, #0
	ble	.L2289
	add	r2, r2, r3, lsr #1
	add	r8, r8, r0, lsr #1
	str	r2, [r5, #3984]
	str	r8, [r5, #3988]
	str	r3, [r5, #3976]
	str	r0, [r5, #3980]
	b	.L2291
.L2342:
	mov	r0, r4
	add	r1, r5, #28
	bl	mvc_vui_parameters
	cmp	r0, #0
	bne	.L2329
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2329
	ldr	r3, [r5, #732]
	clz	r2, r3
	mov	r2, r2, lsr #5
	cmp	r7, r3
	orrcc	r2, r2, #1
	cmp	r2, #0
	bne	.L2344
	ldr	r2, [r5, #3944]
	ldrb	r0, [r5, #43]	@ zero_extendqisi2
	cmp	r3, r2
	movcs	r7, r3
	movcc	r7, r2
	b	.L2294
.L2344:
	str	r7, [sp]
	movw	r1, #8990
	ldr	r2, .L2346+136
	mov	r0, #1
	bl	dprint_normal
.L2329:
	ldrb	r0, [r5, #43]	@ zero_extendqisi2
	b	.L2294
.L2239:
	ldr	r2, .L2346+140
	movw	r1, #8668
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2335:
	ldr	r1, .L2346+144
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #18]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+148
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #2908]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+152
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #2912]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2330
	ldr	r1, .L2346+156
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #255
	str	r0, [r5, #2916]
	bhi	.L2265
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2265
	cmp	r0, #0
	addne	r7, r5, #2912
	addne	r7, r7, #4
	bne	.L2267
	b	.L2263
.L2345:
	ldr	r3, [r5, #2916]
	cmp	r3, r6
	bls	.L2263
.L2267:
	ldr	r1, .L2346+160
	mov	r0, r4
	bl	mvc_se_v
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2345
	b	.L2330
.L2268:
	mov	r3, r0
	ldr	r2, .L2346+164
	movw	r1, #8799
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2282:
	mov	r0, #30720
	movt	r0, 105
	b	.L2278
.L2279:
	mov	r0, #55296
	movt	r0, 27
	b	.L2278
.L2283:
	mov	r0, #7864320
	b	.L2278
.L2277:
	mov	r0, #17920
	movt	r0, 5
	b	.L2278
.L2275:
	mov	r0, #20992
	movt	r0, 2
	b	.L2278
.L2299:
	ldr	r2, .L2346+32
	movw	r1, #8833
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2265:
	ldr	r2, .L2346+168
	movw	r1, #8776
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2343:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2250
	ldr	r1, .L2346+108
	mov	r2, #64
	ldr	r3, .L2346+68
	cmp	r6, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2250
.L2257:
	ldr	r2, .L2346+172
	movw	r1, #8747
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2340:
	ldr	r2, .L2346+176
	movw	r1, #8844
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2332:
	movw	r1, #8633
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L2346+180
	ldr	r2, .L2346+184
	bl	dprint_normal
	mvn	r0, #0
	b	.L2323
.L2347:
	.align	2
.L2346:
	.word	.LC215
	.word	.LC217
	.word	.LC220
	.word	.LC228
	.word	.LC229
	.word	.LC231
	.word	.LC232
	.word	.LC246
	.word	.LC233
	.word	.LC206
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC212
	.word	.LC214
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC154
	.word	.LC235
	.word	.LC219
	.word	.LC221
	.word	.LC236
	.word	.LC237
	.word	.LC238
	.word	.LC239
	.word	.LC244
	.word	.LANCHOR1+32
	.word	.LC207
	.word	.LC216
	.word	.LC240
	.word	.LC241
	.word	.LC242
	.word	.LC243
	.word	.LC245
	.word	.LC213
	.word	.LC222
	.word	.LC223
	.word	.LC224
	.word	.LC225
	.word	.LC227
	.word	.LC230
	.word	.LC226
	.word	.LC218
	.word	.LC234
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_ProcessSPS, .-MVC_ProcessSPS
	.align	2
	.global	MVC_DecSPS
	.type	MVC_DecSPS, %function
MVC_DecSPS:
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
	ldr	r2, .L2392
	mov	r1, #8
	mov	r4, r0
	bl	mvc_u_v
	ldr	r1, .L2392+4
	mov	r10, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2392+8
	mov	r9, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2392+12
	mov	r8, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2392+16
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2392+20
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2392+24
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r2, .L2392+28
	mov	r1, #2
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2392+32
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2392+36
	mov	r5, r0
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r6, r0
	bne	.L2385
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L2387
	cmp	r10, #100
	mov	r7, r10
	beq	.L2354
	bhi	.L2355
	cmp	r10, #77
	beq	.L2354
	cmp	r10, #88
	beq	.L2356
	cmp	r10, #66
	bne	.L2353
	ldr	r2, .L2392+40
	movw	r1, #9071
	mov	r0, #1
	bl	dprint_normal
.L2354:
	cmp	r5, #9
	mov	r3, r5
	bls	.L2388
.L2359:
	cmp	r5, #41
	bls	.L2360
	mov	r5, #41
	ldr	r2, .L2392+44
	movw	r1, #9104
	str	r5, [sp]
	mov	r0, #1
	bl	dprint_normal
	mov	r3, r5
.L2360:
	movw	r2, #3992
	ldr	r1, [r4, #248]
	mul	r5, r2, r6
	add	r1, r1, r5
	ldrb	r10, [r1, #25]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L2361
	ldr	r10, .L2392+48
	mov	r0, r4
	str	r2, [fp, #-72]
	ldrb	r2, [fp, #-56]	@ zero_extendqisi2
	add	r1, r10, #2240
	str	r7, [r10, #2976]
	strb	r9, [r10, #2240]
	strb	r2, [r10, #2242]
	ldrb	r2, [fp, #-60]	@ zero_extendqisi2
	strb	r8, [r10, #2241]
	str	r3, [r10, #2980]
	strb	r2, [r10, #2243]
	ldrb	r2, [fp, #-64]	@ zero_extendqisi2
	str	r6, [r10, #2984]
	strb	r2, [r10, #2244]
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	strb	r2, [r10, #2245]
	bl	MVC_ProcessSPS
	ldr	r2, [fp, #-72]
	subs	r7, r0, #0
	bne	.L2389
	ldr	r1, [r4, #248]
	add	r0, r10, #2240
	str	r2, [fp, #-56]
	add	r1, r1, r5
	bl	MVC_SPSEqual
	ldr	r2, [fp, #-56]
	cmp	r0, #0
	bne	.L2390
.L2350:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2355:
	cmp	r10, #122
	beq	.L2358
	cmp	r10, #144
	beq	.L2358
	cmp	r10, #110
	beq	.L2358
.L2353:
	mov	r3, r10
	ldr	r2, .L2392+52
	movw	r1, #9091
	mov	r0, #1
	bl	dprint_normal
	cmp	r5, #9
	mov	r7, #100
	mov	r3, r5
	bhi	.L2359
	b	.L2388
.L2361:
	str	r7, [r1, #736]
	mov	r0, r4
	ldr	r2, [r4, #248]
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	strb	r9, [r2, r5]
	ldr	r2, [r4, #248]
	add	r2, r2, r5
	strb	r8, [r2, #1]
	ldr	r2, [r4, #248]
	add	r2, r2, r5
	strb	r1, [r2, #2]
	ldr	r2, [r4, #248]
	ldrb	r1, [fp, #-60]	@ zero_extendqisi2
	add	r2, r2, r5
	strb	r1, [r2, #3]
	ldr	r2, [r4, #248]
	ldrb	r1, [fp, #-64]	@ zero_extendqisi2
	add	r2, r2, r5
	strb	r1, [r2, #4]
	ldr	r2, [r4, #248]
	ldrb	r1, [fp, #-68]	@ zero_extendqisi2
	add	r2, r2, r5
	strb	r1, [r2, #5]
	ldr	r2, [r4, #248]
	add	r2, r2, r5
	str	r3, [r2, #740]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	str	r6, [r3, #744]
	ldr	r1, [r4, #248]
	add	r1, r1, r5
	bl	MVC_ProcessSPS
	cmp	r0, #0
	bne	.L2391
	ldr	r3, [r4, #248]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #26]
	ldr	r3, [r4, #248]
	add	r5, r3, r5
	strb	r2, [r5, #25]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2387:
	ldr	r2, .L2392+56
	movw	r1, #9058
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r4, #36]
	sub	r3, r2, #1
	cmp	r6, r3
	bls	.L2385
	ldr	r3, .L2392+60
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2385
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r6, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r4, #120]
	mov	r1, #28
	blx	r5
.L2385:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2388:
	mov	r5, #41
	ldr	r2, .L2392+44
	movw	r1, #9098
	str	r5, [sp]
	mov	r0, #1
	bl	dprint_normal
	mov	r3, r5
	b	.L2360
.L2358:
	ldr	r2, .L2392+64
	movw	r1, #9087
	mov	r0, #1
	bl	dprint_normal
	cmp	r5, #9
	mov	r3, r5
	bhi	.L2359
	b	.L2388
.L2356:
	ldr	r2, .L2392+68
	movw	r1, #9075
	mov	r0, #1
	bl	dprint_normal
	cmp	r5, #9
	mov	r3, r5
	bhi	.L2359
	b	.L2388
.L2390:
	ldr	ip, .L2392+72
	mov	r3, #1
	ldr	r0, [r4, #248]
	add	r1, r10, #2240
	strb	r3, [r10, #2266]
	add	r0, r0, r5
	ldr	r4, [ip, #56]
	strb	r3, [r10, #2265]
	blx	r4
	mov	r0, r7
	b	.L2350
.L2389:
	movw	r3, #9122
	str	r6, [sp]
	mov	r1, r3
	ldr	r2, .L2392+76
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2350
.L2391:
	movw	r3, #9148
	ldr	r2, .L2392+76
	mov	r1, r3
	str	r6, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #248]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r5
	strb	r2, [r3, #26]
	ldr	r3, [r4, #248]
	add	r5, r3, r5
	strb	r10, [r5, #25]
	b	.L2350
.L2393:
	.align	2
.L2392:
	.word	.LC247
	.word	.LC248
	.word	.LC249
	.word	.LC250
	.word	.LC251
	.word	.LC252
	.word	.LC253
	.word	.LC254
	.word	.LC255
	.word	.LC256
	.word	.LC257
	.word	.LC261
	.word	.LANCHOR2
	.word	.LC260
	.word	.LC160
	.word	g_EventReportFunc
	.word	.LC259
	.word	.LC258
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC262
	UNWIND(.fnend)
	.size	MVC_DecSPS, .-MVC_DecSPS
	.align	2
	.global	MVC_ProcessSUBSPSMvcExt
	.type	MVC_ProcessSUBSPSMvcExt, %function
MVC_ProcessSUBSPSMvcExt:
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
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L2456
	ldr	r1, .L2457
	bl	mvc_ue_v
	cmp	r0, #1
	str	r0, [r5, #4]
	bhi	.L2397
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	addeq	r7, r5, #4
	bne	.L2397
.L2399:
	ldr	r1, .L2457+4
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldr	r3, [r5, #4]
	cmp	r3, r6
	bcs	.L2399
	cmp	r3, #0
	mov	r2, #0
	str	r2, [r5, #16]
	str	r2, [r5, #24]
	beq	.L2400
	add	r8, r5, #16
	mov	r7, #1
.L2410:
	ldr	r1, .L2457+8
	mov	r0, r4
	bl	mvc_ue_v
	add	r9, r8, #4
	str	r0, [r8, #4]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2401
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2401
	cmp	r0, #0
	addne	r10, r8, #16
	beq	.L2406
.L2405:
	ldr	r1, .L2457+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r10, #4]!
	ldr	r3, [r9]
	cmp	r3, r6
	bhi	.L2405
.L2406:
	ldr	r1, .L2457+16
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #8]
	ldr	r2, [r5, #4]
	cmp	r2, #15
	movcc	r3, r2
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2403
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2403
	cmp	r0, #0
	addne	r8, r8, #24
	beq	.L2408
.L2409:
	ldr	r1, .L2457+20
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r9, #8]
	cmp	r3, r6
	bhi	.L2409
	ldr	r2, [r5, #4]
.L2408:
	add	r7, r7, #1
	mov	r8, r9
	cmp	r7, r2
	bls	.L2410
	cmp	r2, #0
	mov	r3, #0
	addne	r8, r5, #48
	str	r3, [r5, #48]
	str	r3, [r5, #56]
	movne	r7, #1
	beq	.L2424
.L2423:
	ldr	r1, .L2457+24
	mov	r0, r4
	bl	mvc_ue_v
	add	r9, r8, #4
	str	r0, [r8, #4]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2414
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2414
	cmp	r0, #0
	addne	r10, r8, #16
	beq	.L2419
.L2418:
	ldr	r1, .L2457+28
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r10, #4]!
	ldr	r3, [r9]
	cmp	r3, r6
	bhi	.L2418
.L2419:
	ldr	r1, .L2457+32
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #8]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcc	r2, r3
	movcs	r2, #15
	cmp	r0, r2
	bhi	.L2416
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2416
	cmp	r0, #0
	addne	r8, r8, #24
	beq	.L2421
.L2422:
	ldr	r1, .L2457+36
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r9, #8]
	cmp	r3, r6
	bhi	.L2422
	ldr	r3, [r5, #4]
.L2421:
	add	r7, r7, #1
	mov	r8, r9
	cmp	r7, r3
	bls	.L2423
.L2424:
	ldr	r1, .L2457+40
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r0, #1
	str	r0, [r5, #80]
	cmp	r3, #16
	str	r3, [fp, #-60]
	bhi	.L2412
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2412
	ldr	r2, [fp, #-60]
	cmp	r2, #0
	beq	.L2429
	add	r2, r5, #8384
	add	r1, r5, #80
	add	r2, r2, #16
	str	r1, [fp, #-72]
	str	r2, [fp, #-68]
	add	r2, r5, #212
	str	r3, [fp, #-56]
	str	r2, [fp, #-64]
	str	r5, [fp, #-76]
.L2428:
	ldr	r2, .L2457+44
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-72]
	ldr	r1, .L2457+48
	str	r0, [r3, #4]!
	mov	r0, r4
	mov	r5, r3
	str	r3, [fp, #-72]
	bl	mvc_ue_v
	add	r3, r0, #1
	str	r0, [r5, #64]
	str	r3, [fp, #-52]
	mov	r2, r3
	cmp	r2, #64
	bhi	.L2426
	ldrb	r7, [r4, #10]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L2426
	cmp	r2, #0
	beq	.L2436
	ldr	r3, [fp, #-64]
	movw	r10, #8188
	ldr	r2, [fp, #-68]
	movt	r10, 4
	add	r10, r3, r10
	mov	r8, r3
	str	r2, [fp, #-48]
.L2435:
	ldr	r2, .L2457+52
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2457+56
	str	r0, [r8], #4
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r0, #1
	str	r0, [r8, #4092]
	cmp	r6, #64
	bhi	.L2430
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2430
	cmp	r6, #0
	movne	r5, r3
	ldrne	r9, [fp, #-48]
	beq	.L2434
.L2431:
	ldr	r1, .L2457+60
	mov	r0, r4
	bl	mvc_ue_v
	add	r5, r5, #1
	cmp	r6, r5
	str	r0, [r9, #4]!
	bne	.L2431
.L2434:
	ldr	r1, .L2457+64
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #1024
	str	r0, [r10, #4]!
	bcs	.L2432
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2432
	ldr	r3, [fp, #-48]
	add	r7, r7, #1
	add	r3, r3, #256
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r3, r7
	bne	.L2435
.L2436:
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-56]
	add	r2, r2, #256
	str	r2, [fp, #-64]
	ldr	r2, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	cmp	r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #16384
	str	r3, [fp, #-68]
	bne	.L2428
.L2429:
	mov	r0, #0
	b	.L2448
.L2401:
	mov	r3, r0
	ldr	r2, .L2457+68
	movw	r1, #9200
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
.L2448:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2403:
	mov	r3, r0
	ldr	r2, .L2457+72
	movw	r1, #9213
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2416:
	mov	r3, r0
	ldr	r2, .L2457+76
	movw	r1, #9245
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2414:
	mov	r3, r0
	ldr	r2, .L2457+80
	movw	r1, #9232
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2397:
	mov	r3, r0
	ldr	r2, .L2457+84
	movw	r0, #65534
	movw	r1, #9182
	str	r0, [r5, #80]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2400:
	str	r3, [r5, #48]
	str	r3, [r5, #56]
	b	.L2424
.L2432:
	mov	r3, r0
	ldr	r2, .L2457+88
	movw	r1, #9300
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2430:
	ldr	r3, [fp, #-56]
	movw	lr, #65534
	ldr	r5, [fp, #-76]
	movw	r1, #9287
	ldr	r2, .L2457+92
	mov	r0, #1
	add	ip, r7, r3, lsl #6
	mov	r3, r6
	add	ip, ip, #1072
	add	ip, ip, #4
	add	ip, r5, ip, lsl #2
	str	lr, [ip, #4]
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2456:
	movw	r1, #9175
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L2457+96
	ldr	r2, .L2457+100
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2412:
	movw	r0, #65534
	ldr	r3, [fp, #-60]
	str	r0, [r5, #80]
	movw	r1, #9261
	ldr	r2, .L2457+104
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2426:
	ldr	r3, [fp, #-56]
	movw	r1, #65534
	ldr	r5, [fp, #-76]
	mov	r0, #1
	ldr	r2, .L2457+108
	add	r5, r5, r3, lsl #2
	ldr	r3, [fp, #-52]
	str	r1, [r5, #148]
	movw	r1, #9274
	bl	dprint_normal
	mvn	r0, #0
	b	.L2448
.L2458:
	.align	2
.L2457:
	.word	.LC263
	.word	.LC265
	.word	.LC266
	.word	.LC269
	.word	.LC267
	.word	.LC271
	.word	.LC273
	.word	.LC276
	.word	.LC274
	.word	.LC278
	.word	.LC272
	.word	.LC280
	.word	.LC281
	.word	.LC283
	.word	.LC284
	.word	.LC287
	.word	.LC285
	.word	.LC268
	.word	.LC270
	.word	.LC277
	.word	.LC275
	.word	.LC264
	.word	.LC288
	.word	.LC286
	.word	.LC13
	.word	.LC14
	.word	.LC279
	.word	.LC282
	UNWIND(.fnend)
	.size	MVC_ProcessSUBSPSMvcExt, .-MVC_ProcessSUBSPSMvcExt
	.align	2
	.global	MVC_ProcessSUBSPSMvcVuiExt
	.type	MVC_ProcessSUBSPSMvcVuiExt, %function
MVC_ProcessSUBSPSMvcVuiExt:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
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
	mov	r5, r1
	ldr	r1, .L2496
	mov	r4, r0
	bl	mvc_ue_v
	add	r2, r5, #278528
	cmp	r0, #1024
	str	r0, [r2, #560]
	bcs	.L2492
	adds	r6, r0, #1
	mov	r1, #0
	adc	r7, r1, #0
	strd	r6, [fp, #-116]
	orrs	r3, r6, r7
	beq	.L2480
	add	r1, r5, #294912
	add	r9, r5, #315392
	add	r9, r9, #856
	movw	r3, #16687
	mov	ip, r1
	movw	r6, #34136
	movw	r1, #16751
	movw	r0, #33844
	mov	r8, r5
	movt	r3, 4
	add	ip, ip, #820
	add	r3, r5, r3
	movt	r6, 4
	str	r3, [fp, #-104]
	movt	r1, 4
	add	r6, r5, r6
	add	r3, r5, r1
	movt	r0, 4
	str	r3, [fp, #-96]
	add	r3, r2, #111
	str	ip, [fp, #-76]
	str	r3, [fp, #-88]
	add	r3, r5, r0
	str	r6, [fp, #-48]
	str	r3, [fp, #-80]
	add	r3, r2, #560
	str	r3, [fp, #-92]
	add	r3, r2, #176
	str	r3, [fp, #-72]
	add	r3, r2, #432
	str	r3, [fp, #-52]
	add	r3, r2, #496
	str	r3, [fp, #-56]
	add	r3, r2, #240
	str	r3, [fp, #-84]
	add	r3, r2, #816
	mov	r2, #1
	str	r3, [fp, #-60]
	mov	r3, #0
	strd	r2, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-100]
.L2479:
	ldr	r2, .L2496+4
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-88]
	ldr	r1, .L2496+8
	strb	r0, [r3, #1]!
	mov	r0, r4
	str	r3, [fp, #-88]
	bl	mvc_ue_v
	ldr	r3, [fp, #-92]
	cmp	r0, #1024
	str	r0, [r3, #4]!
	str	r3, [fp, #-92]
	bcs	.L2493
	adds	r5, r0, #1
	beq	.L2467
	ldr	r10, [fp, #-60]
	mov	r7, #0
	ldr	r6, [fp, #-48]
.L2464:
	ldr	r1, .L2496+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r7, r7, #1
	cmp	r5, r7
	str	r0, [r10, #4]!
	bne	.L2464
	str	r6, [fp, #-48]
.L2467:
	ldr	r1, .L2496+16
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-96]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	cmp	r0, #0
	str	r3, [fp, #-96]
	bne	.L2494
.L2466:
	ldr	r1, .L2496+20
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-52]
	uxtb	r0, r0
	strb	r0, [r3]
	cmp	r0, #0
	beq	.L2468
	ldr	r1, .L2496+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r5, [fp, #-48]
	ldr	r2, .L2496+28
	mov	r1, #4
	str	r0, [r5]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34132
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2496+32
	mov	r1, #4
	strb	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34133
	movt	r3, 4
	add	r3, r8, r3
	strb	r0, [r3]
	ldr	r3, [r5]
	cmp	r3, #31
	bhi	.L2469
	ldrb	r5, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L2469
	ldr	r6, [fp, #-48]
	movw	r10, #34099
	movt	r10, 4
	add	r10, r8, r10
	mov	r7, r6
.L2471:
	ldr	r1, .L2496+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2496+40
	add	r5, r5, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2496+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r10, #1]!
	ldr	r3, [r6]
	cmp	r3, r5
	bcs	.L2471
	ldr	r2, .L2496+48
	mov	r1, #5
	mov	r0, r4
	str	r6, [fp, #-48]
	bl	mvc_u_v
	movw	r3, #34396
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2496+52
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	add	r3, r8, #294912
	ldr	r2, .L2496+56
	mov	r1, #5
	str	r0, [r3, #1632]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34404
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2496+60
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34408
	movt	r3, 4
	add	r3, r8, r3
	str	r0, [r3]
.L2468:
	ldr	r1, .L2496+64
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3]
	cmp	r0, #0
	bne	.L2495
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2478
.L2477:
	ldr	r1, .L2496+68
	mov	r0, r4
	bl	mvc_u_1
	ldrd	r2, [fp, #-68]
	ldrd	r6, [fp, #-116]
	add	r8, r8, #312
	add	r9, r9, #312
	cmp	r7, r3
	ldr	r3, [fp, #-100]
	cmpeq	r6, r2
	add	r1, r3, #1
	ldr	r3, [fp, #-72]
	str	r1, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	movhi	r3, #1
	movls	r3, #0
	cmp	r1, #63
	movhi	r1, #0
	andls	r1, r3, #1
	ldrd	r2, [fp, #-68]
	adds	r6, r2, #1
	adc	r7, r3, #0
	ldr	r3, [fp, #-52]
	cmp	r1, #0
	strd	r6, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-48]
	add	r3, r3, #312
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-76]
	add	r3, r3, #4
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r3, r3, #4
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-84]
	add	r3, r3, #1
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-60]
	add	r3, r3, #256
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-104]
	strb	r0, [r3, #1]!
	str	r3, [fp, #-104]
	bne	.L2479
.L2480:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2495:
	ldr	r1, .L2496+24
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r8, #315392
	ldr	r2, .L2496+28
	mov	r1, #4
	mov	r5, r3
	str	r3, [fp, #-108]
	str	r0, [r9]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2496+32
	mov	r1, #4
	strb	r0, [r5, #852]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54101
	movt	r3, 4
	add	r3, r8, r3
	strb	r0, [r3]
	ldr	r3, [r9]
	cmp	r3, #31
	bhi	.L2473
	ldrb	r5, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L2473
	movw	r10, #54067
	ldr	r6, [fp, #-48]
	movt	r10, 4
	add	r10, r8, r10
	mov	r7, r9
.L2475:
	ldr	r1, .L2496+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2496+40
	add	r5, r5, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2496+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r10, #1]!
	ldr	r3, [r9]
	cmp	r3, r5
	bcs	.L2475
	ldr	r2, .L2496+48
	mov	r1, #5
	mov	r0, r4
	str	r6, [fp, #-48]
	bl	mvc_u_v
	movw	r3, #54364
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2496+52
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-108]
	ldr	r2, .L2496+56
	mov	r1, #5
	str	r0, [r3, #1120]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54372
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2496+60
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54376
	movt	r3, 4
	add	r3, r8, r3
	str	r0, [r3]
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2478
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2477
.L2478:
	ldr	r1, .L2496+72
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-72]
	strb	r0, [r3]
	b	.L2477
.L2494:
	ldr	r2, .L2496+76
	mov	r1, #32
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-76]
	ldr	r2, .L2496+80
	mov	r1, #32
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-80]
	ldr	r1, .L2496+84
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-84]
	strb	r0, [r3]
	b	.L2466
.L2469:
	ldr	r2, .L2496+88
	movw	r1, #9366
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
.L2490:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2493:
	mov	r3, r0
	ldr	r2, .L2496+92
	movw	r1, #9333
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2473:
	ldr	r2, .L2496+88
	movw	r1, #9396
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2492:
	mov	r3, r0
	ldr	r2, .L2496+96
	movw	r1, #9320
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2490
.L2497:
	.align	2
.L2496:
	.word	.LC289
	.word	.LC291
	.word	.LC292
	.word	.LC295
	.word	.LC294
	.word	.LC299
	.word	.LC300
	.word	.LC301
	.word	.LC302
	.word	.LC303
	.word	.LC304
	.word	.LC305
	.word	.LC306
	.word	.LC307
	.word	.LC308
	.word	.LC309
	.word	.LC310
	.word	.LC312
	.word	.LC311
	.word	.LC296
	.word	.LC297
	.word	.LC298
	.word	.LC186
	.word	.LC293
	.word	.LC290
	UNWIND(.fnend)
	.size	MVC_ProcessSUBSPSMvcVuiExt, .-MVC_ProcessSUBSPSMvcVuiExt
	.align	2
	.global	MVC_DecSubSPS
	.type	MVC_DecSubSPS, %function
MVC_DecSubSPS:
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
	ldr	r2, .L2526
	mov	r1, #8
	mov	r4, r0
	bl	mvc_u_v
	ldr	r1, .L2526+4
	mov	r7, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2526+8
	str	r0, [fp, #-48]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2526+12
	mov	r9, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2526+16
	str	r0, [fp, #-52]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2526+20
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2526+24
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r2, .L2526+28
	mov	r1, #2
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2526+32
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2526+36
	mov	r8, r0
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r5, r0
	bne	.L2511
	cmp	r0, #31
	bhi	.L2521
	sub	r3, r7, #66
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L2501
.L2503:
	.word	.L2502
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2504
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2505
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2504
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2506
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2504
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2506
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2504
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2501
	.word	.L2506
.L2502:
	ldr	r2, .L2526+40
	movw	r1, #9465
	mov	r0, #1
	bl	dprint_normal
.L2504:
	cmp	r8, #41
	bhi	.L2522
.L2507:
	movw	r2, #8500
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	movt	r2, 5
	movw	ip, #26248
	mul	r2, r2, r5
	movt	ip, 4
	mov	r0, r4
	add	r10, r4, r2
	add	r6, r10, #286720
	add	ip, r10, ip
	add	r1, r6, #932
	str	r2, [fp, #-68]
	strb	r3, [r6, #932]
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	str	r8, [r6, #1672]
	str	r7, [r6, #1668]
	strb	r3, [r6, #934]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	strb	r9, [r6, #933]
	strb	r3, [r6, #935]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	strb	r3, [r6, #936]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	strb	r3, [r6, #937]
	str	r5, [ip, #4]
	bl	MVC_ProcessSPS
	ldr	r2, [fp, #-68]
	subs	r8, r0, #0
	bne	.L2523
	cmp	r7, #118
	cmpne	r7, #128
	mov	r9, #1
	strb	r9, [r6, #957]
	beq	.L2524
.L2509:
	movw	r3, #8500
	mov	r2, #1
	movt	r3, 5
	mla	r4, r3, r5, r4
	add	r4, r4, #12992
	strb	r2, [r4, #12]
.L2499:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2522:
	mov	r3, r8
	ldr	r2, .L2526+44
	movw	r1, #9498
	mov	r0, #1
	bl	dprint_normal
	mov	r8, #41
	b	.L2507
.L2524:
	ldr	r1, .L2526+48
	mov	r0, r4
	str	r2, [fp, #-48]
	bl	mvc_u_1
	ldr	r2, [fp, #-48]
	add	r10, r10, #12992
	add	r10, r10, #8
	add	r2, r4, r2
	add	r7, r2, #12992
	add	r7, r7, #12
	mov	r1, r7
	strb	r0, [r10, #5]
	mov	r0, r4
	bl	MVC_ProcessSUBSPSMvcExt
	cmp	r0, #0
	bne	.L2525
	ldr	r1, .L2526+52
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #0
	str	r0, [r6, #928]
	beq	.L2509
	mov	r1, r7
	mov	r0, r4
	bl	MVC_ProcessSUBSPSMvcVuiExt
	cmp	r0, #0
	beq	.L2509
	mov	r0, r9
	ldr	r2, .L2526+56
	movw	r1, #9549
	bl	dprint_normal
	strb	r8, [r10, #4]
	mvn	r8, #0
	b	.L2499
.L2506:
	ldr	r2, .L2526+60
	movw	r1, #9487
	mov	r0, #1
	bl	dprint_normal
	b	.L2504
.L2505:
	ldr	r2, .L2526+64
	movw	r1, #9469
	mov	r0, #1
	bl	dprint_normal
	b	.L2504
.L2501:
	mov	r3, r7
	ldr	r2, .L2526+68
	movw	r1, #9491
	mov	r0, #1
	bl	dprint_normal
	mvn	r8, #0
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2511:
	mvn	r8, #0
	b	.L2499
.L2521:
	ldr	r2, .L2526+72
	movw	r1, #9457
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2499
.L2523:
	ldr	r2, .L2526+76
	movw	r1, #9524
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	add	r3, r10, #12992
	mov	r2, #0
	strb	r2, [r3, #12]
	strb	r2, [r6, #957]
	b	.L2499
.L2525:
	mov	r0, r9
	ldr	r2, .L2526+80
	movw	r1, #9538
	bl	dprint_normal
	strb	r8, [r10, #4]
	mvn	r8, #0
	b	.L2499
.L2527:
	.align	2
.L2526:
	.word	.LC313
	.word	.LC314
	.word	.LC315
	.word	.LC316
	.word	.LC317
	.word	.LC318
	.word	.LC319
	.word	.LC320
	.word	.LC321
	.word	.LC322
	.word	.LC257
	.word	.LC324
	.word	.LC326
	.word	.LC328
	.word	.LC329
	.word	.LC259
	.word	.LC258
	.word	.LC323
	.word	.LC160
	.word	.LC325
	.word	.LC327
	UNWIND(.fnend)
	.size	MVC_DecSubSPS, .-MVC_DecSubSPS
	.align	2
	.global	MVC_PassBytes
	.type	MVC_PassBytes, %function
MVC_PassBytes:
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
	ldr	ip, [r0, #232]
	cmp	ip, #0
	cmpne	r1, #0
	beq	.L2537
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #8
	ldr	lr, [r4, #8]
	cmp	lr, #0
	beq	.L2537
	ldr	lr, [ip, #68]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2537
	cmp	lr, r3
	bls	.L2537
	ldr	lr, [r4, #12]
	mov	r6, r2
	ldr	r4, [r4, #24]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2532
	b	.L2530
.L2533:
	ldr	r4, [r2, #24]
	ldr	r2, [r2, #12]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2530
.L2532:
	rsb	r2, r6, r5
	add	r3, r3, #1
	add	ip, ip, r2
	mov	r6, r3, asl #2
	mov	r5, r3, asl #5
	str	lr, [ip, #24]
	rsb	r2, r6, r5
	ldr	ip, [r0, #232]
	ldrb	r4, [ip]	@ zero_extendqisi2
	add	r4, r4, #1
	strb	r4, [ip]
	ldr	ip, [r0, #232]
	add	r2, ip, r2
	ldr	r4, [ip, #68]
	cmp	r4, r3
	bhi	.L2533
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2530:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #24]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2537:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_PassBytes, .-MVC_PassBytes
	.align	2
	.global	MVC_GetBytes
	.type	MVC_GetBytes, %function
MVC_GetBytes:
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
	beq	.L2553
	ldr	r3, [r0, #232]
	cmp	r3, #0
	cmpne	r2, #0
	beq	.L2553
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #8]
	cmp	ip, #0
	beq	.L2553
	ldr	ip, [r3, #68]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2553
	cmp	ip, r7
	bls	.L2553
.L2548:
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
	bcs	.L2543
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, lr
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2555
.L2546:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2556
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, lr
	strb	r3, [r4], #1
.L2555:
	ldr	r3, [r0, #232]
	add	r3, r3, r5
	ldr	r1, [r3, #24]
	add	r1, r1, #8
	str	r1, [r3, #24]
	bhi	.L2546
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2556:
	ldr	r3, [r0, #232]
.L2543:
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r7, r7, #1
	add	ip, ip, #1
	strb	ip, [r3]
	ldr	r3, [r0, #232]
	ldr	ip, [r3, #68]
	cmp	ip, r7
	bhi	.L2548
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2553:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBytes, .-MVC_GetBytes
	.align	2
	.global	MVC_DecFramePackingSEI
	.type	MVC_DecFramePackingSEI, %function
MVC_DecFramePackingSEI:
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
	ldr	r1, .L2564
	mov	r4, r0
	bl	mvc_ue_v
	add	r6, r4, #11075584
	add	r5, r6, #45056
	ldr	r2, .L2564+4
	mov	r1, #1
	str	r0, [r5, #2288]
	mov	r0, r4
	bl	mvc_u_v
	uxtb	r0, r0
	strb	r0, [r5, #2265]
	cmp	r0, #0
	beq	.L2563
.L2558:
	mov	r0, r4
	ldr	r2, .L2564+8
	mov	r1, #1
	add	r6, r6, #45056
	bl	mvc_u_v
	mov	r3, #1
	strb	r3, [r6, #2264]
	strb	r0, [r6, #2266]
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2563:
	ldr	r2, .L2564+12
	mov	r1, #7
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+16
	mov	r1, #1
	str	r0, [r5, #2280]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+20
	mov	r1, #6
	strb	r0, [r5, #2267]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+24
	mov	r1, #1
	str	r0, [r5, #2284]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+28
	mov	r1, #1
	strb	r0, [r5, #2268]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+32
	mov	r1, #1
	strb	r0, [r5, #2269]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+36
	mov	r1, #1
	strb	r0, [r5, #2270]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+40
	mov	r1, #1
	strb	r0, [r5, #2271]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+44
	mov	r1, #1
	strb	r0, [r5, #2272]
	mov	r0, r4
	bl	mvc_u_v
	ldrb	r3, [r5, #2267]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r5, #2273]
	bne	.L2559
	ldr	r3, [r5, #2280]
	cmp	r3, #5
	beq	.L2559
	ldr	r2, .L2564+48
	mov	r1, #1
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+52
	mov	r1, #1
	strb	r0, [r5, #2274]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+56
	mov	r1, #1
	strb	r0, [r5, #2275]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2564+60
	mov	r1, #1
	strb	r0, [r5, #2276]
	mov	r0, r4
	bl	mvc_u_v
	strb	r0, [r5, #2277]
.L2559:
	ldr	r2, .L2564+64
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2564+68
	str	r0, [r5, #2292]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #2296]
	b	.L2558
.L2565:
	.align	2
.L2564:
	.word	.LC330
	.word	.LC331
	.word	.LC347
	.word	.LC332
	.word	.LC333
	.word	.LC334
	.word	.LC335
	.word	.LC336
	.word	.LC337
	.word	.LC338
	.word	.LC339
	.word	.LC340
	.word	.LC341
	.word	.LC342
	.word	.LC343
	.word	.LC344
	.word	.LC345
	.word	.LC346
	UNWIND(.fnend)
	.size	MVC_DecFramePackingSEI, .-MVC_DecFramePackingSEI
	.align	2
	.global	MVC_DecPicTimingSEI
	.type	MVC_DecPicTimingSEI, %function
MVC_DecPicTimingSEI:
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
	add	r6, r0, #11075584
	ldr	r3, [r0, #248]
	add	r2, r6, #32768
	movw	r4, #3992
	mov	r5, r0
	ldr	r2, [r2, #2216]
	mla	r4, r4, r2, r3
	ldrb	r2, [r4, #25]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2567
	ldr	r0, [r0, #36]
	cmp	r0, #0
	ble	.L2568
	ldrb	r2, [r3, #25]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #3984
	addeq	r3, r3, #8
	beq	.L2571
	b	.L2590
.L2572:
	ldrb	r1, [r3, #-3967]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2569
.L2571:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, r0
	add	r3, r3, #3984
	add	r3, r3, #8
	bne	.L2572
.L2568:
	ldr	r2, .L2592
	movw	r1, #9725
	mov	r0, #1
	bl	dprint_normal
	mvn	r3, #0
.L2573:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2590:
	mov	r4, r3
.L2569:
	cmp	r4, #0
	beq	.L2568
.L2567:
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2574
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2591
	ldr	r1, [r4, #388]
	ldr	r8, [r4, #392]
	add	r1, r1, #1
	add	r8, r8, #1
.L2577:
	ldr	r2, .L2592+4
	mov	r0, r5
	bl	mvc_u_v
	add	r7, r6, #45056
	mov	r1, r8
	ldr	r2, .L2592+8
	str	r0, [r7, #2304]
	mov	r0, r5
	bl	mvc_u_v
	str	r0, [r7, #2308]
.L2574:
	ldrb	r0, [r4, #39]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2573
	mov	r0, r5
	ldr	r2, .L2592+12
	mov	r1, #4
	add	r6, r6, #45056
	bl	mvc_u_v
	mov	r3, #0
	strb	r0, [r6, #2300]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2591:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2574
	ldr	r1, [r4, #700]
	ldr	r8, [r4, #704]
	add	r1, r1, #1
	add	r8, r8, #1
	b	.L2577
.L2593:
	.align	2
.L2592:
	.word	.LC348
	.word	.LC349
	.word	.LC350
	.word	.LC351
	UNWIND(.fnend)
	.size	MVC_DecPicTimingSEI, .-MVC_DecPicTimingSEI
	.align	2
	.global	MVC_DecSEI
	.type	MVC_DecSEI, %function
MVC_DecSEI:
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
	ldr	r2, [r0, #232]
	sub	r7, fp, #44
	mov	r3, #0
	mov	r1, #32
	mov	r4, r0
	add	r6, r0, #548
	mov	r8, r3
	strb	r3, [r7, #-1]!
	str	r1, [r2, #24]
	b	.L2597
.L2789:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2596
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2788
.L2597:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	MVC_GetBytes
	ldr	r3, [r4, #572]
	ldr	ip, [r4, #564]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	bls	.L2789
.L2596:
	ldr	r2, .L2819
	movw	r1, #9799
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2599
.L2788:
	mov	r3, #0
	str	r3, [fp, #-56]
.L2733:
	mov	r5, #0
	b	.L2603
.L2791:
	bl	BsSkip
	cmp	r9, #0
	ble	.L2601
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2790
.L2603:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	MVC_GetBytes
	ldr	r3, [r4, #572]
	ldr	ip, [r4, #564]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r5, r5, r2
	mov	r9, r0
	mov	r0, r6
	bls	.L2791
.L2601:
	ldr	r2, .L2819+4
	movw	r1, #9827
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
.L2599:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2790:
	cmp	r5, #409600
	bgt	.L2601
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #2
	ldreq	r2, [r3, #52]
	ldreq	r3, [r3, #24]
	ldrne	r3, [r3, #24]
	addeq	r3, r2, r3
	moveq	r3, r3, lsr #3
	cmp	r8, #45
	ldrls	pc, [pc, r8, asl #2]
	b	.L2606
.L2608:
	.word	.L2607
	.word	.L2609
	.word	.L2610
	.word	.L2611
	.word	.L2612
	.word	.L2612
	.word	.L2613
	.word	.L2614
	.word	.L2615
	.word	.L2616
	.word	.L2617
	.word	.L2618
	.word	.L2619
	.word	.L2620
	.word	.L2621
	.word	.L2622
	.word	.L2623
	.word	.L2624
	.word	.L2625
	.word	.L2626
	.word	.L2627
	.word	.L2628
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2606
	.word	.L2629
.L2629:
	mov	r1, r5
	mov	r0, r4
	ldr	r8, [r4, #572]
	bl	MVC_DecFramePackingSEI
	ldr	r2, [r4, #572]
	mov	r9, r5, asl #3
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2719
	rsb	r9, r3, r9
	ldr	r3, [r4, #564]
	cmp	r9, #0
	add	r8, r9, #7
	movge	r8, r9
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2721
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2721
	mov	r10, #0
	b	.L2722
.L2723:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2721
.L2722:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r10, r10, #1
	ldr	r3, [r4, #564]
	cmp	r10, r8
	ldr	r2, [r4, #572]
	mov	r3, r3, asl #3
	bne	.L2723
.L2721:
	mov	r1, r9, asr #31
	mov	r0, r1, lsr #29
	add	r1, r9, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r3, r2
	bcs	.L2792
.L2719:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	movwlt	r1, #10552
	blt	.L2784
.L2631:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	bhi	.L2793
.L2728:
	mov	r8, #0
	b	.L2732
.L2730:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2731
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2794
.L2732:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	MVC_GetBytes
	ldr	r3, [r4, #572]
	ldr	ip, [r4, #564]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	bls	.L2730
.L2731:
	mov	r0, #0
.L2817:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2628:
	ldr	r2, .L2819+8
	movw	r1, #10494
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2795
.L2715:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2716
.L2717:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2716:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2717
	ldr	r3, [r4, #60]
	cmp	r3, #3
	bls	.L2728
.L2793:
	ldr	r2, .L2819+12
	movw	r1, #10586
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2599
.L2627:
	ldr	r2, .L2819+16
	movw	r1, #10468
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2796
.L2712:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2713
.L2714:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2713:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2714
	b	.L2631
.L2626:
	ldr	r2, .L2819+20
	movw	r1, #10442
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2797
.L2709:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2710
.L2711:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2710:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2711
	b	.L2631
.L2625:
	ldr	r2, .L2819+24
	movw	r1, #10416
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2798
.L2706:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2707
.L2708:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2707:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2708
	b	.L2631
.L2624:
	ldr	r2, .L2819+28
	movw	r1, #10390
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2799
.L2703:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2704
.L2705:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2704:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2705
	b	.L2631
.L2623:
	ldr	r2, .L2819+32
	movw	r1, #10364
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2800
.L2700:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2701
.L2702:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2701:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2702
	b	.L2631
.L2622:
	ldr	r2, .L2819+36
	movw	r1, #10338
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2801
.L2697:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2698
.L2699:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2698:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2699
	b	.L2631
.L2621:
	ldr	r2, .L2819+40
	movw	r1, #10312
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2802
.L2694:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2695
.L2696:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2695:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2696
	b	.L2631
.L2620:
	ldr	r2, .L2819+44
	movw	r1, #10286
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2803
.L2691:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2692
.L2693:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2692:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2693
	b	.L2631
.L2619:
	ldr	r2, .L2819+48
	movw	r1, #10260
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2804
.L2688:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2689
.L2690:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2689:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2690
	b	.L2631
.L2618:
	ldr	r2, .L2819+52
	movw	r1, #10234
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2805
.L2685:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2686
.L2687:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2686:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2687
	b	.L2631
.L2617:
	ldr	r2, .L2819+56
	movw	r1, #10208
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2806
.L2682:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2683
.L2684:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2683:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2684
	b	.L2631
.L2616:
	ldr	r2, .L2819+60
	movw	r1, #10182
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2807
.L2679:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2680
.L2681:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2680:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2681
	b	.L2631
.L2615:
	ldr	r2, .L2819+64
	movw	r1, #10156
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2808
.L2676:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2677
.L2678:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2677:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2678
	b	.L2631
.L2614:
	ldr	r2, .L2819+68
	movw	r1, #10130
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2809
.L2673:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2674
.L2675:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2674:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2675
	b	.L2631
.L2613:
	str	r5, [sp]
	movw	r1, #10102
	ldr	r2, .L2819+72
	mov	r0, #18
	bl	dprint_normal
	cmp	r5, #0
	ble	.L2670
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2670
	mov	r8, #0
	b	.L2671
.L2672:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2670
.L2671:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2672
.L2670:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2631
	movw	r1, #10124
.L2784:
	ldr	r3, .L2819+108
	mov	r0, #18
	str	r1, [sp]
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2631
.L2612:
	cmp	r8, #4
	beq	.L2647
	ldr	r2, [fp, #-56]
	cmp	r2, #0
	bne	.L2647
	str	r5, [sp]
	movw	r1, #9974
	ldr	r2, .L2819+76
	mov	r0, #18
	bl	dprint_normal
.L2649:
	ldr	r0, [r4, #120]
	ldr	r8, [r4, #60]
	bl	GetUsd
	add	r8, r8, #132
	str	r0, [r4, r8, asl #2]
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	cmp	r1, #0
	beq	.L2736
	ldr	r2, [r4, #232]
	cmp	r5, #1024
	movlt	r9, r5
	movge	r9, #1024
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	ip, [r2, #68]
	cmp	r0, ip
	bcs	.L2737
	sxth	r3, r0
	mov	r8, #0
	mov	lr, r3, asl #5
	sub	r3, lr, r3, asl #2
	add	r2, r2, r3
.L2651:
	ldr	r3, [r2, #24]
	add	r0, r0, #1
	ldr	lr, [r2, #12]
	cmp	r0, ip
	add	r3, r3, #7
	add	r2, r2, #28
	sub	r3, lr, r3, lsr #3
	add	r8, r8, r3
	bne	.L2651
	mov	r3, r8
.L2650:
	ldrsb	r2, [fp, #-56]
	cmp	r3, r9
	movge	r8, r9
	cmp	r2, #1
	str	r2, [fp, #-64]
	movne	r10, #0
	strne	r10, [fp, #-60]
	beq	.L2810
.L2653:
	rsb	r2, r10, r8
	mov	r0, r4
	bl	MVC_GetBytes
	subs	r8, r0, #0
	ble	.L2811
	ldr	r3, [fp, #-60]
	rsb	r3, r3, r9
	cmp	r8, r3
	ldr	r3, [r4, #60]
	bge	.L2658
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r8, [r3, #1052]
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2659
	mov	r5, #0
	b	.L2660
.L2662:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2659
.L2660:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2662
.L2659:
	ldr	r3, [r4, #60]
	ldr	r1, [r4, #224]
	add	r3, r3, #132
	ldr	ip, .L2819+116
	ldr	r2, [fp, #-64]
	ldr	r3, [r4, r3, asl #2]
	ldrd	r0, [r1, #32]
	cmp	r2, #1
	add	r3, r3, #1056
	ldr	r5, [ip]
	moveq	r2, #8
	movne	r2, #9
	strd	r0, [r3]
	cmp	r5, #0
	ldr	r3, [r4, #60]
	add	r3, r3, #132
.L2786:
	ldr	r3, [r4, r3, asl #2]
	str	r2, [r3, #1040]
	ldr	r3, [r4, #60]
	ldr	r2, [r4, #84]
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r2, [r3, #1044]
	beq	.L2631
	ldr	r2, [r4, #60]
	movw	r3, #1064
	mov	r1, #5
	ldr	r0, [r4, #120]
	add	r2, r2, #132
	ldr	r2, [r4, r2, asl #2]
	blx	r5
	b	.L2631
.L2610:
	ldr	r2, .L2819+80
	movw	r1, #9910
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2812
.L2641:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2642
.L2643:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2642:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2643
	b	.L2631
.L2611:
	ldr	r2, .L2819+84
	movw	r1, #9936
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2813
.L2644:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2645
.L2646:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2645:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2646
	b	.L2631
.L2607:
	ldr	r2, .L2819+88
	movw	r1, #9845
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2814
.L2630:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2632
.L2633:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2632:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2633
	b	.L2631
.L2609:
	ldr	r2, .L2819+92
	movw	r1, #9871
	str	r5, [sp]
	mov	r0, #18
	bl	dprint_normal
	mov	r1, r5
	mov	r0, r4
	ldr	r8, [r4, #572]
	bl	MVC_DecPicTimingSEI
	ldr	r2, [r4, #572]
	mov	r9, r5, asl #3
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2635
	rsb	r9, r3, r9
	ldr	r3, [r4, #564]
	cmp	r9, #0
	add	r8, r9, #7
	movge	r8, r9
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2637
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2637
	mov	r10, #0
	b	.L2638
.L2639:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2637
.L2638:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r10, r10, #1
	ldr	r3, [r4, #564]
	cmp	r10, r8
	ldr	r2, [r4, #572]
	mov	r3, r3, asl #3
	bne	.L2639
.L2637:
	mov	r1, r9, asr #31
	mov	r0, r1, lsr #29
	add	r1, r9, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r3, r2
	bcs	.L2815
.L2635:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	movwlt	r1, #9904
	bge	.L2631
	b	.L2784
.L2606:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2816
.L2725:
	cmp	r5, #0
	ble	.L2631
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
	mov	r8, #0
	b	.L2726
.L2727:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2631
.L2726:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2727
	b	.L2631
.L2794:
	cmp	r3, #128
	bne	.L2733
	mov	r0, #0
	b	.L2817
.L2658:
	add	r3, r3, #132
	ldr	r2, [fp, #-60]
	cmp	r9, r5
	ldr	r3, [r4, r3, asl #2]
	rsb	r8, r2, r5
	str	r8, [r3, #1052]
	bcc	.L2818
.L2664:
	cmp	r8, #0
	ble	.L2659
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2659
	mov	r5, #0
	b	.L2666
.L2667:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2659
.L2666:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2667
	b	.L2659
.L2792:
	mov	r0, r6
	bl	BsSkip
	b	.L2719
.L2815:
	mov	r0, r6
	bl	BsSkip
	b	.L2635
.L2820:
	.align	2
.L2819:
	.word	.LC352
	.word	.LC353
	.word	.LC380
	.word	.LC381
	.word	.LC379
	.word	.LC378
	.word	.LC377
	.word	.LC376
	.word	.LC375
	.word	.LC374
	.word	.LC373
	.word	.LC372
	.word	.LC371
	.word	.LC370
	.word	.LC369
	.word	.LC368
	.word	.LC367
	.word	.LC366
	.word	.LC365
	.word	.LC360
	.word	.LC357
	.word	.LC358
	.word	.LC354
	.word	.LC356
	.word	.LC359
	.word	.LC361
	.word	.LC363
	.word	.LANCHOR0+276
	.word	.LC355
	.word	g_EventReportFunc
	.word	.LC362
	.word	.LC364
.L2818:
	rsb	r1, r9, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2664
	movw	r1, #10076
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2664
.L2647:
	str	r5, [sp]
	movw	r1, #9970
	ldr	r2, .L2819+96
	mov	r0, #18
	mov	ip, #1
	str	ip, [fp, #-56]
	bl	dprint_normal
	b	.L2649
.L2810:
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L2819+100
	strb	r3, [r1, #1026]
	mov	r1, #8
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	r10, [r4, r3, asl #2]
	bl	mvc_u_v
	strb	r0, [r10, #1027]
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	ldrb	r2, [r3, #1027]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L2654
	mov	r10, #3
	mov	r2, #0
	str	r10, [fp, #-60]
	strb	r2, [r3, #1028]
.L2655:
	ldr	r3, [r4, #60]
	mov	r1, #16
	ldr	r2, .L2819+104
	mov	r0, r4
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r3, [fp, #-68]
	bl	mvc_u_v
	ldr	r3, [fp, #-68]
	mov	r1, r10
	add	r3, r3, #1024
	strh	r0, [r3, #6]	@ movhi
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r8, r10
	ldr	r3, [r4, #60]
	beq	.L2656
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	b	.L2653
.L2808:
	movw	r1, #10162
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2676
.L2807:
	movw	r1, #10188
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2679
.L2806:
	movw	r1, #10214
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2682
.L2805:
	mov	r1, #10240
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2685
.L2804:
	movw	r1, #10266
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2688
.L2803:
	movw	r1, #10292
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2691
.L2809:
	movw	r1, #10136
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2673
.L2814:
	movw	r1, #9851
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2630
.L2816:
	movw	r1, #10564
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2725
.L2813:
	movw	r1, #9942
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2644
.L2812:
	movw	r1, #9916
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2641
.L2802:
	movw	r1, #10318
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2694
.L2801:
	movw	r1, #10344
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2697
.L2800:
	movw	r1, #10370
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2700
.L2799:
	movw	r1, #10396
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2703
.L2798:
	movw	r1, #10422
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2706
.L2797:
	movw	r1, #10448
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2709
.L2796:
	movw	r1, #10474
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2712
.L2795:
	movw	r1, #10500
	ldr	r3, .L2819+108
	str	r1, [sp]
	mov	r0, #18
	ldr	r2, .L2819+112
	bl	dprint_normal
	b	.L2715
.L2656:
	ldr	r1, [r4, #224]
	add	r3, r3, #132
	ldr	ip, .L2819+116
	mov	r2, #8
	ldr	r3, [r4, r3, asl #2]
	ldrd	r0, [r1, #32]
	add	r3, r3, #1056
	ldr	r5, [ip]
	strd	r0, [r3]
	cmp	r5, #0
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	b	.L2786
.L2737:
	mov	r3, #0
	mov	r8, r3
	b	.L2650
.L2654:
	ldr	r2, .L2819+120
	mov	r1, #8
	mov	r0, r4
	str	r3, [fp, #-68]
	bl	mvc_u_v
	ldr	r3, [fp, #-68]
	mov	r10, #4
	str	r10, [fp, #-60]
	strb	r0, [r3, #1028]
	b	.L2655
.L2736:
	mvn	r0, #0
	b	.L2599
.L2811:
	ldr	r2, .L2819+124
	movw	r1, #10040
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #60]
	ldr	r0, [r4, #120]
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	bl	FreeUsdByDec
	ldr	r3, [r4, #60]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #132
	str	r2, [r4, r3, asl #2]
	b	.L2599
	UNWIND(.fnend)
	.size	MVC_DecSEI, .-MVC_DecSEI
	.align	2
	.global	MVC_InitOldSlice
	.type	MVC_InitOldSlice, %function
MVC_InitOldSlice:
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
	ldr	r1, [r0, #40]
	add	r3, r0, #11075584
	add	r3, r3, #40960
	movw	r2, #23352
	movt	r2, 1
	mov	r0, #2
	str	r1, [r3, #2316]
	mov	r1, #7
	str	r2, [r3, #2320]
	mov	r2, #32
	strb	r1, [r3, #2307]
	mov	r1, #3
	strb	r2, [r3, #2306]
	mvn	r2, #0
	str	r1, [r3, #2328]
	mov	r1, #1048576
	str	r2, [r3, #2332]
	mov	r2, #0
	strb	r0, [r3, #2305]
	str	r1, [r3, #2344]
	strb	r2, [r3, #2304]
	str	r2, [r3, #2336]
	str	r2, [r3, #2340]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_InitOldSlice, .-MVC_InitOldSlice
	.align	2
	.global	MVC_IsNewPicNal
	.type	MVC_IsNewPicNal, %function
MVC_IsNewPicNal:
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
	b	.L2830
.L2825:
	.word	.L2824
	.word	.L2830
	.word	.L2830
	.word	.L2830
	.word	.L2824
	.word	.L2830
	.word	.L2826
	.word	.L2826
.L2826:
	ldr	r0, [r0]
	mov	r3, #1
	str	r3, [r5]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2824:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L2827
.L2829:
	mvn	r0, #0
.L2828:
	mov	r3, #0
	str	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2830:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2827:
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
	bhi	.L2829
	mov	r0, r0, asl #1
	rsb	r0, r0, #31
	mov	r0, r4, lsr r0
	subs	r0, r0, #1
	mvnne	r0, #0
	b	.L2828
	UNWIND(.fnend)
	.size	MVC_IsNewPicNal, .-MVC_IsNewPicNal
	.align	2
	.global	MVC_FindZeroBitsInSeg
	.type	MVC_FindZeroBitsInSeg, %function
MVC_FindZeroBitsInSeg:
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
	ble	.L2857
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2845
	ldr	r5, .L2858
	ldr	r10, .L2858+4
.L2843:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2858
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
	bne	.L2835
	ldr	r2, .L2858
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2838
	b	.L2836
.L2839:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2836
.L2838:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2839
.L2835:
	mov	r0, r4, asl #3
.L2834:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2847
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2847
.L2842:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2840
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2842
	b	.L2840
.L2836:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2843
	b	.L2835
.L2847:
	mov	r3, #0
.L2840:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2857:
	mov	r3, r1
	ldr	r2, .L2858+8
	movw	r1, #10971
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2845:
	mov	r0, r4
	b	.L2834
.L2859:
	.align	2
.L2858:
	.word	.LANCHOR3-1952
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC382
	UNWIND(.fnend)
	.size	MVC_FindZeroBitsInSeg, .-MVC_FindZeroBitsInSeg
	.align	2
	.global	MVC_FindTrailZeros
	.type	MVC_FindTrailZeros, %function
MVC_FindTrailZeros:
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
	beq	.L2866
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2865
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #36]
	bl	MVC_FindZeroBitsInSeg
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #40]
	cmp	r0, r2, asl #3
	bcs	.L2869
	cmn	r0, #1
	beq	.L2865
.L2864:
	add	r0, r0, #1
	str	r0, [r3, #72]
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2868
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #72]
	cmp	r2, r1, asl #3
	bcs	.L2870
.L2868:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2870:
	ldr	r1, [r3, #60]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r2, [r4, #232]
	mov	r3, #0
	mov	r1, #1
	mov	r0, r3
	str	r3, [r2, #36]
	ldr	r2, [r4, #232]
	str	r1, [r2, #68]
	ldr	r2, [r4, #232]
	str	r3, [r2, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2869:
	ldr	r1, [r3, #60]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #232]
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #36]
	ldr	r3, [r4, #232]
	str	r2, [r3, #68]
	ldr	r3, [r4, #232]
.L2865:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	MVC_FindZeroBitsInSeg
	ldr	r3, [r4, #232]
	b	.L2864
.L2866:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FindTrailZeros, .-MVC_FindTrailZeros
	.align	2
	.global	MVC_CombinePacket
	.type	MVC_CombinePacket, %function
MVC_CombinePacket:
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
	ldr	r3, [r0, #232]
	ldr	r3, [r3, #12]
	cmp	r3, #4096
	ldmcsfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_CombinePacket.part.11
	UNWIND(.fnend)
	.size	MVC_CombinePacket, .-MVC_CombinePacket
	.align	2
	.global	MVC_FindNaluArraySlot
	.type	MVC_FindNaluArraySlot, %function
MVC_FindNaluArraySlot:
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
	ldrb	r2, [r0, #937]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2878
	mov	r2, r0
	mov	r3, #1
	b	.L2876
.L2875:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2881
.L2876:
	ldrb	r1, [r2, #1025]	@ zero_extendqisi2
	add	r2, r2, #88
	cmp	r1, #0
	bne	.L2875
	mov	r2, r3
.L2874:
	mov	ip, #88
	mov	r1, #1
	mla	r3, ip, r3, r0
	mov	r0, r2
	strb	r1, [r3, #937]
	ldmfd	sp, {fp, sp, pc}
.L2881:
	mvn	r2, #0
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L2878:
	mov	r3, r2
	b	.L2874
	UNWIND(.fnend)
	.size	MVC_FindNaluArraySlot, .-MVC_FindNaluArraySlot
	.align	2
	.global	MVC_InquireSliceProperty
	.type	MVC_InquireSliceProperty, %function
MVC_InquireSliceProperty:
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
	ldr	r3, [r0, #68]
	mov	r4, r0
	mov	r9, r1
	mov	r7, r2
	movw	r1, #11246
	ldr	r2, .L2925
	sub	r3, r3, #1
	mov	r0, #20
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r7]
	add	r6, r4, #11075584
	str	r3, [r9]
	add	r5, r6, #40960
	ldr	r2, [r4, #232]
	add	r1, r4, #12288
	mvn	ip, #0
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	strb	r0, [r5, #651]
	ldrb	lr, [r2, #4]	@ zero_extendqisi2
	strb	lr, [r5, #656]
	ldrb	r2, [r2, #5]	@ zero_extendqisi2
	strb	r3, [r5, #659]
	str	ip, [r5, #2288]
	strb	r2, [r5, #660]
	ldrb	r3, [r1, #704]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2918
	cmp	r2, #255
	beq	.L2919
.L2884:
	mov	r0, r4
	bl	MVC_SliceCheck
	subs	r8, r0, #0
	bne	.L2900
	mov	r0, r4
	bl	MVC_ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L2920
	ldrb	r3, [r5, #653]	@ zero_extendqisi2
	mov	ip, #2240
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r9]
	ldrb	r1, [r5, #660]	@ zero_extendqisi2
	ldr	r2, [r5, #664]
	ldr	r0, [r4, #252]
	sxtb	r3, r1
	cmn	r3, #1
	mla	r2, ip, r2, r0
	beq	.L2921
	cmp	r1, #0
	bne	.L2896
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r2, #28]
	beq	.L2922
	ldr	r2, [r4, #28]
	cmp	r2, r3
	movweq	r3, #35364
	movteq	r3, 168
	addeq	r3, r4, r3
	bne	.L2923
.L2895:
	ldrb	r1, [r3, #20]	@ zero_extendqisi2
	add	r6, r6, #45056
	ldr	r0, [r3, #3952]
	rsb	r2, r1, #2
	ldr	r1, [r3, #3948]
	ldr	ip, [r4, #16]
	mla	r2, r0, r2, r2
	ldr	r0, [r4, #12]
	add	r1, r1, #1
	cmp	r0, r1
	cmpeq	ip, r2
	movne	r2, #1
	strne	r2, [r7]
	ldr	r2, [r3, #3972]
	ldr	r3, [r6, #2504]
	add	r3, r3, #1
	cmp	r2, r3
	movhi	r3, #1
	strhi	r3, [r7]
.L2892:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2918:
	strb	r3, [r5, #659]
	ldr	r3, [r1, #712]
	str	r3, [r5, #2288]
	ldrb	r3, [r1, #708]	@ zero_extendqisi2
	strb	r3, [r5, #657]
	ldrb	r3, [r1, #709]	@ zero_extendqisi2
	strb	r3, [r5, #658]
	b	.L2884
.L2921:
	ldr	r3, [r2, #28]
	movw	r1, #3992
	ldr	r2, [r4, #248]
	mla	r3, r1, r3, r2
	b	.L2895
.L2919:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L2884
	add	r3, r4, #10747904
	add	r3, r3, #20480
	ldr	r2, [r3, #2384]
	cmp	r2, #0
	bne	.L2887
	ldrb	r2, [r3, #2380]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2887
	add	r3, r4, #12992
	add	r3, r3, #16
.L2890:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L2888
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2924
.L2888:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L2890
	mvn	r3, #0
	b	.L2917
.L2922:
	movw	r2, #8500
	movt	r2, 5
	mla	r3, r2, r3, r4
	add	r3, r3, #286720
	add	r3, r3, #932
	b	.L2895
.L2887:
	ldr	r3, [r3, #2388]
.L2917:
	cmn	r3, #1
	str	r3, [r5, #2288]
	beq	.L2884
	sub	r0, r0, #5
	mov	r3, #1
	clz	r0, r0
	strb	r3, [r5, #659]
	strb	r3, [r5, #658]
	mov	r0, r0, lsr #5
	strb	r0, [r5, #657]
	b	.L2884
.L2900:
	mvn	r8, #0
	b	.L2892
.L2923:
	ldr	r2, .L2925+4
	movw	r1, #11313
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2892
.L2920:
	ldr	r2, .L2925+8
	movw	r1, #11291
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2892
.L2896:
	ldr	r2, .L2925+12
	movw	r1, #11322
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2892
.L2924:
	movw	r3, #8500
	movt	r3, 5
	mla	r3, r3, r2, r4
	add	r3, r3, #12992
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	b	.L2917
.L2926:
	.align	2
.L2925:
	.word	.LC383
	.word	.LC24
	.word	.LC384
	.word	.LC385
	UNWIND(.fnend)
	.size	MVC_InquireSliceProperty, .-MVC_InquireSliceProperty
	.align	2
	.global	MVC_HaveSliceToDec
	.type	MVC_HaveSliceToDec, %function
MVC_HaveSliceToDec:
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
	ldr	r0, [r0, #64]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_HaveSliceToDec, .-MVC_HaveSliceToDec
	.align	2
	.global	MVC_IsRefListWrong
	.type	MVC_IsRefListWrong, %function
MVC_IsRefListWrong:
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
	add	r5, r0, #11075584
	mov	r7, r0
	add	r5, r5, #40960
	ldr	r3, [r5, #696]
	cmp	r3, #0
	beq	.L2929
	add	r6, r0, #252
	mov	r4, #0
	b	.L2933
.L2930:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L2932
	ldr	r3, [r5, #696]
	cmp	r4, r3
	bcs	.L2955
.L2933:
	ldr	r3, [r6, #4]!
	add	r4, r4, #1
	ldr	r0, [r7, #120]
	ldr	r3, [r3, #4]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2930
.L2932:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2955:
	cmp	r3, #0
	beq	.L2929
	ldr	r3, [r5, #700]
	cmp	r3, #0
	addne	r6, r7, #384
	movne	r4, #0
	bne	.L2936
	b	.L2929
.L2956:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L2932
	ldr	r3, [r5, #700]
	cmp	r4, r3
	bcs	.L2929
.L2936:
	ldr	r3, [r6, #4]!
	add	r4, r4, #1
	ldr	r0, [r7, #120]
	ldr	r3, [r3, #4]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2956
	b	.L2932
.L2929:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_IsRefListWrong, .-MVC_IsRefListWrong
	.align	2
	.global	MVC_DEC_RecycleImage
	.type	MVC_DEC_RecycleImage, %function
MVC_DEC_RecycleImage:
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
	ldr	r2, .L2968
	mov	r5, r0
	mov	r8, r1
	mov	r0, #3
	movw	r1, #11706
	bl	dprint_normal
	mov	r1, r8
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L2962
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L2962
	add	r4, r0, #200
	add	r9, r0, #232
	mov	r6, #0
	mov	r7, #0
.L2960:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L2967
.L2959:
	cmp	r4, r9
	bne	.L2960
	ldr	r0, [r5, #120]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2967:
	mov	r1, r2
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L2959
.L2962:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2969:
	.align	2
.L2968:
	.word	.LC386
	UNWIND(.fnend)
	.size	MVC_DEC_RecycleImage, .-MVC_DEC_RecycleImage
	.align	2
	.global	MVC_OutputFrmToVO
	.type	MVC_OutputFrmToVO, %function
MVC_OutputFrmToVO:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r2
	mov	r4, r0
	moveq	r3, #1
	movne	r3, #0
	mov	r5, r1
	beq	.L3011
	ldr	r2, [r0, #224]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L2973
	ldrb	r2, [r0, #8]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L2973
	ldr	r2, [r0, #520]
	cmp	r2, #0
	strneb	r3, [r2, #2]
	movne	r0, #1
	strne	r3, [r4, #520]
	beq	.L2975
.L3010:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2973:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_CheckFrameStore
	cmn	r0, #3
	beq	.L2975
	ldr	r1, [r4, #520]
	cmp	r1, #0
	beq	.L2976
	mov	r0, r4
	bl	MVC_GetImagePara
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_CheckFrameStore
	subs	r7, r0, #0
	beq	.L3012
	cmn	r7, #3
	beq	.L2984
	movw	r3, #1543
	str	r7, [sp]
	mov	r1, r3
	ldr	r2, .L3020
	mov	r0, #1
	sub	r7, r7, #1
	bl	dprint_normal
	ldr	r3, [r4, #520]
	mov	r0, r4
	clz	r7, r7
	ldr	r1, [r3, #160]
	mov	r7, r7, lsr #5
	bl	MVC_DEC_RecycleImage
.L2983:
	ldr	r3, [r4, #520]
	mov	r0, #0
	strb	r0, [r3, #2]
	ldr	r3, [r4, #520]
	cmp	r5, r3
	movne	r7, #0
	andeq	r7, r7, #1
	cmp	r7, r0
	strne	r0, [r4, #520]
	bne	.L3010
.L2985:
	mov	r3, #0
	str	r3, [r4, #520]
.L2976:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	MVC_CheckFrameStore
	cmp	r0, #0
	beq	.L3013
	movw	r3, #1596
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3020
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #160]
	mov	r0, r4
	bl	MVC_DEC_RecycleImage
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3011:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L3020+4
	movw	r1, #1480
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3013:
	ldrsb	r1, [r5, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3014
	cmp	r6, #1
	mov	r2, #1
	streq	r6, [r7, #108]
	ldrsb	r1, [r5, #6]
	ldr	r0, [r4, #120]
	bl	FSP_SetDisplay
	ldr	r0, [r4, #120]
	add	r3, r4, #584
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #15
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3015
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #16]
	bcs	.L3016
.L2991:
	ldr	r2, [r4, #144]
	mov	r0, #0
	ldr	r3, [r4, #136]
	add	r2, r2, #1
	str	r2, [r4, #144]
	add	r3, r3, #2
	str	r3, [r4, #136]
	b	.L3010
.L2975:
	mov	r0, #1
	b	.L3010
.L2984:
	ldr	r3, [r4, #520]
	mov	r2, #0
	strb	r2, [r3, #2]
	b	.L2985
.L3012:
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3017
	ldr	r3, [r4, #520]
	mov	r2, #1
	cmp	r5, r3
	cmpeq	r6, #1
	moveq	r3, #1
	streq	r3, [r7, #108]
	ldreq	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	ldr	r0, [r4, #120]
	add	r3, r4, #584
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #15
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3018
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #16]
	bcs	.L3019
.L2982:
	ldr	r2, [r4, #144]
	mov	r7, #1
	ldr	r3, [r4, #136]
	add	r2, r2, r7
	str	r2, [r4, #144]
	add	r3, r3, #2
	str	r3, [r4, #136]
	b	.L2983
.L3016:
	mov	r1, r7
	mov	r0, r4
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L2991
.L3019:
	mov	r1, r7
	mov	r0, r4
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L2982
.L3015:
	mov	r3, r0
	ldr	r2, .L3020+8
	mov	r1, #1584
	mov	r0, #0
	bl	dprint_normal
	ldrsb	r1, [r5, #6]
	mov	r2, #0
	ldr	r0, [r4, #120]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3010
.L3018:
	mov	r3, r0
	ldr	r2, .L3020+8
	movw	r1, #1528
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r4, #520]
	mov	r5, #0
	mov	r2, r5
	strb	r5, [r3, #2]
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	str	r5, [r4, #520]
	mov	r0, r4
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3010
.L3014:
	movw	r3, #1569
	ldr	r2, .L3020+12
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L3010
.L3017:
	movw	r3, #1513
	ldr	r2, .L3020+12
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L3010
.L3021:
	.align	2
.L3020:
	.word	.LC390
	.word	.LC387
	.word	.LC389
	.word	.LC388
	UNWIND(.fnend)
	.size	MVC_OutputFrmToVO, .-MVC_OutputFrmToVO
	.align	2
	.global	MVC_OutputFrmFromDPB
	.type	MVC_OutputFrmFromDPB, %function
MVC_OutputFrmFromDPB:
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
	cmp	r1, #15
	mov	r5, r1
	mov	r6, r0
	bhi	.L3026
	add	r4, r0, r1, lsl #2
	add	r4, r4, #11075584
	add	r4, r4, #45056
	ldr	r3, [r4, #2312]
	cmp	r3, #0
	moveq	r4, r3
	beq	.L3024
	mov	r2, #0
	strb	r2, [r3, #5]
	ldr	r1, [r4, #2312]
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #2312]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	cmp	r3, #0
	rsb	r4, r0, #0
	beq	.L3027
.L3024:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3027:
	mov	r0, r6
	mov	r1, r5
	bl	MVC_RemoveFrameStoreOutDPB
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3026:
	ldr	ip, .L3028
	movw	r3, #1610
	str	r1, [sp, #4]
	mov	r0, #0
	mov	r1, r3
	ldr	r2, .L3028+4
	str	ip, [sp]
	mvn	r4, #0
	bl	dprint_normal
	b	.L3024
.L3029:
	.align	2
.L3028:
	.word	.LANCHOR0+288
	.word	.LC391
	UNWIND(.fnend)
	.size	MVC_OutputFrmFromDPB, .-MVC_OutputFrmFromDPB
	.align	2
	.global	MVC_FlushDPB
	.type	MVC_FlushDPB, %function
MVC_FlushDPB:
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
	mov	r4, r1
	beq	.L3049
	add	r8, r5, #11075584
	add	r8, r8, #45056
	ldr	r3, [r8, #2504]
	cmp	r3, #0
	movwne	r7, #47364
	movne	r6, #0
	movtne	r7, 169
	addne	r7, r5, r7
	beq	.L3037
.L3036:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	cmp	r1, #0
	beq	.L3035
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3035
	ldr	r3, [r1, #56]
	cmn	r4, #1
	cmpne	r3, r4
	bne	.L3035
	mov	r0, r5
	bl	MVC_UnMarkFrameStoreRef
.L3035:
	ldr	r3, [r8, #2504]
	cmp	r3, r6
	bhi	.L3036
.L3037:
	mov	r1, r4
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
	ldr	r0, [r8, #2504]
	cmp	r0, #0
	beq	.L3034
	movw	r1, #47364
	mov	r7, #0
	movt	r1, 169
	add	r1, r5, r1
	mov	r2, r7
	mvn	r6, #0
.L3041:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L3039
	ldr	r3, [r3, #56]
	cmn	r4, #1
	cmpne	r4, r3
	addeq	r7, r7, #1
	cmp	r4, r3
	cmnne	r4, #1
	movne	r6, r3
.L3039:
	cmp	r2, r0
	bne	.L3041
	cmp	r7, #0
	beq	.L3034
	adds	r8, r6, #1
	movne	r8, #1
	cmp	r4, r6
	movle	r9, #0
	andgt	r9, r8, #1
	b	.L3047
.L3048:
	subs	r7, r7, #1
	beq	.L3034
.L3047:
	cmp	r9, #0
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r1, r6
	mov	r0, r5
	beq	.L3044
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3034
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3049
.L3044:
	mov	r1, r4
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3034
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3049
	cmp	r4, r6
	movge	r3, #0
	andlt	r3, r8, #1
	cmp	r3, #0
	beq	.L3048
	mov	r1, r6
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3034
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	beq	.L3048
.L3049:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3034:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FlushDPB, .-MVC_FlushDPB
	.align	2
	.global	MVC_AdaptiveMemMark
	.type	MVC_AdaptiveMemMark, %function
MVC_AdaptiveMemMark:
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
	add	r10, r0, #11141120
	add	r9, r10, #8192
	add	r8, r0, #11075584
	movw	r7, #11192
	add	r8, r8, #36864
	ldr	r4, [r9, #3556]
	movt	r7, 170
	add	r7, r0, r7
	mov	r5, r0
	add	r6, r4, #2000
	add	r4, r4, #4
	add	r6, r6, #4
	add	r3, r0, #11075584
	str	r3, [fp, #-48]
.L3096:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L3087
.L3089:
	.word	.L3088
	.word	.L3090
	.word	.L3091
	.word	.L3092
	.word	.L3093
	.word	.L3094
	.word	.L3095
.L3095:
	ldr	r2, [r4, #12]
	mov	r1, r7
	mov	r0, r5
	bl	MVC_MarkCurrPicLT
.L3087:
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L3096
.L3088:
	ldrb	r3, [r8, #3608]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r0, #0
	beq	.L3104
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3094:
	mov	r0, r5
	bl	MVC_UnMarkAllSTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r1, #0
	mov	r0, r5
	bl	MVC_UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	mov	r3, #1
	strb	r3, [r8, #3608]
	b	.L3087
.L3093:
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	MVC_UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3087
.L3092:
	ldr	r3, [r4, #12]
	mov	r1, r7
	ldr	r2, [r4, #4]
	mov	r0, r5
	bl	MVC_MarkSTToLTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3087
.L3091:
	mov	r0, r5
	ldr	r2, [r4, #8]
	mov	r1, r7
	bl	MVC_UnMarkLTRef
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3087
.L3090:
	mov	r0, r5
	ldr	r2, [r4, #4]
	mov	r1, r7
	bl	MVC_UnMarkSTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	b	.L3087
.L3104:
	ldr	r3, [fp, #-48]
	mov	r2, #0
	str	r2, [r9, #3560]
	add	r10, r10, #12288
	add	r1, r3, #40960
	movw	r3, #26790
	movt	r3, 42
	ldr	r1, [r1, #2292]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	str	r2, [r10, #192]
	ldrb	r3, [r9, #3003]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3099
	bcc	.L3100
	cmp	r3, #2
	streq	r2, [r9, #3584]
	streq	r2, [r9, #3572]
	streq	r2, [r8, #3636]
	streq	r2, [r8, #3644]
.L3098:
	ldr	r1, [r9, #3632]
	mov	r0, r5
	bl	MVC_FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3100:
	ldr	r1, [r9, #3572]
	ldr	r2, [r9, #3580]
	ldr	r3, [r9, #3584]
	rsb	r2, r1, r2
	str	r2, [r9, #3580]
	rsb	r3, r1, r3
	str	r3, [r9, #3584]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r9, #3576]
	str	r3, [r9, #3572]
	ldr	r1, [r8, #3644]
	ldr	r2, [r8, #3632]
	ldr	r3, [r8, #3636]
	rsb	r2, r1, r2
	str	r2, [r8, #3632]
	rsb	r3, r1, r3
	str	r3, [r8, #3636]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r8, #3640]
	str	r3, [r8, #3644]
	b	.L3098
.L3099:
	str	r2, [r9, #3580]
	str	r2, [r9, #3572]
	str	r2, [r8, #3632]
	str	r2, [r8, #3644]
	b	.L3098
	UNWIND(.fnend)
	.size	MVC_AdaptiveMemMark, .-MVC_AdaptiveMemMark
	.align	2
	.global	MVC_IDRMemMarking
	.type	MVC_IDRMemMarking, %function
MVC_IDRMemMarking:
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
	add	r6, r0, #11141120
	add	r6, r6, #8192
	mov	r7, r0
	ldr	r3, [r6, #3556]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3106
	ldr	lr, [r0, #52]
	cmp	lr, #0
	beq	.L3115
	movw	r1, #47364
	mov	r2, #0
	movt	r1, 169
	add	r0, r0, #148
	add	r1, r7, r1
	mov	r4, r2
.L3114:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L3111
	ldr	ip, [r3, #16]
	cmp	ip, #1
	streqb	ip, [r7, #6]
	ldr	ip, [r3, #56]
	ldr	r3, [r6, #3632]
	cmp	ip, r3
	streq	r4, [r0]
.L3111:
	cmp	r2, lr
	add	r0, r0, #4
	bne	.L3114
.L3115:
	add	r10, r7, #11075584
	add	r3, r10, #45056
	ldr	r9, [r3, #2504]
	cmp	r9, #0
	beq	.L3109
	movw	r4, #47364
	mov	r5, #0
	movt	r4, 169
	str	r10, [fp, #-48]
	add	r4, r7, r4
	mov	r8, r5
	mov	r10, r3
	b	.L3120
.L3118:
	cmp	r5, r9
	beq	.L3133
.L3120:
	ldr	r1, [r4, #4]!
	add	r5, r5, #1
	cmp	r1, #0
	beq	.L3118
	ldr	r0, [r1, #56]
	ldr	r2, [r6, #3632]
	cmp	r0, r2
	bne	.L3118
	strb	r8, [r1, #610]
	mov	r2, #0
	strb	r8, [r1, #609]
	ldr	r1, [r4]
	strb	r8, [r1, #646]
	strb	r8, [r1, #645]
	ldr	r1, [r4]
	strb	r8, [r1, #682]
	strb	r8, [r1, #681]
	ldr	r1, [r4]
	strb	r8, [r1, #3]
	ldr	r1, [r4]
	ldr	r0, [r7, #120]
	ldrsb	r1, [r1, #6]
	bl	FSP_SetRef
	ldr	r1, [r4]
	mov	r3, #1
	movw	r2, #47576
	movt	r2, 169
	strb	r8, [r1, #2]
	ldr	r1, [r4]
	strb	r8, [r1, #5]
	ldr	r1, [r4]
	strb	r3, [r1, #7]
	ldr	r0, [r4]
	ldr	r1, [r0, #52]
	add	r1, r7, r1
	add	r2, r1, r2
	strb	r8, [r2, #4]
	ldrsb	r1, [r0, #6]
	ldr	r0, [r7, #120]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L3119
	ldr	r1, [r4]
	ldr	r0, [r7, #120]
	ldrsb	r1, [r1, #6]
	bl	FSP_SetDisplay
.L3119:
	str	r8, [r4]
	cmp	r5, r9
	str	r8, [r4, #64]
	str	r8, [r4, #128]
	ldr	r2, [r10, #2508]
	sub	r2, r2, #1
	str	r2, [r10, #2508]
	bne	.L3120
.L3133:
	ldr	r10, [fp, #-48]
.L3109:
	mov	r0, r7
	bl	MVC_UpdateReflist
	mov	r0, r7
	bl	MVC_UpdateLTReflist
	ldr	r3, [r6, #3556]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3134
	add	r10, r10, #45056
	mov	r0, r3
	mov	r2, #1
	str	r3, [r10, #2520]
	strb	r3, [r6, #3004]
	strb	r2, [r6, #3005]
.L3121:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3134:
	add	r10, r10, #45056
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r10, #2520]
	strb	r2, [r6, #3004]
	str	r3, [r6, #3564]
	strb	r3, [r6, #3005]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3106:
	ldr	r1, [r6, #3632]
	bl	MVC_FlushDPB
	cmp	r0, #0
	addeq	r10, r7, #11075584
	beq	.L3109
.L3122:
	mvn	r0, #0
	b	.L3121
	UNWIND(.fnend)
	.size	MVC_IDRMemMarking, .-MVC_IDRMemMarking
	.align	2
	.global	MVC_Marking
	.type	MVC_Marking, %function
MVC_Marking:
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
	add	r3, r0, #11075584
	add	r5, r0, #11141120
	add	r3, r3, #36864
	add	r4, r5, #8192
	mov	r2, #0
	mov	r6, r0
	strb	r2, [r3, #3608]
	ldrb	r2, [r4, #3003]	@ zero_extendqisi2
	sub	r2, r2, #2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r3, #3609]
	ldrb	r3, [r4, #3006]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3136
	ldrb	r3, [r4, #3012]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3137
	ldr	r3, [r0, #224]
	ldr	r2, [r3, #632]
	cmp	r2, #1
	beq	.L3158
.L3137:
	ldr	r3, [r4, #3556]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #3568]
	beq	.L3159
	cmp	r3, #0
	bne	.L3160
.L3144:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3159:
	cmp	r3, #0
	beq	.L3144
.L3143:
	ldrb	r7, [r4, #3001]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L3161
.L3147:
	add	r5, r5, #8192
	mov	r0, #0
	ldrb	r3, [r5, #3004]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r5, #3005]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3158:
	ldr	r2, [r3, #628]
	cmp	r2, #0
	bne	.L3137
	ldr	r2, [r3, #636]
	cmp	r2, #0
	bne	.L3137
	ldr	r3, [r3, #592]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L3137
.L3136:
	mov	r0, r6
	bl	MVC_IDRMemMarking
	cmp	r0, #0
	bne	.L3138
.L3145:
	ldrb	r3, [r4, #3006]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3140
	ldr	r3, [r4, #3568]
	cmp	r3, #0
	beq	.L3144
	ldr	r3, [r4, #3556]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3143
	b	.L3147
.L3161:
	mov	r0, r6
	bl	MVC_SlidingWinMark
	ldr	r3, [r4, #3556]
	strb	r7, [r3]
	strb	r7, [r4, #3004]
.L3140:
	ldr	r3, [r4, #3568]
	cmp	r3, #0
	bne	.L3147
	b	.L3144
.L3160:
	mov	r0, r6
	bl	MVC_AdaptiveMemMark
	ldr	r3, [r4, #3556]
	mov	r2, #0
	strb	r2, [r3]
	cmp	r0, r2
	beq	.L3145
.L3138:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_Marking, .-MVC_Marking
	.align	2
	.global	MVC_DirectOutput
	.type	MVC_DirectOutput, %function
MVC_DirectOutput:
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
	add	r5, r0, #11141120
	add	r5, r5, #8192
	mov	r4, r0
	ldrb	r6, [r5, #3003]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L3164
	bcc	.L3165
	cmp	r6, #2
	beq	.L3166
	mov	r6, #0
.L3163:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3166:
	ldr	r3, [r5, #3552]
	mov	r2, #3
	strb	r2, [r3, #608]
	ldrb	r2, [r5, #3001]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3243
	ldr	r0, [r0, #520]
	add	r1, r5, #3008
	mov	r2, #536
	add	r1, r1, #8
	cmp	r0, #0
	ldreq	r3, [r5, #3552]
	streq	r3, [r4, #520]
	streq	r3, [r3, #684]
	ldreq	r0, [r4, #520]
	add	r3, r0, #288
	add	ip, r0, #304
	add	r0, r0, #72
	ldrd	r8, [r3]
	ldrd	r6, [r3, #-8]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip, #-8]
	bl	memcpy
	mvn	r3, #0
	cmp	r7, r3
	mvn	r2, #0
	cmpeq	r6, r2
	ldrne	r3, [r4, #520]
	addne	r3, r3, #288
	strned	r6, [r3, #-8]
.L3190:
	movw	r3, #11424
	ldrd	r6, [fp, #-52]
	movt	r3, 170
	ldr	r2, [r4, #520]
	ldrd	r0, [r4, r3]
	movw	r3, #11440
	add	r2, r2, #288
	movt	r3, 170
	cmp	r1, r7
	add	r3, r4, r3
	cmpeq	r0, r6
	mov	ip, #2
	movhi	r0, r6
	movhi	r1, r7
	strd	r0, [r2]
	ldrd	r0, [r3, #-8]
	ldr	r2, [r4, #520]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r2, #304
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3, #-8]
	mov	r0, #3
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #3002]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #2]
	ldr	r2, [r4, #520]
	ldrb	r1, [r5, #3012]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r4, #520]
	strb	ip, [r3, #680]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #608]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3604]
	str	r2, [r3, #704]
	ldr	r2, [r4, #520]
	ldr	r3, [r2, #704]
	ldr	r1, [r2, #668]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #632]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #632]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #684]
	str	r2, [r3, #612]
	ldrb	r3, [r5, #3007]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #520]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	beq	.L3240
.L3195:
	strb	r2, [r3, #4]
	mov	r2, #0
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #3572]
	str	r1, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r2, #0
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, #0
	mov	r6, r0
	bne	.L3234
	b	.L3196
.L3165:
	ldr	r3, [r5, #3552]
	mov	r2, #0
	strb	r2, [r3, #608]
	ldr	r1, [r0, #520]
	cmp	r1, r2
	beq	.L3167
	bl	MVC_OutputFrmToVO
	cmp	r0, #0
	bne	.L3244
.L3168:
	ldr	r3, [r4, #520]
	cmp	r3, #0
	beq	.L3167
	ldr	r3, [r5, #3552]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
.L3167:
	ldr	r3, [r5, #3552]
	mov	r0, #3
	mov	r7, #0
	add	r1, r5, #3008
	add	r1, r1, #8
	mov	r2, #536
	str	r3, [r4, #520]
	str	r3, [r3, #612]
	ldr	r3, [r4, #520]
	ldr	ip, [r5, #3552]
	str	ip, [r3, #648]
	ldr	r3, [r4, #520]
	ldr	ip, [r5, #3552]
	str	ip, [r3, #684]
	ldr	r3, [r4, #520]
	ldrb	ip, [r5, #3002]	@ zero_extendqisi2
	strb	ip, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #3]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #7]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #3604]
	mov	r2, r7
	str	r1, [r3, #632]
	str	r1, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #608]
	ldr	r3, [r4, #520]
	ldrb	r1, [r5, #3012]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r4, #520]
	ldrb	r1, [r5, #3009]	@ zero_extendqisi2
	str	r1, [r3, #40]
	ldrb	r1, [r5, #3007]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	cmp	r1, #1
	moveq	r6, #3
	strb	r6, [r3, #4]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #3572]
	str	r1, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #3632]
	str	r1, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #3636]
	str	r1, [r3, #60]
	ldr	r3, [r4, #520]
.L3239:
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_SetRef
	mov	r2, r7
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, r7
	mov	r6, r0
	beq	.L3196
.L3234:
	ldr	r3, [r5, #3552]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
.L3196:
	mov	r3, #0
	mov	r0, r6
	str	r3, [r4, #520]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3164:
	ldr	r3, [r5, #3552]
	mov	r2, #3
	strb	r2, [r3, #608]
	ldrb	r2, [r5, #3001]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3172
	ldr	r1, [r0, #520]
	cmp	r1, #0
	beq	.L3173
	bl	MVC_OutputFrmToVO
	ldr	r3, [r5, #3552]
	str	r3, [r4, #520]
	str	r3, [r3, #648]
	mov	r6, r0
.L3174:
	ldr	r3, [r4, #520]
	mov	r8, #1
	ldrb	r0, [r5, #3002]	@ zero_extendqisi2
	mov	r7, #0
	add	r1, r5, #3008
	mov	r2, #536
	add	r1, r1, #8
	strb	r0, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #7]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #3]
	ldr	r3, [r4, #520]
	ldrb	r0, [r5, #3012]	@ zero_extendqisi2
	strb	r0, [r3]
	ldr	r3, [r4, #520]
	str	r7, [r3, #40]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3604]
	str	r2, [r3, #668]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #668]
	str	r2, [r3, #632]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #644]
	ldrb	r3, [r5, #3007]	@ zero_extendqisi2
	ldr	r2, [r4, #520]
	rsb	r3, r8, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #4]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3572]
	str	r2, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3632]
	str	r2, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3636]
	str	r2, [r3, #60]
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, r8
	bne	.L3163
.L3236:
	ldr	r3, [r4, #520]
	mov	r2, r7
	b	.L3239
.L3172:
	ldr	r0, [r0, #520]
	add	r1, r5, #3008
	add	r1, r1, #8
	mov	r2, #536
	cmp	r0, #0
	ldreq	r3, [r5, #3552]
	streq	r3, [r4, #520]
	streq	r3, [r3, #648]
	ldreq	r0, [r4, #520]
	add	ip, r0, #288
	add	lr, r0, #304
	ldr	r3, [ip, #-8]
	add	r0, r0, #72
	ldrd	r8, [ip]
	ldrd	r6, [lr, #-8]
	ldr	r10, [ip, #-4]
	str	r3, [fp, #-52]
	bl	memcpy
	movw	r2, #11424
	ldr	r3, [fp, #-52]
	movt	r2, 170
	add	r2, r4, r2
	and	r1, r3, r10
	mov	ip, #1
	ldmdb	r2, {r0, r2}
	and	r0, r0, r2
	adds	r2, r1, #1
	movne	r2, #1
	cmn	r0, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #520]
	strne	r3, [r2, #280]
	movw	r3, #11424
	movt	r3, 170
	strne	r10, [r2, #284]
	ldrd	r0, [r4, r3]
	movw	r3, #11440
	ldr	r2, [r4, #520]
	movt	r3, 170
	cmp	r1, r9
	add	r3, r4, r3
	cmpeq	r0, r8
	add	r2, r2, #288
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r2]
	ldrd	r0, [r3, #-8]
	ldr	r2, [r4, #520]
	cmp	r1, r7
	cmpeq	r0, r6
	add	r3, r2, #304
	movhi	r0, r6
	movhi	r1, r7
	strd	r0, [r3, #-8]
	mov	r0, #3
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #3002]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #2]
	ldr	r2, [r4, #520]
	ldrb	r1, [r5, #3012]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r4, #520]
	strb	ip, [r3, #644]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #608]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3604]
	str	r2, [r3, #668]
	ldr	r2, [r4, #520]
	ldr	r3, [r2, #704]
	ldr	r1, [r2, #668]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #632]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #632]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #648]
	str	r2, [r3, #612]
	ldrb	r3, [r5, #3007]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #520]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	bne	.L3195
.L3240:
	orr	r2, r2, ip
	b	.L3195
.L3243:
	ldr	r1, [r0, #520]
	cmp	r1, #0
	beq	.L3185
	bl	MVC_OutputFrmToVO
	ldr	r3, [r5, #3552]
	str	r3, [r4, #520]
	str	r3, [r3, #684]
	mov	r6, r0
.L3186:
	ldr	r3, [r4, #520]
	mov	r8, #2
	ldrb	r0, [r5, #3002]	@ zero_extendqisi2
	mov	r7, #0
	add	r1, r5, #3008
	mov	r2, #536
	add	r1, r1, #8
	strb	r0, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #7]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #3]
	ldr	r3, [r4, #520]
	ldrb	r0, [r5, #3012]	@ zero_extendqisi2
	strb	r0, [r3]
	ldr	r3, [r4, #520]
	str	r7, [r3, #40]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3604]
	str	r2, [r3, #704]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #704]
	str	r2, [r3, #632]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #680]
	ldrb	r2, [r5, #3007]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	cmp	r2, #1
	movne	r2, r7
	moveq	r2, r8
	strb	r2, [r3, #4]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3572]
	str	r2, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3632]
	str	r2, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #3636]
	str	r2, [r3, #60]
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3236
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3244:
	movw	r1, #2087
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #20
	ldr	r3, .L3245
	ldr	r2, .L3245+4
	bl	dprint_normal
	b	.L3168
.L3185:
	ldr	r3, [r5, #3552]
	mov	r6, r1
	str	r3, [r0, #520]
	str	r3, [r3, #684]
	b	.L3186
.L3173:
	ldr	r3, [r5, #3552]
	mov	r6, r1
	str	r3, [r0, #520]
	str	r3, [r3, #648]
	b	.L3174
.L3246:
	.align	2
.L3245:
	.word	.LANCHOR0+312
	.word	.LC392
	UNWIND(.fnend)
	.size	MVC_DirectOutput, .-MVC_DirectOutput
	.align	2
	.global	MVC_DEC_FlushRemainImg
	.type	MVC_DEC_FlushRemainImg, %function
MVC_DEC_FlushRemainImg:
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
	add	r6, r0, #11075584
	add	r6, r6, #45056
	mov	r5, r0
	ldr	r3, [r6, #2504]
	cmp	r3, #0
	beq	.L3248
	movw	r7, #47364
	mov	r4, #0
	movt	r7, 169
	add	r7, r0, r7
	mov	r8, r4
	mov	r9, r7
	b	.L3250
.L3249:
	ldr	r3, [r6, #2504]
	cmp	r3, r8
	bls	.L3283
.L3250:
	ldr	r3, [r9, #4]!
	add	r8, r8, #1
	cmp	r3, #0
	beq	.L3249
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3249
	ldrsb	r1, [r3, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L3249
	ldr	r3, [r0, #20]
	sub	r3, r3, #1
	cmp	r3, #1
	ldr	r3, [r6, #2504]
	addls	r4, r4, #1
	cmp	r3, r8
	bhi	.L3250
.L3283:
	cmp	r4, #0
	bne	.L3254
	b	.L3251
.L3252:
	ldr	r1, [r5, r3, asl #2]
	bl	MVC_OutputFrmToVO
	subs	r4, r4, #1
	beq	.L3282
.L3254:
	sub	r3, fp, #44
	sub	r2, fp, #40
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	movw	r3, #28226
	mov	r2, r4
	cmn	r1, #1
	movt	r3, 42
	mov	r0, r5
	add	r3, r1, r3
	bne	.L3252
.L3282:
	ldr	r3, [r6, #2504]
.L3251:
	cmp	r3, #0
	movne	r4, #0
	bne	.L3256
	b	.L3248
.L3255:
	ldr	r3, [r6, #2504]
	cmp	r3, r4
	bls	.L3248
.L3256:
	ldr	r1, [r7, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3255
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3255
	mov	r0, r5
	bl	MVC_UnMarkFrameStoreRef
	ldr	r3, [r6, #2504]
	cmp	r3, r4
	bhi	.L3256
.L3248:
	mov	r0, r5
	mvn	r1, #0
	bl	MVC_RemoveUnUsedFrameStore
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_DEC_FlushRemainImg, .-MVC_DEC_FlushRemainImg
	.align	2
	.global	MVC_InitDPB
	.type	MVC_InitDPB, %function
MVC_InitDPB:
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
	subs	r4, r0, #0
	beq	.L3301
	bl	MVC_ClearAllSlice
	movw	r7, #47368
	movw	r6, #47496
	movw	r5, #47432
	movt	r7, 169
	movt	r6, 169
	movt	r5, 169
	mov	r8, #0
	add	r7, r4, r7
	add	r6, r4, r6
	add	r5, r4, r5
	mov	r9, r8
.L3289:
	ldr	r3, [r7]
	add	r8, r8, #1
	cmp	r3, #0
	beq	.L3286
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3286:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L3287
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3287:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L3288
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3288:
	cmp	r8, #16
	str	r9, [r6], #4
	mov	r2, #0
	str	r9, [r5], #4
	str	r9, [r7], #4
	bne	.L3289
	ldr	r3, [r4, #44]
	add	r5, r4, #11075584
	add	r6, r5, #45056
	str	r3, [r6, #2504]
	str	r2, [r6, #2508]
	str	r2, [r6, #2512]
	str	r2, [r6, #2516]
	str	r2, [r6, #2520]
	ldr	r1, [r4, #520]
	cmp	r1, r2
	beq	.L3291
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3292
.L3296:
	add	r3, r4, #11141120
	add	r3, r3, #8192
	ldr	r3, [r3, #3552]
	cmp	r3, #0
	beq	.L3294
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3294:
	mov	r3, #0
	str	r3, [r4, #520]
.L3291:
	ldr	r3, .L3319
	movw	r0, #47580
	mov	r2, #344
	mov	r1, #0
	movt	r0, 169
	add	r0, r4, r0
	ldr	r3, [r3, #48]
	blx	r3
	ldr	ip, [r6, #2504]
	mov	r0, #0
	add	r3, r4, #144
	add	r1, r4, #216
	mov	r2, r0
	str	ip, [r6, #2732]
	str	r0, [r6, #2736]
.L3298:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L3298
	add	r2, r4, #252
	add	r3, r4, #384
	mov	r0, #0
.L3299:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L3299
	add	r2, r5, #40960
	add	r4, r4, #516
	mov	r0, r1
	str	r1, [r2, #696]
.L3300:
	str	r0, [r3, #4]!
	cmp	r3, r4
	mov	r2, #0
	bne	.L3300
	add	r5, r5, #40960
	mov	r0, r2
	str	r2, [r5, #700]
.L3285:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3292:
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	cmp	r0, #0
	bne	.L3318
.L3295:
	ldr	r3, [r4, #520]
	cmp	r3, #0
	bne	.L3296
	b	.L3291
.L3318:
	movw	r1, #4690
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #20
	ldr	r3, .L3319+4
	ldr	r2, .L3319+8
	bl	dprint_normal
	b	.L3295
.L3301:
	mvn	r0, #0
	b	.L3285
.L3320:
	.align	2
.L3319:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+332
	.word	.LC393
	UNWIND(.fnend)
	.size	MVC_InitDPB, .-MVC_InitDPB
	.align	2
	.global	MVC_ClearDPB
	.type	MVC_ClearDPB, %function
MVC_ClearDPB:
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
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L3330
.L3322:
	mov	r0, r4
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L3323
	movw	r1, #258
	ldr	r3, .L3331
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L3331+4
	bl	dprint_normal
.L3323:
	mov	r0, #0
	strb	r0, [r4, #6]
	str	r0, [r4, #220]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3330:
	mov	r1, #253
	ldr	r3, .L3331
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L3331+8
	bl	dprint_normal
	b	.L3322
.L3332:
	.align	2
.L3331:
	.word	.LANCHOR0+344
	.word	.LC395
	.word	.LC394
	UNWIND(.fnend)
	.size	MVC_ClearDPB, .-MVC_ClearDPB
	.align	2
	.global	MVC_DecVDM
	.type	MVC_DecVDM, %function
MVC_DecVDM:
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
	add	r7, r0, #11141120
	add	r5, r7, #8192
	mov	r4, r0
	ldrb	r3, [r5, #3003]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3334
	ldrb	r3, [r5, #3001]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3334
.L3335:
	ldr	r3, [r4, #108]
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ubfx	r6, r3, #16, #2
	cmp	r6, r2
	beq	.L3336
	sub	r2, r2, #2
	cmp	r2, #1
	cmpls	r6, #1
	bls	.L3393
.L3336:
	uxtb	r3, r6
	strb	r3, [r4, #8]
	cmp	r3, #2
	beq	.L3339
	cmp	r3, #3
	beq	.L3340
	cmp	r3, #1
	beq	.L3394
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3395
.L3347:
	ldr	r3, [r4, #64]
.L3343:
	ldrb	r2, [r5, #3013]	@ zero_extendqisi2
	strb	r2, [r4, #11]
.L3348:
	cmp	r3, #0
	beq	.L3391
	ldrb	r3, [r5, #3012]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3396
	cmp	r3, #1
	bne	.L3351
	ldr	r2, [r5, #3632]
	cmp	r2, #0
	streqb	r3, [r4, #7]
.L3351:
	ldrb	ip, [r5, #3003]	@ zero_extendqisi2
	movw	r1, #6622
	ldr	r3, [r4, #88]
	mov	r0, #3
	ldr	r2, .L3399
	add	r7, r7, #12288
	sub	r3, r3, #1
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, [r5, #3620]
	mov	r3, #1
	strb	r3, [r7, #758]
	str	r2, [r7, #1352]
	ldr	r3, [r5, #3624]
	str	r3, [r7, #1348]
	ldr	r3, [r4, #64]
	str	r3, [r7, #1552]
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L3360
	ldrb	r1, [r5, #3012]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3353
	ldr	r3, .L3399+4
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3354
	ldr	r2, [r7, #1556]
	cmp	r2, #0
	beq	.L3362
.L3356:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3356
.L3355:
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #120]
	str	r1, [r2, #-4]!
	mov	r1, #8
	blx	r6
	ldr	r1, [r4, #224]
.L3357:
	movw	r3, #13044
	movt	r3, 170
	add	r3, r4, r3
	str	r3, [r4, #228]
	ldr	r2, [r1, #840]
	cmp	r2, #1
	beq	.L3397
	cmp	r2, #2
	bne	.L3360
	ldr	r2, [r1, #844]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L3360
	ldrb	r3, [r5, #3012]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3398
.L3360:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3334:
	ldr	r3, [r4, #140]
	ldr	r2, [r4, #144]
	add	r3, r3, #1
	ldr	r1, [r4, #224]
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #140]
	rsb	r3, r2, r3
	str	r3, [r1, #552]
	b	.L3335
.L3393:
	mov	r3, r6
	ldr	r2, .L3399+8
	movw	r1, #6524
	mov	r0, #3
	bl	dprint_normal
	strb	r6, [r4, #8]
.L3340:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mov	r0, r4
	mvn	r1, #0
	bl	MVC_ClearDPB
	mvn	r0, #0
.L3388:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3394:
	ldrb	r3, [r5, #3012]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3347
	ldr	r3, [r5, #3568]
	cmp	r3, #0
	beq	.L3344
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3347
.L3361:
	ldrb	r2, [r5, #3013]	@ zero_extendqisi2
	ldr	r3, [r4, #64]
	strb	r2, [r4, #11]
	b	.L3348
.L3339:
	ldrb	r3, [r5, #3012]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3344
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L3343
	ldr	r2, [r4, #544]
	ldr	r2, [r2, #48]
	cmp	r2, #0
	beq	.L3343
.L3344:
	mov	r3, #1
	mov	r0, r4
	strb	r3, [r5, #3007]
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3388
.L3353:
	add	r3, r4, #11075584
	add	r3, r3, #45056
	ldr	r3, [r3, #2508]
	cmp	r3, #0
	bne	.L3354
	ldr	r1, [r4, #224]
	ldr	r3, [r1, #12]
	cmp	r3, #2
	beq	.L3357
.L3391:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3388
.L3395:
	ldrb	r3, [r5, #3012]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3347
	b	.L3361
.L3396:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3351
	ldr	r3, [r4, #224]
	ldr	r6, [r3, #12]
	cmp	r6, #0
	bne	.L3351
	ldr	ip, [r5, #3568]
	movw	r1, #6612
	ldr	r3, [r5, #3572]
	mov	r0, #1
	ldr	r2, .L3399+12
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_ClearCurrPic
	ldr	r3, [r5, #3552]
	ldr	r0, [r4, #120]
	mov	r2, r6
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3388
.L3354:
	ldr	r1, [r4, #224]
	b	.L3357
.L3397:
	cmp	r3, #0
	beq	.L3360
	ldrb	r3, [r5, #3012]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3360
	mov	r2, #0
	str	r2, [r4, #228]
	ldr	r3, [r5, #3552]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	b	.L3391
.L3398:
	mov	r2, #0
	str	r2, [r4, #228]
	ldr	r3, [r5, #3552]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	ldr	r2, [r4, #224]
	mov	r0, r4
	ldr	r3, [r2, #844]
	sub	r3, r3, #1
	str	r3, [r2, #844]
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3388
.L3362:
	mov	r1, r2
	b	.L3355
.L3400:
	.align	2
.L3399:
	.word	.LC398
	.word	g_EventReportFunc
	.word	.LC396
	.word	.LC397
	UNWIND(.fnend)
	.size	MVC_DecVDM, .-MVC_DecVDM
	.align	2
	.global	MVC_ReceivePacket
	.type	MVC_ReceivePacket, %function
MVC_ReceivePacket:
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
	ldr	r2, [r5, #8]
	mov	r4, r0
	ldr	ip, [r5, #12]
	mov	r0, #8
	ldr	r3, [r1, #4]
	add	r6, r4, #11141120
	movw	r1, #11124
	stmia	sp, {r2, ip}
	ldr	r2, .L3464
	bl	dprint_normal
	add	r3, r6, #12288
	mov	r2, #0
	str	r2, [r3, #1696]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L3459
.L3402:
	ldr	r3, [r4, #232]
	cmp	r3, #0
	beq	.L3422
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3460
.L3405:
	movw	r1, #11135
	ldr	r2, .L3464+4
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L3422
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L3422:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3409
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3409
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3409
	ldrb	r3, [r4, #937]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3425
	mov	r2, r4
	mov	r3, #1
	b	.L3412
.L3411:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3423
.L3412:
	ldrb	r1, [r2, #1025]	@ zero_extendqisi2
	add	r2, r2, #88
	cmp	r1, #0
	bne	.L3411
	mov	r1, r3
.L3410:
	mov	r2, #88
	cmn	r1, #1
	mla	r3, r2, r3, r4
	mov	r0, #1
	strb	r0, [r3, #937]
	beq	.L3423
	mul	r3, r2, r1
	mov	r1, #0
	add	r2, r3, #936
	add	r3, r4, r3
	add	r2, r4, r2
	str	r2, [r4, #232]
	ldr	r2, [r5, #4]
	str	r2, [r3, #944]
	ldr	r2, [r5, #12]
	str	r2, [r3, #948]
	ldr	r2, [r5, #8]
	str	r2, [r3, #952]
	ldr	r3, [r4, #232]
	str	r1, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	r2, [r5, #16]
	str	r2, [r3, #32]
	ldrd	r2, [r5, #24]
	ldr	ip, [r4, #232]
	strd	r2, [ip, #80]
	ldr	r3, [r4, #232]
	str	r0, [r3, #68]
	ldr	r3, [r4, #232]
	strb	r1, [r3]
	ldr	r3, [r4, #232]
	ldrb	r2, [r5]	@ zero_extendqisi2
	strb	r2, [r3, #3]
	ldr	r3, [r4, #232]
	b	.L3415
.L3460:
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bhi	.L3405
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3406
	b	.L3405
.L3459:
	ldr	r3, [r3, #848]
	cmp	r3, #0
	beq	.L3402
	ldr	r3, [r4, #232]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3422
.L3406:
	strb	r2, [r3, #3]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L3461
.L3417:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3418
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3418
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3418
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bls	.L3462
.L3419:
	mov	r2, #1
	strb	r2, [r3, #3]
	ldr	r1, [r5, #16]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3464+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3456
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r5
.L3456:
	ldr	r3, [r4, #232]
.L3415:
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3409:
	ldr	r2, .L3464+12
	movw	r1, #11173
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #16]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3464+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3458
.L3457:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #42
	blx	r5
.L3458:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3418:
	ldr	r3, [r4, #232]
	b	.L3419
.L3461:
	ldr	r3, [r3, #848]
	cmp	r3, #0
	bne	.L3456
	b	.L3417
.L3462:
	mov	ip, r1, asl #5
	mov	r0, #0
	sub	r1, ip, r1, asl #2
	add	r3, r3, r1
	str	r2, [r3, #8]
	ldr	r3, [r4, #232]
	ldr	ip, [r5, #12]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #12]
	ldr	r3, [r4, #232]
	ldr	ip, [r5, #8]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #16]
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	r0, [r5, #16]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #32]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #68]
	add	r3, r3, #1
	str	r3, [r2, #68]
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #12]
	cmp	r2, #4096
	bcc	.L3463
.L3420:
	add	r6, r6, #12288
	mov	r2, #1
	str	r2, [r6, #1696]
	b	.L3415
.L3463:
	mov	r0, r4
	bl	MVC_CombinePacket.part.11
	ldr	r3, [r4, #232]
	b	.L3420
.L3423:
	ldr	r2, .L3464+16
	movw	r1, #11149
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_ClearAllNal
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_ClearDPB
	ldr	r3, .L3464+8
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L3457
	b	.L3458
.L3425:
	mov	r1, r3
	b	.L3410
.L3465:
	.align	2
.L3464:
	.word	.LC399
	.word	.LC400
	.word	g_EventReportFunc
	.word	.LC402
	.word	.LC401
	UNWIND(.fnend)
	.size	MVC_ReceivePacket, .-MVC_ReceivePacket
	.align	2
	.global	MVC_ClearAll
	.type	MVC_ClearAll, %function
MVC_ClearAll:
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
	ldr	r2, .L3499
	mov	r8, r0
	mov	r4, r1
	mov	r0, #20
	movw	r1, #274
	bl	dprint_normal
	mov	r0, r8
	bl	MVC_ClearCurrPic
	mov	r0, r8
	bl	MVC_ClearAllNal
	mov	r0, r8
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L3496
.L3467:
	cmp	r4, #0
	beq	.L3468
	add	r1, r8, #584
	ldr	r0, [r8, #120]
	bl	FSP_ClearNotInVoQueue
.L3469:
	movw	r4, #47928
	mov	r10, #0
	movt	r4, 169
	add	r4, r8, r4
	mov	r6, #0
	mov	r7, #0
.L3472:
	add	r5, r4, #232
	add	r9, r4, #264
	mov	r3, #0
	mov	r2, #1
	mvn	lr, #0
	mov	ip, #18
	mov	r0, #16
	mov	r1, #2
	str	r10, [r4, #160]
	str	r4, [r4, #684]
	str	r4, [r4, #648]
	str	r4, [r4, #612]
	strb	r3, [r4, #1]
	strb	r3, [r4, #2]
	strb	r3, [r4, #3]
	str	r3, [r4, #28]
	str	r3, [r4, #20]
	str	r3, [r4, #32]
	strb	r3, [r4, #5]
	strb	r3, [r4, #608]
	str	lr, [r4, #24]
	strb	r2, [r4, #7]
	strb	r2, [r4, #644]
	str	ip, [r4, #48]
	str	r0, [r4, #52]
	strb	r1, [r4, #680]
.L3471:
	ldrd	r2, [r5, #8]!
	orrs	r1, r2, r3
	bne	.L3497
.L3470:
	cmp	r5, r9
	bne	.L3471
	add	r10, r10, #1
	add	r4, r4, #720
	cmp	r10, #40
	bne	.L3472
	movw	r4, #11368
	movw	r5, #11400
	movt	r4, 170
	movt	r5, 170
	add	r4, r8, r4
	add	r5, r8, r5
	mov	r6, #0
	mov	r7, #0
.L3474:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3498
.L3473:
	cmp	r4, r5
	bne	.L3474
	ldr	r3, [r8, #60]
	cmp	r3, #0
	beq	.L3478
	mov	r4, #0
	add	r5, r8, #524
	mov	r6, r4
.L3477:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3476
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	str	r6, [r5]
	ldr	r3, [r8, #60]
.L3476:
	cmp	r3, r4
	bhi	.L3477
.L3478:
	add	r5, r8, #11075584
	ldr	ip, .L3499+4
	add	r3, r5, #45056
	add	r5, r5, #40960
	mov	r4, #0
	movw	r0, #41608
	strb	r4, [r8, #4]
	mov	r1, r4
	strb	r4, [r8, #9]
	movw	r2, #1656
	strb	r4, [r8, #6]
	movt	r0, 169
	strb	r4, [r8, #7]
	add	r0, r8, r0
	strb	r4, [r8, #3]
	str	r4, [r8, #60]
	str	r4, [r8, #64]
	str	r4, [r8, #104]
	str	r4, [r8, #220]
	str	r4, [r8, #232]
	ldr	r6, [ip, #48]
	strb	r4, [r3, #260]
	strb	r4, [r5, #2352]
	strb	r4, [r3, #261]
	strb	r4, [r5, #2353]
	blx	r6
	add	r3, r8, #11141120
	add	r1, r3, #8192
	add	r3, r3, #12288
	mov	r2, #2
	mov	r0, #1
	strb	r2, [r5, #648]
	mov	r2, #256
	strb	r0, [r5, #653]
	mov	r0, r4
	strb	r4, [r1, #3000]
	strb	r4, [r3, #184]
	str	r4, [r3, #188]
	str	r2, [r3, #192]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3497:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r5]
	b	.L3470
.L3498:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L3473
.L3468:
	add	r0, r8, #584
	bl	ResetVoQueue
	ldr	r0, [r8, #120]
	bl	FSP_ResetInstance
	b	.L3469
.L3496:
	movw	r1, #283
	ldr	r3, .L3499+8
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L3499+12
	bl	dprint_normal
	b	.L3467
.L3500:
	.align	2
.L3499:
	.word	.LC403
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+360
	.word	.LC395
	UNWIND(.fnend)
	.size	MVC_ClearAll, .-MVC_ClearAll
	.align	2
	.global	MVC_InsertFrmInDPB
	.type	MVC_InsertFrmInDPB, %function
MVC_InsertFrmInDPB:
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
	cmp	r1, #15
	mov	r6, r1
	mov	r5, r0
	mov	r4, r2
	bhi	.L3599
	add	r3, r0, #11075584
	ldrb	r9, [r4, #3]	@ zero_extendqisi2
	add	r3, r3, #45056
	ldr	r3, [r3, #2508]
	cmp	r3, #0
	ldreq	r2, .L3602
	streq	r3, [r2, #-1884]
	cmp	r9, #1
	beq	.L3506
	bcc	.L3507
	cmp	r9, #2
	bne	.L3600
	ldr	r3, [r4, #552]
	mov	r2, #3
	strb	r2, [r3, #608]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3527
	add	r10, r0, r3
	add	r10, r10, #11075584
	add	r7, r10, #45056
	ldr	r2, [r7, #2312]
	cmp	r2, #0
	beq	.L3527
	strb	r9, [r2, #680]
	ldr	r3, [r7, #2312]
	ldr	r2, [r4, #552]
	str	r2, [r3, #684]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #681]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #682]
	ldr	r3, [r7, #2312]
	ldr	r2, [r4, #584]
	str	r2, [r3, #696]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #683]
	ldr	r3, [r7, #2312]
	ldr	r2, [r4, #604]
	str	r2, [r3, #704]
	ldr	r3, [r7, #2312]
	ldr	r1, [r3, #668]
	ldr	r2, [r3, #704]
	add	r2, r2, r1
	str	r2, [r3, #632]
	str	r2, [r3, #44]
	add	r1, r4, #16
	ldr	r2, [r7, #2312]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r7, #2312]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #2312]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #4]
	mov	r2, #536
	ldr	r0, [r7, #2312]
	add	ip, r0, #288
	add	r3, r0, #304
	add	r0, r0, #72
	ldrd	r8, [ip, #-8]
	strd	r8, [fp, #-68]
	ldrd	r8, [ip]
	strd	r8, [fp, #-52]
	ldrd	r8, [r3, #-8]
	strd	r8, [fp, #-60]
	bl	memcpy
	ldrd	r0, [fp, #-68]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r1, r3
	cmpeq	r0, r2
	ldrne	r3, [r7, #2312]
	addne	r3, r3, #288
	strned	r0, [r3, #-8]
.L3536:
	ldrd	r0, [r4, #232]
	ldrd	r8, [fp, #-52]
	ldr	r3, [r7, #2312]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #288
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r3]
	ldrd	r0, [r4, #240]
	ldr	r3, [r7, #2312]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #304
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3, #-8]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3539
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3539
.L3540:
	add	r10, r10, #45056
	ldr	r2, [r10, #2312]
	ldrb	r3, [r2, #683]	@ zero_extendqisi2
	ldrb	r1, [r2, #647]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r10, #2312]
	ldr	r2, [r4, #600]
	str	r2, [r3, #700]
	ldr	r2, [r10, #2312]
	ldr	r3, [r2, #700]
	ldr	r1, [r2, #664]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r2, #36]
	ldr	r0, [r10, #2312]
	bl	MVC_CombineFldsToFrm
	ldr	r2, [r10, #2312]
	ldrb	r1, [r4, #11]	@ zero_extendqisi2
	movw	r3, #28314
	movt	r3, 42
	strb	r1, [r2, #13]
	ldrb	r1, [r4, #10]	@ zero_extendqisi2
	ldr	r2, [r10, #2312]
	strb	r1, [r2, #11]
	ldr	r2, [r10, #2312]
	ldr	r1, [r2, #52]
	ldr	r2, [r2, #696]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3526
.L3507:
	add	r3, r0, r1, lsl #2
	ldr	r2, [r4, #552]
	add	r10, r3, #11075584
	mov	r3, #3
	add	r7, r10, #45056
	str	r2, [r7, #2312]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2, #1]
	ldr	r2, [r7, #2312]
	strb	r3, [r2, #2]
	ldr	r1, [r4, #552]
	ldr	r2, [r7, #2312]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #552]
	ldr	r2, [r7, #2312]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r7, #2312]
	cmp	r1, #0
	beq	.L3601
.L3509:
	strb	r3, [r2, #3]
	add	r1, r4, #16
	ldr	r3, [r7, #2312]
	mov	r2, #536
	ldr	r0, [r4, #628]
	mov	r8, #0
	str	r0, [r3, #48]
	ldr	r0, [r7, #2312]
	add	r0, r0, #72
	bl	memcpy
	ldr	r2, [r7, #2312]
	ldr	r0, [r4, #604]
	add	r3, r10, #45056
	mov	lr, #1
	ldr	r1, .L3602
	mov	ip, #2
	str	r0, [r2, #632]
	str	r0, [r2, #44]
	ldr	r2, [r7, #2312]
	ldr	r0, [r4, #552]
	str	r0, [r2, #684]
	str	r0, [r2, #648]
	str	r0, [r2, #612]
	ldr	r2, [r7, #2312]
	ldr	r0, [r4, #564]
	str	r0, [r2, #28]
	ldr	r2, [r7, #2312]
	ldr	r0, [r4, #560]
	str	r0, [r2, #20]
	ldr	r2, [r7, #2312]
	strb	r8, [r2, #608]
	ldr	r2, [r7, #2312]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #609]
	ldr	r2, [r7, #2312]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #610]
	ldr	r2, [r7, #2312]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #611]
	strb	r0, [r2]
	ldr	r2, [r7, #2312]
	ldrb	r0, [r4, #9]	@ zero_extendqisi2
	str	r0, [r2, #40]
	ldr	r2, [r7, #2312]
	ldr	r0, [r4, #572]
	str	r0, [r2, #32]
	ldr	r0, [r4, #576]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #624]
	ldr	r0, [r4, #580]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #660]
	ldr	r0, [r4, #584]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #696]
	ldr	r0, [r4, #588]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #36]
	ldr	r0, [r4, #592]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #628]
	ldr	r0, [r4, #596]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #664]
	ldr	r0, [r4, #600]
	ldr	r2, [r7, #2312]
	str	r0, [r2, #700]
	ldrb	r2, [r4, #7]	@ zero_extendqisi2
	ldr	r0, [r7, #2312]
	cmp	r2, lr
	mov	r2, r8
	moveq	r9, #3
	strb	r9, [r0, #4]
	ldr	r7, [r3, #2312]
	mov	r0, r5
	ldr	r9, [r4, #632]
	str	r9, [r7, #56]
	ldr	r7, [r3, #2312]
	ldr	r9, [r4, #636]
	str	r9, [r7, #60]
	ldr	r7, [r3, #2312]
	ldrb	r9, [r4, #11]	@ zero_extendqisi2
	strb	r9, [r7, #13]
	strb	r9, [r7, #12]
	ldrb	r10, [r4, #10]	@ zero_extendqisi2
	ldr	r9, [r3, #2312]
	ldr	r7, [r1, #-1884]
	strb	r10, [r9, #11]
	strb	r10, [r9, #10]
	ldr	r9, [r3, #2312]
	str	r7, [r9, #64]
	add	r7, r7, lr
	ldr	r3, [r3, #2312]
	str	r7, [r1, #-1884]
	ldrb	r9, [r3, #609]	@ zero_extendqisi2
	ldr	r1, [r3, #612]
	ldrb	r7, [r3, #610]	@ zero_extendqisi2
	strb	lr, [r3, #644]
	strb	ip, [r3, #680]
	ldr	lr, [r3, #632]
	ldrb	ip, [r3, #611]	@ zero_extendqisi2
	strb	r9, [r3, #645]
	strb	r9, [r3, #681]
	strb	r7, [r3, #646]
	strb	r7, [r3, #682]
	str	lr, [r3, #668]
	str	lr, [r3, #704]
	strb	ip, [r3, #647]
	strb	ip, [r3, #683]
	str	r1, [r3, #648]
	str	r1, [r3, #684]
	ldr	r1, [r4, #552]
	bl	MVC_GetAPC
	cmp	r0, #0
	movwne	r3, #1804
	bne	.L3597
.L3526:
	movw	r3, #28226
	movt	r3, 42
	add	r3, r6, r3
	ldr	r3, [r5, r3, asl #2]
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3503
	ldr	r0, [r5, #120]
	mov	r2, #1
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r0, #0
.L3503:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3600:
	mov	r3, r9
	ldr	r2, .L3602+4
	movw	r1, #2056
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r5
	mov	r1, #1
	bl	MVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3506:
	ldr	r3, [r4, #552]
	mov	r2, #3
	strb	r2, [r3, #608]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3512
	add	r8, r0, r3
	add	r2, r8, #11075584
	str	r2, [fp, #-68]
	add	r7, r2, #45056
	ldr	r2, [r7, #2312]
	cmp	r2, #0
	beq	.L3512
	strb	r9, [r2, #644]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #647]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #645]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #646]
	ldr	r3, [r7, #2312]
	ldr	r2, [r4, #580]
	str	r2, [r3, #660]
	ldr	r3, [r7, #2312]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #647]
	ldr	r3, [r7, #2312]
	ldr	r2, [r4, #604]
	str	r2, [r3, #668]
	ldr	r3, [r7, #2312]
	ldr	r1, [r3, #668]
	ldr	r2, [r3, #704]
	add	r2, r2, r1
	str	r2, [r3, #632]
	str	r2, [r3, #44]
	add	r1, r4, #16
	ldr	r2, [r7, #2312]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r7, #2312]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #2312]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	orreq	r2, r2, #1
	strb	r2, [r3, #4]
	mov	r2, #536
	ldr	r0, [r7, #2312]
	add	r3, r0, #288
	add	ip, r0, #304
	add	r0, r0, #72
	ldrd	r8, [r3]
	ldmdb	r3, {r10, lr}
	strd	r8, [fp, #-52]
	ldrd	r8, [ip, #-8]
	str	lr, [fp, #-72]
	strd	r8, [fp, #-60]
	bl	memcpy
	ldr	lr, [fp, #-72]
	ldr	r1, [r4, #224]
	ldr	r2, [r4, #228]
	and	r3, r10, lr
	adds	r3, r3, #1
	ldrd	r8, [fp, #-52]
	and	r2, r2, r1
	movne	r3, #1
	cmn	r2, #1
	movne	r3, #0
	cmp	r3, #0
	ldrne	r3, [r7, #2312]
	movne	r2, lr
	strne	r10, [r3, #280]
	strne	r2, [r3, #284]
	ldrd	r0, [r4, #232]
	ldr	r3, [r7, #2312]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #288
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r3]
	ldrd	r0, [r4, #240]
	ldr	r3, [r7, #2312]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #304
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3, #-8]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3523
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3523
.L3524:
	ldr	r3, [fp, #-68]
	add	r8, r3, #45056
	ldr	r2, [r8, #2312]
	ldrb	r3, [r2, #683]	@ zero_extendqisi2
	ldrb	r1, [r2, #647]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r8, #2312]
	ldr	r2, [r4, #596]
	str	r2, [r3, #664]
	ldr	r2, [r8, #2312]
	ldr	r3, [r2, #700]
	ldr	r1, [r2, #664]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r2, #36]
	ldr	r3, [r8, #2312]
	ldrb	r2, [r4, #11]	@ zero_extendqisi2
	strb	r2, [r3, #12]
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	ldr	r3, [r8, #2312]
	strb	r2, [r3, #10]
	ldr	r0, [r8, #2312]
	bl	MVC_CombineFldsToFrm
	ldr	r2, [r8, #2312]
	movw	r3, #28298
	movt	r3, 42
	ldr	r1, [r2, #52]
	ldr	r2, [r2, #660]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3526
.L3512:
	add	r7, r5, r3
	ldr	r2, [r4, #552]
	add	r7, r7, #11075584
	mov	r1, #1
	add	r3, r7, #45056
	str	r2, [r3, #2312]
	strb	r1, [r2, #644]
	ldr	r2, [r3, #2312]
	ldr	r0, [r4, #552]
	str	r0, [r2, #648]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #645]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #646]
	ldr	r2, [r3, #2312]
	ldr	r0, [r4, #580]
	str	r0, [r2, #660]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #647]
	ldr	r2, [r3, #2312]
	ldr	r0, [r4, #604]
	str	r0, [r2, #668]
	ldr	r2, [r3, #2312]
	ldr	r0, [r2, #668]
	str	r0, [r2, #632]
	str	r0, [r2, #44]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	strb	r0, [r2, #1]
	ldr	r2, [r3, #2312]
	strb	r1, [r2, #2]
	ldr	r1, [r4, #552]
	ldr	r2, [r3, #2312]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #552]
	ldr	r2, [r3, #2312]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3514
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3514
.L3515:
	add	r7, r7, #45056
	mov	r8, #0
	mov	r2, #536
	add	r1, r4, #16
	ldr	r3, [r7, #2312]
	str	r8, [r3, #40]
	ldr	r0, [r7, #2312]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #628]
	mov	r2, #1
	ldr	ip, .L3602
	mov	r0, r5
	str	r1, [r3, #48]
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #560]
	str	r1, [r3, #20]
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #572]
	str	r1, [r3, #32]
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #588]
	str	r1, [r3, #36]
	ldr	r3, [r7, #2312]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #596]
	str	r1, [r3, #664]
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #632]
	str	r1, [r3, #56]
	ldr	r3, [r7, #2312]
	ldr	r1, [r4, #636]
	str	r1, [r3, #60]
	ldr	r3, [r7, #2312]
	ldrb	r1, [r4, #11]	@ zero_extendqisi2
	strb	r1, [r3, #12]
	ldr	r3, [r7, #2312]
	ldrb	r1, [r4, #10]	@ zero_extendqisi2
	strb	r1, [r3, #10]
	ldr	r3, [ip, #-1884]
	ldr	r1, [r7, #2312]
	str	r3, [r1, #64]
	add	r3, r3, r2
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	lr, [r7, #2312]
	str	r3, [ip, #-1884]
	rsb	r3, r2, r1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [lr, #4]
	ldr	r1, [r4, #552]
	bl	MVC_GetAPC
	cmp	r0, #0
	beq	.L3526
	movw	r3, #1866
.L3597:
	mov	r1, r3
	str	r0, [sp]
	ldr	r2, .L3602+8
	mov	r0, r8
	bl	dprint_normal
	mov	r0, r5
	mvn	r1, #0
	bl	MVC_ClearDPB
	mvn	r0, #0
	b	.L3503
.L3527:
	add	r7, r5, r3
	ldr	r2, [r4, #552]
	add	r7, r7, #11075584
	mov	r1, #2
	add	r3, r7, #45056
	str	r2, [r3, #2312]
	strb	r1, [r2, #680]
	ldr	r2, [r3, #2312]
	ldr	r0, [r4, #552]
	str	r0, [r2, #684]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #681]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #682]
	ldr	r2, [r3, #2312]
	ldr	r0, [r4, #584]
	str	r0, [r2, #696]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #683]
	ldr	r2, [r3, #2312]
	ldr	r0, [r4, #604]
	str	r0, [r2, #704]
	ldr	r2, [r3, #2312]
	ldr	r0, [r2, #668]
	str	r0, [r2, #632]
	str	r0, [r2, #44]
	ldr	r2, [r3, #2312]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	strb	r0, [r2, #1]
	ldr	r2, [r3, #2312]
	strb	r1, [r2, #2]
	ldr	r1, [r4, #552]
	ldr	r2, [r3, #2312]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #552]
	ldr	r2, [r3, #2312]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3529
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3529
.L3530:
	add	r7, r7, #45056
	mov	r8, #0
	mov	r2, #536
	add	r1, r4, #16
	ldr	r3, [r7, #2312]
	str	r8, [r3, #40]
	ldr	r0, [r7, #2312]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #628]
	mov	r2, #2
	ldr	r1, .L3602
	mov	r0, r5
	str	ip, [r3, #48]
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #560]
	str	ip, [r3, #20]
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #572]
	str	ip, [r3, #32]
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #588]
	str	ip, [r3, #36]
	ldr	r3, [r7, #2312]
	ldrb	ip, [r4, #12]	@ zero_extendqisi2
	strb	ip, [r3, #683]
	strb	ip, [r3]
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #600]
	str	ip, [r3, #700]
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #632]
	str	ip, [r3, #56]
	ldr	r3, [r7, #2312]
	ldr	ip, [r4, #636]
	str	ip, [r3, #60]
	ldr	r3, [r7, #2312]
	ldrb	ip, [r4, #11]	@ zero_extendqisi2
	strb	ip, [r3, #13]
	ldrb	ip, [r4, #10]	@ zero_extendqisi2
	ldr	r3, [r7, #2312]
	strb	ip, [r3, #11]
	ldr	ip, [r7, #2312]
	ldr	r3, [r1, #-1884]
	str	r3, [ip, #64]
	add	r3, r3, #1
	ldrb	lr, [r4, #7]	@ zero_extendqisi2
	ldr	ip, [r7, #2312]
	cmp	lr, #1
	str	r3, [r1, #-1884]
	moveq	r9, r2
	movne	r9, r8
	strb	r9, [ip, #4]
	ldr	r1, [r4, #552]
	bl	MVC_GetAPC
	cmp	r0, #0
	movwne	r3, #1989
	beq	.L3526
	b	.L3597
.L3601:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3509
.L3514:
	ldr	r2, [r3, #2312]
	mov	r1, #1
	strb	r1, [r2, #3]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, r1
	ldreq	r3, [r3, #2312]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #28]
	b	.L3515
.L3529:
	ldr	r2, [r3, #2312]
	mov	r1, #2
	strb	r1, [r2, #3]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	ldreq	r3, [r3, #2312]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #28]
	b	.L3530
.L3539:
	ldr	r2, [r7, #2312]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #2312]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #28]
	b	.L3540
.L3523:
	ldr	r2, [r7, #2312]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #2312]
	ldreq	r2, [r4, #564]
	streq	r2, [r3, #28]
	b	.L3524
.L3599:
	ldr	ip, .L3602+12
	movw	r3, #1749
	str	r1, [sp, #4]
	mov	r0, #0
	mov	r1, r3
	ldr	r2, .L3602+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L3503
.L3603:
	.align	2
.L3602:
	.word	.LANCHOR3
	.word	.LC405
	.word	.LC404
	.word	.LANCHOR0+376
	.word	.LC391
	UNWIND(.fnend)
	.size	MVC_InsertFrmInDPB, .-MVC_InsertFrmInDPB
	.align	2
	.global	MVC_AllocFrameStore
	.type	MVC_AllocFrameStore, %function
MVC_AllocFrameStore:
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
	add	r9, r0, #11075584
	add	r7, r9, #40960
	mov	r6, r0
	str	r1, [fp, #-52]
	ldrb	r5, [r7, #649]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L3605
	ldrb	r3, [r7, #650]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r5, #2
	moveq	r5, #1
.L3605:
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	beq	.L3606
	cmp	r3, #2
	beq	.L3693
	add	r3, r6, #11141120
	str	r3, [fp, #-56]
	mov	r2, r3
	sub	r3, r5, #1
	add	r4, r2, #8192
	cmp	r3, #1
	mov	r3, #0
	strb	r3, [r4, #3001]
	bls	.L3694
.L3629:
	mov	r8, #0
	strb	r8, [r4, #3000]
	ldr	r10, [r6, #48]
	cmp	r10, r8
	beq	.L3636
	movw	ip, #47928
	add	r9, r9, #45056
	movt	ip, 169
	add	ip, r6, ip
	movw	r3, #47368
	movt	r3, 169
	add	r3, r6, r3
	str	r3, [fp, #-48]
.L3635:
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3631
	cmp	ip, #0
	beq	.L3648
	ldr	lr, [r9, #2504]
	cmp	lr, #0
	beq	.L3648
	ldr	r2, [r9, #2312]
	rsb	r3, ip, r2
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L3631
	ldr	r1, [fp, #-48]
	b	.L3633
.L3634:
	ldr	r2, [r1, #4]!
	rsb	r0, ip, r2
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L3631
.L3633:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L3634
.L3648:
	mov	r3, #720
	movw	r2, #47968
	mla	r8, r3, r8, r6
	movt	r2, 169
	movw	r1, #48000
	add	r0, r4, #3008
	mov	r9, #0
	mov	r3, #1
	add	r2, r8, r2
	strb	r3, [r4, #3000]
	str	ip, [r4, #3552]
	movt	r1, 169
	str	r9, [r2, #4]
	add	r1, r8, r1
	mov	r2, #101
	add	r0, r0, #8
	str	r2, [r4, #3604]
	mov	r2, #536
	mov	r10, ip
	str	r3, [fp, #-48]
	bl	memcpy
	movw	r2, #47928
	movt	r2, 169
	add	r2, r8, r2
	str	r9, [r4, #3112]
	strb	r9, [r2, #4]
	strb	r9, [r10, #7]
	ldr	r2, [r4, #3552]
	ldr	r3, [fp, #-48]
	strb	r9, [r2, #3]
	ldr	r2, [r4, #3552]
	strb	r3, [r2, #5]
	ldr	r3, [r4, #3552]
	str	r9, [r3, #16]
	ldrb	r10, [r4, #3000]	@ zero_extendqisi2
	cmp	r10, #1
	bne	.L3636
	ldr	r3, [fp, #-52]
	ldr	r0, [r6, #120]
	cmp	r3, #0
	movne	r1, #3
	moveq	r1, #0
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	mvn	r3, r8
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r9, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L3638
	ldr	r10, .L3700
	mov	r2, #536
	ldr	r0, [r4, #3552]
	add	r1, r9, #40
	ldr	r3, [r10, #52]
	add	r0, r0, #72
	blx	r3
	ldr	r1, [r4, #3552]
	movw	r0, #11208
	ldr	r3, [r10, #52]
	movt	r0, 170
	add	r1, r1, #72
	add	r0, r6, r0
	mov	r2, #536
	blx	r3
	ldr	r3, [r4, #3552]
	strb	r8, [r3, #6]
	ldr	r3, [r9, #32]
	ldr	r3, [r3, #4]
	str	r3, [r4, #3628]
.L3628:
	ldr	r3, [fp, #-52]
	uxtb	r2, r5
	strb	r2, [r4, #3003]
	cmp	r3, #1
	moveq	r0, #0
	beq	.L3686
	ldrb	r3, [r7, #649]	@ zero_extendqisi2
	ldr	r1, [r4, #3552]
	cmp	r3, #0
	movne	r3, #3
	strb	r3, [r1, #608]
	ldrb	r3, [r4, #3001]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [fp, #-56]
	add	r3, r3, #12288
	beq	.L3695
	strb	r2, [r3, #184]
	cmp	r5, #0
	ldr	r2, [r7, #676]
	movne	r0, #0
	moveq	r0, r5
	str	r2, [r3, #192]
	ldrb	r2, [r7, #656]	@ zero_extendqisi2
	str	r2, [r3, #188]
	ldr	r2, [r6, #128]
	str	r2, [r3, #196]
	ldr	r2, [r7, #2288]
	str	r8, [r3, #200]
	streqb	r5, [r3, #185]
	str	r2, [r3, #208]
	movne	r2, #1
	strneb	r2, [r3, #185]
.L3686:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3631:
	add	r8, r8, #1
	add	ip, ip, #720
	cmp	r8, r10
	bne	.L3635
.L3636:
	ldr	r2, .L3700+4
	movw	r1, #5366
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3693:
	add	r4, r6, #11141120
	str	r4, [fp, #-56]
	add	r4, r4, #8192
.L3626:
	mov	r3, #0
	strb	r3, [r4, #3001]
	b	.L3629
.L3606:
	cmp	r3, #2
	beq	.L3696
	add	r3, r6, #11141120
	str	r3, [fp, #-56]
	mov	r2, r3
	add	r4, r2, #8192
	mov	r3, #0
	mov	r5, r3
	strb	r3, [r4, #3001]
	b	.L3629
.L3694:
	add	r3, r2, #12288
	ldrb	r2, [r3, #184]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3609
	ldr	r0, [r3, #208]
	ldr	r1, [r7, #2288]
	cmp	r0, r1
	beq	.L3610
.L3609:
	add	r3, r9, #45056
	ldr	r1, [r3, #2504]
	subs	r3, r1, #1
	bmi	.L3629
	movw	r2, #28226
	movt	r2, 42
	add	r2, r1, r2
	add	r2, r6, r2, lsl #2
	b	.L3622
.L3612:
	cmp	r5, #2
	beq	.L3697
.L3611:
	subs	r3, r3, #1
	bmi	.L3629
.L3622:
	ldr	r8, [r2, #-4]!
	cmp	r8, #0
	beq	.L3611
	cmp	r5, #1
	bne	.L3612
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L3611
.L3613:
	ldr	r0, [r7, #676]
	ldr	r1, [r8, #20]
	cmp	r0, r1
	bne	.L3611
	ldr	r0, [r7, #2288]
	ldr	r1, [r8, #56]
	cmp	r0, r1
	bne	.L3611
	ldrb	r1, [r7, #656]	@ zero_extendqisi2
	cmp	r1, #0
	ldrb	r1, [r8, #3]	@ zero_extendqisi2
	beq	.L3698
	cmp	r1, #0
	beq	.L3611
.L3617:
	add	r0, r4, #3008
	mov	r3, #1
	mov	r2, #536
	strb	r3, [r4, #3001]
	add	r1, r8, #72
	str	r8, [r4, #3552]
	add	r0, r0, #8
	bl	memcpy
	ldrsb	r1, [r8, #6]
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L3615
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L3615
	ldrb	r2, [r4, #3001]	@ zero_extendqisi2
	ldr	r3, [r3, #4]
	cmp	r2, #0
	str	r3, [r4, #3628]
	beq	.L3629
	ldr	r3, [r4, #3552]
	cmp	r3, #0
	beq	.L3629
.L3691:
	mov	r8, #0
	b	.L3628
.L3697:
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3611
	b	.L3613
.L3695:
	mov	r2, #0
	strb	r2, [r3, #184]
	ldr	r1, [r7, #676]
	mov	r0, r2
	str	r1, [r3, #192]
	ldrb	r1, [r7, #656]	@ zero_extendqisi2
	str	r1, [r3, #188]
	ldr	r1, [r6, #128]
	str	r8, [r3, #200]
	strb	r2, [r3, #185]
	str	r1, [r3, #196]
	ldr	r2, [r7, #2288]
	str	r2, [r3, #208]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3696:
	add	r4, r6, #11141120
	mov	r5, #0
	str	r4, [fp, #-56]
	add	r4, r4, #8192
	b	.L3626
.L3698:
	cmp	r1, #0
	bne	.L3611
	b	.L3617
.L3638:
	ldr	ip, [r4, #3552]
	mov	r0, r3
	strb	r3, [r4, #3000]
	movw	r1, #5387
	ldr	r2, .L3700+8
	strb	r3, [ip, #5]
	bl	dprint_normal
	mov	r1, r10
	mov	r0, r6
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3686
.L3610:
	sub	r8, r5, #2
	cmp	r2, #1
	cmpeq	r5, #2
	clz	r8, r8
	mov	r8, r8, lsr #5
	beq	.L3623
	cmp	r5, #1
	cmpeq	r2, #2
	bne	.L3629
.L3623:
	ldr	r1, [r3, #192]
	ldr	r2, [r7, #676]
	cmp	r1, r2
	bne	.L3629
	ldrb	r2, [r7, #656]	@ zero_extendqisi2
	ldr	r3, [r3, #188]
	cmp	r2, #0
	bne	.L3624
	cmp	r3, #0
	bne	.L3629
.L3625:
	ldr	r3, [r6, #128]
	ldr	r2, [r6, #124]
	rsb	r3, r2, r3
	cmp	r3, #2
	bhi	.L3629
	ldr	r3, [r4, #3552]
	mov	r2, #1
	strb	r2, [r4, #3001]
	cmp	r3, #0
	beq	.L3626
	cmp	r8, #0
	bne	.L3699
	cmp	r5, #1
	bne	.L3628
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3626
	b	.L3628
.L3615:
	movw	r3, #5281
	ldr	r2, .L3700+12
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3686
.L3699:
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L3626
	b	.L3691
.L3624:
	cmp	r3, #0
	beq	.L3629
	b	.L3625
.L3701:
	.align	2
.L3700:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC407
	.word	.LC408
	.word	.LC406
	UNWIND(.fnend)
	.size	MVC_AllocFrameStore, .-MVC_AllocFrameStore
	.align	2
	.global	MVC_DEC_Init
	.type	MVC_DEC_Init, %function
MVC_DEC_Init:
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
	ldr	r8, .L3712
	ldr	r5, [r0, #928]
	movw	r2, #14000
	mov	r6, r0
	mov	r4, r1
	movt	r2, 170
	mov	r1, #0
	ldr	r3, [r8, #48]
	blx	r3
	str	r5, [r6, #928]
	add	r0, r6, #584
	mov	r5, #2240
	bl	ResetVoQueue
	str	r4, [r6, #224]
	mov	r3, #0
	str	r3, [r6, #228]
	strb	r3, [r6]
	ldr	r3, [r4, #676]
	str	r3, [r6, #36]
	ldr	r3, [r4, #680]
	str	r3, [r6, #40]
	ldr	r3, [r4, #668]
	str	r3, [r6, #32]
	ldr	r0, [r4, #560]
	bl	MEM_Phy2Vir
	ldr	ip, [r6, #36]
	ldr	r3, [r6, #224]
	movw	r2, #3992
	ldr	r1, [r6, #40]
	mul	r2, r2, ip
	ldr	r3, [r3, #556]
	add	r3, r0, r3
	str	r3, [r6, #248]
	add	r0, r3, r2
	str	r0, [r6, #252]
	cmp	r3, #0
	cmpne	r0, #0
	mla	r0, r5, r1, r0
	moveq	lr, #1
	movne	lr, #0
	cmp	r0, #0
	orreq	lr, lr, #1
	cmp	lr, #0
	str	r0, [r6, #544]
	bne	.L3709
	ldr	r4, [r4, #596]
	cmp	r4, #0
	beq	.L3710
.L3705:
	add	r3, r6, #11075584
	movw	r2, #4060
	add	lr, r3, #36864
	add	r3, r3, #32768
	ldr	r9, [r8, #48]
	add	r4, r6, #12992
	str	r1, [lr, #1392]
	mov	r1, #0
	str	ip, [r3, #2216]
	mov	r5, r1
	ldr	r3, [r6, #32]
	add	r4, r4, #12
	movw	r7, #22860
	movt	r7, 164
	add	r7, r6, r7
	mul	r2, r2, r3
	blx	r9
	ldr	r3, [r6, #108]
	mov	r2, #9856
	mov	ip, #40
	strb	r5, [r6, #4]
	ubfx	r3, r3, #16, #2
	str	ip, [r6, #48]
	mov	r1, r5
	strb	r3, [r6, #8]
	movt	r2, 164
	strb	r5, [r6, #6]
	mov	r3, #18
	strb	r5, [r6, #7]
	mov	r0, r4
	str	r3, [r6, #52]
	str	r5, [r6, #68]
	ldr	r3, [r8, #48]
	str	r5, [r6, #72]
	str	r5, [r6, #76]
	str	r5, [r6, #80]
	str	r5, [r6, #84]
	str	r5, [r6, #88]
	str	r5, [r6, #92]
	str	r5, [r6, #96]
	str	r5, [r6, #60]
	str	r5, [r6, #528]
	str	r5, [r6, #532]
	str	r5, [r6, #536]
	str	r5, [r6, #540]
	str	r5, [r6, #220]
	str	r5, [r6, #56]
	blx	r3
	movw	r2, #8500
	ldr	r3, [r8, #48]
	mov	r0, r7
	mov	r1, r5
	movt	r2, 5
	blx	r3
	mov	r0, r4
	mov	r3, r5
.L3706:
	strb	r3, [r0]
	add	r2, r0, #274432
	add	r0, r0, #335872
	mov	r4, #0
	add	r0, r0, #308
	strb	r3, [r2, #241]
	cmp	r0, r7
	bne	.L3706
	add	r2, r6, #12288
	movw	r3, #34240
	mov	r1, #32
	movt	r3, 169
	strb	r4, [r2, #704]
	add	r3, r6, r3
	mov	r0, r6
	str	r3, [r6, #236]
	str	r4, [r6, #20]
	strb	r4, [r6, #2]
	str	r1, [r6, #24]
	str	r1, [r6, #28]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r6, #120]
	beq	.L3711
	mov	r1, r4
	mov	r0, r6
	bl	MVC_ClearAll
	mov	r0, #1
.L3704:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3710:
	mov	r0, r3
	mov	r1, r4
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r2, [r6, #40]
	mov	r1, r4
	ldr	r3, [r8, #48]
	ldr	r0, [r6, #252]
	mul	r2, r5, r2
	blx	r3
	ldr	r1, [r6, #40]
	ldr	ip, [r6, #36]
	ldr	r0, [r6, #544]
	b	.L3705
.L3709:
	movw	r1, #11441
	ldr	r3, .L3712+4
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L3712+8
	bl	dprint_normal
	mvn	r0, #19
	b	.L3704
.L3711:
	mov	r0, r4
	ldr	r2, .L3712+12
	movw	r1, #11504
	bl	dprint_normal
	mvn	r0, #19
	b	.L3704
.L3713:
	.align	2
.L3712:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+396
	.word	.LC409
	.word	.LC410
	UNWIND(.fnend)
	.size	MVC_DEC_Init, .-MVC_DEC_Init
	.align	2
	.global	MVC_StorePicInDpb
	.type	MVC_StorePicInDpb, %function
MVC_StorePicInDpb:
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
	add	r4, r0, #11075584
	add	r7, r0, #11141120
	add	r2, r4, #36864
	add	r6, r7, #8192
	mov	r8, #0
	strb	r8, [r2, #3608]
	mov	r5, r0
	ldrb	r3, [r6, #3003]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #3609]
	ldrb	r3, [r6, #3000]	@ zero_extendqisi2
	cmp	r3, r8
	beq	.L3884
	ldr	r3, [r0, #128]
	str	r3, [r0, #124]
	ldrb	r3, [r6, #3013]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3717
	ldr	r3, [r6, #3556]
	ldrb	r9, [r3, #1]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L3718
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L3885
.L3717:
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3886
	ldr	r9, [r5, #224]
	ldr	r3, [r9, #12]
	cmp	r3, #0
	bne	.L3722
	ldr	r2, [r5, #220]
	cmp	r2, #2
	beq	.L3724
	ldrb	r2, [r6, #3002]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3724
.L3794:
	ldrb	r1, [r6, #3003]	@ zero_extendqisi2
	ldr	r8, [r6, #3552]
	sub	r2, r1, #1
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	cmp	r1, #0
	beq	.L3726
	ldrb	r0, [r8, #2]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	ip, r2
	orrne	ip, r2, #1
	cmp	ip, #0
	beq	.L3725
	cmp	r2, #0
	beq	.L3887
.L3799:
	ldr	r2, [r5, #220]
	cmp	r2, #0
	bne	.L3729
	add	r1, r6, #2992
	add	r0, r6, #3632
	mov	r3, #1
	add	r1, r1, #8
	str	r3, [r5, #220]
	add	r0, r0, #8
	mov	r2, #640
	bl	memcpy
	ldr	r3, [r9, #12]
.L3725:
	cmp	r3, #2
	beq	.L3888
.L3724:
	ldr	r3, [r6, #3568]
	cmp	r3, #0
	beq	.L3756
	ldr	r2, [r5, #112]
	ldr	r3, [r6, #3604]
	cmp	r2, r3
	bcs	.L3757
	ldrb	r1, [r6, #3002]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L3889
.L3757:
	mov	r0, r5
	bl	MVC_Marking
	cmp	r0, #0
	bne	.L3890
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	ldr	r1, [r6, #3632]
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
.L3750:
	ldrb	r3, [r6, #3001]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3760
	add	r4, r4, #45056
	ldr	ip, [r4, #2504]
.L3761:
	ldr	r3, [r6, #3568]
	cmp	r3, #0
	beq	.L3770
	ldr	r1, [r4, #2512]
	ldr	r2, [r4, #2516]
	add	r3, r2, r1
	cmp	r3, ip
	bcs	.L3796
.L3770:
	mvn	r9, #0
	mov	r8, r9
	b	.L3779
.L3774:
	ldr	r2, [r6, #3568]
	mov	r1, r8
	mov	r0, r5
	mov	r9, r3
	cmp	r2, #0
	bne	.L3775
	ldr	r2, [r6, #3572]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L3891
.L3775:
	bl	MVC_OutputFrmFromDPB
	cmn	r0, #1
	beq	.L3778
	ldr	ip, [r4, #2504]
.L3779:
	ldr	lr, [r4, #2508]
	sub	r3, fp, #52
	sub	r2, fp, #56
	mvn	r1, #0
	cmp	lr, ip
	mov	r0, r5
	bcc	.L3772
	bl	MVC_GetMinPOC
	cmp	r0, #0
	blt	.L3892
	ldr	r3, [r4, #2508]
	cmp	r3, r9
	ldrne	r8, [fp, #-52]
	bne	.L3774
	ldr	r2, [fp, #-52]
	cmp	r2, r8
	beq	.L3893
	mov	r8, r2
	b	.L3774
.L3722:
	ldrb	r2, [r6, #3002]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3725
	b	.L3794
.L3756:
	ldrb	r3, [r6, #3001]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3760
	add	r4, r4, #45056
	ldr	ip, [r4, #2504]
	b	.L3770
.L3888:
	ldr	r3, [r6, #3568]
	cmp	r3, #0
	beq	.L3750
	add	r4, r4, #45056
	mov	r0, r5
	bl	MVC_SimpleSlideDPB
	ldr	r1, [r4, #2504]
	cmp	r1, #0
	beq	.L3751
	ldr	r3, [r4, #2312]
	cmp	r3, #0
	beq	.L3804
	movw	r2, #47368
	mov	r3, #0
	movt	r2, 169
	add	r2, r5, r2
	b	.L3752
.L3753:
	ldr	r0, [r2, #4]!
	cmp	r0, #0
	beq	.L3804
.L3752:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3753
.L3751:
	movw	r2, #11192
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	subs	r8, r0, #0
	bne	.L3894
	ldr	r3, [r4, #2508]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #2508]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	movw	r1, #3042
	mov	r3, r8
	str	r1, [sp]
	ldr	r2, .L3907
	mov	r0, #12
	bl	dprint_normal
	b	.L3755
.L3726:
	cmp	r2, #0
	bne	.L3799
.L3732:
	cmp	r3, #0
	beq	.L3802
	movw	r10, #11192
	mov	r9, r8
	movt	r10, 170
	add	r10, r5, r10
.L3735:
	cmp	r1, #0
	bne	.L3895
.L3737:
	ldr	r3, [r10, #604]
	str	r3, [r9, #44]
.L3738:
	mov	r1, r9
	mov	r0, r5
	bl	MVC_GetImagePara
	ldrsb	r1, [r9, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	str	r3, [fp, #-64]
	beq	.L3896
	ldrd	r2, [r10, #224]
	ldr	r1, [fp, #-64]
	strd	r2, [r1, #208]
	ldrd	r2, [r10, #232]
	strd	r2, [r1, #216]
	ldrd	r2, [r10, #240]
	strd	r2, [r1, #224]
	ldr	r3, [r9, #44]
	cmp	r3, #0
	str	r3, [r1, #96]
	bne	.L3740
.L3745:
	mov	r2, #1
	ldrsb	r1, [r9, #6]
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
	ldr	r3, [fp, #-64]
	ldr	r0, [r5, #120]
	mov	r2, r5
	mov	r1, #15
	str	r3, [sp]
	add	r3, r5, #584
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3742
	mov	r2, #0
	ldrsb	r1, [r9, #6]
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
.L3742:
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	bcs	.L3897
	ldr	r2, [fp, #-64]
	mov	r3, #0
	str	r3, [r2, #16]
.L3748:
	ldr	r3, [r5, #136]
	add	r3, r3, #2
	str	r3, [r5, #136]
.L3736:
	ldr	r3, [r5, #220]
	cmp	r3, #2
	beq	.L3749
.L3734:
	mov	r3, #1
	str	r3, [r9, #16]
	strb	r3, [r8, #8]
.L3749:
	ldr	r3, [r5, #224]
	mov	r2, #2
	str	r2, [r5, #220]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L3724
	b	.L3888
.L3760:
	ldr	r3, [r5, #520]
	ldr	lr, [r6, #3552]
	cmp	r3, #0
	rsb	r2, r3, lr
	clz	r2, r2
	mov	r2, r2, lsr #5
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3898
	mov	r0, r5
	bl	MVC_DirectOutput
	cmn	r0, #1
	mov	r4, r0
	beq	.L3899
.L3766:
	movw	r1, #3087
	b	.L3877
.L3892:
	movw	r3, #3132
	ldr	r2, .L3907+4
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
.L3772:
	ldr	r3, [r6, #3568]
	cmp	r3, #0
	beq	.L3784
	ldrb	r3, [r6, #3004]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3784
	ldr	r2, [r4, #2512]
	cmp	r2, #0
	beq	.L3784
	movw	ip, #47428
	mov	lr, r3
	movt	ip, 169
	add	ip, r5, ip
	b	.L3789
.L3786:
	ldr	r2, [r4, #2512]
	cmp	r2, r3
	bls	.L3784
.L3789:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldr	r1, [r6, #3560]
	ldr	r0, [r2, #20]
	cmp	r0, r1
	bne	.L3786
	ldr	r0, [r2, #56]
	ldr	r1, [r6, #3632]
	cmp	r0, r1
	bne	.L3786
	strb	lr, [r2, #3]
	ldr	r1, [ip]
	ldrb	r2, [r1, #5]	@ zero_extendqisi2
	cmp	r2, #1
	streqb	r2, [r1, #7]
	ldreq	r2, [ip]
	streqb	lr, [r2, #5]
	ldreq	r1, [ip]
	ldr	r0, [r5, #52]
	ldr	r2, [r1, #48]
	cmp	r2, r0
	add	r2, r5, r2, lsl #2
	strne	lr, [r2, #148]
	strne	r0, [r1, #48]
	b	.L3786
.L3784:
	ldr	r1, [r4, #2504]
	cmp	r1, #0
	beq	.L3783
	ldr	r3, [r4, #2312]
	cmp	r3, #0
	beq	.L3808
	movw	r2, #47368
	mov	r3, #0
	movt	r2, 169
	add	r2, r5, r2
	b	.L3790
.L3791:
	ldr	r0, [r2, #4]!
	cmp	r0, #0
	beq	.L3808
.L3790:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3791
.L3783:
	movw	r2, #11192
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L3900
	ldr	r3, [r4, #2508]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #2508]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
.L3755:
	mov	r4, #0
.L3793:
	add	r7, r7, #8192
	mov	r3, #0
	mov	r0, r4
	strb	r3, [r7, #3000]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3718:
	mvn	r1, #0
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L3717
	mov	r0, r9
	ldr	r2, .L3907+8
	movw	r1, #2886
	bl	dprint_normal
	movw	r3, #2887
	b	.L3878
.L3898:
	add	r4, r4, #45056
	ldr	ip, [r4, #2504]
	cmp	ip, #0
	beq	.L3763
	ldr	r3, [r4, #2312]
	adds	r1, r3, #0
	movne	r1, #1
	cmp	lr, r3
	movne	r1, #0
	cmp	r1, #0
	movweq	r2, #47368
	movteq	r2, 169
	addeq	r2, r5, r2
	bne	.L3901
.L3767:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3761
	ldr	r3, [r2, #4]!
	adds	r0, r3, #0
	movne	r0, #1
	cmp	lr, r3
	movne	r0, #0
	cmp	r0, #0
	beq	.L3767
.L3764:
	movw	r2, #11192
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	cmn	r0, #1
	mov	r4, r0
	beq	.L3902
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	movw	r3, #3113
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L3907
	mov	r3, #0
	mov	r0, #12
	bl	dprint_normal
	b	.L3755
.L3887:
	cmp	r0, #0
	beq	.L3725
	b	.L3732
.L3808:
	mov	r1, r3
	b	.L3783
.L3778:
	movw	r3, #3171
	mov	r10, r0
	mov	r1, r3
	str	r0, [sp]
	ldr	r2, .L3907+12
	mov	r0, #1
	bl	dprint_normal
	movw	r1, #3172
	mov	r3, r10
	str	r1, [sp]
	ldr	r2, .L3907
	mov	r0, #12
	bl	dprint_normal
.L3798:
	ldr	r3, [r6, #3552]
	mvn	r8, #0
	ldr	r0, [r5, #120]
	mov	r4, r8
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	movw	r3, #3227
	mov	r1, r3
	ldr	r2, .L3907+12
	str	r8, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r6, #3552]
	mov	r3, #0
	strb	r3, [r2, #5]
	ldr	r2, [r6, #3552]
	strb	r3, [r2, #2]
	b	.L3793
.L3886:
	movw	r1, #2894
	ldr	r2, .L3907+16
	mov	r0, #3
	bl	dprint_normal
	mov	r0, r5
	bl	MVC_DirectOutput
	ldr	r3, [r6, #3628]
	ldr	r2, [r5, #52]
	cmp	r3, r2
	addne	r3, r3, #36
	movne	r1, #0
	addne	r3, r5, r3, lsl #2
	mov	r4, r0
	strne	r1, [r3, #4]
	movw	r1, #2904
	strne	r2, [r6, #3628]
.L3877:
.L3721:
	mov	r3, r4
	str	r1, [sp]
	ldr	r2, .L3907
	mov	r0, #12
	bl	dprint_normal
	cmn	r4, #1
	bne	.L3793
	b	.L3798
.L3729:
	cmp	r2, #1
	beq	.L3903
	cmp	r1, #0
	beq	.L3732
	ldrb	r2, [r8, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3732
	b	.L3725
.L3891:
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3904
.L3776:
	mov	r0, r5
	bl	MVC_DirectOutput
	cmn	r0, #1
	mov	r4, r0
	beq	.L3905
.L3777:
	movw	r1, #3163
	b	.L3877
.L3802:
	mov	r9, r8
	b	.L3736
.L3895:
	ldrb	r3, [r10, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3737
	mov	r2, #3
	ldr	r3, [r9, #44]
	strb	r2, [r9, #2]
	ldr	r2, [r10, #604]
	add	r3, r3, r2
	str	r3, [r9, #44]
	b	.L3738
.L3740:
	ldr	r2, [fp, #-64]
	ldrb	r2, [r2, #156]	@ zero_extendqisi2
	ands	r10, r2, #3
	beq	.L3906
.L3743:
	ldr	r2, [r5, #224]
	ldr	r2, [r2, #4]
	cmp	r2, r3
	bcs	.L3745
	ldrsb	r1, [r9, #6]
	mov	r2, #0
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
	movw	r3, #2997
.L3878:
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L3907
	mvn	r3, #0
	mov	r0, #12
	bl	dprint_normal
	b	.L3798
.L3885:
	mov	r0, r8
	ldr	r2, .L3907+20
	movw	r1, #2876
	bl	dprint_normal
	movw	r3, #2877
	b	.L3878
.L3893:
	ldr	r3, .L3907+24
	movw	r1, #3139
	str	r8, [sp]
	mov	r0, #1
	ldr	r2, .L3907+28
	bl	dprint_normal
	movw	r3, #3140
	b	.L3878
.L3804:
	mov	r1, r3
	b	.L3751
.L3904:
	ldrb	r3, [r6, #3003]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r6, #3552]
	strne	r3, [r5, #524]
	b	.L3776
.L3903:
	cmp	r3, #0
	add	r3, r7, #12288
	ldr	r9, [r3, #96]
	beq	.L3734
	movw	r10, #11832
	ldrb	r1, [r6, #3643]	@ zero_extendqisi2
	movt	r10, 170
	add	r10, r5, r10
	b	.L3735
.L3897:
	ldr	r1, [fp, #-64]
	mov	r0, r5
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3748
.L3884:
	mov	r0, r3
	ldr	r2, .L3907+32
	movw	r1, #2862
	bl	dprint_normal
	movw	r3, #2863
	b	.L3878
.L3905:
	movw	r3, #3160
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3907+12
	mov	r0, #1
	bl	dprint_normal
	b	.L3777
.L3890:
	mov	r3, r0
	ldr	r2, .L3907+36
	movw	r1, #3064
	mov	r0, #1
	bl	dprint_normal
	movw	r3, #3065
	b	.L3878
.L3906:
	movw	r3, #2978
	ldr	r2, .L3907+40
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3907+44
	ldr	r3, [r3]
	subs	ip, r3, #0
	beq	.L3744
	mov	r3, r10
	mov	r2, r10
	mov	r1, #40
	ldr	r0, [r5, #120]
	blx	ip
.L3744:
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #96]
	cmp	r3, #0
	bne	.L3743
	b	.L3745
.L3900:
	movw	r3, #3213
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3907+12
	mov	r0, #1
	bl	dprint_normal
	movw	r3, #3214
	b	.L3878
.L3901:
	mov	r1, r2
	b	.L3764
.L3763:
	ldr	r3, [r6, #3568]
	cmp	r3, #0
	beq	.L3770
	ldr	r1, [r4, #2512]
	ldr	r2, [r4, #2516]
.L3796:
	movw	r3, #3122
	stmib	sp, {r1, r2}
	str	ip, [sp]
	mov	r1, r3
	ldr	r2, .L3907+48
	mov	r0, #1
	bl	dprint_normal
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	movw	r3, #3125
	b	.L3878
.L3889:
	str	r2, [sp]
	movw	r1, #3050
	ldr	r2, .L3907+52
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3907+44
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3758
	ldr	r0, [r5, #112]
	mov	r3, #8
	ldr	ip, [r6, #3604]
	sub	r2, fp, #52
	mov	r1, #23
	str	r0, [fp, #-48]
	str	ip, [fp, #-52]
	ldr	r0, [r5, #120]
	blx	r4
.L3758:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	mov	r3, #3056
	b	.L3878
.L3899:
	movw	r3, #3083
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3907+12
	mov	r0, #1
	bl	dprint_normal
	b	.L3766
.L3894:
	movw	r3, #3033
	str	r8, [sp]
	mov	r1, r3
	ldr	r2, .L3907+12
	mov	r0, #0
	bl	dprint_normal
	movw	r3, #3034
	b	.L3878
.L3902:
	movw	r3, #3106
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L3907+12
	mov	r0, #1
	bl	dprint_normal
	movw	r1, #3107
	mov	r3, r4
	str	r1, [sp]
	ldr	r2, .L3907
	mov	r0, #12
	bl	dprint_normal
	b	.L3798
.L3896:
	movw	r1, #2967
	mvn	r3, #0
	str	r1, [sp]
	mov	r0, #12
	ldr	r2, .L3907
	bl	dprint_normal
	b	.L3798
.L3908:
	.align	2
.L3907:
	.word	.LC412
	.word	.LC421
	.word	.LC414
	.word	.LC417
	.word	.LC415
	.word	.LC413
	.word	.LANCHOR0+412
	.word	.LC422
	.word	.LC411
	.word	.LC419
	.word	.LC416
	.word	g_EventReportFunc
	.word	.LC420
	.word	.LC418
	UNWIND(.fnend)
	.size	MVC_StorePicInDpb, .-MVC_StorePicInDpb
	.global	__aeabi_idivmod
	.align	2
	.global	MVC_DecGap
	.type	MVC_DecGap, %function
MVC_DecGap:
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
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	mov	r6, r0
	add	r3, r0, #11075584
	movw	r0, #2004
	add	r8, r3, #40960
	mul	r0, r0, r1
	ldr	r2, [r8, #2292]
	add	ip, r6, #11141120
	mov	lr, r3
	str	r3, [fp, #-80]
	movw	r3, #26790
	mov	r4, ip
	movt	r3, 42
	str	ip, [fp, #-76]
	add	r3, r2, r3
	add	ip, r6, r0
	movw	r2, #43312
	movt	r2, 169
	add	r2, ip, r2
	ldr	r1, [r6, #236]
	add	r9, lr, #36864
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	mov	ip, lr
	add	r5, r6, r3, lsl #2
	add	r4, r4, #8192
	ldrb	lr, [r1, #19]	@ zero_extendqisi2
	movw	r3, #43312
	str	r2, [fp, #-72]
	add	ip, ip, #45056
	ldr	r2, [r8, #676]
	cmp	lr, #1
	movt	r3, 169
	add	r3, r0, r3
	add	r3, r6, r3
	ldr	r0, [r5, #4]
	str	r2, [fp, #-52]
	ldr	r2, [r9, #3648]
	str	r2, [fp, #-64]
	moveq	r2, #2
	movne	r2, #0
	str	r2, [fp, #-56]
	ldr	r2, [r9, #3652]
	str	r2, [fp, #-68]
	ldr	r2, [r1, #2896]
	str	r3, [r4, #3556]
	ldr	r5, [ip, #2508]
	cmp	r5, #0
	beq	.L3924
	add	r2, r2, #4
	mov	r7, #1
	mov	r3, r7, asl r2
	add	r0, r0, r7
	str	r3, [fp, #-60]
	mov	r1, r3
	bl	__aeabi_uidivmod
	mov	r3, #0
	ldr	r2, .L3927
	mov	r0, #3
	str	r3, [r9, #3652]
	str	r3, [r9, #3648]
	mov	r5, r1
	movw	r1, #5461
	bl	dprint_normal
	ldr	r10, [fp, #-52]
	str	r5, [sp]
	movw	r1, #5462
	ldr	r2, .L3927+4
	mov	r0, #3
	mov	r3, r10
	bl	dprint_normal
	cmp	r10, r5
	bgt	.L3917
	b	.L3918
.L3915:
	strb	r10, [r4, #3004]
	mov	r0, r6
	bl	MVC_StorePicInDpb
	movw	r3, #26790
	movt	r3, 42
	ldr	r1, [fp, #-60]
	subs	ip, r0, #0
	add	r0, r5, #1
	bne	.L3925
	ldr	r2, [r8, #2292]
	add	r3, r2, r3
	add	r3, r6, r3, lsl #2
	str	r5, [r3, #4]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-52]
	cmp	r3, r1
	mov	r5, r1
	ble	.L3918
.L3917:
	mov	r1, #1
	mov	r0, r6
	bl	MVC_AllocFrameStore
	mov	r10, #0
	ldr	r2, .L3927+8
	movw	r1, #5478
	subs	r3, r0, #0
	mov	r0, #3
	bne	.L3926
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r2, [r4, #3552]
	strb	r7, [r4, #3006]
	ldr	r3, [fp, #-56]
	str	r5, [r2, #20]
	ldr	r2, [r4, #3552]
	str	r5, [r4, #3560]
	str	r5, [r2, #620]
	str	r3, [r4, #3568]
	ldr	r2, [r4, #3552]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #616]
	ldr	r2, [r4, #3552]
	strb	r7, [r2, #7]
	ldr	r2, [r4, #3552]
	strb	r3, [r2, #5]
	ldr	r2, [r4, #3552]
	strb	r7, [r2, #1]
	strb	r7, [r4, #3002]
	ldr	r2, [r4, #3556]
	ldr	r1, [r8, #2288]
	str	r1, [r4, #3632]
	strb	r3, [r2, #3]
	ldr	r3, [r6, #236]
	ldr	r3, [r3, #2900]
	cmp	r3, #0
	beq	.L3915
	str	r5, [r9, #3664]
	mov	r0, r6
	bl	MVC_DecPOC
	ldr	r3, [r9, #3644]
	str	r3, [r4, #3572]
	ldr	r3, [r9, #3640]
	str	r3, [r4, #3576]
	ldr	r3, [r9, #3632]
	str	r3, [r4, #3580]
	ldr	r3, [r9, #3636]
	str	r3, [r4, #3584]
	b	.L3915
.L3924:
	ldr	r2, .L3927+12
	movw	r1, #5454
	mov	r0, r5
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3918:
	ldr	r2, [fp, #-64]
	mov	r0, #0
	ldr	r3, [fp, #-76]
	str	r2, [r9, #3648]
	add	r3, r3, #8192
	ldr	r2, [fp, #-68]
	str	r2, [r9, #3652]
	ldrb	r2, [fp, #-72]	@ zero_extendqisi2
	ldr	r3, [r3, #3556]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3926:
	ldr	r2, [fp, #-64]
	movw	r1, #5474
	ldr	r3, [fp, #-76]
	mov	r0, r10
	ldrb	ip, [fp, #-72]	@ zero_extendqisi2
	str	r2, [r9, #3648]
	add	r3, r3, #8192
	ldr	r2, [fp, #-68]
	str	r2, [r9, #3652]
	ldr	r3, [r3, #3556]
	ldr	r2, .L3927+16
	strb	ip, [r3, #3]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3925:
	ldr	r3, [fp, #-80]
	mov	r0, r10
	ldr	r1, [fp, #-64]
	ldr	lr, [fp, #-68]
	add	r2, r3, #36864
	movw	r3, #5514
	str	r1, [r2, #3648]
	mov	r1, r3
	str	lr, [r2, #3652]
	ldr	lr, [r4, #3556]
	ldrb	r4, [fp, #-72]	@ zero_extendqisi2
	ldr	r2, .L3927+20
	strb	r4, [lr, #3]
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3928:
	.align	2
.L3927:
	.word	.LC424
	.word	.LC425
	.word	.LC427
	.word	.LC423
	.word	.LC426
	.word	.LC428
	UNWIND(.fnend)
	.size	MVC_DecGap, .-MVC_DecGap
	.align	2
	.global	MVC_InitPic
	.type	MVC_InitPic, %function
MVC_InitPic:
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
	add	r4, r0, #11141120
	add	r4, r4, #8192
	add	r10, r0, #11075584
	add	r6, r10, #40960
	ldr	r3, [r0, #252]
	ldrb	r1, [r4, #3000]	@ zero_extendqisi2
	mov	r8, #2240
	ldr	r2, [r6, #664]
	mov	r5, r0
	cmp	r1, #0
	mov	r1, #0
	str	r1, [fp, #-48]
	mla	r8, r8, r2, r3
	beq	.L3930
	ldr	r3, [r4, #3552]
	cmp	r3, r1
	beq	.L3931
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	cmp	r7, r1
	beq	.L4070
.L3931:
	mov	r3, #0
	strb	r3, [r4, #3000]
.L3930:
	sub	r1, fp, #48
	mov	r0, r5
	bl	MVC_GetReRangeFlag
	ldrb	r3, [r6, #660]	@ zero_extendqisi2
	cmp	r3, #255
	mov	r9, r0
	beq	.L4071
.L3932:
	cmp	r3, #0
	bne	.L3935
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4072
	ldr	r3, [r8, #28]
	ldr	r2, [r5, #28]
	cmp	r2, r3
	movweq	r3, #35364
	movteq	r3, 168
	addeq	r3, r5, r3
	streq	r3, [r5, #236]
	bne	.L4073
.L3935:
	add	r7, r10, #36864
	ldr	r3, [r8, #24]
	ldr	r2, [r7, #1392]
	cmp	r2, r3
	beq	.L4074
.L3939:
	mov	r3, #0
	mov	r1, r8
	strb	r3, [r8, #20]
	ldr	r0, [r5, #236]
	bl	mvc_assign_quant_params
	ldr	r3, .L4086
	movw	r0, #38232
	mov	r2, #2240
	movt	r0, 169
	mov	r1, r8
	add	r0, r5, r0
	ldr	r3, [r3, #56]
	blx	r3
.L3940:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L3941
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L3941
.L3942:
	ldr	r2, [r7, #1392]
	ldr	r3, [r8, #24]
	cmp	r2, r3
	bne	.L3950
	ldrb	r3, [r8, #20]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3950
.L3951:
	ldrb	r3, [r6, #660]	@ zero_extendqisi2
	cmp	r3, #255
	moveq	r3, #0
	streq	r3, [r6, #2292]
	beq	.L3953
	cmp	r3, #0
	bne	.L3953
	add	r1, r5, #10747904
	movw	r2, #22868
	add	r1, r1, #20480
	movt	r2, 164
	ldr	ip, [r6, #2288]
	add	r2, r5, r2
	ldr	r0, [r1, #2384]
	adds	r0, r0, #1
	beq	.L3954
	ldr	r1, [r1, #2388]
	cmp	ip, r1
	beq	.L3992
	mov	lr, r0
	b	.L3955
.L3956:
	ldr	r1, [r2, #4]!
	cmp	ip, r1
	beq	.L3954
.L3955:
	add	r3, r3, #1
	cmp	r3, lr
	mov	r0, r3
	bne	.L3956
.L3954:
	str	r0, [r6, #2292]
.L3953:
	ldrb	r2, [r6, #651]	@ zero_extendqisi2
	ldr	r3, [r5, #236]
	cmp	r2, #5
	ldreq	r2, [r6, #2292]
	ldr	r9, [r3, #2896]
	movweq	r3, #26790
	movteq	r3, 42
	addeq	r3, r2, r3
	ldreq	r8, [r6, #676]
	addeq	r3, r5, r3, lsl #2
	ldrne	r8, [r6, #676]
	streq	r8, [r3, #4]
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3959
	ldr	r2, [r5, #224]
	ldr	r3, [r2, #12]
	str	r2, [fp, #-56]
	cmp	r3, #2
	beq	.L3959
	ldr	r1, [r6, #2292]
	movw	r3, #26790
	movt	r3, 42
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	ldr	r0, [r3, #4]
	cmp	r0, r8
	beq	.L3959
	mov	r3, #1
	add	r9, r9, #4
	mov	r9, r3, asl r9
	add	r0, r0, r3
	str	r3, [fp, #-60]
	mov	r1, r9
	bl	__aeabi_uidivmod
	cmp	r1, r8
	beq	.L3959
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	str	r3, [r2, #588]
	ldr	r3, [r5, #224]
	ldr	r2, [r3, #588]
	cmp	r2, #0
	beq	.L4075
.L3960:
	add	r3, r10, #32768
	ldrb	r3, [r3, #1491]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3969
	ldr	r2, .L4086+4
	movw	r1, #5855
	mov	r0, #3
	bl	dprint_normal
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #592]
	bics	r3, r3, #1024
	bne	.L4066
	ldr	r2, [r6, #2288]
	cmp	r2, #0
	bne	.L4066
	ldr	r0, [r6, #2292]
	movw	r3, #26790
	movt	r3, 42
	mov	r1, r9
	add	r3, r0, r3
	str	r2, [fp, #-56]
	ldr	r8, [r6, #676]
	add	r3, r5, r3, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #1
	bl	__aeabi_uidivmod
	cmp	r8, r1
	bcs	.L3959
	ldrb	r3, [r6, #648]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3959
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	ldr	r0, [r6, #2292]
	movw	r3, #26790
	mov	r1, r9
	movt	r3, 42
	add	r3, r0, r3
	add	r3, r5, r3, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #1
	bl	__aeabi_uidivmod
	ldr	ip, [r6, #676]
	ldr	r2, [fp, #-56]
	movw	r3, #5867
	str	ip, [sp]
	mov	r0, r2
	ldr	r2, .L4086+8
	str	r1, [sp, #4]
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
.L4061:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3941:
	ldr	r3, [r5, #84]
	cmp	r9, #0
	add	r3, r3, #1
	str	r3, [r5, #84]
	bne	.L3943
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L3944
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L4076
.L4065:
	mov	r0, r5
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L3989
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	bne	.L3942
.L3948:
	ldr	r2, [r7, #1348]
	add	r3, r10, #32768
	mov	r0, r5
	mov	r2, r2, asl #1
	str	r2, [r5, #52]
	ldr	r2, [r7, #1328]
	ldrb	r9, [r3, #1492]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	r3, [r7, #1324]
	rsb	r9, r9, #2
	mov	r2, r2, asl #4
	add	r3, r3, #1
	mul	r9, r9, r2
	mov	r3, r3, asl #4
	str	r3, [fp, #-56]
	mov	r1, r3
	mov	r2, r9
	bl	MVC_ArrangeVahbMem
	ldr	r3, [fp, #-56]
	cmp	r0, #1
	beq	.L4077
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L4061
	mov	r4, #0
	ldr	r2, .L4086+12
	str	r4, [r5, #12]
	mov	r0, r4
	str	r4, [r5, #16]
	movw	r1, #5741
	bl	dprint_normal
	mov	r1, r4
	mov	r0, r5
	bl	MVC_ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3950:
	ldr	r3, .L4086
	movw	r0, #38232
	mov	r2, #0
	movt	r0, 169
	strb	r2, [r8, #20]
	add	r0, r5, r0
	mov	r1, r8
	ldr	r3, [r3, #56]
	mov	r2, #2240
	blx	r3
	b	.L3951
.L3969:
	mov	r0, r5
	bl	MVC_DecGap
	cmp	r0, #0
	bne	.L3972
.L4066:
	ldr	r8, [r6, #676]
.L3959:
	ldrb	r3, [r6, #656]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3973
	ldr	r2, [r6, #2292]
	movw	r3, #26790
	movt	r3, 42
	add	r3, r2, r3
	add	r3, r5, r3, lsl #2
	str	r8, [r3, #4]
.L3973:
	mov	r0, r5
	str	r8, [r7, #3664]
	bl	MVC_DecPOC
	mov	r1, #0
	mov	r0, r5
	bl	MVC_AllocFrameStore
	cmp	r0, #0
	bne	.L4078
	strb	r0, [r4, #3007]
	mov	r1, #1
	strb	r1, [r4, #3000]
	ldrb	r3, [r6, #651]	@ zero_extendqisi2
	strb	r3, [r4, #3006]
	ldr	r9, [r6, #676]
	str	r9, [r4, #3560]
	ldrb	r8, [r6, #656]	@ zero_extendqisi2
	str	r8, [r4, #3568]
	ldr	ip, [r7, #3644]
	str	ip, [r4, #3572]
	ldr	r3, [r7, #3640]
	str	r3, [r4, #3576]
	ldr	r2, [r7, #3632]
	str	r2, [r4, #3580]
	ldr	lr, [r7, #3636]
	str	r3, [r4, #3592]
	mvn	r3, #0
	str	ip, [r4, #3588]
	str	lr, [r4, #3600]
	str	r2, [r4, #3596]
	str	lr, [r4, #3584]
	strb	r0, [r4, #3002]
	strb	r0, [r4, #3005]
	strb	r0, [r4, #3004]
	str	r3, [r4, #3624]
	ldrb	r3, [r6, #649]	@ zero_extendqisi2
	cmp	r3, #0
	strneb	r1, [r6, #649]
	ldr	r2, [r5, #236]
	movne	r3, r1
	movne	r1, #2
	str	r3, [fp, #-60]
	ldrb	r0, [r2, #20]	@ zero_extendqisi2
	ldr	ip, [r2, #3952]
	rsb	r0, r0, #2
	str	r2, [fp, #-56]
	mla	r0, ip, r0, r0
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	str	r0, [r4, #3612]
	ldrb	r3, [r2, #20]	@ zero_extendqisi2
	ldr	ip, [r2, #3952]
	rsb	r1, r3, #2
	mla	r1, ip, r1, r1
	str	r1, [r4, #3616]
	ldr	r1, [r2, #3948]
	add	r3, r1, #1
	str	r3, [r4, #3608]
	mul	r3, r3, r0
	str	r3, [r4, #3620]
	ldrb	r3, [r7, #1368]	@ zero_extendqisi2
	strb	r3, [r4, #3008]
	movne	r3, #0
	bne	.L3976
	ldrb	r3, [r2, #21]	@ zero_extendqisi2
	adds	r3, r3, #0
	movne	r3, #1
.L3976:
	cmp	r8, #0
	strb	r3, [r4, #3009]
	beq	.L3977
	ldr	r2, [r6, #2292]
	movw	r3, #26790
	movt	r3, 42
	add	r3, r2, r3
	add	r3, r5, r3, lsl #2
	str	r9, [r3, #4]
.L3977:
	ldr	r3, [r4, #3552]
	cmp	r3, #0
	ldrneb	r2, [r6, #660]	@ zero_extendqisi2
	strneb	r2, [r3, #9]
	mvn	r3, #0
	str	r3, [r4, #3632]
	ldrb	r3, [r6, #659]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3979
	ldr	r3, [r6, #2288]
	str	r3, [r4, #3632]
	ldrb	r3, [r6, #657]	@ zero_extendqisi2
	strb	r3, [r4, #3010]
	ldrb	r3, [r6, #658]	@ zero_extendqisi2
	strb	r3, [r4, #3011]
.L3979:
	ldr	r2, [r6, #2292]
	movw	r0, #2004
	movw	r3, #43312
	movw	ip, #11424
	movt	r3, 169
	movt	ip, 170
	str	r2, [r4, #3636]
	add	ip, r5, ip
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	movw	r7, #11424
	movt	r7, 170
	movw	lr, #11440
	movt	lr, 170
	add	lr, r5, lr
	mla	r0, r0, r2, r5
	movw	r1, #5973
	ldr	r2, .L4086+16
	add	r10, r10, #32768
	add	r3, r0, r3
	str	r3, [r4, #3556]
	ldr	r3, [r5, #224]
	mov	r0, #24
	ldrd	r8, [r3, #32]
	strd	r8, [ip, #-8]
	ldrd	r8, [r3, #48]
	strd	r8, [r5, r7]
	ldrd	r8, [r3, #64]
	strd	r8, [lr, #-8]
	mvn	r8, #0
	mvn	r9, #0
	strd	r8, [r3, #32]
	ldrd	r8, [ip, #-8]
	ldr	r3, [r5, #120]
	strd	r8, [sp]
	bl	dprint_normal
	ldrd	r8, [r5, r7]
	ldr	r3, [r5, #120]
	movw	r1, #5974
	ldr	r2, .L4086+20
	mov	r0, #24
	strd	r8, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #236]
	ldrb	r2, [r4, #3172]	@ zero_extendqisi2
	mov	lr, #2
	ldrb	r3, [r4, #3173]	@ zero_extendqisi2
	ldr	r0, [ip, #748]
	and	r2, r2, #252
	ldr	r1, [r10, #1524]
	bfi	r3, lr, #0, #2
	subs	r0, r0, #1
	and	r3, r3, #243
	bfi	r3, lr, #4, #2
	and	r1, r1, #7
	movne	r0, #1
	bfi	r2, r0, #2, #3
	strb	r2, [r4, #3172]
	movw	r0, #11208
	ldr	r7, [ip, #56]
	uxtb	r2, r2
	strb	r3, [r4, #3173]
	movt	r0, 170
	bfi	r2, r7, #5, #3
	strb	r2, [r4, #3172]
	ldr	r2, [ip, #52]
	add	r0, r5, r0
	ldr	r3, [r4, #3172]
	bfi	r3, r2, #14, #3
	str	r3, [r4, #3172]
	bl	SetAspectRatio
	ldr	r0, [r4, #3552]
	ldr	r3, [r5, #84]
	cmp	r0, #0
	str	r3, [r4, #3116]
	beq	.L4079
	ldr	r3, [r5, #236]
	ldr	r3, [r3, #3984]
	str	r3, [r0, #120]
	str	r3, [r4, #3064]
	ldr	r3, [r5, #236]
	ldr	r2, [r4, #3552]
	ldr	r3, [r3, #3988]
	str	r3, [r2, #124]
	ldr	r2, [r4, #3552]
	ldr	r1, [r4, #3056]
	str	r3, [r4, #3068]
	str	r1, [r2, #112]
	ldr	r3, [r4, #3552]
	ldr	r2, [r4, #3060]
	str	r2, [r3, #116]
	ldrb	r3, [r4, #3003]	@ zero_extendqisi2
	ldr	r2, [r4, #3552]
	ldr	r1, [r4, #3172]
	adds	r3, r3, #0
	movne	r3, #1
	str	r3, [r4, #3036]
	str	r1, [r2, #228]
	ldr	r2, [r4, #3036]
	ldr	r3, [r4, #3552]
	str	r2, [r3, #92]
	ldr	r3, [r6, #2288]
	ldr	r2, [r4, #3552]
	str	r3, [r4, #3128]
	str	r3, [r2, #184]
	ldr	r2, [r4, #3036]
	ldr	r3, [r4, #3552]
	adds	r2, r2, #0
	ldr	r0, [r5, #120]
	movne	r2, #1
	ldrsb	r1, [r3, #6]
	bl	FSP_SetStoreType
	cmp	r0, #0
	bne	.L4080
.L3981:
	movw	ip, #11368
	movw	lr, #11400
	ldr	r3, [r5, #60]
	movt	ip, 170
	movt	lr, 170
	add	ip, r5, ip
	add	lr, r5, lr
	mov	r6, #0
.L3985:
	ldrd	r0, [ip, #8]!
	orrs	r2, r0, r1
	bne	.L3982
	cmp	r3, #0
	beq	.L3982
	ldr	r2, [r5, #528]
	subs	r3, r3, #1
	stmia	ip, {r2, r6}
	beq	.L3983
	add	r1, r5, #528
	mov	r2, #0
.L3984:
	add	r2, r2, #1
	ldr	r0, [r1, #4]!
	cmp	r2, r3
	str	r0, [r1, #-4]
	bne	.L3984
.L3983:
	add	r2, r3, #132
	str	r6, [r5, r2, asl #2]
	str	r3, [r5, #60]
.L3982:
	cmp	ip, lr
	bne	.L3985
	cmp	r3, #0
	beq	.L3987
	mov	r6, r3
	ble	.L3987
	add	r7, r3, #132
	mov	r8, #0
	add	r7, r5, r7, lsl #2
.L3988:
	ldr	r1, [r7, #-4]!
	sub	r6, r6, #1
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	cmp	r6, #0
	str	r8, [r7]
	bne	.L3988
.L3987:
	mov	r6, #0
	mov	r0, r5
	str	r6, [r5, #60]
	strb	r6, [r4, #3012]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	mov	r0, r5
	bl	MVC_CalcPicNum
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4074:
	ldrb	r3, [r8, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3940
	b	.L3939
.L4071:
	mov	r2, #1
	strb	r2, [r5, #2]
	ldr	r1, [r8, #28]
	movw	lr, #3992
	ldr	ip, [r5, #248]
	add	r2, r10, #32768
	movw	r7, #34240
	str	r1, [r5, #24]
	ldr	r1, [r8, #28]
	ldr	r0, [r2, #2216]
	mla	r1, lr, r1, ip
	ldr	r2, [r1, #744]
	cmp	r0, r2
	beq	.L4081
.L3933:
	ldr	r2, .L4086
	movt	r7, 169
	ldr	r3, [r5, #84]
	add	r7, r5, r7
	mov	ip, #0
	add	r3, r3, #1
	mov	r0, r7
	str	r3, [r5, #84]
	strb	ip, [r1, #26]
	ldr	r3, [r2, #56]
	movw	r2, #3992
	blx	r3
	ldrb	r3, [r6, #660]	@ zero_extendqisi2
.L3934:
	str	r7, [r5, #236]
	b	.L3932
.L3944:
	ldr	r2, .L4086+24
	movw	r1, #5705
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r5
	bl	MVC_GetBackPicFromVOQueue
	b	.L4065
.L4080:
	ldr	r3, .L4086+28
	mov	r1, #6016
	ldr	r2, .L4086+32
	mov	r0, #1
	bl	dprint_normal
	b	.L3981
.L3943:
	ldr	r2, .L4086+24
	movw	r1, #5705
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r5
	bl	MVC_GetBackPicFromVOQueue
	mov	r0, r5
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L3948
.L3989:
	movw	r3, #5723
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L4086+36
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4081:
	ldrb	r2, [r1, #26]	@ zero_extendqisi2
	cmp	r2, #0
	movteq	r7, 169
	addeq	r7, r5, r7
	beq	.L3934
	b	.L3933
.L4070:
	ldrsb	r1, [r3, #6]
	ldr	r0, [r0, #120]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #3552]
	strb	r7, [r3, #2]
	ldr	r3, [r4, #3552]
	strb	r7, [r3, #5]
	b	.L3931
.L4075:
	ldr	r2, [r3, #632]
	cmp	r2, #1
	beq	.L4082
.L3961:
	ldr	r3, [r6, #2292]
	ldr	r1, [r6, #676]
	add	r3, r5, r3, lsl #2
	add	r3, r3, #11075584
	add	r2, r3, #40960
	ldr	r2, [r2, #668]
	cmp	r1, r2
	bhi	.L4083
	rsb	r0, r2, r1
	ldr	ip, [r7, #1348]
	add	r0, r0, r9
	cmp	r2, #0
	cmpne	ip, r0
	bcs	.L3960
	ldrb	r2, [r6, #648]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L4084
	add	r3, r3, #40960
	cmp	r1, #0
	subne	r2, r1, #1
	subeq	r2, r9, #1
	mvn	r1, #0
	str	r2, [r3, #668]
	mov	r0, r5
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L3960
	movw	r3, #5845
.L4068:
	str	r0, [sp]
	mov	r1, r3
	ldr	r2, .L4086+40
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4072:
	strb	r3, [r5, #2]
	movw	r2, #8500
	ldr	r1, [r8, #28]
	movt	r2, 5
	ldr	r3, .L4086
	movw	r0, #22860
	movt	r0, 164
	add	r0, r5, r0
	mla	r1, r2, r1, r5
	ldr	r3, [r3, #56]
	add	r1, r1, #12992
	add	r1, r1, #12
	blx	r3
	add	r2, r5, #11010048
	add	r2, r2, #32768
	movw	r3, #35364
	movt	r3, 168
	add	r3, r5, r3
	str	r3, [r5, #236]
	ldr	r3, [r2, #3340]
	str	r3, [r5, #28]
	b	.L3935
.L4077:
	mov	r3, r3, lsr #4
	mov	r9, r9, lsr #4
	str	r3, [r5, #12]
	str	r9, [r5, #16]
	b	.L3942
.L4083:
	ldr	ip, [r7, #1348]
	rsb	r0, r2, r1
	cmp	r2, #0
	cmpne	ip, r0
	bcs	.L3960
	ldrb	r2, [r6, #648]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L4085
	add	r3, r3, #40960
	cmp	r1, #0
	subne	r2, r1, #1
	subeq	r2, r9, #1
	mvn	r1, #0
	str	r2, [r3, #668]
	mov	r0, r5
	bl	MVC_FlushDPB
	cmp	r0, #0
	movwne	r3, #5818
	beq	.L3960
	b	.L4068
.L4073:
	ldr	r2, .L4086+44
	movw	r1, #5683
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L3972:
	movw	r3, #5890
	ldr	r2, .L4086+48
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4082:
	ldr	r2, [r3, #628]
	cmp	r2, #0
	bne	.L3961
	ldr	r2, [r3, #636]
	cmp	r2, #0
	bne	.L3961
	ldr	r3, [r3, #592]
	add	r3, r3, #1024
	cmp	r3, #2048
	bhi	.L3960
	b	.L3961
.L3992:
	mov	r0, r3
	b	.L3954
.L4078:
	movw	r3, #5909
	ldr	r2, .L4086+52
	mov	r1, r3
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4079:
	movw	r3, #5995
	ldr	r2, .L4086+56
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4076:
	movw	r3, #5714
	str	r0, [sp]
	mov	r1, r3
	mov	r0, r9
	ldr	r2, .L4086+40
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4084:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	ldr	r3, [r6, #2292]
	ldr	r1, [r7, #1348]
	movw	r2, #26790
	ldr	ip, [r6, #676]
	movt	r2, 42
	add	r2, r3, r2
	movw	r3, #5834
.L4067:
	add	r5, r5, r2, lsl #2
	str	r1, [sp, #4]
	ldr	r2, .L4086+60
	mov	r1, r3
	ldr	lr, [r5, #4]
	mov	r0, #0
	rsb	ip, lr, ip
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L4061
.L4085:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	ldr	r3, [r6, #2292]
	movw	r2, #26790
	ldr	r1, [r7, #1348]
	movt	r2, 42
	ldr	ip, [r6, #676]
	add	r2, r3, r2
	movw	r3, #5807
	b	.L4067
.L4087:
	.align	2
.L4086:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC433
	.word	.LC434
	.word	.LC431
	.word	.LC437
	.word	.LC438
	.word	.LC441
	.word	.LANCHOR0+432
	.word	.LC440
	.word	.LC430
	.word	.LC429
	.word	.LC24
	.word	.LC435
	.word	.LC436
	.word	.LC439
	.word	.LC432
	UNWIND(.fnend)
	.size	MVC_InitPic, .-MVC_InitPic
	.align	2
	.global	MVC_DecSlice
	.type	MVC_DecSlice, %function
MVC_DecSlice:
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
	ldr	r3, [r0, #68]
	mov	r4, r0
	ldr	r2, .L4142
	movw	r1, #7826
	sub	r3, r3, #1
	mov	r0, #20
	add	r5, r4, #11075584
	bl	dprint_normal
	ldr	r3, [r4, #232]
	add	r5, r5, #40960
	mov	r0, r4
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r5, #651]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r5, #656]
	bl	MVC_ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L4135
	mov	r0, r4
	bl	MVC_ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L4093
	ldr	r3, [r4, #64]
	cmp	r3, #0
	moveq	r2, r3
	beq	.L4095
	movw	r7, #12496
	mov	r9, r0
	movt	r7, 170
	mov	r2, r0
	add	r7, r4, r7
	mov	lr, r0
	b	.L4103
.L4136:
	cmp	ip, r0
	add	r2, r6, r2
	rsbhi	r0, r0, ip
	rsbhi	r9, r9, r8
	addhi	r0, r0, r9
	movls	r0, r8
	add	r2, r2, r0
.L4101:
	cmp	r1, #0
	add	lr, lr, #1
	movne	r0, r1
	movne	r9, r6
	moveq	r0, ip
	moveq	r9, r8
	cmp	lr, r3
	beq	.L4095
.L4103:
	ldr	r6, [r7, #4]!
	ldr	ip, [r6, #8]
	ldr	r1, [r6, #36]
	cmp	ip, #0
	ldrne	r8, [r6, #12]
	moveq	r8, ip
	cmp	r1, #0
	ldrne	r6, [r6, #40]
	moveq	r6, r1
	cmp	r0, #0
	bne	.L4136
	add	r2, r8, r2
	add	r2, r2, r6
	b	.L4101
.L4095:
	add	r6, r4, #11141120
	str	r2, [r4, #104]
	add	r6, r6, #8192
	movw	r0, #1620
	ldr	ip, [r6, #3612]
	ldr	r1, [r6, #3608]
	mul	r1, r1, ip
	cmp	r1, r0
	movgt	r1, r1, asl #7
	ble	.L4137
.L4105:
	ldr	r0, [r4, #32]
	cmp	r0, r3
	bls	.L4106
	cmp	r1, r2
	bcc	.L4106
	ldrb	r3, [r5, #653]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4138
.L4109:
	mov	r0, r4
	bl	MVC_PicTypeStatistic
	mov	r0, r4
	bl	MVC_DecList
	cmp	r0, #0
	bne	.L4139
	mov	r0, r4
	bl	MVC_IsRefListWrong
	subs	r5, r0, #0
	bne	.L4140
	mov	r0, r4
	bl	MVC_CalcStreamBits
	mov	r0, r4
	bl	MVC_WriteSliceMsg
	mov	r0, r4
	bl	MVC_ExitSlice
	ldr	r3, [r4, #100]
	mov	r0, r5
	mov	r2, #1
	add	r3, r3, r2
	strb	r2, [r4, #4]
	str	r3, [r4, #100]
.L4092:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4137:
	mov	r0, r1, asl #9
	sub	r1, r0, r1, asl #7
	cmp	r1, #16384
	movlt	r1, #16384
	b	.L4105
.L4138:
	ldr	r2, .L4142+4
	movw	r1, #7905
	mov	r0, #3
	bl	dprint_normal
	ldr	r3, [r4, #88]
	mov	r2, #0
	str	r2, [r4, #100]
	add	r3, r3, #1
	str	r3, [r4, #88]
	ldrb	r3, [r6, #3003]	@ zero_extendqisi2
	mov	r0, r4
	cmp	r3, r2
	ldreq	r3, [r4, #92]
	ldrne	r3, [r4, #96]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r4, #92]
	strne	r3, [r4, #96]
	bl	MVC_InitPic
	cmn	r0, #2
	beq	.L4092
	cmp	r0, #0
	bne	.L4141
	mov	r0, r4
	bl	MVC_WritePicMsg
	b	.L4109
.L4106:
	str	r1, [sp, #4]
	mov	r0, #0
	str	r2, [sp]
	movw	r1, #7892
	ldr	r2, .L4142+8
	bl	dprint_normal
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #32]
	cmp	r3, r2
	bcc	.L4108
	ldr	r1, .L4142+12
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L4108
	str	r3, [fp, #-44]
	mov	r1, #27
	str	r2, [fp, #-40]
	mov	r3, #8
	sub	r2, fp, #44
	ldr	r0, [r4, #120]
	blx	r5
.L4108:
	ldr	r2, .L4142+16
	movw	r1, #7899
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L4092
.L4135:
	ldr	r2, .L4142+20
	movw	r1, #7835
.L4133:
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L4142+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4131
	sub	r2, fp, #36
	mvn	r1, #0
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #9
	ldr	r0, [r4, #120]
	blx	r5
.L4131:
	mov	r0, r4
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	b	.L4092
.L4139:
	mov	r3, r0
	ldr	r2, .L4142+24
	movw	r1, #7939
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L4092
.L4140:
	ldr	r2, .L4142+28
	movw	r1, #7947
	mov	r0, #1
	bl	dprint_normal
	b	.L4131
.L4093:
	ldr	r2, .L4142+20
	movw	r1, #7845
	b	.L4133
.L4141:
	ldr	r2, .L4142+32
	movw	r1, #7926
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L4092
.L4143:
	.align	2
.L4142:
	.word	.LC383
	.word	.LC444
	.word	.LC442
	.word	g_EventReportFunc
	.word	.LC443
	.word	.LC384
	.word	.LC446
	.word	.LC447
	.word	.LC445
	UNWIND(.fnend)
	.size	MVC_DecSlice, .-MVC_DecSlice
	.align	2
	.global	MVC_DecOneNal
	.type	MVC_DecOneNal, %function
MVC_DecOneNal:
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
	ldr	ip, [r0, #232]
	mov	r5, r1
	mov	r4, r0
	ldr	r3, [ip, #68]
	cmp	r3, #0
	ldrne	r1, [r0, #104]
	movne	r2, ip
	movne	r3, #0
	beq	.L4149
.L4148:
	ldr	r0, [r2, #12]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, r0
	str	r1, [r4, #104]
	ldr	r0, [ip, #68]
	cmp	r0, r3
	bhi	.L4148
.L4149:
	add	r7, r4, #548
	mov	r8, #0
	mov	r1, #32
	strb	r8, [ip]
	mov	r0, r7
	bl	BsGet
	ldr	r3, [r4, #232]
	and	r1, r0, #31
	strb	r1, [r3, #2]
	ldr	r3, [r4, #232]
	mov	r6, r0
	ubfx	r0, r0, #5, #2
	ubfx	r2, r6, #7, #1
	mvn	r1, #0
	strb	r0, [r3, #4]
	ldr	r3, [r4, #232]
	str	r2, [r3, #76]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #64]
	add	r3, r3, #32
	str	r3, [r2, #64]
	ldr	r3, [r4, #232]
	strb	r8, [r4, #10]
	strb	r1, [r3, #5]
	ldr	r3, [r4, #232]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #20
	beq	.L4332
.L4147:
	ldr	r3, [r4, #68]
	movw	r1, #10726
	str	r2, [sp]
	mov	r0, #20
	ldr	r2, .L4343
	bl	dprint_normal
	ldr	r3, [r4, #68]
	movw	r2, #371
	cmp	r3, r2
	beq	.L4333
.L4152:
	ldr	r2, [r4, #232]
	add	r3, r3, #1
	str	r3, [r4, #68]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	sub	r2, r3, #1
	cmp	r2, #29
	ldrls	pc, [pc, r2, asl #2]
	b	.L4153
.L4155:
	.word	.L4154
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4154
	.word	.L4156
	.word	.L4157
	.word	.L4158
	.word	.L4159
	.word	.L4160
	.word	.L4161
	.word	.L4162
	.word	.L4163
	.word	.L4164
	.word	.L4165
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4166
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4153
	.word	.L4167
.L4167:
	mov	r3, #30
	ldr	r2, .L4343+4
	movw	r1, #10914
	mov	r0, #20
	bl	dprint_normal
	cmp	r5, #0
	bne	.L4193
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4193
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	str	r5, [r4, #232]
.L4193:
	mov	r1, #32
	mov	r0, r7
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r7
	bl	BsGet
	ldr	r3, .L4343+8
	rev	r5, r5
	ldr	r2, [r3, #440]
	ldr	r3, [r3, #436]
	rev	r0, r0
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L4311
	ldr	r5, .L4343+12
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4194
	mov	r3, #0
	mov	r1, #41
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r6
.L4194:
	mov	r6, #0
	mov	r0, r4
	strb	r6, [r4]
	bl	MVC_DecVDM
	cmp	r0, r6
	beq	.L4311
.L4326:
	ldr	r5, [r5]
	cmp	r5, r6
	beq	.L4310
	ldr	r0, [r4, #120]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #42
	blx	r5
	mvn	r0, #0
	b	.L4180
.L4154:
	ldr	ip, [r4, #80]
	movw	r1, #10739
	ldr	r2, .L4343+16
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [r4, #232]
	add	r0, r4, #11075584
	add	r2, r4, #12288
	add	r0, r0, #40960
	mvn	lr, #0
	ldrb	ip, [r3, #2]	@ zero_extendqisi2
	mov	r1, #0
	strb	ip, [r0, #651]
	ldrb	r5, [r3, #4]	@ zero_extendqisi2
	strb	r5, [r0, #656]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	str	lr, [r0, #2288]
	strb	r1, [r0, #659]
	strb	r3, [r0, #660]
	ldrb	lr, [r2, #704]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L4334
	cmp	r3, #255
	beq	.L4335
.L4169:
	ldr	r3, [r4, #88]
	movw	r1, #10774
	ldr	r2, .L4343+20
	mov	r0, #19
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_SliceCheck
	subs	r5, r0, #0
	mov	r0, r4
	bne	.L4336
	bl	MVC_DecSlice
	cmn	r0, #2
	beq	.L4180
	cmp	r0, #0
	beq	.L4311
	ldr	r3, .L4343+12
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L4310
	ldr	r0, [r4, #120]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r6
.L4310:
	mvn	r0, #0
	b	.L4180
.L4157:
	ldr	ip, [r4, #72]
	movw	r1, #10815
	mov	r3, #7
	ldr	r2, .L4343+24
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_DecSPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4185
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4185:
	cmp	r5, #0
	bne	.L4337
	ldr	r3, [r4, #72]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #72]
	b	.L4180
.L4156:
	movw	r1, #10832
	mov	r3, #6
	ldr	r2, .L4343+28
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_DecSEI
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4187
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4187:
	cmp	r5, #0
	bne	.L4338
.L4311:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4158:
	ldr	ip, [r4, #76]
	movw	r1, #10799
	mov	r3, #8
	ldr	r2, .L4343+32
	mov	r0, #20
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_DecPPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4183
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4183:
	cmp	r5, #0
	bne	.L4339
	ldr	r3, [r4, #76]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #76]
	b	.L4180
.L4159:
	ldr	r2, .L4343+36
	mov	r3, #9
	movw	r1, #10845
.L4318:
	mov	r0, #20
	bl	dprint_normal
.L4323:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4311
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #232]
.L4180:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4160:
	mov	r3, #10
	ldr	r2, .L4343+40
	movw	r1, #10850
	b	.L4318
.L4161:
	mov	r3, #11
	ldr	r2, .L4343+44
	movw	r1, #10860
	mov	r0, #20
	bl	dprint_normal
	mov	r1, #32
	mov	r0, r7
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r7
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L4323
	ldr	r5, .L4343+12
	mov	r3, #1
	strb	r3, [r4, #1]
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4190
	mov	r3, #0
	mov	r1, #41
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r6
.L4190:
	mov	r6, #0
	mov	r0, r4
	strb	r6, [r4]
	bl	MVC_DecVDM
	cmp	r0, r6
	beq	.L4323
	b	.L4326
.L4162:
	mov	r3, #12
	ldr	r2, .L4343+48
	movw	r1, #10855
	b	.L4318
.L4163:
	mov	r3, #13
	ldr	r2, .L4343+52
	movw	r1, #10882
	b	.L4318
.L4164:
	mov	r3, #14
	ldr	r2, .L4343+56
	movw	r1, #10888
	b	.L4318
.L4165:
	movw	r1, #10893
	mov	r3, #15
	ldr	r2, .L4343+60
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_DecSubSPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4191
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4191:
	cmp	r5, #0
	bne	.L4340
	ldr	r3, [r4, #20]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #20]
	b	.L4180
.L4166:
	mov	r3, #19
	ldr	r2, .L4343+64
	movw	r1, #10909
	b	.L4318
.L4153:
	str	r6, [sp]
	mov	r1, #10944
	ldr	r2, .L4343+68
	mov	r0, #20
	bl	dprint_normal
	cmp	r6, #256
	beq	.L4195
	ldr	r2, .L4343+72
	movw	r1, #10948
	mov	r0, #1
	bl	dprint_normal
.L4195:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4196
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4196:
	ldr	r3, .L4343+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4311
.L4315:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	b	.L4311
.L4333:
	ldr	r2, .L4343+76
	movw	r1, #10730
	mov	r0, #20
	bl	dprint_normal
	ldr	r3, [r4, #68]
	b	.L4152
.L4332:
	mov	r1, #24
	mov	r0, r7
	bl	BsGet
	ldr	r3, [r4, #232]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #5]
	ldr	r3, [r4, #232]
	mov	r6, r0
	ldrsb	r2, [r3, #5]
	cmp	r2, #0
	bne	.L4150
	add	r2, r4, #12288
	mov	r0, #1
	ubfx	r1, r6, #16, #6
	ubfx	ip, r6, #6, #10
	strb	r0, [r2, #704]
	ubfx	r0, r6, #3, #3
	strb	r1, [r2, #706]
	ubfx	r1, r6, #2, #1
	strb	r0, [r2, #707]
	ubfx	r0, r6, #1, #1
	strb	r1, [r2, #708]
	and	r1, r6, #1
	strb	r0, [r2, #709]
	ubfx	r0, r6, #22, #1
	str	ip, [r2, #712]
	strb	r1, [r2, #710]
	strb	r0, [r2, #705]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #20
	beq	.L4341
.L4150:
	ldr	r2, [r3, #64]
	add	r2, r2, #24
	str	r2, [r3, #64]
	ldr	r3, [r4, #232]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	b	.L4147
.L4336:
	bl	MVC_ClearCurrSlice
	ldr	r3, .L4343+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4310
.L4179:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	mvn	r0, #0
	b	.L4180
.L4340:
	ldr	r2, .L4343+80
	movw	r1, #10899
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L4343+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4310
	sub	r2, fp, #36
	ldr	r0, [r4, #120]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #9
	str	r4, [r2, #-4]!
	blx	r5
	mov	r0, r4
	b	.L4180
.L4337:
	ldr	r5, .L4343+12
	movw	r1, #10821
	ldr	r2, .L4343+84
.L4330:
	mov	r0, #1
	bl	dprint_normal
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4310
	sub	r2, fp, #36
	mvn	r7, #0
	mov	r3, #4
	mov	r1, #9
	str	r7, [r2, #-4]!
	ldr	r0, [r4, #120]
	blx	r6
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L4179
	b	.L4310
.L4339:
	ldr	r5, .L4343+12
	movw	r1, #10805
	ldr	r2, .L4343+88
	b	.L4330
.L4338:
	ldr	r2, .L4343+92
	movw	r1, #10838
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L4343+12
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L4315
	b	.L4311
.L4335:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L4169
	add	r3, r4, #10747904
	add	r3, r3, #20480
	ldr	r2, [r3, #2384]
	cmp	r2, #0
	beq	.L4172
	ldrb	r2, [r3, #2380]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4173
.L4172:
	add	r3, r4, #12992
	mov	r2, #0
	add	r3, r3, #16
.L4176:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L4174
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L4342
.L4174:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L4176
	mvn	r3, #0
.L4309:
	cmn	r3, #1
	str	r3, [r0, #2288]
	beq	.L4169
	sub	ip, ip, #5
	mov	r3, #1
	clz	ip, ip
	strb	r3, [r0, #659]
	strb	r3, [r0, #658]
	mov	ip, ip, lsr #5
	strb	ip, [r0, #657]
	b	.L4169
.L4334:
	strb	lr, [r0, #659]
	ldr	r3, [r2, #712]
	str	r3, [r0, #2288]
	ldrb	r3, [r2, #708]	@ zero_extendqisi2
	strb	r3, [r0, #657]
	ldrb	r3, [r2, #709]	@ zero_extendqisi2
	strb	r3, [r0, #658]
	strb	r1, [r2, #704]
	b	.L4169
.L4341:
	cmp	r0, #0
	movne	r2, #1
	moveq	r2, #5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #232]
	b	.L4150
.L4342:
	movw	r3, #8500
	movt	r3, 5
	mla	r3, r3, r2, r4
	add	r3, r3, #12992
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	b	.L4309
.L4173:
	ldr	r3, [r3, #2388]
	b	.L4309
.L4344:
	.align	2
.L4343:
	.word	.LC448
	.word	.LC466
	.word	.LANCHOR1
	.word	g_EventReportFunc
	.word	.LC450
	.word	.LC451
	.word	.LC454
	.word	.LC456
	.word	.LC452
	.word	.LC458
	.word	.LC459
	.word	.LC461
	.word	.LC460
	.word	.LC462
	.word	.LC463
	.word	.LC464
	.word	.LC465
	.word	.LC467
	.word	.LC468
	.word	.LC449
	.word	.LC325
	.word	.LC455
	.word	.LC453
	.word	.LC457
	UNWIND(.fnend)
	.size	MVC_DecOneNal, .-MVC_DecOneNal
	.align	2
	.global	MVC_DEC_DecodePacket
	.type	MVC_DEC_DecodePacket, %function
MVC_DEC_DecodePacket:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	cmp	r1, #0
	mov	r4, r0
	mov	r0, #0
	str	r0, [fp, #-48]
	str	r0, [fp, #-52]
	str	r0, [fp, #-56]
	beq	.L4408
	ldr	r2, [r4, #224]
	ldrb	ip, [r4, #5]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	ip, #1
	mov	r3, r3, asl #16
	and	r3, r3, #196608
	str	r3, [r4, #108]
	ldr	r3, [r2]
	str	r3, [r4, #112]
	ldr	r3, [r2, #4]
	strb	r0, [r4, #10]
	str	r3, [r4, #116]
	beq	.L4348
	ldr	r3, [r2, #816]
	cmp	r3, #1
	addne	r5, r4, #11141120
	addne	r5, r5, #12288
	beq	.L4409
.L4349:
	mov	r0, r4
	bl	MVC_ReceivePacket
	ldr	r3, [r4, #232]
	str	r3, [r5, #1700]
.L4351:
	cmp	r0, #0
	mov	r3, #0
	strb	r3, [r4, #5]
	beq	.L4352
.L4371:
	mov	r0, #0
.L4403:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4409:
	ldr	r3, [r2, #848]
	add	r5, r4, #11141120
	add	r5, r5, #12288
	cmp	r3, #1
	bne	.L4349
	ldr	r3, [r5, #1696]
	cmp	r3, #1
	bne	.L4349
	ldr	r3, [r5, #1700]
	str	r3, [r4, #232]
	str	r0, [r5, #1696]
	strb	r0, [r4, #5]
	b	.L4350
.L4352:
	ldr	r3, [r4, #232]
.L4350:
	mov	r2, #0
	str	r2, [r3, #64]
	ldr	r3, [r4, #232]
	add	r6, r4, #548
	mov	r0, r6
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #8]
	bl	BsInit
	mov	r1, #32
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #232]
	mvn	r2, #0
	mov	r5, r0
	and	r0, r0, #31
	strb	r0, [r3, #2]
	ubfx	r1, r5, #5, #2
	ldr	r3, [r4, #232]
	strb	r1, [r3, #4]
	ldr	r3, [r4, #232]
	strb	r2, [r3, #5]
	ldr	r3, [r4, #232]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #20
	beq	.L4410
.L4406:
	and	r5, r5, #27
	mov	r3, #0
	cmp	r5, #1
	strb	r3, [r4, #10]
	beq	.L4357
.L4358:
	mov	r0, r4
	bl	MVC_FindTrailZeros
	cmp	r0, #0
	bne	.L4411
.L4370:
	ldr	r3, [r4, #232]
	mov	r5, #0
	mov	r0, r6
	str	r5, [r3, #64]
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	bl	BsInit
	mov	r1, r5
	mov	r0, r4
	bl	MVC_DecOneNal
	cmn	r0, #2
	beq	.L4403
	cmp	r0, r5
	beq	.L4371
	ldr	r3, .L4415
	ldr	r6, [r3]
	cmp	r6, r5
	beq	.L4407
	ldr	r0, [r4, #120]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r6
.L4407:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4348:
	ldr	r0, [r4, #232]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4351
.L4410:
	mov	r1, #24
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #232]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #5]
	ldr	r1, [r4, #232]
	ldrsb	r2, [r1, #5]
	cmp	r2, #0
	bne	.L4406
	ubfx	ip, r0, #22, #1
	add	r3, r4, #12288
	cmp	ip, #0
	mov	r5, #1
	strb	ip, [r3, #705]
	ubfx	lr, r0, #6, #10
	ubfx	ip, r0, #2, #1
	strb	r5, [r3, #704]
	strb	ip, [r3, #708]
	ubfx	r0, r0, #1, #1
	str	lr, [r3, #712]
	movne	ip, r5
	strb	r0, [r3, #709]
	moveq	ip, #5
	strb	ip, [r1, #2]
	strb	r2, [r4, #10]
.L4357:
	sub	r2, fp, #40
	sub	r1, fp, #44
	mov	r0, r4
	bl	MVC_InquireSliceProperty
	cmp	r0, #0
	bne	.L4359
	ldr	r3, [fp, #-44]
	ldr	r2, [r4, #128]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r2, r3
	str	r3, [r4, #128]
	bne	.L4412
.L4360:
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L4358
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L4413
.L4367:
	sub	r3, fp, #48
	sub	r2, fp, #52
	sub	r1, fp, #56
	ldr	r0, [r4, #120]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #696]
	cmp	r3, #1
	bne	.L4358
	ldr	r2, [fp, #-48]
	cmp	r2, #0
	ble	.L4414
.L4364:
	mov	r3, #1
	mvn	r0, #1
	strb	r3, [r4, #5]
	b	.L4403
.L4411:
	ldr	r2, .L4415+4
	movw	r1, #11670
	mov	r0, #20
	bl	dprint_normal
	b	.L4370
.L4359:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4369
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4369:
	ldr	r3, .L4415
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4407
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	mvn	r0, #0
	b	.L4403
.L4412:
	add	r5, r4, #11075584
	add	r5, r5, #40960
	ldrb	r3, [r5, #649]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #132]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #132]
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L4360
	ldr	r3, [r4, #232]
	mov	ip, #0
	mov	r0, r6
	mov	r2, #12
	ldr	r1, .L4415+8
	str	ip, [r3, #64]
	bl	BsInit
	mov	r1, #1
	mov	r0, r4
	bl	MVC_DecOneNal
	ldrb	r3, [r5, #649]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #132]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #132]
	b	.L4364
.L4413:
	movw	r3, #11633
	mov	r2, #0
	mov	r1, r3
	str	r2, [sp]
	mov	r0, #20
	ldr	r2, .L4415+12
	bl	dprint_normal
	b	.L4367
.L4408:
	movw	r3, #11522
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L4415+16
	ldr	r3, .L4415+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L4403
.L4414:
	ldr	r2, [fp, #-52]
	cmp	r2, #32
	bgt	.L4364
	ldr	r8, [r4, #228]
	cmp	r8, #0
	bne	.L4364
	ldr	ip, [r4, #88]
	cmp	ip, #0
	beq	.L4358
	ldr	r2, [r4, #12]
	cmp	r2, #0
	beq	.L4358
	add	r5, r4, #11141120
	ldr	r0, [r4, #16]
	add	r5, r5, #12288
	ldr	r1, [r5, #1704]
	cmp	r0, r1
	beq	.L4358
	ldr	lr, [r5, #1708]
	cmp	r2, lr
	beq	.L4358
	str	r0, [sp, #16]
	mov	r0, r3
	str	r2, [sp, #12]
	str	r1, [sp, #8]
	movw	r1, #11650
	ldr	r2, .L4415+24
	stmia	sp, {ip, lr}
	bl	dprint_normal
	ldr	r2, .L4415
	ldr	r3, [r4, #16]
	ldr	r7, [r2]
	str	r3, [r5, #1704]
	ldr	r3, [r4, #12]
	cmp	r7, #0
	str	r3, [r5, #1708]
	beq	.L4358
	mov	r3, r8
	mov	r2, r8
	mov	r1, #48
	ldr	r0, [r4, #120]
	blx	r7
	b	.L4358
.L4416:
	.align	2
.L4415:
	.word	g_EventReportFunc
	.word	.LC470
	.word	.LANCHOR1+432
	.word	.LC429
	.word	.LC14
	.word	.LC13
	.word	.LC469
	UNWIND(.fnend)
	.size	MVC_DEC_DecodePacket, .-MVC_DEC_DecodePacket
	.align	2
	.global	MVC_DEC_VDMPostProc
	.type	MVC_DEC_VDMPostProc, %function
MVC_DEC_VDMPostProc:
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
	ldrb	r7, [r0]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r7, #0
	bne	.L4418
	add	r6, r0, #11141120
	add	r6, r6, #8192
	str	r1, [r6, #3604]
	bl	MVC_ClearAllSlice
	mov	r0, r4
	bl	MVC_StorePicInDpb
	subs	r5, r0, #0
	bne	.L4429
	mov	r3, #1
	mov	r0, r5
	strb	r3, [r4, #4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4418:
	add	r3, r0, #11141120
	add	r3, r3, #8192
	str	r1, [r3, #3604]
	bl	MVC_ClearAllSlice
	mov	r0, r4
	bl	MVC_StorePicInDpb
	subs	r3, r0, #0
	bne	.L4430
.L4421:
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	subs	r3, r0, #0
	bne	.L4431
.L4422:
	ldr	ip, [r4, #40]
	add	r2, r4, #11075584
	add	r2, r2, #40960
	mov	r1, #0
	movw	r3, #23352
	strb	r1, [r4, #4]
	mov	r0, r1
	movt	r3, 1
	str	ip, [r2, #2316]
	mov	r5, #2
	strb	r1, [r2, #2304]
	mov	r4, #7
	str	r1, [r2, #2336]
	mov	lr, #32
	str	r1, [r2, #2340]
	mov	ip, #3
	str	r3, [r2, #2320]
	mvn	r1, #0
	mov	r3, #1048576
	strb	r5, [r2, #2305]
	strb	r4, [r2, #2307]
	strb	lr, [r2, #2306]
	str	ip, [r2, #2328]
	str	r1, [r2, #2332]
	str	r3, [r2, #2344]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4429:
	ldr	r3, [r6, #3552]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	mov	r3, r5
	ldr	r2, .L4432
	movw	r1, #11748
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mov	r0, r4
	mvn	r1, #0
	bl	MVC_ClearDPB
	str	r7, [r6, #3552]
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4431:
	ldr	r2, .L4432+4
	movw	r1, #11774
	mov	r0, #1
	bl	dprint_normal
	b	.L4422
.L4430:
	ldr	r2, .L4432+8
	movw	r1, #11767
	mov	r0, #1
	bl	dprint_normal
	b	.L4421
.L4433:
	.align	2
.L4432:
	.word	.LC471
	.word	.LC473
	.word	.LC472
	UNWIND(.fnend)
	.size	MVC_DEC_VDMPostProc, .-MVC_DEC_VDMPostProc
	.align	2
	.global	MVC_DEC_GetImageBuffer
	.type	MVC_DEC_GetImageBuffer, %function
MVC_DEC_GetImageBuffer:
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
	ldr	r6, [r0, #48]
	mov	r5, r0
	cmp	r6, #0
	beq	.L4443
	movw	ip, #47928
	movw	r8, #47368
	add	r7, r0, #11075584
	movt	ip, 169
	movt	r8, 169
	add	ip, r0, ip
	add	r8, r0, r8
	add	r7, r7, #45056
	mov	r4, #0
.L4441:
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4437
	cmp	ip, #0
	beq	.L4438
	ldr	lr, [r7, #2504]
	cmp	lr, #0
	beq	.L4438
	ldr	r2, [r7, #2312]
	rsb	r3, ip, r2
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L4437
	mov	r1, r8
	b	.L4439
.L4440:
	ldr	r2, [r1, #4]!
	rsb	r0, ip, r2
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L4437
.L4439:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L4440
.L4438:
	cmp	r6, r4
	bls	.L4454
	ldr	r0, [r5, #120]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	beq	.L4443
	cmn	r0, #1
	beq	.L4455
.L4454:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4437:
	add	r4, r4, #1
	add	ip, ip, #720
	cmp	r4, r6
	bne	.L4441
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4443:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4455:
	add	r1, r5, #584
	ldr	r0, [r5, #120]
	bl	FSP_ClearNotInVoQueue
	b	.L4454
	UNWIND(.fnend)
	.size	MVC_DEC_GetImageBuffer, .-MVC_DEC_GetImageBuffer
	.global	MvcTmpBuf
	.global	MVC_quant8_org
	.global	MVC_quant_org
	.global	MVC_quant8_inter_default
	.global	MVC_quant8_intra_default
	.global	MVC_quant_inter_default
	.global	MVC_quant_intra_default
	.global	MVC_g_ZZ_SCAN8
	.global	MVC_g_ZZ_SCAN
	.global	MVC_CalcZeroNum
	.global	MVC_g_AspecRatioIdc
	.global	MVC_g_NalTypeEOPIC
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12734, %object
	.size	__func__.12734, 20
__func__.12734:
	.ascii	"MVC_CheckFrameStore\000"
	.type	__func__.12987, %object
	.size	__func__.12987, 19
__func__.12987:
	.ascii	"MVC_ArrangeVahbMem\000"
	.space	1
	.type	__FUNCTION__.13583, %object
	.size	__FUNCTION__.13583, 18
__FUNCTION__.13583:
	.ascii	"MVC_WriteSliceMsg\000"
	.space	2
	.type	MVC_g_ZZ_SCAN, %object
	.size	MVC_g_ZZ_SCAN, 16
MVC_g_ZZ_SCAN:
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
	.type	MVC_g_ZZ_SCAN8, %object
	.size	MVC_g_ZZ_SCAN8, 64
MVC_g_ZZ_SCAN8:
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
	.type	MVC_SarTable.13873, %object
	.size	MVC_SarTable.13873, 136
MVC_SarTable.13873:
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
	.type	__func__.14096, %object
	.size	__func__.14096, 11
__func__.14096:
	.ascii	"MVC_DecSEI\000"
	.space	1
	.type	__func__.12784, %object
	.size	__func__.12784, 21
__func__.12784:
	.ascii	"MVC_OutputFrmFromDPB\000"
	.space	3
	.type	__func__.12832, %object
	.size	__func__.12832, 17
__func__.12832:
	.ascii	"MVC_DirectOutput\000"
	.space	3
	.type	__func__.13369, %object
	.size	__func__.13369, 12
__func__.13369:
	.ascii	"MVC_InitDPB\000"
	.type	__FUNCTION__.12546, %object
	.size	__FUNCTION__.12546, 13
__FUNCTION__.12546:
	.ascii	"MVC_ClearDPB\000"
	.space	3
	.type	__FUNCTION__.12554, %object
	.size	__FUNCTION__.12554, 13
__FUNCTION__.12554:
	.ascii	"MVC_ClearAll\000"
	.space	3
	.type	__func__.12818, %object
	.size	__func__.12818, 19
__func__.12818:
	.ascii	"MVC_InsertFrmInDPB\000"
	.space	1
	.type	__FUNCTION__.14329, %object
	.size	__FUNCTION__.14329, 13
__FUNCTION__.14329:
	.ascii	"MVC_DEC_Init\000"
	.space	3
	.type	__func__.12961, %object
	.size	__func__.12961, 18
__func__.12961:
	.ascii	"MVC_StorePicInDpb\000"
	.space	2
	.type	__func__.13524, %object
	.size	__func__.13524, 12
__func__.13524:
	.ascii	"MVC_InitPic\000"
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	MVC_quant_intra_default, %object
	.size	MVC_quant_intra_default, 16
MVC_quant_intra_default:
	.word	471076102
	.word	538711053
	.word	622861332
	.word	707076124
	.type	MVC_quant_inter_default, %object
	.size	MVC_quant_inter_default, 16
MVC_quant_inter_default:
	.word	403967498
	.word	454562830
	.word	505092116
	.word	572398360
	.type	MVC_quant8_intra_default, %object
	.size	MVC_quant8_intra_default, 64
MVC_quant8_intra_default:
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
	.type	MVC_quant8_inter_default, %object
	.size	MVC_quant8_inter_default, 256
MVC_quant8_inter_default:
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
	.type	MVC_quant_org, %object
	.size	MVC_quant_org, 16
MVC_quant_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	MVC_quant8_org, %object
	.size	MVC_quant8_org, 64
MVC_quant8_org:
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
	.type	MVC_g_NalTypeEOPIC, %object
	.size	MVC_g_NalTypeEOPIC, 12
MVC_g_NalTypeEOPIC:
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
	.type	MVC_CalcZeroNum, %object
	.size	MVC_CalcZeroNum, 256
MVC_CalcZeroNum:
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
	.type	MVC_g_AspecRatioIdc, %object
	.size	MVC_g_AspecRatioIdc, 112
MVC_g_AspecRatioIdc:
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
	ASCII(.ascii	"\012\012END of the bit buffer, copy the first packe" )
	ASCII(.ascii	"t!\012\012\000" )
	.space	2
.LC1:
	ASCII(.ascii	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"0:phy:0x%x, len0:%d\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"%-50s%50d\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"%s pstLogicFs = NULL!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s LogicFs FsState %d invalid!\012\000" )
.LC6:
	ASCII(.ascii	"not used MVC_FRAME: (%d,%d)\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"MVC_FRAME skip: is_used=%d,skip=%d\012\000" )
.LC8:
	ASCII(.ascii	"topfield skip\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"bottom field skip\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"Chan:%d exg_pts: %lld <-> %lld\012\000" )
.LC12:
	ASCII(.ascii	"stream MVC_FRAME packing type is %d! what can we do" )
	ASCII(.ascii	"?\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"../../core/syntax/mvc.c\000" )
.LC14:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%" )
	ASCII(.ascii	"p, pdfs=%p)\012\000" )
.LC17:
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC20:
	ASCII(.ascii	"for P slice size of list equal 0(1st).\012\000" )
.LC21:
	ASCII(.ascii	"for P slice size of list equal 0(2nd).\012\000" )
.LC22:
	ASCII(.ascii	"for B slice size of two list all equal 0.\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"init list error.\012\000" )
	.space	2
.LC24:
	ASCII(.ascii	"In one access unit,all non-base view should have th" )
	ASCII(.ascii	"e same subsps!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"sps but mvc flag %d is wrong\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"logic MVC_FRAME id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstPmv = %p\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC30:
	ASCII(.ascii	"SH: first_mb_in_slice\000" )
	.space	2
.LC31:
	ASCII(.ascii	"MVC_SliceCheck first_mb_in_slice >= MAX_MB_NUM_IN_P" )
	ASCII(.ascii	"IC error.\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"SH: slice_type\000" )
	.space	1
.LC33:
	ASCII(.ascii	"slice type = %d\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"slice type = %d, err\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"slice  pps id = %d\012\000" )
.LC36:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"sps with this pic_parameter_set_id havn't decode\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC38:
	ASCII(.ascii	"subsps with this seq_parameter_set_id = %d havn't d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"tmp slice  pps id = %d\012\000" )
.LC40:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: pps with this pic_parameter_s" )
	ASCII(.ascii	"et_id = %d havn't decode\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: seq_parameter_set_id out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: sps with this pic_parameter_s" )
	ASCII(.ascii	"et_id = %d havn't decode\012\000" )
	.space	3
.LC43:
	ASCII(.ascii	"new pic flag = %d\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l0\000" )
.LC45:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l0\000" )
	.space	2
.LC46:
	ASCII(.ascii	"reorder idc l0 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l0\000" )
	.space	1
.LC48:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC49:
	ASCII(.ascii	"SH: long_term_pic_idx_l0\000" )
	.space	3
.LC50:
	ASCII(.ascii	"SH: abs_diff_view_idx_minus1_l0\000" )
.LC51:
	ASCII(.ascii	"num of idc l0 exceed\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l1\000" )
.LC53:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l1\000" )
	.space	2
.LC54:
	ASCII(.ascii	"reorder idc l1 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l1\000" )
	.space	1
.LC56:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC57:
	ASCII(.ascii	"SH: long_term_pic_idx_l1\000" )
	.space	3
.LC58:
	ASCII(.ascii	"SH: abs_diff_view_idx_minus1_l1\000" )
.LC59:
	ASCII(.ascii	"num of idc l1 exceed\012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"SH: luma_log2_weight_denom\000" )
	.space	1
.LC61:
	ASCII(.ascii	"SH: chroma_log2_weight_denom\000" )
	.space	3
.LC62:
	ASCII(.ascii	"WP log2 exceed  and err flag = %d\012\000" )
	.space	1
.LC63:
	ASCII(.ascii	"SH: luma_weight_flag_l0\000" )
.LC64:
	ASCII(.ascii	"SH: luma_weight_l0\000" )
	.space	1
.LC65:
	ASCII(.ascii	"SH: luma_offset_l0\000" )
	.space	1
.LC66:
	ASCII(.ascii	"SH: chroma_weight_flag_l0\000" )
	.space	2
.LC67:
	ASCII(.ascii	"SH: chroma_weight_l0\000" )
	.space	3
.LC68:
	ASCII(.ascii	"SH: chroma_offset_l0\000" )
	.space	3
.LC69:
	ASCII(.ascii	"SH: luma_weight_flag_l1\000" )
.LC70:
	ASCII(.ascii	"SH: luma_weight_l1\000" )
	.space	1
.LC71:
	ASCII(.ascii	"SH: luma_offset_l1\000" )
	.space	1
.LC72:
	ASCII(.ascii	"SH: chroma_weight_flag_l1\000" )
	.space	2
.LC73:
	ASCII(.ascii	"SH: chroma_weight_l1\000" )
	.space	3
.LC74:
	ASCII(.ascii	"SH: chroma_offset_l1\000" )
	.space	3
.LC75:
	ASCII(.ascii	"overflow MVC_MAX_MMCO_LEN\012\000" )
	.space	1
.LC76:
	ASCII(.ascii	"SH: memory_management_control_operation\000" )
.LC77:
	ASCII(.ascii	"SH: difference_of_pic_nums_minus1\000" )
	.space	2
.LC78:
	ASCII(.ascii	"SH: long_term_pic_num\000" )
	.space	2
.LC79:
	ASCII(.ascii	"SH: long_term_frame_idx\000" )
.LC80:
	ASCII(.ascii	"SH: max_long_term_frame_idx_plus1\000" )
	.space	2
.LC81:
	ASCII(.ascii	"mmco exceed 6\012\000" )
	.space	1
.LC82:
	ASCII(.ascii	"SH: no_output_of_prior_pics_flag\000" )
	.space	3
.LC83:
	ASCII(.ascii	"SH: long_term_reference_flag\000" )
	.space	3
.LC84:
	ASCII(.ascii	"SH: adaptive_ref_pic_marking_mode_flag\000" )
	.space	1
.LC85:
	ASCII(.ascii	"MMCO para would save dec err\012\000" )
	.space	2
.LC86:
	ASCII(.ascii	"mulitislice diff no_out_of_prior_pics_flag, used fi" )
	ASCII(.ascii	"rst.\012\000" )
	.space	3
.LC87:
	ASCII(.ascii	"mulitislice diff long_term_reference_flag, used fir" )
	ASCII(.ascii	"st.\012\000" )
.LC88:
	ASCII(.ascii	"mulitislice diff adaptive_ref_pic_marking_mode_flag" )
	ASCII(.ascii	", used first.\012\000" )
	.space	2
.LC89:
	ASCII(.ascii	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\012\000" )
	.space	1
.LC90:
	ASCII(.ascii	"SH: pic_parameter_set_id\000" )
	.space	3
.LC91:
	ASCII(.ascii	"pps id:%d in sliceheader err\012\000" )
	.space	2
.LC92:
	ASCII(.ascii	"PPS or SPS of this slice not valid\012\000" )
.LC93:
	ASCII(.ascii	"MVC_PPSSPSCheck failed, PPS or SPS of this slice no" )
	ASCII(.ascii	"t valid\012\000" )
.LC94:
	ASCII(.ascii	"SH: frame_num\000" )
	.space	2
.LC95:
	ASCII(.ascii	"IDR NAL but frame_num!=0.\012\000" )
	.space	1
.LC96:
	ASCII(.ascii	"SH: field_pic_flag\000" )
	.space	1
.LC97:
	ASCII(.ascii	"SH: bottom_field_flag\000" )
	.space	2
.LC98:
	ASCII(.ascii	"field first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC99:
	ASCII(.ascii	"MVC_FRAME first_mb_in_slice bigger than pic size\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC100:
	ASCII(.ascii	"SH: idr_pic_id\000" )
	.space	1
.LC101:
	ASCII(.ascii	"idr_pic_id bigger than 65535\012\000" )
	.space	2
.LC102:
	ASCII(.ascii	"SH: pic_order_cnt_lsb\000" )
	.space	2
.LC103:
	ASCII(.ascii	"SH: delta_pic_order_cnt_bottom\000" )
	.space	1
.LC104:
	ASCII(.ascii	"SH: delta_pic_order_cnt[0]\000" )
	.space	1
.LC105:
	ASCII(.ascii	"SH: delta_pic_order_cnt[1]\000" )
	.space	1
.LC106:
	ASCII(.ascii	"SH: redundant_pic_cnt\000" )
	.space	2
.LC107:
	ASCII(.ascii	"redundant pic not support.\012\000" )
.LC108:
	ASCII(.ascii	"first_mb_in_slice in currslice small than prevslice" )
	ASCII(.ascii	" in same pic\012\000" )
	.space	3
.LC109:
	ASCII(.ascii	"SH: direct_spatial_mv_pred_flag\000" )
.LC110:
	ASCII(.ascii	"SH: num_ref_idx_override_flag\000" )
	.space	2
.LC111:
	ASCII(.ascii	"SH: num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC112:
	ASCII(.ascii	"SH: num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC113:
	ASCII(.ascii	"MVC_FRAME num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC114:
	ASCII(.ascii	"field num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC115:
	ASCII(.ascii	"reordering para dec err\012\000" )
	.space	3
.LC116:
	ASCII(.ascii	"apply_weights_flag=%d\012\000" )
	.space	1
.LC117:
	ASCII(.ascii	"wpt dec err\012\000" )
	.space	3
.LC118:
	ASCII(.ascii	"mark para dec err\012\000" )
	.space	1
.LC119:
	ASCII(.ascii	"SH: cabac_init_idc\000" )
	.space	1
.LC120:
	ASCII(.ascii	"cabac_init_idc bigger than 3\012\000" )
	.space	2
.LC121:
	ASCII(.ascii	"SH: slice_qp_delta\000" )
	.space	1
.LC122:
	ASCII(.ascii	"SH: disable_deblocking_filter_idc\000" )
	.space	2
.LC123:
	ASCII(.ascii	"disable_deblocking_filter_idc dec err\012\000" )
	.space	1
.LC124:
	ASCII(.ascii	"SH: slice_alpha_c0_offset_div2\000" )
	.space	1
.LC125:
	ASCII(.ascii	"slice_alpha_c0_offset_div2 dec err\012\000" )
.LC126:
	ASCII(.ascii	"SH: slice_beta_offset_div2\000" )
	.space	1
.LC127:
	ASCII(.ascii	"slice_beta_offset_div2 dec err\012\000" )
.LC128:
	ASCII(.ascii	"pMvcCtx->pCurrNal->nal_bitoffset = %d; code_len_byt" )
	ASCII(.ascii	"e = %d; bitstream_length = %d; pMvcCtx->pCurrNal->n" )
	ASCII(.ascii	"al_trail_zero_bit_num = %d\012\000" )
	.space	2
.LC129:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; byt" )
	ASCII(.ascii	"espos = %x\012\000" )
	.space	1
.LC130:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC131:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\012\000" )
.LC132:
	ASCII(.ascii	"   : delta_sl   \000" )
	.space	3
.LC133:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC134:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC135:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC136:
	ASCII(.ascii	"MVC_BASELINE stream with FMO, not support.\012\000" )
.LC137:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC138:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC139:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC140:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC141:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC142:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC143:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC144:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC145:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC146:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC147:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC148:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC149:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC150:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC151:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC152:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC153:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC154:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC155:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC156:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC157:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC158:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range.\012\000" )
.LC159:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC160:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC161:
	ASCII(.ascii	"PPS decode error line: %d.\012\000" )
.LC162:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC163:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC164:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC165:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC166:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC167:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC168:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC169:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC170:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC171:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC172:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC173:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC174:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC175:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC176:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC177:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC178:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC179:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC180:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC181:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC182:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC183:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC184:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC185:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC186:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC187:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC188:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC189:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC190:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC191:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC192:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC193:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC194:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC195:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC196:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC197:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC198:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC199:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC200:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC201:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC202:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC203:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC204:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC205:
	ASCII(.ascii	"dar=%d, final_dar=%d\012\000" )
	.space	2
.LC206:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC207:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range.\012\000" )
	.space	1
.LC208:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC209:
	ASCII(.ascii	"bit_depth_luma_minus8 not equal 0.\012\000" )
.LC210:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC211:
	ASCII(.ascii	"bit_depth_chroma_minus8 not equal 0.\012\000" )
	.space	2
.LC212:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC213:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC214:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC215:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC216:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC217:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC218:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC219:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC220:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC221:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC222:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC223:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC224:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC225:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC226:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC227:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC228:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC229:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC230:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC231:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC232:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC233:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC234:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC235:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC236:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC237:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC238:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC239:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC240:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC241:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC242:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC243:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC244:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC245:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC246:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC247:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC248:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC249:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC250:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC251:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC252:
	ASCII(.ascii	"SPS: constrained_set4_flag\000" )
	.space	1
.LC253:
	ASCII(.ascii	"SPS: constrained_set5_flag\000" )
	.space	1
.LC254:
	ASCII(.ascii	"SPS: reserved_zero_2bits\000" )
	.space	3
.LC255:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC256:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC257:
	ASCII(.ascii	"MVC_BASELINE stream, try to decode, exit when FMO o" )
	ASCII(.ascii	"ccurred.\012\000" )
	.space	3
.LC258:
	ASCII(.ascii	"MVC_EXTENDED stream, try to decode, exit when datap" )
	ASCII(.ascii	"artition occurred.\012\000" )
	.space	1
.LC259:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC260:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC261:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC262:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC263:
	ASCII(.ascii	"SUBSPS: num_views_minus1\000" )
	.space	3
.LC264:
	ASCII(.ascii	"pSubsps->num_views_minus1(%d) out of range.\012\000" )
	.space	3
.LC265:
	ASCII(.ascii	"SUBSPS: view_id[]\000" )
	.space	2
.LC266:
	ASCII(.ascii	"SUBSPS: num_anchor_refs_l0[]\000" )
	.space	3
.LC267:
	ASCII(.ascii	"SUBSPS: num_anchor_refs_l1[]\000" )
	.space	3
.LC268:
	ASCII(.ascii	"pSubsps->num_anchor_refs_l0(%d) out of range.\012\000" )
	.space	1
.LC269:
	ASCII(.ascii	"SUBSPS: anchor_ref_l0[][]\000" )
	.space	2
.LC270:
	ASCII(.ascii	"pSubsps->num_anchor_refs_l1(%d) out of range.\012\000" )
	.space	1
.LC271:
	ASCII(.ascii	"SUBSPS: anchor_ref_l1[][]\000" )
	.space	2
.LC272:
	ASCII(.ascii	"SUBSPS: num_level_values_signalled_minus1\000" )
	.space	2
.LC273:
	ASCII(.ascii	"SUBSPS: num_non_anchor_refs_l0[]\000" )
	.space	3
.LC274:
	ASCII(.ascii	"SUBSPS: num_non_anchor_refs_l1[]\000" )
	.space	3
.LC275:
	ASCII(.ascii	"pSubsps->num_non_anchor_refs_l0(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC276:
	ASCII(.ascii	"SUBSPS: non_anchor_ref_l0[][]\000" )
	.space	2
.LC277:
	ASCII(.ascii	"pSubsps->num_non_anchor_refs_l1(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC278:
	ASCII(.ascii	"SUBSPS: non_anchor_ref_l1[][]\000" )
	.space	2
.LC279:
	ASCII(.ascii	"num_level(%d) out of range.\012\000" )
	.space	3
.LC280:
	ASCII(.ascii	"SUBSPS: level_idc[]\000" )
.LC281:
	ASCII(.ascii	"SUBSPS: num_applicable_ops_minus1\000" )
	.space	2
.LC282:
	ASCII(.ascii	"num_ops(%d) out of range.\012\000" )
	.space	1
.LC283:
	ASCII(.ascii	"SUBSPS: applicable_op_temporal_id[][]\000" )
	.space	2
.LC284:
	ASCII(.ascii	"SUBSPS: applicable_op_num_target_views_minus1[][]\000" )
	.space	2
.LC285:
	ASCII(.ascii	"SUBSPS: applicable_op_num_views_minus1\000" )
	.space	1
.LC286:
	ASCII(.ascii	"applicable_op_num_target_views(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC287:
	ASCII(.ascii	"SUBSPS: applicable_op_target_view_id[][][]\000" )
	.space	1
.LC288:
	ASCII(.ascii	"pSubsps->applicable_op_num_views_minus1(%d) out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC289:
	ASCII(.ascii	"MVC VUI: vui_mvc_num_ops_minus1\000" )
.LC290:
	ASCII(.ascii	"vui_mvc_num_ops_minus1 %d out of range\012\000" )
.LC291:
	ASCII(.ascii	"MVC VUI: vui_mvc_temporal_id[]\000" )
	.space	1
.LC292:
	ASCII(.ascii	"SUBSPS VUI: vui_mvc_num_target_output_views_minus1[" )
	ASCII(.ascii	"]\000" )
	.space	3
.LC293:
	ASCII(.ascii	"vui_mvc_num_target_output_views_minus1 %d out of ra" )
	ASCII(.ascii	"nge\012\000" )
.LC294:
	ASCII(.ascii	"MVC VUI: vui_mvc_timing_info_present_flag\000" )
	.space	2
.LC295:
	ASCII(.ascii	"MVC VUI: vui_mvc_view_id[][]\000" )
	.space	3
.LC296:
	ASCII(.ascii	"MVC VUI: vui_mvc_num_units_in_tick\000" )
	.space	1
.LC297:
	ASCII(.ascii	"MVC VUI: vui_mvc_time_scale[]\000" )
	.space	2
.LC298:
	ASCII(.ascii	"MVC VUI: vui_mvc_fixed_frame_rate_flag\000" )
	.space	1
.LC299:
	ASCII(.ascii	"MVC VUI: vui_mvc_nal_hrd_parameters_present_flag[]\000" )
	.space	1
.LC300:
	ASCII(.ascii	"MVC VUI: cpb_cnt_minus1\000" )
.LC301:
	ASCII(.ascii	"MVC VUI: bit_rate_scale\000" )
.LC302:
	ASCII(.ascii	"MVC VUI: cpb_size_scale\000" )
.LC303:
	ASCII(.ascii	"MVC VUI: bit_rate_value_minus1\000" )
	.space	1
.LC304:
	ASCII(.ascii	"MVC VUI: cpb_size_value_minus1\000" )
	.space	1
.LC305:
	ASCII(.ascii	"MVC VUI: cbr_flag\000" )
	.space	2
.LC306:
	ASCII(.ascii	"MVC VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC307:
	ASCII(.ascii	"MVC VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC308:
	ASCII(.ascii	"MVC VUI: dpb_output_delay_length_minus1\000" )
.LC309:
	ASCII(.ascii	"MVC VUI: time_offset_length\000" )
.LC310:
	ASCII(.ascii	"MVC VUI: vui_mvc_vcl_hrd_parameters_present_flag[]\000" )
	.space	1
.LC311:
	ASCII(.ascii	"MVC VUI: vui_mvc_low_delay_hrd_flag[]\000" )
	.space	2
.LC312:
	ASCII(.ascii	"MVC VUI: vui_mvc_pic_struct_present_flag[]\000" )
	.space	1
.LC313:
	ASCII(.ascii	"SUBSPS: profile_idc\000" )
.LC314:
	ASCII(.ascii	"SUBSPS: constrained_set0_flag\000" )
	.space	2
.LC315:
	ASCII(.ascii	"SUBSPS: constrained_set1_flag\000" )
	.space	2
.LC316:
	ASCII(.ascii	"SUBSPS: constrained_set2_flag\000" )
	.space	2
.LC317:
	ASCII(.ascii	"SUBSPS: constrained_set3_flag\000" )
	.space	2
.LC318:
	ASCII(.ascii	"SUBSPS: constrained_set4_flag\000" )
	.space	2
.LC319:
	ASCII(.ascii	"SUBSPS: constrained_set5_flag\000" )
	.space	2
.LC320:
	ASCII(.ascii	"SUBSPS: reserved_zero_2bits\000" )
.LC321:
	ASCII(.ascii	"SUBSPS: level_idc\000" )
	.space	2
.LC322:
	ASCII(.ascii	"SUBSPS: seq_parameter_set_id\000" )
	.space	3
.LC323:
	ASCII(.ascii	"profile_idc = %5d error\012\000" )
	.space	3
.LC324:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc 4" )
	ASCII(.ascii	"1.\012\000" )
	.space	1
.LC325:
	ASCII(.ascii	"SUBSPS decode error.\012\000" )
	.space	2
.LC326:
	ASCII(.ascii	"SUBSPS: bit_equal_to_one\000" )
	.space	3
.LC327:
	ASCII(.ascii	"SUBSPS Mvc Ext decode error.\012\000" )
	.space	2
.LC328:
	ASCII(.ascii	"SUBSPS: mvc_vui_parameters_present_flag\000" )
.LC329:
	ASCII(.ascii	"SUBSPS Mvc Vui Ext decode error.\012\000" )
	.space	2
.LC330:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC331:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC332:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC333:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC334:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC335:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC336:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC337:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC338:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC339:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC340:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC341:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC342:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC343:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC344:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC345:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC346:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC347:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC348:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC349:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC350:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC351:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC352:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC353:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC354:
	ASCII(.ascii	"MVC_SEI_BUFFERING_PERIOD,offset = %d,payload_size =" )
	ASCII(.ascii	" %d \012\000" )
	.space	3
.LC355:
	ASCII(.ascii	"MVC_PassBytes err [%s][%d]\012\000" )
.LC356:
	ASCII(.ascii	"MVC_SEI_PIC_TIMING,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC357:
	ASCII(.ascii	"MVC_SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC358:
	ASCII(.ascii	"MVC_SEI_FILLER_PAYLOAD,offset = %d,payload_size = %" )
	ASCII(.ascii	"d \012\000" )
	.space	1
.LC359:
	ASCII(.ascii	"MVC_SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d" )
	ASCII(.ascii	", payload_size = %d \012\000" )
	.space	3
.LC360:
	ASCII(.ascii	"MVC_SEI_USER_DATA_UNREGISTERED, offset = %d, payloa" )
	ASCII(.ascii	"d_size = %d \012\000" )
	.space	3
.LC361:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC362:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC363:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC364:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC365:
	ASCII(.ascii	"MVC_SEI_RECOVERY_POINT,offset = %d,payload_size = %" )
	ASCII(.ascii	"d \012\000" )
	.space	1
.LC366:
	ASCII(.ascii	"MVC_SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC367:
	ASCII(.ascii	"MVC_SEI_SPARE_PIC,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC368:
	ASCII(.ascii	"MVC_SEI_SCENE_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC369:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC370:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,p" )
	ASCII(.ascii	"ayload_size = %d \012\000" )
	.space	2
.LC371:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload" )
	ASCII(.ascii	"_size = %d \012\000" )
.LC372:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_FREEZE,offset = %d,payload_size " )
	ASCII(.ascii	"= %d \012\000" )
	.space	2
.LC373:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC374:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC375:
	ASCII(.ascii	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset" )
	ASCII(.ascii	" = %d,payload_size = %d \012\000" )
	.space	3
.LC376:
	ASCII(.ascii	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset =" )
	ASCII(.ascii	" %d,payload_size = %d \012\000" )
	.space	1
.LC377:
	ASCII(.ascii	"MVC_SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset =" )
	ASCII(.ascii	" %d,payload_size = %d \012\000" )
	.space	1
.LC378:
	ASCII(.ascii	"MVC_SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC379:
	ASCII(.ascii	"MVC_SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset" )
	ASCII(.ascii	" = %d,payload_size = %d \012\000" )
	.space	3
.LC380:
	ASCII(.ascii	"MVC_SEI_STEREO_VIDEO_INFO,offset = %d,payload_size " )
	ASCII(.ascii	"= %d \012\000" )
	.space	2
.LC381:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC382:
	ASCII(.ascii	"\012 mvc the stream is error,len:%d\012\000" )
	.space	2
.LC383:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC384:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC385:
	ASCII(.ascii	"MVC_InquireSliceProperty mvc flag %d is wrong\012\000" )
	.space	1
.LC386:
	ASCII(.ascii	"MVC recycle image\012\000" )
	.space	1
.LC387:
	ASCII(.ascii	"pH264Ctx is %#x, pFrameStore is %#x\012\000" )
	.space	3
.LC388:
	ASCII(.ascii	"line: %d, pstLogicFsImage is NULL\012\000" )
	.space	1
.LC389:
	ASCII(.ascii	"InsertVO err:%d, MVC_ClearAll\012\000" )
	.space	1
.LC390:
	ASCII(.ascii	"mvc.c line %d: MVC_FRAME para err(ret=%d), recycle " )
	ASCII(.ascii	"image self\012\000" )
	.space	1
.LC391:
	ASCII(.ascii	"line %d func %s pos = %d\012\000" )
	.space	2
.LC392:
	ASCII(.ascii	"[%s][%d] MVC_OutputFrmToVO return %d !\012\000" )
.LC393:
	ASCII(.ascii	"[%s][%d] MVC_OutputFrmToVO return %d\012\000" )
	.space	2
.LC394:
	ASCII(.ascii	"%s %d MVC_OK != MVC_FlushDPB!!\012\000" )
.LC395:
	ASCII(.ascii	"%s %d MVC_OK != MVC_InitDPB!!\012\000" )
	.space	1
.LC396:
	ASCII(.ascii	"----------------- MVC_IMODE -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC397:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC398:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pMvcCtx->CurrPic.s" )
	ASCII(.ascii	"tructure=%d.\012\000" )
	.space	3
.LC399:
	ASCII(.ascii	"\012 receive streambuff=%p; phy_addr=0x%x; bitstrea" )
	ASCII(.ascii	"m_length=%d\012\000" )
	.space	3
.LC400:
	ASCII(.ascii	"nal_releaMVC_SE_ERR\012\000" )
	.space	3
.LC401:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC402:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC403:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC404:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC405:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC406:
	ASCII(.ascii	"line: %d, pImage/pPmv is NULL!\012\000" )
.LC407:
	ASCII(.ascii	"FS_ALLOC_ERR, MVC_ClearAll\012\000" )
.LC408:
	ASCII(.ascii	"Can not new logic fs! MVC_ClearAll\012\000" )
.LC409:
	ASCII(.ascii	"%s %d NULL== pMvcCtx->SPS || NULL == pMvcCtx->PPS |" )
	ASCII(.ascii	"| NULL == pMvcCtx->DecSlicePara!!\012\000" )
	.space	2
.LC410:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC411:
	ASCII(.ascii	"CurrPic.state is 'MVC_EMPTY'\012\000" )
	.space	2
.LC412:
	ASCII(.ascii	"MVC_StorePicInDpb return(%d) from L%d\012\000" )
	.space	1
.LC413:
	ASCII(.ascii	"Is IDR, but init DPB failed!\012\000" )
	.space	2
.LC414:
	ASCII(.ascii	"Is IDR, but FlushDPB failed!\012\000" )
	.space	2
.LC415:
	ASCII(.ascii	"MVC_DirectOutput mode\012\000" )
	.space	1
.LC416:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC417:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC418:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC419:
	ASCII(.ascii	"MVC_Marking return %d\012\000" )
	.space	1
.LC420:
	ASCII(.ascii	"line %d: pMvcCtx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC421:
	ASCII(.ascii	"line %d, MVC_GetMinPOC failed\012\000" )
	.space	1
.LC422:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC423:
	ASCII(.ascii	"GAP found while DPB is MVC_EMPTY!\012\000" )
	.space	1
.LC424:
	ASCII(.ascii	"MVC_FRAME num gap try to fill it \012\000" )
	.space	1
.LC425:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC426:
	ASCII(.ascii	"cann't allocate MVC_FRAME store when gap find\012\000" )
	.space	1
.LC427:
	ASCII(.ascii	"allocate MVC_FRAME store when gap find\012\000" )
.LC428:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC429:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC430:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC431:
	ASCII(.ascii	"mem arrange err, MVC_ClearAll\012\000" )
	.space	1
.LC432:
	ASCII(.ascii	"line %d: MVC_FRAME gap(=%d) > dpb size(=%d)\012\000" )
	.space	3
.LC433:
	ASCII(.ascii	"MVC_FRAME num gap don't allowed but gap find\012\000" )
	.space	2
.LC434:
	ASCII(.ascii	"line %d: frame num(%d/%d) find gap in NON-I slice b" )
	ASCII(.ascii	"ut here gap is not allowed\012\000" )
	.space	1
.LC435:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC436:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC437:
	ASCII(.ascii	"Chan:%d dec_pts: %lld\012\000" )
	.space	1
.LC438:
	ASCII(.ascii	"Chan:%d dec_usertag: %lld\012\000" )
	.space	1
.LC439:
	ASCII(.ascii	"line %d: CurrPic.frame_store is NULL\012\000" )
	.space	2
.LC440:
	ASCII(.ascii	"%s set fs store type failed.\012\000" )
	.space	2
.LC441:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC442:
	ASCII(.ascii	"Start Reason: SliceParaNum, MaxBytesReceived = %d, " )
	ASCII(.ascii	"%d(thr=%d)\012\000" )
	.space	1
.LC443:
	ASCII(.ascii	"Too many slice or bitstream, err!\012\000" )
	.space	1
.LC444:
	ASCII(.ascii	"Start Reason: new_pic_flag\012\000" )
.LC445:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC446:
	ASCII(.ascii	"MVC_DecList error, ret=%d\012\000" )
	.space	1
.LC447:
	ASCII(.ascii	"dec list err.\012\000" )
	.space	1
.LC448:
	ASCII(.ascii	"pMvcCtx->TotalNal = %d, type:%d\012\000" )
	.space	3
.LC449:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC450:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC451:
	ASCII(.ascii	"*******TotalPicNum=%d********\012\000" )
	.space	1
.LC452:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC453:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC454:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC455:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC456:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC457:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC458:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC459:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC460:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC461:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC462:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC463:
	ASCII(.ascii	"***** NAL: PREFIX, nal_unit_type=%d\012\000" )
	.space	3
.LC464:
	ASCII(.ascii	"***** NAL: SUBSPS, nal_unit_type=%d\012\000" )
	.space	3
.LC465:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC466:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC467:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC468:
	ASCII(.ascii	"nal_header != 0x00000100 not support.\012\000" )
	.space	1
.LC469:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC470:
	ASCII(.ascii	"MVC_FindTrailZeros ERR\012\000" )
.LC471:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC472:
	ASCII(.ascii	"MVC_IMODE nal store pic err, ret = %d\012\000" )
	.space	1
.LC473:
	ASCII(.ascii	"MVC_IMODE nal flush dpb err, ret = %d\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.13793, %object
	.size	pps_tmp.13793, 2240
pps_tmp.13793:
	.space	2240
	.type	sps_tmp.13924, %object
	.size	sps_tmp.13924, 3992
sps_tmp.13924:
	.space	3992
	.type	MvcTmpBuf, %object
	.size	MvcTmpBuf, 68
MvcTmpBuf:
	.space	68
	.type	cnt.12817, %object
	.size	cnt.12817, 4
cnt.12817:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
