/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2018/05/18
  Description   :
  History       :
  1.Date        : 2018/05/18
    Modification: Created file
******************************************************************************/
#ifndef __HISDTV100_FPGA_H__
#define __HISDTV100_FPGA_H__

#include "hi_unf_frontend.h"
#include "drv_gpio_ext.h"
#include "drv_demod.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#ifdef HI_FPGA_SUPPORT

#define ADC_ADS62P23_CFG_NUM    31
#define GPIO_OUTPUT             0
#define GPIO_INPUT              1
#define GPIO_HIGH               1
#define GPIO_LOW                0

/*AD9517(PLL) IO-->SPI*/
#define PLL_AD_9517_GPIO_GROUP 0

#define PLL_AD_9517_RS_GROUP    PLL_AD_9517_GPIO_GROUP
#define PLL_AD_9517_RS_BIT      3
#define PLL_AD_9517_RS_GPIO     (PLL_AD_9517_RS_GROUP * 8 + PLL_AD_9517_RS_BIT)

#define PLL_AD_9517_CS_GROUP    PLL_AD_9517_GPIO_GROUP
#define PLL_AD_9517_CS_BIT      7
#define PLL_AD_9517_CS_GPIO     (PLL_AD_9517_CS_GROUP * 8 + PLL_AD_9517_CS_BIT)

#define PLL_AD_9517_CLK_GROUP   PLL_AD_9517_GPIO_GROUP
#define PLL_AD_9517_CLK_BIT     4
#define PLL_AD_9517_CLK_GPIO    (PLL_AD_9517_CLK_GROUP * 8 + PLL_AD_9517_CLK_BIT)

#define PLL_AD_9517_DIN_GROUP   PLL_AD_9517_GPIO_GROUP
#define PLL_AD_9517_DIN_BIT     6
#define PLL_AD_9517_DIN_GPIO    (PLL_AD_9517_DIN_GROUP * 8 + PLL_AD_9517_DIN_BIT)

#define PLL_AD_9517_DOUT_GROUP  PLL_AD_9517_GPIO_GROUP
#define PLL_AD_9517_DOUT_BIT    5
#define PLL_AD_9517_DOUT_GPIO   (PLL_AD_9517_DOUT_GROUP * 8 + PLL_AD_9517_DOUT_BIT)

/*ADS62P23(ADC) IO-->SPI*/
#define ADC_ADS62P23_GPIO_GROUP 0

#define ADC_ADS62P23_CS_GROUP   ADC_ADS62P23_GPIO_GROUP
#define ADC_ADS62P23_CS_BIT     2
#define ADC_ADS62P23_CS_GPIO    (ADC_ADS62P23_CS_GROUP * 8 + ADC_ADS62P23_CS_BIT)

#define ADC_ADS62P23_CLK_GROUP  ADC_ADS62P23_GPIO_GROUP
#define ADC_ADS62P23_CLK_BIT    0
#define ADC_ADS62P23_CLK_GPIO   (ADC_ADS62P23_CLK_GROUP * 8 + ADC_ADS62P23_CLK_BIT)

#define ADC_ADS62P23_DIN_GROUP  ADC_ADS62P23_GPIO_GROUP
#define ADC_ADS62P23_DIN_BIT    1
#define ADC_ADS62P23_DIN_GPIO   (ADC_ADS62P23_DIN_GROUP * 8 + ADC_ADS62P23_DIN_BIT)

#define ADC_ADS62P23_DOUT_GROUP ADC_ADS62P23_GPIO_GROUP
#define ADC_ADS62P23_DOUT_BIT   1
#define ADC_ADS62P23_DOUT_GPIO  (ADC_ADS62P23_DOUT_GROUP * 8 + ADC_ADS62P23_DOUT_BIT)

#endif

HI_S32 HiSDTV100_FPGA_Init(HI_U32 u32TunerPort, GPIO_EXT_FUNC_S *pstGpioFunc);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif
