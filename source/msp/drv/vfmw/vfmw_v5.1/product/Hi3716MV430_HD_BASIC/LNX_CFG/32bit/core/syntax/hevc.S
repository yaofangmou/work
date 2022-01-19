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
	ldr	r2, [r2, #4]
	ldr	r3, [r3, #4]
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
	.type	HEVC_CheckThatAllRefPicsAreAvailable.part.8, %function
HEVC_CheckThatAllRefPicsAreAvailable.part.8:
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
	ldr	r2, [r0, #2376]
	mov	ip, #1888
	ldr	r3, [r7, #2460]
	movw	r4, #12644
	str	r1, [fp, #-64]
	ldr	r1, [r7, #3360]
	mla	ip, ip, r3, r2
	ldr	r3, [r7, #3356]
	ldr	lr, [r0, #2372]
	mov	r2, #1
	add	r3, r1, r3
	str	r3, [fp, #-60]
	mov	r5, r3
	ldr	r3, [r7, #3364]
	ldr	r1, [ip, #32]
	cmp	r5, r3
	mla	r1, r4, r1, lr
	ldr	r10, [r1, #116]
	mov	r10, r2, asl r10
	bcs	.L6
	add	r3, r3, #7424
	add	r9, r5, #7424
	add	r6, r5, #1888
	add	r3, r3, #40
	add	r9, r9, #40
	ldr	r1, [r0, #2596]
	add	lr, r0, r3
	sub	r10, r10, #1
	add	r9, r0, r9
	add	r6, r0, r6, lsl #2
	mov	r2, #0
	str	r2, [fp, #-52]
	str	r2, [fp, #-56]
.L7:
	cmp	r1, #0
	beq	.L13
	add	r3, r0, #2608
	mov	r8, #0
	add	r3, r3, #8
	mov	r2, r8
	ldr	r5, [r6, #-944]
	str	r0, [fp, #-48]
	b	.L10
.L50:
	cmp	r4, #0
	beq	.L9
	ldr	r4, [r6]
	ldr	r0, [ip, #4]
	cmp	r0, r4
	beq	.L48
.L9:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r1
	beq	.L49
.L10:
	ldr	ip, [r3]
	cmp	r5, #0
	ldr	r4, [ip, #56]
	bne	.L50
	cmp	r4, #0
	beq	.L9
	ldr	r4, [ip, #4]
	ldr	r0, [r6]
	eor	r4, r4, r0
	tst	r4, r10
	bne	.L9
.L48:
	ldrb	ip, [ip, #1]	@ zero_extendqisi2
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	ip, #0
	movne	r8, #1
	cmp	r2, r1
	bne	.L10
.L49:
	cmp	r8, #0
	ldr	r0, [fp, #-48]
	beq	.L13
.L11:
	add	r9, r9, #1
	add	r6, r6, #4
	cmp	r9, lr
	bne	.L7
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L15
.L14:
	add	r5, r0, #7424
	ldr	r10, [fp, #-60]
	ldr	ip, [fp, #-56]
	mov	r8, #0
	mov	r9, r5
	add	r5, r5, #60
	add	r9, r9, #40
.L19:
	cmp	r1, #0
	beq	.L20
	add	r4, r0, #2608
	mov	r6, #0
	add	r4, r4, #4
	mov	r3, r6
	str	r0, [fp, #-48]
	b	.L17
.L16:
	cmp	r3, r1
	beq	.L51
.L17:
	ldr	r2, [r4, #4]!
	add	r3, r3, #1
	ldr	lr, [r2, #56]
	cmp	lr, #0
	bne	.L16
	ldr	r0, [r5]
	ldr	lr, [r7, #2436]
	add	lr, lr, r0
	ldr	r0, [r2, #4]
	cmp	r0, lr
	bne	.L16
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r6, #1
	cmp	r3, r1
	bne	.L17
.L51:
	cmp	r6, #0
	ldr	r0, [fp, #-48]
	beq	.L20
.L18:
	add	r8, r8, #1
	add	r5, r5, #4
	cmp	r10, r8
	add	r9, r9, #1
	bhi	.L19
	str	ip, [fp, #-56]
.L15:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L24
	ldr	r3, [fp, #-64]
	mov	r0, #0
	ldr	r2, [fp, #-52]
	str	r2, [r3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L20:
	ldr	r2, [r7, #2456]
	ldr	r3, [r7, #2436]
	add	r2, r2, #56
	ldr	lr, [r5]
	ldr	r2, [r0, r2, asl #2]
	add	r3, r3, lr
	cmp	r3, r2
	blt	.L18
	ldrb	r2, [r9]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [fp, #-52]
	movne	ip, #1
	movne	r2, r3
	str	r2, [fp, #-52]
	b	.L18
.L13:
	ldr	r2, [r7, #2456]
	ldr	r3, [r7, #2436]
	add	r2, r2, #56
	ldr	ip, [r6, #-68]
	ldr	r2, [r0, r2, asl #2]
	add	r3, r3, ip
	cmp	r3, r2
	blt	.L11
	ldrb	r2, [r9]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [fp, #-52]
	movne	r2, r3
	ldr	r3, [fp, #-56]
	str	r2, [fp, #-52]
	movne	r3, #1
	str	r3, [fp, #-56]
	b	.L11
.L24:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L6:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L24
	mov	r3, #0
	ldr	r1, [r0, #2596]
	str	r3, [fp, #-52]
	str	r3, [fp, #-56]
	b	.L14
	UNWIND(.fnend)
	.size	HEVC_CheckThatAllRefPicsAreAvailable.part.8, .-HEVC_CheckThatAllRefPicsAreAvailable.part.8
	.align	2
	.type	HEVC_SetFrmRepeatCount.part.9, %function
HEVC_SetFrmRepeatCount.part.9:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, [r0, #288]
	ldr	r2, [r0, #2592]
	ldr	r3, [r0, #284]
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
	ldrhi	r3, [r0, #288]
	ldrls	r3, [r0, #288]
	addhi	r3, r3, #2
	addls	r3, r3, #1
	str	r3, [r0, #288]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount.part.9, .-HEVC_SetFrmRepeatCount.part.9
	.align	2
	.type	HEVC_OutputFrame.isra.10, %function
HEVC_OutputFrame.isra.10:
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
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r0, #248]
	ldr	r1, [r1]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L62
	mov	r2, #1
	ldr	r1, [r5]
	ldr	r0, [r4, #248]
	bl	FSP_SetDisplay
	add	r3, r4, #7872
	ldr	r0, [r4, #248]
	add	r3, r3, #8
	str	r6, [sp]
	mov	r2, r4
	mov	r1, #16
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L63
	ldr	r3, [r4, #2412]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r6, #16]
	bcs	.L64
.L61:
	ldr	r2, [r4, #296]
	mov	r0, #0
	ldr	r3, [r4, #288]
	add	r2, r2, #1
	str	r2, [r4, #296]
	add	r3, r3, #1
	str	r3, [r4, #288]
.L58:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L64:
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.9
	b	.L61
.L63:
	ldr	r3, .L65
	movw	r1, #10617
	ldr	r2, .L65+4
	mov	r0, #1
	bl	dprint_normal
	ldr	r0, [r4, #248]
	ldr	r1, [r5]
	mov	r2, #0
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L58
.L62:
	ldr	r3, .L65
	movw	r1, #10589
	ldr	r2, .L65+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L58
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.word	.LC3
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVC_OutputFrame.isra.10, .-HEVC_OutputFrame.isra.10
	.align	2
	.global	HEVC_SaveMetadata
	.type	HEVC_SaveMetadata, %function
HEVC_SaveMetadata:
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
	ldr	r5, .L69
	mov	r6, r0
	mov	r7, r1
	mov	r8, r2
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r4, .L69+4
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
.L70:
	.align	2
.L69:
	.word	g_SaveMetadataFileHandler
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_SaveMetadata, .-HEVC_SaveMetadata
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
	ldr	r3, .L72
	mov	r4, r0
	add	r0, r0, #13120
	mov	r2, #56
	mov	r1, #0
	add	r0, r0, #48
	ldr	r3, [r3, #48]
	blx	r3
	add	r3, r4, #2896
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	strd	r0, [r3, #40]
	strd	r0, [r3, #16]
	strd	r0, [r3, #24]
	strd	r0, [r3, #32]
	str	r2, [r4, #2892]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L73:
	.align	2
.L72:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	add	r3, r0, #4096
	ldr	r1, [r0, #168]
	ldr	ip, [r3, #2460]
	cmp	ip, #0
	blt	.L76
	cmp	ip, r1
	bge	.L76
	ldr	r3, [r0, #2376]
	mov	r1, #1888
	mla	ip, r1, ip, r3
	ldr	r1, [r0, #164]
	ldr	ip, [ip, #32]
	cmp	ip, #0
	blt	.L80
	cmp	ip, r1
	bge	.L80
	ldr	lr, [r0, #2372]
	movw	r4, #12644
	ldr	r1, [r2, #36]
	add	r3, r0, #12288
	mla	ip, r4, ip, lr
	str	r1, [r3, #892]
	ldr	lr, [r2, #40]
	ldr	r1, [r3, #884]
	str	lr, [r3, #896]
	cmp	r1, #1
	ldr	r1, [ip, #52]
	add	ip, ip, r1, lsl #2
	ldrb	ip, [ip, #356]	@ zero_extendqisi2
	beq	.L88
	ldrb	r1, [r3, #881]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L84
	ldrb	r1, [r0, #2888]	@ zero_extendqisi2
	cmp	r1, #0
	add	r1, r0, #2896
	beq	.L85
	ldrd	r4, [r1, #24]
	mov	r8, r4
	mov	r9, r5
.L86:
	ldr	r6, [r0, #2904]
	mov	r7, #0
	adds	r4, r4, r6
	adc	r5, r5, r7
	cmp	r4, r8
	sbcs	lr, r5, r9
	strd	r4, [r1, #40]
	strd	r4, [r1, #16]
	bge	.L83
	adds	r4, r6, r8
	adc	r5, r7, r9
	strd	r4, [r1, #40]
	strd	r4, [r1, #16]
	b	.L83
.L80:
	ldr	r2, [r0, #248]
	movw	r3, #2834
	str	r1, [sp, #8]
	mov	r0, #0
	mov	r1, r3
	str	ip, [sp, #4]
	str	r2, [sp]
	ldr	r2, .L90
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L76:
	ldr	r2, [r0, #248]
	movw	r3, #2824
	str	r1, [sp, #8]
	mov	r0, #0
	mov	r1, r3
	str	ip, [sp, #4]
	str	r2, [sp]
	ldr	r2, .L90+4
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L84:
	add	r1, r0, #2896
	ldr	lr, [r0, #2904]
	ldrd	r4, [r1, #16]
	adds	r4, r4, lr
	adc	r5, r5, #0
	strd	r4, [r1, #40]
.L83:
	add	lr, r3, #880
	strd	r4, [r1, #32]
	mov	r1, #0
	strb	r1, [r3, #881]
	ldrd	r6, [lr, #32]
	strd	r6, [lr, #48]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	cmp	r3, r1
	ldr	r3, [r0, #2908]
	bne	.L89
	adds	r4, r4, r3
	adc	r5, r5, #0
	subs	r4, r4, ip
	sbc	r5, r5, #0
	strd	r4, [lr, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L89:
	adds	r4, r4, r3
	adc	r5, r5, #0
	movs	r5, r5, asr #1
	mov	r4, r4, rrx
	subs	r4, r4, ip
	sbc	r5, r5, #0
	strd	r4, [lr, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L88:
	ldr	r4, [r0, #2892]
	add	r1, r0, #2896
	mov	r5, r4, asr #31
	strd	r4, [r1, #40]
	strd	r4, [r1, #16]
	b	.L83
.L85:
	ldrd	r4, [r1, #16]
	ldrd	r8, [r1, #24]
	b	.L86
.L91:
	.align	2
.L90:
	.word	.LC5
	.word	.LC4
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
	bls	.L96
.L93:
	sub	r1, r1, #6
	cmp	r1, #3
	addhi	r0, r0, #2896
	ldrhid	r2, [r0, #40]
	strhid	r2, [r0, #24]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L96:
	ldr	ip, [r0, #2412]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r4, [ip, #32]
	cmp	r5, r3
	cmpeq	r4, r2
	beq	.L94
	add	r2, r0, #13184
	movw	lr, #13200
	movw	ip, #13216
	strd	r4, [r2, #8]
	mov	r3, r2
	ldrd	r4, [r0, lr]
	strd	r4, [r3, #24]
	strd	r4, [r0, ip]
.L94:
	add	r3, r0, #12288
	mov	r2, #1
	strb	r2, [r3, #880]
	b	.L93
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
	add	r2, r0, #13184
	add	r1, r0, #12288
	add	r3, r2, #32
	ldrd	r6, [r2, #8]
	mov	r4, r0
	ldr	r5, [r1, #892]
	movw	r0, #13200
	ldrd	r2, [r3, #-8]
	cmp	r5, #0
	strd	r6, [fp, #-52]
	ldr	r10, [r1, #896]
	strd	r2, [fp, #-60]
	ldrd	r6, [r4, r0]
	beq	.L100
	mov	r9, r5
	mov	r0, r10
	b	.L99
.L101:
	mov	r9, r1
.L99:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L101
.L98:
	ldrd	r2, [fp, #-60]
	mov	r1, r9
	mov	r0, r5
	mov	r8, #1000
	subs	r2, r6, r2
	movw	r5, #6192
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
.L100:
	mov	r9, r10
	b	.L98
	UNWIND(.fnend)
	.size	HEVC_Sei_Get_Frame_Pts, .-HEVC_Sei_Get_Frame_Pts
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
	moveq	r4, r0
	beq	.L103
	subs	lr, r0, #255
	movne	lr, #1
	cmp	r0, #16
	movle	r4, #0
	andgt	r4, lr, #1
	cmp	r4, #0
	movne	r4, #0
	bne	.L103
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
	cmp	r0, #255
	movne	r1, #0
	andeq	r1, r1, #1
	cmp	r1, #0
	bne	.L103
	cmp	r0, #1
	beq	.L130
	cmp	lr, #0
	ldrne	r3, .L133
	addne	r0, r3, r0, lsl #3
	ldrne	r2, [r0, #24]
	ldrne	ip, [r0, #20]
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
	ble	.L131
	sub	r2, r0, #2256
	sub	r2, r2, #7
	cmp	r3, r2
	bge	.L109
.L123:
	mov	r4, #4
.L103:
	mov	r3, r4
	ldr	r2, .L133+4
	movw	r1, #3037
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L131:
	rsb	r2, r0, #2256
	add	r2, r2, #7
	cmp	r3, r2
	blt	.L123
.L109:
	movw	r3, #1819
	cmp	r0, r3
	bgt	.L110
	rsb	r3, r0, #1808
	add	r3, r3, #12
	cmp	r2, r3
	blt	.L125
.L111:
	movw	r2, #1364
	cmp	r0, r2
	rsble	r0, r0, #1360
	subgt	r0, r0, #1360
	addle	r0, r0, #5
	subgt	r0, r0, #5
	cmp	r3, r0
	movlt	r4, #2
	movge	r4, #1
	b	.L103
.L130:
	ldr	r2, [fp, #4]
	movw	r3, #4320
	cmp	r5, #7680
	cmpeq	r2, r3
	bne	.L132
.L120:
	mov	r4, #2
	b	.L103
.L110:
	sub	r3, r0, #1808
	sub	r3, r3, #12
	cmp	r2, r3
	bge	.L111
.L125:
	mov	r4, #3
	b	.L103
.L132:
	cmp	r5, #3840
	cmpeq	r2, #2160
	beq	.L120
	sub	r3, r2, #1072
	sub	r3, r3, #8
	bics	r3, r3, #8
	moveq	r3, #1
	movne	r3, #0
	cmp	r5, #1920
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L120
	cmp	r5, #1280
	cmpeq	r2, #720
	beq	.L120
	cmp	r5, #640
	cmpeq	r2, #480
	moveq	r4, #1
	movne	r4, #5
	b	.L103
.L134:
	.align	2
.L133:
	.word	.LANCHOR0
	.word	.LC6
	UNWIND(.fnend)
	.size	HEVC_GetDar, .-HEVC_GetDar
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
	UNWIND(.pad #84)
	sub	sp, sp, #84
	ldr	r2, .L151
	mov	r8, r0
	movw	r1, #3048
	mov	r0, #1
	bl	dprint_normal
	ldr	r4, [r8, #2604]
	ldr	r2, [r8, #2596]
	movw	r1, #3050
	ldr	lr, [r8, #2612]
	mov	r0, #1
	ldr	ip, [r8, #2608]
	ldr	r3, [r8, #2592]
	str	r4, [sp, #12]
	stmia	sp, {r2, ip, lr}
	ldr	r2, .L151+4
	bl	dprint_normal
	ldr	r3, [r8, #2596]
	cmp	r3, #0
	addne	r4, r8, #2608
	movne	r5, #0
	addne	r4, r4, #4
	beq	.L140
.L139:
	ldr	r3, [r4, #4]!
	ldr	r0, [r8, #248]
	ldr	r2, [r3, #28]
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r6, [r3, #44]
	ldrb	r7, [r3, #1]	@ zero_extendqisi2
	str	r2, [fp, #-48]
	ldr	r2, [r3, #56]
	ldr	r1, [r3, #24]
	str	ip, [fp, #-52]
	ldrb	r9, [r3, #2]	@ zero_extendqisi2
	ldr	r10, [r3, #4]
	str	r2, [fp, #-64]
	str	r6, [fp, #-56]
	str	r7, [fp, #-60]
	bl	FSP_GetLogicFs
	ldr	r3, [r4]
	ldr	r1, [r3, #24]
	mov	r6, r0
	ldr	r0, [r8, #248]
	bl	FSP_GetRef
	ldr	r3, [r4]
	ldr	r1, [r3, #24]
	mov	r7, r0
	ldr	r0, [r8, #248]
	bl	FSP_GetDisplay
	ldr	ip, [r4]
	ldr	r2, [fp, #-64]
	mov	r3, r5
	movw	r1, #3061
	add	r5, r5, #1
	ldr	lr, [ip, #160]
	str	lr, [sp, #48]
	ldr	lr, [ip, #24]
	str	r2, [sp, #28]
	str	r10, [sp, #24]
	ldr	r2, [fp, #-48]
	str	lr, [sp, #44]
	str	r9, [sp, #20]
	ldr	r10, [fp, #-60]
	ldr	r9, [fp, #-56]
	ldr	lr, [fp, #-52]
	str	r2, [sp, #4]
	str	r10, [sp, #16]
	str	r9, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp]
	str	r7, [sp, #36]
	str	r6, [sp, #32]
	ldr	r2, .L151+8
	str	r0, [sp, #40]
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r8, #2596]
	cmp	r3, r5
	bhi	.L139
.L140:
	ldr	r2, .L151+12
	movw	r1, #3064
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r8, #2596]
	cmp	r3, #0
	addne	r7, r8, #2608
	movne	r5, #0
	addne	r7, r7, #4
	bne	.L145
	b	.L138
.L150:
	bl	dprint_normal
	ldr	r3, [r6, #76]
	ldr	r2, .L151+16
	movw	r1, #3095
	mov	r0, #1
	bl	dprint_normal
.L144:
	mov	r0, #1
	ldr	r2, .L151+12
	movw	r1, #3102
	add	r5, r5, r0
	bl	dprint_normal
	ldr	r3, [r8, #2596]
	cmp	r3, r5
	bls	.L138
.L145:
	ldr	r3, [r7, #4]!
	ldr	r0, [r8, #248]
	ldr	r1, [r3, #24]
	bl	FSP_GetLogicFs
	mov	r3, r5
	ldr	r2, .L151+20
	movw	r1, #3078
	subs	r4, r0, #0
	mov	r0, #1
	beq	.L149
	ldr	r6, [r4, #24]
	bl	dprint_normal
	mov	r3, r4
	ldr	r2, .L151+24
	movw	r1, #3082
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #12]
	ldr	r2, .L151+28
	movw	r1, #3083
	mov	r0, #1
	bl	dprint_normal
	ldrsb	r3, [r4]
	ldr	r2, .L151+32
	movw	r1, #3084
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #20]
	ldr	r2, .L151+36
	movw	r1, #3085
	mov	r0, #1
	bl	dprint_normal
	cmp	r6, #0
	mov	r3, r6
	ldr	r2, .L151+40
	movw	r1, #3094
	mov	r0, #1
	bne	.L150
	ldr	r2, .L151+44
	movw	r1, #3099
	mov	r0, #1
	bl	dprint_normal
	b	.L144
.L138:
	ldr	r2, .L151+48
	movw	r1, #3105
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L149:
	mov	r1, #3072
	ldr	r3, .L151+52
	str	r1, [sp]
	ldr	r2, .L151+56
	bl	dprint_normal
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L152:
	.align	2
.L151:
	.word	.LC7
	.word	.LC8
	.word	.LC10
	.word	.LC9
	.word	.LC19
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC20
	.word	.LC11
	.word	.LANCHOR0+156
	.word	.LC12
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
	bls	.L155
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L155:
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
	add	r3, r0, #4096
	ldr	r3, [r3, #1840]
	cmp	r3, #0
	bne	.L160
	ldr	r2, [r0, #2412]
	ldr	r1, [r2, #632]
	cmp	r1, #1
	beq	.L164
.L162:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L160:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L164:
	ldr	r0, [r2, #628]
	cmp	r0, #0
	bne	.L162
	ldr	r3, [r2, #636]
	cmp	r3, #0
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, [r2, #592]
	add	r3, r3, #1024
	cmp	r3, #2048
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
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	ldr	r0, [r4, #2364]
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
	ldr	r1, [r0, #2400]
	mov	r5, r2
	ldr	r2, [r0, #2396]
	mov	r4, r0
	str	r3, [fp, #-48]
	ldr	r6, [r1, #68]
	ldr	r2, [r2, #128]
	sub	r3, r6, #1
	ldr	r8, [r1, #72]
	cmp	r3, #9
	str	r2, [fp, #-52]
	bhi	.L194
	sub	r3, r8, #1
	cmp	r3, #10
	bhi	.L195
	ldr	r9, .L196
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
	ble	.L175
	ldr	r3, [fp, #-52]
	mov	ip, #0
	mov	lr, ip
	mov	r9, r5
	sub	r10, r3, #4
.L174:
	str	ip, [r5, lr, asl #3]
	mov	r3, ip, asl r10
	ldr	r2, [r4, #2400]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #172]
	add	ip, r2, ip
	sub	r2, ip, #1
	str	r2, [r9, #4]
	mov	r1, ip, asl r10
	cmp	r3, r1
	bge	.L180
	cmp	r3, #255
	bhi	.L176
	uxtb	r0, lr
	add	r2, r7, r3
	b	.L178
.L179:
	cmp	r3, #256
	beq	.L176
.L178:
	add	r3, r3, #1
	strb	r0, [r2], #1
	cmp	r3, r1
	bne	.L179
.L180:
	add	lr, lr, #1
	add	r9, r9, #8
	cmp	lr, r6
	bne	.L174
.L175:
	cmp	r8, #0
	ble	.L172
	ldr	r3, [fp, #-52]
	mov	ip, #0
	ldr	r9, [fp, #-48]
	mov	lr, ip
	sub	r5, r3, #4
	mov	r6, r9
.L182:
	str	ip, [r9, lr, asl #3]
	mov	r3, ip, asl r5
	ldr	r2, [r4, #2400]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #212]
	add	ip, r2, ip
	sub	r2, ip, #1
	str	r2, [r6, #4]
	mov	r1, ip, asl r5
	cmp	r3, r1
	bge	.L187
	cmp	r3, #255
	bhi	.L183
	add	r2, r3, #255
	uxtb	r0, lr
	add	r2, r7, r2
	b	.L185
.L186:
	cmp	r3, #256
	beq	.L183
.L185:
	add	r3, r3, #1
	strb	r0, [r2, #1]!
	cmp	r3, r1
	bne	.L186
.L187:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, r8
	bne	.L182
.L172:
	mov	r0, #0
	b	.L168
.L176:
	str	r3, [sp]
	movw	r1, #3545
	ldr	r3, .L196+4
	mov	r0, #1
	ldr	r2, .L196+8
	bl	dprint_normal
	mvn	r0, #0
.L168:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L183:
	str	r3, [sp]
	movw	r1, #3569
	ldr	r3, .L196+4
	mov	r0, #1
	ldr	r2, .L196+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L168
.L195:
	mov	r2, #11
	str	r8, [sp]
	str	r2, [sp, #4]
	movw	r1, #3524
	ldr	r3, .L196+4
	mov	r0, #1
	ldr	r2, .L196+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L168
.L194:
	mov	r2, #10
	str	r6, [sp]
	str	r2, [sp, #4]
	movw	r1, #3518
	ldr	r3, .L196+4
	mov	r0, #1
	ldr	r2, .L196+20
	bl	dprint_normal
	mvn	r0, #0
	b	.L168
.L197:
	.align	2
.L196:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+176
	.word	.LC23
	.word	.LC24
	.word	.LC22
	.word	.LC21
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
	ldr	r2, [r0, #2364]
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
	ldr	r3, .L206
	mov	r5, r1
	mov	r2, #32
	ldr	r1, [r0, #2364]
	sub	r0, fp, #52
	ldr	r3, [r3, #52]
	mov	r5, r5, asl #3
	blx	r3
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	rsb	r3, r2, r3
	cmp	r3, r5
	movcs	r0, #0
	bcc	.L205
.L200:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L205:
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsShow
	cmp	r0, #0
	moveq	r0, #1
	beq	.L200
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
	b	.L201
.L202:
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
.L201:
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
	bne	.L202
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L207:
	.align	2
.L206:
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
	beq	.L216
	mov	r1, #8
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r6, #3
	mov	r7, r0
.L215:
	cmp	r7, #0
	bne	.L210
	mov	r4, #16
.L211:
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	subs	r4, r4, #1
	bne	.L211
.L212:
	subs	r6, r6, #1
	bne	.L215
.L220:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L210:
	cmp	r7, #1
	beq	.L219
	cmp	r7, #2
	bne	.L212
	mov	r1, #32
	ldr	r0, [r5, #2364]
	bl	BsGet
	subs	r6, r6, #1
	bne	.L215
	b	.L220
.L219:
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	subs	r6, r6, #1
	bne	.L215
	b	.L220
.L216:
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
	beq	.L223
	mov	r1, #1
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L223:
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
	beq	.L227
	add	r7, r1, #12
	mov	r4, r1
	mov	r3, #1
	strb	r3, [r1]
.L226:
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #4]!
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r4, r7
	str	r0, [r4, #12]
	bne	.L226
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #28]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #32]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #36]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r3, #0
	str	r0, [r6, #40]
.L225:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L227:
	mvn	r3, #0
	b	.L225
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
	beq	.L231
	mov	r3, #1
	mov	r1, #16
	strb	r3, [r5]
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #2]	@ movhi
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r3, r4
	strh	r0, [r5, #4]	@ movhi
.L230:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L231:
	mvn	r3, #0
	b	.L230
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
	beq	.L234
	ldr	r0, [r0, #2364]
	mov	r1, #8
	bl	BsGet
	mov	r3, r4
	strb	r0, [r5]
.L233:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L234:
	mvn	r3, #0
	b	.L233
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
	beq	.L237
	mov	r1, #1
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r0, [r5, #2364]
	bl	BsToNextByte
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L237:
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
	beq	.L241
	mov	r1, #1
	ldr	r0, [r0, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L242
.L240:
	ldr	r0, [r4, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L242:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L240
.L241:
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
	beq	.L245
	mov	r1, #4
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #1]
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r3, r4
	mov	r2, #1
	strb	r2, [r5]
	strb	r0, [r5, #2]
.L244:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L245:
	mvn	r3, #0
	b	.L244
	UNWIND(.fnend)
	.size	HEVC_Sei_TSI, .-HEVC_Sei_TSI
	.align	2
	.global	HEVC_Sei_HDR10PLUS
	.type	HEVC_Sei_HDR10PLUS, %function
HEVC_Sei_HDR10PLUS:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r6, r1
	beq	.L275
	mov	r1, #8
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r6, #6]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #2
	strb	r0, [r6, #7]
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r3, r0
	str	r3, [fp, #-48]
	cmp	r3, #1
	strb	r3, [r6, #8]
	movhi	r7, #1
	bls	.L252
.L251:
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r6, r7, lsl #1
	mov	r1, #16
	add	r8, r6, r7
	add	r7, r7, #1
	uxtb	r7, r7
	strh	r0, [r5, #10]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #16]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #22]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #28]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #34]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strh	r0, [r5, #40]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r8, #46]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #50]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #56]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	strh	r0, [r5, #62]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r7, #2
	ldr	r2, [fp, #-48]
	movls	r3, #1
	movhi	r3, #0
	cmp	r2, r7
	movls	r3, #0
	cmp	r3, #0
	strb	r0, [r8, #68]
	bne	.L251
.L252:
	mov	r1, #27
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #72]
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r6, #76]
	bne	.L306
.L250:
	ldr	r3, [fp, #-48]
	adds	r3, r3, #0
	movne	r3, #1
	cmp	r3, #0
	str	r3, [fp, #-52]
	movne	r8, #0
	beq	.L257
.L260:
	sxth	r5, r8
	mov	r3, r5, asl #4
	sub	r5, r3, r5, asl #2
	add	r7, r5, #1040
	mov	r5, r7
	add	r7, r7, #12
	add	r5, r6, r5
	add	r7, r6, r7
.L258:
	mov	r1, #17
	ldr	r0, [r4, #2364]
	bl	BsGet
	str	r0, [r5, #4]!
	cmp	r5, r7
	bne	.L258
	mov	r1, #17
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r3, r8, #268
	add	r3, r3, #2
	mov	r1, #4
	add	r7, r6, r8
	str	r0, [r6, r3, asl #2]
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1092]
	cmp	r0, #0
	beq	.L262
	mov	r5, #15
	mov	r2, #60
	mla	r5, r5, r8, r6
	mov	r9, #0
	mla	r2, r2, r8, r6
	add	r5, r5, #1088
	add	r5, r5, #6
	add	r10, r2, #1136
.L261:
	mov	r1, #7
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #17
	strb	r0, [r5, #1]!
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r3, r9, #1
	uxtb	r9, r3
	str	r0, [r10, #4]!
	ldrb	r1, [r7, #1092]	@ zero_extendqisi2
	cmp	r1, r9
	movhi	r1, #1
	movls	r1, #0
	cmp	r9, #14
	movhi	r1, #0
	cmp	r1, #0
	bne	.L261
.L262:
	mov	r1, #10
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r2, r8, #1
	add	r3, r8, #660
	ldr	r1, [fp, #-48]
	uxtb	r8, r2
	cmp	r8, #2
	mov	r3, r3, asl #1
	movls	r2, #1
	movhi	r2, #0
	cmp	r1, r8
	movls	r2, #0
	cmp	r2, #0
	strh	r0, [r6, r3]	@ movhi
	bne	.L260
.L257:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r6, #1328]
	bne	.L307
.L263:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	movne	r7, #0
	bne	.L273
	b	.L274
.L271:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r9, #2416]
	bne	.L308
.L270:
	add	r7, r7, #1
	ldr	r2, [fp, #-48]
	uxtb	r7, r7
	cmp	r7, #2
	movls	r3, #1
	movhi	r3, #0
	cmp	r2, r7
	movls	r3, #0
	cmp	r3, #0
	beq	.L274
.L273:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	sxth	r5, r7
	add	r9, r6, r5, lsl #2
	cmp	r0, #0
	str	r0, [r9, #2296]
	beq	.L271
	mov	r1, #12
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r6, r5, lsl #1
	add	r3, r5, #2304
	mov	r1, #12
	add	r5, r5, #2304
	add	r8, r6, r7
	strh	r0, [r3, #4]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #4
	strh	r0, [r5, #10]	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #2320]
	cmp	r0, #0
	beq	.L271
	mov	r2, #30
	mov	r5, #0
	mla	r2, r2, r7, r6
	add	r10, r2, #2320
	add	r10, r10, #2
.L272:
	mov	r1, #10
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r5, #1
	uxtb	r5, r5
	strh	r0, [r10, #2]!	@ movhi
	ldrb	r3, [r8, #2320]	@ zero_extendqisi2
	cmp	r3, r5
	movhi	r3, #1
	movls	r3, #0
	cmp	r5, #14
	movhi	r3, #0
	cmp	r3, #0
	bne	.L272
	b	.L271
.L308:
	mov	r1, #6
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r3, r6, r7
	strb	r0, [r3, #2428]
	b	.L270
.L274:
	mov	r3, #1
	mov	r0, #0
	str	r3, [r6, #2432]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L306:
	mov	r1, #5
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r6, #80]
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldrb	r3, [r6, #80]	@ zero_extendqisi2
	cmp	r3, #0
	uxtb	r0, r0
	strb	r0, [r6, #81]
	beq	.L250
	add	r8, r6, #81
	mov	r7, #0
.L253:
	cmp	r0, #0
	movne	r10, r8
	movne	r5, #0
	beq	.L255
.L254:
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r5, #1
	uxtb	r5, r5
	strb	r0, [r10, #1]!
	ldrb	r3, [r6, #81]	@ zero_extendqisi2
	cmp	r3, r5
	movhi	r3, #1
	movls	r3, #0
	cmp	r5, #30
	movhi	r3, #0
	cmp	r3, #0
	bne	.L254
	ldrb	r3, [r6, #80]	@ zero_extendqisi2
.L255:
	add	r7, r7, #1
	add	r8, r8, #31
	uxtb	r7, r7
	cmp	r3, r7
	movhi	r2, #1
	movls	r2, #0
	cmp	r7, #30
	movhi	r2, #0
	cmp	r2, #0
	beq	.L250
	ldrb	r0, [r6, #81]	@ zero_extendqisi2
	b	.L253
.L307:
	mov	r1, #5
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r6, #1332]
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldrb	r3, [r6, #1332]	@ zero_extendqisi2
	cmp	r3, #0
	uxtb	r0, r0
	strb	r0, [r6, #1333]
	beq	.L263
	add	r8, r6, #1328
	mov	r7, #0
	add	r8, r8, #5
.L264:
	cmp	r0, #0
	movne	r10, r8
	movne	r5, #0
	beq	.L266
.L265:
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r5, #1
	uxtb	r5, r5
	strb	r0, [r10, #1]!
	ldrb	r3, [r6, #1333]	@ zero_extendqisi2
	cmp	r3, r5
	movhi	r3, #1
	movls	r3, #0
	cmp	r5, #30
	movhi	r3, #0
	cmp	r3, #0
	bne	.L265
	ldrb	r3, [r6, #1332]	@ zero_extendqisi2
.L266:
	add	r7, r7, #1
	add	r8, r8, #31
	uxtb	r7, r7
	cmp	r3, r7
	movhi	r2, #1
	movls	r2, #0
	cmp	r7, #30
	movhi	r2, #0
	cmp	r2, #0
	beq	.L263
	ldrb	r0, [r6, #1333]	@ zero_extendqisi2
	b	.L264
.L275:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_HDR10PLUS, .-HEVC_Sei_HDR10PLUS
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
	bls	.L322
.L312:
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	subs	r4, r4, #1
	bne	.L312
	subs	r6, r6, #16
	beq	.L315
.L313:
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r4, #5
	subls	r3, fp, #36
	strlsb	r0, [r4, r3]
	add	r4, r4, #1
	cmp	r6, r4
	bne	.L313
	cmp	r6, #5
	bls	.L315
	ldr	r2, [fp, #-36]
	movw	r3, #21572
	movt	r3, 12615
	cmp	r2, r3
	beq	.L323
.L315:
	mov	r0, #0
.L311:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L323:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	add	r5, r5, #24576
	sub	r3, r3, #65
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r5, #2376]
	cmp	r3, #0
	beq	.L315
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	mov	r0, #0
	and	r3, r3, #15
	str	r3, [r5, #2380]
	b	.L311
.L322:
	ldr	r2, .L324
	movw	r1, #6281
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L311
.L325:
	.align	2
.L324:
	.word	.LC25
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
	ldr	r2, [r7, #2492]
	cmp	r2, #0
	beq	.L327
	ldr	r4, [r0, #2424]
	cmp	r4, #0
	beq	.L328
	ldr	r3, [r4, #16]
	cmp	r3, #0
	addne	r6, r0, #2416
	movne	r4, #0
	addne	r6, r6, #8
	bne	.L333
	b	.L371
.L334:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L335
	ldr	r2, [r7, #2492]
	add	r4, r4, #1
	cmp	r4, r2
	bcs	.L372
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	beq	.L328
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L329
.L333:
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L334
.L335:
	add	ip, r4, #604
	str	r0, [sp, #4]
	add	ip, ip, #2
	mov	r3, r4
	ldr	r2, .L376
	movw	r1, #6353
	ldr	ip, [r5, ip, asl #2]
	mov	r0, #1
	ldr	ip, [ip, #16]
	str	ip, [sp]
	bl	dprint_normal
.L332:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L372:
	cmp	r2, #0
	beq	.L327
	ldr	r3, [r7, #2496]
	cmp	r3, #0
	beq	.L327
	ldr	r4, [r5, #2492]
	cmp	r4, #0
	beq	.L340
	ldr	r3, [r4, #16]
	cmp	r3, #0
	addne	r6, r5, #2480
	movne	r4, #0
	addne	r6, r6, #12
	bne	.L344
	b	.L373
.L345:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L346
	ldr	r3, [r7, #2496]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L327
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	beq	.L374
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L375
.L344:
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L345
.L346:
	str	r0, [sp]
	mov	r3, r4
	ldr	r2, .L376+4
	movw	r1, #6389
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L366
.L327:
	mov	r0, #0
.L366:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L328:
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L376+8
	movw	r1, #6337
	mov	r0, #1
	bl	dprint_normal
	b	.L332
.L371:
	mov	r4, r3
.L329:
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L376+12
	movw	r1, #6344
	mov	r0, #1
	bl	dprint_normal
	b	.L332
.L374:
	ldr	r2, [r7, #2492]
.L340:
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L376+16
	movw	r1, #6373
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L366
.L375:
	ldr	r2, [r7, #2492]
.L341:
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L376+20
	movw	r1, #6380
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L366
.L373:
	mov	r4, r3
	b	.L341
.L377:
	.align	2
.L376:
	.word	.LC28
	.word	.LC31
	.word	.LC26
	.word	.LC27
	.word	.LC29
	.word	.LC30
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
	mvn	r5, #0
	str	r5, [r1]
	ldr	r4, [r0, #2596]
	cmp	r4, #16
	bhi	.L379
	cmp	r4, #0
	addne	ip, r0, #2608
	mvnne	r5, #-2147483648
	addne	ip, ip, #4
	movne	r3, #0
	beq	.L381
.L384:
	ldr	r2, [ip, #4]!
	ldr	lr, [r2, #4]
	cmp	lr, r5
	bge	.L383
	ldr	r2, [r2]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	streq	r3, [r1]
	ldreq	r4, [r0, #2596]
	moveq	r5, lr
.L383:
	add	r3, r3, #1
	cmp	r4, r3
	bhi	.L384
	ldr	r3, [r1]
	cmn	r3, #1
	beq	.L381
	str	r3, [sp]
	movw	r1, #6441
	str	r5, [sp, #4]
	mov	r0, #1
	ldr	r3, .L387
	ldr	r2, .L387+4
	bl	dprint_normal
	mov	r0, #0
.L382:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L379:
	str	r4, [sp]
	movw	r1, #6419
	ldr	r3, .L387
	mov	r0, #1
	ldr	r2, .L387+8
	bl	dprint_normal
	mov	r0, r5
	b	.L382
.L381:
	ldr	r3, .L387
	movw	r1, #6436
	ldr	r2, .L387+12
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L382
.L388:
	.align	2
.L387:
	.word	.LANCHOR0+196
	.word	.LC34
	.word	.LC32
	.word	.LC33
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
	ldr	r3, [r0, #2592]
	mov	r4, r0
	cmp	r3, #16
	bhi	.L393
	ldr	r0, [r0, #248]
	bl	FSP_GetMinAvailableDecFsNum
	cmp	r0, #0
	ble	.L392
	ldr	r3, [r4, #2592]
	add	r3, r3, #1
	cmp	r0, r3
	bcc	.L392
	str	r3, [r4, #2592]
	movw	r1, #6462
	str	r3, [sp]
	mov	r0, #11
	ldr	r3, .L394
	ldr	r2, .L394+4
	bl	dprint_normal
	mov	r0, #0
.L391:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L392:
	str	r0, [sp]
	movw	r1, #6467
	ldr	r3, .L394
	mov	r0, #1
	ldr	r2, .L394+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L391
.L393:
	str	r3, [sp]
	mov	r5, #17
	ldr	r3, .L394
	movw	r1, #6452
	str	r5, [sp, #4]
	mov	r0, #1
	ldr	r2, .L394+12
	bl	dprint_normal
	str	r5, [r4, #2592]
	mvn	r0, #0
	b	.L391
.L395:
	.align	2
.L394:
	.word	.LANCHOR0+224
	.word	.LC36
	.word	.LC37
	.word	.LC35
	UNWIND(.fnend)
	.size	HEVC_IncreaseDPBSize, .-HEVC_IncreaseDPBSize
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
	ldr	r3, [r0, #2452]
	sub	r2, r3, #16
	cmp	r2, #5
	bls	.L397
	ldr	r3, [r0, #1828]
	sub	r3, r3, #16
	cmp	r3, #5
	bls	.L408
	ldr	r3, [r0, #2444]
	cmp	r3, #1
	beq	.L400
	cmp	r3, #2
	beq	.L401
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r0, #1840]
	ldmfd	sp, {fp, sp, pc}
.L397:
	str	r3, [r0, #1828]
	mov	r3, #0
	str	r3, [r0, #1840]
	ldmfd	sp, {fp, sp, pc}
.L400:
	ldr	r2, [r0, #1840]
	cmp	r2, #2
	beq	.L409
	str	r3, [r0, #1840]
	ldmfd	sp, {fp, sp, pc}
.L401:
	ldr	r3, [r0, #1840]
	sub	r3, r3, #1
	cmp	r3, #1
	movhi	r3, #0
	strhi	r3, [r0, #1840]
	ldmfd	sp, {fp, sp, pc}
.L409:
	ldmfd	sp, {fp, sp, pc}
.L408:
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
	ldr	r0, [r0, #2452]
	cmp	r0, #15
	bhi	.L411
	tst	r0, #1
	bne	.L413
.L411:
	sub	r0, r0, #16
	cmp	r0, #7
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L413:
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
	ldr	r0, [r1, #612]
	ldr	r3, [r1, #616]
	ldrb	ip, [r1, #604]	@ zero_extendqisi2
	ldrb	lr, [r1, #608]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #612]
	ldrb	lr, [r1, #605]	@ zero_extendqisi2
	ldrb	r3, [r1, #617]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #609]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #4]
	ldr	r0, [r1, #608]
	ldrb	lr, [r1, #606]	@ zero_extendqisi2
	ldrb	r3, [r1, #618]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #614]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #8]
	ldr	r0, [r1, #616]
	ldrb	r3, [r1, #611]	@ zero_extendqisi2
	ldrb	lr, [r1, #607]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #615]	@ zero_extendqisi2
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
	ldr	r1, [r0, #1764]
	ldr	r3, [r0, #1780]
	ldrb	ip, [lr, #604]	@ zero_extendqisi2
	ldrb	r4, [r0, #1772]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1796]
	ldr	r3, [r0, #1812]
	ldrb	ip, [r0, #1788]	@ zero_extendqisi2
	ldrb	r4, [r0, #1804]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1764]
	ldrb	r4, [lr, #605]	@ zero_extendqisi2
	ldrb	r3, [r0, #1781]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1773]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1796]
	ldrb	r4, [r0, #1789]	@ zero_extendqisi2
	ldrb	r3, [r0, #1813]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1805]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1772]
	ldrb	r4, [lr, #606]	@ zero_extendqisi2
	ldrb	r3, [r0, #1782]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1766]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1804]
	ldrb	r4, [r0, #1790]	@ zero_extendqisi2
	ldrb	r3, [r0, #1814]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1798]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1780]
	ldrb	lr, [lr, #607]	@ zero_extendqisi2
	ldrb	r3, [r0, #1775]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1767]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1812]
	ldrb	lr, [r0, #1791]	@ zero_extendqisi2
	ldrb	r3, [r0, #1807]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1799]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1768]
	ldr	r3, [r0, #1784]
	ldrb	ip, [r0, #1760]	@ zero_extendqisi2
	ldrb	lr, [r0, #1776]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1800]
	ldr	r3, [r0, #1816]
	ldrb	ip, [r0, #1792]	@ zero_extendqisi2
	ldrb	lr, [r0, #1808]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1768]
	ldrb	lr, [r0, #1761]	@ zero_extendqisi2
	ldrb	r3, [r0, #1785]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1777]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1800]
	ldrb	lr, [r0, #1793]	@ zero_extendqisi2
	ldrb	r3, [r0, #1817]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1809]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1776]
	ldrb	lr, [r0, #1762]	@ zero_extendqisi2
	ldrb	r3, [r0, #1786]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1770]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1808]
	ldrb	lr, [r0, #1794]	@ zero_extendqisi2
	ldrb	r3, [r0, #1818]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1802]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1784]
	ldrb	lr, [r0, #1763]	@ zero_extendqisi2
	ldrb	r3, [r0, #1779]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1771]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1816]
	ldrb	ip, [r0, #1795]	@ zero_extendqisi2
	ldrb	r3, [r0, #1811]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1803]	@ zero_extendqisi2
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
	ldr	r1, [r0, #1004]
	ldr	r3, [r0, #1036]
	ldrb	ip, [lr, #604]	@ zero_extendqisi2
	ldrb	r4, [r0, #1020]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1012]
	ldr	r3, [r0, #1044]
	ldrb	ip, [r0, #996]	@ zero_extendqisi2
	ldrb	r4, [r0, #1028]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1004]
	ldrb	r4, [lr, #605]	@ zero_extendqisi2
	ldrb	r3, [r0, #1037]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1021]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1012]
	ldrb	r4, [r0, #997]	@ zero_extendqisi2
	ldrb	r3, [r0, #1045]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1029]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1020]
	ldrb	r4, [lr, #606]	@ zero_extendqisi2
	ldrb	r3, [r0, #1038]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1006]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1028]
	ldrb	r4, [r0, #998]	@ zero_extendqisi2
	ldrb	r3, [r0, #1046]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1014]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1036]
	ldrb	lr, [lr, #607]	@ zero_extendqisi2
	ldrb	r3, [r0, #1023]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1007]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1044]
	ldrb	lr, [r0, #999]	@ zero_extendqisi2
	ldrb	r3, [r0, #1031]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1015]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1008]
	ldr	r3, [r0, #1040]
	ldrb	ip, [r0, #992]	@ zero_extendqisi2
	ldrb	lr, [r0, #1024]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1016]
	ldr	r3, [r0, #1048]
	ldrb	ip, [r0, #1000]	@ zero_extendqisi2
	ldrb	lr, [r0, #1032]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1008]
	ldrb	lr, [r0, #993]	@ zero_extendqisi2
	ldrb	r3, [r0, #1041]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1025]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1016]
	ldrb	lr, [r0, #1001]	@ zero_extendqisi2
	ldrb	r3, [r0, #1049]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1033]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1024]
	ldrb	lr, [r0, #994]	@ zero_extendqisi2
	ldrb	r3, [r0, #1042]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1010]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1032]
	ldrb	lr, [r0, #1002]	@ zero_extendqisi2
	ldrb	r3, [r0, #1050]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1018]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1040]
	ldrb	lr, [r0, #995]	@ zero_extendqisi2
	ldrb	r3, [r0, #1027]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1011]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1048]
	ldrb	ip, [r0, #1003]	@ zero_extendqisi2
	ldrb	r3, [r0, #1035]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1019]	@ zero_extendqisi2
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
	ldr	r1, [r0, #1380]
	ldr	r3, [r0, #1396]
	ldrb	ip, [lr, #604]	@ zero_extendqisi2
	ldrb	r4, [r0, #1388]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1412]
	ldr	r3, [r0, #1428]
	ldrb	ip, [r0, #1404]	@ zero_extendqisi2
	ldrb	r4, [r0, #1420]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1380]
	ldrb	r4, [lr, #605]	@ zero_extendqisi2
	ldrb	r3, [r0, #1397]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1389]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1412]
	ldrb	r4, [r0, #1405]	@ zero_extendqisi2
	ldrb	r3, [r0, #1429]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1421]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1388]
	ldrb	r4, [lr, #606]	@ zero_extendqisi2
	ldrb	r3, [r0, #1398]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1382]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1420]
	ldrb	r4, [r0, #1406]	@ zero_extendqisi2
	ldrb	r3, [r0, #1430]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1414]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1396]
	ldrb	lr, [lr, #607]	@ zero_extendqisi2
	ldrb	r3, [r0, #1391]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1383]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1428]
	ldrb	lr, [r0, #1407]	@ zero_extendqisi2
	ldrb	r3, [r0, #1423]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1415]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1384]
	ldr	r3, [r0, #1400]
	ldrb	ip, [r0, #1376]	@ zero_extendqisi2
	ldrb	lr, [r0, #1392]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1416]
	ldr	r3, [r0, #1432]
	ldrb	ip, [r0, #1408]	@ zero_extendqisi2
	ldrb	lr, [r0, #1424]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1384]
	ldrb	lr, [r0, #1377]	@ zero_extendqisi2
	ldrb	r3, [r0, #1401]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1393]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1416]
	ldrb	lr, [r0, #1409]	@ zero_extendqisi2
	ldrb	r3, [r0, #1433]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1425]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1392]
	ldrb	lr, [r0, #1378]	@ zero_extendqisi2
	ldrb	r3, [r0, #1402]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1386]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1424]
	ldrb	lr, [r0, #1410]	@ zero_extendqisi2
	ldrb	r3, [r0, #1434]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1418]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1400]
	ldrb	lr, [r0, #1379]	@ zero_extendqisi2
	ldrb	r3, [r0, #1395]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1387]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1432]
	ldrb	ip, [r0, #1411]	@ zero_extendqisi2
	ldrb	r3, [r0, #1427]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1419]	@ zero_extendqisi2
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
	ldr	ip, [r0, #2400]
	mov	r6, r1
	ldrb	r3, [ip, #13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L453
	ldr	r3, [ip, #72]
	ldr	r7, [ip, #68]
	ldrb	r5, [ip, #15]	@ zero_extendqisi2
	mov	r2, r3
	str	r3, [fp, #-236]
	ldr	r3, [r0, #2396]
	cmp	r2, #0
	sub	r8, r2, #1
	sub	r2, r7, #1
	str	r2, [fp, #-240]
	ldr	r4, [r3, #64]
	ldr	r1, [r3, #128]
	ble	.L424
	ldr	r3, [fp, #-236]
	add	r2, ip, #210
	sub	r0, fp, #216
	add	lr, r3, #105
	add	lr, ip, lr, lsl #1
.L423:
	ldrsh	r3, [r2, #2]!
	cmp	r2, lr
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L423
.L424:
	cmp	r7, #0
	ble	.L422
	add	r3, r7, #85
	add	r2, ip, #170
	sub	r0, fp, #128
	add	ip, ip, r3, lsl #1
.L427:
	ldrsh	r3, [r2, #2]!
	cmp	r2, ip
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L427
.L422:
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
	beq	.L468
	cmp	r8, #0
	mov	r3, #0
	blt	.L444
	sub	r10, fp, #212
	mov	lr, r3
	mov	r6, r3
	mov	r8, r3
	str	r3, [fp, #-232]
	str	r3, [fp, #-244]
.L430:
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	blt	.L447
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	ip, r2
	add	r8, r8, #1
	sub	r5, fp, #128
	mov	r6, lr
	add	r9, r3, r8
	b	.L433
.L445:
	mov	r6, lr
.L433:
	ldr	r3, [r5, #4]!
	add	ip, ip, #1
	add	r3, r3, #1
	add	r1, r2, r3
	cmp	r4, r1
	mla	lr, r8, r3, lr
	bge	.L431
	cmp	r0, r9
	blt	.L465
.L431:
	cmp	ip, r7
	mov	r2, r1
	bne	.L445
.L436:
	add	r2, r1, r3
	cmp	r4, r2
	bge	.L446
	cmp	r0, r9
	blt	.L463
.L446:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	ip, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, ip
	str	r2, [fp, #-244]
	bne	.L430
.L464:
	rsb	r0, r9, r0
	mov	r2, r1
	mul	r3, r0, r3
.L428:
	rsb	r2, r2, r4
	add	r3, r2, r3
	add	r6, r3, r6
.L453:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L468:
	cmp	r8, #0
	mov	r3, r5
	blt	.L444
	ldr	r2, [fp, #-240]
	sub	r10, fp, #212
	str	r5, [fp, #-232]
	mov	lr, r5
	cmp	r2, #0
	str	r5, [fp, #-244]
	mov	r6, r5
	mov	r8, r5
	blt	.L450
.L469:
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	ip, r2
	add	r8, r8, #1
	sub	r5, fp, #128
	mov	r6, lr
	add	r9, r3, r8
	b	.L439
.L448:
	mov	r6, lr
.L439:
	ldr	r3, [r5, #4]!
	add	ip, ip, #1
	add	r3, r3, #1
	add	r1, r2, r3
	cmp	r4, r1
	mla	lr, r8, r3, lr
	bge	.L437
	cmp	r0, r9
	blt	.L438
.L437:
	cmp	ip, r7
	mov	r2, r1
	bne	.L448
.L442:
	add	r2, r1, r3
	cmp	r4, r2
	bge	.L462
	cmp	r0, r9
	blt	.L463
.L462:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	ip, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, ip
	str	r2, [fp, #-244]
	beq	.L464
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	bge	.L469
.L450:
	ldr	r2, [fp, #-232]
	mov	r1, #0
	add	r9, r2, r8
	b	.L442
.L465:
	ldr	r1, [fp, #-232]
	rsb	r0, r1, r0
	mul	r3, r0, r3
	b	.L428
.L438:
	cmp	r1, r4
	bgt	.L465
	mov	r1, r2
	b	.L462
.L447:
	ldr	r2, [fp, #-232]
	mov	r1, #0
	add	r9, r2, r8
	b	.L436
.L463:
	ldr	r2, [fp, #-232]
	rsb	r0, r2, r0
	mov	r2, r1
	mul	r3, r0, r3
	b	.L428
.L444:
	mov	r2, r3
	mov	r6, r3
	b	.L428
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
	ldr	lr, [r0, #2400]
	mov	r6, r1
	ldrb	r3, [lr, #13]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r0, r1
	beq	.L494
	ldr	r3, [lr, #72]
	ldr	r7, [lr, #68]
	mov	r2, r3
	str	r3, [fp, #-232]
	ldr	r3, [r0, #2396]
	cmp	r2, #0
	ldr	r4, [r3, #64]
	ldr	ip, [r3, #128]
	ble	.L476
	ldr	r3, [fp, #-232]
	add	r2, lr, #210
	sub	r1, fp, #216
	add	r0, r3, #105
	add	r0, lr, r0, lsl #1
.L475:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L475
.L476:
	cmp	r7, #0
	ble	.L474
	add	r0, r7, #85
	add	r2, lr, #170
	sub	r1, fp, #128
	add	r0, lr, r0, lsl #1
.L479:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L479
.L474:
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
	ble	.L478
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
.L480:
	cmp	r7, #0
	ble	.L490
	ldr	r0, [r9]
	ldr	r4, [fp, #-236]
	add	r0, r0, #1
	mla	r1, r0, r4, r3
	cmp	r6, r1
	blt	.L491
	mov	r5, #0
	mov	lr, r3
	mov	r2, r5
	mov	r3, r1
	sub	ip, fp, #124
	b	.L485
.L482:
	ldr	r4, [ip, #4]!
	mov	lr, r3
	add	r4, r4, #1
	mla	r1, r0, r4, r3
	cmp	r1, r6
	bgt	.L483
	mov	r3, r1
.L485:
	add	r2, r2, #1
	add	r5, r5, r4
	cmp	r2, r7
	bne	.L482
.L484:
	cmp	r3, r6
	bgt	.L489
	ldr	r2, [fp, #-232]
	add	r10, r10, #1
	add	r8, r8, r0
	add	r9, r9, #4
	cmp	r10, r2
	bne	.L480
.L489:
	mov	r3, lr
.L483:
	cmp	r4, #0
	beq	.L478
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
.L494:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L490:
	mov	r5, #0
	b	.L484
.L491:
	ldr	r4, [fp, #-236]
	mov	r5, #0
	b	.L483
.L478:
	ldr	r2, .L496
	movw	r1, #8240
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L494
.L497:
	.align	2
.L496:
	.word	.LC38
	UNWIND(.fnend)
	.size	HEVC_CtbTsAddrToRsAddr, .-HEVC_CtbTsAddrToRsAddr
	.align	2
	.global	HEVC_CalcTileMap
	.type	HEVC_CalcTileMap, %function
HEVC_CalcTileMap:
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
	ldr	r4, .L521
	mov	r10, r0
	mov	r2, #262144
	mov	r1, #0
	ldr	r0, .L521+4
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #65536
	mov	r1, #0
	ldr	r0, .L521+8
	blx	r3
	add	r0, r10, #10624
	ldr	r3, [r4, #48]
	mov	r2, #880
	mov	r1, #0
	add	r0, r0, #52
	blx	r3
	add	r3, r10, #8192
	str	r3, [fp, #-56]
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #2480]
	ldr	r9, [r10, #2400]
	ldr	r1, [r10, #2396]
	ldr	r2, [r9, #72]
	ldr	r8, [r1, #188]
	cmp	r2, r3
	strne	r3, [fp, #-68]
	strne	r3, [fp, #-72]
	beq	.L498
.L506:
	ldr	r2, [r9, #68]
	cmp	r2, #0
	ldr	r2, [fp, #-68]
	add	r2, r2, #104
	streq	r2, [fp, #-76]
	beq	.L507
	mov	r1, r2
	str	r2, [fp, #-76]
	mov	r7, r1, asl #1
	ldr	r1, [fp, #-72]
	mov	r2, #0
	str	r2, [fp, #-48]
	str	r2, [fp, #-52]
	mul	r1, r8, r1
	ldr	r2, [fp, #-56]
	ldr	r2, [r2, #2480]
	str	r1, [fp, #-64]
.L505:
	add	r1, r2, #1328
	add	r0, r9, r7
	add	r1, r1, #6
	add	r1, r10, r1, lsl #3
	str	r3, [r1, #4]
	ldrsh	r1, [r0, #4]
	cmp	r1, #0
	ldreq	r1, [fp, #-48]
	addeq	r1, r1, #84
	streq	r1, [fp, #-60]
	beq	.L501
	ldr	r2, [fp, #-48]
	mov	r5, #0
	ldr	r1, [fp, #-52]
	add	r2, r2, #84
	ldr	r0, [fp, #-64]
	str	r2, [fp, #-60]
	add	r6, r1, r0
	mov	ip, r2, asl #1
.L502:
	add	r2, r9, ip
	ldrsh	r2, [r2, #4]
	cmp	r2, #0
	beq	.L504
	ldr	r2, .L521+4
	rsb	lr, r3, r6
	mov	r4, r3
	add	r2, r2, r3, lsl #2
.L503:
	add	r1, lr, r3
	str	r1, [r2], #4
	ldr	r9, [r10, #2400]
	add	r3, r3, #1
	rsb	r1, r4, r3
	add	r0, r9, ip
	ldrsh	r0, [r0, #4]
	cmp	r0, r1
	bhi	.L503
.L504:
	add	r2, r9, r7
	add	r5, r5, #1
	add	r6, r6, r8
	ldrsh	r2, [r2, #4]
	cmp	r2, r5
	bhi	.L502
	ldr	r2, [fp, #-56]
	ldr	r2, [r2, #2480]
.L501:
	add	r1, r10, r2, lsl #3
	sub	ip, r3, #1
	add	r1, r1, #10624
	ldr	r0, [fp, #-60]
	ldr	lr, [fp, #-48]
	add	r2, r2, #1
	str	ip, [r1, #56]
	ldr	r1, [fp, #-56]
	add	r0, r9, r0, lsl #1
	add	lr, lr, #1
	str	lr, [fp, #-48]
	str	r2, [r1, #2480]
	ldr	ip, [r9, #68]
	ldrsh	r1, [r0, #4]
	cmp	ip, lr
	ldr	r0, [fp, #-52]
	add	r1, r0, r1
	str	r1, [fp, #-52]
	bhi	.L505
.L507:
	ldr	r2, [fp, #-76]
	ldr	r0, [fp, #-68]
	ldr	r1, [r9, #72]
	add	r2, r9, r2, lsl #1
	add	r0, r0, #1
	cmp	r1, r0
	ldr	r1, [fp, #-72]
	ldrsh	r2, [r2, #4]
	str	r0, [fp, #-68]
	add	r2, r1, r2
	str	r2, [fp, #-72]
	bhi	.L506
.L498:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L522:
	.align	2
.L521:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR2+256
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r7, r0, #4096
	mov	r5, r0
	ldr	r2, .L546
	ldr	ip, [r7, #1860]
	movw	r1, #8308
	ldr	r3, [r7, #1976]
	mov	r0, #3
	add	r4, r5, #8192
	mov	r8, #200
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, .L546+4
	movw	r1, #8309
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #1832]
	mov	ip, #0
	ldr	r6, .L546+8
	add	r0, r5, #8320
	str	r3, [r4, #68]
	add	r0, r0, #36
	ldr	r2, [r7, #2260]
	mul	r8, r8, r3
	str	r2, [r4, #1332]
	mov	r2, #64
	ldr	r3, [r7, #2264]
	str	r3, [r4, #1336]
	ldr	r3, [r7, #2288]
	ldr	r1, [r7, #2296]
	rsb	r1, r3, r1
	str	r1, [r4, #1340]
	ldr	lr, [r7, #1976]
	add	r1, r8, #14720
	add	r1, r5, r1
	str	lr, [r4, #1324]
	ldr	lr, [r7, #1860]
	str	lr, [r4, #1328]
	ldr	lr, [r7, #2268]
	str	lr, [r4, #1344]
	ldr	lr, [r7, #2272]
	str	lr, [r4, #1348]
	ldr	lr, [r7, #2276]
	str	lr, [r4, #1352]
	ldr	lr, [r7, #2300]
	rsb	r3, r3, lr
	str	r3, [r4, #1356]
	ldr	r3, [r7, #2304]
	rsb	r3, lr, r3
	str	r3, [r4, #1360]
	ldr	r3, [r5, #2416]
	str	ip, [r5, #200]
	str	r3, [r4, #2404]
	ldr	r3, [r5, #2396]
	ldrb	ip, [r3, #10]	@ zero_extendqisi2
	strb	ip, [r4, #41]
	ldrb	ip, [r3, #3]	@ zero_extendqisi2
	strb	ip, [r4, #42]
	ldrb	ip, [r3, #7]	@ zero_extendqisi2
	strb	ip, [r4, #43]
	ldrb	ip, [r3, #6]	@ zero_extendqisi2
	strb	ip, [r4, #44]
	ldrb	ip, [r3, #5]	@ zero_extendqisi2
	strb	ip, [r4, #45]
	ldr	ip, [r3, #60]
	str	ip, [r4, #48]
	ldr	ip, [r3, #104]
	strb	ip, [r4, #52]
	ldr	ip, [r3, #192]
	sub	ip, ip, #1
	str	ip, [r4, #56]
	ldr	ip, [r3, #188]
	sub	ip, ip, #1
	str	ip, [r4, #60]
	ldr	ip, [r7, #1836]
	str	ip, [r4, #64]
	ldr	ip, [r5, #2400]
	ldr	lr, [ip, #84]
	sub	lr, lr, #2
	str	lr, [r4, #72]
	ldrb	lr, [ip, #11]	@ zero_extendqisi2
	strb	lr, [r4, #76]
	ldrb	ip, [ip, #10]	@ zero_extendqisi2
	strb	ip, [r4, #77]
	ldr	ip, [r3, #164]
	str	ip, [r4, #80]
	ldr	ip, [r3, #168]
	str	ip, [r4, #84]
	ldr	ip, [r3, #156]
	str	ip, [r4, #88]
	ldr	ip, [r3, #160]
	str	ip, [r4, #92]
	ldr	ip, [r3, #148]
	str	ip, [r4, #96]
	ldr	ip, [r3, #152]
	str	ip, [r4, #100]
	ldr	ip, [r3, #172]
	ldr	r6, [r6, #52]
	str	ip, [r4, #104]
	ldr	ip, [r3, #124]
	str	ip, [r4, #108]
	ldr	ip, [r3, #128]
	str	ip, [r4, #112]
	ldr	ip, [r3, #100]
	str	ip, [r4, #116]
	ldr	ip, [r3, #92]
	str	ip, [r4, #120]
	ldr	ip, [r3, #112]
	str	ip, [r4, #124]
	ldr	ip, [r3, #108]
	str	ip, [r4, #128]
	ldr	ip, [r3, #96]
	str	ip, [r4, #132]
	ldr	r3, [r3, #88]
	str	r3, [r4, #136]
	blx	r6
	ldr	ip, [r5, #2396]
	add	r3, r5, #10432
	add	r2, r5, #10304
	add	r1, r5, #9792
	add	r3, r3, #4
	ldr	lr, [ip, #68]
	add	r2, r2, #52
	add	r1, r1, #52
	mov	r0, r5
	str	lr, [r4, #228]
	ldr	ip, [ip, #64]
	str	ip, [r4, #232]
	bl	HEVC_CalcTileInfo
	subs	r6, r0, #0
	bne	.L544
	ldr	r3, [r5, #2400]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	strb	r2, [r4, #256]
	ldrb	r2, [r3, #7]	@ zero_extendqisi2
	strb	r2, [r4, #257]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	strb	r2, [r4, #258]
	ldrb	r2, [r3, #14]	@ zero_extendqisi2
	strb	r2, [r4, #259]
	ldrb	r2, [r3, #15]	@ zero_extendqisi2
	strb	r2, [r4, #260]
	ldrb	r2, [r3, #13]	@ zero_extendqisi2
	strb	r2, [r4, #261]
	ldr	r2, [r5, #2396]
	ldr	r1, [r3, #56]
	ldr	r2, [r2, #128]
	rsb	r2, r1, r2
	str	r2, [r4, #264]
	ldr	r2, [r3, #52]
	str	r2, [r4, #268]
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	strb	r2, [r4, #272]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	strb	r2, [r4, #273]
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	strb	r2, [r4, #274]
	ldr	r2, [r3, #60]
	str	r2, [r4, #276]
	ldr	r2, [r3, #64]
	str	r2, [r4, #280]
	ldr	r2, [r3, #72]
	sub	r2, r2, #1
	str	r2, [r4, #284]
	ldr	r2, [r3, #68]
	sub	r2, r2, #1
	str	r2, [r4, #288]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	strb	r2, [r4, #77]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	strb	r3, [r4, #76]
	ldr	r3, [r5, #2340]
	str	r6, [r5, #2356]
	cmp	r3, #1
	moveq	r0, r6
	beq	.L543
	ldr	r3, [r7, #1884]
	ldr	r0, [r5, #248]
	ldr	r1, [r3, #24]
	bl	FSP_GetLogicFs
	subs	r9, r0, #0
	beq	.L545
	ldr	r3, [r9, #24]
	ldr	r2, [r9, #32]
	cmp	r3, #0
	beq	.L528
	cmp	r2, #0
	beq	.L528
	add	r2, r5, #9536
	add	r1, r5, #9664
	add	r2, r2, #32
	add	r1, r1, #32
	ldr	r0, [r5, #248]
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r9, #184]
	add	r2, r5, #9664
	add	r1, r5, #9792
	add	r2, r2, #36
	add	r1, r1, #36
	str	r3, [r4, #1644]
	ldr	r3, [r9, #24]
	ldr	r3, [r3, #12]
	str	r3, [r4, #1648]
	ldr	r3, [r9, #24]
	ldr	r3, [r3, #36]
	str	r3, [r4, #1324]
	ldr	r0, [r5, #248]
	bl	FSP_GetPmvAddrTab
	ldr	r1, [r7, #1860]
	add	r2, r5, r8
	movw	r3, #14584
	str	r1, [r4, #1328]
	ldr	r1, [r9, #32]
	ldr	r1, [r1, #16]
	str	r1, [r4, #1640]
	ldr	r1, [r9, #24]
	ldr	r1, [r1, #4]
	str	r1, [r4, #2472]
	ldr	r1, [r9, #24]
	ldr	r1, [r1, #72]
	str	r1, [r4, #2476]
	ldrb	r1, [r9, #408]	@ zero_extendqisi2
	strb	r1, [r4, #40]
	ldr	ip, [r2, r3]
	cmp	ip, #0
	str	ip, [r4, #2396]
	beq	.L530
	add	r3, r8, #14592
	add	r2, r5, #10496
	add	r3, r3, #60
	add	r2, r2, #24
	add	r3, r5, r3
	mov	r0, r6
.L531:
	add	r0, r0, #1
	ldr	r1, [r3, #4]!
	cmp	r0, ip
	str	r1, [r2, #4]!
	bne	.L531
.L530:
	add	r8, r5, #8448
	mov	r6, #0
	add	r8, r8, #40
.L532:
	mov	r2, r8
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_8x8
	cmp	r6, #4
	add	r8, r8, #64
	bne	.L532
	add	r2, r5, #8704
	mov	r0, r6
	add	r2, r2, #40
	mov	r1, r5
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #8768
	add	r2, r2, #40
	mov	r1, r5
	mov	r0, #5
	add	r8, r5, #8960
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #8832
	add	r2, r2, #40
	mov	r1, r5
	mov	r0, #0
	add	r8, r8, #40
	bl	HEVC_WriteQmatrix_16x16
	add	r2, r5, #8896
	add	r2, r2, #40
	mov	r1, r5
	mov	r0, #1
	mov	r6, #2
	bl	HEVC_WriteQmatrix_16x16
.L533:
	mov	r2, r8
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_16x16
	cmp	r6, #6
	add	r8, r8, #64
	bne	.L533
	add	r2, r5, #9216
	mov	r1, r5
	add	r2, r2, #40
	mov	r0, #0
	bl	HEVC_WriteQmatrix_32x32
	add	r2, r5, #9280
	add	r2, r2, #40
	mov	r1, r5
	mov	r0, #1
	add	r8, r5, #9344
	bl	HEVC_WriteQmatrix_32x32
	add	r8, r8, #40
	mov	r6, #0
.L534:
	mov	r2, r8
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_4x4
	cmp	r6, #6
	add	r8, r8, #16
	bne	.L534
	ldr	r1, [r5, #2292]
	mov	r0, #0
	ldr	r3, [r5, #2296]
	ldr	r2, [r5, #2284]
	ldr	ip, [r5, #2288]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #1288]
	ldr	r1, [r5, #2308]
	ldr	r3, [r5, #2312]
	ldr	r2, [r5, #2300]
	ldr	ip, [r5, #2304]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #1292]
	ldr	r3, [r7, #1860]
	str	r3, [r4, #1320]
.L543:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L544:
	ldr	r3, .L546+12
	movw	r1, #8367
	ldr	r2, .L546+16
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L543
.L528:
	str	r2, [sp]
	movw	r1, #8411
	ldr	r2, .L546+20
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L543
.L545:
	ldr	r3, [r7, #1884]
	movw	r1, #8405
	ldr	r2, .L546+24
	mov	r0, #1
	ldr	r3, [r3, #24]
	bl	dprint_normal
	mvn	r0, #0
	b	.L543
.L547:
	.align	2
.L546:
	.word	.LC39
	.word	.LC40
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+248
	.word	.LC41
	.word	.LC43
	.word	.LC42
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r3, r0, #4096
	ldrb	r3, [r3, #2425]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r3, r0, #6464
	addeq	r3, r3, #56
	beq	.L550
	ldrsb	r3, [r0, #11]
	cmp	r3, #0
	addne	r3, r0, #13184
	addne	r3, r3, #44
	beq	.L582
.L550:
	ldr	ip, [r3, #68]
	ldr	lr, [r3, #72]
	cmp	ip, #16
	bhi	.L583
	cmp	lr, #16
	bhi	.L554
	cmp	ip, #0
	beq	.L555
	ldr	r2, [r0, #2424]
	cmp	r2, #0
	beq	.L568
	ldr	r2, [r2, #16]
	cmp	r2, #0
	addne	r1, r0, #2416
	movne	r3, #0
	addne	r1, r1, #8
	bne	.L560
	b	.L584
.L561:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L556
	ldr	r2, [r2, #16]
	cmp	r2, #0
	beq	.L557
.L560:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L561
.L555:
	cmp	lr, #0
	beq	.L570
	ldr	r2, [r0, #2492]
	cmp	r2, #0
	beq	.L571
	ldr	r2, [r2, #16]
	cmp	r2, #0
	addne	r0, r0, #2480
	movne	r3, #0
	addne	r0, r0, #12
	bne	.L566
	b	.L585
.L567:
	ldr	r2, [r0, #4]!
	cmp	r2, #0
	beq	.L562
	ldr	r2, [r2, #16]
	cmp	r2, #0
	beq	.L563
.L566:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L567
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L568:
	mov	r3, r2
.L556:
	ldr	r2, .L586
	movw	r1, #8544
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
.L552:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L584:
	mov	r3, r2
.L557:
	ldr	r2, .L586+4
	movw	r1, #8550
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L571:
	mov	r3, r2
.L562:
	ldr	r2, .L586+8
	movw	r1, #8559
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L585:
	mov	r3, r2
.L563:
	ldr	r2, .L586+12
	movw	r1, #8565
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L582:
	mov	r0, r3
	ldr	r2, .L586+16
	ldr	r3, .L586+20
	movw	r1, #8518
	bl	dprint_normal
	mvn	r0, #0
	b	.L552
.L583:
	mov	r0, #17
	mov	r3, ip
	str	r0, [sp]
	movw	r1, #8530
	ldr	r2, .L586+24
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L552
.L554:
	mov	r0, #17
	mov	r3, lr
	str	r0, [sp]
	movw	r1, #8536
	ldr	r2, .L586+28
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L552
.L570:
	mov	r0, lr
	b	.L552
.L587:
	.align	2
.L586:
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC44
	.word	.LANCHOR0+268
	.word	.LC45
	.word	.LC46
	UNWIND(.fnend)
	.size	HEVC_CheckListX, .-HEVC_CheckListX
	.align	2
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	add	r8, r0, #4096
	mov	r4, r0
	ldr	r3, [r8, #1832]
	str	r3, [fp, #-116]
	bl	HEVC_CheckListX
	subs	r3, r0, #0
	str	r3, [fp, #-112]
	bne	.L628
	ldr	r3, [r4, #200]
	ldr	r2, [r4, #156]
	cmp	r3, r2
	bcs	.L661
	ldr	r6, [r4, #2416]
	mov	r5, #1360
	ldr	r7, [fp, #-112]
	mov	r2, r5
	mla	r6, r5, r3, r6
	ldr	r3, .L665
	mov	r1, r7
	ldr	r3, [r3, #48]
	mov	r0, r6
	blx	r3
	ldr	r3, .L665
	mov	r2, #64
	mov	r1, r7
	sub	r0, fp, #108
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #200]
	ldr	r2, [r4, #156]
	add	r3, r3, #1
	str	r3, [r4, #200]
	cmp	r3, r2
	ldrcc	r2, [r4, #2416]
	ldrcs	r3, [fp, #-112]
	mlacc	r3, r5, r3, r2
	str	r3, [r6, #1356]
	ldr	r1, [r8, #2460]
	ldr	r2, [r4, #2384]
	ldr	r0, [r4, #180]
	ldr	r3, [r4, #232]
	add	r0, r0, #1
	str	r1, [r4, #204]
	str	r0, [r4, #180]
	add	r3, r3, #1
	str	r3, [r4, #232]
	ldrb	r1, [r2]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	str	r0, [fp, #-120]
	cmp	r1, #1
	cmpls	r1, r3
	bcs	.L593
	add	r0, r6, r1, lsl #2
.L594:
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r1, r1, #1
	add	r2, r2, r3
	ldr	r2, [r2, #56]
	str	r2, [r0, #8]
	ldr	r2, [r4, #2384]
	add	r2, r2, r3
	ldr	r2, [r2, #52]
	str	r2, [r0], #4
	ldr	r2, [r4, #2384]
	add	r3, r2, r3
	ldr	r3, [r3, #60]
	str	r3, [r0, #12]
	ldr	r2, [r4, #2384]
	ldr	r3, [r2, #8]
	cmp	r3, r1
	movhi	ip, #1
	movls	ip, #0
	cmp	r1, #1
	movhi	ip, #0
	cmp	ip, #0
	bne	.L594
.L593:
	cmp	r3, #1
	addls	r3, r6, r3, lsl #2
	addls	r1, r6, #8
	movls	r2, #0
	bhi	.L599
.L598:
	str	r2, [r3, #8]
	str	r2, [r3], #4
	cmp	r3, r1
	str	r2, [r3, #12]
	bne	.L598
.L599:
	ldrb	r3, [r8, #2425]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L662
.L597:
	add	r5, r4, #12288
	ldr	r3, [r5, #1008]
	cmp	r3, #0
	beq	.L600
	add	ip, r4, #2416
	add	r10, r6, #112
	add	ip, ip, #4
	add	r9, r6, #368
	mov	r1, #0
	mov	lr, ip
.L601:
	ldr	r3, [ip, #4]!
	sub	r7, fp, #44
	add	r1, r1, #1
	ldr	r3, [r3, #4]
	str	r3, [r10, #4]!
	ldr	r0, [lr, #4]!
	ldr	r2, [r0, #16]
	ldr	r3, [r2, #16]
	ldr	r2, [r2, #20]
	add	r3, r3, #2416
	add	r3, r3, #8
	add	r2, r7, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [r2, #-64]
	ldr	r3, [r0, #16]
	ldr	r3, [r3, #20]
	str	r3, [r9, #4]!
	ldr	r3, [r5, #1008]
	cmp	r3, r1
	bhi	.L601
	ldr	r2, [r5, #1012]
	cmp	r2, #0
	beq	.L602
.L627:
	add	ip, r4, #2480
	add	r10, r6, #176
	add	ip, ip, #8
	add	r9, r6, #432
	mov	r1, #0
	mov	lr, ip
.L603:
	ldr	r3, [lr, #4]!
	sub	r7, fp, #44
	add	r1, r1, #1
	ldr	r3, [r3, #4]
	str	r3, [r10, #4]!
	ldr	r0, [ip, #4]!
	ldr	r2, [r0, #16]
	ldr	r3, [r2, #16]
	ldr	r2, [r2, #20]
	add	r3, r3, #2416
	add	r3, r3, #8
	add	r2, r7, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [r2, #-64]
	ldr	r3, [r0, #16]
	ldr	r3, [r3, #20]
	str	r3, [r9, #4]!
	ldr	r2, [r5, #1012]
	cmp	r2, r1
	bhi	.L603
	ldr	r3, [r5, #1008]
.L602:
	cmp	r3, #0
	beq	.L604
	ldr	r0, [fp, #-116]
	mov	lr, #50
	ldr	r1, [r6, #372]
	ldr	r9, [r8, #1836]
	mul	lr, lr, r0
	add	r1, lr, r1
	add	r1, r1, #3680
	ldr	r1, [r4, r1, asl #2]
	cmp	r9, r1
	blt	.L634
	add	ip, r6, #372
	mov	r0, #0
	b	.L606
.L607:
	ldr	r1, [ip, #4]!
	add	r1, lr, r1
	add	r1, r1, #3680
	ldr	r1, [r4, r1, asl #2]
	cmp	r1, r9
	bgt	.L634
.L606:
	add	r0, r0, #1
	cmp	r0, r3
	bne	.L607
.L604:
	ldr	r1, [r5, #960]
	cmp	r1, #0
	bne	.L659
	cmp	r2, #0
	beq	.L659
	ldr	r0, [fp, #-116]
	mov	ip, #50
	ldr	r3, [r6, #436]
	ldr	lr, [r8, #1836]
	mul	ip, ip, r0
	add	r3, ip, r3
	add	r3, r3, #3680
	ldr	r3, [r4, r3, asl #2]
	cmp	lr, r3
	blt	.L605
	add	r0, r6, #436
	b	.L608
.L609:
	ldr	r3, [r0, #4]!
	add	r3, ip, r3
	add	r3, r3, #3680
	ldr	r3, [r4, r3, asl #2]
	cmp	r3, lr
	bgt	.L634
.L608:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L609
.L659:
	mov	r1, #1
.L605:
	strb	r1, [r6, #24]
	ldrb	r3, [r8, #2425]	@ zero_extendqisi2
	strb	r3, [r6, #25]
	ldr	r3, [r5, #956]
	str	r3, [r6, #28]
	ldrb	r3, [r5, #947]	@ zero_extendqisi2
	strb	r3, [r6, #32]
	ldr	r3, [r5, #980]
	str	r3, [r6, #36]
	ldr	r3, [r5, #960]
	cmp	r3, #0
	bne	.L610
	ldrb	r3, [r5, #948]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L611
	ldr	r3, [r5, #984]
	add	r3, r6, r3, lsl #2
	ldr	r9, [r3, #436]
.L612:
	str	r9, [r6, #40]
	ldr	r3, [r5, #984]
	str	r3, [r6, #48]
	ldrb	r3, [r5, #948]	@ zero_extendqisi2
	strb	r3, [r6, #52]
	ldr	r3, [r5, #988]
	str	r3, [r6, #44]
	ldr	r3, [r5, #1016]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r6, #60]
	ldr	r3, [r5, #1020]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r6, #56]
	ldrb	r3, [r5, #944]	@ zero_extendqisi2
	strb	r3, [r6, #64]
	ldrb	r3, [r5, #946]	@ zero_extendqisi2
	strb	r3, [r6, #65]
	ldr	r3, [r5, #1008]
	str	r3, [r6, #68]
	ldr	r3, [r5, #1012]
	str	r3, [r6, #72]
	ldr	r3, [r5, #960]
	str	r3, [r6, #76]
	ldr	r3, [r8, #2464]
	str	r3, [r6, #80]
	ldr	r3, [r4, #2396]
	ldr	r0, [r8, #2464]
	ldr	r1, [r3, #188]
	bl	__aeabi_uidivmod
	str	r1, [r6, #84]
	ldr	r3, [r4, #2396]
	ldr	r0, [r8, #2464]
	ldr	r1, [r3, #188]
	bl	__aeabi_uidiv
	str	r0, [r6, #88]
	mov	r0, r4
	ldr	r1, [r8, #2464]
	bl	HEVC_CtbRsAddrToTsAddr
	str	r0, [r6, #92]
	ldr	r3, [r5, #992]
	str	r3, [r6, #96]
	ldr	r3, [r5, #996]
	str	r3, [r6, #100]
	ldr	r3, [r5, #1004]
	str	r3, [r6, #104]
	ldr	r3, [r5, #1000]
	str	r3, [r6, #108]
	ldrb	r3, [r5, #943]	@ zero_extendqisi2
	strb	r3, [r6, #112]
	ldrb	r3, [r5, #942]	@ zero_extendqisi2
	strb	r3, [r6, #113]
	ldrb	r3, [r5, #949]	@ zero_extendqisi2
	strb	r3, [r6, #114]
	ldrb	r3, [r5, #950]	@ zero_extendqisi2
	strb	r3, [r6, #115]
	ldr	r3, [r4, #2400]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L617
	ldr	r2, [r5, #960]
	cmp	r2, #1
	beq	.L618
.L617:
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L663
.L620:
	ldrb	r3, [r5, #944]	@ zero_extendqisi2
	cmp	r3, #0
	subne	r3, fp, #44
	addeq	r2, r4, #8192
	addne	r9, r3, r9, lsl #2
	addne	r2, r4, #8192
	ldreq	r3, [r2, #2472]
	ldrne	r3, [r9, #-64]
	str	r3, [r6, #564]
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	ldreq	r0, [r4, #2384]
	ldreq	r1, [r4, #2404]
	ldreq	ip, [fp, #-120]
	streq	r0, [r1, ip, asl #2]
	streq	r3, [r4, #2384]
	ldrb	r3, [r2, #261]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L642
	ldr	r3, [r4, #232]
	cmp	r3, #1
	beq	.L664
	add	r0, r4, r3, lsl #3
	ldr	ip, [r6, #92]
	add	r0, r0, #11520
	add	r1, r3, #1440
	add	r1, r1, #3
	sub	ip, ip, #1
	str	ip, [r0, #24]
	sub	r3, r3, #1
	ldr	r0, [r6, #92]
	add	r1, r4, r1, lsl #3
	str	r0, [r1, #4]
.L626:
	ldr	r1, [r2, #56]
	add	r3, r4, r3, lsl #3
	ldr	r2, [r2, #60]
	add	r3, r3, #11520
	mla	r1, r2, r1, r1
	add	r1, r1, r2
	str	r1, [r3, #40]
	ldr	r1, [r6, #92]
	sub	r1, r1, #1
	cmp	r1, #65536
	bcs	.L642
	mov	r0, r4
	bl	HEVC_CtbTsAddrToRsAddr
	str	r0, [r6, #568]
.L642:
	ldr	r0, [fp, #-112]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L634:
	mov	r1, #0
	b	.L605
.L610:
	cmp	r3, #1
	movne	r9, #0
	bne	.L612
.L611:
	ldr	r3, [r5, #984]
	add	r3, r6, r3, lsl #2
	ldr	r9, [r3, #372]
	b	.L612
.L662:
	ldr	r3, .L665
	add	r1, r4, #6464
	add	r0, r4, #13184
	add	r1, r1, #56
	add	r0, r0, #44
	movw	r2, #1356
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #1
	strb	r3, [r4, #11]
	b	.L597
.L663:
	ldr	r3, [r5, #960]
	cmp	r3, #0
	bne	.L620
.L618:
	ldr	ip, [r5, #1096]
	add	r1, r4, #13504
	ldr	r3, .L665
	add	r1, r1, #16
	ldr	r8, .L665
	mov	r2, #64
	str	ip, [r6, #580]
	add	r0, r6, #588
	ldr	ip, [r5, #1228]
	ldr	r3, [r3, #52]
	str	ip, [r6, #584]
	blx	r3
	add	r1, r4, #13376
	add	r1, r1, #12
	ldr	r3, [r8, #52]
	mov	r2, #64
	add	r0, r6, #716
	blx	r3
	add	r1, r4, #13568
	add	r1, r1, #16
	ldr	r3, [r8, #52]
	mov	r2, #128
	add	r0, r6, #844
	blx	r3
	add	r1, r4, #13696
	add	r0, r6, #1088
	ldr	r3, [r8, #52]
	add	r1, r1, #16
	add	r0, r0, #12
	mov	r2, #128
	blx	r3
	ldr	r3, [r5, #960]
	cmp	r3, #0
	bne	.L620
	add	r1, r4, #13824
	ldr	r3, [r8, #52]
	add	r1, r1, #16
	mov	r2, #64
	add	r0, r6, #652
	blx	r3
	add	r1, r4, #13440
	ldr	r3, [r8, #52]
	add	r1, r1, #12
	mov	r2, #64
	add	r0, r6, #780
	blx	r3
	add	r1, r4, #13888
	ldr	r3, [r8, #52]
	add	r1, r1, #16
	mov	r2, #128
	add	r0, r6, #972
	blx	r3
	add	r1, r4, #14016
	add	r0, r6, #1216
	ldr	r3, [r8, #52]
	add	r1, r1, #16
	mov	r2, #128
	add	r0, r0, #12
	blx	r3
	b	.L620
.L664:
	ldr	r1, [r6, #92]
	mov	r3, #0
	str	r1, [r2, #3364]
	b	.L626
.L600:
	ldr	r3, [r5, #1012]
	cmp	r3, #0
	bne	.L627
	b	.L659
.L628:
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L642
.L661:
	str	r2, [sp]
	movw	r1, #8594
	ldr	r2, .L665+4
	mov	r0, #1
	mvn	ip, #0
	str	ip, [fp, #-112]
	bl	dprint_normal
	b	.L642
.L666:
	.align	2
.L665:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC51
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
	add	ip, r0, #4096
	add	r2, r0, #8192
	mov	r1, r0
	mov	r0, #0
	ldr	r3, [ip, #1852]
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r2, #1372]
	ldr	r3, [ip, #1856]
	str	r3, [r2, #1364]
	ldr	r3, [r1, #200]
	str	r3, [r2, #2400]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_CfgVDMReg, .-HEVC_CfgVDMReg
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
	ldr	r2, [r0, #2392]
	ldr	r3, [r1, #4]
	ldr	r2, [r2, #4]
	cmp	r2, r3
	beq	.L673
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L673:
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r2, #0
	strb	r2, [r1, #2]
	ldr	ip, [r0, #160]
	mov	r4, r0
	ldr	lr, .L675
	mov	r2, #120
	ldr	r0, [r0, #2368]
	mov	r3, ip, asl #7
	sub	r3, r3, ip, asl #3
	ldr	r5, [lr, #52]
	sub	r3, r3, #120
	add	r0, r0, r3
	blx	r5
	ldr	r3, [r4, #160]
	ldr	r1, [r4, #2368]
	mov	r2, r3, asl #7
	sub	r3, r2, r3, asl #3
	sub	r3, r3, #120
	add	r3, r1, r3
	str	r3, [r4, #2392]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L676:
	.align	2
.L675:
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
	ldr	r2, [r0, #2396]
	ldr	r3, [r1, #56]
	ldr	r2, [r2, #56]
	cmp	r2, r3
	beq	.L680
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L680:
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
	ldr	r3, [r0, #164]
	movw	r5, #12644
	ldr	ip, .L682
	mov	r4, r0
	ldr	r0, [r0, #2372]
	mov	r2, r5
	mul	r3, r5, r3
	ldr	r6, [ip, #52]
	sub	r3, r3, #12608
	sub	r3, r3, #36
	add	r0, r0, r3
	blx	r6
	ldr	r3, [r4, #164]
	ldr	r1, [r4, #2372]
	mul	r3, r5, r3
	sub	r3, r3, #12608
	sub	r3, r3, #36
	add	r3, r1, r3
	str	r3, [r4, #2396]
	ldr	r2, [r3, #56]
	str	r2, [r4, #260]
	ldr	r2, [r3, #64]
	str	r2, [r4, #264]
	ldr	r2, [r3, #68]
	str	r2, [r4, #268]
	ldr	r2, [r3, #128]
	str	r2, [r4, #272]
	ldr	r2, [r3, #88]
	str	r2, [r4, #276]
	ldr	r3, [r3, #96]
	str	r3, [r4, #280]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L683:
	.align	2
.L682:
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
	ldr	r2, [r0, #2400]
	ldr	r3, [r1, #28]
	ldr	r2, [r2, #28]
	cmp	r2, r3
	beq	.L687
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L687:
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
	beq	.L689
	ldrb	r3, [r2, #15]	@ zero_extendqisi2
	cmp	r3, r4
	bne	.L707
	ldr	lr, [r2, #68]
	ldr	r3, [r1, #188]
	cmp	lr, #1
	add	r0, r2, lr, lsl #1
	strh	r3, [r0, #170]	@ movhi
	ble	.L701
	add	lr, lr, #42
	add	r2, r2, #86
	add	ip, r5, #170
	add	lr, r5, lr, lsl #1
.L700:
	ldrh	r1, [r2, #2]!
	cmp	r2, lr
	strh	r1, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #170]
	rsb	r3, r1, r3
	strh	r3, [r0, #170]	@ movhi
	bne	.L700
.L701:
	ldr	lr, [r5, #72]
	ldr	r3, [r7, #192]
	cmp	lr, #1
	add	r0, r5, lr, lsl #1
	strh	r3, [r0, #210]	@ movhi
	ble	.L696
	add	lr, lr, #62
	add	r2, r5, #126
	add	ip, r5, #210
	add	lr, r5, lr, lsl #1
.L702:
	ldrh	r1, [r2, #2]!
	cmp	r2, lr
	strh	r1, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #210]
	rsb	r3, r1, r3
	strh	r3, [r0, #210]	@ movhi
	bne	.L702
	b	.L696
.L689:
	ldr	r3, [r1, #188]
	strh	r3, [r2, #172]	@ movhi
	ldr	r3, [r1, #192]
	strh	r3, [r2, #212]	@ movhi
.L696:
	ldr	r3, [r6, #168]
	mov	r4, #1888
	ldr	ip, .L708
	mov	r1, r5
	ldr	r0, [r6, #2376]
	mov	r2, r4
	mul	r3, r4, r3
	ldr	r5, [ip, #52]
	sub	r3, r3, #1888
	add	r0, r0, r3
	blx	r5
	ldr	r2, [r6, #168]
	ldr	r3, [r6, #2376]
	mul	r4, r4, r2
	sub	r4, r4, #1888
	add	r4, r3, r4
	str	r4, [r6, #2400]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L707:
	ldr	r9, [r2, #68]
	cmp	r9, r4
	addgt	r3, r2, #170
	ble	.L695
.L694:
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
	bne	.L694
.L695:
	ldr	r9, [r5, #72]
	cmp	r9, #0
	addgt	r3, r5, #210
	movgt	r4, #0
	ble	.L696
.L697:
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
	bne	.L697
	b	.L696
.L709:
	.align	2
.L708:
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
	ldr	r2, [r4, #2452]
	mov	r1, #0
	ldr	lr, [r4, #2436]
	str	r3, [r4, #1856]
	strb	r0, [r4, #1825]
	str	r2, [r4, #1828]
	str	lr, [r4, #1836]
	ldr	ip, [r5, #2396]
	ldr	r3, .L722
	ldr	r2, [ip, #64]
	str	r2, [r4, #1844]
	ldr	r2, [ip, #68]
	str	r1, [r4, #1852]
	str	r2, [r4, #1848]
	ldr	r2, [r5, #248]
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, r0
	beq	.L721
.L711:
	ldr	r3, [r5, #2340]
	cmp	r3, #0
	bne	.L714
	ldr	ip, [r5, #2412]
	movw	r6, #6192
	add	lr, r5, #6208
	mvn	r0, #0
	mvn	r1, #0
	ldrd	r2, [ip, #32]
	strd	r2, [r5, r6]
	ldrd	r2, [ip, #48]
	strd	r2, [lr, #-8]
	ldrd	r2, [ip, #64]
	strd	r2, [lr]
	ldr	r3, [ip, #80]
	str	r3, [r4, #1888]
	ldr	r3, [ip, #84]
	str	r3, [r4, #1892]
	ldr	r3, [ip, #88]
	str	r3, [r4, #1896]
	ldr	r3, [ip, #104]
	str	r3, [r4, #1900]
	ldrb	r3, [ip, #28]	@ zero_extendqisi2
	strb	r3, [r4, #2412]
	strd	r0, [ip, #32]
	ldr	ip, [r5, #2396]
.L714:
	ldr	r2, [ip, #64]
	mov	r1, #0
	ldrb	r3, [r4, #2044]	@ zero_extendqisi2
	add	r0, r5, #5952
	add	r0, r0, #32
	str	r2, [r4, #1920]
	ldr	r2, [ip, #68]
	str	r1, [r4, #1908]
	str	r2, [r4, #1924]
	ldr	r2, [ip, #60]
	ldr	r1, [ip, #2072]
	subs	r2, r2, #1
	bfi	r3, r1, #5, #3
	movne	r2, #1
	bfi	r3, r2, #2, #3
	strb	r3, [r4, #2044]
	ldr	r1, [ip, #2056]
	and	r1, r1, #7
	bl	SetAspectRatio
	ldr	r3, [r5, #2340]
	cmp	r3, #1
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #2436]
	str	r2, [r3, #4]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #2044]
	str	r2, [r3, #228]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #1908]
	str	r2, [r3, #92]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #1948]
	str	r2, [r3, #132]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #1944]
	str	r2, [r3, #128]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #1920]
	str	r2, [r3, #104]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #1924]
	str	r2, [r3, #108]
	ldr	r3, [r5, #2396]
	add	r5, r5, #24576
	ldr	r2, [r3, #72]
	str	r2, [r4, #2008]
	ldr	ip, [r3, #76]
	str	ip, [r4, #2012]
	ldr	r1, [r3, #80]
	str	r1, [r4, #2016]
	ldr	lr, [r3, #84]
	str	lr, [r4, #2020]
	ldr	r0, [r3, #64]
	rsb	r2, r2, r0
	rsb	r2, ip, r2
	str	r2, [r4, #1928]
	ldr	r0, [r3, #68]
	ldr	ip, [r4, #1884]
	rsb	r1, r1, r0
	rsb	r1, lr, r1
	str	r1, [r4, #1932]
	ldr	r1, [r3, #88]
	str	r1, [r4, #2280]
	ldr	r3, [r3, #96]
	str	r3, [r4, #2284]
	ldr	r3, [ip, #120]
	str	r3, [r4, #1936]
	ldr	r3, [ip, #124]
	str	r3, [r4, #1940]
	str	r2, [ip, #112]
	ldr	r2, [r4, #1932]
	ldr	r3, [r4, #1884]
	str	r2, [r3, #116]
	ldr	r2, [r4, #1936]
	ldr	r3, [r4, #1884]
	str	r2, [r3, #120]
	ldr	r2, [r4, #1940]
	ldr	r3, [r4, #1884]
	str	r2, [r3, #124]
	ldr	r3, [r4, #1884]
	ldr	r2, [r4, #2280]
	str	r2, [r3, #464]
	ldr	r2, [r4, #2284]
	ldr	r3, [r4, #1884]
	str	r2, [r3, #468]
	ldr	r3, [r4, #2444]
	cmp	r3, #2
	ldreq	r3, [r5, #2380]
	ldreq	r2, [r5, #2376]
	ldrne	r2, [r5, #2368]
	streq	r3, [r5, #2372]
	mov	r3, #0
	streq	r2, [r5, #2368]
	ldr	r1, [r4, #1884]
	str	r2, [r1, #600]
	ldr	r2, [r4, #1884]
	ldr	r1, [r5, #2372]
	str	r1, [r2, #604]
	str	r3, [r5, #2376]
	str	r3, [r5, #2380]
	str	r3, [r4, #1840]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L721:
	ldr	r2, [r3, #2572]
	cmp	r2, r0
	bne	.L711
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L711
	add	r3, r5, #12288
	ldrb	r3, [r3, #880]	@ zero_extendqisi2
	cmp	r3, r0
	bne	.L711
	movw	r2, #13200
	movw	r3, #13216
	ldrd	r0, [r5, r2]
	ldrd	r2, [r3, r5]
	cmp	r1, r3
	cmpeq	r0, r2
	bls	.L712
	subs	r6, r0, r2
	sbc	r7, r1, r3
	cmp	r7, #0
	cmpeq	r6, #16
	bls	.L712
.L713:
	ldr	r0, [r5, #256]
	movw	r1, #13200
	rsb	lr, r0, lr
	adds	r2, r2, lr
	adc	r3, r3, lr, asr #31
	strd	r2, [r5, r1]
	b	.L711
.L712:
	cmp	r1, r3
	cmpeq	r0, r2
	bcs	.L711
	subs	r0, r2, r0
	sbc	r1, r3, r1
	cmp	r1, #0
	cmpeq	r0, #16
	bls	.L711
	b	.L713
.L723:
	.align	2
.L722:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r3, r0, #4096
	str	r3, [fp, #-56]
	mov	r2, r0
	ldr	r3, [r3, #2444]
	cmp	r3, #1
	beq	.L741
	cmp	r3, #2
	beq	.L742
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [fp, #-48]
	beq	.L726
	str	r3, [sp]
	movw	r1, #9440
	ldr	r3, .L751
	mov	r0, #1
	ldr	r2, .L751+4
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L741:
	str	r3, [fp, #-48]
.L726:
	add	r10, r2, #6528
	add	r8, r2, #2416
	add	r10, r10, #56
	add	r8, r8, #8
	mov	r9, #0
	mov	r7, r2
.L739:
	ldr	r2, [r10, #4]!
	cmp	r2, #0
	beq	.L729
	ldr	r1, [r8]
	cmp	r1, #0
	bne	.L743
	mov	r0, r8
	mov	r3, r1
	b	.L731
.L733:
	ldr	r5, [r0, #4]!
	cmp	r5, #0
	bne	.L749
.L731:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L733
	mov	r3, #255
	str	r3, [fp, #-52]
.L732:
	ldr	r3, [r7, #2412]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L734
	ldr	r3, [fp, #-56]
	ldr	r5, [r3, #1884]
	add	r5, r5, #52
.L730:
	mov	r3, r1
	mov	r6, r8
	mov	r4, #0
	b	.L740
.L736:
	ldr	r3, [r6, #4]!
.L740:
	cmp	r3, #0
	beq	.L750
.L735:
	add	r4, r4, #1
	cmp	r2, r4
	bhi	.L736
.L737:
	ldr	r3, [fp, #-48]
	add	r9, r9, #1
	add	r8, r8, #68
	cmp	r9, r3
	bcc	.L739
.L742:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L729:
	ldr	r3, [r7, #2412]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L737
	mov	r3, #1
	str	r3, [r10]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #1884]
	add	r3, r3, #52
	str	r3, [r8]
	b	.L737
.L750:
	ldrsb	r3, [fp, #-52]
	movw	r1, #9477
	ldr	r2, .L751+8
	mov	r0, #1
	str	r4, [sp, #4]
	str	r3, [sp, #8]
	str	r9, [sp]
	ldr	r3, .L751
	bl	dprint_normal
	str	r5, [r6]
	ldr	r2, [r10]
	b	.L735
.L749:
	uxtb	r3, r3
	str	r3, [fp, #-52]
	cmp	r3, #255
	bne	.L730
	b	.L732
.L743:
	mov	r3, #0
	mov	r5, r1
	str	r3, [fp, #-52]
	b	.L730
.L734:
	str	r9, [sp]
	movw	r1, #9468
	ldr	r3, .L751
	mov	r0, #1
	ldr	r2, .L751+12
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L752:
	.align	2
.L751:
	.word	.LANCHOR0+284
	.word	.LC52
	.word	.LC54
	.word	.LC53
	UNWIND(.fnend)
	.size	HEVC_RepairList, .-HEVC_RepairList
	.align	2
	.global	HEVC_InitListX
	.type	HEVC_InitListX, %function
HEVC_InitListX:
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
	UNWIND(.pad #156)
	sub	sp, sp, #156
	subs	r7, r0, #0
	beq	.L789
	ldr	r3, .L821
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #180
	ldr	r3, [r3, #48]
	blx	r3
	ldr	lr, [r7, #2608]
	cmp	lr, #0
	beq	.L790
	add	r0, r7, #2672
	mov	r1, #0
	add	r0, r0, #8
	mov	r3, r1
	b	.L757
.L756:
	cmp	r3, lr
	beq	.L755
.L757:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L756
	ldr	ip, [r2, #56]
	cmp	ip, #0
	bne	.L756
	ldr	ip, [r2, #60]
	cmp	ip, #1
	subeq	ip, fp, #44
	addeq	r2, r2, #52
	addeq	ip, ip, r1, lsl #2
	addeq	r1, r1, #1
	streq	r2, [ip, #-136]
	cmp	r3, lr
	bne	.L757
.L755:
	ldr	lr, [r7, #2612]
	cmp	lr, #0
	beq	.L791
	add	ip, r7, #2736
	mov	r0, r1
	add	ip, ip, #12
	mov	r3, #0
	b	.L760
.L759:
	cmp	r3, lr
	beq	.L817
.L760:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldrb	r4, [r2, #1]	@ zero_extendqisi2
	cmp	r4, #1
	bne	.L759
	ldr	r4, [r2, #56]
	cmp	r4, #0
	bne	.L759
	ldr	r4, [r2, #60]
	cmp	r4, #1
	subeq	r4, fp, #44
	addeq	r2, r2, #52
	addeq	r4, r4, r0, lsl #2
	addeq	r0, r0, #1
	streq	r2, [r4, #-136]
	cmp	r3, lr
	bne	.L760
.L817:
	rsb	lr, r1, r0
.L758:
	ldr	r4, [r7, #2604]
	cmp	r4, #0
	beq	.L792
	add	ip, r7, #2816
	mov	r9, r0
	mov	r3, #0
	b	.L763
.L762:
	cmp	r3, r4
	beq	.L818
.L763:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldrb	r5, [r2, #1]	@ zero_extendqisi2
	cmp	r5, #1
	bne	.L762
	ldr	r5, [r2, #56]
	cmp	r5, #1
	bne	.L762
	ldr	r5, [r2, #60]
	sub	r6, fp, #44
	add	r6, r6, r9, lsl #2
	add	r2, r2, #52
	cmp	r5, #0
	addeq	r9, r9, #1
	streq	r2, [r6, #-136]
	cmp	r3, r4
	bne	.L763
.L818:
	rsb	r4, r1, r9
	rsb	r4, lr, r4
.L761:
	cmp	r9, #0
	beq	.L819
	add	r3, r7, #4096
	str	r3, [fp, #-184]
	ldr	r3, [r3, #2444]
	cmp	r3, #0
	str	r3, [fp, #-188]
	beq	.L820
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2500]
	ldr	r5, [r3, #2504]
	cmp	r4, #0
	str	r4, [r3, #2492]
	str	r5, [r3, #2496]
	beq	.L782
.L788:
	ldr	r3, [fp, #-184]
	add	r10, r7, #2416
	add	r8, r7, #7616
	add	r10, r10, #4
	add	r8, r8, #4
	str	r5, [fp, #-192]
	ldrb	r2, [r3, #3520]	@ zero_extendqisi2
	mov	r6, #0
	mov	r5, r2
.L775:
	cmp	r5, #0
	mov	r1, r9
	mov	r0, r6
	ldrne	r1, [r8]
	bne	.L774
	bl	__aeabi_uidivmod
.L774:
	sub	r3, fp, #44
	add	r6, r6, #1
	add	r1, r3, r1, lsl #2
	cmp	r4, r6
	add	r8, r8, #4
	ldr	r3, [r1, #-136]
	str	r3, [r10, #4]!
	bhi	.L775
	ldr	r3, [fp, #-188]
	ldr	r5, [fp, #-192]
	cmp	r3, #0
	bne	.L816
.L776:
	cmp	r5, #0
	beq	.L778
	ldr	r3, [fp, #-184]
	add	r8, r7, #2480
	add	r6, r7, #7744
	add	r8, r8, #8
	add	r6, r6, #4
	mov	r4, #0
	ldrb	r3, [r3, #3521]	@ zero_extendqisi2
	mov	r10, r3
.L781:
	cmp	r10, #0
	mov	r1, r9
	mov	r0, r4
	ldrne	r1, [r6]
	bne	.L780
	bl	__aeabi_uidivmod
.L780:
	sub	r3, fp, #44
	add	r4, r4, #1
	add	r1, r3, r1, lsl #2
	cmp	r4, r5
	add	r6, r6, #4
	ldr	r3, [r1, #-68]
	str	r3, [r8, #4]!
	bne	.L781
.L816:
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2492]
	ldr	r5, [r3, #2496]
.L777:
	cmp	r4, #16
	bhi	.L786
.L782:
	add	r4, r4, #604
	add	r2, r7, #2480
	add	r4, r4, #1
	add	r2, r2, #8
	add	r4, r7, r4, lsl #2
.L785:
	ldr	r3, [r7, #2424]
	str	r3, [r4, #4]!
	cmp	r4, r2
	bne	.L785
.L786:
	cmp	r5, #16
	bhi	.L784
	add	r5, r5, #620
	add	r2, r7, #2544
	add	r5, r5, #2
	add	r2, r2, #12
	add	r5, r7, r5, lsl #2
.L787:
	ldr	r3, [r7, #2492]
	str	r3, [r5, #4]!
	cmp	r5, r2
	bne	.L787
.L784:
	mov	r0, #0
.L815:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L820:
	cmp	lr, #0
	beq	.L767
	sub	r3, fp, #180
	sub	r2, fp, #116
	add	ip, r3, r1, lsl #2
	ldr	r3, [fp, #-188]
.L768:
	add	r3, r3, #1
	ldr	r5, [ip], #4
	cmp	r3, lr
	str	r5, [r2, #4]!
	bne	.L768
.L767:
	cmp	r1, #0
	beq	.L769
	add	r2, lr, #16
	sub	ip, fp, #180
	mov	r3, #0
	add	r2, ip, r2, lsl #2
.L770:
	add	r3, r3, #1
	ldr	r5, [ip], #4
	cmp	r3, r1
	str	r5, [r2, #4]!
	bne	.L770
	add	lr, lr, r3
.L769:
	cmp	r4, #0
	beq	.L771
	add	lr, lr, #16
	sub	r2, fp, #180
	sub	r3, fp, #180
	add	lr, r2, lr, lsl #2
	add	r0, r3, r0, lsl #2
	mov	r3, #0
.L772:
	add	r3, r3, #1
	ldr	r2, [r0], #4
	cmp	r3, r4
	str	r2, [lr, #4]!
	bne	.L772
.L771:
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2500]
	ldr	r5, [r3, #2504]
	cmp	r4, #0
	str	r4, [r3, #2492]
	str	r5, [r3, #2496]
	bne	.L788
	b	.L776
.L819:
	ldr	r3, .L821
	add	r4, r7, #4096
	add	r0, r7, #2416
	mov	r2, #136
	add	r0, r0, #8
	str	r9, [r4, #2492]
	ldr	r3, [r3, #48]
	mov	r1, r9
	str	r9, [r4, #2496]
	blx	r3
	ldr	r3, [r7, #2412]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L784
	ldr	r3, [r4, #1884]
	mov	r2, #1
	mov	r0, r9
	str	r2, [r4, #2492]
	add	r3, r3, #52
	str	r3, [r7, #2424]
	b	.L815
.L790:
	mov	r1, lr
	b	.L755
.L791:
	mov	r0, r1
	b	.L758
.L792:
	mov	r9, r0
	b	.L761
.L778:
	ldr	r3, .L821
	add	r1, r7, #2416
	add	r0, r7, #2480
	add	r1, r1, #8
	add	r0, r0, #12
	mov	r2, #68
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2492]
	str	r4, [r3, #2496]
	mov	r5, r4
	b	.L777
.L789:
	mvn	r0, #0
	b	.L815
.L822:
	.align	2
.L821:
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
	ldr	r2, [r3, #2444]
	cmp	r2, #2
	beq	.L828
	bl	HEVC_InitListX
	cmp	r0, #0
	bne	.L829
	mov	r0, r4
	bl	HEVC_RepairList
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, .L830
	movw	r1, #9518
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L828:
	mov	r0, #0
	str	r0, [r3, #2492]
	str	r0, [r3, #2496]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L829:
	ldr	r2, .L830+4
	movw	r1, #9510
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L831:
	.align	2
.L830:
	.word	.LC56
	.word	.LC55
	UNWIND(.fnend)
	.size	HEVC_DecList, .-HEVC_DecList
	.align	2
	.global	HEVC_ArrangeMem
	.type	HEVC_ArrangeMem, %function
HEVC_ArrangeMem:
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
	mov	r7, r0
	ldr	r3, [r7, #2396]
	mov	r2, #36
	ldr	r0, .L837
	mov	r1, #0
	ldr	r6, [r7, #2592]
	ldr	r5, [r3, #72]
	ldr	r4, [r3, #68]
	ldr	lr, [r3, #64]
	ldr	ip, [r3, #80]
	ldr	r9, [r3, #188]
	rsb	lr, r5, lr
	ldr	r8, [r3, #192]
	rsb	ip, ip, r4
	ldr	r5, [r3, #76]
	ldr	r4, [r3, #84]
	ldr	r3, [r3, #128]
	rsb	r5, r5, lr
	ldr	r10, [r0, #48]
	sub	r0, fp, #80
	rsb	r4, r4, ip
	mov	r9, r9, asl r3
	mov	r8, r8, asl r3
	blx	r10
	ldr	ip, [r7, #2412]
	add	r3, r6, #1
	str	r4, [fp, #-60]
	sub	r1, fp, #80
	str	r5, [fp, #-64]
	mov	r2, #0
	ldr	r0, [ip, #16]
	mov	lr, #16
	ldr	r4, [ip, #852]
	cmp	r0, #24
	ldr	r0, [r7, #248]
	str	r9, [fp, #-72]
	moveq	r6, #1
	str	r6, [fp, #-56]
	ldr	ip, [ip, #16]
	str	r8, [fp, #-68]
	cmp	ip, #24
	strb	r4, [fp, #-75]
	str	lr, [fp, #-80]
	moveq	r3, #1
	str	r3, [fp, #-52]
	bl	FSP_ArrangeFsPool
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L838:
	.align	2
.L837:
	.word	vfmw_Osal_Func_Ptr_S
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r3, r1, #652
	add	r3, r3, #2
	mov	ip, r1
	ldr	r1, [r0, r3, asl #2]
	ldr	r2, [r1, #28]
	cmp	r2, #0
	bne	.L842
	ldr	r3, [r1, #20]
	cmp	r3, #15
	bhi	.L839
	add	r3, r0, r3, lsl #2
	add	ip, r0, #12288
	add	r3, r3, #12288
	mov	lr, #16
	str	r2, [r3, #2304]
	str	r2, [r3, #2368]
	str	r2, [r3, #2432]
	ldr	r3, [r1, #16]
	add	r0, r0, r3, lsl #2
	str	r2, [r0, #2140]
	str	lr, [r1, #20]
	ldr	r3, [ip, #2300]
	sub	r3, r3, #1
	str	r3, [ip, #2300]
.L839:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L842:
	str	r2, [sp, #4]
	movw	r1, #10119
	str	ip, [sp]
	mov	r0, #1
	ldr	r3, .L843
	ldr	r2, .L843+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L844:
	.align	2
.L843:
	.word	.LANCHOR0+300
	.word	.LC57
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
	ldr	r2, [r0, #2596]
	mov	r6, r0
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #2608
	mov	r4, #0
	add	r5, r5, #4
	b	.L848
.L847:
	add	r4, r4, #1
	cmp	r4, r2
	bcs	.L851
.L848:
	ldr	r3, [r5, #4]!
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L847
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_RemoveApcStore
	ldr	r2, [r6, #2596]
	add	r4, r4, #1
	cmp	r4, r2
	bcc	.L848
.L851:
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
	ldr	r2, [r0, #2376]
	mov	lr, #1888
	ldr	r1, [r4, #2460]
	movw	ip, #12644
	ldr	r3, [r0, #2372]
	mov	r9, r0
	mov	r0, #1
	mla	r2, lr, r1, r2
	ldr	r1, [r9, #2596]
	cmp	r1, #0
	ldr	r2, [r2, #32]
	mla	r3, ip, r2, r3
	ldr	r3, [r3, #116]
	mov	r3, r0, asl r3
	str	r3, [fp, #-48]
	beq	.L852
	add	r7, r9, #2608
	add	r3, r9, #7424
	add	r3, r3, #60
	add	r7, r7, #4
	str	r3, [fp, #-52]
	mov	r8, #0
	b	.L869
.L855:
	add	r8, r8, #1
	cmp	r8, r1
	bcs	.L852
.L869:
	ldr	r0, [r7, #4]!
	ldr	r3, [r4, #2456]
	ldr	r2, [r0, #28]
	cmp	r2, r3
	bne	.L855
	ldr	r1, [r4, #3356]
	ldr	r3, [r4, #3360]
	ldr	r2, [r4, #3364]
	add	r3, r3, r1
	cmp	r3, r2
	mov	r6, r3
	ldrcs	ip, [r0, #4]
	movcs	r1, #0
	bcs	.L857
	add	r5, r3, #1888
	ldr	r3, [r0, #4]
	mov	r1, #0
	mov	r10, #1
	add	r5, r9, r5, lsl #2
	mov	r2, r3
	mov	r3, r9
	mov	r9, r8
	mov	r8, r3
.L863:
	ldr	ip, [r5, #-944]
	cmp	ip, #0
	ldr	ip, [r0, #56]
	beq	.L858
	cmp	ip, #0
	beq	.L859
	ldr	ip, [r5]
	cmp	ip, r2
	beq	.L891
.L859:
	cmp	r1, #0
	bne	.L874
	ldr	r1, [r5]
	mov	lr, r2
.L871:
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	rsb	r1, r1, lr
	clz	r1, r1
	cmp	ip, #0
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	bne	.L892
.L874:
	mov	ip, r2
.L862:
	ldr	lr, [r4, #3364]
	add	r6, r6, #1
	add	r5, r5, #4
	mov	r2, ip
	cmp	r6, lr
	bcc	.L863
	mov	r3, r8
	ldr	r2, [r4, #3356]
	mov	r8, r9
	mov	r9, r3
	ldr	r3, [r4, #3360]
	add	r3, r3, r2
.L857:
	cmp	r3, #0
	ldr	lr, [r4, #2436]
	ldrne	r6, [fp, #-52]
	movne	r5, #0
	movne	r10, #1
	beq	.L865
.L867:
	ldr	r3, [r0, #56]
	add	r5, r5, #1
	cmp	r3, #0
	bne	.L866
	ldr	r3, [r6]
	add	r3, lr, r3
	cmp	r3, ip
	beq	.L893
.L866:
	ldr	r3, [r4, #3360]
	add	r6, r6, #4
	ldr	r2, [r4, #3356]
	add	r3, r3, r2
	cmp	r5, r3
	bcc	.L867
.L865:
	eor	r1, r1, #1
	cmp	ip, lr
	moveq	ip, #0
	andne	ip, r1, #1
	cmp	ip, #0
	beq	.L890
	mov	r3, #0
	strb	r3, [r0, #1]
	ldr	r3, [r7]
	mov	r2, #0
	str	r2, [r3, #56]
	ldr	r3, [r7]
	ldr	r2, [r3, #48]
	cmp	r2, #1
	beq	.L890
	ldr	r1, [r3, #24]
	mov	r2, #0
	ldr	r0, [r9, #248]
	bl	FSP_SetRef
.L890:
	ldr	r1, [r9, #2596]
	add	r8, r8, #1
	cmp	r8, r1
	bcc	.L869
.L852:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L858:
	cmp	ip, #0
	beq	.L861
	ldr	lr, [r5]
	ldr	r3, [fp, #-48]
	eor	lr, lr, r2
	sub	ip, r3, #1
	tst	lr, ip
	beq	.L891
.L861:
	cmp	r1, #0
	bne	.L874
	ldr	r3, [fp, #-48]
	ldr	ip, [r5]
	sub	r1, r3, #1
	and	lr, r2, r1
	and	r1, r1, ip
	b	.L871
.L892:
	strb	r10, [r0, #1]
	mov	r2, #1
	ldr	r1, [r7]
	str	r10, [r1, #56]
	ldr	r1, [r7]
	str	r10, [r1, #44]
	ldr	r1, [r7]
	ldr	r0, [r8, #248]
	ldr	r1, [r1, #24]
	bl	FSP_SetRef
	ldr	r0, [r7]
	mov	r1, #1
	ldr	ip, [r0, #4]
	b	.L862
.L891:
	strb	r10, [r0, #1]
	mov	r2, #1
	ldr	r1, [r7]
	str	r10, [r1, #44]
	ldr	r1, [r7]
	ldr	r0, [r8, #248]
	ldr	r1, [r1, #24]
	bl	FSP_SetRef
	ldr	r0, [r7]
	mov	r1, #1
	ldr	ip, [r0, #4]
	b	.L862
.L893:
	strb	r10, [r0, #1]
	mov	r2, #1
	ldr	r3, [r7]
	str	r10, [r3, #44]
	ldr	r3, [r7]
	ldr	r0, [r9, #248]
	ldr	r1, [r3, #24]
	bl	FSP_SetRef
	ldr	r0, [r7]
	ldr	lr, [r4, #2436]
	mov	r1, #1
	ldr	ip, [r0, #4]
	b	.L866
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
	ldr	r3, [r3, #2452]
	sub	r3, r3, #19
	cmp	r3, #2
	bls	.L895
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_CheckThatAllRefPicsAreAvailable.part.8
.L895:
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
	ldr	r3, [r0, #2412]
	ldr	r3, [r3, #592]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #16]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_SetFrmRepeatCount.part.9
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount, .-HEVC_SetFrmRepeatCount
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
	ldr	r1, [r5, #3356]
	cmp	r1, #0
	beq	.L918
	add	r10, r0, #7424
	mov	r8, #0
	mov	r6, r8
	mov	r9, r10
	add	r10, r10, #39
	add	r9, r9, #60
.L904:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L900
	ldr	lr, [r7, #2596]
	ldr	ip, [r5, #2436]
	ldr	r3, [r9]
	cmp	lr, #0
	add	ip, ip, r3
	beq	.L900
	add	r1, r7, #2608
	mov	r3, #0
	add	r1, r1, #4
	b	.L903
.L901:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L900
.L903:
	ldr	r2, [r1, #4]!
	ldr	r0, [r2, #4]
	cmp	r0, ip
	bne	.L901
	ldr	r4, [r5, #2456]
	ldr	r0, [r2, #28]
	cmp	r4, r0
	bne	.L901
	add	r4, r7, r3, lsl #2
	mov	r3, #1
	strb	r3, [r2, #1]
	ldr	r3, [r4, #2616]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L944
.L902:
	mov	r2, #1
	str	r2, [r3, #60]
	ldr	r2, [r4, #2616]
	mov	r1, #0
	add	r3, r7, r8, lsl #2
	add	r8, r8, #1
	str	r1, [r2, #56]
	ldr	r2, [r4, #2616]
	str	r2, [r3, #2684]
.L900:
	ldr	r1, [r5, #3356]
	add	r6, r6, #1
	add	r9, r9, #4
	cmp	r1, r6
	bhi	.L904
.L899:
	ldr	r2, [r7, #2592]
	str	r8, [r7, #2608]
	cmp	r2, r8
	bls	.L909
	add	r3, r8, #668
	mov	r0, #0
	add	r3, r3, #2
	add	r3, r7, r3, lsl #2
.L908:
	add	r8, r8, #1
	str	r0, [r3, #4]!
	cmp	r8, r2
	bne	.L908
.L909:
	ldr	r3, [r5, #3360]
	add	r4, r1, r3
	cmp	r4, r6
	movls	r8, #0
	bls	.L907
	add	r9, r6, #1856
	add	r10, r6, #7424
	add	r9, r9, #15
	add	r10, r10, #39
	add	r10, r7, r10
	mov	r8, #0
	add	r9, r7, r9, lsl #2
	str	r8, [fp, #-48]
.L914:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L910
	ldr	ip, [r7, #2596]
	ldr	r0, [r5, #2436]
	ldr	r3, [r9]
	cmp	ip, #0
	add	r0, r0, r3
	beq	.L910
	add	r1, r7, #2608
	mov	r3, #0
	add	r1, r1, #4
	b	.L913
.L911:
	add	r3, r3, #1
	cmp	r3, ip
	beq	.L910
.L913:
	ldr	r2, [r1, #4]!
	ldr	lr, [r2, #4]
	cmp	lr, r0
	bne	.L911
	ldr	r8, [r5, #2456]
	ldr	lr, [r2, #28]
	cmp	r8, lr
	bne	.L911
	add	r8, r7, r3, lsl #2
	mov	r3, #1
	strb	r3, [r2, #1]
	ldr	r3, [r8, #2616]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L945
.L912:
	mov	r2, #1
	str	r2, [r3, #60]
	ldr	r2, [r8, #2616]
	ldr	r1, [fp, #-48]
	add	r3, r1, #688
	add	r1, r1, #1
	str	r1, [fp, #-48]
	mov	r1, #0
	str	r1, [r2, #56]
	ldr	r2, [r8, #2616]
	str	r2, [r7, r3, asl #2]
.L910:
	add	r6, r6, #1
	add	r9, r9, #4
	cmp	r4, r6
	bhi	.L914
	ldr	r8, [fp, #-48]
	ldr	r2, [r7, #2592]
.L907:
	cmp	r2, r8
	str	r8, [r7, #2612]
	bls	.L898
	add	r1, r8, #684
	mov	r3, #0
	add	r1, r1, #3
	add	r7, r7, r1, lsl #2
.L916:
	add	r8, r8, #1
	str	r3, [r7, #4]!
	cmp	r8, r2
	bne	.L916
.L898:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L944:
	ldr	r1, [r3, #24]
	mov	r2, #1
	ldr	r0, [r7, #248]
	bl	FSP_SetRef
	ldr	r3, [r4, #2616]
	b	.L902
.L945:
	ldr	r1, [r3, #24]
	mov	r2, #1
	ldr	r0, [r7, #248]
	bl	FSP_SetRef
	ldr	r3, [r8, #2616]
	b	.L912
.L918:
	mov	r8, r1
	mov	r6, r1
	b	.L899
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
	ldr	r2, [r0, #2376]
	mov	r7, r0
	ldr	r3, [r5, #2460]
	mov	r0, #1888
	ldr	ip, [r7, #2372]
	movw	lr, #12644
	mov	r1, #1
	mla	r0, r0, r3, r2
	ldr	r3, [r5, #3356]
	ldr	r2, [r5, #3360]
	add	r2, r3, r2
	ldr	r3, [r5, #3364]
	sub	r2, r2, #1
	ldr	r0, [r0, #32]
	sub	r10, r3, #1
	cmp	r10, r2
	mla	r2, lr, r0, ip
	ldr	r2, [r2, #116]
	mov	r2, r1, asl r2
	ble	.L957
	add	r9, r3, #1872
	add	r3, r3, #7424
	add	r9, r9, #15
	add	r3, r3, #40
	add	r3, r7, r3
	sub	r4, r2, #1
	add	r9, r7, r9, lsl #2
	mov	r8, #0
	str	r8, [fp, #-52]
	mov	r8, r3
	str	r1, [fp, #-56]
.L953:
	ldrb	r3, [r8, #-1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L948
	ldrb	r0, [r9, #-944]	@ zero_extendqisi2
	ldr	ip, [r9]
	ldr	lr, [r7, #2596]
	cmp	r0, #0
	andeq	ip, ip, r4
	cmp	lr, #0
	ble	.L948
	add	r1, r7, #2608
	mov	r3, #0
	add	r1, r1, #4
	str	r7, [fp, #-48]
	b	.L952
.L951:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L964
.L952:
	ldr	r2, [r1, #4]!
	cmp	r0, #0
	ldr	r6, [r2, #4]
	andeq	r6, r6, r4
	cmp	ip, r6
	bne	.L951
	ldr	r6, [r5, #2456]
	ldr	r7, [r2, #28]
	cmp	r7, r6
	bne	.L951
	ldr	r7, [fp, #-48]
	mov	ip, #0
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-56]
	add	r3, r7, r3, lsl #2
	strb	r0, [r2, #1]
	add	r2, r7, r1, lsl #2
	add	r1, r1, #1
	str	r1, [fp, #-52]
	ldr	r1, [r3, #2616]
	str	ip, [r1, #60]
	ldr	r1, [r3, #2616]
	str	r0, [r1, #56]
	ldr	r3, [r3, #2616]
	str	r3, [r2, #2820]
.L948:
	ldr	r3, [r5, #3356]
	sub	r10, r10, #1
	ldr	r2, [r5, #3360]
	sub	r9, r9, #4
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r10
	blt	.L953
	ldr	r8, [fp, #-52]
	mov	r3, r8
.L947:
	ldr	r2, [r7, #2592]
	str	r3, [r7, #2604]
	cmp	r2, r8
	ble	.L946
	add	r3, r8, #704
	mov	r1, #0
	add	r3, r7, r3, lsl #2
.L955:
	add	r8, r8, #1
	str	r1, [r3, #4]!
	cmp	r8, r2
	bne	.L955
.L946:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L964:
	ldr	r7, [fp, #-48]
	b	.L948
.L957:
	mov	r3, #0
	mov	r8, r3
	b	.L947
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
	beq	.L983
	add	r2, r0, #4096
	mov	r3, #200
	movw	r1, #14584
	ldr	r7, [r2, #1832]
	mul	r3, r3, r7
	add	r2, r0, r3
	ldr	r1, [r2, r1]
	cmp	r1, #0
	beq	.L968
	add	r2, r2, #14592
	ldr	r4, [r2]
	cmp	r4, #0
	addne	r3, r3, #14592
	movne	r4, #0
	addne	r3, r0, r3
	bne	.L971
	b	.L969
.L974:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L969
.L971:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L974
.L968:
	ldr	r2, .L984
	movw	r1, #11248
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
.L981:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L969:
	ldr	r1, [r5, #24]
	ldr	r0, [r6, #248]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	beq	.L972
	ldr	r3, [ip, #24]
	cmp	r3, #0
	beq	.L972
	mov	r3, #50
	mov	r2, #200
	mla	r3, r3, r7, r4
	mov	r0, #1
	mla	r7, r2, r7, r6
	movw	r1, #11230
	ldr	r2, .L984+4
	add	r6, r6, r3, lsl #2
	add	r7, r7, #14528
	add	r6, r6, #12288
	str	r0, [r6, #2304]
	mov	r0, #11
	ldr	r3, [ip, #24]
	ldr	r3, [r3, #36]
	str	r3, [r6, #2368]
	ldr	r3, [r5, #4]
	str	r3, [r6, #2432]
	ldr	r3, [r7, #60]
	add	r3, r3, #1
	str	r3, [r7, #60]
	ldr	r3, [r5, #160]
	str	r4, [sp]
	bl	dprint_normal
	mov	r0, #0
	str	r4, [r5, #20]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L972:
	ldr	r1, [r5, #4]
	mov	lr, #0
	ldrb	r2, [r5, #1]	@ zero_extendqisi2
	mov	r0, lr
	ldr	r3, [r5, #24]
	str	lr, [sp, #12]
	stmia	sp, {r1, r2, ip}
	movw	r1, #11242
	ldr	r2, .L984+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L981
.L983:
	movw	r1, #11213
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L984+12
	ldr	r2, .L984+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L981
.L985:
	.align	2
.L984:
	.word	.LC62
	.word	.LC60
	.word	.LC61
	.word	.LC58
	.word	.LC59
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r4, r1, #0
	beq	.L996
	ldr	r0, [r0, #248]
	ldr	r1, [r4, #24]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L988
	ldr	r3, [r0, #20]
	cmp	r3, #3
	cmpne	r3, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L1007
	ldr	r3, [r4, #48]
	cmp	r3, #1
	beq	.L993
	ldr	r3, [r4, #44]
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L992
	cmp	r2, #1
	beq	.L992
.L1004:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1007:
	str	r3, [sp, #4]
	movw	r1, #11546
	ldr	ip, [r4, #24]
	mov	r0, #11
	ldr	r3, .L1008
	ldr	r2, .L1008+4
	str	ip, [sp]
	bl	dprint_normal
.L990:
	ldr	r3, [r4, #48]
	cmp	r3, #1
	beq	.L993
	ldr	ip, [r4, #4]
	movw	r1, #11565
	ldr	r3, .L1008
	mov	r0, #1
	ldr	r2, .L1008+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #2
	b	.L1004
.L988:
	ldr	ip, [r4, #24]
	mov	r3, r4
	ldr	r2, .L1008+12
	movw	r1, #11552
	mov	r0, #1
	str	ip, [sp, #8]
	ldr	ip, [r4, #48]
	str	ip, [sp, #4]
	ldr	ip, [r4, #4]
	str	ip, [sp]
	bl	dprint_normal
	b	.L990
.L992:
	str	r2, [sp, #8]
	movw	r1, #11572
	str	r3, [sp, #4]
	mov	r0, #1
	str	r4, [sp]
	ldr	r3, .L1008
	ldr	r2, .L1008+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L1004
.L996:
	mvn	r0, #0
	b	.L1004
.L993:
	mov	r2, #1
	mov	r3, #2
	strb	r2, [r4, #2]
	mvn	r0, #2
	str	r3, [r4, #48]
	b	.L1004
.L1009:
	.align	2
.L1008:
	.word	.LANCHOR0+320
	.word	.LC63
	.word	.LC65
	.word	.LC64
	.word	.LC66
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r8, r1, #288
	mov	r5, r1
	mvn	r7, #0
	ldrd	r2, [r8, #-8]
	mvn	r6, #0
	ldr	r1, [r1, #8]
	mov	r4, r0
	cmp	r3, r7
	cmpeq	r2, r6
	str	r1, [fp, #-52]
	beq	.L1012
	ldr	ip, [r0, #2596]
	cmp	ip, #0
	beq	.L1012
	add	r10, r0, #2608
	mvn	r3, #0
	mvn	r6, #1
	mvn	r7, #0
	add	r10, r10, #4
	str	r3, [fp, #-48]
	mov	r9, #0
	b	.L1015
.L1044:
	ldr	r1, [r10]
	ldr	ip, [r4, #2596]
	add	r1, r1, #288
	ldrd	r0, [r1, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r9, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L1014:
	add	r9, r9, #1
	cmp	r9, ip
	bcs	.L1047
.L1015:
	ldr	r1, [r10, #4]!
	cmp	r1, #0
	beq	.L1014
	ldr	r1, [r1, #24]
	ldr	r0, [r4, #248]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1046
	ldr	r1, [r0, #20]
	cmp	r1, #3
	cmpne	r1, #0
	bne	.L1044
.L1046:
	ldr	ip, [r4, #2596]
	add	r9, r9, #1
	cmp	r9, ip
	bcc	.L1015
.L1047:
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L1012
	ldrd	r2, [r8, #-8]
	cmp	r7, r3
	cmpeq	r6, r2
	bcc	.L1048
.L1012:
	ldrb	r3, [r5, #229]	@ zero_extendqisi2
	ldrb	r2, [r5, #228]	@ zero_extendqisi2
	and	r3, r3, #195
	bfc	r3, #0, #2
	bfc	r2, #0, #2
	strb	r3, [r5, #229]
	strb	r2, [r5, #228]
	ldr	r3, [r4, #148]
	str	r3, [r5, #136]
	ldr	r3, [r4, #2392]
	ldrh	r3, [r3, #112]
	cmp	r3, #1
	moveq	r2, #0
	beq	.L1016
	movw	r2, #257
	cmp	r3, r2
	movne	r2, #1
	bne	.L1016
	ldr	r2, [r4, #2900]
	subs	r2, r2, #1
	movne	r2, #1
.L1016:
	ldr	r3, [r4, #2396]
	ldrb	r3, [r3, #2054]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r0, #3
	beq	.L1017
	ldr	r3, [r5, #36]
	cmp	r3, #1
	cmpne	r3, #11
	moveq	r0, #1
	bne	.L1049
.L1018:
	ldr	r2, [r5, #40]
	clz	r2, r2
	mov	r2, r2, lsr #5
.L1017:
	ldrb	r3, [r5, #229]	@ zero_extendqisi2
	mov	r1, #2
	ldr	ip, [r5, #44]
	bfi	r3, r1, #4, #2
	ldrb	r1, [r5, #228]	@ zero_extendqisi2
	cmp	ip, #0
	bfi	r3, r0, #2, #2
	bfi	r3, r2, #0, #2
	ldr	r0, [fp, #-52]
	strb	r3, [r5, #229]
	ldrne	r3, [r5, #12]
	bfi	r1, r0, #0, #2
	strb	r1, [r5, #228]
	ldr	r1, [r5, #24]
	strne	r3, [r5, #168]
	ldr	r0, [r4, #248]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L1010
	ldr	r3, .L1050
	add	r1, r5, #72
	mov	r2, #536
	ldr	r3, [r3, #52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1048:
	ldr	r0, [r4, #248]
	strd	r6, [sp]
	bl	IsPtsRewind
	cmp	r0, #0
	bne	.L1012
	ldrd	r2, [r8, #-8]
	movw	r1, #11624
	ldr	ip, [r4, #248]
	mov	r0, #24
	strd	r6, [sp, #8]
	strd	r2, [sp]
	mov	r3, ip
	ldr	r2, .L1050+4
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	add	r10, r3, #652
	ldrd	r2, [r8, #-8]
	add	r10, r10, #2
	ldr	r1, [r4, r10, asl #2]
	add	r1, r1, #288
	strd	r2, [r1, #-8]
	strd	r6, [r8, #-8]
	b	.L1012
.L1049:
	bic	r3, r3, #8
	cmp	r3, #2
	moveq	r0, #2
	movne	r0, #3
	b	.L1018
.L1010:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1051:
	.align	2
.L1050:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC67
	UNWIND(.fnend)
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
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
	ldr	r0, [r0, #248]
	mov	r9, r1
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1057
	ldr	r3, [r0, #20]
	cmp	r3, #0
	addne	r4, r0, #200
	addne	r5, r0, #232
	movne	r6, #0
	movne	r7, #0
	beq	.L1062
.L1056:
	ldr	r1, [r4, #8]!
	cmp	r1, #0
	beq	.L1055
	ldr	r0, [r8, #248]
	bl	FreeUsdByDec
	strd	r6, [r4]
.L1055:
	cmp	r4, r5
	bne	.L1056
	ldr	r0, [r8, #248]
	mov	r1, r9
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1062:
	ldr	r2, .L1063
	movw	r1, #11727
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1057:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1064:
	.align	2
.L1063:
	.word	.LC68
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
	ldr	r3, [r1, #544]
	movw	r2, #14999
	cmp	r3, r2
	bhi	.L1069
	sub	r2, r3, #8448
	movw	ip, #4749
	sub	r2, r2, #52
	cmp	r2, ip
	movls	r3, #1
	strlsb	r3, [r0, #3]
	bls	.L1067
	sub	r3, r3, #13248
	movw	r2, #1749
	sub	r3, r3, #2
	cmp	r3, r2
	bhi	.L1069
	mov	r3, #2
	strb	r3, [r0, #3]
.L1067:
	ldr	r3, [r1, #576]
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
	ldr	r3, [r1, #580]
	cmp	r3, r4
	movwls	r2, #5977
	movtls	r2, 53687
	umullls	r2, r3, r3, r2
	ubfxls	lr, r3, #13, #16
	strh	lr, [r0, #6]	@ movhi
	ldmfd	sp, {r4, fp, sp, pc}
.L1069:
	mov	r3, #0
	strb	r3, [r0, #3]
	b	.L1067
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r2, .L1091
	mov	r4, r0
	ldrb	r3, [r0]	@ zero_extendqisi2
	movw	r1, #11785
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	ldr	r2, .L1091+4
	movw	r1, #11786
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldr	r2, .L1091+8
	movw	r1, #11787
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	ldr	r2, .L1091+12
	movw	r1, #11788
	mov	r0, #32
	bl	dprint_normal
	ldrh	r3, [r4, #4]
	ldr	r2, .L1091+16
	movw	r1, #11789
	mov	r0, #32
	bl	dprint_normal
	ldrh	r3, [r4, #6]
	ldr	r2, .L1091+20
	movw	r1, #11790
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	ldr	r2, .L1091+24
	movw	r1, #11791
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	ldr	r2, .L1091+28
	movw	r1, #11792
	mov	r0, #32
	bl	dprint_normal
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L1073
	movw	r1, #11796
	ldr	r2, .L1091+32
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	ldr	r2, .L1091+36
	movw	r1, #11797
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L1091+40
	movw	r1, #11798
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	ldr	r2, .L1091+44
	movw	r1, #11799
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #14]	@ zero_extendqisi2
	ldr	r2, .L1091+48
	movw	r1, #11800
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	ldr	r2, .L1091+52
	movw	r1, #11802
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #15
	addne	r6, r4, #25
	beq	.L1078
.L1077:
	ldrb	r3, [r7, #1]!	@ zero_extendqisi2
	movw	r1, #11806
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L1091+56
	bl	dprint_normal
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
	movw	r1, #11807
	str	r5, [sp]
	ldr	r2, .L1091+60
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, r5
	bhi	.L1077
.L1078:
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	movw	r1, #11810
	ldr	r2, .L1091+64
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #36
	addne	r6, r4, #42
	movne	r5, #0
	beq	.L1079
.L1080:
	ldrb	r3, [r7, #1]!	@ zero_extendqisi2
	movw	r1, #11814
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L1091+68
	bl	dprint_normal
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
	movw	r1, #11815
	str	r5, [sp]
	ldr	r2, .L1091+72
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, r5
	bhi	.L1080
.L1079:
	movw	r3, #290
	ldr	r2, .L1091+76
	mov	r1, #11840
	mov	r0, #32
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L1073:
	movw	r1, #11820
	ldr	r2, .L1091+80
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #10
	addne	r6, r4, #78
	movne	r5, #0
	beq	.L1085
.L1084:
	ldrh	ip, [r7, #2]!
	mov	r3, r5
	ldr	r2, .L1091+84
	movw	r1, #11824
	mov	r0, #32
	str	ip, [sp]
	bl	dprint_normal
	ldrh	ip, [r6, #2]!
	mov	r3, r5
	ldr	r2, .L1091+88
	movw	r1, #11825
	mov	r0, #32
	str	ip, [sp]
	add	r5, r5, #1
	bl	dprint_normal
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1084
.L1085:
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	movw	r1, #11828
	ldr	r2, .L1091+92
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #148
	addne	r6, r4, #216
	movne	r5, #0
	beq	.L1083
.L1086:
	ldrh	r3, [r7, #2]!
	movw	r1, #11832
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L1091+96
	bl	dprint_normal
	ldrh	r3, [r6, #2]!
	movw	r1, #11833
	str	r5, [sp]
	ldr	r2, .L1091+100
	mov	r0, #32
	bl	dprint_normal
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, r5
	bhi	.L1086
.L1083:
	movw	r3, #286
	ldr	r2, .L1091+104
	ldrh	r3, [r4, r3]
	add	r4, r4, #288
	movw	r1, #11836
	mov	r0, #32
	bl	dprint_normal
	ldr	r2, .L1091+108
	movw	r1, #11837
	ldrh	r3, [r4]
	mov	r0, #32
	bl	dprint_normal
	b	.L1079
.L1092:
	.align	2
.L1091:
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC84
	.word	.LC85
	.word	.LC83
	.word	.LC86
	.word	.LC87
	.word	.LC96
	.word	.LC88
	.word	.LC90
	.word	.LC91
	.word	.LC89
	.word	.LC94
	.word	.LC95
	.word	.LC92
	.word	.LC93
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
	UNWIND(.pad #320)
	sub	sp, sp, #320
	mov	r4, r2
	mov	r6, r1
	movw	r2, #290
	mov	r5, r0
	mov	r1, #0
	sub	r0, fp, #320
	bl	memset
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	ldrb	r2, [r4, #56]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	ip, [r4, #540]	@ zero_extendqisi2
	beq	.L1133
	cmp	r2, #0
	bne	.L1135
.L1133:
	ldrb	r0, [r4, #59]	@ zero_extendqisi2
	ldrb	r1, [r4, #100]	@ zero_extendqisi2
.L1095:
	str	r1, [sp, #16]
	movw	r1, #11861
	str	r0, [sp, #12]
	mov	r0, #20
	stmib	sp, {r2, ip}
	str	r3, [sp]
	ldr	r2, .L1138
	ldr	r3, .L1138+4
	bl	dprint_normal
	mov	r3, #0
	strb	r3, [r5, #306]
.L1093:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1135:
	cmp	ip, #0
	beq	.L1133
	ldrb	r1, [r4, #59]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1098
	ldrb	r0, [r4, #100]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1136
.L1098:
	mov	r3, #1
	strb	r3, [r5, #306]
	ldr	r0, [r6, #24]
	ldrb	r1, [r4, #57]	@ zero_extendqisi2
	ldrb	r2, [r4, #58]	@ zero_extendqisi2
	cmp	r0, #9
	strb	r1, [fp, #-320]
	strb	r2, [fp, #-319]
	bne	.L1100
	ldr	r2, [r6, #32]
	cmp	r2, #9
	streqb	r3, [fp, #-312]
.L1100:
	ldrb	r3, [r4, #60]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1101
	ldrb	r2, [r4, #101]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1101
	cmp	r2, #9
	cmpne	r3, #9
	ldrneb	r3, [fp, #-312]	@ zero_extendqisi2
	moveq	r3, #1
	strb	r3, [fp, #-318]
.L1101:
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
	bne	.L1105
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
	beq	.L1110
	sub	r2, fp, #320
	add	ip, r4, #66
	add	r0, r2, #15
	add	r1, r4, #76
	add	r2, r2, #25
.L1109:
	add	r3, r3, #1
	ldrb	r6, [ip, #1]!	@ zero_extendqisi2
	ldrb	lr, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #9
	cmpls	r3, r7
	strb	r6, [r0, #1]!
	strb	lr, [r2, #1]!
	bcc	.L1109
.L1110:
	ldrb	r6, [r4, #87]	@ zero_extendqisi2
	cmp	r6, #0
	strb	r6, [fp, #-284]
	beq	.L1108
	sub	r2, fp, #276
	add	r0, r4, #87
	sub	r1, fp, #284
	add	r4, r4, #93
	sub	r2, r2, #2
	mov	r3, #0
.L1113:
	add	r3, r3, #1
	ldrb	lr, [r0, #1]!	@ zero_extendqisi2
	ldrb	ip, [r4, #1]!	@ zero_extendqisi2
	cmp	r3, #5
	cmpls	r3, r6
	strb	lr, [r1, #1]!
	strb	ip, [r2, #1]!
	bcc	.L1113
.L1108:
	ldr	r3, [r5, #316]
	cmp	r3, #0
	bne	.L1137
	ldr	r3, .L1138+4
	movw	r1, #11958
	ldr	r2, .L1138+8
	mov	r0, #1
	bl	dprint_normal
	b	.L1093
.L1105:
	ldrb	r7, [r4, #140]	@ zero_extendqisi2
	ldr	r2, [r4, #108]
	add	r7, r7, #1
	ldr	r3, [r4, #112]
	uxtb	r7, r7
	strh	r2, [fp, #-34]	@ movhi
	cmp	r7, #0
	strb	r7, [fp, #-310]
	strh	r3, [fp, #-32]	@ movhi
	beq	.L1117
	sub	r3, fp, #320
	add	ip, r4, #142
	add	r1, r4, #340
	sub	r2, fp, #242
	add	r0, r3, #10
	mov	r3, #0
.L1116:
	add	r3, r3, #1
	ldrh	r6, [ip, #2]!
	ldrh	lr, [r1, #2]!
	cmp	r3, #32
	cmpls	r3, r7
	strh	r6, [r0, #2]!	@ movhi
	strh	lr, [r2, #2]!	@ movhi
	bcc	.L1116
.L1117:
	ldrb	r6, [r4, #141]	@ zero_extendqisi2
	add	r6, r6, #1
	uxtb	r6, r6
	strb	r6, [fp, #-172]
	cmp	r6, #0
	beq	.L1108
	add	r2, r4, #404
	sub	r0, fp, #172
	add	r4, r4, #208
	add	r2, r2, #2
	sub	r1, fp, #104
	mov	r3, #0
.L1118:
	add	r3, r3, #1
	ldrh	lr, [r4, #2]!
	ldrh	ip, [r2, #2]!
	cmp	r3, #32
	cmpls	r3, r6
	strh	lr, [r0, #2]!	@ movhi
	strh	ip, [r1, #2]!	@ movhi
	bcc	.L1118
	b	.L1108
.L1136:
	mov	r1, r0
	b	.L1095
.L1137:
	ldr	r3, .L1138+12
	sub	r1, fp, #320
	movw	r2, #290
	ldr	r0, [r5, #320]
	ldr	r3, [r3, #52]
	blx	r3
	movw	r3, #290
	str	r3, [r5, #312]
	b	.L1093
.L1139:
	.align	2
.L1138:
	.word	.LC97
	.word	.LANCHOR0+344
	.word	.LC98
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_GetSLHDR1Info, .-HEVC_GetSLHDR1Info
	.align	2
	.global	HEVC_GetHDR10PlusInfo
	.type	HEVC_GetHDR10PlusInfo, %function
HEVC_GetHDR10PlusInfo:
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
	ldr	r3, [r1, #3024]
	mov	r4, r0
	cmp	r3, #1
	bne	.L1145
	ldr	r0, [r0, #320]
	str	r3, [r4, #308]
	cmp	r0, #0
	beq	.L1146
	ldr	r2, [r4, #312]
	movw	ip, #2435
	cmp	r2, ip
	bls	.L1147
	ldr	r3, .L1148
	add	r1, r1, #592
	movw	r2, #2436
	ldr	r3, [r3, #52]
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	r3
.L1147:
	str	r2, [sp]
	mov	r0, r3
	movw	r2, #2436
	ldr	r3, .L1148+4
	str	r2, [sp, #4]
	movw	r1, #11993
	ldr	r2, .L1148+8
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1145:
	str	r3, [sp]
	movw	r1, #11974
	ldr	r3, .L1148+4
	mov	r0, #20
	ldr	r2, .L1148+12
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r4, #308]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1146:
	mov	r0, r3
	ldr	r2, .L1148+16
	ldr	r3, .L1148+4
	movw	r1, #11986
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_normal
.L1149:
	.align	2
.L1148:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+364
	.word	.LC101
	.word	.LC99
	.word	.LC100
	UNWIND(.fnend)
	.size	HEVC_GetHDR10PlusInfo, .-HEVC_GetHDR10PlusInfo
	.align	2
	.global	HEVC_ConvertHDRInfo
	.type	HEVC_ConvertHDRInfo, %function
HEVC_ConvertHDRInfo:
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
	ldrb	r3, [r1]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r2
	add	r0, r0, #332
	add	r0, r0, #2
	add	lr, r5, #552
	strb	r3, [r4, #328]
	add	ip, r4, #340
	ldr	r6, [r1, #24]
	mov	r3, #0
	strb	r6, [r4, #329]
	ldr	r6, [r1, #32]
	strb	r6, [r4, #330]
	ldr	r6, [r1, #28]
	str	r6, [r4, #332]
	ldrb	r6, [r2, #540]!	@ zero_extendqisi2
	strb	r6, [r4, #304]
.L1151:
	ldr	r6, [r2, #4]!
	add	r3, r3, #1
	cmp	r3, #3
	strh	r6, [r0, #2]!	@ movhi
	ldr	r6, [lr, #4]!
	strh	r6, [ip, #2]!	@ movhi
	bne	.L1151
	ldr	r0, [r5, #568]
	add	r3, r4, #304
	movw	lr, #586
	add	ip, r5, #588
	mov	r2, r5
	strh	r0, [r3, #44]	@ movhi
	mov	r0, r4
	ldr	r6, [r5, #572]
	strh	r6, [r3, #46]	@ movhi
	ldr	r3, [r5, #576]
	str	r3, [r4, #352]
	ldr	r3, [r5, #580]
	str	r3, [r4, #356]
	ldrb	r3, [r5, #584]	@ zero_extendqisi2
	strb	r3, [r4, #305]
	ldrh	r3, [r5, lr]
	str	r3, [r4, #360]
	ldrh	r3, [ip]
	str	r3, [r4, #364]
	ldrb	r3, [r5, #590]	@ zero_extendqisi2
	strb	r3, [r4, #368]
	bl	HEVC_GetSLHDR1Info
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVC_GetHDR10PlusInfo
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
	ldr	r3, [r0, #2376]
	mov	r6, r0
	mov	r0, #1888
	ldr	r2, [r4, #2460]
	movw	r5, #12644
	ldr	ip, [r6, #2372]
	mov	r1, #0
	mov	lr, r1
	mla	r3, r0, r2, r3
	add	r0, r6, #14784
	ldr	r3, [r3, #32]
	strb	r1, [r4, #1825]
	mla	r5, r5, r3, ip
.L1158:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L1154
	cmp	r0, #0
	beq	.L1164
	ldr	ip, [r6, #2596]
	cmp	ip, #0
	beq	.L1164
	ldr	r2, [r6, #2616]
	cmp	r2, r0
	beq	.L1154
	add	r2, r6, #2608
	add	r2, r2, #8
	b	.L1156
.L1157:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L1154
.L1156:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1157
.L1164:
	mov	r8, #608
	mov	r7, r0
	mla	r8, r8, lr, r6
	mov	r3, #101
	mov	r2, #536
	str	r3, [r4, #1864]
	add	r0, r4, #1888
	mov	r3, #1
	add	r1, r8, #14848
	strb	r3, [r4, #1825]
	add	r1, r1, #8
	mov	r9, #0
	bl	memcpy
	add	r3, r8, #14784
	str	r7, [r4, #1884]
	str	r9, [r4, #1984]
	str	r9, [r3, #12]
	strb	r9, [r3, #2]
	strb	r9, [r7]
	ldr	r3, [r4, #1884]
	str	r9, [r3, #56]
	ldr	r3, [r4, #1884]
	str	r9, [r3, #60]
	ldr	r3, [r4, #1884]
	str	r9, [r3, #48]
	ldrb	r3, [r4, #1825]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1161
	mov	r1, r9
	ldr	r0, [r6, #248]
	bl	FSP_NewLogicFs
	mov	r7, r0
	mov	r1, r0
	ldr	r0, [r6, #248]
	bl	FSP_GetLogicFs
	mvn	r3, r7
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r8, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1160
	add	r1, r5, #2048
	add	r2, r6, #2880
	ldr	r5, .L1168
	add	r1, r1, #4
	add	r2, r2, #8
	bl	HEVC_ConvertHDRInfo
	ldr	r0, [r4, #1884]
	add	r1, r8, #40
	ldr	r3, [r5, #52]
	mov	r2, #536
	add	r0, r0, #72
	blx	r3
	ldr	r1, [r4, #1884]
	add	r0, r6, #5952
	ldr	r3, [r5, #52]
	add	r1, r1, #72
	mov	r2, #536
	add	r0, r0, #32
	blx	r3
	ldr	r3, [r4, #1884]
	mov	r0, r9
	str	r7, [r3, #24]
	ldr	r3, [r8, #32]
	ldr	r3, [r3, #4]
	str	r3, [r4, #1860]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1154:
	add	lr, lr, #1
	add	r0, r0, #608
	cmp	lr, #20
	bne	.L1158
.L1161:
	ldr	r2, .L1168+4
	movw	r1, #12077
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1160:
	strb	r3, [r4, #1825]
	mov	r0, r3
	ldr	r2, .L1168+8
	movw	r1, #12097
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1169:
	.align	2
.L1168:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC102
	.word	.LC103
	UNWIND(.fnend)
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
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
	ldr	r3, [r6, #2616]
	str	r7, [r3, #44]
	ldr	r3, [r6, #2616]
	ldr	r0, [r0, #248]
	ldr	r1, [r3, #24]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1171
	ldr	r3, [r0, #20]
	cmp	r3, #3
	beq	.L1172
	ldr	r3, [r6, #2616]
	mov	r2, r7
	ldr	r0, [r5, #248]
	ldr	r1, [r3, #24]
	bl	FSP_SetDisplay
.L1172:
	ldr	r3, [r6, #2616]
	mov	r2, #0
	ldr	r0, [r5, #248]
	ldr	r1, [r3, #24]
	bl	FSP_SetRef
.L1171:
	ldr	r1, [r5, #2596]
	sub	r1, r1, #1
	cmp	r4, r1
	addls	r3, r4, #652
	addls	r3, r3, #2
	addls	r3, r5, r3, lsl #2
	bhi	.L1175
.L1174:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bls	.L1174
.L1175:
	add	r3, r1, #652
	mov	r2, #0
	add	r3, r3, #2
	str	r2, [r5, r3, asl #2]
	str	r1, [r5, #2596]
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
	ldr	r1, [r0, #2596]
	mov	r5, r0
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r6, #0
	mov	r4, r6
	mov	r7, r6
	b	.L1187
.L1186:
	add	r4, r4, #1
	cmp	r4, r1
	mov	r6, r4
	bcs	.L1193
.L1187:
	add	r3, r4, #652
	add	r3, r3, #2
	ldr	r3, [r5, r3, asl #2]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1186
	mov	r1, r6
	strb	r7, [r3]
	mov	r0, r5
	sub	r4, r4, #1
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	add	r4, r4, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r1, [r5, #2596]
	mov	r6, r4
	cmp	r4, r1
	bcc	.L1187
.L1193:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveDummyFrame, .-HEVC_RemoveDummyFrame
	.align	2
	.global	HEVC_RemoveSamePocOutDPB
	.type	HEVC_RemoveSamePocOutDPB, %function
HEVC_RemoveSamePocOutDPB:
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
	mov	r8, r1
	ldr	r1, [r0, #2596]
	mov	r7, r0
	mov	r6, r2
	cmp	r1, #0
	beq	.L1194
	add	r5, r0, #2608
	mov	r4, #0
	add	r5, r5, #4
	b	.L1199
.L1197:
	ldr	r3, [r0, #4]
	ldr	r2, [r6, #12]
	cmp	r3, r2
	beq	.L1202
	add	r4, r4, #1
	cmp	r4, r1
	bcs	.L1194
.L1199:
	ldr	r0, [r5, #4]!
	cmp	r0, #0
	bne	.L1197
	mov	r3, r4
	movw	r1, #11141
	str	r0, [sp]
	add	r4, r4, #1
	ldr	r2, .L1203
	bl	dprint_normal
	ldr	r1, [r7, #2596]
	cmp	r4, r1
	bcc	.L1199
.L1194:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1202:
	ldr	r2, .L1203+4
	movw	r1, #11147
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L1203+8
	bl	dprint_normal
	mov	r1, r4
	mov	r0, r7
	bl	HEVC_RemoveApcStore
	mov	r1, r4
	mov	r0, r7
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r3, [r7, #2596]
	str	r3, [r8]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1204:
	.align	2
.L1203:
	.word	.LC104
	.word	.LC105
	.word	.LANCHOR0+388
	UNWIND(.fnend)
	.size	HEVC_RemoveSamePocOutDPB, .-HEVC_RemoveSamePocOutDPB
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
	ldr	r5, [r0, #2596]
	mov	r10, r0
	cmp	r5, #0
	beq	.L1214
	mov	r6, #0
	mvn	r8, #0
	mov	r9, r6
	mov	r4, r6
	b	.L1213
.L1224:
	ldr	r2, [r0, #20]
	cmp	r2, #0
	cmpne	r2, #3
	ldr	r2, [r7, #2616]
	bne	.L1209
	ldr	r0, [r2, #48]
	cmp	r0, #1
	beq	.L1209
	str	r8, [r2, #24]
	mov	r3, #1
	ldr	r2, [r7, #2616]
	strb	r1, [r2, #1]
	ldr	r2, [r7, #2616]
	strb	r3, [r2, #2]
	ldr	r2, [r7, #2616]
.L1209:
	ldr	r3, [r2]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	addne	r9, r9, #1
	beq	.L1223
	add	r4, r4, #1
	cmp	r4, r5
	beq	.L1206
.L1213:
	add	r7, r10, r9, lsl #2
	ldr	r0, [r10, #248]
	ldr	r2, [r7, #2616]
	ldr	r1, [r2, #24]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1207
	ldrsb	r1, [r0]
	cmp	r1, #0
	beq	.L1224
	ldr	r2, [r7, #2616]
	b	.L1209
.L1207:
	ldr	r2, [r7, #2616]
	ldr	r1, [r2, #48]
	cmp	r1, #1
	beq	.L1209
	str	r8, [r2, #24]
	mov	r3, #1
	ldr	r2, [r7, #2616]
	strb	r0, [r2, #1]
	ldr	r2, [r7, #2616]
	strb	r3, [r2, #2]
	ldr	r2, [r7, #2616]
	b	.L1209
.L1223:
	mov	r1, r9
	mov	r0, r10
	add	r4, r4, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	cmp	r4, r5
	mov	r6, #1
	bne	.L1213
.L1206:
	mov	r0, r6
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1214:
	mov	r6, r5
	b	.L1206
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
	ldr	r2, [r3, #2300]
	ldr	r3, [r3, #2296]
	cmp	r2, r3
	bcs	.L1229
	ldr	r3, [r0, #2592]
	ldr	r2, [r0, #2596]
	cmp	r2, r3
	ldmccfd	sp, {r4, r5, fp, sp, pc}
	cmp	r3, #15
	bls	.L1231
.L1229:
	ldr	r3, [r4, #2616]
	mov	r5, #0
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r1, [r3, #24]
	ldr	r0, [r4, #248]
	bl	FSP_SetRef
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVC_RemoveFrameStoreOutDPB
.L1231:
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L1229
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
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r6, r2
	mvn	r3, #-2147483648
	mov	r2, #0
	str	r2, [r6]
	mov	r4, r1
	str	r3, [r1]
	mov	r5, r0
	ldr	r3, [r0, #2596]
	ldr	r2, [r0, #2592]
	cmp	r3, r2
	bhi	.L1239
.L1233:
	cmp	r3, #0
	beq	.L1232
	add	r1, r5, #2608
	mov	r3, #0
	add	r1, r1, #4
.L1236:
	ldr	r2, [r1, #4]!
	ldr	r0, [r4]
	ldr	r2, [r2, #4]
	cmp	r0, r2
	strgt	r2, [r4]
	strgt	r3, [r6]
	add	r3, r3, #1
	ldr	r2, [r5, #2596]
	cmp	r2, r3
	bhi	.L1236
.L1232:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1239:
	str	r2, [sp]
	movw	r1, #12192
	ldr	r2, .L1240
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r5, #2592]
	str	r3, [r5, #2596]
	b	.L1233
.L1241:
	.align	2
.L1240:
	.word	.LC106
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
	ldr	lr, [r0, #2376]
	mov	r5, #1888
	movw	r4, #12644
	ldr	ip, [r3, #2460]
	ldr	r3, [r0, #2372]
	mla	ip, r5, ip, lr
	ldr	lr, [fp, #4]
	ldr	ip, [ip, #32]
	mla	r3, r4, ip, r3
	ldr	ip, [r3, #64]
	ldr	r3, [r3, #68]
	cmp	r1, ip
	cmpeq	lr, #0
	bne	.L1246
	cmp	r2, r3
	beq	.L1247
.L1246:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1247:
	ldr	r3, [r0, #176]
	cmp	r3, #0
	beq	.L1246
	ldr	r3, [r0, #2412]
	ldr	r0, [r3, #856]
	adds	r0, r0, #0
	movne	r0, #1
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
	ldr	r4, [r0, #2384]
	ldrb	ip, [r4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1259
	mov	r3, #0
	mov	r2, r4
	mov	lr, r3
.L1250:
	add	r3, r3, #1
	ldr	r1, [r2, #44]
	cmp	r3, ip
	add	r2, r2, #28
	add	lr, lr, r1
	bne	.L1250
.L1249:
	ldr	r2, [r0, #2364]
	mov	r3, ip, asl #5
	sub	ip, r3, ip, asl #2
	add	r4, r4, ip
	ldr	r3, [r2, #24]
	and	r3, r3, #7
	str	r3, [r4, #56]
	ldr	r2, [r0, #2384]
	ldr	r3, [r0, #2364]
	ldrb	r1, [r2]	@ zero_extendqisi2
	ldr	ip, [r3, #24]
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #48]
	add	r2, r2, ip, lsr #3
	rsb	r2, lr, r2
	str	r2, [r3, #60]
	ldr	r1, [r0, #2384]
	ldr	r3, [r0, #2364]
	ldrb	r2, [r1]	@ zero_extendqisi2
	ldr	ip, [r3, #24]
	mov	r3, r2, asl #5
	sub	r2, r3, r2, asl #2
	add	r2, r1, r2
	ldr	r3, [r2, #44]
	add	r3, lr, r3
	rsb	r3, ip, r3, lsl #3
	str	r3, [r2, #52]
	ldr	r2, [r0, #2384]
	ldrb	r1, [r2]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #60]
	ldr	r1, [r3, #56]
	and	r2, r2, #3
	add	r2, r1, r2, lsl #3
	str	r2, [r3, #56]
	ldr	r2, [r0, #2384]
	ldrb	r1, [r2]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #60]
	bic	r2, r2, #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2384]
	ldr	r3, [r2, #8]
	sub	ip, r3, #1
	cmp	ip, #1
	bhi	.L1266
	ldrb	r1, [r2]	@ zero_extendqisi2
	add	lr, r1, #1
	cmp	r3, lr
	movhi	r3, #1
	movls	r3, #0
	cmp	lr, #1
	movhi	r3, #0
	cmp	r3, #0
	beq	.L1252
	add	r1, r1, #2
	mov	ip, #0
.L1253:
	sub	r3, r1, #1
	mov	lr, r3, asl #5
	sub	r3, lr, r3, asl #2
	add	r2, r2, r3
	str	ip, [r2, #56]
	ldr	r2, [r0, #2384]
	add	r2, r2, r3
	ldr	lr, [r2, #48]
	str	lr, [r2, #60]
	ldr	r2, [r0, #2384]
	add	r2, r2, r3
	ldr	lr, [r2, #44]
	mov	lr, lr, asl #3
	str	lr, [r2, #52]
	ldr	r2, [r0, #2384]
	add	r2, r2, r3
	ldr	lr, [r2, #60]
	ldr	r4, [r2, #56]
	and	lr, lr, #15
	add	lr, r4, lr, lsl #3
	str	lr, [r2, #56]
	ldr	r2, [r0, #2384]
	add	r3, r2, r3
	ldr	r2, [r3, #60]
	bic	r2, r2, #15
	str	r2, [r3, #60]
	ldr	r2, [r0, #2384]
	ldr	r3, [r2, #8]
	cmp	r1, #1
	cmpls	r1, r3
	add	r1, r1, #1
	movcc	lr, #1
	movcs	lr, #0
	cmp	lr, #0
	bne	.L1253
	sub	ip, r3, #1
.L1252:
	mov	r1, ip, asl #5
	ldr	lr, [r2, #12]
	sub	ip, r1, ip, asl #2
	add	r2, r2, ip
	ldr	r3, [r2, #52]
	rsb	r3, lr, r3
	str	r3, [r2, #52]
	ldr	r4, [r0, #2384]
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	lr, [r4, #8]
	cmp	r1, lr
	ldmcsfd	sp, {r4, fp, sp, pc}
	sxth	r3, r1
	add	r0, r0, #4096
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, r4, r3
.L1257:
	ldr	r2, [r3, #60]
	add	r1, r1, #1
	ldr	ip, [r0, #1856]
	add	r3, r3, #28
	cmp	r2, ip
	strcc	r2, [r0, #1856]
	ldrcc	lr, [r4, #8]
	cmp	lr, r1
	bhi	.L1257
	ldmfd	sp, {r4, fp, sp, pc}
.L1266:
	ldr	r2, .L1267
	movw	r1, #12279
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_normal
.L1259:
	mov	lr, ip
	b	.L1249
.L1268:
	.align	2
.L1267:
	.word	.LC107
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
	add	r3, r0, #4096
	ldr	r2, [r0, #168]
	ldr	r3, [r3, #2460]
	cmp	r3, r2
	bge	.L1277
	mov	r2, #1888
	ldr	r1, [r0, #2376]
	mul	r2, r2, r3
	add	ip, r1, r2
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1278
	ldr	r3, [ip, #32]
	ldr	r2, [r0, #164]
	cmp	r3, r2
	bge	.L1279
	ldr	r1, [r0, #2372]
	movw	r2, #12644
	mla	r2, r2, r3, r1
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1280
	ldr	r3, [r2, #48]
	ldr	r2, [r0, #160]
	cmp	r3, r2
	bcs	.L1281
	ldr	r1, [r0, #2368]
	mov	r2, r3, asl #7
	sub	r2, r2, r3, asl #3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1282
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1277:
	ldr	r2, .L1283
	movw	r1, #12328
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1278:
	ldr	r2, .L1283+4
	movw	r1, #12336
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1279:
	ldr	r2, .L1283+8
	movw	r1, #12343
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1280:
	ldr	r2, .L1283+12
	movw	r1, #12351
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1281:
	ldr	r2, .L1283+16
	movw	r1, #12358
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1282:
	ldr	r2, .L1283+20
	movw	r1, #12366
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1284:
	.align	2
.L1283:
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
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
	UNWIND(.pad #24)
	sub	sp, sp, #24
	add	r1, r0, #4096
	ldr	lr, [r0, #2384]
	ldr	r3, [r1, #2456]
	ldr	r2, [lr, #16]
	add	r4, r0, r3, lsl #2
	ldr	ip, [r4, #224]
	cmn	ip, #-2147483647
	beq	.L1326
	sub	r5, r2, #16
	cmp	r2, #21
	cmpne	r5, #2
	bls	.L1323
.L1302:
	cmp	r2, #1
	bls	.L1327
.L1290:
	sub	r2, r2, #19
	cmp	r2, #1
	movls	ip, #-2147483647
	strls	ip, [r4, #224]
.L1323:
	ldr	r2, [r1, #2436]
.L1292:
	cmp	ip, r2
	ble	.L1293
	ldr	r5, [lr, #16]
	sub	r6, r5, #8
	cmp	r6, #1
	addhi	r3, r0, r3
	bls	.L1328
.L1295:
	ldrb	ip, [r3, #10]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1296
	ldr	r5, [r4, #228]
	cmp	r5, r2
	ble	.L1296
	ldr	r6, [lr, #16]
	sub	r7, r6, #8
	cmp	r7, #1
	bls	.L1329
.L1296:
	ldrb	ip, [r1, #2425]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1297
	ldr	lr, [lr, #16]
	sub	r5, lr, #19
	cmp	r5, #1
	bls	.L1324
	cmp	lr, #21
	beq	.L1324
	sub	lr, lr, #16
	cmp	lr, #2
	strls	r2, [r4, #228]
	movls	ip, #1
	strlsb	ip, [r3, #10]
.L1297:
	ldr	ip, [r0, #232]
	ldrb	r3, [r1, #2424]	@ zero_extendqisi2
	cmp	ip, #0
	ldr	r1, [r1, #2460]
	beq	.L1301
	ldr	ip, [r0, #204]
	cmp	r1, ip
	movne	r3, #1
.L1301:
	ldr	ip, [r0, #300]
	cmp	ip, r1
	movne	r0, #1
	beq	.L1330
.L1322:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1327:
	ldr	r5, [r1, #2444]
	cmp	r5, #2
	bne	.L1290
	cmn	ip, #-2147483647
	bne	.L1323
.L1291:
	ldr	r2, [r1, #2436]
	str	r2, [r4, #224]
	ldr	ip, [lr, #16]
	cmp	ip, #1
	bls	.L1331
.L1293:
	add	r3, r0, r3
	ldrb	ip, [r3, #5]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1295
	ldr	r5, [lr, #16]
	sub	r6, r5, #8
	cmp	r6, #1
	bhi	.L1295
	movw	r3, #12434
	str	r2, [sp, #4]
	mov	r1, r3
	str	r3, [sp]
	str	r5, [sp, #12]
	mov	r0, #1
	str	ip, [sp, #8]
	ldr	r3, .L1332
	ldr	r2, .L1332+4
	bl	dprint_normal
	mov	r0, #2
	b	.L1322
.L1326:
	sub	r6, r2, #16
	cmp	r6, #5
	movhi	r7, #0
	movls	r7, #1
	cmp	r2, #1
	ldrls	r5, [r1, #2444]
	movhi	r5, #0
	subls	r5, r5, #2
	clzls	r5, r5
	movls	r5, r5, lsr #5
	orrs	r5, r5, r7
	moveq	r0, #2
	beq	.L1322
	cmp	r2, #21
	cmpne	r6, #2
	bhi	.L1302
	b	.L1291
.L1330:
	ldr	r0, [r0, #256]
	cmp	r2, r0
	moveq	r0, r3
	movne	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1328:
	movw	r3, #12427
	str	r2, [sp, #4]
	mov	r1, r3
	str	r3, [sp]
	str	r5, [sp, #12]
	mov	r0, #1
	str	ip, [sp, #8]
	ldr	r3, .L1332
	ldr	r2, .L1332+8
	bl	dprint_normal
	mov	r0, #2
	b	.L1322
.L1324:
	str	r2, [r4, #228]
	strb	ip, [r3, #10]
	b	.L1297
.L1331:
	mov	ip, #1
	str	ip, [r0, #328]
	ldr	ip, [r4, #224]
	b	.L1292
.L1329:
	movw	r3, #12443
	str	r2, [sp, #8]
	mov	r1, r3
	stmia	sp, {r3, ip}
	str	r6, [sp, #16]
	mov	r0, #1
	str	r5, [sp, #12]
	ldr	r3, .L1332
	ldr	r2, .L1332+12
	bl	dprint_normal
	mov	r0, #2
	b	.L1322
.L1333:
	.align	2
.L1332:
	.word	.LANCHOR0+416
	.word	.LC115
	.word	.LC114
	.word	.LC116
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
	ldr	r0, [r0, #2364]
	bl	BsGet
	cmp	r0, #0
	beq	.L1339
	ldr	r0, [r4, #2364]
	bl	BsBitsToNextByte
	subs	r1, r0, #0
	beq	.L1338
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r2, .L1340
	movw	r1, #12508
	mov	r3, r0
	mov	r0, #17
	bl	dprint_normal
.L1338:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1339:
	ldr	r2, .L1340+4
	movw	r1, #12495
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1341:
	.align	2
.L1340:
	.word	.LC118
	.word	.LC117
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
	ldr	r0, [r0, #2452]
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
	ldr	r0, [r0, #2452]
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
	subs	r9, r2, #0
	mov	r5, r0
	mov	r8, r1
	mov	r7, r3
	bne	.L1382
.L1345:
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r7, #0
	str	r0, [r8, #4]
	ble	.L1350
	sub	r3, fp, #84
	sub	r8, fp, #92
	add	r6, r3, r7
	mov	r4, r3
	mov	r10, r8
.L1351:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4], #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r4, r6
	strb	r0, [r10], #1
	bne	.L1351
	cmp	r7, #7
	movle	r4, r7
	ble	.L1355
	b	.L1356
.L1354:
	cmp	r4, #8
	beq	.L1356
.L1355:
	mov	r1, #2
	ldr	r0, [r5, #2364]
	bl	BsGet
	add	r4, r4, #1
	cmp	r0, #0
	beq	.L1354
	ldr	r2, .L1384
	movw	r1, #12602
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1350:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1356:
	mov	r6, #0
	b	.L1360
.L1359:
	add	r6, r6, #1
	cmp	r6, #5
	movle	r3, #1
	movgt	r3, #0
	cmp	r7, r6
	movle	r3, #0
	cmp	r3, #0
	beq	.L1350
.L1360:
	cmp	r9, #0
	beq	.L1357
	sub	r3, fp, #84
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1383
.L1357:
	ldrb	r3, [r8, r6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1359
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	b	.L1359
.L1383:
	mov	r1, #2
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	mov	r4, #32
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r5, #2364]
	bl	BsGet
.L1358:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	subs	r4, r4, #1
	bne	.L1358
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r5, #2364]
	bl	BsGet
	b	.L1357
.L1382:
	mov	r1, #2
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	sub	r4, fp, #77
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r5, #2364]
	sub	r6, fp, #45
	bl	BsGet
	mov	r10, r0
.L1346:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r6
	bne	.L1346
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8, #1]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	sub	r3, r10, #4
	cmp	r3, #3
	bls	.L1347
	ldrb	r3, [fp, #-72]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1347
	ldrb	r3, [fp, #-71]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1347
	ldrb	r3, [fp, #-70]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1347
	ldrb	r3, [fp, #-69]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1347
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #11
	ldr	r0, [r5, #2364]
	bl	BsGet
	b	.L1349
.L1347:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #2
	ldr	r0, [r5, #2364]
	bl	BsGet
.L1349:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldrb	r2, [fp, #-75]	@ zero_extendqisi2
	ldrb	r3, [fp, #-74]	@ zero_extendqisi2
	str	r10, [r5, #304]
	str	r2, [r5, #308]
	str	r3, [r5, #312]
	b	.L1345
.L1385:
	.align	2
.L1384:
	.word	.LC119
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
	ldr	r9, .L1404
	add	r10, r0, #2208
	add	r3, r0, #2224
	add	r10, r10, #8
	mov	r6, #0
	add	r3, r3, #8
	str	r0, [fp, #-52]
	str	r3, [fp, #-48]
.L1387:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L1395
	ldr	r3, [fp, #-52]
	mov	r8, r6, asl #9
	ldr	r7, [fp, #-48]
	sub	r8, r8, r6, asl #7
	add	r5, r3, #604
	mov	r4, #0
.L1393:
	cmp	r6, #0
	add	r0, r5, r8
	mov	r2, #64
	ldr	r3, [r9, #52]
	beq	.L1402
	cmp	r6, #3
	beq	.L1403
	ldr	ip, .L1404+4
	cmp	r4, #2
	ldr	r1, .L1404+8
	movhi	r1, ip
	blx	r3
.L1389:
	mov	r3, #16
	str	r3, [r7, #4]!
	ldr	r3, [r10]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1393
.L1395:
	add	r6, r6, #1
	ldr	r3, [fp, #-48]
	cmp	r6, #4
	add	r3, r3, #24
	str	r3, [fp, #-48]
	bne	.L1387
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1402:
	mov	r2, #16
	ldr	r1, .L1404+12
	mov	r0, r5
	blx	r3
	b	.L1389
.L1403:
	ldr	r0, .L1404+4
	cmp	r4, #0
	ldr	r1, .L1404+8
	mov	r2, #64
	movne	r1, r0
	add	r0, r5, #1152
	blx	r3
	b	.L1389
.L1405:
	.align	2
.L1404:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+432
	.word	.LANCHOR3
	.word	.LANCHOR0+496
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
	add	lr, r0, r2, lsl #2
	mov	ip, r2, asl #3
	sub	r2, ip, r2, asl #1
	mov	r5, #0
	ldr	r7, [lr, #332]
	add	r3, r3, r2
	cmp	r7, #64
	mov	r6, r3, asl #4
	movcs	r7, #64
	mov	r8, r7, lsr #2
.L1407:
	cmp	r5, r8
	ldmcsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r7, #0
	beq	.L1407
	add	r3, r5, r6
	ldrb	ip, [r1]	@ zero_extendqisi2
	mov	r4, r1
	mov	r2, #0
	add	r3, r0, r3, lsl #2
	ldr	lr, [r3, #604]
	orr	ip, lr, ip
	str	ip, [r3, #604]
.L1413:
	add	r2, r2, #1
	add	r3, r5, r6
	and	lr, r2, #3
	cmp	r2, r7
	add	r3, r0, r3, lsl #2
	mov	ip, lr, asl #3
	beq	.L1407
	ldrb	r9, [r4, #1]!	@ zero_extendqisi2
	cmp	lr, #3
	ldr	lr, [r3, #604]
	addeq	r5, r5, #1
	orr	ip, lr, r9, asl ip
	str	ip, [r3, #604]
	b	.L1413
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
	ldr	r3, [r0, #2396]
	mov	r8, r0
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1415
	ldr	r2, [r0, #2400]
	ldrb	r1, [r2, #21]	@ zero_extendqisi2
	cmp	r1, #0
	addne	r3, r2, #256
	strne	r3, [fp, #-48]
	beq	.L1432
.L1417:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1418
	ldr	r10, .L1433
	mov	r2, #1536
	mov	r1, #0
	add	r0, r8, #604
	add	r7, r8, #2208
	mov	r6, #0
	ldr	r3, [r10, #48]
	add	r7, r7, #8
	blx	r3
	ldr	r9, [fp, #-48]
.L1420:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	movne	r5, r9
	movne	r4, #0
	beq	.L1423
.L1421:
	mov	r3, r4
	mov	r1, r5
	mov	r2, r6
	mov	r0, r8
	bl	HEVC_CalScalingList
	ldr	r3, [r7]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1421
.L1423:
	add	r6, r6, #1
	add	r9, r9, #384
	cmp	r6, #4
	bne	.L1420
	ldr	r2, [fp, #-48]
	add	r0, r8, #2224
	ldr	r3, [r10, #52]
	add	r0, r0, #12
	add	r1, r2, #1536
	mov	r2, #96
	blx	r3
.L1415:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1432:
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r3, r3, #420
	strne	r3, [fp, #-48]
	bne	.L1417
.L1418:
	mov	r0, r8
	bl	HEVC_SetDefaultScalingList
	b	.L1415
.L1434:
	.align	2
.L1433:
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
	b	.L1436
.L1438:
	.word	.L1442
	.word	.L1440
	.word	.L1440
	.word	.L1441
.L1440:
	ldr	r3, .L1446
	cmp	r1, #2
	add	r0, r3, #64
	movhi	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1442:
	ldr	r0, .L1446+4
	ldmfd	sp, {fp, sp, pc}
.L1441:
	ldr	r3, .L1446
	cmp	r1, #0
	add	r0, r3, #64
	movne	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1436:
	ldr	r2, .L1446+8
	movw	r1, #12894
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1447:
	.align	2
.L1446:
	.word	.LANCHOR3+80
	.word	.LANCHOR3+64
	.word	.LC120
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
	bne	.L1458
	sub	r2, r3, #1
	mov	r4, #1
	movs	r2, r2, asr #1
	beq	.L1450
.L1451:
	movs	r2, r2, asr #1
	add	r4, r4, #1
	bne	.L1451
.L1450:
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	cmp	r5, #1
	movls	r10, #0
	movhi	r10, #1
	uxtb	r0, r0
	strb	r0, [r8]
	cmp	r0, #0
	cmpne	r5, #1
	bls	.L1455
	ldr	r3, [r7, #76]
	cmp	r3, #0
	beq	.L1455
	mov	r9, r8
	mov	r5, #0
.L1456:
	mov	r1, r4
	ldr	r0, [r6, #2364]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7, #76]
	cmp	r3, r5
	bhi	.L1456
.L1455:
	ldr	r5, [r7, #20]
	cmp	r5, #0
	beq	.L1473
.L1454:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1473:
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #1]
	cmp	r0, #0
	moveq	r10, #0
	andne	r10, r10, #1
	cmp	r10, #0
	beq	.L1454
	ldr	r3, [r7, #80]
	cmp	r3, #0
	beq	.L1454
	add	r8, r8, #128
.L1457:
	mov	r1, r4
	ldr	r0, [r6, #2364]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r8, #4]!
	ldr	r3, [r7, #80]
	cmp	r3, r5
	bhi	.L1457
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1458:
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
	ldr	r0, [r0, #2364]
	bl	BsResidBits
	cmp	r0, #0
	ble	.L1476
	ldr	r3, [r4, #2384]
	ldr	r3, [r3, #12]
	add	r3, r3, #3
	cmp	r0, r3
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1476:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r0, [r0, #2364]
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #24]
	mov	r3, r3, asl #3
	cmp	r3, r2
	bls	.L1480
	mov	r1, #8
	bl	BsShow
	subs	r0, r0, #128
	movne	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1480:
	str	r2, [sp]
	movw	r1, #13669
	ldr	r2, .L1481
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1482:
	.align	2
.L1481:
	.word	.LC121
	UNWIND(.fnend)
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
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
	ldr	r5, [r0, #172]
	mov	r8, r0
	ldr	r3, [r0, #152]
	cmp	r5, #0
	blt	.L1484
	add	r6, r5, #1
	mov	r0, r3
	mov	r1, r6
	bl	__aeabi_uidivmod
	ldr	r7, [r8, #2408]
	mov	r3, r1
	mov	r1, r1, asl #5
	mov	ip, r3, asl #7
	rsb	r2, r1, ip
	add	r2, r7, r2
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	.L1485
	mov	r4, #0
	b	.L1487
.L1488:
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r1, r1, asl #5
	mov	ip, r3, asl #7
	rsb	r2, r1, ip
	add	r2, r7, r2
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	.L1485
.L1487:
	add	r4, r4, #1
	mov	r1, r6
	cmp	r4, r5
	add	r0, r3, r4
	ble	.L1488
.L1484:
	mvn	r0, #0
	str	r3, [r8, #152]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1485:
	cmp	r3, r6
	mov	r0, r3
	str	r3, [r8, #152]
	bcs	.L1498
	rsb	r1, r1, ip
	mov	r3, #1
	add	r7, r7, r1
	str	r3, [r7, #32]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1498:
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
	beq	.L1509
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	str	r3, [r5, #32]
	str	r3, [r5, #36]
.L1503:
	ldr	r3, [r4, #40]
	mov	r0, r6
	cmp	r3, #0
	beq	.L1502
	ldr	r1, [r4, #64]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #44]
	ldr	r3, .L1510
	movw	r1, #13732
	ldr	r2, .L1510+4
	mov	r0, #8
	str	ip, [sp, #4]
	ldr	ip, [r4, #40]
	str	ip, [sp]
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r4, #40]
	str	r3, [r4, #56]
	str	r3, [r4, #44]
.L1502:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L1503
	ldr	r3, .L1510+8
	mov	r0, r5
	mov	r2, #96
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L1509:
	movw	r1, #13722
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L1510+12
	ldr	r2, .L1510+16
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1511:
	.align	2
.L1510:
	.word	.LANCHOR0+512
	.word	.LC122
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC58
	.word	.LC59
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, [r0, #2396]
	mov	r2, #-2147483647
	str	r2, [r0, #208]
	mov	r6, r0
	ldr	r3, [r3, #184]
	add	r3, r3, #1
	str	r3, [r0, #2592]
	cmp	r3, #17
	bhi	.L1545
.L1513:
	add	ip, r6, #2672
	add	r0, r6, #2736
	add	r1, r6, #2608
	mov	r4, #0
	add	ip, ip, #8
	add	r0, r0, #12
	add	r1, r1, #4
	add	lr, r6, #2816
	mov	r2, r4
	mov	r3, r4
	str	r4, [r6, #2596]
	str	r4, [r6, #2608]
	str	r4, [r6, #2612]
	str	r4, [r6, #2604]
	str	r4, [r6, #2600]
.L1514:
	add	r2, r2, #1
	str	r3, [lr, #4]!
	cmp	r2, #17
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [r1, #4]!
	bne	.L1514
	add	r4, r6, #14848
	ldr	r9, .L1546
	add	r4, r4, #8
	mov	r7, #0
.L1515:
	ldr	r3, [r9, #48]
	mov	r2, #536
	mov	r0, r4
	mov	r1, #0
	blx	r3
	str	r7, [r4, #88]
	add	r7, r7, #1
	mov	r5, #0
	cmp	r7, #20
	sub	r3, r4, #72
	strb	r5, [r4, #-72]
	mov	r2, #20
	str	r3, [r4, #-4]
	mov	r8, #16
	str	r5, [r4, #-28]
	add	r4, r4, #608
	strb	r5, [r4, #-679]
	str	r5, [r4, #-676]
	strb	r5, [r4, #-678]
	str	r5, [r4, #-628]
	str	r2, [r4, #-664]
	str	r8, [r4, #-660]
	ldr	r3, .L1546
	bne	.L1515
	add	r0, r6, #14528
	ldr	r3, [r3, #48]
	mov	r2, #200
	mov	r1, r5
	add	r0, r0, #56
	blx	r3
	add	r2, r6, #2416
	add	r3, r6, #2480
	add	r1, r6, #12288
	add	r2, r2, #4
	add	r3, r3, #8
	mov	r0, r5
	str	r8, [r1, #2296]
	str	r5, [r1, #2300]
.L1517:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L1517
	add	r2, r6, #2544
	add	lr, r6, #4096
	add	r2, r2, #12
	mov	ip, r1
	str	r1, [lr, #2492]
.L1518:
	str	ip, [r3, #4]!
	cmp	r3, r2
	mov	r0, #0
	bne	.L1518
	add	r3, r6, #2128
	add	r2, r6, #2208
	add	r3, r3, #8
	add	r2, r2, #8
	mov	r1, r0
	str	r0, [lr, #2496]
.L1519:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L1519
	ldr	r2, [r6, #172]
	cmp	r2, #0
	beq	.L1512
	mov	r4, #0
	mov	r5, r4
.L1525:
	ldr	r3, [r6, #2404]
	mov	r7, r4, asl #2
	ldr	r1, [r3, r4, asl #2]
	cmp	r1, #0
	beq	.L1521
	ldr	r3, [r6, #2384]
	cmp	r1, r3
	beq	.L1521
	ldr	r0, [r6, #248]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r6, #2404]
	str	r5, [r3, r7]
	ldr	r3, [r6, #200]
	ldr	r2, [r6, #232]
	cmp	r3, #0
	subne	r3, r3, #1
	cmp	r2, #0
	str	r3, [r6, #200]
	subne	r2, r2, #1
	ldr	r3, [r6, #180]
	str	r2, [r6, #232]
	ldr	r2, [r6, #172]
	cmp	r3, #2
	subhi	r3, r3, #1
	movls	r3, #2
	str	r3, [r6, #180]
.L1521:
	add	r4, r4, #1
	cmp	r2, r4
	bhi	.L1525
.L1512:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1545:
	mov	r4, #17
	ldr	r3, .L1546+4
	str	r4, [sp, #4]
	movw	r1, #9966
	str	r4, [sp]
	mov	r0, #1
	ldr	r2, .L1546+8
	bl	dprint_normal
	str	r4, [r6, #2592]
	b	.L1513
.L1547:
	.align	2
.L1546:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+528
	.word	.LC123
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
	beq	.L1558
	ldr	ip, [r6, #2596]
	add	r8, r6, #2608
	cmp	ip, #0
	addeq	r8, r8, #4
	beq	.L1550
	add	r8, r8, #4
	mov	r3, #0
	mov	lr, #1
	mov	r1, r8
.L1552:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	streqb	lr, [r2, #2]
	ldreq	ip, [r6, #2596]
	cmp	ip, r3
	bhi	.L1552
.L1550:
	mov	r4, r6
	mov	r7, #17
	mov	r5, #0
.L1557:
	ldr	r3, [r8, #4]!
	cmp	r3, #0
	beq	.L1553
	ldr	r1, [r3, #24]
	ldr	r0, [r6, #248]
	bl	FSP_ClearLogicFs
.L1553:
	ldr	r3, [r4, #2684]
	cmp	r3, #0
	beq	.L1554
	ldr	r1, [r3, #24]
	ldr	r0, [r6, #248]
	bl	FSP_ClearLogicFs
.L1554:
	ldr	r3, [r4, #2752]
	cmp	r3, #0
	beq	.L1555
	ldr	r1, [r3, #24]
	ldr	r0, [r6, #248]
	bl	FSP_ClearLogicFs
.L1555:
	ldr	r3, [r4, #2820]
	cmp	r3, #0
	beq	.L1556
	ldr	r1, [r3, #24]
	ldr	r0, [r6, #248]
	bl	FSP_ClearLogicFs
.L1556:
	subs	r7, r7, #1
	str	r5, [r4, #2820]
	str	r5, [r4, #2752]
	add	r4, r4, #4
	str	r5, [r4, #2680]
	str	r5, [r4, #2612]
	bne	.L1557
	mov	r0, r6
	bl	HEVC_InitDecBuffers
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1558:
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
	ldr	r0, [r0, #2384]
	cmp	r0, #0
	beq	.L1580
	ldr	r3, [r0, #44]
	cmp	r3, #4096
	ldmcsfd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, .L1581
	movw	r1, #13756
	mov	r0, #8
	mov	r5, #0
	bl	dprint_normal
	ldr	r3, [r4, #2384]
	ldr	ip, .L1581+4
	ldr	r2, [r3, #44]
	ldr	r0, [r3, #68]
	ldr	r1, [r3, #40]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #2384]
	mov	r0, #1
	ldr	r2, [r3, #92]
	ldr	r1, [r3, #64]
	str	r2, [r3, #64]
	ldr	r3, [r4, #2384]
	str	r5, [r3, #56]
	ldr	r3, [r4, #2384]
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #68]
	rsb	r2, ip, r2
	str	r2, [r3, #40]
	ldr	r3, [r4, #2384]
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #76]
	rsb	r2, ip, r2
	str	r2, [r3, #48]
	ldr	r3, [r4, #2384]
	ldr	r2, [r3, #44]
	ldr	ip, [r3, #72]
	add	r2, r2, ip
	str	r2, [r3, #44]
	ldr	r3, [r4, #2384]
	str	r0, [r3, #8]
	ldr	r0, [r4, #248]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #2384]
	str	r5, [r3, #68]
	ldr	r3, [r4, #2384]
	str	r5, [r3, #84]
	ldr	r3, [r4, #2384]
	str	r5, [r3, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1580:
	ldr	r2, .L1581+8
	movw	r1, #13750
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_normal
.L1582:
	.align	2
.L1581:
	.word	.LC125
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC124
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
	beq	.L1588
	ldr	ip, [r0, #2596]
	cmp	ip, #0
	beq	.L1588
	ldr	r3, [r0, #2616]
	cmp	r3, r1
	beq	.L1590
	add	r0, r0, #2608
	mov	r3, #0
	add	r0, r0, #8
	b	.L1585
.L1586:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1590
.L1585:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1586
.L1588:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1590:
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
	bls	.L1596
	movw	r0, #61166
	movt	r0, 65535
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1596:
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
	ldr	r1, .L1619
	mov	r4, r0
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	ldr	r0, [r4, #2364]
	mov	r1, #1
	bl	BsGet
	tst	r0, #255
	beq	.L1616
.L1602:
	mov	r1, #32
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r0, [r4, #2364]
	mov	r1, #32
	bl	BsGet
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1616:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	mov	r6, r0
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #8
	mov	r7, r0
	bhi	.L1617
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L1613
.L1601:
	.word	.L1602
	.word	.L1602
	.word	.L1603
	.word	.L1604
	.word	.L1605
.L1604:
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #256
	mov	r8, r0
	bhi	.L1609
	cmp	r0, #0
	beq	.L1613
	add	r6, r6, #7
	add	r7, r7, #7
	bic	r6, r6, #7
	bic	r7, r7, #7
	mov	r5, #0
.L1611:
	mov	r1, r6
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r5, #1
	mov	r1, r7
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r5, r8
	bne	.L1611
.L1613:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1603:
	mov	r3, #1
	movs	r7, r3, asl r7
	addne	r6, r6, #7
	movne	r5, #0
	bicne	r6, r6, #7
	beq	.L1613
.L1607:
	add	r5, r5, #1
	mov	r1, r6
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r7, r5
	bne	.L1607
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1605:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #255
	beq	.L1618
.L1612:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #32
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #32
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r0, [r4, #2364]
	mov	r1, #16
	bl	BsGet
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1618:
	mov	r1, #32
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L1612
.L1617:
	mov	r3, r0
	ldr	r2, .L1619+4
	movw	r1, #5497
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1609:
	ldr	r2, .L1619+8
	movw	r1, #5531
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1620:
	.align	2
.L1619:
	.word	.LC126
	.word	.LC127
	.word	.LC128
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
	ldr	r1, .L1631
	mov	r4, r0
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	ldr	r0, [r4, #2364]
	mov	r1, #1
	bl	BsGet
	tst	r0, #255
	bne	.L1622
	mov	r1, #7
	ldr	r0, [r4, #2364]
	bl	BsGet
	sub	r3, r0, #3
	mov	r6, r0
	cmp	r3, #2
	bhi	.L1629
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	mov	r5, r0
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	uxtb	r5, r5
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	clz	r5, r5
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	mov	r5, r5, lsr #5
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r6, #5
	moveq	r5, #0
	cmp	r5, #0
	bne	.L1630
.L1625:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
.L1622:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r0, [r4, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1630:
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L1625
.L1629:
	mov	r3, r0
	ldr	r2, .L1631+4
	movw	r1, #5687
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1632:
	.align	2
.L1631:
	.word	.LC129
	.word	.LC130
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
	bne	.L1637
	ldr	r1, .L1646
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1644
.L1635:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1645
.L1636:
	ldr	r0, [r4, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1644:
	ldr	r1, [r5, #4]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	b	.L1635
.L1645:
	ldr	r1, [r5, #8]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	b	.L1636
.L1637:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1647:
	.align	2
.L1646:
	.word	.LC131
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
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r0, [r5, #2364]
	ldr	r1, .L1655
	bl	HEVC_ue_v
	cmp	r0, #15
	bgt	.L1649
	cmp	r0, #0
	addge	r6, r0, #1
	movge	r4, #0
	blt	.L1653
.L1652:
	add	r4, r4, #1
	ldr	r1, .L1655+4
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r4, r6
	bne	.L1652
.L1653:
	ldr	r0, [r5, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1649:
	ldr	r2, .L1655+8
	movw	r1, #5777
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1656:
	.align	2
.L1655:
	.word	.LC132
	.word	.LC134
	.word	.LC133
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
	add	r4, r0, #12288
	mov	r5, r0
	mov	r9, r1
	mov	r6, #0
	ldr	r1, .L1686
	mov	r7, r2
	str	r6, [r4, #888]
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	cmp	r0, #15
	bhi	.L1682
	mov	r1, #1
	strb	r1, [r4, #881]
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r8, r6
	beq	.L1683
.L1660:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r4, #1
	strb	r0, [r9]
	ldr	r1, [r7, #16]
	ldr	r0, [r5, #2364]
	add	r1, r1, r4
	bl	BsGet
	subs	r3, r4, #1
	beq	.L1684
.L1662:
	cmp	r3, #1
	beq	.L1685
.L1666:
	cmp	r4, #1
	bhi	.L1665
.L1664:
	add	r4, r4, #1
	subs	r3, r4, #1
	bne	.L1662
.L1684:
	ldrb	r2, [r7]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1666
	ldr	r2, [r7, #24]
	cmn	r2, #1
	beq	.L1664
.L1673:
	mov	r6, #0
	b	.L1669
.L1668:
	ldr	r3, [r7, #24]
	add	r3, r3, #1
	cmp	r3, r6
	bls	.L1666
.L1669:
	ldr	r1, [r7, #12]
	add	r6, r6, #1
	ldr	r0, [r5, #2364]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #2364]
	add	r1, r1, #1
	bl	BsGet
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r8, r3
	beq	.L1668
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #2364]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #2364]
	add	r1, r1, #1
	bl	BsGet
	b	.L1668
.L1685:
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1665
	ldr	r3, [r7, #24]
	cmn	r3, #1
	bne	.L1673
.L1665:
	ldr	r0, [r5, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1683:
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r8, r0
	cmp	r8, #0
	beq	.L1660
	ldr	r1, [r7, #16]
	ldr	r0, [r5, #2364]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r7, #20]
	ldr	r0, [r5, #2364]
	add	r1, r1, #1
	bl	BsGet
	b	.L1660
.L1682:
	mov	r3, r0
	ldr	r2, .L1686+4
	movw	r1, #5805
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1687:
	.align	2
.L1686:
	.word	.LC135
	.word	.LC136
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
	add	r3, r0, #12288
	mov	r5, r2
	mov	r6, r1
	mov	r4, r0
	ldr	r1, [r3, #884]
	ldr	r2, [r3, #888]
	add	r1, r1, #1
	str	r1, [r3, #884]
	add	r2, r2, #1
	str	r2, [r3, #888]
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1716
.L1689:
	ldrh	r3, [r5, #44]
	cmp	r3, #0
	beq	.L1691
	ldr	r1, [r5, #60]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r6, #8]
	ldr	r1, [r5, #64]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #12]
	ldrb	r3, [r5, #46]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1692
.L1695:
	ldr	r2, [r4, #248]
	ldr	r3, .L1719
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1717
.L1691:
	ldr	r0, [r4, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1716:
	mov	r1, #4
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #2
	str	r0, [r6]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #4]
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L1689
.L1717:
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L1691
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L1691
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L1691
.L1692:
	ldr	r1, [r5, #52]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	ldrb	r3, [r5, #46]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1695
	ldrb	r3, [r5, #47]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1695
	ldr	r1, .L1719+4
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	mov	r1, #1
	mov	r8, r0
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r9, r0
	cmp	r9, #0
	bne	.L1718
.L1696:
	cmp	r8, #255
	bhi	.L1700
	add	r8, r8, #1
	mov	r7, #0
	b	.L1699
.L1698:
	cmp	r7, r8
	beq	.L1695
.L1699:
	ldr	r1, .L1719+8
	add	r7, r7, #1
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r9, #0
	bne	.L1698
	ldr	r1, [r5, #48]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	b	.L1698
.L1718:
	ldr	r1, [r5, #48]
	ldr	r0, [r4, #2364]
	add	r1, r1, #1
	bl	BsGet
	b	.L1696
.L1700:
	ldr	r2, .L1719+12
	movw	r1, #5894
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1720:
	.align	2
.L1719:
	.word	s_pstVfmwChan
	.word	.LC137
	.word	.LC139
	.word	.LC138
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
	beq	.L1734
	ldr	r1, .L1741
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L1723
.L1732:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1723:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	beq	.L1739
.L1724:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #2]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #3]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #4]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #5]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #6]
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #10
	bhi	.L1725
	cmp	r0, #0
	addne	r7, r5, #7
	movne	r6, #0
	beq	.L1730
.L1729:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r7, #10]
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L1729
.L1730:
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #28]
	cmp	r0, #6
	bhi	.L1740
	cmp	r0, #0
	addne	r7, r5, #28
	movne	r6, #0
	beq	.L1732
.L1733:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r7, #6]
	ldrb	r3, [r5, #28]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L1733
	b	.L1732
.L1734:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1739:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #1]
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L1724
.L1725:
	mov	r3, r0
	ldr	r2, .L1741+4
	movw	r1, #5976
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1740:
	mov	r3, r0
	ldr	r2, .L1741+8
	movw	r1, #5990
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1742:
	.align	2
.L1741:
	.word	.LC140
	.word	.LC141
	.word	.LC142
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
	beq	.L1752
	cmp	r2, #3
	bls	.L1757
	mov	r1, #8
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	beq	.L1758
	cmp	r0, #2
	beq	.L1759
	cmp	r0, #4
	beq	.L1760
	subs	r6, r6, #4
	beq	.L1750
.L1751:
	add	r4, r4, #1
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r6, r4
	bne	.L1751
.L1750:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1758:
	mov	r1, #8
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	bne	.L1750
	add	r1, r5, #3472
	mov	r0, r5
	add	r1, r1, #8
	bl	HEVC_Sei_HDR10PLUS
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1760:
	add	r1, r5, #2944
	mov	r0, r5
	add	r1, r1, #3
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1759:
	add	r1, r5, #2944
	mov	r0, r5
	bl	HEVC_Sei_TSI
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1752:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1757:
	ldr	r2, .L1761
	movw	r1, #6133
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1762:
	.align	2
.L1761:
	.word	.LC143
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	subs	r5, r3, #0
	mov	r6, r0
	mov	r10, r1
	mov	r4, r2
	bne	.L1811
.L1764:
	ldr	r1, .L1822
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4]
	bhi	.L1812
	ldr	r1, .L1822+4
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4, #4]
	bhi	.L1813
	ldr	r5, [r4]
	add	r3, r0, r5
	str	r3, [r4, #8]
	cmp	r3, #16
	bhi	.L1787
	cmp	r5, #0
	addne	r10, r4, #28
	addne	r9, r4, #11
	movne	r7, #0
	movne	r8, r7
	bne	.L1791
	b	.L1789
.L1790:
	str	r8, [r10, #4]!
	ldr	r0, [r6, #2364]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r5, [r4]
	cmp	r5, r7
	bls	.L1814
.L1791:
	ldr	r1, .L1822+8
	add	r7, r7, #1
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	mov	r1, #1
	cmp	r0, #32768
	mvn	r3, r0
	add	r8, r8, r3
	bcc	.L1790
	mov	r3, r0
	ldr	r2, .L1822+12
	movw	r1, #13074
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1811:
	mov	r1, #1
	ldr	r0, [r0, #2364]
	bl	BsGet
	cmp	r0, #0
	beq	.L1764
	ldr	r7, [r10, #176]
	cmp	r7, r5
	movne	r0, #0
	beq	.L1815
.L1765:
	sub	r5, r5, #1
	rsb	r9, r0, r5
	cmp	r9, r5
	bhi	.L1816
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	ldr	r1, .L1822+16
	mov	r5, r0
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	mov	r2, #164
	mul	r9, r2, r9
	mov	r2, r5, asl #1
	rsb	r2, r2, #1
	add	r3, r10, r9
	ldr	r3, [r3, #2156]
	cmp	r3, #16
	mla	r2, r0, r2, r2
	str	r2, [fp, #-56]
	bhi	.L1817
	add	r7, r9, #2176
	mov	r5, #0
	add	r7, r7, #4
	str	r5, [fp, #-48]
	add	r7, r10, r7
	str	r5, [fp, #-52]
	mov	r8, r5
	b	.L1774
.L1769:
	sub	r3, r0, #1
	cmp	r3, #1
	bls	.L1818
.L1770:
	add	r3, r10, r9
	add	r5, r5, #1
	add	r7, r7, #4
	ldr	r3, [r3, #2156]
	cmp	r3, r5
	bcc	.L1819
.L1774:
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	cmp	r0, #0
	bne	.L1769
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r0, r0, asl #1
	sub	r3, r0, #1
	cmp	r3, #1
	bhi	.L1770
.L1818:
	add	r3, r10, r9
	ldr	r2, [fp, #-56]
	add	r1, r4, r8
	add	ip, r8, #8
	ldr	r3, [r3, #2156]
	sub	r0, r0, #1
	clz	r0, r0
	add	r8, r8, #1
	cmp	r3, r5
	mov	r0, r0, lsr #5
	ldrhi	r3, [r7]
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
	b	.L1770
.L1819:
	ldr	r3, [fp, #-52]
	cmp	r8, #16
	ldr	r2, [fp, #-48]
	str	r8, [r4, #8]
	str	r3, [r4]
	str	r2, [r4, #4]
	bhi	.L1775
	cmp	r3, #16
	bhi	.L1775
	cmp	r2, #16
	bhi	.L1775
	cmp	r8, #1
	subhi	r8, r8, #1
	addhi	r9, r4, #32
	addhi	r7, r4, #12
	movhi	r6, #0
	bls	.L1781
.L1780:
	ldr	ip, [r9, #4]!
	cmp	r6, #0
	ldrb	lr, [r7, #1]!	@ zero_extendqisi2
	mov	r2, r6
	movge	r1, r9
	movge	r3, r7
	blt	.L1783
.L1779:
	ldr	r0, [r1, #-4]!
	sub	r3, r3, #1
	cmp	ip, r0
	strlt	r0, [r1, #4]
	ldrltb	r0, [r3]	@ zero_extendqisi2
	strltb	r0, [r3, #1]
	strlt	ip, [r1]
	strltb	lr, [r3]
	subs	r2, r2, #1
	bpl	.L1779
.L1783:
	add	r6, r6, #1
	cmp	r6, r8
	bne	.L1780
.L1781:
	ldr	r3, [fp, #-52]
	sub	r0, r3, #1
	movs	r8, r3, lsr #1
	movne	r3, #1
	moveq	r3, #0
	cmp	r0, #0
	movlt	r3, #0
	andge	r3, r3, #1
	cmp	r3, #0
	beq	.L1778
	ldr	r3, [fp, #-52]
	add	ip, r4, #28
	mov	r2, #0
	add	r1, r3, #7
	add	r3, r3, #11
	add	r3, r4, r3
	mov	lr, ip
	add	r1, r4, r1, lsl #2
	add	r4, r4, #12
.L1784:
	sub	r0, r0, #1
	ldr	r9, [r1]
	add	r2, r2, #1
	ldr	r6, [lr, #4]!
	cmp	r2, r8
	mvn	r7, r0
	mov	r7, r7, lsr #31
	ldrb	r5, [r4]	@ zero_extendqisi2
	movcs	r7, #0
	str	r9, [ip, #4]!
	cmp	r7, #0
	ldrb	r7, [r3]	@ zero_extendqisi2
	strb	r7, [r4], #1
	str	r6, [r1], #-4
	strb	r5, [r3], #-1
	bne	.L1784
.L1778:
	mov	r0, #0
.L1766:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1814:
	ldr	r3, [r4, #8]
.L1789:
	cmp	r3, r5
	bls	.L1778
	add	r9, r5, #7
	add	r10, r5, #11
	add	r10, r4, r10
	mov	r8, #0
	add	r9, r4, r9, lsl #2
	b	.L1795
.L1792:
	cmp	r3, r2
	bhi	.L1820
	adds	r2, r3, r8
	bmi	.L1821
	str	r2, [r9, #4]!
	mov	r8, r2
	ldr	r0, [r6, #2364]
	bl	BsGet
	strb	r0, [r10, #1]!
	ldr	r3, [r4, #8]
	cmp	r3, r5
	bls	.L1778
.L1795:
	ldr	r1, .L1822+20
	add	r5, r5, #1
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	mov	r1, #1
	mvn	r2, r8
	cmn	r0, #1
	add	r3, r0, r1
	bne	.L1792
	mov	r7, r0
	movw	r1, #13094
	ldr	r3, .L1822+24
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L1822+28
	bl	dprint_normal
	mov	r0, r7
	b	.L1766
.L1815:
	ldr	r1, .L1822+32
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	add	r3, r0, #1
	cmp	r7, r3
	bcs	.L1765
	str	r7, [sp]
	movw	r1, #12944
	ldr	r2, .L1822+36
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1775:
	ldr	r2, .L1822+40
	movw	r1, #13004
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1813:
	ldr	r3, [r4]
	mov	r1, #13056
	ldr	r2, .L1822+44
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1821:
	movw	r2, #13109
	str	r3, [sp, #8]
	mov	r1, r2
	str	r2, [sp]
	str	r8, [sp, #4]
	mov	r0, #1
	ldr	r3, .L1822+24
	ldr	r2, .L1822+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1820:
	movw	r2, #13102
	str	r3, [sp, #8]
	mov	r1, r2
	str	r2, [sp]
	str	r8, [sp, #4]
	mov	r0, #1
	ldr	r3, .L1822+24
	ldr	r2, .L1822+52
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1816:
	str	r5, [sp]
	mov	r3, r9
	ldr	r2, .L1822+56
	movw	r1, #12952
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1812:
	mov	r3, r0
	ldr	r2, .L1822+60
	movw	r1, #13048
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1817:
	ldr	r2, .L1822+64
	movw	r1, #12964
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1787:
	mov	r0, #16
	ldr	r2, .L1822+68
	str	r0, [sp]
	movw	r1, #13064
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1766
.L1823:
	.align	2
.L1822:
	.word	.LC150
	.word	.LC152
	.word	.LC155
	.word	.LC156
	.word	.LC147
	.word	.LC157
	.word	.LANCHOR0+548
	.word	.LC158
	.word	.LC144
	.word	.LC145
	.word	.LC149
	.word	.LC153
	.word	.LC160
	.word	.LC159
	.word	.LC146
	.word	.LC151
	.word	.LC148
	.word	.LC154
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
	beq	.L1846
	cmp	r2, #0
	bne	.L1873
.L1829:
	add	r5, r9, #24
	mov	r7, #0
.L1841:
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	uxtb	r4, r0
	cmp	r4, #0
	movne	r3, #0
	strne	r3, [r5]
	beq	.L1874
.L1844:
	ldr	r1, .L1879
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
.L1832:
	ldr	r1, .L1879+4
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	mov	r3, r0
	str	r0, [r5]
.L1833:
	cmp	r3, #31
	bhi	.L1875
.L1834:
	mov	r4, #0
.L1845:
	cmp	r4, #0
	beq	.L1876
	cmp	r4, #1
	beq	.L1871
.L1840:
	add	r4, r4, #1
	cmp	r4, #2
	bne	.L1845
.L1839:
	add	r7, r7, #1
	add	r5, r5, #4
	cmp	r8, r7
	bcs	.L1841
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1875:
	ldr	r2, .L1879+8
	movw	r1, #13616
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r5]
	b	.L1834
.L1874:
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	str	r4, [r5]
	tst	r0, #255
	bne	.L1844
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L1832
	ldr	r3, [r5]
	b	.L1833
.L1873:
	mov	r1, #1
	ldr	r0, [r0, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r9]
	ldr	r0, [r6, #2364]
	bl	BsGet
	strb	r0, [r9, #1]
	ldrh	r3, [r9]
	cmp	r3, #0
	beq	.L1829
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r9, #2]
	cmp	r0, #0
	bne	.L1877
.L1827:
	mov	r1, #4
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #4
	ldr	r0, [r6, #2364]
	bl	BsGet
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1878
.L1828:
	mov	r1, #5
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #12]
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #16]
	ldr	r0, [r6, #2364]
	bl	BsGet
	str	r0, [r9, #20]
	b	.L1829
.L1846:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1878:
	mov	r1, #4
	ldr	r0, [r6, #2364]
	bl	BsGet
	b	.L1828
.L1877:
	mov	r1, #8
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #5
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #1
	str	r0, [r9, #4]
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r9, #3]
	ldr	r0, [r6, #2364]
	bl	BsGet
	str	r0, [r9, #8]
	b	.L1827
.L1876:
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1848
	mov	r4, #1
.L1871:
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1839
.L1848:
	mov	r10, #0
	b	.L1843
.L1842:
	mov	r1, #1
	ldr	r0, [r6, #2364]
	bl	BsGet
	ldr	r3, [r5]
	cmp	r3, r10
	bcc	.L1840
.L1843:
	ldr	r1, .L1879+12
	add	r10, r10, #1
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L1879+16
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1842
	ldr	r1, .L1879+20
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L1879+24
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
	b	.L1842
.L1880:
	.align	2
.L1879:
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC165
	.word	.LC166
	.word	.LC167
	UNWIND(.fnend)
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
	.align	2
	.global	HEVC_ProcessVPS
	.type	HEVC_ProcessVPS, %function
HEVC_ProcessVPS:
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
	mov	r6, r1
	ldr	r0, [r0, #2364]
	mov	r1, #1
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r3, r0
	cmp	r3, #1
	beq	.L1882
	ldr	r2, .L1933
	movw	r1, #3601
	mov	r0, #1
	bl	dprint_normal
.L1882:
	mov	r1, #6
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r0, #63
	str	r0, [r6, #8]
	bhi	.L1926
	mov	r1, #3
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r0, #6
	mov	r7, r0
	bhi	.L1927
	str	r0, [r6, #12]
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #1]
	ldr	r0, [r5, #2364]
	bl	BsGet
	movw	r3, #65535
	cmp	r0, r3
	bne	.L1928
	mov	r3, r7
	mov	r2, #1
	add	r1, r6, #112
	mov	r0, r5
	bl	HEVC_DecPTL
	subs	r4, r0, #0
	bne	.L1929
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r7, #0
	addge	r8, r6, #24
	addge	r9, r7, #1
	uxtb	r10, r0
	bge	.L1894
	b	.L1892
.L1891:
	add	r4, r4, #1
	cmp	r4, r9
	beq	.L1892
.L1894:
	ldr	r1, .L1933+4
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L1933+8
	add	r0, r0, #1
	str	r0, [r8, #4]!
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L1933+12
	str	r0, [r8, #28]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r10, #0
	str	r0, [r8, #56]
	bne	.L1891
	add	r2, r4, #1
	cmp	r7, r2
	blt	.L1892
	add	r3, r4, #7
	add	r3, r6, r3, lsl #2
.L1893:
	ldr	r1, [r6, #28]
	add	r2, r2, #1
	cmp	r9, r2
	str	r1, [r3, #4]!
	ldr	r1, [r6, #56]
	str	r1, [r3, #28]
	ldr	r1, [r6, #84]
	str	r1, [r3, #56]
	bne	.L1893
.L1892:
	mov	r1, #6
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r1, .L1933+16
	str	r0, [r6, #16]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r6, #20]
	bcs	.L1930
	cmp	r0, #0
	movgt	r8, #1
	ble	.L1896
.L1898:
	mov	r4, #0
.L1897:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r3, [r6, #16]
	add	r4, r4, #1
	cmp	r4, r3
	bls	.L1897
	ldr	r3, [r6, #20]
	add	r8, r8, #1
	cmp	r3, r8
	bge	.L1898
.L1896:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L1905
	mov	r1, #32
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #32
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1931
.L1902:
	ldr	r1, .L1933+20
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r6, #24]
	bhi	.L1903
	cmp	r0, #0
	ble	.L1905
	ldr	r1, .L1933+24
	mov	r4, #0
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	mov	r0, #1
.L1910:
	uxtb	r2, r0
	sub	r1, fp, #96
	mov	r3, r7
	mov	r0, r5
	bl	HEVC_DecHrdParam
	add	r4, r4, #1
	ldr	r1, .L1933+24
	cmp	r0, #0
	bne	.L1932
	ldr	r3, [r6, #24]
	cmp	r3, r4
	ble	.L1905
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r4, #0
	mov	r0, #1
	beq	.L1910
	mov	r1, r0
	ldr	r0, [r5, #2364]
	bl	BsGet
	b	.L1910
.L1905:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1922
.L1901:
	mov	r0, #0
.L1923:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1909:
	ldr	r0, [r5, #2364]
	bl	BsGet
.L1922:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L1909
	b	.L1901
.L1932:
	ldr	r2, .L1933+28
	movw	r1, #3733
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1931:
	ldr	r1, .L1933+32
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	b	.L1902
.L1928:
	ldr	r2, .L1933+36
	movw	r1, #3628
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1923
.L1926:
	mov	r3, r0
	ldr	r2, .L1933+40
	movw	r1, #3608
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1923
.L1929:
	ldr	r2, .L1933+44
	movw	r1, #3636
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1923
.L1927:
	mov	r3, r0
	ldr	r2, .L1933+48
	mov	r0, #6
	mov	r1, #3616
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1923
.L1930:
	mov	r3, r0
	ldr	r2, .L1933+52
	mov	r0, #1024
	movw	r1, #3677
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1923
.L1903:
	mov	r3, r0
	ldr	r2, .L1933+56
	mov	r0, #1024
	mov	r1, #3712
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L1923
.L1934:
	.align	2
.L1933:
	.word	.LC168
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC173
	.word	.LC179
	.word	.LC181
	.word	.LC182
	.word	.LC178
	.word	.LC171
	.word	.LC169
	.word	.LC172
	.word	.LC170
	.word	.LC177
	.word	.LC180
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r1, #4
	mov	r5, r0
	ldr	r0, [r0, #2364]
	bl	BsGet
	cmp	r0, #15
	mov	r6, r0
	bhi	.L1941
	ldr	r3, [r5, #2368]
	mov	r4, r0, asl #7
	sub	r4, r4, r0, asl #3
	add	r2, r3, r4
	ldrb	r7, [r3, r4]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L1942
	str	r0, [r2, #4]
	mov	r0, r5
	ldr	r1, [r5, #2368]
	add	r1, r1, r4
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L1943
	ldr	r3, [r5, #2368]
	mov	r2, #1
	add	r3, r3, r4
	strb	r2, [r3, #2]
	ldr	r3, [r5, #2368]
	strb	r2, [r3, r4]
.L1937:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1942:
	ldr	r9, .L1945
	mov	r2, #120
	ldr	r7, .L1945+4
	mov	r1, #0
	ldr	r3, [r9, #48]
	add	r0, r7, #320
	blx	r3
	add	r1, r7, #320
	mov	r0, r5
	str	r6, [r7, #324]
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L1944
	ldr	r0, [r5, #2368]
	mov	r1, r7
	mov	r3, #1
	ldr	r5, [r9, #56]
	add	r0, r0, r4
	strb	r3, [r1, #320]!
	strb	r3, [r7, #322]
	mov	r2, #120
	blx	r5
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1944:
	mov	r3, r6
	ldr	r2, .L1945+8
	movw	r1, #3794
	mov	r0, #1
	bl	dprint_normal
	mvn	r8, #0
	b	.L1937
.L1941:
	ldr	r2, .L1945+12
	movw	r1, #3780
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L1937
.L1943:
	mov	r3, r6
	ldr	r2, .L1945+16
	movw	r1, #3809
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r5, #2368]
	mov	r2, #1
	mvn	r8, #0
	add	r3, r3, r4
	strb	r2, [r3, #2]
	ldr	r3, [r5, #2368]
	strb	r7, [r3, r4]
	b	.L1937
.L1946:
	.align	2
.L1945:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR4
	.word	.LC184
	.word	.LC183
	.word	.LC185
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
	ldr	r0, [r0, #2364]
	mov	r1, #1
	mov	r6, r2
	bl	BsGet
	tst	r0, #255
	bne	.L1992
.L1949:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1993
.L1952:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1994
.L1954:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1995
.L1956:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #3]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2]
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L1957
	ldr	r1, .L2002
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r6, #60]
	cmp	r3, #3
	bhi	.L1996
	ldr	r1, .L2002+4
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2002+8
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2002+12
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
.L1957:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L1960
	mov	r1, #32
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #32
	str	r0, [r5, #36]
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r2, [r5, #36]
	cmp	r2, #0
	str	r0, [r5, #40]
	bne	.L1997
.L1961:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1998
.L1962:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	bne	.L1999
.L1960:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r1, .L2002+16
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #4096
	bcs	.L2000
.L1963:
	ldr	r1, .L2002+20
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2002+24
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2002+28
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r0, [r4, #2364]
	ldr	r1, .L2002+32
	bl	HEVC_ue_v
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1992:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r5, #8]
	bhi	.L2001
	bne	.L1949
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	str	r0, [r5, #12]
	ldr	r0, [r4, #2364]
	bl	BsGet
	str	r0, [r5, #16]
	b	.L1949
.L1995:
	ldr	r1, .L2002+36
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2002+40
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	b	.L1956
.L1994:
	mov	r1, #3
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #20]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5]
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	beq	.L1954
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #24]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #28]
	ldr	r0, [r4, #2364]
	bl	BsGet
	str	r0, [r5, #32]
	b	.L1954
.L1993:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L1952
.L1999:
	ldr	r3, [r6, #52]
	add	r1, r5, #44
	mov	r2, #1
	mov	r0, r4
	bl	HEVC_DecHrdParam
	cmp	r0, #0
	beq	.L1960
	ldr	r2, .L2002+44
	movw	r1, #13511
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1998:
	ldr	r1, .L2002+48
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	b	.L1962
.L1997:
	ldr	r3, .L2002+52
	movw	r1, #10000
	umull	r0, r1, r0, r1
	ldr	r3, [r3, #248]
	blx	r3
	movw	r3, #52429
	movt	r3, 52428
	add	r0, r0, #5
	umull	r0, r1, r0, r3
	mov	r3, r1, lsr #3
	str	r3, [r4, #148]
	b	.L1961
.L2000:
	ldr	r2, .L2002+56
	movw	r1, #13529
	mov	r0, #1
	bl	dprint_normal
	b	.L1963
.L2001:
	ldr	r2, .L2002+60
	movw	r1, #13414
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r5, #8]
	b	.L1949
.L1996:
	ldr	r2, .L2002+64
	movw	r1, #13469
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2003:
	.align	2
.L2002:
	.word	.LC189
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC196
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC187
	.word	.LC188
	.word	.LC195
	.word	.LC194
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC197
	.word	.LC186
	.word	.LC190
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
	bls	.L2009
	mvn	r0, #-2147483648
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2009:
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
	ldr	r1, .L2022
	mov	r6, r0
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	ldr	r0, [r6, #2364]
	ldr	r1, .L2022+4
	bl	HEVC_ue_v
	cmp	r0, #1024
	mov	r7, r0
	bhi	.L2011
	cmp	r0, #0
	movne	r4, #0
	beq	.L2017
.L2016:
	mov	r1, #6
	ldr	r0, [r6, #2364]
	bl	BsGet
	mov	r1, #3
	mov	r5, r0
	ldr	r0, [r6, #2364]
	sub	r5, r5, #19
	bl	BsGet
	cmp	r5, #1
	ldr	r1, .L2022+8
	bls	.L2014
	ldr	r0, [r6, #2364]
	bl	HEVC_ue_v
.L2014:
	cmp	r4, #0
	ldr	r1, .L2022+12
	add	r4, r4, #1
	beq	.L2015
	ldr	r0, [r6, #2364]
	bl	HEVC_se_v
.L2015:
	cmp	r4, r7
	bne	.L2016
.L2017:
	ldr	r0, [r6, #2364]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2011:
	ldr	r2, .L2022+16
	movw	r1, #5449
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2023:
	.align	2
.L2022:
	.word	.LC202
	.word	.LC203
	.word	.LC205
	.word	.LC206
	.word	.LC204
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
	beq	.L2026
	ldr	r1, .L2027
	ldr	r0, [r0, #2364]
	bl	HEVC_se_v
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r0, [r4, #2364]
	bl	BsToNextByte
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2026:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2028:
	.align	2
.L2027:
	.word	.LC207
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
	beq	.L2046
	ldr	r1, .L2059
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L2031
.L2044:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r8]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2031:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r1, r0
	cmp	r1, #1
	beq	.L2056
.L2032:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2364]
	mov	r7, #3
	bl	BsGet
.L2034:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	beq	.L2037
	add	r6, r0, #1
	mov	r5, #0
.L2036:
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r5, #1
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r5, r6
	bne	.L2036
.L2037:
	subs	r7, r7, #1
	bne	.L2034
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #1
	beq	.L2057
.L2038:
	add	r10, r8, #42
	add	r7, r8, #39
	mov	r9, r10
.L2043:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #32
	bhi	.L2058
	cmp	r0, #0
	beq	.L2045
	mov	r6, r9
	mov	r5, #0
.L2042:
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #16
	add	r5, r5, #1
	strh	r0, [r6, #2]!	@ movhi
	ldr	r0, [r4, #2364]
	bl	BsGet
	strh	r0, [r6, #198]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L2042
.L2045:
	cmp	r10, r7
	add	r9, r9, #66
	bne	.L2043
	b	.L2044
.L2046:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2057:
	mov	r1, #4
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r7, r8, #36
	mov	r5, r8
.L2039:
	add	r6, r5, #12
.L2040:
	ldr	r1, .L2059+4
	ldr	r0, [r4, #2364]
	bl	HEVC_se_v
	str	r0, [r5, #4]!
	cmp	r6, r5
	bne	.L2040
	cmp	r5, r7
	bne	.L2039
	b	.L2038
.L2056:
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #1]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L2032
.L2058:
	mov	r3, r0
	ldr	r2, .L2059+8
	movw	r1, #6251
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2060:
	.align	2
.L2059:
	.word	.LC208
	.word	.LC209
	.word	.LC210
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
	bne	.L2087
	ldr	lr, [r0, #2384]
	ldr	lr, [lr, #16]
	cmp	lr, #39
	beq	.L2105
	cmp	r3, #5
	beq	.L2091
	cmp	r3, #132
	beq	.L2092
	cmp	r6, #0
	beq	.L2086
.L2094:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r5, r6
	bne	.L2094
	b	.L2086
.L2091:
	add	r1, r1, #540
	mov	r2, r6
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	bne	.L2087
.L2086:
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_More_Data_In_Payload
	cmp	r0, #0
	bne	.L2095
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2095:
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_Payload_Extension_Present
	cmp	r0, #0
	bne	.L2106
.L2096:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L2097
.L2098:
	ldr	r0, [r4, #2364]
	bl	BsGet
.L2097:
	ldr	r0, [r4, #2364]
	bl	BsIsByteAligned
	mov	r1, #1
	cmp	r0, #0
	beq	.L2098
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2105:
	cmp	r3, #147
	ldrls	pc, [pc, r3, asl #2]
	b	.L2065
.L2067:
	.word	.L2066
	.word	.L2068
	.word	.L2065
	.word	.L2065
	.word	.L2069
	.word	.L2070
	.word	.L2071
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2072
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2073
	.word	.L2065
	.word	.L2074
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2075
	.word	.L2076
	.word	.L2077
	.word	.L2078
	.word	.L2065
	.word	.L2079
	.word	.L2080
	.word	.L2065
	.word	.L2065
	.word	.L2081
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2065
	.word	.L2082
	.word	.L2065
	.word	.L2083
	.word	.L2065
	.word	.L2065
	.word	.L2084
.L2092:
	add	r1, r1, #588
	add	r1, r1, #3
	bl	HEVC_Sei_Decoded_Picture_Hash
	cmp	r0, #0
	beq	.L2086
.L2087:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2106:
	ldr	r1, .L2107
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	b	.L2096
.L2084:
	add	r1, r1, #588
	add	r1, r1, #2
	bl	HEVC_Sei_HLGHDR_Comapitibility_Info
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2066:
	add	r2, r2, #2096
	bl	HEVC_Sei_Buf_Period
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2068:
	add	r2, r2, #2048
	add	r1, r1, #8
	add	r2, r2, #4
	bl	HEVC_Sei_Pic_Timming
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2069:
	add	r1, r1, #56
	mov	r2, r6
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2070:
	add	r1, r1, #540
	mov	r2, r6
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2071:
	add	r1, r1, #540
	bl	HEVC_Sei_Recovery_Point
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2072:
	add	r1, r1, #588
	add	r1, r1, #3
	bl	HEVC_Sei_Tone_Mapping_Info
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2073:
	add	r1, r1, #540
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2074:
	add	r1, r1, #540
	bl	HEVC_Sei_Display_Orientation
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2075:
	add	r1, r1, #588
	mov	r2, r6
	add	r1, r1, #3
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2076:
	add	r1, r1, #540
	bl	HEVC_Sei_Active_Param_sets
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2077:
	add	r2, r2, #2096
	add	r1, r1, #540
	bl	HEVC_Sei_Dec_Unit_Info
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2078:
	add	r1, r1, #540
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2079:
	mov	r3, r6
	bl	HEVC_Sei_Scalable_Nesting
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2080:
	cmn	r1, #540
	movne	r1, #0
	moveq	r1, #1
	orrs	r3, ip, r1
	bne	.L2087
	mov	r1, #1
	ldr	r0, [r0, #2364]
	bl	BsGet
	b	.L2086
.L2081:
	add	r1, r1, #540
	bl	HEVC_Sei_Mastering_Display_Colour_Volume
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2082:
	add	r1, r1, #100
	bl	HEVC_Sei_Color_Remapping_Info
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2083:
	add	r1, r1, #584
	bl	HEVC_Sei_Content_Light_Level_Information
	cmp	r0, #0
	beq	.L2086
	b	.L2087
.L2065:
	cmp	r6, #0
	movne	r5, #0
	beq	.L2086
.L2089:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r5, r6
	bne	.L2089
	b	.L2086
.L2108:
	.align	2
.L2107:
	.word	.LC211
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
	ldr	r0, [r0, #2364]
	b	.L2110
.L2112:
	bl	BsSkip
	ldr	r0, [r4, #2364]
	add	r5, r5, #255
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #16]
	add	r3, r2, #8
	cmp	r3, r1
	bhi	.L2119
.L2110:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2364]
	beq	.L2112
	bl	BsGet
	mov	r8, #0
	mov	r9, r0
	ldr	r0, [r4, #2364]
	b	.L2113
.L2114:
	bl	BsSkip
	ldr	r0, [r4, #2364]
	add	r8, r8, #255
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #16]
	add	r3, r2, #8
	cmp	r3, r1
	bhi	.L2120
.L2113:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2364]
	beq	.L2114
	bl	BsGet
	add	r3, r9, r5
	mov	r2, r7
	mov	r1, r6
	add	r8, r0, r8
	mov	r0, r4
	str	r8, [sp]
	bl	HEVC_Sei_Payload
	cmp	r0, #0
	bne	.L2121
.L2111:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2119:
	movw	r3, #4965
.L2118:
	str	r1, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	mov	r1, r3
	ldr	r2, .L2122
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2120:
	movw	r3, #4981
	b	.L2118
.L2121:
	ldr	r2, .L2122+4
	mov	r1, #4992
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2111
.L2123:
	.align	2
.L2122:
	.word	.LC212
	.word	.LC213
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
	beq	.L2130
	ldr	r6, [r0, #2380]
	add	r5, r0, #2880
	add	r5, r5, #8
	cmp	r6, #0
	bne	.L2133
	b	.L2136
.L2128:
	ldr	r0, [r4, #2364]
	bl	BsIsByteAligned
	cmp	r0, #0
	mov	r0, r4
	beq	.L2137
	bl	HEVC_More_Rbsp_Data
	cmp	r0, #0
	beq	.L2138
.L2133:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	beq	.L2128
	ldr	r2, .L2140
	movw	r1, #4925
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2138:
	ldr	r0, [r4, #2364]
	mov	r1, #8
	bl	BsGet
	cmp	r0, #128
	bne	.L2139
.L2130:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2137:
	ldr	r2, .L2140+4
	movw	r1, #4931
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2139:
	mov	r3, r0
	ldr	r2, .L2140+8
	movw	r1, #4941
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2136:
	ldr	r2, .L2140+12
	movw	r1, #4915
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2141:
	.align	2
.L2140:
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC214
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
	ldr	r0, [r0, #2364]
	mov	r1, #1
	mov	r7, r2
	bl	BsGet
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	tst	r0, #255
	ldr	r0, [r4, #2364]
	beq	.L2143
	bl	BsGet
	ldr	r1, .L2159
	mov	r5, r0
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #63
	mov	r8, r0
	bhi	.L2156
	uxtb	r5, r5
	cmp	r0, r5
	bcc	.L2149
.L2148:
	mov	r1, #3
	ldr	r0, [r4, #2364]
	bl	BsGet
	add	r5, r5, #1
	ldr	r1, .L2159+4
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r8, r5
	bcs	.L2148
.L2149:
	ldr	r0, [r4, #2364]
	bl	BsToNextByte
	b	.L2147
.L2152:
	bl	HEVC_MoreRbspData
	cmp	r0, #0
	beq	.L2157
.L2147:
	mov	r2, r7
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	mov	r0, r4
	beq	.L2152
	ldr	r2, .L2159+8
	movw	r1, #5428
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2143:
	bl	BsGet
	uxtb	r5, r0
	cmp	r5, #0
	bne	.L2149
	mov	r1, #3
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r1, .L2159+12
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #63
	addls	r8, r0, #1
	bhi	.L2158
.L2151:
	add	r5, r5, #1
	mov	r1, #6
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r5, r8
	bne	.L2151
	b	.L2149
.L2157:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2156:
	mov	r3, #64
	ldr	r2, .L2159+16
	movw	r1, #5388
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2158:
	ldr	r2, .L2159+20
	movw	r1, #5409
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2160:
	.align	2
.L2159:
	.word	.LC218
	.word	.LC220
	.word	.LC215
	.word	.LC221
	.word	.LC219
	.word	.LC222
	UNWIND(.fnend)
	.size	HEVC_Sei_Scalable_Nesting, .-HEVC_Sei_Scalable_Nesting
	.align	2
	.global	HEVC_DecScalingListData
	.type	HEVC_DecScalingListData, %function
HEVC_DecScalingListData:
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
	ldr	r3, .L2195
	ldr	r9, .L2195+4
	mov	r5, r0
	add	ip, r5, #2208
	mov	r4, r1
	str	r1, [fp, #-68]
	mov	r2, #64
	ldr	r3, [r3, #52]
	add	r1, r1, #1216
	add	r0, r4, #1344
	mov	r10, #0
	mov	r6, ip
	blx	r3
	add	r3, r6, #8
	str	r4, [fp, #-60]
	str	r3, [fp, #-52]
	add	r3, r4, #1536
	str	r3, [fp, #-64]
.L2162:
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #4]!
	cmp	r3, #0
	str	r2, [fp, #-52]
	beq	.L2183
	ldr	r3, [fp, #-64]
	ldr	r6, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-48]
.L2182:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r3, [fp, #-52]
	ldr	r4, [r3, #-1888]
	cmp	r4, #64
	movge	r4, #64
	tst	r0, #255
	beq	.L2190
	cmp	r10, #1
	bls	.L2185
	ldr	r1, .L2195+8
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	add	r3, r0, #7
	cmp	r3, #254
	bhi	.L2191
	ldr	r3, [fp, #-56]
	add	r7, r0, #8
	str	r7, [r3]
.L2173:
	cmp	r4, #0
	ble	.L2172
	mov	r8, #0
	b	.L2179
.L2176:
	cmp	r10, #0
	mov	r7, r7, lsr #24
	add	r3, r3, r7
	ldreq	r2, .L2195+12
	moveq	r1, #4
	uxtb	r3, r3
	ldrneb	r2, [r8, r2]	@ zero_extendqisi2
	rsb	r7, r7, r3
	subeq	r3, r2, #16
	ldrneb	r3, [r8, r9]	@ zero_extendqisi2
	movne	r1, #8
	ldreqb	r3, [r8, r3]	@ zero_extendqisi2
	ldreqb	r2, [r8, r2]	@ zero_extendqisi2
	add	r8, r8, #1
	cmp	r8, r4
	smlabb	r3, r1, r3, r2
	strb	r7, [r6, r3]
	beq	.L2172
.L2179:
	ldr	r1, .L2195+16
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	ldr	r2, .L2195+20
	add	r3, r7, r0
	add	r0, r0, #128
	add	r3, r3, #256
	cmp	r0, #255
	mov	r7, r3, asr #31
	bls	.L2176
	ldr	r2, .L2195+24
	movw	r1, #12721
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
.L2165:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2190:
	ldr	r1, .L2195+28
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-48]
	cmp	r0, r3
	bhi	.L2192
	ldr	r2, [fp, #-48]
	cmp	r10, #1
	rsb	r3, r0, r2
	uxtb	r3, r3
	bls	.L2167
	cmp	r2, r3
	movne	r2, r10, asl #3
	subne	r2, r2, r10, asl #1
	ldrne	r1, [fp, #-68]
	addne	r2, r2, r3
	moveq	r2, #16
	addne	r2, r2, #384
	ldrne	r2, [r1, r2, asl #2]
	ldr	r1, [fp, #-56]
	str	r2, [r1]
.L2167:
	ldr	r2, [fp, #-48]
	cmp	r3, r2
	beq	.L2193
	mov	r1, r10, asl #3
	ldr	r2, [fp, #-68]
	sub	r1, r1, r10, asl #1
	add	r3, r1, r3
	add	r1, r2, r3, lsl #6
.L2170:
	cmp	r1, #0
	beq	.L2194
	ldr	r3, .L2195
	mov	r2, r4
	mov	r0, r6
	ldr	r3, [r3, #52]
	blx	r3
.L2172:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, #6
	beq	.L2183
	ldr	r3, [fp, #-52]
	add	r6, r6, #64
	ldr	r2, [fp, #-56]
	ldr	r3, [r3]
	add	r2, r2, #4
	str	r2, [fp, #-56]
	ldr	r2, [fp, #-48]
	cmp	r3, r2
	bhi	.L2182
.L2183:
	ldr	r3, [fp, #-60]
	add	r10, r10, #1
	cmp	r10, #4
	add	r3, r3, #384
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-64]
	add	r3, r3, #24
	str	r3, [fp, #-64]
	bne	.L2162
	mov	r0, #0
	b	.L2165
.L2185:
	mov	r7, #8
	b	.L2173
.L2193:
	mov	r1, r2
	mov	r0, r10
	bl	HEVC_GetScalingListDefaultAddress
	mov	r1, r0
	b	.L2170
.L2191:
	ldr	r2, .L2195+32
	movw	r1, #12707
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2165
.L2192:
	ldr	r2, .L2195+36
	mov	r1, #12672
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2165
.L2194:
	ldr	r2, .L2195+40
	movw	r1, #12691
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2165
.L2196:
	.align	2
.L2195:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+608
	.word	.LC226
	.word	.LANCHOR0+592
	.word	.LC228
	.word	.LANCHOR0+672
	.word	.LC229
	.word	.LC223
	.word	.LC227
	.word	.LC224
	.word	.LC225
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	mov	r4, r1
	mov	r5, r0
	ldr	r1, .L2363
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	cmp	r0, #1
	mov	r6, r0
	str	r0, [r4, #60]
	beq	.L2198
	cmp	r0, #3
	bhi	.L2341
	mov	r3, r0
	ldr	r2, .L2363+4
	movw	r1, #3868
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
.L2200:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2341:
	ldr	r2, .L2363+8
	movw	r1, #3863
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2198:
	ldr	r1, .L2363+12
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #64]
	bhi	.L2342
	ldr	r1, .L2363+16
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #68]
	bhi	.L2343
	ldr	r3, [r4, #416]
	ldr	r2, [r4, #64]
	cmp	r3, #120
	mul	r0, r2, r0
	beq	.L2206
	bgt	.L2207
	cmp	r3, #60
	beq	.L2208
	ble	.L2344
	cmp	r3, #90
	beq	.L2211
	cmp	r3, #93
	beq	.L2212
	cmp	r3, #63
	beq	.L2345
.L2205:
	ldr	r2, .L2363+20
	movw	r1, #3946
	mov	r0, #1
	bl	dprint_normal
.L2336:
	mvn	r0, #0
	b	.L2200
.L2342:
	ldr	r2, .L2363+24
	mov	r0, r6
	mov	r3, #4096
	movw	r1, #3887
.L2338:
	bl	dprint_normal
	ldr	r3, .L2363+28
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2336
	mov	r3, #0
	ldr	r0, [r5, #248]
	mov	r2, r3
	mov	r1, #21
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2208:
	mov	r2, #30720
	mov	r3, #122880
.L2213:
	cmp	r0, r2
	movls	r3, #16
	strls	r3, [r4, #184]
	bls	.L2218
	cmp	r0, r3, lsr #1
	movls	r3, #12
	strls	r3, [r4, #184]
	bls	.L2218
	add	r3, r3, r3, lsl #1
	cmp	r0, r3, lsr #2
	movls	r3, #8
	movhi	r3, #6
	str	r3, [r4, #184]
.L2218:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r0, #0
	beq	.L2221
	ldr	r1, .L2363+32
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r4, #60]
	ldr	r6, .L2363+36
	ldr	r1, .L2363+40
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #736]
	mul	r0, r3, r0
	str	r0, [r4, #72]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r2, [r4, #60]
	ldr	r3, [r4, #64]
	ldr	r1, [r4, #72]
	add	r2, r6, r2, lsl #2
	rsb	r3, r1, r3
	ldr	r2, [r2, #736]
	mul	r0, r2, r0
	rsb	r3, r0, r3
	cmp	r3, #0
	str	r0, [r4, #76]
	blt	.L2346
	ldr	r1, .L2363+44
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r4, #60]
	ldr	r1, .L2363+48
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #752]
	mul	r0, r3, r0
	str	r0, [r4, #80]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r4, #60]
	ldr	r2, [r4, #68]
	ldr	r1, [r4, #80]
	add	r3, r6, r3, lsl #2
	rsb	r2, r1, r2
	ldr	r3, [r3, #752]
	mul	r0, r3, r0
	rsb	r2, r0, r2
	cmp	r2, #0
	str	r0, [r4, #84]
	blt	.L2347
.L2221:
	ldr	r1, .L2363+52
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #2
	add	r3, r0, #8
	str	r3, [r4, #88]
	bhi	.L2348
	ldr	r1, .L2363+56
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #6
	add	r3, r0, #8
	str	r3, [r4, #96]
	bhi	.L2349
	ldr	r3, [r4, #88]
	ldr	r1, .L2363+60
	str	r3, [r5, #192]
	ldr	r3, [r4, #96]
	str	r3, [r5, #196]
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
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #12
	bhi	.L2350
	add	r0, r0, #4
	mov	r1, #1
	str	r0, [r4, #116]
	mov	r8, #0
	str	r0, [r4, #120]
	mov	r7, r8
	ldr	r0, [r5, #2364]
	mov	r6, r4
	bl	BsGet
	mov	r9, r0
	b	.L2232
.L2226:
	ldr	r3, [r4, #52]
	add	r7, r7, #1
	add	r6, r6, #4
	cmp	r7, r3
	bhi	.L2231
.L2232:
	ldr	r1, .L2363+64
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2363+68
	add	r0, r0, #1
	str	r0, [r6, #328]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r1, .L2363+72
	str	r0, [r6, #356]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r6, #328]
	cmp	r8, r3
	movcc	r8, r3
	cmp	r9, #0
	str	r0, [r6, #384]
	bne	.L2226
	ldr	r1, [r4, #52]
	add	r3, r7, #1
	cmp	r3, r1
	addls	r7, r7, #82
	addls	r7, r4, r7, lsl #2
	bhi	.L2231
.L2230:
	ldr	r2, [r4, #328]
	add	r3, r3, #1
	cmp	r3, r1
	str	r2, [r7, #4]!
	ldr	r2, [r4, #356]
	str	r2, [r7, #28]
	ldr	r2, [r4, #384]
	str	r2, [r7, #56]
	bls	.L2230
.L2231:
	ldr	r3, [r4, #184]
	ldr	r1, .L2363+76
	cmp	r3, #16
	movcs	r3, #16
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r4, #184]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #3
	mov	r6, r0
	bhi	.L2351
	ldr	r1, .L2363+80
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #3
	mov	r7, r0
	bhi	.L2352
	add	r0, r6, #3
	str	r0, [r4, #124]
	add	r6, r7, r0
	str	r6, [r4, #128]
	sub	r3, r6, #4
	cmp	r3, #2
	bhi	.L2353
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
	beq	.L2235
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L2236:
	ldr	r8, [r4, #68]
	mov	r1, r6
	str	r0, [r4, #188]
	mov	r0, r8
	bl	__aeabi_uidivmod
	mov	r0, r8
	cmp	r1, #0
	mov	r1, r6
	beq	.L2237
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L2238:
	str	r0, [r4, #192]
	ldr	r1, .L2363+84
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #3
	mov	r6, r0
	bhi	.L2354
	ldr	r1, .L2363+88
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #3
	bhi	.L2355
	ldr	r2, [r4, #124]
	add	r3, r6, #2
	str	r3, [r4, #148]
	cmp	r3, r2
	bcs	.L2356
	add	r3, r0, r3
	str	r3, [r4, #152]
	cmp	r3, #5
	bhi	.L2242
	ldr	r2, [r4, #128]
	cmp	r3, r2
	bhi	.L2242
	ldr	r1, .L2363+92
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r4, #128]
	ldr	r2, [r4, #148]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #164]
	bhi	.L2357
	ldr	r1, .L2363+96
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	ldr	ip, [r4, #148]
	ldr	r3, [r4, #128]
	rsb	r3, ip, r3
	cmp	r0, r3
	str	r0, [r4, #168]
	bhi	.L2245
	ldr	r1, [r4, #140]
	mov	r0, #1
	mov	r3, #0
	mov	r1, r1, lsr r7
	cmp	r1, r0, asl ip
	bls	.L2247
.L2248:
	add	r3, r3, #1
	add	r2, r3, ip
	cmp	r1, r0, asl r2
	bhi	.L2248
.L2247:
	add	r3, r3, r7
	mov	r1, #1
	str	r3, [r4, #172]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3]
	cmp	r0, #0
	beq	.L2249
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #0
	bne	.L2358
.L2249:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #6]
	cmp	r6, #0
	bne	.L2250
	ldr	r3, [r4, #68]
	cmp	r3, #64
	bls	.L2359
.L2250:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #104]
	beq	.L2251
	mov	r1, #4
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #4
	add	r0, r0, #1
	str	r0, [r4, #108]
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r1, .L2363+100
	add	r0, r0, #1
	str	r0, [r4, #112]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #2
	mov	r7, r0
	bhi	.L2360
.L2252:
	ldr	r1, .L2363+104
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #2
	mov	r6, r0
	bhi	.L2361
.L2253:
	add	r3, r7, #3
	str	r3, [r4, #156]
	add	r3, r6, r3
	str	r3, [r4, #160]
	cmp	r3, #5
	bhi	.L2254
	ldr	r2, [r4, #128]
	cmp	r3, r2
	bhi	.L2254
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	strb	r0, [r4, #7]
.L2251:
	ldr	r1, .L2363+108
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #64
	str	r0, [r4, #176]
	bhi	.L2256
	cmp	r0, #0
	addne	r7, r4, #2144
	movne	r6, #0
	addne	r7, r7, #4
	bne	.L2261
	b	.L2262
.L2260:
	ldr	r3, [r4, #176]
	cmp	r6, r3
	bcs	.L2262
.L2261:
	mov	r3, r6
	mov	r2, r7
	mov	r1, r4
	mov	r0, r5
	bl	HEVC_DecShortTermRefPicSet
	add	r6, r6, #1
	add	r7, r7, #164
	cmp	r0, #0
	beq	.L2260
	ldr	r2, .L2363+112
	movw	r1, #4285
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2343:
	mov	r0, r6
	mov	r3, #4096
	ldr	r2, .L2363+116
	movw	r1, #3897
	b	.L2338
.L2207:
	cmp	r3, #156
	beq	.L2214
	bgt	.L2215
	cmp	r3, #150
	beq	.L2214
	cmp	r3, #153
	beq	.L2214
	cmp	r3, #123
	bne	.L2205
.L2206:
	mov	r2, #557056
	mov	r3, #2228224
	b	.L2213
.L2237:
	bl	__aeabi_uidiv
	b	.L2238
.L2235:
	bl	__aeabi_uidiv
	b	.L2236
.L2348:
	ldr	r2, .L2363+120
	movw	r1, #4004
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2363+28
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L2336
	ldr	r1, [r4, #88]
	mov	r2, #0
	ldr	r0, [r5, #248]
	mov	r3, #8
	str	r2, [fp, #-44]
	sub	r2, fp, #44
	str	r1, [fp, #-40]
	mov	r1, #47
	blx	r6
	mvn	r0, #0
	b	.L2200
.L2262:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	beq	.L2259
	ldr	r1, .L2363+124
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #32
	str	r0, [r4, #180]
	bhi	.L2265
	cmp	r0, #0
	addne	r8, r4, #192
	addne	r7, r4, #12
	movne	r6, #0
	beq	.L2259
.L2267:
	ldr	r1, [r4, #116]
	add	r6, r6, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #4]!
	ldr	r0, [r5, #2364]
	bl	BsGet
	strb	r0, [r7, #1]!
	ldr	r3, [r4, #180]
	cmp	r6, r3
	bcc	.L2267
.L2259:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #11]
	cmp	r0, #0
	beq	.L2264
	add	r1, r4, #2048
	mov	r2, r4
	add	r1, r1, #4
	mov	r0, r5
	bl	HEVC_DecVuiParam
	cmp	r0, #0
	bne	.L2362
.L2264:
	ldr	ip, [r4, #68]
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #2068]
	ldr	r1, [r4, #2064]
	ldr	r0, [r4, #2060]
	str	ip, [sp]
	bl	HEVC_GetDar
	mov	r1, #1
	str	r0, [r4, #2056]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #12]
	cmp	r0, #0
	bne	.L2334
.L2270:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r4]
	b	.L2200
.L2269:
	ldr	r0, [r5, #2364]
	bl	BsGet
.L2334:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2269
	b	.L2270
.L2215:
	cmp	r3, #183
	beq	.L2216
	cmp	r3, #186
	beq	.L2216
	cmp	r3, #180
	bne	.L2205
.L2216:
	mov	r2, #8912896
	mov	r3, #35651584
	b	.L2213
.L2344:
	cmp	r3, #0
	beq	.L2210
	cmp	r3, #30
	bne	.L2205
.L2210:
	mov	r2, #9216
	mov	r3, #36864
	b	.L2213
.L2211:
	mov	r2, #138240
	mov	r3, #552960
	b	.L2213
.L2345:
	mov	r2, #61440
	mov	r3, #245760
	b	.L2213
.L2212:
	mov	r2, #245760
	mov	r3, #983040
	b	.L2213
.L2214:
	mov	r2, #2228224
	mov	r3, #8912896
	b	.L2213
.L2359:
	ldr	r2, .L2363+128
	movw	r1, #4230
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2363+28
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2336
	ldr	r0, [r5, #248]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #21
	blx	r4
	mvn	r0, #0
	b	.L2200
.L2358:
	add	r1, r4, #420
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	beq	.L2249
	ldr	r2, .L2363+132
	movw	r1, #4218
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2242:
	ldr	r2, .L2363+136
	movw	r1, #4157
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2361:
	mov	r3, r0
	ldr	r2, .L2363+140
	movw	r1, #4254
	mov	r0, #1
	bl	dprint_normal
	b	.L2253
.L2360:
	mov	r3, r0
	ldr	r2, .L2363+144
	movw	r1, #4246
	mov	r0, #1
	bl	dprint_normal
	b	.L2252
.L2350:
	ldr	r2, .L2363+148
	mov	r1, #4048
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2351:
	ldr	r2, .L2363+152
	mov	r1, #4096
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2354:
	ldr	r2, .L2363+156
	movw	r1, #4133
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2254:
	ldr	r2, .L2363+160
	movw	r1, #4263
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2357:
	ldr	r2, .L2363+164
	movw	r1, #4165
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2352:
	ldr	r2, .L2363+168
	movw	r1, #4104
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2353:
	ldr	r2, .L2363+172
	movw	r1, #4114
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2349:
	ldr	r2, .L2363+176
	movw	r1, #4024
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2356:
	ldr	r2, .L2363+180
	movw	r1, #4149
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2355:
	ldr	r2, .L2363+184
	movw	r1, #4141
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2245:
	ldr	r2, .L2363+188
	movw	r1, #4173
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2346:
	ldr	r2, .L2363+192
	movw	r1, #3980
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2256:
	mov	r3, #64
	ldr	r2, .L2363+196
	movw	r1, #4274
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2347:
	ldr	r2, .L2363+200
	movw	r1, #3993
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2265:
	ldr	r2, .L2363+204
	movw	r1, #4298
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2362:
	ldr	r2, .L2363+208
	movw	r1, #4319
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2200
.L2364:
	.align	2
.L2363:
	.word	.LC230
	.word	.LC232
	.word	.LC231
	.word	.LC233
	.word	.LC235
	.word	.LC237
	.word	.LC234
	.word	g_EventReportFunc
	.word	.LC238
	.word	.LANCHOR0
	.word	.LC239
	.word	.LC241
	.word	.LC242
	.word	.LC244
	.word	.LC246
	.word	.LC248
	.word	.LC250
	.word	.LC251
	.word	.LC252
	.word	.LC253
	.word	.LC255
	.word	.LC258
	.word	.LC260
	.word	.LC264
	.word	.LC266
	.word	.LC270
	.word	.LC272
	.word	.LC275
	.word	.LC277
	.word	.LC236
	.word	.LC245
	.word	.LC278
	.word	.LC269
	.word	.LC268
	.word	.LC263
	.word	.LC273
	.word	.LC271
	.word	.LC249
	.word	.LC254
	.word	.LC259
	.word	.LC274
	.word	.LC265
	.word	.LC256
	.word	.LC257
	.word	.LC247
	.word	.LC262
	.word	.LC261
	.word	.LC267
	.word	.LC240
	.word	.LC276
	.word	.LC243
	.word	.LC279
	.word	.LC280
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
	ldr	r8, .L2384
	mov	r4, r0
	mov	r2, #8
	mov	r1, #0
	sub	r0, fp, #60
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r0, [r4, #2364]
	mov	r1, #4
	bl	BsGet
	ldr	r3, [r4, #160]
	cmp	r3, r0
	mov	r9, r0
	bls	.L2378
	ldr	r3, [r4, #2384]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L2379
	mov	r5, #0
	str	r5, [fp, #-64]
.L2368:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r3, r5
	mov	r2, #1
	sub	r1, fp, #60
	mov	r6, r0
	mov	r0, r4
	bl	HEVC_DecPTL
	subs	r3, r0, #0
	str	r3, [fp, #-68]
	bne	.L2380
	ldr	r1, .L2384+4
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r4, #164]
	cmp	r0, r3
	mov	r7, r0
	bcs	.L2381
	movw	r10, #12644
	ldr	r3, [r4, #2372]
	mul	r5, r10, r0
	uxtb	r2, r6
	str	r2, [fp, #-72]
	add	r3, r3, r5
	ldrb	r6, [r3, #1]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L2372
	ldr	r6, .L2384+8
	mov	r2, r10
	ldr	r3, [r8, #48]
	ldr	r1, [fp, #-68]
	add	r0, r6, #320
	blx	r3
	ldr	r3, [fp, #-64]
	sub	r1, fp, #60
	mov	r2, #8
	str	r9, [r6, #368]
	add	r0, r6, #732
	str	r3, [r6, #372]
	ldrb	r3, [fp, #-72]	@ zero_extendqisi2
	strb	r3, [r6, #322]
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	strb	r3, [r6, #366]
	ldr	r3, [r8, #52]
	blx	r3
	add	r1, r6, #320
	mov	r0, r4
	str	r7, [r6, #376]
	bl	HEVC_ProcessSPS
	subs	r8, r0, #0
	ldr	r0, [r4, #2372]
	bne	.L2382
	ldr	r3, .L2384
	add	r0, r0, r5
	mov	r2, r10
	add	r1, r6, #320
	ldr	r7, [r3, #56]
	mov	r3, #1
	strb	r3, [r6, #320]
	strb	r3, [r6, #321]
	blx	r7
	ldr	r3, [r4, #2372]
	add	r5, r3, r5
	str	r5, [r4, #2380]
.L2367:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2379:
	mov	r1, #3
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r0, #6
	mov	r5, r0
	str	r0, [fp, #-64]
	bls	.L2368
	mov	r3, #6
	ldr	r2, .L2384+12
	movw	r1, #4380
	mov	r0, #1
	bl	dprint_normal
	mvn	r8, #0
	b	.L2367
.L2372:
	str	r9, [r3, #48]
	sub	r1, fp, #60
	ldr	r3, [r4, #2372]
	mov	r2, #8
	ldr	r0, [fp, #-64]
	add	r3, r3, r5
	str	r0, [r3, #52]
	ldr	r3, [r4, #2372]
	ldrb	r0, [fp, #-72]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r0, [r3, #2]
	ldr	r3, [r4, #2372]
	add	r3, r3, r5
	strb	r6, [r3, #46]
	ldr	r0, [r4, #2372]
	ldr	r3, [r8, #52]
	add	r0, r0, r5
	add	r0, r0, #412
	blx	r3
	ldr	r3, [r4, #2372]
	mov	r0, r4
	add	r3, r3, r5
	str	r7, [r3, #56]
	ldr	r1, [r4, #2372]
	add	r1, r1, r5
	bl	HEVC_ProcessSPS
	subs	r8, r0, #0
	bne	.L2383
	ldr	r3, [r4, #2372]
	mov	r2, #1
	mov	r0, r8
	strb	r2, [r3, r5]
	ldr	r3, [r4, #2372]
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2372]
	add	r5, r3, r5
	str	r5, [r4, #2380]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2381:
	ldr	r2, .L2384+16
	movw	r1, #4428
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, [r4, #164]
	cmp	r7, r2
	bcc	.L2377
	ldr	r3, .L2384+20
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L2377
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r7, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r4, #248]
	mov	r1, #28
	blx	r5
	mvn	r8, #0
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2377:
	mvn	r8, #0
	b	.L2367
.L2380:
	ldr	r2, .L2384+24
	movw	r1, #4419
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2367
.L2378:
	ldr	r2, .L2384+28
	movw	r1, #4370
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2367
.L2382:
	add	r5, r0, r5
	mov	r3, r7
	ldr	r2, .L2384+32
	movw	r1, #4457
	str	r5, [r4, #2380]
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_normal
	b	.L2367
.L2383:
	mov	r3, r7
	ldr	r2, .L2384+36
	movw	r1, #4483
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #2372]
	mov	r2, #1
	mvn	r8, #0
	strb	r2, [r3, r5]
	ldr	r3, [r4, #2372]
	add	r5, r3, r5
	strb	r6, [r5, #1]
	b	.L2367
.L2385:
	.align	2
.L2384:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC284
	.word	.LANCHOR4
	.word	.LC282
	.word	.LC285
	.word	g_EventReportFunc
	.word	.LC283
	.word	.LC281
	.word	.LC286
	.word	.LC287
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
	ldr	r1, .L2518
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	blt	.L2387
	ldr	r3, [r5, #164]
	cmp	r0, r3
	bge	.L2387
	ldr	r3, [r5, #2372]
	movw	r6, #12644
	mla	r6, r6, r0, r3
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2498
	mov	r1, r7
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, r7
	str	r0, [r4, #36]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #3]
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r1, .L2518+4
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #40]
	cmp	r0, #15
	bhi	.L2499
	ldr	r1, .L2518+8
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #44]
	cmp	r0, #15
	bhi	.L2500
	ldr	r1, .L2518+12
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	cmn	r0, #-2147483647
	beq	.L2501
	add	r3, r0, #26
	str	r3, [r4, #48]
	ldr	r1, [r6, #92]
	cmp	r3, #51
	rsb	r0, r1, #0
	movle	r2, #0
	movgt	r2, #1
	cmp	r3, r0
	orrlt	r2, r2, #1
	cmp	r2, #0
	bne	.L2502
	mov	r1, r7
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #6]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	streq	r0, [r4, #52]
	bne	.L2503
.L2397:
	str	r0, [r4, #56]
	ldr	r1, .L2518+16
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #60]
	cmp	r3, #24
	bhi	.L2504
	ldr	r1, .L2518+20
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #64]
	cmp	r3, #24
	bhi	.L2505
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #13]
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #14]
	bne	.L2506
	ldr	r3, [r6, #188]
	strh	r3, [r4, #172]	@ movhi
	ldr	r3, [r6, #192]
	strh	r3, [r4, #212]	@ movhi
.L2438:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	ble	.L2443
.L2437:
	ldr	ip, [r6, #140]
	add	r1, r4, #170
	mov	r2, #0
.L2442:
	ldrsh	r3, [r1, #2]!
	add	r2, r2, #1
	mul	r3, ip, r3
	cmp	r3, #64
	bhi	.L2441
	ldr	lr, [r6, #64]
	cmp	lr, #64
	bhi	.L2507
.L2441:
	cmp	r2, r0
	blt	.L2442
.L2443:
	ldr	r1, [r4, #72]
	cmp	r1, #0
	ble	.L2440
	ldr	r0, [r6, #140]
	ldrsh	r3, [r4, #212]
	mul	r3, r0, r3
	cmp	r3, #63
	addhi	r1, r1, #105
	addhi	r2, r4, #212
	addhi	r1, r4, r1, lsl #1
	bhi	.L2446
	b	.L2444
.L2447:
	ldrsh	r3, [r2, #2]!
	mul	r3, r0, r3
	cmp	r3, #63
	bls	.L2444
.L2446:
	cmp	r2, r1
	bne	.L2447
.L2440:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #0
	bne	.L2508
.L2449:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #21]
	cmp	r0, #0
	beq	.L2452
	add	r1, r4, #256
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	bne	.L2509
.L2452:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r1, .L2518+24
	strb	r0, [r4, #22]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	add	r3, r0, #2
	str	r3, [r4, #84]
	cmp	r3, #1
	ble	.L2453
	ldr	r2, [r6, #128]
	cmp	r3, r2
	bhi	.L2453
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #24]
	cmp	r0, #0
	bne	.L2484
	b	.L2457
.L2456:
	ldr	r0, [r5, #2364]
	bl	BsGet
	strb	r0, [r4, #25]
.L2484:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2456
.L2457:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2503:
	ldr	r1, .L2518+28
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #52]
	bls	.L2397
	mov	r0, r7
	ldr	r2, .L2518+32
	movw	r1, #4576
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2506:
	ldr	r1, .L2518+36
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #19
	bhi	.L2510
	add	r0, r0, #1
	ldr	r1, .L2518+40
	str	r0, [r4, #68]
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	cmp	r0, #21
	bhi	.L2511
	ldr	r3, [r4, #68]
	add	r0, r0, #1
	str	r0, [r4, #72]
	cmp	r3, #10
	bgt	.L2512
	cmp	r0, #11
	ble	.L2405
	ldr	r2, .L2518+44
	mov	r3, #11
	movw	r1, #4638
	str	r0, [sp]
.L2495:
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2518+48
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2489
.L2491:
	mov	r3, #0
	ldr	r0, [r5, #248]
	mov	r2, r3
	mov	r1, #21
	blx	r4
	mvn	r0, #0
.L2485:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2444:
	ldr	r2, .L2518+52
	movw	r1, #4757
.L2494:
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L2518+48
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L2491
.L2489:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2507:
	ldr	r2, .L2518+56
	movw	r1, #4747
	b	.L2494
.L2502:
	str	r1, [sp]
	mov	r0, r7
	ldr	r2, .L2518+60
	movw	r1, #4557
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2405:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	ldr	r7, [r4, #68]
	uxtb	r0, r0
	strb	r0, [r4, #15]
	cmp	r0, #0
	bne	.L2420
	cmp	r7, #1
	addgt	r9, r4, #86
	movgt	r8, r0
	bgt	.L2418
	b	.L2513
.L2414:
	strh	r2, [r9, #2]!	@ movhi
	sxth	r2, r2
	cmp	r2, #0
	ldr	r3, [r6, #188]
	blt	.L2416
	cmp	r2, r3
	bhi	.L2416
	ldr	r7, [r4, #68]
	add	r8, r8, #1
	sub	r3, r7, #1
	cmp	r3, r8
	ble	.L2514
.L2418:
	ldr	r1, .L2518+64
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	add	r2, r0, #1
	cmn	r0, #1
	mov	r7, r0
	uxth	r2, r2
	bne	.L2414
	movw	r1, #4654
.L2492:
	ldr	r3, .L2518+68
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L2518+72
	bl	dprint_normal
	mov	r0, r7
	b	.L2485
.L2512:
	str	r3, [sp]
	movw	r1, #4631
	mov	r3, #10
	ldr	r2, .L2518+76
	b	.L2495
.L2508:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	ldr	r0, [r5, #2364]
	bl	BsGet
	uxtb	r7, r0
	strb	r7, [r4, #20]
	cmp	r7, #0
	bne	.L2449
	ldr	r1, .L2518+80
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	add	r2, r0, #6
	mov	r3, r0
	cmp	r2, #12
	str	r0, [r4, #76]
	bhi	.L2515
.L2451:
	ldr	r1, .L2518+84
	ldr	r0, [r5, #2364]
	bl	HEVC_se_v
	add	r2, r0, #6
	mov	r3, r0
	cmp	r2, #12
	str	r0, [r4, #80]
	bls	.L2449
	ldr	r2, .L2518+88
	movw	r1, #4787
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r4, #80]
	b	.L2449
.L2420:
	cmp	r7, #0
	addgt	r3, r4, #170
	movgt	r8, #0
	ble	.L2409
.L2429:
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
	bne	.L2429
.L2409:
	ldr	r10, [r4, #72]
	cmp	r10, #0
	addgt	r3, r4, #210
	movgt	r8, #0
	ble	.L2428
.L2430:
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
	bne	.L2430
.L2428:
	cmp	r7, #1
	bne	.L2436
	ldr	r0, [r4, #72]
	cmp	r0, #1
	beq	.L2437
.L2436:
	mov	r1, #1
	ldr	r0, [r5, #2364]
	bl	BsGet
	strb	r0, [r4, #16]
	b	.L2438
.L2387:
	mov	r3, r0
	ldr	r2, .L2518+92
	movw	r1, #4512
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2498:
	mov	r3, r0
	ldr	r2, .L2518+96
	mov	r0, r7
	movw	r1, #4517
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2499:
	mov	r0, r7
	ldr	r2, .L2518+100
	movw	r1, #4533
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2500:
	mov	r0, r7
	ldr	r2, .L2518+104
	movw	r1, #4541
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2504:
	ldr	r2, .L2518+108
	movw	r1, #4586
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2505:
	ldr	r2, .L2518+112
	movw	r1, #4594
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2453:
	ldr	r2, .L2518+116
	movw	r1, #4813
	mov	r0, #1
	bl	dprint_normal
	b	.L2489
.L2416:
	str	r3, [sp, #4]
	movw	r1, #4662
	str	r2, [sp]
	mov	r3, r8
	ldr	r2, .L2518+120
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2514:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	ble	.L2413
.L2412:
	add	r9, r4, #126
	mov	r8, #0
	b	.L2426
.L2422:
	strh	r2, [r9, #2]!	@ movhi
	sxth	r2, r2
	cmp	r2, #0
	ldr	r3, [r6, #192]
	blt	.L2424
	cmp	r2, r3
	bhi	.L2424
	ldr	r3, [r4, #72]
	add	r8, r8, #1
	sub	r3, r3, #1
	cmp	r3, r8
	ble	.L2516
.L2426:
	ldr	r1, .L2518+124
	ldr	r0, [r5, #2364]
	bl	HEVC_ue_v
	add	r2, r0, #1
	cmn	r0, #1
	mov	r7, r0
	uxth	r2, r2
	bne	.L2422
	movw	r1, #4674
	b	.L2492
.L2510:
	mov	r3, r0
	ldr	r2, .L2518+128
	mov	r0, #20
	movw	r1, #4613
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2501:
	movw	r1, #4549
	mov	r0, r7
	str	r1, [sp]
	ldr	r3, .L2518+68
	ldr	r2, .L2518+132
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2515:
	ldr	r2, .L2518+136
	movw	r1, #4777
	mov	r0, #1
	bl	dprint_normal
	str	r7, [r4, #76]
	b	.L2451
.L2424:
	str	r3, [sp, #4]
	movw	r1, #4682
	str	r2, [sp]
	mov	r3, r8
	ldr	r2, .L2518+140
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2511:
	mov	r3, r0
	ldr	r2, .L2518+144
	mov	r0, #22
	movw	r1, #4623
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2516:
	ldr	r7, [r4, #68]
.L2413:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2420
.L2421:
	sub	r3, r7, #1
	ldrh	r2, [r6, #188]
	add	ip, r4, r7, lsl #1
	cmp	r3, #0
	strh	r2, [ip, #170]	@ movhi
	ble	.L2431
	add	r8, r7, #42
	add	r1, r4, #86
	add	lr, r4, #170
	add	r8, r4, r8, lsl #1
.L2432:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r2, [ip, #170]
	rsb	r2, r0, r2
	uxth	r2, r2
	strh	r2, [ip, #170]	@ movhi
	bne	.L2432
.L2431:
	sxth	r2, r2
	cmp	r2, #0
	ble	.L2517
	ldr	r1, [r4, #72]
	ldrh	r2, [r6, #192]
	sub	r3, r1, #1
	add	ip, r4, r1, lsl #1
	cmp	r3, #0
	strh	r2, [ip, #210]	@ movhi
	ble	.L2434
	add	r8, r1, #62
	add	lr, r4, #210
	add	r1, r4, #126
	add	r8, r4, r8, lsl #1
.L2435:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r2, [ip, #210]
	rsb	r2, r0, r2
	uxth	r2, r2
	strh	r2, [ip, #210]	@ movhi
	bne	.L2435
.L2434:
	sxth	r2, r2
	cmp	r2, #0
	bgt	.L2428
	str	r2, [sp]
	movw	r1, #4726
	ldr	r2, .L2518+148
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2509:
	ldr	r2, .L2518+152
	movw	r1, #4803
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2513:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	bgt	.L2412
	b	.L2421
.L2517:
	str	r2, [sp]
	movw	r1, #4712
	ldr	r2, .L2518+156
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2485
.L2519:
	.align	2
.L2518:
	.word	.LC288
	.word	.LC291
	.word	.LC293
	.word	.LC295
	.word	.LC300
	.word	.LC302
	.word	.LC323
	.word	.LC298
	.word	.LC299
	.word	.LC304
	.word	.LC306
	.word	.LC309
	.word	g_EventReportFunc
	.word	.LC317
	.word	.LC316
	.word	.LC297
	.word	.LC310
	.word	.LANCHOR0+768
	.word	.LC158
	.word	.LC308
	.word	.LC318
	.word	.LC320
	.word	.LC321
	.word	.LC289
	.word	.LC290
	.word	.LC292
	.word	.LC294
	.word	.LC301
	.word	.LC303
	.word	.LC324
	.word	.LC311
	.word	.LC312
	.word	.LC305
	.word	.LC296
	.word	.LC319
	.word	.LC313
	.word	.LC307
	.word	.LC315
	.word	.LC322
	.word	.LC314
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r1, .L2530
	mov	r4, r0
	ldr	r0, [r0, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r4, #168]
	cmp	r0, r3
	mov	r6, r0
	bcs	.L2526
	mov	r7, #1888
	ldr	r3, [r4, #2376]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r8, [r3, r5]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L2527
	str	r0, [r2, #28]
	mov	r0, r4
	ldr	r1, [r4, #2376]
	add	r1, r1, r5
	bl	HEVC_ProcessPPS
	subs	r9, r0, #0
	bne	.L2528
	ldr	r3, [r4, #2376]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2376]
	strb	r2, [r3, r5]
.L2522:
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2527:
	ldr	r10, .L2530+4
	mov	r2, r7
	ldr	r8, .L2530+8
	mov	r1, #0
	ldr	r3, [r10, #48]
	add	r0, r8, #320
	blx	r3
	add	r1, r8, #320
	mov	r0, r4
	str	r6, [r8, #348]
	bl	HEVC_ProcessPPS
	subs	r9, r0, #0
	bne	.L2529
	ldr	r0, [r4, #2376]
	mov	r1, r8
	mov	r3, #1
	ldr	r4, [r10, #56]
	mov	r2, r7
	add	r0, r0, r5
	strb	r3, [r1, #320]!
	strb	r3, [r8, #321]
	blx	r4
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2529:
	mov	r3, r6
	ldr	r2, .L2530+12
	movw	r1, #4866
	mov	r0, #1
	bl	dprint_normal
	mvn	r9, #0
	b	.L2522
.L2526:
	str	r3, [sp]
	movw	r1, #4852
	mov	r3, r0
	ldr	r2, .L2530+16
	mov	r0, #1
	mvn	r9, #0
	bl	dprint_normal
	b	.L2522
.L2528:
	mov	r3, r6
	ldr	r2, .L2530+12
	movw	r1, #4884
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r4, #2376]
	mov	r2, #1
	mvn	r9, #0
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2376]
	strb	r8, [r3, r5]
	b	.L2522
.L2531:
	.align	2
.L2530:
	.word	.LC325
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR4
	.word	.LC327
	.word	.LC326
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
	mov	r2, #64
	mov	r7, r0
	mov	r1, #0
	add	r4, r7, #4096
	sub	r0, fp, #172
	bl	memset
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #108
	bl	memset
	ldr	r2, [r4, #2460]
	ldr	r3, [r7, #2376]
	mov	r0, #1888
	ldr	r1, [r4, #2444]
	ldr	r5, [r7, #2372]
	mla	r3, r0, r2, r3
	cmp	r1, #1
	ldr	r6, [r3, #32]
	beq	.L2598
	cmp	r1, #0
	bne	.L2536
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2536
.L2534:
	ldr	r1, .L2609
	ldr	r0, [r7, #2364]
	bl	HEVC_ue_v
	cmp	r0, #7
	str	r0, [r4, #2580]
	bhi	.L2599
	movw	r9, #12644
	mla	r9, r9, r6, r5
	ldr	r3, [r9, #60]
	cmp	r3, #0
	streq	r0, [r4, #2712]
	bne	.L2600
.L2576:
	ldr	r3, [r4, #2500]
	cmp	r3, #0
	subne	r6, fp, #172
	movne	r5, #0
	beq	.L2542
.L2543:
	mov	r1, #1
	ldr	r0, [r7, #2364]
	bl	BsGet
	ldr	r3, [r4, #2500]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L2543
	ldr	r2, [r9, #60]
	cmp	r2, #0
	beq	.L2544
	cmp	r3, #0
	subne	r6, fp, #108
	movne	r5, #0
	beq	.L2542
.L2548:
	mov	r1, #1
	ldr	r0, [r7, #2364]
	bl	BsGet
	ldr	r3, [r4, #2500]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L2548
.L2544:
	cmp	r3, #0
	beq	.L2542
	add	r6, r7, #6784
	add	r10, r7, #6848
	add	r6, r6, #28
	add	r10, r10, #36
	mov	r5, #0
	b	.L2559
.L2549:
	ldr	r3, [r4, #2580]
	str	r2, [r6, #-132]
	mov	r2, #1
	mov	r3, r2, asl r3
	str	r3, [r6]
.L2551:
	ldr	r3, [r9, #60]
	cmp	r3, #0
	beq	.L2553
	sub	r3, fp, #108
	ldr	r3, [r3, r5, asl #2]
	cmp	r3, #0
	bne	.L2554
	ldr	r2, [r4, #2712]
	mov	r1, #1
	str	r3, [r10, #120]
	mov	r2, r1, asl r2
	str	r3, [r10, #124]
	str	r2, [r10, #-8]
	str	r2, [r10, #-4]
.L2553:
	ldr	r3, [r4, #2500]
	add	r5, r5, #1
	add	r6, r6, #4
	add	r10, r10, #8
	cmp	r3, r5
	bls	.L2542
.L2559:
	sub	r3, fp, #172
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	beq	.L2549
	ldr	r1, .L2609+4
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #128
	cmp	r3, #255
	bhi	.L2601
	ldr	r3, [r4, #2580]
	mov	r2, #1
	ldr	r1, .L2609+8
	add	r0, r0, r2, asl r3
	str	r0, [r6]
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #128
	str	r0, [r6, #-132]
	cmp	r3, #255
	bls	.L2551
	mov	r3, r0
	ldr	r2, .L2609+12
	movw	r1, #13246
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2598:
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2534
.L2536:
	mov	r0, #0
.L2597:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2554:
	sub	r8, r10, #8
	str	r5, [fp, #-176]
	mov	r5, r4
.L2557:
	ldr	r1, .L2609+16
	mov	r4, r8
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	ldr	r1, .L2609+20
	add	r3, r0, #128
	cmp	r3, #255
	bhi	.L2602
	ldr	r3, [r5, #2712]
	mov	r2, #1
	add	r8, r8, #4
	add	r0, r0, r2, asl r3
	str	r0, [r8, #-4]
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #512
	cmp	r3, #1024
	bcs	.L2603
	ldr	r1, [r4]
	cmp	r10, r8
	ldr	r3, [r5, #2712]
	mov	r1, r1, asl #7
	mov	r3, r1, asr r3
	rsb	r3, r3, #128
	add	r0, r0, r3
	ssat	r0, #8, r0
	str	r0, [r8, #124]
	bne	.L2557
	mov	r4, r5
	ldr	r5, [fp, #-176]
	b	.L2553
.L2542:
	ldr	r5, [r4, #2444]
	cmp	r5, #0
	bne	.L2536
	ldr	r3, [r4, #2504]
	cmp	r3, #0
	beq	.L2536
	sub	r6, fp, #172
.L2560:
	mov	r1, #1
	ldr	r0, [r7, #2364]
	bl	BsGet
	ldr	r3, [r4, #2504]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L2560
	ldr	r2, [r9, #60]
	cmp	r2, #0
	bne	.L2604
.L2561:
	cmp	r3, #0
	beq	.L2536
	add	r6, r7, #7104
	add	r10, r7, #7168
	add	r6, r6, #28
	add	r10, r10, #36
	mov	r5, #0
	b	.L2575
.L2565:
	ldr	r3, [r4, #2580]
	str	r2, [r6, #-388]
	mov	r2, #1
	mov	r3, r2, asl r3
	str	r3, [r6]
.L2567:
	ldr	r3, [r9, #60]
	cmp	r3, #0
	beq	.L2569
	sub	r3, fp, #108
	ldr	r3, [r3, r5, asl #2]
	cmp	r3, #0
	bne	.L2570
	ldr	r2, [r4, #2712]
	mov	r1, #1
	str	r3, [r10, #120]
	mov	r2, r1, asl r2
	str	r3, [r10, #124]
	str	r2, [r10, #-8]
	str	r2, [r10, #-4]
.L2569:
	ldr	r3, [r4, #2504]
	add	r5, r5, #1
	add	r6, r6, #4
	add	r10, r10, #8
	cmp	r3, r5
	bls	.L2536
.L2575:
	sub	r3, fp, #172
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	beq	.L2565
	ldr	r1, .L2609+24
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #128
	cmp	r3, #255
	bhi	.L2605
	ldr	r3, [r4, #2580]
	mov	r2, #1
	ldr	r1, .L2609+28
	add	r0, r0, r2, asl r3
	str	r0, [r6]
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #128
	str	r0, [r6, #-388]
	cmp	r3, #255
	bls	.L2567
	ldr	r2, .L2609+32
	movw	r1, #13329
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2570:
	sub	r8, r10, #8
	str	r5, [fp, #-176]
	mov	r5, r4
.L2573:
	ldr	r1, .L2609+36
	mov	r4, r8
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	ldr	r1, .L2609+40
	add	r3, r0, #128
	cmp	r3, #255
	bhi	.L2606
	ldr	r3, [r5, #2712]
	mov	r2, #1
	add	r8, r8, #4
	add	r0, r0, r2, asl r3
	str	r0, [r8, #-4]
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #512
	cmp	r3, #1024
	bcs	.L2607
	ldr	r1, [r4]
	cmp	r10, r8
	ldr	r3, [r5, #2712]
	mov	r1, r1, asl #7
	mov	r3, r1, asr r3
	rsb	r3, r3, #128
	add	r3, r0, r3
	ssat	r3, #8, r3
	str	r3, [r8, #124]
	bne	.L2573
	mov	r4, r5
	ldr	r5, [fp, #-176]
	b	.L2569
.L2600:
	ldr	r1, .L2609+44
	ldr	r0, [r7, #2364]
	bl	HEVC_se_v
	add	r3, r0, #7
	cmp	r3, #14
	bhi	.L2608
	ldr	r3, [r4, #2580]
	add	r0, r0, r3
	str	r0, [r4, #2712]
	cmp	r0, #7
	bls	.L2576
	ldr	r2, .L2609+48
	movw	r1, #13212
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2602:
	ldr	r2, .L2609+52
	movw	r1, #13266
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2603:
	ldr	r2, .L2609+56
	movw	r1, #13276
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2604:
	cmp	r3, #0
	subne	r6, fp, #108
	movne	r5, #0
	beq	.L2536
.L2564:
	mov	r1, #1
	ldr	r0, [r7, #2364]
	bl	BsGet
	ldr	r3, [r4, #2504]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r6], #4
	bhi	.L2564
	b	.L2561
.L2601:
	mov	r3, r0
	ldr	r2, .L2609+60
	movw	r1, #13237
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2606:
	ldr	r2, .L2609+64
	movw	r1, #13349
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2607:
	ldr	r2, .L2609+68
	movw	r1, #13359
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2605:
	ldr	r2, .L2609+72
	movw	r1, #13320
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2599:
	ldr	r2, .L2609+76
	movw	r1, #13193
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2608:
	ldr	r2, .L2609+80
	movw	r1, #13203
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2597
.L2610:
	.align	2
.L2609:
	.word	.LC328
	.word	.LC333
	.word	.LC335
	.word	.LC336
	.word	.LC337
	.word	.LC339
	.word	.LC341
	.word	.LC343
	.word	.LC344
	.word	.LC345
	.word	.LC347
	.word	.LC330
	.word	.LC332
	.word	.LC338
	.word	.LC340
	.word	.LC334
	.word	.LC346
	.word	.LC348
	.word	.LC342
	.word	.LC329
	.word	.LC331
	UNWIND(.fnend)
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
	.align	2
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	r3, [r0, #2384]
	add	r5, r0, #4096
	mov	r4, r0
	mov	r1, #1
	ldr	r0, [r0, #2364]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-48]
	bl	BsGet
	ldr	r6, [r5, #2452]
	sub	r3, r6, #16
	cmp	r3, #5
	movhi	r3, #0
	movls	r3, #1
	cmp	r3, #0
	str	r3, [fp, #-64]
	strb	r0, [r5, #2424]
	bne	.L2863
.L2612:
	ldr	r1, .L2907
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r5, #2460]
	ldr	r3, [r4, #168]
	blt	.L2614
	cmp	r0, r3
	bge	.L2614
	mov	r0, r4
	bl	HEVC_VpsSpsPpsCheck
	subs	r3, r0, #0
	str	r3, [fp, #-72]
	bne	.L2864
	ldr	r1, [r5, #2460]
	mov	r7, #1888
	ldr	r2, [r4, #2376]
	movw	r8, #12644
	ldr	r3, [r4, #2372]
	mla	r7, r7, r1, r2
	ldrb	r1, [r7, #2]	@ zero_extendqisi2
	ldr	r2, [r7, #32]
	cmp	r1, #0
	mla	r8, r8, r2, r3
	bne	.L2865
.L2620:
	mov	r3, #0
	strb	r3, [r5, #2425]
.L2621:
	ldr	r10, [r8, #140]
	ldr	r3, [r8, #144]
	cmp	r10, #0
	beq	.L2623
	cmp	r3, #0
	beq	.L2623
	ldr	r0, [r8, #68]
	mov	r1, r3
	add	r0, r3, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	mov	r1, r10
	mov	r9, r0
	ldr	r0, [r8, #64]
	add	r0, r10, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	ldr	r10, [r8, #172]
	mov	r3, #1
	mov	r1, #0
	mov	r10, r10, asl r3
	mov	r10, r3, asl r10
	mul	r0, r0, r9
	cmp	r0, r3
	ble	.L2625
.L2626:
	add	r1, r1, #1
	cmp	r0, r3, asl r1
	bgt	.L2626
.L2625:
	ldrb	r3, [r5, #2424]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [fp, #-68]
	beq	.L2866
.L2627:
	ldrb	r10, [r5, #2425]	@ zero_extendqisi2
	ldr	r3, [r4, #188]
	cmp	r10, #0
	str	r3, [r5, #2436]
	beq	.L2867
.L2630:
	ldr	r3, [r7, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	bne	.L2722
.L2729:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2868
.L2724:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bne	.L2869
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [fp, #-64]
	beq	.L2740
	cmp	r3, #0
	beq	.L2741
	ldr	r3, [r5, #2456]
	mov	r2, #1
	add	r3, r4, r3
	strb	r2, [r3, #5]
.L2738:
	ldr	r2, [r5, #2436]
	ldr	r1, [fp, #-64]
	cmp	r2, #0
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	bne	.L2870
.L2739:
	mov	r2, #0
	strb	r2, [r3, #4]
.L2743:
	mov	r0, r4
	bl	HEVC_IsNewPic
	str	r0, [r5, #2576]
	mov	r0, r4
	bl	HEVC_ReadByteAlignment
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L2848:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2865:
	ldrb	r3, [r5, #2424]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2620
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r5, #2425]
	b	.L2621
.L2867:
	ldr	r3, [r7, #36]
	cmp	r3, #0
	beq	.L2635
.L2634:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r3, [r7, #36]
	add	r10, r10, #1
	cmp	r3, r10
	bhi	.L2634
.L2635:
	ldr	r1, .L2907+4
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r5, #2444]
	bhi	.L2871
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2872
.L2636:
	sub	r6, r6, #19
	cmp	r6, #1
	bhi	.L2873
	mov	r3, #0
	str	r3, [r5, #2436]
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	streq	r3, [r4, #188]
	ldr	r3, [r5, #2448]
	cmp	r3, #0
	streq	r3, [r4, #184]
	ldrb	r3, [r8, #6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2856
.L2746:
	mov	r3, #0
	strb	r3, [r5, #2428]
	str	r3, [fp, #-84]
.L2748:
	ldr	r3, [r5, #2444]
	cmp	r3, #2
	bne	.L2874
.L2676:
	ldrb	r3, [r5, #2428]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2698
	mov	r3, #1
	strb	r3, [r5, #2432]
	mov	r3, #2
.L2701:
	ldrb	r2, [r7, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2705
	cmp	r3, #1
	beq	.L2708
.L2705:
	ldrb	r2, [r7, #11]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2696
	cmp	r3, #0
	bne	.L2696
.L2708:
	mov	r0, r4
	bl	HEVC_DecPredWeightTable
	cmp	r0, #0
	ldreq	r3, [r5, #2444]
	bne	.L2875
.L2696:
	cmp	r3, #2
	beq	.L2709
	ldr	r1, .L2907+8
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	rsb	r3, r0, #4
	rsb	r0, r0, #5
	cmp	r3, #4
	str	r0, [r5, #2472]
	bhi	.L2876
.L2709:
	ldr	r1, .L2907+12
	ldr	r0, [r4, #2364]
	bl	HEVC_se_v
	ldr	r3, [r7, #48]
	add	r3, r0, r3
	str	r3, [r5, #2440]
	ldr	r1, [r8, #92]
	cmp	r3, #51
	rsb	r0, r1, #0
	movle	r2, #0
	movgt	r2, #1
	cmp	r3, r0
	orrlt	r2, r2, #1
	cmp	r2, #0
	bne	.L2877
	ldrb	r3, [r7, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2878
.L2711:
	ldrb	r3, [r7, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2853
	ldrb	r3, [r7, #19]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2879
.L2717:
	ldrb	r0, [r7, #20]	@ zero_extendqisi2
	strb	r0, [r5, #2433]
	ldr	r3, [r7, #76]
	str	r3, [r5, #2484]
	ldr	r3, [r7, #80]
	str	r3, [r5, #2488]
.L2716:
	ldrb	r3, [r8, #6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2720
	movw	r3, #2426
	ldrh	r2, [r5, r3]
	adds	r3, r2, #0
	movne	r3, #1
.L2720:
	ldrb	r2, [r7, #17]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2721
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L2880
.L2721:
	strb	r2, [r5, #2434]
	b	.L2630
.L2869:
	ldr	r3, [r5, #2456]
	add	r3, r4, r3
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2739
	b	.L2738
.L2863:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L2612
.L2866:
	ldr	r0, [r4, #2364]
	bl	BsGet
	str	r0, [r5, #2464]
	cmp	r0, #0
	ldr	r2, [r8, #192]
	ldr	r3, [r8, #188]
	mul	r3, r3, r2
	blt	.L2629
	cmp	r3, r0
	bls	.L2629
	mul	r3, r10, r0
	str	r3, [fp, #-68]
	b	.L2627
.L2722:
	ldr	r1, .L2907+16
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r7, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	ldreq	r3, [r8, #192]
	subeq	r3, r3, #1
	mov	r6, r0
	beq	.L2726
	cmp	r3, #256
	ldreq	r2, [r7, #68]
	ldreq	r3, [r7, #72]
	ldrne	r3, [r8, #192]
	ldrne	r2, [r7, #68]
	mul	r3, r3, r2
	sub	r3, r3, #1
.L2726:
	movw	r2, #439
	cmp	r3, r2
	movcs	r3, r2
	cmp	r6, r3
	bhi	.L2881
	cmp	r6, #0
	beq	.L2729
	ldr	r1, .L2907+20
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #31
	add	r8, r0, #1
	movls	r9, #0
	bhi	.L2882
.L2731:
	add	r9, r9, #1
	mov	r1, r8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r9, r6
	bne	.L2731
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2724
.L2868:
	ldr	r1, .L2907+24
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	cmp	r0, #256
	mov	r7, r0
	bhi	.L2883
	ldr	r0, [r4, #2364]
	bl	BsResidBits
	cmp	r7, r0
	bhi	.L2735
	cmp	r7, #0
	movne	r6, #0
	beq	.L2724
.L2737:
	add	r6, r6, #1
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	cmp	r6, r7
	bne	.L2737
	b	.L2724
.L2873:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2884
	ldr	r3, [r8, #116]
	mov	r2, #1
	ldr	r6, [r4, #184]
	mov	r3, r2, asl r3
	str	r3, [fp, #-80]
	mov	r1, r3
	mov	r0, r6
	bl	__aeabi_uidivmod
	cmp	r1, #0
	rsb	r3, r1, r6
	streq	r1, [fp, #-76]
	beq	.L2640
	ldr	r2, [fp, #-80]
	cmp	r1, r2, lsr #1
	mov	r2, #0
	str	r2, [fp, #-76]
	bcs	.L2753
.L2640:
	ldr	r2, [r5, #2452]
	ldr	r1, [fp, #-48]
	sub	r2, r2, #16
	cmp	r2, #2
	add	r9, r1, #52
	ldr	r2, [fp, #-76]
	movls	r3, #0
	add	r3, r3, r2
	str	r3, [r5, #2436]
	ldr	r2, [r4, r9, asl #2]
	cmp	r3, r2
	bgt	.L2642
	ldrb	r0, [r5, #2424]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L2885
.L2642:
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	ldreq	r3, [r5, #2436]
	streq	r3, [r4, #188]
	ldr	r3, [r5, #2448]
	cmp	r3, #0
	bne	.L2644
	ldr	r3, [r5, #2452]
	cmp	r3, #15
	bhi	.L2645
	tst	r3, #1
	movne	r2, #1
	beq	.L2645
.L2646:
	sub	r3, r3, #7
	bics	r3, r3, #2
	andne	r3, r2, #1
	moveq	r3, #0
	cmp	r3, #0
	ldrne	r3, [r5, #2436]
	strne	r3, [r4, #184]
.L2644:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L2647
	ldr	r3, [r8, #176]
	mov	r1, #0
	cmp	r3, #1
	movhi	r2, #1
	bls	.L2649
.L2651:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L2651
	cmp	r1, #0
	bne	.L2886
.L2652:
	mov	r2, #164
	add	r0, r5, #3344
	mla	r1, r2, r1, r8
	add	r3, r4, #7424
	add	r0, r0, #12
	add	r3, r3, #28
	str	r3, [fp, #-84]
	add	r1, r1, #2144
	add	r1, r1, #4
	bl	memcpy
.L2650:
	ldrb	r3, [r8, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2654
	ldr	r3, [r8, #180]
	ldr	r6, [r5, #3360]
	cmp	r3, #0
	ldr	r2, [r5, #3356]
	streq	r3, [fp, #-48]
	add	r6, r6, r2
	streq	r3, [fp, #-56]
	bne	.L2887
.L2655:
	ldr	r1, .L2907+28
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r5, #3356]
	ldr	r1, [r5, #3360]
	ldr	ip, [fp, #-48]
	add	r2, r1, r3
	add	r0, r0, ip
	str	r0, [fp, #-60]
	add	r2, r2, r0
	cmp	r2, #16
	bhi	.L2888
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	add	r3, r6, r3
	str	r3, [fp, #-88]
	beq	.L2671
	ldr	r3, [fp, #-88]
	str	r7, [fp, #-92]
	add	r9, r3, #7424
	add	r2, r3, #1648
	add	r9, r9, #39
	add	r2, r2, #3
	add	r3, r4, r9
	add	r10, r4, r2, lsl #2
	mov	r1, r3
	mov	r3, #0
	mov	r9, r3
	str	r3, [fp, #-52]
	mov	r7, r1
	b	.L2670
.L2892:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ldreq	r0, [fp, #-56]
	bne	.L2889
.L2662:
	add	r1, r8, r0
	add	r0, r8, r0, lsl #2
	ldrb	r1, [r1, #13]	@ zero_extendqisi2
	ldr	r6, [r0, #196]
	strb	r1, [r7]
.L2665:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	bne	.L2890
	ldr	r3, [fp, #-48]
	str	r6, [r10, #944]
	cmp	r9, r3
	cmpne	r9, #0
	ldr	r3, [fp, #-52]
	str	r0, [r10]
	ldr	r1, [r5, #2436]
	moveq	r3, #0
	str	r3, [fp, #-52]
	rsb	r6, r1, r6
	str	r6, [r10, #876]
.L2668:
	ldr	r3, [fp, #-60]
	add	r9, r9, #1
	sub	r10, r10, #4
	sub	r7, r7, #1
	cmp	r9, r3
	beq	.L2891
.L2670:
	ldr	r3, [fp, #-48]
	cmp	r3, r9
	bhi	.L2892
	ldr	r1, [r8, #120]
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	mov	r6, r0
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r7]
	b	.L2665
.L2740:
	cmp	r3, #0
	beq	.L2741
	ldr	r3, [r5, #2456]
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	add	r3, r4, r3
	strb	r2, [r3, #5]
	b	.L2739
.L2870:
	ldr	r2, [r5, #2452]
	cmp	r2, #21
	moveq	r2, #1
	streqb	r2, [r3, #4]
	bne	.L2739
	b	.L2743
.L2884:
	ldr	r1, [r8, #120]
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r3, [r8, #116]
	mov	r2, #1
	ldr	r6, [r4, #184]
	mov	r3, r2, asl r3
	str	r3, [fp, #-80]
	mov	r1, r3
	mov	r9, r0
	str	r0, [fp, #-76]
	mov	r0, r6
	bl	__aeabi_uidivmod
	cmp	r9, r1
	rsb	r3, r1, r6
	bcs	.L2639
	ldr	r2, [fp, #-76]
	ldr	r0, [fp, #-80]
	rsb	r2, r2, r1
	cmp	r2, r0, lsr #1
	bcc	.L2639
.L2753:
	ldr	r2, [fp, #-80]
	add	r3, r3, r2
	b	.L2640
.L2645:
	sub	r2, r3, #16
	cmp	r2, #7
	movhi	r2, #0
	movls	r2, #1
	b	.L2646
.L2890:
	ldr	r1, .L2907+32
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-48]
	cmp	r9, #0
	cmpne	r9, r3
	ldrne	r3, [fp, #-52]
	addne	r0, r0, r3
	mov	r3, #1
	str	r3, [r10]
	ldr	r3, [fp, #-76]
	ldr	r1, [r5, #2436]
	str	r0, [fp, #-52]
	rsb	ip, r3, r1
	ldr	r3, [fp, #-80]
	add	r6, ip, r6
	mls	r0, r3, r0, r6
	rsb	r1, r1, r0
	str	r1, [r10, #876]
	str	r0, [r10, #944]
	b	.L2668
.L2889:
	ldr	r1, [fp, #-72]
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r1, [r8, #180]
	sub	r1, r1, #1
	cmp	r0, #0
	blt	.L2664
	cmp	r1, r0
	bcs	.L2662
.L2664:
	str	r1, [sp, #4]
	mov	r3, r9
	str	r0, [sp]
	movw	r1, #7175
	ldr	r2, .L2907+36
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2874:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #2429]
	cmp	r0, #0
	bne	.L2893
	ldr	r3, [r5, #2444]
	ldr	r2, [r7, #40]
	cmp	r3, #0
	str	r2, [r5, #2500]
	bne	.L2682
	ldr	r2, [r7, #44]
	mov	r6, r3
	mov	r9, r3
	str	r2, [r5, #2504]
.L2683:
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	beq	.L2894
	ldr	r3, [fp, #-84]
	ldr	r3, [r3, #8]
	cmp	r3, #16
	bhi	.L2686
	cmp	r3, #0
	moveq	r1, r3
	beq	.L2688
	ldr	r1, [fp, #-84]
	add	r3, r3, #11
	add	r2, r1, #11
	add	r1, r1, r3
	mov	r3, #0
.L2690:
	ldrb	r0, [r2, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	addne	r3, r3, #1
	cmp	r2, r1
	bne	.L2690
	cmp	r3, #1
	movle	r1, #0
	movgt	r1, #1
.L2688:
	ldrb	r2, [r7, #22]	@ zero_extendqisi2
	cmp	r2, #0
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	beq	.L2895
	add	r1, r4, #6464
	add	r2, r4, #7616
	add	r1, r1, #56
	mov	r0, r4
	bl	HEVC_DecRefPicListsModification
	cmp	r0, #0
	bne	.L2896
.L2684:
	ldr	r3, [r5, #2444]
	cmp	r3, #0
	beq	.L2750
.L2691:
	cmp	r3, #2
	beq	.L2676
.L2751:
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2897
.L2692:
	ldrb	r3, [r5, #2428]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r5, #2444]
	beq	.L2701
	cmp	r3, #0
	beq	.L2898
	cmp	r3, #2
	mov	r3, #1
	strb	r3, [r5, #2432]
	beq	.L2698
.L2697:
	ldr	r3, [r5, #2500]
	cmp	r3, #1
	bls	.L2852
.L2700:
	ldr	r1, .L2907+40
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldrb	r3, [r5, #2432]	@ zero_extendqisi2
	cmp	r3, #0
	subne	r6, r9, #1
	subeq	r6, r6, #1
	cmp	r6, r0
	str	r0, [r5, #2468]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r2, r2, r0, lsr #31
	bne	.L2704
.L2852:
	ldr	r3, [r5, #2444]
	b	.L2701
.L2741:
	ldr	r3, [r5, #2456]
	add	r3, r4, r3
	b	.L2739
.L2853:
	ldrb	r0, [r5, #2433]	@ zero_extendqisi2
	b	.L2716
.L2891:
	ldr	r7, [fp, #-92]
.L2671:
	ldr	r3, [fp, #-88]
	cmp	r3, #16
	str	r3, [r5, #3364]
	bhi	.L2899
.L2654:
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r5, #2428]
	bne	.L2900
.L2673:
	ldrb	r3, [r8, #6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2748
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2426]
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r5, #2427]
	b	.L2748
.L2895:
	ldr	r3, [r5, #2444]
	cmp	r3, #0
	bne	.L2751
.L2750:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r3, [r5, #2444]
	strb	r0, [r5, #2430]
	b	.L2691
.L2872:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	b	.L2636
.L2614:
	str	r3, [sp, #4]
	movw	r1, #6923
	str	r0, [sp]
	mov	r0, #1
	ldr	r3, .L2907+44
	ldr	r2, .L2907+48
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2878:
	ldr	r1, .L2907+52
	ldr	r0, [r4, #2364]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r5, #2476]
	cmp	r3, #24
	bhi	.L2901
	ldr	r2, [r7, #60]
	add	r3, r0, r2
	add	r3, r3, #12
	cmp	r3, #24
	bhi	.L2902
	ldr	r1, .L2907+56
	ldr	r0, [r4, #2364]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r5, #2480]
	cmp	r3, #24
	bhi	.L2903
	ldr	r3, [r7, #64]
	add	r3, r0, r3
	add	r2, r3, #12
	cmp	r2, #24
	bls	.L2711
	ldr	r2, .L2907+60
	movw	r1, #7485
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2897:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r5, #2431]
	b	.L2692
.L2682:
	mov	r6, r0
	mov	r9, r0
	str	r0, [r5, #2504]
.L2681:
	cmp	r3, #2
	bne	.L2683
	b	.L2684
.L2647:
	add	r6, r4, #7424
	ldr	r3, [r8, #176]
	add	r6, r6, #28
	mov	r1, r8
	mov	r0, r4
	mov	r2, r6
	bl	HEVC_DecShortTermRefPicSet
	cmp	r0, #0
	streq	r6, [fp, #-84]
	beq	.L2650
	ldr	r2, .L2907+64
	movw	r1, #7101
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2639:
	ldr	r2, [fp, #-76]
	cmp	r2, r1
	bls	.L2640
	rsb	r1, r1, r2
	ldr	r2, [fp, #-80]
	cmp	r1, r2, lsr #1
	rsbhi	r3, r2, r3
	b	.L2640
.L2856:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2426]
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r5, #2427]
	b	.L2746
.L2893:
	ldr	r1, .L2907+68
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	add	r9, r0, #1
	cmp	r9, #16
	bhi	.L2904
	ldr	r3, [r5, #2444]
	str	r9, [r5, #2500]
	cmp	r3, #0
	movne	r6, #0
	strne	r6, [r5, #2504]
	bne	.L2681
	ldr	r1, .L2907+72
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	add	r6, r0, #1
	cmp	r6, #16
	strls	r6, [r5, #2504]
	ldrls	r3, [r5, #2444]
	bls	.L2681
	mov	r0, #16
	mov	r3, r6
	str	r0, [sp]
	movw	r1, #7303
	ldr	r2, .L2907+76
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2886:
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r3, [r8, #176]
	subs	r1, r0, #0
	sublt	r3, r3, #1
	blt	.L2653
.L2649:
	sub	r3, r3, #1
	cmp	r3, r1
	bcs	.L2652
.L2653:
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r1
	ldr	r2, .L2907+80
	movw	r1, #7123
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2898:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	ldr	r3, [r5, #2444]
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r5, #2432]
	beq	.L2709
	cmp	r0, #0
	bne	.L2697
	ldr	r2, [r5, #2504]
	cmp	r2, #1
	bhi	.L2700
	b	.L2701
.L2698:
	mov	r3, #2
	b	.L2705
.L2883:
	mov	r3, r0
	ldr	r2, .L2907+84
	movw	r1, #7593
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2899:
	mov	r0, #16
	ldr	r3, [fp, #-88]
	str	r0, [sp]
	movw	r1, #7226
	ldr	r2, .L2907+88
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2623:
	str	r3, [sp]
	movw	r1, #6958
	mov	r3, r10
	ldr	r2, .L2907+92
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2900:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r5, #2428]
	b	.L2673
.L2880:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	strb	r0, [r5, #2434]
	b	.L2630
.L2879:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	tst	r0, #255
	beq	.L2717
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #2433]
	cmp	r0, #0
	bne	.L2716
	ldr	r1, .L2907+96
	ldr	r0, [r4, #2364]
	bl	HEVC_se_v
	add	r2, r0, #6
	mov	r3, r0
	cmp	r2, #12
	str	r0, [r5, #2484]
	bhi	.L2905
.L2718:
	ldr	r1, .L2907+100
	ldr	r0, [r4, #2364]
	bl	HEVC_se_v
	add	r2, r0, #6
	mov	r3, r0
	cmp	r2, #12
	str	r0, [r5, #2488]
	bls	.L2853
	ldr	r2, .L2907+104
	movw	r1, #7520
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r7, #80]
	ldrb	r0, [r5, #2433]	@ zero_extendqisi2
	str	r3, [r5, #2488]
	b	.L2716
.L2864:
	ldr	r3, [r4, #232]
	mov	r0, r4
	cmp	r3, #0
	ldrne	r3, [r4, #188]
	str	r3, [r5, #2436]
	bl	HEVC_IsNewPic
	ldr	r2, .L2907+108
	movw	r1, #6939
	str	r0, [r5, #2576]
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2887:
	ldr	r1, .L2907+112
	ldr	r0, [r4, #2364]
	bl	HEVC_ue_v
	ldr	r3, [r8, #180]
	cmp	r0, r3
	str	r0, [fp, #-48]
	bhi	.L2906
	cmp	r3, #1
	movls	r3, #0
	strls	r3, [fp, #-56]
	bls	.L2655
	mov	r2, #0
	mov	r1, r2
	mov	r2, #1
.L2657:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L2657
	str	r1, [fp, #-72]
	str	r1, [fp, #-56]
	b	.L2655
.L2877:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L2907+116
	movw	r1, #7453
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2885:
	str	r3, [sp]
	movw	r1, #7077
	mov	r3, r2
	ldr	r2, .L2907+120
	bl	dprint_normal
	b	.L2642
.L2629:
	str	r3, [sp]
	movw	r1, #6977
	mov	r3, r0
	ldr	r2, .L2907+124
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2871:
	mov	r3, r0
	ldr	r2, .L2907+128
	movw	r1, #7011
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2686:
	mov	r0, #16
	ldr	r2, .L2907+132
	str	r0, [sp]
	movw	r1, #7344
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2876:
	mov	r3, r0
	ldr	r2, .L2907+136
	movw	r1, #7443
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2704:
	stmia	sp, {r0, r6}
	movw	r1, #7418
	ldr	r2, .L2907+140
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2881:
	str	r3, [sp]
	movw	r1, #7566
	mov	r3, r6
	ldr	r2, .L2907+144
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2735:
	mov	r3, r0
	str	r7, [sp]
	ldr	r2, .L2907+148
	movw	r1, #7601
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2905:
	ldr	r2, .L2907+152
	movw	r1, #7511
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, [r7, #76]
	str	r3, [r5, #2484]
	b	.L2718
.L2902:
	str	r2, [sp]
	mov	r3, r0
	ldr	r2, .L2907+156
	movw	r1, #7470
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2908:
	.align	2
.L2907:
	.word	.LC349
	.word	.LC354
	.word	.LC376
	.word	.LC378
	.word	.LC390
	.word	.LC392
	.word	.LC394
	.word	.LC361
	.word	.LC364
	.word	.LC363
	.word	.LC373
	.word	.LANCHOR0+784
	.word	.LC350
	.word	.LC380
	.word	.LC383
	.word	.LC385
	.word	.LC357
	.word	.LC366
	.word	.LC368
	.word	.LC369
	.word	.LC358
	.word	.LC395
	.word	.LC365
	.word	.LC352
	.word	.LC386
	.word	.LC388
	.word	.LC389
	.word	.LC351
	.word	.LC359
	.word	.LC379
	.word	.LC356
	.word	.LC353
	.word	.LC355
	.word	.LC371
	.word	.LC377
	.word	.LC374
	.word	.LC391
	.word	.LC396
	.word	.LC387
	.word	.LC382
	.word	.LC381
	.word	.LC384
	.word	.LC362
	.word	.LC375
	.word	.LC360
	.word	.LC367
	.word	.LC370
	.word	.LC372
	.word	.LC393
.L2901:
	mov	r3, r0
	ldr	r2, .L2907+160
	movw	r1, #7463
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2903:
	mov	r3, r0
	ldr	r2, .L2907+164
	movw	r1, #7478
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2888:
	mov	r2, r0
	mov	r0, #16
	stmia	sp, {r1, r2}
	movw	r1, #7159
	str	r0, [sp, #8]
	mov	r0, #1
	ldr	r2, .L2907+168
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2875:
	ldr	r2, .L2907+172
	movw	r1, #7432
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2906:
	str	r3, [sp]
	movw	r1, #7142
	mov	r3, r0
	ldr	r2, .L2907+176
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2904:
	mov	r0, #16
	mov	r3, r9
	str	r0, [sp]
	movw	r1, #7291
	ldr	r2, .L2907+180
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2894:
	ldr	r2, .L2907+184
	movw	r1, #7338
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2896:
	ldr	r2, .L2907+188
	movw	r1, #7374
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
.L2882:
	mov	r3, r8
	ldr	r2, .L2907+192
	movw	r1, #7576
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L2848
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
	ldr	r1, [r0, #2384]
	mov	r4, r0
	cmp	r1, #0
	beq	.L2910
	ldr	r0, [r0, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L2910:
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
	ldr	r1, [r0, #2384]
	mov	r4, r0
	cmp	r1, #0
	beq	.L2916
	ldr	r0, [r0, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L2916:
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
	ldr	r2, [r0, #172]
	mov	r5, r0
	cmp	r2, #0
	beq	.L2924
	mov	r4, #0
	mov	r6, r4
.L2923:
	ldr	r3, [r5, #2404]
	ldr	r1, [r3, r4, asl #2]
	cmp	r1, #0
	beq	.L2922
	ldr	r0, [r5, #248]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r5, #2404]
	str	r6, [r3, r4, asl #2]
	ldr	r2, [r5, #172]
.L2922:
	add	r4, r4, #1
	cmp	r2, r4
	bhi	.L2923
.L2924:
	mov	r0, #0
	mov	r3, #2
	str	r0, [r5, #200]
	str	r0, [r5, #240]
	str	r0, [r5, #232]
	strb	r0, [r5, #11]
	str	r3, [r5, #180]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearAllSlice, .-HEVC_ClearAllSlice
	.align	2
	.global	HEVC_InitDPB
	.type	HEVC_InitDPB, %function
HEVC_InitDPB:
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
	mov	r5, r0
	mov	r8, r1
	bl	HEVC_ClearAllSlice
	add	r9, r5, #2608
	mov	r7, #0
	add	r9, r9, #4
	mov	r4, r5
	mov	r6, r7
.L2935:
	ldr	r3, [r9, #4]!
	add	r7, r7, #1
	cmp	r3, #0
	beq	.L2931
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_ClearLogicFs
.L2931:
	ldr	r3, [r4, #2684]
	cmp	r3, #0
	beq	.L2932
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_ClearLogicFs
.L2932:
	ldr	r3, [r4, #2752]
	cmp	r3, #0
	beq	.L2933
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_ClearLogicFs
.L2933:
	ldr	r3, [r4, #2820]
	cmp	r3, #0
	beq	.L2934
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_ClearLogicFs
.L2934:
	cmp	r7, #17
	str	r6, [r4, #2820]
	str	r6, [r4, #2752]
	add	r4, r4, #4
	str	r6, [r4, #2680]
	str	r6, [r4, #2612]
	bne	.L2935
	ldr	r3, [r5, #2396]
	ldr	r3, [r3, #184]
	add	r3, r3, #1
	str	r3, [r5, #2592]
	cmp	r3, #17
	bhi	.L2972
.L2936:
	ldr	r3, .L2974
	mov	r4, #0
	add	r0, r5, #14528
	mov	r1, r4
	mov	r2, #200
	str	r4, [r5, #2596]
	ldr	r3, [r3, #48]
	add	r0, r0, #56
	str	r4, [r5, #2608]
	str	r4, [r5, #2612]
	str	r4, [r5, #2604]
	str	r4, [r5, #2600]
	blx	r3
	add	r2, r5, #2416
	add	r3, r5, #2480
	add	r1, r5, #12288
	add	r2, r2, #4
	add	r3, r3, #8
	mov	r0, r4
	mov	ip, #16
	str	r4, [r1, #2300]
	str	ip, [r1, #2296]
.L2937:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L2937
	add	r2, r5, #2544
	add	ip, r5, #4096
	add	r2, r2, #12
	mov	r0, r1
	str	r1, [ip, #2492]
.L2938:
	str	r0, [r3, #4]!
	cmp	r3, r2
	mov	r1, #0
	bne	.L2938
	cmp	r8, r1
	str	r1, [ip, #2496]
	bne	.L2939
	ldr	r3, [r5, #2412]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L2939
.L2940:
	add	r3, r5, #2128
	add	r2, r5, #2208
	add	r3, r3, #8
	add	r2, r2, #8
	mov	r1, #0
.L2943:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L2943
	ldr	r2, [r5, #172]
	cmp	r2, #0
	movne	r4, #0
	movne	r6, r4
	beq	.L2947
.L2946:
	ldr	r3, [r5, #2404]
	mov	r7, r4, asl #2
	ldr	r3, [r3, r4, asl #2]
	add	r4, r4, #1
	cmp	r3, #0
	mov	r1, r3
	beq	.L2945
	ldr	r0, [r5, #2384]
	cmp	r3, r0
	beq	.L2945
	ldr	r0, [r5, #248]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r5, #2404]
	str	r6, [r3, r7]
	ldr	r2, [r5, #172]
.L2945:
	cmp	r2, r4
	bhi	.L2946
.L2947:
	mov	r0, #0
.L2971:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2939:
	mov	r3, #1
	mov	r0, r5
	str	r3, [r5, #144]
	bl	HEVC_ArrangeMem
	cmp	r0, #0
	beq	.L2940
	cmp	r0, #2
	beq	.L2973
	ldr	r3, .L2974+4
	movw	r1, #9918
	ldr	r2, .L2974+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2972:
	str	r7, [sp, #4]
	movw	r1, #9861
	str	r7, [sp]
	mov	r0, #1
	ldr	r3, .L2974+4
	ldr	r2, .L2974+12
	bl	dprint_normal
	str	r7, [r5, #2592]
	b	.L2936
.L2973:
	add	r0, r5, #7872
	add	r0, r0, #8
	bl	ResetVoQueue
	mvn	r0, #1
	b	.L2971
.L2975:
	.align	2
.L2974:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+812
	.word	.LC397
	.word	.LC123
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
	ldr	r2, [r0, #172]
	mov	r6, r0
	cmn	r2, #1
	beq	.L2980
	mov	r4, #0
	mov	r5, r4
	b	.L2979
.L2978:
	add	r3, r2, #1
	cmp	r3, r5
	bls	.L2980
.L2979:
	ldr	r1, [r6, #2408]
	add	r5, r5, #1
	add	r1, r1, r4
	add	r4, r4, #96
	ldr	r3, [r1, #32]
	cmp	r3, #1
	bne	.L2978
	ldr	r0, [r6, #248]
	bl	HEVC_ReleaseNAL
	ldr	r2, [r6, #172]
	add	r3, r2, #1
	cmp	r3, r5
	bhi	.L2979
.L2980:
	mov	r0, #0
	strb	r0, [r6, #7]
	str	r0, [r6, #152]
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
	ldr	r2, .L2999
	mov	r7, r0
	mov	r1, #3184
	mov	r0, #20
	bl	dprint_normal
	mov	r3, #0
	mvn	r1, #-2147483648
	mov	r2, #1
	str	r1, [r7, #224]
	mov	r0, r7
	strb	r2, [r7, #5]
	mov	r2, #-2147483647
	strb	r3, [r7, #4]
	mov	r6, r3
	str	r2, [r7, #208]
	mov	r5, r3
	str	r2, [r7, #228]
	add	r4, r7, #14848
	strb	r3, [r7, #10]
	add	r4, r4, #8
	bl	HEVC_ClearAllNal
	add	r0, r7, #7872
	add	r0, r0, #8
	ldr	r8, .L2999+4
	bl	ResetVoQueue
	mov	r9, #20
.L2984:
	strb	r5, [r4, #-72]
	mov	r3, #16
	str	r5, [r4, #-28]
	mov	r0, r4
	strb	r5, [r4, #-71]
	mov	r2, #536
	str	r5, [r4, #-68]
	mov	r1, #0
	strb	r5, [r4, #-70]
	str	r9, [r4, #-56]
	str	r3, [r4, #-52]
	ldr	r3, [r8, #48]
	blx	r3
	str	r6, [r4, #88]
	add	r6, r6, #1
	sub	r3, r4, #72
	cmp	r6, #20
	str	r5, [r4, #-20]
	str	r3, [r4, #-4]
	add	r4, r4, #608
	bne	.L2984
	add	r3, r7, #2128
	add	r2, r7, #2208
	add	r3, r3, #8
	add	r2, r2, #8
	mov	r1, #0
.L2985:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L2985
	ldr	r3, [r7, #172]
	cmp	r3, #0
	beq	.L2986
	mov	r3, #0
	mov	r1, r3
.L2987:
	ldr	r2, [r7, #2404]
	str	r1, [r2, r3, asl #2]
	add	r3, r3, #1
	ldr	r2, [r7, #172]
	cmp	r2, r3
	bhi	.L2987
.L2986:
	add	r0, r7, #14528
	ldr	r3, [r8, #48]
	mov	r2, #200
	mov	r1, #0
	add	r0, r0, #56
	blx	r3
	add	r3, r7, #12288
	add	ip, r7, #2736
	add	r0, r7, #2672
	add	r1, r7, #2608
	add	ip, ip, #12
	add	r0, r0, #8
	add	r1, r1, #4
	add	lr, r7, #2816
	mov	r2, #16
	str	r2, [r3, #2296]
	mov	r2, #17
	mov	r3, #0
.L2988:
	subs	r2, r2, #1
	str	r3, [lr, #4]!
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [r1, #4]!
	bne	.L2988
	add	r3, r7, #2480
	add	r1, r7, #2416
	add	ip, r7, #2544
	add	r3, r3, #8
	add	r1, r1, #4
	add	ip, ip, #12
	mov	r0, r2
	mov	lr, #17
	str	r2, [r7, #2596]
	str	r2, [r7, #2600]
	str	r2, [r7, #2604]
	str	r2, [r7, #2608]
	str	r2, [r7, #2612]
	str	lr, [r7, #2592]
.L2989:
	str	r0, [r3, #4]!
	cmp	r3, ip
	str	r0, [r1, #4]!
	mov	r4, #0
	bne	.L2989
	add	r0, r7, #6464
	mov	r5, #2
	mov	r1, r4
	str	r4, [r7, #2384]
	str	r4, [r7, #200]
	movw	r2, #1356
	str	r4, [r7, #240]
	add	r0, r0, #56
	str	r4, [r7, #232]
	add	r6, r7, #2560
	ldr	r3, [r8, #48]
	mov	r9, #16
	str	r5, [r7, #180]
	blx	r3
	add	r3, r7, #4096
	mov	r2, #1
	mov	r1, r4
	str	r2, [r3, #2576]
	mov	lr, #256
	str	r5, [r3, #2444]
	movw	ip, #1025
	mov	r3, #8
	strb	r2, [r7, #3]
	strb	r4, [r7, #6]
	mov	r2, #64
	str	r4, [r7, #176]
	mov	r0, r6
	str	r3, [r7, #192]
	str	r3, [r7, #196]
	mov	r3, #6
	str	r2, [r7, #336]
	mov	r2, #32
	str	r5, [r7, #2232]
	ldr	r4, [r8, #48]
	str	r9, [r7, #332]
	str	lr, [r7, #340]
	str	ip, [r7, #344]
	str	r3, [r7, #2220]
	str	r3, [r7, #2224]
	str	r3, [r7, #2228]
	blx	r4
	str	r6, [r7, #2364]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3000:
	.align	2
.L2999:
	.word	.LC398
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
	ldr	r3, [r4, #1884]
	cmp	r3, #0
	beq	.L3002
	ldr	r1, [r3, #24]
	ldr	r0, [r5, #248]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #1884]
	mov	r3, #0
	str	r3, [r2, #44]
	str	r3, [r4, #1884]
.L3002:
	mov	r0, #0
	strb	r0, [r4, #1825]
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
	bne	.L3009
	add	r0, r4, #7872
	add	r0, r0, #8
	bl	ResetVoQueue
	ldr	r0, [r4, #248]
	bl	FSP_ResetInstance
.L3008:
	mov	r0, r4
	bl	HEVC_InitDecPara
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3009:
	add	r1, r4, #7872
	ldr	r0, [r4, #248]
	add	r1, r1, #8
	bl	FSP_ClearNotInVoQueue
	b	.L3008
	UNWIND(.fnend)
	.size	HEVC_ClearAll, .-HEVC_ClearAll
	.align	2
	.global	HEVC_InitPic
	.type	HEVC_InitPic, %function
HEVC_InitPic:
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
	mov	r4, r0
	ldr	r2, [r4, #268]
	add	r0, r0, #4096
	ldr	r3, [r4, #260]
	ldr	r8, [r4, #264]
	str	r2, [fp, #-56]
	ldr	r2, [r4, #276]
	str	r3, [fp, #-48]
	ldr	r3, [r0, #2460]
	str	r2, [fp, #-52]
	ldr	r2, [r4, #280]
	cmp	r3, #0
	ldr	r9, [r4, #272]
	str	r2, [fp, #-60]
	blt	.L3027
	ldr	r2, [r4, #168]
	cmp	r3, r2
	bge	.L3027
	ldr	r2, [r4, #2376]
	mov	r1, #1888
	movw	r7, #12644
	ldr	ip, [r4, #2372]
	ldr	r0, [r0, #2456]
	mla	r2, r1, r3, r2
	mov	lr, ip
	add	r0, r4, r0, lsl #2
	str	ip, [fp, #-72]
	ldr	ip, [r4, #2368]
	ldr	r1, [r2, #32]
	mul	r7, r7, r1
	add	r6, lr, r7
	ldr	r1, [r6, #48]
	str	r3, [r0, #220]
	ldr	lr, [r2, #32]
	mov	r3, r1, asl #7
	sub	r1, r3, r1, asl #3
	str	lr, [r0, #216]
	add	r1, ip, r1
	ldr	r3, [r6, #48]
	str	r3, [r0, #212]
	ldr	r5, [r6, #128]
	ldr	r3, [r4, #176]
	subs	r5, r9, r5
	ldr	r0, [r6, #64]
	clz	r10, r3
	movne	r5, #1
	cmp	r8, r0
	mov	r10, r10, lsr #5
	movne	r3, #1
	strne	r3, [fp, #-64]
	beq	.L3047
.L3012:
	ldr	r0, [r4, #2392]
	orr	r5, r5, r10
	ldr	ip, [r1, #4]
	ldr	r3, [fp, #-64]
	ldr	r0, [r0, #4]
	orr	r5, r3, r5
	cmp	r0, ip
	movne	r0, #1
	beq	.L3048
.L3013:
	orrs	r3, r0, r10
	beq	.L3014
	mov	r0, r4
	str	r2, [fp, #-68]
	bl	HEVC_UpdatePicVPS
	ldr	r2, [fp, #-68]
.L3014:
	ldr	r1, [r4, #2396]
	ldr	r0, [r6, #56]
	ldr	ip, [r1, #56]
	cmp	ip, r0
	movne	r7, #1
	beq	.L3049
.L3015:
	orrs	r7, r7, r5
	beq	.L3016
	ldr	ip, [r1, #184]
	mov	r0, r4
	ldr	r7, [r6, #184]
	mov	r1, r6
	str	r2, [fp, #-68]
	subs	r7, r7, ip
	movne	r7, #1
	bl	HEVC_UpdatePicSPS
	ldr	r2, [fp, #-68]
.L3016:
	ldr	r0, [r4, #2400]
	ldr	r1, [r2, #28]
	ldr	r0, [r0, #28]
	cmp	r0, r1
	movne	r1, #1
	beq	.L3050
.L3017:
	orrs	r3, r1, r5
	beq	.L3018
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_UpdatePicPPS
.L3018:
	ldr	r2, [r4, #276]
	ldr	r3, [fp, #-52]
	cmp	r3, r2
	movne	r1, #1
	beq	.L3051
.L3019:
	ldr	r0, [r4, #2396]
	ldr	ip, [r4, #2412]
	ldr	r3, [fp, #-48]
	ldr	r2, [r0, #96]
	ldr	r0, [r0, #88]
	cmp	r2, r0
	movcc	r2, r0
	str	r2, [ip, #852]
	ldr	r2, [r6, #56]
	cmp	r3, r2
	beq	.L3052
.L3020:
	str	r7, [sp]
	mov	r3, r9
	ldr	r2, [fp, #-56]
	mov	r1, r8
	mov	r0, r4
	bl	HEVC_GetReRangeFlag
	cmp	r0, #0
	bne	.L3021
	ldr	r3, [r4, #2412]
	ldr	r2, [r3, #848]
	cmp	r2, #1
	beq	.L3021
.L3023:
	mov	r2, #0
	str	r2, [r3, #856]
.L3022:
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	bne	.L3025
	mov	r0, r4
	bl	HEVC_AllocFrameStore
	subs	r5, r0, #0
	bne	.L3053
.L3025:
	mov	r0, r4
	bl	HEVC_InitPicInfo
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3027:
	mov	r0, #0
.L3011:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3052:
	ldr	r3, [fp, #-64]
	orr	r10, r3, r10
	orr	r10, r10, r7
	orrs	r3, r10, r1
	bne	.L3020
	ldr	r3, [r4, #2412]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	bne	.L3022
.L3021:
	mov	r1, #1
	mov	r0, r4
	bl	HEVC_InitDPB
	cmn	r0, #2
	beq	.L3011
	cmp	r0, #0
	bne	.L3024
	ldr	r3, [r4, #2412]
	b	.L3023
.L3051:
	ldr	r1, [r4, #280]
	ldr	r3, [fp, #-60]
	subs	r1, r3, r1
	movne	r1, #1
	b	.L3019
.L3050:
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	adds	r1, r1, #0
	movne	r1, #1
	b	.L3017
.L3049:
	ldr	r3, [fp, #-72]
	ldrb	r7, [r3, r7]	@ zero_extendqisi2
	adds	r7, r7, #0
	movne	r7, #1
	b	.L3015
.L3048:
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	b	.L3013
.L3047:
	ldr	r3, [r6, #68]
	ldr	r0, [fp, #-56]
	subs	r3, r0, r3
	movne	r3, #1
	str	r3, [fp, #-64]
	b	.L3012
.L3053:
	ldr	r2, .L3054
	movw	r1, #9407
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	b	.L3011
.L3024:
	mov	r3, r0
	ldr	r2, .L3054+4
	movw	r1, #9389
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L3011
.L3055:
	.align	2
.L3054:
	.word	.LC400
	.word	.LC399
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
	mov	r2, #536
	add	r1, r5, #1888
	ldr	r4, [r5, #1884]
	add	r0, r4, #72
	ldr	r3, [r4, #44]
	cmp	r3, #1
	movne	r3, #2
	strne	r3, [r4, #44]
	ldr	r3, [r5, #1864]
	str	r3, [r4, #12]
	bl	memcpy
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_GetImagePara
	ldrb	r3, [r5, #1824]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3067
.L3058:
	add	r1, r4, #24
	mov	r0, r6
	bl	HEVC_OutputFrame.isra.10
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, .L3068
	movw	r1, #10659
	ldr	r2, .L3068+4
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r6
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3067:
	mov	r2, #1
	ldr	r1, [r4, #24]
	ldr	r0, [r6, #248]
	bl	FSP_SetRef
	b	.L3058
.L3069:
	.align	2
.L3068:
	.word	.LANCHOR0+828
	.word	.LC401
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
	bne	.L3073
	add	r3, r4, #4096
	add	r2, r4, #12288
	mov	r1, #1
	mov	ip, #2
	ldr	r0, [r3, #1884]
	str	ip, [r0, #48]
	str	r1, [r2, #936]
	ldr	r2, [r3, #1832]
	ldr	r0, [r3, #1836]
	add	r2, r2, #52
	str	r0, [r4, r2, asl #2]
	mov	r0, r5
	ldr	r3, [r3, #1884]
	strb	r1, [r3, #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3073:
	ldr	r3, .L3074
	movw	r1, #10676
	ldr	r2, .L3074+4
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3075:
	.align	2
.L3074:
	.word	.LANCHOR0+848
	.word	.LC402
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
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L3081
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r6, r0, #0
	beq	.L3085
	cmn	r6, #3
	bne	.L3086
.L3080:
	mov	r0, #0
.L3077:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3085:
	add	r1, r5, #24
	mov	r0, r4
	bl	HEVC_OutputFrame.isra.10
	cmp	r0, #0
	beq	.L3080
	ldr	r3, .L3087
	movw	r1, #11508
	ldr	r2, .L3087+4
	mov	r0, r6
	bl	dprint_normal
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L3077
.L3086:
	mov	r3, #11520
	ldr	r2, .L3087+8
	mov	r1, r3
	str	r6, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r5, #160]
	mov	r0, r4
	bl	HEVC_DECRecycleImage
	mvn	r0, #0
	b	.L3077
.L3081:
	mvn	r0, #0
	b	.L3077
.L3088:
	.align	2
.L3087:
	.word	.LANCHOR0+872
	.word	.LC401
	.word	.LC403
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r6, r0, #4096
	mov	ip, #2
	mov	r7, #0
	mov	r3, #1
	ldr	r4, [r6, #1884]
	mov	r5, r0
	add	r1, r6, #1888
	mov	r2, #536
	add	r0, r4, #72
	str	ip, [r4, #44]
	strb	r3, [r4, #2]
	strb	r7, [r4, #1]
	ldr	r3, [r6, #1840]
	str	r3, [r4, #8]
	ldr	r3, [r6, #1864]
	str	r3, [r4, #12]
	bl	memcpy
	mov	r2, r7
	str	r7, [r4, #52]
	ldr	r1, [r4, #24]
	ldr	r0, [r5, #248]
	bl	FSP_SetRef
	mov	r1, r4
	mov	r0, r5
	bl	HEVC_OutputFrmToVO
	ldr	r3, .L3094
	str	r7, [r4, #44]
	mov	r1, r7
	mov	r2, #600
	ldr	r3, [r3, #48]
	mov	r8, r0
	add	r0, r5, #5888
	add	r0, r0, #32
	blx	r3
	ldr	r3, [r6, #1860]
	cmp	r3, #20
	beq	.L3090
	add	r3, r3, #532
	mov	r2, #20
	add	r3, r3, #2
	add	r5, r5, r3, lsl #2
	str	r7, [r5, #4]
	str	r2, [r6, #1860]
.L3090:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3095:
	.align	2
.L3094:
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_DirectOutput
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
	ldr	lr, [r0, #2596]
	mov	r5, r0
	cmp	lr, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #2608
	mvn	ip, #-2147483648
	add	r0, r0, #4
	mvn	r4, #0
	mov	r3, #0
.L3100:
	ldr	r2, [r0, #4]!
	ldr	r1, [r2, #4]
	cmp	r1, ip
	bge	.L3099
	ldr	r2, [r2]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	moveq	ip, r1
	moveq	r4, r3
.L3099:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L3100
	cmn	r4, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r3, r5, r4, lsl #2
	mov	r1, #1
	mov	r0, r5
	ldr	r2, [r3, #2616]
	strb	r1, [r2, #2]
	ldr	r1, [r3, #2616]
	bl	HEVC_OutputFrmToVO
	mov	r1, r4
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVC_RemoveFrameStoreOutDPB
	UNWIND(.fnend)
	.size	HEVC_RemoveFrmFullDPB, .-HEVC_RemoveFrmFullDPB
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
	ldr	r3, [r4, #2616]
	strb	r2, [r3, #2]
	ldr	r1, [r4, #2616]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r4, #2616]
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #4]
	add	r2, r2, #52
	str	r1, [r5, r2, asl #2]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r0
	bne	.L3109
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
.L3109:
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
	bne	.L3114
	mov	r0, r4
	ldr	r1, [fp, #-24]
	bl	HEVC_OutputOneFrmFromDPB
	cmp	r0, #0
	bne	.L3115
.L3112:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3114:
	ldr	r3, .L3116
	movw	r1, #6481
	ldr	r2, .L3116+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3112
.L3115:
	ldr	r3, .L3116
	movw	r1, #6489
	ldr	r2, .L3116+8
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3112
.L3117:
	.align	2
.L3116:
	.word	.LANCHOR0+892
	.word	.LC404
	.word	.LC405
	UNWIND(.fnend)
	.size	HEVC_OutputUnRefPicWithMinPoc, .-HEVC_OutputUnRefPicWithMinPoc
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
	ldr	r1, [r0, #2596]
	mov	r4, r0
	cmp	r1, #0
	beq	.L3120
	add	r6, r0, #2608
	mov	r5, #0
	add	r6, r6, #4
	mov	r7, r5
	b	.L3122
.L3121:
	cmp	r1, r5
	bls	.L3120
.L3122:
	ldr	r3, [r6, #4]!
	add	r5, r5, #1
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3121
	strb	r7, [r3, #1]
	mov	r2, #0
	ldr	r1, [r3, #24]
	ldr	r0, [r4, #248]
	bl	FSP_SetRef
	ldr	r1, [r4, #2596]
	cmp	r1, r5
	bhi	.L3122
.L3120:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L3124
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L3120
	b	.L3124
.L3126:
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	beq	.L3125
.L3124:
	ldr	r3, [r4, #2596]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L3126
	mov	r0, r3
.L3125:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FlushDPB, .-HEVC_FlushDPB
	.align	2
	.global	HEVC_FlushOutputFrmFromDPB
	.type	HEVC_FlushOutputFrmFromDPB, %function
HEVC_FlushOutputFrmFromDPB:
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
	bl	HEVC_FlushDPB
	subs	r4, r0, #0
	bne	.L3137
	mov	r0, r5
	bl	HEVC_InitDecBuffers
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3137:
	ldr	r3, .L3138
	movw	r1, #11433
	ldr	r2, .L3138+4
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3139:
	.align	2
.L3138:
	.word	.LANCHOR0+924
	.word	.LC406
	UNWIND(.fnend)
	.size	HEVC_FlushOutputFrmFromDPB, .-HEVC_FlushOutputFrmFromDPB
	.align	2
	.global	HEVC_ClearDPB
	.type	HEVC_ClearDPB, %function
HEVC_ClearDPB:
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
	bl	HEVC_FlushDPB
	cmp	r0, #0
	beq	.L3141
	str	r0, [sp]
	movw	r1, #14003
	ldr	r3, .L3145
	mov	r0, #0
	ldr	r2, .L3145+4
	bl	dprint_normal
.L3141:
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3146:
	.align	2
.L3145:
	.word	.LANCHOR0+952
	.word	.LC407
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
	b	.L3148
.L3150:
	stmia	sp, {ip, lr}
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L3156
.L3148:
	ldr	ip, [r4, #2596]
	movw	r1, #6503
	ldr	lr, [r4, #2592]
	mov	r0, #11
	ldr	r3, .L3157
	cmp	ip, lr
	ldr	r2, .L3157+4
	bcs	.L3150
	b	.L3152
.L3153:
	stmia	sp, {ip, lr}
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_OutputUnRefPicWithMinPoc
	cmp	r0, #0
	bne	.L3151
	ldr	ip, [r4, #2596]
	ldr	lr, [r4, #2592]
.L3152:
	cmp	ip, lr
	ldr	r3, .L3157
	movw	r1, #6515
	ldr	r2, .L3157+8
	mov	r0, #1
	bcs	.L3153
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3156:
	ldr	r3, .L3157
	movw	r1, #6508
	ldr	r2, .L3157+12
	mov	r0, #1
	bl	dprint_normal
	ldr	ip, [r4, #2596]
	ldr	lr, [r4, #2592]
	b	.L3152
.L3151:
	ldr	r3, .L3157
	movw	r1, #6521
	ldr	r2, .L3157+16
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_PrintDPBState
	mov	r0, r4
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	HEVC_ClearDPB
.L3158:
	.align	2
.L3157:
	.word	.LANCHOR0+968
	.word	.LC408
	.word	.LC410
	.word	.LC409
	.word	.LC405
	UNWIND(.fnend)
	.size	HEVC_RecoverDPBProcess, .-HEVC_RecoverDPBProcess
	.align	2
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
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
	cmp	r1, #16
	str	r1, [fp, #-32]
	mov	r5, r0
	mov	r4, r2
	bhi	.L3163
	sub	r1, fp, #32
	bl	HEVC_RemoveSamePocOutDPB
	ldr	r3, [fp, #-32]
	ldr	r1, [r4, #60]
	mov	r0, #1
	mov	r2, r0
	add	r3, r5, r3, lsl #2
	str	r1, [r3, #2616]
	str	r0, [r1, #44]
	ldr	r3, [r3, #2616]
	ldr	r0, [r5, #248]
	ldr	r1, [r3, #24]
	bl	FSP_SetRef
	ldr	r3, [fp, #-32]
	ldrb	r0, [r4]	@ zero_extendqisi2
	mov	r2, #536
	add	r3, r3, #652
	add	r1, r4, #64
	add	r3, r3, #2
	adds	r0, r0, #0
	ldr	r3, [r5, r3, asl #2]
	movne	r0, #1
	strb	r0, [r3, #1]
	ldr	r7, [fp, #-32]
	ldr	r0, [r4, #36]
	add	r6, r5, r7, lsl #2
	ldr	r3, [r6, #2616]
	str	r0, [r3, #16]
	ldr	r0, [r6, #2616]
	add	r0, r0, #72
	bl	memcpy
	ldr	r2, [r6, #2616]
	ldr	ip, [r4, #40]
	add	r0, r5, #2608
	add	r1, r7, #1
	add	r0, r0, #8
	ldr	r3, .L3165
	str	ip, [r2, #12]
	mov	r2, #4
	ldr	ip, [r6, #2616]
	ldr	lr, [r4, #60]
	str	lr, [ip, #68]
	ldr	ip, [r6, #2616]
	ldr	lr, [r4, #16]
	str	lr, [ip, #8]
	ldr	ip, [r6, #2616]
	ldr	lr, [r4, #12]
	str	lr, [ip, #4]
	ldr	ip, [r6, #2616]
	ldr	lr, [r4, #8]
	str	lr, [ip, #28]
	bl	qsort
	ldr	r3, [r5, #2596]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r5, #2596]
	ldr	r1, [r4, #60]
	bl	HEVC_GetAPC
	subs	r3, r0, #0
	streqb	r3, [r4, #1]
	moveq	r0, r3
	bne	.L3164
.L3161:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3163:
	str	r1, [sp]
	mov	r0, #0
	movw	r1, #11164
	ldr	r3, .L3165+4
	ldr	r2, .L3165+8
	bl	dprint_normal
	mov	r0, r5
	bl	HEVC_ClearDPB
	mvn	r0, #0
	b	.L3161
.L3164:
	movw	r1, #11196
	ldr	r2, .L3165+12
	str	r3, [sp]
	mov	r0, #0
	ldr	r3, .L3165+4
	bl	dprint_normal
	mov	r0, r5
	bl	HEVC_PrintDPBState
	mov	r0, r5
	bl	HEVC_ClearDPB
	mvn	r0, #0
	b	.L3161
.L3166:
	.align	2
.L3165:
	.word	HEVC_ComparePicByPocAsc
	.word	.LANCHOR0+992
	.word	.LC411
	.word	.LC412
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
	ldrb	r3, [r4, #1824]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3180
	ldr	r3, [r4, #1884]
	mov	r2, #2
	str	r2, [r3, #44]
.L3169:
	ldr	r3, [r4, #1884]
	mov	r2, #1
	mov	r0, r5
	strb	r2, [r3, #2]
	ldr	r1, [r4, #1884]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r4, r0
	beq	.L3181
	cmn	r0, #3
	beq	.L3173
	mov	r0, r5
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3182
.L3173:
	mov	r0, #0
.L3170:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3180:
	bl	HEVC_SimpleSlideDPB
	add	r2, r5, #5888
	add	r2, r2, #32
	ldr	r1, [r5, #2596]
	mov	r0, r5
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	beq	.L3169
	movw	r1, #10701
	str	r0, [sp, #4]
	str	r1, [sp]
	mov	r0, #0
	ldr	r3, .L3183
	ldr	r2, .L3183+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L3170
.L3182:
	ldr	r3, .L3183
	movw	r1, #10728
	ldr	r2, .L3183+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3170
.L3181:
	ldr	r3, .L3183
	movw	r1, #10715
	ldr	r2, .L3183+12
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r4
	b	.L3170
.L3184:
	.align	2
.L3183:
	.word	.LANCHOR0+1012
	.word	.LC413
	.word	.LC402
	.word	.LC414
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
	ldr	r1, [r0, #2596]
	mov	r4, r0
	ldr	r3, [r0, #2592]
	cmp	r1, r3
	bcs	.L3197
.L3186:
	add	r2, r4, #5888
	mov	r0, r4
	add	r2, r2, #32
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L3198
	add	r3, r4, #4096
	mov	r0, r4
	ldr	r1, [r3, #1884]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r5, r0
	beq	.L3199
	cmn	r0, #3
	beq	.L3192
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3200
.L3192:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3197:
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3196
	ldr	r3, .L3201
	movw	r1, #10747
	ldr	r2, .L3201+4
	mov	r0, #0
	bl	dprint_normal
.L3196:
	ldr	r1, [r4, #2596]
	b	.L3186
.L3198:
	ldr	r3, .L3201
	movw	r1, #10755
	ldr	r2, .L3201+8
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3200:
	mov	r0, r6
	ldr	r3, .L3201
	ldr	r2, .L3201+12
	movw	r1, #10776
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3199:
	mov	r0, r6
	ldr	r3, .L3201
	ldr	r2, .L3201+16
	movw	r1, #10763
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3202:
	.align	2
.L3201:
	.word	.LANCHOR0+1036
	.word	.LC415
	.word	.LC416
	.word	.LC402
	.word	.LC414
	UNWIND(.fnend)
	.size	HEVC_DecOrderProcess, .-HEVC_DecOrderProcess
	.align	2
	.global	HEVC_CreateLostPicture
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 600
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #608)
	sub	sp, sp, #608
	ldr	r3, .L3250
	mov	r4, r0
	mov	r5, r1
	sub	r0, fp, #636
	mov	r2, #600
	ldr	r3, [r3, #48]
	mov	r1, #0
	blx	r3
	add	r0, r4, #14784
	mov	r6, #0
.L3208:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L3204
	cmp	r0, #0
	beq	.L3226
	ldr	ip, [r4, #2596]
	cmp	ip, #0
	beq	.L3226
	ldr	r2, [r4, #2616]
	cmp	r0, r2
	beq	.L3204
	add	r2, r4, #2608
	add	r2, r2, #8
	b	.L3206
.L3207:
	ldr	r1, [r2, #4]!
	cmp	r0, r1
	beq	.L3204
.L3206:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L3207
.L3226:
	mov	r8, #608
	mov	r7, r0
	mla	r8, r8, r6, r4
	mov	r2, #536
	sub	r0, fp, #572
	mov	r9, #1
	mov	r3, #101
	str	r5, [fp, #-624]
	add	r1, r8, #14848
	str	r3, [fp, #-596]
	add	r1, r1, #8
	strb	r9, [fp, #-635]
	strb	r9, [fp, #-636]
	bl	memcpy
	add	r3, r8, #14784
	cmp	r6, #19
	movw	r2, #14832
	mov	r6, #0
	strb	r9, [r3, #2]
	str	r7, [fp, #-576]
	str	r6, [r8, r2]
	str	r6, [fp, #-476]
	strb	r9, [r3]
	bgt	.L3209
	ldr	r0, [r4, #2596]
	cmp	r0, #0
	beq	.L3211
	add	r1, r4, #2608
	mov	ip, r6
	add	r1, r1, #4
	mvn	r2, #-2147483648
	mov	r8, r1
.L3214:
	ldr	lr, [r8, #4]!
	add	ip, ip, #1
	ldr	r3, [lr, #4]
	rsb	r3, r5, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bge	.L3213
	ldrb	lr, [lr, #1]	@ zero_extendqisi2
	cmp	lr, #0
	movne	r2, r3
	movne	r6, #1
.L3213:
	cmp	ip, r0
	bne	.L3214
	cmp	r6, #0
	beq	.L3211
	mov	r6, #0
	b	.L3215
.L3216:
	add	r6, r6, #1
	cmp	r6, r0
	beq	.L3217
.L3215:
	ldr	ip, [r1, #4]!
	ldr	r3, [ip, #4]
	rsb	r3, r5, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bne	.L3216
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3216
	ldr	r1, [ip, #24]
	add	r6, r6, #652
	ldr	r0, [r4, #248]
	add	r6, r6, #2
	ldr	r9, [ip, #28]
	bl	FSP_GetLogicFs
	ldr	r3, [r4, r6, asl #2]
	movw	r1, #10477
	ldr	r2, .L3250+4
	ldr	r3, [r3, #4]
	str	r5, [sp]
	mov	r7, r0
	mov	r0, #1
	bl	dprint_normal
	cmp	r7, #0
	beq	.L3217
	ldr	r0, [r7, #24]
	cmp	r0, #0
	beq	.L3247
	ldr	r0, [r7, #32]
	cmp	r0, #0
	beq	.L3248
	mov	r1, #3
	ldr	r0, [r4, #248]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r4, #248]
	bl	FSP_GetLogicFs
	mvn	ip, r8
	mov	ip, ip, lsr #31
	cmp	r0, #0
	mov	r3, r0
	moveq	ip, #0
	cmp	ip, #0
	beq	.L3221
	ldr	r1, [fp, #-576]
	sub	r2, fp, #636
	mov	r0, r4
	str	r8, [r1, #24]
	ldr	r1, [r7, #24]
	str	r1, [r3, #24]
	ldr	r1, [r7, #28]
	str	r1, [r3, #28]
	ldr	r1, [r7, #32]
	str	r1, [r3, #32]
	ldr	r3, [r7, #32]
	ldr	r1, [r4, #2596]
	ldr	r3, [r3, #4]
	str	r9, [fp, #-628]
	str	r3, [fp, #-600]
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L3249
	ldr	r0, [r4, #248]
	mov	r1, r8
	mov	r2, r6
	bl	FSP_SetDisplay
	add	r3, r4, #4096
	mov	r0, r6
	ldr	r3, [r3, #2456]
	add	r4, r4, r3, lsl #2
	ldr	r3, [r4, #224]
	cmn	r3, #-2147483647
	streq	r5, [r4, #224]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3204:
	add	r6, r6, #1
	add	r0, r0, #608
	cmp	r6, #20
	bne	.L3208
.L3209:
	ldr	r2, .L3250+8
	movw	r1, #10451
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
.L3242:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3217:
	ldr	r2, .L3250+12
	movw	r1, #10484
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3221:
	ldr	r3, [fp, #-576]
	mov	r0, ip
	ldr	r2, .L3250+16
	movw	r1, #10510
	strb	ip, [r3]
	bl	dprint_normal
	mvn	r0, #0
	b	.L3242
.L3249:
	ldr	r3, [fp, #-576]
	mov	r1, r8
	mov	r5, #0
	strb	r5, [r3]
	ldr	r0, [r4, #248]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	ldr	r2, .L3250+20
	movw	r1, #10526
	bl	dprint_normal
	mvn	r0, #0
	b	.L3242
.L3211:
	mov	r0, #0
	ldr	r2, .L3250+24
	strb	r0, [r7]
	movw	r1, #10467
	bl	dprint_normal
	mvn	r0, #0
	b	.L3242
.L3248:
	ldr	r2, .L3250+28
	movw	r1, #10495
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	b	.L3242
.L3247:
	ldr	r2, .L3250+32
	movw	r1, #10489
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	b	.L3242
.L3251:
	.align	2
.L3250:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC420
	.word	.LC417
	.word	.LC418
	.word	.LC423
	.word	.LC424
	.word	.LC419
	.word	.LC422
	.word	.LC421
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
	mov	r0, r4
	bl	HEVC_ApplyReferencePictureSet
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	add	r5, r4, #4096
	bl	HEVC_RemoveUnUsedFrameStore
	b	.L3253
.L3256:
	bl	HEVC_CheckThatAllRefPicsAreAvailable.part.8
	ldr	r2, .L3262
	movw	r1, #6560
	cmp	r0, #0
	mov	r0, #1
	bne	.L3258
	ldr	r3, [fp, #-24]
	bl	dprint_normal
	ldr	r3, [r4, #2412]
	mov	r0, r4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L3254
	ldr	r1, [fp, #-24]
	bl	HEVC_CreateLostPicture
	cmp	r0, #0
	bne	.L3261
.L3253:
	ldr	r3, [r5, #2452]
	sub	r1, fp, #24
	mov	r0, r4
	sub	r3, r3, #19
	cmp	r3, #2
	bhi	.L3256
.L3258:
	mov	r0, r4
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	mov	r0, r4
	bl	HEVC_RecoverDPBProcess
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3254:
	ldr	lr, [r5, #2436]
	movw	r1, #6575
	ldr	ip, [fp, #-24]
	mov	r0, #1
	ldr	r2, .L3262+4
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3261:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	mvn	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3263:
	.align	2
.L3262:
	.word	.LC425
	.word	.LC426
	UNWIND(.fnend)
	.size	HEVC_RefPicProcess, .-HEVC_RefPicProcess
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r9, r0, #4096
	mov	r5, r0
	ldr	r0, [r0, #2596]
	ldr	r7, [r9, #1832]
	cmp	r0, #0
	beq	.L3292
	mov	r3, #0
	add	r6, r5, #2608
	mov	r8, r3
	add	r6, r6, #4
	mov	r4, r3
	b	.L3268
.L3266:
	add	r4, r4, #1
	cmp	r0, r4
	bls	.L3327
.L3268:
	ldr	r3, [r6, #4]!
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3266
	ldr	r1, [r3, #28]
	cmp	r1, r7
	bne	.L3266
	add	r1, r7, #52
	ldr	ip, [r3, #4]
	ldr	r1, [r5, r1, asl #2]
	cmp	ip, r1
	addge	r8, r8, #1
	bge	.L3266
	ldr	r0, [r5, #248]
	add	r4, r4, #1
	ldr	r1, [r3, #24]
	bl	FSP_SetDisplay
	ldr	r0, [r5, #2596]
	cmp	r0, r4
	bhi	.L3268
.L3327:
	str	r8, [fp, #-52]
.L3265:
	ldr	r3, [r5, #2348]
	cmp	r3, #1
	beq	.L3328
	ldr	r2, [r9, #2448]
	ldr	r3, [r5, #2396]
	add	r3, r3, r2, lsl #2
	ldr	r8, [r3, #356]
.L3270:
	cmp	r0, #0
	beq	.L3293
	add	r6, r5, #2608
	mov	r4, #0
	add	r10, r5, r7, lsl #2
	add	r6, r6, #4
	str	r4, [fp, #-56]
	str	r10, [fp, #-48]
	b	.L3280
.L3331:
	ldr	ip, [r5, #328]
	cmp	ip, #1
	beq	.L3278
.L3279:
	cmp	r2, #0
	bne	.L3277
	ldr	ip, [r3, #4]
.L3325:
	ldr	r2, [r9, #2436]
	add	r2, r2, #100
	cmp	ip, r2
	ble	.L3277
	ldr	r2, [fp, #-48]
	ldr	r2, [r2, #224]
	cmp	r2, #-2147483647
	beq	.L3277
	ldr	r2, [r5, #328]
	cmp	r2, #1
	beq	.L3329
.L3277:
	add	r4, r4, #1
	cmp	r0, r4
	bls	.L3271
.L3280:
	ldr	r3, [r6, #4]!
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3272
	ldr	r1, [r3, #28]
	cmp	r1, r7
	beq	.L3330
.L3272:
	add	r1, r7, #52
	ldr	r1, [r5, r1, asl #2]
.L3274:
	cmp	r1, #0
	bne	.L3331
.L3278:
	ldr	ip, [r3, #4]
	cmp	r1, ip
	blt	.L3279
	cmp	r2, #0
	bne	.L3277
.L3291:
	ldr	r0, [r5, #248]
	mov	r2, #0
	ldr	r1, [r3, #24]
	add	r4, r4, #1
	bl	FSP_SetDisplay
	ldr	r0, [r5, #2596]
	cmp	r0, r4
	bhi	.L3280
.L3271:
	ldr	r2, [r5, #2592]
	cmp	r2, r0
	beq	.L3332
.L3297:
	ldr	r0, [fp, #-56]
.L3324:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3330:
	ldr	r1, [fp, #-48]
	ldr	ip, [r3, #4]
	ldr	r1, [r1, #208]
	cmp	ip, r1
	blt	.L3275
	ldr	lr, [fp, #-52]
	ldr	r10, [r9, #2448]
	cmp	lr, r8
	movhi	lr, #1
	movls	lr, #0
	cmp	r10, #6
	movhi	lr, #0
	cmp	lr, #0
	beq	.L3274
	ldr	lr, [r9, #2436]
	cmp	ip, lr
	blt	.L3276
	add	ip, r5, r7
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L3274
.L3276:
	mov	r2, #1
	mov	r0, r5
	strb	r2, [r3, #2]
	ldr	r1, [r6]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r6]
	ldr	r2, [fp, #-52]
	ldr	r3, [r3, #4]
	sub	r2, r2, #1
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-48]
	str	r0, [fp, #-56]
	str	r3, [r2, #208]
	ldr	r0, [r5, #2596]
	b	.L3277
.L3275:
	cmp	r1, #0
	beq	.L3291
	ldr	r2, [r5, #328]
	cmp	r2, #1
	bne	.L3325
	b	.L3291
.L3332:
	cmp	r0, #0
	beq	.L3295
	ldr	r4, [r5, #2616]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3297
	add	lr, r5, #2608
	mov	r3, #0
	add	lr, lr, #8
	mov	r1, lr
	b	.L3282
.L3283:
	ldr	r0, [r1, #4]!
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3297
.L3282:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L3283
	ldr	r3, [r4, #60]
	mov	ip, r4
	cmp	r3, #0
	bne	.L3285
	ldr	r3, [r4, #56]
	cmp	r3, #0
	moveq	r1, lr
	beq	.L3288
	b	.L3285
.L3289:
	ldr	ip, [r1, #4]!
	ldr	r0, [ip, #60]
	cmp	r0, #0
	bne	.L3285
	ldr	r0, [ip, #56]
	cmp	r0, #0
	bne	.L3285
.L3288:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L3289
.L3295:
	mvn	r0, #0
	b	.L3324
.L3328:
	ldr	r1, [r5, #2396]
	mov	r8, #0
	add	r3, r1, #352
	add	r1, r1, #380
.L3269:
	ldr	r2, [r3, #4]!
	cmp	r8, r2
	movcc	r8, r2
	cmp	r3, r1
	bne	.L3269
	b	.L3270
.L3329:
	strb	r2, [r3, #2]
	mov	r0, r5
	ldr	r3, [fp, #-52]
	ldr	r1, [r6]
	sub	r3, r3, #1
	str	r3, [fp, #-52]
	bl	HEVC_OutputFrmToVO
	ldr	r2, [fp, #-48]
	ldr	r3, [r9, #2436]
	ldr	r2, [r2, #208]
	cmp	r3, r2
	sublt	r3, r3, #1
	ldrlt	r2, [fp, #-48]
	str	r0, [fp, #-56]
	strlt	r3, [r2, #208]
	ldr	r0, [r5, #2596]
	b	.L3277
.L3285:
	mov	r4, #0
	ldr	r1, [ip, #24]
	strb	r4, [ip, #1]
	mov	r2, r4
	ldr	r0, [r5, #248]
	bl	FSP_SetRef
	mov	r0, r4
	b	.L3324
.L3292:
	str	r0, [fp, #-52]
	b	.L3265
.L3293:
	str	r0, [fp, #-56]
	b	.L3271
	UNWIND(.fnend)
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
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
	add	r3, r0, #12288
	mov	r4, r0
	ldr	r3, [r3, #936]
	cmp	r3, #1
	beq	.L3334
	bl	HEVC_FirstFrameFastOut
	cmp	r0, #0
	bne	.L3357
.L3334:
	ldr	r1, [r4, #2596]
	ldr	r3, [r4, #2592]
	cmp	r1, r3
	bcs	.L3358
.L3336:
	add	r2, r4, #5888
	mov	r0, r4
	add	r2, r2, #32
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L3359
	ldr	r3, [r4, #2596]
	cmp	r3, #0
	bne	.L3360
.L3339:
	ldr	r2, [r4, #2592]
	cmp	r2, r3
	bls	.L3361
.L3356:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3361:
	add	r1, r4, #7872
	ldr	r0, [r4, #248]
	add	r1, r1, #8
	bl	FSP_IfCanGetDecFs
	cmp	r0, #0
	beq	.L3356
	mov	r0, r4
	bl	HEVC_RemoveFrmFullDPB
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3358:
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3355
	ldr	r2, .L3362
	movw	r1, #10830
	mov	r0, #0
	bl	dprint_normal
.L3355:
	ldr	r1, [r4, #2596]
	b	.L3336
.L3360:
	mov	r0, r4
	bl	HEVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3340
	ldr	r3, [r4, #2596]
	b	.L3339
.L3359:
	mov	r3, r0
	ldr	r2, .L3362+4
	movw	r1, #10838
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3357:
	ldr	r3, .L3362+8
	movw	r1, #10818
	ldr	r2, .L3362+12
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3340:
	ldr	r3, .L3362+8
	movw	r1, #10848
	ldr	r2, .L3362+16
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3363:
	.align	2
.L3362:
	.word	.LC428
	.word	.LC429
	.word	.LANCHOR0+1060
	.word	.LC427
	.word	.LC430
	UNWIND(.fnend)
	.size	HEVC_DispOrderProcess, .-HEVC_DispOrderProcess
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
	ldr	r6, [r0, #2384]
	mov	r3, #0
	mov	r4, r0
	cmp	r6, r3
	str	r3, [r0, #324]
	beq	.L3394
	ldrb	r3, [r1]	@ zero_extendqisi2
	str	r3, [r6, #36]
	ldr	r3, [r0, #2412]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L3395
.L3371:
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3372
	ldr	r3, [r4, #2384]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bls	.L3373
	ldr	r0, [r3, #36]
	cmp	r0, #1
	beq	.L3372
.L3373:
	ldr	r0, [r1, #16]
	cmp	r0, #0
	ble	.L3374
	ldr	r0, [r1, #4]
	cmp	r0, #0
	beq	.L3374
	ldr	ip, [r1, #8]
	cmp	ip, #0
	bne	.L3396
.L3374:
	mov	r2, #1
	str	r2, [r3, #36]
	ldr	r1, [r1, #20]
	ldr	r0, [r4, #248]
	bl	SM_ReleaseStreamSeg
.L3370:
	ldr	r3, [r4, #2384]
	ldr	r0, [r3, #36]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
.L3368:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3396:
	mov	lr, r2, asl #5
	mov	ip, #0
	sub	r2, lr, r2, asl #2
	add	r3, r3, r2
	str	r0, [r3, #40]
	ldr	r3, [r4, #2384]
	ldr	lr, [r1, #16]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #44]
	ldr	r3, [r4, #2384]
	ldr	lr, [r1, #8]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #48]
	ldr	r3, [r4, #2384]
	ldr	lr, [r1, #20]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #64]
	ldr	r3, [r4, #2384]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	ip, [r3, #56]
	ldr	r2, [r4, #2384]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	ldr	r3, [r4, #2412]
	ldrb	r3, [r3, #864]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3375
	add	r3, r4, #4096
	ldr	r0, [r1, #16]
	ldr	r2, [r3, #1876]
	ldr	ip, [r3, #1880]
	add	r0, r0, r2
	str	r0, [r3, #1876]
	ldr	r2, [r1, #16]
	add	r2, r2, ip
	str	r2, [r3, #1880]
.L3375:
	mov	r0, r4
	bl	HEVC_CombinePacket
	mov	r3, #1
	str	r3, [r4, #324]
	b	.L3370
.L3395:
	ldr	r3, [r3, #848]
	cmp	r3, #0
	bne	.L3370
	b	.L3371
.L3394:
	ldr	r3, [r1, #16]
	cmp	r3, #0
	ble	.L3366
	ldr	r3, [r1, #4]
	cmp	r3, #0
	beq	.L3366
	ldr	r3, [r1, #8]
	str	r1, [fp, #-32]
	cmp	r3, #0
	beq	.L3366
	bl	HEVC_FindNaluArraySlot
	ldr	r1, [fp, #-32]
	cmn	r0, #1
	mov	r5, r0
	beq	.L3397
	ldr	r3, [r4, #2408]
	mov	r0, r0, asl #7
	sub	r0, r0, r5, asl #5
	mov	r2, #1
	add	r0, r3, r0
	str	r0, [r4, #2384]
	ldr	r3, [r1, #4]
	str	r3, [r0, #40]
	ldr	r3, [r4, #2384]
	ldr	r0, [r1, #16]
	str	r0, [r3, #44]
	ldr	r3, [r4, #2384]
	ldr	r0, [r1, #20]
	str	r0, [r3, #64]
	ldr	r3, [r4, #2384]
	ldr	r0, [r1, #8]
	str	r0, [r3, #48]
	ldr	r3, [r4, #2384]
	str	r6, [r3, #56]
	ldr	r3, [r4, #2384]
	str	r2, [r3, #8]
	ldr	r3, [r4, #2384]
	strb	r6, [r3]
	ldr	r3, [r4, #2384]
	ldrb	r2, [r1]	@ zero_extendqisi2
	str	r2, [r3, #36]
	ldr	r3, [r4, #2412]
	ldrb	r3, [r3, #864]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3369
	add	r3, r4, #4096
	ldr	r0, [r1, #16]
	ldr	r2, [r3, #1876]
	ldr	ip, [r3, #1880]
	add	r0, r0, r2
	str	r0, [r3, #1876]
	ldr	r2, [r1, #16]
	add	r2, r2, ip
	str	r2, [r3, #1880]
.L3369:
	ldr	r3, [r1, #12]
	str	r3, [r4, #2336]
	b	.L3370
.L3372:
	ldr	r2, .L3398
	movw	r1, #13833
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3368
.L3366:
	ldr	r2, .L3398+4
	movw	r1, #13820
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3368
.L3397:
	ldr	r2, .L3398+8
	movw	r1, #13792
	mov	r0, r6
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ClearAll
	mov	r0, r5
	b	.L3368
.L3399:
	.align	2
.L3398:
	.word	.LC433
	.word	.LC432
	.word	.LC431
	UNWIND(.fnend)
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r6, r0, #4096
	mov	r5, r0
	ldr	r3, [r6, #1884]
	cmp	r3, #0
	beq	.L3441
	ldr	r2, [r0, #248]
	ldr	r3, .L3452
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3442
.L3403:
	mov	r0, r5
	bl	HEVC_RemoveDummyFrame
	ldrb	r4, [r6, #1825]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L3443
	ldr	r3, [r6, #1864]
	cmp	r3, #0
	beq	.L3406
	ldr	r4, [r6, #1840]
	cmp	r4, #0
	beq	.L3444
.L3407:
	ldr	r2, [r5, #2412]
	ldr	r1, [r2, #4]
	cmp	r1, r3
	bcs	.L3406
	ldr	r4, [r2, #616]
	mov	r0, r5
	cmp	r4, #0
	beq	.L3445
	bl	HEVC_DirectOutput
	subs	r4, r0, #0
	bne	.L3446
.L3410:
	movw	r1, #10935
.L3440:
	mov	r3, r4
	str	r1, [sp]
	ldr	r2, .L3452+4
	mov	r0, #12
	bl	dprint_normal
.L3411:
	cmn	r4, #1
	beq	.L3402
.L3419:
	mov	r3, #0
	mov	r0, r4
	strb	r3, [r6, #1825]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3406:
	ldr	r3, [r5, #2420]
	ldr	r2, [r6, #1884]
	add	r3, r3, #4096
	ldr	r3, [r3, #832]
	str	r3, [r2, #36]
	ldr	r3, [r5, #2420]
	ldr	r2, [r6, #1884]
	add	r3, r3, #4096
	ldr	r3, [r3, #836]
	str	r3, [r2, #40]
	ldr	r3, [r5, #252]
	cmp	r3, #2
	beq	.L3447
	ldr	r3, [r5, #2412]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	beq	.L3448
	cmp	r3, #1
	beq	.L3449
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bhi	.L3402
.L3418:
	mov	r0, r5
	bl	HEVC_DispOrderProcess
	subs	r4, r0, #0
	beq	.L3419
	ldr	r3, .L3452+8
	movw	r1, #10982
	ldr	r2, .L3452+12
	mov	r0, #0
	bl	dprint_normal
	b	.L3411
.L3442:
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L3403
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L3403
	add	r3, r0, #12288
	ldrb	r3, [r3, #880]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3403
	bl	HEVC_Sei_Get_Frame_Pts
	b	.L3403
.L3441:
	mov	r0, r3
	ldr	r2, .L3452+16
	movw	r1, #10878
	bl	dprint_normal
	movw	r3, #10879
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L3452+4
	mvn	r3, #0
	mov	r0, #12
	bl	dprint_normal
.L3402:
	mov	r0, r5
	mvn	r4, #0
	bl	HEVC_ClearCurrPic
	ldr	r3, .L3452+8
	ldr	r2, .L3452+20
	movw	r1, #10991
	mov	r0, #1
	bl	dprint_normal
	b	.L3419
.L3446:
	ldr	r3, .L3452+8
	movw	r1, #10932
	ldr	r2, .L3452+24
	mov	r0, #0
	bl	dprint_normal
	b	.L3410
.L3443:
	ldr	r3, .L3452+8
	movw	r1, #10909
	ldr	r2, .L3452+28
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3445:
	bl	HEVC_ClearCurrPic
	ldr	ip, [r5, #2412]
	ldr	r3, [r6, #1864]
	movw	r1, #10924
	ldr	r2, .L3452+32
	mov	r0, #1
	ldr	ip, [ip, #4]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3444:
	ldr	r3, .L3452+8
	movw	r1, #10915
	ldr	r2, .L3452+36
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3452+40
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L3439
	mov	r3, r4
	mov	r2, r4
	mov	r1, #40
	ldr	r0, [r5, #248]
	blx	r7
.L3439:
	ldr	r3, [r6, #1864]
	b	.L3407
.L3447:
	mov	r0, r5
	bl	HEVC_DirectOutput
	subs	r4, r0, #0
	bne	.L3450
.L3413:
	movw	r1, #10951
	b	.L3440
.L3450:
	ldr	r3, .L3452+8
	movw	r1, #10948
	ldr	r2, .L3452+44
	mov	r0, #0
	bl	dprint_normal
	b	.L3413
.L3448:
	mov	r0, r5
	bl	HEVC_SimpleDPBProcess
	subs	r4, r0, #0
	bne	.L3451
.L3415:
	movw	r1, #10963
	b	.L3440
.L3449:
	mov	r0, r5
	bl	HEVC_DecOrderProcess
	subs	r4, r0, #0
	bne	.L3417
	ldr	r3, [r5, #2412]
	ldr	r3, [r3, #12]
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bls	.L3418
	b	.L3419
.L3451:
	ldr	r3, .L3452+8
	movw	r1, #10960
	ldr	r2, .L3452+48
	mov	r0, #0
	bl	dprint_normal
	b	.L3415
.L3417:
	ldr	r3, .L3452+8
	movw	r1, #10972
	ldr	r2, .L3452+52
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r5, #2412]
	ldr	r3, [r3, #12]
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bhi	.L3411
	b	.L3418
.L3453:
	.align	2
.L3452:
	.word	s_pstVfmwChan
	.word	.LC435
	.word	.LANCHOR0+1084
	.word	.LC443
	.word	.LC434
	.word	.LC444
	.word	.LC439
	.word	.LC436
	.word	.LC438
	.word	.LC437
	.word	g_EventReportFunc
	.word	.LC440
	.word	.LC441
	.word	.LC442
	UNWIND(.fnend)
	.size	HEVC_StorePicInDPB, .-HEVC_StorePicInDPB
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r3, [r0, #180]
	mov	r4, r0
	cmp	r3, #2
	bls	.L3516
	ldr	r3, [r0, #292]
	add	r5, r0, #4096
	ldr	r2, [r0, #296]
	mov	r0, #1
	ldr	r1, [r4, #2412]
	add	r3, r3, r0
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #292]
	rsb	r3, r2, r3
	str	r3, [r1, #552]
	strb	r0, [r5, #1824]
	ldr	r6, [r4, #244]
	ldr	r3, [r4, #252]
	ubfx	r6, r6, #16, #3
	cmp	r3, r6
	beq	.L3459
	subs	r2, r6, #2
	sub	r1, r3, #2
	movne	r2, #1
	cmp	r1, r0
	movhi	r2, #0
	cmp	r2, #0
	beq	.L3459
	cmp	r6, #4
	cmpne	r6, r0
	bls	.L3517
.L3459:
	cmp	r6, #2
	str	r6, [r4, #252]
	beq	.L3461
	cmp	r6, #3
	bne	.L3512
.L3513:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
.L3511:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3512:
	ldr	r3, [r4, #232]
	cmp	r3, #0
	beq	.L3480
	cmp	r6, #4
	ldr	r3, [r5, #1840]
	beq	.L3518
.L3467:
	cmp	r3, #2
	bne	.L3469
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3519
.L3482:
	ldr	r3, [r4, #236]
	movw	r1, #9005
	ldr	r2, .L3524
	mov	r0, #3
	sub	r3, r3, #1
	bl	dprint_normal
	ldr	r3, [r4, #200]
	cmp	r3, #0
	beq	.L3520
	ldr	r1, [r5, #1852]
	add	r0, r4, #8192
	clz	r2, r1
	mov	r2, r2, lsr #5
	str	r2, [r0, #1372]
	ldr	r2, [r5, #1856]
	str	r3, [r0, #2400]
	str	r2, [r0, #1364]
	ldr	r3, [r4, #236]
	cmp	r3, #0
	beq	.L3474
	add	r2, r0, #40
	str	r2, [r4, #2420]
	ldr	ip, [r5, #1868]
	add	r3, r4, #12288
	add	r1, r1, #1
	mov	r2, #0
	str	ip, [r3, #872]
	ldr	ip, [r5, #1872]
	str	ip, [r3, #876]
	str	r1, [r5, #1852]
	str	r2, [r3, #868]
	ldr	r1, [r5, #1840]
	cmp	r1, r2
	beq	.L3521
.L3474:
	ldr	r0, [r5, #1880]
	ldr	r1, [r5, #1884]
	ldr	r3, [r5, #1876]
	str	r0, [r5, #1876]
	ldr	r2, [r1, #308]
	rsb	r3, r0, r3
	add	r2, r2, r3
	str	r2, [r1, #308]
	ldr	r0, [r5, #1840]
	ldr	r2, [r5, #2124]
	cmp	r0, #0
	add	r3, r3, r2
	str	r3, [r5, #2124]
	beq	.L3522
	cmp	r0, #1
	beq	.L3523
	cmp	r0, #2
	ldreq	r3, .L3524+4
	moveq	r0, #0
	ldreq	r2, [r4, #248]
	movne	r0, #0
	ldreq	r2, [r3, r2, asl #2]
	ldreq	r3, [r2, #104]
	addeq	r3, r3, #1
	streq	r3, [r2, #104]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3469:
	cmp	r3, #1
	streqb	r3, [r4, #6]
	b	.L3482
.L3461:
	ldr	r3, [r5, #1840]
	cmp	r3, #0
	bne	.L3465
	ldr	r3, [r4, #232]
	cmp	r3, #0
	bne	.L3482
.L3480:
	ldr	r3, .L3524+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3465
	mov	r3, #0
	mov	r1, #60
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r5
.L3465:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3511
.L3522:
	ldr	r2, [r4, #248]
	ldr	r3, .L3524+4
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [r2, #96]
	add	r3, r3, #1
	str	r3, [r2, #96]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3518:
	cmp	r3, #0
	moveq	r3, #2
	streqb	r3, [r4, #6]
	beq	.L3482
	b	.L3467
.L3521:
	ldr	r2, [r0, #2404]
	cmp	r2, #0
	beq	.L3485
.L3477:
	ldr	r3, [r2]
	ldr	r0, [r2, #4]
	ldr	r2, [r2, #1356]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3477
.L3476:
	ldr	r3, .L3524+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L3474
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #248]
	str	r1, [r2, #-4]!
	mov	r1, #8
	blx	r6
	b	.L3474
.L3519:
	ldr	r3, .L3524+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3482
	ldr	r3, [r4, #2412]
	ldr	r3, [r3, #12]
	sub	r2, r3, #4
	cmp	r3, #0
	cmpne	r2, #2
	bhi	.L3482
	mov	r2, #1
	ldr	r3, [r5, #1836]
	mov	r0, r2
	str	r2, [sp]
	movw	r1, #8995
	ldr	r2, .L3524+16
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, .L3524+8
	ldr	r5, [r3]
	cmp	r5, #0
	mvneq	r0, #0
	beq	.L3511
	mov	r3, #0
	ldr	r0, [r4, #248]
	mov	r2, r3
	mov	r1, #60
	blx	r5
	mvn	r0, #0
	b	.L3511
.L3523:
	ldr	r2, [r4, #248]
	mov	r0, #0
	ldr	r3, .L3524+4
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [r2, #100]
	add	r3, r3, #1
	str	r3, [r2, #100]
	b	.L3511
.L3517:
	str	r6, [sp]
	movw	r1, #8940
	ldr	r2, .L3524+20
	bl	dprint_normal
	str	r6, [r4, #252]
	b	.L3513
.L3520:
	ldr	r2, .L3524+8
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L3472
	mov	r2, r3
	mov	r1, #60
	ldr	r0, [r4, #248]
	blx	r5
.L3472:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, .L3524+24
	ldr	r2, .L3524+28
	movw	r1, #9011
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3511
.L3516:
	bl	HEVC_ClearCurrPic
	ldr	r3, .L3524+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3456
	mov	r3, #0
	mov	r1, #60
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r5
.L3456:
	ldr	r3, [r4, #240]
	cmp	r3, #524288
	bls	.L3457
	ldr	r2, .L3524+32
	movw	r1, #8918
	mov	r0, #0
	bl	dprint_normal
.L3457:
	ldr	r2, .L3524+36
	movw	r1, #8921
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3511
.L3485:
	mov	r1, r2
	b	.L3476
.L3525:
	.align	2
.L3524:
	.word	.LC449
	.word	s_pstVfmwChan
	.word	g_EventReportFunc
	.word	g_AllowBPicBeforePPic
	.word	.LC448
	.word	.LC447
	.word	.LANCHOR0+1104
	.word	.LC450
	.word	.LC445
	.word	.LC446
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r0, #2364]
	mov	r1, #16
	mov	r9, r2
	str	r3, [fp, #-56]
	mov	r10, #0
	str	r10, [fp, #-48]
	bl	BsGet
	mov	r1, #8
	add	r6, r4, #4096
	mov	r7, r0
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #24
	and	r8, r0, #31
	ldr	r0, [r4, #2364]
	bl	BsBack
	ldr	r2, [r6, #2168]
	cmp	r5, r10
	str	r10, [r6, #2160]
	str	r2, [fp, #-48]
	beq	.L3528
	cmp	r5, #1
	beq	.L3529
	mov	r3, r5
	ldr	r2, .L3691
	movw	r1, #2778
	mov	r0, #1
	bl	dprint_normal
.L3663:
	mov	r0, #1
.L3536:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3529:
	cmp	r9, #1
	beq	.L3678
	movw	r0, #31745
	cmp	r8, #25
	cmpeq	r7, r0
	moveq	r8, #1
	movne	r8, #0
	bne	.L3559
	ldr	r7, .L3691+4
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L3560
	mov	r3, r10
	mov	r2, r10
	mov	r1, #41
	ldr	r0, [r4, #248]
	blx	r5
.L3560:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2384]
	subs	r5, r0, #0
	beq	.L3561
.L3675:
	cmp	r1, #0
	beq	.L3564
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3564:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L3661
	mov	r3, #0
	ldr	r0, [r4, #248]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	mvn	r0, #0
	b	.L3536
.L3528:
	cmp	r9, #1
	beq	.L3679
	bic	r7, r7, #512
	movw	r3, #31745
	cmp	r7, r3
	bne	.L3663
	movw	r1, #2612
	ldr	r3, .L3691+8
	str	r1, [sp]
	mov	r0, r5
	ldr	r2, .L3691+12
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3661
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2384]
	mvn	r0, #0
	b	.L3536
.L3559:
	movw	r3, #32257
	cmp	r7, r3
	movne	r0, r5
	bne	.L3536
	movw	r1, #2766
	ldr	r3, .L3691+8
	str	r1, [sp]
	mov	r0, r8
	ldr	r2, .L3691+16
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3661
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2384]
	mvn	r0, #0
	b	.L3536
.L3679:
	movw	r0, #31745
	cmp	r8, #25
	cmpeq	r7, r0
	moveq	r8, #1
	movne	r8, #0
	bne	.L3531
	ldr	r7, .L3691+4
	ldr	r8, [r7]
	cmp	r8, #0
	beq	.L3532
	mov	r3, r5
	mov	r2, r5
	mov	r1, #41
	ldr	r0, [r4, #248]
	blx	r8
.L3532:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2384]
	subs	r5, r0, #0
	beq	.L3533
	cmp	r1, #0
	beq	.L3538
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3538:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L3661
	mov	r3, #0
	ldr	r0, [r4, #248]
	mov	r2, r3
	mov	r1, #42
	blx	r5
.L3661:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3678:
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
	bne	.L3680
	movw	r3, #32257
	cmp	r7, r3
	beq	.L3681
	cmp	r7, r2
	bne	.L3682
.L3548:
	ldr	r1, [r4, #2384]
.L3672:
	cmp	r1, #0
	beq	.L3550
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2384]
	mov	r0, r5
	b	.L3536
.L3561:
	ldr	r2, [r1, #44]
	sub	r3, r2, #1
	sub	r2, r2, #6
	cmp	r3, #4096
	str	r2, [r6, #2160]
	bhi	.L3683
	ldr	r0, [r1, #72]
	sub	r2, fp, #48
	ldr	r3, [r1, #44]
	ldr	r1, [r6, #2164]
	add	r3, r3, r0
	ldr	r0, [r4, #248]
	sub	r3, r3, #1
	bl	MetadataMapToSec
	subs	r8, r0, #0
	bne	.L3684
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L3685
	ldr	r5, .L3691+20
	mov	r0, r3
	mov	r2, #5
	ldr	r1, .L3691+24
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2384]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #40]
	add	r0, r0, #5
	ldr	r2, [r6, #2160]
	add	r1, r1, #6
	blx	r3
	ldr	r3, [r6, #2160]
	add	ip, r3, #5
	str	ip, [r6, #2160]
	ldr	r1, [r4, #2384]
	ldr	r2, [r1, #72]
	cmp	r2, #0
	beq	.L3567
	add	r0, ip, r2
	cmp	r0, #4096
	bhi	.L3686
	ldr	r0, [fp, #-48]
	cmp	r0, #0
	beq	.L3687
	ldr	r3, [r5, #52]
	add	r0, r0, ip
	ldr	r1, [r1, #68]
	blx	r3
	ldr	r3, [r4, #2384]
	ldr	r2, [r6, #2160]
	ldr	r3, [r3, #72]
	add	r3, r3, r2
	str	r3, [r6, #2160]
.L3567:
	ldr	r1, [fp, #-48]
	cmp	r1, #0
	beq	.L3688
	ldr	r2, [r6, #2160]
	ldr	r0, [r4, #248]
	bl	HEVC_SaveMetadata
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #248]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	beq	.L3548
	movw	r1, #2756
.L3665:
	ldr	r3, .L3691+8
	mov	r0, #0
	str	r1, [sp]
	ldr	r2, .L3691+28
	bl	dprint_normal
	mvn	r0, #0
	b	.L3536
.L3531:
	movw	r3, #32257
	cmp	r7, r3
	bne	.L3663
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3550
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2384]
	mov	r0, r8
	b	.L3536
.L3683:
	movw	r1, #2685
	ldr	r2, .L3691+32
	str	r1, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3564
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2384]
	b	.L3564
.L3550:
	mov	r0, #0
	b	.L3536
.L3533:
	ldr	r2, [r1, #44]
	sub	r3, r2, #1
	sub	r2, r2, #6
	cmp	r3, #4096
	str	r2, [r6, #2160]
	bls	.L3537
	movw	r1, #2520
	ldr	r2, .L3691+32
	str	r1, [sp]
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3538
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2384]
	b	.L3538
.L3682:
	mov	r1, #8
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	ldr	r0, [r4, #2364]
	ubfx	r5, r5, #1, #6
	bl	BsSkip
	cmp	r5, #49
	beq	.L3689
.L3558:
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3550
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2384]
	b	.L3536
.L3680:
	ldr	r7, .L3691+4
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L3553
	mov	r3, r10
	mov	r2, r10
	mov	r1, #41
	ldr	r0, [r4, #248]
	blx	r5
.L3553:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2384]
	subs	r5, r0, #0
	beq	.L3672
	b	.L3675
.L3537:
	ldr	r0, [r1, #72]
	sub	r2, fp, #48
	ldr	r3, [r1, #44]
	ldr	r1, [r6, #2164]
	add	r3, r3, r0
	ldr	r0, [r4, #248]
	sub	r3, r3, #1
	bl	MetadataMapToSec
	subs	r8, r0, #0
	movwne	r1, #2532
	bne	.L3660
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	movweq	r1, #2539
	beq	.L3664
	ldr	r5, .L3691+20
	mov	r0, r3
	mov	r2, #5
	ldr	r1, .L3691+24
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2384]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #40]
	add	r0, r0, #5
	ldr	r2, [r6, #2160]
	add	r1, r1, #6
	blx	r3
	ldr	r3, [r6, #2160]
	add	ip, r3, #5
	str	ip, [r6, #2160]
	ldr	r1, [r4, #2384]
	ldr	r2, [r1, #72]
	cmp	r2, #0
	beq	.L3542
	add	r0, ip, r2
	cmp	r0, #4096
	bhi	.L3690
	ldr	r0, [fp, #-48]
	cmp	r0, #0
	movweq	r1, #2569
	beq	.L3666
	ldr	r3, [r5, #52]
	add	r0, r0, ip
	ldr	r1, [r1, #68]
	blx	r3
	ldr	r3, [r4, #2384]
	ldr	r2, [r6, #2160]
	ldr	r3, [r3, #72]
	add	r3, r3, r2
	str	r3, [r6, #2160]
.L3542:
	ldr	r1, [fp, #-48]
	cmp	r1, #0
	movweq	r3, #2579
	beq	.L3667
	ldr	r2, [r6, #2160]
	ldr	r0, [r4, #248]
	bl	HEVC_SaveMetadata
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #248]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	movwne	r1, #2591
	beq	.L3548
	b	.L3665
.L3681:
	ldr	r0, [r4, #2364]
	mov	r1, #16
	bl	BsSkip
	mov	r0, r9
	b	.L3536
.L3686:
	movw	r1, #2716
	add	r3, r3, #10
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L3691+32
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3569
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2384]
.L3569:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L3570
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r5
.L3570:
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #248]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movwne	r1, #2724
	beq	.L3661
	b	.L3665
.L3689:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	bne	.L3558
	ldr	r3, [r4, #2384]
	ldr	r0, [r4, #2364]
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	ldr	r0, [r4, #2364]
	mov	r1, #24
	bl	BsSkip
	mov	r0, #2
	b	.L3536
.L3690:
	movw	r1, #2551
	add	r3, r3, #10
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L3691+32
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3544
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2384]
.L3544:
	ldr	r5, [r7]
	cmp	r5, #0
	beq	.L3545
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r5
.L3545:
	ldr	r1, [fp, #-48]
	ldr	r0, [r4, #248]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movwne	r1, #2559
	beq	.L3661
	b	.L3665
.L3684:
	movw	r1, #2697
.L3660:
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L3691+8
	ldr	r2, .L3691+36
	bl	dprint_normal
	b	.L3661
.L3688:
	movw	r3, #2744
.L3667:
	mov	r0, r1
	str	r3, [sp]
	mov	r1, r3
	ldr	r2, .L3691+40
	ldr	r3, .L3691+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L3536
.L3685:
	mov	r1, #2704
.L3664:
	ldr	r3, .L3691+8
	str	r1, [sp]
	ldr	r2, .L3691+40
	bl	dprint_normal
	mvn	r0, #0
	b	.L3536
.L3687:
	movw	r1, #2734
.L3666:
	str	r1, [sp]
	ldr	r3, .L3691+8
	ldr	r2, .L3691+40
	bl	dprint_normal
	mvn	r0, #0
	b	.L3536
.L3692:
	.align	2
.L3691:
	.word	.LC457
	.word	g_EventReportFunc
	.word	.LANCHOR0+1116
	.word	.LC455
	.word	.LC456
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_RpuStartCode
	.word	.LC454
	.word	.LC451
	.word	.LC452
	.word	.LC453
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
	ldr	r0, [r0, #2596]
	cmp	r0, #0
	beq	.L3705
	add	r2, r4, #2608
	mov	r5, #0
	add	r2, r2, #4
	mov	r3, r5
.L3696:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	cmp	r1, #0
	addeq	r5, r5, #1
	cmp	r3, r0
	bne	.L3696
.L3697:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L3697
	cmp	r5, #0
	ble	.L3699
.L3703:
	ldr	r1, [r4, #2596]
	cmp	r1, #0
	beq	.L3700
	ldr	r3, [r4, #2616]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3707
	add	r2, r4, #2608
	mov	r3, #0
	add	r2, r2, #8
	b	.L3704
.L3701:
	ldr	r0, [r2, #4]!
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3707
.L3704:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3701
.L3700:
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	subs	r5, r5, #1
	bne	.L3703
.L3699:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3707:
	mov	r1, r3
	b	.L3700
.L3705:
	mov	r5, r0
	b	.L3697
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r2, [r0, #2384]
	add	r5, r0, #4096
	ldr	r3, .L3796
	mov	ip, #0
	mov	r4, r0
	ldr	r1, [r2, #16]
	str	r1, [r5, #2452]
	ldr	r1, [r2, #28]
	str	r1, [r5, #2448]
	ldr	r6, [r2, #24]
	str	r6, [r5, #2456]
	ldr	r1, [r0, #248]
	strb	ip, [r0, #3]
	ldr	r3, [r3, r1, asl #2]
	add	r3, r3, #204800
	ldrb	r1, [r3, #2456]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L3782
.L3718:
	ldr	r3, [r5, #2576]
	cmp	r3, #1
	beq	.L3783
.L3719:
	ldr	r3, [r4, #200]
	ldr	r2, [r4, #156]
	cmp	r3, r2
	bcs	.L3784
	ldrb	r3, [r5, #1825]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3785
	mov	r0, r4
	bl	HEVC_PicTypeStatistic
	mov	r0, r4
	bl	HEVC_CalcStreamBits
	ldr	r3, [r5, #2576]
	cmp	r3, #2
	beq	.L3736
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	bne	.L3737
	ldrb	r3, [r5, #2425]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3786
.L3737:
	mov	r0, r4
	bl	HEVC_WriteSliceMsg
	cmp	r0, #0
	bne	.L3787
.L3740:
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	beq	.L3788
.L3742:
	ldr	r3, [r4, #2896]
	mov	r0, #0
	str	r3, [r5, #1868]
	ldr	r3, [r4, #2900]
	str	r3, [r5, #1872]
.L3724:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3788:
	ldr	r3, [r5, #2460]
	mov	r2, #1
	str	r3, [r4, #300]
	ldr	r3, [r5, #2436]
	str	r2, [r4, #176]
	str	r3, [r4, #256]
	b	.L3742
.L3783:
	ldr	r3, [r4, #2340]
	cmp	r3, #0
	bne	.L3721
	ldr	r3, [r5, #2452]
	clz	r7, r6
	sub	r3, r3, #16
	mov	r7, r7, lsr #5
	cmp	r3, #4
	cmpls	r6, #0
	bne	.L3789
.L3722:
	mov	r0, r4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L3790
.L3723:
	cmp	r7, #0
	beq	.L3725
	add	r3, r4, r6
	ldrb	r8, [r3, #4]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L3791
.L3725:
	ldr	r0, [r4, #248]
	bl	VCTRL_GetChanCrcMode
	cmp	r0, #0
	bne	.L3726
	ldr	r3, [r4, #2348]
	cmp	r3, #1
	beq	.L3792
	ldr	r2, [r5, #2448]
	ldr	r3, [r4, #2396]
	add	r3, r3, r2, lsl #2
	ldr	r0, [r3, #356]
.L3729:
	cmp	r7, #0
	beq	.L3726
	add	r6, r4, r6, lsl #2
	ldr	r2, [r6, #208]
	cmp	r2, #-2147483647
	beq	.L3726
	ldr	r3, [r5, #2436]
	add	r0, r0, r2
	cmp	r3, r0
	bge	.L3726
	ldr	r1, [r5, #2452]
	cmp	r1, #21
	bne	.L3726
	str	r2, [sp]
	movw	r1, #6725
	ldr	r2, .L3796+4
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_CRAOutputFrame
	mov	r3, #-2147483647
	str	r3, [r6, #208]
.L3726:
	ldr	r3, [r4, #2412]
	ldr	r2, [r3, #8]
	cmp	r2, #2
	beq	.L3721
	ldr	r3, [r3, #12]
	mov	r0, r4
	cmp	r3, #2
	beq	.L3793
	bl	HEVC_RefPicProcess
	cmp	r0, #0
	bne	.L3743
.L3721:
	mov	r0, r4
	bl	HEVC_InitPic
	cmn	r0, #2
	beq	.L3724
	cmp	r0, #0
	bne	.L3794
	ldr	r3, [r4, #236]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r4, #236]
	bl	HEVC_SetScalingList
	mov	r0, r4
	bl	HEVC_WritePicMsg
	cmp	r0, #0
	beq	.L3719
	ldr	r2, .L3796+8
	movw	r1, #6775
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3782:
	ldr	r1, [r3, #2572]
	cmp	r1, #1
	bne	.L3718
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L3718
	ldr	r1, [r2, #16]
	bl	HEVC_Get_Last_IDR_Frame_Info
	b	.L3718
.L3736:
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3740
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
	b	.L3740
.L3786:
	mov	r0, r4
	bl	HEVC_DecList
	cmp	r0, #0
	bne	.L3795
	mov	r0, r4
	bl	HEVC_IsRefListWrong
	cmp	r0, #0
	beq	.L3737
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r2, .L3796+12
	movw	r1, #6826
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3789:
	mov	r0, r4
	bl	HEVC_IsPVRFlushPic
	cmp	r0, #0
	beq	.L3723
	b	.L3722
.L3743:
	mvn	r0, #0
	b	.L3724
.L3793:
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	b	.L3721
.L3791:
	ldr	r3, [r4, #2596]
	cmp	r3, #0
	beq	.L3725
	mov	r0, r4
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L3725
	mov	r0, r8
	ldr	r3, .L3796+16
	ldr	r2, .L3796+20
	movw	r1, #6694
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3785:
	ldr	r2, .L3796+24
	movw	r1, #6796
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3792:
	ldr	r1, [r4, #2396]
	add	r3, r1, #352
	add	r1, r1, #380
.L3728:
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	movcc	r0, r2
	cmp	r3, r1
	bne	.L3728
	b	.L3729
.L3784:
	ldr	r2, .L3796+28
	movw	r1, #6782
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r4, #200]
	ldr	r2, [r4, #156]
	cmp	r3, r2
	bcc	.L3734
	ldr	r1, .L3796+32
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L3734
	str	r3, [fp, #-44]
	mov	r1, #27
	str	r2, [fp, #-40]
	mov	r3, #8
	sub	r2, fp, #44
	ldr	r0, [r4, #248]
	blx	r5
.L3734:
	ldr	r2, .L3796+36
	movw	r1, #6789
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3724
.L3787:
	ldr	r2, .L3796+40
	movw	r1, #6836
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3794:
	ldr	r2, .L3796+44
	movw	r1, #6764
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3795:
	mov	r3, r0
	ldr	r2, .L3796+48
	movw	r1, #6817
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3790:
	ldr	r3, .L3796+16
	movw	r1, #6681
	ldr	r2, .L3796+52
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L3724
.L3797:
	.align	2
.L3796:
	.word	s_pstVfmwChan
	.word	.LC460
	.word	.LC462
	.word	.LC467
	.word	.LANCHOR0+1136
	.word	.LC459
	.word	.LC465
	.word	.LC463
	.word	g_EventReportFunc
	.word	.LC464
	.word	.LC468
	.word	.LC461
	.word	.LC466
	.word	.LC458
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
	ldr	ip, [r0, #2384]
	mov	r4, r0
	ldr	r3, [ip, #8]
	cmp	r3, #0
	ldrne	r1, [r0, #240]
	movne	r2, ip
	movne	r3, #0
	beq	.L3803
.L3802:
	ldr	r0, [r2, #44]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, r0
	str	r1, [r4, #240]
	ldr	r0, [ip, #8]
	cmp	r0, r3
	bhi	.L3802
.L3803:
	mov	r3, #0
	strb	r3, [ip]
	ldr	r3, [r4, #2384]
	ldr	r2, [r3, #16]
	sub	r2, r2, #36
	cmp	r2, #1
	bls	.L3943
.L3801:
	ldr	r2, [r3, #4]
	add	r2, r2, #16
	str	r2, [r3, #4]
	ldr	r3, [r4, #2384]
	ldr	r3, [r3, #16]
	cmp	r3, #49
	ldrls	pc, [pc, r3, asl #2]
	b	.L3804
.L3806:
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3805
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3807
	.word	.L3808
	.word	.L3809
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3810
	.word	.L3810
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3804
	.word	.L3811
	.word	.L3812
.L3943:
	mov	r2, #1
	strb	r2, [r4, #3]
	b	.L3801
.L3812:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	beq	.L3944
.L3828:
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3931
.L3930:
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2384]
.L3815:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3805:
	mov	r0, r4
	bl	HEVC_DecSlice
	cmn	r0, #2
	beq	.L3815
	cmp	r0, #0
	beq	.L3931
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3941
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3941:
	ldr	r3, .L3946
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3928
.L3933:
	mov	r3, #0
	ldr	r0, [r4, #248]
	mov	r2, r3
	mov	r1, #42
	blx	r5
.L3928:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3807:
	mov	r0, r4
	bl	HEVC_DecVPS
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3813
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3813:
	cmp	r5, #0
	bne	.L3945
.L3931:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3808:
	mov	r0, r4
	bl	HEVC_DecSPS
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3818
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3818:
	cmp	r5, #0
	beq	.L3931
	ldr	r6, .L3946
	movw	r1, #3363
	ldr	r2, .L3946+4
	b	.L3938
.L3809:
	mov	r0, r4
	bl	HEVC_DecPPS
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3820
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3820:
	cmp	r5, #0
	beq	.L3931
	ldr	r6, .L3946
	movw	r1, #3377
	ldr	r2, .L3946+8
.L3938:
	mov	r0, #1
	bl	dprint_normal
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3928
	sub	r2, fp, #28
	mvn	r5, #0
	mov	r3, #4
	mov	r1, #9
	str	r5, [r2, #-4]!
	ldr	r0, [r4, #248]
	blx	r7
	ldr	r6, [r6]
	cmp	r6, #0
	beq	.L3928
	mov	r3, #0
	ldr	r0, [r4, #248]
	mov	r2, r3
	mov	r1, #42
	blx	r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3810:
	mov	r0, r4
	bl	HEVC_DecSEI
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3821
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3821:
	cmp	r5, #0
	beq	.L3931
	ldr	r2, .L3946+12
	mov	r1, #3392
	mov	r0, #1
	bl	dprint_normal
	b	.L3941
.L3811:
	add	r5, r4, #2560
	mov	r1, #32
	mov	r0, r5
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r5, r0
	beq	.L3826
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3825
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3825:
	add	r3, r4, #4096
	ldrb	r3, [r3, #1825]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3931
.L3826:
	movw	r2, #20036
	movw	r3, #20553
	movt	r3, 18515
	movt	r2, 17221
	cmp	r5, r2
	cmpeq	r6, r3
	mov	r3, #0
	strb	r3, [r4, #8]
	bne	.L3931
	ldr	r5, .L3946
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L3827
	mov	r2, r3
	mov	r1, #41
	ldr	r0, [r4, #248]
	blx	r6
.L3827:
	add	r3, r4, #4096
	ldrb	r3, [r3, #1825]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3931
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3931
.L3830:
	ldr	r5, [r5]
	cmp	r5, #0
	bne	.L3933
	b	.L3928
.L3804:
	movw	r1, #3489
	ldr	r2, .L3946+16
	mov	r0, #20
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	ldr	r3, [r1, #16]
	cmp	r3, #63
	bhi	.L3831
	cmp	r1, #0
	bne	.L3930
	b	.L3931
.L3831:
	cmp	r1, #0
	beq	.L3832
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L3832:
	ldr	r3, .L3946
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3931
	mov	r3, #0
	ldr	r0, [r4, #248]
	mov	r2, r3
	mov	r1, #42
	blx	r5
	b	.L3931
.L3945:
	ldr	r6, .L3946
	movw	r1, #3349
	ldr	r2, .L3946+20
	b	.L3938
.L3944:
	ldr	r5, .L3946
	strb	r0, [r4, #9]
	ldr	r6, [r5]
	cmp	r6, #0
	beq	.L3829
	mov	r3, #0
	mov	r1, #41
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r6
.L3829:
	add	r3, r4, #4096
	ldrb	r3, [r3, #1825]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3828
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3828
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L3830
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
	b	.L3830
.L3947:
	.align	2
.L3946:
	.word	g_EventReportFunc
	.word	.LC470
	.word	.LC471
	.word	.LC472
	.word	.LC473
	.word	.LC469
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
	ldr	r1, [r1, #24]
	ldr	r0, [r0, #248]
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	ip, .L3970
	mov	r4, r0
	mov	r3, #0
	mov	r8, r1
	add	r0, r0, #6464
	str	r3, [r2]
	mov	r1, r3
	str	r3, [r8]
	mov	r6, r2
	ldr	r3, [ip, #48]
	movw	r2, #1356
	add	r0, r0, #56
	add	r5, r4, #4096
	blx	r3
	ldr	r3, [r4, #2384]
	mov	r0, r4
	ldr	r2, [r3, #16]
	str	r2, [r5, #2452]
	ldr	r2, [r3, #28]
	str	r2, [r5, #2448]
	ldr	r3, [r3, #24]
	str	r3, [r5, #2456]
	bl	HEVC_DecSliceSegmentHeader
	cmp	r0, #0
	bne	.L3966
	ldr	r2, [r5, #2460]
	mov	r1, #1888
	ldr	r3, [r4, #2376]
	movw	r7, #12644
	ldr	r9, [r4, #2340]
	mla	r3, r1, r2, r3
	ldr	r2, [r4, #2372]
	cmp	r9, #1
	ldr	r3, [r3, #32]
	mla	r7, r7, r3, r2
	beq	.L3967
	ldr	r3, [r5, #2576]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r8]
	ldr	r0, [r4, #2396]
	ldr	ip, [r4, #2412]
	ldr	r2, [r7, #184]
	ldr	r3, [r0, #184]
	ldr	lr, [ip, #816]
	subs	r1, r2, r3
	ldr	r2, [r0, #64]
	ldr	r3, [r7, #64]
	movne	r1, #1
	cmp	lr, #1
	ldr	r0, [r0, #68]
	ldr	lr, [r7, #68]
	beq	.L3968
.L3955:
	cmp	r3, r2
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	lr, r0
	moveq	r3, r2
	orrne	r3, r2, #1
	cmp	r3, #0
	beq	.L3958
	mov	r0, #0
	mov	r3, #1
	str	r3, [r6]
.L3951:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3967:
	ldr	r0, [r4, #2364]
	bl	BsResidBits
	ldr	r3, [r7, #188]
	ldr	r1, [r4, #200]
	add	r1, r1, #1
	mov	r5, r0
	ldr	r0, [r7, #192]
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	cmp	r5, r0
	movge	r3, #0
	movlt	r3, #1
	orrs	r3, r3, r5, lsr #31
	bne	.L3953
.L3958:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3966:
	ldr	r2, .L3970+4
	movw	r1, #14151
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L3970+8
	ldr	r5, [r3]
	cmp	r5, #0
	mvneq	r0, #0
	beq	.L3951
	sub	r2, fp, #36
	ldr	r0, [r4, #248]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #9
	str	r4, [r2, #-4]!
	blx	r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3968:
	ldr	r5, [r7, #96]
	ldr	r7, [r7, #88]
	cmp	r5, r7
	movcc	r5, r7
	str	r5, [ip, #852]
	ldr	r5, [r4, #2396]
	ldr	r7, [r4, #2412]
	ldr	ip, [r5, #96]
	ldr	r4, [r5, #88]
	ldr	r5, [r7, #852]
	cmp	ip, r4
	movcc	ip, r4
	cmp	ip, #8
	movls	r4, #0
	movhi	r4, #1
	cmp	r5, #8
	movne	r4, #0
	cmp	r4, #0
	beq	.L3969
.L3956:
	mov	ip, #1
	str	ip, [r7, #856]
	str	ip, [r6]
	b	.L3955
.L3969:
	sub	ip, ip, #8
	cmp	r5, #8
	clz	ip, ip
	mov	ip, ip, lsr #5
	movle	ip, #0
	cmp	ip, #0
	beq	.L3955
	b	.L3956
.L3953:
	str	r0, [sp]
	mov	r3, r5
	mov	r0, r9
	ldr	r2, .L3970+12
	movw	r1, #14167
	bl	dprint_normal
	mvn	r0, #0
	b	.L3951
.L3971:
	.align	2
.L3970:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC474
	.word	g_EventReportFunc
	.word	.LC475
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
	ldr	r0, [r0, #200]
	cmp	r0, #0
	bne	.L3974
	add	r3, r4, #4096
	ldrb	r3, [r3, #1825]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3976
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3974:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3976:
	ldr	r3, .L3977
	movw	r1, #14226
	ldr	r2, .L3977+4
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3978:
	.align	2
.L3977:
	.word	.LANCHOR0+1152
	.word	.LC476
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
	ldr	r2, [r0, #2404]
	cmp	r2, #0
	beq	.L3982
	mov	r0, #0
.L3981:
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #1356]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L3981
	ldmfd	sp, {fp, sp, pc}
.L3982:
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
	mov	r4, r0
	mov	r0, #0
	ldr	r3, [r4, #2332]
	str	r0, [r4, #2340]
	cmp	r3, r0
	str	r0, [r4, #2348]
	bne	.L3986
	ldr	r0, [r4, #2336]
	cmp	r0, #2
	movne	r0, #0
	mvneq	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3986:
	ldr	r3, [r4, #2336]
	cmp	r3, #2
	beq	.L4016
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #2344]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	str	r0, [r4, #2344]
.L4014:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4016:
	ldr	r3, [r4, #2344]
	cmp	r3, #1
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #248]
	bl	VCTRL_CheckFreshSeg
	cmp	r0, #0
	beq	.L3989
.L3992:
	ldr	r3, [r4, #2384]
	ldr	r0, [r4, #2364]
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2364]
	bl	BsSkip
	ldr	r0, [r4, #2364]
	bl	BsResidBits
	cmp	r0, #15
	ble	.L4014
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsSkip
	mov	r1, #6
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #9
	mov	r5, r0
	ldr	r0, [r4, #2364]
	bl	BsSkip
	mov	r0, r5
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r6, r0
	beq	.L4017
	ldr	r3, [r4, #200]
	cmp	r3, #0
	beq	.L4014
	mov	r3, #0
.L4000:
	bic	r5, r5, #16
	sub	r5, r5, #32
	cmp	r5, #1
	movhi	r5, r3
	orrls	r5, r3, #1
	cmp	r5, #0
	bne	.L3995
	add	r1, r4, #4096
	ldr	r3, [r1, #2576]
	cmp	r3, #2
	beq	.L3995
	cmp	r6, #1
	bne	.L4014
.L3999:
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r4, #2340]
	str	r3, [r4, #2344]
	ldrb	r3, [r1, #1825]	@ zero_extendqisi2
	str	r3, [r4, #2352]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3989:
	ldr	r0, [r4, #248]
	bl	VCTRL_GetChanCrcMode
	cmp	r0, #0
	bne	.L3992
	ldr	r3, [r4, #2412]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L3992
	b	.L4014
.L3995:
	ldr	r3, .L4018
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3997
	mov	r3, #0
	mov	r1, #41
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r5
.L3997:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	bne	.L4014
	add	r2, r4, #4096
	mov	r3, #1
	mvn	r0, #0
	str	r3, [r4, #2348]
	strb	r3, [r2, #1824]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4017:
	ldr	r0, [r4, #2364]
	bl	BsResidBits
	cmp	r0, #0
	movle	r0, #0
	ble	.L3994
	mov	r1, r6
	ldr	r0, [r4, #2364]
	bl	BsGet
.L3994:
	ldr	r3, [r4, #200]
	cmp	r3, #0
	addeq	r1, r4, #4096
	beq	.L3999
	adds	r3, r0, #0
	movne	r3, #1
	b	.L4000
.L4019:
	.align	2
.L4018:
	.word	g_EventReportFunc
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
	ldr	r3, [r0, #200]
	mov	r4, r0
	cmp	r3, #0
	beq	.L4023
	ldr	r2, [r0, #2420]
	cmp	r2, #0
	beq	.L4029
.L4023:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4029:
	add	r2, r0, #8192
	ldr	r2, [r2, #60]
	cmp	r2, #1
	bls	.L4023
	ldr	r2, [r0, #2356]
	cmp	r3, r2
	beq	.L4023
	ldr	r3, [r0, #2340]
	cmp	r3, #1
	beq	.L4030
	cmp	r3, #0
	bne	.L4027
	ldr	r0, [r0, #248]
	bl	VCTRL_CheckFreshSeg
	cmp	r0, #0
	beq	.L4027
.L4025:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4030:
	ldr	r3, [r0, #2384]
	cmp	r3, #0
	bne	.L4025
.L4027:
	ldr	r0, [r4, #248]
	bl	VCTRL_GetChanCrcMode
	cmp	r0, #0
	beq	.L4023
	ldr	r3, .L4031
	ldr	r3, [r3]
	blx	r3
	movw	r2, #52429
	movt	r2, 52428
	umull	r2, r3, r0, r2
	mov	r2, r3, lsr #3
	mov	r3, r2, asl #3
	add	r3, r3, r2, lsl #1
	rsb	r0, r3, r0
	cmp	r0, #2
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4032:
	.align	2
.L4031:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVCDEC_IsNeedSedOnly, .-HEVCDEC_IsNeedSedOnly
	.align	2
	.type	HEVCDEC_SetDecParam.part.30, %function
HEVCDEC_SetDecParam.part.30:
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
	ldr	r3, [r0, #2344]
	mov	r4, r0
	cmp	r3, #1
	beq	.L4053
.L4034:
	mov	r0, r4
	bl	HEVCDEC_IsNeedSedOnly
	cmp	r0, #1
	beq	.L4054
	ldr	r3, [r4, #2340]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	ip, [r4, #2352]
	add	r3, r4, #4096
	ldr	r0, [r4, #200]
	ldr	r1, [r4, #180]
	ldr	r2, [r4, #232]
	sub	r0, r0, #1
	sub	r1, r1, #1
	str	r0, [r4, #200]
	str	r1, [r4, #180]
	sub	r2, r2, #1
	str	r2, [r4, #232]
	strb	ip, [r3, #1825]
.L4052:
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4053:
	ldr	r3, [r0, #200]
	cmp	r3, #0
	beq	.L4034
	ldr	r3, [r0, #2420]
	cmp	r3, #0
	bne	.L4034
	ldr	r2, .L4055
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L4035
	mov	r2, r3
	mov	r1, #41
	ldr	r0, [r0, #248]
	blx	r5
.L4035:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	bne	.L4052
	add	r2, r4, #4096
	mov	r3, #1
	str	r3, [r4, #2348]
	strb	r3, [r2, #1824]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4054:
	add	r2, r4, #12288
	add	ip, r4, #8192
	mov	r1, #0
	add	r3, ip, #40
	str	r0, [r2, #868]
	ldr	r2, [r4, #200]
	str	r2, [r4, #2356]
	str	r2, [ip, #2400]
	str	r3, [r4, #2420]
	str	r1, [r4, #2344]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4056:
	.align	2
.L4055:
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	HEVCDEC_SetDecParam.part.30, .-HEVCDEC_SetDecParam.part.30
	.align	2
	.global	HEVCDEC_SetDecParam
	.type	HEVCDEC_SetDecParam, %function
HEVCDEC_SetDecParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #2332]
	cmp	r3, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_SetDecParam.part.30
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r6, .L4074
	ldr	r2, [r0, #2420]
	mov	r3, #184
	ldr	lr, [r0, #248]
	mov	r4, r0
	mla	r6, r3, r1, r6
	ldr	r5, [r2, #20]
	ldr	r3, [r2, #16]
	mov	r0, #20
	ldr	ip, .L4074+4
	movw	r1, #14445
	mov	r7, #0
	mla	r3, r5, r3, r3
	ldr	r2, [r6, #20]
	ldr	r8, [ip, lr, asl #2]
	add	r5, r3, r5
	str	r2, [sp]
	ldr	r2, .L4074+8
	mov	r3, r5
	bl	dprint_normal
	ldr	r3, [r6, #20]
	str	r7, [r4, #2420]
	cmp	r3, r5
	ldr	r3, [r4, #2340]
	beq	.L4072
	cmp	r3, #1
	beq	.L4073
.L4064:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4073:
	ldr	ip, [r4, #2352]
	add	r3, r4, #4096
	ldr	r0, [r4, #200]
	ldr	r1, [r4, #180]
	ldr	r2, [r4, #232]
	sub	r0, r0, #1
	sub	r1, r1, #1
	str	r7, [r4, #2344]
	str	r1, [r4, #180]
	sub	r2, r2, #1
	str	r0, [r4, #200]
	str	r2, [r4, #232]
	strb	ip, [r3, #1825]
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L4064
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r0, #0
	str	r7, [r4, #2384]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4072:
	cmp	r3, #1
	beq	.L4061
	ldr	r3, .L4074+12
	ldr	r5, [r3]
	cmp	r5, r7
	beq	.L4062
	mov	r3, r7
	mov	r2, r7
	mov	r1, #41
	ldr	r0, [r4, #248]
	blx	r5
.L4062:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	bne	.L4064
	add	r2, r4, #4096
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #2348]
	strb	r3, [r2, #1824]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4061:
	ldr	lr, [r4, #2352]
	add	r8, r8, #204800
	ldr	r0, [r4, #200]
	add	ip, r4, #4096
	ldr	r1, [r4, #180]
	ldr	r2, [r4, #232]
	sub	r0, r0, #1
	str	r3, [r4, #2344]
	sub	r1, r1, #1
	str	r0, [r4, #200]
	sub	r2, r2, #1
	str	r1, [r4, #180]
	str	r2, [r4, #232]
	strb	lr, [ip, #1825]
	strb	r3, [r8, #2785]
	strb	r3, [r4, #7]
	b	.L4064
.L4075:
	.align	2
.L4074:
	.word	g_BackUp
	.word	s_pstVfmwChan
	.word	.LC477
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	HEVCDEC_VDMProcSedOnly, .-HEVCDEC_VDMProcSedOnly
	.align	2
	.global	HEVCDEC_Init
	.type	HEVCDEC_Init, %function
HEVCDEC_Init:
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
	add	r7, r0, #8192
	ldr	r5, .L4087
	mov	r4, r0
	ldr	r8, [r7, #32]
	mov	r6, r1
	movw	r2, #26960
	mov	r1, #0
	ldr	r3, [r5, #48]
	blx	r3
	str	r8, [r7, #32]
	mov	r3, #65
	str	r6, [r4, #2412]
	str	r3, [r4, #168]
	mov	r2, #200
	mov	r3, #206
	str	r2, [r4, #156]
	str	r3, [r4, #172]
	mov	r2, #0
	mov	r3, #17
	str	r2, [r4, #2420]
	str	r3, [r4, #160]
	str	r3, [r4, #164]
	ldr	r0, [r6, #560]
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L4083
	ldr	r2, [r4, #160]
	movw	r9, #12644
	ldr	r0, [r4, #2412]
	mov	r8, #1888
	ldr	r3, [r4, #164]
	mov	r7, #1360
	mov	lr, r2, asl #7
	ldr	ip, [r0, #556]
	sub	lr, lr, r2, asl #3
	ldr	r2, [r4, #156]
	add	r0, lr, ip
	add	ip, r1, ip
	add	r10, r1, r0
	str	r10, [r4, #2372]
	mla	r0, r9, r3, r0
	ldr	r3, [r4, #172]
	mul	r2, r7, r2
	add	r3, r3, #1
	str	ip, [r4, #2368]
	mov	r10, r3, asl #7
	sub	r3, r10, r3, asl #5
	add	r10, r1, r0
	str	r10, [fp, #-48]
	ldr	r10, [r4, #168]
	mla	r0, r8, r10, r0
	ldr	r10, [fp, #-48]
	str	r10, [r4, #2376]
	add	r10, r0, r2
	add	r3, r10, r3
	add	r0, r1, r0
	add	r10, r1, r10
	add	r1, r1, r3
	str	r1, [r4, #2404]
	ldr	r1, [r4, #2412]
	str	r10, [r4, #2408]
	ldr	r10, [r4, #172]
	str	r0, [r4, #2416]
	ldr	r1, [r1, #564]
	add	r3, r3, r10, lsl #2
	cmp	r3, r1
	bhi	.L4084
	ldr	r6, [r6, #596]
	cmp	r6, #0
	beq	.L4085
.L4080:
	ldr	r3, [r5, #48]
	mov	r1, #0
	blx	r3
	ldr	r3, [r4, #172]
	mov	r1, #0
	ldr	r6, [r5, #48]
	add	r3, r3, #1
	ldr	r0, [r4, #2408]
	mov	r2, r3, asl #7
	sub	r2, r2, r3, asl #5
	blx	r6
	ldr	r2, [r4, #172]
	ldr	r3, [r5, #48]
	mov	r1, #0
	ldr	r0, [r4, #2404]
	mov	r2, r2, asl #2
	blx	r3
	ldr	r1, [r4, #164]
	ldr	ip, [r4, #160]
	movw	r3, #12644
	ldr	r0, [r4, #168]
	mov	r2, #1888
	mul	r3, r3, r1
	mov	r1, ip, asl #7
	mul	r2, r2, r0
	sub	r1, r1, ip, asl #3
	ldr	r0, [r4, #2368]
	sub	r1, r1, #120
	ldr	lr, [r4, #2372]
	sub	r3, r3, #12608
	add	r1, r0, r1
	ldr	r0, [r4, #2376]
	sub	r3, r3, #36
	sub	r2, r2, #1888
	str	r1, [r4, #2392]
	add	r3, lr, r3
	add	r2, r0, r2
	str	r3, [r4, #2396]
	str	r2, [r4, #2400]
	mov	r0, r4
	str	ip, [r1, #4]
	ldr	r3, [r4, #2400]
	ldr	r2, [r4, #164]
	str	r2, [r3, #28]
	ldr	r3, [r4, #2396]
	ldr	r2, [r4, #168]
	str	r2, [r3, #56]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #248]
	beq	.L4086
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #208]
	bl	HEVC_InitDecPara
	add	r2, r4, #12288
	mov	r3, #0
	movw	ip, #9999
	str	r3, [r2, #936]
	mov	r1, #1
	ldr	lr, [r4, #168]
	mov	r0, r3
	ldr	r2, [r4, #2412]
	str	r3, [r4, #2360]
	str	lr, [r4, #300]
	str	ip, [r4, #256]
	strb	r1, [r4]
	ldr	r3, [r2, #612]
	str	r3, [r4, #2332]
.L4082:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4085:
	mov	r2, lr
	mov	r0, ip
	ldr	r3, [r5, #48]
	mov	r1, r6
	blx	r3
	ldr	r2, [r4, #164]
	ldr	r3, [r5, #48]
	mov	r1, r6
	ldr	r0, [r4, #2372]
	mul	r2, r9, r2
	blx	r3
	ldr	r2, [r4, #168]
	mov	r1, r6
	ldr	r3, [r5, #48]
	ldr	r0, [r4, #2376]
	mul	r2, r8, r2
	blx	r3
	ldr	r2, [r4, #156]
	ldr	r0, [r4, #2416]
	mul	r2, r7, r2
	b	.L4080
.L4084:
	str	r1, [sp, #4]
	mov	r0, #0
	str	r3, [sp]
	movw	r1, #14542
	ldr	r3, .L4087+4
	ldr	r2, .L4087+8
	bl	dprint_normal
	mvn	r0, #19
	b	.L4082
.L4086:
	ldr	r3, .L4087+4
	movw	r1, #14568
	ldr	r2, .L4087+12
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #19
	b	.L4082
.L4083:
	ldr	r3, .L4087+4
	movw	r1, #14516
	ldr	r2, .L4087+16
	bl	dprint_normal
	mvn	r0, #19
	b	.L4082
.L4088:
	.align	2
.L4087:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1172
	.word	.LC479
	.word	.LC480
	.word	.LC478
	UNWIND(.fnend)
	.size	HEVCDEC_Init, .-HEVCDEC_Init
	.align	2
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
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
	ldr	r3, [r0, #144]
	mov	r4, r0
	cmp	r3, #0
	beq	.L4092
	add	r3, r0, #4096
	ldrb	r3, [r3, #1825]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4092
	add	r0, r0, #14784
	mov	lr, #0
.L4097:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L4093
	cmp	r0, #0
	beq	.L4094
	ldr	ip, [r4, #2596]
	cmp	ip, #0
	beq	.L4094
	ldr	r2, [r4, #2616]
	cmp	r2, r0
	beq	.L4093
	add	r2, r4, #2608
	add	r2, r2, #8
	b	.L4095
.L4096:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L4093
.L4095:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L4096
.L4094:
	cmp	lr, #19
	bhi	.L4112
	ldr	r0, [r4, #248]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	beq	.L4092
	cmn	r0, #1
	beq	.L4113
.L4112:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4092:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4093:
	add	lr, lr, #1
	add	r0, r0, #608
	cmp	lr, #20
	bne	.L4097
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4113:
	ldr	r2, .L4114
	movw	r1, #14633
	mov	r0, #1
	bl	dprint_normal
	add	r1, r4, #7872
	add	r1, r1, #8
	ldr	r0, [r4, #248]
	bl	FSP_ClearNotInVoQueue
	b	.L4112
.L4115:
	.align	2
.L4114:
	.word	.LC481
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	cmp	r1, #0
	mov	r3, #0
	mov	r4, r0
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	beq	.L4202
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L4203
	ldr	r0, [r0, #2412]
	ldrb	ip, [r4, #7]	@ zero_extendqisi2
	ldr	r2, [r0, #8]
	cmp	ip, #1
	mov	r2, r2, asl #16
	and	r2, r2, #458752
	str	r2, [r4, #244]
	beq	.L4120
	ldr	r2, [r0, #816]
	cmp	r2, #1
	beq	.L4204
.L4121:
	mov	r0, r4
	bl	HEVC_ReceivePacket
	ldr	r3, [r4, #2384]
	str	r3, [r4, #2388]
	mov	r5, r0
.L4122:
	cmp	r5, #0
	mov	r3, #0
	strb	r3, [r4, #7]
	beq	.L4123
.L4150:
	mov	r0, #0
.L4200:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4204:
	ldr	r2, [r0, #848]
	cmp	r2, #1
	bne	.L4121
	ldr	r2, [r4, #324]
	cmp	r2, #1
	bne	.L4121
	ldr	r2, [r4, #2388]
	mov	r0, r3
	str	r3, [r4, #324]
	strb	r3, [r4, #7]
	str	r2, [r4, #2384]
	b	.L4200
.L4123:
	mov	r0, r4
	bl	HEVCDEC_CheckSedOnly
	cmp	r0, #0
	beq	.L4124
	ldr	r3, [r4, #2412]
	ldr	r3, [r3, #848]
	cmp	r3, #1
	beq	.L4124
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L4125
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2384]
.L4125:
	ldr	r3, [r4, #2332]
	cmp	r3, #0
	bne	.L4205
.L4201:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4120:
	ldr	r2, [r4, #2384]
	cmp	r2, #0
	movne	r5, #0
	mvneq	r5, #0
	cmp	r2, #0
	bne	.L4122
	mov	r0, r3
	ldr	r2, .L4214
	movw	r1, #14713
	bl	dprint_normal
	mov	r0, r5
	b	.L4200
.L4124:
	ldr	r3, [r4, #2384]
	mov	r5, #0
	ldr	r6, .L4214+4
	str	r5, [r3, #4]
	ldr	r3, [r4, #2384]
	ldr	r0, [r4, #2364]
	ldr	r2, [r3, #44]
	ldr	r1, [r3, #40]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2364]
	bl	BsSkip
	ldr	r3, [r4, #248]
	movw	r2, #2456
	ldr	r3, [r6, r3, asl #2]
	add	r3, r3, #204800
	ldrsb	r9, [r3, r2]
	cmp	r9, #1
	movne	r7, #3
	movne	r8, #2
	beq	.L4206
.L4127:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	ldr	r0, [r4, #2364]
	ldr	r9, [r4, #2384]
	bl	BsGet
	mov	r1, #6
	str	r0, [r9, #16]
	ldr	r0, [r4, #2364]
	ldr	r9, [r4, #2384]
	bl	BsGet
	str	r0, [r9, #24]
	ldr	r9, [r4, #2384]
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L4207
	mov	r1, #3
	ldr	r0, [r4, #2364]
	bl	BsGet
	str	r0, [r9, #28]
	ldr	r9, [r4, #2384]
	ldr	r3, [r9, #28]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r9, #28]
	ldrne	r9, [r4, #2384]
	ldr	r0, [r9, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r10, r0
	beq	.L4208
	mov	r3, #0
	str	r3, [r9, #4]
	ldr	r3, [r4, #2384]
	add	r0, r4, #2560
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #44]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2364]
	bl	BsSkip
	cmp	r7, #1
	cmpeq	r8, #1
	moveq	r7, #1
	movne	r7, #0
	cmp	r5, #1
	moveq	r5, #0
	andne	r5, r7, #1
	cmp	r5, #0
	beq	.L4148
	mov	r1, #16
	ldr	r0, [r4, #2364]
	bl	BsSkip
.L4148:
	mov	r1, #1
	ldr	r0, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	ldr	r0, [r4, #2364]
	ldr	r5, [r4, #2384]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #16]
	ldr	r0, [r4, #2364]
	ldr	r5, [r4, #2384]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #24]
	ldr	r0, [r4, #2364]
	ldr	r5, [r4, #2384]
	bl	BsGet
	str	r0, [r5, #28]
	ldr	r2, [r4, #2384]
	ldr	r3, [r2, #28]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r2, #28]
.L4137:
	mov	r0, r4
	bl	HEVC_DecOneNal
	cmn	r0, #2
	mov	r5, r0
	beq	.L4200
	cmp	r0, #0
	bne	.L4209
	add	r3, r4, #4096
	str	r0, [r3, #1880]
	ldr	r3, [r4, #2332]
	cmp	r3, #1
	bne	.L4150
	mov	r0, r4
	bl	HEVCDEC_SetDecParam.part.30
	mov	r0, r5
	b	.L4200
.L4205:
	mov	r0, r4
	bl	HEVCDEC_SetDecParam.part.30
	b	.L4201
.L4206:
	ldr	r8, [r3, #2568]
	mov	r0, r4
	ldr	r7, [r3, #2572]
	ldr	r3, [r3, #2576]
	mov	r1, r8
	mov	r2, r7
	bl	HEVC_VES_Splitter
	cmp	r0, #2
	beq	.L4152
	cmp	r0, #1
	bne	.L4200
	b	.L4127
.L4152:
	mov	r5, r9
	b	.L4127
.L4207:
	mov	r5, #0
	movw	r1, #14771
	ldr	r2, .L4214+8
	mov	r0, #1
	str	r5, [sp]
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, r5
	beq	.L4201
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2384]
	mvn	r0, #0
	b	.L4200
.L4203:
	mov	r0, r3
	ldr	r2, .L4214+12
	movw	r1, #14686
	bl	dprint_normal
	mvn	r0, #0
	b	.L4200
.L4208:
	sub	r2, fp, #48
	sub	r1, fp, #52
	mov	r0, r4
	bl	HEVC_InquireSliceProperty
	subs	r3, r0, #0
	bne	.L4132
	ldr	r5, [fp, #-52]
	cmp	r5, #1
	beq	.L4210
.L4133:
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	bne	.L4137
	ldr	r2, [r4, #248]
	mov	r7, #100
	ldr	r5, .L4214+16
	mla	r2, r7, r2, r5
	ldr	r1, [r2, #64]
	cmp	r1, #0
	beq	.L4211
.L4138:
	ldr	r3, [r4, #2384]
	mov	r0, r4
	ldr	r3, [r3, #24]
	add	r3, r4, r3
	ldrb	r5, [r3, #4]	@ zero_extendqisi2
	cmp	r5, #1
	beq	.L4212
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L4213
.L4141:
	sub	r3, fp, #56
	ldr	r0, [r4, #248]
	sub	r2, fp, #60
	sub	r1, fp, #64
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #2412]
	ldr	r0, [r3, #696]
	cmp	r0, #1
	bne	.L4137
	ldr	lr, [fp, #-56]
	cmp	lr, #0
	bgt	.L4144
	ldr	r3, [fp, #-60]
	cmp	r3, #32
	bgt	.L4144
	ldr	r5, [r4, #2420]
	cmp	r5, #0
	bne	.L4144
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L4137
	ldr	r2, [r4, #236]
	cmp	r2, #0
	beq	.L4137
	ldr	r1, [r4, #2396]
	ldr	ip, [r4, #316]
	ldr	r2, [r1, #68]
	cmp	r2, ip
	beq	.L4137
	ldr	ip, [r1, #64]
	ldr	r6, [r4, #320]
	subs	ip, ip, r6
	movne	ip, #1
	cmp	lr, #0
	movne	ip, #0
	cmp	ip, #0
	beq	.L4137
	str	r2, [r4, #316]
	ldr	ip, [r1, #64]
	movw	r1, #14853
	str	r2, [sp, #4]
	ldr	r2, .L4214+20
	str	ip, [r4, #320]
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, .L4214+24
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L4137
	mov	r3, r5
	mov	r2, r5
	mov	r1, #48
	ldr	r0, [r4, #248]
	blx	r6
	b	.L4137
.L4132:
	movw	r1, #14861
	mov	r0, r10
	ldr	r2, .L4214+28
	bl	dprint_normal
	ldr	r1, [r4, #2384]
	cmp	r1, #0
	beq	.L4146
	ldr	r0, [r4, #248]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2384]
.L4146:
	ldr	r3, .L4214+24
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L4147
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r4, #248]
	blx	r5
.L4147:
	ldr	r3, [r4, #248]
	ldr	r3, [r6, r3, asl #2]
	add	r3, r3, #204800
	ldrb	r2, [r3, #2456]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L4201
	ldr	r2, [r3, #2572]
	cmp	r2, #1
	bne	.L4201
	ldr	r3, [r3, #2576]
	cmp	r3, #2
	bne	.L4201
	add	r3, r4, #12288
	ldrb	r5, [r3, #880]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L4201
	ldr	r3, .L4214+32
	add	r0, r4, #13120
	add	r0, r0, #48
	mov	r2, #56
	mov	r1, r5
	mov	r6, #0
	ldr	r3, [r3, #48]
	mov	r7, #0
	blx	r3
	add	r3, r4, #2896
	mvn	r0, #0
	strd	r6, [r3, #40]
	strd	r6, [r3, #16]
	strd	r6, [r3, #24]
	strd	r6, [r3, #32]
	str	r5, [r4, #2892]
	b	.L4200
.L4210:
	ldr	r2, [r4, #200]
	cmp	r2, #0
	bne	.L4134
	add	r3, r4, #4096
	ldrb	r3, [r3, #1825]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4133
	ldr	r3, .L4214+36
	movw	r1, #14226
	ldr	r2, .L4214+40
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	b	.L4133
.L4202:
	mov	r0, r1
	ldr	r2, .L4214+44
	movw	r1, #14680
	bl	dprint_normal
	mvn	r0, #0
	b	.L4200
.L4134:
	ldr	ip, [r4, #2384]
	mov	r2, #21
	ldr	r1, .L4214+48
	add	r0, r4, #2560
	str	r3, [ip, #4]
	bl	BsInit
	mov	r1, #40
	ldr	r0, [r4, #2364]
	bl	BsLongSkip
	ldr	r3, [r4, #2384]
	mov	r2, #48
	mov	r0, r4
	str	r2, [r3, #16]
	strb	r5, [r4, #8]
	bl	HEVC_DecOneNal
	ldr	r3, [r4, #284]
	mvn	r0, #1
	strb	r5, [r4, #7]
	add	r3, r3, #1
	str	r3, [r4, #284]
	b	.L4200
.L4211:
	ldr	r1, .L4214+32
	str	r3, [r2, #64]
	ldr	r8, [r4, #248]
	ldr	r3, [r1]
	blx	r3
	mla	r5, r7, r8, r5
	str	r0, [r5, #68]
	b	.L4138
.L4209:
	ldr	r2, .L4214+52
	movw	r1, #14917
	mov	r0, #20
	bl	dprint_normal
	mvn	r0, #0
	b	.L4200
.L4212:
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L4141
	mov	r0, r5
	ldr	r3, .L4214+56
	ldr	r2, .L4214+60
	movw	r1, #14819
	bl	dprint_normal
	b	.L4141
.L4213:
	ldr	r3, .L4214+56
	movw	r1, #14828
	ldr	r2, .L4214+64
	mov	r0, #1
	bl	dprint_normal
	b	.L4141
.L4144:
	ldr	r3, [r4, #248]
	mov	r2, #1
	strb	r2, [r4, #7]
	mvn	r0, #1
	ldr	r3, [r6, r3, asl #2]
	add	r3, r3, #204800
	str	r2, [r3, #3540]
	b	.L4200
.L4215:
	.align	2
.L4214:
	.word	.LC484
	.word	s_pstVfmwChan
	.word	.LC485
	.word	.LC483
	.word	g_VfmwChanStat
	.word	.LC486
	.word	g_EventReportFunc
	.word	.LC487
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1152
	.word	.LC476
	.word	.LC482
	.word	.LANCHOR0+1212
	.word	.LC488
	.word	.LANCHOR0+1188
	.word	.LC459
	.word	.LC458
	UNWIND(.fnend)
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	2
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 32
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
	ldr	r2, [r0, #2412]
	add	r5, r0, #4096
	mov	r4, r0
	mov	r7, r3
	mov	r3, #0
	ldr	r6, [r2, #616]
	str	r1, [r5, #1864]
	ldr	r0, [r0, #248]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
	str	r3, [fp, #-36]
	str	r3, [fp, #-32]
	bl	VCTRL_GetChanCrcMode
	cmp	r0, #0
	bne	.L4218
	ldr	r3, [r4, #2360]
	cmp	r3, #1
	bls	.L4222
	ldr	r2, [r5, #1844]
	cmp	r2, #1920
	bls	.L4222
	ldr	r3, [r4, #2412]
	ldr	r2, [r3, #8]
	cmp	r2, #2
	strne	r0, [r4, #2332]
	ldreq	r3, [r3, #612]
	streq	r3, [r4, #2332]
.L4218:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	cmp	r6, #0
	beq	.L4224
	ldr	r0, [r5, #1884]
	mov	r3, #16
	str	r3, [fp, #-32]
	cmp	r0, #0
	beq	.L4225
	ldr	r3, .L4239
	ldr	r2, [r3, #132]
	cmp	r2, #0
	beq	.L4226
	ldr	r1, [fp, #8]
	sub	r0, fp, #56
	blx	r2
	cmp	r0, #0
	bne	.L4227
	sub	r0, fp, #44
	ldr	r3, [r5, #1884]
	ldr	lr, [fp, #-56]
	ldmia	r0, {r0, r1, r2}
	ldr	ip, [fp, #-48]
	str	lr, [r3, #304]
	str	ip, [r3, #312]
	str	r0, [r3, #316]
	str	r1, [r3, #320]
	str	r2, [r3, #324]
	str	lr, [r5, #2120]
	str	ip, [r5, #2128]
	str	r0, [r5, #2132]
	str	r1, [r5, #2136]
	str	r2, [r5, #2140]
.L4224:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_StorePicInDPB
	subs	r3, r0, #0
	bne	.L4238
	mov	r0, r3
	mov	r3, #1
	str	r3, [r4, #176]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4222:
	ldr	r2, [r4, #2412]
	cmp	r3, #1
	ldr	r2, [r2, #612]
	str	r2, [r4, #2332]
	addls	r3, r3, #1
	strls	r3, [r4, #2360]
	b	.L4218
.L4238:
	ldr	r2, .L4239+4
	movw	r1, #15028
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4226:
	movw	r3, #14994
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L4239+8
	bl	dprint_normal
.L4227:
	ldr	r2, .L4239+12
	movw	r1, #14997
	mov	r0, #1
	bl	dprint_normal
	b	.L4224
.L4225:
	ldr	r2, .L4239+16
	movw	r1, #15018
	bl	dprint_normal
	b	.L4224
.L4240:
	.align	2
.L4239:
	.word	g_vdm_hal_fun_ptr
	.word	.LC491
	.word	.LC489
	.word	.LC490
	.word	.LC434
	UNWIND(.fnend)
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	2
	.global	HEVCDEC_FlushRemainImg
	.type	HEVCDEC_FlushRemainImg, %function
HEVCDEC_FlushRemainImg:
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
	ldr	r3, [r0, #2596]
	mov	r4, r0
	cmp	r3, #0
	bne	.L4242
	b	.L4241
.L4255:
	ldr	r2, [fp, #-36]
.L4243:
	mov	r1, r2
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r3, [r4, #2596]
	cmp	r3, #0
	beq	.L4241
.L4242:
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	mov	r6, #1
	bl	HEVC_GetMinPOC
	ldr	r2, [fp, #-36]
	mov	r0, r4
	add	r3, r2, #652
	add	r3, r3, #2
	ldr	r5, [r4, r3, asl #2]
	cmp	r5, #0
	mov	r1, r5
	beq	.L4243
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, r6
	beq	.L4243
	strb	r6, [r5, #2]
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r7, r0, #0
	bne	.L4255
	add	r1, r5, #24
	mov	r0, r4
	bl	HEVC_OutputFrame.isra.10
	cmp	r0, #0
	beq	.L4255
	mov	r0, r7
	ldr	r3, .L4256
	ldr	r2, .L4256+4
	movw	r1, #15073
	bl	dprint_normal
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ClearAll
	b	.L4255
.L4241:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4257:
	.align	2
.L4256:
	.word	.LANCHOR0+1236
	.word	.LC401
	UNWIND(.fnend)
	.size	HEVCDEC_FlushRemainImg, .-HEVCDEC_FlushRemainImg
	.global	g_IsDeced
	.global	g_TsToRsMap
	.global	s_TmpParam
	.global	s_hevc_diag_scan8x8_y
	.global	s_hevc_diag_scan8x8_x
	.global	s_hevc_diag_scan4x4_y
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.11289, %object
	.size	__func__.11289, 17
__func__.11289:
	.ascii	"HEVC_OutputFrame\000"
	.space	3
	.type	SarTable.9965, %object
	.size	SarTable.9965, 136
SarTable.9965:
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
	.type	__func__.9977, %object
	.size	__func__.9977, 19
__func__.9977:
	.ascii	"HEVC_PrintDPBState\000"
	.space	1
	.type	__func__.10081, %object
	.size	__func__.10081, 18
__func__.10081:
	.ascii	"HEVC_CalcTileInfo\000"
	.space	2
	.type	__func__.10607, %object
	.size	__func__.10607, 27
__func__.10607:
	.ascii	"HEVC_GetUnRefPicWithMinPoc\000"
	.space	1
	.type	__func__.10615, %object
	.size	__func__.10615, 21
__func__.10615:
	.ascii	"HEVC_IncreaseDPBSize\000"
	.space	3
	.type	__func__.10868, %object
	.size	__func__.10868, 17
__func__.10868:
	.ascii	"HEVC_WritePicMsg\000"
	.space	3
	.type	__func__.10897, %object
	.size	__func__.10897, 16
__func__.10897:
	.ascii	"HEVC_CheckListX\000"
	.type	__func__.11045, %object
	.size	__func__.11045, 16
__func__.11045:
	.ascii	"HEVC_RepairList\000"
	.type	__func__.11190, %object
	.size	__func__.11190, 20
__func__.11190:
	.ascii	"HEVC_RemoveApcStore\000"
	.type	__func__.11484, %object
	.size	__func__.11484, 21
__func__.11484:
	.ascii	"HEVC_CheckFrameStore\000"
	.space	3
	.type	__func__.11548, %object
	.size	__func__.11548, 19
__func__.11548:
	.ascii	"HEVC_GetSLHDR1Info\000"
	.space	1
	.type	__func__.11567, %object
	.size	__func__.11567, 22
__func__.11567:
	.ascii	"HEVC_GetHDR10PlusInfo\000"
	.space	2
	.type	__func__.11389, %object
	.size	__func__.11389, 25
__func__.11389:
	.ascii	"HEVC_RemoveSamePocOutDPB\000"
	.space	3
	.type	__func__.11657, %object
	.size	__func__.11657, 14
__func__.11657:
	.ascii	"HEVC_IsNewPic\000"
	.space	2
	.type	s_quant8_inter_default, %object
	.size	s_quant8_inter_default, 64
s_quant8_inter_default:
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
	.type	__func__.11961, %object
	.size	__func__.11961, 16
__func__.11961:
	.ascii	"HEVC_ReleaseNAL\000"
	.type	__func__.11149, %object
	.size	__func__.11149, 20
__func__.11149:
	.ascii	"HEVC_InitDecBuffers\000"
	.type	__func__.11828, %object
	.size	__func__.11828, 27
__func__.11828:
	.ascii	"HEVC_DecShortTermRefPicSet\000"
	.space	1
	.type	s_hevc_diag_scan4x4_y, %object
	.size	s_hevc_diag_scan4x4_y, 16
s_hevc_diag_scan4x4_y:
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	3
	.byte	2
	.byte	3
	.type	s_hevc_diag_scan4x4_x, %object
	.size	s_hevc_diag_scan4x4_x, 16
s_hevc_diag_scan4x4_x:
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	1
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.type	s_hevc_diag_scan8x8_y, %object
	.size	s_hevc_diag_scan8x8_y, 64
s_hevc_diag_scan8x8_y:
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	7
	.byte	6
	.byte	5
	.byte	7
	.byte	6
	.byte	7
	.type	s_hevc_diag_scan8x8_x, %object
	.size	s_hevc_diag_scan8x8_x, 64
s_hevc_diag_scan8x8_x:
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	5
	.byte	6
	.byte	7
	.byte	6
	.byte	7
	.byte	7
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
	.type	__func__.10207, %object
	.size	__func__.10207, 16
__func__.10207:
	.ascii	"HEVC_ProcessPPS\000"
	.type	__func__.10721, %object
	.size	__func__.10721, 27
__func__.10721:
	.ascii	"HEVC_DecSliceSegmentHeader\000"
	.space	1
	.type	__func__.11125, %object
	.size	__func__.11125, 13
__func__.11125:
	.ascii	"HEVC_InitDPB\000"
	.space	3
	.type	__func__.11296, %object
	.size	__func__.11296, 19
__func__.11296:
	.ascii	"HEVC_OutputCurrPic\000"
	.space	1
	.type	__func__.11301, %object
	.size	__func__.11301, 23
__func__.11301:
	.ascii	"HEVC_FirstFrameFastOut\000"
	.space	1
	.type	__func__.11476, %object
	.size	__func__.11476, 19
__func__.11476:
	.ascii	"HEVC_OutputFrmToVO\000"
	.space	1
	.type	__func__.10621, %object
	.size	__func__.10621, 30
__func__.10621:
	.ascii	"HEVC_OutputUnRefPicWithMinPoc\000"
	.space	2
	.type	__func__.11460, %object
	.size	__func__.11460, 27
__func__.11460:
	.ascii	"HEVC_FlushOutputFrmFromDPB\000"
	.space	1
	.type	__func__.12018, %object
	.size	__func__.12018, 14
__func__.12018:
	.ascii	"HEVC_ClearDPB\000"
	.space	2
	.type	__func__.10626, %object
	.size	__func__.10626, 23
__func__.10626:
	.ascii	"HEVC_RecoverDPBProcess\000"
	.space	1
	.type	__func__.11399, %object
	.size	__func__.11399, 20
__func__.11399:
	.ascii	"HEVC_InsertFrmInDPB\000"
	.type	__func__.11306, %object
	.size	__func__.11306, 22
__func__.11306:
	.ascii	"HEVC_SimpleDPBProcess\000"
	.space	2
	.type	__func__.11311, %object
	.size	__func__.11311, 21
__func__.11311:
	.ascii	"HEVC_DecOrderProcess\000"
	.space	3
	.type	__func__.11325, %object
	.size	__func__.11325, 22
__func__.11325:
	.ascii	"HEVC_DispOrderProcess\000"
	.space	2
	.type	__func__.11332, %object
	.size	__func__.11332, 19
__func__.11332:
	.ascii	"HEVC_StorePicInDPB\000"
	.space	1
	.type	__func__.10966, %object
	.size	__func__.10966, 12
__func__.10966:
	.ascii	"HEVC_DecVDM\000"
	.type	__func__.9913, %object
	.size	__func__.9913, 18
__func__.9913:
	.ascii	"HEVC_VES_Splitter\000"
	.space	2
	.type	__func__.10657, %object
	.size	__func__.10657, 14
__func__.10657:
	.ascii	"HEVC_DecSlice\000"
	.space	2
	.type	__func__.12084, %object
	.size	__func__.12084, 20
__func__.12084:
	.ascii	"HEVC_HaveSliceToDec\000"
	.type	__func__.12125, %object
	.size	__func__.12125, 13
__func__.12125:
	.ascii	"HEVCDEC_Init\000"
	.space	3
	.type	__func__.12151, %object
	.size	__func__.12151, 21
__func__.12151:
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
	.type	__func__.12172, %object
	.size	__func__.12172, 23
__func__.12172:
	.ascii	"HEVCDEC_FlushRemainImg\000"
	.data
	.align	2
.LANCHOR3 = . + 0
	.type	s_quant8_intra_default, %object
	.size	s_quant8_intra_default, 64
s_quant8_intra_default:
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
	.type	s_quant_tsdefault4x4, %object
	.size	s_quant_tsdefault4x4, 16
s_quant_tsdefault4x4:
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
	.type	s_quant_inter_default8x8, %object
	.size	s_quant_inter_default8x8, 64
s_quant_inter_default8x8:
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
	.type	s_quant_intra_default8x8, %object
	.size	s_quant_intra_default8x8, 64
s_quant_intra_default8x8:
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	ASCII(.ascii	"%s: pImg is NULL!\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"%s: insert image failed!\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"line:%d ChanID(%d), pic_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range(0,%d).\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"line:%d ChanID(%d), seq_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range[0,%d].\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"dar=%d\012\000" )
.LC7:
	ASCII(.ascii	"--------------- PrintDPBState START ---------------" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"DPB: size:%d, used_size:%d, negative:%d, positive:%" )
	ASCII(.ascii	"d, longterm:%d\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC10:
	ASCII(.ascii	"fs[%d]:%p view %d non_existing:%d state:%d is_ref:%" )
	ASCII(.ascii	"d displayed:%d poc:%d long_term:%d LogicFs:%p, fsp_" )
	ASCII(.ascii	"ref:%d fsp_disp:%d logic_id:%d img_id:%d\012\000" )
.LC11:
	ASCII(.ascii	"--------------- PrintDPBState END ---------------\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC12:
	ASCII(.ascii	"%s %d LogicFs:Null\012\000" )
.LC13:
	ASCII(.ascii	"fs[%d]\011\000" )
.LC14:
	ASCII(.ascii	"LogicFs:%p\011\000" )
.LC15:
	ASCII(.ascii	"LogicTick:%d\011\000" )
	.space	2
.LC16:
	ASCII(.ascii	"IsRef:%d\011\000" )
	.space	2
.LC17:
	ASCII(.ascii	"DispState:%d\011\000" )
	.space	2
.LC18:
	ASCII(.ascii	"DecFs:%p\011\000" )
	.space	2
.LC19:
	ASCII(.ascii	"DecTick:%d\011\000" )
.LC20:
	ASCII(.ascii	"DecFs:Null\011\000" )
.LC21:
	ASCII(.ascii	"%s num_tile_columns(%d) out of range(0, %d].\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"%s num_tile_rows(%d) out of range(0, %d].\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"%s 0 idx(%d) out of range(0, 512).\012\000" )
.LC24:
	ASCII(.ascii	"%s 1 idx(%d) out of range(0, 512).\012\000" )
.LC25:
	ASCII(.ascii	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC26:
	ASCII(.ascii	"pListX[0][%d] = NULL, listXsize[0] = %d\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) inval" )
	ASCII(.ascii	"id\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"pListX[1][%d] = NULL, listXsize[1] = %d\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"pListX[i][%d] pstLogicFs(%p) invalid\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"%s DPB.used_size(%d) >= 17.\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"%s can't find such pic.\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"%s find pos=%d, poc=%d.\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"%s DPB.size(%d) already reached max(%d).\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"%s increase DPB size to %d\012\000" )
.LC37:
	ASCII(.ascii	"%s no enough fs(MinAvailFsNum = %d) to increase DPB" )
	ASCII(.ascii	" size.\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"TileWidthInCtb is 0\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"image_id=%d, pmv_idc=%d\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"pic msg burst0:\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"%s call HEVC_CalcTileInfo failed.\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC43:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstPmv = %p\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"%s ERROR: bHaveIndependentSlice = 0\012\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"ListX ERROR: list0size >= %d\012\000" )
	.space	2
.LC46:
	ASCII(.ascii	"ListX ERROR: list1size >= %d\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"pListX[0][%d] = NULL\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL\012\000" )
	.space	1
.LC49:
	ASCII(.ascii	"pListX[1][%d] = NULL\012\000" )
	.space	2
.LC50:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL\012\000" )
	.space	1
.LC51:
	ASCII(.ascii	"NumSlicePara(%d) >= MaxSliceNum(%d)\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"%s unkown slice type(%d).\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"%s pListX[%d] no available pic to repair.\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\012" )
	ASCII(.ascii	"\000" )
.LC55:
	ASCII(.ascii	"HEVC_InitListX error.\012\000" )
	.space	1
.LC56:
	ASCII(.ascii	"HEVC_RepairList error.\012\000" )
.LC57:
	ASCII(.ascii	"%s fs[%d]->view_id = %d invalid.\012\000" )
	.space	2
.LC58:
	ASCII(.ascii	"../../core/syntax/hevc.c\000" )
	.space	3
.LC59:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC61:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%" )
	ASCII(.ascii	"d, logic_fs=%p, dec_fs=%p)\012\000" )
	.space	1
.LC62:
	ASCII(.ascii	"Cant find free apc slot.\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"%s frame logic_fs_id=%d, state=%d\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null," )
	ASCII(.ascii	" logic_fs_id = %d\012\000" )
	.space	2
.LC65:
	ASCII(.ascii	"%s frame poc=%d, is already output\012\000" )
.LC66:
	ASCII(.ascii	"%s frame(%p) invalid, state:%d, non_existing:%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC67:
	ASCII(.ascii	"Chan:%d exg_pts: %lld <-> %lld\012\000" )
.LC68:
	ASCII(.ascii	"HEVC_DECRecycleImage ERROR, DispState = FS_STATE_NO" )
	ASCII(.ascii	"T_USE\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"%-5d   specVersion\012\000" )
.LC70:
	ASCII(.ascii	"%-5d   payloadMode\012\000" )
.LC71:
	ASCII(.ascii	"%-5d   hdrPicColourSpace\012\000" )
	.space	2
.LC72:
	ASCII(.ascii	"%-5d   hdrMasterDisplayColourSpace\012\000" )
.LC73:
	ASCII(.ascii	"%-5d   hdrMasterDisplayMaxLuminance\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"%-5d   hdrMasterDisplayMinLuminance\012\000" )
	.space	3
.LC75:
	ASCII(.ascii	"%-5d   sdrPicColourSpace\012\000" )
	.space	2
.LC76:
	ASCII(.ascii	"%-5d   sdrMasterDisplayColourSpace\012\000" )
.LC77:
	ASCII(.ascii	"%-5d   tmInputSignalBlackLevelOffset\012\000" )
	.space	2
.LC78:
	ASCII(.ascii	"%-5d   tmInputSignalWhiteLevelOffset\012\000" )
	.space	2
.LC79:
	ASCII(.ascii	"%-5d   shadowGain\012\000" )
	.space	1
.LC80:
	ASCII(.ascii	"%-5d   highlightGain\012\000" )
	.space	2
.LC81:
	ASCII(.ascii	"%-5d   midToneWidthAdjFactor\012\000" )
	.space	2
.LC82:
	ASCII(.ascii	"%-5d   tmOutputFineTuningNumVal\012\000" )
	.space	3
.LC83:
	ASCII(.ascii	"%-5d   saturationGainNumVal\012\000" )
	.space	3
.LC84:
	ASCII(.ascii	"%-5d   tmOutputFineTuningX[%d]\012\000" )
.LC85:
	ASCII(.ascii	"%-5d   tmOutputFineTuningY[%d]\012\000" )
.LC86:
	ASCII(.ascii	"%-5d   saturationGainX[%d]\012\000" )
.LC87:
	ASCII(.ascii	"%-5d   saturationGainY[%d]\012\000" )
.LC88:
	ASCII(.ascii	"%-5d   luminanceMappingNumVal\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"%-5d   colourCorrectionNumVal\012\000" )
	.space	1
.LC90:
	ASCII(.ascii	"%-5d   luminanceMappingX[%d]\012\000" )
	.space	2
.LC91:
	ASCII(.ascii	"%-5d   luminanceMappingY[%d]\012\000" )
	.space	2
.LC92:
	ASCII(.ascii	"%-5d   chromaToLumaInjectionMuA\012\000" )
	.space	3
.LC93:
	ASCII(.ascii	"%-5d   chromaToLumaInjectionMuB\012\000" )
	.space	3
.LC94:
	ASCII(.ascii	"%-5d   colourCorrectionX[%d]\012\000" )
	.space	2
.LC95:
	ASCII(.ascii	"%-5d   colourCorrectionY[%d]\012\000" )
	.space	2
.LC96:
	ASCII(.ascii	"======SL_HDR1_METADATA= %d=======\012\000" )
	.space	1
.LC97:
	ASCII(.ascii	"%s, [%d %d %d %d %d]\012\000" )
	.space	2
.LC98:
	ASCII(.ascii	"%s HDR_Metadata_phy_addr is invalid!!\012\000" )
	.space	1
.LC99:
	ASCII(.ascii	"%s, bAvalible:%d\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"%s pMetaData is null\012\000" )
	.space	2
.LC101:
	ASCII(.ascii	"%s error: metadata size(%d) < structure size(%d)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC102:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC103:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC104:
	ASCII(.ascii	"pos: %d, pHevcCtx->DPB.fs[i]: %p is null\012\000" )
	.space	2
.LC105:
	ASCII(.ascii	"%s have same poc(%d) in DPB, Remove the old\012\000" )
	.space	3
.LC106:
	ASCII(.ascii	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), err" )
	ASCII(.ascii	"or resilence.\012\000" )
	.space	2
.LC107:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC108:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC109:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC110:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC111:
	ASCII(.ascii	"sps with this seq_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC112:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of r" )
	ASCII(.ascii	"ange\012\000" )
	.space	3
.LC113:
	ASCII(.ascii	"vps with this video_parameter_set_id = %d havn't be" )
	ASCII(.ascii	" decoded\012\000" )
	.space	3
.LC114:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, n" )
	ASCII(.ascii	"al_unit_type = %d, should skip this frame\012\000" )
	.space	2
.LC115:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d," )
	ASCII(.ascii	" nal_unit_type = %d, should skip this frame\012\000" )
.LC116:
	ASCII(.ascii	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocC" )
	ASCII(.ascii	"RA = %d, nal_unit_type = %d, should skip this frame" )
	ASCII(.ascii	"\012\000" )
.LC117:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code should not be zero.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC118:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code:%d\012\000" )
	.space	3
.LC119:
	ASCII(.ascii	"reserved_zero_2bits not equal 0.\012\000" )
	.space	2
.LC120:
	ASCII(.ascii	"HEVC_GetScalingListDefaultAddress NULL.\012\000" )
	.space	3
.LC121:
	ASCII(.ascii	"Error, BsLen: 0x%x, TotalPos: 0x%x\012\000" )
.LC122:
	ASCII(.ascii	"%s release streambuff=%p, bitstream_length=%d\012\000" )
	.space	1
.LC123:
	ASCII(.ascii	"%s DPB size exceed %d, force to %d\012\000" )
.LC124:
	ASCII(.ascii	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\012\000" )
	.space	2
.LC125:
	ASCII(.ascii	"END of the bit buffer, copy the first packet!\012\000" )
	.space	1
.LC126:
	ASCII(.ascii	"tone_map_id\000" )
.LC127:
	ASCII(.ascii	"Unsupport: target_bit_depth(%d) > 8\012\000" )
	.space	3
.LC128:
	ASCII(.ascii	"pTon->num_pivots > 256\012\000" )
.LC129:
	ASCII(.ascii	"frame_packing_arrangement_id\000" )
	.space	3
.LC130:
	ASCII(.ascii	"frame_packing_arrangement_type(%d) out of range\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC131:
	ASCII(.ascii	"decoding_unit_idx\000" )
	.space	2
.LC132:
	ASCII(.ascii	"num_sps_ids_minus1\000" )
	.space	1
.LC133:
	ASCII(.ascii	"pAct->num_sps_ids_minus1 > 15\012\000" )
	.space	1
.LC134:
	ASCII(.ascii	"active_seq_parameter_set_id\000" )
.LC135:
	ASCII(.ascii	"bp_seq_parameter_set_id\000" )
.LC136:
	ASCII(.ascii	"Wrong bp_seq_parameter_set_id = %d, should be 0 to " )
	ASCII(.ascii	"15!\012\000" )
.LC137:
	ASCII(.ascii	"num_decoding_units_minus1\000" )
	.space	2
.LC138:
	ASCII(.ascii	"pPic->num_decoding_units_minus1 > 255\012\000" )
	.space	1
.LC139:
	ASCII(.ascii	"num_nalus_in_du_minus1\000" )
	.space	1
.LC140:
	ASCII(.ascii	"cv_rec_id\000" )
	.space	2
.LC141:
	ASCII(.ascii	"ERROR: tone_mapping_output_fine_tuning_num_val %d o" )
	ASCII(.ascii	"ut of range[0, 10]\012\000" )
	.space	1
.LC142:
	ASCII(.ascii	"ERROR: saturation_gain_num_val %d out of range[0, 6" )
	ASCII(.ascii	"]\012\000" )
	.space	2
.LC143:
	ASCII(.ascii	"HEVC_Sei_User_Data_Registered_Itu_T_T35 payloadSize" )
	ASCII(.ascii	" < 4!!\012\000" )
	.space	1
.LC144:
	ASCII(.ascii	"delta_idx_minus1\000" )
	.space	3
.LC145:
	ASCII(.ascii	"delta_idx(%d) > idx(%d).\012\000" )
	.space	2
.LC146:
	ASCII(.ascii	"rIdx(%d) > (idx-1)(%d) or < 0).\012\000" )
	.space	3
.LC147:
	ASCII(.ascii	"abs_delta_rps_minus1\000" )
	.space	3
.LC148:
	ASCII(.ascii	"pTempRPset->num_of_pics(%d) out of range(0,15).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC149:
	ASCII(.ascii	"num_of_pics out of range(0,15).\012\000" )
	.space	3
.LC150:
	ASCII(.ascii	"num_negative_pics\000" )
	.space	2
.LC151:
	ASCII(.ascii	"pTempRPset->num_negative_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC152:
	ASCII(.ascii	"num_positive_pics\000" )
	.space	2
.LC153:
	ASCII(.ascii	"pTempRPset->num_positive_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC154:
	ASCII(.ascii	"pShortTermRpset->num_of_pics(%d) out of range[0,%d]" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC155:
	ASCII(.ascii	"delta_poc_s0_minus1\000" )
.LC156:
	ASCII(.ascii	"delta_poc_s0_minus1(%d) out of range.\012\000" )
	.space	1
.LC157:
	ASCII(.ascii	"delta_poc_s1_minus1\000" )
.LC158:
	ASCII(.ascii	"%s, %d: unsigned interger overflow\012\000" )
.LC159:
	ASCII(.ascii	"%s, %d: unsigned integer overflow, prev = %u, delta" )
	ASCII(.ascii	"_poc_s1 = %u\012\000" )
	.space	3
.LC160:
	ASCII(.ascii	"%s, %d: unsigned integer convert to signed integer " )
	ASCII(.ascii	"overflow\012\000" )
	.space	3
.LC161:
	ASCII(.ascii	"elemental_duration_in_tc_minus1\000" )
.LC162:
	ASCII(.ascii	"cpb_cnt_minus1\000" )
	.space	1
.LC163:
	ASCII(.ascii	"cpb_cnt_minus1(%d) out of range(0,31).\012\000" )
.LC164:
	ASCII(.ascii	"bit_rate_value_minus1\000" )
	.space	2
.LC165:
	ASCII(.ascii	"cpb_size_value_minus1\000" )
	.space	2
.LC166:
	ASCII(.ascii	"cpb_size_du_value_minus1\000" )
	.space	3
.LC167:
	ASCII(.ascii	"bit_rate_du_value_minus1\000" )
	.space	3
.LC168:
	ASCII(.ascii	"vps_base_layer_available_flag(%d) not equal 0x1.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC169:
	ASCII(.ascii	"vps_max_layers_minus1 %d out of range[0,63].\012\000" )
	.space	2
.LC170:
	ASCII(.ascii	"vps_max_sub_layers_minus1 %d out of range[0, %d].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC171:
	ASCII(.ascii	"vps_reserved_0xffff_16bits not equal 0xffff.\012\000" )
	.space	2
.LC172:
	ASCII(.ascii	"VPS HEVC_DecPTL error.\012\000" )
.LC173:
	ASCII(.ascii	"vps_num_layer_sets_minus1\000" )
	.space	2
.LC174:
	ASCII(.ascii	"vps_max_dec_pic_buffering_minus1[i]\000" )
.LC175:
	ASCII(.ascii	"vps_num_reorder_pics[i]\000" )
.LC176:
	ASCII(.ascii	"vps_max_latency_increase_plus1[i]\000" )
	.space	2
.LC177:
	ASCII(.ascii	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC178:
	ASCII(.ascii	"vps_num_ticks_poc_diff_one_minus1\000" )
	.space	2
.LC179:
	ASCII(.ascii	"vps_num_hrd_parameters\000" )
	.space	1
.LC180:
	ASCII(.ascii	"vps_num_hrd_parameters(%d) out of range[0,%d].\012\000" )
.LC181:
	ASCII(.ascii	"hrd_layer_set_idx\000" )
	.space	2
.LC182:
	ASCII(.ascii	"VPS HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC183:
	ASCII(.ascii	"pVPS->vps_video_parameter_set_id out of range(0,15)" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC184:
	ASCII(.ascii	"VPS[%d] decode error0.\012\000" )
.LC185:
	ASCII(.ascii	"VPS[%d] decode error1.\012\000" )
.LC186:
	ASCII(.ascii	"VUI aspect_ratio_idc out of range[0, 255]\012\000" )
	.space	1
.LC187:
	ASCII(.ascii	"chroma_sample_loc_type_top_field\000" )
	.space	3
.LC188:
	ASCII(.ascii	"chroma_sample_loc_type_bottom_field\000" )
.LC189:
	ASCII(.ascii	"def_disp_win_left_offset\000" )
	.space	3
.LC190:
	ASCII(.ascii	"VUI pSps->chroma_format_idc out of range(0,3).\012\000" )
.LC191:
	ASCII(.ascii	"def_disp_win_right_offset\000" )
	.space	2
.LC192:
	ASCII(.ascii	"def_disp_win_top_offset\000" )
.LC193:
	ASCII(.ascii	"def_disp_win_bottom_offset\000" )
	.space	1
.LC194:
	ASCII(.ascii	"vui_num_ticks_poc_diff_one_minus1\000" )
	.space	2
.LC195:
	ASCII(.ascii	"VUI HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC196:
	ASCII(.ascii	"min_spatial_segmentation_idc\000" )
	.space	3
.LC197:
	ASCII(.ascii	"VUI min_spatial_segmentation_idc out of range(0,409" )
	ASCII(.ascii	"5).\012\000" )
.LC198:
	ASCII(.ascii	"max_bytes_per_pic_denom\000" )
.LC199:
	ASCII(.ascii	"max_bits_per_min_cu_denom\000" )
	.space	2
.LC200:
	ASCII(.ascii	"log2_max_mv_length_horizontal\000" )
	.space	2
.LC201:
	ASCII(.ascii	"log2_max_mv_length_vertical\000" )
.LC202:
	ASCII(.ascii	"sop_seq_parameter_set_id\000" )
	.space	3
.LC203:
	ASCII(.ascii	"num_entries_in_sop_minus1\000" )
	.space	2
.LC204:
	ASCII(.ascii	"num_entries_in_sop_minus1 out of range(0,1024)\012\000" )
.LC205:
	ASCII(.ascii	"sop_short_term_rps_idx\000" )
	.space	1
.LC206:
	ASCII(.ascii	"sop_poc_delta\000" )
	.space	2
.LC207:
	ASCII(.ascii	"recovery_poc_cnt\000" )
	.space	3
.LC208:
	ASCII(.ascii	"colour_remap_id\000" )
.LC209:
	ASCII(.ascii	"colour_remap_coeffs\000" )
.LC210:
	ASCII(.ascii	"ERROR: post_lut_num_val_minus1 %d out of range[0, 3" )
	ASCII(.ascii	"2]\012\000" )
	.space	1
.LC211:
	ASCII(.ascii	"reserved_payload_extension_data\000" )
.LC212:
	ASCII(.ascii	"line:%d Cosume TotalPos(%d > %d)!!!\012\000" )
	.space	3
.LC213:
	ASCII(.ascii	"HEVC_SeiMessage HEVC_Sei_Payload error.\012\000" )
	.space	3
.LC214:
	ASCII(.ascii	"SEI pSEISPS = NULL.\012\000" )
	.space	3
.LC215:
	ASCII(.ascii	"SEI HEVC_SeiMessage error.\012\000" )
.LC216:
	ASCII(.ascii	"SEI BsIsByteAligned error.\012\000" )
.LC217:
	ASCII(.ascii	"SEI rbsp_trailing_bits(%d) not equal 0x80.\012\000" )
.LC218:
	ASCII(.ascii	"nesting_num_ops_minus1\000" )
	.space	1
.LC219:
	ASCII(.ascii	"nesting_num_ops_minus1 out of range(0,%d)\012\000" )
	.space	1
.LC220:
	ASCII(.ascii	"nesting_op_idx\000" )
	.space	1
.LC221:
	ASCII(.ascii	"nesting_num_layers_minus1\000" )
	.space	2
.LC222:
	ASCII(.ascii	"nesting_num_layers_minus1 out of range(0,63)\012\000" )
	.space	2
.LC223:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta\000" )
	.space	2
.LC224:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta out of range(0,ma" )
	ASCII(.ascii	"trixId).\012\000" )
	.space	3
.LC225:
	ASCII(.ascii	"HEVC_DecScalingListData pMatrixAddress NULL.\012\000" )
	.space	2
.LC226:
	ASCII(.ascii	"scaling_list_dc_coef_minus8\000" )
.LC227:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-7,247).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC228:
	ASCII(.ascii	"scaling_list_delta_coef\000" )
.LC229:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-128,127)." )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC230:
	ASCII(.ascii	"chroma_format_idc\000" )
	.space	2
.LC231:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range(0,3).\012\000" )
.LC232:
	ASCII(.ascii	"pSPS->chroma_format_idc not equal(%d) 1.\012\000" )
	.space	2
.LC233:
	ASCII(.ascii	"pic_width_in_luma_samples\000" )
	.space	2
.LC234:
	ASCII(.ascii	"pic_width_in_luma_samples out of range(0,%d).\012\000" )
	.space	1
.LC235:
	ASCII(.ascii	"pic_height_in_luma_samples\000" )
	.space	1
.LC236:
	ASCII(.ascii	"pic_height_in_luma_samples out of range(0,%d).\012\000" )
.LC237:
	ASCII(.ascii	"ERROR Unkown level: %d\012\000" )
.LC238:
	ASCII(.ascii	"conf_win_left_offset\000" )
	.space	3
.LC239:
	ASCII(.ascii	"conf_win_right_offset\000" )
	.space	2
.LC240:
	ASCII(.ascii	"conf_win_left_offset+conf_win_right_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC241:
	ASCII(.ascii	"conf_win_top_offset\000" )
.LC242:
	ASCII(.ascii	"conf_win_bottom_offset\000" )
	.space	1
.LC243:
	ASCII(.ascii	"conf_win_top_offset+conf_win_bottom_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC244:
	ASCII(.ascii	"bit_depth_luma_minus8\000" )
	.space	2
.LC245:
	ASCII(.ascii	"bit_depth_luma(%d) out of range(8,10).\012\000" )
.LC246:
	ASCII(.ascii	"bit_depth_chroma_minus8\000" )
.LC247:
	ASCII(.ascii	"bit_depth_chroma(%d) out of range[8,14].\012\000" )
	.space	2
.LC248:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	2
.LC249:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12" )
	ASCII(.ascii	"].\012\000" )
	.space	1
.LC250:
	ASCII(.ascii	"sps_max_dec_pic_buffering_minus1\000" )
	.space	3
.LC251:
	ASCII(.ascii	"sps_num_reorder_pics\000" )
	.space	3
.LC252:
	ASCII(.ascii	"sps_max_latency_increase_plus1\000" )
	.space	1
.LC253:
	ASCII(.ascii	"log2_min_coding_block_size_minus3\000" )
	.space	2
.LC254:
	ASCII(.ascii	"log2_min_luma_coding_block_size_minus3 out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC255:
	ASCII(.ascii	"log2_diff_max_min_coding_block_size\000" )
.LC256:
	ASCII(.ascii	"log2_diff_max_min_luma_coding_block_size out of ran" )
	ASCII(.ascii	"ge(0,3).\012\000" )
	.space	3
.LC257:
	ASCII(.ascii	"log2_ctb_sizeY out of range(4,6).\012\000" )
	.space	1
.LC258:
	ASCII(.ascii	"log2_min_transform_block_size_minus2\000" )
	.space	3
.LC259:
	ASCII(.ascii	"log2_min_transform_block_size_minus2 out of range(0" )
	ASCII(.ascii	",3).\012\000" )
	.space	3
.LC260:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size\000" )
	.space	1
.LC261:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC262:
	ASCII(.ascii	"quadtree_tu_log2_min_size not less than log2_min_cb" )
	ASCII(.ascii	"_sizeY.\012\000" )
.LC263:
	ASCII(.ascii	"quadtree_tu_log2_max_size greater than Min( CtbLog2" )
	ASCII(.ascii	"SizeY, 5 ).\012\000" )
.LC264:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter\000" )
.LC265:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC266:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra\000" )
.LC267:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC268:
	ASCII(.ascii	"SPS HEVC_DecScalingListData error.\012\000" )
.LC269:
	ASCII(.ascii	"SPS sao is off and pic height(%d) is too small.(Log" )
	ASCII(.ascii	"ic Unsupported).\012\000" )
	.space	3
.LC270:
	ASCII(.ascii	"log2_min_pcm_luma_coding_block_size_minus3\000" )
	.space	1
.LC271:
	ASCII(.ascii	"log2_min_pcm_coding_block_size_minus3(%d) out of ra" )
	ASCII(.ascii	"nge[0,2].\012\000" )
	.space	2
.LC272:
	ASCII(.ascii	"log2_diff_max_min_pcm_luma_coding_block_size\000" )
	.space	3
.LC273:
	ASCII(.ascii	"log2_diff_max_min_pcm_coding_block_size(%d) out of " )
	ASCII(.ascii	"range[0,2].\012\000" )
.LC274:
	ASCII(.ascii	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5" )
	ASCII(.ascii	" ).\012\000" )
.LC275:
	ASCII(.ascii	"num_short_term_ref_pic_sets\000" )
.LC276:
	ASCII(.ascii	"num_short_term_ref_pic_sets out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC277:
	ASCII(.ascii	"SPS HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	1
.LC278:
	ASCII(.ascii	"num_long_term_ref_pic_sps\000" )
	.space	2
.LC279:
	ASCII(.ascii	"num_long_term_ref_pic_sps out of range[0,32].\012\000" )
	.space	1
.LC280:
	ASCII(.ascii	"SPS HEVC_DecVuiParam error.\012\000" )
	.space	3
.LC281:
	ASCII(.ascii	"sps_video_parameter_set_id out of range(0,%d).\012\000" )
.LC282:
	ASCII(.ascii	"sps_max_sub_layers_minus1 out of range(0,%d).\012\000" )
	.space	1
.LC283:
	ASCII(.ascii	"SPS HEVC_DecPTL error.\012\000" )
.LC284:
	ASCII(.ascii	"sps_seq_parameter_set_id\000" )
	.space	3
.LC285:
	ASCII(.ascii	"sps_seq_parameter_set_id out of range(0,%d).\012\000" )
	.space	2
.LC286:
	ASCII(.ascii	"SPS[%d] decode error0.\012\000" )
.LC287:
	ASCII(.ascii	"SPS[%d] decode error.\012\000" )
	.space	1
.LC288:
	ASCII(.ascii	"pps_seq_parameter_set_id\000" )
	.space	3
.LC289:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range[0,15].\012\000" )
	.space	2
.LC290:
	ASCII(.ascii	"SPS(%d) haven't decode.\012\000" )
	.space	3
.LC291:
	ASCII(.ascii	"num_ref_idx_l0_default_active_minus1\000" )
	.space	3
.LC292:
	ASCII(.ascii	"num_ref_idx_l0_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC293:
	ASCII(.ascii	"num_ref_idx_l1_default_active_minus1\000" )
	.space	3
.LC294:
	ASCII(.ascii	"num_ref_idx_l1_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC295:
	ASCII(.ascii	"init_qp_minus26\000" )
.LC296:
	ASCII(.ascii	"function %s\011 line %d\011 HEVC_se_v error\012\000" )
	.space	1
.LC297:
	ASCII(.ascii	"pic_init_qp(%d) out of range[-%d,51].\012\000" )
	.space	1
.LC298:
	ASCII(.ascii	"diff_cu_qp_delta_depth\000" )
	.space	1
.LC299:
	ASCII(.ascii	"diff_cu_qp_delta_depth out of range[0,3].\012\000" )
	.space	1
.LC300:
	ASCII(.ascii	"pps_cb_qp_offset\000" )
	.space	3
.LC301:
	ASCII(.ascii	"pic_cb_qp_offset out of range[-12,12].\012\000" )
.LC302:
	ASCII(.ascii	"pps_cr_qp_offset\000" )
	.space	3
.LC303:
	ASCII(.ascii	"pic_cr_qp_offset out of range[-12,12].\012\000" )
.LC304:
	ASCII(.ascii	"num_tile_columns_minus1\000" )
.LC305:
	ASCII(.ascii	"num_tile_columns_minus1(%d) out of range(0, %d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC306:
	ASCII(.ascii	"num_tile_rows_minus1\000" )
	.space	3
.LC307:
	ASCII(.ascii	"num_tile_rows_minus1 out(%d) of range(0, %d).\012\000" )
	.space	1
.LC308:
	ASCII(.ascii	"Logic limit(%d), num_tile_columns(%d) exceed.\012\000" )
	.space	1
.LC309:
	ASCII(.ascii	"Logic limit(%d), num_tile_rows(%d) exceed.\012\000" )
.LC310:
	ASCII(.ascii	"column_width_minus1\000" )
.LC311:
	ASCII(.ascii	"column_width[%d](%d) out of range (0 %d)\012\000" )
	.space	2
.LC312:
	ASCII(.ascii	"row_height_minus1\000" )
	.space	2
.LC313:
	ASCII(.ascii	"row_height[%d](%d) out of range (0 %d)\012\000" )
.LC314:
	ASCII(.ascii	"column_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	2
.LC315:
	ASCII(.ascii	"row_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	1
.LC316:
	ASCII(.ascii	"PPS tile width(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC317:
	ASCII(.ascii	"PPS tile height(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
.LC318:
	ASCII(.ascii	"pps_beta_offset_div2\000" )
	.space	3
.LC319:
	ASCII(.ascii	"pps_beta_offset_div2(%d) out of range(-6,6).\012\000" )
	.space	2
.LC320:
	ASCII(.ascii	"pps_tc_offset_div2\000" )
	.space	1
.LC321:
	ASCII(.ascii	"pps_tc_offset_div2(%d) out of range(-6,6).\012\000" )
.LC322:
	ASCII(.ascii	"PPS HEVC_DecScalingListData error.\012\000" )
.LC323:
	ASCII(.ascii	"log2_parallel_merge_level_minus2\000" )
	.space	3
.LC324:
	ASCII(.ascii	"log2_parallel_merge_level(%d) out of range(2,log2_c" )
	ASCII(.ascii	"tb_sizeY).\012\000" )
	.space	1
.LC325:
	ASCII(.ascii	"pps_pic_parameter_set_id\000" )
	.space	3
.LC326:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range(0,%d).\012\000" )
	.space	2
.LC327:
	ASCII(.ascii	"PPS[%d] decode error.\012\000" )
	.space	1
.LC328:
	ASCII(.ascii	"luma_log2_weight_denom\000" )
	.space	1
.LC329:
	ASCII(.ascii	"luma_log2_weight_denom out of range(0,7).\012\000" )
	.space	1
.LC330:
	ASCII(.ascii	"delta_chroma_log2_weight_denom\000" )
	.space	1
.LC331:
	ASCII(.ascii	"delta_chroma_log2_weight_denom out of range(-7,7).\012" )
	ASCII(.ascii	"\000" )
.LC332:
	ASCII(.ascii	"chroma_log2_weight_denom out of range(0,7).\012\000" )
	.space	3
.LC333:
	ASCII(.ascii	"delta_luma_weight_l0\000" )
	.space	3
.LC334:
	ASCII(.ascii	"delta_luma_weight_l0(%d) out of range(-128,127).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC335:
	ASCII(.ascii	"luma_offset_l0\000" )
	.space	1
.LC336:
	ASCII(.ascii	"luma_offset_l0(%d) out of range(-128,127).\012\000" )
.LC337:
	ASCII(.ascii	"delta_chroma_weight_l0\000" )
	.space	1
.LC338:
	ASCII(.ascii	"delta_chroma_weight_l0 out of range(-128,127).\012\000" )
.LC339:
	ASCII(.ascii	"delta_chroma_offset_l0\000" )
	.space	1
.LC340:
	ASCII(.ascii	"delta_chroma_offset_l0 out of range(-512,511).\012\000" )
.LC341:
	ASCII(.ascii	"delta_luma_weight_l1\000" )
	.space	3
.LC342:
	ASCII(.ascii	"delta_luma_weight_l1 out of range(-128,127).\012\000" )
	.space	2
.LC343:
	ASCII(.ascii	"luma_offset_l1\000" )
	.space	1
.LC344:
	ASCII(.ascii	"luma_offset_l1 out of range(-128,127).\012\000" )
.LC345:
	ASCII(.ascii	"delta_chroma_weight_l1\000" )
	.space	1
.LC346:
	ASCII(.ascii	"delta_chroma_weight_l1 out of range(-128,127).\012\000" )
.LC347:
	ASCII(.ascii	"delta_chroma_offset_l1\000" )
	.space	1
.LC348:
	ASCII(.ascii	"delta_chroma_offset_l1 out of range(-512,511).\012\000" )
.LC349:
	ASCII(.ascii	"slice_pic_parameter_set_id\000" )
	.space	1
.LC350:
	ASCII(.ascii	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC351:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\012\000" )
.LC352:
	ASCII(.ascii	"max_cu_width(%d)/max_cu_height(%d) = 0\012\000" )
.LC353:
	ASCII(.ascii	"slice_segment_address(%d) out of range(0,%d).\012\000" )
	.space	1
.LC354:
	ASCII(.ascii	"slice_type\000" )
	.space	1
.LC355:
	ASCII(.ascii	"slice_type(%d) out of range(0,2].\012\000" )
	.space	1
.LC356:
	ASCII(.ascii	"WARNING: LastDisplayPoc:%d poc:%d \012\000" )
.LC357:
	ASCII(.ascii	"SH HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	2
.LC358:
	ASCII(.ascii	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
.LC359:
	ASCII(.ascii	"num_long_term_sps\000" )
	.space	2
.LC360:
	ASCII(.ascii	"num_long_term_sps(%d) out of range[0,%d].\012\000" )
	.space	1
.LC361:
	ASCII(.ascii	"num_long_term_pics\000" )
	.space	1
.LC362:
	ASCII(.ascii	"SH ERROR: (num_negative_pics(%d) + num_positive_pic" )
	ASCII(.ascii	"s(%d) + num_of_longterm_pics(%d)) > %d\012\000" )
	.space	1
.LC363:
	ASCII(.ascii	"lt_idx_sps[%d] = %d, but out of range[0,%d].\012\000" )
	.space	2
.LC364:
	ASCII(.ascii	"delta_poc_msb_cycle_lt\000" )
	.space	1
.LC365:
	ASCII(.ascii	"ERROR: pRPS->num_of_pics(%d) > %d.\012\000" )
.LC366:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC367:
	ASCII(.ascii	"num_ref_idx_l0_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC368:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC369:
	ASCII(.ascii	"num_ref_idx_l1_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC370:
	ASCII(.ascii	"pRPS is null.\012\000" )
	.space	1
.LC371:
	ASCII(.ascii	"pRPS->num_of_pics out(%d) of range(0,%d).\012\000" )
	.space	1
.LC372:
	ASCII(.ascii	"SH HEVC_DecRefPicListsModification error.\012\000" )
	.space	1
.LC373:
	ASCII(.ascii	"collocated_ref_idx\000" )
	.space	1
.LC374:
	ASCII(.ascii	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) " )
	ASCII(.ascii	"out of range(0,%d).\012\000" )
.LC375:
	ASCII(.ascii	"SH HEVC_DecPredWeightTable error.\012\000" )
	.space	1
.LC376:
	ASCII(.ascii	"five_minus_max_num_merge_cand\000" )
	.space	2
.LC377:
	ASCII(.ascii	"SH max_num_merge_cand(%d) out of range(1,5).\012\000" )
	.space	2
.LC378:
	ASCII(.ascii	"slice_qp_delta\000" )
	.space	1
.LC379:
	ASCII(.ascii	"SH slice_qp(%d) out of range [-%d,51].\012\000" )
.LC380:
	ASCII(.ascii	"slice_cb_qp_offset\000" )
	.space	1
.LC381:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC382:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out " )
	ASCII(.ascii	"of range[-12,12].\012\000" )
	.space	2
.LC383:
	ASCII(.ascii	"slice_cr_qp_offset\000" )
	.space	1
.LC384:
	ASCII(.ascii	"SH slice_cr_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC385:
	ASCII(.ascii	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) ou" )
	ASCII(.ascii	"t of range[-12,12].\012\000" )
.LC386:
	ASCII(.ascii	"slice_beta_offset_div2\000" )
	.space	1
.LC387:
	ASCII(.ascii	"SH slice_beta_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC388:
	ASCII(.ascii	"slice_tc_offset_div2\000" )
	.space	3
.LC389:
	ASCII(.ascii	"SH slice_tc_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC390:
	ASCII(.ascii	"num_entry_point_offsets\000" )
.LC391:
	ASCII(.ascii	"CurrSlice.num_entry_point_offsets(%d) out of range[" )
	ASCII(.ascii	"0,%d].\012\000" )
	.space	1
.LC392:
	ASCII(.ascii	"offset_len_minus1\000" )
	.space	2
.LC393:
	ASCII(.ascii	"CurrSlice.offset_len(%d) out of range[1,32].\012\000" )
	.space	2
.LC394:
	ASCII(.ascii	"slice_segment_header_extension_length\000" )
	.space	2
.LC395:
	ASCII(.ascii	"slice_segment_header_extension_length(%d) out of ra" )
	ASCII(.ascii	"nge [0,256]\012\000" )
.LC396:
	ASCII(.ascii	"bitsLeft(%d) < slice_segment_header_extension_lengt" )
	ASCII(.ascii	"h(%d)\012\000" )
	.space	2
.LC397:
	ASCII(.ascii	"%s arrange mem failed.\012\000" )
.LC398:
	ASCII(.ascii	"Init dec para\012\000" )
	.space	1
.LC399:
	ASCII(.ascii	"HEVC_InitDPB error, return %d\012\000" )
	.space	1
.LC400:
	ASCII(.ascii	"HEVC_AllocFrameStore error\012\000" )
.LC401:
	ASCII(.ascii	"%s: HEVC_OutputFrame failed!\012\000" )
	.space	2
.LC402:
	ASCII(.ascii	"%s output current picture failed\012\000" )
	.space	2
.LC403:
	ASCII(.ascii	"HEVC.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC404:
	ASCII(.ascii	"%s call HEVC_GetUnRefPicWithMinPoc failed\012\000" )
	.space	1
.LC405:
	ASCII(.ascii	"%s call HEVC_OutputOneFrmFromDPB failed\012\000" )
	.space	3
.LC406:
	ASCII(.ascii	"%s flush dpb in poc order failed.\012\000" )
	.space	1
.LC407:
	ASCII(.ascii	"%s: flush dpb failed, return %d\012\000" )
	.space	3
.LC408:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), need to incr" )
	ASCII(.ascii	"ease DPB size.\012\000" )
	.space	1
.LC409:
	ASCII(.ascii	"%s call HEVC_IncreaseDPBSize failed\012\000" )
	.space	3
.LC410:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpo" )
	ASCII(.ascii	"c frame.\012\000" )
	.space	3
.LC411:
	ASCII(.ascii	"%s with invalid pos(%d)\012\000" )
	.space	3
.LC412:
	ASCII(.ascii	"%s get APC error, ret %d\012\000" )
	.space	2
.LC413:
	ASCII(.ascii	"%s %d: InsertFrmInDPB failed, return %d\012\000" )
	.space	3
.LC414:
	ASCII(.ascii	"%s call HEVC_CheckFrameStore failed!\012\000" )
	.space	2
.LC415:
	ASCII(.ascii	"%s call HEVC_RemoveUnUsedFrameStore Failed.\012\000" )
	.space	3
.LC416:
	ASCII(.ascii	"%s call HEVC_InsertFrmInDPB Failed.\012\000" )
	.space	3
.LC417:
	ASCII(.ascii	"No frame store for lost pic.\012\000" )
	.space	2
.LC418:
	ASCII(.ascii	"DPB ERROR: Can not get ref_fs!\012\000" )
.LC419:
	ASCII(.ascii	"DPB no suited fs for lost pic.\012\000" )
.LC420:
	ASCII(.ascii	"Take poc(%d) to creat lost poc(%d).\012\000" )
	.space	3
.LC421:
	ASCII(.ascii	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\012\000" )
	.space	1
.LC422:
	ASCII(.ascii	"DPB ERROR: PMV = NULL, ClearDPB!\012\000" )
	.space	2
.LC423:
	ASCII(.ascii	"ERROR: Can not new logic fs!\012\000" )
	.space	2
.LC424:
	ASCII(.ascii	"Lost pic insert in DPB Failed!\012\000" )
.LC425:
	ASCII(.ascii	"Ref frame(poc %d) lost.\012\000" )
	.space	3
.LC426:
	ASCII(.ascii	"s32OutErrThr = %d,drop poc %d because lost ref fram" )
	ASCII(.ascii	"e(pod %d)\012\000" )
	.space	2
.LC427:
	ASCII(.ascii	"%s call HEVC_FirstFrameFastOut Failed\012\000" )
	.space	1
.LC428:
	ASCII(.ascii	"DPB.used_size may bigger than DPB.size\012\000" )
.LC429:
	ASCII(.ascii	"HEVC_InsertFrmInDPB Failed, ret = %d\012\000" )
	.space	2
.LC430:
	ASCII(.ascii	"%s call HEVC_OutputFrmFromDPB failed\012\000" )
	.space	2
.LC431:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC432:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC433:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC434:
	ASCII(.ascii	"pHevcCtx->CurrPic.frame_store is null pointer\012\000" )
	.space	1
.LC435:
	ASCII(.ascii	"HEVC_StorePicInDpb return(%d) from L%d\012\000" )
.LC436:
	ASCII(.ascii	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_" )
	ASCII(.ascii	"NORMAL\012\000" )
	.space	1
.LC437:
	ASCII(.ascii	"%s, REPORT_IFRAME_ERR\012\000" )
	.space	1
.LC438:
	ASCII(.ascii	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\012\000" )
	.space	1
.LC439:
	ASCII(.ascii	"%s call HEVC_DirectOutput Failed\012\000" )
	.space	2
.LC440:
	ASCII(.ascii	"%s call HEVC_IModeProcess Failed\012\000" )
	.space	2
.LC441:
	ASCII(.ascii	"%s call HEVC_SimpleDPBProcess Failed\012\000" )
	.space	2
.LC442:
	ASCII(.ascii	"%s call HEVC_DecOrderProcess Failed\012\000" )
	.space	3
.LC443:
	ASCII(.ascii	"%s call HEVC_DispOrderProcess Failed\012\000" )
	.space	2
.LC444:
	ASCII(.ascii	"%s return HEVC_DEC_ERR\012\000" )
.LC445:
	ASCII(.ascii	"HEVC_DecVDM MaxBytesReceived exceed threshold!\012\000" )
.LC446:
	ASCII(.ascii	"HEVC_DecVDM no slice and needn't start VDM\012\000" )
.LC447:
	ASCII(.ascii	"IPBDecMode Changed (%d -> %d)\012\000" )
	.space	1
.LC448:
	ASCII(.ascii	"Discard this B(poc=%d) before P, is_ref_idc=%d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC449:
	ASCII(.ascii	"VDM start, TotalPicNum=%d.\012\000" )
.LC450:
	ASCII(.ascii	"%s no correct slice in the pic\012\000" )
.LC451:
	ASCII(.ascii	"metadatasize is too large:%d at line:%d\012\000" )
	.space	3
.LC452:
	ASCII(.ascii	"%s:%d Metadata map failed\012\000" )
	.space	1
.LC453:
	ASCII(.ascii	"%s:%d Metadata is NULL\012\000" )
.LC454:
	ASCII(.ascii	"%s:%d Metadata unmap failed\012\000" )
	.space	3
.LC455:
	ASCII(.ascii	"*****[%s][%d],BL Codec can only dec BL stream!!****" )
	ASCII(.ascii	"*\012\000" )
	.space	2
.LC456:
	ASCII(.ascii	"*****[%s][%d],EL Codec can only dec EL stream in DV" )
	ASCII(.ascii	"_DUAL_VES_IMP stream!!*****\012\000" )
.LC457:
	ASCII(.ascii	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC458:
	ASCII(.ascii	"%s call HEVC_FlushOutputFrmFromDPB failed\012\000" )
	.space	1
.LC459:
	ASCII(.ascii	"%s call HEVC_EmptyFrmFromDPB failed\012\000" )
	.space	3
.LC460:
	ASCII(.ascii	"Meet CRA frame, force output remain frame, CurPoc %" )
	ASCII(.ascii	"d, LastPoc %d\012\000" )
	.space	2
.LC461:
	ASCII(.ascii	"Init pic err, exit\012\000" )
.LC462:
	ASCII(.ascii	"HEVC_WritePicMsg failed!\012\000" )
	.space	2
.LC463:
	ASCII(.ascii	"Start Reason: SliceParaNum= %d\012\000" )
.LC464:
	ASCII(.ascii	"Too many slice , err!\012\000" )
	.space	1
.LC465:
	ASCII(.ascii	"Cur pic not init yet, discard this slice!\012\000" )
	.space	1
.LC466:
	ASCII(.ascii	"Dec List error, ret=%d\012\000" )
.LC467:
	ASCII(.ascii	"Ref List is Wrong!\012\000" )
.LC468:
	ASCII(.ascii	"HEVC_WriteSliceMsg err.\012\000" )
	.space	3
.LC469:
	ASCII(.ascii	"VPS decode error.\012\000" )
	.space	1
.LC470:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC471:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC472:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC473:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d\012\000" )
.LC474:
	ASCII(.ascii	"HEVC_DecSliceSegmentHeader dec err\012\000" )
.LC475:
	ASCII(.ascii	"CurBitsLen = %d, MinBitsLen = %d\012\000" )
	.space	2
.LC476:
	ASCII(.ascii	"%s last frame fs unrelease, fix it!\012\000" )
	.space	3
.LC477:
	ASCII(.ascii	"CtbNumOneFrame = %d, SedEnd0 = %d\012\000" )
	.space	1
.LC478:
	ASCII(.ascii	"%s: Get context addr failed!\012\000" )
	.space	2
.LC479:
	ASCII(.ascii	"%s FATAL: MemOffset %d > ContextMemSize %d.\012\000" )
	.space	3
.LC480:
	ASCII(.ascii	"%s: VCTRL_GetChanIDByCtx() return -1!\012\000" )
	.space	1
.LC481:
	ASCII(.ascii	"Fs leak, clear dpb fs not in vo queue.\012\000" )
.LC482:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pPacket!\012\000" )
	.space	1
.LC483:
	ASCII(.ascii	"HevcCtx not init!\012\000" )
	.space	1
.LC484:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC485:
	ASCII(.ascii	"nal_layer_id out %d of range[0,1].\012\000" )
.LC486:
	ASCII(.ascii	"IsSizeChanged = %d, report fake frame w/h = %d/%d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC487:
	ASCII(.ascii	"HEVC_InquireSliceProperty error.\012\000" )
	.space	2
.LC488:
	ASCII(.ascii	"HEVC_DecOneNal ERR\012\000" )
.LC489:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC490:
	ASCII(.ascii	"VDMDRV_GetUvMOSParam failed\012\000" )
	.space	3
.LC491:
	ASCII(.ascii	"HEVC_StorePicInDPB failed, ret = %d\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
.LANCHOR2 = . + 261888
.LANCHOR4 = . + 327360
	.type	g_TsToRsMap, %object
	.size	g_TsToRsMap, 262144
g_TsToRsMap:
	.space	262144
	.type	g_IsDeced, %object
	.size	g_IsDeced, 65536
g_IsDeced:
	.space	65536
	.type	s_TmpParam, %object
	.size	s_TmpParam, 12644
s_TmpParam:
	.space	12644
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
