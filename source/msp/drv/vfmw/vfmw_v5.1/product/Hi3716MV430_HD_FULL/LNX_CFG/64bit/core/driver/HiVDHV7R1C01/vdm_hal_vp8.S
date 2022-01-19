#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_vp8.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VP8HAL_CfgDnMsg
	.type	VP8HAL_CfgDnMsg, %function
VP8HAL_CfgDnMsg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x21, 40]
	bl	MEM_Phy2Vir
	mov	x22, x0
	cbz	x0, .L78
	ldr	x19, .LC7
	mov	w0, 0
	ldr	w1, [x20, 2800]
	ldr	w3, [x20, 2804]
	bfi	w0, w1, 0, 1
	ldr	x1, [x19, 856]
	ldr	w2, [x19, 864]
	bfi	w0, w3, 1, 2
	sub	x1, x22, x1
	str	wzr, [x29, 92]
	cmp	x1, x2
	strb	w0, [x29, 92]
	bge	.L79
	ldr	w3, [x29, 92]
	str	w3, [x22]
.L5:
	ldr	x2, .LC9
	mov	w1, 39
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x20, 2812]
	add	x1, x22, 4
	ldr	w3, [x20, 2808]
	ldr	x4, [x19, 856]
	lsl	w0, w0, 1
	ldr	w2, [x19, 864]
	sub	w3, w0, w3
	sub	x0, x1, x4
	add	w3, w3, 1
	cmp	x0, x2
	str	w3, [x29, 92]
	blt	.L6
	mov	w0, 1
	str	w0, [x19, 852]
.L7:
	ldr	x2, .LC11
	mov	w1, 45
	mov	w0, 5
	bl	dprint_normal
	ldr	w2, [x20, 2788]
	add	x0, x22, 8
	ldr	w1, [x20, 2792]
	mov	w3, 0
	ldr	x5, [x19, 856]
	sub	w2, w2, #1
	ldr	w4, [x19, 864]
	bfi	w3, w2, 0, 9
	sub	w1, w1, #1
	mov	w2, 0
	sub	x0, x0, x5
	bfi	w2, w1, 0, 9
	strh	w3, [x29, 92]
	cmp	x0, x4
	strh	w2, [x29, 94]
	blt	.L8
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L9:
	ldr	x2, .LC13
	mov	w1, 53
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 92]
	ldrb	w0, [x20, 2753]
	mov	w1, 0
	ldr	x5, [x19, 856]
	bfi	w1, w0, 0, 1
	ldrb	w4, [x20, 2754]
	add	x0, x22, 12
	ldr	w2, [x19, 864]
	ldrb	w3, [x20, 2752]
	sub	x0, x0, x5
	bfi	w1, w4, 1, 2
	cmp	x0, x2
	strb	w3, [x29, 92]
	strb	w1, [x29, 93]
	blt	.L10
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L11:
	ldr	x2, .LC15
	mov	w1, 62
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 92]
	ldrb	w2, [x20, 2755]
	mov	w0, 0
	ldrb	w1, [x20, 2756]
	bfi	w0, w2, 0, 1
	ldrb	w2, [x20, 2757]
	bfi	w0, w1, 1, 1
	ldr	x4, [x19, 856]
	bfi	w0, w2, 2, 1
	ldrb	w3, [x20, 2758]
	add	x1, x22, 16
	ldr	w2, [x19, 864]
	sub	x1, x1, x4
	bfi	w0, w3, 3, 1
	cmp	x1, x2
	strb	w0, [x29, 92]
	blt	.L12
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L13:
	ldr	x2, .LC17
	mov	w1, 72
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 92]
	ldrb	w2, [x20, 2760]
	mov	w0, 0
	ldrb	w1, [x20, 2761]
	bfi	w0, w2, 0, 1
	ldrb	w4, [x20, 2762]
	bfi	w0, w1, 1, 2
	strb	w0, [x29, 92]
	ldr	x0, [x19, 856]
	add	x1, x22, 20
	ldrh	w2, [x29, 92]
	ldrb	w5, [x20, 2763]
	sub	x1, x1, x0
	bfi	w2, w4, 3, 6
	ldrb	w3, [x20, 2764]
	ldr	w4, [x19, 864]
	lsr	x0, x2, 8
	bfi	w0, w5, 1, 3
	strh	w2, [x29, 92]
	bfi	w0, w3, 4, 3
	cmp	x1, x4
	strb	w0, [x29, 93]
	blt	.L14
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L15:
	ldr	x2, .LC19
	mov	w1, 83
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 92]
	ldrb	w2, [x20, 2765]
	mov	w0, 0
	ldrb	w1, [x20, 2766]
	bfi	w0, w2, 0, 1
	ldrb	w2, [x20, 2767]
	bfi	w0, w1, 1, 4
	ldrb	w4, [x20, 2768]
	bfi	w0, w2, 5, 1
	strb	w0, [x29, 92]
	ldrb	w5, [x20, 2772]
	ldrb	w1, [x29, 94]
	ldrh	w2, [x29, 92]
	ldrb	w0, [x20, 2773]
	bfi	w1, w5, 0, 4
	ldrb	w3, [x20, 2769]
	bfi	w2, w4, 6, 4
	ldrb	w5, [x20, 2770]
	bfi	w1, w0, 4, 1
	lsr	x0, x2, 8
	strb	w1, [x29, 94]
	bfi	w0, w3, 2, 1
	ldrb	w1, [x20, 2774]
	ldr	x4, [x19, 856]
	bfi	w0, w5, 3, 4
	ldrh	w3, [x29, 94]
	ldrb	w5, [x20, 2771]
	strh	w2, [x29, 92]
	bfi	w3, w1, 5, 4
	add	x1, x22, 24
	bfi	w0, w5, 7, 1
	ldr	w2, [x19, 864]
	sub	x1, x1, x4
	strb	w0, [x29, 93]
	strh	w3, [x29, 94]
	cmp	x1, x2
	blt	.L16
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L17:
	ldr	x2, .LC21
	mov	w1, 99
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 92]
	ldr	x4, [x19, 856]
	add	x0, x22, 28
	ldrb	w3, [x20, 2759]
	mov	w1, 0
	ldr	w2, [x19, 864]
	sub	x0, x0, x4
	bfi	w1, w3, 0, 7
	strb	w1, [x29, 92]
	cmp	x0, x2
	blt	.L18
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L19:
	ldr	x2, .LC23
	mov	w1, 106
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 32
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 2784]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L20
	mov	w0, 1
	str	w0, [x19, 852]
.L21:
	ldr	x2, .LC25
	mov	w1, 113
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 92]
	ldr	x5, [x19, 856]
	add	x0, x22, 36
	ldrb	w4, [x20, 2780]
	mov	w1, 0
	ldr	w2, [x19, 864]
	sub	x0, x0, x5
	ldrb	w3, [x20, 2779]
	bfi	w1, w4, 0, 6
	cmp	x0, x2
	strb	w3, [x29, 92]
	strb	w1, [x29, 94]
	blt	.L22
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L23:
	ldr	x2, .LC27
	mov	w1, 121
	mov	w0, 5
	bl	dprint_normal
	ldr	w23, [x20, 2828]
	ldrb	w0, [x20, 2780]
	ldr	w1, [x20, 2824]
	ldr	w3, [x20, 2820]
	cmp	w0, w1
	add	w3, w0, w3
	bhi	.L24
	sub	w1, w1, w0
.L25:
	ldr	x4, [x19, 856]
	mov	w0, 0
	bfi	w0, w3, 0, 25
	add	x2, x22, 64
	ldr	w3, [x19, 864]
	sub	x2, x2, x4
	str	w0, [x29, 92]
	lsr	w0, w0, 24
	bfi	w0, w1, 1, 7
	cmp	x2, x3
	strb	w0, [x29, 95]
	blt	.L26
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L27:
	ldr	x2, .LC29
	mov	w1, 143
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 68
	ldr	w1, [x19, 864]
	mov	w3, 0
	sub	x0, x0, x2
	bfi	w3, w23, 0, 24
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L28
	mov	w0, 1
	str	w0, [x19, 852]
.L29:
	ldr	x2, .LC31
	mov	w1, 150
	mov	w0, 5
	bl	dprint_normal
	ldr	w1, [x20, 2832]
	mov	w0, 0
	ldr	x4, [x19, 856]
	bfi	w0, w1, 0, 25
	ldr	w2, [x19, 864]
	ldr	w3, [x20, 2836]
	add	x1, x22, 72
	str	w0, [x29, 92]
	sub	x1, x1, x4
	lsr	w0, w0, 24
	cmp	x1, x2
	bfi	w0, w3, 1, 7
	strb	w0, [x29, 95]
	blt	.L30
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L31:
	ldr	x2, .LC33
	mov	w1, 158
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x19, 856]
	add	x0, x22, 76
	ldr	w1, [x19, 864]
	mov	w3, 0
	ldr	w2, [x20, 2840]
	sub	x0, x0, x4
	cmp	x0, x1
	bfi	w3, w2, 0, 24
	str	w3, [x29, 92]
	blt	.L32
	mov	w0, 1
	str	w0, [x19, 852]
