#include "hi_type.h"
#include "vdp_drv_vid.h"
#include "vdp_hal_ip_cap.h"
#include "vdp_hal_gfx.h"
#include "vdp_hal_qframe.h"
#include "vdp_hal_comm.h"
#include "vdp_hal_ip_cycbuf.h"
#include "hal_layerprocess.h"
#include "vpss_hal_sysctrl.h"
#include "vpss_drv_comm.h"
#include "vpss_mac_define.h"
#include "xdp_define.h"
#include "vdp_hal_offline.h"

#include "vdp_hal_vid.h"
#include "vdp_hal_wbc.h"
#include "vdp_hal_ip_link.h"
#include "vdp_hal_ip_wd_lbox.h"
#include "vdp_hal_ip_wd_zme.h"
#include "vdp_hal_ip_acm.h"
#include "vdp_hal_ip_hipp_csc.h"
#include "vdp_hal_ip_acc.h"
#include "vdp_hal_ip_para.h"
#include "vdp_hal_ip_hzme.h"
#include "vdp_software_selfdefine.h"
#include "vpss_hal_ip_rchn.h"
#include "vpss_hal_ip_wchn.h"
#include "vdp_hal_ip_fdr.h"

#include "drv_pq_ext.h"

#ifndef  __DISP_PLATFORM_BOOT__

#include <linux/string.h>
#include <linux/kernel.h>


#define VPSS_CFG_REG_OFFSET(start, end) (offsetof(S_CAS_REGS_TYPE, end) + sizeof(HI_U32) - offsetof(S_CAS_REGS_TYPE, start))

extern S_VDP_REGS_TYPE *pstXdpRegTmp; // cfg set to node buff

HI_PQ_ZME_COEF_RATIO_E enZME1RationHL =  HI_PQ_ZME_COEF_RATIO_BUTT;
HI_PQ_ZME_COEF_RATIO_E enZME1RationHC =  HI_PQ_ZME_COEF_RATIO_BUTT;
HI_PQ_ZME_COEF_RATIO_E enZME1RationVL =  HI_PQ_ZME_COEF_RATIO_BUTT;
HI_PQ_ZME_COEF_RATIO_E enZME1RationVC =  HI_PQ_ZME_COEF_RATIO_BUTT;

HI_PQ_ZME_COEF_RATIO_E enZME2RationHL =  HI_PQ_ZME_COEF_RATIO_BUTT;
HI_PQ_ZME_COEF_RATIO_E enZME2RationHC =  HI_PQ_ZME_COEF_RATIO_BUTT;
HI_PQ_ZME_COEF_RATIO_E enZME2RationVL =  HI_PQ_ZME_COEF_RATIO_BUTT;
HI_PQ_ZME_COEF_RATIO_E enZME2RationVC =  HI_PQ_ZME_COEF_RATIO_BUTT;

HIHDR_SCENE_MODE_E gSceneMode = HIHDR_BYPASS_MODE ;

extern volatile S_VDP_REGS_TYPE *pVdpReg;
S_VDP_QF_REGS_TYPE       *pstVdpVpssRegTmp;

HI_U32 VDP_GetTotalPlayCnts(HI_VOID)
{
    HI_BOOL bOffline = HI_FALSE;
    HI_U32 u32TotalPlayCnts = 0;
    HI_U32 u32Compensation=0;

    bOffline = (pVdpReg->CUR_LINE_MODE_STA.bits.cur_line_mode) & 0x1;

    if (HI_TRUE == bOffline)
    {
        u32TotalPlayCnts = pVdpReg->VID_DTV_DEBUG6.bits.disp_cnt_real + 1;
    }
    else
    {
        u32TotalPlayCnts = pVdpReg->VID_DTV_DEBUG6.bits.disp_cnt_real - 1 ;
        u32Compensation=(pVdpReg->OFFLINE_SYNC_STATE.bits.qframe_cur_valid==1) ? 0 : 1;
        u32TotalPlayCnts = u32TotalPlayCnts + u32Compensation;
    }

    return u32TotalPlayCnts;
}

HI_U32 VDP_GetUnloadPlayCnts(HI_VOID)
{
    return pVdpReg->VID_DTV_DEBUG4.u32;
}

HI_U32 VDP_GetQueueNodeCnts(HI_VOID)
{
    HI_U32 u32QNodeCnts=0;
    HI_U32 u32CurVal=0;
    HI_U32 u32NxtVal=0;
    HI_U32 u32DispFifoCnt=0;

    u32CurVal=(pVdpReg->OFFLINE_SYNC_STATE.bits.qframe_cur_valid==1) ? 1 : 0;
    u32NxtVal=(pVdpReg->OFFLINE_SYNC_STATE.bits.qframe_nxt_valid==1) ? 1 : 0;
    u32DispFifoCnt=((pVdpReg->VID_DTV_DEBUG2.bits.disp_fifo_sta)&0xf0)>>4;

    u32QNodeCnts=u32DispFifoCnt+u32CurVal+u32NxtVal;

    return u32QNodeCnts;
}

HI_U32 VDP_GetDeQueueCnts(HI_VOID)
{
    return ((pVdpReg->VID_DTV_DEBUG2.bits.back_fifo_sta)&0xfc)>>2;
}

HI_S32 VDP_DRV_GetCscMode(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstInfoOut, HI_PQ_CSC_MODE_E *enPqCscMode)
{
    HI_PQ_CSC_MODE_E enTmpPqCscMode = HI_PQ_CSC_BUTT;

    VDP_CLR_SPACE_E enTmpInClr  = pstInfoOut->stXdpSrcCfg.enSrcClrSpace;
    VDP_CLR_SPACE_E enTmpOutClr = pstInfoOut->stXdpDispCfg.enOutClrSpace;
    HI_U32 i = 0;
    HI_U32 j = 0;

    VDP_CSC_INFO stCscModeInfo[] =
    {
        {VDP_CLR_SPACE_YUV_601_L, VDP_CLR_SPACE_YUV_601_L, VDP_CSC_YUV2YUV, HI_PQ_CSC_YUV2YUV},
        {VDP_CLR_SPACE_YUV_601_L, VDP_CLR_SPACE_YUV_709_L, VDP_CSC_YUV2YUV_601_709, HI_PQ_CSC_YUV2YUV_601_709},
        {VDP_CLR_SPACE_YUV_601_L, VDP_CLR_SPACE_RGB_709, VDP_CSC_YUV2RGB_709, HI_PQ_CSC_YUV2RGB_709},

        {VDP_CLR_SPACE_YUV_709_L, VDP_CLR_SPACE_YUV_601_L, VDP_CSC_YUV2YUV_709_601, HI_PQ_CSC_YUV2YUV_709_601},
        {VDP_CLR_SPACE_YUV_709_L, VDP_CLR_SPACE_YUV_709_L, VDP_CSC_YUV2YUV, HI_PQ_CSC_YUV2YUV},
        {VDP_CLR_SPACE_YUV_709_L, VDP_CLR_SPACE_RGB_709, VDP_CSC_YUV2RGB_709, HI_PQ_CSC_YUV2RGB_709},

        {VDP_CLR_SPACE_RGB_709, VDP_CLR_SPACE_YUV_601_L, VDP_CSC_RGB2YUV_601, HI_PQ_CSC_RGB2YUV_601},
        {VDP_CLR_SPACE_RGB_709, VDP_CLR_SPACE_YUV_709_L, VDP_CSC_RGB2YUV_709, HI_PQ_CSC_RGB2YUV_709},
        {VDP_CLR_SPACE_RGB_709, VDP_CLR_SPACE_RGB_709, VDP_CSC_RGB2RGB, HI_PQ_CSC_RGB2RGB},
    };

    if ((enTmpInClr == VDP_CLR_SPACE_BUTT) || (enTmpOutClr == VDP_CLR_SPACE_BUTT))
    {
        VDP_PRINT("enTmpInClr or enTmpOutClr value is buttom\n");
        return HI_FAILURE;
    }

   // VDP_PRINT("(%d)INCSC %d  outCSC %d\n", u32LayerId, enTmpInClr, enTmpOutClr);




    if ((VDP_CLR_SPACE_YUV_601 == enTmpInClr) || (VDP_CLR_SPACE_YUV_601_L == enTmpInClr))
    {
        enTmpInClr = VDP_CLR_SPACE_YUV_601_L;
    }
    else if ((VDP_CLR_SPACE_RGB_601 == enTmpInClr)
             || (VDP_CLR_SPACE_RGB_709 == enTmpInClr)
             || (VDP_CLR_SPACE_RGB_601_L == enTmpInClr)
             || (VDP_CLR_SPACE_RGB_709_L == enTmpInClr))
    {
        enTmpInClr = VDP_CLR_SPACE_RGB_709;
    }
    else
    {
        enTmpInClr = VDP_CLR_SPACE_YUV_709_L;
    }

    if ((VDP_CLR_SPACE_YUV_601 == enTmpOutClr) || (VDP_CLR_SPACE_YUV_601_L == enTmpOutClr))
    {
        enTmpOutClr = VDP_CLR_SPACE_YUV_601_L;
    }
    else if ((VDP_CLR_SPACE_YUV_709 == enTmpOutClr) || (VDP_CLR_SPACE_YUV_709_L == enTmpOutClr))
    {
        enTmpOutClr = VDP_CLR_SPACE_YUV_709_L;
    }
    else
    {
        enTmpOutClr = VDP_CLR_SPACE_RGB_709;
    }

    for (i = 0; i < sizeof(stCscModeInfo) / sizeof(VDP_CSC_INFO); i++)
    {
        if (stCscModeInfo[i].enTmpInClr == enTmpInClr)
        {
            for (j = i; j < sizeof(stCscModeInfo) / sizeof(VDP_CSC_INFO); j++)
            {
                if (stCscModeInfo[j].enTmpOutClr == enTmpOutClr)
                {
                    enTmpPqCscMode = stCscModeInfo[j].enPqCscMode;
                    break;
                }
            }

            break;
        }
    }

    if (HI_PQ_CSC_BUTT == enTmpPqCscMode)
    {
        VDP_PRINT("No this breach (enTmpInClr:%d, enTmpOutClr:%d)\n", enTmpInClr, enTmpOutClr);
        return HI_FAILURE;
    }

    *enPqCscMode = enTmpPqCscMode;

    return HI_SUCCESS;
}


HI_S32 XDP_DRV_AdjustVidCscInfo(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstInfoIn)
{
    if (u32LayerId == VDP_LAYER_VID0)
    {
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef00 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef01 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef02 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef10 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef11 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef12 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef20 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef21 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef22 *= 1;

        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc0 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc1 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc2 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc0 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc1 *= 1;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc2 *= 1;
    }
    else if (u32LayerId == VDP_LAYER_SD0)
    {
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef00 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef01 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef02 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef10 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef11 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef12 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef20 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef21 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef22 /= 4;

        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_in_dc0 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_in_dc1 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_in_dc2 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_out_dc0 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_out_dc1 /= 4;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_out_dc2 /= 4;
    }

    return HI_SUCCESS;
}

HI_S32 XDP_DRV_GetVidCscInfo(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstInfoIn)
{
    HI_PQ_CSC_CRTL_S   stCscCtrl = {0};
    HI_PQ_CSC_MODE_E   enPqCscMode = HI_PQ_CSC_BUTT;
    HI_PQ_CSC_COEF_S   stPqCscCoef = {0};
    HI_PQ_CSC_DCCOEF_S stPqCscDc = {0};
    HI_PQ_CSC_TYPE_E   enPqCscType = HI_PQ_CSC_TUNING_V0;

    VDP_DRV_GetCscMode(u32LayerId, pstInfoIn, &enPqCscMode);

    if (enPqCscMode >= HI_PQ_CSC_BUTT)
    {
        VDP_PRINT("enPqCscMode arange Error !!! \n");
        return HI_FAILURE;
    }

    if (u32LayerId == VDP_LAYER_VID0)
    {
        stCscCtrl.bCSCEn    = HI_TRUE;
        stCscCtrl.enCscType = HI_PQ_CSC_TUNING_V0;
        enPqCscType         = HI_PQ_CSC_TUNING_V0;

        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].enPqCscMode  = enPqCscMode;
    }
    else  if (u32LayerId == VDP_LAYER_SD0)
    {
        stCscCtrl.bCSCEn    = HI_TRUE;
        stCscCtrl.enCscType = HI_PQ_CSC_TUNING_V3;
        enPqCscType         = HI_PQ_CSC_TUNING_V3;
        pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].enPqCscMode  = enPqCscMode;
    }

    DRV_PQ_GetCSCCoef(&stCscCtrl, enPqCscMode, &stPqCscCoef, &stPqCscDc);
    memcpy(&pstInfoIn->stXdpCscCfg[enPqCscType].stPqCscCoef, &stPqCscCoef, sizeof(pstInfoIn->stXdpCscCfg[enPqCscType].stPqCscCoef));
    memcpy(&pstInfoIn->stXdpCscCfg[enPqCscType].stPqCscDc,   &stPqCscDc,   sizeof(pstInfoIn->stXdpCscCfg[enPqCscType].stPqCscDc));

    XDP_DRV_AdjustVidCscInfo(u32LayerId, pstInfoIn);

    return HI_SUCCESS;

}

//mv430 code begin
VDP_VID_DATA_TYPE_E XDP_DATA_TYPE_ADPTER(VDP_VID_IFMT_E enFmt)
{
    VDP_VID_DATA_TYPE_E enDataType = VDP_VID_DATA_TYPE_YUV420;

    switch (enFmt)
    {
        case VDP_VID_IFMT_ARGB_8888:
        {
            enDataType = VDP_VID_DATA_TYPE_ARGB8888 ;
            break;
        }
        case VDP_VID_IFMT_RGB_888  :
        {
            enDataType = VDP_VID_DATA_TYPE_RGB888 ;
            break;
        }
        case VDP_VID_IFMT_PKG_444:
        case VDP_VID_IFMT_PKG_888:
        case VDP_VID_IFMT_SP_444 :
        {
            enDataType = VDP_VID_DATA_TYPE_YUV444 ;
            break;
        }
        case VDP_VID_IFMT_PKG_UYVY  :
        case VDP_VID_IFMT_PKG_YUYV  :
        case VDP_VID_IFMT_PKG_YVYU  :
        case VDP_VID_IFMT_SP_422    :
        {
            enDataType = VDP_VID_DATA_TYPE_YUV422 ;
            break;
        }
        case VDP_VID_IFMT_SP_TILE   :
        case VDP_VID_IFMT_SP_TILE_64:
        case VDP_VID_IFMT_SP_420    :
        {
            enDataType = VDP_VID_DATA_TYPE_YUV420 ;
            break;
        }
        case VDP_VID_IFMT_SP_400     :
        case VDP_VID_IFMT_SP_TILE_400:
        {
            enDataType = VDP_VID_DATA_TYPE_YUV400 ;
            break;
        }
        default:
        {
            VDP_PRINT("Error enInFmt! \n");
            break;
        }
    }

    return enDataType;

}

VDP_VID_DATA_FMT_E XDP_DATA_FMT_ADPTER(VDP_VID_IFMT_E enFmt)
{
    VDP_VID_DATA_FMT_E enInFmt = VDP_VID_DATA_FMT_LINEAR;

    switch (enFmt)
    {
        case VDP_VID_IFMT_SP_TILE    :
        case VDP_VID_IFMT_SP_TILE_64 :
        case VDP_VID_IFMT_SP_TILE_400:
        {
            enInFmt = VDP_VID_DATA_FMT_TILE ;
            break;
        }
        case VDP_VID_IFMT_PKG_UYVY  :
        case VDP_VID_IFMT_PKG_YUYV  :
        case VDP_VID_IFMT_PKG_YVYU  :
        case VDP_VID_IFMT_RGB_888   :
        case VDP_VID_IFMT_PKG_444   :
        case VDP_VID_IFMT_PKG_888   :
        case VDP_VID_IFMT_ARGB_8888 :
        {
            enInFmt = VDP_VID_DATA_FMT_PKG ;
            break;
        }
        case VDP_VID_IFMT_SP_400    :
        case VDP_VID_IFMT_SP_420    :
        case VDP_VID_IFMT_SP_422    :
        case VDP_VID_IFMT_SP_422V   :
        case VDP_VID_IFMT_SP_444    :
        {
            enInFmt = VDP_VID_DATA_FMT_LINEAR ;
            break;
        }
        default:
        {
            VDP_PRINT("Error enInFmt! %u\n", enFmt);
            break;
        }
    }

    return enInFmt;

}

HI_VOID XDP_DRV_SetVid0CtrlCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    pstCfgMode->pstXdpRegTmp->V0_CTRL.bits.surface_en  = pstInfoIn->stXdpSysCfg.bRegionEn;
    pstCfgMode->pstXdpRegTmp->V0_CTRL.bits.nosec_flag  = 1;
    pstCfgMode->pstXdpRegTmp->V0_CTRL.bits.vup_mode    = 1;
    pstCfgMode->pstXdpRegTmp->V0_CTRL.bits.field_match = pstInfoIn->stXdpSysCfg.bFieldMatch;
    pstCfgMode->pstXdpRegTmp->V0_CTRL.bits.galpha      = pstInfoIn->stXdpSysCfg.u32AllAlpha;

    VDP_QF_HAL_SetV0_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_CTRL);

    return;
}

HI_VOID XDP_DRV_SetVid0FdrCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    VDP_VID_DATA_FMT_E         enInFmt ;
    VDP_VID_DATA_TYPE_E    enDataType;
    HI_U32 u32ActiveRange = 0;
    HI_BOOL bIsSD = HI_FALSE;
    HI_U32 u32DataWidth = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;
    enInFmt     = XDP_DATA_FMT_ADPTER(pstInfoIn->stXdpSrcCfg.enInFmt);
    enDataType  = XDP_DATA_TYPE_ADPTER(pstInfoIn->stXdpSrcCfg.enInFmt);

    pstCfgMode->pstXdpRegTmp->LINK_CTRL.bits.csc_link_ctrl = 1;//0:csc in wbc_dhd, 1:csc in v1
    pstCfgMode->pstXdpRegTmp->LINK_CTRL.bits.v0_link_ctrl = (enInFmt == VDP_VID_DATA_FMT_PKG) ? 1 : 0;//0:video, 1:gfx
    pstInfoIn->stXdpLayerExtern.u32LinkEn = pstCfgMode->pstXdpRegTmp->LINK_CTRL.bits.v0_link_ctrl;

    pstCfgMode->pstXdpRegTmp->VID_MAC_CTRL.bits.pre_rd_en      = XDP_VID_MAC_CTRL_PRE_READ_ENABLE_STATUS;
    pstCfgMode->pstXdpRegTmp->VID_MAC_CTRL.bits.req_interval   = (((u32ActiveRange == 0) && (pstInfoIn->stXdpNodeInfo.enTopActiveRefMode == XDP_ACTIVE_REF_HPZME)) || ((u32ActiveRange == 1) && (pstInfoIn->stXdpNodeInfo.enTopActiveRefMode == XDP_ACTIVE_REF_HPZME)) || ((u32ActiveRange == 2) && (pstInfoIn->stXdpNodeInfo.enBottomActiveRefMode == XDP_ACTIVE_REF_HPZME))) ? 300 : 0;
#ifdef HI_FPGA_SUPPORT
    pstCfgMode->pstXdpRegTmp->VID_MAC_CTRL.bits.req_ctrl       = VDP_REQ_CTRL_16BURST_2;
#else
    pstCfgMode->pstXdpRegTmp->VID_MAC_CTRL.bits.req_ctrl       = VDP_REQ_CTRL_16BURST_1;
