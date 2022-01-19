/******************************************************************************
  Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_xdr_policy.c
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2017/06/12
Last Modified :
Description   : this file use to adapt hal's structures.
Function List :
History       :
******************************************************************************/

#include "hal_xdr_policy.h"
#include "vdp_drv_comm.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"
{
#endif
#endif

#ifndef __DISP_PLATFORM_BOOT__

    static DRV_DISP_XDR_HARDWARE_CAP_S g_stXdrHardwareCap = {HI_TRUE, HI_TRUE, HI_FALSE, HI_TRUE, HI_FALSE};

    static HI_DRV_DISP_XDR_ENGINE_E g_enXdrEngineList[HI_DRV_VIDEO_FRAME_TYPE_BUTT][HI_DRV_DISP_TYPE_BUTT][XDR_ENGINE_NUM] =
{
/* SDR frame type : HI_DRV_VIDEO_FRAME_TYPE_SDR*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_SDR, DRV_XDR_ENGINE_HDR10, DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_SDR, DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_HDR10, DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
},

/* Dolby BL frame type : HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_SDR, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_SDR, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
},

/* Dolby EL frame type : HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL, EL always follow BL*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_SDR, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_SDR, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
},

/* HDR10 frame type : HI_DRV_VIDEO_FRAME_TYPE_HDR10*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_HDR10, DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_HDR10, DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_DOLBY, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
},

/* HLG frame type : HI_DRV_VIDEO_FRAME_TYPE_HLG*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_HLG, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
},

/* SLF frame type : HI_DRV_VIDEO_FRAME_TYPE_SLF*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_SLF, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
},

/* JTP frame type : HI_DRV_VIDEO_FRAME_TYPE_JTP_SL_HDR*/
{
    /* SDR output type : HI_DRV_DISP_TYPE_NORMAL */
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* SDR_Cert output type : HI_DRV_DISP_TYPE_SDR_CERT*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Auto output type : HI_DRV_DISP_TYPE_AUTO*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Dolby output type : HI_DRV_DISP_TYPE_DOLBY */
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10 output type : HI_DRV_DISP_TYPE_HDR10 */
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HDR10_Cert output type : HI_DRV_DISP_TYPE_HDR10_CERT*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* HLG output type : HI_DRV_DISP_TYPE_HLG*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Technicolor output type : HI_DRV_DISP_TYPE_TECHNICOLOR , Unsupport currently.*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},

    /* Follow first frame : HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME .*/
    {DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT, DRV_XDR_ENGINE_BUTT},
}
};

HI_S32 XDR_SPECIFIC_GetXdrEngineList(HI_DRV_VIDEO_FRAME_TYPE_E enFrmType,
                                     HI_DRV_DISP_OUT_TYPE_E enOutType,
                                     HI_DRV_DISP_XDR_ENGINE_E *penXdrEngineList)
{
HI_U32 u32Index = 0;

if ((HI_DRV_VIDEO_FRAME_TYPE_BUTT <= enFrmType)
    || (HI_DRV_DISP_TYPE_BUTT <= enOutType))
{
    return HI_ERR_DISP_INVALID_PARA;
}

if (HI_NULL == penXdrEngineList)
{
    return HI_ERR_DISP_NULL_PTR;
}

for (u32Index = 0; u32Index < XDR_ENGINE_NUM; u32Index++)
{
    penXdrEngineList[u32Index] = g_enXdrEngineList[enFrmType][enOutType][u32Index];
}

return HI_SUCCESS;
}

HI_S32 XDR_SPECIFIC_GetChipXdrCap(DRV_DISP_XDR_HARDWARE_CAP_S *pstXdrHardwareCap)
{
if (HI_NULL == pstXdrHardwareCap)
{
    return HI_ERR_DISP_NULL_PTR;
}

*pstXdrHardwareCap = g_stXdrHardwareCap;

return HI_SUCCESS;
}

#endif

HI_BOOL XDR_SPECIFIC_CheckUserSetColorSpaceValid(HI_DRV_DISP_COLOR_SPACE_E enUserSetColorSpace)
{
if ((HI_DRV_DISP_COLOR_SPACE_BUTT <= enUserSetColorSpace)
    || (HI_DRV_DISP_COLOR_SPACE_BT2020 == enUserSetColorSpace))
{
    HI_ERR_DISP("enUserSetColorSpace is invalid.\n");
    return HI_FALSE;
}

/* ONLY support BT709/Auto. */
return HI_TRUE;
}

HI_BOOL XDR_SPECIFIC_CheckVdmProcessConflict(HI_BOOL *pbVdmConArray)
{
HI_U32 u32Index = 0, u32Count = 0;

for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
{
    if (pbVdmConArray[u32Index])
    {
        u32Count++;
    }
}

if (1 >= u32Count)
{
    return HI_FALSE;
}
else
{
    return HI_TRUE;
}
}

HI_VOID XDR_SPECIFIC_ResetVdmArray(HI_BOOL *pbVdmArray)
{
HI_U32 u32Index = 0;

for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
{
    pbVdmArray[u32Index] = HI_FALSE;
}

return;
}

