/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_upgrade.c
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-08-30
  Description   :
  History       :
  1.Date        : 2018-08-30
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#include "loader_debug.h"
#include "loader_flash.h"
#include "loader_osal.h"

#include "loader_dbinfo.h"

#include "ssa_utiliy.h"
#include "ssa_upgrade.h"

#ifdef HI_MINIBOOT_SUPPORT
#include <delay.h>
#else
#include <common.h>
#endif

#ifdef HI_BUILD_WITH_KEYLED
#include "hi_unf_keyled.h"
#endif

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */


#ifdef CONFIG_USB_HOST_BOOTSTRAP
#define LOADER_APPLOADER_IMAGENAME      "apploader.bin"
extern void selfboot_init(void);
extern unsigned int get_selfboot_type(void);
extern int download_bootargs(void);
extern int download_image(const char* imagename);
#endif

#ifdef HI_ANDROID_BOOT_SUPPORT
extern const char* boot_select(void);
#endif

#ifdef HI_BUILD_WITH_KEYLED
#define SSA_KEY_TRY_TIMES                   (50)
#define SSA_KEY_TRY_INTERVAL                (10000) /** us */

#if defined(HI_BOOT_KEYLED_GPIOKEY) && defined(CHIP_TYPE_hi3716mv420)
#define SSA_KEY_VALUE_MENU              (0x40)
#define SSA_KEY_VALUE_OK                (0x2)
#elif defined(HI_BOOT_KEYLED_GPIOKEY) && defined(CHIP_TYPE_hi3798cv200)
#define SSA_KEY_VALUE_OK                (0x1)
#else
#define SSA_KEY_VALUE_MENU              (0x0)
#define SSA_KEY_VALUE_OK                (0x1)
#endif

static HI_U32 s_auMandatoryUpgradeKey[] =
{
#if defined(HI_BOOT_KEYLED_GPIOKEY) && defined(CHIP_TYPE_hi3798cv200)
    SSA_KEY_VALUE_OK,
#else
    SSA_KEY_VALUE_MENU,
    SSA_KEY_VALUE_OK,
#endif
};

static HI_S32 ssaMandatoryUpgradeCheck(HI_VOID)
{
    HI_S32 i = 0;
    HI_U32 u32PressStatus = 0;
    HI_U32 u32KeyValue = 0;
    HI_S32 s32KeyIndex = 0;
    HI_S32 s32KeyCount = 0;

    HI_S32 s32Ret = HI_FAILURE;

    s32KeyCount = sizeof(s_auMandatoryUpgradeKey) / sizeof(HI_U32);

    for (s32KeyIndex = 0; s32KeyIndex < s32KeyCount; s32KeyIndex++)
    {
        for (i = 0; i < SSA_KEY_TRY_TIMES; i++)
        {
            s32Ret = HI_UNF_KEY_GetValue(&u32PressStatus, &u32KeyValue);

            if (HI_SUCCESS != s32Ret)
            {
                udelay(SSA_KEY_TRY_INTERVAL);
                continue;
            }

            if (0x1 != u32PressStatus)
            {
                udelay(SSA_KEY_TRY_INTERVAL);
                continue;
            }

            if (s_auMandatoryUpgradeKey[s32KeyIndex] == u32KeyValue)
            {
                break;
            }
        }

        if (SSA_KEY_TRY_TIMES == i)
        {
            return HI_FAILURE;
        }

        udelay(SSA_KEY_TRY_INTERVAL);
    }

    return HI_SUCCESS;
}
#endif

HI_S32 SSA_CheckUpgrade(HI_BOOL * pbNeedUpgrade,HI_BOOL bRestoreLoaderDB)
{
#if defined(HI_ANDROID_BOOT_SUPPORT) && !defined(HI_APPLOADER_SUPPORT)
    LOADER_FuncEnter();

    if (0 == LOADER_StrNCmp("recovery", (HI_CHAR*)boot_select(), LOADER_StrLen((HI_CHAR*)boot_select()) + 1))
    {
        *pbNeedUpgrade = HI_TRUE;
    }
    else
    {
        *pbNeedUpgrade = HI_FALSE;
    }

    LOADER_FuncExit();
    return HI_SUCCESS;
#else

    LDDB_LOADER_INFO_S stInfoParam;
    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

#ifdef CONFIG_USB_HOST_BOOTSTRAP
    LOADER_PrintInfo("** [TRACE] Check USB Upgrade Key ! **");

    if (SELF_BOOT_TYPE_USBHOST == get_selfboot_type())
    {
        selfboot_init();

        s32Ret = download_bootargs();
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(download_bootargs, s32Ret);
            return s32Ret;
        }

        LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));

        s32Ret = LDDB_GetLoaderInfo(&stInfoParam);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(LDDB_SetLoaderInfo, s32Ret);
            LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));
        }

        stInfoParam.stTAGParamData.bNeedUpgrade = HI_TRUE;
        stInfoParam.stTAGParamData.bUsbBurn = HI_TRUE;

        s32Ret = LDDB_SetLoaderInfo(&stInfoParam);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(LDDB_SetLoaderInfo, s32Ret);
            return s32Ret;
        }

#ifdef HI_APPLOADER_SUPPORT
        s32Ret = download_image(LOADER_APPLOADER_IMAGENAME);

        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(download_image, s32Ret);
            return s32Ret;
        }

#endif
        *pbNeedUpgrade = HI_TRUE;

        LOADER_FuncExit();
        return HI_SUCCESS;
    }

#endif

#ifdef HI_BUILD_WITH_KEYLED
    LOADER_PrintInfo("** [TRACE] Check Mandatory Upgrade key ! **");

    s32Ret = ssaMandatoryUpgradeCheck();
    if (HI_SUCCESS == s32Ret)
    {
        LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));

        s32Ret = LDDB_GetLoaderInfo(&stInfoParam);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(LDDB_GetLoaderInfo, s32Ret);
            if (HI_TRUE == bRestoreLoaderDB)
            {
                SSA_Reboot();
            }

            LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));
        }

        stInfoParam.stTAGParamData.bNeedUpgrade = HI_TRUE;
        stInfoParam.stTAGParamData.bForceUpgrade = HI_TRUE;

        s32Ret = LDDB_SetLoaderInfo(&stInfoParam);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(LDDB_SetLoaderInfo, s32Ret);
            return s32Ret;
        }

        *pbNeedUpgrade = HI_TRUE;

        LOADER_FuncExit();
        return HI_SUCCESS;
    }

#endif

    LOADER_PrintInfo("** [TRACE] Get Upgrade Information ! **");

    LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));

    s32Ret = LDDB_GetLoaderInfo(&stInfoParam);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(LDDB_GetLoaderInfo, s32Ret);

        if (HI_TRUE == bRestoreLoaderDB)
        {
            LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));
            stInfoParam.stUPDParamData.enUpgradeType = HI_LOADER_UPGRADE_TYPE_BUTT;
            LOADER_CHECK(LDDB_SetLoaderInfo(&stInfoParam));

            SSA_Reboot();
        }
        return s32Ret;
    }

    *pbNeedUpgrade = stInfoParam.stTAGParamData.bNeedUpgrade;

    return HI_SUCCESS;
#endif
}


#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */

