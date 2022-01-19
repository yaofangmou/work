/******************************************************************************
 Copyright (C), 2001-2012, Hisilicon Tech. Co., Ltd.
******************************************************************************
 File Name     : mpi_otp.h
 Version       : Initial Draft
 Author        : Hisilicon multimedia software group
 Created       :
 Last Modified :
 Description   :
 Function List :
 History       :
******************************************************************************/
#ifndef __HI_MPI_OTP_V200_H__
#define __HI_MPI_OTP_V200_H__
#include <pthread.h>
#include "hi_type.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */
extern HI_S32 g_otp_dev_fd;
extern HI_S32 g_otp_open_cnt;
extern pthread_mutex_t g_otp_mutex;

#define HI_OTP_LOCK()    (HI_VOID)pthread_mutex_lock(&g_otp_mutex);
#define HI_OTP_UNLOCK()  (HI_VOID)pthread_mutex_unlock(&g_otp_mutex);

#define HI_ERR_OTP(fmt...)      HI_ERR_PRINT(HI_ID_OTP, fmt)

#define HI_LOG_PrintFuncWar(func, errcode)      HI_WARN_OTP("call %s return [0x%08X]\n", #func, errcode);
#define HI_LOG_PrintFuncErr(func, errcode)      HI_ERR_OTP("call %s return [0x%08X]\n", #func, errcode);
#define HI_LOG_PrintErrCode(errcode)            HI_ERR_OTP("error code: [0x%08X]\n", errcode);
#define HI_LOG_PrintS32(val)                    HI_ERR_OTP("%s = %d\n",        #val, val)
#define HI_LOG_PrintU32(val)                    HI_ERR_OTP("%s = %u\n",        #val, val)
#define HI_LOG_PrintS64(val)                    HI_ERR_OTP("%s = %lld\n",      #val, val)
#define HI_LOG_PrintU64(val)                    HI_ERR_OTP("%s = %llu\n",      #val, val)
#define HI_LOG_PrintH32(val)                    HI_ERR_OTP("%s = 0x%08x\n",    #val, val)
#define HI_LOG_PrintH64(val)                    HI_ERR_OTP("%s = 0x%016llx\n", #val, val)
#define HI_LOG_PrintStr(val)                    HI_ERR_OTP("%s = %s\n",        #val, val)
#define HI_LOG_PrintVoid(val)                   HI_ERR_OTP("%s = %p\n",        #val, val)
#define HI_LOG_PrintFloat(val)                  HI_ERR_OTP("%s = %f\n",        #val, val)
#define HI_LOG_PrintInfo(val)                   HI_ERR_OTP("<%s>\n", val)

#define HI_DBG_PrintS32(val)                    HI_DBG_OTP("%s = %d\n",       #val, val)
#define HI_DBG_PrintU32(val)                    HI_DBG_OTP("%s = %u\n",       #val, val)
#define HI_DBG_PrintS64(val)                    HI_DBG_OTP("%s = %lld\n",     #val, val)
#define HI_DBG_PrintU64(val)                    HI_DBG_OTP("%s = %llu\n",     #val, val)
#define HI_DBG_PrintH32(val)                    HI_DBG_OTP("%s = 0x%08X\n",   #val, val)
#define HI_DBG_PrintH64(val)                    HI_DBG_OTP("%s = 0x%016llX\n",#val, val)
#define HI_DBG_PrintStr(val)                    HI_DBG_OTP("%s = %s\n",       #val, val)
#define HI_DBG_PrintVoid(val)                   HI_DBG_OTP("%s = %p\n",       #val, val)
#define HI_DBG_PrintFloat(val)                  HI_DBG_OTP("%s = %f\n",       #val, val)
#define HI_DBG_PrintInfo(val)                   HI_DBG_OTP("<%s>\n", val)

#define CHECK_NULL_PTR(ptr)\
do{\
    if(NULL == ptr )\
    {\
        HI_LOG_PrintVoid(ptr);\
        HI_LOG_PrintErrCode(HI_ERR_OTP_PTR_NULL);\
        return HI_ERR_OTP_PTR_NULL;\
    }\
}while(0)

#define CHECK_OTP_PARAM(val) \
do{\
    if(val) \
    {\
        HI_LOG_PrintH32(val);\
        HI_LOG_PrintErrCode(HI_ERR_OTP_INVALID_PARA);\
        return HI_ERR_OTP_INVALID_PARA;\
    }\
}while(0)

#define CHECK_OTP_PARAM_GOTO(val, error) \
    do{ \
        if (val) \
        {\
            HI_LOG_PrintH32(val); \
            HI_LOG_PrintErrCode(HI_ERR_OTP_INVALID_PARA); \
            goto error; \
        }\
    }while(0)

#define CHECK_OTP_INIT()\
do{\
    HI_OTP_LOCK();\
    if (g_otp_dev_fd < 0)\
    {\
        HI_LOG_PrintH32(g_otp_dev_fd);\
        HI_OTP_UNLOCK();\
        HI_LOG_PrintErrCode(HI_ERR_OTP_NOT_INIT);\
        return HI_ERR_OTP_NOT_INIT;\
    }\
    HI_OTP_UNLOCK();\
}while(0)

#define DOFUNC_WARN( func ) \
    do {                                       \
        int ret = 0;                           \
        ret = func;                            \
        if (ret != 0){                         \
            HI_LOG_PrintFuncWar(func, ret);    \
        };                                     \
    } while (0)

#define DOFUNC_ZERO_RETURN( func ) \
    do {                                       \
        int ret = 0;                           \
        ret = func;                            \
        if (ret == 0){                         \
            HI_LOG_PrintFuncErr(func, ret);    \
            return ret;                        \
        };                                     \
    } while (0)

#define DOFUNC_RETURN( func ) \
    do {                                       \
        int ret = 0;                           \
        ret = func;                            \
        if (ret != 0){                         \
            HI_LOG_PrintFuncErr(func, ret);    \
            return ret;                        \
        };                                     \
    } while (0)

#define DOFUNC_ZERO_GOTO( func, error) \
    do {                                       \
        ret = func;                            \
        if (ret == 0) {                        \
            HI_LOG_PrintFuncErr(func, ret);    \
            goto error;                        \
        };                                     \
    } while (0)

#define DOFUNC_GOTO( func, error) \
    do {                                       \
        ret = func;                            \
        if (ret != 0) {                        \
            HI_LOG_PrintFuncErr(func, ret);    \
            goto error;                        \
        };                                     \
    } while (0)

#define CHECK_VAL_RET(val) \
    do{ \
        if (val) \
        {\
            HI_LOG_PrintH32(val); \
            HI_LOG_PrintErrCode(HI_ERR_OTP_CHECK_FAILED); \
            return HI_ERR_OTP_CHECK_FAILED;\
        }\
    }while(0)

#define CHECK_VAL_GOTO(val, error) \
    do{ \
        if (val) \
        {\
            HI_LOG_PrintH32(val); \
            HI_LOG_PrintErrCode(HI_ERR_OTP_CHECK_FAILED); \
            goto error;                            \
        }\
    }while(0)

HI_S32 HI_MPI_OTP_Init(HI_VOID);
HI_S32 HI_MPI_OTP_DeInit(HI_VOID);
HI_S32 HI_MPI_OTP_SetCustomerKey(HI_U8 *key, HI_U32 key_len);
HI_S32 HI_MPI_OTP_GetCustomerKey(HI_U8 *key, HI_U32 key_len);
HI_S32 HI_MPI_OTP_SetStbPrivData(HI_U32 offset, HI_U8 data);
HI_S32 HI_MPI_OTP_GetStbPrivData(HI_U32 offset, HI_U8 *data);
HI_S32 HI_MPI_OTP_BurnToNormalChipset(HI_VOID);
HI_S32 HI_MPI_OTP_BurnToSecureChipset(HI_VOID);
HI_S32 HI_MPI_OTP_GetVendorID(HI_UNF_OTP_VENDORID_E *vender_id);
HI_S32 HI_MPI_OTP_GetStbSN(HI_U8 *stb_sn, HI_U32 *len);
HI_S32 HI_MPI_OTP_SetStbSN(HI_U8 *stb_sn, HI_U32 len);
HI_S32 HI_MPI_OTP_SetBootMode(HI_UNF_OTP_FLASH_TYPE_E flash_type);
HI_S32 HI_MPI_OTP_DisableSelfBoot(HI_VOID);
HI_S32 HI_MPI_OTP_GetSelfBootStat(HI_BOOL *disable);
HI_S32 HI_MPI_OTP_EnableBootDecrypt(HI_VOID);
HI_S32 HI_MPI_OTP_GetBootDecryptStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_EnableSCS(HI_VOID);
HI_S32 HI_MPI_OTP_GetSCSStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_EnableTrustZone(HI_VOID);
HI_S32 HI_MPI_OTP_GetTrustZoneStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_GetMSID(HI_U8 *msid, HI_U32 *plen);
HI_S32 HI_MPI_OTP_SetMSID(HI_U8 *msid, HI_U32 len);
HI_S32 HI_MPI_OTP_GetSOSMSID(HI_U8 *sos_msid, HI_U32 *plen);
HI_S32 HI_MPI_OTP_SetSOSMSID(HI_U8 *sos_msid, HI_U32 len);
HI_S32 HI_MPI_OTP_SetLongData(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U8 * pu8Value, HI_U32 u32Length);
HI_S32 HI_MPI_OTP_GetLongData(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U8 * pu8Value, HI_U32 u32Length);
HI_S32 HI_MPI_OTP_SetLongDataLock(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U32 u32Length);
HI_S32 HI_MPI_OTP_GetLongDataLock(HI_CHAR * pFuseName, HI_U32 u32Offset, HI_U32 u32Length, HI_U32 * pu32Lock);
HI_S32 HI_MPI_OTP_DisableDDRWakeup(HI_VOID);
HI_S32 HI_MPI_OTP_GetDDRWakeupStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_LockGlobalOTP(HI_VOID);
HI_S32 HI_MPI_OTP_GetGlobalOTPLockStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_EnableRuntimeCheck(HI_VOID);
HI_S32 HI_MPI_OTP_GetRuntimeCheckStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_DisableDDRWakeupCheck(HI_VOID);
HI_S32 HI_MPI_OTP_GetDDRWakeupCheckStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_EnableDDRScramble(HI_VOID);
HI_S32 HI_MPI_OTP_GetDDRScrambleStat(HI_BOOL *enable);
HI_S32 HI_MPI_OTP_GetPandaJtagMode(HI_UNF_OTP_JTAG_MODE_E *jtag_mode);
HI_S32 HI_MPI_OTP_GetJtagMode(HI_UNF_OTP_JTAG_MODE_E *jtag_mode);
HI_S32 HI_MPI_OTP_SetJtagMode(HI_UNF_OTP_JTAG_MODE_E jtag_mode);
HI_S32 HI_MPI_OTP_GetTEEJtagMode(HI_UNF_OTP_JTAG_MODE_E *jtag_mode);
HI_S32 HI_MPI_OTP_SetTEEJtagMode(HI_UNF_OTP_JTAG_MODE_E jtag_mode);
HI_S32 HI_MPI_OTP_GetBootVersionID(HI_U8 *version_id, HI_U32 *plen);
HI_S32 HI_MPI_OTP_SetBootVersionID(HI_U8 *version_id, HI_U32 len);
HI_S32 HI_MPI_OTP_SetRootKey(HI_UNF_OTP_ROOTKEY_E type, HI_U8 *key, HI_U32 len);
HI_S32 HI_MPI_OTP_GetRootKeyLockStat(HI_UNF_OTP_ROOTKEY_E type, HI_BOOL *pbLock);
HI_S32 HI_MPI_OTP_BurnProductPV(HI_UNF_OTP_BURN_PV_ITEM_S *pv, HI_U32 u32Num);
HI_S32 HI_MPI_OTP_VerifyProductPV(HI_UNF_OTP_BURN_PV_ITEM_S *pv, HI_U32 u32Num);
HI_S32 HI_MPI_OTP_SetOtpFuse(HI_CHAR *field_name, HI_U32 name_len, HI_U8 *value, HI_U32 value_len);
HI_S32 HI_MPI_OTP_GetOtpFuse(HI_CHAR *field_name, HI_U32 name_len, HI_U8 *value, HI_U32 value_len);
HI_S32 HI_MPI_OTP_SetRSAKey(HI_U8 *pu8Key, HI_U32 u32KeyLen);
HI_S32 HI_MPI_OTP_GetRSALockStat(HI_BOOL *pbLock);
HI_S32 HI_MPI_OTP_SetASCMSID (HI_U8* pu8ASCMSID, HI_U32 u32Len);
HI_S32 HI_MPI_OTP_GetASCMSID(HI_U8* pu8ASCMSID, HI_U32* pu32Len);
HI_S32 HI_MPI_OTP_SetTAIDAndMSID(const HI_UNF_OTP_TA_INDEX_E enIndex, HI_U32 u32TAID, HI_U32 u32MSID);
HI_S32 HI_MPI_OTP_GetTAIDAndMSID(const HI_UNF_OTP_TA_INDEX_E enIndex, HI_U32* pu32TAID, HI_U32* pu32MSID);
HI_S32 HI_MPI_OTP_DisableHardUART(HI_UNF_OTP_UART_TYPE_E enUartType);
HI_S32 HI_MPI_OTP_GetHardUARTStat(HI_UNF_OTP_UART_TYPE_E enUartType, HI_BOOL *pbDisable);
HI_S32 HI_MPI_OTP_SetTEECtrlLock(HI_VOID);
HI_S32 HI_MPI_OTP_GetTEECtrlLock(HI_BOOL* pbTEEEnL);
HI_S32 HI_MPI_OTP_DisableTdes(HI_VOID);
HI_S32 HI_MPI_OTP_GetDisableTdesStat(HI_BOOL *value);
HI_S32 HI_MPI_OTP_DisableSwKl(HI_VOID);
HI_S32 HI_MPI_OTP_GetDisableSwKlStat(HI_BOOL *value);
HI_S32 HI_MPI_OTP_SetSpHardOnly(HI_VOID);
HI_S32 HI_MPI_OTP_GetSpHardOnlyStat(HI_BOOL *status);
HI_S32 HI_MPI_OTP_SetCsa2HardOnly(HI_VOID);
HI_S32 HI_MPI_OTP_GetCsa2HardOnlyStat(HI_BOOL *status);
HI_S32 HI_MPI_OTP_SetCsa3HardOnly(HI_VOID);
HI_S32 HI_MPI_OTP_GetCsa3HardOnlyStat(HI_BOOL *status);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_MPI_OTP_V200_H__ */

