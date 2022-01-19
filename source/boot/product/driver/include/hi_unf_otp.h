/******************************************************************************

Copyright (C), 2005-2014, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hi_unf_otp.h
Version       : Initial
Author        : Hisilicon hisecurity group
Created       : 2014-09-16
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __HI_UNF_OTP_H__
#define __HI_UNF_OTP_H__

#define  HI_ERR_OTP_NOT_SUPPORT_INTERFACE         (HI_S32)(0x808F0002)

/** FLASH device types*/
typedef enum
{
    HI_UNF_OTP_FLASH_TYPE_SPI     = 0,    /**<SPI flash*/
    HI_UNF_OTP_FLASH_TYPE_NAND,           /**<nand flash*/
    HI_UNF_OTP_FLASH_TYPE_NOR,            /**<nor flash*/
    HI_UNF_OTP_FLASH_TYPE_EMMC,           /**<eMMC*/
    HI_UNF_OTP_FLASH_TYPE_SPI_NAND,       /**<spi_nand flash*/
    HI_UNF_OTP_FLASH_TYPE_SD,             /**<FSD/TSD flash*/
    HI_UNF_OTP_FLASH_TYPE_BUTT
} HI_UNF_OTP_FLASH_TYPE_E;

/** CA VendorID */
/** CA vendor id types*/
typedef enum
{
    HI_UNF_OTP_VENDORID_COMMON          = 0x00,        /**<No-Advcance CA chipset, Marked with 0*/
    HI_UNF_OTP_VENDORID_NAGRA           = 0x01,        /**<NAGRA  Chipse, Marked with R*/
    HI_UNF_OTP_VENDORID_IRDETO          = 0x02,        /**<IRDETO Chipset, Marked with I*/
    HI_UNF_OTP_VENDORID_CONAX           = 0x03,        /**<CONAX Chipset, Marked with C*/
    HI_UNF_OTP_VENDORID_NDS             = 0x04,        /**<NDS Chipset*/
    HI_UNF_OTP_VENDORID_SUMA            = 0x05,        /**<SUMA Chipset, Marked with S*/
    HI_UNF_OTP_VENDORID_NOVEL           = 0x06,        /**<NOVEL Chipset, Marked with Y*/
    HI_UNF_OTP_VENDORID_VERIMATRIX      = 0x07,        /**<VERIMATRIX Chipset, Marked with M*/
    HI_UNF_OTP_VENDORID_CTI             = 0x08,        /**<CTI Chipset, Marked with T*/
    HI_UNF_OTP_VENDORID_SAFEVIEW        = 0x09,        /**<SAFEVIEW CA Chipset*/
    HI_UNF_OTP_VENDORID_LATENSE         = 0x0a,        /**<LATENSE CA Chipset*/
    HI_UNF_OTP_VENDORID_SH_TELECOM      = 0x0b,        /**<SH_TELECOM CA Chipset*/
    HI_UNF_OTP_VENDORID_DCAS            = 0x0c,        /**<DCAS CA Chipset*/
    HI_UNF_OTP_VENDORID_VIACCESS        = 0x0d,        /**<VIACCESS CA Chipset*/
    HI_UNF_OTP_VENDORID_PANACCESS       = 0x0e,   /**<PANACCESS CA Chipset*/
    HI_UNF_OTP_VENDORID_BUTT
} HI_UNF_OTP_VENDORID_E;

/**
\brief Initializes the otp module. CNcomment:初始化OTP模块 CNend
\attention \n
Before calling other functions in this file, you must call this application programming interface (API).
CNcomment 在调用OTP模块其他接口前，要求首先调用本接口 CNend
\param N/A
\retval ::HI_SUCCESS  Success.   CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE  Failure.       CNcomment:API系统调用失败 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_Init(HI_VOID);

/**
\brief Deinitializes the otp module. CNcomment:去初始化OTP设备 CNend
\attention \n
N/A
\param N/A                                        CNcomment:无。 CNend
\retval ::HI_SUCCESS  Success.   CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE  Failure.       CNcomment:API系统调用失败 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_DeInit(HI_VOID);

/**
\brief Set stb private data, the stb private data is used by the customer to set some private data.
\brief CNcomment:设置客户私有数据。 CNend
\attention \n
N/A
\param[in] u32Offset:  The offset to set the private data, should be between 0 and 15.  CNcomment:设置stbprivData的偏移，必须为0~15之间。 CNend
\param[in] u8Data:  The private data to be set.                         CNcomment:需要设置的值。 CNend
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:API系统调用成功。 CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:API系统调用失败。 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_SetStbPrivData(HI_U32 u32Offset, HI_U8 u8Data);

/**
\brief Get stb private data, the stb private data is used by the customer to set some private data.
\brief CNcomment:获取客户私有数据。 CNend
\attention \n
N/A
\param[in] u32Offset:  The offset to get the private data, should be between 0 and 15.  CNcomment:获取stbprivData的偏移，必须为0~15之间。 CNend
\param[out] pu8Data:  The data read from otp.                           CNcomment:获取的值。 CNend
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:API系统调用成功。 CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:API系统调用失败。 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetStbPrivData(HI_U32 u32Offset, HI_U8 *pu8Data);

/**
\brief Get customer key, the customer key is used by the customer to encrypt some private data.
\brief CNcomment:获取customer key。 CNend
\attention \n
N/A
\param[in] pKey:Buffer to store the customer key read from otp.     CNcomment:存储customer key的buffer。 CNend
\param[in] u32KeyLen:The length of buffer, must be 16bytes.             CNcomment:customer key 的长度，必须为16字节。 CNend
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:API系统调用成功。 CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:API系统调用失败。 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetCustomerKey(HI_U8 *pKey, HI_U32 u32KeyLen);

/**
\brief Get idword lock status CNcomment:获取芯片内部IDWord锁定标志位状态 CNend
\attention \n
N/A
\param[out] pbLockFlag:  Point to IDWord lock status. CNcomment:指针类型，锁状态信息 CNend
\retval ::HI_SUCCESS  Success.         CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE  Failure.         CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTP未初始化 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetIDWordLockFlag(HI_BOOL *pbLockFlag);

/**
\brief Set the Lock of IDWord CNcomment:设置IDWord的锁  CNend
\attention \n
None CNcomment:无 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_LockIDWord(HI_VOID);

/**
\brief burn chipset to normal chipset CNcomment:将芯片烧写成普通芯片 CNend
\attention \n
N/A
\retval ::HI_SUCCESS  Success.         CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE  Failure.         CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTP未初始化 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_BurnToNormalChipset(HI_VOID);

/**
\brief Burn nomal chipset to secure chipset
\brief CNcomment:将普通芯片烧写成安全芯片。 CNend
\attention \n
N/A
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:API系统调用成功。 CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:API系统调用失败。 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_BurnToSecureChipset(HI_VOID);

/**
\brief Read OTP value that specified address by word. CNcomment:以word方式读取OTP指定地址的值。 CNend
\attention \n
N/A
\param[in] addr: The Address of reading from OTP.       CNcomment:OTP地址 CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS 成功 CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  API系统调用失败 CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CA未初始化 CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  输入参数非法 CNend
\see \n
N/A
*/
HI_U32 HI_UNF_OTP_Read(HI_U32 addr);

/**
\brief Read OTP value that specified address by byte. CNcomment:以字节方式读取OTP指定地址的值。 CNend
\attention \n
N/A
\param[in] addr: The Address of reading from OTP.       CNcomment:OTP地址 CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS 成功 CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  API系统调用失败 CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CA未初始化 CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  输入参数非法 CNend
\see \n
N/A
*/
HI_U8  HI_UNF_OTP_ReadByte(HI_U32 addr);

