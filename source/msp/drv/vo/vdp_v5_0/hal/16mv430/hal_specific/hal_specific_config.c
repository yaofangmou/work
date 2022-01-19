#include "hi_reg_common.h"
#include "drv_disp_hal.h"
#include "drv_disp_com.h"
#include "drv_disp_hal.h"
#include "drv_disp_osal.h"
#include "drv_disp_da.h"
#ifndef __DISP_PLATFORM_BOOT__
#include "drv_win_hal.h"
#include "hi_drv_sys.h"
#include "hi_drv_disp.h"
#endif
#include "hi_register_vdp.h"
#include "vdp_hal_comm.h"
#include "vdp_hal_wbc.h"
#include "vdp_hal_chn.h"
#include "vdp_hal_vid.h"
#include "vdp_software_selfdefine.h"



static DISP_FMT_CFG_S s_stDispFormatParam[] =
{
    /* |--INTFACE---||-----TOP-----||----HORIZON--------||----BOTTOM-----||-PULSE-||-INVERSE-| */
    /* Synm Iop  Itf  Vact Vbb Vfb   Hact  Hbb Hfb      Bvact Bvbb Bvfb  Hpw Vpw Hmid bIdv bIhs bIvs */
    // 0 HI_UNF_ENC_FMT_1080P_60,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 88,      1,   1,  1,     44, 5, 1,  0,  0,  0}, /* 1080P@60Hz */
        //{0x14000000, 0x02002063}, // 1080P60/50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_60, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 6000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 1 HI_UNF_ENC_FMT_1080P_60,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 88,      1,   1,  1,     44, 5, 1,  0,  0,  0}, /* 1080P@60Hz */
        //{0x14000000, 0x02002063}, // 1080P60/50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_60, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 6000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 2 HI_UNF_ENC_FMT_1080P_50,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 528,      1,   1,  1,     44, 5, 1, 0,  0,  0}, /* 1080P@50Hz */
        //{0x14000000, 0x02002063}, // 1080P60/50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_50, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 5000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 3 HI_UNF_ENC_FMT_1080P_30
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 88,       1,   1,  1,    44,  5, 1, 0,  0,  0}, /* 1080P@30Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_30, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 3000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 4 HI_UNF_ENC_FMT_1080P_25,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 528,      1,   1,  1,    44, 5, 1,  0,  0,  0}, /* 1080P@25Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_25, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 2500, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 5 HI_UNF_ENC_FMT_1080P_24 @74.25MHz,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 638,       1,   1,  1,    44, 5, 1, 0,  0,  0}, /* 1080P@24Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_24, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 2400, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    // 6 HI_UNF_ENC_FMT_1080i_60
    {   {1,   0,   2,   540,  20,  2,  1920, 192, 88,  540, 21,  2,    44,  5, 908,   0,  0,  0}, /* 1080I@60Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080i_60, DISP_STEREO_NONE, HI_TRUE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 6000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 7 HI_UNF_ENC_FMT_1080i_50
    {   {1,   0,   2,   540,  20,  2,  1920, 192, 528,  540,  21,  2,   44, 5, 1128,  0,  0,  0}, /* 1080I@50Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080i_50, DISP_STEREO_NONE, HI_TRUE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 5000, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    // 8 HI_UNF_ENC_FMT_720P_60
    {   {1,   1,   2,   720,  25,  5,  1280, 260, 110,      1,   1,  1,    40,  5,  1, 0,  0,  0}, /* 720P@60Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_720P_60, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1280, 720}, {0, 0, 1280, 720}, {16, 9}, 6000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 9 HI_UNF_ENC_FMT_720P_50
    {   {1,   1,   2,   720,  25,  5,  1280, 260, 440,     1,   1,  1,     40, 5,  1,  0,  0,  0}, /* 720P@50Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_720P_50, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1280, 720}, {0, 0, 1280, 720}, {16, 9}, 5000, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    /* Synm Iop  Itf  Vact Vbb Vfb   Hact  Hbb Hfb      Bvact Bvbb Bvfb  Hpw Vpw Hmid bIdv bIhs bIvs */
    // 10 HI_UNF_ENC_FMT_576P_50,
    {   {1,  1,   2,   576,   44,  5,   720, 132, 12,     1,   1,  1,     64, 5,  1,  0,  1,  1}, /* 576P@50Hz */
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001048},
        {HI_DRV_DISP_FMT_576P_50, DISP_STEREO_NONE, HI_FALSE, {0, 0, 720, 576} , {0, 0, 720, 576} , {4, 3},  5000, HI_DRV_CS_BT601_YUV_LIMITED}
    },
    /* |--INTFACE---||-----TOP-----||----HORIZON--------||----BOTTOM-----||-PULSE-||-INVERSE-| */
    /* Synm Iop  Itf  Vact Vbb Vfb   Hact  Hbb Hfb      Bvact Bvbb Bvfb  Hpw Vpw Hmid bIdv bIhs bIvs */
    // 11 HI_UNF_ENC_FMT_480P_60,
#if 1
    {   {1,  1,   2,   480,   36,  9,   720, 122, 16,     1,   1,  1,     62, 6,  1,  0,  1,  1}, /* 480P@60Hz */
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x2001048}, // 1080i50
        {HI_DRV_DISP_FMT_480P_60, DISP_STEREO_NONE, HI_FALSE, {0, 0, 720, 480} , {0, 0, 720, 480} , {4, 3},  6000, HI_DRV_CS_BT601_YUV_LIMITED}
    },
#else
    {   {1,  1,   2,   480,   36,  9,   720 - 16, 122 + 8, 16 + 8,     1,   1,  1,     62, 6,  1,  0,  0,  0}, /* 480P@60Hz */
        DISP_CLOCK_SOURCE_SD0,
        {0x14000000, 0x00002063}, // 1080i50
        {HI_DRV_DISP_FMT_480P_60, DISP_STEREO_NONE, HI_FALSE, {0, 0, 720 - 16, 480} , {0, 0, 720 - 16, 480} , {4, 3},  5994, HI_DRV_CS_BT601_YUV_LIMITED}
    },
