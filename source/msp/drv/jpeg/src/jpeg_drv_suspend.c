/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name        : jpeg_drv_suspend.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      : the suspend dispose
                   CNcomment: 待机处理 CNend\n
Function List    :


History          :
Date                   Author                 Modification
2018/01/01             sdk                    Created file
*************************************************************************************************/

/*********************************add include here***********************************************/
#include "jpeg_drv_suspend.h"

#ifdef CONFIG_JPEG_SUSPEND

#include <linux/kernel.h>
#include <linux/types.h>
#include "hi_jpeg_reg.h"

/** debug file **/
#include "jpeg_drv_debug.h"
/***************************** Macro Definition *************************************************/

/******************** to see which include file we want to use***********************************/



/*************************** Structure Definition ***********************************************/


/********************** Global Variable declaration *********************************************/

static HI_JPEG_SAVEINFO_S  sg_SaveInfo = {0};

/******************************* API forward declarations ***************************************/

/******************************* API realization ************************************************/


/*****************************************************************************
* func         : JPEG_SaveResumeInfo
* description  : save the resume need information
  CNcomment    : 保存待机唤醒需要的信息        CNend\n
* param[in]    : NULL
* retval       : NA
* others:      : NA
*****************************************************************************/
static HI_VOID JPEG_SaveResumeInfo(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    sg_SaveInfo.u32ResumeData0   = jpeg_reg_read(JPGD_REG_BSRES_DATA0);
    sg_SaveInfo.u32ResumeData1   = jpeg_reg_read(JPGD_REG_BSRES_DATA1);
    sg_SaveInfo.u32ResBitRemain  = jpeg_reg_read(JPGD_REG_BSRES_BIT);
    sg_SaveInfo.u32ResByteConsu  = jpeg_reg_read(JPGD_REG_BSRES);
    sg_SaveInfo.u32ResMcuy       = jpeg_reg_read(JPGD_REG_MCUY);
    sg_SaveInfo.u32Pdy           = jpeg_reg_read(JPGD_REG_PD_Y);
    sg_SaveInfo.u32Pdcbcr        = jpeg_reg_read(JPGD_REG_PD_CBCR);
    sg_SaveInfo.u32DriCnt        = jpeg_reg_read(JPGD_REG_DRI_CNT);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/*****************************************************************************
* func         : JPEG_WaitDecTaskDone
* description  : waite the jpeg decode task done
                 CNcomment: 等待解码任务完成  CNend\n
* param[in]    : NULL
* retval       : NA
* others:      : NA
*****************************************************************************/
HI_VOID JPEG_WaitDecTaskDone(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /** waite 2ms, release cpu **/
    schedule_timeout(HZ / 500);
    JPEG_SaveResumeInfo();
#if 0
    HI_GFX_Print("===============================================================\n");
    HI_GFX_Print("sg_SaveInfo.u32ResByteConsum = %d\n",sg_SaveInfo.u32ResByteConsu);
    HI_GFX_Print("sg_SaveInfo.u32ResumeData0   = %d\n",sg_SaveInfo.u32ResumeData0);
    HI_GFX_Print("sg_SaveInfo.u32ResumeData1   = %d\n",sg_SaveInfo.u32ResumeData1);
    HI_GFX_Print("sg_SaveInfo.u32ResBitRemain  = %d\n",sg_SaveInfo.u32ResBitRemain);
    HI_GFX_Print("sg_SaveInfo.u32ResMcuy       = %d\n",sg_SaveInfo.u32ResMcuy);
    HI_GFX_Print("sg_SaveInfo.u32Pdy           = %d\n",sg_SaveInfo.u32Pdy);
    HI_GFX_Print("sg_SaveInfo.u32Pdcbcr        = %d\n",sg_SaveInfo.u32Pdcbcr);
    HI_GFX_Print("sg_SaveInfo.u32DriCnt        = %d\n",sg_SaveInfo.u32DriCnt);
    HI_GFX_Print("===============================================================\n");
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/*****************************************************************************
* func          : JPEG_GetResumeValue
* description   : get the value that resume need
                  CNcomment: 获取待机唤醒需要的值  CNend\n
* param[in]     : *pSaveInfo
* retval        : NA
* others:       : NA
*****************************************************************************/
HI_VOID JPEG_GetResumeValue(HI_JPEG_SAVEINFO_S *pSaveInfo)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL != pSaveInfo)
    {
       pSaveInfo->u32ResumeData0    = sg_SaveInfo.u32ResumeData0;
       pSaveInfo->u32ResumeData1    = sg_SaveInfo.u32ResumeData1;
       pSaveInfo->u32ResBitRemain   = sg_SaveInfo.u32ResBitRemain;
       pSaveInfo->u32ResByteConsu   = sg_SaveInfo.u32ResByteConsu;
       pSaveInfo->u32ResMcuy        = sg_SaveInfo.u32ResMcuy;
       pSaveInfo->u32Pdy            = sg_SaveInfo.u32Pdy;
       pSaveInfo->u32Pdcbcr         = sg_SaveInfo.u32Pdcbcr;
       pSaveInfo->u32DriCnt         = sg_SaveInfo.u32DriCnt;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif/**CONFIG_JPEG_SUSPEND**/
