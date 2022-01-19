/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_secureos.c
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-09-17
  Description   :
  History       :
  1.Date        : 2018-09-17
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#include "loader_debug.h"
#include "loader_flash.h"
#include "loader_osal.h"

#include "ssa_utiliy.h"

#include "ssa_secureos.h"

#include <asm/io.h>

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

#define SSA_PARTNAME_TEEOS              "trustedcore"
#define SSA_PARTNAME_TEEOSBAK           "trustedcorebak"

#define SSA_VERIFY_ADDR_TEEOS           (0x0801E000) // 128M + 120K
#define SSA_VERIFY_SIZE_TEEOS           (0x00A00000) //10M  smaller than partition size for nand bad block

#if defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450)
#define SSA_VERIFY_ADDR_RESERVE         (0x16000000) /** for trustedcorebak partition */
#else
#define SSA_VERIFY_ADDR_RESERVE         (0x5C00000) /** for trustedcorebak partition */
#endif


#define SSA_TEEOS_LAUNCH_FAILURE        (0xf80000fc)

HI_BOOL SSA_SecureOS_CheckRecoverFlag(HI_VOID)
{
    return readl(SSA_TEEOS_LAUNCH_FAILURE) == 0 ? HI_FALSE : HI_TRUE;
}

HI_S32 SSA_SecureOS_RecoverImage(HI_VOID)
{
    HI_U32 u32DataSize = 0;
    LOADER_FLASH_INFO_S stFlashInfoB;
    LOADER_FLASH_INFO_S stFlashInfoM;
    HI_HANDLE hFlashHandleM = HI_INVALID_HANDLE;
    HI_HANDLE hFlashHandleB = HI_INVALID_HANDLE;
    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

    hFlashHandleB = LOADER_FLASH_OpenByName(SSA_PARTNAME_TEEOSBAK);
    if (HI_INVALID_HANDLE == hFlashHandleB)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_OpenByName, LOADER_ERR_FLASH);
        return LOADER_ERR_FLASH;
    }

    hFlashHandleM = LOADER_FLASH_OpenByName(SSA_PARTNAME_TEEOS);
    if (HI_INVALID_HANDLE == hFlashHandleM)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_OpenByName, LOADER_ERR_FLASH);
        s32Ret = LOADER_ERR_FLASH;
        goto EXIT;
    }

    LOADER_MemSet(&stFlashInfoM, 0x00, sizeof(stFlashInfoM));
    s32Ret = LOADER_FLASH_GetInfo(hFlashHandleM, &stFlashInfoM);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_GetInfo, s32Ret);
        s32Ret = LOADER_ERR_FLASH;
        goto EXIT;
    }

    LOADER_MemSet(&stFlashInfoB, 0x00, sizeof(stFlashInfoB));
    s32Ret = LOADER_FLASH_GetInfo(hFlashHandleB, &stFlashInfoB);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_GetInfo, s32Ret);
        s32Ret = LOADER_ERR_FLASH;
        goto EXIT;
    }

    if ((stFlashInfoM.u64PartSize < SSA_VERIFY_SIZE_TEEOS) || (stFlashInfoB.u64PartSize < SSA_VERIFY_SIZE_TEEOS))
    {
        LOADER_PrintErrCode(HI_FAILURE);
        s32Ret = HI_FAILURE;
        goto EXIT;
    }

    u32DataSize = LOADER_FLASH_Read(hFlashHandleB, 0ULL, (HI_U8 *)SSA_VERIFY_ADDR_RESERVE, SSA_VERIFY_SIZE_TEEOS, SSA_VERIFY_SIZE_TEEOS);
    if (u32DataSize != SSA_VERIFY_SIZE_TEEOS)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_Read, LOADER_ERR_FLASH);
        s32Ret = LOADER_ERR_FLASH;
        goto EXIT;
    }

    s32Ret = LOADER_FLASH_Write(hFlashHandleM, 0ULL, (HI_U8 *)SSA_VERIFY_ADDR_RESERVE, SSA_VERIFY_SIZE_TEEOS);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_Write, s32Ret);
        s32Ret = LOADER_ERR_FLASH;
        goto EXIT;
    }

    s32Ret = HI_SUCCESS;

EXIT:
    if (HI_INVALID_HANDLE != hFlashHandleB)
    {
        LOADER_CHECK(LOADER_FLASH_Close(hFlashHandleB));
    }

    if (HI_INVALID_HANDLE != hFlashHandleM)
    {
        LOADER_CHECK(LOADER_FLASH_Close(hFlashHandleM));
    }

    LOADER_FuncExit();

    return s32Ret;
}

HI_S32 SSA_SecureOS_LoadImage(HI_VOID)
{
    LOADER_FLASH_OPENPARAM_S stDataParam;
    HI_HANDLE hFlashHandle = HI_INVALID_HANDLE;
    HI_U32 u32ReadSize = 0;

    LOADER_FuncEnter();

    LOADER_MemSet(&stDataParam, 0x0, sizeof (stDataParam));
    stDataParam.pcPartitionName = SSA_PARTNAME_TEEOS;
    stDataParam.enFlashType     = HI_FLASH_TYPE_BUTT;

    hFlashHandle = LOADER_FLASH_Open(&stDataParam);
    if (HI_INVALID_HANDLE == hFlashHandle)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_Open, LOADER_ERR_FLASH);
        return LOADER_ERR_FLASH;
    }

    u32ReadSize = LOADER_FLASH_Read(hFlashHandle, 0ULL, (HI_U8 *)SSA_VERIFY_ADDR_TEEOS, SSA_VERIFY_SIZE_TEEOS, SSA_VERIFY_SIZE_TEEOS);
    if (u32ReadSize != SSA_VERIFY_SIZE_TEEOS)
    {
        LOADER_PrintFuncErr(LOADER_FLASH_Read, LOADER_ERR_FLASH);
        LOADER_CHECK(LOADER_FLASH_Close(hFlashHandle));
        return LOADER_ERR_FLASH;
    }

    LOADER_CHECK(LOADER_FLASH_Close(hFlashHandle));

    LOADER_FuncExit();

    return HI_SUCCESS;
}


HI_S32 SSA_SecureOS_Process(HI_VOID)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_BOOL bNeedRecover = HI_FALSE;

    LOADER_FuncEnter();

    bNeedRecover = SSA_SecureOS_CheckRecoverFlag();
    if (HI_TRUE == bNeedRecover)
    {
        s32Ret = SSA_SecureOS_RecoverImage();
        if (HI_SUCCESS == s32Ret)
        {
            writel(0, SSA_TEEOS_LAUNCH_FAILURE);
        }

        SSA_SReset();
    }
    else
    {
        s32Ret = SSA_SecureOS_LoadImage();
        if (HI_SUCCESS != s32Ret)
        {
            SSA_Reboot();
        }
    }

    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */

