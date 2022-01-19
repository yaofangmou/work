/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : drv_pq.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2014/04/01
******************************************************************************/
#include "drv_pq.h"
#include "drv_pdm_ext.h"
#include "drv_pq_ext.h"
#include "hi_drv_dev.h"
#include "drv_pq_comm.h"

PQ_PARAM_S          *g_pstPqParam = HI_NULL;
PQ_MMZ_BUF_S        g_stPqBinBuf;
HI_BOOL             g_bLoadPqBin;
HI_PQ_ALGIP_SEL_E   g_enAlgIPSel = HI_PQ_ALGIP_SEL_VPSS;
HI_BOOL             g_bProcAlgTimeCntEn = HI_FALSE; /* each alg delay count */

HI_U32 g_u32ImageWidth  = 1280;
HI_U32 g_u32ImageHeight = 720;
HI_U32 g_u32OutWidth    = 1280;
HI_U32 g_u32OutHeight   = 720;

HI_DRV_PQ_PARAM_S stPqParam;
PQ_STATUS_S g_stPqStatus = {0};

static HI_U32  sg_u32DemoCoordinate = 50; /*range: 0~100*/
static HI_BOOL sg_bFastBoot         = HI_FALSE;
static HI_BOOL sg_bDefaultParam     = HI_FALSE; /* rwzb flag */

/* handle num limit value , pq module can both be the limit value */
HI_ULONG sg_ulProcAlgTimeCnt[VPSS_HANDLE_NUM + 1][HI_PQ_MODULE_BUTT]   = {{0, 0}};
HI_ULONG sg_ulProcAlgStartTime[VPSS_HANDLE_NUM + 1][HI_PQ_MODULE_BUTT] = {{0, 0}};
HI_ULONG sg_ulProcAlgEndTime[VPSS_HANDLE_NUM + 1][HI_PQ_MODULE_BUTT]   = {{0, 0}};

static HI_S32 DRV_PQ_GetFlashPqBin(PQ_PARAM_S *pstPqParam);
static HI_S32 DRV_PQ_GetPicSetting(HI_VOID);

PQ_EXPORT_FUNC_S   g_PqExportFuncs =
{
    .pfnPqSuspend                 = DRV_PQ_Suspend,
    .pfnPqResume                  = DRV_PQ_Resume,
    .pfnPQ_UpdateVdpPQ            = DRV_PQ_UpdateVdpPQ,
    .pfnPQ_GetCSCCoef             = DRV_PQ_GetCSCCoef,
    .pfnPQ_Get8BitCSCCoef         = DRV_PQ_Get8BitCSCCoef,
    .pfnPQ_GetHDPictureSetting    = DRV_PQ_GetHDPictureSetting,
    .pfnPQ_GetSDPictureSetting    = DRV_PQ_GetSDPictureSetting,
    .pfnPQ_SetHDPictureSetting    = DRV_PQ_SetHDPictureSetting,
    .pfnPQ_SetSDPictureSetting    = DRV_PQ_SetSDPictureSetting,
    .pfnPQ_GetHDVideoSetting      = DRV_PQ_GetHDVideoSetting,
    .pfnPQ_GetSDVideoSetting      = DRV_PQ_GetSDVideoSetting,
    .pfnPQ_SetHDVideoSetting      = DRV_PQ_SetHDVideoSetting,
    .pfnPQ_SetSDVideoSetting      = DRV_PQ_SetSDVideoSetting,
    .pfnPQ_GetVdpZmeStrategy      = DRV_PQ_GetVdpZmeStrategy,
    .pfnPQ_SetGfxZme              = DRV_PQ_SetGfxZme,
    .pfnPQ_SetGfxCscCoef          = DRV_PQ_SetGfxCscCoef,
};

HI_S32 HI_DRV_PQ_DeInit(HI_VOID)
{
    HI_U32 i;

    HI_DRV_MODULE_UnRegister(HI_ID_PQ);
    if (HI_NULL != g_stPqBinBuf.pu8StartVirAddr)
    {
        PQ_HAL_UnmapAndRelease(&g_stPqBinBuf);
        g_stPqBinBuf.pu8StartVirAddr = HI_NULL;
    }

    PQ_TABLE_DeInitPQTable();
    PQ_HAL_Deinit();

    for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
    {
        if (PQ_FUNC_CALL(i, DeInit))
        {
            GET_ALG_FUN(i)->DeInit();
        }
    }

#ifdef PQ_ALG_ZME
    PQ_MNG_UnRegisterZme();
#endif

#ifdef PQ_ALG_CSC
    PQ_MNG_UnRegisterCSC();
#endif

#ifdef PQ_ALG_DEI
    PQ_MNG_UnRegisterDEI();
#endif

#ifdef PQ_ALG_DB
    PQ_MNG_UnRegisterDB();
#endif

#ifdef PQ_ALG_DM
    PQ_MNG_UnRegisterDM();
#endif

#ifdef PQ_ALG_DERING
    PQ_MNG_UnRegisterDR();
#endif

#ifdef PQ_ALG_DESHOOT
    PQ_MNG_UnRegisterDS();
#endif

#ifdef PQ_ALG_ARTDS
    PQ_MNG_UnRegisterArtDS();
#endif

#ifdef PQ_ALG_TNR
    PQ_MNG_UnRegisterTNR();
#endif

#ifdef PQ_ALG_SNR
    PQ_MNG_UnRegisterSNR();
#endif

#ifdef PQ_ALG_GFXCSC
    PQ_MNG_UnRegisterGfxCSC();
#endif

#ifdef PQ_ALG_GFXZME
    PQ_MNG_UnRegisterGfxZme();
#endif

#ifdef PQ_ALG_SHARPEN
    PQ_MNG_UnRegisterSharp();
#endif

#ifdef PQ_ALG_ACM
    PQ_MNG_UnRegisterACM();
#endif

#ifdef PQ_ALG_LCACM
    PQ_MNG_UnRegisterLCACM();
#endif

#ifdef PQ_ALG_DCI
    PQ_MNG_UnRegisterDCI();
#endif

#ifdef PQ_ALG_ACC
    PQ_MNG_UnRegisterACC();
#endif

#ifdef PQ_ALG_FMD
    PQ_MNG_UnRegisterFMD();
#endif

    return HI_SUCCESS;
}


HI_S32 HI_DRV_PQ_Init(HI_CHAR *pszPath)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 i = 0;
    g_bLoadPqBin = HI_FALSE;
    g_pstPqParam = HI_NULL;

    s32Ret = HI_DRV_MODULE_Register(HI_ID_PQ, PQ_NAME, (HI_VOID *)&g_PqExportFuncs);
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_PQ("ERR: HI_DRV_MODULE_Register!\n");
        return s32Ret;
    }

    /* boot use reserve mem, boot to kernel , pq need copy this bin to use; release after copy only in kernel */
#ifndef HI_BUILD_IN_BOOT
    s32Ret = PQ_HAL_AllocAndMap("PQ_FLASH_BIN", HI_NULL, sizeof(PQ_PARAM_S), 0, &g_stPqBinBuf);
#else
    s32Ret = PQ_HAL_AllocAndMap(PQ_DEF_NAME, HI_NULL, sizeof(PQ_PARAM_S), 0, &g_stPqBinBuf);
#endif
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_PQ("ERR: Pqdriver mmz memory failed!\n");
        g_bLoadPqBin = HI_FALSE;
        return s32Ret;
    }

    g_pstPqParam = (PQ_PARAM_S *)g_stPqBinBuf.pu8StartVirAddr;
    HI_INFO_PQ("\n g_stPqBinBuf.u32StartPhyAddr = 0x%x,g_stPqBinBuf.pu8StartVirAddr = 0x%x\n", g_stPqBinBuf.u32StartPhyAddr, g_stPqBinBuf.pu8StartVirAddr);

    s32Ret = DRV_PQ_GetFlashPqBin(g_pstPqParam);
    if (HI_SUCCESS != s32Ret)
    {
        //HI_ERR_PQ("Load PQBin failed!\n");
        g_bLoadPqBin = HI_FALSE;
    }
    else
    {
        g_bLoadPqBin = HI_TRUE;
    }

    s32Ret = DRV_PQ_GetPicSetting();
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PQ("ERR: DRV_PQ_GetPicSetting failed!\n");
        stPqParam.stSDPictureSetting.u16Brightness = 50;
        stPqParam.stSDPictureSetting.u16Contrast   = 50;
        stPqParam.stSDPictureSetting.u16Hue        = 50;
        stPqParam.stSDPictureSetting.u16Saturation = 50;
        stPqParam.stHDPictureSetting.u16Brightness = 50;
        stPqParam.stHDPictureSetting.u16Contrast   = 50;
        stPqParam.stHDPictureSetting.u16Hue        = 50;
        stPqParam.stHDPictureSetting.u16Saturation = 50;
        stPqParam.stSDVideoSetting.u16Brightness   = 128;
        stPqParam.stSDVideoSetting.u16Contrast     = 128;
        stPqParam.stSDVideoSetting.u16Hue          = 128;
        stPqParam.stSDVideoSetting.u16Saturation   = 128;
        stPqParam.stHDVideoSetting.u16Brightness   = 128;
        stPqParam.stHDVideoSetting.u16Contrast     = 128;
        stPqParam.stHDVideoSetting.u16Hue          = 128;
        stPqParam.stHDVideoSetting.u16Saturation   = 128;
    }

