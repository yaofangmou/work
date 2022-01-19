/******************************************************************************

  Copyright (C), 2016, Hisilicon Tech. Co., Ltd.

*******************************************************************************
  File Name     : drv_sync_stc.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 20016/9/28
  Description   :
******************************************************************************/

#include <asm/io.h>
#include <asm/div64.h>
#include <linux/delay.h>

#include "hi_drv_module.h"
#include "hi_reg_common.h"
#include "drv_ao_ext.h"
#include "drv_sync.h"
#include "drv_sync_stc.h"

#if    defined(CHIP_TYPE_hi3798cv200)  \
    || defined(CHIP_TYPE_hi3798mv200)  \
    || defined(CHIP_TYPE_hi3798mv300)  \
    || defined(CHIP_TYPE_hi3796mv200)  \
    || defined(CHIP_TYPE_hi3716mv450)

#define AIAO_SRC_PLL_HAS_CREECTED

#endif

#ifdef CHIP_TYPE_hi3716mv430
#define SYNC_STC_AUDPLL_IS_APLL
#endif

spinlock_t StcLock = __SPIN_LOCK_UNLOCKED(StcLock);

extern SYNC_GLOBAL_STATE_S  g_SyncGlobalState;

static HI_U32 g_HpllIsConfigFlg  = HI_FALSE;

#ifdef  AIAO_SRC_PLL_HAS_CREECTED
static HI_U32 g_AudPllSrcValueInt  = 0;
static HI_U32 g_AudPllSrcValueFrac = 0;
#endif

#ifdef SYNC_STC_AUDPLL_IS_APLL
HI_VOID SYNC_ReadApllFreqCtrlCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    HI_U32 CrgFbdiv;
    HI_U32 CrgFrac;

    CrgFbdiv = g_pstRegCrg->PERI_CRG_PLL1.u32;
    *pIntValue = CrgFbdiv & (0xfff);

    CrgFrac = g_pstRegCrg->PERI_CRG_PLL0.u32;
    *pFracValue = CrgFrac & (0xffffff);
}
#else
HI_VOID SYNC_ReadEpllFreqCtrlCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    HI_U32 CrgFbdiv;
    HI_U32 CrgFrac;

    CrgFbdiv = g_pstRegCrg->PERI_CRG_PLL13.u32;
    *pIntValue = CrgFbdiv & (0xfff);

    CrgFrac = g_pstRegCrg->PERI_CRG_PLL12.u32;
    *pFracValue = CrgFrac & (0xffffff);
}
#endif

HI_VOID SYNC_ReadVpllFreqCtrlCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    HI_U32 CrgFbdiv;
    HI_U32 CrgFrac;

    CrgFbdiv = g_pstRegCrg->PERI_CRG_PLL9.u32;
    *pIntValue = CrgFbdiv & (0xfff);

    CrgFrac = g_pstRegCrg->PERI_CRG_PLL8.u32;
    *pFracValue = CrgFrac & (0xffffff);
}

HI_VOID SYNC_ReadHpllFreqCtrlCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    HI_U32 CrgFbdiv;
    HI_U32 CrgFrac;

    CrgFbdiv = g_pstRegCrg->PERI_CRG_PLL11.u32;
    *pIntValue = CrgFbdiv & (0xfff);

    CrgFrac = g_pstRegCrg->PERI_CRG_PLL10.u32;
    *pFracValue = CrgFrac & (0xffffff);
}

HI_VOID SYNC_ReadAudPllFreqCtrlCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
#ifdef SYNC_STC_AUDPLL_IS_APLL
    SYNC_ReadApllFreqCtrlCrg(pIntValue, pFracValue);
#else
    SYNC_ReadEpllFreqCtrlCrg(pIntValue, pFracValue);
#endif
}

#ifdef SYNC_STC_AUDPLL_IS_APLL
HI_VOID SYNC_ReadApllTurnFreqCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    *pIntValue   = g_pstRegCrg->PERI_CRG105.bits.apll_tune_int_cfg;
    *pFracValue  = g_pstRegCrg->PERI_CRG106.bits.apll_tune_frac_cfg;
}

HI_VOID SYNC_WriteApllTurnFreqCrg(HI_U32 IntValue, HI_U32 FracValue)
{
    g_pstRegCrg->PERI_CRG105.bits.apll_tune_int_cfg  = IntValue;
    g_pstRegCrg->PERI_CRG106.bits.apll_tune_frac_cfg = FracValue;
}
#else
HI_VOID SYNC_ReadEpllTurnFreqCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    *pIntValue   = g_pstRegCrg->PERI_CRG120.bits.epll_tune_int_cfg;
    *pFracValue  = g_pstRegCrg->PERI_CRG121.bits.epll_tune_frac_cfg;
}

HI_VOID SYNC_WriteEpllTurnFreqCrg(HI_U32 IntValue, HI_U32 FracValue)
{
    g_pstRegCrg->PERI_CRG120.bits.epll_tune_int_cfg  = IntValue;
    g_pstRegCrg->PERI_CRG121.bits.epll_tune_frac_cfg = FracValue;
}
#endif

HI_VOID SYNC_ReadVpllTurnFreqCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    *pIntValue  = g_pstRegCrg->PERI_CRG140.bits.vpll_tune_int_cfg;
    *pFracValue = g_pstRegCrg->PERI_CRG141.bits.vpll_tune_frac_cfg;
}

HI_VOID SYNC_WriteVpllTurnFreqCrg(HI_U32 IntValue, HI_U32 FracValue)
{
    g_pstRegCrg->PERI_CRG140.bits.vpll_tune_int_cfg  = IntValue;
    g_pstRegCrg->PERI_CRG141.bits.vpll_tune_frac_cfg = FracValue;
}

HI_VOID SYNC_ReadHpllTurnFreqCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
    *pIntValue  = g_pstRegCrg->PERI_CRG135.bits.hpll_tune_int_cfg;
    *pFracValue = g_pstRegCrg->PERI_CRG136.bits.hpll_tune_frac_cfg;
}

