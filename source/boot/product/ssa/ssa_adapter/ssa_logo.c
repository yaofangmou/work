/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_logo.c
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-08-30
  Description   :
  History       :
  1.Date        : 2018-08-30
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#include "hi_drv_pdm.h"
#include "hi_drv_pq.h"
#include "hi_boot_adp.h"
#include "hi_boot_logo.h"

#include "loader_debug.h"
#include "loader_flash.h"
#include "loader_osal.h"

#include "ssa_utiliy.h"
#include "ssa_logo.h"

#ifdef HI_MINIBOOT_SUPPORT
#ifdef reserve_mem_alloc
#undef reserve_mem_alloc
#endif
#include "app.h"
#endif

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/


/*************************** Structure Definition *****************************/

/*************************** API Declaration **********************************/

#ifndef HI_MINIBOOT_SUPPORT
extern void *reserve_mem_alloc(unsigned int size, unsigned int *allocsize);
#endif

static HI_S32 loadBaseParam(HI_U32 *pu32BaseAddress, HI_U32 *pu32BaseLength)
{
    HI_U32 u32DataSize = 0;
    HI_U32 u32AllocSize = 0;
    HI_U32 u32BaseRamAddress = 0;
    LOADER_FLASH_OPENPARAM_S stDataParam;
    LOADER_FLASH_INFO_S stFlashInfo;
    HI_HANDLE hFlashHandle = HI_INVALID_HANDLE;
    HI_S32 s32Ret = HI_SUCCESS;

    LOADER_FuncEnter();

    LOADER_MemSet(&stDataParam, 0x00, sizeof(stDataParam));
    stDataParam.pcPartitionName = PDM_BASE_DEF_NAME;
    stDataParam.enFlashType     = HI_FLASH_TYPE_BUTT;

    hFlashHandle = LOADER_FLASH_Open(&stDataParam);
    if (HI_INVALID_HANDLE == hFlashHandle)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_Open, LOADER_ERR_FLASH);
        return LOADER_ERR_FLASH;
    }

    LOADER_MemSet(&stFlashInfo, 0x00, sizeof(stFlashInfo));
    s32Ret = LOADER_FLASH_GetInfo(hFlashHandle, &stFlashInfo);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_GetInfo, s32Ret);
        LOADER_FLASH_Close(hFlashHandle);
        return s32Ret;
    }

    u32BaseRamAddress = (HI_U32)reserve_mem_alloc(stFlashInfo.u64PartSize, &u32AllocSize);

    u32DataSize = LOADER_FLASH_Read(hFlashHandle, 0ULL, (HI_U8*)u32BaseRamAddress, u32AllocSize, u32AllocSize);
    if (u32DataSize <  u32AllocSize)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_Read, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    if ((*(HI_U32 *)(u32BaseRamAddress + 4)) > MCE_DEF_BASEPARAM_SIZE)
    {
        LOADER_Print32Hex((*(HI_U32 *)(u32BaseRamAddress + 4)));
        return LOADER_ERR_ILLEGAL_IMAGE;
    }

    LOADER_FLASH_Close(hFlashHandle);
    hFlashHandle = HI_NULL_PTR;

    *pu32BaseAddress = u32BaseRamAddress;
    *pu32BaseLength = (*(HI_U32 *)(u32BaseRamAddress + 4));

    LOADER_FuncExit();
    return HI_SUCCESS;

}

static HI_S32 setPDMSource(PLoadLogoFunc pfunc)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32LogoAddress = 0;
    HI_U32 u32BaseAddress = 0;
    HI_U32 u32LogoLength  = 0;
    HI_U32 u32BaseLength  = 0;
    HI_PDM_MEMINFO_S stPDMMemInfo;

    LOADER_FuncEnter();

    s32Ret = pfunc(&u32LogoAddress, &u32LogoLength);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(pfunc, s32Ret);
        return s32Ret;
    }

    s32Ret = loadBaseParam(&u32BaseAddress, &u32BaseLength);
    if (HI_SUCCESS !=  s32Ret)
    {
        LOADER_PrintFuncErr(loadBaseParam, s32Ret);
        return s32Ret;
    }

    LOADER_MemSet(&stPDMMemInfo, 0x00, sizeof(stPDMMemInfo));
    stPDMMemInfo.u32BaseAddr = u32BaseAddress;
    stPDMMemInfo.u32LogoAddr = u32LogoAddress;

    s32Ret = HI_DRV_PDM_SetSource(HI_PDM_SRCTYPE_DDR, &stPDMMemInfo);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_SetSource, s32Ret);
        return s32Ret;
    }

    LOADER_FuncExit();

    return HI_SUCCESS;
}

static HI_S32 showLogo(HI_VOID)
{
    HI_U32 u32LogoDataAddr = 0;

    HI_BASE_GFX_LOGO_INFO stLogoInfo;
    HI_LOGO_PARAM_S stLogoParam;
    HI_DISP_PARAM_S stDispParam0;
    HI_DISP_PARAM_S stDispParam1;

    HI_S32 s32Ret = HI_SUCCESS;

    LOADER_FuncEnter();

    s32Ret = HI_DRV_PDM_GetLogoParam(&stLogoParam);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetLogoParam, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    if (1 != stLogoParam.u32CheckFlag)
    {
        LOADER_FuncExit();
        return HI_SUCCESS;
    }

    s32Ret = HI_ADP_DispInit();
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_ADP_DispInit, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    LOADER_MemSet(&stDispParam0, 0x00, sizeof(stDispParam0));
    s32Ret = HI_DRV_PDM_GetDispParam(HI_UNF_DISPLAY0, &stDispParam0);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetDispParam, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    LOADER_MemSet(&stDispParam1, 0x00, sizeof(stDispParam1));
    s32Ret = HI_DRV_PDM_GetDispParam(HI_UNF_DISPLAY1, &stDispParam1);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetDispParam, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    HI_PQ_Init(HI_TRUE, &stDispParam0, &stDispParam1);

/** Avoid HDMI PHY Invalid problem
    The following code is valid only for the following chips
    Please do not delete, If there is any need to modify, Please confirm with the release manager. */
#if defined(CHIP_TYPE_hi3798mv100)  \
    || defined(CHIP_TYPE_hi3796mv100)  \
    || defined(CHIP_TYPE_hi3716mv410)  \
    || defined(CHIP_TYPE_hi3716mv420)  \

    if ((HI_UNF_DISP_INTF_TYPE_HDMI == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].enIntfType)
        && (HI_UNF_HDMI_ID_0 == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].unIntf.enHdmi))
    {
        LOADER_CHECK(HI_UNF_HDMI_Init());
        LOADER_CHECK(HI_UNF_HDMI_Open(HI_UNF_HDMI_ID_0, stDispParam1.enFormat));
    }
#endif

    s32Ret = HI_DRV_PDM_GetLogoData(stLogoParam.u32LogoLen, &u32LogoDataAddr);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetLogoData, s32Ret);
        return s32Ret;
    }

    LOADER_MemSet(&stLogoInfo, 0x00, sizeof(stLogoInfo));
    stLogoInfo.DispToSD      = (HI_UNF_DISPLAY1 != stDispParam0.enSrcDisp) ? HI_TRUE : HI_FALSE;
    stLogoInfo.LogoDataLen   = stLogoParam.u32LogoLen;
    stLogoInfo.LogoDataBuf   = u32LogoDataAddr;

    stLogoInfo.DispColorFmt[CONFIG_GFX_DISP_LOGO_SD]         = stDispParam0.enPixelFormat;
    stLogoInfo.DispVirtScreenWidth[CONFIG_GFX_DISP_LOGO_SD]  = stDispParam0.u32VirtScreenWidth;
    stLogoInfo.DispVirtScreenHeight[CONFIG_GFX_DISP_LOGO_SD] = stDispParam0.u32VirtScreenHeight;

    stLogoInfo.DispColorFmt[CONFIG_GFX_DISP_LOGO_HD]         = stDispParam1.enPixelFormat;
    stLogoInfo.DispVirtScreenWidth[CONFIG_GFX_DISP_LOGO_HD]  = stDispParam1.u32VirtScreenWidth;
    stLogoInfo.DispVirtScreenHeight[CONFIG_GFX_DISP_LOGO_HD] = stDispParam1.u32VirtScreenHeight;

    s32Ret = HI_GFX_ShowLogo(&stLogoInfo);
    if (HI_SUCCESS != s32Ret)
    {
        (HI_VOID)HI_DRV_PDM_ReleaseLogoData(u32LogoDataAddr);
        LOADER_PrintFuncErr(HI_GFX_ShowLogo, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }
    (HI_VOID)HI_DRV_PDM_ReleaseLogoData(u32LogoDataAddr);

/** Avoid HDMI PHY Invalid problem
    The following code is valid only for the following chips
    Please do not delete, If there is any need to modify, Please confirm with the release manager. */
#if defined(CHIP_TYPE_hi3798mv100)  \
    || defined(CHIP_TYPE_hi3796mv100)  \
    || defined(CHIP_TYPE_hi3716mv410)  \
    || defined(CHIP_TYPE_hi3716mv420)  \

    if ((HI_UNF_DISP_INTF_TYPE_HDMI == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].enIntfType)
        && (HI_UNF_HDMI_ID_0 == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].unIntf.enHdmi))
    {
        LOADER_CHECK(HI_UNF_HDMI_Open(HI_UNF_HDMI_ID_0, stDispParam1.enFormat));
    }
#endif

    LOADER_FuncExit();
    return HI_SUCCESS;
}


HI_S32 SSA_ShowLogo(PLoadLogoFunc pfunc)
{
    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

    if (HI_NULL != pfunc)
    {
        s32Ret = setPDMSource(pfunc);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(setPDMSource, s32Ret);
            return s32Ret;
        }
    }

    s32Ret = showLogo();
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(showLogo, s32Ret);
        return s32Ret;
    }

    LOADER_FuncExit();

    return HI_SUCCESS;
}


#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */

