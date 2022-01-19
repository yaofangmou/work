/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name        : drv_hifb_hal.c
Version          : Initial Draft
Author           : sdk
Created          : 2018/01/01
Description      :
                   G0 : 0xf8cc5000   G1 : 0xf8cc5800  GP0 : 0xf8cc6800
Function List    :

History          :
Date                Author         Modification
2018/01/01          sdk            Created file
*************************************************************************************************/


/***************************** add include here**************************************************/
#include "hi_reg_common.h"

#include "drv_hifb_config.h"
#include "drv_hifb_adp.h"
#include "drv_hifb_hal.h"
#include "hi_register_vdp.h"

#ifdef HI_BUILD_IN_BOOT
#include "hifb_debug.h"
#include "hi_common.h"
#include "hi_gfx_debug.h"
#else
#include "drv_hifb_debug.h"
#endif
/***************************** Macro Definition *************************************************/
#define STRIDE_ALIGN          16

#define CONFIG_HIFB_CHECK_LAYER_SUPPORT(Data) \
    if (HI_SUCCESS != HIFB_HAL_CheckLayerId(__LINE__, Data)) {return;}

#define CONFIG_HIFB_CHECK_GP_SUPPORT(Data) \
    if (HI_SUCCESS != HIFB_HAL_CheckGpId(__LINE__, Data)) {return;}

/***************************** Structure Definition *********************************************/

/***************************** Global Variable declaration **************************************/
static volatile S_VDP_REGS_TYPE* pOptmVdpReg = NULL;

/***************************** API forward declarations *****************************************/

/***************************** API realization **************************************************/

/***************************************************************************************
* func          : DRV_HIFB_HAL_VDP_Initial
* description   : CNcomment: hal层保存寄存器相关信息 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_VDP_Initial(volatile HI_U32* virAddr)
{
    pOptmVdpReg = (S_VDP_REGS_TYPE*)virAddr;
    return;
}

HI_U32 OPTM_VDP_RegRead(HI_U32* a)
{
    return (*a);
}

HI_VOID OPTM_VDP_RegWrite(HI_U32* a, HI_U32 b)
{
    if (NULL != a) { *a = b; }
    return;
}

static HI_S32 HIFB_HAL_CheckLayerId(HI_U32 Line, HI_U32 Data)
{
#ifdef CONFIG_HIFB_VERSION_2_0
    if ((0 != Data) && (1 != Data))
#elif defined(CONFIG_HIFB_VERSION_3_0)
    if ((0 != Data) && (1 != Data) && (2 != Data))
#else
    if (Data >= OPTM_GFX_MAX)
#endif
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Line);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Data);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 HIFB_HAL_CheckGpId(HI_U32 Line, HI_U32 Data)
{
    if (0 != Data)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Line);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Data);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_U32 HIFB_HAL_GetGpIdFromLayerId(HI_U32 Data)
{
#if !defined(CONFIG_HIFB_VERSION_2_0) && !defined(CONFIG_HIFB_VERSION_3_0)
    if (Data >= 4)
    {
        return 1;
    }
#endif
    return 0;
}

static HI_U32 HIFB_HAL_GetGpId(HI_U32 Data)
{
    return Data;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_DISP_GetDhd1Field(HI_BOOL *pbIsBottomField)
{
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    volatile U_DHD1_STATE DHD1_STATE;

    if ((NULL != pbIsBottomField) && (NULL != pOptmVdpReg))
    {
        DHD1_STATE.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->DHD1_STATE.u32))));
        *pbIsBottomField = DHD1_STATE.bits.bottom_field;
    }
#else
    HI_UNUSED(pbIsBottomField);
#endif
    return;
}

HI_VOID DRV_HIFB_HAL_DISP_GetDhd0Vtthd3(HI_ULONG *pExpectIntLineNumsForEndCallBack)
{
    /** 从前消隐开始算的 **/
    if (NULL != pExpectIntLineNumsForEndCallBack) {*pExpectIntLineNumsForEndCallBack = pOptmVdpReg->DHD0_VTTHD3.bits.vtmgthd3 - (pOptmVdpReg->DHD0_VSYNC2.bits.vfb + 1);}
    return;
}

HI_VOID DRV_HIFB_HAL_DISP_GetDhd0Vtthd(HI_ULONG *pExpectIntLineNumsForVoCallBack)
{
    /** 从前消隐开始算的 **/
    if (NULL != pExpectIntLineNumsForVoCallBack) {*pExpectIntLineNumsForVoCallBack = pOptmVdpReg->DHD0_VTTHD.bits.vtmgthd2 - (pOptmVdpReg->DHD0_VSYNC2.bits.vfb + 1);}
    return;
}

HI_VOID DRV_HIFB_HAL_DISP_GetDhd0State(HI_ULONG *pActualIntLineNumsForCallBack,HI_ULONG *pHardIntCntForCallBack)
{
    /** 从后消隐开始算的 **/
    if (NULL != pActualIntLineNumsForCallBack) {*pActualIntLineNumsForCallBack = pOptmVdpReg->DHD0_STATE.bits.count_vcnt;}
    /** 从后消隐开始算的 **/
    if (NULL != pHardIntCntForCallBack) {*pHardIntCntForCallBack = pOptmVdpReg->DHD0_STATE.bits.count_int;}
    return;
}

HI_VOID DRV_HIFB_HAL_GFX_GetWorkLayerAddr(HI_U32 u32Data, HI_U32 *pu32Addr)
{
    volatile U_GFX_WORK_ADDR GFX_WORK_ADDR;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_WORK_ADDR.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_WORK_ADDR.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pu32Addr) { *pu32Addr = GFX_WORK_ADDR.u32; }

    return;
}

HI_VOID DRV_HIFB_HAL_GFX_GetWillWorkLayerAddr(HI_U32 u32Data, HI_U32 *pu32Addr)
{
    volatile U_GFX_ADDR_L GFX_ADDR_L;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_ADDR_L.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pu32Addr) { *pu32Addr = GFX_ADDR_L.u32; }

    return;
}
#endif

/***************************************************************************************
* func        : DRV_HIFB_HAL_CBM_OpenMuteBk
* description : CNcomment: 打开patten调试 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_CBM_OpenMuteBk(HI_U32 u32Data)
{
    volatile U_GP0_UPD GP0_UPD;
    volatile U_GP0_MUTE_BK GP0_MUTE_BK;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    GP0_MUTE_BK.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_MUTE_BK.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_MUTE_BK.u32 = 0x800003ff;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_MUTE_BK.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_MUTE_BK.u32);

    GP0_UPD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_UPD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_UPD.bits.regup = 0x1;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_UPD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_UPD.u32);

    return;
}

/***************************************************************************************
* func        : DRV_HIFB_HAL_CBM_CloseMuteBk
* description : CNcomment: 打开patten调试 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_CBM_CloseMuteBk(HI_U32 u32Data)
{
    volatile U_GP0_UPD GP0_UPD;
    volatile U_GP0_MUTE_BK GP0_MUTE_BK;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    GP0_MUTE_BK.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_MUTE_BK.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_MUTE_BK.bits.mute_en = 0x0;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_MUTE_BK.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_MUTE_BK.u32);

    GP0_UPD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_UPD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_UPD.bits.regup = 0x1;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_UPD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_UPD.u32);

    return;
}

/***************************************************************************************
* func        : DRV_HIFB_HAL_CBM_SetMixerBkg
* description : CNcomment: 设置MIXG0叠加背景色寄存器 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_CBM_SetMixerBkg(OPTM_VDP_CBM_MIX_E u32mixer_id, OPTM_VDP_BKG_S *pstBkg)
{
    volatile U_MIXG0_BKG MIXG0_BKG;
    volatile U_MIXG0_BKALPHA MIXG0_BKALPHA;

    if ((VDP_CBM_MIXG0 == u32mixer_id) && (NULL != pstBkg))
    {
        /* G0 mixer link */
        MIXG0_BKG.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_BKG.u32)));
        MIXG0_BKG.bits.mixer_bkgy  = pstBkg->u32BkgY;
        MIXG0_BKG.bits.mixer_bkgcb = pstBkg->u32BkgU;
        MIXG0_BKG.bits.mixer_bkgcr = pstBkg->u32BkgV;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_BKG.u32)), MIXG0_BKG.u32);

        /** MIXG0 use SRC OVER alpha **/
        MIXG0_BKALPHA.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_BKALPHA.u32)));
        MIXG0_BKALPHA.bits.mixer_alpha  = pstBkg->u32BkgA;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_BKALPHA.u32)), MIXG0_BKALPHA.u32);
    }

    return;
}

HI_VOID DRV_HIFB_HAL_CBM_GetMixerPrio(OPTM_VDP_CBM_MIX_E u32mixer_id, HI_U32 *pu32prio)
{
    if ((VDP_CBM_MIXG0 == u32mixer_id) && (NULL != pu32prio))
    {
        *pu32prio = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)));
    }

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_CBM_SetMixgPrio
* description  : CNcomment: MIXG0优先级配置寄存器。在vsync处更新有效。
                            mixer_prio_x表示第x个优先级所配置的层。
                            该寄存器为即时寄存器。CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_CBM_SetMixgPrio(OPTM_VDP_CBM_MIX_E u32mixer_id,HI_U32 u32prio)
{
    volatile U_MIXG0_MIX MIXG0_MIX;

    if (VDP_CBM_MIXG0 == u32mixer_id)
    {
        MIXG0_MIX.u32 = u32prio;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
    }

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_CBM_SetMixerPrio
* description  : CNcomment: 设置图形层叠加优先级，Z序 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_CBM_SetMixerPrio(OPTM_VDP_CBM_MIX_E u32mixer_id,HI_U32 u32layer_id,HI_U32 u32prio)
{
    volatile U_MIXG0_MIX MIXG0_MIX;

    if (VDP_CBM_MIXG0 != u32mixer_id)
    {
        return;
    }

    switch (u32prio)
    {
        case 0:
        {
            MIXG0_MIX.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)));
            MIXG0_MIX.bits.mixer_prio0 = u32layer_id + 1;
            OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
            break;
        }
        case 1:
        {
            MIXG0_MIX.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)));
            MIXG0_MIX.bits.mixer_prio1 = u32layer_id + 1;
            OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
            break;
        }
        case 2:
        {
            MIXG0_MIX.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)));
            MIXG0_MIX.bits.mixer_prio2 = u32layer_id + 1;
            OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
            break;
        }
        case 3:
        {
            MIXG0_MIX.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)));
            MIXG0_MIX.bits.mixer_prio3 = u32layer_id + 1;
            OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
            break;
        }
        default:
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32prio);
            return ;
        }
    }

    return;
}

//-------------------------------------------------------------------
//GFX_BEGIN
//-------------------------------------------------------------------
/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_GetLayerEnable
* description  : CNcomment: 从寄存器中获取图层是否使能数据 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetLayerEnable(HI_U32 u32Data, HI_U32 *pu32Enable)
{
    volatile U_G0_CTRL G0_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    if (NULL != pu32Enable) { *pu32Enable  = G0_CTRL.bits.surface_en; }

    return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetLayerEnable
* description  : CNcomment: 设置图层使能 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerEnable(HI_U32 u32Data, HI_U32 u32bEnable)
{
    volatile U_GFX_ADDR_L GFX_ADDR_L;
    volatile U_G0_CTRL G0_CTRL;
    volatile U_GP0_CTRL GP0_CTRL;
    HI_U32 GpNum = HIFB_HAL_GetGpIdFromLayerId(u32Data);
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, u32Data);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, u32bEnable);

    GFX_ADDR_L.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (0 == GFX_ADDR_L.u32)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, GFX_ADDR_L.u32);
        return;
    }

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_CTRL.bits.surface_en = u32bEnable;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_CTRL.u32);

    GP0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_CTRL.bits.surface_en = u32bEnable;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_CTRL.u32);

    return;
}


/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetNoSecFlag
* description  : CNcomment: 设置DDR模式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetNoSecFlag(HI_U32 u32Data, HI_U32 u32Enable)
{
    volatile U_G0_CTRL G0_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_CTRL.bits.nosec_flag = u32Enable;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_CTRL.u32);

    return;
}


/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetDcmpEnable
* description  : CNcomment: 配置解压寄存器，和压缩有关, 现在是无损压缩 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetDcmpEnable(HI_U32 u32Data, HI_U32 u32bEnable)
{
#ifdef CFG_HI_FB_DECOMPRESS_SUPPORT
    volatile U_GFX_SRC_INFO GFX_SRC_INFO;
    volatile U_GFX_READ_CTRL GFX_READ_CTRL;

    if (0 == u32Data)
    {
        GFX_SRC_INFO.u32  = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_INFO.u32))));
        GFX_READ_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_READ_CTRL.u32))));

        GFX_SRC_INFO.bits.dcmp_type = (0 == u32bEnable) ? (0) : (1);
        GFX_READ_CTRL.bits.addr_map_en = 1;

        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_INFO.u32))), GFX_SRC_INFO.u32);
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_READ_CTRL.u32))), GFX_READ_CTRL.u32);
    }
#else
    HI_UNUSED(u32Data);
    HI_UNUSED(u32bEnable);
#endif
    return;
}

HI_VOID DRV_HIFB_HAL_GFX_GetDcmpEnable(HI_U32 u32Data, HI_U32 *pbEnable)
{
#ifdef CFG_HI_FB_DECOMPRESS_SUPPORT
    volatile U_GFX_SRC_INFO GFX_SRC_INFO;

    if ((0 == u32Data) && (NULL != pbEnable))
    {
        GFX_SRC_INFO.u32  = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_INFO.u32))));
        *pbEnable = GFX_SRC_INFO.bits.dcmp_type;
    }

#else
    HI_UNUSED(u32Data);
    HI_UNUSED(pbEnable);
#endif
    return;
}


#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func          : OPTM_VDP_GFX_SetDcmpARHeadAddr
* description   : CNcomment: 2D或3D左眼AR压缩头地址CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID OPTM_VDP_GFX_SetDcmpARHeadAddr(HI_U32 u32Data, HI_U32 ARHeadDdr)
{
    volatile U_GFX_HEAD_ADDR_L GFX_HEAD_ADDR_L;
#ifdef CONFIG_HIFB_MMU_SUPPORT
    volatile U_GFX_SMMU_BYPASS GFX_SMMU_BYPASS;
#endif
    if ((0 == u32Data) && (0 != ARHeadDdr))
    {
       GFX_HEAD_ADDR_L.u32 = ARHeadDdr;
       OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_HEAD_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_HEAD_ADDR_L.u32);

#ifdef CONFIG_HIFB_MMU_SUPPORT
      GFX_SMMU_BYPASS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
      #ifdef CONFIG_GFX_MMU_SUPPORT
        GFX_SMMU_BYPASS.bits.smmu_bypass_h2d = 0;
      #else
        GFX_SMMU_BYPASS.bits.smmu_bypass_h2d = 1;
      #endif
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SMMU_BYPASS.u32);
#endif
    }

    return;
}

