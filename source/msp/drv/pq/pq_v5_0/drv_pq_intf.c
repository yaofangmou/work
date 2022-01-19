/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : drv_pq_intf.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2014/04/01
  Author      : sdk
******************************************************************************/
#include "drv_pq.h"
#include "hi_drv_dev.h"
#include "drv_pq_define.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

DEFINE_SEMAPHORE(g_stPQSemaphore);

extern HI_S32  DRV_PQ_Suspend(PM_BASEDEV_S *pdev, pm_message_t state);
extern HI_S32  DRV_PQ_Resume(PM_BASEDEV_S *pdev);

static HI_S32 PQ_Open(struct inode *node, struct file *filp)
{
    return HI_SUCCESS;
}

static HI_S32 PQ_Close(struct inode *node, struct file *filp)
{
    return HI_SUCCESS;
}

#ifdef PQ_ALG_TOOLS
static HI_S32 u32PQIoctl_S_Register(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_REGISTER_S *pstReg;

    pstReg = (HI_PQ_REGISTER_S *)arg;
    s32Ret = PQ_TOOLS_SetRegister(pstReg);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_Register(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_REGISTER_S *pstReg;

    pstReg = (HI_PQ_REGISTER_S *)arg;
    s32Ret = PQ_TOOLS_GetRegister(pstReg);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_BinPhyAddr(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 *pu32Addr;

    pu32Addr = (HI_U32 *)arg;
    s32Ret = PQ_TOOLS_GetBinPhyAddr(pu32Addr);

    return s32Ret;
}
#endif

#ifdef PQ_ALG_ACM
static HI_S32 u32PQIoctl_S_ACM_LUMA(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_ACM_LUT_S *pstAttr;
    pstAttr = (HI_PQ_ACM_LUT_S *)arg;

    s32Ret = PQ_MNG_SetAcmLuma(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_ACM_LUMA(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_COLOR_LUT_S *pstAttr;
    pstAttr = (HI_PQ_COLOR_LUT_S *)arg;

    s32Ret = PQ_MNG_GetACMLumaTbl(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_ACM_HUE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_ACM_LUT_S *pstAttr;
    pstAttr = (HI_PQ_ACM_LUT_S *)arg;

    s32Ret = PQ_MNG_SetAcmHue(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_ACM_HUE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_COLOR_LUT_S *pstAttr;
    pstAttr = (HI_PQ_COLOR_LUT_S *)arg;

    s32Ret = PQ_MNG_GetACMHueTbl(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_ACM_SAT(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_ACM_LUT_S *pstAttr;
    pstAttr = (HI_PQ_ACM_LUT_S *)arg;

    s32Ret = PQ_MNG_SetAcmSat(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_ACM_SAT(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_COLOR_LUT_S *pstAttr;
    pstAttr = (HI_PQ_COLOR_LUT_S *)arg;

    s32Ret = PQ_MNG_GetACMSatTbl(pstAttr);

    return s32Ret;
}
#endif

#ifdef PQ_ALG_LCACM
static HI_S32 u32PQIoctl_S_LCACM_OFFSET(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_LCACM_OFFSET_S *pstAttr;
    pstAttr = (HI_PQ_LCACM_OFFSET_S *)arg;

    s32Ret = PQ_MNG_SetToolLcacmOffset(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_LCACM_OFFSET(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_LCACM_OFFSET_S *pstAttr;
    pstAttr = (HI_PQ_LCACM_OFFSET_S *)arg;

    s32Ret = PQ_MNG_GetToolLcacmOffset(pstAttr);

    return s32Ret;
}

#endif


#ifdef PQ_ALG_ACC
static HI_S32 u32PQIoctl_S_ACC_LUT(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_ACC_LUT_S *pstAttr;
    pstAttr = (PQ_ACC_LUT_S *)arg;
    s32Ret = PQ_MNG_SetToolACCLut(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_ACC_LUT(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_ACC_LUT_S *pstAttr;

    pstAttr = (PQ_ACC_LUT_S *)arg;
    s32Ret = PQ_MNG_GetToolACCLut(pstAttr);

    return s32Ret;
}
#endif

static HI_S32 u32PQIoctl_S_DCI_LEVEL(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetDCILevel(u32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_DCI_LEVEL(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *) arg;
    s32Ret = DRV_PQ_GetDCILevel(pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SD_BRIGHTNESS(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetBrightness(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SD_BRIGHTNESS(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetBrightness(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SD_CONTRAST(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetContrast(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SD_CONTRAST(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetContrast(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SD_SATURATION(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetSaturation(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SD_SATURATION(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetSaturation(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SD_HUE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetHue(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SD_HUE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_SD0;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetHue(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_HD_BRIGHTNESS(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetBrightness(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_HD_BRIGHTNESS(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetBrightness(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_HD_CONTRAST(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetContrast(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_HD_CONTRAST(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetContrast(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_HD_SATURATION(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetSaturation(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_HD_SATURATION(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetSaturation(enPqDisplay, pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_HD_HUE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetHue(enPqDisplay, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_HD_HUE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    HI_PQ_DISPLAY_E enPqDisplay = HI_PQ_DISPLAY_HD1;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetHue(enPqDisplay, pu32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_SR_DEMO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    return HI_SUCCESS;
}
static HI_S32 u32PQIoctl_G_SR_DEMO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    return HI_SUCCESS;
}

static HI_S32 u32PQIoctl_S_TNR(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetTnrLevel(u32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_TNR(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetTnrLevel(pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SNR(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetSnrLevel(u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SNR(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetSnrLevel(pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_DB(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetDbLevel(u32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_DB(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetDbLevel(pu32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_DM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetDmLevel(u32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_DM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetDmLevel(pu32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_SHARPNESS(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetSharpness(u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SHARPNESS(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetSharpness(pu32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_FLESHTONE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetFleshToneLevel(u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_FLESHTONE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetFleshToneLevel(pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SIXBASECOLOR(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_SIX_BASE_COLOR_S *pstAttr;

    pstAttr = (HI_PQ_SIX_BASE_COLOR_S *)arg;
    s32Ret = DRV_PQ_SetSixBaseColorLevel(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_SIXBASECOLOR(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_PQ_SIX_BASE_COLOR_S *pstAttr;
    pstAttr = (HI_PQ_SIX_BASE_COLOR_S *)arg;

    s32Ret = DRV_PQ_GetSixBaseColorLevel(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_COLOR_ENHANCE_MODE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret = DRV_PQ_SetColorEnhanceMode(u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_COLOR_ENHANCE_MODE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetColorEnhanceMode(pu32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_MODULE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_MODULE_S *pstAttr;
    pstAttr = (HI_PQ_MODULE_S *)arg;

    s32Ret = DRV_PQ_SetPQModule(pstAttr->enModule, pstAttr->u32OnOff);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_MODULE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_MODULE_S *pstAttr;
    pstAttr = (HI_PQ_MODULE_S *)arg;

    s32Ret = DRV_PQ_GetPQModule(pstAttr->enModule, &(pstAttr->u32OnOff));

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_DEMO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_DEMO_S *pstAttr;
    pstAttr = (HI_PQ_DEMO_S *)arg;

    s32Ret = DRV_PQ_SetDemoMode(pstAttr->enModule, pstAttr->bOnOff);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_GRAPH_SD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_SetSDPictureSetting(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_GRAPH_SD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_GetSDPictureSetting(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_GRAPH_HD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_SetHDPictureSetting(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_GRAPH_HD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_GetHDPictureSetting(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_VIDEO_SD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_SetSDVideoSetting(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_VIDEO_SD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_GetSDVideoSetting(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_VIDEO_HD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_SetHDVideoSetting(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_VIDEO_HD_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_PICTURE_SETTING_S *pstAttr;
    pstAttr = (HI_PQ_PICTURE_SETTING_S *)arg;

    s32Ret = DRV_PQ_GetHDVideoSetting(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_SD_TEMPERATURE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_COLORTEMPERATURE_S *pstAttr;
    pstAttr = (HI_PQ_COLORTEMPERATURE_S *)arg;

    s32Ret = DRV_PQ_SetSDTemperature(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_SD_TEMPERATURE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_COLORTEMPERATURE_S *pstAttr;
    pstAttr = (HI_PQ_COLORTEMPERATURE_S *)arg;

    s32Ret = DRV_PQ_GetSDTemperature(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_HD_TEMPERATURE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_COLORTEMPERATURE_S *pstAttr;
    pstAttr = (HI_PQ_COLORTEMPERATURE_S *)arg;

    s32Ret = DRV_PQ_SetHDTemperature(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_HD_TEMPERATURE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_COLORTEMPERATURE_S *pstAttr;
    pstAttr = (HI_PQ_COLORTEMPERATURE_S *)arg;

    s32Ret = DRV_PQ_GetHDTemperature(pstAttr);

    return s32Ret;
}

#ifdef PQ_ALG_ZME
static HI_S32 u32PQIoctl_S_ZME_VID_430_SEL(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_ZME_VID_COEF_SEL_S *pstAttr;
    pstAttr = (HI_PQ_ZME_VID_COEF_SEL_S *)arg;

    s32Ret = PQ_MNG_SetToolZmeVidCoefSel(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_ZME_VID_430_SEL(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_ZME_VID_COEF_SEL_S *pstAttr;

    pstAttr = (HI_PQ_ZME_VID_COEF_SEL_S *)arg;
    s32Ret = PQ_MNG_GetToolZmeVidCoefSel(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_ZME_WBC_430_SEL(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_ZME_WBC_COEF_SEL_S *pstAttr;
    pstAttr = (HI_PQ_ZME_WBC_COEF_SEL_S *)arg;

    s32Ret = PQ_MNG_SetToolZmeWBCCoefSel(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_ZME_WBC_430_SEL(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_ZME_WBC_COEF_SEL_S *pstAttr;

    pstAttr = (HI_PQ_ZME_WBC_COEF_SEL_S *)arg;
    s32Ret = PQ_MNG_GetToolZmeWBCCoefSel(pstAttr);

    return s32Ret;
}
#endif

#ifdef PQ_ALG_SNR
static HI_S32 u32PQIoctl_S_SNR_MOTION_LUT(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_SNR_MOTIONEDGE_LUT_S *pstAttr;
    pstAttr = (HI_PQ_SNR_MOTIONEDGE_LUT_S *)arg;

    s32Ret = PQ_MNG_SetToolSnrMotiongLut(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_SNR_MOTION_LUT(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_SNR_MOTIONEDGE_LUT_S *pstAttr;

    pstAttr = (HI_PQ_SNR_MOTIONEDGE_LUT_S *)arg;
    s32Ret = PQ_MNG_GetToolSnrMotiongLut(pstAttr);

    return s32Ret;
}
#endif
#if defined(CHIP_TYPE_hi3798cv200)
#ifdef PQ_ALG_TNR
static HI_S32 u32PQIoctl_S_TNR_Y_PIXMEAN_2_RATIO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;
    pstAttr = (TNR_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrYMotionPixMeanRatio(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_G_TNR_Y_PIXMEAN_2_RATIO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;

    pstAttr = (TNR_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrYMotionPixMeanRatio(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_TNR_C_PIXMEAN_2_RATIO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;
    pstAttr = (TNR_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrCMotionPixMeanRatio(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_TNR_C_PIXMEAN_2_RATIO(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;

    pstAttr = (TNR_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrCMotionPixMeanRatio(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_TNR_Y_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;
    pstAttr = (TNR_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrYMotionMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_TNR_Y_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;

    pstAttr = (TNR_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrYMotionMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_TNR_C_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;
    pstAttr = (TNR_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrCMotionMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_TNR_C_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;

    pstAttr = (TNR_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrCMotionMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_TNR_Y_FINAL_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;
    pstAttr = (TNR_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrFnlMotionYMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_TNR_Y_FINAL_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;

    pstAttr = (TNR_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrFnlMotionYMapping(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_TNR_C_FINAL_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;
    pstAttr = (TNR_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrFnlMotionCMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_TNR_C_FINAL_MOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_MAPPING_S *pstAttr;

    pstAttr = (TNR_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrFnlMotionCMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_TNR_FMOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_FMOTION_MAPPING_S *pstAttr;
    pstAttr = (TNR_FMOTION_MAPPING_S *)arg;

    s32Ret = PQ_MNG_SetTnrFmotionMapping(pstAttr);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_TNR_FMOTION_MAPPING(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    TNR_FMOTION_MAPPING_S *pstAttr;

    pstAttr = (TNR_FMOTION_MAPPING_S *)arg;
    s32Ret = PQ_MNG_GetTnrFmotionMapping(pstAttr);

    return s32Ret;
}
#endif
#endif

static HI_S32 u32PQIoctl_S_IMAGE_MODE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 enMode;
    enMode = *(HI_PQ_IMAGE_MODE_E *)arg;
    s32Ret = DRV_PQ_SetImageMode(enMode);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_IMAGE_MODE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PQ_IMAGE_MODE_E *pstAttr;
    pstAttr = (HI_PQ_IMAGE_MODE_E *)arg;
    s32Ret = DRV_PQ_GetImageMode(pstAttr);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_DEMO_MODE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret  = DRV_PQ_SetDemoDispMode(REG_TYPE_VPSS, u32Level);
    s32Ret |= DRV_PQ_SetDemoDispMode(REG_TYPE_VDP, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_DEMO_MODE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetDemoDispMode(pu32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_S_DEMO_COORDINATE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 u32Level;

    u32Level = *(HI_U32 *)arg;
    s32Ret  = DRV_PQ_SetDemoCoordinate(REG_TYPE_VPSS, u32Level);
    s32Ret |= DRV_PQ_SetDemoCoordinate(REG_TYPE_VDP, u32Level);

    return s32Ret;
}
static HI_S32 u32PQIoctl_G_DEMO_COORDINATE(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_U32 *pu32Level;

    pu32Level = (HI_U32 *)arg;
    s32Ret = DRV_PQ_GetDemoCoordinate(pu32Level);

    return s32Ret;
}

static HI_S32 u32PQIoctl_S_DEFAULT_PARAM(struct inode *inode, struct file *filp, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_BOOL bDefault;

    bDefault = *(HI_BOOL *)arg;
    s32Ret = DRV_PQ_SetDefaultParam(bDefault);

    return s32Ret;
}

/*PQ 命令实现结构*/
typedef struct hiPQ_IOCTRL_CMD_FUN_S
{
    unsigned int cmd;
    HI_S32 (*pfIoctrlCmdFunction)(struct inode *inode, struct file *filp, HI_VOID *arg); /*PQ CMD对应的实现函数*/
} PQ_IOCTRL_CMD_FUN_S;

/*PQ IOCTRL CMD对应实现函数结构*/
PQ_IOCTRL_CMD_FUN_S stPQIoctrlCmdFunction[] =
{
#ifdef PQ_ALG_TOOLS
    {HIIOC_PQ_S_REGISTER,   u32PQIoctl_S_Register},
    {HIIOC_PQ_G_REGISTER,   u32PQIoctl_G_Register},
    {HIIOC_PQ_G_BIN_ADDR,   u32PQIoctl_G_BinPhyAddr},
#endif
#ifdef PQ_ALG_ACM
    {HIIOC_PQ_S_ACM_LUMA,   u32PQIoctl_S_ACM_LUMA},
    {HIIOC_PQ_S_ACM_LUMA,   u32PQIoctl_G_ACM_LUMA},
    {HIIOC_PQ_S_ACM_HUE,    u32PQIoctl_S_ACM_HUE},
    {HIIOC_PQ_G_ACM_HUE,    u32PQIoctl_G_ACM_HUE},
    {HIIOC_PQ_S_ACM_SAT,    u32PQIoctl_S_ACM_SAT},
    {HIIOC_PQ_G_ACM_SAT,    u32PQIoctl_G_ACM_SAT},
#endif

#ifdef PQ_ALG_LCACM
    {HIIOC_PQ_S_LCACM_OFFSET,   u32PQIoctl_S_LCACM_OFFSET},
    {HIIOC_PQ_G_LCACM_OFFSET,   u32PQIoctl_G_LCACM_OFFSET},
#endif

#ifdef PQ_ALG_ACC
    {HIIOC_PQ_S_ACC_LUT,    u32PQIoctl_S_ACC_LUT},
    {HIIOC_PQ_G_ACC_LUT,    u32PQIoctl_G_ACC_LUT},
#endif
    {HIIOC_PQ_S_DCI_LEVEL,      u32PQIoctl_S_DCI_LEVEL},
    {HIIOC_PQ_G_DCI_LEVEL,      u32PQIoctl_G_DCI_LEVEL},
    {HIIOC_PQ_S_SD_BRIGHTNESS,  u32PQIoctl_S_SD_BRIGHTNESS},
    {HIIOC_PQ_G_SD_BRIGHTNESS,  u32PQIoctl_G_SD_BRIGHTNESS},
    {HIIOC_PQ_S_SD_CONTRAST,    u32PQIoctl_S_SD_CONTRAST},
    {HIIOC_PQ_G_SD_CONTRAST,    u32PQIoctl_G_SD_CONTRAST},
    {HIIOC_PQ_S_SD_SATURATION,  u32PQIoctl_S_SD_SATURATION},
    {HIIOC_PQ_G_SD_SATURATION,  u32PQIoctl_G_SD_SATURATION},
    {HIIOC_PQ_S_SD_HUE,         u32PQIoctl_S_SD_HUE},
    {HIIOC_PQ_G_SD_HUE,         u32PQIoctl_G_SD_HUE},
    {HIIOC_PQ_S_HD_BRIGHTNESS,  u32PQIoctl_S_HD_BRIGHTNESS},
    {HIIOC_PQ_G_HD_BRIGHTNESS,  u32PQIoctl_G_HD_BRIGHTNESS},
    {HIIOC_PQ_S_HD_CONTRAST,    u32PQIoctl_S_HD_CONTRAST},
    {HIIOC_PQ_G_HD_CONTRAST,    u32PQIoctl_G_HD_CONTRAST},
    {HIIOC_PQ_S_HD_SATURATION,  u32PQIoctl_S_HD_SATURATION},
    {HIIOC_PQ_G_HD_SATURATION,  u32PQIoctl_G_HD_SATURATION},
    {HIIOC_PQ_S_HD_HUE,         u32PQIoctl_S_HD_HUE},
    {HIIOC_PQ_G_HD_HUE,         u32PQIoctl_G_HD_HUE},
    {HIIOC_PQ_S_SR_DEMO,         u32PQIoctl_S_SR_DEMO},
    {HIIOC_PQ_G_SR_DEMO,         u32PQIoctl_G_SR_DEMO},

    {HIIOC_PQ_S_TNR,    u32PQIoctl_S_TNR},
    {HIIOC_PQ_G_TNR,    u32PQIoctl_G_TNR},
    {HIIOC_PQ_S_SNR,    u32PQIoctl_S_SNR},
    {HIIOC_PQ_G_SNR,    u32PQIoctl_G_SNR},
    {HIIOC_PQ_S_DB,     u32PQIoctl_S_DB},
    {HIIOC_PQ_G_DB,     u32PQIoctl_G_DB},
    {HIIOC_PQ_S_DM,     u32PQIoctl_S_DM},
    {HIIOC_PQ_G_DM,     u32PQIoctl_G_DM},
    {HIIOC_PQ_S_SHARPNESS, u32PQIoctl_S_SHARPNESS},
    {HIIOC_PQ_G_SHARPNESS, u32PQIoctl_G_SHARPNESS},
    {HIIOC_PQ_S_FLESHTONE, u32PQIoctl_S_FLESHTONE},
    {HIIOC_PQ_G_FLESHTONE, u32PQIoctl_G_FLESHTONE},
    {HIIOC_PQ_S_SIXBASECOLOR,       u32PQIoctl_S_SIXBASECOLOR},
    {HIIOC_PQ_G_SIXBASECOLOR,       u32PQIoctl_G_SIXBASECOLOR},
    {HIIOC_PQ_S_COLOR_ENHANCE_MODE, u32PQIoctl_S_COLOR_ENHANCE_MODE},
    {HIIOC_PQ_G_COLOR_ENHANCE_MODE, u32PQIoctl_G_COLOR_ENHANCE_MODE},
    {HIIOC_PQ_S_MODULE,             u32PQIoctl_S_MODULE},
    {HIIOC_PQ_G_MODULE,             u32PQIoctl_G_MODULE},
    {HIIOC_PQ_S_DEMO,               u32PQIoctl_S_DEMO},

    {HIIOC_PQ_S_GRAPH_SD_PARAM,     u32PQIoctl_S_GRAPH_SD_PARAM},
    {HIIOC_PQ_G_GRAPH_SD_PARAM,     u32PQIoctl_G_GRAPH_SD_PARAM},
    {HIIOC_PQ_S_GRAPH_HD_PARAM,     u32PQIoctl_S_GRAPH_HD_PARAM},
    {HIIOC_PQ_G_GRAPH_HD_PARAM,     u32PQIoctl_G_GRAPH_HD_PARAM},
    {HIIOC_PQ_S_VIDEO_SD_PARAM,     u32PQIoctl_S_VIDEO_SD_PARAM},
    {HIIOC_PQ_G_VIDEO_SD_PARAM,     u32PQIoctl_G_VIDEO_SD_PARAM},
    {HIIOC_PQ_S_VIDEO_HD_PARAM,     u32PQIoctl_S_VIDEO_HD_PARAM},
    {HIIOC_PQ_G_VIDEO_HD_PARAM,     u32PQIoctl_G_VIDEO_HD_PARAM},
    {HIIOC_PQ_S_SD_TEMPERATURE,     u32PQIoctl_S_SD_TEMPERATURE},
    {HIIOC_PQ_G_SD_TEMPERATURE,     u32PQIoctl_G_SD_TEMPERATURE},
    {HIIOC_PQ_S_HD_TEMPERATURE,     u32PQIoctl_S_HD_TEMPERATURE},
    {HIIOC_PQ_G_HD_TEMPERATURE,     u32PQIoctl_G_HD_TEMPERATURE},
#if defined(CHIP_TYPE_hi3798cv200)
#ifdef PQ_ALG_TNR
    {HIIOC_PQ_S_TNR_Y_PIXMEAN_2_RATIO,      u32PQIoctl_S_TNR_Y_PIXMEAN_2_RATIO},
    {HIIOC_PQ_G_TNR_Y_PIXMEAN_2_RATIO,      u32PQIoctl_G_TNR_Y_PIXMEAN_2_RATIO},
    {HIIOC_PQ_S_TNR_C_PIXMEAN_2_RATIO,      u32PQIoctl_S_TNR_C_PIXMEAN_2_RATIO},
    {HIIOC_PQ_G_TNR_C_PIXMEAN_2_RATIO,      u32PQIoctl_G_TNR_C_PIXMEAN_2_RATIO},
    {HIIOC_PQ_S_TNR_Y_MOTION_MAPPING,       u32PQIoctl_S_TNR_Y_MOTION_MAPPING},
    {HIIOC_PQ_G_TNR_Y_MOTION_MAPPING,       u32PQIoctl_G_TNR_Y_MOTION_MAPPING},
    {HIIOC_PQ_S_TNR_C_MOTION_MAPPING,       u32PQIoctl_S_TNR_C_MOTION_MAPPING},
    {HIIOC_PQ_G_TNR_C_MOTION_MAPPING,       u32PQIoctl_G_TNR_C_MOTION_MAPPING},
    {HIIOC_PQ_S_TNR_Y_FINAL_MOTION_MAPPING, u32PQIoctl_S_TNR_Y_FINAL_MOTION_MAPPING},
    {HIIOC_PQ_G_TNR_Y_FINAL_MOTION_MAPPING, u32PQIoctl_G_TNR_Y_FINAL_MOTION_MAPPING},
    {HIIOC_PQ_S_TNR_C_FINAL_MOTION_MAPPING, u32PQIoctl_S_TNR_C_FINAL_MOTION_MAPPING},
    {HIIOC_PQ_G_TNR_C_FINAL_MOTION_MAPPING, u32PQIoctl_G_TNR_C_FINAL_MOTION_MAPPING},
    {HIIOC_PQ_S_TNR_FMOTION_MAPPING,        u32PQIoctl_S_TNR_FMOTION_MAPPING},
    {HIIOC_PQ_G_TNR_FMOTION_MAPPING,        u32PQIoctl_G_TNR_FMOTION_MAPPING},
#endif
#endif
#ifdef PQ_ALG_SNR
    {HIIOC_PQ_S_SNRMOTION_430_LUT,      u32PQIoctl_S_SNR_MOTION_LUT},
    {HIIOC_PQ_G_SNRMOTION_430_LUT,      u32PQIoctl_G_SNR_MOTION_LUT},
#endif
#ifdef PQ_ALG_ZME
    {HIIOC_PQ_S_ZME_VID_430_SEL,      u32PQIoctl_S_ZME_VID_430_SEL},
    {HIIOC_PQ_G_ZME_VID_430_SEL,      u32PQIoctl_G_ZME_VID_430_SEL},
    {HIIOC_PQ_S_ZME_WBC_430_SEL,      u32PQIoctl_S_ZME_WBC_430_SEL},
    {HIIOC_PQ_G_ZME_WBC_430_SEL,      u32PQIoctl_G_ZME_WBC_430_SEL},
#endif

    {HIIOC_PQ_S_IMAGE_MODE,      u32PQIoctl_S_IMAGE_MODE},
    {HIIOC_PQ_G_IMAGE_MODE,      u32PQIoctl_G_IMAGE_MODE},
    {HIIOC_PQ_S_DEMO_MODE,       u32PQIoctl_S_DEMO_MODE},
    {HIIOC_PQ_G_DEMO_MODE,       u32PQIoctl_G_DEMO_MODE},
    {HIIOC_PQ_S_DEMO_COORDINATE, u32PQIoctl_S_DEMO_COORDINATE},
    {HIIOC_PQ_G_DEMO_COORDINATE, u32PQIoctl_G_DEMO_COORDINATE},
    {HIIOC_PQ_S_DEFAULT_PARAM,   u32PQIoctl_S_DEFAULT_PARAM},
};

static HI_S32 PQIoctl(struct inode *inode, struct file *filp, unsigned int cmd, HI_VOID *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_S32 u32IoctrlCmdIdex = 0;
    HI_S32 u32IoctrlCmdFuncTotal = 0;
    HI_BOOL bMatch = HI_FALSE;

    if (HI_NULL == arg)
    {
        HI_ERR_PQ("PQIoctl arg NULL \n");
        return -ENOIOCTLCMD;
    }

    u32IoctrlCmdFuncTotal = sizeof(stPQIoctrlCmdFunction) / sizeof(PQ_IOCTRL_CMD_FUN_S);
    for (u32IoctrlCmdIdex = 0; u32IoctrlCmdIdex < u32IoctrlCmdFuncTotal; u32IoctrlCmdIdex++)
    {
        if (cmd == stPQIoctrlCmdFunction[u32IoctrlCmdIdex].cmd )
        {
            bMatch = HI_TRUE;
            if (HI_NULL != stPQIoctrlCmdFunction[u32IoctrlCmdIdex].pfIoctrlCmdFunction)
            {
                s32Ret = down_interruptible(&g_stPQSemaphore);
                if (s32Ret != HI_SUCCESS)
                {
                    HI_ERR_PQ("Acquire PQ mutex failed!\n");
                    return s32Ret;
                }
                s32Ret = stPQIoctrlCmdFunction[u32IoctrlCmdIdex].pfIoctrlCmdFunction(inode, filp, arg);
                if (HI_SUCCESS != s32Ret)
                {
                    bMatch = HI_FALSE;
                    HI_ERR_PQ("stPQIoctrlCmdFunction failed! [%i]\n", s32Ret);
                }

                up(&g_stPQSemaphore);
            }
            else
            {
                bMatch = HI_FALSE;
                HI_ERR_PQ("stPQIoctrlCmdFunction is NULL! \n");
            }

            break;
        }
    }

    if (HI_FALSE == bMatch)
    {
        HI_ERR_PQ("No Such IOCTL Command: %d\n", cmd);
        return -ENOIOCTLCMD;
    }

    return s32Ret;
}

long PQ_Ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
    return (long)HI_DRV_UserCopy(filp->f_path.dentry->d_inode, filp, cmd, arg, PQIoctl);
}

HI_S32 PQ_DRV_Suspend(PM_BASEDEV_S *pdev, pm_message_t state)
{
    return 0;
}

HI_S32 PQ_DRV_Resume(PM_BASEDEV_S *pdev)
{
    return 0;
}

static struct file_operations s_stPQOps =
{
    .owner          = THIS_MODULE,
    .open           = PQ_Open,
    .release        = PQ_Close,
    .unlocked_ioctl = PQ_Ioctl,
#ifdef CONFIG_COMPAT
    .compat_ioctl   = PQ_Ioctl,
#endif
};

static PM_BASEOPS_S  s_stPQDrvOps =
{
    .probe        = NULL,
    .remove       = NULL,
    .shutdown     = NULL,
    .prepare      = NULL,
    .complete     = NULL,
    .suspend      = DRV_PQ_Suspend,
    .suspend_late = NULL,
    .resume_early = DRV_PQ_Resume,
    .resume       = NULL,
};

static UMAP_DEVICE_S s_stPQDev =
{
    .owner      = THIS_MODULE,
    .minor      = UMAP_MIN_MINOR_PQ,
    .fops       = &s_stPQOps,
    .drvops     = &s_stPQDrvOps,
};

HI_S32 PQ_DRV_ModInit(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
    DRV_PROC_ITEM_S *pstPqProc = NULL;
#ifndef HI_MCE_SUPPORT
    HI_CHAR szPath[128] = "../bin/";
#endif

    HI_OSAL_Snprintf(s_stPQDev.devfs_name, HIMEDIA_DEVICE_NAME_MAX_LEN, "%s", UMAP_DEVNAME_PQ);
    s32Ret = HI_DRV_DEV_Register(&s_stPQDev);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_DEV("PQ Device Register Fail!\n");
        return s32Ret;
    }

    pstPqProc = HI_DRV_PROC_AddModule("pq", NULL, NULL);
    if (NULL == pstPqProc)
    {
        HI_ERR_DEV("PQ Proc Register Fail!\n");
        HI_DRV_DEV_UnRegister(&s_stPQDev);

        return s32Ret;
    }
    pstPqProc->read  = DRV_PQ_ProcRead;
    pstPqProc->write = DRV_PQ_ProcWrite;
    pstPqProc->ioctl = NULL;

#ifndef HI_MCE_SUPPORT
    s32Ret = HI_DRV_PQ_Init(szPath);
    if (s32Ret != HI_SUCCESS)
    {
        HI_DRV_DEV_UnRegister(&s_stPQDev);
        HI_DRV_PROC_RemoveModule("pq");
        HI_ERR_DEV("PQ Hal Init Fail!\n");

        return s32Ret;
    }
#endif

#ifdef MODULE
    HI_PRINT("Load hi_pq.ko success.\t\t(%s)\n", VERSION_STRING);
#endif

    return HI_SUCCESS;
}

HI_VOID PQ_DRV_ModuleExit(HI_VOID)
{
#ifndef HI_MCE_SUPPORT
    HI_DRV_PQ_DeInit();
#endif
    HI_DRV_PROC_RemoveModule("pq");
    HI_DRV_DEV_UnRegister(&s_stPQDev);
#ifdef MODULE
    HI_PRINT("remove hi_pq.ko success.     \t(%s)\n", VERSION_STRING);
#endif
}

MODULE_LICENSE("GPL");
#ifdef MODULE
module_init(PQ_DRV_ModInit);
module_exit(PQ_DRV_ModuleExit);
#endif
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

