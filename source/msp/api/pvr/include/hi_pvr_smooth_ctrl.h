/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hi_pvr_smooth_ctrl.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2013/05/20
  Description   :
  History       :
  1.Date        : 2013/05/20
    Author      : sdk
                  sdk
    Modification: Created file

******************************************************************************/

#ifndef __HI_PVR_SMOOTH_CTRL_H__
#define __HI_PVR_SMOOTH_CTRL_H__

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* End of #ifdef __cplusplus */

typedef HI_S32 (*PVRPlaySendAFrameCB)(PVR_PLAY_CHN_S* pChnAttr, const PVR_INDEX_ENTRY_NEW_S* pstFrame);
typedef HI_S32 (*PVRPlaySetFrmRateCB)(HI_HANDLE hAvplay, HI_UNF_AVPLAY_FRMRATE_TYPE_E enFrmRateType, HI_U32 u32fpsInteger, HI_U32 u32fpsDecimal);
typedef HI_S32 (*PVRSmoothHEVCFBChooseFrameCB)(HI_PVR_SMOOTH_PARA_S *pstFBAttr);
typedef HI_S32 (*PVRSmoothHEVCFBIFrameModeCB)(HI_PVR_SMOOTH_PARA_S *pstFBAttr);
typedef HI_S32 (*PVRSmoothHEVCFFChooseFrameCB)(HI_PVR_SMOOTH_PARA_S *pstFBAttr);

HI_S32  HI_PVR_SmoothCheckStatus(HI_PVR_SMOOTH_PARA_S *pFBAttr,HI_UNF_PVR_PLAY_SPEED_E enCurSpeed);
HI_S32  HI_PVR_SmoothEntry(HI_PVR_SMOOTH_PARA_S *pFBAttr,HI_UNF_PVR_PLAY_SPEED_E enCurSpeed);
HI_VOID HI_PVR_SmoothExit( HI_PVR_SMOOTH_PARA_S *pFBAttr);
HI_S32 HI_PVR_SmoothRegisterPlayCallBack(PVRPlaySendAFrameCB pvrPlaySendAFrameCB, PVRPlaySetFrmRateCB pvrPlaySetFrmRateCB);
HI_VOID HI_PVR_SmoothUngisterPlayCallBack();
HI_VOID HI_PVR_SmoothPlayTimeCtrl(HI_PVR_SMOOTH_PARA_S *pFBAttr);
HI_VOID HI_PVR_SmoothHevcInit();
HI_VOID HI_PVR_SmoothHevcDeInit();
const HI_CHAR* HI_PVR_SmoothGetVersion();
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */

#endif /* End of #ifdef __HI_PVR_H__ */
