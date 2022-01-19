/******************************************************************************

  Copyright (C), 2017-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2017/01/19
  Description   :
  History       :
  1.Date        : 2017/01/19
    Modification: Created file
******************************************************************************/
#include "drv_demod.h"
#include "tps65233.h"
#include "drv_lnbctrl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 TI_WriteReg(LNBCTRL_DEV_PARAM_S* pstParam, HI_U8 u8RegAddress, HI_U8 u8RegValue)
{
    HI_U8 enI2cChannel = 0;
    TUNER_I2C_DATA_S stI2cData = {0};
    HI_U8 au8Data[2] = {0};
    HI_U8 u8DevAddr = 0;
    HI_S32 s32Ret = HI_SUCCESS;

    enI2cChannel = pstParam->u32I2CNum;
    u8DevAddr = pstParam->u8DevAddr;

    au8Data[0] = u8RegAddress;
    au8Data[1] = u8RegValue;

    stI2cData.pu8ReceiveBuf = 0;
    stI2cData.u32ReceiveLength = 0;
    stI2cData.pu8SendBuf = au8Data;
    stI2cData.u32SendLength = 2;

    s32Ret = tuner_i2c_send_data(enI2cChannel, u8DevAddr, &stI2cData);

    return s32Ret;
}

HI_S32 TI_ReadReg(LNBCTRL_DEV_PARAM_S* pstParam, HI_U8 u8RegAddress, HI_U8 *u8RegData)
{
    HI_U8 enI2cChannel = 0;
    TUNER_I2C_DATA_S stI2cData = {0};
    HI_U8 au8Data[2] = {0};
    HI_U8 u8DevAddr = 0;
    HI_S32 s32Ret = HI_SUCCESS;

    enI2cChannel = pstParam->u32I2CNum;
    u8DevAddr = pstParam->u8DevAddr;

    au8Data[0] = u8RegAddress;
    stI2cData.pu8ReceiveBuf = &(au8Data[1]);
    stI2cData.u32ReceiveLength = 1;
    stI2cData.pu8SendBuf = au8Data;
    stI2cData.u32SendLength = 1;

    s32Ret = tuner_i2c_receive_data(enI2cChannel, u8DevAddr, &stI2cData);

    *u8RegData = au8Data[1];

    return s32Ret;
}

HI_S32 TPS65233_init(HI_U32 u32TunerPort, HI_U32 u32I2CNum, HI_U8 u8DevAddr, HI_UNF_DEMOD_DEV_TYPE_E enDemodDevType)
{
    LNBCTRL_DEV_PARAM_S* pstParam;
    //HI_S32 s32Ret = HI_SUCCESS;
    HI_U8 u8RegVal = 0;

    pstParam = lnbctrl_queue_get(u32TunerPort);
    if (HI_NULL == pstParam)
    {
        pstParam = lnbctrl_queue_insert(u32TunerPort, 1, u8DevAddr, enDemodDevType);
        if (HI_NULL == pstParam)
        {
            return HI_FAILURE;
        }
    }

    if (!pstParam->bInited)
    {
        TI_ReadReg(pstParam, TPS65233_CTRL_0, &u8RegVal);
        u8RegVal |= (0x1 << 7);
        TI_WriteReg(pstParam, TPS65233_CTRL_0, u8RegVal);

        /*Enable external tone mode*/
        TI_ReadReg(pstParam, TPS65233_CTRL_0, &u8RegVal);
        u8RegVal &= ~(0x3 << 4);
        u8RegVal &= ~(0x7 << 0);
        u8RegVal |= (0x1 << 5);
        TI_WriteReg(pstParam, TPS65233_CTRL_0, u8RegVal);

        /*Current limit set by register*/
        TI_ReadReg(pstParam, TPS65233_CTRL_1, &u8RegVal);
        u8RegVal &= ~(0x01);
        TI_WriteReg(pstParam, TPS65233_CTRL_1, u8RegVal);
    }

    return HI_SUCCESS;
}

HI_S32 TPS65233_standby(HI_U32 u32TunerPort, HI_U32 u32Standby)
{

    return HI_SUCCESS;
}

HI_S32 TPS65233_set_lnb_out(HI_U32 u32TunerPort, TUNER_LNB_OUT_E enOut)
{
    LNBCTRL_DEV_PARAM_S* pstParam;
    HI_U8 u8RegVal = 0;

    pstParam = lnbctrl_queue_get(u32TunerPort);
    if (HI_NULL == pstParam)
    {
        return HI_FAILURE;
    }

    TI_ReadReg(pstParam, TPS65233_CTRL_0, &u8RegVal);
    u8RegVal &= ~(0x7 << 0);

    switch (enOut)
    {
        case TUNER_LNB_OUT_0V:
                u8RegVal &= ~(0x1 << 3);
                break;
        case TUNER_LNB_OUT_13V:
                u8RegVal |= (0x1 << 3);
                u8RegVal |= (0x0 << 0);
                break;
        case TUNER_LNB_OUT_18V:
                //u8RegVal |= (0x1 << 2);
                u8RegVal |= (0x1 << 3);
                u8RegVal |= (0x4 << 0);
                break;
        case TUNER_LNB_OUT_14V:
                u8RegVal |= (0x1 << 3);
                u8RegVal |= (0x3 << 0);
                break;
        case TUNER_LNB_OUT_19V:
                u8RegVal |= (0x1 << 3);
                u8RegVal |= (0x7 << 0);
                break;
        default:
                HI_ERR_TUNER("enOut:%d is err.\n", enOut);
                break;
    }
    TI_WriteReg(pstParam, TPS65233_CTRL_0, u8RegVal);

    return HI_SUCCESS;
}

HI_S32 TPS65233_send_continuous_22K(HI_U32 u32TunerPort, HI_U32 u32Continuous22K)
{
    return HI_SUCCESS;
}

#if 0
HI_S32 TPS65233_Info(HI_VOID)
{
    HI_U8 u8RegVal = 0;

    TI_ReadReg(pstParam, TPS65233_STATUS, &u8RegVal);

    if(u8RegVal&(1<<0) == 1)
    {
        HI_LOG_DBG("VOUT:in range.\n");
    }
    else
    {
        HI_LOG_DBG("VOUT:out of range.\n");
    }

    if(u8RegVal&(1<<1) == 1)
    {
        HI_LOG_DBG("CABLE:>=50mA.\n");
    }
    else
    {
        HI_LOG_DBG("CABLE:<50mA.\n");
    }

    if(u8RegVal&(1<<2) == 1)
    {
        HI_LOG_DBG("Over current protection:triggered.\n");
    }
    else
    {
        HI_LOG_DBG("Over current protection:conditions released.\n");
    }

    if(u8RegVal&(1<<3) == 1)
    {
        HI_LOG_DBG("Thermal shutdown:occurs.\n");
    }
    else
    {
        HI_LOG_DBG("Thermal shutdown:does not occur.\n");
    }

    if(u8RegVal&(1<<5) == 1)
    {
        HI_LOG_DBG("Internal LDO status:on.\n");
    }
    else
    {
        HI_LOG_DBG("Internal LDO status:off.\n");
    }

    if(u8RegVal&(1<<6) == 1)
    {
        HI_LOG_DBG("Die temperature:>125.\n");
    }
    else
    {
        HI_LOG_DBG("Die temperature:<125.\n");
    }

    return HI_SUCCESS;
}
#endif

HI_S32 TPS65233_deinit(HI_U32 u32TunerPort)
{
    LNBCTRL_DEV_PARAM_S* pstParam;

    pstParam = lnbctrl_queue_get(u32TunerPort);
    if (HI_NULL == pstParam)
    {
        return HI_FAILURE;
    }

    if (pstParam->bInited)
    {
        pstParam->bInited = HI_FALSE;
    }
    lnbctrl_queue_remove(u32TunerPort);

    return HI_SUCCESS;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */
