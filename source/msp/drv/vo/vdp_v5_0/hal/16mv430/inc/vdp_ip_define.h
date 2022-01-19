#ifndef _VDP_IP_DEFINE_H_
#define _VDP_IP_DEFINE_H_

#include "hi_type.h"

//-----------------------------------
//module define
//-----------------------------------
#define MIXG_EN        1
#define CDS_EN         1
//-----------------------------------
//OFFSET define, for driver
//-----------------------------------
#define VID_OFFSET        0x1000
#define GFX_OFFSET        0x800
#define CHN_OFFSET        0x200
#define WBC_OFFSET        0x800

#define VID_FDR_OFFSET    0x200
#define GFX_FDR_OFFSET    0x200
#define WBC_FDR_OFFSET    0x200
#define VID_HFIR_OFFSET   0xD00
//-----------------------------------
//Addr define, for driver
//-----------------------------------

//-----------------------------------
//value define:
//-----------------------------------
#define  ZME_HPREC        (1<<20)
#define  ZME_VPREC        (1<<12)
//-----------------------------------
//Assertion define
//-----------------------------------

//-----------------------------------
//System
//-----------------------------------
typedef enum
{
    VDP_AXI_EDGE_MODE_128  = 0,
    VDP_AXI_EDGE_MODE_256 ,
    VDP_AXI_EDGE_MODE_1024,
    VDP_AXI_EDGE_MODE_2048,
    VDP_AXI_EDGE_MODE_4096,
    VDP_AXI_EDGE_MODE_BUTT
}VDP_AXI_EDGE_MODE_E;

typedef enum
{
    VDP_REQ_CTRL_16BURST_1 = 0,
    VDP_REQ_CTRL_16BURST_2,
    VDP_REQ_CTRL_16BURST_4,
    VDP_REQ_CTRL_16BURST_8,
    VDP_REQ_CTRL_BUTT

}VDP_REQ_CTRL_E;

typedef enum
{
    VDP_REQ_LENGTH_16 = 0,
    VDP_REQ_LENGTH_8  ,
    VDP_REQ_LENGTH_BUTT
}VDP_REQ_LENGTH_E;

typedef enum tagVDP_INTMSK_E
{
    VDP_INTMSK_NONE        = 0,

    VDP_INTMSK_DHD0_VTTHD  = 0x1,
    VDP_INTMSK_DHD0_VTTHD2 = 0x2,
    VDP_INTMSK_DHD0_VTTHD3 = 0x4,
    VDP_INTMSK_DHD0_UFINT  = 0x8,

    VDP_INTMSK_DHD1_VTTHD  = 0x10,
    VDP_INTMSK_DHD1_VTTHD2 = 0x20,
    VDP_INTMSK_DHD1_VTTHD3 = 0x40,
    VDP_INTMSK_DHD1_UFINT  = 0x80,

    VDP_INTMSK_WBC_GP0_INT = 0x400,
    VDP_INTMSK_WBC_HD0_INT = 0x200,//Y
    VDP_INTMSK_WBC_G0_INT  = 0x400,//Y

    VDP_INTMSK_VPSS_INT         = 0x2000,//(1<<13),//Y
    VDP_INTMSK_V0_TUNEL_INT     = 0x4000,//(1<<14),//Y
    VDP_INTMSK_DTV_BACK_INT     = 0x8000,//(1<<15),//Y
    VDP_INTMSK_OFF_ONLI_INT     = 0x80000,//(1<<19),//Y

    VDP_INTMSK_VDAC0_INT   = 0x100000,//Y
    VDP_INTMSK_LOWDLY_INT  = 0x20000000,//Y
    VDP_INTMSK_BUSEERINT   = 0x40000000,//Y

    HAL_INTMSK_ALL         = 0xffffffff

}VDP_INTMSK_E;