#endif


    if(pstInfoIn->stXdpDispCfg.enDispMode == VDP_DISP_MODE_SBS)
    {
        pstCfgMode->pstXdpRegTmp->VID_SRC_RESO.bits.src_w          = (pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth >> 1) - 1;
        pstCfgMode->pstXdpRegTmp->VID_SRC_RESO.bits.src_h          = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt - 1;
        pstCfgMode->pstXdpRegTmp->VID_SRC_CROP.bits.src_crop_x     = (pstInfoIn->stXdpFdrCfg.stCropRect.u32X >> 1);
        pstCfgMode->pstXdpRegTmp->VID_SRC_CROP.bits.src_crop_y     = pstInfoIn->stXdpFdrCfg.stCropRect.u32Y;
        pstCfgMode->pstXdpRegTmp->VID_IN_RESO.bits.ireso_w         = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth >> 1) - 1;
        pstCfgMode->pstXdpRegTmp->VID_IN_RESO.bits.ireso_h         = pstInfoIn->stXdpFdrCfg.stCropRect.u32Hgt - 1;
    }
    else if((pstInfoIn->stXdpDispCfg.enDispMode == VDP_DISP_MODE_TAB) || (pstInfoIn->stXdpDispCfg.enDispMode == VDP_DISP_MODE_LBL))
    {
        pstCfgMode->pstXdpRegTmp->VID_SRC_RESO.bits.src_w          = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth - 1;
        pstCfgMode->pstXdpRegTmp->VID_SRC_RESO.bits.src_h          = (pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt >> 1) - 1;
        pstCfgMode->pstXdpRegTmp->VID_SRC_CROP.bits.src_crop_x     = pstInfoIn->stXdpFdrCfg.stCropRect.u32X;
        pstCfgMode->pstXdpRegTmp->VID_SRC_CROP.bits.src_crop_y     = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Y >> 1);
        pstCfgMode->pstXdpRegTmp->VID_IN_RESO.bits.ireso_w         = pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth - 1;
        pstCfgMode->pstXdpRegTmp->VID_IN_RESO.bits.ireso_h         = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Hgt >> 1) - 1;
    }
    else
    {
        pstCfgMode->pstXdpRegTmp->VID_SRC_RESO.bits.src_w          = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth - 1;
        pstCfgMode->pstXdpRegTmp->VID_SRC_RESO.bits.src_h          = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt - 1;
        pstCfgMode->pstXdpRegTmp->VID_SRC_CROP.bits.src_crop_x     = pstInfoIn->stXdpFdrCfg.stCropRect.u32X;
        pstCfgMode->pstXdpRegTmp->VID_SRC_CROP.bits.src_crop_y     = pstInfoIn->stXdpFdrCfg.stCropRect.u32Y;
        pstCfgMode->pstXdpRegTmp->VID_IN_RESO.bits.ireso_w         = pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth - 1;
        pstCfgMode->pstXdpRegTmp->VID_IN_RESO.bits.ireso_h         = pstInfoIn->stXdpFdrCfg.stCropRect.u32Hgt - 1;
    }

    pstCfgMode->pstXdpRegTmp->VID_WTUNL_ADDR_L.bits.wtunl_addr_l        = pstInfoIn->stXdpFdrCfg.u32ReverseTunnelPhyAddr;


    pstCfgMode->pstXdpRegTmp->VID_2BIT_ADDR_L.bits.b_vhdaddr_l          = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_TILE].u32LumAddr;
    pstCfgMode->pstXdpRegTmp->VID_2BIT_CADDR_L.bits.b_vhdcaddr_l        = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_TILE].u32ChmAddr;
    pstCfgMode->pstXdpRegTmp->VID_2BIT_STRIDE.bits.lm_tile_stride       = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_TILE].u32LumStr;
    pstCfgMode->pstXdpRegTmp->VID_2BIT_STRIDE.bits.chm_tile_stride      = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_TILE].u32ChmStr;

    pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.disp_mode      = pstInfoIn->stXdpDispCfg.enDispMode;
    pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.fdr_ck_gt_en  = 1;
    pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.mute_req_en   = 1;
    pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.rmode_3d      = 1;//0:interface, 1:source
    if ((pstInfoIn->stXdpNodeInfo.bLastFrame == HI_TRUE) && (pstInfoIn->stXdpFdrCfg.enReadMode != VDP_RMODE_PROGRESSIVE))
    {
        bIsSD = ((pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth <= VPSSIP_W_720P)&&(pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt <= VPSSIP_H_720P)) ? HI_TRUE : HI_FALSE;
        pstCfgMode->pstXdpRegTmp->VID_SRC_BITW.bits.data_width     = (bIsSD == HI_TRUE) ? XDP_DATA_WTH_10 : XDP_DATA_WTH_8;
        pstCfgMode->pstXdpRegTmp->VID_ADDR_L.bits.vhdaddr_l                 = 0x5a5a5a5a;
        pstCfgMode->pstXdpRegTmp->VID_CADDR_L.bits.vhdcaddr_l               = 0x6a6a6a6a;

        u32DataWidth = (pstCfgMode->pstXdpRegTmp->VID_SRC_BITW.bits.data_width == XDP_DATA_WTH_10) ? 10 : 8;
        pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.lm_stride = VpssUpAlign((pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth * u32DataWidth + 7) / 8, 16);
        #if 0
         printk("pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.lm_stride = %d \n", pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.lm_stride);
         printk("pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth = %d \n",pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth);
         printk("pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt = %d \n",pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt);
        #endif
        pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.chm_stride       = pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.lm_stride;

        pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.uv_order_en    = 0;
        pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.data_fmt       = VDP_VID_DATA_FMT_LINEAR;
        pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.data_type      = VDP_VID_DATA_TYPE_YUV420;

        pstCfgMode->pstXdpRegTmp->VID_READ_MODE.bits.lm_rmode      = (u32ActiveRange == 1) ? VDP_RMODE_PRO_TOP : ((u32ActiveRange == 2) ? VDP_RMODE_PRO_BOTTOM : VDP_RMODE_PROGRESSIVE);
        pstCfgMode->pstXdpRegTmp->VID_READ_MODE.bits.chm_rmode     = (u32ActiveRange == 1) ? VDP_RMODE_PRO_TOP : ((u32ActiveRange == 2) ? VDP_RMODE_PRO_BOTTOM : VDP_RMODE_PROGRESSIVE);

        pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.lm_draw_mode  = VDP_DRAW_MODE_1;
        pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.chm_draw_mode = VDP_DRAW_MODE_1;
        pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.flip_en       = HI_FALSE;
        pstCfgMode->pstXdpRegTmp->VID_OUT_CTRL.bits.draw_pixel_mode = VDP_DRAW_MODE_1;
    }
    else
    {
        pstCfgMode->pstXdpRegTmp->VID_ADDR_L.bits.vhdaddr_l                 = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumAddr;
        pstCfgMode->pstXdpRegTmp->VID_CADDR_L.bits.vhdcaddr_l               = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmAddr;
        pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.lm_stride                 = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumStr;
        pstCfgMode->pstXdpRegTmp->VID_STRIDE.bits.chm_stride                = pstInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmStr;

        pstCfgMode->pstXdpRegTmp->VID_SRC_BITW.bits.data_width     = pstInfoIn->stXdpSrcCfg.enDataWidth;

        pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.uv_order_en    = pstInfoIn->stXdpSrcCfg.bUVOrder;
        pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.data_fmt       = enInFmt;
        pstCfgMode->pstXdpRegTmp->VID_SRC_INFO.bits.data_type      = enDataType;

        if(pstInfoIn->stXdpNodeInfo.bCompactAccess == HI_TRUE)
        {
            pstCfgMode->pstXdpRegTmp->VID_READ_MODE.bits.lm_rmode      = (u32ActiveRange == 1) ? VDP_RMODE_PRO_TOP : ((u32ActiveRange == 2) ? VDP_RMODE_PRO_BOTTOM : VDP_RMODE_PROGRESSIVE);
            pstCfgMode->pstXdpRegTmp->VID_READ_MODE.bits.chm_rmode     = (u32ActiveRange == 1) ? VDP_RMODE_PRO_TOP : ((u32ActiveRange == 2) ? VDP_RMODE_PRO_BOTTOM : VDP_RMODE_PROGRESSIVE);
        }
        else
        {
            pstCfgMode->pstXdpRegTmp->VID_READ_MODE.bits.lm_rmode      = (u32ActiveRange == 1) ? VDP_RMODE_TOP : ((u32ActiveRange == 2) ? VDP_RMODE_BOTTOM : VDP_RMODE_PROGRESSIVE);
            pstCfgMode->pstXdpRegTmp->VID_READ_MODE.bits.chm_rmode     = (u32ActiveRange == 1) ? VDP_RMODE_TOP : ((u32ActiveRange == 2) ? VDP_RMODE_BOTTOM : VDP_RMODE_PROGRESSIVE);
        }
        pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.lm_draw_mode  = pstInfoIn->stXdpFdrCfg.enDrawMode;
        pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.chm_draw_mode = pstInfoIn->stXdpFdrCfg.enDrawMode;
        pstCfgMode->pstXdpRegTmp->VID_READ_CTRL.bits.flip_en       = pstInfoIn->stXdpFdrCfg.bFlipEn;
        pstCfgMode->pstXdpRegTmp->VID_OUT_CTRL.bits.draw_pixel_mode = pstInfoIn->stXdpFdrCfg.enDrawPixelMode;
    }
    if (pstInfoIn->stXdpSrcCfg.enSrcClrSpace == VDP_CLR_SPACE_RGB_601
        || pstInfoIn->stXdpSrcCfg.enSrcClrSpace == VDP_CLR_SPACE_RGB_709
        || pstInfoIn->stXdpSrcCfg.enSrcClrSpace == VDP_CLR_SPACE_RGB_2020
        || pstInfoIn->stXdpSrcCfg.enSrcClrSpace == VDP_CLR_SPACE_RGB_601_L
        || pstInfoIn->stXdpSrcCfg.enSrcClrSpace == VDP_CLR_SPACE_RGB_709_L
        || pstInfoIn->stXdpSrcCfg.enSrcClrSpace == VDP_CLR_SPACE_RGB_2020_L
       )
    {
        pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_y  = 0x0;
        pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_cb = 0x0;
        pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_cr = 0x0;
    }
    else
    {
        pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_y  = 0x0;
        pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_cb = 0x200;
        pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_cr = 0x200;
    }
    pstCfgMode->pstXdpRegTmp->VID_MUTE_BK.bits.mute_en = 0;

    if (u32ActiveRange == 0) //top and bottom valid
    {
        VDP_QF_HAL_SetLINK_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->LINK_CTRL);
        VDP_QF_HAL_SetVID_READ_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_READ_CTRL);
        VDP_QF_HAL_SetVID_SRC_BITW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_SRC_BITW);
        VDP_QF_HAL_SetVID_SRC_INFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_SRC_INFO);
        VDP_QF_HAL_SetVID_SRC_RESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_SRC_RESO);
        VDP_QF_HAL_SetVID_SRC_CROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_SRC_CROP);
        VDP_QF_HAL_SetVID_IN_RESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_IN_RESO);
        VDP_QF_HAL_SetVID_ADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_ADDR_L);
        VDP_QF_HAL_SetVID_CADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_CADDR_L);
        VDP_QF_HAL_SetVID_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_STRIDE);
        VDP_QF_HAL_SetVID_2BIT_ADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_2BIT_ADDR_L);
        VDP_QF_HAL_SetVID_2BIT_CADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_2BIT_CADDR_L);
        VDP_QF_HAL_SetVID_2BIT_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_2BIT_STRIDE);
        VDP_QF_HAL_SetVID_WTUNL_ADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_WTUNL_ADDR_L);
        VDP_QF_HAL_SetVID_OUT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_OUT_CTRL);
        VDP_QF_HAL_SetVID_MUTE_BK(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_MUTE_BK);

        if (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetVID_MAC_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_MAC_CTRL);
            VDP_QF_HAL_SetVID_READ_MODE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_READ_MODE);
        }
    }
    else //top or bottom valid
    {
        VDP_QF_HAL_SetVID_MAC_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_MAC_CTRL);
        VDP_QF_HAL_SetVID_READ_MODE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VID_READ_MODE);
    }
    return;

}

HI_VOID XDP_DRV_SetVid0Vc1Cfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    if((pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.bVc1En == HI_FALSE) || (pstInfoIn->stXdpLayerExtern.u32LinkEn == 1))
        return;

    pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL.bits.vc1_rangedfrm = pstInfoIn->stXdpVc1Cfg.u32RangeDfrm;
    pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL.bits.vc1_profile   = pstInfoIn->stXdpVc1Cfg.u32ProFile;//0:simple,1:main,3:advance
    pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL.bits.vc1_mapyflg   = pstInfoIn->stXdpVc1Cfg.u32MapYFlg;
    pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL.bits.vc1_mapcflg   = pstInfoIn->stXdpVc1Cfg.u32MapCFlg;
    pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL.bits.vc1_mapy      = pstInfoIn->stXdpVc1Cfg.u32MapY;//0~7
    pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL.bits.vc1_mapc      = pstInfoIn->stXdpVc1Cfg.u32MapC;//0~7

    VDP_QF_HAL_SetVPSS_VC1_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_VC1_CTRL);

    return;
}

HI_VOID XDP_DRV_GetVpssIpPolicy(XDP_LAYER_VID_INFO_S *pstInfoIn, HI_U32 u32FrmCnt, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy)
{
    HI_BOOL bIsSD = HI_FALSE;
    HI_BOOL bIsPic = HI_FALSE;
    HI_BOOL bResolutionTooSmall = HI_FALSE;

    bIsSD = ((pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth <= VPSSIP_W_720P)&&(pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt <= VPSSIP_H_720P)) ? HI_TRUE : HI_FALSE;
    bIsPic = (XDP_DATA_FMT_ADPTER(pstInfoIn->stXdpSrcCfg.enInFmt) == VDP_VID_DATA_FMT_PKG) ? HI_TRUE : HI_FALSE;

    pstVpssIpPolicy->u32FrmCnt = u32FrmCnt;
    pstVpssIpPolicy->u32HzmeWth = pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth;
    pstVpssIpPolicy->u32HzmeHgt = pstInfoIn->stXdpHZmeCfg.u32HzmeOutHgt;
    pstVpssIpPolicy->enRdMode= pstInfoIn->stXdpFdrCfg.enReadMode;
    pstVpssIpPolicy->enDataFmt= pstInfoIn->stXdpSrcCfg.enInFmt;
    pstVpssIpPolicy->bVpssOutChnEn = (bIsPic == HI_TRUE) ? HI_FALSE : HI_TRUE;

    pstVpssIpPolicy->u32BufStartAddr = pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.u32VpssBufStartAddr;
    pstVpssIpPolicy->u32BufStartVirtAddr = pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.u32VpssBufVirtStartAddr;

    pstVpssIpPolicy->u32VpssoutStartAddr = pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.u32VpssOutStartAddr;
    pstVpssIpPolicy->u32VpssoutVirtAddr = pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.u32VpssOutVirtStartAddr;

    pstVpssIpPolicy->bFieldMatch = pstInfoIn->stXdpSysCfg.bFieldMatch;
    pstVpssIpPolicy->u32BfieldFirst = (pstInfoIn->stXdpSrcCfg.u32TopFieldFirst == 1) ? 0 : 1;
    pstVpssIpPolicy->bVc1En = (bIsPic == HI_TRUE) ? 0 : pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.bVc1En;
    pstVpssIpPolicy->bIsSD = bIsSD;
    pstVpssIpPolicy->enNrDataWidth = (HI_TRUE == bIsSD) ? XDP_DATA_WTH_10 : XDP_DATA_WTH_8;


    if((u32FrmCnt == 0) && (HI_FALSE == bIsPic))
    {
        pstVpssIpPolicy->bFrmInit = HI_TRUE;
    }
    else
    {
        pstVpssIpPolicy->bFrmInit = HI_FALSE;
    }

    bResolutionTooSmall = ((pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth < 128) || (pstInfoIn->stXdpHZmeCfg.u32HzmeOutHgt < 64));

    if((VDP_RMODE_PROGRESSIVE == pstInfoIn->stXdpFdrCfg.enReadMode) || (HI_TRUE == pstVpssIpPolicy->bFrmInit) || (HI_TRUE == bIsPic) || (HI_TRUE == bResolutionTooSmall))
    {
        pstVpssIpPolicy->bDeiEn = HI_FALSE;
    }
    else
    {
        pstVpssIpPolicy->bDeiEn = HI_TRUE;
    }

    if(((HI_TRUE == bIsSD) && (HI_FALSE == pstVpssIpPolicy->bFrmInit) && (HI_FALSE == pstInfoIn->stXdpSysCfg.bRWZB) && (HI_FALSE == bIsPic)) && (HI_FALSE == bResolutionTooSmall))
    {
        pstVpssIpPolicy->bTnrEn = HI_TRUE;
        pstVpssIpPolicy->bSnrEn = HI_TRUE;
    }
    else
    {
        pstVpssIpPolicy->bTnrEn = HI_FALSE;
        pstVpssIpPolicy->bSnrEn = HI_FALSE;
    }

    if((HI_TRUE == bIsSD) || (HI_TRUE == pstInfoIn->stXdpSysCfg.bForceFodEn) || (HI_FALSE == pstInfoIn->stXdpSysCfg.bLowMemMode))
    {
        pstVpssIpPolicy->u32DeiFldMode = XDP_DEI_FLD_FOUR;
    }
    else
    {
        pstVpssIpPolicy->u32DeiFldMode = XDP_DEI_FLD_THIRD;
    }

    if((HI_TRUE == pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.bCcsEn) || (HI_TRUE == pstInfoIn->stXdpNodeInfo.stXdpVpssIpCfg.bClsEn))
    {
        pstVpssIpPolicy->bTnrMadMode = HI_TRUE;
    }
    else
    {
        pstVpssIpPolicy->bTnrMadMode = HI_FALSE;
    }

    pstVpssIpPolicy->bBlkDetEn = pstVpssIpPolicy->bSnrEn;
    pstVpssIpPolicy->bRgmeEn = pstVpssIpPolicy->bTnrEn;
    pstVpssIpPolicy->bMcnrEn = pstVpssIpPolicy->bTnrEn;

    if((HI_TRUE == pstVpssIpPolicy->bDeiEn) || (HI_FALSE == pstVpssIpPolicy->bTnrEn))
    {
        pstVpssIpPolicy->bMacMadEn = HI_TRUE;
        pstVpssIpPolicy->bMadVfirEn = HI_TRUE;
    }
    else
    {
        pstVpssIpPolicy->bMacMadEn = HI_FALSE;
        pstVpssIpPolicy->bMadVfirEn = HI_FALSE;
    }

    pstVpssIpPolicy->bIgbmEn = pstVpssIpPolicy->bDeiEn;

    if((HI_TRUE == pstVpssIpPolicy->bDeiEn) && (XDP_DEI_FLD_THIRD != pstVpssIpPolicy->u32DeiFldMode))
    {
        pstVpssIpPolicy->bIfmdEn = HI_TRUE;
    }
    else
    {
        pstVpssIpPolicy->bIfmdEn = HI_FALSE;
    }

    return;

}

HI_VOID XDP_DRV_GetVpssIpBufSize(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy,
                                          XDP_VPSSIP_CHN_CFG_S *pstVpssIpChnCfg,
                                          HI_U32 *pu32TotalBufSize,
                                          HI_U32 *pu32OtherBufSize)
{
    XDP_RECT_S stRectRealV0;
    XDP_RECT_S stRectY;
    XDP_RECT_S stRectC;
    HI_U32 u32DataWidth = 0;
    HI_U32 u32DataWidthY = 0;
    HI_U32 u32DataWidthC = 0;
    HI_U32 u32BufNum = 0;
    HI_U32 u32ExLineNum = 0;
    HI_U32 u32HgtTmp = 0;
    HI_BOOL bRandModeEn = HI_FALSE;
    HI_U32 u32AlignByte = 16;
    XDP_SOLO_ADDR_S stAddrTemp;
    HI_U32 u32VpssOutDataWidth = 8;
    HI_U32 i = 0;

    //const HI_U32 **pstTmpArray = HI_NULL;

    HI_U32 u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_BUTT][2] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},
                                                                         {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};

    const HI_U32 u32CycBufNumAddExLineFieldHD[VPSS_CYCBUF_CHNSET_BUTT][2] = {
                                                                    //buf num  , ext line
                                                                    {        1 ,        0},//OUTY
                                                                    {        1 ,        0},//OUTC
                                                                    {        3 ,        2},//DIY
                                                                    {        3 ,        3},//DIC
                                                                    {        2 ,        0},//HISM
                                                                    {        0 ,        0},//DM_CNT
                                                                    {        0 ,        0},//NR_MAD
                                                                    {        0 ,        0},//STATH
                                                                    {        0 ,        0},//STATV
                                                                    {        0 ,        0},//RGMV
    };
    const HI_U32 u32CycBufNumAddExLineFieldSD[VPSS_CYCBUF_CHNSET_BUTT][2] = {
                                                                    {        1 ,        0},//OUTY
                                                                    {        1 ,        0},//OUTC
                                                                    {        3 ,        2},//DIY
                                                                    {        3 ,        3},//DIC
                                                                    {        2 ,        0},//HISM
                                                                    {        2 ,        0},//DM_CNT
                                                                    {        2 ,       13},//NR_MAD
                                                                    {        2 ,        1},//STATH
                                                                    {        2 ,        1},//STATV
                                                                    {        3 ,        0},//RGMV
    };
    const HI_U32 u32CycBufNumAddExLineFrame[VPSS_CYCBUF_CHNSET_BUTT][2] = {
                                                                    {        1 ,        0},//OUTY
                                                                    {        1 ,        0},//OUTC
                                                                    {        1 ,        0},//DIY
                                                                    {        1 ,        0},//DIC
                                                                    {        0 ,        0},//HISM
                                                                    {        1 ,        1},//DM_CNT
                                                                    {        1 ,        0},//NR_MAD
                                                                    {        1 ,        1},//STATH
                                                                    {        1 ,        1},//STATV
                                                                    {        2 ,        0},//RGMV
    };

    memset(&stAddrTemp, 0x0, sizeof(XDP_SOLO_ADDR_S));
    memset(&stRectRealV0, 0x0, sizeof(XDP_RECT_S));
    memset(&stRectY, 0x0, sizeof(XDP_RECT_S));
    memset(&stRectC, 0x0, sizeof(XDP_RECT_S));
    memset(pstVpssIpChnCfg, 0x0, sizeof(XDP_VPSSIP_CHN_CFG_S));

    if(pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
    {
        for(i = 0; i < VPSS_CYCBUF_CHNSET_BUTT; i ++)
        {
            u32CycBufNumAddExLineTmp[i][0] = u32CycBufNumAddExLineFrame[i][0];
            u32CycBufNumAddExLineTmp[i][1] = u32CycBufNumAddExLineFrame[i][1];
        }
    }
    else
    {
        if(pstVpssIpPolicy->bIsSD == HI_TRUE)
        {
            for(i = 0; i < VPSS_CYCBUF_CHNSET_BUTT; i ++)
            {
                u32CycBufNumAddExLineTmp[i][0] = u32CycBufNumAddExLineFieldSD[i][0];
                u32CycBufNumAddExLineTmp[i][1] = u32CycBufNumAddExLineFieldSD[i][1];
            }
        }
        else
        {
            for(i = 0; i < VPSS_CYCBUF_CHNSET_BUTT; i ++)
            {
                u32CycBufNumAddExLineTmp[i][0] = u32CycBufNumAddExLineFieldHD[i][0];
                u32CycBufNumAddExLineTmp[i][1] = u32CycBufNumAddExLineFieldHD[i][1];
            }
        }
    }

    stRectY.u32Wth = XDP_MAX_WTH;
    stRectY.u32Hgt = XDP_MAX_HGT;
    stRectC.u32Wth = VpssCalcChmWth(stRectY.u32Wth, FMT_ADP(pstVpssIpPolicy->enDataFmt));
    stRectC.u32Hgt = VpssCalcChmHgt(stRectY.u32Hgt, FMT_ADP(pstVpssIpPolicy->enDataFmt));
    u32VpssOutDataWidth = 8;

    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32Str = VpssUpAlign((stRectY.u32Wth * u32VpssOutDataWidth + 7)/8,u32AlignByte);
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32BufSize = (pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32Str * stRectY.u32Hgt) * u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_OUT_Y][0];
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32Wth = stRectY.u32Wth;
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32Hgt = stRectY.u32Hgt;
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32StartAddr = pstVpssIpPolicy->u32VpssoutStartAddr;
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32BufSize;

    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32Str = VpssUpAlign((stRectY.u32Wth * u32VpssOutDataWidth + 7)/8,u32AlignByte);
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32BufSize = (pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32Str * stRectC.u32Hgt) * u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_OUT_C][0];
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32Wth = stRectC.u32Wth;
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32Hgt = stRectC.u32Hgt;
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32EndAddr;
    pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32BufSize;

    stRectRealV0.u32Wth = pstVpssIpPolicy->u32HzmeWth;
    stRectRealV0.u32Hgt = pstVpssIpPolicy->u32HzmeHgt;

    if (VDP_RMODE_PROGRESSIVE != pstVpssIpPolicy->enRdMode)
    {
        stRectRealV0.u32Hgt /= 2;
    }

    //if((HI_TRUE == pstVpssIpPolicy->bDeiEn) || ((HI_FALSE == pstVpssIpPolicy->bDeiEn) && (pstVpssIpPolicy->u32FrmCnt == 0)) || (HI_TRUE == pstVpssIpPolicy->bTnrEn))
    {
        stRectY.u32Wth = stRectRealV0.u32Wth;
        stRectY.u32Hgt = stRectRealV0.u32Hgt;
        stRectC.u32Wth = VpssCalcChmWth(stRectY.u32Wth, FMT_ADP(pstVpssIpPolicy->enDataFmt));
        stRectC.u32Hgt = VpssCalcChmHgt(stRectY.u32Hgt, FMT_ADP(pstVpssIpPolicy->enDataFmt));

        u32DataWidthY  = (XDP_DATA_WTH_10 == pstVpssIpPolicy->enNrDataWidth) ? 10 : 8;
        u32DataWidthC  = u32DataWidthY * 2;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Wth = pstVpssIpPolicy->u32HzmeWth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Hgt = pstVpssIpPolicy->u32HzmeHgt;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Wth = pstVpssIpPolicy->u32HzmeWth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Hgt = pstVpssIpPolicy->u32HzmeHgt;

        // DI Y
        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_DI_Y][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_DI_Y][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidthY, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32StartAddr = pstVpssIpPolicy->u32BufStartAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32BufSize;

        // DI C
        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_DI_C][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_DI_C][1];

        u32HgtTmp      = stRectC.u32Hgt;
        stRectC.u32Hgt = stRectC.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectC, u32DataWidthC, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32BufSize;

    }

    //if ((HI_TRUE == pstVpssIpPolicy->bDeiEn) || ((HI_FALSE == pstVpssIpPolicy->bDeiEn) && (pstVpssIpPolicy->u32FrmCnt == 0)))
    {
        stRectY.u32Wth = (stRectRealV0.u32Wth + 2) / 4;
        stRectY.u32Hgt =  stRectRealV0.u32Hgt;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Wth = stRectY.u32Wth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Hgt = stRectY.u32Hgt;
        u32DataWidth  = VpssGetWchnDataWidth(VPSS_MAC_WCHN_DI_WST);

        //HISM
        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_HISM][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_HISM][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidth, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32BufSize;
    }

    // (HI_TRUE == pstVpssIpPolicy->bRgmeEn)
    {
        stRectY.u32Wth = (stRectRealV0.u32Wth + 33) / 64;
        stRectY.u32Hgt = (stRectRealV0.u32Hgt + 5) / 8;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Wth = stRectY.u32Wth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Hgt = stRectY.u32Hgt;
        u32DataWidth   = VpssGetWchnDataWidth(VPSS_MAC_WCHN_CFRGMV);

        //RGMV
        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_RGMV][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_RGMV][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidth, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32BufSize;

        //STATH
        stRectY.u32Wth = (stRectRealV0.u32Wth + 33) / 64 * 128 / 4;
        stRectY.u32Hgt = (stRectRealV0.u32Hgt + 5) / 8;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Wth = stRectY.u32Wth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Hgt = stRectY.u32Hgt;
        u32DataWidth   = VpssGetWchnDataWidth(VPSS_MAC_WCHN_WPRJH);

        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_STATH][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_STATH][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidth, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32BufSize;

        //STATV
        stRectY.u32Wth = (stRectRealV0.u32Wth + 33) / 64 * 16 / 4;
        stRectY.u32Hgt = (stRectRealV0.u32Hgt + 5) / 8;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Wth = stRectY.u32Wth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Hgt = stRectY.u32Hgt;
        u32DataWidth   = VpssGetWchnDataWidth(VPSS_MAC_WCHN_WPRJV);

        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_STATV][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_STATV][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidth, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32BufSize;
    }

    //if (HI_TRUE == pstVpssIpPolicy->bTnrEn)
    {
        //NR_WMAD
        stRectY.u32Wth = stRectRealV0.u32Wth;
        stRectY.u32Hgt = stRectRealV0.u32Hgt;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Wth = stRectY.u32Wth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Hgt = stRectY.u32Hgt;
        u32DataWidth   = VpssGetWchnDataWidth(VPSS_MAC_WCHN_NR_WMAD);

        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_NR_MAD][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_NR_MAD][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;
        stRectY.u32Wth = VpssUpAlign(stRectY.u32Wth, 4);

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidth, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32BufSize;
    }

    //if (HI_TRUE == pstVpssIpPolicy->bSnrEn)
    {
        //DM CNT
        stRectY.u32Wth = (stRectRealV0.u32Wth + 3) / 4;
        //stRectY.u32Hgt = (HI_TRUE == pstVpssIpPolicy->bDeiEn) ? (pstVpssIpBufInfo->u32FactHgt+ 3) / 4 : (stRectRealV0.u32Hgt + 3) / 4;
        stRectY.u32Hgt = (pstVpssIpPolicy->u32HzmeHgt + 3) / 4;//(HI_TRUE == pstVpssIpPolicy->bDeiEn) ? (pstVpssIpBufInfo->u32FactHgt+ 3) / 4 : (stRectRealV0.u32Hgt + 3) / 4;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Wth = stRectY.u32Wth;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Hgt = stRectY.u32Hgt;
        u32DataWidth   = VpssGetWchnDataWidth(VPSS_MAC_WCHN_DM_CNT);

        u32BufNum    = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_DM_CNT][0];
        u32ExLineNum = u32CycBufNumAddExLineTmp[VPSS_CYCBUF_CHNSET_DM_CNT][1];

        u32HgtTmp      = stRectY.u32Hgt;
        stRectY.u32Hgt = stRectY.u32Hgt * u32BufNum + u32ExLineNum;

        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32BufSize = VPSS_CalcAddrStr(&stAddrTemp, &stRectY, u32DataWidth, bRandModeEn, u32AlignByte);
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Str = stAddrTemp.u32Str;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32StartAddr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32EndAddr;
        pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32EndAddr   = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32StartAddr + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32BufSize;
    }

#if 0
    *pu32TotalBufSize =   pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32BufSize;
#else
   if (HI_NULL != pu32TotalBufSize)
   {
       *pu32TotalBufSize =  pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32BufSize
                           + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32BufSize;
   }

   if (HI_NULL != pu32OtherBufSize)
   {
       *pu32OtherBufSize = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32BufSize
                       + pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32BufSize;
   }
#endif

#if 0

    for (i = 0; i < VPSS_CYCBUF_CHNSET_BUTT; i ++)
    {
        printk("i = %d, bufsize = %d \n", i, pstVpssIpChnCfg->stChnSet[i].u32BufSize);
    }

#endif
    return;

}

HI_VOID XDP_DRV_SetDeiChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange=0;

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if ((HI_TRUE == pstVpssIpPolicy->bDeiEn) || ((pstVpssIpPolicy->bFrmInit == HI_TRUE) && (pstVpssIpPolicy->enRdMode != VDP_RMODE_PROGRESSIVE)))
    {
        if (u32ActiveRange == 0) //top and bottom valid
        {
            //cycbuf cfg
            pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_START_ADDR_LOW.bits.di_y_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_END_ADDR_LOW.bits.di_y_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32EndAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_START_ADDR_LOW.bits.di_c_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_END_ADDR_LOW.bits.di_c_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32EndAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_HISM_CYC_START_ADDR_LOW.bits.hism_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_HISM_CYC_END_ADDR_LOW.bits.hism_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32EndAddr;

            VDP_QF_HAL_SetVPSS_DI_CYC_Y_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_DI_CYC_Y_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_END_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_DI_CYC_C_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_DI_CYC_C_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_END_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_HISM_CYC_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_HISM_CYC_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_HISM_CYC_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_HISM_CYC_END_ADDR_LOW);
            //wchn nr_rfr
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_en = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_mute_mode = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_dither_mode = VPSS_DITHER_MODE_RAND;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_uv_invert = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw = pstVpssIpPolicy->enNrDataWidth;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_dither_en = (pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw == XDP_DATA_WTH_10) ? HI_FALSE : HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_STRIDE.bits.rfrc_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_STRIDE.bits.rfry_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str;
            VDP_QF_HAL_SetVPSS_RFR_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RFR_STRIDE);
            VDP_QF_HAL_SetVPSS_RFR_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL);
            //rchn p2
            pstCfgMode->pstXdpRegTmp->VPSS_P2_SIZE.bits.p2_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_SIZE.bits.p2_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_STRIDE.bits.p2y_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_STRIDE.bits.p2c_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str;
            VDP_QF_HAL_SetVPSS_P2_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_SIZE);
            VDP_QF_HAL_SetVPSS_P2_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_STRIDE);
            //rchn p1
            pstCfgMode->pstXdpRegTmp->VPSS_P1_STRIDE.bits.p1y_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str;
            pstCfgMode->pstXdpRegTmp->VPSS_P1_STRIDE.bits.p1c_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str;
            VDP_QF_HAL_SetVPSS_P1_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1_STRIDE);
            //rchn p3
            pstCfgMode->pstXdpRegTmp->VPSS_P3_STRIDE.bits.p3y_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str;
            pstCfgMode->pstXdpRegTmp->VPSS_P3_STRIDE.bits.p3c_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str;
            VDP_QF_HAL_SetVPSS_P3_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P3_STRIDE);
            //wchn di_wst
            pstCfgMode->pstXdpRegTmp->VPSS_WHISM_STRIDE.bits.whism_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Str;
            VDP_QF_HAL_SetVPSS_WHISM_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WHISM_STRIDE);
            //rchn di_rst
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_SIZE.bits.rhism_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_SIZE.bits.rhism_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_STRIDE.bits.rhism_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_HISM].u32Str;
            VDP_QF_HAL_SetVPSS_RHISM_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RHISM_SIZE);
            VDP_QF_HAL_SetVPSS_RHISM_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RHISM_STRIDE);
        }
        else
        {
            //rchn p2
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_mute_mode = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_bitw = pstVpssIpPolicy->enNrDataWidth;
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_format = FMT_ADP(pstVpssIpPolicy->enDataFmt);
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_lm_rmode = RMODE_ADP(pstVpssIpPolicy->enRdMode);
            VDP_QF_HAL_SetVPSS_P2_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL);
            //rchn p1
            pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_mute_mode = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_bitw = pstVpssIpPolicy->enNrDataWidth;
            pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_format = FMT_ADP(pstVpssIpPolicy->enDataFmt);
            VDP_QF_HAL_SetVPSS_P1_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL);
            //rchn p3
            pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_mute_mode = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_bitw = pstVpssIpPolicy->enNrDataWidth;
            pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_format = FMT_ADP(pstVpssIpPolicy->enDataFmt);
            VDP_QF_HAL_SetVPSS_P3_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL);
            //wchn di_wst
            pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL.bits.whism_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL.bits.whism_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL.bits.whism_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL.bits.whism_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_WHISM_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL);
            //rchn di_rst
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL.bits.rhism_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL.bits.rhism_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL.bits.rhism_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL.bits.rhism_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_RHISM_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL);
        }
    }
    else
    {
        pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL.bits.p1_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL.bits.p3_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL.bits.rhism_en = 0;

        pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL.bits.whism_en = 0;

        VDP_QF_HAL_SetVPSS_P1_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1_CTRL);
        VDP_QF_HAL_SetVPSS_P2_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL);
        VDP_QF_HAL_SetVPSS_P3_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P3_CTRL);
        VDP_QF_HAL_SetVPSS_RHISM_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RHISM_CTRL);

        VDP_QF_HAL_SetVPSS_RFR_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL);
        VDP_QF_HAL_SetVPSS_WHISM_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WHISM_CTRL);
    }

    return;

}

HI_VOID XDP_DRV_SetSnrChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange=0;

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if ((HI_TRUE == pstVpssIpPolicy->bSnrEn) || (pstVpssIpPolicy->bFrmInit == HI_TRUE))
    {
        if(u32ActiveRange == 0) //top and bottom valid
        {
            //cycbuf cfg
            pstCfgMode->pstXdpRegTmp->VPSS_DM_CNT_CYC_START_ADDR_LOW.bits.dm_cnt_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_DM_CNT_CYC_END_ADDR_LOW.bits.dm_cnt_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32EndAddr;
            VDP_QF_HAL_SetVPSS_DM_CNT_CYC_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DM_CNT_CYC_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_DM_CNT_CYC_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DM_CNT_CYC_END_ADDR_LOW);
            //rchn snr_rmad
            pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_STRIDE.bits.snr_rmad_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Str;
            pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL1.bits.snr_rmad_vifir_en = pstVpssIpPolicy->bMadVfirEn;
            VDP_QF_HAL_SetVPSS_SNR_RMAD_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_STRIDE);
            VDP_QF_HAL_SetVPSS_SNR_RMAD_CTRL1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL1);
            //wchn dm_cnt
            pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_STRIDE.bits.wdm_cnt_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Str;
            VDP_QF_HAL_SetVPSS_WDM_CNT_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_STRIDE);
            //rchn dm_cnt
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_SIZE.bits.rdm_cnt_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_SIZE.bits.rdm_cnt_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_STRIDE.bits.rdm_cnt_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DM_CNT].u32Str;
            VDP_QF_HAL_SetVPSS_RDM_CNT_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_SIZE);
            VDP_QF_HAL_SetVPSS_RDM_CNT_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_STRIDE);

            if (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
            {
                //rchn snr_rmad
                pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_en = (pstVpssIpPolicy->bDeiEn == HI_TRUE) ? ((pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE) : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_SNR_RMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL);
                //wchn dm_cnt
                pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_WDM_CNT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL);
                //rchn dm_cnt
                pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_RDM_CNT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL);
            }
        }
        else
        {
            //rchn snr_rmad
            pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_en = (pstVpssIpPolicy->bDeiEn == HI_TRUE) ? ((pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE) : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_SNR_RMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL);
            //wchn dm_cnt
            pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_WDM_CNT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL);
            //rchn dm_cnt
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_RDM_CNT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL);
        }
    }
    else
    {
        pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_en = 0;

        VDP_QF_HAL_SetVPSS_WDM_CNT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_WDM_CNT_CTRL);
        VDP_QF_HAL_SetVPSS_SNR_RMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_SNR_RMAD_CTRL);
        VDP_QF_HAL_SetVPSS_RDM_CNT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RDM_CNT_CTRL);
    }

    return;

}

HI_VOID XDP_DRV_SetTnrChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    if ((HI_TRUE == pstVpssIpPolicy->bTnrEn) || (pstVpssIpPolicy->bFrmInit == HI_TRUE))
    {
        if (u32ActiveRange == 0)
        {
            if ((HI_FALSE == pstVpssIpPolicy->bDeiEn) && (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE))
            {
                //cycbuf cfg
                pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_START_ADDR_LOW.bits.di_y_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32StartAddr;
                pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_END_ADDR_LOW.bits.di_y_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32EndAddr;
                pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_START_ADDR_LOW.bits.di_c_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32StartAddr;
                pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_END_ADDR_LOW.bits.di_c_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32EndAddr;
                VDP_QF_HAL_SetVPSS_DI_CYC_Y_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_START_ADDR_LOW);
                VDP_QF_HAL_SetVPSS_DI_CYC_Y_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_Y_END_ADDR_LOW);
                VDP_QF_HAL_SetVPSS_DI_CYC_C_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_START_ADDR_LOW);
                VDP_QF_HAL_SetVPSS_DI_CYC_C_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_DI_CYC_C_END_ADDR_LOW);
                //wchn nr_rfr
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_STRIDE.bits.rfrc_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_STRIDE.bits.rfry_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_en = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_mute_mode = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_dither_mode = VPSS_DITHER_MODE_RAND;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_uv_invert = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw = pstVpssIpPolicy->enNrDataWidth;
                pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_dither_en = (pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw == XDP_DATA_WTH_10) ? HI_FALSE : HI_TRUE;
                VDP_QF_HAL_SetVPSS_RFR_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RFR_STRIDE);
                VDP_QF_HAL_SetVPSS_RFR_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL);
                //rchn p2
                pstCfgMode->pstXdpRegTmp->VPSS_P2_SIZE.bits.p2_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Wth - 1;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_SIZE.bits.p2_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Hgt - 1;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_STRIDE.bits.p2y_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_Y].u32Str;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_STRIDE.bits.p2c_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_DI_C].u32Str;
                VDP_QF_HAL_SetVPSS_P2_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_SIZE);
                VDP_QF_HAL_SetVPSS_P2_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_STRIDE);
                if (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
                {
                    //rchn p2
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_mute_en = HI_FALSE;
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_d_bypass = HI_TRUE;
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_mute_mode = HI_FALSE;
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_bitw = pstVpssIpPolicy->enNrDataWidth;
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_format = FMT_ADP(pstVpssIpPolicy->enDataFmt);
                    pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_lm_rmode = RMODE_ADP(pstVpssIpPolicy->enRdMode);
                    VDP_QF_HAL_SetVPSS_P2_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL);
                }
            }
            //cycbuf cfg
            pstCfgMode->pstXdpRegTmp->VPSS_NR_MAD_CYC_START_ADDR_LOW.bits.nr_mad_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_MAD_CYC_END_ADDR_LOW.bits.nr_mad_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32EndAddr;
            VDP_QF_HAL_SetVPSS_NR_MAD_CYC_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_MAD_CYC_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_NR_MAD_CYC_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_MAD_CYC_END_ADDR_LOW);
            //wchn nr_wmad
            pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_STRIDE.bits.nr_wmad_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Str;
            VDP_QF_HAL_SetVPSS_NR_WMAD_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_STRIDE);
            //rchn nr_rmad
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_SIZE.bits.nr_rmad_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_SIZE.bits.nr_rmad_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_STRIDE.bits.nr_rmad_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_NR_MAD].u32Str;
            VDP_QF_HAL_SetVPSS_NR_RMAD_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_SIZE);
            VDP_QF_HAL_SetVPSS_NR_RMAD_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_STRIDE);
            if (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
            {
                //wchn nr_wmad
                pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_NR_WMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL);
                //rchn nr_rmad
                pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_NR_RMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL);
            }
        }
        else
        {
            if ((HI_FALSE == pstVpssIpPolicy->bDeiEn) && (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE))
            {
                //rchn p2
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_mute_mode = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_bitw = pstVpssIpPolicy->enNrDataWidth;
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_format = FMT_ADP(pstVpssIpPolicy->enDataFmt);
                pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_lm_rmode = RMODE_ADP(pstVpssIpPolicy->enRdMode);
                VDP_QF_HAL_SetVPSS_P2_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL);
            }
            //wchn nr_wmad
            pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_NR_WMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL);
            //rchn nr_rmad
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_NR_RMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL);
        }
    }
    else
    {
        if ((HI_FALSE == pstVpssIpPolicy->bDeiEn) && (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE))
        {
            pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL.bits.p2_en = 0;
            pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL.bits.rfr_en = 0;
            VDP_QF_HAL_SetVPSS_P2_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2_CTRL);
            VDP_QF_HAL_SetVPSS_RFR_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RFR_CTRL);
        }
        pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_en = 0;
        VDP_QF_HAL_SetVPSS_NR_RMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_RMAD_CTRL);
        VDP_QF_HAL_SetVPSS_NR_WMAD_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_NR_WMAD_CTRL);
    }

    return;

}

HI_VOID XDP_DRV_SetRgmeChnCfg(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy,XDP_VPSSIP_CHN_CFG_S *pstVpssIpChnCfg,XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    if ((HI_TRUE == pstVpssIpPolicy->bRgmeEn) || (pstVpssIpPolicy->bFrmInit == HI_TRUE))
    {
        if (u32ActiveRange == 0)
        {
            //cycbuf cfg
            pstCfgMode->pstXdpRegTmp->VPSS_STATH_CYC_START_ADDR_LOW.bits.stath_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_STATH_CYC_END_ADDR_LOW.bits.stath_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32EndAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_STATV_CYC_START_ADDR_LOW.bits.statv_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_STATV_CYC_END_ADDR_LOW.bits.statv_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32EndAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_RGMV_CYC_START_ADDR_LOW.bits.rgmv_start_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32StartAddr;
            pstCfgMode->pstXdpRegTmp->VPSS_RGMV_CYC_END_ADDR_LOW.bits.rgmv_end_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32EndAddr;

            VDP_QF_HAL_SetVPSS_STATH_CYC_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_STATH_CYC_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_STATH_CYC_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_STATH_CYC_END_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_STATV_CYC_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_STATV_CYC_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_STATV_CYC_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_STATV_CYC_END_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_RGMV_CYC_START_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RGMV_CYC_START_ADDR_LOW);
            VDP_QF_HAL_SetVPSS_RGMV_CYC_END_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_RGMV_CYC_END_ADDR_LOW);
            //wchn cfrgmv
            pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_STRIDE.bits.cfrgmv_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Str;
            VDP_QF_HAL_SetVPSS_CFRGMV_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_STRIDE);
            //rchn p1rgmv
            pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_STRIDE.bits.p1rgmv_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Str;
            VDP_QF_HAL_SetVPSS_P1RGMV_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_STRIDE);
            //rchn p2rgmv
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_SIZE.bits.p2rgmv_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_SIZE.bits.p2rgmv_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_STRIDE.bits.p2rgmv_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_RGMV].u32Str;
            VDP_QF_HAL_SetVPSS_P2RGMV_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_SIZE);
            VDP_QF_HAL_SetVPSS_P2RGMV_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_STRIDE);
            //wchn wprjh
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_STRIDE.bits.cfstath_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Str;
            VDP_QF_HAL_SetVPSS_CFSTATH_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_STRIDE);
            //rchn rprjh
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_SIZE.bits.p2stath_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_SIZE.bits.p2stath_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_STRIDE.bits.p2stath_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATH].u32Str;
            VDP_QF_HAL_SetVPSS_P2STATH_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_SIZE);
            VDP_QF_HAL_SetVPSS_P2STATH_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_STRIDE);
            //wchn wprjv
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_STRIDE.bits.cfstatv_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Str;
            VDP_QF_HAL_SetVPSS_CFSTATV_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_STRIDE);
            //rchn rprjv
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_SIZE.bits.p2statv_height = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Hgt - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_SIZE.bits.p2statv_width = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Wth - 1;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_STRIDE.bits.p2statv_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_STATV].u32Str;
            VDP_QF_HAL_SetVPSS_P2STATV_SIZE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_SIZE);
            VDP_QF_HAL_SetVPSS_P2STATV_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_STRIDE);
            if (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
            {
                //wchn cfrgmv
                pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_CFRGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL);
                //rchn p1rgmv
                pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_P1RGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL);
                //rchn p2rgmv
                pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_P2RGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL);
                //wchn wprjh
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_CFSTATH_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL);
                //rchn rprjh
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_P2STATH_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL);
                //wchn wprjv
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_mute_en = HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_CFSTATV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL);
                //rchn rprjv
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_d_bypass = HI_TRUE;
                pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_mute_mode = HI_FALSE;
                VDP_QF_HAL_SetVPSS_P2STATV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL);
            }
        }
        else
        {
            //wchn cfrgmv
            pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_CFRGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL);
            //rchn p1rgmv
            pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_P1RGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL);
            //rchn p2rgmv
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_P2RGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL);
            //wchn wprjh
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_CFSTATH_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL);
            //rchn rprjh
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_P2STATH_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL);
            //wchn wprjv
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_mute_en = HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_CFSTATV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL);
            //rchn rprjv
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_en = (pstVpssIpPolicy->u32FrmCnt >= 1) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_mute_en = (pstVpssIpPolicy->u32FrmCnt <= 2) ? HI_TRUE : HI_FALSE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_d_bypass = HI_TRUE;
            pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_mute_mode = HI_FALSE;
            VDP_QF_HAL_SetVPSS_P2STATV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL);
        }
    }
    else
    {
        pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_en   = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_en   = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_en = 0;
        pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_en = 0;

        VDP_QF_HAL_SetVPSS_P2STATV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATV_CTRL);
        VDP_QF_HAL_SetVPSS_P2STATH_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2STATH_CTRL);
        VDP_QF_HAL_SetVPSS_P2RGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P2RGMV_CTRL);
        VDP_QF_HAL_SetVPSS_P1RGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_P1RGMV_CTRL);
        VDP_QF_HAL_SetVPSS_CFSTATH_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATH_CTRL);
        VDP_QF_HAL_SetVPSS_CFSTATV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFSTATV_CTRL);
        VDP_QF_HAL_SetVPSS_CFRGMV_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_CFRGMV_CTRL);
    }

    return;

}

