/******************************************************************************

  Copyright (C), 2011-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :hi_drv_cipher.h
  Version       : Initial Draft
  Author        : Hisilicon hisecurity team
  Created       :
  Last Modified :
  Description   :
  Function List :
  History       :
******************************************************************************/

#ifndef __HI_DRV_CIPHER_H__
#define __HI_DRV_CIPHER_H__

#include "hi_type.h"
#include "hi_debug.h"
#include "drv_rsa.h"
#include "hi_unf_cipher.h"

#ifdef __cplusplus
extern "C" {
#endif  /* __cplusplus */

#define CIPHER_SOFT_CHAN_NUM       8
#define CIPHER_INVALID_CHN        (0xffffffff)
#define CIPHER_MAX_NODE_BUF_SIZE  (0xFFFF0)   //1M-16
#define CIPHER_MAX_RSA_KEY_LEN    (512)

#undef HI_PRINT
#define HI_PRINT                           printf
#define HI_FATAL_CIPHER(fmt...)
#define HI_ERR_CIPHER(fmt...)               HI_PRINT(fmt)
#define HI_WARN_CIPHER(fmt...)
#define HI_INFO_CIPHER(fmt...)
#define HI_DEBUG_CIPHER(fmt...)

typedef struct
{
    HI_U32  u32src;
    HI_U32  u32dest;
    HI_U32  u32length;
    HI_BOOL bDecrypt;
    HI_U32  u32DataPkg[4];
}HI_DRV_CIPHER_DATA_INFO_S;

typedef struct
{
    HI_DRV_CIPHER_DATA_INFO_S stData2Process;
    HI_U32 u32CallBackArg;
}HI_DRV_CIPHER_TASK_S;

typedef struct
{
    HI_HANDLE hCIHandle;
    HI_UNF_CIPHER_ATTS_S stCipherAtts;
}CIPHER_HANDLE_S;

typedef struct
{
    HI_HANDLE CIHandle;
    HI_U32 ScrPhyAddr;
    HI_U32 DestPhyAddr;
    HI_U32 u32DataLength;
}CIPHER_DATA_S;

typedef struct
{
    HI_HANDLE CIHandle;
    HI_U32 u32PkgNum;
    HI_UNF_CIPHER_DATA_S* pu8Pkg;
}CIPHER_PKG_S;

typedef struct
{
    HI_HANDLE CIHandle;
    HI_UNF_CIPHER_CTRL_S CIpstCtrl;
}CIPHER_Config_CTRL;

typedef struct
{
    HI_HANDLE CIHandle;
    HI_U32 u32Key[12];                              /**< Key input, EK||AK||SK for SM1 */ /**< CNcomment:输入密钥, 如果是SM1，依次存放AK||EK||SK*/
    HI_U32 u32OddKey[8];                            /**< Key input, Old Key */            /**< CNcomment:输入密钥, 奇密钥*/
    HI_U32 u32IV[4];                                /**< Initialization vector (IV) */                                                                                    /**< CNcomment:初始向量 */
    HI_BOOL bKeyByCA;                               /**< Encryption using advanced conditional access (CA) or decryption using keys */                                    /**< CNcomment:是否使用高安全CA加密或解密Key */
    HI_UNF_CIPHER_CA_TYPE_E enCaType;               /**< Select keyladder type when using advanced CA */                                                                  /**< CNcomment:使用高安全CA时,选择何种类型的keyladder */
    HI_UNF_CIPHER_ALG_E enAlg;                      /**< Cipher algorithm */                                                                                              /**< CNcomment:加密算法 */
    HI_UNF_CIPHER_BIT_WIDTH_E enBitWidth;           /**< Bit width for encryption or decryption */                                                                        /**< CNcomment:加密或解密的位宽 */
    HI_UNF_CIPHER_WORK_MODE_E enWorkMode;           /**< Operating mode */                                                                                                /**< CNcomment:工作模式 */
    HI_UNF_CIPHER_KEY_LENGTH_E enKeyLen;            /**< Key length */                                                                                                    /**< CNcomment:密钥长度 */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */    /**< CNcomment:控制信息变更选项，选项中没有标识的项默认全部变更 */
    HI_UNF_CIPHER_SM1_ROUND_E enSm1Round;           /**< SM1 round number, should be 8, 10, 12 or 14*/                                                                                                    /**< CNcomment:sm1计算的轮数配置 */
    HI_U32 u32IVLen;                                /**< IV lenght for CCM/GCM, which is an element of {4,6,8,10,12,14,16} for CCM, and is an element of [1-16] for GCM*/  /**< CNcomment: CCM/GCM的IV长度，CCM的取值范围{7, 8, 9, 10, 11, 12, 13}， GCM的取值范围[1-16]*/
    HI_U32 u32TagLen;                               /**< Tag lenght for CCM which is an element of {4,6,8,10,12,14,16}*/          /**< CNcomment: CCM的TAG长度，取值范围{4,6,8,10,12,14,16}*/
    HI_U32 u32ALen;                                 /**< Associated data for CCM and GCM*/                                        /**< CNcomment: CCM/GCM的关联数据长度*/
    HI_U32 u32APhyAddr;                             /**< Physical address of Associated data for CCM and GCM*/                                        /**< CNcomment: CCM/GCM的关联数据长度*/
}CIPHER_CONFIG_CTRL_EX;

typedef struct
{
    HI_U8  u8RefCbcMac[16];
    HI_U32 u32AppLen;
}CIPHER_CBCMAC_DATA_S;

typedef struct
{
    HI_U32 u32TimeOutUs;
    HI_U8  *pu8RandomByte;
    HI_U32 u32Bytes;
}CIPHER_RNG_S;

typedef struct
{
    HI_HANDLE CIHandle;
    HI_U32 u32TagLen;
    HI_U32 u32Tag[4];
}CIPHER_TAG_S;

HI_S32 HI_DRV_CIPHER_GetTag(CIPHER_TAG_S *pstTag);

typedef struct
{
    HI_U32 u32e[SM2_LEN_IN_WROD];
    HI_U32 u32d[SM2_LEN_IN_WROD];
    HI_U32 u32r[SM2_LEN_IN_WROD];
    HI_U32 u32s[SM2_LEN_IN_WROD];
}SM2_SIGN_DATA_S;

typedef struct
{
    HI_U32 u32e[SM2_LEN_IN_WROD];
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
    HI_U32 u32r[SM2_LEN_IN_WROD];
    HI_U32 u32s[SM2_LEN_IN_WROD];
}SM2_VERIFY_DATA_S;

typedef struct
{
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
    HI_U32 u32C1x[SM2_LEN_IN_WROD];
    HI_U32 u32C1y[SM2_LEN_IN_WROD];
    HI_U32 u32X2[SM2_LEN_IN_WROD];
    HI_U32 u32Y2[SM2_LEN_IN_WROD];
}SM2_ENC_DATA_S;

typedef struct
{
    HI_U32 u32d[SM2_LEN_IN_WROD];
    HI_U32 u32C1x[SM2_LEN_IN_WROD];
    HI_U32 u32C1y[SM2_LEN_IN_WROD];
    HI_U32 u32X2[SM2_LEN_IN_WROD];
    HI_U32 u32Y2[SM2_LEN_IN_WROD];
}SM2_DEC_DATA_S;

typedef struct
{
    HI_U32 u32d[SM2_LEN_IN_WROD];
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
}SM2_KEY_DATA_S;

#ifdef HI_SM2_SUPPORT
static const HI_U32 s_u32p[SM2_LEN_IN_WROD] =  {0xFEFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000000, 0xFFFFFFFF, 0xFFFFFFFF};
static const HI_U32 s_u32a[SM2_LEN_IN_WROD] =  {0xFEFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x00000000, 0xFFFFFFFF, 0xFCFFFFFF};
static const HI_U32 s_u32b[SM2_LEN_IN_WROD] =  {0x9EFAE928, 0x345E9F9D, 0x4B9E5A4D, 0xA70965CF, 0xF58997F3, 0x928FAB15, 0x41BDBCDD, 0x930E944D};
static const HI_U32 s_u32n[SM2_LEN_IN_WROD] =  {0xFEFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x6BDF0372, 0x2B05C621, 0x09F4BB53, 0x2341D539};
static const HI_U32 s_u32n1[SM2_LEN_IN_WROD] = {0xFEFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x6BDF0372, 0x2B05C621, 0x09F4BB53, 0x2241D539};
static const HI_U32 s_u32n2[SM2_LEN_IN_WROD] = {0xFEFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x6BDF0372, 0x2B05C621, 0x09F4BB53, 0x2141D539};
static const HI_U32 s_u32Gx[SM2_LEN_IN_WROD] = {0x2CAEC432, 0x1981191F, 0x4604995F, 0x94C9396A, 0xBF0BE38F, 0xE10B66F2, 0x89455A71, 0xC7744C33};
static const HI_U32 s_u32Gy[SM2_LEN_IN_WROD] = {0xA23637BC, 0x9C77F6F4, 0xE3CEBD59, 0x5321696B, 0x7C87A9D0, 0x40472AC6, 0xE532DF02, 0xA0F03921};
static const HI_U32 s_u32P[SM2_LEN_IN_WROD] =  {0x04000000, 0x02000000, 0x01000000, 0x01000000, 0x02000000, 0xFFFFFFFF, 0x02000000, 0x03000000};
static const HI_U32 s_u32wp[SM2_LEN_IN_WROD] = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x01000000};
static const HI_U32 s_u32N[SM2_LEN_IN_WROD] =  {0x12E4B51E, 0x3B3D2BA2, 0x4CC80F62, 0xD4E0FF3A, 0x4A506434, 0xFAA26FDE, 0xAF921190, 0x204F117C};
static const HI_U32 s_u32wn[SM2_LEN_IN_WROD] = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x889E7F32, 0x75093572};
static const HI_U32 s_u321[SM2_LEN_IN_WROD] =  {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x01000000};
static const HI_U32 s_u320[SM2_LEN_IN_WROD] =  {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
static const HI_U32 s_u32ma[SM2_LEN_IN_WROD] = {0xFBFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFCFFFFFF, 0x03000000, 0xFFFFFFFF, 0xFCFFFFFF};
static const HI_U32 s_u32mb[SM2_LEN_IN_WROD] = {0x88E10F24, 0xC8E220BA, 0x50817952, 0x3C1CA55E, 0x9A37CF71, 0xAB37B5E9, 0x6330D290, 0x42DDC02B};
static const HI_U32 s_u32m1[SM2_LEN_IN_WROD] = {0x01000000, 0x00000000, 0x00000000, 0x00000000, 0x9420fc8d, 0xd4fa39de, 0xf60b44ac, 0xddbe2ac6};
#endif

typedef enum
{
    HI_CIPHER_HMAC_KEY_FROM_CA  = 0,
    HI_CIPHER_HMAC_KEY_FROM_CPU = 1,
}CIPHER_HMAC_KEY_FROM_E;

typedef struct
{
    HI_UNF_CIPHER_HASH_TYPE_E enShaType;
    HI_U32  u32HardChn;
    CIPHER_HMAC_KEY_FROM_E enHMACKeyFrom;
    HI_U32  u32ShaVal[16];
    HI_U32  u32DataPhy;
    HI_U32  u32DataLen;
}CIPHER_HASH_DATA_S;

HI_S32 HI_DRV_CIPHER_CreateHandle(CIPHER_HANDLE_S *pstCIHandle, HI_VOID *file);
HI_S32 HI_DRV_CIPHER_ConfigChn(HI_U32 softChnId, HI_UNF_CIPHER_CTRL_S *pConfig);
HI_S32 HI_DRV_CIPHER_ConfigChnEx(HI_U32 softChnId, CIPHER_CONFIG_CTRL_EX *pConfig);
HI_S32 HI_DRV_CIPHER_GetHandleConfig(CIPHER_Config_CTRL *pstCipherConfig);
HI_S32 HI_DRV_CIPHER_GetHandleConfigEx(CIPHER_CONFIG_CTRL_EX *pstCipherConfig);
HI_S32 HI_DRV_CIPHER_DestroyHandle(HI_HANDLE hCipherchn);
HI_S32 HI_DRV_CIPHER_Encrypt(CIPHER_DATA_S *pstCIData);
HI_S32 HI_DRV_CIPHER_Decrypt(CIPHER_DATA_S *pstCIData);
HI_S32 HI_DRV_CIPHER_EncryptMulti(CIPHER_PKG_S *psPkg);
HI_S32 HI_DRV_CIPHER_DecryptMulti(CIPHER_PKG_S *psPkg);
HI_S32 HI_DRV_CIPHER_GetRandomNumber(CIPHER_RNG_S *pstRNG);
HI_S32 HI_DRV_CIPHER_SoftReset(HI_VOID);

HI_S32 HI_DRV_CIPHER_CalcHashInit(CIPHER_HASH_DATA_S *pCipherHashData);
HI_S32 HI_DRV_CIPHER_CalcHashUpdate(CIPHER_HASH_DATA_S *pCipherHashData);
HI_S32 HI_DRV_CIPHER_CalcHashFinal(CIPHER_HASH_DATA_S *pCipherHashData);

HI_S32 HI_DRV_CIPHER_CbcMacAuth(CIPHER_CBCMAC_DATA_S *pstParam);

HI_S32 HI_DRV_CIPHER_CalcRsa(CIPHER_RSA_DATA_S *pCipherRsaData);

HI_S32 HI_DRV_SM2_Sign(SM2_SIGN_DATA_S *pSm2SignData);

HI_S32 HI_DRV_SM2_Verify(SM2_VERIFY_DATA_S *pSm2VerifyData);

HI_S32 HI_DRV_SM2_Encrypt(SM2_ENC_DATA_S *pSm2EncData);

HI_S32 HI_DRV_SM2_Decrypt(SM2_DEC_DATA_S *pSm2DecData);

HI_S32 HI_DRV_SM2_Key(SM2_KEY_DATA_S *pSm2KeyData);
#ifdef __cplusplus
}
#endif  /* __cplusplus */

#endif  /* End of #ifndef __HI_DRV_CIPHER_H__*/

