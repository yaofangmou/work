/******************************************************************************
  Copyright (C), 2001-2015, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
  File Name     : drv_disp_hdr.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2015-09-23
  Description   : Dolby HDR processing functions.
  History       :
  1.Date        : 2015-09-23
    Author      : sdk
    Modification: Created file
*******************************************************************************/

#include "drv_window.h"
#include "drv_virtual.h"
#include "drv_win_priv.h"
#include "hi_drv_stat.h"
#include "drv_win_buffer.h"
#include "drv_win_policy.h"

#include "drv_disp_debug.h"

#include "drv_win_hdr.h"
#include "drv_win_share.h"

#include "drv_win_frc.h"
#ifdef __cplusplus
#if __cplusplus
extern "C"
{
#endif
#endif

extern HI_S32  IncreaseFrameCntAccordingToFrame(HI_DRV_VIDEO_FRAME_S *pstFrame,WB_DEBUG_INFO_S *pstInfo);

/*purpose of function below is to get EL and MD from a buf Node through BL frame.*/
#ifndef offsetof
#ifdef __compiler_offsetof
#define offsetof(TYPE,MEMBER) __compiler_offsetof(TYPE,MEMBER)
#else
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
#endif
#endif

#ifndef container_of
#define container_of(ptr,type,member) ({  \
        const typeof(((type *)0)->member) *__mptr = (ptr);    \
        (type *)((char*)__mptr - offsetof( type , member)); } )
#endif


/******************************************************************************
    global object
*******************************************************************************/
extern volatile HI_S32 s_s32WindowGlobalFlag;


/******************************************************************************
    extern function
*******************************************************************************/
extern HI_S32 WinCheckFrame(HI_DRV_VIDEO_FRAME_S *pFrameInfo);
extern HI_VOID WinBuf_DebugAddInput(WB_DEBUG_INFO_S *pstInfo, HI_U32 u32FrameId);
extern HI_VOID WinBuf_DebugAddTryQF(WB_DEBUG_INFO_S *pstInfo);
extern HI_VOID WinBuf_DebugAddQFOK(WB_DEBUG_INFO_S *pstInfo);

extern HI_S32 DISP_GetDispOutput(HI_DRV_DISPLAY_E enDisp,HI_DRV_DISP_OUT_TYPE_E * penDispType);
extern HI_S32 DISP_GetGfxState(HI_DRV_DISPLAY_E enDisp, HI_BOOL *pbNeedProcessGfx);
extern HI_S32 DISP_GenerateFrameOutColorSpace(HI_DRV_DISPLAY_E enDisp,
                                           HI_DRV_VIDEO_FRAME_TYPE_E enFrameType,
                                           HI_DRV_DISP_OUT_TYPE_E    enOutType,
                                           HI_DRV_COLOR_SPACE_E enFrameInColorSpace,
                                           HI_DRV_COLOR_SPACE_E *penFrameOutColorSpace);

extern HI_S32 WindowRedistributeProcess_Wait(WINDOW_S *tmpWindow, HI_BOOL bWait);

/* put new Hdr10 frame into node with Hisi dm cfg.*/
HI_S32  WinBuf_HisiPutNewHdrFrame(WB_POOL_S        *pstWinBP,
                                  WIN_XDR_FRAME_S  *pstWinXdrFrm,
                                  HI_U32            u32PlayCnt)
{
    HI_S32                  nRet = HI_SUCCESS;
    DISP_BUF_NODE_S         *pstNode = HI_NULL;
    HI_DRV_COLOR_SPACE_E    enOutCs = HI_DRV_CS_UNKNOWN;
    //HI_PQ_HDR_CFG           *pstPqHdrCfg = HI_NULL;//Hisi-self hdr cfg.
    HI_PQ_XDR_FRAME_INFO      stPqWinHdrMetaInfo; //the info that generate hdr cfg need.
    HI_DRV_VIDEO_FRAME_S   *pstFrame = HI_NULL;
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = HI_NULL;
    HI_HANDLE               hMaxWinHandle = HI_INVALID_HANDLE;

    WIN_CHECK_NULL_RETURN(pstWinBP);
    WIN_CHECK_NULL_RETURN(pstWinXdrFrm);

    DISP_MEMSET(&stPqWinHdrMetaInfo, 0x0, sizeof(stPqWinHdrMetaInfo));

    pstFrame = &pstWinXdrFrm->stBaseFrm;

    /* get src color space and out color space. */
    WIN_SHARE_GetFrameColorSpace(pstFrame, &stPqWinHdrMetaInfo.enInCS);

    /* follow the max win's outColorSpace. */
    WIN_SHARE_GetMaxWinHandle(&hMaxWinHandle);
    if ((HI_INVALID_HANDLE != hMaxWinHandle)
        && (hMaxWinHandle != pstWinXdrFrm->hWindow))
    {
        WIN_SHARE_GetMaxWinOutColorSpace(&enOutCs);
    }
    else
    {
        nRet = DISP_GenerateFrameOutColorSpace(HI_DRV_DISPLAY_1,
                                               pstFrame->enSrcFrameType,
                                               pstWinXdrFrm->enDispOutType,
                                               stPqWinHdrMetaInfo.enInCS,
                                               &enOutCs);
        if (nRet != HI_SUCCESS)
        {
            HI_ERR_WIN("DISP_GenerateFrameOutColorSpace Err\n");
            return nRet;
        }
    }

    if ((HI_DRV_CS_UNKNOWN == enOutCs)
        || (HI_DRV_CS_BUTT <= enOutCs))
    {
        enOutCs = HI_DRV_CS_BT709_YUV_LIMITED;
    }

    /* mix stream smooth require process.*/
    nRet = WIN_POLICY_MixStreamProcess(pstWinXdrFrm, stPqWinHdrMetaInfo.enInCS, &enOutCs);
    if (nRet != HI_SUCCESS)
    {
        HI_ERR_WIN("WIN_POLICY_MixStreamProcess Err\n");
        return nRet;
    }

    switch (pstWinXdrFrm->enDispOutType)
    {
        case HI_DRV_DISP_TYPE_NORMAL:
            stPqWinHdrMetaInfo.enDispType = HI_PQ_DISP_TYPE_NORMAL;
            break;
        case HI_DRV_DISP_TYPE_HDR10:
            stPqWinHdrMetaInfo.enDispType = HI_PQ_DISP_TYPE_HDR10;
            break;
        case HI_DRV_DISP_TYPE_HLG:
            stPqWinHdrMetaInfo.enDispType = HI_PQ_DISP_TYPE_HLG;
            break;
        default:
            HI_ERR_WIN("Unsupport DispOutType->[%d],Change to SDR out.\n", pstWinXdrFrm->enDispOutType);
            pstWinXdrFrm->enDispOutType = HI_DRV_DISP_TYPE_NORMAL;
            stPqWinHdrMetaInfo.enDispType = HI_PQ_DISP_TYPE_NORMAL;
            break;
    }

    /* set the parameters that PQ needs. */
    stPqWinHdrMetaInfo.enSrcFrameType = pstFrame->enSrcFrameType;
    stPqWinHdrMetaInfo.enCodecType      = pstFrame->enCodecType;

    switch (stPqWinHdrMetaInfo.enSrcFrameType)
    {
        case HI_DRV_VIDEO_FRAME_TYPE_SDR:
            break;
        case HI_DRV_VIDEO_FRAME_TYPE_HDR10:
            stPqWinHdrMetaInfo.unHDRInfo.stHDR10Info = pstFrame->unHDRInfo.stHDR10Info;
            break;
        case HI_DRV_VIDEO_FRAME_TYPE_HLG:
            stPqWinHdrMetaInfo.unHDRInfo.stHLGInfo = pstFrame->unHDRInfo.stHLGInfo;
            break;
        case HI_DRV_VIDEO_FRAME_TYPE_SLF:
            stPqWinHdrMetaInfo.unHDRInfo.stSLFInfo = pstFrame->unHDRInfo.stSLFInfo;
            break;
        case HI_DRV_VIDEO_FRAME_TYPE_JTP_SL_HDR:
            stPqWinHdrMetaInfo.unHDRInfo.stTechnicolorInfo = pstFrame->unHDRInfo.stTechnicolorInfo;
            break;
        default:
            HI_ERR_WIN("unknown enSrcFrameType.\n");
            stPqWinHdrMetaInfo.unHDRInfo.stHDR10Info = pstFrame->unHDRInfo.stHDR10Info;
            break;
    }

    /* step4:put frame and DM config into node buf */
    nRet = DispBuf_GetEmptyNode(&pstWinBP->stBuffer, &pstNode);
    if (nRet != HI_SUCCESS)
    {
        WIN_ERROR("Get emptyNode failed!\n");
        return nRet;
    }

    memset(pstNode->u8Pqdata, 0x0, sizeof(pstNode->u8Pqdata));
    /*set a barrier bettween DispBuf_GetEmptyNode and DispBuf_DelEmptyNode,
    * del oper will change the state of node in empty list, but get oper
    * will check it. so a barrier is neccessary.
    */
    barrier();
#ifdef  CFG_HI3798CV200
    WinSpecificProcessOutTypeAndCs(pstFrame->enSrcFrameType,
                                   stPqWinHdrMetaInfo.enInCS,
                                   &pstWinXdrFrm->enDispOutType,
                                   &enOutCs);
    if (HI_DRV_VIDEO_FRAME_TYPE_SDR != pstFrame->enSrcFrameType)
#endif
    {
        stPqWinHdrMetaInfo.enOutCS = enOutCs;
        stPqWinHdrMetaInfo.stLayerRegionInfo.u32WindowNum = WinGetHDWinNum();
        memcpy(pstNode->u8Pqdata, &stPqWinHdrMetaInfo, sizeof(stPqWinHdrMetaInfo));
#if  !(defined(CHIP_TYPE_hi3798mv310) ||  defined(CHIP_TYPE_hi3716mv430))
        nRet = DRV_PQ_GetHdrCfg(&stPqWinHdrMetaInfo, (HI_PQ_HDR_CFG *)pstNode->u8Metadata);
        if (nRet != HI_SUCCESS)
        {
            HI_ERR_WIN("Get Hdr config from PQ fail.FrmType->%d,OutType->%d,Ret->%d\n",
                       pstFrame->enSrcFrameType, pstWinXdrFrm->enDispOutType, nRet);
            return nRet;
        }
#endif
        /* step3:call PQ's interface to generate DM config. */
    }
    memcpy(pstNode->u32Data, pstFrame, sizeof(HI_DRV_VIDEO_FRAME_S));

    if (sizeof(HI_PQ_HDR_CFG) > sizeof(pstNode->u8Metadata))
    {
        HI_ERR_WIN("Wrong memcpy size!\n");
        return nRet;
    }

    /*here need to copy pq hdr cfg into data2 array of node.*/
    //memcpy(pstNode->u8Metadata, pstPqHdrCfg, sizeof(HI_PQ_HDR_CFG));

    /* set disp type */
    pstNode->stHdrInfo.enDispOutType = pstWinXdrFrm->enDispOutType;
    pstNode->enOutCs = enOutCs;
    /* set Hisi-self hdr10 path flag. */
    pstNode->enXdrEngine = pstWinXdrFrm->enXdrEngine;
    pstNode->u32PlayCnt = u32PlayCnt;

    nRet = DispBuf_DelEmptyNode(&pstWinBP->stBuffer, pstNode);
    if (nRet != HI_SUCCESS)
    {
        WIN_ERROR("DispBuf_DelEmptyNode failed, ID=0x%x\n", pstNode->u32ID);
        return nRet;
    }

    pstPriv = (HI_DRV_VIDEO_PRIVATE_S *) & (pstFrame->u32Priv[0]);

    if ((HI_TRUE != pstPriv->bForFenceUse)
        && (HI_DRV_FRAME_VDP_ALLOCATE_STILL != pstFrame->u32StillFrame))
    {
        nRet = IncreaseFrameCntAccordingToFrame(pstFrame, pstWinBP->pstDebugInfo);
        if (HI_SUCCESS != nRet)
        {
            WIN_ERROR("Invalid frame refcnts!\n");
            return nRet;
        }
    }

    nRet = DispBuf_AddFullNode(&pstWinBP->stBuffer, pstNode);
    DISP_ASSERT(nRet == HI_SUCCESS);

    WinBuf_DebugAddInput(pstWinBP->pstDebugInfo, pstFrame->u32FrameIndex);
    WinBuf_DebugAddQFOK(pstWinBP->pstDebugInfo);

    return HI_SUCCESS;
}

