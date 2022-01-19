#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"pq_mng_db_alg.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	DBD_Init
	.type	DBD_Init, %function
DBD_Init:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x22, x19
	add	x0, x20, 4
	mov	x2, 16384
	mov	w1, 0
	add	x21, x19, 4096
	add	x23, x21, 156
	bl	pq_alg_memset
	str	wzr, [x20]
	add	x3, x20, 16384
	mov	x2, 4096
	add	x24, x3, 5
	mov	w1, 0
	mov	x0, x24
	strb	wzr, [x3, 4]
	bl	pq_alg_memset
	str	x24, [x20, 20488]
	add	x0, x20, 20480
	mov	w1, 8
	mov	w2, 15
	mov	w3, 10
	strb	w1, [x0, 18]
	mov	w1, 4
	strb	w3, [x0, 16]
	strb	w2, [x0, 17]
	mov	w2, 6
	strb	w1, [x0, 21]
	mov	w1, 127
	strb	w2, [x0, 20]
	mov	x2, 4096
	strb	w1, [x0, 22]
	mov	w1, 0
	strb	wzr, [x0, 19]
	str	wzr, [x22], 4
	mov	x0, x22
	bl	pq_alg_memset
	str	x22, [x19, 4104]
	add	x0, x21, 16
	mov	x2, 128
	mov	w1, 0
	bl	pq_alg_memset
	str	wzr, [x19, 4240]
	strb	wzr, [x21, 148]
	mov	x0, x23
	strb	wzr, [x21, 149]
	mov	x2, 4096
	mov	w1, 0
	str	wzr, [x19, 4248]
	bl	pq_alg_memset
	str	x23, [x19, 8352]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	DBD_Init, .-DBD_Init
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DBF_Init
	.type	DBF_Init, %function
DBF_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	x0, x20
	strb	wzr, [x19, 8]
	stp	wzr, wzr, [x19]
	str	wzr, [x19, 12]
	mov	w1, 3
	strb	w1, [x19, 536]
	mov	x2, 4
	mov	w1, 0
	strb	wzr, [x0], 1
	bl	pq_alg_memset
	strb	wzr, [x20, 9]
	strb	wzr, [x20, 10]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DBF_Init, .-DBF_Init
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DB_Init
	.type	DB_Init, %function
DB_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	mov	x19, x4
	mov	x20, x3
	bl	_mcount
	mov	x1, x19
	mov	x0, x20
	add	x20, x20, 20480
	bl	DBD_Init
	add	x4, x19, 8192
	mov	w2, 3
	add	x19, x4, 168
	strb	w2, [x20, 560]
	strb	wzr, [x20, 32]
	add	x0, x4, 169
	stp	wzr, wzr, [x20, 24]
	str	wzr, [x20, 36]
	mov	x2, 4
	mov	w1, 0
	strb	wzr, [x4, 168]
	bl	pq_alg_memset
	strb	wzr, [x19, 9]
	strb	wzr, [x19, 10]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DB_Init, .-DB_Init
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DB_InitOutputReg
	.type	DB_InitOutputReg, %function
DB_InitOutputReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	x21, x1
	add	x19, x1, 524
	bl	_mcount
	add	x22, x23, 8192
	ldrh	w0, [x23]
	add	x1, x23, 12
	strh	w0, [x21]
	mov	x2, 512
	add	x0, x21, 12
	add	x20, x22, 532
	ldrh	w3, [x23, 2]
	strh	w3, [x21, 2]
	ldrh	w3, [x22, 524]
	strh	w3, [x21, 4]
	ldrh	w3, [x22, 526]
	strh	w3, [x21, 6]
	ldrh	w3, [x22, 528]
	strh	w3, [x21, 8]
	bl	pq_alg_memcpy
	ldrb	w0, [x22, 532]
	add	x1, x22, 542
	strb	w0, [x21, 524]
	mov	x2, 8
	add	x0, x21, 534
	ldrb	w3, [x20, 1]
	strb	w3, [x19, 1]
	ldrh	w3, [x20, 2]
	strh	w3, [x19, 2]
	ldr	w3, [x20, 4]
	str	w3, [x19, 4]
	ldrb	w3, [x20, 8]
	strb	w3, [x19, 8]
	ldrb	w3, [x20, 9]
	strb	w3, [x19, 9]
	bl	pq_alg_memcpy
	add	x1, x22, 550
	add	x0, x21, 542
	mov	x2, 16
	bl	pq_alg_memcpy
	ldrb	w0, [x20, 34]
	add	x1, x22, 571
	strb	w0, [x19, 34]
	mov	x2, 12
	add	x0, x21, 563
	ldrb	w3, [x20, 35]
	strb	w3, [x19, 35]
	ldrb	w3, [x20, 36]
	strb	w3, [x19, 36]
	ldrb	w3, [x20, 37]
	strb	w3, [x19, 37]
	ldrb	w3, [x20, 38]
	strb	w3, [x19, 38]
	bl	pq_alg_memcpy
	add	x0, x21, 575
	add	x1, x22, 583
	mov	x2, 17
	bl	pq_alg_memcpy
	ldrh	w0, [x20, 68]
	strh	w0, [x19, 68]
	mov	w0, 0
	ldrh	w1, [x20, 70]
	strh	w1, [x19, 70]
	ldrh	w1, [x20, 72]
	strh	w1, [x19, 72]
	ldrh	w1, [x20, 74]
	strh	w1, [x19, 74]
	ldrh	w1, [x20, 76]
	strh	w1, [x19, 76]
	ldrh	w1, [x20, 78]
	strh	w1, [x19, 78]
	ldrh	w1, [x20, 80]
	strh	w1, [x19, 80]
	ldrh	w1, [x20, 82]
	strh	w1, [x19, 82]
	ldrh	w1, [x20, 84]
	strh	w1, [x19, 84]
	ldrh	w1, [x20, 86]
	strh	w1, [x19, 86]
	ldrh	w1, [x20, 88]
	strh	w1, [x19, 88]
	ldrh	w1, [x20, 90]
	strh	w1, [x19, 90]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	DB_InitOutputReg, .-DB_InitOutputReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DB_UpdateCfg
	.type	DB_UpdateCfg, %function
DB_UpdateCfg:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	x23, x2
	mov	x27, x3
	mov	x24, x4
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L131
	cmp	x23, xzr
	ccmp	x27, xzr, 4, ne
	ccmp	x24, xzr, 4, ne
	beq	.L131
	mov	x1, x23
	mov	x0, x19
	add	x21, x27, 16384
	bl	DB_InitOutputReg
	ldr	w0, [x19, 8]
	strb	w0, [x21, 4]
	add	w0, w0, 1
	ldr	w1, [x19, 4]
	uxtb	w0, w0
	str	w1, [x27]
	cmp	w0, 64
	bhi	.L201
.L7:
	add	x22, x27, 4
	mov	x2, 16384
	mov	x0, x22
	mov	w1, 0
	bl	pq_alg_memset
	add	x6, x27, 4096
	add	x2, x19, 524
	mov	x0, x22
	add	x6, x6, 1668
	.p2align 2
.L8:
	add	x0, x0, 8
	ldr	w1, [x2], 4
	cmp	x0, x6
	and	w5, w1, 2047
	ubfx	x1, x1, 16, 11
	stp	w5, w1, [x0, -8]
	bne	.L8
	add	x25, x21, 5
	mov	x2, 2048
	mov	x0, x25
	mov	w1, 0
	add	x26, x19, 12
	bl	pq_alg_memset
	mov	x0, 0
	.p2align 2
.L10:
	lsr	w1, w0, 5
	cmp	w1, 127
	bhi	.L9
	ldr	w1, [x26, w1, uxtw 2]
	lsr	w1, w1, w0
	and	w1, w1, 1
	strb	w1, [x25, x0]
.L9:
	add	x0, x0, 1
	cmp	x0, 2048
	bne	.L10
	str	x25, [x27, 20488]
	mov	w2, 2160
	ldp	w0, w1, [x20, 8]
	cmp	w0, 4096
	ccmp	w1, w2, 2, ls
	bhi	.L202
	sub	w0, w0, #4
	cmp	w0, 3836
	bls	.L203
.L12:
	strh	wzr, [x23]
.L13:
	ldr	w1, [x23]
	mov	w0, 65537
	cmp	w1, w0
	beq	.L204
	add	x26, x24, 4096
	mov	w0, -1
	add	x25, x27, 20480
	strb	w0, [x26, 149]
	ldr	w0, [x20, 8]
.L30:
	ldr	w2, [x20, 12]
	mov	w1, 4096
	cmp	w2, 2160
	ccmp	w0, w1, 2, ls
	bhi	.L11
	ldrsb	w1, [x26, 149]
	cmp	w1, 8
	beq	.L205
	mov	w0, 90
	strh	w0, [x23, 4]
.L95:
	ldp	w0, w2, [x20, 8]
	mov	w1, 4096
	cmp	w2, 2160
	ccmp	w0, w1, 2, ls
	bhi	.L96
	cmp	w0, 720
	bhi	.L97
	mov	w0, 16
	strh	w0, [x23, 8]
.L96:
	add	x5, x23, 12
	mov	x2, 128
	mov	x0, x5
	mov	w1, 0
	mov	x20, x5
	add	x21, x26, 156
	bl	pq_alg_memset
	ldr	w0, [x23, 12]
	mov	x5, x20
	mov	x4, 0
	.p2align 2
.L99:
	ldrb	w3, [x21, x4]
	mov	w2, 1
	add	w1, w4, 1
	and	w3, w3, w2
	orr	w3, w3, w0
	str	w3, [x5]
	b	.L101
	.p2align 3
.L100:
	ldrb	w0, [x21, w1, uxtw]
	add	w1, w1, 1
	and	w0, w0, 1
	lsl	w0, w0, w2
	add	w2, w2, 1
	orr	w3, w3, w0
	cmp	w2, 32
	str	w3, [x5]
	beq	.L206
.L101:
	cmp	w1, 2047
	bls	.L100
.L11:
	ldr	w0, [x24, 4248]
	add	x22, x25, 24
	str	w0, [x25, 24]
	add	x21, x23, 524
	ldr	x20, .LC5
	mov	w7, 24
	ldrsb	w0, [x26, 149]
	mov	w6, 2
	str	w0, [x22, 4]
	mov	x2, 8
	ldr	x3, .LC6
	add	x1, x20, 264
	ldr	w4, [x24]
	add	x0, x23, 534
	str	w4, [x22, 12]
	add	x27, x23, 563
	add	x28, x23, 575
	add	x19, x19, 8192
	ldrb	w4, [x26, 149]
	ldr	w5, [x24, 4248]
	strb	w7, [x21, 8]
	strb	w6, [x21, 9]
	strb	w4, [x3, 4]
	str	w5, [x3]
	bl	pq_alg_memcpy
	mov	x2, 16
	add	x1, x20, 272
	add	x0, x23, 542
	bl	pq_alg_memcpy
	mov	x2, 12
	add	x1, x20, 16
	mov	x0, x27
	bl	pq_alg_memcpy
	mov	x0, x28
	mov	x2, 17
	add	x1, x20, 80
	bl	pq_alg_memcpy
	ldr	w0, [x22, 4]
	cmp	w0, 3
	ble	.L103
	ldrb	w1, [x19, 532]
	cmp	w1, 1
	beq	.L207
	.p2align 2
.L103:
	mov	w26, 0
	add	x22, x24, 8192
	str	wzr, [x23, 528]
.L117:
	mov	w0, 1
	strb	w0, [x19, 533]
	ldr	w19, [x25, 28]
	cmp	w19, 3
	ble	.L118
	ldr	w1, [x25, 24]
	cmp	w1, wzr
	bgt	.L208
.L118:
	strb	wzr, [x22, 178]
.L126:
	strh	wzr, [x21, 82]
	mov	w1, 8
	strh	wzr, [x21, 84]
	mov	w0, 2
	strh	w1, [x21, 86]
	strh	w0, [x21, 88]
	mov	w0, 0
	ldrb	w1, [x22, 178]
	strb	w1, [x21, 1]
	strb	w1, [x23, 524]
.L193:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L201:
	mov	w0, -1
	strb	w0, [x21, 4]
	b	.L7
.L203:
	sub	w1, w1, #1
	cmp	w1, 2159
	bls	.L13
	b	.L12
.L208:
	adds	w2, w19, 7
	add	w1, w19, 14
	csel	w1, w1, w2, mi
	strb	w0, [x22, 178]
	ubfx	x1, x1, 3, 8
	strb	w1, [x21, 34]
	strb	w1, [x21, 35]
	cmp	w1, 1
	beq	.L120
	cbz	w1, .L121
	cmp	w1, 2
	bne	.L209
	strb	w0, [x21, 37]
	add	x1, x20, 48
	mov	x2, 12
	mov	x0, x27
	bl	pq_alg_memcpy
	mov	w1, 8
.L123:
	add	w19, w19, w19, lsr 31
	ldrb	w2, [x21, 34]
	asr	w0, w19, 1
	cmp	w0, w1
	csel	w0, w0, w1, le
	cmp	w2, 1
	strb	w0, [x21, 38]
	mov	x2, 17
	bls	.L210
	add	x1, x20, 104
	mov	x0, x28
	bl	pq_alg_memcpy