#ifdef PQ_ALG_ZME
    PQ_MNG_RegisterZme(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_CSC
    PQ_MNG_RegisterCSC(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_DEI
    PQ_MNG_RegisterDEI(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_TNR
    PQ_MNG_RegisterTNR(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_SNR
    PQ_MNG_RegisterSNR(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_DB
    PQ_MNG_RegisterDB(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_DM
    PQ_MNG_RegisterDM(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_DERING
    PQ_MNG_RegisterDR(REG_TYPE_VDP);
#endif
#ifdef PQ_ALG_DESHOOT
    PQ_MNG_RegisterDS(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_ARTDS
    PQ_MNG_RegisterArtDS(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_GFXCSC
    PQ_MNG_RegisterGfxCSC();
#endif

#ifdef PQ_ALG_GFXZME
    PQ_MNG_RegisterGfxZme();
#endif

#ifdef PQ_ALG_SHARPEN
    PQ_MNG_RegisterSharp(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_ACM
    PQ_MNG_RegisterACM(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_LCACM
    PQ_MNG_RegisterLCACM(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_DCI
    PQ_MNG_RegisterDCI(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_ACC
    PQ_MNG_RegisterACC(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_FMD
    PQ_MNG_RegisterFMD(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_CCS
    PQ_MNG_RegisterCCS(REG_TYPE_VDP);
#endif

#ifdef PQ_ALG_CLS
    PQ_MNG_RegisterCLS(REG_TYPE_VDP);
#endif

    s32Ret = PQ_HAL_Init();
    if (HI_SUCCESS != s32Ret)
    {
        PQ_HAL_UnmapAndRelease(&g_stPqBinBuf);
        g_stPqBinBuf.pu8StartVirAddr = HI_NULL;

        HI_ERR_PQ("Init PQ device error!\n");
        return HI_FAILURE;
    }

    s32Ret = PQ_TABLE_InitPQTable(g_pstPqParam, !g_bLoadPqBin);
    if (HI_SUCCESS != s32Ret)
    {
        PQ_HAL_UnmapAndRelease(&g_stPqBinBuf);
        g_stPqBinBuf.pu8StartVirAddr = HI_NULL;

        PQ_HAL_Deinit();

        HI_ERR_PQ("Init PQ table failure!\n");
        return HI_FAILURE;
    }

    for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
    {
        if (HI_NULL == GET_ALG(i))
        {
            continue;
        }

        if (GET_ALG_FUN(i)->Init)
        {
            GET_ALG_FUN(i)->Init(g_pstPqParam, !g_bLoadPqBin);
        }

        stPqParam.bDemoOnOff[i]   = HI_FALSE;
        stPqParam.bModuleOnOff[i] = HI_TRUE;
        stPqParam.u32Strength[i]  = 50;
    }

    stPqParam.stColorEnhance.enColorEnhanceType      = HI_PQ_COLOR_ENHANCE_SPEC_COLOR_MODE;
    stPqParam.stColorEnhance.unColorGain.enColorMode = HI_PQ_COLOR_MODE_RECOMMEND;
    stPqParam.enDemoMode                             = HI_PQ_DEMO_MODE_FIXED_L;  /*default left enable */
    /*g_stPqStatus.enTunMode                           = PQ_TUN_NORMAL;*/
    g_stPqStatus.enImageMode                         = PQ_IMAGE_MODE_NORMAL;

    /*set gfx  brightness/contrast/hue/saturation*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_SD0, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stSDPictureSetting);
        GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_HD1, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stHDPictureSetting);
    }

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_Suspend(PM_BASEDEV_S *pdev, pm_message_t state)
{
    if (PM_EVENT_FREEZE == state.event)
    {
        sg_bFastBoot = HI_TRUE;
    }
    else
    {
        sg_bFastBoot = HI_FALSE;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_Resume(PM_BASEDEV_S *pdev)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (HI_TRUE == sg_bFastBoot)
    {
        s32Ret = DRV_PQ_GetPicSetting();
        if (HI_SUCCESS != s32Ret)
        {
            HI_WARN_PQ("ERR: DRV_PQ_GetPicSetting failed!\n");
        }
    }

    /*set gfx  brightness/contrast/hue/saturation*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_SD0, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stSDPictureSetting);
        GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_HD1, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stHDPictureSetting);
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXZME, SetResume))
    {
        GET_ALG_FUN(HI_PQ_MODULE_GFXZME)->SetResume(!g_bLoadPqBin);
    }

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetBrightness(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 *pu32Brightness)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Brightness);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (HI_SUCCESS == s32Ret)
        {
            *pu32Brightness = NUM2LEVEL(stPictureSetting.u16Brightness);
        }
        else
        {
            HI_ERR_PQ("get csc error\n");
        }
    }
    pqprint(PQ_PRN_CSC, "Get Type %d Brightness: %d\n", enPqDisplay, *pu32Brightness);
    return s32Ret;
}

HI_S32 DRV_PQ_SetBrightness(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 u32Brightness)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32Brightness, 100);

    /*video*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Brightness = LEVEL2NUM(u32Brightness);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        s32Ret |= GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDVideoSetting.u16Brightness   = LEVEL2NUM(u32Brightness);
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDVideoSetting.u16Brightness   = LEVEL2NUM(u32Brightness);
        }
    }

    /*gfx*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, GetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->GetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Brightness = u32Brightness;
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDPictureSetting.u16Brightness   = u32Brightness;
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDPictureSetting.u16Brightness   = u32Brightness;
        }
    }

    pqprint(PQ_PRN_CSC, "Set Type %d Brightness: %d\n", enPqDisplay, u32Brightness);
    return s32Ret;
}

HI_S32 DRV_PQ_GetContrast(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 *pu32Contrast)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Contrast);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (HI_SUCCESS == s32Ret)
        {
            *pu32Contrast = NUM2LEVEL(stPictureSetting.u16Contrast);
        }
        else
        {
            HI_ERR_PQ("get csc error\n");
        }
    }
    pqprint(PQ_PRN_CSC, "Get Type %d Contrast: %d\n", enPqDisplay, *pu32Contrast);

    return s32Ret;
}

HI_S32 DRV_PQ_SetContrast(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 u32Contrast)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32Contrast, 100);

    /*video*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Contrast = LEVEL2NUM(u32Contrast);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        s32Ret |= GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDVideoSetting.u16Contrast = LEVEL2NUM(u32Contrast);
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDVideoSetting.u16Contrast = LEVEL2NUM(u32Contrast);
        }
    }

    /*gfx*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, GetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->GetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Contrast = u32Contrast;
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDPictureSetting.u16Contrast = u32Contrast;
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDPictureSetting.u16Contrast = u32Contrast;
        }
    }

    pqprint(PQ_PRN_CSC, "Set Type %d Contrast: %d\n", enPqDisplay, u32Contrast);
    return s32Ret;
}

HI_S32 DRV_PQ_GetHue(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 *pu32Hue)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Hue);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (HI_SUCCESS == s32Ret)
        {
            *pu32Hue = NUM2LEVEL(stPictureSetting.u16Hue);
        }
        else
        {
            HI_ERR_PQ("get csc error\n");
        }
    }

    pqprint(PQ_PRN_CSC, "Get Type %d Hue: %d\n", enPqDisplay, *pu32Hue);

    return s32Ret;
}

HI_S32 DRV_PQ_SetHue(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 u32Hue)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32Hue, 100);

    /* Video CSC */
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Hue = LEVEL2NUM(u32Hue);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        s32Ret |= GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDVideoSetting.u16Hue   = LEVEL2NUM(u32Hue);
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDVideoSetting.u16Hue   = LEVEL2NUM(u32Hue);
        }
    }

    /*gfx*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, GetGfxCSCPictureSetting))
    {
        s32Ret |= GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->GetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Hue = u32Hue;
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        s32Ret |= GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDPictureSetting.u16Hue   = LEVEL2NUM(u32Hue);
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDPictureSetting.u16Hue   = LEVEL2NUM(u32Hue);
        }
    }

    pqprint(PQ_PRN_CSC, "Set Type %d Hue: %d\n", enPqDisplay, u32Hue);
    return s32Ret;
}

HI_S32 DRV_PQ_GetSaturation(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 *pu32Saturation)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Saturation);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (HI_SUCCESS == s32Ret)
        {
            *pu32Saturation = NUM2LEVEL(stPictureSetting.u16Saturation);
        }
        else
        {
            HI_ERR_PQ("get csc error\n");
        }
    }
    pqprint(PQ_PRN_CSC, "Get Type %d Saturation: %d\n", enPqDisplay, *pu32Saturation);

    return s32Ret;
}

HI_S32 DRV_PQ_SetSaturation(HI_PQ_DISPLAY_E enPqDisplay, HI_U32 u32Saturation)
{
    HI_PQ_PICTURE_SETTING_S stPictureSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enPqDisplay, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32Saturation, 100);

    /* Video CSC */
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Saturation = LEVEL2NUM(u32Saturation);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        s32Ret |= GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDVideoSetting.u16Saturation   = LEVEL2NUM(u32Saturation);
        }

        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDVideoSetting.u16Saturation   = LEVEL2NUM(u32Saturation);
        }
    }

    /*gfx*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, GetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->GetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
    }

    stPictureSetting.u16Saturation = u32Saturation;
    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(enPqDisplay, &stPictureSetting);
        if (enPqDisplay == HI_PQ_DISPLAY_SD0)
        {
            stPqParam.stSDPictureSetting.u16Saturation = u32Saturation;
        }
        if (enPqDisplay == HI_PQ_DISPLAY_HD1)
        {
            stPqParam.stHDPictureSetting.u16Saturation = u32Saturation;
        }
    }

    pqprint(PQ_PRN_CSC, "Set Type %d Saturation: %d\n", enPqDisplay, u32Saturation);
    return s32Ret;
}


/* get brightness, contrast, hue, saturation  of HD Video*/
HI_S32 DRV_PQ_GetHDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    HI_PQ_PICTURE_SETTING_S stSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(HI_PQ_DISPLAY_HD1, &stSetting);
        if (HI_SUCCESS == s32Ret)
        {
            pstSetting->u16Brightness = NUM2LEVEL(stSetting.u16Brightness);
            pstSetting->u16Contrast   = NUM2LEVEL(stSetting.u16Contrast);
            pstSetting->u16Hue        = NUM2LEVEL(stSetting.u16Hue);
            pstSetting->u16Saturation = NUM2LEVEL(stSetting.u16Saturation);
        }
        else
        {
            HI_ERR_PQ("get csc error\n");
        }
    }

    return HI_SUCCESS;
}


/* set brightness, contrast, hue, saturation  of HD Video*/
HI_S32 DRV_PQ_SetHDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    HI_PQ_PICTURE_SETTING_S stSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Brightness, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Contrast, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Saturation, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Hue, 100);

    pqprint(PQ_PRN_CSC, "Set Brightness:%d, Contrast:%d, Hue:%d, Saturation:%d\n",
            pstSetting->u16Brightness, pstSetting->u16Contrast, pstSetting->u16Hue, pstSetting->u16Saturation);

    /* 0~100 to 0~255 */
    stSetting.u16Brightness = LEVEL2NUM(pstSetting->u16Brightness);
    stSetting.u16Contrast   = LEVEL2NUM(pstSetting->u16Contrast);
    stSetting.u16Hue        = LEVEL2NUM(pstSetting->u16Hue);
    stSetting.u16Saturation = LEVEL2NUM(pstSetting->u16Saturation);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_HD1, &stSetting);
    }

    /* up drv layer; we use 0~100 level value */
    stPqParam.stHDVideoSetting.u16Brightness = LEVEL2NUM(pstSetting->u16Brightness);
    stPqParam.stHDVideoSetting.u16Contrast   = LEVEL2NUM(pstSetting->u16Contrast);
    stPqParam.stHDVideoSetting.u16Hue        = LEVEL2NUM(pstSetting->u16Hue);
    stPqParam.stHDVideoSetting.u16Saturation = LEVEL2NUM(pstSetting->u16Saturation);

    return s32Ret;
}

/* get brightness, contrast, hue, saturation  of SD Video*/
HI_S32 DRV_PQ_GetSDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    HI_PQ_PICTURE_SETTING_S stSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCVideoSetting(HI_PQ_DISPLAY_SD0, &stSetting);
        if (HI_SUCCESS == s32Ret)
        {
            pstSetting->u16Brightness = NUM2LEVEL(stSetting.u16Brightness);
            pstSetting->u16Contrast   = NUM2LEVEL(stSetting.u16Contrast);
            pstSetting->u16Hue        = NUM2LEVEL(stSetting.u16Hue);
            pstSetting->u16Saturation = NUM2LEVEL(stSetting.u16Saturation);
        }
        else
        {
            HI_ERR_PQ("get csc error\n");
        }
    }

    return s32Ret;
}

/* set brightness, contrast, hue, saturation  of SD Video*/
HI_S32 DRV_PQ_SetSDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    HI_PQ_PICTURE_SETTING_S stSetting;
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Brightness, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Contrast, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Saturation, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Hue, 100);

    pqprint(PQ_PRN_CSC, "Set Brightness:%d, Contrast:%d, Hue:%d, Saturation:%d\n",
            pstSetting->u16Brightness, pstSetting->u16Contrast, pstSetting->u16Hue, pstSetting->u16Saturation);

    stSetting.u16Brightness = LEVEL2NUM(pstSetting->u16Brightness);
    stSetting.u16Contrast   = LEVEL2NUM(pstSetting->u16Contrast);
    stSetting.u16Hue        = LEVEL2NUM(pstSetting->u16Hue);
    stSetting.u16Saturation = LEVEL2NUM(pstSetting->u16Saturation);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_SD0, &stSetting);
    }

    stPqParam.stSDVideoSetting.u16Brightness = LEVEL2NUM(pstSetting->u16Brightness);
    stPqParam.stSDVideoSetting.u16Contrast   = LEVEL2NUM(pstSetting->u16Contrast);
    stPqParam.stSDVideoSetting.u16Hue        = LEVEL2NUM(pstSetting->u16Hue);
    stPqParam.stSDVideoSetting.u16Saturation = LEVEL2NUM(pstSetting->u16Saturation);

    return s32Ret;
}


/* get brightness, contrast, hue, saturation  of HD gfx*/
HI_S32 DRV_PQ_GetHDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    pstSetting->u16Brightness  = stPqParam.stHDPictureSetting.u16Brightness;
    pstSetting->u16Contrast    = stPqParam.stHDPictureSetting.u16Contrast;
    pstSetting->u16Hue         = stPqParam.stHDPictureSetting.u16Hue;
    pstSetting->u16Saturation  = stPqParam.stHDPictureSetting.u16Saturation;

    return HI_SUCCESS;
}


/* get brightness, contrast, hue, saturation  of SD gfx*/
HI_S32 DRV_PQ_GetSDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    pstSetting->u16Brightness  = stPqParam.stSDPictureSetting.u16Brightness;
    pstSetting->u16Contrast    = stPqParam.stSDPictureSetting.u16Contrast;
    pstSetting->u16Hue         = stPqParam.stSDPictureSetting.u16Hue;
    pstSetting->u16Saturation  = stPqParam.stSDPictureSetting.u16Saturation;

    return HI_SUCCESS;
}


/* set brightness, contrast, hue, saturation  of HD gfx*/
HI_S32 DRV_PQ_SetHDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Brightness, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Contrast, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Saturation, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Hue, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_HD1, pstSetting);
    }

    stPqParam.stHDPictureSetting.u16Brightness = pstSetting->u16Brightness;
    stPqParam.stHDPictureSetting.u16Contrast   = pstSetting->u16Contrast;
    stPqParam.stHDPictureSetting.u16Hue        = pstSetting->u16Hue;
    stPqParam.stHDPictureSetting.u16Saturation = pstSetting->u16Saturation;

    HI_DEBUG_PQ("SetHDPicture Brightness:%d, Contrast:%d, Hue:%d, Saturation:%d\n", \
                pstSetting->u16Brightness, pstSetting->u16Contrast, pstSetting->u16Hue, pstSetting->u16Saturation);

    return s32Ret;
}

/* get brightness, contrast, hue, saturation  of SD gfx*/
HI_S32 DRV_PQ_SetSDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstSetting)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSetting);

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Brightness, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Contrast, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Saturation, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstSetting->u16Hue, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_SD0, pstSetting);
    }

    stPqParam.stSDPictureSetting.u16Brightness = pstSetting->u16Brightness;
    stPqParam.stSDPictureSetting.u16Contrast   = pstSetting->u16Contrast;
    stPqParam.stSDPictureSetting.u16Hue        = pstSetting->u16Hue;
    stPqParam.stSDPictureSetting.u16Saturation = pstSetting->u16Saturation;

    return s32Ret;
}