/***************************************************************************************
* func          : OPTM_VDP_GFX_SetDcmpGBHeadAddr
* description   : CNcomment: 2D或3D左眼GB压缩头地址CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID OPTM_VDP_GFX_SetDcmpGBHeadAddr(HI_U32 u32Data, HI_U32 GBHeadDdr)
{
    volatile U_GFX_HEAD2_ADDR_L GFX_HEAD2_ADDR_L;
#ifdef CONFIG_HIFB_MMU_SUPPORT
    volatile U_GFX_SMMU_BYPASS GFX_SMMU_BYPASS;
#endif
    if ((0 == u32Data) && (0 != GBHeadDdr))
    {
        GFX_HEAD2_ADDR_L.u32 = GBHeadDdr;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_HEAD2_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_HEAD2_ADDR_L.u32);

#ifdef CONFIG_HIFB_MMU_SUPPORT
        GFX_SMMU_BYPASS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
       #ifdef CONFIG_GFX_MMU_SUPPORT
         GFX_SMMU_BYPASS.bits.smmu_bypass_h3d = 0;
       #else
         GFX_SMMU_BYPASS.bits.smmu_bypass_h3d = 1;
       #endif
         OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SMMU_BYPASS.u32);
#endif
    }

    return;
}

/***************************************************************************************
* func          : OPTM_VDP_GFX_SetDcmpGBDataAddr
* description   : CNcomment: GB压缩数据地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID OPTM_VDP_GFX_SetDcmpGBDataAddr(HI_U32 u32Data, HI_U32 GBDataDdr)
{
    volatile U_GFX_DCMP_ADDR_L GFX_DCMP_ADDR_L;
#ifdef CONFIG_HIFB_MMU_SUPPORT
    volatile U_GFX_SMMU_BYPASS GFX_SMMU_BYPASS;
#endif
    if ((0 == u32Data) && (0 != GBDataDdr))
    {
        GFX_DCMP_ADDR_L.u32 = GBDataDdr;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_DCMP_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_DCMP_ADDR_L.u32);

#ifdef CONFIG_HIFB_MMU_SUPPORT
        GFX_SMMU_BYPASS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        #ifdef CONFIG_GFX_MMU_SUPPORT
            GFX_SMMU_BYPASS.bits.smmu_bypass_3d = 0;
        #else
            GFX_SMMU_BYPASS.bits.smmu_bypass_3d = 1;
        #endif
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SMMU_BYPASS.u32);
#endif
    }

    return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_GetLayerAddr
* description  : CNcomment: 获取surface 帧buffer地址 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetLayerAddr(HI_U32 u32Data, HI_U32 *pu32Addr)
{
    volatile U_GFX_ADDR_L GFX_ADDR_L;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_ADDR_L.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pu32Addr) { *pu32Addr = GFX_ADDR_L.u32; }

    return;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetLayerAddrEX
* description   : CNcomment: 2D或3D左眼显示地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerAddrEX(HI_U32 u32Data, HI_U32 u32LAddr)
{
    volatile U_G0_CTRL G0_CTRL;
    volatile U_GFX_ADDR_L GFX_ADDR_L;
#ifdef CONFIG_HIFB_MMU_SUPPORT
    volatile U_GFX_SMMU_BYPASS GFX_SMMU_BYPASS;
#endif
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    if ((0 == u32LAddr) && (1 == G0_CTRL.bits.surface_en))
    {
       //HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32LAddr);
       //HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, G0_CTRL.u32);
       return;
    }

    GFX_ADDR_L.u32 = u32LAddr;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_ADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_ADDR_L.u32);

#ifdef CONFIG_HIFB_MMU_SUPPORT
    GFX_SMMU_BYPASS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    #ifdef CONFIG_GFX_MMU_SUPPORT
        GFX_SMMU_BYPASS.bits.smmu_bypass_2d = 0;
    #else
        GFX_SMMU_BYPASS.bits.smmu_bypass_2d = 1;
    #endif
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SMMU_BYPASS.u32);
#endif

    return;
}

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_GetLayerStride
* description   : CNcomment: 获取stride CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetLayerStride(HI_U32 u32Data, HI_U32 *pu32Stride)
{
    volatile U_GFX_STRIDE GFX_STRIDE;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_STRIDE.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pu32Stride) { *pu32Stride = GFX_STRIDE.bits.surface_stride * STRIDE_ALIGN; }

    return;
}
#endif


/***************************************************************************************
* func        : DRV_HIFB_HAL_GFX_SetLayerStride
* description : CNcomment: 设置图层stride CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerStride(HI_U32 u32Data, HI_U32 u32Stride)
{
    volatile U_GFX_STRIDE GFX_STRIDE;
    volatile U_GFX_HEAD_STRIDE GFX_HEAD_STRIDE;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (0 != u32Stride)
    {
        GFX_STRIDE.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_STRIDE.bits.surface_stride = u32Stride / STRIDE_ALIGN;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_STRIDE.u32);

        GFX_HEAD_STRIDE.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_HEAD_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_HEAD_STRIDE.bits.head_stride = 1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_HEAD_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_HEAD_STRIDE.u32);
    }

    return;
}

#if !defined(HI_BUILD_IN_BOOT)
/***************************************************************************************
* func        : OPTM_VDP_GFX_SetGBdataStride
* description : CNcomment: 设置压缩数据GB的stride CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_VOID OPTM_VDP_GFX_SetGBdataStride(HI_U32 u32Data, HI_U32 GBDataStride)
{
    volatile U_GFX_STRIDE GFX_STRIDE;
    volatile U_GFX_HEAD_STRIDE GFX_HEAD_STRIDE;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (0 != GBDataStride)
    {
        GFX_STRIDE.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_STRIDE.bits.dcmp_stride = GBDataStride / STRIDE_ALIGN;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_STRIDE.u32);

        GFX_HEAD_STRIDE.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_HEAD_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_HEAD_STRIDE.bits.head2_stride = 1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_HEAD_STRIDE.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_HEAD_STRIDE.u32);
    }

    return;
}
#endif

HI_VOID DRV_HIFB_HAL_GFX_SetDeCmpDdrInfo(HI_U32 u32Data, HI_U32 ARHeadDdr,HI_U32 ARDataDdr,HI_U32 GBHeadDdr,HI_U32 GBDataDdr,HI_U32 DeCmpStride)
{
#if !defined(HI_BUILD_IN_BOOT)
      if (0 == u32Data)
      {
          OPTM_VDP_GFX_SetDcmpARHeadAddr  (u32Data,ARHeadDdr);
          DRV_HIFB_HAL_GFX_SetLayerAddrEX (u32Data,ARDataDdr);
          OPTM_VDP_GFX_SetDcmpGBHeadAddr  (u32Data,GBHeadDdr);
          OPTM_VDP_GFX_SetDcmpGBDataAddr  (u32Data,GBDataDdr);
          DRV_HIFB_HAL_GFX_SetLayerStride (u32Data,DeCmpStride);
          OPTM_VDP_GFX_SetGBdataStride    (u32Data,DeCmpStride);
      }
#else
      HI_UNUSED(u32Data);
      HI_UNUSED(ARHeadDdr);
      HI_UNUSED(ARDataDdr);
      HI_UNUSED(GBHeadDdr);
      HI_UNUSED(GBDataDdr);
      HI_UNUSED(DeCmpStride);
#endif
      return;
}

/***************************************************************************************
* func        : DRV_HIFB_HAL_GFX_GetDeCmpStatus
* description : CNcomment: 获取解压处理信息，调试使用 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_GetDeCmpStatus(HI_U32 u32Data, HI_BOOL *pbARDataDecompressErr, HI_BOOL *pbGBDataDecompressErr, HI_BOOL bCloseInterrupt)
{
    volatile U_DCMP_WRONG_STA DCMP_WRONG_STA;

    if (0 == u32Data)
    {
        DCMP_WRONG_STA.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->DCMP_WRONG_STA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));

        if ((1 == DCMP_WRONG_STA.bits.wrong_ar) && (NULL != pbARDataDecompressErr))
        {
            *pbARDataDecompressErr = HI_TRUE;
            if (HI_TRUE == bCloseInterrupt)
            {
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "decompress ar data err");
                DRV_HIFB_HAL_GFX_SetInterrupt(HI_FALSE);
            }
        }

        if ((1 == DCMP_WRONG_STA.bits.wrong_gb) && (NULL != pbGBDataDecompressErr))
        {
            *pbGBDataDecompressErr = HI_TRUE;
            if (HI_TRUE == bCloseInterrupt)
            {
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "decompress gb data err");
                DRV_HIFB_HAL_GFX_SetInterrupt(HI_FALSE);
            }
        }

        DCMP_WRONG_STA.bits.wrong_ar = 1;
        DCMP_WRONG_STA.bits.wrong_gb = 1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->DCMP_WRONG_STA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), DCMP_WRONG_STA.u32);
    }

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetLutAddr
* description  : CNcomment: 设置调色板地址 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLutAddr(HI_U32 u32Data, HI_U32 u32LutAddr)
{
#ifdef CONFIG_HIFB_VERSION_2_0
    volatile U_PARA_ADDR_VHD_CHN17 PARA_ADDR_VHD_CHN17;
    volatile U_PARA_ADDR_VHD_CHN18 PARA_ADDR_VHD_CHN18;
    HI_UNUSED(u32Data);

    PARA_ADDR_VHD_CHN17.u32 = u32LutAddr;
    PARA_ADDR_VHD_CHN18.u32 = u32LutAddr;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_ADDR_VHD_CHN17.u32))), PARA_ADDR_VHD_CHN17.u32);
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_ADDR_VHD_CHN18.u32))), PARA_ADDR_VHD_CHN18.u32);
#endif

#ifdef CONFIG_HIFB_VERSION_3_0
    volatile U_PARA_ADDR_VHD_CHN11 PARA_ADDR_VHD_CHN11;
    volatile U_PARA_ADDR_VHD_CHN12 PARA_ADDR_VHD_CHN12;
    volatile U_PARA_ADDR_VHD_CHN14 PARA_ADDR_VHD_CHN14;

    if (0 == u32Data)
    {
        PARA_ADDR_VHD_CHN11.u32 = u32LutAddr;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_ADDR_VHD_CHN11.u32))), PARA_ADDR_VHD_CHN11.u32);
    }
    else if (1 == u32Data)
    {
        PARA_ADDR_VHD_CHN12.u32 = u32LutAddr;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_ADDR_VHD_CHN12.u32))), PARA_ADDR_VHD_CHN12.u32);
    }
    else
    {
        PARA_ADDR_VHD_CHN14.u32 = u32LutAddr;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_ADDR_VHD_CHN14.u32))), PARA_ADDR_VHD_CHN14.u32);
    }
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_GetInDataFmt
* description  : CNcomment: 获取输入的像素格式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetInDataFmt(HI_U32 u32Data, OPTM_VDP_GFX_IFMT_E *enDataFmt)
{
    volatile U_GFX_SRC_INFO GFX_SRC_INFO;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_SRC_INFO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_INFO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != enDataFmt) { *enDataFmt = GFX_SRC_INFO.bits.ifmt; }

    return;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetInDataFmt
* description   : CNcomment: 输入数据格式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetInDataFmt(HI_U32 u32Data, OPTM_VDP_GFX_IFMT_E  enDataFmt)
{
    volatile U_GFX_SRC_INFO GFX_SRC_INFO;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_SRC_INFO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_INFO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_SRC_INFO.bits.ifmt = enDataFmt;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_INFO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SRC_INFO.u32);

    return;
}


/***************************************************************************************
* func        : DRV_HIFB_HAL_GFX_SetBitExtend
* description : CNcomment: 设置低位扩展模式
                           所谓低位扩展就是比如ARGB1555,R少了3位，这三位如何补齐
                           是用高一位还高几位还是使用0来补齐 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetBitExtend(HI_U32 u32Data, OPTM_VDP_GFX_BITEXTEND_E u32mode)
{
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_OUT_CTRL.bits.bitext = u32mode;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_OUT_CTRL.u32);

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetColorKey
* description  : CNcomment:设置color key的值CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetColorKey(HI_U32 u32Data,HI_U32  bkeyEn,OPTM_VDP_GFX_CKEY_S *pstKey)
{
    volatile U_GFX_CKEY_MAX GFX_CKEY_MAX;
    volatile U_GFX_CKEY_MIN GFX_CKEY_MIN;
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (NULL != pstKey)
    {
        GFX_CKEY_MAX.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MAX.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_CKEY_MAX.bits.key_r_max = pstKey->u32Key_r_max;
        GFX_CKEY_MAX.bits.key_g_max = pstKey->u32Key_g_max;
        GFX_CKEY_MAX.bits.key_b_max = pstKey->u32Key_b_max;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MAX.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_CKEY_MAX.u32);

        GFX_CKEY_MIN.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MIN.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_CKEY_MIN.bits.key_r_min = pstKey->u32Key_r_min;
        GFX_CKEY_MIN.bits.key_g_min = pstKey->u32Key_g_min;
        GFX_CKEY_MIN.bits.key_b_min = pstKey->u32Key_b_min;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MIN.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_CKEY_MIN.u32);

        GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_OUT_CTRL.bits.key_en   = bkeyEn;
        GFX_OUT_CTRL.bits.key_mode = pstKey->bKeyMode;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_OUT_CTRL.u32);
    }

    return;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetColorKey(HI_U32 u32Data, HI_U32 *pbkeyEn,OPTM_VDP_GFX_CKEY_S *pstKey)
{
    volatile U_GFX_CKEY_MAX GFX_CKEY_MAX;
    volatile U_GFX_CKEY_MIN GFX_CKEY_MIN;
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_CKEY_MAX.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MAX.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_CKEY_MIN.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MIN.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));

    if (NULL != pbkeyEn) { *pbkeyEn = GFX_OUT_CTRL.bits.key_en; }

    if (NULL != pstKey)
    {
        pstKey->u32Key_r_max = GFX_CKEY_MAX.bits.key_r_max;
        pstKey->u32Key_g_max = GFX_CKEY_MAX.bits.key_g_max;
        pstKey->u32Key_b_max = GFX_CKEY_MAX.bits.key_b_max;

        pstKey->u32Key_r_min = GFX_CKEY_MIN.bits.key_r_min;
        pstKey->u32Key_g_min = GFX_CKEY_MIN.bits.key_g_min;
        pstKey->u32Key_b_min = GFX_CKEY_MIN.bits.key_b_min;

        pstKey->bKeyMode = GFX_OUT_CTRL.bits.key_mode;
    }

    return;
}
#endif


/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetKeyMask
* description  : CNcomment:设置掩码值，将color key的实际值与掩码值做与操作，这样就可以
                           key掉一个范围值，而不只单个值CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetKeyMask(HI_U32 u32Data, OPTM_VDP_GFX_MASK_S *pstMsk)
{
    volatile U_GFX_CKEY_MASK GFX_CKEY_MASK;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (NULL != pstMsk)
    {
        GFX_CKEY_MASK.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MASK.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_CKEY_MASK.bits.key_r_msk = pstMsk->u32Mask_r;
        GFX_CKEY_MASK.bits.key_g_msk = pstMsk->u32Mask_g;
        GFX_CKEY_MASK.bits.key_b_msk = pstMsk->u32Mask_b;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MASK.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_CKEY_MASK.u32);
    }

    return;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetKeyMask(HI_U32 u32Data, OPTM_VDP_GFX_MASK_S *pstMsk)
{
    volatile U_GFX_CKEY_MASK GFX_CKEY_MASK;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (NULL != pstMsk)
    {
        GFX_CKEY_MASK.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_CKEY_MASK.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        pstMsk->u32Mask_r = GFX_CKEY_MASK.bits.key_r_msk;
        pstMsk->u32Mask_g = GFX_CKEY_MASK.bits.key_g_msk;
        pstMsk->u32Mask_b = GFX_CKEY_MASK.bits.key_b_msk;
    }

    return;
}
#endif


/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetReadMode
* description   : CNcomment: 设置图层读取数据模式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetReadMode(HI_U32 u32Data, HI_U32 u32Mode)
{
    volatile U_GFX_READ_CTRL GFX_READ_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);
    GFX_READ_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_READ_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_READ_CTRL.bits.read_mode = u32Mode;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_READ_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_READ_CTRL.u32);
    return;
}

HI_VOID DRV_HIFB_HAL_GFX_GetReadMode(HI_U32 u32Data, HI_U32 *pu32Mode)
{
    volatile U_GFX_READ_CTRL GFX_READ_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_READ_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_READ_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pu32Mode)
    {
        *pu32Mode = GFX_READ_CTRL.bits.read_mode;
    }
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetParaUpd
* description   : CNcomment: 设置图层更新模式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetParaUpd(HI_U32 u32Data, OPTM_VDP_DISP_COEFMODE_E enMode)
{
    volatile U_PARA_UP_VHD PARA_UP_VHD;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if ((enMode != VDP_DISP_COEFMODE_LUT) && (enMode != VDP_DISP_COEFMODE_ALL))
    {
        return;
    }

#ifdef CONFIG_HIFB_VERSION_2_0
    if (0 == u32Data)
    {
        PARA_UP_VHD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))));
        PARA_UP_VHD.bits.para_up_vhd_chn17 = 0x1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    }
    else
    {
        PARA_UP_VHD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))));
        PARA_UP_VHD.bits.para_up_vhd_chn18 = 0x1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    }
#endif

#ifdef CONFIG_HIFB_VERSION_3_0
    if (0 == u32Data)
    {
        PARA_UP_VHD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))));
        PARA_UP_VHD.bits.para_up_vhd_chn11 = 0x1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    }
    else if (1 == u32Data)
    {
        PARA_UP_VHD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))));
        PARA_UP_VHD.bits.para_up_vhd_chn12 = 0x1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    }
    else
    {
        PARA_UP_VHD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))));
        PARA_UP_VHD.bits.para_up_vhd_chn14 = 0x1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    }
#endif

    return;
}

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetThreeDimDofEnable
* description   : CNcomment: 设置景深 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_SetThreeDimDofEnable(HI_U32 u32Data, HI_U32 bEnable)
{
    volatile U_G0_DOF_CTRL G0_DOF_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_DOF_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DOF_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_DOF_CTRL.bits.dof_en = bEnable;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DOF_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_DOF_CTRL.u32);

    return;
}

HI_VOID DRV_HIFB_HAL_GFX_SetThreeDimDofStep(HI_U32 u32Data, HI_S32 s32LStep, HI_S32 s32RStep)
{
    volatile U_G0_DOF_STEP G0_DOF_STEP;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_DOF_STEP.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DOF_STEP.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_DOF_STEP.bits.right_step= s32RStep;
    G0_DOF_STEP.bits.left_step = s32LStep;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DOF_STEP.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_DOF_STEP.u32);

    return;
}

/***************************************************************************************
* func        : DRV_HIFB_HAL_GFX_GetLayerInRect
* description : CNcomment: 获取图层的输入数据 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_GetLayerInRect(HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *stInRect)
{
    /** LBOX **/
    U_G0_VFPOS G0_VFPOS;
    U_G0_VLPOS G0_VLPOS;
    U_G0_DFPOS G0_DFPOS;
    U_G0_DLPOS G0_DLPOS;
    U_GFX_SRC_CROP GFX_SRC_CROP;
    U_GFX_IRESO GFX_IRESO;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (NULL != stInRect)
    {
        G0_VFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_VFPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        stInRect->u32VX = G0_VFPOS.bits.video_xfpos;
        stInRect->u32VY = G0_VFPOS.bits.video_yfpos;

        G0_DFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DFPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        stInRect->u32DXS = G0_DFPOS.bits.disp_xfpos;
        stInRect->u32DYS = G0_DFPOS.bits.disp_yfpos;

        G0_DLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DLPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        stInRect->u32DXL = G0_DLPOS.bits.disp_xlpos + 1;
        stInRect->u32DYL = G0_DLPOS.bits.disp_ylpos + 1;

        G0_VLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_VLPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        stInRect->u32VXL = G0_VLPOS.bits.video_xlpos + 1;
        stInRect->u32VYL = G0_VLPOS.bits.video_ylpos + 1;

        GFX_SRC_CROP.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_CROP.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        stInRect->u32SX = GFX_SRC_CROP.bits.src_crop_x;
        stInRect->u32SY = GFX_SRC_CROP.bits.src_crop_y;

        GFX_IRESO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_IRESO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        stInRect->u32IWth = GFX_IRESO.bits.ireso_w + 1;
        stInRect->u32IHgt = GFX_IRESO.bits.ireso_h + 1;
    }

    return;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetLayerReso
* description   : CNcomment: 设置图层分辨率 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerReso(HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *pstRect)
{
    /** LBOX **/
    volatile U_G0_VFPOS G0_VFPOS;
    volatile U_G0_VLPOS G0_VLPOS;
    volatile U_G0_DFPOS G0_DFPOS;
    volatile U_G0_DLPOS G0_DLPOS;
    U_GFX_SRC_RESO GFX_SRC_RESO;
    U_GFX_SRC_CROP GFX_SRC_CROP;
    U_GFX_IRESO GFX_IRESO;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (NULL != pstRect)
    {
        G0_VFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_VFPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        G0_VFPOS.bits.video_xfpos = pstRect->u32VX;
        G0_VFPOS.bits.video_yfpos = pstRect->u32VY;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_VFPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_VFPOS.u32);

        G0_VLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_VLPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        G0_VLPOS.bits.video_xlpos = pstRect->u32VX + pstRect->u32OWth;
        G0_VLPOS.bits.video_xlpos = (0 == G0_VLPOS.bits.video_xlpos) ? (0) : (G0_VLPOS.bits.video_xlpos - 1);

        G0_VLPOS.bits.video_ylpos = pstRect->u32VY + pstRect->u32OHgt;
        G0_VLPOS.bits.video_ylpos = (0 == G0_VLPOS.bits.video_ylpos) ? (0) : (G0_VLPOS.bits.video_ylpos - 1);
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_VLPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_VLPOS.u32);

        G0_DFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DFPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        G0_DFPOS.bits.disp_xfpos = pstRect->u32DXS;
        G0_DFPOS.bits.disp_yfpos = pstRect->u32DYS;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DFPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_DFPOS.u32);

        G0_DLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DLPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
        G0_DLPOS.bits.disp_xlpos = pstRect->u32DXL;
        G0_DLPOS.bits.disp_xlpos = (0 == G0_DLPOS.bits.disp_xlpos) ? (0) : (G0_DLPOS.bits.disp_xlpos - 1);

        G0_DLPOS.bits.disp_ylpos = pstRect->u32DYL;
        G0_DLPOS.bits.disp_ylpos = (0 == G0_DLPOS.bits.disp_ylpos) ? (0) : (G0_DLPOS.bits.disp_ylpos - 1);
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_DLPOS.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_DLPOS.u32);


        GFX_SRC_CROP.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_CROP.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_SRC_CROP.bits.src_crop_x = pstRect->u32SX;
        GFX_SRC_CROP.bits.src_crop_y = pstRect->u32SY;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_CROP.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SRC_CROP.u32);

        GFX_IRESO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_IRESO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_IRESO.bits.ireso_w = pstRect->u32IWth;
        GFX_IRESO.bits.ireso_w = (0 == GFX_IRESO.bits.ireso_w) ? (0) : (GFX_IRESO.bits.ireso_w - 1);

        GFX_IRESO.bits.ireso_h = pstRect->u32IHgt;
        GFX_IRESO.bits.ireso_h = (0 == GFX_IRESO.bits.ireso_h) ? (0) : (GFX_IRESO.bits.ireso_h - 1);
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_IRESO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_IRESO.u32);

        GFX_SRC_RESO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_RESO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        GFX_SRC_RESO.bits.src_w = pstRect->u32IWth;
        GFX_SRC_RESO.bits.src_w = (0 == GFX_SRC_RESO.bits.src_w) ? (0) : (GFX_SRC_RESO.bits.src_w - 1);

        GFX_SRC_RESO.bits.src_h = pstRect->u32IHgt;
        GFX_SRC_RESO.bits.src_h = (0 == GFX_SRC_RESO.bits.src_h) ? (0) : (GFX_SRC_RESO.bits.src_h - 1);
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SRC_RESO.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SRC_RESO.u32);
    }

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetRegUp
* description  : CNcomment: 设置图层更新使能寄存器，更新完之后硬件自动清0 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetRegUp(HI_U32 u32Data)
{
    volatile U_G0_UPD G0_UPD;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_UPD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_UPD.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_UPD.bits.regup = 0x1;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_UPD.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_UPD.u32);

    return;
}


/***************************************************************************************
* func        : DRV_HIFB_HAL_GFX_SetLayerBkg
* description : CNcomment: 设置图层背景色 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerBkg(HI_U32 u32Data, OPTM_VDP_BKG_S *pstBkg)
{
    volatile U_G0_BK    G0_BK;
    volatile U_G0_ALPHA G0_ALPHA;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    if (NULL != pstBkg)
    {
        G0_BK.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_BK.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        G0_BK.bits.vbk_y  = pstBkg->u32BkgY ;
        G0_BK.bits.vbk_cb = pstBkg->u32BkgU;
        G0_BK.bits.vbk_cr = pstBkg->u32BkgV;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_BK.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), G0_BK.u32);

        G0_ALPHA.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_ALPHA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
        G0_ALPHA.bits.vbk_alpha = pstBkg->u32BkgA;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_ALPHA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), G0_ALPHA.u32);
    }

    return;
}


/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetLayerGalpha
* description  : CNcomment: 设置图层全局alpha CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerGalpha(HI_U32 u32Data, HI_U32 u32Alpha0)
{
    volatile U_G0_CTRL G0_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_CTRL.bits.galpha = u32Alpha0;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_CTRL.u32);

    return;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetLayerGalpha(HI_U32 u32Data, HI_U8 *pu8Alpha0)
{
    volatile U_G0_CTRL G0_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    if (NULL != pu8Alpha0) { *pu8Alpha0 = G0_CTRL.bits.galpha; }

    return;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetPalpha
* description   : CNcomment: 设置pixle alpha值 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetPalpha(HI_U32 u32Data, HI_U32 bAlphaEn,HI_U32 bArange,HI_U32 u32Alpha0,HI_U32 u32Alpha1)
{
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    volatile U_GFX_1555_ALPHA GFX_1555_ALPHA;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_1555_ALPHA.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_1555_ALPHA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_1555_ALPHA.bits.alpha_0 = u32Alpha0;
    GFX_1555_ALPHA.bits.alpha_1 = u32Alpha1;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_1555_ALPHA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_1555_ALPHA.u32);

    GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_OUT_CTRL.bits.palpha_en    = bAlphaEn;
    GFX_OUT_CTRL.bits.palpha_range = bArange;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_OUT_CTRL.u32);

    return;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID  DRV_HIFB_HAL_GFX_GetPalpha(HI_U32 u32Data, HI_U32 *pbAlphaEn,HI_U32 *pbArange,HI_U8 *pu8Alpha0,HI_U8 *pu8Alpha1)
{
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    volatile U_GFX_1555_ALPHA GFX_1555_ALPHA;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_1555_ALPHA.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_1555_ALPHA.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pu8Alpha0) { *pu8Alpha0 = GFX_1555_ALPHA.bits.alpha_0; }
    if (NULL != pu8Alpha1) { *pu8Alpha1 = GFX_1555_ALPHA.bits.alpha_1; }

    GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pbArange) { *pbArange  = GFX_OUT_CTRL.bits.palpha_range; }
    if (NULL != pbAlphaEn) { *pbAlphaEn = GFX_OUT_CTRL.bits.palpha_en; }

    return;
}


/***************************************************************************************
* func          : DRV_HIFB_HAL_GFX_SetLayerNAddr
* description   : CNcomment: 3D右眼显示地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetLayerNAddr(HI_U32 u32Data, HI_U32 u32NAddr)
{
    volatile U_GFX_NADDR_L GFX_NADDR_L;
#ifdef CONFIG_HIFB_MMU_SUPPORT
    volatile U_GFX_SMMU_BYPASS GFX_SMMU_BYPASS;
#endif
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_NADDR_L.u32 = u32NAddr;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_NADDR_L.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_NADDR_L.u32);

#ifdef CONFIG_HIFB_MMU_SUPPORT
    GFX_SMMU_BYPASS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    #ifdef CONFIG_GFX_MMU_SUPPORT
        GFX_SMMU_BYPASS.bits.smmu_bypass_3d = 0;
    #else
        GFX_SMMU_BYPASS.bits.smmu_bypass_3d = 1;
    #endif
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_SMMU_BYPASS.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_SMMU_BYPASS.u32);
#endif

    return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetPreMultEnable
* description  : CNcomment: 叠加寄存器预乘使能 CNend\n
* param[in]    : HI_VOID
                 HDR:   GP0   : 只有G0或G1:    depremult_en = 图层预乘开关一致
                                    G0+G1 :    depremult_en = 1
                 NoHDR: GP0   :  depremult_en = 0
                -----------------------------------------------------------------------
                 G0/G1 : 预乘开关跟随源
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetPreMultEnable(HI_U32 u32Data, HI_U32 bEnable, HI_BOOL bHdr)
{
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    volatile U_GP0_CTRL GP0_CTRL;
    volatile U_G0_CTRL G1_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    GFX_OUT_CTRL.bits.premulti_en = bEnable;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET), GFX_OUT_CTRL.u32);

    if (0 != u32Data)
    {
        return;
    }

    G1_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + CONFIG_HIFB_CTL_OFFSET));
    GP0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32))));

    GP0_CTRL.bits.depremult_en = 0;

    if (HI_FALSE == bHdr)
    {
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32))), GP0_CTRL.u32);
        return;
    }

    if (0 == G1_CTRL.bits.surface_en)
    {
        GP0_CTRL.bits.depremult_en = bEnable;
    }
    else
    {
        GP0_CTRL.bits.depremult_en = 1;
    }

    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32))), GP0_CTRL.u32);

    return;
}

HI_VOID DRV_HIFB_HAL_GFX_GetPreMultEnable(HI_U32 u32Data, HI_U32 *pbEnable, HI_BOOL *pDePreMult)
{
    volatile U_GFX_OUT_CTRL GFX_OUT_CTRL;
    volatile U_GP0_CTRL GP0_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    GFX_OUT_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_OUT_CTRL.u32)) + u32Data * CONFIG_HIFB_GFX_OFFSET));
    if (NULL != pbEnable) { *pbEnable = GFX_OUT_CTRL.bits.premulti_en; }

    GP0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32))));
    if (NULL != pDePreMult) { *pDePreMult = GP0_CTRL.bits.depremult_en; }

    return;
}

HI_VOID DRV_HIFB_HAL_GFX_ReadRegister(HI_U32 Offset, HI_U32* pRegBuf)
{
    HI_U32 Index = 0;
    HI_U32 Loop = (NULL == pRegBuf)? (16) : (CONFIG_VDP_SIZE / 4);
    HI_U32 Value = 0x0;
    HI_UNUSED(Value);

    if (Offset >= CONFIG_VDP_SIZE)
    {
        return;
    }

    if (NULL != pRegBuf)
    {
        for (Index = 0; Index < Loop; Index++)
        {
            Value = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Index * 4));
            *(pRegBuf + Index) = Value;
        }
        return;
    }

    for (Index = 0; Index < Loop; Index++)
    {
        HI_GFX_Print("%04x: ",(Offset + Index * 16));
        Value = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset + Index * 16));
        HI_GFX_Print("%08x ",Value);
        Value = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset + Index * 16 + 0x4));
        HI_GFX_Print("%08x ",Value);
        Value = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset + Index * 16 + 0x8));
        HI_GFX_Print("%08x ",Value);
        Value = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset + Index * 16 + 0xc));
        HI_GFX_Print("%08x ",Value);
        HI_GFX_Print("\n");
    }

    return;
}

HI_VOID DRV_HIFB_HAL_GFX_WriteRegister(HI_U32 Offset,HI_U32 Value)
{
    HI_U32 PreValue = 0x0;
    HI_U32 CurValue = 0x0;
    HI_UNUSED(PreValue);
    HI_UNUSED(CurValue);

    if ((Offset < 0xc) || ((Offset > 0x10) && (Offset < 0x5000)) || (Offset >= 0xc000))
    {
        return;
    }

    PreValue = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset));

    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset), Value);

    CurValue = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOCTRL.u32)) + Offset));

#if defined(HI_LOG_SUPPORT) && (0 == HI_LOG_SUPPORT)
    HI_GFX_Print("\n%04x: 0x%x - > 0x%x\n",Offset, PreValue, CurValue);
#endif
    return;
}


#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_LOWPOWER_SUPPORT)
HI_VOID DRV_HIFB_HAL_GFX_SetLowPowerInfo(HI_U32 u32Data, HI_U32 *pLowPowerInfo)
{
    HI_UNUSED(u32Data);
    HI_UNUSED(pLowPowerInfo);
    return;
}

HI_VOID DRV_HIFB_HAL_GFX_EnableLayerLowPower(HI_U32 u32Data, HI_BOOL EnLowPower)
{
   HI_UNUSED(u32Data);
   HI_UNUSED(EnLowPower);
   return;
}

HI_VOID DRV_HIFB_HAL_GFX_EnableGpLowPower(HI_U32 u32Data, HI_BOOL EnLowPower)
{
    HI_UNUSED(u32Data);
    HI_UNUSED(EnLowPower);
    return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_HAL_GFX_SetUpdMode
* description  : CNcomment: 设置图层更新数据模式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GFX_SetUpdMode(HI_U32 u32Data, HI_U32 u32Mode)
{
    volatile U_G0_CTRL G0_CTRL;
    CONFIG_HIFB_CHECK_LAYER_SUPPORT(u32Data);

    G0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET));
    G0_CTRL.bits.upd_mode = u32Mode;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->G0_CTRL.u32)) + u32Data * CONFIG_HIFB_CTL_OFFSET), G0_CTRL.u32);

    return;
}

//-------------------------------------------------------------------
//GP_BEGIN
//-------------------------------------------------------------------
HI_VOID DRV_HIFB_HAL_GP_SetParaUpd(HI_U32 u32Data, OPTM_VDP_GP_PARA_E enMode)
{
    volatile U_PARA_UP_VHD PARA_UP_VHD;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    PARA_UP_VHD.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
#ifdef CONFIG_HIFB_VERSION_2_0
    PARA_UP_VHD.bits.para_up_vhd_chn16 = 0x1;
#endif

#ifdef CONFIG_HIFB_VERSION_3_0
    PARA_UP_VHD.bits.para_up_vhd_chn04 = 0x1;
#endif
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->PARA_UP_VHD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), PARA_UP_VHD.u32);

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GP_SetReadMode
* description  : CNcomment: 设置GP读取数据模式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GP_SetReadMode(HI_U32 u32Data, HI_U32 u32Mode)
{
    volatile U_GP0_CTRL GP0_CTRL;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    GP0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_CTRL.bits.read_mode = u32Mode;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_CTRL.u32);

    return;
}

HI_VOID DRV_HIFB_HAL_GP_SetUpMode(HI_U32 u32Data, HI_U32 u32Mode)
{
    volatile U_GP0_CTRL GP0_CTRL;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    GP0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_CTRL.bits.rgup_mode = u32Mode;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_CTRL.u32);

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GP_GetRect
* description  : CNcomment: 获取GP大小 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID  DRV_HIFB_HAL_GP_GetRect(HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *pstRect)
{
    volatile U_GP0_IRESO GP0_IRESO;
    volatile U_GP0_ZME_VINFO GP0_ZME_VINFO;
    volatile U_GP0_ZME_HINFO GP0_ZME_HINFO;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    if (NULL != pstRect)
    {
        GP0_IRESO.u32    = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_IRESO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        pstRect->u32IWth = GP0_IRESO.bits.iw + 1;
        pstRect->u32IHgt = GP0_IRESO.bits.ih + 1;

        GP0_ZME_VINFO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_ZME_VINFO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_ZME_HINFO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_ZME_HINFO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        pstRect->u32OWth  = GP0_ZME_HINFO.bits.out_width + 1;
        pstRect->u32OHgt  = GP0_ZME_VINFO.bits.out_height + 1;
    }

    return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_HAL_GP_SetLayerReso
* description  : CNcomment: 设置GP输入输出分辨率 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GP_SetLayerReso(HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *pstRect)
{
    volatile U_GP0_VFPOS GP0_VFPOS;
    volatile U_GP0_VLPOS GP0_VLPOS;
    volatile U_GP0_DFPOS GP0_DFPOS;
    volatile U_GP0_DLPOS GP0_DLPOS;
    volatile U_GP0_IRESO GP0_IRESO;
    volatile U_GP0_ZME_VINFO GP0_ZME_VINFO;
    volatile U_GP0_ZME_HINFO GP0_ZME_HINFO;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    if (NULL != pstRect)
    {
        /** video position **/
        GP0_VFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_VFPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_VFPOS.bits.video_xfpos = pstRect->u32VX;
        GP0_VFPOS.bits.video_yfpos = pstRect->u32VY;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_VFPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_VFPOS.u32);

        GP0_VLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_VLPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_VLPOS.bits.video_xlpos = pstRect->u32VX + pstRect->u32OWth - 1;
        GP0_VLPOS.bits.video_ylpos = pstRect->u32VY + pstRect->u32OHgt - 1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_VLPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_VLPOS.u32);

        GP0_DFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_DFPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_DFPOS.bits.disp_xfpos = pstRect->u32DXS;
        GP0_DFPOS.bits.disp_yfpos = pstRect->u32DYS;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_DFPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_DFPOS.u32);

        GP0_DLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_DLPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_DLPOS.bits.disp_xlpos = pstRect->u32DXL-1;
        GP0_DLPOS.bits.disp_ylpos = pstRect->u32DYL-1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_DLPOS.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_DLPOS.u32);

        GP0_IRESO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_IRESO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_IRESO.bits.iw = pstRect->u32IWth - 1;
        GP0_IRESO.bits.ih = pstRect->u32IHgt - 1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_IRESO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_IRESO.u32);

        GP0_ZME_VINFO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_ZME_VINFO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_ZME_HINFO.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_ZME_HINFO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
        GP0_ZME_HINFO.bits.out_width  = pstRect->u32OWth - 1;
        GP0_ZME_VINFO.bits.out_height = pstRect->u32OHgt - 1;
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_ZME_VINFO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_ZME_VINFO.u32);
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_ZME_HINFO.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_ZME_HINFO.u32);
    }

    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_GP_SetLayerGalpha
* description  : CNcomment: 设置全局alpha CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GP_SetLayerGalpha(HI_U32 u32Data, HI_U32 u32Alpha)
{
    volatile U_GP0_CTRL GP0_CTRL;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    GP0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET));
    GP0_CTRL.bits.galpha = u32Alpha;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_CTRL.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_CTRL.u32);

    return;
}

/***************************************************************************************
* func        : DRV_HIFB_HAL_GP_SetRegUp
* description : CNcomment: 更新GP寄存器 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_GP_SetRegUp(HI_U32 u32Data)
{
    volatile U_GP0_UPD GP0_UPD;
    HI_U32 GpNum = HIFB_HAL_GetGpId(u32Data);
    CONFIG_HIFB_CHECK_GP_SUPPORT(GpNum);

    GP0_UPD.bits.regup = 0x1;
    OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->GP0_UPD.u32)) + GpNum * CONFIG_HIFB_GP_OFFSET), GP0_UPD.u32);

    return;
}

//-------------------------------------------------------------------
//WBC_GFX_BEGIN
//-------------------------------------------------------------------

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetThreeMd
* description  : CNcomment:  设置回写模式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetThreeMd(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 bMode)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_CTRL WBC_GP_CTRL;

    if (OPTM_VDP_LAYER_WBC_GP0 == enLayer)
    {
        WBC_GP_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)));
        WBC_GP_CTRL.bits.three_d_mode =  bMode;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)), WBC_GP_CTRL.u32);
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(bMode);
#endif
    return;
}

/***************************************************************************************
* func        : DRV_HIFB_HAL_WBC_GP_SetEnable
* description : CNcomment: 配置回写使能寄存器 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_GP_SetEnable(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 bEnable)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_CTRL WBC_GP_CTRL;

    if (OPTM_VDP_LAYER_WBC_GP0 == enLayer)
    {
        WBC_GP_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)));
        WBC_GP_CTRL.bits.wbc_en =  bEnable;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)), WBC_GP_CTRL.u32);
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(bEnable);
#endif
    return;
}


HI_VOID DRV_HIFB_HAL_WBC_GP_GetWorkEnable(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 *pEnable, HI_U32 *pWbcState)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_CTRL WBC_GP_CTRL;
    volatile U_GFX_WBC_STA GFX_WBC_STA;

    if ((OPTM_VDP_LAYER_WBC_GP0 == enLayer) && (NULL != pEnable))
    {
        WBC_GP_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL_WORK.u32)));
        *pEnable = WBC_GP_CTRL.bits.wbc_en;
    }

    if ((OPTM_VDP_LAYER_WBC_GP0 == enLayer) && (NULL != pWbcState))
    {
        GFX_WBC_STA.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_STA.u32)));
        *pWbcState = GFX_WBC_STA.u32;
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(pEnable);
    HI_UNUSED(pWbcState);
#endif
    return;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_GP_GetEnable
* description  : CNcomment: 回写是否使能 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_GP_GetEnable(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 *pEnable)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_CTRL WBC_GP_CTRL;

    if ((OPTM_VDP_LAYER_WBC_GP0 == enLayer) && (NULL != pEnable))
    {
        WBC_GP_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)));
        *pEnable = WBC_GP_CTRL.bits.wbc_en;
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(pEnable);
#endif
    return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetOutMod
* description  : CNcomment:WBC输出模式。 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetOutMod(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 u32OutMode)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_CTRL WBC_GP_CTRL;

    if (OPTM_VDP_LAYER_WBC_GP0 == enLayer)
    {
        WBC_GP_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)));
        WBC_GP_CTRL.bits.mode_out =  u32OutMode;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_CTRL.u32)), WBC_GP_CTRL.u32);
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(u32OutMode);
#endif
    return;
}


/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetRegUp
* description  : CNcomment:更新回写寄存器 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetRegUp(OPTM_VDP_LAYER_WBC_E enLayer)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    HI_U32 WbcWriteAddress = 0;
    volatile U_WBC_GP_UPD WBC_GP_UPD;

    if (OPTM_VDP_LAYER_WBC_GP0 != enLayer)
    {
        return;
    }

    WbcWriteAddress = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_YADDR_L.u32)));
    if (0 == WbcWriteAddress)
    {
        //HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, WbcWriteAddress);
        return;
    }

    WBC_GP_UPD.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_UPD.u32)));
    WBC_GP_UPD.bits.regup = 0x1;
    OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_UPD.u32)), WBC_GP_UPD.u32);
#else
    HI_UNUSED(enLayer);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetOutFmt
* description  : CNcomment:WBC的输出数据格式。 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetOutFmt(OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_WBC_OFMT_E stIntfFmt)
{
    /** logic register default use ARGB8888, so not need set **/
    HI_UNUSED(enLayer);
    HI_UNUSED(stIntfFmt);
    return;
}


/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetLayerAddr
* description  : CNcomment: 设置WBC回写地址 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetLayerAddr(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 u32Addr, HI_U32 u32Stride)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_GFX_WBC_YSTRIDE GFX_WBC_YSTRIDE;
    #ifdef CONFIG_HIFB_MMU_SUPPORT
    volatile U_GFX_WBC_SMMU_BYPASS  GFX_WBC_SMMU_BYPASS;
    #endif

    if ((OPTM_VDP_LAYER_WBC_GP0 == enLayer) && (0 != u32Addr))
    {
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_YADDR_L.u32)), u32Addr);
        GFX_WBC_YSTRIDE.bits.wbc_ystride = u32Stride;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_YSTRIDE.u32)), GFX_WBC_YSTRIDE.u32);
    #ifdef CONFIG_HIFB_MMU_SUPPORT
       GFX_WBC_SMMU_BYPASS.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->GFX_WBC_SMMU_BYPASS.u32))));
       #ifdef CONFIG_GFX_MMU_SUPPORT
         GFX_WBC_SMMU_BYPASS.bits.mmu_3d_bypass = 0;
         GFX_WBC_SMMU_BYPASS.bits.mmu_2d_bypass = 0;
       #else
         GFX_WBC_SMMU_BYPASS.bits.mmu_3d_bypass = 1;
         GFX_WBC_SMMU_BYPASS.bits.mmu_2d_bypass = 1;
       #endif
       OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_SMMU_BYPASS.u32)), GFX_WBC_SMMU_BYPASS.u32);
    #endif
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(u32Addr);
    HI_UNUSED(u32Stride);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_GetLayerAddr
* description  : CNcomment: 读取WBC回写地址 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_GetLayerAddr(OPTM_VDP_LAYER_WBC_E enLayer, HI_U32* pAddr, HI_U32* pStride)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((OPTM_VDP_LAYER_WBC_GP0 == enLayer) && (NULL != pAddr) && (NULL != pStride))
    {
        *pAddr = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_YADDR_L.u32)));
        *pStride = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->GFX_WBC_YSTRIDE.u32)));
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(pAddr);
    HI_UNUSED(pStride);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetLayerReso
* description  : CNcomment: 设置回写标清图层分辨率 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetLayerReso(OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DISP_RECT_S *pstRect)
{
    /** logic register from wbc_gp zme, so not need set **/
    HI_UNUSED(enLayer);
    HI_UNUSED(pstRect);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetDitherMode
* description  : CNcomment: Dither输出模式选择。 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetDitherMode(OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DITHER_E enDitherMode)
{
    /** not need set **/
    HI_UNUSED(enLayer);
    HI_UNUSED(enDitherMode);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetCropReso
* description  : CNcomment: 设置回写标清图层裁剪分辨率 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetCropReso(OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DISP_RECT_S *pstRect)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_G0_FCROP WBC_G0_FCROP;
    volatile U_WBC_G0_LCROP WBC_G0_LCROP;

    if ((enLayer == OPTM_VDP_LAYER_WBC_GP0) && (NULL != pstRect))
    {
        WBC_G0_FCROP.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_G0_FCROP.u32)));
        WBC_G0_FCROP.bits.wfcrop = pstRect->u32DXS;
        WBC_G0_FCROP.bits.hfcrop = pstRect->u32DYS;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_G0_FCROP.u32)), WBC_G0_FCROP.u32);

        WBC_G0_LCROP.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_G0_LCROP.u32)));
        WBC_G0_LCROP.bits.wlcrop = pstRect->u32DXL - 1;
        WBC_G0_LCROP.bits.hlcrop = pstRect->u32DYL - 1;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_G0_LCROP.u32)), WBC_G0_LCROP.u32);
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(pstRect);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_LBoxEnable
* description  : CNcomment: LBox使能 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_LBoxEnable(OPTM_VDP_LAYER_WBC_E enLayer, HI_BOOL Enable)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_LBX_CTRL WBC_GP_LBX_CTRL;

    if (enLayer == OPTM_VDP_LAYER_WBC_GP0)
    {
        WBC_GP_LBX_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_CTRL.u32)));
        WBC_GP_LBX_CTRL.bits.lbx_en = Enable;
        WBC_GP_LBX_CTRL.bits.lbx_ck_gt_en = Enable;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_CTRL.u32)), WBC_GP_LBX_CTRL.u32);
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(Enable);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_WBC_SetLBoxReso
* description  : CNcomment: 设置LBox分辨率 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_WBC_SetLBoxReso(OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DISP_RECT_S *pstRect)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    volatile U_WBC_GP_LBX_ORESO WBC_GP_LBX_ORESO;
    volatile U_WBC_GP_LBX_VFPOS WBC_GP_LBX_VFPOS;
    volatile U_WBC_GP_LBX_VLPOS WBC_GP_LBX_VLPOS;

    if ((enLayer == OPTM_VDP_LAYER_WBC_GP0) && (NULL != pstRect))
    {
        WBC_GP_LBX_ORESO.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_ORESO.u32)));
        WBC_GP_LBX_ORESO.bits.ow = pstRect->u32OWth;
        WBC_GP_LBX_ORESO.bits.oh = pstRect->u32OHgt;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_ORESO.u32)), WBC_GP_LBX_ORESO.u32);

        WBC_GP_LBX_VFPOS.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_VFPOS.u32)));
        WBC_GP_LBX_VFPOS.bits.video_xfpos = pstRect->u32DXS;
        WBC_GP_LBX_VFPOS.bits.video_yfpos = pstRect->u32DYS;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_VFPOS.u32)), WBC_GP_LBX_VFPOS.u32);

        WBC_GP_LBX_VLPOS.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_VLPOS.u32)));
        WBC_GP_LBX_VLPOS.bits.video_xlpos = pstRect->u32DXL;
        WBC_GP_LBX_VLPOS.bits.video_ylpos = pstRect->u32DYL;
        OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->WBC_GP_LBX_VLPOS.u32)), WBC_GP_LBX_VLPOS.u32);
    }
#else
    HI_UNUSED(enLayer);
    HI_UNUSED(pstRect);
#endif
    return;
}

//-------------------------------------------------------------------
//WBC_GFX_END
//-------------------------------------------------------------------
OPTM_VDP_DISP_MODE_E DRV_HIFB_HAL_DISP_GetDispMode(HI_U32 u32Data)
{
    volatile U_DHD0_CTRL DHD0_CTRL;

    if ((u32Data >= OPTM_CHN_MAX) || (NULL == pOptmVdpReg))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Data);
        return VDP_DISP_MODE_2D;
    }

    DHD0_CTRL.u32 = OPTM_VDP_RegRead((HI_U32*)((unsigned long)(&(pOptmVdpReg->DHD0_CTRL.u32)) + u32Data * CONFIG_HIFB_CHN_OFFSET));

    return (OPTM_VDP_DISP_MODE_E)DHD0_CTRL.bits.disp_mode;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func         : DRV_HIFB_HAL_DISP_GetIntSignal
* description  : CNcomment: 获取中断状态 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_U32 DRV_HIFB_HAL_DISP_GetIntSignal(HI_U32 u32intmask)
{
    volatile U_VOINTSTA VOINTSTA;

    VOINTSTA.u32 = OPTM_VDP_RegRead((HI_U32*)(unsigned long)(&(pOptmVdpReg->VOINTSTA.u32)));

    return (VOINTSTA.u32 & u32intmask);
}

/***************************************************************************************
* func         : DRV_HIFB_HAL_DISP_ClearIntSignal
* description  : CNcomment: 清除中断状态 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_HAL_DISP_ClearIntSignal(HI_U32 u32intmask)
{
    OPTM_VDP_RegWrite((HI_U32*)(unsigned long)(&(pOptmVdpReg->VOMSKINTSTA.u32)), u32intmask);
}
#endif

HI_VOID DRV_HIFB_HAL_GFX_SetInterrupt(HI_BOOL bOpen)
{
    if (HI_TRUE == bOpen)
    {
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOINTMSK.u32))), 0x37);
    }
    else
    {
        OPTM_VDP_RegWrite((HI_U32*)((unsigned long)(&(pOptmVdpReg->VOINTMSK.u32))), 0x0);
    }
}
