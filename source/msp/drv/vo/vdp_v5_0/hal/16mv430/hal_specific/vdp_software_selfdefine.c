#ifdef HI_DISP_BUILD_FULL
#include <linux/kernel.h>
#endif

#include "hi_reg_common.h"
#include "hi_register_vdp.h"
#include "vdp_define.h"
#include "drv_disp_com.h"
#include "vdp_drv_vid.h"

#include "vdp_hal_comm.h"

#include "hal_specific_rwzb.h"
#include "hal_reg_cfg_manager.h"

#include "vdp_drv_comm.h"
#include "vdp_hal_intf.h"
#include "vdp_hal_wbc.h"
#include "vdp_ip_define.h"
#include "vdp_hal_ip_fdr.h"
#include "vpss_hal_sysctrl.h"
#include "vdp_hal_offline.h"
#include "vdp_hal_ip_cycbuf.h"
#include "vdp_hal_ip_cap.h"
#include "vdp_hal_ip_master.h"
#include "vdp_hal_ip_wd_lbox.h"
#ifndef __DISP_PLATFORM_BOOT__
#include "drv_mask.h"
#endif


extern VPSS_REGCFG_ADDR_S gstVpssRegCfgAddr;
MMZ_BUFFER_S  gstVdpRegMem[2];
#define DHD_YUV_TO_HDMI 0
#define MEMCOPY_VDP(a,b,c)  do {\
        HI_ULONG uLongRegaddrDest = 0;\
        HI_ULONG uLongstRegaddrSrc = 0;\
        \
        uLongRegaddrDest = (HI_ULONG)(a);\
        uLongstRegaddrSrc = (HI_ULONG)(b);\
        \
        memcpy((HI_U32*)uLongRegaddrDest, (HI_U32*)uLongstRegaddrSrc, c);\
    }while(0)


extern  volatile S_VDP_REGS_TYPE *pVdpReg;

static  HI_VOID Local_SyncRegisterOperation(HI_VOID)
{
#ifndef __DISP_PLATFORM_BOOT__
    mb();
#endif

    DISP_UDELAY(10);

    return;
}

HI_BOOL VDP_CheckResetFinished(HI_VOID)
{
    U_VDPVERSION1 VDPVERSION1;
    U_VDPVERSION2 VDPVERSION2;

    VDPVERSION1.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VDPVERSION1.u32));
    VDPVERSION2.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VDPVERSION2.u32));

    return !((VDPVERSION1.u32 != 0x00000000) || (VDPVERSION2.u32 != 0x00000000));
}

#ifndef __DISP_PLATFORM_BOOT__

HI_VOID  VDP_VID_GetInReso      (HI_U32 u32Data, HI_RECT_S *pstRect)
{
    return ;
}

HI_VOID VDP_VID_GetInDataFmt (HI_U32 u32Data, HI_DRV_PIX_FORMAT_E *penDataFmt)
{
    U_V0_CTRL V0_CTRL;

    if (u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_CTRL.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET));

    switch (0 /*V0_CTRL.bits.ifmt*/)
    {
        case 3:
            *penDataFmt = HI_DRV_PIX_FMT_NV21;
            break;
        case 4:
            *penDataFmt = HI_DRV_PIX_FMT_NV61;
            break;
        default:
            HI_ERR_DISP("unsupported pixel fmt!\n");
            return ;
    }

    return ;
}


HI_VOID VDP_VID_GetLayerEnableFlag (HI_U32 u32Data, HI_BOOL *pbVideoLogoMode)
{
    U_V0_CTRL V0_CTRL;

    if (u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_CTRL.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET));

    *pbVideoLogoMode = V0_CTRL.bits.surface_en;

    return ;
}


HI_VOID  VDP_VID_GetLayerAddrAndStride  (HI_U32 u32Data,
        HI_U32 *pu32LAddr,
        HI_U32 *pu32CAddr,
        HI_U32 *pu32LStr,
        HI_U32 *pu32CStr)
{
    return ;
}

#endif
HI_VOID  VDP_DRIVER_SetVirtualAddr(S_VDP_REGS_TYPE *pstVdpReg)
{
    pVdpReg = (S_VDP_REGS_TYPE *)pstVdpReg;
}


HI_VOID VDP_SetVdacVbgEnable(HI_BOOL bEnable)
{
    U_VO_DAC_CTRL0 VO_DAC_CTRL0;

    VO_DAC_CTRL0.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VO_DAC_CTRL0.u32));

    if (bEnable != VO_DAC_CTRL0.bits.envbg)
    {
        VO_DAC_CTRL0.bits.envbg = (HI_TRUE == bEnable) ? 1 : 0;
        VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_DAC_CTRL0.u32)), VO_DAC_CTRL0.u32);
    }

    return;
}

HI_VOID VDP_VDAC_GetEnable(HI_U32 uVdac, HI_U32 *penable)
{
    return;
}

HI_VOID VDP_VDAC_SetEnable(HI_U32 uVdac, HI_U32 enable, HI_U32 u32DelayMs)
{
    U_VO_DAC_C_CTRL VO_DAC_C_CTRL;
    U_VO_DAC_R_CTRL VO_DAC_R_CTRL;
    U_VO_DAC_G_CTRL VO_DAC_G_CTRL;
    U_VO_DAC_B_CTRL VO_DAC_B_CTRL;

    switch (uVdac)
    {
        case 0:
            VO_DAC_R_CTRL.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VO_DAC_R_CTRL.u32));
            VO_DAC_R_CTRL.bits.dac_en = enable;
            VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_DAC_R_CTRL.u32)), VO_DAC_R_CTRL.u32);
            break;
        case 1:
            VO_DAC_G_CTRL.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VO_DAC_G_CTRL.u32));
            VO_DAC_G_CTRL.bits.dac_en = enable;
            VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_DAC_G_CTRL.u32)), VO_DAC_G_CTRL.u32);
            break;
        case 2:
            VO_DAC_B_CTRL.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VO_DAC_B_CTRL.u32));
            VO_DAC_B_CTRL.bits.dac_en = enable;
            VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_DAC_B_CTRL.u32)), VO_DAC_B_CTRL.u32);
            break;
        case 3:
            VO_DAC_C_CTRL.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VO_DAC_C_CTRL.u32));
            VO_DAC_C_CTRL.bits.dac_en = enable;
            VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_DAC_C_CTRL.u32)), VO_DAC_C_CTRL.u32);
            break;
        default:
            HI_ERR_DISP("Invalid vdac:%d\n", uVdac);
            break;

    }

    return;
}

HI_VOID VDP_VDAC_ResetFmt(DISP_VENC_E enVenc , HI_U32 uVdac, HI_DRV_DISP_FMT_E enFmt, HI_U32 u32CustomPixClk)
{
    // set vdac crg reset state
    VDP_Set_VDAC_GAIN(uVdac);

    return;
}

HI_VOID VDP_VDAC_SetClockEnable(HI_U32 uVdac, HI_U32 enable)
{

    U_PERI_CRG54 PERI_CRG54Tmp;

    PERI_CRG54Tmp.u32 = g_pstRegCrg->PERI_CRG54.u32;
    switch (uVdac)
    {
        case 0:
            PERI_CRG54Tmp.bits.vdac_ch0_cken = (enable == HI_TRUE) ? 1 : 0;
            break;

        default:
            break;
    }

    g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;


    return;
}

HI_VOID VDP_VDAC_Ctrl(HI_BOOL bEnable)
{
    U_VO_DAC_CTRL0   VO_DAC_CTRL0;

    VO_DAC_CTRL0.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VO_DAC_CTRL0.u32));

    if (bEnable)
    {
        VO_DAC_CTRL0.bits.enctr = HI_FALSE;
        VO_DAC_CTRL0.bits.enextref = HI_FALSE;
        VO_DAC_CTRL0.bits.pdchopper = HI_FALSE;
        VO_DAC_CTRL0.bits.envbg = HI_TRUE;
    }
    else
    {
        VO_DAC_CTRL0.bits.enctr = HI_FALSE;
        VO_DAC_CTRL0.bits.enextref = HI_FALSE;
        VO_DAC_CTRL0.bits.pdchopper = HI_TRUE;
        VO_DAC_CTRL0.bits.envbg = HI_FALSE;
    }

    VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_DAC_CTRL0.u32)), VO_DAC_CTRL0.u32);
    VDP_VDAC_SetCvbsAndYpbprDriveMode();

    return;
}

HI_VOID VDP_VDAC_Reset(HI_VOID)
{

    VDP_VDAC_Ctrl(HI_FALSE);
    DISP_MSLEEP(1);

    VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_MUX_DAC.u32)), 0);
    DISP_WARN("=========VDAC_DRIVER_Initial====\n");

    return;
}

HI_VOID VDP_DHD_DEFAULT(HI_VOID)
{
    volatile U_DHD0_CTRL DHD0_CTRL;
    DHD0_CTRL.u32 = VDP_CHIP_CFG_DHD0_CTRL_DEFAULT;

    VDP_RegWrite(((HI_ULONG) & (pVdpReg->DHD0_CTRL.u32)), DHD0_CTRL.u32);
}

HI_VOID VDP_DSD_DEFAULT(HI_VOID)
{
    volatile U_DHD0_CTRL DHD0_CTRL;
    volatile U_VO_MUX VO_MUX;

    DHD0_CTRL.u32 = VDP_CHIP_CFG_DSD_CTRL_DEFAULT;
    VO_MUX.u32 = 0x1;

    VDP_RegWrite(((HI_ULONG) & (pVdpReg->DHD0_CTRL.u32) + 1 * CHN_OFFSET), DHD0_CTRL.u32);
    VDP_RegWrite(((HI_ULONG) & (pVdpReg->VO_MUX.u32)), VO_MUX.u32);
}

HI_VOID VDP_DHD_Reset(HI_U32 u32hd_id)
{
    U_DHD0_CTRL DHD0_CTRL;

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->DHD0_CTRL.u32) + u32hd_id * CHN_OFFSET));
    DHD0_CTRL.bits.intf_en = 0;
    DHD0_CTRL.bits.cbar_en = 0;
    DHD0_CTRL.bits.fpga_lmt_en = 0;
    DHD0_CTRL.bits.hdmi_mode = DHD_YUV_TO_HDMI;
    DHD0_CTRL.bits.gmm_en = 0;
    DHD0_CTRL.bits.disp_mode = 0;
    DHD0_CTRL.bits.regup = 1;
    VDP_RegWrite(((HI_ULONG) & (pVdpReg->DHD0_CTRL.u32) + u32hd_id * CHN_OFFSET), DHD0_CTRL.u32);
}

HI_U32 VDP_DHD_GetDispMode(HI_U32 u32Data)
{
    U_DHD0_CTRL DHD0_CTRL;
    DHD0_CTRL.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->DHD0_CTRL.u32));

    return DHD0_CTRL.bits.iop;
}

HI_VOID  VDP_DHD1_CBM_MIX_Init(HI_VOID)
{
#ifdef VDP_CHIP_CFG_CBM_MIX_2
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX1, VDP_CBM_VID3, 0);
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX1, VDP_CBM_GP1, 1);
#endif
    VDP_DISP_SetRegUp(1);

    return;
}

HI_VOID  VDP_DHD1_CBM_MIX_DeInit(HI_VOID)
{
#ifdef VDP_CHIP_CFG_CBM_MIX_2
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX1, VDP_CBM_VID3, 0);
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX1, VDP_CBM_GP1, 1);
#endif
    VDP_DISP_SetRegUp(1);

    return;
}

HI_VOID VDP_DISP_GetIntMask (HI_U32 *pu32masktype)
{
    /* Dispaly interrupt mask enable */
    *pu32masktype = VDP_RegRead((HI_ULONG) & (pVdpReg->VOINTMSK.u32));

    return ;
}

HI_VOID VDP_DISP_GetIntfEnable(HI_U32 u32hd_id, HI_U32 *pbTrue)
{
    U_DHD0_CTRL DHD0_CTRL;
    if (u32hd_id >= CHN_MAX)
    {
        HI_ERR_DISP("Select Wrong CHANNEL ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->DHD0_CTRL.u32) + u32hd_id * CHN_OFFSET));
    *pbTrue = DHD0_CTRL.bits.intf_en;
}

HI_VOID VDP_FDR_VF_SetPreRdEn(HI_U32 offset, HI_BOOL bPreRdEnble)
{
    U_VF_VID_MAC_CTRL VF_VID_MAC_CTRL;

    VF_VID_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VF_VID_MAC_CTRL.u32) + offset));
    VF_VID_MAC_CTRL.bits.pre_rd_en = bPreRdEnble;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VF_VID_MAC_CTRL.u32) + offset),VF_VID_MAC_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_VF_SetReqLen(HI_U32 offset, HI_U32 u32ReqLen)
{
    U_VF_VID_MAC_CTRL VF_VID_MAC_CTRL;

    VF_VID_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VF_VID_MAC_CTRL.u32) + offset));
    VF_VID_MAC_CTRL.bits.req_len = u32ReqLen;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VF_VID_MAC_CTRL.u32) + offset),VF_VID_MAC_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_VF_SetReqCtrl(HI_U32 offset, HI_U32 u32ReqCtrl)
{
    U_VF_VID_MAC_CTRL VF_VID_MAC_CTRL;

    VF_VID_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VF_VID_MAC_CTRL.u32) + offset));
    VF_VID_MAC_CTRL.bits.req_ctrl = u32ReqCtrl;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VF_VID_MAC_CTRL.u32) + offset),VF_VID_MAC_CTRL.u32);

    return ;
}

HI_U32 VDP_DISP_GetMaskIntSta(HI_U32 u32intmask)
{
    U_VOMSKINTSTA VOMSKINTSTA;

    if (!pVdpReg)
    {
        HI_ERR_DISP("pVdpReg is is a null\n");
        VOMSKINTSTA.u32 = 0;
    }
    else
    {
        /* read interrupt status */
        VOMSKINTSTA.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->VOMSKINTSTA.u32)));
    }

    return (VOMSKINTSTA.u32 & u32intmask);
}

HI_U32 VDP_DISP_GetMaskVPSSIntSta(HI_U32 u32intmask)
{
    U_OFFLINE_MSKINTSTA OFFLINE_MSKINTSTA;
    if (!pVdpReg)
    {
        HI_ERR_DISP("pVdpReg is is a null\n");
        OFFLINE_MSKINTSTA.u32 = 0;
    }
    else
    {
        OFFLINE_MSKINTSTA.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->OFFLINE_MSKINTSTA.u32)));
        if (0x0 != OFFLINE_MSKINTSTA.u32)
        {
            HI_WARN_DISP("vpss int state %#x\n", OFFLINE_MSKINTSTA.u32);
        }
    }
    return (OFFLINE_MSKINTSTA.u32 & u32intmask);
}

HI_U32 VDP_DISP_GetUnMaskVPSSIntSta(HI_VOID)
{
    U_OFFLINE_INTSTA OFFLINE_INTSTA;
    if (!pVdpReg)
    {
        HI_ERR_DISP("pVdpReg is is a null\n");
        OFFLINE_INTSTA.u32 = 0;
    }
    else
    {
        OFFLINE_INTSTA.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->OFFLINE_INTSTA.u32)));
        if (0x0 != OFFLINE_INTSTA.u32)
        {
            HI_WARN_DISP("vpss int state %#x\n", OFFLINE_INTSTA.u32);
        }
    }
    return OFFLINE_INTSTA.u32;
}


HI_VOID  VDP_DispMask(HI_DRV_DISPLAY_E eChn)
{
    if ( eChn == HI_DRV_DISPLAY_0)
    {
        VDP_DHD1_CBM_MIX_DeInit();
    }
    else
    {
        DISP_ERROR("chan %d,Disp Mask not support !\n", eChn);

    }
}

HI_VOID  VDP_DispUnMask(HI_DRV_DISPLAY_E eChn)
{
    if ( eChn == HI_DRV_DISPLAY_0)
    {
        VDP_DHD1_CBM_MIX_Init();
    }
    else
    {
        DISP_ERROR("chan %d,Disp Mask not support !\n", eChn);
    }

    return;
}

HI_VOID VDP_DISP_SetHdmiClk(HI_U32 u32hd_id, HI_U32 u32hdmi_clkdiv)
{
    U_PERI_CRG54 PERI_CRG54Tmp;

    PERI_CRG54Tmp.u32 = g_pstRegCrg->PERI_CRG54.u32;
    if ( u32hd_id)
    {
        /*chan select :      0:sd ,1: hd*/
        PERI_CRG54Tmp.bits.hdmi_clk_sel = 0;
    }
    else
    {
        /*chan select :      0:sd ,1: hd*/
        PERI_CRG54Tmp.bits.hdmi_clk_sel = 1;
    }

    g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;
    return;
}

HI_S32 VDP_DISP_SelectChanClkDiv(HI_DRV_DISPLAY_E eChn, HI_U32 u32Div)
{
    U_PERI_CRG54 PERI_CRG54Tmp;

    PERI_CRG54Tmp.u32 = g_pstRegCrg->PERI_CRG54.u32;

    if (HI_DRV_DISPLAY_1 == eChn)
    {
        PERI_CRG54Tmp.bits.vo_hd_clk_div = u32Div;
    }
    else
    {
#ifdef VDP_ISOGENY_SUPPORT
        PERI_CRG54Tmp.bits.vo_sd_clk_div = u32Div;
#endif
    }

    g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;

    return HI_SUCCESS;
}

HI_U32 VDP_Disp_GetVdpVersion(HI_U32 *pu32VersionL, HI_U32 *pu32VersionH)
{
    *pu32VersionL =  0x76756F76UL;
    *pu32VersionH =  0x30313134UL;
    return HI_SUCCESS;
}

HI_VOID VDP_RegReStore(HI_U8 *pu8RegBackAddr)
{
    HI_S32 idx = 0;
    HI_S32 s32RegSectionNum = 0;
    HI_U8  *pVdpBackReg = HI_NULL;
    HI_U32 u32Offset = 0;

    /*because we will call DISP_ISR_Resume to resume the isr,se here we do not restore it.*/
    pVdpBackReg      = (HI_U8 *)pu8RegBackAddr;

    s32RegSectionNum = sizeof(s_ulRestoreRegOffset) / sizeof(HI_ULONG) / RESTORE_OFFSET_ELE_NUM;

    /* Restore registers by address offset */
    for (idx = 0; idx < s32RegSectionNum; idx++)
    {
        MEMCOPY_VDP((HI_VOID *)((HI_ULONG)pVdpReg + s_ulRestoreRegOffset[idx][0]),
                    (HI_VOID *)((HI_ULONG)pVdpBackReg + u32Offset),
                    s_ulRestoreRegOffset[idx][1]);

        u32Offset +=  s_ulRestoreRegOffset[idx][1];
    }

    return;
}

HI_VOID VDP_RegSave(HI_U8 *pu8RegBackAddr)
{
    HI_S32 idx = 0;
    HI_S32 s32RegSectionNum = 0;
    HI_U8  *pVdpBackReg = HI_NULL;
    HI_U32 u32Offset = 0;

    pVdpBackReg      = (HI_U8  *)pu8RegBackAddr;
    s32RegSectionNum = sizeof(s_ulRestoreRegOffset) / sizeof(HI_ULONG) / RESTORE_OFFSET_ELE_NUM;

    /* Save registers by address offset */
    for (idx = 0; idx < s32RegSectionNum; idx++)
    {
        MEMCOPY_VDP((HI_VOID *)((HI_ULONG)pVdpBackReg + u32Offset),
                    (HI_VOID *)((HI_ULONG)pVdpReg + s_ulRestoreRegOffset[idx][0]),
                    s_ulRestoreRegOffset[idx][1]);

        u32Offset +=  s_ulRestoreRegOffset[idx][1];
    }

    return;
}

HI_U32  VDP_GetRegCopyMemSize(HI_VOID)
{
#ifndef __DISP_PLATFORM_BOOT__
    HI_S32 idx = 0;
    HI_S32 s32RegSectionNum = 0;
    HI_U32 u32Size = 0;

    s32RegSectionNum = sizeof(s_ulRestoreRegOffset) / sizeof(HI_ULONG) / RESTORE_OFFSET_ELE_NUM;
    for (idx = 0; idx < s32RegSectionNum; idx++)
    {
        u32Size +=  s_ulRestoreRegOffset[idx][1];
    }

    u32Size = FRAME_BUFFER_4K_ALIGN(u32Size);
    return u32Size;
#else
    return 4096;
#endif
}

HI_VOID VDP_OpenClkAndInitCrgConfig(HI_VOID)
{
    U_PERI_CRG54 unTmpCRG54Value;
    U_PERI_CRG211 unTmpCRG211Value;

    /*first,  active Top pll_divider first.*/
    unTmpCRG211Value.u32 = g_pstRegCrg->PERI_CRG211.u32;
    unTmpCRG211Value.bits.vdp_srst_req = 0;
    g_pstRegCrg->PERI_CRG211.u32 = unTmpCRG211Value.u32;
    Local_SyncRegisterOperation();

    /*secondly,   enable vdp1 clk.*/
    unTmpCRG54Value.u32 = g_pstRegCrg->PERI_CRG54.u32;
    PERI_CRG54_INIT(unTmpCRG54Value, HI_FALSE);
    g_pstRegCrg->PERI_CRG54.u32 = unTmpCRG54Value.u32;

    /*secondly,   enable vdp2 clk.*/
    unTmpCRG211Value.u32 = g_pstRegCrg->PERI_CRG211.u32;
    PERI_CRG211_INIT(unTmpCRG211Value, HI_FALSE);
    g_pstRegCrg->PERI_CRG211.u32 = unTmpCRG211Value.u32;
    Local_SyncRegisterOperation();

    /*UnReset CRG*/
    unTmpCRG54Value.bits.vou_srst_req = 0;
    g_pstRegCrg->PERI_CRG54.u32 = unTmpCRG54Value.u32;
    Local_SyncRegisterOperation();

    VDP_SetVdacVbgEnable(HI_TRUE);

    return;
}

HI_VOID VDP_MASTER_SetRchnPrio0(HI_U32 prio)
{
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_RCHN_PRIO0.u32)),prio);
    return ;
}

HI_VOID VDP_MASTER_SetRchnPrio1(HI_U32 prio)
{
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_RCHN_PRIO1.u32)),prio);
    return ;
}