HI_S32 DRV_PQ_SetSDTemperature(HI_PQ_COLORTEMPERATURE_S *pstTemperature)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstTemperature);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstTemperature->u32Red, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstTemperature->u32Green, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstTemperature->u32Blue, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetColorTemp))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetColorTemp(pstTemperature);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetSDTemperature(HI_PQ_COLORTEMPERATURE_S *pstTemperature)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstTemperature);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetColorTemp))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetColorTemp(pstTemperature);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetHDTemperature(HI_PQ_COLORTEMPERATURE_S *pstTemperature)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstTemperature);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstTemperature->u32Red, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstTemperature->u32Green, 100);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstTemperature->u32Blue, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetColorTemp))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetColorTemp(pstTemperature);
    }

    return s32Ret;
}


HI_S32 DRV_PQ_GetHDTemperature(HI_PQ_COLORTEMPERATURE_S *pstTemperature)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstTemperature);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetColorTemp))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetColorTemp(pstTemperature);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetSharpness(HI_U32 *pu32Sharpness)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Sharpness);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_SHARPNESS, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_SHARPNESS)->GetStrength(pu32Sharpness);
        pqprint(PQ_PRN_SHARPEN, "Get sharpen Level: %d\n", *pu32Sharpness);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetSharpness(HI_U32 u32Sharpness)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32Sharpness, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_SHARPNESS, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_SHARPNESS)->SetStrength(u32Sharpness);
        stPqParam.u32Strength[HI_PQ_MODULE_SHARPNESS] = u32Sharpness;
        pqprint(PQ_PRN_SHARPEN, "Set sharpen level: %d\n", u32Sharpness);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetColorEhance(HI_U32 *pu32ColorGainLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32ColorGainLevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->GetStrength(pu32ColorGainLevel);
        pqprint(PQ_PRN_ACM, "Get ColorGainLevel: %d\n", *pu32ColorGainLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetColorEhance(HI_U32 u32ColorGainLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32ColorGainLevel, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->SetStrength(u32ColorGainLevel);
        stPqParam.u32Strength[HI_PQ_MODULE_COLOR] = u32ColorGainLevel;
        pqprint(PQ_PRN_ACM, "Set ColorGainLevel: %d\n", u32ColorGainLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetFleshToneLevel(HI_U32 *pu32FleshToneLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32FleshToneLevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, GetFleshToneLevel))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->GetFleshToneLevel(pu32FleshToneLevel);
        pqprint(PQ_PRN_ACM, "Get FleshToneLevel: %d\n", *pu32FleshToneLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetFleshToneLevel(HI_PQ_FLESHTONE_E enFleshToneLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enFleshToneLevel, HI_PQ_FLESHTONE_GAIN_BUTT);

    stPqParam.stColorEnhance.enColorEnhanceType      = HI_PQ_COLOR_ENHANCE_FLESHTONE;
    stPqParam.stColorEnhance.unColorGain.enFleshtone = enFleshToneLevel;

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, SetFleshToneLevel))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->SetFleshToneLevel(enFleshToneLevel);
        pqprint(PQ_PRN_ACM, "Set FleshToneLevel: %d\n", enFleshToneLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetSixBaseColorLevel(HI_PQ_SIX_BASE_COLOR_S *pstSixBaseColorOffset)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSixBaseColorOffset);

    stPqParam.stColorEnhance.enColorEnhanceType    = HI_PQ_COLOR_ENHANCE_SIX_BASE;
    stPqParam.stColorEnhance.unColorGain.stSixBase = *pstSixBaseColorOffset;

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, SetSixBaseColorLevel))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->SetSixBaseColorLevel(pstSixBaseColorOffset);
        pqprint(PQ_PRN_ACM, "Set SixBaseColor Red:%d, Green: %d, Blue: %d, Cyan: %d, Magenta: %d, Yellow: %d\n",
                pstSixBaseColorOffset->u32Red, pstSixBaseColorOffset->u32Green,
                pstSixBaseColorOffset->u32Blue, pstSixBaseColorOffset->u32Cyan,
                pstSixBaseColorOffset->u32Magenta, pstSixBaseColorOffset->u32Yellow);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetSixBaseColorLevel(HI_PQ_SIX_BASE_COLOR_S *pstSixBaseColorOffset)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSixBaseColorOffset);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, GetSixBaseColorLevel))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->GetSixBaseColorLevel(pstSixBaseColorOffset);
        pqprint(PQ_PRN_ACM, "Get SixBaseColor Red:%d, Green: %d, Blue: %d, Cyan: %d, Magenta: %d, Yellow: %d\n",
                pstSixBaseColorOffset->u32Red, pstSixBaseColorOffset->u32Green,
                pstSixBaseColorOffset->u32Blue, pstSixBaseColorOffset->u32Cyan,
                pstSixBaseColorOffset->u32Magenta, pstSixBaseColorOffset->u32Yellow);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetColorEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E enColorSpecMode)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enColorSpecMode, HI_PQ_COLOR_MODE_BUTT);

    stPqParam.stColorEnhance.enColorEnhanceType      = HI_PQ_COLOR_ENHANCE_SPEC_COLOR_MODE;
    stPqParam.stColorEnhance.unColorGain.enColorMode = enColorSpecMode;

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, SetColorEnhanceMode))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->SetColorEnhanceMode(enColorSpecMode);
        pqprint(PQ_PRN_ACM, "Set ColorEnhanceMode: %d\n", enColorSpecMode);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetColorEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E *penColorSpecMode)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(penColorSpecMode);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, GetColorEnhanceMode))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_COLOR)->GetColorEnhanceMode(penColorSpecMode);
        pqprint(PQ_PRN_ACM, "Get ColorEnhanceMode: %d\n", *penColorSpecMode);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetDCILevel(HI_U32 u32DCILevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32DCILevel, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DCI, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DCI)->SetStrength(u32DCILevel);
        stPqParam.u32Strength[HI_PQ_MODULE_DCI] = u32DCILevel;
        pqprint(PQ_PRN_DCI, "Set DCILevelGain: %d\n", u32DCILevel);
    }

    return s32Ret;
}


HI_S32 DRV_PQ_GetDCILevel(HI_U32 *pu32DCILevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32DCILevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DCI, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DCI)->GetStrength(pu32DCILevel);
        pqprint(PQ_PRN_DCI, "Get DCI Level: %d\n", *pu32DCILevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetTnrLevel(HI_U32 *pu32TnrLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32TnrLevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_TNR, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_TNR)->GetStrength(pu32TnrLevel);
        pqprint(PQ_PRN_TNR, "Get TNR Level: %d\n", *pu32TnrLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetTnrLevel(HI_U32 u32TnrLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32TnrLevel, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_TNR, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_TNR)->SetStrength(u32TnrLevel);
        stPqParam.u32Strength[HI_PQ_MODULE_TNR] = u32TnrLevel;
        pqprint(PQ_PRN_TNR, "Set TNR Level: %d\n", u32TnrLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetSnrLevel(HI_U32 *pu32SnrLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_BOOL bVdp4KSnrEn = HI_FALSE;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32SnrLevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_SNR, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_SNR)->GetStrength(pu32SnrLevel);
        pqprint(PQ_PRN_SNR, "Get SNR Level: %d\n", *pu32SnrLevel);
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_VDP4KSNR, GetStrength))
    {
        GET_ALG_FUN(HI_PQ_MODULE_VDP4KSNR)->GetEnable(&bVdp4KSnrEn);

        if (HI_TRUE == bVdp4KSnrEn)
        {
            s32Ret = GET_ALG_FUN(HI_PQ_MODULE_VDP4KSNR)->GetStrength(pu32SnrLevel);
            pqprint(PQ_PRN_VDP4KSNR, "Get VDP4KSNR Level: %d\n", *pu32SnrLevel);
        }
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetSnrLevel(HI_U32 u32SnrLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_BOOL bVdp4KSnrEn = HI_FALSE;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32SnrLevel, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_SNR, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_SNR)->SetStrength(u32SnrLevel);
        stPqParam.u32Strength[HI_PQ_MODULE_SNR] = u32SnrLevel;
        pqprint(PQ_PRN_SNR, "Set SNR Level: %d\n", u32SnrLevel);
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_VDP4KSNR, SetStrength))
    {
        GET_ALG_FUN(HI_PQ_MODULE_VDP4KSNR)->GetEnable(&bVdp4KSnrEn);

        if (HI_TRUE == bVdp4KSnrEn)
        {
            s32Ret = GET_ALG_FUN(HI_PQ_MODULE_VDP4KSNR)->SetStrength(u32SnrLevel);
            stPqParam.u32Strength[HI_PQ_MODULE_VDP4KSNR] = u32SnrLevel;
            pqprint(PQ_PRN_VDP4KSNR, "Set VDP4KSNR Level: %d\n", u32SnrLevel);
        }
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetDbLevel(HI_U32 *pu32DbLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32DbLevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DB, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DB)->GetStrength(pu32DbLevel);
        pqprint(PQ_PRN_DB_READ, "Get DB Level: %d\n", *pu32DbLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetDbLevel(HI_U32 u32DbLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32DbLevel, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DB, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DB)->SetStrength(u32DbLevel);
        stPqParam.u32Strength[HI_PQ_MODULE_DB] = u32DbLevel;
        pqprint(PQ_PRN_DB_READ, "Set DB Level: %d\n", u32DbLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetDmLevel(HI_U32 *pu32DmLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32DmLevel);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DM, GetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DM)->GetStrength(pu32DmLevel);
        pqprint(PQ_PRN_DM, "Get DM Level: %d\n", *pu32DmLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetDmLevel(HI_U32 u32DmLevel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32DmLevel, 100);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DM, SetStrength))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DM)->SetStrength(u32DmLevel);
        stPqParam.u32Strength[HI_PQ_MODULE_DM] = u32DmLevel;
        pqprint(PQ_PRN_DM, "Set DM Level: %d\n", u32DmLevel);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_GetPQModule(HI_PQ_MODULE_E enModule, HI_U32 *pu32OnOff)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32OnOff);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enModule, HI_PQ_MODULE_BUTT);

    if (HI_PQ_MODULE_ALL == enModule)
    {
        *pu32OnOff = stPqParam.bModuleOnOff[HI_PQ_MODULE_ALL];
        s32Ret = HI_SUCCESS;
    }
    else if (PQ_FUNC_CALL(enModule, GetEnable))
    {
        s32Ret = GET_ALG_FUN(enModule)->GetEnable(pu32OnOff);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetPQModule(HI_PQ_MODULE_E enModule, HI_U32 u32OnOff)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 i;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enModule, HI_PQ_MODULE_BUTT);

    if (HI_PQ_MODULE_ALL == enModule)
    {
        stPqParam.bModuleOnOff[HI_PQ_MODULE_ALL] = u32OnOff;

        for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
        {
            if (PQ_FUNC_CALL(i, SetEnable))
            {
                s32Ret = GET_ALG_FUN(i)->SetEnable(u32OnOff);
                stPqParam.bModuleOnOff[i] = u32OnOff;
            }
        }
    }
    else if (PQ_FUNC_CALL(enModule, SetEnable))
    {
        s32Ret = GET_ALG_FUN(enModule)->SetEnable(u32OnOff);
        stPqParam.bModuleOnOff[enModule] = u32OnOff;
    }

    return s32Ret;
}

HI_S32 DRV_PQ_SetDemoMode(HI_PQ_MODULE_E enModule, HI_BOOL bOnOff)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 i;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enModule, HI_PQ_MODULE_BUTT);

    if (HI_PQ_MODULE_ALL == enModule)
    {
        stPqParam.bDemoOnOff[HI_PQ_MODULE_ALL] = bOnOff;

        for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
        {
            if (PQ_FUNC_CALL(i, SetDemo))
            {
                s32Ret = GET_ALG_FUN(i)->SetDemo(bOnOff);
                stPqParam.bDemoOnOff[i] = bOnOff;
            }
        }
    }
    else if (PQ_FUNC_CALL(enModule, SetDemo))
    {
        s32Ret = GET_ALG_FUN(enModule)->SetDemo(bOnOff);
        stPqParam.bDemoOnOff[enModule] = bOnOff;
    }

    return s32Ret;
}

/* set demo display mode */
HI_S32 DRV_PQ_SetDemoDispMode(PQ_REG_TYPE_E enType, HI_PQ_DEMO_MODE_E enDemoMode)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 i = 0;
    PQ_DEMO_MODE_E enSetMode = PQ_DEMO_ENABLE_L;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enType, REG_TYPE_BUTT);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enDemoMode, HI_PQ_DEMO_MODE_BUTT);

    if ((HI_PQ_DEMO_MODE_FIXED_R == enDemoMode) || (HI_PQ_DEMO_MODE_SCROLL_R == enDemoMode))
    {
        enSetMode = PQ_DEMO_ENABLE_R;
    }
    else if ((HI_PQ_DEMO_MODE_FIXED_L == enDemoMode) || (HI_PQ_DEMO_MODE_SCROLL_L == enDemoMode))
    {
        enSetMode = PQ_DEMO_ENABLE_L;
    }

    for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
    {
        if (PQ_FUNC_CALL(i, SetDemoMode))
        {
            if (enType != PQ_COMM_GetAlgTypeID(i))
            {
                continue;
            }

            s32Ret = GET_ALG_FUN(i)->SetDemoMode(enSetMode);
        }
    }

    stPqParam.enDemoMode = enDemoMode;
    return s32Ret;
}