.L33:
	ldr	x2, .LC35
	mov	w1, 165
	mov	w0, 5
	bl	dprint_normal
	ldr	x5, [x19, 856]
	add	x0, x22, 80
	ldr	w2, [x20, 3044]
	ldr	w1, [x19, 864]
	sub	x0, x0, x5
	ldr	w4, [x20, 3040]
	ldr	w3, [x20, 3048]
	cmp	x0, x1
	strb	w2, [x29, 93]
	ldr	w2, [x20, 3052]
	strb	w4, [x29, 92]
	strb	w3, [x29, 94]
	strb	w2, [x29, 95]
	blt	.L34
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L35:
	ldr	x2, .LC37
	mov	w1, 175
	mov	w0, 5
	bl	dprint_normal
	ldr	x5, [x19, 856]
	add	x0, x22, 84
	ldr	w2, [x20, 3060]
	ldr	w1, [x19, 864]
	sub	x0, x0, x5
	ldr	w4, [x20, 3056]
	ldr	w3, [x20, 3064]
	cmp	x0, x1
	strb	w2, [x29, 93]
	ldr	w2, [x20, 3068]
	strb	w4, [x29, 92]
	strb	w3, [x29, 94]
	strb	w2, [x29, 95]
	blt	.L36
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L37:
	ldr	x2, .LC39
	mov	w1, 185
	mov	w0, 5
	bl	dprint_normal
	ldr	x5, [x19, 856]
	add	x0, x22, 88
	ldr	w2, [x20, 3076]
	ldr	w1, [x19, 864]
	sub	x0, x0, x5
	ldr	w4, [x20, 3072]
	ldr	w3, [x20, 3080]
	cmp	x0, x1
	strb	w2, [x29, 93]
	ldr	w2, [x20, 3084]
	strb	w4, [x29, 92]
	strb	w3, [x29, 94]
	strb	w2, [x29, 95]
	blt	.L38
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L39:
	ldr	x2, .LC41
	mov	w1, 195
	mov	w0, 5
	bl	dprint_normal
	ldr	x5, [x19, 856]
	add	x0, x22, 92
	ldr	w2, [x20, 3092]
	ldr	w1, [x19, 864]
	sub	x0, x0, x5
	ldr	w4, [x20, 3088]
	ldr	w3, [x20, 3096]
	cmp	x0, x1
	strb	w2, [x29, 93]
	ldr	w2, [x20, 3100]
	strb	w4, [x29, 92]
	strb	w3, [x29, 94]
	strb	w2, [x29, 95]
	blt	.L40
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L41:
	ldr	x2, .LC43
	mov	w1, 205
	mov	w0, 5
	bl	dprint_normal
	ldr	x5, [x19, 856]
	add	x0, x22, 96
	ldr	w2, [x20, 3108]
	ldr	w1, [x19, 864]
	sub	x0, x0, x5
	ldr	w4, [x20, 3104]
	ldr	w3, [x20, 3112]
	cmp	x0, x1
	strb	w2, [x29, 93]
	ldr	w2, [x20, 3116]
	strb	w4, [x29, 92]
	strb	w3, [x29, 94]
	strb	w2, [x29, 95]
	blt	.L42
	ldr	w3, [x29, 92]
	mov	w0, 1
	str	w0, [x19, 852]
.L43:
	ldr	x2, .LC45
	mov	w1, 215
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 100
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 3144]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L44
	mov	w0, 1
	str	w0, [x19, 852]
.L45:
	ldr	x2, .LC47
	mov	w1, 221
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 128
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 3120]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L46
	mov	w0, 1
	str	w0, [x19, 852]
.L47:
	ldr	x2, .LC49
	mov	w1, 228
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 132
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 3128]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L48
	mov	w0, 1
	str	w0, [x19, 852]
.L49:
	ldr	x2, .LC51
	mov	w1, 235
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 136
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 3132]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L50
	mov	w0, 1
	str	w0, [x19, 852]
