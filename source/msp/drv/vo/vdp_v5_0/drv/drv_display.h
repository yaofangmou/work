
/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_display.h
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2012/12/30
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __DRV_DISPLAY_H__
#define __DRV_DISPLAY_H__

#include "hi_type.h"
#include "hi_drv_video.h"
#include "hi_drv_disp.h"

#include "drv_disp_xdr.h"

#ifndef __DISP_PLATFORM_BOOT__
#include "drv_vbi.h"
#if defined (HI_HDMI_SUPPORT_2_0)
#include "drv_hdmi_ext.h"
#endif
#endif

#include "hi_drv_pdm.h"

#define HI_DRV_DISP_OFFSET_MAX 200
#define HI_DRV_DISP_OFFSET_HORIZONTAL_ALIGN 0xFFFFFFFEul
#define HI_DRV_DISP_OFFSET_VERTICAL_ALIGN   0xFFFFFFFCul

#define HI_DRV_DISP_VIRTSCREEN_MAX 3840
#define HI_DRV_DISP_VIRTSCREEN_MIN 480

#define  DISPLAY0_BUS_UNDERFLOW_INT 0x00000080UL
#define  DISPLAY1_BUS_UNDERFLOW_INT 0x00000008UL


typedef struct hiDRV_PDM_DISP_PARAM_S
{
    HI_DISP_PARAM_S stDispParam0;
    HI_DISP_PARAM_S stDispParam1;
    HI_BOOL         bGetDispParam;
}HI_DRV_PDM_DISP_PARAM_S;

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

HI_S32 DISP_Init(HI_VOID);
HI_S32 DISP_DeInit(HI_VOID);

HI_S32 DISP_Suspend(HI_VOID);
HI_S32 DISP_Resume(HI_VOID);

HI_S32 DISP_Attach(HI_DRV_DISPLAY_E enMaster, HI_DRV_DISPLAY_E enSlave);
HI_S32 DISP_Detach(HI_DRV_DISPLAY_E enMaster, HI_DRV_DISPLAY_E enSlave);

HI_S32 DISP_SetFormat(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_STEREO_MODE_E enStereo, HI_DRV_DISP_FMT_E enEncFmt);
HI_S32 DISP_GetFormat(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_STEREO_MODE_E *penStereo, HI_DRV_DISP_FMT_E *penEncFmt);

HI_S32 Disp_SetHDMI420(HI_DRV_DISPLAY_E enDisp,HI_BOOL bEanble);

HI_S32 DISP_SetCustomTiming(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_TIMING_S *pstTiming);
HI_S32 DISP_GetCustomTiming(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_TIMING_S *pstTiming);

HI_BOOL DISP_CheckIntfAttached(HI_DRV_DISPLAY_E enDisp);

HI_S32 DISP_AddIntf(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_INTF_S *pstIntf);
HI_S32 DISP_DelIntf(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_INTF_S *pstIntf);


HI_S32 DISP_Open(HI_DRV_DISPLAY_E enDisp);
HI_S32 DISP_Close(HI_DRV_DISPLAY_E enDisp);

HI_S32 DISP_SetEnable(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable);
HI_S32 DISP_GetEnable(HI_DRV_DISPLAY_E enDisp, HI_BOOL *pbEnable);

HI_S32 DISP_ExternSetEnable(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable);
HI_S32 DISP_SetRightEyeFirst(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable);
HI_S32 DISP_SetVirtScreen(HI_DRV_DISPLAY_E enDisp, HI_RECT_S virtscreen);
HI_S32 DISP_GetVirtScreen(HI_DRV_DISPLAY_E enDisp, HI_RECT_S *virtscreen);

HI_S32 DISP_SetScreenOffset(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_OFFSET_S *pstScreenoffset);
HI_S32 DISP_GetScreenOffset(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_OFFSET_S *pstScreenoffset);

HI_S32 DISP_SetBGColor(HI_DRV_DISPLAY_E eDisp, HI_DRV_DISP_COLOR_S *pstBGColor);
HI_S32 DISP_GetBGColor(HI_DRV_DISPLAY_E eDisp, HI_DRV_DISP_COLOR_S *pstBGColor);
HI_S32 DispGetFmtTiming(HI_DRV_DISP_FMT_E eFmt,HI_DRV_DISP_TIMING_S *pstTiming);

//set aspect ratio: 0 and 0 means auto
HI_S32 DISP_SetAspectRatio(HI_DRV_DISPLAY_E enDisp, HI_U32 u32Ratio_h, HI_U32 u32Ratio_v);
HI_S32 DISP_GetAspectRatio(HI_DRV_DISPLAY_E enDisp, HI_U32 *pu32Ratio_h, HI_U32 *pu32Ratio_v);

HI_S32 DISP_SetLayerZorder(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_LAYER_E enLayer, HI_DRV_DISP_ZORDER_E enZFlag);
HI_S32 DISP_GetLayerZorder(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_LAYER_E enLayer, HI_U32 *pu32Zorder);

//miracast
HI_S32 DISP_CreateCast(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CAST_CFG_S * pstCfg, HI_HANDLE *phCast);
HI_S32 DISP_DestroyCast(HI_HANDLE hCast);
HI_S32 DISP_SetCastEnable(HI_HANDLE hCast, HI_BOOL bEnable);
HI_S32 DISP_GetCastEnable(HI_HANDLE hCast, HI_BOOL *pbEnable);

HI_S32 DISP_AcquireCastFrame(HI_HANDLE hCast, HI_DRV_VIDEO_FRAME_S *pstCastFrame);
HI_S32 DISP_ReleaseCastFrame(HI_HANDLE hCast, HI_DRV_VIDEO_FRAME_S *pstCastFrame);
HI_S32 DISP_External_Attach(HI_HANDLE hCast, HI_HANDLE hsink);
HI_S32 DISP_External_DeAttach(HI_HANDLE hCast, HI_HANDLE hsink);

HI_S32 DRV_DISP_SetCastAttr(HI_HANDLE hCast, HI_DRV_DISP_Cast_Attr_S *castAttr);
HI_S32 DRV_DISP_GetCastAttr(HI_HANDLE hCast, HI_DRV_DISP_Cast_Attr_S *castAttr);
HI_S32 DispGetCastHandle(HI_DRV_DISPLAY_E enDisp, HI_HANDLE *phCast, HI_VOID **phCast_ptr);

//snapshot
HI_S32 DISP_AcquireSnapshot(HI_DRV_DISPLAY_E enDisp, HI_DRV_VIDEO_FRAME_S* pstSnapShotFrame, HI_VOID **snapshotHandleOut);
HI_S32 DISP_ReleaseSnapshot(HI_DRV_DISPLAY_E enDisp, HI_DRV_VIDEO_FRAME_S* pstSnapShotFrame, HI_VOID* snapshotHandle);
HI_S32 DISP_DestroySnapshot(HI_VOID* hSnapshot);

//Macrovision
HI_S32 DISP_SetMacrovisionCustomer(HI_DRV_DISPLAY_E enDisp, HI_VOID *pData);
HI_S32 DISP_SetMacrovision(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_MACROVISION_E enMode);
HI_S32 DISP_GetMacrovision(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_MACROVISION_E *penMode);

//cgms-a
HI_S32 DISP_SetCGMS(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CGMSA_CFG_S *pstCfg);

//vbi
HI_S32 DISP_CreateVBIChannel(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_VBI_CFG_S *pstCfg, HI_HANDLE *phVbi);
HI_S32 DISP_DestroyVBIChannel(HI_HANDLE hVbi);
HI_S32 DISP_SendVbiData(HI_HANDLE hVbi, HI_DRV_DISP_VBI_DATA_S *pstVbiData);
HI_S32 DISP_SetWss(HI_HANDLE hVbi, HI_DRV_DISP_WSS_DATA_S *pstWssData);

//may be deleted
//setting
//HI_S32 DISP_ApplySetting(HI_DRV_DISPLAY_E enDisp);

/*interface for user to set disp output type,when set Dolby or HDR10,should get sink capacity*/
HI_S32 DISP_SetDispOutput( HI_DRV_DISPLAY_E enDisp, const HI_DRV_DISP_OUT_TYPE_E  enDispType);
HI_S32 DISP_GetDispOutput(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_OUT_TYPE_E *penDispType);
HI_S32 DISP_GetGfxState(HI_DRV_DISPLAY_E enDisp, HI_BOOL *pbNeedProcessGfx);

HI_S32 DISP_SetOutputColorSpace(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_COLOR_SPACE_E enColorSpace);
HI_S32 DISP_GetOutputColorSpace(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_COLOR_SPACE_E *penColorSpace);

#ifndef __DISP_PLATFORM_BOOT__
HI_S32 DISP_GenerateFrameOutColorSpace(HI_DRV_DISPLAY_E enDisp,
                                       HI_DRV_VIDEO_FRAME_TYPE_E enFrameType,
                                       HI_DRV_DISP_OUT_TYPE_E    enOutType,
                                       HI_DRV_COLOR_SPACE_E enFrameInColorSpace,
                                       HI_DRV_COLOR_SPACE_E *penFrameOutColorSpace);

HI_S32 DISP_SetXdrEngineType(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_XDR_ENGINE_E enXdrEngine);
HI_S32 DISP_GetXdrEngineType(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_XDR_ENGINE_E *penXdrEngine);
#endif

HI_S32 DISP_GetDispAlpha(HI_DRV_DISPLAY_E enDisp,  HI_U32 *pu32Alpha);
HI_S32 DISP_SetDispAlpha(HI_DRV_DISPLAY_E enDisp, HI_U32 u32Alpha);

HI_S32 DISP_SetSinkCapability(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_SINK_CAPABILITY_S *pstSinkCap);
HI_S32 DISP_GetSinkCapability(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_SINK_CAPABILITY_S *pstSinkCap);

HI_S32 DISP_GetOutputStatus(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_OUTPUT_STATUS_S *pstDispOutputStatus);

HI_S32 DispSetStopHDMIInfo(HI_DRV_DISPLAY_E enDisp, HI_BOOL bSopSendHDMIInfo);
/*****************************************************/
//internal state
HI_S32  DISP_GetInitFlag(HI_BOOL *pbInited);
HI_S32  DISP_GetVersion(HI_DRV_DISP_VERSION_S *pstVersion);
HI_BOOL DISP_IsOpened(HI_DRV_DISPLAY_E enDisp);
HI_BOOL DISP_IsFollowed(HI_DRV_DISPLAY_E enDisp);
HI_BOOL DISP_IsSameSource(HI_DRV_DISPLAY_E enDisp);
HI_BOOL DISP_Check_IsogenyMode(HI_VOID);
HI_S32 DISP_GetSlave(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISPLAY_E *penSlave);
HI_S32 DISP_GetMaster(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISPLAY_E *penMaster);
HI_S32 DISP_GetDisplayInfo(HI_DRV_DISPLAY_E enDisp, HI_DISP_DISPLAY_INFO_S *pstInfo);
HI_S32 DISP_GetVbiTimeInfo(HI_DRV_DISPLAY_E enDisp, HI_U32 *pu32CircleTime, HI_U32 *pu32LeftTime);

HI_S32 DISP_GetDisplaySetting(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_FMT_E *penFormat, HI_DRV_DISP_STEREO_E *peDispMode);
//isr
HI_S32 DISP_RegCallback(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CALLBACK_TYPE_E eType,
                             HI_DRV_DISP_CALLBACK_S *pstCB);
HI_S32 DISP_UnRegCallback(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CALLBACK_TYPE_E eType,
                             HI_DRV_DISP_CALLBACK_S *pstCB);

HI_BOOL DispCheckIntfExistByType(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_INTF_S* pstIntf);


HI_S32 DISP_SetDACDetEn(HI_BOOL bDACDetEn);
HI_S32 DISP_SetAllDacEn(HI_BOOL bDacEn);
HI_VOID DISP_Set_Verimatrix(HI_BOOL bEnable);
HI_VOID DISP_Set_Nexguard( HI_BOOL bEnable);
HI_S32 DISP_CheckRegConfig(HI_CHAR *pcheckItem);

HI_VOID DISP_SetVdacControlFlag(HI_BOOL bCvbsOpen, HI_BOOL bYpbprOpen);
HI_VOID DISP_GetVdacControlFlag(HI_BOOL *pbCvbsShutdown, HI_BOOL *pbYpbprShutdown);

HI_DISP_DISPLAY_INFO_S *DISP_GetDispBasicInfor(HI_DRV_DISPLAY_E enDisp);

#define DispCheckID(id)    \
    {                                \
        if ((id >= HI_DRV_DISPLAY_2) /*|| (id < HI_DRV_DISPLAY_0)*/)  \
        {                            \
            DISP_ERROR("error dispid!\n"); \
            return HI_ERR_DISP_INVALID_PARA;  \
        }                             \
    }
#define DispCheckNullPointer(ptr) \
{                                \
    if (!ptr)                    \
    {                            \
        DISP_ERROR("null pointer!\n"); \
        return HI_ERR_DISP_NULL_PTR;  \
    }                             \
}

HI_DRV_DISPLAY_E  DISPGetIntfChannel(HI_DRV_DISP_INTF_ID_E enIntfID);

#ifndef __DISP_PLATFORM_BOOT__
#if defined (HI_HDMI_SUPPORT_2_0)
HI_S32  DISPGetDispPara(HI_DRV_DISPLAY_E enDisp ,HDMI_VIDEO_ATTR_S  *pstVideoAttr);
#endif

#define  Cast_BUFFER_NUM  20
typedef struct tagDISP_Cast_PROC_INFO_S
{
    HI_BOOL     bEnable;
    HI_BOOL     bLowDelay;
    HI_BOOL     bUserAllocate;
    HI_BOOL     bAttached;

    HI_U32      u32OutResolutionWidth;
    HI_U32      u32OutResolutionHeight;
    HI_U32      u32CastOutFrameRate;

    HI_U32      u32TotalBufNum;
    HI_U32      u32BufSize;
    HI_U32      u32BufStride;
    HI_U32      u32CastAcquireTryCnt;
    HI_U32      u32CastAcquireOkCnt;
    HI_U32      u32CastReleaseTryCnt;
    HI_U32      u32CastReleaseOkCnt;

    HI_U32      u32CastIntrCnt;

    HI_U32      u32CastEmptyBufferNum;
    HI_U32      u32CastFullBufferNum;
    /*be written by wbc.*/
    HI_U32      u32CastWriteBufferNum;
    /*be used by user, not returned back.*/
    HI_U32      u32CastUsedBufferNum;
    HI_U32     enState[Cast_BUFFER_NUM];
    HI_U32       u32FrameIndex[Cast_BUFFER_NUM];
}DISP_Cast_PROC_INFO_S;

typedef struct tagDISP_PROC_INFO_S
{
    HI_BOOL bEnable;
    HI_BOOL bMaster;
    HI_BOOL bSlave;
    HI_DRV_DISPLAY_E enAttachedDisp;

    //about encoding format
    HI_DRV_DISP_STEREO_E eDispMode;
    HI_RECT_S stVirtaulScreen;
    HI_DRV_DISP_OFFSET_S stOffsetInfo;
    HI_BOOL bRightEyeFirst;
    HI_DRV_DISP_FMT_E eFmt;

    HI_BOOL bCustAspectRatio;
    HI_U32 u32AR_w;
    HI_U32 u32AR_h;

    HI_U32 u32Bright;
    HI_U32 u32Hue;
    HI_U32 u32Satur;
    HI_U32 u32Contrst;
	HI_U32 u32Alpha;

    HI_DRV_DISP_LAYER_E enLayer[HI_DRV_DISP_LAYER_BUTT]; /* Z-order is from bottom to top */
    HI_DRV_COLOR_SPACE_E eDispColorSpace;

    // about color setting
    HI_DRV_DISP_COLOR_SETTING_S stColorSetting;
    HI_DRV_DISP_COLOR_S stBgColor;

    //interface
    HI_U32 u32IntfNumber;
    HI_DRV_DISP_INTF_S stIntf[HI_DRV_DISP_INTF_ID_MAX];
	HI_U32 u32Link[HI_DRV_DISP_INTF_ID_MAX];


    HI_DRV_DISP_TIMING_S stTiming;
    HI_U32 u32Underflow;
    HI_U32 u32StartTime;
    HI_U32 u32VfRerrCnt;

    /*Cast infor.*/
    HI_VOID* pstCastInfor;
    DISP_Cast_PROC_INFO_S stCastInfor;

    /*********HDR Pro info**********/
    /* Disp output tyep */
    HI_DRV_DISP_OUT_TYPE_E  enDispOutput;
    DISP_XDR_PROC_INFO_S    stXdrProcInfo;

    HI_BOOL  bBootArgsShutdownCvbs;
    HI_BOOL  bBootArgsShutdownYpbpr;

    /* color space set by user. */
    HI_DRV_DISP_COLOR_SPACE_E enUserSetColorSpace;
    HI_DRV_DISP_SINK_CAPABILITY_S stSinkCap;
    HI_DRV_DISP_XDR_ENGINE_E  enUserSetXdrEngine;
}DISP_PROC_INFO_S;

HI_S32 DISP_GetProcInto(HI_DRV_DISPLAY_E enDisp, DISP_PROC_INFO_S *pstInfo);

/*Dolby output type should match progressive format,otherwise return false.*/
HI_BOOL DISP_OutputTypeAndFormatMatch(HI_DRV_DISP_OUT_TYPE_E enOutputType, HI_DRV_DISP_FMT_E  enFormat);

HI_S32 DISP_GetXdrEngineList(HI_DRV_VIDEO_FRAME_TYPE_E enFrmType,
                             HI_DRV_DISP_OUT_TYPE_E    enOutType,
                             HI_DRV_DISP_XDR_ENGINE_E     *penXdrEngineList);

HI_S32 DISP_GetXdrHardwareAbility(DRV_DISP_XDR_HARDWARE_CAP_S *pstXdrHardwareCap);
HI_S32 DISP_GetDisplayColorSpaceWithoutVideo(HI_DRV_DISPLAY_E enDisp, HI_DRV_COLOR_SPACE_E *penOutColorSpace);

#endif

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /*  __DRV_DISPLAY_H__  */