HI_S32 DRV_PQ_GetDemoDispMode(HI_PQ_DEMO_MODE_E *penDemoMode)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(penDemoMode);

    *penDemoMode = stPqParam.enDemoMode;

    return HI_SUCCESS;
}

static HI_VOID DRV_PQ_RefreshMktCoordinate(PQ_REG_TYPE_E enType)
{
    /* DEMO */
    HI_U32 i = 0;
    HI_U32 u32Step = 1;
    static HI_U32 s_u32Pos = 0;

    PQ_CHECK_OVER_RANGE_RE_NULL(enType, REG_TYPE_BUTT);

    if ((HI_PQ_DEMO_MODE_FIXED_R == stPqParam.enDemoMode) || (HI_PQ_DEMO_MODE_FIXED_L == stPqParam.enDemoMode))
    {
        DRV_PQ_SetDemoCoordinate(enType, sg_u32DemoCoordinate);
        return;
    }

    for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
    {
        if (HI_NULL == PQ_FUNC_CALL(i, SetDemoModeCoor))
        {
            continue;
        }

        if (enType != PQ_COMM_GetAlgTypeID(i))
        {
            continue;
        }

        /* set demo display mode*/
        if ((HI_PQ_DEMO_MODE_SCROLL_R == stPqParam.enDemoMode) || (HI_PQ_DEMO_MODE_SCROLL_L == stPqParam.enDemoMode))
        {
            if (0 == g_u32ImageWidth)
            {
                return;
            }

            if (REG_TYPE_VPSS == enType)
            {
                GET_ALG_FUN(i)->SetDemoModeCoor(s_u32Pos);
            }
            else if (REG_TYPE_VDP == enType)
            {
                GET_ALG_FUN(i)->SetDemoModeCoor(s_u32Pos * g_u32ImageWidth / g_u32ImageWidth);
            }
        }
    }

    s_u32Pos = s_u32Pos + u32Step;
    if (g_u32ImageWidth < s_u32Pos)
    {
        s_u32Pos = 0;
    }

    return;
}

HI_S32 DRV_PQ_SetDemoCoordinate(PQ_REG_TYPE_E enType, HI_U32 u32X)
{
    HI_U32 i;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enType, REG_TYPE_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32X, 100);

    sg_u32DemoCoordinate = u32X;

    for (i = 0; i < HI_PQ_MODULE_BUTT; i++)
    {
        if (HI_NULL == PQ_FUNC_CALL(i, SetDemoModeCoor))
        {
            continue;
        }

        if (enType != PQ_COMM_GetAlgTypeID(i))
        {
            continue;
        }

        /* set demo display mode*/
        if (REG_TYPE_VPSS == enType)
        {
            GET_ALG_FUN(i)->SetDemoModeCoor(g_u32ImageWidth * u32X / 100);
        }
        else if (REG_TYPE_VDP == enType)
        {
            if ((HI_PQ_MODULE_DCI == i) || (HI_PQ_MODULE_COLOR == i) || (HI_PQ_MODULE_SHARPNESS == i))
            {

                GET_ALG_FUN(i)->SetDemoModeCoor(g_u32OutWidth * u32X / 100);
            }
            else
            {

                GET_ALG_FUN(i)->SetDemoModeCoor(g_u32ImageWidth * u32X / 100);
            }
        }
    }

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetDemoCoordinate(HI_U32 *pu32X)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32X);

    *pu32X = sg_u32DemoCoordinate;

    return HI_SUCCESS;
}

static HI_VOID DRV_PQ_RefreshVdpCfg(HI_VOID)
{
    DRV_PQ_RefreshMktCoordinate(REG_TYPE_VDP);

    PQ_TABLE_InitSoftTable(HI_FALSE);

    return;
}

static HI_S32 drv_pq_SetModuleEn(HI_PQ_MODULE_E enMode, HI_BOOL bModuleOnOff)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enMode, HI_PQ_MODULE_BUTT);

    if (HI_NULL == PQ_FUNC_CALL(enMode, SetEnable))
    {
        return s32Ret;
    }

    s32Ret = GET_ALG_FUN(enMode)->SetEnable(bModuleOnOff);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("Alg ID:%d, SetEnable error!\n", enMode);
    }

    return s32Ret;
}

static HI_S32 DRV_PQ_ResetPqStatusParam(HI_PQ_MODULE_E enModule, PQ_REG_TYPE_E enType)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HI_PQ_MODULE_E  enModuledex = HI_PQ_MODULE_FMD, enModuleMax = HI_PQ_MODULE_BUTT;
    HI_BOOL bModuleOn = HI_FALSE;
    PQ_DEMO_MODE_E enSetDemoMode = PQ_DEMO_ENABLE_L;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enType, REG_TYPE_BUTT);

    if ((HI_PQ_DEMO_MODE_FIXED_R == stPqParam.enDemoMode) || (HI_PQ_DEMO_MODE_SCROLL_R == stPqParam.enDemoMode))
    {
        enSetDemoMode = PQ_DEMO_ENABLE_R;
    }
    else if ((HI_PQ_DEMO_MODE_FIXED_L == stPqParam.enDemoMode) || (HI_PQ_DEMO_MODE_SCROLL_L == stPqParam.enDemoMode))
    {
        enSetDemoMode = PQ_DEMO_ENABLE_L;
    }

    if (HI_PQ_MODULE_ALL == enModule)
    {
        enModuledex = HI_PQ_MODULE_FMD;
        enModuleMax = HI_PQ_MODULE_BUTT;
    }
    else
    {
        enModuledex = enModule;
        enModuleMax = enModule + 1;
    }
    for (enModuledex = 0; enModuledex < enModuleMax; enModuledex++)
    {
        if (HI_NULL == GET_ALG(enModuledex))
        {
            continue;
        }

        if (enType != PQ_COMM_GetAlgTypeID(enModuledex))
        {
            continue;
        }

        /* alg en refresh */
        if (GET_ALG_FUN(enModuledex)->SetEnable)
        {
            bModuleOn = (HI_TRUE == sg_bDefaultParam) ? HI_FALSE : stPqParam.bModuleOnOff[enModuledex];

            s32Ret = GET_ALG_FUN(enModuledex)->SetEnable(bModuleOn);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PQ("Alg ID:%d, SetEnable error!\n", enModuledex);
            }
        }

        /* alg demo en refresh */
        if (GET_ALG_FUN(enModuledex)->SetDemo)
        {
            s32Ret = GET_ALG_FUN(enModuledex)->SetDemo(stPqParam.bDemoOnOff[enModuledex]);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PQ("Alg ID:%d, SetDemo error!\n", enModuledex);
            }
        }

        /* alg demo mode refresh */
        if (GET_ALG_FUN(enModuledex)->SetDemoMode)
        {
            s32Ret = GET_ALG_FUN(enModuledex)->SetDemoMode(enSetDemoMode);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PQ("Alg ID:%d, SetDemoMode error!\n", enModuledex);
            }
        }

        /* alg strength refresh */
        if (GET_ALG_FUN(enModuledex)->SetStrength)
        {
            s32Ret = GET_ALG_FUN(enModuledex)->SetStrength(stPqParam.u32Strength[enModuledex]);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PQ("Alg ID:%d, SetStrength error!\n", enModuledex);
            }
        }
    }

    return s32Ret;
}

static HI_S32 DRV_PQ_ResetSoftAlgPqStatus(HI_PQ_MODULE_E enModule, PQ_REG_TYPE_E enType,
        HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HI_PQ_MODULE_E  enModuledex = HI_PQ_MODULE_FMD, enModuleMax = HI_PQ_MODULE_BUTT, enModuleMin = HI_PQ_MODULE_FMD;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enType, REG_TYPE_BUTT);

    if (HI_PQ_MODULE_ALL == enModule)
    {
        enModuleMin = HI_PQ_MODULE_FMD;
        enModuleMax = HI_PQ_MODULE_ALL;
    }
    else
    {
        enModuleMin = enModule;
        enModuleMax = enModule + 1;
    }

    for (enModuledex = enModuleMin; enModuledex < enModuleMax; enModuledex++)
    {
        if ((HI_NULL == GET_ALG(enModuledex)) || (enType != PQ_COMM_GetAlgTypeID(enModuledex)))
        {
            continue;
        }

        /* pqstatus refresh */
        if (GET_ALG_FUN(enModuledex)->ReSetPqStatus)
        {
            s32Ret = GET_ALG_FUN(enModuledex)->ReSetPqStatus(pstPqFrameInfo, pstVpssRegInfo);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PQ("Alg ID:%d, ReSetPqStatus error!\n", enModuledex);
            }
        }
    }

    return s32Ret;
}

/*static HI_S32 drv_pq_SetSceneMode(HI_PQ_VPSS_MODULE_S *pstPQModule)
{
    PQ_STATUS_S stPqStatus = {0};

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPQModule);

    PQ_COMM_GetPqStatus(&stPqStatus);

    if (PQ_IMAGE_MODE_NORMAL == stPqStatus.enImageMode)
    {
        PQ_COMM_SetOutputMode(PQ_OUTPUT_MODE_NO);
        return HI_SUCCESS;
    }

    if (HI_PQ_SCENE_MODE_PREVIEW == pstPQModule->enSceneMode)
    {
        PQ_COMM_SetOutputMode(OUTPUT_MODE_PREVIEW);
    }
    else if (HI_PQ_SCENE_MODE_REMOTE == pstPQModule->enSceneMode)
    {
        PQ_COMM_SetOutputMode(OUTPUT_MODE_REMOTE);
    }

    return HI_SUCCESS;
}*/

HI_S32 DRV_PQ_SetImageMode(HI_PQ_IMAGE_MODE_E enImageMode)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PQ_STATUS_S stPqStatus;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enImageMode, HI_PQ_IMAGE_MODE_BUTT);

    PQ_COMM_GetPqStatus(&stPqStatus);
    stPqStatus.enImageMode = (PQ_COMM_IMAGE_MODE_E)enImageMode;

    s32Ret = PQ_COMM_SetPqStatus(&stPqStatus);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_COMM_SetPqStatus Failed \n");
        return HI_FAILURE;
    }

    //DRV_PQ_SetSharpness(stPqParam.u32Strength[HI_PQ_MODULE_SHARPNESS]);
    //drv_pq_SetModuleEn(HI_PQ_MODULE_DCI, stPqParam.bModuleOnOff[HI_PQ_MODULE_DCI]);

    return s32Ret;
}

HI_S32 DRV_PQ_GetImageMode(HI_PQ_IMAGE_MODE_E *penImageMode)
{
    PQ_STATUS_S stPqStatus = {0};

    PQ_CHECK_NULL_PTR_RE_FAIL(penImageMode);

    PQ_COMM_GetPqStatus(&stPqStatus);
    *penImageMode = (HI_PQ_IMAGE_MODE_E)stPqStatus.enImageMode;

    return HI_SUCCESS;
}

#if 1
static HI_S32 drv_pq_UpdatePartlyVdpPQ(PQ_SOURCE_MODE_E enSourceMode, PQ_OUTPUT_MODE_E enOutputMode)
{
    HI_S32  s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enSourceMode, PQ_SOURCE_MODE_BUTT);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enOutputMode, PQ_OUTPUT_MODE_BUTT);

    s32Ret = PQ_TABLE_LoadMultiList(REG_TYPE_VDP, enSourceMode, enOutputMode);

    return s32Ret;
}

static HI_S32 drv_pq_UpdatefullVdpPQ430(PQ_SOURCE_MODE_E enSourceMode, PQ_OUTPUT_MODE_E enOutputMode)
{
    HI_S32  s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enSourceMode, PQ_SOURCE_MODE_BUTT);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enOutputMode, PQ_OUTPUT_MODE_BUTT);

    s32Ret = PQ_TABLE_LoadPhyList(REG_TYPE_VDP, enSourceMode, enOutputMode, HI_NULL);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_TABLE_LoadPhyList VDP failed!\n");
        return s32Ret;
    }

    /*Set Picture Setting*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_SD0, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stSDVideoSetting);
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_HD1, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stHDVideoSetting);
    }

    /* Set Color Enhance */
    if (HI_PQ_COLOR_ENHANCE_FLESHTONE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        DRV_PQ_SetFleshToneLevel(stPqParam.stColorEnhance.unColorGain.enFleshtone);
    }
    else if (HI_PQ_COLOR_ENHANCE_SIX_BASE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        HI_PQ_SIX_BASE_COLOR_S *pstPQSixBase = &(stPqParam.stColorEnhance.unColorGain.stSixBase);
        DRV_PQ_SetSixBaseColorLevel(pstPQSixBase);
    }
    else if (HI_PQ_COLOR_ENHANCE_SPEC_COLOR_MODE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        DRV_PQ_SetColorEnhanceMode(stPqParam.stColorEnhance.unColorGain.enColorMode);
    }

    /* Update Coef */
    if ((PQ_FUNC_CALL(HI_PQ_MODULE_DCI, SetResume)) && (PQ_FUNC_CALL(HI_PQ_MODULE_DCI, UpdatDCICoef)))
    {
        if (GET_ALG_FUN(HI_PQ_MODULE_DCI)->SetResume)
        {
            GET_ALG_FUN(HI_PQ_MODULE_DCI)->SetResume(!g_bLoadPqBin);
        }

        if (GET_ALG_FUN(HI_PQ_MODULE_DCI)->UpdatDCICoef)
        {
            GET_ALG_FUN(HI_PQ_MODULE_DCI)->UpdatDCICoef(HI_PQ_VDP_LAYER_VID_HD0);
        }
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, UpdatACMCoef))
    {
        GET_ALG_FUN(HI_PQ_MODULE_COLOR)->UpdatACMCoef(PQ_VDP_LAYER_VP0);
    }

    return s32Ret;
}

static HI_S32 drv_pq_UpdatefullVdpPQ(PQ_SOURCE_MODE_E enSourceMode, PQ_OUTPUT_MODE_E enOutputMode)
{
    HI_S32  s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enSourceMode, PQ_SOURCE_MODE_BUTT);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enOutputMode, PQ_OUTPUT_MODE_BUTT);

    s32Ret = PQ_TABLE_LoadPhyList(REG_TYPE_VDP, enSourceMode, enOutputMode, HI_NULL);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_TABLE_LoadPhyList VDP failed!\n");
        return s32Ret;
    }

    /*Set Picture Setting*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_SD0, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stSDVideoSetting);
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_HD1, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stHDVideoSetting);
    }

    /* Set Color Enhance */
    if (HI_PQ_COLOR_ENHANCE_FLESHTONE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        DRV_PQ_SetFleshToneLevel(stPqParam.stColorEnhance.unColorGain.enFleshtone);
    }
    else if (HI_PQ_COLOR_ENHANCE_SIX_BASE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        HI_PQ_SIX_BASE_COLOR_S *pstPQSixBase = &(stPqParam.stColorEnhance.unColorGain.stSixBase);
        DRV_PQ_SetSixBaseColorLevel(pstPQSixBase);
    }
    else if (HI_PQ_COLOR_ENHANCE_SPEC_COLOR_MODE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        DRV_PQ_SetColorEnhanceMode(stPqParam.stColorEnhance.unColorGain.enColorMode);
    }

    /* Update Coef */
    if ((PQ_FUNC_CALL(HI_PQ_MODULE_DCI, SetResume)) && (PQ_FUNC_CALL(HI_PQ_MODULE_DCI, UpdatDCICoef)))
    {
        if (GET_ALG_FUN(HI_PQ_MODULE_DCI)->SetResume)
        {
            GET_ALG_FUN(HI_PQ_MODULE_DCI)->SetResume(!g_bLoadPqBin);
        }

        if (GET_ALG_FUN(HI_PQ_MODULE_DCI)->UpdatDCICoef)
        {
            GET_ALG_FUN(HI_PQ_MODULE_DCI)->UpdatDCICoef(HI_PQ_VDP_LAYER_VID_HD0);
        }
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_COLOR, UpdatACMCoef))
    {
        GET_ALG_FUN(HI_PQ_MODULE_COLOR)->UpdatACMCoef(PQ_VDP_LAYER_VP0);
    }

    return s32Ret;
}


HI_S32 DRV_PQ_UpdateVdpPQ(HI_PQ_DISPLAY_E enDisplayId, HI_VDP_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVDPReg)
{
    HI_S32      s32Ret;
    HI_BOOL     bTimingChange = HI_FALSE;
    PQ_SOURCE_MODE_E enSourceMode = PQ_SOURCE_MODE_HD;
    PQ_OUTPUT_MODE_E enOutputMode = PQ_OUTPUT_MODE_HD;
    static HI_VDP_PQ_INFO_S stTimingInfo[HI_PQ_DISPLAY_BUTT] = {{0}};

    PQ_CHECK_OVER_RANGE_RE_FAIL(enDisplayId, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVDPReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstTimingInfo);

    if ((pstTimingInfo != HI_NULL) && (HI_PQ_VDP_LAYER_VID_HD1 == pstTimingInfo->enLayerId))
    {
        return HI_SUCCESS;
    }

    if (pstTimingInfo->u32Width == 0 || pstTimingInfo->u32Height == 0)
    {
        HI_ERR_PQ("VDP Timing W | H is Zero !\n");
        return HI_SUCCESS;
    }

    /* Update VDP Register point */
    //PQ_HAL_UpdateVdpReg(pstVDPReg);

    PQ_HAL_UpdateVdpReg430((S_VDP_REGS_TYPE *)pstVDPReg);

    /* Update VDP confignure every interrupt */
    DRV_PQ_RefreshVdpCfg();

    /*DCI scene change software alg*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_DCI, CalDCIScd))
    {
        GET_ALG_FUN(HI_PQ_MODULE_DCI)->CalDCIScd();
    }

    pqprint(PQ_PRN_VDP, "[%s]: DisplayId:%d, enLayerId:%d, Width:%d, Height:%d, OutWidth:%d, OutHeight:%d, bSRState:%d, b3dType:%d\n",
            __FUNCTION__, enDisplayId, pstTimingInfo->enLayerId, pstTimingInfo->u32Width, pstTimingInfo->u32Height,
            pstTimingInfo->stVideo.s32Width, pstTimingInfo->stVideo.s32Height, pstTimingInfo->bSRState, pstTimingInfo->b3dType);
    pqprint(PQ_PRN_VDP, "bProgressive:%d, Width:%d, Height:%d,  s32X:%d, s32Y:%d, u32RefreshRate:%d\n",
            pstTimingInfo->stChannelTiming[enDisplayId].bProgressive, pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32Width,
            pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32Height, pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32X,
            pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32Y,
            pstTimingInfo->stChannelTiming[enDisplayId].u32RefreshRate);

    bTimingChange  =  (stTimingInfo[enDisplayId].u32Width != pstTimingInfo->u32Width)
                      || (stTimingInfo[enDisplayId].u32Height != pstTimingInfo->u32Height)
                      || (stTimingInfo[enDisplayId].stVideo.s32Width != pstTimingInfo->stVideo.s32Width)
                      || (stTimingInfo[enDisplayId].stVideo.s32Height != pstTimingInfo->stVideo.s32Height)
                      || (stTimingInfo[enDisplayId].bSRState != pstTimingInfo->bSRState)
                      || (stTimingInfo[enDisplayId].b3dType != pstTimingInfo->b3dType)
                      || (stTimingInfo[enDisplayId].bHdrMode != pstTimingInfo->bHdrMode)
                      || (0 != memcmp((HI_VOID *)&g_stPqStatus.stTimingInfo[enDisplayId], &pstTimingInfo->stChannelTiming[enDisplayId], sizeof(HI_VDP_CHANNEL_TIMING_S)));

    if ((HI_TRUE == pstTimingInfo->bPartUpdate) && (HI_FALSE == bTimingChange))
    {
        return HI_SUCCESS;
    }

    memcpy(&stTimingInfo[enDisplayId], pstTimingInfo, sizeof(HI_VDP_PQ_INFO_S));
    memcpy(&(g_stPqStatus.stTimingInfo[enDisplayId]), &(pstTimingInfo->stChannelTiming[enDisplayId]), sizeof(HI_VDP_CHANNEL_TIMING_S));

    /*ignored sd*/
    if (HI_PQ_DISPLAY_SD0 == enDisplayId)
    {
        return HI_SUCCESS;
    }

    g_stPqStatus.bIsogenyMode = pstTimingInfo->bIsogenyMode;
    g_stPqStatus.b3dType      = pstTimingInfo->b3dType;

    enSourceMode = PQ_COMM_GetSourceMode();
    enOutputMode = PQ_COMM_GetOutputMode();
    if ((OUTPUT_MODE_PREVIEW != enOutputMode) && (OUTPUT_MODE_REMOTE != enOutputMode))
    {
        enOutputMode     = PQ_COMM_CheckOutputMode(pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32Width);
        PQ_COMM_SetOutputMode(enOutputMode);
    }

    /* Load VDP Physical Register */
    if (HI_TRUE == pstTimingInfo->bPartUpdate)
    {
        /*Set Partly update*/
        drv_pq_UpdatePartlyVdpPQ(enSourceMode, enOutputMode);
    }
    else
    {
        /*Set FULL update*/
        s32Ret = drv_pq_UpdatefullVdpPQ(enSourceMode, enOutputMode);

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PQ("UpdatefullVdpPQ VDP failed!\n");
            return s32Ret;
        }
    }

    /* set isogeny mode */

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetIsogenyMode))
    {
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetIsogenyMode(pstTimingInfo->bIsogenyMode);
    }

    /*************************************************************************
     *   reset VDP customer pq setting
     *************************************************************************/

    s32Ret = DRV_PQ_ResetPqStatusParam(HI_PQ_MODULE_ALL, REG_TYPE_VDP);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam VDP failed!\n");
    }

    /* set demo mode*/
    DRV_PQ_SetDemoDispMode(REG_TYPE_VDP, stPqParam.enDemoMode);
    DRV_PQ_SetDemoCoordinate(REG_TYPE_VDP, sg_u32DemoCoordinate);

    return HI_SUCCESS;
}

#if 1
/*
1. load phy para:这一个增加一项是否分源和输出的分辨率发生变化，变化则重新load；
2. 刷新sharp、acc、acm参数
3. 使能 + demo + 强度重新刷新
*/

HI_S32 DRV_PQ_UpdateVdpOnlinePQ(HI_PQ_DISPLAY_E enDisplayId, HI_PQ_ONLINE_INFO_S *pstOnlineInfo, HI_VOID *pstVDPReg)
{
    HI_S32      s32Ret;
    HI_BOOL     bTimingChange = HI_FALSE;
    PQ_SOURCE_MODE_E enSourceMode = PQ_SOURCE_MODE_SD;
    PQ_OUTPUT_MODE_E enOutputMode = PQ_OUTPUT_MODE_HD;
    static HI_PQ_ONLINE_INFO_S stOnlineInfo = {{0}};

    PQ_CHECK_OVER_RANGE_RE_FAIL(enDisplayId, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVDPReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstOnlineInfo);

    /* only support disp1 */
    if (HI_PQ_DISPLAY_HD1 != enDisplayId)
    {
        return HI_SUCCESS;
    }

    if ((pstOnlineInfo->stSrcRect.s32Width == 0) || (pstOnlineInfo->stSrcRect.s32Height == 0)
        || (pstOnlineInfo->stOutRect.s32Width == 0) || (pstOnlineInfo->stOutRect.s32Height == 0))
    {
        HI_ERR_PQ("pstOnlineInfo reso Zero (src W = %d | H = %d) (out W = %d | H = %d) !\n",
                  pstOnlineInfo->stSrcRect.s32Width, pstOnlineInfo->stSrcRect.s32Height,
                  pstOnlineInfo->stOutRect.s32Width, pstOnlineInfo->stOutRect.s32Height);
        return HI_FAILURE;
    }

    g_u32OutWidth   = (HI_U32)pstOnlineInfo->stOutRect.s32Width;

    enSourceMode = PQ_COMM_GetSourceMode();

    enOutputMode = PQ_COMM_CheckOutputMode(pstOnlineInfo->stOutRect.s32Width);
    PQ_COMM_SetOutputMode(enOutputMode);

    /*enOutputMode = PQ_COMM_GetOutputMode();*/

#if 0
    pqprint(PQ_PRN_VDP, "[%s]: DisplayId:%d, enLayerId:%d, Width:%d, Height:%d, OutWidth:%d, OutHeight:%d, bSRState:%d, b3dType:%d\n",
            __FUNCTION__, enDisplayId, pstOnlineInfo->enLayerId, pstOnlineInfo->u32Width, pstOnlineInfo->u32Height,
            pstOnlineInfo->stVideo.s32Width, pstOnlineInfo->stVideo.s32Height, pstTimingInfo->bSRState, pstTimingInfo->b3dType);
    pqprint(PQ_PRN_VDP, "bProgressive:%d, Width:%d, Height:%d,  s32X:%d, s32Y:%d, u32RefreshRate:%d\n",
            pstOnlineInfo->stChannelTiming[enDisplayId].bProgressive, pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32Width,
            pstOnlineInfo->stChannelTiming[enDisplayId].stFmtRect.s32Height, pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32X,
            pstOnlineInfo->stChannelTiming[enDisplayId].stFmtRect.s32Y,
            pstOnlineInfo->stChannelTiming[enDisplayId].u32RefreshRate);
#endif
    bTimingChange  =  (stOnlineInfo.stSrcRect.s32Width != pstOnlineInfo->stSrcRect.s32Width)
                      || (stOnlineInfo.stSrcRect.s32Height != pstOnlineInfo->stSrcRect.s32Height)
                      || (stOnlineInfo.stOutRect.s32Width != pstOnlineInfo->stOutRect.s32Width)
                      || (stOnlineInfo.stOutRect.s32Height != pstOnlineInfo->stOutRect.s32Height);

    if (HI_TRUE == bTimingChange) // refresh phy para
    {
        /* Load VDP Physical Register */
        s32Ret = PQ_TABLE_LoadMultiList(REG_TYPE_VDP, enSourceMode, enOutputMode);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PQ("PQ_TABLE_LoadMultiList VDP failed!\n");
            return s32Ret;
        }
    }

    memcpy(&stOnlineInfo, pstOnlineInfo, sizeof(HI_PQ_ONLINE_INFO_S));
    //memcpy(&(g_stPqStatus.stTimingInfo[enDisplayId]), &(pstOnlineInfo->stChannelTiming[enDisplayId]), sizeof(HI_VDP_CHANNEL_TIMING_S));

    /*g_stPqStatus.bIsogenyMode = pstOnlineInfo->bIsogenyMode;
    g_stPqStatus.b3dType      = pstOnlineInfo->b3dType;*/


    /* Update VDP Register point */
    PQ_HAL_UpdateOnlineReg430((S_VDP_REGS_TYPE *)pstVDPReg);
    /*HI_ERR_PQ("%#d\n",pstVDPReg->VHDACCTHD1.bits.acc_en);*/

    /*************************************************************************
     *   reset VDP customer pq setting
     *************************************************************************/

    /*Set Picture Setting*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_SD0, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stSDVideoSetting);
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_HD1, (HI_PQ_PICTURE_SETTING_S *)&stPqParam.stHDVideoSetting);
    }

    /* Set Color Enhance */
    if (HI_PQ_COLOR_ENHANCE_FLESHTONE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        DRV_PQ_SetFleshToneLevel(stPqParam.stColorEnhance.unColorGain.enFleshtone);
    }
    else if (HI_PQ_COLOR_ENHANCE_SIX_BASE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        HI_PQ_SIX_BASE_COLOR_S *pstPQSixBase = &(stPqParam.stColorEnhance.unColorGain.stSixBase);
        DRV_PQ_SetSixBaseColorLevel(pstPQSixBase);
    }
    else if (HI_PQ_COLOR_ENHANCE_SPEC_COLOR_MODE == stPqParam.stColorEnhance.enColorEnhanceType)
    {
        DRV_PQ_SetColorEnhanceMode(stPqParam.stColorEnhance.unColorGain.enColorMode);
    }

    /* reset vpss customer pq setting */
    s32Ret = DRV_PQ_ResetPqStatusParam(HI_PQ_MODULE_ALL, REG_TYPE_VDP);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam  failed!\n");
    }

    /* set demo mode*/
    DRV_PQ_SetDemoDispMode(REG_TYPE_VDP, stPqParam.enDemoMode);
    DRV_PQ_SetDemoCoordinate(REG_TYPE_VDP, sg_u32DemoCoordinate);

    /*HI_ERR_PQ("%#d\n",pstVDPReg->VHDACCTHD1.bits.acc_en);*/
    PQ_HAL_UpdateOnlineReg430_Ctrl((S_VDP_REGS_TYPE *)pstVDPReg);
    /*HI_ERR_PQ("%#d\n",pstVDPReg->VHDACCTHD1.bits.acc_en);*/

    /* Update VDP confignure every interrupt */
    //DRV_PQ_RefreshVdpCfg();

    return HI_SUCCESS;
}
#endif