HI_VOID SYNC_WriteHpllTurnFreqCrg(HI_U32 IntValue, HI_U32 FracValue)
{
    g_pstRegCrg->PERI_CRG135.bits.hpll_tune_int_cfg  = IntValue;
    g_pstRegCrg->PERI_CRG136.bits.hpll_tune_frac_cfg = FracValue;
}

HI_VOID SYNC_HpllDisableTurnFreq(HI_VOID)
{
    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_mode = 0x0;
}

HI_VOID SYNC_ReadAudPllTurnFreqCrg(HI_U32 *pIntValue, HI_U32 *pFracValue)
{
#ifdef SYNC_STC_AUDPLL_IS_APLL
    SYNC_ReadApllTurnFreqCrg(pIntValue, pFracValue);
#else
    SYNC_ReadEpllTurnFreqCrg(pIntValue, pFracValue);
#endif
}

HI_VOID SYNC_WriteAudPllTurnFreqCrg(HI_U32 IntValue, HI_U32 FracValue)
{
#ifdef SYNC_STC_AUDPLL_IS_APLL
    SYNC_WriteApllTurnFreqCrg(IntValue, FracValue);
#else
    SYNC_WriteEpllTurnFreqCrg(IntValue, FracValue);
#endif
}

#ifdef SYNC_STC_AUDPLL_IS_APLL
HI_BOOL SYNC_IsApllTuneFreqBusy(HI_VOID)
{
    return g_pstRegCrg->PERI_CRG165.bits.apll_tune_busy;
}
#else
HI_BOOL SYNC_IsEpllTuneFreqBusy(HI_VOID)
{
    return g_pstRegCrg->PERI_CRG171.bits.epll_tune_busy;
}
#endif

HI_BOOL SYNC_IsVpllTuneFreqBusy(HI_VOID)
{
    return g_pstRegCrg->PERI_CRG179.bits.vpll_tune_busy;
}

HI_BOOL SYNC_IsHpllTuneFreqBusy(HI_VOID)
{
    return g_pstRegCrg->PERI_CRG177.bits.hpll_tune_busy;
}

HI_BOOL SYNC_IsAudPllTuneFreqBusy(HI_VOID)
{
#ifdef SYNC_STC_AUDPLL_IS_APLL
    return SYNC_IsApllTuneFreqBusy();
#else
    return SYNC_IsEpllTuneFreqBusy();
#endif
}

HI_VOID SYNC_VpllTuneFreq(HI_U32 VpllFbdiv, HI_U32 VpllFrac)
{
    SYNC_WriteVpllTurnFreqCrg(VpllFbdiv, VpllFrac);

    g_pstRegCrg->PERI_CRG142.bits.vpll_tune_step_int  = 0;
    g_pstRegCrg->PERI_CRG143.bits.vpll_tune_step_frac = 0x10;

    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_en        = 0;        /* 3: 0->1 tune frq */
    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_cken      = 1;        /* 0: clock en */
    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_srst_req  = 0;        /* 1: sorft req */
    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_mode      = 1;        /* 2: tune mode */
    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_divval    = 1;        /* 4-7: tune clock div */
    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_soft_cfg  = 0;        /* 8: sorft config en */

    g_pstRegCrg->PERI_CRG144.bits.vpll_tune_en = 0x1;             /* 3: 0->1 tune frq */
}

HI_VOID SYNC_HpllTuneFreq(HI_U32 HpllFbdiv, HI_U32 HpllFrac)
{
    SYNC_WriteHpllTurnFreqCrg(HpllFbdiv, HpllFrac);

    g_pstRegCrg->PERI_CRG137.bits.hpll_tune_step_int  = 0;
    g_pstRegCrg->PERI_CRG138.bits.hpll_tune_step_frac = 0x10;

    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_en        = 0;        /* 3: 0->1 tune frq */
    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_cken      = 1;        /* 0: clock en */
    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_srst_req  = 0;        /* 1: sorft req */
    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_mode      = 1;        /* 2: tune mode */
    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_divval    = 1;        /* 4-7: tune clock div */
    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_soft_cfg  = 0;        /* 8: sorft config en */

    g_pstRegCrg->PERI_CRG139.bits.hpll_tune_en = 0x1;              /* 3: 0->1 tune frq */
}

#ifdef SYNC_STC_AUDPLL_IS_APLL
HI_VOID SYNC_ApllTuneFreq(HI_U32 ApllFbdiv, HI_U32 ApllFrac)
{
    SYNC_WriteApllTurnFreqCrg(ApllFbdiv, ApllFrac);

    g_pstRegCrg->PERI_CRG107.bits.apll_tune_step_int  = 0;
    g_pstRegCrg->PERI_CRG108.bits.apll_tune_step_frac = 0x10;

    g_pstRegCrg->PERI_CRG109.bits.apll_tune_en        = 0;        /* 3: 0->1 tune frq */
    g_pstRegCrg->PERI_CRG109.bits.apll_tune_cken      = 1;        /* 0: clock en */
    g_pstRegCrg->PERI_CRG109.bits.apll_tune_srst_req  = 0;        /* 1: sorft req */
    g_pstRegCrg->PERI_CRG109.bits.apll_tune_mode      = 1;        /* 2: tune mode */
    g_pstRegCrg->PERI_CRG109.bits.apll_tune_divval    = 1;        /* 4-7: tune clock div */
    g_pstRegCrg->PERI_CRG109.bits.apll_tune_soft_cfg  = 0;        /* 8: sorft config en */

    g_pstRegCrg->PERI_CRG109.bits.apll_tune_en = 0x1;              /* 3: 0->1 tune frq */

}
#else
HI_VOID SYNC_EpllTuneFreq(HI_U32 EpllFbdiv, HI_U32 EpllFrac)
{
    SYNC_WriteEpllTurnFreqCrg(EpllFbdiv, EpllFrac);

    g_pstRegCrg->PERI_CRG122.bits.epll_tune_step_int  = 0;
    g_pstRegCrg->PERI_CRG123.bits.epll_tune_step_frac = 0x10;

    g_pstRegCrg->PERI_CRG124.bits.epll_tune_en        = 0;        /* 3: 0->1 tune frq */
    g_pstRegCrg->PERI_CRG124.bits.epll_tune_cken      = 1;        /* 0: clock en */
    g_pstRegCrg->PERI_CRG124.bits.epll_tune_srst_req  = 0;        /* 1: sorft req */
    g_pstRegCrg->PERI_CRG124.bits.epll_tune_mode      = 1;        /* 2: tune mode */
    g_pstRegCrg->PERI_CRG124.bits.epll_tune_divval    = 1;        /* 4-7: tune clock div */
    g_pstRegCrg->PERI_CRG124.bits.epll_tune_soft_cfg  = 0;        /* 8: sorft config en */

    g_pstRegCrg->PERI_CRG124.bits.epll_tune_en = 0x1;              /* 3: 0->1 tune frq */
}
#endif

