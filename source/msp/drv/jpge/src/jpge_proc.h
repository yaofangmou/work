/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name        : jpge_proc.h
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      : the proc information define in this file
                   CNcomment: proc 相关的信息都在这里 CNend\n
Function List    :


History          :
Date                  Author           Modification
2018/01/01            sdk              Created file
*************************************************************************************************/
#ifndef __JPGE_PROC_H__
#define __JPGE_PROC_H__

#ifdef CONFIG_GFX_PROC_SUPPORT
/*********************************add include here***********************************************/
#include "hi_type.h"

/************************************************************************************************/

#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */


/***************************** Macro Definition **********************************************/

/*************************** Structure Definition ********************************************/
typedef struct tagJpgeProcInfoS{
     HI_BOOL bProcOn;
}JPGE_PROC_INFO_S;
/********************** Global Variable declaration ******************************************/


/******************************* API declaration *********************************************/
HI_S32 JPGE_PROC_Init(HI_VOID);
HI_VOID JPGE_PROC_DInit(HI_VOID);

/*********************************************************************************************/

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif

#endif
