/******************************************************************************

          Copyright (C), 2001-2015, Hisilicon Technologies Co., Ltd.
 ******************************************************************************
 File Name       : l2_ssa.c
 Version         : Initial draft
 Author          : Device Chipset STB Development Dept
 Created Date    : 2017-07-09
 Last Modified by: sdk
 Description     :
 Function List   :
 Change History  :
 Version  Date        Author     DefectNum         Description
 main\1   2017-07-09  sdk  N/A               Create this file.
 ******************************************************************************/

/******************************************************************************/
/*  Header file references                                                    */
/*  Quote order                                                               */
/*  1. Global header file                                                     */
/*  2. Public header files of other modules                                   */
/*  3. Header files within this module                                        */
/*  4. Private files within this module (.inc)                                */
/******************************************************************************/

#ifdef HI_MINIBOOT_SUPPORT
#include <cpuinfo.h>
#include "run.h"
#include "boot.h"
#include "app.h"
#else
#include "common.h"
#endif

#ifdef reserve_mem_alloc
#undef resmemalign
#undef reserve_mem_alloc
#endif

#ifdef HI_BUILD_WITH_KEYLED
#include "hi_unf_keyled.h"
#endif

#include "hi_drv_pdm.h"
#include "hi_drv_pq.h"
#include "hi_boot_logo.h"
#include "hi_boot_adp.h"
#include "hi_gfx_show.h"

#include "loader_debug.h"
#include "loader_osal.h"
#include "loader_flash.h"
#include "loader_dbinfo.h"
#include "general_harden.h"
//#include "common_image.h"
//#include "special_image.h"
#include "avb_config.h"

#include <libavb/libavb.h>
#include <libavb_ab/libavb_ab.h>
#include <libavb_user/libavb_user.h>


#define AVB_SUPPORT_AB 1
#define CMD_LINE_SIZE (2048)

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

#ifdef HI_ANDROID_BOOT_SUPPORT
extern const char* boot_select(void);
#endif

#ifdef CONFIG_USB_HOST_BOOTSTRAP
#define LOADER_APPLOADER_IMAGENAME      "apploader.bin"

extern void selfboot_init(void);
extern unsigned int get_selfboot_type(void);
extern int download_bootargs(void);
extern int download_image(const char* imagename);
#endif

#define SSA_LEN_COMMAND                  (1024)

#ifdef HI_BUILD_WITH_KEYLED

#define SSA_KEY_TRY_TIMES               (50)
#define SSA_KEY_TRY_INTERVAL            (10000) /** us */

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

static HI_VOID ssaReboot(HI_VOID)
{
    LOADER_FuncEnter();

#ifdef HI_MINIBOOT_SUPPORT
    setenv("bootcmd", "reset");
#else
    do_reset (NULL, 0, 0, NULL);
    do_reset (NULL, 0, 0, NULL);
    do_reset (NULL, 0, 0, NULL);
#endif

    LOADER_FuncExit();
    return;
}

