#ifndef __VDP_QFRM_REG_H__
#define __VDP_QFRM_REG_H__

#include "hi_type.h"
#include "hi_register_vdp.h"

typedef struct
{
    unsigned int                       VPSS_REGLOAD_START_ADDR_INFO;
    U_VPSS_REGLOAD_START_ADDR          VPSS_REGLOAD_START_ADDR;

    unsigned int                       VPSS_REGLOAD_UP_INFO;
    U_VPSS_REGLOAD_UP                  VPSS_REGLOAD_UP;

    unsigned int           OFFLINE_FPGADBG_INFO;
    U_OFFLINE_FPGADBG               OFFLINE_FPGADBG;

    unsigned int           LINK_CTRL_INFO;
    U_LINK_CTRL               LINK_CTRL;

    unsigned int           PARA_ADDR_VHD_CHN00_INFO;
    U_PARA_ADDR_VHD_CHN00               PARA_ADDR_VHD_CHN00;

    unsigned int           PARA_ADDR_VHD_CHN01_INFO;
    U_PARA_ADDR_VHD_CHN01               PARA_ADDR_VHD_CHN01;

    unsigned int           PARA_ADDR_VHD_CHN02_INFO;
    U_PARA_ADDR_VHD_CHN02               PARA_ADDR_VHD_CHN02;

    unsigned int           PARA_ADDR_VHD_CHN07_INFO;
    U_PARA_ADDR_VHD_CHN07               PARA_ADDR_VHD_CHN07;

    unsigned int           PARA_ADDR_VHD_CHN08_INFO;
    U_PARA_ADDR_VHD_CHN08               PARA_ADDR_VHD_CHN08;

    unsigned int           PARA_UP_VHD_INFO;
    U_PARA_UP_VHD               PARA_UP_VHD;

    unsigned int           V0_CTRL_INFO;
    U_V0_CTRL               V0_CTRL;

    unsigned int           FPGADEBUG_SOFTALG_INFO;
    U_FPGADEBUG_SOFTALG               FPGADEBUG_SOFTALG;

    unsigned int           FPGADEBUG_SOFTALG_INFO_Btm;
    U_FPGADEBUG_SOFTALG               FPGADEBUG_SOFTALG_Btm;

    unsigned int           V0_VPSS_CTRL_INFO;
    U_V0_VPSS_CTRL               V0_VPSS_CTRL;

    unsigned int           V0_VPSS_CTRL_INFO_Btm;
    U_V0_VPSS_CTRL               V0_VPSS_CTRL_Btm;

    unsigned int           V0_DFPOS_INFO;
    U_V0_DFPOS               V0_DFPOS;

    unsigned int           V0_DFPOS_INFO_Btm;
    U_V0_DFPOS               V0_DFPOS_Btm;

    unsigned int           V0_DLPOS_INFO;
    U_V0_DLPOS               V0_DLPOS;

    unsigned int           V0_DLPOS_INFO_Btm;
    U_V0_DLPOS               V0_DLPOS_Btm;

    unsigned int           V0_VFPOS_INFO;
    U_V0_VFPOS               V0_VFPOS;

    unsigned int           V0_VFPOS_INFO_Btm;
    U_V0_VFPOS               V0_VFPOS_Btm;

    unsigned int           V0_VLPOS_INFO;
    U_V0_VLPOS               V0_VLPOS;

    unsigned int           V0_VLPOS_INFO_Btm;
    U_V0_VLPOS               V0_VLPOS_Btm;

    unsigned int           V0_CCROP_INFO;
    U_V0_CCROP               V0_CCROP;

    unsigned int           V0_FCROP_INFO;
    U_V0_FCROP               V0_FCROP;

    unsigned int           V0_FCROP_INFO_Btm;
    U_V0_FCROP               V0_FCROP_Btm;

    unsigned int           V0_LCROP_INFO;
    U_V0_LCROP               V0_LCROP;

    unsigned int           V0_LCROP_INFO_Btm;
    U_V0_LCROP               V0_LCROP_Btm;

    unsigned int           V0_HSP_INFO;
    U_V0_HSP               V0_HSP;

    unsigned int           V0_HSP_INFO_Btm;
    U_V0_HSP               V0_HSP_Btm;

    unsigned int           V0_HLOFFSET_INFO;
    U_V0_HLOFFSET              V0_HLOFFSET;

    unsigned int           V0_HCOFFSET_INFO;
    U_V0_HCOFFSET              V0_HCOFFSET;

    unsigned int           V0_VSP_INFO;
    U_V0_VSP               V0_VSP;

    unsigned int           V0_VSR_INFO;
    U_V0_VSR               V0_VSR;

    unsigned int           V0_VSR_INFO_Btm;
    U_V0_VSR               V0_VSR_Btm;

    unsigned int           V0_VOFFSET_INFO;
    U_V0_VOFFSET               V0_VOFFSET;

    unsigned int           V0_VBOFFSET_INFO;
    U_V0_VBOFFSET              V0_VBOFFSET;

    unsigned int           V0_ZME_ORESO_INFO;
    U_V0_ZME_ORESO             V0_ZME_ORESO;

    unsigned int           V0_ZME_ORESO_INFO_Btm;
    U_V0_ZME_ORESO               V0_ZME_ORESO_Btm;

    unsigned int           V0_ZME_SHOOTCTRL_HL_INFO;
    U_V0_ZME_SHOOTCTRL_HL              V0_ZME_SHOOTCTRL_HL;

    unsigned int           V0_ZME_SHOOTCTRL_VL_INFO;
    U_V0_ZME_SHOOTCTRL_VL              V0_ZME_SHOOTCTRL_VL;

    unsigned int           VHDLTICTRL_INFO;
    U_VHDLTICTRL               VHDLTICTRL;

    unsigned int           VHDLTITHD_INFO;
    U_VHDLTITHD               VHDLTITHD;

    unsigned int           V0_HIPP_CSC_CTRL_INFO;
    U_V0_HIPP_CSC_CTRL               V0_HIPP_CSC_CTRL;

    unsigned int           V0_HIPP_CSC_COEF00_INFO;
    U_V0_HIPP_CSC_COEF00               V0_HIPP_CSC_COEF00;

    unsigned int           V0_HIPP_CSC_COEF01_INFO;
    U_V0_HIPP_CSC_COEF01               V0_HIPP_CSC_COEF01;

    unsigned int           V0_HIPP_CSC_COEF02_INFO;
    U_V0_HIPP_CSC_COEF02               V0_HIPP_CSC_COEF02;

    unsigned int           V0_HIPP_CSC_COEF10_INFO;
    U_V0_HIPP_CSC_COEF10               V0_HIPP_CSC_COEF10;

    unsigned int           V0_HIPP_CSC_COEF11_INFO;
    U_V0_HIPP_CSC_COEF11               V0_HIPP_CSC_COEF11;

    unsigned int           V0_HIPP_CSC_COEF12_INFO;
    U_V0_HIPP_CSC_COEF12               V0_HIPP_CSC_COEF12;

    unsigned int           V0_HIPP_CSC_COEF20_INFO;
    U_V0_HIPP_CSC_COEF20               V0_HIPP_CSC_COEF20;

    unsigned int           V0_HIPP_CSC_COEF21_INFO;
    U_V0_HIPP_CSC_COEF21               V0_HIPP_CSC_COEF21;

    unsigned int           V0_HIPP_CSC_COEF22_INFO;
    U_V0_HIPP_CSC_COEF22               V0_HIPP_CSC_COEF22;

    unsigned int           V0_HIPP_CSC_SCALE_INFO;
    U_V0_HIPP_CSC_SCALE               V0_HIPP_CSC_SCALE;

    unsigned int           V0_HIPP_CSC_IDC0_INFO;
    U_V0_HIPP_CSC_IDC0               V0_HIPP_CSC_IDC0;

    unsigned int           V0_HIPP_CSC_IDC1_INFO;
    U_V0_HIPP_CSC_IDC1               V0_HIPP_CSC_IDC1;

    unsigned int           V0_HIPP_CSC_IDC2_INFO;
    U_V0_HIPP_CSC_IDC2               V0_HIPP_CSC_IDC2;

    unsigned int           V0_HIPP_CSC_ODC0_INFO;
    U_V0_HIPP_CSC_ODC0               V0_HIPP_CSC_ODC0;

    unsigned int           V0_HIPP_CSC_ODC1_INFO;
    U_V0_HIPP_CSC_ODC1               V0_HIPP_CSC_ODC1;

    unsigned int           V0_HIPP_CSC_ODC2_INFO;
    U_V0_HIPP_CSC_ODC2               V0_HIPP_CSC_ODC2;

    unsigned int           V0_HIPP_CSC_MIN_Y_INFO;
    U_V0_HIPP_CSC_MIN_Y               V0_HIPP_CSC_MIN_Y;

    unsigned int           V0_HIPP_CSC_MIN_C_INFO;
    U_V0_HIPP_CSC_MIN_C               V0_HIPP_CSC_MIN_C;

    unsigned int           V0_HIPP_CSC_MAX_Y_INFO;
    U_V0_HIPP_CSC_MAX_Y               V0_HIPP_CSC_MAX_Y;

    unsigned int           V0_HIPP_CSC_MAX_C_INFO;
    U_V0_HIPP_CSC_MAX_C               V0_HIPP_CSC_MAX_C;

    unsigned int           V0_HPZME_HINFO_INFO;
    U_V0_HPZME_HINFO               V0_HPZME_HINFO;

    unsigned int           V0_HPZME_HSP_INFO;
    U_V0_HPZME_HSP               V0_HPZME_HSP;

    unsigned int           V0_HPZME_HLOFFSET_INFO;
    U_V0_HPZME_HLOFFSET               V0_HPZME_HLOFFSET;

    unsigned int           V0_HPZME_HCOFFSET_INFO;
    U_V0_HPZME_HCOFFSET               V0_HPZME_HCOFFSET;

    unsigned int           V0_HPZME_HL_SHOOTCTRL_INFO;
    U_V0_HPZME_HL_SHOOTCTRL               V0_HPZME_HL_SHOOTCTRL;

    unsigned int           V0_HPZME_HC_SHOOTCTRL_INFO;
    U_V0_HPZME_HC_SHOOTCTRL               V0_HPZME_HC_SHOOTCTRL;

    unsigned int           WBC_DHD0_CTRL_INFO;
    U_WBC_DHD0_CTRL               WBC_DHD0_CTRL;

    unsigned int           WBC_DHD0_ZME_HINFO_INFO;
    U_WBC_DHD0_ZME_HINFO               WBC_DHD0_ZME_HINFO;

    unsigned int           WBC_DHD0_ZME_HINFO_INFO_Btm;
    U_WBC_DHD0_ZME_HINFO               WBC_DHD0_ZME_HINFO_Btm;

    unsigned int           WBC_DHD0_ZME_HSP_INFO;
    U_WBC_DHD0_ZME_HSP               WBC_DHD0_ZME_HSP;

    unsigned int           WBC_DHD0_ZME_HSP_INFO_Btm;
    U_WBC_DHD0_ZME_HSP               WBC_DHD0_ZME_HSP_Btm;

    unsigned int           WBC_DHD0_ZME_HLOFFSET_INFO;
    U_WBC_DHD0_ZME_HLOFFSET               WBC_DHD0_ZME_HLOFFSET;

    unsigned int           WBC_DHD0_ZME_HCOFFSET_INFO;
    U_WBC_DHD0_ZME_HCOFFSET               WBC_DHD0_ZME_HCOFFSET;

    unsigned int           WBC_DHD0_HCDS_INFO;
    U_WBC_DHD0_HCDS               WBC_DHD0_HCDS;

    unsigned int           WBC_DHD0_DITHER_CTRL_INFO;
    U_WBC_DHD0_DITHER_CTRL               WBC_DHD0_DITHER_CTRL;

    unsigned int           WBC_DHD0_VZME_VINFO_INFO;
    U_WBC_DHD0_VZME_VINFO               WBC_DHD0_VZME_VINFO;

    unsigned int           WBC_DHD0_VZME_VINFO_INFO_Btm;
    U_WBC_DHD0_VZME_VINFO               WBC_DHD0_VZME_VINFO_Btm;

    unsigned int           WBC_DHD0_VZME_VSP_INFO;
    U_WBC_DHD0_VZME_VSP               WBC_DHD0_VZME_VSP;

    unsigned int           WBC_DHD0_VZME_VSR_INFO;
    U_WBC_DHD0_VZME_VSR               WBC_DHD0_VZME_VSR;

    unsigned int           WBC_DHD0_VZME_VSR_INFO_Btm;
    U_WBC_DHD0_VZME_VSR               WBC_DHD0_VZME_VSR_Btm;

    unsigned int           WBC_DHD0_VZME_VOFFSET_INFO;
    U_WBC_DHD0_VZME_VOFFSET               WBC_DHD0_VZME_VOFFSET;

    unsigned int           WBC_DHD0_VZME_VBOFFSET_INFO;
    U_WBC_DHD0_VZME_VBOFFSET               WBC_DHD0_VZME_VBOFFSET;

    unsigned int           WBC_DHD0_FCROP_INFO;
    U_WBC_DHD0_FCROP               WBC_DHD0_FCROP;

    unsigned int           WBC_DHD0_FCROP_INFO_Btm;
    U_WBC_DHD0_FCROP               WBC_DHD0_FCROP_Btm;

    unsigned int           WBC_DHD0_LCROP_INFO;
    U_WBC_DHD0_LCROP               WBC_DHD0_LCROP;

    unsigned int           WBC_DHD0_LCROP_INFO_Btm;
    U_WBC_DHD0_LCROP               WBC_DHD0_LCROP_Btm;

    unsigned int           WBC_DHD0_LBX_CTRL_INFO;
    U_WBC_DHD0_LBX_CTRL               WBC_DHD0_LBX_CTRL;

    unsigned int           WBC_DHD0_LBX_ORESO_INFO;
    U_WBC_DHD0_LBX_ORESO               WBC_DHD0_LBX_ORESO;

    unsigned int           WBC_DHD0_LBX_ORESO_INFO_Btm;
    U_WBC_DHD0_LBX_ORESO               WBC_DHD0_LBX_ORESO_Btm;

    unsigned int           WBC_DHD0_LBX_VFPOS_INFO;
    U_WBC_DHD0_LBX_VFPOS               WBC_DHD0_LBX_VFPOS;

    unsigned int           WBC_DHD0_LBX_VFPOS_INFO_Btm;
    U_WBC_DHD0_LBX_VFPOS               WBC_DHD0_LBX_VFPOS_Btm;

    unsigned int           WBC_DHD0_LBX_VLPOS_INFO;
    U_WBC_DHD0_LBX_VLPOS               WBC_DHD0_LBX_VLPOS;

    unsigned int           WBC_DHD0_LBX_VLPOS_INFO_Btm;
    U_WBC_DHD0_LBX_VLPOS               WBC_DHD0_LBX_VLPOS_Btm;

    unsigned int           VID_READ_CTRL_INFO;
    U_VID_READ_CTRL            VID_READ_CTRL;

    unsigned int           VID_MAC_CTRL_INFO;
    U_VID_MAC_CTRL             VID_MAC_CTRL;

    unsigned int           VID_MAC_CTRL_INFO_Btm;
    U_VID_MAC_CTRL             VID_MAC_CTRL_Btm;

    unsigned int           VID_READ_MODE_INFO;
    U_VID_READ_MODE            VID_READ_MODE;

    unsigned int           VID_READ_MODE_INFO_Btm;
    U_VID_READ_MODE            VID_READ_MODE_Btm;

    unsigned int           VID_OUT_CTRL_INFO;
    U_VID_OUT_CTRL             VID_OUT_CTRL;

    unsigned int           VID_MUTE_BK_INFO;
    U_VID_MUTE_BK               VID_MUTE_BK;

    unsigned int           VID_SRC_BITW_INFO;
    U_VID_SRC_BITW             VID_SRC_BITW;

    unsigned int           VID_SRC_INFO_INFO;
    U_VID_SRC_INFO               VID_SRC_INFO;

    unsigned int           VID_SRC_RESO_INFO;
    U_VID_SRC_RESO               VID_SRC_RESO;

    unsigned int           VID_SRC_CROP_INFO;
    U_VID_SRC_CROP               VID_SRC_CROP;

    unsigned int           VID_IN_RESO_INFO;
    U_VID_IN_RESO               VID_IN_RESO;

    unsigned int           VID_ADDR_L_INFO;
    U_VID_ADDR_L               VID_ADDR_L;

    unsigned int           VID_CADDR_L_INFO;
    U_VID_CADDR_L               VID_CADDR_L;

    unsigned int           VID_2BIT_ADDR_L_INFO;
    U_VID_2BIT_ADDR_L               VID_2BIT_ADDR_L;

    unsigned int           VID_2BIT_CADDR_L_INFO;
    U_VID_2BIT_CADDR_L               VID_2BIT_CADDR_L;

    unsigned int           VID_STRIDE_INFO;
    U_VID_STRIDE               VID_STRIDE;

    unsigned int           VID_2BIT_STRIDE_INFO;
    U_VID_2BIT_STRIDE               VID_2BIT_STRIDE;

    unsigned int           VID_WTUNL_CTRL_INFO;
    U_VID_WTUNL_CTRL               VID_WTUNL_CTRL;

    unsigned int           VID_WTUNL_ADDR_L_INFO;
    U_VID_WTUNL_ADDR_L               VID_WTUNL_ADDR_L;

    unsigned int           VF_VID_READ_CTRL_INFO;
    U_VF_VID_READ_CTRL               VF_VID_READ_CTRL;

    unsigned int           VF_VID_READ_CTRL_INFO_Btm;
    U_VF_VID_READ_CTRL               VF_VID_READ_CTRL_Btm;

    unsigned int           VF_VID_READ_MODE_INFO;
    U_VF_VID_READ_MODE               VF_VID_READ_MODE;

    unsigned int           VF_VID_READ_MODE_INFO_Btm;
    U_VF_VID_READ_MODE               VF_VID_READ_MODE_Btm;

    unsigned int           VF_VID_OUT_CTRL_INFO;
    U_VF_VID_OUT_CTRL               VF_VID_OUT_CTRL;

    unsigned int           VF_VID_OUT_CTRL_INFO_Btm;
    U_VF_VID_OUT_CTRL               VF_VID_OUT_CTRL_Btm;

    unsigned int           VF_VID_MUTE_BK_INFO;
    U_VF_VID_MUTE_BK               VF_VID_MUTE_BK;

    unsigned int           VF_VID_SRC_BITW_INFO;
    U_VF_VID_SRC_BITW               VF_VID_SRC_BITW;

    unsigned int           VF_VID_SRC_INFO_INFO;
    U_VF_VID_SRC_INFO               VF_VID_SRC_INFO;

    unsigned int           VF_VID_SRC_RESO_INFO;
    U_VF_VID_SRC_RESO               VF_VID_SRC_RESO;

    unsigned int           VF_VID_SRC_RESO_INFO_Btm;
    U_VF_VID_SRC_RESO               VF_VID_SRC_RESO_Btm;

    unsigned int           VF_VID_SRC_CROP_INFO;
    U_VF_VID_SRC_CROP               VF_VID_SRC_CROP;

    unsigned int           VF_VID_SRC_CROP_INFO_Btm;
    U_VF_VID_SRC_CROP               VF_VID_SRC_CROP_Btm;

    unsigned int           VF_VID_IN_RESO_INFO;
    U_VF_VID_IN_RESO               VF_VID_IN_RESO;

    unsigned int           VF_VID_IN_RESO_INFO_Btm;
    U_VF_VID_IN_RESO               VF_VID_IN_RESO_Btm;

    unsigned int           VF_VID_ADDR_L_INFO;
    U_VF_VID_ADDR_L               VF_VID_ADDR_L;

    unsigned int           VF_VID_CADDR_L_INFO;
    U_VF_VID_CADDR_L               VF_VID_CADDR_L;

    unsigned int           VF_VID_STRIDE_INFO;
    U_VF_VID_STRIDE               VF_VID_STRIDE;

    unsigned int           VPSS_DI_CYC_Y_START_ADDR_LOW_INFO;
    U_VPSS_DI_CYC_Y_START_ADDR_LOW               VPSS_DI_CYC_Y_START_ADDR_LOW;

    unsigned int           VPSS_DI_CYC_Y_END_ADDR_LOW_INFO;
    U_VPSS_DI_CYC_Y_END_ADDR_LOW               VPSS_DI_CYC_Y_END_ADDR_LOW;

    unsigned int           VPSS_DI_CYC_C_START_ADDR_LOW_INFO;
    U_VPSS_DI_CYC_C_START_ADDR_LOW               VPSS_DI_CYC_C_START_ADDR_LOW;

    unsigned int           VPSS_DI_CYC_C_END_ADDR_LOW_INFO;
    U_VPSS_DI_CYC_C_END_ADDR_LOW               VPSS_DI_CYC_C_END_ADDR_LOW;

    unsigned int           VPSS_HISM_CYC_START_ADDR_LOW_INFO;
    U_VPSS_HISM_CYC_START_ADDR_LOW               VPSS_HISM_CYC_START_ADDR_LOW;

    unsigned int           VPSS_HISM_CYC_END_ADDR_LOW_INFO;
    U_VPSS_HISM_CYC_END_ADDR_LOW               VPSS_HISM_CYC_END_ADDR_LOW;

    unsigned int           VPSS_DM_CNT_CYC_START_ADDR_LOW_INFO;
    U_VPSS_DM_CNT_CYC_START_ADDR_LOW               VPSS_DM_CNT_CYC_START_ADDR_LOW;

    unsigned int           VPSS_DM_CNT_CYC_END_ADDR_LOW_INFO;
    U_VPSS_DM_CNT_CYC_END_ADDR_LOW               VPSS_DM_CNT_CYC_END_ADDR_LOW;

    unsigned int           VPSS_NR_MAD_CYC_START_ADDR_LOW_INFO;
    U_VPSS_NR_MAD_CYC_START_ADDR_LOW               VPSS_NR_MAD_CYC_START_ADDR_LOW;

    unsigned int           VPSS_NR_MAD_CYC_END_ADDR_LOW_INFO;
    U_VPSS_NR_MAD_CYC_END_ADDR_LOW               VPSS_NR_MAD_CYC_END_ADDR_LOW;

    unsigned int           VPSS_STATH_CYC_START_ADDR_LOW_INFO;
    U_VPSS_STATH_CYC_START_ADDR_LOW               VPSS_STATH_CYC_START_ADDR_LOW;

    unsigned int           VPSS_STATH_CYC_END_ADDR_LOW_INFO;
    U_VPSS_STATH_CYC_END_ADDR_LOW               VPSS_STATH_CYC_END_ADDR_LOW;

    unsigned int           VPSS_STATV_CYC_START_ADDR_LOW_INFO;
    U_VPSS_STATV_CYC_START_ADDR_LOW               VPSS_STATV_CYC_START_ADDR_LOW;

    unsigned int           VPSS_STATV_CYC_END_ADDR_LOW_INFO;
    U_VPSS_STATV_CYC_END_ADDR_LOW               VPSS_STATV_CYC_END_ADDR_LOW;

    unsigned int           VPSS_RGMV_CYC_START_ADDR_LOW_INFO;
    U_VPSS_RGMV_CYC_START_ADDR_LOW               VPSS_RGMV_CYC_START_ADDR_LOW;

    unsigned int           VPSS_RGMV_CYC_END_ADDR_LOW_INFO;
    U_VPSS_RGMV_CYC_END_ADDR_LOW               VPSS_RGMV_CYC_END_ADDR_LOW;

    unsigned int           VPSS_P1_CTRL_INFO;
    U_VPSS_P1_CTRL               VPSS_P1_CTRL;

    unsigned int           VPSS_P1_CTRL_INFO_Btm;
    U_VPSS_P1_CTRL               VPSS_P1_CTRL_Btm;

    unsigned int           VPSS_P1_STRIDE_INFO;
    U_VPSS_P1_STRIDE               VPSS_P1_STRIDE;

    unsigned int           VPSS_P2_CTRL_INFO;
    U_VPSS_P2_CTRL               VPSS_P2_CTRL;

    unsigned int           VPSS_P2_CTRL_INFO_Btm;
    U_VPSS_P2_CTRL               VPSS_P2_CTRL_Btm;

    unsigned int           VPSS_P2_SIZE_INFO;
    U_VPSS_P2_SIZE               VPSS_P2_SIZE;

    unsigned int           VPSS_P2_STRIDE_INFO;
    U_VPSS_P2_STRIDE               VPSS_P2_STRIDE;

    unsigned int           VPSS_P3_CTRL_INFO;
    U_VPSS_P3_CTRL               VPSS_P3_CTRL;

    unsigned int           VPSS_P3_CTRL_INFO_Btm;
    U_VPSS_P3_CTRL               VPSS_P3_CTRL_Btm;

    unsigned int           VPSS_P3_STRIDE_INFO;
    U_VPSS_P3_STRIDE               VPSS_P3_STRIDE;

    unsigned int           VPSS_RHISM_CTRL_INFO;
    U_VPSS_RHISM_CTRL               VPSS_RHISM_CTRL;

    unsigned int           VPSS_RHISM_CTRL_INFO_Btm;
    U_VPSS_RHISM_CTRL               VPSS_RHISM_CTRL_Btm;

    unsigned int           VPSS_RHISM_SIZE_INFO;
    U_VPSS_RHISM_SIZE               VPSS_RHISM_SIZE;

    unsigned int           VPSS_RHISM_STRIDE_INFO;
    U_VPSS_RHISM_STRIDE               VPSS_RHISM_STRIDE;

    unsigned int           VPSS_RDM_CNT_CTRL_INFO;
    U_VPSS_RDM_CNT_CTRL               VPSS_RDM_CNT_CTRL;

    unsigned int           VPSS_RDM_CNT_CTRL_INFO_Btm;
    U_VPSS_RDM_CNT_CTRL               VPSS_RDM_CNT_CTRL_Btm;

    unsigned int           VPSS_RDM_CNT_SIZE_INFO;
    U_VPSS_RDM_CNT_SIZE               VPSS_RDM_CNT_SIZE;

    unsigned int           VPSS_RDM_CNT_STRIDE_INFO;
    U_VPSS_RDM_CNT_STRIDE               VPSS_RDM_CNT_STRIDE;

    unsigned int           VPSS_NR_RMAD_CTRL_INFO;
    U_VPSS_NR_RMAD_CTRL               VPSS_NR_RMAD_CTRL;

    unsigned int           VPSS_NR_RMAD_CTRL_INFO_Btm;
    U_VPSS_NR_RMAD_CTRL               VPSS_NR_RMAD_CTRL_Btm;

    unsigned int           VPSS_NR_RMAD_SIZE_INFO;
    U_VPSS_NR_RMAD_SIZE               VPSS_NR_RMAD_SIZE;

    unsigned int           VPSS_NR_RMAD_STRIDE_INFO;
    U_VPSS_NR_RMAD_STRIDE               VPSS_NR_RMAD_STRIDE;

    unsigned int           VPSS_SNR_RMAD_CTRL_INFO;
    U_VPSS_SNR_RMAD_CTRL               VPSS_SNR_RMAD_CTRL;

    unsigned int           VPSS_SNR_RMAD_CTRL_INFO_Btm;
    U_VPSS_SNR_RMAD_CTRL               VPSS_SNR_RMAD_CTRL_Btm;

    unsigned int           VPSS_SNR_RMAD_STRIDE_INFO;
    U_VPSS_SNR_RMAD_STRIDE               VPSS_SNR_RMAD_STRIDE;

    unsigned int           VPSS_SNR_RMAD_CTRL1_INFO;
    U_VPSS_SNR_RMAD_CTRL1               VPSS_SNR_RMAD_CTRL1;

    unsigned int           VPSS_P2STATH_CTRL_INFO;
    U_VPSS_P2STATH_CTRL               VPSS_P2STATH_CTRL;

    unsigned int           VPSS_P2STATH_CTRL_INFO_Btm;
    U_VPSS_P2STATH_CTRL               VPSS_P2STATH_CTRL_Btm;

    unsigned int           VPSS_P2STATH_SIZE_INFO;
    U_VPSS_P2STATH_SIZE               VPSS_P2STATH_SIZE;

    unsigned int           VPSS_P2STATH_STRIDE_INFO;
    U_VPSS_P2STATH_STRIDE               VPSS_P2STATH_STRIDE;

    unsigned int           VPSS_P2STATV_CTRL_INFO;
    U_VPSS_P2STATV_CTRL               VPSS_P2STATV_CTRL;

    unsigned int           VPSS_P2STATV_CTRL_INFO_Btm;
    U_VPSS_P2STATV_CTRL               VPSS_P2STATV_CTRL_Btm;

    unsigned int           VPSS_P2STATV_SIZE_INFO;
    U_VPSS_P2STATV_SIZE               VPSS_P2STATV_SIZE;

    unsigned int           VPSS_P2STATV_STRIDE_INFO;
    U_VPSS_P2STATV_STRIDE               VPSS_P2STATV_STRIDE;

    unsigned int           VPSS_P2RGMV_CTRL_INFO;
    U_VPSS_P2RGMV_CTRL               VPSS_P2RGMV_CTRL;

    unsigned int           VPSS_P2RGMV_CTRL_INFO_Btm;
    U_VPSS_P2RGMV_CTRL               VPSS_P2RGMV_CTRL_Btm;

    unsigned int           VPSS_P2RGMV_SIZE_INFO;
    U_VPSS_P2RGMV_SIZE               VPSS_P2RGMV_SIZE;

    unsigned int           VPSS_P2RGMV_STRIDE_INFO;
    U_VPSS_P2RGMV_STRIDE               VPSS_P2RGMV_STRIDE;

    unsigned int           VPSS_P1RGMV_CTRL_INFO;
    U_VPSS_P1RGMV_CTRL               VPSS_P1RGMV_CTRL;

    unsigned int           VPSS_P1RGMV_CTRL_INFO_Btm;
    U_VPSS_P1RGMV_CTRL               VPSS_P1RGMV_CTRL_Btm;

    unsigned int           VPSS_P1RGMV_STRIDE_INFO;
    U_VPSS_P1RGMV_STRIDE               VPSS_P1RGMV_STRIDE;

    unsigned int           VPSS_RFR_CTRL_INFO;
    U_VPSS_RFR_CTRL               VPSS_RFR_CTRL;

    unsigned int           VPSS_RFR_STRIDE_INFO;
    U_VPSS_RFR_STRIDE               VPSS_RFR_STRIDE;

    unsigned int           VPSS_WHISM_CTRL_INFO;
    U_VPSS_WHISM_CTRL               VPSS_WHISM_CTRL;

    unsigned int           VPSS_WHISM_CTRL_INFO_Btm;
    U_VPSS_WHISM_CTRL               VPSS_WHISM_CTRL_Btm;

    unsigned int           VPSS_WHISM_STRIDE_INFO;
    U_VPSS_WHISM_STRIDE               VPSS_WHISM_STRIDE;

    unsigned int           VPSS_WHISM_SIZE_INFO;
    U_VPSS_WHISM_SIZE               VPSS_WHISM_SIZE;

    unsigned int           VPSS_WDM_CNT_CTRL_INFO;
    U_VPSS_WDM_CNT_CTRL               VPSS_WDM_CNT_CTRL;

    unsigned int           VPSS_WDM_CNT_CTRL_INFO_Btm;
    U_VPSS_WDM_CNT_CTRL               VPSS_WDM_CNT_CTRL_Btm;

    unsigned int           VPSS_WDM_CNT_STRIDE_INFO;
    U_VPSS_WDM_CNT_STRIDE               VPSS_WDM_CNT_STRIDE;

    unsigned int           VPSS_WDM_CNT_SIZE_INFO;
    U_VPSS_WDM_CNT_SIZE               VPSS_WDM_CNT_SIZE;

    unsigned int           VPSS_NR_WMAD_CTRL_INFO;
    U_VPSS_NR_WMAD_CTRL               VPSS_NR_WMAD_CTRL;

    unsigned int           VPSS_NR_WMAD_CTRL_INFO_Btm;
    U_VPSS_NR_WMAD_CTRL               VPSS_NR_WMAD_CTRL_Btm;

    unsigned int           VPSS_NR_WMAD_STRIDE_INFO;
    U_VPSS_NR_WMAD_STRIDE               VPSS_NR_WMAD_STRIDE;

    unsigned int           VPSS_NR_WMAD_SIZE_INFO;
    U_VPSS_NR_WMAD_SIZE               VPSS_NR_WMAD_SIZE;

    unsigned int           VPSS_CFSTATH_CTRL_INFO;
    U_VPSS_CFSTATH_CTRL               VPSS_CFSTATH_CTRL;

    unsigned int           VPSS_CFSTATH_CTRL_INFO_Btm;
    U_VPSS_CFSTATH_CTRL               VPSS_CFSTATH_CTRL_Btm;

    unsigned int           VPSS_CFSTATH_STRIDE_INFO;
    U_VPSS_CFSTATH_STRIDE               VPSS_CFSTATH_STRIDE;

    unsigned int           VPSS_CFSTATH_SIZE_INFO;
    U_VPSS_CFSTATH_SIZE               VPSS_CFSTATH_SIZE;

    unsigned int           VPSS_CFSTATV_CTRL_INFO;
    U_VPSS_CFSTATV_CTRL               VPSS_CFSTATV_CTRL;

    unsigned int           VPSS_CFSTATV_CTRL_INFO_Btm;
    U_VPSS_CFSTATV_CTRL               VPSS_CFSTATV_CTRL_Btm;

    unsigned int           VPSS_CFSTATV_STRIDE_INFO;
    U_VPSS_CFSTATV_STRIDE               VPSS_CFSTATV_STRIDE;

    unsigned int           VPSS_CFSTATV_SIZE_INFO;
    U_VPSS_CFSTATV_SIZE               VPSS_CFSTATV_SIZE;

    unsigned int           VPSS_CFRGMV_CTRL_INFO;
    U_VPSS_CFRGMV_CTRL               VPSS_CFRGMV_CTRL;

    unsigned int           VPSS_CFRGMV_CTRL_INFO_Btm;
    U_VPSS_CFRGMV_CTRL               VPSS_CFRGMV_CTRL_Btm;

    unsigned int           VPSS_CFRGMV_STRIDE_INFO;
    U_VPSS_CFRGMV_STRIDE               VPSS_CFRGMV_STRIDE;

    unsigned int           VPSS_CFRGMV_SIZE_INFO;
    U_VPSS_CFRGMV_SIZE               VPSS_CFRGMV_SIZE;

    unsigned int           VPSS_OUT_CTRL_INFO;
    U_VPSS_OUT_CTRL               VPSS_OUT_CTRL;

    unsigned int           VPSS_OUTY_ADDR_LOW_INFO;
    U_VPSS_OUTY_ADDR_LOW               VPSS_OUTY_ADDR_LOW;

    unsigned int           VPSS_OUTC_ADDR_LOW_INFO;
    U_VPSS_OUTC_ADDR_LOW               VPSS_OUTC_ADDR_LOW;

    unsigned int           VPSS_OUT_STRIDE_INFO;
    U_VPSS_OUT_STRIDE               VPSS_OUT_STRIDE;

    unsigned int           VID_DTV_CFG_READY_INFO;
    U_VID_DTV_CFG_READY            VID_DTV_CFG_READY;

    unsigned int           WBC_DHD_HIPP_CSC_CTRL_INFO;
    U_WBC_DHD_HIPP_CSC_CTRL               WBC_DHD_HIPP_CSC_CTRL;

    unsigned int           WBC_DHD_HIPP_CSC_COEF00_INFO;
    U_WBC_DHD_HIPP_CSC_COEF00               WBC_DHD_HIPP_CSC_COEF00;

    unsigned int           WBC_DHD_HIPP_CSC_COEF01_INFO;
    U_WBC_DHD_HIPP_CSC_COEF01               WBC_DHD_HIPP_CSC_COEF01;

    unsigned int           WBC_DHD_HIPP_CSC_COEF02_INFO;
    U_WBC_DHD_HIPP_CSC_COEF02               WBC_DHD_HIPP_CSC_COEF02;

    unsigned int           WBC_DHD_HIPP_CSC_COEF10_INFO;
    U_WBC_DHD_HIPP_CSC_COEF10               WBC_DHD_HIPP_CSC_COEF10;

    unsigned int           WBC_DHD_HIPP_CSC_COEF11_INFO;
    U_WBC_DHD_HIPP_CSC_COEF11               WBC_DHD_HIPP_CSC_COEF11;

    unsigned int           WBC_DHD_HIPP_CSC_COEF12_INFO;
    U_WBC_DHD_HIPP_CSC_COEF12               WBC_DHD_HIPP_CSC_COEF12;

    unsigned int           WBC_DHD_HIPP_CSC_COEF20_INFO;
    U_WBC_DHD_HIPP_CSC_COEF20               WBC_DHD_HIPP_CSC_COEF20;

    unsigned int           WBC_DHD_HIPP_CSC_COEF21_INFO;
    U_WBC_DHD_HIPP_CSC_COEF21               WBC_DHD_HIPP_CSC_COEF21;

    unsigned int           WBC_DHD_HIPP_CSC_COEF22_INFO;
    U_WBC_DHD_HIPP_CSC_COEF22               WBC_DHD_HIPP_CSC_COEF22;

    unsigned int           WBC_DHD_HIPP_CSC_SCALE_INFO;
    U_WBC_DHD_HIPP_CSC_SCALE               WBC_DHD_HIPP_CSC_SCALE;

    unsigned int           WBC_DHD_HIPP_CSC_IDC0_INFO;
    U_WBC_DHD_HIPP_CSC_IDC0               WBC_DHD_HIPP_CSC_IDC0;

    unsigned int           WBC_DHD_HIPP_CSC_IDC1_INFO;
    U_WBC_DHD_HIPP_CSC_IDC1               WBC_DHD_HIPP_CSC_IDC1;

    unsigned int           WBC_DHD_HIPP_CSC_IDC2_INFO;
    U_WBC_DHD_HIPP_CSC_IDC2               WBC_DHD_HIPP_CSC_IDC2;

    unsigned int           WBC_DHD_HIPP_CSC_ODC0_INFO;
    U_WBC_DHD_HIPP_CSC_ODC0               WBC_DHD_HIPP_CSC_ODC0;

    unsigned int           WBC_DHD_HIPP_CSC_ODC1_INFO;
    U_WBC_DHD_HIPP_CSC_ODC1               WBC_DHD_HIPP_CSC_ODC1;

    unsigned int           WBC_DHD_HIPP_CSC_ODC2_INFO;
    U_WBC_DHD_HIPP_CSC_ODC2               WBC_DHD_HIPP_CSC_ODC2;

    unsigned int           WBC_DHD_HIPP_CSC_MIN_Y_INFO;
    U_WBC_DHD_HIPP_CSC_MIN_Y               WBC_DHD_HIPP_CSC_MIN_Y;

    unsigned int           WBC_DHD_HIPP_CSC_MIN_C_INFO;
    U_WBC_DHD_HIPP_CSC_MIN_C               WBC_DHD_HIPP_CSC_MIN_C;

    unsigned int           WBC_DHD_HIPP_CSC_MAX_Y_INFO;
    U_WBC_DHD_HIPP_CSC_MAX_Y               WBC_DHD_HIPP_CSC_MAX_Y;

    unsigned int           WBC_DHD_HIPP_CSC_MAX_C_INFO;
    U_WBC_DHD_HIPP_CSC_MAX_C               WBC_DHD_HIPP_CSC_MAX_C;

    unsigned int           VHDACCTHD1_INFO;
    U_VHDACCTHD1               VHDACCTHD1;

    unsigned int           VHDACCTHD2_INFO;
    U_VHDACCTHD2               VHDACCTHD2;

    unsigned int           VHDACCTHD2_INFO_Btm;
    U_VHDACCTHD2               VHDACCTHD2_Btm;

    unsigned int           VHDACCDEMO_INFO;
    U_VHDACCDEMO               VHDACCDEMO;

    unsigned int           VHDACCLOW1_INFO;
    U_VHDACCLOW1               VHDACCLOW1;

    unsigned int           VHDACCLOW2_INFO;
    U_VHDACCLOW2               VHDACCLOW2;

    unsigned int           VHDACCLOW3_INFO;
    U_VHDACCLOW3               VHDACCLOW3;

    unsigned int           VHDACCMED1_INFO;
    U_VHDACCMED1               VHDACCMED1;

    unsigned int           VHDACCMED2_INFO;
    U_VHDACCMED2               VHDACCMED2;

    unsigned int           VHDACCMED3_INFO;
    U_VHDACCMED3               VHDACCMED3;

    unsigned int           VHDACCHIGH1_INFO;
    U_VHDACCHIGH1               VHDACCHIGH1;

    unsigned int           VHDACCHIGH2_INFO;
    U_VHDACCHIGH2               VHDACCHIGH2;

    unsigned int           VHDACCHIGH3_INFO;
    U_VHDACCHIGH3               VHDACCHIGH3;

    unsigned int           VHDACM0_INFO;
    U_VHDACM0               VHDACM0;

    unsigned int           VHDACM1_INFO;
    U_VHDACM1               VHDACM1;

    unsigned int           VHDACM2_INFO;
    U_VHDACM2               VHDACM2;

    unsigned int           VHDACM3_INFO;
    U_VHDACM3               VHDACM3;

    unsigned int           VHDACM4_INFO;
    U_VHDACM4               VHDACM4;

    unsigned int           VHDACM5_INFO;
    U_VHDACM5               VHDACM5;

    unsigned int           VHDACM6_INFO;
    U_VHDACM6               VHDACM6;

    unsigned int           VHDACM7_INFO;
    U_VHDACM7               VHDACM7;

    unsigned int           VPSS_VC1_CTRL_INFO;
    U_VPSS_VC1_CTRL               VPSS_VC1_CTRL;

    unsigned int           WBC_DHD0_UPD_INFO;
    U_WBC_DHD0_UPD               WBC_DHD0_UPD;

    unsigned int           V0_UPD_INFO;
    U_V0_UPD               V0_UPD;

    unsigned int           V0_UPD_INFO_Btm;
    U_V0_UPD               V0_UPD_Btm;

    unsigned int           reserved_end;
    U_OFFLINE_UPD          OFFLINE_UPD;

} S_VDP_QF_REGS_TYPE;
#endif // __VDP_QFRM_REG_H__