.L125:
	add	x4, x20, 128
	add	x3, x20, 152
	add	x2, x20, 176
	add	x1, x20, 200
	add	x0, x20, 224
	add	x20, x20, 248
	ldrh	w5, [x4, w26, sxtw 1]
	ldrh	w4, [x3, w26, sxtw 1]
	ldrh	w3, [x2, w26, sxtw 1]
	ldrh	w2, [x1, w26, sxtw 1]
	ldrh	w1, [x0, w26, sxtw 1]
	ldrb	w0, [x20, w26, sxtw]
	strh	w5, [x21, 90]
	strh	w4, [x21, 74]
	strh	w3, [x21, 76]
	strh	w2, [x21, 78]
	strh	w1, [x21, 80]
	strb	w0, [x21, 8]
	strh	wzr, [x21, 68]
	strh	wzr, [x21, 70]
	strh	wzr, [x21, 72]
	b	.L126
	.p2align 3
.L206:
	add	x4, x4, 32
	add	x5, x5, 4
	cmp	x4, 1024
	beq	.L11
	ldr	w0, [x5]
	b	.L99
.L202:
	add	x25, x27, 20480
	add	x26, x24, 4096
	b	.L11
.L97:
	cmp	w0, 1920
	bhi	.L98
	mov	w0, 42
	strh	w0, [x23, 8]
	b	.L96
.L98:
	mov	w0, 63
	strh	w0, [x23, 8]
	b	.L96
.L120:
	add	x1, x20, 16
	mov	x0, x27
	strb	wzr, [x21, 37]
	mov	x2, 12
	bl	pq_alg_memcpy
	mov	w0, 4
	cmp	w19, 4
	strb	w0, [x21, 38]
	mov	w1, 4
	bne	.L123
	add	x1, x20, 32
	mov	x2, 12
	mov	x0, x27
	bl	pq_alg_memcpy
	ldrb	w1, [x21, 38]
	b	.L123
.L207:
	strh	w0, [x23, 526]
	mov	w4, 0
	ldr	w1, [x22, 12]
	str	w1, [x23, 528]
	cbz	w1, .L104
	ldr	w0, [x25, 24]
	lsl	w0, w0, 4
	sdiv	w0, w0, w1
	uxth	w4, w0
	cbz	w4, .L104
	cmp	w4, 15
	mov	w0, 15
	csel	w0, w4, w0, ls
	uxth	w4, w0
.L104:
	ldr	x7, .LC4
	add	x22, x24, 8192
	ldrb	w5, [x25, 560]
	add	x6, x22, 168
	ldp	x2, x3, [x7]
	ldrb	w1, [x22, 168]
	uxth	w0, w5
	stp	x2, x3, [x29, 112]
	ldp	x2, x3, [x7, 16]
	cmp	w1, w0
	stp	x2, x3, [x29, 128]
	bcc	.L105
	mov	w1, 0
	cbz	w0, .L107
	sub	w0, w0, #1
	add	x1, x22, 169
	uxth	x0, w0
	add	x0, x0, 8192
	add	x0, x0, 170
	add	x24, x24, x0
	mov	w0, 0
.L109:
	ldrb	w2, [x1], 1
	add	w0, w0, w2
	cmp	x1, x24
	uxth	w0, w0
	bne	.L109
	mov	w1, w0
.L107:
	cbz	w5, .L110
	mov	w0, w5
	sub	w3, w5, #1
.L111:
	sdiv	w1, w1, w0
	and	w0, w1, 65535
	cmp	w4, w1
	sub	w2, w4, w0
	sxtw	x2, w2
	eor	x1, x2, x2, asr 63
	sub	x1, x1, x2, asr 63
	add	x2, x29, 144
	add	x1, x2, x1, uxth 1
	ldrh	w1, [x1, -32]
	bls	.L112
	add	w0, w1, w0
	cmp	w0, w4
	csel	w0, w0, w4, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
	uxth	w4, w0
.L113:
	cmp	w3, wzr
	ble	.L114
	mov	w1, 0
	mov	w2, 0
	add	x5, x22, 168
.L115:
	add	w0, w2, 1
	add	x2, x5, x2, sxtw
	add	w1, w1, 1
	add	x0, x5, x0, sxtw
	uxth	w1, w1
	ldrb	w0, [x0, 1]
	strb	w0, [x2, 1]
	mov	w2, w1
	ldrb	w3, [x25, 560]
	sub	w3, w3, #1
	cmp	w1, w3
	blt	.L115
.L114:
	add	x3, x22, x3, sxtw
	strb	w4, [x3, 169]
.L108:
	mov	w0, 0
	cbz	w4, .L116
	mov	w0, 15
	cmp	w4, 15
	csel	w0, w4, w0, ls
	uxth	w0, w0
.L116:
	ldrb	w26, [x20, w0, sxtw]
	b	.L117
.L205:
	lsr	w0, w0, 3
	strh	w0, [x23, 4]
	b	.L95
.L204:
	ldr	w28, [x20, 8]
	add	x25, x27, 20480
	add	x26, x24, 4096
	cmp	w28, 4096
	bhi	.L11
	ldrb	w0, [x25, 16]
	ldr	w1, [x27]
	cmp	w1, w0
	bcs	.L15
	mov	w0, -1
	strb	w0, [x21, 4]
.L16:
	mov	w0, 100
	str	w0, [x27]
.L17:
	ldrb	w0, [x25, 18]
	add	x26, x24, 4096
	add	x1, x26, 16
	sub	w0, w0, #1
	sxtb	w0, w0
	cmp	w0, wzr
	ble	.L22
.L159:
	sbfiz	x2, x0, 3, 32
	sub	w0, w0, #1
	sub	x3, x2, #8
	add	x4, x1, x3
	sxtb	w0, w0
	ldrsb	w3, [x1, x3]
	strb	w3, [x1, x2]
	add	x2, x1, x2
	ldr	w3, [x4, 4]
	str	w3, [x2, 4]
	cbnz	w0, .L159
.L22:
	ldrsb	w0, [x21, 4]
	strb	w0, [x26, 16]
	ldr	w0, [x27]
	str	w0, [x24, 4116]
	ldr	w0, [x24, 4240]
	ldrb	w2, [x25, 18]
	cmp	w0, w2
	bcs	.L20
	add	w0, w0, 1
	str	w0, [x24, 4240]
	ldrb	w2, [x25, 18]
.L20:
	cmp	w0, w2
	beq	.L23
	ldrsb	w0, [x21, 4]
	ldrsb	w3, [x26, 149]
.L24:
	cmp	w3, w0
	bne	.L211
	add	w0, w3, 1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L212
	ldrb	w9, [x25, 22]
	cmp	w3, 8
	ldr	x21, [x27, 20488]
	str	wzr, [x24]
	beq	.L213
	sub	w2, w28, #3
	ldr	x0, [x24, 4104]
	cmp	w2, 4
	bls	.L135
	ldrb	w1, [x21, 4]
	cmp	w1, 1
	beq	.L135
	mov	w1, w2
	mov	w4, 4
	b	.L44
	.p2align 3
.L45:
	ldrb	w5, [x21, w4, sxtw]
	cmp	w5, 1
	beq	.L214
.L44:
	add	w4, w4, 1
	cmp	w2, w4
	bne	.L45
	mov	w5, w2
	b	.L42
	.p2align 3
.L131:
	mov	w0, -1
	b	.L193
.L105:
	add	x0, x6, x1, sxtw
	add	w1, w1, 1
	strb	w4, [x0, 1]
	strb	w1, [x22, 168]
	b	.L108
.L209:
	mov	w0, 2
	add	x1, x20, 64
	strb	w0, [x21, 37]
	mov	x2, 12
	mov	x0, x27
	bl	pq_alg_memcpy
	mov	w1, 12
	b	.L123
.L121:
	add	x1, x20, 16
	strb	wzr, [x21, 37]
	mov	x2, 12
	mov	x0, x27
	bl	pq_alg_memcpy
	mov	w1, 2
	b	.L123
.L110:
	mov	w0, 3
	mov	w3, 2
	strb	w0, [x25, 560]
	mov	w0, 3
	b	.L111
.L112:
	sub	w1, w0, w1
	cmp	w1, w0
	csel	w0, w1, w0, le
	cmp	w0, w4
	csel	w0, w0, w4, ge
	uxth	w4, w0
	b	.L113
.L210:
	add	x1, x20, 80
	mov	x0, x28
	bl	pq_alg_memcpy
	b	.L125
.L15:
	ldrb	w0, [x21, 4]
	add	w0, w0, 1
	uxtb	w0, w0
	cmp	w0, 1
	bhi	.L17
	b	.L16
	.p2align 3
.L211:
	ldr	x0, [x24, 4104]
	uxtw	x2, w28
	mov	w1, 0
	bl	pq_alg_memset
	strb	wzr, [x26, 148]
	ldr	w0, [x20, 8]
	b	.L30
.L23:
	cmp	w2, 1
	ldrsb	w3, [x21, 4]
	ble	.L132
	mov	w0, 1
	mov	w4, w0
	b	.L27
.L26:
	cmp	w0, w2
	bge	.L25
.L27:
	ldrsb	w5, [x1, 8]!
	add	w0, w0, 1
	cmp	w5, w3
	sxtb	w0, w0
	bne	.L26
	ldrb	w6, [x25, 17]
	add	w5, w4, 1
	ldr	w7, [x1, 4]
	cmp	w7, w6
	bcc	.L26
	uxtb	w4, w5
	b	.L26
.L132:
	mov	w4, 1
.L25:
	ldrb	w0, [x25, 20]
	cmp	w0, w4
	bhi	.L215
	strb	w3, [x26, 149]
	ldrsb	w0, [x21, 4]
	b	.L24
.L214:
	mov	w1, w4
	mov	w5, w4
.L42:
	sub	w4, w1, w3
	mov	w12, 1
	cmp	w4, 4
	ble	.L52
.L158:
	add	x8, x22, x4, sxtw 2
	mov	w6, 0
	mov	w10, 0
	mov	w7, 0
.L50:
	ldr	w11, [x8, -4]
	add	x8, x8, 4
	cmp	w11, w10
	bls	.L49
	mov	w6, w7
	mov	w10, w11
.L49:
	add	w7, w7, 1
	cmp	w7, 3
	bne	.L50
	sub	w4, w4, #1
	add	w4, w4, w6
	strb	w12, [x21, w4, sxtw]
	sub	w4, w4, w3
	cmp	w4, 4
	ldr	w6, [x24]
	add	w6, w6, 1
	str	w6, [x24]
	bgt	.L158
.L52:
	cmp	w2, wzr
	mov	w6, w2
	ble	.L48
	ldrb	w4, [x21, w2, sxtw]
	cmp	w4, 1
	bne	.L54
	b	.L48
	.p2align 3
.L55:
	ldrb	w4, [x21, w6, sxtw]
	cmp	w4, 1
	beq	.L48
.L54:
	subs	w6, w6, #1
	bne	.L55
.L48:
	add	w4, w3, w6
	mov	w13, 1
	cmp	w4, w2
	mov	w7, w4
	bcs	.L62
.L157:
	add	x4, x22, x4, sxtw 2
	mov	w8, 0
	mov	w11, 0
	mov	w10, 0
.L60:
	ldr	w12, [x4, -4]
	add	x4, x4, 4
	cmp	w12, w11
	bls	.L59
	mov	w8, w10
	mov	w11, w12
.L59:
	add	w10, w10, 1
	cmp	w10, 3
	bne	.L60
	sub	w7, w7, #1
	add	w7, w7, w8
	strb	w13, [x21, w7, sxtw]
	add	w7, w7, w3
	cmp	w7, w2
	mov	w4, w7
	ldr	w8, [x24]
	add	w8, w8, 1
	str	w8, [x24]
	bcc	.L157
.L62:
	cmp	w6, w5
	mov	w7, w5
	mov	w2, 0
	mov	w12, 1
	bcs	.L156
	b	.L58
	.p2align 3
.L65:
	add	w1, w1, 1
	cmp	w6, w1
	mov	w7, w1
	bcc	.L58
.L156:
	ldrb	w8, [x21, w1, sxtw]
	cmp	w8, 1
	bne	.L65
	ldr	w4, [x24]
	cmp	w7, w5
	ccmp	w3, wzr, 4, ne
	add	w4, w4, 1
	str	w4, [x24]
	beq	.L138
	sub	w10, w7, w2
	udiv	w10, w10, w3
	cmp	w10, 1
	bls	.L138
.L68:
	add	w2, w3, w2
	mov	w4, 0
	mov	w14, 0
	mov	w11, 0
	add	x13, x22, x2, uxtw 2
.L67:
	ldr	w15, [x13, -4]
	add	x13, x13, 4
	cmp	w15, w14
	bls	.L66
	mov	w4, w11
	mov	w14, w15
.L66:
	add	w11, w11, 1
	cmp	w11, 3
	bne	.L67
	sub	w2, w2, #1
	add	w8, w8, 1
	add	w2, w2, w4
	cmp	w10, w8
	strb	w12, [x21, w2, uxtw]
	ldr	w4, [x24]
	add	w4, w4, 1
	str	w4, [x24]
	bne	.L68
.L138:
	mov	w2, w7
	b	.L65
.L215:
	mov	w0, w3
	ldrsb	w3, [x26, 149]
	b	.L24
.L58:
	cmp	w28, 4
	bls	.L195
	sub	w2, w28, #5
	add	x1, x21, 4
	add	x2, x2, 4
	add	x2, x0, x2
	add	x0, x0, 3
.L74:
	ldrb	w4, [x1]
	cmp	w4, 1
	beq	.L216
	ldrsb	w4, [x0]
	cmp	w4, wzr
	sub	w4, w4, #1
	ble	.L73
.L194:
	strb	w4, [x0]
.L72:
	add	x0, x0, 1
	add	x1, x1, 1
	cmp	x2, x0
	bne	.L74
.L195:
	uxtw	x4, w28
.L40:
	cmp	w28, 4096
	bgt	.L76
	cmp	w28, wzr
	ble	.L77
	add	w2, w3, w3, lsr 31
	mov	x0, x21
	asr	w2, w2, 1
	mov	w1, 0
	b	.L81
	.p2align 3
.L78:
	add	w1, w1, 1
	add	x0, x0, 1
	cmp	w28, w1
	beq	.L77
.L81:
	ldrb	w5, [x0]
	cmp	w5, 1
	bne	.L78
	cmp	w2, w1
	blt	.L78
	strb	wzr, [x0]
	ldr	w0, [x24]
	sub	w0, w0, #1
	str	w0, [x24]
.L77:
	cmp	w28, 1
	ble	.L76
	add	w3, w3, w3, lsr 31
	mov	w0, 1
	asr	w2, w3, 1
	b	.L83
	.p2align 3
.L82:
	add	w0, w0, 1
	cmp	w28, w0
	beq	.L76
.L83:
	sub	w1, w28, w0
	sxtw	x1, w1
	add	x3, x21, x1
	ldrb	w1, [x21, x1]
	cmp	w1, 1
	bne	.L82
	cmp	w2, w0
	blt	.L82
	strb	wzr, [x3]
	ldr	w0, [x24]
	sub	w0, w0, #1
	str	w0, [x24]
.L76:
	ldr	x0, [x24, 8352]
	mov	x2, x4
	ldr	x1, [x27, 20488]
	bl	pq_alg_memcpy
	ldrsb	w0, [x26, 149]
	cmp	w0, 8
	beq	.L85
	ldrb	w0, [x26, 148]
	ldrb	w1, [x25, 21]
	cmp	w1, w0
	bhi	.L217
	cmp	w28, 4
	bls	.L85
	mov	x0, 5
	mov	w9, 1
.L93:
	sub	x2, x0, #1
	ldr	x4, [x24, 8352]
	ldrb	w8, [x4, x2]
	cmp	w8, 1
	beq	.L218
.L196:
	mov	w1, w0
.L89:
	cmp	w28, w1
	add	x0, x0, 1
	bhi	.L93
.L85:
	ldr	w0, [x27]
	str	w0, [x24, 4248]
	ldr	w0, [x20, 8]
	b	.L30
.L218:
	ldr	x1, [x24, 4104]
	ldrb	w6, [x25, 21]
	ldrsb	w3, [x1, x2]
	cmp	w3, w6
	bge	.L196
	sub	x7, x0, #2
	ldrsb	w3, [x1, x0]
	ldrsb	w5, [x1, x7]
	cmp	w6, w5
	bgt	.L91
	cmp	w5, w3
	mov	w1, w0
	blt	.L92
	strb	w8, [x4, x7]
	ldr	x3, [x24, 8352]
	strb	wzr, [x3, x2]
	b	.L89
	.p2align 3
.L73:
	strb	wzr, [x0]
	b	.L72
.L216:
	strb	wzr, [x1]
	strb	w4, [x1, -1]
	ldrsb	w4, [x0]
	cmp	w4, w9
	add	w4, w4, 1
	blt	.L194
	strb	w9, [x0]
	b	.L72
.L217:
	add	w0, w0, 1
	strb	w0, [x26, 148]
	b	.L85
.L91:
	mov	w1, w0
.L92:
	cmp	w6, w3
	ccmp	w5, w3, 0, le
	bge	.L89
	strb	w9, [x4, x0]
	ldr	x3, [x24, 8352]
	strb	wzr, [x3, x2]
	b	.L89
.L135:
	mov	w5, 4
	mov	w1, w5
	b	.L42
.L213:
	sub	w4, w28, #3
	stp	xzr, xzr, [x29, 112]
	stp	xzr, xzr, [x29, 128]
	cmp	w4, 4
	bls	.L133
	mov	w0, 4
	b	.L35
	.p2align 3
.L34:
	add	w0, w0, 1
	cmp	w0, w4
	beq	.L219
.L35:
	ldrb	w1, [x21, w0, sxtw]
	cmp	w1, 1
	bne	.L34
	add	x2, x29, 144
	ubfiz	x1, x0, 2, 3
	add	x1, x2, x1
	ldr	w2, [x1, -32]
	add	w2, w2, 1
	str	w2, [x1, -32]
	b	.L34
.L212:
	uxtw	x28, w28
	ldr	x0, [x24, 8352]
	mov	x2, x28
	mov	w1, 0
	bl	pq_alg_memset
	str	wzr, [x24, 4248]
	mov	w0, -1
	strb	w0, [x26, 149]
	mov	x2, x28
	mov	w1, 0
	ldr	x0, [x24, 4104]
	bl	pq_alg_memset
	strb	wzr, [x26, 148]
	str	wzr, [x24]
	ldr	w0, [x20, 8]
	b	.L30
.L219:
	ldr	w0, [x29, 112]
.L33:
	mov	x1, 0
	mov	w22, 0
	mov	w2, 0
	b	.L127
	.p2align 3
.L37:
	ldr	w0, [x4, x1, lsl 2]
.L127:
	cmp	w2, w0
	add	x4, x29, 112
	bcs	.L36
	mov	w22, w1
	mov	w2, w0
.L36:
	add	x1, x1, 1
	cmp	x1, 8
	bne	.L37
	uxtw	x4, w28
	mov	w1, 0
	mov	x2, x4
	mov	x0, x21
	str	w3, [x29, 100]
	str	x4, [x29, 104]
	bl	pq_alg_memset
	ldr	w3, [x29, 100]
	ldr	x4, [x29, 104]
	cbz	w22, .L38
	sub	w0, w22, #1
	mov	w1, 1
	strb	w1, [x21, x0]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L38:
	add	w0, w22, 7
	mov	w2, 1
	cmp	w28, w0
	bls	.L40
.L155:
	strb	w2, [x21, w0, sxtw]
	add	w0, w0, 8
	cmp	w28, w0
	ldr	w1, [x24]
	add	w1, w1, 1
	str	w1, [x24]
	bhi	.L155
	b	.L40
.L133:
	mov	w0, 0
	b	.L33
	.size	DB_UpdateCfg, .-DB_UpdateCfg
	.align	3
.LC4:
	.xword	.LANCHOR0
	.align	3
.LC5:
	.xword	.LANCHOR1
	.align	3
.LC6:
	.xword	.LANCHOR2
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
	.align	3
.LANCHOR0 = . + 0
.LC0:
	.hword	0
	.hword	1
	.hword	1
	.hword	1
	.hword	1
	.hword	1
	.hword	1
	.hword	1
	.hword	1
	.hword	2
	.hword	2
	.hword	2
	.hword	2
	.hword	2
	.hword	2
	.hword	2
	.data
	.align	3
.LANCHOR1 = . + 0
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
	.zero	4
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
	.zero	4
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
	.zero	4
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
	.zero	4
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
	.zero	7
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
	.zero	7
	.type	g_au16PixValAdjGain, %object
	.size	g_au16PixValAdjGain, 18
g_au16PixValAdjGain:
	.hword	4
	.hword	5
	.hword	7
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	12
	.zero	6
	.type	g_au16HFVarCore, %object
	.size	g_au16HFVarCore, 18
g_au16HFVarCore:
	.hword	0
	.hword	3
	.hword	5
	.hword	8
	.hword	11
	.hword	13
	.hword	16
	.hword	20
	.hword	24
	.zero	6
	.type	g_au16HFVarGain1, %object
	.size	g_au16HFVarGain1, 18
g_au16HFVarGain1:
	.hword	4
	.hword	3
	.hword	3
	.hword	2
	.hword	1
	.hword	1
	.hword	0
	.hword	0
	.hword	0
	.zero	6
	.type	g_au16HFVarGain2, %object
	.size	g_au16HFVarGain2, 18
g_au16HFVarGain2:
	.hword	8
	.hword	7
	.hword	7
	.hword	6
	.hword	5
	.hword	5
	.hword	4
	.hword	4
	.hword	4
	.zero	6
	.type	g_au16BordAdjGain, %object
	.size	g_au16BordAdjGain, 18
g_au16BordAdjGain:
	.hword	7
	.hword	7
	.hword	7
	.hword	7
	.hword	7
	.hword	7
	.hword	7
	.hword	7
	.hword	7
	.zero	6
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
	.zero	7
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
	.bss
	.align	2
.LANCHOR2 = . + 0
	.type	g_u32DbDetUsingHyCounterBorder, %object
	.size	g_u32DbDetUsingHyCounterBorder, 4
g_u32DbDetUsingHyCounterBorder:
	.zero	4
	.type	g_s8DbDetUsingSizeHy, %object
	.size	g_s8DbDetUsingSizeHy, 1
g_s8DbDetUsingSizeHy:
	.zero	1
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
