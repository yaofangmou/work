
/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_disp_hal.c
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2012/12/30
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include "hi_reg_common.h"
#include "drv_disp_com.h"
#include "drv_disp_hal.h"
#include "drv_disp_osal.h"
#include "drv_disp_da.h"

#include "drv_display.h"
#include "drv_xdr_adapter.h"
#include "hal_xdr_policy.h"
#include "vdp_drv_comm.h"

#ifndef __DISP_PLATFORM_BOOT__
#include "hi_drv_sys.h"
#endif

#include "vdp_hal_chn.h"
#ifdef CFG_VDP_MMU_SUPPORT
#include "drv_vdp_smmu.h"
#endif
#include "drv_disp_hal_adp.h"
#include "hi_register_vdp.h"
#include "vdp_software_selfdefine.h"
#include "vdp_hal_wbc.h"
#include "vdp_hal_chn.h"
#include "vdp_hal_vid.h"
#include "vdp_hal_gfx.h"
#include "drv_cgms.h"
#include "vdp_drv_vid.h"


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */


/*==========================================
     VDP / SYS / VDAC phy-address
*/
/*==========================================
     HAL global parameters
*/
S_VDP_REGS_TYPE *g_pstVdpBaseAddr = 0;

static HI_S32 s_DispIntfFlag = 0;
static DISP_CAPA_S s_stDispCapability[HI_DRV_DISPLAY_BUTT];
static DISP_CH_CFG_S s_stDispConfig[HI_DRV_DISPLAY_BUTT];

static HI_DRV_DISP_VERSION_S s_stVersion = {0};
static DISP_INTF_OPERATION_S s_stIntfOps = {0};

/*==========================================
    HAL module
*/
static DISP_LOCAL_INTF_S s_stHalIntf[HI_DRV_DISP_INTF_ID_MAX];
//static DISP_LOCAL_VDAC_S s_stHalVEnc[DISP_VENC_MAX];
static DISP_LOCAL_VDAC_S s_stHalVDac[HI_DISP_VDAC_MAX_NUMBER];
static DISP_LOCAL_WBC_S  s_stWBC[DISP_WBC_BUTT];
static HI_DRV_VDAC_ATTR_S g_stVDACAttr;

#define DISP_CLOCK_SOURCE_SD0  0
#define DISP_CLOCK_SOURCE_HD0  1
#define DISP_CLOCK_SOURCE_HD1  2
#define DEF_VDP_REG_SIZE sizeof(S_VDP_REGS_TYPE)
DISP_MMZ_BUF_S   g_RegBackBuf;

HI_VOID PF_DispIntfYpbpyReset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg);
HI_VOID PF_DispIntfRgb0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg);
HI_VOID PF_DispIntfCvbs0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg);
HI_VOID PF_DispIntfSvideoReset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg);
HI_VOID PF_DispIntfVga0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg);
HI_VOID PF_DispIntfHdmi0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg);

static const  DISP_INTF_INFO_S  s_aIntfResetFunctionTable[] =
{
    {PF_DispIntfYpbpyReset, HI_DRV_DISP_INTF_YPBPR0},/*HI_DRV_DISP_INTF_YPBPR0*/
    {PF_DispIntfRgb0Reset, HI_DRV_DISP_INTF_RGB0},/*HI_DRV_DISP_INTF_RGB0*/
    {PF_DispIntfSvideoReset, HI_DRV_DISP_INTF_SVIDEO0},/*HI_DRV_DISP_INTF_SVIDEO0*/
    {PF_DispIntfCvbs0Reset, HI_DRV_DISP_INTF_CVBS0},/*HI_DRV_DISP_INTF_CVBS0*/
    {PF_DispIntfVga0Reset, HI_DRV_DISP_INTF_VGA0},/*HI_DRV_DISP_INTF_VGA0*/
    {PF_DispIntfHdmi0Reset, HI_DRV_DISP_INTF_HDMI0}/*HI_DRV_DISP_INTF_HDMI0*/
};

#ifndef __DISP_PLATFORM_BOOT__
static MASK_AND_RESTORE_GFX_STATUS_E gs_enGfxProcessStatus = MASK_AND_RESTORE_GFX_COMPLETE;
#endif

static HI_U32 g_u32DispFmtArray[][2] =
{
    {HI_DRV_DISP_FMT_1080P_60, 1},
    {HI_DRV_DISP_FMT_1080P_50, 2},
    {HI_DRV_DISP_FMT_1080P_30, 3},
    {HI_DRV_DISP_FMT_1080P_25, 4},
    {HI_DRV_DISP_FMT_1080P_24, 5},
    {HI_DRV_DISP_FMT_1080i_60, 6},
    {HI_DRV_DISP_FMT_1080i_50, 7},
    {HI_DRV_DISP_FMT_720P_60, 8},
    {HI_DRV_DISP_FMT_720P_50, 9},
    {HI_DRV_DISP_FMT_576P_50, 10},
    {HI_DRV_DISP_FMT_480P_60, 11},
    {HI_DRV_DISP_FMT_PAL      ,     12},
    {HI_DRV_DISP_FMT_PAL_B    ,     12},
    {HI_DRV_DISP_FMT_PAL_B1   ,     12},
    {HI_DRV_DISP_FMT_PAL_D    ,     12},
    {HI_DRV_DISP_FMT_PAL_D1   ,     12},
    {HI_DRV_DISP_FMT_PAL_G    ,     12},
    {HI_DRV_DISP_FMT_PAL_H    ,     12},
    {HI_DRV_DISP_FMT_PAL_K    ,     12},
    {HI_DRV_DISP_FMT_PAL_I    ,     12},
    {HI_DRV_DISP_FMT_PAL_N    ,     12},
    {HI_DRV_DISP_FMT_PAL_Nc   ,     12},
    {HI_DRV_DISP_FMT_SECAM_SIN,     12},
    {HI_DRV_DISP_FMT_SECAM_COS,     12},
    {HI_DRV_DISP_FMT_SECAM_L  ,     12},
    {HI_DRV_DISP_FMT_SECAM_B  ,     12},
    {HI_DRV_DISP_FMT_SECAM_G  ,     12},
    {HI_DRV_DISP_FMT_SECAM_D  ,     12},
    {HI_DRV_DISP_FMT_SECAM_K  ,     12},
    {HI_DRV_DISP_FMT_SECAM_H  ,     12},
    {HI_DRV_DISP_FMT_PAL_M  ,       13},
    {HI_DRV_DISP_FMT_PAL_60  ,      13},
    {HI_DRV_DISP_FMT_NTSC  ,        13},
    {HI_DRV_DISP_FMT_NTSC_J  ,      13},
    {HI_DRV_DISP_FMT_NTSC_443  ,    13},
    {HI_DRV_DISP_FMT_861D_640X480_60, 14},
    {HI_DRV_DISP_FMT_1080P_24_FP, 16},
    {HI_DRV_DISP_FMT_720P_60_FP, 17},
    {HI_DRV_DISP_FMT_720P_50_FP, 18},
    {HI_DRV_DISP_FMT_1440x576i_50, 19},
    {HI_DRV_DISP_FMT_1440x480i_60, 20},
    {HI_DRV_DISP_FMT_720P_59_94, 21},
    {HI_DRV_DISP_FMT_1080P_59_94, 22},
    {HI_DRV_DISP_FMT_1080P_29_97, 23},
    {HI_DRV_DISP_FMT_1080P_23_976, 24},
    {HI_DRV_DISP_FMT_1080i_59_94,  25},
    {HI_DRV_DISP_FMT_CUSTOM, 0},
};


static HI_S32 HAL_Set3DMode(HI_DRV_DISPLAY_E eChn, HI_U32 u32DispId, DISP_FMT_CFG_S *pstCfg)
{
    return Chip_Specific_Set3DMode(eChn, u32DispId, pstCfg);
}

static HI_VOID Calculate_FmtPixelClk(HI_DRV_DISP_TIMING_S *pstTiming)
{
    HI_U64 u64Tmp = 0, u64Result = 0;

    u64Tmp = ((HI_U64)(pstTiming->u32HBB + pstTiming->u32HACT + pstTiming->u32HFB)
              * (HI_U64)(pstTiming->u32VBB + pstTiming->u32VACT + pstTiming->u32VFB)
              * (HI_U64)pstTiming->u32VertFreq);

    (HI_VOID)DISP_OS_DIV64(u64Tmp, 100000, &u64Result);

    pstTiming->u32PixFreq = (HI_U32)u64Result;
    return ;
}

HI_S32 DispHalGetEnFmtIndex(HI_DRV_DISP_FMT_E eFmt,  HI_U32 *pu32Index)
{
    HI_U32 u32MappingIndex = 0;

    *pu32Index = -1;

    if (eFmt > HI_DRV_DISP_FMT_CUSTOM)
    {
        DISP_ERROR("eFmt out of range.\n");
        return HI_FAILURE;
    }

    for (u32MappingIndex = 0; u32MappingIndex < sizeof(g_u32DispFmtArray) / sizeof(g_u32DispFmtArray[0]); u32MappingIndex++)
    {
        if (eFmt == g_u32DispFmtArray[u32MappingIndex][0])
        {
            *pu32Index =  g_u32DispFmtArray[u32MappingIndex][1];
            break;
        }
    }

    if (u32MappingIndex > sizeof(g_u32DispFmtArray) / sizeof(g_u32DispFmtArray[0]))
    {
        DISP_ERROR("Failed to search efmt:%d, Array size:%d, %d!\n", eFmt, sizeof(g_u32DispFmtArray), sizeof(g_u32DispFmtArray[0]));
        return HI_ERR_DISP_NOT_SUPPORT_FMT;
    }

    if (-1 == *pu32Index)
    {
        DISP_ERROR("No support Fmt");
        return HI_ERR_DISP_NOT_SUPPORT_FMT;
    }

    return HI_SUCCESS;
}
/********************************************/
/* usual */

HI_S32 DISP_HAL_GetEncFmtPara(HI_DRV_DISP_FMT_E eFmt, DISP_HAL_ENCFMT_PARAM_S *pstFmtPara)
{
    HI_U32 index = 0;
    HI_S32 Ret = HI_FAILURE;
    DISP_FMT_CFG_S stDispFormatParam;

    Ret = DispHalGetEnFmtIndex(eFmt, &index);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }

    if (HI_SUCCESS != Get_FormatCfgPara(index , &stDispFormatParam))
    {
        return HI_FAILURE;
    }

    *pstFmtPara = stDispFormatParam.stInfo;
    return HI_SUCCESS;
}

HI_U32 DISP_HAL_GetChID(HI_DRV_DISPLAY_E eChn)
{
    switch (eChn)
    {
        case HI_DRV_DISPLAY_0:
            return 1;
        case HI_DRV_DISPLAY_1:
            return 0;
        default :
            return 0;
    }
}


/********************************************/
HI_VOID DISP_HAL_ResetDispState(DISP_CAPA_S *pstDispCapability, DISP_CH_CFG_S *pstDispConfig);
HI_VOID DISP_HAL_ResetIntfState(HI_VOID);
HI_VOID DISP_HAL_ResetVDacState(HI_VOID);
HI_VOID InitWbcState(HI_VOID);

HI_S32 DISP_HAL_InitVDPState(HI_VOID)
{
    /*set the virtual addr of vdp base register.*/
    if (HI_NULL == g_pstVdpBaseAddr)
    {
        DISP_ERROR("g_pstVdpBaseAddr is null.\n");
        return HI_FAILURE;
    }
    VDP_DRIVER_SetVirtualAddr(g_pstVdpBaseAddr);

    /*reset the disp/interface/vdac status.*/
    DISP_HAL_ResetDispState(s_stDispCapability, s_stDispConfig);
    DISP_HAL_ResetIntfState();
    DISP_HAL_ResetVDacState();

    InitWbcState();
    return HI_SUCCESS;
}

HI_S32 PF_ResetVdpHardware(HI_VOID)
{
    VDP_DRIVER_Initial();
    VDP_VDAC_Reset();

    return HI_SUCCESS;
}

HI_S32 PF_CloseClkResetModule(HI_VOID)
{
    Chip_Specific_DISP_CloseClock();
    return HI_SUCCESS;
}

HI_S32 PF_OpenClkStartModule(HI_VOID)
{
    Chip_Specific_DISP_OpenClock();
    return HI_SUCCESS;
}

/********************************************/
/* Display config */
#define DISP_HAL_FUNCTION_START_HAERE

HI_BOOL PF_TestChnSupport(HI_DRV_DISPLAY_E eChn)
{

    return s_stDispCapability[eChn].bSupport;
}


HI_BOOL PF_TestChnSupportHD(HI_DRV_DISPLAY_E eChn)
{

    return s_stDispCapability[eChn].bHD;
}

HI_BOOL PF_TestChnSupportCast(HI_DRV_DISPLAY_E eChn)
{

    return s_stDispCapability[eChn].bWbc;
}

HI_BOOL PF_TestIntfSupport(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_INTF_ID_E eIntf)
{
    if (HI_DRV_DISPLAY_0 == eChn)
    {
        if (  (HI_DRV_DISP_INTF_SVIDEO0 == eIntf)
              || (HI_DRV_DISP_INTF_CVBS0   == eIntf)
              || (HI_DRV_DISP_INTF_RGB0    == eIntf)
              || (HI_DRV_DISP_INTF_HDMI0  == eIntf)
              || (HI_DRV_DISP_INTF_VGA0    == eIntf)
              || (HI_DRV_DISP_INTF_YPBPR0 == eIntf)
           )
        {
            return HI_TRUE;
        }
    }

    if (HI_DRV_DISPLAY_1 == eChn)
    {
        if (  (HI_DRV_DISP_INTF_YPBPR0 == eIntf)
              || (HI_DRV_DISP_INTF_HDMI0  == eIntf)
              || (HI_DRV_DISP_INTF_CVBS0   == eIntf)
              || (HI_DRV_DISP_INTF_VGA0   == eIntf)
              || (HI_DRV_DISP_INTF_RGB0    == eIntf)
              || (HI_DRV_DISP_INTF_LCD0   == eIntf)
              || (HI_DRV_DISP_INTF_BT1120_0 == eIntf)
           )
        {
            return HI_TRUE;
        }
    }

    return HI_FALSE;
}