HI_VOID XDP_DRV_SetVpssOutChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo)
{
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_en = pstVpssIpPolicy->bVpssOutChnEn;

    if(pstVpssIpPolicy->bVpssOutChnEn == HI_FALSE)
    {
        VDP_QF_HAL_SetVPSS_OUT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL);
        return;
    }

    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_d_bypass = HI_TRUE;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_mute_en = HI_FALSE;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_bitw = ((pstVpssIpPolicy->bTnrEn == HI_TRUE) && (pstVpssIpPolicy->bDeiEn == HI_FALSE) && (pstVpssIpPolicy->bSnrEn == HI_FALSE)) ? XDP_DATA_WTH_10 : XDP_DATA_WTH_8;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_dither_mode = 0;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_dither_en = (pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_bitw == XDP_DATA_WTH_8) ? HI_TRUE : HI_FALSE;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL.bits.out_uv_invert = HI_FALSE;
    VDP_QF_HAL_SetVPSS_OUT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_OUT_CTRL);

    pstCfgMode->pstXdpRegTmp->VPSS_OUTY_ADDR_LOW.bits.outy_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32StartAddr;
    pstCfgMode->pstXdpRegTmp->VPSS_OUTC_ADDR_LOW.bits.outc_addr = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32StartAddr;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_STRIDE.bits.outy_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32Str;
    pstCfgMode->pstXdpRegTmp->VPSS_OUT_STRIDE.bits.outc_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32Str;
    VDP_QF_HAL_SetVPSS_OUTY_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_OUTY_ADDR_LOW);
    VDP_QF_HAL_SetVPSS_OUTC_ADDR_LOW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_OUTC_ADDR_LOW);
    VDP_QF_HAL_SetVPSS_OUT_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VPSS_OUT_STRIDE);

    return;
}

HI_VOID XDP_DRV_SetVfFdrCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;
    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    if(pstVpssIpPolicy->bVpssOutChnEn == HI_FALSE)
    {
       return;
    }

    pstCfgMode->pstXdpRegTmp->VF_VID_READ_CTRL.bits.lm_draw_mode = pstInfoIn->stXdpVfFdrCfg.enDrawMode;
    pstCfgMode->pstXdpRegTmp->VF_VID_READ_CTRL.bits.chm_draw_mode = pstInfoIn->stXdpVfFdrCfg.enDrawMode;
    pstCfgMode->pstXdpRegTmp->VF_VID_READ_CTRL.bits.fdr_ck_gt_en = 1;
    pstCfgMode->pstXdpRegTmp->VF_VID_READ_CTRL.bits.mute_req_en = 1;

    pstCfgMode->pstXdpRegTmp->VF_VID_READ_MODE.bits.lm_rmode = (pstInfoIn->stXdpSysCfg.bFieldMatch == HI_TRUE) ? ((pstVpssIpPolicy->u32FrmCnt == 0) ? VDP_RMODE_PRO_INTERFACE : VDP_RMODE_INTERFACE) : VDP_RMODE_PROGRESSIVE;
    pstCfgMode->pstXdpRegTmp->VF_VID_READ_MODE.bits.chm_rmode = pstCfgMode->pstXdpRegTmp->VF_VID_READ_MODE.bits.lm_rmode;

    pstCfgMode->pstXdpRegTmp->VF_VID_OUT_CTRL.bits.draw_pixel_mode = pstInfoIn->stXdpVfFdrCfg.enDrawPixelMode;

    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_BITW.bits.data_width = ((pstVpssIpPolicy->bTnrEn == HI_TRUE) && (pstVpssIpPolicy->bDeiEn == HI_FALSE) && (pstVpssIpPolicy->bSnrEn == HI_FALSE)) ? XDP_DATA_WTH_10 : XDP_DATA_WTH_8;

    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_INFO.bits.uv_order_en = pstInfoIn->stXdpVfFdrCfg.bUVOrder;
    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_INFO.bits.data_type = (pstVpssIpPolicy->enDataFmt == VDP_VID_IFMT_SP_422) ?  VDP_VID_DATA_TYPE_YUV422 : VDP_VID_DATA_TYPE_YUV420;
    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_INFO.bits.data_fmt = XDP_DATA_TYPE_SP_LINEAR;

    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_RESO.bits.src_w = pstInfoIn->stXdpVfFdrCfg.stSrcRect.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_RESO.bits.src_h = pstInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt - 1;

    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_CROP.bits.src_crop_x = pstInfoIn->stXdpVfFdrCfg.stCropRect.u32X;
    pstCfgMode->pstXdpRegTmp->VF_VID_SRC_CROP.bits.src_crop_y = pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Y;

    pstCfgMode->pstXdpRegTmp->VF_VID_IN_RESO.bits.ireso_w = pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->VF_VID_IN_RESO.bits.ireso_h = pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt - 1;

    pstCfgMode->pstXdpRegTmp->VF_VID_ADDR_L.bits.vhdaddr_l = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32StartAddr;
    pstCfgMode->pstXdpRegTmp->VF_VID_CADDR_L.bits.vhdcaddr_l = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32StartAddr;
    pstCfgMode->pstXdpRegTmp->VF_VID_STRIDE.bits.lm_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_Y].u32Str;
    pstCfgMode->pstXdpRegTmp->VF_VID_STRIDE.bits.chm_stride = pstVpssIpChnCfg->stChnSet[VPSS_CYCBUF_CHNSET_OUT_C].u32Str;

    pstCfgMode->pstXdpRegTmp->VF_VID_MUTE_BK.bits.mute_en = 0;
    pstCfgMode->pstXdpRegTmp->VF_VID_MUTE_BK.bits.mute_y  = 0x0;
    pstCfgMode->pstXdpRegTmp->VF_VID_MUTE_BK.bits.mute_cb = 0x200;
    pstCfgMode->pstXdpRegTmp->VF_VID_MUTE_BK.bits.mute_cr = 0x200;
    if (u32ActiveRange == 0) //top and bottom valid
    {
        VDP_QF_HAL_SetVF_VID_SRC_BITW(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_SRC_BITW);
        VDP_QF_HAL_SetVF_VID_SRC_INFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_SRC_INFO);
        VDP_QF_HAL_SetVF_VID_ADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_ADDR_L);
        VDP_QF_HAL_SetVF_VID_CADDR_L(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_CADDR_L);
        VDP_QF_HAL_SetVF_VID_STRIDE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_STRIDE);
        VDP_QF_HAL_SetVF_VID_MUTE_BK(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_MUTE_BK);

        if (pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetVF_VID_SRC_RESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_SRC_RESO);
            VDP_QF_HAL_SetVF_VID_READ_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_READ_CTRL);
            VDP_QF_HAL_SetVF_VID_READ_MODE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_READ_MODE);
            VDP_QF_HAL_SetVF_VID_OUT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_OUT_CTRL);
            VDP_QF_HAL_SetVF_VID_SRC_CROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_SRC_CROP);
            VDP_QF_HAL_SetVF_VID_IN_RESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_IN_RESO);
        }
    }
    else //top or bottom valid
    {
        VDP_QF_HAL_SetVF_VID_SRC_RESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_SRC_RESO);
        VDP_QF_HAL_SetVF_VID_READ_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_READ_CTRL);
        VDP_QF_HAL_SetVF_VID_READ_MODE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_READ_MODE);
        VDP_QF_HAL_SetVF_VID_OUT_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_OUT_CTRL);
        VDP_QF_HAL_SetVF_VID_SRC_CROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_SRC_CROP);
        VDP_QF_HAL_SetVF_VID_IN_RESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VF_VID_IN_RESO);
    }

    return;

}

HI_VOID XDP_DRV_SetVpssIpCtrlCfg(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;
    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.frm_init = pstVpssIpPolicy->bFrmInit;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.mac_mad_en = pstVpssIpPolicy->bMacMadEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.bfield_first = pstVpssIpPolicy->u32BfieldFirst;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.igbm_en = pstVpssIpPolicy->bIgbmEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.ifmd_en = pstVpssIpPolicy->bIfmdEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.tnr_en = pstVpssIpPolicy->bTnrEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.snr_en = pstVpssIpPolicy->bSnrEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.dei_fld_mode = pstVpssIpPolicy->u32DeiFldMode;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.blk_det_en = pstVpssIpPolicy->bBlkDetEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.rgme_en = pstVpssIpPolicy->bRgmeEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.vc1_en = pstVpssIpPolicy->bVc1En;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.dei_en = pstVpssIpPolicy->bDeiEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.mcnr_en = pstVpssIpPolicy->bMcnrEn;
    pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL.bits.tnr_mad_mode = pstVpssIpPolicy->bTnrMadMode;

    if (u32ActiveRange == 0) //top and bottom valid
    {
        if(pstVpssIpPolicy->enRdMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetV0_VPSS_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL);
        }
    }
    else //top or bottom valid
    {
        VDP_QF_HAL_SetV0_VPSS_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VPSS_CTRL);
    }

    return;
}

HI_VOID XDP_DRV_SetVid0HZmeCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.lhfir_en = (((pstInfoIn->stXdpNodeInfo.bLastFrame == HI_TRUE) && (pstInfoIn->stXdpFdrCfg.enReadMode != VDP_RMODE_PROGRESSIVE)) || (pstInfoIn->stXdpLayerExtern.u32LinkEn == 1)) ? 0 : pstInfoIn->stXdpHZmeCfg.bHzmeEn;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.chfir_en = pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.lhfir_en;

    if((pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.lhfir_en == 0)&&(pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.chfir_en == 0))
    {
        VDP_QF_HAL_SetV0_HPZME_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP);
        return;
    }

    pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN02.u32 = pstInfoIn->stXdpHZmeCfg.u32HorCoefAddr;

    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.lhmid_en = pstInfoIn->stXdpHZmeCfg.bHLumMidEn;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.chmid_en = pstInfoIn->stXdpHZmeCfg.bHChmMidEn;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.lhfir_mode = pstInfoIn->stXdpHZmeCfg.enHLumFirMode;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.chfir_mode = pstInfoIn->stXdpHZmeCfg.enHChmFirMode;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.hratio = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth / 2 * ZME_HPREC) / pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth * 2;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP.bits.non_lnr_en = 0;

    pstCfgMode->pstXdpRegTmp->V0_HPZME_HINFO.bits.out_fmt   = FMT_ADP(pstInfoIn->stXdpSrcCfg.enInFmt); //0: 420; 1:422; 2:444
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HINFO.bits.ck_gt_en  = 1;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HINFO.bits.out_width = pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth - 1;

    pstCfgMode->pstXdpRegTmp->V0_HPZME_HLOFFSET.bits.lhfir_offset = pstInfoIn->stXdpHZmeCfg.u32LumOffset;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HCOFFSET.bits.chfir_offset = pstInfoIn->stXdpHZmeCfg.u32ChmOffset;

    pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL.bits.hl_shootctrl_en   = pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlEn  ;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL.bits.hl_shootctrl_mode = pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlMode;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL.bits.hl_flatdect_mode  = pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bFlatdectMode ;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL.bits.hl_coringadj_en   = pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bCoringadjEn  ;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL.bits.hl_gain           = pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Gain       ;
    pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL.bits.hl_coring         = pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Coring     ;

    VDP_QF_HAL_SetPARA_ADDR_VHD_CHN02(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN02);
    VDP_QF_HAL_SetV0_HPZME_HINFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HPZME_HINFO);
    VDP_QF_HAL_SetV0_HPZME_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HPZME_HSP);
    VDP_QF_HAL_SetV0_HPZME_HLOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HPZME_HLOFFSET);
    VDP_QF_HAL_SetV0_HPZME_HCOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HPZME_HCOFFSET);
    VDP_QF_HAL_SetV0_HPZME_HL_SHOOTCTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HPZME_HL_SHOOTCTRL);

    return;
}

HI_VOID XDP_DRV_SetVid0ZmeCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ZmeInResoWth    = 0;
    HI_U32 u32ZmeInResoHgt    = 0;
    HI_U32 u32ActiveRange = 0;

    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hlmsc_en = (pstInfoIn->stXdpLayerExtern.u32LinkEn == 1) ? 0 : pstInfoIn->stXdpZmeCfg.bHzmeEn;
    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hchmsc_en = pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hlmsc_en;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vlmsc_en = (pstInfoIn->stXdpLayerExtern.u32LinkEn == 1) ? 0 : pstInfoIn->stXdpZmeCfg.bVzmeEn;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vchmsc_en = pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vlmsc_en;

    if((pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hlmsc_en == 0) && (pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vlmsc_en == 0))
    {
        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);
        VDP_QF_HAL_SetV0_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HSP);
        VDP_QF_HAL_SetV0_VSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VSP);
        return;
    }

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN00.u32 = pstInfoIn->stXdpZmeCfg.u32HorCoefAddr;
    pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN01.u32 = pstInfoIn->stXdpZmeCfg.u32VerCoefAddr;

    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hlmid_en  = pstInfoIn->stXdpZmeCfg.bHLumMidEn;
    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hchmid_en = pstInfoIn->stXdpZmeCfg.bHChmMidEn;
    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.non_lnr_en = 0;
    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hlfir_en  = pstInfoIn->stXdpZmeCfg.enHLumFirMode;
    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hchfir_en = pstInfoIn->stXdpZmeCfg.enHChmFirMode;
    pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hfir_order = 1 ;
    u32ZmeInResoWth = (pstInfoIn->stXdpNodeInfo.enOnOffLineMode == XDP_HAL_STATUS_ONLINE) ? pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth : (pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Wth >> pstInfoIn->stXdpVfFdrCfg.enDrawPixelMode);
    if (0 != pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth)
    {
        pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hratio = (u32ZmeInResoWth / 2 * ZME_HPREC) / pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth * 2;
    }
    else
    {
        VDP_PRINT("Denominator Is Zero !!!!\n");
        pstCfgMode->pstXdpRegTmp->V0_HSP.bits.hratio = 1048576;//default val
    }

    pstCfgMode->pstXdpRegTmp->V0_HLOFFSET.bits.hor_loffset = pstInfoIn->stXdpZmeCfg.s32HLumOffset;
    pstCfgMode->pstXdpRegTmp->V0_HCOFFSET.bits.hor_coffset = pstInfoIn->stXdpZmeCfg.s32HChmOffset;

    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vlmid_en  = pstInfoIn->stXdpZmeCfg.bVLumMidEn;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vchmid_en = pstInfoIn->stXdpZmeCfg.bVChmMidEn;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vlfir_en  = pstInfoIn->stXdpZmeCfg.enVLumFirMode;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.vchfir_en = pstInfoIn->stXdpZmeCfg.enVChmFirMode;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.ck_gt_en = 1 ;
    pstCfgMode->pstXdpRegTmp->V0_VSP.bits.zme_out_fmt = VDP_PROC_FMT_SP_422;

    u32ZmeInResoHgt = (pstInfoIn->stXdpNodeInfo.enOnOffLineMode == XDP_HAL_STATUS_ONLINE) ? pstInfoIn->stXdpHZmeCfg.u32HzmeOutHgt: (pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt >> pstInfoIn->stXdpVfFdrCfg.enDrawMode);
    if (0 != pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt)
    {
        pstCfgMode->pstXdpRegTmp->V0_VSR.bits.vratio = (u32ZmeInResoHgt * ZME_VPREC) / pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt;
    }
    else
    {
        VDP_PRINT("Denominator Is Zero !!!!\n");
        pstCfgMode->pstXdpRegTmp->V0_VSR.bits.vratio = 4096;//default val
    }

    pstCfgMode->pstXdpRegTmp->V0_VOFFSET.bits.vluma_offset     = pstInfoIn->stXdpZmeCfg.s32VLumOffset;
    pstCfgMode->pstXdpRegTmp->V0_VOFFSET.bits.vchroma_offset   = pstInfoIn->stXdpZmeCfg.s32VChmOffset;
    pstCfgMode->pstXdpRegTmp->V0_VBOFFSET.bits.vbluma_offset   = pstInfoIn->stXdpZmeCfg.s32VLumBOffset;
    pstCfgMode->pstXdpRegTmp->V0_VBOFFSET.bits.vbchroma_offset = pstInfoIn->stXdpZmeCfg.s32VChmBOffset;

    pstCfgMode->pstXdpRegTmp->V0_ZME_ORESO.bits.ow = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->V0_ZME_ORESO.bits.oh = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt - 1;

    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_en   = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlEn  ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_mode = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlMode;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_flatdect_mode  = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bFlatdectMode ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_coringadj_en   = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bCoringadjEn  ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_gain           = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Gain       ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_coring         = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Coring     ;

    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_en   = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bShootctrlEn  ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_mode = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bShootctrlMode;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_flatdect_mode  = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bFlatdectMode ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_coringadj_en   = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bCoringadjEn  ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_gain           = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].u32Gain       ;
    pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_coring         = pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].u32Coring     ;

    pstCfgMode->pstXdpRegTmp->VHDLTICTRL.bits.lti_en        = pstInfoIn->stXdpZmeCfg.stLtiCtrl.bLtiEn;
    pstCfgMode->pstXdpRegTmp->VHDLTICTRL.bits.lgain_ratio   = pstInfoIn->stXdpZmeCfg.stLtiCtrl.u32LgainRatio;
    pstCfgMode->pstXdpRegTmp->VHDLTICTRL.bits.lmixing_ratio = pstInfoIn->stXdpZmeCfg.stLtiCtrl.u32LmixingRatio;

    pstCfgMode->pstXdpRegTmp->VHDLTITHD.bits.lcoring_thd  = pstInfoIn->stXdpZmeCfg.stLtiCtrl.u32LcoringThd;
    pstCfgMode->pstXdpRegTmp->VHDLTITHD.bits.lunder_swing = pstInfoIn->stXdpZmeCfg.stLtiCtrl.u32LunderSwing;
    pstCfgMode->pstXdpRegTmp->VHDLTITHD.bits.lover_swing  = pstInfoIn->stXdpZmeCfg.stLtiCtrl.u32LoverSwing;

    if (u32ActiveRange == 0)
    {
        VDP_QF_HAL_SetPARA_ADDR_VHD_CHN00(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN00);
        VDP_QF_HAL_SetPARA_ADDR_VHD_CHN01(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN01);
        VDP_QF_HAL_SetV0_HLOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HLOFFSET);
        VDP_QF_HAL_SetV0_HCOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HCOFFSET);
        VDP_QF_HAL_SetV0_VSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VSP);
        VDP_QF_HAL_SetV0_VOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VOFFSET);
        VDP_QF_HAL_SetV0_VBOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VBOFFSET);
        VDP_QF_HAL_SetV0_ZME_SHOOTCTRL_HL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_HL);
        VDP_QF_HAL_SetV0_ZME_SHOOTCTRL_VL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_ZME_SHOOTCTRL_VL);
        VDP_QF_HAL_SetVHDLTICTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDLTICTRL);
        VDP_QF_HAL_SetVHDLTITHD(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDLTITHD);
        if (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetV0_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HSP);
            VDP_QF_HAL_SetV0_VSR(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VSR);
            VDP_QF_HAL_SetV0_ZME_ORESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_ZME_ORESO);
        }
    }
    else
    {
        VDP_QF_HAL_SetV0_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HSP);
        VDP_QF_HAL_SetV0_VSR(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VSR);
        VDP_QF_HAL_SetV0_ZME_ORESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_ZME_ORESO);
    }

    return;
}