typedef enum tagVDP_OFL_INTMSK_E
{
    VDP_OFL_INTMSK_NONE         = 0,
    VDP_OFL_INTMSK_FRM_END_INT      = 0x1,
    VDP_OFL_INTMSK_FRM_TIMEOUT0_INT = 0x2,
    VDP_OFL_INTMSK_FRM_TIMEOUT1_INT = 0x4,

    VDP_OFL_INTMSK_WBC_ALL_INT  = 0x80,
    VDP_OFL_INTMSK_WBC_GP0_INT  = 0x100,
    VDP_OFL_INTMSK_WBC_HD0_INT  = 0x200,
    VDP_OFL_INTMSK_WBC_G0_INT   = 0x400,
    VDP_OFL_INTMSK_WBC_G4_INT   = 0x800,
    VDP_OFL_INTMSK_WBC_ME_INT   = 0x1000,
    VDP_OFL_INTMSK_WBC_FI_INT   = 0x2000,
    VDP_OFL_INTMSK_WBC_BMP_INT  = 0x4000,
    VDP_OFL_INTMSK_HC_BMP_INT   = 0x6000,

    HAL_OFL_INTMSK_ALL          = 0xffffffff

}VDP_OFL_INTMSK_E;

typedef enum tagVDP_LAYER_VID_E
{
    VDP_LAYER_VID0  = 0,
    VDP_LAYER_VID1  = 1,
    VDP_LAYER_VID2  = 2,
    VDP_LAYER_VF    = 2,
    VDP_LAYER_VID3  = 3,
    VDP_LAYER_VID4  = 4,
    VDP_LAYER_VID5  = 5,
    VDP_LAYER_VID6  = 6,//for FI pixel
    VDP_LAYER_VID7  = 7,//for FI info

    VDP_LAYER_SD0 = VDP_LAYER_VID3,
    VDP_LAYER_VID_BUTT

} VDP_LAYER_VID_E;

typedef enum tagVDP_LAYER_GFX_E
{
    VDP_LAYER_GFX0  = 0,
    VDP_LAYER_GFX1  = 1,
    VDP_LAYER_GFX2  = 2,
    VDP_LAYER_GFX3  = VDP_LAYER_GFX2,
    VDP_LAYER_GFX4  = 4,
    VDP_LAYER_GFX5  = 5,

    VDP_LAYER_GFX_BUTT

} VDP_LAYER_GFX_E;

typedef enum tagVDP_LAYER_VP_E
{
    VDP_LAYER_VP0   = 0,
    VDP_LAYER_VP1   = 1,
    VDP_LAYER_DHD0   = 2,

    VDP_LAYER_VP_BUTT

} VDP_LAYER_VP_E;

typedef enum tagVDP_LAYER_GP_E
{
    VDP_LAYER_GP0   = 0,
    VDP_LAYER_GP1   = 1,

    VDP_LAYER_GP_BUTT

} VDP_LAYER_GP_E;

typedef enum tagVDP_LAYER_WBC_E
{
    VDP_LAYER_WBC_HD0        = 0,
    VDP_LAYER_WBC_GP0        = 1,
    VDP_LAYER_WBC_G0         = 2,
    VDP_LAYER_WBC_VP0        = 3,
    VDP_LAYER_WBC_G4         = 3,
    VDP_LAYER_WBC_ME         = 5,
    VDP_LAYER_WBC_FI         = 6,
    VDP_LAYER_WBC_BMP        = 7,
    VDP_LAYER_HC_BMP         = 8,
    VDP_LAYER_WBC_TNR_REF    = 9,
    VDP_LAYER_WBC_TNR_MAD    = 10,
    VDP_LAYER_WBC_TNR_STT3   = 11,
    VDP_LAYER_WBC_DBM_STT1   = 12,
    VDP_LAYER_WBC_DBM_STT2   = 13,

    VDP_LAYER_WBC_BUTT

} VDP_LAYER_WBC_E;

typedef enum tagVDP_CHN_E
{
    VDP_CHN_DHD0    = 0,
    VDP_CHN_DHD1    = 1,
    VDP_CHN_DSD0    = 2,
    VDP_CHN_WBC0    = 3,
    VDP_CHN_WBC1    = 4,
    VDP_CHN_WBC2    = 5,
    VDP_CHN_WBC3    = 6,
    VDP_CHN_NONE    = 7,
    VDP_CHN_BUTT

} VDP_CHN_E;

