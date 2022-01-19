/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_acc.c
  Version       : Initial Draft
  Author        :
  Created       : 2016/09/23
  Description   :

******************************************************************************/
#include "hi_type.h"
#include "hi_debug.h"
#include "hi_drv_mmz.h"
#include "hi_drv_mem.h"

#include "pq_hal_acc.h"

#define ACC_HISTGRAM_0_ADDR   0xf8ccb430
#define ACC_HISTGRAM_1_ADDR   0xf8ccb440

HI_VOID PQ_HAL_SetAccAccEn(HI_U32 u32Data, HI_U32 acc_en)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD1.bits.acc_en = acc_en;

    return;
}

HI_VOID PQ_HAL_SetAccAccMode(HI_U32 u32Data, HI_U32 acc_mode)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD1.bits.acc_mode = acc_mode;

    return;
}

HI_VOID PQ_HAL_SetAccThdMedLow(HI_U32 u32Data, HI_U32 thd_med_low)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD1.bits.thd_med_low = thd_med_low;

    return;
}

HI_VOID PQ_HAL_SetAccThdHigh(HI_U32 u32Data, HI_U32 thd_high)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD1.bits.thd_high = thd_high;

    return;
}

HI_VOID PQ_HAL_SetAccThdLow(HI_U32 u32Data, HI_U32 thd_low)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD1.bits.thd_low = thd_low;

    return;
}

HI_VOID PQ_HAL_SetAccAccRst(HI_U32 u32Data, HI_U32 acc_rst)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD2.bits.acc_rst = acc_rst;

    return;
}

HI_VOID PQ_HAL_SetAccDemoMode(HI_U32 u32Data, PQ_DEMO_MODE_E enMode)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCDEMO.bits.demo_mode = enMode;

    return;
}

HI_VOID PQ_HAL_SetAccDemoPos(HI_U32 u32Data, HI_U32 u32Pos)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCDEMO.bits.demo_split_point = u32Pos;

    return;
}

HI_VOID PQ_HAL_SetAccDemoEn(HI_U32 u32Data, HI_U32 acc_demo_en)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCDEMO.bits.demo_en = acc_demo_en;

    return;
}

HI_VOID PQ_HAL_SetAccThdMedHigh(HI_U32 u32Data, HI_U32 thd_med_high)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTHD2.bits.thd_med_high = thd_med_high;

    return;
}

HI_VOID PQ_HAL_SetAccAccPixTotal(HI_U32 u32Data, HI_U32 acc_pix_total)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACCTOTAL.bits.acc_pix_total = acc_pix_total;

    return;
}

HI_S32 PQ_HAL_SetAccPara(HI_U32 u32Data, PQ_HAL_ACC_PARA_S stAccPara)
{
    PQ_HAL_SetAccAccEn(u32Data,   stAccPara.stAccCfg.acc_en);
    PQ_HAL_SetAccAccMode(u32Data, stAccPara.stAccCfg.acc_mode);
    PQ_HAL_SetAccDemoMode(u32Data, stAccPara.stAccCfg.acc_dbg_mode);
    PQ_HAL_SetAccDemoEn(u32Data,   stAccPara.stAccCfg.acc_dbg_en);
    PQ_HAL_SetAccAccRst(u32Data,  stAccPara.stAccCfg.acc_rst);

    PQ_HAL_SetAccThdMedLow(u32Data,   stAccPara.thd_med_low);
    PQ_HAL_SetAccThdHigh(u32Data,     stAccPara.thd_high);
    PQ_HAL_SetAccThdLow(u32Data,      stAccPara.thd_low);
    PQ_HAL_SetAccThdMedHigh(u32Data,  stAccPara.thd_med_high);

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetAccTab(HI_U32 u32Data, HI_U32 *upTable)
{
    S_VDP_REGS_TYPE *pstVdpReg  = HI_NULL;


    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVdpReg);

    pstVdpReg->VHDACCLOW1.bits.low_table_data0 = upTable[0];
    pstVdpReg->VHDACCLOW1.bits.low_table_data1 = upTable[1];
    pstVdpReg->VHDACCLOW1.bits.low_table_data2 = upTable[2];

    pstVdpReg->VHDACCLOW2.bits.low_table_data3 = upTable[3];
    pstVdpReg->VHDACCLOW2.bits.low_table_data4 = upTable[4];
    pstVdpReg->VHDACCLOW2.bits.low_table_data5 = upTable[5];

    pstVdpReg->VHDACCLOW3.bits.low_table_data6 = upTable[6];
    pstVdpReg->VHDACCLOW3.bits.low_table_data7 = upTable[7];
    pstVdpReg->VHDACCLOW3.bits.low_table_data8 = upTable[8];

    pstVdpReg->VHDACCMED1.bits.mid_table_data0 = upTable[9];
    pstVdpReg->VHDACCMED1.bits.mid_table_data1 = upTable[10];
    pstVdpReg->VHDACCMED1.bits.mid_table_data2 = upTable[11];

    pstVdpReg->VHDACCMED2.bits.mid_table_data3 = upTable[12];
    pstVdpReg->VHDACCMED2.bits.mid_table_data4 = upTable[13];
    pstVdpReg->VHDACCMED2.bits.mid_table_data5 = upTable[14];

    pstVdpReg->VHDACCMED3.bits.mid_table_data6 = upTable[15];
    pstVdpReg->VHDACCMED3.bits.mid_table_data7 = upTable[16];
    pstVdpReg->VHDACCMED3.bits.mid_table_data8 = upTable[17];

    pstVdpReg->VHDACCHIGH1.bits.high_table_data0 = upTable[18];
    pstVdpReg->VHDACCHIGH1.bits.high_table_data1 = upTable[19];
    pstVdpReg->VHDACCHIGH1.bits.high_table_data2 = upTable[20];

    pstVdpReg->VHDACCHIGH2.bits.high_table_data3 = upTable[21];
    pstVdpReg->VHDACCHIGH2.bits.high_table_data4 = upTable[22];
    pstVdpReg->VHDACCHIGH2.bits.high_table_data5 = upTable[23];

    pstVdpReg->VHDACCHIGH3.bits.high_table_data6 = upTable[24];
    pstVdpReg->VHDACCHIGH3.bits.high_table_data7 = upTable[25];
    pstVdpReg->VHDACCHIGH3.bits.high_table_data8 = upTable[26];

    return HI_SUCCESS;
}


HI_S32 PQ_HAL_GetACCHistgram(ACC_HISTGRAM_S *pstACCHist)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;
    HI_S32 i;
    HI_U32 u32TempValue = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstACCHist);
    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVdpReg);

    for (i = 0; i < ACC_HISTGRAM0_SIZE; i++)
    {
        (HI_VOID)PQ_HAL_ReadRegister(0, ACC_HISTGRAM_0_ADDR + i * 4, &u32TempValue);
        pstACCHist->u32HistGram0[i] = u32TempValue;
    }

    for (i = 0; i < ACC_HISTGRAM1_SIZE; i++)
    {
        (HI_VOID)PQ_HAL_ReadRegister(0, ACC_HISTGRAM_1_ADDR + i * 4, &u32TempValue);
        pstACCHist->u32HistGram1[i] = u32TempValue;
    }

    return HI_SUCCESS;
}