#endif

HI_S32 DRV_PQ_GetACCHistGram(HI_PQ_ACC_HISTGRAM_S *pstACCHistGram)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstACCHistGram);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_DCI, GetACCHistGram))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DCI)->GetACCHistGram(pstACCHistGram);
    }
    return s32Ret;
}

HI_S32 DRV_PQ_UpdateACCHistGram(HI_PQ_ACC_HISTGRAM_S *pstACCHistGram)
{
    return HI_SUCCESS;
}

/* Vedio CSC Port must Every frame  */
HI_S32 DRV_PQ_GetCSCCoef(HI_PQ_CSC_CRTL_S *pstCscCtrl, HI_PQ_CSC_MODE_E enCscMode, HI_PQ_CSC_COEF_S *pstCscCoef, HI_PQ_CSC_DCCOEF_S *pstCscDcCoef)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstCscCtrl);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enCscMode, HI_PQ_CSC_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstCscCoef);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstCscDcCoef);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, GetCSCCoef))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->GetCSCCoef(pstCscCtrl, enCscMode, pstCscCoef, pstCscDcCoef);
    }

    return s32Ret;
}

/* Gfx CSC Port must Every frame  */
HI_S32 DRV_PQ_SetGfxCscCoef(HI_PQ_GFX_LAYER_E enGfxCscLayer, HI_PQ_GFX_CSC_PARA_S *pstGfxCscPara)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enGfxCscLayer, PQ_GFX_LAYER_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstGfxCscPara);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCscCoef))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCscCoef(enGfxCscLayer, pstGfxCscPara);
    }

    return s32Ret;
}

HI_S32 DRV_PQ_Get8BitCSCCoef(HI_PQ_CSC_MODE_E  enCSCMode, HI_PQ_CSC_COEF_S *pstCSCCoef, HI_PQ_CSC_DCCOEF_S *pstCSCDCCoef)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enCSCMode, HI_PQ_CSC_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstCSCCoef);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstCSCDCCoef);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, Get8BitCSCCoef))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_CSC)->Get8BitCSCCoef(enCSCMode, pstCSCCoef, pstCSCDCCoef);
    }

    return s32Ret;
}

/*HI_S32 DRV_PQ_SetZme(HI_PQ_ZME_LAYER_E enLayerId, HI_PQ_ZME_PARA_IN_S *pstZmeDrvPara, HI_BOOL  bFirEnable)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enLayerId, HI_PQ_ZME_LAYER_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeDrvPara);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_ZME, SetVdpZme))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_ZME)->SetVdpZme(enLayerId, pstZmeDrvPara, bFirEnable);
    }

    return s32Ret;
}*/


HI_S32 DRV_PQ_GetVdpZmeStrategy (HI_PQ_ZME_LAYER_E enLayerId, HI_PQ_ZME_STRATEGY_IN_U *pstZmeIn, HI_PQ_ZME_STRATEGY_OUT_U *pstZmeOut)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enLayerId, HI_PQ_ZME_LAYER_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeIn);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeOut);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_ZME, GetVdpZmeStrategy))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_ZME)->GetVdpZmeStrategy(enLayerId, pstZmeIn, pstZmeOut);
    }

    return s32Ret;
}


#if 1

HI_S32 DRV_PQ_InitVpssAlgCfg(HI_U32 u32HandleNo, HI_VPSS_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVPSSReg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32HandleNoTmp = 0;
    PQ_SOURCE_MODE_E enSourceMode = PQ_SOURCE_MODE_NO;
    PQ_OUTPUT_MODE_E enOutputMode = PQ_OUTPUT_MODE_NO;
    S_VPSS_REGS_TYPE *pstTmpVPSSReg = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstVPSSReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstTimingInfo);

    //PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32HandleNo, VPSS_HANDLE_NUM);
    g_u32ImageWidth  = pstTimingInfo->u32Width;
    g_u32ImageHeight = pstTimingInfo->u32Height;
    enSourceMode  = PQ_COMM_CheckSourceMode(g_u32ImageWidth);
    PQ_COMM_SetSourceMode(enSourceMode);

    //PQ_COMM_SetOutputMode(enOutputMode);
    //enOutputMode = PQ_COMM_GetOutputMode();

    //enOutputMode = PQ_COMM_GetOutputMode();
    /* Load VPSS Physical Register */
    s32Ret = PQ_TABLE_LoadPhyList(REG_TYPE_VDP, enSourceMode, enOutputMode, u32HandleNoTmp);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_TABLE_LoadPhyList VPSS failed!\n");
        return s32Ret;
    }

    /* tnr */
    // update tnr clut
    if (PQ_FUNC_CALL(HI_PQ_MODULE_TNR, SetTNRBlendingAlphaLut))
    {
        GET_ALG_FUN(HI_PQ_MODULE_TNR)->SetTNRBlendingAlphaLut(pstTimingInfo->u32FrameIndex, u32HandleNo);
    }
#if 0
    /* reset vpss customer pq setting */
    s32Ret = DRV_PQ_ResetPqStatusParam(REG_TYPE_VPSS);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam VPSS failed!\n");
    }

    /* set demo mode*/
    DRV_PQ_SetDemoDispMode(REG_TYPE_VPSS, stPqParam.enDemoMode);
    DRV_PQ_SetDemoCoordinate(REG_TYPE_VPSS, sg_u32DemoCoordinate);
#endif

    /* reset vpss customer pq setting */
    s32Ret = DRV_PQ_ResetPqStatusParam(HI_PQ_MODULE_ALL, REG_TYPE_VDP);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam VPSS failed!\n");
    }

    pstTmpVPSSReg = (S_VPSS_REGS_TYPE *)pstVPSSReg;

    PQ_HAL_UpdateVpssReg430(u32HandleNoTmp, pstTmpVPSSReg);

    pstTmpVPSSReg->VPSS_DBD_IMG.bits.img_width_org  = pstTimingInfo->u32Width - 1;
    pstTmpVPSSReg->VPSS_DBD_IMG.bits.img_height_org = pstTimingInfo->u32Height - 1;
    pstTmpVPSSReg->VPSS_DBD_AREA.bits.valid_area_width = pstTimingInfo->u32Width - 1;

    pstVPSSReg = (HI_VOID *)pstTmpVPSSReg;

    return s32Ret;
}


HI_S32 DRV_PQ_InitVdpAlgCfg(HI_PQ_DISPLAY_E enDisplayId, HI_VDP_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVDPReg)
{
    HI_S32      s32Ret;
    //HI_BOOL     bTimingChange = HI_FALSE;
    //HI_PQ_DCI_WIN_S stDciWin;
    PQ_SOURCE_MODE_E enSourceMode = PQ_SOURCE_MODE_NO;
    PQ_OUTPUT_MODE_E enOutputMode = PQ_OUTPUT_MODE_HD;
    static HI_VDP_PQ_INFO_S stTimingInfo[HI_PQ_DISPLAY_BUTT] = {{0}};

    PQ_CHECK_OVER_RANGE_RE_FAIL(enDisplayId, HI_PQ_DISPLAY_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVDPReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstTimingInfo);

    if (HI_PQ_VDP_LAYER_VID_HD1 == pstTimingInfo->enLayerId)
    {
        return HI_SUCCESS;
    }

    if (pstTimingInfo->u32Width == 0 || pstTimingInfo->u32Height == 0)
    {
        HI_ERR_PQ("VDP Timing W | H is Zero !\n");
        return HI_SUCCESS;
    }

    /* Update VDP Register point */
    PQ_HAL_UpdateVdpReg430((S_VDP_REGS_TYPE *)pstVDPReg);
    /* Update VDP confignure every interrupt */
    //DRV_PQ_RefreshVdpCfg();

    /*bTimingChange  =  (stTimingInfo[enDisplayId].u32Width != pstTimingInfo->u32Width)
                      || (stTimingInfo[enDisplayId].u32Height != pstTimingInfo->u32Height)
                      || (stTimingInfo[enDisplayId].stVideo.s32Width != pstTimingInfo->stVideo.s32Width)
                      || (stTimingInfo[enDisplayId].stVideo.s32Height != pstTimingInfo->stVideo.s32Height)
                      || (stTimingInfo[enDisplayId].bSRState != pstTimingInfo->bSRState)
                      || (stTimingInfo[enDisplayId].b3dType != pstTimingInfo->b3dType)
                      || (stTimingInfo[enDisplayId].bHdrMode != pstTimingInfo->bHdrMode)
                      || (0 != memcmp((HI_VOID *)&g_stPqStatus.stTimingInfo[enDisplayId], &pstTimingInfo->stChannelTiming[enDisplayId], sizeof(HI_VDP_CHANNEL_TIMING_S)));*/

    /*if ((HI_TRUE == pstTimingInfo->bPartUpdate) && (HI_FALSE == bTimingChange))
    {
        return HI_SUCCESS;
    }
    */
    memcpy(&stTimingInfo[enDisplayId], pstTimingInfo, sizeof(HI_VDP_PQ_INFO_S));
    memcpy(&(g_stPqStatus.stTimingInfo[enDisplayId]), &(pstTimingInfo->stChannelTiming[enDisplayId]), sizeof(HI_VDP_CHANNEL_TIMING_S));

    /*ignored sd*/
    if (HI_PQ_DISPLAY_SD0 == enDisplayId)
    {
        return HI_SUCCESS;
    }

    g_stPqStatus.bIsogenyMode = pstTimingInfo->bIsogenyMode;
    g_stPqStatus.b3dType      = pstTimingInfo->b3dType;
#if 0
    g_u32ImageWidth  = pstTimingInfo->u32Width;
    g_u32ImageHeight = pstTimingInfo->u32Height;
    enSourceMode     = PQ_COMM_CheckSourceMode(g_u32ImageWidth);
    PQ_COMM_SetSourceMode(enSourceMode);
    enOutputMode = PQ_COMM_GetOutputMode();
    if ((OUTPUT_MODE_PREVIEW != enOutputMode) && (OUTPUT_MODE_REMOTE != enOutputMode))
    {
        enOutputMode     = PQ_COMM_CheckOutputMode(pstTimingInfo->stChannelTiming[enDisplayId].stFmtRect.s32Width);
        PQ_COMM_SetOutputMode(enOutputMode);
    }
#endif
    enOutputMode = PQ_COMM_CheckOutputMode(pstTimingInfo->u32Width);
    PQ_COMM_SetOutputMode(enOutputMode);

    s32Ret = drv_pq_UpdatefullVdpPQ430(enSourceMode, enOutputMode);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("return failed!\n");
        return s32Ret;
    }

    /* set isogeny mode */
    /*if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetIsogenyMode))
    {
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetIsogenyMode(pstTimingInfo->bIsogenyMode);
    }*/

    /*************************************************************************
     *   reset VDP customer pq setting
     *************************************************************************/

    /*s32Ret = DRV_PQ_ResetPqStatusParam(REG_TYPE_ALL);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam VDP failed!\n");
    }*/

    /* set demo mode*/
    //DRV_PQ_SetDemoDispMode(REG_TYPE_VDP, stPqParam.enDemoMode);
    //DRV_PQ_SetDemoCoordinate(REG_TYPE_VDP, sg_u32DemoCoordinate);

    return HI_SUCCESS;
}