typedef enum tagVDP_DATA_RMODE_E
{
    VDP_RMODE_INTERLACE   = 0,
    VDP_RMODE_INTERFACE   = 0,
    VDP_RMODE_PROGRESSIVE = 1,
    VDP_RMODE_TOP         = 2,
    VDP_RMODE_BOTTOM      = 3,
    VDP_RMODE_PRO_TOP     = 4,
    VDP_RMODE_PRO_BOTTOM  = 5,
    VDP_RMODE_PRO_INTERFACE = 6,
    VDP_RMODE_BUTT

} VDP_DATA_RMODE_E;

typedef enum tagVDP_PROC_FMT_E
{
    VDP_PROC_FMT_SP_420      = 0x0,
    VDP_PROC_FMT_SP_422      = 0x1,
    VDP_PROC_FMT_SP_444      = 0x2,//plannar,in YUV color domain
    VDP_PROC_FMT_SP_400      = 0x3,//plannar,in YUV color domain
    VDP_PROC_FMT_RGB_888     = 0x3,//package,in RGB color domain
    VDP_PROC_FMT_RGB_444     = 0x4,//plannar,in RGB color domain

    VDP_PROC_FMT_BUTT

}VDP_PROC_FMT_E;

typedef enum tagVDP_PROC_WBCFMT_E
{
    VDP_PROC_WBCFMT_SP_422      = 0x0,
    VDP_PROC_WBCFMT_SP_420      = 0x1,
    VDP_PROC_WBCFMT_SP_444      = 0x2,//plannar,in YUV color domain
    VDP_PROC_WBCFMT_SP_400      = 0x3,//plannar,in YUV color domain
    VDP_PROC_WBCFMT_RGB_888     = 0x3,//package,in RGB color domain
    VDP_PROC_WBCFMT_RGB_444     = 0x4,//plannar,in RGB color domain

    VDP_PROC_WBCFMT_BUTT

}VDP_PROC_WBCFMT_E;


typedef struct tagVDP_DISP_RECT_S
{
    HI_U32 u32SX;   // source horizontal start position
    HI_U32 u32SY;   // source vertical start position

    HI_U32 u32DXS;  // dispaly horizontal start position
    HI_U32 u32DYS;  // display vertical start position

    HI_U32 u32DXL;  // dispaly horizontal end position
    HI_U32 u32DYL;  // display vertical end position

    HI_U32 u32VX;   // video horizontal start position
    HI_U32 u32VY;   // video vertical start position

    HI_U32 u32VXL;  // video horizontal start position
    HI_U32 u32VYL;  // video vertical start position

    HI_U32 u32IWth; // input width
    HI_U32 u32IHgt; // input height
    HI_U32 u32OWth; // output width
    HI_U32 u32OHgt; // output height

} VDP_DISP_RECT_S;

typedef struct
{
    HI_U32 u32X;
    HI_U32 u32Y;

    HI_U32 u32Wth;
    HI_U32 u32Hgt;

} VDP_RECT_S;

//-----------------------------------
//video layer
//-----------------------------------
typedef enum tagVDP_DATA_WTH
{
    VDP_DATA_WTH_8  = 0,
    VDP_DATA_WTH_10 = 1,
    VDP_DATA_WTH_16 = 2,
    VDP_DATA_WTH_10_CTS = 3,
    VDP_DATA_WTH_BUTT
}VDP_DATA_WTH;

typedef enum tagVDP_VID_DATA_FMT_E
{
    VDP_VID_DATA_FMT_LINEAR  = 0x0,
    VDP_VID_DATA_FMT_TILE    = 0x1,
    VDP_VID_DATA_FMT_PKG     = 0x2,
    VDP_VID_DATA_FMT_AFBC    = 0x3,
    VDP_VID_DATA_FMT_BUTT

}VDP_VID_DATA_FMT_E;

typedef enum tagVDP_VID_DATA_TYPE_E
{
    VDP_VID_DATA_TYPE_YUV400   = 0x1,
    VDP_VID_DATA_TYPE_YUV420   = 0x2,
    VDP_VID_DATA_TYPE_YUV422   = 0x3,
    VDP_VID_DATA_TYPE_YUV444   = 0x4,
    VDP_VID_DATA_TYPE_RGB888   = 0x5,
    VDP_VID_DATA_TYPE_ARGB8888 = 0x6,
    VDP_VID_DATA_TYPE_BUTT

}VDP_VID_DATA_TYPE_E;

typedef enum tagVDP_VID_IFMT_E
{
    VDP_VID_IFMT_SP_400      = 0x1,
    VDP_VID_IFMT_SP_TILE_400 = 0x2,
    VDP_VID_IFMT_SP_420      = 0x3,
    VDP_VID_IFMT_SP_422      = 0x4,
    VDP_VID_IFMT_SP_444      = 0x5,
    VDP_VID_IFMT_SP_TILE     = 0x6,
    VDP_VID_IFMT_SP_TILE_64  = 0x7,
    VDP_VID_IFMT_RGB_888     = 0x8,
    VDP_VID_IFMT_PKG_UYVY    = 0x9,
    VDP_VID_IFMT_PKG_YUYV    = 0xa,
    VDP_VID_IFMT_PKG_YVYU    = 0xb,
    VDP_VID_IFMT_PKG_12      = 0xc,
    VDP_VID_IFMT_PKG_444     = 0xc,
    VDP_VID_IFMT_PKG_888     = 0xd,
    VDP_VID_IFMT_PKG_8888    = 0xe,
    VDP_VID_IFMT_PKG_YUV444  = 0xe,
    VDP_VID_IFMT_ARGB_8888   = 0xf,
    VDP_VID_IFMT_SP_422V     = 0x10,
    VDP_VID_IFMT_BUTT

}VDP_VID_IFMT_E;

typedef enum tagVDP_DRAW_MODE_E
{
    VDP_DRAW_MODE_1 = 0,
    VDP_DRAW_MODE_2 = 1,
    VDP_DRAW_MODE_4 = 2,
    VDP_DRAW_MODE_8 = 3,
    VDP_DRAW_MODE_16 = 4,

    VDP_DRAW_MODE_BUTT
}VDP_DRAW_MODE_E;

typedef enum tagVDP_DRAW_PIXEL_MODE_E
{
    VDP_DRAW_PIXEL_MODE_1 = 0,
    VDP_DRAW_PIXEL_MODE_2 = 1,
    VDP_DRAW_PIXEL_MODE_4 = 2,
    VDP_DRAW_PIXEL_MODE_8 = 3,

    VDP_DRAW_PIXEL_MODE_BUTT
}VDP_DRAW_PIXEL_MODE_E;


//-----------------------------------
//wbc layer
//-----------------------------------
typedef enum tagVDP_WBC_FMT_E
{
    VDP_WBC_OFMT_PKG_UYVY = 0,
    VDP_WBC_OFMT_PKG_YUYV = 1,
    VDP_WBC_OFMT_PKG_YVYU = 2,
    VDP_WBC_OFMT_ARGB8888 = 3,
    VDP_WBC_OFMT_SP420    = 4,
    VDP_WBC_OFMT_SP422    = 5,
    VDP_WBC_OFMT_SP400    = 7,

    VDP_WBC_OFMT_BUUT

}VDP_WBC_OFMT_E;

typedef enum tagVDP_WBC_WLEN_E
{
    VDP_WBC_BURST_16 = 0,
    VDP_WBC_BURST_8  = 1,
    VDP_WBC_BURST_4  = 2,

    VDP_WBC_BURST_BUUT

}VDP_WBC_WLEN_E;

typedef enum tagVDP_WBC_PARA_E
{
    VDP_WBC_PARA_ZME_HORL = 0,
    VDP_WBC_PARA_ZME_HORC  ,
    VDP_WBC_PARA_ZME_VERL  ,
    VDP_WBC_PARA_ZME_VERC  ,

    VDP_WBC_GTI_PARA_ZME_HORL  ,
    VDP_WBC_GTI_PARA_ZME_HORC  ,
    VDP_WBC_GTI_PARA_ZME_VERL  ,
    VDP_WBC_GTI_PARA_ZME_VERC  ,

    VDP_WBC_PARA_ZME_HOR   ,
    VDP_WBC_PARA_ZME_VER   ,

    VDP_WBC_PARA_BUTT
} VDP_WBC_PARA_E;