HI_S32 WinBuf_PutNewHdrFrame(WB_POOL_S            *pstWinBP,
                             WIN_XDR_FRAME_S      *pstWinXdrFrm,
                             HI_U32                u32PlayCnt)
{
    HI_S32  nRet = HI_SUCCESS;

    WIN_CHECK_NULL_RETURN(pstWinBP);
    WIN_CHECK_NULL_RETURN(pstWinXdrFrm);

    if(DRV_XDR_ENGINE_DOLBY == pstWinXdrFrm->enXdrEngine)
    {
        /* Dolby HDR10 process path.*/
        WIN_ERROR("No support dolby!\n");
        return HI_FAILURE;
    }
    else
    {
        /* Hisi-self HDR process path. */
        nRet = WinBuf_HisiPutNewHdrFrame(pstWinBP, pstWinXdrFrm, u32PlayCnt);
    }

    return nRet;
}


HI_DRV_VIDEO_FRAME_S* WinBuf_GetNextCfgFrm(WB_POOL_S *pstWinBP)
{
    DISP_BUF_NODE_S* pstNode;
    HI_DRV_VIDEO_FRAME_S* pstFrm;
    HI_S32 nRet;

    WIN_CHECK_NULL_RETURN_NULL(pstWinBP);

    //get next frame that will be configurated in next interrupt.
    nRet = DispBuf_GetFullNode(&pstWinBP->stBuffer, &pstNode);
    if (nRet != HI_SUCCESS)
    {
        return HI_NULL;
    }

    pstFrm = (HI_DRV_VIDEO_FRAME_S*)pstNode->u32Data;

    return pstFrm;
}

