/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name          : hi_gfx_show.c
Version            : Initial Draft
Author             :
Created            : 2018/01/01
Description        : show input data from base through vo or gfx layer
                     CNcomment: 通过图形层或者视频层将输入的数据显示出来 CNend\n
Function List      :
History            :
Date                           Author                     Modification
2018/01/01                     sdk                        Created file
************************************************************************************************/


/************************** add include here****************************************************/
#include "hi_gfx_show.h"
#include "hi_gfx_surface.h"
#include "hi_gfx_decode.h"
#include "hi_gfx_layer.h"
#include "hi_gfx_blit.h"

#include "hi_gfx_debug.h"
#include "hi_gfx_comm.h"
/************************** Macro Definition     ***********************************************/


/************************** Structure Definition ***********************************************/

/************************** Global Variable declaration ****************************************/

/************************** Api declaration ****************************************************/

extern HI_S32 HI_BOOT_GFX_DisplayWithLayerOrVo(HI_BASE_GFX_LOGO_INFO *pInputBaseLogoInfo, HI_HANDLE DecSurface);


/************************** API realization ****************************************************/
static HI_VOID GFX_PrintInputData(HI_CHAR* pData, HI_U32 Size)
{
    if ((NULL == pData) || (Size <= 20))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, Size);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pData);
        return;
    }

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "input data size");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Size);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "input data first ten data");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[2]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[3]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[4]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[5]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[6]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[7]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[8]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[9]);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "input data last ten data");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 10]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 9]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 8]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 7]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 6]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 5]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 4]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 3]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 2]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pData[Size - 1]);

    return;
}

/***************************************************************************************
* func          : HI_GFX_ShowLogo
* description   :  display the input logo by graphic or vo
                   CNcomment: 通过图形层或者视屏层将输入的logo的数据显示处理CNend\n
* param[in]     : pInputBaseLogoInfo
* retval        : HI_SUCCESS
* retval        : HI_FAILURE
* others:       : NA
***************************************************************************************/
HI_S32 HI_GFX_ShowLogo(HI_BASE_GFX_LOGO_INFO *pInputBaseLogoInfo)
{
     HI_S32 Ret = HI_SUCCESS;
     HI_HANDLE DecSurface = HI_GFX_INVALID_HANDLE;

     /** get log level **/
     HI_GFX_SetLevel();
     HI_GFX_SetLogDebug();
     HI_GFX_SetFunc();

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_BEG);
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
     if (NULL == pInputBaseLogoInfo)
     {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pInputBaseLogoInfo);
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);
         return HI_FAILURE;
     }

     GFX_PrintInputData((HI_CHAR*)pInputBaseLogoInfo->LogoDataBuf,pInputBaseLogoInfo->LogoDataLen);

     Ret = HI_GFX_DecImg(pInputBaseLogoInfo->LogoDataBuf,pInputBaseLogoInfo->LogoDataLen,&DecSurface);
     if (HI_SUCCESS != Ret)
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_DecImg, Ret);
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);
         return HI_FAILURE;
     }

     Ret = HI_BOOT_GFX_DisplayWithLayerOrVo(pInputBaseLogoInfo,DecSurface);
     if (HI_SUCCESS != Ret)
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_BOOT_GFX_DisplayWithLayerOrVo, Ret);
         goto ERR_EXIT_ONE;
     }

     if (HI_GFX_INVALID_HANDLE != DecSurface)
     {
         HI_GFX_FreeSurface(DecSurface);
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);

     return HI_SUCCESS;

ERR_EXIT_ONE:

     if (HI_GFX_INVALID_HANDLE != DecSurface)
     {
        HI_GFX_FreeSurface(DecSurface);
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);

     return HI_FAILURE;
}

/***************************************************************************************
* func          : HI_GFX_ShowAnimation
* description   : show animation
                  CNcomment: 显示开机动画, 动画显示需要双buffer，否则可能裂屏，
                             是否可以多分内存需要审视  CNend\n
* param[in]     : DataBuf    CNcomment: 保存图片数据buffer CNend\n
* param[in]     : DataLen    CNcomment: 图片数据大小       CNend\n
* retval        : HI_SUCCESS
* retval        : HI_FAILURE
* others:       : NA
***************************************************************************************/
HI_S32 HI_GFX_ShowAnimation(HI_U32 DataBuf, HI_U32 DataLen)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_HANDLE DecSurface = HI_GFX_INVALID_HANDLE;
    HI_HANDLE LayerSurface = HI_GFX_INVALID_HANDLE;
    HI_GFX_BLTOPT_S BlitOpt = {0};

    /** get log level **/
    HI_GFX_SetLevel();
    HI_GFX_SetLogDebug();
    HI_GFX_SetFunc();

    /** beg debug **/
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_BEG);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    GFX_PrintInputData((HI_CHAR*)DataBuf,DataLen);

    Ret = HI_GFX_DecImg(DataBuf,DataLen,&DecSurface);
    if (HI_SUCCESS != Ret)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_DecImg, Ret);
       HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);
       return HI_FAILURE;
    }

    Ret = HI_GFX_GetLayerSurface(&LayerSurface);
    if (HI_SUCCESS != Ret)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_GetLayerSurface, Ret);
       goto ERR_EXIT;
    }

    BlitOpt.EnableScale = HI_TRUE;
    Ret = HI_GFX_Blit(DecSurface, NULL, LayerSurface, NULL, &BlitOpt);
    if (HI_SUCCESS != Ret)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Blit, Ret);
       goto ERR_EXIT;
    }

    Ret = HI_GFX_RefreshLayer(LayerSurface);
    if (HI_SUCCESS != Ret)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_RefreshLayer, Ret);
       goto ERR_EXIT;
    }

    if (HI_GFX_INVALID_HANDLE != DecSurface)
     {
        HI_GFX_FreeSurface(DecSurface);
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);

     return HI_SUCCESS;
ERR_EXIT:

     if (HI_GFX_INVALID_HANDLE != DecSurface)
     {
        HI_GFX_FreeSurface(DecSurface);
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_END);

     return HI_FAILURE;
}
