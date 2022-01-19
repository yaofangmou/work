#ifndef _VPSS_MAC_DEFINE_H_
#define _VPSS_MAC_DEFINE_H_

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

typedef enum
{
    VPSS_MAC_RCHN_P1 = 0  ,
    VPSS_MAC_RCHN_P2      ,
    VPSS_MAC_RCHN_P3      ,
    VPSS_MAC_RCHN_DI_RST  ,
    VPSS_MAC_RCHN_DM_CNT  ,
    VPSS_MAC_RCHN_NR_RMAD ,
    VPSS_MAC_RCHN_SNR_RMAD,
    VPSS_MAC_RCHN_RPRJH   ,
    VPSS_MAC_RCHN_RPRJV   ,
    VPSS_MAC_RCHN_P2RGMV  ,
    VPSS_MAC_RCHN_P1RGMV  ,

    VPSS_MAC_RCHN_BUTT
} VPSS_MAC_RCHN_E;

typedef enum
{
    VPSS_MAC_WCHN_NR_RFR = 0,
    VPSS_MAC_WCHN_VPSS_OUT ,
    VPSS_MAC_WCHN_DI_WST   ,
    VPSS_MAC_WCHN_DM_CNT   ,
    VPSS_MAC_WCHN_NR_WMAD  ,
    VPSS_MAC_WCHN_WPRJH    ,
    VPSS_MAC_WCHN_WPRJV    ,
    VPSS_MAC_WCHN_CFRGMV   ,

    VPSS_MAC_WCHN_BUTT
} VPSS_MAC_WCHN_E;

typedef enum
{
    VPSS_DITHER_MODE_RAND  = 0,
    VPSS_DITHER_MODE_ROUND ,
    VPSS_DITHER_MODE_BUTT
}VPSS_DITHER_MODE_E;

//-------------------------------------------------------
// VPSS READ IMG BASE REGISTER
//-------------------------------------------------------
/* Define the union U_VPSS_BASE_RD_IMG_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    format               : 4   ; /* [3..0]  */
        unsigned int    type                 : 4   ; /* [7..4]  */
        unsigned int    order                : 4   ; /* [11..8]  */
        unsigned int    bitw                 : 4   ; /* [15..12]  */
        unsigned int    dcmp_mode            : 3   ; /* [18..16]  */
        unsigned int    mute_mode            : 1   ; /* [19]  */
        unsigned int    uv_invert            : 1   ; /* [20]  */
        unsigned int    mirror               : 1   ; /* [21]  */
        unsigned int    flip                 : 1   ; /* [22]  */
        unsigned int    lm_rmode             : 3   ; /* [25..23]  */
        unsigned int    b_bypass             : 1   ; /* [26]  */
        unsigned int    h_bypass             : 1   ; /* [27]  */
        unsigned int    d_bypass             : 1   ; /* [28]  */
        unsigned int    mute_en              : 1   ; /* [29]  */
        unsigned int    tunl_en              : 1   ; /* [30]  */
        unsigned int    en                   : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_VPSS_BASE_RD_IMG_CTRL;

//-------------------------------------------------------
// VPSS READ SOLO BASE REGISTER
//-------------------------------------------------------
/* Define the union U_VPSS_BASE_RD_SOLO_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0           : 19  ; /* [18..0]  */
        unsigned int    mute_mode            : 1   ; /* [19]  */
        unsigned int    reserved_1           : 1   ; /* [20]  */
        unsigned int    mirror               : 1   ; /* [21]  */
        unsigned int    flip                 : 1   ; /* [22]  */
        unsigned int    reserved_2           : 4   ; /* [26..23]  */
        unsigned int    en1                  : 1   ; /* [27]  */
        unsigned int    d_bypass             : 1   ; /* [28]  */
        unsigned int    mute_en              : 1   ; /* [29]  */
        unsigned int    tunl_en              : 1   ; /* [30]  */
        unsigned int    en                   : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_VPSS_BASE_RD_SOLO_CTRL;