HI_S32 WIN_CloseHdrPath(HI_HANDLE hWin, HI_BOOL bEnable)
{
    WINDOW_S*    pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);
    pstWin->stCfg.stAttrBuf.bCloseHdrPath = bEnable;
    atomic_set(&pstWin->stCfg.bNewAttrFlag, 1);

    return HI_SUCCESS;

}

/* whether to take Hisi-self hdr path or not,true indicate not to take Hisi-self,
 * false->Hisi-self hdr path. */
HI_S32 WIN_SetHisiPath(HI_HANDLE hWin,HI_BOOL bEnable)
{
    WINDOW_S*    pstWin;

    WinCheckDeviceOpen();

    WinCheckWindow(hWin, pstWin);
    pstWin->stCfg.stAttrBuf.bHisiHdr = bEnable;
    atomic_set(&pstWin->stCfg.bNewAttrFlag, 1);

    return HI_SUCCESS;
}

HI_VOID WIN_JudgeHdrFrame(HI_DRV_VIDEO_FRAME_TYPE_E  enFrameType,HI_BOOL *pbIsHdrFrame)
{
    if (HI_DRV_VIDEO_FRAME_TYPE_SDR == enFrameType)
    {
        *pbIsHdrFrame = HI_FALSE;
    }
    else
    {
        *pbIsHdrFrame = HI_TRUE;
    }

    return;
}


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