HI_VOID VDP_MASTER_SetWchnPrio0(HI_U32 prio)
{
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_WCHN_PRIO0.u32)),prio);
    return ;
}

HI_VOID VDP_MASTER_SetWchnPrio1(HI_U32 prio)
{
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_WCHN_PRIO1.u32)),prio);
    return ;
}

#ifdef HI_FPGA_SUPPORT
HI_VOID VDP_LogicBusCfgInit(HI_VOID)
{
    HI_U32 u32RealOffset=0;

    VDP_MASTER_SetMidEnable         ( HI_TRUE);
    VDP_MASTER_SetSplitMode         ( VDP_AXI_EDGE_MODE_256);
    VDP_MASTER_SetMstr0Routstanding ( XDP_ROUTSTD);
    VDP_MASTER_SetMstr0Woutstanding ( XDP_WOUTSTD);

    u32RealOffset=VDP_REG_SIZE_CALC(VID_READ_CTRL, VF_VID_READ_CTRL);
    VDP_FDR_VID_SetReqCtrl        (u32RealOffset, VDP_REQ_CTRL_16BURST_1);

    u32RealOffset=VDP_REG_SIZE_CALC(GFX_READ_CTRL, GFX_READ_CTRL);
    VDP_FDR_GFX_SetReqCtrl        ( u32RealOffset, VDP_REQ_CTRL_16BURST_4);

    u32RealOffset=VDP_REG_SIZE_CALC(GFX_READ_CTRL, G1_GFX_READ_CTRL);
    VDP_FDR_GFX_SetReqCtrl        ( u32RealOffset, VDP_REQ_CTRL_16BURST_1);

    u32RealOffset=VDP_REG_SIZE_CALC(GFX_READ_CTRL, G3_GFX_READ_CTRL);
    VDP_FDR_GFX_SetReqCtrl        ( u32RealOffset, VDP_REQ_CTRL_16BURST_4);

    u32RealOffset=VDP_REG_SIZE_CALC(VID_READ_CTRL, V1_VID_READ_CTRL);
    VDP_FDR_VID_SetReqCtrl        (u32RealOffset, VDP_REQ_CTRL_16BURST_1);

    VPSS_Sys_SetProt((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 2);

    return;
}
#else
HI_VOID VDP_LogicBusCfgInit(HI_VOID)
{
    HI_U32 u32RealOffset=0;

    VDP_MASTER_SetMidEnable         (XDP_VDP_MST_CTRL_MULTIID);
    VDP_MASTER_SetSplitMode         (VDP_AXI_EDGE_MODE_256);
    VDP_MASTER_SetMstr0Routstanding (XDP_ROUTSTD);
    VDP_MASTER_SetMstr0Woutstanding (XDP_WOUTSTD);

    u32RealOffset=VDP_REG_SIZE_CALC(GFX_READ_CTRL, GFX_READ_CTRL);
    VDP_FDR_GFX_SetReqCtrl        ( u32RealOffset, VDP_REQ_CTRL_16BURST_4);
    VDP_FDR_GFX_SetReqLen         (u32RealOffset, VDP_REQ_LENGTH_16);

    u32RealOffset=VDP_REG_SIZE_CALC(GFX_READ_CTRL, G1_GFX_READ_CTRL);
    VDP_FDR_GFX_SetReqCtrl        ( u32RealOffset, VDP_REQ_CTRL_16BURST_2);
    VDP_FDR_GFX_SetReqLen         (u32RealOffset, VDP_REQ_LENGTH_16);

    u32RealOffset=VDP_REG_SIZE_CALC(GFX_READ_CTRL, G3_GFX_READ_CTRL);
    VDP_FDR_GFX_SetReqCtrl        ( u32RealOffset, VDP_REQ_CTRL_16BURST_4);
    VDP_FDR_GFX_SetReqLen         (u32RealOffset, VDP_REQ_LENGTH_16);

    VPSS_Sys_SetProt((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 2);
    VPSS_Sys_SetMaxReqLen((S_VDP_REGS_TYPE *)pVdpReg, 0x0, VDP_REQ_LENGTH_16);
    VPSS_Sys_SetMaxReqNum((S_VDP_REGS_TYPE *)pVdpReg, 0x0, VDP_REQ_CTRL_16BURST_1);
    VDP_CAP_SetWbcLen(0, VDP_REQ_LENGTH_16);
    VDP_CAP_SetWbcLen(1, VDP_REQ_LENGTH_16);

    VDP_MASTER_SetRchnPrio0(0);
    VDP_MASTER_SetRchnPrio1(0);
    VDP_MASTER_SetWchnPrio0(0);
    VDP_MASTER_SetWchnPrio1(0);

    return;
}


#endif

HI_VOID VDP_LogicFuncCfgInit(HI_VOID)
{
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX0, VDP_CBM_VP0, 0);
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX0, VDP_CBM_GP0, 1);

    VDP_CBM_SetMixerPrio(VDP_CBM_MIX1, VDP_CBM_VP1, 0);
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX1, VDP_CBM_GP1, 1);

    VPSS_Sys_SetMask1((S_VDP_REGS_TYPE *)pVdpReg, 0x0, XDP_VPSSIP_PQMASK_INIT);

    VDP_OFF_SetOnOfflineSwSrc((S_VDP_REGS_TYPE *)pVdpReg, 1); //0: cfg frm apb; 1: cfg frm Qfrm.
    VDP_OFF_SetOnOfflineMode((S_VDP_REGS_TYPE *)pVdpReg, 1); //0:online; 1:offline;

    VDP_OFF_SetBufMode((S_VDP_REGS_TYPE *)pVdpReg, 1);//0:offline,1:sigle buf,2:multi buf

    VDP_VID_SetIfirMode            (VDP_LAYER_VID0, VDP_IFIRMODE_6TAPFIR);
    VDP_VID_SetIfirCkGtEn          (VDP_LAYER_VID0, 1);

    VDP_VID_SetIfirMode            (VDP_LAYER_VID1, VDP_IFIRMODE_6TAPFIR);
    VDP_VID_SetIfirCkGtEn          (VDP_LAYER_VID1, 1);

    VPSS_Sys_SetDiCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);
    VPSS_Sys_SetHismCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);
    VPSS_Sys_SetDmCntCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);
    VPSS_Sys_SetNrMadCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);
    VPSS_Sys_SetStathCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);
    VPSS_Sys_SetStatvCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);
    VPSS_Sys_SetRgmvCycbufEn((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 1);

    VDP_CYCBUF_SetVid0BindEn( 0, 1);
    VDP_CYCBUF_SetVid0SuccEn( 0, 1);
    VDP_CYCBUF_SetHburstNum( 0, 0);
    VDP_CYCBUF_SetLburstNum( 0, VDP_CFG_NODE_SIZE / 16);
    VDP_CYCBUF_SetBackMode( 0, 1);
    VDP_WBC_LBOX_SetVbkYCbCr(0, 0x0, 0x200, 0x200);
    VDP_WBC_LBOX_SetVbkAlpha(0, 0x0);
    VDP_CYCBUF_SetRegup(  0, 1 );
    VDP_DISP_SetRegUp(VDP_CHN_DHD0);

    VDP_DISP_SetStartPos    (VDP_CHN_DHD0, XDP_START_POS);
    VDP_DISP_SetParaLoadPos (VDP_CHN_DHD0, XDP_PARALOAD_POS);

    VDP_XDP_INTF_SetPreStartPos(XDP_ONANDOFF_SWITCH_POS);//online and offline switch point
    VDP_DISP_SetReqStartPos(XDP_QFREAM_SWITCH_POS);//qfream buffer switch point
    VDP_XDP_INTF_SetFiStartPos(XDP_OFFLINE_START_POS);//offline start

    VDP_OFF_SetOfflineTimeout((S_VDP_REGS_TYPE *)pVdpReg, XDP_OFFLINE_TIMEOUT);//(1/20)s/(1/(120x10^6))s=6000000

#ifndef __DISP_PLATFORM_BOOT__
    VDP_InitDispResoChangeFlow();
#endif

   return;
}