.L51:
	ldr	x2, .LC53
	mov	w1, 242
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 140
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 3136]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L52
	mov	w0, 1
	str	w0, [x19, 852]
.L53:
	ldr	x2, .LC55
	mov	w1, 249
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 144
	ldr	w1, [x19, 864]
	ldr	w3, [x21, 896]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L54
	mov	w0, 1
	str	w0, [x19, 852]
.L55:
	ldr	x2, .LC57
	mov	w1, 256
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 148
	ldr	w1, [x19, 864]
	ldr	w3, [x21, 900]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L56
	mov	w0, 1
	str	w0, [x19, 852]
.L57:
	ldr	x2, .LC59
	mov	w1, 263
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 152
	ldr	w1, [x19, 864]
	ldr	w3, [x21, 904]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L58
	mov	w0, 1
	str	w0, [x19, 852]
.L59:
	ldr	x2, .LC61
	mov	w1, 270
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 156
	ldr	w1, [x19, 864]
	ldr	w3, [x21, 888]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 92]
	blt	.L60
	mov	w0, 1
	str	w0, [x19, 852]
.L61:
	ldr	x2, .LC63
	mov	w1, 277
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x21, 888]
	bl	MEM_Phy2Vir
	cbz	x0, .L80
	ldr	x3, .LC66
	mov	x2, 2752
	mov	x1, x20
	ldr	x3, [x3, 104]
	blr	x3
	ldr	w23, [x21, 908]
	ldr	x2, [x19, 856]
	add	x0, x22, 160
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	str	w23, [x29, 92]
	cmp	x0, x1
	blt	.L63
	mov	w0, 1
	str	w0, [x19, 852]
.L64:
	ldr	x2, .LC68
	mov	w1, 294
	mov	w3, w23
	mov	w0, 5
	add	x21, x22, 252
	bl	dprint_normal
	mov	x0, x22
	bl	MEM_Vir2Phy
	ldr	x1, [x19, 856]
	ldr	w2, [x19, 864]
	sub	x1, x21, x1
	cmp	x1, x2
	blt	.L65
	mov	w0, 1
	str	w0, [x19, 852]
.L66:
	ldr	x2, .LC70
	mov	w3, w23
	mov	w1, 300
	mov	w0, 5
	add	x20, x20, 2848
	mov	w22, 67
	bl	dprint_normal
	mov	w24, 1
	ldr	x23, .LC72
	b	.L75
	.p2align 3
.L82:
	ldr	w4, [x29, 92]
	str	w24, [x19, 852]
.L68:
	sub	w3, w22, #3
	mov	x2, x23
	mov	w1, 310
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x19, 856]
	add	x0, x21, 8
	ldr	w1, [x19, 864]
	mov	w4, 0
	ldr	w2, [x20, 64]
	sub	x0, x0, x3
	cmp	x0, x1
	bfi	w4, w2, 0, 24
	str	w4, [x29, 92]
	blt	.L69
	str	w24, [x19, 852]
.L70:
	sub	w3, w22, #2
	mov	x2, x23
	mov	w1, 316
	mov	w0, 5
	bl	dprint_normal
	ldr	w1, [x20, 96]
	mov	w0, 0
	ldr	x4, [x19, 856]
	bfi	w0, w1, 0, 25
	ldr	w2, [x19, 864]
	ldr	w3, [x20, 128]
	add	x1, x21, 12
	str	w0, [x29, 92]
	sub	x1, x1, x4
	lsr	w0, w0, 24
	cmp	x1, x2
	bfi	w0, w3, 1, 7
	strb	w0, [x29, 95]
	blt	.L71
	ldr	w4, [x29, 92]
	str	w24, [x19, 852]
.L72:
	mov	x2, x23
	mov	w1, 323
	sub	w3, w22, #1
	mov	w0, 5
	add	x25, x21, 16
	bl	dprint_normal
	ldr	x0, [x19, 856]
	mov	w4, 0
	ldr	w1, [x19, 864]
	ldr	w2, [x20, 160]
	sub	x0, x25, x0
	cmp	x0, x1
	bfi	w4, w2, 0, 24
	str	w4, [x29, 92]
	blt	.L73
	str	w24, [x19, 852]
.L74:
	mov	w3, w22
	mov	x2, x23
	mov	w1, 329
	mov	w0, 5
	add	w22, w22, 4
	add	x20, x20, 4
	bl	dprint_normal
	cmp	w22, 99
	beq	.L81
	mov	x21, x25
