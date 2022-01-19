/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
    File Name   : mpi_otp_v200.c
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-16
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include "hi_unf_otp.h"
#include "otp_enum.h"
#include "hi_debug.h"
#include "hi_error_mpi.h"
#include "drv_otp_ioctl.h"
#include "hi_mpi_otp_v200.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/* Must be continuous when HI_OTP_TAn_SMID defined */
#define TAN_ID_DATA_E(index)            (HI_OTP_TA1_SMID + index - HI_UNF_OTP_TA_INDEX_1)

HI_S32 g_otp_dev_fd    =   -1;
HI_S32 g_otp_open_cnt  =   0;
pthread_mutex_t   g_otp_mutex = PTHREAD_MUTEX_INITIALIZER;

extern HI_S32 OTP_DRV_Init(HI_VOID);
extern HI_S32 OTP_DRV_DeInit(HI_VOID);
extern HI_S32 OTP_DRV_Reset(HI_VOID);
extern HI_S32 OTP_DRV_BurnProductPV(HI_UNF_OTP_BURN_PV_ITEM_S *pv_list, HI_U32 num);
extern HI_S32 OTP_DRV_DebugProductPV(HI_UNF_OTP_BURN_PV_ITEM_S *pv_list, HI_U32 num);
extern HI_S32 OTP_DRV_PVItemByName(HI_CHAR *otp_name, HI_U32 name_len, HI_BOOL is_write,
                                   HI_U8 *value, HI_U32 *value_len, HI_BOOL is_lock);
extern HI_S32 OTP_DRV_PVItem(HI_OTP_DATA_E field_id, HI_BOOL is_write,
                             HI_U8 *value, HI_U32 *value_len, HI_BOOL is_lock);

extern HI_S32 OTP_DRV_PVItemLock(HI_OTP_DATA_E field_id, HI_BOOL is_write, HI_BOOL *lock);

extern HI_S32 OTP_DRV_PVItemIdxByName(HI_CHAR * otp_name, HI_U32 name_len, HI_BOOL is_write,
    HI_U8 *     value, HI_U32 * value_len, HI_BOOL is_lock, HI_U32 idx);

extern HI_S32 OTP_DRV_PVItemIdxLockByName(HI_CHAR * otp_name, HI_U32 name_len, HI_BOOL is_write, HI_BOOL * lock,
     HI_U32     idx, HI_U32 u32Length);

HI_U32 otp_data_output[] =
{
#ifdef HI_OTP_DEBUG_SUPPORT
#include OTP_DATA_FILE_DEBUG
#endif
#ifdef HI_OTP_C3_SUPPORT
#include OTP_DATA_FILE_C3
#endif
#ifdef HI_OTP_C1_SUPPORT
#include OTP_DATA_FILE_C1
#endif
#ifdef HI_OTP_C6_SUPPORT
#include OTP_DATA_FILE_C6
#endif
};

        /******* proc function begin ********/
#ifdef OTP_USR_PROC_SUPPORT
extern HI_S32 OTP_DATA_ShowProc(HI_PROC_SHOW_BUFFER_S *buf);

#define OTP_USR_PROC_ENTRY_NAME "otp_data"
#define OTP_USR_PROC_DIR "otp_usr"
static HI_PROC_ENTRY_S g_otp_proc_entry;

HI_S32 OTP_DRV_ShowProc(HI_PROC_SHOW_BUFFER_S *buf, HI_VOID *data)
{
    HI_FATAL_OTP("OTP_DRV_ShowProc.\n");
    OTP_DATA_ShowProc(buf);
    return HI_SUCCESS;
}

HI_S32 OTP_DRV_SetProc(HI_PROC_SHOW_BUFFER_S *buf, HI_U32 argc, HI_U8 *arg[], HI_VOID *data)
{
    return HI_SUCCESS;
}

HI_S32 OTP_UsrProcInit(HI_VOID)
{
    HI_S32 ret = HI_SUCCESS;

    HI_SYS_Init();

    ret = HI_PROC_AddDir(OTP_USR_PROC_DIR);
    if (HI_SUCCESS != ret)
    {
        HI_FATAL_OTP("HI_PROC_AddDir(\"%s\") return %d\n", OTP_USR_PROC_DIR, ret);
    }
    g_otp_proc_entry.pszDirectory = OTP_USR_PROC_DIR;
    g_otp_proc_entry.pszEntryName = OTP_USR_PROC_ENTRY_NAME;
    g_otp_proc_entry.pfnShowProc = OTP_DRV_ShowProc;
    g_otp_proc_entry.pfnCmdProc = OTP_DRV_SetProc;
    g_otp_proc_entry.pPrivData = NULL;
    ret = HI_PROC_AddEntry(HI_ID_OTP, &g_otp_proc_entry);
    if (HI_SUCCESS != ret)
    {
        HI_FATAL_OTP("HI_PROC_AddEntry(\"%s\") return %d\n", OTP_USR_PROC_ENTRY_NAME, ret);
    }
    return ret;
}

