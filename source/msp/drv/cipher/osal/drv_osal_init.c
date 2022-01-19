/******************************************************************************

    Copyright (C), 2017, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : ext_aead.c
  Version       : Initial Draft
  Created       : 2017
  Last Modified :
  Description   :
  Function List :
  History       :
******************************************************************************/
#include "drv_osal_lib.h"
#include "drv_cipher_ext.h"
#include "drv_symc.h"
#include "drv_hash.h"
#include "drv_hdcp.h"
#include "cryp_symc.h"
#include "cryp_hash.h"
#include "drv_osal_tee.h"

/************************ Internal Structure Definition *********************/

#define SYMC_ALG_MODE_CNT 48
#define HASH_MODE_CNT     8
#define HDCP_KEY_SEL_CNT  4

extern s32 crypto_ioctl(u32 cmd, HI_VOID *argp);
extern s32 crypto_entry(void);
extern s32 crypto_exit(void);
extern s32 crypto_release(void);
extern s32 crypto_recover_hdcp_key(void);

static UMAP_DEVICE_S    g_CipherDevice;

/** @}*/  /** <!-- ==== Structure Definition end ====*/

/******************************* API Code *****************************/
/** \addtogroup      link*/
/** @{*/  /** <!-- [link]*/

CIPHER_EXPORT_FUNC_S s_CipherExportFuncs =
{
    .pfnCipherCreateHandle      = HI_DRV_CIPHER_CreateHandle,
    .pfnCipherDestroyHandle     = HI_DRV_CIPHER_DestroyHandle,
    .pfnCipherConfigChn         = HI_DRV_CIPHER_ConfigChn,
    .pfnCipherEncrypt           = HI_DRV_CIPHER_Encrypt,
    .pfnCipherDecrypt           = HI_DRV_CIPHER_Decrypt,
    .pfnCipherGetRandomNumber   = HI_DRV_CIPHER_GetRandomNumber,
    .pfnCipherLoadHdcpKey       = HI_DRV_CIPHER_LoadHdcpKey,
    .pfnCipherSoftReset         = HI_DRV_CIPHER_SoftReset,
    .pfnCipherSetHdmiReadClk    = HI_DRV_CIPHER_SetHdmiReadClk,
    .pfnCipherHashStart         = HI_DRV_CIPHER_HashStart,
    .pfnCipherHashUpdate        = HI_DRV_CIPHER_HashUpdate,
    .pfnCipherHashFinish        = HI_DRV_CIPHER_HashFinish,
};

/******* proc function begin ********/
#ifdef HI_PROC_SUPPORT
HI_S32 symc_proc_read(struct seq_file *p, HI_VOID *v)
{
    symc_chn_status    status[8];
    symc_module_status module;
    hdcp_module_status hdcp;
    const char *alg_str[SYMC_ALG_COUNT]      = {" DES", "TDES", " AES", " SM4", " SM1", " DMA"};
    const char *mode_str[SYMC_MODE_COUNT]    = {"ECB", "CBC", "CFB", "OFB", "CTR", "CCM", "GCM", "CTS"};
    const char *klen_str[SYMC_KEY_LEN_COUNT] = {"DEF", "192", "256", "128"};
    const char *hash_str[HASH_MODE_COUNT]    = {"SHA1", "SHA224", "SHA256", "SHA384", "SHA512", "SM3"};
    const char *hdcp_str[HDCP_KEY_SEL_CNT]   = {"hdcp_root_key", "hisi_key", "host_key", "host_key"};
    u8 alg[SYMC_ALG_MODE_CNT] = {0};
    u8 mode[SYMC_ALG_MODE_CNT] = {0};
    u32 count = 0;
    int i = 0;

    memset(status, 0, sizeof(status));
    memset(&module, 0, sizeof(module));
    memset(&hdcp, 0, sizeof(hdcp));

    drv_hdcp_proc_status(&hdcp);
    drv_symc_proc_status(status, &module);

    PROC_PRINT(p, "---------------------------------------------------------------------------------------------------\n");
    PROC_PRINT(p, "|                                      C I P H E R - I N F O                                       |\n");
    PROC_PRINT(p, "---------------------------------------------------------------------------------------------------\n");
    PROC_PRINT(p, "RESET     :\t\t%s\n", module.allow_reset ? "Allowed" : "Forbidden");
    PROC_PRINT(p, "EXP-CPU   :\t\t%s\n", module.sec_cpu ? "Secure" : "Non-secure");
    PROC_PRINT(p, "NAME      :\t\t%s\n", module.name);
    PROC_PRINT(p, "INT-NUM   :\t\t%d\n", module.int_num);
    PROC_PRINT(p, "INT-EN    :\t\t%d\n", module.int_en);
    PROC_PRINT(p, "SMMU-BASE :\t\t0x%08x\n", module.smmu_base);
    PROC_PRINT(p, "ERR-CODE  :\t\t0x%08x\n", module.err_code);
    PROC_PRINT(p, "RX-READ   :\t\t%s\n", hdcp.rx_read ? "enable" : "disable");
    PROC_PRINT(p, "TX-READ   :\t\t%s\n", hdcp.tx_read ? "enable" : "disable");
    PROC_PRINT(p, "HDCP-KEY  :\t\t%s\n", hdcp_str[hdcp.key_sel]);
    PROC_PRINT(p, "HDCP-CRC4 :\t\t0x%02x\n", hdcp.crc4);

    PROC_PRINT(p, "\n------------------------------------------ CIPHER CONFIG ------------------------------------------\n");
    PROC_PRINT(p, "Chnid Status Decrypt Alg  Mode KeyLen  Addr(in / out)     KeyFrom INT-RAW INT-EN INT_STATUS Owner\n");
    for (i = 0; i < CRYPTO_HARD_CHANNEL_MAX; i++)
    {
        if (0x00 == (CIPHER_HARD_CHANNEL_MASK & (0x1 << i)))
        {
            continue;
        }

        kapi_symc_get_user_uuid(i, &status[i].owner);

        PROC_PRINT(p, " %d    %s    %s   %s  %s   %s   %08x/%08x     %s      %d       %d      %d       %08x\n",
                        i,
                        status[i].open    ? "open " : "close",
                        status[i].decrypt ? "DEC"  : "ENC",
                        alg_str [status[i].alg],
                        mode_str[status[i].mode],
                        klen_str[status[i].klen],
                        status[i].inaddr,
                        status[i].outaddr,
                        status[i].ksrc    ? "HW" : "SW",
                        status[i].int_raw,
                        status[i].int_en,
                        status[i].int_status,
                        status[i].owner);
    }

    PROC_PRINT(p, "\n------------------------------------------ CIPHER STATUS ------------------------------------------\n");
    PROC_PRINT(p, "Chnid SEC SMMU IN-NODE_PTR(r/w/d)     OUT-NODE_PTR(r/w/d)    IVOUT\n");
    for (i = 0; i < CRYPTO_HARD_CHANNEL_MAX; i++)
    {
        if (0x00 == (CIPHER_HARD_CHANNEL_MASK & (0x1 << i)))
        {
            continue;
        }

        kapi_symc_get_user_uuid(i, &status[i].owner);

        PROC_PRINT(p, " %d     %d   %d   %08x(%03d/%03d/%03d)  %08x(%03d/%03d/%03d)  %s\n",
                        i,
                        status[i].secure,
                        status[i].smmu_enable,
                        status[i].in_node_head,
                        status[i].in_node_rptr,
                        status[i].in_node_wptr,
                        status[i].in_node_depth,
                        status[i].out_node_head,
                        status[i].out_node_rptr,
                        status[i].out_node_wptr,
                        status[i].out_node_depth,
                        status[i].iv);
    }

    count = SYMC_ALG_MODE_CNT;
    cryp_get_symc_alg(alg, mode, &count);
    PROC_PRINT(p, "\n---------------------------------------- CIPHER ALGORITHM -----------------------------------------");
    for (i = 0; i < count; i++)
    {
        if (0 == (i % 12))
        {
            PROC_PRINT(p, "\n");
        }
        PROC_PRINT(p, "%s-%s ", alg_str[alg[i]], mode_str[mode[i]]);
    }
    PROC_PRINT(p, "\n");
    count = HASH_MODE_CNT;
    cryp_get_hash_mode(mode, &count);
    for (i = 0; i < count; i++)
    {
        PROC_PRINT(p, "%-8s", hash_str[mode[i]]);
    }
    PROC_PRINT(p, "\n");

    return HI_SUCCESS;
}

HI_S32 symc_proc_write(struct file * file, const char __user * buf, size_t count, loff_t *ppos)
{
    return count;
}

static HI_VOID symc_proc_init(HI_VOID)
{
    DRV_PROC_EX_S stProc = {0};

    stProc.fnRead   = symc_proc_read;
    stProc.fnWrite  = symc_proc_write;

    HI_DRV_PROC_AddModule(HI_MOD_CIPHER, &stProc, NULL);
}

static HI_VOID symc_proc_deinit(HI_VOID)
{
    HI_DRV_PROC_RemoveModule(HI_MOD_CIPHER);
}
#endif
/******* proc function end ********/


static int hi_cipher_suspend(PM_BASEDEV_S *pdev, pm_message_t state)
{
    drv_symc_suspend();

#ifdef CHIP_HASH_SUPPORT
    drv_hash_suspend();
#endif

    HI_PRINT("CIPHER suspend OK\n");

    return HI_SUCCESS;
}

static int hi_cipher_resume(PM_BASEDEV_S *pdev)
{
    s32 ret = HI_SUCCESS;

    ret = drv_symc_resume();
    if (HI_SUCCESS != ret)
    {
        return HI_FAILURE;
    }

#ifdef CHIP_HASH_SUPPORT
    drv_hash_resume();
#endif

    ret = crypto_recover_hdcp_key();
    if (HI_SUCCESS != ret)
    {
        return HI_FAILURE;
    }

    HI_PRINT("CIPHER resume OK\n");

    return HI_SUCCESS;
}

HI_S32 _crypto_ioctl(struct inode *inode, struct file *file,
                       HI_U32 cmd, HI_VOID *arg)
{
    return crypto_ioctl(cmd, arg);
}

static long hi_cipher_ioctl(struct file *ffile, unsigned int cmd, unsigned long arg)
{
    long ret;

    ret = (long)HI_DRV_UserCopy(ffile->f_path.dentry->d_inode, ffile, cmd, arg, _crypto_ioctl);

    return ret;
}

static s32 hi_cipher_release(struct inode * inode, struct file * file)
{
    return crypto_release();
}

static struct file_operations dev_cipher_fops=
{
    .owner            = THIS_MODULE,
    .open             = HI_NULL,
    .unlocked_ioctl   = hi_cipher_ioctl,
#ifdef CONFIG_COMPAT
    .compat_ioctl     = hi_cipher_ioctl,
#endif
    .release          = hi_cipher_release,
};

static PM_BASEOPS_S cipher_drvops = {
    .probe        = NULL,
    .remove       = NULL,
    .shutdown     = NULL,
    .prepare      = NULL,
    .complete     = NULL,
    .suspend      = hi_cipher_suspend,
    .suspend_late = NULL,
    .resume_early = hi_cipher_resume,
    .resume       = NULL,
};

HI_S32 CIPHER_DRV_ModInit(HI_VOID)
{
    s32 ret = HI_SUCCESS;

    snprintf(g_CipherDevice.devfs_name, sizeof(UMAP_DEVNAME_CIPHER), UMAP_DEVNAME_CIPHER);
    g_CipherDevice.fops = &dev_cipher_fops;
    g_CipherDevice.minor = UMAP_MIN_MINOR_CIPHER;
    g_CipherDevice.owner  = THIS_MODULE;
    g_CipherDevice.drvops = &cipher_drvops;

    if (HI_DRV_DEV_Register(&g_CipherDevice) < 0)
    {
        HI_LOG_PrintFuncErr(HI_DRV_DEV_Register, HI_FAILURE);
        return HI_FAILURE;
    }

    ret = HI_DRV_MODULE_Register(HI_ID_CIPHER, CIPHER_NAME, &s_CipherExportFuncs);
    if(HI_SUCCESS != ret)
    {
        HI_DRV_DEV_UnRegister(&g_CipherDevice);
        HI_LOG_PrintFuncErr(HI_DRV_MODULE_Register, ret);
        return ret;
    }

    ret = crypto_entry();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(crypto_entry, ret);
        goto error;
    }

    ret = drv_osal_tee_open_session();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(drv_osal_tee_open_session, ret);
        (HI_VOID)crypto_exit();
        goto error;
    }

/******* proc function begin ********/
#ifdef HI_PROC_SUPPORT
    symc_proc_init();
#endif
/******* proc function end ********/

#ifdef MODULE
    HI_PRINT("Load hi_cipher.ko success.\t(%s)\n", VERSION_STRING);
#endif

    return HI_SUCCESS;

error:
    (HI_VOID)HI_DRV_MODULE_UnRegister(HI_ID_CIPHER);
    (HI_VOID)HI_DRV_DEV_UnRegister(&g_CipherDevice);

    return ret;
}

HI_VOID CIPHER_DRV_ModExit(HI_VOID)
{

/******* proc function begin ********/
#ifdef HI_PROC_SUPPORT
    symc_proc_deinit();
#endif
/******* proc function end ********/

    HI_DRV_DEV_UnRegister(&g_CipherDevice);
    (HI_VOID)crypto_exit();
    (HI_VOID)drv_osal_tee_close_session();
    (HI_VOID)HI_DRV_MODULE_UnRegister(HI_ID_CIPHER);
    HI_DRV_MODULE_UnRegister(HI_ID_CIPHER);

    return ;
}

#ifdef MODULE
module_init(CIPHER_DRV_ModInit);
module_exit(CIPHER_DRV_ModExit);
#endif

MODULE_AUTHOR("Hi3720 MPP GRP");
MODULE_LICENSE("GPL");

/** @}*/  /** <!-- ==== Structure Definition end ====*/
