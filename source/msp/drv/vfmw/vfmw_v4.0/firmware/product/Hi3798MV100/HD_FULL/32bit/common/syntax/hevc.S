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
	bls	.L3
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L3:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsSliceUnit, .-HEVC_IsSliceUnit
	.align	2
	.type	HEVC_IsNewPic, %function
HEVC_IsNewPic:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r2, [r0, #2316]
	ldr	r1, [r0, #200]
	ldr	r3, [r2, #16]
	cmn	r1, #-2147483647
	sub	ip, r3, #16
	beq	.L37
	cmp	r3, #21
	cmpne	ip, #2
	addls	ip, r0, #40960
	ldrls	lr, [ip, #2624]
	bls	.L11
.L19:
	sub	r3, r3, #19
	add	ip, r0, #40960
	cmp	r3, #1
	movls	r1, #-2147483647
	strls	r1, [r0, #200]
	ldr	lr, [ip, #2624]
.L11:
	cmp	lr, r1
	bge	.L9
	ldr	r4, [r2, #16]
	sub	r3, r4, #8
	cmp	r3, #1
	bls	.L38
.L12:
	ldrb	r1, [r0, #7]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L13
	ldr	r4, [r0, #204]
	cmp	lr, r4
	bge	.L13
	ldr	r5, [r2, #16]
	sub	r3, r5, #8
	cmp	r3, #1
	bls	.L39
.L13:
	ldrb	r3, [ip, #2579]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L14
	ldr	r2, [r2, #16]
	sub	r1, r2, #19
	cmp	r1, #1
	bls	.L34
	cmp	r2, #21
	beq	.L34
	sub	r2, r2, #16
	cmp	r2, #2
	strls	lr, [r0, #204]
	movls	r3, #1
	strlsb	r3, [r0, #7]
.L14:
	ldr	r2, [r0, #216]
	ldrb	r3, [ip, #2577]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r1, [ip, #2652]
	bne	.L40
	ldr	r2, [r0, #272]
	cmp	r2, r1
	movne	r0, #1
	beq	.L41
.L32:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L37:
	cmp	ip, #5
	bhi	.L35
	cmp	r3, #21
	cmpne	ip, #2
	bhi	.L19
	add	ip, r0, #40960
	ldr	lr, [ip, #2624]
	str	lr, [r0, #200]
.L9:
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L12
	ldr	r4, [r2, #16]
	sub	r3, r4, #8
	cmp	r3, #1
	bhi	.L12
	ldr	r2, .L42
	movw	r3, #4548
	str	r1, [sp, #4]
	mov	r0, #1
	str	r4, [sp, #8]
	str	lr, [sp]
	ldr	r1, .L42+4
	ldr	r4, [r2, #68]
	ldr	r2, .L42+8
	blx	r4
	mov	r0, #2
	b	.L32
.L40:
	add	r2, r2, #14080
	ldr	r1, [ip, #2652]
	add	r2, r2, #45
	ldr	r2, [r0, r2, asl #2]
	cmp	r1, r2
	ldr	r2, [r0, #272]
	movne	r3, #1
	cmp	r2, r1
	movne	r0, #1
	bne	.L32
	b	.L41
.L39:
	ldr	r2, .L42
	movw	r3, #4558
	stmia	sp, {r1, lr}
	mov	r0, #1
	str	r5, [sp, #12]
	str	r4, [sp, #8]
	ldr	r1, .L42+12
	ldr	r4, [r2, #68]
	ldr	r2, .L42+8
	blx	r4
.L35:
	mov	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L41:
	ldr	r0, [r0, #252]
	cmp	r0, lr
	moveq	r0, r3
	movne	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L38:
	ldr	r2, .L42
	movw	r3, #4540
	str	r1, [sp, #4]
	mov	r0, #1
	str	r4, [sp, #8]
	str	lr, [sp]
	ldr	r1, .L42+16
	ldr	r4, [r2, #68]
	ldr	r2, .L42+8
	blx	r4
	mov	r0, #2
	b	.L32
.L34:
	str	lr, [r0, #204]
	strb	r3, [r0, #7]
	b	.L14
.L43:
	.align	2
.L42:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	.word	.LANCHOR0
	.word	.LC4
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVC_IsNewPic, .-HEVC_IsNewPic
	.align	2
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
	ldr	r1, [r0, #964]
	ldr	r3, [r0, #996]
	ldrb	ip, [lr, #564]	@ zero_extendqisi2
	ldrb	r4, [r0, #980]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #972]
	ldr	r3, [r0, #1004]
	ldrb	ip, [r0, #956]	@ zero_extendqisi2
	ldrb	r4, [r0, #988]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #964]
	ldrb	r4, [lr, #565]	@ zero_extendqisi2
	ldrb	r3, [r0, #997]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #981]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #972]
	ldrb	r4, [r0, #957]	@ zero_extendqisi2
	ldrb	r3, [r0, #1005]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #989]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #980]
	ldrb	r4, [lr, #566]	@ zero_extendqisi2
	ldrb	r3, [r0, #998]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #966]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #988]
	ldrb	r4, [r0, #958]	@ zero_extendqisi2
	ldrb	r3, [r0, #1006]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #974]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #996]
	ldrb	lr, [lr, #567]	@ zero_extendqisi2
	ldrb	r3, [r0, #983]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #967]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1004]
	ldrb	lr, [r0, #959]	@ zero_extendqisi2
	ldrb	r3, [r0, #991]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #975]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #968]
	ldr	r3, [r0, #1000]
	ldrb	ip, [r0, #952]	@ zero_extendqisi2
	ldrb	lr, [r0, #984]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #976]
	ldr	r3, [r0, #1008]
	ldrb	ip, [r0, #960]	@ zero_extendqisi2
	ldrb	lr, [r0, #992]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #968]
	ldrb	lr, [r0, #953]	@ zero_extendqisi2
	ldrb	r3, [r0, #1001]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #985]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #976]
	ldrb	lr, [r0, #961]	@ zero_extendqisi2
	ldrb	r3, [r0, #1009]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #993]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #984]
	ldrb	lr, [r0, #954]	@ zero_extendqisi2
	ldrb	r3, [r0, #1002]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #970]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #992]
	ldrb	lr, [r0, #962]	@ zero_extendqisi2
	ldrb	r3, [r0, #1010]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #978]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1000]
	ldrb	lr, [r0, #955]	@ zero_extendqisi2
	ldrb	r3, [r0, #987]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #971]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1008]
	ldrb	ip, [r0, #963]	@ zero_extendqisi2
	ldrb	r3, [r0, #995]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #979]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_8x8, .-HEVC_WriteQmatrix_8x8
	.align	2
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
	ldr	r1, [r0, #1340]
	ldr	r3, [r0, #1356]
	ldrb	ip, [lr, #564]	@ zero_extendqisi2
	ldrb	r4, [r0, #1348]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1372]
	ldr	r3, [r0, #1388]
	ldrb	ip, [r0, #1364]	@ zero_extendqisi2
	ldrb	r4, [r0, #1380]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1340]
	ldrb	r4, [lr, #565]	@ zero_extendqisi2
	ldrb	r3, [r0, #1357]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1349]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1372]
	ldrb	r4, [r0, #1365]	@ zero_extendqisi2
	ldrb	r3, [r0, #1389]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1381]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1348]
	ldrb	r4, [lr, #566]	@ zero_extendqisi2
	ldrb	r3, [r0, #1358]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1342]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1380]
	ldrb	r4, [r0, #1366]	@ zero_extendqisi2
	ldrb	r3, [r0, #1390]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1374]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1356]
	ldrb	lr, [lr, #567]	@ zero_extendqisi2
	ldrb	r3, [r0, #1351]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1343]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1388]
	ldrb	lr, [r0, #1367]	@ zero_extendqisi2
	ldrb	r3, [r0, #1383]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1375]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1344]
	ldr	r3, [r0, #1360]
	ldrb	ip, [r0, #1336]	@ zero_extendqisi2
	ldrb	lr, [r0, #1352]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1376]
	ldr	r3, [r0, #1392]
	ldrb	ip, [r0, #1368]	@ zero_extendqisi2
	ldrb	lr, [r0, #1384]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1344]
	ldrb	lr, [r0, #1337]	@ zero_extendqisi2
	ldrb	r3, [r0, #1361]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1353]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1376]
	ldrb	lr, [r0, #1369]	@ zero_extendqisi2
	ldrb	r3, [r0, #1393]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1385]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1352]
	ldrb	lr, [r0, #1338]	@ zero_extendqisi2
	ldrb	r3, [r0, #1362]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1346]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldr	r1, [r0, #1384]
	ldrb	lr, [r0, #1370]	@ zero_extendqisi2
	ldrb	r3, [r0, #1394]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1378]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1360]
	ldrb	lr, [r0, #1339]	@ zero_extendqisi2
	ldrb	r3, [r0, #1355]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1347]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1392]
	ldrb	ip, [r0, #1371]	@ zero_extendqisi2
	ldrb	r3, [r0, #1387]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1379]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_16x16, .-HEVC_WriteQmatrix_16x16
	.align	2
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
	blt	.L48
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L48:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.align	2
	.type	HEVC_GetMinPOC, %function
HEVC_GetMinPOC:
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
	mov	r8, r2
	mvn	r3, #-2147483648
	mov	r2, #0
	str	r2, [r8]
	str	r3, [r1]
	mov	r6, r1
	ldr	r2, [r0, #2492]
	mov	r7, r0
	ldr	r3, [r0, #2488]
	cmp	r2, r3
	bhi	.L56
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L58:
	add	r5, r7, #2496
	ldr	r9, .L59
	add	r5, r5, #12
	mov	r4, #0
	b	.L53
.L52:
	ldr	r3, [r7, #2492]
	add	r4, r4, #1
	cmp	r3, r4
	bls	.L57
.L53:
	ldr	r3, [r5, #4]!
	ldr	r2, [r6]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	ble	.L52
	ldr	r3, [r9, #112]
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	str	r3, [r6]
	str	r4, [r8]
	add	r4, r4, #1
	ldr	r3, [r7, #2492]
	cmp	r3, r4
	bhi	.L53
.L57:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L56:
	ldr	ip, .L59
	mov	r0, #1
	ldr	r1, .L59+4
	ldr	r4, [ip, #68]
	blx	r4
	ldr	r2, [r7, #2488]
	cmp	r2, #0
	str	r2, [r7, #2492]
	bne	.L58
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L60:
	.align	2
.L59:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC5
	UNWIND(.fnend)
	.size	HEVC_GetMinPOC, .-HEVC_GetMinPOC
	.align	2
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
	ldr	r7, [lr, #276]
	add	r3, r3, r2
	cmp	r7, #64
	mov	r6, r3, asl #4
	movcs	r7, #64
	mov	r8, r7, lsr #2
.L62:
	cmp	r5, r8
	ldmcsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r7, #0
	beq	.L62
	add	r3, r5, r6
	ldrb	ip, [r1]	@ zero_extendqisi2
	mov	r4, r1
	mov	r2, #0
	add	r3, r0, r3, lsl #2
	ldr	lr, [r3, #564]
	orr	ip, lr, ip
	str	ip, [r3, #564]
.L68:
	add	r2, r2, #1
	add	r3, r5, r6
	and	lr, r2, #3
	cmp	r2, r7
	add	r3, r0, r3, lsl #2
	mov	ip, lr, asl #3
	beq	.L62
	ldrb	r9, [r4, #1]!	@ zero_extendqisi2
	cmp	lr, #3
	ldr	lr, [r3, #564]
	addeq	r5, r5, #1
	orr	ip, lr, r9, asl ip
	str	ip, [r3, #564]
	b	.L68
	UNWIND(.fnend)
	.size	HEVC_CalScalingList, .-HEVC_CalScalingList
	.align	2
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
	ldr	r10, .L85
	mov	r7, r0
	ldr	r1, .L85+4
	mov	r0, #1
	ldr	r3, [r10, #68]
	blx	r3
	ldr	r1, [r7, #2504]
	ldr	lr, [r7, #2500]
	mov	r0, #1
	ldr	ip, [r7, #2508]
	ldr	r3, [r7, #2492]
	ldr	r4, [r10, #68]
	ldr	r2, [r7, #2488]
	stmia	sp, {r1, ip, lr}
	ldr	r1, .L85+8
	blx	r4
	ldr	r3, [r7, #2492]
	cmp	r3, #0
	addne	r4, r7, #2496
	movne	r5, #0
	addne	r4, r4, #12
	beq	.L74
.L73:
	ldr	r3, [r4, #4]!
	ldr	r2, [r10, #68]
	ldr	r0, [r7, #244]
	ldrb	lr, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #12]
	ldr	r6, [r3, #4]
	ldrb	r8, [r3, #1]	@ zero_extendqisi2
	str	r2, [fp, #-48]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	ldr	r1, [r3, #32]
	str	lr, [fp, #-52]
	str	r2, [fp, #-64]
	str	ip, [fp, #-68]
	ldr	r9, [r3, #52]
	str	r6, [fp, #-56]
	str	r8, [fp, #-60]
	bl	FSP_GetLogicFs
	ldr	r3, [r4]
	ldr	r1, [r3, #32]
	mov	r6, r0
	ldr	r0, [r7, #244]
	bl	FSP_GetRef
	ldr	r3, [r4]
	ldr	r1, [r3, #32]
	mov	r8, r0
	ldr	r0, [r7, #244]
	bl	FSP_GetDisplay
	ldr	r1, [r4]
	ldr	lr, [fp, #-52]
	mov	r2, r5
	add	r5, r5, #1
	ldr	ip, [r1, #268]
	mov	r3, r1
	str	ip, [sp, #40]
	ldr	r1, [r1, #32]
	ldr	ip, [fp, #-68]
	str	r9, [sp, #20]
	str	r1, [sp, #36]
	ldr	r1, [fp, #-64]
	ldr	r9, [fp, #-60]
	str	ip, [sp, #16]
	str	r1, [sp, #12]
	ldr	r1, [fp, #-56]
	str	r9, [sp, #8]
	str	lr, [sp]
	str	r1, [sp, #4]
	str	r8, [sp, #28]
	str	r6, [sp, #24]
	ldr	r1, .L85+12
	ldr	ip, [fp, #-48]
	str	r0, [sp, #32]
	mov	r0, #1
	blx	ip
	ldr	r3, [r7, #2492]
	cmp	r3, r5
	bhi	.L73
.L74:
	ldr	r3, [r10, #68]
	mov	r0, #1
	ldr	r1, .L85+16
	blx	r3
	ldr	r3, [r7, #2492]
	cmp	r3, #0
	beq	.L72
	add	r5, r7, #2496
	ldr	r9, .L85
	add	r5, r5, #12
	mov	r6, #0
	b	.L81
.L84:
	blx	r3
	ldr	r3, [r9, #68]
	ldr	r2, [r4, #512]
	mov	r0, #1
	ldr	r1, .L85+20
	blx	r3
	ldr	r3, [r9, #68]
	ldrsb	r2, [r4]
	mov	r0, #1
	ldr	r1, .L85+24
	blx	r3
	ldrsb	r2, [r4, #1]
	ldr	r3, [r9, #68]
	mov	r0, #1
	ldr	r1, .L85+28
	blx	r3
.L76:
	cmp	r8, #0
	ldr	r3, [r10, #68]
	mov	r2, r8
	ldr	r1, .L85+32
	mov	r0, #1
	beq	.L77
	blx	r3
	ldr	r2, [r8, #56]
	ldr	r3, [r10, #68]
	mov	r0, #1
	ldr	r1, .L85+36
	blx	r3
.L78:
	ldr	r4, [fp, #-48]
	mov	r0, #1
	ldr	r1, .L85+40
	cmp	r4, #0
	ldr	r3, [r10, #68]
	mov	r2, r4
	beq	.L79
	blx	r3
	ldr	r2, [r4, #56]
	ldr	r3, [r10, #68]
	mov	r0, #1
	ldr	r1, .L85+44
	blx	r3
.L80:
	ldr	r3, [r10, #68]
	mov	r0, #1
	ldr	r1, .L85+16
	add	r6, r6, r0
	blx	r3
	ldr	r3, [r7, #2492]
	cmp	r3, r6
	bls	.L72
.L81:
	ldr	r3, [r5, #4]!
	ldr	r0, [r7, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	ldr	r3, [r5]
	ldr	r1, [r3, #32]
	mov	r4, r0
	ldr	r0, [r7, #244]
	bl	FSP_GetDecPhyFs
	ldr	r3, [r5]
	ldr	r1, [r3, #32]
	mov	r8, r0
	ldr	r0, [r7, #244]
	bl	FSP_GetDispPhyFs
	ldr	r3, [r10, #68]
	mov	r2, r6
	ldr	r1, .L85+48
	str	r0, [fp, #-48]
	mov	r0, #1
	blx	r3
	cmp	r4, #0
	mov	r2, r4
	ldr	r1, .L85+52
	mov	r0, #1
	ldr	r3, [r9, #68]
	bne	.L84
	ldr	r1, .L85+56
	mov	r0, #1
	blx	r3
	b	.L76
.L79:
	ldr	r1, .L85+60
	mov	r0, #1
	blx	r3
	b	.L80
.L77:
	ldr	r1, .L85+64
	mov	r0, #1
	blx	r3
	b	.L78
.L72:
	ldr	r3, [r10, #68]
	mov	r0, #1
	ldr	r1, .L85+68
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L86:
	.align	2
.L85:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC7
	.word	.LC9
	.word	.LC8
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC17
	.word	.LC18
	.word	.LC20
	.word	.LC21
	.word	.LC11
	.word	.LC12
	.word	.LC16
	.word	.LC22
	.word	.LC19
	.word	.LC10
	UNWIND(.fnend)
	.size	HEVC_PrintDPBState, .-HEVC_PrintDPBState
	.align	2
	.type	HEVC_SetFrmRepeatCount.isra.11.part.12, %function
HEVC_SetFrmRepeatCount.isra.11.part.12:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, [r0, #260]
	ldr	r2, [r0, #2488]
	ldr	r3, [r0, #256]
	add	r2, r2, ip
	add	ip, r2, #1
	cmp	r3, ip
	movcc	r3, #0
	strcc	r3, [r1]
	ldmccfd	sp, {fp, sp, pc}
	sub	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movhi	r3, #2
	movls	r3, #1
	strhi	r3, [r1]
	strls	r3, [r1]
	ldrhi	r3, [r0, #260]
	ldrls	r3, [r0, #260]
	addhi	r3, r3, #2
	addls	r3, r3, #1
	str	r3, [r0, #260]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount.isra.11.part.12, .-HEVC_SetFrmRepeatCount.isra.11.part.12
	.align	2
	.type	HEVC_Sei_User_Data_Unregistered.isra.14, %function
HEVC_Sei_User_Data_Unregistered.isra.14:
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
	cmp	r2, #15
	mov	r8, r2
	mov	r5, r0
	mov	r7, r1
	addhi	r4, r1, #3
	addhi	r6, r1, #19
	bls	.L99
.L94:
	mov	r1, #8
	ldr	r0, [r5]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r6
	bne	.L94
	sub	r0, r8, #16
	str	r0, [r7, #20]
	cmp	r0, #0
	movne	r4, #0
	beq	.L100
.L96:
	mov	r1, #8
	ldr	r0, [r5]
	bl	BsGet
	ldr	r3, [r7, #20]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L96
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L100:
	str	r0, [r7]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L99:
	ldr	r3, .L101
	mov	r0, #1
	ldr	r1, .L101+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L102:
	.align	2
.L101:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC23
	UNWIND(.fnend)
	.size	HEVC_Sei_User_Data_Unregistered.isra.14, .-HEVC_Sei_User_Data_Unregistered.isra.14
	.align	2
	.type	HEVC_ue_v.isra.18, %function
HEVC_ue_v.isra.18:
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
	bls	.L106
	ldr	ip, .L107
	movw	r3, #61166
	mov	r2, r0
	movt	r3, 65535
	ldr	r1, .L107+4
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	movw	r0, #61166
	movt	r0, 65535
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L106:
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
.L108:
	.align	2
.L107:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC24
	UNWIND(.fnend)
	.size	HEVC_ue_v.isra.18, .-HEVC_ue_v.isra.18
	.align	2
	.type	HEVC_DecShortTermRefPicSet.isra.19, %function
HEVC_DecShortTermRefPicSet.isra.19:
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
	mov	r10, r1
	mov	r4, r2
	streq	r6, [r2]
	bne	.L152
.L112:
	ldr	r0, [r5]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #16
	str	r0, [r4, #16]
	bhi	.L153
	ldr	r0, [r5]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #16
	str	r0, [r4, #20]
	bhi	.L154
	ldr	r6, [r4, #16]
	add	r2, r0, r6
	str	r2, [r4, #24]
	cmp	r2, #16
	bhi	.L137
	cmp	r6, #0
	addne	r10, r4, #68
	addne	r9, r4, #52
	movne	r7, #0
	movne	r8, r7
	bne	.L141
	b	.L139
.L140:
	str	r8, [r10, #4]!
	ldr	r0, [r5]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r6, [r4, #16]
	cmp	r7, r6
	bcs	.L155
.L141:
	ldr	r0, [r5]
	add	r7, r7, #1
	bl	HEVC_ue_v.isra.18
	mov	r1, #1
	cmp	r0, #32768
	mvn	r3, r0
	add	r8, r8, r3
	bcc	.L140
	ldr	r3, .L161
	mov	r2, r0
	ldr	r1, .L161+4
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L152:
	mov	r1, #1
	ldr	r0, [r0]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4]
	beq	.L112
	ldr	r3, [r10, #228]
	cmp	r6, r3
	subne	r6, r6, #1
	movne	r3, #0
	strne	r3, [r4, #4]
	beq	.L156
.L116:
	mov	r1, #1
	ldr	r0, [r5]
	bl	BsGet
	mov	r9, #204
	mul	r9, r9, r6
	str	r0, [r4, #8]
	ldr	r0, [r5]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #8]
	add	r2, r10, r9
	mov	r3, r3, asl #1
	rsb	r3, r3, #1
	add	r0, r0, #1
	str	r0, [r4, #12]
	ldr	r2, [r2, #2756]
	mul	r3, r3, r0
	cmp	r2, #16
	str	r3, [fp, #-60]
	bhi	.L157
	add	r6, r9, #2800
	mov	r3, #0
	add	r6, r6, #4
	mov	r2, r9
	add	r8, r4, #35
	str	r4, [fp, #-56]
	str	r3, [fp, #-48]
	add	r6, r10, r6
	str	r3, [fp, #-52]
	mov	r7, r3
	mov	r4, r3
	mov	r9, r2
	b	.L124
.L119:
	sub	r3, r0, #1
	cmp	r3, #1
	bls	.L158
.L120:
	add	r3, r10, r9
	strb	r0, [r8, #1]!
	add	r4, r4, #1
	add	r6, r6, #4
	ldr	r3, [r3, #2756]
	cmp	r4, r3
	bhi	.L159
.L124:
	mov	r1, #1
	ldr	r0, [r5]
	bl	BsGet
	cmp	r0, #0
	bne	.L119
	mov	r1, #1
	ldr	r0, [r5]
	bl	BsGet
	mov	r0, r0, asl #1
	sub	r3, r0, #1
	cmp	r3, #1
	bhi	.L120
.L158:
	add	r3, r10, r9
	ldr	r2, [fp, #-60]
	add	r1, r7, #18
	sub	ip, r0, #1
	ldr	r3, [r3, #2756]
	clz	ip, ip
	cmp	r3, r4
	mov	ip, ip, lsr #5
	ldrhi	r3, [r6]
	movls	r3, #0
	add	r3, r2, r3
	ldr	r2, [fp, #-56]
	cmp	r3, #0
	str	r3, [r2, r1, asl #2]
	add	r3, r2, r7
	add	r7, r7, #1
	strb	ip, [r3, #53]
	ldrlt	r3, [fp, #-52]
	ldrge	r3, [fp, #-48]
	addlt	r3, r3, #1
	addge	r3, r3, #1
	strlt	r3, [fp, #-52]
	strge	r3, [fp, #-48]
	b	.L120
.L159:
	ldr	r4, [fp, #-56]
	add	r3, r3, #1
	ldr	r2, [fp, #-48]
	cmp	r7, #16
	str	r3, [r4, #28]
	ldr	r3, [fp, #-52]
	str	r7, [r4, #24]
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	bhi	.L125
	cmp	r3, #16
	bhi	.L125
	cmp	r2, #16
	bhi	.L125
	cmp	r7, #1
	subhi	r7, r7, #1
	addhi	r8, r4, #72
	addhi	r6, r4, #53
	movhi	r5, #0
	bls	.L131
.L130:
	ldr	ip, [r8, #4]!
	cmp	r5, #0
	ldrb	lr, [r6, #1]!	@ zero_extendqisi2
	mov	r2, r5
	movge	r1, r8
	movge	r3, r6
	blt	.L133
.L129:
	ldr	r0, [r1, #-4]!
	sub	r3, r3, #1
	cmp	ip, r0
	strlt	r0, [r1, #4]
	ldrltb	r0, [r3]	@ zero_extendqisi2
	strltb	r0, [r3, #1]
	strlt	ip, [r1]
	strltb	lr, [r3]
	subs	r2, r2, #1
	bpl	.L129
.L133:
	add	r5, r5, #1
	cmp	r5, r7
	bne	.L130
.L131:
	ldr	r3, [fp, #-52]
	movs	r6, r3, lsr #1
	beq	.L128
	ldr	r3, [fp, #-52]
	add	r0, r4, #68
	mov	r1, #0
	add	r2, r3, #17
	add	r3, r3, #52
	add	r3, r4, r3
	mov	ip, r0
	add	r2, r4, r2, lsl #2
	add	r4, r4, #53
.L134:
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
	bne	.L134
.L128:
	mov	r0, #0
.L117:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L155:
	ldr	r2, [r4, #24]
.L139:
	cmp	r2, r6
	bls	.L128
	add	r8, r6, #17
	add	r9, r6, #52
	add	r9, r4, r9
	mov	r7, #0
	add	r8, r4, r8, lsl #2
.L142:
	ldr	r0, [r5]
	add	r6, r6, #1
	bl	HEVC_ue_v.isra.18
	mov	r1, #1
	add	r0, r0, r1
	add	r7, r7, r0
	str	r7, [r8, #4]!
	ldr	r0, [r5]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r3, [r4, #24]
	cmp	r6, r3
	bcc	.L142
	b	.L128
.L156:
	ldr	r0, [r5]
	bl	HEVC_ue_v.isra.18
	add	r2, r0, #1
	str	r2, [r4, #4]
	cmp	r6, r2
	bcc	.L160
	sub	r3, r6, #1
	rsb	r6, r0, r3
	cmp	r6, r3
	bls	.L116
	ldr	ip, .L161
	mov	r2, r6
	ldr	r1, .L161+8
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L117
.L125:
	ldr	r3, .L161
	mov	r0, #1
	ldr	r1, .L161+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L117
.L153:
	ldr	r3, .L161
	mov	r2, r0
	ldr	r1, .L161+16
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L117
.L160:
	ldr	ip, .L161
	mov	r3, r6
	ldr	r1, .L161+20
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L117
.L157:
	ldr	r3, .L161
	mov	r0, #1
	ldr	r1, .L161+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L117
.L137:
	ldr	ip, .L161
	mov	r3, #16
	ldr	r1, .L161+28
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L117
.L154:
	ldr	r3, .L161
	mov	r0, #1
	ldr	r2, [r4, #16]
	ldr	r1, .L161+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L117
.L162:
	.align	2
.L161:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC32
	.word	.LC26
	.word	.LC28
	.word	.LC29
	.word	.LC25
	.word	.LC27
	.word	.LC31
	.word	.LC30
	UNWIND(.fnend)
	.size	HEVC_DecShortTermRefPicSet.isra.19, .-HEVC_DecShortTermRefPicSet.isra.19
	.align	2
	.type	HEVC_se_v.isra.21, %function
HEVC_se_v.isra.21:
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
	bls	.L168
	mvn	r0, #-2147483648
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L168:
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
	.size	HEVC_se_v.isra.21, .-HEVC_se_v.isra.21
	.align	2
	.type	HEVC_IncreaseDPBSize.isra.28, %function
HEVC_IncreaseDPBSize.isra.28:
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
	ldr	r3, [r1]
	mov	r4, r1
	cmp	r3, #16
	bhi	.L173
	bl	FSP_GetTotalValidFsNum
	subs	r3, r0, #0
	ble	.L172
	ldr	r2, [r4]
	add	r2, r2, #1
	cmp	r3, r2
	bcc	.L172
	ldr	r1, .L174
	mov	r3, r2
	str	r2, [r4]
	mov	r0, #13
	ldr	r2, .L174+4
	ldr	r4, [r1, #68]
	ldr	r1, .L174+8
	blx	r4
	mov	r0, #0
.L171:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L172:
	ldr	ip, .L174
	mov	r0, #1
	ldr	r2, .L174+4
	ldr	r1, .L174+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L171
.L173:
	ldr	r1, .L174
	mov	r5, #17
	ldr	r2, .L174+4
	mov	r0, #1
	str	r5, [sp]
	ldr	r6, [r1, #68]
	ldr	r1, .L174+16
	blx	r6
	str	r5, [r4]
	mvn	r0, #0
	b	.L171
.L175:
	.align	2
.L174:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+16
	.word	.LC34
	.word	.LC35
	.word	.LC33
	UNWIND(.fnend)
	.size	HEVC_IncreaseDPBSize.isra.28, .-HEVC_IncreaseDPBSize.isra.28
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
	subs	r3, r0, #0
	str	r3, [fp, #-56]
	beq	.L200
	ldr	r4, .L201
	mov	r2, #147456
	mov	r1, #0
	ldr	r0, .L201+4
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #36864
	mov	r1, #0
	ldr	r0, .L201+8
	blx	r3
	ldr	r5, [fp, #-56]
	ldr	r3, [r4, #48]
	mov	r2, #880
	add	r0, r5, #53760
	mov	r1, #0
	add	r0, r0, #248
	add	r10, r5, #24576
	blx	r3
	add	r2, r5, #53248
	mov	r3, #0
	str	r2, [fp, #-60]
	str	r3, [r2, #756]
	ldr	r9, [r10, #2608]
	ldr	r1, [r10, #2604]
	ldr	r2, [r9, #72]
	ldr	r8, [r1, #240]
	cmp	r2, r3
	strne	r3, [fp, #-72]
	strne	r3, [fp, #-76]
	beq	.L176
.L185:
	ldr	r2, [r9, #68]
	cmp	r2, #0
	ldr	r2, [fp, #-72]
	add	r2, r2, #108
	streq	r2, [fp, #-80]
	beq	.L186
	mov	r1, r2
	str	r2, [fp, #-80]
	mov	r7, r1, asl #1
	ldr	r1, [fp, #-76]
	mov	r2, #0
	str	r2, [fp, #-48]
	str	r2, [fp, #-52]
	mul	r1, r8, r1
	ldr	r2, [fp, #-60]
	ldr	r2, [r2, #756]
	str	r1, [fp, #-68]
.L184:
	add	r1, r2, #6720
	ldr	r0, [fp, #-56]
	add	r1, r1, #30
	add	r1, r0, r1, lsl #3
	str	r3, [r1, #8]
	ldrsh	r1, [r9, r7]
	cmp	r1, #0
	ldreq	r1, [fp, #-48]
	addeq	r1, r1, #88
	streq	r1, [fp, #-64]
	beq	.L180
	ldr	r2, [fp, #-48]
	mov	r5, #0
	ldr	r1, [fp, #-52]
	add	r2, r2, #88
	ldr	r0, [fp, #-68]
	str	r2, [fp, #-64]
	add	r6, r1, r0
	mov	ip, r2, asl #1
.L181:
	ldrsh	r2, [r9, ip]
	cmp	r2, #0
	beq	.L183
	ldr	r2, .L201+4
	rsb	lr, r3, r6
	mov	r4, r3
	add	r2, r2, r3, lsl #2
.L182:
	add	r1, lr, r3
	str	r1, [r2], #4
	ldr	r9, [r10, #2608]
	add	r3, r3, #1
	rsb	r1, r4, r3
	ldrsh	r0, [r9, ip]
	cmp	r0, r1
	bhi	.L182
.L183:
	ldrsh	r2, [r9, r7]
	add	r5, r5, #1
	add	r6, r6, r8
	cmp	r2, r5
	bhi	.L181
	ldr	r2, [fp, #-60]
	ldr	r2, [r2, #756]
.L180:
	ldr	r1, [fp, #-56]
	sub	ip, r3, #1
	ldr	r0, [fp, #-64]
	add	r1, r1, r2, lsl #3
	ldr	lr, [fp, #-48]
	add	r1, r1, #53760
	add	r2, r2, #1
	mov	r0, r0, asl #1
	add	lr, lr, #1
	str	ip, [r1, #252]
	ldr	r1, [fp, #-60]
	str	lr, [fp, #-48]
	str	r2, [r1, #756]
	ldr	r1, [r9, #68]
	ldrsh	r0, [r9, r0]
	cmp	r1, lr
	ldr	r1, [fp, #-52]
	add	r1, r1, r0
	str	r1, [fp, #-52]
	bhi	.L184
.L186:
	ldr	r2, [fp, #-80]
	ldr	r0, [fp, #-72]
	ldr	r1, [r9, #72]
	mov	r2, r2, asl #1
	add	r0, r0, #1
	cmp	r1, r0
	ldr	r1, [fp, #-76]
	ldrsh	r2, [r9, r2]
	str	r0, [fp, #-72]
	add	r2, r1, r2
	str	r2, [fp, #-76]
	bhi	.L185
.L176:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L200:
	ldr	ip, .L201
	movw	r3, #6091
	ldr	r2, .L201+12
	mov	r0, #1
	ldr	r1, .L201+16
	ldr	ip, [ip, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	ip
.L202:
	.align	2
.L201:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR2+144
	.word	.LANCHOR0+40
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_CalcTileMap, .-HEVC_CalcTileMap
	.align	2
	.global	HEVC_WritePicMsg
	.type	HEVC_WritePicMsg, %function
HEVC_WritePicMsg:
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
	beq	.L255
	ldr	r7, .L259
	add	r6, r4, #40960
	ldr	r1, .L259+4
	mov	r0, #2
	ldr	r2, [r6, #2268]
	add	r5, r4, #49152
	ldr	r3, [r6, #2052]
	add	r10, r4, #53248
	ldr	r8, [r7, #68]
	mov	r9, #0
	blx	r8
	ldr	r3, [r7, #68]
	ldr	r1, .L259+8
	mov	r0, #4
	blx	r3
	ldr	r3, [r6, #2264]
	add	r8, r4, #24576
	add	lr, r4, #53504
	add	lr, lr, #32
	str	lr, [fp, #-48]
	str	r3, [r5, #3492]
	add	lr, r4, #53504
	ldr	r3, [r6, #2176]
	add	lr, lr, #112
	ldr	ip, [r6, #2180]
	add	r1, r4, #2912
	str	lr, [fp, #-60]
	add	r0, r4, #51456
	rsb	ip, r3, ip
	str	ip, [r5, #3496]
	ldr	ip, [r6, #2268]
	mov	r2, #64
	add	r1, r1, #8
	add	r0, r0, #20
	str	ip, [r5, #3484]
	ldr	ip, [r6, #2052]
	str	ip, [r5, #3488]
	ldr	ip, [r6, #2216]
	str	ip, [r5, #3500]
	ldr	ip, [r6, #2204]
	rsb	r3, r3, ip
	str	r3, [r5, #3504]
	ldr	r3, [r6, #2212]
	rsb	ip, ip, r3
	str	ip, [r5, #3508]
	str	r9, [r4, #208]
	ldr	r3, [r10, #3248]
	str	r3, [r10, #528]
	ldr	r3, [r8, #2604]
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	strb	ip, [r5, #2204]
	ldrb	ip, [r3, #5]	@ zero_extendqisi2
	strb	ip, [r5, #2205]
	ldrb	ip, [r3, #9]	@ zero_extendqisi2
	strb	ip, [r5, #2206]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	strb	ip, [r5, #2207]
	ldrb	ip, [r3, #7]	@ zero_extendqisi2
	strb	ip, [r5, #2208]
	ldr	ip, [r3, #64]
	str	ip, [r5, #2212]
	ldr	ip, [r3, #116]
	strb	ip, [r5, #2216]
	ldr	ip, [r3, #244]
	sub	ip, ip, #1
	str	ip, [r5, #2220]
	ldr	ip, [r3, #240]
	sub	ip, ip, #1
	str	ip, [r5, #2224]
	ldr	ip, [r6, #2024]
	str	ip, [r5, #2228]
	ldr	ip, [r8, #2608]
	ldr	lr, [ip, #84]
	sub	lr, lr, #2
	str	lr, [r5, #2232]
	ldrb	lr, [ip, #11]	@ zero_extendqisi2
	strb	lr, [r5, #2236]
	ldrb	ip, [ip, #10]	@ zero_extendqisi2
	strb	ip, [r5, #2237]
	ldr	ip, [r3, #200]
	str	ip, [r5, #2240]
	ldr	ip, [r3, #208]
	str	ip, [r5, #2244]
	ldr	ip, [r3, #188]
	str	ip, [r5, #2248]
	ldr	ip, [r3, #196]
	str	ip, [r5, #2252]
	ldr	ip, [r3, #172]
	str	ip, [r5, #2256]
	ldr	ip, [r3, #180]
	str	ip, [r5, #2260]
	ldr	ip, [r3, #216]
	str	ip, [r5, #2264]
	ldr	ip, [r3, #140]
	str	ip, [r5, #2268]
	ldr	ip, [r3, #148]
	str	ip, [r5, #2272]
	ldr	ip, [r3, #112]
	str	ip, [r5, #2276]
	ldr	ip, [r3, #104]
	str	ip, [r5, #2280]
	ldr	ip, [r3, #124]
	str	ip, [r5, #2284]
	ldr	ip, [r3, #120]
	str	ip, [r5, #2288]
	ldr	ip, [r3, #108]
	str	ip, [r5, #2292]
	ldr	r3, [r3, #100]
	str	r3, [r5, #2296]
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r8, #2604]
	add	r0, r4, #52992
	add	r0, r0, #32
	ldr	r2, [r3, #76]
	str	r2, [r5, #2388]
	ldr	r2, [r3, #72]
	str	r2, [r5, #2392]
	ldr	r2, [r8, #2608]
	ldr	r3, [r3, #148]
	str	r3, [fp, #-64]
	ldr	r3, [r2, #68]
	ldr	r2, [r2, #72]
	str	r3, [fp, #-52]
	sub	r3, r3, #1
	cmp	r3, #9
	str	r2, [fp, #-56]
	bhi	.L256
	ldr	r3, [fp, #-56]
	sub	r3, r3, #1
	cmp	r3, #10
	bhi	.L257
	ldr	r3, [r7, #48]
	mov	r2, #512
	mov	r1, r9
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, r9
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #88
	mov	r1, r9
	ldr	r0, [fp, #-60]
	blx	r3
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	ble	.L214
	ldr	r3, [fp, #-64]
	mov	r1, r9
	mov	lr, r9
	ldr	r9, [fp, #-48]
	sub	r3, r3, #4
	str	r5, [fp, #-68]
	mov	r5, r3
.L213:
	ldr	r3, [fp, #-48]
	str	r1, [r3, lr, asl #3]
	mov	r3, r1, asl r5
	ldr	r2, [r8, #2608]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #176]
	add	r1, r1, r2
	sub	r2, r1, #1
	str	r2, [r9, #4]
	mov	r0, r1, asl r5
	cmp	r3, r0
	bge	.L219
	cmp	r3, #255
	bhi	.L215
	add	r2, r3, #52992
	uxtb	ip, lr
	add	r2, r2, #31
	add	r2, r4, r2
	b	.L217
.L218:
	cmp	r3, #256
	beq	.L215
.L217:
	add	r3, r3, #1
	strb	ip, [r2, #1]!
	cmp	r3, r0
	bne	.L218
.L219:
	ldr	r3, [fp, #-52]
	add	lr, lr, #1
	add	r9, r9, #8
	cmp	lr, r3
	bne	.L213
	ldr	r5, [fp, #-68]
.L214:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ble	.L211
	ldr	r3, [fp, #-64]
	mov	ip, #0
	str	r5, [fp, #-48]
	mov	lr, ip
	sub	r9, r3, #4
	ldr	r3, [fp, #-60]
	mov	r5, r3
.L221:
	ldr	r3, [fp, #-60]
	str	ip, [r3, lr, asl #3]
	mov	r3, ip, asl r9
	ldr	r2, [r8, #2608]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #216]
	add	ip, ip, r2
	sub	r2, ip, #1
	str	r2, [r5, #4]
	mov	r1, ip, asl r9
	cmp	r3, r1
	bge	.L226
	cmp	r3, #255
	bhi	.L222
	add	r2, r3, #53248
	uxtb	r0, lr
	add	r2, r2, #31
	add	r2, r4, r2
	b	.L224
.L225:
	cmp	r3, #256
	beq	.L222
.L224:
	add	r3, r3, #1
	strb	r0, [r2, #1]!
	cmp	r3, r1
	bne	.L225
.L226:
	ldr	r3, [fp, #-56]
	add	lr, lr, #1
	add	r5, r5, #8
	cmp	lr, r3
	bne	.L221
	ldr	r5, [fp, #-48]
.L211:
	ldr	r3, [r8, #2608]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	strb	r2, [r5, #2416]
	ldrb	r2, [r3, #7]	@ zero_extendqisi2
	strb	r2, [r5, #2417]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	strb	r2, [r5, #2418]
	ldrb	r2, [r3, #14]	@ zero_extendqisi2
	strb	r2, [r5, #2419]
	ldrb	r2, [r3, #15]	@ zero_extendqisi2
	strb	r2, [r5, #2420]
	ldrb	r2, [r3, #13]	@ zero_extendqisi2
	strb	r2, [r5, #2421]
	ldr	r2, [r8, #2604]
	ldr	r1, [r3, #56]
	ldr	r2, [r2, #148]
	rsb	r2, r1, r2
	str	r2, [r3, #88]
	ldr	r3, [r8, #2608]
	ldr	r2, [r3, #88]
	str	r2, [r5, #2424]
	ldr	r2, [r3, #52]
	str	r2, [r5, #2428]
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	strb	r2, [r5, #2432]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	strb	r2, [r5, #2433]
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	strb	r2, [r5, #2434]
	ldr	r2, [r3, #60]
	str	r2, [r5, #2436]
	ldr	r2, [r3, #64]
	str	r2, [r5, #2440]
	ldr	r2, [r3, #72]
	sub	r2, r2, #1
	str	r2, [r5, #2444]
	ldr	r2, [r3, #68]
	sub	r2, r2, #1
	str	r2, [r5, #2448]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	strb	r2, [r5, #2237]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	strb	r3, [r5, #2236]
	ldr	r3, [r6, #2068]
	ldr	r0, [r4, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	subs	r8, r0, #0
	beq	.L258
	ldr	r2, [r8, #520]
	ldr	r3, [r8, #524]
	cmp	r2, #0
	beq	.L228
	cmp	r3, #0
	beq	.L228
	add	r3, r4, #52736
	add	r2, r4, #52480
	add	r2, r2, #196
	ldr	r0, [r4, #244]
	mov	r1, r3
	add	r3, r3, #160
	add	r1, r1, #68
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r8, #520]
	add	r2, r4, #52736
	ldr	r3, [r3, #4]
	mov	r1, r2
	add	r2, r2, #72
	add	r1, r1, #152
	str	r3, [r5, #3484]
	ldr	r0, [r4, #244]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r6, #2052]
	str	r3, [r5, #3488]
	ldr	r3, [r8, #536]
	str	r3, [r5, #3740]
	ldr	r3, [r8, #524]
	ldr	r3, [r3, #12]
	str	r3, [r10, #748]
	ldr	r3, [r8, #524]
	ldr	r3, [r3, #44]
	str	r3, [r10, #752]
	ldr	ip, [r4, #2784]
	cmp	ip, #0
	str	ip, [r10, #520]
	beq	.L230
	add	r1, r4, #2848
	add	r2, r4, #53504
	add	r1, r1, #4
	add	r2, r2, #196
	mov	r3, #0
.L231:
	add	r3, r3, #1
	ldr	r0, [r1, #4]!
	cmp	r3, ip
	str	r0, [r2, #4]!
	bne	.L231
.L230:
	add	r8, r4, #51456
	mov	r7, #0
	add	r8, r8, #152
.L232:
	mov	r2, r8
	mov	r0, r7
	mov	r1, r4
	add	r7, r7, #1
	bl	HEVC_WriteQmatrix_8x8
	cmp	r7, #4
	add	r8, r8, #64
	bne	.L232
	add	r2, r4, #51712
	mov	r0, r7
	add	r2, r2, #152
	mov	r1, r4
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r4, #51712
	add	r2, r2, #216
	mov	r1, r4
	mov	r0, #5
	add	r8, r4, #51968
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r8, #24
	mov	r1, r4
	mov	r0, #0
	bl	HEVC_WriteQmatrix_16x16
	add	r2, r4, #51968
	add	r2, r2, #88
	mov	r1, r4
	mov	r0, #1
	add	r8, r8, #152
	mov	r7, #2
	bl	HEVC_WriteQmatrix_16x16
.L233:
	mov	r2, r8
	mov	r0, r7
	mov	r1, r4
	add	r7, r7, #1
	bl	HEVC_WriteQmatrix_16x16
	cmp	r7, #6
	add	r8, r8, #64
	bne	.L233
	mov	ip, r4
	mov	r3, r4
	mov	r9, #2
.L234:
	ldr	r1, [r3, #1724]
	add	r0, r3, #52224
	ldr	r7, [r3, #1740]
	subs	r9, r9, #1
	ldrb	lr, [r3, #1732]	@ zero_extendqisi2
	add	r3, r3, #64
	ldrb	r2, [r3, #1652]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r2, r2, r7, asl #24
	uxth	r1, r1
	orr	r2, r2, lr, asl #16
	mov	r7, r0
	orr	r2, r2, r1
	str	r2, [r0, #152]
	ldr	r1, [r3, #1692]
	mov	lr, r0
	ldr	r2, [r3, #1708]
	ldrb	r0, [r3, #1684]	@ zero_extendqisi2
	ldrb	r8, [r3, #1700]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r2, r0, r2, asl #24
	mov	r0, r7
	uxth	r1, r1
	orr	r2, r2, r8, asl #16
	orr	r2, r2, r1
	str	r2, [r7, #156]
	ldr	r1, [r3, #1660]
	ldrb	r8, [r3, #1653]	@ zero_extendqisi2
	ldrb	r2, [r3, #1677]	@ zero_extendqisi2
	and	r1, r1, #65280
	orr	r1, r8, r1
	ldrb	r8, [r3, #1669]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #16
	str	r2, [lr, #160]
	ldr	r1, [r3, #1692]
	mov	lr, r7
	ldrb	r8, [r3, #1685]	@ zero_extendqisi2
	ldrb	r2, [r3, #1709]	@ zero_extendqisi2
	and	r1, r1, #65280
	orr	r1, r8, r1
	ldrb	r8, [r3, #1701]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #16
	str	r2, [r0, #164]
	ldr	r1, [r3, #1668]
	mov	r0, r7
	ldrb	r8, [r3, #1654]	@ zero_extendqisi2
	ldrb	r2, [r3, #1678]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, r8, r1
	ldrb	r8, [r3, #1662]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #8
	str	r2, [r7, #168]
	ldr	r1, [r3, #1700]
	ldrb	r8, [r3, #1686]	@ zero_extendqisi2
	ldrb	r2, [r3, #1710]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, r8, r1
	ldrb	r8, [r3, #1694]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #8
	str	r2, [lr, #172]
	ldr	r1, [r3, #1676]
	mov	lr, r7
	ldrb	r8, [r3, #1655]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r2, [r3, #1671]	@ zero_extendqisi2
	orr	r1, r8, r1
	ldrb	r8, [r3, #1663]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #16
	orr	r2, r2, r8, asl #8
	str	r2, [r0, #176]
	ldr	r1, [r3, #1708]
	mov	r0, r7
	ldrb	r8, [r3, #1687]	@ zero_extendqisi2
	ldrb	r2, [r3, #1703]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	orr	r1, r8, r1
	ldrb	r8, [r3, #1695]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #16
	orr	r2, r2, r8, asl #8
	str	r2, [r7, #180]
	ldr	r1, [r3, #1664]
	ldr	r2, [r3, #1680]
	ldrb	r7, [r3, #1656]	@ zero_extendqisi2
	ldrb	r8, [r3, #1672]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r2, r7, r2, asl #24
	mov	r7, lr
	uxth	r1, r1
	orr	r2, r2, r8, asl #16
	orr	r2, r2, r1
	str	r2, [lr, #184]
	ldr	r1, [r3, #1696]
	ldr	r2, [r3, #1712]
	ldrb	lr, [r3, #1688]	@ zero_extendqisi2
	ldrb	r8, [r3, #1704]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r2, lr, r2, asl #24
	mov	lr, r0
	uxth	r1, r1
	orr	r2, r2, r8, asl #16
	orr	r2, r2, r1
	str	r2, [r0, #188]
	ldr	r1, [r3, #1664]
	ldrb	r8, [r3, #1657]	@ zero_extendqisi2
	ldrb	r2, [r3, #1681]	@ zero_extendqisi2
	and	r1, r1, #65280
	orr	r1, r8, r1
	ldrb	r8, [r3, #1673]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #16
	str	r2, [r7, #192]
	ldr	r1, [r3, #1696]
	mov	r7, r0
	ldrb	r8, [r3, #1689]	@ zero_extendqisi2
	ldrb	r2, [r3, #1713]	@ zero_extendqisi2
	and	r1, r1, #65280
	orr	r1, r8, r1
	ldrb	r8, [r3, #1705]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #16
	str	r2, [lr, #196]
	ldr	r1, [r3, #1672]
	mov	lr, r0
	ldrb	r8, [r3, #1658]	@ zero_extendqisi2
	ldrb	r2, [r3, #1682]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, r8, r1
	ldrb	r8, [r3, #1666]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #8
	str	r2, [r0, #200]
	ldr	r1, [r3, #1704]
	ldrb	r8, [r3, #1690]	@ zero_extendqisi2
	ldrb	r2, [r3, #1714]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, r8, r1
	ldrb	r8, [r3, #1698]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #24
	orr	r2, r2, r8, asl #8
	str	r2, [r7, #204]
	ldr	r1, [r3, #1680]
	ldrb	r7, [r3, #1659]	@ zero_extendqisi2
	ldrb	r2, [r3, #1675]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	orr	r1, r7, r1
	ldrb	r7, [r3, #1667]	@ zero_extendqisi2
	orr	r2, r1, r2, asl #16
	orr	r2, r2, r7, asl #8
	str	r2, [lr, #208]
	ldr	r1, [r3, #1712]
	ldrb	r7, [r3, #1691]	@ zero_extendqisi2
	ldrb	r2, [r3, #1707]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	lr, [r3, #1699]	@ zero_extendqisi2
	orr	r1, r7, r1
	orr	r2, r1, r2, asl #16
	orr	r2, r2, lr, asl #8
	str	r2, [r0, #212]
	bne	.L234
	add	lr, r4, #52480
	add	r7, r4, #384
	add	lr, lr, #24
.L235:
	ldr	r3, [ip, #572]
	add	ip, ip, #64
	ldr	r0, [ip, #500]
	add	lr, lr, #16
	ldr	r8, [ip, #504]
	and	r1, r3, #65280
	ldr	r2, [ip, #512]
	ubfx	r9, r0, #8, #8
	orr	r1, r9, r1
	mov	r3, r3, asl #8
	uxtb	r9, r8
	uxtb	r0, r0
	ubfx	r10, r2, #8, #8
	orr	r0, r0, r2, asl #24
	ubfx	r8, r8, #8, #8
	orr	r0, r0, r9, asl #16
	orr	r2, r1, r10, asl #24
	uxth	r3, r3
	orr	r3, r0, r3
	orr	r2, r2, r8, asl #16
	str	r3, [lr, #-16]
	str	r2, [lr, #-12]
	ldr	r2, [ip, #504]
	ldrb	r0, [ip, #502]	@ zero_extendqisi2
	ldrb	r3, [ip, #514]	@ zero_extendqisi2
	and	r2, r2, #16711680
	ldrb	r1, [ip, #510]	@ zero_extendqisi2
	orr	r2, r0, r2
	orr	r3, r2, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [lr, #-8]
	ldr	r2, [ip, #512]
	ldrb	r0, [ip, #503]	@ zero_extendqisi2
	ldrb	r3, [ip, #507]	@ zero_extendqisi2
	and	r2, r2, #-16777216
	ldrb	r1, [ip, #511]	@ zero_extendqisi2
	orr	r2, r0, r2
	cmp	ip, r7
	orr	r3, r2, r3, asl #16
	orr	r3, r3, r1, asl #8
	str	r3, [lr, #-4]
	bne	.L235
	ldr	r1, [r4, #2252]
	mov	r0, #0
	ldr	r3, [r4, #2256]
	ldr	r2, [r4, #2244]
	ldr	ip, [r4, #2248]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r5, #3448]
	ldr	r1, [r4, #2268]
	ldr	r3, [r4, #2272]
	ldr	r2, [r4, #2260]
	ldr	ip, [r4, #2264]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r5, #3452]
	ldr	r3, [r6, #2052]
	str	r3, [r5, #3480]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L215:
	ldr	r4, [r7, #68]
	mov	r0, #1
	ldr	r2, .L259+12
	ldr	r1, .L259+16
	blx	r4
.L207:
	ldr	r3, [r7, #68]
	mov	r0, #1
	ldr	r2, .L259+20
	ldr	r1, .L259+24
	blx	r3
	mvn	r0, #0
.L250:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L222:
	ldr	r4, [r7, #68]
	mov	r0, #1
	ldr	r2, .L259+12
	ldr	r1, .L259+28
	blx	r4
	b	.L207
.L257:
	mov	r2, #11
	ldr	r4, [r7, #68]
	ldr	r3, [fp, #-56]
	mov	r0, #1
	str	r2, [sp]
	ldr	r1, .L259+32
	ldr	r2, .L259+12
	blx	r4
	b	.L207
.L228:
	ldr	r4, [r7, #68]
	mov	r0, #1
	ldr	r1, .L259+36
	blx	r4
	mvn	r0, #0
	b	.L250
.L256:
	mov	r2, #10
	ldr	r4, [r7, #68]
	ldr	r3, [fp, #-52]
	mov	r0, #1
	str	r2, [sp]
	ldr	r1, .L259+40
	ldr	r2, .L259+12
	blx	r4
	b	.L207
.L255:
	ldr	ip, .L259
	movw	r3, #6146
	ldr	r2, .L259+20
	mov	r0, #1
	ldr	r1, .L259+44
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L250
.L258:
	ldr	r2, [r6, #2068]
	mov	r0, #1
	ldr	r3, [r7, #68]
	ldr	r1, .L259+48
	ldr	r2, [r2, #32]
	blx	r3
	mvn	r0, #0
	b	.L250
.L260:
	.align	2
.L259:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC37
	.word	.LC38
	.word	.LANCHOR0+80
	.word	.LC41
	.word	.LANCHOR0+60
	.word	.LC45
	.word	.LC42
	.word	.LC40
	.word	.LC44
	.word	.LC39
	.word	.LC36
	.word	.LC43
	UNWIND(.fnend)
	.size	HEVC_WritePicMsg, .-HEVC_WritePicMsg
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.align	2
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 296
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #300)
	sub	sp, sp, #300
	subs	r4, r0, #0
	beq	.L447
	add	r5, r4, #40960
	ldrb	r3, [r5, #2579]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r3, r4, #43520
	addne	r3, r4, #47104
	addeq	r3, r3, #16
	addne	r3, r3, #164
	ldr	r0, [r3, #160]
	ldr	ip, [r3, #164]
	cmp	r0, #16
	bhi	.L448
	cmp	ip, #16
	bhi	.L268
	cmp	r0, #0
	beq	.L269
	ldr	r3, [r4, #2320]
	cmp	r3, #0
	beq	.L362
	ldr	r3, [r3, #32]
	cmp	r3, #0
	addne	r1, r4, #2320
	movne	r2, #0
	bne	.L274
	b	.L449
.L275:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L270
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L271
.L274:
	add	r2, r2, #1
	cmp	r2, r0
	bne	.L275
.L269:
	cmp	ip, #0
	beq	.L276
	ldr	r3, [r4, #2388]
	cmp	r3, #0
	beq	.L364
	ldr	r3, [r3, #32]
	cmp	r3, #0
	addne	r1, r4, #2384
	movne	r2, #0
	addne	r1, r1, #4
	bne	.L281
	b	.L450
.L282:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L277
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L278
.L281:
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L282
.L276:
	ldr	r0, [r4, #208]
	ldr	r3, [r4, #144]
	cmp	r0, r3
	bcs	.L451
	add	r3, r4, #53248
	str	r3, [fp, #-320]
	mov	r6, #1360
	ldr	ip, .L460
	ldr	r3, [r3, #3248]
	mov	r2, r6
	mov	r1, #0
	ldr	r7, [ip, #48]
	mla	r3, r6, r0, r3
	mov	r0, r3
	str	r3, [fp, #-296]
	blx	r7
	ldr	r3, .L460
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #288
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #208]
	ldr	r2, [r4, #144]
	add	r3, r3, #1
	str	r3, [r4, #208]
	cmp	r3, r2
	ldrcc	r2, [fp, #-320]
	movcs	r3, #0
	ldrcc	r2, [r2, #3248]
	mlacc	r3, r6, r3, r2
	ldr	r2, [fp, #-296]
	str	r3, [r2, #1356]
	ldr	r3, [r4, #216]
	ldr	r0, [r5, #2652]
	add	r1, r3, #14080
	add	r2, r3, #1
	add	r1, r1, #46
	str	r0, [r4, r1, asl #2]
	ldr	r3, [r4, #172]
	str	r2, [r4, #216]
	ldr	r2, [fp, #-320]
	add	r3, r3, #1
	str	r3, [r4, #172]
	mov	r0, r3, asl #5
	ldr	r1, [r5, #2636]
	ldr	r2, [r2, #4056]
	sub	r3, r0, r3, asl #2
	str	r3, [fp, #-332]
	add	r3, r2, r3
	str	r1, [r3, #8]
	ldr	r2, [r4, #2316]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	r1, #1
	cmpls	r1, r3
	bcs	.L285
	ldr	r3, [fp, #-296]
	add	r0, r3, r1, lsl #2
.L286:
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r1, r1, #1
	add	r2, r2, r3
	ldr	r2, [r2, #60]
	str	r2, [r0, #8]
	ldr	r2, [r4, #2316]
	add	r2, r2, r3
	ldr	r2, [r2, #56]
	str	r2, [r0], #4
	ldr	r2, [r4, #2316]
	add	r3, r2, r3
	ldr	r3, [r3, #64]
	str	r3, [r0, #12]
	ldr	r2, [r4, #2316]
	ldr	r3, [r2, #8]
	cmp	r3, r1
	movhi	ip, #1
	movls	ip, #0
	cmp	r1, #1
	movhi	ip, #0
	cmp	ip, #0
	bne	.L286
.L285:
	cmp	r3, #1
	bhi	.L291
	ldr	r2, [fp, #-296]
	add	r3, r2, r3, lsl #2
	add	r1, r2, #8
	mov	r2, #0
.L290:
	str	r2, [r3, #8]
	str	r2, [r3], #4
	cmp	r3, r1
	str	r2, [r3, #12]
	bne	.L290
.L291:
	ldrb	r3, [r5, #2579]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L452
.L289:
	add	r3, r4, #45056
	str	r3, [fp, #-300]
	mov	r8, r3
	ldr	r3, [r3, #2372]
	cmp	r3, #0
	beq	.L292
	ldr	r3, [fp, #-296]
	add	ip, r4, #2304
	add	ip, ip, #12
	mov	r1, #0
	add	r7, r3, #112
	add	r6, r3, #368
	mov	lr, ip
.L293:
	ldr	r0, [lr, #4]!
	sub	r9, fp, #44
	add	r1, r1, #1
	ldr	r2, [r0, #32]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	add	r3, r3, #13184
	add	r3, r3, #16
	add	r2, r9, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	str	r3, [r2, #-244]
	ldr	r3, [r0, #16]
	str	r3, [r7, #4]!
	ldr	r3, [ip, #4]!
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #28]
	str	r3, [r6, #4]!
	ldr	r3, [r8, #2372]
	cmp	r3, r1
	bhi	.L293
	ldr	r2, [fp, #-300]
	ldr	r2, [r2, #2376]
	cmp	r2, #0
	beq	.L294
.L359:
	ldr	r3, [fp, #-296]
	add	ip, r4, #2384
	ldr	r8, [fp, #-300]
	mov	r1, #0
	add	r7, r3, #176
	add	r6, r3, #432
	mov	lr, ip
.L295:
	ldr	r0, [lr, #4]!
	sub	r9, fp, #44
	add	r1, r1, #1
	ldr	r2, [r0, #32]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	add	r3, r3, #13184
	add	r3, r3, #16
	add	r2, r9, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	str	r3, [r2, #-244]
	ldr	r3, [r0, #16]
	str	r3, [r7, #4]!
	ldr	r3, [ip, #4]!
	ldr	r3, [r3, #32]
	ldr	r3, [r3, #28]
	str	r3, [r6, #4]!
	ldr	r2, [r8, #2376]
	cmp	r2, r1
	bhi	.L295
	ldr	r3, [fp, #-300]
	ldr	r3, [r3, #2372]
.L294:
	cmp	r3, #0
	beq	.L296
	ldr	r0, [fp, #-296]
	ldr	lr, [r5, #2024]
	ldr	r1, [r0, #372]
	add	r1, r1, #728
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	cmp	lr, r1
	blt	.L371
	add	ip, r0, #372
	mov	r0, #0
	b	.L298
.L299:
	ldr	r1, [ip, #4]!
	add	r1, r1, #728
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	cmp	r1, lr
	bgt	.L371
.L298:
	add	r0, r0, #1
	cmp	r0, r3
	bne	.L299
.L296:
	ldr	r3, [fp, #-300]
	ldr	r1, [r3, #2272]
	cmp	r1, #0
	bne	.L436
	cmp	r2, #0
	beq	.L436
	ldr	ip, [fp, #-296]
	ldr	r0, [r5, #2024]
	ldr	r3, [ip, #436]
	add	r3, r3, #728
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	cmp	r0, r3
	blt	.L297
	add	ip, ip, #436
	b	.L300
.L301:
	ldr	r3, [ip, #4]!
	add	r3, r3, #728
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	cmp	r3, r0
	bgt	.L371
.L300:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L301
.L436:
	mov	r1, #1
.L297:
	ldr	r2, [fp, #-296]
	strb	r1, [r2, #24]
	ldr	r1, [fp, #-300]
	ldrb	r3, [r5, #2579]	@ zero_extendqisi2
	strb	r3, [r2, #25]
	ldr	r3, [r1, #2268]
	str	r3, [r2, #28]
	ldrb	r3, [r1, #2222]	@ zero_extendqisi2
	strb	r3, [r2, #32]
	ldr	r3, [r1, #2292]
	str	r3, [r2, #36]
	ldr	r3, [r1, #2272]
	cmp	r3, #0
	beq	.L453
	cmp	r3, #1
	movne	r3, #0
	strne	r3, [fp, #-324]
	beq	.L303
.L304:
	ldr	r2, [fp, #-296]
	ldr	r1, [fp, #-324]
	ldr	r6, [fp, #-296]
	str	r1, [r2, #40]
	ldr	r1, [fp, #-300]
	ldr	r3, [r1, #2324]
	str	r3, [r2, #48]
	ldrb	r3, [r1, #2223]	@ zero_extendqisi2
	strb	r3, [r2, #52]
	ldr	r3, [r1, #2328]
	str	r3, [r2, #44]
	ldr	r3, [r1, #2380]
	ldr	r1, [fp, #-300]
	cmp	r3, #0
	subne	r3, r3, #1
	ldreq	r2, [fp, #-296]
	str	r3, [r2, #60]
	ldr	r3, [fp, #-300]
	ldr	r2, [fp, #-296]
	ldr	r3, [r3, #2384]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r2, #56]
	ldrb	r3, [r1, #2219]	@ zero_extendqisi2
	add	r2, r4, #24576
	str	r2, [fp, #-328]
	mov	r7, r2
	strb	r3, [r6, #64]
	ldrb	r3, [r1, #2221]	@ zero_extendqisi2
	strb	r3, [r6, #65]
	ldr	r3, [r1, #2372]
	str	r3, [r6, #68]
	ldr	r3, [r1, #2376]
	str	r3, [r6, #72]
	ldr	r3, [r1, #2272]
	str	r3, [r6, #76]
	ldr	r3, [r5, #2656]
	str	r3, [r6, #80]
	ldr	r3, [r7, #2604]
	ldr	r0, [r5, #2656]
	ldr	r1, [r3, #240]
	bl	__aeabi_uidivmod
	str	r1, [r6, #84]
	ldr	r3, [r7, #2604]
	ldr	r0, [r5, #2656]
	ldr	r1, [r3, #240]
	bl	__aeabi_uidiv
	mov	r2, r7
	str	r0, [r6, #88]
	ldr	ip, [r7, #2608]
	ldr	r3, [r2, #2604]
	ldr	r7, [r5, #2656]
	ldrb	r2, [ip, #13]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L309
	ldr	r2, [ip, #72]
	ldr	r6, [ip, #68]
	cmp	r2, #0
	ldr	r9, [r3, #72]
	str	r2, [fp, #-304]
	sub	r2, r2, #1
	ldr	lr, [r3, #148]
	str	r2, [fp, #-312]
	sub	r2, r6, #1
	ldrb	r10, [ip, #15]	@ zero_extendqisi2
	str	r2, [fp, #-308]
	ble	.L314
	ldr	r3, [fp, #-304]
	add	r2, ip, #214
	sub	r1, fp, #216
	add	r0, r3, #107
	add	r0, ip, r0, lsl #1
.L313:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L313
.L314:
	cmp	r6, #0
	ble	.L312
	add	r3, r6, #87
	add	r2, ip, #174
	sub	r1, fp, #128
	add	ip, ip, r3, lsl #1
.L317:
	ldrsh	r3, [r2, #2]!
	cmp	r2, ip
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L317
.L312:
	mov	r5, #1
	mov	r0, r9
	mov	r5, r5, asl lr
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, r5
	mov	r8, r0
	mov	r0, r9
	bl	__aeabi_idivmod
	mov	r0, r7
	cmp	r1, #0
	addne	r8, r8, #1
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r0, r7
	mov	r5, r1
	mov	r1, r8
	bl	__aeabi_idiv
	cmp	r10, #0
	beq	.L454
	ldr	r3, [fp, #-312]
	cmp	r3, #0
	mov	r3, #0
	blt	.L374
	sub	r2, fp, #212
	mov	ip, r3
	mov	r7, r3
	mov	r9, r3
	mov	r8, r2
	str	r3, [fp, #-316]
	str	r3, [fp, #-312]
	str	r4, [fp, #-336]
.L320:
	ldr	r2, [fp, #-308]
	cmp	r2, #0
	blt	.L377
	ldr	r9, [r8]
	mov	lr, #0
	ldr	r3, [fp, #-316]
	mov	r1, lr
	add	r9, r9, #1
	sub	r4, fp, #128
	mov	r7, ip
	add	r10, r3, r9
	b	.L323
.L375:
	mov	r7, ip
.L323:
	ldr	r3, [r4, #4]!
	add	r1, r1, #1
	add	r3, r3, #1
	add	r2, r3, lr
	cmp	r5, r2
	mla	ip, r9, r3, ip
	bge	.L321
	cmp	r0, r10
	blt	.L434
.L321:
	cmp	r1, r6
	mov	lr, r2
	bne	.L375
.L326:
	add	r1, r2, r3
	cmp	r5, r1
	blt	.L455
.L376:
	ldr	r1, [fp, #-312]
	add	r8, r8, #4
	ldr	lr, [fp, #-304]
	add	r1, r1, #1
	str	r10, [fp, #-316]
	cmp	r1, lr
	str	r1, [fp, #-312]
	bne	.L320
.L437:
	rsb	r0, r10, r0
	ldr	r4, [fp, #-336]
	mul	r3, r0, r3
.L318:
	rsb	r2, r2, r5
	add	r3, r2, r3
	add	r7, r3, r7
.L309:
	ldr	r2, [fp, #-296]
	ldr	r1, [fp, #-300]
	str	r7, [r2, #92]
	ldr	r3, [r1, #2336]
	str	r3, [r2, #96]
	ldr	r3, [r1, #2340]
	str	r3, [r2, #100]
	ldr	r3, [r1, #2348]
	str	r3, [r2, #104]
	ldr	r3, [r1, #2344]
	str	r3, [r2, #108]
	ldrb	r3, [r1, #2218]	@ zero_extendqisi2
	strb	r3, [r2, #112]
	ldrb	r3, [r1, #2217]	@ zero_extendqisi2
	strb	r3, [r2, #113]
	ldrb	r3, [r1, #2225]	@ zero_extendqisi2
	strb	r3, [r2, #114]
	ldrb	r3, [r1, #2226]	@ zero_extendqisi2
	strb	r3, [r2, #115]
	ldr	r3, [fp, #-328]
	ldr	r3, [r3, #2608]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L333
	ldr	r2, [r1, #2272]
	cmp	r2, #1
	beq	.L334
.L333:
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L456
.L438:
	add	r5, r4, #49152
.L336:
	ldr	r3, [fp, #-300]
	ldrb	r3, [r3, #2219]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L338
	ldr	r2, [fp, #-324]
	sub	r3, fp, #44
	add	r3, r3, r2, lsl #2
	ldr	r2, [fp, #-296]
	ldr	r3, [r3, #-244]
	str	r3, [r2, #564]
.L338:
	ldr	r3, [fp, #-320]
	mov	r1, #0
	ldr	r0, [fp, #-332]
	ldr	r2, [r4, #2316]
	ldr	r3, [r3, #4056]
	add	r3, r3, r0
	str	r2, [r3, #24]
	str	r1, [r4, #2316]
	ldrb	r0, [r5, #2421]	@ zero_extendqisi2
	cmp	r0, r1
	beq	.L428
	ldr	r0, [r4, #216]
	cmp	r0, #1
	beq	.L457
	ldr	lr, [fp, #-296]
	add	r1, r4, r0, lsl #3
	add	r1, r1, #54784
	add	r2, r0, #6848
	add	r2, r2, #11
	sub	r3, r0, #1
	ldr	ip, [lr, #92]
	add	r2, r4, r2, lsl #3
	sub	ip, ip, #1
	str	ip, [r1, #92]
	ldr	r1, [lr, #92]
	str	r1, [r2, #8]
.L340:
	ldr	r1, [r5, #2224]
	add	r3, r4, r3, lsl #3
	ldr	r2, [r5, #2220]
	add	r3, r3, #54784
	mla	r2, r1, r2, r2
	add	r2, r2, r1
	str	r2, [r3, #108]
	ldr	r3, [fp, #-296]
	ldr	r6, [r3, #92]
	sub	r6, r6, #1
	cmp	r6, #36864
	movcs	r0, #0
	bcs	.L428
	ldr	r3, [fp, #-328]
	ldr	r2, [r3, #2608]
	ldr	r1, [r3, #2604]
	ldrb	r3, [r2, #13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L341
	ldr	r3, [r2, #72]
	ldr	r4, [r1, #72]
	cmp	r3, #0
	ldr	r1, [r1, #148]
	str	r3, [fp, #-300]
	ldr	r7, [r2, #68]
	ble	.L346
	ldr	r3, [fp, #-300]
	add	r0, r2, #214
	sub	ip, fp, #216
	add	lr, r3, #107
	add	lr, r2, lr, lsl #1
.L345:
	ldrsh	r3, [r0, #2]!
	cmp	r0, lr
	sub	r3, r3, #1
	str	r3, [ip, #4]!
	bne	.L345
.L346:
	cmp	r7, #0
	ble	.L344
	add	r3, r7, #87
	add	r0, r2, #174
	sub	ip, fp, #128
	add	r2, r2, r3, lsl #1
.L349:
	ldrsh	r3, [r0, #2]!
	cmp	r0, r2
	sub	r3, r3, #1
	str	r3, [ip, #4]!
	bne	.L349
.L344:
	mov	r5, #1
	mov	r0, r4
	mov	r5, r5, asl r1
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, r5
	mov	r8, r0
	mov	r0, r4
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-300]
	cmp	r1, #0
	addne	r8, r8, #1
	cmp	r3, #0
	str	r8, [fp, #-308]
	ble	.L348
	mov	r10, #0
	ldr	r2, [fp, #-124]
	sub	r8, fp, #212
	mov	r9, r10
	mov	r3, r10
	mov	lr, r10
	mov	ip, r10
	mov	r4, r10
	add	r2, r2, #1
	str	r2, [fp, #-304]
.L350:
	cmp	r7, #0
	ble	.L386
	ldr	ip, [r8]
	ldr	r4, [fp, #-304]
	add	ip, ip, #1
	mla	r1, ip, r4, r3
	cmp	r6, r1
	blt	.L387
	mov	r5, #0
	mov	lr, r3
	mov	r2, r5
	mov	r3, r1
	sub	r0, fp, #124
	b	.L355
.L352:
	ldr	r4, [r0, #4]!
	mov	lr, r3
	add	r4, r4, #1
	mla	r1, ip, r4, r3
	cmp	r6, r1
	blt	.L353
	mov	r3, r1
.L355:
	add	r2, r2, #1
	add	r5, r5, r4
	cmp	r2, r7
	bne	.L352
.L354:
	cmp	r6, r3
	blt	.L385
	ldr	r2, [fp, #-300]
	add	r9, r9, #1
	add	r10, r10, ip
	add	r8, r8, #4
	cmp	r9, r2
	bne	.L350
.L385:
	mov	r3, lr
.L353:
	cmp	r4, #0
	beq	.L348
	rsb	r6, r3, r6
	mov	r1, r4
	mov	r0, r6
	bl	__aeabi_idivmod
	mov	r0, r6
	add	r6, r1, r5
	mov	r1, r4
	bl	__aeabi_idiv
	ldr	r3, [fp, #-308]
	add	r0, r10, r0
	mla	r6, r0, r3, r6
.L341:
	ldr	r3, [fp, #-296]
	mov	r0, #0
	str	r6, [r3, #568]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L362:
	mov	r2, r3
.L270:
	ldr	r3, .L460
	mov	r0, #0
	ldr	r1, .L460+4
	ldr	r3, [r3, #68]
	blx	r3
.L267:
	ldr	r1, [r4, #208]
	mvn	r0, #0
	ldr	r2, [r4, #172]
.L439:
	ldr	r3, [r4, #216]
	add	r1, r1, r0
	add	r2, r2, r0
	str	r1, [r4, #208]
	add	r3, r3, r0
	str	r2, [r4, #172]
	str	r3, [r4, #216]
.L428:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L449:
	mov	r2, r3
.L271:
	ldr	r3, .L460
	mov	r0, #0
	ldr	r1, .L460+8
	ldr	r3, [r3, #68]
	blx	r3
	b	.L267
.L434:
	ldr	r4, [fp, #-336]
.L361:
	ldr	r2, [fp, #-316]
	rsb	r0, r2, r0
	mov	r2, lr
	mul	r3, r0, r3
	b	.L318
.L455:
	cmp	r0, r10
	bge	.L376
.L440:
	ldr	r4, [fp, #-336]
	mov	lr, r2
	b	.L361
.L371:
	mov	r1, #0
	b	.L297
.L453:
	ldrb	r3, [r1, #2223]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L303
	ldr	r3, [r1, #2324]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #436]
	str	r3, [fp, #-324]
	b	.L304
.L303:
	ldr	r3, [fp, #-300]
	ldr	r2, [fp, #-296]
	ldr	r3, [r3, #2324]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #372]
	str	r3, [fp, #-324]
	b	.L304
.L454:
	ldr	r3, [fp, #-312]
	cmp	r3, #0
	mov	r3, r10
	blt	.L374
	sub	r2, fp, #212
	str	r10, [fp, #-316]
	str	r10, [fp, #-312]
	mov	ip, r10
	mov	r8, r2
	ldr	r2, [fp, #-308]
	mov	r7, r10
	mov	r9, r10
	cmp	r2, #0
	str	r4, [fp, #-336]
	blt	.L380
.L459:
	ldr	r9, [r8]
	mov	lr, #0
	ldr	r3, [fp, #-316]
	mov	r1, lr
	add	r9, r9, #1
	sub	r4, fp, #128
	mov	r7, ip
	add	r10, r3, r9
	b	.L329
.L378:
	mov	r7, ip
.L329:
	ldr	r3, [r4, #4]!
	add	r1, r1, #1
	add	r3, r3, #1
	add	r2, r3, lr
	cmp	r5, r2
	mla	ip, r9, r3, ip
	bge	.L327
	cmp	r0, r10
	blt	.L434
.L327:
	cmp	r1, r6
	mov	lr, r2
	bne	.L378
	add	r1, r2, r3
	cmp	r5, r1
	blt	.L458
.L379:
	ldr	r1, [fp, #-312]
	add	r8, r8, #4
	ldr	lr, [fp, #-304]
	add	r1, r1, #1
	str	r10, [fp, #-316]
	cmp	r1, lr
	str	r1, [fp, #-312]
	beq	.L437
	ldr	r2, [fp, #-308]
	cmp	r2, #0
	bge	.L459
.L380:
	ldr	r2, [fp, #-316]
	add	r10, r2, r9
	mov	r2, #0
	add	r1, r2, r3
	cmp	r5, r1
	bge	.L379
.L458:
	cmp	r0, r10
	bge	.L379
	b	.L440
.L452:
	ldr	r3, .L460
	add	r1, r4, #43520
	add	r0, r4, #47104
	add	r1, r1, #16
	movw	r2, #3732
	add	r0, r0, #164
	ldr	r3, [r3, #52]
	blx	r3
	b	.L289
.L456:
	ldr	r3, [fp, #-300]
	ldr	r3, [r3, #2272]
	cmp	r3, #0
	bne	.L438
.L334:
	ldr	r8, [fp, #-300]
	add	r5, r4, #49152
	ldr	r7, [fp, #-296]
	add	r1, r4, #49664
	ldr	r3, .L460
	add	r1, r1, #232
	ldr	r0, [r8, #3804]
	mov	r2, #64
	ldr	r6, .L460
	ldr	r3, [r3, #52]
	str	r0, [r7, #580]
	add	r0, r7, #588
	ldr	ip, [r5, #740]
	str	ip, [r7, #584]
	blx	r3
	add	r1, r4, #48896
	add	r1, r1, #164
	ldr	r3, [r6, #52]
	mov	r2, #64
	add	r0, r7, #716
	blx	r3
	add	r1, r4, #49920
	add	r1, r1, #40
	ldr	r3, [r6, #52]
	mov	r2, #128
	add	r0, r7, #844
	blx	r3
	add	r1, r4, #49920
	add	r0, r7, #1088
	ldr	r3, [r6, #52]
	add	r1, r1, #168
	add	r0, r0, #12
	mov	r2, #128
	blx	r3
	ldr	r3, [r8, #2272]
	cmp	r3, #0
	bne	.L336
	ldr	r7, [fp, #-296]
	add	r1, r4, #50176
	ldr	r3, [r6, #52]
	add	r1, r1, #40
	mov	r2, #64
	add	r0, r7, #652
	blx	r3
	add	r1, r4, #49408
	ldr	r3, [r6, #52]
	add	r1, r1, #164
	mov	r2, #64
	add	r0, r7, #780
	blx	r3
	add	r1, r4, #50176
	ldr	r3, [r6, #52]
	add	r1, r1, #104
	mov	r2, #128
	add	r0, r7, #972
	blx	r3
	add	r1, r4, #50176
	add	r0, r7, #1216
	ldr	r3, [r6, #52]
	add	r1, r1, #232
	mov	r2, #128
	add	r0, r0, #12
	blx	r3
	b	.L336
.L377:
	ldr	r2, [fp, #-316]
	add	r10, r2, r9
	mov	r2, #0
	b	.L326
.L457:
	ldr	r3, [fp, #-296]
	ldr	r2, [r3, #92]
	mov	r3, r1
	ldr	r1, [fp, #-320]
	str	r2, [r1, #1640]
	b	.L340
.L450:
	mov	r2, r3
.L278:
	ldr	r3, .L460
	mov	r0, #0
	ldr	r1, .L460+12
	ldr	r3, [r3, #68]
	blx	r3
	b	.L267
.L364:
	mov	r2, r3
.L277:
	ldr	r3, .L460
	mov	r0, #0
	ldr	r1, .L460+16
	ldr	r3, [r3, #68]
	blx	r3
	b	.L267
.L292:
	ldr	r3, [fp, #-300]
	ldr	r3, [r3, #2376]
	cmp	r3, #0
	bne	.L359
	b	.L436
.L386:
	mov	r5, #0
	b	.L354
.L387:
	ldr	r4, [fp, #-304]
	mov	r5, #0
	b	.L353
.L451:
	ldr	ip, .L460
	mov	r2, r0
	ldr	r1, .L460+20
	mov	r0, #1
	ldr	r5, [ip, #68]
	blx	r5
	ldr	r1, [r4, #208]
	ldr	r2, [r4, #172]
	mvn	r0, #0
	b	.L439
.L374:
	mov	r2, r3
	mov	r7, r3
	b	.L318
.L448:
	ldr	ip, .L460
	mov	r2, r0
	mov	r3, #17
	ldr	r1, .L460+24
	mov	r0, #0
	ldr	r5, [ip, #68]
	blx	r5
	b	.L267
.L268:
	ldr	lr, .L460
	mov	r2, ip
	mov	r3, #17
	ldr	r1, .L460+28
	mov	r0, #0
	ldr	r5, [lr, #68]
	blx	r5
	b	.L267
.L447:
	ldr	ip, .L460
	movw	r3, #6410
	ldr	r2, .L460+32
	mov	r0, #1
	ldr	r1, .L460+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L428
.L348:
	ldr	r3, .L460
	mov	r0, #1
	ldr	r1, .L460+40
	mvn	r6, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L341
.L461:
	.align	2
.L460:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LC49
	.word	.LC51
	.word	.LC50
	.word	.LC52
	.word	.LC46
	.word	.LC47
	.word	.LANCHOR0+100
	.word	.LC36
	.word	.LC53
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
	.global	HEVC_DecList
	.type	HEVC_DecList, %function
HEVC_DecList:
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
	UNWIND(.pad #164)
	sub	sp, sp, #164
	subs	r9, r0, #0
	beq	.L553
	add	r3, r9, #40960
	str	r3, [fp, #-192]
	ldr	r3, [r3, #2636]
	cmp	r3, #2
	beq	.L554
	ldr	r3, .L561
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #180
	ldr	r3, [r3, #48]
	blx	r3
	ldr	ip, [r9, #2504]
	cmp	ip, #0
	beq	.L518
	mov	r4, #0
	add	r1, r9, #2576
	mov	r3, r4
	b	.L470
.L469:
	cmp	r3, ip
	beq	.L468
.L470:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #1
	bne	.L469
	ldr	r0, [r2, #52]
	cmp	r0, #0
	bne	.L469
	ldr	r0, [r2, #56]
	cmp	r0, #1
	subeq	r0, fp, #44
	addeq	r2, r2, #36
	addeq	r0, r0, r4, lsl #2
	addeq	r4, r4, #1
	streq	r2, [r0, #-136]
	cmp	r3, ip
	bne	.L470
.L468:
	ldr	ip, [r9, #2508]
	cmp	ip, #0
	beq	.L519
	add	r1, r9, #2640
	mov	r5, r4
	add	r1, r1, #4
	mov	r3, #0
	b	.L473
.L472:
	cmp	r3, ip
	beq	.L555
.L473:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #1
	bne	.L472
	ldr	r0, [r2, #52]
	cmp	r0, #0
	bne	.L472
	ldr	r0, [r2, #56]
	cmp	r0, #1
	subeq	r0, fp, #44
	addeq	r2, r2, #36
	addeq	r0, r0, r5, lsl #2
	addeq	r5, r5, #1
	streq	r2, [r0, #-136]
	cmp	r3, ip
	bne	.L473
.L555:
	rsb	ip, r4, r5
.L471:
	ldr	lr, [r9, #2500]
	cmp	lr, #0
	beq	.L520
	add	r0, r9, #2704
	mov	r3, r5
	add	r0, r0, #8
	mov	r2, #0
	b	.L476
.L475:
	cmp	r2, lr
	beq	.L556
.L476:
	ldr	r1, [r0, #4]!
	add	r2, r2, #1
	ldrb	r6, [r1, #1]	@ zero_extendqisi2
	cmp	r6, #1
	bne	.L475
	ldr	r6, [r1, #52]
	cmp	r6, #1
	bne	.L475
	ldr	r6, [r1, #56]
	sub	r7, fp, #44
	add	r7, r7, r3, lsl #2
	add	r1, r1, #36
	cmp	r6, #0
	addeq	r3, r3, #1
	streq	r1, [r7, #-136]
	cmp	r2, lr
	bne	.L476
.L556:
	rsb	lr, r4, r3
	rsb	lr, ip, lr
.L474:
	cmp	r3, #0
	ldr	r2, [fp, #-192]
	beq	.L557
	ldr	r2, [r2, #2636]
	cmp	r2, #0
	str	r2, [fp, #-184]
	bne	.L480
	cmp	ip, #0
	beq	.L481
	sub	r2, fp, #180
	sub	r1, fp, #116
	add	r0, r2, r4, lsl #2
	ldr	r2, [fp, #-184]
.L482:
	add	r2, r2, #1
	ldr	r6, [r0], #4
	cmp	r2, ip
	str	r6, [r1, #4]!
	bne	.L482
.L481:
	cmp	r4, #0
	beq	.L483
	add	r1, ip, #16
	sub	r0, fp, #180
	mov	r2, #0
	add	r1, r0, r1, lsl #2
.L484:
	add	r2, r2, #1
	ldr	r6, [r0], #4
	cmp	r2, r4
	str	r6, [r1, #4]!
	bne	.L484
	add	ip, ip, r2
.L483:
	cmp	lr, #0
	beq	.L485
	add	r1, ip, #16
	sub	r0, fp, #180
	sub	r2, fp, #180
	add	r1, r0, r1, lsl #2
	add	r5, r2, r5, lsl #2
	mov	r2, #0
.L486:
	add	r2, r2, #1
	ldr	r0, [r5], #4
	cmp	r2, lr
	str	r0, [r1, #4]!
	bne	.L486
.L485:
	ldr	r2, [fp, #-192]
	ldr	r4, [r2, #2744]
	ldr	r5, [r2, #2748]
	cmp	r4, #0
	str	r4, [r2, #2736]
	str	r5, [r2, #2740]
	bne	.L515
	b	.L490
.L554:
	ldr	r3, [fp, #-192]
	mov	r0, #0
	str	r0, [r3, #2736]
	str	r0, [r3, #2740]
.L549:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L480:
	ldr	r2, [fp, #-192]
	ldr	r4, [r2, #2744]
	ldr	r5, [r2, #2748]
	cmp	r4, #0
	str	r4, [r2, #2736]
	str	r5, [r2, #2740]
	beq	.L496
.L515:
	add	r2, r9, #45056
	add	r8, r9, #2304
	add	r7, r9, #46848
	add	r8, r8, #12
	ldrb	r10, [r2, #1952]	@ zero_extendqisi2
	add	r7, r7, #164
	str	r5, [fp, #-188]
	mov	r6, #0
	mov	r5, r10
	mov	r10, r4
	mov	r4, r3
.L489:
	cmp	r5, #0
	mov	r1, r4
	mov	r0, r6
	ldrne	r1, [r7]
	bne	.L488
	bl	__aeabi_uidivmod
.L488:
	sub	r3, fp, #44
	add	r6, r6, #1
	add	r1, r3, r1, lsl #2
	cmp	r6, r10
	add	r7, r7, #4
	ldr	r2, [r1, #-136]
	str	r2, [r8, #4]!
	bcc	.L489
	ldr	r2, [fp, #-184]
	mov	r3, r4
	ldr	r5, [fp, #-188]
	cmp	r2, #0
	bne	.L551
.L490:
	cmp	r5, #0
	beq	.L492
	add	r2, r9, #45056
	add	r6, r9, #47104
	add	r6, r6, #36
	add	r7, r9, #2384
	ldrb	r8, [r2, #1953]	@ zero_extendqisi2
	mov	r4, #0
	mov	r10, r3
.L495:
	cmp	r8, #0
	mov	r1, r10
	mov	r0, r4
	ldrne	r1, [r6]
	bne	.L494
	bl	__aeabi_uidivmod
.L494:
	sub	r3, fp, #44
	add	r4, r4, #1
	add	r1, r3, r1, lsl #2
	cmp	r4, r5
	add	r6, r6, #4
	ldr	r3, [r1, #-68]
	str	r3, [r7, #4]!
	bne	.L495
.L551:
	ldr	r3, [fp, #-192]
	ldr	r4, [r3, #2736]
	ldr	r5, [r3, #2740]
	ldr	r3, [r3, #2636]
	str	r3, [fp, #-184]
.L491:
	cmp	r4, #16
	bhi	.L499
.L496:
	add	r3, r4, #576
	add	r1, r9, #2384
	add	r3, r3, #3
	add	r3, r9, r3, lsl #2
.L498:
	ldr	r2, [r9, #2320]
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L498
.L499:
	cmp	r5, #16
	bhi	.L479
	add	r3, r5, #596
	add	r1, r9, #2448
	add	r1, r1, #4
	add	r3, r9, r3, lsl #2
.L500:
	ldr	r2, [r9, #2388]
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L500
.L479:
	ldr	r3, [fp, #-184]
	cmp	r3, #1
	beq	.L503
	cmp	r3, #2
	beq	.L523
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [fp, #-184]
	beq	.L503
	ldr	r2, .L561
	mov	r0, #1
	ldr	r3, [fp, #-184]
	ldr	r1, .L561+4
	ldr	r4, [r2, #68]
	ldr	r2, .L561+8
	blx	r4
.L502:
	ldr	r3, .L561
	mov	r0, #1
	ldr	r1, .L561+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L504:
	ldr	r3, [r9, #2308]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L512
	mov	r3, #1
	str	r3, [r7]
	ldr	r3, [fp, #-192]
	ldr	r3, [r3, #2068]
	add	r3, r3, #36
	str	r3, [r8]
.L512:
	ldr	r3, [fp, #-184]
	add	r10, r10, #1
	add	r8, r8, #68
	cmp	r10, r3
	bcc	.L514
.L523:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L503:
	add	r3, r9, #43520
	add	r8, r9, #2320
	add	r3, r3, #172
	mov	r10, #0
	mov	r7, r3
.L514:
	ldr	r2, [r7, #4]!
	cmp	r2, #0
	beq	.L504
	ldr	r1, [r8]
	cmp	r1, #0
	bne	.L521
	mov	r0, r8
	mov	r3, r1
	b	.L506
.L508:
	ldr	r5, [r0, #4]!
	cmp	r5, #0
	bne	.L558
.L506:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L508
	mov	r3, #255
	str	r3, [fp, #-188]
.L507:
	ldr	r3, [r9, #2308]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L509
	ldr	r3, [fp, #-192]
	ldr	r5, [r3, #2068]
	add	r5, r5, #36
.L505:
	mov	r3, r1
	mov	r6, r8
	mov	r4, #0
	b	.L517
.L511:
	ldr	r3, [r6, #4]!
.L517:
	cmp	r3, #0
	beq	.L559
.L510:
	add	r4, r4, #1
	cmp	r4, r2
	bcc	.L511
	b	.L512
.L559:
	ldr	r3, .L561
	mov	r0, #1
	ldrsb	r2, [fp, #-188]
	str	r4, [sp]
	ldr	r3, [r3, #68]
	ldr	r1, .L561+16
	str	r2, [sp, #4]
	mov	ip, r3
	ldr	r2, .L561+8
	mov	r3, r10
	blx	ip
	str	r5, [r6]
	ldr	r2, [r7]
	b	.L510
.L558:
	uxtb	r3, r3
	str	r3, [fp, #-188]
	cmp	r3, #255
	bne	.L505
	b	.L507
.L557:
	str	r3, [r2, #2736]
	mov	r1, r3
	str	r3, [r2, #2740]
	add	r0, r9, #2320
	ldr	r3, .L561
	mov	r2, #136
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r9, #2308]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	beq	.L560
	ldr	r3, [fp, #-192]
	ldr	r3, [r3, #2636]
	str	r3, [fp, #-184]
	b	.L479
.L521:
	mov	r3, #0
	mov	r5, r1
	str	r3, [fp, #-188]
	b	.L505
.L509:
	ldr	r2, .L561
	mov	r3, r10
	ldr	r1, .L561+20
	mov	r0, #1
	ldr	r4, [r2, #68]
	ldr	r2, .L561+8
	blx	r4
	b	.L502
.L518:
	mov	r4, ip
	b	.L468
.L519:
	mov	r5, r4
	b	.L471
.L520:
	mov	r3, r5
	b	.L474
.L560:
	ldr	r1, [fp, #-192]
	mov	r2, #1
	ldr	r3, [r1, #2068]
	str	r2, [r1, #2736]
	add	r3, r3, #36
	str	r3, [r9, #2320]
	ldr	r3, [r1, #2636]
	str	r3, [fp, #-184]
	b	.L479
.L492:
	ldr	r3, .L561
	add	r0, r9, #2384
	mov	r2, #68
	add	r0, r0, #4
	add	r1, r9, #2320
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-192]
	ldr	r5, [r3, #2736]
	ldr	r2, [r3, #2636]
	str	r5, [r3, #2740]
	mov	r4, r5
	str	r2, [fp, #-184]
	b	.L491
.L553:
	ldr	ip, .L561
	movw	r3, #7541
	ldr	r2, .L561+24
	mov	r0, #1
	ldr	r1, .L561+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L549
.L562:
	.align	2
.L561:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC54
	.word	.LANCHOR0+136
	.word	.LC57
	.word	.LC56
	.word	.LC55
	.word	.LANCHOR0+120
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecList, .-HEVC_DecList
	.align	2
	.global	HEVC_RemoveApcStore
	.type	HEVC_RemoveApcStore, %function
HEVC_RemoveApcStore:
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
	beq	.L569
	add	r5, r4, r1, lsl #2
	ldr	r2, [r5, #2512]
	ldr	r3, [r2, #28]
	cmp	r3, #16
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r3, r3, #696
	mov	ip, #0
	add	r3, r3, #2
	ldr	lr, .L570
	ldr	r1, .L570+4
	mov	r0, #13
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #28]
	ldr	r6, [lr, #68]
	add	r3, r3, #712
	add	r3, r3, #2
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #28]
	add	r3, r3, #728
	add	r3, r3, #2
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #24]
	add	r3, r3, #524
	add	r3, r4, r3, lsl #2
	str	ip, [r3, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	blx	r6
	ldr	r3, [r5, #2512]
	mov	r2, #16
	str	r2, [r3, #28]
	ldr	r3, [r4, #2788]
	sub	r3, r3, #1
	str	r3, [r4, #2788]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L569:
	ldr	ip, .L570
	movw	r3, #7902
	ldr	r2, .L570+8
	mov	r0, #1
	ldr	r1, .L570+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L571:
	.align	2
.L570:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC58
	.word	.LANCHOR0+152
	.word	.LC36
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
	subs	r6, r0, #0
	beq	.L573
	ldr	r2, [r6, #2492]
	cmp	r2, #0
	beq	.L581
	add	r5, r6, #2496
	mov	r4, #0
	add	r5, r5, #12
	b	.L577
.L576:
	add	r4, r4, #1
	cmp	r4, r2
	bcs	.L582
.L577:
	ldr	r3, [r5, #4]!
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L576
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_RemoveApcStore
	ldr	r2, [r6, #2492]
	add	r4, r4, #1
	cmp	r4, r2
	bcc	.L577
.L582:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L581:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L573:
	ldr	ip, .L583
	movw	r3, #7956
	ldr	r2, .L583+4
	mov	r0, #1
	ldr	r1, .L583+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L584:
	.align	2
.L583:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+172
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_RemoveUnusedApcStore, .-HEVC_RemoveUnusedApcStore
	.align	2
	.global	HEVC_ApplyReferencePictureSet
	.type	HEVC_ApplyReferencePictureSet, %function
HEVC_ApplyReferencePictureSet:
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
	subs	r9, r0, #0
	beq	.L623
	add	r3, r9, #40960
	ldr	r2, [r9, #2304]
	movw	r4, #2024
	str	r3, [fp, #-68]
	mov	r1, r3
	ldr	r3, [r9, #2300]
	ldr	r1, [r1, #2652]
	movw	ip, #15788
	ldr	lr, [r9, #2492]
	mov	r0, #1
	mla	r2, r4, r1, r2
	cmp	lr, #0
	ldr	r2, [r2, #32]
	mla	r3, ip, r2, r3
	ldr	r3, [r3, #128]
	mov	r3, r0, asl r3
	str	r3, [fp, #-48]
	beq	.L585
	add	r10, r9, #2512
	add	r7, r9, #45056
	add	r3, r9, #46848
	mov	r2, #0
	add	r3, r3, #28
	str	r2, [fp, #-60]
	str	r3, [fp, #-72]
	str	r0, [fp, #-64]
	str	r9, [fp, #-56]
.L604:
	ldr	r3, [r7, #1768]
	ldr	r1, [r7, #1764]
	ldr	r2, [r7, #1772]
	add	r3, r3, r1
	ldr	r5, [r10]
	cmp	r3, r2
	mov	r8, r3
	movcs	r4, #0
	ldrcs	r2, [r5, #12]
	bcs	.L590
	add	r6, r3, #11712
	ldr	r3, [fp, #-56]
	add	r6, r6, #24
	ldr	r9, [r5, #12]
	mov	r4, #0
	add	r6, r3, r6, lsl #2
.L596:
	ldr	r3, [r6, #-1884]
	cmp	r3, #0
	ldr	r3, [r5, #52]
	beq	.L591
	cmp	r3, #0
	beq	.L592
	ldr	r3, [r6]
	cmp	r3, r9
	beq	.L622
.L592:
	cmp	r4, #0
	bne	.L609
	ldr	r1, [r6]
	mov	r4, r9
	b	.L606
.L591:
	cmp	r3, #0
	beq	.L594
	ldr	r1, [fp, #-48]
	mov	r0, r9
	bl	__aeabi_idivmod
	ldr	r0, [r6]
	str	r1, [fp, #-52]
	ldr	r1, [fp, #-48]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-52]
	cmp	r3, r1
	beq	.L622
.L594:
	cmp	r4, #0
	bne	.L609
	ldr	r3, [r6]
	mov	r0, r9
	ldr	r1, [fp, #-48]
	str	r3, [fp, #-52]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-52]
	mov	r0, r3
	mov	r4, r1
	ldr	r1, [fp, #-48]
	bl	__aeabi_idivmod
.L606:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	rsb	r4, r1, r4
	clz	r4, r4
	cmp	r3, #0
	mov	r4, r4, lsr #5
	moveq	r4, #0
	cmp	r4, #0
	bne	.L624
.L609:
	mov	r0, r9
.L595:
	ldr	r3, [r7, #1772]
	add	r8, r8, #1
	add	r6, r6, #4
	mov	r9, r0
	cmp	r8, r3
	bcc	.L596
	ldr	r3, [r7, #1768]
	mov	r2, r0
	ldr	r1, [r7, #1764]
	add	r3, r3, r1
.L590:
	cmp	r3, #0
	ldr	r3, [fp, #-68]
	ldrne	r8, [fp, #-72]
	movne	r6, #0
	ldr	r0, [r3, #2624]
	beq	.L598
.L600:
	ldr	r3, [r5, #52]
	add	r6, r6, #1
	cmp	r3, #0
	bne	.L599
	ldr	r3, [r8]
	add	r3, r0, r3
	cmp	r3, r2
	beq	.L625
.L599:
	ldr	r3, [r7, #1768]
	add	r8, r8, #4
	ldr	r1, [r7, #1764]
	add	r3, r3, r1
	cmp	r6, r3
	bcc	.L600
.L598:
	eor	r4, r4, #1
	cmp	r2, r0
	moveq	r2, #0
	andne	r2, r4, #1
	cmp	r2, #0
	beq	.L602
	mov	r3, #0
	strb	r3, [r5, #1]
	ldr	r3, [r10]
	mov	r2, #0
	str	r2, [r3, #52]
	ldr	r3, [r10]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	beq	.L602
	ldr	r1, [r3, #32]
	mov	r2, #0
	ldr	r3, [fp, #-56]
	ldr	r0, [r3, #244]
	bl	FSP_SetRef
.L602:
	ldr	r3, [fp, #-56]
	add	r10, r10, #4
	ldr	r2, [fp, #-60]
	ldr	r3, [r3, #2492]
	add	r2, r2, #1
	str	r2, [fp, #-60]
	cmp	r2, r3
	bcc	.L604
.L585:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L624:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, r2
	strb	r1, [r5, #1]
	ldr	r3, [r10]
	str	r1, [r3, #52]
	ldr	r3, [r10]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r10]
	ldr	r0, [r1, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r10]
	ldr	r0, [r5, #12]
	b	.L595
.L622:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, #1
	strb	r1, [r5, #1]
	ldr	r3, [r10]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r10]
	ldr	r0, [r1, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r10]
	ldr	r0, [r5, #12]
	b	.L595
.L625:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, r2
	strb	r1, [r5, #1]
	ldr	r3, [r10]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r10]
	ldr	r0, [r1, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r10]
	ldr	r3, [fp, #-68]
	ldr	r2, [r5, #12]
	ldr	r0, [r3, #2624]
	b	.L599
.L623:
	ldr	ip, .L626
	movw	r3, #8018
	ldr	r2, .L626+4
	mov	r0, #1
	ldr	r1, .L626+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	ip
.L627:
	.align	2
.L626:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+200
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ApplyReferencePictureSet, .-HEVC_ApplyReferencePictureSet
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
	subs	r4, r0, #0
	beq	.L629
	add	r9, r4, #45056
	ldr	r1, [r9, #1764]
	cmp	r1, #0
	moveq	r6, r1
	moveq	r5, r1
	beq	.L631
	add	r8, r4, #46848
	mov	r6, #0
	add	r10, r4, #40960
	mov	r5, r6
	mov	r7, r8
	add	r8, r8, #8
	add	r7, r7, #28
.L638:
	ldrb	r3, [r8, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L632
	ldr	lr, [r4, #2492]
	ldr	ip, [r10, #2624]
	ldr	r3, [r7]
	cmp	lr, #0
	add	ip, ip, r3
	beq	.L632
	ldr	r1, [r4, #2512]
	ldr	r3, [r1, #12]
	cmp	r3, ip
	addne	r2, r4, #2512
	movne	r3, #0
	bne	.L635
	b	.L687
.L637:
	ldr	r1, [r2, #4]!
	ldr	r0, [r1, #12]
	cmp	r0, ip
	beq	.L633
.L635:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L637
.L632:
	ldr	r1, [r9, #1764]
	add	r5, r5, #1
	add	r7, r7, #4
	cmp	r1, r5
	bhi	.L638
.L631:
	ldr	r2, [r4, #2488]
	str	r6, [r4, #2504]
	cmp	r2, r6
	addhi	r3, r6, #644
	movhi	r0, #0
	addhi	r3, r4, r3, lsl #2
	bls	.L643
.L642:
	add	r6, r6, #1
	str	r0, [r3, #4]!
	cmp	r6, r2
	bne	.L642
.L643:
	ldr	r7, [r9, #1768]
	add	r7, r1, r7
	cmp	r7, r5
	movls	r6, #0
	bls	.L641
	add	r8, r5, #11712
	add	r9, r5, #46848
	add	r8, r8, #7
	add	r9, r9, #8
	add	r9, r4, r9
	add	r10, r4, #40960
	add	r8, r4, r8, lsl #2
	mov	r6, #0
.L650:
	ldrb	r3, [r9, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L644
	ldr	lr, [r4, #2492]
	ldr	ip, [r10, #2624]
	ldr	r3, [r8]
	cmp	lr, #0
	add	ip, ip, r3
	beq	.L644
	ldr	r1, [r4, #2512]
	ldr	r3, [r1, #12]
	cmp	r3, ip
	addne	r2, r4, #2512
	movne	r3, #0
	bne	.L647
	b	.L688
.L649:
	ldr	r1, [r2, #4]!
	ldr	r0, [r1, #12]
	cmp	r0, ip
	beq	.L645
.L647:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L649
.L644:
	add	r5, r5, #1
	add	r8, r8, #4
	cmp	r7, r5
	bhi	.L650
.L691:
	ldr	r2, [r4, #2488]
.L641:
	cmp	r2, r6
	str	r6, [r4, #2508]
	bls	.L628
	add	r1, r6, #660
	mov	r3, #0
	add	r1, r1, #1
	add	r4, r4, r1, lsl #2
.L653:
	add	r6, r6, #1
	str	r3, [r4, #4]!
	cmp	r6, r2
	bne	.L653
.L628:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L687:
	mov	r3, #0
.L633:
	add	r3, r4, r3, lsl #2
	mov	r2, #1
	strb	r2, [r1, #1]
	ldr	r1, [r3, #2512]
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L689
.L636:
	mov	r2, #1
	str	r2, [r1, #56]
	ldr	r1, [r3, #2512]
	mov	r0, #0
	add	r2, r4, r6, lsl #2
	add	r6, r6, #1
	str	r0, [r1, #52]
	ldr	r3, [r3, #2512]
	str	r3, [r2, #2580]
	b	.L632
.L688:
	mov	r3, #0
.L645:
	add	r3, r4, r3, lsl #2
	mov	r2, #1
	strb	r2, [r1, #1]
	ldr	r1, [r3, #2512]
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L690
.L648:
	mov	r2, #1
	str	r2, [r1, #56]
	ldr	r1, [r3, #2512]
	add	r2, r6, #660
	mov	r0, #0
	add	r5, r5, #1
	add	r2, r2, #2
	cmp	r7, r5
	str	r0, [r1, #52]
	add	r6, r6, #1
	ldr	r3, [r3, #2512]
	add	r8, r8, #4
	str	r3, [r4, r2, asl #2]
	bhi	.L650
	b	.L691
.L689:
	ldr	r1, [r1, #32]
	ldr	r0, [r4, #244]
	str	r3, [fp, #-48]
	bl	FSP_SetRef
	ldr	r3, [fp, #-48]
	ldr	r1, [r3, #2512]
	b	.L636
.L690:
	ldr	r1, [r1, #32]
	ldr	r0, [r4, #244]
	str	r3, [fp, #-48]
	bl	FSP_SetRef
	ldr	r3, [fp, #-48]
	ldr	r1, [r3, #2512]
	b	.L648
.L629:
	ldr	ip, .L692
	movw	r3, #8661
	ldr	r2, .L692+4
	mov	r0, #1
	ldr	r1, .L692+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	ip
.L693:
	.align	2
.L692:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+232
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_UpdateReflist, .-HEVC_UpdateReflist
	.align	2
	.global	HEVC_UpdateLTReflist
	.type	HEVC_UpdateLTReflist, %function
HEVC_UpdateLTReflist:
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
	beq	.L714
	add	r3, r0, #40960
	ldr	r2, [r0, #2304]
	movw	ip, #2024
	add	r10, r0, #45056
	ldr	r3, [r3, #2652]
	movw	r4, #15788
	ldr	lr, [r0, #2300]
	mov	r1, #1
	mla	ip, ip, r3, r2
	ldr	r3, [r10, #1764]
	ldr	r2, [r10, #1768]
	add	r2, r3, r2
	ldr	r3, [r10, #1772]
	sub	r2, r2, #1
	ldr	ip, [ip, #32]
	sub	r9, r3, #1
	cmp	r9, r2
	mla	r2, r4, ip, lr
	ldr	r8, [r2, #128]
	mov	r8, r1, asl r8
	ble	.L707
	add	r7, r3, #11712
	add	r3, r3, #46848
	add	r7, r7, #23
	add	r3, r3, #9
	add	r3, r0, r3
	sub	r8, r8, #1
	add	r7, r0, r7, lsl #2
	mov	r6, #0
	str	r6, [fp, #-48]
	mov	r6, r3
	str	r1, [fp, #-52]
.L702:
	ldrb	r3, [r6, #-1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L697
	ldrb	r4, [r7, #-1884]	@ zero_extendqisi2
	ldr	lr, [r7]
	ldr	r5, [r0, #2492]
	cmp	r4, #0
	andeq	lr, lr, r8
	cmp	r5, #0
	ble	.L697
	add	r1, r0, #2496
	mov	r3, #0
	add	r1, r1, #12
	b	.L701
.L700:
	add	r3, r3, #1
	cmp	r3, r5
	beq	.L697
.L701:
	ldr	ip, [r1, #4]!
	cmp	r4, #0
	ldr	r2, [ip, #12]
	andeq	r2, r2, r8
	cmp	lr, r2
	bne	.L700
	ldr	r1, [fp, #-48]
	add	r3, r0, r3, lsl #2
	ldr	lr, [fp, #-52]
	add	r2, r0, r1, lsl #2
	add	r1, r1, #1
	strb	lr, [ip, #1]
	mov	ip, #0
	str	r1, [fp, #-48]
	ldr	r1, [r3, #2512]
	str	ip, [r1, #56]
	ldr	r1, [r3, #2512]
	str	lr, [r1, #52]
	ldr	r3, [r3, #2512]
	str	r3, [r2, #2716]
.L697:
	ldr	r3, [r10, #1764]
	sub	r9, r9, #1
	ldr	r2, [r10, #1768]
	sub	r7, r7, #4
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r9
	blt	.L702
	ldr	r6, [fp, #-48]
	mov	r2, r6
.L696:
	ldr	r3, [r0, #2488]
	str	r2, [r0, #2500]
	cmp	r3, r6
	ble	.L694
	add	r1, r6, #676
	mov	r2, #0
	add	r1, r1, #2
	add	r0, r0, r1, lsl #2
.L705:
	add	r6, r6, #1
	str	r2, [r0, #4]!
	cmp	r6, r3
	bne	.L705
.L694:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L707:
	mov	r2, #0
	mov	r6, r2
	b	.L696
.L714:
	ldr	ip, .L715
	movw	r3, #8759
	ldr	r2, .L715+4
	mov	r0, #1
	ldr	r1, .L715+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	ip
.L716:
	.align	2
.L715:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+252
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_UpdateLTReflist, .-HEVC_UpdateLTReflist
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
	subs	r6, r0, #0
	mov	r8, r1
	beq	.L728
	ldr	r0, [r6, #244]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L723
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	addne	r4, r0, #216
	addne	r5, r0, #232
	movne	r7, #0
	beq	.L729
.L722:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L721
	ldr	r0, [r6, #244]
	bl	FreeUsdByDec
	str	r7, [r4]
.L721:
	cmp	r4, r5
	bne	.L722
	ldr	r0, [r6, #244]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L729:
	ldr	r3, .L730
	mov	r0, #1
	ldr	r1, .L730+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L723:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L728:
	ldr	ip, .L730
	movw	r3, #9081
	ldr	r2, .L730+8
	mov	r0, #1
	ldr	r1, .L730+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L731:
	.align	2
.L730:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC59
	.word	.LANCHOR0+276
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DECRecycleImage, .-HEVC_DECRecycleImage
	.align	2
	.global	HEVC_CheckFrameStore
	.type	HEVC_CheckFrameStore, %function
HEVC_CheckFrameStore:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r1
	beq	.L753
	ldr	r0, [r0, #244]
	ldr	r1, [r1, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L735
	ldrsb	r2, [r0, #1]
	cmp	r2, #3
	cmpne	r2, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L754
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L740
	ldr	r2, [r4, #4]
	ldrb	r1, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L739
	cmp	r1, #1
	beq	.L739
.L750:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L754:
	ldr	r5, .L755
	mov	r0, #13
	ldr	r3, [r4, #32]
	ldr	r1, .L755+4
	str	r2, [sp]
	ldr	r2, .L755+8
	ldr	r6, [r5, #68]
	blx	r6
.L737:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L740
	ldr	r5, [r5, #68]
	mov	r0, #1
	ldr	r3, [r4, #12]
	ldr	r2, .L755+8
	ldr	r1, .L755+12
	blx	r5
	mvn	r0, #2
	b	.L750
.L735:
	ldr	r1, [r4, #32]
	mov	r2, r4
	ldr	r3, [r4, #12]
	mov	r0, #1
	ldr	r5, .L755
	str	r1, [sp, #4]
	ldr	ip, [r4, #8]
	ldr	r6, [r5, #68]
	ldr	r1, .L755+16
	str	ip, [sp]
	blx	r6
	b	.L737
.L753:
	ldr	ip, .L755
	movw	r3, #9191
	ldr	r2, .L755+8
	mov	r0, #1
	ldr	r1, .L755+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L750
.L739:
	ldr	ip, .L755
	mov	r3, r4
	str	r1, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	ldr	r1, .L755+24
	ldr	r4, [ip, #68]
	ldr	r2, .L755+8
	blx	r4
	mvn	r0, #0
	b	.L750
.L740:
	mov	r2, #1
	mov	r3, #2
	strb	r2, [r4, #2]
	mvn	r0, #2
	str	r3, [r4, #8]
	b	.L750
.L756:
	.align	2
.L755:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC60
	.word	.LANCHOR0+300
	.word	.LC62
	.word	.LC61
	.word	.LC36
	.word	.LC63
	UNWIND(.fnend)
	.size	HEVC_CheckFrameStore, .-HEVC_CheckFrameStore
	.align	2
	.global	HEVC_GetImagePara
	.type	HEVC_GetImagePara, %function
HEVC_GetImagePara:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r4, r1
	ldr	r3, [r1, #16]
	moveq	ip, #1
	movne	ip, #0
	beq	.L777
	ldr	r2, [r1, #232]
	add	lr, r0, #24576
	mov	r1, #25600
	str	r1, [r4, #260]
	bic	r2, r2, #16128
	bic	r2, r2, #3
	str	r2, [r4, #232]
	ldr	r1, [lr, #2600]
	add	r1, r1, #12288
	ldr	r1, [r1, #180]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	beq	.L759
	mov	ip, #256
	movt	ip, 1
	cmp	r1, ip
	movne	ip, #1
	bne	.L759
	add	r1, r0, #4096
	ldr	ip, [r1, #408]
	subs	ip, ip, #1
	movne	ip, #1
.L759:
	ldr	r1, [lr, #2604]
	ldrb	r1, [r1, #2633]	@ zero_extendqisi2
	cmp	r1, #0
	moveq	r1, #3072
	bne	.L778
.L760:
	ldr	lr, [r4, #4]
	and	r3, r3, #3
	orr	r3, r2, r3
	cmp	lr, #0
	orr	r3, r3, #8192
	orr	r3, r3, r1
	ldr	r1, [r4, #32]
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #232]
	ldrne	r3, [r4, #20]
	strne	r3, [r4, #272]
	ldr	r0, [r0, #244]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L780
	mov	r2, #504
	add	r1, r4, #72
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #17
	str	r3, [r5, #384]
	mov	r3, #1
	ldr	r2, [r4, #48]
	strb	r3, [r5, #379]
	cmp	r2, #0
	strb	r3, [r5, #377]
	moveq	r3, #0
	movne	r3, #4
	strb	r3, [r5, #372]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L778:
	ldr	r1, [r4, #576]
	cmp	r1, #1
	cmpne	r1, #11
	moveq	r1, #1024
	bne	.L779
	ldr	ip, [r4, #580]
	clz	ip, ip
	mov	ip, ip, lsr #5
	b	.L760
.L777:
	ldr	ip, .L780
	movw	r3, #9253
	ldr	r2, .L780+4
	mov	r0, #1
	ldr	r1, .L780+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	ip
.L779:
	ldr	ip, [r4, #580]
	bic	r1, r1, #8
	cmp	r1, #2
	clz	ip, ip
	moveq	r1, #2048
	movne	r1, #3072
	mov	ip, ip, lsr #5
	b	.L760
.L781:
	.align	2
.L780:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+324
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
	.align	2
	.type	HEVC_OutputCurrPic, %function
HEVC_OutputCurrPic:
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
	add	r6, r0, #40960
	add	r1, r0, #43008
	mov	r4, r0
	ldr	r5, [r6, #2068]
	mov	r2, #504
	ldr	r3, [r6, #2056]
	add	r1, r1, #24
	add	r0, r5, #72
	str	r3, [r5, #20]
	bl	memcpy
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_GetImagePara
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L804
	ldr	r2, [r5, #20]
	cmp	r2, #0
	str	r2, [r7, #200]
	bne	.L785
.L790:
	ldrb	r3, [r6, #2016]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L805
.L787:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	add	r3, r4, #50944
	ldr	r0, [r4, #244]
	add	r3, r3, #56
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #17
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L806
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #84]
	bcs	.L807
.L794:
	ldr	r2, [r4, #268]
	mov	r0, #0
	ldr	r3, [r4, #260]
	add	r2, r2, #1
	str	r2, [r4, #268]
	add	r3, r3, #1
	str	r3, [r4, #260]
.L784:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L785:
	ldr	r8, [r6, #2028]
	cmp	r8, #0
	beq	.L808
.L788:
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #4]
	cmp	r3, r2
	bcs	.L790
	ldr	r0, [r4, #244]
	mov	r2, #0
	ldr	r1, [r5, #32]
	bl	FSP_SetDisplay
	ldr	r2, [r4, #2308]
	ldr	ip, .L809
	mov	r0, #1
	ldr	r3, [r7, #200]
	ldr	r1, [r2, #4]
	ldr	r4, [ip, #68]
	ldr	r2, .L809+4
	str	r1, [sp]
	ldr	r1, .L809+8
	blx	r4
	mvn	r0, #0
	b	.L784
.L805:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetRef
	b	.L787
.L807:
	add	r1, r7, #84
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.isra.11.part.12
	b	.L794
.L808:
	ldr	r3, .L809
	mov	r0, #1
	ldr	r2, .L809+4
	ldr	r1, .L809+12
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L809+16
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L789
	mov	r3, r8
	mov	r2, r8
	mov	r1, #111
	ldr	r0, [r4, #244]
	blx	r9
.L789:
	ldr	r2, [r7, #200]
	cmp	r2, #0
	bne	.L788
	b	.L790
.L806:
	ldr	r3, .L809
	mov	r0, #1
	ldr	r2, .L809+4
	ldr	r1, .L809+20
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [r4, #244]
	ldr	r1, [r5, #32]
	mov	r2, #0
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L784
.L804:
	ldr	r3, .L809
	ldr	r2, .L809+4
	ldr	r1, .L809+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L784
.L810:
	.align	2
.L809:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+344
	.word	.LC67
	.word	.LC65
	.word	g_event_report
	.word	.LC66
	.word	.LC64
	UNWIND(.fnend)
	.size	HEVC_OutputCurrPic, .-HEVC_OutputCurrPic
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
	subs	r6, r0, #0
	beq	.L827
	add	r0, r6, #57088
	mov	r3, #0
	add	r5, r6, #40960
	add	r0, r0, #224
	mov	lr, r3
	strb	r3, [r5, #2017]
.L818:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	bne	.L814
	cmp	r0, #0
	beq	.L824
	ldr	ip, [r6, #2492]
	cmp	ip, #0
	beq	.L824
	ldr	r2, [r6, #2512]
	cmp	r2, r0
	beq	.L814
	add	r2, r6, #2512
	b	.L816
.L817:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L814
.L816:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L817
.L824:
	mov	r7, #584
	mov	r4, r0
	mla	r7, r7, lr, r6
	add	r0, r5, #2064
	mov	r3, #1
	mov	r2, #101
	strb	r3, [r5, #2017]
	add	r0, r0, #8
	add	r1, r7, #57344
	str	r2, [r5, #2056]
	add	r1, r1, #40
	mov	r2, #504
	bl	memcpy
	add	r2, r7, #57088
	str	r4, [r5, #2068]
	mov	r3, #0
	str	r3, [r5, #2272]
	str	r3, [r2, #244]
	strb	r3, [r2, #226]
	strb	r3, [r4]
	ldr	r2, [r5, #2068]
	str	r3, [r2, #52]
	ldr	r2, [r5, #2068]
	str	r3, [r2, #56]
	ldr	r2, [r5, #2068]
	str	r3, [r2, #8]
	ldrb	r1, [r5, #2017]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L822
	ldr	r0, [r6, #244]
	bl	FSP_NewLogicFs
	mov	r7, r0
	mov	r1, r0
	ldr	r0, [r6, #244]
	bl	FSP_GetLogicFs
	mvn	r3, r7
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r4, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L819
	ldr	r3, [r6, #2308]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L828
.L820:
	ldr	r8, .L829
	add	r1, r4, #8
	ldr	r0, [r5, #2068]
	mov	r2, #504
	ldr	r3, [r8, #52]
	add	r0, r0, #72
	blx	r3
	ldr	r1, [r5, #2068]
	add	r0, r6, #43008
	ldr	r3, [r8, #52]
	add	r1, r1, #72
	mov	r2, #504
	add	r0, r0, #24
	blx	r3
	ldr	r3, [r5, #2068]
	mov	r0, #0
	str	r7, [r3, #32]
	ldrsb	r3, [r4, #4]
	str	r3, [r5, #2052]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L814:
	add	lr, lr, #1
	add	r0, r0, #584
	cmp	lr, #20
	bne	.L818
.L822:
	ldr	r3, .L829
	mov	r0, #0
	ldr	r1, .L829+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L828:
	add	r3, r6, #24576
	ldr	r8, [r0, #200]
	ldr	r0, [r0, #112]
	ldr	r2, [r3, #2604]
	ldr	r3, [r2, #76]
	ldr	r2, [r2, #72]
	mul	r8, r8, r3
	str	r2, [r4, #172]
	str	r3, [r4, #176]
	add	r0, r8, r0
	str	r0, [r4, #116]
	bl	MEM_Phy2Vir
	ldr	r2, [r4, #96]
	ldr	r3, [r4, #128]
	add	r3, r8, r3
	add	r8, r8, r2
	ldr	r2, [r4, #200]
	str	r8, [r4, #100]
	str	r3, [r4, #132]
	add	r8, r8, r2
	str	r8, [r4, #108]
	str	r0, [r4, #44]
	mov	r0, r3
	bl	MEM_Phy2Vir
	str	r0, [r4, #60]
	b	.L820
.L819:
	ldr	r2, .L829
	mov	r0, r3
	strb	r3, [r5, #2017]
	ldr	r1, .L829+8
	ldr	r3, [r2, #68]
	blx	r3
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L827:
	ldr	ip, .L829
	movw	r3, #9402
	ldr	r2, .L829+12
	mov	r0, #1
	ldr	r1, .L829+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L830:
	.align	2
.L829:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC68
	.word	.LC69
	.word	.LANCHOR0+364
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
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
	subs	r7, r0, #0
	beq	.L847
	ldr	r0, [r7, #244]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L848
.L833:
	add	r5, r7, #57600
	add	r8, r7, #68608
	add	r5, r5, #8
	add	r8, r8, #680
	mov	r6, #0
.L836:
	sub	r4, r5, #16
	strb	r6, [r5, #-295]
	str	r6, [r5, #-292]
.L835:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L834
	ldr	r0, [r7, #244]
	bl	FreeUsdByDec
	str	r6, [r4]
.L834:
	cmp	r4, r5
	bne	.L835
	add	r5, r4, #584
	cmp	r5, r8
	bne	.L836
	ldr	r2, [r7, #180]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r3, #0
	add	r7, r7, #2096
	mov	r1, r3
.L839:
	add	r3, r3, #1
	str	r1, [r7, #4]!
	cmp	r3, r2
	bne	.L839
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L848:
	add	r0, r7, #50944
	add	r0, r0, #56
	bl	ResetVoQueue
	b	.L833
.L847:
	ldr	ip, .L849
	movw	r3, #9546
	ldr	r2, .L849+4
	mov	r0, #1
	ldr	r1, .L849+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L850:
	.align	2
.L849:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+388
	.word	.LC36
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L867
	add	r6, r5, r1, lsl #2
	mov	r7, #0
	ldr	r3, [r6, #2512]
	str	r7, [r3, #4]
	ldr	r3, [r6, #2512]
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L853
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L854
	ldr	r3, [r6, #2512]
	mov	r2, r7
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetDisplay
.L854:
	ldr	r3, [r6, #2512]
	mov	r2, #0
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
.L853:
	ldr	r1, [r5, #2492]
	sub	r1, r1, #1
	cmp	r4, r1
	addls	r3, r4, #628
	addls	r3, r5, r3, lsl #2
	bhi	.L858
.L857:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bls	.L857
.L858:
	add	r3, r1, #628
	mov	r2, #0
	str	r2, [r5, r3, asl #2]
	str	r1, [r5, #2492]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L867:
	ldr	ip, .L868
	movw	r3, #9655
	ldr	r2, .L868+4
	mov	r0, #1
	ldr	r1, .L868+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L869:
	.align	2
.L868:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+416
	.word	.LC36
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
	subs	r5, r0, #0
	beq	.L871
	ldr	r1, [r5, #2492]
	cmp	r1, #0
	beq	.L882
	mov	r6, #0
	mov	r4, r6
	mov	r7, r6
	b	.L875
.L874:
	add	r4, r4, #1
	cmp	r4, r1
	mov	r6, r4
	bcs	.L883
.L875:
	add	r3, r4, #628
	ldr	r3, [r5, r3, asl #2]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L874
	mov	r1, r6
	strb	r7, [r3]
	mov	r0, r5
	sub	r4, r4, #1
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	add	r4, r4, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r1, [r5, #2492]
	mov	r6, r4
	cmp	r4, r1
	bcc	.L875
.L883:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L882:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L871:
	ldr	ip, .L884
	movw	r3, #7982
	ldr	r2, .L884+4
	mov	r0, #1
	ldr	r1, .L884+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L885:
	.align	2
.L884:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+444
	.word	.LC36
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
	subs	r4, r0, #0
	beq	.L906
	ldr	r5, [r4, #2492]
	cmp	r5, #0
	beq	.L897
	mov	r6, #0
	mvn	r8, #0
	mov	r10, r6
	mov	r9, r6
	b	.L896
.L908:
	ldrsb	r2, [r0, #1]
	cmp	r2, #0
	cmpne	r2, #3
	ldr	r2, [r7, #2512]
	bne	.L892
	ldr	r0, [r2, #8]
	cmp	r0, #1
	beq	.L892
	str	r8, [r2, #32]
	mov	r3, #1
	ldr	r2, [r7, #2512]
	strb	r1, [r2, #1]
	ldr	r2, [r7, #2512]
	strb	r3, [r2, #2]
	ldr	r2, [r7, #2512]
.L892:
	ldr	r3, [r2]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	addne	r10, r10, #1
	beq	.L907
	add	r9, r9, #1
	cmp	r9, r5
	beq	.L889
.L896:
	add	r7, r4, r10, lsl #2
	ldr	r0, [r4, #244]
	ldr	r2, [r7, #2512]
	ldr	r1, [r2, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L890
	ldrsb	r1, [r0]
	cmp	r1, #0
	beq	.L908
	ldr	r2, [r7, #2512]
	b	.L892
.L890:
	ldr	r2, [r7, #2512]
	ldr	r1, [r2, #8]
	cmp	r1, #1
	beq	.L892
	str	r8, [r2, #32]
	mov	r3, #1
	ldr	r2, [r7, #2512]
	strb	r0, [r2, #1]
	ldr	r2, [r7, #2512]
	strb	r3, [r2, #2]
	ldr	r2, [r7, #2512]
	b	.L892
.L907:
	mov	r1, r10
	mov	r0, r4
	add	r9, r9, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	cmp	r9, r5
	mov	r6, #1
	bne	.L896
.L889:
	mov	r0, r6
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L897:
	mov	r6, r5
	b	.L889
.L906:
	ldr	ip, .L909
	movw	r3, #9593
	ldr	r2, .L909+4
	mov	r0, #1
	ldr	r1, .L909+8
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L910:
	.align	2
.L909:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+468
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_RemoveUnUsedFrameStore, .-HEVC_RemoveUnUsedFrameStore
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
	cmp	r0, #0
	beq	.L912
	ldr	r4, [r0, #2316]
	ldrb	lr, [r4, #1]	@ zero_extendqisi2
	cmp	lr, #0
	moveq	r1, lr
	beq	.L914
	mov	r3, #0
	mov	r2, r4
	mov	r1, r3
.L915:
	add	r3, r3, #1
	ldr	ip, [r2, #48]
	cmp	r3, lr
	add	r2, r2, #28
	add	r1, r1, ip
	bne	.L915
.L914:
	ldr	r2, [r0, #2292]
	mov	r3, lr, asl #5
	sub	lr, r3, lr, asl #2
	add	r4, r4, lr
	ldr	r3, [r2, #24]
	and	r3, r3, #7
	str	r3, [r4, #60]
	ldr	r2, [r0, #2316]
	ldr	r3, [r0, #2292]
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	ldr	ip, [r3, #24]
	mov	r3, lr, asl #5
	cmp	ip, #0
	sub	r3, r3, lr, asl #2
	add	r4, ip, #7
	add	r3, r2, r3
	movlt	ip, r4
	ldr	r2, [r3, #52]
	add	r2, r2, ip, asr #3
	rsb	r2, r1, r2
	str	r2, [r3, #64]
	ldr	ip, [r0, #2316]
	ldr	r3, [r0, #2292]
	ldrb	r2, [ip, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	mov	r3, r2, asl #5
	sub	r2, r3, r2, asl #2
	add	r2, ip, r2
	ldr	r3, [r2, #48]
	add	r3, r1, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [r2, #56]
	ldr	r2, [r0, #2316]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #64]
	ldr	r1, [r3, #60]
	and	r2, r2, #3
	add	r2, r1, r2, lsl #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2316]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #64]
	bic	r2, r2, #3
	str	r2, [r3, #64]
	ldr	r3, [r0, #2316]
	ldr	r2, [r3, #8]
	sub	ip, r2, #1
	cmp	ip, #1
	bhi	.L931
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	add	lr, r1, #1
	cmp	r2, lr
	movhi	r2, #1
	movls	r2, #0
	cmp	lr, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L917
	add	r1, r1, #2
	mov	ip, #0
.L918:
	sub	r2, r1, #1
	mov	lr, r2, asl #5
	sub	lr, lr, r2, asl #2
	add	r3, r3, lr
	str	ip, [r3, #60]
	ldr	r2, [r0, #2316]
	add	r2, r2, lr
	ldr	r3, [r2, #52]
	str	r3, [r2, #64]
	ldr	r2, [r0, #2316]
	add	r2, r2, lr
	ldr	r3, [r2, #48]
	mov	r3, r3, asl #3
	str	r3, [r2, #56]
	ldr	r3, [r0, #2316]
	add	r3, r3, lr
	ldr	r2, [r3, #64]
	ldr	r4, [r3, #60]
	and	r2, r2, #15
	add	r2, r4, r2, lsl #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2316]
	add	r3, r2, lr
	ldr	r2, [r3, #64]
	bic	r2, r2, #15
	str	r2, [r3, #64]
	ldr	r3, [r0, #2316]
	ldr	r2, [r3, #8]
	cmp	r1, #1
	cmpls	r1, r2
	add	r1, r1, #1
	movcc	lr, #1
	movcs	lr, #0
	cmp	lr, #0
	bne	.L918
	sub	ip, r2, #1
.L917:
	mov	r1, ip, asl #5
	ldr	lr, [r3, #12]
	sub	ip, r1, ip, asl #2
	add	r3, r3, ip
	ldr	r2, [r3, #56]
	rsb	r2, lr, r2
	str	r2, [r3, #56]
	ldr	r4, [r0, #2316]
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	ldr	lr, [r4, #8]
	cmp	r1, lr
	ldmcsfd	sp, {r4, fp, sp, pc}
	sxth	r3, r1
	add	r0, r0, #40960
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, r4, r3
.L922:
	ldr	r2, [r3, #64]
	add	r1, r1, #1
	ldr	ip, [r0, #2048]
	add	r3, r3, #28
	cmp	r2, ip
	strcc	r2, [r0, #2048]
	ldrcc	lr, [r4, #8]
	cmp	lr, r1
	bhi	.L922
	ldmfd	sp, {r4, fp, sp, pc}
.L931:
	ldr	r3, .L932
	mov	r0, #0
	ldr	r1, .L932+4
	ldr	r3, [r3, #68]
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	r3
.L912:
	ldr	ip, .L932
	movw	r3, #9726
	ldr	r2, .L932+8
	mov	r0, #1
	ldr	r1, .L932+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	ip
.L933:
	.align	2
.L932:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC70
	.word	.LANCHOR0+496
	.word	.LC36
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #0
	beq	.L943
	add	r3, r0, #40960
	ldr	r1, [r0, #156]
	ldr	r2, [r3, #2652]
	cmp	r2, r1
	bge	.L944
	movw	r3, #2024
	ldr	r1, [r0, #2304]
	mul	r3, r3, r2
	add	ip, r1, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L945
	ldr	r2, [ip, #32]
	ldr	r3, [r0, #152]
	cmp	r2, r3
	bge	.L946
	ldr	r1, [r0, #2300]
	movw	r3, #15788
	mla	r3, r3, r2, r1
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L947
	ldr	r2, [r3, #52]
	ldr	r3, [r0, #148]
	cmp	r2, r3
	bcs	.L948
	movw	r3, #12820
	ldr	r1, [r0, #2296]
	mul	r3, r3, r2
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L949
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L944:
	ldr	r3, .L950
	mov	r0, #1
	ldr	r1, .L950+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L945:
	ldr	r3, .L950
	mov	r0, #1
	ldr	r1, .L950+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L946:
	ldr	r3, .L950
	mov	r0, #1
	ldr	r1, .L950+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L947:
	ldr	r3, .L950
	mov	r0, #1
	ldr	r1, .L950+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L948:
	ldr	r3, .L950
	mov	r0, #1
	ldr	r1, .L950+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L949:
	ldr	r3, .L950
	mov	r0, #1
	ldr	r1, .L950+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L943:
	ldr	ip, .L950
	movw	r3, #9805
	ldr	r2, .L950+28
	mov	r0, #1
	ldr	r1, .L950+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L951:
	.align	2
.L950:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LANCHOR0+516
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_VpsSpsPpsCheck, .-HEVC_VpsSpsPpsCheck
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
	subs	r4, r0, #0
	beq	.L958
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r0, #0
	beq	.L959
	ldr	r0, [r4, #2292]
	bl	BsBitsToNextByte
	subs	r1, r0, #0
	beq	.L957
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldr	r3, .L960
	ldr	r1, .L960+4
	ldr	r3, [r3, #68]
	mov	r2, r0
	mov	r0, #19
	blx	r3
.L957:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L959:
	ldr	r3, .L960
	mov	r0, #1
	ldr	r1, .L960+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L958:
	ldr	ip, .L960
	movw	r3, #9859
	ldr	r2, .L960+12
	mov	r0, #1
	ldr	r1, .L960+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L961:
	.align	2
.L960:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC78
	.word	.LC77
	.word	.LANCHOR0+536
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ReadByteAlignment, .-HEVC_ReadByteAlignment
	.align	2
	.global	HEVC_DecPTL
	.type	HEVC_DecPTL, %function
HEVC_DecPTL:
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
	UNWIND(.pad #116)
	sub	sp, sp, #116
	cmp	r1, #0
	cmpne	r0, #0
	mov	r8, r2
	mov	r6, r3
	moveq	r5, #1
	movne	r5, #0
	mov	r4, r0
	str	r1, [fp, #-152]
	beq	.L1003
	cmp	r2, #0
	bne	.L1004
.L965:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldr	r3, [fp, #-152]
	cmp	r6, #0
	str	r0, [r3, #284]
	ble	.L967
	add	r7, r3, #42
	mov	r5, #0
	mov	r9, r7
	b	.L969
.L968:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r6, r5
	movgt	r3, #1
	movle	r3, #0
	cmp	r5, #5
	movgt	r3, #0
	cmp	r3, #0
	strb	r0, [r9, #1]!
	beq	.L1005
.L969:
	cmp	r8, #0
	add	r5, r5, #1
	beq	.L968
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r9, #-5]
	b	.L968
.L1005:
	cmp	r6, #7
	movle	r5, r6
	ble	.L972
	b	.L973
.L971:
	cmp	r5, #8
	beq	.L973
.L972:
	mov	r1, #2
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r5, r5, #1
	cmp	r0, #0
	beq	.L971
	ldr	r3, .L1006
	mov	r0, #1
	ldr	r1, .L1006+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L967:
	mov	r0, #0
.L997:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L973:
	ldr	r3, [fp, #-152]
	mov	r10, #0
	str	r6, [fp, #-152]
	add	r2, r3, #360
	add	r3, r3, #48
	mov	r9, r2
	b	.L977
.L976:
	add	r10, r10, #1
	ldr	r3, [fp, #-152]
	cmp	r10, #5
	add	r9, r9, #4
	movle	r2, #1
	movgt	r2, #0
	cmp	r3, r10
	mov	r3, r5
	movle	r2, #0
	cmp	r2, #0
	beq	.L967
.L977:
	cmp	r8, #0
	beq	.L1001
	ldrb	r2, [r7, #-5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1000
.L1001:
	add	r5, r3, #32
.L974:
	ldrb	r3, [r7, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L976
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r9]
	b	.L976
.L1000:
	mov	r1, #2
	ldr	r0, [r4, #2292]
	str	r3, [fp, #-156]
	bl	BsGet
	ldr	r3, [fp, #-156]
	mov	r1, #1
	add	r5, r3, #32
	mov	r6, r3
	str	r0, [r9, #-72]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r7, #199]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r9, #-48]
.L975:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #1]!
	cmp	r6, r5
	bne	.L975
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #205]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #211]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #217]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r7, #223]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r4, #2292]
	bl	BsGet
	b	.L974
.L1004:
	mov	r1, #2
	ldr	r0, [r0, #2292]
	bl	BsGet
	ldr	r9, [fp, #-152]
	mov	r1, #1
	ldr	r10, .L1006
	mov	r7, r9
	str	r0, [r9, #276]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r9]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r9, #272]
.L966:
	mov	r3, r5
	ldr	r2, .L1006+8
	mov	r1, #100
	ldr	r9, [r10, #72]
	sub	r0, fp, #144
	add	r5, r5, #1
	blx	r9
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r5, #32
	strb	r0, [r7, #1]!
	bne	.L966
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldr	r5, [fp, #-152]
	mov	r1, #1
	strb	r0, [r5, #33]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #34]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #35]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #36]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldr	r2, [r5, #272]
	add	r3, r4, #69632
	str	r2, [r3, #2824]
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	str	r2, [r3, #2828]
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	str	r2, [r3, #2832]
	b	.L965
.L1003:
	ldr	ip, .L1006
	movw	r3, #9890
	ldr	r2, .L1006+12
	mov	r0, #1
	ldr	r1, .L1006+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L997
.L1007:
	.align	2
.L1006:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC80
	.word	.LC79
	.word	.LANCHOR0+560
	.word	.LC36
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
	subs	r3, r0, #0
	str	r3, [fp, #-52]
	beq	.L1009
	ldr	r9, .L1027
	mov	r6, #0
	add	r10, r3, #2176
	add	r3, r3, #2192
	str	r3, [fp, #-48]
.L1010:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L1018
	ldr	r3, [fp, #-52]
	mov	r8, r6, asl #9
	ldr	r7, [fp, #-48]
	sub	r8, r8, r6, asl #7
	add	r5, r3, #564
	mov	r4, #0
.L1016:
	cmp	r6, #0
	add	r0, r5, r8
	mov	r2, #64
	ldr	r3, [r9, #52]
	beq	.L1025
	cmp	r6, #3
	beq	.L1026
	ldr	ip, .L1027+4
	cmp	r4, #2
	ldr	r1, .L1027+8
	movhi	r1, ip
	blx	r3
.L1012:
	mov	r3, #16
	str	r3, [r7, #4]!
	ldr	r3, [r10]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1016
.L1018:
	add	r6, r6, #1
	ldr	r3, [fp, #-48]
	cmp	r6, #4
	add	r3, r3, #24
	str	r3, [fp, #-48]
	bne	.L1010
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1009:
	ldr	ip, .L1027
	movw	r3, #10170
	ldr	r2, .L1027+12
	mov	r0, #1
	ldr	r1, .L1027+16
	ldr	ip, [ip, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	ip
.L1026:
	ldr	r0, .L1027+4
	cmp	r4, #0
	ldr	r1, .L1027+8
	mov	r2, #64
	movne	r1, r0
	add	r0, r5, #1152
	blx	r3
	b	.L1012
.L1025:
	mov	r2, #16
	ldr	r1, .L1027+20
	mov	r0, r5
	blx	r3
	b	.L1012
.L1028:
	.align	2
.L1027:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+572
	.word	.LANCHOR3
	.word	.LANCHOR0+636
	.word	.LC36
	.word	.LANCHOR0+664
	UNWIND(.fnend)
	.size	HEVC_SetDefaultScalingList, .-HEVC_SetDefaultScalingList
	.align	2
	.global	HEVC_SetScalingList
	.type	HEVC_SetScalingList, %function
HEVC_SetScalingList:
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
	beq	.L1049
	add	r6, r5, #24576
	ldr	r2, [r6, #2604]
	ldrb	r3, [r2, #5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1048
	ldrb	r3, [r2, #6]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r6, #2608]
	bne	.L1032
	ldrb	r4, [r3, #21]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L1050
.L1033:
	ldr	r9, .L1051
	mov	r2, #1536
	mov	r1, #0
	add	r0, r5, #564
	add	r10, r5, #2176
	mov	r7, #0
	ldr	r3, [r9, #48]
	blx	r3
.L1035:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r8, r7, asl #3
	movne	r4, #0
	subne	r8, r8, r7, asl #1
	beq	.L1039
.L1036:
	add	r0, r8, r4
	ldr	r1, [r6, #2608]
	mov	r3, r4
	mov	r2, r7
	add	r1, r1, r0, lsl #6
	mov	r0, r5
	add	r1, r1, #308
	add	r4, r4, #1
	add	r1, r1, #1
	bl	HEVC_CalScalingList
	ldr	r3, [r10]
	cmp	r4, r3
	bcc	.L1036
.L1039:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L1035
	ldr	r1, [r6, #2608]
	add	r0, r5, #2192
	add	r0, r0, #4
	ldr	r3, [r9, #52]
	add	r1, r1, #1920
	mov	r2, #96
	add	r1, r1, #8
	blx	r3
.L1048:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1032:
	ldrb	r1, [r3, #21]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1033
	ldr	r9, .L1051
	mov	r2, #1536
	add	r0, r5, #564
	mov	r7, r1
	add	r10, r5, #2176
	ldr	r3, [r9, #48]
	blx	r3
.L1040:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r8, r7, asl #3
	movne	r4, #0
	subne	r8, r8, r7, asl #1
	beq	.L1044
.L1041:
	add	r0, r8, r4
	ldr	r1, [r6, #2604]
	mov	r3, r4
	mov	r2, r7
	add	r1, r1, r0, lsl #6
	mov	r0, r5
	add	r1, r1, #908
	add	r4, r4, #1
	add	r1, r1, #1
	bl	HEVC_CalScalingList
	ldr	r3, [r10]
	cmp	r4, r3
	bcc	.L1041
.L1044:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L1040
	ldr	r1, [r6, #2604]
	add	r0, r5, #2192
	ldr	r3, [r9, #52]
	mov	r2, #96
	add	r1, r1, #2528
	add	r0, r0, #4
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1050:
	bl	HEVC_SetDefaultScalingList
	mov	r0, r4
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1049:
	ldr	ip, .L1051
	movw	r3, #10117
	ldr	r2, .L1051+4
	mov	r0, #1
	ldr	r1, .L1051+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1052:
	.align	2
.L1051:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+680
	.word	.LC36
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
	b	.L1054
.L1056:
	.word	.L1060
	.word	.L1058
	.word	.L1058
	.word	.L1059
.L1058:
	ldr	r3, .L1064
	cmp	r1, #2
	add	r0, r3, #64
	movhi	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1060:
	ldr	r0, .L1064+4
	ldmfd	sp, {fp, sp, pc}
.L1059:
	ldr	r3, .L1064
	cmp	r1, #0
	add	r0, r3, #64
	movne	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1054:
	ldr	r3, .L1064+8
	mov	r0, #1
	ldr	r1, .L1064+12
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1065:
	.align	2
.L1064:
	.word	.LANCHOR3+80
	.word	.LANCHOR3+64
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC81
	UNWIND(.fnend)
	.size	HEVC_GetScalingListDefaultAddress, .-HEVC_GetScalingListDefaultAddress
	.align	2
	.global	HEVC_DecScalingListData
	.type	HEVC_DecScalingListData, %function
HEVC_DecScalingListData:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r8, r0
	mov	r10, r1
	moveq	r3, #1
	movne	r3, #0
	beq	.L1100
	ldr	ip, .L1105
	add	r1, r1, #1264
	add	r0, r10, #1392
	add	r1, r1, #1
	add	r0, r0, #1
	mov	r2, #64
	ldr	r4, [ip, #52]
	add	ip, r10, #1664
	str	r3, [fp, #-48]
	mov	r5, ip
	blx	r4
	add	r3, r5, #4
	str	r3, [fp, #-76]
	add	r3, r8, #2176
	str	r3, [fp, #-52]
	add	r3, r10, #24
	str	r3, [fp, #-68]
	add	r3, r10, #49
	str	r3, [fp, #-72]
.L1069:
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #4]!
	cmp	r3, #0
	str	r2, [fp, #-52]
	beq	.L1087
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-76]
	ldr	r6, [fp, #-72]
	mov	r3, r2, asl #3
	sub	r3, r3, r2, asl #1
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-68]
	str	r1, [fp, #-64]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-60]
.L1086:
	mov	r1, #1
	ldr	r0, [r8, #2292]
	bl	BsGet
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-52]
	ldr	r5, [r3, #-1904]
	ldr	r3, [fp, #-48]
	cmp	r5, #64
	movge	r5, #64
	cmp	r3, #0
	beq	.L1070
	cmp	r0, #0
	add	r4, r8, #308
	beq	.L1101
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	bls	.L1093
	ldr	r0, [r8, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #7
	str	r0, [r10, #1660]
	cmp	r3, #254
	bhi	.L1102
	ldr	r3, [fp, #-64]
	add	r9, r0, #8
	str	r9, [r3]
.L1080:
	cmp	r5, #0
	ble	.L1079
	sub	r4, r4, #4
	mov	r7, #0
	b	.L1084
.L1083:
	mov	r9, r9, lsr #24
	ldr	r2, [r4, #4]!
	add	r3, r3, r9
	cmp	r7, r5
	uxtb	r3, r3
	rsb	r9, r9, r3
	strb	r9, [r6, r2]
	beq	.L1079
.L1084:
	ldr	r0, [r8, #2292]
	add	r7, r7, #1
	bl	HEVC_se_v.isra.21
	add	r3, r0, r9
	add	r2, r0, #128
	add	r3, r3, #256
	cmp	r2, #255
	str	r0, [r10, #1664]
	mov	r9, r3, asr #31
	bls	.L1083
	ldr	r3, .L1105
	mov	r0, #1
	ldr	r1, .L1105+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
.L1098:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1088:
	ldr	r0, [r8, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [fp, #-60]
	cmp	r0, r3
	bhi	.L1090
	ldr	r2, [fp, #-56]
	uxtb	r0, r0
	ldr	r3, [fp, #-60]
	strb	r0, [r2, #1560]
	rsb	r0, r0, r3
	uxtb	r3, r0
	strb	r3, [r2, #1584]
.L1074:
	ldr	r2, [fp, #-60]
	cmp	r3, r2
	beq	.L1103
.L1076:
	ldr	r2, [fp, #-80]
	add	r1, r2, r3
	add	r1, r10, r1, lsl #6
	add	r1, r1, #49
.L1077:
	cmp	r1, #0
	beq	.L1104
	ldr	r3, .L1105
	mov	r2, r5
	mov	r0, r6
	ldr	r3, [r3, #52]
	blx	r3
.L1079:
	ldr	r3, [fp, #-52]
	add	r6, r6, #64
	ldr	r2, [fp, #-60]
	ldr	r1, [fp, #-64]
	ldr	r3, [r3]
	add	r2, r2, #1
	add	r1, r1, #4
	str	r2, [fp, #-60]
	cmp	r2, #5
	cmpls	r2, r3
	str	r1, [fp, #-64]
	bcc	.L1086
.L1087:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, #4
	ldr	r3, [fp, #-72]
	add	r2, r2, #6
	str	r2, [fp, #-68]
	add	r3, r3, #384
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	add	r3, r3, #24
	str	r3, [fp, #-76]
	bne	.L1069
	mov	r0, #0
	b	.L1098
.L1093:
	mov	r9, #8
	b	.L1080
.L1101:
	ldr	r0, [r8, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [fp, #-60]
	cmp	r0, r3
	bhi	.L1090
	ldr	r3, [fp, #-48]
	uxtb	r0, r0
	ldr	r1, [fp, #-60]
	ldr	r2, [fp, #-56]
	cmp	r3, #1
	rsb	r3, r0, r1
	strb	r0, [r2, #1560]
	uxtb	r3, r3
	strb	r3, [r2, #1584]
	bls	.L1074
	cmp	r1, r3
	mov	r2, r1
	ldr	r1, [fp, #-64]
	ldrne	r2, [fp, #-80]
	moveq	r2, #16
	addne	r2, r2, r3
	addne	r2, r10, r2, lsl #2
	ldrne	r2, [r2, #1668]
	str	r2, [r1]
	ldr	r2, [fp, #-60]
	cmp	r3, r2
	bne	.L1076
.L1103:
	mov	r1, r2
	ldr	r0, [fp, #-48]
	bl	HEVC_GetScalingListDefaultAddress
	mov	r1, r0
	b	.L1077
.L1100:
	ldr	ip, .L1105
	movw	r3, #9990
	ldr	r2, .L1105+8
	mov	r0, #1
	ldr	r1, .L1105+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1098
.L1102:
	ldr	r3, .L1105
	mov	r0, #1
	ldr	r1, .L1105+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1098
.L1104:
	ldr	r3, .L1105
	mov	r0, #1
	ldr	r1, .L1105+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1098
.L1090:
	ldr	r3, .L1105
	mov	r0, #1
	ldr	r1, .L1105+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1098
.L1070:
	cmp	r0, #0
	beq	.L1088
	ldr	r4, .L1105+28
	mov	r9, #8
	b	.L1080
.L1106:
	.align	2
.L1105:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC85
	.word	.LANCHOR0+700
	.word	.LC36
	.word	.LC84
	.word	.LC83
	.word	.LC82
	.word	.LANCHOR4+61624
	UNWIND(.fnend)
	.size	HEVC_DecScalingListData, .-HEVC_DecScalingListData
	.align	2
	.global	HEVC_DecPredWeightTable
	.type	HEVC_DecPredWeightTable, %function
HEVC_DecPredWeightTable:
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
	subs	r8, r0, #0
	beq	.L1174
	add	r4, r8, #40960
	ldr	r3, [r8, #2304]
	movw	r0, #2024
	ldr	r5, [r8, #2300]
	ldr	r2, [r4, #2652]
	ldr	r1, [r4, #2636]
	mla	r3, r0, r2, r3
	cmp	r1, #1
	ldr	r6, [r3, #32]
	beq	.L1175
	cmp	r1, #0
	bne	.L1112
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1112
.L1111:
	ldr	r0, [r8, #2292]
	add	r10, r8, #45056
	bl	HEVC_ue_v.isra.18
	cmp	r0, #7
	str	r0, [r10, #72]
	bhi	.L1176
	movw	r3, #15788
	mla	r9, r3, r6, r5
	ldr	r3, [r9, #64]
	cmp	r3, #0
	ldreq	r3, [r10, #76]
	bne	.L1177
.L1116:
	add	r3, r3, r0
	str	r3, [r10, #1104]
	ldr	r3, [r4, #2744]
	cmp	r3, #0
	beq	.L1117
	add	r5, r8, #45056
	mov	r6, #0
	add	r5, r5, #76
	mov	r7, r5
.L1118:
	mov	r1, #1
	ldr	r0, [r8, #2292]
	bl	BsGet
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldr	r3, [r4, #2744]
	cmp	r3, r6
	bhi	.L1118
	ldr	r2, [r9, #64]
	cmp	r2, #0
	beq	.L1119
	cmp	r3, #0
	addne	r7, r8, #45056
	movne	r6, #0
	addne	r7, r7, #140
	beq	.L1117
.L1123:
	mov	r1, #1
	ldr	r0, [r8, #2292]
	bl	BsGet
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldr	r3, [r4, #2744]
	cmp	r3, r6
	bhi	.L1123
.L1119:
	cmp	r3, #0
	beq	.L1117
	add	r7, r8, #45312
	mov	r6, #0
	add	r7, r7, #80
	str	r8, [fp, #-48]
	mov	r8, r5
	mov	r3, r7
	mov	r7, r6
	mov	r6, r3
	b	.L1134
.L1124:
	ldr	r0, [r10, #72]
	mov	r3, #1
	str	ip, [r8, #192]
	mov	r0, r3, asl r0
	str	r0, [r8, #1028]
.L1126:
	ldr	r0, [r9, #64]
	cmp	r0, #0
	beq	.L1128
	ldr	r0, [r8, #64]
	cmp	r0, #0
	bne	.L1129
	ldr	ip, [r10, #1104]
	mov	r3, #1
	str	r0, [r6, #964]
	mov	ip, r3, asl ip
	str	r0, [r6, #968]
	str	ip, [r6, #836]
	str	ip, [r6, #840]
.L1128:
	ldr	r0, [r4, #2744]
	add	r7, r7, #1
	add	r6, r6, #8
	cmp	r0, r7
	bls	.L1178
.L1134:
	ldr	ip, [r8, #4]!
	cmp	ip, #0
	beq	.L1124
	ldr	r3, [fp, #-48]
	ldr	r0, [r3, #2292]
	bl	HEVC_se_v.isra.21
	add	ip, r0, #128
	str	r0, [r8, #128]
	cmp	ip, #255
	bhi	.L1179
	ldr	ip, [r10, #72]
	mov	r3, #1
	add	r0, r0, r3, asl ip
	ldr	r3, [fp, #-48]
	str	r0, [r8, #1028]
	ldr	r0, [r3, #2292]
	bl	HEVC_se_v.isra.21
	add	ip, r0, #128
	str	r0, [r8, #192]
	cmp	ip, #255
	bls	.L1126
	ldr	r3, .L1186
	mov	r2, r0
	ldr	r1, .L1186+4
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1175:
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1111
.L1112:
	mov	r0, #0
.L1109:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1129:
	add	r2, r6, #960
	add	r1, r6, #128
	add	r3, r6, #832
	str	r9, [fp, #-56]
	ldr	r9, [fp, #-48]
	mov	r0, r6
	str	r7, [fp, #-52]
	mov	r5, #0
	str	r8, [fp, #-60]
	mov	r7, r2
	str	r6, [fp, #-64]
	mov	r8, r1
	str	r4, [fp, #-68]
	mov	r6, r3
	mov	r4, r0
.L1132:
	ldr	r0, [r9, #2292]
	add	r5, r5, #1
	bl	HEVC_se_v.isra.21
	add	r3, r0, #128
	str	r0, [r4]
	cmp	r3, #255
	bhi	.L1180
	ldr	r0, [r9, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #512
	str	r0, [r8], #4
	cmp	r3, #1024
	bcs	.L1181
	ldr	r1, [r10, #1104]
	mov	r3, #1
	ldr	r2, [r4], #4
	add	r3, r2, r3, asl r1
	str	r3, [r6, #4]!
	mov	r3, r3, asl #7
	mov	r3, r3, asr r1
	rsb	r3, r3, #128
	add	r0, r0, r3
	cmp	r0, #127
	movge	r0, #127
	cmn	r0, #128
	mvnlt	r0, #127
	cmp	r5, #2
	str	r0, [r7, #4]!
	bne	.L1132
	sub	r4, fp, #68
	ldr	r7, [fp, #-52]
	ldmia	r4, {r4, r6, r8, r9}
	b	.L1128
.L1178:
	ldr	r8, [fp, #-48]
.L1117:
	ldr	r5, [r4, #2636]
	cmp	r5, #0
	bne	.L1112
	ldr	r3, [r4, #2748]
	cmp	r3, #0
	beq	.L1112
	add	r6, r8, #45568
	add	r6, r6, #76
	mov	r7, r6
.L1135:
	mov	r1, #1
	ldr	r0, [r8, #2292]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r7, #4]!
	ldr	r3, [r4, #2748]
	cmp	r3, r5
	bhi	.L1135
	ldr	r2, [r9, #64]
	cmp	r2, #0
	bne	.L1182
.L1136:
	cmp	r3, #0
	beq	.L1112
	add	r2, r8, #45824
	mov	r7, r6
	add	r2, r2, #80
	mov	r3, #0
	str	r8, [fp, #-48]
	mov	r6, r3
	mov	r8, r7
	mov	r7, r4
	mov	r4, r2
	b	.L1150
.L1140:
	ldr	r0, [r10, #72]
	mov	r3, #1
	str	ip, [r8, #192]
	mov	r0, r3, asl r0
	str	r0, [r8, #836]
.L1142:
	ldr	r0, [r9, #64]
	cmp	r0, #0
	beq	.L1144
	ldr	r0, [r8, #64]
	cmp	r0, #0
	bne	.L1145
	ldr	ip, [r10, #1104]
	mov	r3, #1
	str	r0, [r4, #772]
	mov	ip, r3, asl ip
	str	r0, [r4, #776]
	str	ip, [r4, #644]
	str	ip, [r4, #648]
.L1144:
	ldr	r0, [r7, #2748]
	add	r6, r6, #1
	add	r4, r4, #8
	cmp	r0, r6
	bls	.L1112
.L1150:
	ldr	ip, [r8, #4]!
	cmp	ip, #0
	beq	.L1140
	ldr	r3, [fp, #-48]
	ldr	r0, [r3, #2292]
	bl	HEVC_se_v.isra.21
	add	ip, r0, #128
	str	r0, [r8, #128]
	cmp	ip, #255
	bhi	.L1183
	ldr	ip, [r10, #72]
	mov	r3, #1
	add	r0, r0, r3, asl ip
	ldr	r3, [fp, #-48]
	str	r0, [r8, #836]
	ldr	r0, [r3, #2292]
	bl	HEVC_se_v.isra.21
	add	ip, r0, #128
	str	r0, [r8, #192]
	cmp	ip, #255
	bls	.L1142
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1145:
	add	r2, r4, #768
	add	r1, r4, #128
	add	r3, r4, #640
	str	r9, [fp, #-56]
	ldr	r9, [fp, #-48]
	mov	r0, r4
	str	r4, [fp, #-52]
	mov	r5, #0
	str	r8, [fp, #-60]
	mov	r4, r3
	str	r6, [fp, #-64]
	mov	r8, r1
	str	r7, [fp, #-68]
	mov	r6, r0
	mov	r7, r2
.L1148:
	ldr	r0, [r9, #2292]
	add	r5, r5, #1
	bl	HEVC_se_v.isra.21
	add	r3, r0, #128
	str	r0, [r6]
	cmp	r3, #255
	bhi	.L1184
	ldr	r0, [r9, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #512
	str	r0, [r8], #4
	cmp	r3, #1024
	bcs	.L1185
	ldr	r1, [r10, #1104]
	mov	r3, #1
	ldr	r2, [r6], #4
	add	r3, r2, r3, asl r1
	str	r3, [r4, #4]!
	mov	r3, r3, asl #7
	mov	r3, r3, asr r1
	rsb	r3, r3, #128
	add	r0, r0, r3
	cmp	r0, #127
	movge	r0, #127
	cmn	r0, #128
	mvnlt	r0, #127
	cmp	r5, #2
	str	r0, [r7, #4]!
	bne	.L1148
	sub	r6, fp, #64
	ldr	r4, [fp, #-52]
	ldr	r7, [fp, #-68]
	ldmia	r6, {r6, r8, r9}
	b	.L1144
.L1177:
	ldr	r0, [r8, #2292]
	bl	HEVC_se_v.isra.21
	add	r2, r0, #7
	mov	r3, r0
	cmp	r2, #14
	str	r0, [r10, #76]
	bhi	.L1115
	ldr	r0, [r10, #72]
	b	.L1116
.L1180:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1181:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1182:
	cmp	r3, #0
	addne	r7, r8, #45568
	movne	r5, #0
	addne	r7, r7, #140
	beq	.L1112
.L1139:
	mov	r1, #1
	ldr	r0, [r8, #2292]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r7, #4]!
	ldr	r3, [r4, #2748]
	cmp	r3, r5
	bhi	.L1139
	b	.L1136
.L1179:
	ldr	r3, .L1186
	mov	r2, r0
	ldr	r1, .L1186+20
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1184:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1185:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+28
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1183:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1176:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+36
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1174:
	ldr	ip, .L1186
	movw	r3, #10244
	ldr	r2, .L1186+40
	mov	r0, #1
	ldr	r1, .L1186+44
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1109
.L1115:
	ldr	r3, .L1186
	mov	r0, #1
	ldr	r1, .L1186+48
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1109
.L1187:
	.align	2
.L1186:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC89
	.word	.LC93
	.word	.LC90
	.word	.LC91
	.word	.LC88
	.word	.LC94
	.word	.LC95
	.word	.LC92
	.word	.LC86
	.word	.LANCHOR0+724
	.word	.LC36
	.word	.LC87
	UNWIND(.fnend)
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
	.align	2
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
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
	subs	r5, r0, #0
	str	r1, [fp, #-92]
	beq	.L1482
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	add	r4, r5, #40960
	ldr	r10, [r4, #2648]
	sub	r3, r10, #16
	cmp	r3, #5
	movhi	r3, #0
	movls	r3, #1
	cmp	r3, #0
	str	r3, [fp, #-72]
	strb	r0, [r4, #2577]
	bne	.L1483
.L1191:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #0
	str	r0, [r4, #2652]
	ldr	r2, [r5, #156]
	blt	.L1193
	cmp	r0, r2
	bge	.L1193
	mov	r0, r5
	bl	HEVC_VpsSpsPpsCheck
	subs	r3, r0, #0
	str	r3, [fp, #-88]
	bne	.L1484
	ldr	r1, [r4, #2652]
	movw	r6, #2024
	ldr	r2, [r5, #2304]
	movw	r7, #15788
	ldr	r3, [r5, #2300]
	mla	r6, r6, r1, r2
	ldrb	r1, [r6, #2]	@ zero_extendqisi2
	ldr	r2, [r6, #32]
	cmp	r1, #0
	mla	r7, r7, r2, r3
	bne	.L1485
.L1198:
	mov	r3, #0
	strb	r3, [r4, #2579]
.L1199:
	ldr	r8, [r7, #160]
	ldr	r3, [r7, #164]
	cmp	r8, #0
	beq	.L1201
	cmp	r3, #0
	beq	.L1201
	ldr	r0, [r7, #76]
	mov	r1, r3
	add	r0, r3, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	mov	r1, r8
	mov	r9, r0
	ldr	r0, [r7, #72]
	add	r0, r8, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	ldr	r8, [r7, #216]
	mov	r3, #1
	mov	r1, #0
	mov	r8, r8, asl r3
	mov	r8, r3, asl r8
	mul	r9, r0, r9
	cmp	r9, r3
	ble	.L1203
.L1204:
	add	r1, r1, #1
	cmp	r9, r3, asl r1
	bgt	.L1204
.L1203:
	ldrb	r3, [r4, #2577]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r2, #0
	beq	.L1486
.L1205:
	mul	r9, r8, r9
	ldrb	r8, [r4, #2579]	@ zero_extendqisi2
	str	r2, [r4, #2728]
	cmp	r8, #0
	str	r9, [r4, #2732]
	ldr	r3, [r5, #188]
	str	r3, [r4, #2624]
	beq	.L1487
.L1208:
	ldr	r3, [r6, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	streq	r3, [r4, #2716]
	bne	.L1488
.L1324:
	ldrb	r3, [r6, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1329
.L1335:
	ldr	r3, [r4, #2728]
	cmp	r3, #0
	bne	.L1489
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1337
	ldr	r2, [fp, #-72]
	cmp	r2, #0
	beq	.L1341
	ldr	r2, [fp, #-92]
	cmp	r2, #0
	strneb	r3, [r5]
	mov	r3, #1
	strb	r3, [r5, #2]
.L1340:
	ldr	r3, [r4, #2624]
	ldr	r2, [fp, #-72]
	cmp	r3, #0
	moveq	r2, #0
	andne	r2, r2, #1
	cmp	r2, #0
	bne	.L1490
.L1341:
	mov	r3, #0
	strb	r3, [r5, #1]
.L1342:
	mov	r0, r5
	bl	HEVC_IsNewPic
	add	r3, r5, #45056
	str	r0, [r3, #68]
	mov	r0, r5
	bl	HEVC_ReadByteAlignment
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1458:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1489:
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1341
	b	.L1340
.L1485:
	ldrb	r3, [r4, #2577]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1198
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2579]
	b	.L1199
.L1487:
	ldr	r3, [r6, #36]
	cmp	r3, #0
	ldrne	r9, .L1526
	beq	.L1213
.L1212:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldr	r3, [r9, #68]
	ldr	r1, .L1526+4
	add	r8, r8, #1
	mov	r2, r0
	mov	r0, #19
	blx	r3
	ldr	r3, [r6, #36]
	cmp	r3, r8
	bhi	.L1212
.L1213:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #2
	str	r0, [r4, #2636]
	bhi	.L1491
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	streqb	r3, [r4, #2576]
	bne	.L1492
.L1215:
	sub	r10, r10, #19
	cmp	r10, #1
	bhi	.L1493
	mov	r3, #0
	str	r3, [r4, #2624]
	str	r3, [r5, #188]
	ldr	r3, [r4, #2644]
	cmp	r3, #0
	streq	r3, [r4, #2628]
	streq	r3, [r5, #184]
	ldrb	r3, [r7, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1471
.L1346:
	mov	r8, #0
	strb	r8, [r4, #2583]
	str	r8, [fp, #-96]
.L1344:
	ldr	r3, [r4, #2636]
	cmp	r3, #2
	bne	.L1494
.L1258:
	ldrb	r3, [r4, #2583]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1289
	mov	r3, #1
	strb	r3, [r4, #2587]
	mov	r3, #2
.L1294:
	ldrb	r2, [r6, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1299
	cmp	r3, #1
	beq	.L1302
.L1299:
	ldrb	r2, [r6, #11]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1288
	cmp	r3, #0
	bne	.L1288
.L1302:
	mov	r0, r5
	bl	HEVC_DecPredWeightTable
	cmp	r0, #0
	ldreq	r3, [r4, #2636]
	bne	.L1495
.L1288:
	cmp	r3, #2
	beq	.L1303
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	rsb	r3, r0, #4
	rsb	r2, r0, #5
	cmp	r3, #4
	str	r2, [r4, #2692]
	bhi	.L1496
.L1303:
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	str	r0, [r4, #2696]
	ldr	r2, [r6, #48]
	add	r2, r0, r2
	str	r2, [r4, #2632]
	ldr	r3, [r7, #104]
	cmp	r2, #51
	rsb	r0, r3, #0
	movle	r1, #0
	movgt	r1, #1
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	bne	.L1497
	ldrb	r3, [r6, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1498
.L1305:
	ldrb	r3, [r6, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1468
	ldrb	r3, [r6, #19]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r4, #2588]
	bne	.L1499
.L1313:
	ldrb	r0, [r6, #20]	@ zero_extendqisi2
	strb	r0, [r4, #2589]
	ldr	r3, [r6, #76]
	str	r3, [r4, #2708]
	ldr	r3, [r6, #80]
	str	r3, [r4, #2712]
.L1310:
	ldrb	r3, [r7, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1316
	ldr	r2, [r4, #2580]
	bic	r3, r2, #-16777216
	bic	r3, r3, #255
	adds	r3, r3, #0
	movne	r3, #1
.L1316:
	ldrb	r2, [r6, #17]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1317
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L1500
.L1317:
	strb	r2, [r4, #2590]
	b	.L1208
.L1483:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2578]
	b	.L1191
.L1486:
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r4, #2656]
	cmp	r0, #0
	ldr	r2, [r7, #244]
	ldr	r3, [r7, #240]
	mul	r3, r3, r2
	blt	.L1207
	cmp	r3, r0
	bls	.L1207
	mul	r2, r8, r0
	b	.L1205
.L1488:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #2716]
	ldr	r3, [r6, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	ldreq	r3, [r7, #244]
	subeq	r3, r3, #1
	beq	.L1320
	cmp	r3, #256
	ldreq	r2, [r6, #68]
	ldreq	r3, [r6, #72]
	ldrne	r3, [r7, #244]
	ldrne	r2, [r6, #68]
	mul	r3, r3, r2
	sub	r3, r3, #1
.L1320:
	cmp	r3, #255
	movcs	r3, #255
	cmp	r0, r3
	bhi	.L1501
	cmp	r0, #0
	beq	.L1324
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #31
	add	r1, r0, #1
	str	r1, [r4, #2640]
	bhi	.L1502
	ldr	r3, [r4, #2716]
	cmp	r3, #0
	addne	r8, r5, #43520
	movne	r7, #0
	addne	r8, r8, #192
	bne	.L1328
	b	.L1324
.L1503:
	ldr	r1, [r4, #2640]
.L1328:
	ldr	r0, [r5, #2292]
	add	r7, r7, #1
	bl	BsGet
	str	r0, [r8, #4]!
	ldr	r3, [r4, #2716]
	cmp	r3, r7
	bhi	.L1503
	ldrb	r3, [r6, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1335
.L1329:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #256
	str	r0, [r4, #2720]
	bhi	.L1504
	ldr	r0, [r5, #2292]
	bl	BsResidBits
	ldr	r3, [r4, #2720]
	cmp	r0, r3
	bcc	.L1333
	cmp	r3, #0
	movne	r6, #0
	beq	.L1335
.L1336:
	mov	r1, #8
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldr	r3, [r4, #2720]
	add	r6, r6, #1
	cmp	r3, r6
	str	r0, [r4, #2724]
	bhi	.L1336
	b	.L1335
.L1337:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	strneb	r2, [r5, #2]
	b	.L1341
.L1490:
	ldr	r3, [r4, #2648]
	cmp	r3, #21
	moveq	r3, #1
	streqb	r3, [r5, #1]
	bne	.L1341
	b	.L1342
.L1471:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #2581]
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2582]
	b	.L1346
.L1494:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2584]
	cmp	r0, #0
	bne	.L1505
	ldr	r8, [r4, #2636]
	ldr	r3, [r6, #40]
	cmp	r8, #0
	str	r3, [r4, #2744]
	bne	.L1264
	ldr	r3, [r6, #44]
	str	r3, [r4, #2748]
.L1265:
	ldr	r3, [fp, #-96]
	cmp	r3, #0
	beq	.L1506
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #24]
	cmp	r2, #16
	bhi	.L1268
	cmp	r2, #0
	moveq	r8, r2
	beq	.L1270
	ldr	r1, [fp, #-96]
	add	r2, r2, #52
	mov	r8, #0
	add	r3, r1, #52
	add	r2, r1, r2
.L1272:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	addne	r8, r8, #1
	cmp	r3, r2
	bne	.L1272
	cmp	r8, #1
	movle	r2, #0
	movgt	r2, #1
.L1270:
	ldrb	r3, [r6, #22]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, #0
	andne	r2, r2, #1
	cmp	r2, #0
	beq	.L1507
	add	r9, r5, #46848
	add	r2, r5, #43520
	add	r9, r9, #160
	add	r2, r2, #16
	cmp	r2, #0
	cmpne	r9, #0
	beq	.L1273
	sub	r2, r8, #1
	mov	r10, #1
	movs	r2, r2, asr #1
	beq	.L1274
.L1275:
	movs	r2, r2, asr #1
	add	r10, r10, #1
	bne	.L1275
.L1274:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	cmp	r8, #1
	movls	r3, #0
	movhi	r3, #1
	uxtb	r0, r0
	str	r3, [fp, #-48]
	cmp	r0, #0
	cmpne	r8, #1
	add	r3, r5, #45056
	str	r3, [fp, #-84]
	strb	r0, [r3, #1952]
	bls	.L1279
	ldr	r2, [r4, #2744]
	cmp	r2, #0
	beq	.L1279
	mov	r8, r9
	mov	r9, #0
.L1280:
	mov	r1, r10
	ldr	r0, [r5, #2292]
	bl	BsGet
	add	r9, r9, #1
	str	r0, [r8, #4]!
	ldr	r3, [r4, #2744]
	cmp	r9, r3
	bcc	.L1280
.L1279:
	ldr	r8, [r4, #2636]
	cmp	r8, #0
	bne	.L1266
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldr	r9, [fp, #-48]
	ldr	r3, [fp, #-84]
	uxtb	r0, r0
	strb	r0, [r3, #1953]
	cmp	r0, #0
	moveq	r9, #0
	andne	r9, r9, #1
	cmp	r9, #0
	beq	.L1469
	ldr	r3, [r4, #2748]
	cmp	r3, #0
	beq	.L1469
	add	r9, r5, #47104
	add	r9, r9, #32
.L1283:
	mov	r1, r10
	ldr	r0, [r5, #2292]
	bl	BsGet
	add	r8, r8, #1
	str	r0, [r9, #4]!
	ldr	r3, [r4, #2748]
	cmp	r8, r3
	bcc	.L1283
.L1469:
	ldr	r8, [r4, #2636]
	cmp	r8, #0
	bne	.L1266
.L1349:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldr	r8, [r4, #2636]
	strb	r0, [r4, #2585]
.L1266:
	cmp	r8, #2
	bne	.L1350
	b	.L1258
.L1468:
	ldrb	r0, [r4, #2589]	@ zero_extendqisi2
	b	.L1310
.L1507:
	ldr	r3, [r4, #2636]
	cmp	r3, #0
	beq	.L1349
.L1350:
	ldrb	r3, [r6, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1508
.L1284:
	ldrb	r3, [r4, #2583]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #2636]
	beq	.L1294
	cmp	r3, #0
	beq	.L1509
	cmp	r3, #2
	mov	r3, #1
	strb	r3, [r4, #2587]
	beq	.L1289
.L1292:
	ldr	r3, [r4, #2744]
	cmp	r3, #1
	bls	.L1467
.L1290:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldrb	r2, [r4, #2587]	@ zero_extendqisi2
	cmp	r2, #0
	str	r0, [r4, #2688]
	bne	.L1295
	ldr	r1, [r4, #2684]
	sub	r1, r1, #1
.L1297:
	cmp	r1, r0
	movcs	r3, #0
	movcc	r3, #1
	orrs	r3, r3, r0, lsr #31
	beq	.L1467
	ldr	ip, .L1526
	mov	r3, r0
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L1526+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1493:
	ldr	r1, [r7, #132]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r2, #1
	str	r0, [r4, #2664]
	mov	r9, r0
	ldr	r3, [r7, #128]
	ldr	r8, [r5, #184]
	mov	r3, r2, asl r3
	str	r0, [fp, #-104]
	str	r3, [fp, #-108]
	mov	r1, r3
	mov	r0, r8
	bl	__aeabi_uidivmod
	cmp	r1, r9
	rsb	r3, r1, r8
	bls	.L1217
	ldr	r0, [fp, #-108]
	ldr	r2, [fp, #-104]
	rsb	r2, r2, r1
	cmp	r2, r0, lsr #1
	movcs	r2, r0
	addcs	r3, r3, r2
	bcc	.L1217
.L1218:
	ldr	r1, [r4, #2648]
	ldr	r0, [fp, #-104]
	sub	r2, r1, #16
	cmp	r2, #2
	movls	r3, #0
	add	r3, r3, r0
	str	r3, [r4, #2624]
	str	r3, [r5, #188]
	ldr	r0, [r4, #2644]
	cmp	r0, #0
	bne	.L1220
	cmp	r1, #15
	bls	.L1510
.L1221:
	cmp	r2, #7
	movhi	r2, #0
	movls	r2, #1
.L1222:
	sub	r1, r1, #7
	bics	r1, r1, #2
	andne	r2, r2, #1
	moveq	r2, #0
	cmp	r2, #0
	strne	r3, [r4, #2628]
	strne	r3, [r5, #184]
.L1220:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2580]
	cmp	r0, #0
	beq	.L1223
	ldr	r3, [r7, #228]
	cmp	r3, #1
	movhi	r1, #0
	movhi	r2, #1
	bls	.L1225
.L1227:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L1227
	cmp	r1, #0
	bne	.L1511
.L1225:
	mov	r1, #0
	str	r1, [r4, #2668]
.L1230:
	mov	r2, #204
	add	r0, r5, #46592
	mla	r1, r2, r1, r7
	add	r0, r0, #212
	str	r0, [fp, #-96]
	add	r1, r1, #2720
	add	r1, r1, #12
	bl	memcpy
.L1226:
	ldrb	r3, [r7, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1231
	add	r3, r5, #45056
	str	r3, [fp, #-84]
	mov	r1, r3
	ldr	r3, [r7, #232]
	ldr	r2, [r1, #1768]
	cmp	r3, #0
	ldr	r3, [r1, #1764]
	add	r3, r2, r3
	str	r3, [fp, #-112]
	bne	.L1232
.L1235:
	mov	r10, #0
.L1233:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	ip, [fp, #-84]
	ldr	r1, [r4, #2672]
	str	r0, [r4, #2676]
	add	r0, r0, r1
	ldr	r2, [ip, #1764]
	ldr	r3, [ip, #1768]
	str	r0, [ip, #1780]
	add	ip, r3, r2
	add	ip, ip, r0
	cmp	ip, #16
	bhi	.L1512
	ldr	r3, [fp, #-112]
	cmp	r0, #0
	sub	r8, r3, #1
	add	r8, r0, r8
	beq	.L1251
	add	r3, r8, #11200
	add	r8, r8, #46848
	add	r3, r3, #49
	add	r8, r8, #9
	add	r8, r5, r8
	str	r8, [fp, #-100]
	mov	r3, r3, asl #2
	add	r9, r5, #44544
	add	ip, r3, #64
	str	ip, [fp, #-52]
	ldr	r8, [fp, #-52]
	add	r0, r5, #44800
	str	r9, [fp, #-48]
	add	lr, r5, #43520
	add	r9, r5, r8
	add	r8, r5, r3
	ldr	r3, [fp, #-48]
	mov	ip, r0
	str	r0, [fp, #-56]
	add	r0, r0, #128
	str	r0, [fp, #-60]
	add	r0, ip, #4
	add	ip, lr, #31
	add	lr, r3, #196
	ldr	r3, [fp, #-56]
	add	r2, r5, #43520
	str	r8, [fp, #-52]
	add	r2, r2, #46
	add	r3, r3, #68
	str	lr, [fp, #-48]
	str	r6, [fp, #-116]
	mov	r6, ip
	mov	lr, r3
	mov	r3, #0
	str	r7, [fp, #-76]
	mov	r8, lr
	str	r10, [fp, #-80]
	mov	r10, r0
	ldr	r7, [fp, #-52]
	str	r4, [fp, #-64]
	str	r5, [fp, #-52]
	mov	r5, r3
	str	r2, [fp, #-120]
	str	r3, [fp, #-68]
	str	r2, [fp, #-56]
	ldr	r4, [fp, #-100]
	b	.L1250
.L1515:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	ldreq	r0, [fp, #-80]
	bne	.L1513
.L1241:
	ldr	r2, [fp, #-76]
	add	r3, r2, r0
	add	r0, r0, #62
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	ldr	r3, [r2, r0, asl #2]
	strb	r1, [r4]
.L1244:
	ldr	r2, [fp, #-60]
	mov	r1, #1
	str	r3, [r2, #4]!
	ldr	r3, [fp, #-52]
	str	r2, [fp, #-60]
	ldr	r0, [r3, #2292]
	bl	BsGet
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	cmp	r0, #0
	str	r3, [fp, #-56]
	bne	.L1514
	cmp	r5, #0
	streq	r5, [fp, #-68]
	beq	.L1248
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-68]
	ldr	r3, [r3, #2672]
	cmp	r3, r5
	moveq	r2, #0
	str	r2, [fp, #-68]
.L1248:
	mov	r3, #0
	str	r3, [r9]
.L1247:
	ldr	r3, [fp, #-84]
	add	r5, r5, #1
	ldr	r2, [fp, #-48]
	sub	r7, r7, #4
	sub	r9, r9, #4
	sub	r4, r4, #1
	ldr	r3, [r3, #1780]
	add	r2, r2, #4
	add	r10, r10, #4
	add	r6, r6, #1
	cmp	r3, r5
	str	r2, [fp, #-48]
	add	r8, r8, #4
	bls	.L1249
	ldr	r3, [fp, #-64]
	ldr	r1, [r3, #2672]
.L1250:
	cmp	r1, r5
	bhi	.L1515
	ldr	r3, [fp, #-76]
	ldr	r1, [r3, #132]
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #2292]
	bl	BsGet
	ldr	r3, [fp, #-52]
	mov	r1, #1
	str	r0, [r10]
	str	r0, [fp, #-100]
	ldr	r0, [r3, #2292]
	bl	BsGet
	ldr	r3, [fp, #-100]
	uxtb	r0, r0
	strb	r0, [r6]
	strb	r0, [r4]
	b	.L1244
.L1217:
	ldr	r2, [fp, #-104]
	cmp	r1, r2
	bcs	.L1218
	rsb	r1, r1, r2
	ldr	r2, [fp, #-108]
	cmp	r1, r2, lsr #1
	rsbhi	r3, r2, r3
	b	.L1218
.L1492:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2576]
	b	.L1215
.L1193:
	ldr	r1, .L1526
	mov	r3, r0
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L1526+12
	ldr	r4, [r1, #68]
	ldr	r1, .L1526+16
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1498:
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #12
	str	r0, [r4, #2700]
	cmp	r3, #24
	bhi	.L1516
	ldr	r3, [r6, #60]
	add	r2, r0, r3
	add	r2, r2, #12
	cmp	r2, #24
	bhi	.L1517
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #12
	str	r0, [r4, #2704]
	cmp	r3, #24
	bhi	.L1518
	ldr	r2, [r6, #64]
	add	r2, r0, r2
	add	r3, r2, #12
	cmp	r3, #24
	bls	.L1305
	ldr	r3, .L1526
	mov	r0, #1
	ldr	r1, .L1526+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1467:
	ldr	r3, [r4, #2636]
	b	.L1294
.L1231:
	ldrb	r3, [r7, #11]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r4, #2583]
	bne	.L1519
.L1256:
	ldrb	r3, [r7, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1344
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #2581]
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2582]
	b	.L1344
.L1508:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2586]
	b	.L1284
.L1264:
	str	r0, [r4, #2748]
.L1263:
	cmp	r8, #2
	bne	.L1265
	b	.L1258
.L1505:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r2, r0, #1
	str	r2, [r4, #2680]
	cmp	r2, #16
	bhi	.L1520
	ldr	r8, [r4, #2636]
	str	r2, [r4, #2744]
	cmp	r8, #0
	movne	r3, #0
	strne	r3, [r4, #2684]
	strne	r3, [r4, #2748]
	bne	.L1263
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r2, r0, #1
	str	r2, [r4, #2684]
	cmp	r2, #16
	strls	r2, [r4, #2748]
	ldrls	r8, [r4, #2636]
	bls	.L1263
	ldr	ip, .L1526
	mov	r3, #16
	ldr	r1, .L1526+24
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1509:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldr	r3, [r4, #2636]
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r4, #2587]
	beq	.L1303
	cmp	r0, #0
	bne	.L1292
	ldr	r2, [r4, #2748]
	cmp	r2, #1
	bhi	.L1290
	b	.L1294
.L1289:
	mov	r3, #2
	b	.L1299
.L1295:
	ldr	r1, [r4, #2680]
	sub	r1, r1, #1
	b	.L1297
.L1510:
	tst	r1, #1
	movne	r2, #1
	bne	.L1222
	b	.L1221
.L1232:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #2672]
	mov	r2, r0
	ldr	r3, [r7, #232]
	cmp	r0, r3
	bhi	.L1521
	cmp	r3, #1
	bls	.L1235
	mov	r10, #0
	mov	r2, #1
.L1236:
	add	r10, r10, #1
	cmp	r3, r2, asl r10
	bhi	.L1236
	str	r10, [fp, #-88]
	b	.L1233
.L1333:
	ldr	ip, .L1526
	mov	r2, r0
	ldr	r1, .L1526+28
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1514:
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r5, #0
	str	r0, [r8]
	beq	.L1246
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #2672]
	cmp	r3, r5
	ldrne	r3, [fp, #-68]
	addne	r0, r0, r3
.L1246:
	str	r0, [r7]
	mov	r3, #1
	str	r0, [fp, #-68]
	str	r3, [r9]
	b	.L1247
.L1513:
	ldr	r3, [fp, #-52]
	ldr	r1, [fp, #-88]
	ldr	r0, [r3, #2292]
	bl	BsGet
	ldr	r3, [fp, #-48]
	cmp	r0, #0
	str	r0, [r3]
	blt	.L1522
	ldr	r3, [fp, #-76]
	ldr	r1, [r3, #232]
	sub	r1, r1, #1
	cmp	r1, r0
	bcs	.L1241
	mov	r8, r5
.L1243:
	ldr	ip, .L1526
	mov	r3, r0
	str	r1, [sp]
	mov	r2, r8
	ldr	r1, .L1526+32
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1201:
	ldr	ip, .L1526
	mov	r2, r8
	ldr	r1, .L1526+36
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1500:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2590]
	b	.L1208
.L1499:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2588]
	cmp	r0, #0
	beq	.L1313
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2589]
	cmp	r0, #0
	bne	.L1310
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #2708]
	bhi	.L1523
.L1314:
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #2712]
	bls	.L1468
	ldr	r3, .L1526
	mov	r0, #1
	ldr	r1, .L1526+40
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r6, #80]
	ldrb	r0, [r4, #2589]	@ zero_extendqisi2
	str	r3, [r4, #2712]
	b	.L1310
.L1249:
	ldr	r2, [fp, #-112]
	cmp	r3, #0
	ldr	r6, [fp, #-116]
	add	r2, r2, #11712
	ldr	r7, [fp, #-76]
	ldr	r5, [fp, #-52]
	add	r2, r2, #23
	ldr	r4, [fp, #-64]
	beq	.L1251
	add	r2, r2, r3
	add	ip, r5, #44800
	mov	r8, r6
	add	ip, ip, #132
	mov	lr, #0
	add	r2, r5, r2, lsl #2
	ldr	r9, [fp, #-108]
	ldr	r6, [fp, #-120]
	ldr	r10, [fp, #-104]
	str	r5, [fp, #-48]
	b	.L1254
.L1525:
	ldr	r0, [r4, #2624]
	ldr	r5, [ip]
	rsb	r1, r10, r0
	add	r1, r1, r5
	ldr	r5, [r2, #-1948]
	mls	r1, r5, r9, r1
	rsb	r0, r0, r1
	str	r0, [r2, #-68]
	str	r1, [r2]
.L1253:
	add	lr, lr, #1
	add	ip, ip, #4
	cmp	r3, lr
	sub	r2, r2, #4
	bls	.L1524
.L1254:
	ldrb	r1, [r6, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1525
	ldr	r1, [ip]
	str	r1, [r2]
	ldr	r0, [r4, #2624]
	rsb	r1, r0, r1
	str	r1, [r2, #-68]
	b	.L1253
.L1484:
	ldr	r3, [r5, #216]
	mov	r0, r5
	cmp	r3, #0
	ldrne	r3, [r5, #188]
	add	r5, r5, #45056
	str	r3, [r4, #2624]
	bl	HEVC_IsNewPic
	ldr	r3, .L1526
	ldr	r1, .L1526+44
	ldr	r3, [r3, #68]
	str	r0, [r5, #68]
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1524:
	ldr	r5, [fp, #-48]
	mov	r6, r8
.L1239:
	ldr	r2, [fp, #-112]
	add	r2, r3, r2
	ldr	r3, [fp, #-84]
	cmp	r2, #16
	str	r2, [r3, #1772]
	bls	.L1231
	ldr	ip, .L1526
	mov	r3, #16
	ldr	r1, .L1526+48
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1223:
	add	r8, r5, #46592
	add	r0, r5, #2288
	add	r8, r8, #212
	add	r0, r0, #4
	ldr	r3, [r7, #228]
	mov	r1, r7
	mov	r2, r8
	bl	HEVC_DecShortTermRefPicSet.isra.19
	cmp	r0, #0
	streq	r8, [fp, #-96]
	beq	.L1226
	ldr	r3, .L1526
	mov	r0, #1
	ldr	r1, .L1526+52
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1519:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2583]
	b	.L1256
.L1511:
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r4, #2668]
	cmp	r0, #0
	ldr	r3, [r7, #228]
	mov	r1, r0
	sub	r3, r3, #1
	blt	.L1229
	cmp	r3, r0
	bcs	.L1230
.L1229:
	ldr	ip, .L1526
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L1526+56
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1497:
	ldr	ip, .L1526
	mov	r0, #1
	ldr	r1, .L1526+60
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1207:
	ldr	ip, .L1526
	mov	r2, r0
	ldr	r1, .L1526+64
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1504:
	ldr	r3, .L1526
	mov	r2, r0
	ldr	r1, .L1526+68
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1522:
	ldr	r7, [fp, #-76]
	mov	r8, r5
	ldr	r1, [r7, #232]
	sub	r1, r1, #1
	b	.L1243
.L1482:
	ldr	ip, .L1526
	movw	r3, #4698
	ldr	r2, .L1526+12
	mov	r0, #1
	ldr	r1, .L1526+72
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1491:
	ldr	r3, .L1526
	mov	r2, r0
	ldr	r1, .L1526+76
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1527:
	.align	2
.L1526:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC100
	.word	.LC112
	.word	.LANCHOR0+748
	.word	.LC96
	.word	.LC119
	.word	.LC109
	.word	.LC125
	.word	.LC106
	.word	.LC98
	.word	.LC121
	.word	.LC97
	.word	.LC107
	.word	.LC102
	.word	.LC103
	.word	.LC115
	.word	.LC99
	.word	.LC124
	.word	.LC36
	.word	.LC101
	.word	.LC111
	.word	.LC114
	.word	.LC117
	.word	.LC122
	.word	.LC120
	.word	.LC113
	.word	.LC116
	.word	.LC118
	.word	.LC126
	.word	.LC110
	.word	.LC108
	.word	.LC105
	.word	.LC123
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC104
.L1268:
	ldr	ip, .L1526+132
	mov	r3, #16
	ldr	r1, .L1526+80
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1496:
	ldr	r3, .L1526+132
	mov	r0, #1
	ldr	r1, .L1526+84
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1517:
	ldr	ip, .L1526+132
	mov	r2, r0
	ldr	r1, .L1526+88
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1501:
	ldr	ip, .L1526+132
	mov	r2, r0
	ldr	r1, .L1526+92
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1251:
	mov	r3, #0
	b	.L1239
.L1523:
	ldr	r3, .L1526+132
	mov	r0, #1
	ldr	r1, .L1526+96
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r6, #76]
	str	r3, [r4, #2708]
	b	.L1314
.L1495:
	ldr	r3, .L1526+132
	mov	r0, #1
	ldr	r1, .L1526+100
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1516:
	ldr	r3, .L1526+132
	mov	r2, r0
	ldr	r1, .L1526+104
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1518:
	ldr	r3, .L1526+132
	mov	r2, r0
	ldr	r1, .L1526+108
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1273:
	ldr	r3, .L1526+132
	mov	r0, #1
	ldr	r1, .L1526+112
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1506:
	ldr	r3, .L1526+132
	mov	r0, #1
	ldr	r1, .L1526+116
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1520:
	ldr	ip, .L1526+132
	mov	r3, #16
	ldr	r1, .L1526+120
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1512:
	ldr	lr, .L1526+132
	mov	ip, #16
	str	r0, [sp]
	mov	r0, #1
	ldr	r1, .L1526+124
	ldr	r4, [lr, #68]
	str	ip, [sp, #4]
	blx	r4
	mvn	r0, #0
	b	.L1458
.L1502:
	ldr	r3, .L1526+132
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L1526+128
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1458
.L1521:
	ldr	ip, .L1526+132
	mov	r0, #1
	ldr	r1, .L1526+136
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1458
	UNWIND(.fnend)
	.size	HEVC_DecSliceSegmentHeader, .-HEVC_DecSliceSegmentHeader
	.align	2
	.global	HEVC_DecHrdParam
	.type	HEVC_DecHrdParam, %function
HEVC_DecHrdParam:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r7, r3
	mov	r5, r0
	mov	r9, r1
	beq	.L1550
	cmp	r2, #0
	bne	.L1575
.L1533:
	ldr	r8, .L1583
	mov	r4, r9
	mov	r6, #0
.L1547:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #40]
	cmp	r0, #0
	movne	r3, #1
	strneb	r3, [r4, #41]
	beq	.L1576
.L1535:
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	mov	r3, #0
	strb	r3, [r4, #42]
	cmp	r2, r3
	str	r3, [r4, #48]
	beq	.L1536
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r4, #44]
	beq	.L1538
.L1579:
	ldr	r2, [r4, #48]
	cmp	r2, #31
	bhi	.L1577
.L1540:
	mov	r2, r4
	mov	r3, #0
.L1549:
	cmp	r3, #0
	beq	.L1578
	cmp	r3, #1
	beq	.L1573
.L1546:
	add	r3, r3, #1
	add	r2, r2, #4
	cmp	r3, #2
	bne	.L1549
.L1545:
	add	r6, r6, #1
	add	r4, r4, #1280
	cmp	r6, #7
	add	r4, r4, #12
	movhi	r0, #0
	movls	r0, #1
	cmp	r7, r6
	movcc	r0, #0
	cmp	r0, #0
	bne	.L1547
.L1572:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1536:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r3, r0
	strb	r3, [r4, #42]
	cmp	r3, #0
	bne	.L1579
.L1538:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	mov	r2, r0
	cmp	r2, #31
	str	r0, [r4, #48]
	bls	.L1540
.L1577:
	ldr	r3, [r8, #68]
	mov	r0, #1
	ldr	r1, .L1583+4
	blx	r3
	mov	r3, #0
	str	r3, [r4, #48]
	b	.L1540
.L1576:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #41]
	b	.L1535
.L1575:
	mov	r1, #1
	ldr	r0, [r0, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r9]
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r9, #1]
	ldrh	r3, [r9]
	cmp	r3, #0
	beq	.L1533
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r9, #2]
	cmp	r0, #0
	bne	.L1580
.L1531:
	mov	r1, #4
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #4
	str	r0, [r9, #16]
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r9, #20]
	bne	.L1581
.L1532:
	mov	r1, #5
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #28]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #32]
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r9, #36]
	b	.L1533
.L1550:
	mvn	r0, #0
	b	.L1572
.L1581:
	mov	r1, #4
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r9, #24]
	b	.L1532
.L1580:
	mov	r1, #8
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #5
	str	r0, [r9, #4]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r9, #8]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r9, #3]
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r9, #36]
	b	.L1531
.L1578:
	ldrb	r1, [r9]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1552
	add	r2, r2, #4
	mov	r3, #1
.L1573:
	ldrb	r1, [r9, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1545
.L1552:
	mov	r1, #0
	str	r6, [fp, #-56]
	mov	r10, r2
	str	r3, [fp, #-48]
	str	r2, [fp, #-52]
	mov	r6, r1
	b	.L1563
.L1548:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	add	r10, r10, #8
	str	r0, [r10, #1068]
	ldr	r3, [r4, #48]
	cmp	r3, r6
	bcc	.L1582
.L1563:
	ldr	r0, [r5, #2292]
	add	r6, r6, #1
	bl	HEVC_ue_v.isra.18
	str	r0, [r10, #52]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r10, #308]
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1548
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r10, #564]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r10, #820]
	b	.L1548
.L1582:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-52]
	ldr	r6, [fp, #-56]
	b	.L1546
.L1584:
	.align	2
.L1583:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC127
	UNWIND(.fnend)
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
	.align	2
	.global	HEVC_DecVuiParam
	.type	HEVC_DecVuiParam, %function
HEVC_DecVuiParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	ip, .L1636
	mov	r5, r0
	mov	r4, r1
	mov	r7, r2
	add	lr, ip, #16
	ldmia	ip, {r0, r1, r2, r3}
	sub	r6, fp, #68
	cmp	r7, #0
	cmpne	r4, #0
	moveq	r8, #1
	movne	r8, #0
	stmia	r6, {r0, r1, r2, r3}
	cmp	r5, #0
	orreq	r8, r8, #1
	ldmia	lr, {r0, r1, r2, r3}
	cmp	r8, #0
	sub	lr, fp, #36
	stmdb	lr, {r0, r1, r2, r3}
	bne	.L1626
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4]
	cmp	r0, #0
	bne	.L1627
.L1589:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #1]
	cmp	r0, #0
	bne	.L1628
.L1591:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3]
	cmp	r0, #0
	bne	.L1629
.L1593:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #6]
	cmp	r0, #0
	bne	.L1630
.L1595:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #8]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #10]
	cmp	r0, #0
	beq	.L1596
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #60]
	ldr	r3, [r7, #64]
	cmp	r3, #3
	bhi	.L1631
	sub	r2, fp, #36
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-32]
	mul	r0, r3, r0
	str	r0, [r4, #60]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	sub	r2, fp, #36
	str	r0, [r4, #64]
	ldr	r3, [r7, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-32]
	mul	r0, r3, r0
	str	r0, [r4, #64]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	sub	r2, fp, #36
	str	r0, [r4, #68]
	ldr	r3, [r7, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-16]
	mul	r0, r3, r0
	str	r0, [r4, #68]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	sub	r2, fp, #36
	str	r0, [r4, #72]
	ldr	r3, [r7, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-16]
	mul	r0, r3, r0
	str	r0, [r4, #72]
.L1596:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #11]
	cmp	r0, #0
	beq	.L1598
	mov	r1, #32
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #76]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #80]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #12]
	cmp	r0, #0
	bne	.L1632
.L1599:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	bne	.L1633
.L1598:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #14]
	cmp	r0, #0
	moveq	r3, r0
	bne	.L1634
.L1587:
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1634:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #15]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #16]
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #4096
	str	r0, [r4, #88]
	bcs	.L1635
.L1600:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #92]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #96]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #100]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	mov	r3, #0
	str	r0, [r4, #104]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1630:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #52]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #56]
	b	.L1595
.L1629:
	mov	r1, #3
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #36]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	cmp	r0, #0
	beq	.L1593
	mov	r1, #8
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #40]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #44]
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r4, #48]
	b	.L1593
.L1628:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #2]
	b	.L1591
.L1627:
	mov	r1, #8
	ldr	r0, [r5, #2292]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r4, #24]
	bne	.L1589
	mov	r1, #16
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #28]
	ldr	r0, [r5, #2292]
	bl	BsGet
	str	r0, [r4, #32]
	b	.L1589
.L1633:
	ldr	r3, [r7, #56]
	mov	r2, #1
	ldr	r1, .L1636+4
	mov	r0, r5
	bl	HEVC_DecHrdParam
	cmp	r0, #0
	beq	.L1598
	ldr	r3, .L1636+8
	mov	r0, #1
	ldr	r1, .L1636+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r3, #0
	b	.L1587
.L1632:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r4, #84]
	b	.L1599
.L1635:
	ldr	r3, .L1636+8
	mov	r0, #1
	ldr	r1, .L1636+16
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1600
.L1626:
	ldr	lr, .L1636+8
	movw	r3, #10451
	add	r2, ip, #32
	ldr	r1, .L1636+20
	mov	r0, #1
	ldr	r4, [lr, #68]
	blx	r4
	mvn	r3, #0
	b	.L1587
.L1631:
	ldr	r3, .L1636+8
	mov	r0, #1
	ldr	r1, .L1636+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r3, #0
	b	.L1587
.L1637:
	.align	2
.L1636:
	.word	.LANCHOR0+776
	.word	.LANCHOR5-3464
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC129
	.word	.LC130
	.word	.LC36
	.word	.LC128
	UNWIND(.fnend)
	.size	HEVC_DecVuiParam, .-HEVC_DecVuiParam
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
	subs	r4, r0, #0
	beq	.L1642
	ldr	r0, [r4, #2292]
	bl	BsResidBits
	cmp	r0, #0
	ble	.L1641
	ldr	r3, [r4, #2316]
	ldr	r3, [r3, #12]
	add	r3, r3, #3
	cmp	r0, r3
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1641:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1642:
	ldr	ip, .L1643
	movw	r3, #10683
	ldr	r2, .L1643+4
	mov	r0, #1
	ldr	r1, .L1643+8
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1644:
	.align	2
.L1643:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+828
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_MoreRbspData, .-HEVC_MoreRbspData
	.align	2
	.type	HEVC_ProcessVPS, %function
HEVC_ProcessVPS:
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
	mov	r8, r1
	mov	r7, r0
	mov	r1, #2
	ldr	r0, [r0, #2292]
	bl	BsGet
	cmp	r0, #3
	str	r0, [r8, #12]
	beq	.L1646
	ldr	r3, .L1698
	mov	r2, r0
	ldr	r1, .L1698+4
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
.L1646:
	mov	r1, #6
	ldr	r0, [r7, #2292]
	bl	BsGet
	cmp	r0, #63
	str	r0, [r8, #16]
	bhi	.L1690
	mov	r1, #3
	ldr	r0, [r7, #2292]
	bl	BsGet
	cmp	r0, #8
	str	r0, [fp, #-152]
	bhi	.L1691
	ldr	r3, [fp, #-152]
	mov	r1, #1
	add	r3, r3, #1
	str	r3, [r8, #20]
	ldr	r0, [r7, #2292]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r8, #1]
	ldr	r0, [r7, #2292]
	bl	BsGet
	movw	r3, #65535
	cmp	r0, r3
	str	r0, [r8, #24]
	bne	.L1692
	add	r1, r8, #12416
	ldr	r3, [fp, #-152]
	add	r1, r1, #20
	mov	r2, #1
	mov	r0, r7
	bl	HEVC_DecPTL
	subs	r4, r0, #0
	bne	.L1693
	mov	r1, #1
	ldr	r0, [r7, #2292]
	bl	BsGet
	ldr	r3, [fp, #-152]
	cmp	r3, #0
	addgt	r5, r8, #48
	ldrgt	r6, [fp, #-152]
	strb	r0, [r8, #7]
	bgt	.L1658
	b	.L1656
.L1655:
	add	r4, r4, #1
	cmp	r4, r6
	beq	.L1656
.L1658:
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	add	r0, r0, #1
	str	r0, [r5, #4]!
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r5, #32]
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r5, #64]
	ldrb	r3, [r8, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1655
	ldr	r0, [fp, #-152]
	add	r2, r4, #1
	cmp	r0, r2
	ble	.L1656
	add	r3, r4, #13
	add	r3, r8, r3, lsl #2
.L1657:
	ldr	r1, [r8, #52]
	add	r2, r2, #1
	cmp	r2, r0
	str	r1, [r3, #4]!
	ldr	r1, [r8, #84]
	str	r1, [r3, #32]
	ldr	r1, [r8, #116]
	str	r1, [r3, #64]
	bne	.L1657
.L1656:
	mov	r1, #6
	ldr	r0, [r7, #2292]
	bl	BsGet
	str	r0, [r8, #28]
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #1024
	str	r0, [r8, #32]
	bhi	.L1694
	cmp	r0, #1
	ble	.L1659
	ldr	r3, [r8, #28]
	add	r6, r8, #148
	ldr	r10, .L1698
	mov	r9, #1
.L1660:
	cmp	r3, #0
	movgt	r5, r6
	movgt	r4, #0
	ble	.L1662
.L1661:
	mov	r3, r9
	str	r4, [sp]
	mov	r1, #100
	ldr	r2, .L1698+8
	ldr	ip, [r10, #72]
	sub	r0, fp, #144
	blx	ip
	mov	r1, #1
	ldr	r0, [r7, #2292]
	add	r4, r4, r1
	bl	BsGet
	str	r0, [r5, #4]!
	ldr	r3, [r8, #28]
	cmp	r3, r4
	bgt	.L1661
.L1662:
	ldr	r2, [r8, #32]
	add	r9, r9, #1
	add	r6, r6, #4
	cmp	r2, r9
	bgt	.L1660
.L1659:
	mov	r1, #1
	ldr	r0, [r7, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #6]
	cmp	r0, #0
	beq	.L1668
	mov	r1, #32
	ldr	r0, [r7, #2292]
	bl	BsGet
	mov	r1, #32
	str	r0, [r8, #36]
	ldr	r0, [r7, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #40]
	ldr	r0, [r7, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #5]
	cmp	r0, #0
	bne	.L1695
.L1666:
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #1024
	str	r0, [r8, #48]
	bcs	.L1696
	cmp	r0, #0
	ble	.L1668
	add	r2, r8, #8192
	mov	r3, #1
	add	r5, r8, #4224
	mov	r4, #0
	str	r3, [r2, #148]
	mov	r6, r2
	ldr	r0, [r7, #2292]
	add	r5, r5, #24
	bl	HEVC_ue_v.isra.18
	add	r3, r8, #4096
	str	r0, [r3, #148]
	ldr	r0, [r6, #148]
	ldr	r6, [fp, #-152]
.L1669:
	uxtb	r2, r0
	mov	r3, r6
	ldr	r1, .L1698+12
	mov	r0, r7
	bl	HEVC_DecHrdParam
	add	r4, r4, #1
	cmp	r0, #0
	bne	.L1697
	ldr	r3, [r8, #48]
	cmp	r3, r4
	ble	.L1668
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r4, #0
	mov	r1, #1
	str	r0, [r5], #4
	ldrle	r0, [r5, #4092]
	ble	.L1669
	ldr	r0, [r7, #2292]
	bl	BsGet
	str	r0, [r5, #4092]
	b	.L1669
.L1668:
	mov	r1, #1
	ldr	r0, [r7, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #3]
	cmp	r0, #0
	bne	.L1685
.L1665:
	mov	r0, #0
.L1648:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1674:
	ldr	r0, [r7, #2292]
	bl	BsGet
	strb	r0, [r8, #4]
.L1685:
	mov	r0, r7
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L1674
	b	.L1665
.L1697:
	ldr	r3, .L1698
	mov	r0, #1
	ldr	r1, .L1698+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1695:
	ldr	r0, [r7, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r8, #44]
	b	.L1666
.L1692:
	ldr	r3, .L1698
	mov	r0, #1
	ldr	r1, .L1698+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1648
.L1690:
	ldr	r3, .L1698
	mov	r0, #1
	ldr	r1, .L1698+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1648
.L1693:
	ldr	r3, .L1698
	mov	r0, #1
	ldr	r1, .L1698+28
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1648
.L1691:
	ldr	r3, .L1698
	mov	r2, r0
	ldr	r1, .L1698+32
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1648
.L1694:
	ldr	ip, .L1698
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L1698+36
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1648
.L1696:
	ldr	ip, .L1698
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L1698+40
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1648
.L1699:
	.align	2
.L1698:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC131
	.word	.LC137
	.word	.LANCHOR5-3464
	.word	.LC139
	.word	.LC134
	.word	.LC132
	.word	.LC135
	.word	.LC133
	.word	.LC136
	.word	.LC138
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
	subs	r4, r0, #0
	beq	.L1707
	mov	r1, #4
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r0, #15
	mov	r6, r0
	bhi	.L1708
	movw	r7, #12820
	ldr	r3, [r4, #2296]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r9, [r3, r5]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L1709
	str	r0, [r2, #8]
	mov	r0, r4
	ldr	r1, [r4, #2296]
	add	r1, r1, r5
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L1710
	ldr	r3, [r4, #2296]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2296]
	strb	r2, [r3, r5]
.L1702:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1709:
	ldr	r9, .L1712
	mov	r0, r4
	ldr	r1, .L1712+4
	str	r6, [r9, #-1264]
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L1711
	ldr	r1, .L1712+8
	mov	r3, #1
	ldr	r0, [r4, #2296]
	mov	r2, r7
	strb	r3, [r9, #-1270]
	ldr	r4, [r1, #56]
	add	r0, r0, r5
	strb	r3, [r9, #-1272]
	ldr	r1, .L1712+4
	blx	r4
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1711:
	ldr	r3, .L1712+8
	mov	r2, r6
	ldr	r1, .L1712+12
	mov	r0, #1
	mvn	r8, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1702
.L1708:
	ldr	r3, .L1712+8
	mov	r0, #1
	ldr	r1, .L1712+16
	mvn	r8, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1702
.L1710:
	ldr	r3, .L1712+8
	mov	r2, r6
	ldr	r1, .L1712+20
	mov	r0, #1
	mvn	r8, #0
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r4, #2296]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2296]
	strb	r9, [r3, r5]
	b	.L1702
.L1707:
	ldr	ip, .L1712+8
	movw	r3, #1549
	ldr	r2, .L1712+24
	mov	r0, #1
	ldr	r1, .L1712+28
	mvn	r8, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1702
.L1713:
	.align	2
.L1712:
	.word	.LANCHOR6
	.word	.LANCHOR6-1272
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC141
	.word	.LC140
	.word	.LC142
	.word	.LANCHOR0+848
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecVPS, .-HEVC_DecVPS
	.align	2
	.type	HEVC_ProcessSPS, %function
HEVC_ProcessSPS:
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
	mov	r5, r0
	ldr	r0, [r0, #2292]
	mov	r4, r1
	bl	HEVC_ue_v.isra.18
	cmp	r0, #1
	mov	r7, r0
	str	r0, [r4, #64]
	beq	.L1715
	cmp	r0, #3
	ldr	r3, .L1902
	bhi	.L1880
	mov	r2, r0
	ldr	r1, .L1902+4
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
.L1717:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1880:
	ldr	r1, .L1902+8
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1715:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #8192
	str	r0, [r4, #72]
	bhi	.L1881
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #4096
	str	r0, [r4, #76]
	bhi	.L1882
	ldr	r2, [r4, #760]
	ldr	r3, [r4, #72]
	cmp	r2, #120
	mul	r0, r3, r0
	beq	.L1721
	bgt	.L1722
	cmp	r2, #60
	beq	.L1723
	ble	.L1883
	cmp	r2, #90
	beq	.L1726
	cmp	r2, #93
	beq	.L1727
	cmp	r2, #63
	bne	.L1720
	mov	r2, #61440
	mov	r3, #245760
	b	.L1728
.L1722:
	cmp	r2, #156
	beq	.L1729
	bgt	.L1730
	cmp	r2, #150
	beq	.L1729
	cmp	r2, #153
	beq	.L1729
	cmp	r2, #123
	beq	.L1721
.L1720:
	ldr	r3, .L1902
	mov	r0, #1
	ldr	r1, .L1902+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1730:
	cmp	r2, #183
	beq	.L1731
	cmp	r2, #186
	beq	.L1731
	cmp	r2, #180
	bne	.L1720
.L1731:
	mov	r2, #8912896
	mov	r3, #35651584
.L1728:
	cmp	r2, r0
	movcs	r3, #16
	strcs	r3, [r4, #236]
	bcs	.L1733
	cmp	r0, r3, lsr #1
	movls	r3, #12
	strls	r3, [r4, #236]
	bls	.L1733
	add	r3, r3, r3, lsl #1
	cmp	r0, r3, lsr #2
	movls	r3, #8
	movhi	r3, #6
	str	r3, [r4, #236]
.L1733:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #80]
	beq	.L1736
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #64]
	ldr	r6, .L1902+16
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #860]
	mul	r0, r3, r0
	str	r0, [r4, #84]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #84]
	ldr	r1, [r4, #72]
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #860]
	mul	r0, r3, r0
	add	r2, r0, r2
	cmp	r1, r2
	str	r0, [r4, #88]
	bcc	.L1884
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #64]
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #876]
	mul	r0, r3, r0
	str	r0, [r4, #92]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #92]
	ldr	r1, [r4, #76]
	add	r6, r6, r3, lsl #2
	ldr	r3, [r6, #876]
	mul	r0, r3, r0
	add	r2, r0, r2
	cmp	r1, r2
	str	r0, [r4, #96]
	bcc	.L1885
.L1736:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, .L1902
	add	r2, r0, #8
	str	r2, [r4, #100]
	cmp	r2, #8
	streq	r3, [fp, #-56]
	beq	.L1739
	cmp	r0, #6
	bhi	.L1886
	str	r3, [fp, #-56]
	mov	r0, #1
	ldr	r3, [r3, #68]
	ldr	r1, .L1902+20
	blx	r3
	ldr	r3, .L1902+24
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L1739
	ldr	r0, [r4, #100]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-52]
	mov	r1, #119
	sub	r2, fp, #52
	str	r0, [fp, #-48]
	ldr	r0, [r5, #244]
	blx	r6
.L1739:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r2, r0, #8
	str	r2, [r4, #108]
	cmp	r2, #8
	beq	.L1743
	ldr	r3, [fp, #-56]
	cmp	r0, #6
	ldr	r3, [r3, #68]
	bhi	.L1887
	ldr	r1, .L1902+28
	mov	r0, #1
	blx	r3
	ldr	r3, .L1902+24
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L1743
	ldr	r0, [r4, #108]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-52]
	mov	r1, #119
	sub	r2, fp, #52
	str	r0, [fp, #-48]
	ldr	r0, [r5, #244]
	blx	r6
.L1743:
	ldr	r3, [r4, #100]
	str	r3, [r5, #192]
	ldr	r3, [r4, #108]
	str	r3, [r5, #196]
	ldr	r0, [r4, #100]
	ldr	r1, [r4, #108]
	mov	r2, r0, asl #3
	mov	r3, r1, asl #3
	sub	r2, r2, r0, asl #1
	sub	r3, r3, r1, asl #1
	sub	r2, r2, #48
	sub	r3, r3, #48
	str	r2, [r4, #104]
	str	r3, [r4, #112]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #12
	bhi	.L1888
	add	r0, r0, #4
	mov	r1, #1
	str	r0, [r4, #128]
	mov	r6, r4
	str	r0, [r4, #132]
	mov	r10, #0
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #3]
	b	.L1753
.L1747:
	ldr	r2, [r4, #56]
	add	r10, r10, #1
	cmp	r2, r10
	bcc	.L1752
.L1753:
	ldr	r0, [r5, #2292]
	add	r6, r6, #4
	bl	HEVC_ue_v.isra.18
	add	r0, r0, #1
	str	r0, [r6, #376]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r8, [r6, #376]
	str	r0, [r6, #408]
	ldr	r0, [r5, #2292]
	ldr	r9, [r4, #380]
	bl	HEVC_ue_v.isra.18
	str	r0, [r6, #440]
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1747
	ldr	r0, [r4, #56]
	add	r2, r10, #1
	cmp	r2, r0
	addls	r3, r10, #95
	addls	r3, r4, r3, lsl #2
	bhi	.L1752
.L1751:
	ldr	r1, [r4, #380]
	add	r2, r2, #1
	cmp	r2, r0
	str	r1, [r3, #4]!
	ldr	r1, [r4, #412]
	str	r1, [r3, #32]
	ldr	r1, [r4, #444]
	str	r1, [r3, #64]
	bls	.L1751
.L1752:
	ldr	r3, [r4, #236]
	cmp	r8, r9
	movcc	r8, r9
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r4, #236]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #3
	str	r0, [r4, #136]
	bhi	.L1889
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #3
	str	r0, [r4, #144]
	bhi	.L1890
	ldr	r3, [r4, #136]
	add	r3, r3, #3
	str	r3, [r4, #140]
	add	r0, r0, r3
	str	r0, [r4, #148]
	sub	r2, r0, #4
	cmp	r2, #2
	bhi	.L1891
	mov	r2, #1
	ldr	r8, [r4, #72]
	mov	r6, r2, asl r0
	mov	r3, r2, asl r3
	str	r6, [r4, #156]
	str	r6, [r4, #160]
	mov	r1, r6
	str	r6, [r4, #164]
	mov	r0, r8
	str	r3, [r4, #152]
	bl	__aeabi_uidivmod
	mov	r0, r8
	cmp	r1, #0
	mov	r1, r6
	beq	.L1756
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L1757:
	ldr	r8, [r4, #76]
	mov	r1, r6
	str	r0, [r4, #240]
	mov	r0, r8
	bl	__aeabi_uidivmod
	mov	r0, r8
	cmp	r1, #0
	mov	r1, r6
	beq	.L1758
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L1759:
	str	r0, [r4, #244]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #3
	str	r0, [r4, #168]
	bhi	.L1892
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #3
	str	r0, [r4, #176]
	bhi	.L1893
	ldr	r3, [r4, #168]
	ldr	r2, [r4, #140]
	add	r3, r3, #2
	str	r3, [r4, #172]
	cmp	r3, r2
	bcs	.L1894
	add	r0, r0, r3
	str	r0, [r4, #180]
	cmp	r0, #5
	bhi	.L1763
	ldr	r3, [r4, #148]
	cmp	r0, r3
	bhi	.L1763
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #172]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #200]
	bhi	.L1895
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #172]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #208]
	bhi	.L1896
	ldr	r3, [r4, #200]
	add	r0, r0, #1
	mov	ip, #0
	str	r0, [r4, #212]
	add	r3, r3, #1
	str	r3, [r4, #204]
	str	ip, [r5, #228]
	mov	r2, #1
	ldr	r3, [r4, #172]
	ldr	r0, [r4, #160]
	ldr	r1, [r4, #144]
	mov	r3, r2, asl r3
	cmp	r3, r0, lsr r1
	bcs	.L1802
	mov	lr, r2
	b	.L1768
.L1803:
	mov	r2, ip
.L1768:
	str	r2, [r5, #228]
	add	ip, r2, #1
	ldr	r3, [r4, #172]
	ldr	r0, [r4, #160]
	add	r3, r2, r3
	ldr	r1, [r4, #144]
	mov	r3, lr, asl r3
	cmp	r3, r0, lsr r1
	bcc	.L1803
.L1767:
	mov	r6, #1
	add	r2, r2, r1
	str	r6, [r4, #224]
	mov	r3, #0
	str	r2, [r4, #216]
	mov	r1, r6
	str	r3, [r4, #220]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	cmp	r0, #0
	beq	.L1769
	mov	r1, r6
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #6]
	cmp	r0, #0
	bne	.L1897
.L1769:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #8]
	cmp	r6, #0
	bne	.L1770
	ldr	r2, [r4, #76]
	cmp	r2, #64
	bls	.L1898
.L1770:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #116]
	beq	.L1771
	mov	r1, #4
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #4
	add	r0, r0, #1
	str	r0, [r4, #120]
	ldr	r0, [r5, #2292]
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r4, #124]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #2
	str	r0, [r4, #184]
	bhi	.L1899
.L1772:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #2
	str	r0, [r4, #192]
	bhi	.L1900
.L1773:
	ldr	r2, [r4, #184]
	add	r2, r2, #3
	str	r2, [r4, #188]
	add	r0, r0, r2
	str	r0, [r4, #196]
	cmp	r0, #5
	bhi	.L1774
	ldr	r3, [r4, #148]
	cmp	r0, r3
	bhi	.L1774
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #9]
.L1771:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #64
	str	r0, [r4, #228]
	bhi	.L1776
	cmp	r0, #0
	beq	.L1782
	add	r9, r5, #2288
	add	r8, r4, #2720
	add	r9, r9, #4
	add	r8, r8, #12
	mov	r6, #0
	b	.L1781
.L1780:
	ldr	r3, [r4, #228]
	cmp	r3, r6
	bls	.L1782
.L1781:
	mov	r3, r6
	mov	r2, r8
	mov	r1, r4
	mov	r0, r9
	bl	HEVC_DecShortTermRefPicSet.isra.19
	add	r6, r6, #1
	add	r8, r8, #204
	cmp	r0, #0
	beq	.L1780
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1727:
	mov	r2, #245760
	mov	r3, #983040
	b	.L1728
.L1758:
	bl	__aeabi_uidiv
	b	.L1759
.L1756:
	bl	__aeabi_uidiv
	b	.L1757
.L1782:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #10]
	cmp	r0, #0
	beq	.L1779
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #32
	str	r0, [r4, #232]
	bhi	.L1785
	cmp	r0, #0
	addne	r9, r4, #244
	addne	r8, r4, #15
	movne	r6, #0
	beq	.L1779
.L1787:
	ldr	r1, [r4, #128]
	add	r6, r6, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r9, #4]!
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r8, #1]!
	ldr	r3, [r4, #232]
	cmp	r3, r6
	bhi	.L1787
.L1779:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	beq	.L1784
	mov	r2, r4
	add	r1, r4, #2624
	mov	r0, r5
	bl	HEVC_DecVuiParam
	cmp	r0, #0
	bne	.L1901
.L1784:
	ldr	r3, [r4, #2648]
	ldr	r0, [r4, #2652]
	cmp	r3, #0
	ldr	r1, [r4, #2656]
	ldr	r8, [r4, #72]
	ldr	r9, [r4, #76]
	ble	.L1806
	subs	ip, r3, #255
	movne	ip, #1
	cmp	r3, #16
	movle	lr, #0
	andgt	lr, ip, #1
	cmp	lr, #0
	bne	.L1806
	cmp	r0, #0
	cmpne	r1, #0
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, #255
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r2, #0
	bne	.L1807
	cmp	r3, #1
	moveq	r7, #5
	moveq	r2, r7
	beq	.L1788
	cmp	ip, #0
	ldrne	r2, .L1902+16
	addne	r3, r2, r3, lsl #3
	ldrne	r0, [r3, #892]
	ldrne	r1, [r3, #896]
	mov	r0, r0, asl #10
	bl	__aeabi_idiv
	mov	r1, r9
	mov	r6, r0
	mov	r0, r8, asl #10
	bl	__aeabi_idiv
	movw	r2, #2405
	mul	r0, r0, r6
	add	r3, r0, #1020
	cmp	r0, #0
	add	r3, r3, #3
	movlt	r0, r3
	mov	r3, r0, asr #10
	cmp	r3, r2
	movw	r2, #2262
	rsble	r1, r3, #2400
	subgt	r1, r3, #2400
	addle	r1, r1, #6
	subgt	r1, r1, #6
	cmp	r3, r2
	bgt	.L1792
	rsb	r2, r3, #2256
	add	r2, r2, #7
	cmp	r2, r1
	ble	.L1793
.L1810:
	mov	r7, #4
	mov	r2, r7
.L1788:
	ldr	r3, [fp, #-56]
	mov	r0, #22
	ldr	r1, .L1902+36
	ldr	r3, [r3, #68]
	blx	r3
	str	r7, [r4, #2644]
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #14]
	cmp	r0, #0
	bne	.L1875
.L1800:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r4]
	b	.L1717
.L1799:
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #15]
.L1875:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L1799
	b	.L1800
.L1883:
	cmp	r2, #0
	beq	.L1725
	cmp	r2, #30
	bne	.L1720
.L1725:
	mov	r2, #9216
	mov	r3, #36864
	b	.L1728
.L1898:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+40
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L1902+24
	ldr	r4, [r3]
	cmp	r4, #0
	mvneq	r0, #0
	beq	.L1717
	ldr	r0, [r5, #244]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #102
	blx	r4
	mvn	r0, #0
	b	.L1717
.L1726:
	mov	r2, #138240
	mov	r3, #552960
	b	.L1728
.L1729:
	mov	r2, #2228224
	mov	r3, #8912896
	b	.L1728
.L1723:
	mov	r2, #30720
	mov	r3, #122880
	b	.L1728
.L1721:
	mov	r2, #557056
	mov	r3, #2228224
	b	.L1728
.L1806:
	mov	r7, #0
	mov	r2, r7
	b	.L1788
.L1897:
	add	r1, r4, #860
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	beq	.L1769
	ldr	r3, [fp, #-56]
	mov	r0, r6
	ldr	r1, .L1902+44
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1763:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+48
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1900:
	ldr	r3, [fp, #-56]
	mov	r2, r0
	ldr	r1, .L1902+52
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [r4, #192]
	b	.L1773
.L1899:
	ldr	r3, [fp, #-56]
	mov	r2, r0
	ldr	r1, .L1902+56
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1772
.L1802:
	mov	r2, ip
	b	.L1767
.L1881:
	ldr	r3, .L1902
	mov	r0, r7
	ldr	r1, .L1902+60
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1888:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+64
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1889:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+68
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1886:
	ldr	r1, .L1902+72
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1887:
	ldr	r1, .L1902+76
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1892:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+80
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1792:
	sub	r2, r3, #2256
	sub	r2, r2, #7
	cmp	r2, r1
	bgt	.L1810
.L1793:
	movw	r1, #1819
	cmp	r3, r1
	bgt	.L1794
	rsb	r1, r3, #1808
	add	r1, r1, #12
	cmp	r1, r2
	ble	.L1795
.L1812:
	mov	r7, #3
	mov	r2, r7
	b	.L1788
.L1774:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+84
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1895:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+88
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1807:
	mov	r7, lr
	mov	r2, lr
	b	.L1788
.L1884:
	ldr	r3, .L1902
	mov	r0, #1
	ldr	r1, .L1902+92
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1882:
	ldr	r3, .L1902
	mov	r0, r7
	ldr	r1, .L1902+96
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1891:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+100
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1890:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+104
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1894:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+108
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1893:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+112
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1896:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+116
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1794:
	sub	r1, r3, #1808
	sub	r1, r1, #12
	cmp	r1, r2
	bgt	.L1812
.L1795:
	movw	r2, #1364
	cmp	r3, r2
	rsble	r3, r3, #1360
	subgt	r3, r3, #1360
	addle	r3, r3, #5
	subgt	r3, r3, #5
	cmp	r1, r3
	movge	r2, #1
	movlt	r7, #2
	movlt	r2, r7
	b	.L1788
.L1885:
	ldr	r3, .L1902
	mov	r0, #1
	ldr	r1, .L1902+120
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1776:
	ldr	r3, [fp, #-56]
	mov	r2, #64
	ldr	r1, .L1902+124
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1785:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+128
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1901:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r1, .L1902+132
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1717
.L1903:
	.align	2
.L1902:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC144
	.word	.LC143
	.word	.LC147
	.word	.LANCHOR0
	.word	.LC151
	.word	g_event_report
	.word	.LC153
	.word	.LC170
	.word	.LC173
	.word	.LC165
	.word	.LC164
	.word	.LC161
	.word	.LC167
	.word	.LC166
	.word	.LC145
	.word	.LC154
	.word	.LC155
	.word	.LC150
	.word	.LC152
	.word	.LC158
	.word	.LC168
	.word	.LC162
	.word	.LC148
	.word	.LC146
	.word	.LC157
	.word	.LC156
	.word	.LC160
	.word	.LC159
	.word	.LC163
	.word	.LC149
	.word	.LC169
	.word	.LC171
	.word	.LC172
	UNWIND(.fnend)
	.size	HEVC_ProcessSPS, .-HEVC_ProcessSPS
	.align	2
	.global	HEVC_DecSPS
	.type	HEVC_DecSPS, %function
HEVC_DecSPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 400
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #404)
	sub	sp, sp, #404
	subs	r4, r0, #0
	beq	.L1916
	ldr	r5, .L1924
	movw	r2, #15788
	mov	r1, #0
	ldr	r0, .L1924+4
	ldr	r9, .L1924+8
	ldr	r3, [r5, #48]
	blx	r3
	mov	r2, #384
	ldr	r3, [r5, #48]
	mov	r1, #0
	sub	r0, fp, #428
	blx	r3
	mov	r1, #4
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldr	r2, [r4, #148]
	cmp	r2, r0
	mov	r10, r0
	bls	.L1917
	mov	r1, #3
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r0, #8
	mov	r8, r0
	bhi	.L1918
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r3, r8
	mov	r2, #1
	sub	r1, fp, #428
	str	r0, [fp, #-440]
	mov	r0, r4
	bl	HEVC_DecPTL
	cmp	r0, #0
	bne	.L1919
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r2, [r4, #152]
	cmp	r0, r2
	mov	r7, r0
	bcs	.L1920
	movw	r3, #15788
	ldr	r2, [r4, #2300]
	mul	r6, r3, r0
	ldrb	r0, [fp, #-440]	@ zero_extendqisi2
	add	r2, r2, r6
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1921
	str	r10, [r2, #52]
	sub	r1, fp, #428
	ldr	ip, [r4, #2300]
	mov	r2, #384
	str	r3, [fp, #-440]
	add	ip, ip, r6
	str	r8, [ip, #56]
	ldr	ip, [r4, #2300]
	add	ip, ip, r6
	strb	r0, [ip, #2]
	ldr	r0, [r4, #2300]
	ldr	r8, [r5, #52]
	add	r0, r0, r6
	add	r0, r0, #476
	blx	r8
	ldr	r2, [r4, #2300]
	mov	r0, r4
	add	r2, r2, r6
	str	r7, [r2, #60]
	ldr	r1, [r4, #2300]
	add	r1, r1, r6
	bl	HEVC_ProcessSPS
	subs	r8, r0, #0
	bne	.L1922
	ldr	ip, [r4, #2300]
	mov	r1, #1
	add	r0, r4, #27136
	movw	r2, #15788
	add	r0, r0, #52
	strb	r1, [ip, r6]
	ldr	r3, [r4, #2300]
	add	r3, r3, r6
	strb	r1, [r3, #1]
	ldr	r1, [r4, #2300]
	ldr	r3, [r5, #52]
	add	r1, r1, r6
	blx	r3
.L1906:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1921:
	sub	r1, fp, #428
	str	r8, [r9, #-1216]
	mov	r2, #384
	strb	r0, [r9, #-1270]
	ldr	r8, [r5, #52]
	sub	r0, r9, #796
	str	r10, [r9, #-1220]
	blx	r8
	ldr	r1, .L1924+4
	mov	r0, r4
	str	r7, [r9, #-1212]
	bl	HEVC_ProcessSPS
	subs	r8, r0, #0
	bne	.L1923
	ldr	r0, [r4, #2300]
	mov	r1, #1
	ldr	r7, [r5, #56]
	movw	r2, #15788
	strb	r1, [r9, #-1272]
	add	r0, r0, r6
	strb	r1, [r9, #-1271]
	ldr	r1, .L1924+4
	blx	r7
	ldr	r1, [r4, #2300]
	add	r0, r4, #27136
	movw	r2, #15788
	ldr	r4, [r5, #52]
	add	r1, r1, r6
	add	r0, r0, #52
	blx	r4
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1920:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1924+12
	blx	r3
	ldr	r2, [r4, #152]
	cmp	r7, r2
	bcc	.L1915
	ldr	r3, .L1924+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L1915
	str	r2, [fp, #-432]
	mov	r3, #8
	str	r7, [fp, #-436]
	sub	r2, fp, #436
	ldr	r0, [r4, #244]
	mov	r1, #109
	blx	r5
	mvn	r8, #0
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1915:
	mvn	r8, #0
	b	.L1906
.L1917:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1924+20
	mvn	r8, #0
	blx	r3
	b	.L1906
.L1918:
	ldr	r3, [r5, #68]
	mov	r2, #8
	ldr	r1, .L1924+24
	mov	r0, #1
	blx	r3
	mvn	r8, #0
	b	.L1906
.L1919:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1924+28
	mvn	r8, #0
	blx	r3
	b	.L1906
.L1922:
	mov	r2, r7
	ldr	r1, .L1924+32
	ldr	r5, [r5, #68]
	mov	r0, #1
	blx	r5
	ldr	r1, [r4, #2300]
	mov	r2, #1
	ldr	r3, [fp, #-440]
	mvn	r8, #0
	strb	r2, [r1, r6]
	ldr	r2, [r4, #2300]
	add	r6, r2, r6
	strb	r3, [r6, #1]
	b	.L1906
.L1923:
	ldr	r1, [r4, #2300]
	add	r0, r4, #27136
	ldr	r3, [r5, #52]
	movw	r2, #15788
	add	r1, r1, r6
	add	r0, r0, #52
	blx	r3
	ldr	r3, [r5, #68]
	mov	r2, r7
	ldr	r1, .L1924+36
	mov	r0, #1
	mvn	r8, #0
	blx	r3
	b	.L1906
.L1916:
	ldr	ip, .L1924
	movw	r3, #2281
	ldr	r2, .L1924+40
	mov	r0, #1
	ldr	r1, .L1924+44
	mvn	r8, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1906
.L1925:
	.align	2
.L1924:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR6-1272
	.word	.LANCHOR6
	.word	.LC177
	.word	g_event_report
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC179
	.word	.LC178
	.word	.LANCHOR0+1028
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecSPS, .-HEVC_DecSPS
	.align	2
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
	mov	r7, #1
	mov	r5, r0
	strb	r7, [r1, #16]
	str	r7, [r1, #68]
	mov	r4, r1
	str	r7, [r1, #72]
	ldr	r0, [r0, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #0
	str	r0, [r4, #32]
	blt	.L1927
	ldr	r3, [r5, #152]
	cmp	r0, r3
	bge	.L1927
	ldr	r3, [r5, #2300]
	movw	r6, #15788
	mla	r6, r6, r0, r3
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2034
	mov	r1, r7
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, r7
	str	r0, [r4, #36]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #3]
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r0, r0, #1
	str	r0, [r4, #40]
	cmp	r0, #15
	bhi	.L2035
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r0, r0, #1
	str	r0, [r4, #44]
	cmp	r0, #15
	bhi	.L2036
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	ldr	r3, [r6, #104]
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
	bne	.L2037
	add	r0, r0, #26
	mov	r1, r7
	str	r0, [r4, #48]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #6]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	streq	r0, [r4, #52]
	bne	.L2038
.L1936:
	str	r0, [r4, #56]
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #12
	str	r0, [r4, #60]
	cmp	r3, #24
	bhi	.L2039
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #12
	str	r0, [r4, #64]
	cmp	r3, #24
	bhi	.L2040
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #13]
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #14]
	bne	.L2041
	ldr	r3, [r6, #240]
	strh	r3, [r4, #176]	@ movhi
	ldr	r3, [r6, #244]
	strh	r3, [r4, #216]	@ movhi
.L1975:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	ble	.L1980
.L1974:
	ldr	ip, [r6, #160]
	add	r1, r4, #174
	mov	r3, #0
.L1979:
	ldrsh	r2, [r1, #2]!
	add	r3, r3, #1
	mul	r2, ip, r2
	cmp	r2, #64
	bhi	.L1978
	ldr	lr, [r6, #72]
	cmp	lr, #64
	bhi	.L2042
.L1978:
	cmp	r3, r0
	blt	.L1979
.L1980:
	ldr	r1, [r4, #72]
	cmp	r1, #0
	ble	.L1977
	ldr	r0, [r6, #160]
	ldrsh	r2, [r4, #216]
	mul	r2, r0, r2
	cmp	r2, #63
	addhi	r1, r1, #107
	addhi	r3, r4, #216
	addhi	r1, r4, r1, lsl #1
	bhi	.L1983
	b	.L1981
.L1984:
	ldrsh	r2, [r3, #2]!
	mul	r2, r0, r2
	cmp	r2, #63
	bls	.L1981
.L1983:
	cmp	r3, r1
	bne	.L1984
.L1977:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #0
	bne	.L2043
.L1986:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #21]
	cmp	r0, #0
	beq	.L1989
	add	r1, r4, #260
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	bne	.L2044
.L1989:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #22]
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r2, r0, #2
	str	r2, [r4, #84]
	cmp	r2, #1
	ble	.L1990
	ldr	r3, [r6, #148]
	cmp	r2, r3
	bhi	.L1990
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #24]
	cmp	r0, #0
	bne	.L2021
	b	.L1994
.L1993:
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #25]
.L2021:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L1993
.L1994:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2038:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #3
	str	r0, [r4, #52]
	bls	.L1936
	ldr	r3, .L2055
	mov	r0, r7
	ldr	r1, .L2055+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2041:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #19
	add	r2, r0, #1
	str	r2, [r4, #68]
	bhi	.L2045
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #21
	add	r3, r0, #1
	str	r3, [r4, #72]
	bhi	.L2046
	ldr	r2, [r4, #68]
	cmp	r2, #10
	bgt	.L2047
	cmp	r3, #11
	ble	.L1944
	ldr	ip, .L2055
	mov	r2, #11
	ldr	r1, .L2055+8
.L2031:
	ldr	r4, [ip, #68]
	mov	r0, #1
	blx	r4
	ldr	r3, .L2055+12
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2026
.L2028:
	mov	r3, #0
	ldr	r0, [r5, #244]
	mov	r2, r3
	mov	r1, #102
	blx	r4
	mvn	r0, #0
.L2022:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1981:
	ldr	r3, .L2055
	ldr	r1, .L2055+16
.L2030:
	ldr	r3, [r3, #68]
	mov	r0, #1
	blx	r3
	ldr	r3, .L2055+12
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L2028
.L2026:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2042:
	ldr	r3, .L2055
	ldr	r1, .L2055+20
	b	.L2030
.L2037:
	ldr	ip, .L2055
	mov	r2, r0
	add	r3, r3, #26
	mov	r0, r7
	ldr	r1, .L2055+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L1944:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	ldr	r7, [r4, #68]
	uxtb	r0, r0
	strb	r0, [r4, #15]
	cmp	r0, #0
	bne	.L1958
	cmp	r7, #1
	addgt	r9, r4, #90
	movgt	r8, r0
	bgt	.L1956
	b	.L2048
.L2050:
	cmp	r3, r2
	bhi	.L1954
	ldr	r7, [r4, #68]
	add	r8, r8, #1
	sub	r3, r7, #1
	cmp	r3, r8
	ble	.L2049
.L1956:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r0, r0, #1
	uxth	r3, r0
	strh	r3, [r9, #2]!	@ movhi
	ldr	r2, [r6, #240]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L2050
.L1954:
	ldr	ip, .L2055
	mov	r0, #1
	str	r2, [sp]
	mov	r2, r8
	ldr	r1, .L2055+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L2047:
	mov	r3, r2
	ldr	ip, .L2055
	mov	r2, #10
	ldr	r1, .L2055+32
	b	.L2031
.L2043:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	ldr	r0, [r5, #2292]
	bl	BsGet
	uxtb	r7, r0
	strb	r7, [r4, #20]
	cmp	r7, #0
	bne	.L1986
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #76]
	bhi	.L2051
.L1988:
	ldr	r0, [r5, #2292]
	bl	HEVC_se_v.isra.21
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #80]
	bls	.L1986
	ldr	r3, .L2055
	mov	r0, #1
	ldr	r1, .L2055+36
	ldr	r3, [r3, #68]
	blx	r3
	mov	r3, #0
	str	r3, [r4, #80]
	b	.L1986
.L1958:
	cmp	r7, #0
	addgt	r3, r4, #174
	movgt	r8, #0
	ble	.L1948
.L1966:
	ldr	r10, [r6, #240]
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
	bne	.L1966
.L1948:
	ldr	r10, [r4, #72]
	cmp	r10, #0
	addgt	r3, r4, #214
	movgt	r8, #0
	ble	.L1965
.L1967:
	ldr	r2, [r6, #244]
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
	bne	.L1967
.L1965:
	cmp	r7, #1
	bne	.L1973
	ldr	r0, [r4, #72]
	cmp	r0, #1
	beq	.L1974
.L1973:
	mov	r1, #1
	ldr	r0, [r5, #2292]
	bl	BsGet
	strb	r0, [r4, #16]
	b	.L1975
.L1927:
	ldr	r3, .L2055
	mov	r2, r0
	ldr	r1, .L2055+40
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2034:
	ldr	r3, .L2055
	mov	r2, r0
	ldr	r1, .L2055+44
	mov	r0, r7
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2035:
	ldr	r3, .L2055
	mov	r0, r7
	ldr	r1, .L2055+48
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2036:
	ldr	r3, .L2055
	mov	r0, r7
	ldr	r1, .L2055+52
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2039:
	ldr	r3, .L2055
	mov	r0, #1
	ldr	r1, .L2055+56
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2040:
	ldr	r3, .L2055
	mov	r0, #1
	ldr	r1, .L2055+60
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L1990:
	ldr	r3, .L2055
	mov	r0, #1
	ldr	r1, .L2055+64
	ldr	r3, [r3, #68]
	blx	r3
	b	.L2026
.L2049:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	ble	.L1952
.L1951:
	add	r8, r4, #130
	mov	r7, #0
	b	.L1963
.L2053:
	cmp	r3, r2
	bhi	.L1961
	ldr	r3, [r4, #72]
	add	r7, r7, #1
	sub	r3, r3, #1
	cmp	r3, r7
	ble	.L2052
.L1963:
	ldr	r0, [r5, #2292]
	bl	HEVC_ue_v.isra.18
	add	r0, r0, #1
	uxth	r3, r0
	strh	r3, [r8, #2]!	@ movhi
	ldr	r2, [r6, #244]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L2053
.L1961:
	ldr	ip, .L2055
	mov	r0, #1
	str	r2, [sp]
	mov	r2, r7
	ldr	r1, .L2055+68
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L2045:
	ldr	ip, .L2055
	mov	r3, #20
	ldr	r1, .L2055+72
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L2051:
	ldr	r3, .L2055
	mov	r0, #1
	ldr	r1, .L2055+76
	ldr	r3, [r3, #68]
	blx	r3
	str	r7, [r4, #76]
	b	.L1988
.L2052:
	ldr	r7, [r4, #68]
.L1952:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1958
.L1959:
	sub	r2, r7, #1
	ldrh	r3, [r6, #240]
	add	ip, r4, r7, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #174]	@ movhi
	ble	.L1968
	add	r8, r7, #44
	add	r1, r4, #90
	add	lr, r4, #174
	add	r8, r4, r8, lsl #1
.L1969:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #174]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #174]	@ movhi
	bne	.L1969
.L1968:
	sxth	r3, r3
	cmp	r3, #0
	ble	.L2054
	ldr	r1, [r4, #72]
	ldrh	r3, [r6, #244]
	sub	r2, r1, #1
	add	ip, r4, r1, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #214]	@ movhi
	ble	.L1971
	add	r8, r1, #64
	add	lr, r4, #214
	add	r1, r4, #130
	add	r8, r4, r8, lsl #1
.L1972:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #214]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #214]	@ movhi
	bne	.L1972
.L1971:
	sxth	r3, r3
	cmp	r3, #0
	bgt	.L1965
	ldr	ip, .L2055
	mov	r0, #1
	ldr	r1, .L2055+80
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L2046:
	ldr	ip, .L2055
	mov	r2, r3
	ldr	r1, .L2055+84
	mov	r3, #22
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L2044:
	ldr	r3, .L2055
	mov	r0, #1
	ldr	r1, .L2055+88
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2022
.L2048:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	bgt	.L1951
	b	.L1959
.L2054:
	ldr	ip, .L2055
	mov	r0, #1
	ldr	r1, .L2055+92
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2022
.L2056:
	.align	2
.L2055:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC185
	.word	.LC191
	.word	g_event_report
	.word	.LC197
	.word	.LC196
	.word	.LC184
	.word	.LC192
	.word	.LC190
	.word	.LC199
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC186
	.word	.LC187
	.word	.LC201
	.word	.LC193
	.word	.LC188
	.word	.LC198
	.word	.LC195
	.word	.LC189
	.word	.LC200
	.word	.LC194
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L2064
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	ldr	r3, [r4, #156]
	cmp	r0, r3
	mov	r6, r0
	bcs	.L2065
	movw	r7, #2024
	ldr	r3, [r4, #2304]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r9, [r3, r5]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L2066
	str	r0, [r2, #28]
	mov	r0, r4
	ldr	r1, [r4, #2304]
	add	r1, r1, r5
	bl	HEVC_ProcessPPS
	subs	r8, r0, #0
	bne	.L2067
	ldr	r3, [r4, #2304]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2304]
	strb	r2, [r3, r5]
.L2059:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2066:
	ldr	r9, .L2069
	mov	r0, r4
	ldr	r1, .L2069+4
	str	r6, [r9, #-1244]
	bl	HEVC_ProcessPPS
	subs	r8, r0, #0
	bne	.L2068
	ldr	r1, .L2069+8
	mov	r3, #1
	ldr	r0, [r4, #2304]
	mov	r2, r7
	strb	r3, [r9, #-1271]
	ldr	r4, [r1, #56]
	add	r0, r0, r5
	strb	r3, [r9, #-1272]
	ldr	r1, .L2069+4
	blx	r4
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2068:
	ldr	r3, .L2069+8
	mov	r2, r6
	ldr	r1, .L2069+12
	mov	r0, #1
	mvn	r8, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L2059
.L2065:
	ldr	ip, .L2069+8
	mov	r2, r0
	ldr	r1, .L2069+16
	mov	r0, #1
	mvn	r8, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L2059
.L2067:
	ldr	r3, .L2069+8
	mov	r2, r6
	ldr	r1, .L2069+12
	mov	r0, #1
	mvn	r8, #0
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r4, #2304]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2304]
	strb	r9, [r3, r5]
	b	.L2059
.L2064:
	ldr	ip, .L2069+8
	movw	r3, #2712
	ldr	r2, .L2069+20
	mov	r0, #1
	ldr	r1, .L2069+24
	mvn	r8, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L2059
.L2070:
	.align	2
.L2069:
	.word	.LANCHOR6
	.word	.LANCHOR6-1272
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC203
	.word	.LC202
	.word	.LANCHOR0+1040
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecPPS, .-HEVC_DecPPS
	.align	2
	.global	HEVC_SeiMessage
	.type	HEVC_SeiMessage, %function
HEVC_SeiMessage:
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
	clz	r7, r0
	cmp	r2, #0
	cmpne	r1, #0
	mov	r4, r0
	mov	r7, r7, lsr #5
	mov	r6, r1
	moveq	r5, #1
	movne	r5, #0
	orrs	r5, r7, r5
	mov	r8, r2
	beq	.L2073
	b	.L2260
.L2075:
	add	r5, r5, #255
	bl	BsSkip
.L2073:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2292]
	beq	.L2075
	bl	BsGet
	mov	r9, #0
	str	r0, [r6]
	add	r5, r0, r5
	b	.L2076
.L2077:
	add	r9, r9, #255
	bl	BsSkip
.L2076:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2292]
	beq	.L2077
	bl	BsGet
	str	r0, [r6, #4]
	add	r9, r0, r9
	ldr	r3, [r4, #2316]
	ldr	r3, [r3, #16]
	cmp	r3, #39
	beq	.L2261
	cmp	r5, #5
	beq	.L2167
	cmp	r5, #132
	beq	.L2168
	cmp	r9, #0
	movne	r5, #0
	beq	.L2097
.L2176:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r5, r9
	bne	.L2176
	b	.L2097
.L2167:
	add	r1, r6, #3136
	add	r0, r4, #2288
	add	r1, r1, #12
	add	r0, r0, #4
	mov	r2, r9
	bl	HEVC_Sei_User_Data_Unregistered.isra.14
	cmp	r0, #0
	bne	.L2257
.L2097:
	ldr	r2, [r4, #2292]
	mov	r9, r9, asl #3
	ldr	r3, [r2, #24]
	mov	r0, r2
	ldr	r5, [r2, #28]
	rsb	r5, r5, r3
	bl	BsIsByteAligned
	cmp	r0, #0
	cmpne	r5, r9
	beq	.L2262
.L2177:
	mov	r0, #0
.L2248:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2262:
	ldr	r3, .L2284
	mov	r2, #32
	ldr	r1, [r4, #2292]
	sub	r0, fp, #76
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	rsb	r3, r2, r3
	cmp	r9, r3
	bhi	.L2263
.L2182:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #12]
	b	.L2183
.L2184:
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #16]
.L2183:
	ldr	r0, [r4, #2292]
	bl	BsIsByteAligned
	mov	r1, #1
	cmp	r0, #0
	beq	.L2184
	b	.L2177
.L2261:
	cmp	r5, #47
	beq	.L2080
	bls	.L2264
	cmp	r5, #130
	beq	.L2089
	bls	.L2265
	cmp	r5, #133
	beq	.L2093
	cmp	r5, #134
	beq	.L2094
	cmp	r5, #131
	beq	.L2095
.L2079:
	cmp	r9, #0
	movne	r5, #0
	beq	.L2097
.L2165:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r5, r9
	bne	.L2165
	b	.L2097
.L2168:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r5, r6, #23552
	add	r10, r6, #20480
	mov	r8, r5
	add	r5, r5, #123
	add	r8, r8, #171
	mov	r3, r0
	cmp	r3, #0
	str	r0, [r10, #3244]
	str	r0, [r10, #3248]
	bne	.L2170
.L2266:
	add	r7, r5, #16
.L2171:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r5, #1]!
	cmp	r7, r5
	bne	.L2171
.L2172:
	cmp	r7, r8
	mov	r5, r7
	beq	.L2097
	ldr	r3, [r10, #3248]
	cmp	r3, #0
	beq	.L2266
.L2170:
	cmp	r3, #1
	beq	.L2267
	cmp	r3, #2
	addne	r7, r5, #16
	bne	.L2172
	mov	r1, #32
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r7, r5, #16
	mov	r3, r0, lsr #24
	strb	r0, [r5, #4]
	strb	r3, [r5, #1]
	mov	r3, r0, lsr #16
	mov	r0, r0, lsr #8
	strb	r3, [r5, #2]
	strb	r0, [r5, #3]
	b	.L2172
.L2264:
	cmp	r5, #5
	beq	.L2167
	bls	.L2268
	cmp	r5, #23
	beq	.L2086
	cmp	r5, #45
	beq	.L2087
	cmp	r5, #6
	bne	.L2079
	cmn	r6, #3264
	movne	r3, #0
	moveq	r3, #1
	orrs	r3, r7, r3
	bne	.L2257
	ldr	r0, [r4, #2292]
	bl	HEVC_se_v.isra.21
	mov	r1, #1
	str	r0, [r6, #3268]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3264]
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #3265]
	ldr	r0, [r4, #2292]
	bl	BsToNextByte
	b	.L2097
.L2263:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsShow
	cmp	r0, #0
	bne	.L2269
.L2188:
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r6, #8]
	b	.L2182
.L2269:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsSkip
	ldr	r3, [fp, #-52]
	ldr	r5, [fp, #-48]
	rsb	r5, r5, r3
	b	.L2180
.L2181:
	bl	BsSkip
	ldr	r3, [fp, #-52]
	ldr	r5, [fp, #-48]
	rsb	r5, r5, r3
.L2180:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsShow
	cmp	r9, r5
	mov	r1, #1
	movls	r3, #0
	movhi	r3, #1
	cmp	r0, #0
	movne	r2, #0
	andeq	r2, r3, #1
	sub	r0, fp, #76
	cmp	r2, #0
	bne	.L2181
	cmp	r3, #0
	beq	.L2182
	b	.L2188
.L2093:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r10, r6, #20480
	mov	r1, #1
	strb	r0, [r10, #2408]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	uxtb	r0, r0
	strb	r0, [r10, #2409]
	cmp	r0, #0
	ldr	r0, [r4, #2292]
	beq	.L2156
	bl	BsGet
	strb	r0, [r10, #2410]
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #63
	str	r0, [r10, #2416]
	bhi	.L2270
	ldrb	r7, [r10, #2410]	@ zero_extendqisi2
	cmp	r0, r7
	addcs	r5, r7, #5696
	addcs	r5, r5, #28
	addcs	r5, r6, r5, lsl #2
	bcc	.L2161
.L2160:
	mov	r1, #3
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r7, r7, #1
	str	r0, [r5, #4]!
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r5, #256]
	ldr	r3, [r10, #2416]
	cmp	r7, r3
	bls	.L2160
.L2161:
	ldr	r0, [r4, #2292]
	bl	BsToNextByte
	mov	r3, #0
	strb	r3, [r10, #2412]
	b	.L2159
.L2164:
	bl	HEVC_MoreRbspData
	cmp	r0, #0
	beq	.L2097
.L2159:
	mov	r2, r8
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	mov	r0, r4
	beq	.L2164
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+4
	ldr	r3, [r4, #68]
	blx	r3
.L2099:
	ldr	r3, [r4, #68]
	mov	r0, #1
	ldr	r1, .L2284+8
	blx	r3
	mvn	r0, #0
	b	.L2248
.L2086:
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	mov	r1, #1
	str	r0, [r6, #3340]
	ldr	r0, [r4, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #3336]
	cmp	r0, #0
	ldrne	r3, [r6, #3352]
	beq	.L2271
.L2124:
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L2097
.L2187:
	.word	.L2125
	.word	.L2127
	.word	.L2128
	.word	.L2132
	.word	.L2137
.L2137:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r6, #3372]
	beq	.L2272
.L2138:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #3338]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #3388]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #3392]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #3396]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #3400]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #3404]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #3408]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #3388]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #3412]
	b	.L2097
.L2132:
	mov	r1, #16
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r0, #256
	str	r0, [r6, #3416]
	bhi	.L2133
	cmp	r0, #0
	addne	r5, r6, #3408
	movne	r7, #0
	addne	r5, r5, #8
	beq	.L2097
.L2136:
	ldr	r1, [r6, #3344]
	add	r7, r7, #1
	ldr	r0, [r4, #2292]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	str	r0, [r5, #4]!
	ldr	r1, [r6, #3348]
	ldr	r0, [r4, #2292]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	str	r0, [r5, #1024]
	ldr	r3, [r6, #3416]
	cmp	r7, r3
	bcc	.L2136
	b	.L2097
.L2128:
	ldr	r3, [r6, #3348]
	mov	r5, #1
	movs	r5, r5, asl r3
	addne	r8, r6, #5440
	movne	r7, #0
	addne	r8, r8, #24
	beq	.L2131
.L2130:
	ldr	r1, [r6, #3344]
	add	r7, r7, #1
	ldr	r0, [r4, #2292]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	cmp	r5, r7
	str	r0, [r8, #4]!
	bne	.L2130
.L2131:
	add	r3, r5, #532
	ldr	r1, [r6, #3344]
	mov	r2, #1
	add	r3, r6, r3, lsl #2
	mov	r2, r2, asl r1
	str	r2, [r3, #3340]
	b	.L2097
.L2125:
	mov	r1, #32
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #3356]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #3360]
	b	.L2097
.L2127:
	mov	r1, #32
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #3364]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #3368]
	b	.L2097
.L2267:
	mov	r1, #16
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r7, r5, #16
	mov	r3, r0, lsr #8
	strb	r0, [r5, #2]
	strb	r3, [r5, #1]
	b	.L2172
.L2265:
	cmp	r5, #128
	beq	.L2091
	cmp	r5, #129
	bne	.L2079
	mov	r1, #4
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #3176]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3172]
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #3173]
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #15
	str	r0, [r6, #3180]
	bgt	.L2149
	cmp	r0, #0
	addge	r7, r6, #3168
	movge	r5, #0
	addge	r7, r7, #12
	blt	.L2255
.L2151:
	ldr	r0, [r4, #2292]
	add	r5, r5, #1
	bl	HEVC_ue_v.isra.18
	str	r0, [r7, #4]!
	ldr	r3, [r6, #3180]
	cmp	r5, r3
	ble	.L2151
.L2255:
	ldr	r0, [r4, #2292]
	bl	BsToNextByte
	b	.L2097
.L2268:
	cmp	r5, #0
	beq	.L2084
	cmp	r5, #1
	bne	.L2079
	ldrb	r3, [r8, #2633]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2273
.L2113:
	ldr	r5, .L2284+12
	sub	r3, r5, #3456
	ldrh	r3, [r3, #-8]
	cmp	r3, #0
	beq	.L2255
	ldr	r1, [r5, #-3432]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	ldr	r1, [r5, #-3428]
	add	r1, r1, #1
	add	r0, r0, #1
	str	r0, [r6, #1080]
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldrb	r3, [r5, #-3462]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r6, #1084]
	beq	.L2255
	ldr	r1, [r5, #-3452]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	ldrb	r3, [r5, #-3462]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r6, #1088]
	beq	.L2255
	ldrb	r3, [r5, #-3461]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2255
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	mov	r1, #1
	str	r0, [r6, #1092]
	ldr	r0, [r4, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #1069]
	cmp	r0, #0
	bne	.L2274
.L2116:
	ldr	r3, [r6, #1092]
	cmp	r3, #255
	bhi	.L2186
	add	r7, r6, #1088
	mov	r8, #0
	add	r7, r7, #8
	b	.L2118
.L2117:
	ldr	r3, [r6, #1092]
	cmp	r8, r3
	bhi	.L2255
.L2118:
	ldr	r0, [r4, #2292]
	add	r8, r8, #1
	bl	HEVC_ue_v.isra.18
	str	r0, [r7, #4]!
	ldrb	r3, [r6, #1069]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2117
	ldr	r1, [r5, #-3456]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r7, #1024]
	b	.L2117
.L2260:
	ldr	ip, .L2284
	mov	r3, #3584
	ldr	r2, .L2284+16
	mov	r0, #1
	ldr	r1, .L2284+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2248
.L2080:
	add	r3, r6, #3312
	add	r3, r3, #4
	cmp	r3, #0
	movne	r3, r7
	orreq	r3, r7, #1
	cmp	r3, #0
	bne	.L2257
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #3318]
	cmp	r0, #0
	bne	.L2255
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3316]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #3317]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #3320]
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #3319]
	b	.L2255
.L2087:
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	mov	r1, #1
	str	r0, [r6, #3284]
	ldr	r0, [r4, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #3272]
	cmp	r0, #0
	bne	.L2139
	mov	r1, #7
	ldr	r0, [r4, #2292]
	bl	BsGet
	sub	r3, r0, #3
	mov	r2, r0
	cmp	r3, #2
	str	r0, [r6, #3288]
	bhi	.L2275
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #6
	strb	r0, [r6, #3273]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #3292]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3274]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3275]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3276]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3277]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #3278]
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldrb	r3, [r6, #3273]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r6, #3279]
	bne	.L2141
	ldr	r3, [r6, #3288]
	cmp	r3, #5
	beq	.L2141
	mov	r1, #4
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #4
	str	r0, [r6, #3296]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #4
	str	r0, [r6, #3300]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #4
	str	r0, [r6, #3304]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #3308]
.L2141:
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #3312]
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #3280]
.L2139:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #3281]
	b	.L2255
.L2257:
	ldr	r4, .L2284
	b	.L2099
.L2095:
	add	r3, r6, #3312
	add	r3, r3, #12
	cmp	r3, #0
	movne	r3, r7
	orreq	r3, r7, #1
	cmp	r3, #0
	bne	.L2257
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #3324]
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #3328]
	ldr	r0, [r4, #2292]
	bl	BsToNextByte
	b	.L2097
.L2094:
	add	r3, r6, #3328
	add	r3, r3, #4
	cmp	r3, #0
	orreq	r7, r7, #1
	cmp	r7, #0
	bne	.L2257
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #3332]
	b	.L2097
.L2084:
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #15
	mov	r2, r0
	str	r0, [r6, #28]
	bhi	.L2276
	ldr	r5, .L2284+12
	ldrb	r3, [r5, #-3462]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2100
	ldrb	r0, [r6, #24]	@ zero_extendqisi2
.L2101:
	cmp	r0, #0
	bne	.L2277
.L2102:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	ldr	r7, .L2284+12
	strb	r0, [r6, #25]
	ldr	r1, [r5, #-3432]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r6, #40]
	ldr	r2, [r5, #-3416]
	cmp	r2, #31
	bhi	.L2278
.L2103:
	mov	r7, #1
	subs	r3, r7, #1
	mov	r10, r6
	ldr	r2, .L2284+12
	beq	.L2279
.L2104:
	cmp	r3, #1
	beq	.L2280
.L2108:
	cmp	r7, #1
	bhi	.L2255
.L2106:
	add	r7, r7, #1
	add	r10, r10, #16
	subs	r3, r7, #1
	bne	.L2104
.L2279:
	ldrb	r1, [r5, #-3464]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L2108
	ldr	r1, [r2, #-3416]
	cmn	r1, #1
	movne	r8, r10
	bne	.L2223
	b	.L2106
.L2091:
	add	r3, r6, #4096
	ldr	r0, [r4, #2292]
	str	r3, [fp, #-80]
	mov	r5, r3
	bl	HEVC_ue_v.isra.18
	str	r0, [r5, #2400]
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #1024
	str	r0, [r5, #2404]
	bhi	.L2143
	cmp	r0, #0
	beq	.L2255
	add	r5, r6, #6464
	add	r7, r6, #10560
	add	r8, r6, #18688
	add	r5, r5, #36
	add	r7, r7, #40
	add	r8, r8, #104
	mov	r10, #0
	b	.L2147
.L2146:
	ldr	r3, [fp, #-80]
	add	r8, r8, #4
	ldr	r2, [r3, #2404]
	cmp	r10, r2
	bcs	.L2255
.L2147:
	mov	r1, #6
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #4]!
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r7], #4
	ldr	r2, [r5]
	sub	r2, r2, #19
	cmp	r2, #1
	bls	.L2145
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	str	r0, [r7, #4092]
.L2145:
	cmp	r10, #0
	add	r10, r10, #1
	beq	.L2146
	ldr	r0, [r4, #2292]
	bl	HEVC_se_v.isra.21
	str	r0, [r8]
	b	.L2146
.L2089:
	ldr	r3, .L2284+24
	ldr	r5, .L2284+12
	cmn	r6, #3248
	cmpne	r3, #0
	moveq	r3, #1
	movne	r3, #0
	orrs	r3, r7, r3
	bne	.L2257
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	ldrb	r3, [r5, #-3461]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r6, #3256]
	str	r0, [r6, #3252]
	bne	.L2281
.L2154:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #3248]
	cmp	r0, #0
	beq	.L2255
	ldr	r1, [r5, #-3452]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #3260]
	b	.L2255
.L2156:
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #2411]
	cmp	r0, #0
	bne	.L2161
	mov	r1, #3
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r10, #2932]
	ldr	r0, [r4, #2292]
	bl	HEVC_ue_v.isra.18
	cmp	r0, #63
	str	r0, [r10, #2936]
	addls	r5, r6, #23296
	movls	r7, #0
	addls	r5, r5, #120
	bhi	.L2282
.L2163:
	mov	r1, #6
	ldr	r0, [r4, #2292]
	bl	BsGet
	add	r7, r7, #1
	str	r0, [r5, #4]!
	ldr	r3, [r10, #2936]
	cmp	r7, r3
	bls	.L2163
	b	.L2161
.L2273:
	mov	r1, #4
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #2
	str	r0, [r6, #1072]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, r5
	str	r0, [r6, #1076]
	ldr	r0, [r4, #2292]
	bl	BsGet
	strb	r0, [r6, #1068]
	b	.L2113
.L2271:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r6, #3337]
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r1, #8
	str	r0, [r6, #3344]
	ldr	r0, [r4, #2292]
	bl	BsGet
	cmp	r0, #8
	mov	r2, r0
	str	r0, [r6, #3348]
	bhi	.L2283
	mov	r1, #8
	ldr	r0, [r4, #2292]
	bl	BsGet
	mov	r3, r0
	str	r0, [r6, #3352]
	b	.L2124
.L2281:
	ldr	r1, [r5, #-3456]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #3256]
	b	.L2154
.L2278:
	ldr	r3, .L2284
	mov	r0, #1
	ldr	r1, .L2284+28
	ldr	r3, [r3, #68]
	blx	r3
	mov	r3, #0
	str	r3, [r7, #-3416]
	b	.L2103
.L2277:
	ldr	r1, [r5, #-3432]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #32]
	ldr	r1, [r5, #-3428]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #36]
	b	.L2102
.L2100:
	mov	r1, #1
	ldr	r0, [r4, #2292]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #24]
	b	.L2101
.L2276:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+32
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2280:
	ldrb	r3, [r5, #-3463]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2255
	ldr	r3, [r2, #-3416]
	cmn	r3, #1
	beq	.L2255
	mov	r8, r10
	mov	r3, #0
.L2223:
	ldr	r1, [r5, #-3436]
	add	r3, r3, #1
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	str	r3, [fp, #-88]
	bl	BsGet
	str	r0, [r8, #44]
	ldr	r1, [r5, #-3436]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-84]
	str	r0, [r8, #48]
	ldrb	r1, [r5, #-3462]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2110
	ldrb	r1, [r6, #24]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L2111
.L2110:
	ldr	r1, [r5, #-3436]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	bl	BsGet
	str	r0, [r8, #52]
	ldr	r1, [r5, #-3436]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-80]
	str	r0, [r8, #56]
.L2111:
	ldr	r1, [r5, #-3416]
	add	r8, r8, #32
	add	r1, r1, #1
	cmp	r3, r1
	bcc	.L2223
	b	.L2108
.L2149:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+36
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2282:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+40
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2143:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+44
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2275:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+48
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2186:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+52
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2274:
	ldr	r1, [r5, #-3456]
	ldr	r0, [r4, #2292]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #1096]
	b	.L2116
.L2272:
	mov	r1, #32
	ldr	r0, [r4, #2292]
	bl	BsGet
	str	r0, [r6, #3376]
	b	.L2138
.L2133:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+56
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2270:
	ldr	r4, .L2284
	mov	r2, #64
	ldr	r1, .L2284+60
	mov	r0, #1
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2283:
	ldr	r4, .L2284
	mov	r0, #1
	ldr	r1, .L2284+64
	ldr	r3, [r4, #68]
	blx	r3
	b	.L2099
.L2285:
	.align	2
.L2284:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC214
	.word	.LC215
	.word	.LANCHOR5
	.word	.LANCHOR0+1052
	.word	.LC36
	.word	.LANCHOR5-3464
	.word	.LC205
	.word	.LC204
	.word	.LC211
	.word	.LC213
	.word	.LC210
	.word	.LC209
	.word	.LC206
	.word	.LC208
	.word	.LC212
	.word	.LC207
	UNWIND(.fnend)
	.size	HEVC_SeiMessage, .-HEVC_SeiMessage
	.align	2
	.global	HEVC_More_Rbsp_Data
	.type	HEVC_More_Rbsp_Data, %function
HEVC_More_Rbsp_Data:
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
	beq	.L2290
	ldr	r0, [r4, #2292]
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #24]
	mov	r2, r2, asl #3
	cmp	r2, r3
	ble	.L2291
	mov	r1, #8
	bl	BsShow
	subs	r0, r0, #128
	movne	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2291:
	ldr	ip, .L2292
	mov	r0, #1
	ldr	r1, .L2292+4
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2290:
	ldr	ip, .L2292
	movw	r3, #10701
	ldr	r2, .L2292+8
	mov	r0, #1
	ldr	r1, .L2292+12
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2293:
	.align	2
.L2292:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC216
	.word	.LANCHOR0+1068
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
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
	subs	r4, r0, #0
	addne	r6, r4, #3424
	addne	r5, r4, #27136
	addne	r6, r6, #4
	addne	r5, r5, #52
	bne	.L2299
	b	.L2304
.L2297:
	ldr	r0, [r4, #2292]
	bl	BsIsByteAligned
	cmp	r0, #0
	mov	r0, r4
	beq	.L2305
	bl	HEVC_More_Rbsp_Data
	subs	r7, r0, #0
	beq	.L2306
.L2299:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	beq	.L2297
	ldr	r3, .L2307
	mov	r0, #1
	ldr	r1, .L2307+4
	mvn	r7, #0
	ldr	r3, [r3, #68]
	blx	r3
.L2296:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2305:
	ldr	r3, .L2307
	mvn	r7, #0
	ldr	r1, .L2307+8
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2306:
	ldr	r0, [r4, #2292]
	mov	r1, #8
	bl	BsGet
	cmp	r0, #128
	beq	.L2296
	ldr	r3, .L2307
	mov	r2, r0
	ldr	r1, .L2307+12
	mov	r0, #1
	mvn	r7, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L2296
.L2304:
	ldr	ip, .L2307
	movw	r3, #3627
	ldr	r2, .L2307+16
	mov	r0, #1
	ldr	r1, .L2307+20
	mvn	r7, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L2296
.L2308:
	.align	2
.L2307:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC214
	.word	.LC217
	.word	.LC218
	.word	.LANCHOR0+1088
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecSEI, .-HEVC_DecSEI
	.align	2
	.global	HEVC_ReleaseNAL
	.type	HEVC_ReleaseNAL, %function
HEVC_ReleaseNAL:
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
	cmp	r0, #15
	mov	r6, r0
	mov	r5, r1
	bhi	.L2319
	cmp	r1, #0
	beq	.L2320
	ldr	r7, .L2321
	add	r8, r1, #56
	mov	r4, r1
	mov	r3, #0
	str	r3, [r1, #36]
	str	r3, [r1, #40]
.L2313:
	ldr	r3, [r4, #44]
	mov	r0, r6
	cmp	r3, #0
	beq	.L2312
	ldr	r1, [r4, #68]
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r4, #48]
	ldr	r3, [r4, #44]
	mov	r0, #7
	ldr	r9, [r7, #68]
	str	r1, [sp]
	ldr	r2, .L2321+4
	ldr	r1, .L2321+8
	blx	r9
	mov	r3, #0
	str	r3, [r4, #44]
	str	r3, [r4, #60]
	str	r3, [r4, #48]
.L2312:
	add	r4, r4, #28
	cmp	r4, r8
	bne	.L2313
	ldr	r3, [r7, #48]
	mov	r0, r5
	mov	r2, #100
	mov	r1, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L2319:
	ldr	ip, .L2321
	movw	r3, #10856
	ldr	r2, .L2321+4
	mov	r0, #1
	ldr	r1, .L2321+12
.L2318:
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L2320:
	mov	r0, r1
	ldr	ip, .L2321
	movw	r3, #10857
	ldr	r2, .L2321+16
	ldr	r1, .L2321+20
	b	.L2318
.L2322:
	.align	2
.L2321:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1100
	.word	.LC221
	.word	.LC36
	.word	.LC219
	.word	.LC220
	UNWIND(.fnend)
	.size	HEVC_ReleaseNAL, .-HEVC_ReleaseNAL
	.align	2
	.type	Hevc_InitDecBuffers, %function
Hevc_InitDecBuffers:
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
	add	r3, r0, #24576
	mov	r8, r0
	add	r0, r0, #2704
	add	r1, r8, #2640
	ldr	r3, [r3, #2604]
	add	r2, r8, #2496
	mov	lr, #0
	add	r1, r1, #4
	add	r2, r2, #12
	add	ip, r8, #2576
	ldr	r3, [r3, #236]
	mov	r6, #17
	add	r3, r3, #1
	cmp	r3, #17
	movhi	r3, #17
	str	r3, [r0, #-216]
	add	r0, r0, #8
	mov	r3, lr
	str	lr, [r8, #2492]
	str	lr, [r8, #2504]
	str	lr, [r8, #2508]
	str	lr, [r8, #2500]
	str	lr, [r8, #2496]
.L2326:
	subs	r6, r6, #1
	str	r3, [r0, #4]!
	str	r3, [ip, #4]!
	str	r3, [r1, #4]!
	str	r3, [r2, #4]!
	bne	.L2326
	add	r4, r8, #57344
	ldr	r10, .L2349
	add	r4, r4, #40
	mov	r7, r6
.L2327:
	ldr	r3, [r10, #48]
	mov	r2, #504
	mov	r0, r4
	mov	r1, #0
	blx	r3
	str	r7, [r4, #196]
	add	r7, r7, #1
	mov	r5, #0
	cmp	r7, #20
	sub	r3, r4, #72
	strb	r5, [r4, #-72]
	mov	r2, #20
	str	r3, [r4, #-4]
	mov	r9, #16
	str	r5, [r4, #-68]
	add	r4, r4, #584
	strb	r5, [r4, #-655]
	str	r5, [r4, #-644]
	strb	r5, [r4, #-654]
	str	r5, [r4, #-608]
	str	r2, [r4, #-632]
	str	r9, [r4, #-628]
	ldr	r3, .L2349
	bne	.L2327
	ldr	r3, [r3, #48]
	mov	r2, #200
	mov	r1, r5
	add	r0, r8, #2784
	blx	r3
	add	r2, r8, #2304
	add	r2, r2, #12
	add	r3, r8, #2384
	mov	r1, r5
	str	r9, [r8, #2784]
	str	r5, [r8, #2788]
.L2328:
	str	r1, [r2, #4]!
	cmp	r2, r3
	mov	r0, #0
	bne	.L2328
	add	r1, r8, #2448
	add	lr, r8, #40960
	add	r1, r1, #4
	mov	ip, r0
	str	r0, [lr, #2736]
.L2329:
	str	ip, [r3, #4]!
	cmp	r3, r1
	mov	r2, #0
	bne	.L2329
	str	r2, [lr, #2740]
	ldr	r1, [r8, #180]
	cmp	r1, r2
	movne	r3, r2
	addne	r2, r8, #2096
	movne	r0, r3
	beq	.L2334
.L2333:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2333
.L2334:
	ldr	r2, [r8, #160]
	cmp	r2, #0
	beq	.L2348
	mov	r4, #0
	add	r7, r8, #53248
	mov	r5, r4
.L2336:
	ldr	r3, [r7, #4056]
	add	r4, r4, #1
	add	r3, r3, r6
	ldr	r3, [r3, #24]
	cmp	r3, #0
	mov	r1, r3
	beq	.L2335
	ldr	r0, [r8, #2316]
	cmp	r3, r0
	beq	.L2335
	ldr	r0, [r8, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r7, #4056]
	add	r3, r3, r6
	str	r5, [r3, #24]
	ldr	r2, [r8, #160]
.L2335:
	cmp	r2, r4
	add	r6, r6, #28
	bhi	.L2336
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2348:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2350:
	.align	2
.L2349:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Hevc_InitDecBuffers, .-Hevc_InitDecBuffers
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
	beq	.L2362
	ldr	ip, [r6, #2492]
	add	r8, r6, #2496
	cmp	ip, #0
	addne	r8, r8, #12
	movne	r3, #0
	movne	lr, #1
	movne	r1, r8
	beq	.L2377
.L2356:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	streqb	lr, [r2, #2]
	ldreq	ip, [r6, #2492]
	cmp	ip, r3
	bhi	.L2356
.L2357:
	mov	r4, r6
	mov	r7, #17
	mov	r5, #0
	mov	r3, #-2147483647
	str	r3, [r6, #212]
.L2354:
	ldr	r3, [r8, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L2358
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L2358:
	ldr	r3, [r4, #2580]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2359
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L2359:
	ldr	r3, [r4, #2648]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2360
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L2360:
	ldr	r3, [r4, #2716]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2361
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L2361:
	subs	r7, r7, #1
	str	r5, [r4, #2716]
	str	r5, [r4, #2648]
	add	r4, r4, #4
	str	r5, [r4, #2576]
	str	r5, [r4, #2508]
	bne	.L2354
	mov	r0, r6
	bl	Hevc_InitDecBuffers
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2377:
	add	r8, r8, #12
	b	.L2357
.L2362:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_EmptyFrmFromDPB, .-HEVC_EmptyFrmFromDPB
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
	subs	r4, r0, #0
	beq	.L2383
	ldr	r1, [r4, #2316]
	cmp	r1, #0
	beq	.L2382
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2316]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2382:
	mov	r0, r1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2383:
	ldr	ip, .L2384
	mov	r3, #11328
	ldr	r2, .L2384+4
	mov	r0, #1
	ldr	r1, .L2384+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2385:
	.align	2
.L2384:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1116
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ClearCurrNal, .-HEVC_ClearCurrNal
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
	cmp	r0, #0
	beq	.L2389
	bl	HEVC_ClearCurrNal
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2389:
	ldr	ip, .L2390
	movw	r3, #11359
	ldr	r2, .L2390+4
	mov	r0, #1
	ldr	r1, .L2390+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2391:
	.align	2
.L2390:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1136
	.word	.LC36
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r7, r0, #0
	beq	.L2393
	ldr	r2, [r7, #160]
	cmp	r2, #0
	addne	r8, r7, #53248
	movne	r4, #0
	movne	r5, r4
	movne	r6, r4
	beq	.L2398
.L2397:
	ldr	r3, [r8, #4056]
	add	r5, r5, #1
	add	r3, r3, r4
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L2396
	ldr	r0, [r7, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #4056]
	add	r3, r3, r4
	str	r6, [r3, #24]
	ldr	r2, [r7, #160]
.L2396:
	cmp	r2, r5
	add	r4, r4, #28
	bhi	.L2397
.L2398:
	mov	r3, #0
	mov	r2, #2
	str	r3, [r7, #208]
	mov	r0, r3
	str	r3, [r7, #224]
	str	r3, [r7, #216]
	str	r2, [r7, #172]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2393:
	ldr	ip, .L2403
	movw	r3, #11369
	ldr	r2, .L2403+4
	mov	r0, #1
	ldr	r1, .L2403+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2404:
	.align	2
.L2403:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1156
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ClearAllSlice, .-HEVC_ClearAllSlice
	.align	2
	.global	HEVC_InitDPB
	.type	HEVC_InitDPB, %function
HEVC_InitDPB:
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
	subs	r5, r0, #0
	mov	r8, r1
	beq	.L2458
	bl	HEVC_ClearAllSlice
	add	r9, r5, #2496
	add	r9, r9, #12
	mov	r4, r5
	mov	r6, #17
	mov	r7, #0
.L2412:
	ldr	r3, [r9, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L2408
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2408:
	ldr	r3, [r4, #2580]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2409
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2409:
	ldr	r3, [r4, #2648]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2410
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2410:
	ldr	r3, [r4, #2716]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2411
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2411:
	subs	r6, r6, #1
	str	r7, [r4, #2716]
	str	r7, [r4, #2648]
	add	r4, r4, #4
	str	r7, [r4, #2576]
	str	r7, [r4, #2508]
	bne	.L2412
	add	r7, r5, #24576
	ldr	r4, .L2461
	mov	r9, #0
	mov	r2, #200
	ldr	r3, [r7, #2604]
	mov	r1, r9
	add	r0, r5, #2784
	ldr	r3, [r3, #236]
	str	r9, [r5, #2492]
	add	r3, r3, #1
	str	r9, [r5, #2504]
	cmp	r3, #17
	str	r9, [r5, #2508]
	str	r9, [r5, #2500]
	movhi	r3, #17
	str	r9, [r5, #2496]
	str	r3, [r5, #2488]
	ldr	r3, [r4, #48]
	blx	r3
	add	r2, r5, #2304
	add	r2, r2, #12
	add	r3, r5, #2384
	mov	r0, r9
	mov	r1, #16
	str	r9, [r5, #2788]
	str	r1, [r5, #2784]
.L2415:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L2415
	add	r2, r5, #2448
	add	ip, r5, #40960
	add	r2, r2, #4
	mov	r0, r1
	str	r1, [ip, #2736]
.L2416:
	str	r0, [r3, #4]!
	cmp	r3, r2
	mov	r1, #0
	bne	.L2416
	cmp	r8, r1
	str	r1, [ip, #2740]
	bne	.L2417
	ldr	r3, [r5, #2308]
	ldr	r3, [r3, #908]
	cmp	r3, #1
	beq	.L2417
.L2418:
	ldr	r1, [r5, #180]
	cmp	r1, #0
	addne	r2, r5, #2096
	movne	r3, #0
	movne	r0, r3
	beq	.L2428
.L2427:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2427
.L2428:
	ldr	r2, [r5, #160]
	cmp	r2, #0
	addne	r8, r5, #53248
	movne	r4, #0
	movne	r7, r4
	beq	.L2426
.L2430:
	ldr	r3, [r8, #4056]
	add	r4, r4, #1
	add	r3, r3, r6
	ldr	r3, [r3, #24]
	cmp	r3, #0
	mov	r1, r3
	beq	.L2429
	ldr	r0, [r5, #2316]
	cmp	r3, r0
	beq	.L2429
	ldr	r0, [r5, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #4056]
	add	r3, r3, r6
	str	r7, [r3, #24]
	ldr	r2, [r5, #160]
.L2429:
	cmp	r4, r2
	add	r6, r6, #28
	bcc	.L2430
.L2426:
	mov	r0, #0
.L2456:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2417:
	mov	r8, #20
	str	r8, [r5, #176]
	str	r8, [r5, #180]
	mov	r2, #32
	ldr	r3, [r7, #2604]
	sub	r0, fp, #76
	ldr	r10, [r4, #48]
	mov	r1, #0
	ldr	r7, [r3, #240]
	ldr	r9, [r3, #244]
	ldr	ip, [r3, #148]
	mov	r7, r7, asl ip
	mov	r9, r9, asl ip
	blx	r10
	ldr	r2, [r5, #2308]
	str	r9, [fp, #-48]
	mov	r3, #0
	str	r7, [fp, #-68]
	ldr	r2, [r2, #28]
	str	r9, [fp, #-64]
	cmp	r2, #24
	str	r7, [fp, #-60]
	str	r9, [fp, #-56]
	str	r7, [fp, #-52]
	strb	r3, [fp, #-76]
	strb	r3, [fp, #-75]
	beq	.L2419
	ldr	r2, [r5, #2488]
	strb	r3, [fp, #-71]
	mov	r3, #5
	strb	r3, [fp, #-70]
	strb	r2, [fp, #-72]
.L2431:
	sub	r1, fp, #76
	ldr	r0, [r5, #244]
	mov	r3, #0
	strb	r8, [fp, #-69]
	mov	r7, #1
	strb	r3, [fp, #-73]
	strb	r7, [fp, #-74]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L2420
	ldr	r1, [r5, #2308]
	sub	r3, fp, #80
	ldr	r0, [r5, #244]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_PartitionFsMemory
	cmp	r0, #0
	bne	.L2459
	ldr	r3, [r5, #2308]
	ldr	r3, [r3, #908]
	cmp	r3, #1
	beq	.L2434
	ldr	r0, [r5, #244]
	bl	FSP_GetTotalValidFsNum
	cmp	r0, #20
	movgt	r0, #20
	ble	.L2460
.L2423:
	str	r0, [r5, #176]
	b	.L2418
.L2419:
	mov	r8, #1
	strb	r3, [fp, #-71]
	strb	r8, [fp, #-72]
	mov	r3, #5
	strb	r3, [fp, #-70]
	b	.L2431
.L2460:
	ldr	r0, [r5, #244]
	bl	FSP_GetTotalValidFsNum
	b	.L2423
.L2420:
	mov	r0, r7
	ldr	r3, [r4, #68]
	ldr	r1, .L2461+4
	blx	r3
.L2422:
	ldr	r3, [r5, #2308]
	ldr	r3, [r3, #908]
	cmp	r3, #1
	beq	.L2434
	ldr	r3, [r4, #68]
	mov	r0, #0
	ldr	r2, .L2461+8
	ldr	r1, .L2461+12
	blx	r3
	mvn	r0, #4
	b	.L2456
.L2434:
	mvn	r0, #1
	b	.L2456
.L2458:
	ldr	ip, .L2461
	movw	r3, #7658
	ldr	r2, .L2461+8
	mov	r0, #1
	ldr	r1, .L2461+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2456
.L2459:
	mov	r0, r7
	ldr	r3, [r4, #68]
	ldr	r1, .L2461+20
	blx	r3
	b	.L2422
.L2462:
	.align	2
.L2461:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC223
	.word	.LANCHOR0+1176
	.word	.LC224
	.word	.LC36
	.word	.LC222
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
	subs	r7, r0, #0
	beq	.L2464
	ldr	r2, [r7, #160]
	cmn	r2, #1
	addne	r6, r7, #53248
	movne	r4, #0
	movne	r5, r4
	bne	.L2468
	b	.L2469
.L2467:
	add	r3, r2, #1
	cmp	r3, r5
	bls	.L2469
.L2468:
	ldr	r1, [r6, #3252]
	add	r5, r5, #1
	add	r1, r1, r4
	add	r4, r4, #100
	ldr	r3, [r1, #36]
	cmp	r3, #1
	bne	.L2467
	ldr	r0, [r7, #244]
	bl	HEVC_ReleaseNAL
	ldr	r2, [r7, #160]
	add	r3, r2, #1
	cmp	r3, r5
	bhi	.L2468
.L2469:
	mov	r0, #0
	strb	r0, [r7, #4]
	str	r0, [r7, #140]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2464:
	ldr	ip, .L2471
	movw	r3, #11393
	ldr	r2, .L2471+4
	mov	r0, #1
	ldr	r1, .L2471+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2472:
	.align	2
.L2471:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1192
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ClearAllNal, .-HEVC_ClearAllNal
	.align	2
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
	ldr	r8, .L2486
	mov	r7, r0
	ldr	r1, .L2486+4
	mov	r0, #22
	add	r4, r7, #57344
	mov	r6, #0
	ldr	r3, [r8, #68]
	add	r4, r4, #40
	blx	r3
	mov	r3, #-2147483647
	mov	r0, r7
	str	r3, [r7, #212]
	bl	HEVC_ClearAllNal
	add	r0, r7, #50944
	add	r0, r0, #56
	mov	r5, r6
	bl	ResetVoQueue
	mov	r9, #20
.L2474:
	strb	r5, [r4, #-72]
	mov	r3, #16
	str	r5, [r4, #-68]
	mov	r0, r4
	strb	r5, [r4, #-71]
	mov	r2, #504
	str	r5, [r4, #-60]
	mov	r1, #0
	strb	r5, [r4, #-70]
	str	r9, [r4, #-48]
	str	r3, [r4, #-44]
	ldr	r3, [r8, #48]
	blx	r3
	str	r6, [r4, #196]
	add	r6, r6, #1
	sub	r3, r4, #72
	cmp	r6, #20
	str	r5, [r4, #-24]
	str	r3, [r4, #-4]
	add	r4, r4, #584
	bne	.L2474
	add	r3, r7, #2096
	add	r1, r7, #2176
	mov	r2, #0
.L2475:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L2475
	ldr	r3, [r7, #160]
	cmp	r3, #0
	addne	ip, r7, #53248
	movne	r3, #0
	movne	r0, r3
	movne	r1, r3
	beq	.L2479
.L2478:
	ldr	r2, [ip, #4056]
	add	r0, r0, #1
	str	r1, [r2, r3]
	ldr	r2, [ip, #4056]
	add	r2, r2, r3
	str	r1, [r2, #20]
	ldr	r2, [ip, #4056]
	add	r2, r2, r3
	add	r3, r3, #28
	str	r1, [r2, #24]
	ldr	r2, [r7, #160]
	cmp	r2, r0
	bhi	.L2478
.L2479:
	ldr	r3, [r8, #48]
	mov	r2, #200
	mov	r1, #0
	add	r0, r7, #2784
	blx	r3
	add	ip, r7, #2704
	add	r0, r7, #2640
	add	r1, r7, #2496
	add	ip, ip, #8
	add	r0, r0, #4
	add	r1, r1, #12
	add	lr, r7, #2576
	mov	r3, #16
	mov	r2, #17
	str	r3, [r7, #2784]
	mov	r3, #0
.L2477:
	subs	r2, r2, #1
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [lr, #4]!
	str	r3, [r1, #4]!
	bne	.L2477
	add	r1, r7, #2304
	add	ip, r7, #2448
	add	r1, r1, #12
	add	ip, ip, #4
	add	r3, r7, #2384
	mov	r0, r2
	mov	lr, #17
	str	r2, [r7, #2492]
	str	r2, [r7, #2496]
	str	r2, [r7, #2500]
	str	r2, [r7, #2504]
	str	r2, [r7, #2508]
	str	lr, [r7, #2488]
.L2480:
	str	r0, [r3, #4]!
	cmp	r3, ip
	str	r0, [r1, #4]!
	mov	r4, #0
	bne	.L2480
	add	r0, r7, #43520
	mov	r6, #2
	mov	r1, r4
	str	r4, [r7, #2316]
	str	r4, [r7, #208]
	movw	r2, #3732
	str	r4, [r7, #224]
	add	r0, r0, #16
	str	r4, [r7, #216]
	add	r5, r7, #2448
	str	r6, [r7, #172]
	add	r5, r5, #8
	ldr	r3, [r8, #48]
	blx	r3
	add	r1, r7, #40960
	add	r2, r7, #45056
	mov	lr, #32
	str	r6, [r1, #2636]
	mov	r3, #1
	mov	ip, #20
	str	r3, [r2, #68]
	mov	r1, r4
	strb	r3, [r7]
	strb	r3, [r7, #2]
	mov	r2, lr
	mov	r3, #8
	str	r6, [r7, #2192]
	strb	r4, [r7, #3]
	mov	r0, r5
	strb	r4, [r7, #1]
	mov	r6, #64
	strb	r4, [r7, #7]
	str	r4, [r7, #168]
	str	lr, [r7, #304]
	mvn	lr, #-2147483648
	str	ip, [r7, #176]
	str	ip, [r7, #180]
	mov	ip, #16
	str	r3, [r7, #192]
	str	r3, [r7, #196]
	str	r3, [r7, #296]
	mov	r3, #256
	str	lr, [r7, #200]
	movw	lr, #1025
	str	ip, [r7, #276]
	str	ip, [r7, #300]
	mov	ip, #4
	str	r3, [r7, #284]
	mov	r3, #6
	ldr	r4, [r8, #48]
	str	r6, [r7, #280]
	str	lr, [r7, #288]
	str	ip, [r7, #292]
	str	r3, [r7, #2180]
	str	r3, [r7, #2184]
	str	r3, [r7, #2188]
	blx	r4
	str	r5, [r7, #2292]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2487:
	.align	2
.L2486:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC225
	UNWIND(.fnend)
	.size	HEVC_InitDecPara, .-HEVC_InitDecPara
	.align	2
	.global	HEVCDEC_Init
	.type	HEVCDEC_Init, %function
HEVCDEC_Init:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r1
	str	r0, [fp, #-60]
	moveq	r5, #1
	movne	r5, #0
	beq	.L2537
	ldr	r8, [fp, #-60]
	movw	r2, #6936
	mov	r1, r5
	movt	r2, 1
	add	r3, r8, #49152
	str	r3, [fp, #-76]
	ldr	r6, [r3, #2192]
	mov	r7, r3
	ldr	r3, .L2542
	ldr	r3, [r3, #48]
	blx	r3
	str	r6, [r7, #2192]
	str	r4, [r8, #2308]
	str	r5, [r8, #2312]
	ldr	r3, [r4, #28]
	cmp	r3, #25
	beq	.L2538
	ldr	r0, [fp, #-60]
	mov	r3, #17
	mov	r1, #65
	mov	r2, #200
	str	r3, [r0, #148]
	str	r3, [r0, #152]
	mov	r3, #210
	str	r1, [r0, #156]
	str	r2, [r0, #144]
	str	r3, [r0, #160]
	ldr	r0, [r4, #668]
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L2539
.L2493:
	ldr	r6, [fp, #-60]
	movw	r2, #12820
	movw	lr, #15788
	mov	r9, #1360
	add	r5, r6, #53248
	ldr	r0, [r6, #2308]
	ldr	r8, [r6, #148]
	ldr	r3, [r6, #152]
	ldr	r0, [r0, #664]
	ldr	ip, [r6, #156]
	mul	r2, r2, r8
	add	r0, r1, r0
	mul	r3, lr, r3
	movw	r1, #2024
	mul	r1, r1, ip
	add	ip, r0, r2
	add	lr, ip, r3
	str	r0, [r6, #2296]
	str	ip, [r6, #2300]
	str	lr, [r6, #2304]
	add	r10, lr, r1
	str	r10, [r5, #3248]
	ldr	r7, [r6, #144]
	mla	r7, r9, r7, r10
	mov	r9, #100
	str	r7, [r5, #3252]
	ldr	r6, [r6, #160]
	mla	r6, r6, r9, r9
	add	r7, r7, r6
	str	r7, [r5, #4056]
	ldr	r4, [r4, #688]
	cmp	r4, #0
	bne	.L2494
	ldr	r3, .L2542
	mov	r1, r4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r6, [fp, #-60]
	mov	r2, #1
	movw	ip, #15788
	mov	r1, r4
	ldr	r3, [r6, #2296]
	strb	r2, [r3]
	ldr	r3, .L2542
	ldr	r2, [r6, #152]
	ldr	r0, [r6, #2300]
	ldr	r3, [r3, #48]
	mul	r2, ip, r2
	blx	r3
	ldr	r2, [r6, #156]
	ldr	r3, .L2542
	movw	ip, #2024
	mov	r1, r4
	ldr	r0, [r6, #2304]
	mul	r2, ip, r2
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, [r6, #144]
	ldr	r3, .L2542
	mov	ip, #1360
	mov	r1, r4
	ldr	r0, [r5, #3248]
	mul	r2, ip, r2
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, [r6, #160]
	ldr	r3, .L2542
	mov	r1, r4
	ldr	r0, [r5, #3252]
	mla	r2, r2, r9, r9
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r6, #160]
	ldr	r2, .L2542
	mov	r1, r4
	ldr	r0, [r5, #4056]
	ldr	r4, [r2, #48]
	mov	r2, r3, asl #5
	sub	r2, r2, r3, asl #2
	blx	r4
	ldr	r8, [r6, #148]
	ldr	r3, [r6, #152]
	movw	r2, #12820
	movw	r4, #15788
	ldr	r1, [r6, #156]
	mul	r2, r2, r8
	movw	lr, #2024
	mul	r3, r4, r3
	ldr	r0, [r6, #2296]
	mul	r1, lr, r1
	ldr	ip, [r6, #2300]
	ldr	lr, [r6, #2304]
.L2494:
	sub	r2, r2, #12800
	sub	r1, r1, #2016
	sub	r2, r2, #20
	sub	r3, r3, #15744
	add	r0, r0, r2
	ldr	r2, [fp, #-60]
	sub	r1, r1, #8
	sub	r3, r3, #44
	add	r4, r2, #24576
	add	r1, lr, r1
	mov	lr, r2
	add	ip, ip, r3
	str	r1, [r4, #2608]
	add	r3, r2, #7
	str	r0, [r4, #2600]
	add	r1, r2, #136
	str	ip, [r4, #2604]
	mvn	r2, #0
	str	r8, [r0, #8]
	ldr	r0, [r4, #2608]
	ldr	ip, [lr, #152]
	str	ip, [r0, #28]
	ldr	r0, [r4, #2604]
	ldr	ip, [lr, #156]
	str	ip, [r0, #60]
.L2495:
	strb	r2, [r3, #1]!
	cmp	r3, r1
	bne	.L2495
	ldr	r2, [fp, #-60]
	mov	r3, #2
	mov	r10, r3
	add	r1, r2, #308
	str	r1, [fp, #-72]
	strb	r3, [r2, #24]
	ldr	r3, .L2542+4
	mov	r5, r3
	mov	r3, #0
	strb	r3, [r2, #12]
	mov	r3, #1
	strb	r3, [r2, #16]
	mov	r3, #3
	strb	r3, [r2, #40]
	mov	r3, #4
	strb	r3, [r2, #72]
.L2507:
	cmp	r10, #15
	bgt	.L2496
	cmp	r10, #8
	mul	r9, r10, r10
	beq	.L2540
	cmp	r9, #0
	movne	r3, r5
	beq	.L2496
.L2498:
	mov	r6, #0
	rsb	r7, r10, #1
	str	r5, [fp, #-48]
	mov	r8, r6
	mov	r5, r3
.L2504:
	cmp	r8, r10
	blt	.L2519
	rsb	r4, r10, r8
	sub	r2, r10, #1
	add	r4, r4, #1
.L2505:
	cmp	r4, r10
	mvn	r3, r2
	mov	r3, r3, lsr #31
	movge	r3, #0
	cmp	r3, #0
	beq	.L2502
	mla	r0, r10, r2, r4
	add	ip, r5, r6, lsl #2
	mov	r1, r6
.L2503:
	add	r1, r1, #1
	sub	r2, r2, #1
	rsb	r3, r6, r1
	str	r0, [ip], #4
	add	r3, r3, r4
	mvn	lr, r2
	cmp	r3, r10
	mov	lr, lr, lsr #31
	add	r0, r0, r7
	movge	lr, #0
	cmp	lr, #0
	bne	.L2503
	mov	r6, r1
.L2502:
	cmp	r9, r6
	add	r8, r8, #1
	bhi	.L2504
	ldr	r5, [fp, #-48]
.L2496:
	cmp	r10, #4
	ble	.L2501
	mov	r3, r10, asr #2
	ldr	r1, [fp, #-60]
	str	r3, [fp, #-64]
	mov	r2, r3
	add	r3, r1, r3
	mul	r2, r2, r2
	ldrsb	r3, [r3, #8]
	add	r3, r3, #1
	cmp	r2, #0
	str	r2, [fp, #-68]
	beq	.L2501
.L2500:
	ldr	r2, .L2542+4
	rsb	r4, r10, #1
	add	r3, r2, r3, lsl #16
	sub	r3, r3, #4
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-48]
.L2516:
	ldr	r3, [fp, #-56]
	cmp	r10, #32
	ldr	r8, [fp, #-64]
	ldr	r6, [r3, #4]!
	mov	r1, r8
	str	r3, [fp, #-56]
	ldreq	r3, [fp, #-52]
	ldreq	r6, [r3]
	mov	r0, r6
	bl	__aeabi_uidiv
	ldr	ip, [fp, #-48]
	mov	r3, #0
	mov	r7, r3
	mov	r2, r3
	mov	r9, ip, asl #4
	mov	lr, r3
	mla	r1, r10, r0, r6
	mls	r1, r8, r0, r1
	mov	r8, r1, asl #2
.L2510:
	cmp	lr, #3
	mvn	r1, r2
	mov	r1, r1, lsr #31
	movgt	r1, #0
	cmp	r1, #0
	beq	.L2511
	mla	r1, r10, r2, lr
	add	r0, r3, r9
	rsb	lr, r3, lr
	add	r0, r5, r0, lsl #2
	add	r1, r1, r8
.L2512:
	add	r3, r3, #1
	sub	r2, r2, #1
	add	r6, lr, r3
	str	r1, [r0], #4
	cmp	r6, #3
	mvn	ip, r2
	mov	ip, ip, lsr #31
	add	r1, r1, r4
	movgt	ip, #0
	cmp	ip, #0
	bne	.L2512
.L2511:
	cmp	r3, #15
	add	r7, r7, #1
	bhi	.L2513
	cmp	r7, #3
	movle	r2, r7
	movle	lr, #0
	subgt	lr, r7, #3
	movgt	r2, #3
	b	.L2510
.L2513:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	add	r2, r2, #4
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L2516
.L2501:
	ldr	r3, .L2542+8
	add	r5, r5, #65536
	mov	r10, r10, asl #1
	cmp	r5, r3
	bne	.L2507
	ldr	r4, [fp, #-60]
	mov	r2, #1
	add	r3, r4, #69632
	mov	r0, r4
	str	r2, [r3, #2836]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #244]
	beq	.L2541
	ldr	r4, [fp, #-60]
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	bl	HEVC_InitDecPara
	ldr	r3, [fp, #-76]
	mov	r0, #0
	movw	r2, #9999
	str	r0, [r3, #2200]
	ldr	r3, [r4, #156]
	str	r2, [r4, #252]
	str	r3, [r4, #272]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2519:
	mov	r2, r8
	mov	r4, #0
	b	.L2505
.L2540:
	cmp	r9, #0
	ldr	r3, [fp, #-72]
	bne	.L2498
	ldr	r3, [fp, #-60]
	mov	r2, #2
	str	r2, [fp, #-64]
	mov	r2, #4
	str	r2, [fp, #-68]
	ldrsb	r3, [r3, #10]
	add	r3, r3, #1
	b	.L2500
.L2538:
	ldr	r3, [r4, #748]
	ldr	r1, [fp, #-60]
	str	r3, [r1, #148]
	ldr	r3, [r4, #752]
	str	r3, [r1, #152]
	ldr	r3, [r4, #756]
	str	r3, [r1, #156]
	ldr	r3, [r4, #744]
	add	r2, r3, #5
	str	r2, [r1, #160]
	str	r3, [r1, #144]
	ldr	r0, [r4, #668]
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	bne	.L2493
.L2539:
	ldr	r3, .L2542
	ldr	r2, .L2542+12
	ldr	r1, .L2542+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #19
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2537:
	ldr	ip, .L2542
	movw	r3, #11187
	ldr	r2, .L2542+12
	mov	r0, #1
	ldr	r1, .L2542+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2541:
	ldr	r3, .L2542
	mov	r0, #0
	ldr	r2, .L2542+12
	ldr	r1, .L2542+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #19
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2543:
	.align	2
.L2542:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR4-3912
	.word	.LANCHOR4+454840
	.word	.LANCHOR0+1212
	.word	.LC226
	.word	.LC36
	.word	.LC227
	UNWIND(.fnend)
	.size	HEVCDEC_Init, .-HEVCDEC_Init
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
	subs	r5, r0, #0
	beq	.L2551
	add	r4, r5, #40960
	bl	HEVC_ClearAllSlice
	ldr	r3, [r4, #2068]
	cmp	r3, #0
	beq	.L2547
	ldr	r1, [r3, #32]
	mov	r2, #1
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #2068]
	mov	r3, #0
	str	r3, [r2, #4]
	str	r3, [r4, #2068]
.L2547:
	mov	r0, #0
	strb	r0, [r4, #2017]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2551:
	ldr	ip, .L2552
	movw	r3, #11415
	ldr	r2, .L2552+4
	mov	r0, #1
	ldr	r1, .L2552+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2553:
	.align	2
.L2552:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1228
	.word	.LC36
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
	subs	r4, r0, #0
	mov	r5, r1
	beq	.L2559
	bl	HEVC_ClearCurrPic
	mov	r1, #0
	mov	r0, r4
	bl	HEVC_InitDPB
	cmp	r5, #0
	bne	.L2560
	add	r0, r4, #50944
	add	r0, r0, #56
	bl	ResetVoQueue
	ldr	r0, [r4, #244]
	bl	FSP_EmptyInstance
.L2558:
	mov	r0, r4
	bl	HEVC_InitDecPara
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2560:
	add	r1, r4, #50944
	ldr	r0, [r4, #244]
	add	r1, r1, #56
	bl	FSP_ClearNotInVoQueue
	b	.L2558
.L2559:
	ldr	ip, .L2561
	movw	r3, #11160
	ldr	r2, .L2561+4
	mov	r0, #1
	ldr	r1, .L2561+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2562:
	.align	2
.L2561:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1248
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ClearAll, .-HEVC_ClearAll
	.align	2
	.global	HEVC_InitPic
	.type	HEVC_InitPic, %function
HEVC_InitPic:
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
	beq	.L2630
	add	r6, r5, #24576
	add	r4, r5, #40960
	ldr	r1, [r6, #2584]
	ldr	r3, [r6, #2604]
	ldr	r2, [r4, #2652]
	str	r1, [fp, #-60]
	ldr	r1, [r6, #2588]
	cmp	r2, #0
	str	r1, [fp, #-52]
	ldr	r1, [r3, #100]
	str	r1, [fp, #-68]
	ldr	r1, [r3, #108]
	str	r1, [fp, #-72]
	ldr	r1, [r6, #2592]
	str	r1, [fp, #-56]
	ldr	r1, [r6, #2596]
	str	r1, [fp, #-76]
	blt	.L2599
	ldr	r1, [r5, #156]
	cmp	r2, r1
	bge	.L2599
	ldr	ip, [r5, #2304]
	movw	lr, #2024
	movw	r0, #15788
	ldr	r10, [r5, #2300]
	ldr	r7, [r5, #2296]
	movw	r1, #12820
	mla	r2, lr, r2, ip
	mov	ip, r2
	str	r2, [fp, #-48]
	ldr	r9, [ip, #32]
	ldr	r2, [r6, #2600]
	mul	r9, r0, r9
	ldr	r2, [r2, #8]
	add	r8, r10, r9
	ldr	r0, [r8, #52]
	mla	r1, r1, r0, r7
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L2566
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2631
.L2566:
	mov	r3, #0
	strb	r3, [r1, #2]
	ldr	r0, [r5, #148]
	movw	r7, #12820
	ldr	r3, .L2639
	mov	r2, r7
	ldr	ip, [r5, #2296]
	mul	r0, r7, r0
	ldr	r3, [r3, #52]
	sub	r0, r0, #12800
	sub	r0, r0, #20
	add	r0, ip, r0
	blx	r3
	ldr	r1, [r5, #148]
	ldr	r3, [r6, #2604]
	ldr	r2, [r5, #2296]
	mul	r7, r7, r1
	sub	r7, r7, #12800
	sub	r7, r7, #20
	add	r7, r2, r7
	str	r7, [r6, #2600]
.L2567:
	ldr	r1, [r3, #60]
	ldr	r2, [r8, #60]
	cmp	r1, r2
	bne	.L2568
	ldrb	r2, [r10, r9]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2632
.L2568:
	mov	r3, #0
	strb	r3, [r10, r9]
	ldr	r0, [r5, #152]
	movw	r7, #15788
	ldr	r3, .L2639
	mov	r2, r7
	ldr	ip, [r5, #2300]
	mov	r1, r8
	mul	r0, r7, r0
	ldr	r3, [r3, #52]
	sub	r0, r0, #15744
	sub	r0, r0, #44
	add	r0, ip, r0
	blx	r3
	ldr	r2, [r5, #152]
	ldr	r3, [r5, #2300]
	mul	r7, r7, r2
	sub	r7, r7, #15744
	sub	r7, r7, #44
	add	r3, r3, r7
	str	r3, [r6, #2604]
	ldr	r2, [r3, #60]
	str	r2, [r6, #2584]
	ldr	r2, [r3, #72]
	str	r2, [r6, #2588]
	ldr	r2, [r3, #76]
	str	r2, [r6, #2592]
	ldr	r2, [r3, #148]
	str	r2, [r6, #2596]
	ldr	r1, [r8, #236]
	ldr	r2, [r3, #236]
	subs	r2, r1, r2
	movne	r2, #1
	str	r2, [fp, #-64]
.L2569:
	ldr	r2, [r3, #108]
	ldr	r3, [r3, #100]
	ldr	r1, [r5, #2308]
	cmp	r2, r3
	movcc	r2, r3
	ldr	r3, [fp, #-48]
	str	r2, [r1, #912]
	ldr	r2, [r6, #2608]
	ldr	r3, [r3, #28]
	ldr	r2, [r2, #28]
	cmp	r2, r3
	beq	.L2633
.L2570:
	ldr	r2, [fp, #-48]
	mov	r7, #0
	ldrb	r3, [r2, #13]	@ zero_extendqisi2
	strb	r7, [r2, #1]
	cmp	r3, r7
	beq	.L2572
	ldrb	r3, [r2, #15]	@ zero_extendqisi2
	cmp	r3, r7
	beq	.L2573
	ldr	r10, [r2, #68]
	cmp	r10, r7
	ble	.L2578
	ldr	r3, [fp, #-48]
	str	r4, [fp, #-80]
	add	r2, r3, #174
	str	r5, [fp, #-76]
	mov	r4, r2
.L2577:
	ldr	r5, [r8, #240]
	add	r7, r7, #1
	mov	r1, r10
	mul	r0, r5, r7
	bl	__aeabi_uidiv
	mov	r1, r10
	mov	r9, r0
	sub	r0, r7, #1
	mul	r0, r0, r5
	bl	__aeabi_uidiv
	cmp	r7, r10
	rsb	r0, r0, r9
	strh	r0, [r4, #2]!	@ movhi
	bne	.L2577
	ldr	r5, [fp, #-76]
	ldr	r4, [fp, #-80]
.L2578:
	ldr	r3, [fp, #-48]
	ldr	r10, [r3, #72]
	cmp	r10, #0
	ble	.L2579
	ldr	r3, [fp, #-48]
	mov	r7, #0
	str	r4, [fp, #-80]
	add	r2, r3, #214
	str	r5, [fp, #-76]
	mov	r4, r2
.L2580:
	ldr	r5, [r8, #244]
	add	r7, r7, #1
	mov	r1, r10
	mul	r0, r5, r7
	bl	__aeabi_uidiv
	mov	r1, r10
	mov	r9, r0
	sub	r0, r7, #1
	mul	r0, r5, r0
	bl	__aeabi_uidiv
	cmp	r7, r10
	rsb	r0, r0, r9
	strh	r0, [r4, #2]!	@ movhi
	bne	.L2580
	ldr	r5, [fp, #-76]
	ldr	r4, [fp, #-80]
	b	.L2579
.L2599:
	mov	r0, #0
.L2623:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2572:
	ldr	r3, [r8, #240]
	ldr	r2, [fp, #-48]
	strh	r3, [r2, #176]	@ movhi
	ldr	r3, [r8, #244]
	strh	r3, [r2, #216]	@ movhi
.L2579:
	ldr	r0, [r5, #156]
	movw	r7, #2024
	ldr	r3, .L2639
	mov	r2, r7
	ldr	ip, [r5, #2304]
	mul	r0, r7, r0
	ldr	r3, [r3, #52]
	ldr	r1, [fp, #-48]
	sub	r0, r0, #2016
	sub	r0, r0, #8
	add	r0, ip, r0
	blx	r3
	ldr	r2, [r5, #156]
	ldr	r3, [r5, #2304]
	mul	r7, r7, r2
	sub	r7, r7, #2016
	sub	r7, r7, #8
	add	r7, r3, r7
	str	r7, [r6, #2608]
.L2571:
	ldr	r3, [r8, #60]
	ldr	r2, [fp, #-64]
	ldr	r1, [fp, #-60]
	cmp	r1, r3
	orrne	r2, r2, #1
	cmp	r2, #0
	bne	.L2629
	ldr	r3, [r5, #168]
	cmp	r3, #0
	bne	.L2634
.L2629:
	ldr	r2, [r5, #2308]
.L2586:
	ldr	r0, [r5, #2304]
	movw	ip, #2024
	ldr	r3, [r4, #2652]
	movw	r1, #15788
	ldr	lr, [r5, #2300]
	mla	r3, ip, r3, r0
	ldr	ip, [fp, #-52]
	ldr	r3, [r3, #32]
	mla	r1, r1, r3, lr
	ldr	r3, [r1, #72]
	ldr	r0, [r1, #76]
	ldr	r1, [fp, #-56]
	cmp	ip, r3
	cmpeq	r1, r0
	ldr	r1, [fp, #-64]
	movne	r3, #1
	moveq	r3, #0
	orrs	r3, r1, r3
	beq	.L2588
	ldr	r3, [r2, #916]
.L2589:
	cmp	r3, #1
	beq	.L2635
.L2592:
	add	r3, r5, #69632
	ldr	r3, [r3, #2836]
	cmp	r3, #1
	beq	.L2636
.L2593:
	mov	r1, #1
	mov	r0, r5
	bl	HEVC_InitDPB
	cmn	r0, #2
	beq	.L2623
	cmp	r0, #0
	ldreq	r2, [r5, #2308]
	bne	.L2637
.L2597:
	mov	r3, #0
	str	r3, [r2, #916]
.L2587:
	mov	r0, r5
	bl	HEVC_AllocFrameStore
	subs	r7, r0, #0
	bne	.L2638
	ldr	ip, [r4, #2648]
	mov	r0, #1
	ldr	r3, [r4, #2624]
	mvn	r2, #0
	ldr	r1, [r4, #2068]
	movw	r10, #43040
	str	ip, [r4, #2020]
	add	ip, r5, #43008
	strb	r0, [r4, #2017]
	movw	lr, #43056
	str	r3, [r4, #2024]
	add	r0, ip, #24
	str	r3, [r1, #12]
	str	r2, [r4, #2048]
	ldr	r3, [r6, #2604]
	ldr	r2, [r3, #72]
	str	r2, [r4, #2032]
	ldr	r2, [r3, #76]
	str	r2, [r4, #2036]
	mvn	r2, #0
	ldr	r1, [r3, #240]
	ldr	r3, [r3, #244]
	str	r7, [r4, #2044]
	mul	r1, r3, r1
	mvn	r3, #0
	str	r1, [r4, #2040]
	ldr	r1, [r5, #2308]
	ldrd	r8, [r1, #48]
	strd	r8, [r5, r10]
	ldrd	r8, [r1, #64]
	strd	r8, [ip, #40]
	ldrd	r8, [r1, #80]
	strd	r8, [r5, lr]
	ldr	ip, [r1, #96]
	str	ip, [r4, #2140]
	ldr	ip, [r1, #100]
	str	ip, [r4, #2144]
	ldr	ip, [r1, #104]
	str	ip, [r4, #2148]
	ldr	ip, [r1, #120]
	str	ip, [r4, #2152]
	strd	r2, [r1, #48]
	ldr	r2, [r6, #2604]
	ldr	r3, [r2, #72]
	str	r3, [r4, #2236]
	ldr	r3, [r2, #76]
	str	r3, [r4, #2240]
	ldr	r3, [r2, #2660]
	ldr	r1, [r2, #64]
	mov	r3, r3, asl #5
	subs	r1, r1, #1
	uxtb	r3, r3
	movne	r1, #1
	orr	r3, r3, r1, asl #2
	str	r3, [r4, #2232]
	ldr	r1, [r2, #2644]
	and	r1, r1, #7
	bl	SetAspectRatio
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2232]
	str	r7, [r4, #2220]
	str	r2, [r3, #232]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2220]
	str	r2, [r3, #220]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2136]
	str	r2, [r3, #136]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2132]
	str	r2, [r3, #132]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2236]
	str	r2, [r3, #236]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2240]
	str	r2, [r3, #240]
	ldr	r3, [r4, #2068]
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L2596
	ldr	r3, [r4, #2220]
	mov	r1, r7
	ldr	r2, [r0, #4]
	adds	r3, r3, #0
	ldr	r0, [r5, #244]
	movne	r3, #1
	bl	FSP_SetStoreType
.L2596:
	ldr	ip, [r6, #2604]
	mov	r5, #0
	ldr	lr, [r4, #2068]
	mov	r0, r5
	ldr	r3, [ip, #84]
	str	r3, [r4, #2412]
	ldr	r7, [ip, #88]
	str	r7, [r4, #2416]
	ldr	r2, [ip, #92]
	str	r2, [r4, #2420]
	ldr	r6, [ip, #96]
	str	r6, [r4, #2424]
	ldr	r1, [ip, #72]
	rsb	r3, r3, r1
	rsb	r3, r7, r3
	str	r3, [r4, #2244]
	ldr	r1, [ip, #76]
	rsb	r2, r2, r1
	rsb	r2, r6, r2
	str	r2, [r4, #2248]
	ldr	r2, [ip, #64]
	str	r2, [r4, #2300]
	ldr	r2, [ip, #100]
	str	r2, [r4, #2304]
	ldr	r2, [ip, #108]
	str	r2, [r4, #2308]
	ldr	r2, [lr, #252]
	str	r2, [r4, #2252]
	ldr	r2, [lr, #256]
	str	r2, [r4, #2256]
	str	r3, [lr, #244]
	ldr	r2, [r4, #2248]
	ldr	r3, [r4, #2068]
	str	r2, [r3, #248]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2252]
	str	r2, [r3, #252]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2256]
	str	r2, [r3, #256]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2304]
	str	r2, [r3, #304]
	ldr	r3, [r4, #2068]
	ldr	r2, [r4, #2308]
	str	r2, [r3, #308]
	str	r5, [r4, #2028]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2573:
	ldr	r2, [fp, #-48]
	ldr	r3, [r8, #240]
	ldr	lr, [r2, #68]
	cmp	lr, #1
	add	r0, r2, lr, lsl #1
	strh	r3, [r0, #174]	@ movhi
	ble	.L2584
	ldr	r3, [fp, #-48]
	add	lr, lr, #44
	add	r1, r3, #90
	add	ip, r3, #174
	add	lr, r3, lr, lsl #1
.L2583:
	ldrh	r2, [r1, #2]!
	cmp	r1, lr
	strh	r2, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #174]
	rsb	r3, r2, r3
	strh	r3, [r0, #174]	@ movhi
	bne	.L2583
.L2584:
	ldr	r2, [fp, #-48]
	ldr	r3, [r8, #244]
	ldr	lr, [r2, #72]
	cmp	lr, #1
	add	r0, r2, lr, lsl #1
	strh	r3, [r0, #214]	@ movhi
	ble	.L2579
	ldr	r3, [fp, #-48]
	add	lr, lr, #64
	add	r1, r3, #130
	add	ip, r3, #214
	add	lr, r3, lr, lsl #1
.L2585:
	ldrh	r2, [r1, #2]!
	cmp	r1, lr
	strh	r2, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #214]
	rsb	r3, r2, r3
	strh	r3, [r0, #214]	@ movhi
	bne	.L2585
	b	.L2579
.L2632:
	ldr	r1, [r5, #168]
	cmp	r1, #0
	beq	.L2568
	ldr	r1, [r8, #72]
	ldr	r0, [fp, #-52]
	cmp	r0, r1
	bne	.L2568
	ldr	r1, [r8, #76]
	ldr	r0, [fp, #-56]
	cmp	r0, r1
	bne	.L2568
	ldr	r1, [r8, #148]
	ldr	r0, [fp, #-76]
	cmp	r0, r1
	streq	r2, [fp, #-64]
	bne	.L2568
	b	.L2569
.L2631:
	ldr	r2, [r5, #168]
	cmp	r2, #0
	bne	.L2567
	b	.L2566
.L2638:
	ldr	r3, .L2639
	mov	r0, #1
	ldr	r1, .L2639+4
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2633:
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2570
	ldr	r3, [r5, #168]
	cmp	r3, #0
	beq	.L2570
	ldr	r3, [r8, #72]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L2570
	ldr	r3, [r8, #76]
	ldr	r2, [fp, #-56]
	cmp	r2, r3
	bne	.L2570
	ldr	r3, [r8, #148]
	ldr	r2, [fp, #-76]
	cmp	r2, r3
	bne	.L2570
	b	.L2571
.L2588:
	ldr	r3, [r5, #168]
	cmp	r3, #0
	ldr	r3, [r2, #916]
	beq	.L2589
	cmp	r3, #0
	bne	.L2589
	ldr	r3, [r2, #908]
	cmp	r3, #1
	bne	.L2597
	b	.L2592
.L2634:
	ldr	r3, [r8, #72]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L2629
	ldr	r2, [fp, #-56]
	ldr	r3, [r8, #76]
	cmp	r2, r3
	ldr	r2, [r5, #2308]
	bne	.L2586
	ldr	r3, [r2, #908]
	cmp	r3, #1
	bne	.L2587
	b	.L2586
.L2636:
	mov	r0, r5
	bl	HEVC_GetBackPicFromVOQueue
	b	.L2593
.L2635:
	ldr	ip, [r8, #108]
	mov	r0, #31
	ldr	r1, .L2639
	ldr	lr, [fp, #-72]
	ldr	r3, [r8, #100]
	ldr	r2, [fp, #-68]
	str	lr, [sp]
	str	ip, [sp, #4]
	ldr	r7, [r1, #68]
	ldr	r1, .L2639+8
	blx	r7
	b	.L2592
.L2637:
	ldr	r3, .L2639
	mov	r2, r0
	ldr	r1, .L2639+12
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r5
	mov	r1, #0
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L2623
.L2630:
	ldr	ip, .L2639
	movw	r3, #7015
	ldr	r2, .L2639+16
	mov	r0, #1
	ldr	r1, .L2639+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2623
.L2640:
	.align	2
.L2639:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC230
	.word	.LC228
	.word	.LC229
	.word	.LANCHOR0+1264
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_InitPic, .-HEVC_InitPic
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r6, r1
	moveq	r5, #1
	movne	r5, #0
	beq	.L2650
	bl	HEVC_GetImagePara
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r7, r0, #0
	beq	.L2651
	cmn	r7, #3
	moveq	r0, r5
	bne	.L2652
.L2643:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2651:
	mov	r2, #1
	ldr	r1, [r6, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	ldr	r1, [r6, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L2653
	add	r3, r4, #50944
	ldr	r0, [r4, #244]
	add	r3, r3, #56
	str	r5, [sp]
	mov	r2, r4
	mov	r1, #17
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2654
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	strcc	r7, [r5, #84]
	bcs	.L2655
.L2648:
	ldr	r2, [r4, #268]
	mov	r0, #0
	ldr	r3, [r4, #260]
	add	r2, r2, #1
	str	r2, [r4, #268]
	add	r3, r3, #1
	str	r3, [r4, #260]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2655:
	add	r1, r5, #84
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.isra.11.part.12
	b	.L2648
.L2650:
	ldr	ip, .L2656
	movw	r3, #9127
	ldr	r2, .L2656+4
	mov	r0, #1
	ldr	r1, .L2656+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2643
.L2652:
	ldr	ip, .L2656
	mov	r3, r7
	movw	r2, #9168
	ldr	r1, .L2656+12
	mov	r0, #1
	ldr	r5, [ip, #68]
	blx	r5
	ldr	r1, [r6, #268]
	mov	r0, r4
	bl	HEVC_DECRecycleImage
	mvn	r0, #0
	b	.L2643
.L2654:
	ldr	r3, .L2656
	mov	r2, r0
	ldr	r1, .L2656+16
	mov	r0, r7
	ldr	r3, [r3, #68]
	blx	r3
	mov	r2, r7
	ldr	r1, [r6, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L2643
.L2653:
	ldr	r3, .L2656
	ldr	r2, .L2656+4
	ldr	r1, .L2656+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2643
.L2657:
	.align	2
.L2656:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1280
	.word	.LC36
	.word	.LC233
	.word	.LC232
	.word	.LC231
	UNWIND(.fnend)
	.size	HEVC_OutputFrmToVO, .-HEVC_OutputFrmToVO
	.align	2
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
	ldr	r3, [r4, #2512]
	strb	r2, [r3, #2]
	ldr	r1, [r4, #2512]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r4, #2512]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r0
	bne	.L2659
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
.L2659:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_OutputOneFrmFromDPB, .-HEVC_OutputOneFrmFromDPB
	.align	2
	.global	HEVC_OutputFrmFromDPB
	.type	HEVC_OutputFrmFromDPB, %function
HEVC_OutputFrmFromDPB:
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
	subs	r6, r0, #0
	beq	.L2661
	ldr	r0, [r6, #2492]
	cmp	r0, #0
	moveq	r8, r0
	beq	.L2663
	add	r5, r6, #2496
	ldr	r2, [r6, #212]
	add	r5, r5, #12
	mov	r7, #0
	mov	r3, r7
	mov	ip, r5
.L2666:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L2665
	ldr	r1, [r1, #12]
	cmp	r1, r2
	addgt	r7, r7, #1
.L2665:
	cmp	r3, r0
	bne	.L2666
	ldr	r9, .L2680
	mov	r4, #0
	mov	r8, r4
.L2671:
	ldr	r3, [r5, #4]!
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2668
	ldr	r1, [r3, #12]
	cmp	r1, r2
	ble	.L2668
	add	lr, r6, #40960
	add	ip, r6, #24576
	ldr	r10, [lr, #2644]
	ldr	ip, [ip, #2604]
	add	ip, ip, r10, lsl #2
	ldr	ip, [ip, #412]
	cmp	ip, r7
	bcs	.L2668
	ldr	ip, [lr, #2624]
	cmp	r1, ip
	blt	.L2669
	ldrb	r1, [r6, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2669
.L2668:
	cmp	r2, #0
	bne	.L2670
	ldr	r1, [r3, #12]
	cmp	r1, #0
	blt	.L2678
.L2670:
	add	r4, r4, #1
	cmp	r0, r4
	bls	.L2663
.L2679:
	ldr	r2, [r6, #212]
	b	.L2671
.L2669:
	mov	r2, #1
	mov	r0, r6
	strb	r2, [r3, #2]
	add	r4, r4, #1
	ldr	r1, [r5]
	sub	r7, r7, #1
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	str	r3, [r6, #212]
	mov	r8, r0
	ldr	r0, [r6, #2492]
	cmp	r0, r4
	bhi	.L2679
.L2663:
	mov	r0, r8
.L2664:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2678:
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_SetDisplay
	ldr	r2, [r5]
	ldr	r3, [r6, #212]
	mov	r0, #31
	ldr	r10, [r9, #68]
	ldr	ip, [r2, #12]
	ldr	r1, .L2680+4
	ldr	r2, .L2680+8
	str	ip, [sp]
	blx	r10
	ldr	r0, [r6, #2492]
	b	.L2670
.L2661:
	ldr	ip, .L2680
	movw	r3, #8923
	ldr	r2, .L2680+8
	mov	r0, #1
	ldr	r1, .L2680+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2664
.L2681:
	.align	2
.L2680:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC234
	.word	.LANCHOR0+1300
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
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
	beq	.L2691
	ldr	r3, [r4, #2492]
	cmp	r3, #0
	addne	r5, r4, #2496
	movne	r6, #0
	addne	r5, r5, #12
	movne	r8, #1
	bne	.L2689
	b	.L2690
.L2697:
	strb	r8, [r3, #2]
	ldr	r1, [r5]
	bl	HEVC_OutputFrmToVO
	cmn	r0, #1
	mov	r9, r0
	beq	.L2696
.L2687:
	ldr	r3, [r4, #2492]
	cmp	r3, r6
	bls	.L2690
.L2689:
	ldr	r3, [r5, #4]!
	mov	r2, #0
	ldr	r0, [r4, #244]
	add	r6, r6, #1
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r3, [r5]
	mov	r0, r4
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L2697
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L2687
	ldr	r3, [r5]
	ldr	r0, [r4, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #2492]
	cmp	r3, r6
	bhi	.L2689
.L2690:
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	mov	r9, #0
	bl	Hevc_InitDecBuffers
.L2683:
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2696:
	ldr	r3, .L2698
	mov	r0, r7
	ldr	r2, .L2698+4
	ldr	r1, .L2698+8
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2691:
	mvn	r9, #0
	b	.L2683
.L2699:
	.align	2
.L2698:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1324
	.word	.LC235
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
	mov	r10, r1
	moveq	r2, #1
	movne	r2, #0
	beq	.L2743
	add	r6, r0, #69632
	str	r2, [r6, #2816]
	ldr	r5, [r0, #2316]
	cmp	r5, #0
	beq	.L2744
	ldrb	r2, [r1]	@ zero_extendqisi2
	str	r2, [r5, #40]
	ldr	r2, [r0, #2308]
	ldr	r1, [r2, #868]
	cmp	r1, #1
	beq	.L2745
.L2712:
	ldrb	r2, [r10]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L2713
	ldr	r2, [r4, #2316]
	ldr	r1, [r2, #8]
	cmp	r1, #1
	bls	.L2714
	ldr	r0, [r2, #40]
	cmp	r0, #1
	beq	.L2713
.L2714:
	ldr	r0, [r10, #12]
	cmp	r0, #0
	ble	.L2715
	ldr	r0, [r10, #4]
	cmp	r0, #0
	beq	.L2715
	ldr	ip, [r10, #8]
	cmp	ip, #0
	bne	.L2746
.L2715:
	mov	r1, #1
	str	r1, [r2, #40]
	ldr	r1, [r10, #16]
	ldr	r0, [r4, #244]
	bl	SM_ReleaseStreamSeg
.L2742:
	ldr	r0, [r4, #2316]
.L2711:
	ldr	r0, [r0, #40]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
.L2741:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2745:
	ldr	r2, [r2, #908]
	cmp	r2, #0
	bne	.L2742
	b	.L2712
.L2746:
	mov	ip, r1, asl #5
	mov	r5, #0
	sub	r1, ip, r1, asl #2
	add	r2, r2, r1
	str	r0, [r2, #44]
	ldr	r2, [r4, #2316]
	ldr	ip, [r10, #12]
	ldr	r0, [r2, #8]
	mov	r1, r0, asl #5
	sub	r1, r1, r0, asl #2
	add	r2, r2, r1
	str	ip, [r2, #48]
	ldr	r2, [r4, #2316]
	ldr	ip, [r10, #8]
	ldr	r0, [r2, #8]
	mov	r1, r0, asl #5
	sub	r1, r1, r0, asl #2
	add	r2, r2, r1
	str	ip, [r2, #52]
	ldr	r2, [r4, #2316]
	ldr	r0, [r10, #16]
	ldr	r1, [r2, #8]
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	str	r0, [r2, #68]
	ldr	r3, [r4, #2316]
	ldr	r1, [r3, #8]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r5, [r3, #60]
	ldr	r2, [r4, #2316]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	ldr	r0, [r4, #2316]
	cmp	r0, r5
	beq	.L2747
	ldr	r3, [r0, #48]
	cmp	r3, #4096
	bcs	.L2717
	ldr	r7, .L2748
	mov	r0, #7
	ldr	r1, .L2748+4
	ldr	r3, [r7, #68]
	blx	r3
	ldr	r3, [r4, #2316]
	ldr	r7, [r7, #52]
	ldr	r2, [r3, #48]
	ldr	r0, [r3, #72]
	ldr	r1, [r3, #44]
	rsb	r0, r2, r0
	blx	r7
	ldr	r3, [r4, #2316]
	mov	r0, #1
	ldr	r2, [r3, #96]
	ldr	r1, [r3, #68]
	str	r2, [r3, #68]
	ldr	r3, [r4, #2316]
	str	r5, [r3, #60]
	ldr	r3, [r4, #2316]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #72]
	rsb	r2, ip, r2
	str	r2, [r3, #44]
	ldr	r3, [r4, #2316]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #80]
	rsb	r2, ip, r2
	str	r2, [r3, #52]
	ldr	r3, [r4, #2316]
	ldr	r2, [r3, #48]
	ldr	ip, [r3, #76]
	add	r2, r2, ip
	str	r2, [r3, #48]
	ldr	r3, [r4, #2316]
	str	r0, [r3, #8]
	ldr	r0, [r4, #244]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #2316]
	str	r5, [r3, #72]
	ldr	r3, [r4, #2316]
	str	r5, [r3, #88]
	ldr	r3, [r4, #2316]
	str	r5, [r3, #76]
	ldr	r0, [r4, #2316]
.L2717:
	mov	r3, #1
	str	r3, [r6, #2816]
	b	.L2711
.L2744:
	ldr	r2, [r1, #12]
	cmp	r2, #0
	ble	.L2704
	ldr	r2, [r1, #4]
	cmp	r2, #0
	beq	.L2704
	ldr	r2, [r1, #8]
	cmp	r2, #0
	beq	.L2704
	ldr	r8, [r0, #160]
	ldr	r2, [r0, #140]
	cmp	r8, #0
	blt	.L2705
	add	r9, r8, #1
	add	r3, r0, #53248
	mov	r0, r2
	str	r3, [fp, #-48]
	mov	r1, r9
	mov	r6, r3
	bl	__aeabi_uidivmod
	ldr	r6, [r6, #3252]
	mov	r7, #100
	mov	r2, r1
	mla	r1, r7, r1, r6
	ldr	r1, [r1, #36]
	cmp	r1, #0
	bne	.L2708
	b	.L2706
.L2709:
	bl	__aeabi_uidivmod
	mov	r2, r1
	mla	r1, r7, r1, r6
	ldr	r1, [r1, #36]
	cmp	r1, #0
	beq	.L2706
.L2708:
	add	r5, r5, #1
	mov	r1, r9
	cmp	r5, r8
	add	r0, r2, r5
	ble	.L2709
.L2705:
	str	r2, [r4, #140]
.L2718:
	ldr	r3, .L2748
	mov	r0, #0
	ldr	r1, .L2748+8
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L2741
.L2706:
	cmp	r9, r2
	str	r2, [r4, #140]
	bls	.L2718
	mov	r1, #100
	cmn	r2, #1
	mul	r2, r1, r2
	mov	ip, #1
	add	r6, r6, r2
	str	ip, [r6, #36]
	beq	.L2718
	ldr	r3, [fp, #-48]
	mov	r0, #0
	ldr	r1, [r3, #3252]
	add	r2, r1, r2
	str	r2, [r4, #2316]
	ldr	r1, [r10, #4]
	str	r1, [r2, #44]
	ldr	r2, [r4, #2316]
	ldr	r1, [r10, #12]
	str	r1, [r2, #48]
	ldr	r2, [r4, #2316]
	ldr	r1, [r10, #16]
	str	r1, [r2, #68]
	ldr	r2, [r4, #2316]
	ldr	r1, [r10, #8]
	str	r1, [r2, #52]
	ldr	r2, [r4, #2316]
	str	r0, [r2, #60]
	ldr	r2, [r4, #2316]
	str	ip, [r2, #8]
	ldr	r2, [r4, #2316]
	strb	r0, [r2, #1]
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldr	r3, [r4, #2316]
	str	r2, [r3, #40]
	ldr	r0, [r4, #2316]
	b	.L2711
.L2713:
	ldr	r3, .L2748
	mov	r0, #1
	ldr	r1, .L2748+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2741
.L2743:
	ldr	ip, .L2748
	movw	r3, #10940
	ldr	r2, .L2748+16
	mov	r0, #1
	ldr	r1, .L2748+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2741
.L2704:
	ldr	r3, .L2748
	mov	r0, #1
	ldr	r1, .L2748+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L2741
.L2747:
	ldr	r3, .L2748
	ldr	r1, .L2748+28
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [r4, #2316]
	b	.L2717
.L2749:
	.align	2
.L2748:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC240
	.word	.LC236
	.word	.LC238
	.word	.LANCHOR0+1352
	.word	.LC36
	.word	.LC237
	.word	.LC239
	UNWIND(.fnend)
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
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
	cmp	r1, #0
	cmpne	r0, #0
	moveq	r2, #1
	movne	r2, #0
	beq	.L2752
	strb	r2, [r1, #1]
	ldr	r1, [r1, #32]
	ldr	r0, [r0, #244]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
.L2752:
	ldr	ip, .L2753
	movw	r3, #11478
	ldr	r2, .L2753+4
	mov	r0, #1
	ldr	r1, .L2753+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L2754:
	.align	2
.L2753:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1372
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_UnMarkFrameStoreRef, .-HEVC_UnMarkFrameStoreRef
	.align	2
	.global	HEVC_FlushDPB
	.type	HEVC_FlushDPB, %function
HEVC_FlushDPB:
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
	subs	r4, r0, #0
	beq	.L2756
	ldr	r2, [r4, #2492]
	cmp	r2, #0
	addne	r6, r4, #2496
	movne	r5, #0
	addne	r6, r6, #12
	bne	.L2761
	b	.L2758
.L2760:
	cmp	r2, r5
	bls	.L2758
.L2761:
	ldr	r1, [r6, #4]!
	add	r5, r5, #1
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2760
	mov	r0, r4
	bl	HEVC_UnMarkFrameStoreRef
	ldr	r2, [r4, #2492]
	cmp	r2, r5
	bhi	.L2761
.L2758:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L2763
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2758
	b	.L2763
.L2764:
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	beq	.L2759
.L2763:
	ldr	r3, [r4, #2492]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L2764
	mov	r0, r3
.L2759:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2756:
	ldr	ip, .L2772
	movw	r3, #11439
	ldr	r2, .L2772+4
	mov	r0, #1
	ldr	r1, .L2772+8
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2759
.L2773:
	.align	2
.L2772:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1400
	.word	.LC36
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
	subs	r4, r0, #0
	beq	.L2781
	bl	HEVC_FlushDPB
	subs	r3, r0, #0
	bne	.L2782
.L2777:
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2782:
	ldr	ip, .L2783
	mov	r0, #0
	ldr	r2, .L2783+4
	ldr	r1, .L2783+8
	ldr	r5, [ip, #68]
	blx	r5
	b	.L2777
.L2781:
	ldr	ip, .L2783
	movw	r3, #11343
	ldr	r2, .L2783+4
	mov	r0, #1
	ldr	r1, .L2783+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2784:
	.align	2
.L2783:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1416
	.word	.LC241
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_ClearDPB, .-HEVC_ClearDPB
	.align	2
	.global	HEVC_DecVDM
	.type	HEVC_DecVDM, %function
HEVC_DecVDM:
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
	cmp	r0, #0
	mov	r7, r0
	ldr	r3, [r0, #172]
	beq	.L2853
	cmp	r3, #2
	bls	.L2854
	ldr	r3, [r0, #264]
	add	r10, r0, #40960
	ldr	r2, [r0, #268]
	movw	r1, #2024
	add	r3, r3, #1
	ldr	lr, [r0, #2308]
	cmp	r3, r2
	add	ip, r7, #45056
	movw	r0, #15788
	str	ip, [fp, #-56]
	movlt	r3, r2
	str	r3, [r7, #264]
	str	r3, [lr, #600]
	mov	r4, ip
	ldr	r3, [r7, #268]
	mov	ip, #1
	ldr	r2, [r7, #264]
	rsb	r2, r3, r2
	str	r2, [lr, #604]
	ldr	r2, [r10, #2652]
	ldr	lr, [r7, #2304]
	ldr	r3, [r7, #2300]
	mla	r1, r1, r2, lr
	ldr	lr, [r4, #1768]
	ldr	r2, [r4, #1764]
	add	r2, lr, r2
	ldr	lr, [r4, #1772]
	ldr	r1, [r1, #32]
	cmp	r2, lr
	mla	r3, r0, r1, r3
	ldr	r9, [r3, #128]
	mov	r9, ip, asl r9
	bcs	.L2815
	add	r4, r2, #11712
	ldr	r3, [r10, #2024]
	add	r4, r4, #23
	str	r7, [fp, #-64]
	mov	r5, r2
	str	r2, [fp, #-60]
	add	r4, r7, r4, lsl #2
	mov	r8, lr
	mov	r7, r3
	str	r10, [fp, #-68]
	b	.L2792
.L2856:
	cmp	r5, r8
	bcs	.L2855
.L2792:
	ldr	r6, [r4, #4]!
	mov	r1, r9
	mov	r0, r7
	mov	r10, r7
	ldr	ip, [r4, #-1884]
	cmp	ip, #0
	bne	.L2791
	bl	__aeabi_idivmod
	mov	r0, r6
	mov	r10, r1
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r6, r1
.L2791:
	cmp	r10, r6
	add	r5, r5, #1
	bne	.L2856
	ldr	r2, [fp, #-60]
	mov	r3, #1
	ldr	r7, [fp, #-64]
	ldr	r10, [fp, #-68]
.L2790:
	cmp	r2, #0
	beq	.L2793
	ldr	r1, [fp, #-56]
	ldr	r4, [r10, #2624]
	ldr	lr, [r10, #2024]
	ldr	r1, [r1, #1820]
	add	r1, r4, r1
	cmp	lr, r1
	beq	.L2819
	add	ip, r7, #46848
	mov	r0, #0
	add	ip, ip, #28
	b	.L2794
.L2795:
	ldr	r1, [ip, #4]!
	add	r1, r4, r1
	cmp	r1, lr
	beq	.L2819
.L2794:
	add	r0, r0, #1
	cmp	r2, r0
	bne	.L2795
.L2793:
	strb	r3, [r10, #2016]
	ldr	r4, [r7, #232]
	ldr	r2, [r7, #248]
	ubfx	r4, r4, #16, #3
	cmp	r4, r2
	beq	.L2796
	sub	r1, r2, #2
	cmp	r1, #1
	movhi	r1, #0
	movls	r1, #1
	cmp	r4, #2
	moveq	r1, #0
	cmp	r1, #0
	beq	.L2796
	cmp	r4, #4
	cmpne	r4, #1
	bls	.L2857
.L2796:
	cmp	r4, #2
	str	r4, [r7, #248]
	beq	.L2798
	cmp	r4, #3
	beq	.L2799
	cmp	r4, #1
	beq	.L2858
	ldr	r2, [r7, #216]
	cmp	r2, #0
	beq	.L2850
	cmp	r4, #4
	beq	.L2859
.L2803:
	ldr	r2, [r10, #2028]
.L2804:
	cmp	r2, #2
	beq	.L2860
	cmp	r2, #1
	streqb	r2, [r7, #3]
.L2809:
	ldr	r5, .L2862
	mov	r0, #2
	ldr	r2, [r7, #220]
	ldr	r1, .L2862+4
	ldr	r3, [r5, #68]
	sub	r2, r2, #1
	blx	r3
	ldr	r4, [r7, #208]
	cmp	r4, #0
	beq	.L2861
	ldr	r1, [r10, #2044]
	add	r3, r7, #49152
	add	r0, r7, #53248
	clz	r2, r1
	mov	r2, r2, lsr #5
	str	r2, [r3, #3520]
	ldr	r2, [r10, #2048]
	str	r2, [r3, #3512]
	str	r4, [r0, #524]
	ldr	r3, [r7, #220]
	cmp	r3, #0
	beq	.L2849
	add	r3, r7, #51200
	add	r1, r1, #1
	add	r3, r3, #156
	str	r3, [r7, #2312]
	ldr	r3, [r10, #2060]
	str	r3, [r0, #3240]
	ldr	r3, [r10, #2064]
	str	r3, [r0, #3244]
	ldr	ip, [r10, #2028]
	str	r1, [r10, #2044]
	cmp	ip, #0
	bne	.L2849
	ldr	r1, [r0, #528]
	cmp	r1, #0
	beq	.L2820
.L2814:
	ldr	r3, [r1]
	ldr	r2, [r1, #4]
	ldr	r1, [r1, #1356]
	add	r3, r3, r2
	add	r3, r3, #7
	cmp	r1, #0
	add	ip, ip, r3, lsr #3
	bne	.L2814
.L2813:
	ldr	r3, .L2862+8
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2849
	sub	r2, fp, #44
	ldr	r0, [r7, #244]
	mov	r3, #4
	mov	r1, #20
	str	ip, [r2, #-4]!
	blx	r4
.L2849:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2854:
	bl	HEVC_ClearCurrPic
	ldr	r3, [r7, #224]
	mov	r0, #0
	cmp	r3, #524288
	ldr	r3, .L2862
	bls	.L2789
	ldr	r1, .L2862+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #7
.L2847:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2789:
	ldr	r1, .L2862+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2819:
	mov	r3, #1
	b	.L2793
.L2855:
	ldr	r2, [fp, #-60]
	mov	r3, #0
	ldr	r7, [fp, #-64]
	ldr	r10, [fp, #-68]
	b	.L2790
.L2858:
	ldr	r1, [r10, #2028]
	eor	r2, r3, #1
	cmp	r1, #2
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r2, #0
	bne	.L2850
.L2801:
	ldr	r2, [r7, #216]
	cmp	r2, #0
	bne	.L2803
	b	.L2850
.L2857:
	ldr	ip, .L2862
	mov	r3, r4
	ldr	r1, .L2862+20
	mov	r0, #1
	ldr	r5, [ip, #68]
	blx	r5
	str	r4, [r7, #248]
.L2799:
	mov	r0, r7
	bl	HEVC_ClearCurrPic
	mov	r0, r7
	bl	HEVC_ClearDPB
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2798:
	ldr	r2, [r10, #2028]
	cmp	r2, #0
	beq	.L2801
	b	.L2850
.L2860:
	ldrb	r2, [r7, #3]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L2809
	ldr	r2, [r7, #2308]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	bne	.L2809
	ldr	r2, .L2862+24
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2809
	ldr	ip, .L2862
	mov	r0, #1
	ldr	r2, [r10, #2024]
	ldr	r1, .L2862+28
	ldr	r4, [ip, #68]
	blx	r4
.L2850:
	mov	r0, r7
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L2847
.L2859:
	ldr	r2, [r10, #2028]
	cmp	r2, #0
	moveq	r3, #2
	streqb	r3, [r7, #3]
	beq	.L2809
	b	.L2804
.L2815:
	mov	r3, #0
	b	.L2790
.L2820:
	mov	ip, r1
	b	.L2813
.L2861:
	mov	r0, r7
	bl	HEVC_ClearCurrPic
	ldr	r3, [r5, #68]
	mov	r0, r4
	ldr	r2, .L2862+32
	ldr	r1, .L2862+36
	blx	r3
	mvn	r0, #0
	b	.L2847
.L2853:
	ldr	ip, .L2862
	movw	r3, #6800
	ldr	r2, .L2862+32
	mov	r0, #1
	ldr	r1, .L2862+40
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2847
.L2863:
	.align	2
.L2862:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC246
	.word	g_event_report
	.word	.LC242
	.word	.LC243
	.word	.LC244
	.word	g_allow_B_before_P
	.word	.LC245
	.word	.LANCHOR0+1432
	.word	.LC247
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecVDM, .-HEVC_DecVDM
	.align	2
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
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
	cmp	r2, #0
	cmpne	r0, #0
	mov	r8, r1
	mov	r5, r0
	moveq	r4, #1
	movne	r4, #0
	mov	r6, r2
	beq	.L2886
	cmp	r1, #16
	bhi	.L2887
	ldr	r3, [r2, #52]
	add	r7, r0, r1, lsl #2
	mov	r1, #1
	mov	r2, r1
	str	r3, [r7, #2512]
	str	r1, [r3, #4]
	ldr	r3, [r7, #2512]
	ldr	r0, [r0, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r0, [r7, #2512]
	mov	r2, #504
	adds	r3, r3, #0
	add	r1, r6, #56
	movne	r3, #1
	strb	r3, [r0, #1]
	ldr	r3, [r7, #2512]
	ldr	r0, [r6, #36]
	str	r0, [r3, #24]
	ldr	r0, [r7, #2512]
	add	r0, r0, #72
	bl	memcpy
	ldr	r0, [r7, #2512]
	ldr	ip, [r6, #40]
	add	r1, r8, #1
	ldr	r3, .L2889
	mov	r2, #4
	str	ip, [r0, #40]
	str	ip, [r0, #20]
	add	r0, r5, #2512
	ldr	ip, [r7, #2512]
	ldr	lr, [r6, #52]
	str	lr, [ip, #68]
	ldr	ip, [r7, #2512]
	ldr	lr, [r6, #12]
	str	lr, [ip, #44]
	str	lr, [ip, #16]
	ldr	ip, [r7, #2512]
	ldr	lr, [r6, #8]
	str	lr, [ip, #12]
	ldr	ip, [r7, #2512]
	ldr	lr, [r6, #8]
	str	lr, [ip, #36]
	bl	qsort
	ldr	r3, [r5, #2492]
	add	r3, r3, #1
	str	r3, [r5, #2492]
	ldr	r7, [r6, #52]
	cmp	r7, #0
	beq	.L2868
	ldr	r1, [r5, #2784]
	cmp	r1, #0
	beq	.L2884
	ldr	r3, [r5, #2792]
	cmp	r3, #0
	addne	r3, r5, #2784
	addne	r3, r3, #8
	bne	.L2872
	b	.L2888
.L2875:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L2870
.L2872:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L2875
.L2884:
	ldr	r4, .L2889+4
.L2869:
	mvn	r3, #6
	ldr	r2, .L2889+8
	ldr	r1, .L2889+12
	mov	r0, #0
	ldr	r4, [r4, #68]
	blx	r4
	mov	r0, r5
	bl	HEVC_PrintDPBState
	mov	r0, r5
	bl	HEVC_ClearDPB
	mvn	r0, #6
.L2881:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2888:
	mov	r4, r3
.L2870:
	ldr	r1, [r7, #32]
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	subs	r1, r0, #0
	beq	.L2873
	ldr	r3, [r1, #520]
	cmp	r3, #0
	beq	.L2873
	add	r2, r5, r4, lsl #2
	mov	r0, #1
	ldr	ip, .L2889+4
	mov	r3, r4
	str	r0, [r2, #2792]
	mov	r0, #13
	ldr	r1, [r1, #520]
	ldr	r8, [ip, #68]
	ldr	ip, [r1, #4]
	ldr	r1, .L2889+16
	str	ip, [r2, #2856]
	ldr	ip, [r7, #12]
	str	ip, [r2, #2920]
	ldr	r2, [r5, #2788]
	add	r2, r2, #1
	str	r2, [r5, #2788]
	ldr	r2, [r7, #268]
	blx	r8
	mov	r3, #0
	str	r4, [r7, #28]
	mov	r0, r3
	strb	r3, [r6, #1]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2887:
	ldr	ip, .L2889+4
	mov	r3, r1
	mov	r0, r4
	ldr	r2, .L2889+8
	ldr	r1, .L2889+20
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, r5
	bl	HEVC_ClearDPB
	mvn	r0, #0
	b	.L2881
.L2886:
	ldr	ip, .L2889+4
	movw	r3, #8861
	ldr	r2, .L2889+8
	mov	r0, #1
	ldr	r1, .L2889+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L2881
.L2873:
	ldrb	ip, [r7, #1]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r4, .L2889+4
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #12]
	ldr	r6, [r4, #68]
	str	r1, [sp, #4]
	str	ip, [sp]
	str	r0, [sp, #8]
	ldr	r1, .L2889+28
	blx	r6
	b	.L2869
.L2868:
	ldr	r4, .L2889+4
	mov	r0, r7
	movw	r3, #8817
	ldr	r2, .L2889+32
	ldr	r1, .L2889+36
	ldr	r6, [r4, #68]
	blx	r6
	b	.L2869
.L2890:
	.align	2
.L2889:
	.word	compare_pic_by_poc_asc
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1444
	.word	.LC251
	.word	.LC249
	.word	.LC248
	.word	.LC36
	.word	.LC250
	.word	.LC219
	.word	.LC220
	UNWIND(.fnend)
	.size	HEVC_InsertFrmInDPB, .-HEVC_InsertFrmInDPB
	.align	2
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 560
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #560)
	sub	sp, sp, #560
	mov	r4, r0
	add	r0, r0, #57088
	mov	r5, r1
	add	r0, r0, #224
	mov	r6, #0
.L2896:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	bne	.L2892
	cmp	r0, #0
	beq	.L2913
	ldr	ip, [r4, #2492]
	cmp	ip, #0
	beq	.L2913
	ldr	r2, [r4, #2512]
	cmp	r0, r2
	beq	.L2892
	add	r2, r4, #2512
	b	.L2894
.L2895:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	beq	.L2892
.L2894:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L2895
.L2913:
	mov	r8, #584
	mov	r7, r0
	mla	r8, r8, r6, r4
	mov	r2, #504
	sub	r0, fp, #540
	mov	r9, #1
	mov	r3, #101
	str	r5, [fp, #-588]
	add	r1, r8, #57344
	str	r3, [fp, #-556]
	add	r1, r1, #40
	strb	r9, [fp, #-595]
	strb	r9, [fp, #-596]
	bl	memcpy
	add	r3, r8, #57088
	cmp	r6, #19
	movw	r1, #57320
	movw	r2, #57312
	mov	r6, #0
	strb	r9, [r3, #226]
	str	r7, [fp, #-544]
	str	r6, [r8, r1]
	str	r6, [fp, #-340]
	strb	r9, [r8, r2]
	bgt	.L2897
	ldr	r0, [r4, #2492]
	cmp	r0, #0
	beq	.L2899
	add	r1, r4, #2496
	mov	ip, r6
	add	r1, r1, #12
	mvn	r2, #-2147483648
	mov	r8, r1
.L2902:
	ldr	lr, [r8, #4]!
	add	ip, ip, #1
	ldr	r3, [lr, #12]
	rsb	r3, r5, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bge	.L2901
	ldrb	lr, [lr, #1]	@ zero_extendqisi2
	cmp	lr, #0
	movne	r2, r3
	movne	r6, #1
.L2901:
	cmp	ip, r0
	bne	.L2902
	cmp	r6, #0
	beq	.L2899
	mov	r6, #0
	b	.L2903
.L2904:
	add	r6, r6, #1
	cmp	r6, r0
	beq	.L2934
.L2903:
	ldr	ip, [r1, #4]!
	ldr	r3, [ip, #12]
	rsb	r3, r5, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bne	.L2904
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2904
	ldr	r1, [ip, #32]
	add	r6, r6, #628
	ldr	r0, [r4, #244]
	bl	FSP_GetLogicFs
	ldr	r9, .L2937
	ldr	r2, [r4, r6, asl #2]
	mov	r3, r5
	ldr	r1, .L2937+4
	ldr	r6, [r9, #68]
	ldr	r2, [r2, #12]
	mov	r7, r0
	mov	r0, #1
	blx	r6
	cmp	r7, #0
	beq	.L2905
	ldr	r0, [r7, #520]
	cmp	r0, #0
	beq	.L2935
	mov	r1, #0
	ldr	r0, [r4, #244]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r4, #244]
	bl	FSP_GetLogicFs
	mvn	r2, r8
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r3, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L2908
	ldr	r1, [fp, #-544]
	sub	r2, fp, #596
	mov	r0, r4
	str	r8, [r1, #32]
	ldr	r1, [r7, #520]
	str	r1, [r3, #520]
	ldr	r1, [r7, #524]
	str	r1, [r3, #524]
	ldr	r1, [r7, #528]
	str	r1, [r3, #528]
	ldrsb	r3, [r7, #4]
	ldr	r1, [r4, #2492]
	str	r3, [fp, #-560]
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L2936
	ldr	r0, [r4, #244]
	mov	r1, r8
	mov	r2, r6
	bl	FSP_SetDisplay
	ldr	r3, [r4, #200]
	mov	r0, r6
	cmn	r3, #-2147483647
	streq	r5, [r4, #200]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2892:
	add	r6, r6, #1
	add	r0, r0, #584
	cmp	r6, #20
	bne	.L2896
.L2897:
	ldr	r3, .L2937
	mov	r0, #0
	ldr	r1, .L2937+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
.L2929:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2934:
	ldr	r9, .L2937
.L2905:
	ldr	r3, [r9, #68]
	mov	r0, #0
	ldr	r1, .L2937+12
	blx	r3
	mvn	r0, #3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2908:
	ldr	r3, [fp, #-544]
	mov	r0, r2
	ldr	r1, .L2937+16
	strb	r2, [r3]
	ldr	r3, [r9, #68]
	blx	r3
	mvn	r0, #3
	b	.L2929
.L2936:
	ldr	r3, [fp, #-544]
	mov	r1, r8
	mov	r5, #0
	mov	r2, #1
	strb	r5, [r3]
	ldr	r0, [r4, #244]
	bl	FSP_ClearLogicFs
	mov	r0, r5
	ldr	r3, [r9, #68]
	ldr	r1, .L2937+20
	blx	r3
	mvn	r0, #0
	b	.L2929
.L2899:
	ldr	r2, .L2937
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r7]
	ldr	r1, .L2937+24
	ldr	r3, [r2, #68]
	blx	r3
	mvn	r0, #0
	b	.L2929
.L2935:
	ldr	r3, [r9, #68]
	ldr	r1, .L2937+28
	blx	r3
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #3
	b	.L2929
.L2938:
	.align	2
.L2937:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC255
	.word	.LC252
	.word	.LC253
	.word	.LC257
	.word	.LC258
	.word	.LC254
	.word	.LC256
	UNWIND(.fnend)
	.size	HEVC_CreateLostPicture, .-HEVC_CreateLostPicture
	.align	2
	.global	HEVC_DecSlice
	.type	HEVC_DecSlice, %function
HEVC_DecSlice:
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
	subs	r3, r0, #0
	str	r3, [fp, #-64]
	beq	.L3114
	ldr	r0, [fp, #-64]
	add	r10, r0, #40960
	ldr	r2, [r0, #2316]
	ldr	r3, [r2, #16]
	sub	r1, r3, #16
	str	r3, [r10, #2648]
	cmp	r1, #4
	ldr	r2, [r2, #32]
	str	r2, [r10, #2644]
	bls	.L2942
	ldr	r1, [r10, #2028]
	ldr	r2, [r0, #2308]
	cmp	r1, #0
	beq	.L3115
.L2943:
	cmp	r3, #21
	beq	.L3116
.L2945:
	ldr	r3, [fp, #-64]
	ldrb	r4, [r3, #1]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L3117
.L2946:
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #208]
	ldr	r3, [r3, #144]
	cmp	r2, r3
	bcs	.L3118
	ldr	r3, [fp, #-64]
	add	r3, r3, #45056
	str	r3, [fp, #-88]
	ldr	r3, [r3, #68]
	cmp	r3, #1
	beq	.L3119
.L2949:
	ldrb	r3, [r10, #2017]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3120
	ldr	r3, [r10, #2648]
	sub	r2, r3, #16
	cmp	r2, #5
	bls	.L2987
	ldr	r3, [r10, #2020]
	sub	r3, r3, #16
	cmp	r3, #5
	bls	.L2989
	ldr	r3, [r10, #2636]
	cmp	r3, #1
	beq	.L2990
	cmp	r3, #2
	beq	.L2991
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r10, #2028]
.L2989:
	ldr	r0, [fp, #-64]
	bl	HEVC_CalcStreamBits
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #68]
	cmp	r3, #2
	beq	.L2993
	ldrb	r3, [r10, #2579]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2994
	ldr	r0, [fp, #-64]
	bl	HEVC_DecList
	subs	r2, r0, #0
	bne	.L3121
	ldr	r3, [r10, #2736]
	cmp	r3, #0
	beq	.L2994
	ldr	r1, [fp, #-64]
	ldr	r4, [r1, #2320]
	cmp	r4, #0
	beq	.L2997
	ldr	r1, [r4, #32]
	cmp	r1, #0
	beq	.L3122
	ldr	r3, [fp, #-64]
	mov	r4, r2
	add	r5, r3, #2320
	mov	r6, r3
	b	.L3002
.L3003:
	ldr	r3, [r0, #520]
	cmp	r3, #0
	beq	.L3004
	ldr	r3, [r10, #2736]
	add	r4, r4, #1
	cmp	r3, r4
	bls	.L3123
	ldr	r2, [r5, #4]!
	cmp	r2, #0
	beq	.L2997
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L2998
.L3002:
	ldr	r1, [r1, #32]
	ldr	r0, [r6, #244]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L3003
.L3004:
	mov	ip, r0
	ldr	r0, [fp, #-64]
	add	r3, r4, #580
	ldr	r5, .L3136
	mov	r2, r4
	ldr	r1, .L3136+4
	ldr	r3, [r0, r3, asl #2]
	mov	r0, #1
	ldr	r4, [r5, #68]
	ldr	r3, [r3, #32]
	str	ip, [sp]
	blx	r4
.L3001:
	ldr	r0, [fp, #-64]
	bl	HEVC_PrintDPBState
	ldr	r3, [r5, #68]
	ldr	r1, .L3136+8
	mov	r0, #1
	blx	r3
.L3108:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3115:
	ldr	r1, [r2, #708]
	cmp	r1, #1
	bne	.L2943
	ldr	r1, [r2, #704]
	cmp	r1, #0
	bne	.L2943
	ldr	r1, [r2, #712]
	cmp	r1, #0
	bne	.L2943
	ldr	r2, [r2, #684]
	add	r2, r2, #1024
	cmp	r2, #2048
	bls	.L2943
.L2942:
	ldr	r0, [fp, #-64]
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L3109
	ldr	r3, [r10, #2648]
	cmp	r3, #21
	bne	.L2945
.L3116:
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #204]
	ldr	r3, [r3, #252]
	cmp	r2, r3
	bcs	.L2945
	ldr	r0, [fp, #-64]
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	beq	.L2945
.L3109:
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r2, .L3136+12
	ldr	r1, .L3136+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L2987:
	str	r3, [r10, #2020]
	mov	r3, #0
	str	r3, [r10, #2028]
	b	.L2989
.L2994:
	ldr	r0, [fp, #-64]
	bl	HEVC_WriteSliceMsg
	cmp	r0, #0
	bne	.L3124
.L3015:
	ldr	r2, [r10, #2652]
	mov	r1, #1
	ldr	ip, [fp, #-64]
	mov	r0, #0
	add	r3, ip, #4096
	str	r2, [ip, #272]
	ldr	r2, [r10, #2624]
	str	r1, [ip, #168]
	str	r2, [ip, #252]
	ldr	r2, [r3, #404]
	str	r2, [r10, #2060]
	ldr	r3, [r3, #408]
	str	r3, [r10, #2064]
.L3098:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3119:
	ldr	r1, [fp, #-64]
	ldr	r2, [r1, #2308]
	ldr	r3, [r1, #220]
	add	r3, r3, #1
	str	r3, [r1, #220]
	ldr	r3, [r2, #8]
	cmp	r3, #2
	beq	.L2950
	ldr	r3, [r2, #12]
	cmp	r3, #2
	beq	.L3125
	ldr	r4, [fp, #-64]
	add	r3, r4, #46848
	mov	r0, r4
	mov	r5, r3
	bl	HEVC_RemoveDummyFrame
	mov	r0, r4
	bl	HEVC_ApplyReferencePictureSet
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	add	r3, r5, #28
	str	r3, [fp, #-100]
	add	r3, r5, #9
	str	r3, [fp, #-104]
.L2952:
	ldr	r3, [r10, #2648]
	sub	r3, r3, #19
	cmp	r3, #2
	bls	.L2954
	ldr	lr, [fp, #-64]
	movw	ip, #2024
	ldr	r3, [r10, #2652]
	movw	r0, #15788
	ldr	r4, [fp, #-88]
	ldr	r1, [lr, #2304]
	ldr	r2, [lr, #2300]
	mla	r1, ip, r3, r1
	ldr	ip, [r4, #1768]
	ldr	r3, [r4, #1764]
	add	r3, ip, r3
	str	r3, [fp, #-92]
	ldr	r1, [r1, #32]
	mov	ip, r3
	ldr	r3, [r4, #1772]
	mla	r2, r0, r1, r2
	mov	r1, #1
	cmp	ip, r3
	ldr	r2, [r2, #128]
	mov	r2, r1, asl r2
	mov	r4, r2
	bcs	.L2955
	add	r9, ip, #11712
	add	r2, ip, #46848
	add	r9, r9, #24
	add	r2, r2, #9
	ldr	r6, [lr, #2492]
	add	r3, r3, #46848
	add	r9, lr, r9, lsl #2
	mov	r1, r2
	add	r3, r3, #9
	str	r2, [fp, #-96]
	str	r10, [fp, #-84]
	mov	r2, #0
	mov	r10, r4
	add	r3, lr, r3
	mov	r0, r2
	str	r3, [fp, #-72]
	str	r2, [fp, #-76]
	add	r3, lr, r1
	str	r0, [fp, #-80]
	str	r3, [fp, #-68]
.L2956:
	cmp	r6, #0
	beq	.L2962
	ldr	r8, [r9, #-1884]
	mov	r3, #0
	ldr	r2, [fp, #-64]
	mov	r5, r3
	str	r3, [fp, #-60]
	mov	r3, r6
	add	r4, r2, #2512
	mov	r6, r8
	mov	r8, r3
	b	.L2959
.L3127:
	ldr	r3, [r4]
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L2958
	ldr	r0, [r3, #12]
	ldr	r1, [r9]
	cmp	r0, r1
	ldreqb	r3, [r3, #1]	@ zero_extendqisi2
	beq	.L3106
.L2958:
	add	r5, r5, #1
	add	r4, r4, #4
	cmp	r5, r8
	beq	.L3126
.L2959:
	cmp	r6, #0
	bne	.L3127
	ldr	r7, [r4]
	mov	r1, r10
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L2958
	ldr	r0, [r7, #12]
	bl	__aeabi_idivmod
	ldr	r0, [r9]
	str	r1, [fp, #-56]
	mov	r1, r10
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-56]
	cmp	r3, r1
	bne	.L2958
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
.L3106:
	cmp	r3, #0
	add	r5, r5, #1
	ldr	r3, [fp, #-60]
	add	r4, r4, #4
	movne	r3, #1
	cmp	r5, r8
	str	r3, [fp, #-60]
	bne	.L2959
.L3126:
	ldr	r3, [fp, #-60]
	mov	r6, r8
	cmp	r3, #0
	beq	.L2962
.L2960:
	ldr	r3, [fp, #-68]
	add	r9, r9, #4
	ldr	r2, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-68]
	cmp	r3, r2
	bne	.L2956
	ldr	r3, [fp, #-92]
	ldr	r10, [fp, #-84]
	cmp	r3, #0
	beq	.L2963
.L3017:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-96]
	ldr	lr, [fp, #-100]
	ldr	r5, [fp, #-104]
	add	r7, r3, r2
	ldr	r1, [fp, #-80]
	mov	r8, r3
	ldr	r9, [fp, #-76]
.L2964:
	cmp	r6, #0
	beq	.L2968
	add	ip, r8, #2496
	mov	r4, #0
	add	ip, ip, #12
	mov	r3, r4
	str	r1, [fp, #-56]
	b	.L2966
.L2965:
	cmp	r3, r6
	beq	.L3128
.L2966:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldr	r0, [r2, #52]
	cmp	r0, #0
	bne	.L2965
	ldr	r1, [lr]
	ldr	r0, [r10, #2624]
	add	r0, r0, r1
	ldr	r1, [r2, #12]
	cmp	r1, r0
	bne	.L2965
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #1
	cmp	r3, r6
	bne	.L2966
.L3128:
	cmp	r4, #0
	ldr	r1, [fp, #-56]
	beq	.L2968
.L2967:
	add	r5, r5, #1
	add	lr, lr, #4
	cmp	r5, r7
	bne	.L2964
	str	r1, [fp, #-80]
	str	r9, [fp, #-76]
.L2963:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	beq	.L2954
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r2, [fp, #-76]
	ldr	r1, .L3136+20
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [fp, #-64]
	ldr	r1, .L3136
	ldr	r3, [r3, #2308]
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L3129
	ldr	r1, [fp, #-76]
	ldr	r0, [fp, #-64]
	bl	HEVC_CreateLostPicture
	cmp	r0, #0
	beq	.L2952
	ldr	r0, [fp, #-64]
	bl	HEVC_RemoveDummyFrame
	b	.L3108
.L3117:
	ldr	r3, [r3, #2492]
	cmp	r3, #0
	beq	.L2946
	ldr	r0, [fp, #-64]
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L2946
	ldr	r3, .L3136
	mov	r0, r4
	ldr	r2, .L3136+12
	ldr	r1, .L3136+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L2979:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r2, .L3136+28
	ldr	r1, .L3136+32
	blx	r3
.L2976:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r2, .L3136+36
	ldr	r1, .L3136+40
	blx	r3
.L2982:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r2, .L3136+44
	ldr	r1, .L3136+48
	blx	r3
	ldr	r4, [fp, #-64]
	mov	r0, r4
	bl	HEVC_PrintDPBState
	mov	r0, r4
	bl	HEVC_ClearDPB
.L2950:
	ldr	r0, [fp, #-64]
	bl	HEVC_InitPic
	cmn	r0, #2
	beq	.L3098
	cmp	r0, #0
	bne	.L3130
	ldr	r4, [fp, #-64]
	mov	r0, r4
	bl	HEVC_SetScalingList
	mov	r0, r4
	bl	HEVC_WritePicMsg
	cmp	r0, #0
	beq	.L2949
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r1, .L3136+52
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L3125:
	mov	r4, r1
	mov	r0, r1
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	b	.L2950
.L2968:
	ldr	r3, [r10, #2624]
	ldr	r0, [lr]
	ldr	r2, [r8, #200]
	add	r3, r3, r0
	cmp	r3, r2
	blt	.L2967
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r9, r3
	movne	r1, #1
	b	.L2967
.L2962:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-64]
	ldr	r1, [r9, #-68]
	ldr	r3, [r3, #2624]
	ldr	r2, [r2, #200]
	add	r3, r3, r1
	cmp	r3, r2
	blt	.L2960
	ldr	r2, [fp, #-68]
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [fp, #-76]
	movne	r2, r3
	ldr	r3, [fp, #-80]
	str	r2, [fp, #-76]
	movne	r3, #1
	str	r3, [fp, #-80]
	b	.L2960
.L2954:
	ldr	r7, [fp, #-64]
	ldr	r5, .L3136
	add	r4, r7, #2480
	mov	r0, r7
	add	r4, r4, #8
	bl	HEVC_UpdateReflist
	mov	r0, r7
	bl	HEVC_UpdateLTReflist
	b	.L2971
.L2973:
	str	lr, [sp]
	ldr	r8, [r5, #68]
	blx	r8
	mov	r1, r4
	ldr	r0, [r7, #244]
	bl	HEVC_IncreaseDPBSize.isra.28
	cmp	r0, #0
	bne	.L3131
.L2971:
	ldr	ip, [r7, #2492]
	mov	r0, #13
	ldr	lr, [r7, #2488]
	ldr	r2, .L3136+44
	cmp	ip, lr
	ldr	r1, .L3136+56
	ldr	r6, .L3136
	mov	r3, ip
	bcs	.L2973
.L2972:
	ldr	r7, .L3136
	mov	r3, ip
	ldr	r6, [fp, #-64]
.L2981:
	cmp	r3, lr
	bcc	.L2950
	str	lr, [sp]
	mov	r0, #1
	ldr	r4, [r7, #68]
	ldr	r2, .L3136+44
	ldr	r1, .L3136+60
	blx	r4
	ldr	r3, [r6, #2492]
	ldr	r5, .L3136
	cmp	r3, #16
	bhi	.L2974
	cmp	r3, #0
	beq	.L2979
	add	r9, r6, #2496
	mvn	r8, #0
	add	r9, r9, #12
	mvn	r0, #-2147483648
	mov	r4, #0
	b	.L2978
.L2977:
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L3132
.L2978:
	ldr	r2, [r9, #4]!
	ldr	r1, [r2, #12]
	cmp	r1, r0
	bge	.L2977
	ldr	r2, [r2]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	bne	.L2977
	ldr	r3, [r7, #112]
	mov	r8, r4
	blx	r3
	ldr	r3, [r6, #2492]
	ldr	r2, [r9]
	add	r4, r4, #1
	cmp	r4, r3
	ldr	r0, [r2, #12]
	bcc	.L2978
.L3132:
	cmn	r8, #1
	beq	.L2979
	str	r0, [sp]
	mov	r3, r8
	ldr	r2, .L3136+28
	mov	r0, #1
	ldr	r1, .L3136+64
	ldr	r4, [r7, #68]
	blx	r4
	mov	r1, r8
	mov	r0, r6
	bl	HEVC_OutputOneFrmFromDPB
	ldr	r3, .L3136
	cmp	r0, #0
	bne	.L2980
	ldr	r3, [r6, #2492]
	ldr	lr, [r6, #2488]
	b	.L2981
.L3123:
	cmp	r3, #0
	beq	.L2994
	ldr	r2, [r10, #2740]
	cmp	r2, #0
	beq	.L2994
	ldr	r2, [fp, #-64]
	ldr	r4, [r2, #2388]
	cmp	r4, #0
	beq	.L3007
	ldr	r2, [r4, #32]
	cmp	r2, #0
	beq	.L3133
	ldr	r3, [fp, #-64]
	mov	r4, #0
	add	r5, r3, #2384
	add	r5, r5, #4
	mov	r6, r3
	b	.L3011
.L3012:
	ldr	r2, [r0, #520]
	cmp	r2, #0
	beq	.L3013
	ldr	r3, [r10, #2740]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L2994
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	beq	.L3134
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L3135
.L3011:
	ldr	r1, [r2, #32]
	ldr	r0, [r6, #244]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L3012
.L3013:
	ldr	r5, .L3136
	mov	r3, r0
	mov	r2, r4
	ldr	r1, .L3136+68
	mov	r0, #1
	ldr	r4, [r5, #68]
	blx	r4
	b	.L3001
.L2991:
	ldr	r3, [r10, #2028]
	sub	r3, r3, #1
	cmp	r3, #1
	bls	.L2989
	mov	r3, #0
.L3107:
	str	r3, [r10, #2028]
	b	.L2989
.L2990:
	ldr	r2, [r10, #2028]
	cmp	r2, #2
	bne	.L3107
	b	.L2989
.L2993:
	ldr	r0, [fp, #-64]
	bl	HEVC_ClearCurrNal
	b	.L3015
.L2955:
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	beq	.L2954
	ldr	r3, [fp, #-92]
	ldr	r2, [fp, #-64]
	add	r3, r3, #46848
	add	r3, r3, #9
	str	r3, [fp, #-96]
	ldr	r6, [r2, #2492]
	mov	r3, #0
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
	b	.L3017
.L3129:
	ldr	r0, [fp, #-76]
	ldr	r3, [r10, #2624]
	str	r0, [sp]
	mov	r0, #1
	ldr	r4, [r1, #68]
	ldr	r1, .L3136+72
	blx	r4
	b	.L3108
.L3122:
	mov	r4, r1
.L2998:
	ldr	r5, .L3136
	mov	r2, r4
	ldr	r1, .L3136+76
	mov	r0, #1
	ldr	r4, [r5, #68]
	blx	r4
	b	.L3001
.L3120:
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r1, .L3136+80
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L2997:
	ldr	r5, .L3136
	mov	r2, r4
	ldr	r1, .L3136+84
	mov	r0, #1
	ldr	r4, [r5, #68]
	blx	r4
	b	.L3001
.L3131:
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r2, .L3136+44
	ldr	r1, .L3136+88
	blx	r3
	ldr	r3, [fp, #-64]
	ldr	ip, [r3, #2492]
	ldr	lr, [r3, #2488]
	b	.L2972
.L2980:
	ldr	r3, [r3, #68]
	mov	r0, #1
	ldr	r2, .L3136+36
	ldr	r1, .L3136+48
	blx	r3
	b	.L2982
.L2974:
	ldr	r4, [r5, #68]
	mov	r0, #1
	ldr	r2, .L3136+28
	ldr	r1, .L3136+92
	blx	r4
	b	.L2976
.L3134:
	ldr	r3, [r10, #2736]
.L3007:
	ldr	r5, .L3136
	mov	r2, r4
	ldr	r1, .L3136+96
	mov	r0, #1
	ldr	r4, [r5, #68]
	blx	r4
	b	.L3001
.L3124:
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r1, .L3136+100
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L3121:
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r1, .L3136+104
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L3130:
	ldr	r3, .L3136
	mov	r0, #1
	ldr	r1, .L3136+108
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3098
.L3118:
	ldr	r5, .L3136
	mov	r0, #0
	ldr	r1, .L3136+112
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r0, [fp, #-64]
	ldr	r3, [r0, #208]
	ldr	r2, [r0, #144]
	cmp	r3, r2
	bcc	.L2948
	ldr	r1, .L3136+116
	ldr	r4, [r1]
	cmp	r4, #0
	beq	.L2948
	str	r3, [fp, #-52]
	mov	r1, #108
	str	r2, [fp, #-48]
	mov	r3, #8
	sub	r2, fp, #52
	ldr	r0, [r0, #244]
	blx	r4
.L2948:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L3136+120
	blx	r3
	ldr	r0, [fp, #-64]
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3098
.L3135:
	ldr	r3, [r10, #2736]
.L3008:
	ldr	r5, .L3136
	mov	r2, r4
	ldr	r1, .L3136+124
	mov	r0, #1
	ldr	r4, [r5, #68]
	blx	r4
	b	.L3001
.L3133:
	mov	r4, r2
	b	.L3008
.L3114:
	ldr	ip, .L3136
	movw	r3, #4280
	ldr	r2, .L3136+12
	mov	r0, #1
	ldr	r1, .L3136+128
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3098
.L3137:
	.align	2
.L3136:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC278
	.word	.LC284
	.word	.LANCHOR0+1464
	.word	.LC259
	.word	.LC264
	.word	.LC260
	.word	.LANCHOR0+1504
	.word	.LC268
	.word	.LANCHOR0+1532
	.word	.LC283
	.word	.LANCHOR0+1480
	.word	.LC271
	.word	.LC273
	.word	.LC265
	.word	.LC267
	.word	.LC270
	.word	.LC281
	.word	.LC263
	.word	.LC277
	.word	.LC274
	.word	.LC276
	.word	.LC266
	.word	.LC269
	.word	.LC279
	.word	.LC282
	.word	.LC275
	.word	.LC272
	.word	.LC261
	.word	g_event_report
	.word	.LC262
	.word	.LC280
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_DecSlice, .-HEVC_DecSlice
	.align	2
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
	ldr	ip, [r0, #2316]
	mov	r4, r0
	ldr	r3, [ip, #8]
	cmp	r3, #0
	ldrne	r1, [r0, #224]
	movne	r2, ip
	movne	r3, #0
	beq	.L3143
.L3142:
	ldr	r0, [r2, #48]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, r0
	str	r1, [r4, #224]
	ldr	r0, [ip, #8]
	cmp	r0, r3
	bhi	.L3142
.L3143:
	mov	r3, #0
	strb	r3, [ip, #1]
	ldr	r3, [r4, #2316]
	ldr	r2, [r3, #16]
	sub	r2, r2, #36
	cmp	r2, #1
	bls	.L3244
.L3141:
	ldr	r2, [r3, #4]
	add	r2, r2, #16
	str	r2, [r3, #4]
	ldr	r3, [r4, #2316]
	ldr	r2, [r3, #16]
	cmp	r2, #49
	ldrls	pc, [pc, r2, asl #2]
	b	.L3144
.L3146:
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3145
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3147
	.word	.L3148
	.word	.L3149
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3150
	.word	.L3150
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3144
	.word	.L3151
	.word	.L3152
.L3244:
	mov	r2, #1
	strb	r2, [r4]
	b	.L3141
.L3152:
	add	r5, r4, #2448
	mov	r1, #32
	add	r5, r5, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r6, r3
	bne	.L3164
	ldr	r6, .L3246
	mov	r3, #1
	strb	r3, [r4, #6]
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L3163
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	r5
.L3163:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3164
.L3242:
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L3231
.L3233:
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	r5
.L3231:
	mvn	r0, #0
.L3154:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3145:
	mov	r0, r4
	bl	HEVC_DecSlice
	cmn	r0, #2
	beq	.L3154
	cmp	r0, #0
	bne	.L3245
.L3235:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3147:
	mov	r0, r4
	bl	HEVC_DecVPS
	mov	r5, r0
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	cmp	r5, #0
	beq	.L3235
	ldr	r3, .L3246+4
	mov	r0, #1
	ldr	r6, .L3246
	ldr	r1, .L3246+8
	b	.L3240
.L3148:
	mov	r0, r4
	bl	HEVC_DecSPS
	mov	r5, r0
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	cmp	r5, #0
	beq	.L3235
	ldr	r3, .L3246+4
	mov	r0, #1
	ldr	r6, .L3246
	ldr	r1, .L3246+12
	b	.L3240
.L3149:
	mov	r0, r4
	bl	HEVC_DecPPS
	mov	r5, r0
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	cmp	r5, #0
	beq	.L3235
	ldr	r3, .L3246+4
	mov	r0, #1
	ldr	r6, .L3246
	ldr	r1, .L3246+16
.L3240:
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3231
	sub	r2, fp, #28
	mvn	r5, #0
	mov	r3, #4
	mov	r1, #100
	str	r5, [r2, #-4]!
	ldr	r0, [r4, #244]
	blx	r7
	ldr	r6, [r6]
	cmp	r6, #0
	beq	.L3231
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	r6
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3150:
	mov	r0, r4
	bl	HEVC_DecSEI
	mov	r5, r0
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	cmp	r5, #0
	beq	.L3235
	ldr	r3, .L3246+4
	mov	r0, #1
	ldr	r1, .L3246+20
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, .L3246
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L3233
	b	.L3231
.L3151:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3160
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	add	r3, r4, #40960
	ldrb	r3, [r3, #2017]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3235
.L3160:
	add	r6, r4, #2448
	mov	r1, #32
	add	r6, r6, #8
	mov	r5, #0
	strb	r5, [r4, #5]
	mov	r0, r6
	bl	BsGet
	mov	r1, #32
	mov	r7, r0
	mov	r0, r6
	bl	BsGet
	ldr	r2, .L3246+24
	rev	lr, r7
	ldrb	r1, [r2, #1574]	@ zero_extendqisi2
	ldrb	r3, [r2, #1573]	@ zero_extendqisi2
	ldrb	r6, [r2, #1570]	@ zero_extendqisi2
	ldrb	ip, [r2, #1575]	@ zero_extendqisi2
	orr	r3, r3, r1, asl #8
	ldrb	r1, [r2, #1569]	@ zero_extendqisi2
	ldrb	r7, [r2, #1571]	@ zero_extendqisi2
	orr	r1, r1, r6, asl #8
	orr	ip, r3, ip, asl #16
	ldrb	r6, [r2, #1576]	@ zero_extendqisi2
	ldrb	r3, [r2, #1572]	@ zero_extendqisi2
	orr	r2, r1, r7, asl #16
	orr	r1, ip, r6, asl #24
	orr	r2, r2, r3, asl #24
	rev	r0, r0
	cmp	r0, r1
	cmpeq	lr, r2
	bne	.L3235
	ldr	r6, .L3246
	ldr	r7, [r6]
	cmp	r7, #0
	beq	.L3161
	mov	r3, r5
	mov	r2, r5
	mov	r1, #112
	ldr	r0, [r4, #244]
	blx	r7
.L3161:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	bne	.L3242
	b	.L3235
.L3144:
	ldr	r3, .L3246+4
	mov	r0, #22
	ldr	r1, .L3246+28
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r3, [r4, #2316]
	ldr	r3, [r3, #16]
	cmp	r3, #63
	bls	.L3164
	ldr	r6, .L3246
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L3165
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	r5
.L3165:
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L3235
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	r5
	b	.L3235
.L3164:
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	mov	r0, #0
	b	.L3154
.L3245:
	mov	r0, r4
	bl	HEVC_ClearCurrSlice
	ldr	r3, .L3246
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L3233
	b	.L3231
.L3247:
	.align	2
.L3246:
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC285
	.word	.LC286
	.word	.LC287
	.word	.LC288
	.word	.LANCHOR0
	.word	.LC289
	UNWIND(.fnend)
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
	.align	2
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r3, #0
	cmpne	r0, #0
	mov	r4, r0
	beq	.L3337
	ldr	r3, [fp, #8]
	cmp	r3, #0
	bne	.L3338
	ldr	r3, [fp, #4]
	add	r5, r0, #40960
	cmp	r3, #0
	str	r1, [r5, #2056]
	beq	.L3252
	ldr	r3, .L3358
	ldr	r3, [r3, #52]
	cmp	r3, #3
	beq	.L3339
	cmp	r3, #1
	beq	.L3252
.L3254:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	ldrb	r3, [r5, #2017]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3340
	ldr	r3, [r4, #2308]
	ldr	r2, [r5, #2056]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L3341
	ldr	r3, [r4, #2312]
	ldr	r2, [r5, #2068]
	add	r3, r3, #4096
	ldr	r3, [r3, #1036]
	str	r3, [r2, #576]
	ldr	r3, [r4, #2312]
	ldr	r2, [r5, #2068]
	add	r3, r3, #4096
	ldr	r3, [r3, #1040]
	str	r3, [r2, #580]
	ldr	r3, [r4, #248]
	cmp	r3, #2
	beq	.L3342
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	beq	.L3343
	cmp	r3, #1
	beq	.L3344
	cmp	r3, #0
	beq	.L3289
	ldr	r7, .L3358+4
.L3290:
	mov	r0, r4
	mvn	r6, #0
	bl	HEVC_ClearCurrPic
	ldr	r3, [r7, #68]
	ldr	r2, .L3358+8
	mov	r0, #1
	ldr	r1, .L3358+12
	blx	r3
	mov	r3, #0
	strb	r3, [r5, #2017]
.L3286:
	ldr	r3, [r7, #68]
	mov	r2, r6
	ldr	r1, .L3358+16
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3338:
	ldr	ip, .L3358+4
	movw	r3, #11035
.L3336:
	ldr	r2, .L3358+20
	mov	r0, #1
	ldr	r1, .L3358+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
.L3333:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3337:
	ldr	ip, .L3358+4
	movw	r3, #11034
	b	.L3336
.L3252:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	b	.L3254
.L3344:
	ldr	r1, [r4, #2492]
	ldr	r3, [r4, #2488]
	cmp	r1, r3
	bcs	.L3345
.L3272:
	add	r2, r4, #42752
	mov	r0, r4
	add	r2, r2, #224
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L3346
	ldr	r1, [r5, #2068]
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	beq	.L3347
	cmn	r0, #3
	beq	.L3277
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3348
.L3277:
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L3284
.L3289:
	add	r6, r4, #49152
	ldr	r3, [r6, #2200]
	cmp	r3, #1
	beq	.L3278
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3349
	ldr	r2, [r5, #2068]
	mov	r3, #1
	mov	r1, #2
	str	r1, [r2, #8]
	str	r3, [r6, #2200]
	ldr	r2, [r5, #2024]
	str	r2, [r4, #212]
	ldr	r2, [r5, #2068]
	strb	r3, [r2, #2]
.L3278:
	ldr	r1, [r4, #2492]
	ldr	r3, [r4, #2488]
	cmp	r1, r3
	bcs	.L3350
.L3281:
	add	r2, r4, #42752
	mov	r0, r4
	add	r2, r2, #224
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L3351
	ldr	r3, [r4, #2492]
	cmp	r3, #0
	bne	.L3352
.L3284:
	mov	r6, #0
.L3285:
	cmp	r6, #0
	mov	r3, #0
	strb	r3, [r5, #2017]
	beq	.L3287
	ldr	r7, .L3358+4
	b	.L3286
.L3340:
	ldr	r3, .L3358+4
	mov	r0, #1
	ldr	r2, .L3358+8
	ldr	r1, .L3358+28
	ldr	r3, [r3, #68]
	blx	r3
.L3287:
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #168]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3339:
	bl	HEVC_ClearAllSlice
	ldr	r0, [fp, #8]
	b	.L3333
.L3341:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, [r4, #2308]
	ldr	r1, .L3358+4
	mov	r0, #1
	ldr	r2, [r5, #2056]
	ldr	r3, [r3, #4]
	ldr	r5, [r1, #68]
	ldr	r1, .L3358+32
	blx	r5
	b	.L3287
.L3342:
	ldr	r8, [r5, #2068]
	mov	r9, #0
	mov	ip, #1
	add	r1, r5, #2064
	add	r1, r1, #8
	mov	r2, #504
	strb	ip, [r8, #2]
	add	r0, r8, #72
	str	r3, [r8, #4]
	strb	r9, [r8, #1]
	ldr	r3, [r5, #2028]
	ldr	r7, .L3358+4
	str	r3, [r8, #16]
	ldr	r3, [r5, #2056]
	str	r3, [r8, #20]
	bl	memcpy
	str	r9, [r8, #48]
	ldr	r3, [r5, #2056]
	mov	r2, r9
	ldr	r1, [r8, #32]
	str	r3, [r8, #40]
	ldr	r0, [r4, #244]
	bl	FSP_SetRef
	mov	r1, r8
	mov	r0, r4
	bl	HEVC_OutputFrmToVO
	str	r9, [r8, #4]
	mov	r2, #560
	ldr	r3, [r7, #48]
	mov	r1, r9
	mov	r6, r0
	add	r0, r4, #42752
	add	r0, r0, #224
	blx	r3
	ldr	r3, [r5, #2052]
	ldr	r2, [r4, #180]
	cmp	r3, r2
	addne	r3, r3, #524
	addne	r3, r4, r3, lsl #2
	strne	r9, [r3, #4]
	strne	r2, [r5, #2052]
	cmp	r6, #0
	bne	.L3353
.L3260:
	ldr	r8, [r7, #68]
	movw	r3, #8584
	mov	r2, r6
	ldr	r1, .L3358+36
	mov	r0, #14
	blx	r8
.L3261:
	cmn	r6, #1
	bne	.L3285
	b	.L3290
.L3343:
	ldrb	r2, [r5, #2016]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r2, [r5, #2068]
	streq	r3, [r2, #4]
	bne	.L3354
.L3267:
	ldr	r3, [r5, #2068]
	mov	r2, #1
	mov	r0, r4
	strb	r2, [r3, #2]
	ldr	r1, [r5, #2068]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r6, r0
	beq	.L3355
	cmn	r0, #3
	beq	.L3270
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3356
.L3270:
	ldr	r7, .L3358+4
	mov	r6, #0
.L3288:
	ldr	r8, [r7, #68]
	movw	r3, #8599
	mov	r2, r6
	ldr	r1, .L3358+36
	mov	r0, #14
	blx	r8
	b	.L3261
.L3352:
	mov	r0, r4
	bl	HEVC_OutputFrmFromDPB
	cmp	r0, #0
	beq	.L3284
	ldr	r7, .L3358+4
	mov	r0, #1
	ldr	r2, .L3358+40
	ldr	r1, .L3358+44
	ldr	r3, [r7, #68]
	blx	r3
.L3280:
	ldr	r3, [r7, #68]
	mov	r0, #0
	ldr	r2, .L3358+8
	ldr	r1, .L3358+48
	blx	r3
	b	.L3290
.L3350:
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3335
	ldr	r7, .L3358+4
	mov	r0, #0
	ldr	r1, .L3358+52
	ldr	r3, [r7, #68]
	blx	r3
.L3335:
	ldr	r1, [r4, #2492]
	b	.L3281
.L3353:
	ldr	r3, [r7, #68]
	mov	r0, #0
	ldr	r2, .L3358+8
	ldr	r1, .L3358+56
	blx	r3
	b	.L3260
.L3354:
	ldr	r1, [r4, #2492]
	ldr	r3, [r4, #2488]
	cmp	r1, r3
	bcc	.L3264
	cmp	r3, #15
	bhi	.L3266
	add	r1, r4, #2480
	ldr	r0, [r4, #244]
	add	r1, r1, #8
	bl	HEVC_IncreaseDPBSize.isra.28
	cmp	r0, #0
	beq	.L3357
.L3266:
	ldr	r1, [r4, #2512]
	mov	r0, r4
	bl	HEVC_UnMarkFrameStoreRef
	mov	r1, #0
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	mov	r1, #0
	mov	r0, r4
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r1, [r4, #2492]
.L3264:
	add	r2, r4, #42752
	mov	r0, r4
	add	r2, r2, #224
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	beq	.L3267
	ldr	r7, .L3358+4
	movw	r3, #8303
	str	r0, [sp]
	mov	r0, #0
	ldr	r2, .L3358+60
	mvn	r6, #6
	ldr	r8, [r7, #68]
	ldr	r1, .L3358+64
	blx	r8
.L3268:
	ldr	r3, [r7, #68]
	mov	r0, #0
	ldr	r2, .L3358+8
	ldr	r1, .L3358+68
	blx	r3
	b	.L3288
.L3345:
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3334
	ldr	r7, .L3358+4
	mov	r0, #0
	ldr	r2, .L3358+72
	ldr	r1, .L3358+76
	ldr	r3, [r7, #68]
	blx	r3
.L3334:
	ldr	r1, [r4, #2492]
	b	.L3272
.L3349:
	ldr	r7, .L3358+4
	mov	r0, #1
	ldr	r2, .L3358+80
	ldr	r1, .L3358+84
	ldr	r3, [r7, #68]
	blx	r3
	ldr	r3, [r7, #68]
	ldr	r2, .L3358+40
	mov	r0, #0
	ldr	r1, .L3358+88
	blx	r3
	b	.L3280
.L3357:
	ldr	r1, [r4, #2492]
	b	.L3264
.L3346:
	ldr	r7, .L3358+4
	mov	r0, #0
	ldr	r2, .L3358+72
	ldr	r1, .L3358+92
	ldr	r3, [r7, #68]
	blx	r3
.L3275:
	ldr	r3, [r7, #68]
	mov	r0, #0
	ldr	r2, .L3358+8
	ldr	r1, .L3358+96
	blx	r3
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L3290
	b	.L3289
.L3351:
	ldr	r7, .L3358+4
	mov	r2, r0
	ldr	r1, .L3358+100
	mov	r0, #0
	ldr	r3, [r7, #68]
	blx	r3
	b	.L3280
.L3356:
	ldr	r7, .L3358+4
	mov	r0, #0
	ldr	r2, .L3358+60
	mvn	r6, #0
	ldr	r1, .L3358+84
	ldr	r3, [r7, #68]
	blx	r3
	b	.L3268
.L3348:
	ldr	r7, .L3358+4
	mov	r0, r6
	ldr	r2, .L3358+72
	ldr	r1, .L3358+84
	ldr	r3, [r7, #68]
	blx	r3
	b	.L3275
.L3347:
	ldr	r7, .L3358+4
	mov	r0, r6
	ldr	r2, .L3358+72
	ldr	r1, .L3358+104
	ldr	r3, [r7, #68]
	blx	r3
	b	.L3275
.L3355:
	ldr	r7, .L3358+4
	mov	r0, #0
	ldr	r2, .L3358+60
	ldr	r1, .L3358+104
	ldr	r3, [r7, #68]
	blx	r3
	b	.L3268
.L3359:
	.align	2
.L3358:
	.word	g_VdmDrvParam
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1608
	.word	.LC303
	.word	.LC304
	.word	.LANCHOR0+1588
	.word	.LC36
	.word	.LC290
	.word	.LC291
	.word	.LC293
	.word	.LANCHOR0+1700
	.word	.LC302
	.word	.LC307
	.word	.LC300
	.word	.LC292
	.word	.LANCHOR0+1628
	.word	.LC294
	.word	.LC305
	.word	.LANCHOR0+1652
	.word	.LC297
	.word	.LANCHOR0+1676
	.word	.LC296
	.word	.LC299
	.word	.LC298
	.word	.LC306
	.word	.LC301
	.word	.LC295
	UNWIND(.fnend)
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	2
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
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
	subs	r8, r0, #0
	mov	r3, #0
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	beq	.L3401
	ldr	r3, [r8, #176]
	cmp	r3, #0
	beq	.L3364
	add	r3, r8, #40960
	ldrb	r3, [r3, #2017]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3364
	add	r7, r8, #57088
	add	lr, r8, #68608
	add	r7, r7, #224
	add	lr, lr, #384
	mov	r2, r7
.L3372:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L3365
	cmp	r2, #0
	beq	.L3366
	ldr	ip, [r8, #2492]
	cmp	ip, #0
	beq	.L3366
	ldr	r1, [r8, #2512]
	cmp	r1, r2
	beq	.L3365
	add	r1, r8, #2512
	b	.L3367
.L3368:
	ldr	r0, [r1, #4]!
	cmp	r0, r2
	beq	.L3365
.L3367:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L3368
.L3366:
	ldr	r0, [r8, #244]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L3364
	cmn	r0, #1
	beq	.L3402
	add	r0, r8, #50944
	add	r0, r0, #56
	bl	IsVoQueueEmpty
	cmp	r0, #1
	beq	.L3403
.L3399:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3364:
	mov	r0, #1
.L3395:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3365:
	add	r2, r2, #584
	cmp	r2, lr
	bne	.L3372
	ldr	r9, .L3404
	add	r0, r8, #50944
	add	r0, r0, #56
	sub	r2, fp, #48
	sub	r1, fp, #52
	bl	GetQueueImgNum
	ldr	r3, [r9, #68]
	ldr	r1, .L3404+4
	mov	r0, #1
	blx	r3
	ldr	r3, [r8, #176]
	cmp	r3, #0
	movne	r10, #0
	movne	r6, r9
	beq	.L3377
.L3373:
	ldrb	ip, [r7, #2]	@ zero_extendqisi2
	mov	r3, r7
	mov	r2, r10
	ldr	r1, .L3404+8
	mov	r0, #1
	add	r5, r7, #280
	str	ip, [sp, #8]
	mov	r4, #0
	ldrb	ip, [r7, #1]	@ zero_extendqisi2
	str	ip, [sp, #4]
	ldr	ip, [r7, #4]
	str	ip, [sp]
	ldr	ip, [r9, #68]
	blx	ip
.L3376:
	mov	r2, r4
	ldr	r3, [r5, #4]!
	add	r4, r4, #1
	ldr	r1, .L3404+12
	mov	r0, #1
	ldr	ip, [r9, #68]
	blx	ip
	cmp	r4, #4
	bne	.L3376
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r1, .L3404+16
	add	r10, r10, r0
	blx	r3
	ldr	r3, [r8, #176]
	add	r7, r7, #584
	cmp	r10, r3
	bcc	.L3373
.L3377:
	ldr	r3, [r9, #68]
	mov	r0, #1
	ldr	r1, .L3404+20
	blx	r3
	ldr	r3, [r9, #68]
	ldr	r1, .L3404+24
	mov	r0, #0
	blx	r3
	mov	r0, r8
	bl	HEVC_PrintDPBState
	ldr	r2, [r8, #176]
	ldr	r0, [r8, #2492]
	ldr	r3, [fp, #-52]
	sub	r2, r2, #2
	ldr	r1, [fp, #-48]
	rsb	r2, r0, r2
	ldr	ip, .L3404
	add	r0, r3, r1
	cmp	r0, r2
	bge	.L3399
	str	r1, [sp]
	mov	r0, #0
	ldr	r4, [ip, #68]
	ldr	r2, .L3404+28
	ldr	r1, .L3404+32
	blx	r4
	mov	r0, r8
	mov	r1, #1
	bl	HEVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3402:
	add	r1, r8, #50944
	ldr	r0, [r8, #244]
	add	r1, r1, #56
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	b	.L3395
.L3403:
	ldr	r4, .L3404
	mov	r0, #0
	ldr	r1, .L3404+36
	ldr	r3, [r4, #68]
	blx	r3
	mov	r0, r8
	bl	HEVC_PrintDPBState
	mov	r0, r8
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r8
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3371
	ldr	r3, [r4, #68]
	mov	r0, #0
	ldr	r1, .L3404+40
	blx	r3
	mov	r0, r8
	bl	HEVC_ClearDPB
	mov	r0, #0
	b	.L3395
.L3401:
	ldr	ip, .L3404
	movw	r3, #11086
	ldr	r2, .L3404+28
	mov	r0, #1
	ldr	r1, .L3404+44
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, r8
	b	.L3395
.L3371:
	ldr	r4, [r4, #68]
	mov	r0, #0
	ldr	r3, [r8, #2488]
	ldr	r2, [r8, #2492]
	ldr	r1, .L3404+48
	blx	r4
	b	.L3399
.L3405:
	.align	2
.L3404:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC311
	.word	.LC314
	.word	.LC315
	.word	.LC8
	.word	.LC312
	.word	.LC313
	.word	.LANCHOR0+1724
	.word	.LC316
	.word	.LC308
	.word	.LC309
	.word	.LC36
	.word	.LC310
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageBuffer, .-HEVCDEC_GetImageBuffer
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r7, r1
	mov	r6, r2
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	r4, r0
	cmp	r3, #0
	bne	.L3430
	ldr	r8, .L3435
	add	r0, r0, #43520
	str	r3, [r2]
	mov	r1, r3
	str	r3, [r7]
	movw	r2, #3732
	ldr	r3, [r8, #48]
	add	r0, r0, #16
	blx	r3
	ldr	r3, [r4, #2316]
	add	r5, r4, #40960
	mov	r1, #1
	mov	r0, r4
	ldr	r2, [r3, #16]
	str	r2, [r5, #2648]
	ldr	r3, [r3, #32]
	str	r3, [r5, #2644]
	bl	HEVC_DecSliceSegmentHeader
	cmp	r0, #0
	bne	.L3431
	add	r2, r4, #45056
	movw	r1, #2024
	add	r0, r4, #24576
	movw	lr, #15788
	ldr	r2, [r2, #68]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	str	r2, [r7]
	ldr	r2, [r5, #2652]
	ldr	r5, [r4, #2304]
	ldr	ip, [r0, #2604]
	ldr	r3, [r4, #2300]
	mla	r1, r1, r2, r5
	ldr	r9, [ip, #72]
	ldr	r2, [ip, #236]
	ldr	r8, [ip, #76]
	ldr	r5, [r4, #2308]
	ldr	ip, [r1, #32]
	ldr	r7, [r5, #868]
	mla	r3, lr, ip, r3
	ldr	r1, [r3, #236]
	ldr	lr, [r3, #72]
	subs	r1, r1, r2
	ldr	ip, [r3, #76]
	movne	r1, #1
	cmp	r7, #1
	beq	.L3432
.L3410:
	cmp	lr, r9
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	ip, r8
	moveq	r3, r2
	orrne	r3, r2, #1
	cmp	r3, #0
	beq	.L3433
.L3412:
	mov	r3, #1
	str	r3, [r6]
.L3413:
	ldr	r3, [r4, #220]
	cmp	r3, #0
	beq	.L3429
	ldr	r3, .L3435+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L3429
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #120
	blx	r5
.L3429:
	mov	r0, #0
.L3408:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3431:
	ldr	r3, [r8, #68]
	mov	r0, #1
	ldr	r1, .L3435+8
	blx	r3
	ldr	r3, .L3435+4
	ldr	r5, [r3]
	cmp	r5, #0
	mvneq	r0, #0
	beq	.L3408
	sub	r2, fp, #36
	ldr	r0, [r4, #244]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #100
	str	r4, [r2, #-4]!
	blx	r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3432:
	ldr	r2, [r3, #108]
	ldr	r3, [r3, #100]
	cmp	r2, r3
	movcc	r2, r3
	str	r2, [r5, #912]
	ldr	r2, [r0, #2604]
	ldr	r0, [r4, #2308]
	ldr	r3, [r2, #108]
	ldr	r2, [r2, #100]
	ldr	r5, [r0, #912]
	cmp	r3, r2
	movcc	r3, r2
	cmp	r3, #8
	movls	r2, #0
	movhi	r2, #1
	cmp	r5, #8
	movne	r2, #0
	cmp	r2, #0
	beq	.L3434
.L3411:
	cmp	lr, r9
	moveq	r2, r1
	orrne	r2, r1, #1
	mov	r1, #1
	cmp	ip, r8
	moveq	r3, r2
	orrne	r3, r2, #1
	str	r1, [r0, #916]
	cmp	r3, #0
	str	r1, [r6]
	bne	.L3412
	b	.L3413
.L3433:
	ldr	r3, [r6]
	cmp	r3, #1
	bne	.L3429
	b	.L3413
.L3434:
	sub	r3, r3, #8
	cmp	r5, #8
	clz	r3, r3
	mov	r3, r3, lsr #5
	movle	r3, #0
	cmp	r3, #0
	beq	.L3410
	b	.L3411
.L3430:
	ldr	ip, .L3435
	movw	r3, #11497
	ldr	r2, .L3435+12
	mov	r0, #1
	ldr	r1, .L3435+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3408
.L3436:
	.align	2
.L3435:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LC317
	.word	.LANCHOR0+1748
	.word	.LC36
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
	subs	r4, r0, #0
	beq	.L3442
	ldr	r0, [r4, #208]
	cmp	r0, #0
	bne	.L3440
	add	r3, r4, #40960
	ldrb	r3, [r3, #2017]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3443
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3440:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3443:
	ldr	r3, .L3444
	ldr	r2, .L3444+4
	ldr	r1, .L3444+8
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3442:
	ldr	ip, .L3444
	movw	r3, #11567
	ldr	r2, .L3444+4
	mov	r0, #1
	ldr	r1, .L3444+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3445:
	.align	2
.L3444:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1776
	.word	.LC318
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVC_HaveSliceToDec, .-HEVC_HaveSliceToDec
	.align	2
	.global	HEVCDEC_DecodePacket
	.type	HEVCDEC_DecodePacket, %function
HEVCDEC_DecodePacket:
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
	subs	r4, r0, #0
	mov	ip, #0
	str	ip, [fp, #-48]
	str	ip, [fp, #-44]
	str	ip, [fp, #-40]
	beq	.L3484
	cmp	r1, #0
	beq	.L3485
	ldr	r2, [r4, #2308]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	r0, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r4, #232]
	ldr	r3, [r2]
	str	r3, [r4, #236]
	ldr	r3, [r2, #4]
	str	r3, [r4, #240]
	beq	.L3450
	ldr	r3, [r2, #868]
	cmp	r3, #1
	addne	r6, r4, #69632
	beq	.L3486
.L3451:
	mov	r0, r4
	bl	HEVC_ReceivePacket
	ldr	r3, [r4, #2316]
	str	r3, [r6, #2820]
	mov	r5, r0
.L3452:
	cmp	r5, #0
	mov	r3, #0
	strb	r3, [r4, #4]
	beq	.L3453
.L3465:
	mov	r0, #0
.L3448:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3486:
	ldr	r3, [r2, #908]
	add	r6, r4, #69632
	cmp	r3, #1
	bne	.L3451
	ldr	r3, [r6, #2816]
	cmp	r3, #1
	bne	.L3451
	ldr	r3, [r6, #2820]
	mov	r0, ip
	str	r3, [r4, #2316]
	str	ip, [r6, #2816]
	strb	ip, [r4, #4]
	b	.L3448
.L3453:
	ldr	r3, [r4, #2316]
	str	r5, [r3, #4]
	ldr	r3, [r4, #2316]
	ldr	r0, [r4, #2292]
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2292]
	bl	BsSkip
	mov	r1, #1
	ldr	r0, [r4, #2292]
	ldr	r6, [r4, #2316]
	bl	BsGet
	mov	r1, #6
	str	r0, [r6, #24]
	ldr	r0, [r4, #2292]
	ldr	r6, [r4, #2316]
	bl	BsGet
	mov	r1, #6
	str	r0, [r6, #16]
	ldr	r0, [r4, #2292]
	ldr	r6, [r4, #2316]
	bl	BsGet
	mov	r1, #3
	str	r0, [r6, #28]
	ldr	r0, [r4, #2292]
	ldr	r6, [r4, #2316]
	bl	BsGet
	sub	r0, r0, #1
	str	r0, [r6, #32]
	ldr	r6, [r4, #2316]
	ldr	r0, [r6, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r7, r0
	beq	.L3487
.L3454:
	mov	r3, #0
	str	r3, [r6, #4]
	ldr	r3, [r4, #2316]
	add	r0, r4, #2448
	add	r0, r0, #8
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2292]
	bl	BsSkip
	mov	r1, #1
	ldr	r0, [r4, #2292]
	ldr	r5, [r4, #2316]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #24]
	ldr	r0, [r4, #2292]
	ldr	r5, [r4, #2316]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #16]
	ldr	r0, [r4, #2292]
	ldr	r5, [r4, #2316]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #28]
	ldr	r0, [r4, #2292]
	ldr	r5, [r4, #2316]
	bl	BsGet
	sub	r0, r0, #1
	str	r0, [r5, #32]
.L3464:
	mov	r0, r4
	bl	HEVC_DecOneNal
	cmn	r0, #2
	beq	.L3448
	cmp	r0, #0
	beq	.L3465
	ldr	r3, .L3492
	mov	r0, #22
	ldr	r1, .L3492+4
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3448
.L3450:
	ldr	r3, [r4, #2316]
	cmp	r3, #0
	movne	r5, #0
	mvneq	r5, #0
	cmp	r3, #0
	bne	.L3452
	ldr	r3, .L3492
	mov	r0, ip
	ldr	r1, .L3492+8
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r5
	b	.L3448
.L3487:
	sub	r2, fp, #32
	sub	r1, fp, #36
	mov	r0, r4
	bl	HEVC_InquireSliceProperty
	cmp	r0, #0
	bne	.L3455
	ldr	r6, [fp, #-36]
	cmp	r6, #1
	beq	.L3488
.L3456:
	ldr	r5, [fp, #-32]
	cmp	r5, #1
	beq	.L3489
.L3457:
	ldr	r6, [r4, #2316]
	ldr	r0, [r6, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	beq	.L3464
	b	.L3454
.L3455:
	ldr	r3, .L3492
	mov	r0, r7
	ldr	r1, .L3492+12
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	HEVC_ClearCurrNal
	ldr	r3, .L3492+16
	ldr	r6, [r3]
	cmp	r6, #0
	mvneq	r0, #0
	beq	.L3448
	ldr	r0, [r4, #244]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	r6
	mvn	r0, #0
	b	.L3448
.L3489:
	add	r3, r4, #40960
	ldr	r3, [r3, #2648]
	sub	r3, r3, #16
	cmp	r3, #4
	bls	.L3490
.L3459:
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	cmp	r5, #1
	beq	.L3491
.L3462:
	ldr	r0, [r4, #244]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L3457
	sub	r3, fp, #40
	sub	r2, fp, #44
	sub	r1, fp, #48
	ldr	r0, [r4, #244]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #776]
	cmp	r3, #1
	bne	.L3457
	ldr	r2, [fp, #-44]
	ldr	r1, [fp, #-40]
	add	r2, r2, r1
	cmp	r2, #0
	strgtb	r3, [r4, #4]
	mvngt	r0, #1
	ble	.L3457
	b	.L3448
.L3488:
	mov	r0, r4
	bl	HEVC_HaveSliceToDec
	cmp	r0, #0
	bne	.L3456
	ldr	r3, [r4, #2316]
	add	r0, r4, #2448
	mov	r2, #21
	add	r0, r0, #8
	ldr	r1, .L3492+20
	str	r5, [r3, #4]
	bl	BsInit
	mov	r1, #40
	ldr	r0, [r4, #2292]
	bl	BsSkip
	ldr	r3, [r4, #2316]
	mov	r2, #48
	mov	r0, r4
	str	r2, [r3, #16]
	strb	r6, [r4, #5]
	bl	HEVC_DecOneNal
	ldr	r3, [r4, #256]
	strb	r6, [r4, #4]
	mvn	r0, #1
	add	r3, r3, #1
	str	r3, [r4, #256]
	b	.L3448
.L3490:
	mov	r0, r4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	beq	.L3459
	ldr	r3, .L3492
	mov	r0, r5
	ldr	r2, .L3492+24
	ldr	r1, .L3492+28
	ldr	r3, [r3, #68]
	blx	r3
	b	.L3459
.L3485:
	ldr	r3, .L3492
	mov	r0, r1
	ldr	r1, .L3492+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L3448
.L3484:
	ldr	ip, .L3492
	movw	r3, #1026
	ldr	r2, .L3492+24
	mov	r0, #1
	ldr	r1, .L3492+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3448
.L3491:
	mov	r0, r4
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L3462
	ldr	r3, .L3492
	mov	r0, r5
	ldr	r2, .L3492+24
	ldr	r1, .L3492+40
	ldr	r3, [r3, #68]
	blx	r3
	b	.L3462
.L3493:
	.align	2
.L3492:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC322
	.word	.LC320
	.word	.LC321
	.word	g_event_report
	.word	.LANCHOR0+1564
	.word	.LANCHOR0+1796
	.word	.LC259
	.word	.LC319
	.word	.LC36
	.word	.LC260
	UNWIND(.fnend)
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	2
	.global	HEVCDEC_GetRemainImg
	.type	HEVCDEC_GetRemainImg, %function
HEVCDEC_GetRemainImg:
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
	beq	.L3495
	ldr	r3, [r4, #2492]
	cmp	r3, #0
	beq	.L3507
	add	r7, r4, #50944
	ldr	r10, .L3519
	add	r7, r7, #56
	mvn	r6, #0
	b	.L3506
.L3498:
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	ldr	r1, [fp, #-52]
	mov	r0, r4
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r3, [r4, #2492]
	cmp	r3, #0
	beq	.L3515
.L3506:
	sub	r1, fp, #48
	sub	r2, fp, #52
	mov	r0, r4
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-52]
	add	r3, r1, #628
	ldr	r5, [r4, r3, asl #2]
	cmp	r5, #0
	beq	.L3498
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3498
	mov	r1, r5
	mov	r0, r4
	mov	r8, #1
	strb	r8, [r5, #2]
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r6, r0, #0
	beq	.L3516
.L3505:
	ldr	r1, [fp, #-52]
	b	.L3498
.L3515:
	cmp	r6, #0
	bne	.L3507
	mov	r0, r6
.L3497:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3516:
	mov	r2, r8
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L3517
	ldr	r3, [r4, #2492]
	mov	r2, r4
	mov	r1, #17
	cmp	r3, #1
	streq	r3, [r9, #244]
	mov	r3, r7
	ldr	r0, [r4, #244]
	str	r9, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	mov	r8, r0
	beq	.L3502
	mov	r3, r0
	ldr	r2, .L3519+4
	ldr	r1, .L3519+8
	mov	r0, #0
	ldr	ip, [r10, #68]
	mvn	r8, #0
	blx	ip
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r1, #1
	mov	r0, r4
	bl	HEVC_ClearAll
.L3502:
	ldr	r3, [r4, #2308]
	ldr	r3, [r3, #684]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r9, #84]
	bcs	.L3518
.L3504:
	ldr	r3, [r4, #2492]
	ldr	r2, [r4, #268]
	cmp	r3, #1
	ldr	r3, [r4, #260]
	add	r2, r2, #1
	str	r2, [r4, #268]
	add	r3, r3, #1
	str	r3, [r4, #260]
	beq	.L3505
	mov	r6, r8
	ldr	r1, [fp, #-52]
	b	.L3498
.L3507:
	add	r0, r4, #50944
	add	r0, r0, #56
	bl	GetVoLastImageID
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3518:
	add	r1, r9, #84
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.isra.11.part.12
	b	.L3504
.L3517:
	ldr	r1, .L3519+12
	mvn	r6, #0
	ldr	r3, [r10, #68]
	ldr	r2, .L3519+4
	blx	r3
	ldr	r1, [fp, #-52]
	b	.L3498
.L3495:
	ldr	ip, .L3519
	movw	r3, #11596
	ldr	r2, .L3519+4
	mov	r0, #1
	ldr	r1, .L3519+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L3497
.L3520:
	.align	2
.L3519:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1820
	.word	.LC324
	.word	.LC323
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVCDEC_GetRemainImg, .-HEVCDEC_GetRemainImg
	.align	2
	.global	HEVCDEC_GetImageWidth
	.type	HEVCDEC_GetImageWidth, %function
HEVCDEC_GetImageWidth:
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
	beq	.L3524
	add	r4, r4, #24576
	ldr	r3, [r4, #2604]
	ldr	r2, [r3, #152]
	ldr	r0, [r3, #72]
	rsb	r3, r2, #0
	add	r0, r2, r0
	sub	r0, r0, #1
	and	r0, r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3524:
	ldr	ip, .L3525
	movw	r3, #11671
	ldr	r2, .L3525+4
	mov	r0, #1
	ldr	r1, .L3525+8
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3526:
	.align	2
.L3525:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1844
	.word	.LC36
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L3530
	add	r4, r4, #24576
	ldr	r3, [r4, #2604]
	ldr	r2, [r3, #152]
	ldr	r0, [r3, #76]
	rsb	r3, r2, #0
	add	r0, r2, r0
	sub	r0, r0, #1
	and	r0, r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3530:
	ldr	ip, .L3531
	movw	r3, #11679
	ldr	r2, .L3531+4
	mov	r0, #1
	ldr	r1, .L3531+8
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3532:
	.align	2
.L3531:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1868
	.word	.LC36
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageHeight, .-HEVCDEC_GetImageHeight
	.global	g_IsDeced
	.global	g_TsToRsMap
	.global	g_hrd_parameters
	.global	s_TmpParam
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.13938, %object
	.size	__func__.13938, 14
__func__.13938:
	.ascii	"HEVC_IsNewPic\000"
	.space	2
	.type	__func__.13828, %object
	.size	__func__.13828, 21
__func__.13828:
	.ascii	"HEVC_IncreaseDPBSize\000"
	.space	3
	.type	__func__.14134, %object
	.size	__func__.14134, 17
__func__.14134:
	.ascii	"HEVC_CalcTileMap\000"
	.space	3
	.type	__func__.14153, %object
	.size	__func__.14153, 17
__func__.14153:
	.ascii	"HEVC_WritePicMsg\000"
	.space	3
	.type	__func__.13410, %object
	.size	__func__.13410, 18
__func__.13410:
	.ascii	"HEVC_CalcTileInfo\000"
	.space	2
	.type	__func__.14199, %object
	.size	__func__.14199, 19
__func__.14199:
	.ascii	"HEVC_WriteSliceMsg\000"
	.space	1
	.type	__func__.14383, %object
	.size	__func__.14383, 13
__func__.14383:
	.ascii	"HEVC_DecList\000"
	.space	3
	.type	__func__.14328, %object
	.size	__func__.14328, 16
__func__.14328:
	.ascii	"HEVC_RepairList\000"
	.type	__func__.14459, %object
	.size	__func__.14459, 20
__func__.14459:
	.ascii	"HEVC_RemoveApcStore\000"
	.type	__func__.14467, %object
	.size	__func__.14467, 26
__func__.14467:
	.ascii	"HEVC_RemoveUnusedApcStore\000"
	.space	2
	.type	__func__.14491, %object
	.size	__func__.14491, 30
__func__.14491:
	.ascii	"HEVC_ApplyReferencePictureSet\000"
	.space	2
	.type	__func__.14552, %object
	.size	__func__.14552, 19
__func__.14552:
	.ascii	"HEVC_UpdateReflist\000"
	.space	1
	.type	__func__.14584, %object
	.size	__func__.14584, 21
__func__.14584:
	.ascii	"HEVC_UpdateLTReflist\000"
	.space	3
	.type	__func__.14647, %object
	.size	__func__.14647, 21
__func__.14647:
	.ascii	"HEVC_DECRecycleImage\000"
	.space	3
	.type	__func__.14665, %object
	.size	__func__.14665, 21
__func__.14665:
	.ascii	"HEVC_CheckFrameStore\000"
	.space	3
	.type	__func__.14674, %object
	.size	__func__.14674, 18
__func__.14674:
	.ascii	"HEVC_GetImagePara\000"
	.space	2
	.type	__func__.14515, %object
	.size	__func__.14515, 19
__func__.14515:
	.ascii	"HEVC_OutputCurrPic\000"
	.space	1
	.type	__func__.14684, %object
	.size	__func__.14684, 21
__func__.14684:
	.ascii	"HEVC_AllocFrameStore\000"
	.space	3
	.type	__func__.14693, %object
	.size	__func__.14693, 27
__func__.14693:
	.ascii	"HEVC_GetBackPicFromVOQueue\000"
	.space	1
	.type	__func__.14721, %object
	.size	__func__.14721, 28
__func__.14721:
	.ascii	"HEVC_RemoveFrameStoreOutDPB\000"
	.type	__func__.14475, %object
	.size	__func__.14475, 22
__func__.14475:
	.ascii	"HEVC_RemoveDummyFrame\000"
	.space	2
	.type	__func__.14711, %object
	.size	__func__.14711, 28
__func__.14711:
	.ascii	"HEVC_RemoveUnUsedFrameStore\000"
	.type	__func__.14740, %object
	.size	__func__.14740, 20
__func__.14740:
	.ascii	"HEVC_CalcStreamBits\000"
	.type	__func__.14756, %object
	.size	__func__.14756, 20
__func__.14756:
	.ascii	"HEVC_VpsSpsPpsCheck\000"
	.type	__func__.14762, %object
	.size	__func__.14762, 23
__func__.14762:
	.ascii	"HEVC_ReadByteAlignment\000"
	.space	1
	.type	__func__.14773, %object
	.size	__func__.14773, 12
__func__.14773:
	.ascii	"HEVC_DecPTL\000"
	.type	quant8_inter_default, %object
	.size	quant8_inter_default, 64
quant8_inter_default:
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
	.type	__func__.14853, %object
	.size	__func__.14853, 27
__func__.14853:
	.ascii	"HEVC_SetDefaultScalingList\000"
	.space	1
	.type	quant_ts_default, %object
	.size	quant_ts_default, 16
quant_ts_default:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	__func__.14835, %object
	.size	__func__.14835, 20
__func__.14835:
	.ascii	"HEVC_SetScalingList\000"
	.type	__func__.14804, %object
	.size	__func__.14804, 24
__func__.14804:
	.ascii	"HEVC_DecScalingListData\000"
	.type	__func__.14881, %object
	.size	__func__.14881, 24
__func__.14881:
	.ascii	"HEVC_DecPredWeightTable\000"
	.type	__func__.14003, %object
	.size	__func__.14003, 27
__func__.14003:
	.ascii	"HEVC_DecSliceSegmentHeader\000"
	.space	1
.LC0:
	.word	1
	.word	2
	.word	2
	.word	1
.LC1:
	.word	1
	.word	2
	.word	1
	.word	1
	.type	__func__.14920, %object
	.size	__func__.14920, 17
__func__.14920:
	.ascii	"HEVC_DecVuiParam\000"
	.space	3
	.type	__func__.14944, %object
	.size	__func__.14944, 18
__func__.14944:
	.ascii	"HEVC_MoreRbspData\000"
	.space	2
	.type	__func__.13455, %object
	.size	__func__.13455, 12
__func__.13455:
	.ascii	"HEVC_DecVPS\000"
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
	.type	SarTable.13287, %object
	.size	SarTable.13287, 136
SarTable.13287:
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
	.type	__func__.13557, %object
	.size	__func__.13557, 12
__func__.13557:
	.ascii	"HEVC_DecSPS\000"
	.type	__func__.13599, %object
	.size	__func__.13599, 12
__func__.13599:
	.ascii	"HEVC_DecPPS\000"
	.type	__func__.13785, %object
	.size	__func__.13785, 16
__func__.13785:
	.ascii	"HEVC_SeiMessage\000"
	.type	__func__.14948, %object
	.size	__func__.14948, 20
__func__.14948:
	.ascii	"HEVC_More_Rbsp_Data\000"
	.type	__func__.13799, %object
	.size	__func__.13799, 12
__func__.13799:
	.ascii	"HEVC_DecSEI\000"
	.type	__func__.14963, %object
	.size	__func__.14963, 16
__func__.14963:
	.ascii	"HEVC_ReleaseNAL\000"
	.type	__func__.15017, %object
	.size	__func__.15017, 18
__func__.15017:
	.ascii	"HEVC_ClearCurrNal\000"
	.space	2
	.type	__func__.15026, %object
	.size	__func__.15026, 20
__func__.15026:
	.ascii	"HEVC_ClearCurrSlice\000"
	.type	__func__.15031, %object
	.size	__func__.15031, 19
__func__.15031:
	.ascii	"HEVC_ClearAllSlice\000"
	.space	1
	.type	__func__.14411, %object
	.size	__func__.14411, 13
__func__.14411:
	.ascii	"HEVC_InitDPB\000"
	.space	3
	.type	__func__.15039, %object
	.size	__func__.15039, 17
__func__.15039:
	.ascii	"HEVC_ClearAllNal\000"
	.space	3
	.type	__func__.15009, %object
	.size	__func__.15009, 13
__func__.15009:
	.ascii	"HEVCDEC_Init\000"
	.space	3
	.type	__func__.15046, %object
	.size	__func__.15046, 18
__func__.15046:
	.ascii	"HEVC_ClearCurrPic\000"
	.space	2
	.type	__func__.15002, %object
	.size	__func__.15002, 14
__func__.15002:
	.ascii	"HEVC_ClearAll\000"
	.space	2
	.type	__func__.14301, %object
	.size	__func__.14301, 13
__func__.14301:
	.ascii	"HEVC_InitPic\000"
	.space	3
	.type	__func__.14657, %object
	.size	__func__.14657, 19
__func__.14657:
	.ascii	"HEVC_OutputFrmToVO\000"
	.space	1
	.type	__func__.14616, %object
	.size	__func__.14616, 22
__func__.14616:
	.ascii	"HEVC_OutputFrmFromDPB\000"
	.space	2
	.type	__func__.14627, %object
	.size	__func__.14627, 27
__func__.14627:
	.ascii	"HEVC_FlushOutputFrmFromDPB\000"
	.space	1
	.type	__func__.14976, %object
	.size	__func__.14976, 19
__func__.14976:
	.ascii	"HEVC_ReceivePacket\000"
	.space	1
	.type	__func__.15068, %object
	.size	__func__.15068, 25
__func__.15068:
	.ascii	"HEVC_UnMarkFrameStoreRef\000"
	.space	3
	.type	__func__.15054, %object
	.size	__func__.15054, 14
__func__.15054:
	.ascii	"HEVC_FlushDPB\000"
	.space	2
	.type	__func__.15022, %object
	.size	__func__.15022, 14
__func__.15022:
	.ascii	"HEVC_ClearDPB\000"
	.space	2
	.type	__func__.14261, %object
	.size	__func__.14261, 12
__func__.14261:
	.ascii	"HEVC_DecVDM\000"
	.type	__func__.14609, %object
	.size	__func__.14609, 20
__func__.14609:
	.ascii	"HEVC_InsertFrmInDPB\000"
	.type	__func__.13928, %object
	.size	__func__.13928, 14
__func__.13928:
	.ascii	"HEVC_DecSlice\000"
	.space	2
	.type	__func__.13847, %object
	.size	__func__.13847, 23
__func__.13847:
	.ascii	"HEVC_RecoverDPBProcess\000"
	.space	1
	.type	__func__.13820, %object
	.size	__func__.13820, 27
__func__.13820:
	.ascii	"HEVC_GetUnRefPicWithMinPoc\000"
	.space	1
	.type	__func__.13842, %object
	.size	__func__.13842, 30
__func__.13842:
	.ascii	"HEVC_OutputUnRefPicWithMinPoc\000"
	.space	2
	.type	g_HEVCNalTypeEOPIC, %object
	.size	g_HEVCNalTypeEOPIC, 21
g_HEVCNalTypeEOPIC:
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
	.type	__func__.14986, %object
	.size	__func__.14986, 20
__func__.14986:
	.ascii	"HEVCDEC_VDMPostProc\000"
	.type	__func__.14541, %object
	.size	__func__.14541, 19
__func__.14541:
	.ascii	"HEVC_StorePicInDPB\000"
	.space	1
	.type	__func__.14525, %object
	.size	__func__.14525, 22
__func__.14525:
	.ascii	"HEVC_SimpleDPBProcess\000"
	.space	2
	.type	__func__.14530, %object
	.size	__func__.14530, 21
__func__.14530:
	.ascii	"HEVC_DecOrderProcess\000"
	.space	3
	.type	__func__.14520, %object
	.size	__func__.14520, 23
__func__.14520:
	.ascii	"HEVC_FirstFrameFastOut\000"
	.space	1
	.type	__func__.14535, %object
	.size	__func__.14535, 22
__func__.14535:
	.ascii	"HEVC_DispOrderProcess\000"
	.space	2
	.type	__func__.14994, %object
	.size	__func__.14994, 23
__func__.14994:
	.ascii	"HEVCDEC_GetImageBuffer\000"
	.space	1
	.type	__func__.15083, %object
	.size	__func__.15083, 26
__func__.15083:
	.ascii	"HEVC_InquireSliceProperty\000"
	.space	2
	.type	__func__.15088, %object
	.size	__func__.15088, 20
__func__.15088:
	.ascii	"HEVC_HaveSliceToDec\000"
	.type	__func__.13395, %object
	.size	__func__.13395, 21
__func__.13395:
	.ascii	"HEVCDEC_DecodePacket\000"
	.space	3
	.type	__func__.15097, %object
	.size	__func__.15097, 21
__func__.15097:
	.ascii	"HEVCDEC_GetRemainImg\000"
	.space	3
	.type	__func__.15105, %object
	.size	__func__.15105, 22
__func__.15105:
	.ascii	"HEVCDEC_GetImageWidth\000"
	.space	2
	.type	__func__.15110, %object
	.size	__func__.15110, 23
__func__.15110:
	.ascii	"HEVCDEC_GetImageHeight\000"
	.data
	.align	2
.LANCHOR3 = . + 0
	.type	quant8_intra_default, %object
	.size	quant8_intra_default, 64
quant8_intra_default:
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
	.type	g_quantTSDefault4x4, %object
	.size	g_quantTSDefault4x4, 16
g_quantTSDefault4x4:
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
	.type	g_quantInterDefault8x8, %object
	.size	g_quantInterDefault8x8, 64
g_quantInterDefault8x8:
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
	.type	g_quantIntraDefault8x8, %object
	.size	g_quantIntraDefault8x8, 64
g_quantIntraDefault8x8:
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
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, n" )
	ASCII(.ascii	"al_unit_type = %d, should skip this frame\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d," )
	ASCII(.ascii	" nal_unit_type = %d, should skip this frame\012\000" )
.LC4:
	ASCII(.ascii	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocC" )
	ASCII(.ascii	"RA = %d, nal_unit_type = %d, should skip this frame" )
	ASCII(.ascii	"\012\000" )
.LC5:
	ASCII(.ascii	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), err" )
	ASCII(.ascii	"or resilence.\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"--------------- PrintDPBState START ---------------" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"DPB: size:%d, used_size:%d, negative:%d, positive:%" )
	ASCII(.ascii	"d, longterm:%d\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"fs[%d]:%p non_existing:%d state:%d is_ref:%d displa" )
	ASCII(.ascii	"yed:%d poc:%d long_term:%d LogicFs:%p, fsp_ref:%d f" )
	ASCII(.ascii	"sp_disp:%d logic_id:%d img_id:%d\012\000" )
.LC10:
	ASCII(.ascii	"--------------- PrintDPBState END ---------------\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC11:
	ASCII(.ascii	"fs[%d]\011\000" )
.LC12:
	ASCII(.ascii	"LogicFs:%p\011\000" )
.LC13:
	ASCII(.ascii	"LogicTick:%d\011\000" )
	.space	2
.LC14:
	ASCII(.ascii	"IsRef:%d\011\000" )
	.space	2
.LC15:
	ASCII(.ascii	"s32DispState:%d\011\000" )
	.space	3
.LC16:
	ASCII(.ascii	"LogicFs:Null\011\000" )
	.space	2
.LC17:
	ASCII(.ascii	"DecFs:%p\011\000" )
	.space	2
.LC18:
	ASCII(.ascii	"DecTick:%d\011\000" )
.LC19:
	ASCII(.ascii	"DecFs:Null\011\000" )
.LC20:
	ASCII(.ascii	"DispFs:%p\011\000" )
	.space	1
.LC21:
	ASCII(.ascii	"DispTick:%d\011\000" )
	.space	3
.LC22:
	ASCII(.ascii	"DispFs:Null\011\000" )
	.space	3
.LC23:
	ASCII(.ascii	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC24:
	ASCII(.ascii	"HEVC_ue_v ERROR: LeadingZeros (%d) >= 32, return 0x" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"delta_idx(%d) > idx(%d).\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"rIdx(%d) > (idx-1)(%d) or < 0).\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"pTempRPset->num_of_pics(%d) out of range(0,15).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC28:
	ASCII(.ascii	"num_of_pics out of range(0,15).\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"pTempRPset->num_negative_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"pTempRPset->num_positive_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"pShortTermRpset->num_of_pics(%d) out of range[0,%d]" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"delta_poc_s0_minus1(%d) out of range.\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"%s DPB.size(%d) already reached max(%d).\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"%s increase DPB size to %d\012\000" )
.LC35:
	ASCII(.ascii	"%s no enough fs(total_fs_num=%d) to increase DPB si" )
	ASCII(.ascii	"ze.\012\000" )
.LC36:
	ASCII(.ascii	"[%s %d]assert warning\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"image_id=%d, pmv_idc=%d\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"pic msg burst0:\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"%s num_tile_columns(%d) out of range(0, %d].\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"%s num_tile_rows(%d) out of range(0, %d].\012\000" )
	.space	1
.LC41:
	ASCII(.ascii	"%s 0 idx(%d) out of range(0, 512).\012\000" )
.LC42:
	ASCII(.ascii	"%s 1 idx(%d) out of range(0, 512).\012\000" )
.LC43:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC45:
	ASCII(.ascii	"%s call HEVC_CalcTileInfo failed.\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"ListX ERROR: list0size >= %d\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"ListX ERROR: list1size >= %d\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"pListX[0][%d] = NULL\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"pListX[1][%d] = NULL\012\000" )
	.space	2
.LC51:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL\012\000" )
	.space	1
.LC52:
	ASCII(.ascii	"NumSlicePara(%d) >= MaxSliceNum(%d)\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"TileWidthInCtb is 0\012\000" )
	.space	3
.LC54:
	ASCII(.ascii	"%s unkown slice type(%d).\012\000" )
	.space	1
.LC55:
	ASCII(.ascii	"%s pListX[%d] no available pic to repair.\012\000" )
	.space	1
.LC56:
	ASCII(.ascii	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\012" )
	ASCII(.ascii	"\000" )
.LC57:
	ASCII(.ascii	"HEVC_RepairList error.\012\000" )
.LC58:
	ASCII(.ascii	"release(apc=%d, pmvIdc=%d)\011\000" )
.LC59:
	ASCII(.ascii	"HEVC_DECRecycleImage ERROR, DispState = FS_DISP_STA" )
	ASCII(.ascii	"TE_NOT_USED\012\000" )
.LC60:
	ASCII(.ascii	"%s frame logic_fs_id=%d, state=%d\012\000" )
	.space	1
.LC61:
	ASCII(.ascii	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null," )
	ASCII(.ascii	" logic_fs_id = %d\012\000" )
	.space	2
.LC62:
	ASCII(.ascii	"%s frame poc=%d, is already output\012\000" )
.LC63:
	ASCII(.ascii	"%s frame(%p) invalid, state:%d, non_existing:%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC64:
	ASCII(.ascii	"%s: pImg is NULL!\012\000" )
	.space	1
.LC65:
	ASCII(.ascii	"%s, REPORT_IFRAME_ERR\012\000" )
	.space	1
.LC66:
	ASCII(.ascii	"%s: InsertImgToVoQueue failed!\012\000" )
.LC67:
	ASCII(.ascii	"%s: ImgErrorLevel = %d, OutErrThr:%d, discarded!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC68:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC69:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC70:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC71:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC73:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC74:
	ASCII(.ascii	"sps with this seq_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC75:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of r" )
	ASCII(.ascii	"ange\012\000" )
	.space	3
.LC76:
	ASCII(.ascii	"vps with this video_parameter_set_id = %d havn't be" )
	ASCII(.ascii	" decoded\012\000" )
	.space	3
.LC77:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code should not be zero.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC78:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code:%d\012\000" )
	.space	3
.LC79:
	ASCII(.ascii	"general_profile_compatibility_flag[][%d]\000" )
	.space	3
.LC80:
	ASCII(.ascii	"reserved_zero_2bits not equal 0.\012\000" )
	.space	2
.LC81:
	ASCII(.ascii	"HEVC_GetScalingListDefaultAddress NULL.\012\000" )
	.space	3
.LC82:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta out of range(0,ma" )
	ASCII(.ascii	"trixId).\012\000" )
	.space	3
.LC83:
	ASCII(.ascii	"HEVC_DecScalingListData pMatrixAddress NULL.\012\000" )
	.space	2
.LC84:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-7,247).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC85:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-128,127)." )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC86:
	ASCII(.ascii	"luma_log2_weight_denom out of range(0,7).\012\000" )
	.space	1
.LC87:
	ASCII(.ascii	"delta_chroma_log2_weight_denom out of range(-7,7).\012" )
	ASCII(.ascii	"\000" )
.LC88:
	ASCII(.ascii	"delta_luma_weight_l0(%d) out of range(-128,127).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC89:
	ASCII(.ascii	"luma_offset_l0(%d) out of range(-128,127).\012\000" )
.LC90:
	ASCII(.ascii	"delta_chroma_weight_l0 out of range(-128,127).\012\000" )
.LC91:
	ASCII(.ascii	"delta_chroma_offset_l0 out of range(-512,511).\012\000" )
.LC92:
	ASCII(.ascii	"delta_luma_weight_l1 out of range(-128,127).\012\000" )
	.space	2
.LC93:
	ASCII(.ascii	"luma_offset_l1 out of range(-128,127).\012\000" )
.LC94:
	ASCII(.ascii	"delta_chroma_weight_l1 out of range(-128,127).\012\000" )
.LC95:
	ASCII(.ascii	"delta_chroma_offset_l1 out of range(-512,511).\012\000" )
.LC96:
	ASCII(.ascii	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC97:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\012\000" )
.LC98:
	ASCII(.ascii	"max_cu_width(%d)/max_cu_height(%d) = 0\012\000" )
.LC99:
	ASCII(.ascii	"slice_segment_address(%d) out of range(0,%d).\012\000" )
	.space	1
.LC100:
	ASCII(.ascii	"slice_reserved_flag: %d\012\000" )
	.space	3
.LC101:
	ASCII(.ascii	"slice_type(%d) out of range(0,2].\012\000" )
	.space	1
.LC102:
	ASCII(.ascii	"SH HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	2
.LC103:
	ASCII(.ascii	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
.LC104:
	ASCII(.ascii	"num_long_term_sps(%d) out of range[0,%d].\012\000" )
	.space	1
.LC105:
	ASCII(.ascii	"SH ERROR: (num_negative_pics(%d) + num_positive_pic" )
	ASCII(.ascii	"s(%d) + num_of_longterm_pics(%d)) > %d\012\000" )
	.space	1
.LC106:
	ASCII(.ascii	"lt_idx_sps[%d] = %d, but out of range[0,%d].\012\000" )
	.space	2
.LC107:
	ASCII(.ascii	"ERROR: pRPS->num_of_pics(%d) > %d.\012\000" )
.LC108:
	ASCII(.ascii	"num_ref_idx_l0_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC109:
	ASCII(.ascii	"num_ref_idx_l1_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC110:
	ASCII(.ascii	"pRPS is null.\012\000" )
	.space	1
.LC111:
	ASCII(.ascii	"pRPS->num_of_pics out(%d) of range(0,%d).\012\000" )
	.space	1
.LC112:
	ASCII(.ascii	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) " )
	ASCII(.ascii	"out of range(0,%d).\012\000" )
.LC113:
	ASCII(.ascii	"SH HEVC_DecPredWeightTable error.\012\000" )
	.space	1
.LC114:
	ASCII(.ascii	"SH max_num_merge_cand(%d) out of range(1,5).\012\000" )
	.space	2
.LC115:
	ASCII(.ascii	"SH slice_qp(%d) out of range [-%d,51].\012\000" )
.LC116:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC117:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out " )
	ASCII(.ascii	"of range[-12,12].\012\000" )
	.space	2
.LC118:
	ASCII(.ascii	"SH slice_cr_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC119:
	ASCII(.ascii	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) ou" )
	ASCII(.ascii	"t of range[-12,12].\012\000" )
.LC120:
	ASCII(.ascii	"SH slice_beta_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC121:
	ASCII(.ascii	"SH slice_tc_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC122:
	ASCII(.ascii	"CurrSlice.num_entry_point_offsets(%d) out of range[" )
	ASCII(.ascii	"0,%d].\012\000" )
	.space	1
.LC123:
	ASCII(.ascii	"CurrSlice.offset_len(%d) out of range[1,32].\012\000" )
	.space	2
.LC124:
	ASCII(.ascii	"slice_segment_header_extension_length(%d) out of ra" )
	ASCII(.ascii	"nge [0,256]\012\000" )
.LC125:
	ASCII(.ascii	"bitsLeft(%d) < slice_segment_header_extension_lengt" )
	ASCII(.ascii	"h(%d)\012\000" )
	.space	2
.LC126:
	ASCII(.ascii	"SH HEVC_DecRefPicListsModification error.\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"cpb_cnt_minus1(%d) out of range(0,31).\012\000" )
.LC128:
	ASCII(.ascii	"VUI pSps->chroma_format_idc out of range(0,3).\012\000" )
.LC129:
	ASCII(.ascii	"VUI HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC130:
	ASCII(.ascii	"VUI min_spatial_segmentation_idc out of range(0,409" )
	ASCII(.ascii	"5).\012\000" )
.LC131:
	ASCII(.ascii	"vps_reserved_three_2bits(%d) not equal 0x3.\012\000" )
	.space	3
.LC132:
	ASCII(.ascii	"vps_max_layers_minus1 out of range(0,63).\012\000" )
	.space	1
.LC133:
	ASCII(.ascii	"vps_max_sub_layers_minus1=%d\012\000" )
	.space	2
.LC134:
	ASCII(.ascii	"vps_reserved_0xffff_16bits not equal 0xffff.\012\000" )
	.space	2
.LC135:
	ASCII(.ascii	"VPS HEVC_DecPTL error.\012\000" )
.LC136:
	ASCII(.ascii	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC137:
	ASCII(.ascii	"layer_id_included_flag[%d][%d]\000" )
	.space	1
.LC138:
	ASCII(.ascii	"vps_num_hrd_parameters(%d) out of range(0,%d).\012\000" )
.LC139:
	ASCII(.ascii	"VPS HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC140:
	ASCII(.ascii	"pVPS->vps_video_parameter_set_id out of range(0,15)" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC141:
	ASCII(.ascii	"VPS[%d] decode error0.\012\000" )
.LC142:
	ASCII(.ascii	"VPS[%d] decode error1.\012\000" )
.LC143:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range(0,3).\012\000" )
.LC144:
	ASCII(.ascii	"pSPS->chroma_format_idc not equal(%d) 1.\012\000" )
	.space	2
.LC145:
	ASCII(.ascii	"pic_width_in_luma_samples out of range(0,8192).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC146:
	ASCII(.ascii	"pic_height_in_luma_samples out of range(0,4096).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC147:
	ASCII(.ascii	"ERROR Unkown level: %d\012\000" )
.LC148:
	ASCII(.ascii	"conf_win_left_offset+conf_win_right_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC149:
	ASCII(.ascii	"conf_win_top_offset+conf_win_bottom_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC150:
	ASCII(.ascii	"bit_depth_luma(%d) out of range(8,14).\012\000" )
.LC151:
	ASCII(.ascii	"bit_depth_luma(%d) not equal 8.\012\000" )
	.space	3
.LC152:
	ASCII(.ascii	"bit_depth_chroma(%d) out of range[8,14].\012\000" )
	.space	2
.LC153:
	ASCII(.ascii	"bit_depth_chroma(%d) not equal 8.\012\000" )
	.space	1
.LC154:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12" )
	ASCII(.ascii	"].\012\000" )
	.space	1
.LC155:
	ASCII(.ascii	"log2_min_luma_coding_block_size_minus3 out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC156:
	ASCII(.ascii	"log2_diff_max_min_luma_coding_block_size out of ran" )
	ASCII(.ascii	"ge(0,3).\012\000" )
	.space	3
.LC157:
	ASCII(.ascii	"log2_ctb_sizeY out of range(4,6).\012\000" )
	.space	1
.LC158:
	ASCII(.ascii	"log2_min_transform_block_size_minus2 out of range(0" )
	ASCII(.ascii	",3).\012\000" )
	.space	3
.LC159:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC160:
	ASCII(.ascii	"quadtree_tu_log2_min_size not less than log2_min_cb" )
	ASCII(.ascii	"_sizeY.\012\000" )
.LC161:
	ASCII(.ascii	"quadtree_tu_log2_max_size greater than Min( CtbLog2" )
	ASCII(.ascii	"SizeY, 5 ).\012\000" )
.LC162:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC163:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC164:
	ASCII(.ascii	"SPS HEVC_DecScalingListData error.\012\000" )
.LC165:
	ASCII(.ascii	"SPS sao is off and pic height(%d) is too small.(Log" )
	ASCII(.ascii	"ic Unsupported).\012\000" )
	.space	3
.LC166:
	ASCII(.ascii	"log2_min_pcm_coding_block_size_minus3(%d) out of ra" )
	ASCII(.ascii	"nge[0,2].\012\000" )
	.space	2
.LC167:
	ASCII(.ascii	"log2_diff_max_min_pcm_coding_block_size(%d) out of " )
	ASCII(.ascii	"range[0,2].\012\000" )
.LC168:
	ASCII(.ascii	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5" )
	ASCII(.ascii	" ).\012\000" )
.LC169:
	ASCII(.ascii	"num_short_term_ref_pic_sets out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC170:
	ASCII(.ascii	"SPS HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	1
.LC171:
	ASCII(.ascii	"num_long_term_ref_pic_sps out of range[0,32].\012\000" )
	.space	1
.LC172:
	ASCII(.ascii	"SPS HEVC_DecVuiParam error.\012\000" )
	.space	3
.LC173:
	ASCII(.ascii	"dar=%d\012\000" )
.LC174:
	ASCII(.ascii	"sps_video_parameter_set_id out of range(0,%d).\012\000" )
.LC175:
	ASCII(.ascii	"sps_max_sub_layers_minus1 out of range(0,%d).\012\000" )
	.space	1
.LC176:
	ASCII(.ascii	"SPS HEVC_DecPTL error.\012\000" )
.LC177:
	ASCII(.ascii	"sps_seq_parameter_set_id out of range(0,%d).\012\000" )
	.space	2
.LC178:
	ASCII(.ascii	"SPS[%d] decode error0.\012\000" )
.LC179:
	ASCII(.ascii	"SPS[%d] decode error.\012\000" )
	.space	1
.LC180:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range[0,15].\012\000" )
	.space	2
.LC181:
	ASCII(.ascii	"SPS(%d) haven't decode.\012\000" )
	.space	3
.LC182:
	ASCII(.ascii	"num_ref_idx_l0_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC183:
	ASCII(.ascii	"num_ref_idx_l1_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC184:
	ASCII(.ascii	"init_qp_minus26(%d) out of range[-%d,51].\012\000" )
	.space	1
.LC185:
	ASCII(.ascii	"diff_cu_qp_delta_depth out of range[0,3].\012\000" )
	.space	1
.LC186:
	ASCII(.ascii	"pic_cb_qp_offset out of range[-12,12].\012\000" )
.LC187:
	ASCII(.ascii	"pic_cr_qp_offset out of range[-12,12].\012\000" )
.LC188:
	ASCII(.ascii	"num_tile_columns(%d) out of range(0,%d).\012\000" )
	.space	2
.LC189:
	ASCII(.ascii	"num_tile_rows out(%d) of range(0,%d).\012\000" )
	.space	1
.LC190:
	ASCII(.ascii	"Logic limit(%d), num_tile_columns(%d) exceed.\012\000" )
	.space	1
.LC191:
	ASCII(.ascii	"Logic limit(%d), num_tile_rows(%d) exceed.\012\000" )
.LC192:
	ASCII(.ascii	"column_width[%d](%d) out of range (0 %d)\012\000" )
	.space	2
.LC193:
	ASCII(.ascii	"row_height[%d](%d) out of range (0 %d)\012\000" )
.LC194:
	ASCII(.ascii	"column_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	2
.LC195:
	ASCII(.ascii	"row_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	1
.LC196:
	ASCII(.ascii	"PPS tile width(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC197:
	ASCII(.ascii	"PPS tile height(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
.LC198:
	ASCII(.ascii	"pps_beta_offset_div2(%d) out of range(-6,6).\012\000" )
	.space	2
.LC199:
	ASCII(.ascii	"pps_tc_offset_div2(%d) out of range(-6,6).\012\000" )
.LC200:
	ASCII(.ascii	"PPS HEVC_DecScalingListData error.\012\000" )
.LC201:
	ASCII(.ascii	"log2_parallel_merge_level(%d) out of range(2,log2_c" )
	ASCII(.ascii	"tb_sizeY).\012\000" )
	.space	1
.LC202:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range(0,%d).\012\000" )
	.space	2
.LC203:
	ASCII(.ascii	"PPS[%d] decode error.\012\000" )
	.space	1
.LC204:
	ASCII(.ascii	"Wrong bp_seq_parameter_set_id = %d, should be 0 to " )
	ASCII(.ascii	"15!\012\000" )
.LC205:
	ASCII(.ascii	"HEVC_Sei_Buf_Period cpb_cnt_minus1(%d) out of range" )
	ASCII(.ascii	"(0,31).\012\000" )
.LC206:
	ASCII(.ascii	"pPic->num_decoding_units_minus1 > 255\012\000" )
	.space	1
.LC207:
	ASCII(.ascii	"Unsupport: target_bit_depth(%d) > 8\012\000" )
	.space	3
.LC208:
	ASCII(.ascii	"pTon->num_pivots > 256\012\000" )
.LC209:
	ASCII(.ascii	"frame_packing_arrangement_type(%d) out of range\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC210:
	ASCII(.ascii	"num_entries_in_sop_minus1 out of range(0,1024)\012\000" )
.LC211:
	ASCII(.ascii	"pAct->num_sps_ids_minus1 > 15\012\000" )
	.space	1
.LC212:
	ASCII(.ascii	"nesting_num_ops_minus1 out of range(0,%d)\012\000" )
	.space	1
.LC213:
	ASCII(.ascii	"nesting_num_layers_minus1 out of range(0,63)\012\000" )
	.space	2
.LC214:
	ASCII(.ascii	"SEI HEVC_SeiMessage error.\012\000" )
.LC215:
	ASCII(.ascii	"HEVC_SeiMessage HEVC_Sei_Payload error.\012\000" )
	.space	3
.LC216:
	ASCII(.ascii	"Error, BsLen: 0x%x, TotalPos: 0x%x\012\000" )
.LC217:
	ASCII(.ascii	"SEI BsIsByteAligned error.\012\000" )
.LC218:
	ASCII(.ascii	"SEI rbsp_trailing_bits(%d) not equal 0x80.\012\000" )
.LC219:
	ASCII(.ascii	"firmware/common/syntax/hevc.c\000" )
	.space	2
.LC220:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC221:
	ASCII(.ascii	"%s release streambuff=%p, bitstream_length=%d\012\000" )
	.space	1
.LC222:
	ASCII(.ascii	"hevc partition fs memory fail!\012\000" )
.LC223:
	ASCII(.ascii	"ERROR: HEVC FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC224:
	ASCII(.ascii	"%s arrange mem failed.\012\000" )
.LC225:
	ASCII(.ascii	"Init dec para\012\000" )
	.space	1
.LC226:
	ASCII(.ascii	"%s: Get context addr failed!\012\000" )
	.space	2
.LC227:
	ASCII(.ascii	"%s: VCTRL_GetChanIDByCtx() return -1!\012\000" )
	.space	1
.LC228:
	ASCII(.ascii	"BitDepthChange ReRange FS Luma(%d-->%d),Chroma(%d -" )
	ASCII(.ascii	"->%d)\012\000" )
	.space	2
.LC229:
	ASCII(.ascii	"HEVC_InitDPB error, return %d\012\000" )
	.space	1
.LC230:
	ASCII(.ascii	"HEVC_AllocFrameStore error\012\000" )
.LC231:
	ASCII(.ascii	"%s: pstLogicFsImage is NULL!\012\000" )
	.space	2
.LC232:
	ASCII(.ascii	"HEVC InsertVO Failed return %d, ClearAll\012\000" )
	.space	2
.LC233:
	ASCII(.ascii	"HEVC.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC234:
	ASCII(.ascii	"%s: FirstFrameFastOut LastPoc: %d, CurPos: %d!\012\000" )
.LC235:
	ASCII(.ascii	"%s: HEVC_OutputFrmToVO err!\012\000" )
	.space	3
.LC236:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC237:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC238:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC239:
	ASCII(.ascii	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\012\000" )
	.space	2
.LC240:
	ASCII(.ascii	"END of the bit buffer, copy the first packet!\012\000" )
	.space	1
.LC241:
	ASCII(.ascii	"%s: flush dpb failed, return %d\012\000" )
	.space	3
.LC242:
	ASCII(.ascii	"DecVDM no slice and needn't start VDM, but MaxBytes" )
	ASCII(.ascii	"Received exceed threshold!\012\000" )
	.space	1
.LC243:
	ASCII(.ascii	"DecVDM no slice and needn't start VDM\012\000" )
	.space	1
.LC244:
	ASCII(.ascii	"IPBDecMode Changed (%d -> %d)\012\000" )
	.space	1
.LC245:
	ASCII(.ascii	"Discard this B(poc=%d) before P, is_ref_idc=%d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC246:
	ASCII(.ascii	"VDM start, TotalPicNum=%d.\012\000" )
.LC247:
	ASCII(.ascii	"%s no correct slice in the pic\012\000" )
.LC248:
	ASCII(.ascii	"%s with invalid pos(%d)\012\000" )
	.space	3
.LC249:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC250:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%" )
	ASCII(.ascii	"d, logic_fs=%p, dec_fs=%p)\012\000" )
	.space	1
.LC251:
	ASCII(.ascii	"%s get APC error, ret %d\012\000" )
	.space	2
.LC252:
	ASCII(.ascii	"No frame store for lost pic.\012\000" )
	.space	2
.LC253:
	ASCII(.ascii	"DPB ERROR: Can not get ref_fs!\012\000" )
.LC254:
	ASCII(.ascii	"DPB no suited fs for lost pic.\012\000" )
.LC255:
	ASCII(.ascii	"Take poc(%d) to creat lost poc(%d).\012\000" )
	.space	3
.LC256:
	ASCII(.ascii	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\012\000" )
	.space	1
.LC257:
	ASCII(.ascii	"ERROR: Can not new logic fs!\012\000" )
	.space	2
.LC258:
	ASCII(.ascii	"Lost pic insert in DPB Failed!\012\000" )
.LC259:
	ASCII(.ascii	"%s call HEVC_FlushOutputFrmFromDPB failed\012\000" )
	.space	1
.LC260:
	ASCII(.ascii	"%s call HEVC_EmptyFrmFromDPB failed\012\000" )
	.space	3
.LC261:
	ASCII(.ascii	"Start Reason: SliceParaNum= %d, \012\000" )
	.space	2
.LC262:
	ASCII(.ascii	"Too many slice , err!\012\000" )
	.space	1
.LC263:
	ASCII(.ascii	"s32OutErrThr = %d,drop poc %d because lost ref fram" )
	ASCII(.ascii	"e(pod %d)\012\000" )
	.space	2
.LC264:
	ASCII(.ascii	"Ref frame(poc %d) lost.\012\000" )
	.space	3
.LC265:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), need to incr" )
	ASCII(.ascii	"ease DPB size.\012\000" )
	.space	1
.LC266:
	ASCII(.ascii	"%s call HEVC_IncreaseDPBSize failed\012\000" )
	.space	3
.LC267:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpo" )
	ASCII(.ascii	"c frame.\012\000" )
	.space	3
.LC268:
	ASCII(.ascii	"%s can't find such pic.\012\000" )
	.space	3
.LC269:
	ASCII(.ascii	"%s DPB.used_size(%d) >= 17.\012\000" )
	.space	3
.LC270:
	ASCII(.ascii	"%s find pos=%d, poc=%d.\012\000" )
	.space	3
.LC271:
	ASCII(.ascii	"%s call HEVC_OutputOneFrmFromDPB failed\012\000" )
	.space	3
.LC272:
	ASCII(.ascii	"Init pic err, exit\012\000" )
.LC273:
	ASCII(.ascii	"HEVC_WritePicMsg failed!\012\000" )
	.space	2
.LC274:
	ASCII(.ascii	"Cur pic not init yet, discard this slice!\012\000" )
	.space	1
.LC275:
	ASCII(.ascii	"Dec List error, ret=%d\012\000" )
.LC276:
	ASCII(.ascii	"pListX[0][%d] = NULL, listXsize[0] = %d\012\000" )
	.space	3
.LC277:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC278:
	ASCII(.ascii	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) inval" )
	ASCII(.ascii	"id\012\000" )
	.space	1
.LC279:
	ASCII(.ascii	"pListX[1][%d] = NULL, listXsize[1] = %d\012\000" )
	.space	3
.LC280:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC281:
	ASCII(.ascii	"pListX[i][%d] pstLogicFs(%p) invalid\012\000" )
	.space	2
.LC282:
	ASCII(.ascii	"HEVC_WriteSliceMsg err.\012\000" )
	.space	3
.LC283:
	ASCII(.ascii	"%s call HEVC_GetUnRefPicWithMinPoc failed\012\000" )
	.space	1
.LC284:
	ASCII(.ascii	"Ref List is Wrong!\012\000" )
.LC285:
	ASCII(.ascii	"VPS decode error.\012\000" )
	.space	1
.LC286:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC287:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC288:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC289:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d\012\000" )
.LC290:
	ASCII(.ascii	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_" )
	ASCII(.ascii	"NORMAL\012\000" )
	.space	1
.LC291:
	ASCII(.ascii	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\012\000" )
	.space	1
.LC292:
	ASCII(.ascii	"%s call HEVC_IModeProcess Failed\012\000" )
	.space	2
.LC293:
	ASCII(.ascii	"HEVC_StorePicInDpb return(%d) from L%d\012\000" )
.LC294:
	ASCII(.ascii	"%s %d: InsertFrmInDPB failed, return %d\012\000" )
	.space	3
.LC295:
	ASCII(.ascii	"%s call HEVC_CheckFrameStore failed!\012\000" )
	.space	2
.LC296:
	ASCII(.ascii	"%s output current picture failed\012\000" )
	.space	2
.LC297:
	ASCII(.ascii	"%s call HEVC_RemoveUnUsedFrameStore Failed.\012\000" )
	.space	3
.LC298:
	ASCII(.ascii	"%s call HEVC_InsertFrmInDPB Failed.\012\000" )
	.space	3
.LC299:
	ASCII(.ascii	"%s call HEVC_FirstFrameFastOut Failed\012\000" )
	.space	1
.LC300:
	ASCII(.ascii	"DPB.used_size may bigger than DPB.size\012\000" )
.LC301:
	ASCII(.ascii	"HEVC_InsertFrmInDPB Failed, ret = %d\012\000" )
	.space	2
.LC302:
	ASCII(.ascii	"%s call HEVC_OutputFrmFromDPB failed\012\000" )
	.space	2
.LC303:
	ASCII(.ascii	"%s return HEVC_DEC_ERR\012\000" )
.LC304:
	ASCII(.ascii	"HEVC_StorePicInDPB failed, ret = %d\012\000" )
	.space	3
.LC305:
	ASCII(.ascii	"%s call HEVC_SimpleDPBProcess Failed\012\000" )
	.space	2
.LC306:
	ASCII(.ascii	"%s call HEVC_DecOrderProcess Failed\012\000" )
	.space	3
.LC307:
	ASCII(.ascii	"%s call HEVC_DispOrderProcess Failed\012\000" )
	.space	2
.LC308:
	ASCII(.ascii	"Unkown Error: No available fs, try to remove unused" )
	ASCII(.ascii	" fs!\012\000" )
	.space	3
.LC309:
	ASCII(.ascii	"Remove failed, clear DPB!\012\000" )
	.space	1
.LC310:
	ASCII(.ascii	"Remove success! DPB: used %d, size %d.\012\000" )
.LC311:
	ASCII(.ascii	"--------------- PrintFrameStoreState START --------" )
	ASCII(.ascii	"-------\012\000" )
.LC312:
	ASCII(.ascii	"--------------- PrintFrameStoreState END ----------" )
	ASCII(.ascii	"-----\012\000" )
	.space	2
.LC313:
	ASCII(.ascii	"No frame store available!\012\000" )
	.space	1
.LC314:
	ASCII(.ascii	"Fs=%d, pFs=%p, state=%d, is_reference=%d, is_displa" )
	ASCII(.ascii	"yed=%d \000" )
	.space	1
.LC315:
	ASCII(.ascii	"p_usrdat[%d]=%p \000" )
	.space	3
.LC316:
	ASCII(.ascii	"%s ReadImgNum = %d, NewImgNum = %d, FrameStore leak" )
	ASCII(.ascii	", ClearAll!\012\000" )
.LC317:
	ASCII(.ascii	"HEVC_DecSliceSegmentHeader dec err\012\000" )
.LC318:
	ASCII(.ascii	"%s last frame fs unrelease, fix it!\012\000" )
	.space	3
.LC319:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pPacket!\012\000" )
	.space	1
.LC320:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC321:
	ASCII(.ascii	"HEVC_InquireSliceProperty error.\012\000" )
	.space	2
.LC322:
	ASCII(.ascii	"HEVC_DecOneNal ERR\012\000" )
.LC323:
	ASCII(.ascii	"%s pstLogicFsImage is NULL!\012\000" )
	.space	3
.LC324:
	ASCII(.ascii	"%s InsertVO err:%d, ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
.LANCHOR2 = . + 147312
.LANCHOR4 = . + 188232
.LANCHOR5 = . + 646536
.LANCHOR6 = . + 654720
	.type	g_TsToRsMap, %object
	.size	g_TsToRsMap, 147456
g_TsToRsMap:
	.space	147456
	.type	g_IsDeced, %object
	.size	g_IsDeced, 36864
g_IsDeced:
	.space	36864
	.type	s_auiSigLastScan, %object
	.size	s_auiSigLastScan, 458752
s_auiSigLastScan:
	.space	458752
	.type	g_hrd_parameters, %object
	.size	g_hrd_parameters, 10376
g_hrd_parameters:
	.space	10376
	.type	s_TmpParam, %object
	.size	s_TmpParam, 15788
s_TmpParam:
	.space	15788
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