//-----------------------------------
//channel & interface
//-----------------------------------
typedef struct tagVDP_DISP_SYNCINFO_S
{
    HI_U32  bSynm;
    HI_U32  bIop;
    HI_U32  u32Intfb;

    HI_U32  u32Vact ;
    HI_U32  u32Vbb;
    HI_U32  u32Vfb;

    HI_U32  u32Hact;
    HI_U32  u32Hbb;
    HI_U32  u32Hfb;

    HI_U32  u32Bvact;
    HI_U32  u32Bvbb;
    HI_U32  u32Bvfb;

    HI_U32  u32Hpw;
    HI_U32  u32Vpw;
    HI_U32  u32Hmid;

    HI_U32  bIdv;
    HI_U32  bIhs;
    HI_U32  bIvs;

} VDP_DISP_SYNCINFO_S;

typedef struct tagVDP_DISP_SYNCINV_S
{
    HI_U32  u32FdInv;//Field
    HI_U32  u32VsInv;
    HI_U32  u32HsInv;
    HI_U32  u32DvInv;

} VDP_DISP_SYNCINV_S;

typedef enum tagVDP_DISP_MODE_E
{
    VDP_DISP_MODE_2D  = 0,
    VDP_DISP_MODE_SBS = 1,
    VDP_DISP_MODE_LBL = 2,
    VDP_DISP_MODE_FS  = 3,
    VDP_DISP_MODE_TAB = 4,
    VDP_DISP_MODE_FP  = 5,

    VDP_DISP_MODE_BUTT
}VDP_DISP_MODE_E;

typedef enum tagVDP_CBM_MIX_E
{
    VDP_CBM_MIXV0 = 0,
    VDP_CBM_MIXV1 = 1,
    VDP_CBM_MIXG0 = 2,
    VDP_CBM_MIXG1 = 3,
    VDP_CBM_MIX0  = 4,
    VDP_CBM_MIX1  = 5,
    VDP_CBM_MIX2  = 6,

    VDP_CBM_MIX_BUTT
}VDP_CBM_MIX_E;

typedef enum tagVDP_CBM_LAYER_E
{
    //MIX0-DHD0
    VDP_CBM_VP0  = 0x1,
    VDP_CBM_GP0  = 0x2,

    //MIX1-MIX_4K
    VDP_CBM_VP1  = 0x1,
    VDP_CBM_GP1  = 0x2,

    //MIX2-DSD0
    VDP_CBM_VID3 = 0x1,
    VDP_CBM_VID4 = 0x2,
    //VDP_CBM_GP1  = 0x3,
    VDP_CBM_GFX4 = 0x3,
    VDP_CBM_GFX3 = 0x4,

    VDP_CBM_BUTT
}VDP_CBM_LAYER_E;

typedef enum
{
    //zreo means no layer driver;
    VDP_PRIO_MIXV0_VID0 = 0x1,
    VDP_PRIO_MIXV0_VID1 = 0x2,

    VDP_PRIO_MIXG0_GFX0 = 0x1,
    VDP_PRIO_MIXG0_GFX1 = 0x2,
    VDP_PRIO_MIXG0_GFX2 = 0x3,
    VDP_PRIO_MIXG0_GFX3 = 0x4,

    //DHD0 without VP/GP
    VDP_PRIO_CBM0_VID0  = 0x1,
    VDP_PRIO_CBM0_GFX0  = 0x2,
    VDP_PRIO_CBM0_VID1  = 0x9,//PIP
    VDP_PRIO_CBM0_GFX2  = 0xa,//HC

    //DHD0 with VP/GP
    VDP_PRIO_CBM0_VP0   = 0x1,
    VDP_PRIO_CBM0_GP0   = 0x2,

    //DHD1
    VDP_PRIO_CBM1_VID3  = 0x1,
    VDP_PRIO_CBM1_VID4  = 0x2,
    VDP_PRIO_CBM1_GP1   = 0x3,
    VDP_PRIO_CBM1_GFX4  = 0x3,
    VDP_PRIO_CBM1_GFX3  = 0x4,//HC
}VDP_PRIO_E;