HI_BOOL DISP_HAL_IS_4K(HI_DRV_DISP_FMT_E eFmt)
{
    if ((eFmt >= HI_DRV_DISP_FMT_3840X2160_24) && (eFmt <= HI_DRV_DISP_FMT_3840X2160_29_97))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

HI_BOOL PF_TestChnEncFmt(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_FMT_E eFmt)
{
    HI_CHIP_TYPE_E enChipType = HI_CHIP_TYPE_BUTT;
    HI_CHIP_VERSION_E enChipVersion = HI_CHIP_VERSION_BUTT;

    HI_DRV_SYS_GetChipVersion(&enChipType, &enChipVersion);
    if (enChipType == HI_CHIP_TYPE_HI3796C
        || enChipType == HI_CHIP_TYPE_HI3796C_A
        || enChipType == HI_CHIP_TYPE_HI3798C
        || enChipType == HI_CHIP_TYPE_HI3798C_A
        || enChipType == HI_CHIP_TYPE_HI3798C_B
        || enChipType == HI_CHIP_TYPE_HI3798M
        || enChipType == HI_CHIP_TYPE_HI3798M_A
        || enChipType == HI_CHIP_TYPE_HI3796M)
    {
        //DISP_ERROR("chip 96cm 98cm suport 4k \n");
        if (eFmt <= HI_DRV_DISP_FMT_CUSTOM)
        {
            return HI_TRUE;
        }
    }
    else
    {

        if ((eFmt <= HI_DRV_DISP_FMT_CUSTOM))
        {
            /*not support 4K*/
            if (HI_TRUE == DISP_HAL_IS_4K(eFmt))
            {
                //DISP_ERROR("suport 4k (%d)\n",enChipType);
                return HI_FALSE;
            }
            else
            {
                //DISP_ERROR("suport 4k (%d)\n",enChipType);
                return HI_TRUE;
            }
        }
    }

    return HI_FALSE;

}

HI_BOOL PF_TestChnAttach(HI_DRV_DISPLAY_E enM, HI_DRV_DISPLAY_E enS)
{
    if ( (enM != HI_DRV_DISPLAY_1) || (enS != HI_DRV_DISPLAY_0))
    {
        return HI_FALSE;
    }

    return HI_TRUE;
}

HI_S32 PF_ResetChn(HI_U32 u32DispId, HI_U32 bIntMode)
{
    VDP_DISP_CLIP_S stClipData;
    //HI_U32 u32DispId = DISP_HAL_GetChID(eChn);

    // s1 set dhd
    VDP_DHD_Reset(u32DispId);

    VDP_DISP_SetVtThdMode(u32DispId, 1, bIntMode);
    VDP_DISP_SetVtThdMode(u32DispId, 2, bIntMode);
    VDP_DISP_SetVtThdMode(u32DispId, 3, bIntMode);
    VDP_DISP_SetVtThdMode(u32DispId, 4, bIntMode);

    VDP_DISP_SetCscEnable(u32DispId, 0);

    // s2 set clip

    stClipData.bClipEn = 1;
    stClipData.u32ClipLow_y  = 0;
    stClipData.u32ClipLow_cb = 0;
    stClipData.u32ClipLow_cr = 0;

    stClipData.u32ClipHigh_y  = 1023;
    stClipData.u32ClipHigh_cb = 1023;
    stClipData.u32ClipHigh_cr = 1023;

    VDP_DISP_SetClipCoef(u32DispId, VDP_DISP_INTF_LCD, stClipData);
    VDP_DISP_SetClipCoef(u32DispId, VDP_DISP_INTF_BT1120, stClipData);
    VDP_DISP_SetClipCoef(u32DispId, VDP_DISP_INTF_HDMI, stClipData);
    VDP_DISP_SetClipCoef(u32DispId, VDP_DISP_INTF_VGA, stClipData);

    stClipData.u32ClipLow_y  = 64;
    stClipData.u32ClipLow_cb = 64;
    stClipData.u32ClipLow_cr = 64;
    VDP_DISP_SetClipCoef(u32DispId, VDP_DISP_INTF_SDDATE, stClipData);

    VDP_DISP_SetRegUp(u32DispId);

    return HI_SUCCESS;
}

/*to caculte when an interrupt occurs, can gfx write operation
 *can neither cover the reading buffer, nor miss the next updating chance.
 */
static  HI_VOID GetFmtDetailedTiming(DISP_FMT_CFG_S *pstCfg,
                                     HI_U32 *pu32FmtActLine,
                                     HI_U32 *pu32FmtVfbLine,
                                     HI_U32 *pu32FmtVbbLine,
                                     HI_U32 *pu32FmtFresgRate)
{
    *pu32FmtActLine = pstCfg->stTiming.u32Vact;
    *pu32FmtVfbLine =   pstCfg->stTiming.u32Vfb;
    *pu32FmtVbbLine =   pstCfg->stTiming.u32Vbb;
    *pu32FmtFresgRate = pstCfg->stInfo.u32RefreshRate;
}

HI_S32 PF_GetIsoWbcPartFinishPoint(HI_DRV_DISPLAY_E enDisp,
                                   HI_DRV_DISP_FMT_E eFmt,
                                   HI_U32  u32Percent,
                                   HI_U32 *pu32PartTime,
                                   HI_U32 *pu32FinishTime)
{
    HI_U32 u32Dhd_Currentvline     = 0;
    HI_U32 u32Dhd_TotalLine        = 0;
    HI_U32 u32Dhd_VblankLine       = 0;
    HI_U32 u32Dhd_WbcPercentLine   = 0;
    HI_U32 u32Dhd_ExpiredLine      = 0;
    HI_U32 bBtm = 0, u32Vcnt = 0;
    HI_U32 index = 0;
    DISP_FMT_CFG_S stCfg;
    HI_U32 u32FmtActLine   = 0;
    HI_U32 u32FmtVfbLine   = 0;
    HI_U32 u32FmtVbbLine   = 0;
    HI_U32 u32FmtFreshRate = 0;
    HI_S32 Ret = HI_FAILURE;

    if (eFmt  != HI_DRV_DISP_FMT_CUSTOM)
    {
        Ret = DispHalGetEnFmtIndex(eFmt, &index);
        if (HI_SUCCESS != Ret)
        {
            return Ret;
        }

        if  ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
        {
            return HI_FAILURE;
        }

        GetFmtDetailedTiming(&stCfg, &u32FmtActLine, &u32FmtVfbLine, &u32FmtVbbLine, &u32FmtFreshRate);

        FP_GetChnBottomFlag(enDisp, &bBtm, &u32Vcnt);

        u32Dhd_TotalLine = u32FmtActLine + u32FmtVfbLine + u32FmtVbbLine;
        u32Dhd_VblankLine = u32FmtVfbLine + u32FmtVbbLine;
        u32Dhd_WbcPercentLine = (u32FmtActLine * u32Percent) / 100;
        u32Dhd_Currentvline = u32Vcnt;

        u32Dhd_ExpiredLine =  u32Dhd_TotalLine
                              - (u32Dhd_Currentvline + u32FmtVfbLine)
                              + u32Dhd_VblankLine + u32Dhd_WbcPercentLine;

        if (0 == u32FmtFreshRate || 0 == u32Dhd_TotalLine)
        {
            DISP_ERROR("Denominator may be zero !\n");
            return HI_FAILURE;
        }

        *pu32PartTime =  (100000 * u32Dhd_ExpiredLine) / (u32FmtFreshRate * u32Dhd_TotalLine);

        u32Dhd_ExpiredLine =  u32Dhd_TotalLine
                              - (u32Dhd_Currentvline + u32FmtVfbLine)
                              + u32Dhd_TotalLine;

        *pu32FinishTime = (100000 * u32Dhd_ExpiredLine) / (u32FmtFreshRate * u32Dhd_TotalLine);

    }
    else
    {
        /*custom timing, lowdelay not considered.*/
        *pu32PartTime   = 50;
        *pu32FinishTime = 50;
    }

    return HI_SUCCESS;
}

HI_U32 FP_GetChnBottomFlag(HI_DRV_DISPLAY_E enDisp, HI_BOOL *pbBtm, HI_U32 *pu32Vcnt)
{
    HI_U32 u32DispId = DISP_HAL_GetChID(enDisp);

    if (pbBtm && pu32Vcnt)
    {
        VDP_DISP_GetVactState(u32DispId, pbBtm, pu32Vcnt);
    }

    return 0;
}

HI_S32 PF_GetCurrentVbiTimeInfor(HI_DRV_DISPLAY_E enDisp,
                                 HI_DRV_DISP_FMT_E eFmt,
                                 HI_U32 *pu32CircleTime,
                                 HI_U32 *pu32LeftTime)
{
    HI_U32 u32Dhd_Currentvline     = 0;
    HI_U32 u32Dhd_TotalLine        = 0;
    HI_U32 bBtm = 0, u32Vcnt = 0;
    HI_U32 index = 0;
    HI_S32 Ret = HI_FAILURE;
    DISP_FMT_CFG_S stCfg;
    HI_U32 u32FmtActLine   = 0, u32FmtVfbLine   = 0, u32FmtVbbLine   = 0, u32FmtFreshRate = 0;

    if (eFmt  != HI_DRV_DISP_FMT_CUSTOM)
    {
        Ret = DispHalGetEnFmtIndex(eFmt, &index);
        if (HI_SUCCESS != Ret)
        {
            return Ret;
        }

        if (HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
        {
            return HI_FAILURE;
        }

        GetFmtDetailedTiming(&stCfg, &u32FmtActLine, &u32FmtVfbLine, &u32FmtVbbLine, &u32FmtFreshRate);

        FP_GetChnBottomFlag(enDisp, &bBtm, &u32Vcnt);

        u32Dhd_TotalLine = u32FmtActLine + u32FmtVfbLine + u32FmtVbbLine;
        u32Dhd_Currentvline = u32Vcnt;

        if (0 == u32FmtFreshRate || 0 == u32Dhd_TotalLine)
        {
            DISP_ERROR("Denominator may be zero !\n");
            return HI_FAILURE;
        }

        if (HI_NULL != pu32CircleTime)
        {
            *pu32CircleTime = 100000 / u32FmtFreshRate;
        }

        if (HI_NULL != pu32LeftTime)
        {
            *pu32LeftTime = ((100000 / u32FmtFreshRate) * (u32Dhd_TotalLine - u32Dhd_Currentvline)) / u32Dhd_TotalLine;
        }
    }
    else
    {
        if (HI_NULL != pu32CircleTime)
        {
            *pu32CircleTime = 50;
        }

        if (HI_NULL != pu32LeftTime)
        {
            *pu32LeftTime = 50;
        }
    }

    return HI_SUCCESS;
}

HI_S32 PF_GetAccurateLinePosition(HI_DRV_DISPLAY_E enDisp,
                                  HI_DRV_DISP_FMT_E eFmt)
{
    HI_U32 u32Dhd_Currentvline     = 0;
    HI_U32 u32Dhd_TotalLine        = 0;
    HI_U32 bBtm = 0, u32Vcnt = 0;
    HI_U32 index;
    HI_S32 Ret = HI_FAILURE;
    DISP_FMT_CFG_S stCfg;
    HI_U32 u32FmtActLine   = 0;
    HI_U32 u32FmtVfbLine   = 0;
    HI_U32 u32FmtVbbLine   = 0;
    HI_U32 u32FmtFreshRate = 0;

    if ((enDisp >= HI_DRV_DISPLAY_2))
    {
        DISP_PRINT("enDisp or eFmt out of range.\n");
        return 0;
    }

    Ret = DispHalGetEnFmtIndex(eFmt, &index);
    if (HI_SUCCESS != Ret)
    {
        return 0;
    }

    if  ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
    {
        return 0;
    }

    GetFmtDetailedTiming(&stCfg, &u32FmtActLine, &u32FmtVfbLine, &u32FmtVbbLine, &u32FmtFreshRate);

    FP_GetChnBottomFlag(enDisp, &bBtm, &u32Vcnt);

    u32Dhd_TotalLine = u32FmtActLine + u32FmtVfbLine + u32FmtVbbLine;
    u32Dhd_Currentvline = u32Vcnt;

    if (u32Dhd_TotalLine  <= ((u32Dhd_Currentvline + u32FmtVfbLine)))
    {
        return u32Dhd_Currentvline + u32FmtVfbLine - u32Dhd_TotalLine;
    }
    else
    {
        return  u32Dhd_Currentvline + u32FmtVfbLine;
    }

    return 0;

}

HI_S32 PF_Calculate_TriggerTime(HI_U32 u32DispM_Intr_Line,
                                HI_U32 u32DispM_Line_ReadFromSd,
                                HI_U32 u32DispS_Intr_Line,
                                HI_DRV_DISP_FMT_E eFmtM,
                                HI_DRV_DISP_FMT_E eFmtS)
{
    HI_U32 u32Dhd_TotalLineM       = 0, u32Dhd_TotalLineS      = 0;
    HI_U32 index;
    HI_S32 Ret = HI_FAILURE;
    DISP_FMT_CFG_S stCfgM, stCfgS;
    HI_U32 u32FmtActLine   = 0;
    HI_U32 u32FmtVfbLine   = 0;
    HI_U32 u32FmtVbbLine   = 0;
    HI_U32 u32FmtFreshRate = 0;
    HI_U32 u32DHDM_Diff = 0;
    HI_S32 s32TriggerTime = 0;

    if (eFmtM  != HI_DRV_DISP_FMT_CUSTOM)
    {
        Ret = DispHalGetEnFmtIndex(eFmtM, &index);
        if (HI_SUCCESS != Ret)
        {
            return 0;
        }

        if  ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfgM))
        {
            return HI_FAILURE;
        }

        Ret = DispHalGetEnFmtIndex(eFmtS, &index);
        if (HI_SUCCESS != Ret)
        {
            return 0;
        }

        if  ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfgS))
        {
            return 0;
        }

        GetFmtDetailedTiming(&stCfgM, &u32FmtActLine, &u32FmtVfbLine, &u32FmtVbbLine, &u32FmtFreshRate);
        u32Dhd_TotalLineM = u32FmtActLine + u32FmtVfbLine + u32FmtVbbLine;


        GetFmtDetailedTiming(&stCfgS, &u32FmtActLine, &u32FmtVfbLine, &u32FmtVbbLine, &u32FmtFreshRate);
        u32Dhd_TotalLineS = u32FmtActLine + u32FmtVfbLine + u32FmtVbbLine;

        u32DHDM_Diff = (u32DispM_Line_ReadFromSd > u32DispM_Intr_Line) ? (u32DispM_Line_ReadFromSd - u32DispM_Intr_Line) : (u32Dhd_TotalLineM - u32DispM_Intr_Line + u32DispM_Line_ReadFromSd);

        if (0 == u32FmtFreshRate || 0 == u32Dhd_TotalLineM || 0 == u32Dhd_TotalLineS)
        {
            DISP_ERROR("Denominator may be zero !\n");
            return 0;
        }

        s32TriggerTime =  (u32DispM_Intr_Line +   u32DHDM_Diff) * 100000 / (u32FmtFreshRate * u32Dhd_TotalLineM) - (u32DispS_Intr_Line * 100000) / (u32Dhd_TotalLineS * u32FmtFreshRate);
        if (s32TriggerTime < 0)
        {
            return 0;
        }
        else
        {
            return s32TriggerTime;
        }

    }

    return 0;
}

HI_S32 DISP_GFX_GetIsrPoint(HI_U32 u32DispId, DISP_FMT_CFG_S *pstCfg, HI_U32 *pu32Point)
{
    HI_U32 u32PeriodMs = 0;
    HI_U32 u32TotalLines = 0;
    HI_U32 u32ThreshHoldLine = 0;

    if ((0 == pstCfg->stInfo.u32RefreshRate)
        || (100000 < pstCfg->stInfo.u32RefreshRate))
    {
        DISP_ERROR("Denominator may be zero !\n");
        return HI_FAILURE;
    }

    /*Generate time cost for every period in MicroSeconds.*/
    u32PeriodMs = 100000 / pstCfg->stInfo.u32RefreshRate;

    if (pstCfg->stInfo.eDispMode == DISP_STEREO_FPK)
    {
        /*
           ||<--------- FRRAME L--------->||<--------- FRRAME R--------->||
           -----------------------------------------------------------------
           | VFB0 || VBB0 |     VACT0     | VFB0 || VBB01 |     VACT1    |
           -----------------------------------------------------------------
                                            |<----------->|
                                             Pos2    ^
                                                    /|\
                                                     |
                                               Here equal to 'DISP_VTTHD_GFX_OFFSET'
        */

        u32TotalLines = (pstCfg->stTiming.u32Vbb
                         + pstCfg->stTiming.u32Vfb
                         + pstCfg->stTiming.u32Vact
                         + pstCfg->stTiming.u32Bvact
                         + pstCfg->stTiming.u32Bvbb
                         + pstCfg->stTiming.u32Bvfb);
    }
    else
    {
        /*
           ||<--------- FRRAME 1--------->||<--------- FRRAME 2------->||
           --------------------------------------------------------------
           | VFB1 || VBB1 |     VACT1     | VFB2 || VBB2 |     VACT1    |
           --------------------------------------------------------------
                                            |<----------->|
                                             Pos2    ^
                                                    /|\
                                                     |
                                               Here equal to 'DISP_VTTHD_GFX_OFFSET'
        */

        u32TotalLines = (pstCfg->stTiming.u32Vbb + pstCfg->stTiming.u32Vfb + pstCfg->stTiming.u32Vact);
    }

    /*hd channel*/
    if (u32DispId == 0)
    {
        /*we set the theshhold for 1.5ms, so we can get the u32ThreshHoldLine.*/
        u32ThreshHoldLine = (2 * u32TotalLines) / (u32PeriodMs);
    }
    else/*sd channel*/
    {
        /*we set the theshhold for 1.5ms, so we can get the u32ThreshHoldLine.*/
        u32ThreshHoldLine = (7 * u32TotalLines) / (4 * u32PeriodMs);
    }

    /*To avoid the isr configure missing the update point in vbb in next ISR period,
     *we should consider this.
     */
    u32ThreshHoldLine -= pstCfg->stTiming.u32Vfb;

    /*so the final isr point is as follows*/
    if ((HI_S32)(u32TotalLines - u32ThreshHoldLine) < 0)
    {
        return HI_FAILURE;
    }

    *pu32Point = u32TotalLines - u32ThreshHoldLine;
    return HI_SUCCESS;
}

HI_U32 DISP_GFX_GetIsrPoint1(HI_U32 u32DispId, DISP_FMT_CFG_S *pstCfg)
{
    HI_U32 u32TotalLines = 0;

    if (pstCfg->stInfo.eDispMode == DISP_STEREO_FPK)
    {
        u32TotalLines = (pstCfg->stTiming.u32Vbb
                         + pstCfg->stTiming.u32Vfb
                         + pstCfg->stTiming.u32Vact
                         + pstCfg->stTiming.u32Bvact
                         + pstCfg->stTiming.u32Bvbb
                         + pstCfg->stTiming.u32Bvfb);
    }
    else
    {
        u32TotalLines = (pstCfg->stTiming.u32Vbb + pstCfg->stTiming.u32Vfb + pstCfg->stTiming.u32Vact);
    }

    return (u32TotalLines / 10);
}


HI_U32 DISP_Video_GetIsrPoint1(HI_U32 u32DispId, DISP_FMT_CFG_S *pstCfg)
{
    HI_U32 u32TotalLines = 0;

    if (pstCfg->stInfo.eDispMode == DISP_STEREO_FPK)
    {
        u32TotalLines = (pstCfg->stTiming.u32Vbb
                         + pstCfg->stTiming.u32Vfb
                         + pstCfg->stTiming.u32Vact
                         + pstCfg->stTiming.u32Bvact
                         + pstCfg->stTiming.u32Bvbb
                         + pstCfg->stTiming.u32Bvfb);
    }
    else
    {
        u32TotalLines = (pstCfg->stTiming.u32Vbb + pstCfg->stTiming.u32Vfb + pstCfg->stTiming.u32Vact);
    }

    return u32TotalLines;
}


HI_S32 DISP_Hd_SdTrigger(HI_U32 u32DispId, HI_DRV_DISP_FMT_E eFmt, HI_U32 *pu32TotalLines)
{
    HI_U32 u32TotalLines = 0, index = 0;
    DISP_FMT_CFG_S stCfg;
    HI_S32 Ret = HI_FAILURE;

    Ret = DispHalGetEnFmtIndex(eFmt, &index);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }

    if ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
    {
        return HI_FAILURE;
    }

    if (stCfg.stInfo.eDispMode == DISP_STEREO_FPK)
    {
        u32TotalLines = (stCfg.stTiming.u32Vbb
                         + stCfg.stTiming.u32Vfb
                         + stCfg.stTiming.u32Vact
                         + stCfg.stTiming.u32Bvact
                         + stCfg.stTiming.u32Bvbb
                         + stCfg.stTiming.u32Bvfb);
    }
    else
    {
        u32TotalLines = (stCfg.stTiming.u32Vbb + stCfg.stTiming.u32Vfb + stCfg.stTiming.u32Vact);
    }

    *pu32TotalLines = (u32TotalLines * 10) / 100;
    return HI_SUCCESS;
}

// need to be modify later for extern

extern volatile S_VDP_REGS_TYPE *pVdpReg;

HI_S32 PF_SetChnBaseTiming(HI_DRV_DISPLAY_E eChn, DISP_FMT_CFG_S *pstCfg)
{
    HI_U32 thd;
    HI_S32 Ret = HI_FAILURE;

    HI_U32 u32DispId = DISP_HAL_GetChID(eChn);

    DISP_PRINT(">>>>>>>>>>>>>>>u32DispId=%d>>> (%d)(%d)\n", u32DispId, pstCfg->stTiming.u32Vact, pstCfg->stTiming.u32Hact);

    if (pstCfg->stInfo.eDispMode == DISP_STEREO_FPK)
    {
        PF_ResetChn(u32DispId, DHD_VTXTHD_FRAME_MODE);
    }
    else
    {
        PF_ResetChn(u32DispId, DHD_VTXTHD_FIELD_MODE);
    }

    (HI_VOID)HAL_Set3DMode(eChn, u32DispId, pstCfg);
    // set dhd
    /*
      timing is like that:

      ||<--------- FRRAME 0--------->||<--------- FRRAME 1--------->||
      -----------------------------------------------------------------
      || VBB0 |     VACT0     | VFB0 || VBB01 |     VACT1    | VFB1 ||
      -----------------------------------------------------------------
                              ^
                             /|\
                              |
                NOTICE: The 'thd' is start here, NOT between VFB0 and VBB1.
                        That means here thd is '0'.
    */
    /*
      ||<--------- FRRAME 0--------->||<--------- FRRAME 1--------->||
      -----------------------------------------------------------------
      || VBB0 |     VACT0     | VFB0 || VBB01 |     VACT1    | VFB1 ||
      -----------------------------------------------------------------
                              |---------------|<----->|
                                                  ^   Pos1
                                                 /|\
                                                  |
                                         Here equal to 'DISP_VTTHD_VIDEO_OFFSET'
                                         And Pos1 is thd1
    */

    VDP_DISP_OpenIntf(u32DispId, pstCfg->stTiming);

    /*according the interleave flag,  set P2I flag.*/
    Chip_Specific_DISP_ConfigP2I(u32DispId, pstCfg->stTiming.bIop);

    if (pstCfg->stInfo.eDispMode == DISP_STEREO_FPK)
    {
        thd = (pstCfg->stTiming.u32Vfb + pstCfg->stTiming.u32Vbb) * 2 +
              pstCfg->stTiming.u32Vact + DISP_VTTHD_VIDEO_OFFSET;

        if (u32DispId == 1)
        {
            thd = thd + DISP_VTTHD_DISP0_TO_DISP1;
        }

        VDP_DISP_SetVtThd(u32DispId, 1, thd);
        /*
              ||<--------- FRRAME L--------->||<--------- FRRAME R--------->||
              -----------------------------------------------------------------
        | VFB0 || VBB0 |     VACT0     | VFB0 || VBB01 |     VACT1    | VFB1 ||
              -----------------------------------------------------------------
                                        |<----------->|
                                       Pos2    ^
                                              /|\
                                               |
                                         Here equal to 'DISP_VTTHD_GFX_OFFSET'
                                         Pos2 is thd2.
                                         If DISP_VTTHD_GFX_OFFSET is bigger tha (VFB0+VBB1),
                                         Pos2 is in VACT0.
            */
        Ret = DISP_GFX_GetIsrPoint(u32DispId, pstCfg, &thd);
        if (HI_SUCCESS != Ret)
        {
            return Ret;
        }

        VDP_DISP_SetVtThd(u32DispId, 2, thd);

        thd = DISP_GFX_GetIsrPoint1(u32DispId, pstCfg);

        VDP_DISP_SetVtThd(u32DispId, 3, thd);

    }
    else
    {
        if (u32DispId == 0)
        {
            thd = DISP_Video_GetIsrPoint1(u32DispId, pstCfg) * 20 / 100;
        }
        else if (u32DispId == 1)
        {
            /*lowdelay 50%,  here sd's isr remain 20%,  give  the wbc partfinish 20% left.*/
            thd = ((pstCfg->stTiming.u32Vfb
                    + pstCfg->stTiming.u32Vbb
                    + pstCfg->stTiming.u32Vact) * 30) / 100;
        }
        else
        {
            thd = 0;
        }

        VDP_DISP_SetVtThd(u32DispId, 1, (HI_U32)thd);

        /*
          ||<--------- FRRAME 0--------->||<--------- FRRAME 1--------->||
          -----------------------------------------------------------------
          || VBB0 |     VACT0     | VFB0 || VBB01 |     VACT1    | VFB1 ||
          -----------------------------------------------------------------
                                    |<----------->|
                                   Pos2    ^
                                          /|\
                                           |
                                     Here equal to 'DISP_VTTHD_GFX_OFFSET'
                                     Pos2 is thd2.
                                     If DISP_VTTHD_GFX_OFFSET is bigger tha (VFB0+VBB1),
                                     Pos2 is in VACT0.
          */

        Ret = DISP_GFX_GetIsrPoint(u32DispId, pstCfg, &thd);
        if (HI_SUCCESS != Ret)
        {
            return Ret;
        }

        VDP_DISP_SetVtThd(u32DispId, 2, thd);

        thd = DISP_GFX_GetIsrPoint1(u32DispId, pstCfg);

        VDP_DISP_SetVtThd(u32DispId, 3, thd);
    }

    Chip_Specific_DispSetChanClk(eChn, pstCfg);
#if 0
    // set vp
    DISP_MEMSET(&DispRect, 0, sizeof(VDP_DISP_RECT_S));
    DispRect.u32DXL  = pstCfg->stInfo.stOrgRect.s32Width;
    DispRect.u32DYL  = pstCfg->stInfo.stOrgRect.s32Height;
    DispRect.u32IWth = pstCfg->stInfo.stOrgRect.s32Width;
    DispRect.u32IHgt = pstCfg->stInfo.stOrgRect.s32Height;
    DispRect.u32OWth = pstCfg->stInfo.stOrgRect.s32Width;
    DispRect.u32OHgt = pstCfg->stInfo.stOrgRect.s32Height;
    DispRect.u32VXL  = pstCfg->stInfo.stOrgRect.s32Width;
    DispRect.u32VYL  = pstCfg->stInfo.stOrgRect.s32Height;

    vdp_layer = (HI_DRV_DISPLAY_1 == eChn) ? VDP_LAYER_VP0 : VDP_LAYER_VP1;
    VDP_VP_SetLayerReso(vdp_layer, DispRect);
    VDP_VP_SetRegUp(vdp_layer);
#endif
    VDP_DISP_SetRegUp(u32DispId);

    return HI_SUCCESS;
}


HI_S32 PF_SetChnFmt(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_STEREO_E enStereo)
{
    DISP_FMT_CFG_S stCfg;
    HI_S32  Ret = HI_FAILURE;
    HI_U32 index = 0;

    if ((eFmt >= HI_DRV_DISP_FMT_BUTT) || (eChn >= HI_DRV_DISPLAY_2) || (enStereo >= DISP_STEREO_BUTT))
    {
        DISP_ERROR("eFmt, eChn or enStereo  out of range.\n");
        return HI_FAILURE;
    }

    Ret = DispHalGetEnFmtIndex(eFmt, &index);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }

    if  ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
    {
        return HI_FAILURE;
    }


    stCfg.stInfo.eDispMode = enStereo;
    stCfg.stInfo.eFmt = eFmt;

    Ret = PF_SetChnBaseTiming(eChn, &stCfg);
    return Ret;
}


HI_S32 PF_GetFmtTiming(HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstTiming)
{
    DISP_FMT_CFG_S stCfg;
    HI_S32  Ret = HI_FAILURE;
    HI_U32 index;

    DispCheckNullPointer(pstTiming);
    Ret = DispHalGetEnFmtIndex(eFmt, &index);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }

    if (HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
    {
        return HI_FAILURE;
    }

    pstTiming->u32VACT = stCfg.stTiming.u32Vact ;
    pstTiming->u32VBB  = stCfg.stTiming.u32Vbb;
    pstTiming->u32VFB  = stCfg.stTiming.u32Vfb ;


    pstTiming->u32HACT = stCfg.stTiming.u32Hact ;

    pstTiming->u32HBB = stCfg.stTiming.u32Hbb ;
    pstTiming->u32HFB = stCfg.stTiming.u32Hfb ;


    pstTiming->u32HPW = stCfg.stTiming.u32Hpw ;
    pstTiming->u32VPW = stCfg.stTiming.u32Vpw ;


    pstTiming->bIDV = stCfg.stTiming.bIdv ;
    pstTiming->bIHS = stCfg.stTiming.bIhs ;
    pstTiming->bIVS = stCfg.stTiming.bIvs ;

    pstTiming->u32ClkPara0 = stCfg.u32Pll[0] ;
    pstTiming->u32ClkPara1 = stCfg.u32Pll[1] ;

    pstTiming->u32AspectRatioW = stCfg.stInfo.stAR.u32ARw;
    pstTiming->u32AspectRatioH = stCfg.stInfo.stAR.u32ARh;
    pstTiming->u32VertFreq = stCfg.stInfo.u32RefreshRate;

    (HI_VOID)Calculate_FmtPixelClk(pstTiming);

    return HI_SUCCESS;
}

#if defined (CHIP_HIFONEB02)
HI_S32 PF_SetHDMI420(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable)
{
    VDP_DISP_Hdmi420En(DISP_HAL_GetChID(enDisp), bEnable);
    return HI_SUCCESS;
}
#else
HI_S32 PF_SetHDMI420(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable)
{
    return HI_SUCCESS;
}
#endif

HI_S32 DispCheck_FOUTVCO(TEMP_PARA_S *pstTmpPara, HI_U32 u32FREF)
{
    HI_U32 i, TmpFBDIV = 0, u32Tmpm;

    if (0 == u32FREF)
    {
        DISP_ERROR("Denominator may be zero !\n");
        return HI_FAILURE;
    }

    if ((pstTmpPara->u32TmpFOUTVCO < FOUTVCO_MAX) && (pstTmpPara->u32TmpFOUTVCO > FOUTVCO_MIN))
    {
        //debug_printf("Check FOUTVCO(%d)\n", pstTmpPara->u32TmpFOUTVCO);
        /*FOUTVCO  =m* FBDIV */
        for ( i = REFDIV_I_MIN; i < REFDIV_I_MAX;  i++ )
        {
            /*div m */
            if ( 0 == u32FREF % i )
            {
                u32Tmpm =  u32FREF / i ;
                // debug_printf("try :FCO (%d),m(%d)", pstTmpPara->u32TmpFOUTVCO, u32Tmpm);
                if (0 == pstTmpPara->u32TmpFOUTVCO % u32Tmpm)
                {
                    TmpFBDIV = pstTmpPara->u32TmpFOUTVCO / u32Tmpm;
                    if ((TmpFBDIV < FBDIV_I_MAX) && (TmpFBDIV >  FBDIV_I_MIN)  )
                    {
                        pstTmpPara->u32TmpM = u32Tmpm;
                        pstTmpPara->u32TmpFBDIV = TmpFBDIV;
                        return HI_SUCCESS;
                    }
                }
            }
        }
    }

    return HI_FAILURE;
}


HI_S32 PF_SetChnTiming(HI_DRV_DISPLAY_E eChn, HI_DRV_DISP_TIMING_S *pstTiming)
{
    return HI_ERR_DISP_NOT_SUPPORT;
}

HI_S32 PF_SetChnPixFmt(HI_DRV_DISPLAY_E eChn, HI_DRV_PIX_FORMAT_E ePix)
{
    return HI_SUCCESS;
}

HI_S32 PF_SetChnBgColor(HI_DRV_DISPLAY_E eChn, HI_DRV_COLOR_SPACE_E enCS, HI_DRV_DISP_COLOR_S *pstBGC)
{
    VDP_BKG_S stBkg;
    ALG_COLOR_S stAlgC;
    DISP_DA_FUNCTION_S *pstDA = HI_NULL;

    memset(&stBkg, 0x0, sizeof(VDP_BKG_S));
    memset(&stAlgC, 0x0, sizeof(ALG_COLOR_S));

    pstDA = DISP_DA_GetFunction();
    if (!pstDA)
    {
        return HI_FAILURE;
    }

    stAlgC.u8Red   = pstBGC->u8Red;
    stAlgC.u8Green = pstBGC->u8Green;
    stAlgC.u8Blue  = pstBGC->u8Blue;

    //printk("chan%d--->(%d,%d,%d)\n",eChn,stAlgC.u8Red ,stAlgC.u8Green,stAlgC.u8Blue);

    if ( (HI_DRV_CS_BT601_RGB_LIMITED == enCS)
         || (HI_DRV_CS_BT601_RGB_FULL == enCS)
         || (HI_DRV_CS_BT709_RGB_LIMITED == enCS)
         || (HI_DRV_CS_BT709_RGB_FULL == enCS)
       )
    {
        /*now, the internal bitwidth is 10bit, but
        stAlgC.u8Red and others is 8 bit. so we should left shift 2 bit.*/
        stBkg.bBkType = 0;
        stBkg.u32BkgA = 0;
        stBkg.u32BkgY = ((HI_U32)stAlgC.u8Red << 2);
        stBkg.u32BkgU = ((HI_U32)stAlgC.u8Green << 2);
        stBkg.u32BkgV = ((HI_U32)stAlgC.u8Blue << 2);
    }
    else
    {
        pstDA->PFCscRgb2Yuv(&stAlgC, &stAlgC);
        // TODO:
        stBkg.bBkType = 0;
        stBkg.u32BkgA = 0;
        stBkg.u32BkgY = ((HI_U32)stAlgC.u8Y)  << 2;
        stBkg.u32BkgU = ((HI_U32)stAlgC.u8Cb) << 2;
        stBkg.u32BkgV = ((HI_U32)stAlgC.u8Cr) << 2;
    }
    /*
        DISP_PRINT(">>>>>>>>SET BGC R=%d, G=%d, B=%d, Y=%d, PB=%d, PR=%d\n",
                   stAlgC.u8Red, stAlgC.u8Green, stAlgC.u8Blue,
                   stAlgC.u8Y, stAlgC.u8Cb, stAlgC.u8Cr);
    */

    Chip_Specific_SetMixerBgColor(eChn, stBkg);
    return HI_SUCCESS;
}


HI_S32 PF_SetChnColor(HI_DRV_DISPLAY_E eChn, DISP_HAL_COLOR_S *pstColor)
{
    return HI_SUCCESS;
}

extern  HI_VOID VDP_DISP_GetIntMask (HI_U32 *pu32masktype);
extern  HI_VOID VDP_DISP_SetIntMask  (HI_U32 u32masktypeen);

#define  VDP_SET_FMT_TIMEOUT 15000
#define  VDP_TRIGGER_DIVIDEND 9
#define  VDP_TRIGGER_DIVIDER 10