static HI_S32 ssaBootM(HI_U8* pu8MemBuffer)
{
    LOADER_FuncEnter();

#ifdef HI_MINIBOOT_SUPPORT
    kern_load((HI_CHAR*)(pu8MemBuffer));
#else
    HI_CHAR as8BootCmd[SSA_LEN_COMMAND] = {0};

    snprintf(as8BootCmd, sizeof(as8BootCmd), "bootm 0x%x", (HI_U32)pu8MemBuffer);
    run_command(as8BootCmd, 0);
#endif

    LOADER_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 ssaUpgradeCheck(HI_BOOL* pbNeedUpgrade)
{
#if defined(HI_ANDROID_BOOT_SUPPORT) && !defined(HI_APPLOADER_SUPPORT)
    if (0 == LOADER_StrNCmp("recovery", (HI_CHAR*)boot_select(), LOADER_StrLen((HI_CHAR*)boot_select()) + 1))
    {
        *pbNeedUpgrade = HI_TRUE;
        return HI_SUCCESS;
    }
    else
    {
        *pbNeedUpgrade = HI_FALSE;
        return HI_SUCCESS;
    }

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
    LOADER_PrintInfo("** [TRACE] Check Mandatory Upgrade Key ! **");

    s32Ret = ssaMandatoryUpgradeCheck();
    if (HI_SUCCESS == s32Ret)
    {
        LOADER_MemSet(&stInfoParam, 0x00, sizeof(stInfoParam));
        s32Ret = LDDB_GetLoaderInfo(&stInfoParam);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(LDDB_GetLoaderInfo, s32Ret);
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
        return s32Ret;
    }

    *pbNeedUpgrade = stInfoParam.stTAGParamData.bNeedUpgrade;
#endif

    return HI_SUCCESS;
}

#if 0
static HI_S32 ssaShowLogo(HI_VOID)
{
    HI_U32 u32LogoDataAddr = 0;

    HI_BASE_GFX_LOGO_INFO stLogoInfo;
    HI_LOGO_PARAM_S stLogoParam;
    HI_DISP_PARAM_S stDispParam0;
    HI_DISP_PARAM_S stDispParam1;

    HI_S32 s32Ret = HI_SUCCESS;

    LOADER_FuncEnter();

    s32Ret = HI_DRV_PDM_GetLogoParam(&stLogoParam);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetLogoParam, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    if (1 != stLogoParam.u32CheckFlag)
    {
        LOADER_FuncExit();
        return HI_SUCCESS;
    }

    s32Ret = HI_ADP_DispInit();
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_ADP_DispInit, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    LOADER_MemSet(&stDispParam0, 0x00, sizeof(stDispParam0));
    s32Ret = HI_DRV_PDM_GetDispParam(HI_UNF_DISPLAY0, &stDispParam0);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetDispParam, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    LOADER_MemSet(&stDispParam1, 0x00, sizeof(stDispParam1));
    s32Ret = HI_DRV_PDM_GetDispParam(HI_UNF_DISPLAY1, &stDispParam1);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetDispParam, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    /** Avoid HDMI PHY Invalid problem
        The following code is valid only for the following chips
        Please do not delete, If there is any need to modify, Please confirm with the release manager. */

#if defined(CHIP_TYPE_hi3798mv100)  \
    || defined(CHIP_TYPE_hi3796mv100)  \
    || defined(CHIP_TYPE_hi3716dv100)  \
    || defined(CHIP_TYPE_hi3716mv410)  \
    || defined(CHIP_TYPE_hi3716mv420)  \

    if ((HI_UNF_DISP_INTF_TYPE_HDMI == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].enIntfType)
        && (HI_UNF_HDMI_ID_0 == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].unIntf.enHdmi))
    {
        LOADER_CHECK(HI_UNF_HDMI_Init());
        LOADER_CHECK(HI_UNF_HDMI_Open(HI_UNF_HDMI_ID_0, stDispParam1.enFormat));
    }
#endif

    s32Ret = HI_DRV_PDM_GetLogoData(stLogoParam.u32LogoLen, &u32LogoDataAddr);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_DRV_PDM_GetLogoData, s32Ret);
        return s32Ret;
    }

    LOADER_MemSet(&stLogoInfo, 0x00, sizeof(stLogoInfo));
    stLogoInfo.DispToSD      = (HI_UNF_DISPLAY1 != stDispParam0.enSrcDisp) ? HI_TRUE : HI_FALSE;
    stLogoInfo.LogoDataLen   = stLogoParam.u32LogoLen;
    stLogoInfo.LogoDataBuf   = u32LogoDataAddr;

    stLogoInfo.DispColorFmt[CONFIG_GFX_DISP_LOGO_SD]         = stDispParam0.enPixelFormat;
    stLogoInfo.DispVirtScreenWidth[CONFIG_GFX_DISP_LOGO_SD]  = stDispParam0.u32VirtScreenWidth;
    stLogoInfo.DispVirtScreenHeight[CONFIG_GFX_DISP_LOGO_SD] = stDispParam0.u32VirtScreenHeight;

    stLogoInfo.DispColorFmt[CONFIG_GFX_DISP_LOGO_HD]         = stDispParam1.enPixelFormat;
    stLogoInfo.DispVirtScreenWidth[CONFIG_GFX_DISP_LOGO_HD]  = stDispParam1.u32VirtScreenWidth;
    stLogoInfo.DispVirtScreenHeight[CONFIG_GFX_DISP_LOGO_HD] = stDispParam1.u32VirtScreenHeight;

    s32Ret = HI_GFX_ShowLogo(&stLogoInfo);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(HI_GFX_ShowLogo, s32Ret);
        return LOADER_ERR_EXTERNAL;
    }

    HI_DRV_PDM_SetTagData();

    /** Avoid HDMI PHY Invalid problem
        The following code is valid only for the following chips
        Please do not delete, If there is any need to modify, Please confirm with the release manager. */

#if defined(CHIP_TYPE_hi3798mv100)  \
    || defined(CHIP_TYPE_hi3796mv100)  \
    || defined(CHIP_TYPE_hi3716dv100)  \
    || defined(CHIP_TYPE_hi3716mv410)  \
    || defined(CHIP_TYPE_hi3716mv420)  \

    if ((HI_UNF_DISP_INTF_TYPE_HDMI == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].enIntfType)
        && (HI_UNF_HDMI_ID_0 == stDispParam1.stIntf[HI_UNF_DISP_INTF_TYPE_HDMI].unIntf.enHdmi))
    {
        LOADER_CHECK(HI_UNF_HDMI_Open(HI_UNF_HDMI_ID_0, stDispParam1.enFormat));
    }
#endif

    LOADER_FuncExit();
    return HI_SUCCESS;
}
#endif



HI_S32 ssaLoadHashDescImage(char *PartitionName, HI_U8* address, HI_U64 size)
{
    HI_U32 u32ReadSize = 0;
    HI_HANDLE hFlashHandle = HI_INVALID_HANDLE;
    HI_Flash_InterInfo_S flashInfo;

    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

    //printf("Load %s Image,size:%lld\n",PartitionName,size);

    //hFlashHandle = LOADER_FLASH_Open(&stDataParam);
    hFlashHandle = HI_Flash_OpenByName(PartitionName);
    if (HI_INVALID_HANDLE == hFlashHandle)
    {
        LOADER_PrintFuncErr(HI_Flash_OpenByName, LOADER_ERR_FLASH);
        printf("HI_Flash_OpenByName %s Image fail\n",PartitionName);
        return LOADER_ERR_FLASH;
    }

    memset(&flashInfo, 0x00, sizeof(flashInfo));
    s32Ret = HI_Flash_GetInfo(hFlashHandle, &flashInfo);
    if (HI_SUCCESS != s32Ret)
    {
        printf("HI_Flash_GetInfo %s Image fail\n",PartitionName);
        LOADER_PrintFuncErr(HI_Flash_GetInfo, s32Ret);

        LOADER_CHECK(HI_Flash_Close(hFlashHandle));
        return s32Ret;
    }
    //printf("HI_Flash_Read %s Image,PartSize:%lld\n",PartitionName,flashInfo.PartSize);

    if(size > flashInfo.PartSize)
    {
        size = flashInfo.PartSize;
    }

    u32ReadSize = HI_Flash_Read(hFlashHandle, 0ULL, address, size, HI_FLASH_RW_FLAG_RAW);

    if ( size > u32ReadSize )
    {
        printf("HI_Flash_Read %s Image u32ReadSize:%d fail\n",PartitionName,u32ReadSize);
        LOADER_PrintFuncErr(LOADER_FLASH_Read, LOADER_ERR_FLASH);

        LOADER_CHECK(HI_Flash_Close(hFlashHandle));
        return LOADER_ERR_FLASH;
    }

    LOADER_PrintBuffer("Image Head:", address, 256);
    LOADER_PrintBuffer("Image Data:", address + SSA_IMG_HEADER_LEN, 256);
    LOADER_FuncExit();
    HI_Flash_Close(hFlashHandle);
    //printf("Load %s Image,size:%lld success\n",PartitionName,size);
    return HI_SUCCESS;
}

static HI_S32 ssaLoadLoaderImage(HI_VOID)
{
    //HI_U32 u32Offset = 0;
    //HI_U32 u32DataSize = 0;
    //LOADER_FLASH_OPENPARAM_S stDataParam;

    HI_S32 s32Ret = HI_FAILURE;
    LOADER_FuncEnter();
#if 0
    LOADER_PrintInfo("** [TRACE] Verify Loader Image ! **");

    LOADER_MemSet(&stDataParam, 0x00, sizeof(stDataParam));
    stDataParam.pcPartitionName = SSA_PARTNAME_LOADER;
    stDataParam.enFlashType     = HI_FLASH_TYPE_BUTT;
    s32Ret = SSA_SpecialSignedImgRead(&stDataParam,
                                      SSA_VERIFY_ADDR_LOADER,
                                      SSA_VERIFY_SIZE_LOADER,
                                      &u32Offset,
                                      &u32DataSize);

    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(SSA_SpecialSignedImgRead, s32Ret);
        printf("recovery verify failed\n");
        ssaReboot();
        return s32Ret;
    }
#endif

    s32Ret = ssaLoadHashDescImage(SSA_PARTNAME_LOADER,SSA_VERIFY_ADDR_LOADER,SSA_VERIFY_SIZE_LOADER);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(ssaLoadHashDescImage, s32Ret);
        ssaReboot();
        return s32Ret;
    }
    printf("recovery verify success\n");
    setenv("notee", "y");
    LOADER_CHECK(ssaBootM(SSA_VERIFY_ADDR_LOADER));

    LOADER_FuncExit();
    return HI_SUCCESS;
}

#if AVB_SUPPORT_AB
static char* get_rootdev_from_bootargs(const char* boot_args)
{
    const char* search = "root=";
    const char* tmp = NULL;
    char* result = NULL;
    HI_U32 result_len = 0;

    if (NULL == boot_args || 0 == avb_strlen(boot_args))
    {
        AVB_LOGE("Invalid param!\n");
        return NULL;
    }

    tmp = avb_strstr(boot_args, search);
    if (NULL == tmp)
    {
        AVB_LOGE("Not find %s!\n", search);
        return NULL;
    }

    result_len = avb_strlen(search);
    while (' ' != *(tmp + result_len))
    {
        result_len++;
    }

    AVB_LOGD("result_len = %d\n", result_len);
    result = (char*)avb_calloc(result_len + 1);
    if (NULL == result)
    {
        AVB_LOGE("avb_malloc buffer for result fail!\n");
        return NULL;
    }

    avb_memcpy(result, tmp, result_len);
    AVB_LOGD("result = %s\n", result);

    return result;
}

static HI_S32 AVBVerify_AB(HI_VOID)
{
    AvbOps* ops = NULL;
    AvbSlotVerifyData* avb_slot_data_ = NULL;
    AvbSlotVerifyResult ret = AVB_SLOT_VERIFY_RESULT_OK;
    bool is_device_unlocked = false;
    const char* requested_partitions[] = {"boot","system","vendor",NULL};
    char * boot_args = NULL;
    char * new_boot_args = NULL;
    char avb_boot_args[CMD_LINE_SIZE] = {0};
    AvbSlotVerifyFlags flags = AVB_SLOT_VERIFY_FLAGS_NONE;
    AvbHashtreeErrorMode hashtree_error_mode = AVB_HASHTREE_ERROR_MODE_RESTART;
    char* new_cdmline = NULL;
    char* rootdev = NULL;

    LOADER_FuncEnter();
    AVB_LOGD("ssaAVBverify Begin\n");

    ops = avb_ops_user_new();
    if (ops == NULL) {
       AVB_LOGE("Unable to allocate AvbOps instance.\n");
       ret = HI_FAILURE;
       goto out;
    }

    ret = avb_ab_flow(ops->ab_ops, requested_partitions,
                            flags, hashtree_error_mode, &avb_slot_data_);
    switch (ret) {
        case AVB_SLOT_VERIFY_RESULT_OK:
            AVB_LOGD("AVB_SLOT_VERIFY_RESULT_OK,continue...\n");
            //TODO, send cmdline to kernel
            break;
        case AVB_SLOT_VERIFY_RESULT_ERROR_VERIFICATION:
        ops->read_is_device_unlocked(ops,&is_device_unlocked);
            if (!is_device_unlocked) {
                AVB_LOGE("ERROR_VERIFICATION isn't allowed when the device is LOCKED\n");
                ret = HI_FAILURE;
                goto out;
            }
            break;
        default:
            AVB_LOGE("ssaAVBverify failed, result:%d\n",ret);
            ret = HI_FAILURE;
            goto out;
    }

    AVB_LOGD("avb_slot_data_ ab_suffix :%s\n",avb_slot_data_->ab_suffix);
    AVB_LOGD("avb_slot_data_ cmdline :%s\n",avb_slot_data_->cmdline);

    if(0 == avb_memcmp("_a", avb_slot_data_->ab_suffix, 2))
    {
        boot_args = getenv("bootargs");
        if(NULL == boot_args)
        {
            AVB_LOGE("getenv bootargs fail\n");
            ret = HI_FAILURE;
            goto out;
        }
    }
    else if(0 == avb_memcmp("_b", avb_slot_data_->ab_suffix, 2))
    {
        boot_args = getenv("bootargsb");
        if(NULL == boot_args)
        {
            AVB_LOGE("getenv bootargsb fail\n");
            ret = HI_FAILURE;
            goto out;
        }
    }
    else
    {
        AVB_LOGE("Invalid suffix: %s!\n", avb_slot_data_->ab_suffix);
        ret = HI_FAILURE;
        goto out;
    }

    AVB_LOGD("boot_args = %s, len = %d\n", boot_args, avb_strlen(boot_args));

    //rootdev: root=/dev/XXX
    rootdev = get_rootdev_from_bootargs(boot_args);
    if (NULL == rootdev)
    {
        AVB_LOGE("get_rootdev_from_bootargs fail!\n");
        ret = HI_FAILURE;
        goto out;
    }
    AVB_LOGD("rootdev = %s\n", rootdev);

    //replace PARTUUID= with /dev/mmcblk0pXX
    new_cdmline = avb_replace(avb_slot_data_->cmdline, "PARTUUID=", rootdev + avb_strlen("root="));
    AVB_LOGD("new_cmdline:%s\n\n", new_cdmline);

    //remove rootdev from bootargs, dumplicated with cmdline
    if (NULL != avb_strstr(new_cdmline, "root="))
    {
        new_boot_args = avb_replace(boot_args, rootdev, "");
        boot_args = new_boot_args;
    }
    AVB_LOGD("boot_args:%s\n", boot_args);

    snprintf(avb_boot_args, sizeof(avb_boot_args), "%s %s", boot_args, new_cdmline);
    AVB_LOGD("avb_boot_args:%s\n",avb_boot_args);

    setenv("bootargs", NULL);
    setenv("bootargs", avb_boot_args);

    if(0 == avb_memcmp("_b", avb_slot_data_->ab_suffix, 2))
    {
        setenv("bootcmd", NULL);
        setenv("bootcmd", getenv("bootcmdb"));
    }
    AVB_LOGD("bootcmd = %s\n", getenv("bootcmd"));

#if 0//def Hi3796MV200
#ifdef HI_TEE_SUPPORT
        printf("boot trustedcore\n");
        s32Ret = ssaLoadHashDescImage(SSA_PARTNAME_TEEOS,SSA_VERIFY_ADDR_TEEOS,SSA_VERIFY_SIZE_TEEOS);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(ssaLoadHashDescImage, s32Ret);
            ret = HI_FAILURE;
            goto out;
        }
        s32Ret = ssaBootM(SSA_VERIFY_ADDR_TEEOS);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(ssaBootM, s32Ret);
            ret = HI_FAILURE;
            goto out;
        }
#endif

    printf("boot kernel\n");
    sprintf(kernel_name,"%s%s",SSA_PARTNAME_KERNEL,avb_slot_data_->ab_suffix);

    s32Ret = ssaLoadHashDescImage(kernel_name,SSA_VERIFY_ADDR_KERNEL,SSA_VERIFY_SIZE_KERNEL);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(ssaLoadTeeOS, s32Ret);
        ret = HI_FAILURE;
        goto out;
    }

    s32Ret = ssaBootM(SSA_VERIFY_ADDR_KERNEL);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(ssaBootM, s32Ret);
        ret = HI_FAILURE;
        goto out;
    }
#endif

out:
    if(ops)
    {
        avb_ops_user_free(ops);
        ops = NULL;
    }
    if(avb_slot_data_)
    {
        avb_slot_verify_data_free(avb_slot_data_);
        avb_slot_data_ = NULL;
    }
    if(new_boot_args)
    {
        avb_free(new_boot_args);
        new_boot_args = NULL;
    }
    if(new_cdmline)
    {
        avb_free(new_cdmline);
        new_cdmline = NULL;
    }
    if(rootdev)
    {
        avb_free(rootdev);
        rootdev = NULL;
    }

    return ret;
}

#else
//  const char* requested_partitions[] = {"boot","system","vendor"};
static HI_S32 ssaAVBverify(const char* const* requested_partitions)
{
    AvbOps* ops = NULL;
    AvbSlotVerifyData* avb_slot_data_ = NULL;
    AvbSlotVerifyResult ret = AVB_SLOT_VERIFY_RESULT_OK;
    bool is_device_unlocked = false;
    AvbSlotVerifyFlags flags = AVB_SLOT_VERIFY_FLAGS_NONE;
    AvbHashtreeErrorMode hashtree_error_mode = AVB_HASHTREE_ERROR_MODE_RESTART;

    ops = avb_ops_user_new();
    if (ops == NULL) {
       AVB_LOGE("Unable to allocate AvbOps instance.\n");
       return HI_FAILURE;
    }

    ret = avb_slot_verify(ops, requested_partitions, "",
                          flags, hashtree_error_mode, &avb_slot_data_);
    switch (ret) {
        case AVB_SLOT_VERIFY_RESULT_OK:
            AVB_LOGD("AVB_SLOT_VERIFY_RESULT_OK\n");
            //TODO, send cmdline to kernel
            break;
        case AVB_SLOT_VERIFY_RESULT_ERROR_VERIFICATION:
        ops->read_is_device_unlocked(ops,&is_device_unlocked);
            if (!is_device_unlocked) {
                AVB_LOGE("ERROR_VERIFICATION isn't allowed when the device is LOCKED\n");
                ssaReboot();
                return ret;
            }
            break;
        default:
            AVB_LOGE("avb_slot_verify failed, result:%d\n",ret);
            ssaReboot();
            return ret;
    }

    if(ops)
        avb_ops_user_free(ops);
    if(avb_slot_data_)
        avb_slot_verify_data_free(avb_slot_data_);

    return HI_SUCCESS;
}

static HI_S32 AVBVerify(HI_VOID)
{
    const char* requested_partitions[] = {"boot","system","vendor",NULL};
    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

    //need verify using AVB
    s32Ret = ssaAVBverify(requested_partitions);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(ssaAVBverify, s32Ret);
        AVB_LOGE("ssaAVBverify verify failed\n");
        ssaReboot();
        return s32Ret;
    }
#if 0//def Hi3796MV200
#ifdef HI_TEE_SUPPORT
        //s32Ret = ssaLoadTeeOS();
        s32Ret = ssaLoadHashDescImage(SSA_PARTNAME_TEEOS,SSA_VERIFY_ADDR_TEEOS,SSA_VERIFY_SIZE_TEEOS);
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(ssaLoadHashDescImage, s32Ret);
            ssaReboot();
            return s32Ret;
        }
#endif

    s32Ret = ssaLoadHashDescImage(SSA_PARTNAME_KERNEL,SSA_VERIFY_ADDR_KERNEL,SSA_VERIFY_SIZE_KERNEL);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(ssaLoadHashDescImage, s32Ret);
        ssaReboot();
        return s32Ret;
    }

    s32Ret = ssaBootM(SSA_VERIFY_ADDR_KERNEL);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(ssaBootM, s32Ret);
        return s32Ret;
    }
#endif
    LOADER_FuncExit();
    return HI_SUCCESS;
}
#endif
HI_S32 HI_SSA_Init(HI_VOID)
{
    LOADER_FuncEnter();

    LOADER_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HI_SSA_DeInit(HI_VOID)
{
    LOADER_FuncEnter();

    LOADER_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HI_SSA_Entry(HI_VOID)
{
    HI_BOOL bNeedUpgrade = HI_FALSE;
    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

    //before HI_SSA_Entry, Logo_Main and HI_DRV_PDM_SetTagData have been called
    //LOADER_CHECK(ssaShowLogo());
    LOADER_CHECK(ssaUpgradeCheck(&bNeedUpgrade));

    if (HI_TRUE == bNeedUpgrade)
    {
        s32Ret = ssaLoadLoaderImage();
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(ssaLoadLoaderImage, s32Ret);
            return s32Ret;
        }
    }
    else
    {
#if AVB_SUPPORT_AB
        s32Ret = AVBVerify_AB();
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(AVBVerify_AB, s32Ret);

            ssaReboot();
            return s32Ret;
        }
#else
        s32Ret = AVBVerify();
        if (HI_SUCCESS != s32Ret)
        {
            LOADER_PrintFuncErr(AVBVerify, s32Ret);
            ssaReboot();
            return s32Ret;
        }
#endif
    }

    LOADER_FuncExit();
    return HI_SUCCESS;
}

#ifdef HI_ADVCA_VERIFY_ENABLE

HI_S32 load_direct_env(HI_VOID* pBuffer, HI_U32 u32Address, HI_U32 u32Length)
{
#if 0
    LOADER_FLASH_OPENPARAM_S stDataParam;
    HI_FLASH_TYPE_E enFlashType = HI_FLASH_TYPE_BUTT;

    HI_S32 s32Ret = HI_FAILURE;

    LOADER_FuncEnter();

    enFlashType = ssaGetFlashType();
    if (HI_FLASH_TYPE_BUTT == enFlashType)
    {
        LOADER_PrintFuncErr(ssaGetFlashType, LOADER_ERR_FLASH);
        return LOADER_ERR_FLASH;
    }

    LOADER_PrintInfo("** [TRACE] Verify Bootargs Image ! **");
    LOADER_MemSet(&stDataParam, 0x00, sizeof(stDataParam));
    stDataParam.pcPartitionName = HI_NULL_PTR;
    stDataParam.enFlashType     = enFlashType;
    stDataParam.u64Address      = 0ULL;
    stDataParam.u64Length       = SSA_PARTSIZE_BOOT;
    s32Ret = BLSH_ConfigExternKey(&stDataParam, SSA_VERIFY_ADDR_RESERVE, SSA_VERIFY_SIZE_VERIFY, SSA_KEY_AREA_OFFSET);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(BLSH_ConfigExternKey, s32Ret);
        return s32Ret;
    }
    stDataParam.u64Address      = u32Address;
    stDataParam.u64Length       = SSA_VERIFY_SIZE_BOOTARGS;
    printf("verify bootargs begin\n");
    s32Ret = SSA_ComSingedImgRead(&stDataParam, HI_NULL_PTR, pBuffer, u32Length, SSA_VERIFY_ADDR_RESERVE, SSA_VERIFY_SIZE_VERIFY);
    if (HI_SUCCESS != s32Ret)
    {
        LOADER_PrintFuncErr(SSA_ComSingedImgRead, s32Ret);
        printf("verify bootargs failed[%d]\n", s32Ret);
        ssaReboot();
        return s32Ret;
    }
    printf("verify bootargs success\n");

    LOADER_FuncExit();
#endif
    return HI_SUCCESS;
}
#else
HI_S32 load_direct_env(HI_VOID* pBuffer, HI_U32 u32Address, HI_U32 u32Length)
{
    LOADER_FuncEnter();

    LOADER_FuncExit();
    return HI_FAILURE;
}
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */

