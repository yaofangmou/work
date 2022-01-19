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
\brief Initializes the otp module. CNcomment:��ʼ��OTPģ�� CNend
\attention \n
Before calling other functions in this file, you must call this application programming interface (API).
CNcomment �ڵ���OTPģ�������ӿ�ǰ��Ҫ�����ȵ��ñ��ӿ� CNend
\param N/A
\retval ::HI_SUCCESS  Success.   CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Failure.       CNcomment:APIϵͳ����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_Init(HI_VOID);

/**
\brief Deinitializes the otp module. CNcomment:ȥ��ʼ��OTP�豸 CNend
\attention \n
N/A
\param N/A                                        CNcomment:�ޡ� CNend
\retval ::HI_SUCCESS  Success.   CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Failure.       CNcomment:APIϵͳ����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_DeInit(HI_VOID);

/**
\brief Set stb private data, the stb private data is used by the customer to set some private data.
\brief CNcomment:���ÿͻ�˽�����ݡ� CNend
\attention \n
N/A
\param[in] u32Offset:  The offset to set the private data, should be between 0 and 15.  CNcomment:����stbprivData��ƫ�ƣ�����Ϊ0~15֮�䡣 CNend
\param[in] u8Data:  The private data to be set.                         CNcomment:��Ҫ���õ�ֵ�� CNend
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:APIϵͳ����ʧ�ܡ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_SetStbPrivData(HI_U32 u32Offset, HI_U8 u8Data);

/**
\brief Get stb private data, the stb private data is used by the customer to set some private data.
\brief CNcomment:��ȡ�ͻ�˽�����ݡ� CNend
\attention \n
N/A
\param[in] u32Offset:  The offset to get the private data, should be between 0 and 15.  CNcomment:��ȡstbprivData��ƫ�ƣ�����Ϊ0~15֮�䡣 CNend
\param[out] pu8Data:  The data read from otp.                           CNcomment:��ȡ��ֵ�� CNend
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:APIϵͳ����ʧ�ܡ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetStbPrivData(HI_U32 u32Offset, HI_U8 *pu8Data);

/**
\brief Get customer key, the customer key is used by the customer to encrypt some private data.
\brief CNcomment:��ȡcustomer key�� CNend
\attention \n
N/A
\param[in] pKey:Buffer to store the customer key read from otp.     CNcomment:�洢customer key��buffer�� CNend
\param[in] u32KeyLen:The length of buffer, must be 16bytes.             CNcomment:customer key �ĳ��ȣ�����Ϊ16�ֽڡ� CNend
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:APIϵͳ����ʧ�ܡ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetCustomerKey(HI_U8 *pKey, HI_U32 u32KeyLen);

/**
\brief Get idword lock status CNcomment:��ȡоƬ�ڲ�IDWord������־λ״̬ CNend
\attention \n
N/A
\param[out] pbLockFlag:  Point to IDWord lock status. CNcomment:ָ�����ͣ���״̬��Ϣ CNend
\retval ::HI_SUCCESS  Success.         CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Failure.         CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTPδ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetIDWordLockFlag(HI_BOOL *pbLockFlag);

/**
\brief Set the Lock of IDWord CNcomment:����IDWord����  CNend
\attention \n
None CNcomment:�� CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_LockIDWord(HI_VOID);

/**
\brief burn chipset to normal chipset CNcomment:��оƬ��д����ͨоƬ CNend
\attention \n
N/A
\retval ::HI_SUCCESS  Success.         CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Failure.         CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTPδ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_BurnToNormalChipset(HI_VOID);

/**
\brief Burn nomal chipset to secure chipset
\brief CNcomment:����ͨоƬ��д�ɰ�ȫоƬ�� CNend
\attention \n
N/A
\retval ::HI_SUCCESS  Call this API successful.                     CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.                          CNcomment:APIϵͳ����ʧ�ܡ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_BurnToSecureChipset(HI_VOID);

/**
\brief Read OTP value that specified address by word. CNcomment:��word��ʽ��ȡOTPָ����ַ��ֵ�� CNend
\attention \n
N/A
\param[in] addr: The Address of reading from OTP.       CNcomment:OTP��ַ CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS �ɹ� CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CAδ��ʼ�� CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  ��������Ƿ� CNend
\see \n
N/A
*/
HI_U32 HI_UNF_OTP_Read(HI_U32 addr);