HI_VOID  VDP_DRIVER_Initial(HI_VOID)
{
    U_CBM_MIX1 CBM_MIX1;
    VDP_BKG_S stBkg;

    memset((void *)&stBkg, 0, sizeof(VDP_BKG_S));

    VDP_DRV_Set_SysEslSmmu();
    VDP_WBC_SetUpdMode(VDP_LAYER_WBC_HD0,1);

    /*3rd: about cbm*/
    VDP_CBM_SetMixerBkg(VDP_CBM_MIXV0, stBkg);
    VDP_CBM_SetMixerBkg(VDP_CBM_MIXG0, stBkg);
    VDP_CBM_SetMixerBkg(VDP_CBM_MIX0, stBkg);

    /* initail video mixer */
    VDP_CBM_Clear_MixvPrio(VDP_LAYER_VID0);
    VDP_CBM_Clear_MixvPrio(VDP_LAYER_VID1);

    CBM_MIX1.u32 = pVdpReg->CBM_MIX1.u32;
    CBM_MIX1.bits.mixer_prio1 = 0; /* no layer */
    CBM_MIX1.bits.mixer_prio0 = 0; /* no layer */
    pVdpReg->CBM_MIX1.u32 = CBM_MIX1.u32;
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX0, VDP_CBM_VP0, 0);
    VDP_CBM_SetMixerPrio(VDP_CBM_MIX0, VDP_CBM_GP0, 1);

    VDP_DHD_DEFAULT();
    VDP_DSD_DEFAULT();

    VDP_LogicBusCfgInit();
    VDP_LogicFuncCfgInit();