HI_S32 PF_SetChnEnable(HI_DRV_DISPLAY_E eChn,
                       HI_BOOL bEnalbe,
                       HI_DRV_DISP_STEREO_MODE_E enStereo,
                       HI_DRV_DISP_FMT_E enEncFmt,
                       HI_BOOL bIsogenyMode)
{
    HI_U32 u32DispId = DISP_HAL_GetChID(eChn);
    HI_BOOL  bBtm = 0;
    HI_U32   u32Vcnt = 0;
    HI_U32 u32BaseWbcFinishPoint = 0;
    HI_S32 Ret = HI_FAILURE;

#ifndef __DISP_PLATFORM_BOOT__
    unsigned long long  jiffies_tmp = get_jiffies_64();
#endif

#if defined(CHIP_TYPE_hi3798mv310)
    if (eChn == HI_DRV_DISPLAY_0)
    {
        return HI_SUCCESS;
    }
#endif


    if (enEncFmt >= HI_DRV_DISP_FMT_BUTT)
    {
        DISP_ERROR("enEncFmt out of range.\n");
        return HI_FAILURE;
    }
    /*when same-iso mode and non-sameisogeny,  the sd wait for hd just because of trigger.*/
    if ((eChn == HI_DRV_DISPLAY_0) && (bEnalbe == HI_TRUE) && (bIsogenyMode == HI_TRUE))
    {
        Ret = DISP_Hd_SdTrigger(u32DispId, enEncFmt, &u32BaseWbcFinishPoint);
        if (HI_SUCCESS != Ret)
        {
            return HI_FAILURE;
        }

        if (u32BaseWbcFinishPoint != 0)
        {
            while (1)
            {
                VDP_DISP_GetVactState(0, &bBtm, &u32Vcnt);
                u32Vcnt = PF_GetAccurateLinePosition(1, enEncFmt);

#ifndef __DISP_PLATFORM_BOOT__

                if ((get_jiffies_64() - jiffies_tmp) > VDP_SET_FMT_TIMEOUT)
                {
                    DISP_ERROR("when lowdelay mode, trigger failed!\n");
                    VDP_DISP_SetIntfEnable(u32DispId, bEnalbe);
                    VDP_DISP_SetRegUp(u32DispId);
                    break;
                }

#endif

                /*if condition satisfied, and timeout, just break.*/
                if (((u32Vcnt > u32BaseWbcFinishPoint)
                     && (bBtm == 0)
                     && (u32Vcnt < (VDP_TRIGGER_DIVIDER * u32BaseWbcFinishPoint) / VDP_TRIGGER_DIVIDEND)) )
                {
#ifndef __DISP_PLATFORM_BOOT__
                    DISP_INFO("line threshhold:%d,%d, time:%d!\n", u32BaseWbcFinishPoint, u32Vcnt, get_jiffies_64() - jiffies_tmp);
#else
                    DISP_INFO("line threshhold:%d, time:%d!\n", u32BaseWbcFinishPoint, u32Vcnt);
#endif

                    VDP_DISP_SetIntfEnable(u32DispId, bEnalbe);
                    VDP_DISP_SetRegUp(u32DispId);
                    break;
                }

            }
        }
        else
        {
            DISP_ERROR("when lowdelay mode, trigger failed,trigger number 0!\n");
            VDP_DISP_SetIntfEnable(u32DispId, bEnalbe);
            VDP_DISP_SetRegUp(u32DispId);
        }
    }
    else
    {
        VDP_DISP_SetIntfEnable(u32DispId, bEnalbe);
        VDP_DISP_SetRegUp(u32DispId);
    }

    return HI_SUCCESS;
}

HI_S32 PF_SetMSChnEnable(HI_DRV_DISPLAY_E eChnM, HI_DRV_DISPLAY_E eChnS, HI_U32 u32DelayMs, HI_BOOL bEnalbe)
{
#ifdef HI_DISP_BUILD_FULL
    HI_U32 t;
#endif
    HI_U32 u32DispIdM = DISP_HAL_GetChID(eChnM);
    HI_U32 u32DispIdS = DISP_HAL_GetChID(eChnS);
    Chip_Specific_DispSetMSChnEnable(u32DispIdM, u32DispIdS, u32DelayMs, bEnalbe);


#ifdef HI_DISP_BUILD_FULL
    if (HI_DRV_SYS_GetTimeStampMs(&t))
    {
        DISP_ERROR("get sys time failed, not init.\n");
        return HI_FAILURE;
    }
    //printk("dispM=%d, t=%d, en=%d\n", eChnM, t, bEnalbe);
#endif

    return HI_SUCCESS;
}

HI_VOID PF_DispMask(HI_DRV_DISPLAY_E eChan)
{
    VDP_DispMask(eChan);
}
HI_VOID PF_DispUnMask(HI_DRV_DISPLAY_E eChan)
{
    VDP_DispUnMask(eChan);
}

HI_S32 PF_GetChnEnable(HI_DRV_DISPLAY_E eChn, HI_BOOL *pbEnalbe)
{
    HI_U32 u32DispId = DISP_HAL_GetChID(eChn);
    HI_U32 bTrue;

    VDP_DISP_GetIntfEnable(u32DispId, &bTrue);

    *pbEnalbe = bTrue ? HI_TRUE : HI_FALSE;
    return HI_SUCCESS;
}

/********************************************/
/* capability */

/********************************************/
/* interrupt */
HI_S32 PF_SetIntEnable(HI_U32 u32Int, HI_BOOL bEnable)
{
    //printk("PF_SetIntEnable   int=%d, en=%d\n", u32Int, bEnable);
    if (bEnable)
    {
        VDP_DISP_SetIntMask(u32Int);
    }
    else
    {
        VDP_DISP_SetIntDisable(u32Int);
    }
    return HI_SUCCESS;
}

HI_S32 PF_SetVPSSIntEnable(HI_U32 u32Int, HI_BOOL bEnable)
{
    if (bEnable)
    {
        VDP_DISP_SetVPSSIntMask(u32Int);
    }
    else
    {
        VDP_DISP_ClearVPSSIntMask(u32Int);
    }
    return HI_SUCCESS;
}

