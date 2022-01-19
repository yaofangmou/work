/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name         : hifb_main_k.c
Version           : Initial Draft
Author            :
Created           : 2018/01/01
Description       :
Function List     :
History           :
Date                          Author                   Modification
2018/01/01                    sdk                      Created file
************************************************************************************************/


/*********************************add include here**********************************************/
#include "drv_pdm_ext.h"

#include "drv_hifb_config.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_debug.h"
#include "drv_hifb_ut.h"

/***************************** Macro Definition ************************************************/
#define HIFB_NAME               "HI_FB"

#define HIFB_DISPCHN_HD         1
#define HIFB_DISPCHN_SD         0
/*************************** Structure Definition **********************************************/

/********************** Global Variable declaration ********************************************/
static volatile HI_U32 *g_u32Gp0LogoCtrlReg = NULL;
static volatile HI_U32 *g_u32HDLogoCtrlReg  = NULL;

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
static volatile HI_U32 *g_u32SDLogoCtrlReg = NULL;
static volatile HI_U32 *g_u32SDCtrlReg     = NULL;
static volatile HI_U32 *g_u32WBCCtrlReg    = NULL;
#endif

static HI_BOOL gs_bLogoOff                 = HI_FALSE;

extern HIFB_DRV_OPS_S g_stDrvAdpCallBackFunction;

/******************************* API declaration ***********************************************/

extern HI_VOID DRV_HIFB_ADP_RegistAdpFunction(HIFB_EXPORT_UT_FUNC_S *RegistAdpFunction);

/******************************* API release ***************************************************/

/***************************************************************************************
* func          : HifbSetLogoLayerEnable
* description   : CNcomment: logo图层使能，在这里是关logo使用 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID HifbSetLogoLayerEnable(HI_BOOL bEnable)
{
    PDM_EXPORT_FUNC_S *ps_PdmExportFuncs = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (gs_bLogoOff)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(g_u32Gp0LogoCtrlReg);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(g_u32HDLogoCtrlReg);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(g_u32SDLogoCtrlReg);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(g_u32SDCtrlReg);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(g_u32WBCCtrlReg);
#endif

    *g_u32Gp0LogoCtrlReg &= ~(0x1 << 31);
    *g_u32HDLogoCtrlReg  &= ~(0x1 << 31);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    *g_u32SDLogoCtrlReg &= ~(0x1 << 31);
    *g_u32SDCtrlReg     &= ~(0x1 << 31);
    *g_u32WBCCtrlReg    &= ~(0x1 << 31);
#endif

    *(g_u32Gp0LogoCtrlReg + 1) = 0x1;
    *(g_u32HDLogoCtrlReg + 1)  = 0x1;

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    *(g_u32SDLogoCtrlReg + 1) = 0x1;
    *(g_u32SDCtrlReg + 1)     = 0x1;
#endif

    gs_bLogoOff = HI_TRUE;

    msleep(40);

    if (HI_SUCCESS != HI_DRV_MODULE_GetFunction(HI_ID_PDM, (HI_VOID**)&ps_PdmExportFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get pdm func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if ((NULL != ps_PdmExportFuncs) && (NULL != ps_PdmExportFuncs->pfnPDM_ReleaseReserveMem))
    {
        ps_PdmExportFuncs->pfnPDM_ReleaseReserveMem(DISPLAY_BUFFER_HD);
        ps_PdmExportFuncs->pfnPDM_ReleaseReserveMem(HIFB_ZME_COEF_BUFFER);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
        ps_PdmExportFuncs->pfnPDM_ReleaseReserveMem(DISPLAY_BUFFER_SD);
        ps_PdmExportFuncs->pfnPDM_ReleaseReserveMem(HIFB_WBC_BUFFER);
#endif
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_VOID DRV_HIFB_SetLogoEnable(HI_BOOL bEnable)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HifbSetLogoLayerEnable(bEnable);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetGPMask(HIFB_LAYER_HD_0, HI_FALSE);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetGPMask(HIFB_LAYER_SD_0, HI_FALSE);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : s_HifbExportFuncs
* description   : CNcomment: 向外注册函数给其它模块调用 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HIFB_EXPORT_UT_FUNC_S s_HifbExportFuncs =
{
    .pfnHifbModInit            = HIFB_DRV_ModInit,
    .pfnHifbModExit            = HIFB_DRV_ModExit,
    .pfnHifbGetSettingInfo     = HIFB_DRV_GetSettingInfo,
    .pfnHifbSetLogoLayerEnable = DRV_HIFB_SetLogoEnable,
};

HI_S32 DRV_HIFB_ModInit_K(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;

    g_u32Gp0LogoCtrlReg = (HI_U32*)ioremap_nocache(CONFIG_HIFB_GP0_REG_BASEADDR,        8);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_u32Gp0LogoCtrlReg, HI_FAILURE);

    g_u32HDLogoCtrlReg  = (HI_U32*)ioremap_nocache(CONFIG_HIFB_HD0_REG_BASEADDR,        8);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_u32HDLogoCtrlReg, HI_FAILURE);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    g_u32SDLogoCtrlReg  = (HI_U32*)ioremap_nocache(CONFIG_HIFB_SD_LOGO_REG_BASEADDR,    8);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_u32SDLogoCtrlReg, HI_FAILURE);

    g_u32SDCtrlReg      = (HI_U32*)ioremap_nocache(CONFIG_HIFB_WBC_SLAYER_REG_BASEADDR, 8);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_u32SDCtrlReg, HI_FAILURE);

    g_u32WBCCtrlReg     = (HI_U32*)ioremap_nocache(CONFIG_HIFB_WBC_GP0_REG_BASEADDR,    8);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_u32WBCCtrlReg, HI_FAILURE);
#endif

    DRV_HIFB_ADP_RegistAdpFunction(&s_HifbExportFuncs);

    Ret = HI_GFX_MODULE_Register(HIGFX_FB_ID, HIFB_NAME, &s_HifbExportFuncs);
    if (HI_SUCCESS != Ret)
    {
        DRV_HIFB_ModExit_K();
        return Ret;
    }

    return HI_SUCCESS;
}

HI_VOID DRV_HIFB_ModExit_K(HI_VOID)
{
    HI_GFX_MODULE_UnRegister(HIGFX_FB_ID);

    if (NULL != g_u32Gp0LogoCtrlReg) { iounmap(g_u32Gp0LogoCtrlReg); g_u32Gp0LogoCtrlReg = NULL; }
    if (NULL != g_u32HDLogoCtrlReg)  { iounmap(g_u32HDLogoCtrlReg);  g_u32HDLogoCtrlReg = NULL;  }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if (NULL != g_u32SDLogoCtrlReg)  { iounmap(g_u32SDLogoCtrlReg);  g_u32SDLogoCtrlReg = NULL;  }
    if (NULL != g_u32SDCtrlReg)      { iounmap(g_u32SDCtrlReg);      g_u32SDCtrlReg = NULL;      }
    if (NULL != g_u32WBCCtrlReg)     { iounmap(g_u32WBCCtrlReg);     g_u32WBCCtrlReg = NULL;     }
#endif

    return;
}
