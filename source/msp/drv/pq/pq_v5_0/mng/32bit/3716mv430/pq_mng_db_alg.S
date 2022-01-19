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
	.file	"pq_mng_db_alg.c"
	.text
	.align	2
	.global	DBD_Init
	.type	DBD_Init, %function
DBD_Init:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r2, #16384
	mov	r4, r0
	mov	r6, r1
	add	r7, r4, r2
	add	r0, r0, #4
	mov	r1, #0
	bl	pq_alg_memset
	add	r7, r7, #5
	add	r3, r4, #16384
	mov	r5, #0
	mov	r0, r7
	str	r5, [r4]
	mov	r1, r5
	strb	r5, [r3, #4]
	mov	r2, #4096
	mov	r8, r6
	bl	pq_alg_memset
	add	r0, r4, #20480
	mov	r2, #6
	mov	ip, #10
	str	r7, [r0, #8]
	add	r7, r6, #4224
	strb	r2, [r0, #16]
	mov	r2, #4096
	add	r4, r6, r2
	strb	r5, [r0, #15]
	strb	ip, [r0, #12]
	add	r7, r7, #20
	mov	ip, #4
	mov	r3, #15
	strb	ip, [r0, #17]
	mov	r1, #8
	strb	r3, [r0, #13]
	mov	r3, #127
	strb	r1, [r0, #14]
	mov	r1, r5
	strb	r3, [r0, #18]
	str	r5, [r8], #4
	mov	r0, r8
	bl	pq_alg_memset
	add	r0, r4, #8
	mov	r1, r5
	str	r8, [r4, #4]
	mov	r2, #128
	bl	pq_alg_memset
	mov	r0, r7
	mov	r1, r5
	str	r5, [r4, #136]
	strb	r5, [r4, #140]
	mov	r2, #4096
	strb	r5, [r4, #141]
	str	r5, [r4, #144]
	bl	pq_alg_memset
	add	r1, r6, #8192
	mov	r0, r5
	str	r7, [r1, #148]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	DBD_Init, .-DBD_Init
	.align	2
	.global	DBF_Init
	.type	DBF_Init, %function
DBF_Init:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, #0
	mov	r3, r0
	mov	r0, r1
	mov	r5, r1
	str	r4, [r3]
	mov	r2, #3
	str	r4, [r3, #4]
	mov	r1, r4
	strb	r2, [r3, #532]
	mov	r2, #4
	strb	r4, [r3, #8]
	str	r4, [r3, #12]
	strb	r4, [r0], #1
	bl	pq_alg_memset
	strb	r4, [r5, #9]
	strb	r4, [r5, #10]
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	DBF_Init, .-DBF_Init
	.align	2
	.global	DB_Init
	.type	DB_Init, %function
DB_Init:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r7, [fp, #4]
	mov	r0, r3
	mov	r5, r3
	mov	r4, #0
	add	r6, r7, #8192
	mov	r1, r7
	bl	DBD_Init
	add	r3, r5, #20480
	add	r0, r7, #8320
	mov	r2, #3
	str	r4, [r3, #20]
	add	r0, r0, #25
	strb	r2, [r3, #552]
	mov	r1, r4
	str	r4, [r3, #24]
	mov	r2, #4
	strb	r4, [r3, #28]
	str	r4, [r3, #32]
	strb	r4, [r6, #152]
	bl	pq_alg_memset
	strb	r4, [r6, #161]
	strb	r4, [r6, #162]
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	DB_Init, .-DB_Init
	.align	2
	.global	DB_InitOutputReg
	.type	DB_InitOutputReg, %function
DB_InitOutputReg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrh	r2, [r0]
	mov	r5, r1
	mov	r8, r0
	add	r6, r0, #8192
	add	lr, r6, #524
	movw	ip, #526
	strh	r2, [r5]
	add	r3, r6, #528
	ldrh	r4, [r8, #2]
	add	r1, r0, #12
	mov	r2, #512
	add	r0, r5, #12
	add	r7, r6, #532
	add	r8, r8, #8704
	strh	r4, [r5, #2]
	add	r4, r5, #524
	ldrh	lr, [lr]
	strh	lr, [r5, #4]
	ldrh	ip, [r6, ip]
	strh	ip, [r5, #6]
	ldrh	r3, [r3]
	strh	r3, [r5, #8]
	bl	pq_alg_memcpy
	ldrb	r3, [r6, #532]
	add	r1, r8, #30
	add	r0, r4, #10
	mov	r2, #8
	strb	r3, [r5, #524]
	ldrb	r3, [r6, #533]
	strb	r3, [r5, #525]
	ldrh	r3, [r7, #2]
	strh	r3, [r4, #2]
	ldr	r3, [r6, #536]
	str	r3, [r5, #528]
	ldrb	r3, [r6, #540]
	strb	r3, [r5, #532]
	ldrb	r3, [r6, #541]
	strb	r3, [r5, #533]
	bl	pq_alg_memcpy
	add	r1, r8, #38
	add	r0, r4, #18
	mov	r2, #16
	bl	pq_alg_memcpy
	ldrb	r3, [r6, #566]
	add	r1, r8, #59
	add	r0, r4, #39
	mov	r2, #12
	strb	r3, [r5, #558]
	ldrb	r3, [r6, #567]
	strb	r3, [r5, #559]
	ldrb	r3, [r6, #568]
	strb	r3, [r5, #560]
	ldrb	r3, [r6, #569]
	strb	r3, [r5, #561]
	ldrb	r3, [r6, #570]
	strb	r3, [r5, #562]
	bl	pq_alg_memcpy
	add	r1, r8, #71
	add	r0, r4, #51
	mov	r2, #17
	bl	pq_alg_memcpy
	ldrh	r3, [r7, #68]
	add	r8, r8, #20
	mov	r0, #0
	strh	r3, [r4, #68]
	ldrh	r3, [r7, #70]
	strh	r3, [r4, #70]
	ldrh	r3, [r7, #72]
	strh	r3, [r4, #72]
	ldrh	r3, [r7, #74]
	strh	r3, [r4, #74]
	ldrh	r3, [r7, #76]
	strh	r3, [r4, #76]
	ldrh	r3, [r7, #78]
	strh	r3, [r4, #78]
	ldrh	r3, [r7, #80]
	strh	r3, [r4, #80]
	ldrh	r3, [r7, #82]
	strh	r3, [r4, #82]
	ldrh	r3, [r7, #84]
	strh	r3, [r4, #84]
	ldrh	r3, [r7, #86]
	strh	r3, [r4, #86]
	ldrh	r3, [r7, #88]
	strh	r3, [r4, #88]
	ldrh	r3, [r7, #90]
	strh	r3, [r4, #90]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	DB_InitOutputReg, .-DB_InitOutputReg
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.align	2
	.global	DB_UpdateCfg
	.type	DB_UpdateCfg, %function
DB_UpdateCfg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r2
	mov	r10, r3
	mov	r9, r0
	mov	r5, r1
	beq	.L125
	cmp	r3, #0
	cmpne	r2, #0
	ldr	r2, [fp, #4]
	moveq	r3, #1
	movne	r3, #0
	cmp	r2, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L125
	mov	r1, r4
	mov	r0, r5
	bl	DB_InitOutputReg
	ldr	r2, [r5, #8]
	add	r6, r10, #16384
	mov	r1, #0
	add	r3, r2, #1
	strb	r2, [r6, #4]
	uxtb	r3, r3
	ldr	r2, [r5, #4]
	cmp	r3, #64
	str	r2, [r10]
	mvnhi	r3, #0
	strhib	r3, [r6, #4]
	add	r3, r10, #4
	mov	r2, #16384
	str	r3, [fp, #-92]
	mov	r0, r3
	bl	pq_alg_memset
	add	ip, r5, #3392
	add	ip, ip, #8
	add	r1, r5, #520
	add	r2, r10, #8
.L8:
	ldr	r3, [r1, #4]!
	cmp	r1, ip
	ubfx	r0, r3, #0, #11
	ubfx	r3, r3, #16, #11
	str	r0, [r2, #-4]
	str	r3, [r2], #8
	bne	.L8
	add	r7, r10, #16384
	mov	r2, #2048
	add	r7, r7, #5
	mov	r1, #0
	add	r8, r5, #12
	mov	r0, r7
	bl	pq_alg_memset
	mov	r3, #0
.L10:
	mov	r1, r3, lsr #5
	and	r0, r3, #31
	cmp	r1, #127
	ldrls	r2, [r8, r1, asl #2]
	movls	r2, r2, lsr r0
	andls	r2, r2, #1
	strlsb	r2, [r7, r3]
	add	r3, r3, #1
	cmp	r3, #2048
	bne	.L10
	add	r3, r10, #20480
	str	r3, [fp, #-80]
	str	r7, [r3, #8]
	ldr	r3, [r9, #8]
	ldr	r2, [r9, #12]
	cmp	r3, #4096
	cmpls	r2, #2160
	bhi	.L187
	sub	r3, r3, #4
	movw	r1, #3836
	cmp	r3, r1
	bls	.L192
.L12:
	mov	r3, #0
	strh	r3, [r4]
.L13:
	ldr	r2, [r4]
	mov	r3, #1
	movt	r3, 1
	cmp	r2, r3
	beq	.L193
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #4]
	add	r8, r3, #4096
	mvn	r3, #0
	add	r7, r2, #8192
	strb	r3, [r8, #141]
	ldr	r3, [r9, #8]
.L28:
	ldr	r2, [r9, #12]
	cmp	r2, #2160
	cmpls	r3, #4096
	bhi	.L96
	ldrsb	r2, [r8, #141]
	cmp	r2, #8
	moveq	r3, r3, lsr #3
	movne	r3, #90
	strh	r3, [r4, #4]
	ldr	r3, [r9, #8]
	ldr	r2, [r9, #12]
	cmp	r3, #4096
	cmpls	r2, #2160
	bhi	.L92
	cmp	r3, #720
	movls	r3, #16
	strlsh	r3, [r4, #8]
	bls	.L92
	cmp	r3, #1920
	movls	r3, #42
	movhi	r3, #63
	strh	r3, [r4, #8]
.L92:
	ldr	r3, [fp, #4]
	mov	r2, #128
	mov	r1, #0
	add	r0, r4, #12
	add	r6, r3, #4224
	bl	pq_alg_memset
	add	r6, r6, #20
	add	ip, r4, #8
	mov	lr, #0
.L95:
	mov	r0, r6
	ldr	r2, [ip, #4]!
	ldrb	r1, [r0, lr]!
	mov	r3, #1
	and	r1, r1, r3
	orr	r1, r1, r2
	str	r1, [ip]
	b	.L97
.L195:
	ldrb	r2, [r0, #1]!
	and	r2, r2, #1
	orr	r1, r1, r2, asl r3
	add	r3, r3, #1
	cmp	r3, #32
	str	r1, [ip]
	beq	.L194
.L97:
	add	r2, r3, lr
	cmp	r2, #2048
	bcc	.L195
.L96:
	ldr	r2, [r8, #144]
	add	r6, r4, #524
	ldr	r10, [fp, #-80]
	mov	lr, #24
	ldr	r3, .L205
	mov	ip, #2
	add	r0, r6, #10
	add	r9, r6, #39
	str	r2, [r10, #20]
	mov	r2, #8
	ldrsb	r1, [r8, #141]
	add	r5, r5, #8192
	str	r1, [r10, #24]
	ldr	r1, [fp, #4]
	ldr	r1, [r1]
	str	r1, [r10, #32]
	ldrb	r1, [r8, #141]
	ldr	r10, [r8, #144]
	strb	lr, [r4, #532]
	strb	r1, [r3, #4]
	strb	ip, [r4, #533]
	ldr	r1, .L205+4
	str	r10, [r3]
	bl	pq_alg_memcpy
	add	r10, r6, #51
	add	r0, r6, #18
	mov	r2, #16
	ldr	r1, .L205+8
	bl	pq_alg_memcpy
	mov	r0, r9
	mov	r2, #12
	ldr	r1, .L205+12
	bl	pq_alg_memcpy
	ldr	r1, .L205+16
	mov	r0, r10
	mov	r2, #17
	bl	pq_alg_memcpy
	ldr	r1, [fp, #-80]
	ldr	r3, [r1, #24]
	cmp	r3, #3
	ble	.L99
	ldrb	r2, [r5, #532]
	cmp	r2, #1
	beq	.L196
.L99:
	mov	r8, #0
	str	r8, [r4, #528]
.L113:
	ldr	r2, [fp, #-80]
	mov	r3, #1
	strb	r3, [r5, #533]
	ldr	r5, [r2, #24]
	cmp	r5, #3
	ble	.L114
	ldr	r2, [r2, #20]
	cmp	r2, #0
	bgt	.L197
.L114:
	mov	r3, #0
	strb	r3, [r7, #162]
.L122:
	mov	r0, #0
	mov	r3, #2
	strh	r0, [r6, #82]
	mov	r2, #8
	strh	r0, [r6, #84]
	strh	r2, [r6, #86]
	strh	r3, [r6, #88]
	ldrb	r3, [r7, #162]
	strb	r3, [r4, #525]
	strb	r3, [r4, #524]
.L182:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L192:
	sub	r2, r2, #1
	cmp	r2, #2160
	bcc	.L13
	b	.L12
.L194:
	add	lr, lr, #32
	cmp	lr, #1024
	bne	.L95
	b	.L96
.L193:
	ldr	r3, [r9, #8]
	cmp	r3, #4096
	str	r3, [fp, #-84]
	bls	.L177
.L187:
	ldr	r3, [fp, #4]
	add	r8, r3, #4096
	add	r7, r3, #8192
	b	.L96
.L197:
	adds	r2, r5, #7
	strb	r3, [r7, #162]
	addmi	r2, r5, #14
	ubfx	r2, r2, #3, #8
	strb	r2, [r4, #558]
	cmp	r2, r3
	strb	r2, [r4, #559]
	beq	.L116
	bcc	.L117
	cmp	r2, #2
	bne	.L198
	strb	r3, [r4, #561]
	mov	r0, r9
	ldr	r1, .L205+20
	mov	r2, #12
	bl	pq_alg_memcpy
	ldr	r3, .L205+4
	mov	r1, #8
.L119:
	add	r5, r5, r5, lsr #31
	ldrb	r0, [r4, #558]
	str	r3, [fp, #-80]
	mov	r2, r5, asr #1
	cmp	r1, r2
	movge	r1, r2
	cmp	r0, #1
	strb	r1, [r4, #562]
	mov	r0, r10
	mov	r2, #17
	ldrls	r1, .L205+16
	ldrhi	r1, .L205+24
	bl	pq_alg_memcpy
	ldr	r3, [fp, #-80]
	mov	r1, #0
	add	r2, r3, r8, lsl #1
	add	r3, r3, r8
	ldrh	r0, [r2, #128]
	ldrh	lr, [r2, #148]
	ldrh	ip, [r2, #168]
	strh	r0, [r6, #90]
	ldrb	r3, [r3, #228]
	ldrh	r0, [r2, #188]
	ldrh	r2, [r2, #208]
	strh	lr, [r6, #74]
	strh	ip, [r6, #76]
	strh	r0, [r6, #78]
	strh	r2, [r6, #80]
	strb	r3, [r4, #532]
	strh	r1, [r6, #68]
	strh	r1, [r6, #70]
	strh	r1, [r6, #72]
	b	.L122
.L116:
	ldr	r3, .L205+4
	mov	r1, #0
	mov	r2, #12
	strb	r1, [r4, #561]
	mov	r0, r9
	add	r1, r3, #24
	str	r3, [fp, #-80]
	bl	pq_alg_memcpy
	cmp	r5, #4
	mov	r1, #4
	ldr	r3, [fp, #-80]
	strb	r1, [r4, #562]
	bne	.L119
	add	r1, r3, #72
	mov	r0, r9
	mov	r2, #12
	bl	pq_alg_memcpy
	ldrb	r1, [r4, #562]
	ldr	r3, [fp, #-80]
	b	.L119
.L196:
	movw	r2, #526
	strh	r3, [r4, r2]
	ldr	r3, [fp, #-80]
	ldr	r1, [r3, #32]
	cmp	r1, #0
	str	r1, [r4, #528]
	moveq	r8, r1
	beq	.L100
	ldr	r0, [r3, #20]
	mov	r0, r0, asl #4
	bl	__aeabi_idiv
	uxth	r8, r0
	cmp	r8, #0
	beq	.L100
	cmp	r8, #15
	movcs	r8, #15
.L100:
	mov	r2, #32
	ldr	r1, .L205+28
	sub	r0, fp, #76
	bl	memcpy
	ldr	r3, [fp, #-80]
	ldrb	r2, [r7, #152]
	ldrb	ip, [r3, #552]
	uxth	r3, ip
	cmp	r2, r3
	bcc	.L101
	cmp	r3, #0
	beq	.L188
	sub	r2, r3, #1
	ldr	r3, [fp, #4]
	ldr	r0, [fp, #4]
	uxth	r2, r2
	add	r1, r3, #8320
	add	r2, r2, #8320
	add	r1, r1, #24
	add	r2, r2, #25
	mov	r3, #0
	add	r2, r0, r2
.L105:
	ldrb	r0, [r1, #1]!
	add	r3, r3, r0
	cmp	r1, r2
	uxth	r3, r3
	bne	.L105
.L188:
	cmp	ip, #0
	mov	r0, r3
	ldreq	ip, [fp, #-80]
	moveq	r2, #3
	movne	r1, ip
	moveq	r1, r2
	subne	r3, r1, #1
	moveq	r3, #2
	streqb	r2, [ip, #552]
	str	r3, [fp, #-84]
	bl	__aeabi_idiv
	uxth	r0, r0
	rsb	r3, r0, r8
	cmp	r8, r0
	eor	r1, r3, r3, asr #31
	sub	r1, r1, r3, asr #31
	sub	r3, fp, #44
	uxth	r1, r1
	add	r1, r3, r1, lsl #1
	ldr	r3, [fp, #-84]
	ldrh	r2, [r1, #-32]
	bls	.L108
	add	r2, r0, r2
	cmp	r2, r8
	movlt	r8, r2
	bic	r8, r8, r8, asr #31
	uxth	r8, r8
.L109:
	cmp	r3, #0
	ble	.L110
	ldr	r0, [fp, #-80]
	mov	r2, #0
	mov	r1, r2
.L111:
	add	r3, r7, r1
	add	r2, r2, #1
	ldrb	ip, [r3, #154]
	uxth	r2, r2
	mov	r1, r2
	strb	ip, [r3, #153]
	ldrb	r3, [r0, #552]
	sub	r3, r3, #1
	cmp	r2, r3
	blt	.L111
.L110:
	add	r3, r7, r3
	strb	r8, [r3, #153]
.L104:
	cmp	r8, #0
	beq	.L112
	cmp	r8, #15
	movcs	r8, #15
	uxth	r8, r8
.L112:
	ldr	r3, .L205+4
	add	r8, r3, r8
	ldrb	r8, [r8, #56]
	b	.L113
.L101:
	add	r3, r7, r2
	add	r2, r2, #1
	strb	r8, [r3, #153]
	strb	r2, [r7, #152]
	b	.L104
.L125:
	mvn	r0, #0
	b	.L182
.L198:
	mov	r3, #2
	ldr	r1, .L205+32
	strb	r3, [r4, #561]
	mov	r0, r9
	mov	r2, #12
	bl	pq_alg_memcpy
	ldr	r3, .L205+4
	mov	r1, #12
	b	.L119
.L117:
	mov	r3, #0
	ldr	r1, .L205+12
	strb	r3, [r4, #561]
	mov	r0, r9
	mov	r2, #12
	bl	pq_alg_memcpy
	ldr	r3, .L205+4
	mov	r1, #2
	b	.L119
.L108:
	rsb	r2, r2, r0
	cmp	r2, r0
	movge	r2, r0
	cmp	r2, r8
	movlt	r2, r8
	uxth	r8, r2
	b	.L109
.L177:
	ldr	r3, [fp, #-80]
	ldr	r2, [r10]
	ldrb	r3, [r3, #12]
	cmp	r2, r3
	bcc	.L15
	ldrb	r1, [r6, #4]
	add	r3, r1, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L16
.L17:
	ldr	r3, [fp, #-80]
	ldrb	r2, [r3, #14]
	ldr	r3, [fp, #4]
	sub	r2, r2, #1
	add	r3, r3, #4096
	uxtb	r2, r2
	add	r3, r3, #8
	sxtb	r0, r2
	cmp	r0, #0
	ble	.L18
.L19:
	sxtb	r0, r2
	sub	r2, r2, #1
	ands	r2, r2, #255
	sxth	r0, r0
	mov	r1, r0, asl #3
	sub	ip, r1, #8
	add	r1, r3, r1
	add	lr, r3, ip
	ldrb	ip, [r3, ip]
	strb	ip, [r3, r0, asl #3]
	ldr	r0, [lr, #4]
	str	r0, [r1, #4]
	bne	.L19
	ldrb	r1, [r6, #4]
.L18:
	ldr	r2, [fp, #4]
	add	r8, r2, #4096
	strb	r1, [r8, #8]
	ldr	r2, [r10]
	ldr	r1, [r8, #136]
	str	r2, [r8, #12]
	ldr	r2, [fp, #-80]
	ldrb	r2, [r2, #14]
	cmp	r1, r2
	addcc	r1, r1, #1
	strcc	r1, [r8, #136]
	ldrcc	r2, [fp, #-80]
	ldrccb	r2, [r2, #14]
	cmp	r1, r2
	beq	.L21
	ldrb	r2, [r6, #4]
	ldrb	r3, [r8, #141]
.L22:
	cmp	r2, r3
	sxtb	r2, r3
	str	r2, [fp, #-96]
	bne	.L199
	add	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L200
	ldr	r3, [fp, #-96]
	cmp	r3, #8
	ldr	r3, [fp, #-80]
	ldr	r2, [r3, #8]
	ldrb	r3, [r3, #18]
	str	r2, [fp, #-88]
	ldr	r2, [fp, #4]
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [r2]
	beq	.L201
	ldr	r3, [fp, #-84]
	sub	r6, r3, #3
	ldr	r3, [r8, #4]
	cmp	r6, #4
	str	r3, [fp, #-112]
	bls	.L129
	ldr	r2, [fp, #-88]
	ldrb	r3, [r2, #4]
	cmp	r3, #1
	beq	.L129
	add	r3, r2, #4
	mov	r7, #4
	b	.L41
.L42:
	ldrb	r2, [r3, #1]!
	cmp	r2, #1
	beq	.L40
.L41:
	add	r7, r7, #1
	str	r7, [fp, #-100]
	cmp	r7, r6
	bne	.L42
.L40:
	ldr	r3, [fp, #-96]
	rsb	r3, r3, r7
	cmp	r3, #4
	ble	.L49
.L48:
	sub	r2, r3, #-1073741823
	ldr	lr, [fp, #-92]
	mov	r1, #0
	add	r2, lr, r2, lsl #2
	mov	ip, r1
	mov	r0, r1
.L47:
	ldr	lr, [r2], #4
	cmp	lr, ip
	movhi	r1, r0
	add	r0, r0, #1
	movhi	ip, lr
	cmp	r0, #3
	bne	.L47
	sub	r3, r3, #1
	ldr	r2, [fp, #-88]
	add	r1, r3, r1
	mov	r0, #1
	ldr	r3, [fp, #-96]
	strb	r0, [r2, r1]
	ldr	r2, [fp, #4]
	rsb	r3, r3, r1
	ldr	r1, [fp, #4]
	cmp	r3, #4
	ldr	r2, [r2]
	add	r2, r2, #1
	str	r2, [r1]
	bgt	.L48
.L49:
	cmp	r6, #0
	mov	r3, r6
	ble	.L185
	ldr	r2, [fp, #-88]
	ldrb	r1, [r2, r6]
	add	r2, r2, r6
	cmp	r1, #1
	bne	.L52
	b	.L185
.L53:
	ldrb	r1, [r2, #-1]!
	cmp	r1, #1
	beq	.L130
.L52:
	subs	r3, r3, #1
	bne	.L53
.L130:
	str	r3, [fp, #-104]
.L50:
	ldr	r2, [fp, #-96]
	add	r3, r2, r3
	cmp	r3, r6
	bcs	.L60
.L59:
	sub	r2, r3, #-1073741823
	ldr	lr, [fp, #-92]
	mov	r1, #0
	add	r2, lr, r2, lsl #2
	mov	ip, r1
	mov	r0, r1
.L58:
	ldr	lr, [r2], #4
	cmp	lr, ip
	movhi	r1, r0
	add	r0, r0, #1
	movhi	ip, lr
	cmp	r0, #3
	bne	.L58
	sub	r3, r3, #1
	ldr	r2, [fp, #-88]
	add	r1, r3, r1
	mov	r0, #1
	ldr	r3, [fp, #-96]
	strb	r0, [r2, r1]
	ldr	r2, [fp, #4]
	add	r3, r3, r1
	ldr	r1, [fp, #4]
	cmp	r3, r6
	ldr	r2, [r2]
	add	r2, r2, #1
	str	r2, [r1]
	bcc	.L59
.L60:
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-104]
	cmp	r3, r2
	bhi	.L56
	ldr	r2, [fp, #-100]
	mov	r6, #0
	str	r9, [fp, #-116]
	str	r4, [fp, #-124]
	mov	r9, r2
	str	r5, [fp, #-120]
	ldr	r4, [fp, #4]
	b	.L67
.L63:
	ldr	r3, [fp, #-104]
	add	r7, r7, #1
	cmp	r7, r3
	mov	r9, r7
	bhi	.L202
.L67:
	ldr	r3, [fp, #-88]
	ldrb	r2, [r3, r9]
	cmp	r2, #1
	bne	.L63
	str	r2, [fp, #-128]
	ldr	r1, [fp, #-96]
	ldr	r2, [fp, #-100]
	ldr	r3, [r4]
	cmp	r1, #0
	cmpne	r2, r9
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L132
	rsb	r0, r6, r9
	bl	__aeabi_uidiv
	cmp	r0, #1
	mov	r5, r0
	bls	.L132
	ldr	r2, [fp, #-128]
.L66:
	ldr	r3, [fp, #-96]
	ldr	lr, [fp, #-92]
	add	r3, r6, r3
	mov	r6, #0
	sub	r1, r3, #-1073741823
	mov	ip, r6
	mov	r0, r6
	add	r1, lr, r1, lsl #2
.L65:
	ldr	lr, [r1], #4
	cmp	lr, ip
	movhi	r6, r0
	add	r0, r0, #1
	movhi	ip, lr
	cmp	r0, #3
	bne	.L65
	sub	r3, r3, #1
	add	r2, r2, #1
	add	r6, r3, r6
	ldr	r3, [fp, #-88]
	mov	r1, #1
	cmp	r2, r5
	strb	r1, [r3, r6]
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	bne	.L66
.L132:
	mov	r6, r9
	b	.L63
.L15:
	mov	r1, #255
	mvn	r3, #0
	strb	r3, [r6, #4]
.L16:
	mov	r3, #100
	str	r3, [r10]
	b	.L17
.L199:
	ldr	r3, [fp, #4]
	mov	r1, #0
	ldr	r2, [fp, #-84]
	ldr	r0, [r8, #4]
	add	r7, r3, #8192
	bl	pq_alg_memset
	mov	r3, #0
	strb	r3, [r8, #140]
	ldr	r3, [r9, #8]
	b	.L28
.L21:
	cmp	r2, #1
	ldrb	lr, [r6, #4]
	ble	.L126
	mov	r7, #1
	mov	ip, r9
	mov	r0, r7
	mov	r9, lr
	sxtb	r1, lr
	str	r2, [fp, #-100]
	str	r1, [fp, #-96]
.L25:
	ldrsb	r1, [r3, #8]
	add	r7, r7, #1
	ldr	lr, [fp, #-96]
	uxtb	r7, r7
	cmp	r1, lr
	sxtb	r1, r7
	bne	.L24
	ldr	lr, [fp, #-80]
	add	r2, r0, #1
	str	r2, [fp, #-88]
	ldr	r2, [r3, #12]
	ldrb	lr, [lr, #13]
	cmp	r2, lr
	ldrcsb	r0, [fp, #-88]
.L24:
	ldr	r2, [fp, #-100]
	add	r3, r3, #8
	cmp	r1, r2
	blt	.L25
	mov	lr, r9
	mov	r9, ip
.L23:
	ldr	r3, [fp, #-80]
	ldrb	r3, [r3, #16]
	cmp	r3, r0
	strlsb	lr, [r8, #141]
	movhi	r2, lr
	ldrhib	r3, [r8, #141]
	movls	r3, lr
	ldrlsb	r2, [r6, #4]
	b	.L22
.L126:
	mov	r0, #1
	b	.L23
.L129:
	mov	r7, #4
	str	r7, [fp, #-100]
	b	.L40
.L202:
	sub	r4, fp, #124
	ldmia	r4, {r4, r5, r9}
.L56:
	ldr	r3, [fp, #-84]
	cmp	r3, #4
	bls	.L38
	ldr	r3, [fp, #-84]
	mov	ip, #0
	ldr	r2, [fp, #-112]
	sub	lr, r3, #1
	ldr	r0, [fp, #-108]
	add	r3, r2, #3
	add	lr, r2, lr
	ldr	r2, [fp, #-88]
	add	r2, r2, #3
	b	.L72
.L68:
	ldrb	r1, [r3]
	sub	r6, r1, #1
	sxtb	r1, r1
	cmp	r1, #0
	strleb	ip, [r3]
	ble	.L70
.L186:
	strb	r6, [r3]
.L70:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L38
.L72:
	ldrb	r1, [r2, #1]!
	cmp	r1, #1
	bne	.L68
	strb	ip, [r2]
	strb	r1, [r2, #-1]
	ldrb	r1, [r3]
	add	r6, r1, #1
	sxtb	r1, r1
	cmp	r1, r0
	strgeb	r0, [r3]
	bge	.L70
	b	.L186
.L204:
	ldr	r3, [fp, #-76]
.L31:
	mov	r6, #0
	sub	r1, fp, #76
	mov	r0, r6
	mov	r2, r6
	b	.L123
.L35:
	ldr	r3, [r1, #4]!
.L123:
	cmp	r0, r3
	movcc	r6, r2
	add	r2, r2, #1
	movcc	r0, r3
	cmp	r2, #8
	bne	.L35
	ldr	r2, [fp, #-84]
	mov	r1, #0
	ldr	r0, [fp, #-88]
	bl	pq_alg_memset
	cmp	r6, #0
	beq	.L36
	ldr	r3, [fp, #-88]
	mov	r2, #1
	add	r3, r3, r6
	strb	r2, [r3, #-1]
	ldr	r3, [fp, #4]
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, [fp, #4]
	str	r3, [r2]
.L36:
	ldr	r3, [fp, #-84]
	add	r6, r6, #7
	cmp	r3, r6
	bls	.L38
	ldr	r1, [fp, #4]
	mov	r2, #1
.L150:
	ldr	r3, [fp, #-88]
	strb	r2, [r3, r6]
	add	r6, r6, #8
	ldr	r3, [fp, #-84]
	cmp	r3, r6
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	bhi	.L150
.L38:
	ldr	r3, [fp, #-84]
	cmp	r3, #4096
	bgt	.L74
	cmp	r3, #0
	ble	.L75
	ldr	r3, [fp, #-96]
	mov	r2, #0
	ldr	r1, [fp, #-88]
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	b	.L79
.L76:
	ldr	r0, [fp, #-84]
	add	r2, r2, #1
	cmp	r2, r0
	beq	.L75
.L79:
	mov	r0, r1
	add	r1, r1, #1
	ldrb	ip, [r0]
	cmp	ip, #1
	bne	.L76
	cmp	r3, r2
	blt	.L76
	mov	r3, #0
	strb	r3, [r0]
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #4]
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	r3, [r2]
.L75:
	ldr	r3, [fp, #-84]
	cmp	r3, #1
	ble	.L74
	ldr	r3, [fp, #-96]
	ldr	r1, [fp, #-88]
	add	r2, r3, r3, lsr #31
	ldr	r3, [fp, #-84]
	sub	r3, r3, #1
	add	ip, r1, r3
	mov	r3, #1
	mov	r2, r2, asr r3
	b	.L81
.L80:
	ldr	r1, [fp, #-84]
	add	r3, r3, #1
	cmp	r3, r1
	beq	.L74
.L81:
	mov	r1, ip
	sub	ip, ip, #1
	ldrb	r0, [r1]
	cmp	r0, #1
	bne	.L80
	cmp	r2, r3
	blt	.L80
	mov	r3, #0
	strb	r3, [r1]
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #4]
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	r3, [r2]
.L74:
	ldr	r3, [fp, #4]
	ldr	r6, [fp, #-80]
	add	r7, r3, #8192
	ldr	r2, [fp, #-84]
	ldr	r1, [r6, #8]
	ldr	r0, [r7, #148]
	bl	pq_alg_memcpy
	ldrsb	r3, [r8, #141]
	cmp	r3, #8
	beq	.L83
	ldrb	r3, [r8, #140]
	ldrb	r2, [r6, #17]
	cmp	r2, r3
	addhi	r3, r3, #1
	strhib	r3, [r8, #140]
	bhi	.L83
	ldr	r3, [fp, #-84]
	cmp	r3, #4
	bls	.L83
	mov	r3, #5
	str	r4, [fp, #-88]
	b	.L89
.L134:
	mov	r6, r3
.L86:
	ldr	r2, [fp, #-84]
	add	r3, r3, #1
	cmp	r2, r6
	bls	.L203
.L89:
	ldr	r0, [r7, #148]
	sub	r2, r3, #1
	ldrb	r4, [r0, r2]
	cmp	r4, #1
	bne	.L134
	ldr	ip, [fp, #-80]
	ldr	r1, [r8, #4]
	ldrb	lr, [ip, #17]
	ldrsb	ip, [r1, r2]
	cmp	ip, lr
	bge	.L134
	sub	r6, r3, #2
	ldrsb	ip, [r1, r6]
	ldrsb	r1, [r1, r3]
	cmp	lr, ip
	bgt	.L135
	cmp	ip, r1
	blt	.L135
	strb	r4, [r0, r6]
	mov	r0, #0
	ldr	r1, [r7, #148]
	mov	r6, r3
	strb	r0, [r1, r2]
	b	.L86
.L203:
	ldr	r4, [fp, #-88]
.L83:
	ldr	r3, [r10]
	str	r3, [r8, #144]
	ldr	r3, [r9, #8]
	b	.L28
.L135:
	cmp	lr, r1
	cmple	ip, r1
	mov	r6, r3
	bge	.L86
	mov	r1, #1
	strb	r1, [r0, r3]
	ldr	r1, [r7, #148]
	mov	r0, #0
	strb	r0, [r1, r2]
	b	.L86
.L201:
	ldr	r2, [fp, #-84]
	str	r3, [fp, #-76]
	sub	r0, r2, #3
	str	r3, [fp, #-72]
	cmp	r0, #4
	str	r3, [fp, #-68]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	bls	.L31
	ldr	r3, [fp, #-88]
	add	ip, r3, #3
	mov	r3, #4
	b	.L33
.L32:
	add	r3, r3, #1
	cmp	r3, r0
	beq	.L204
.L33:
	ldrb	r2, [ip, #1]!
	cmp	r2, #1
	bne	.L32
	and	r2, r3, #7
	sub	r1, fp, #44
	add	r2, r1, r2, lsl #2
	ldr	r1, [r2, #-32]
	add	r1, r1, #1
	str	r1, [r2, #-32]
	b	.L32
.L200:
	ldr	r3, [fp, #4]
	mov	r1, #0
	ldr	r10, [fp, #-84]
	mov	r6, r1
	add	r7, r3, #8192
	mov	r2, r10
	ldr	r0, [r7, #148]
	bl	pq_alg_memset
	mvn	r3, #0
	mov	r2, r10
	strb	r3, [r8, #141]
	str	r6, [r8, #144]
	mov	r1, r6
	ldr	r0, [r8, #4]
	bl	pq_alg_memset
	ldr	r3, [fp, #4]
	strb	r6, [r8, #140]
	str	r6, [r3]
	ldr	r3, [r9, #8]
	b	.L28
.L185:
	str	r6, [fp, #-104]
	b	.L50
.L206:
	.align	2
.L205:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LANCHOR1+8
	.word	.LANCHOR1+24
	.word	.LANCHOR1+36
	.word	.LANCHOR1+84
	.word	.LANCHOR1+108
	.word	.LANCHOR2
	.word	.LANCHOR1+96
	UNWIND(.fnend)
	.size	DB_UpdateCfg, .-DB_UpdateCfg
	.global	g_u32DbDetUsingHyCounterBorder
	.global	g_s8DbDetUsingSizeHy
	.global	g_au8GradSubRatio
	.global	g_au16BordAdjGain
	.global	g_au16HFVarGain2
	.global	g_au16HFVarGain1
	.global	g_au16HFVarCore
	.global	g_au16PixValAdjGain
	.global	g_au8RatIdxLut
	.global	g_au8DbStrFadLut3
	.global	g_au8DbStrFadLut2
	.global	g_au8DbStrFadLut1_4
	.global	g_au8DbStrFadLut1
	.global	g_au8DbDirStrGainLut
	.global	g_au8DbDirStrLut
	.global	g_au8DbStr_Delta_LutStrong
	.global	g_au8DbStr_Delta_LutUltraStrong
	.section	.rodata
	.align	2
.LANCHOR2 = . + 0
.LC0:
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	g_au8DbDirStrGainLut, %object
	.size	g_au8DbDirStrGainLut, 8
g_au8DbDirStrGainLut:
	.byte	8
	.byte	5
	.byte	3
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	g_au8DbDirStrLut, %object
	.size	g_au8DbDirStrLut, 16
g_au8DbDirStrLut:
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	6
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	g_au8DbStrFadLut1, %object
	.size	g_au8DbStrFadLut1, 12
g_au8DbStrFadLut1:
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	g_au8DbStr_Delta_LutStrong, %object
	.size	g_au8DbStr_Delta_LutStrong, 17
g_au8DbStr_Delta_LutStrong:
	.byte	4
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	6
	.byte	4
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.space	3
	.type	g_au8RatIdxLut, %object
	.size	g_au8RatIdxLut, 16
g_au8RatIdxLut:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.type	g_au8DbStrFadLut1_4, %object
	.size	g_au8DbStrFadLut1_4, 12
g_au8DbStrFadLut1_4:
	.byte	4
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	g_au8DbStrFadLut2, %object
	.size	g_au8DbStrFadLut2, 12
g_au8DbStrFadLut2:
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	g_au8DbStrFadLut3, %object
	.size	g_au8DbStrFadLut3, 12
g_au8DbStrFadLut3:
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
	.byte	0
	.type	g_au8DbStr_Delta_LutUltraStrong, %object
	.size	g_au8DbStr_Delta_LutUltraStrong, 17
g_au8DbStr_Delta_LutUltraStrong:
	.byte	4
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.space	3
	.type	g_au16PixValAdjGain, %object
	.size	g_au16PixValAdjGain, 18
g_au16PixValAdjGain:
	.short	4
	.short	5
	.short	7
	.short	8
	.short	9
	.short	10
	.short	11
	.short	12
	.short	12
	.space	2
	.type	g_au16HFVarCore, %object
	.size	g_au16HFVarCore, 18
g_au16HFVarCore:
	.short	0
	.short	3
	.short	5
	.short	8
	.short	11
	.short	13
	.short	16
	.short	20
	.short	24
	.space	2
	.type	g_au16HFVarGain1, %object
	.size	g_au16HFVarGain1, 18
g_au16HFVarGain1:
	.short	4
	.short	3
	.short	3
	.short	2
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.space	2
	.type	g_au16HFVarGain2, %object
	.size	g_au16HFVarGain2, 18
g_au16HFVarGain2:
	.short	8
	.short	7
	.short	7
	.short	6
	.short	5
	.short	5
	.short	4
	.short	4
	.short	4
	.space	2
	.type	g_au16BordAdjGain, %object
	.size	g_au16BordAdjGain, 18
g_au16BordAdjGain:
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.space	2
	.type	g_au8GradSubRatio, %object
	.size	g_au8GradSubRatio, 9
g_au8GradSubRatio:
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	16
	.byte	8
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_u32DbDetUsingHyCounterBorder, %object
	.size	g_u32DbDetUsingHyCounterBorder, 4
g_u32DbDetUsingHyCounterBorder:
	.space	4
	.type	g_s8DbDetUsingSizeHy, %object
	.size	g_s8DbDetUsingSizeHy, 1
g_s8DbDetUsingSizeHy:
	.space	1
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
