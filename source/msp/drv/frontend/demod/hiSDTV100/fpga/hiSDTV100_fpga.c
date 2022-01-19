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
#include <linux/delay.h>

#include "hiSDTV100.h"
#include "hiSDTV100_config.h"
#include "hiSDTV100_fpga.h"
#include "drv_tuner_ioctl.h"
#include "drv_gpio_ext.h"
#include "drv_gpio_ssp_ext.h"
#include "drv_demod.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#ifdef HI_FPGA_SUPPORT

static const HI_U8 s_au8Ads62023Data[ADC_ADS62P23_CFG_NUM][2] =
{
    {0x00, 0x02},
    {0x10, 0xc0},
    {0x11, 0x03},
    {0x12, 0x1d},
    {0x13, 0x00},
    {0x14, 0x90},

    {0x16, 0x00},

    //{0x16, 0x15},//0x16: [2~0] out patern
    {0x17, 0x0c},//ÅäÖÃADCÔöÒæ
    {0x18, 0xe0},//0x18: [7~2] low 6bit//0xe8
    {0x19, 0x07},//0x19: [5~0] high 6bit//0x32
    {0x1a, 0x00},
    {0x1b, 0x03},
    {0x1d, 0x00},
    {0x1e, 0x00},
    {0x1f, 0x00},
    {0x20, 0x00},
    {0x21, 0x00},
    {0x22, 0x00},
    {0x23, 0x00},
    {0x24, 0x00},
    {0x25, 0x00},
    {0x26, 0x00},
    {0x27, 0x00},
    {0x28, 0x00},
    {0x29, 0x00},
    {0x2a, 0x00},
    {0x2b, 0x00},
    {0x2c, 0x00},
    {0x2d, 0x00},
    {0x2e, 0x00},
    {0x2f, 0x00},
};

#if 0
static HI_S32 PLL_AD9517_CLK_60M(GPIO_EXT_FUNC_S *pstGpioFunc)
{
    HI_S32 s32Ret = HI_SUCCESS;
    GPIOSSP_INFO_S stGpioSspInfo;
    HI_U8 au8Data[16];

    LOG_PrintDebug("PLL_AD9517_CLK_60M.\n");

    HI_TUNER_CHECKPOINTER(pstGpioFunc);

    memset(&stGpioSspInfo, 0, sizeof(GPIOSSP_INFO_S));
    memset(au8Data, 0, sizeof(HI_U8)*sizeof(au8Data)/sizeof(au8Data[0]));

    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_RS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CLK_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DIN_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DOUT_GPIO, GPIO_OUTPUT));

    /* Reset PLL_AD_9517 */
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_LOW));
    msleep(200);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_HIGH));

    /* Set PLL_AD_9517 */
    stGpioSspInfo.u32CsGpioGroup = PLL_AD_9517_CS_GROUP;
    stGpioSspInfo.u32CsGpioBit = PLL_AD_9517_CS_BIT;
    stGpioSspInfo.u32ClkGpioGroup = PLL_AD_9517_CLK_GROUP;
    stGpioSspInfo.u32ClkGpioBit = PLL_AD_9517_CLK_BIT;
    stGpioSspInfo.u32DinGpioGroup = PLL_AD_9517_DIN_GROUP;
    stGpioSspInfo.u32DinGpioBit = PLL_AD_9517_DIN_BIT;
    stGpioSspInfo.u32DoutGpioGroup = PLL_AD_9517_DOUT_GROUP;
    stGpioSspInfo.u32DoutGpioBit = PLL_AD_9517_DOUT_BIT;
    au8Data[0] = 0x00;
    au8Data[1] = 0x0;
    au8Data[2] = 0x99;
    stGpioSspInfo.u32Size = 3;
    stGpioSspInfo.pu8Data = (HI_U8 *)au8Data;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x01;
    au8Data[1] = 0x40;
    au8Data[2] = 0x42;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x00;
    au8Data[1] = 0x04;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x60;
    au8Data[1] = 0x1d;
    au8Data[2] = 0x00;
    au8Data[3] = 0x02;
    au8Data[4] = 0x00;
    au8Data[5] = 0x00;
    au8Data[6] = 0x00;
    au8Data[7] = 0x06;
    au8Data[8] = 0x00;
    au8Data[9] = 0x05;
    au8Data[10] = 0x00;
    au8Data[11] = 0x77;
    au8Data[12] = 0x10;
    au8Data[13] = 0x00;
    au8Data[14] = 0x0a;
    au8Data[15] = 0x7c;
    stGpioSspInfo.u32Size = 16;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x61;
    au8Data[1] = 0xa2;
    au8Data[2] = 0x00;
    au8Data[3] = 0x00;
    au8Data[4] = 0x21;
    au8Data[5] = 0x00;
    au8Data[6] = 0x10;
    au8Data[7] = 0x00;
    au8Data[8] = 0x00;
    au8Data[9] = 0x11;
    au8Data[10] = 0x00;
    au8Data[11] = 0x11;

    stGpioSspInfo.u32Size = 12;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x21;
    au8Data[1] = 0xe1;
    au8Data[2] = 0x02;
    au8Data[3] = 0x00;

    stGpioSspInfo.u32Size = 4;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x0;
    au8Data[1] = 0x18;
    au8Data[2] = 0x07;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x02;
    au8Data[1] = 0x32;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    return HI_SUCCESS;
}
static HI_S32 PLL_AD9517_CLK_41M(GPIO_EXT_FUNC_S *pstGpioFunc)
{
    HI_S32 s32Ret = HI_SUCCESS;
    GPIOSSP_INFO_S stGpioSspInfo;
    HI_U8 au8Data[16];

    LOG_PrintDebug("PLL_AD9517_CLK_41M.\n");

    HI_TUNER_CHECKPOINTER(pstGpioFunc);

    memset(&stGpioSspInfo, 0, sizeof(GPIOSSP_INFO_S));
    memset(au8Data, 0, sizeof(HI_U8)*sizeof(au8Data)/sizeof(au8Data[0]));

    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_RS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CLK_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DIN_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DOUT_GPIO, GPIO_OUTPUT));

    /* Reset PLL_AD_9517 */
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_LOW));
    msleep(200);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_HIGH));

    /* Set PLL_AD_9517 */
    stGpioSspInfo.u32CsGpioGroup = PLL_AD_9517_CS_GROUP;
    stGpioSspInfo.u32CsGpioBit = PLL_AD_9517_CS_BIT;
    stGpioSspInfo.u32ClkGpioGroup = PLL_AD_9517_CLK_GROUP;
    stGpioSspInfo.u32ClkGpioBit = PLL_AD_9517_CLK_BIT;
    stGpioSspInfo.u32DinGpioGroup = PLL_AD_9517_DIN_GROUP;
    stGpioSspInfo.u32DinGpioBit = PLL_AD_9517_DIN_BIT;
    stGpioSspInfo.u32DoutGpioGroup = PLL_AD_9517_DOUT_GROUP;
    stGpioSspInfo.u32DoutGpioBit = PLL_AD_9517_DOUT_BIT;
    au8Data[0] = 0x00;
    au8Data[1] = 0x0;
    au8Data[2] = 0x99;
    stGpioSspInfo.u32Size = 3;
    stGpioSspInfo.pu8Data = (HI_U8 *)au8Data;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x01;
    au8Data[1] = 0x40;
    au8Data[2] = 0x42;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x00;
    au8Data[1] = 0x04;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x60;
    au8Data[1] = 0x1d;
    au8Data[2] = 0x00;
    au8Data[3] = 0x02;
    au8Data[4] = 0x00;
    au8Data[5] = 0x00;
    au8Data[6] = 0x00;
    au8Data[7] = 0x06;
    au8Data[8] = 0x00;
    au8Data[9] = 0x05;
    au8Data[10] = 0x00;

    au8Data[11] = 0x7a;
    au8Data[12] = 0x14;
    au8Data[13] = 0x00;
    au8Data[14] = 0x0a;

    au8Data[15] = 0x7c;
    stGpioSspInfo.u32Size = 16;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x61;
    au8Data[1] = 0xa2;
    au8Data[2] = 0x00;
    au8Data[3] = 0x00;
    au8Data[4] = 0x21;
    au8Data[5] = 0x00;
    au8Data[6] = 0x10;
    au8Data[7] = 0x00;
    au8Data[8] = 0x00;
    au8Data[9] = 0x11;
    au8Data[10] = 0x00;
    au8Data[11] = 0x22;

    stGpioSspInfo.u32Size = 12;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x21;
    au8Data[1] = 0xe1;
    au8Data[2] = 0x02;
    au8Data[3] = 0x00;

    stGpioSspInfo.u32Size = 4;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x0;
    au8Data[1] = 0x18;
    au8Data[2] = 0x07;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x02;
    au8Data[1] = 0x32;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    return HI_SUCCESS;
}
#endif

static HI_S32 PLL_AD9517_CLK_45M(GPIO_EXT_FUNC_S *pstGpioFunc)
{
    HI_S32 s32Ret = HI_SUCCESS;
    GPIOSSP_INFO_S stGpioSspInfo;
    HI_U8 au8Data[16];

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstGpioFunc);

    memset(&stGpioSspInfo, 0, sizeof(GPIOSSP_INFO_S));
    memset(au8Data, 0, sizeof(HI_U8)*sizeof(au8Data)/sizeof(au8Data[0]));

    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_RS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CLK_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DIN_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DOUT_GPIO, GPIO_OUTPUT));

    /* Reset PLL_AD_9517 */
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_LOW));
    msleep(200);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_HIGH));

    /* Set PLL_AD_9517 */
    stGpioSspInfo.u32CsGpioGroup = PLL_AD_9517_CS_GROUP;
    stGpioSspInfo.u32CsGpioBit = PLL_AD_9517_CS_BIT;
    stGpioSspInfo.u32ClkGpioGroup = PLL_AD_9517_CLK_GROUP;
    stGpioSspInfo.u32ClkGpioBit = PLL_AD_9517_CLK_BIT;
    stGpioSspInfo.u32DinGpioGroup = PLL_AD_9517_DIN_GROUP;
    stGpioSspInfo.u32DinGpioBit = PLL_AD_9517_DIN_BIT;
    stGpioSspInfo.u32DoutGpioGroup = PLL_AD_9517_DOUT_GROUP;
    stGpioSspInfo.u32DoutGpioBit = PLL_AD_9517_DOUT_BIT;
    au8Data[0] = 0x00;
    au8Data[1] = 0x0;
    au8Data[2] = 0x99;
    stGpioSspInfo.u32Size = 3;
    stGpioSspInfo.pu8Data = (HI_U8 *)au8Data;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x01;
    au8Data[1] = 0x40;
    au8Data[2] = 0x42;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x00;
    au8Data[1] = 0x04;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x60;
    au8Data[1] = 0x1d;
    au8Data[2] = 0x00;
    au8Data[3] = 0x02;
    au8Data[4] = 0x00;
    au8Data[5] = 0x00;
    au8Data[6] = 0x00;
    au8Data[7] = 0x06;
    au8Data[8] = 0x00;
    au8Data[9] = 0x05;
    au8Data[10] = 0x00;
    au8Data[11] = 0x78;
    au8Data[12] = 0x14;
    au8Data[13] = 0x00;
    au8Data[14] = 0x09;
    au8Data[15] = 0x7c;
    stGpioSspInfo.u32Size = 16;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x61;
    au8Data[1] = 0xa2;
    au8Data[2] = 0x00;
    au8Data[3] = 0x00;
    au8Data[4] = 0x21;
    au8Data[5] = 0x00;
    au8Data[6] = 0x10;
    au8Data[7] = 0x00;
    au8Data[8] = 0x00;
    au8Data[9] = 0x11;
    au8Data[10] = 0x00;
    au8Data[11] = 0x22;

    stGpioSspInfo.u32Size = 12;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x21;
    au8Data[1] = 0xe1;
    au8Data[2] = 0x02;
    au8Data[3] = 0x00;

    stGpioSspInfo.u32Size = 4;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x0;
    au8Data[1] = 0x18;
    au8Data[2] = 0x07;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x02;
    au8Data[1] = 0x32;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 PLL_AD9517_CLK_30M(GPIO_EXT_FUNC_S *pstGpioFunc)
{
    HI_S32 s32Ret = HI_SUCCESS;
    GPIOSSP_INFO_S stGpioSspInfo;
    HI_U8 au8Data[16];

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstGpioFunc);

    memset(&stGpioSspInfo, 0, sizeof(GPIOSSP_INFO_S));
    memset(au8Data, 0, sizeof(HI_U8)*sizeof(au8Data)/sizeof(au8Data[0]));

    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_RS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CLK_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DIN_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DOUT_GPIO, GPIO_OUTPUT));

    /* Reset PLL_AD_9517 */
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_LOW));
    msleep(200);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_HIGH));

    /* Set PLL_AD_9517 */
    stGpioSspInfo.u32CsGpioGroup = PLL_AD_9517_CS_GROUP;
    stGpioSspInfo.u32CsGpioBit = PLL_AD_9517_CS_BIT;
    stGpioSspInfo.u32ClkGpioGroup = PLL_AD_9517_CLK_GROUP;
    stGpioSspInfo.u32ClkGpioBit = PLL_AD_9517_CLK_BIT;
    stGpioSspInfo.u32DinGpioGroup = PLL_AD_9517_DIN_GROUP;
    stGpioSspInfo.u32DinGpioBit = PLL_AD_9517_DIN_BIT;
    stGpioSspInfo.u32DoutGpioGroup = PLL_AD_9517_DOUT_GROUP;
    stGpioSspInfo.u32DoutGpioBit = PLL_AD_9517_DOUT_BIT;
    au8Data[0] = 0x00;
    au8Data[1] = 0x0;
    au8Data[2] = 0x99;
    stGpioSspInfo.u32Size = 3;
    stGpioSspInfo.pu8Data = (HI_U8 *)au8Data;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x01;
    au8Data[1] = 0x40;
    au8Data[2] = 0x42;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x00;
    au8Data[1] = 0x04;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x60;
    au8Data[1] = 0x1d;
    au8Data[2] = 0x00;
    au8Data[3] = 0x02;
    au8Data[4] = 0x00;
    au8Data[5] = 0x00;
    au8Data[6] = 0x00;
    au8Data[7] = 0x06;
    au8Data[8] = 0x00;
    au8Data[9] = 0x05;
    au8Data[10] = 0x00;

    /*change*/
    au8Data[11] = 0x82;
    au8Data[12] = 0x14;
    au8Data[13] = 0x00;
    au8Data[14] = 0x0a;

    au8Data[15] = 0x7c;
    stGpioSspInfo.u32Size = 16;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    /*change*/
    au8Data[0] = 0x61;
    au8Data[1] = 0xa2;
    au8Data[2] = 0x00;
    au8Data[3] = 0x00;
    au8Data[4] = 0x21;
    au8Data[5] = 0x00;
    au8Data[6] = 0x10;
    au8Data[7] = 0x00;
    au8Data[8] = 0x00;
    au8Data[9] = 0x22;
    au8Data[10] = 0x00;
    au8Data[11] = 0x22;

    stGpioSspInfo.u32Size = 12;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x21;
    au8Data[1] = 0xe1;
    au8Data[2] = 0x02;
    au8Data[3] = 0x00;

    stGpioSspInfo.u32Size = 4;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x0;
    au8Data[1] = 0x18;
    au8Data[2] = 0x07;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x02;
    au8Data[1] = 0x32;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    HI_FuncExit();
    return HI_SUCCESS;
}

#if 0
static HI_S32 PLL_AD9517_CLK_15M(GPIO_EXT_FUNC_S *pstGpioFunc)
{
    HI_S32 s32Ret = HI_SUCCESS;
    GPIOSSP_INFO_S stGpioSspInfo;
    HI_U8 au8Data[16];

    LOG_PrintDebug("PLL_AD9517_CLK_15M.\n");

    HI_TUNER_CHECKPOINTER(pstGpioFunc);

    memset(&stGpioSspInfo, 0, sizeof(GPIOSSP_INFO_S));
    memset(au8Data, 0, sizeof(HI_U8)*sizeof(au8Data)/sizeof(au8Data[0]));

    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_RS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_CLK_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DIN_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(PLL_AD_9517_DOUT_GPIO, GPIO_OUTPUT));

    /* Reset PLL_AD_9517 */
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_LOW));
    msleep(200);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioWriteBit(PLL_AD_9517_RS_GPIO, GPIO_HIGH));

    /* Set PLL_AD_9517 */
    stGpioSspInfo.u32CsGpioGroup = PLL_AD_9517_CS_GROUP;
    stGpioSspInfo.u32CsGpioBit = PLL_AD_9517_CS_BIT;
    stGpioSspInfo.u32ClkGpioGroup = PLL_AD_9517_CLK_GROUP;
    stGpioSspInfo.u32ClkGpioBit = PLL_AD_9517_CLK_BIT;
    stGpioSspInfo.u32DinGpioGroup = PLL_AD_9517_DIN_GROUP;
    stGpioSspInfo.u32DinGpioBit = PLL_AD_9517_DIN_BIT;
    stGpioSspInfo.u32DoutGpioGroup = PLL_AD_9517_DOUT_GROUP;
    stGpioSspInfo.u32DoutGpioBit = PLL_AD_9517_DOUT_BIT;
    au8Data[0] = 0x00;
    au8Data[1] = 0x0;
    au8Data[2] = 0x99;
    stGpioSspInfo.u32Size = 3;
    stGpioSspInfo.pu8Data = (HI_U8 *)au8Data;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x01;
    au8Data[1] = 0x40;
    au8Data[2] = 0x42;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x00;
    au8Data[1] = 0x04;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x60;
    au8Data[1] = 0x1d;
    au8Data[2] = 0x00;
    au8Data[3] = 0x02;
    au8Data[4] = 0x00;
    au8Data[5] = 0x00;
    au8Data[6] = 0x00;
    au8Data[7] = 0x06;
    au8Data[8] = 0x00;
    au8Data[9] = 0x05;
    au8Data[10] = 0x00;
    au8Data[11] = 0x86;
    au8Data[12] = 0x10;
    au8Data[13] = 0x00;
    au8Data[14] = 0x0a;
    au8Data[15] = 0x7c;
    stGpioSspInfo.u32Size = 16;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    /*change*/
    au8Data[0] = 0x61;
    au8Data[1] = 0xa2;
    au8Data[2] = 0x00;
    au8Data[3] = 0x00;
    au8Data[4] = 0x21;
    au8Data[5] = 0x00;
    au8Data[6] = 0x10;
    au8Data[7] = 0x00;
    au8Data[8] = 0x00;
    au8Data[9] = 0x22;
    au8Data[10] = 0x00;
    au8Data[11] = 0x22;

    stGpioSspInfo.u32Size = 12;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x21;
    au8Data[1] = 0xe1;
    au8Data[2] = 0x02;
    au8Data[3] = 0x02;

    stGpioSspInfo.u32Size = 4;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x0;
    au8Data[1] = 0x18;
    au8Data[2] = 0x07;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    msleep(5);

    au8Data[0] = 0x02;
    au8Data[1] = 0x32;
    au8Data[2] = 0x01;
    stGpioSspInfo.u32Size = 3;
    HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));

    return HI_SUCCESS;
}
#endif
#endif