typedef enum tagVDP_DISP_DIGFMT_E
{
    VDP_DISP_DIGFMT_PAL    = 0 ,
    VDP_DISP_DIGFMT_NTSC       ,
    VDP_DISP_DIGFMT_1080P50    ,
    VDP_DISP_DIGFMT_1080P60    ,
    VDP_DISP_DIGFMT_1080I50    ,
    VDP_DISP_DIGFMT_1080I60    ,
    VDP_DISP_DIGFMT_720P50     ,
    VDP_DISP_DIGFMT_720P60     ,
    VDP_DISP_DIGFMT_800x600    ,
    VDP_DISP_DIGFMT_576P       ,
    VDP_DISP_DIGFMT_576I       ,
    VDP_DISP_DIGFMT_480P       ,
    VDP_DISP_DIGFMT_480P24     ,
    VDP_DISP_DIGFMT_480I       ,
    VDP_DISP_DIGFMT_1600P60    ,//2560x1600
    VDP_DISP_DIGFMT_2160P60    ,//3840x2160
    VDP_DISP_DIGFMT_2160P50    ,//3840x2160
    VDP_DISP_DIGFMT_2160P60_HBI,//3840x2160
    VDP_DISP_DIGFMT_2160P30    ,//3840x2160
    VDP_DISP_DIGFMT_4096x2160P60,
    VDP_DISP_DIGFMT_2160P120   ,//3840x1080@120
    VDP_DISP_DIGFMT_TESTI      ,
    VDP_DISP_DIGFMT_TESTP      ,
    VDP_DISP_DIGFMT_TESTS      ,
    VDP_DISP_DIGFMT_TESTUT     ,
    VDP_DISP_DIGFMT_1080P_24_FP,
    VDP_DISP_DIGFMT_720P50_FP,
    VDP_DISP_DIGFMT_4096x2160_24HZ,
    VDP_DISP_DIGFMT_4096x2160_30HZ,
    VDP_DISP_DIGFMT_4096x2160_50HZ,
    VDP_DISP_DIGFMT_1080P30,
    VDP_DISP_DIGFMT_1080P_24,
      VDP_DISP_DIGFMT_1080P_25,
    VDP_DISP_DIGFMT_4096x2160P24,
    VDP_DISP_DIGFMT_4096x2160P30,
    VDP_DISP_DIGFMT_BUTT
} VDP_DISP_DIGFMT_E;

typedef enum tagVDP_DISP_INTF_E
{
    VDP_DISP_INTF_HDMI   = 0,
    VDP_DISP_INTF_VGA    = 1,
    VDP_DISP_INTF_BT1120 = 2,
    VDP_DISP_INTF_SDDATE = 3,
    VDP_DISP_INTF_CVBS   = 3,
    VDP_DISP_INTF_LCD    = 4,
    VDP_DISP_INTF_HDDATE = 5,
    VDP_DISP_INTF_BUTT   = 6,
} VDP_DISP_INTF_E;

typedef struct tagVDP_DISP_CLIP_S
{
    HI_U32   bClipEn;
    HI_U32   u32ClipLow_y;
    HI_U32   u32ClipLow_cb;
    HI_U32   u32ClipLow_cr;

    HI_U32   u32ClipHigh_y;
    HI_U32   u32ClipHigh_cb;
    HI_U32   u32ClipHigh_cr;

} VDP_DISP_CLIP_S;

typedef enum tagVDP_DISP_PARA_E
{
    VDP_DISP_PARA_GMM_R    = 0x0,//for coef read
    VDP_DISP_PARA_GMM_G    = 0x2,//for coef read
    VDP_DISP_PARA_GMM_B    = 0x4,//for coef read
    VDP_DISP_PARA_GMM      = 0x8,//for paraup

    VDP_DISP_PARA_ZME_HORL = 0x10,//for coef read and para up
    VDP_DISP_PARA_ZME_HORC = 0x20,//for coef read and para up
    VDP_DISP_PARA_ZME_VERL = 0x40,//for coef read and para up
    VDP_DISP_PARA_ZME_VERC = 0x80,//for coef read and para up

    VDP_DISP_PARA_ZME_HOR  = 0x81,//for para up
    VDP_DISP_PARA_ZME_VER  = 0x82,//for para up

    VDP_DISP_PARA_DIM_LUT = 0x100,//for coef read and para up
    VDP_DISP_PARA_DIM_HF  = 0x200,//for coef read and para up
    VDP_DISP_PARA_DIM_VF  = 0x400,//for coef read and para up


    VDP_DISP_PARA_BUTT
} VDP_DISP_PARA_E;

typedef enum tagVDP_INTF_SPLIT_MODE_E
{

    VDP_SPLIT_MODE_4P_1SPLIT = 0,
    VDP_SPLIT_MODE_4P_4SPLIT = 1,
    VDP_SPLIT_MODE_2P_1SPLIT = 2,
    VDP_SPLIT_MODE_2P_2SPLIT = 3,
    VDP_SPLIT_MODE_2P_ODDEVEN= 4,
    VDP_SPLIT_MODE_1P_1SPLIT = 5,
    VDP_SPLIT_MODE_2P_BYPASS = 6,
    VDP_SPLIT_MODE_4P_2SPLIT = 7,
    VDP_INTF_SPLIT_MODE_BUTT
}VDP_INTF_SPLIT_MODE_E;

//-----------------------------------
//IP define
//-----------------------------------
typedef enum
{
    VDP_ZME_MODE_HOR = 0,
    VDP_ZME_MODE_VER,

    VDP_ZME_MODE_HORL,
    VDP_ZME_MODE_HORC,
    VDP_ZME_MODE_VERL,
    VDP_ZME_MODE_VERC,

    VDP_ZME_MODE_ALPHA,
    VDP_ZME_MODE_ALPHAV,
    VDP_ZME_MODE_VERT,
    VDP_ZME_MODE_VERB,
    VDP_ZME_MODE_VERBL,
    VDP_ZME_MODE_VERBC,
    VDP_ZME_MODE_ALL,
    VDP_ZME_MODE_NONL,
    VDP_ZME_MODE_BUTT

}VDP_ZME_MODE_E;

typedef enum tagVDP_HZME_MODE_E
{
    VDP_HZME_MODE_COPY   = 0,
    VDP_HZME_MODE_FIR   = 1,
    VDP_HZME_MODE_BUTT

} VDP_HZME_MODE_E;

typedef enum tagVDP_ZME_FIR_MODE_E
{
    VDP_ZME_FIR_MODE_COPY   = 0,
    VDP_ZME_FIR_MODE_FIR   = 1,
    VDP_ZME_FIR_MODE_BUTT

} VDP_ZME_FIR_MODE_E;


typedef enum tagXDP_ZME_SHOOT_E
{
    XDP_ZME_SHOOT_HOR   = 0,
    XDP_ZME_SHOOT_VER   = 1,
    XDP_ZME_SHOOT_BUTT

} XDP_ZME_SHOOT_E;

typedef enum
{
    VDP_TI_MODE_LUM = 0,
    VDP_TI_MODE_CHM,

    VDP_TI_MODE_ALL,
    VDP_TI_MODE_NON,
    VDP_TI_MODE_BUTT

}VDP_TI_MODE_E;

typedef enum tagVDP_DITHER_E
{
    VDP_DITHER_DROP_10   = 0,
    VDP_DITHER_TMP_10    = 1,
    VDP_DITHER_SPA_10    = 2,
    VDP_DITHER_TMP_SPA_8 = 3,
    VDP_DITHER_ROUND_10  = 4,
    VDP_DITHER_ROUND_8   = 5,
    VDP_DITHER_DISEN     = 6,
    VDP_DITHER_BUTT
} VDP_DITHER_E;

typedef struct
{
    HI_U32 dither_coef0;
    HI_U32 dither_coef1;
    HI_U32 dither_coef2;
    HI_U32 dither_coef3;

    HI_U32 dither_coef4;
    HI_U32 dither_coef5;
    HI_U32 dither_coef6;
    HI_U32 dither_coef7;
} VDP_DITHER_COEF_S;

typedef enum tagVDP_IFIRMODE_E
{
    VDP_IFIRMODE_DISEN = 0,
    VDP_IFIRMODE_COPY,
    VDP_IFIRMODE_DOUBLE,
    VDP_IFIRMODE_6TAPFIR,

    VDP_IFIRMODE_BUTT
}VDP_IFIRMODE_E;

typedef struct tagVDP_BKG_S
{
    HI_U32 u32BkgY;
    HI_U32 u32BkgU;
    HI_U32 u32BkgV;

    HI_U32 u32BkgA;

    HI_U32 bBkType;

} VDP_BKG_S;
//add for mute bk
typedef struct tagVDP_MUTE_BK_S
{
    HI_U32 u32MuteBkgA;
    HI_U32 u32MuteBkgY;
    HI_U32 u32MuteBkgU;
    HI_U32 u32MuteBkgV;

} VDP_MUTE_BK_S;

typedef enum tagVDP_CSC_MODE_E
{
    VDP_CSC_YUV2RGB_601 = 0      , /* YCbCr_601 L  -> RGB */
    VDP_CSC_YUV2RGB_709          , /* YCbCr_709 L  -> RGB */
    VDP_CSC_RGB2YUV_601          , /* RGB          -> YCbCr_601 L */
    VDP_CSC_RGB2YUV_709          , /* RGB          -> YCbCr_709 L */
    VDP_CSC_YUV2YUV_709_601      , /* YCbCr_709 L  -> YCbCr_601 L */
    VDP_CSC_YUV2YUV_601_709      , /* YCbCr_601 L  -> YCbCr_709 L */
    VDP_CSC_YUV2YUV              , /* YCbCr L      -> YCbCr L */

    VDP_CSC_RGB2RGB_709_2020     , /* RGB_709      -> RGB_2020 */
    VDP_CSC_RGB2YUV_2020_2020_L  , /* RGB_2020     -> YCbCr_2020 L */
    VDP_CSC_YUV2RGB_2020_2020_L  , /* YCbCr_2020 L -> RGB_2020 */
    VDP_CSC_RGB2RGB_2020_709     , /* RGB_2020     -> RGB_709 */
    VDP_CSC_RGB2RGB_601_2020     , /* RGB_601      -> RGB_2020 */
    VDP_CSC_RGB2RGB_2020_601     , /* RGB_2020     -> RGB_601 */

    VDP_CSC_YUV2YUV_2020_601_L_L , /* YCbCr_2020 L -> YCbCr_601 L */
    VDP_CSC_RGB2YUV_2020_601_L   , /* RGB_2020     -> YCbCr_601 L */

    VDP_CSC_YUV2RGB_601_FULL     , /* YCbCr_601 F  -> RGB */
    VDP_CSC_YUV2RGB_709_FULL     , /* YCbCr_709 F  -> RGB */
    VDP_CSC_RGB2YUV_601_FULL     , /* RGB          -> YCbCr_601 F */
    VDP_CSC_RGB2YUV_709_FULL     , /* RGB          -> YCbCr_709 F */
    VDP_CSC_YUV2YUV_709_F_601_L  , /* YCbCr_709 F    -> YCbCr_601 L */
    VDP_CSC_RGB2RGB              , /* RGB          -> RGB */


    //for EDA test
    VDP_CSC_YUV2YUV_MAX    ,
    VDP_CSC_YUV2YUV_MIN    ,
    VDP_CSC_YUV2YUV_RAND   ,

    VDP_CSC_BUTT
} VDP_CSC_MODE_E;

typedef struct
{
    HI_S32 csc_coef00;
    HI_S32 csc_coef01;
    HI_S32 csc_coef02;

    HI_S32 csc_coef10;
    HI_S32 csc_coef11;
    HI_S32 csc_coef12;

    HI_S32 csc_coef20;
    HI_S32 csc_coef21;
    HI_S32 csc_coef22;

} VDP_CSC_COEF_S;

typedef struct
{
    HI_S32 csc_in_dc0;
    HI_S32 csc_in_dc1;
    HI_S32 csc_in_dc2;

    HI_S32 csc_out_dc0;
    HI_S32 csc_out_dc1;
    HI_S32 csc_out_dc2;
} VDP_CSC_DC_COEF_S;

typedef enum
{
    VDP_WBC_ROOT_PATH_ACBM = 0,
    VDP_WBC_ROOT_PATH_BZME,
    VDP_WBC_ROOT_PATH_BLBX,
    VDP_WBC_ROOT_PATH_BUTT
} VDP_LAYER_CONN_E;
#endif
