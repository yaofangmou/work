/*****************************************************************************

    Copyright (C), 2017, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : drv_hdcp.c
  Version       : Initial Draft
  Created       : 2017
  Last Modified :
  Description   :
  Function List :
  History       :
******************************************************************************/
#ifndef __DRV_HDCP_H__
#define __DRV_HDCP_H__

/*************************** Structure Definition ****************************/
/** \addtogroup     hdcp */
/** @{ */  /** <!-- [hdcp] */

/*! \hdcp capacity, 0-nonsupport, 1-support */
typedef struct
{
    u32 hdcp         : 1 ;    /*!<  Support HDCP */
}hdcp_capacity;

typedef struct
{
   u8 rx_read;       /* rx read enable or not  */
   u8 tx_read;       /* tx read enable or not  */
   u8 key_sel;       /* otp key, hisi key or cpu */
   u8 crc4;          /* crc4 of KSV[1~4] */
}hdcp_module_status;

/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API Declaration *****************************/
/** \addtogroup      hdcp */
/** @{ */  /** <!--[hdcp]*/

/**
\brief  HDCP encrypt/decrypt use AES-CBC, IV is all zero.
\param[in]  keysel Hdcp root key sel.
\param[in]  ramsel hdmi ram sel.
\param[in]  in The input data.
\param[out] out The input data.
\param[out] len The input data length, must align with 16.
\retval     On success, HI_SUCCESS is returned.  On error, HI_FAILURE is returned.
*/
s32 drv_hdcp_encrypt(hdcp_rootkey_sel keysel, hdmi_ram_sel ramsel, u32 *hostkey,
                 u32 *in, u32 *out, u32 len, u32 decrypt);

/**
\brief  get the hdcp status.
\param[out] module The hdcp status.
\retval     NA.
*/
void drv_hdcp_proc_status(hdcp_module_status *module);

/** @} */  /** <!-- ==== API declaration end ==== */

#endif