HI_S32 PF_SetSMMUIntEnable( HI_BOOL bEnable)
{
#ifdef CFG_VDP_MMU_SUPPORT
    VDP_Hal_SetSMMUIntEnable(bEnable);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_GetIntSetting(HI_U32 *pu32IntSetting)
{
    VDP_DISP_GetIntMask(pu32IntSetting);
    return HI_SUCCESS;
}

HI_S32 PF_GetMaskedIntState(HI_U32 *pu32State)
{
    *pu32State = VDP_DISP_GetMaskIntSta((HI_U32)DISP_INTERRUPT_ALL);
    return HI_SUCCESS;
}

HI_S32 PF_GetMaskedVPSSIntState(HI_U32 *pu32State)
{
    *pu32State = VDP_DISP_GetMaskVPSSIntSta((HI_U32)DISP_INTERRUPT_ALL);
    return HI_SUCCESS;
}

HI_S32 PF_GetUnMaskedVPSSIntState(HI_U32 *pu32State)
{
    *pu32State = VDP_DISP_GetUnMaskVPSSIntSta();
    return HI_SUCCESS;
}


HI_S32 PF_GetMaskedIntState1(HI_U32 *pu32State)
{
#ifdef CFG_VDP_MMU_SUPPORT
    VDP_Hal_GetSMMUSta(pu32State);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_GetUnmaskedIntState(HI_U32 *pu32State)
{

    *pu32State = VDP_DISP_GetIntSta((HI_U32)DISP_INTERRUPT_ALL);
    return HI_SUCCESS;
}


HI_S32 PF_CleanIntState(HI_U32 u32State)
{
    VDP_DISP_ClearIntSta(u32State);
    return HI_SUCCESS;
}

HI_S32 PF_CleanVPSSIntState(HI_U32 u32State)
{
    VDP_DISP_ClearVPSSIntSta(u32State);
    return HI_SUCCESS;
}

HI_S32 PF_CleanIntState1(HI_U32 u32State)
{
#ifdef CFG_VDP_MMU_SUPPORT

    VDP_Hal_ClearSMMUInt(u32State);
#endif
    return HI_SUCCESS;
}


HI_U32 FP_GetChnIntState(HI_DRV_DISPLAY_E enDisp, HI_U32 u32IntState)
{
    switch (enDisp)
    {
        case HI_DRV_DISPLAY_1 :

            return (HI_U32)(u32IntState & 0x0ful);

        case HI_DRV_DISPLAY_0 :

            return (HI_U32)(u32IntState & 0xf0ul);

        default:
            return (HI_U32)0;
    }
}



VDP_DISP_INTF_E DISP_HAL_GetHalIntfIdForVenc(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt)
{
    DISP_VENC_E enVenc = DISP_VENC_MAX;
    HI_BOOL bNeedVenc = HI_FALSE;
    VDP_DISP_INTF_E  enVDPInf = VDP_DISP_INTF_BUTT;


    switch (pstIf->stIf.eID)
    {
        case HI_DRV_DISP_INTF_YPBPR0:
        case HI_DRV_DISP_INTF_RGB0:
            /*(link to xDate   adjust by format !!)*/
            bNeedVenc = HI_TRUE;
            if ((eFmt >= HI_DRV_DISP_FMT_PAL) && (eFmt <= HI_DRV_DISP_FMT_1440x480i_60) )
                //if ((eFmt >= HI_DRV_DISP_FMT_PAL) && (eFmt <= HI_DRV_DISP_FMT_SECAM_H) )
            {
                enVenc   = DISP_VENC_SDATE0;
                enVDPInf =   VDP_DISP_INTF_SDDATE;
            }
            else
            {
                enVenc   = DISP_VENC_HDATE0;
                enVDPInf =  VDP_DISP_INTF_HDDATE;
            }
            break;
        case HI_DRV_DISP_INTF_SVIDEO0:
        case HI_DRV_DISP_INTF_CVBS0:

            bNeedVenc = HI_TRUE;
            enVenc  = DISP_VENC_SDATE0;
            enVDPInf  =  VDP_DISP_INTF_SDDATE;
            break;
        case HI_DRV_DISP_INTF_VGA0:
            bNeedVenc = HI_FALSE;
            enVenc   = DISP_VENC_VGA0;
            enVDPInf  =  VDP_DISP_INTF_VGA;
            break;
        case HI_DRV_DISP_INTF_HDMI0:
        case HI_DRV_DISP_INTF_HDMI1:
        case HI_DRV_DISP_INTF_HDMI2:
            enVDPInf  =  VDP_DISP_INTF_HDMI;
            break;

        case HI_DRV_DISP_INTF_BT1120_0:
        case HI_DRV_DISP_INTF_BT1120_1:
        case HI_DRV_DISP_INTF_BT1120_2:
            enVDPInf  =  VDP_DISP_INTF_BT1120;
            break;
        case HI_DRV_DISP_INTF_LCD0:
        case HI_DRV_DISP_INTF_LCD1:
        case HI_DRV_DISP_INTF_LCD2:
            enVDPInf  =  VDP_DISP_INTF_LCD;
            break;

        case HI_DRV_DISP_INTF_BT656_0:
        case HI_DRV_DISP_INTF_BT656_1:
        case HI_DRV_DISP_INTF_BT656_2:
        default:
            enVDPInf  =  VDP_DISP_INTF_BUTT;
            break;
    }

    pstIf->bLinkVenc = bNeedVenc;
    pstIf->eVencId   = enVenc;
    return enVDPInf;
}

/********************************************/
/* VDAC */
HI_VOID DISP_HAL_ResetVDacState(HI_VOID)
{
    HI_S32 i;

    DISP_MEMSET(s_stHalVDac, 0, sizeof(DISP_LOCAL_VDAC_S)*HI_DISP_VDAC_MAX_NUMBER);

    for (i = 0; i < HI_DISP_VDAC_MAX_NUMBER; i++)
    {
        s_stHalVDac[i].bSupport = HI_TRUE;
        s_stHalVDac[i].bIdle    = HI_TRUE;
    }

    return;
}

HI_S32 DISP_HAL_VDACIsIdle(HI_U32 uVdac)
{
    HI_U32 v0;

    v0 = uVdac & 0xff;

    if (v0 < HI_DISP_VDAC_MAX_NUMBER)
    {
        if (s_stHalVDac[v0].bSupport && s_stHalVDac[v0].bIdle)
        {
            return HI_TRUE;
        }
    }

    return HI_FALSE;
}

HI_S32 PF_AcquireVDAC(HI_U32 uVdac)
{
    HI_U32 v0;

    v0 = uVdac & 0xff;

    if (v0 < HI_DISP_VDAC_MAX_NUMBER)
    {
        if (s_stHalVDac[v0].bSupport && s_stHalVDac[v0].bIdle)
        {
            s_stHalVDac[v0].bIdle = HI_FALSE;
        }
        else
        {
            return HI_FAILURE;
        }
    }

    return HI_SUCCESS;
}

HI_S32 PF_ReleaseVDAC(HI_U32 uVdac)
{
    HI_U32 v0;

    v0 = uVdac & 0xff;

    if (v0 < HI_DISP_VDAC_MAX_NUMBER)
    {
        if (s_stHalVDac[v0].bSupport && !s_stHalVDac[v0].bIdle)
        {
            s_stHalVDac[v0].bIdle = HI_TRUE;
        }
    }

    return HI_SUCCESS;
}

HI_VOID VDP_VDAC_SetClk(HI_DRV_DISPLAY_E enDisp, DISP_VENC_E eDate, HI_U32 uVdac)
{
    U_PERI_CRG54 unTmpValue;

    //#if (defined (CHIP_TYPE_hi3716mv410) || defined (CHIP_TYPE_hi3716mv420))
    U_PERI_CRG71 unTmpCRG71Value;
    unTmpCRG71Value.u32 = g_pstRegCrg->PERI_CRG71.u32;
    unTmpCRG71Value.bits.vdac_chop_cken = HI_TRUE;
    g_pstRegCrg->PERI_CRG71.u32 = unTmpCRG71Value.u32;
    //#endif

    unTmpValue.u32 = g_pstRegCrg->PERI_CRG54.u32;


    /*select VDaCx clk*/
    switch (uVdac)
    {

#if !(defined(CHIP_TYPE_hi3798mv200) || defined(CHIP_TYPE_hi3798mv300) || defined(CHIP_TYPE_hi3798mv310) || defined(CHIP_TYPE_hi3716mv430))
        case 0:
            if (DISP_VENC_VGA0 == eDate)
            {
                unTmpValue.bits.vdac_ch0_clk_sel = (HI_DRV_DISPLAY_0 == enDisp) ? 0 : 1;
            }
            else
            {
                unTmpValue.bits.vdac_ch0_clk_sel = (DISP_VENC_SDATE0 == eDate) ? 0 : 1;
            }
            break;
#endif
#if !(defined(CHIP_TYPE_hi3798mv100) || defined(CHIP_TYPE_hi3796mv100) || defined(CHIP_TYPE_hi3798cv200) || defined(CHIP_TYPE_hi3798mv200) || defined(CHIP_TYPE_hi3798mv300) || defined(CHIP_TYPE_hi3798mv310) || defined(CHIP_TYPE_hi3716mv430))
        case 1:
            if (DISP_VENC_VGA0 == eDate)
            {
                unTmpValue.bits.vdac_ch1_clk_sel = (HI_DRV_DISPLAY_0 == enDisp) ? 0 : 1;
            }
            else
            {
                unTmpValue.bits.vdac_ch1_clk_sel = (DISP_VENC_SDATE0 == eDate) ? 0 : 1;
            }
            break;
        case 2:
            if (DISP_VENC_VGA0 == eDate)
            {
                unTmpValue.bits.vdac_ch2_clk_sel = (HI_DRV_DISPLAY_0 == enDisp) ? 0 : 1;
            }
            else
            {
                unTmpValue.bits.vdac_ch2_clk_sel = (DISP_VENC_SDATE0 == eDate) ? 0 : 1;
            }
            break;
        case 3:
            if (DISP_VENC_VGA0 == eDate)
            {
                unTmpValue.bits.vdac_ch3_clk_sel = (HI_DRV_DISPLAY_0 == enDisp) ? 0 : 1;
            }
            else
            {
                unTmpValue.bits.vdac_ch3_clk_sel = (DISP_VENC_SDATE0 == eDate) ? 0 : 1;
            }
            break;
#endif
        default:
            break;
    }


    g_pstRegCrg->PERI_CRG54.u32 = unTmpValue.u32;
}


/*
    xDate clock link:
    SDate --->DHD1
    HDate --->DHD0
    YPbPr CVBS DAC clock linked by XDate.

    VGA DAC is not across XDate ,clock  linked by channel.
*/
HI_S32 PF_AddVDacToVenc(HI_DRV_DISPLAY_E enDisp, DISP_VENC_E eVenc, HI_U32 uVdac, HI_DRV_DISP_VDAC_SIGNAL_E signal)
{
    HI_U32 v0;

    v0 = (uVdac >> 0) & 0xff;

    if (eVenc >= DISP_VENC_MAX ||
        signal >= HI_DRV_DISP_VDAC_SIGNAL_BUTT)
    {
        DISP_ERROR("eVenc or signal out of range.\n");
        return HI_FAILURE;
    }

    if (v0 < HI_DISP_VDAC_MAX_NUMBER)
    {
        VDP_VDAC_SetLink(eVenc, v0, signal);
        VDP_VDAC_SetClk(enDisp, eVenc, v0);
    }

    return HI_SUCCESS;
}


HI_S32 DISP_HAL_SetIdleVDACDisable(HI_VOID)
{
    HI_U32 i;

    for (i = 0; i < HI_DISP_VDAC_MAX_NUMBER; i++)
    {
        if (s_stHalVDac[i].bSupport && s_stHalVDac[i].bIdle)
        {
            VDP_VDAC_SetEnable(i, 0, 0);
        }
    }

    return HI_SUCCESS;
}

HI_S32 DISP_HAL_SetVDACCtrl(HI_VOID)
{
    HI_U32 i;
    HI_BOOL bDacEnable  = HI_FALSE;

    for (i = 0; i < HI_DISP_VDAC_MAX_NUMBER; i++)
    {

        if (s_stHalVDac[i].bSupport && (! s_stHalVDac[i].bIdle))
        {
            bDacEnable  = HI_TRUE;
        }
    }

    VDP_VDAC_Ctrl(bDacEnable);

    return HI_SUCCESS;
}

HI_S32 PF_SetVDACEnable(HI_U32 uVdac, HI_BOOL bEnable, HI_U32 u32DelayMs)
{
    HI_U32 v0;

    v0 = (uVdac >> 0) & 0xff;

    if (v0 < HI_DISP_VDAC_MAX_NUMBER)
    {
        if (HI_TRUE == bEnable)
        {
            VDP_VDAC_SetClockEnable(v0, bEnable);
            VDP_VDAC_SetEnable(v0, bEnable, u32DelayMs);
        }
        else
        {
            VDP_VDAC_SetEnable(v0, bEnable, u32DelayMs);
            VDP_VDAC_SetClockEnable(v0, bEnable);
        }
    }

    DISP_HAL_SetIdleVDACDisable();

    DISP_HAL_SetVDACCtrl();
    return HI_SUCCESS;
}

HI_VOID PF_SetVdacVbgEnable(HI_BOOL bEnable)
{
    VDP_SetVdacVbgEnable(bEnable);

    return;
}

HI_S32 PF_SetLayerClockEnable(VDP_LAYER_VID_E enLayer, HI_BOOL bEnable)
{
    return VDP_SetLayerClockEnable(enLayer, bEnable);
}

HI_S32 PF_CheckLayerClockEnable(VDP_LAYER_VID_E enLayer, HI_BOOL *pEnable)
{
    return VDP_CheckLayerClockEnable(enLayer, pEnable);
}


HI_VOID PF_SetVpWbcClockEnable(HI_BOOL bEnable)
{
    VDP_SetVpWbcClockEnable(bEnable);

    return;
}

HI_VOID PF_SetDhdWbcClockEnable(HI_BOOL bEnable)
{
    VDP_SetDhdWbcClockEnable(bEnable);

    return;
}

HI_S32 PF_GetPixelRepeatTimesAccordingFmt(HI_DRV_DISPLAY_E enDisp,
        HI_DRV_DISP_FMT_E eFmt,
        HI_U32 *pu32PixelRepeatTimes)
{
#ifndef __DISP_PLATFORM_BOOT__
    Chip_Specific_GetPixelRepeatTimesAccordingFmt(enDisp, eFmt, pu32PixelRepeatTimes);
#endif
    return HI_SUCCESS;
}


/********************************************/
/* interface */
#define DISP_HAL_INTF_FUNCTION_START_HAERE
HI_VOID DISP_HAL_ResetIntfState(HI_VOID)
{
    DISP_MEMSET(s_stHalIntf, 0, sizeof(DISP_LOCAL_INTF_S)*HI_DRV_DISP_INTF_ID_MAX);

    s_stHalIntf[HI_DRV_DISP_INTF_YPBPR0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_YPBPR0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_YPBPR0].enChan = HI_DRV_DISPLAY_BUTT;

    s_stHalIntf[HI_DRV_DISP_INTF_SVIDEO0].bSupport = HI_FALSE;
    s_stHalIntf[HI_DRV_DISP_INTF_SVIDEO0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_SVIDEO0].enChan = HI_DRV_DISPLAY_BUTT;

    s_stHalIntf[HI_DRV_DISP_INTF_CVBS0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_CVBS0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_CVBS0].enChan = HI_DRV_DISPLAY_BUTT;

    s_stHalIntf[HI_DRV_DISP_INTF_VGA0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_VGA0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_VGA0].enChan = HI_DRV_DISPLAY_BUTT;

    s_stHalIntf[HI_DRV_DISP_INTF_RGB0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_RGB0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_RGB0].enChan = HI_DRV_DISPLAY_BUTT;

    s_stHalIntf[HI_DRV_DISP_INTF_HDMI0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_HDMI0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_HDMI0].enChan = HI_DRV_DISPLAY_BUTT;

    s_stHalIntf[HI_DRV_DISP_INTF_LCD0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_LCD0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_LCD0].enChan = HI_DRV_DISPLAY_BUTT;
    s_stHalIntf[HI_DRV_DISP_INTF_BT1120_0].bSupport = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_BT1120_0].bIdle    = HI_TRUE;
    s_stHalIntf[HI_DRV_DISP_INTF_BT1120_0].enChan = HI_DRV_DISPLAY_BUTT;
    return;
}

HI_S32 PF_AcquireIntf2(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;

    if (    !PF_TestIntfSupport(enDisp, pstIntf->eID)
            || !s_stHalIntf[pstIntf->eID].bSupport
            || !s_stHalIntf[pstIntf->eID].bIdle)
    {
        return HI_FAILURE;
    }


    switch (pstIntf->eID)
    {
        case HI_DRV_DISP_INTF_YPBPR0:
        case HI_DRV_DISP_INTF_SVIDEO0:
        case HI_DRV_DISP_INTF_CVBS0:
        case HI_DRV_DISP_INTF_RGB0:
        case HI_DRV_DISP_INTF_VGA0:
            if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
            {
                if (!DISP_HAL_VDACIsIdle(pstIntf->u8VDAC_Y_G))
                {
                    return HI_FAILURE;
                }
            }
            if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
            {
                if (!DISP_HAL_VDACIsIdle(pstIntf->u8VDAC_Pb_B))
                {
                    return HI_FAILURE;
                }
            }
            if (pstIntf->u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
            {
                if (!DISP_HAL_VDACIsIdle(pstIntf->u8VDAC_Pr_R))
                {
                    return HI_FAILURE;
                }
            }
            //printk("PF_AcquireIntf2  ****(%d)(%d)(%d)***3\n", pstIntf->u8VDAC_Y_G, pstIntf->u8VDAC_Pb_B, pstIntf->u8VDAC_Pr_R);

            //acquire vdac
            if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
            {
                PF_AcquireVDAC(pstIntf->u8VDAC_Y_G);
            }

            if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
            {
                PF_AcquireVDAC(pstIntf->u8VDAC_Pb_B);
            }

            if (pstIntf->u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
            {
                PF_AcquireVDAC(pstIntf->u8VDAC_Pr_R);
            }
            break;
        default:
            break;
    }
    s_stHalIntf[pstIntf->eID].bIdle = HI_FALSE;
    s_stHalIntf[pstIntf->eID].enChan = enDisp;
    return HI_SUCCESS;
}

HI_S32 PF_ReleaseIntf2(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;
    if (    s_stHalIntf[pstIntf->eID].bSupport
            && !s_stHalIntf[pstIntf->eID].bIdle)
    {
        switch (pstIntf->eID)
        {
            case HI_DRV_DISP_INTF_YPBPR0:
            case HI_DRV_DISP_INTF_SVIDEO0:
            case HI_DRV_DISP_INTF_CVBS0:
            case HI_DRV_DISP_INTF_RGB0:
            case HI_DRV_DISP_INTF_VGA0:
                if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
                {
                    PF_ReleaseVDAC(pstIntf->u8VDAC_Y_G);
                }

                if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
                {
                    PF_ReleaseVDAC(pstIntf->u8VDAC_Pb_B);
                }

                if (pstIntf->u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
                {
                    PF_ReleaseVDAC(pstIntf->u8VDAC_Pr_R);
                }
                break;

            default:
                break;
        }

        s_stHalIntf[pstIntf->eID].bIdle = HI_TRUE;
        s_stHalIntf[pstIntf->eID].enChan = HI_DRV_DISPLAY_BUTT;
    }

    return HI_SUCCESS;
}

HI_S32 DISP_HAL_SetSyncInv(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_INTF_ID_E eID, HI_DRV_DISP_FMT_E enFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_S32  Ret = HI_FAILURE;
    HI_U32 index;
    HI_U32 u32Vinv = 0, u32Hinv = 0;
    VDP_DISP_INTF_E enIntf = VDP_DISP_INTF_BUTT;
    VDP_DISP_SYNCINV_S enInv;
    DISP_FMT_CFG_S stCfg;
    memset(&enInv, 0, sizeof(VDP_DISP_SYNCINV_S));
    memset(&stCfg, 0, sizeof(DISP_FMT_CFG_S));

    if ((enFmt < HI_DRV_DISP_FMT_CUSTOM) && (enFmt >= HI_DRV_DISP_FMT_1080P_60))
    {
        Ret = DispHalGetEnFmtIndex(enFmt, &index);
        if (HI_SUCCESS != Ret)
        {
            return Ret;
        }

        if  ( HI_SUCCESS != Get_FormatCfgPara(index , &stCfg))
        {
            return HI_FAILURE;
        }

        u32Hinv = (HI_U32) stCfg.stTiming.bIhs;
        u32Vinv = (HI_U32) stCfg.stTiming.bIvs;
    }
    else if (HI_DRV_DISP_FMT_CUSTOM == enFmt)
    {
        u32Hinv = (HI_U32) pstCustomTimg->bIHS;
        u32Vinv = (HI_U32) pstCustomTimg->bIVS;
    }
    else
    {
        u32Hinv = 0;
        u32Vinv = 0;
    }

    /*select  interface inv mode */
    switch (eID)
    {
        case HI_DRV_DISP_INTF_YPBPR0:
        case HI_DRV_DISP_INTF_RGB0:
        case HI_DRV_DISP_INTF_SVIDEO0:
        case HI_DRV_DISP_INTF_CVBS0:
            enInv.u32HsInv = u32Hinv;
            enInv.u32VsInv = u32Vinv;
            enIntf = VDP_DISP_INTF_SDDATE;
            break;
        case HI_DRV_DISP_INTF_VGA0:
            enInv.u32HsInv = u32Hinv;
            enInv.u32VsInv = u32Vinv;
            enIntf = VDP_DISP_INTF_VGA;
            break;
        case HI_DRV_DISP_INTF_HDMI0:
        case HI_DRV_DISP_INTF_HDMI1:
        case HI_DRV_DISP_INTF_HDMI2:
            Chip_Specific_GetHdmiVbiPolarity(&enInv.u32HsInv, &enInv.u32VsInv);
            enIntf = VDP_DISP_INTF_HDMI;
            break;
        case HI_DRV_DISP_INTF_LCD0:
        case HI_DRV_DISP_INTF_LCD1:
        case HI_DRV_DISP_INTF_LCD2:
            enInv.u32HsInv = u32Hinv;
            enInv.u32VsInv = u32Vinv;
            enIntf = VDP_DISP_INTF_LCD;
            break;
        case HI_DRV_DISP_INTF_BT1120_0:
        case HI_DRV_DISP_INTF_BT1120_1:
        case HI_DRV_DISP_INTF_BT1120_2:
            enIntf = VDP_DISP_INTF_BT1120;
            break;
        default:
            enIntf = VDP_DISP_INTF_BUTT;
            break;
    }

    Chip_Specific_SetSyncInv(DISP_HAL_GetChID(enDisp), enIntf, enInv);
    return HI_SUCCESS;
}

HI_VOID PF_DispIntfYpbpyReset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;
    if (eFmt >= HI_DRV_DISP_FMT_BUTT)
    {
        DISP_ERROR("eFmt out of range.\n");
        return;
    }

    if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Y_G, HI_DRV_DISP_VDAC_Y);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Y_G, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pb_B, HI_DRV_DISP_VDAC_PB);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pb_B, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pr_R, HI_DRV_DISP_VDAC_PR);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pr_R, eFmt, pstCustomTimg->u32PixFreq);
    }
}

HI_VOID PF_DispIntfRgb0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;

    if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Y_G, HI_DRV_DISP_VDAC_G);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Y_G, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pb_B, HI_DRV_DISP_VDAC_B);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pb_B, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pr_R, HI_DRV_DISP_VDAC_R);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pr_R, eFmt, pstCustomTimg->u32PixFreq);
    }
}

HI_VOID PF_DispIntfCvbs0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;

    if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Y_G, HI_DRV_DISP_VDAC_CVBS);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Y_G, eFmt, pstCustomTimg->u32PixFreq);
    }
}

HI_VOID PF_DispIntfSvideoReset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;

    if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pb_B, HI_DRV_DISP_VDAC_SV_Y);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pb_B, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pr_R, HI_DRV_DISP_VDAC_SV_C);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pr_R, eFmt, pstCustomTimg->u32PixFreq);
    }

}

HI_VOID PF_DispIntfVga0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;

    if (pstIntf->u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Y_G, HI_DRV_DISP_VDAC_G);

        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Y_G, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pb_B, HI_DRV_DISP_VDAC_B);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pb_B, eFmt, pstCustomTimg->u32PixFreq);
    }

    if (pstIntf->u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
    {
        PF_AddVDacToVenc(enDisp, pstIf->eVencId, pstIntf->u8VDAC_Pr_R, HI_DRV_DISP_VDAC_R);
        VDP_VDAC_ResetFmt(pstIf->eVencId, pstIntf->u8VDAC_Pr_R, eFmt, pstCustomTimg->u32PixFreq);
    }
}

HI_VOID PF_DispIntfHdmi0Reset(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    /*select hdmi corlor space
                vdp set  yuv ,so need  hdmi judge whether  use CSC yuv to rgb;*/
    if  (((eFmt >= HI_DRV_DISP_FMT_861D_640X480_60) && (eFmt < HI_DRV_DISP_FMT_3840X2160_24))
         || HI_DRV_DISP_FMT_CUSTOM == eFmt)
    {
        pstIf ->enHDMIDataType = DISP_HDMI_DATA_RGB;
    }
    else
    {
        pstIf ->enHDMIDataType = DISP_HDMI_DATA_YUV;
    }

    if  ((eFmt >= HI_DRV_DISP_FMT_PAL) && (eFmt <= HI_DRV_DISP_FMT_1440x480i_60) )
    {
        /*SD format */
        /*clk : 1:2*/
        VDP_DISP_SetHdmiClk(DISP_HAL_GetChID(enDisp), 1);
    }
    else
    {
        /*clk : 1:1*/
        VDP_DISP_SetHdmiClk(DISP_HAL_GetChID(enDisp), 0);
    }

    VDP_DISP_SetHdmiMode(DISP_HAL_GetChID(enDisp), pstIf->enHDMIDataType);

    VDP_DISP_SetRegUp(DISP_HAL_GetChID(enDisp));

}

HI_S32 PF_ResetIntfFmt2(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIf, HI_DRV_DISP_FMT_E eFmt, HI_DRV_DISP_TIMING_S *pstCustomTimg)
{
    HI_DRV_DISP_INTF_S *pstIntf = &pstIf->stIf;
    VDP_DISP_INTF_E enVdpIntf;
    HI_S32  S32Index = 0;
    HI_S32  Ret = HI_FAILURE;
    HI_BOOL  BIntfFindFlag = HI_FALSE;

    enVdpIntf = DISP_HAL_GetHalIntfIdForVenc(enDisp, pstIf, eFmt);

    if (VDP_DISP_INTF_SDDATE == enVdpIntf )
    {
        VDP_DISP_SetIntfMuxSel(DISP_HAL_GetChID(enDisp), enVdpIntf);
    }
    else
    {
        VDP_DISP_SetIntfMuxSel(DISP_HAL_GetChID(enDisp), enVdpIntf);
    }

    if ( pstIf->bLinkVenc)
    {
        /* DISP1 support small format, no need to distinguish DISP and format */
        VDP_DATE_ResetFmt(pstIf->eVencId, eFmt);
    }

    // s4 add vdac to venc
    Ret = DISP_HAL_SetSyncInv(enDisp, pstIf->stIf.eID, eFmt, pstCustomTimg);
    if (HI_SUCCESS != Ret)
    {
        DISP_ERROR("DISP_HAL_SetSyncInv fail.\n");
        return Ret;
    }

    //add rgb and Ypbpr interface
    if ((HI_DRV_DISP_INTF_RGB0 == pstIf->stIf.eID) || (HI_DRV_DISP_INTF_YPBPR0 == pstIf->stIf.eID))
    {
        VDP_DATE_SetSignal(pstIf->stIf.eID, pstIf->eVencId, pstIntf->bDacSync);
    }

    for (S32Index = 0; (S32Index < sizeof(s_aIntfResetFunctionTable) / sizeof(DISP_INTF_INFO_S)); S32Index++)
    {
        if (pstIf->stIf.eID == s_aIntfResetFunctionTable[S32Index].enIntfId)
        {
            BIntfFindFlag = HI_TRUE;
            s_aIntfResetFunctionTable[S32Index].PF_DispIntfRestFunction(enDisp, pstIf, eFmt, pstCustomTimg);
            DRV_SetDateAttachToComReg(pstIf->eVencId, enDisp);

            break;
        }
    }

    if (HI_FALSE == BIntfFindFlag)
    {
        return  VDP_DISP_INTF_BUTT;
    }

    return HI_SUCCESS;
}


