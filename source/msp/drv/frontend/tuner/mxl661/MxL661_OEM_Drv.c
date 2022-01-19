/*****************************************************************************************
 *
 * FILE NAME          : MxL661_OEM_Drv.c
 *
 * AUTHOR             : Dong Liu
 *
 * DATE CREATED       : 01/23/2011
 *
 * DESCRIPTION        : This file contains I2C driver and Sleep functins that
 *                      OEM should implement for MxL661 APIs
 *
 *****************************************************************************************
 *                Copyright (c) 2010, MaxLinear, Inc.
 ****************************************************************************************/
#include <linux/kthread.h>
#include <linux/init.h>
#include <linux/delay.h>

#include "MxL661_OEM_Drv.h"

#include "hi_type.h"
#include "drv_tuner_ioctl.h"
#include "drv_demod.h"
#include "drv_i2c_ext.h"

#include "drv_gpioi2c_ext.h"
#include "drv_gpio_ext.h"
#include "hi_drv_gpioi2c.h"
#include "mxl661.h"


//extern  HI_U32               s_u8Mxl661I2cChannel;
//extern  HI_U32               s_u32Mxl661I2cAddr;
/*----------------------------------------------------------------------------------------
--| FUNCTION NAME : MxLWare661_OEM_WriteRegister
--|
--| AUTHOR        : Brenndon Lee
--|
--| DATE CREATED  : 7/30/2009
--|
--| DESCRIPTION   : This function does I2C write operation.
--|
--| RETURN VALUE  : True or False
--|
--|-------------------------------------------------------------------------------------*/

MXL_STATUS MxLWare661_OEM_WriteRegister(UINT8 I2cSlaveAddr, UINT8 RegAddr, UINT8 RegData)
{
  //MXL_STATUS status = MXL_FALSE;

  // OEM should implement I2C write protocol that complies with MxL661 I2C
  // format.

  // 8 bit Register Write Protocol:
  // +------+-+-----+-+-+----------+-+----------+-+-+
  // |MASTER|S|SADDR|W| |RegAddr   | |RegData(L)| |P|
  // +------+-+-----+-+-+----------+-+----------+-+-+
  // |SLAVE |         |A|          |A|          |A| |
  // +------+---------+-+----------+-+----------+-+-+
  // Legends: SADDR (I2c slave address), S (Start condition), A (Ack), N(NACK),
  // P(Stop condition)
    HI_S32 s32Ret = 0;
    UINT8 pArray[2];
    TUNER_I2C_DATA_S stI2cData;

    pArray[0] = RegAddr;
    pArray[1] = RegData;

    stI2cData.pu8ReceiveBuf = NULL;
    stI2cData.u32ReceiveLength = 0;
    stI2cData.pu8SendBuf = pArray;
    stI2cData.u32SendLength = 2;
    s32Ret = tuner_i2c_send_data(s_u8Mxl661I2cChannel,s_u32Mxl661I2cAddr,&stI2cData);
    if(s32Ret != HI_SUCCESS)
    {
        HI_ERR_TUNER("i2c read error\n");
        return MXL_FALSE;
    }
    else
    {
       return MXL_TRUE;
    }
     //return status;


}

/*------------------------------------------------------------------------------
--| FUNCTION NAME : MxLWare661_OEM_ReadRegister
--|
--| AUTHOR        : Brenndon Lee
--|
--| DATE CREATED  : 7/30/2009
--|
--| DESCRIPTION   : This function does I2C read operation.
--|
--| RETURN VALUE  : True or False
--|
--|---------------------------------------------------------------------------*/

MXL_STATUS MxLWare661_OEM_ReadRegister(UINT8 I2cSlaveAddr, UINT8 RegAddr, UINT8 *DataPtr)
{
 // MXL_STATUS status = MXL_TRUE;

  // OEM should implement I2C read protocol that complies with MxL661 I2C
  // format.

  // 8 bit Register Read Protocol:
  // +------+-+-----+-+-+----+-+----------+-+-+
  // |MASTER|S|SADDR|W| |0xFB| |RegAddr   | |P|
  // +------+-+-----+-+-+----+-+----------+-+-+
  // |SLAVE |         |A|    |A|          |A| |
  // +------+-+-----+-+-+----+-+----------+-+-+
  // +------+-+-----+-+-+-----+--+-+
  // |MASTER|S|SADDR|R| |     |MN|P|
  // +------+-+-----+-+-+-----+--+-+
  // |SLAVE |         |A|Data |  | |
  // +------+---------+-+-----+--+-+
  // Legends: SADDR(I2c slave address), S(Start condition), MA(Master Ack), MN(Master NACK),
  // P(Stop condition)
   //typedef HI_S32 (*FN_I2C_READ)(HI_U32, HI_U8, HI_U32, HI_U32, HI_U8 *, HI_U32);
    HI_S32 s32Ret = 0;
    HI_U32 u32RegAddr = 0;
    UINT8 Array[2];
    
    Array[0] = 0xFB;
    Array[1] = RegAddr;

    u32RegAddr = (Array[0] << 8) + Array[1];
    
    if (HI_STD_I2C_NUM > s_u8Mxl661I2cChannel)
    {
        s32Ret = HI_DRV_I2C_Read(s_u8Mxl661I2cChannel,s_u32Mxl661I2cAddr, u32RegAddr, 2, DataPtr, 1);
    }
    else
    {
        s32Ret = HI_DRV_GPIOI2C_ReadExt(s_u8Mxl661I2cChannel,s_u32Mxl661I2cAddr, u32RegAddr, 2, DataPtr, 1);
    }
    
    if(s32Ret != HI_SUCCESS)
    {
        HI_ERR_TUNER("i2c read error\n");
        return MXL_FALSE;
    }
    else
    {
       return MXL_TRUE;
    }

}

/*------------------------------------------------------------------------------
--| FUNCTION NAME : MxLWare661_OEM_Sleep
--|
--| AUTHOR        : Dong Liu
--|
--| DATE CREATED  : 01/10/2010
--|
--| DESCRIPTION   : This function complete sleep operation. WaitTime is in ms unit
--|
--| RETURN VALUE  : None
--|
--|-------------------------------------------------------------------------------------*/

void MxLWare661_OEM_Sleep(UINT16 DelayTimeInMs)
{
  // OEM should implement sleep operation
  //DelayTimeInMs = DelayTimeInMs;
   msleep(DelayTimeInMs);
}