/*
1. 每帧都要刷新的接口
2. 场景切换时候的接口
3. 回写的接口

step1:update all reg
step2:update all soft
step3:output reg & soft

*/

HI_S32 DRV_PQ_GetVpssAlgCfg(HI_PQ_FRAME_INFO_S *pstPqFrameInfo,
                            HI_PQ_DISP_INFO_S *pstPqDispInfo,
                            HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo,
                            HI_PQ_VPSS_OUT_INFO_S *pstPqVpssOutInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    //HI_BOOL bMCDIMode               = HI_TRUE;
    /*PQ_SOURCE_MODE_E enSourceMode = PQ_SOURCE_MODE_HD;
    PQ_OUTPUT_MODE_E enOutputMode = PQ_OUTPUT_MODE_HD;*/

    //static HI_BOOL s_bPreMCDIMode   = HI_TRUE;

    /* IFMD */
    //HI_PQ_IFMD_CALC_S      stIfmdCalcInfo;
    //HI_PQ_IFMD_PLAYBACK_S  stIfmdCalcResult = {0};
    /* mcdi & mcnr*/
    //HI_PQ_WBC_INFO_S stVpssWbcInfo = {0};

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqDispInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssWbcReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqVpssOutInfo);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstPqFrameInfo->u32HandleNo, VPSS_HANDLE_NUM);

    /*
    1. copy reg in to reg out
    2. reset enable demoon demomode strength
    3. soft alg & set reg
    */

    PQ_HAL_CopyVpssAlgRegOut((S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssReg), \
                             (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut));

    /* reset vpss customer pq setting */
    s32Ret = DRV_PQ_ResetPqStatusParam(HI_PQ_MODULE_ALL, REG_TYPE_ALL);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam VPSS failed!\n");
    }

    DRV_PQ_RefreshMktCoordinate(REG_TYPE_VDP);


#if 0
    /* step 1 : update all reg */

    PQ_HAL_UpdateVpssReg430(pstPqFrameInfo->u32HandleNo, pstVpssRegInfo->pstVpssReg);

    /*if (HI_NULL != pstWbcReg)
    {
        PQ_HAL_UpdateVpssWbcReg430(pstVpssWbcInfo->u32HandleNo, pstWbcReg);
    }*/

    /* VPSS Deinit send Null to clear reg para */
    /*if ((pstVPSSReg == HI_NULL) || ( pstVpssFrameInfo == HI_NULL))
    {
        return HI_SUCCESS;
    }*/

    g_u32ImageWidth  = pstPqFrameInfo->u32Width;
    g_u32ImageHeight = pstPqFrameInfo->u32Height;
    if (pstPqFrameInfo->u32Width == 0 || pstPqFrameInfo->u32Height == 0)
    {
        HI_ERR_PQ("pstPqFrameInfo W | H is Zero !\n");
        return HI_SUCCESS;
    }

    g_u32OutWidth   = (HI_U32)pstPqDispInfo->stVideo.s32Width;
    g_u32OutHeight  = (HI_U32)pstPqDispInfo->stVideo.s32Height;
    if (g_u32OutWidth == 0 || g_u32OutHeight == 0)
    {
        HI_ERR_PQ("pstPqDispInfo Out W | H is Zero !\n");
        return HI_SUCCESS;
    }

    enSourceMode  = PQ_COMM_CheckSourceMode(pstPqFrameInfo->u32Height);
    PQ_COMM_SetSourceMode(enSourceMode);

    enOutputMode = PQ_COMM_CheckOutputMode(g_u32OutWidth);
    PQ_COMM_SetOutputMode(enOutputMode);
    //drv_pq_SetSceneMode(pstPQModule);

    //enOutputMode = PQ_COMM_GetOutputMode();
    /* Load VPSS Physical Register */
    s32Ret = PQ_TABLE_LoadPhyList(REG_TYPE_VPSS, enSourceMode, enOutputMode, pstPqFrameInfo->u32HandleNo);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_TABLE_LoadPhyList VPSS failed!\n");
        return s32Ret;
    }

#endif

    /*step 2 : update all soft*/

    // mcnr calc
    sg_ulProcAlgStartTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_TNR] = PQ_GetTimeUs();
    if (PQ_FUNC_CALL(HI_PQ_MODULE_TNR, RefreshMcnrCfg))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_TNR)->RefreshMcnrCfg(pstPqFrameInfo, pstVpssRegInfo);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PQ("RefreshMcnrCfg failed!\n");
            return s32Ret;
        }
    }
    sg_ulProcAlgEndTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_TNR] = PQ_GetTimeUs();

    /* dei */
#if 0
    if (PQ_FUNC_CALL(HI_PQ_MODULE_DEI, SetDeiParam))
    {
        stVpssWbcInfo.u32FrameIndex = pstPqFrameInfo->u32FrameIndex;
        stVpssWbcInfo.u32BitDepth  = pstPqFrameInfo->u32BitDepth;
        stVpssWbcInfo.u32Width     = pstPqFrameInfo->u32Width;
        stVpssWbcInfo.u32Height    = pstPqFrameInfo->u32Height;
        stVpssWbcInfo.bProgressive = pstPqFrameInfo->bProgressive;
        stVpssWbcInfo.s32FieldMode = pstPqFrameInfo->s32FieldMode;
        stVpssWbcInfo.bDeiEn = pstPqFrameInfo->bDeiEn;
        stVpssWbcInfo.bMcnrEn = pstPqFrameInfo->bMcnrEn;

        stVpssWbcInfo.pstVpssWbcReg = pstVpssRegInfo->pstVpssWbcReg;

        stVpssWbcInfo.u32Stride = pstPqFrameInfo->u32Stride;

        // 需要看下是传个指针还是把内容copy过去
        stVpssWbcInfo.pRGMV = pstPqFrameInfo->pRGMV;

        stVpssWbcInfo.u32FieldOrder = pstPqFrameInfo->u32FieldOrder;
        stVpssWbcInfo.u32FrameRate = pstPqFrameInfo->u32FrameRate;
        stVpssWbcInfo.bPreInfo = pstPqFrameInfo->bPreInfo;

        memcpy(&stVpssWbcInfo.stVdecInfo, &pstPqFrameInfo->stVdecInfo, sizeof(pstPqFrameInfo->stVdecInfo));

        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DEI)->SetDeiParam(&stVpssWbcInfo, pstVpssRegInfo);
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_FMD, GetMCDIMode))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_FMD)->GetMCDIMode(pstPqFrameInfo->u32HandleNo, &bMCDIMode);

        if (bMCDIMode != s_bPreMCDIMode)
        {
            HI_BOOL bOnOff = stPqParam.bModuleOnOff[HI_PQ_MODULE_DEI] & bMCDIMode;
            s_bPreMCDIMode = bMCDIMode;

            if (PQ_FUNC_CALL(HI_PQ_MODULE_DEI, SetEnable))
            {
                s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DEI)->SetEnable(bOnOff);
            }
        }
    }
#endif

    /* fmd */
    /* Ifmd Para cfg Init again; consumer problem: when scene change, the convergence time of field mode detection too long, need init again */
    sg_ulProcAlgStartTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_FMD] = PQ_GetTimeUs();
    if (PQ_FUNC_CALL(HI_PQ_MODULE_FMD, SofeParaInitByHandle))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_FMD)->SofeParaInitByHandle(pstPqFrameInfo->u32FrameIndex,
                 pstPqFrameInfo->u32HandleNo, pstPqFrameInfo->bInit);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PQ("SofeParaInitByHandle failed!\n");
            return s32Ret;
        }
    }

    /* IFMD  interace */
    if ((HI_FALSE == pstPqFrameInfo->bProgressive) && (PQ_FUNC_CALL(HI_PQ_MODULE_FMD, IfmdDect)))
    {
        /* FMD After Calc Set CFG Reg to Reg */
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_FMD)->IfmdDect(pstPqFrameInfo, pstVpssRegInfo, pstPqVpssOutInfo);
    }
    sg_ulProcAlgEndTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_FMD] = PQ_GetTimeUs();

    /* snr */
    sg_ulProcAlgStartTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_SNR] = PQ_GetTimeUs();
    if (GET_ALG_FUN(HI_PQ_MODULE_SNR)->SetSNRMotionEdgeLut)
    {
        GET_ALG_FUN(HI_PQ_MODULE_SNR)->SetSNRMotionEdgeLut(pstPqFrameInfo, pstVpssRegInfo);
    }
    sg_ulProcAlgEndTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_SNR] = PQ_GetTimeUs();

    /* db dm*/
    if (PQ_FUNC_CALL(HI_PQ_MODULE_DB, RefreshDbCfg))
    {
        /* Refresh DB API CFG */
        sg_ulProcAlgStartTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_DB] = PQ_GetTimeUs();
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DB)->RefreshDbCfg(pstPqFrameInfo, pstVpssRegInfo);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PQ("DB RefreshDbCfg failed!\n");
            return s32Ret;
        }
        sg_ulProcAlgEndTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_DB] = PQ_GetTimeUs();

        /* Refresh DM API CFG */
        sg_ulProcAlgStartTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_DM] = PQ_GetTimeUs();
        if (PQ_FUNC_CALL(HI_PQ_MODULE_DM, RefreshDmCfg))
        {
            s32Ret = GET_ALG_FUN(HI_PQ_MODULE_DM)->RefreshDmCfg(pstPqFrameInfo, pstVpssRegInfo);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PQ("DM RefreshDmCfg failed!\n");
                return s32Ret;
            }
        }
        sg_ulProcAlgEndTime[pstPqFrameInfo->u32HandleNo][HI_PQ_MODULE_DM] = PQ_GetTimeUs();
    }

#if 0
    /* set demo mode*/
    DRV_PQ_SetDemoDispMode(REG_TYPE_VDP, stPqParam.enDemoMode);

    s32Ret = DRV_PQ_ResetPqStatusParam(REG_TYPE_VDP);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("ResetPqStatusParam VDP failed!\n");
    }

    //DRV_PQ_RefreshMktCoordinate(REG_TYPE_VPSS);
#endif
    DRV_PQ_ResetSoftAlgPqStatus(HI_PQ_MODULE_ALL, REG_TYPE_VDP, pstPqFrameInfo, pstVpssRegInfo);

    return s32Ret;
}

#endif

static HI_S32 DRV_PQ_GetFlashPqBin(PQ_PARAM_S *pstPqParam)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PQ_FILE_HEADER_S *pstPqFileHead = HI_NULL;
    HI_U32 u32CheckSize = 0;
    HI_U32 u32CheckPos  = 0;
    HI_U32 u32CheckSum  = 0;
    HI_U32 u32PqLen     = 0;
    HI_U8  *pu8PqAddr   = HI_NULL;
    PDM_EXPORT_FUNC_S   *pstPdmFuncs = HI_NULL;
    PQ_PARAM_S *pstPqBinParam = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqParam);

    memset((HI_VOID *)pstPqParam, 0x0, sizeof(PQ_PARAM_S));

    /* get pq bin from pdm */
    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_PDM, (HI_VOID **)&pstPdmFuncs);

    if (s32Ret != HI_SUCCESS)
    {
        HI_FATAL_PQ("HI_DRV_MODULE_GetFunction failed!\n");
        return HI_FAILURE;
    }

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPdmFuncs);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPdmFuncs->pfnPDM_GetData);

    s32Ret = pstPdmFuncs->pfnPDM_GetData(PQ_DEF_NAME, &pu8PqAddr, &u32PqLen);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PQ("pstPdmFuncs->pfnPDM_GetData fail, PQ bin param may not burned\r\n");
        pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
        return HI_FAILURE;
    }

    if (HI_NULL == pu8PqAddr)
    {
        HI_WARN_PQ("pstPdmFuncs->pfnPDM_GetData get addr is null, PQ bin param may not burned\r\n");
        pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
        return HI_FAILURE;
    }

    pstPqBinParam = (PQ_PARAM_S *)pu8PqAddr;
    pstPqFileHead = &(pstPqBinParam->stPQFileHeader);

    u32CheckPos = (HI_U8 *) & (pstPqBinParam->stPQCoef) - (HI_U8 *)pstPqBinParam;
    u32CheckSize = pstPqFileHead->u32ParamSize;

    if (u32CheckSize != sizeof(PQ_PARAM_S))
    {
        HI_INFO_PQ( "check PQbin size error, Param Size = %d,sizeof(PQ_PARAM_S) = %d\n", u32CheckSize, sizeof(PQ_PARAM_S));
        /* do not release in boot */
#ifndef HI_BUILD_IN_BOOT
        pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
#endif
        return HI_FAILURE;
    }

    if (0 != HI_OSAL_Strncmp(pstPqFileHead->u8Version, PQ_VERSION, strlen(PQ_VERSION)))
    {
        HI_ERR_PQ( "check PQbin Version[%s] error\n", PQ_VERSION);
        /* do not release in boot */
#ifndef HI_BUILD_IN_BOOT
        pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
#endif
        return HI_FAILURE;
    }

    if (HI_SUCCESS != PQ_COMM_CheckChipName(pstPqFileHead->u8ChipName))
    {
        HI_ERR_PQ( "check PQbin ChipName[%s] error\n", pstPqFileHead->u8ChipName);
        /* do not release in boot */
#ifndef HI_BUILD_IN_BOOT
        pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
#endif
        return HI_FAILURE;
    }

    while (u32CheckPos < u32CheckSize)
    {
        u32CheckSum += *(HI_U8 *)(((HI_U8 *)pstPqBinParam) + u32CheckPos);
        u32CheckPos++;
    }

    if (u32CheckSum != pstPqFileHead->u32FileCheckSum)
    {
        HI_ERR_PQ( "PQbin checksum error,declare checksum = %d,calcsum = %d\r\n", pstPqFileHead->u32FileCheckSum, u32CheckSum);
        /* do not release in boot */
#ifndef HI_BUILD_IN_BOOT
        pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
#endif
        return HI_FAILURE;
    }

    memcpy((HI_VOID *)(pstPqParam), (HI_VOID *)pstPqBinParam, sizeof(PQ_PARAM_S));

    /* do not release in boot */
#ifndef HI_BUILD_IN_BOOT
    pstPdmFuncs->pfnPDM_ReleaseReserveMem(PQ_DEF_NAME);
#endif

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetBinPhyAddr(HI_U32 *pu32Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Addr);

    *pu32Addr = g_stPqBinBuf.u32StartPhyAddr;

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetPicSetting(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_DISP_PARAM_S stSDDispParam;
    HI_DISP_PARAM_S stHDDispParam;
    PDM_EXPORT_FUNC_S *pstPdmFuncs = HI_NULL;

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_PDM, (HI_VOID **)&pstPdmFuncs);
    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_PQ("HI_DRV_MODULE_GetFunction failed!\n");
        return HI_FAILURE;
    }

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPdmFuncs);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPdmFuncs->pfnPDM_GetDispParam);

    s32Ret = pstPdmFuncs->pfnPDM_GetDispParam(HI_UNF_DISPLAY0, &stSDDispParam);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PQ("baseparam may not burned\r\n");
        return HI_FAILURE;
    }

    stPqParam.stSDPictureSetting.u16Brightness = stSDDispParam.u32Brightness;
    stPqParam.stSDPictureSetting.u16Contrast   = stSDDispParam.u32Contrast;
    stPqParam.stSDPictureSetting.u16Hue        = stSDDispParam.u32HuePlus;
    stPqParam.stSDPictureSetting.u16Saturation = stSDDispParam.u32Saturation;

    stPqParam.stSDVideoSetting.u16Brightness = LEVEL2NUM(stSDDispParam.u32Brightness);
    stPqParam.stSDVideoSetting.u16Contrast   = LEVEL2NUM(stSDDispParam.u32Contrast);
    stPqParam.stSDVideoSetting.u16Hue        = LEVEL2NUM(stSDDispParam.u32HuePlus);
    stPqParam.stSDVideoSetting.u16Saturation = LEVEL2NUM(stSDDispParam.u32Saturation);

    s32Ret = pstPdmFuncs->pfnPDM_GetDispParam(HI_UNF_DISPLAY1, &stHDDispParam);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PQ("baseparam may not burned\r\n");
        return HI_FAILURE;
    }

    stPqParam.stHDPictureSetting.u16Brightness = stHDDispParam.u32Brightness;
    stPqParam.stHDPictureSetting.u16Contrast   = stHDDispParam.u32Contrast;
    stPqParam.stHDPictureSetting.u16Hue        = stHDDispParam.u32HuePlus;
    stPqParam.stHDPictureSetting.u16Saturation = stHDDispParam.u32Saturation;

    stPqParam.stHDVideoSetting.u16Brightness = LEVEL2NUM(stHDDispParam.u32Brightness);
    stPqParam.stHDVideoSetting.u16Contrast   = LEVEL2NUM(stHDDispParam.u32Contrast);
    stPqParam.stHDVideoSetting.u16Hue        = LEVEL2NUM(stHDDispParam.u32HuePlus);
    stPqParam.stHDVideoSetting.u16Saturation = LEVEL2NUM(stHDDispParam.u32Saturation);

    return HI_SUCCESS;
}

static HI_VOID drv_pq_SetDefaultZmeParam(HI_BOOL bDefault)
{
    if (PQ_FUNC_CALL(HI_PQ_MODULE_ZME, SetZmeDefault))
    {
        GET_ALG_FUN(HI_PQ_MODULE_ZME)->SetZmeDefault(bDefault);
    }

    return;
}

static HI_VOID drv_pq_SetDefaultCSCParam(HI_BOOL bDefault)
{
    HI_PQ_PICTURE_SETTING_S stSDPictureSetting = {50, 50, 50, 50};
    HI_PQ_PICTURE_SETTING_S stHDPictureSetting = {50, 50, 50, 50};
    HI_PQ_PICTURE_SETTING_S stSDVideoSetting   = {128, 128, 128, 128};
    HI_PQ_PICTURE_SETTING_S stHDVideoSetting   = {128, 128, 128, 128};

    if (HI_TRUE == bDefault)
    {
        stSDPictureSetting.u16Brightness = 50;
        stSDPictureSetting.u16Contrast   = 50;
        stSDPictureSetting.u16Hue        = 50;
        stSDPictureSetting.u16Saturation = 50;
        stHDPictureSetting.u16Brightness = 50;
        stHDPictureSetting.u16Contrast   = 50;
        stHDPictureSetting.u16Hue        = 50;
        stHDPictureSetting.u16Saturation = 50;

        stSDVideoSetting.u16Brightness   = 128;
        stSDVideoSetting.u16Contrast     = 128;
        stSDVideoSetting.u16Hue          = 128;
        stSDVideoSetting.u16Saturation   = 128;
        stHDVideoSetting.u16Brightness   = 128;
        stHDVideoSetting.u16Contrast     = 128;
        stHDVideoSetting.u16Hue          = 128;
        stHDVideoSetting.u16Saturation   = 128;
    }
    else
    {
        stSDPictureSetting.u16Brightness = stPqParam.stSDPictureSetting.u16Brightness;
        stSDPictureSetting.u16Contrast   = stPqParam.stSDPictureSetting.u16Contrast;
        stSDPictureSetting.u16Hue        = stPqParam.stSDPictureSetting.u16Hue;
        stSDPictureSetting.u16Saturation = stPqParam.stSDPictureSetting.u16Saturation;
        stHDPictureSetting.u16Brightness = stPqParam.stHDPictureSetting.u16Brightness;
        stHDPictureSetting.u16Contrast   = stPqParam.stHDPictureSetting.u16Contrast;
        stHDPictureSetting.u16Hue        = stPqParam.stHDPictureSetting.u16Hue;
        stHDPictureSetting.u16Saturation = stPqParam.stHDPictureSetting.u16Saturation;

        stSDVideoSetting.u16Brightness   = stPqParam.stSDVideoSetting.u16Brightness;
        stSDVideoSetting.u16Contrast     = stPqParam.stSDVideoSetting.u16Contrast;
        stSDVideoSetting.u16Hue          = stPqParam.stSDVideoSetting.u16Hue;
        stSDVideoSetting.u16Saturation   = stPqParam.stSDVideoSetting.u16Saturation;
        stHDVideoSetting.u16Brightness   = stPqParam.stHDVideoSetting.u16Brightness;
        stHDVideoSetting.u16Contrast     = stPqParam.stHDVideoSetting.u16Contrast;
        stHDVideoSetting.u16Hue          = stPqParam.stHDVideoSetting.u16Hue;
        stHDVideoSetting.u16Saturation   = stPqParam.stHDVideoSetting.u16Saturation ;
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_CSC, SetCSCVideoSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_SD0, &stSDVideoSetting);
        GET_ALG_FUN(HI_PQ_MODULE_CSC)->SetCSCVideoSetting(HI_PQ_DISPLAY_HD1, &stHDVideoSetting);
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXCSC, SetGfxCSCPictureSetting))
    {
        GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_SD0, &stSDPictureSetting);
        GET_ALG_FUN(HI_PQ_MODULE_GFXCSC)->SetGfxCSCPictureSetting(HI_PQ_DISPLAY_HD1, &stHDPictureSetting);
    }

    return;
}

static HI_VOID drv_pq_SetDefaultAlgParam(HI_BOOL bDefault)
{
    HI_U32  u32Alg      = 0;
    HI_BOOL bModuleOn   = HI_FALSE;

    for (u32Alg = 0; u32Alg < HI_PQ_MODULE_BUTT; u32Alg++)
    {
        bModuleOn = (HI_TRUE == bDefault) ? HI_FALSE : stPqParam.bModuleOnOff[u32Alg];
        drv_pq_SetModuleEn(u32Alg, bModuleOn);
    }

    return;
}

HI_S32 DRV_PQ_SetDefaultParam(HI_BOOL bDefault)
{
    drv_pq_SetDefaultZmeParam(bDefault);

    if (sg_bDefaultParam == bDefault)
    {
        return HI_SUCCESS;
    }

    drv_pq_SetDefaultCSCParam(bDefault);
    drv_pq_SetDefaultAlgParam(bDefault);

    sg_bDefaultParam = bDefault;

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetDefaultParam(HI_BOOL *pbDefault)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbDefault);

    *pbDefault = sg_bDefaultParam;

    return HI_SUCCESS;
}


HI_S32 DRV_PQ_SetProcAlgTimeCntEn(HI_BOOL bEnable)
{
    g_bProcAlgTimeCntEn = bEnable;

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetProcAlgTimeCntEn(HI_BOOL *pbEnable)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbEnable);

    *pbEnable = g_bProcAlgTimeCntEn;

    return HI_SUCCESS;
}

HI_S32 DRV_PQ_GetVpssProcAlgTimeCnt(HI_U32 u32Handle, HI_PQ_MODULE_E enPqModule, HI_ULONG *pulVpssAlgTimeCnt)
{
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32Handle, VPSS_HANDLE_NUM);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(enPqModule, HI_PQ_MODULE_ALL);
    PQ_CHECK_NULL_PTR_RE_FAIL(pulVpssAlgTimeCnt);

    sg_ulProcAlgTimeCnt[u32Handle][enPqModule] = abs(sg_ulProcAlgEndTime[u32Handle][enPqModule] - sg_ulProcAlgStartTime[u32Handle][enPqModule]);

    *pulVpssAlgTimeCnt = sg_ulProcAlgTimeCnt[u32Handle][enPqModule];

    return HI_SUCCESS;
}


HI_S32 DRV_PQ_SetGfxZme(HI_PQ_GFX_LAYER_E enGfxZmeLayer, HI_PQ_GFX_ZME_PARA_S *pstGfxZmePara)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enGfxZmeLayer, PQ_GFX_LAYER_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstGfxZmePara);

    if (PQ_FUNC_CALL(HI_PQ_MODULE_GFXZME, SetGfxZme))
    {
        s32Ret = GET_ALG_FUN(HI_PQ_MODULE_GFXZME)->SetGfxZme(enGfxZmeLayer, pstGfxZmePara);
    }

    return s32Ret;
}

MODULE_LICENSE("GPL");

EXPORT_SYMBOL(DRV_PQ_UpdateVdpPQ);
EXPORT_SYMBOL(DRV_PQ_GetCSCCoef);
EXPORT_SYMBOL(DRV_PQ_Get8BitCSCCoef);
EXPORT_SYMBOL(DRV_PQ_GetHDPictureSetting);
EXPORT_SYMBOL(DRV_PQ_GetSDPictureSetting);
EXPORT_SYMBOL(DRV_PQ_SetHDPictureSetting);
EXPORT_SYMBOL(DRV_PQ_SetSDPictureSetting);
EXPORT_SYMBOL(DRV_PQ_GetHDVideoSetting);
EXPORT_SYMBOL(DRV_PQ_GetSDVideoSetting);
EXPORT_SYMBOL(DRV_PQ_SetHDVideoSetting);
EXPORT_SYMBOL(DRV_PQ_SetSDVideoSetting);
EXPORT_SYMBOL(DRV_PQ_GetVdpZmeStrategy);
EXPORT_SYMBOL(DRV_PQ_SetGfxZme);
EXPORT_SYMBOL(DRV_PQ_SetGfxCscCoef);
EXPORT_SYMBOL(DRV_PQ_SetDefaultParam);
EXPORT_SYMBOL(DRV_PQ_InitVpssAlgCfg);
EXPORT_SYMBOL(DRV_PQ_InitVdpAlgCfg);
EXPORT_SYMBOL(DRV_PQ_GetVpssAlgCfg);
EXPORT_SYMBOL(DRV_PQ_UpdateVdpOnlinePQ);

