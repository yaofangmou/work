/******************************************************************************

  Copyright (C), 2017, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : cipher_osal.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2017/2/23
  Last Modified :
  Description   :
  Function List :
******************************************************************************/

#include "cipher_osal.h"

HI_S32 CIPHER_Maloc(cipher_mmz_buf_t *pstMem, HI_CHAR *name)
{
    HI_S32 ret = HI_FAILURE;

    ret = HI_MEM_Alloc(&pstMem->szStartPhyAddr, pstMem->u32Size);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_CIPHER("Error: Get phyaddr for input failed!\n");
        return HI_FAILURE;
    }
    pstMem->pu8StartVirAddr = (HI_U8*)pstMem->szStartPhyAddr;

    return HI_SUCCESS;
}

HI_S32 CIPHER_Free(cipher_mmz_buf_t *pstMem)
{
    if (pstMem->szStartPhyAddr > 0)
    {
        HI_MEM_Free(pstMem->pu8StartVirAddr);
        pstMem->szStartPhyAddr = 0;
        pstMem->pu8StartVirAddr = NULL;
    }

    return HI_SUCCESS;
}

