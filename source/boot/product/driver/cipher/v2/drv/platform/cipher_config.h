/******************************************************************************

  Copyright (C), 2017, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : cipher_config.h
  Version       : Initial Draft
  Author        : Hisilicon hisecurity team
  Created       : 2017
  Last Modified :
  Description   :
  Function List :
  History       :
******************************************************************************/
#ifndef __CIPHER_CONFIG_H_
#define __CIPHER_CONFIG_H_

#ifndef HI_TEE_SUPPORT
#define IFEP_RSA_ENABLE
#endif

#define REE_SECURE_ENABLE //REE without TEE

#if defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450) || defined(CHIP_TYPE_hi3716mv430)

#define  CIPHER_RNG_REG_BASE_ADDR_PHY           (0xF8ABC000)
#define  CIPHER_CIPHER_REG_BASE_ADDR_PHY        (0xF9A00000)
#define  CIPHER_RSA_REG_BASE_ADDR_PHY           (0xF9A30000)
#define  CIPHER_SM2_REG_BASE_ADDR_PHY           (0xF9A38000)

#define  CIPHER_RSA_CRG_ADDR_PHY                (0xF8A80060)
#define  CIPHER_SPACC_CRG_ADDR_PHY              (0XF8A22410)

#define  CIPHER_SPACC_CRG_CLK_BIT               (0)
#define  CIPHER_SPACC_CRG_RST_BIT               (1)
#define  CIPHER_RSA_CRG_CLK_BIT                 (16)
#define  CIPHER_RSA_CRG_RST_BIT                 (15)
#define  CIPHER_SM2_CRG_CLK_BIT                 (12)
#define  CIPHER_SM2_CRG_RST_BIT                 (9)

#define CIPHER_PKGxN_CHAN_MIN                   (2)
#define CIPHER_PKGxN_CHAN_MAX                   (7)
#define SPACC_CHN_MASK                          (0xFC)

#define RSA_RAND_MASK

#elif defined(CHIP_TYPE_hi3798mv310)

#define  CIPHER_RNG_REG_BASE_ADDR_PHY           (0xF8005000)
#define  CIPHER_CIPHER_REG_BASE_ADDR_PHY        (0xF9A00000)
#define  CIPHER_RSA_REG_BASE_ADDR_PHY           (0xF9A30000)
#define  CIPHER_SM2_REG_BASE_ADDR_PHY           (0xF9A38000)

#define  CIPHER_RSA_CRG_ADDR_PHY                (0xF8A80060)
#define  CIPHER_SPACC_CRG_ADDR_PHY              (0xF8A223C0)
#define  CIPHER_SM2_CRG_ADDR_PHY                (0xF8A80060)

#define  CIPHER_SPACC_CRG_CLK_BIT               (0)
#define  CIPHER_SPACC_CRG_RST_BIT               (4)
#define  CIPHER_RSA_CRG_CLK_BIT                 (16)
#define  CIPHER_RSA_CRG_RST_BIT                 (15)
#define  CIPHER_SM2_CRG_CLK_BIT                 (12)
#define  CIPHER_SM2_CRG_RST_BIT                 (9)

#define CIPHER_PKGxN_CHAN_MIN                   (1)
#define CIPHER_PKGxN_CHAN_MAX                   (7)
#define SPACC_CHN_MASK                          (0xFE)

#else
#error "Unknown chip type"
#endif

#endif