HI_VOID SYNC_AudPllTuneFreq(HI_U32 ApllFbdiv, HI_U32 ApllFrac)
{
#ifdef SYNC_STC_AUDPLL_IS_APLL
    SYNC_ApllTuneFreq(ApllFbdiv, ApllFrac);
#else
    SYNC_EpllTuneFreq(ApllFbdiv, ApllFrac);
#endif
}

HI_VOID SYNC_VpllFreqReset(HI_VOID)
{
    HI_U32 VpllFbdiv;
    HI_U32 VpllFrac;

    SYNC_ReadVpllFreqCtrlCrg(&VpllFbdiv, &VpllFrac);

    SYNC_VpllTuneFreq(VpllFbdiv, VpllFrac);

    HI_INFO_SYNC("Vpll Freq Reset !\n");
}

#ifdef SYNC_STC_AUDPLL_IS_APLL
HI_VOID SYNC_ApllFreqReset(HI_VOID)
{
    HI_U32 ApllFbdiv;
    HI_U32 ApllFrac;

#ifdef AIAO_SRC_PLL_HAS_CREECTED
    ApllFbdiv = g_AudPllSrcValueInt & (0xfff);
    ApllFrac = g_AudPllSrcValueFrac & (0xffffff);
#else
    SYNC_ReadApllFreqCtrlCrg(&ApllFbdiv, &ApllFrac);
#endif

    SYNC_ApllTuneFreq(ApllFbdiv, ApllFrac);

    HI_INFO_SYNC("Apll Freq Reset !\n");
}
#else
HI_VOID SYNC_EpllFreqReset(HI_VOID)
{
    HI_U32 EpllFbdiv;
    HI_U32 EpllFrac;

#ifdef AIAO_SRC_PLL_HAS_CREECTED
    EpllFbdiv = g_AudPllSrcValueInt & (0xfff);
    EpllFrac = g_AudPllSrcValueFrac & (0xffffff);
#else
    SYNC_ReadEpllFreqCtrlCrg(&EpllFbdiv, &EpllFrac);
#endif

    SYNC_EpllTuneFreq(EpllFbdiv, EpllFrac);

    HI_INFO_SYNC("Epll Freq Reset !\n");
}
#endif

HI_VOID SYNC_AudPllFreqReset(HI_VOID)
{
#ifdef SYNC_STC_AUDPLL_IS_APLL
    SYNC_ApllFreqReset();
#else
    SYNC_EpllFreqReset();
#endif
}

HI_VOID SYNC_HpllFreqReset(HI_VOID)
{
    HI_U32 HpllFbdiv;
    HI_U32 HpllFrac;

    SYNC_ReadHpllFreqCtrlCrg(&HpllFbdiv, &HpllFrac);

    SYNC_HpllTuneFreq(HpllFbdiv, HpllFrac);

    HI_INFO_SYNC("Hpll Freq Reset !\n");
}

HI_BOOL SYNC_CheckPllTuneFreqIsEnable(HI_VOID)
{
    HI_U32 VpllTuneFreqFlag;
    HI_U32 AudPllTuneFreqFlag;
    HI_U32 HpllTuneFreqFlag;

    VpllTuneFreqFlag = g_pstRegCrg->PERI_CRG_PLL9.u32;
    VpllTuneFreqFlag = (VpllTuneFreqFlag >> 25) & 0x01;

#ifdef SYNC_STC_AUDPLL_IS_APLL
    AudPllTuneFreqFlag = g_pstRegCrg->PERI_CRG_PLL1.u32;
    AudPllTuneFreqFlag = (AudPllTuneFreqFlag >> 25) & 0x01;
#else
    AudPllTuneFreqFlag = g_pstRegCrg->PERI_CRG_PLL13.u32;
    AudPllTuneFreqFlag = (AudPllTuneFreqFlag >> 25) & 0x01;
#endif
    HpllTuneFreqFlag = g_pstRegCrg->PERI_CRG_PLL11.u32;
    HpllTuneFreqFlag = (HpllTuneFreqFlag >> 25) & 0x01;

    if (VpllTuneFreqFlag || AudPllTuneFreqFlag || HpllTuneFreqFlag)
    {
        HI_WARN_SYNC(" Pll tune Freq is disable! \n");
        return HI_FALSE;
    }

    return HI_TRUE;
}

HI_S32 SYNC_SetHpllConfigFlg(HI_BOOL IsConfig)
{
    spin_lock(&StcLock);

    g_HpllIsConfigFlg = IsConfig;

    if (HI_TRUE == IsConfig)
    {
        SYNC_HpllDisableTurnFreq();
        HI_INFO_SYNC("disable hpll turn freq!\n");
    }

    HI_INFO_SYNC("SetHpllConfigFlg:%d\n", IsConfig);

    spin_unlock(&StcLock);
    return HI_SUCCESS;
}

HI_S32 SYNC_PllTuneFreqCrgInit(HI_VOID)
{
    HI_U32 CrgFbdiv;
    HI_U32 CrgFrac;

#ifdef  AIAO_SRC_PLL_HAS_CREECTED
    HI_S32 Ret = HI_FAILURE;
    AIAO_EXPORT_FUNC_S* pstAOFunc = HI_NULL;

    Ret = HI_DRV_MODULE_GetFunction(HI_ID_AO, (HI_VOID**)&pstAOFunc);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_SYNC("Get AO function err(0x%x)!\n", Ret);
        return Ret;
    }

    if (HI_NULL == pstAOFunc || HI_NULL == pstAOFunc->pfnAO_DrvGetPllCfg)
    {
        HI_ERR_SYNC("AO function pfnAO_DrvGetPllCfg is null\n");
        return HI_FAILURE;
    }

    Ret = (pstAOFunc->pfnAO_DrvGetPllCfg)(&CrgFrac, &CrgFbdiv);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_SYNC("call AO_DRV_GetPllCfg fail\n");
        return Ret;
    }

    g_AudPllSrcValueInt  = CrgFbdiv;
    g_AudPllSrcValueFrac = CrgFrac;
#endif

#ifdef SYNC_STC_AUDPLL_IS_APLL
    SYNC_ReadApllTurnFreqCrg(&CrgFbdiv, &CrgFrac);
    if (CrgFbdiv == 0x0 && CrgFrac == 0x0)
    {
    #ifdef  AIAO_SRC_PLL_HAS_CREECTED
        CrgFbdiv = g_AudPllSrcValueInt & (0xfff);
        CrgFrac = g_AudPllSrcValueFrac & (0xffffff);
    #else
        SYNC_ReadApllFreqCtrlCrg(&CrgFbdiv, &CrgFrac);
    #endif
        SYNC_WriteApllTurnFreqCrg(CrgFbdiv, CrgFrac);
        HI_INFO_SYNC("Apll tune freq Crg init success !\n");
    }
#else
    SYNC_ReadEpllTurnFreqCrg(&CrgFbdiv, &CrgFrac);
    if (CrgFbdiv == 0x0 && CrgFrac == 0x0)
    {
    #ifdef  AIAO_SRC_PLL_HAS_CREECTED
        CrgFbdiv = g_AudPllSrcValueInt & (0xfff);
        CrgFrac = g_AudPllSrcValueFrac & (0xffffff);
    #else
        SYNC_ReadEpllFreqCtrlCrg(&CrgFbdiv, &CrgFrac);
    #endif
        SYNC_WriteEpllTurnFreqCrg(CrgFbdiv, CrgFrac);
        HI_INFO_SYNC("Epll tune freq Crg init success !\n");
    }
#endif

    SYNC_ReadVpllTurnFreqCrg(&CrgFbdiv, &CrgFrac);
    if (CrgFbdiv == 0x0 && CrgFrac == 0x0)
    {
        SYNC_ReadVpllFreqCtrlCrg(&CrgFbdiv, &CrgFrac);
        SYNC_WriteVpllTurnFreqCrg(CrgFbdiv, CrgFrac);

        HI_INFO_SYNC("Vpll tune freq Crg init success !\n");
    }

    SYNC_ReadHpllTurnFreqCrg(&CrgFbdiv, &CrgFrac);
    if (CrgFbdiv == 0x0 && CrgFrac == 0x0)
    {
        SYNC_ReadHpllFreqCtrlCrg(&CrgFbdiv, &CrgFrac);
        SYNC_WriteHpllTurnFreqCrg(CrgFbdiv, CrgFrac);

        HI_INFO_SYNC("Hpll tune freq Crg init success !\n");
    }

    return HI_SUCCESS;
}

HI_VOID SYNC_ProcStcAdjustFailEvent(HI_VOID)
{
    HI_U32 j = 0;

    for (j = 0; j < SYNC_MAX_NUM; j++)
    {
        if (HI_NULL != g_SyncGlobalState.SyncInfo[j].pSync
            && g_SyncGlobalState.SyncInfo[j].pSync->SyncAttr.enSyncRef == HI_UNF_SYNC_REF_PCR
            && g_SyncGlobalState.SyncInfo[j].pSync->PcrSyncInfo.enPcrAdjust == SYNC_PCR_ADJUST_SCR
            )
        {
            g_SyncGlobalState.SyncInfo[j].pSync->PcrSyncInfo.StcInfo.StcAdjustFail = HI_TRUE;
        }
    }
}

HI_BOOL SYNC_CheckStcAdjustFailEvent(HI_VOID)
{
    HI_U32 i = 0;

    for (i = 0; i < SYNC_MAX_NUM; i++)
    {
        if (HI_NULL != g_SyncGlobalState.SyncInfo[i].pSync
            && g_SyncGlobalState.SyncInfo[i].pSync->SyncAttr.enSyncRef == HI_UNF_SYNC_REF_PCR
            && g_SyncGlobalState.SyncInfo[i].pSync->PcrSyncInfo.enPcrAdjust == SYNC_PCR_ADJUST_SCR
            )
        {
            if (g_SyncGlobalState.SyncInfo[i].pSync->PcrSyncInfo.StcInfo.StcAdjustFail == HI_TRUE)
            {
               return HI_TRUE;
            }
        }
    }

    return HI_FALSE;
}

HI_S32 SYNC_CalculateDeltaFrac(HI_U32 Fbdiv, HI_U32 Frac, HI_S32 PPM, HI_S32 *DeltaFrac)
{
    HI_U64 PpmExpand;

    /*
    computational formula :
    PPM = PPM/100
    Fout = FReff(fbdiv+frac/2^24)/RefDiv
    DeltaFrac = (Fout/FReff * RefDiv * PPM/1000/1000 ) << 24
    */

    if (PPM >= 0)
    {
        PpmExpand = PPM;
        PpmExpand = ((PpmExpand * Fbdiv) << 24) + PpmExpand * Frac;
        do_div(PpmExpand, 100 * 1000000);

        *DeltaFrac = (HI_S32)(PpmExpand & 0xffffffff);
    }
    else
    {
        PpmExpand = -1 * PPM;
        PpmExpand = ((PpmExpand * Fbdiv) << 24) + PpmExpand * Frac;
        do_div(PpmExpand, 100 * 1000000);

        *DeltaFrac = -1 * (HI_S32)(PpmExpand & 0xffffffff);
    }

    return HI_SUCCESS;
}

HI_VOID SYNC_CalculateTargetFreq(HI_U32 *PllFbdiv, HI_U32 *PllFrac, HI_S32 PllDeltaFrac)
{
    if (PllDeltaFrac >= 0)
    {
        *PllFrac = *PllFrac + PllDeltaFrac;

        if (*PllFrac > 0xffffff)
        {
            *PllFbdiv = *PllFbdiv + 1;
            *PllFrac  = *PllFrac - 0x1000000;
        }
    }
    else
    {
        if (abs(PllDeltaFrac) > *PllFrac)
        {
            *PllFbdiv = *PllFbdiv - 1;
            *PllFrac  = *PllFrac + 0x1000000 + PllDeltaFrac;
        }
        else
        {
            *PllFrac = *PllFrac + PllDeltaFrac;
        }
    }
}

HI_S32 SYNC_CalculatePpm(HI_U32 Fbdiv, HI_U32 Frac, HI_S32 DeltaFrac, HI_S32 *PPM)
{
    HI_U64 DeltaFracExpand;
    HI_U64 FracExpand;

    /*PPM*100 = (DeltaFracExpand *100 * 1000000)/((FracExpand << 24) + Frac)*/

    FracExpand = Fbdiv;
    FracExpand = (FracExpand << 24) + Frac;

    /*do_div(HI_U64,HI_U32)*/
    do_div(FracExpand, 10000);
    if (0 == FracExpand)
    {
        HI_ERR_SYNC("FracExpand is zero!\n");
        return HI_FAILURE;
    }

    if (DeltaFrac >= 0)
    {
        DeltaFracExpand = DeltaFrac;
        DeltaFracExpand = DeltaFracExpand * 10000;

        do_div(DeltaFracExpand, FracExpand);

        *PPM = (HI_S32)(DeltaFracExpand & 0xffffffff);
    }
    else
    {
        DeltaFracExpand = -1 * DeltaFrac;
        DeltaFracExpand = DeltaFracExpand * 10000;

        do_div(DeltaFracExpand, FracExpand);

        *PPM = -1 * (HI_S32)(DeltaFracExpand & 0xffffffff);
    }

    return HI_SUCCESS;
}

HI_VOID SYNC_PllTuneFreq(SYNC_S *pSync, HI_S32 PPM)
{
    HI_S32 VpllAdjust = 0;
    HI_S32 AudPllAdjust = 0;
    HI_S32 HpllAdjust = 0;
    HI_U32 VpllFbdiv = 0;
    HI_U32 VpllFrac  = 0;
    HI_U32 AudPllFbdiv = 0;
    HI_U32 AudPllFrac  = 0;
    HI_U32 HpllFbdiv = 0;
    HI_U32 HpllFrac  = 0;
    HI_U32 VpllTargetFbdiv = 0;
    HI_U32 VpllTargetFrac  = 0;
    HI_U32 AudPllTargetFbdiv = 0;
    HI_U32 AudPllTargetFrac  = 0;
    HI_U32 HpllTargetFbdiv = 0;
    HI_U32 HpllTargetFrac  = 0;
    HI_S32 VpllDeltaFrac = 0;
    HI_S32 AudPllDeltaFrac = 0;
    HI_S32 HpllDeltaFrac = 0;
    HI_S32 VpllPpm = 0;
    HI_S32 AudPllPpm = 0;
    HI_S32 HpllPpm = 0;

    if (spin_trylock(&StcLock) == 0)
    {
        return;
    }

    if (HI_TRUE == g_HpllIsConfigFlg)
    {
        spin_unlock(&StcLock);
        return;
    }

    if (SYNC_CheckStcAdjustFailEvent() == HI_TRUE)
    {
        spin_unlock(&StcLock);
        return ;
    }

    SYNC_ReadVpllFreqCtrlCrg(&VpllFbdiv, &VpllFrac);
    SYNC_ReadHpllFreqCtrlCrg(&HpllFbdiv, &HpllFrac);

#ifdef  AIAO_SRC_PLL_HAS_CREECTED
    AudPllFbdiv = g_AudPllSrcValueInt & (0xfff);
    AudPllFrac = g_AudPllSrcValueFrac & (0xffffff);
#else
    SYNC_ReadAudPllFreqCtrlCrg(&AudPllFbdiv, &AudPllFrac);
#endif

    SYNC_ReadAudPllTurnFreqCrg(&AudPllTargetFbdiv, &AudPllTargetFrac);
    SYNC_ReadVpllTurnFreqCrg(&VpllTargetFbdiv, &VpllTargetFrac);
    SYNC_ReadHpllTurnFreqCrg(&HpllTargetFbdiv, &HpllTargetFrac);

    /* judge pll bdiv value change */
    if (abs(VpllFbdiv - VpllTargetFbdiv) >= 2 )
    {
        VpllTargetFbdiv = VpllFbdiv;
        VpllTargetFrac  = VpllFrac;

        SYNC_WriteVpllTurnFreqCrg(VpllFbdiv, VpllFrac);
        HI_WARN_SYNC("Vpll Fbdiv is changed !\n");
    }

    if (abs(AudPllFbdiv - AudPllTargetFbdiv) >= 2 )
    {
        AudPllTargetFbdiv = AudPllFbdiv;
        AudPllTargetFrac  = AudPllFrac;

        SYNC_WriteAudPllTurnFreqCrg(AudPllFbdiv, AudPllFrac);
        HI_WARN_SYNC("AudPll Fbdiv is changed !\n");
    }

    if (abs(HpllFbdiv - HpllTargetFbdiv) >= 2 )
    {
        HpllTargetFbdiv = HpllFbdiv;
        HpllTargetFrac  = HpllFrac;

        SYNC_WriteHpllTurnFreqCrg(HpllFbdiv, HpllFrac);
        HI_WARN_SYNC("Hpll Fbdiv is changed !\n");
    }

    VpllAdjust = (VpllTargetFbdiv - VpllFbdiv) * 0x1000000 + (VpllTargetFrac - VpllFrac);
    AudPllAdjust = (AudPllTargetFbdiv - AudPllFbdiv) * 0x1000000 + (AudPllTargetFrac - AudPllFrac);
    HpllAdjust = (HpllTargetFbdiv - HpllFbdiv) * 0x1000000 + (HpllTargetFrac - HpllFrac);

    SYNC_CalculatePpm(VpllFbdiv, VpllFrac, VpllAdjust, &VpllPpm);
    SYNC_CalculatePpm(AudPllFbdiv, AudPllFrac, AudPllAdjust, &AudPllPpm);
    SYNC_CalculatePpm(HpllFbdiv, HpllFrac, HpllAdjust, &HpllPpm);

    if (abs(VpllPpm - AudPllPpm) > PPM_ADJUST_THRESHOLD)
    {
        AudPllTargetFbdiv = AudPllFbdiv;
        AudPllTargetFrac  = AudPllFrac;

        SYNC_CalculateDeltaFrac(AudPllFbdiv, AudPllFrac, VpllPpm, &AudPllDeltaFrac);
        SYNC_CalculateTargetFreq(&AudPllTargetFbdiv, &AudPllTargetFrac, AudPllDeltaFrac);

        if (!SYNC_IsAudPllTuneFreqBusy())
        {
            SYNC_AudPllTuneFreq(AudPllTargetFbdiv, AudPllTargetFrac);
        }

        HI_WARN_SYNC("VpllPpm and EpllPpm are not equal, VpllPpm:%d, AudPllPpm:%d\n", VpllPpm, AudPllPpm);
    }

    if (abs(VpllPpm - HpllPpm) > PPM_ADJUST_THRESHOLD)
    {
        HpllTargetFbdiv = HpllFbdiv;
        HpllTargetFrac  = HpllFrac;

        SYNC_CalculateDeltaFrac(HpllFbdiv, HpllFrac, VpllPpm, &HpllDeltaFrac);
        SYNC_CalculateTargetFreq(&HpllTargetFbdiv, &HpllTargetFrac, HpllDeltaFrac);

        if (!SYNC_IsHpllTuneFreqBusy())
        {
            SYNC_HpllTuneFreq(HpllTargetFbdiv, HpllTargetFrac);
        }

        HI_WARN_SYNC("VpllPpm and HpllPpm are not equal, VpllPpm:%d, HpllPpm:%d \n", VpllPpm, HpllPpm);
    }

    /* calculate pll Delta Frac */
    SYNC_CalculateDeltaFrac(VpllTargetFbdiv, VpllTargetFrac, PPM, &VpllDeltaFrac);
    SYNC_CalculateDeltaFrac(AudPllTargetFbdiv, AudPllTargetFrac, PPM, &AudPllDeltaFrac);
    SYNC_CalculateDeltaFrac(HpllTargetFbdiv, HpllTargetFrac, PPM, &HpllDeltaFrac);

    /* update pll Target Frequency */
    SYNC_CalculateTargetFreq(&VpllTargetFbdiv, &VpllTargetFrac, VpllDeltaFrac);
    SYNC_CalculateTargetFreq(&AudPllTargetFbdiv, &AudPllTargetFrac, AudPllDeltaFrac);
    SYNC_CalculateTargetFreq(&HpllTargetFbdiv, &HpllTargetFrac, HpllDeltaFrac);

    /* stc adjust prscision is 0.1(PPM) */
    if (abs(PPM) < PPM_ADJUST_THRESHOLD)
    {
        spin_unlock(&StcLock);
        return;
    }

    /* if adjust too large ,reset pll frq */
    if (abs(VpllPpm + PPM) / 100 > STC_MAX_PPM)
    {
        SYNC_VpllFreqReset();
        SYNC_AudPllFreqReset();
        SYNC_HpllFreqReset();

        SYNC_ProcStcAdjustFailEvent();

        HI_WARN_SYNC("STC Adjust too large and Fail, AdjustPPM:%d \n", (VpllPpm + PPM) / 100);

        spin_unlock(&StcLock);
        return ;
    }

    /* when Vpll is idle then tune Frq */
    if (!SYNC_IsAudPllTuneFreqBusy() && !SYNC_IsVpllTuneFreqBusy() && !SYNC_IsHpllTuneFreqBusy())
    {
        SYNC_AudPllTuneFreq(AudPllTargetFbdiv, AudPllTargetFrac);
        SYNC_VpllTuneFreq(VpllTargetFbdiv, VpllTargetFrac);
        SYNC_HpllTuneFreq(HpllTargetFbdiv, HpllTargetFrac);

        HI_WARN_SYNC("\n=====PLL Org Frq ====\n"
                      "VInt:%-5d,   VFrac:%d\n"
                      "AInt:%-5d,   AFrac:%d\n"
                      "HInt:%-5d,   HFrac:%d\n\n",
                      VpllFbdiv,  VpllFrac,
                      AudPllFbdiv,  AudPllFrac,
                      HpllFbdiv,  HpllFrac);

        HI_WARN_SYNC("\n=====PLL Target Frq ====\n"
                      "VInt:%-5d,   VFrac:%d\n"
                      "AInt:%-5d,   AFrac:%d\n"
                      "HInt:%-5d,   HFrac:%d\n\n",
                      VpllTargetFbdiv,  VpllTargetFrac,
                      AudPllTargetFbdiv,  AudPllTargetFrac,
                      HpllTargetFbdiv,  HpllTargetFrac);
    }

    spin_unlock(&StcLock);
    return;
}