.L75:
	ldr	w1, [x20]
	mov	w0, 0
	ldr	x4, [x19, 856]
	bfi	w0, w1, 0, 25
	ldr	w2, [x19, 864]
	ldr	w3, [x20, 32]
	add	x1, x21, 4
	str	w0, [x29, 92]
	sub	x1, x1, x4
	lsr	w0, w0, 24
	cmp	x1, x2
	bfi	w0, w3, 1, 7
	strb	w0, [x29, 95]
	bge	.L82
	ldr	w4, [x29, 92]
	str	w4, [x21, 4]
	b	.L68
	.p2align 3
.L79:
	mov	w0, 1
	ldr	w3, [x29, 92]
	str	w0, [x19, 852]
	b	.L5
	.p2align 3
.L73:
	str	w4, [x21, 16]
	b	.L74
	.p2align 3
.L71:
	ldr	w4, [x29, 92]
	str	w4, [x21, 12]
	b	.L72
	.p2align 3
.L69:
	str	w4, [x21, 8]
	b	.L70
	.p2align 3
.L81:
	mov	w0, 0
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L8:
	ldr	w3, [x29, 92]
	str	w3, [x22, 8]
	b	.L9
	.p2align 3
.L6:
	str	w3, [x22, 4]
	b	.L7
	.p2align 3
.L60:
	str	w3, [x22, 156]
	b	.L61
	.p2align 3
.L58:
	str	w3, [x22, 152]
	b	.L59
	.p2align 3
.L24:
	add	w1, w1, 128
	sub	w23, w23, #16
	sub	w1, w1, w0
	b	.L25
	.p2align 3
.L22:
	ldr	w3, [x29, 92]
	str	w3, [x22, 36]
	b	.L23
	.p2align 3
.L20:
	str	w3, [x22, 32]
	b	.L21
	.p2align 3
.L18:
	ldr	w3, [x29, 92]
	str	w3, [x22, 28]
	b	.L19
	.p2align 3
.L16:
	ldr	w3, [x29, 92]
	str	w3, [x22, 24]
	b	.L17
	.p2align 3
.L14:
	ldr	w3, [x29, 92]
	str	w3, [x22, 20]
	b	.L15
	.p2align 3
.L12:
	ldr	w3, [x29, 92]
	str	w3, [x22, 16]
	b	.L13
	.p2align 3
.L10:
	ldr	w3, [x29, 92]
	str	w3, [x22, 12]
	b	.L11
	.p2align 3
.L56:
	str	w3, [x22, 148]
	b	.L57
	.p2align 3
.L54:
	str	w3, [x22, 144]
	b	.L55
	.p2align 3
.L52:
	str	w3, [x22, 140]
	b	.L53
	.p2align 3
.L50:
	str	w3, [x22, 136]
	b	.L51
	.p2align 3
.L48:
	str	w3, [x22, 132]
	b	.L49
	.p2align 3
.L46:
	str	w3, [x22, 128]
	b	.L47
	.p2align 3
.L44:
	str	w3, [x22, 100]
	b	.L45
	.p2align 3
.L42:
	ldr	w3, [x29, 92]
	str	w3, [x22, 96]
	b	.L43
	.p2align 3
.L40:
	ldr	w3, [x29, 92]
	str	w3, [x22, 92]
	b	.L41
	.p2align 3
.L38:
	ldr	w3, [x29, 92]
	str	w3, [x22, 88]
	b	.L39
	.p2align 3
.L36:
	ldr	w3, [x29, 92]
	str	w3, [x22, 84]
	b	.L37
	.p2align 3
.L34:
	ldr	w3, [x29, 92]
	str	w3, [x22, 80]
	b	.L35
	.p2align 3
.L32:
	str	w3, [x22, 76]
	b	.L33
	.p2align 3
.L30:
	ldr	w3, [x29, 92]
	str	w3, [x22, 72]
	b	.L31
	.p2align 3
.L28:
	str	w3, [x22, 68]
	b	.L29
	.p2align 3
.L26:
	ldr	w3, [x29, 92]
	str	w3, [x22, 64]
	b	.L27
	.p2align 3
.L65:
	add	w0, w0, 256
	str	w0, [x22, 252]
	b	.L66
	.p2align 3