#endif

    // 12 HI_UNF_ENC_FMT_PAL
    {   {0,   0,   0,   288,  22,  2,  720, 132, 12,     288,  23,  2,  63 /* 126*/, 3, 300, 0,  1,  1},/* 576I(PAL) */
        DISP_CLOCK_SOURCE_SD0,
        {0x12000000, 0x2001048}, // 1080i50
        {HI_DRV_DISP_FMT_PAL,     DISP_STEREO_NONE, HI_TRUE,  {0, 0, 720, 576} ,  {0, 0, 720, 576} , {4, 3},  5000, HI_DRV_CS_BT601_YUV_LIMITED}
    },
#if 1
    //576I: HDMI输出要求hmid=300, 而YPbPr要求hmid=0,
    //考虑一般用户不会使用HDMI输出576I，所以不支持HDMI_567I输出，选择hmid=0
    // 13 HI_UNF_ENC_FMT_NTSC
    {   {0,   0,   0,   240,  18,  4,   720, 119, 19,     240,  19,  4, 62 /*124*/, 3,  310, 0, 1,  1},/* 480I(NTSC) */
        DISP_CLOCK_SOURCE_SD0,
        {0x12000000, 0x2001048}, // 1080i50
        {HI_DRV_DISP_FMT_NTSC,    DISP_STEREO_NONE, HI_TRUE,  {0, 0, 720, 480} , {0, 0, 720, 480} , {4, 3},  6000, HI_DRV_CS_BT601_YUV_LIMITED},
    },
#else
    {   {0,   0,   0,   240,  18,  4,   720 - 16, 119 + 8, 19 + 8,     240,  19,  4,    124, 3,  0, 0, 0,  0}, /* 480I(NTSC) */
        DISP_CLOCK_SOURCE_SD0,
        {0x24000000, 0x00002063}, // 1080i50
        {HI_DRV_DISP_FMT_NTSC,    DISP_STEREO_NONE, HI_TRUE,  {0, 0, 720 - 16, 480} , {0, 0, 720 - 16, 480} , {4, 3},  5994, HI_DRV_CS_BT601_YUV_LIMITED},
    },
#endif
    //480I: HDMI输出要求hmid=310, 而YPbPr要求hmid=0,
    //考虑一般用户不会使用HDMI输出480I，所以不支持HDMI_480I输出，选择hmid=0

    /* ============================================= */
    // TODO:
    // 14, LCD

    {   {1,   1,   2,   480,  35,  10,  640, 144, 16,       1,   1,  1,      96, 2,  1, 0,  1,  1}, /* 640*480@60Hz */
        DISP_CLOCK_SOURCE_HD0,
        {0x1233336C, 0x0001043}, // 1080i50
        {HI_DRV_DISP_FMT_861D_640X480_60,    DISP_STEREO_NONE, HI_FALSE,  {0, 0, 640, 480} ,  {0, 0, 640, 480}, {16, 9},  6000, HI_DRV_CS_BT709_RGB_FULL}
    },
    //15 HI_UNF_ENC_FMT_PAL_TEST
    {   {0,   0,   2,   288,  22,  2,  1440, 132, 12,    288,  23,  2,    126, 3,  0, 0,  0,  0},/* 576I(PAL) */
        DISP_CLOCK_SOURCE_HD0,
        {0x14ED961F, 0x1047}, // 1080i50
        {HI_DRV_DISP_FMT_NTSC,    DISP_STEREO_NONE, HI_TRUE,  {0, 0, 720, 480} , {0, 0, 720, 480} , {4, 3},  6000, HI_DRV_CS_BT601_YUV_LIMITED}
    },

    /* Synm Iop  Itf  Vact Vbb Vfb   Hact  Hbb Hfb      Bvact Bvbb Bvfb  Hpw Vpw Hmid bIdv bIhs bIvs */
    // 16 HI_UNF_ENC_FMT_1080P_24_FP @74.25MHz,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 638,   1080,  41,  4,   44, 5,   1, 0,  0,  0}, /* 1080P@24Hz */
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x0001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_24_FP, DISP_STEREO_FPK, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 2400, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    // 17 HI_UNF_ENC_FMT_720P_60_FP
    {   {1,   1,   2,   720,  25,  5,  1280, 260, 110,    720,  25,  5,    40,  5,  1,  0,  0,  0}, /* 720P@60Hz */
        DISP_CLOCK_SOURCE_HD0,
        {0x12e6ae6a, 0x001062}, // 1080P60/50
        {HI_DRV_DISP_FMT_720P_60_FP, DISP_STEREO_FPK, HI_FALSE, {0, 0, 1280, 720},  {0, 0, 1280, 720}, {16, 9}, 6000, HI_DRV_CS_BT709_YUV_LIMITED}
    },
    // 18 HI_UNF_ENC_FMT_720P_50_FP
    /* Synm Iop  Itf  Vact Vbb Vfb   Hact  Hbb Hfb      Bvact Bvbb Bvfb  Hpw Vpw Hmid bIdv bIhs bIvs */
    {   {1,   1,   2,   720,  25,  5,  1280, 260, 440,    720,  25,   5,   40,  5,  1, 0,  0,  0}, /* 720P@50Hz */
        DISP_CLOCK_SOURCE_HD0,
        {0x12000000, 0x0001063}, // 1080P60/50
        {HI_DRV_DISP_FMT_720P_50_FP, DISP_STEREO_FPK, HI_FALSE, {0, 0, 1280, 720},  {0, 0, 1280, 720}, {16, 9}, 5000, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    // 19  HI_UNF_ENC_FMT_PAL
    {   {0,   0,   0,   288,  22,  2,  720, 132, 12,     288,  23,  2,  63  /*126*/, 3, 300, 0,  1,  1},/* 576I(PAL) */
        DISP_CLOCK_SOURCE_SD0,
        {0x12000000, 0x0001048}, // 1080i50
        {HI_DRV_DISP_FMT_PAL,     DISP_STEREO_NONE, HI_TRUE,  {0, 0, 720, 576} ,  {0, 0, 720, 576} , {4, 3},  5000, HI_DRV_CS_BT601_YUV_LIMITED}
    },

    //576I: HDMI输出要求hmid=300, 而YPbPr要求hmid=0,
    //考虑一般用户不会使用HDMI输出576I，所以不支持HDMI_567I输出，选择hmid=0
    // 20 HI_UNF_ENC_FMT_NTSC
    {   {0,   0,   0,   240,  18,  4,   720, 119, 19,     240,  19,  4, 62 /*124*/, 3,  310, 0, 1,  1},/* 480I(NTSC) */
        DISP_CLOCK_SOURCE_SD0,
        {0x12FFFB48, 0x1047}, // 1080i50
        {HI_DRV_DISP_FMT_NTSC,    DISP_STEREO_NONE, HI_TRUE,  {0, 0, 720, 480} , {0, 0, 720, 480} , {4, 3},  6000, HI_DRV_CS_BT601_YUV_LIMITED},
    },

#if 1

    // 21 720P  59.94
    {   {1,   1,   2,   720,  25,  5,  1280, 260, 110,      1,   1,  1,    40,  5,  1, 0,  0,  0}, /* 720P@60Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12e6a7f0, 0x001062}, // 1080P60/50
        {HI_DRV_DISP_FMT_720P_59_94, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1280, 720}, {0, 0, 1280, 720}, {16, 9}, 5994, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    //22 1080p 59.94,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 88,      1,   1,  1,     44, 5, 1,  0,  0,  0}, /* 1080P@60Hz */
        //{0x14000000, 0x02002063}, // 1080P60/50
        DISP_CLOCK_SOURCE_HD0,
        {0x12e6a7f0, 0x001062}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_59_94, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 5994, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    //23 1080P 29.97
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 88,       1,   1,  1,    44,  5, 1, 0,  0,  0}, /* 1080P@30Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12e6a7f0, 0x001062}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_29_97, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 2997, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    //24 1080P 23.976,
    {   {1,   1,   2,  1080,  41,  4,  1920, 192, 638,       1,   1,  1,    44, 5, 1, 0,  0,  0}, /* 1080P@24Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12e6a7f0, 0x001062}, // 1080P60/50
        {HI_DRV_DISP_FMT_1080P_23_976, DISP_STEREO_NONE, HI_FALSE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 2397, HI_DRV_CS_BT709_YUV_LIMITED}
    },

    //25  1080i 59.94
    {   {1,   0,   2,   540,  20,  2,  1920, 192, 88,  540, 21,  2,    44,  5, 908,   0,  0,  0}, /* 1080I@60Hz */
        //   {0x24000000, 0x02002063}, // 1080i50
        DISP_CLOCK_SOURCE_HD0,
        {0x12e6a7f0, 0x001062},
        {HI_DRV_DISP_FMT_1080i_59_94, DISP_STEREO_NONE, HI_TRUE, {0, 0, 1920, 1080}, {0, 0, 1920, 1080}, {16, 9}, 5994, HI_DRV_CS_BT709_YUV_LIMITED}
    },

#endif
};

HI_S32 Get_FormatCfgPara(HI_U32 index, DISP_FMT_CFG_S* pstDispFormatParam)
{
    if (index >= sizeof(s_stDispFormatParam)/sizeof(DISP_FMT_CFG_S))
        return HI_FAILURE;

    *pstDispFormatParam = s_stDispFormatParam[index];
    return HI_SUCCESS;
}

#ifndef __DISP_PLATFORM_BOOT__
HI_S32 Chip_Specific_WbcZmeFunc(HI_PQ_ZME_LAYER_E u32LayerId,
                                HI_PQ_ZME_PARA_IN_S* stZmeI,
                                HI_U32     bFirlterEnable)
{
    //DRV_PQ_SetZme(u32LayerId, stZmeI, bFirlterEnable);
    return HI_SUCCESS;
}
#endif

HI_S32 Chip_Specific_Set3DMode(HI_DRV_DISPLAY_E eChn, HI_U32 u32DispId, DISP_FMT_CFG_S* pstCfg)
{
    //pstCfg->stInfo.eDispMode = DISP_STEREO_SBS_HALF;
    switch (pstCfg->stInfo.eDispMode)
    {
        case DISP_STEREO_NONE:
            VDP_DISP_SetDispMode(u32DispId, 0);
            break;

        case DISP_STEREO_FPK:
            VDP_DISP_SetDispMode(u32DispId, 5);
            break;

        case DISP_STEREO_SBS_HALF:
            VDP_DISP_SetDispMode(u32DispId, 1);
            break;

        case DISP_STEREO_TAB:
            VDP_DISP_SetDispMode(u32DispId, 4);
            break;

        case DISP_STEREO_LINE_ALTE:
            VDP_DISP_SetDispMode(u32DispId, 2);
            break;

        default:
            VDP_DISP_SetDispMode(u32DispId, 0);
            break;
    }

    return HI_SUCCESS;
}

HI_S32 Chip_Specific_SetDispMode(HI_U32 u32id, HI_DRV_DISP_STEREO_MODE_E eMode)
{
    /*s40v2 video layer should be set, when 3d set, but cv200 does not need.
     * all the configurations are moved to dhd0.*/
    return HI_SUCCESS;
}


HI_S32 Chip_Specific_ReviseWbcZmeInput(DISP_WBC_E eWbc,
                                       HI_DISP_DISPLAY_INFO_S* pstDispInfo,
                                       HI_U32* u32Width,
                                       HI_U32* u32Height)
{
#ifndef __DISP_PLATFORM_BOOT__

    if (DISP_STEREO_SBS_HALF == pstDispInfo->eDispMode)
       *u32Width = (*u32Width) & 0xfffffffe;
    else if (DISP_STEREO_TAB == pstDispInfo->eDispMode)
        *u32Height = (*u32Height) & 0xfffffffc;

    /*fpk only write left eye, and don't make crop, so we did not revise it.*/
#endif
    return HI_SUCCESS;
}


/*==============================================*/
HI_VOID Chip_Specific_GetVersion(HI_DRV_DISP_VERSION_S* pVersion)
{
    VDP_Disp_GetVdpVersion(&pVersion->u32VersionPartL, &pVersion->u32VersionPartH);
    return;
}

HI_S32 Chip_Specific_SetMixerBgColor(HI_DRV_DISPLAY_E eChn, VDP_BKG_S stBkg)
{
    if (HI_DRV_DISPLAY_1 == eChn)
    {
	VDP_CBM_SetMixerBkg(VDP_CBM_MIX0, stBkg);
	VDP_DISP_SetRegUp(0);
    }
    else
    {
	VDP_CBM_SetMixerBkg(VDP_CBM_MIX1, stBkg);
	VDP_DISP_SetRegUp(1);
    }

    return HI_SUCCESS;
}

HI_S32 Chip_Specific_SetWbc3DInfo(DISP_WBC_E eWbc, HI_DISP_DISPLAY_INFO_S* pstDispInfo, HI_RECT_S* in, HI_RECT_S *out)
{
#ifndef __DISP_PLATFORM_BOOT__
    VDP_DISP_RECT_S stRect = {0};

    if ((HI_NULL == pstDispInfo) || (HI_NULL == in) || (HI_NULL == out))
    {
        HI_ERR_DISP("pstDispInfo or in is null.\n");
        return HI_FAILURE;
    }
    DISP_MEMSET(&stRect, 0, sizeof(VDP_DISP_RECT_S));

    stRect.u32DXS = in->s32X; /*does not support crop now.*/
    stRect.u32DYS = in->s32Y;

    stRect.u32DXL = (HI_U32)in->s32X + out->s32Width;

    if (DISP_STEREO_TAB == pstDispInfo->eDispMode)
    {
        stRect.u32DYL = (HI_U32)in->s32Y + (in->s32Height)/2;
    }
    else
    {
        stRect.u32DYL = (HI_U32)in->s32Y + in->s32Height;
    }

    VDP_WBC_SetCropReso(VDP_LAYER_WBC_HD0, stRect);

    if (pstDispInfo->eDispMode == DISP_STEREO_NONE)
    {
        VDP_WBC_SetThreeMd(VDP_LAYER_WBC_HD0, 0);
    }
    else
    {
        VDP_WBC_SetThreeMd(VDP_LAYER_WBC_HD0, 2);
    }

#endif

    return HI_SUCCESS;
}

#ifndef __DISP_PLATFORM_BOOT__
ISOGENY_MODE_E Chip_Specific_GetIsogenyMode(HI_VOID)
{
    return ISOGENY_WBC_MODE;
}

HI_VOID Chip_Specific_GetPixelRepeatTimesAccordingFmt(HI_DRV_DISPLAY_E enDisp,
                                                                   HI_DRV_DISP_FMT_E eFmt,
                                                                   HI_U32 *pu32PixelRepeatTimes)
{
    /*no matter what fmt,  the pixel repeat times is 1.*/
    *pu32PixelRepeatTimes = 1;
    return;
}


#define TILE_H_STRIDE  256
#define TILE_V_STRIDE  16


HI_S32 Chip_Specific_SetLayerCapability(VIDEO_LAYER_CAPABILITY_S* pstVideoLayerCap)
{
    return HI_SUCCESS;
}
#endif

HI_VOID DISP_HAL_ResetDispState(DISP_CAPA_S* pstDispCapability, DISP_CH_CFG_S* pstDispConfig)
{
    memset(pstDispCapability, 0, sizeof(DISP_CAPA_S) * HI_DRV_DISPLAY_BUTT);

    pstDispCapability[HI_DRV_DISPLAY_0].bSupport = HI_TRUE;
    pstDispCapability[HI_DRV_DISPLAY_0].bHD      = HI_TRUE;
    pstDispCapability[HI_DRV_DISPLAY_0].bWbc    = HI_FALSE;

    pstDispCapability[HI_DRV_DISPLAY_1].bSupport = HI_TRUE;
    pstDispCapability[HI_DRV_DISPLAY_1].bHD      = HI_TRUE;
    pstDispCapability[HI_DRV_DISPLAY_1].bWbc     = HI_TRUE;

    pstDispCapability[HI_DRV_DISPLAY_2].bSupport = HI_FALSE;

    memset(&pstDispConfig[0], 0, sizeof(DISP_CH_CFG_S) * HI_DRV_DISPLAY_BUTT);

    return;
}

HI_S32 Chip_Specific_DispSetMSChnEnable(HI_U32 u32DispIdM, HI_U32 u32DispIdS, HI_U32 u32DelayMs, HI_BOOL bEnalbe)
{

    VDP_DISP_SetIntfEnable(u32DispIdM , bEnalbe);
    //    VDP_DISP_SetIntfEnable(u32DispIdS, bEnalbe);

    VDP_DISP_SetRegUp(u32DispIdM);
    //   VDP_DISP_SetRegUp(u32DispIdS);


    /*Warning: time delay below is neccessary and can't be deleted.
     *you should not delete it when do some performance optimization.
     * when changing format, we should ensure that the dhdx is closed indeed.
     * so time delay is needed.because 1 period may not take effect, two cycle needed. delayms *2
     */
    if (bEnalbe == HI_FALSE)
        DISP_MSLEEP(u32DelayMs*2);

    return HI_SUCCESS;
}

HI_VOID Chip_Specific_GetHdmiVbiPolarity(HI_U32* pu32VsyncPolarityInvert,
        HI_U32* pu32HsyncPolarityInvert)
{
    return ;
}


HI_VOID Chip_Specific_SetSyncInv(HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf, VDP_DISP_SYNCINV_S enInv)
{
    VDP_DISP_SetSyncInv(u32hd_id,enIntf,enInv);
    return ;
}

static HI_VOID ConfigExternalTopPLLDivider(HI_DRV_DISP_FMT_E eFmt)
{
    U_PERI_CRG211 PERI_CRG211;

    switch (eFmt)
    {
        case HI_DRV_DISP_FMT_1080P_30:
        case HI_DRV_DISP_FMT_1080P_25:
        case HI_DRV_DISP_FMT_1080P_24:
        case HI_DRV_DISP_FMT_1080i_60:
        case HI_DRV_DISP_FMT_1080i_50:
        case HI_DRV_DISP_FMT_720P_60:
        case HI_DRV_DISP_FMT_720P_50:
        case HI_DRV_DISP_FMT_720P_59_94:
        case HI_DRV_DISP_FMT_1080P_29_97:
        case HI_DRV_DISP_FMT_1080P_23_976:
        case HI_DRV_DISP_FMT_1080i_59_94:
        case HI_DRV_DISP_FMT_VESA_1024X768_60:
        case HI_DRV_DISP_FMT_VESA_1280X720_60:
        case HI_DRV_DISP_FMT_VESA_1280X800_60:
        case HI_DRV_DISP_FMT_VESA_1360X768_60:
        case HI_DRV_DISP_FMT_VESA_1366X768_60:
        case HI_DRV_DISP_FMT_VESA_1440X900_60_RB:
        case HI_DRV_DISP_FMT_VESA_1600X900_60_RB:
            PERI_CRG211.u32 = g_pstRegCrg->PERI_CRG211.u32;
            PERI_CRG211.bits.vdp_clk_div = 0x3;
            g_pstRegCrg->PERI_CRG211.u32 = PERI_CRG211.u32;
            break;

        case HI_DRV_DISP_FMT_1080P_60:
        case HI_DRV_DISP_FMT_1080P_50:
        case HI_DRV_DISP_FMT_1080P_24_FP:
        case HI_DRV_DISP_FMT_720P_60_FP:
        case HI_DRV_DISP_FMT_720P_50_FP:
        case HI_DRV_DISP_FMT_1080P_59_94:
        case  HI_DRV_DISP_FMT_VESA_1280X1024_60:
        case  HI_DRV_DISP_FMT_VESA_1400X1050_60:
        case  HI_DRV_DISP_FMT_VESA_1440X900_60:
        case HI_DRV_DISP_FMT_VESA_1600X1200_60:
        case HI_DRV_DISP_FMT_VESA_1680X1050_60:
        case HI_DRV_DISP_FMT_VESA_1680X1050_60_RB:
        case HI_DRV_DISP_FMT_VESA_1920X1080_60:
        case HI_DRV_DISP_FMT_VESA_1920X1200_60:
        case HI_DRV_DISP_FMT_VESA_1920X1440_60:
        case HI_DRV_DISP_FMT_VESA_2048X1152_60:
        case HI_DRV_DISP_FMT_VESA_2560X1440_60_RB:
        case HI_DRV_DISP_FMT_VESA_2560X1600_60_RB:

            PERI_CRG211.u32 = g_pstRegCrg->PERI_CRG211.u32;
            PERI_CRG211.bits.vdp_clk_div = 0x1;
            g_pstRegCrg->PERI_CRG211.u32 = PERI_CRG211.u32;
            break;

        case  HI_DRV_DISP_FMT_576P_50:
        case  HI_DRV_DISP_FMT_480P_60:
        case  HI_DRV_DISP_FMT_1440x576i_50:
        case  HI_DRV_DISP_FMT_1440x480i_60:
        case  HI_DRV_DISP_FMT_PAL:
        case  HI_DRV_DISP_FMT_PAL_B:
        case  HI_DRV_DISP_FMT_PAL_B1:
        case  HI_DRV_DISP_FMT_PAL_D:
        case  HI_DRV_DISP_FMT_PAL_D1:
        case  HI_DRV_DISP_FMT_PAL_G:
        case  HI_DRV_DISP_FMT_PAL_H:
        case  HI_DRV_DISP_FMT_PAL_K:
        case  HI_DRV_DISP_FMT_PAL_I:
        case  HI_DRV_DISP_FMT_PAL_N:
        case  HI_DRV_DISP_FMT_PAL_Nc:
        case  HI_DRV_DISP_FMT_PAL_M:
        case  HI_DRV_DISP_FMT_PAL_60:
        case  HI_DRV_DISP_FMT_NTSC:
        case  HI_DRV_DISP_FMT_NTSC_J:
        case  HI_DRV_DISP_FMT_NTSC_443:
        case  HI_DRV_DISP_FMT_SECAM_SIN:
        case  HI_DRV_DISP_FMT_SECAM_COS:
        case  HI_DRV_DISP_FMT_SECAM_L:
        case  HI_DRV_DISP_FMT_SECAM_B:
        case  HI_DRV_DISP_FMT_SECAM_G:
        case  HI_DRV_DISP_FMT_SECAM_D:
        case  HI_DRV_DISP_FMT_SECAM_K:
        case  HI_DRV_DISP_FMT_SECAM_H:
        case  HI_DRV_DISP_FMT_861D_640X480_60:
        case  HI_DRV_DISP_FMT_VESA_800X600_60:
            PERI_CRG211.u32 = g_pstRegCrg->PERI_CRG211.u32;
            PERI_CRG211.bits.vdp_clk_div = 0x7;
            g_pstRegCrg->PERI_CRG211.u32 = PERI_CRG211.u32;
            break;

        case  HI_DRV_DISP_FMT_3840X2160_50:
        case  HI_DRV_DISP_FMT_3840X2160_60:
        case  HI_DRV_DISP_FMT_4096X2160_50:
        case  HI_DRV_DISP_FMT_4096X2160_60:
            PERI_CRG211.u32 = g_pstRegCrg->PERI_CRG211.u32;
            PERI_CRG211.bits.vdp_clk_div = 0;
            g_pstRegCrg->PERI_CRG211.u32 = PERI_CRG211.u32;
            break;

        default:
            PERI_CRG211.u32 = g_pstRegCrg->PERI_CRG211.u32;
            PERI_CRG211.bits.vdp_clk_div = 0x0;
            g_pstRegCrg->PERI_CRG211.u32 = PERI_CRG211.u32;
            break;
    }

    return;
}


static HI_VOID ConfigInternalTopPLLDivider(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_FMT_E eFmt)
{
    switch (eFmt)
    {
        case HI_DRV_DISP_FMT_VESA_1920X1440_60:
        case HI_DRV_DISP_FMT_VESA_2560X1440_60_RB:
        case HI_DRV_DISP_FMT_VESA_2560X1600_60_RB:
            VDP_DISP_SelectChanClkDiv(eChn, CLOCK_DIV_1);
            break;

            /*TODO: VESAtiming should be considered, and config should be considered.*/
        default:
            VDP_DISP_SelectChanClkDiv(eChn, CLOCK_DIV_2);
            break;
    }

    return;
}

static HI_VOID ConfigVdpAndHdmiPLLDivider(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_FMT_E eFmt)
{

    U_PERI_CRG54 PERI_CRG54Tmp;
    PERI_CRG54Tmp.u32  = g_pstRegCrg->PERI_CRG54.u32;

    if ((eFmt >= HI_DRV_DISP_FMT_PAL )
        && (eFmt <= HI_DRV_DISP_FMT_1440x480i_60 )
       )
    {
        /*if SD format  : select clk_vo_xd : clk_hdmi  1:2 */
        if (HI_DRV_DISPLAY_0 == eChn)
        {
            PERI_CRG54Tmp.bits.vo_sd_hdmi_clk_sel = CLK_HDMI_VO_1_2;
        }
        else
        {
            PERI_CRG54Tmp.bits.vo_hd_hdmi_clk_sel = CLK_HDMI_VO_1_2;
        }

        g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;
    }
    else
    {
        /*if not SD format  : select clk_vo_xd : clk_hdmi  1:1 */
        if (HI_DRV_DISPLAY_0 == eChn)
        {
            PERI_CRG54Tmp.bits.vo_sd_hdmi_clk_sel = CLK_HDMI_VO_1_1;
        }
        else
        {
            PERI_CRG54Tmp.bits.vo_hd_hdmi_clk_sel = CLK_HDMI_VO_1_1;
        }

        g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;
    }

    return;
}


static HI_S32 SelectChannelPllSource(HI_DRV_DISPLAY_E eChn,
        HI_U32* puPllIndex,
        HI_DRV_DISP_FMT_E eFmt)
{
    U_PERI_CRG54 PERI_CRG54Tmp;

#ifdef HI_DISP_DOUBLE_HD_SUPPORT

    if (HI_DRV_DISPLAY_1 == eChn)
    {
        *puPllIndex = DISP_CLOCK_SOURCE_HD0;
    }
    else
    {
        *puPllIndex = DISP_CLOCK_SOURCE_HD1;
    }

#else

    if (HI_DRV_DISPLAY_0 == eChn)
    {
        *puPllIndex = DISP_CLOCK_SOURCE_SD0;
    }
    else if (HI_DRV_DISPLAY_1 == eChn)
    {
        *puPllIndex = DISP_CLOCK_SOURCE_HD0;
    }

#endif

    PERI_CRG54Tmp.u32 = g_pstRegCrg->PERI_CRG54.u32;

    if (HI_DRV_DISPLAY_0 == eChn)
    {
#ifdef VDP_ISOGENY_SUPPORT
        PERI_CRG54Tmp.bits.vo_sd_clk_sel = *puPllIndex;
#endif
    }
    else
    {
        PERI_CRG54Tmp.bits.vo_hd_clk_sel = *puPllIndex;
    }

    g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;

    return HI_SUCCESS;
}

static HI_VOID ConfigVdpWorkClk(HI_DRV_DISPLAY_E eChn)
{
    VDP_SelectClk(VDP_CLK_MODE_240MHZ);
    return;
}

HI_VOID  Chip_Specific_DispSetPll(DISP_PLL_SOURCE_E enPllIndex, HI_U32 u32PllxReg0, HI_U32 u32PllxReg1)
{
    if (DISP_CLOCK_SOURCE_HD0 == enPllIndex)
    {
        U_PERI_CRG_PLL10 PERI_CRG10Tmp;
        U_PERI_CRG_PLL11 PERI_CRG11Tmp;

        PERI_CRG10Tmp.u32 = g_pstRegCrg->PERI_CRG_PLL10.u32;
        PERI_CRG10Tmp.bits.hpll_ctrl0 = u32PllxReg0;
        g_pstRegCrg->PERI_CRG_PLL10.u32 = PERI_CRG10Tmp.u32;

        PERI_CRG11Tmp.u32 = g_pstRegCrg->PERI_CRG_PLL11.u32;
        PERI_CRG11Tmp.bits.hpll_ctrl1 = u32PllxReg1;
        g_pstRegCrg->PERI_CRG_PLL11.u32 = PERI_CRG11Tmp.u32;
    }
    else  if (DISP_CLOCK_SOURCE_HD1 == enPllIndex)
    {
        /*pay attention, no pll16/pll17.*/
    }
    else  if (DISP_CLOCK_SOURCE_SD0 == enPllIndex)
    {
        /*do nothing*/
    }

}

HI_VOID  Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_E eChn, HI_VDP_CLOCK_WORK_CLK_E eWorkClk)
{
#if 0
    U_PERI_CRG211 unTmpCRG211Value;
    unTmpCRG211Value.u32 = g_pstRegCrg->PERI_CRG211.u32;

    if (HI_DRV_DISPLAY_1 == eChn)
    {
        switch (eWorkClk)
        {
            case VDP_CLOCK_WORK_CLK_ALL:

                /*hd_ppc :   0 :clk_vdp_ini   1:clk_vdp_ini  1/2 or 1/4 */
                unTmpCRG211Value.bits.vdp_ini_cksel0 = 0;
                /*hd_ppc  from clk_vdp_ini  div :   0 :1/2   1: 1/4 */
                unTmpCRG211Value.bits.vdp_hd_clk_div0 = 1;
                break;

            case VDP_CLOCK_WORK_CLK_HALF:

                unTmpCRG211Value.bits.vdp_ini_cksel0 = 1;
                unTmpCRG211Value.bits.vdp_hd_clk_div0 = 0;

                break;

            case VDP_CLOCK_WORK_CLK_QUARTER:

                unTmpCRG211Value.bits.vdp_ini_cksel0 = 1;
                unTmpCRG211Value.bits.vdp_hd_clk_div0 = 1;

                break;

            default:

                unTmpCRG211Value.bits.vdp_ini_cksel0 = 0;
                unTmpCRG211Value.bits.vdp_hd_clk_div0 = 1;

                break;
        }
    }
#ifdef VDP_ISOGENY_SUPPORT
    else if (HI_DRV_DISPLAY_0 == eChn)
    {
        switch (eWorkClk)
        {
            case VDP_CLOCK_WORK_CLK_ALL:

                unTmpCRG211Value.bits.vdp_ini_cksel1 = 0;
                unTmpCRG211Value.bits.vdp_hd_clk_div1 = 1;

                break;

            case VDP_CLOCK_WORK_CLK_HALF:

                unTmpCRG211Value.bits.vdp_ini_cksel1 = 1;
                unTmpCRG211Value.bits.vdp_hd_clk_div1 = 0;

                break;

            case VDP_CLOCK_WORK_CLK_QUARTER:

                unTmpCRG211Value.bits.vdp_ini_cksel1 = 1;
                unTmpCRG211Value.bits.vdp_hd_clk_div1 = 1;

                break;

            default:

                unTmpCRG211Value.bits.vdp_ini_cksel1 = 0;
                unTmpCRG211Value.bits.vdp_hd_clk_div1 = 1;

                break;
        }
    }
#endif
    else
    {
        HI_ERR_DISP("para wrong\n");
    }

    g_pstRegCrg->PERI_CRG211.u32 = unTmpCRG211Value.u32;
#endif
}

HI_VOID  Chip_Specific_DispSetClkLowPower(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_FMT_E eFmt)
{
    /*only  HD set low power mode*/
    if (HI_DRV_DISPLAY_1 != eChn)
        return;

    /*1  :enable auto clk gate*/
    VDP_SetClkGateEn(HI_TRUE);

    /*2 : set Asic Mem clk,depend on Asic craftsmanship.
        for example 28ns*/
    //VDP_SetVDPMemLowPower();//no need cfg memspeed

    /*3 : select VDP work clk ;depend on fmt */
    switch (eFmt)
    {
        case HI_DRV_DISP_FMT_3840X2160_50:
        case HI_DRV_DISP_FMT_4096X2160_50:
        case HI_DRV_DISP_FMT_3840X2160_60:
        case HI_DRV_DISP_FMT_4096X2160_60:

            /*3d FB mode not lowpower */
        case HI_DRV_DISP_FMT_1080P_24_FP:
        case HI_DRV_DISP_FMT_720P_60_FP:
        case HI_DRV_DISP_FMT_720P_50_FP:

            Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_1, VDP_CLOCK_WORK_CLK_ALL);
#ifdef VDP_ISOGENY_SUPPORT
            Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_0, VDP_CLOCK_WORK_CLK_HALF);
#endif
            break;

        default:
            Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_1, VDP_CLOCK_WORK_CLK_HALF);
#ifdef VDP_ISOGENY_SUPPORT
            Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_0, VDP_CLOCK_WORK_CLK_QUARTER);
#endif

            break;
    }

    /*closed lowpower*/
    Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_1, VDP_CLOCK_WORK_CLK_ALL);
#ifdef VDP_ISOGENY_SUPPORT
    Chip_Specific_DispSetVDPWorkClk(HI_DRV_DISPLAY_0, VDP_CLOCK_WORK_CLK_HALF);
#endif

}


static HI_VOID ConfigExternalPllCoefAndDevider(HI_DRV_DISPLAY_E eChn,
                                                      DISP_FMT_CFG_S *pstCfg)
{
    if (HI_DRV_DISPLAY_1 == eChn)
    {
        /*1, config  hpll to get the hpll's clk.  */
        Chip_Specific_DispSetPll(pstCfg->enPllIndex, pstCfg->u32Pll[0], pstCfg->u32Pll[1]);
        /*2, config vdp2 to get vpd's input clk from hpll through doing a divider,
               *hdmi phy  get a input clk from hpll, without dividing.*/
        ConfigExternalTopPLLDivider(pstCfg->stInfo.eFmt);
    }

    return;
}

HI_VOID Chip_Specific_DispSetChanClk(HI_DRV_DISPLAY_E eChn, DISP_FMT_CFG_S* pstCfg)
{
    /*1st select the hd/sd channel's pll source.*/
    SelectChannelPllSource(eChn, &pstCfg->enPllIndex, pstCfg->stInfo.eFmt);

    /*2 config external pll  and divider.*/
    ConfigExternalPllCoefAndDevider(eChn, pstCfg);

    /*3, to config the internal pll divider,   because hdate and vdp may have a different clk.*/
    ConfigInternalTopPLLDivider(eChn, pstCfg->stInfo.eFmt);

    /*4, config the vdp/hdmi pll divider, since in  pal/ntsc scene, 1:2 upsample is needed.*/
    ConfigVdpAndHdmiPLLDivider(eChn, pstCfg->stInfo.eFmt);

    /*5 config the work clk.*/
    ConfigVdpWorkClk(eChn);

    /*6 config the low power reg.*/
    Chip_Specific_DispSetClkLowPower(eChn, pstCfg->stInfo.eFmt);

    return;
}


#define VDP_CBM_ZORDER_NO    2
#define VDP_MIX_VIDEO    0
#define VDP_MIX_GFX   1
#define VDP_MIXv0_LayerCNT    2
#define VDP_MIXv1_LayerCNT    1
#define VDP_MIXg1_LayerCNT    2

static HI_DRV_DISP_LAYER_E s_CBM_Zorder[HI_DRV_DISPLAY_BUTT][VDP_CBM_ZORDER_NO];

static VDP_LAYER_VID_E s_MIXv1_Zorder[VDP_LAYER_VID_BUTT] =
{
    VDP_LAYER_SD0,
};

static VDP_CBM_LAYER_E s_MIXg1_Zorder[VDP_CBM_BUTT] =
{
    VDP_CBM_GP1,
    VDP_CBM_GFX3
};


HI_S32 Chip_Specific_CBM_SetDispZorder(HI_DRV_DISPLAY_E enDisp)
{
    HI_U32 i, j = 0;
    VDP_CBM_MIX_E eMixId = VDP_CBM_MIX0;
    HI_U32 MixArray[VDP_CBM_BUTT];
    memset(MixArray, 0 , sizeof(HI_U32)*VDP_CBM_BUTT);

    if (HI_DRV_DISPLAY_1 == enDisp)
    {
        eMixId = VDP_CBM_MIX0;
        j = 2;

        if (s_CBM_Zorder[HI_DRV_DISPLAY_1][1] == VDP_MIX_GFX)
        {
            MixArray[1] = VDP_CBM_GP0;
            MixArray[0] = VDP_CBM_VP0;
        }
        else
        {
            MixArray[1] = VDP_CBM_VP0;
            MixArray[0] = VDP_CBM_GP0;
        }
    }
    else if (HI_DRV_DISPLAY_0 == enDisp)
    {
        eMixId = VDP_CBM_MIX1;
        j = 0;

        if (s_CBM_Zorder[HI_DRV_DISPLAY_0][1] == VDP_MIX_GFX)
        {
            for (i = 0; i < VDP_MIXv1_LayerCNT; i++)
            {
                MixArray[j] = s_MIXv1_Zorder[i];
                j++;
            }

            for (i = 0; i < VDP_MIXg1_LayerCNT; i++)
            {
                MixArray[j] = s_MIXg1_Zorder[i];
                j++;
            }
        }
        else
        {
            for (i = 0; i < VDP_MIXg1_LayerCNT; i++)
            {
                MixArray[j] = s_MIXg1_Zorder[i];
                j++;
            }

            for (i = 0; i < VDP_MIXv1_LayerCNT; i++)
            {
                MixArray[j] = s_MIXv1_Zorder[i];
                j++;
            }
        }
    }
    else
    {
        HI_ERR_DISP("Invalid enDisp->%d\n",enDisp);
        return HI_FAILURE;
    }

    /*set zorder */
    for ( i = 0; i < j; i++)
    {
        VDP_CBM_SetMixerPrio(eMixId, MixArray[i], i);
    }

    return HI_SUCCESS;
}


HI_S32 Chip_Specific_CBM_MovTOP(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_LAYER_E enLayer)
{
    if (HI_DRV_DISP_LAYER_VIDEO == enLayer)
    {
        s_CBM_Zorder[enDisp][1] = VDP_MIX_VIDEO;
        s_CBM_Zorder[enDisp][0] = VDP_MIX_GFX;
    }
    else if (HI_DRV_DISP_LAYER_GFX == enLayer)
    {
        s_CBM_Zorder[enDisp][1]  = VDP_MIX_GFX;
        s_CBM_Zorder[enDisp][0]  = VDP_MIX_VIDEO;
    }
    else
    {
        HI_ERR_DISP("para wrong\n");
        return HI_FAILURE;
    }

    Chip_Specific_CBM_SetDispZorder(enDisp);

    return HI_SUCCESS;
}

HI_S32 Chip_Specific_DISP_OpenClock(HI_VOID)
{
    /* open clock and reset vdp module*/
    U_PERI_CRG54 unTmpValue;

    unTmpValue.u32 = g_pstRegCrg->PERI_CRG54.u32;

    if (   unTmpValue.bits.vou_srst_req
           || (!unTmpValue.bits.vo_bus_cken)
       )
    {
        VDP_OpenClkAndInitCrgConfig();
    }

    return HI_SUCCESS;
}

/*to be confirmed: the clock reset is right or not?
 *should all the clock bit be set to 0?
 */
HI_S32 Chip_Specific_DISP_CloseClock(HI_VOID)
{
    VDP_CloseClkResetModule();
    return HI_SUCCESS;
}

/*to be confirmed: the clock reset is right or not?
 *should all the clock bit be set to 0?
 */
HI_S32 Chip_Specific_DISP_ConfigP2I(HI_U32 u32DispId, HI_BOOL bProgressive)
{
    VDP_DISP_SetProToInterEnable(u32DispId, 0);
    return HI_SUCCESS;
}
