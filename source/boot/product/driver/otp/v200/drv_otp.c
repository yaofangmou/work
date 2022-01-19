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
#include "string.h"
#include "hal_otp.h"
#include "drv_otp.h"
#include "otp_debug.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define OTP_CUSTOMER_KEY_LEN                (16)
#define OTP_SOC_TEE_ENABLE_ADDR             (0x05)
#define OTP_SEC_WORD_ADDR                   (0x60)
#define OTP_NORMAL_CHIP_VALUE               (0x2A13C812)
#define OTP_SECURE_CHIP_VALUE               (0x6EDBE953)

#define OTP_BOOT_MODE_SEL_ADDR              (0x00)
#define OTP_MSID_ADDR                       (0xE0)
#define OTP_MSID_LOCK_ADDR                  (0x144)
#define OTP_STB_SN_ADDR                     (0xE4)
#define OTP_STB_SN_LOCK_ADDR                (0x144)
#define OTP_CA_VENDOR_ID_ADDR               (0xF0)
#define OTP_SCS_ACTIVATION_ADDR             (0x50)
#define OTP_BOOT_MODE_SEL_LOCK_ADDR         (0x100)
#define OTP_SOC_TEE_ENABLE_LOCK_ADDR        (0x105)
#define OTP_RSA_PUB_KEY_EXPO_LOCK_ADDR      (0x14E)
#define OTP_RSA_PUB_KEY_MODU_LOCK_ADDR      (0x14E)
#define OTP_STB_PRIV_DATA_ADDR              (0x220)
#define OTP_CUSTOMER_KEY_ADDR               (0x230)
#define OTP_RSA_ROOT_PUB_KEY_EXPO_ADDR      (0x6F0)
#define OTP_RSA_ROOT_PUB_KEY_MODU_ADDR      (0x700)


static HI_BOOL check_otp_same(HI_U8 *p, HI_U8 *q, HI_S32 num)
{
    HI_S32 i;
    for (i = 0; i < num; i++)
    {
        if (p[i] != q[i])
        {
            return HI_FALSE;
        }
    }

    return HI_TRUE;
}

HI_S32 DRV_OTP_Init(HI_VOID)
{
    HAL_OTP_Init();
    return HI_SUCCESS;
}

HI_S32 DRV_OTP_DeInit(HI_VOID)
{
    return HI_SUCCESS;
}

HI_S32 DRV_OTP_SetStbPrivData(HI_U32 u32Offset, HI_U8 u8Data)
{
    OTP_CHECK_PARAM(u32Offset >= 16);

    return HAL_OTP_WriteByte(OTP_STB_PRIV_DATA_ADDR + u32Offset, u8Data);
}

