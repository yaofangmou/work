
/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_disp_x.h
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2012/12/30
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __DRV_WIN_PROC_H__
#define __DRV_WIN_PROC_H__

#include "hi_type.h"
#include "hi_common.h"
#include "drv_win_alg_ratio.h"


typedef struct tagWIN_DEBUG_USER_INFO_S
{
    HI_RECT_S stVirInRect;
    HI_RECT_S stVirOutRect;


    // HI_DRV_DISP_OFFSET_S stDispOffset;
    HI_U32 u32OffsetLeft;
    HI_U32 u32OffsetRight;
    HI_U32 u32OffsetTop;
    HI_U32 u32OffsetButtom;
    HI_RECT_S stRevisedAttrOutRect;

    HI_RECT_S stPhyInRect;
    HI_RECT_S stPhyOutRect;

} WIN_DEBUG_USER_INFO_S;

typedef struct tagWIN_DEBUG_HAL_INFO_S
{
    HI_RECT_S stSrcRect;
    HI_RECT_S stIn;
    HI_RECT_S stVideo;
    HI_RECT_S stDisp;
} WIN_DEBUG_HAL_INFO_S;

typedef struct tagWIN_DEBUG_LOGIC_INFO_S
{
    HI_RECT_S stInRect;
    HI_RECT_S stOutRect;
    HI_RECT_S stVideo;
    HI_RECT_S stDisp;
    HI_U32  mute_en;
    HI_U32  data_width;
    HI_U32  surface_en;
    HI_U32  nosec_flag;
} WIN_DEBUG_LOGIC_INFO_S;

typedef struct tagWIN_DEBUG_FRC_INFO_S
{
    HI_BOOL  bDisable;
    HI_U32 u32InRota;
    HI_U32 u32OutRota;
    HI_U32 u32Count;
} WIN_DEBUG_FRC_INFO_S;

typedef struct tagVDP_DEBUG_AFD_INFO_S
{
    HI_BOOL bEnable;
    HI_DRV_VIDEO_AFD_TYPE_E eActiveFormat;
}VDP_DEBUG_AFD_INFO_S;

typedef struct tagWIN_DEBUG_INFO_S
{
    WIN_DEBUG_FRC_INFO_S stFRC;
    WIN_DEBUG_USER_INFO_S stWinUseInfo;
    WIN_DEBUG_HAL_INFO_S stWinHalInfo;
    WIN_DEBUG_LOGIC_INFO_S stWinLogicInfo;

    VDP_DEBUG_AFD_INFO_S stDebugAFDInfo;
    VDP_ALG_RATIO_DRV_PARA_S stDrvPara;
    VDP_ALG_RATIO_OUT_PARA_S stOutPara;
} WIN_DEBUG_INFO_S;

typedef enum hiDRV_WIN_DATA_FLOW_E
{
    HI_DATA_FLOW_QUEUE_DEQUEUE= 0,
    HI_DATA_FLOW_QUEUE_ISRRELEASE,
    HI_DATA_FLOW_QUEUE_FENCE,
    HI_DATA_FLOW_BUTT
}HI_DRV_WIN_DATA_FLOW_E;


typedef struct hiWIN_RROC_FOR_DEVELOPER_S
{
    /*sr dci location in layer, for debug use.*/
    //VIDEO_LAYER_PROC_S stSrDciPhysicalInfo;
    /*the current win num, if > 2, sr not open.*/
    HI_U32 u32WinNum;

    /*only in 4k, sr can be opened now.*/
    HI_RECT_S eCurrentFmt;
    /*when scaled down ,sr should not be opened.*/
    HI_BOOL bExistScaleDown_WhenRatioRevise;
    /*whether in 3d or not.*/
    HI_BOOL bIn3DMode;

    /*sr effect activated or not;*/
    HI_BOOL bHorSrOpenInPreProcess;
    HI_BOOL bVerSrOpenInPreProcess;

    HI_BOOL bHorSrOpenInPostProcess;
    HI_BOOL bVerSrOpenInPostProcess;


    /*frame size.*/
    HI_RECT_S stOringinFrameSize;
    HI_RECT_S stFinalWinOutputSize;
    HI_RECT_S stOutputSizeOfV0;

    HI_RECT_S stVdpRequire;
    HI_RECT_S stVpssGive;

    HI_RECT_S stSrOutputSize;

    /*the information of dci.*/
    HI_BOOL   bDciOpen;
    HI_RECT_S stOriginDCIPositionInFrame;
    HI_RECT_S stDciFrameSize;

    /*dci input size, the finale position should give a revise.*/
    HI_RECT_S stDciEffecttiveContentInputSize;
    HI_RECT_S stWinFinalPosition;

    HI_DRV_WIN_DATA_FLOW_E eWinDataFlow;

}HI_WIN_RROC_FOR_DEVELOPER_S;


#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /*  __DRV_DISP_X_H__  */