HI_VOID XDR_SPECIFIC_AdjustColorSpace(WIN_SHARE_INFO_S  *pstWinShareInfo)
{
HI_U32 u32Index = 0;

for (u32Index = 0; u32Index < pstWinShareInfo->u32HdWinNum; u32Index++)
{
    //don't support bt709/bt601 -> bt2020 currently.
    if ((HI_DRV_CS_BT2020_YUV_LIMITED == pstWinShareInfo->stWinInfo[u32Index].enOutCsc)
        || (HI_DRV_CS_BT2020_YUV_FULL == pstWinShareInfo->stWinInfo[u32Index].enOutCsc)
        || (HI_DRV_CS_BT2020_RGB_LIMITED == pstWinShareInfo->stWinInfo[u32Index].enOutCsc)
        || (HI_DRV_CS_BT2020_RGB_FULL == pstWinShareInfo->stWinInfo[u32Index].enOutCsc))
    {
        if ((HI_DRV_CS_BT2020_YUV_LIMITED != pstWinShareInfo->stWinInfo[u32Index].enInCsc)
            && (HI_DRV_CS_BT2020_YUV_FULL != pstWinShareInfo->stWinInfo[u32Index].enInCsc))
        {
            pstWinShareInfo->stWinInfo[u32Index].enOutCsc = pstWinShareInfo->stWinInfo[u32Index].enInCsc;
        }
    }

}

return;
}


#ifndef __DISP_PLATFORM_BOOT__
static HI_VOID XDR_SPECIFIC_MaskWinWhenConflictColorSpace(WIN_INFO_S *pstWinInfo,
                                       HI_DRV_COLOR_SPACE_E    enFmtOutColorCsc)
{
    if ((HI_DRV_CS_BT709_RGB_FULL == enFmtOutColorCsc)
        || (HI_DRV_CS_BT709_RGB_FULL == pstWinInfo->enOutCsc))
    {
        if (enFmtOutColorCsc != pstWinInfo->enOutCsc)
        {
            pstWinInfo->bRegionMute = HI_TRUE;
            pstWinInfo->bRegionEnable = HI_FALSE;
            pstWinInfo->enOutCsc = (HI_DRV_CS_BT709_RGB_FULL == enFmtOutColorCsc) ? HI_DRV_CS_BT709_RGB_FULL : HI_DRV_CS_BT709_YUV_LIMITED;
        }
    }

    return;
}

HI_VOID XDR_SPECIFIC_AdjustConfig(WIN_SHARE_INFO_S  *pstWinShareInfo,
                                  HI_U32             u32MaxWinIndex,
                                  HI_BOOL            *pbVdmProcess,
                                  HI_DRV_DISP_PROCESS_MODE_E  enLastDispProcessMode,
                                  HI_DRV_DISP_PROCESS_MODE_E  *penDispProcessMode,
                                  DISP_XDR_PLAY_INFO_S    *pstXdrFinalPlayInfo,
                                  DISP_XDR_PLAY_INFO_S    *pstXdrPrePlayInfo,
                                  HI_DRV_COLOR_SPACE_E    enFmtOutColorCsc)
{
    HI_U32 u32Index = 0;
    WIN_INFO_S *pstWinInfo = HI_NULL;
    HI_DRV_DISP_PROCESS_MODE_E enDispMode = enLastDispProcessMode;
    HI_BOOL bV1Secure = HI_FALSE;
    HI_DRV_PIXEL_BITWIDTH_E enBitWidth = HI_DRV_PIXEL_BITWIDTH_BUTT;
    HI_DRV_PIX_FORMAT_E ePixFormat = HI_DRV_PIX_BUTT;
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_BUTT;

    if (enDispMode >= HI_DRV_DISP_MODE_BUTT || u32MaxWinIndex >= WINDOW_MAX_NUMBER)
    {
        DISP_ERROR("enDispMode(%d) or u32MaxWinIndex(%d) outof range.\n", enDispMode, u32MaxWinIndex);
        return;
    }
    if (HI_NULL == pbVdmProcess)
    {
        DISP_ERROR("pbVdmProcess is null.\n");
        return;
    }
    //if conflict, choose max win's vdm process.
    if (XDR_SPECIFIC_CheckVdmProcessConflict(pbVdmProcess))
    {
        XDR_SPECIFIC_ResetVdmArray(pbVdmProcess);
        pbVdmProcess[u32MaxWinIndex] = HI_TRUE;
    }

    for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
    {
        pstWinInfo = &pstWinShareInfo->stWinInfo[u32Index];

        if ((HI_NULL != pstWinInfo->pCurrentFrame) && (VDP_LAYER_VID1 == pstWinInfo->u32LayerId))
        {
            if (HI_TRUE == pstWinInfo->pCurrentFrame->bSecure)
            {
                bV1Secure = HI_TRUE;
            }

            if (HI_FALSE == pstWinInfo->bRegionMute)
            {
                if (HI_DRV_PIXEL_BITWIDTH_BUTT == enBitWidth)
                {
                    enBitWidth = pstWinInfo->pCurrentFrame->enBitWidth;
                }
                else if (enBitWidth != pstWinInfo->pCurrentFrame->enBitWidth)
                {
                    pstWinInfo->bRegionMute = HI_TRUE;
                    DISP_WARN("V1 Layer enBitWidth Error!\n");
                }

                if (HI_DRV_PIX_BUTT == ePixFormat)
                {
                    ePixFormat = pstWinInfo->pCurrentFrame->ePixFormat;
                }
                else if (ePixFormat != pstWinInfo->pCurrentFrame->ePixFormat)
                {
                    pstWinInfo->bRegionMute = HI_TRUE;
                    DISP_WARN("V1 Layer ePixFormat Error!\n");
                }

                if (HI_DRV_VIDEO_FRAME_TYPE_BUTT == enSrcFrameType)
                {
                    enSrcFrameType = pstWinInfo->pCurrentFrame->enSrcFrameType;
                }
                else if (enSrcFrameType != pstWinInfo->pCurrentFrame->enSrcFrameType)
                {
                    pstWinInfo->bRegionMute = HI_TRUE;
                    DISP_WARN("V1 Layer enSrcFrameType Error!\n");
                }
            }
        }
    }

    for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
    {
        pstWinInfo = &pstWinShareInfo->stWinInfo[u32Index];
        pstWinInfo->bSecure = HI_FALSE;

        if (HI_NULL != pstWinInfo->pCurrentFrame)
        {
            if (VDP_LAYER_VID1 != pstWinInfo->u32LayerId)
            {
                pstWinInfo->bSecure = pstWinInfo->pCurrentFrame->bSecure;
            }
            else
            {
                if ((HI_TRUE == bV1Secure) && (HI_FALSE == pstWinInfo->pCurrentFrame->bSecure))
                {
                    DISP_ERROR("V1 do not support mix safe and unsafe Attributes!\n");
                }
            }
        }
        else
        {
            pstWinInfo->bRegionMute = HI_TRUE;
        }

        if (VDP_LAYER_VID1 == pstWinInfo->u32LayerId)
        {
            pstWinInfo->bSecure = bV1Secure;
        }

        XDR_SPECIFIC_MaskWinWhenConflictColorSpace(pstWinInfo,enFmtOutColorCsc);
    }

    /* adjust the InColorSpace and OutColorSpace */
    XDR_SPECIFIC_AdjustColorSpace(pstWinShareInfo);

    //NOTICE! policy is different from other chips here.
    if (1 == pstWinShareInfo->u32HdWinNum)
    {
        pstWinInfo = &pstWinShareInfo->stWinInfo[u32MaxWinIndex];
        if (HI_NULL != pstWinInfo->pCurrentFrame)
        {
            if ((HI_DRV_VIDEO_FRAME_TYPE_SDR == pstWinInfo->pCurrentFrame->enSrcFrameType)
                && (HI_DRV_DISP_TYPE_NORMAL == pstWinInfo->enOutType))
            {
                enDispMode = HI_DRV_DISP_PROCESS_MODE_SDR;
            }
            else
            {
                enDispMode = HI_DRV_DISP_PROCESS_MODE_HDR;
            }
        }
        else
        {
            enDispMode = enLastDispProcessMode;
        }

        //close hdr function.force out type as sdr, inCS as BT709.
        if (pstWinInfo->bCloseHdr)
        {
            enDispMode = HI_DRV_DISP_PROCESS_MODE_SDR;
            pstWinInfo->enOutType = HI_DRV_DISP_TYPE_NORMAL;
            pstWinInfo->enInCsc   = HI_DRV_CS_BT709_YUV_LIMITED;
        }
    }
    else
    {
        enDispMode = HI_DRV_DISP_PROCESS_MODE_SDR;
    }

    pstXdrFinalPlayInfo->enColorSpace = pstWinShareInfo->stWinInfo[u32MaxWinIndex].enOutCsc;
    pstXdrFinalPlayInfo->enOutType = pstWinShareInfo->stWinInfo[u32MaxWinIndex].enOutType;
    *penDispProcessMode = enDispMode;
    return;
}

HI_BOOL XDR_SPECIFIC_CheckOutputSignalValid(HI_DRV_DISP_OUT_TYPE_E enDispType)
{
HI_BOOL bValid = HI_FALSE;
switch (enDispType)
{
    case HI_DRV_DISP_TYPE_NORMAL:
    case HI_DRV_DISP_TYPE_HDR10:
    case HI_DRV_DISP_TYPE_DOLBY:
    case HI_DRV_DISP_TYPE_SDR_CERT:
    case HI_DRV_DISP_TYPE_HDR10_CERT:
    case HI_DRV_DISP_TYPE_HLG:
    case HI_DRV_DISP_TYPE_AUTO:
    case HI_DRV_DISP_TYPE_AUTO_FOLLOW_FIRSTFRAME:
        bValid = HI_TRUE;
        break;

        /* unsupport belowed output type currently.*/
    case HI_DRV_DISP_TYPE_TECHNICOLOR:
        bValid = HI_FALSE;
        break;
    default:
        bValid = HI_FALSE;
        break;
}

return bValid;

}


#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