.L63:
	str	w23, [x22, 160]
	b	.L64
.L80:
	ldr	x3, .LC4
	mov	w1, 283
	ldr	x2, .LC65
	bl	dprint_normal
	mov	w0, -1
	b	.L3
.L78:
	ldr	x4, .LC3
	mov	w1, 31
	ldr	x3, .LC4
	mov	w0, 0
	ldr	x2, .LC6
	bl	dprint_normal
	mov	w0, -1
	b	.L3
	.size	VP8HAL_CfgDnMsg, .-VP8HAL_CfgDnMsg
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC4:
	.xword	.LANCHOR0
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC7:
	.xword	g_HwMem
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC66:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8HAL_StartDec
	.type	VP8HAL_StartDec, %function
VP8HAL_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sxtw	x3, w19
	ldr	x1, .LC73
	lsl	x0, x3, 7
	mov	w2, w19
	sub	x3, x0, x3
	mov	x0, x20
	add	x1, x1, x3, lsl 3
	bl	VP8HAL_CfgDnMsg
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP8HAL_StartDec, .-VP8HAL_StartDec
	.align	3
.LC73:
	.xword	g_HwMem
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10351, %object
	.size	__func__.10351, 16
__func__.10351:
	.string	"VP8HAL_CfgDnMsg"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC2:
	ASCII(.string	"can not map down msg virtual address!" )
	.zero	2
.LC5:
	ASCII(.string	"%s: %s\n" )
.LC8:
	ASCII(.string	"D0 = 0x%x\n" )
	.zero	5
.LC10:
	ASCII(.string	"D1 = 0x%x\n" )
	.zero	5
.LC12:
	ASCII(.string	"D2 = 0x%x\n" )
	.zero	5
.LC14:
	ASCII(.string	"D3 = 0x%x\n" )
	.zero	5
.LC16:
	ASCII(.string	"D4 = 0x%x\n" )
	.zero	5
.LC18:
	ASCII(.string	"D5 = 0x%x\n" )
	.zero	5
.LC20:
	ASCII(.string	"D6 = 0x%x\n" )
	.zero	5
.LC22:
	ASCII(.string	"D7 = 0x%x\n" )
	.zero	5
.LC24:
	ASCII(.string	"D8 = 0x%x\n" )
	.zero	5
.LC26:
	ASCII(.string	"D9 = 0x%x\n" )
	.zero	5
.LC28:
	ASCII(.string	"D16 = 0x%x\n" )
	.zero	4
.LC30:
	ASCII(.string	"D17 = 0x%x\n" )
	.zero	4
.LC32:
	ASCII(.string	"D18 = 0x%x\n" )
	.zero	4
.LC34:
	ASCII(.string	"D19 = 0x%x\n" )
	.zero	4
.LC36:
	ASCII(.string	"D20 = 0x%x\n" )
	.zero	4
.LC38:
	ASCII(.string	"D21 = 0x%x\n" )
	.zero	4
.LC40:
	ASCII(.string	"D22 = 0x%x\n" )
	.zero	4
.LC42:
	ASCII(.string	"D23 = 0x%x\n" )
	.zero	4
.LC44:
	ASCII(.string	"D24 = 0x%x\n" )
	.zero	4
.LC46:
	ASCII(.string	"D25 = 0x%x\n" )
	.zero	4
.LC48:
	ASCII(.string	"D32 = 0x%x\n" )
	.zero	4
.LC50:
	ASCII(.string	"D33 = 0x%x\n" )
	.zero	4
.LC52:
	ASCII(.string	"D34 = 0x%x\n" )
	.zero	4
.LC54:
	ASCII(.string	"D35 = 0x%x\n" )
	.zero	4
.LC56:
	ASCII(.string	"D36 = 0x%x\n" )
	.zero	4
.LC58:
	ASCII(.string	"D37 = 0x%x\n" )
	.zero	4
.LC60:
	ASCII(.string	"D38 = 0x%x\n" )
	.zero	4
.LC62:
	ASCII(.string	"D39 = 0x%x\n" )
	.zero	4
.LC64:
	ASCII(.string	"%s: u8Tmp = NULL\n" )
	.zero	6
.LC67:
	ASCII(.string	"D40 = 0x%x\n" )
	.zero	4
.LC69:
	ASCII(.string	"D63 = 0x%x\n" )
	.zero	4
.LC71:
	ASCII(.string	"D%d = 0x%x\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