#ifndef __DISP_PLATFORM_BOOT__
    mb();
#endif
    return;
}

HI_VOID VDP_CloseClkResetModule(HI_VOID)
{
    U_PERI_CRG54 unTmpCRG54Value;
    U_PERI_CRG211 unTmpCRG211Value;
    HI_U32 i = 0;

    unTmpCRG54Value.u32 = g_pstRegCrg->PERI_CRG54.u32;
    unTmpCRG54Value.bits.vou_srst_req = 1;
    g_pstRegCrg->PERI_CRG54.u32 = unTmpCRG54Value.u32;
    Local_SyncRegisterOperation();

    while (HI_FALSE == VDP_CheckResetFinished())
    {
        DISP_MSLEEP(2);
        i ++;

        if (i > 40)
        {
            DISP_ERROR("=========VDP reset timeout====\n");
            break;
        }
    }

    /*close vdp clk*/
    g_pstRegCrg->PERI_CRG71.bits.vdac_chop_cken = 0;

    /*close vdp clk*/
    unTmpCRG54Value.u32 = g_pstRegCrg->PERI_CRG54.u32;
    PERI_CRG54_INIT(unTmpCRG54Value, HI_TRUE);
    g_pstRegCrg->PERI_CRG54.u32 = unTmpCRG54Value.u32;
    Local_SyncRegisterOperation();

    /*close clk gate*/
    unTmpCRG211Value.u32 = g_pstRegCrg->PERI_CRG211.u32;
    PERI_CRG211_INIT(unTmpCRG211Value, HI_TRUE);
    g_pstRegCrg->PERI_CRG211.u32 = unTmpCRG211Value.u32;
    Local_SyncRegisterOperation();

    unTmpCRG211Value.bits.vdp_srst_req = 1;
    g_pstRegCrg->PERI_CRG211.u32 = unTmpCRG211Value.u32;
    Local_SyncRegisterOperation();


    return ;
}

HI_S32 VDP_SetLayerClockEnable(VDP_LAYER_VID_E enLayer, HI_BOOL bEnable)
{
    return HI_SUCCESS;
}

HI_S32 VDP_CheckLayerClockEnable(VDP_LAYER_VID_E enLayer, HI_BOOL *pEnable)
{
    return HI_SUCCESS;
}

HI_VOID VDP_SetVpWbcClockEnable(HI_BOOL bEnable)
{
    return;
}

HI_VOID VDP_SetDhdWbcClockEnable(HI_BOOL bEnable)
{
    return;
}

HI_VOID  VDP_WBC_SetZmeInFmt_Define1(VDP_LAYER_WBC_E enLayer, VDP_PROC_FMT_E u32Fmt)
{
    return ;
}

HI_VOID VDP_SelectClk(HI_U32 u32VDPClkMode)
{
    U_PERI_CRG54 PERI_CRG54Tmp;

    PERI_CRG54Tmp.u32 = g_pstRegCrg->PERI_CRG54.u32;
    PERI_CRG54Tmp.bits.vdp_clk_sel = u32VDPClkMode;
    g_pstRegCrg->PERI_CRG54.u32 = PERI_CRG54Tmp.u32;
}

HI_VOID VDP_VBI_GetCgmsTypeBEn(DISP_VENC_E enChanel, HI_BOOL *bEnTypeB)
{
    return ;
}

HI_VOID VDP_VBI_SetCgmsTypeBEn(DISP_VENC_E enChanel, HI_BOOL bEnTypeB)
{
    return ;
}

HI_VOID VDP_MVCN_GetMcvnEnable(HI_BOOL *bEnable)
{
    return;
}

HI_VOID VDP_MVCN_SetMcvnEnable(HI_BOOL bEnable)
{
    return;
}

HI_U32 VDP_WBC_GetAlwaysProFlag(HI_BOOL *bAlwaysPro)
{
    *bAlwaysPro = 0;
    return HI_SUCCESS;
}