/* stc Adjust Policy */
/* select first pcr channel to adjust stc */
HI_VOID SYNC_StcAdjustPolicy(SYNC_S *pSync, HI_S32 *PPM)
{
    HI_U32 i,j;

    if (pSync->CrtStatus == SYNC_STATUS_STOP)
    {
        pSync->PcrSyncInfo.StcAdjustReferFlag = HI_FALSE;

        *PPM = 0;
        return;
    }

    if (pSync->PcrSyncInfo.StcAdjustReferFlag == HI_TRUE)
    {
        *PPM = pSync->PcrSyncInfo.PpmInfo.PpmValid;
        return;
    }

    /* search refer channel */
    for (i = 0; i < SYNC_MAX_NUM; i++)
    {
        if (HI_NULL != g_SyncGlobalState.SyncInfo[i].pSync
            && g_SyncGlobalState.SyncInfo[i].pSync->SyncAttr.enSyncRef == HI_UNF_SYNC_REF_PCR
            && g_SyncGlobalState.SyncInfo[i].pSync->PcrSyncInfo.enPcrAdjust == SYNC_PCR_ADJUST_SCR
            && g_SyncGlobalState.SyncInfo[i].pSync->PcrSyncInfo.PcrFirstCome == HI_TRUE
            )
        {
            if(g_SyncGlobalState.SyncInfo[i].pSync->CrtStatus != SYNC_STATUS_STOP)
            {
                break;
            }
        }
    }

    if (i >= SYNC_MAX_NUM)
    {
        *PPM = 0;
        return;
    }

    /* judge the current channel is refer channel or not */
    if (g_SyncGlobalState.SyncInfo[i].pSync == pSync)
    {
        pSync->PcrSyncInfo.StcAdjustReferFlag = HI_TRUE;

        for (j = 0; j < SYNC_MAX_NUM; j++)
        {
            if (HI_NULL != g_SyncGlobalState.SyncInfo[j].pSync
                && g_SyncGlobalState.SyncInfo[j].pSync != pSync
                && g_SyncGlobalState.SyncInfo[j].pSync->SyncAttr.enSyncRef == HI_UNF_SYNC_REF_PCR
                && g_SyncGlobalState.SyncInfo[j].pSync->PcrSyncInfo.StcAdjustReferFlag == HI_TRUE
                )
            {
                g_SyncGlobalState.SyncInfo[j].pSync->PcrSyncInfo.StcAdjustReferFlag = HI_FALSE;
            }
        }

        HI_INFO_SYNC("current stc adjust refer sync channel change \n");
    }

    *PPM = 0;
    return;
}

HI_VOID SYNC_StcAdjust(SYNC_S *pSync, HI_U64 PCRValue ,HI_U64 STCValue)
{
    HI_S32      Ret;
    HI_S32      PcrDelta = 0;
    HI_S32      StcDelta = 0;

    if (   (pSync->SyncAttr.enSyncRef != HI_UNF_SYNC_REF_PCR)
        || (pSync->PcrSyncInfo.enPcrAdjust != SYNC_PCR_ADJUST_SCR)
        || (pSync->PcrSyncInfo.StcInfo.StcAdjustFail == HI_TRUE) )
    {
        return;
    }

    /* init stc adjust */
    if (pSync->PcrSyncInfo.StcInfo.StcAdjustInitFlag != HI_TRUE)
    {
        if (SYNC_CheckPllTuneFreqIsEnable() == HI_FALSE)
        {
           pSync->PcrSyncInfo.StcInfo.StcAdjustFail = HI_TRUE;

           HI_WARN_SYNC("Pll Tune Freq Is disable !\n");
           return;
        }

        Ret = SYNC_PllTuneFreqCrgInit();
        if (HI_SUCCESS != Ret)
        {
           pSync->PcrSyncInfo.StcInfo.StcAdjustFail = HI_TRUE;

           HI_ERR_SYNC("SYNC_PllTuneFreqCrgInit fail !\n");
           return;
        }

        pSync->PcrSyncInfo.StcInfo.StcLastValue = STCValue;
        pSync->PcrSyncInfo.PcrLastValue         = PCRValue;
        pSync->PcrSyncInfo.PpmInfo.PpmNumber    = 0;
        pSync->PcrSyncInfo.PpmInfo.PpmSum       = 0;
        pSync->PcrSyncInfo.PpmInfo.PpmValid     = 0;
        pSync->PcrSyncInfo.PcrDeltaNumber       = 0;
        pSync->PcrSyncInfo.PcrDeltaSum          = 0;
        pSync->PcrSyncInfo.StcInfo.StcDeltaSum  = 0;
        pSync->PcrSyncInfo.StcInfo.StcAdjustInitFlag = HI_TRUE;
        pSync->PcrSyncInfo.StcAdjustReferFlag        = HI_FALSE;

        HI_INFO_SYNC("stc adjust init success\n");
        return ;
    }

    /* pcr or stc smaller than the last one*/
    if ((PCRValue < pSync->PcrSyncInfo.PcrLastValue) || (STCValue < pSync->PcrSyncInfo.StcInfo.StcLastValue))
    {
        pSync->PcrSyncInfo.StcInfo.StcLastValue = STCValue;
        pSync->PcrSyncInfo.PcrLastValue         = PCRValue;

        HI_INFO_SYNC("pcr or stc smaller than the last one \n");
        return ;
    }

    /* pcr jump */
    if (PCRValue - pSync->PcrSyncInfo.PcrLastValue > PCR_MAX_STEP)
    {
        pSync->PcrSyncInfo.StcInfo.StcLastValue = STCValue;
        pSync->PcrSyncInfo.PcrLastValue         = PCRValue;

        HI_INFO_SYNC("PCR Jump !\n");
        return ;
    }

    StcDelta = STCValue - pSync->PcrSyncInfo.StcInfo.StcLastValue;
    PcrDelta = PCRValue - pSync->PcrSyncInfo.PcrLastValue;

    pSync->PcrSyncInfo.StcInfo.StcLastValue = STCValue;
    pSync->PcrSyncInfo.PcrLastValue         = PCRValue;

    /* refer StcDelta judge PcrDelta*/
    if (abs(PcrDelta - StcDelta) > PCR_STC_MAX_DELTA_DIFF)
    {
        HI_INFO_SYNC("PcrDelt is err, PcrDelt:%d, StcDelt:%d\n", PcrDelta, StcDelta);
        return ;
    }

     pSync->PcrSyncInfo.PcrDeltaSum += PcrDelta;
     pSync->PcrSyncInfo.StcInfo.StcDeltaSum += StcDelta;
     pSync->PcrSyncInfo.PcrDeltaNumber++;

    /* caculate ppm*100 */
    if ((pSync->PcrSyncInfo.PcrDeltaNumber == PCR_DELTA_FILTER_NUMBER) && (pSync->PcrSyncInfo.PcrDeltaSum != 0))
    {
        HI_U64 PcrStcDeltaExpand;
        HI_S32 PcrStcDelta;
        HI_S32 PPM;

        PcrStcDelta = (pSync->PcrSyncInfo.PcrDeltaSum - pSync->PcrSyncInfo.StcInfo.StcDeltaSum);

        if (PcrStcDelta > 0)
        {
            PcrStcDeltaExpand = PcrStcDelta;
            PcrStcDeltaExpand = PcrStcDeltaExpand * 1000 * 1000 * 100;

            do_div(PcrStcDeltaExpand, pSync->PcrSyncInfo.PcrDeltaSum);
            PPM = (HI_S32)(PcrStcDeltaExpand & 0xffffffff);
        }
        else
        {
            PcrStcDeltaExpand = -1 * PcrStcDelta;
            PcrStcDeltaExpand = PcrStcDeltaExpand * 1000 * 1000 * 100;

            do_div(PcrStcDeltaExpand, pSync->PcrSyncInfo.PcrDeltaSum);
            PPM = -1 * (HI_S32)(PcrStcDeltaExpand & 0xffffffff);
        }

        pSync->PcrSyncInfo.PcrDeltaNumber      = 0;
        pSync->PcrSyncInfo.PcrDeltaSum         = 0;
        pSync->PcrSyncInfo.StcInfo.StcDeltaSum = 0;

        if ((PPM / 100) > STC_MAX_PPM)
        {
           HI_INFO_SYNC("PPM err, PPM:%d \n", (PPM / 100));
           return;
        }

        pSync->PcrSyncInfo.PpmInfo.PpmSum += PPM;
        pSync->PcrSyncInfo.PpmInfo.PpmNumber++;
    }

    if (pSync->PcrSyncInfo.PpmInfo.PpmNumber == PPM_FILTER_NUMBER)
    {
        HI_S32 PPM = 0;

        pSync->PcrSyncInfo.PpmInfo.PpmValid = pSync->PcrSyncInfo.PpmInfo.PpmSum / pSync->PcrSyncInfo.PpmInfo.PpmNumber;

        SYNC_StcAdjustPolicy(pSync, &PPM);

        SYNC_PllTuneFreq(pSync, PPM);

        pSync->PcrSyncInfo.PpmInfo.PpmNumber = 0;
        pSync->PcrSyncInfo.PpmInfo.PpmSum    = 0;

        HI_INFO_SYNC("current channel Valid PPM*100:%d, adjust STC PPM*100:%d\n", pSync->PcrSyncInfo.PpmInfo.PpmValid, PPM);
    }
}

HI_VOID SYNC_PllTuneFreqAbsolute(SYNC_S *pSync, HI_S32 PPM)
{
    HI_U32 VpllFbdiv;
    HI_U32 VpllFrac;
    HI_U32 AudPllFbdiv;
    HI_U32 AudPllFrac;
    HI_U32 HpllFbdiv;
    HI_U32 HpllFrac;

    HI_S32 VpllDeltaFrac;
    HI_S32 AudPllDeltaFrac;
    HI_S32 HpllDeltaFrac;

    if (spin_trylock(&StcLock) == 0)
    {
        return ;
    }

    SYNC_ReadVpllFreqCtrlCrg(&VpllFbdiv, &VpllFrac);
    SYNC_ReadHpllFreqCtrlCrg(&HpllFbdiv, &HpllFrac);

#ifdef  AIAO_SRC_PLL_HAS_CREECTED
    AudPllFbdiv = g_AudPllSrcValueInt & (0xfff);
    AudPllFrac = g_AudPllSrcValueFrac & (0xffffff);
#else
    SYNC_ReadAudPllFreqCtrlCrg(&AudPllFbdiv, &AudPllFrac);
#endif

    /* calculate pll Delta Frac */
    SYNC_CalculateDeltaFrac(VpllFbdiv, VpllFrac, PPM, &VpllDeltaFrac);
    SYNC_CalculateDeltaFrac(AudPllFbdiv, AudPllFrac, PPM, &AudPllDeltaFrac);
    SYNC_CalculateDeltaFrac(HpllFbdiv, HpllFrac, PPM, &HpllDeltaFrac);

    /* update pll Target Frequency */
    SYNC_CalculateTargetFreq(&VpllFbdiv, &VpllFrac, VpllDeltaFrac);
    SYNC_CalculateTargetFreq(&AudPllFbdiv, &AudPllFrac, AudPllDeltaFrac);
    SYNC_CalculateTargetFreq(&HpllFbdiv, &HpllFrac, HpllDeltaFrac);

    /* when Vpll is idle then tune Frq */
    if (!SYNC_IsAudPllTuneFreqBusy()&& !SYNC_IsVpllTuneFreqBusy() && !SYNC_IsHpllTuneFreqBusy())
    {
        SYNC_VpllTuneFreq(VpllFbdiv, VpllFrac);
        SYNC_AudPllTuneFreq(AudPllFbdiv, AudPllFrac);
        SYNC_HpllTuneFreq(HpllFbdiv, HpllFrac);
    }

    spin_unlock(&StcLock);
    return;
}

HI_S32 SYNC_StcAdjustbyExternal(SYNC_S *pSync,HI_S32 PPM)
{
    HI_S32 Ret = HI_SUCCESS;

    if (SYNC_INVAILDE_PPM == PPM)
    {
       HI_INFO_SYNC("PPM is invalid ,needn't set\n");
       return HI_SUCCESS;
    }

    if (abs(PPM) > 20)
    {
       HI_ERR_SYNC("PPM is illegal,PPM %d\n",PPM);
       return HI_FAILURE;
    }

    Ret = SYNC_PllTuneFreqCrgInit();
    if (HI_SUCCESS != Ret)
    {
       HI_ERR_SYNC("SYNC_PllTuneFreqCrgInit fail !\n");
       return HI_FAILURE;
    }

    SYNC_PllTuneFreqAbsolute(pSync, PPM*100);

    return HI_SUCCESS;
}