HI_VOID OTP_UsrProcDeInit(HI_VOID)
{
    HI_PROC_RemoveEntry(HI_ID_OTP, &g_otp_proc_entry);
    HI_INFO_OTP("HI_PROC_RemoveEntry(\"%s\")\n", OTP_USR_PROC_ENTRY_NAME);
    HI_PROC_RemoveDir(OTP_USR_PROC_DIR);
    HI_INFO_OTP("HI_PROC_RemoveDir(\"%s\")\n", OTP_USR_PROC_DIR);
    HI_SYS_DeInit();
}
#endif
        /******* proc function end   ********/


HI_U32 OTP_DataSize(HI_VOID)
{
    return sizeof(otp_data_output);
}

HI_S32 OTP_PVItemWrite(HI_OTP_DATA_E field_id, HI_U8 *value, HI_U32 *value_len)
{
    CHECK_OTP_INIT();
    return OTP_DRV_PVItem(field_id, HI_TRUE, value, value_len, HI_TRUE);
}

HI_S32 OTP_PVItemRead(HI_OTP_DATA_E field_id, HI_U8 *value, HI_U32 *value_len)
{
    CHECK_OTP_INIT();
    return OTP_DRV_PVItem(field_id, HI_FALSE, value, value_len, HI_TRUE);
}

HI_S32 OTP_PVItemWriteLock(HI_OTP_DATA_E field_id)
{
    HI_BOOL lock = HI_TRUE;
    CHECK_OTP_INIT();
    return OTP_DRV_PVItemLock(field_id, HI_TRUE, &lock);
}

HI_S32 OTP_PVItemReadLock(HI_OTP_DATA_E field_id, HI_BOOL *lock)
{
    CHECK_OTP_INIT();
    return OTP_DRV_PVItemLock(field_id, HI_FALSE, lock);
}

HI_S32 HI_MPI_OTP_Init(HI_VOID)
{
    HI_S32 ret = HI_FAILURE;

    HI_OTP_LOCK();
    if (g_otp_dev_fd >= 0)
    {
        g_otp_open_cnt++;
        HI_OTP_UNLOCK();
        return HI_SUCCESS;
    }

    g_otp_dev_fd = open("/dev/" UMAP_DEVNAME_OTP, O_RDWR, 0);
    if ( g_otp_dev_fd < 0)
    {
        HI_LOG_PrintH32(g_otp_dev_fd);
        HI_LOG_PrintH32(errno);
        HI_LOG_PrintStr(strerror(errno));
        HI_OTP_UNLOCK();
        return HI_FAILURE;
    }

    DOFUNC_GOTO(OTP_DRV_Init(), ERR);
        /******* proc function begin ********/
#ifdef OTP_USR_PROC_SUPPORT
    DOFUNC_GOTO(OTP_UsrProcInit(), ERR);
#endif
        /******* proc function end   ********/
    g_otp_open_cnt++;
ERR:
    HI_OTP_UNLOCK();
    return ret;
}

HI_S32 HI_MPI_OTP_DeInit(HI_VOID)
{
    HI_OTP_LOCK();

    if ( g_otp_dev_fd < 0)
    {
        HI_OTP_UNLOCK();
        return HI_SUCCESS;
    }

    /*OTP_DRV_DeInit ²»ÒªÖ´ÐÐ*/

    g_otp_open_cnt--;
    if ( 0 == g_otp_open_cnt)
    {
        close(g_otp_dev_fd);
        g_otp_dev_fd = -1;
        /******* proc function begin ********/
#ifdef OTP_USR_PROC_SUPPORT
        OTP_UsrProcDeInit();
#endif
        /******* proc function end   ********/
    }

    HI_OTP_UNLOCK();
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetCustomerKey(HI_U8 *key, HI_U32 key_len)
{
    CHECK_NULL_PTR(key);
    CHECK_OTP_PARAM(key_len != 16);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_CUSTOMER_KEY, key, &key_len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetCustomerKey(HI_U8 *key, HI_U32 key_len)
{
    CHECK_NULL_PTR(key);
    CHECK_OTP_PARAM(key_len != 16);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_CUSTOMER_KEY, key, &key_len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetStbPrivData(HI_U32 offset, HI_U8 data)
{
    HI_U8  private_data[16] = {0};
    HI_U32 len = 16;

    CHECK_OTP_PARAM(offset >= 16);
    CHECK_OTP_INIT();
    private_data[offset] = data;
    DOFUNC_RETURN(OTP_DRV_PVItem(HI_OTP_STB_PRIVATE_DATA, HI_TRUE, private_data, &len, HI_FALSE));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetStbPrivData(HI_U32 offset, HI_U8 *data)
{
    HI_U8 private_data[16] = {0};
    HI_U32 len = 16;

    CHECK_NULL_PTR(data);
    CHECK_OTP_PARAM(offset >= 16);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_STB_PRIVATE_DATA, private_data, &len));
    *data = private_data[offset];
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_BurnToNormalChipset(HI_VOID)
{
    HI_U32 data = 0x2A13C812;
    HI_U32 len = 4;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_SEC_WORD, (HI_U8 *)&data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_BurnToSecureChipset(HI_VOID)
{
    HI_U32 data = 0x6EDBE953;
    HI_U32 len = 4;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_SEC_WORD, (HI_U8 *)&data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetIDWordLockFlag(HI_BOOL *pbLock)
{
    HI_BOOL lock = HI_FALSE;

    CHECK_NULL_PTR(pbLock);
    DOFUNC_RETURN(OTP_PVItemReadLock(HI_OTP_SEC_WORD, &lock));
    *pbLock = lock;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetVendorID(HI_UNF_OTP_VENDORID_E *vendor_id)
{
    HI_U8 data = 0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(vendor_id);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_CA_VENDOR_ID, (HI_U8 *)&data, &len));
    *vendor_id = data;

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetStbSN(HI_U8 *stb_sn, HI_U32 *plen)
{
    CHECK_NULL_PTR(stb_sn);
    CHECK_NULL_PTR(plen);
    CHECK_OTP_PARAM(*plen != 4);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_STB_SN, stb_sn, plen));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetStbSN(HI_U8 *stb_sn, HI_U32 len)
{
    CHECK_NULL_PTR(stb_sn);
    CHECK_OTP_PARAM(len != 4);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_STB_SN, stb_sn, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetBootMode(HI_UNF_OTP_FLASH_TYPE_E flash_type)
{
    HI_U8 data = flash_type;
    HI_U32 len = 1;

    CHECK_OTP_PARAM(flash_type >= HI_UNF_OTP_FLASH_TYPE_BUTT);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_BOOT_MODE_SEL, &data, &len));
    return HI_SUCCESS;
}

#if defined(CHIP_TYPE_hi3716mv430)
HI_S32 HI_MPI_OTP_DisableSelfBoot(HI_VOID)
{
    HI_U8 data = 0xF;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_UART_SELF_BOOT_DISABLE, &data, &len));

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetSelfBootStat(HI_BOOL *disable)
{
    HI_U8 uart_disable = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(disable);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_UART_SELF_BOOT_DISABLE, &uart_disable, &len));

    if (uart_disable == 0x5)
    {
        *disable = HI_FALSE;
    }
    else if (uart_disable == 0xf)
    {
        *disable = HI_TRUE;
    }
    else
    {
        HI_ERR_OTP("self boot status is not expected value, uart:%x\n", uart_disable);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

#else

HI_S32 HI_MPI_OTP_DisableSelfBoot(HI_VOID)
{
    HI_U8 data = 0xF;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_USB_SELF_BOOT_DISABLE, &data, &len));
    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_UART_SELF_BOOT_DISABLE, &data, &len));

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetSelfBootStat(HI_BOOL *disable)
{
    HI_U8 usb_disable = 0x0;
    HI_U8 uart_disable = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(disable);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_USB_SELF_BOOT_DISABLE, &usb_disable, &len));
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_UART_SELF_BOOT_DISABLE, &uart_disable, &len));

    if ((usb_disable == 0x5) && (uart_disable == 0x5))
    {
        *disable = HI_FALSE;
    }
    else if ((usb_disable == 0xf) && (uart_disable == 0xf))
    {
        *disable = HI_TRUE;
    }
    else
    {
        HI_ERR_OTP("self boot status is not expected value, usb:%x, uart:%x\n", usb_disable, uart_disable);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}
#endif

HI_S32 HI_MPI_OTP_EnableBootDecrypt(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_BLOAD_DEC_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetBootDecryptStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_BLOAD_DEC_EN, &data, &len));
    *enable = data;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_EnableSCS(HI_VOID)
{
    HI_U8 data = 0xff;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_SCS_ACTIVATION, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetSCSStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_SCS_ACTIVATION, &data, &len));

    *enable = (data == 0x81) ? 0: 1;

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_EnableTrustZone(HI_VOID)
{
    HI_U8 data = 0xff;
    HI_U32 len = 1;
    HI_U32 sec_word = 0;
    HI_U32 sec_len = 4;

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_SEC_WORD, (HI_U8 *)&sec_word, &sec_len));
    if(sec_word != 0x6EDBE953)
    {
        HI_ERR_OTP("It's not secure chipset, can not enable TrustZone!\n");
        return HI_ERR_OTP_CHECK_FAILED;
    }
    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_SOC_TEE_ENABLE, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetTrustZoneStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_SOC_TEE_ENABLE, &data, &len));
    *enable = (data == 0x42) ? HI_FALSE : HI_TRUE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetMSID(HI_U8 *msid, HI_U32 *plen)
{
    CHECK_NULL_PTR(msid);
    CHECK_NULL_PTR(plen);
    CHECK_OTP_PARAM(*plen != 4);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_MSID, msid, plen));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetMSID(HI_U8 *msid, HI_U32 len)
{
    CHECK_NULL_PTR(msid);
    CHECK_OTP_PARAM(len != 4);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_MSID, msid, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetSOSMSID(HI_U8 *sos_msid, HI_U32 *plen)
{
    CHECK_NULL_PTR(sos_msid);
    CHECK_NULL_PTR(plen);
    CHECK_OTP_PARAM(*plen != 4);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_SOS_MSID, sos_msid, plen));
    return HI_SUCCESS;
 }

HI_S32 HI_MPI_OTP_SetSOSMSID(HI_U8 *sos_msid, HI_U32 len)
{
    CHECK_NULL_PTR(sos_msid);
    CHECK_OTP_PARAM(len != 4);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_SOS_MSID, sos_msid, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetLongData(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U8 * pu8Value, HI_U32 u32Length)
{
    CHECK_NULL_PTR(pFuseName);
    CHECK_NULL_PTR(pu8Value);
    CHECK_OTP_INIT();

    CHECK_OTP_PARAM(u32Length == 0);
    CHECK_OTP_PARAM( u32Offset + u32Length > OTP_FIELD_VALUE_MAX_LEN );

    DOFUNC_RETURN(OTP_DRV_PVItemIdxByName(pFuseName, strlen(pFuseName), HI_TRUE,
        pu8Value, &u32Length, HI_TRUE, u32Offset));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetLongData(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U8 * pu8Value, HI_U32 u32Length)
{
    CHECK_NULL_PTR(pFuseName);
    CHECK_NULL_PTR(pu8Value);
    CHECK_OTP_INIT();

    CHECK_OTP_PARAM(u32Length == 0);
    CHECK_OTP_PARAM( u32Offset + u32Length > OTP_FIELD_VALUE_MAX_LEN );

    DOFUNC_RETURN(OTP_DRV_PVItemIdxByName(pFuseName, strlen(pFuseName), HI_FALSE,
        pu8Value, &u32Length, HI_TRUE, u32Offset));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetLongDataLock(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U32 u32Length)
{
    HI_BOOL lock;
    CHECK_NULL_PTR(pFuseName);
    CHECK_OTP_INIT();

    CHECK_OTP_PARAM( u32Length == 0 );
    CHECK_OTP_PARAM( u32Offset + u32Length > OTP_FIELD_VALUE_MAX_LEN );
    DOFUNC_RETURN(OTP_DRV_PVItemIdxLockByName(pFuseName, strlen(pFuseName), HI_TRUE,
        &lock , u32Offset, u32Length));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetLongDataLock(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U32 u32Length, HI_U32 * pu32Lock)
{
    CHECK_NULL_PTR(pFuseName);
    CHECK_NULL_PTR(pu32Lock);
    CHECK_OTP_INIT();

    CHECK_OTP_PARAM( u32Length == 0 );
    CHECK_OTP_PARAM( u32Offset + u32Length > OTP_FIELD_VALUE_MAX_LEN );
    DOFUNC_RETURN(OTP_DRV_PVItemIdxLockByName(pFuseName, strlen(pFuseName), HI_FALSE,
            pu32Lock, u32Offset, u32Length));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_DisableDDRWakeup(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_DDR_WAKEUP_DISABLE, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetDDRWakeupStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_DDR_WAKEUP_DISABLE, &data, &len));
    *enable = data & 0x01;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_LockGlobalOTP(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_OTP_GLOBAL_LOCK_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetGlobalOTPLockStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_OTP_GLOBAL_LOCK_EN, &data, &len));
    *enable = data;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_EnableRuntimeCheck(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_RUNTIME_CHECK_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetRuntimeCheckStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_RUNTIME_CHECK_EN, &data, &len));
    *enable = data;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_DisableDDRWakeupCheck(HI_VOID)
{
    HI_U8 data = 0xa;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_WAKEUP_DDR_CHECK_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetDDRWakeupCheckStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_WAKEUP_DDR_CHECK_EN, &data, &len));
    *enable = (data == 0xa) ? HI_FALSE : HI_TRUE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_EnableDDRScramble(HI_VOID)
{
    HI_U8 data = 0xFF;
    HI_U32 len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_DDR_SCRAMBLE_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetDDRScrambleStat(HI_BOOL *enable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(enable);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_DDR_SCRAMBLE_EN, &data, &len));
    *enable = (data == 0x81) ? HI_FALSE : HI_TRUE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetPandaJtagMode(HI_UNF_OTP_JTAG_MODE_E *jtag_mode)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(jtag_mode);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_PANDA_JTAG_MODE, &data, &len));
    if (0x42 == data)
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_OPEN;
    }
    else
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_CLOSED;
    }
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetJtagMode(HI_UNF_OTP_JTAG_MODE_E *jtag_mode)
{
    HI_U8 data = 0x0;
    HI_U32 len = 1;

    CHECK_NULL_PTR(jtag_mode);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_CHIP_JTAG_PRT_MODE, &data, &len));

    if (0x42 == data)
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_OPEN;
    }
    else if (0x63 == data)
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_PROTECT;
    }
    else
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_CLOSED;
    }
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetJtagMode(HI_UNF_OTP_JTAG_MODE_E jtag_mode)
{
    HI_U8 data = 0xff;
    HI_U32 len = 1;
    HI_UNF_OTP_JTAG_MODE_E otp_jtag_mode = HI_UNF_OTP_JTAG_MODE_BUTT;

    CHECK_OTP_PARAM(jtag_mode >= HI_UNF_OTP_JTAG_MODE_BUTT);
    DOFUNC_RETURN(HI_MPI_OTP_GetJtagMode(&otp_jtag_mode));
    if(jtag_mode == otp_jtag_mode)
    {
        HI_INFO_OTP("Need not to set jtag mode again.\n");
        return HI_SUCCESS;
    }

    if(jtag_mode == HI_UNF_OTP_JTAG_MODE_OPEN)
    {
        data = 0x42;
        if(otp_jtag_mode != HI_UNF_OTP_JTAG_MODE_OPEN)
        {
            HI_FATAL_OTP("Not support set mode OPEN, jtag mode that get from otp is %d.\n", otp_jtag_mode);
            return HI_ERR_OTP_NOT_SUPPORT;
        }
    }

    if(jtag_mode == HI_UNF_OTP_JTAG_MODE_PROTECT)
    {
        data = 0x63;
        if(otp_jtag_mode == HI_UNF_OTP_JTAG_MODE_CLOSED)
        {
            HI_FATAL_OTP("Not support set mode PROTECT.\n");
            return HI_ERR_OTP_NOT_SUPPORT;
        }
    }

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_CHIP_JTAG_PRT_MODE, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetTEEJtagMode(HI_UNF_OTP_JTAG_MODE_E *jtag_mode)
{
    HI_U8 jtag_data = 0x0;
    HI_U8 tz_data   = 0x0;
    HI_U32 jtag_len = 1;
    HI_U32 tz_len   = 1;

    CHECK_NULL_PTR(jtag_mode);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TEE_JTAG_MODE, &jtag_data, &jtag_len));
    if (jtag_data >= 2)
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_CLOSED;
        return HI_SUCCESS;
    }
    else if (jtag_data == 1)
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_PROTECT;
        return HI_SUCCESS;
    }

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_SOC_TEE_ENABLE, &tz_data, &tz_len));
    if (tz_data == 1)
    {
        *jtag_mode = HI_UNF_OTP_JTAG_MODE_PROTECT;
        return HI_SUCCESS;
    }

    *jtag_mode = HI_UNF_OTP_JTAG_MODE_OPEN;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetTEEJtagMode(HI_UNF_OTP_JTAG_MODE_E jtag_mode)
{
    HI_U8 data = 0;
    HI_U32 len = 1;

    if(jtag_mode >= HI_UNF_OTP_JTAG_MODE_BUTT)
    {
        HI_ERR_OTP("Set jtag mode, parameters check failed, mode=%d.\n", jtag_mode);
        return HI_ERR_OTP_INVALID_PARA;
    }

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TEE_JTAG_MODE, &data, &len));
    if (jtag_mode < data)
    {
        HI_ERR_OTP("Fail to set tee jtag mode, set:%x, but otp is already:%x\n", (HI_U8)jtag_mode, data);
        return HI_ERR_OTP_INVALID_PARA;
    }

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TEE_JTAG_MODE, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetBootVersionID(HI_U8 *version_id, HI_U32 *plen)
{
    CHECK_NULL_PTR(version_id);
    CHECK_NULL_PTR(plen);
    CHECK_OTP_PARAM(*plen != 4);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_STB_VERSION_REF, version_id, plen));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetBootVersionID(HI_U8 *version_id, HI_U32 len)
{
    CHECK_NULL_PTR(version_id);
    CHECK_OTP_PARAM(len != 4);

    return OTP_PVItemWrite(HI_OTP_STB_VERSION_REF, version_id, &len);
}

HI_S32 HI_MPI_OTP_SetRootKey(HI_UNF_OTP_ROOTKEY_E type, HI_U8 *key, HI_U32 len)
{
    HI_U32 key_len = 16;
    HI_OTP_DATA_E id = HI_OTP_DATA_BUTT;

    CHECK_NULL_PTR(key);
    CHECK_OTP_PARAM(len != key_len);

    switch(type)
    {
        case HI_UNF_OTP_OEM_ROOTKEY:
            id = HI_OTP_OEM_ROOTKEY;
            break;
        case HI_UNF_OTP_HDCP_ROOTKEY:
            id = HI_OTP_HDCP_ROOTKEY;
            break;
        case HI_UNF_OTP_STB_ROOTKEY:
            id = HI_OTP_STB_ROOTKEY;
            break;
        case HI_UNF_OTP_SW_ROOTKEY:
            id = HI_OTP_SW_ROOTKEY;
            break;
        case HI_UNF_OTP_STBTA_ROOTKEY:
            id = HI_OTP_STB_TA_ROOTKEY;
            break;
        default:
            HI_ERR_OTP("unkonwn ROOTKEY type=%d.\n", type);
            return HI_ERR_OTP_INVALID_PARA;
    }

    if(key_len != len)
    {
        HI_ERR_OTP("error length. provide length %d, need length %d.\n", len, key_len);
        return HI_ERR_OTP_INVALID_PARA;
    }

    DOFUNC_RETURN(OTP_PVItemWrite(id, key, &key_len));
    DOFUNC_RETURN(OTP_DRV_Reset());

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetRootKeyLockStat(HI_UNF_OTP_ROOTKEY_E type, HI_BOOL *pbLock)
{
    HI_OTP_DATA_E id = HI_OTP_DATA_BUTT;
    HI_BOOL lock     = HI_FALSE;

    CHECK_NULL_PTR(pbLock);

    switch(type)
    {
        case HI_UNF_OTP_OEM_ROOTKEY:
            id = HI_OTP_OEM_ROOTKEY;
            break;
        case HI_UNF_OTP_HDCP_ROOTKEY:
            id = HI_OTP_HDCP_ROOTKEY;
            break;
        case HI_UNF_OTP_STB_ROOTKEY:
            id = HI_OTP_STB_ROOTKEY;
            break;
        case HI_UNF_OTP_SW_ROOTKEY:
            id = HI_OTP_SW_ROOTKEY;
            break;
        case HI_UNF_OTP_STBTA_ROOTKEY:
            id = HI_OTP_STB_TA_ROOTKEY;
            break;
        default:
            HI_ERR_OTP("unkonwn ROOTKEY type=%d.\n", type);
            return HI_ERR_OTP_INVALID_PARA;
    }

    DOFUNC_RETURN(OTP_PVItemReadLock(id, &lock));
    *pbLock = lock;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_BurnProductPV(HI_UNF_OTP_BURN_PV_ITEM_S *pv, HI_U32 u32Num)
{
    HI_U32 i = 0;
    HI_UNF_OTP_BURN_PV_ITEM_S *pv_item = NULL;

    CHECK_OTP_INIT();
    CHECK_NULL_PTR(pv);

    for (i = 0; i < u32Num; i++)
    {
        pv_item = pv + i;
        CHECK_OTP_PARAM(pv_item->bBurn != HI_TRUE && pv_item->bBurn != HI_FALSE);
        CHECK_OTP_PARAM(pv_item->bLock != HI_TRUE && pv_item->bLock != HI_FALSE);
        CHECK_OTP_PARAM(pv_item->u32ValueLen > OTP_FIELD_VALUE_MAX_LEN);
        CHECK_OTP_PARAM(strlen(pv_item->aszFieldName) >= OTP_FIELD_NAME_MAX_LEN);
    }

    DOFUNC_RETURN(OTP_DRV_BurnProductPV(pv, u32Num));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_VerifyProductPV(HI_UNF_OTP_BURN_PV_ITEM_S *pv, HI_U32 u32Num)
{
    HI_U32 i = 0;
    HI_UNF_OTP_BURN_PV_ITEM_S *pv_item = NULL;

    CHECK_OTP_INIT();
    CHECK_NULL_PTR(pv);

    for (i = 0; i < u32Num; i++)
    {
        pv_item = pv + i;
        CHECK_OTP_PARAM(pv_item->bBurn != HI_TRUE && pv_item->bBurn != HI_FALSE);
        CHECK_OTP_PARAM(pv_item->bLock != HI_TRUE && pv_item->bLock != HI_FALSE);
        CHECK_OTP_PARAM(pv_item->u32ValueLen > OTP_FIELD_VALUE_MAX_LEN);
        CHECK_OTP_PARAM(strlen(pv_item->aszFieldName) >= OTP_FIELD_NAME_MAX_LEN);
    }
    DOFUNC_RETURN(OTP_DRV_DebugProductPV(pv, u32Num));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetOtpFuse(HI_CHAR *field_name, HI_U32 name_len, HI_U8 *value, HI_U32 value_len)
{
    CHECK_NULL_PTR(field_name);
    CHECK_NULL_PTR(value);
    CHECK_OTP_PARAM(name_len >= OTP_FIELD_NAME_MAX_LEN || value_len > OTP_FIELD_VALUE_MAX_LEN);
    CHECK_OTP_INIT();
    DOFUNC_RETURN(OTP_DRV_PVItemByName(field_name, name_len, HI_TRUE, value, &value_len, HI_TRUE));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetOtpFuse(HI_CHAR *field_name, HI_U32 name_len, HI_U8 *value, HI_U32 value_len)
{
    CHECK_NULL_PTR(field_name);
    CHECK_NULL_PTR(value);
    CHECK_OTP_PARAM(name_len >= OTP_FIELD_NAME_MAX_LEN || value_len > OTP_FIELD_VALUE_MAX_LEN);
    CHECK_OTP_INIT();
    DOFUNC_RETURN(OTP_DRV_PVItemByName(field_name, name_len, HI_FALSE, value, &value_len, HI_TRUE));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetRSAKey(HI_U8 *pu8Key, HI_U32 u32KeyLen)
{
    HI_U8 rsakey[512] = {0};
    HI_U32 rsa_key_len = 256;
    HI_U32 rsa_exponent_len = 16;

    CHECK_NULL_PTR(pu8Key);
    CHECK_OTP_PARAM(u32KeyLen != 512);

    memcpy(rsakey, pu8Key, 512);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_RSAROOTPUBLICKEYMODULUS, rsakey, &rsa_key_len));
    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_RSAROOTPUBLICKEYEXPONENT, &rsakey[496], &rsa_exponent_len));

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetRSALockStat(HI_BOOL *pbLock)
{
    HI_BOOL lock = HI_FALSE;

    CHECK_NULL_PTR(pbLock);
    DOFUNC_RETURN(OTP_PVItemReadLock(HI_OTP_RSAROOTPUBLICKEYMODULUS, &lock));
    *pbLock = lock;

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetASCMSID (HI_U8* pu8ASCMSID, HI_U32 u32Len)
{
    CHECK_NULL_PTR(pu8ASCMSID);
    CHECK_OTP_PARAM(u32Len != 4);

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_ASC_MSID, pu8ASCMSID, &u32Len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetASCMSID(HI_U8* pu8ASCMSID, HI_U32* pu32Len)
{
    CHECK_NULL_PTR(pu8ASCMSID);
    CHECK_NULL_PTR(pu32Len);
    CHECK_OTP_PARAM(*pu32Len != 4);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_ASC_MSID, pu8ASCMSID, pu32Len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetTAIDAndMSID(const HI_UNF_OTP_TA_INDEX_E enIndex, HI_U32 u32TAID, HI_U32 u32MSID)
{
    HI_U32 len = 0x10;
    HI_U8 data[16] = {0};
    HI_S32 i = 0;
    HI_S32 tan_smid = 0;

    CHECK_OTP_PARAM(enIndex >= HI_UNF_OTP_TA_INDEX_BUTT);

    tan_smid = TAN_ID_DATA_E(enIndex);
    for (i = 0; i < 4; i++)
    {
        data[i]       = (HI_U8)( (u32TAID >> i*8) & 0xFF );
        data[4 + i]  = (HI_U8)( (u32MSID >> i*8) & 0xFF );
    }

    DOFUNC_RETURN(OTP_PVItemWrite(tan_smid, data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetTAIDAndMSID(const HI_UNF_OTP_TA_INDEX_E enIndex, HI_U32* pu32TAID, HI_U32* pu32MSID)
{
    HI_U8 data[16] = {0};
    HI_U32 len = 0x10;
    HI_S32 i = 0;
    HI_S32 tan_smid = 0;

    CHECK_NULL_PTR(pu32TAID);
    CHECK_NULL_PTR(pu32MSID);
    CHECK_OTP_PARAM(enIndex >= HI_UNF_OTP_TA_INDEX_BUTT);

    tan_smid = TAN_ID_DATA_E(enIndex);
    DOFUNC_RETURN(OTP_PVItemRead(tan_smid, data, &len));

    *pu32TAID = 0x0;
    *pu32MSID = 0x0;
    for (i = 0; i < 4; i++)
    {
        *pu32TAID  |= ((data[i] & 0xFF )  << i*8 );
        *pu32MSID  |= ((data[4 + i] & 0xFF ) << i*8);
    }

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_DisableHardUART(HI_UNF_OTP_UART_TYPE_E enUartType)
{
    HI_U8 data = 0x1;
    HI_U32 len = 0x1;
    HI_OTP_DATA_E id = HI_OTP_DATA_BUTT;

    CHECK_OTP_PARAM(enUartType >= HI_UNF_OTP_BUTT);
    switch(enUartType)
    {
#if defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450) || defined(CHIP_TYPE_hi3716mv430)
        case HI_UNF_OTP_UART0:
            id = HI_OTP_HARD_UART_MCU_DISABLE;
            break;
        case HI_UNF_OTP_UART1:
        case HI_UNF_OTP_UART2:
            return HI_ERR_OTP_NOT_SUPPORT; /*Not support, return*/
        case HI_UNF_OTP_UART3:
            id = HI_OTP_HARD_UART_DISABLE;
            break;
#else
        case HI_UNF_OTP_UART0:
        case HI_UNF_OTP_UART1:
        case HI_UNF_OTP_UART2:
        case HI_UNF_OTP_UART3:
            return HI_ERR_OTP_NOT_SUPPORT; /*Not support, return*/
#endif
        default:
            HI_ERR_OTP("unkonwn UART type=%d.\n", enUartType);
            return HI_ERR_OTP_INVALID_PARA;
    }

    return OTP_PVItemWrite(id, &data, &len);
}

HI_S32 HI_MPI_OTP_GetHardUARTStat(HI_UNF_OTP_UART_TYPE_E enUartType, HI_BOOL *pbDisable)
{
    HI_U8 data = 0x0;
    HI_U32 len = 0x1;
    HI_OTP_DATA_E id = HI_OTP_DATA_BUTT;

    CHECK_OTP_PARAM(enUartType >= HI_UNF_OTP_BUTT);
    CHECK_NULL_PTR(pbDisable);
    switch(enUartType)
    {
#if defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450) || defined(CHIP_TYPE_hi3716mv430)
        case HI_UNF_OTP_UART0:
            id = HI_OTP_HARD_UART_MCU_DISABLE;
            break;
        case HI_UNF_OTP_UART1:
        case HI_UNF_OTP_UART2:
            return HI_ERR_OTP_NOT_SUPPORT; /*Not support, return*/
        case HI_UNF_OTP_UART3:
            #if defined(CHIP_TYPE_hi3716mv430)
            return HI_ERR_OTP_NOT_SUPPORT;
            #else
            id = HI_OTP_HARD_UART_DISABLE;
            #endif
            break;
#else
        case HI_UNF_OTP_UART0:
        case HI_UNF_OTP_UART1:
        case HI_UNF_OTP_UART2:
        case HI_UNF_OTP_UART3:
            return HI_ERR_OTP_NOT_SUPPORT; /*Not support, return*/
#endif
        default:
            HI_ERR_OTP("unkonwn UART type=%d.\n", enUartType);
            return HI_ERR_OTP_INVALID_PARA;
    }

    DOFUNC_RETURN(OTP_PVItemRead(id, &data, &len));
    *pbDisable = (data & 0x1) ? 1:0;

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetTEECtrlLock(HI_VOID)
{
    DOFUNC_RETURN(OTP_PVItemWriteLock(HI_OTP_SOC_TEE_ENABLE));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetTEECtrlLock(HI_BOOL* pbTEEEnL)
{
    HI_BOOL lock = HI_FALSE;

    CHECK_NULL_PTR(pbTEEEnL);

    DOFUNC_RETURN(OTP_PVItemReadLock(HI_OTP_SOC_TEE_ENABLE, &lock));
    *pbTEEEnL = lock;

    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_DisableTdes(HI_VOID)
{
    HI_U8   value = HI_TRUE;
    HI_U32  value_len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TS_TDES_DISABLE, &value, &value_len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetDisableTdesStat(HI_BOOL *value)
{
    HI_U32 value_len = 1;
    HI_U8  status = 0;

    CHECK_NULL_PTR(value);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TS_TDES_DISABLE, &status, &value_len));
    *value = (0x1 == status)? HI_TRUE : HI_FALSE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_DisableSwKl(HI_VOID)
{
    HI_U8   value = HI_TRUE;
    HI_U32  value_len = 1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_SW_KL_DISABLE, &value, &value_len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetDisableSwKlStat(HI_BOOL *value)
{
    HI_U32 value_len = 1;
    HI_U8  status = 0;

    CHECK_NULL_PTR(value);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_SW_KL_DISABLE, &status, &value_len));
    *value = (0x1 == status)? HI_TRUE : HI_FALSE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetSpHardOnly(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 0x1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TS_SP_HARDONLY_EN, &data, &len));
    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TS_CIPLUS_HARDONLY_EN, &data, &len));
    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TS_SP_HARDONLY_EN_2, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetSpHardOnlyStat(HI_BOOL *status)
{
    HI_U8 data = 0x0;
    HI_U32 len = 0x1;
    HI_U8 stat_tmp = 0x00;

    CHECK_NULL_PTR(status);

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TS_SP_HARDONLY_EN, &data, &len));
    stat_tmp |= data;

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TS_CIPLUS_HARDONLY_EN, &data, &len));
    stat_tmp |= data;

    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TS_SP_HARDONLY_EN_2, &data, &len));
    stat_tmp |= data;

    *status = (0x1 == stat_tmp)? HI_TRUE : HI_FALSE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetCsa2HardOnly(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 0x1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TS_CSA2_HARDONLY_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetCsa2HardOnlyStat(HI_BOOL *status)
{
    HI_U8 data = 0x0;
    HI_U32 len = 0x1;

    CHECK_NULL_PTR(status);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TS_CSA2_HARDONLY_EN, &data, &len));
    *status = (0x1 == data)? HI_TRUE : HI_FALSE;
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_SetCsa3HardOnly(HI_VOID)
{
    HI_U8 data = 0x1;
    HI_U32 len = 0x1;

    DOFUNC_RETURN(OTP_PVItemWrite(HI_OTP_TS_CSA3_HARDONLY_EN, &data, &len));
    return HI_SUCCESS;
}

HI_S32 HI_MPI_OTP_GetCsa3HardOnlyStat(HI_BOOL *status)
{
    HI_U8 data = 0x0;
    HI_U32 len = 0x1;

    CHECK_NULL_PTR(status);
    DOFUNC_RETURN(OTP_PVItemRead(HI_OTP_TS_CSA3_HARDONLY_EN, &data, &len));
    *status = (0x1 == data)? HI_TRUE : HI_FALSE;
    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