/**
\brief Write OTP value that specified address by byte. CNcomment:以字节方式写入OTP。 CNend
\attention \n
N/A
\param[in] addr: The Address of writing to OTP.       CNcomment:OTP地址 CNend
\param[in] addr: The Value of writing to OTP.       CNcomment:写入OTP的值 CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS 成功 CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  API系统调用失败 CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CA未初始化 CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  输入参数非法 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_WriteByte(HI_U32 addr, HI_U8 u8data);

/**
\brief Enable the Trust Zone. CNcomment:设置Trust Zone使能CNend
\attention \n
None CNcomment:无 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_EnableTrustZone(HI_VOID);

/**
\brief Get the Trust Zone status.
CNcomment:获取TrustZone使能标记 CNend
\attention \n
None CNcomment:无 CNend
\param[out] pbEnable Point to trust zone status. CNcomment:指针类型，安全区域使能标志位 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:输入参数非法 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_GetTrustZoneStat(HI_BOOL *pbEnable);

/**
\brief Get rsa lock status. CNcomment:获取RSA lock状态 CNend
\attention \n
N/A
\param[out] pbLock: Rsa lock status.   CNcomment:指针类型，RSA lock状态 CNend
\retval ::HI_SUCCESS  Success.         CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE  Failure.         CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTP未初始化 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetRSALockStat(HI_BOOL *pbLock);

/**
\brief Set RSA key to otp. CNcomment:向芯片内部设置RSA密钥 CNend
\attention \n
N/A
\param[in] pu8Key: Point to RSA key value.         CNcomment:指针类型，RSA密钥 CNend
\param[in] u32KeyLen: The length of RSA key.       CNcomment:RSA密钥长度 CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS 成功 CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  API系统调用失败 CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CA未初始化 CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  输入参数非法 CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_SetRSAKey(HI_U8 *pu8Key, HI_U32 u32KeyLen);

/**
\brief Get the security startup status function. CNcomment:获取安全启动使能标记 CNend
\attention \n
None CNcomment:无 CNend
\param[out] pbEnable Point to bootLoader SCS status. CNcomment:指针类型，安全启动使能标志位 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:输入参数非法 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_GetSCSStat(HI_BOOL *pbEnable);

/**
\brief get the type of flash memory for security startup. CNcomment:获取安全启动的Flash类型 CNend
\attention N/A
\param[out]  enFlashType Type of the flash memory for security startup. CNcomment: 启动的Flash类型 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:输入参数非法 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_GetBootMode(HI_UNF_OTP_FLASH_TYPE_E *enFlashType);

/**
\brief Enable the security startup. This API should be used after the API HI_UNF_OTP_SetBootMode.
CNcomment:设置安全启动使能，该接口必须和HI_UNF_OTP_COMMON_SetBootMode配套使用 CNend
\attention \n
None CNcomment:无 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_EnableSCS(HI_VOID);

/**
\brief set the type of flash memory for security startup. CNcomment:指定安全启动的Flash类型 CNend
\attention N/A
\param[in]  enFlashType Type of the flash memory for security startup. CNcomment: 启动的Flash类型 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API系统调用成功 CNend
\retval ::HI_FAILURE Failure.  CNcomment:API系统调用失败 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP未初始化 CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:输入参数非法 CNend
\retval ::HI_ERR_OTP_SETPARAM_AGAIN The parameter has been set already. CNcomment:重复设置 CNend
\see \n
None CNcomment:无 CNend
*/
HI_S32 HI_UNF_OTP_SetBootMode(HI_UNF_OTP_FLASH_TYPE_E enFlashType);

/**
\brief Get the serial number of the STB. CNcomment:??è??ú?￥oDDòáDo? CNend
\attention \n
None CNcomment:?T CNend
\param[out] pu8StbSn serial number of the STB. CNcomment:????ààDí￡??ú?￥oDDòáDo? CNend
\param[in/out] pu32Len point to the length of serial number of the STB, current is 4. CNcomment:????ààDí￡??ú?￥oDDòáDo?3¤?è￡?μ±?°ê?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?μí3μ÷ó?3é1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?μí3μ÷ó?ê§°ü CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?′3?ê??ˉ CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:ê?è?2?êy·?·¨ CNend
\see \n
::HI_UNF_ADVCA_SetStbSn
*/
HI_S32 HI_UNF_OTP_GetStbSN(HI_U8 *pu8StbSN, HI_U32 *pu32Len);


/**
\brief Set the serial number of the STB. CNcomment:éè???ú?￥oDDòáDo? CNend
\attention \n
The serial number of the STB is set before delivery. The serial number can be set once only and takes effects after the STB restarts.
CNcomment:?ú?ú?￥oD3?3§ê±éè??￡????§3?éè??ò?′?￡?éè??oó????éúD§ CNend
\param[in] pu8StbSn point to serial number of the STB. CNcomment:????ààDí￡??ú?￥oDDòáDo? CNend
\param[in] u32Len The length of serial number of the STB, current is 4. CNcomment:????ààDí￡??ú?￥oDDòáDo?3¤?è￡?μ±?°ê?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?μí3μ÷ó?3é1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?μí3μ÷ó?ê§°ü CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?′3?ê??ˉ CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:ê?è?2?êy·?·¨ CNend
\retval ::HI_ERR_OTP_SETPARAM_AGAIN The parameter has been set already. CNcomment:???′éè?? CNend
\see \n
None CNcomment:?T CNend
*/
HI_S32 HI_UNF_OTP_SetStbSN(HI_U8 *pu8StbSN, HI_U32 u32Len);


/**
\brief Get the market segment identifier. CNcomment:??è?êD3???óò??  CNend
\attention \n
None CNcomment:?T CNend
\param[out] pu8MSID Point to MSID. CNcomment:????ààDí￡?êD3???óò?? CNend
\param[in/out] pu32Len Point to MSID length, current is 4. CNcomment:????ààDí￡?êD3???óò??3¤?è￡?μ±?°3¤?èê?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?μí3μ÷ó?3é1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?μí3μ÷ó?ê§°ü CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?′3?ê??ˉ CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:ê?è?2?êy·?·¨ CNend
\see \n
::HI_UNF_ADVCA_SetMSId
*/
HI_S32 HI_UNF_OTP_GetMSID(HI_U8 *pu8MSID, HI_U32 *pu32Len);

/**
\brief Set the market segment identifier CNcomment:éè??êD3???óò??  CNend
\attention \n
None CNcomment:?T CNend
\param[in] pu8MSID Point to MSID. CNcomment:????ààDí￡?êD3???óò?? CNend
\param[in/out] u32MSIdLen MSID length, current is 4. CNcomment:êD3???óò??3¤?è￡?μ±?°3¤?èê?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?μí3μ÷ó?3é1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?μí3μ÷ó?ê§°ü CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?′3?ê??ˉ CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:ê?è?2?êy·?·¨ CNend
\see \n
None CNcomment:?T CNend
*/
HI_S32 HI_UNF_OTP_SetMSID(HI_U8 *pu8MSID, HI_U32 u32Len);

/**
\brief Get CA Vendor ID. CNcomment:??è???°23§éì±êê? CNend
\attention \n
N/A
\param[out] penVendorID:  CA VendorID. CNcomment:??°23§éì±êê? CNend
\retval ::HI_SUCCESS  Success.         CNcomment:API?μí3μ÷ó?3é1| CNend
\retval ::HI_FAILURE  Failure.         CNcomment:API?μí3μ÷ó?ê§°ü CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTP?′3?ê??ˉ CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetVendorID(HI_UNF_OTP_VENDORID_E *pu32VerdorId);

#endif