#define DEF_DISP_Y_VDAC_DELAY 40
#define DEF_DISP_PB_VDAC_DELAY 20
#define DEF_DISP_PR_VDAC_DELAY 20

HI_S32 PF_SetIntfEnable2(HI_DRV_DISPLAY_E enDisp, DISP_INTF_S *pstIt, HI_BOOL bEnable)
{
    /* switch fmt process:
        attach mode :
            step1: close HD  adn SD interface
            step2: switch format
            step3: open  HD  adn SD interface,
        no attach mode :
            step1: close HD/SD interface
            step2: switch format
            step3: open HD/SD interface,
        but in  no attach mode:
            if disp1 switch format  HDFmt -->SDFmt ,
            step1: close hdate
            step2: switch format
            step3: open sdate,
            SDFmt -->HDFmt has the same bug;
            so should process disp  by channel;
    */

    // set vdac link
    if (pstIt->stIf.u8VDAC_Y_G != HI_DISP_VDAC_INVALID_ID)
    {
        if (pstIt->stIf.u8VDAC_Y_G >= sizeof(g_stVDACAttr.stDACState) / sizeof(HI_DRV_VDAC_STATE_S))
        {
            DISP_ERROR("pstIt->stIf.u8VDAC_Y_G is too big:%d!\n", pstIt->stIf.u8VDAC_Y_G);
            return HI_FAILURE;
        }

        if (DISP_VENC_VGA0 == pstIt->eVencId)
        {
            g_stVDACAttr.stDACState[pstIt->stIf.u8VDAC_Y_G].bDACDetectEn = HI_FALSE;
        }
        else
        {
            g_stVDACAttr.stDACState[pstIt->stIf.u8VDAC_Y_G].bDACDetectEn = bEnable;
        }

        if (bEnable)
        {
            PF_SetVDACEnable(pstIt->stIf.u8VDAC_Y_G, bEnable, 0);
        }
        else
        {
            PF_SetVDACEnable(pstIt->stIf.u8VDAC_Y_G, bEnable, DEF_DISP_Y_VDAC_DELAY);
        }
    }

    if (pstIt->stIf.u8VDAC_Pb_B != HI_DISP_VDAC_INVALID_ID)
    {
        if (pstIt->stIf.u8VDAC_Pb_B >= sizeof(g_stVDACAttr.stDACState) / sizeof(HI_DRV_VDAC_STATE_S))
        {
            DISP_ERROR("pstIt->stIf.u8VDAC_Pb_B is too big.\n");
            return HI_FAILURE;
        }

        if (DISP_VENC_VGA0 == pstIt->eVencId)
        {
            g_stVDACAttr.stDACState[pstIt->stIf.u8VDAC_Pb_B].bDACDetectEn = HI_FALSE;
        }
        else
        {
            g_stVDACAttr.stDACState[pstIt->stIf.u8VDAC_Pb_B].bDACDetectEn = bEnable;
        }

        if (bEnable)
        {
            PF_SetVDACEnable(pstIt->stIf.u8VDAC_Pb_B, bEnable, 0);
        }
        else
        {
            PF_SetVDACEnable(pstIt->stIf.u8VDAC_Pb_B, bEnable, DEF_DISP_PB_VDAC_DELAY);
        }
    }

    if (pstIt->stIf.u8VDAC_Pr_R != HI_DISP_VDAC_INVALID_ID)
    {
        if (pstIt->stIf.u8VDAC_Pr_R >= sizeof(g_stVDACAttr.stDACState) / sizeof(HI_DRV_VDAC_STATE_S))
        {
            DISP_ERROR("pstIt->stIf.u8VDAC_Pr_R is too big.\n");
            return HI_FAILURE;
        }

        if (DISP_VENC_VGA0 == pstIt->eVencId)
        {
            g_stVDACAttr.stDACState[pstIt->stIf.u8VDAC_Pr_R].bDACDetectEn = HI_FALSE;
        }
        else
        {
            g_stVDACAttr.stDACState[pstIt->stIf.u8VDAC_Pr_R].bDACDetectEn = bEnable;
        }

        if (bEnable)
        {
            PF_SetVDACEnable(pstIt->stIf.u8VDAC_Pr_R, bEnable, 0);
        }
        else
        {
            PF_SetVDACEnable(pstIt->stIf.u8VDAC_Pr_R, bEnable, DEF_DISP_PB_VDAC_DELAY);
        }
    }

    return HI_SUCCESS;
}





/*===========================================================*/
/* WBC manager */
HI_VOID InitWbcState(HI_VOID)
{
    DISP_WBC_E eID;

    for (eID = DISP_WBC_00; eID < DISP_WBC_BUTT; eID++)
    {
        s_stWBC[eID].bSupport = HI_TRUE;
        s_stWBC[eID].bIdle    = HI_TRUE;
    }

    return;
}


HI_S32 PF_AcquireWbcByChn(HI_DRV_DISPLAY_E eChn, DISP_WBC_E *peWbc)
{
    if (eChn == HI_DRV_DISPLAY_1)
    {
        if (  (s_stWBC[DISP_WBC_00].bSupport == HI_TRUE)
              && (s_stWBC[DISP_WBC_00].bIdle == HI_TRUE)
           )
        {
            s_stWBC[DISP_WBC_00].bIdle = HI_FALSE;
            s_stWBC[DISP_WBC_00].u32RefCnt = 1;
            *peWbc = DISP_WBC_00;
            return HI_SUCCESS;
        }
        else if ((s_stWBC[DISP_WBC_00].bSupport == HI_TRUE)
                 && (s_stWBC[DISP_WBC_00].bIdle == HI_FALSE))
        {
            s_stWBC[DISP_WBC_00].u32RefCnt++;
            *peWbc = DISP_WBC_00;
            return HI_SUCCESS;
        }
    }

    return HI_FAILURE;
}

HI_S32 PF_AcquireWbc(DISP_WBC_E eWbc)
{
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }

    if (  (s_stWBC[eWbc].bSupport == HI_TRUE)
          && (s_stWBC[eWbc].bIdle == HI_TRUE)
       )
    {
        s_stWBC[eWbc].bIdle = HI_FALSE;
        s_stWBC[eWbc].u32RefCnt = 1;
        return HI_SUCCESS;
    }
    else if ((s_stWBC[eWbc].bSupport == HI_TRUE)
             && (s_stWBC[eWbc].bIdle == HI_FALSE))
    {
        s_stWBC[eWbc].u32RefCnt ++;
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

HI_S32 PF_ReleaseWbc(DISP_WBC_E eWbc)
{
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }

    if (  (s_stWBC[eWbc].bSupport == HI_TRUE)
          && (s_stWBC[eWbc].bIdle == HI_FALSE)
       )
    {
        if (--s_stWBC[eWbc].u32RefCnt == 0)
        {
            s_stWBC[eWbc].bIdle = HI_TRUE;
        }
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

#ifndef __DISP_PLATFORM_BOOT__
static VDP_LAYER_WBC_E s_eWbcHalID[DISP_WBC_BUTT] =
{VDP_LAYER_WBC_HD0, VDP_LAYER_WBC_HD0};
#endif

#ifndef __DISP_PLATFORM_BOOT__
static HI_S32 HAL_ReviseWbcZmeInput(DISP_WBC_E eWbc, HI_DISP_DISPLAY_INFO_S *pstDispInfo, HI_U32 *u32Width, HI_U32 *u32Height)
{
    return Chip_Specific_ReviseWbcZmeInput(eWbc, pstDispInfo, u32Width, u32Height);
}
#endif


HI_S32 PF_SetWbc3DInfo(DISP_WBC_E eWbc, HI_DISP_DISPLAY_INFO_S *pstDispInfo, HI_RECT_S *in, HI_RECT_S *out)
{
#ifndef __DISP_PLATFORM_BOOT__
    return Chip_Specific_SetWbc3DInfo(eWbc, pstDispInfo, in, out);
#else
    return HI_SUCCESS;
#endif
}

HI_S32 PF_GetIsogenyMode(ISOGENY_MODE_E *peIsogeny_mode)
{
#ifndef __DISP_PLATFORM_BOOT__
    *peIsogeny_mode = Chip_Specific_GetIsogenyMode();
#endif

    return HI_SUCCESS;
}

HI_S32 PF_SetWbcIORect(DISP_WBC_E eWbc,
                       HI_DISP_DISPLAY_INFO_S *pstDispInfo,
                       HI_RECT_S *in,
                       HI_RECT_S *out)
{
#ifndef __DISP_PLATFORM_BOOT__
    VDP_DISP_RECT_S stRect = {0};
    HI_PQ_ZME_PARA_IN_S stZmeI = {0};
    HI_U32 pbBtm = 0, pu32Vcnt = 0;
    HI_BOOL bAlwayPro = HI_FALSE;
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }

    DISP_MEMSET(&stRect, 0, sizeof(VDP_DISP_RECT_S));
    DISP_MEMSET(&stZmeI, 0, sizeof(HI_PQ_ZME_PARA_IN_S));

    stRect.u32DXS = (HI_U32)in->s32X;
    stRect.u32DYS = (HI_U32)in->s32Y;

    stRect.u32DXL = (HI_U32)in->s32Width + stRect.u32DXS;
    stRect.u32DYL = (HI_U32)in->s32Height  + stRect.u32DYS;

    stRect.u32OWth = (HI_U32)out->s32Width;
    stRect.u32OHgt = (HI_U32)out->s32Height;
    VDP_WBC_SetLayerReso(s_eWbcHalID[eWbc], stRect);

#if (defined(CHIP_TYPE_hi3798mv310) || defined(CHIP_TYPE_hi3716mv430))

    if (DISP_STEREO_SBS_HALF == pstDispInfo->eDispMode)
    {
        stZmeI.u32ZmeFrmWIn = in->s32Width;
        stZmeI.u32ZmeFrmHIn = in->s32Height;

        stZmeI.u32ZmeFrmWOut = (HI_U32)out->s32Width * 2;
        stZmeI.u32ZmeFrmHOut = (HI_U32)out->s32Height;

    }
    else if (DISP_STEREO_TAB == pstDispInfo->eDispMode)
    {
        stZmeI.u32ZmeFrmWIn = in->s32Width;
        stZmeI.u32ZmeFrmHIn = in->s32Height / 2;

        stZmeI.u32ZmeFrmWOut = (HI_U32)out->s32Width;
        stZmeI.u32ZmeFrmHOut = (HI_U32)out->s32Height;
    }
    else
    {
        stZmeI.u32ZmeFrmWIn = in->s32Width;
        stZmeI.u32ZmeFrmHIn = in->s32Height;

        stZmeI.u32ZmeFrmWOut = (HI_U32)out->s32Width;
        stZmeI.u32ZmeFrmHOut = (HI_U32)out->s32Height;
    }

#else

    if (in->s32Width > 1920 || in->s32Height > 1080)
    {
        stZmeI.u32ZmeFrmWIn = in->s32Width / 2;
        VDP_WBC_SetHorZmeEnable(s_eWbcHalID[eWbc], HI_TRUE);
        VDP_WBC_SetZmeHfirOrder(s_eWbcHalID[eWbc], 0);
    }
    else
    {
        stZmeI.u32ZmeFrmWIn = in->s32Width;
        VDP_WBC_SetHorZmeEnable(s_eWbcHalID[eWbc], HI_FALSE);
        VDP_WBC_SetZmeHfirOrder(s_eWbcHalID[eWbc], 1);
    }

    stZmeI.u32ZmeFrmHIn = in->s32Height;

    stZmeI.u32ZmeFrmWOut = (HI_U32)out->s32Width;
    stZmeI.u32ZmeFrmHOut = (HI_U32)out->s32Height;

#endif

    /*wbc we fix to progressive.*/
    VDP_WBC_SetOutIntf(s_eWbcHalID[eWbc], VDP_RMODE_PROGRESSIVE);

    HAL_ReviseWbcZmeInput(eWbc, pstDispInfo, &stZmeI.u32ZmeFrmWIn, &stZmeI.u32ZmeFrmHIn);

    stZmeI.enZmeInFmt  = HI_PQ_ALG_PIX_FORMAT_SP422; /*zme in is always 422.*/
    stZmeI.enZmeOutFmt = HI_PQ_ALG_PIX_FORMAT_SP420; /*zme out is 420 in wbc for encoder,
                               other condition  422 may be neccessary,but ip not validated.*/

    /*Pay attention, although we set frame width to ip,
      but here we should pass real filed mode to alg.*/
    (HI_VOID)VDP_WBC_GetAlwaysProFlag(/*eWbc,*/ &bAlwayPro);

    if (bAlwayPro == 0)
    {
        if (0 == VDP_DHD_GetDispMode(0))
        {
            /*since this configure will take affect next intr,so opposite it.*/
            VDP_DISP_GetVactState(0, &pbBtm, &pu32Vcnt);
            pbBtm = 1 - pbBtm;
            stZmeI.bZmeFrmFmtIn  = 0;
            stZmeI.bZmeBFIn  = pbBtm;
        }
        else
        {
            stZmeI.bZmeFrmFmtIn  = 1;
            stZmeI.bZmeBFIn  = 0;
        }

    }
    else
    {
        /*in cv200, always progressive.*/
        stZmeI.bZmeFrmFmtIn = 1;
        stZmeI.bZmeBFIn  = 0;
    }

    /*wbc output fix to 1, frame.*/
    stZmeI.bZmeFrmFmtOut = 1;
    stZmeI.bZmeBFOut = 0;

    if (HI_SUCCESS != Chip_Specific_WbcZmeFunc(HI_PQ_ZME_LAYER_WBC_VP, &stZmeI, HI_TRUE))
    {
        return HI_FAILURE;
    }
#endif

    return HI_SUCCESS;
}

HI_S32 PF_SetWbcColorSpace(DISP_WBC_E eWbc, HI_DRV_COLOR_SPACE_E eSrcCS, HI_DRV_COLOR_SPACE_E eDstCS)
{
#ifndef __DISP_PLATFORM_BOOT__
    VDP_CSC_DC_COEF_S stDcCoef;
    VDP_CSC_COEF_S stCoef;
    HI_PQ_CSC_MODE_E enCSCMode = HI_PQ_CSC_BUTT;

    if ((HI_DRV_CS_BT601_YUV_LIMITED != eSrcCS)
        && (HI_DRV_CS_BT709_YUV_LIMITED != eSrcCS)
        && (HI_DRV_CS_BT709_RGB_FULL != eSrcCS)
        && (HI_DRV_CS_BT2020_YUV_LIMITED != eSrcCS))
    {
        eSrcCS = HI_DRV_CS_BT709_YUV_LIMITED;
    }

    switch (eSrcCS)
    {
        case HI_DRV_CS_BT601_YUV_LIMITED:
            switch (eDstCS)
            {
                case HI_DRV_CS_BT709_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_YUV2YUV_601_709;
                    break;
                case HI_DRV_CS_BT601_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_YUV2YUV;
                    break;
                case HI_DRV_CS_BT709_RGB_FULL:
                    enCSCMode = HI_PQ_CSC_YUV2RGB_601;
                    break;
                default:
                    enCSCMode = HI_PQ_CSC_BUTT;
                    break;
            }
            break;
        case HI_DRV_CS_BT601_YUV_FULL:
            switch (eDstCS)
            {
                case HI_DRV_CS_BT709_RGB_FULL:
                    enCSCMode = HI_PQ_CSC_YUV2RGB_601;
                    break;
                default:
                    enCSCMode = HI_PQ_CSC_BUTT;
                    break;
            }
            break;
        case HI_DRV_CS_BT709_YUV_LIMITED:
            switch (eDstCS)
            {
                case HI_DRV_CS_BT709_RGB_FULL:
                    enCSCMode = HI_PQ_CSC_YUV2RGB_709;
                    break;
                case HI_DRV_CS_BT601_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_YUV2YUV_709_601;
                    break;
                case HI_DRV_CS_BT709_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_YUV2YUV;
                    break;
                default:
                    enCSCMode = HI_PQ_CSC_BUTT;
                    break;
            }
            break;
        case HI_DRV_CS_BT709_YUV_FULL:
            switch (eDstCS)
            {
                case HI_DRV_CS_BT709_RGB_FULL:
                    enCSCMode = HI_PQ_CSC_YUV2RGB_709_FULL;
                    break;
                default:
                    enCSCMode = HI_PQ_CSC_BUTT;
                    break;
            }
            break;
        case HI_DRV_CS_BT709_RGB_FULL:
            switch (eDstCS)
            {
                case HI_DRV_CS_BT601_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_RGB2YUV_601;
                    break;
                case HI_DRV_CS_BT601_YUV_FULL:
                    enCSCMode = HI_PQ_CSC_RGB2YUV_601_FULL;
                    break;
                case HI_DRV_CS_BT709_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_RGB2YUV_709;
                    break;
                case HI_DRV_CS_BT709_YUV_FULL:
                    enCSCMode = HI_PQ_CSC_RGB2YUV_709_FULL;
                    break;
                case HI_DRV_CS_BT709_RGB_FULL:
                    enCSCMode = HI_PQ_CSC_RGB2RGB;
                    break;
                default:
                    enCSCMode = HI_PQ_CSC_BUTT;
                    break;
            }
            break;
        case HI_DRV_CS_BT2020_YUV_LIMITED:
            switch (eDstCS)
            {
                case HI_DRV_CS_BT601_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_YUV2YUV_2020_601_L_L;
                    break;
                case HI_DRV_CS_BT709_YUV_LIMITED:
                    enCSCMode = HI_PQ_CSC_YUV2YUV_2020_709_L_L;
                    break;
                default:
                    enCSCMode = HI_PQ_CSC_BUTT;
                    break;
            }
            break;
        default:
            DISP_ERROR("Input wrong csc.\n");
            break;
    }

    DRV_PQ_Get8BitCSCCoef(enCSCMode, (HI_PQ_CSC_COEF_S *)&stCoef, (HI_PQ_CSC_DCCOEF_S *)&stDcCoef);

    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }

    if (eSrcCS == eDstCS)
    {
        VDP_WBC_SetCscEnable(s_eWbcHalID[eWbc], HI_FALSE);
    }
    else
    {
        VDP_WBC_SetCscDcCoef(s_eWbcHalID[eWbc], stDcCoef);
        VDP_WBC_SetCscCoef(s_eWbcHalID[eWbc], stCoef);
        VDP_WBC_SetCscEnable(s_eWbcHalID[eWbc], HI_TRUE);
    }

#endif

    return HI_SUCCESS;
}


