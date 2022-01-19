/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : tde_adp.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :

History          :
Date                     Author           Modification
2018/01/01               sdk              Created file
************************************************************************************************/

/*********************************add include here**********************************************/
#include "tde_hal.h"
#include "tde_define.h"
#include "tde_adp.h"

#ifdef HI_BUILD_IN_BOOT
#include "hi_gfx_comm.h"
#include "hi_gfx_debug.h"
#else
#include "tde_debug.h"
#endif
/***************************** Macro Definition ********************************************/

/*************************** Enum Definition ***********************************************/

/*************************** Structure Definition ******************************************/

/********************** Global Variable declaration ****************************************/

static HI_U32 gs_u32Capability =  ROP      | ALPHABLEND | COLORIZE  | CLUT
                                | COLORKEY | CLIP       | DEFLICKER | RESIZE
                                | MIRROR   | CSCCOVERT  | QUICKFILL | QUICKCOPY
                                | PATTERFILL;

/******************************* API declaration *******************************************/

/******************************* API release ***********************************************/
HI_VOID TdeHalGetCapability(HI_U32 *pstCapability)
{
    if (NULL != pstCapability)
    {
    #ifdef CONFIG_TDE_MASKROP_SUPPORT
        gs_u32Capability = gs_u32Capability | MASKROP;
    #endif
    #ifdef CONFIG_TDE_MASKBLEND_SUPPORT
        gs_u32Capability = gs_u32Capability | MASKBLEND;
    #endif
        *pstCapability = gs_u32Capability;
    }
    return;
}