HI_VOID XDP_DRV_SetVid0AccCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    pstCfgMode->pstXdpRegTmp->VHDACCTHD1.bits.acc_en      = (pstInfoIn->stXdpSysCfg.bRWZB == HI_TRUE) ? 0 : pstInfoIn->stXdpAccCfg.bEn;

    if(pstCfgMode->pstXdpRegTmp->VHDACCTHD1.bits.acc_en == 0)
    {
        VDP_QF_HAL_SetVHDACCTHD1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCTHD1);
        return;
    }

    pstCfgMode->pstXdpRegTmp->VHDACCTHD1.bits.acc_mode    = pstInfoIn->stXdpAccCfg.bAccMode;
    pstCfgMode->pstXdpRegTmp->VHDACCTHD1.bits.thd_med_low = pstInfoIn->stXdpAccCfg.u32ThdMedLow;
    pstCfgMode->pstXdpRegTmp->VHDACCTHD1.bits.thd_high    = pstInfoIn->stXdpAccCfg.u32ThdHigh;
    pstCfgMode->pstXdpRegTmp->VHDACCTHD1.bits.thd_low     = pstInfoIn->stXdpAccCfg.u32ThdLow;

    pstCfgMode->pstXdpRegTmp->VHDACCTHD2.bits.ck_gt_en     = 1;
    pstCfgMode->pstXdpRegTmp->VHDACCTHD2.bits.acc_rst      = pstInfoIn->stXdpAccCfg.bAccRst;
    pstCfgMode->pstXdpRegTmp->VHDACCTHD2.bits.thd_med_high = pstInfoIn->stXdpAccCfg.u32ThdMedHigh;

    pstCfgMode->pstXdpRegTmp->VHDACCDEMO.bits.demo_split_point = pstInfoIn->stXdpAccCfg.u32DemoSplitPoint;
    pstCfgMode->pstXdpRegTmp->VHDACCDEMO.bits.demo_mode        = pstInfoIn->stXdpAccCfg.enDemoMode;
    pstCfgMode->pstXdpRegTmp->VHDACCDEMO.bits.demo_en          = pstInfoIn->stXdpAccCfg.bDemoEn;

    pstCfgMode->pstXdpRegTmp->VHDACCLOW1.bits.low_table_data2 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data2;
    pstCfgMode->pstXdpRegTmp->VHDACCLOW1.bits.low_table_data1 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data1;
    pstCfgMode->pstXdpRegTmp->VHDACCLOW1.bits.low_table_data0 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data0;

    pstCfgMode->pstXdpRegTmp->VHDACCLOW2.bits.low_table_data5 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data5;
    pstCfgMode->pstXdpRegTmp->VHDACCLOW2.bits.low_table_data4 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data4;
    pstCfgMode->pstXdpRegTmp->VHDACCLOW2.bits.low_table_data3 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data3;

    pstCfgMode->pstXdpRegTmp->VHDACCLOW3.bits.low_table_data8 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data8;
    pstCfgMode->pstXdpRegTmp->VHDACCLOW3.bits.low_table_data7 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data7;
    pstCfgMode->pstXdpRegTmp->VHDACCLOW3.bits.low_table_data6 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data6;

    pstCfgMode->pstXdpRegTmp->VHDACCMED1.bits.mid_table_data2 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data2;
    pstCfgMode->pstXdpRegTmp->VHDACCMED1.bits.mid_table_data1 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data1;
    pstCfgMode->pstXdpRegTmp->VHDACCMED1.bits.mid_table_data0 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data0;

    pstCfgMode->pstXdpRegTmp->VHDACCMED2.bits.mid_table_data5 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data5;
    pstCfgMode->pstXdpRegTmp->VHDACCMED2.bits.mid_table_data4 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data4;
    pstCfgMode->pstXdpRegTmp->VHDACCMED2.bits.mid_table_data3 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data3;

    pstCfgMode->pstXdpRegTmp->VHDACCMED3.bits.mid_table_data8 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data8;
    pstCfgMode->pstXdpRegTmp->VHDACCMED3.bits.mid_table_data7 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data7;
    pstCfgMode->pstXdpRegTmp->VHDACCMED3.bits.mid_table_data6 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data6;

    pstCfgMode->pstXdpRegTmp->VHDACCHIGH1.bits.high_table_data2 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data2;
    pstCfgMode->pstXdpRegTmp->VHDACCHIGH1.bits.high_table_data1 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data1;
    pstCfgMode->pstXdpRegTmp->VHDACCHIGH1.bits.high_table_data0 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data0;

    pstCfgMode->pstXdpRegTmp->VHDACCHIGH2.bits.high_table_data5 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data5;
    pstCfgMode->pstXdpRegTmp->VHDACCHIGH2.bits.high_table_data4 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data4;
    pstCfgMode->pstXdpRegTmp->VHDACCHIGH2.bits.high_table_data3 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data3;

    pstCfgMode->pstXdpRegTmp->VHDACCHIGH3.bits.high_table_data8 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data8;
    pstCfgMode->pstXdpRegTmp->VHDACCHIGH3.bits.high_table_data7 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data7;
    pstCfgMode->pstXdpRegTmp->VHDACCHIGH3.bits.high_table_data6 = pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data6;

    if (u32ActiveRange == 0)
    {
        VDP_QF_HAL_SetVHDACCTHD1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCTHD1);
        VDP_QF_HAL_SetVHDACCDEMO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCDEMO);
        VDP_QF_HAL_SetVHDACCLOW1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCLOW1);
        VDP_QF_HAL_SetVHDACCLOW2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCLOW2);
        VDP_QF_HAL_SetVHDACCLOW3(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCLOW3);
        VDP_QF_HAL_SetVHDACCMED1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCMED1);
        VDP_QF_HAL_SetVHDACCMED2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCMED2);
        VDP_QF_HAL_SetVHDACCMED3(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCMED3);
        VDP_QF_HAL_SetVHDACCHIGH1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCHIGH1);
        VDP_QF_HAL_SetVHDACCHIGH2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCHIGH2);
        VDP_QF_HAL_SetVHDACCHIGH3(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCHIGH3);
        if (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetVHDACCTHD2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCTHD2);
        }
    }
    else
    {
        VDP_QF_HAL_SetVHDACCTHD2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACCTHD2);
    }

    return;
}

HI_VOID XDP_DRV_SetVid0CscCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_CTRL.bits.hipp_csc_en       = 1;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_CTRL.bits.hipp_csc_ck_gt_en = 1;

    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF00.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef00 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF01.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef01 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF02.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef02 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF10.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef10 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF11.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef11 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF12.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef12 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF20.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef20 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF21.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef21 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF22.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef22 ;

    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_IDC0.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc0 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_IDC1.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc1 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_IDC2.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc2 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_ODC0.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc0;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_ODC1.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc1;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_ODC2.u32 = pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc2;

    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_SCALE.u32 = 10 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MIN_Y.u32 = 0 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MIN_C.u32 = 0 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MAX_Y.u32 = 1023 ;
    pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MAX_C.u32 = 1023 ;

    VDP_QF_HAL_SetV0_HIPP_CSC_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_CTRL);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF00(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF00);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF01(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF01);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF02(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF02);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF10(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF10);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF11(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF11);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF12(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF12);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF20(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF20);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF21(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF21);
    VDP_QF_HAL_SetV0_HIPP_CSC_COEF22(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_COEF22);
    VDP_QF_HAL_SetV0_HIPP_CSC_SCALE(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_SCALE);
    VDP_QF_HAL_SetV0_HIPP_CSC_IDC0(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_IDC0);
    VDP_QF_HAL_SetV0_HIPP_CSC_IDC1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_IDC1);
    VDP_QF_HAL_SetV0_HIPP_CSC_IDC2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_IDC2);
    VDP_QF_HAL_SetV0_HIPP_CSC_ODC0(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_ODC0);
    VDP_QF_HAL_SetV0_HIPP_CSC_ODC1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_ODC1);
    VDP_QF_HAL_SetV0_HIPP_CSC_ODC2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_ODC2);
    VDP_QF_HAL_SetV0_HIPP_CSC_MIN_Y(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MIN_Y);
    VDP_QF_HAL_SetV0_HIPP_CSC_MIN_C(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MIN_C);
    VDP_QF_HAL_SetV0_HIPP_CSC_MAX_Y(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MAX_Y);
    VDP_QF_HAL_SetV0_HIPP_CSC_MAX_C(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_HIPP_CSC_MAX_C);

    return;
}

HI_VOID XDP_DRV_SetVid0AcmCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm0_en = (pstInfoIn->stXdpSysCfg.bRWZB == HI_TRUE) ? 0 : pstInfoIn->stXdpAcmCfg.bAcm0En;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm1_en = (pstInfoIn->stXdpSysCfg.bRWZB == HI_TRUE) ? 0 : pstInfoIn->stXdpAcmCfg.bAcm1En;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm2_en = (pstInfoIn->stXdpSysCfg.bRWZB == HI_TRUE) ? 0 : pstInfoIn->stXdpAcmCfg.bAcm2En;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm3_en = (pstInfoIn->stXdpSysCfg.bRWZB == HI_TRUE) ? 0 : pstInfoIn->stXdpAcmCfg.bAcm3En;

    if((pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm0_en == 0)&&(pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm1_en == 0)&&(pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm2_en == 0)&&(pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm3_en == 0))
    {
        VDP_QF_HAL_SetVHDACM0(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM0);
        return;
    }

    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm_sec_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmSecBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm_fir_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmFirBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm_d_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmDUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm_c_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmCUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm_b_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmBUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM0.bits.acm_a_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmAUoff;

    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.bw_pro_mode = pstInfoIn->stXdpAcmCfg.bBwProMode;
    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.acm_dbg_mode = pstInfoIn->stXdpAcmCfg.enDemoMode;
    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.acm_test_en = pstInfoIn->stXdpAcmCfg.bDemoEn;
    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.acm_d_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmDVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.acm_c_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmCVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.acm_b_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmBVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM1.bits.acm_a_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmAVoff;

    pstCfgMode->pstXdpRegTmp->VHDACM2.bits.acm_sec_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmSecBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM2.bits.acm_fir_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmFirBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM2.bits.acm_d_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmDUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM2.bits.acm_c_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmCUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM2.bits.acm_b_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmBUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM2.bits.acm_a_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmAUoff;

    pstCfgMode->pstXdpRegTmp->VHDACM3.bits.acm_d_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmDVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM3.bits.acm_c_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmCVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM3.bits.acm_b_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmBVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM3.bits.acm_a_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmAVoff;

    pstCfgMode->pstXdpRegTmp->VHDACM4.bits.acm_sec_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmSecBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM4.bits.acm_fir_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmFirBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM4.bits.acm_d_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmDUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM4.bits.acm_c_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmCUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM4.bits.acm_b_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmBUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM4.bits.acm_a_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmAUoff;

    pstCfgMode->pstXdpRegTmp->VHDACM5.bits.acm_d_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmDVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM5.bits.acm_c_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmCVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM5.bits.acm_b_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmBVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM5.bits.acm_a_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmAVoff;

    pstCfgMode->pstXdpRegTmp->VHDACM6.bits.acm_sec_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmSecBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM6.bits.acm_fir_blk = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmFirBlk;
    pstCfgMode->pstXdpRegTmp->VHDACM6.bits.acm_d_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmDUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM6.bits.acm_c_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmCUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM6.bits.acm_b_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmBUoff;
    pstCfgMode->pstXdpRegTmp->VHDACM6.bits.acm_a_u_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmAUoff;

    pstCfgMode->pstXdpRegTmp->VHDACM7.bits.acm_d_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmDVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM7.bits.acm_c_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmCVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM7.bits.acm_b_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmBVoff;
    pstCfgMode->pstXdpRegTmp->VHDACM7.bits.acm_a_v_off = pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmAVoff;

    VDP_QF_HAL_SetVHDACM0(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM0);
    VDP_QF_HAL_SetVHDACM1(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM1);
    VDP_QF_HAL_SetVHDACM2(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM2);
    VDP_QF_HAL_SetVHDACM3(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM3);
    VDP_QF_HAL_SetVHDACM4(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM4);
    VDP_QF_HAL_SetVHDACM5(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM5);
    VDP_QF_HAL_SetVHDACM6(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM6);
    VDP_QF_HAL_SetVHDACM7(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->VHDACM7);

    return;
}

HI_VOID XDP_DRV_SetVid0CropCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    pstCfgMode->pstXdpRegTmp->V0_CCROP.bits.crop_en = 1;

    pstCfgMode->pstXdpRegTmp->V0_FCROP.bits.hfcrop = pstInfoIn->stXdpPositionCfg.stCropRect.u32Y;
    pstCfgMode->pstXdpRegTmp->V0_FCROP.bits.wfcrop = pstInfoIn->stXdpPositionCfg.stCropRect.u32X;

    pstCfgMode->pstXdpRegTmp->V0_LCROP.bits.hlcrop = pstInfoIn->stXdpPositionCfg.stCropRect.u32Y + pstInfoIn->stXdpPositionCfg.stCropRect.u32Hgt - 1;
    pstCfgMode->pstXdpRegTmp->V0_LCROP.bits.wlcrop = pstInfoIn->stXdpPositionCfg.stCropRect.u32X + pstInfoIn->stXdpPositionCfg.stCropRect.u32Wth - 1;

    if (u32ActiveRange == 0) //top and bottom valid
    {
        VDP_QF_HAL_SetV0_CCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_CCROP);
        if (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetV0_FCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_FCROP);
            VDP_QF_HAL_SetV0_LCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_LCROP);
        }
    }
    else //top or bottom valid
    {
        VDP_QF_HAL_SetV0_FCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_FCROP);
        VDP_QF_HAL_SetV0_LCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_LCROP);
    }

    return;
}

HI_VOID XDP_DRV_SetVid0LboxCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    pstCfgMode->pstXdpRegTmp->V0_VFPOS.bits.video_xfpos = pstInfoIn->stXdpPositionCfg.stVideoRect.u32X;
    pstCfgMode->pstXdpRegTmp->V0_VFPOS.bits.video_yfpos = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Y;
    pstCfgMode->pstXdpRegTmp->V0_VLPOS.bits.video_xlpos = pstInfoIn->stXdpPositionCfg.stVideoRect.u32X + pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->V0_VLPOS.bits.video_ylpos = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Y + pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt - 1;

    pstCfgMode->pstXdpRegTmp->V0_DFPOS.bits.disp_xfpos = pstInfoIn->stXdpPositionCfg.stDispRect.u32X;
    pstCfgMode->pstXdpRegTmp->V0_DFPOS.bits.disp_yfpos = pstInfoIn->stXdpPositionCfg.stDispRect.u32Y;
    pstCfgMode->pstXdpRegTmp->V0_DLPOS.bits.disp_xlpos = pstInfoIn->stXdpPositionCfg.stDispRect.u32X + pstInfoIn->stXdpPositionCfg.stDispRect.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->V0_DLPOS.bits.disp_ylpos = pstInfoIn->stXdpPositionCfg.stDispRect.u32Y + pstInfoIn->stXdpPositionCfg.stDispRect.u32Hgt - 1;

    if (u32ActiveRange == 0) //top and bottom valid
    {
        if(pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetV0_VFPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VFPOS);
            VDP_QF_HAL_SetV0_VLPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VLPOS);
            VDP_QF_HAL_SetV0_DFPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_DFPOS);
            VDP_QF_HAL_SetV0_DLPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_DLPOS);
        }
    }
    else //top or bottom valid
    {
        VDP_QF_HAL_SetV0_VFPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VFPOS);
        VDP_QF_HAL_SetV0_VLPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_VLPOS);
        VDP_QF_HAL_SetV0_DFPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_DFPOS);
        VDP_QF_HAL_SetV0_DLPOS         (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_DLPOS);
    }

    return;
}

HI_VOID XDP_DRV_SetVid0MarkTABIpCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S  *pstVpssIpChnCfg, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;
    XDP_ACTIVE_REF_MODE_E   enActiveRefMode;
    HI_BOOL bCfgVal = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;
    enActiveRefMode = (u32ActiveRange == 1) ? pstInfoIn->stXdpNodeInfo.enTopActiveRefMode : pstInfoIn->stXdpNodeInfo.enBottomActiveRefMode;
    bCfgVal = (enActiveRefMode == XDP_ACTIVE_REF_NULL) ? 1 : 0;

    XDP_DRV_SetVid0FdrCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVpssIpCtrlCfg(pstVpssIpPolicy, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetDeiChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetSnrChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetTnrChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetRgmeChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    u32NodeInfo = SET_NODEREG_FLAG(0, bCfgVal, u32ActiveRange, 0, 0);
    XDP_DRV_SetVfFdrCfg(pstInfoIn, pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0ZmeCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0AccCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0CropCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0LboxCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    VDP_DRV_SetWbcDhdLayer(pstInfoIn, pstCfgMode, u32NodeInfo);
    pstCfgMode->pstXdpRegTmp->V0_UPD.bits.regup = 1;
    VDP_QF_HAL_SetV0_UPD               (pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->V0_UPD);

    return;

}

HI_VOID XDP_DRV_SetVid0IpCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S  *pstVpssIpChnCfg, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    XDP_DRV_SetVid0CtrlCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0FdrCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0Vc1Cfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0HZmeCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVpssIpCtrlCfg(pstVpssIpPolicy, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetDeiChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetSnrChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetTnrChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetRgmeChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVpssOutChnCfg(pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVfFdrCfg(pstInfoIn, pstVpssIpPolicy, pstVpssIpChnCfg, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0ZmeCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0AccCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0CscCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0AcmCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0CropCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    XDP_DRV_SetVid0LboxCfg(pstInfoIn, pstCfgMode, u32NodeInfo);
    VDP_DRV_SetWbcDhdLayer(pstInfoIn, pstCfgMode, u32NodeInfo);

    return;
}

HI_VOID XDP_DRV_SetVid0SoftAlgCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, HI_U32 u32FrmCnt, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;
    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    if (pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor == HI_NULL)
    {
        VDP_PRINT("pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor !!!\n");
        return;
    }

    if(u32ActiveRange == 2)
    {
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32DynamicFrameIndex = u32FrmCnt;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bRWZB                = pstInfoIn->stXdpSysCfg.bRWZB;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bFastForward         = pstInfoIn->stXdpNodeInfo.bFastforward;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bFastRefMode         = (pstInfoIn->stXdpNodeInfo.enBottomActiveRefMode == XDP_ACTIVE_REF_HPZME) ? HI_TRUE : HI_FALSE;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bOfflineMode         = (pstInfoIn->stXdpNodeInfo.enOnOffLineMode == XDP_HAL_STATUS_OFFLINE) ? HI_TRUE : HI_FALSE;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bProgressive         = (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE) ? HI_TRUE : HI_FALSE;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32Width             = pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32Height            = pstInfoIn->stXdpHZmeCfg.u32HzmeOutHgt;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32BitWidth          = pstInfoIn->stXdpSrcCfg.enDataWidth;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32FrameRate         = pstInfoIn->stXdpSrcCfg.u32FrameRate;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.s32FieldMode         = HI_DRV_FIELD_BOTTOM;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32FieldOrder        = pstInfoIn->stXdpSrcCfg.u32TopFieldFirst;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bDeiEn               = pstVpssIpPolicy->bDeiEn;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bTnrEn               = pstVpssIpPolicy->bTnrEn;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bMcnrEn              = pstVpssIpPolicy->bMcnrEn;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.bSnrEn               = pstVpssIpPolicy->bSnrEn;

        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32VpssChnAddr       = pstVpssIpPolicy->u32VpssoutStartAddr;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo.u32VpssChnVirtAddr   = pstVpssIpPolicy->u32VpssoutVirtAddr;

        pstCfgMode->pstXdpRegTmp->FPGADEBUG_SOFTALG.bits.softalg_frameinfo_addr = (HI_U32)(&pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stBottomFrameInfo);
    }
    else
    {
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32DynamicFrameIndex = u32FrmCnt;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bRWZB                = pstInfoIn->stXdpSysCfg.bRWZB;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bFastForward         = pstInfoIn->stXdpNodeInfo.bFastforward;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bFastRefMode         = (pstInfoIn->stXdpNodeInfo.enTopActiveRefMode == XDP_ACTIVE_REF_HPZME) ? HI_TRUE : HI_FALSE;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bOfflineMode         = (pstInfoIn->stXdpNodeInfo.enOnOffLineMode == XDP_HAL_STATUS_OFFLINE) ? HI_TRUE : HI_FALSE;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bProgressive         = (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE) ? HI_TRUE : HI_FALSE;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32Width             = pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32Height            = pstInfoIn->stXdpHZmeCfg.u32HzmeOutHgt;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32BitWidth          = pstInfoIn->stXdpSrcCfg.enDataWidth;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32FrameRate         = pstInfoIn->stXdpSrcCfg.u32FrameRate;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.s32FieldMode         = HI_DRV_FIELD_TOP;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32FieldOrder        = pstInfoIn->stXdpSrcCfg.u32TopFieldFirst;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bDeiEn               = pstVpssIpPolicy->bDeiEn;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bTnrEn               = pstVpssIpPolicy->bTnrEn;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bMcnrEn              = pstVpssIpPolicy->bMcnrEn;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.bSnrEn               = pstVpssIpPolicy->bSnrEn;

        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32VpssChnAddr       = pstVpssIpPolicy->u32VpssoutStartAddr;
        pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo.u32VpssChnVirtAddr   = pstVpssIpPolicy->u32VpssoutVirtAddr;

        pstCfgMode->pstXdpRegTmp->FPGADEBUG_SOFTALG.bits.softalg_frameinfo_addr = (HI_U32)(&pstInfoIn->stXdpNodeInfo.pstXdpNodePrivateInfor->stTopFrameInfo);
    }

    //printk("frame addr(%d) %#x \n", u32ActiveRange, pstCfgMode->pstXdpRegTmp->FPGADEBUG_SOFTALG.bits.softalg_frameinfo_addr);

    VDP_QF_HAL_SetFPGADEBUG_SOFTALG(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->FPGADEBUG_SOFTALG);

    return;
}

HW_DYNAMIC_FrameInfor_S * XDP_DRV_GetVid0SoftAlgCfg(HI_VOID)
{
    #if 0
    U_FPGADEBUG_SOFTALG             FPGADEBUG_SOFTALG    ;

    FPGADEBUG_SOFTALG.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->FPGADEBUG_SOFTALG.u32));

    *pu32FrameIndex   = FPGADEBUG_SOFTALG.bits.index;
    *pbFrameInit      = FPGADEBUG_SOFTALG.bits.vpssip_init;
    *pbFastForward    = FPGADEBUG_SOFTALG.bits.fast_forward;

    *pbRwzb           = 0;
    *pbFastRefMode    = FPGADEBUG_SOFTALG.bits.quick_refmode;
    #else
    HW_DYNAMIC_FrameInfor_S *pstHwDynamic = HI_NULL;
    U_FPGADEBUG_SOFTALG             FPGADEBUG_SOFTALG    ;

    FPGADEBUG_SOFTALG.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->FPGADEBUG_SOFTALG.u32));

    //printk("FPGADEBUG_SOFTALG.u32:%#x  RMODE:%#x\n", FPGADEBUG_SOFTALG.u32, pVdpReg->VID_READ_MODE.u32);

    pstHwDynamic = (HW_DYNAMIC_FrameInfor_S *)FPGADEBUG_SOFTALG.u32;

    return pstHwDynamic;

    #endif

}

HI_S32 VDP_DRV_SetVid0Layer(XDP_LAYER_VID_INFO_S *pstLayerInfoIn)
{
    XDP_CFG_MODE_S stCfgMode = {0};
    HI_U32 u32NodeInfo = 0;

    HI_U32 u32BottomFieldFirst = 0;
    HI_U32 u32AddrMode = 0;

    HI_U32 u32FrmCnt = 0;
    HI_U32 u32FrmCntTopTmp = 0;
    HI_U32 u32FrmCntBottomTmp = 0;

    HI_U32 u32TotalBufSize = 0;

    HI_U32 u32VfFdrCropHgtTmp = 0;
    HI_U32 u32VfFdrSrcHgtTmp = 0;
    HI_U32 u32VfFdrCropYTmp = 0;
    HI_U32 u32VfFdrHgtShift = 0;
    HI_U32 u32WbcCropHgtTmp = 0;
    HI_U32 u32WbcCropYTmp = 0;

    XDP_VPSSIP_POLICY_S stVpssIpPolicy;
    XDP_VPSSIP_CHN_CFG_S  stVpssIpChnCfg;

    if (HI_NULL == pstLayerInfoIn)
    {
       VDP_PRINT("pstLayerInfoIn is NULL !!!\n");
       return HI_FAILURE;
    }

    /*mask and apb config*/
    if ((HI_TRUE == pstLayerInfoIn->stXdpNodeInfo.bApbConfig)
        && (HI_TRUE == pstLayerInfoIn->stXdpNodeInfo.bMaskEn))
    {
       #if 0
        if (XDP_HAL_STATUS_ONLINE == pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode)
        {
            XDP_DRV_SetVid0OnlineMaskCfg(pstLayerInfoIn);
        }
        else
        {
            XDP_DRV_SetVid0OfflineMaskCfg(pstLayerInfoIn);
        }
      #endif

        return HI_SUCCESS;
    }
#if 0
    printk("********************** VDP_DRV_SetWbcDhdLayer Begin*********************\n");
    printk("stXdpWbcDhdCfg.bWbcEn                        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.bWbcEn);
    printk("stXdpWbcDhdCfg.enWbcRootPath                 = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.enWbcRootPath);
    printk("stXdpWbcDhdCfg.enWbcModeOut                  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.enWbcModeOut);
    printk("stXdpWbcDhdCfg.stWbcDhdCropCfg.u32X          = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32X);
    printk("stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y          = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y);
    printk("stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth);
    printk("stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.bLboxEn       = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.bLboxEn);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X          = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y          = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutWth     = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutWth);
    printk("stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutHgt     = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutHgt);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn        = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHLumMidEn     = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHLumMidEn);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHChmMidEn     = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHChmMidEn);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHLumFirMode  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHLumFirMode);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHChmFirMode  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHChmFirMode);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HLumOffset  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HLumOffset);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HChmOffset  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HChmOffset);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVLumMidEn     = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVLumMidEn);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVChmMidEn     = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVChmMidEn);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVLumFirMode  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVLumFirMode);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVChmFirMode  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVChmFirMode);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumOffset  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumOffset);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmOffset  = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmOffset);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumBOffset = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumBOffset);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmBOffset = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmBOffset);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HorCoefAddr = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HorCoefAddr);
    printk("stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VerCoefAddr = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VerCoefAddr);
    printk("stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32LumAddr = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32LumAddr);
    printk("stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32ChmAddr = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32ChmAddr);
    printk("stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32LumStr = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32LumStr);
    printk("stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32ChmStr = %d \n",pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCapCfg.stAddr[VDP_ADDR_DATA].u32ChmStr);
    printk("********************** VDP_DRV_SetWbcDhdLayer End  *********************\n");
#endif

    memset(&stVpssIpPolicy,0x0,sizeof(XDP_VPSSIP_POLICY_S));
    memset(&stVpssIpChnCfg,0x0,sizeof(XDP_VPSSIP_CHN_CFG_S));

    if (pstVdpVpssRegTmp == HI_NULL)
    {
        pstVdpVpssRegTmp = kmalloc(sizeof(S_VDP_QF_REGS_TYPE), GFP_ATOMIC);
        memset(pstVdpVpssRegTmp, 0x0, sizeof(S_VDP_QF_REGS_TYPE));
    }

    stCfgMode.pstXdpRegTmp  = pstVdpVpssRegTmp;
    stCfgMode.pstCfgNode    = (S_VDP_QF_REGS_TYPE *)(pstLayerInfoIn->stXdpNodeInfo.pstXdpNodeAddr->pu8StartVirAddr);

    if (pstLayerInfoIn->stXdpNodeInfo.u32Index == 0)
    {
        HI_U32 u32HandleNo = 0;
        HI_VPSS_PQ_INFO_S stTimingInfo = {720, 576, 50, 1};
        HI_S32 s32Ret = 0;
        HI_U32 u32VpssSysStartAddr;

        stTimingInfo.bInterlace = HI_FALSE;
        stTimingInfo.u32FrameRate = 50000;
        stTimingInfo.u32Height = pstLayerInfoIn->stXdpHZmeCfg.u32HzmeOutHgt;
        stTimingInfo.u32Width = pstLayerInfoIn->stXdpHZmeCfg.u32HzmeOutWth;
        s32Ret = DRV_PQ_InitVpssAlgCfg(u32HandleNo, &stTimingInfo, (HI_VOID *)pstLayerInfoIn->stXdpNodeInfo.pstXdpPqBaseAddr->pu8StartVirAddr);

        if (HI_SUCCESS != s32Ret)
        {
            return HI_FAILURE;
        }

        u32VpssSysStartAddr =  pstLayerInfoIn->stXdpNodeInfo.pstXdpPqBaseAddr->u32StartPhyAddr + VDP_REG_SIZE_CALC(VOCTRL, VPSS_CHN_CFG_CTRL);
        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);

        stCfgMode.pstXdpRegTmp->VPSS_REGLOAD_START_ADDR.u32 = u32VpssSysStartAddr;
        VDP_QF_HAL_SetVPSS_Addr(stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->VPSS_REGLOAD_START_ADDR);

        stCfgMode.pstXdpRegTmp->VPSS_REGLOAD_UP.bits.regload_up = 1;
        VDP_QF_HAL_SetVPSSAddr_Update(stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->VPSS_REGLOAD_UP);
    }

    u32BottomFieldFirst = (pstLayerInfoIn->stXdpSrcCfg.u32TopFieldFirst == 1) ? 0 : 1;
    u32AddrMode = ((pstLayerInfoIn->stXdpNodeInfo.bLastFrame == HI_TRUE) && (pstLayerInfoIn->stXdpFdrCfg.enReadMode != VDP_RMODE_PROGRESSIVE)) ? 1 : 0;

    u32FrmCnt = pstLayerInfoIn->stXdpNodeInfo.u32Index;
    u32FrmCntTopTmp = (pstLayerInfoIn->stXdpNodeInfo.bMaskEn == HI_TRUE) ? 0 : ((pstLayerInfoIn->stXdpNodeInfo.u32BottomPlaycnts == 0) ?  (u32FrmCnt * 1) : ((u32BottomFieldFirst == 0) ? (u32FrmCnt * 2) : (u32FrmCnt * 2 + 1)));
    u32FrmCntBottomTmp = (pstLayerInfoIn->stXdpNodeInfo.bMaskEn == HI_TRUE) ? 0 : ((pstLayerInfoIn->stXdpNodeInfo.u32TopPlaycnts == 0) ?  (u32FrmCnt * 1) : ((u32BottomFieldFirst == 1) ? (u32FrmCnt * 2) : (u32FrmCnt * 2 + 1)));

    u32VfFdrCropHgtTmp  = pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt;
    u32VfFdrSrcHgtTmp   = pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt;
    u32VfFdrCropYTmp     = pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Y;
    u32VfFdrHgtShift = (pstLayerInfoIn->stXdpSysCfg.bFieldMatch == HI_TRUE) ? 0 : 1;

    u32WbcCropHgtTmp  = pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt;
    u32WbcCropYTmp     = pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y;

#if 0
    printk("**********************VDP_DRV_SetVid0Layer Begin*********************\n");
    printk("11111 pstLayerInfoIn->stXdpNodeInfo.bMaskEn = %d \n",pstLayerInfoIn->stXdpNodeInfo.bMaskEn);
    printk("pstLayerInfoIn->stXdpFdrCfg.enReadMode = %d \n",pstLayerInfoIn->stXdpFdrCfg.enReadMode);
    printk("pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode = %d \n",pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode);
    printk("11111 pstLayerInfoIn->stXdpNodeInfo.u32Index = %d \n",pstLayerInfoIn->stXdpNodeInfo.u32Index);
    //printk("pstLayerInfoIn->stXdpSysCfg.bRWZB = %d \n",pstLayerInfoIn->stXdpSysCfg.bRWZB);
    //printk("u32FrmCntTopTmp = %d \n",u32FrmCntTopTmp);
    //printk("u32FrmCntBottomTmp = %d \n",u32FrmCntBottomTmp);
    //printk("pstLayerInfoIn->stXdpNodeInfo.bCompactAccess = %d \n",pstLayerInfoIn->stXdpNodeInfo.bCompactAccess);
    //printk("pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Wth = %d \n", pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt);
    //printk("pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32X = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32X);
    //printk("pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Y = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Y);
    //printk("pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Wth = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Hgt);
    //printk("pstLayerInfoIn->stXdpHZmeCfg.u32HzmeOutWth = %d \n", pstLayerInfoIn->stXdpHZmeCfg.u32HzmeOutWth);
    //printk("pstLayerInfoIn->stXdpHZmeCfg.u32HzmeOutHgt = %d \n", pstLayerInfoIn->stXdpHZmeCfg.u32HzmeOutHgt);
    //printk("pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Wth = %d \n", pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt);
    //printk("pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32X = %d \n", pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32X);
    //printk("pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Y = %d \n", pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Y);
    //printk("pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Wth = %d \n", pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32X = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32X);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Y = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Y);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Wth = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32X = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32X);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Y = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Y);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Wth = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Hgt);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32X = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32X);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Y = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Y);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Wth = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Wth);
    //printk("pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Hgt);
    printk("11111 WinQueueFrame: dtv_cfg_addr = %x \n",pstLayerInfoIn->stXdpNodeInfo.pstXdpNodeAddr->u32StartPhyAddr);
    printk("**********************VDP_DRV_SetVid0Layer End*********************\n");
#endif

    if(pstLayerInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
    {
        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);
        XDP_DRV_GetVpssIpPolicy(pstLayerInfoIn, u32FrmCnt, &stVpssIpPolicy);

        if(XDP_HAL_STATUS_OFFLINE == pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode)
        {
            XDP_DRV_GetVpssIpBufSize(&stVpssIpPolicy,&stVpssIpChnCfg,&u32TotalBufSize, HI_NULL);

            stCfgMode.pstXdpRegTmp->V0_UPD.bits.regup = 1;
            VDP_QF_HAL_SetV0_UPD               (stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->V0_UPD);
        }
        else
        {
            stVpssIpPolicy.bDeiEn = HI_FALSE;
            stVpssIpPolicy.bSnrEn = HI_FALSE;
            stVpssIpPolicy.bTnrEn = HI_FALSE;
            stVpssIpPolicy.bRgmeEn = HI_FALSE;
            stVpssIpPolicy.bVpssOutChnEn = HI_FALSE;//在线不使能
            stVpssIpPolicy.bFrmInit = HI_FALSE;//在线时必须是非0值
            stVpssIpPolicy.enRdMode = VDP_RMODE_PROGRESSIVE;//在线时必须是逐行
        }

        XDP_DRV_SetVid0IpCfg(pstLayerInfoIn, &stVpssIpPolicy, &stVpssIpChnCfg, &stCfgMode, u32NodeInfo);
        XDP_DRV_SetVid0SoftAlgCfg(pstLayerInfoIn, &stVpssIpPolicy, u32FrmCnt, &stCfgMode, u32NodeInfo);
    }
    else
    {
        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 1, 0, 0);
        u32FrmCnt = u32FrmCntTopTmp;
        XDP_DRV_GetVpssIpPolicy(pstLayerInfoIn, u32FrmCnt, &stVpssIpPolicy);
        XDP_DRV_GetVpssIpBufSize(&stVpssIpPolicy,&stVpssIpChnCfg,&u32TotalBufSize, HI_NULL);

        pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt = (HI_FALSE == stVpssIpPolicy.bDeiEn) ? (u32VfFdrCropHgtTmp >> u32VfFdrHgtShift) : u32VfFdrCropHgtTmp;
        pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt = (HI_FALSE == stVpssIpPolicy.bDeiEn) ? (u32VfFdrSrcHgtTmp >> u32VfFdrHgtShift) : u32VfFdrSrcHgtTmp;
        pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Y = (HI_FALSE == stVpssIpPolicy.bDeiEn) ? (u32VfFdrCropYTmp >> u32VfFdrHgtShift) : u32VfFdrCropYTmp;
        pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt = ((HI_FALSE == stVpssIpPolicy.bDeiEn) && (pstLayerInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)) ? (u32WbcCropHgtTmp >> u32VfFdrHgtShift) : u32WbcCropHgtTmp;
        pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y = ((HI_FALSE == stVpssIpPolicy.bDeiEn) && (pstLayerInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)) ? (u32WbcCropYTmp >> u32VfFdrHgtShift) : u32WbcCropYTmp;
        XDP_DRV_SetVid0MarkTABIpCfg(pstLayerInfoIn, &stVpssIpPolicy, &stVpssIpChnCfg, &stCfgMode, u32NodeInfo);
        XDP_DRV_SetVid0SoftAlgCfg(pstLayerInfoIn, &stVpssIpPolicy, u32FrmCnt, &stCfgMode, u32NodeInfo);

        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 2, 0, 0);
        u32FrmCnt = u32FrmCntBottomTmp;
        XDP_DRV_GetVpssIpPolicy(pstLayerInfoIn, u32FrmCnt, &stVpssIpPolicy);
        pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt = (HI_FALSE == stVpssIpPolicy.bDeiEn) ? (u32VfFdrCropHgtTmp >> u32VfFdrHgtShift) : u32VfFdrCropHgtTmp;
        pstLayerInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt = (HI_FALSE == stVpssIpPolicy.bDeiEn) ? (u32VfFdrSrcHgtTmp >> u32VfFdrHgtShift) : u32VfFdrSrcHgtTmp;
        pstLayerInfoIn->stXdpVfFdrCfg.stCropRect.u32Y = (HI_FALSE == stVpssIpPolicy.bDeiEn) ? (u32VfFdrCropYTmp >> u32VfFdrHgtShift) : u32VfFdrCropYTmp;
        pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt = ((HI_FALSE == stVpssIpPolicy.bDeiEn) && (pstLayerInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)) ? (u32WbcCropHgtTmp >> u32VfFdrHgtShift) : u32WbcCropHgtTmp;
        pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y = ((HI_FALSE == stVpssIpPolicy.bDeiEn) && (pstLayerInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)) ? (u32WbcCropYTmp >> u32VfFdrHgtShift) : u32WbcCropYTmp;

        XDP_DRV_SetVid0MarkTABIpCfg(pstLayerInfoIn, &stVpssIpPolicy, &stVpssIpChnCfg, &stCfgMode, u32NodeInfo);
        XDP_DRV_SetVid0SoftAlgCfg(pstLayerInfoIn, &stVpssIpPolicy, u32FrmCnt, &stCfgMode, u32NodeInfo);

        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);
        XDP_DRV_SetVid0IpCfg(pstLayerInfoIn, &stVpssIpPolicy, &stVpssIpChnCfg, &stCfgMode, u32NodeInfo);
    }

    //DTV CONFIG FOR OTHER
    u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 1, (1<<QF_MASK_WTUNL));
    stCfgMode.pstXdpRegTmp->VID_WTUNL_CTRL.bits.wtunl_en              = pstLayerInfoIn->stXdpFdrCfg.bWtunlEn;
    stCfgMode.pstXdpRegTmp->VID_WTUNL_CTRL.bits.wtunl_per_line        = 10;
    stCfgMode.pstXdpRegTmp->VID_WTUNL_CTRL.bits.wtunl_partfinish_line = pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Hgt * 2 / 10;
    VDP_QF_HAL_SetVID_WTUNL_CTRL(stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->VID_WTUNL_CTRL);

    u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);
    stCfgMode.pstXdpRegTmp->PARA_UP_VHD.bits.para_up_vhd_chn00 = (pstLayerInfoIn->stXdpZmeCfg.bHzmeEn == HI_TRUE) ? 1 : 0;
    stCfgMode.pstXdpRegTmp->PARA_UP_VHD.bits.para_up_vhd_chn01 = (pstLayerInfoIn->stXdpZmeCfg.bVzmeEn == HI_TRUE) ? 1 : 0;
    stCfgMode.pstXdpRegTmp->PARA_UP_VHD.bits.para_up_vhd_chn02 = (pstLayerInfoIn->stXdpHZmeCfg.bHzmeEn == HI_TRUE) ? 1 : 0;
    stCfgMode.pstXdpRegTmp->PARA_UP_VHD.bits.para_up_vhd_chn07 = (pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn == HI_TRUE) ? 1 : 0;
    stCfgMode.pstXdpRegTmp->PARA_UP_VHD.bits.para_up_vhd_chn08 = (pstLayerInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn == HI_TRUE) ? 1 : 0;
    VDP_QF_HAL_SetPARA_UP_VHD(stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->PARA_UP_VHD);

    if(HI_FALSE == pstLayerInfoIn->stXdpNodeInfo.bMaskEn)
    {
        u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);
        stCfgMode.pstXdpRegTmp->VID_DTV_CFG_READY.bits.mute_clr = 1;
        VDP_QF_HAL_SetVID_DTV_CFG_READY(stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->VID_DTV_CFG_READY);

        stCfgMode.pstXdpRegTmp->OFFLINE_FPGADBG.u32 = (XDP_HAL_STATUS_ONLINE == pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode) ? HI_FALSE : HI_TRUE;
        VDP_QF_HAL_SetVID_STARTMODE(stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->OFFLINE_FPGADBG);

        if(XDP_HAL_STATUS_ONLINE == pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode)
        {
            u32NodeInfo = SET_NODEREG_FLAG(0, 1, 0, 0, 0);
            stCfgMode.pstXdpRegTmp->OFFLINE_UPD.bits.regup = 0;
            VDP_QF_HAL_SetOFFLINE_UPD          (stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->OFFLINE_UPD);
            u32NodeInfo = SET_NODEREG_FLAG(1, 1, 0, 0, 0);
            stCfgMode.pstXdpRegTmp->V0_UPD.bits.regup = 1;
            VDP_QF_HAL_SetV0_UPD               (stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->V0_UPD);
        }
        else
        {
            u32NodeInfo = SET_NODEREG_FLAG(1, 1, 0, 0, 0);
            stCfgMode.pstXdpRegTmp->OFFLINE_UPD.bits.regup = 1;
            VDP_QF_HAL_SetOFFLINE_UPD          (stCfgMode.pstCfgNode, u32NodeInfo, &stCfgMode.pstXdpRegTmp->OFFLINE_UPD);
        }

        VDP_CYCBUF_SetDtvCfgAddr      (0, pstLayerInfoIn->stXdpNodeInfo.pstXdpNodeAddr->u32StartPhyAddr);
        VDP_CYCBUF_SetOnOffMode (0, pstLayerInfoIn->stXdpNodeInfo.enOnOffLineMode);
        VDP_CYCBUF_SetFirstFieldSel   (0, u32BottomFieldFirst);
        VDP_CYCBUF_SetTopDispNum( 0, pstLayerInfoIn->stXdpNodeInfo.u32TopPlaycnts);
        VDP_CYCBUF_SetBtmDispNum( 0, pstLayerInfoIn->stXdpNodeInfo.u32BottomPlaycnts);
        VDP_CYCBUF_SetTopTaskTyp(0, pstLayerInfoIn->stXdpNodeInfo.enTopActiveRefMode);
        VDP_CYCBUF_SetBtmTaskTyp(0, pstLayerInfoIn->stXdpNodeInfo.enBottomActiveRefMode);
        VDP_CYCBUF_SetAddrMode(0, u32AddrMode);//0:Disable,1:Enable;
        VDP_CYCBUF_SetIndex( 0, pstLayerInfoIn->stXdpNodeInfo.u32Index);

        VDP_CYCBUF_SetWriteReady      (0, HI_TRUE);
    }

    return HI_SUCCESS;

}

HI_S32 VDP_DRV_SetVid1Layer(XDP_LAYER_VID_INFO_S *pstLayerInfoIn)
{
    VDP_RECT_S  stRect = {0};
    VDP_BKG_S   stBkg  = {0};
    VDP_VID_DATA_FMT_E         enInFmt ;
    VDP_VID_DATA_TYPE_E    enDataType;
    HI_U32 u32OffsetAddr = 0;
    HI_U32 u32SingleBuf = 0;
    VDP_DATA_RMODE_E eReadMode = 0;

    if (HI_NULL == pstLayerInfoIn)
    {
       VDP_PRINT("pstLayerInfoIn is NULL !!!\n");
       return HI_FAILURE;
    }

#if 0 //single buf, wbc outmode follow interface
    u32SingleBuf = (XDP_WBC_MODE_OUT_PROGRESIVE == pstLayerInfoIn->stXdpWbcDhdCfg.enWbcModeOut) ? 0x0 : 0x1;
    eReadMode = (XDP_WBC_MODE_OUT_PROGRESIVE == pstLayerInfoIn->stXdpWbcDhdCfg.enWbcModeOut) ? VDP_RMODE_INTERFACE : VDP_RMODE_PROGRESSIVE;
#else //single buf, wbc outmode equals to sd timing
    eReadMode = (XDP_WBC_MODE_OUT_PROGRESIVE == pstLayerInfoIn->stXdpWbcDhdCfg.enWbcModeOut) ? VDP_RMODE_INTERFACE : VDP_RMODE_PROGRESSIVE;
    u32SingleBuf = 0;

    if (VDP_RMODE_PROGRESSIVE == eReadMode)
    {
        u32SingleBuf = 1;
    }
#if 0
    if (XDP_WBC_MODE_OUT_PROGRESIVE == pstLayerInfoIn->stXdpWbcDhdCfg.enWbcModeOut)
    {
        eReadMode = VDP_RMODE_PROGRESSIVE;
        u32SingleBuf = 0;
    }
#endif

#endif
#if 0
    printk("**********************VDP_DRV_SetVid1Layer Begin*********************\n");
    printk("stXdpSysCfg.bRegionEn = %d \n", pstLayerInfoIn->stXdpSysCfg.bRegionEn);
    printk("stXdpSrcCfg.enInFmt = %d \n", pstLayerInfoIn->stXdpSrcCfg.enInFmt);
    printk("stXdpFdrCfg.bFlipEn = %d \n", pstLayerInfoIn->stXdpFdrCfg.bFlipEn);
    printk("stXdpSrcCfg.enDataWidth = %d \n", pstLayerInfoIn->stXdpSrcCfg.enDataWidth);
    printk("stXdpSrcCfg.stSrcRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt);
    printk("stXdpSrcCfg.stSrcRect.u32Wth = %d \n", pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Wth);
    printk("stXdpFdrCfg.stCropRect.u32Y = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Y);
    printk("stXdpFdrCfg.stCropRect.u32X = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32X);
    printk("stXdpFdrCfg.stCropRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Hgt);
    printk("stXdpFdrCfg.stCropRect.u32Wth = %d \n", pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Wth);
    printk("stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumAddr = %#x \n", pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumAddr);
    printk("stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmAddr = %#x \n", pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmAddr);
    printk("stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmStr = %d \n", pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmStr);
    printk("stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumStr = %d \n", pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumStr);
    printk("stXdpPositionCfg.stCropRect.u32X = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32X);
    printk("stXdpPositionCfg.stCropRect.u32Y = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Y);
    printk("stXdpPositionCfg.stCropRect.u32Wth = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Wth);
    printk("stXdpPositionCfg.stCropRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Hgt);
    printk("stXdpPositionCfg.stVideoRect.u32X = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32X);
    printk("stXdpPositionCfg.stVideoRect.u32Y = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Y);
    printk("stXdpPositionCfg.stVideoRect.u32Wth = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Wth);
    printk("stXdpPositionCfg.stVideoRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt);
    printk("stXdpPositionCfg.stDispRect.u32X = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32X);
    printk("stXdpPositionCfg.stDispRect.u32Y = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Y);
    printk("stXdpPositionCfg.stDispRect.u32Wth = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Wth);
    printk("stXdpPositionCfg.stDispRect.u32Hgt = %d \n", pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Hgt);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef00 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef00);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef01 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef01);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef02 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef02);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef10 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef10);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef11 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef11);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef12 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef12);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef20 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef20);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef21 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef21);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef22 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscCoef.csc_coef22);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_in_dc0  = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_in_dc0 );
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_in_dc1  = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_in_dc1 );
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_in_dc2  = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_in_dc2 );
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_out_dc0 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_out_dc0);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_out_dc1 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_out_dc1);
    printk("stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_out_dc2 = %d \n", pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V1].stPqCscDc.csc_out_dc2);
    printk("**********************VDP_DRV_SetVid1Layer End*********************\n");
#endif

    if(pstLayerInfoIn->stXdpSysCfg.bRegionEn == HI_FALSE)
    {
        VDP_VID_SetLayerEnable         (VDP_LAYER_VID1, pstLayerInfoIn->stXdpSysCfg.bRegionEn);
        VDP_VID_SetRegUp               (VDP_LAYER_VID1);
        return HI_SUCCESS;
    }

    //v1 ctrl
    VDP_VID_SetLayerEnable         (VDP_LAYER_VID1, pstLayerInfoIn->stXdpSysCfg.bRegionEn);

    //fdr
    enInFmt     = XDP_DATA_FMT_ADPTER(pstLayerInfoIn->stXdpSrcCfg.enInFmt);
    if (enInFmt != VDP_VID_DATA_FMT_LINEAR)
    {
        VDP_PRINT("v1 get wrong data fmt!\n");
        return HI_SUCCESS;
    }

    enDataType  = XDP_DATA_TYPE_ADPTER(pstLayerInfoIn->stXdpSrcCfg.enInFmt);
    VDP_FDR_VID_SetFlipEn          ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpFdrCfg.bFlipEn);
    VDP_FDR_VID_SetLmRmode         ( VDP_LAYER_VID1 * VID_FDR_OFFSET, eReadMode);
    VDP_FDR_VID_SetChmRmode        ( VDP_LAYER_VID1 * VID_FDR_OFFSET, eReadMode);
    VDP_FDR_VID_SetDataWidth       ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpSrcCfg.enDataWidth);
    VDP_FDR_VID_SetDataFmt         ( VDP_LAYER_VID1 * VID_FDR_OFFSET, enInFmt);
    VDP_FDR_VID_SetDataType        ( VDP_LAYER_VID1 * VID_FDR_OFFSET, enDataType);
    VDP_FDR_VID_SetSrcH            ( VDP_LAYER_VID1 * VID_FDR_OFFSET, (pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt>>u32SingleBuf) - 1);
    VDP_FDR_VID_SetSrcW            ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpSrcCfg.stSrcRect.u32Wth - 1);
    VDP_FDR_VID_SetSrcCropY        ( VDP_LAYER_VID1 * VID_FDR_OFFSET, (pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Y>>u32SingleBuf));
    VDP_FDR_VID_SetSrcCropX        ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32X);
    VDP_FDR_VID_SetIresoH          ( VDP_LAYER_VID1 * VID_FDR_OFFSET, (pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Hgt>>u32SingleBuf) - 1);
    VDP_FDR_VID_SetIresoW          ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpFdrCfg.stCropRect.u32Wth - 1);
    VDP_FDR_VID_SetVhdaddrL        ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumAddr);
    VDP_FDR_VID_SetVhdcaddrL       ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmAddr);
    VDP_FDR_VID_SetChmStride       ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32ChmStr);
    VDP_FDR_VID_SetLmStride        ( VDP_LAYER_VID1 * VID_FDR_OFFSET, pstLayerInfoIn->stXdpSrcCfg.stAddr[VDP_ADDR_DATA].u32LumStr);

    //csc
    u32OffsetAddr = VDP_REG_SIZE_CALC(V0_HIPP_CSC_CTRL, WBC_DHD_HIPP_CSC_CTRL);
    VDP_HIPP_CSC_SetHippCscCkGtEn((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 1);
    VDP_HIPP_CSC_SetHippCscEn    ((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 1);
    VDP_HIPP_CSC_SetHippCscCoef00((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef00);
    VDP_HIPP_CSC_SetHippCscCoef01((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef01);
    VDP_HIPP_CSC_SetHippCscCoef02((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef02);
    VDP_HIPP_CSC_SetHippCscCoef10((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef10);
    VDP_HIPP_CSC_SetHippCscCoef11((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef11);
    VDP_HIPP_CSC_SetHippCscCoef12((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef12);
    VDP_HIPP_CSC_SetHippCscCoef20((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef20);
    VDP_HIPP_CSC_SetHippCscCoef21((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef21);
    VDP_HIPP_CSC_SetHippCscCoef22((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscCoef.csc_coef22);
    VDP_HIPP_CSC_SetHippCscIdc0((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_in_dc0 );
    VDP_HIPP_CSC_SetHippCscIdc1((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_in_dc1 );
    VDP_HIPP_CSC_SetHippCscIdc2((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_in_dc2 );
    VDP_HIPP_CSC_SetHippCscOdc0((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_out_dc0);
    VDP_HIPP_CSC_SetHippCscOdc1((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_out_dc1);
    VDP_HIPP_CSC_SetHippCscOdc2((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, pstLayerInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V3].stPqCscDc.csc_out_dc2);
    VDP_HIPP_CSC_SetHippCscScale((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 8);
    VDP_HIPP_CSC_SetHippCscMinY((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 0);
    VDP_HIPP_CSC_SetHippCscMinC((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 0);
    VDP_HIPP_CSC_SetHippCscMaxY((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 255);
    VDP_HIPP_CSC_SetHippCscMaxC((S_VDP_REGS_TYPE *)pVdpReg, u32OffsetAddr, 255);

    //crop
    VDP_VID_SetFCropEn    (VDP_LAYER_VID1, 1);
    stRect.u32X   = pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32X;
    stRect.u32Y   = pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Y>>u32SingleBuf;
    stRect.u32Wth = pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Wth;
    stRect.u32Hgt = pstLayerInfoIn->stXdpPositionCfg.stCropRect.u32Hgt>>u32SingleBuf;
    VDP_VID_SetFCropReso  (VDP_LAYER_VID1, stRect);

    //lbox
    stRect.u32X   = pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32X  ;
    stRect.u32Y   = pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Y>>u32SingleBuf;
    stRect.u32Wth = pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Wth;
    stRect.u32Hgt = pstLayerInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt>>u32SingleBuf;
    VDP_VID_SetVideoPos            (VDP_LAYER_VID1, stRect);
    stRect.u32X   = pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32X  ;
    stRect.u32Y   = pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Y>>u32SingleBuf;
    stRect.u32Wth = pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Wth;
    stRect.u32Hgt = pstLayerInfoIn->stXdpPositionCfg.stDispRect.u32Hgt>>u32SingleBuf;
    VDP_VID_SetDispPos             (VDP_LAYER_VID1, stRect);
    stBkg.u32BkgA = 0xff ;
    stBkg.u32BkgY = 0x40 ;
    stBkg.u32BkgU = 0x200;
    stBkg.u32BkgV = 0x200;
    VDP_VID_SetLayerBkg            (VDP_LAYER_VID1, stBkg);

    //regup
    VDP_VID_SetRegUp               (VDP_LAYER_VID1);

    return HI_SUCCESS;
}

HI_VOID VDP_DRV_SetWbcDhdLayer(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo)
{
    HI_U32 u32ActiveRange = 0;

    u32ActiveRange = (u32NodeInfo & 0x30) >> 4;

    if(pstInfoIn->stXdpWbcDhdCfg.bWbcEn == HI_FALSE)
    {
        return;
    }

    //crop
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_FCROP.bits.hfcrop = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_FCROP.bits.wfcrop = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32X;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LCROP.bits.hlcrop = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y + pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt - 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LCROP.bits.wlcrop = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32X + pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth - 1;

    //hzme+vzme
    pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN07.u32 = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HorCoefAddr;
    pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN08.u32 = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VerCoefAddr;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HINFO.bits.ck_gt_en = 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HINFO.bits.out_width = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hlmsc_en  = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hchmsc_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hlmid_en  = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHLumMidEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hchmid_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHChmMidEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hlfir_en  = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHLumFirMode;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hchfir_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHChmFirMode;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP.bits.hratio = (pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth / 2 * ZME_HPREC) / pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth * 2;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HLOFFSET.bits.hor_loffset = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HLumOffset;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HCOFFSET.bits.hor_coffset = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HChmOffset;

    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VINFO.bits.ck_gt_en = 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VINFO.bits.out_height = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt - 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.vlmsc_en  = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.vchmsc_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.vlmid_en  = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVLumMidEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.vchmid_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVChmMidEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.vlfir_en  = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVLumFirMode;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.vchfir_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVChmFirMode;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.zme_out_fmt = VDP_PROC_WBCFMT_SP_422;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP.bits.zme_in_fmt = ((pstInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)&&((pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_420) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE_64) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE))) ? VDP_PROC_WBCFMT_SP_420 : VDP_PROC_WBCFMT_SP_422;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSR.bits.vratio = (pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt * ZME_VPREC) / pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt;

    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VOFFSET.bits.vluma_offset     = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumOffset;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VOFFSET.bits.vchroma_offset   = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmOffset;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VBOFFSET.bits.vbluma_offset   = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumBOffset;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VBOFFSET.bits.vbchroma_offset = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmBOffset;

    //hcds
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_HCDS.bits.hcds_en   = ((pstInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)&&((pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_422) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_420) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE_64) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE))) ? 0 : 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_HCDS.bits.hchfir_en = 1;

    //lbox
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_CTRL.bits.lbx_en = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.bLboxEn;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_CTRL.bits.lbx_ck_gt_en = 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_ORESO.bits.ow = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutWth - 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_ORESO.bits.oh = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutHgt - 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VFPOS.bits.video_xfpos = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VFPOS.bits.video_yfpos = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VLPOS.bits.video_xlpos = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X + pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth - 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VLPOS.bits.video_ylpos = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y + pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt - 1;
#if 1//cfg in interupt
    //wbc_dhd ctrl
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_CTRL.bits.rgup_mode = 1;
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_CTRL.bits.three_d_mode = 0;// 2;//0:twoeyes,2:lefteye,3:righteye
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_CTRL.bits.mode_out = pstInfoIn->stXdpWbcDhdCfg.enWbcModeOut;//0:interface,1:progress,2:top field,3:bottom field
    pstCfgMode->pstXdpRegTmp->WBC_DHD0_CTRL.bits.root_path = pstInfoIn->stXdpWbcDhdCfg.enWbcRootPath;
#endif
    if (u32ActiveRange == 0) //top and bottom valid
    {
        VDP_QF_HAL_SetWBC_DHD0_LBX_CTRL(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_CTRL);
        VDP_QF_HAL_SetWBC_DHD0_ZME_HLOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HLOFFSET);
        VDP_QF_HAL_SetWBC_DHD0_ZME_HCOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HCOFFSET);
        VDP_QF_HAL_SetWBC_DHD0_VZME_VSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSP);
        VDP_QF_HAL_SetWBC_DHD0_VZME_VOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VOFFSET);
        VDP_QF_HAL_SetWBC_DHD0_VZME_VBOFFSET(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VBOFFSET);
        VDP_QF_HAL_SetPARA_ADDR_VHD_CHN07(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN07);
        VDP_QF_HAL_SetPARA_ADDR_VHD_CHN08(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->PARA_ADDR_VHD_CHN08);
        VDP_QF_HAL_SetWBC_DHD0_HCDS(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_HCDS);
        if (pstInfoIn->stXdpFdrCfg.enReadMode == VDP_RMODE_PROGRESSIVE)
        {
            VDP_QF_HAL_SetWBC_DHD0_LBX_ORESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_ORESO);
            VDP_QF_HAL_SetWBC_DHD0_LBX_VFPOS(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VFPOS);
            VDP_QF_HAL_SetWBC_DHD0_LBX_VLPOS(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VLPOS);
            VDP_QF_HAL_SetWBC_DHD0_FCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_FCROP);
            VDP_QF_HAL_SetWBC_DHD0_LCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LCROP);
            VDP_QF_HAL_SetWBC_DHD0_ZME_HINFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HINFO);
            VDP_QF_HAL_SetWBC_DHD0_ZME_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP);
            VDP_QF_HAL_SetWBC_DHD0_VZME_VINFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VINFO);
            VDP_QF_HAL_SetWBC_DHD0_VZME_VSR(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSR);
        }
    }
    else //top or bottom valid
    {
        VDP_QF_HAL_SetWBC_DHD0_LBX_ORESO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_ORESO);
        VDP_QF_HAL_SetWBC_DHD0_LBX_VFPOS(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VFPOS);
        VDP_QF_HAL_SetWBC_DHD0_LBX_VLPOS(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LBX_VLPOS);
        VDP_QF_HAL_SetWBC_DHD0_FCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_FCROP);
        VDP_QF_HAL_SetWBC_DHD0_LCROP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_LCROP);
        VDP_QF_HAL_SetWBC_DHD0_ZME_HINFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HINFO);
        VDP_QF_HAL_SetWBC_DHD0_ZME_HSP(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_ZME_HSP);
        VDP_QF_HAL_SetWBC_DHD0_VZME_VINFO(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VINFO);
        VDP_QF_HAL_SetWBC_DHD0_VZME_VSR(pstCfgMode->pstCfgNode, u32NodeInfo, &pstCfgMode->pstXdpRegTmp->WBC_DHD0_VZME_VSR);
    }

    return;
}

HI_VOID XDP_DRV_SetVid0OnlineMaskCfg(XDP_LAYER_VID_INFO_S *pstInfoIn)
{
    HI_U32 u32SrcHgt = 0;
    HI_U32 u32SrcWth = 0;
    HI_U32 u32SrcCropY = 0;
    HI_U32 u32SrcCropX = 0;
    HI_U32 u32IresoHgt = 0;
    HI_U32 u32IresoWth = 0;
    HI_U32 u32Hratio = 0;

    //FDR
    VDP_FDR_VID_SetLmDrawMode   (VDP_LAYER_VID0 * VID_FDR_OFFSET, pstInfoIn->stXdpFdrCfg.enDrawMode);
    VDP_FDR_VID_SetChmDrawMode  (VDP_LAYER_VID0 * VID_FDR_OFFSET, pstInfoIn->stXdpFdrCfg.enDrawMode);
    VDP_FDR_VID_SetDrawPixelMode(VDP_LAYER_VID0 * VID_FDR_OFFSET, pstInfoIn->stXdpFdrCfg.enDrawPixelMode);
    VDP_FDR_VID_SetUvOrderEn    (VDP_LAYER_VID0 * VID_FDR_OFFSET, pstInfoIn->stXdpSrcCfg.bUVOrder);
    VDP_FDR_VID_SetDispMode     (VDP_LAYER_VID0 * VID_FDR_OFFSET, pstInfoIn->stXdpDispCfg.enDispMode);

    if(pstInfoIn->stXdpDispCfg.enDispMode == VDP_DISP_MODE_SBS)
    {
        u32SrcHgt   = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt - 1;
        u32SrcWth   = (pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth >> 1) - 1;
        u32SrcCropY = pstInfoIn->stXdpFdrCfg.stCropRect.u32Y;
        u32SrcCropX = (pstInfoIn->stXdpFdrCfg.stCropRect.u32X >> 1);
        u32IresoHgt = pstInfoIn->stXdpFdrCfg.stCropRect.u32Hgt - 1;
        u32IresoWth = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth >> 1) - 1;
    }
    else if((pstInfoIn->stXdpDispCfg.enDispMode == VDP_DISP_MODE_TAB) || (pstInfoIn->stXdpDispCfg.enDispMode == VDP_DISP_MODE_LBL))
    {
        u32SrcHgt   = (pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt >> 1) - 1;
        u32SrcWth   = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth - 1;
        u32SrcCropY = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Y >> 1);
        u32SrcCropX = pstInfoIn->stXdpFdrCfg.stCropRect.u32X;
        u32IresoHgt = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Hgt >> 1) - 1;
        u32IresoWth = pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth - 1;
    }
    else
    {
        u32SrcHgt   = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Hgt - 1;
        u32SrcWth   = pstInfoIn->stXdpSrcCfg.stSrcRect.u32Wth - 1;
        u32SrcCropY = pstInfoIn->stXdpFdrCfg.stCropRect.u32Y;
        u32SrcCropX = pstInfoIn->stXdpFdrCfg.stCropRect.u32X;
        u32IresoHgt = pstInfoIn->stXdpFdrCfg.stCropRect.u32Hgt - 1;
        u32IresoWth = pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth - 1;
    }

    VDP_FDR_VID_SetSrcH         (VDP_LAYER_VID0 * VID_FDR_OFFSET, u32SrcHgt);
    VDP_FDR_VID_SetSrcW         (VDP_LAYER_VID0 * VID_FDR_OFFSET, u32SrcWth);
    VDP_FDR_VID_SetSrcCropY     (VDP_LAYER_VID0 * VID_FDR_OFFSET, u32SrcCropY);
    VDP_FDR_VID_SetSrcCropX     (VDP_LAYER_VID0 * VID_FDR_OFFSET, u32SrcCropX);
    VDP_FDR_VID_SetIresoH       (VDP_LAYER_VID0 * VID_FDR_OFFSET, u32IresoHgt);
    VDP_FDR_VID_SetIresoW       (VDP_LAYER_VID0 * VID_FDR_OFFSET, u32IresoWth);

    VDP_FDR_VID_SetWTunlEn      (VDP_LAYER_VID0 * VID_FDR_OFFSET, pstInfoIn->stXdpFdrCfg.bWtunlEn);

    //HPZME
    VDP_HZME_SetLhfirEn(0, pstInfoIn->stXdpHZmeCfg.bHzmeEn);
    VDP_HZME_SetChfirEn(0, pstInfoIn->stXdpHZmeCfg.bHzmeEn);
    if(pstInfoIn->stXdpHZmeCfg.bHzmeEn == HI_TRUE)
    {
        VDP_HZME_SetOutWidth        (0, pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth - 1);
        u32Hratio = (pstInfoIn->stXdpFdrCfg.stCropRect.u32Wth / 2 * ZME_HPREC) / pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth * 2;
        VDP_HZME_SetHratio          (0, u32Hratio);
        VDP_HZME_SetOutFmt         (0, FMT_ADP(pstInfoIn->stXdpSrcCfg.enInFmt));
        VDP_HZME_SetLhmidEn        (0, pstInfoIn->stXdpHZmeCfg.bHLumMidEn);
        VDP_HZME_SetChmidEn        (0, pstInfoIn->stXdpHZmeCfg.bHChmMidEn);
        VDP_HZME_SetLhfirMode      (0, pstInfoIn->stXdpHZmeCfg.enHLumFirMode);
        VDP_HZME_SetChfirMode      (0, pstInfoIn->stXdpHZmeCfg.enHChmFirMode);
        VDP_HZME_SetLhfirOffset    (0, pstInfoIn->stXdpHZmeCfg.u32LumOffset);
        VDP_HZME_SetChfirOffset    (0, pstInfoIn->stXdpHZmeCfg.u32ChmOffset);
        VDP_HZME_SetHlShootctrlEn  (0, pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlEn  );
        VDP_HZME_SetHlShootctrlMode(0, pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlMode);
        VDP_HZME_SetHlFlatdectMode (0, pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bFlatdectMode );
        VDP_HZME_SetHlCoringadjEn  (0, pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bCoringadjEn  );
        VDP_HZME_SetHlGain         (0, pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Gain       );
        VDP_HZME_SetHlCoring       (0, pstInfoIn->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Coring     );
        VDP_PARA_SetParaAddrVhdChn02( pstInfoIn->stXdpHZmeCfg.u32HorCoefAddr);
        VDP_PARA_SetParaUpVhdChn    ( 2);
    }

    //OTHER IP
    XDP_DRV_SetVid0IpMaskCfg(pstInfoIn);

    return;
}

HI_VOID XDP_DRV_SetVid0OfflineMaskCfg(XDP_LAYER_VID_INFO_S *pstInfoIn)
{
    VDP_DATA_RMODE_E enRmodeTmp;

    //VF FDR
    VDP_FDR_VID_SetLmDrawMode   (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.enDrawMode);
    VDP_FDR_VID_SetChmDrawMode  (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.enDrawMode);
    enRmodeTmp = (pstInfoIn->stXdpSysCfg.bFieldMatch == HI_TRUE) ? ((pstInfoIn->stXdpNodeInfo.u32Index == 0) ? VDP_RMODE_PRO_INTERFACE : VDP_RMODE_INTERFACE) : VDP_RMODE_PROGRESSIVE;//zhangfangni need modify
    VDP_FDR_VID_SetLmRmode      (VDP_LAYER_VF * VID_FDR_OFFSET, enRmodeTmp);
    VDP_FDR_VID_SetChmRmode     (VDP_LAYER_VF * VID_FDR_OFFSET, enRmodeTmp);
    VDP_FDR_VID_SetDrawPixelMode(VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.enDrawPixelMode);
    VDP_FDR_VID_SetUvOrderEn    (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.bUVOrder);
    VDP_FDR_VID_SetSrcW         (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.stSrcRect.u32Wth - 1);
    VDP_FDR_VID_SetSrcH         (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.stSrcRect.u32Hgt - 1);
    VDP_FDR_VID_SetSrcCropY     (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Y);
    VDP_FDR_VID_SetSrcCropX     (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.stCropRect.u32X);
    VDP_FDR_VID_SetIresoH       (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt - 1);
    VDP_FDR_VID_SetIresoW       (VDP_LAYER_VF * VID_FDR_OFFSET, pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Wth - 1);

    //OTHER IP
    XDP_DRV_SetVid0IpMaskCfg(pstInfoIn);

    return;
}

HI_VOID XDP_DRV_SetVid0IpMaskCfg(XDP_LAYER_VID_INFO_S *pstInfoIn)
{
    VDP_RECT_S stRect;
    HI_U32 u32ZmeInResoWth    = 0;
    HI_U32 u32ZmeInResoHgt    = 0;
    HI_U32 u32Ratio = 0;
    VDP_PROC_WBCFMT_E enWbcZmeInFmt;
    HI_BOOL bHcdsEn = HI_FALSE;

    //ZME
    VDP_VID_SetZmeEnable(VDP_LAYER_VID0, VDP_ZME_MODE_HOR, pstInfoIn->stXdpZmeCfg.bHzmeEn);
    if((pstInfoIn->stXdpZmeCfg.bHzmeEn == HI_TRUE) || (pstInfoIn->stXdpZmeCfg.bVzmeEn == HI_TRUE))
    {
        VDP_VID_SetZmeShootCtrlEnable(VDP_LAYER_VID0, VDP_ZME_MODE_HORL,pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlEn,pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlMode);
        VDP_VID_SetZmeShootCtrlPara(VDP_LAYER_VID0, VDP_ZME_MODE_HORL,pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bFlatdectMode,pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bCoringadjEn,pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Gain,pstInfoIn->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Coring);
        VDP_VID_SetZmePhase(VDP_LAYER_VID0, VDP_ZME_MODE_HORL, pstInfoIn->stXdpZmeCfg.s32HLumOffset);
        VDP_VID_SetZmePhase(VDP_LAYER_VID0, VDP_ZME_MODE_HORC, pstInfoIn->stXdpZmeCfg.s32HChmOffset);
        VDP_VID_SetZmeFirEnable(VDP_LAYER_VID0, VDP_ZME_MODE_HORL, pstInfoIn->stXdpZmeCfg.enHLumFirMode);
        VDP_VID_SetZmeFirEnable(VDP_LAYER_VID0, VDP_ZME_MODE_HORC, pstInfoIn->stXdpZmeCfg.enHChmFirMode);
        VDP_VID_SetZmeMidEnable(VDP_LAYER_VID0, VDP_ZME_MODE_HORL, pstInfoIn->stXdpZmeCfg.bHLumMidEn);
        VDP_VID_SetZmeMidEnable(VDP_LAYER_VID0, VDP_ZME_MODE_HORC, pstInfoIn->stXdpZmeCfg.bHChmMidEn);
        u32ZmeInResoWth = (pstInfoIn->stXdpNodeInfo.enOnOffLineMode == XDP_HAL_STATUS_ONLINE) ? pstInfoIn->stXdpHZmeCfg.u32HzmeOutWth : pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Wth;
        u32Ratio = (u32ZmeInResoWth / 2 * ZME_HPREC) / pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth * 2;
        VDP_VID_SetZmeHorRatio      (VDP_LAYER_VID0, u32Ratio);
        u32ZmeInResoHgt = (pstInfoIn->stXdpNodeInfo.enOnOffLineMode == XDP_HAL_STATUS_ONLINE) ? pstInfoIn->stXdpHZmeCfg.u32HzmeOutHgt: pstInfoIn->stXdpVfFdrCfg.stCropRect.u32Hgt;
        u32Ratio = (u32ZmeInResoHgt * ZME_VPREC) / pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt;
        VDP_VID_SetZmeVerRatio      (VDP_LAYER_VID0, u32Ratio);
        stRect.u32X = 0;
        stRect.u32Y = 0;
        stRect.u32Wth = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth;
        stRect.u32Hgt = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt;
        VDP_VID_SetZmeOutReso       (VDP_LAYER_VID0, stRect);
        VDP_PARA_SetParaAddrVhdChn00( pstInfoIn->stXdpZmeCfg.u32HorCoefAddr);
        VDP_PARA_SetParaAddrVhdChn01( pstInfoIn->stXdpZmeCfg.u32VerCoefAddr);
        VDP_PARA_SetParaUpVhdChn    (0);
        VDP_PARA_SetParaUpVhdChn    (1);
    }

    //ACC
    if(pstInfoIn->stXdpAccCfg.bEn == HI_FALSE)
    {
        VDP_XDP_ACC_SetAccEn         ( 0);
    }
    else
    {
        VDP_XDP_ACC_SetAccEn         ( 1);
        VDP_XDP_ACC_SetAccMode       ( pstInfoIn->stXdpAccCfg.bAccMode);
        VDP_XDP_ACC_SetThdMedLow     ( pstInfoIn->stXdpAccCfg.u32ThdMedLow);
        VDP_XDP_ACC_SetThdHigh       ( pstInfoIn->stXdpAccCfg.u32ThdHigh);
        VDP_XDP_ACC_SetThdLow        ( pstInfoIn->stXdpAccCfg.u32ThdLow);
        VDP_XDP_ACC_SetAccRst        ( pstInfoIn->stXdpAccCfg.bAccRst);
        VDP_XDP_ACC_SetThdMedHigh    ( pstInfoIn->stXdpAccCfg.u32ThdMedHigh);
        VDP_XDP_ACC_SetDemoSplitPoint( pstInfoIn->stXdpAccCfg.u32DemoSplitPoint);
        VDP_XDP_ACC_SetDemoMode      ( pstInfoIn->stXdpAccCfg.enDemoMode);
        VDP_XDP_ACC_SetDemoEn        ( pstInfoIn->stXdpAccCfg.bDemoEn);
        VDP_XDP_ACC_SetLowTableData2( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data2);
        VDP_XDP_ACC_SetLowTableData1( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data1);
        VDP_XDP_ACC_SetLowTableData0( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data0);
        VDP_XDP_ACC_SetLowTableData5( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data5);
        VDP_XDP_ACC_SetLowTableData4( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data4);
        VDP_XDP_ACC_SetLowTableData3( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data3);
        VDP_XDP_ACC_SetLowTableData8( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data8);
        VDP_XDP_ACC_SetLowTableData7( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data7);
        VDP_XDP_ACC_SetLowTableData6( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_LOW].u32Data6);
        VDP_XDP_ACC_SetMidTableData2( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data2);
        VDP_XDP_ACC_SetMidTableData1( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data1);
        VDP_XDP_ACC_SetMidTableData0( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data0);
        VDP_XDP_ACC_SetMidTableData5( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data5);
        VDP_XDP_ACC_SetMidTableData4( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data4);
        VDP_XDP_ACC_SetMidTableData3( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data3);
        VDP_XDP_ACC_SetMidTableData8( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data8);
        VDP_XDP_ACC_SetMidTableData7( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data7);
        VDP_XDP_ACC_SetMidTableData6( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_MID].u32Data6);
        VDP_XDP_ACC_SetHighTableData2( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data2);
        VDP_XDP_ACC_SetHighTableData1( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data1);
        VDP_XDP_ACC_SetHighTableData0( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data0);
        VDP_XDP_ACC_SetHighTableData5( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data5);
        VDP_XDP_ACC_SetHighTableData4( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data4);
        VDP_XDP_ACC_SetHighTableData3( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data3);
        VDP_XDP_ACC_SetHighTableData8( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data8);
        VDP_XDP_ACC_SetHighTableData7( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data7);
        VDP_XDP_ACC_SetHighTableData6( pstInfoIn->stXdpAccCfg.stAccTable[XDP_ACC_HIGH].u32Data6);
    }

    //CSC
    VDP_HIPP_CSC_SetHippCscCoef00 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef00);
    VDP_HIPP_CSC_SetHippCscCoef01 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef01);
    VDP_HIPP_CSC_SetHippCscCoef02 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef02);
    VDP_HIPP_CSC_SetHippCscCoef10 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef10);
    VDP_HIPP_CSC_SetHippCscCoef11 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef11 );
    VDP_HIPP_CSC_SetHippCscCoef12 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef12);
    VDP_HIPP_CSC_SetHippCscCoef20 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef20);
    VDP_HIPP_CSC_SetHippCscCoef21 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef21);
    VDP_HIPP_CSC_SetHippCscCoef22 ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscCoef.csc_coef22);
    VDP_HIPP_CSC_SetHippCscIdc0   ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc0);
    VDP_HIPP_CSC_SetHippCscIdc1   ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc1);
    VDP_HIPP_CSC_SetHippCscIdc2   ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_in_dc2);
    VDP_HIPP_CSC_SetHippCscOdc0   ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc0);
    VDP_HIPP_CSC_SetHippCscOdc1   ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc1);
    VDP_HIPP_CSC_SetHippCscOdc2   ((S_VDP_REGS_TYPE *)pVdpReg,  0, pstInfoIn->stXdpCscCfg[HI_PQ_CSC_TUNING_V0].stPqCscDc.csc_out_dc2);

    //ACM
    if((pstInfoIn->stXdpAcmCfg.bAcm0En == HI_FALSE) && (pstInfoIn->stXdpAcmCfg.bAcm1En == HI_FALSE) && (pstInfoIn->stXdpAcmCfg.bAcm2En == HI_FALSE) && (pstInfoIn->stXdpAcmCfg.bAcm3En == HI_FALSE))
    {
        VDP_VID_SetAcmAcm3En     (VDP_LAYER_VID0, 0);
        VDP_VID_SetAcmAcm2En     (VDP_LAYER_VID0, 0);
        VDP_VID_SetAcmAcm1En     (VDP_LAYER_VID0, 0);
        VDP_VID_SetAcmAcm0En     (VDP_LAYER_VID0, 0);
    }
    else
    {
        VDP_VID_SetAcmAcm3En     (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.bAcm3En);
        VDP_VID_SetAcmAcm2En     (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.bAcm2En);
        VDP_VID_SetAcmAcm1En     (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.bAcm1En);
        VDP_VID_SetAcmAcm0En     (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.bAcm0En);
        VDP_VID_SetAcmAcmSecBlk0 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmSecBlk);
        VDP_VID_SetAcmAcmFirBlk0 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmFirBlk);
        VDP_VID_SetAcmAcmDUOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmDUoff);
        VDP_VID_SetAcmAcmCUOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmCUoff);
        VDP_VID_SetAcmAcmBUOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmBUoff);
        VDP_VID_SetAcmAcmAUOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmAUoff);
        VDP_VID_SetAcmAcmTestEn  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.bDemoEn);
        VDP_VID_SetAcmAcmDbgMode (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.enDemoMode);
        VDP_VID_SetAcmAcmProtMode(VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.bBwProMode);
        VDP_VID_SetAcmAcmDVOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmDVoff);
        VDP_VID_SetAcmAcmCVOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmCVoff);
        VDP_VID_SetAcmAcmBVOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmBVoff);
        VDP_VID_SetAcmAcmAVOff0  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA0].u32AcmAVoff);
        VDP_VID_SetAcmAcmSecBlk1 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmSecBlk);
        VDP_VID_SetAcmAcmFirBlk1 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmFirBlk);
        VDP_VID_SetAcmAcmDUOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmDUoff);
        VDP_VID_SetAcmAcmCUOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmCUoff);
        VDP_VID_SetAcmAcmBUOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmBUoff);
        VDP_VID_SetAcmAcmAUOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmAUoff);
        VDP_VID_SetAcmAcmDVOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmDVoff);
        VDP_VID_SetAcmAcmCVOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmCVoff);
        VDP_VID_SetAcmAcmBVOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmBVoff);
        VDP_VID_SetAcmAcmAVOff1  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA1].u32AcmAVoff);
        VDP_VID_SetAcmAcmSecBlk2 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmSecBlk);
        VDP_VID_SetAcmAcmFirBlk2 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmFirBlk);
        VDP_VID_SetAcmAcmDUOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmDUoff);
        VDP_VID_SetAcmAcmCUOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmCUoff);
        VDP_VID_SetAcmAcmBUOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmBUoff);
        VDP_VID_SetAcmAcmAUOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmAUoff);
        VDP_VID_SetAcmAcmDVOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmDVoff);
        VDP_VID_SetAcmAcmCVOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmCVoff);
        VDP_VID_SetAcmAcmBVOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmBVoff);
        VDP_VID_SetAcmAcmAVOff2  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA2].u32AcmAVoff);
        VDP_VID_SetAcmAcmSecBlk3 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmSecBlk);
        VDP_VID_SetAcmAcmFirBlk3 (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmFirBlk);
        VDP_VID_SetAcmAcmDUOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmDUoff);
        VDP_VID_SetAcmAcmCUOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmCUoff);
        VDP_VID_SetAcmAcmBUOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmBUoff);
        VDP_VID_SetAcmAcmAUOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmAUoff);
        VDP_VID_SetAcmAcmDVOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmDVoff);
        VDP_VID_SetAcmAcmCVOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmCVoff);
        VDP_VID_SetAcmAcmBVOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmBVoff);
        VDP_VID_SetAcmAcmAVOff3  (VDP_LAYER_VID0, pstInfoIn->stXdpAcmCfg.stAcmPara[XDP_ACM_PARA3].u32AcmAVoff);
    }

    //CROP+LBOX
    stRect.u32X = pstInfoIn->stXdpPositionCfg.stCropRect.u32X;
    stRect.u32Y = pstInfoIn->stXdpPositionCfg.stCropRect.u32Y;
    stRect.u32Wth = pstInfoIn->stXdpPositionCfg.stCropRect.u32Wth;
    stRect.u32Hgt = pstInfoIn->stXdpPositionCfg.stCropRect.u32Hgt;
    VDP_VID_SetFCropReso    (VDP_LAYER_VID0, stRect);
    stRect.u32X = pstInfoIn->stXdpPositionCfg.stDispRect.u32X;
    stRect.u32Y = pstInfoIn->stXdpPositionCfg.stDispRect.u32Y;
    stRect.u32Wth = pstInfoIn->stXdpPositionCfg.stDispRect.u32Wth;
    stRect.u32Hgt = pstInfoIn->stXdpPositionCfg.stDispRect.u32Hgt;
    VDP_VID_SetDispPos      (VDP_LAYER_VID0, stRect);
    stRect.u32X = pstInfoIn->stXdpPositionCfg.stVideoRect.u32X;
    stRect.u32Y = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Y;
    stRect.u32Wth = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Wth;
    stRect.u32Hgt = pstInfoIn->stXdpPositionCfg.stVideoRect.u32Hgt;
    VDP_VID_SetVideoPos     (VDP_LAYER_VID0, stRect);
    VDP_VID_SetLayerGalpha  (VDP_LAYER_VID0, pstInfoIn->stXdpSysCfg.u32AllAlpha);

    if(pstInfoIn->stXdpWbcDhdCfg.bWbcEn == HI_TRUE)
    {
        //WBC_DHD CTRL
        VDP_WBC_SetWbcPoint     (VDP_LAYER_WBC_HD0, pstInfoIn->stXdpWbcDhdCfg.enWbcRootPath);

        //WBC_DHD CROP
        stRect.u32X = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32X;
        stRect.u32Y = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y;
        stRect.u32Wth = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth;
        stRect.u32Hgt = pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt;
        VDP_WBC_SetCropPos      (VDP_LAYER_WBC_HD0, stRect);

        //WBC_DHD ZME
        VDP_WBC_HZME_SetOutWidth    (pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth - 1);
        VDP_WBC_VZME_SetOutHeight   (pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt - 1);
        u32Ratio = (pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth / 2 * ZME_HPREC) / pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth * 2;
        VDP_WBC_HZME_SetHratio      (u32Ratio);
        u32Ratio = (pstInfoIn->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt * ZME_VPREC) / pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt;
        VDP_WBC_VZME_SetVratio      (u32Ratio);
        enWbcZmeInFmt = ((pstInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)&&((pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_420) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE_64) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE))) ? VDP_PROC_WBCFMT_SP_420 : VDP_PROC_WBCFMT_SP_422;
        VDP_WBC_VZME_SetZmeInFmt    (enWbcZmeInFmt);
        VDP_PARA_SetParaAddrVhdChn07( pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HorCoefAddr);
        VDP_PARA_SetParaAddrVhdChn08( pstInfoIn->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VerCoefAddr);
        VDP_PARA_SetParaUpVhdChn    (7);
        VDP_PARA_SetParaUpVhdChn    (8);

        //WBC_DHD CSC
        VDP_LINK_SetCscLink         (1);//zhangfangni need modify

        //WBC_DHD CDS
        bHcdsEn = ((pstInfoIn->stXdpWbcDhdCfg.enWbcRootPath == XDP_WBC_ROOT_PATH_BZME)&&((pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_422) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_420) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE_64) || (pstInfoIn->stXdpSrcCfg.enInFmt == VDP_VID_IFMT_SP_TILE))) ? HI_FALSE : HI_TRUE;
        VDP_WBC_SetCdsEnable(VDP_LAYER_WBC_HD0, bHcdsEn);

        //WBC_DHD LBOX
        VDP_WBC_LBOX_SetLbxEn     (VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.bLboxEn);
        VDP_WBC_LBOX_SetOw        (VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutWth);
        VDP_WBC_LBOX_SetOh        (VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutHgt);
        VDP_WBC_LBOX_SetVideoYfpos(VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y);
        VDP_WBC_LBOX_SetVideoXfpos(VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X);
        VDP_WBC_LBOX_SetVideoYlpos(VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y + pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt - 1);
        VDP_WBC_LBOX_SetVideoXlpos(VDP_LAYER_WBC_HD0 * WBC_OFFSET, pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X + pstInfoIn->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth - 1);

        //WBC_DHD REGUP
        VDP_WBC_SetRegUp(VDP_LAYER_WBC_HD0);
    }

    //REGUP
    VDP_VID_SetRegUp(VDP_LAYER_VID0);

    return;
}

HI_VOID XDP_DRV_SetVid0OfflineChnDisable(HI_VOID)
{
    HI_U32  u32RealOffset = 0;

    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_P1] - VPSS_RCHN_IMG_START_OFFSET);
    VPSS_RCHN_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_P2] - VPSS_RCHN_IMG_START_OFFSET);
    VPSS_RCHN_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_P3] - VPSS_RCHN_IMG_START_OFFSET);
    VPSS_RCHN_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);

    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_DI_RST] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_DM_CNT] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_NR_RMAD] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_SNR_RMAD] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_RPRJH] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_RPRJV] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_P2RGMV] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssRchnAddr[VPSS_MAC_RCHN_P1RGMV] - VPSS_RCHN_SOLO_START_OFFSET);
    VPSS_RCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);

    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_NR_RFR] - VPSS_WCHN_IMG_START_OFFSET);
    VPSS_WCHN_SetEn ((S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_VPSS_OUT] - VPSS_WCHN_IMG_START_OFFSET);
    VPSS_WCHN_SetEn ((S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);

    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_DI_WST] - VPSS_WCHN_SOLO_START_OFFSET);
    VPSS_WCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_DM_CNT] - VPSS_WCHN_SOLO_START_OFFSET);
    VPSS_WCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_NR_WMAD] - VPSS_WCHN_SOLO_START_OFFSET);
    VPSS_WCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_WPRJH] - VPSS_WCHN_SOLO_START_OFFSET);
    VPSS_WCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_WPRJV] - VPSS_WCHN_SOLO_START_OFFSET);
    VPSS_WCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);
    u32RealOffset = (gu32VpssWchnAddr[VPSS_MAC_WCHN_CFRGMV] - VPSS_WCHN_SOLO_START_OFFSET);
    VPSS_WCHN_SOLO_SetEn ( (S_VDP_REGS_TYPE *)pVdpReg, u32RealOffset, 0);

    VDP_OFF_SetRegup( (S_VDP_REGS_TYPE *)pVdpReg, 1);

    return;
}


#endif

#ifdef HI_FPGA_SUPPORT
HI_VOID VDP_DRV_Set_SysEslSmmu(HI_VOID)
{
    HI_U32  u32Offset           = 0;
    HI_U32  u32LayerId          = 0;
    HI_BOOL bChkSumEn           = HI_TRUE ;
    HI_BOOL bPreRdEn            = HI_TRUE ;
    VDP_REQ_LENGTH_E enReqLen   = VDP_REQ_LENGTH_16      ;
    VDP_REQ_CTRL_E   enReqCtrl  = VDP_REQ_CTRL_16BURST_2 ;

    HI_BOOL bMidEn = HI_TRUE;
    HI_BOOL bArbEn = HI_TRUE;
    HI_U32 Routstanding = 15;
    HI_U32 Woutstanding = 2;
    VDP_AXI_EDGE_MODE_E enSplitMode = VDP_AXI_EDGE_MODE_256;

    /*set vid els register*/
    for (u32LayerId = VDP_LAYER_VID0; u32LayerId <= VDP_LAYER_VID1; u32LayerId++)
    {
        u32Offset = u32LayerId * VID_FDR_OFFSET;
        VDP_FDR_VID_SetChecksumEn     (u32Offset, bChkSumEn);
        VDP_FDR_VID_SetPreRdEn        (u32Offset, bPreRdEn );
        VDP_FDR_VID_SetReqLen         (u32Offset, enReqLen );
        VDP_FDR_VID_SetReqCtrl        (u32Offset, enReqCtrl);

        VDP_SetParaUpMode(u32LayerId, 1);
    }

    /*set gfx els register*/
    bChkSumEn   = HI_TRUE                ;
    enReqLen    = VDP_REQ_LENGTH_16      ;
    enReqCtrl   = VDP_REQ_CTRL_16BURST_1 ;

    for (u32LayerId = VDP_LAYER_GFX0; u32LayerId <= VDP_LAYER_GFX1; u32LayerId++)
    {
        u32Offset = u32LayerId * VID_FDR_OFFSET;
        VDP_FDR_GFX_SetReqLen         (u32Offset, enReqLen );
        VDP_FDR_GFX_SetReqCtrl        (u32Offset, enReqCtrl);
        VDP_FDR_GFX_SetChecksumEn     (u32Offset, bChkSumEn);
        VDP_GFX_SetUpdMode(u32LayerId, 1);
    }

    /*set wbc els register*/
    bChkSumEn   = HI_TRUE                ;
    enReqLen    = VDP_REQ_CTRL_16BURST_1 ;

    /*set master register*/
    VDP_MASTER_SetMidEnable         (bMidEn      );
    VDP_MASTER_SetArbMode           (bArbEn      );
    VDP_MASTER_SetSplitMode         (enSplitMode );
    VDP_MASTER_SetMstr0Routstanding (Routstanding);
    VDP_MASTER_SetMstr0Woutstanding (Woutstanding);
    /*set rch2_prio 0x8010 = 0x4*/
    VDP_MASTER_SetRchnPrio(2, 1);

    VDP_GP_SetUpdMode(VDP_LAYER_GP0, 1);

}
#else

HI_VOID VDP_DRV_Set_SysEslSmmu(HI_VOID)
{
    HI_U32  u32Offset           = 0;
    HI_U32  u32LayerId          = 0;
    HI_BOOL bChkSumEn           = HI_TRUE ;

    /*set vid els register*/
    for (u32LayerId = VDP_LAYER_VID0; u32LayerId <= VDP_LAYER_VID1; u32LayerId++)
    {
        u32Offset = u32LayerId * VID_FDR_OFFSET;
        VDP_FDR_VID_SetChecksumEn     (u32Offset, bChkSumEn);
        VDP_FDR_VID_SetPreRdEn        (u32Offset, XDP_VID_MAC_CTRL_PRE_READ_ENABLE_STATUS );
        VDP_FDR_VID_SetReqLen         (u32Offset, VDP_REQ_LENGTH_16 );
        VDP_SetParaUpMode(u32LayerId, 1);
    }


    VDP_FDR_VF_SetPreRdEn(0, XDP_VID_MAC_CTRL_PRE_READ_ENABLE_STATUS);
    VDP_FDR_VF_SetReqLen(0, VDP_REQ_LENGTH_16);
    VDP_FDR_VF_SetReqCtrl(0, VDP_REQ_CTRL_16BURST_1);

    u32Offset=VDP_REG_SIZE_CALC(VID_READ_CTRL, V1_VID_READ_CTRL);
    VDP_FDR_VID_SetReqCtrl        (u32Offset, VDP_REQ_CTRL_16BURST_2);

    /*set gfx els register*/
    bChkSumEn   = HI_TRUE                ;

    for (u32LayerId = VDP_LAYER_GFX0; u32LayerId <= VDP_LAYER_GFX1; u32LayerId++)
    {
        u32Offset = u32LayerId * VID_FDR_OFFSET;
        VDP_FDR_GFX_SetReqLen         (u32Offset, VDP_REQ_LENGTH_16);
        VDP_FDR_GFX_SetChecksumEn     (u32Offset, bChkSumEn);
        VDP_GFX_SetUpdMode(u32LayerId, 1);
    }

    /*set wbc els register*/
    bChkSumEn   = HI_TRUE                ;

    VDP_MASTER_SetArbMode           (XDP_VDP_MST_CTRL_ARBMODE);
    /*set rch2_prio 0x8010 = 0x4*/
    VDP_MASTER_SetRchnPrio(2, 1);

    VDP_GP_SetUpdMode(VDP_LAYER_GP0, 1);

}
#endif
