/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
  File Name     : hal_reg_cfg_manager.h
  Version       : Initial Draft
  Author        :
  Created       : 2017/11/22
  Last Modified :
  Description   : Reg config
  Function List :
  History       :
******************************************************************************/

#ifndef _HAL_REG_CFG_MANAGER_H_
#define _HAL_REG_CFG_MANAGER_H_

#include "hi_register_vdp.h"


#ifdef __cplusplus
#if __cplusplus
 extern "C"
{
#endif
#endif


#define RESTORE_OFFSET_ELE_NUM  2
#define OUT_STD_ELE_NUM         3

#define REG_ADDR_OFFSET(REG) ((HI_ULONG) &(((S_VDP_REGS_TYPE*)0)->REG))


/* List1 : Chipset config, value only */
#define VDP_CHIP_CFG_DHD0_CTRL_DEFAULT      0x00008011  /*Default DHD0_CTRL value for DHD*/
#define VDP_CHIP_CFG_DHD0_SYNC_INV_DEFAULT  0x2000      /*Default DHD0_SYNC_INV value for DHD*/
#define VDP_CHIP_CFG_DSD_CTRL_DEFAULT       0x00008011  /*Default DHD0_CTRL value for DSD*/
#define VDP_CHIP_CFG_DSD_SYNC_INV_DEFAULT   0x2000      /*Default DHD0_SYNC_INV value for DSD*/

/* List2 : Chipset config, choice only */
#define VDP_CHIP_CFG_CBM_MIX_2

/* List3 : Chipset config, choice and value */
//#define VDP_CHIP_CFG_MASTER0_RD_BUS1 0x2


/*CRG211 init config */
#define PERI_CRG211_INIT(CRG211, Rst)\
    {\
        (CRG211).bits.vdp_hd_cken       = (Rst) ? 0: 1;\
    }


/*CRG54 init config */
#define PERI_CRG54_INIT(CRG54, Rst)\
    {\
        (CRG54).bits.vo_bus_cken        = (Rst) ? 0: 1;\
        (CRG54).bits.vo_hd0_cken        = (Rst) ? 0: 1;\
        (CRG54).bits.vo_sd_cken         = (Rst) ? 0: 1;\
        (CRG54).bits.vo_sdate_cken      = (Rst) ? 0: 1;\
        (CRG54).bits.vdac_ch0_cken      = (Rst) ? 0: 1;\
        (CRG54).bits.vo_hd_clk_sel      = (Rst) ? (CRG54).bits.vo_hd_clk_sel: 1;\
        (CRG54).bits.vo_hd_clk_div      = (Rst) ? (CRG54).bits.vo_hd_clk_div: 0;\
        (CRG54).bits.vdp_clk_sel        = (Rst) ? (CRG54).bits.vdp_clk_sel:        0;\
        (CRG54).bits.vo_hd_hdmi_clk_sel = (Rst) ? (CRG54).bits.vo_hd_hdmi_clk_sel: 0;\
        (CRG54).bits.vdp_cfg_cken       = (Rst) ? 0: 1;\
    }

/*Config register offset used in saving/restoring register status*/
static HI_ULONG s_ulRestoreRegOffset[][RESTORE_OFFSET_ELE_NUM]
                = { {REG_ADDR_OFFSET(VOCTRL),           0x154},     /*0000~0150*/
                    {REG_ADDR_OFFSET(CBM_BKG1),         0xC},       /*0200~0208*/
                    {REG_ADDR_OFFSET(CBM_BKG2),         0xC},       /*0300~0308*/
                    {REG_ADDR_OFFSET(VPSS_REGLOAD_CFG), 0x30},       /*0800~082c*/
                    {REG_ADDR_OFFSET(ON_OFFLINE_MODE_CTRL), 0x100},  /*0900~09FC video layer*/
                    {REG_ADDR_OFFSET(LINK_CTRL), 0x4},               /*0c00~0C00 video layer*/
                    {REG_ADDR_OFFSET(PARA_ADDR_VHD_CHN00), 0x150},   /*0e00~0F4C video layer*/

                    //{REG_ADDR_OFFSET(V0_CTRL),         0x804}, /*2000~2800 video layer*/
                    //{REG_ADDR_OFFSET(V1_CTRL),         0x404}, /*3000~3400 video layer*/
                    //{REG_ADDR_OFFSET(VP0_CTRL),        0x204}, /*4000~4200 video layer*/
                    //{REG_ADDR_OFFSET(WBC_DHD0_CTRL),        0x604}, /*7000~7600 video layer*/
                    //{REG_ADDR_OFFSET(VDP_MST_OUTSTANDING),        0x104}, /*8000~8100 video layer*/
                    //{REG_ADDR_OFFSET(VID_READ_CTRL),        0x604}, /*8200~8800 video layer*/
                    //{REG_ADDR_OFFSET(VPSS_CHN_CFG_CTRL),        0xe04}, /*9600~a400 video layer*/
                    //{REG_ADDR_OFFSET(WBC_DHD_HIPP_CSC_CTRL),        0xf04}, /*b000~bf00 video layer*/
                    {REG_ADDR_OFFSET(DHD_TOP_CTRL),        0x10}, /*c000~c00c video layer*/
                    {REG_ADDR_OFFSET(DHD0_CTRL),        0x304}, /*c200~c500 video layer*/
                    {REG_ADDR_OFFSET(INTF_HDMI_CTRL),        0x20}, /*c600~c61c video layer*/
                    {REG_ADDR_OFFSET(INTF_DATE_CTRL),        0x4e4}, /*cA00~cee0 video layer*/
                   };

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif

