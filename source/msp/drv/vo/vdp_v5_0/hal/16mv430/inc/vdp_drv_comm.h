#ifndef __DRV_COMM_H__
#define __DRV_COMM_H__

#include "drv_hal_common.h"
#include "vdp_define.h"
#include "vdp_hal_comm.h"
#include "vdp_hal_ip_para.h"
#include "vdp_qfrm_reg.h"

//----------------------------------------------------------------------
// address distrubite
//----------------------------------------------------------------------
#define  VDP_CFG_TUNL_SIZE        32
#define  VDP_CFG_NODE_SIZE        ((sizeof(S_VDP_QF_REGS_TYPE)+15)/16*16)
#define  VDP_ALL_NODE_SIZE        (VDP_CFG_NODE_SIZE * 20)+VDP_CFG_TUNL_SIZE*20
#define  VPSS_REG_CFG_SIZE        sizeof(S_VPSS_REGS_TYPE)
#define  VPSS_CHN_BUF_SIZE        (1920*1080*2*24)
#define  VPSS_WSTT_BUF_SIZE       2*sizeof(S_VPSS_STT_REGS_TYPE)

#ifdef HI_FPGA_SUPPORT
#define XDP_ROUTSTD               15
#else
#define XDP_ROUTSTD               7

#define XDP_VDP_MST_CTRL_ARBMODE  0
#define XDP_VDP_MST_CTRL_MULTIID  HI_TRUE
#endif

#define XDP_VID_MAC_CTRL_PRE_READ_ENABLE_STATUS  HI_TRUE

#define XDP_WOUTSTD               7
#define XDP_START_POS             15
#define XDP_PARALOAD_POS          6
#define XDP_ONANDOFF_SWITCH_POS   2
#define XDP_QFREAM_SWITCH_POS     3
#define XDP_OFFLINE_START_POS     4

#define XDP_OFFLINE_TIMEOUT       6000000// 120*10^6/20;

#define XDP_MAX_OUTWTH               1920
#define XDP_MAX_OUTHGT               1080

#define XDP_MAX_WTH               1920
#define XDP_MAX_HGT               1088
#define XDP_VPSSIP_PQMASK_INIT    0x000001fe
#define VPSSIP_W_720P             720
#define VPSSIP_H_720P             576
#define XDP_VPSSIP_PQ_BUFSIZE     2304   //hi_vdp_reg.h //0xB600~0xBE5C//0xB700~0xBF00=8x256Byte=2048
#define XDP_VPSSIP_STT_BUFSIZE    9928  //vpss_stt.h //0x0000~0x26C4

typedef struct hiVDP_MMZ_BUFFER_S
{
    HI_U8* pu8StartVirAddr;
    HI_U32 u32StartVirAddr;
    HI_U32 u32StartPhyAddr;
    HI_U32 u32StartSmmuAddr;
    HI_U32 u32Size;
}VDP_MMZ_BUFFER_S;

typedef struct hiVPSS_REGCFG_ADDR_S
{
    VDP_MMZ_BUFFER_S         stBufBaseAddr   ;
    HI_U32                  u32size         ;
}VPSS_REGCFG_ADDR_S;

typedef struct hiVPSS_CHNBUF_ADDR_S
{
    MMZ_BUFFER_S             stBufBaseAddr   ;
    HI_U32                  u32size         ;
}VPSS_CHNBUF_ADDR_S;

typedef struct hiVPSS_WSTTBUF_ADDR_S
{
    VDP_MMZ_BUFFER_S         stBufBaseAddr   ;
    HI_U32                  u32size         ;
}VPSS_WSTTBUF_ADDR_S;

//-------------------------------------------------------------------
// function
//-------------------------------------------------------------------
HI_S32 VDP_DRV_AllocateMem(HI_U32 u32Size,VDP_MMZ_BUFFER_S *stVdpMmzBuffer);

HI_S32 VPSS_DRV_AllocateCfgMem(HI_U32 u32Size, VDP_MMZ_BUFFER_S* stVpssMmzBuffer);

#endif//__DRV_COMM_H__