HI_S32 DRV_OTP_GetStbPrivData(HI_U32 u32Offset, HI_U8 *pu8Data)
{
    HI_U8 value = 0;
    HI_S32 ret  = HI_FAILURE;

    OTP_CHECK_PARAM(u32Offset >= 16);
    OTP_CHECK_PARAM(HI_NULL == pu8Data);

    ret = HAL_OTP_ReadByte(OTP_STB_PRIV_DATA_ADDR + u32Offset, &value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to get stb priv data, return:%x\n", ret);
        return HI_FAILURE;
    }

    *pu8Data = value;

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetCustomerKey(HI_U8 *pKey, HI_U32 u32KeyLen)
{
    HI_U8 customerkey[OTP_CUSTOMER_KEY_LEN] = {0};
    HI_S32 ret            = HI_FAILURE;
    HI_S32 i              = 0;

    OTP_CHECK_PARAM(HI_NULL == pKey);
    OTP_CHECK_PARAM(u32KeyLen != 16);

    for (i = 0; i < 16; i++)
    {
        ret = HAL_OTP_ReadByte(OTP_CUSTOMER_KEY_ADDR + i, &customerkey[i]);
        if (HI_SUCCESS != ret)
        {
            HI_ERR_OTP("failed to get customer key, return:%x\n", ret);
            return HI_FAILURE;
        }
    }

    memcpy(pKey, customerkey, OTP_CUSTOMER_KEY_LEN);

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetIDWordLockFlag(HI_BOOL *pbLockFlag)
{
    return HI_FAILURE;
}

HI_S32 DRV_OTP_LockIDWord(HI_VOID)
{
    return HI_FAILURE;
}

HI_S32 DRV_OTP_BurnToNormalChipset(HI_VOID)
{
    HI_U32 value = OTP_NORMAL_CHIP_VALUE;
    HI_S32 ret  = HI_FAILURE;
    ret = HAL_OTP_Write(OTP_SEC_WORD_ADDR, value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Write Normal Chip otp failed, return:%x\n", ret);
        return HI_FAILURE;
    }
    return HI_SUCCESS;
}

HI_S32 DRV_OTP_BurnToSecureChipset(HI_VOID)
{
    HI_U32 value = OTP_SECURE_CHIP_VALUE;
    HI_S32 ret  = HI_FAILURE;
    ret = HAL_OTP_Write(OTP_SEC_WORD_ADDR, value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Write Secure Chip otp failed, return:%x\n", ret);
        return HI_FAILURE;
    }
    return HI_SUCCESS;
}

HI_U32 DRV_OTP_Read(HI_U32 addr)
{
    HI_U32 value = 0;
    HI_S32 ret   = HI_FAILURE;

    ret = HAL_OTP_Read(addr, &value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to read otp, return:%x\n", ret);
        return 0;
    }

    return value;
}

HI_U8 DRV_OTP_ReadByte(HI_U32 addr)
{
    HI_U8  value = 0;
    HI_S32 ret   = HI_FAILURE;

    ret = HAL_OTP_ReadByte(addr, &value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to read otp, return:%x\n", ret);
        return 0;
    }

    return value;
}

HI_S32 DRV_OTP_Write(HI_U32 addr, HI_U32 u32data)
{
    HI_S32 ret = HI_FAILURE;

    ret = HAL_OTP_Write(addr, u32data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to write otp, return:%x\n", ret);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_WriteByte(HI_U32 addr, HI_U8 u8data)
{
    HI_S32 ret = HI_FAILURE;

    ret = HAL_OTP_WriteByte(addr, u8data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to write otp, return:%x\n", ret);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetTrustZoneStat(HI_BOOL *pbEnable)
{
    HI_U8 value = 0;
    HI_S32 ret  = HI_FAILURE;

    OTP_CHECK_PARAM(HI_NULL == pbEnable);

    ret = HAL_OTP_ReadByte(OTP_SOC_TEE_ENABLE_ADDR, &value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to get tee status, return:%x\n", ret);
        return HI_FAILURE;
    }

    *pbEnable = (value == 0x42) ? HI_FALSE : HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetRSALockStat(HI_BOOL *pbLock)
{
    HI_U8 value = 0;
    HI_S32 ret  = HI_FAILURE;

    OTP_CHECK_PARAM(HI_NULL == pbLock);

    ret = HAL_OTP_ReadByte(OTP_RSA_PUB_KEY_MODU_LOCK_ADDR, &value);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to get RSA lock status, return:%x\n", ret);
        return HI_FAILURE;
    }

    if( 0x00 == (value&0x10))
    {
        *pbLock = HI_FALSE;
    }
    else
    {
        *pbLock = HI_TRUE;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_SetRSAKey(HI_U8 *pu8Key, HI_U32 u32KeyLen)
{
    HI_S32 ret = HI_FAILURE;
    HI_U8 rsakey[0x200] = {0};
    HI_BOOL islocked;
    HI_U32 index = 0;
    HI_U8 u8Tmp = 0;
    HI_U8 *ptr = NULL;

    OTP_CHECK_PARAM(u32KeyLen != 0x200);
    OTP_CHECK_PARAM(HI_NULL == pu8Key);

    memcpy( rsakey, pu8Key, 0x200 );

    /* check if rsa key is locked or not */
    ret = DRV_OTP_GetRSALockStat( &islocked );
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Failed to Get rsa key lock status, return:%x\n", ret);
        return ret;
    }
    if(HI_TRUE == islocked)
    {
        HI_ERR_OTP("RSA Key has already been locked, can not be set any more.\n");
        return HI_FAILURE;
    }

    /* check if rsa key has been set or not */
    for(index = 0; index < 0x10; index++)
    {
        ret = HAL_OTP_ReadByte(OTP_RSA_ROOT_PUB_KEY_EXPO_ADDR + index, &u8Tmp);
        if(0x00 != u8Tmp)
        {
            HI_ERR_OTP("RSA Root Public KEY Exponent have been already set.\n");
            return HI_FAILURE;
        }
    }
    for(index = 0; index < 0x100; index++)
    {
        ret = HAL_OTP_ReadByte(OTP_RSA_ROOT_PUB_KEY_MODU_ADDR + index, &u8Tmp);
        if(0x00 != u8Tmp)
        {
            HI_ERR_OTP("RSA Root Public KEY Modulus have been already set.\n");
            return HI_FAILURE;
        }
    }

    /* Set rsa key */
    ptr = rsakey;
    for(index = 0; index < 0x100; index++)
    {
        ret = HAL_OTP_WriteByte(OTP_RSA_ROOT_PUB_KEY_MODU_ADDR + index, ptr[index]);
        if(HI_SUCCESS != ret)
        {
            HI_ERR_OTP("Set RSA Root Public KEY Modulus failed ,ret:0x%x, index:0x%x.\n", ret, index);
            return HI_FAILURE;
        }
    }

    ptr = &rsakey[0x1F0];
    for(index = 0; index < 0x10; index++)
    {
        ret = HAL_OTP_WriteByte(OTP_RSA_ROOT_PUB_KEY_EXPO_ADDR + index, ptr[index]);
        if(HI_SUCCESS != ret)
        {
            HI_ERR_OTP("Set RSA Root Public KEY Exponent failed ,ret:0x%x, index:0x%x.\n", ret, index);
            return HI_FAILURE;
        }
    }

    /*Set RSA Key Lock*/
    u8Tmp = 0x18;
    ret = HAL_OTP_WriteByte(OTP_RSA_PUB_KEY_EXPO_LOCK_ADDR, u8Tmp);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Fail to write RSA lock!\n");
        return ret;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetSCSStat(HI_BOOL *pbEnable)
{
    HI_S32 ret  = HI_FAILURE;
    HI_U8 ScsAct = 0;

    OTP_CHECK_PARAM(HI_NULL == pbEnable);

    ret = HAL_OTP_ReadByte(OTP_SCS_ACTIVATION_ADDR, &ScsAct);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to get SCS Status, return:%x\n", ret);
        return HI_FAILURE;
    }

    *pbEnable = (ScsAct == 0x81) ? 0: 1;

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetBootMode(HI_UNF_OTP_FLASH_TYPE_E *enFlashType)
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8 bootMode = 0;

    OTP_CHECK_PARAM(NULL == enFlashType)

    bootMode = DRV_OTP_ReadByte(OTP_BOOT_MODE_SEL_ADDR);
    switch (bootMode)
    {
        case 0x00:
        {
            *enFlashType = HI_UNF_OTP_FLASH_TYPE_SPI;
            break;
        }
        case 0x01:
        {
            *enFlashType = HI_UNF_OTP_FLASH_TYPE_NAND;
            break;
        }
        case 0x02:
        {
            *enFlashType = HI_UNF_OTP_FLASH_TYPE_SD;
            break;
        }
        case 0x03:
        {
            *enFlashType = HI_UNF_OTP_FLASH_TYPE_EMMC;
            break;
        }
        default:
        {
            *enFlashType = HI_UNF_OTP_FLASH_TYPE_BUTT;
            break;
        }
    }

    return ret;
}

HI_S32 DRV_OTP_EnableSCS(HI_VOID)
{
    HI_U8 data = 0xFF;

    return HAL_OTP_WriteByte(OTP_SCS_ACTIVATION_ADDR, data);
}

HI_S32 DRV_OTP_SetBootMode(HI_UNF_OTP_FLASH_TYPE_E enFlashType)
{
    HI_S32 ret  = HI_FAILURE;
    HI_U8 data = 0;
    HI_U8 BootLock = 0;

    OTP_CHECK_PARAM(enFlashType >= HI_UNF_OTP_FLASH_TYPE_BUTT);

    BootLock = DRV_OTP_ReadByte(OTP_BOOT_MODE_SEL_LOCK_ADDR);
    if( 0x00 != BootLock )
    {
        HI_ERR_OTP("Boot Mode has already been locked, can not be set any more.\n");
        return HI_FAILURE;
    }

    data = enFlashType;
    ret = HAL_OTP_WriteByte(OTP_BOOT_MODE_SEL_ADDR, data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Fail to write boot sel!\n");
        return ret;
    }

    data = 0xFF;
    ret = HAL_OTP_WriteByte(OTP_BOOT_MODE_SEL_LOCK_ADDR, data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Fail to write boot sel lock!\n");
        return ret;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_EnableSocTee(HI_VOID)
{
    HI_S32 ret  = HI_FAILURE;
    HI_U8 data = 0xFF;
    HI_U32 sec_word = 0;

    ret = HAL_OTP_Read(OTP_SEC_WORD_ADDR, &sec_word);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to get sec word\n");
        return HI_FAILURE;
    }

    if (OTP_SECURE_CHIP_VALUE != sec_word)
    {
        HI_ERR_OTP("It's not secure chipset, can not enable tee!\n");
        return HI_FAILURE;
    }

    ret = HAL_OTP_WriteByte(OTP_SOC_TEE_ENABLE_ADDR, data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to enable tee.\n");
        return HI_FAILURE;
    }

    ret = HAL_OTP_WriteByte(OTP_SOC_TEE_ENABLE_LOCK_ADDR, data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to lock tee.\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetStbSN(HI_U8 *pu8StbSn, HI_U32 *pu32Len)
{
    HI_S32 i = 0;
    HI_S32 ret = HI_FAILURE;
    HI_U8  data[4] = {0};

    OTP_CHECK_PARAM(HI_NULL == pu8StbSn);
    OTP_CHECK_PARAM(HI_NULL == pu32Len);
    OTP_CHECK_PARAM(*pu32Len != 4);

    for (i = 0; i < *pu32Len; i++)
    {
        ret = HAL_OTP_ReadByte(OTP_STB_SN_ADDR + i, &data[i]);
        if (HI_SUCCESS != ret)
        {
            HI_ERR_OTP("failed to get stb sn, return:%x\n", ret);
            return HI_FAILURE;
        }
    }

    memcpy(pu8StbSn, &data, 4);

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_SetStbSN(HI_U8 *pu8StbSn, HI_U32 u32Len)
{
    HI_S32 i = 0;
    HI_S32 ret = HI_FAILURE;
    HI_U8 lock = 0;
    HI_U8 stbsn[4] = {0};

    OTP_CHECK_PARAM(HI_NULL == pu8StbSn);
    OTP_CHECK_PARAM(u32Len != 4);

    ret = HAL_OTP_ReadBitsOnebyte(OTP_STB_SN_LOCK_ADDR, 1, 1, &lock);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Failed to get stb sn lock, return:%x\n", ret);
        return ret;
    }

    if (1 == lock)
    {
        for (i = 0; i < 4; i++)
        {
            ret = HAL_OTP_ReadByte(OTP_STB_SN_ADDR + i, &stbsn[i]);
            if (HI_SUCCESS != ret)
            {
                HI_ERR_OTP("Failed to get stb sn, return:%x\n", ret);
                return ret;
            }
        }

        if (HI_TRUE == check_otp_same(stbsn, pu8StbSn, 4))
        {
            return HI_SUCCESS;
        }

        HI_ERR_OTP("stb sn has already write\n", ret);
        return HI_FAILURE;
    }

    for (i = 0; i < u32Len; i++)
    {
        ret = HAL_OTP_WriteByte(OTP_STB_SN_ADDR + i, *(pu8StbSn + i));
        if(ret != HI_SUCCESS)
        {
            HI_ERR_OTP("Read STB SN(addr %d) failed. ret=%d\n", OTP_STB_SN_ADDR + i, ret);
            return ret;
        }
    }

    HAL_OTP_WriteBitsOnebyte(OTP_STB_SN_LOCK_ADDR, 1, 1, 1);

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetMSID(HI_U8 *pu8MSID, HI_U32 *pu32Len)
{
    HI_S32 i = 0;
    HI_S32 ret = HI_FAILURE;
    HI_U8  data[4] = {0};

    OTP_CHECK_PARAM(HI_NULL == pu8MSID);
    OTP_CHECK_PARAM(HI_NULL == pu32Len);
    OTP_CHECK_PARAM(*pu32Len != 4);

    for (i = 0; i < *pu32Len; i++)
    {
        ret = HAL_OTP_ReadByte(OTP_MSID_ADDR + i, &data[i]);
        if (HI_SUCCESS != ret)
        {
            HI_ERR_OTP("failed to get msid, return:%x\n", ret);
            return HI_FAILURE;
        }
    }

    memcpy(pu8MSID, &data, 4);

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_SetMSID(HI_U8 *pu8MSID, HI_U32 u32Len)
{
    HI_S32 i = 0;
    HI_S32 ret = HI_FAILURE;
    HI_U8 lock = 0;
    HI_U8 msid[4] = {0};

    OTP_CHECK_PARAM(HI_NULL == pu8MSID);
    OTP_CHECK_PARAM(u32Len != 4);

    ret = HAL_OTP_ReadBitsOnebyte(OTP_MSID_LOCK_ADDR ,0, 1, &lock);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("Failed to get msid lock, return:%x\n", ret);
        return ret;
    }

    if (1 == lock)
    {
        for (i = 0; i < 4; i++)
        {
            ret = HAL_OTP_ReadByte(OTP_MSID_ADDR + i, &msid[i]);
            if (HI_SUCCESS != ret)
            {
                HI_ERR_OTP("Failed to get msid, return:%x\n", ret);
                return ret;
            }
        }

        if (HI_TRUE == check_otp_same(msid, pu8MSID, 4))
        {
            return HI_SUCCESS;
        }

        HI_ERR_OTP("msid has already write\n", ret);
        return HI_FAILURE;
    }

    for (i = 0; i < u32Len; i++)
    {
        ret = HAL_OTP_WriteByte(OTP_MSID_ADDR + i, *(pu8MSID + i));
        if(ret != HI_SUCCESS)
        {
            HI_ERR_OTP("Read STB SN(addr %d) failed. ret=%d\n", OTP_MSID_ADDR + i, ret);
            return ret;
        }
    }

    HAL_OTP_WriteBitsOnebyte(OTP_MSID_LOCK_ADDR, 0, 1, 1);

    return HI_SUCCESS;
}

HI_S32 DRV_OTP_GetVendorID(HI_UNF_OTP_VENDORID_E *pu32VerdorId)
{
    OTP_CHECK_PARAM(HI_NULL == pu32VerdorId);
    HI_U8 data = 0;
    HI_S32 ret = HI_FAILURE;

    OTP_CHECK_PARAM(HI_NULL == pu32VerdorId);

    ret = HAL_OTP_ReadByte(OTP_CA_VENDOR_ID_ADDR, &data);
    if (HI_SUCCESS != ret)
    {
        HI_ERR_OTP("failed to get vendor id, return:%x\n", ret);
        return HI_FAILURE;
    }

    if(data >= HI_UNF_OTP_VENDORID_BUTT)
    {
        HI_ERR_OTP("get vendor id error, vendor id:%x\n", data);
        return HI_FAILURE;
    }

    *pu32VerdorId = (HI_UNF_OTP_VENDORID_E)data;

    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
