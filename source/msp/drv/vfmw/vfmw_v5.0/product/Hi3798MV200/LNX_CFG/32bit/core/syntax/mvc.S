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
	.type	MVC_SetFrmRepeatCount.part.2, %function
MVC_SetFrmRepeatCount.part.2:
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
	ldr	r2, [ip, #2920]
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
	.size	MVC_SetFrmRepeatCount.part.2, .-MVC_SetFrmRepeatCount.part.2
	.align	2
	.type	MVC_CombinePacket.part.14, %function
MVC_CombinePacket.part.14:
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
	ldr	r1, .L33
	mov	r4, r0
	mov	r0, #7
	bl	dprint_vfmw
	ldr	ip, [r4, #232]
	ldr	r1, .L33+4
	mov	r0, #7
	mov	r5, #0
	ldr	lr, [ip, #40]
	ldr	r3, [ip, #44]
	ldr	r2, [ip, #16]
	str	lr, [sp, #4]
	ldr	ip, [ip, #12]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	ldr	ip, .L33+8
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r3, #8]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #232]
	mov	ip, #1
	ldr	r1, .L33+12
	mov	r0, #7
	ldr	r2, [r3, #60]
	ldr	r6, [r3, #32]
	str	r2, [r3, #32]
	ldr	r3, [r4, #232]
	str	r5, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #36]
	rsb	r2, lr, r2
	str	r2, [r3, #8]
	ldr	r3, [r4, #232]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #44]
	rsb	r2, lr, r2
	str	r2, [r3, #16]
	ldr	r3, [r4, #232]
	ldr	lr, [r3, #40]
	ldr	r2, [r3, #12]
	add	r2, r2, lr
	str	r2, [r3, #12]
	ldr	r3, [r4, #232]
	str	ip, [r3, #68]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #16]
	bl	dprint_vfmw
	mov	r1, r6
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #232]
	str	r5, [r3, #36]
	ldr	r3, [r4, #232]
	str	r5, [r3, #52]
	ldr	r3, [r4, #232]
	str	r5, [r3, #40]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	.LC0
	.word	.LC1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	UNWIND(.fnend)
	.size	MVC_CombinePacket.part.14, .-MVC_CombinePacket.part.14
	.align	2
	.global	mvc_ue_v
	.type	mvc_ue_v, %function
mvc_ue_v:
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
	add	r8, r0, #548
	mov	r6, r0
	mov	r7, r1
	mov	r1, #32
	mov	r0, r8
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
	mov	r2, r7
	mov	r3, r5
	ldr	r1, .L41
	mov	r0, #21
	ldr	ip, [lr, #64]
	add	r4, ip, r8
	str	r4, [lr, #64]
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
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
	add	r8, r0, #548
	mov	r6, r0
	mov	r7, r1
	mov	r1, #32
	mov	r0, r8
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
	mov	r2, r7
	mov	r3, r4
	ldr	r1, .L48
	mov	r0, #21
	ldr	ip, [lr, #64]
	add	r5, ip, r5
	str	r5, [lr, #64]
	bl	dprint_vfmw
	mov	r0, r4
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
	mov	r5, r0
	add	r0, r0, #548
	mov	r6, r1
	mov	r7, r2
	bl	BsGet
	ldr	lr, [r5, #232]
	mov	r2, r7
	ldr	r1, .L51
	ldr	ip, [lr, #64]
	add	ip, ip, r6
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	bl	dprint_vfmw
	mov	r0, r4
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r0
	mov	r6, r1
	add	r0, r0, #548
	mov	r1, #1
	bl	BsGet
	ldr	lr, [r5, #232]
	mov	r2, r6
	ldr	r1, .L54
	ldr	ip, [lr, #64]
	add	ip, ip, #1
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
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
	ldr	r3, [r5, #2920]
	mov	r7, r1
	ldr	r2, [r5, #2924]
	cmp	r2, r3
	strhi	r3, [r5, #2924]
	cmp	r3, #0
	beq	.L63
	movw	r10, #47780
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
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	sub	r0, r0, #1
	cmp	r0, #1
	bls	.L78
.L59:
	ldr	r2, [r5, #2920]
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
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
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
	ldr	r2, [r5, #2920]
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
	ldrb	r0, [r0, #785]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L88:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L96:
	ldrb	r2, [r0, #749]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L84
.L89:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L95:
	ldrb	r3, [r0, #713]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L89
	ldrb	r3, [r0, #749]	@ zero_extendqisi2
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
	ldr	r0, [r0, #784]
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
	ldr	r2, [r0, #748]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L101
.L106:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L112:
	ldr	r3, [r0, #712]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L106
	ldr	r3, [r0, #748]
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
	ldr	r0, [r0, #784]
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
	ldr	r2, [r0, #748]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L118
.L123:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L129:
	ldr	r3, [r0, #712]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L123
	ldr	r3, [r0, #748]
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
	ldr	r10, [r3, #2920]
	cmp	r10, #0
	beq	.L132
	movw	r8, #47780
	add	r9, r0, #11141120
	movt	r8, 169
	mov	r4, #0
	add	r9, r9, #16384
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
	ldr	r2, [r9, #120]
	ldr	r1, [r5, #56]
	cmp	r1, r2
	movweq	r2, #28362
	movteq	r2, 42
	addeq	r2, r4, r2
	addeq	r4, r4, #1
	streq	r5, [r7, r2, asl #2]
.L133:
	cmp	r6, r10
	bne	.L134
	ldr	r3, [fp, #-48]
	cmp	r4, r10
	str	r4, [r3, #2932]
	bcs	.L131
	movw	r0, #28361
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
	str	r10, [r3, #2932]
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
	ldr	r10, [r3, #2920]
	cmp	r10, #0
	beq	.L148
	movw	r8, #47780
	add	r9, r0, #11141120
	movt	r8, 169
	mov	r4, #0
	add	r9, r9, #16384
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
	ldr	r2, [r9, #120]
	ldr	r1, [r5, #56]
	cmp	r1, r2
	movweq	r2, #28346
	movteq	r2, 42
	addeq	r2, r4, r2
	addeq	r4, r4, #1
	streq	r5, [r7, r2, asl #2]
.L149:
	cmp	r6, r10
	bne	.L150
	ldr	r3, [fp, #-48]
	cmp	r4, r10
	str	r4, [r3, #2928]
	bcs	.L147
	movw	r0, #28345
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
	str	r10, [r3, #2928]
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
	ldr	r3, [r0, #664]
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
	strb	ip, [r3, #749]
	and	r1, r1, #2
	strb	ip, [r3, #750]
	strb	r1, [r3, #3]
.L167:
	tst	r2, #2
	beq	.L168
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r3, #785]
	and	r1, r1, #1
	strb	ip, [r3, #786]
	strb	r1, [r3, #3]
.L168:
	cmp	r2, #3
	ldrsb	r1, [r3, #6]
	moveq	r2, #0
	streqb	r2, [r3, #714]
	streqb	r2, [r3, #713]
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
	ldr	r4, [r3, #2932]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, fp, sp, pc}
	movw	ip, #47908
	add	r6, r0, #11141120
	movt	ip, 169
	add	r6, r6, #16384
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
	ldr	lr, [r6, #120]
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
	ldr	r6, [ip, #2932]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	movw	r4, #47908
	add	r8, r0, #11141120
	movt	r4, 169
	add	r8, r8, #16384
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
	ldr	r5, [r8, #120]
	cmp	r7, r5
	bne	.L187
	cmp	r2, #1
	ldreqb	r5, [lr, #785]	@ zero_extendqisi2
	beq	.L202
	cmp	r2, #2
	bne	.L187
	ldrb	r5, [lr, #749]	@ zero_extendqisi2
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
	ldr	r1, [r1, #664]
	add	ip, ip, #45056
	sub	r1, r1, #1
	ldr	r4, [ip, #2928]
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L234
	movw	ip, #47844
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #16384
	add	ip, r0, ip
	b	.L211
.L210:
	cmp	r3, r4
	beq	.L235
.L211:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #724]
	cmp	lr, r2
	bne	.L210
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L210
	ldr	lr, [r1, #712]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L210
	ldr	r6, [r1, #56]
	ldr	lr, [r5, #120]
	cmp	r6, lr
	bne	.L210
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L205:
	add	r3, r0, #11075584
	ldr	r1, [r1, #664]
	add	r3, r3, #45056
	ldr	r5, [r3, #2928]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L236
	movw	r4, #47844
	add	r7, r0, #11141120
	movt	r4, 169
	add	r7, r7, #16384
	add	r4, r0, r4
	mov	ip, #0
	b	.L216
.L212:
	tst	r3, #2
	beq	.L214
	ldr	r3, [r1, #784]
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
	ldr	lr, [r1, #748]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L212
	ldr	r8, [r1, #56]
	ldr	lr, [r7, #120]
	cmp	r8, lr
	bne	.L212
	ldr	lr, [r1, #760]
	cmp	lr, r2
	bne	.L212
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #11075584
	strb	r3, [r1, #3]
	add	r2, r2, #45056
	mov	r1, #0
	ldr	r3, [r2, #2792]
	strb	r1, [r3, #750]
	ldr	r3, [r2, #2792]
	ldrb	ip, [r3, #712]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #714]
	ldreq	r3, [r2, #2792]
	streqb	r1, [r3, #713]
	ldreq	r3, [r2, #2792]
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
	ldr	r3, [r7, #120]
	cmp	lr, r3
	bne	.L214
	ldr	r3, [r1, #796]
	cmp	r3, r2
	bne	.L214
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #3]
	add	r3, r3, #11075584
	mov	r2, #0
	add	r3, r3, #45056
	ldr	r1, [r3, #2792]
	strb	r2, [r1, #786]
	ldr	r1, [r3, #2792]
	ldrb	ip, [r1, #712]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #714]
	ldreq	r1, [r3, #2792]
	streqb	r2, [r1, #713]
	ldreq	r1, [r3, #2792]
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
	ldr	r5, [r3, #2932]
	cmp	r5, #0
	beq	.L269
	movw	r4, #47908
	add	r7, r0, #11141120
	movt	r4, 169
	add	r7, r7, #16384
	add	r4, r0, r4
	mov	ip, #0
	b	.L249
.L245:
	tst	r3, #2
	beq	.L247
	ldr	r3, [r1, #784]
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
	ldr	lr, [r1, #748]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L245
	ldr	r8, [r1, #56]
	ldr	lr, [r7, #120]
	cmp	r8, lr
	bne	.L245
	ldr	lr, [r1, #756]
	cmp	r2, lr
	bne	.L245
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #11075584
	strb	r3, [r1, #3]
	add	r2, r2, #45056
	mov	r1, #0
	ldr	r3, [r2, #2856]
	strb	r1, [r3, #749]
	ldr	r3, [r2, #2856]
	ldrb	ip, [r3, #712]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #714]
	ldreq	r3, [r2, #2856]
	streqb	r1, [r3, #713]
	ldreq	r3, [r2, #2856]
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
	ldr	r4, [r1, #2932]
	cmp	r4, #0
	beq	.L272
	movw	ip, #47908
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #16384
	add	ip, r0, ip
	b	.L251
.L250:
	cmp	r3, r4
	beq	.L273
.L251:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #720]
	cmp	lr, r2
	bne	.L250
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L250
	ldr	lr, [r1, #712]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L250
	ldr	r6, [r1, #56]
	ldr	lr, [r5, #120]
	cmp	r6, lr
	bne	.L250
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L270:
	ldr	lr, [r1, #56]
	ldr	r3, [r7, #120]
	cmp	lr, r3
	bne	.L247
	ldr	r3, [r1, #792]
	cmp	r2, r3
	bne	.L247
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #3]
	add	r3, r3, #11075584
	mov	r2, #0
	add	r3, r3, #45056
	ldr	r1, [r3, #2856]
	strb	r2, [r1, #785]
	ldr	r1, [r3, #2856]
	ldrb	ip, [r1, #712]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #714]
	ldreq	r1, [r3, #2856]
	streqb	r2, [r1, #713]
	ldreq	r1, [r3, #2856]
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
	ldr	r7, [r3, #2928]
	cmp	r7, #0
	beq	.L304
	movw	r5, #47844
	add	r8, r0, #11141120
	movt	r5, 169
	add	r8, r8, #16384
	add	r5, r0, r5
	mov	ip, #0
	b	.L289
.L281:
	tst	r4, #2
	beq	.L284
	ldr	lr, [r3, #784]
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
	ldr	lr, [r3, #748]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L281
	ldr	lr, [r3, #760]
	cmp	lr, r2
	bne	.L281
	ldr	r9, [r3, #56]
	ldr	lr, [r8, #120]
	cmp	r9, lr
	bne	.L281
	ldrb	lr, [r3, #785]	@ zero_extendqisi2
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
	ldr	r2, [r3, #2792]
	mov	r6, r6, lsr #5
	add	r1, r6, r1, lsl #1
	str	r1, [r2, #756]
	ldr	r2, [r3, #2792]
	strb	ip, [r2, #749]
	ldr	r2, [r3, #2792]
	strb	r0, [r2, #750]
	ldr	r2, [r3, #2792]
	ldrb	r1, [r2, #712]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L307
	ldrb	r1, [r2, #785]	@ zero_extendqisi2
	ldrb	r0, [r2, #749]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r2, #713]
	ldreq	r3, [r3, #2792]
	ldreqb	r2, [r3, #750]	@ zero_extendqisi2
	streqb	r2, [r3, #714]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L275:
	ldr	r4, [r3, #2928]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	ip, #47844
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #16384
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
	ldr	lr, [r3, #712]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L279
	ldr	lr, [r3, #724]
	cmp	lr, r2
	bne	.L279
	ldr	r7, [r3, #56]
	ldr	lr, [r5, #120]
	cmp	r7, lr
	bne	.L279
	add	r6, r0, r6, lsl #2
	str	r1, [r3, #28]
	add	r3, r6, #11075584
	mov	r0, #1
	add	r3, r3, #45056
	mov	r2, #0
	ldr	ip, [r3, #2792]
	str	r1, [ip, #720]
	ldr	r1, [r3, #2792]
	strb	r0, [r1, #713]
	ldr	r1, [r3, #2792]
	strb	r0, [r1, #749]
	ldr	r1, [r3, #2792]
	strb	r0, [r1, #785]
	ldr	r1, [r3, #2792]
	strb	r2, [r1, #714]
	ldr	r1, [r3, #2792]
	strb	r2, [r1, #750]
	ldr	r3, [r3, #2792]
	strb	r2, [r3, #786]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L305:
	ldr	lr, [r3, #796]
	cmp	lr, r2
	bne	.L284
	ldr	r4, [r3, #56]
	ldr	lr, [r8, #120]
	cmp	r4, lr
	bne	.L284
	ldrb	lr, [r3, #749]	@ zero_extendqisi2
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
	ldr	r2, [r3, #2792]
	mov	r6, r6, lsr #5
	add	r1, r6, r1, lsl #1
	str	r1, [r2, #792]
	ldr	r2, [r3, #2792]
	strb	ip, [r2, #785]
	ldr	r2, [r3, #2792]
	strb	r0, [r2, #786]
	ldr	r2, [r3, #2792]
	ldrb	r1, [r2, #712]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L309
	ldrb	r1, [r2, #785]	@ zero_extendqisi2
	ldrb	r0, [r2, #749]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r2, #713]
	ldreq	r3, [r3, #2792]
	ldreqb	r2, [r3, #786]	@ zero_extendqisi2
	streqb	r2, [r3, #714]
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
	ldr	r4, [r5, #664]
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
	ldr	r4, [r5, #664]
	add	r3, r3, #45056
	ldr	lr, [r3, #2928]
	rsb	r4, r2, r4, lsl #1
	cmp	lr, #0
	beq	.L312
	movw	ip, #47844
	add	r8, r0, #11141120
	movt	ip, 169
	add	r8, r8, #16384
	add	ip, r0, ip
	mov	r3, #0
	b	.L315
.L313:
	tst	r2, #2
	beq	.L314
	ldr	r2, [r1, #784]
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
	ldr	r0, [r1, #748]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L313
	ldr	r0, [r1, #760]
	cmp	r0, r4
	bne	.L313
	ldr	r9, [r1, #56]
	ldr	r0, [r8, #120]
	cmp	r9, r0
	bne	.L313
	mov	r3, r7
	mov	r2, #1
	mov	r0, r6
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L312
.L326:
	ldr	r2, [r1, #796]
	cmp	r2, r4
	bne	.L314
	ldr	r0, [r1, #56]
	ldr	r2, [r8, #120]
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
	ldr	r3, [r5, #2932]
	str	r1, [r5, #2936]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r6, #47908
	add	r7, r0, #11141120
	movt	r6, 169
	add	r7, r7, #16384
	add	r6, r0, r6
	mov	r3, r1
	mov	r4, #0
	b	.L331
.L329:
	ldr	r3, [r5, #2932]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r5, #2936]
.L331:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #28]
	cmp	r2, r3
	bcc	.L329
	ldr	r2, [r1, #56]
	ldr	r3, [r7, #120]
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
	ldr	r3, [r6, #2928]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r5, #47844
	add	r7, r0, #11141120
	movt	r5, 169
	add	r7, r7, #16384
	add	r5, r0, r5
	mov	r4, #0
	b	.L335
.L334:
	ldr	r3, [r6, #2928]
	cmp	r3, r4
	bls	.L338
.L335:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r3, [r7, #120]
	ldr	r2, [r1, #56]
	cmp	r2, r3
	bne	.L334
	mov	r0, r8
	bl	MVC_UnMarkFrameStoreRef
	ldr	r3, [r6, #2928]
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
	ldr	r1, [r1, #656]
	bl	MVC_UnMarkLTFldByFrmIdx
.L341:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #668]
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
	ldr	r2, [r7, #2728]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r2, #52]
	movw	r3, #47992
	add	r6, r0, #11075584
	movt	r3, 169
	add	r1, r0, r1
	add	r0, r6, #45056
	add	r3, r1, r3
	mov	r1, #0
	strb	r1, [r3, #4]
	ldr	r3, [r0, #3152]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r0, #3152]
	ldrsb	r1, [r2, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L346
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L347
	ldr	r3, [r7, #2728]
	mov	r2, #0
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
.L347:
	ldr	r3, [r7, #2728]
	mov	r2, #0
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
.L346:
	add	r1, r4, #45056
	mov	r3, #0
	add	r6, r6, #45056
	ldr	r2, [r1, #2728]
	strb	r3, [r2, #2]
	ldr	r2, [r1, #2728]
	strb	r3, [r2, #5]
	ldr	r2, [r1, #2728]
	strb	r3, [r2, #3]
	str	r3, [r1, #2728]
	ldr	r3, [r6, #2924]
	sub	r3, r3, #1
	str	r3, [r6, #2924]
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
	ldr	r6, [r3, #2920]
	cmp	r6, #0
	beq	.L375
	movw	r5, #47780
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
	bne	.L390
	strb	r3, [r0, #6]
.L378:
	ldrsb	r1, [r4, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L380
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L400
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L389
	cmp	r3, #1
	beq	.L389
	cmp	r2, #3
	beq	.L401
	cmp	r2, #1
	beq	.L402
	cmp	r2, #2
	beq	.L403
.L385:
	ldr	r3, [r5, #224]
	ldr	r2, [r0, #192]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	movls	r0, #0
	bhi	.L404
.L398:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L400:
	ldrsb	r2, [r4, #6]
	mov	r0, #1
	ldr	r1, .L405
	bl	dprint_vfmw
.L382:
	ldr	r3, [r4, #16]
	cmp	r3, #1
	mvnne	r0, #2
	moveq	r3, #2
	mvneq	r0, #2
	streq	r3, [r4, #16]
	b	.L398
.L401:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L385
	mov	r2, r3
	ldr	r1, .L405+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L402:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L385
	mov	r0, r2
	ldr	r1, .L405+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L403:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	tst	r3, #2
	beq	.L385
	ldr	r1, .L405+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L390:
	mvn	r0, #0
	b	.L398
.L380:
	ldrsb	ip, [r4, #6]
	mov	r2, r4
	ldr	r3, [r4, #16]
	mov	r0, #1
	ldr	r1, .L405+16
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L382
.L389:
	ldr	r1, .L405+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L404:
	ldr	r1, .L405+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L406:
	.align	2
.L405:
	.word	.LC4
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC5
	.word	.LC6
	.word	.LC10
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r8, r1, #656
	mvn	r7, #0
	mvn	r6, #0
	ldrd	r2, [r8]
	mov	r5, r0
	cmp	r3, r7
	cmpeq	r2, r6
	beq	.L407
	add	r9, r0, #11075584
	add	r9, r9, #45056
	ldr	r3, [r9, #2920]
	cmp	r3, #0
	beq	.L407
	movw	r10, #47780
	mvn	r6, #1
	movt	r10, 169
	add	r10, r0, r10
	mvn	r7, #0
	mov	r4, #0
	mvn	r3, #0
	str	r3, [fp, #-48]
.L412:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L411
	ldrsb	r1, [r3, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L411
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L411
	ldr	r3, [r10]
	add	r3, r3, #656
	ldrd	r0, [r3]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r4, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L411:
	ldr	r3, [r9, #2920]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L412
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L407
	ldrd	r2, [r8]
	cmp	r3, r7
	cmpeq	r2, r6
	bhi	.L426
.L407:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L426:
	strd	r6, [sp]
	mov	r0, #29
	ldr	r1, .L427
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	movw	r1, #28330
	movt	r1, 42
	add	r1, r3, r1
	ldrd	r2, [r8]
	ldr	r1, [r5, r1, asl #2]
	add	r1, r1, #656
	strd	r2, [r1]
	strd	r6, [r8]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L428:
	.align	2
.L427:
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #11075584
	mov	r4, r1
	add	ip, r3, #40960
	ldr	r2, [r0, #252]
	mov	r5, r0
	mov	r0, #2240
	ldr	r1, [ip, #1080]
	movw	r8, #3992
	ldrb	r9, [r4, #15]	@ zero_extendqisi2
	ldrb	r6, [r4, #137]	@ zero_extendqisi2
	mla	r1, r0, r1, r2
	ldrb	lr, [r4, #136]	@ zero_extendqisi2
	ldrb	r0, [r4, #138]	@ zero_extendqisi2
	bfc	r6, #0, #2
	ldr	r7, [r5, #248]
	bfc	lr, #0, #2
	ldr	r2, [r1, #28]
	ldrb	r1, [r4, #14]	@ zero_extendqisi2
	strb	r6, [r4, #137]
	bfi	r0, r1, #1, #1
	strb	lr, [r4, #136]
	strb	r0, [r4, #138]
	str	r9, [r4, #192]
	ldr	r1, [r5, #56]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	mla	r2, r8, r2, r7
	str	r1, [r4, #180]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L468
.L432:
	.word	.L431
	.word	.L433
	.word	.L434
	.word	.L431
.L434:
	ldrb	r1, [r4, #137]	@ zero_extendqisi2
	add	r3, r5, #11075584
	ldr	r6, [r4, #44]
	add	r3, r3, #45056
	and	r1, r1, #240
	ldrb	lr, [r4, #136]	@ zero_extendqisi2
	orr	r1, r1, #11
	strb	r1, [r4, #137]
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r6, [r4, #224]
	bfi	lr, r1, #0, #2
	strb	lr, [r4, #136]
.L430:
	ldrb	r1, [r2, #20]	@ zero_extendqisi2
	str	r1, [r4, #468]
	str	r1, [r4, #472]
	ldrb	r1, [r2, #24]	@ zero_extendqisi2
	cmp	r1, #0
	ldrne	r1, [r2, #68]
	mov	r2, #1
	str	r2, [r4, #476]
	str	r1, [r4, #480]
	ldrb	r2, [ip, #1075]	@ zero_extendqisi2
	cmp	r2, #1
	movne	r2, #0
	str	r2, [r4, #264]
	ldr	r2, [r5, #224]
	ldr	r2, [r2, #24]
	cmp	r2, #0
	beq	.L452
	ldrb	r2, [r4, #712]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L452
	cmp	r0, #3
	ldreqb	r1, [r4, #137]	@ zero_extendqisi2
	bfieq	r1, r2, #0, #2
	streqb	r1, [r4, #137]
.L452:
	ldrb	r2, [r3, #2680]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L453
	ldr	r2, [r3, #2696]
	cmp	r2, #3
	moveq	r3, #1
	streq	r3, [r4, #348]
	beq	.L453
	cmp	r2, #4
	moveq	r3, #2
	streq	r3, [r4, #348]
	beq	.L453
	cmp	r2, #5
	moveq	r3, #3
	streq	r3, [r4, #348]
	beq	.L453
	mov	r0, #0
	ldr	r1, .L482
	str	r0, [r4, #348]
	ldr	r2, [r3, #2696]
	bl	dprint_vfmw
.L453:
	ldr	r0, [r5, #120]
	ldrsb	r1, [r4, #6]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, .L482+4
	mov	r2, #640
	add	r1, r4, #72
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #15
	str	r3, [r5, #296]
	mov	r2, #1
	ldrb	r3, [r4, #712]	@ zero_extendqisi2
	strb	r2, [r5, #291]
	cmp	r3, #0
	movne	r3, #4
	strb	r3, [r5, #284]
	ldr	r3, [r4, #740]
	strb	r2, [r5, #289]
	str	r3, [r5, #300]
	str	r3, [r5, #308]
	str	r3, [r5, #304]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L433:
	ldrb	r1, [r4, #137]	@ zero_extendqisi2
	add	r3, r5, #11075584
	ldr	r6, [r4, #44]
	add	r3, r3, #45056
	ldrb	lr, [r4, #136]	@ zero_extendqisi2
	orr	r1, r1, #3
	strb	r1, [r4, #137]
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r6, [r4, #224]
	bfi	lr, r1, #0, #2
	strb	lr, [r4, #136]
	b	.L430
.L431:
	ldrb	r1, [r4, #712]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L435
	ldr	lr, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	lr, #0
	ldrb	r8, [r4]	@ zero_extendqisi2
	movne	r6, #3
	str	r1, [r4, #224]
	movne	r7, r6
	moveq	r6, #2
	moveq	r7, #3
.L436:
	ldr	lr, [r4, #764]
	ldr	r1, [r4, #800]
	cmp	lr, r1
	beq	.L480
	movle	lr, #1
	movgt	lr, #0
.L447:
	add	r3, r3, #45056
	ldrb	r1, [r3, #2716]	@ zero_extendqisi2
	cmp	r1, #3
	moveq	lr, #1
	beq	.L448
	cmp	r1, #4
	moveq	lr, #0
.L448:
	ldrb	r1, [r4, #137]	@ zero_extendqisi2
	ldrb	r9, [r4, #136]	@ zero_extendqisi2
	bfi	r1, lr, #4, #2
	bfi	r1, r7, #2, #2
	bfi	r9, r8, #0, #2
	bfi	r1, r6, #0, #2
	strb	r9, [r4, #136]
	strb	r1, [r4, #137]
	b	.L430
.L435:
	ldr	lr, [r4, #772]
	ldr	r1, [r5, #116]
	ldr	r10, [r4, #808]
	cmp	lr, r1
	bhi	.L481
	cmp	r1, r10
	bcc	.L440
.L438:
	ldr	r1, [r4, #44]
	mov	r7, #3
	ldrb	r8, [r4]	@ zero_extendqisi2
	ldrb	r6, [r4, #751]	@ zero_extendqisi2
	ldrb	r9, [r4, #787]	@ zero_extendqisi2
	str	r1, [r4, #224]
.L441:
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	cmp	r1, #1
	streq	r10, [r4, #224]
	moveq	r8, r9
	moveq	r7, #2
	beq	.L443
	cmp	r1, #2
	streq	lr, [r4, #224]
	moveq	r8, r6
	moveq	r7, #1
.L443:
	str	r6, [r4, #128]
	mov	r6, #3
	str	r9, [r4, #132]
	b	.L436
.L440:
	ldrb	r8, [r4, #751]	@ zero_extendqisi2
	mov	r7, #1
	ldrb	r9, [r4, #787]	@ zero_extendqisi2
	str	lr, [r4, #224]
	mov	r6, r8
	b	.L441
.L480:
	ldr	r1, [r4, #140]
	cmp	r1, #720
	movne	lr, #1
	bne	.L447
	ldr	lr, [r4, #144]
	subs	lr, lr, #480
	movne	lr, #1
	b	.L447
.L481:
	cmp	r1, r10
	bcc	.L438
	ldrb	r8, [r4, #787]	@ zero_extendqisi2
	mov	r7, #2
	str	r10, [r4, #224]
	ldrb	r6, [r4, #751]	@ zero_extendqisi2
	mov	r9, r8
	b	.L441
.L468:
	add	r3, r5, #11075584
	add	r3, r3, #45056
	b	.L430
.L483:
	.align	2
.L482:
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
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_SetFrmRepeatCount.part.2
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
	ldrb	lr, [r0, #713]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #714]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #736]
	ldrb	r2, [r0, #715]	@ zero_extendqisi2
	ldr	r3, [r0, #716]
	strb	r5, [r0, #748]
	strb	r4, [r0, #784]
	strb	lr, [r0, #749]
	strb	lr, [r0, #785]
	strb	ip, [r0, #750]
	strb	ip, [r0, #786]
	str	r1, [r0, #772]
	str	r1, [r0, #808]
	strb	r2, [r0, #751]
	strb	r2, [r0, #787]
	str	r3, [r0, #752]
	str	r3, [r0, #788]
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
	ldr	r2, [r0, #800]
	mov	lr, #3
	ldr	r1, [r0, #764]
	ldr	r3, [r0, #808]
	cmp	r2, r1
	ldr	r5, [r0, #772]
	ldrb	r4, [r0, #785]	@ zero_extendqisi2
	ldr	ip, [r0, #752]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #712]
	mov	r3, r3, lsr #1
	str	ip, [r0, #716]
	str	r2, [r0, #728]
	str	r2, [r0, #32]
	str	r3, [r0, #736]
	beq	.L488
	ldrb	r2, [r0, #749]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L489
.L488:
	ldr	r2, [r0, #784]
	mov	r1, #0
	strb	r1, [r0, #713]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L493
	ldr	r2, [r0, #748]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	ip, #1
	bne	.L491
.L493:
	mov	ip, #0
.L491:
	ldrb	r2, [r0, #787]	@ zero_extendqisi2
	ldrb	r1, [r0, #751]	@ zero_extendqisi2
	str	r3, [r0, #44]
	cmp	r2, r1
	strb	ip, [r0, #714]
	movcs	r3, r2
	movcc	r3, r1
	strb	r3, [r0, #715]
	strb	r3, [r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L489:
	mov	r1, #1
	strb	r1, [r0, #713]
	b	.L493
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r6, r1, #0
	mov	r5, r0
	beq	.L524
	cmp	r2, #1
	beq	.L505
	cmp	r2, #2
	beq	.L506
	ldr	r9, [r6, #764]
	ldr	r10, [r6, #800]
.L507:
	add	r8, r5, #11075584
	add	r7, r8, #45056
	ldr	r1, [r7, #3148]
	cmp	r1, #0
	beq	.L516
	ldrb	r4, [r7, #2940]	@ zero_extendqisi2
	cmp	r4, #0
	movwne	r3, #47996
	movne	r4, #0
	movtne	r3, 169
	addne	r3, r5, r3
	bne	.L510
	b	.L508
.L514:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L508
.L510:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L514
.L516:
	mvn	r0, #0
.L520:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L506:
	ldr	r9, [r6, #800]
	mov	r10, r9
	b	.L507
.L508:
	ldrsb	r1, [r6, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L511
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L511
	add	r2, r5, r4
	movw	r3, #47992
	movt	r3, 169
	add	r3, r2, r3
	mov	r2, #1
	add	r5, r5, r4, lsl #2
	strb	r2, [r3, #4]
	add	r5, r5, #11075584
	ldr	r3, [r0, #28]
	add	r5, r5, #45056
	add	r8, r8, #45056
	ldr	r1, .L525
	mov	r0, #13
	ldr	r3, [r3, #4]
	str	r9, [r5, #3020]
	str	r10, [r5, #3084]
	str	r3, [r5, #2956]
	ldr	r3, [r7, #3152]
	cmp	r3, #15
	addls	r2, r3, r2
	mov	r3, r4
	movhi	r2, #16
	str	r2, [r8, #3152]
	ldr	r2, [r6, #220]
	bl	dprint_vfmw
	mov	r0, #0
	str	r4, [r6, #52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L505:
	ldr	r9, [r6, #764]
	mov	r10, r9
	b	.L507
.L511:
	mov	r1, #0
	ldrsb	r2, [r6, #6]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	stmia	sp, {r0, r1}
	mov	r0, r1
	ldr	r1, .L525+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L520
.L524:
	mov	r0, r6
	movw	r3, #2029
	ldr	r2, .L525+8
	ldr	r1, .L525+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L520
.L526:
	.align	2
.L525:
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
	ldr	r0, [r3, #2932]
	ldr	r2, [r2, #3944]
	ldr	r1, [r3, #2928]
	rsb	r2, r0, r2
	cmp	r1, r2
	beq	.L552
.L527:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L552:
	ldr	r8, [r3, #2920]
	cmp	r8, #0
	beq	.L532
	movw	r6, #47780
	add	r1, r10, #11141120
	movt	r6, 169
	mov	r2, #0
	add	r1, r1, #16384
	add	r6, r10, r6
	mov	r5, r2
	mvn	r9, #-2147483648
.L531:
	ldr	r4, [r6, #4]!
	cmp	r4, #0
	beq	.L530
	ldr	r7, [r4, #64]
	cmp	r9, r7
	bls	.L530
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r4
	cmp	r3, #0
	beq	.L530
	str	r1, [fp, #-52]
	str	r2, [fp, #-48]
	bl	MVC_NonLongTermRefFlg
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-52]
	cmp	r0, #0
	beq	.L530
	ldr	r0, [r4, #56]
	ldr	r3, [r1, #120]
	cmp	r0, r3
	moveq	r9, r7
	moveq	r2, r5
.L530:
	add	r5, r5, #1
	cmp	r5, r8
	bne	.L531
.L529:
	movw	r3, #28330
	movt	r3, 42
	add	r3, r2, r3
	ldr	r4, [r10, r3, asl #2]
	cmp	r4, #0
	beq	.L527
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L527
	mov	r0, r4
	bl	MVC_NonLongTermRefFlg
	cmp	r0, #0
	beq	.L527
	add	r3, r10, #11141120
	ldr	r2, [r4, #56]
	add	r3, r3, #16384
	ldr	r3, [r3, #120]
	cmp	r2, r3
	bne	.L527
	mov	r0, r10
	mov	r1, r4
	bl	MVC_UnMarkFrameStoreRef
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	MVC_UpdateReflist
.L532:
	mov	r2, r8
	b	.L529
	UNWIND(.fnend)
	.size	MVC_SlidingWinMark, .-MVC_SlidingWinMark
	.align	2
	.global	MVC_DumpDPB
	.type	MVC_DumpDPB, %function
MVC_DumpDPB:
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
	ldr	r3, .L563
	mov	r7, r0
	ldr	r3, [r3]
	tst	r3, #16384
	beq	.L553
	add	r6, r0, #11075584
	add	r6, r6, #45056
	ldr	r3, [r6, #2924]
	cmp	r3, #0
	movwne	r5, #47780
	movne	r4, #0
	movtne	r5, 169
	addne	r5, r0, r5
	beq	.L559
.L558:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L563+4
	mov	r0, #14
	add	r4, r4, #1
	ldrb	lr, [ip, #3]	@ zero_extendqisi2
	ldr	r3, [ip, #20]
	str	lr, [sp, #4]
	ldr	ip, [ip, #32]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6, #2924]
	cmp	r3, r4
	bhi	.L558
.L559:
	ldr	r1, .L563+8
	mov	r0, #14
	bl	dprint_vfmw
	ldr	r3, [r6, #2928]
	cmp	r3, #0
	movwne	r5, #47844
	movne	r4, #0
	movtne	r5, 169
	addne	r5, r7, r5
	beq	.L557
.L560:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L563+12
	mov	r0, #14
	ldrb	lr, [ip, #3]	@ zero_extendqisi2
	ldr	r3, [ip, #20]
	str	lr, [sp, #4]
	ldr	ip, [ip, #32]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5]
	mov	r2, r4
	ldr	r1, .L563+16
	mov	r0, #14
	add	r4, r4, #1
	ldr	r3, [r3, #728]
	bl	dprint_vfmw
	ldr	r3, [r6, #2928]
	cmp	r3, r4
	bhi	.L560
.L557:
	ldr	r1, .L563+8
	mov	r0, #14
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L553:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L564:
	.align	2
.L563:
	.word	g_PrintEnable
	.word	.LC18
	.word	.LC17
	.word	.LC19
	.word	.LC20
	UNWIND(.fnend)
	.size	MVC_DumpDPB, .-MVC_DumpDPB
	.align	2
	.global	MVC_UpdateCurrFrameInfo
	.type	MVC_UpdateCurrFrameInfo, %function
MVC_UpdateCurrFrameInfo:
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
	add	r0, r0, #11141120
	add	r3, r0, #12288
	add	r1, r0, #16384
	ldrb	r2, [r3, #3482]	@ zero_extendqisi2
	ldr	r4, [r1, #40]
	strb	r2, [r4, #1]
	ldrb	r2, [r3, #3484]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	bne	.L566
	ldrb	r2, [r3, #3485]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
.L566:
	add	ip, r0, #16384
	strb	r2, [r4, #3]
	ldr	r2, [ip, #48]
	str	r2, [r4, #20]
	ldr	r2, [ip, #92]
	str	r2, [r4, #44]
	ldrb	r2, [r3, #3492]	@ zero_extendqisi2
	strb	r2, [r4]
	ldr	r2, [ip, #60]
	str	r2, [r4, #32]
	ldr	r2, [ip, #116]
	str	r2, [r4, #48]
	ldr	r2, [ip, #52]
	str	r2, [r4, #28]
	ldrb	r2, [r3, #3489]	@ zero_extendqisi2
	str	r2, [r4, #40]
	ldrb	r2, [r3, #3487]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r1, #3
	movne	r1, #0
	strb	r1, [r4, #4]
	ldrb	r2, [r3, #3483]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L569
	bcc	.L570
	cmp	r2, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	str	r4, [r4, #788]
	mov	lr, #1
	strb	lr, [r4, #784]
	mov	r6, #0
	ldrb	lr, [r3, #3484]	@ zero_extendqisi2
	strb	lr, [r4, #785]
	ldrb	lr, [r3, #3485]	@ zero_extendqisi2
	strb	lr, [r4, #786]
	ldr	lr, [ip, #68]
	str	lr, [r4, #800]
	ldrb	lr, [r3, #3492]	@ zero_extendqisi2
	strb	lr, [r4, #787]
	ldr	ip, [ip, #92]
	str	r6, [r4, #40]
	str	ip, [r4, #808]
	ldrb	r5, [r3, #3481]	@ zero_extendqisi2
	cmp	r5, r6
	beq	.L587
	ldr	r2, [r4, #772]
	mov	r5, #3
	strb	r5, [r4, #2]
	add	r3, r3, #4080
	add	ip, ip, r2
	str	ip, [r4, #44]
	str	ip, [r4, #736]
	mvn	r7, #0
	ldrb	r2, [r3, #-593]	@ zero_extendqisi2
	cmp	r2, #1
	orreq	r6, r1, #2
	strb	r6, [r4, #4]
	ldrd	r8, [r3]
	mvn	r6, #0
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L578
	add	r1, r4, #656
	ldrd	r2, [r1]
	cmp	r3, r7
	cmpeq	r2, r6
	beq	.L588
.L578:
	ldrb	r3, [r4, #751]	@ zero_extendqisi2
.L585:
	add	r1, r0, #16384
	cmp	r3, lr
	mov	r0, r4
	movcc	r3, lr
	strb	r3, [r4]
	ldr	r3, [r1, #60]
	str	r3, [r4, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MVC_CombineFldsToFrm
.L570:
	str	r4, [r4, #716]
	mov	r1, #3
	mov	r2, #0
	strb	r1, [r4, #2]
	strb	r2, [r4, #712]
	add	r1, r3, #3488
	ldrb	r5, [r3, #3484]	@ zero_extendqisi2
	mov	r2, #640
	add	r1, r1, #8
	add	r0, r4, #72
	strb	r5, [r4, #713]
	ldrb	r6, [r3, #3485]	@ zero_extendqisi2
	strb	r6, [r4, #714]
	ldr	lr, [ip, #64]
	str	lr, [r4, #728]
	ldrb	r7, [r3, #3492]	@ zero_extendqisi2
	strb	r7, [r4, #715]
	ldr	r8, [ip, #92]
	str	r8, [r4, #736]
	ldr	r3, [ip, #68]
	str	r3, [r4, #764]
	ldr	r3, [ip, #72]
	str	r3, [r4, #800]
	bl	memcpy
	mov	r2, #1
	mov	r3, #2
	str	r8, [r4, #772]
	str	r8, [r4, #808]
	strb	r7, [r4, #751]
	strb	r7, [r4, #787]
	strb	r6, [r4, #750]
	strb	r6, [r4, #786]
	strb	r5, [r4, #749]
	strb	r5, [r4, #785]
	str	r4, [r4, #752]
	str	r4, [r4, #788]
	strb	r2, [r4, #748]
	strb	r3, [r4, #784]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L569:
	strb	r2, [r4, #748]
	mov	r5, #0
	str	r4, [r4, #752]
	ldrb	lr, [r3, #3484]	@ zero_extendqisi2
	strb	lr, [r4, #749]
	ldrb	lr, [r3, #3485]	@ zero_extendqisi2
	strb	lr, [r4, #750]
	ldr	lr, [ip, #68]
	str	lr, [r4, #764]
	ldrb	lr, [r3, #3492]	@ zero_extendqisi2
	strb	lr, [r4, #751]
	ldr	ip, [ip, #92]
	str	r5, [r4, #40]
	str	ip, [r4, #772]
	ldrb	r6, [r3, #3481]	@ zero_extendqisi2
	cmp	r6, r5
	beq	.L589
	ldr	r2, [r4, #808]
	mov	r6, #3
	strb	r6, [r4, #2]
	add	r3, r3, #4080
	add	ip, ip, r2
	str	ip, [r4, #44]
	str	ip, [r4, #736]
	mvn	r7, #0
	ldrb	r2, [r3, #-593]	@ zero_extendqisi2
	mvn	r6, #0
	cmp	r2, #1
	orreq	r5, r1, #1
	strb	r5, [r4, #4]
	ldrd	r8, [r3]
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L574
	add	r1, r4, #656
	ldrd	r2, [r1]
	cmp	r3, r7
	cmpeq	r2, r6
	streqd	r8, [r1]
.L574:
	ldrb	r3, [r4, #787]	@ zero_extendqisi2
	b	.L585
.L587:
	strb	r2, [r4, #2]
	add	r1, r0, #15744
	str	ip, [r4, #44]
	add	r1, r1, #40
	str	ip, [r4, #736]
	add	r0, r4, #72
	ldrb	r3, [r3, #3487]	@ zero_extendqisi2
	mov	r2, #640
	cmp	r3, #1
	moveq	r5, #2
	strb	r5, [r4, #4]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L589:
	strb	r2, [r4, #2]
	add	r1, r3, #3488
	str	ip, [r4, #44]
	add	r1, r1, #8
	str	ip, [r4, #736]
	add	r0, r4, #72
	ldrb	r3, [r3, #3487]	@ zero_extendqisi2
	mov	r2, #640
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #4]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L588:
	strd	r8, [r1]
	b	.L578
	UNWIND(.fnend)
	.size	MVC_UpdateCurrFrameInfo, .-MVC_UpdateCurrFrameInfo
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
	ldr	r4, [r3, #2920]
	ldr	r3, [r3, #2924]
	cmp	r3, r4
	addcc	r5, r0, #11141120
	bcc	.L591
	cmp	r4, #0
	beq	.L596
	movw	r1, #47780
	add	r5, r0, #11141120
	movt	r1, 169
	mov	lr, #0
	add	r8, r5, #16384
	add	r1, r0, r1
	mov	r3, lr
	mvn	ip, #-2147483648
.L594:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L593
	ldr	r0, [r2, #64]
	cmp	ip, r0
	bls	.L593
	ldr	r7, [r2, #56]
	ldr	r2, [r8, #120]
	cmp	r7, r2
	moveq	ip, r0
	moveq	lr, r3
.L593:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L594
	mov	r4, lr
.L592:
	movw	r3, #28330
	mov	r0, r6
	movt	r3, 42
	add	r3, lr, r3
	ldr	r1, [r6, r3, asl #2]
	bl	MVC_UnMarkFrameStoreRef
	mov	r1, r4
	mov	r0, r6
	bl	MVC_RemoveFrameStoreOutDPB
.L591:
	add	r3, r5, #12288
	add	r5, r5, #16384
	mov	r2, #0
	strb	r2, [r3, #3484]
	ldr	r2, [r5, #56]
	cmp	r2, #0
	movne	r2, #1
	strneb	r2, [r3, #3485]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L596:
	add	r5, r0, #11141120
	mov	lr, r4
	b	.L592
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L614
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #3]
.L609:
	ldr	r3, [r4, #8]
	mov	r0, r6
	cmp	r3, #0
	beq	.L608
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	mov	r0, #7
	ldr	r1, .L615
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
.L608:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L609
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L614:
	mov	r0, r5
	movw	r3, #3897
	ldr	r2, .L615+4
	ldr	r1, .L615+8
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L616:
	.align	2
.L615:
	.word	.LC21
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
	beq	.L618
	ldr	r0, [r0, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L618:
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
	ldr	r1, .L627
	mov	r4, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L623
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L623:
	ldr	r3, [r4, #80]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #80]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L628:
	.align	2
.L627:
	.word	.LC22
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
	b	.L631
.L630:
	add	r4, r4, #88
	cmp	r4, r5
	beq	.L633
.L631:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L630
	mov	r1, r4
	ldr	r0, [r6, #120]
	add	r4, r4, #88
	bl	MVC_ReleaseNAL
	cmp	r4, r5
	bne	.L631
.L633:
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
	movw	r4, #17280
	movw	r5, #17824
	movt	r4, 170
	movt	r5, 170
	add	r4, r0, r4
	add	r5, r0, r5
	mov	r6, r0
	mov	r7, #0
.L636:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L635
	ldr	r0, [r6, #120]
	bl	MVC_ReleaseNAL
	str	r7, [r4]
.L635:
	cmp	r4, r5
	bne	.L636
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
	subs	r4, r0, #0
	beq	.L644
	bl	MVC_ClearAllSlice
	ldr	ip, [r4, #40]
	add	r3, r4, #11075584
	mov	r2, #0
	add	r3, r3, #40960
	movw	r1, #23352
	movt	r1, 1
	mov	r0, r2
	str	ip, [r3, #2732]
	mov	ip, #2
	str	r1, [r3, #2736]
	mov	r1, #7
	strb	ip, [r3, #2721]
	mov	ip, #32
	strb	r1, [r3, #2723]
	mov	r1, #3
	strb	ip, [r3, #2722]
	mvn	ip, #0
	str	r1, [r3, #2744]
	mov	r1, #262144
	str	ip, [r3, #2748]
	str	r1, [r3, #2760]
	strb	r2, [r3, #2720]
	str	r2, [r3, #2752]
	str	r2, [r3, #2756]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L644:
	ldr	r3, .L645
	mov	r2, #300
	ldr	r1, .L645+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L646:
	.align	2
.L645:
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	MVC_ClearCurrPic, .-MVC_ClearCurrPic
	.align	2
	.global	MVC_ArrangeVahbMem
	.type	MVC_ArrangeVahbMem, %function
MVC_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	mov	r5, r2
	sub	r2, r1, #32
	sub	r3, r5, #32
	mov	r6, r1
	movw	r1, #8160
	cmp	r3, r1
	cmpls	r2, r1
	mov	r4, r0
	movhi	r1, #1
	movls	r1, #0
	bhi	.L657
	ldr	r3, .L659
	mov	r2, #20
	sub	r0, fp, #48
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #224]
	str	r6, [fp, #-44]
	str	r5, [fp, #-40]
	ldr	r3, [r3, #28]
	str	r6, [fp, #-36]
	cmp	r3, #24
	str	r5, [fp, #-32]
	beq	.L650
	add	r2, r4, #11075584
	ldrb	r3, [fp, #4]	@ zero_extendqisi2
	add	r2, r2, #45056
	mov	r1, #5
	strb	r1, [fp, #-46]
	ldr	r2, [r2, #2920]
	add	r2, r2, #3
	strb	r2, [fp, #-47]
.L655:
	sub	r1, fp, #48
	ldr	r0, [r4, #120]
	strb	r3, [fp, #-45]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L651
	ldr	r1, [r4, #224]
	sub	r3, fp, #52
	ldr	r0, [r4, #120]
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L658
	cmp	r0, #0
	moveq	r0, #1
	bne	.L653
.L656:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L650:
	mov	r3, #1
	mov	r2, #5
	strb	r3, [fp, #-47]
	strb	r2, [fp, #-46]
	b	.L655
.L658:
	add	r0, r4, #584
	bl	ResetVoQueue
.L653:
	ldr	r1, .L659+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L656
.L657:
	mov	r3, r5
	mov	r2, r6
	ldr	r1, .L659+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L651:
	ldr	r1, .L659+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L656
.L660:
	.align	2
.L659:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC26
	.word	.LC25
	.word	.LC27
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
	ldrb	r3, [r3, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L663
	bcc	.L678
	cmp	r3, #2
	bne	.L684
.L679:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L675:
	mov	r0, r6
.L684:
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L663:
	mov	r7, #2
.L664:
	movw	r5, #42068
	add	r8, r6, #11141120
	movt	r5, 169
	add	r5, r6, r5
	add	r8, r8, #16384
	add	r4, r6, #256
	ldr	r2, [r5, #4]!
	mov	ip, r6
	mov	lr, #0
	mov	r9, #1
	cmp	r2, #0
	beq	.L666
.L686:
	ldr	r10, [ip, #256]
	cmp	r10, #0
	bne	.L680
	mov	r0, r4
	mov	r3, r10
	b	.L668
.L669:
	ldr	r1, [r0, #4]!
	cmp	r1, #0
	bne	.L671
.L668:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L669
	ldr	r3, [r6, #224]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L675
	ldr	r1, [r8, #40]
	add	r1, r1, #712
.L671:
	mov	r0, r4
	mov	r3, #0
	b	.L677
.L673:
	ldr	r10, [r0, #4]!
.L677:
	add	r3, r3, #1
	cmp	r10, #0
	streq	r1, [r0]
	cmp	r3, r2
	bne	.L673
.L674:
	add	lr, lr, #1
	add	r4, r4, #132
	cmp	r7, lr
	add	ip, ip, #132
	bls	.L679
	ldr	r2, [r5, #4]!
	cmp	r2, #0
	bne	.L686
.L666:
	ldr	r3, [r6, #224]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L675
	str	r9, [r5]
	ldr	r3, [r8, #40]
	add	r3, r3, #712
	str	r3, [ip, #256]
	b	.L674
.L680:
	mov	r1, r10
	b	.L671
.L678:
	mov	r7, #1
	b	.L664
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
	ldrb	r4, [r2, #1065]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L688
	ldrb	r2, [r2, #1066]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #2
	moveq	r4, #1
.L688:
	add	r3, r3, #45056
	ldr	r5, [r3, #2928]
	cmp	r5, #0
	beq	.L696
	movw	r3, #47848
	mov	r2, #0
	movt	r3, 169
	add	r3, r0, r3
	b	.L693
.L706:
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L704
.L691:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L705
.L693:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L706
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L692
	ldr	ip, [r0, #748]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L707
.L692:
	tst	lr, #2
	beq	.L691
	ldr	ip, [r0, #784]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L691
	ldr	ip, [r0, #796]
	cmp	ip, r1
	bne	.L691
	add	r0, r0, #784
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L704:
	ldr	ip, [r0, #712]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L691
	ldr	ip, [r0, #724]
	cmp	ip, r1
	bne	.L691
	add	r0, r0, #712
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L707:
	ldr	ip, [r0, #760]
	cmp	ip, r1
	bne	.L692
	add	r0, r0, #748
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L705:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L696:
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
	ldrb	r4, [r2, #1065]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L709
	ldrb	r2, [r2, #1066]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #2
	moveq	r4, #1
.L709:
	add	r3, r3, #45056
	ldr	r5, [r3, #2932]
	cmp	r5, #0
	beq	.L717
	movw	r3, #47912
	mov	r2, #0
	movt	r3, 169
	add	r3, r0, r3
	b	.L714
.L727:
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L725
.L712:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L726
.L714:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L727
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L713
	ldr	ip, [r0, #748]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L728
.L713:
	tst	lr, #2
	beq	.L712
	ldr	ip, [r0, #784]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L712
	ldr	ip, [r0, #792]
	cmp	ip, r1
	bne	.L712
	add	r0, r0, #784
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L725:
	ldr	ip, [r0, #712]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L712
	ldr	ip, [r0, #720]
	cmp	ip, r1
	bne	.L712
	add	r0, r0, #712
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L728:
	ldr	ip, [r0, #756]
	cmp	ip, r1
	bne	.L713
	add	r0, r0, #748
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L726:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L717:
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
	ble	.L730
	add	ip, r5, r2, lsl #2
	mov	r1, r2
.L731:
	ldr	r3, [ip, #-4]!
	sub	r1, r1, #1
	str	r3, [ip, #4]
	ldr	lr, [r6]
	cmp	lr, r1
	blt	.L731
.L730:
	add	r3, lr, #1
	str	r3, [r6]
	str	r0, [r5, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r7, r7, #2
	add	lr, r5, r0, lsl #2
	mov	ip, r0
	b	.L735
.L734:
	str	r1, [r5, ip, asl #2]
	add	ip, ip, #1
.L733:
	cmp	r0, r7
	beq	.L743
.L735:
	ldr	r1, [lr], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L733
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L734
	ldr	r3, [r1, #12]
	cmp	r3, r4
	bne	.L734
	ldr	r3, [r1, #4]
	ldr	r3, [r3, #56]
	cmp	r3, r8
	bne	.L734
	cmp	r0, r7
	bne	.L735
.L743:
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
	ble	.L745
	add	ip, r5, r2, lsl #2
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
	str	r0, [r5, lr, asl #2]
	ldr	r0, [r6]
	cmp	r2, r0
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r7, r7, #2
	add	lr, r5, r0, lsl #2
	mov	ip, r0
	b	.L750
.L749:
	str	r1, [r5, ip, asl #2]
	add	ip, ip, #1
.L748:
	cmp	r0, r7
	beq	.L761
.L750:
	ldr	r1, [lr], #4
	add	r0, r0, #1
	cmp	r1, #0
	beq	.L748
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L749
	ldr	r3, [r1, #8]
	cmp	r3, r4
	bne	.L749
	ldr	r3, [r1, #4]
	ldr	r3, [r3, #56]
	cmp	r3, r8
	bne	.L749
	cmp	r0, r7
	bne	.L750
.L761:
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
	beq	.L769
	ldr	ip, [ip, #2388]
	cmp	r1, ip
	beq	.L770
	mov	r6, r5
	mov	ip, #0
	b	.L764
.L766:
	ldr	r4, [lr, #4]!
	cmp	r1, r4
	beq	.L772
.L764:
	add	ip, ip, #1
	cmp	ip, r5
	bne	.L766
	cmp	r6, #0
	blt	.L773
.L763:
	cmp	r2, #0
	add	r6, r6, r3, lsl #1
	movwne	r3, #5718
	movweq	r3, #5726
	movt	r3, 41
	add	r3, r6, r3
	add	r0, r0, r3, lsl #2
	ldr	r0, [r0, #4]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L772:
	mov	r6, ip
	cmp	r6, #0
	bge	.L763
.L773:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L769:
	mov	r6, r5
	b	.L763
.L770:
	mov	r6, #0
	b	.L763
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
	movw	ip, #27302
	mov	r4, #1648
	movt	ip, 42
	add	ip, r3, ip
	mla	r3, r4, r3, r0
	ldr	lr, [r0, ip, asl #2]
	movw	ip, #31360
	cmp	lr, #0
	movt	ip, 169
	add	ip, r3, ip
	beq	.L780
	add	r4, r0, #11141120
	mov	r3, #0
	mov	r0, ip
	add	r4, r4, #12288
	b	.L779
.L776:
	cmp	r3, lr
	add	r0, r0, #824
	beq	.L782
.L779:
	ldr	ip, [r0, #56]
	add	r3, r3, #1
	cmp	ip, r1
	bne	.L776
	ldrb	ip, [r4, #3483]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L777
	ldr	ip, [r0, #732]
	cmp	ip, r2
	bne	.L776
	add	r0, r0, #712
	ldmfd	sp, {r4, fp, sp, pc}
.L777:
	cmp	ip, #1
	beq	.L783
	cmp	ip, #2
	bne	.L776
	ldr	ip, [r0, #804]
	cmp	ip, r2
	bne	.L776
	add	r0, r0, #784
	ldmfd	sp, {r4, fp, sp, pc}
.L783:
	ldr	ip, [r0, #768]
	cmp	ip, r2
	bne	.L776
	add	r0, r0, #748
	ldmfd	sp, {r4, fp, sp, pc}
.L782:
	mov	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L780:
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
	bls	.L786
	add	r2, r4, r1, lsl #2
	mov	r3, r1
.L787:
	ldr	ip, [r2, #-4]!
	sub	r3, r3, #1
	str	ip, [r2, #4]
	ldr	ip, [r7]
	cmp	ip, r3
	bcc	.L787
.L786:
	add	r3, ip, #1
	str	r3, [r7]
	str	r0, [r4, ip, asl #2]
	ldr	r2, [r7]
	cmp	r1, r2
	ldmccfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	ip, r4, r2, lsl #2
	mov	r0, r2
	b	.L791
.L789:
	cmp	r1, r2
	str	r3, [r4, r0, asl #2]
	add	r0, r0, #1
	bcc	.L798
.L791:
	ldr	r3, [ip], #4
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L789
	ldr	lr, [r3, #4]
	ldr	lr, [lr, #56]
	cmp	lr, r5
	bne	.L789
	ldr	lr, [r3, #20]
	cmp	lr, r6
	bne	.L789
	cmp	r1, r2
	bcs	.L791
.L798:
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
	add	r9, r0, #11075584
	add	r9, r9, #40960
	str	r2, [fp, #-64]
	mov	r2, #0
	mov	r5, r0
	ldrb	r3, [r9, #1065]	@ zero_extendqisi2
	mov	r10, r1
	str	r2, [fp, #-48]
	cmp	r3, r2
	beq	.L800
	ldrb	r3, [r9, #1066]	@ zero_extendqisi2
	cmp	r3, r2
	movne	r3, #2
	moveq	r3, #1
.L800:
	cmp	r10, #1
	bls	.L849
.L799:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L849:
	ldr	r0, [r5, #236]
	cmp	r10, #0
	movweq	r1, #40976
	movweq	r8, #41240
	movweq	r2, #41504
	movweq	r7, #41760
	movwne	r1, #41108
	movwne	r8, #41372
	movwne	r2, #41632
	movwne	r7, #41892
	cmp	r3, #0
	ldr	r3, [r0, #2896]
	movt	r2, 169
	add	r2, r5, r2
	add	r3, r3, #4
	str	r2, [fp, #-100]
	mov	r2, #1
	movt	r1, 169
	mov	r3, r2, asl r3
	str	r3, [fp, #-88]
	ldr	r3, [r9, #1092]
	movt	r8, 169
	ldrne	r2, [fp, #-88]
	movt	r7, 169
	add	r1, r5, r1
	add	r8, r5, r8
	movne	r3, r3, asl #1
	add	r7, r5, r7
	addne	r3, r3, #1
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-64]
	movne	r2, r2, asl #1
	strne	r2, [fp, #-88]
	adds	r3, r3, #2
	str	r3, [fp, #-72]
	beq	.L799
	ldr	r2, [r1]
	cmp	r2, #3
	beq	.L799
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
	b	.L807
.L808:
	cmp	r2, #2
	beq	.L850
	ldr	r3, [fp, #-84]
	cmp	r3, #1
	beq	.L814
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #1073]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	mov	r3, r10, asl #1
.L815:
	cmp	r2, #4
	ldr	r2, [r7]
	beq	.L851
	add	r2, r2, #1
	add	r4, r2, r4
	ldr	r2, [fp, #-76]
	cmp	r2, r4
	rsble	r4, r2, r4
.L825:
	ldr	r2, [fp, #-56]
	add	r0, r5, #11141120
	add	r0, r0, #16384
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
	ldr	ip, [r0, #60]
	mov	r0, r5
	str	ip, [sp]
	bl	mvc_reorder_interview
.L812:
	ldr	r3, [fp, #-72]
	add	r6, r6, #1
	cmp	r6, r3
	beq	.L799
	ldr	r2, [r9, #4]!
	add	r7, r7, #4
	add	r8, r8, #4
	cmp	r2, #3
	beq	.L799
.L807:
	cmp	r2, #1
	bhi	.L808
	cmp	r2, #0
	ldr	r3, [r8]
	bne	.L809
	ldr	r2, [fp, #-60]
	mvn	r3, r3
	adds	r3, r2, r3
	str	r3, [fp, #-60]
	bmi	.L852
.L810:
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
	ldr	ip, [r2, #2704]
	sub	r2, fp, #48
	str	r2, [sp]
	ldr	r2, [fp, #-64]
	str	ip, [sp, #4]
	bl	MVC_ReorderSTList
	b	.L812
.L851:
	mvn	r2, r2
	adds	r4, r2, r4
	ldrmi	r2, [fp, #-76]
	addmi	r4, r4, r2
	b	.L825
.L814:
	ldr	r1, [fp, #-68]
	add	r3, r5, #10747904
	add	r3, r3, #20480
	ldr	r0, [r1, #2704]
	ldr	r1, [r3, #2384]
	adds	r1, r1, #1
	beq	.L816
	ldr	r3, [r3, #2388]
	cmp	r0, r3
	beq	.L817
	ldr	ip, [fp, #-96]
	mov	r3, #0
	str	r1, [fp, #-80]
	b	.L818
.L820:
	ldr	lr, [ip, #4]!
	cmp	r0, lr
	beq	.L834
.L818:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L820
.L819:
	ldr	r3, [fp, #-68]
	mov	r4, r1
	ldr	ip, [fp, #-96]
	ldrb	r3, [r3, #1073]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	mov	r3, #0
	b	.L830
.L822:
	ldr	lr, [ip, #4]!
	cmp	r0, lr
	beq	.L835
.L830:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L822
	cmp	r4, #0
	blt	.L836
.L829:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	mov	r3, r10, asl #1
	beq	.L823
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
	b	.L815
.L809:
	ldr	r2, [fp, #-60]
	add	r3, r3, #1
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	str	r3, [fp, #-60]
	cmp	r2, r3
	rsble	r3, r2, r3
	strle	r3, [fp, #-60]
	b	.L810
.L850:
	ldr	r1, [fp, #-68]
	sub	r0, fp, #48
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-64]
	ldr	ip, [r1, #2704]
	mov	r1, r10
	ldr	r3, [r3, r6, asl #2]
	str	r0, [sp]
	mov	r0, r5
	str	ip, [sp, #4]
	bl	MVC_ReorderLTList
	b	.L812
.L834:
	str	r3, [fp, #-80]
	b	.L819
.L835:
	mov	r4, r3
	cmp	r4, #0
	bge	.L829
.L836:
	mov	r3, #0
	mvn	r4, #0
	mov	r1, r3
	str	r3, [fp, #-84]
	str	r1, [fp, #-76]
	mov	r3, r10, asl #1
	b	.L815
.L823:
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
	b	.L815
.L852:
	ldr	r2, [fp, #-88]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	b	.L810
.L816:
	ldr	r3, [fp, #-68]
	mov	r4, r1
	str	r1, [fp, #-80]
	ldrb	r3, [r3, #1073]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	b	.L829
.L817:
	ldr	r1, [fp, #-68]
	mov	r3, #0
	mov	r4, r3
	str	r3, [fp, #-80]
	ldrb	r1, [r1, #1073]	@ zero_extendqisi2
	str	r1, [fp, #-56]
	b	.L829
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
	add	r5, r0, #11075584
	mov	r6, r0
	add	r4, r5, #40960
	ldrb	r1, [r4, #1064]	@ zero_extendqisi2
	cmp	r1, #2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L865
.L856:
	ldr	r3, [r4, #1124]
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #1112]
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L866
.L858:
	add	r5, r5, #40960
	ldr	r3, [r5, #1128]
	add	r3, r3, #1
	str	r3, [r5, #1116]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L865:
	mov	r1, #0
	ldr	r2, [r4, #1124]
	bl	MVC_ReorderRefPiclist
	ldrb	r1, [r4, #1064]	@ zero_extendqisi2
	b	.L856
.L866:
	ldr	r2, [r4, #1128]
	mov	r0, r6
	bl	MVC_ReorderRefPiclist
	b	.L858
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
	ldr	lr, .L930
	movcc	r4, r2
	ldr	ip, .L930+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L870
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L878
.L879:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L878
	cmp	r2, #0
	beq	.L884
	add	r8, r7, r5, lsl #2
	b	.L883
.L880:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L884
.L883:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L880
	add	r0, r0, #784
	blx	r6
	cmp	r0, #0
	beq	.L880
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
.L884:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L886
	b	.L879
.L885:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L879
.L886:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	tst	r1, #1
	beq	.L885
	add	r0, r0, #748
	blx	r6
	cmp	r0, #0
	beq	.L885
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r1, [r3]
	add	r2, r2, #748
	ldr	r3, [fp, #-52]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L879
.L929:
	add	r0, r0, #748
	blx	r6
	cmp	r0, #0
	beq	.L871
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #748
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L875:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L877
	b	.L870
.L876:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L870
.L877:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L876
	add	r0, r0, #784
	blx	r6
	cmp	r0, #0
	beq	.L876
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
.L870:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L878
	cmp	r2, #0
	beq	.L875
	add	r9, r7, r10, lsl #2
	b	.L874
.L871:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L875
.L874:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L871
	b	.L929
.L878:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L931:
	.align	2
.L930:
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
.L935:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L933
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L943
.L933:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L935
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L943:
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
	beq	.L948
	ldr	r3, [r0]
	cmp	r3, r2
	beq	.L949
	mov	ip, r0
	mov	r3, #0
	mov	r0, r1
	b	.L946
.L947:
	ldr	lr, [ip, #4]!
	cmp	lr, r2
	beq	.L950
.L946:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L947
	ldmfd	sp, {fp, sp, pc}
.L950:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L948:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
.L949:
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
	beq	.L955
	ldr	r3, [r1]
	cmp	r3, r0
	beq	.L956
	mov	r3, #0
	b	.L953
.L954:
	ldr	ip, [r1, #4]!
	cmp	ip, r0
	beq	.L952
.L953:
	add	r3, r3, #1
	cmp	r3, r2
	mov	lr, r3
	bne	.L954
.L952:
	cmp	r2, #0
	cmpne	r2, lr
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L955:
	mov	lr, r2
	b	.L952
.L956:
	mov	lr, #0
	b	.L952
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
	beq	.L973
	cmp	r0, #2
	ldmnefd	sp, {fp, sp, pc}
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [ip]
	add	r1, r1, #784
	mov	lr, #0
.L964:
	add	lr, lr, #1
	str	r1, [r3, r0, asl #2]
	cmp	lr, r2
	ldr	r0, [ip]
	add	r1, r1, #824
	add	r0, r0, #1
	str	r0, [ip]
	bne	.L964
	ldmfd	sp, {fp, sp, pc}
.L973:
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [ip]
	add	r1, r1, #748
	mov	lr, #0
.L960:
	add	lr, lr, #1
	str	r1, [r3, r0, asl #2]
	cmp	lr, r2
	ldr	r0, [ip]
	add	r1, r1, #824
	add	r0, r0, #1
	str	r0, [ip]
	bne	.L960
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
	mov	r10, r0
	ldr	r5, [lr, #2384]
	movw	r0, #22868
	movt	r0, 164
	str	r2, [fp, #-48]
	adds	r5, r5, #1
	str	r3, [fp, #-52]
	ldr	r6, [r4, #2704]
	add	r0, r10, r0
	beq	.L993
	ldr	r3, [lr, #2388]
	cmp	r6, r3
	beq	.L994
	mov	r2, r0
	mov	r3, #0
	b	.L976
.L977:
	ldr	r0, [r2, #4]!
	cmp	r6, r0
	beq	.L975
.L976:
	add	r3, r3, #1
	cmp	r3, r5
	mov	lr, r3
	bne	.L977
.L975:
	ldrb	r3, [r4, #1073]	@ zero_extendqisi2
	add	lr, lr, r1, lsl #1
	add	r8, r10, #11141120
	add	ip, ip, #45056
	cmp	r3, #0
	add	r6, r8, #12288
	movwne	r3, #5718
	movweq	r3, #5726
	movtne	r3, 41
	movteq	r3, 41
	addne	r3, lr, r3
	addeq	r3, lr, r3
	ldrb	r2, [r6, #3483]	@ zero_extendqisi2
	addne	lr, r10, lr, lsl #2
	add	r3, r10, r3, lsl #2
	movwne	r9, #22892
	sub	r2, r2, #2
	addeq	lr, r10, lr, lsl #2
	ldr	r7, [r3, #4]
	movweq	r9, #22924
	ldr	r3, [ip, #2920]
	clz	r2, r2
	movt	r9, 164
	add	r9, lr, r9
	subs	r4, r3, #1
	mov	r2, r2, lsr #5
	bmi	.L974
	movw	r5, #28330
	str	r10, [fp, #-56]
	movt	r5, 42
	add	r5, r3, r5
	add	r8, r8, #16384
	add	r5, r10, r5, lsl #2
	mov	r10, r2
	b	.L991
.L1017:
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #3
	ldreq	r2, [r1, #732]
	bne	.L981
.L983:
	add	r3, r1, r10
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L981
	ldr	r3, [r8, #60]
	cmp	r3, r2
	beq	.L1016
.L981:
	subs	r4, r4, #1
	bmi	.L974
.L991:
	ldr	r1, [r5, #-4]!
	cmp	r1, #0
	beq	.L981
	ldrb	r3, [r6, #3483]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1017
	cmp	r3, #1
	beq	.L1018
	cmp	r3, #2
	bne	.L981
	ldrb	r2, [r6, #3481]	@ zero_extendqisi2
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	ubfx	r3, r3, #1, #1
	beq	.L986
	ldr	r2, [r8, #40]
	ldr	r0, [r1, #768]
	ldr	r2, [r2, #768]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L986:
	cmp	r3, #0
	ldrne	r2, [r1, #804]
	bne	.L983
	subs	r4, r4, #1
	bpl	.L991
.L974:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1018:
	ldrb	r2, [r6, #3481]	@ zero_extendqisi2
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	and	r3, r3, #1
	beq	.L985
	ldr	r2, [r8, #40]
	ldr	r0, [r1, #804]
	ldr	r2, [r2, #804]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L985:
	cmp	r3, #0
	ldrne	r2, [r1, #768]
	bne	.L983
	b	.L981
.L1016:
	cmp	r7, #0
	ldr	ip, [r1, #56]
	beq	.L981
	ldr	r3, [r9]
	cmp	ip, r3
	beq	.L987
	mov	r2, r9
	mov	r3, #0
.L988:
	add	r3, r3, #1
	cmp	r3, r7
	beq	.L981
	ldr	r0, [r2, #4]!
	cmp	ip, r0
	bne	.L988
.L987:
	ldr	r3, [fp, #-52]
	mov	r2, #824
	ldr	ip, .L1019
	ldr	r0, [r3]
	ldr	r3, [ip, #52]
	ldr	ip, [fp, #-48]
	mla	r0, r2, r0, ip
	blx	r3
	ldr	r0, [fp, #-52]
	ldr	ip, [fp, #-48]
	mov	r2, #824
	ldr	r3, [r0]
	mla	r3, r2, r3, ip
	ldr	r2, [fp, #-56]
	str	r3, [r3, #788]
	str	r3, [r3, #752]
	str	r3, [r3, #716]
	ldr	r3, [r0]
	ldr	r1, [r2, #52]
	mov	r2, #824
	mla	r2, r2, r3, ip
	sub	r3, r1, #1
	str	r3, [r2, #48]
	ldr	r3, [r0]
	cmp	r3, r7
	beq	.L974
	add	r3, r3, #1
	mov	r2, r0
	str	r3, [r0]
	b	.L981
.L993:
	mov	lr, r5
	b	.L975
.L994:
	mov	lr, #0
	b	.L975
.L1020:
	.align	2
.L1019:
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
	mov	r5, r0
	add	r9, r0, #11141120
	ldrb	r7, [r4, #1064]	@ zero_extendqisi2
	str	r3, [r4, #2716]
	cmp	r7, r3
	str	r3, [r4, #2712]
	bne	.L1022
	add	r3, r9, #12288
	str	r3, [fp, #-240]
	ldrb	r6, [r3, #3483]	@ zero_extendqisi2
	add	r3, r2, #45056
	str	r3, [fp, #-244]
	cmp	r6, #0
	bne	.L1180
	ldr	ip, [r3, #2928]
	cmp	ip, #0
	beq	.L1106
	movw	r1, #47844
	mov	r3, r6
	movt	r1, 169
	add	r1, r0, r1
	b	.L1028
.L1027:
	cmp	r3, ip
	beq	.L1026
.L1028:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1027
	ldr	r0, [r2, #712]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	addeq	r0, r6, #64
	addeq	r2, r2, #712
	addeq	r6, r6, #1
	streq	r2, [r5, r0, asl #2]
	cmp	r3, ip
	bne	.L1028
.L1026:
	add	r3, r5, #256
	mov	r1, r6
	str	r3, [fp, #-248]
	mov	r2, #4
	mov	r0, r3
	ldr	r3, .L1190
	bl	qsort
	ldr	r3, [fp, #-244]
	str	r6, [r4, #1112]
	ldr	r1, [r3, #2932]
	cmp	r1, #0
	beq	.L1107
	movw	r0, #47908
	mov	r7, r6
	movt	r0, 169
	mov	r3, #0
	add	r0, r5, r0
	b	.L1031
.L1030:
	cmp	r3, r1
	beq	.L1181
.L1031:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1030
	ldr	ip, [r2, #712]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	addeq	ip, r7, #64
	addeq	r2, r2, #712
	addeq	r7, r7, #1
	streq	r2, [r5, ip, asl #2]
	cmp	r3, r1
	bne	.L1031
.L1181:
	rsb	r1, r6, r7
.L1029:
	add	r0, r6, #64
	ldr	r3, .L1190+4
	mov	r2, #4
	add	r0, r5, r0, lsl #2
	bl	qsort
	str	r7, [r4, #1112]
	b	.L1032
.L1022:
	add	r1, r9, #12288
	str	r1, [fp, #-240]
	ldrb	r6, [r1, #3483]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L1049
	add	r2, r2, #45056
	str	r2, [fp, #-244]
	ldr	r10, [r2, #2928]
	cmp	r10, #0
	beq	.L1182
	movw	r7, #47844
	add	r8, r9, #16384
	movt	r7, 169
	add	r7, r0, r7
	mov	r6, r3
	mov	r1, r7
.L1068:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1067
	sub	r0, fp, #44
	ldr	ip, [r8, #60]
	add	lr, r0, r6, lsl #2
	ldr	r0, [r2, #32]
	cmp	ip, r0
	strge	r2, [lr, #-192]
	addge	r6, r6, #1
.L1067:
	cmp	r3, r10
	bne	.L1068
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-252]
	mov	r1, r6
	mov	r0, r3
	ldr	r3, .L1190+8
	bl	qsort
	ldr	r3, [fp, #-244]
	ldr	r8, [r3, #2928]
	cmp	r8, #0
	beq	.L1177
.L1104:
	add	r9, r9, #16384
	mov	r3, r7
	mov	r2, #0
	mov	r7, r6
.L1071:
	ldr	r1, [r3, #4]!
	add	r2, r2, #1
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1070
	sub	r0, fp, #44
	ldr	ip, [r9, #60]
	add	lr, r0, r7, lsl #2
	ldr	r0, [r1, #32]
	cmp	ip, r0
	strlt	r1, [lr, #-192]
	addlt	r7, r7, #1
.L1070:
	cmp	r2, r8
	bne	.L1071
	ldr	r3, [fp, #-252]
	rsb	r8, r6, r7
	mov	r9, r6, asl #2
	mov	r2, #4
	add	r0, r3, r9
	mov	r1, r8
	ldr	r3, .L1190+12
	bl	qsort
	cmp	r6, #0
	subeq	r10, fp, #172
	beq	.L1072
.L1099:
	sub	r10, fp, #172
	ldr	r2, [fp, #-252]
	add	r8, r10, r8, lsl #2
	mov	r3, #0
.L1073:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r6
	str	r1, [r8], #4
	bcc	.L1073
.L1072:
	cmp	r7, r6
	bls	.L1074
	ldr	r3, [fp, #-252]
	add	r9, r3, r9
	mov	r3, r10
.L1075:
	add	r6, r6, #1
	ldr	r2, [r9], #4
	cmp	r6, r7
	str	r2, [r3], #4
	bne	.L1075
.L1074:
	ldr	r8, [fp, #-240]
	movw	r9, #42072
	mov	r6, #0
	add	r3, r5, #256
	str	r6, [r4, #1112]
	mov	r2, r7
	str	r6, [r4, #1116]
	movt	r9, 169
	ldrb	r0, [r8, #3483]	@ zero_extendqisi2
	add	r9, r5, r9
	ldr	r1, [fp, #-252]
	str	r6, [sp, #4]
	str	r9, [sp]
	str	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
	ldrb	r0, [r8, #3483]	@ zero_extendqisi2
	movw	r8, #42076
	add	r3, r5, #388
	mov	r2, r7
	mov	r1, r10
	str	r6, [sp, #4]
	movt	r8, 169
	add	r8, r5, r8
	str	r8, [sp]
	str	r3, [fp, #-252]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-244]
	ldr	r7, [r3, #2932]
	cmp	r7, r6
	subeq	r10, fp, #108
	beq	.L1076
	movw	r3, #47908
	sub	r10, fp, #108
	movt	r3, 169
	add	r3, r5, r3
	mov	r2, r10
.L1077:
	add	r6, r6, #1
	ldr	r1, [r3, #4]!
	cmp	r6, r7
	str	r1, [r2], #4
	bne	.L1077
.L1076:
	ldr	r3, .L1190+16
	mov	r2, #4
	mov	r1, r7
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-240]
	mov	r6, #1
	mov	r2, r7
	mov	r1, r10
	ldrb	r0, [r3, #3483]	@ zero_extendqisi2
	ldr	r3, [fp, #-248]
	str	r6, [sp, #4]
	str	r9, [sp]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	mov	r2, r7
	mov	r1, r10
	ldrb	r0, [r3, #3483]	@ zero_extendqisi2
	str	r6, [sp, #4]
	ldr	r3, [fp, #-252]
	str	r8, [sp]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r6, [r4, #1112]
	ldr	r3, [r4, #1116]
	rsb	r3, r3, r6
	clz	r3, r3
	mov	r3, r3, lsr #5
.L1066:
	cmp	r6, #1
	movls	r3, #0
	andhi	r3, r3, #1
	cmp	r3, #0
	beq	.L1078
	cmp	r6, #0
	beq	.L1079
	ldr	lr, [r5, #256]
	ldr	r3, [r5, #388]
	cmp	lr, r3
	bne	.L1078
	ldr	r1, [fp, #-248]
	add	r2, r5, #388
	mov	r3, #0
	b	.L1080
.L1081:
	ldr	ip, [r1, #4]!
	ldr	r0, [r2, #4]!
	cmp	ip, r0
	bne	.L1078
.L1080:
	add	r3, r3, #1
	cmp	r3, r6
	bne	.L1081
.L1082:
	ldr	r3, [r5, #392]
	str	lr, [r5, #392]
	str	r3, [r5, #388]
	ldrb	r3, [r4, #1076]	@ zero_extendqisi2
.L1100:
	cmp	r3, #0
	bne	.L1169
.L1083:
	movw	r6, #31360
	movw	r3, #43672
	movt	r6, 169
	add	r6, r5, r6
	mov	r0, r5
	movt	r3, 169
	mov	r1, #0
	add	r3, r5, r3
	mov	r2, r6
	bl	mvc_append_interview_list
	ldr	r3, [fp, #-240]
	ldrb	r0, [r3, #3483]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1183
	ldr	r1, [r4, #2712]
	ldr	ip, [r4, #1112]
	cmp	r1, #0
	beq	.L1085
	add	r2, ip, #63
	movw	r3, #32072
	movt	r3, 169
	add	r3, r5, r3
	add	r2, r5, r2, lsl #2
.L1086:
	add	r0, r0, #1
	str	r3, [r2, #4]!
	cmp	r0, r1
	add	r3, r3, #824
	bne	.L1086
	add	ip, ip, r0
.L1085:
	str	ip, [r4, #1112]
.L1087:
	ldrb	r1, [r4, #1064]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1184
.L1170:
	ldr	r0, [r4, #1112]
.L1084:
	cmp	r1, #0
	bne	.L1042
	cmp	r0, #0
	ldreq	r1, .L1190+20
	beq	.L1171
.L1041:
	ldr	r2, [r4, #1124]
	ldr	r3, [r4, #1128]
	add	r2, r2, #1
	ldr	r1, [r4, #1116]
	cmp	r0, r2
	add	r3, r3, #1
	movcc	r2, r0
	cmp	r3, r1
	str	r2, [r4, #1112]
	movcs	r3, r1
	cmp	r2, #32
	str	r3, [r4, #1116]
	bhi	.L1093
.L1101:
	add	r1, r2, #63
	mov	r0, #0
	add	r1, r5, r1, lsl #2
.L1094:
	add	r2, r2, #1
	str	r0, [r1, #4]!
	cmp	r2, #32
	bls	.L1094
.L1093:
	cmp	r3, #32
	bhi	.L1097
	add	r3, r3, #96
	add	r1, r5, #516
	mov	r2, #0
	add	r5, r5, r3, lsl #2
.L1096:
	str	r2, [r5, #4]!
	cmp	r5, r1
	bne	.L1096
.L1097:
	mov	r0, #0
.L1163:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1049:
	add	r3, r2, #45056
	str	r3, [fp, #-244]
	ldr	r10, [r3, #2928]
	cmp	r10, #0
	beq	.L1052
	movw	r7, #47844
	add	lr, r9, #16384
	movt	r7, 169
	add	r7, r0, r7
	mov	r3, r6
	mov	r1, r7
	b	.L1054
.L1053:
	cmp	r3, r10
	beq	.L1185
.L1054:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1053
	ldr	r0, [r2, #728]
	add	r8, r6, #64
	ldr	ip, [lr, #64]
	add	r2, r2, #712
	cmp	ip, r0
	strge	r2, [r5, r8, asl #2]
	addge	r6, r6, #1
	cmp	r3, r10
	bne	.L1054
.L1185:
	add	r3, r5, #256
	mov	r2, #4
	str	r3, [fp, #-248]
	mov	r1, r6
	mov	r0, r3
	ldr	r3, .L1190+24
	bl	qsort
	ldr	r3, [fp, #-244]
	ldr	r8, [r3, #2928]
	cmp	r8, #0
	beq	.L1176
.L1102:
	add	r9, r9, #16384
	mov	r10, r6
	mov	r3, #0
	b	.L1057
.L1056:
	cmp	r3, r8
	beq	.L1186
.L1057:
	ldr	r2, [r7, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #3]	@ zero_extendqisi2
	cmp	r1, #3
	bne	.L1056
	ldr	r1, [r2, #728]
	add	ip, r10, #64
	ldr	r0, [r9, #64]
	add	r2, r2, #712
	cmp	r0, r1
	strlt	r2, [r5, ip, asl #2]
	addlt	r10, r10, #1
	cmp	r3, r8
	bne	.L1057
.L1186:
	rsb	r8, r6, r10
	add	r0, r6, #64
	ldr	r3, .L1190+28
	mov	r2, #4
	mov	r1, r8
	add	r0, r5, r0, lsl #2
	bl	qsort
	add	r7, r10, #64
	cmp	r6, #0
	add	r7, r5, r7, lsl #2
	beq	.L1059
.L1098:
	add	r8, r8, #96
	add	r2, r5, #252
	mov	r3, #0
	add	r8, r5, r8, lsl #2
.L1060:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r6
	str	r1, [r8, #4]!
	bcc	.L1060
.L1059:
	cmp	r10, r6
	bls	.L1061
	add	r3, r6, #63
	add	r2, r5, #384
	add	r3, r5, r3, lsl #2
.L1062:
	add	r6, r6, #1
	ldr	r1, [r3, #4]!
	cmp	r6, r10
	str	r1, [r2, #4]!
	bne	.L1062
.L1061:
	ldr	r3, [fp, #-244]
	str	r10, [r4, #1116]
	str	r10, [r4, #1112]
	ldr	r1, [r3, #2932]
	cmp	r1, #0
	beq	.L1108
	movw	r0, #47908
	mov	r6, r10
	movt	r0, 169
	mov	r3, #0
	add	r0, r5, r0
	b	.L1065
.L1064:
	cmp	r3, r1
	beq	.L1187
.L1065:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1064
	ldrb	ip, [r2, #713]	@ zero_extendqisi2
	cmp	ip, #1
	addeq	ip, r5, r6, lsl #2
	addeq	r2, r2, #712
	addeq	r6, r6, #1
	streq	r2, [ip, #256]
	streq	r2, [ip, #388]
	cmp	r3, r1
	bne	.L1065
.L1187:
	rsb	r1, r10, r6
.L1063:
	mov	r0, r7
	ldr	r3, .L1190+4
	mov	r2, #4
	bl	qsort
	ldr	r1, [r4, #1112]
	ldr	r3, .L1190+4
	mov	r2, #4
	add	r0, r1, #97
	rsb	r1, r1, r6
	add	r0, r5, r0, lsl #2
	bl	qsort
	str	r6, [r4, #1116]
	str	r6, [r4, #1112]
	mov	r3, #1
	b	.L1066
.L1180:
	ldr	lr, [r3, #2928]
	cmp	lr, #0
	moveq	r7, lr
	beq	.L1025
	movw	r1, #47844
	mov	r3, r7
	movt	r1, 169
	add	r1, r0, r1
.L1034:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r7, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r7, r7, #1
	cmp	r3, lr
	bne	.L1034
.L1025:
	mov	r1, r7
	ldr	r3, .L1190+32
	mov	r2, #4
	sub	r0, fp, #236
	bl	qsort
	ldr	r3, [fp, #-240]
	movw	r8, #42072
	mov	r6, #0
	mov	r2, r7
	str	r6, [r4, #1112]
	sub	r1, fp, #236
	ldrb	r0, [r3, #3483]	@ zero_extendqisi2
	movt	r8, 169
	add	r3, r5, #256
	str	r6, [sp, #4]
	add	r8, r5, r8
	str	r8, [sp]
	str	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-244]
	ldr	r7, [r3, #2932]
	cmp	r7, r6
	subeq	r10, fp, #108
	beq	.L1035
	movw	r3, #47908
	sub	r10, fp, #108
	movt	r3, 169
	add	r3, r5, r3
	mov	r2, r10
.L1036:
	add	r6, r6, #1
	ldr	r1, [r3, #4]!
	cmp	r6, r7
	str	r1, [r2], #4
	bne	.L1036
.L1035:
	ldr	r3, .L1190+16
	mov	r2, #4
	mov	r1, r7
	mov	r0, r10
	bl	qsort
	ldr	r3, [fp, #-240]
	mov	r2, r7
	mov	r1, r10
	ldrb	r0, [r3, #3483]	@ zero_extendqisi2
	mov	r3, #1
	str	r8, [sp]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
.L1032:
	ldrb	r3, [r4, #1076]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [r4, #1116]
	cmp	r3, r2
	beq	.L1083
	ldr	r0, [r4, #1112]
	cmp	r0, #0
	bne	.L1188
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L1043
	ldr	r3, [fp, #-240]
	add	r9, r9, #16384
	ldrb	r3, [r3, #3483]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1044
	ldr	r3, [r9, #40]
	add	r3, r3, #712
	str	r3, [r5, #256]
.L1045:
	mov	r3, #1
	str	r3, [r4, #1112]
.L1169:
	ldrb	r1, [r4, #1064]	@ zero_extendqisi2
	b	.L1170
.L1188:
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1041
.L1042:
	cmp	r0, #0
	bne	.L1041
	ldr	r1, [r4, #1116]
	cmp	r1, #0
	beq	.L1189
	ldr	r3, [r4, #1128]
	mov	r2, r0
	str	r0, [r4, #1112]
	add	r3, r3, #1
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r4, #1116]
	b	.L1101
.L1078:
	ldrb	r3, [r4, #1076]	@ zero_extendqisi2
	b	.L1100
.L1183:
	movw	ip, #42072
	ldr	r2, [r4, #2712]
	ldr	r3, [fp, #-248]
	mov	r1, r6
	movt	ip, 169
	add	ip, r5, ip
	str	ip, [sp]
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1087
.L1044:
	cmp	r3, #1
	ldr	r3, [r9, #40]
	addeq	r3, r3, #748
	addne	r3, r3, #784
	str	r3, [r5, #256]
	b	.L1045
.L1079:
	ldr	lr, [r5, #388]
	b	.L1082
.L1184:
	movw	r6, #33008
	movw	r3, #43676
	movt	r6, 169
	add	r6, r5, r6
	mov	r0, r5
	movt	r3, 169
	mov	r2, r6
	add	r3, r5, r3
	bl	mvc_append_interview_list
	ldr	r3, [fp, #-240]
	ldrb	r0, [r3, #3483]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1089
	ldr	r1, [r4, #2716]
	ldr	ip, [r4, #1116]
	cmp	r1, #0
	beq	.L1090
	add	r2, ip, #96
	movw	r3, #33720
	movt	r3, 169
	add	r3, r5, r3
	add	r2, r5, r2, lsl #2
.L1091:
	add	r0, r0, #1
	str	r3, [r2, #4]!
	cmp	r0, r1
	add	r3, r3, #824
	bne	.L1091
	add	ip, ip, r0
.L1090:
	str	ip, [r4, #1116]
	ldrb	r1, [r4, #1064]	@ zero_extendqisi2
	ldr	r0, [r4, #1112]
	b	.L1084
.L1177:
	ldr	r2, [fp, #-252]
	mov	r9, r6, asl #2
	ldr	r3, .L1190+12
	mov	r1, r8
	add	r0, r2, r9
	mov	r2, #4
	bl	qsort
	subs	r7, r6, #0
	bne	.L1099
.L1172:
	sub	r10, fp, #172
	b	.L1074
.L1176:
	add	r7, r6, #64
	ldr	r3, .L1190+28
	mov	r2, #4
	mov	r1, r8
	add	r7, r5, r7, lsl #2
	mov	r0, r7
	bl	qsort
	subs	r10, r6, #0
	bne	.L1098
	b	.L1061
.L1106:
	mov	r6, ip
	b	.L1026
.L1107:
	mov	r7, r6
	b	.L1029
.L1108:
	mov	r6, r10
	b	.L1063
.L1182:
	sub	r3, fp, #236
	mov	r2, #4
	str	r3, [fp, #-252]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L1190+8
	bl	qsort
	ldr	r3, [fp, #-244]
	ldr	r8, [r3, #2928]
	cmp	r8, #0
	movwne	r7, #47844
	movne	r6, r10
	movtne	r7, 169
	addne	r7, r5, r7
	bne	.L1104
	ldr	r3, .L1190+12
	mov	r2, #4
	mov	r1, r8
	ldr	r0, [fp, #-252]
	mov	r7, r8
	bl	qsort
	b	.L1172
.L1052:
	add	r3, r0, #256
	mov	r2, #4
	str	r3, [fp, #-248]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L1190+24
	bl	qsort
	ldr	r3, [fp, #-244]
	ldr	r8, [r3, #2928]
	cmp	r8, #0
	movwne	r7, #47844
	movne	r6, r10
	movtne	r7, 169
	addne	r7, r5, r7
	bne	.L1102
	ldr	r7, [fp, #-248]
	mov	r2, #4
	ldr	r3, .L1190+28
	mov	r1, r8
	mov	r10, r8
	mov	r0, r7
	bl	qsort
	b	.L1061
.L1189:
	ldr	r1, .L1190+36
.L1171:
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	b	.L1163
.L1089:
	movw	ip, #42076
	ldr	r2, [r4, #2716]
	mov	r1, r6
	movt	ip, 169
	add	r3, r5, #388
	add	ip, r5, ip
	str	ip, [sp]
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1169
.L1043:
	ldr	r1, .L1190+40
	b	.L1171
.L1191:
	.align	2
.L1190:
	.word	MVC_compare_pic_by_pic_num_desc
	.word	MVC_compare_pic_by_lt_pic_num_asc
	.word	MVC_compare_fs_by_poc_desc
	.word	MVC_compare_fs_by_poc_asc
	.word	MVC_compare_fs_by_lt_pic_idx_asc
	.word	.LC29
	.word	MVC_compare_pic_by_poc_desc
	.word	MVC_compare_pic_by_poc_asc
	.word	MVC_compare_fs_by_frame_num_desc
	.word	.LC30
	.word	.LC28
	UNWIND(.fnend)
	.size	MVC_InitListX, .-MVC_InitListX
	.align	2
	.global	MVC_DumpList
	.type	MVC_DumpList, %function
MVC_DumpList:
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
	ldr	r3, .L1205
	ldr	r3, [r3]
	tst	r3, #8192
	beq	.L1192
	movw	r6, #42068
	add	r8, r0, #252
	movt	r6, 169
	add	r6, r0, r6
	mov	r7, #0
.L1194:
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	movne	r5, r8
	movne	r4, #0
	beq	.L1196
.L1195:
	ldr	ip, [r5, #4]!
	mov	r3, r4
	mov	r2, r7
	ldr	r1, .L1205+4
	mov	r0, #13
	add	r4, r4, #1
	ldr	ip, [ip, #4]
	ldr	lr, [ip, #32]
	str	lr, [sp, #4]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6]
	cmp	r3, r4
	bhi	.L1195
.L1196:
	add	r7, r7, #1
	add	r8, r8, #132
	cmp	r7, #2
	bne	.L1194
.L1192:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1206:
	.align	2
.L1205:
	.word	g_PrintEnable
	.word	.LC31
	UNWIND(.fnend)
	.size	MVC_DumpList, .-MVC_DumpList
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
	ldr	r2, [r3, #2924]
	cmp	r2, #0
	beq	.L1212
	ldr	r4, [r3, #2920]
	add	r3, r0, #11141120
	add	r3, r3, #16384
	cmp	r4, #0
	ldr	r5, [r3, #60]
	beq	.L1213
	movw	ip, #47780
	mov	r6, #0
	movt	ip, 169
	add	ip, r0, ip
	mov	r1, r6
	mvn	lr, #-2147483648
.L1211:
	ldr	r2, [ip, #4]!
	add	r1, r1, #1
	cmp	r2, #0
	beq	.L1210
	ldr	r3, [r2, #32]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r6, [r2, #220]
	movlt	lr, r3
.L1210:
	cmp	r1, r4
	bne	.L1211
.L1209:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1213:
	mov	r6, r4
	b	.L1209
.L1212:
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
	ldrb	r2, [r3, #1064]	@ zero_extendqisi2
	cmp	r2, #2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	add	r2, r0, #11141120
	movw	r6, #48212
	add	r2, r2, #12288
	ldrb	lr, [r2, #3483]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L1248
	ldr	r4, [r3, #1112]
	movw	r5, #48216
	movt	r6, 169
	movt	r5, 169
	cmp	r4, #0
	add	r6, r0, r6
	add	r5, r0, r5
	mov	r7, lr
	beq	.L1226
.L1250:
	add	r2, r0, #252
	mov	ip, #32
	mov	r3, #0
	b	.L1224
.L1223:
	add	r3, r3, #1
	cmp	r3, r4
	beq	.L1249
.L1224:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	cmp	r1, lr
	bne	.L1223
	cmp	ip, r3
	movcs	ip, r3
	add	r3, r3, #1
	cmp	r3, r4
	str	ip, [r5, #-4]
	str	ip, [r6, #4]
	bne	.L1224
.L1249:
	cmp	ip, #31
	bhi	.L1226
.L1225:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, #16
	add	r5, r5, #8
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r4, #0
	bne	.L1250
.L1226:
	str	r7, [r5, #-4]
	str	r7, [r6, #4]
	b	.L1225
.L1248:
	ldr	r5, [r3, #1112]
	mov	lr, #0
	movt	r6, 169
	mov	r7, lr
	cmp	r5, #0
	add	r6, r0, r6
	beq	.L1230
.L1252:
	add	r1, r0, #252
	mov	r4, #32
	mov	r2, #0
	b	.L1228
.L1227:
	add	r2, r2, #1
	cmp	r2, r5
	beq	.L1251
.L1228:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #4]
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #52]
	mov	r3, r3, asl #1
	cmp	ip, #2
	orreq	r3, r3, #1
	cmp	r3, lr
	bne	.L1227
	cmp	r4, r2
	movcs	r4, r2
	add	r2, r2, #1
	cmp	r2, r5
	str	r4, [r6]
	bne	.L1228
.L1251:
	cmp	r4, #31
	bhi	.L1230
.L1229:
	add	lr, lr, #1
	add	r6, r6, #4
	cmp	lr, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r5, #0
	bne	.L1252
.L1230:
	str	r7, [r6]
	b	.L1229
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
	ldrb	r2, [r3, #1064]	@ zero_extendqisi2
	str	r6, [r3, #2696]
	cmp	r2, #2
	str	r0, [r3, #2700]
	beq	.L1260
	mov	r0, r4
	bl	MVC_InitListX
	cmp	r0, #0
	bne	.L1261
	mov	r0, r4
	bl	MVC_ReorderListX
	mov	r0, r4
	bl	MVC_RepairList
	cmp	r0, #0
	bne	.L1258
	mov	r0, r4
	add	r5, r5, #40960
	bl	MVC_FindMinRefIdx
	ldr	r3, [r4, #256]
	mov	r0, #0
	cmp	r3, #0
	ldrne	r3, [r3, #4]
	ldrne	r6, [r3, #220]
	str	r6, [r5, #2696]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1260:
	mov	r0, #0
	str	r0, [r3, #1112]
	str	r0, [r3, #1116]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1258:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1261:
	ldr	r1, .L1262
	mov	r0, #13
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1263:
	.align	2
.L1262:
	.word	.LC32
	UNWIND(.fnend)
	.size	MVC_DecList, .-MVC_DecList
	.align	2
	.global	MVC_NoPicOut
	.type	MVC_NoPicOut, %function
MVC_NoPicOut:
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
	ldr	ip, [r0, #48]
	cmp	ip, #0
	beq	.L1271
	movw	r3, #48351
	mov	r2, #0
	movt	r3, 169
	mov	lr, r2
	add	r3, r0, r3
	b	.L1270
.L1279:
	ldrb	r1, [r3, #-2]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1268
	cmp	r2, ip
	add	r3, r3, #824
	beq	.L1271
.L1270:
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r1, #1
	bne	.L1279
.L1268:
	cmp	r2, ip
	strb	lr, [r3, #-5]
	strb	lr, [r3, #-4]
	add	r3, r3, #824
	bne	.L1270
.L1271:
	ldr	r2, [r0, #52]
	cmp	r2, #0
	beq	.L1280
	mov	r3, #0
	add	r0, r0, #144
	mov	r1, r3
.L1272:
	add	r3, r3, #1
	str	r1, [r0, #4]!
	cmp	r3, r2
	bne	.L1272
	ldmfd	sp, {fp, sp, pc}
.L1280:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_NoPicOut, .-MVC_NoPicOut
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
	ldr	r0, [r0, #120]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1298
.L1282:
	ldr	r3, [r8, #48]
	cmp	r3, #0
	beq	.L1289
	movw	r5, #48984
	mov	r6, #0
	movt	r5, 169
	add	r5, r8, r5
	mov	r7, #0
	mov	r9, #0
.L1288:
	sub	r4, r5, #32
	mov	r3, #0
	strb	r3, [r5, #-638]
	strb	r3, [r5, #-637]
.L1287:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1299
.L1286:
	cmp	r4, r5
	bne	.L1287
	ldr	r3, [r8, #48]
	add	r9, r9, #1
	add	r5, r5, #824
	cmp	r3, r9
	bhi	.L1288
.L1289:
	ldr	r2, [r8, #52]
	cmp	r2, #0
	beq	.L1300
	mov	r3, #0
	add	r8, r8, #144
	mov	r1, r3
.L1290:
	add	r3, r3, #1
	str	r1, [r8, #4]!
	cmp	r3, r2
	bne	.L1290
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1299:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1286
.L1298:
	add	r0, r8, #584
	bl	ResetVoQueue
	b	.L1282
.L1300:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBackPicFromVOQueue, .-MVC_GetBackPicFromVOQueue
	.align	2
	.global	mvc_wait_vo
	.type	mvc_wait_vo, %function
mvc_wait_vo:
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
	.size	mvc_wait_vo, .-mvc_wait_vo
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
.L1303:
	add	r3, r3, #1
	cmp	r0, r2, asl r3
	bge	.L1303
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
	ldrb	r1, [r7, #1076]	@ zero_extendqisi2
	ldr	r3, [r7, #1080]
	sxtb	r2, r1
	cmn	r2, #1
	mla	r3, lr, r3, ip
	beq	.L1322
	cmp	r1, #0
	bne	.L1308
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r3, [r3, #28]
	cmp	r2, #1
	beq	.L1323
	ldr	r2, [r4, #28]
	cmp	r2, r3
	beq	.L1310
	ldr	r1, .L1325
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1308:
	ldr	r1, .L1325+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1322:
	ldr	r2, [r3, #28]
	movw	r6, #3992
	ldr	r3, [r4, #248]
	mla	r6, r6, r2, r3
.L1307:
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
	bne	.L1312
	add	r1, r0, #45056
	ldr	r0, [r6, #3972]
	ldr	r1, [r1, #2920]
	add	r1, r1, #1
	cmp	r0, r1
	movls	ip, r8
	bls	.L1313
.L1312:
	ldr	r1, .L1325+8
	ldr	r8, [r1]
	cmp	r8, #0
	moveq	ip, #1
	beq	.L1313
	mov	ip, ip, asl #4
	mov	r1, r3, asl #4
	mov	lr, lr, asl #4
	mov	r2, r2, asl #4
	strh	ip, [fp, #-42]	@ movhi
	mov	r3, #8
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	strh	r1, [fp, #-38]	@ movhi
	mov	r1, #2
	strh	lr, [fp, #-44]	@ movhi
	ldr	r0, [r4, #120]
	blx	r8
	mov	ip, #1
.L1313:
	ldrb	r3, [r7, #1075]	@ zero_extendqisi2
	cmp	r3, #1
	ldrne	r1, [r6, #3972]
	subne	r1, r1, #1
	beq	.L1324
.L1316:
	ldr	r3, [r4, #44]
	mov	r0, ip
	cmp	r3, r1
	orrne	ip, ip, #1
	str	ip, [r5]
	str	r1, [r4, #44]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1310:
	movw	r6, #35364
	movt	r6, 168
	add	r6, r4, r6
	b	.L1307
.L1324:
	movw	r0, #39336
	add	r3, r4, #290816
	movt	r0, 168
	add	r3, r3, #808
	add	r0, r4, r0
	mov	r1, #0
.L1315:
	ldr	r2, [r3]
	add	r3, r3, #335872
	add	r3, r3, #308
	cmp	r2, r1
	subhi	r1, r2, #1
	cmp	r3, r0
	bne	.L1315
	add	r1, r1, #1
	mov	r1, r1, asl #1
	cmp	r1, #16
	movcs	r1, #16
	b	.L1316
.L1323:
	movw	r6, #8500
	movt	r6, 5
	mla	r6, r6, r3, r4
	add	r6, r6, #286720
	add	r6, r6, #932
	b	.L1307
.L1326:
	.align	2
.L1325:
	.word	.LC33
	.word	.LC34
	.word	g_event_report
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
	add	r7, r0, #11075584
	ldr	r6, [r0, #236]
	add	r5, r7, #40960
	mov	r2, #1
	ldrb	r1, [r5, #1067]	@ zero_extendqisi2
	ldr	ip, [r6, #2900]
	ldr	r3, [r6, #2896]
	sub	r1, r1, #5
	clz	r1, r1
	cmp	ip, r2
	add	r3, r3, #4
	ldr	lr, [r6, #2904]
	mov	r1, r1, lsr #5
	mov	r3, r2, asl r3
	beq	.L1329
	bcc	.L1330
	cmp	ip, #2
	ldmnefd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r1, #0
	bne	.L1385
	add	r4, r7, #36864
	ldrb	r2, [r4, #4024]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1363
	ldr	r1, [r4, #4080]
	ldr	r0, [r4, #4076]
	ldr	r2, [r4, #4088]
	cmp	r1, r0
	addcc	r2, r2, r3
	strcc	r2, [r4, #4084]
	bcs	.L1365
.L1366:
	add	r3, r2, r1
	str	r3, [r4, #4072]
	ldrb	r0, [r5, #1072]	@ zero_extendqisi2
	mov	r3, r3, asl #1
	cmp	r0, #0
	subeq	r3, r3, #1
	str	r3, [r4, #4060]
	ldrb	r0, [r5, #1065]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1369
	str	r3, [r4, #4056]
	str	r3, [r4, #4052]
	str	r3, [r4, #4048]
.L1362:
	add	r7, r7, #36864
	str	r1, [r7, #4076]
	str	r2, [r7, #4088]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1330:
	cmp	r1, #0
	add	lr, lr, #4
	mov	r2, r2, asl lr
	bne	.L1386
	add	r4, r7, #36864
	ldrb	r3, [r4, #4024]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1334
	ldr	lr, [r4, #4036]
	ldr	ip, [r4, #4040]
	mov	r1, lr
.L1335:
	ldr	r0, [r4, #4028]
	cmp	r0, ip
	bcs	.L1333
	rsb	r3, r0, ip
	cmp	r3, r2, lsr #1
	addcs	r1, r1, r2
	strcs	r1, [r4, #4044]
	bcs	.L1337
.L1333:
	cmp	r0, ip
	bls	.L1338
	rsb	r3, ip, r0
	cmp	r3, r2, lsr #1
	rsbhi	r1, r2, r1
	strhi	r1, [r4, #4044]
	bls	.L1338
.L1337:
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1339
.L1388:
	ldr	r3, [r4, #4032]
	add	r1, r1, r0
	str	r1, [r4, #4048]
	add	r3, r1, r3
	str	r3, [r4, #4052]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r4, #4060]
.L1340:
	ldr	r2, [r4, #4080]
	str	r3, [r4, #4056]
	add	r3, r7, #40960
	ldr	r1, [r4, #4076]
	cmp	r2, r1
	strne	r2, [r4, #4076]
	ldrb	r3, [r3, #1072]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r7, #36864
	ldrne	r2, [r7, #4028]
	ldrne	r3, [r7, #4044]
	strne	r2, [r7, #4040]
	strne	r3, [r7, #4036]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1329:
	cmp	r1, #0
	add	r4, r7, #36864
	movne	r3, #0
	strne	r3, [r4, #4084]
	bne	.L1344
	ldrb	r2, [r4, #4024]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1345
	mov	r3, r1
	str	r1, [r4, #4088]
	str	r1, [r4, #4076]
.L1346:
	str	r3, [r4, #4084]
.L1344:
	ldr	r3, [r6, #2916]
	cmp	r3, #0
	beq	.L1348
	ldr	r3, [r4, #4080]
	ldr	r0, [r4, #4084]
	add	r0, r3, r0
	str	r0, [r4, #4072]
	ldrb	r8, [r5, #1072]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L1350
	cmp	r0, #0
	beq	.L1351
	sub	r0, r0, #1
	str	r0, [r4, #4072]
.L1350:
	mov	r3, #0
	str	r3, [r5, #8]
	ldr	r1, [r6, #2916]
	cmp	r1, r3
	bgt	.L1371
	cmp	r0, #0
	beq	.L1354
.L1387:
	sub	r9, r0, #1
	mov	r0, r9
	bl	__aeabi_uidiv
	mov	r10, r0
	mov	r0, r9
	str	r10, [r5]
	ldr	r1, [r6, #2916]
	bl	__aeabi_uidivmod
	str	r1, [r4, #4092]
	cmp	r1, #0
	ldr	r0, [r5, #8]
	mul	r0, r0, r10
	str	r0, [r5, #4]
	blt	.L1355
	add	r2, r6, #2912
	add	r1, r1, #1
	add	r2, r2, #4
	mov	r3, #0
.L1356:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r5, #4]
	bne	.L1356
.L1355:
	cmp	r8, #0
	ldreq	r3, [r6, #2908]
	addeq	r0, r0, r3
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	streq	r0, [r5, #4]
	cmp	r3, #0
	bne	.L1358
	ldr	r2, [r4, #4064]
	ldr	r1, [r4, #4068]
	add	r2, r0, r2
	str	r2, [r4, #4048]
	ldr	r3, [r6, #2912]
	add	r3, r2, r3
	add	r0, r3, r1
	str	r0, [r4, #4052]
	cmp	r0, r2
	movge	r0, r2
	str	r0, [r4, #4060]
.L1359:
	add	r7, r7, #36864
	ldr	r2, [r7, #4080]
	ldr	r3, [r7, #4084]
	str	r0, [r7, #4056]
	str	r2, [r7, #4076]
	str	r3, [r7, #4088]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1348:
	str	r3, [r4, #4072]
	ldrb	r8, [r5, #1072]	@ zero_extendqisi2
.L1351:
	mov	r0, #0
	str	r0, [r5, #8]
	ldr	r3, [r6, #2916]
	cmp	r3, r0
	ble	.L1354
.L1371:
	add	ip, r6, #2912
	mov	r3, #0
	add	ip, ip, #4
	mov	r2, r3
.L1353:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r5, #8]
	ldr	r1, [r6, #2916]
	cmp	r1, r2
	bgt	.L1353
	cmp	r0, #0
	bne	.L1387
.L1354:
	mov	r0, #0
	str	r0, [r5, #4]
	b	.L1355
.L1386:
	add	r4, r0, #11075584
	add	r4, r4, #36864
.L1336:
	mov	r3, #0
	ldr	r0, [r4, #4028]
	str	r3, [r4, #4036]
	mov	lr, r3
	str	r3, [r4, #4040]
	mov	r1, ip
	b	.L1333
.L1385:
	add	r3, r7, #36864
	mov	r1, #0
	mov	r2, r1
	str	r1, [r3, #4084]
	str	r1, [r3, #4052]
	str	r1, [r3, #4048]
	str	r1, [r3, #4056]
	str	r1, [r3, #4060]
	ldr	r1, [r3, #4080]
	b	.L1362
.L1338:
	str	lr, [r4, #4044]
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1388
.L1339:
	ldrb	r3, [r5, #1066]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r1, r0
	streq	r3, [r4, #4048]
	strne	r3, [r4, #4052]
	str	r3, [r4, #4060]
	b	.L1340
.L1358:
	ldrb	r3, [r5, #1066]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r6, #2912]
	ldreq	r3, [r4, #4064]
	ldrne	r3, [r4, #4064]
	addne	r0, r0, r2
	addeq	r0, r0, r3
	streq	r0, [r4, #4048]
	addne	r0, r0, r3
	strne	r0, [r4, #4052]
	str	r0, [r4, #4060]
	b	.L1359
.L1334:
	movw	r3, #4025
	ldrsb	r3, [r4, r3]
	cmp	r3, #0
	bne	.L1336
	ldr	r0, [r4, #4048]
	mov	r1, ip
	mov	lr, r3
	str	r3, [r4, #4036]
	mov	ip, r0
	str	r0, [r4, #4040]
	b	.L1335
.L1345:
	ldr	r1, [r4, #4080]
	ldr	r2, [r4, #4076]
	cmp	r1, r2
	bcs	.L1347
	ldr	r2, [r4, #4088]
	add	r3, r3, r2
	str	r3, [r4, #4084]
	b	.L1344
.L1369:
	ldrb	r0, [r5, #1066]	@ zero_extendqisi2
	str	r3, [r4, #4056]
	cmp	r0, #0
	streq	r3, [r4, #4048]
	strne	r3, [r4, #4052]
	b	.L1362
.L1363:
	str	r1, [r4, #4076]
	mov	r2, r1
	str	r1, [r4, #4088]
	ldr	r1, [r4, #4080]
.L1365:
	str	r2, [r4, #4084]
	b	.L1366
.L1347:
	ldr	r3, [r4, #4088]
	b	.L1346
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
	add	r7, r0, #11141120
	ldr	r3, [r0, #236]
	add	r2, r7, #12288
	mov	r5, #1
	ldrb	r2, [r2, #3483]	@ zero_extendqisi2
	ldr	r3, [r3, #2896]
	cmp	r2, #0
	add	r3, r3, #4
	mov	r5, r5, asl r3
	add	r3, r0, #11075584
	beq	.L1390
	add	r3, r3, #45056
	sub	r6, r2, #1
	sub	r2, r2, #2
	clz	r6, r6
	ldr	r1, [r3, #2928]
	clz	r2, r2
	mov	r6, r6, lsr #5
	cmp	r1, #0
	mov	r2, r2, lsr #5
	beq	.L1410
	movw	lr, #47844
	add	r7, r7, #16384
	movt	lr, 169
	add	lr, r0, lr
	mov	r1, #0
.L1409:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #3]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L1404
	ldr	r4, [ip, #20]
	ldr	r8, [r7, #48]
	cmp	r4, r8
	rsbhi	r4, r5, r4
	str	r4, [ip, #24]
	ldr	ip, [lr]
	ldrb	r4, [ip, #3]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L1407
	ldr	r8, [ip, #748]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	r4, [ip, #24]
	addeq	r4, r6, r4, lsl #1
	streq	r4, [ip, #760]
	ldreq	ip, [lr]
	ldreqb	r4, [ip, #3]	@ zero_extendqisi2
.L1407:
	tst	r4, #2
	beq	.L1404
	ldr	r4, [ip, #784]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	ldreq	r4, [ip, #24]
	addeq	r4, r2, r4, lsl #1
	streq	r4, [ip, #796]
.L1404:
	ldr	ip, [r3, #2928]
	add	r1, r1, #1
	cmp	ip, r1
	bhi	.L1409
.L1410:
	ldr	r1, [r3, #2932]
	cmp	r1, #0
	beq	.L1434
	movw	r4, #47908
	mov	ip, #0
	movt	r4, 169
	add	r4, r0, r4
.L1415:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldrb	r1, [lr, #3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1412
	tst	r1, #1
	beq	.L1413
	ldr	r0, [lr, #748]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #256
	ldreq	r1, [lr, #28]
	addeq	r1, r6, r1, lsl #1
	streq	r1, [lr, #756]
	ldreq	lr, [r4]
	ldreqb	r1, [lr, #3]	@ zero_extendqisi2
.L1413:
	tst	r1, #2
	beq	.L1412
	ldr	r1, [lr, #784]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [lr, #28]
	addeq	r1, r2, r1, lsl #1
	streq	r1, [lr, #792]
.L1412:
	ldr	r1, [r3, #2932]
	cmp	r1, ip
	bhi	.L1415
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1390:
	add	r3, r3, #45056
	ldr	r1, [r3, #2928]
	cmp	r1, #0
	addne	r7, r7, #16384
	movwne	lr, #47844
	movtne	lr, 169
	addne	lr, r0, lr
	bne	.L1399
.L1400:
	ldr	r2, [r3, #2932]
	cmp	r2, #0
	beq	.L1435
	movw	ip, #47908
	mov	r2, #0
	movt	ip, 169
	add	ip, r0, ip
	b	.L1402
.L1401:
	ldr	r1, [r3, #2932]
	cmp	r1, r2
	bls	.L1436
.L1402:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	ldrb	r0, [r1, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1401
	ldr	r0, [r1, #712]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #256
	ldreq	r0, [r1, #28]
	streq	r0, [r1, #720]
	ldr	r1, [r3, #2932]
	cmp	r1, r2
	bhi	.L1402
.L1436:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1437:
	ldr	ip, [r1, #712]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L1396
	ldr	ip, [r1, #20]
	ldr	r4, [r7, #48]
	rsb	r6, r5, ip
	cmp	ip, r4
	strhi	r6, [r1, #24]
	strls	ip, [r1, #24]
	ldr	r1, [lr]
	ldr	ip, [r1, #24]
	str	ip, [r1, #724]
.L1396:
	ldr	r1, [r3, #2928]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1400
.L1399:
	ldr	r1, [lr, #4]!
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1396
	b	.L1437
.L1434:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1435:
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
	beq	.L1443
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	lr, [r3, #2920]
	cmp	lr, #0
	beq	.L1443
	ldr	r2, [r3, #2728]
	rsb	r3, r2, r1
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L1445
	movw	ip, #47784
	movt	ip, 169
	add	ip, r0, ip
	b	.L1440
.L1441:
	ldr	r2, [ip, #4]!
	rsb	r0, r2, r1
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L1445
.L1440:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L1441
.L1443:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1445:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_IsOutDPB, .-MVC_IsOutDPB
	.align	2
	.global	mvc_combine_scalinglist
	.type	mvc_combine_scalinglist, %function
mvc_combine_scalinglist:
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
	cmp	r2, #0
	ldmlefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r6, .L1453
	mov	lr, #0
	mov	r5, #255
	sub	r7, r6, #16
.L1450:
	cmp	r2, #16
	ldreqb	ip, [lr, r7]	@ zero_extendqisi2
	ldrneb	ip, [lr, r6]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	and	r3, ip, #3
	mov	r4, ip, lsr #2
	ldrb	r8, [r0, ip, asl #2]	@ zero_extendqisi2
	mov	r3, r3, asl #3
	ldr	ip, [r1, r4, asl #2]
	bic	ip, ip, r5, asl r3
	orr	r3, ip, r8, asl r3
	str	r3, [r1, r4, asl #2]
	bne	.L1450
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1454:
	.align	2
.L1453:
	.word	.LANCHOR0+16
	UNWIND(.fnend)
	.size	mvc_combine_scalinglist, .-mvc_combine_scalinglist
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r3, r0, #0
	str	r1, [fp, #-48]
	str	r3, [fp, #-52]
	beq	.L1486
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1487
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1475
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
	ldr	r10, .L1492
	b	.L1460
.L1490:
	cmp	r4, #0
	beq	.L1488
	cmp	r4, #3
	beq	.L1489
	ldr	r3, [r10, #52]
	mov	r2, #16
	sub	r1, r6, #16
	mov	r0, r6
	blx	r3
.L1468:
	add	r4, r4, #1
	cmp	r4, #7
	bhi	.L1475
.L1474:
	add	r8, r8, #64
	add	r9, r9, #64
	add	r6, r6, #16
	add	r7, r7, #4
	add	r5, r5, #1
.L1460:
	cmp	r4, #5
	ldrsb	r3, [r5]
	bhi	.L1461
	cmp	r3, #0
	beq	.L1490
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1468
	ldr	r1, .L1492+4
	cmp	r4, #2
	mov	r2, #16
	ldr	r3, [r10, #52]
	add	r0, r1, r2
	add	r4, r4, #1
	movhi	r1, r0
	mov	r0, r6
	blx	r3
	cmp	r4, #7
	bls	.L1474
.L1475:
	mov	r0, #0
.L1457:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1461:
	cmp	r3, #0
	bne	.L1470
	ldr	r3, [fp, #-52]
	mov	r2, #64
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #52]
	bne	.L1491
.L1485:
	ldr	r1, .L1492+8
	cmp	r4, #6
	add	r0, r1, r2
	movne	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1468
.L1470:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1468
	ldr	r3, [r10, #52]
	mov	r2, #64
	b	.L1485
.L1491:
	mov	r1, r9
	mov	r0, r8
	blx	r3
	b	.L1468
.L1486:
	movw	r3, #6719
	ldr	r2, .L1492+12
	ldr	r1, .L1492+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1457
.L1487:
	mov	r0, r3
	ldr	r2, .L1492+12
	mov	r3, #6720
	ldr	r1, .L1492+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1457
.L1489:
	ldr	r3, [fp, #-52]
	mov	r2, #16
	ldr	r0, [fp, #-48]
	mov	r4, #4
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	add	r0, r0, #2064
	cmp	r3, #0
	ldr	r3, [r10, #52]
	ldrne	r1, [fp, #-52]
	ldreq	r1, .L1492+20
	addne	r1, r1, #2720
	blx	r3
	b	.L1474
.L1488:
	ldr	r3, [fp, #-52]
	mov	r2, #16
	ldr	r0, [fp, #-56]
	mov	r4, #1
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #52]
	ldrne	r1, [fp, #-52]
	ldreq	r1, .L1492+4
	addne	r1, r1, #2672
	blx	r3
	b	.L1474
.L1493:
	.align	2
.L1492:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR1+32
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR1+16
	UNWIND(.fnend)
	.size	mvc_assign_quant_params, .-mvc_assign_quant_params
	.align	2
	.global	MVC_WriteCurrPicYUV
	.type	MVC_WriteCurrPicYUV, %function
MVC_WriteCurrPicYUV:
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
	add	r4, r0, #11141120
	add	r2, r4, #12288
	add	r3, r4, #16384
	add	r4, r4, #16384
	ldr	r1, .L1497
	ldrb	r5, [r2, #3483]	@ zero_extendqisi2
	mov	r0, #2
	ldr	r3, [r3, #40]
	mov	r2, r5
	ldr	r3, [r3, #220]
	bl	dprint_vfmw
	ldr	ip, [r4, #100]
	cmp	r5, #3
	cmpne	r5, #0
	ldr	r3, [r4, #96]
	addne	r2, r5, #1
	ldr	r1, .L1497+4
	moveq	r2, #1
	str	ip, [sp]
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1498:
	.align	2
.L1497:
	.word	.LC35
	.word	.LC36
	UNWIND(.fnend)
	.size	MVC_WriteCurrPicYUV, .-MVC_WriteCurrPicYUV
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r3, r0, #11141120
	add	r6, r3, #16384
	add	r10, r3, #12288
	mov	r4, r0
	str	r3, [fp, #-48]
	ldr	lr, [r10, #3644]
	mov	r0, #2
	ldr	ip, [r6, #116]
	mov	r9, #0
	ldrb	r3, [r10, #3483]	@ zero_extendqisi2
	add	r5, r4, #11075584
	ldr	r2, [r6, #56]
	add	r8, r5, #32768
	ldr	r1, .L1535
	add	r7, r5, #36864
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dprint_vfmw
	movw	r3, #16368
	movt	r3, 170
	str	r9, [r4, #64]
	ldrd	r0, [r4, r3]
	movw	r3, #17856
	movt	r3, 170
	strd	r0, [r4, r3]
	ldr	r3, [r4, #544]
	ldr	r2, [r6, #56]
	ldr	r0, [r6, #100]
	str	r3, [r6, #2392]
	ldr	r3, [r10, #3608]
	ldr	r1, [r6, #104]
	str	r3, [r6, #2168]
	ldr	r3, [r10, #3612]
	str	r3, [r6, #2172]
	ldr	r3, [r10, #3632]
	str	r3, [r6, #2176]
	ldr	r3, [r10, #3636]
	str	r2, [r6, #1480]
	str	r3, [r6, #2180]
	ldrb	r3, [r10, #3483]	@ zero_extendqisi2
	strb	r3, [r6, #1448]
	ldr	r3, [r4, #236]
	ldrb	r2, [r3, #21]	@ zero_extendqisi2
	str	r0, [r6, #1484]
	str	r1, [r6, #1488]
	str	r2, [r6, #1496]
	ldr	r2, [r3, #3948]
	add	r2, r2, #1
	str	r2, [r6, #1492]
	ldrb	r2, [r8, #1908]	@ zero_extendqisi2
	strb	r2, [r6, #1451]
	ldr	r2, [r7, #1844]
	str	r2, [r6, #1500]
	ldrb	r2, [r7, #1784]	@ zero_extendqisi2
	str	r2, [r6, #1504]
	ldr	r2, [r3, #748]
	ldr	r3, [r6, #40]
	strb	r2, [r6, #1449]
	ldrb	r2, [r7, #1788]	@ zero_extendqisi2
	str	r2, [r6, #1508]
	ldr	r2, [r7, #4060]
	str	r2, [r6, #1512]
	ldr	r2, [r7, #4048]
	str	r2, [r6, #1516]
	ldr	r2, [r7, #4052]
	str	r2, [r6, #1520]
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L1533
	ldr	r2, [r10, #28]
	ldr	r3, [r10, #32]
	cmp	r2, #0
	beq	.L1503
	cmp	r3, #0
	beq	.L1503
	movw	r3, #18284
	movw	r2, #18156
	movw	r1, #18412
	ldr	r0, [r4, #120]
	movt	r3, 170
	movt	r2, 170
	add	r3, r4, r3
	add	r2, r4, r2
	movt	r1, 170
	add	r1, r4, r1
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r10, #28]
	movw	r2, #18416
	movw	r1, #18544
	movt	r2, 170
	movt	r1, 170
	ldr	r3, [r3, #4]
	add	r2, r4, r2
	add	r1, r4, r1
	add	r5, r5, #45056
	str	r3, [r6, #1756]
	ldr	r0, [r4, #120]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r6, #116]
	str	r3, [r6, #1764]
	ldr	r3, [r10, #12]
	str	r3, [r6, #2164]
	ldr	r3, [r10, #32]
	ldr	r3, [r3, #8]
	str	r3, [r6, #1760]
	ldr	r3, [r10, #32]
	ldr	r3, [r3, #64]
	str	r3, [r6, #1768]
	ldr	r10, [r5, #3148]
	cmp	r10, #0
	str	r10, [r6, #2384]
	beq	.L1509
	movw	r6, #48008
	movw	lr, #18572
	movw	ip, #48072
	movw	r0, #18636
	movw	r1, #48136
	movw	r2, #18700
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
	mov	r3, r9
.L1508:
	ldr	r9, [r6, #4]!
	add	r3, r3, #1
	cmp	r3, r10
	str	r9, [lr, #4]!
	ldr	r9, [ip, #4]!
	str	r9, [r0, #4]!
	ldr	r9, [r1, #4]!
	str	r9, [r2, #4]!
	bne	.L1508
.L1509:
	ldrb	r3, [r8, #1915]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1534
	ldrb	r1, [r7, #1802]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1510
	movw	ip, #17904
	ldr	r0, .L1535+4
	movt	ip, 170
	add	ip, r4, ip
.L1511:
	and	r3, r1, #3
	add	r1, r1, #1
	cmp	r1, #24
	add	r3, r0, r3, lsl #2
	ldr	r3, [r3, #352]
	bic	r2, r3, #16711680
	ubfx	lr, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, lr, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1511
	movw	r6, #18004
	mov	lr, #0
	movt	r6, 170
	add	r6, r4, r6
.L1512:
	add	r3, lr, #1
	and	r2, lr, #14
	and	r3, r3, #15
	add	lr, lr, #2
	add	r2, r0, r2, lsl #2
	cmp	lr, #32
	add	r3, r0, r3, lsl #2
	ldr	r1, [r2, #368]
	ldr	ip, [r3, #368]
	ubfx	r3, r1, #8, #8
	mov	r2, r1, lsr #24
	uxtb	r9, r1
	uxtb	r8, ip
	mov	r7, ip, lsr #16
	orr	r3, r3, r2, asl #8
	mov	r1, r1, lsr #8
	mov	r8, r8, asl #16
	and	r2, ip, #-16777216
	orr	r7, r8, r7, asl #24
	ubfx	ip, ip, #8, #8
	orr	r3, r3, r2
	orr	r7, r7, r9
	and	r1, r1, #65280
	orr	r3, r3, ip, asl #16
	orr	r2, r7, r1
	stmia	r6, {r2, r3}
	add	r6, r6, #8
	bne	.L1512
.L1517:
	cmp	r10, #0
	beq	.L1514
	ldr	r3, [fp, #-48]
	movw	r6, #48012
	movw	r8, #18880
	movt	r6, 169
	movt	r8, 170
	add	r9, r3, #18944
	add	r6, r4, r6
	add	r8, r4, r8
	mov	r7, #0
.L1520:
	ldr	r2, [r6]
	mov	r1, #0
	ldr	r0, [r4, #120]
	add	r7, r7, #1
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r8, #4]!
	ldr	r3, [r6], #4
	str	r3, [r9, #4]!
	ldr	r3, [r5, #3148]
	cmp	r3, r7
	bhi	.L1520
.L1514:
	mov	r0, #0
.L1530:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1534:
	ldrb	r1, [r7, #1802]	@ zero_extendqisi2
.L1510:
	cmp	r1, #1
	movw	ip, #17904
	movt	ip, 170
	mov	r0, #0
	add	ip, r4, ip
	beq	.L1515
.L1518:
	movw	r3, #25716
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
	bne	.L1518
	movw	r8, #18004
	mov	r9, #1
	movt	r8, 170
	add	r8, r4, r8
	mov	r7, #0
.L1519:
	mov	r2, r7, lsr #3
	mov	r3, r7, asl #1
	and	ip, r3, #14
	and	r0, r9, #15
	mov	r3, r2, asl #4
	movw	r1, #25740
	add	r0, r3, r0
	mov	r2, r1
	add	r3, r3, ip
	movt	r1, 42
	movt	r2, 42
	add	r1, r0, r1
	add	r2, r3, r2
	add	r7, r7, #1
	ldr	r1, [r4, r1, asl #2]
	cmp	r7, #16
	ldr	r3, [r4, r2, asl #2]
	add	r9, r9, #2
	ubfx	r6, r1, #8, #8
	and	r0, r1, #-16777216
	mov	r2, r1, lsr #16
	uxtb	r1, r1
	mov	ip, r3, lsr #24
	uxtb	lr, r3
	mov	r2, r2, asl #24
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r6, asl #16
	mov	r1, r3, lsr #8
	orr	r2, r2, lr
	and	r1, r1, #65280
	ubfx	r3, r3, #8, #8
	orr	r0, ip, r0
	orr	r2, r2, r1
	orr	r3, r0, r3
	stmia	r8, {r2, r3}
	add	r8, r8, #8
	bne	.L1519
	b	.L1517
.L1515:
	movw	r3, #26550
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
	bne	.L1515
	movw	ip, #18004
	mov	lr, #1
	movt	ip, 170
	add	ip, r4, ip
	mov	r0, #0
.L1516:
	mov	r2, r0, lsr #3
	mov	r3, r0, asl #1
	and	r1, r3, #14
	and	r6, lr, #15
	mov	r3, r2, asl #4
	movw	r2, #26574
	add	r6, r3, r6
	add	r3, r3, r1
	mov	r1, r2
	movt	r2, 42
	movt	r1, 42
	add	r2, r6, r2
	add	r1, r3, r1
	add	r0, r0, #1
	ldr	r2, [r4, r2, asl #2]
	cmp	r0, #16
	ldr	r3, [r4, r1, asl #2]
	add	lr, lr, #2
	ubfx	r9, r2, #8, #8
	and	r1, r2, #-16777216
	mov	r7, r2, lsr #16
	uxtb	r2, r2
	mov	r6, r3, lsr #24
	uxtb	r8, r3
	mov	r7, r7, asl #24
	mov	r6, r6, asl #8
	orr	r7, r7, r2, asl #16
	orr	r6, r6, r9, asl #16
	mov	r2, r3, lsr #8
	orr	r7, r7, r8
	and	r2, r2, #65280
	ubfx	r3, r3, #8, #8
	orr	r1, r6, r1
	orr	r2, r7, r2
	orr	r3, r1, r3
	stmia	ip, {r2, r3}
	add	ip, ip, #8
	bne	.L1516
	b	.L1517
.L1503:
	ldr	r1, .L1535+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1530
.L1533:
	ldr	r3, [r6, #40]
	ldr	r1, .L1535+12
	ldrsb	r2, [r3, #6]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1530
.L1536:
	.align	2
.L1535:
	.word	.LC37
	.word	.LANCHOR1
	.word	.LC39
	.word	.LC38
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
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
	bcs	.L1541
	add	lr, ip, #3
	add	lr, r6, lr, lsl #2
.L1542:
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
	bne	.L1542
.L1541:
	cmp	r3, #1
	bhi	.L1547
	add	r3, r3, #3
	add	ip, r6, #20
	mov	r2, #0
	add	r3, r6, r3, lsl #2
.L1546:
	str	r2, [r3, #4]!
	cmp	r3, ip
	str	r2, [r3, #-8]
	str	r2, [r3, #8]
	bne	.L1546
.L1547:
	add	r8, r4, #11141120
	ldr	r3, [fp, #-48]
	add	r7, r8, #12288
	add	r5, r4, #11075584
	cmp	r3, #0
	add	r9, r5, #36864
	ldrb	r3, [r7, #3489]	@ zero_extendqisi2
	add	r5, r5, #40960
	strb	r3, [r6, #1]
	ldr	r3, [r9, #1832]
	ldr	r2, [r5, #2680]
	add	r3, r3, #26
	add	r3, r3, r2
	str	r3, [r6, #32]
	bne	.L1643
	add	r2, r8, #16384
	str	r2, [fp, #-52]
	mov	ip, r2
	ldr	r2, [r2, #40]
	str	r3, [r2, #740]
	ldr	r3, [ip, #40]
	ldr	r2, [r6, #32]
	str	r2, [r3, #744]
.L1548:
	ldr	r3, [r5, #2676]
	str	r3, [r6, #36]
	ldr	r3, [r5, #1128]
	str	r3, [r6, #40]
	ldr	r3, [r5, #1124]
	str	r3, [r6, #44]
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	strb	r3, [r0, r1]
	ldr	r3, [r5, #1120]
	str	r3, [r6, #48]
	ldrb	r3, [r5, #1070]	@ zero_extendqisi2
	strb	r3, [r6, #2]
	ldr	r3, [r4, #236]
	ldrb	r3, [r3, #22]	@ zero_extendqisi2
	strb	r3, [r6, #3]
	ldr	r3, [r5, #1112]
	str	r3, [r6, #52]
	ldr	r3, [r5, #1116]
	str	r3, [r6, #56]
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r9, #1828]
	streqb	r3, [r6, #4]
	beq	.L1550
	cmp	r3, #0
	ldreqb	r3, [r9, #1786]	@ zero_extendqisi2
	movne	r3, #0
	strb	r3, [r6, #4]
.L1550:
	ldr	r3, [r9, #1836]
	str	r3, [r6, #60]
	ldr	r3, [r9, #1840]
	str	r3, [r6, #64]
	ldr	r3, [r5, #2688]
	str	r3, [r6, #68]
	ldr	r3, [r5, #2692]
	str	r3, [r6, #72]
	ldr	r3, [r5, #2684]
	str	r3, [r6, #76]
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1589
	ldr	ip, [r5, #1112]
	cmp	ip, #0
	beq	.L1592
	ldr	r3, [r4, #256]
	ldr	r2, [r3, #4]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r4, #256
	movne	r3, #0
	bne	.L1557
	b	.L1555
.L1559:
	ldr	r2, [r1, #4]!
	ldr	r2, [r2, #4]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1555
.L1557:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1559
	mov	r3, #0
	str	r3, [fp, #-56]
.L1554:
	ldr	ip, [r5, #1116]
	cmp	ip, #0
	beq	.L1593
	ldr	r3, [r4, #388]
	ldr	r2, [r3, #4]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r4, #388
	movne	r3, #0
	bne	.L1563
	b	.L1561
.L1565:
	ldr	r2, [r1, #4]!
	ldr	r2, [r2, #4]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1561
.L1563:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1565
	mov	r3, #0
	str	r3, [fp, #-60]
.L1560:
	ldrb	r2, [r7, #3483]	@ zero_extendqisi2
	ldr	r3, [r5, #1112]
	cmp	r2, #0
	beq	.L1566
	cmp	r3, #0
	beq	.L1581
	mov	r8, #0
	mov	r10, r6
	str	r6, [fp, #-64]
	add	r7, r4, #256
	mov	r6, r5
	mov	r5, r8
	ldr	r8, [fp, #-56]
	b	.L1580
.L1578:
	strb	r2, [r10, #1630]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r10, #1631]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r10, #1656]
.L1579:
	ldr	r2, [r6, #1112]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r10, r10, #36
	cmp	r2, r5
	bls	.L1644
.L1580:
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
	beq	.L1577
	cmp	r0, #0
	ldrne	r2, [r0, #28]
	ldrne	r0, [r2, #4]
.L1577:
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
	ldrb	r2, [r2, #712]	@ zero_extendqisi2
	strb	r2, [r10, #1626]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1578
	strb	r2, [r10, #1628]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r10, #1629]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r10, #1652]
	b	.L1579
.L1644:
	mov	r5, r6
	ldr	r6, [fp, #-64]
.L1581:
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1645
.L1569:
	movw	r2, #48208
	add	r3, r6, #3920
	add	r0, r6, #4048
	movt	r2, 169
	add	r3, r3, #4
	add	r2, r4, r2
	add	r0, r0, #4
.L1586:
	ldr	r1, [r2, #4]!
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L1586
	ldrb	r3, [r9, #1786]	@ zero_extendqisi2
	ldr	r2, [fp, #-52]
	cmp	r3, #0
	str	r3, [r2, #1748]
	ldr	r3, [r9, #1828]
	str	r3, [r2, #1752]
	beq	.L1587
	ldrb	r2, [r5, #1064]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1588
.L1587:
	cmp	r3, #1
	beq	.L1646
.L1589:
	ldr	r2, [fp, #-48]
	movw	r3, #37088
	movt	r3, 42
	ldr	r1, [r4, #232]
	add	r3, r2, r3
	mov	r2, #0
	add	r3, r4, r3, lsl #2
	str	r1, [r3, #4]
	str	r2, [r4, #232]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1643:
	add	r2, r8, #16384
	str	r2, [fp, #-52]
	ldr	r2, [r2, #40]
	ldr	lr, [r2, #740]
	ldr	ip, [r2, #744]
	cmp	lr, r3
	movlt	lr, r3
	cmp	ip, r3
	str	lr, [r2, #740]
	movge	ip, r3
	str	ip, [r2, #744]
	b	.L1548
.L1555:
	ldrsb	r1, [r2, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	movweq	r3, #7730
	beq	.L1639
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-56]
	b	.L1554
.L1646:
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1589
.L1588:
	ldr	r3, [r5, #1132]
	movw	r8, #42096
	movw	r7, #42224
	movw	lr, #42352
	movw	ip, #42864
	movw	r0, #42992
	str	r3, [r6, #80]
	movw	r1, #43120
	ldr	r10, [r5, #1136]
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
.L1590:
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
	ldr	r10, [r5, #1124]
	cmp	r10, r2
	bcs	.L1590
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1589
	movw	r7, #42480
	movw	lr, #42608
	movw	ip, #42736
	movw	r0, #43248
	movw	r1, #43376
	movw	r2, #43504
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
.L1591:
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
	ldr	r9, [r5, #1128]
	cmp	r9, r3
	bcs	.L1591
	b	.L1589
.L1566:
	cmp	r3, #0
	beq	.L1574
	ldr	r8, [fp, #-56]
	add	r10, r4, #256
	mov	r7, r6
	str	r6, [fp, #-64]
	mov	r6, r5
	mov	r5, r2
.L1573:
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
	beq	.L1572
	cmp	r0, #0
	ldrne	r2, [r0, #28]
	ldrne	r0, [r2, #4]
.L1572:
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
	ldr	r2, [r2, #728]
	str	r2, [r7, #1612]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #764]
	str	r2, [r7, #1616]
	ldr	r2, [r10], #4
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #800]
	strb	r3, [r7, #1588]
	str	r2, [r7, #1620]
	ldr	r2, [r6, #1112]
	cmp	r2, r5
	bhi	.L1573
	mov	r5, r6
	ldr	r6, [fp, #-64]
.L1574:
	ldrb	r3, [r5, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1569
	ldr	r3, [r5, #1116]
	cmp	r3, #0
	beq	.L1569
	mov	r8, #0
	mov	r7, r6
	str	r6, [fp, #-56]
	mov	r6, r5
	mov	r5, r8
	ldr	r8, [fp, #-60]
	add	r10, r4, #388
.L1576:
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
	beq	.L1575
	cmp	r0, #0
	ldrne	r2, [r0, #28]
	ldrne	r0, [r2, #4]
.L1575:
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
	ldr	r2, [r2, #728]
	str	r2, [r7, #2764]
	ldr	r2, [r10]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #764]
	str	r2, [r7, #2768]
	ldr	r2, [r10], #4
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #800]
	strb	r3, [r7, #2740]
	str	r2, [r7, #2772]
	ldr	r2, [r6, #1116]
	cmp	r2, r5
	bhi	.L1576
.L1638:
	mov	r5, r6
	ldr	r6, [fp, #-56]
	b	.L1569
.L1561:
	ldrsb	r1, [r2, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1647
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-60]
	b	.L1560
.L1645:
	ldr	r3, [r5, #1116]
	cmp	r3, #0
	beq	.L1569
	mov	r3, #0
	mov	r10, r6
	str	r6, [fp, #-56]
	add	r7, r4, #388
	mov	r6, r5
	ldr	r8, [fp, #-60]
	mov	r5, r3
	b	.L1585
.L1583:
	strb	r2, [r10, #2782]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r10, #2783]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r10, #2808]
.L1584:
	ldr	r2, [r6, #1116]
	add	r5, r5, #1
	add	r7, r7, #4
	add	r10, r10, #36
	cmp	r2, r5
	bls	.L1638
.L1585:
	ldr	r2, [r7]
	ldr	r0, [r4, #120]
	ldr	r2, [r2, #4]
	ldrsb	r1, [r2, #6]
	bl	FSP_GetLogicFs
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #48]
	str	r2, [r10, #2788]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strb	r2, [r10, #2777]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r0, r8
	beq	.L1582
	cmp	r0, #0
	ldrne	r2, [r0, #28]
	ldrne	r0, [r2, #4]
.L1582:
	str	r0, [r10, #2792]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #52]
	str	r2, [r10, #2796]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #32]
	str	r2, [r10, #2784]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r10, #2776]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	ldrb	r2, [r2, #712]	@ zero_extendqisi2
	strb	r2, [r10, #2778]
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1583
	strb	r2, [r10, #2780]
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r10, #2781]
	ldr	r2, [r7]
	ldr	r2, [r2, #16]
	str	r2, [r10, #2804]
	b	.L1584
.L1647:
	movw	r3, #7751
.L1639:
	ldr	r2, .L1648
	ldr	r1, .L1648+4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L1592:
	str	ip, [fp, #-56]
	b	.L1554
.L1593:
	str	ip, [fp, #-60]
	b	.L1560
.L1649:
	.align	2
.L1648:
	.word	.LANCHOR0+80
	.word	.LC40
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
	add	r0, r0, #16384
	ldr	r2, [r0, #2392]
	cmp	r2, #0
	beq	.L1653
	mov	r0, #0
.L1652:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1652
	ldmfd	sp, {fp, sp, pc}
.L1653:
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
	ldr	r1, .L1666
	mov	r4, r0
	add	r5, r0, #11075584
	bl	mvc_ue_v
	add	r5, r5, #40960
	str	r0, [r5, #1120]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1664
	cmp	r0, #262144
	bcs	.L1665
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #16]
	mul	r3, r3, r2
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1664
	ldr	r1, .L1666+4
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L1666+8
	mov	r2, r0
	mov	r6, r0
	mov	r0, #19
	bl	dprint_vfmw
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1664
	cmp	r6, #9
	bhi	.L1660
	mov	r1, #1
	movw	r3, #297
	mov	r2, r1, asl r6
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L1661
	ands	r0, r2, #660
	bne	.L1662
	tst	r2, #66
	beq	.L1660
	strb	r1, [r5, #1064]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1661:
	strb	r0, [r5, #1064]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1660:
	mov	r2, r6
	ldr	r1, .L1666+12
	mov	r0, #1
	bl	dprint_vfmw
.L1664:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1662:
	mov	r0, r3
	mov	r3, #2
	strb	r3, [r5, #1064]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1665:
	ldr	r1, .L1666+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1667:
	.align	2
.L1666:
	.word	.LC41
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC42
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
	ldr	r1, .L1680
	mov	r0, #19
	ldr	r2, [r5, #1080]
	bl	dprint_vfmw
	ldr	r3, [r4, #252]
	ldr	r2, [r5, #1080]
	mov	r1, #2240
	mla	r1, r1, r2, r3
	ldrb	r3, [r1, #19]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1678
	ldrb	r3, [r5, #1076]	@ zero_extendqisi2
	sxtb	r5, r3
	cmn	r5, #1
	beq	.L1679
	cmp	r3, #0
	bne	.L1673
	ldr	r2, [r1, #28]
	movw	r3, #8500
	movt	r3, 5
	mul	r3, r3, r2
	add	r0, r4, r3
	add	ip, r0, #12992
	add	r3, r0, #286720
	add	ip, ip, #8
	add	r3, r3, #932
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1674
	add	r0, r0, #286720
	ldrb	r0, [r0, #957]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1674
.L1672:
	mov	r0, #0
	str	r1, [r4, #244]
	str	r3, [r4, #240]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1679:
	ldr	r0, [r4, #248]
	movw	r3, #3992
	ldr	r2, [r1, #28]
	mla	r3, r3, r2, r0
	ldrb	r0, [r3, #25]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1672
	ldr	r1, .L1680+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1674:
	ldr	r1, .L1680+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1678:
	ldr	r1, .L1680+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1673:
	mov	r2, r5
	ldr	r1, .L1680+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1681:
	.align	2
.L1680:
	.word	.LC46
	.word	.LC48
	.word	.LC49
	.word	.LC47
	.word	.LC34
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
	mov	r2, r1
	mov	r5, r1
	mov	r4, r0
	ldr	r1, .L1691
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r2, [r4, #252]
	mov	r3, #2240
	mla	r3, r3, r5, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1688
	ldr	r1, [r4, #36]
	ldr	r2, [r3, #28]
	sub	r3, r1, #1
	cmp	r2, r3
	bhi	.L1689
	add	r3, r4, #11075584
	movw	r1, #1076
	add	r3, r3, #40960
	ldrsb	r5, [r3, r1]
	cmn	r5, #1
	beq	.L1690
.L1687:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1690:
	ldr	r1, [r4, #248]
	movw	r3, #3992
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1687
	ldr	r1, .L1691+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1688:
	mov	r2, r5
	ldr	r1, .L1691+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1689:
	ldr	r1, .L1691+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1692:
	.align	2
.L1691:
	.word	.LC50
	.word	.LC53
	.word	.LC51
	.word	.LC52
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
	add	r3, ip, #40960
	ldr	r1, [lr, #744]
	ldr	r0, [r3, #2728]
	ldr	r2, [r3, #2732]
	ldr	r4, [r3, #1080]
	ldr	r5, [r3, #2736]
	cmp	r2, r4
	cmpeq	r0, r1
	ldr	r2, [r3, #1092]
	ldrb	r4, [r3, #2720]	@ zero_extendqisi2
	ldrb	r0, [r3, #1065]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r5, r2
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	r4, r0
	orrne	r2, r2, #1
	cmp	r4, #0
	cmpne	r0, #0
	beq	.L1695
	ldrb	r0, [r3, #2721]	@ zero_extendqisi2
	ldrb	r1, [r3, #1066]	@ zero_extendqisi2
	cmp	r0, r1
	orrne	r2, r2, #1
.L1695:
	ldrb	r1, [r3, #2723]	@ zero_extendqisi2
	ldrb	r0, [r3, #1072]	@ zero_extendqisi2
	cmp	r1, r0
	moveq	r1, #0
	beq	.L1696
	cmp	r0, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
.L1696:
	ldrb	r0, [r3, #2722]	@ zero_extendqisi2
	ldrb	r4, [r3, #1067]	@ zero_extendqisi2
	cmp	r0, r4
	orrne	r2, r2, #1
	cmp	r4, #5
	cmpeq	r0, #5
	orr	r2, r2, r1
	beq	.L1708
.L1697:
	ldr	r1, [lr, #2900]
	cmp	r1, #0
	bne	.L1698
	add	r1, ip, #36864
	ldr	r0, [r3, #2748]
	ldr	r4, [r3, #2744]
	ldr	r5, [r1, #4032]
	ldr	lr, [r1, #4028]
	cmp	r4, lr
	cmpeq	r0, r5
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
.L1699:
	ldrb	r1, [r3, #1075]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1700
	ldr	r1, [r3, #2764]
	ldrb	r0, [r3, #2724]	@ zero_extendqisi2
	ldrb	r6, [r3, #1073]	@ zero_extendqisi2
	ldr	r5, [r3, #2704]
	ldrb	r4, [r3, #2725]	@ zero_extendqisi2
	cmp	r1, r5
	cmpeq	r0, r6
	ldrb	lr, [r3, #1074]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r4, lr
	moveq	r3, r1
	orrne	r3, r1, #1
	orr	r2, r2, r3
.L1700:
	add	r3, ip, #40960
	ldr	r1, .L1709
	mov	r0, #19
	ldr	r4, [r3, #1120]
	cmp	r4, #0
	movne	r4, r2
	orreq	r4, r2, #1
	mov	r2, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1698:
	cmp	r1, #1
	bne	.L1699
	add	r1, ip, #36864
	ldr	r0, [r3, #2756]
	ldr	r4, [r3, #2752]
	ldr	r5, [r1, #4068]
	ldr	lr, [r1, #4064]
	cmp	r4, lr
	cmpeq	r0, r5
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
	b	.L1699
.L1708:
	ldr	r0, [r3, #2740]
	ldr	r1, [r3, #1108]
	cmp	r0, r1
	orrne	r2, r2, #1
	b	.L1697
.L1710:
	.align	2
.L1709:
	.word	.LC54
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r4, r0, #11075584
	ldr	r2, [r0, #240]
	add	r4, r4, #40960
	mov	r5, r0
	mov	r3, #0
	mov	r6, #1
	ldrb	r0, [r4, #1075]	@ zero_extendqisi2
	ldrb	r1, [r4, #1065]	@ zero_extendqisi2
	cmp	r0, r3
	strb	r3, [r4, #12]
	strb	r3, [r4, #13]
	movne	r7, #5
	moveq	r7, #3
	cmp	r1, r3
	ldr	r3, [r2, #2896]
	addne	r3, r3, #5
	addeq	r3, r3, #4
	mov	r6, r6, asl r3
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1766
.L1765:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
.L1732:
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1766:
	ldr	r1, .L1773
	mov	r0, r5
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r4, #12]
	cmp	r0, #0
	beq	.L1722
	ldr	r3, [r4, #1124]
	cmn	r3, #2
	beq	.L1748
	movw	r9, #40972
	mov	r8, #0
	movt	r9, 169
	add	r9, r5, r9
	b	.L1729
.L1723:
	cmp	r0, #2
	beq	.L1767
	sub	r0, r0, #4
	cmp	r0, #1
	bls	.L1768
.L1726:
	ldr	r3, [r4, #1124]
	add	r8, r8, #1
	add	r3, r3, #2
	cmp	r3, r8
	bls	.L1769
.L1729:
	ldr	r1, .L1773+4
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r7, r0
	str	r0, [r9, #4]!
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bcc	.L1719
	cmp	r3, #0
	bne	.L1719
	cmp	r0, #3
	beq	.L1722
	cmp	r0, #1
	bhi	.L1723
	ldr	r1, .L1773+8
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r6, r0
	str	r0, [r9, #264]
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bls	.L1725
	cmp	r3, #0
	beq	.L1726
.L1725:
	mov	r2, r0
	ldr	r1, .L1773+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1722:
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1765
	ldr	r1, .L1773+16
	mov	r0, r5
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	beq	.L1765
	ldr	r3, [r4, #1128]
	cmn	r3, #2
	beq	.L1765
	movw	r9, #41104
	mov	r8, #0
	movt	r9, 169
	add	r9, r5, r9
	b	.L1745
.L1744:
	add	r8, r8, #1
	cmp	r8, r3
	bcs	.L1765
.L1745:
	ldr	r1, .L1773+20
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r7, r0
	str	r0, [r9, #4]!
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bcc	.L1736
	cmp	r3, #0
	bne	.L1736
	cmp	r0, #3
	beq	.L1732
	cmp	r0, #1
	bls	.L1770
	cmp	r0, #2
	beq	.L1771
	sub	r0, r0, #4
	cmp	r0, #1
	bls	.L1772
	ldr	r3, [r4, #1128]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1744
.L1746:
	ldr	r1, .L1773+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1770:
	ldr	r1, .L1773+28
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r6, r0
	str	r0, [r9, #264]
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bls	.L1740
	cmp	r3, #0
	bne	.L1740
.L1741:
	ldr	r3, [r4, #1128]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1744
	ldr	r2, [r9]
	cmp	r2, #3
	beq	.L1744
	b	.L1746
.L1767:
	ldr	r1, .L1773+32
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #528]
	b	.L1726
.L1771:
	ldr	r1, .L1773+36
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #524]
	b	.L1741
.L1768:
	ldr	r1, .L1773+40
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #784]
	b	.L1726
.L1772:
	ldr	r1, .L1773+44
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #784]
	b	.L1741
.L1719:
	mov	r2, r0
	ldr	r1, .L1773+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1736:
	mov	r2, r0
	ldr	r1, .L1773+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1769:
	cmp	r8, r3
	bne	.L1722
.L1717:
	movw	r2, #26626
	movt	r2, 42
	add	r2, r3, r2
	add	r2, r5, r2, lsl #2
	ldr	r3, [r2, #8]
	cmp	r3, #3
	beq	.L1722
	ldr	r1, .L1773+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1740:
	mov	r2, r0
	ldr	r1, .L1773+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1748:
	mov	r3, #0
	b	.L1717
.L1774:
	.align	2
.L1773:
	.word	.LC55
	.word	.LC56
	.word	.LC58
	.word	.LC59
	.word	.LC63
	.word	.LC64
	.word	.LC70
	.word	.LC66
	.word	.LC60
	.word	.LC68
	.word	.LC61
	.word	.LC69
	.word	.LC57
	.word	.LC65
	.word	.LC62
	.word	.LC67
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
	ldr	r1, .L1805
	add	r6, r0, #11075584
	ldr	r7, [r0, #240]
	mov	r5, r0
	str	r3, [fp, #-48]
	bl	mvc_ue_v
	add	r6, r6, #40960
	mov	r4, #1
	str	r0, [r6, #1132]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #748]
	cmp	r9, #0
	bne	.L1799
.L1776:
	cmp	r0, #7
	bhi	.L1779
	ldr	r3, [r6, #1136]
	cmp	r3, #7
	bhi	.L1779
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
	cmp	r2, #0
	movweq	r10, #42228
	moveq	r4, r2
	movteq	r10, 169
	addeq	r10, r5, r10
	beq	.L1787
	b	.L1778
.L1783:
	ldr	r2, [r7, #748]
	cmp	r2, #0
	bne	.L1800
.L1784:
	str	r2, [r10]
	str	r2, [r10, #768]
	str	r2, [r10, #128]
	str	r2, [r10, #896]
.L1786:
	ldr	r2, [r6, #1124]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r2, r4
	bcc	.L1801
.L1787:
	ldr	r1, .L1805+4
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1783
	ldr	r1, .L1805+8
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r10, #640]
	ldr	r2, [r7, #748]
	cmp	r2, #0
	beq	.L1784
.L1800:
	ldr	r1, .L1805+16
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1802
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1786
.L1801:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1788
.L1789:
	ldrb	r0, [r5, #10]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1781:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1802:
	ldr	r1, .L1805+20
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+24
	str	r0, [r10]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r10, #896]
	b	.L1786
.L1799:
	ldr	r1, .L1805+28
	mov	r0, r5
	bl	mvc_ue_v
	mov	r3, r0
	ldr	r0, [r6, #1132]
	mov	r9, r4, asl r3
	str	r3, [r6, #1136]
	b	.L1776
.L1788:
	ldrb	r3, [r6, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1789
	movw	r4, #42612
	mov	r10, #0
	movt	r4, 169
	add	r4, r5, r4
	b	.L1795
.L1791:
	ldr	r3, [r7, #748]
	cmp	r3, #0
	bne	.L1803
.L1792:
	str	r3, [r4]
	str	r3, [r4, #768]
	str	r3, [r4, #128]
	str	r3, [r4, #896]
.L1794:
	ldr	r3, [r6, #1128]
	add	r10, r10, #1
	add	r4, r4, #4
	cmp	r3, r10
	bcc	.L1789
.L1795:
	ldr	r1, .L1805+32
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	streq	r8, [r4, #-128]
	streq	r0, [r4, #640]
	beq	.L1791
	ldr	r1, .L1805+36
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+40
	str	r0, [r4, #-128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r4, #640]
	ldr	r3, [r7, #748]
	cmp	r3, #0
	beq	.L1792
.L1803:
	ldr	r1, .L1805+44
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1804
	str	r9, [r4]
	str	r0, [r4, #768]
	str	r9, [r4, #128]
	str	r0, [r4, #896]
	b	.L1794
.L1779:
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
.L1778:
	ldr	r1, .L1805+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1781
.L1804:
	ldr	r1, .L1805+52
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+56
	str	r0, [r4]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+52
	str	r0, [r4, #768]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1805+56
	str	r0, [r4, #128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r4, #896]
	b	.L1794
.L1806:
	.align	2
.L1805:
	.word	.LC71
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC72
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC73
	.word	.LC84
	.word	.LC85
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
	beq	.L1819
	mov	r9, #0
	b	.L1810
.L1841:
	ldr	r1, .L1847
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r5, #2
	beq	.L1839
.L1821:
	cmp	r5, #6
	orreq	r6, r6, #1
	cmp	r6, #0
	bne	.L1824
	cmp	r5, #4
	beq	.L1840
.L1825:
	cmp	r5, #6
	bhi	.L1817
.L1822:
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1817
	cmp	r5, #0
	beq	.L1827
.L1826:
	subs	r7, r7, #1
	beq	.L1828
.L1819:
	ldr	r1, .L1847+4
	mov	r0, r4
	bl	mvc_ue_v
	bic	r3, r0, #2
	sub	r6, r0, #3
	clz	r6, r6
	cmp	r3, #1
	mov	r5, r0
	mov	r6, r6, lsr #5
	beq	.L1841
	cmp	r5, #2
	bne	.L1821
.L1839:
	ldr	r1, .L1847+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r6, #0
	beq	.L1822
.L1824:
	ldr	r1, .L1847+12
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r5, #4
	bne	.L1825
.L1840:
	ldr	r1, .L1847+16
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1826
.L1817:
	ldr	r1, .L1847+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1846:
	ldr	r1, .L1847
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r8, #4]
	cmp	r3, #2
	str	r0, [r8, #8]
	beq	.L1842
.L1813:
	cmp	r3, #3
	cmpne	r3, #6
	beq	.L1843
.L1814:
	cmp	r3, #4
	beq	.L1844
.L1815:
	cmp	r3, #6
	bhi	.L1817
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1817
	cmp	r3, #0
	add	r9, r9, #1
	beq	.L1827
	cmp	r9, #100
	beq	.L1845
.L1810:
	ldr	r1, .L1847+4
	mov	r0, r4
	ldrb	r5, [r4, #3]	@ zero_extendqisi2
	bl	mvc_ue_v
	mov	r6, r9, asl #2
	mov	r7, r9, asl #4
	add	r1, r6, r7
	movw	r2, #2004
	movw	r8, #43728
	mla	r2, r2, r5, r1
	movt	r8, 169
	add	r2, r4, r2
	add	r8, r2, r8
	mov	r3, r0
	bic	r0, r0, #2
	cmp	r0, #1
	str	r3, [r8, #4]
	beq	.L1846
	cmp	r3, #2
	bne	.L1813
.L1842:
	ldr	r1, .L1847+8
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r6, r7
	movw	r2, #2004
	movw	r1, #43736
	mla	r3, r2, r5, r3
	movw	r2, #43728
	movt	r1, 169
	movt	r2, 169
	add	r3, r4, r3
	add	r1, r3, r1
	add	r2, r3, r2
	str	r0, [r1, #4]
	ldr	r3, [r2, #4]
	cmp	r3, #3
	cmpne	r3, #6
	bne	.L1814
.L1843:
	ldr	r1, .L1847+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r6, r7
	movw	r2, #2004
	movw	r1, #43736
	mla	r3, r2, r5, r3
	movw	r2, #43728
	movt	r1, 169
	movt	r2, 169
	add	r3, r4, r3
	add	r1, r3, r1
	add	r2, r3, r2
	str	r0, [r1, #8]
	ldr	r3, [r2, #4]
	cmp	r3, #4
	bne	.L1815
.L1844:
	ldr	r1, .L1847+16
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, r7
	movw	r7, #2004
	movw	r2, #43744
	mla	r5, r7, r5, r6
	movw	r3, #43728
	movt	r2, 169
	movt	r3, 169
	add	r5, r4, r5
	add	r2, r5, r2
	add	r3, r5, r3
	str	r0, [r2, #4]
	ldr	r3, [r3, #4]
	b	.L1815
.L1827:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1845:
	ldr	r1, .L1847+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1828:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1848:
	.align	2
.L1847:
	.word	.LC88
	.word	.LC87
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC86
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
	ldrb	r7, [r0, #3]	@ zero_extendqisi2
	ldrb	r8, [r3, #1069]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L1850
	clz	r2, r7
	mov	r2, r2, lsr #5
	strb	r2, [r0, #3]
	mov	r6, r2
.L1859:
	ldrb	r3, [r3, #1067]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1870
	ldr	r1, .L1874
	mov	r0, r4
	bl	mvc_u_1
	movw	r2, #2004
	mla	r6, r2, r6, r4
	movw	r5, #43728
	movt	r5, 169
	ldr	r1, .L1874+4
	add	r5, r6, r5
	mov	r3, r0
	uxtb	r2, r0
	strb	r3, [r5, #3]
	mov	r0, #16
	bl	dprint_vfmw
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1853
.L1857:
	mov	r8, #0
.L1867:
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1850:
	movw	r2, #2004
	movw	r1, #43728
	mla	r2, r2, r7, r0
	movt	r1, 169
	movw	r5, #43728
	mov	r6, r7
	movt	r5, 169
	add	r5, r2, r5
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1859
	ldrb	r3, [r3, #1067]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1871
	ldr	r1, .L1874
	ldrb	r6, [r5, #3]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r6, r0
	bne	.L1872
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1857
	mov	r1, r8
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_DecMMCO
.L1853:
	mov	r1, #1
	mov	r0, r4
	bl	MVC_DecMMCO
	cmn	r0, #1
	mov	r8, r0
	movne	r3, #1
	movne	r8, #0
	strneb	r3, [r5]
	bne	.L1867
	mov	r3, #0
	ldr	r1, .L1874+8
	strb	r3, [r5]
	mov	r0, #1
	strb	r7, [r4, #3]
	bl	dprint_vfmw
	b	.L1867
.L1871:
	ldr	r1, .L1874+12
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r6, r0
	bne	.L1873
	mov	r0, r4
	ldr	r1, .L1874+16
	ldrb	r4, [r5, #2]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r4, r0
	beq	.L1857
	ldr	r1, .L1874+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1867
.L1870:
	ldr	r1, .L1874+12
	mov	r0, r4
	bl	mvc_u_1
	movw	r2, #2004
	mla	r2, r2, r6, r4
	movw	r5, #43728
	movt	r5, 169
	ldr	r1, .L1874+16
	mov	r8, #0
	add	r5, r2, r5
	strb	r0, [r5, #1]
	mov	r0, r4
	bl	mvc_u_1
	ldrb	r2, [r5, #1]	@ zero_extendqisi2
	ldr	r1, .L1874+24
	strb	r0, [r5, #2]
	mov	r0, #16
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1872:
	ldr	r1, .L1874+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	ip, [r4, #68]
	ldr	r3, [r4, #100]
	mov	r0, #1
	ldr	r2, [r4, #88]
	mvn	r8, #0
	ldr	r1, .L1874+32
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1867
.L1873:
	ldr	r1, .L1874+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1867
.L1875:
	.align	2
.L1874:
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC93
	.word	.LC94
	.word	.LC100
	.word	.LC95
	.word	.LC101
	.word	.LC102
	.word	.LC99
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
	ldr	r1, .L1941
	mov	r4, r0
	bl	mvc_ue_v
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r6, r0
	bhi	.L1877
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1877
	mov	r1, r0
	mov	r0, r4
	bl	MVC_PPSSPSCheckTmpId
	cmp	r0, #0
	bne	.L1932
	add	r7, r4, #11075584
	mov	r0, r4
	add	r5, r7, #40960
	str	r6, [r5, #1080]
	bl	MVC_PPSSPSCheck
	subs	r8, r0, #0
	bne	.L1933
	ldr	r6, [r4, #240]
	mov	r0, r4
	ldr	r2, .L1941+4
	ldr	r9, [r4, #244]
	ldr	r1, [r6, #2896]
	add	r1, r1, #4
	bl	mvc_u_v
	str	r0, [r5, #1092]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1930
	adds	r0, r0, #0
	ldrb	r3, [r5, #1067]	@ zero_extendqisi2
	movne	r0, #1
	cmp	r3, #5
	movne	r0, #0
	cmp	r0, #0
	bne	.L1934
.L1883:
	mov	r3, #0
	strb	r3, [r5, #1065]
	strb	r3, [r5, #1066]
	ldrb	r3, [r6, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1935
	ldr	r2, [r6, #3948]
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1906:
	ldrb	r2, [r6, #21]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1889
	strb	r2, [r5, #1068]
.L1891:
	ldr	r2, [r5, #1120]
	cmp	r2, r3
	bcs	.L1936
.L1892:
	ldrb	r3, [r5, #1067]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1937
.L1894:
	add	r10, r7, #36864
	mov	r3, #0
	str	r3, [r10, #4028]
	str	r3, [r10, #4032]
	ldr	r3, [r6, #2900]
	cmp	r3, #0
	beq	.L1938
.L1898:
	mov	r3, #0
	str	r3, [r10, #4064]
	str	r3, [r10, #4068]
	ldr	r3, [r6, #2900]
	cmp	r3, #1
	beq	.L1939
.L1901:
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1930
	ldrb	r3, [r9, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1904
	ldr	r1, .L1941+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L1905
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1904
.L1905:
	ldr	r1, .L1941+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L1941+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L1930
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #102
	blx	r5
.L1930:
	mvn	r8, #0
.L1916:
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1935:
	ldr	r1, .L1941+20
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #1065]
	cmp	r0, #0
	bne	.L1940
	ldr	r2, [r6, #3948]
	ldrb	ip, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1908
	mov	r3, r3, asl #1
	b	.L1906
.L1889:
	mov	r2, #1
	strb	r2, [r5, #1068]
.L1909:
	ldr	r2, [r5, #1120]
	cmp	r2, r3, lsr #1
	bcc	.L1892
	ldr	r1, .L1941+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1916
.L1940:
	ldr	r1, .L1941+28
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #1066]
	ldr	r2, [r6, #3948]
	ldrb	r0, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	cmp	r0, #0
	ldrb	r0, [r5, #1065]	@ zero_extendqisi2
	mla	r3, r1, r3, r3
	moveq	r2, #2
	beq	.L1887
.L1908:
	mov	r2, #1
.L1887:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1906
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r5, #1068]
	bne	.L1891
	b	.L1909
.L1904:
	mov	r0, r4
	add	r7, r7, #40960
	bl	MVC_IsNewPic
	uxtb	r0, r0
	strb	r0, [r7, #1069]
	cmp	r0, #0
	bne	.L1916
	ldr	r2, [r7, #1120]
	ldr	r3, [r7, #2760]
	cmp	r2, r3
	bhi	.L1916
	ldr	r1, .L1941+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1916
.L1938:
	ldr	r1, [r6, #2904]
	mov	r0, r4
	ldr	r2, .L1941+36
	add	r1, r1, #4
	bl	mvc_u_v
	str	r0, [r10, #4028]
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1898
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1898
	ldr	r1, .L1941+40
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r10, #4032]
	b	.L1898
.L1939:
	ldrb	r3, [r6, #18]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1901
	ldr	r1, .L1941+44
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r10, #4064]
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1901
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1901
	ldr	r1, .L1941+48
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r10, #4068]
	b	.L1901
.L1877:
	mov	r2, r6
	ldr	r1, .L1941+52
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1937:
	ldr	r1, .L1941+56
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #65536
	str	r0, [r5, #1108]
	bcs	.L1895
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1894
.L1895:
	ldr	r1, .L1941+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1894
.L1932:
	ldr	r1, .L1941+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1916
.L1933:
	ldr	r1, .L1941+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1916
.L1934:
	ldr	r3, [r5, #2704]
	cmp	r3, #0
	bgt	.L1883
	ldr	r1, .L1941+72
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1883
.L1936:
	ldr	r1, .L1941+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1916
.L1942:
	.align	2
.L1941:
	.word	.LC103
	.word	.LC107
	.word	.LC119
	.word	.LC120
	.word	g_event_report
	.word	.LC109
	.word	.LC111
	.word	.LC110
	.word	.LC121
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC104
	.word	.LC113
	.word	.LC114
	.word	.LC105
	.word	.LC106
	.word	.LC108
	.word	.LC112
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
	ldr	r3, [r0, #40]
	add	r4, r4, #40960
	mov	r5, r0
	sub	r3, r3, #1
	ldr	r6, [r0, #244]
	ldr	r2, [r4, #1080]
	cmp	r3, r2
	bcc	.L1944
	ldrb	r7, [r0, #10]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L1944
	bl	MVC_PPSSPSCheck
	cmp	r0, #0
	bne	.L2026
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2027
.L1948:
	ldr	r2, [r6, #36]
	cmp	r3, #1
	str	r2, [r4, #1124]
	ldr	r2, [r6, #40]
	str	r2, [r4, #1128]
	bls	.L2028
	cmp	r3, #2
	beq	.L1975
.L1959:
	mov	r3, #32
	str	r3, [r4, #1128]
.L1960:
	mov	r0, r5
	bl	mvc_ref_pic_list_reordering
	subs	r8, r0, #0
	bne	.L2029
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1962
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #1
	moveq	r2, r7
	beq	.L1963
.L1962:
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L2030
.L1979:
	mov	r2, #0
.L1963:
	strb	r7, [r4, #1071]
	mov	r0, #19
	ldr	r1, .L2036
	bl	dprint_vfmw
	ldrb	r2, [r4, #1071]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #1132]
	cmp	r2, r3
	str	r3, [r4, #1136]
	bne	.L2031
.L1964:
	ldrb	r3, [r4, #1072]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2032
.L1965:
	mov	r3, #0
	str	r3, [r4, #2676]
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1966
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L2033
.L1966:
	ldr	r1, .L2036+4
	mov	r0, r5
	bl	mvc_se_v
	mov	r3, #0
	str	r3, [r4, #2684]
	str	r3, [r4, #2688]
	str	r3, [r4, #2692]
	str	r0, [r4, #2680]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2034
.L1995:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1975:
	mov	r3, #32
	str	r3, [r4, #1124]
	b	.L1959
.L2034:
	ldr	r1, .L2036+8
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r4, #2684]
	bhi	.L1969
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1969
	cmp	r0, #1
	beq	.L1995
	ldr	r1, .L2036+12
	mov	r0, r5
	bl	mvc_se_v
	add	r3, r0, #6
	str	r0, [r4, #2688]
	cmp	r3, #12
	bhi	.L1972
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1972
	ldr	r1, .L2036+16
	mov	r0, r5
	bl	mvc_se_v
	add	r3, r0, #6
	str	r0, [r4, #2692]
	cmp	r3, #12
	bhi	.L1974
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1995
.L1974:
	ldr	r1, .L2036+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L2031:
	mov	r0, r5
	bl	mvc_pred_weight_table
	cmp	r0, #0
	beq	.L1964
	ldr	r1, .L2036+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L2032:
	mov	r0, r5
	bl	mvc_dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1965
	ldr	r1, .L2036+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L2030:
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r7, r3
	moveq	r2, r7
	bne	.L1979
	b	.L1963
.L2027:
	ldr	r1, .L2036+32
	mov	r0, r5
	bl	mvc_u_1
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	strb	r0, [r4, #1070]
	b	.L1948
.L2028:
	ldr	r1, .L2036+36
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1950
	ldr	r3, [r4, #1124]
.L1951:
	ldrb	r2, [r4, #1065]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1952
	cmp	r3, #15
	bhi	.L1953
	ldr	r3, [r4, #1128]
	cmp	r3, #15
	bhi	.L2035
.L1954:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1953
.L1955:
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1975
	cmp	r3, #1
	bne	.L1959
	b	.L1960
.L1944:
	ldr	r1, .L2036+40
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2033:
	ldr	r1, .L2036+44
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r4, #2676]
	bhi	.L1967
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1966
.L1967:
	ldr	r1, .L2036+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L1952:
	cmp	r3, #31
	bhi	.L1956
	ldr	r3, [r4, #1128]
	cmp	r3, #31
	bls	.L1957
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1957
.L1956:
	ldr	r1, .L2036+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L1957:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1955
	b	.L1956
.L2035:
	ldrb	r3, [r4, #1064]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1954
.L1953:
	ldr	r1, .L2036+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L1950:
	ldr	r1, .L2036+60
	mov	r0, r5
	bl	mvc_ue_v
	ldrb	r2, [r4, #1064]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #1124]
	bne	.L1951
	ldr	r1, .L2036+64
	mov	r0, r5
	bl	mvc_ue_v
	ldr	r3, [r4, #1124]
	str	r0, [r4, #1128]
	b	.L1951
.L1972:
	ldr	r1, .L2036+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L1969:
	ldr	r1, .L2036+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L2026:
	ldr	r1, .L2036+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L2029:
	ldr	r1, .L2036+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1995
.L2037:
	.align	2
.L2036:
	.word	.LC129
	.word	.LC134
	.word	.LC135
	.word	.LC137
	.word	.LC139
	.word	.LC140
	.word	.LC130
	.word	.LC131
	.word	.LC122
	.word	.LC123
	.word	.LC104
	.word	.LC132
	.word	.LC133
	.word	.LC127
	.word	.LC126
	.word	.LC124
	.word	.LC125
	.word	.LC138
	.word	.LC136
	.word	.LC105
	.word	.LC128
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
	ldrb	r1, [r3, #1065]	@ zero_extendqisi2
	ldr	lr, [r3, #1080]
	cmp	r1, #0
	ldr	r5, [r3, #1120]
	str	lr, [r3, #2732]
	ldr	r4, [ip, #744]
	strb	r1, [r3, #2720]
	ldrneb	r1, [r3, #1066]	@ zero_extendqisi2
	ldr	lr, [r3, #1092]
	str	r5, [r3, #2760]
	strneb	r1, [r3, #2721]
	ldrb	r1, [r3, #1067]	@ zero_extendqisi2
	str	lr, [r3, #2736]
	cmp	r1, #5
	ldrb	lr, [r3, #1072]	@ zero_extendqisi2
	strb	r1, [r3, #2722]
	ldreq	r1, [r3, #1108]
	str	r4, [r3, #2728]
	strb	lr, [r3, #2723]
	streq	r1, [r3, #2740]
	ldr	r1, [ip, #2900]
	cmp	r1, #0
	bne	.L2041
	add	r1, r2, #36864
	ldr	lr, [r1, #4028]
	str	lr, [r3, #2744]
	ldr	r1, [r1, #4032]
	str	r1, [r3, #2748]
	ldr	r1, [ip, #2900]
.L2041:
	cmp	r1, #1
	addeq	r2, r2, #36864
	ldreq	r1, [r2, #4064]
	streq	r1, [r3, #2752]
	ldreq	r2, [r2, #4068]
	streq	r2, [r3, #2756]
	ldrb	r2, [r3, #1075]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L2043
	ldr	ip, [r3, #2704]
	ldrb	r1, [r3, #1073]	@ zero_extendqisi2
	ldrb	r2, [r3, #1074]	@ zero_extendqisi2
	str	ip, [r3, #2764]
	strb	r1, [r3, #2724]
	strb	r2, [r3, #2725]
.L2043:
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
	ldrb	r2, [r3, #1064]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2049
	bcc	.L2050
	cmp	r2, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r3, #1067]	@ zero_extendqisi2
	add	r0, r0, #11141120
	cmp	r3, #5
	beq	.L2059
.L2052:
	add	r0, r0, #12288
	mov	r3, #0
	strb	r3, [r0, #3493]
	ldmfd	sp, {fp, sp, pc}
.L2050:
	add	r0, r0, #11141120
	add	r3, r0, #12288
	ldrb	r2, [r3, #3492]	@ zero_extendqisi2
	cmp	r2, #2
	movne	r2, #1
	strneb	r2, [r3, #3492]
	b	.L2052
.L2049:
	add	r0, r0, #11141120
	mov	r2, #2
	add	r0, r0, #12288
	mov	r3, #0
	strb	r2, [r0, #3492]
	strb	r3, [r0, #3493]
	ldmfd	sp, {fp, sp, pc}
.L2059:
	add	r0, r0, #12288
	mov	r3, #1
	strb	r3, [r0, #3493]
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r3, r0, #11075584
	add	r3, r3, #36864
	mov	r4, r0
	ldrb	r3, [r3, #1784]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2061
	ldr	r2, [r0, #232]
	ldr	r3, [r2, #64]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #64]
	ldr	r2, [r0, #232]
	ldr	r3, [r2, #72]
	sub	r3, r3, #1
	str	r3, [r2, #72]
.L2061:
	ldr	r0, [r4, #232]
	ldrb	r6, [r0]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L2072
	mov	r3, #0
	mov	r2, r0
	mov	r5, r3
.L2063:
	add	r3, r3, #1
	ldr	r1, [r2, #12]
	cmp	r3, r6
	add	r2, r2, #28
	add	r5, r5, r1
	bne	.L2063
.L2062:
	mov	r7, r6, asl #5
	ldr	ip, [r0, #72]
	sub	r7, r7, r6, asl #2
	ldr	r2, [r0, #64]
	add	r1, r0, r7
	mov	r3, r5
	str	ip, [sp, #4]
	mov	r0, #7
	ldr	ip, [r1, #12]
	ldr	r1, .L2083
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	mov	r2, r6
	mov	r0, #7
	ldr	r1, .L2083+4
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #64]
	mov	lr, r6, asl #5
	and	ip, ip, r0
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	str	ip, [r3, #24]
	ldr	r3, [r4, #232]
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	r8, [r3, #64]
	mov	lr, r6, asl #5
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	ldr	ip, [r3, #16]
	add	ip, ip, r8, lsr #3
	rsb	ip, r5, ip
	str	ip, [r3, #28]
	ldr	ip, [r4, #232]
	ldrb	r6, [ip]	@ zero_extendqisi2
	ldr	lr, [ip, #64]
	mov	r3, r6, asl #5
	sub	r3, r3, r6, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #12]
	add	r3, r5, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [ip, #20]
	ldr	ip, [r4, #232]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	ldr	lr, [r3, #24]
	and	ip, ip, #3
	add	ip, lr, ip, lsl #3
	str	ip, [r3, #24]
	ldr	ip, [r4, #232]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	bic	ip, ip, #3
	str	ip, [r3, #28]
	ldr	ip, [r4, #232]
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
	ldr	ip, [r4, #232]
	ldr	r2, [ip, #68]
	sub	r3, r2, #1
	cmp	r3, #1
	bhi	.L2082
	ldrb	r5, [ip]	@ zero_extendqisi2
	add	r1, r5, #1
	cmp	r2, r1
	movhi	r2, #1
	movls	r2, #0
	cmp	r1, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L2065
	add	r5, r5, #2
	mov	r6, #0
.L2066:
	sub	r3, r5, #1
	ldr	r1, .L2083+8
	mov	r0, #7
	mov	lr, r3, asl #5
	mov	r2, r3
	sub	r3, lr, r3, asl #2
	add	ip, ip, r3
	str	r6, [ip, #24]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #16]
	str	lr, [ip, #28]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #12]
	mov	lr, lr, asl #3
	str	lr, [ip, #20]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	ldr	r7, [ip, #24]
	and	lr, lr, #3
	add	lr, r7, lr, lsl #3
	str	lr, [ip, #24]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	bic	lr, lr, #3
	str	lr, [ip, #28]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	r3, [ip, #24]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r4, #232]
	ldr	r3, [ip, #68]
	cmp	r5, #1
	cmpls	r5, r3
	add	r5, r5, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L2066
	sub	r3, r3, #1
.L2065:
	mov	r2, r3, asl #5
	ldr	r1, [ip, #72]
	sub	r3, r2, r3, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #20]
	rsb	r3, r1, r3
	str	r3, [ip, #20]
	ldr	lr, [r4, #232]
	ldrb	r1, [lr]	@ zero_extendqisi2
	ldr	ip, [lr, #68]
	cmp	r1, ip
	bcs	.L2060
	sxth	r3, r1
	add	r4, r4, #11141120
	add	r4, r4, #16384
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L2070:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	ldr	r0, [r4, #112]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #112]
	ldrcc	ip, [lr, #68]
	cmp	ip, r1
	bhi	.L2070
.L2060:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2082:
	ldr	r1, .L2083+12
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L2072:
	mov	r5, r6
	b	.L2062
.L2084:
	.align	2
.L2083:
	.word	.LC141
	.word	.LC142
	.word	.LC144
	.word	.LC143
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
	subs	r9, r3, #0
	str	r0, [fp, #-48]
	mov	r8, r1
	ble	.L2094
	mov	r7, #8
	mov	r3, r9
	mov	r6, r7
	mov	r5, #0
	mov	r4, r7
	mov	r9, r2
	mov	r10, r3
	b	.L2093
.L2090:
	mov	r0, r7, lsr #2
	and	lr, r7, #3
	str	r6, [r8, r7, asl #2]
	mov	r3, #255
	ldr	r1, [r9, r0, asl #2]
	mov	lr, lr, asl #3
	uxtb	ip, r6
	cmp	r5, r10
	bic	r1, r1, r3, asl lr
	orr	r3, r1, ip, asl lr
	str	r3, [r9, r0, asl #2]
	beq	.L2094
.L2093:
	cmp	r10, #16
	ldreq	r3, .L2102
	ldrne	r3, .L2102+4
	cmp	r4, #0
	ldrb	r7, [r5, r3]	@ zero_extendqisi2
	add	r5, r5, #1
	beq	.L2090
	ldr	r1, .L2102+8
	ldr	r0, [fp, #-48]
	bl	mvc_se_v
	mov	r1, r0
	mov	r0, r6
	add	r4, r6, r1
	bl	check_signed_integer_operation_overflow
	mov	r1, #256
	cmp	r0, #0
	mov	r0, r4
	bne	.L2100
	bl	check_signed_integer_operation_overflow
	cmp	r0, #0
	bne	.L2101
	ands	r4, r4, #255
	ldr	r3, [fp, #4]
	moveq	r1, #1
	movne	r1, #0
	cmp	r1, #0
	moveq	r6, r4
	cmp	r7, #0
	movne	r1, #0
	andeq	r1, r1, #1
	str	r1, [r3]
	b	.L2090
.L2094:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2100:
	movw	r3, #9581
.L2099:
	ldr	r2, .L2102+12
	mov	r0, #1
	ldr	r1, .L2102+16
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2101:
	movw	r3, #9587
	b	.L2099
.L2103:
	.align	2
.L2102:
	.word	.LANCHOR0
	.word	.LANCHOR0+16
	.word	.LC145
	.word	.LANCHOR0+100
	.word	.LC146
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
	ldr	r1, .L2164
	mov	r4, r0
	bl	mvc_u_1
	strb	r0, [r5]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2155
	ldr	r1, .L2164+4
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #1]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2155
	ldr	r1, .L2164+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	str	r0, [r5, #32]
	bne	.L2108
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2109
.L2108:
	ldr	r1, .L2164+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2164+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2155
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #102
	blx	r5
	mvn	r0, #0
.L2106:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2161:
	add	r8, r5, #2112
	sub	r7, fp, #76
	add	r10, r5, #448
	add	r9, r5, #11
	mov	r6, #0
.L2136:
	ldr	r3, [r5, #60]
	cmp	r3, #1
	movne	r3, #0
	strne	r3, [r7]
	strneb	r3, [r9]
	beq	.L2156
.L2130:
	ldr	r2, [r4, #248]
	movw	r1, #3992
	ldr	r3, [r5, #28]
	mla	r3, r1, r3, r2
	ldrb	r2, [r3, #27]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2157
.L2134:
	ldr	r1, .L2164+20
	mov	r2, #64
	ldr	r3, .L2164+24
	cmp	r6, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r8
	blx	r3
.L2132:
	add	r6, r6, #1
	add	r8, r8, #64
	cmp	r6, #2
	add	r7, r7, #4
	add	r10, r10, #256
	add	r9, r9, #1
	bne	.L2136
.L2137:
	ldr	r1, .L2164+28
	mov	r0, r4
	bl	mvc_se_v
	add	r3, r0, #12
	str	r0, [r5, #56]
	cmp	r3, #24
	bhi	.L2118
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2138
.L2118:
	ldr	r1, .L2164+32
	mov	r0, #1
	bl	dprint_vfmw
.L2155:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2109:
	ldr	r1, .L2164+36
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #31
	str	r0, [r5, #36]
	bhi	.L2110
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2110
	ldr	r1, .L2164+40
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #31
	str	r0, [r5, #40]
	bhi	.L2112
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2112
	ldr	r1, .L2164+44
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #2]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2155
	ldr	r2, .L2164+48
	mov	r1, #2
	mov	r0, r4
	bl	mvc_u_v
	cmp	r0, #2
	str	r0, [r5, #44]
	bhi	.L2158
	ldr	r1, .L2164+52
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2164+56
	str	r0, [r5, #48]
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2164+60
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2164+64
	str	r0, [r5, #52]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2164+68
	strb	r0, [r5, #3]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2164+72
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #17]
	cmp	r0, #0
	bne	.L2159
.L2115:
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
	bcs	.L2116
.L2138:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2116:
	ldr	r1, .L2164+76
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2164+80
	str	r0, [r5, #60]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #18]
	cmp	r0, #1
	bne	.L2137
	sub	r8, fp, #72
	add	r10, r5, #4
	add	r7, r5, #2016
	add	r9, r5, #64
	b	.L2127
.L2163:
	ldr	r3, [r4, #248]
	ldr	ip, [r5, #28]
	mla	ip, lr, ip, r3
	ldrb	r3, [ip, #27]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2160
	ldr	r3, .L2164+84
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2164+24
	ldr	r3, [r3, #52]
	blx	r3
.L2122:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2161
.L2127:
	ldr	r1, .L2164+88
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
	beq	.L2162
	cmp	r6, #0
	cmpne	r6, #3
	mov	r1, r1, lsr #5
	beq	.L2163
	ldr	r3, .L2164+24
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2122
.L2159:
	ldr	r1, .L2164+92
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2115
.L2110:
	ldr	r1, .L2164+96
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2106
.L2162:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	cmp	r0, #0
	bne	.L2131
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2122
	ldr	r1, .L2164+84
	mov	r2, #16
	ldr	r3, .L2164+24
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2122
.L2112:
	ldr	r1, .L2164+100
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2106
.L2160:
	ldr	r3, .L2164+24
	add	r1, r6, #167
	mov	r2, #16
	mov	r0, r7
	add	r1, ip, r1, lsl #4
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2122
.L2156:
	ldr	r1, .L2164+104
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #1
	str	r0, [r7]
	strb	r0, [r9]
	bne	.L2130
	str	r7, [sp]
	mov	r3, #64
	mov	r2, r8
	mov	r1, r10
	mov	r0, r4
	bl	MVC_Scaling_List
	cmp	r0, #0
	bne	.L2131
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2132
	b	.L2134
.L2157:
	add	r1, r3, r6, lsl #6
	ldr	r3, .L2164+24
	add	r1, r1, #2768
	mov	r2, #64
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2132
.L2158:
	ldr	r1, .L2164+108
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2106
.L2131:
	ldr	r1, .L2164+112
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2106
.L2165:
	.align	2
.L2164:
	.word	.LC147
	.word	.LC148
	.word	.LC149
	.word	.LC150
	.word	g_event_report
	.word	.LANCHOR1+32
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC167
	.word	.LC171
	.word	.LC151
	.word	.LC153
	.word	.LC155
	.word	.LC156
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC165
	.word	.LC166
	.word	.LANCHOR1
	.word	.LC168
	.word	.LC164
	.word	.LC152
	.word	.LC154
	.word	.LC170
	.word	.LC157
	.word	.LC169
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	subs	r7, r0, #0
	beq	.L2193
	cmp	r1, #0
	beq	.L2194
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
	beq	.L2170
	mov	ip, ip, asl #1
	adds	r2, ip, #6
	str	r2, [fp, #-60]
	beq	.L2170
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
.L2175:
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
	beq	.L2192
	ldr	r1, [r9]
	ldr	r0, [r8]
	cmp	r1, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r6, #5
	bhi	.L2172
	cmp	r1, #0
	add	r7, ip, #64
	bne	.L2171
	add	r0, ip, #128
	mov	r1, r7
	mov	ip, r5
.L2173:
	ldr	r4, [r1], #4
	ldr	lr, [ip], #4
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r1, r0
	bne	.L2173
.L2171:
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
	bne	.L2175
	ldr	r7, [fp, #-64]
	ldr	r1, [fp, #-68]
.L2170:
	ldr	r0, [r7, #56]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L2168:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2172:
	cmp	r1, #0
	bne	.L2192
	ldr	r1, [fp, #-48]
	mov	lr, r10
.L2174:
	ldr	r4, [r1, #4]!
	ldr	r0, [lr, #4]!
	cmp	r4, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r1
	bne	.L2174
.L2192:
	add	r7, ip, #64
	b	.L2171
.L2194:
	mov	r0, r1
	movw	r3, #9902
	ldr	r2, .L2195
	ldr	r1, .L2195+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2168
.L2193:
	movw	r3, #9901
	ldr	r2, .L2195
	ldr	r1, .L2195+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2168
.L2196:
	.align	2
.L2195:
	.word	.LC13
	.word	.LC14
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
	ldr	r1, .L2212
	mov	r4, r0
	bl	mvc_ue_v
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r5, r0
	bls	.L2198
	mov	r2, r0
	ldr	r1, .L2212+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #40]
	sub	r3, r2, #1
	cmp	r5, r3
	bls	.L2205
	ldr	r3, .L2212+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L2205
	str	r2, [fp, #-40]
	mov	r3, #8
	str	r5, [fp, #-44]
	sub	r2, fp, #44
	ldr	r0, [r4, #120]
	mov	r1, #110
	blx	r6
	mvn	r0, #0
.L2199:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2198:
	ldr	r1, .L2212+12
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	ip, r0
	bhi	.L2209
	mov	r8, #2240
	ldr	r3, [r4, #252]
	mul	r6, r8, r5
	add	r3, r3, r6
	ldrb	r7, [r3, #19]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L2201
	ldr	r7, .L2212+16
	mov	r0, r4
	mov	r1, r7
	str	r5, [r7, #24]
	str	ip, [r7, #28]
	bl	MVC_ProcessPPS
	subs	r5, r0, #0
	bne	.L2210
	ldr	r1, [r4, #252]
	mov	r0, r7
	add	r1, r1, r6
	bl	MVC_PPSEqual
	cmp	r0, #0
	beq	.L2199
	ldr	ip, .L2212+20
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
	b	.L2199
.L2201:
	str	r5, [r3, #24]
	mov	r0, r4
	ldr	r3, [r4, #252]
	add	r3, r3, r6
	str	ip, [r3, #28]
	ldr	r1, [r4, #252]
	add	r1, r1, r6
	bl	MVC_ProcessPPS
	cmp	r0, #0
	bne	.L2211
	ldr	r3, [r4, #252]
	mov	r2, #1
	add	r3, r3, r6
	strb	r2, [r3, #20]
	ldr	r3, [r4, #252]
	add	r6, r3, r6
	strb	r2, [r6, #19]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2205:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2209:
	ldr	r1, .L2212+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2199
.L2210:
	movw	r2, #9655
	ldr	r1, .L2212+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2199
.L2211:
	movw	r2, #9674
	ldr	r1, .L2212+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #252]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r6
	strb	r2, [r3, #20]
	ldr	r3, [r4, #252]
	add	r6, r3, r6
	strb	r7, [r6, #19]
	b	.L2199
.L2213:
	.align	2
.L2212:
	.word	.LC172
	.word	.LC173
	.word	g_event_report
	.word	.LC174
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC175
	.word	.LC176
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
	ldr	r1, .L2262
	mov	r4, r0
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L2256
.L2216:
	ldr	r1, .L2262+4
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L2257
.L2217:
	ldr	r1, .L2262+8
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L2258
.L2219:
	ldr	r1, .L2262+12
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L2259
.L2220:
	ldr	r1, .L2262+16
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L2260
.L2222:
	ldr	r1, .L2262+20
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L2224
	ldr	r1, .L2262+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L2262+28
	mov	r1, #4
	str	r0, [r5, #96]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+32
	mov	r1, #4
	strb	r0, [r5, #92]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [r5, #96]
	cmp	r3, #31
	strb	r0, [r5, #93]
	bhi	.L2227
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2227
	add	r7, r5, #96
	add	r8, r5, #59
.L2228:
	ldr	r1, .L2262+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #96]
	cmp	r3, r6
	bcs	.L2228
	ldr	r2, .L2262+48
	mov	r1, #5
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+52
	mov	r1, #5
	str	r0, [r5, #356]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+56
	mov	r1, #5
	str	r0, [r5, #360]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+60
	mov	r1, #5
	str	r0, [r5, #364]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #368]
.L2224:
	ldr	r1, .L2262+64
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L2261
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2233
.L2232:
	ldr	r1, .L2262+68
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2262+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L2234
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
.L2235:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2261:
	ldr	r1, .L2262+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L2262+28
	mov	r1, #4
	str	r0, [r5, #408]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+32
	mov	r1, #4
	strb	r0, [r5, #404]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [r5, #408]
	cmp	r3, #31
	strb	r0, [r5, #405]
	bhi	.L2227
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2227
	add	r8, r5, #368
	add	r7, r5, #408
	add	r8, r8, #3
.L2230:
	ldr	r1, .L2262+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #408]
	cmp	r3, r6
	bcs	.L2230
	ldr	r2, .L2262+48
	mov	r1, #5
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+52
	mov	r1, #5
	str	r0, [r5, #668]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+56
	mov	r1, #5
	str	r0, [r5, #672]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+60
	mov	r1, #5
	str	r0, [r5, #676]
	mov	r0, r4
	bl	mvc_u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #680]
	bne	.L2233
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2232
.L2233:
	ldr	r1, .L2262+76
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #14]
	b	.L2232
.L2260:
	ldr	r2, .L2262+80
	mov	r1, #32
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2262+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, [r5, #52]
	cmp	r1, #0
	strb	r0, [r5, #9]
	beq	.L2222
	ldr	r3, [r5, #56]
	mov	r0, #1000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	mov	r0, r0, lsr #1
	str	r0, [r4, #56]
	b	.L2222
.L2259:
	ldr	r1, .L2262+92
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+96
	str	r0, [r5, #44]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #48]
	b	.L2220
.L2258:
	ldr	r2, .L2262+100
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2262+104
	str	r0, [r5, #28]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2262+108
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L2219
	ldr	r2, .L2262+112
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+116
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+120
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #40]
	b	.L2219
.L2257:
	ldr	r1, .L2262+124
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #2]
	b	.L2217
.L2256:
	ldr	r2, .L2262+128
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L2216
	ldr	r2, .L2262+132
	mov	r1, #16
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2262+136
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #20]
	b	.L2216
.L2234:
	ldr	r1, .L2262+140
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2262+144
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+148
	str	r0, [r5, #684]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+152
	str	r0, [r5, #688]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+156
	str	r0, [r5, #696]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+160
	str	r0, [r5, #692]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2262+164
	str	r0, [r5, #700]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #704]
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2235
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2227:
	ldr	r1, .L2262+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2263:
	.align	2
.L2262:
	.word	.LC177
	.word	.LC181
	.word	.LC183
	.word	.LC190
	.word	.LC193
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC209
	.word	.LC211
	.word	.LC212
	.word	.LC210
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC191
	.word	.LC192
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC182
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC213
	.word	.LC214
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC218
	.word	.LC219
	.word	.LC201
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r6, r0, #0
	beq	.L2296
	cmp	r1, #0
	beq	.L2297
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
	beq	.L2268
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
.L2272:
	ldr	r1, [fp, #-48]
	ldrsb	r0, [r6, #1]!
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-48]
	sxtb	r1, r2
	cmp	r0, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L2269
	cmp	r7, #5
	bhi	.L2279
	add	r2, r8, #748
	add	lr, r8, #812
	mov	r1, r9
.L2271:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, lr
	bne	.L2271
.L2269:
	add	r7, r7, #1
	add	r10, r10, #256
	cmp	r7, #8
	add	r5, r5, #256
	add	r4, r4, #256
	add	r8, r8, #64
	add	r9, r9, #64
	bne	.L2272
	ldr	r6, [fp, #-52]
	ldr	r1, [fp, #-56]
.L2268:
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
	beq	.L2274
	cmp	ip, #1
	bne	.L2273
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
	beq	.L2273
	add	ip, r6, #2912
	add	r0, r1, #2912
	add	ip, ip, #4
	add	r0, r0, #4
	mov	r2, #0
.L2276:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r5
	bne	.L2276
.L2273:
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
	bne	.L2277
	ldrb	r0, [r6, #21]	@ zero_extendqisi2
	ldrb	r2, [r1, #21]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L2277:
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
	bne	.L2298
.L2278:
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
.L2266:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2298:
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
	b	.L2278
.L2279:
	mov	r1, r5
	mov	r2, r10
.L2270:
	ldr	ip, [r2, #4]!
	ldr	r0, [r1, #4]!
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r4
	bne	.L2270
	b	.L2269
.L2274:
	ldr	r0, [r6, #2904]
	ldr	r2, [r1, #2904]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L2273
.L2297:
	mov	r0, r1
	movw	r3, #10145
	ldr	r2, .L2299
	ldr	r1, .L2299+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2266
.L2296:
	movw	r3, #10144
	ldr	r2, .L2299
	ldr	r1, .L2299+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2266
.L2300:
	.align	2
.L2299:
	.word	.LC13
	.word	.LC14
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L2324
	subs	ip, r4, #255
	movne	ip, #1
	cmp	r4, #16
	movle	lr, #0
	andgt	lr, ip, #1
	cmp	lr, #0
	bne	.L2313
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r0, #1
	movne	r0, #0
	cmp	r4, #255
	movne	r0, #0
	andeq	r0, r0, #1
	cmp	r0, #0
	bne	.L2314
	cmp	r4, #1
	moveq	r2, r0
	moveq	r4, #5
	beq	.L2302
	cmp	ip, #0
	ldrne	r0, .L2325
	addne	r4, r0, r4, lsl #3
	ldrne	r1, [r4, #120]
	ldrne	r2, [r4, #124]
	mul	r0, r3, r1
	ldr	r3, [fp, #4]
	mul	r1, r3, r2
	mov	r0, r0, asl #10
	bl	__aeabi_idiv
	movw	r3, #2405
	movw	r1, #2262
	cmp	r0, r3
	mov	r2, r0
	rsble	r3, r0, #2400
	subgt	r3, r0, #2400
	addle	r3, r3, #6
	subgt	r3, r3, #6
	cmp	r0, r1
	bgt	.L2306
	rsb	r1, r0, #2256
	add	r1, r1, #7
	cmp	r3, r1
	bge	.L2307
.L2317:
	mov	r4, #4
	b	.L2302
.L2313:
	mov	r4, #0
.L2324:
	mov	r2, r4
.L2302:
	mov	r3, r4
	ldr	r1, .L2325+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2306:
	sub	r1, r0, #2256
	sub	r1, r1, #7
	cmp	r3, r1
	blt	.L2317
.L2307:
	movw	r3, #1819
	cmp	r2, r3
	bgt	.L2308
	rsb	r3, r2, #1808
	add	r3, r3, #12
	cmp	r1, r3
	blt	.L2319
.L2309:
	movw	r1, #1364
	cmp	r2, r1
	rsble	r4, r2, #1360
	subgt	r4, r2, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r3, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L2302
.L2314:
	mov	r4, lr
	mov	r2, lr
	b	.L2302
.L2308:
	sub	r3, r2, #1808
	sub	r3, r3, #12
	cmp	r1, r3
	bge	.L2309
.L2319:
	mov	r4, #3
	b	.L2302
.L2326:
	.align	2
.L2325:
	.word	.LANCHOR0
	.word	.LC220
	UNWIND(.fnend)
	.size	MVC_GetDar, .-MVC_GetDar
	.align	2
	.global	MVC_ProcessSPS
	.type	MVC_ProcessSPS, %function
MVC_ProcessSPS:
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
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L2442
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
	bne	.L2443
.L2340:
	ldr	r1, .L2457
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #12
	str	r0, [r5, #2896]
	bhi	.L2355
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2355
	ldr	r1, .L2457+4
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r5, #2900]
	bhi	.L2357
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2357
	cmp	r0, #0
	beq	.L2444
	cmp	r0, #1
	beq	.L2445
.L2363:
	ldr	r1, .L2457+8
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #3944]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+12
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #19]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+16
	mov	r0, r4
	bl	mvc_ue_v
	movw	r7, #509
	sub	r3, r0, #1
	str	r0, [r5, #3948]
	cmp	r3, r7
	bhi	.L2368
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2368
	ldr	r1, .L2457+20
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #3952]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+24
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #20]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	cmp	r0, #0
	bne	.L2446
	ldr	r1, .L2457+28
	mov	r0, r4
	bl	mvc_u_1
	ldr	r6, [r5, #3952]
	add	r6, r6, #1
	cmp	r6, #255
	strb	r0, [r5, #21]
	bhi	.L2401
	ldr	r3, [r5, #3948]
	add	r3, r3, #1
	cmp	r6, #1
	cmphi	r3, #3
	movhi	r8, #2
	bhi	.L2372
.L2401:
	ldr	r1, .L2457+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2443:
	ldr	r1, .L2457+36
	bl	mvc_ue_v
	cmp	r0, #1
	str	r0, [r5, #748]
	bhi	.L2331
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2331
	ldr	r1, .L2457+40
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L2333
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2334
.L2333:
	ldr	r1, .L2457+44
	mov	r0, #1
	bl	dprint_vfmw
.L2334:
	ldr	r1, .L2457+48
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L2335
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2336
.L2335:
	ldr	r1, .L2457+52
	mov	r0, #1
	bl	dprint_vfmw
.L2336:
	ldr	r1, .L2457+56
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L2337
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2337
	ldr	r1, .L2457+60
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #27]
	cmp	r0, #1
	bne	.L2340
	sub	r8, fp, #72
	add	r10, r5, #5
	add	r7, r5, #2672
	add	r9, r5, #752
	b	.L2347
.L2449:
	ldr	r3, .L2457+64
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2457+68
	ldr	r3, [r3, #52]
	blx	r3
.L2343:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2447
.L2347:
	ldr	r1, .L2457+72
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
	beq	.L2448
	cmp	r6, #0
	cmpne	r6, #3
	beq	.L2449
	ldr	r3, .L2457+68
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2343
.L2399:
	cmp	r1, r9
	cmpcs	r0, r6
	bcs	.L2398
	ldr	r3, .L2457+76
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2440
	strh	r1, [fp, #-72]	@ movhi
	mov	r3, #8
	strh	r0, [fp, #-70]	@ movhi
	sub	r2, fp, #76
	strh	r9, [fp, #-76]	@ movhi
	mov	r1, #107
	strh	r6, [fp, #-74]	@ movhi
	ldr	r0, [r4, #120]
	blx	r5
.L2440:
	mvn	r0, #0
.L2433:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2446:
	ldr	r6, [r5, #3952]
	strb	r3, [r5, #21]
	sub	r3, r6, #1
	cmp	r3, r7
	bhi	.L2401
	ldr	r3, [r5, #3948]
	mov	r8, #1
	add	r6, r6, #1
	add	r3, r3, r8
.L2372:
	mul	r6, r6, r8
	mov	r9, r3, asl #4
	mov	r6, r6, asl #4
	mul	r1, r9, r6
	add	r1, r1, r1, lsr #1
	cmp	r1, #100663296
	bhi	.L2450
	ldr	r2, [r5, #740]
	sub	r3, r2, #10
	cmp	r3, #31
	ldrls	pc, [pc, r3, asl #2]
	b	.L2374
.L2376:
	.word	.L2375
	.word	.L2377
	.word	.L2408
	.word	.L2408
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2408
	.word	.L2379
	.word	.L2381
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2381
	.word	.L2382
	.word	.L2383
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2374
	.word	.L2385
	.word	.L2385
.L2444:
	ldr	r1, .L2457+80
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #12
	str	r0, [r5, #2904]
	bhi	.L2360
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2363
.L2360:
	ldr	r1, .L2457+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2408:
	mov	r0, #60416
	movt	r0, 13
.L2378:
	bl	__aeabi_uidiv
	ldr	r1, .L2457+88
	cmp	r0, #16
	movcc	r7, r0
	movcs	r7, #16
	mov	r2, r7
	mov	r0, #21
	bl	dprint_vfmw
	ldr	r2, [r5, #3944]
	cmp	r2, r7
	bhi	.L2386
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2387
.L2386:
	mov	r3, r7
	ldr	r1, .L2457+92
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #3944]
	cmp	r3, #16
	bhi	.L2437
	cmp	r7, r3
	movcc	r7, r3
.L2437:
	str	r7, [r5, #3944]
.L2387:
	ldr	r1, .L2457+96
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #22]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+100
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #23]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	cmp	r0, #0
	bne	.L2451
.L2389:
	mov	r2, r9, lsr #1
	mov	r3, r6, lsr #1
	str	r9, [r5, #3976]
	str	r6, [r5, #3980]
	str	r2, [r5, #3984]
	str	r3, [r5, #3988]
.L2391:
	ldr	r1, .L2457+104
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r3, r0
	strb	r3, [r5, #24]
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2440
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r5, #68]
	bne	.L2452
	mov	r0, r3
	strb	r3, [r5, #43]
	mov	r3, #5
	str	r3, [r5, #56]
.L2394:
	ldr	r2, [r5, #48]
	mov	r3, r9
	ldr	r1, [r5, #44]
	str	r6, [sp]
	bl	MVC_GetDar
	ldr	r3, [r5, #3944]
	cmp	r3, #0
	str	r0, [r5, #52]
	beq	.L2397
	cmp	r7, r3
	movcs	r7, r3
.L2397:
	ldr	r3, [r4, #224]
	cmp	r7, #16
	movcs	r7, #16
	ldr	r2, [r3, #28]
	cmp	r2, #25
	beq	.L2453
.L2398:
	cmp	r6, #1920
	bcc	.L2400
	cmp	r7, #4
	movcs	r7, #4
.L2400:
	add	r7, r7, #1
	mov	r0, #0
	str	r7, [r5, #3972]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2385:
	mov	r0, #12582912
	b	.L2378
.L2381:
	mov	r0, #30208
	movt	r0, 47
	b	.L2378
.L2447:
	sub	r8, fp, #88
	add	r10, r5, #11
	add	r7, r5, #2768
	add	r9, r5, #1136
	mov	r6, #0
.L2353:
	ldr	r1, .L2457+72
	mov	r0, r4
	bl	mvc_u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r7
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2454
	ldr	r1, .L2457+108
	cmp	r6, #0
	ldr	r3, .L2457+68
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2350:
	add	r6, r6, #1
	add	r7, r7, #64
	cmp	r6, #2
	add	r9, r9, #256
	bne	.L2353
	b	.L2340
.L2448:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	cmp	r0, #0
	bne	.L2349
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2343
	ldr	r1, .L2457+64
	mov	r2, #16
	ldr	r3, .L2457+68
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2343
.L2331:
	ldr	r1, .L2457+112
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2355:
	ldr	r1, .L2457+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2451:
	ldr	r1, .L2457+120
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2457+124
	str	r0, [r5, #3956]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2457+128
	str	r0, [r5, #3960]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2457+132
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
	ble	.L2389
	add	r2, r2, r3, lsr #1
	add	r8, r8, r0, lsr #1
	str	r2, [r5, #3984]
	str	r8, [r5, #3988]
	str	r3, [r5, #3976]
	str	r0, [r5, #3980]
	b	.L2391
.L2452:
	add	r1, r5, #28
	mov	r0, r4
	bl	mvc_vui_parameters
	cmp	r0, #0
	bne	.L2439
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2439
	ldr	r2, [r5, #732]
	clz	r3, r2
	mov	r3, r3, lsr #5
	cmp	r7, r2
	orrcc	r3, r3, #1
	cmp	r3, #0
	bne	.L2455
	ldr	r3, [r5, #3944]
	ldrb	r0, [r5, #43]	@ zero_extendqisi2
	cmp	r2, r3
	movcs	r7, r2
	movcc	r7, r3
	b	.L2394
.L2455:
	mov	r3, r7
	ldr	r1, .L2457+136
	mov	r0, #1
	bl	dprint_vfmw
.L2439:
	ldrb	r0, [r5, #43]	@ zero_extendqisi2
	b	.L2394
.L2453:
	ldr	r2, [r3, #732]
	cmp	r2, #0
	bne	.L2398
	ldr	r2, [r3, #716]
	ldr	r1, [r3, #692]
	cmp	r7, r2
	ldr	r0, [r3, #696]
	bls	.L2399
	ldr	r3, .L2457+76
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2440
	str	r2, [fp, #-72]
	mov	r3, #8
	str	r7, [fp, #-76]
	sub	r2, fp, #76
	ldr	r0, [r4, #120]
	mov	r1, #106
	blx	r5
	mvn	r0, #0
	b	.L2433
.L2337:
	ldr	r1, .L2457+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2445:
	ldr	r1, .L2457+144
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #18]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+148
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #2908]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+152
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #2912]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2440
	ldr	r1, .L2457+156
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #255
	str	r0, [r5, #2916]
	bhi	.L2365
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2365
	cmp	r0, #0
	addne	r7, r5, #2912
	addne	r7, r7, #4
	bne	.L2367
	b	.L2363
.L2456:
	ldr	r3, [r5, #2916]
	cmp	r3, r6
	bls	.L2363
.L2367:
	ldr	r1, .L2457+160
	mov	r0, r4
	bl	mvc_se_v
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2456
	b	.L2440
.L2368:
	mov	r2, r0
	ldr	r1, .L2457+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2383:
	mov	r0, #7864320
	b	.L2378
.L2377:
	mov	r0, #17920
	movt	r0, 5
	b	.L2378
.L2375:
	mov	r0, #20992
	movt	r0, 2
	b	.L2378
.L2382:
	mov	r0, #30720
	movt	r0, 105
	b	.L2378
.L2379:
	mov	r0, #55296
	movt	r0, 27
	b	.L2378
.L2374:
	ldr	r1, .L2457+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2454:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	cmp	r0, #0
	bne	.L2349
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2350
	ldr	r1, .L2457+108
	mov	r2, #64
	ldr	r3, .L2457+68
	cmp	r6, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2350
.L2357:
	ldr	r1, .L2457+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2349:
	ldr	r1, .L2457+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2450:
	ldr	r1, .L2457+180
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2442:
	mov	r0, r5
	movw	r3, #10334
	ldr	r2, .L2457+184
	ldr	r1, .L2457+188
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2365:
	ldr	r1, .L2457+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2433
.L2458:
	.align	2
.L2457:
	.word	.LC230
	.word	.LC232
	.word	.LC235
	.word	.LC243
	.word	.LC244
	.word	.LC246
	.word	.LC247
	.word	.LC261
	.word	.LC248
	.word	.LC221
	.word	.LC223
	.word	.LC224
	.word	.LC225
	.word	.LC226
	.word	.LC227
	.word	.LC229
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC168
	.word	g_event_report
	.word	.LC234
	.word	.LC236
	.word	.LC251
	.word	.LC252
	.word	.LC253
	.word	.LC254
	.word	.LC259
	.word	.LANCHOR1+32
	.word	.LC222
	.word	.LC231
	.word	.LC255
	.word	.LC256
	.word	.LC257
	.word	.LC258
	.word	.LC260
	.word	.LC228
	.word	.LC237
	.word	.LC238
	.word	.LC239
	.word	.LC240
	.word	.LC242
	.word	.LC245
	.word	.LC250
	.word	.LC233
	.word	.LC169
	.word	.LC249
	.word	.LC13
	.word	.LC14
	.word	.LC241
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r2, .L2504
	mov	r1, #8
	mov	r4, r0
	bl	mvc_u_v
	ldr	r1, .L2504+4
	mov	r10, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2504+8
	mov	r9, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2504+12
	mov	r8, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2504+16
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2504+20
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2504+24
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r2, .L2504+28
	mov	r1, #2
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2504+32
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2504+36
	mov	r5, r0
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r6, r0
	bne	.L2497
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L2499
	cmp	r10, #100
	mov	r7, r10
	beq	.L2465
	bhi	.L2466
	cmp	r10, #77
	beq	.L2465
	cmp	r10, #88
	beq	.L2467
	cmp	r10, #66
	bne	.L2464
	ldr	r1, .L2504+40
	mov	r0, #1
	bl	dprint_vfmw
.L2465:
	cmp	r5, #9
	mov	r2, r5
	bls	.L2496
.L2502:
	cmp	r5, #41
	bhi	.L2496
.L2471:
	movw	r3, #3992
	ldr	r1, [r4, #248]
	mul	r5, r3, r6
	add	r1, r1, r5
	ldrb	r10, [r1, #25]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L2472
	ldr	r10, .L2504+44
	mov	r0, r4
	str	r3, [fp, #-72]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	add	r1, r10, #2240
	str	r7, [r10, #2976]
	strb	r9, [r10, #2240]
	strb	r3, [r10, #2242]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	strb	r8, [r10, #2241]
	str	r2, [r10, #2980]
	strb	r3, [r10, #2243]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	str	r6, [r10, #2984]
	strb	r3, [r10, #2244]
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	strb	r3, [r10, #2245]
	bl	MVC_ProcessSPS
	ldr	r3, [fp, #-72]
	subs	r7, r0, #0
	bne	.L2500
	ldr	r1, [r4, #248]
	add	r0, r10, #2240
	str	r3, [fp, #-56]
	add	r1, r1, r5
	bl	MVC_SPSEqual
	ldr	r3, [fp, #-56]
	cmp	r0, #0
	bne	.L2501
.L2461:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2466:
	cmp	r10, #122
	beq	.L2469
	cmp	r10, #144
	beq	.L2469
	cmp	r10, #110
	beq	.L2469
.L2464:
	mov	r2, r10
	ldr	r1, .L2504+48
	mov	r0, #1
	mov	r7, #100
	bl	dprint_vfmw
	cmp	r5, #9
	mov	r2, r5
	bhi	.L2502
.L2496:
	mov	r3, #41
	ldr	r1, .L2504+52
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, #41
	b	.L2471
.L2472:
	str	r7, [r1, #736]
	mov	r0, r4
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	strb	r9, [r3, r5]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	strb	r8, [r3, #1]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	strb	r1, [r3, #2]
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-60]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r1, [r3, #3]
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-64]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r1, [r3, #4]
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-68]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r1, [r3, #5]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	str	r2, [r3, #740]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	str	r6, [r3, #744]
	ldr	r1, [r4, #248]
	add	r1, r1, r5
	bl	MVC_ProcessSPS
	cmp	r0, #0
	bne	.L2503
	ldr	r3, [r4, #248]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #26]
	ldr	r3, [r4, #248]
	add	r5, r3, r5
	strb	r2, [r5, #25]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2499:
	ldr	r1, .L2504+56
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #36]
	sub	r3, r2, #1
	cmp	r6, r3
	bls	.L2497
	ldr	r3, .L2504+60
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2497
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r6, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r4, #120]
	mov	r1, #109
	blx	r5
.L2497:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2469:
	ldr	r1, .L2504+64
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r5, #9
	mov	r2, r5
	bhi	.L2502
	b	.L2496
.L2467:
	ldr	r1, .L2504+68
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r5, #9
	mov	r2, r5
	bhi	.L2502
	b	.L2496
.L2501:
	ldr	ip, .L2504+72
	mov	r2, r3
	ldr	r0, [r4, #248]
	mov	r3, #1
	add	r1, r10, #2240
	strb	r3, [r10, #2266]
	add	r0, r0, r5
	ldr	r4, [ip, #56]
	strb	r3, [r10, #2265]
	blx	r4
	mov	r0, r7
	b	.L2461
.L2500:
	mov	r3, r6
	movw	r2, #10874
	ldr	r1, .L2504+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2461
.L2503:
	mov	r3, r6
	movw	r2, #10901
	ldr	r1, .L2504+76
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #248]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r5
	strb	r2, [r3, #26]
	ldr	r3, [r4, #248]
	add	r5, r3, r5
	strb	r10, [r5, #25]
	b	.L2461
.L2505:
	.align	2
.L2504:
	.word	.LC262
	.word	.LC263
	.word	.LC264
	.word	.LC265
	.word	.LC266
	.word	.LC267
	.word	.LC268
	.word	.LC269
	.word	.LC270
	.word	.LC271
	.word	.LC272
	.word	.LANCHOR2
	.word	.LC275
	.word	.LC276
	.word	.LC175
	.word	g_event_report
	.word	.LC274
	.word	.LC273
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC277
	UNWIND(.fnend)
	.size	MVC_DecSPS, .-MVC_DecSPS
	.align	2
	.global	MVC_FreeMvcExtMem
	.type	MVC_FreeMvcExtMem, %function
MVC_FreeMvcExtMem:
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
	.size	MVC_FreeMvcExtMem, .-MVC_FreeMvcExtMem
	.align	2
	.global	MVC_FreeMvcVuiExtMem
	.type	MVC_FreeMvcVuiExtMem, %function
MVC_FreeMvcVuiExtMem:
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
	.size	MVC_FreeMvcVuiExtMem, .-MVC_FreeMvcVuiExtMem
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L2570
	ldr	r1, .L2571
	bl	mvc_ue_v
	cmp	r0, #1
	str	r0, [r5, #4]
	bhi	.L2511
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	addeq	r7, r5, #4
	bne	.L2511
.L2513:
	ldr	r1, .L2571+4
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldr	r3, [r5, #4]
	cmp	r3, r6
	bcs	.L2513
	cmp	r3, #0
	mov	r2, #0
	str	r2, [r5, #16]
	str	r2, [r5, #24]
	beq	.L2514
	add	r8, r5, #16
	mov	r7, #1
.L2524:
	ldr	r1, .L2571+8
	mov	r0, r4
	bl	mvc_ue_v
	add	r9, r8, #4
	str	r0, [r8, #4]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2515
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2515
	cmp	r0, #0
	addne	r10, r8, #16
	beq	.L2520
.L2519:
	ldr	r1, .L2571+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r10, #4]!
	ldr	r3, [r9]
	cmp	r6, r3
	bcc	.L2519
.L2520:
	ldr	r1, .L2571+16
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #8]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcc	r2, r3
	movcs	r2, #15
	cmp	r0, r2
	bhi	.L2517
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2517
	cmp	r0, #0
	addne	r8, r8, #24
	beq	.L2522
.L2523:
	ldr	r1, .L2571+20
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r9, #8]
	cmp	r6, r3
	bcc	.L2523
	ldr	r3, [r5, #4]
.L2522:
	add	r7, r7, #1
	mov	r8, r9
	cmp	r7, r3
	bls	.L2524
	cmp	r3, #0
	mov	r3, #0
	addne	r8, r5, #48
	str	r3, [r5, #48]
	str	r3, [r5, #56]
	movne	r7, #1
	beq	.L2538
.L2537:
	ldr	r1, .L2571+24
	mov	r0, r4
	bl	mvc_ue_v
	add	r9, r8, #4
	str	r0, [r8, #4]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2528
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2528
	cmp	r0, #0
	addne	r10, r8, #16
	beq	.L2533
.L2532:
	ldr	r1, .L2571+28
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r10, #4]!
	ldr	r3, [r9]
	cmp	r6, r3
	bcc	.L2532
.L2533:
	ldr	r1, .L2571+32
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #8]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcc	r2, r3
	movcs	r2, #15
	cmp	r0, r2
	bhi	.L2530
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2530
	cmp	r0, #0
	addne	r8, r8, #24
	beq	.L2535
.L2536:
	ldr	r1, .L2571+36
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r9, #8]
	cmp	r6, r3
	bcc	.L2536
	ldr	r3, [r5, #4]
.L2535:
	add	r7, r7, #1
	mov	r8, r9
	cmp	r7, r3
	bls	.L2537
.L2538:
	ldr	r1, .L2571+40
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r0, #1
	str	r0, [r5, #80]
	cmp	r3, #16
	str	r3, [fp, #-60]
	bhi	.L2526
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2526
	ldr	r2, [fp, #-60]
	cmp	r2, #0
	beq	.L2543
	add	r2, r5, #8384
	add	r1, r5, #80
	add	r2, r2, #16
	str	r1, [fp, #-72]
	str	r2, [fp, #-68]
	add	r2, r5, #212
	str	r3, [fp, #-56]
	str	r2, [fp, #-64]
	str	r5, [fp, #-76]
.L2542:
	ldr	r2, .L2571+44
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-72]
	ldr	r1, .L2571+48
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
	bhi	.L2540
	ldrb	r7, [r4, #10]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L2540
	cmp	r2, #0
	beq	.L2550
	ldr	r3, [fp, #-64]
	movw	r10, #8188
	ldr	r2, [fp, #-68]
	movt	r10, 4
	add	r10, r3, r10
	mov	r8, r3
	str	r2, [fp, #-48]
.L2549:
	ldr	r2, .L2571+52
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2571+56
	str	r0, [r8], #4
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r0, #1
	str	r0, [r8, #4092]
	cmp	r6, #64
	bhi	.L2544
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2544
	cmp	r6, #0
	movne	r5, r3
	ldrne	r9, [fp, #-48]
	beq	.L2548
.L2545:
	ldr	r1, .L2571+60
	mov	r0, r4
	bl	mvc_ue_v
	add	r5, r5, #1
	cmp	r6, r5
	str	r0, [r9, #4]!
	bne	.L2545
.L2548:
	ldr	r1, .L2571+64
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #1024
	str	r0, [r10, #4]!
	bcs	.L2546
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2546
	ldr	r3, [fp, #-48]
	add	r7, r7, #1
	add	r3, r3, #256
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r3, r7
	bne	.L2549
.L2550:
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
	bne	.L2542
.L2543:
	mov	r0, #0
	b	.L2562
.L2515:
	mov	r2, r0
	ldr	r1, .L2571+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2562:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2517:
	mov	r2, r0
	ldr	r1, .L2571+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2530:
	mov	r2, r0
	ldr	r1, .L2571+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2528:
	mov	r2, r0
	ldr	r1, .L2571+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2511:
	mov	r2, r0
	movw	r3, #65534
	ldr	r1, .L2571+84
	mov	r0, #1
	str	r3, [r5, #80]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2514:
	str	r3, [r5, #48]
	str	r3, [r5, #56]
	b	.L2538
.L2546:
	mov	r2, r0
	ldr	r1, .L2571+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2544:
	ldr	r3, [fp, #-56]
	movw	ip, #65534
	ldr	r5, [fp, #-76]
	mov	r2, r6
	ldr	r1, .L2571+92
	mov	r0, #1
	add	r3, r7, r3, lsl #6
	add	r3, r3, #1072
	add	r3, r3, #4
	add	r3, r5, r3, lsl #2
	str	ip, [r3, #4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2570:
	mov	r0, r5
	movw	r3, #10964
	ldr	r2, .L2571+96
	ldr	r1, .L2571+100
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2526:
	movw	r3, #65534
	ldr	r2, [fp, #-60]
	ldr	r1, .L2571+104
	mov	r0, #1
	str	r3, [r5, #80]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2540:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r5, [fp, #-76]
	ldr	r2, [fp, #-52]
	add	r5, r5, r3, lsl #2
	ldr	r1, .L2571+108
	movw	r3, #65534
	str	r3, [r5, #148]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2562
.L2572:
	.align	2
.L2571:
	.word	.LC278
	.word	.LC280
	.word	.LC281
	.word	.LC284
	.word	.LC282
	.word	.LC286
	.word	.LC288
	.word	.LC291
	.word	.LC289
	.word	.LC293
	.word	.LC287
	.word	.LC295
	.word	.LC296
	.word	.LC298
	.word	.LC299
	.word	.LC302
	.word	.LC300
	.word	.LC283
	.word	.LC285
	.word	.LC292
	.word	.LC290
	.word	.LC279
	.word	.LC303
	.word	.LC301
	.word	.LC13
	.word	.LC14
	.word	.LC294
	.word	.LC297
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
	ldr	r1, .L2608
	mov	r4, r0
	bl	mvc_ue_v
	add	r3, r5, #278528
	cmp	r0, #1024
	str	r0, [r3, #560]
	bcs	.L2604
	adds	r6, r0, #1
	mov	r1, #0
	adc	r7, r1, #0
	strd	r6, [fp, #-116]
	orrs	r2, r6, r7
	beq	.L2592
	add	r1, r5, #294912
	add	r9, r5, #315392
	add	r9, r9, #856
	movw	r2, #16687
	mov	ip, r1
	movw	r6, #34136
	movw	r1, #16751
	movw	r0, #33844
	mov	r8, r5
	movt	r2, 4
	add	ip, ip, #820
	add	r2, r5, r2
	movt	r6, 4
	str	r2, [fp, #-104]
	movt	r1, 4
	add	r6, r5, r6
	add	r2, r5, r1
	movt	r0, 4
	str	r2, [fp, #-96]
	add	r2, r3, #111
	str	ip, [fp, #-76]
	str	r2, [fp, #-88]
	add	r2, r5, r0
	str	r6, [fp, #-48]
	str	r2, [fp, #-80]
	add	r2, r3, #560
	str	r2, [fp, #-92]
	add	r2, r3, #176
	str	r2, [fp, #-72]
	add	r2, r3, #432
	str	r2, [fp, #-52]
	add	r2, r3, #496
	str	r2, [fp, #-56]
	add	r2, r3, #240
	add	r3, r3, #816
	str	r2, [fp, #-84]
	str	r3, [fp, #-60]
	mov	r2, #1
	mov	r3, #0
	strd	r2, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-100]
.L2591:
	ldr	r2, .L2608+4
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-88]
	ldr	r1, .L2608+8
	strb	r0, [r3, #1]!
	mov	r0, r4
	str	r3, [fp, #-88]
	bl	mvc_ue_v
	ldr	r3, [fp, #-92]
	cmp	r0, #1024
	str	r0, [r3, #4]!
	str	r3, [fp, #-92]
	bcs	.L2605
	adds	r5, r0, #1
	beq	.L2581
	ldr	r10, [fp, #-60]
	mov	r7, #0
	ldr	r6, [fp, #-48]
.L2578:
	ldr	r1, .L2608+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r7, r7, #1
	cmp	r5, r7
	str	r0, [r10, #4]!
	bne	.L2578
	str	r6, [fp, #-48]
.L2581:
	ldr	r1, .L2608+16
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-96]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	cmp	r0, #0
	str	r3, [fp, #-96]
	bne	.L2606
.L2580:
	ldr	r1, .L2608+20
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-52]
	uxtb	r0, r0
	strb	r0, [r3]
	cmp	r0, #0
	beq	.L2582
	ldr	r1, .L2608+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r5, [fp, #-48]
	ldr	r2, .L2608+28
	mov	r1, #4
	str	r0, [r5]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34132
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2608+32
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
	bhi	.L2584
	ldrb	r5, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L2584
	ldr	r6, [fp, #-48]
	movw	r10, #34099
	movt	r10, 4
	add	r10, r8, r10
	mov	r7, r6
.L2585:
	ldr	r1, .L2608+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2608+40
	add	r5, r5, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2608+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r10, #1]!
	ldr	r3, [r6]
	cmp	r3, r5
	bcs	.L2585
	ldr	r2, .L2608+48
	mov	r1, #5
	mov	r0, r4
	str	r6, [fp, #-48]
	bl	mvc_u_v
	movw	r3, #34396
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2608+52
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	add	r3, r8, #294912
	ldr	r2, .L2608+56
	mov	r1, #5
	str	r0, [r3, #1632]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34404
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2608+60
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34408
	movt	r3, 4
	add	r3, r8, r3
	str	r0, [r3]
.L2582:
	ldr	r1, .L2608+64
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3]
	cmp	r0, #0
	bne	.L2607
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2590
.L2589:
	ldr	r1, .L2608+68
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
	bne	.L2591
.L2592:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2607:
	ldr	r1, .L2608+24
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r8, #315392
	ldr	r2, .L2608+28
	mov	r1, #4
	mov	r5, r3
	str	r3, [fp, #-108]
	str	r0, [r9]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2608+32
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
	bhi	.L2584
	ldrb	r5, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L2584
	movw	r10, #54067
	ldr	r6, [fp, #-48]
	movt	r10, 4
	add	r10, r8, r10
	mov	r7, r9
.L2587:
	ldr	r1, .L2608+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2608+40
	add	r5, r5, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2608+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r10, #1]!
	ldr	r3, [r9]
	cmp	r3, r5
	bcs	.L2587
	ldr	r2, .L2608+48
	mov	r1, #5
	mov	r0, r4
	str	r6, [fp, #-48]
	bl	mvc_u_v
	movw	r3, #54364
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2608+52
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-108]
	ldr	r2, .L2608+56
	mov	r1, #5
	str	r0, [r3, #1120]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54372
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2608+60
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
	bne	.L2590
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2589
.L2590:
	ldr	r1, .L2608+72
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-72]
	strb	r0, [r3]
	b	.L2589
.L2606:
	ldr	r2, .L2608+76
	mov	r1, #32
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-76]
	ldr	r2, .L2608+80
	mov	r1, #32
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-80]
	ldr	r1, .L2608+84
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-84]
	strb	r0, [r3]
	b	.L2580
.L2584:
	ldr	r1, .L2608+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2602:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2605:
	mov	r2, r0
	ldr	r1, .L2608+92
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2604:
	mov	r2, r0
	ldr	r1, .L2608+96
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2602
.L2609:
	.align	2
.L2608:
	.word	.LC304
	.word	.LC306
	.word	.LC307
	.word	.LC310
	.word	.LC309
	.word	.LC314
	.word	.LC315
	.word	.LC316
	.word	.LC317
	.word	.LC318
	.word	.LC319
	.word	.LC320
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC327
	.word	.LC326
	.word	.LC311
	.word	.LC312
	.word	.LC313
	.word	.LC201
	.word	.LC308
	.word	.LC305
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
	ldr	r2, .L2638
	mov	r1, #8
	mov	r4, r0
	bl	mvc_u_v
	ldr	r1, .L2638+4
	mov	r7, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2638+8
	str	r0, [fp, #-48]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2638+12
	mov	r9, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2638+16
	str	r0, [fp, #-52]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2638+20
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2638+24
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r2, .L2638+28
	mov	r1, #2
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2638+32
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2638+36
	mov	r8, r0
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r5, r0
	bne	.L2623
	cmp	r0, #31
	bhi	.L2633
	sub	r3, r7, #66
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L2613
.L2615:
	.word	.L2614
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2616
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2617
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2616
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2618
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2616
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2618
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2616
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2613
	.word	.L2618
.L2614:
	ldr	r1, .L2638+40
	mov	r0, #1
	bl	dprint_vfmw
.L2616:
	cmp	r8, #41
	bhi	.L2634
.L2619:
	movw	r3, #8500
	movw	ip, #26248
	movt	r3, 5
	movt	ip, 4
	mul	r3, r3, r5
	mov	r0, r4
	add	r10, r4, r3
	add	r6, r10, #286720
	add	ip, r10, ip
	str	r3, [fp, #-68]
	add	r1, r6, #932
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	str	r8, [r6, #1672]
	str	r7, [r6, #1668]
	strb	r3, [r6, #932]
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	strb	r9, [r6, #933]
	strb	r3, [r6, #934]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	strb	r3, [r6, #935]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	strb	r3, [r6, #936]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	strb	r3, [r6, #937]
	str	r5, [ip, #4]
	bl	MVC_ProcessSPS
	ldr	r3, [fp, #-68]
	subs	r8, r0, #0
	bne	.L2635
	cmp	r7, #118
	cmpne	r7, #128
	mov	r9, #1
	strb	r9, [r6, #957]
	beq	.L2636
.L2621:
	movw	r3, #8500
	mov	r2, #1
	movt	r3, 5
	mla	r4, r3, r5, r4
	add	r4, r4, #12992
	strb	r2, [r4, #12]
.L2611:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2634:
	mov	r2, r8
	ldr	r1, .L2638+44
	mov	r0, #1
	mov	r8, #41
	bl	dprint_vfmw
	b	.L2619
.L2636:
	ldr	r1, .L2638+48
	mov	r0, r4
	str	r3, [fp, #-48]
	bl	mvc_u_1
	ldr	r3, [fp, #-48]
	add	r10, r10, #12992
	add	r10, r10, #8
	add	r3, r4, r3
	add	r7, r3, #12992
	add	r7, r7, #12
	mov	r1, r7
	strb	r0, [r10, #5]
	mov	r0, r4
	bl	MVC_ProcessSUBSPSMvcExt
	cmp	r0, #0
	bne	.L2637
	ldr	r1, .L2638+52
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #0
	str	r0, [r6, #928]
	beq	.L2621
	mov	r1, r7
	mov	r0, r4
	bl	MVC_ProcessSUBSPSMvcVuiExt
	cmp	r0, #0
	beq	.L2621
	mov	r0, r9
	ldr	r1, .L2638+56
	bl	dprint_vfmw
	strb	r8, [r10, #4]
	mvn	r8, #0
	b	.L2611
.L2618:
	ldr	r1, .L2638+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2616
.L2617:
	ldr	r1, .L2638+64
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2616
.L2613:
	mov	r2, r7
	ldr	r1, .L2638+68
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2623:
	mvn	r8, #0
	b	.L2611
.L2633:
	ldr	r1, .L2638+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L2611
.L2635:
	ldr	r1, .L2638+76
	mov	r0, #1
	bl	dprint_vfmw
	add	r2, r10, #12992
	mov	r3, #0
	mvn	r8, #0
	strb	r3, [r2, #12]
	strb	r3, [r6, #957]
	b	.L2611
.L2637:
	mov	r0, r9
	ldr	r1, .L2638+80
	bl	dprint_vfmw
	strb	r8, [r10, #4]
	mvn	r8, #0
	b	.L2611
.L2639:
	.align	2
.L2638:
	.word	.LC328
	.word	.LC329
	.word	.LC330
	.word	.LC331
	.word	.LC332
	.word	.LC333
	.word	.LC334
	.word	.LC335
	.word	.LC336
	.word	.LC337
	.word	.LC272
	.word	.LC339
	.word	.LC341
	.word	.LC343
	.word	.LC344
	.word	.LC274
	.word	.LC273
	.word	.LC338
	.word	.LC175
	.word	.LC340
	.word	.LC342
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
	beq	.L2649
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #8
	ldr	lr, [r4, #8]
	cmp	lr, #0
	beq	.L2649
	ldr	lr, [ip, #68]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2649
	cmp	lr, r3
	bls	.L2649
	ldr	lr, [r4, #12]
	mov	r6, r2
	ldr	r4, [r4, #24]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2644
	b	.L2642
.L2645:
	ldr	r4, [r2, #24]
	ldr	r2, [r2, #12]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2642
.L2644:
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
	bhi	.L2645
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2642:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #24]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2649:
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
	beq	.L2665
	ldr	r3, [r0, #232]
	cmp	r3, #0
	cmpne	r2, #0
	beq	.L2665
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #8]
	cmp	ip, #0
	beq	.L2665
	ldr	ip, [r3, #68]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2665
	cmp	ip, r7
	bls	.L2665
.L2660:
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
	bcs	.L2655
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, lr
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2667
.L2658:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2668
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, lr
	strb	r3, [r4], #1
.L2667:
	ldr	r3, [r0, #232]
	add	r3, r3, r5
	ldr	r1, [r3, #24]
	add	r1, r1, #8
	str	r1, [r3, #24]
	bhi	.L2658
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2668:
	ldr	r3, [r0, #232]
.L2655:
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r7, r7, #1
	add	ip, ip, #1
	strb	ip, [r3]
	ldr	r3, [r0, #232]
	ldr	ip, [r3, #68]
	cmp	ip, r7
	bhi	.L2660
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2665:
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
	ldr	r1, .L2676
	mov	r4, r0
	bl	mvc_ue_v
	add	r6, r4, #11075584
	add	r5, r6, #45056
	ldr	r2, .L2676+4
	mov	r1, #1
	str	r0, [r5, #2704]
	mov	r0, r4
	bl	mvc_u_v
	uxtb	r0, r0
	strb	r0, [r5, #2681]
	cmp	r0, #0
	beq	.L2675
.L2670:
	mov	r0, r4
	ldr	r2, .L2676+8
	mov	r1, #1
	add	r6, r6, #45056
	bl	mvc_u_v
	mov	r3, #1
	strb	r3, [r6, #2680]
	strb	r0, [r6, #2682]
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2675:
	ldr	r2, .L2676+12
	mov	r1, #7
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+16
	mov	r1, #1
	str	r0, [r5, #2696]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+20
	mov	r1, #6
	strb	r0, [r5, #2683]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+24
	mov	r1, #1
	str	r0, [r5, #2700]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+28
	mov	r1, #1
	strb	r0, [r5, #2684]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+32
	mov	r1, #1
	strb	r0, [r5, #2685]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+36
	mov	r1, #1
	strb	r0, [r5, #2686]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+40
	mov	r1, #1
	strb	r0, [r5, #2687]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+44
	mov	r1, #1
	strb	r0, [r5, #2688]
	mov	r0, r4
	bl	mvc_u_v
	ldrb	r3, [r5, #2683]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r5, #2689]
	bne	.L2671
	ldr	r3, [r5, #2696]
	cmp	r3, #5
	beq	.L2671
	ldr	r2, .L2676+48
	mov	r1, #1
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+52
	mov	r1, #1
	strb	r0, [r5, #2690]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+56
	mov	r1, #1
	strb	r0, [r5, #2691]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2676+60
	mov	r1, #1
	strb	r0, [r5, #2692]
	mov	r0, r4
	bl	mvc_u_v
	strb	r0, [r5, #2693]
.L2671:
	ldr	r2, .L2676+64
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2676+68
	str	r0, [r5, #2708]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #2712]
	b	.L2670
.L2677:
	.align	2
.L2676:
	.word	.LC345
	.word	.LC346
	.word	.LC362
	.word	.LC347
	.word	.LC348
	.word	.LC349
	.word	.LC350
	.word	.LC351
	.word	.LC352
	.word	.LC353
	.word	.LC354
	.word	.LC355
	.word	.LC356
	.word	.LC357
	.word	.LC358
	.word	.LC359
	.word	.LC360
	.word	.LC361
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
	ldr	r2, [r2, #2632]
	mla	r4, r4, r2, r3
	ldrb	r2, [r4, #25]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2679
	ldr	r0, [r0, #36]
	cmp	r0, #0
	ble	.L2680
	ldrb	r2, [r3, #25]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #3984
	addeq	r3, r3, #8
	beq	.L2683
	b	.L2702
.L2684:
	ldrb	r1, [r3, #-3967]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2681
.L2683:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, r0
	add	r3, r3, #3984
	add	r3, r3, #8
	bne	.L2684
.L2680:
	ldr	r1, .L2704
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
.L2685:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2702:
	mov	r4, r3
.L2681:
	cmp	r4, #0
	beq	.L2680
.L2679:
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2686
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2703
	ldr	r1, [r4, #388]
	ldr	r8, [r4, #392]
	add	r1, r1, #1
	add	r8, r8, #1
.L2689:
	ldr	r2, .L2704+4
	mov	r0, r5
	bl	mvc_u_v
	add	r7, r6, #45056
	mov	r1, r8
	ldr	r2, .L2704+8
	str	r0, [r7, #2720]
	mov	r0, r5
	bl	mvc_u_v
	str	r0, [r7, #2724]
.L2686:
	ldrb	r0, [r4, #39]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2685
	mov	r0, r5
	ldr	r2, .L2704+12
	mov	r1, #4
	add	r6, r6, #45056
	bl	mvc_u_v
	mov	r3, #0
	strb	r0, [r6, #2716]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2703:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2686
	ldr	r1, [r4, #700]
	ldr	r8, [r4, #704]
	add	r1, r1, #1
	add	r8, r8, #1
	b	.L2689
.L2705:
	.align	2
.L2704:
	.word	.LC363
	.word	.LC364
	.word	.LC365
	.word	.LC366
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r2, [r0, #232]
	sub	r7, fp, #44
	mov	r3, #0
	mov	r1, #32
	mov	r4, r0
	add	r6, r0, #548
	mov	r8, r3
	strb	r3, [r7, #-1]!
	str	r1, [r2, #24]
	b	.L2709
.L2900:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2708
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2899
.L2709:
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
	bls	.L2900
.L2708:
	ldr	r1, .L2931
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2711
.L2899:
	mov	r3, #0
	str	r3, [fp, #-56]
.L2845:
	mov	r5, #0
	b	.L2715
.L2902:
	bl	BsSkip
	cmp	r9, #0
	ble	.L2713
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2901
.L2715:
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
	bls	.L2902
.L2713:
	ldr	r1, .L2931+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2711:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2901:
	cmp	r5, #409600
	bgt	.L2713
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #2
	ldreq	r2, [r3, #52]
	ldreq	r3, [r3, #24]
	ldrne	r2, [r3, #24]
	addeq	r2, r2, r3
	moveq	r2, r2, lsr #3
	cmp	r8, #45
	ldrls	pc, [pc, r8, asl #2]
	b	.L2718
.L2720:
	.word	.L2719
	.word	.L2721
	.word	.L2722
	.word	.L2723
	.word	.L2724
	.word	.L2724
	.word	.L2725
	.word	.L2726
	.word	.L2727
	.word	.L2728
	.word	.L2729
	.word	.L2730
	.word	.L2731
	.word	.L2732
	.word	.L2733
	.word	.L2734
	.word	.L2735
	.word	.L2736
	.word	.L2737
	.word	.L2738
	.word	.L2739
	.word	.L2740
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2718
	.word	.L2741
.L2741:
	mov	r1, r5
	mov	r0, r4
	ldr	r8, [r4, #572]
	bl	MVC_DecFramePackingSEI
	ldr	r2, [r4, #572]
	mov	r9, r5, asl #3
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2831
	rsb	r9, r3, r9
	ldr	r3, [r4, #564]
	cmp	r9, #0
	add	r8, r9, #7
	movge	r8, r9
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2833
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2833
	mov	r10, #0
	b	.L2834
.L2835:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2833
.L2834:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r10, r10, #1
	ldr	r3, [r4, #564]
	cmp	r10, r8
	ldr	r2, [r4, #572]
	mov	r3, r3, asl #3
	bne	.L2835
.L2833:
	mov	r1, r9, asr #31
	mov	r0, r1, lsr #29
	add	r1, r9, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r3, r2
	bcs	.L2903
.L2831:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2904
.L2743:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	bhi	.L2905
.L2840:
	mov	r8, #0
	b	.L2844
.L2842:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2843
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2906
.L2844:
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
	bls	.L2842
.L2843:
	mov	r0, #0
.L2929:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2740:
	mov	r3, r5
	ldr	r1, .L2931+8
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2907
.L2827:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2828
.L2829:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2828:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2829
	ldr	r3, [r4, #60]
	cmp	r3, #3
	bls	.L2840
.L2905:
	ldr	r1, .L2931+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2711
.L2739:
	mov	r3, r5
	ldr	r1, .L2931+16
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2908
.L2824:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2825
.L2826:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2825:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2826
	b	.L2743
.L2738:
	mov	r3, r5
	ldr	r1, .L2931+20
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2909
.L2821:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2822
.L2823:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2822:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2823
	b	.L2743
.L2737:
	mov	r3, r5
	ldr	r1, .L2931+24
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2910
.L2818:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2819
.L2820:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2819:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2820
	b	.L2743
.L2736:
	mov	r3, r5
	ldr	r1, .L2931+28
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2911
.L2815:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2816
.L2817:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2816:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2817
	b	.L2743
.L2735:
	mov	r3, r5
	ldr	r1, .L2931+32
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2912
.L2812:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2813
.L2814:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2813:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2814
	b	.L2743
.L2734:
	mov	r3, r5
	ldr	r1, .L2931+36
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2913
.L2809:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2810
.L2811:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2810:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2811
	b	.L2743
.L2733:
	mov	r3, r5
	ldr	r1, .L2931+40
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2914
.L2806:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2807
.L2808:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2807:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2808
	b	.L2743
.L2732:
	mov	r3, r5
	ldr	r1, .L2931+44
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2915
.L2803:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2804
.L2805:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2804:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2805
	b	.L2743
.L2731:
	mov	r3, r5
	ldr	r1, .L2931+48
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2916
.L2800:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2801
.L2802:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2801:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2802
	b	.L2743
.L2730:
	mov	r3, r5
	ldr	r1, .L2931+52
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2917
.L2797:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2798
.L2799:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2798:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2799
	b	.L2743
.L2729:
	mov	r3, r5
	ldr	r1, .L2931+56
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2918
.L2794:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2795
.L2796:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2795:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2796
	b	.L2743
.L2728:
	mov	r3, r5
	ldr	r1, .L2931+60
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2919
.L2791:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2792
.L2793:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2792:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2793
	b	.L2743
.L2727:
	mov	r3, r5
	ldr	r1, .L2931+64
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2920
.L2788:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2789
.L2790:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2789:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2790
	b	.L2743
.L2726:
	mov	r3, r5
	ldr	r1, .L2931+68
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2921
.L2785:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2786
.L2787:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2786:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2787
	b	.L2743
.L2725:
	mov	r3, r5
	ldr	r1, .L2931+72
	mov	r0, #20
	bl	dprint_vfmw
	cmp	r5, #0
	ble	.L2782
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2782
	mov	r8, #0
	b	.L2783
.L2784:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2782
.L2783:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2784
.L2782:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2743
	movw	r3, #11973
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2743
.L2724:
	cmp	r8, #4
	beq	.L2759
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L2759
	mov	r3, r5
	ldr	r1, .L2931+76
	mov	r0, #20
	bl	dprint_vfmw
.L2761:
	ldr	r0, [r4, #120]
	ldr	r8, [r4, #60]
	bl	GetUsd
	add	r8, r8, #132
	str	r0, [r4, r8, asl #2]
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	cmp	r1, #0
	beq	.L2848
	ldr	r2, [r4, #232]
	cmp	r5, #1024
	movlt	r9, r5
	movge	r9, #1024
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	ip, [r2, #68]
	cmp	r0, ip
	bcs	.L2849
	sxth	r3, r0
	mov	r8, #0
	mov	lr, r3, asl #5
	sub	r3, lr, r3, asl #2
	add	r2, r2, r3
.L2763:
	ldr	r3, [r2, #24]
	add	r0, r0, #1
	ldr	lr, [r2, #12]
	cmp	r0, ip
	add	r3, r3, #7
	add	r2, r2, #28
	sub	r3, lr, r3, lsr #3
	add	r8, r8, r3
	bne	.L2763
	mov	r3, r8
.L2762:
	ldrsb	r2, [fp, #-56]
	cmp	r3, r9
	movge	r8, r9
	cmp	r2, #1
	str	r2, [fp, #-64]
	movne	r10, #0
	strne	r10, [fp, #-60]
	beq	.L2922
.L2765:
	rsb	r2, r10, r8
	mov	r0, r4
	bl	MVC_GetBytes
	subs	r8, r0, #0
	ble	.L2923
	ldr	r3, [fp, #-60]
	rsb	r3, r3, r9
	cmp	r8, r3
	ldr	r3, [r4, #60]
	bge	.L2770
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r8, [r3, #1052]
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2771
	mov	r5, #0
	b	.L2772
.L2774:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2771
.L2772:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2774
.L2771:
	ldr	r3, [r4, #60]
	ldr	r1, [r4, #224]
	add	r3, r3, #132
	ldr	ip, .L2931+116
	ldr	r2, [fp, #-64]
	ldr	r3, [r4, r3, asl #2]
	ldrd	r0, [r1, #64]
	cmp	r2, #1
	add	r3, r3, #1056
	ldr	r5, [ip]
	moveq	r2, #8
	movne	r2, #9
	strd	r0, [r3]
	cmp	r5, #0
	ldr	r3, [r4, #60]
	add	r3, r3, #132
.L2897:
	ldr	r3, [r4, r3, asl #2]
	str	r2, [r3, #1040]
	ldr	r3, [r4, #60]
	ldr	r2, [r4, #84]
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r2, [r3, #1044]
	beq	.L2743
	ldr	r2, [r4, #60]
	movw	r3, #1064
	mov	r1, #6
	ldr	r0, [r4, #120]
	add	r2, r2, #132
	ldr	r2, [r4, r2, asl #2]
	blx	r5
	b	.L2743
.L2722:
	mov	r3, r5
	ldr	r1, .L2931+80
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2924
.L2753:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2754
.L2755:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2754:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2755
	b	.L2743
.L2723:
	mov	r3, r5
	ldr	r1, .L2931+84
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2925
.L2756:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2757
.L2758:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2757:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2758
	b	.L2743
.L2719:
	mov	r3, r5
	ldr	r1, .L2931+88
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2926
.L2742:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2744
.L2745:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2744:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2745
	b	.L2743
.L2721:
	mov	r3, r5
	ldr	r1, .L2931+92
	mov	r0, #20
	mov	r9, r5, asl #3
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	ldr	r8, [r4, #572]
	bl	MVC_DecPicTimingSEI
	ldr	r2, [r4, #572]
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2747
	rsb	r9, r3, r9
	ldr	r3, [r4, #564]
	cmp	r9, #0
	add	r8, r9, #7
	movge	r8, r9
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2749
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2749
	mov	r10, #0
	b	.L2750
.L2751:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2749
.L2750:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r10, r10, #1
	ldr	r3, [r4, #564]
	cmp	r10, r8
	ldr	r2, [r4, #572]
	mov	r3, r3, asl #3
	bne	.L2751
.L2749:
	mov	r1, r9, asr #31
	mov	r0, r1, lsr #29
	add	r1, r9, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r3, r2
	bcs	.L2927
.L2747:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2743
	movw	r3, #11754
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2743
.L2718:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2928
.L2837:
	cmp	r5, #0
	ble	.L2743
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
	mov	r8, #0
	b	.L2838
.L2839:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2743
.L2838:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2839
	b	.L2743
.L2906:
	cmp	r3, #128
	bne	.L2845
	mov	r0, #0
	b	.L2929
.L2770:
	add	r3, r3, #132
	ldr	r2, [fp, #-60]
	cmp	r9, r5
	ldr	r3, [r4, r3, asl #2]
	rsb	r8, r2, r5
	str	r8, [r3, #1052]
	bcc	.L2930
.L2776:
	cmp	r8, #0
	ble	.L2771
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2771
	mov	r5, #0
	b	.L2778
.L2779:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2771
.L2778:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2779
	b	.L2771
.L2903:
	mov	r0, r6
	bl	BsSkip
	b	.L2831
.L2927:
	mov	r0, r6
	bl	BsSkip
	b	.L2747
.L2930:
	rsb	r1, r9, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2776
	movw	r3, #11926
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2776
.L2904:
	movw	r3, #12401
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2743
.L2759:
	mov	r3, r5
	ldr	r1, .L2931+96
	mov	r0, #20
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [fp, #-56]
	b	.L2761
.L2932:
	.align	2
.L2931:
	.word	.LC367
	.word	.LC368
	.word	.LC395
	.word	.LC396
	.word	.LC394
	.word	.LC393
	.word	.LC392
	.word	.LC391
	.word	.LC390
	.word	.LC389
	.word	.LC388
	.word	.LC387
	.word	.LC386
	.word	.LC385
	.word	.LC384
	.word	.LC383
	.word	.LC382
	.word	.LC381
	.word	.LC380
	.word	.LC375
	.word	.LC372
	.word	.LC373
	.word	.LC369
	.word	.LC371
	.word	.LC374
	.word	.LC376
	.word	.LC378
	.word	.LANCHOR0+256
	.word	.LC370
	.word	g_event_report
	.word	.LC377
	.word	.LC379
.L2922:
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r2, .L2931+100
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
	beq	.L2766
	mov	r10, #3
	mov	r2, #0
	str	r10, [fp, #-60]
	strb	r2, [r3, #1028]
.L2767:
	ldr	r3, [r4, #60]
	mov	r1, #16
	ldr	r2, .L2931+104
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
	beq	.L2768
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	b	.L2765
.L2920:
	movw	r3, #12011
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2788
.L2919:
	movw	r3, #12037
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2791
.L2918:
	movw	r3, #12063
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2794
.L2917:
	movw	r3, #12089
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2797
.L2916:
	movw	r3, #12115
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2800
.L2915:
	movw	r3, #12141
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2803
.L2921:
	movw	r3, #11985
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2785
.L2926:
	movw	r3, #11701
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2742
.L2928:
	movw	r3, #12411
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2837
.L2925:
	movw	r3, #11792
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2756
.L2924:
	movw	r3, #11766
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2753
.L2914:
	movw	r3, #12167
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2806
.L2913:
	movw	r3, #12193
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2809
.L2912:
	movw	r3, #12219
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2812
.L2911:
	movw	r3, #12245
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2815
.L2910:
	movw	r3, #12271
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2818
.L2909:
	movw	r3, #12297
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2821
.L2908:
	movw	r3, #12323
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2824
.L2907:
	movw	r3, #12349
	ldr	r2, .L2931+108
	ldr	r1, .L2931+112
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2827
.L2768:
	ldr	r1, [r4, #224]
	add	r3, r3, #132
	ldr	ip, .L2931+116
	mov	r2, #8
	ldr	r3, [r4, r3, asl #2]
	ldrd	r0, [r1, #64]
	add	r3, r3, #1056
	ldr	r5, [ip]
	strd	r0, [r3]
	cmp	r5, #0
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	b	.L2897
.L2849:
	mov	r3, #0
	mov	r8, r3
	b	.L2762
.L2766:
	ldr	r2, .L2931+120
	mov	r1, #8
	mov	r0, r4
	str	r3, [fp, #-68]
	bl	mvc_u_v
	ldr	r3, [fp, #-68]
	mov	r10, #4
	str	r10, [fp, #-60]
	strb	r0, [r3, #1028]
	b	.L2767
.L2848:
	mvn	r0, #0
	b	.L2711
.L2923:
	ldr	r1, .L2931+124
	mov	r0, #1
	bl	dprint_vfmw
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
	b	.L2711
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
	str	r1, [r3, #2732]
	mov	r1, #7
	str	r2, [r3, #2736]
	mov	r2, #32
	strb	r1, [r3, #2723]
	mov	r1, #3
	strb	r2, [r3, #2722]
	mvn	r2, #0
	str	r1, [r3, #2744]
	mov	r1, #262144
	str	r2, [r3, #2748]
	mov	r2, #0
	strb	r0, [r3, #2721]
	str	r1, [r3, #2760]
	strb	r2, [r3, #2720]
	str	r2, [r3, #2752]
	str	r2, [r3, #2756]
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
	subs	r5, r0, #0
	beq	.L2945
	cmp	r1, #0
	beq	.L2946
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	and	r3, r3, #31
	sub	r3, r3, #1
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L2944
.L2939:
	.word	.L2938
	.word	.L2944
	.word	.L2944
	.word	.L2944
	.word	.L2938
	.word	.L2944
	.word	.L2940
	.word	.L2940
.L2940:
	ldr	r0, [r5]
	mov	r3, #1
	str	r3, [r5]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2938:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L2941
.L2943:
	mvn	r0, #0
.L2942:
	mov	r3, #0
	str	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2944:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2941:
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
	bhi	.L2943
	mov	r0, r0, asl #1
	rsb	r0, r0, #31
	mov	r0, r4, lsr r0
	subs	r0, r0, #1
	mvnne	r0, #0
	b	.L2942
.L2946:
	mov	r0, r1
	ldr	r3, .L2947
	movw	r2, #12539
	ldr	r1, .L2947+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2945:
	ldr	r3, .L2947+8
	movw	r2, #12538
	ldr	r1, .L2947+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2948:
	.align	2
.L2947:
	.word	.LC398
	.word	.LC24
	.word	.LC397
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
	ble	.L2975
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2963
	ldr	r5, .L2976
	ldr	r10, .L2976+4
.L2961:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2976
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
	bne	.L2953
	ldr	r2, .L2976
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2956
	b	.L2954
.L2957:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2954
.L2956:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2957
.L2953:
	mov	r0, r4, asl #3
.L2952:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2965
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2965
.L2960:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2958
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2960
	b	.L2958
.L2954:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2961
	b	.L2953
.L2965:
	mov	r3, #0
.L2958:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2975:
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L2976+8
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2963:
	mov	r0, r4
	b	.L2952
.L2977:
	.align	2
.L2976:
	.word	.LANCHOR3-1952
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC399
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
	beq	.L2984
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2983
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #36]
	bl	MVC_FindZeroBitsInSeg
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #40]
	cmp	r0, r2, asl #3
	bcs	.L2987
	cmn	r0, #1
	beq	.L2983
.L2982:
	add	r0, r0, #1
	str	r0, [r3, #72]
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2986
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #72]
	cmp	r2, r1, asl #3
	bcs	.L2988
.L2986:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2988:
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
.L2987:
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
.L2983:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	MVC_FindZeroBitsInSeg
	ldr	r3, [r4, #232]
	b	.L2982
.L2984:
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
	b	MVC_CombinePacket.part.14
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
	beq	.L2996
	mov	r2, r0
	mov	r3, #1
	b	.L2994
.L2993:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2999
.L2994:
	ldrb	r1, [r2, #1025]	@ zero_extendqisi2
	add	r2, r2, #88
	cmp	r1, #0
	bne	.L2993
	mov	r2, r3
.L2992:
	mov	ip, #88
	mov	r1, #1
	mla	r3, ip, r3, r0
	mov	r0, r2
	strb	r1, [r3, #937]
	ldmfd	sp, {fp, sp, pc}
.L2999:
	mvn	r2, #0
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L2996:
	mov	r3, r2
	b	.L2992
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
	ldr	r1, .L3043
	sub	r2, r3, #1
	mov	r0, #22
	add	r6, r4, #11075584
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r7]
	add	r5, r6, #40960
	str	r3, [r9]
	add	r1, r4, #12288
	ldr	r2, [r4, #232]
	mvn	ip, #0
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	strb	r0, [r5, #1067]
	ldrb	lr, [r2, #4]	@ zero_extendqisi2
	strb	lr, [r5, #1072]
	ldrb	r2, [r2, #5]	@ zero_extendqisi2
	strb	r3, [r5, #1075]
	str	ip, [r5, #2704]
	strb	r2, [r5, #1076]
	ldrb	r3, [r1, #704]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3036
	cmp	r2, #255
	beq	.L3037
.L3002:
	mov	r0, r4
	bl	MVC_SliceCheck
	subs	r8, r0, #0
	bne	.L3018
	mov	r0, r4
	bl	MVC_ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L3038
	ldrb	r3, [r5, #1069]	@ zero_extendqisi2
	mov	ip, #2240
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r9]
	ldrb	r1, [r5, #1076]	@ zero_extendqisi2
	ldr	r3, [r5, #1080]
	ldr	r0, [r4, #252]
	sxtb	r2, r1
	cmn	r2, #1
	mla	r3, ip, r3, r0
	beq	.L3039
	cmp	r1, #0
	bne	.L3014
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r3, [r3, #28]
	cmp	r2, #1
	beq	.L3040
	ldr	r2, [r4, #28]
	cmp	r2, r3
	movweq	r3, #35364
	movteq	r3, 168
	addeq	r3, r4, r3
	bne	.L3041
.L3013:
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
	ldr	r3, [r6, #2920]
	add	r3, r3, #1
	cmp	r2, r3
	movhi	r3, #1
	strhi	r3, [r7]
.L3010:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3036:
	strb	r3, [r5, #1075]
	ldr	r3, [r1, #712]
	str	r3, [r5, #2704]
	ldrb	r3, [r1, #708]	@ zero_extendqisi2
	strb	r3, [r5, #1073]
	ldrb	r3, [r1, #709]	@ zero_extendqisi2
	strb	r3, [r5, #1074]
	b	.L3002
.L3039:
	ldr	r3, [r3, #28]
	movw	r1, #3992
	ldr	r2, [r4, #248]
	mla	r3, r1, r3, r2
	b	.L3013
.L3037:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L3002
	add	r3, r4, #10747904
	add	r3, r3, #20480
	ldr	r2, [r3, #2384]
	cmp	r2, #0
	bne	.L3005
	ldrb	r2, [r3, #2380]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3005
	add	r3, r4, #12992
	add	r3, r3, #16
.L3008:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L3006
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3042
.L3006:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L3008
	mvn	r3, #0
	b	.L3035
.L3040:
	movw	r2, #8500
	movt	r2, 5
	mla	r3, r2, r3, r4
	add	r3, r3, #286720
	add	r3, r3, #932
	b	.L3013
.L3005:
	ldr	r3, [r3, #2388]
.L3035:
	cmn	r3, #1
	str	r3, [r5, #2704]
	beq	.L3002
	sub	r0, r0, #5
	mov	r3, #1
	clz	r0, r0
	strb	r3, [r5, #1075]
	strb	r3, [r5, #1074]
	mov	r0, r0, lsr #5
	strb	r0, [r5, #1073]
	b	.L3002
.L3018:
	mvn	r8, #0
	b	.L3010
.L3041:
	ldr	r1, .L3043+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L3010
.L3038:
	ldr	r1, .L3043+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L3010
.L3014:
	ldr	r1, .L3043+12
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L3010
.L3042:
	movw	r3, #8500
	movt	r3, 5
	mla	r3, r3, r2, r4
	add	r3, r3, #12992
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	b	.L3035
.L3044:
	.align	2
.L3043:
	.word	.LC400
	.word	.LC33
	.word	.LC401
	.word	.LC402
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
	ldr	r3, [r5, #1112]
	cmp	r3, #0
	beq	.L3047
	add	r6, r0, #252
	mov	r4, #0
	b	.L3051
.L3048:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L3050
	ldr	r3, [r5, #1112]
	cmp	r4, r3
	bcs	.L3073
.L3051:
	ldr	r3, [r6, #4]!
	add	r4, r4, #1
	ldr	r0, [r7, #120]
	ldr	r3, [r3, #4]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L3048
.L3050:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3073:
	cmp	r3, #0
	beq	.L3047
	ldr	r3, [r5, #1116]
	cmp	r3, #0
	addne	r6, r7, #384
	movne	r4, #0
	bne	.L3054
	b	.L3047
.L3074:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L3050
	ldr	r3, [r5, #1116]
	cmp	r4, r3
	bcs	.L3047
.L3054:
	ldr	r3, [r6, #4]!
	add	r4, r4, #1
	ldr	r0, [r7, #120]
	ldr	r3, [r3, #4]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L3074
	b	.L3050
.L3047:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_IsRefListWrong, .-MVC_IsRefListWrong
	.align	2
	.global	MVC_DEC_Destroy
	.type	MVC_DEC_Destroy, %function
MVC_DEC_Destroy:
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
	subs	r5, r0, #0
	beq	.L3095
	bl	MVC_ClearCurrPic
	mov	r0, r5
	bl	MVC_ClearAllNal
	ldr	r3, [r5, #60]
	cmp	r3, #0
	beq	.L3077
	mov	r4, #0
	add	r6, r5, #524
	mov	r7, r4
.L3079:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3078
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	str	r7, [r6]
	ldr	r3, [r5, #60]
.L3078:
	cmp	r3, r4
	bhi	.L3079
.L3077:
	movw	r9, #48984
	movw	r8, #16408
	movt	r9, 169
	movt	r8, 170
	add	r9, r5, r9
	add	r8, r5, r8
	mov	r6, #0
	mov	r7, #0
.L3083:
	sub	r4, r9, #32
.L3081:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3096
.L3080:
	cmp	r4, r9
	bne	.L3081
	add	r9, r4, #824
	cmp	r9, r8
	bne	.L3083
	ldr	r1, .L3097
	mov	r0, #2
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L3096:
	mov	r1, r2
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L3080
.L3095:
	movw	r2, #13536
	ldr	r1, .L3097+4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L3098:
	.align	2
.L3097:
	.word	.LC404
	.word	.LC403
	UNWIND(.fnend)
	.size	MVC_DEC_Destroy, .-MVC_DEC_Destroy
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
	subs	r5, r0, #0
	mov	r8, r1
	beq	.L3111
	cmp	r1, #31
	bhi	.L3112
	ldr	r1, .L3114
	mov	r0, #2
	bl	dprint_vfmw
	mov	r1, r8
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L3106
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	beq	.L3106
	add	r4, r0, #576
	add	r9, r0, #608
	mov	r6, #0
	mov	r7, #0
.L3104:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3113
.L3103:
	cmp	r4, r9
	bne	.L3104
	ldr	r0, [r5, #120]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3113:
	mov	r1, r2
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L3103
.L3106:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3112:
	ldr	r3, .L3114+4
	movw	r2, #13798
	ldr	r1, .L3114+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3111:
	ldr	r3, .L3114+12
	movw	r2, #13797
	ldr	r1, .L3114+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3115:
	.align	2
.L3114:
	.word	.LC406
	.word	.LC405
	.word	.LC24
	.word	.LC23
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
	beq	.L3157
	ldr	r2, [r0, #224]
	ldr	r2, [r2, #24]
	cmp	r2, #0
	beq	.L3119
	ldrb	r2, [r0, #8]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L3119
	ldr	r2, [r0, #520]
	cmp	r2, #0
	strneb	r3, [r2, #2]
	movne	r0, #1
	strne	r3, [r4, #520]
	beq	.L3121
.L3156:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3119:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_CheckFrameStore
	cmn	r0, #3
	beq	.L3121
	ldr	r1, [r4, #520]
	cmp	r1, #0
	beq	.L3122
	mov	r0, r4
	bl	MVC_GetImagePara
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_CheckFrameStore
	subs	r7, r0, #0
	beq	.L3158
	cmn	r7, #3
	beq	.L3130
	mov	r3, r7
	movw	r2, #1844
	ldr	r1, .L3166
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #520]
	mov	r0, r4
	sub	r7, r7, #1
	clz	r7, r7
	ldr	r1, [r3, #220]
	bl	MVC_DEC_RecycleImage
	mov	r7, r7, lsr #5
.L3129:
	ldr	r3, [r4, #520]
	mov	r0, #0
	strb	r0, [r3, #2]
	ldr	r3, [r4, #520]
	cmp	r5, r3
	movne	r7, #0
	andeq	r7, r7, #1
	cmp	r7, r0
	strne	r0, [r4, #520]
	bne	.L3156
.L3131:
	mov	r3, #0
	str	r3, [r4, #520]
.L3122:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	MVC_CheckFrameStore
	subs	r3, r0, #0
	beq	.L3159
	movw	r2, #1897
	ldr	r1, .L3166
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #220]
	mov	r0, r4
	bl	MVC_DEC_RecycleImage
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3157:
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L3166+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3159:
	mov	r2, #1
	ldrsb	r1, [r5, #6]
	ldr	r0, [r4, #120]
	bl	FSP_SetDisplay
	ldrsb	r1, [r5, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3160
	cmp	r6, #1
	add	r3, r4, #584
	streq	r6, [r7, #180]
	mov	r2, r4
	ldr	r0, [r4, #120]
	mov	r1, #15
	str	r7, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3161
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #16]
	bcs	.L3162
.L3137:
	ldr	r2, [r4, #144]
	mov	r0, #0
	ldr	r3, [r4, #136]
	add	r2, r2, #1
	str	r2, [r4, #144]
	add	r3, r3, #2
	str	r3, [r4, #136]
	b	.L3156
.L3121:
	mov	r0, #1
	b	.L3156
.L3130:
	ldr	r3, [r4, #520]
	mov	r2, #0
	strb	r2, [r3, #2]
	b	.L3131
.L3158:
	ldr	r3, [r4, #520]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3163
	ldr	r3, [r4, #520]
	mov	r2, r4
	mov	r1, #15
	cmp	r5, r3
	cmpeq	r6, #1
	moveq	r3, #1
	streq	r3, [r7, #180]
	add	r3, r4, #584
	ldr	r0, [r4, #120]
	str	r7, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3164
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #16]
	bcs	.L3165
.L3128:
	ldr	r2, [r4, #144]
	mov	r7, #1
	ldr	r3, [r4, #136]
	add	r2, r2, r7
	str	r2, [r4, #144]
	add	r3, r3, #2
	str	r3, [r4, #136]
	b	.L3129
.L3162:
	mov	r1, r7
	mov	r0, r4
	bl	MVC_SetFrmRepeatCount.part.2
	b	.L3137
.L3165:
	mov	r1, r7
	mov	r0, r4
	bl	MVC_SetFrmRepeatCount.part.2
	b	.L3128
.L3161:
	mov	r2, r0
	ldr	r1, .L3166+8
	mov	r0, #0
	bl	dprint_vfmw
	ldrsb	r1, [r5, #6]
	mov	r2, #0
	ldr	r0, [r4, #120]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3156
.L3164:
	mov	r2, r0
	ldr	r1, .L3166+8
	mov	r0, #0
	mov	r5, r0
	bl	dprint_vfmw
	ldr	r3, [r4, #520]
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
	b	.L3156
.L3160:
	movw	r2, #1871
	ldr	r1, .L3166+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3156
.L3163:
	movw	r2, #1815
	ldr	r1, .L3166+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3156
.L3167:
	.align	2
.L3166:
	.word	.LC410
	.word	.LC407
	.word	.LC409
	.word	.LC408
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #15
	mov	r5, r1
	mov	r6, r0
	bhi	.L3172
	add	r4, r0, r1, lsl #2
	add	r4, r4, #11075584
	add	r4, r4, #45056
	ldr	r3, [r4, #2728]
	cmp	r3, #0
	moveq	r4, r3
	beq	.L3170
	mov	r2, #0
	strb	r2, [r3, #5]
	ldr	r1, [r4, #2728]
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #2728]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	cmp	r3, #0
	rsb	r4, r0, #0
	beq	.L3173
.L3170:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3173:
	mov	r0, r6
	mov	r1, r5
	bl	MVC_RemoveFrameStoreOutDPB
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3172:
	ldr	r1, .L3174
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L3170
.L3175:
	.align	2
.L3174:
	.word	.LC411
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
	beq	.L3195
	add	r8, r5, #11075584
	add	r8, r8, #45056
	ldr	r3, [r8, #2920]
	cmp	r3, #0
	movwne	r7, #47780
	movne	r6, #0
	movtne	r7, 169
	addne	r7, r5, r7
	beq	.L3183
.L3182:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	cmp	r1, #0
	beq	.L3181
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3181
	ldr	r3, [r1, #56]
	cmn	r4, #1
	cmpne	r3, r4
	bne	.L3181
	mov	r0, r5
	bl	MVC_UnMarkFrameStoreRef
.L3181:
	ldr	r3, [r8, #2920]
	cmp	r3, r6
	bhi	.L3182
.L3183:
	mov	r1, r4
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
	ldr	r0, [r8, #2920]
	cmp	r0, #0
	beq	.L3180
	movw	r1, #47780
	mov	r7, #0
	movt	r1, 169
	add	r1, r5, r1
	mov	r2, r7
	mvn	r6, #0
.L3187:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L3185
	ldr	r3, [r3, #56]
	cmn	r4, #1
	cmpne	r4, r3
	addeq	r7, r7, #1
	cmp	r4, r3
	cmnne	r4, #1
	movne	r6, r3
.L3185:
	cmp	r2, r0
	bne	.L3187
	cmp	r7, #0
	beq	.L3180
	adds	r8, r6, #1
	movne	r8, #1
	cmp	r4, r6
	movle	r9, #0
	andgt	r9, r8, #1
	b	.L3193
.L3194:
	subs	r7, r7, #1
	beq	.L3180
.L3193:
	cmp	r9, #0
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r1, r6
	mov	r0, r5
	beq	.L3190
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3180
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3195
.L3190:
	mov	r1, r4
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3180
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3195
	cmp	r4, r6
	movge	r3, #0
	andlt	r3, r8, #1
	cmp	r3, #0
	beq	.L3194
	mov	r1, r6
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3180
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	beq	.L3194
.L3195:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3180:
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
	add	r9, r10, #16384
	add	r8, r0, #11075584
	movw	r7, #15768
	add	r8, r8, #36864
	ldr	r4, [r9, #44]
	movt	r7, 170
	add	r7, r0, r7
	mov	r5, r0
	add	r6, r4, #2000
	add	r4, r4, #4
	add	r6, r6, #4
	add	r3, r0, #11075584
	str	r3, [fp, #-48]
.L3242:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L3233
.L3235:
	.word	.L3234
	.word	.L3236
	.word	.L3237
	.word	.L3238
	.word	.L3239
	.word	.L3240
	.word	.L3241
.L3241:
	ldr	r2, [r4, #12]
	mov	r1, r7
	mov	r0, r5
	bl	MVC_MarkCurrPicLT
.L3233:
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L3242
.L3234:
	ldrb	r3, [r8, #4024]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r0, #0
	beq	.L3250
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3240:
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
	strb	r3, [r8, #4024]
	b	.L3233
.L3239:
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	MVC_UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3233
.L3238:
	ldr	r3, [r4, #12]
	mov	r1, r7
	ldr	r2, [r4, #4]
	mov	r0, r5
	bl	MVC_MarkSTToLTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3233
.L3237:
	mov	r0, r5
	ldr	r2, [r4, #8]
	mov	r1, r7
	bl	MVC_UnMarkLTRef
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3233
.L3236:
	mov	r0, r5
	ldr	r2, [r4, #4]
	mov	r1, r7
	bl	MVC_UnMarkSTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	b	.L3233
.L3250:
	ldr	r3, [fp, #-48]
	mov	r2, #0
	str	r2, [r9, #48]
	add	r10, r10, #12288
	add	r1, r3, #40960
	movw	r3, #26894
	movt	r3, 42
	ldr	r1, [r1, #2708]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	str	r2, [r9, #880]
	ldrb	r3, [r10, #3483]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3245
	bcc	.L3246
	cmp	r3, #2
	streq	r2, [r9, #72]
	streq	r2, [r9, #60]
	streq	r2, [r8, #4052]
	streq	r2, [r8, #4060]
.L3244:
	ldr	r1, [r9, #120]
	mov	r0, r5
	bl	MVC_FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3246:
	ldr	r1, [r9, #60]
	ldr	r2, [r9, #68]
	ldr	r3, [r9, #72]
	rsb	r2, r1, r2
	str	r2, [r9, #68]
	rsb	r3, r1, r3
	str	r3, [r9, #72]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r9, #64]
	str	r3, [r9, #60]
	ldr	r1, [r8, #4060]
	ldr	r2, [r8, #4048]
	ldr	r3, [r8, #4052]
	rsb	r2, r1, r2
	str	r2, [r8, #4048]
	rsb	r3, r1, r3
	str	r3, [r8, #4052]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r8, #4056]
	str	r3, [r8, #4060]
	b	.L3244
.L3245:
	str	r2, [r9, #68]
	str	r2, [r9, #60]
	str	r2, [r8, #4048]
	str	r2, [r8, #4060]
	b	.L3244
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
	add	r10, r0, #11141120
	add	r6, r10, #16384
	mov	r7, r0
	ldr	r3, [r6, #44]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3252
	ldr	lr, [r0, #52]
	cmp	lr, #0
	beq	.L3261
	movw	r1, #47780
	mov	r2, #0
	movt	r1, 169
	add	r0, r0, #148
	add	r1, r7, r1
	mov	r4, r2
.L3260:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L3257
	ldr	ip, [r3, #16]
	cmp	ip, #1
	streqb	ip, [r7, #6]
	ldr	ip, [r3, #56]
	ldr	r3, [r6, #120]
	cmp	ip, r3
	streq	r4, [r0]
.L3257:
	cmp	r2, lr
	add	r0, r0, #4
	bne	.L3260
.L3261:
	add	r3, r7, #11075584
	str	r3, [fp, #-48]
	add	r3, r3, #45056
	ldr	r9, [r3, #2920]
	cmp	r9, #0
	beq	.L3255
	movw	r4, #47780
	mov	r5, #0
	movt	r4, 169
	str	r10, [fp, #-52]
	add	r4, r7, r4
	mov	r8, r5
	mov	r10, r3
	b	.L3266
.L3264:
	cmp	r5, r9
	beq	.L3279
.L3266:
	ldr	r1, [r4, #4]!
	add	r5, r5, #1
	cmp	r1, #0
	beq	.L3264
	ldr	r0, [r1, #56]
	ldr	r2, [r6, #120]
	cmp	r0, r2
	bne	.L3264
	strb	r8, [r1, #714]
	mov	r2, #0
	strb	r8, [r1, #713]
	ldr	r1, [r4]
	strb	r8, [r1, #750]
	strb	r8, [r1, #749]
	ldr	r1, [r4]
	strb	r8, [r1, #786]
	strb	r8, [r1, #785]
	ldr	r1, [r4]
	strb	r8, [r1, #3]
	ldr	r1, [r4]
	ldr	r0, [r7, #120]
	ldrsb	r1, [r1, #6]
	bl	FSP_SetRef
	ldr	r1, [r4]
	mov	r3, #1
	movw	r2, #47992
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
	beq	.L3265
	ldr	r1, [r4]
	ldr	r0, [r7, #120]
	ldrsb	r1, [r1, #6]
	bl	FSP_SetDisplay
.L3265:
	str	r8, [r4]
	cmp	r5, r9
	str	r8, [r4, #64]
	str	r8, [r4, #128]
	ldr	r2, [r10, #2924]
	sub	r2, r2, #1
	str	r2, [r10, #2924]
	bne	.L3266
.L3279:
	ldr	r10, [fp, #-52]
.L3255:
	mov	r0, r7
	bl	MVC_UpdateReflist
	mov	r0, r7
	bl	MVC_UpdateLTReflist
	ldr	r3, [r6, #44]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3280
	ldr	r3, [fp, #-48]
	add	r10, r10, #12288
	mov	r0, r2
	mov	r1, #1
	add	r3, r3, #45056
	str	r2, [r3, #2936]
	strb	r2, [r10, #3484]
	strb	r1, [r10, #3485]
.L3267:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3280:
	ldr	r3, [fp, #-48]
	add	r10, r10, #12288
	mov	r2, #1
	add	r1, r3, #45056
	mov	r3, #0
	mov	r0, r3
	str	r2, [r1, #2936]
	str	r3, [r6, #52]
	strb	r2, [r10, #3484]
	strb	r3, [r10, #3485]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3252:
	ldr	r1, [r6, #120]
	bl	MVC_FlushDPB
	cmp	r0, #0
	addeq	r3, r7, #11075584
	streq	r3, [fp, #-48]
	beq	.L3255
.L3268:
	mvn	r0, #0
	b	.L3267
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #11075584
	add	r4, r0, #11141120
	add	r3, r3, #36864
	add	r6, r4, #12288
	mov	r2, #0
	mov	r7, r0
	strb	r2, [r3, #4024]
	ldrb	r2, [r6, #3483]	@ zero_extendqisi2
	sub	r2, r2, #2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r3, #4025]
	ldrb	r3, [r6, #3486]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3282
	ldrb	r3, [r6, #3492]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3283
	ldr	r3, [r0, #224]
	ldr	r2, [r3, #660]
	cmp	r2, #1
	beq	.L3304
.L3283:
	add	r5, r4, #16384
	ldr	r3, [r5, #44]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r5, #56]
	beq	.L3305
	cmp	r3, #0
	bne	.L3306
.L3290:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3305:
	cmp	r3, #0
	beq	.L3290
.L3289:
	ldrb	r8, [r6, #3481]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L3307
.L3293:
	add	r4, r4, #12288
	mov	r0, #0
	ldrb	r3, [r4, #3484]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #3485]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3304:
	ldr	r2, [r3, #656]
	cmp	r2, #0
	bne	.L3283
	ldr	r2, [r3, #664]
	cmp	r2, #0
	bne	.L3283
	ldr	r3, [r3, #620]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L3283
.L3282:
	mov	r0, r7
	bl	MVC_IDRMemMarking
	cmp	r0, #0
	bne	.L3284
	add	r5, r7, #11141120
	add	r5, r5, #16384
.L3291:
	ldrb	r3, [r6, #3486]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3286
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L3290
	ldr	r3, [r5, #44]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3289
	b	.L3293
.L3307:
	mov	r0, r7
	bl	MVC_SlidingWinMark
	ldr	r3, [r5, #44]
	strb	r8, [r3]
	strb	r8, [r6, #3484]
.L3286:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	bne	.L3293
	b	.L3290
.L3306:
	mov	r0, r7
	bl	MVC_AdaptiveMemMark
	ldr	r3, [r5, #44]
	mov	r2, #0
	strb	r2, [r3]
	cmp	r0, r2
	beq	.L3291
.L3284:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
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
	add	r6, r5, #12288
	mov	r4, r0
	ldrb	r7, [r6, #3483]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L3310
	bcc	.L3311
	cmp	r7, #2
	beq	.L3312
	mov	r7, #0
.L3309:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3312:
	add	r5, r5, #16384
	mov	r2, #3
	ldr	r3, [r5, #40]
	strb	r2, [r3, #712]
	ldrb	r2, [r6, #3481]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3391
	ldr	r3, [r0, #520]
	add	r1, r6, #3488
	add	r1, r1, #8
	mov	r2, #640
	cmp	r3, #0
	ldreq	r3, [r5, #40]
	streq	r3, [r0, #520]
	streq	r3, [r3, #788]
	ldreq	r3, [r0, #520]
	add	ip, r3, #672
	add	r0, r3, #72
	ldr	r10, [r3, #656]
	ldrd	r8, [ip, #-8]
	ldr	r7, [r3, #660]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip]
	bl	memcpy
	movw	r3, #16368
	and	r2, r10, r7
	mov	r1, r3
	movt	r3, 170
	add	r3, r4, r3
	movt	r1, 170
	ldr	r1, [r4, r1]
	ldr	r3, [r3, #4]
	and	r1, r1, r3
	adds	r3, r2, #1
	movne	r3, #1
	cmn	r1, #1
	movne	r3, #0
	cmp	r3, #0
	ldrne	r3, [r4, #520]
	strne	r10, [r3, #656]
	strne	r7, [r3, #660]
	ldrd	r2, [fp, #-52]
	ldrd	r0, [r5, #-8]
	ldr	ip, [r4, #520]
	cmp	r1, r3
	cmpeq	r0, r2
	add	r3, ip, #672
	ldrhid	r0, [fp, #-52]
.L3337:
	strd	r0, [r3, #-8]
	mov	ip, #2
	ldrd	r0, [r5]
	ldr	r3, [r4, #520]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #672
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3]
	mov	r0, #3
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r6, #3482]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #2]
	ldr	r2, [r4, #520]
	ldrb	r1, [r6, #3492]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r4, #520]
	strb	ip, [r3, #784]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #712]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #92]
	str	r2, [r3, #808]
	ldr	r2, [r4, #520]
	ldr	r3, [r2, #808]
	ldr	r1, [r2, #772]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #736]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #736]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #788]
	str	r2, [r3, #716]
	ldrb	r3, [r6, #3487]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #520]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	beq	.L3388
.L3341:
	strb	r2, [r3, #4]
	mov	r2, #0
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #60]
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
	mov	r7, r0
	beq	.L3342
.L3384:
	ldr	r3, [r5, #40]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
.L3342:
	mov	r3, #0
	mov	r0, r7
	str	r3, [r4, #520]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3311:
	add	r5, r5, #16384
	mov	r2, #0
	ldr	r3, [r5, #40]
	strb	r2, [r3, #712]
	ldr	r1, [r0, #520]
	cmp	r1, r2
	beq	.L3313
	bl	MVC_OutputFrmToVO
	cmp	r0, #0
	bne	.L3392
.L3314:
	ldr	r3, [r4, #520]
	cmp	r3, #0
	beq	.L3313
	ldr	r3, [r5, #40]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
.L3313:
	ldr	r3, [r5, #40]
	mov	r0, #3
	mov	r8, #0
	add	r1, r6, #3488
	add	r1, r1, #8
	mov	r2, #640
	str	r3, [r4, #520]
	str	r3, [r3, #716]
	ldr	r3, [r4, #520]
	ldr	ip, [r5, #40]
	str	ip, [r3, #752]
	ldr	r3, [r4, #520]
	ldr	ip, [r5, #40]
	str	ip, [r3, #788]
	ldrb	ip, [r6, #3482]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	strb	ip, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #3]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #7]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #92]
	mov	r2, r8
	str	r1, [r3, #736]
	str	r1, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #712]
	ldr	r3, [r4, #520]
	ldrb	r1, [r6, #3492]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r4, #520]
	ldrb	r1, [r6, #3489]	@ zero_extendqisi2
	str	r1, [r3, #40]
	ldrb	r1, [r6, #3487]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	cmp	r1, #1
	moveq	r7, #3
	strb	r7, [r3, #4]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #60]
	str	r1, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #120]
	str	r1, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #124]
	str	r1, [r3, #60]
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r2, r8
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, r8
	mov	r7, r0
	bne	.L3384
	b	.L3342
.L3310:
	add	r5, r5, #16384
	mov	r2, #3
	ldr	r3, [r5, #40]
	strb	r2, [r3, #712]
	ldrb	r2, [r6, #3481]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3318
	ldr	r1, [r0, #520]
	cmp	r1, #0
	beq	.L3319
	bl	MVC_OutputFrmToVO
	ldr	r3, [r5, #40]
	str	r3, [r4, #520]
	str	r3, [r3, #752]
	mov	r7, r0
.L3320:
	ldrb	r0, [r6, #3482]	@ zero_extendqisi2
	mov	r9, #1
	ldr	r3, [r4, #520]
	mov	r8, #0
	add	r1, r6, #3488
	mov	r2, #640
	add	r1, r1, #8
	strb	r0, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r9, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #7]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #3]
	ldrb	r0, [r6, #3492]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	strb	r0, [r3]
	ldr	r3, [r4, #520]
	str	r8, [r3, #40]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #92]
	str	r2, [r3, #772]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #772]
	str	r2, [r3, #736]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r9, [r3, #748]
	ldrb	r3, [r6, #3487]	@ zero_extendqisi2
	ldr	r2, [r4, #520]
	rsb	r3, r9, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #4]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #60]
	str	r2, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #120]
	str	r2, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #124]
	str	r2, [r3, #60]
	ldrb	r6, [r4, #9]	@ zero_extendqisi2
	cmp	r6, r9
	bne	.L3309
.L3386:
	ldr	r3, [r4, #520]
	mov	r2, r8
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r2, r8
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, r8
	mov	r7, r0
	beq	.L3342
	ldr	r3, [r5, #40]
	mov	r2, r6
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	b	.L3342
.L3318:
	ldr	r3, [r0, #520]
	add	r1, r6, #3488
	add	r1, r1, #8
	mov	r2, #640
	cmp	r3, #0
	ldreq	r3, [r5, #40]
	streq	r3, [r0, #520]
	streq	r3, [r3, #752]
	ldreq	r3, [r0, #520]
	add	ip, r3, #672
	add	r0, r3, #72
	ldr	r10, [r3, #656]
	ldrd	r8, [ip, #-8]
	ldr	r7, [r3, #660]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip]
	bl	memcpy
	movw	r3, #16368
	and	r2, r10, r7
	mov	r1, r3
	movt	r3, 170
	add	r3, r4, r3
	movt	r1, 170
	ldr	r1, [r4, r1]
	ldr	r3, [r3, #4]
	and	r1, r1, r3
	adds	r3, r2, #1
	movne	r3, #1
	cmn	r1, #1
	movne	r3, #0
	cmp	r3, #0
	ldrne	r3, [r4, #520]
	strne	r10, [r3, #656]
	strne	r7, [r3, #660]
	ldrd	r2, [fp, #-52]
	ldrd	r0, [r5, #-8]
	ldr	ip, [r4, #520]
	cmp	r1, r3
	cmpeq	r0, r2
	add	r3, ip, #672
	ldrhid	r0, [fp, #-52]
.L3324:
	strd	r0, [r3, #-8]
	mov	ip, #1
	ldrd	r0, [r5]
	ldr	r3, [r4, #520]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #672
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3]
	mov	r0, #3
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r6, #3482]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #2]
	ldr	r2, [r4, #520]
	ldrb	r1, [r6, #3492]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r4, #520]
	strb	ip, [r3, #748]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #712]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #92]
	str	r2, [r3, #772]
	ldr	r2, [r4, #520]
	ldr	r3, [r2, #808]
	ldr	r1, [r2, #772]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #736]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #736]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #752]
	str	r2, [r3, #716]
	ldrb	r3, [r6, #3487]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #520]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	bne	.L3341
.L3388:
	orr	r2, r2, ip
	b	.L3341
.L3391:
	ldr	r1, [r0, #520]
	cmp	r1, #0
	beq	.L3331
	bl	MVC_OutputFrmToVO
	ldr	r3, [r5, #40]
	str	r3, [r4, #520]
	str	r3, [r3, #788]
	mov	r7, r0
.L3332:
	ldrb	r0, [r6, #3482]	@ zero_extendqisi2
	mov	r9, #2
	ldr	r3, [r4, #520]
	mov	r8, #0
	add	r1, r6, #3488
	mov	r2, #640
	add	r1, r1, #8
	strb	r0, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r9, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #7]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #3]
	ldrb	r0, [r6, #3492]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	strb	r0, [r3]
	ldr	r3, [r4, #520]
	str	r8, [r3, #40]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #92]
	str	r2, [r3, #808]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #808]
	str	r2, [r3, #736]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r9, [r3, #784]
	ldrb	r2, [r6, #3487]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	cmp	r2, #1
	movne	r2, r8
	moveq	r2, r9
	strb	r2, [r3, #4]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #60]
	str	r2, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #120]
	str	r2, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #124]
	str	r2, [r3, #60]
	ldrb	r6, [r4, #9]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L3386
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3392:
	str	r0, [sp]
	movw	r3, #2452
	ldr	r2, .L3393
	mov	r0, #22
	ldr	r1, .L3393+4
	bl	dprint_vfmw
	b	.L3314
.L3331:
	ldr	r3, [r5, #40]
	mov	r7, r1
	str	r3, [r0, #520]
	str	r3, [r3, #788]
	b	.L3332
.L3319:
	ldr	r3, [r5, #40]
	mov	r7, r1
	str	r3, [r0, #520]
	str	r3, [r3, #752]
	b	.L3320
.L3394:
	.align	2
.L3393:
	.word	.LANCHOR0+268
	.word	.LC412
	UNWIND(.fnend)
	.size	MVC_DirectOutput, .-MVC_DirectOutput
	.align	2
	.global	MVC_DEC_GetRemainImg
	.type	MVC_DEC_GetRemainImg, %function
MVC_DEC_GetRemainImg:
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
	beq	.L3396
	add	r6, r5, #11075584
	add	r6, r6, #45056
	ldr	r3, [r6, #2920]
	cmp	r3, #0
	mvneq	r7, #0
	beq	.L3398
	movw	r8, #47780
	mov	r4, #0
	movt	r8, 169
	add	r8, r5, r8
	mov	r7, r4
	mov	r9, r8
	b	.L3401
.L3400:
	ldr	r3, [r6, #2920]
	cmp	r3, r7
	bls	.L3436
.L3401:
	ldr	r3, [r9, #4]!
	add	r7, r7, #1
	cmp	r3, #0
	beq	.L3400
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3400
	ldrsb	r1, [r3, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L3400
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #1
	ldr	r3, [r6, #2920]
	addls	r4, r4, #1
	cmp	r3, r7
	bhi	.L3401
.L3436:
	cmp	r4, #0
	beq	.L3402
	mvn	r7, #0
	b	.L3405
.L3403:
	ldr	r1, [r5, r3, asl #2]
	bl	MVC_OutputFrmToVO
	subs	r4, r4, #1
	mov	r7, r0
	beq	.L3433
.L3405:
	sub	r3, fp, #44
	sub	r2, fp, #40
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	movw	r3, #28330
	mov	r2, r4
	cmn	r1, #1
	movt	r3, 42
	mov	r0, r5
	add	r3, r1, r3
	bne	.L3403
.L3433:
	ldr	r3, [r6, #2920]
	cmp	r3, #0
	beq	.L3398
.L3404:
	mov	r4, #0
	b	.L3408
.L3407:
	ldr	r3, [r6, #2920]
	cmp	r3, r4
	bls	.L3398
.L3408:
	ldr	r1, [r8, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3407
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3407
	mov	r0, r5
	bl	MVC_UnMarkFrameStoreRef
	ldr	r3, [r6, #2920]
	cmp	r3, r4
	bhi	.L3408
.L3398:
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
	cmp	r7, #0
	moveq	r0, r7
	bne	.L3409
.L3431:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3402:
	cmp	r3, #0
	mvnne	r7, #0
	bne	.L3404
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
.L3409:
	add	r0, r5, #584
	bl	GetVoLastImageID
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3396:
	ldr	r3, .L3437
	movw	r2, #2844
	ldr	r1, .L3437+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3431
.L3438:
	.align	2
.L3437:
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	MVC_DEC_GetRemainImg, .-MVC_DEC_GetRemainImg
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
	beq	.L3456
	bl	MVC_ClearAllSlice
	movw	r7, #47784
	movw	r6, #47912
	movw	r5, #47848
	movt	r7, 169
	movt	r6, 169
	movt	r5, 169
	mov	r8, #0
	add	r7, r4, r7
	add	r6, r4, r6
	add	r5, r4, r5
	mov	r9, r8
.L3444:
	ldr	r3, [r7]
	mov	r2, #1
	add	r8, r8, r2
	cmp	r3, #0
	beq	.L3441
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3441:
	ldr	r3, [r5]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3442
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3442:
	ldr	r3, [r6]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3443
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3443:
	cmp	r8, #16
	str	r9, [r6], #4
	mov	r2, #0
	str	r9, [r5], #4
	str	r9, [r7], #4
	bne	.L3444
	ldr	r3, [r4, #44]
	add	r5, r4, #11075584
	add	r6, r5, #45056
	str	r3, [r6, #2920]
	str	r2, [r6, #2924]
	str	r2, [r6, #2928]
	str	r2, [r6, #2932]
	str	r2, [r6, #2936]
	ldr	r1, [r4, #520]
	cmp	r1, r2
	beq	.L3446
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3447
.L3451:
	add	r3, r4, #11141120
	add	r3, r3, #16384
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L3449
	ldrsb	r1, [r3, #6]
	mov	r2, #1
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3449:
	mov	r3, #0
	str	r3, [r4, #520]
.L3446:
	ldr	r3, .L3474
	movw	r0, #47996
	mov	r2, #344
	mov	r1, #0
	movt	r0, 169
	add	r0, r4, r0
	ldr	r3, [r3, #48]
	blx	r3
	ldr	ip, [r6, #2920]
	mov	r0, #0
	add	r3, r4, #144
	add	r1, r4, #216
	mov	r2, r0
	str	ip, [r6, #3148]
	str	r0, [r6, #3152]
.L3453:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L3453
	add	r2, r4, #252
	add	r3, r4, #384
	mov	r0, #0
.L3454:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L3454
	add	r2, r5, #40960
	add	r4, r4, #516
	mov	r0, r1
	str	r1, [r2, #1112]
.L3455:
	str	r0, [r3, #4]!
	cmp	r3, r4
	mov	r2, #0
	bne	.L3455
	add	r5, r5, #40960
	mov	r0, r2
	str	r2, [r5, #1116]
.L3440:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3447:
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	cmp	r0, #0
	bne	.L3473
.L3450:
	ldr	r3, [r4, #520]
	cmp	r3, #0
	bne	.L3451
	b	.L3446
.L3473:
	str	r0, [sp]
	movw	r3, #5730
	ldr	r2, .L3474+4
	mov	r0, #22
	ldr	r1, .L3474+8
	bl	dprint_vfmw
	b	.L3450
.L3456:
	mvn	r0, #0
	b	.L3440
.L3475:
	.align	2
.L3474:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+288
	.word	.LC413
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L3485
.L3477:
	mov	r0, r4
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L3478
	movw	r3, #318
	ldr	r2, .L3486
	ldr	r1, .L3486+4
	mov	r0, #22
	bl	dprint_vfmw
.L3478:
	mov	r0, #0
	strb	r0, [r4, #6]
	str	r0, [r4, #220]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3485:
	movw	r3, #313
	ldr	r2, .L3486
	ldr	r1, .L3486+8
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3477
.L3487:
	.align	2
.L3486:
	.word	.LANCHOR0+300
	.word	.LC415
	.word	.LC414
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r5, r0, #11141120
	add	r6, r5, #12288
	mov	r4, r0
	ldrb	r3, [r6, #3483]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3489
	ldrb	r3, [r6, #3481]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3489
.L3490:
	ldr	r3, [r4, #108]
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ubfx	r7, r3, #16, #2
	cmp	r7, r2
	beq	.L3491
	sub	r2, r2, #2
	cmp	r2, #1
	cmpls	r7, #1
	bls	.L3556
.L3491:
	uxtb	r3, r7
	strb	r3, [r4, #8]
	cmp	r3, #2
	beq	.L3494
	cmp	r3, #3
	beq	.L3495
	cmp	r3, #1
	beq	.L3557
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3558
.L3502:
	ldr	r3, [r4, #64]
.L3498:
	ldrb	r2, [r6, #3493]	@ zero_extendqisi2
	strb	r2, [r4, #11]
.L3503:
	cmp	r3, #0
	beq	.L3554
	ldrb	r3, [r6, #3492]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3559
	cmp	r3, #1
	beq	.L3551
.L3553:
	add	r7, r4, #11141120
	add	r7, r7, #16384
.L3506:
	ldr	r2, [r4, #88]
	mov	r0, #2
	ldrb	r3, [r6, #3483]	@ zero_extendqisi2
	sub	r2, r2, #1
	ldr	r1, .L3562
	bl	dprint_vfmw
	ldr	r3, [r7, #112]
	ldr	r2, [r7, #108]
	mov	r1, #1
	strb	r1, [r7, #1450]
	str	r3, [r7, #2184]
	str	r2, [r7, #2188]
	ldr	r3, [r4, #64]
	str	r3, [r7, #2388]
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L3507
	ldrb	r1, [r6, #3492]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L3560
	add	r3, r4, #11075584
	add	r3, r3, #45056
	ldr	r3, [r3, #2924]
	cmp	r3, #0
	bne	.L3509
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #24]
	cmp	r2, #2
	bne	.L3554
.L3512:
	movw	r2, #17832
	movt	r2, 170
	add	r2, r4, r2
	str	r2, [r4, #228]
	ldr	r1, [r3, #944]
	cmp	r1, #1
	beq	.L3561
	cmp	r1, #2
	bne	.L3515
	ldr	r1, [r3, #948]
	cmp	r2, #0
	cmpne	r1, #0
	ble	.L3515
	ldrb	r2, [r6, #3492]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L3515
	mov	r2, #0
	str	r2, [r4, #228]
	ldr	r3, [r7, #40]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	ldr	r2, [r4, #224]
	mov	r0, r4
	ldr	r3, [r2, #948]
	sub	r3, r3, #1
	str	r3, [r2, #948]
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3546
.L3489:
	ldr	r3, [r4, #140]
	ldr	r2, [r4, #144]
	add	r3, r3, #1
	ldr	r1, [r4, #224]
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #140]
	rsb	r3, r2, r3
	str	r3, [r1, #584]
	b	.L3490
.L3556:
	mov	r2, r7
	ldr	r1, .L3562+4
	mov	r0, #2
	bl	dprint_vfmw
	strb	r7, [r4, #8]
.L3495:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mov	r0, r4
	mvn	r1, #0
	bl	MVC_ClearDPB
	mvn	r0, #0
.L3546:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3507:
	ldr	r3, [r4, #224]
.L3515:
	ldr	r2, [r3, #600]
	add	r5, r5, #16384
	mov	r0, #0
	strb	r2, [r5, #1452]
	ldr	r2, [r3, #604]
	strb	r2, [r5, #1453]
	ldr	r2, [r3, #608]
	str	r2, [r5, #1456]
	ldr	r2, [r3, #612]
	str	r2, [r5, #1460]
	ldr	r3, [r3, #652]
	strb	r3, [r5, #1464]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3557:
	ldrb	r3, [r6, #3492]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3502
	add	r7, r5, #16384
	ldr	r3, [r7, #56]
	cmp	r3, #0
	beq	.L3499
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3502
.L3516:
	ldrb	r2, [r6, #3493]	@ zero_extendqisi2
	ldr	r3, [r4, #64]
	strb	r2, [r4, #11]
	b	.L3503
.L3494:
	ldrb	r3, [r6, #3492]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3499
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L3498
	ldr	r2, [r4, #544]
	ldr	r2, [r2, #48]
	cmp	r2, #0
	beq	.L3498
.L3499:
	mov	r3, #1
	mov	r0, r4
	strb	r3, [r6, #3487]
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3546
.L3558:
	ldrb	r3, [r6, #3492]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3502
	b	.L3516
.L3559:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3553
	ldr	r3, [r4, #224]
	ldr	r7, [r3, #24]
	cmp	r7, #0
	bne	.L3553
	add	r5, r5, #16384
	ldr	r1, .L3562+8
	mov	r0, #1
	ldr	r3, [r5, #56]
	ldr	r2, [r5, #60]
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearCurrPic
	ldr	r3, [r5, #40]
	ldr	r0, [r4, #120]
	mov	r2, r7
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3546
.L3551:
	add	r7, r5, #16384
	ldr	r2, [r7, #120]
	cmp	r2, #0
	streqb	r3, [r4, #7]
	b	.L3506
.L3560:
	ldr	r3, .L3562+12
	ldr	r8, [r3]
	cmp	r8, #0
	beq	.L3509
	ldr	r2, [r7, #2392]
	cmp	r2, #0
	beq	.L3517
.L3511:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3511
.L3510:
	sub	r2, fp, #36
	mov	r3, #4
	ldr	r0, [r4, #120]
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	r8
	ldr	r3, [r4, #224]
	b	.L3512
.L3509:
	ldr	r3, [r4, #224]
	b	.L3512
.L3561:
	cmp	r2, #0
	beq	.L3515
	ldrb	r2, [r6, #3492]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L3515
	mov	r2, #0
	str	r2, [r4, #228]
	ldr	r3, [r7, #40]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
.L3554:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3546
.L3517:
	mov	r1, r2
	b	.L3510
.L3563:
	.align	2
.L3562:
	.word	.LC418
	.word	.LC416
	.word	.LC417
	.word	g_event_report
	UNWIND(.fnend)
	.size	MVC_DecVDM, .-MVC_DecVDM
	.align	2
	.global	MVC_FlushDecoder
	.type	MVC_FlushDecoder, %function
MVC_FlushDecoder:
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
	beq	.L3567
	add	r3, r2, #11075584
	mov	r1, #1
	add	r3, r3, #40960
	mov	ip, #0
	strb	r1, [r3, #1069]
	str	ip, [r3, #1120]
	strb	r1, [r2]
	bl	MVC_DecVDM
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	movw	r3, #12515
	ldr	r2, .L3568
	ldr	r1, .L3568+4
	mov	r0, #22
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L3567:
	movw	r2, #12503
	ldr	r1, .L3568+8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L3569:
	.align	2
.L3568:
	.word	.LANCHOR0+316
	.word	.LC419
	.word	.LC403
	UNWIND(.fnend)
	.size	MVC_FlushDecoder, .-MVC_FlushDecoder
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
	ldr	ip, [r1, #12]
	ldr	r3, [r1, #8]
	mov	r4, r0
	ldr	r2, [r1, #4]
	mov	r5, r1
	mov	r0, #7
	add	r6, r4, #11141120
	ldr	r1, .L3633
	str	ip, [sp]
	bl	dprint_vfmw
	add	r3, r6, #16384
	mov	r2, #0
	str	r2, [r3, #2640]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L3628
.L3571:
	ldr	r3, [r4, #232]
	cmp	r3, #0
	beq	.L3591
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3629
.L3574:
	ldr	r1, .L3633+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L3591
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L3591:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3578
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3578
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3578
	ldrb	r3, [r4, #937]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3594
	mov	r2, r4
	mov	r3, #1
	b	.L3581
.L3580:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3592
.L3581:
	ldrb	r1, [r2, #1025]	@ zero_extendqisi2
	add	r2, r2, #88
	cmp	r1, #0
	bne	.L3580
	mov	r1, r3
.L3579:
	mov	r2, #88
	cmn	r1, #1
	mla	r3, r2, r3, r4
	mov	r0, #1
	strb	r0, [r3, #937]
	beq	.L3592
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
	b	.L3584
.L3629:
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bhi	.L3574
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3575
	b	.L3574
.L3628:
	ldr	r3, [r3, #952]
	cmp	r3, #0
	beq	.L3571
	ldr	r3, [r4, #232]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3591
.L3575:
	strb	r2, [r3, #3]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L3630
.L3586:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3587
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3587
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3587
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bls	.L3631
.L3588:
	mov	r2, #1
	strb	r2, [r3, #3]
	ldr	r1, [r5, #16]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3633+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3625
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r5
.L3625:
	ldr	r3, [r4, #232]
.L3584:
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3578:
	ldr	r1, .L3633+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #16]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3633+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3627
.L3626:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	r5
.L3627:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3587:
	ldr	r3, [r4, #232]
	b	.L3588
.L3630:
	ldr	r3, [r3, #952]
	cmp	r3, #0
	bne	.L3625
	b	.L3586
.L3631:
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
	bcc	.L3632
.L3589:
	add	r6, r6, #16384
	mov	r2, #1
	str	r2, [r6, #2640]
	b	.L3584
.L3632:
	mov	r0, r4
	bl	MVC_CombinePacket.part.14
	ldr	r3, [r4, #232]
	b	.L3589
.L3592:
	ldr	r1, .L3633+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearAllNal
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_ClearDPB
	ldr	r3, .L3633+8
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L3626
	b	.L3627
.L3594:
	mov	r1, r3
	b	.L3579
.L3634:
	.align	2
.L3633:
	.word	.LC420
	.word	.LC421
	.word	g_event_report
	.word	.LC423
	.word	.LC422
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r8, r0
	mov	r4, r1
	mov	r0, #22
	ldr	r1, .L3668
	bl	dprint_vfmw
	mov	r0, r8
	bl	MVC_ClearCurrPic
	mov	r0, r8
	bl	MVC_ClearAllNal
	mov	r0, r8
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L3665
.L3636:
	cmp	r4, #0
	beq	.L3637
	add	r1, r8, #584
	ldr	r0, [r8, #120]
	bl	FSP_ClearNotInVoQueue
.L3638:
	movw	r4, #48344
	mov	r10, #0
	movt	r4, 169
	add	r4, r8, r4
	mov	r6, #0
	mov	r7, #0
.L3641:
	add	r5, r4, #608
	add	r9, r4, #640
	mov	r3, #0
	mov	r2, #1
	mvn	lr, #0
	mov	ip, #18
	mov	r0, #16
	mov	r1, #2
	str	r10, [r4, #220]
	str	r4, [r4, #788]
	str	r4, [r4, #752]
	str	r4, [r4, #716]
	strb	r3, [r4, #1]
	strb	r3, [r4, #2]
	strb	r3, [r4, #3]
	str	r3, [r4, #28]
	str	r3, [r4, #20]
	str	r3, [r4, #32]
	strb	r3, [r4, #5]
	strb	r3, [r4, #712]
	str	lr, [r4, #24]
	strb	r2, [r4, #7]
	strb	r2, [r4, #748]
	str	ip, [r4, #48]
	str	r0, [r4, #52]
	strb	r1, [r4, #784]
.L3640:
	ldrd	r2, [r5, #8]!
	orrs	r1, r2, r3
	bne	.L3666
.L3639:
	cmp	r5, r9
	bne	.L3640
	add	r10, r10, #1
	add	r4, r4, #824
	cmp	r10, #40
	bne	.L3641
	movw	r9, #16352
	add	r6, r8, #11141120
	movt	r9, 170
	add	r7, r6, #16320
	add	r9, r8, r9
	mov	r4, #0
	mov	r5, #0
.L3643:
	ldrd	r2, [r7, #8]!
	orrs	r1, r2, r3
	bne	.L3667
.L3642:
	cmp	r7, r9
	bne	.L3643
	ldr	r3, [r8, #60]
	cmp	r3, #0
	beq	.L3647
	mov	r4, #0
	add	r5, r8, #524
	mov	r7, r4
.L3646:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3645
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	str	r7, [r5]
	ldr	r3, [r8, #60]
.L3645:
	cmp	r3, r4
	bhi	.L3646
.L3647:
	add	r5, r8, #11075584
	ldr	ip, .L3668+4
	add	r3, r5, #45056
	add	r5, r5, #40960
	mov	r4, #0
	movw	r0, #42024
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
	ldr	r7, [ip, #48]
	strb	r4, [r3, #676]
	strb	r4, [r5, #2768]
	strb	r4, [r3, #677]
	strb	r4, [r5, #2769]
	blx	r7
	add	r2, r6, #12288
	add	r6, r6, #16384
	mov	r1, #2
	mov	r3, #1
	strb	r1, [r5, #1064]
	strb	r3, [r5, #1069]
	mov	r0, r4
	strb	r4, [r2, #3480]
	mov	r3, #256
	strb	r4, [r6, #872]
	str	r4, [r6, #876]
	str	r3, [r6, #880]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3666:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r5]
	b	.L3639
.L3667:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r4, [r7]
	b	.L3642
.L3637:
	add	r0, r8, #584
	bl	ResetVoQueue
	ldr	r0, [r8, #120]
	bl	FSP_EmptyInstance
	b	.L3638
.L3665:
	movw	r3, #343
	ldr	r2, .L3668+8
	ldr	r1, .L3668+12
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3636
.L3669:
	.align	2
.L3668:
	.word	.LC424
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+336
	.word	.LC415
	UNWIND(.fnend)
	.size	MVC_ClearAll, .-MVC_ClearAll
	.align	2
	.global	MVC_InsertFrmInDPB
	.type	MVC_InsertFrmInDPB, %function
MVC_InsertFrmInDPB:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	mov	r4, r2
	ldrb	r9, [r4, #3]	@ zero_extendqisi2
	mov	r5, r0
	ldr	r3, [r3, #2924]
	mov	r6, r1
	cmp	r3, #0
	ldreq	r2, .L3771
	streq	r3, [r2, #-1884]
	cmp	r9, #1
	beq	.L3673
	bcc	.L3674
	cmp	r9, #2
	beq	.L3675
	mov	r2, r9
	ldr	r1, .L3771+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	mov	r1, #1
	bl	MVC_ClearAll
	mov	r0, #0
.L3679:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3675:
	ldr	r3, [r4, #656]
	mov	r2, #3
	strb	r2, [r3, #712]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3695
	add	r8, r0, r3
	add	r2, r8, #11075584
	str	r2, [fp, #-64]
	add	r7, r2, #45056
	ldr	r2, [r7, #2728]
	cmp	r2, #0
	beq	.L3695
	strb	r9, [r2, #784]
	ldr	r3, [r7, #2728]
	ldr	r2, [r4, #656]
	str	r2, [r3, #788]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #785]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #786]
	ldr	r3, [r7, #2728]
	ldr	r2, [r4, #688]
	str	r2, [r3, #800]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #787]
	ldr	r3, [r7, #2728]
	ldr	r2, [r4, #708]
	str	r2, [r3, #808]
	ldr	r3, [r7, #2728]
	ldr	r1, [r3, #772]
	ldr	r2, [r3, #808]
	add	r2, r2, r1
	str	r2, [r3, #736]
	str	r2, [r3, #44]
	add	r1, r4, #16
	ldr	r2, [r7, #2728]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r7, #2728]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #2728]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #4]
	mov	r2, #640
	ldr	r3, [r7, #2728]
	add	ip, r3, #672
	add	r0, r3, #72
	ldr	r10, [r3, #656]
	ldrd	r8, [ip, #-8]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip]
	strd	r8, [fp, #-60]
	ldr	r9, [r3, #660]
	bl	memcpy
	add	r3, r4, #608
	and	r2, r10, r9
	ldmdb	r3, {r0, r1}
	adds	r2, r2, #1
	and	r1, r1, r0
	movne	r2, #1
	cmn	r1, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r7, #2728]
	strne	r9, [r2, #660]
	strne	r10, [r2, #656]
	add	r2, r4, #624
	ldrd	r0, [r3]
	ldrd	r8, [fp, #-52]
	ldr	r3, [r7, #2728]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #672
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r3, #-8]
	ldrd	r0, [r2, #-8]
	ldr	r3, [r7, #2728]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #672
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3707
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3707
.L3708:
	ldr	r3, [fp, #-64]
	add	r8, r3, #45056
	ldr	r2, [r8, #2728]
	ldrb	r3, [r2, #787]	@ zero_extendqisi2
	ldrb	r1, [r2, #751]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r8, #2728]
	ldr	r2, [r4, #704]
	str	r2, [r3, #804]
	ldr	r2, [r8, #2728]
	ldr	r3, [r2, #804]
	ldr	r1, [r2, #768]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r2, #36]
	ldr	r0, [r8, #2728]
	bl	MVC_CombineFldsToFrm
	ldr	r2, [r8, #2728]
	ldrb	r1, [r4, #11]	@ zero_extendqisi2
	movw	r3, #28418
	movt	r3, 42
	strb	r1, [r2, #13]
	ldrb	r1, [r4, #10]	@ zero_extendqisi2
	ldr	r2, [r8, #2728]
	strb	r1, [r2, #11]
	ldr	r2, [r8, #2728]
	ldr	r1, [r2, #52]
	ldr	r2, [r2, #800]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3694
.L3674:
	add	r3, r0, r1, lsl #2
	ldr	r2, [r4, #656]
	add	r10, r3, #11075584
	mov	r3, #3
	add	r7, r10, #45056
	str	r2, [r7, #2728]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2, #1]
	ldr	r2, [r7, #2728]
	strb	r3, [r2, #2]
	ldr	r1, [r4, #656]
	ldr	r2, [r7, #2728]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #656]
	ldr	r2, [r7, #2728]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r7, #2728]
	cmp	r1, #0
	beq	.L3770
.L3676:
	strb	r3, [r2, #3]
	add	r1, r4, #16
	ldr	r3, [r7, #2728]
	mov	r2, #640
	ldr	r0, [r4, #732]
	mov	r8, #0
	str	r0, [r3, #48]
	ldr	r0, [r7, #2728]
	add	r0, r0, #72
	bl	memcpy
	ldr	r2, [r7, #2728]
	ldr	r0, [r4, #708]
	add	r3, r10, #45056
	mov	lr, #1
	ldr	r1, .L3771
	mov	ip, #2
	str	r0, [r2, #736]
	str	r0, [r2, #44]
	ldr	r2, [r7, #2728]
	ldr	r0, [r4, #656]
	str	r0, [r2, #788]
	str	r0, [r2, #752]
	str	r0, [r2, #716]
	ldr	r2, [r7, #2728]
	ldr	r0, [r4, #668]
	str	r0, [r2, #28]
	ldr	r2, [r7, #2728]
	ldr	r0, [r4, #664]
	str	r0, [r2, #20]
	ldr	r2, [r7, #2728]
	strb	r8, [r2, #712]
	ldr	r2, [r7, #2728]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #713]
	ldr	r2, [r7, #2728]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #714]
	ldr	r2, [r7, #2728]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #715]
	strb	r0, [r2]
	ldr	r2, [r7, #2728]
	ldrb	r0, [r4, #9]	@ zero_extendqisi2
	str	r0, [r2, #40]
	ldr	r2, [r7, #2728]
	ldr	r0, [r4, #676]
	str	r0, [r2, #32]
	ldr	r0, [r4, #680]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #728]
	ldr	r0, [r4, #684]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #764]
	ldr	r0, [r4, #688]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #800]
	ldr	r0, [r4, #692]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #36]
	ldr	r0, [r4, #696]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #732]
	ldr	r0, [r4, #700]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #768]
	ldr	r0, [r4, #704]
	ldr	r2, [r7, #2728]
	str	r0, [r2, #804]
	ldrb	r2, [r4, #7]	@ zero_extendqisi2
	ldr	r0, [r7, #2728]
	cmp	r2, lr
	mov	r2, r8
	moveq	r9, #3
	strb	r9, [r0, #4]
	ldr	r7, [r3, #2728]
	mov	r0, r5
	ldr	r9, [r4, #736]
	str	r9, [r7, #56]
	ldr	r7, [r3, #2728]
	ldr	r9, [r4, #740]
	str	r9, [r7, #60]
	ldr	r7, [r3, #2728]
	ldrb	r9, [r4, #11]	@ zero_extendqisi2
	strb	r9, [r7, #13]
	strb	r9, [r7, #12]
	ldrb	r10, [r4, #10]	@ zero_extendqisi2
	ldr	r9, [r3, #2728]
	ldr	r7, [r1, #-1884]
	strb	r10, [r9, #11]
	strb	r10, [r9, #10]
	ldr	r9, [r3, #2728]
	str	r7, [r9, #64]
	add	r7, r7, lr
	ldr	r3, [r3, #2728]
	str	r7, [r1, #-1884]
	ldrb	r9, [r3, #713]	@ zero_extendqisi2
	ldr	r1, [r3, #716]
	ldrb	r7, [r3, #714]	@ zero_extendqisi2
	strb	lr, [r3, #748]
	strb	ip, [r3, #784]
	ldr	lr, [r3, #736]
	ldrb	ip, [r3, #715]	@ zero_extendqisi2
	strb	r9, [r3, #749]
	strb	r9, [r3, #785]
	strb	r7, [r3, #750]
	strb	r7, [r3, #786]
	str	lr, [r3, #772]
	str	lr, [r3, #808]
	strb	ip, [r3, #751]
	strb	ip, [r3, #787]
	str	r1, [r3, #752]
	str	r1, [r3, #788]
	ldr	r1, [r4, #656]
	bl	MVC_GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2149
	movne	r0, r8
	bne	.L3768
.L3694:
	movw	r3, #28330
	movt	r3, 42
	add	r3, r6, r3
	ldr	r3, [r5, r3, asl #2]
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3679
	ldr	r0, [r5, #120]
	mov	r2, #1
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3673:
	ldr	r3, [r4, #656]
	mov	r2, #3
	strb	r2, [r3, #712]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3680
	add	r8, r0, r3
	add	r2, r8, #11075584
	str	r2, [fp, #-64]
	add	r7, r2, #45056
	ldr	r2, [r7, #2728]
	cmp	r2, #0
	beq	.L3680
	strb	r9, [r2, #748]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #751]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #749]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #750]
	ldr	r3, [r7, #2728]
	ldr	r2, [r4, #684]
	str	r2, [r3, #764]
	ldr	r3, [r7, #2728]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #751]
	ldr	r3, [r7, #2728]
	ldr	r2, [r4, #708]
	str	r2, [r3, #772]
	ldr	r3, [r7, #2728]
	ldr	r1, [r3, #772]
	ldr	r2, [r3, #808]
	add	r2, r2, r1
	str	r2, [r3, #736]
	str	r2, [r3, #44]
	add	r1, r4, #16
	ldr	r2, [r7, #2728]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r7, #2728]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #2728]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	orreq	r2, r2, #1
	strb	r2, [r3, #4]
	mov	r2, #640
	ldr	r3, [r7, #2728]
	add	ip, r3, #672
	add	r0, r3, #72
	ldr	r10, [r3, #656]
	ldrd	r8, [ip, #-8]
	strd	r8, [fp, #-52]
	ldrd	r8, [ip]
	strd	r8, [fp, #-60]
	ldr	r9, [r3, #660]
	bl	memcpy
	add	r3, r4, #608
	and	r2, r10, r9
	ldmdb	r3, {r0, r1}
	adds	r2, r2, #1
	and	r1, r1, r0
	movne	r2, #1
	cmn	r1, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r7, #2728]
	strne	r9, [r2, #660]
	strne	r10, [r2, #656]
	add	r2, r4, #624
	ldrd	r0, [r3]
	ldrd	r8, [fp, #-52]
	ldr	r3, [r7, #2728]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #672
	movhi	r0, r8
	movhi	r1, r9
	ldrd	r8, [fp, #-60]
	strd	r0, [r3, #-8]
	ldrd	r0, [r2, #-8]
	ldr	r3, [r7, #2728]
	cmp	r1, r9
	cmpeq	r0, r8
	add	r3, r3, #672
	movhi	r0, r8
	movhi	r1, r9
	strd	r0, [r3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3691
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3691
.L3692:
	ldr	r3, [fp, #-64]
	add	r8, r3, #45056
	ldr	r2, [r8, #2728]
	ldrb	r3, [r2, #787]	@ zero_extendqisi2
	ldrb	r1, [r2, #751]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r8, #2728]
	ldr	r2, [r4, #700]
	str	r2, [r3, #768]
	ldr	r2, [r8, #2728]
	ldr	r3, [r2, #804]
	ldr	r1, [r2, #768]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r2, #36]
	ldr	r3, [r8, #2728]
	ldrb	r2, [r4, #11]	@ zero_extendqisi2
	strb	r2, [r3, #12]
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	ldr	r3, [r8, #2728]
	strb	r2, [r3, #10]
	ldr	r0, [r8, #2728]
	bl	MVC_CombineFldsToFrm
	ldr	r2, [r8, #2728]
	movw	r3, #28402
	movt	r3, 42
	ldr	r1, [r2, #52]
	ldr	r2, [r2, #764]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3694
.L3680:
	add	r7, r5, r3
	ldr	r2, [r4, #656]
	add	r7, r7, #11075584
	mov	r1, #1
	add	r3, r7, #45056
	str	r2, [r3, #2728]
	strb	r1, [r2, #748]
	ldr	r2, [r3, #2728]
	ldr	r0, [r4, #656]
	str	r0, [r2, #752]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #749]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #750]
	ldr	r2, [r3, #2728]
	ldr	r0, [r4, #684]
	str	r0, [r2, #764]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #751]
	ldr	r2, [r3, #2728]
	ldr	r0, [r4, #708]
	str	r0, [r2, #772]
	ldr	r2, [r3, #2728]
	ldr	r0, [r2, #772]
	str	r0, [r2, #736]
	str	r0, [r2, #44]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	strb	r0, [r2, #1]
	ldr	r2, [r3, #2728]
	strb	r1, [r2, #2]
	ldr	r1, [r4, #656]
	ldr	r2, [r3, #2728]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #656]
	ldr	r2, [r3, #2728]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3682
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3682
.L3683:
	add	r7, r7, #45056
	mov	r8, #0
	mov	r2, #640
	add	r1, r4, #16
	ldr	r3, [r7, #2728]
	str	r8, [r3, #40]
	ldr	r0, [r7, #2728]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #732]
	mov	r2, #1
	ldr	ip, .L3771
	mov	r0, r5
	str	r1, [r3, #48]
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #664]
	str	r1, [r3, #20]
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #676]
	str	r1, [r3, #32]
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #692]
	str	r1, [r3, #36]
	ldr	r3, [r7, #2728]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #700]
	str	r1, [r3, #768]
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #736]
	str	r1, [r3, #56]
	ldr	r3, [r7, #2728]
	ldr	r1, [r4, #740]
	str	r1, [r3, #60]
	ldr	r3, [r7, #2728]
	ldrb	r1, [r4, #11]	@ zero_extendqisi2
	strb	r1, [r3, #12]
	ldr	r3, [r7, #2728]
	ldrb	r1, [r4, #10]	@ zero_extendqisi2
	strb	r1, [r3, #10]
	ldr	r3, [ip, #-1884]
	ldr	r1, [r7, #2728]
	str	r3, [r1, #64]
	add	r3, r3, r2
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	lr, [r7, #2728]
	str	r3, [ip, #-1884]
	rsb	r3, r2, r1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [lr, #4]
	ldr	r1, [r4, #656]
	bl	MVC_GetAPC
	cmp	r0, #0
	beq	.L3694
	mov	r3, r0
	movw	r2, #2212
	mov	r0, r8
.L3768:
	ldr	r1, .L3771+8
	bl	dprint_vfmw
	mov	r0, r5
	mvn	r1, #0
	bl	MVC_ClearDPB
	mvn	r0, #0
	b	.L3679
.L3695:
	add	r7, r5, r3
	ldr	r2, [r4, #656]
	add	r7, r7, #11075584
	mov	r1, #2
	add	r3, r7, #45056
	str	r2, [r3, #2728]
	strb	r1, [r2, #784]
	ldr	r2, [r3, #2728]
	ldr	r0, [r4, #656]
	str	r0, [r2, #788]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #785]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #786]
	ldr	r2, [r3, #2728]
	ldr	r0, [r4, #688]
	str	r0, [r2, #800]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #787]
	ldr	r2, [r3, #2728]
	ldr	r0, [r4, #708]
	str	r0, [r2, #808]
	ldr	r2, [r3, #2728]
	ldr	r0, [r2, #772]
	str	r0, [r2, #736]
	str	r0, [r2, #44]
	ldr	r2, [r3, #2728]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	strb	r0, [r2, #1]
	ldr	r2, [r3, #2728]
	strb	r1, [r2, #2]
	ldr	r1, [r4, #656]
	ldr	r2, [r3, #2728]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #656]
	ldr	r2, [r3, #2728]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3697
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3697
.L3698:
	add	r7, r7, #45056
	mov	r8, #0
	mov	r2, #640
	add	r1, r4, #16
	ldr	r3, [r7, #2728]
	str	r8, [r3, #40]
	ldr	r0, [r7, #2728]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #732]
	mov	r2, #2
	ldr	r1, .L3771
	mov	r0, r5
	str	ip, [r3, #48]
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #664]
	str	ip, [r3, #20]
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #676]
	str	ip, [r3, #32]
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #692]
	str	ip, [r3, #36]
	ldr	r3, [r7, #2728]
	ldrb	ip, [r4, #12]	@ zero_extendqisi2
	strb	ip, [r3, #787]
	strb	ip, [r3]
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #704]
	str	ip, [r3, #804]
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #736]
	str	ip, [r3, #56]
	ldr	r3, [r7, #2728]
	ldr	ip, [r4, #740]
	str	ip, [r3, #60]
	ldr	r3, [r7, #2728]
	ldrb	ip, [r4, #11]	@ zero_extendqisi2
	strb	ip, [r3, #13]
	ldrb	ip, [r4, #10]	@ zero_extendqisi2
	ldr	r3, [r7, #2728]
	strb	ip, [r3, #11]
	ldr	ip, [r7, #2728]
	ldr	r3, [r1, #-1884]
	str	r3, [ip, #64]
	add	r3, r3, #1
	ldrb	lr, [r4, #7]	@ zero_extendqisi2
	ldr	ip, [r7, #2728]
	cmp	lr, #1
	str	r3, [r1, #-1884]
	moveq	r9, r2
	movne	r9, r8
	strb	r9, [ip, #4]
	ldr	r1, [r4, #656]
	bl	MVC_GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2337
	movne	r0, r8
	beq	.L3694
	b	.L3768
.L3770:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3676
.L3697:
	ldr	r2, [r3, #2728]
	mov	r1, #2
	strb	r1, [r2, #3]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	ldreq	r3, [r3, #2728]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #28]
	b	.L3698
.L3682:
	ldr	r2, [r3, #2728]
	mov	r1, #1
	strb	r1, [r2, #3]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, r1
	ldreq	r3, [r3, #2728]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #28]
	b	.L3683
.L3691:
	ldr	r2, [r7, #2728]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #2728]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #28]
	b	.L3692
.L3707:
	ldr	r2, [r7, #2728]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #2728]
	ldreq	r2, [r4, #668]
	streq	r2, [r3, #28]
	b	.L3708
.L3772:
	.align	2
.L3771:
	.word	.LANCHOR3
	.word	.LC426
	.word	.LC425
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
	add	r3, r0, #11075584
	add	r2, r3, #40960
	mov	r10, r0
	str	r2, [fp, #-56]
	ldrb	r8, [r2, #1065]	@ zero_extendqisi2
	str	r1, [fp, #-52]
	cmp	r8, #0
	beq	.L3774
	ldrb	r2, [r2, #1066]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r8, #2
	moveq	r8, #1
.L3774:
	ldr	r2, [fp, #-52]
	cmp	r2, #1
	ldrb	r2, [r10, #8]	@ zero_extendqisi2
	beq	.L3775
	cmp	r2, #2
	beq	.L3857
	add	r2, r10, #11141120
	str	r2, [fp, #-48]
	mov	r1, r2
	sub	r2, r8, #1
	add	r9, r1, #12288
	cmp	r2, #1
	mov	r2, #0
	strb	r2, [r9, #3481]
	bls	.L3858
.L3797:
	mov	lr, #0
	strb	lr, [r9, #3480]
	ldr	r7, [r10, #48]
	cmp	r7, lr
	beq	.L3804
	movw	r4, #48344
	movw	r5, #47784
	movt	r4, 169
	movt	r5, 169
	add	r6, r3, #45056
	add	r4, r10, r4
	add	r5, r10, r5
.L3803:
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3799
	cmp	r4, #0
	beq	.L3800
	ldr	r0, [r6, #2920]
	cmp	r0, #0
	beq	.L3800
	ldr	r2, [r6, #2728]
	rsb	r3, r4, r2
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L3799
	mov	r1, r5
	b	.L3801
.L3802:
	ldr	r2, [r1, #4]!
	rsb	ip, r4, r2
	cmp	r2, #0
	clz	ip, ip
	mov	ip, ip, lsr #5
	moveq	ip, #0
	cmp	ip, #0
	bne	.L3799
.L3801:
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L3802
.L3800:
	mov	r5, #824
	ldr	r3, [fp, #-48]
	mla	r5, r5, lr, r10
	add	r6, r3, #16384
	movw	r1, #48416
	add	r0, r9, #3488
	mov	r7, #0
	mov	r3, #1
	add	r2, r5, #11075584
	strb	r3, [r9, #3480]
	add	r2, r2, #48384
	str	r4, [r6, #40]
	movt	r1, 169
	add	r0, r0, #8
	str	r7, [r2, #4]
	add	r1, r5, r1
	mov	r2, #101
	str	r2, [r6, #92]
	mov	r2, #640
	str	r3, [fp, #-48]
	bl	memcpy
	movw	r2, #48344
	movt	r2, 169
	add	r2, r5, r2
	str	r7, [r9, #3648]
	strb	r7, [r2, #4]
	strb	r7, [r4, #7]
	ldr	r2, [r6, #40]
	ldr	r3, [fp, #-48]
	strb	r7, [r2, #3]
	ldr	r2, [r6, #40]
	strb	r3, [r2, #5]
	ldr	r3, [r6, #40]
	str	r7, [r3, #16]
	ldrb	r3, [r9, #3480]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3804
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	ldr	r0, [r10, #120]
	clz	r1, r3
	mov	r1, r1, lsr #5
	bl	FSP_NewLogicFs
	mov	r4, r0
	mov	r1, r0
	ldr	r0, [r10, #120]
	bl	FSP_GetLogicFs
	mvn	r2, r4
	mov	r2, r2, lsr #31
	ldr	r3, [fp, #-48]
	cmp	r0, #0
	mov	r5, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3805
	ldr	r3, [r10, #224]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L3859
.L3806:
	ldr	r7, .L3866
	mov	r2, #640
	ldr	r0, [r6, #40]
	add	r1, r5, #40
	ldr	r3, [r7, #52]
	add	r0, r0, #72
	blx	r3
	ldr	r1, [r6, #40]
	movw	r0, #15784
	ldr	r3, [r7, #52]
	movt	r0, 170
	add	r1, r1, #72
	add	r0, r10, r0
	mov	r2, #640
	blx	r3
	ldr	r3, [r6, #40]
	strb	r4, [r3, #6]
	ldrsb	r3, [r5, #4]
	str	r3, [r6, #116]
.L3796:
	ldr	r3, [fp, #-52]
	uxtb	r2, r8
	strb	r2, [r9, #3483]
	cmp	r3, #1
	moveq	r0, #0
	beq	.L3850
	ldr	r3, [fp, #-56]
	ldr	r1, [r6, #40]
	ldrb	r3, [r3, #1065]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	strb	r3, [r1, #712]
	ldrb	r3, [r9, #3481]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3860
	strb	r2, [r6, #872]
	cmp	r8, #0
	ldr	r2, [fp, #-56]
	movne	r0, #0
	moveq	r0, r8
	ldr	r3, [r2, #1092]
	str	r3, [r6, #880]
	ldrb	r3, [r2, #1072]	@ zero_extendqisi2
	str	r3, [r6, #876]
	ldr	r3, [r10, #128]
	str	r3, [r6, #884]
	ldr	r3, [r2, #2704]
	str	r4, [r6, #888]
	streqb	r8, [r6, #873]
	str	r3, [r6, #896]
	movne	r3, #1
	strneb	r3, [r6, #873]
.L3850:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3799:
	add	lr, lr, #1
	add	r4, r4, #824
	cmp	lr, r7
	bne	.L3803
.L3804:
	ldr	r1, .L3866+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r10
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3857:
	add	r9, r10, #11141120
	str	r9, [fp, #-48]
	add	r9, r9, #12288
.L3794:
	mov	r2, #0
	strb	r2, [r9, #3481]
	b	.L3797
.L3775:
	cmp	r2, #2
	beq	.L3861
	add	r2, r10, #11141120
	str	r2, [fp, #-48]
	mov	r1, r2
	add	r9, r1, #12288
	mov	r2, #0
	mov	r8, r2
	strb	r2, [r9, #3481]
	b	.L3797
.L3859:
	ldr	r3, [r10, #16]
	ldr	r1, [r0, #152]
	ldr	r2, [r10, #12]
	mov	r3, r3, asl #4
	str	r3, [r0, #112]
	ldr	r0, [r0, #76]
	mul	r3, r1, r3
	mov	r2, r2, asl #4
	str	r2, [r5, #108]
	add	r0, r3, r0
	str	r0, [r5, #80]
	str	r3, [fp, #-48]
	bl	MEM_Phy2Vir
	ldr	r1, [r5, #60]
	ldr	r3, [fp, #-48]
	ldr	r2, [r5, #156]
	add	r3, r3, r1
	str	r7, [r5, #556]
	str	r3, [r5, #64]
	add	r3, r3, r2
	str	r3, [r5, #72]
	str	r0, [r5, #552]
	b	.L3806
.L3858:
	add	r6, r1, #16384
	ldrb	r2, [r6, #872]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3778
	ldr	r1, [fp, #-56]
	ldr	r0, [r6, #896]
	ldr	r1, [r1, #2704]
	cmp	r0, r1
	beq	.L3779
.L3778:
	add	r2, r3, #45056
	ldr	r0, [r2, #2920]
	subs	r2, r0, #1
	bmi	.L3797
	movw	r1, #28330
	ldr	lr, [fp, #-56]
	movt	r1, 42
	add	r1, r0, r1
	add	r1, r10, r1, lsl #2
	b	.L3790
.L3781:
	cmp	r8, #2
	beq	.L3862
.L3780:
	subs	r2, r2, #1
	bmi	.L3797
.L3790:
	ldr	r4, [r1, #-4]!
	cmp	r4, #0
	beq	.L3780
	cmp	r8, #1
	bne	.L3781
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	cmp	r0, #2
	bne	.L3780
.L3782:
	ldr	ip, [lr, #1092]
	ldr	r0, [r4, #20]
	cmp	ip, r0
	bne	.L3780
	ldr	ip, [lr, #2704]
	ldr	r0, [r4, #56]
	cmp	ip, r0
	bne	.L3780
	ldrb	r0, [lr, #1072]	@ zero_extendqisi2
	cmp	r0, #0
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	beq	.L3863
	cmp	r0, #0
	beq	.L3780
.L3786:
	add	r0, r9, #3488
	mov	r2, #1
	add	r1, r4, #72
	strb	r2, [r9, #3481]
	add	r0, r0, #8
	mov	r2, #640
	str	r4, [r6, #40]
	str	r3, [fp, #-60]
	bl	memcpy
	ldrsb	r1, [r4, #6]
	ldr	r0, [r10, #120]
	bl	FSP_GetLogicFs
	ldr	r3, [fp, #-60]
	subs	r2, r0, #0
	beq	.L3864
	ldrsb	r2, [r2, #4]
	str	r2, [r6, #116]
	ldrb	r2, [r9, #3481]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3797
	ldr	r2, [r6, #40]
	cmp	r2, #0
	beq	.L3797
.L3854:
	mov	r4, #0
	b	.L3796
.L3862:
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	cmp	r0, #1
	bne	.L3780
	b	.L3782
.L3860:
	ldr	r1, [fp, #-56]
	mov	r3, #0
	strb	r3, [r6, #872]
	mov	r0, r3
	ldr	r2, [r1, #1092]
	str	r2, [r6, #880]
	ldrb	r2, [r1, #1072]	@ zero_extendqisi2
	str	r2, [r6, #876]
	ldr	r2, [r10, #128]
	strb	r3, [r6, #873]
	str	r4, [r6, #888]
	str	r2, [r6, #884]
	ldr	r3, [r1, #2704]
	str	r3, [r6, #896]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3861:
	add	r9, r10, #11141120
	mov	r8, #0
	str	r9, [fp, #-48]
	add	r9, r9, #12288
	b	.L3794
.L3863:
	cmp	r0, #0
	bne	.L3780
	b	.L3786
.L3779:
	sub	r4, r8, #2
	cmp	r2, #1
	cmpeq	r8, #2
	clz	r4, r4
	mov	r4, r4, lsr #5
	beq	.L3791
	cmp	r8, #1
	cmpeq	r2, #2
	bne	.L3797
.L3791:
	ldr	r2, [fp, #-56]
	ldr	r1, [r6, #880]
	ldr	r2, [r2, #1092]
	cmp	r1, r2
	bne	.L3797
	ldr	r2, [fp, #-56]
	ldrb	r2, [r2, #1072]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [r6, #876]
	bne	.L3792
	cmp	r2, #0
	bne	.L3797
.L3793:
	ldr	r2, [r10, #128]
	ldr	r1, [r10, #124]
	rsb	r2, r1, r2
	cmp	r2, #2
	bhi	.L3797
	mov	r2, #1
	strb	r2, [r9, #3481]
	ldr	r2, [r6, #40]
	cmp	r2, #0
	beq	.L3794
	cmp	r4, #0
	bne	.L3865
	cmp	r8, #1
	bne	.L3796
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L3794
	b	.L3796
.L3805:
	strb	r2, [r9, #3480]
	mov	r0, r2
	ldr	ip, [r6, #40]
	ldr	r1, .L3866+8
	str	r3, [fp, #-48]
	strb	r2, [ip, #5]
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	mov	r0, r10
	mov	r1, r3
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3850
.L3864:
	movw	r2, #6392
	ldr	r1, .L3866+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3850
.L3865:
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L3794
	b	.L3854
.L3792:
	cmp	r2, #0
	beq	.L3797
	b	.L3793
.L3867:
	.align	2
.L3866:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC428
	.word	.LC429
	.word	.LC427
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r1
	mov	r6, r0
	moveq	r4, #1
	movne	r4, #0
	beq	.L3878
	ldr	r8, .L3882
	movw	r2, #19040
	ldr	r7, [r0, #928]
	movt	r2, 170
	mov	r1, r4
	ldr	r3, [r8, #48]
	blx	r3
	add	r0, r6, #584
	str	r7, [r6, #928]
	bl	ResetVoQueue
	str	r4, [r6, #228]
	strb	r4, [r6]
	mov	r4, #2240
	str	r5, [r6, #224]
	ldr	r3, [r5, #28]
	cmp	r3, #25
	ldreq	r3, [r5, #708]
	movne	r3, #32
	movne	r2, #256
	strne	r3, [r6, #36]
	movne	r3, #136
	streq	r3, [r6, #36]
	ldreq	r3, [r5, #712]
	streq	r3, [r6, #40]
	ldreq	r3, [r5, #700]
	str	r3, [r6, #32]
	strne	r2, [r6, #40]
	ldr	r0, [r5, #592]
	bl	MEM_Phy2Vir
	ldr	ip, [r6, #36]
	ldr	r3, [r6, #224]
	movw	r2, #3992
	ldr	r1, [r6, #40]
	mul	r2, r2, ip
	ldr	r3, [r3, #588]
	add	r3, r0, r3
	str	r3, [r6, #248]
	add	r0, r3, r2
	str	r0, [r6, #252]
	cmp	r3, #0
	cmpne	r0, #0
	mla	r0, r4, r1, r0
	moveq	lr, #1
	movne	lr, #0
	cmp	r0, #0
	orreq	lr, lr, #1
	cmp	lr, #0
	str	r0, [r6, #544]
	bne	.L3879
	ldr	r5, [r5, #624]
	cmp	r5, #0
	beq	.L3880
.L3874:
	add	r3, r6, #11075584
	movw	r2, #4060
	add	lr, r3, #36864
	add	r3, r3, #32768
	ldr	r9, [r8, #48]
	add	r4, r6, #12992
	str	r1, [lr, #1808]
	mov	r1, #0
	str	ip, [r3, #2632]
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
.L3875:
	strb	r3, [r0]
	add	r2, r0, #274432
	add	r0, r0, #335872
	mov	r4, #0
	add	r0, r0, #308
	strb	r3, [r2, #241]
	cmp	r0, r7
	bne	.L3875
	add	r2, r6, #12288
	movw	r3, #34656
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
	beq	.L3881
	mov	r1, r4
	mov	r0, r6
	bl	MVC_ClearAll
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3880:
	mov	r0, r3
	mov	r1, r5
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r2, [r6, #40]
	mov	r1, r5
	ldr	r3, [r8, #48]
	ldr	r0, [r6, #252]
	mul	r2, r4, r2
	blx	r3
	ldr	r1, [r6, #40]
	ldr	ip, [r6, #36]
	ldr	r0, [r6, #544]
	b	.L3874
.L3878:
	movw	r2, #13415
	ldr	r1, .L3882+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3879:
	movw	r3, #13451
	ldr	r2, .L3882+8
	ldr	r1, .L3882+12
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3881:
	mov	r0, r4
	ldr	r1, .L3882+16
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3883:
	.align	2
.L3882:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC430
	.word	.LANCHOR0+352
	.word	.LC431
	.word	.LC432
	UNWIND(.fnend)
	.size	MVC_DEC_Init, .-MVC_DEC_Init
	.align	2
	.global	MVC_StorePicInDpb
	.type	MVC_StorePicInDpb, %function
MVC_StorePicInDpb:
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
	add	r3, r0, #11141120
	add	r4, r0, #11075584
	add	r10, r3, #12288
	add	r2, r4, #36864
	mov	r7, #0
	str	r3, [fp, #-64]
	mov	r5, r0
	strb	r7, [r2, #4024]
	ldrb	r3, [r10, #3483]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #4025]
	ldrb	r3, [r10, #3480]	@ zero_extendqisi2
	cmp	r3, r7
	beq	.L4056
	ldr	r3, [r0, #128]
	str	r3, [r0, #124]
	ldrb	r3, [r10, #3493]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r6, r0, #11141120
	addeq	r6, r6, #16384
	bne	.L4057
.L3887:
	ldrb	r0, [r5, #8]	@ zero_extendqisi2
	cmp	r0, #2
	beq	.L4058
	ldr	r8, [r5, #224]
	ldr	r3, [r8, #24]
	cmp	r3, #0
	bne	.L3892
	ldr	r2, [r5, #220]
	cmp	r2, #2
	beq	.L3894
	ldrb	r2, [r10, #3482]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3894
.L3964:
	ldrb	r1, [r10, #3483]	@ zero_extendqisi2
	ldr	r7, [r6, #40]
	sub	r2, r1, #1
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	cmp	r1, #0
	beq	.L3896
	ldrb	r0, [r7, #2]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	ip, r2
	orrne	ip, r2, #1
	cmp	ip, #0
	beq	.L3895
	cmp	r2, #0
	beq	.L4059
.L3969:
	ldr	r2, [r5, #220]
	cmp	r2, #0
	bne	.L3899
	add	r1, r10, #3472
	mov	r3, #1
	add	r1, r1, #8
	str	r3, [r5, #220]
	mov	r2, #744
	add	r0, r6, #128
	bl	memcpy
	ldr	r3, [r8, #24]
.L3895:
	cmp	r3, #2
	beq	.L4060
.L3894:
	ldr	r3, [r6, #56]
	cmp	r3, #0
	beq	.L3926
	ldr	r3, [r5, #112]
	ldr	r2, [r6, #92]
	cmp	r3, r2
	bcs	.L3927
	ldrb	r1, [r10, #3482]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L4061
.L3927:
	mov	r0, r5
	bl	MVC_Marking
	cmp	r0, #0
	bne	.L4062
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	ldr	r1, [r6, #120]
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
.L3920:
	ldrb	r3, [r10, #3481]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3930
	add	r4, r4, #45056
	ldr	ip, [r4, #2920]
.L3931:
	ldr	r3, [r6, #56]
	cmp	r3, #0
	beq	.L3940
	ldr	r2, [r4, #2928]
	ldr	r3, [r4, #2932]
	add	r1, r3, r2
	cmp	r1, ip
	bcs	.L3966
.L3940:
	mvn	r8, #0
	mov	r7, r8
	b	.L3949
.L3944:
	ldr	r2, [r6, #56]
	mov	r1, r7
	mov	r0, r5
	mov	r8, r3
	cmp	r2, #0
	bne	.L3945
	ldr	r2, [r6, #60]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L4063
.L3945:
	bl	MVC_OutputFrmFromDPB
	cmn	r0, #1
	beq	.L3948
	ldr	ip, [r4, #2920]
.L3949:
	ldr	lr, [r4, #2924]
	sub	r3, fp, #52
	sub	r2, fp, #56
	mvn	r1, #0
	cmp	lr, ip
	mov	r0, r5
	bcc	.L3942
	bl	MVC_GetMinPOC
	cmp	r0, #0
	blt	.L4064
	ldr	r3, [r4, #2924]
	cmp	r3, r8
	ldrne	r7, [fp, #-52]
	bne	.L3944
	ldr	r2, [fp, #-52]
	cmp	r2, r7
	beq	.L4065
	mov	r7, r2
	b	.L3944
.L3892:
	ldrb	r2, [r10, #3482]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3895
	b	.L3964
.L4057:
	ldr	r3, [fp, #-64]
	add	r6, r3, #16384
	ldr	r3, [r6, #44]
	ldrb	r8, [r3, #1]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L3888
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L3887
	mov	r0, r7
	ldr	r1, .L4079
	bl	dprint_vfmw
	movw	r3, #3497
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L3926:
	ldrb	r3, [r10, #3481]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3930
	add	r4, r4, #45056
	ldr	ip, [r4, #2920]
	b	.L3940
.L4060:
	ldr	r3, [r6, #56]
	cmp	r3, #0
	beq	.L3920
	add	r4, r4, #45056
	mov	r0, r5
	bl	MVC_SimpleSlideDPB
	ldr	r1, [r4, #2920]
	cmp	r1, #0
	beq	.L3921
	ldr	r3, [r4, #2728]
	cmp	r3, #0
	beq	.L3974
	movw	r2, #47784
	mov	r3, #0
	movt	r2, 169
	add	r2, r5, r2
	b	.L3922
.L3923:
	ldr	r0, [r2, #4]!
	cmp	r0, #0
	beq	.L3974
.L3922:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3923
.L3921:
	movw	r2, #15768
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	subs	r7, r0, #0
	bne	.L4066
	ldr	r1, [r4, #2924]
	mov	r0, r5
	add	r1, r1, #1
	str	r1, [r4, #2924]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	mov	r2, r7
	movw	r3, #3674
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3925
.L3896:
	cmp	r2, #0
	bne	.L3969
.L3902:
	cmp	r3, #0
	beq	.L3972
	movw	r8, #15768
	mov	r9, r7
	movt	r8, 170
	add	r8, r5, r8
.L3905:
	cmp	r1, #0
	bne	.L4067
.L3907:
	ldr	r3, [r8, #708]
	str	r3, [r9, #44]
.L3908:
	mov	r1, r9
	mov	r0, r5
	bl	MVC_GetImagePara
	ldrsb	r1, [r9, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	str	r3, [fp, #-68]
	beq	.L4068
	add	r0, r8, #608
	ldr	lr, [fp, #-68]
	add	r8, r8, #624
	ldrd	r2, [r0, #-8]
	add	r1, lr, #592
	add	ip, lr, #608
	strd	r2, [r1, #-8]
	ldrd	r2, [r0]
	strd	r2, [r1]
	ldrd	r2, [r8, #-8]
	strd	r2, [ip, #-8]
	ldr	r2, [r9, #44]
	cmp	r2, #0
	str	r2, [lr, #152]
	bne	.L3910
.L3915:
	mov	r2, #1
	ldrsb	r1, [r9, #6]
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
	ldr	r3, [fp, #-68]
	ldr	r0, [r5, #120]
	mov	r2, r5
	mov	r1, #15
	str	r3, [sp]
	add	r3, r5, #584
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3912
	mov	r2, #0
	ldrsb	r1, [r9, #6]
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
.L3912:
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #620]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	bcs	.L4069
	ldr	r2, [fp, #-68]
	mov	r3, #0
	str	r3, [r2, #16]
.L3918:
	ldr	r3, [r5, #136]
	add	r3, r3, #2
	str	r3, [r5, #136]
.L3906:
	ldr	r3, [r5, #220]
	cmp	r3, #2
	beq	.L3919
.L3904:
	mov	r3, #1
	str	r3, [r9, #16]
	strb	r3, [r7, #8]
.L3919:
	ldr	r3, [r5, #224]
	mov	r2, #2
	str	r2, [r5, #220]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L3894
	b	.L4060
.L3930:
	ldr	r3, [r5, #520]
	ldr	lr, [r6, #40]
	cmp	r3, #0
	rsb	r2, r3, lr
	clz	r2, r2
	mov	r2, r2, lsr #5
	moveq	r2, #0
	cmp	r2, #0
	beq	.L4070
	mov	r0, r5
	bl	MVC_DirectOutput
	cmn	r0, #1
	mov	r4, r0
	beq	.L4071
.L3936:
	movw	r3, #3726
	mov	r2, r4
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3891
.L4064:
	ldr	r1, .L4079+8
	movw	r2, #3775
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
.L3942:
	ldr	r3, [r6, #56]
	cmp	r3, #0
	beq	.L3954
	ldrb	r3, [r10, #3484]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3954
	ldr	r2, [r4, #2928]
	cmp	r2, #0
	beq	.L3954
	movw	ip, #47844
	mov	lr, r3
	movt	ip, 169
	add	ip, r5, ip
	b	.L3959
.L3956:
	ldr	r2, [r4, #2928]
	cmp	r2, r3
	bls	.L3954
.L3959:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldr	r1, [r6, #48]
	ldr	r0, [r2, #20]
	cmp	r0, r1
	bne	.L3956
	ldr	r0, [r2, #56]
	ldr	r1, [r6, #120]
	cmp	r0, r1
	bne	.L3956
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
	b	.L3956
.L3954:
	ldr	r0, [r4, #2920]
	cmp	r0, #0
	moveq	r1, r0
	beq	.L3953
	ldr	r1, [r4, #2728]
	cmp	r1, #0
	beq	.L3953
	movw	r3, #47784
	mov	r1, #0
	movt	r3, 169
	add	r3, r5, r3
	b	.L3960
.L3961:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L3953
.L3960:
	add	r1, r1, #1
	cmp	r1, #15
	cmpls	r1, r0
	bcc	.L3961
.L3953:
	movw	r2, #15768
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L4072
	ldr	r3, [r4, #2924]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #2924]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
.L3925:
	mov	r4, #0
.L3963:
	ldr	r3, [fp, #-64]
	mov	r2, #0
	mov	r0, r4
	add	r3, r3, #12288
	strb	r2, [r3, #3480]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3888:
	mvn	r1, #0
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L3887
	mov	r0, r8
	ldr	r1, .L4079+12
	bl	dprint_vfmw
	movw	r3, #3507
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4070:
	add	r4, r4, #45056
	ldr	ip, [r4, #2920]
	cmp	ip, #0
	beq	.L3933
	ldr	r3, [r4, #2728]
	adds	r1, r3, #0
	movne	r1, #1
	cmp	lr, r3
	movne	r1, #0
	cmp	r1, #0
	movweq	r2, #47784
	movteq	r2, 169
	addeq	r2, r5, r2
	bne	.L4073
.L3937:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3931
	ldr	r3, [r2, #4]!
	adds	r0, r3, #0
	movne	r0, #1
	cmp	lr, r3
	movne	r0, #0
	cmp	r0, #0
	beq	.L3937
.L3934:
	movw	r2, #15768
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	cmn	r0, #1
	mov	r4, r0
	beq	.L4074
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	movw	r3, #3752
	mov	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3925
.L4059:
	cmp	r0, #0
	beq	.L3895
	b	.L3902
.L3948:
	mov	r3, r0
	mov	r9, r0
	movw	r2, #3815
	ldr	r1, .L4079+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r9
	movw	r3, #3816
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
.L3968:
	ldr	r3, [r6, #40]
	mov	r2, #1
	ldr	r0, [r5, #120]
	mvn	r4, #0
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	mov	r3, r4
	movw	r2, #3873
	ldr	r1, .L4079+16
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #40]
	mov	r3, #0
	strb	r3, [r2, #5]
	ldr	r2, [r6, #40]
	strb	r3, [r2, #2]
	b	.L3963
.L4058:
	ldr	r1, .L4079+20
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_DirectOutput
	ldr	r3, [r6, #116]
	ldr	r2, [r5, #52]
	cmp	r3, r2
	addne	r3, r3, #36
	movne	r1, #0
	addne	r3, r5, r3, lsl #2
	mov	r4, r0
	strne	r1, [r3, #4]
	strne	r2, [r6, #116]
	movw	r3, #3525
	mov	r2, r0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
.L3891:
	cmn	r4, #1
	bne	.L3963
	b	.L3968
.L3899:
	cmp	r2, #1
	beq	.L4075
	cmp	r1, #0
	beq	.L3902
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3902
	b	.L3895
.L4063:
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4076
.L3946:
	mov	r0, r5
	bl	MVC_DirectOutput
	cmn	r0, #1
	mov	r4, r0
	beq	.L4077
.L3947:
	movw	r3, #3807
	mov	r2, r4
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3891
.L3972:
	mov	r9, r7
	b	.L3906
.L4067:
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3907
	mov	r2, #3
	ldr	r3, [r9, #44]
	strb	r2, [r9, #2]
	ldr	r2, [r8, #708]
	add	r3, r3, r2
	str	r3, [r9, #44]
	b	.L3908
.L3910:
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ands	r3, r3, #3
	beq	.L4078
.L3913:
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #4]
	cmp	r3, r2
	bcs	.L3915
	ldrsb	r1, [r9, #6]
	mov	r2, #0
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
	movw	r3, #3625
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4065:
	mov	r3, r7
	ldr	r2, .L4079+24
	ldr	r1, .L4079+28
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #3784
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L3974:
	mov	r1, r3
	b	.L3921
.L4076:
	ldrb	r3, [r10, #3483]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r6, #40]
	strne	r3, [r5, #524]
	b	.L3946
.L4075:
	cmp	r3, #0
	ldr	r9, [r6, #784]
	beq	.L3904
	movw	r8, #16512
	ldrb	r1, [r6, #131]	@ zero_extendqisi2
	movt	r8, 170
	add	r8, r5, r8
	b	.L3905
.L4069:
	ldr	r1, [fp, #-68]
	mov	r0, r5
	bl	MVC_SetFrmRepeatCount.part.2
	b	.L3918
.L4056:
	mov	r0, r3
	ldr	r1, .L4079+32
	bl	dprint_vfmw
	add	r6, r5, #11141120
	movw	r3, #3483
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	add	r6, r6, #16384
	b	.L3968
.L4077:
	mov	r3, r0
	movw	r2, #3804
	ldr	r1, .L4079+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3947
.L4062:
	mov	r2, r0
	ldr	r1, .L4079+36
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #3699
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4078:
	movw	r2, #3606
	ldr	r1, .L4079+40
	mov	r0, #1
	str	r3, [fp, #-72]
	bl	dprint_vfmw
	ldr	r2, .L4079+44
	ldr	r8, [r2]
	cmp	r8, #0
	beq	.L3914
	ldr	r3, [fp, #-72]
	mov	r1, #111
	ldr	r0, [r5, #120]
	mov	r2, r3
	blx	r8
.L3914:
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #152]
	cmp	r2, #0
	bne	.L3913
	b	.L3915
.L4072:
	mov	r3, r0
	movw	r2, #3859
	ldr	r1, .L4079+16
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #3860
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4073:
	mov	r1, r2
	b	.L3934
.L3933:
	ldr	r3, [r6, #56]
	cmp	r3, #0
	beq	.L3940
	ldr	r2, [r4, #2928]
	ldr	r3, [r4, #2932]
.L3966:
	str	r3, [sp, #4]
	mov	r0, #1
	mov	r3, ip
	str	r2, [sp]
	ldr	r1, .L4079+48
	movw	r2, #3765
	bl	dprint_vfmw
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	movw	r3, #3767
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4061:
	ldr	r1, .L4079+52
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4079+44
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L3928
	ldr	r0, [r5, #112]
	mov	r3, #8
	ldr	ip, [r6, #92]
	sub	r2, fp, #52
	mov	r1, #104
	str	r0, [fp, #-48]
	str	ip, [fp, #-52]
	ldr	r0, [r5, #120]
	blx	r4
.L3928:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	movw	r3, #3690
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4071:
	mov	r3, r0
	movw	r2, #3722
	ldr	r1, .L4079+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3936
.L4066:
	mov	r3, r7
	movw	r2, #3665
	ldr	r1, .L4079+16
	mov	r0, #0
	bl	dprint_vfmw
	movw	r3, #3666
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4074:
	mov	r3, r0
	movw	r2, #3745
	ldr	r1, .L4079+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r4
	movw	r3, #3746
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4068:
	movw	r3, #3595
	mvn	r2, #0
	ldr	r1, .L4079+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3968
.L4080:
	.align	2
.L4079:
	.word	.LC435
	.word	.LC434
	.word	.LC443
	.word	.LC436
	.word	.LC439
	.word	.LC437
	.word	.LANCHOR0+368
	.word	.LC444
	.word	.LC433
	.word	.LC441
	.word	.LC438
	.word	g_event_report
	.word	.LC442
	.word	.LC440
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	mov	r6, r0
	add	r3, r0, #11075584
	movw	r0, #2004
	add	r8, r3, #40960
	mul	r1, r0, r1
	ldr	r2, [r8, #2708]
	mov	r4, r3
	str	r3, [fp, #-80]
	movw	r3, #26894
	ldr	ip, [r6, #236]
	add	lr, r6, r1
	movt	r3, 42
	add	r3, r2, r3
	movw	r2, #43728
	movt	r2, 169
	add	r2, lr, r2
	add	r9, r4, #36864
	ldrb	r5, [ip, #19]	@ zero_extendqisi2
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	add	r0, r6, #11141120
	cmp	r5, #1
	mov	lr, r4
	mov	r7, r0
	str	r0, [fp, #-52]
	str	r2, [fp, #-76]
	add	r0, r6, r3, lsl #2
	ldr	r2, [r8, #1092]
	movw	r3, #43728
	add	r4, r7, #16384
	add	lr, lr, #45056
	movt	r3, 169
	add	r3, r1, r3
	str	r2, [fp, #-56]
	add	r3, r6, r3
	ldr	r2, [r9, #4064]
	ldr	r0, [r0, #4]
	str	r2, [fp, #-68]
	moveq	r2, #2
	movne	r2, #0
	str	r2, [fp, #-60]
	ldr	r2, [r9, #4068]
	str	r2, [fp, #-72]
	ldr	r2, [ip, #2896]
	str	r3, [r4, #44]
	ldr	r5, [lr, #2924]
	cmp	r5, #0
	beq	.L4096
	add	r2, r2, #4
	mov	r7, #1
	mov	r3, r7, asl r2
	add	r0, r0, r7
	str	r3, [fp, #-64]
	mov	r1, r3
	bl	__aeabi_uidivmod
	mov	r3, #0
	mov	r0, #2
	str	r3, [r9, #4068]
	str	r3, [r9, #4064]
	mov	r5, r1
	ldr	r1, .L4099
	bl	dprint_vfmw
	ldr	r10, [fp, #-56]
	mov	r3, r5
	ldr	r1, .L4099+4
	mov	r0, #2
	mov	r2, r10
	bl	dprint_vfmw
	cmp	r10, r5
	bgt	.L4089
	b	.L4090
.L4087:
	mov	r3, #0
	mov	r0, r6
	strb	r3, [r10, #3484]
	bl	MVC_StorePicInDpb
	movw	r2, #26894
	movt	r2, 42
	ldr	r1, [fp, #-64]
	subs	r3, r0, #0
	add	r0, r5, #1
	bne	.L4097
	ldr	r3, [r8, #2708]
	add	r2, r3, r2
	add	r2, r6, r2, lsl #2
	str	r5, [r2, #4]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-56]
	cmp	r3, r1
	mov	r5, r1
	ble	.L4090
.L4089:
	mov	r1, #1
	mov	r0, r6
	bl	MVC_AllocFrameStore
	ldr	r3, [fp, #-52]
	ldr	r1, .L4099+8
	add	r10, r3, #12288
	subs	r2, r0, #0
	mov	r0, #2
	bne	.L4098
	str	r2, [fp, #-48]
	bl	dprint_vfmw
	strb	r7, [r10, #3486]
	ldr	r1, [r4, #40]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-60]
	str	r5, [r1, #20]
	ldr	r1, [r4, #40]
	str	r5, [r4, #48]
	str	r5, [r1, #724]
	ldr	r1, [r4, #40]
	str	r3, [r4, #56]
	str	r2, [r1, #720]
	ldr	r1, [r4, #40]
	strb	r7, [r1, #7]
	ldr	r1, [r4, #40]
	strb	r2, [r1, #5]
	ldr	r1, [r4, #40]
	strb	r7, [r1, #1]
	strb	r7, [r10, #3482]
	ldr	r0, [r8, #2704]
	ldr	r1, [r4, #44]
	str	r0, [r4, #120]
	strb	r2, [r1, #3]
	ldr	r2, [r6, #236]
	ldr	r2, [r2, #2900]
	cmp	r2, #0
	beq	.L4087
	str	r5, [r9, #4080]
	mov	r0, r6
	bl	MVC_DecPOC
	ldr	r2, [r9, #4060]
	str	r2, [r4, #60]
	ldr	r2, [r9, #4056]
	str	r2, [r4, #64]
	ldr	r2, [r9, #4048]
	str	r2, [r4, #68]
	ldr	r2, [r9, #4052]
	str	r2, [r4, #72]
	b	.L4087
.L4096:
	ldr	r1, .L4099+12
	mov	r0, r5
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4090:
	ldr	r2, [fp, #-68]
	mov	r0, #0
	ldr	r3, [fp, #-52]
	str	r2, [r9, #4064]
	add	r3, r3, #16384
	ldr	r2, [fp, #-72]
	str	r2, [r9, #4068]
	ldrb	r2, [fp, #-76]	@ zero_extendqisi2
	ldr	r3, [r3, #44]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4098:
	ldr	r2, [fp, #-68]
	add	r3, r3, #16384
	ldr	r1, .L4099+16
	mov	r0, #0
	str	r2, [r9, #4064]
	ldr	r2, [fp, #-72]
	str	r2, [r9, #4068]
	ldrb	r2, [fp, #-76]	@ zero_extendqisi2
	ldr	r3, [r3, #44]
	strb	r2, [r3, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4097:
	ldr	r2, [fp, #-80]
	mov	r0, #0
	ldr	lr, [fp, #-72]
	add	r1, r2, #36864
	ldr	r2, [fp, #-52]
	add	ip, r2, #16384
	ldr	r2, [fp, #-68]
	str	lr, [r1, #4068]
	ldrb	lr, [fp, #-76]	@ zero_extendqisi2
	str	r2, [r1, #4064]
	movw	r2, #6660
	ldr	ip, [ip, #44]
	ldr	r1, .L4099+20
	strb	lr, [ip, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4100:
	.align	2
.L4099:
	.word	.LC446
	.word	.LC447
	.word	.LC449
	.word	.LC445
	.word	.LC448
	.word	.LC450
	UNWIND(.fnend)
	.size	MVC_DecGap, .-MVC_DecGap
	.align	2
	.global	MVC_InitPic
	.type	MVC_InitPic, %function
MVC_InitPic:
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
	add	r3, r0, #11141120
	add	r5, r3, #12288
	str	r3, [fp, #-60]
	add	r3, r0, #11075584
	str	r3, [fp, #-56]
	add	r6, r3, #40960
	ldrb	r1, [r5, #3480]	@ zero_extendqisi2
	ldr	r3, [r0, #252]
	mov	r7, #2240
	ldr	r2, [r6, #1080]
	cmp	r1, #0
	mov	r4, r0
	mov	r1, #0
	str	r1, [fp, #-48]
	mla	r7, r7, r2, r3
	beq	.L4102
	ldr	r3, [fp, #-60]
	add	r8, r3, #16384
	ldr	r3, [r8, #40]
	cmp	r3, r1
	beq	.L4103
	ldrb	r9, [r3, #2]	@ zero_extendqisi2
	cmp	r9, r1
	beq	.L4261
.L4103:
	mov	r3, #0
	strb	r3, [r5, #3480]
.L4102:
	sub	r1, fp, #48
	mov	r0, r4
	bl	MVC_GetReRangeFlag
	ldrb	r3, [r6, #1076]	@ zero_extendqisi2
	cmp	r3, #255
	mov	r9, r0
	beq	.L4262
.L4104:
	cmp	r3, #0
	bne	.L4107
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4263
	ldr	r3, [r7, #28]
	ldr	r2, [r4, #28]
	cmp	r2, r3
	movweq	r3, #35364
	movteq	r3, 168
	addeq	r3, r4, r3
	streq	r3, [r4, #236]
	bne	.L4264
.L4107:
	ldr	r3, [fp, #-56]
	add	r8, r3, #36864
	ldr	r3, [r7, #24]
	ldr	r2, [r8, #1808]
	cmp	r2, r3
	beq	.L4265
.L4111:
	mov	r3, #0
	mov	r1, r7
	strb	r3, [r7, #20]
	ldr	r0, [r4, #236]
	bl	mvc_assign_quant_params
	ldr	r3, .L4279
	movw	r0, #38648
	mov	r2, #2240
	movt	r0, 169
	mov	r1, r7
	add	r0, r4, r0
	ldr	r3, [r3, #56]
	blx	r3
.L4112:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r4, #224]
	bne	.L4266
	ldr	r2, [r3, #952]
	cmp	r2, #1
	beq	.L4114
.L4123:
	ldr	r2, [r8, #1808]
	ldr	r3, [r7, #24]
	cmp	r2, r3
	bne	.L4132
	ldrb	r3, [r7, #20]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4132
.L4133:
	ldrb	r3, [r6, #1076]	@ zero_extendqisi2
	cmp	r3, #255
	moveq	r3, #0
	streq	r3, [r6, #2708]
	beq	.L4135
	cmp	r3, #0
	bne	.L4135
	add	r1, r4, #10747904
	movw	r2, #22868
	add	r1, r1, #20480
	movt	r2, 164
	ldr	ip, [r6, #2704]
	add	r2, r4, r2
	ldr	r0, [r1, #2384]
	adds	r0, r0, #1
	beq	.L4136
	ldr	r1, [r1, #2388]
	cmp	ip, r1
	beq	.L4177
	mov	lr, r0
	b	.L4137
.L4138:
	ldr	r1, [r2, #4]!
	cmp	ip, r1
	beq	.L4136
.L4137:
	add	r3, r3, #1
	cmp	r3, lr
	mov	r0, r3
	bne	.L4138
.L4136:
	str	r0, [r6, #2708]
.L4135:
	ldrb	r2, [r6, #1067]	@ zero_extendqisi2
	ldr	r3, [r4, #236]
	cmp	r2, #5
	ldreq	r2, [r6, #2708]
	ldr	r9, [r3, #2896]
	movweq	r3, #26894
	movteq	r3, 42
	addeq	r3, r2, r3
	ldreq	r7, [r6, #1092]
	addeq	r3, r4, r3, lsl #2
	ldrne	r7, [r6, #1092]
	streq	r7, [r3, #4]
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4141
	ldr	r10, [r4, #224]
	ldr	r3, [r10, #24]
	cmp	r3, #2
	beq	.L4141
	ldr	r2, [r6, #2708]
	movw	r3, #26894
	movt	r3, 42
	add	r3, r2, r3
	add	r3, r4, r3, lsl #2
	ldr	r0, [r3, #4]
	cmp	r0, r7
	beq	.L4141
	mov	r3, #1
	add	r9, r9, #4
	mov	r9, r3, asl r9
	add	r0, r0, r3
	str	r3, [fp, #-64]
	mov	r1, r9
	bl	__aeabi_uidivmod
	cmp	r1, r7
	beq	.L4141
	ldr	r3, [fp, #-64]
	str	r3, [r10, #616]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #616]
	cmp	r2, #0
	beq	.L4267
.L4142:
	ldr	r3, [fp, #-56]
	add	r3, r3, #32768
	ldrb	r3, [r3, #1907]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4151
	ldr	r1, .L4279+4
	mov	r0, #2
	bl	dprint_vfmw
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #620]
	bics	r3, r3, #1024
	bne	.L4258
	ldr	r10, [r6, #2704]
	cmp	r10, #0
	bne	.L4258
	ldr	r2, [r6, #2708]
	movw	r3, #26894
	movt	r3, 42
	mov	r1, r9
	add	r3, r2, r3
	ldr	r7, [r6, #1092]
	add	r3, r4, r3, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #1
	bl	__aeabi_uidivmod
	cmp	r7, r1
	bcs	.L4141
	ldrb	r3, [r6, #1064]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4141
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_ClearDPB
	ldr	r3, [r6, #2708]
	movw	r2, #26894
	mov	r1, r9
	movt	r2, 42
	add	r2, r3, r2
	ldr	r5, [r6, #1092]
	add	r2, r4, r2, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #1
	bl	__aeabi_uidivmod
	mov	r3, r5
	mov	r0, r10
	movw	r2, #7172
	str	r1, [sp]
	ldr	r1, .L4279+8
	bl	dprint_vfmw
	mvn	r0, #0
.L4249:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4266:
	ldr	r10, [r3, #732]
	cmp	r10, #0
	bne	.L4114
	ldr	r2, [r3, #28]
	cmp	r2, #25
	beq	.L4268
.L4114:
	ldr	r2, [r4, #84]
	cmp	r9, #0
	add	r2, r2, #1
	str	r2, [r4, #84]
	bne	.L4124
	ldr	r3, [r3, #952]
	cmp	r3, #1
	beq	.L4125
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L4269
.L4257:
	mov	r0, r4
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L4175
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	bne	.L4123
.L4129:
	ldr	r1, [r8, #1764]
	mov	r0, r4
	ldr	r3, [fp, #-56]
	mov	r1, r1, asl #1
	add	ip, r3, #32768
	str	r1, [r4, #52]
	add	r3, r4, #48
	ldr	r2, [r8, #1744]
	ldrb	r9, [ip, #1908]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	r10, [r8, #1740]
	rsb	r9, r9, #2
	str	r1, [sp]
	mov	r2, r2, asl #4
	add	r10, r10, #1
	mul	r9, r9, r2
	mov	r10, r10, asl #4
	mov	r1, r10
	mov	r2, r9
	bl	MVC_ArrangeVahbMem
	cmp	r0, #1
	beq	.L4270
.L4255:
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #952]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L4249
	mov	r5, #0
	ldr	r1, .L4279+12
	str	r5, [r4, #12]
	mov	r0, r5
	str	r5, [r4, #16]
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4132:
	ldr	r3, .L4279
	movw	r0, #38648
	mov	r2, #0
	movt	r0, 169
	strb	r2, [r7, #20]
	add	r0, r4, r0
	mov	r1, r7
	ldr	r3, [r3, #56]
	mov	r2, #2240
	blx	r3
	b	.L4133
.L4151:
	mov	r0, r4
	bl	MVC_DecGap
	cmp	r0, #0
	bne	.L4154
.L4258:
	ldr	r7, [r6, #1092]
.L4141:
	ldrb	r3, [r6, #1072]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4155
	ldr	r2, [r6, #2708]
	movw	r3, #26894
	movt	r3, 42
	add	r3, r2, r3
	add	r3, r4, r3, lsl #2
	str	r7, [r3, #4]
.L4155:
	mov	r0, r4
	str	r7, [r8, #4080]
	bl	MVC_DecPOC
	mov	r1, #0
	mov	r0, r4
	bl	MVC_AllocFrameStore
	cmp	r0, #0
	bne	.L4271
	ldr	r3, [fp, #-60]
	mov	r1, #1
	strb	r0, [r5, #3487]
	mvn	r9, #0
	strb	r1, [r5, #3480]
	add	r7, r3, #16384
	ldrb	r3, [r6, #1067]	@ zero_extendqisi2
	strb	r3, [r5, #3486]
	ldr	r3, [r6, #1092]
	str	r3, [r7, #48]
	str	r3, [fp, #-68]
	ldrb	r3, [r6, #1072]	@ zero_extendqisi2
	str	r3, [r7, #56]
	ldr	lr, [r8, #4060]
	str	r3, [fp, #-64]
	str	lr, [r7, #60]
	ldr	r2, [r8, #4056]
	str	r2, [r7, #64]
	ldr	ip, [r8, #4048]
	str	ip, [r7, #68]
	ldr	r10, [r8, #4052]
	str	ip, [r7, #84]
	str	lr, [r7, #76]
	str	r10, [r7, #72]
	str	r10, [r7, #88]
	str	r2, [r7, #80]
	strb	r0, [r5, #3482]
	strb	r0, [r5, #3485]
	strb	r0, [r5, #3484]
	str	r9, [r7, #112]
	ldrb	r10, [r6, #1065]	@ zero_extendqisi2
	cmp	r10, #0
	strneb	r1, [r6, #1065]
	ldr	r9, [r4, #236]
	movne	r10, r1
	movne	r1, #2
	ldrb	r0, [r9, #20]	@ zero_extendqisi2
	ldr	r2, [r9, #3952]
	rsb	r0, r0, #2
	mla	r0, r2, r0, r0
	bl	__aeabi_uidiv
	cmp	r10, #0
	ldr	r3, [fp, #-64]
	str	r0, [r7, #100]
	ldrb	r2, [r9, #20]	@ zero_extendqisi2
	ldr	ip, [r9, #3952]
	rsb	r1, r2, #2
	mla	r1, ip, r1, r1
	str	r1, [r7, #104]
	ldr	r1, [r9, #3948]
	add	r2, r1, #1
	str	r2, [r7, #96]
	mul	r2, r2, r0
	str	r2, [r7, #108]
	ldrb	r2, [r8, #1784]	@ zero_extendqisi2
	strb	r2, [r5, #3488]
	movne	r2, #0
	bne	.L4158
	ldrb	r2, [r9, #21]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
.L4158:
	cmp	r3, #0
	strb	r2, [r5, #3489]
	beq	.L4159
	ldr	r2, [r6, #2708]
	movw	r3, #26894
	movt	r3, 42
	add	r3, r2, r3
	ldr	r2, [fp, #-68]
	add	r3, r4, r3, lsl #2
	str	r2, [r3, #4]
.L4159:
	ldr	r3, [r7, #40]
	cmp	r3, #0
	ldrneb	r2, [r6, #1076]	@ zero_extendqisi2
	strneb	r2, [r3, #9]
	mvn	r3, #0
	str	r3, [r7, #120]
	ldrb	r3, [r6, #1075]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4161
	ldr	r3, [r6, #2704]
	str	r3, [r7, #120]
	ldrb	r3, [r6, #1073]	@ zero_extendqisi2
	strb	r3, [r5, #3490]
	ldrb	r3, [r6, #1074]	@ zero_extendqisi2
	strb	r3, [r5, #3491]
.L4161:
	ldr	r3, [r6, #2708]
	movw	r8, #2004
	movw	ip, #43728
	movw	lr, #16368
	movt	ip, 169
	movt	lr, 170
	str	r3, [r7, #124]
	mvn	r2, #0
	ldrb	r1, [r4, #3]	@ zero_extendqisi2
	mvn	r3, #0
	mov	r0, #29
	mla	r8, r8, r1, r4
	ldr	r1, .L4279+16
	add	ip, r8, ip
	str	ip, [r7, #44]
	ldr	ip, [r4, #224]
	ldrd	r8, [ip, #64]
	strd	r8, [r4, lr]
	ldrd	r8, [ip, #80]
	strd	r8, [r7, #-8]
	ldrd	r8, [ip, #96]
	strd	r8, [r7]
	strd	r2, [ip, #64]
	ldrd	r2, [r4, lr]
	bl	dprint_vfmw
	ldrd	r2, [r7, #-8]
	ldr	r1, .L4279+20
	mov	r0, #29
	bl	dprint_vfmw
	ldr	ip, [r4, #236]
	ldr	r3, [fp, #-56]
	mov	r2, #4
	ldr	r1, .L4279
	movw	r0, #15848
	add	lr, r3, #32768
	ldr	r3, [ip, #3948]
	movt	r0, 170
	add	r0, r4, r0
	add	r3, r3, #1
	ldr	r8, [r1, #48]
	mov	r1, #0
	mov	r3, r3, asl r2
	str	r3, [r5, #3564]
	ldrb	r3, [ip, #20]	@ zero_extendqisi2
	ldr	r9, [ip, #3952]
	rsb	r3, r3, #2
	mla	r3, r9, r3, r3
	mov	r3, r3, asl r2
	str	r3, [r5, #3568]
	ldr	r9, [ip, #748]
	ldr	r10, [lr, #1940]
	subs	r9, r9, #1
	and	r10, r10, #7
	movne	r9, #1
	blx	r8
	ldrb	r2, [r5, #3560]	@ zero_extendqisi2
	mov	ip, #2
	ldrb	r3, [r5, #3561]	@ zero_extendqisi2
	movw	r0, #15784
	and	r2, r2, #252
	mov	r1, r10
	bfi	r2, r9, #2, #3
	strb	r2, [r5, #3560]
	ldr	r2, [r4, #236]
	bfi	r3, ip, #0, #2
	and	r3, r3, #243
	ldrb	lr, [r5, #3560]	@ zero_extendqisi2
	bfi	r3, ip, #4, #2
	movt	r0, 170
	ldr	ip, [r2, #56]
	add	r0, r4, r0
	strb	r3, [r5, #3561]
	bfi	lr, ip, #5, #3
	strb	lr, [r5, #3560]
	ldr	r2, [r2, #52]
	ldr	r3, [r5, #3560]
	bfi	r3, r2, #14, #3
	str	r3, [r5, #3560]
	bl	SetAspectRatio
	ldr	r3, [r4, #84]
	str	r3, [r5, #3652]
	ldr	r0, [r7, #40]
	cmp	r0, #0
	beq	.L4272
	ldr	r3, [r4, #236]
	ldr	r3, [r3, #3984]
	str	r3, [r0, #156]
	str	r3, [r5, #3580]
	ldr	r3, [r4, #236]
	ldr	r2, [r7, #40]
	ldr	r3, [r3, #3988]
	str	r3, [r2, #160]
	str	r3, [r5, #3584]
	ldr	r3, [r4, #236]
	ldr	r2, [r7, #40]
	ldr	r3, [r3, #3976]
	str	r3, [r2, #148]
	str	r3, [r5, #3572]
	ldr	r2, [r4, #236]
	ldr	r3, [r7, #40]
	ldr	r2, [r2, #3980]
	str	r2, [r3, #152]
	ldrb	r3, [r5, #3483]	@ zero_extendqisi2
	str	r2, [r5, #3576]
	adds	r3, r3, #0
	ldr	r2, [r5, #3560]
	movne	r3, #1
	str	r3, [r5, #3548]
	ldr	r3, [r7, #40]
	str	r2, [r3, #136]
	ldr	r3, [r7, #40]
	ldr	r2, [r5, #3548]
	str	r2, [r3, #124]
	ldr	r3, [r6, #1092]
	str	r3, [r5, #3672]
	ldr	r2, [r6, #2704]
	str	r2, [r5, #3680]
	ldr	r2, [r7, #40]
	str	r3, [r2, #248]
	ldr	r3, [r7, #40]
	ldr	r2, [r6, #2704]
	str	r2, [r3, #256]
	ldr	r3, [r7, #40]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L4163
	ldr	r3, [r5, #3548]
	mov	r1, #0
	ldr	r2, [r0, #4]
	subs	r3, r3, r1
	ldr	r0, [r4, #120]
	movne	r3, #1
	bl	FSP_SetStoreType
.L4163:
	ldr	r3, [fp, #-60]
	movw	lr, #16352
	movt	lr, 170
	add	lr, r4, lr
	add	ip, r3, #16320
	ldr	r3, [r4, #60]
	mov	r6, #0
.L4167:
	ldrd	r0, [ip, #8]!
	orrs	r2, r0, r1
	bne	.L4164
	cmp	r3, #0
	beq	.L4164
	ldr	r2, [r4, #528]
	subs	r3, r3, #1
	stmia	ip, {r2, r6}
	beq	.L4165
	add	r1, r4, #528
	mov	r2, #0
.L4166:
	add	r2, r2, #1
	ldr	r0, [r1, #4]!
	cmp	r2, r3
	str	r0, [r1, #-4]
	bne	.L4166
.L4165:
	add	r2, r3, #132
	str	r6, [r4, r2, asl #2]
	str	r3, [r4, #60]
.L4164:
	cmp	ip, lr
	bne	.L4167
	cmp	r3, #0
	beq	.L4169
	mov	r6, r3
	ble	.L4169
	add	r7, r3, #132
	mov	r8, #0
	add	r7, r4, r7, lsl #2
.L4170:
	ldr	r1, [r7, #-4]!
	sub	r6, r6, #1
	ldr	r0, [r4, #120]
	bl	FreeUsdByDec
	cmp	r6, #0
	str	r8, [r7]
	bne	.L4170
.L4169:
	mov	r6, #0
	mov	r0, r4
	str	r6, [r4, #60]
	strb	r6, [r5, #3492]
	bl	MVC_UpdateReflist
	mov	r0, r4
	bl	MVC_UpdateLTReflist
	mov	r0, r4
	bl	MVC_CalcPicNum
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4265:
	ldrb	r3, [r7, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4112
	b	.L4111
.L4262:
	mov	r2, #1
	strb	r2, [r4, #2]
	ldr	r1, [r7, #28]
	movw	ip, #3992
	ldr	r0, [r4, #248]
	movw	r8, #34656
	ldr	r2, [fp, #-56]
	str	r1, [r4, #24]
	ldr	r1, [r7, #28]
	add	r2, r2, #32768
	ldr	r2, [r2, #2632]
	mla	r1, ip, r1, r0
	ldr	r0, [r1, #744]
	cmp	r2, r0
	beq	.L4273
.L4105:
	ldr	r2, .L4279
	movt	r8, 169
	ldr	r3, [r4, #84]
	add	r8, r4, r8
	mov	ip, #0
	add	r3, r3, #1
	mov	r0, r8
	str	r3, [r4, #84]
	strb	ip, [r1, #26]
	ldr	r3, [r2, #56]
	movw	r2, #3992
	blx	r3
	ldrb	r3, [r6, #1076]	@ zero_extendqisi2
.L4106:
	str	r8, [r4, #236]
	b	.L4104
.L4125:
	ldr	r1, .L4279+24
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_GetBackPicFromVOQueue
	b	.L4257
.L4273:
	ldrb	r2, [r1, #26]	@ zero_extendqisi2
	cmp	r2, #0
	movteq	r8, 169
	addeq	r8, r4, r8
	beq	.L4106
	b	.L4105
.L4261:
	ldrsb	r1, [r3, #6]
	mov	r2, #1
	ldr	r0, [r0, #120]
	bl	FSP_ClearLogicFs
	ldr	r3, [r8, #40]
	strb	r9, [r3, #2]
	ldr	r3, [r8, #40]
	strb	r9, [r3, #5]
	b	.L4103
.L4267:
	ldr	r2, [r3, #660]
	cmp	r2, #1
	beq	.L4274
.L4143:
	ldr	r3, [r6, #2708]
	ldr	r1, [r6, #1092]
	add	r3, r4, r3, lsl #2
	add	r3, r3, #11075584
	add	r2, r3, #40960
	ldr	r2, [r2, #1084]
	cmp	r1, r2
	bls	.L4144
	ldr	ip, [r8, #1764]
	rsb	r0, r2, r1
	cmp	r2, #0
	cmpne	ip, r0
	bcs	.L4142
	ldrb	r2, [r6, #1064]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L4275
	add	r3, r3, #40960
	cmp	r1, #0
	subne	r2, r1, #1
	subeq	r2, r9, #1
	mvn	r1, #0
	str	r2, [r3, #1084]
	mov	r0, r4
	bl	MVC_FlushDPB
	subs	r3, r0, #0
	beq	.L4142
	movw	r2, #7122
	ldr	r1, .L4279+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4268:
	ldr	r3, [r4, #84]
	cmp	r9, #0
	add	r3, r3, #1
	str	r3, [r4, #84]
	beq	.L4115
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	subs	r3, r0, #0
	bne	.L4276
	mov	r0, r4
	bl	MVC_InitDPB
	subs	r3, r0, #0
	bne	.L4172
	ldr	r2, [fp, #-56]
	ldr	r3, [r8, #1744]
	add	r2, r2, #32768
	ldr	r9, [r8, #1740]
	add	r3, r3, #1
	ldrb	r10, [r2, #1908]	@ zero_extendqisi2
	add	r9, r9, #1
	ldr	r2, [r4, #12]
	mov	r3, r3, asl #4
	rsb	r10, r10, #2
	mov	r9, r9, asl #4
	cmp	r2, #0
	mul	r10, r10, r3
	bne	.L4121
	ldr	r3, [r8, #1764]
	ldr	r0, [r4, #224]
	mov	r3, r3, asl #1
	str	r3, [r4, #52]
	ldr	r1, [r0, #692]
	cmp	r1, r9
	bcc	.L4117
	ldr	r2, [r0, #696]
	cmp	r2, r10
	bcc	.L4117
	ldr	ip, [fp, #-56]
	ldr	lr, [r0, #716]
	add	ip, ip, #45056
	ldr	ip, [ip, #2920]
	cmp	lr, ip
	bcc	.L4277
	ldr	ip, [r0, #720]
	cmp	ip, #0
	moveq	r3, #1
	streq	r3, [r4, #52]
	ldreq	r1, [r0, #692]
	ldreq	r2, [r0, #696]
	mov	r0, r4
	str	r3, [sp]
	add	r3, r4, #48
	bl	MVC_ArrangeVahbMem
	cmp	r0, #1
	bne	.L4255
	b	.L4121
.L4263:
	strb	r3, [r4, #2]
	movw	r2, #8500
	ldr	r1, [r7, #28]
	movt	r2, 5
	ldr	r3, .L4279
	movw	r0, #22860
	movt	r0, 164
	add	r0, r4, r0
	mla	r1, r2, r1, r4
	ldr	r3, [r3, #56]
	add	r1, r1, #12992
	add	r1, r1, #12
	blx	r3
	add	r2, r4, #11010048
	add	r2, r2, #32768
	movw	r3, #35364
	movt	r3, 168
	add	r3, r4, r3
	str	r3, [r4, #236]
	ldr	r3, [r2, #3340]
	str	r3, [r4, #28]
	b	.L4107
.L4124:
	ldr	r1, .L4279+24
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_GetBackPicFromVOQueue
	mov	r0, r4
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L4129
.L4175:
	mov	r3, r0
	movw	r2, #7021
	ldr	r1, .L4279+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4270:
	mov	r10, r10, lsr #4
	mov	r9, r9, lsr #4
	str	r10, [r4, #12]
	str	r9, [r4, #16]
	b	.L4123
.L4144:
	rsb	r0, r2, r1
	ldr	ip, [r8, #1764]
	add	r0, r0, r9
	cmp	r2, #0
	cmpne	ip, r0
	bcs	.L4142
	ldrb	r2, [r6, #1064]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L4278
	add	r3, r3, #40960
	cmp	r1, #0
	subne	r2, r1, #1
	subeq	r2, r9, #1
	mvn	r1, #0
	str	r2, [r3, #1084]
	mov	r0, r4
	bl	MVC_FlushDPB
	subs	r3, r0, #0
	beq	.L4142
	movw	r2, #7149
	ldr	r1, .L4279+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4115:
	mov	r0, r4
	bl	MVC_InitDPB
	subs	r3, r0, #0
	bne	.L4172
	ldr	r2, [fp, #-56]
	ldr	r3, [r8, #1744]
	add	r2, r2, #32768
	ldr	r9, [r8, #1740]
	add	r3, r3, #1
	ldrb	r10, [r2, #1908]	@ zero_extendqisi2
	add	r9, r9, #1
	mov	r3, r3, asl #4
	rsb	r10, r10, #2
	mov	r9, r9, asl #4
	mul	r10, r10, r3
.L4121:
	mov	r9, r9, lsr #4
	mov	r10, r10, lsr #4
	str	r9, [r4, #12]
	str	r10, [r4, #16]
	b	.L4123
.L4264:
	ldr	r1, .L4279+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4154:
	movw	r2, #7184
	ldr	r1, .L4279+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4274:
	ldr	r2, [r3, #656]
	cmp	r2, #0
	bne	.L4143
	ldr	r2, [r3, #664]
	cmp	r2, #0
	bne	.L4143
	ldr	r3, [r3, #620]
	add	r3, r3, #1024
	cmp	r3, #2048
	bhi	.L4142
	b	.L4143
.L4177:
	mov	r0, r3
	b	.L4136
.L4271:
	movw	r2, #7204
	ldr	r1, .L4279+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4272:
	movw	r2, #7299
	ldr	r1, .L4279+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4269:
	mov	r3, r0
	movw	r2, #7012
	mov	r0, r9
	ldr	r1, .L4279+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4275:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_ClearDPB
	ldr	r2, [r6, #2708]
	ldr	r3, [r8, #1764]
	movw	r1, #26894
	ldr	ip, [r6, #1092]
	movt	r1, 42
	add	r1, r2, r1
	movw	r2, #7111
.L4259:
	add	r4, r4, r1, lsl #2
	str	r3, [sp]
	ldr	r1, .L4279+52
	mov	r0, #0
	ldr	r3, [r4, #4]
	rsb	r3, r3, ip
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4172:
	movw	r2, #6937
	ldr	r1, .L4279+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4278:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_ClearDPB
	ldr	r2, [r6, #2708]
	movw	r1, #26894
	ldr	r3, [r8, #1764]
	movt	r1, 42
	ldr	ip, [r6, #1092]
	add	r1, r2, r1
	movw	r2, #7138
	b	.L4259
.L4117:
	ldr	r1, .L4279+56
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4276:
	mov	r0, r10
	movw	r2, #6928
	ldr	r1, .L4279+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4277:
	ldr	r1, .L4279+60
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4249
.L4280:
	.align	2
.L4279:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC457
	.word	.LC458
	.word	.LC455
	.word	.LC461
	.word	.LC462
	.word	.LC464
	.word	.LC451
	.word	.LC452
	.word	.LC33
	.word	.LC459
	.word	.LC460
	.word	.LC463
	.word	.LC456
	.word	.LC453
	.word	.LC454
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
	ldr	r2, [r0, #68]
	mov	r4, r0
	ldr	r1, .L4333
	sub	r2, r2, #1
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	add	r5, r4, #11075584
	mov	r0, r4
	add	r5, r5, #40960
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r5, #1067]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r5, #1072]
	bl	MVC_ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L4326
	mov	r0, r4
	bl	MVC_ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L4326
	ldr	r2, [r4, #64]
	cmp	r2, #0
	moveq	r3, r2
	beq	.L4288
	movw	r7, #17280
	mov	r9, r0
	movt	r7, 170
	mov	r3, r0
	add	r7, r4, r7
	mov	lr, r0
	b	.L4296
.L4327:
	cmp	ip, r0
	add	r3, r6, r3
	rsbhi	r0, r0, ip
	rsbhi	r9, r9, r8
	addhi	r0, r0, r9
	movls	r0, r8
	add	r3, r3, r0
.L4294:
	cmp	r1, #0
	add	lr, lr, #1
	movne	r0, r1
	movne	r9, r6
	moveq	r0, ip
	moveq	r9, r8
	cmp	lr, r2
	beq	.L4288
.L4296:
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
	bne	.L4327
	add	r3, r8, r3
	add	r3, r3, r6
	b	.L4294
.L4288:
	add	r6, r4, #11141120
	str	r3, [r4, #104]
	add	r0, r6, #16384
	movw	ip, #1620
	ldr	lr, [r0, #100]
	ldr	r1, [r0, #96]
	mul	r1, r1, lr
	cmp	r1, ip
	movgt	r1, r1, asl #7
	ble	.L4328
.L4298:
	ldr	r0, [r4, #32]
	cmp	r0, r2
	bls	.L4299
	cmp	r1, r3
	bcc	.L4299
	ldrb	r3, [r5, #1069]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4329
.L4302:
	mov	r0, r4
	bl	MVC_PicTypeStatistic
	mov	r0, r4
	bl	MVC_DecList
	cmp	r0, #0
	bne	.L4330
	mov	r0, r4
	bl	MVC_IsRefListWrong
	subs	r5, r0, #0
	bne	.L4331
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
.L4285:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4328:
	mov	r0, r1, asl #9
	sub	r1, r0, r1, asl #7
	cmp	r1, #16384
	movlt	r1, #16384
	b	.L4298
.L4329:
	ldr	r1, .L4333+4
	mov	r0, #2
	bl	dprint_vfmw
	add	r6, r6, #12288
	ldr	r3, [r4, #88]
	mov	r2, #0
	str	r2, [r4, #100]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r4, #88]
	ldrb	r3, [r6, #3483]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r4, #92]
	ldrne	r3, [r4, #96]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r4, #92]
	strne	r3, [r4, #96]
	bl	MVC_InitPic
	cmn	r0, #2
	beq	.L4285
	cmp	r0, #0
	bne	.L4332
	mov	r0, r4
	bl	MVC_WritePicMsg
	b	.L4302
.L4326:
	ldr	r1, .L4333+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4333+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4324
	sub	r2, fp, #36
	mvn	r1, #0
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #100
	ldr	r0, [r4, #120]
	blx	r5
.L4324:
	mov	r0, r4
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	b	.L4285
.L4299:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L4333+16
	bl	dprint_vfmw
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #32]
	cmp	r3, r2
	bcc	.L4301
	ldr	r1, .L4333+12
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L4301
	str	r3, [fp, #-44]
	mov	r1, #108
	str	r2, [fp, #-40]
	mov	r3, #8
	sub	r2, fp, #44
	ldr	r0, [r4, #120]
	blx	r5
.L4301:
	ldr	r1, .L4333+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L4285
.L4330:
	mov	r2, r0
	ldr	r1, .L4333+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4285
.L4331:
	ldr	r1, .L4333+28
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4324
.L4332:
	ldr	r1, .L4333+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4285
.L4334:
	.align	2
.L4333:
	.word	.LC400
	.word	.LC467
	.word	.LC401
	.word	g_event_report
	.word	.LC465
	.word	.LC466
	.word	.LC469
	.word	.LC470
	.word	.LC468
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	ip, [r0, #232]
	mov	r5, r1
	mov	r4, r0
	ldr	r3, [ip, #68]
	cmp	r3, #0
	ldrne	r1, [r0, #104]
	movne	r2, ip
	movne	r3, #0
	beq	.L4340
.L4339:
	ldr	r0, [r2, #12]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, r0
	str	r1, [r4, #104]
	ldr	r0, [ip, #68]
	cmp	r0, r3
	bhi	.L4339
.L4340:
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
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #20
	beq	.L4521
.L4338:
	ldr	r2, [r4, #68]
	mov	r0, #22
	ldr	r1, .L4532
	bl	dprint_vfmw
	ldr	r3, [r4, #68]
	movw	r2, #371
	cmp	r3, r2
	beq	.L4522
.L4343:
	ldr	r2, [r4, #232]
	add	r3, r3, #1
	str	r3, [r4, #68]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	sub	r3, r2, #1
	cmp	r3, #29
	ldrls	pc, [pc, r3, asl #2]
	b	.L4344
.L4346:
	.word	.L4345
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4345
	.word	.L4347
	.word	.L4348
	.word	.L4349
	.word	.L4350
	.word	.L4351
	.word	.L4352
	.word	.L4353
	.word	.L4354
	.word	.L4355
	.word	.L4356
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4357
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4344
	.word	.L4358
.L4358:
	mov	r2, #30
	ldr	r1, .L4532+4
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r5, #0
	bne	.L4384
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4384
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	str	r5, [r4, #232]
.L4384:
	mov	r1, #32
	mov	r0, r7
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r7
	bl	BsGet
	ldr	r3, .L4532+8
	rev	r5, r5
	ldr	r2, [r3, #440]
	ldr	r3, [r3, #436]
	rev	r0, r0
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L4502
	ldr	r5, .L4532+12
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4385
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r6
.L4385:
	mov	r6, #0
	mov	r0, r4
	strb	r6, [r4]
	bl	MVC_DecVDM
	cmp	r0, r6
	beq	.L4502
.L4517:
	ldr	r5, [r5]
	cmp	r5, r6
	beq	.L4501
	ldr	r0, [r4, #120]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4371
.L4345:
	ldr	r3, [r4, #80]
	mov	r0, #22
	ldr	r1, .L4532+16
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	add	r0, r4, #11075584
	add	r2, r4, #12288
	add	r0, r0, #40960
	mvn	lr, #0
	ldrb	ip, [r3, #2]	@ zero_extendqisi2
	mov	r1, #0
	strb	ip, [r0, #1067]
	ldrb	r5, [r3, #4]	@ zero_extendqisi2
	strb	r5, [r0, #1072]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	str	lr, [r0, #2704]
	strb	r1, [r0, #1075]
	strb	r3, [r0, #1076]
	ldrb	lr, [r2, #704]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L4523
	cmp	r3, #255
	beq	.L4524
.L4360:
	ldr	r2, [r4, #88]
	mov	r0, #21
	ldr	r1, .L4532+20
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_SliceCheck
	subs	r5, r0, #0
	mov	r0, r4
	bne	.L4525
	bl	MVC_DecSlice
	cmn	r0, #2
	beq	.L4371
	cmp	r0, #0
	beq	.L4502
	ldr	r3, .L4532+12
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L4501
	ldr	r0, [r4, #120]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	r6
.L4501:
	mvn	r0, #0
	b	.L4371
.L4348:
	ldr	r1, .L4532+24
	mov	r2, #7
	ldr	r3, [r4, #72]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecSPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4376
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4376:
	cmp	r5, #0
	bne	.L4526
	ldr	r3, [r4, #72]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #72]
	b	.L4371
.L4347:
	ldr	r1, .L4532+28
	mov	r2, #6
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecSEI
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4378
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4378:
	cmp	r5, #0
	bne	.L4527
.L4502:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4349:
	ldr	r1, .L4532+32
	mov	r2, #8
	ldr	r3, [r4, #76]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecPPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4374
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4374:
	cmp	r5, #0
	bne	.L4528
	ldr	r3, [r4, #76]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #76]
	b	.L4371
.L4350:
	ldr	r1, .L4532+36
	mov	r2, #9
.L4509:
	mov	r0, #22
	bl	dprint_vfmw
.L4514:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4502
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #232]
.L4371:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4351:
	mov	r2, #10
	ldr	r1, .L4532+40
	b	.L4509
.L4352:
	mov	r2, #11
	ldr	r1, .L4532+44
	mov	r0, #22
	bl	dprint_vfmw
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
	bne	.L4514
	ldr	r5, .L4532+12
	mov	r3, #1
	strb	r3, [r4, #1]
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4381
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r6
.L4381:
	mov	r6, #0
	mov	r0, r4
	strb	r6, [r4]
	bl	MVC_DecVDM
	cmp	r0, r6
	beq	.L4514
	b	.L4517
.L4353:
	mov	r2, #12
	ldr	r1, .L4532+48
	b	.L4509
.L4354:
	mov	r2, #13
	ldr	r1, .L4532+52
	b	.L4509
.L4355:
	mov	r2, #14
	ldr	r1, .L4532+56
	b	.L4509
.L4356:
	ldr	r1, .L4532+60
	mov	r2, #15
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecSubSPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4382
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4382:
	cmp	r5, #0
	bne	.L4529
	ldr	r3, [r4, #20]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #20]
	b	.L4371
.L4357:
	mov	r2, #19
	ldr	r1, .L4532+64
	b	.L4509
.L4344:
	mov	r3, r6
	ldr	r1, .L4532+68
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r6, #256
	beq	.L4386
	ldr	r1, .L4532+72
	mov	r0, #1
	bl	dprint_vfmw
.L4386:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4387
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4387:
	ldr	r3, .L4532+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4502
.L4506:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	b	.L4502
.L4522:
	ldr	r1, .L4532+76
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #68]
	b	.L4343
.L4521:
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
	bne	.L4341
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
	beq	.L4530
.L4341:
	ldr	r2, [r3, #64]
	add	r2, r2, #24
	str	r2, [r3, #64]
	ldr	r3, [r4, #232]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	b	.L4338
.L4525:
	bl	MVC_ClearCurrSlice
	ldr	r3, .L4532+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4501
.L4370:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4371
.L4529:
	ldr	r1, .L4532+80
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4532+12
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4501
	sub	r2, fp, #36
	ldr	r0, [r4, #120]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #100
	str	r4, [r2, #-4]!
	blx	r5
	mov	r0, r4
	b	.L4371
.L4526:
	ldr	r5, .L4532+12
	mov	r0, #1
	ldr	r1, .L4532+84
	bl	dprint_vfmw
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L4501
.L4519:
	sub	r2, fp, #36
	mvn	r7, #0
	mov	r3, #4
	mov	r1, #100
	str	r7, [r2, #-4]!
	ldr	r0, [r4, #120]
	blx	r6
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L4370
	b	.L4501
.L4528:
	ldr	r5, .L4532+12
	mov	r0, #1
	ldr	r1, .L4532+88
	bl	dprint_vfmw
	ldr	r6, [r5]
	cmp	r6, #0
	bne	.L4519
	b	.L4501
.L4527:
	ldr	r1, .L4532+92
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4532+12
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L4506
	b	.L4502
.L4524:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L4360
	add	r3, r4, #10747904
	add	r3, r3, #20480
	ldr	r2, [r3, #2384]
	cmp	r2, #0
	beq	.L4363
	ldrb	r2, [r3, #2380]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4364
.L4363:
	add	r3, r4, #12992
	mov	r2, #0
	add	r3, r3, #16
.L4367:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L4365
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L4531
.L4365:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L4367
	mvn	r3, #0
.L4500:
	cmn	r3, #1
	str	r3, [r0, #2704]
	beq	.L4360
	sub	ip, ip, #5
	mov	r3, #1
	clz	ip, ip
	strb	r3, [r0, #1075]
	strb	r3, [r0, #1074]
	mov	ip, ip, lsr #5
	strb	ip, [r0, #1073]
	b	.L4360
.L4523:
	strb	lr, [r0, #1075]
	ldr	r3, [r2, #712]
	str	r3, [r0, #2704]
	ldrb	r3, [r2, #708]	@ zero_extendqisi2
	strb	r3, [r0, #1073]
	ldrb	r3, [r2, #709]	@ zero_extendqisi2
	strb	r3, [r0, #1074]
	strb	r1, [r2, #704]
	b	.L4360
.L4530:
	cmp	r0, #0
	movne	r2, #1
	moveq	r2, #5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #232]
	b	.L4341
.L4531:
	movw	r3, #8500
	movt	r3, 5
	mla	r3, r3, r2, r4
	add	r3, r3, #12992
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	b	.L4500
.L4364:
	ldr	r3, [r3, #2388]
	b	.L4500
.L4533:
	.align	2
.L4532:
	.word	.LC471
	.word	.LC489
	.word	.LANCHOR1
	.word	g_event_report
	.word	.LC473
	.word	.LC474
	.word	.LC477
	.word	.LC479
	.word	.LC475
	.word	.LC481
	.word	.LC482
	.word	.LC484
	.word	.LC483
	.word	.LC485
	.word	.LC486
	.word	.LC487
	.word	.LC488
	.word	.LC490
	.word	.LC491
	.word	.LC472
	.word	.LC340
	.word	.LC478
	.word	.LC476
	.word	.LC480
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	subs	r4, r0, #0
	mov	r2, #0
	str	r2, [fp, #-40]
	str	r2, [fp, #-44]
	str	r2, [fp, #-48]
	beq	.L4598
	cmp	r1, #0
	beq	.L4599
	ldr	r0, [r4, #224]
	ldrb	ip, [r4, #5]	@ zero_extendqisi2
	ldr	r3, [r0, #8]
	cmp	ip, #1
	mov	r3, r3, asl #16
	and	r3, r3, #196608
	str	r3, [r4, #108]
	ldr	r3, [r0]
	str	r3, [r4, #112]
	ldr	r3, [r0, #4]
	strb	r2, [r4, #10]
	str	r3, [r4, #116]
	beq	.L4538
	ldr	r3, [r0, #896]
	cmp	r3, #1
	addne	r5, r4, #11141120
	addne	r5, r5, #16384
	beq	.L4600
.L4539:
	mov	r0, r4
	bl	MVC_ReceivePacket
	ldr	r3, [r4, #232]
	str	r3, [r5, #2644]
.L4541:
	cmp	r0, #0
	mov	r3, #0
	strb	r3, [r4, #5]
	beq	.L4542
.L4561:
	mov	r0, #0
.L4593:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4600:
	ldr	r3, [r0, #952]
	add	r5, r4, #11141120
	add	r5, r5, #16384
	cmp	r3, #1
	bne	.L4539
	ldr	r3, [r5, #2640]
	cmp	r3, #1
	bne	.L4539
	ldr	r3, [r5, #2644]
	str	r3, [r4, #232]
	str	r2, [r5, #2640]
	strb	r2, [r4, #5]
	b	.L4540
.L4542:
	ldr	r3, [r4, #232]
.L4540:
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
	beq	.L4601
.L4596:
	and	r5, r5, #27
	mov	r3, #0
	cmp	r5, #1
	strb	r3, [r4, #10]
	beq	.L4547
.L4548:
	mov	r0, r4
	bl	MVC_FindTrailZeros
	cmp	r0, #0
	bne	.L4602
.L4560:
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
	beq	.L4593
	cmp	r0, r5
	beq	.L4561
	ldr	r3, .L4606
	ldr	r6, [r3]
	cmp	r6, r5
	beq	.L4597
	ldr	r0, [r4, #120]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	r6
.L4597:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4538:
	ldr	r0, [r4, #232]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4541
.L4601:
	mov	r1, #24
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #232]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #5]
	ldr	r1, [r4, #232]
	ldrsb	r2, [r1, #5]
	cmp	r2, #0
	bne	.L4596
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
.L4547:
	sub	r2, fp, #32
	sub	r1, fp, #36
	mov	r0, r4
	bl	MVC_InquireSliceProperty
	cmp	r0, #0
	bne	.L4549
	ldr	r3, [fp, #-36]
	ldr	r2, [r4, #128]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r2, r3
	str	r3, [r4, #128]
	bne	.L4603
.L4550:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L4548
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L4604
.L4557:
	ldr	r0, [r4, #120]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L4548
	sub	r3, fp, #40
	sub	r2, fp, #44
	sub	r1, fp, #48
	ldr	r0, [r4, #120]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #732]
	cmp	r2, #1
	bne	.L4548
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	ble	.L4605
.L4554:
	mov	r3, #1
	mvn	r0, #1
	strb	r3, [r4, #5]
	b	.L4593
.L4602:
	ldr	r1, .L4606+4
	mov	r0, #22
	bl	dprint_vfmw
	b	.L4560
.L4549:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4559
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4559:
	ldr	r3, .L4606
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4597
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	mvn	r0, #0
	b	.L4593
.L4603:
	add	r5, r4, #11075584
	add	r5, r5, #40960
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #132]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #132]
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L4550
	ldr	r3, [r4, #232]
	mov	ip, #0
	mov	r0, r6
	mov	r2, #12
	ldr	r1, .L4606+8
	str	ip, [r3, #64]
	bl	BsInit
	mov	r1, #1
	mov	r0, r4
	bl	MVC_DecOneNal
	ldrb	r3, [r5, #1065]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #132]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #132]
	b	.L4554
.L4604:
	mov	r3, #0
	movw	r2, #13706
	ldr	r1, .L4606+12
	mov	r0, #22
	bl	dprint_vfmw
	b	.L4557
.L4599:
	mov	r0, r1
	ldr	r3, .L4606+16
	movw	r2, #13588
	ldr	r1, .L4606+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4593
.L4598:
	ldr	r3, .L4606+24
	movw	r2, #13587
	ldr	r1, .L4606+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4593
.L4605:
	ldr	r3, [fp, #-44]
	cmp	r3, #32
	bgt	.L4554
	ldr	r3, [r4, #228]
	cmp	r3, #0
	bne	.L4554
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L4548
	ldr	r1, [r4, #12]
	cmp	r1, #0
	beq	.L4548
	add	r5, r4, #11141120
	ldr	lr, [r4, #16]
	add	r5, r5, #16384
	ldr	r0, [r5, #2648]
	cmp	lr, r0
	beq	.L4548
	ldr	ip, [r5, #2652]
	cmp	r1, ip
	beq	.L4548
	stmib	sp, {r0, r1, lr}
	mov	r0, r2
	str	ip, [sp]
	ldr	r1, .L4606+28
	bl	dprint_vfmw
	ldr	r2, .L4606
	ldr	r3, [r4, #16]
	ldr	r7, [r2]
	str	r3, [r5, #2648]
	ldr	r3, [r4, #12]
	cmp	r7, #0
	str	r3, [r5, #2652]
	beq	.L4548
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	r7
	b	.L4548
.L4607:
	.align	2
.L4606:
	.word	g_event_report
	.word	.LC494
	.word	.LANCHOR1+432
	.word	.LC451
	.word	.LC492
	.word	.LC24
	.word	.LC23
	.word	.LC493
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
	subs	r4, r0, #0
	beq	.L4621
	ldr	r2, [r4, #228]
	add	r5, r4, #11141120
	add	r5, r5, #16384
	ldrb	ip, [r2, #17]	@ zero_extendqisi2
	ldr	r3, [r5, #40]
	strb	ip, [r3, #14]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #15]
	ldrb	r7, [r4]	@ zero_extendqisi2
	str	r1, [r5, #92]
	cmp	r7, #0
	beq	.L4622
	bl	MVC_ClearAllSlice
	mov	r0, r4
	bl	MVC_StorePicInDpb
	subs	r2, r0, #0
	bne	.L4623
.L4613:
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	subs	r2, r0, #0
	bne	.L4624
.L4614:
	ldr	ip, [r4, #40]
	add	r3, r4, #11075584
	add	r3, r3, #40960
	mov	r2, #0
	movw	r1, #23352
	strb	r2, [r4, #4]
	mov	r0, r2
	movt	r1, 1
	str	ip, [r3, #2732]
	mov	r5, #2
	strb	r2, [r3, #2720]
	mov	r4, #7
	str	r2, [r3, #2752]
	mov	lr, #32
	str	r2, [r3, #2756]
	mov	ip, #3
	str	r1, [r3, #2736]
	mov	r2, #262144
	mvn	r1, #0
	strb	r5, [r3, #2721]
	strb	r4, [r3, #2723]
	strb	lr, [r3, #2722]
	str	ip, [r3, #2744]
	str	r1, [r3, #2748]
	str	r2, [r3, #2760]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4622:
	bl	MVC_ClearAllSlice
	mov	r0, r4
	bl	MVC_StorePicInDpb
	subs	r6, r0, #0
	bne	.L4625
	mov	r3, #1
	mov	r0, r6
	strb	r3, [r4, #4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4625:
	ldr	r3, [r5, #40]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	mov	r2, r6
	ldr	r1, .L4626
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mov	r0, r4
	mvn	r1, #0
	bl	MVC_ClearDPB
	str	r7, [r5, #40]
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4621:
	ldr	r3, .L4626+4
	movw	r2, #13835
	ldr	r1, .L4626+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4624:
	ldr	r1, .L4626+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4614
.L4623:
	ldr	r1, .L4626+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4613
.L4627:
	.align	2
.L4626:
	.word	.LC495
	.word	.LC23
	.word	.LC24
	.word	.LC497
	.word	.LC496
	UNWIND(.fnend)
	.size	MVC_DEC_VDMPostProc, .-MVC_DEC_VDMPostProc
	.align	2
	.global	MVC_DEC_GetImageBuffer
	.type	MVC_DEC_GetImageBuffer, %function
MVC_DEC_GetImageBuffer:
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
	subs	r5, r0, #0
	beq	.L4667
	ldr	r7, [r5, #48]
	cmp	r7, #0
	beq	.L4645
	movw	r4, #48344
	movw	r9, #47784
	movt	r4, 169
	add	r8, r5, #11075584
	add	r4, r5, r4
	movt	r9, 169
	add	r8, r8, #45056
	add	r9, r5, r9
	mov	ip, r4
	mov	r6, #0
.L4637:
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4632
	cmp	ip, #0
	beq	.L4633
	ldr	lr, [r8, #2920]
	cmp	lr, #0
	beq	.L4633
	ldr	r2, [r8, #2728]
	rsb	r3, ip, r2
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L4632
	mov	r1, r9
	b	.L4634
.L4635:
	ldr	r2, [r1, #4]!
	rsb	r0, ip, r2
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L4632
.L4634:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L4635
.L4633:
	ldr	r0, [r5, #120]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L4645
	ldr	r0, [r5, #120]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	bne	.L4665
	add	r1, r5, #584
	ldr	r0, [r5, #120]
	bl	FSP_ClearNotInVoQueue
	b	.L4665
.L4632:
	add	r6, r6, #1
	add	ip, ip, #824
	cmp	r6, r7
	bne	.L4637
	sub	r2, fp, #40
	sub	r1, fp, #44
	add	r0, r5, #584
	bl	GetQueueImgNum
	ldr	r1, .L4670
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, .L4670+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L4668
	movw	r8, #47784
	add	r7, r5, #11075584
	movt	r8, 169
	add	r7, r7, #45056
	add	r8, r5, r8
	mov	r6, #0
.L4638:
	cmp	r4, #0
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r9, [r4, #5]	@ zero_extendqisi2
	beq	.L4649
	ldr	lr, [r7, #2920]
	cmp	lr, #0
	beq	.L4649
	ldr	r1, [r7, #2728]
	rsb	r2, r4, r1
	cmp	r1, #0
	clz	r2, r2
	mov	r2, r2, lsr #5
	moveq	r2, #0
	cmp	r2, #0
	bne	.L4651
	mov	r0, r8
	b	.L4642
.L4643:
	ldr	r1, [r0, #4]!
	rsb	ip, r4, r1
	cmp	r1, #0
	clz	ip, ip
	mov	ip, ip, lsr #5
	moveq	ip, #0
	cmp	ip, #0
	bne	.L4651
.L4642:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L4643
.L4649:
	mov	r2, #1
.L4641:
	str	r2, [sp, #4]
	mov	r0, #0
	mov	r2, r6
	str	r9, [sp]
	ldr	r1, .L4670+8
	add	r6, r6, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	add	r4, r4, #824
	cmp	r3, r6
	bhi	.L4638
.L4644:
	ldr	r3, [fp, #-40]
	mov	r0, #0
	ldr	r2, [fp, #-44]
	ldr	r1, .L4670+12
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	ldr	r0, [r7, #2924]
	ldr	r2, [fp, #-44]
	sub	r3, r3, #2
	ldr	r1, [fp, #-40]
	rsb	r3, r0, r3
	add	r2, r2, r1
	cmp	r2, r3
	blt	.L4669
.L4665:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4645:
	mov	r0, #1
.L4663:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4651:
	mov	r2, #0
	b	.L4641
.L4669:
	ldr	r1, .L4670+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	mov	r1, #1
	bl	MVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4668:
	add	r7, r5, #11075584
	add	r7, r7, #45056
	b	.L4644
.L4667:
	ldr	r3, .L4670+20
	movw	r2, #13890
	ldr	r1, .L4670+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4663
.L4671:
	.align	2
.L4670:
	.word	.LC498
	.word	.LC499
	.word	.LC501
	.word	.LC500
	.word	.LC502
	.word	.LC23
	.word	.LC24
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
	.type	__FUNCTION__.14902, %object
	.size	__FUNCTION__.14902, 18
__FUNCTION__.14902:
	.ascii	"MVC_WriteSliceMsg\000"
	.space	2
	.type	__func__.15106, %object
	.size	__func__.15106, 17
__func__.15106:
	.ascii	"MVC_Scaling_List\000"
	.space	3
	.type	MVC_SarTable.15194, %object
	.size	MVC_SarTable.15194, 136
MVC_SarTable.15194:
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
	.type	__func__.15429, %object
	.size	__func__.15429, 11
__func__.15429:
	.ascii	"MVC_DecSEI\000"
	.space	1
	.type	__func__.14082, %object
	.size	__func__.14082, 17
__func__.14082:
	.ascii	"MVC_DirectOutput\000"
	.space	3
	.type	__func__.14662, %object
	.size	__func__.14662, 12
__func__.14662:
	.ascii	"MVC_InitDPB\000"
	.type	__FUNCTION__.13802, %object
	.size	__FUNCTION__.13802, 13
__FUNCTION__.13802:
	.ascii	"MVC_ClearDPB\000"
	.space	3
	.type	__func__.15540, %object
	.size	__func__.15540, 17
__func__.15540:
	.ascii	"MVC_FlushDecoder\000"
	.space	3
	.type	__FUNCTION__.13810, %object
	.size	__FUNCTION__.13810, 13
__FUNCTION__.13810:
	.ascii	"MVC_ClearAll\000"
	.space	3
	.type	__FUNCTION__.15667, %object
	.size	__FUNCTION__.15667, 13
__FUNCTION__.15667:
	.ascii	"MVC_DEC_Init\000"
	.space	3
	.type	__func__.14232, %object
	.size	__func__.14232, 18
__func__.14232:
	.ascii	"MVC_StorePicInDpb\000"
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
	ASCII(.ascii	"MVC_FRAME %d, state=%d, is already output\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\012" )
	ASCII(.ascii	"\000" )
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
	ASCII(.ascii	"exg_pts: %lld <-> %lld\012\000" )
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
	ASCII(.ascii	"\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"pMvcCtx->DPB.fs[%d]: frame_num=%d poc=%d is_referen" )
	ASCII(.ascii	"ce=%d\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"pMvcCtx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_ref" )
	ASCII(.ascii	"erence=%d\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"pMvcCtx->DPB.fs_ref[%d]: MVC_FRAME.poc=%d \012\000" )
.LC21:
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"pMvcCtx = NULL\000" )
	.space	1
.LC24:
	ASCII(.ascii	"mvc.c,L%d: %s\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC26:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance fail!\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"for P slice size of list equal 0(1st).\012\000" )
.LC29:
	ASCII(.ascii	"for P slice size of list equal 0(2nd).\012\000" )
.LC30:
	ASCII(.ascii	"for B slice size of two list all equal 0.\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"list[%d][%d]: frame_num=%d, poc=%d\012\000" )
.LC32:
	ASCII(.ascii	"init list error.\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"In one access unit,all non-base view should have th" )
	ASCII(.ascii	"e same subsps!\012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"sps but mvc flag %d is wrong\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"save pic yuv :  structure = %d;  idc = %d\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"structure = %d pMvcCtx->CurrPic.pic_width_in_mb = %" )
	ASCII(.ascii	"d pMvcCtx->CurrPic.pic_height_in_mb = %d\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"logic MVC_FRAME id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC41:
	ASCII(.ascii	"SH: first_mb_in_slice\000" )
	.space	2
.LC42:
	ASCII(.ascii	"MVC_SliceCheck first_mb_in_slice >= MAX_MB_NUM_IN_P" )
	ASCII(.ascii	"IC error.\012\000" )
	.space	2
.LC43:
	ASCII(.ascii	"SH: slice_type\000" )
	.space	1
.LC44:
	ASCII(.ascii	"slice type = %d\012\000" )
	.space	3
.LC45:
	ASCII(.ascii	"slice type = %d, err\012\000" )
	.space	2
.LC46:
	ASCII(.ascii	"slice  pps id = %d\012\000" )
.LC47:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"sps with this pic_parameter_set_id havn't decode\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC49:
	ASCII(.ascii	"subsps with this seq_parameter_set_id = %d havn't d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"tmp slice  pps id = %d\012\000" )
.LC51:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: pps with this pic_parameter_s" )
	ASCII(.ascii	"et_id = %d havn't decode\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: seq_parameter_set_id out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC53:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: sps with this pic_parameter_s" )
	ASCII(.ascii	"et_id = %d havn't decode\012\000" )
	.space	3
.LC54:
	ASCII(.ascii	"new pic flag = %d\012\000" )
	.space	1
.LC55:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l0\000" )
.LC56:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l0\000" )
	.space	2
.LC57:
	ASCII(.ascii	"reorder idc l0 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC58:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l0\000" )
	.space	1
.LC59:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC60:
	ASCII(.ascii	"SH: long_term_pic_idx_l0\000" )
	.space	3
.LC61:
	ASCII(.ascii	"SH: abs_diff_view_idx_minus1_l0\000" )
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
	ASCII(.ascii	"SH: abs_diff_view_idx_minus1_l1\000" )
.LC70:
	ASCII(.ascii	"num of idc l1 exceed\012\000" )
	.space	2
.LC71:
	ASCII(.ascii	"SH: luma_log2_weight_denom\000" )
	.space	1
.LC72:
	ASCII(.ascii	"SH: chroma_log2_weight_denom\000" )
	.space	3
.LC73:
	ASCII(.ascii	"WP log2 exceed  and err flag = %d\012\000" )
	.space	1
.LC74:
	ASCII(.ascii	"SH: luma_weight_flag_l0\000" )
.LC75:
	ASCII(.ascii	"SH: luma_weight_l0\000" )
	.space	1
.LC76:
	ASCII(.ascii	"SH: luma_offset_l0\000" )
	.space	1
.LC77:
	ASCII(.ascii	"SH: chroma_weight_flag_l0\000" )
	.space	2
.LC78:
	ASCII(.ascii	"SH: chroma_weight_l0\000" )
	.space	3
.LC79:
	ASCII(.ascii	"SH: chroma_offset_l0\000" )
	.space	3
.LC80:
	ASCII(.ascii	"SH: luma_weight_flag_l1\000" )
.LC81:
	ASCII(.ascii	"SH: luma_weight_l1\000" )
	.space	1
.LC82:
	ASCII(.ascii	"SH: luma_offset_l1\000" )
	.space	1
.LC83:
	ASCII(.ascii	"SH: chroma_weight_flag_l1\000" )
	.space	2
.LC84:
	ASCII(.ascii	"SH: chroma_weight_l1\000" )
	.space	3
.LC85:
	ASCII(.ascii	"SH: chroma_offset_l1\000" )
	.space	3
.LC86:
	ASCII(.ascii	"overflow MVC_MAX_MMCO_LEN\012\000" )
	.space	1
.LC87:
	ASCII(.ascii	"SH: memory_management_control_operation\000" )
.LC88:
	ASCII(.ascii	"SH: difference_of_pic_nums_minus1\000" )
	.space	2
.LC89:
	ASCII(.ascii	"SH: long_term_pic_num\000" )
	.space	2
.LC90:
	ASCII(.ascii	"SH: long_term_frame_idx\000" )
.LC91:
	ASCII(.ascii	"SH: max_long_term_frame_idx_plus1\000" )
	.space	2
.LC92:
	ASCII(.ascii	"mmco exceed 6\012\000" )
	.space	1
.LC93:
	ASCII(.ascii	"SH: no_output_of_prior_pics_flag\000" )
	.space	3
.LC94:
	ASCII(.ascii	"SH: long_term_reference_flag\000" )
	.space	3
.LC95:
	ASCII(.ascii	"IDR and no_output_of_prior_pics_flag = %d\012\000" )
	.space	1
.LC96:
	ASCII(.ascii	"SH: adaptive_ref_pic_marking_mode_flag\000" )
	.space	1
.LC97:
	ASCII(.ascii	"adaptive_ref_pic_marking_mode_flag = %d\012\000" )
	.space	3
.LC98:
	ASCII(.ascii	"MMCO para would save dec err\012\000" )
	.space	2
.LC99:
	ASCII(.ascii	"mulitislice diff no_out_of_prior_pics_flag, used fi" )
	ASCII(.ascii	"rst.\012\000" )
	.space	3
.LC100:
	ASCII(.ascii	"mulitislice diff long_term_reference_flag, used fir" )
	ASCII(.ascii	"st.\012\000" )
.LC101:
	ASCII(.ascii	"mulitislice diff adaptive_ref_pic_marking_mode_flag" )
	ASCII(.ascii	", used first.\012\000" )
	.space	2
.LC102:
	ASCII(.ascii	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\012\000" )
	.space	1
.LC103:
	ASCII(.ascii	"SH: pic_parameter_set_id\000" )
	.space	3
.LC104:
	ASCII(.ascii	"pps id:%d in sliceheader err\012\000" )
	.space	2
.LC105:
	ASCII(.ascii	"PPS or SPS of this slice not valid\012\000" )
.LC106:
	ASCII(.ascii	"MVC_PPSSPSCheck failed, PPS or SPS of this slice no" )
	ASCII(.ascii	"t valid\012\000" )
.LC107:
	ASCII(.ascii	"SH: frame_num\000" )
	.space	2
.LC108:
	ASCII(.ascii	"IDR NAL but frame_num!=0.\012\000" )
	.space	1
.LC109:
	ASCII(.ascii	"SH: field_pic_flag\000" )
	.space	1
.LC110:
	ASCII(.ascii	"SH: bottom_field_flag\000" )
	.space	2
.LC111:
	ASCII(.ascii	"field first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC112:
	ASCII(.ascii	"MVC_FRAME first_mb_in_slice bigger than pic size\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC113:
	ASCII(.ascii	"SH: idr_pic_id\000" )
	.space	1
.LC114:
	ASCII(.ascii	"idr_pic_id bigger than 65535\012\000" )
	.space	2
.LC115:
	ASCII(.ascii	"SH: pic_order_cnt_lsb\000" )
	.space	2
.LC116:
	ASCII(.ascii	"SH: delta_pic_order_cnt_bottom\000" )
	.space	1
.LC117:
	ASCII(.ascii	"SH: delta_pic_order_cnt[0]\000" )
	.space	1
.LC118:
	ASCII(.ascii	"SH: delta_pic_order_cnt[1]\000" )
	.space	1
.LC119:
	ASCII(.ascii	"SH: redundant_pic_cnt\000" )
	.space	2
.LC120:
	ASCII(.ascii	"redundant pic not support.\012\000" )
.LC121:
	ASCII(.ascii	"first_mb_in_slice in currslice small than prevslice" )
	ASCII(.ascii	" in same pic\012\000" )
	.space	3
.LC122:
	ASCII(.ascii	"SH: direct_spatial_mv_pred_flag\000" )
.LC123:
	ASCII(.ascii	"SH: num_ref_idx_override_flag\000" )
	.space	2
.LC124:
	ASCII(.ascii	"SH: num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC125:
	ASCII(.ascii	"SH: num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC126:
	ASCII(.ascii	"MVC_FRAME num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"field num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"reordering para dec err\012\000" )
	.space	3
.LC129:
	ASCII(.ascii	"apply_weights_flag=%d\012\000" )
	.space	1
.LC130:
	ASCII(.ascii	"wpt dec err\012\000" )
	.space	3
.LC131:
	ASCII(.ascii	"mark para dec err\012\000" )
	.space	1
.LC132:
	ASCII(.ascii	"SH: cabac_init_idc\000" )
	.space	1
.LC133:
	ASCII(.ascii	"cabac_init_idc bigger than 3\012\000" )
	.space	2
.LC134:
	ASCII(.ascii	"SH: slice_qp_delta\000" )
	.space	1
.LC135:
	ASCII(.ascii	"SH: disable_deblocking_filter_idc\000" )
	.space	2
.LC136:
	ASCII(.ascii	"disable_deblocking_filter_idc dec err\012\000" )
	.space	1
.LC137:
	ASCII(.ascii	"SH: slice_alpha_c0_offset_div2\000" )
	.space	1
.LC138:
	ASCII(.ascii	"slice_alpha_c0_offset_div2 dec err\012\000" )
.LC139:
	ASCII(.ascii	"SH: slice_beta_offset_div2\000" )
	.space	1
.LC140:
	ASCII(.ascii	"slice_beta_offset_div2 dec err\012\000" )
.LC141:
	ASCII(.ascii	"pMvcCtx->pCurrNal->nal_bitoffset = %d; code_len_byt" )
	ASCII(.ascii	"e = %d; bitstream_length = %d; pMvcCtx->pCurrNal->n" )
	ASCII(.ascii	"al_trail_zero_bit_num = %d\012\000" )
	.space	2
.LC142:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; byt" )
	ASCII(.ascii	"espos = %x\012\000" )
	.space	1
.LC143:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC144:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\012\000" )
.LC145:
	ASCII(.ascii	": delta_sl\000" )
	.space	1
.LC146:
	ASCII(.ascii	"%s, %d: integer operation overflow\012\000" )
.LC147:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC148:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC149:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC150:
	ASCII(.ascii	"MVC_BASELINE stream with FMO, not support.\012\000" )
.LC151:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC152:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC153:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC154:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC155:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC156:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC157:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC158:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC159:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC160:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC161:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC162:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC163:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC164:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC165:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC166:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC167:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC168:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC169:
	ASCII(.ascii	"MVC_Scaling_List failed\012\000" )
	.space	3
.LC170:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC171:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC172:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC173:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range.\012\000" )
.LC174:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC175:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC176:
	ASCII(.ascii	"PPS decode error line: %d.\012\000" )
.LC177:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC178:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC179:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC180:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC181:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC182:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC183:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC184:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC185:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC186:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC187:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC188:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC189:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC190:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC191:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC192:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC193:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC194:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC195:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC196:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC197:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC198:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC199:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC200:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC201:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC202:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC203:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC204:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC205:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC206:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC207:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC208:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC209:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC210:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC211:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC212:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC213:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC214:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC215:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC216:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC217:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC218:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC219:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC220:
	ASCII(.ascii	"dar=%d, final_dar=%d\012\000" )
	.space	2
.LC221:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC222:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range.\012\000" )
	.space	1
.LC223:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC224:
	ASCII(.ascii	"bit_depth_luma_minus8 not equal 0.\012\000" )
.LC225:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC226:
	ASCII(.ascii	"bit_depth_chroma_minus8 not equal 0.\012\000" )
	.space	2
.LC227:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC228:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC229:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC230:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC231:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC232:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC233:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC234:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC235:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC236:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC237:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC238:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC239:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC240:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC241:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC242:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC243:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC244:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC245:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC246:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC247:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC248:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC249:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC250:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC251:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC252:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC253:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC254:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC255:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC256:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC257:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC258:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC259:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC260:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC261:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC262:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC263:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC264:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC265:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC266:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC267:
	ASCII(.ascii	"SPS: constrained_set4_flag\000" )
	.space	1
.LC268:
	ASCII(.ascii	"SPS: constrained_set5_flag\000" )
	.space	1
.LC269:
	ASCII(.ascii	"SPS: reserved_zero_2bits\000" )
	.space	3
.LC270:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC271:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC272:
	ASCII(.ascii	"MVC_BASELINE stream, try to decode, exit when FMO o" )
	ASCII(.ascii	"ccurred.\012\000" )
	.space	3
.LC273:
	ASCII(.ascii	"MVC_EXTENDED stream, try to decode, exit when datap" )
	ASCII(.ascii	"artition occurred.\012\000" )
	.space	1
.LC274:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC275:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC276:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC277:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC278:
	ASCII(.ascii	"SUBSPS: num_views_minus1\000" )
	.space	3
.LC279:
	ASCII(.ascii	"pSubsps->num_views_minus1(%d) out of range.\012\000" )
	.space	3
.LC280:
	ASCII(.ascii	"SUBSPS: view_id[]\000" )
	.space	2
.LC281:
	ASCII(.ascii	"SUBSPS: num_anchor_refs_l0[]\000" )
	.space	3
.LC282:
	ASCII(.ascii	"SUBSPS: num_anchor_refs_l1[]\000" )
	.space	3
.LC283:
	ASCII(.ascii	"pSubsps->num_anchor_refs_l0(%d) out of range.\012\000" )
	.space	1
.LC284:
	ASCII(.ascii	"SUBSPS: anchor_ref_l0[][]\000" )
	.space	2
.LC285:
	ASCII(.ascii	"pSubsps->num_anchor_refs_l1(%d) out of range.\012\000" )
	.space	1
.LC286:
	ASCII(.ascii	"SUBSPS: anchor_ref_l1[][]\000" )
	.space	2
.LC287:
	ASCII(.ascii	"SUBSPS: num_level_values_signalled_minus1\000" )
	.space	2
.LC288:
	ASCII(.ascii	"SUBSPS: num_non_anchor_refs_l0[]\000" )
	.space	3
.LC289:
	ASCII(.ascii	"SUBSPS: num_non_anchor_refs_l1[]\000" )
	.space	3
.LC290:
	ASCII(.ascii	"pSubsps->num_non_anchor_refs_l0(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC291:
	ASCII(.ascii	"SUBSPS: non_anchor_ref_l0[][]\000" )
	.space	2
.LC292:
	ASCII(.ascii	"pSubsps->num_non_anchor_refs_l1(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC293:
	ASCII(.ascii	"SUBSPS: non_anchor_ref_l1[][]\000" )
	.space	2
.LC294:
	ASCII(.ascii	"num_level(%d) out of range.\012\000" )
	.space	3
.LC295:
	ASCII(.ascii	"SUBSPS: level_idc[]\000" )
.LC296:
	ASCII(.ascii	"SUBSPS: num_applicable_ops_minus1\000" )
	.space	2
.LC297:
	ASCII(.ascii	"num_ops(%d) out of range.\012\000" )
	.space	1
.LC298:
	ASCII(.ascii	"SUBSPS: applicable_op_temporal_id[][]\000" )
	.space	2
.LC299:
	ASCII(.ascii	"SUBSPS: applicable_op_num_target_views_minus1[][]\000" )
	.space	2
.LC300:
	ASCII(.ascii	"SUBSPS: applicable_op_num_views_minus1\000" )
	.space	1
.LC301:
	ASCII(.ascii	"applicable_op_num_target_views(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC302:
	ASCII(.ascii	"SUBSPS: applicable_op_target_view_id[][][]\000" )
	.space	1
.LC303:
	ASCII(.ascii	"pSubsps->applicable_op_num_views_minus1(%d) out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC304:
	ASCII(.ascii	"MVC VUI: vui_mvc_num_ops_minus1\000" )
.LC305:
	ASCII(.ascii	"vui_mvc_num_ops_minus1 %d out of range\012\000" )
.LC306:
	ASCII(.ascii	"MVC VUI: vui_mvc_temporal_id[]\000" )
	.space	1
.LC307:
	ASCII(.ascii	"SUBSPS VUI: vui_mvc_num_target_output_views_minus1[" )
	ASCII(.ascii	"]\000" )
	.space	3
.LC308:
	ASCII(.ascii	"vui_mvc_num_target_output_views_minus1 %d out of ra" )
	ASCII(.ascii	"nge\012\000" )
.LC309:
	ASCII(.ascii	"MVC VUI: vui_mvc_timing_info_present_flag\000" )
	.space	2
.LC310:
	ASCII(.ascii	"MVC VUI: vui_mvc_view_id[][]\000" )
	.space	3
.LC311:
	ASCII(.ascii	"MVC VUI: vui_mvc_num_units_in_tick\000" )
	.space	1
.LC312:
	ASCII(.ascii	"MVC VUI: vui_mvc_time_scale[]\000" )
	.space	2
.LC313:
	ASCII(.ascii	"MVC VUI: vui_mvc_fixed_frame_rate_flag\000" )
	.space	1
.LC314:
	ASCII(.ascii	"MVC VUI: vui_mvc_nal_hrd_parameters_present_flag[]\000" )
	.space	1
.LC315:
	ASCII(.ascii	"MVC VUI: cpb_cnt_minus1\000" )
.LC316:
	ASCII(.ascii	"MVC VUI: bit_rate_scale\000" )
.LC317:
	ASCII(.ascii	"MVC VUI: cpb_size_scale\000" )
.LC318:
	ASCII(.ascii	"MVC VUI: bit_rate_value_minus1\000" )
	.space	1
.LC319:
	ASCII(.ascii	"MVC VUI: cpb_size_value_minus1\000" )
	.space	1
.LC320:
	ASCII(.ascii	"MVC VUI: cbr_flag\000" )
	.space	2
.LC321:
	ASCII(.ascii	"MVC VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC322:
	ASCII(.ascii	"MVC VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC323:
	ASCII(.ascii	"MVC VUI: dpb_output_delay_length_minus1\000" )
.LC324:
	ASCII(.ascii	"MVC VUI: time_offset_length\000" )
.LC325:
	ASCII(.ascii	"MVC VUI: vui_mvc_vcl_hrd_parameters_present_flag[]\000" )
	.space	1
.LC326:
	ASCII(.ascii	"MVC VUI: vui_mvc_low_delay_hrd_flag[]\000" )
	.space	2
.LC327:
	ASCII(.ascii	"MVC VUI: vui_mvc_pic_struct_present_flag[]\000" )
	.space	1
.LC328:
	ASCII(.ascii	"SUBSPS: profile_idc\000" )
.LC329:
	ASCII(.ascii	"SUBSPS: constrained_set0_flag\000" )
	.space	2
.LC330:
	ASCII(.ascii	"SUBSPS: constrained_set1_flag\000" )
	.space	2
.LC331:
	ASCII(.ascii	"SUBSPS: constrained_set2_flag\000" )
	.space	2
.LC332:
	ASCII(.ascii	"SUBSPS: constrained_set3_flag\000" )
	.space	2
.LC333:
	ASCII(.ascii	"SUBSPS: constrained_set4_flag\000" )
	.space	2
.LC334:
	ASCII(.ascii	"SUBSPS: constrained_set5_flag\000" )
	.space	2
.LC335:
	ASCII(.ascii	"SUBSPS: reserved_zero_2bits\000" )
.LC336:
	ASCII(.ascii	"SUBSPS: level_idc\000" )
	.space	2
.LC337:
	ASCII(.ascii	"SUBSPS: seq_parameter_set_id\000" )
	.space	3
.LC338:
	ASCII(.ascii	"profile_idc = %5d error\012\000" )
	.space	3
.LC339:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc 4" )
	ASCII(.ascii	"1.\012\000" )
	.space	1
.LC340:
	ASCII(.ascii	"SUBSPS decode error.\012\000" )
	.space	2
.LC341:
	ASCII(.ascii	"SUBSPS: bit_equal_to_one\000" )
	.space	3
.LC342:
	ASCII(.ascii	"SUBSPS Mvc Ext decode error.\012\000" )
	.space	2
.LC343:
	ASCII(.ascii	"SUBSPS: mvc_vui_parameters_present_flag\000" )
.LC344:
	ASCII(.ascii	"SUBSPS Mvc Vui Ext decode error.\012\000" )
	.space	2
.LC345:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC346:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC347:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC348:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC349:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC350:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC351:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC352:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC353:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC354:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC355:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC356:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC357:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC358:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC359:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC360:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC361:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC362:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC363:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC364:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC365:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC366:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC367:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC368:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC369:
	ASCII(.ascii	"MVC_SEI_BUFFERING_PERIOD,offset = %d,payload_size =" )
	ASCII(.ascii	" %d \012\000" )
	.space	3
.LC370:
	ASCII(.ascii	"MVC_PassBytes err [%s][%d]\012\000" )
.LC371:
	ASCII(.ascii	"MVC_SEI_PIC_TIMING,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC372:
	ASCII(.ascii	"MVC_SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC373:
	ASCII(.ascii	"MVC_SEI_FILLER_PAYLOAD,offset = %d,payload_size = %" )
	ASCII(.ascii	"d \012\000" )
	.space	1
.LC374:
	ASCII(.ascii	"MVC_SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d" )
	ASCII(.ascii	", payload_size = %d \012\000" )
	.space	3
.LC375:
	ASCII(.ascii	"MVC_SEI_USER_DATA_UNREGISTERED, offset = %d, payloa" )
	ASCII(.ascii	"d_size = %d \012\000" )
	.space	3
.LC376:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC377:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC378:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC379:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC380:
	ASCII(.ascii	"MVC_SEI_RECOVERY_POINT,offset = %d,payload_size = %" )
	ASCII(.ascii	"d \012\000" )
	.space	1
.LC381:
	ASCII(.ascii	"MVC_SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC382:
	ASCII(.ascii	"MVC_SEI_SPARE_PIC,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC383:
	ASCII(.ascii	"MVC_SEI_SCENE_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC384:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC385:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,p" )
	ASCII(.ascii	"ayload_size = %d \012\000" )
	.space	2
.LC386:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload" )
	ASCII(.ascii	"_size = %d \012\000" )
.LC387:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_FREEZE,offset = %d,payload_size " )
	ASCII(.ascii	"= %d \012\000" )
	.space	2
.LC388:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC389:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC390:
	ASCII(.ascii	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset" )
	ASCII(.ascii	" = %d,payload_size = %d \012\000" )
	.space	3
.LC391:
	ASCII(.ascii	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset =" )
	ASCII(.ascii	" %d,payload_size = %d \012\000" )
	.space	1
.LC392:
	ASCII(.ascii	"MVC_SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset =" )
	ASCII(.ascii	" %d,payload_size = %d \012\000" )
	.space	1
.LC393:
	ASCII(.ascii	"MVC_SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC394:
	ASCII(.ascii	"MVC_SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset" )
	ASCII(.ascii	" = %d,payload_size = %d \012\000" )
	.space	3
.LC395:
	ASCII(.ascii	"MVC_SEI_STEREO_VIDEO_INFO,offset = %d,payload_size " )
	ASCII(.ascii	"= %d \012\000" )
	.space	2
.LC396:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC397:
	ASCII(.ascii	"pNewPicDetector = NULL\000" )
	.space	1
.LC398:
	ASCII(.ascii	"pu8 = NULL\000" )
	.space	1
.LC399:
	ASCII(.ascii	"\012 mvc the stream is error,len:%d\012\000" )
	.space	2
.LC400:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC401:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC402:
	ASCII(.ascii	"MVC_InquireSliceProperty mvc flag %d is wrong\012\000" )
	.space	1
.LC403:
	ASCII(.ascii	"mvc.c,L%d: pMvcCtx is NULL\012\000" )
.LC404:
	ASCII(.ascii	"MvcDec destroy\012\000" )
.LC405:
	ASCII(.ascii	"PicID is out of range\000" )
	.space	2
.LC406:
	ASCII(.ascii	"MVC recycle image\012\000" )
	.space	1
.LC407:
	ASCII(.ascii	"pH264Ctx is %#x, pFrameStore is %#x\012\000" )
	.space	3
.LC408:
	ASCII(.ascii	"line: %d, pstLogicFsImage is NULL\012\000" )
	.space	1
.LC409:
	ASCII(.ascii	"InsertVO err:%d, MVC_ClearAll\012\000" )
	.space	1
.LC410:
	ASCII(.ascii	"mvc.c line %d: MVC_FRAME para err(ret=%d), recycle " )
	ASCII(.ascii	"image self\012\000" )
	.space	1
.LC411:
	ASCII(.ascii	"%s, %d: pos as index of array, out of range\012\000" )
	.space	3
.LC412:
	ASCII(.ascii	"[%s][%d] MVC_OutputFrmToVO return %d !\012\000" )
.LC413:
	ASCII(.ascii	"[%s][%d] MVC_OutputFrmToVO return %d\012\000" )
	.space	2
.LC414:
	ASCII(.ascii	"%s %d MVC_OK != MVC_FlushDPB!!\012\000" )
.LC415:
	ASCII(.ascii	"%s %d MVC_OK != MVC_InitDPB!!\012\000" )
	.space	1
.LC416:
	ASCII(.ascii	"----------------- MVC_IMODE -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC417:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC418:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pMvcCtx->CurrPic.s" )
	ASCII(.ascii	"tructure=%d.\012\000" )
	.space	3
.LC419:
	ASCII(.ascii	"MVC_DecVDM fail [%s][%d]\012\000" )
	.space	2
.LC420:
	ASCII(.ascii	"\012 receive streambuff=%p; phy_addr=0x%x; bitstrea" )
	ASCII(.ascii	"m_length=%d\012\000" )
	.space	3
.LC421:
	ASCII(.ascii	"nal_releaMVC_SE_ERR\012\000" )
	.space	3
.LC422:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC423:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC424:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC425:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC426:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC427:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC428:
	ASCII(.ascii	"FS_ALLOC_ERR, MVC_ClearAll\012\000" )
.LC429:
	ASCII(.ascii	"Can not new logic fs! MVC_ClearAll\012\000" )
.LC430:
	ASCII(.ascii	"mvc.c,L%d: pMvcCtx or pstExtraData is NULL\012\000" )
.LC431:
	ASCII(.ascii	"%s %d NULL== pMvcCtx->SPS || NULL == pMvcCtx->PPS |" )
	ASCII(.ascii	"| NULL == pMvcCtx->DecSlicePara!!\012\000" )
	.space	2
.LC432:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC433:
	ASCII(.ascii	"CurrPic.state is 'MVC_EMPTY'\012\000" )
	.space	2
.LC434:
	ASCII(.ascii	"MVC_StorePicInDpb return(%d) from L%d\012\000" )
	.space	1
.LC435:
	ASCII(.ascii	"Is IDR, but init DPB failed!\012\000" )
	.space	2
.LC436:
	ASCII(.ascii	"Is IDR, but FlushDPB failed!\012\000" )
	.space	2
.LC437:
	ASCII(.ascii	"MVC_DirectOutput mode\012\000" )
	.space	1
.LC438:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC439:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC440:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC441:
	ASCII(.ascii	"MVC_Marking return %d\012\000" )
	.space	1
.LC442:
	ASCII(.ascii	"line %d: pMvcCtx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC443:
	ASCII(.ascii	"line %d, MVC_GetMinPOC failed\012\000" )
	.space	1
.LC444:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC445:
	ASCII(.ascii	"GAP found while DPB is MVC_EMPTY!\012\000" )
	.space	1
.LC446:
	ASCII(.ascii	"MVC_FRAME num gap try to fill it \012\000" )
	.space	1
.LC447:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC448:
	ASCII(.ascii	"cann't allocate MVC_FRAME store when gap find\012\000" )
	.space	1
.LC449:
	ASCII(.ascii	"allocate MVC_FRAME store when gap find\012\000" )
.LC450:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC451:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC452:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC453:
	ASCII(.ascii	"resolution error, the CAP_LEVEL_USER_DEFINE_WITH_OP" )
	ASCII(.ascii	"TION channel with s32ReRangeEn == 0 can't support s" )
	ASCII(.ascii	"uch bitstream.\012\000" )
	.space	2
.LC454:
	ASCII(.ascii	"s32MaxRefFrameNum < pMvcCtx->DPB.size, the CAP_LEVE" )
	ASCII(.ascii	"L_USER_DEFINE_WITH_OPTION channel can't support suc" )
	ASCII(.ascii	"h bitstream.\012\000" )
.LC455:
	ASCII(.ascii	"mem arrange err, MVC_ClearAll\012\000" )
	.space	1
.LC456:
	ASCII(.ascii	"line %d: MVC_FRAME gap(=%d) > dpb size(=%d)\012\000" )
	.space	3
.LC457:
	ASCII(.ascii	"MVC_FRAME num gap don't allowed but gap find\012\000" )
	.space	2
.LC458:
	ASCII(.ascii	"line %d: frame num(%d/%d) find gap in NON-I slice b" )
	ASCII(.ascii	"ut here gap is not allowed\012\000" )
	.space	1
.LC459:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC460:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC461:
	ASCII(.ascii	"dec_pts: %lld\012\000" )
	.space	1
.LC462:
	ASCII(.ascii	"dec_usertag: %lld\012\000" )
	.space	1
.LC463:
	ASCII(.ascii	"line %d: CurrPic.frame_store is NULL\012\000" )
	.space	2
.LC464:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC465:
	ASCII(.ascii	"Start Reason: SliceParaNum, MaxBytesReceived = %d, " )
	ASCII(.ascii	"%d(thr=%d)\012\000" )
	.space	1
.LC466:
	ASCII(.ascii	"Too many slice or bitstream, err!\012\000" )
	.space	1
.LC467:
	ASCII(.ascii	"Start Reason: new_pic_flag\012\000" )
.LC468:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC469:
	ASCII(.ascii	"MVC_DecList error, ret=%d\012\000" )
	.space	1
.LC470:
	ASCII(.ascii	"dec list err.\012\000" )
	.space	1
.LC471:
	ASCII(.ascii	"pMvcCtx->TotalNal = %d, type:%d\012\000" )
	.space	3
.LC472:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC473:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC474:
	ASCII(.ascii	"*******TotalPicNum=%d********\012\000" )
	.space	1
.LC475:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC476:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC477:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC478:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC479:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC480:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC481:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC482:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC483:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC484:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC485:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC486:
	ASCII(.ascii	"***** NAL: PREFIX, nal_unit_type=%d\012\000" )
	.space	3
.LC487:
	ASCII(.ascii	"***** NAL: SUBSPS, nal_unit_type=%d\012\000" )
	.space	3
.LC488:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC489:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC490:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC491:
	ASCII(.ascii	"nal_header != 0x00000100 not support.\012\000" )
	.space	1
.LC492:
	ASCII(.ascii	"pPacket= NULL\000" )
	.space	2
.LC493:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC494:
	ASCII(.ascii	"MVC_FindTrailZeros ERR\012\000" )
.LC495:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC496:
	ASCII(.ascii	"MVC_IMODE nal store pic err, ret = %d\012\000" )
	.space	1
.LC497:
	ASCII(.ascii	"MVC_IMODE nal flush dpb err, ret = %d\012\000" )
	.space	1
.LC498:
	ASCII(.ascii	"cann't find FrameStore\012\000" )
.LC499:
	ASCII(.ascii	"========== MVC FrameStore state(is_used, is_in_dpb," )
	ASCII(.ascii	" MVC_IsOutDPB) ========\012\000" )
.LC500:
	ASCII(.ascii	"ReadImgNum = %d, NewImgNum = %d\012\000" )
	.space	3
.LC501:
	ASCII(.ascii	"%02d: %d %d %d\012\000" )
.LC502:
	ASCII(.ascii	"FrameStore leak, MVC_ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.15113, %object
	.size	pps_tmp.15113, 2240
pps_tmp.15113:
	.space	2240
	.type	sps_tmp.15251, %object
	.size	sps_tmp.15251, 3992
sps_tmp.15251:
	.space	3992
	.type	MvcTmpBuf, %object
	.size	MvcTmpBuf, 68
MvcTmpBuf:
	.space	68
	.type	cnt.14068, %object
	.size	cnt.14068, 4
cnt.14068:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