//-------------------------------------------------------
// VPSS WRITE IMG BASE REGISTER
//-------------------------------------------------------
/* Define the union U_VPSS_BASE_WR_IMG_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    format               : 4   ; /* [3..0] env */
        unsigned int    type                 : 4   ; /* [7..4]   */
        unsigned int    bitw                 : 4   ; /* [11..8]  */
        unsigned int    cmp_mode             : 4   ; /* [15..12] */
        unsigned int    uv_invert            : 1   ; /* [16]  */
        unsigned int    mirror               : 1   ; /* [17]  */
        unsigned int    flip                 : 1   ; /* [18]  */
        unsigned int    dither_en            : 1   ; /* [19]  */
        unsigned int    dither_mode          : 1   ; /* [20]  */
        unsigned int    lm_rmode             : 3   ; /* [23..21] env */
        unsigned int    mute_mode            : 1   ; /* [24]  */
        unsigned int    mute_en              : 1   ; /* [25]  */
        unsigned int    cts_en               : 1   ; /* [26]  */
        unsigned int    cts_bit_sel          : 1   ; /* [27]  */
        unsigned int    h_bypass             : 1   ; /* [28]  */
        unsigned int    d_bypass             : 1   ; /* [29]  */
        unsigned int    tunl_en              : 1   ; /* [30]  */
        unsigned int    en                   : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_VPSS_BASE_WR_IMG_CTRL;
//-------------------------------------------------------
// VPSS WRITE SOLO BASE REGISTER
//-------------------------------------------------------
/* Define the union U_VPSS_BASE_WR_SOLO_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0           : 17  ; /* [16..0]  */
        unsigned int    mirror               : 1   ; /* [17]  */
        unsigned int    flip                 : 1   ; /* [18]  */
        unsigned int    reserved_1           : 5   ; /* [23..19]  */
        unsigned int    mute_mode            : 1   ; /* [24]  */
        unsigned int    mute_en              : 1   ; /* [25]  */
        unsigned int    reserved_2           : 3   ; /* [28..26]  */
        unsigned int    d_bypass             : 1   ; /* [29]  */
        unsigned int    tunl_en              : 1   ; /* [30]  */
        unsigned int    en                   : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_VPSS_BASE_WR_SOLO_CTRL;
typedef struct
{
    U_VPSS_BASE_RD_IMG_CTRL         VPSS_BASE_RD_IMG_CTRL               ; /* 0x00 */
} S_VPSS_BASE_RD_IMG_REGS_TYPE;

typedef struct
{
    U_VPSS_BASE_RD_SOLO_CTRL        VPSS_BASE_RD_SOLO_CTRL      ; /* 0x00 */
} S_VPSS_BASE_RD_SOLO_REGS_TYPE;

typedef struct
{
    U_VPSS_BASE_WR_IMG_CTRL         VPSS_BASE_WR_IMG_CTRL       ; /* 0x00 */
} S_VPSS_BASE_WR_IMG_REGS_TYPE;

typedef struct
{
    U_VPSS_BASE_WR_SOLO_CTRL        VPSS_BASE_WR_SOLO_CTRL      ; /* 0x00 */
} S_VPSS_BASE_WR_SOLO_REGS_TYPE;

#define VPSS_RCHN_MAX ((HI_U32)(VPSS_MAC_RCHN_BUTT))
#define VPSS_WCHN_MAX ((HI_U32)(VPSS_MAC_WCHN_BUTT))
#define VPSS_RCHN_IMG_START_OFFSET  (gu32VpssRchnAddr[VPSS_MAC_RCHN_P1])
#define VPSS_WCHN_IMG_START_OFFSET  (gu32VpssWchnAddr[VPSS_MAC_WCHN_NR_RFR])
#define VPSS_RCHN_SOLO_START_OFFSET (gu32VpssRchnAddr[VPSS_MAC_RCHN_DI_RST])
#define VPSS_WCHN_SOLO_START_OFFSET (gu32VpssWchnAddr[VPSS_MAC_WCHN_DI_WST])

extern const HI_U32 gu32VpssRchnAddr[VPSS_RCHN_MAX];
extern const HI_U32 gu32VpssWchnAddr[VPSS_WCHN_MAX];
HI_U32  VpssGetWchnDataWidth (VPSS_MAC_WCHN_E enLayer);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