HI_S32 PF_SetWbcPixFmt(DISP_WBC_E eWbc, HI_DRV_PIX_FORMAT_E eFmt)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }

    switch (eFmt)
    {
        case HI_DRV_PIX_FMT_NV21:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_SP420);
            VDP_WBC_SetUVOrder(s_eWbcHalID[eWbc], 0);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_420);
            break;
        case HI_DRV_PIX_FMT_NV12:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_SP420);
            VDP_WBC_SetUVOrder(s_eWbcHalID[eWbc], 1);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_420);
            break;
        case HI_DRV_PIX_FMT_NV61_2X1:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_SP422);
            VDP_WBC_SetUVOrder(s_eWbcHalID[eWbc], 0);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_422);
            break;
        case HI_DRV_PIX_FMT_NV16_2X1:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_SP422);
            VDP_WBC_SetUVOrder(s_eWbcHalID[eWbc], 1);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_422);
            break;
        case HI_DRV_PIX_FMT_YUYV:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_PKG_YUYV);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_422);
            break;
        case HI_DRV_PIX_FMT_UYVY:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_PKG_UYVY);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_422);
            break;
        case HI_DRV_PIX_FMT_YVYU:
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_PKG_YVYU);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_422);
            break;
        default :
            DISP_FATAL("set cast format %d fail\n", eFmt);
            VDP_WBC_SetOutFmt(s_eWbcHalID[eWbc], VDP_WBC_OFMT_SP420);
            VDP_WBC_SetUVOrder(s_eWbcHalID[eWbc], 0);
            VDP_WBC_SetZmeOutFmt(s_eWbcHalID[eWbc], VDP_PROC_FMT_SP_420);
            break;
    }

#endif

    return HI_SUCCESS;
}

HI_S32 PF_SetWbcAddr(DISP_WBC_E eWbc, HI_DRV_VID_FRAME_ADDR_S *pstAddr)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetLayerAddr(s_eWbcHalID[eWbc],
                         pstAddr->u32PhyAddr_Y, pstAddr->u32PhyAddr_C,
                         pstAddr->u32Stride_Y, pstAddr->u32Stride_C);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_SetWbcEnableCfg(DISP_WBC_E eWbc, WBC_DHD0_Cfg_S *pstCfg)
{
#ifndef __DISP_PLATFORM_BOOT__
    HI_U32 u32Mode;
    HI_U32 u32RootPath;

    if ((eWbc >= DISP_WBC_BUTT) || (HI_NULL == pstCfg))
    {
        DISP_ERROR("Invalid para eWbc %d pstCfg %p.\n", eWbc, pstCfg);
        return HI_FAILURE;
    }

    switch (pstCfg->mode_out)
    {
        case 0:
            u32Mode = XDP_WBC_MODE_OUT_INTERFACE;
            break;
        case 1:
            u32Mode = XDP_WBC_MODE_OUT_PROGRESIVE;
            break;
        case 2:
            u32Mode = XDP_WBC_MODE_OUT_TOP;
            break;
        case 3:
            u32Mode = XDP_WBC_MODE_OUT_BOTTOM;
            break;
        default:
            DISP_ERROR("u32ModeOut out of range. %u\n", pstCfg->mode_out);
            u32Mode = XDP_WBC_MODE_OUT_INTERFACE;
            break;
    }

    switch(pstCfg->root_path)
    {
        case 0:
            u32RootPath = XDP_WBC_ROOT_PATH_ACBM;
            break;
        case 1:
            u32RootPath = XDP_WBC_ROOT_PATH_BZME;
            break;
        case 2:
            u32RootPath = XDP_WBC_ROOT_PATH_BLBX;
            break;
        default:
            DISP_ERROR("root_path out of range. %u\n", pstCfg->root_path);
            u32RootPath = XDP_WBC_ROOT_PATH_BZME;
            break;
    }

    VDP_WBC_SetModeOut(s_eWbcHalID[eWbc], u32Mode);
    VDP_WBC_SetWbcPoint(s_eWbcHalID[eWbc], u32RootPath);
    VDP_WBC_SetUpdMode(s_eWbcHalID[eWbc], pstCfg->rgup_mode);
    VDP_WBC_Set3DMode(s_eWbcHalID[eWbc], pstCfg->three_d_mode);
    VDP_WBC_SetEnable(s_eWbcHalID[eWbc], pstCfg->bEnable);

#endif
    return HI_SUCCESS;
}

HI_S32 PF_SetVidRegUp(VDP_LAYER_VID_E eVid)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eVid >= VDP_LAYER_VID_BUTT)
    {
        DISP_ERROR("eVid out of range.\n");
        return HI_FAILURE;
    }
    VDP_VID_SetRegUp((HI_U32)eVid);
#endif
    return HI_SUCCESS;
}
HI_S32 PF_SetWbcEnable(DISP_WBC_E eWbc, HI_BOOL bEnable)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetEnable(s_eWbcHalID[eWbc], (HI_U32)bEnable);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_SetWbcLowdlyEnable(DISP_WBC_E eWbc, HI_BOOL bEnable)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetLowdlyEnable(s_eWbcHalID[eWbc], (HI_U32)bEnable);
#endif
    return HI_SUCCESS;
}

HI_S32  PF_SetWbcPartfnsLineNum(DISP_WBC_E eWbc, HI_U32 u32LineNum)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetPartfnsLineNum(s_eWbcHalID[eWbc], u32LineNum);
#endif

    return HI_SUCCESS;
}

HI_S32  PF_SetWbcLineNumInterval(DISP_WBC_E eWbc, HI_U32 u32Interval)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetWbPerLineNum(s_eWbcHalID[eWbc], u32Interval);
#endif

    return HI_SUCCESS;
}