/**
\brief Read OTP value that specified address by byte. CNcomment:���ֽڷ�ʽ��ȡOTPָ����ַ��ֵ�� CNend
\attention \n
N/A
\param[in] addr: The Address of reading from OTP.       CNcomment:OTP��ַ CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS �ɹ� CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CAδ��ʼ�� CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  ��������Ƿ� CNend
\see \n
N/A
*/
HI_U8  HI_UNF_OTP_ReadByte(HI_U32 addr);

/**
\brief Write OTP value that specified address by byte. CNcomment:���ֽڷ�ʽд��OTP�� CNend
\attention \n
N/A
\param[in] addr: The Address of writing to OTP.       CNcomment:OTP��ַ CNend
\param[in] addr: The Value of writing to OTP.       CNcomment:д��OTP��ֵ CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS �ɹ� CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CAδ��ʼ�� CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  ��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_WriteByte(HI_U32 addr, HI_U8 u8data);

/**
\brief Enable the Trust Zone. CNcomment:����Trust Zoneʹ��CNend
\attention \n
None CNcomment:�� CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_EnableTrustZone(HI_VOID);

/**
\brief Get the Trust Zone status.
CNcomment:��ȡTrustZoneʹ�ܱ�� CNend
\attention \n
None CNcomment:�� CNend
\param[out] pbEnable Point to trust zone status. CNcomment:ָ�����ͣ���ȫ����ʹ�ܱ�־λ CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_GetTrustZoneStat(HI_BOOL *pbEnable);

/**
\brief Get rsa lock status. CNcomment:��ȡRSA lock״̬ CNend
\attention \n
N/A
\param[out] pbLock: Rsa lock status.   CNcomment:ָ�����ͣ�RSA lock״̬ CNend
\retval ::HI_SUCCESS  Success.         CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Failure.         CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTPδ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetRSALockStat(HI_BOOL *pbLock);

/**
\brief Set RSA key to otp. CNcomment:��оƬ�ڲ�����RSA��Կ CNend
\attention \n
N/A
\param[in] pu8Key: Point to RSA key value.         CNcomment:ָ�����ͣ�RSA��Կ CNend
\param[in] u32KeyLen: The length of RSA key.       CNcomment:RSA��Կ���� CNend
\retval ::HI_SUCCESS Success                                            CNcomment:HI_SUCCESS �ɹ� CNend
\retval ::HI_FAILURE This API fails to be called                        CNcomment:HI_FAILURE  APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CA_NOT_INIT The advanced CA module is not initialized  CNcomment:HI_ERR_CA_NOT_INIT  CAδ��ʼ�� CNend
\retval ::HI_ERR_CA_INVALID_PARA The input parameter value is invalid   CNcomment:HI_ERR_CA_INVALID_PARA  ��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_SetRSAKey(HI_U8 *pu8Key, HI_U32 u32KeyLen);

/**
\brief Get the security startup status function. CNcomment:��ȡ��ȫ����ʹ�ܱ�� CNend
\attention \n
None CNcomment:�� CNend
\param[out] pbEnable Point to bootLoader SCS status. CNcomment:ָ�����ͣ���ȫ����ʹ�ܱ�־λ CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_GetSCSStat(HI_BOOL *pbEnable);

/**
\brief get the type of flash memory for security startup. CNcomment:��ȡ��ȫ������Flash���� CNend
\attention N/A
\param[out]  enFlashType Type of the flash memory for security startup. CNcomment: ������Flash���� CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_GetBootMode(HI_UNF_OTP_FLASH_TYPE_E *enFlashType);

/**
\brief Enable the security startup. This API should be used after the API HI_UNF_OTP_SetBootMode.
CNcomment:���ð�ȫ����ʹ�ܣ��ýӿڱ����HI_UNF_OTP_COMMON_SetBootMode����ʹ�� CNend
\attention \n
None CNcomment:�� CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_EnableSCS(HI_VOID);

/**
\brief set the type of flash memory for security startup. CNcomment:ָ����ȫ������Flash���� CNend
\attention N/A
\param[in]  enFlashType Type of the flash memory for security startup. CNcomment: ������Flash���� CNend
\retval ::HI_SUCCESS Success.  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Failure.  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTPδ��ʼ�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_OTP_SETPARAM_AGAIN The parameter has been set already. CNcomment:�ظ����� CNend
\see \n
None CNcomment:�� CNend
*/
HI_S32 HI_UNF_OTP_SetBootMode(HI_UNF_OTP_FLASH_TYPE_E enFlashType);

/**
\brief Get the serial number of the STB. CNcomment:??��??��?��oDD����Do? CNend
\attention \n
None CNcomment:?T CNend
\param[out] pu8StbSn serial number of the STB. CNcomment:????����D����??��?��oDD����Do? CNend
\param[in/out] pu32Len point to the length of serial number of the STB, current is 4. CNcomment:????����D����??��?��oDD����Do?3��?����?�̡�?�㨺?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?�̨�3�̡¨�?3��1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?�̨�3�̡¨�?����㨹 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?��3?��??�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��?��?2?��y��?���� CNend
\see \n
::HI_UNF_ADVCA_SetStbSn
*/
HI_S32 HI_UNF_OTP_GetStbSN(HI_U8 *pu8StbSN, HI_U32 *pu32Len);


/**
\brief Set the serial number of the STB. CNcomment:����???��?��oDD����Do? CNend
\attention \n
The serial number of the STB is set before delivery. The serial number can be set once only and takes effects after the STB restarts.
CNcomment:?��?��?��oD3?3�쨺������??��????��3?����??��?��?��?����??o��????����D�� CNend
\param[in] pu8StbSn point to serial number of the STB. CNcomment:????����D����??��?��oDD����Do? CNend
\param[in] u32Len The length of serial number of the STB, current is 4. CNcomment:????����D����??��?��oDD����Do?3��?����?�̡�?�㨺?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?�̨�3�̡¨�?3��1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?�̨�3�̡¨�?����㨹 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?��3?��??�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��?��?2?��y��?���� CNend
\retval ::HI_ERR_OTP_SETPARAM_AGAIN The parameter has been set already. CNcomment:???�䨦��?? CNend
\see \n
None CNcomment:?T CNend
*/
HI_S32 HI_UNF_OTP_SetStbSN(HI_U8 *pu8StbSN, HI_U32 u32Len);


/**
\brief Get the market segment identifier. CNcomment:??��?��D3???����??  CNend
\attention \n
None CNcomment:?T CNend
\param[out] pu8MSID Point to MSID. CNcomment:????����D����?��D3???����?? CNend
\param[in/out] pu32Len Point to MSID length, current is 4. CNcomment:????����D����?��D3???����??3��?����?�̡�?��3��?����?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?�̨�3�̡¨�?3��1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?�̨�3�̡¨�?����㨹 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?��3?��??�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��?��?2?��y��?���� CNend
\see \n
::HI_UNF_ADVCA_SetMSId
*/
HI_S32 HI_UNF_OTP_GetMSID(HI_U8 *pu8MSID, HI_U32 *pu32Len);

/**
\brief Set the market segment identifier CNcomment:����??��D3???����??  CNend
\attention \n
None CNcomment:?T CNend
\param[in] pu8MSID Point to MSID. CNcomment:????����D����?��D3???����?? CNend
\param[in/out] u32MSIdLen MSID length, current is 4. CNcomment:��D3???����??3��?����?�̡�?��3��?����?4 CNend
\retval ::HI_SUCCESS Success.  CNcomment:API?�̨�3�̡¨�?3��1| CNend
\retval ::HI_FAILURE Failure.  CNcomment:API?�̨�3�̡¨�?����㨹 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized.  CNcomment:OTP?��3?��??�� CNend
\retval ::HI_ERR_OTP_INVALID_PARA The input parameter is invalid. CNcomment:��?��?2?��y��?���� CNend
\see \n
None CNcomment:?T CNend
*/
HI_S32 HI_UNF_OTP_SetMSID(HI_U8 *pu8MSID, HI_U32 u32Len);

/**
\brief Get CA Vendor ID. CNcomment:??��???��23�쨦��������? CNend
\attention \n
N/A
\param[out] penVendorID:  CA VendorID. CNcomment:??��23�쨦��������? CNend
\retval ::HI_SUCCESS  Success.         CNcomment:API?�̨�3�̡¨�?3��1| CNend
\retval ::HI_FAILURE  Failure.         CNcomment:API?�̨�3�̡¨�?����㨹 CNend
\retval ::HI_ERR_OTP_NOT_INIT The otp module is not initialized. CNcomment:OTP?��3?��??�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_OTP_GetVendorID(HI_UNF_OTP_VENDORID_E *pu32VerdorId);

#endif