HI_S32 HiSDTV100_FPGA_Init(HI_U32 u32TunerPort, GPIO_EXT_FUNC_S *pstGpioFunc)
{
#ifdef HI_FPGA_SUPPORT
    HI_S32 s32Ret = HI_SUCCESS;
    GPIOSSP_INFO_S stGpioSspInfo;
    HI_U32 i = 0;
    HI_U8 au8Data[16];
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstGpioFunc);

    if (HI_UNF_TUNER_SIG_TYPE_SAT == enCurrentSigType)
    {
        #if 0
        HI_TUNER_CHECK_FUNC_RET(s32Ret, PLL_AD9517_CLK_60M(pstGpioFunc));
        #else
        HI_TUNER_CHECK_FUNC_RET(s32Ret, PLL_AD9517_CLK_45M(pstGpioFunc));
        #endif
    }
    else
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, PLL_AD9517_CLK_30M(pstGpioFunc));
    }
    msleep(5);

    /* Set ADC_ADS62P23 */
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(ADC_ADS62P23_CS_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(ADC_ADS62P23_CLK_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(ADC_ADS62P23_DIN_GPIO, GPIO_OUTPUT));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, pstGpioFunc->pfnGpioDirSetBit(ADC_ADS62P23_DOUT_GPIO, GPIO_OUTPUT));

    stGpioSspInfo.u32CsGpioGroup = ADC_ADS62P23_CS_GROUP;
    stGpioSspInfo.u32CsGpioBit = ADC_ADS62P23_CS_BIT;
    stGpioSspInfo.u32ClkGpioGroup = ADC_ADS62P23_CLK_GROUP;
    stGpioSspInfo.u32ClkGpioBit = ADC_ADS62P23_CLK_BIT;
    stGpioSspInfo.u32DinGpioGroup = ADC_ADS62P23_DIN_GROUP;
    stGpioSspInfo.u32DinGpioBit = ADC_ADS62P23_DOUT_BIT;
    stGpioSspInfo.u32DoutGpioGroup = ADC_ADS62P23_DOUT_GROUP;
    stGpioSspInfo.u32DoutGpioBit = ADC_ADS62P23_DOUT_BIT;

    stGpioSspInfo.pu8Data = (HI_U8 *)au8Data;

    for (i = 0; i < ADC_ADS62P23_CFG_NUM; i++)
    {
        au8Data[0] = s_au8Ads62023Data[i][0];
        au8Data[1] = s_au8Ads62023Data[i][1];
        stGpioSspInfo.u32Size = 2;
        HI_TUNER_CHECK_FUNC_RET(s32Ret, GPIOSSP_Write(&stGpioSspInfo));
    }

    LOG_PrintInfo("Fpga pll and adc init.\n");

    /*wait to stable status*/
    msleep(25);
    HI_FuncExit();
#endif

    return HI_SUCCESS;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