HI_S32 PF_SetWbcLineAddr(DISP_WBC_E eWbc, HI_U32 u32Addr)
{

#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetTunlCellAddr(s_eWbcHalID[eWbc], u32Addr);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_SetWbcSmmuBypass(DISP_WBC_E eWbc, HI_BOOL bBypass)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_ConfigSmmuBypass(s_eWbcHalID[eWbc], bBypass);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_UpdateWbc(DISP_WBC_E eWbc)
{
#ifndef __DISP_PLATFORM_BOOT__
    if (eWbc >= DISP_WBC_BUTT)
    {
        DISP_ERROR("eWbc out of range.\n");
        return HI_FAILURE;
    }
    VDP_WBC_SetRegUp(s_eWbcHalID[eWbc]);
#endif
    return HI_SUCCESS;
}

HI_S32 PF_CBM_MovTOP(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_LAYER_E enLayer)
{
    return Chip_Specific_CBM_MovTOP(enDisp, enLayer);
}

HI_S32 PF_VDP_RegSave(HI_VOID)
{
    HI_U32 nRet;
    nRet = DISP_OS_MMZ_Map(&g_RegBackBuf);
    if (HI_SUCCESS == nRet)
    {
        VDP_RegSave(g_RegBackBuf.pu8StartVirAddr);
        DISP_OS_MMZ_UnMap(&g_RegBackBuf);
    }
    else
    {
        DISP_FATAL("save reg buffer mmz mmp fail\n");
        return HI_ERR_DISP_MALLOC_MAP_ERR;
    }
    return HI_SUCCESS;
}
HI_S32 PF_VDP_RegReStore(HI_VOID)
{
    HI_U32 nRet;
    nRet = DISP_OS_MMZ_Map(&g_RegBackBuf);
    if (HI_SUCCESS == nRet)
    {
        VDP_RegReStore(g_RegBackBuf.pu8StartVirAddr);
        DISP_OS_MMZ_UnMap(&g_RegBackBuf);
    }
    else
    {
        DISP_FATAL("restore reg buffer mmz mmp fail\n");
        return HI_ERR_DISP_MALLOC_MAP_ERR;
    }
    return HI_SUCCESS;
}

//interrupt
#define DAC_B    0x1           //DAC3
#define DAC_R    0x2           //DAC1
#define DAC_G    0x4           //DAC2
#define DAC_CVBS 0x8           //DAC0

/*******************************************
interrupt           vo dac ctrl
DAC0    ---------->> VDAC3    0xf8cc013c
DAC1    ---------->> VDAC0    0xf8cc0130
DAC2    ---------->> VDAC1    0xf8cc0134
DAC3    ---------->> VDAC2    0xf8cc0138
********************************************/

HI_S32 DAC_PoweDown(HI_U8 u8DAC)
{
    HI_U32 s32Enable = 0;

    if (u8DAC >= sizeof(g_stVDACAttr.stDACState) / sizeof(HI_DRV_VDAC_STATE_S))
    {
        DISP_ERROR("u8DAC out of range.\n");
        return HI_FAILURE;
    }

    if (!g_stVDACAttr.stDACState[u8DAC].bDACDetectEn)
    {
        return HI_SUCCESS;
    }

    VDP_VDAC_GetEnable(u8DAC, &s32Enable);
    if (s32Enable)
    {
        VDP_VDAC_SetEnable(u8DAC, HI_FALSE, 0);
    }
    return HI_SUCCESS;
}

HI_S32 DAC_PoweUp(HI_U8 u8DAC)
{
    HI_U32 s32Enable = 0;
    if (!g_stVDACAttr.stDACState[u8DAC].bDACDetectEn)
    {
        return HI_SUCCESS;
    }

    VDP_VDAC_GetEnable(u8DAC, &s32Enable);
    if (!s32Enable)
    {
        VDP_VDAC_SetEnable(u8DAC, HI_TRUE, 0);
    }
    return HI_SUCCESS;
}

#define WAKEUP_TIMER_MS 2000
#define POWERDOWN_TIMRR_MS 100
#define POWERUP_EVENT    1
#define POWERDOWN_EVENT  2

HI_VOID InitDacDetectStatus(HI_U32 u32Index, HI_BOOL bEnable)
{
    if (u32Index >= HI_DISP_VDAC_MAX_NUMBER)
    {
        return;
    }
    //printk("dac--init detect -----(%d)=============%d\n",u32Index,bEnable);
    g_stVDACAttr.stDACState[u32Index].bDACDetectEn = bEnable;
}

HI_S32 PF_InitDacDetect( HI_DRV_DISP_INTF_S *pstIf)
{
    HI_BOOL bEnable = HI_FALSE;

    if (HI_DRV_DISP_INTF_VGA0 == pstIf->eID)
    {
        InitDacDetectStatus(pstIf->u8VDAC_Y_G, HI_FALSE);
        InitDacDetectStatus(pstIf->u8VDAC_Pb_B, HI_FALSE);
        InitDacDetectStatus(pstIf->u8VDAC_Pr_R, HI_FALSE);
    }
    else
    {
        VDP_VDAC_GetEnable(pstIf->u8VDAC_Y_G, &bEnable);
        InitDacDetectStatus(pstIf->u8VDAC_Y_G, bEnable);

        VDP_VDAC_GetEnable(pstIf->u8VDAC_Pb_B, &bEnable);
        InitDacDetectStatus(pstIf->u8VDAC_Pb_B, bEnable);

        VDP_VDAC_GetEnable(pstIf->u8VDAC_Pr_R, &bEnable);
        InitDacDetectStatus(pstIf->u8VDAC_Pr_R, bEnable);
    }
    return HI_SUCCESS;
}

HI_S32 PF_SetDACDetEn (HI_BOOL bDACDetEn)
{
    return HI_SUCCESS;
}

HI_S32 PF_GetDACAttr(HI_DRV_VDAC_ATTR_S *pDACAttr)
{
    *pDACAttr = g_stVDACAttr;
    return HI_SUCCESS;
}

HI_S32 PF_DACIsr(HI_U8 u8DAC)
{
    return HI_SUCCESS;
}

/*==============================================*/
HI_VOID DispGetVersion(HI_DRV_DISP_VERSION_S *pVersion)
{
    Chip_Specific_GetVersion(pVersion);
    return;
}



HI_S32 PF_DATE_SetCoef(HI_DRV_DISPLAY_E enDisp, HI_S32 u32Index)
{
    if (HI_DRV_DISPLAY_0 != enDisp)
    {
        return HI_FAILURE;
    }

    VDP_DATE_SetSrcCoef(DISP_VENC_SDATE0, VDP_Get_SDateSrcCoef(u32Index));

    return HI_SUCCESS;
}

HI_S32 PF_DATE_SetIRE(HI_DRV_DISPLAY_E enDisp, HI_U32 u32IRE)
{
    if (HI_DRV_DISPLAY_0 != enDisp)
    {
        return HI_FAILURE;
    }

    SDATE_SetIreEn(u32IRE);
    return HI_SUCCESS;
}
HI_S32 PF_SetAllDACEn (HI_BOOL bDACEn)
{
    if (bDACEn)
    {
        DAC_PoweUp(DAC_C_CTRL);
        DAC_PoweUp(DAC_R_CTRL);
        DAC_PoweUp(DAC_G_CTRL);
        DAC_PoweUp(DAC_B_CTRL);
    }
    else
    {
        DAC_PoweDown(DAC_C_CTRL);
        DAC_PoweDown(DAC_R_CTRL);
        DAC_PoweDown(DAC_G_CTRL);
        DAC_PoweDown(DAC_B_CTRL);
    }

    return HI_SUCCESS;
}

#ifndef __DISP_PLATFORM_BOOT__
HI_VOID PF_SetGfxXdrMode(HI_DRV_DISP_OUT_TYPE_E enDispOutType, HI_DRV_COLOR_SPACE_E enOutColorSpace)
{
    //ADAPTER_SetGfxXdrMode(enDispOutType, enOutColorSpace);
    return;
}

HI_BOOL PF_CheckOutputTypeValid(HI_DRV_DISP_OUT_TYPE_E enDispType)
{
    return XDR_SPECIFIC_CheckOutputSignalValid(enDispType);
}

HI_VOID PF_ResetV0V1Layer(HI_VOID)
{
    //ADAPTER_CloseV0V1Layer();

    return;
}

HI_VOID PF_AdjustConfig(WIN_SHARE_INFO_S  *pstWinShareInfo,
                        HI_U32             u32MaxWinIndex,
                        HI_BOOL            *pbVdmProcess,
                        HI_DRV_DISP_PROCESS_MODE_E  enLastDispProcessMode,
                        HI_DRV_DISP_PROCESS_MODE_E  *penDispProcessMode,
                        DISP_XDR_PLAY_INFO_S    *pstXdrFinalPlayInfo,
                        DISP_XDR_PLAY_INFO_S    *pstXdrPrePlayInfo,
                        HI_DRV_COLOR_SPACE_E    enFmtOutColorCsc)
{
    XDR_SPECIFIC_AdjustConfig(pstWinShareInfo,
                              u32MaxWinIndex,
                              pbVdmProcess,
                              enLastDispProcessMode,
                              penDispProcessMode,
                              pstXdrFinalPlayInfo,
                              pstXdrPrePlayInfo,
                              enFmtOutColorCsc);
    return;
}


HI_VOID PF_SetHdLayer(WIN_SHARE_INFO_S *pstWinShareInfo,
                      HI_BOOL *pbVdmArray,
                      HI_DRV_DISP_PROCESS_MODE_E enDispProcessMode)
{
    HI_U32 u32Index = 0;

    for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
    {
        if (WIN_SHARE_HandleValid(pstWinShareInfo->stWinInfo[u32Index].hWinHandle))
        {

            ADAPTER_SetLayerCfg_Win(pstWinShareInfo,
                                u32Index,
                                pbVdmArray,
                                HI_TRUE);
        }
    }

    return;
}

HI_S32 PF_CheckRegConfig(HI_CHAR *pcheckItem)
{
    CBB_Video_CheckRegConfig(pcheckItem);
    return HI_SUCCESS;
}


HI_VOID PF_GetGfxState(HI_BOOL *pbNeedProcessGfx)
{
    VDP_DRV_GetGfxState(pbNeedProcessGfx);
    return;
}

static HI_VOID DISP_HdrChangeToSdrProcess(HI_VOID)
{
#ifdef CFG_HI3798CV200
    VDP_DRV_HdrRegClean();
    XDP_DRV_GfxHdrRegClean();
#endif
    return;
}

/* backup and mask gfx when work mode change in current interrupt, and to restore it in next interrupt,
*  and to clean hdr configure when  workmode change to sdr.
*/
HI_VOID PF_WorkModeChangeProcess(HI_BOOL bWorkModeChange, HI_BOOL bCurSdrWorkMode)
{
    static HI_U32 s_u32Alpha = 0;
    static HI_U32 s_u32MuteState = 0;

    if (bWorkModeChange)
    {
        /* clean all hdr related registers when quit hdr work mode */
        if (bCurSdrWorkMode)
        {
            DISP_HdrChangeToSdrProcess();
        }

        /* set gfx process status when work mode change. */
        if (MASK_AND_RESTORE_GFX_COMPLETE == gs_enGfxProcessStatus)
        {
            gs_enGfxProcessStatus = MASK_AND_RESTORE_GFX_TO_MASK;
        }
        else
        {
            gs_enGfxProcessStatus = MASK_AND_RESTORE_GFX_KEEP_MASK;
        }
    }

    switch (gs_enGfxProcessStatus)
    {
        case MASK_AND_RESTORE_GFX_COMPLETE:
            //do nothing.
            break;
        case MASK_AND_RESTORE_GFX_TO_MASK:
            VDP_DRV_MaskAndBackupGfx(0, &s_u32Alpha, &s_u32MuteState);
            gs_enGfxProcessStatus = MASK_AND_RESTORE_GFX_TO_RESTORE;
            break;
        case MASK_AND_RESTORE_GFX_KEEP_MASK:
            gs_enGfxProcessStatus = MASK_AND_RESTORE_GFX_TO_RESTORE;
            break;
        case MASK_AND_RESTORE_GFX_TO_RESTORE:
            VDP_DRV_UnmaskGfx(0, s_u32Alpha, s_u32MuteState);
            VDP_DRV_SetGfxMixvBypassState(0, !bCurSdrWorkMode);
            gs_enGfxProcessStatus = MASK_AND_RESTORE_GFX_COMPLETE;
            break;
        default:
            HI_ERR_DISP("Status of GFX is Wrong!gs_enGfxProcessStatus->%d.\n", gs_enGfxProcessStatus);
            break;
    }
    return;
}

HI_S32 PF_GetXdrEngineList(HI_DRV_VIDEO_FRAME_TYPE_E enFrmType,
                           HI_DRV_DISP_OUT_TYPE_E enOutType,
                           HI_DRV_DISP_XDR_ENGINE_E *penXdrEngineList)
{
    return XDR_SPECIFIC_GetXdrEngineList(enFrmType, enOutType, penXdrEngineList);
}

HI_S32 PF_GetXdrHardwareAbility(DRV_DISP_XDR_HARDWARE_CAP_S *pstXdrHardwareCap)
{
    HI_U32 u32SupportDolby = 0, u32SupportHdr = 0;

    /* get otp xdr status. */
    if ((HI_SUCCESS != HI_DRV_SYS_GetDolbyvisionSupport(&u32SupportDolby))
        || (HI_SUCCESS != HI_DRV_SYS_GetHdrSupport(&u32SupportHdr)))
    {
        HI_ERR_DISP("Get OTP status from sys Err.\n");
        return HI_FAILURE;
    }

    if (HI_SUCCESS != XDR_SPECIFIC_GetChipXdrCap(pstXdrHardwareCap))
    {
        return HI_FAILURE;
    }

    pstXdrHardwareCap->bSupportDolby &= u32SupportDolby;
    pstXdrHardwareCap->bSupportHdr10 &= u32SupportHdr;
    pstXdrHardwareCap->bSupportHlg   &= u32SupportHdr;
    pstXdrHardwareCap->bSupportSlf   &= u32SupportHdr;
    pstXdrHardwareCap->bSupportJTP   &= u32SupportHdr;

    return HI_SUCCESS;
}

/************HDR hal end******************/
#endif



HI_VOID PF_ConfigSmmu(HI_VOID)
{
#ifdef CFG_VDP_MMU_SUPPORT
    VDP_Hal_SetSmmuEnable(HI_TRUE);
#endif
}

HI_S32 DISP_HAL_Init(HI_U32 u32Base)
{
    HI_S32 nRet;
#ifndef __DISP_PLATFORM_BOOT__
    HI_U32 u32RegCopySize = 0;
#endif

    if (s_DispIntfFlag > 0)
    {
        return HI_SUCCESS;
    }

#ifndef __DISP_PLATFORM_BOOT__
    g_pstVdpBaseAddr = ioremap_nocache(u32Base, DEF_VDP_REG_SIZE);
#else
    g_pstVdpBaseAddr = (S_VDP_REGS_TYPE *)u32Base;
#endif

    if (!g_pstVdpBaseAddr)
    {
        return HI_FAILURE;
    }

#ifndef __DISP_PLATFORM_BOOT__
    u32RegCopySize = VDP_GetRegCopyMemSize();
    nRet = DISP_OS_MMZ_Alloc("VDP_RegBackBuff", VDP_MEM_TYPE_MMZ, u32RegCopySize, VDP_MEM_ALIGN, &g_RegBackBuf);
    if (nRet)
    {
        DISP_FATAL("Alloc MMZ VDP_RegBackBuff failed\n");
        return nRet;
    }
#endif

    DispGetVersion(&s_stVersion);

    // s2.3 initial ops
    DISP_MEMSET(&s_stIntfOps, 0, sizeof(DISP_INTF_OPERATION_S));
    memset(&g_stVDACAttr, 0, sizeof(HI_DRV_VDAC_ATTR_S));

    g_stVDACAttr.bDACDetEn = HI_FALSE;

    nRet = DISP_HAL_InitVDPState();
    if (nRet)
    {
        goto __error_exit;
    }

    (HI_VOID)PF_OpenClkStartModule();


    (HI_VOID)PF_ConfigSmmu();

    /* reset hardware */
    s_stIntfOps.PF_ResetHardware  = PF_ResetVdpHardware;
    s_stIntfOps.PF_CloseClkResetModule  = PF_CloseClkResetModule;
    s_stIntfOps.PF_OpenClkStartModule   = PF_OpenClkStartModule;

    /* display */
    /* capability */
    s_stIntfOps.PF_TestChnSupport     = PF_TestChnSupport;
    s_stIntfOps.PF_TestChnSupportHD   = PF_TestChnSupportHD;
    s_stIntfOps.PF_TestIntfSupport    = PF_TestIntfSupport;
    s_stIntfOps.PF_TestChnSupportCast = PF_TestChnSupportCast;
    s_stIntfOps.PF_TestChnEncFmt      = PF_TestChnEncFmt;
    s_stIntfOps.PF_TestChnAttach      = PF_TestChnAttach;

    //s_stIntfOps.PF_ResetChn  = PF_ResetChn;
    //s_stIntfOps.PF_ConfigChn = PF_ConfigChn;
    s_stIntfOps.PF_SetChnFmt = PF_SetChnFmt;
    s_stIntfOps.PF_GetFmtTiming = PF_GetFmtTiming;
    s_stIntfOps.PF_SetChnTiming = PF_SetChnTiming;
    s_stIntfOps.PF_SetHDMI420 = PF_SetHDMI420;

    s_stIntfOps.PF_SetChnPixFmt  = PF_SetChnPixFmt;
    s_stIntfOps.PF_SetChnBgColor = PF_SetChnBgColor;
    s_stIntfOps.PF_SetChnColor   = PF_SetChnColor;

    s_stIntfOps.PF_SetChnEnable  = PF_SetChnEnable;
    s_stIntfOps.PF_GetChnEnable  = PF_GetChnEnable;
    s_stIntfOps.PF_InitDacDetect  = PF_InitDacDetect;

    s_stIntfOps.PF_SetMSChnEnable = PF_SetMSChnEnable;

    s_stIntfOps.PF_DispMask =  PF_DispMask;
    s_stIntfOps.PF_DispUnMask = PF_DispUnMask;

    /* interrypt */
    s_stIntfOps.PF_SetIntEnable = PF_SetIntEnable;
    s_stIntfOps.PF_SetVPSSIntEnable = PF_SetVPSSIntEnable;
    s_stIntfOps.PF_SetSMMUIntEnable = PF_SetSMMUIntEnable;
    s_stIntfOps.PF_ConfigSmmu       = PF_ConfigSmmu;
    s_stIntfOps.PF_GetMaskedIntState = PF_GetMaskedIntState;

    s_stIntfOps.PF_GetMaskedVPSSIntState = PF_GetMaskedVPSSIntState;
    s_stIntfOps.PF_GetUnMaskVPSSIntState = PF_GetUnMaskedVPSSIntState;

    s_stIntfOps.PF_GetMaskedIntState1 = PF_GetMaskedIntState1;
    s_stIntfOps.PF_GetIntSetting = PF_GetIntSetting;
    s_stIntfOps.PF_GetUnmaskedIntState = PF_GetUnmaskedIntState;
    s_stIntfOps.PF_CleanIntState = PF_CleanIntState;
    s_stIntfOps.PF_CleanIntState1 = PF_CleanIntState1;
    s_stIntfOps.PF_CleanVPSSIntState = PF_CleanVPSSIntState;
    s_stIntfOps.FP_GetChnIntState = FP_GetChnIntState;
    s_stIntfOps.FP_GetChnBottomFlag = FP_GetChnBottomFlag;
    s_stIntfOps.PF_GetAccurateLinePosition = PF_GetAccurateLinePosition;
    s_stIntfOps.PF_GetCurrentVbiTimeInfor = PF_GetCurrentVbiTimeInfor;
    s_stIntfOps.PF_Calculate_TriggerTime = PF_Calculate_TriggerTime;
    /* interface manager */
    s_stIntfOps.PF_AcquireIntf2   = PF_AcquireIntf2;
    s_stIntfOps.PF_ReleaseIntf2   = PF_ReleaseIntf2;
    s_stIntfOps.PF_ResetIntfFmt2  = PF_ResetIntfFmt2;
    s_stIntfOps.PF_SetIntfEnable2 = PF_SetIntfEnable2;

    /* WBC manager */
    s_stIntfOps.PF_AcquireWbcByChn = PF_AcquireWbcByChn;
    s_stIntfOps.PF_AcquireWbc = PF_AcquireWbc;
    s_stIntfOps.PF_ReleaseWbc = PF_ReleaseWbc;

    /* WBC */
    s_stIntfOps.PF_SetWbcIORect = PF_SetWbcIORect;
    s_stIntfOps.PF_SetWbc3DInfo = PF_SetWbc3DInfo;
    s_stIntfOps.PF_SetWbcColorSpace = PF_SetWbcColorSpace;
    s_stIntfOps.PF_SetWbcPixFmt = PF_SetWbcPixFmt;
    s_stIntfOps.PF_SetWbcAddr = PF_SetWbcAddr;
    s_stIntfOps.PF_SetWbcEnableCfg = PF_SetWbcEnableCfg;
    s_stIntfOps.PF_SetWbcEnable = PF_SetWbcEnable;
    s_stIntfOps.PF_SetWbcLowDlyEnable = PF_SetWbcLowdlyEnable;
    s_stIntfOps.PF_SetWbcPartfnsLineNum = PF_SetWbcPartfnsLineNum;
    s_stIntfOps.PF_SetWbcLineNumInterval = PF_SetWbcLineNumInterval;
    s_stIntfOps.PF_SetWbcLineAddr = PF_SetWbcLineAddr;
    s_stIntfOps.PF_SetWbcSmmuBypass = PF_SetWbcSmmuBypass;
    s_stIntfOps.PF_UpdateWbc = PF_UpdateWbc;
    s_stIntfOps.PF_DACIsr = PF_DACIsr;
    s_stIntfOps.PF_SetDACDetEn = PF_SetDACDetEn;
    s_stIntfOps.PF_GetDACAttr = PF_GetDACAttr;
    /*set CBM Zorder*/
    s_stIntfOps.PF_CBM_MovTOP = PF_CBM_MovTOP;
    s_stIntfOps.PF_VDP_RegSave = PF_VDP_RegSave;
    s_stIntfOps.PF_VDP_RegReStore = PF_VDP_RegReStore;
    s_stIntfOps.PF_DATE_SetCoef = PF_DATE_SetCoef;
    s_stIntfOps.PF_DATE_SetIRE = PF_DATE_SetIRE;
    s_stIntfOps.PF_GetIsogenyMode = PF_GetIsogenyMode;

    /*O5*/
    s_stIntfOps.PF_SetAllDACEn = PF_SetAllDACEn;
    s_stIntfOps.PF_GetIsoWbcPartFinishPoint = PF_GetIsoWbcPartFinishPoint;

#ifndef __DISP_PLATFORM_BOOT__
    s_stIntfOps.PF_SetGfxXdrMode = PF_SetGfxXdrMode;

    s_stIntfOps.PF_CheckOutputTypeValid = PF_CheckOutputTypeValid;

    /* close v0/v1 layer and regions. */
    s_stIntfOps.PF_ResetV0V1Layer = PF_ResetV0V1Layer;

    /* adjust configuration according to different chip. */
    s_stIntfOps.PF_AdjustConfig  = PF_AdjustConfig;

    /* new interface to config all win. */
    s_stIntfOps.PF_SetHdLayer = PF_SetHdLayer;

    s_stIntfOps.PF_GetGfxState    = PF_GetGfxState;
    s_stIntfOps.PF_CheckRegConfig =  PF_CheckRegConfig;

    s_stIntfOps.PF_SetVdacVbgEnable = PF_SetVdacVbgEnable;
    s_stIntfOps.PF_SetLayerClockEnable = PF_SetLayerClockEnable;
    s_stIntfOps.PF_CheckLayerClockEnable = PF_CheckLayerClockEnable;
    s_stIntfOps.PF_SetVpWbcClockEnable = PF_SetVpWbcClockEnable;
    s_stIntfOps.PF_SetDhdWbcClockEnable = PF_SetDhdWbcClockEnable;

    s_stIntfOps.PF_GetPixelRepeatTimesAccordingFmt = PF_GetPixelRepeatTimesAccordingFmt;

    s_stIntfOps.PF_WorkModeChangeProcess = PF_WorkModeChangeProcess;

    s_stIntfOps.PF_GetXdrEngineList = PF_GetXdrEngineList;
    s_stIntfOps.PF_GetXdrHardwareAbility = PF_GetXdrHardwareAbility;
    s_stIntfOps.PF_SetWBCRegUp = VDP_WBC_SetRegUp;

#endif
    s_DispIntfFlag++;

    return HI_SUCCESS;

__error_exit:

    PF_CloseClkResetModule();
#ifndef __DISP_PLATFORM_BOOT__
    DISP_OS_MMZ_Release(&g_RegBackBuf);
    iounmap(g_pstVdpBaseAddr);
    g_pstVdpBaseAddr = 0;
#endif
    DISP_FATAL("Hal init vdp state failed\n");
    return nRet;
}

HI_S32 DISP_HAL_DeInit(HI_VOID)
{

    PF_CloseClkResetModule();
    s_DispIntfFlag = 0;

#ifndef __DISP_PLATFORM_BOOT__
    DISP_OS_MMZ_Release( &g_RegBackBuf);
    iounmap(g_pstVdpBaseAddr);
    g_pstVdpBaseAddr = 0;
#endif

    return HI_SUCCESS;
}

HI_S32 DISP_HAL_GetOperation(DISP_INTF_OPERATION_S *pstFunction)
{
    if (s_DispIntfFlag < 0)
    {
        DISP_ERROR("DISP_INTF Not inited\n");
        return HI_FAILURE;
    }

    memcpy(pstFunction, &s_stIntfOps, sizeof(DISP_INTF_OPERATION_S));
    return HI_SUCCESS;
}

DISP_INTF_OPERATION_S *DISP_HAL_GetOperationPtr(HI_VOID)
{
    if (s_DispIntfFlag < 0)
    {
        DISP_ERROR("DISP_INTF Not inited\n");
        return HI_NULL;
    }

    return &s_stIntfOps;
}

HI_S32 DISP_HAL_GetVersion(HI_DRV_DISP_VERSION_S *pstVersion)
{
    if (s_DispIntfFlag < 0)
    {
        DISP_ERROR("DISP_INTF Not inited\n");
        return HI_FAILURE;
    }

    if (pstVersion)
    {
        *pstVersion = s_stVersion;
        return HI_SUCCESS;
    }
    else
    {
        return HI_FAILURE;
    }
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */


