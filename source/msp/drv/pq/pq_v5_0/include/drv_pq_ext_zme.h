/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : drv_pq_ext_zme.h
  Version       : Initial Draft
  Created       : 2017/04/24
  Description   :

******************************************************************************/

#ifndef __DRV_PQ_EXT_ZME_V5_H__
#define __DRV_PQ_EXT_ZME_V5_H__

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */
#include "hi_common.h"

typedef enum hiPQ_SCENEMODE_E
{
    HI_PQ_SCENE_MODE_NORMAL  = 0,
    HI_PQ_SCENE_MODE_PREVIEW = 1,
    HI_PQ_SCENE_MODE_REMOTE  = 2,

    HI_PQ_SCENE_MODE_BUTT
} HI_PQ_SCENEMODE_E;

/* 缩放YUV数据结构体444 422 420 */
typedef enum hiPQ_ZME_FORMAT_E
{
    HI_PQ_ALG_PIX_FORMAT_SP420 = 0,
    HI_PQ_ALG_PIX_FORMAT_SP422 = 1,
    HI_PQ_ALG_PIX_FORMAT_SP444 = 2,

    HI_PQ_ALG_PIX_FORMAT_BUTT,
} HI_ZME_FORMAT_E;

typedef struct
{
    HI_U32    u32ZmeFrmWIn;      /* zme  input frame width  */
    HI_U32    u32ZmeFrmHIn;      /* zme  input frame height */
    HI_U32    u32ZmeFrmWOut;     /* zme output frame width  */
    HI_U32    u32ZmeFrmHOut;     /* zme output frame height */

    //HI_U8     u8ZmeYCFmtIn;      /* video format for zme  input: 0-422; 1-420; 2-444 */
    //HI_U8     u8ZmeYCFmtOut;     /* video format for zme Output: 0-422; 1-420; 2-444 */

    HI_ZME_FORMAT_E enZmeInFmt ;
    HI_ZME_FORMAT_E enZmeOutFmt ;

    HI_BOOL   bZmeFrmFmtIn;      /* Frame format for zme  input: 0-field; 1-frame */
    HI_BOOL   bZmeFrmFmtOut;     /* Frame format for zme Output: 0-field; 1-frame */
    HI_BOOL   bZmeBFIn;          /* Input  field polar when input  is field format: 0-top field; 1-bottom field */
    HI_BOOL   bZmeBFOut;         /* Output field polar when Output is field format: 0-top field; 1-bottom field */

    HI_RECT_S stOriRect;
    HI_U32    u32InRate;         /* Vpss out Rate  RealRate*1000 */
    HI_U32    u32OutRate;        /* Disp Rate      RealRate*1000 */
    HI_BOOL   bDispProgressive;  /* 1:Progressive 0:Interlace */
    HI_U32    u32Fidelity;       /* rwzb info >0:is rwzb */
    HI_U32    u32PortID;
    HI_U32    u32HandleNo;
    HI_PQ_SCENEMODE_E enSceneMode;
    /*
     1.OriRect
     2.InFrameRate
     3.OutRate
     4.Out I/P
     */
} HI_PQ_ZME_PARA_IN_S;

#if 1
typedef enum hiPQ_ZME_LAYER_E
{
    HI_PQ_ZME_LAYER_HD0     = 0,  /* HD LAYER0 */
    HI_PQ_ZME_LAYER_HD1     = 1,  /* HD LAYER1 */

    HI_PQ_ZME_LAYER_WBC_VP  = 3,  /* WBC VIDEO TO CVBS */
    HI_PQ_ZME_LAYER_WBC_CAST = 4,  /* WBC CAST */

    HI_PQ_ZME_LAYER_BUTT
} HI_PQ_ZME_LAYER_E;

#else
typedef enum hiPQ_ZME_LAYER_E
{
    HI_PQ_ZME_LAYER_HD0       = 0,
    HI_PQ_DISP_V1_LAYER_ZME       = 1,
    HI_PQ_DISP_V2_LAYER_ZME       = 2,
    HI_PQ_DISP_V3_LAYER_ZME       = 3,
    HI_PQ_DISP_V4_LAYER_ZME       = 4,
    HI_PQ_DISP_WBC0_LAYER_ZME     = 5,
    HI_PQ_DISP_SR_LAYER_ZME       = 6,
    HI_PQ_DISP_WBC_DHD_LAYER_ZME  = 7,

    HI_PQ_ZME_LAYER_BUTT
} HI_PQ_ZME_LAYER_E;
#endif

#if 0

/* 备注:Port的概念跟HSCL是不同的，VPSS的缩放应该区分两个概念，
   缩放的类型以及缩放的未知(PORT) */
typedef enum hiPQ_VPSS_ZME_LAYER_E
{
    HI_PQ_VPSS_PORT0_LAYER_ZME = 0,
    HI_PQ_VPSS_PORT1_LAYER_ZME = 1,
    HI_PQ_VPSS_PORT2_LAYER_ZME = 2,
    HI_PQ_VPSS_HSCL_LAYER_ZME  = 3,

    HI_PQ_VPSS_LAYER_ZME_BUTT
} HI_PQ_VPSS_ZME_LAYER_E;

/* PORT缩放的窗口大小 */
typedef struct hiPQ_PORT_WIN_S
{
    HI_U32    u32Height;
    HI_U32    u32Width;
} HI_PQ_PORT_WIN_S;

/* ZME各Layer缩放窗口大小 */
typedef struct hiPQ_ZME_WIN_S
{
    HI_PQ_PORT_WIN_S    stPort0Win;
    HI_PQ_PORT_WIN_S    stPort1Win;
    HI_PQ_PORT_WIN_S    stPort2Win;
    HI_PQ_PORT_WIN_S    stHSCLWin;
} HI_PQ_ZME_WIN_S;
#endif

typedef enum
{
    HI_PQ_ZME_COEF_1    = 0,
    HI_PQ_ZME_COEF_E1   = 1,
    HI_PQ_ZME_COEF_075  = 2,
    HI_PQ_ZME_COEF_05   = 3,
    HI_PQ_ZME_COEF_033  = 4,
    HI_PQ_ZME_COEF_025  = 5,
    HI_PQ_ZME_COEF_0    = 6,

    HI_PQ_ZME_COEF_RATIO_BUTT
} HI_PQ_ZME_COEF_RATIO_E;

typedef enum
{
    HI_PQ_ZME_COEF_TYPE_LH = 0,
    HI_PQ_ZME_COEF_TYPE_LV = 1,
    HI_PQ_ZME_COEF_TYPE_CH = 2,
    HI_PQ_ZME_COEF_TYPE_CV = 3,
    HI_PQ_ZME_COEF_TYPE_HLTI = 4,
    HI_PQ_ZME_COEF_TYPE_VLTI = 5,

    HI_PQ_ZME_COEF_TYPE_BUTT
} HI_PQ_ZME_COEF_TYPE_E;

typedef enum
{
    HI_PQ_ZME_TAP_8T32P = 0,
    HI_PQ_ZME_TAP_6T32P = 1,
    HI_PQ_ZME_TAP_5T32P = 2,
    HI_PQ_ZME_TAP_4T32P = 3,
    HI_PQ_ZME_TAP_3T32P = 4,
    HI_PQ_ZME_TAP_2T32P = 5,
    HI_PQ_ZME_TAP_8T2P  = 6,
    HI_PQ_ZME_TAP_6T2P  = 7,

    HI_PQ_ZME_TAP_BUTT
} HI_PQ_ZME_TAP_E;

/*********************internal struction define***************************/

typedef enum hiPQ_FROST_LEVEL_E
{
    HI_PQ_FROST_LEVEL_CLOSE   = 0,
    HI_PQ_FROST_LEVEL_LOW     = 1,
    HI_PQ_FROST_LEVEL_MIDDLE  = 2,
    HI_PQ_FROST_LEVEL_HIGH    = 3,

    HI_PQ_FROST_LEVEL_BUTT
} HI_PQ_FROST_LEVEL_E;

typedef struct
{
    HI_BOOL bHDCPScene; /* is HDCP Sence? 1:yes; 0:no */
    HI_U32  u32IntermedWidth;
    HI_U32  u32IntermedHeight;
} HI_PQ_HDCP_ATTEST_FACTOR_S;

typedef struct
{
    HI_BOOL bFreezeEn; /* freeze scene or normplay scene */

    HI_U32  u32FrmWIn;      /* zme  input frame width  */
    HI_U32  u32FrmHIn;      /* zme  input frame height */
    HI_U32  u32FrmWOut;     /* zme output frame width  */
    HI_U32  u32FrmHOut;     /* zme output frame height */
    //HI_U32  u32FmtIn;       /* video format for zme input: 0-422; 1-420; 2-444 */

    HI_ZME_FORMAT_E enZmeInFmt ;
    HI_ZME_FORMAT_E enZmeOutFmt ;

    HI_BOOL bZmeFrmFmtIn;   /* Frame format for zme input: 0-field; 1-frame */
    HI_BOOL bZmeFrmFmtOut;  /* Frame format for zme Output: 0-field; 1-frame */
    HI_BOOL bZmeBFIn;       /* Input field polar when input is field format: 0-top field; 1-bottom field */
    HI_BOOL bZmeBFOut;      /* Output field polar when Output is field format: 0-top field; 1-bottom field */


    /* 430 no use */
    HI_BOOL bIsDolbyPath;   /* dolby process  */

    HI_PQ_FROST_LEVEL_E        eFrostLevel; /* is Frost Glass Sence? 1:yes; 0:no */
    HI_PQ_HDCP_ATTEST_FACTOR_S stHDCPAttestFactor;

} HI_PQ_LAYER_STRATEGY_IN_S;

typedef enum hiPQ_WBC_LAYER_STRATEGY_E
{
    HI_PQ_WBC_LAYER_STRATEGY_V0   = 0,
    HI_PQ_WBC_LAYER_STRATEGY_V3   = 1,

    HI_PQ_WBC_LAYER_STRATEGY_BUTT
} HI_PQ_WBC_LAYER_STRATEGY_E;


typedef struct
{
    HI_BOOL   bForceWbcFieldMode; /* when lowdelay mode, field mode is needed, give a mandatory setting. 0-frame; 1-field */
    HI_BOOL   bForceWbcPoint2Vp;  /* pip/mosaic and watermark scene, wbc point should be forced to set to VP. */

    HI_PQ_LAYER_STRATEGY_IN_S  stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_BUTT]; /* 0 mean v0, 1 means v3. */

} HI_PQ_WBC_STRATEGY_IN_S;
/*********************internal struction define end***************************/

/*********************external struction define end***************************/
typedef union
{
    HI_PQ_LAYER_STRATEGY_IN_S stLayerStrategy;
    HI_PQ_WBC_STRATEGY_IN_S   stWbcStrategy;
} HI_PQ_ZME_STRATEGY_IN_U;

/* 水平抽点 */
typedef enum hiPQ_PREZME_HOR_MUL_E
{
    HI_PQ_PREZME_HOR_DISABLE = 0,
    HI_PQ_PREZME_HOR_2X      = 1,
    HI_PQ_PREZME_HOR_4X      = 2,
    HI_PQ_PREZME_HOR_8X      = 3,
    HI_PQ_PREZME_HOR_16X     = 4,

    HI_PQ_PREZME_HOR_BUTT
} HI_PQ_PREZME_HOR_MUL_E;

/* 垂直抽行 */
typedef enum hiPQ_PREZME_VER_MUL_E
{
    HI_PQ_PREZME_VER_DISABLE = 0,
    HI_PQ_PREZME_VER_2X      = 1,
    HI_PQ_PREZME_VER_4X      = 2,
    HI_PQ_PREZME_VER_8X      = 3,
    HI_PQ_PREZME_VER_16X     = 4,

    HI_PQ_PREZME_VER_BUTT
} HI_PQ_PREZME_VER_MUL_E;

typedef enum  hiPQ_WBC_VP_POINT_SEL_E
{
    HI_PQ_WBC_VP_POINT_CBM0 = 0,
    HI_PQ_WBC_VP_POINT_V0   = 1,
    HI_PQ_WBC_VP_POINT_VP   = 2,

    HI_PQ_WBC_VP_POINT_BUTT
} HI_PQ_WBC_VP_POINT_SEL_E;

typedef enum  hiPQ_WBC_DHD0_POINT_SEL_E
{
    HI_PQ_WBC_DHD0_POINT_V0 = 0,
    HI_PQ_WBC_DHD0_POINT_VP = 1,

    HI_PQ_WBC_DHD0_POINT_BUTT
} HI_PQ_WBC_DHD0_POINT_SEL_E;

typedef enum  hiPQ_ZME_BIND_POSITION_E
{
    HI_PQ_ZME_BIND_WBC = 0,
    HI_PQ_ZME_BIND_V3  = 1,

    HI_PQ_ZME_BIND_BUTT
} HI_PQ_ZME_BIND_POSITION_E;

typedef enum hiPQ_V0_ZME_NODE_E
{
    HI_PQ_V0_ZME_NODE_ZME1 = 0,   /**< V0 ZME1 */
    HI_PQ_V0_ZME_NODE_ZME2 = 1,   /**< V0 ZME2 */ /* no use in 430 */

    HI_PQ_V0_ZME_NODE_BUTT
} PQ_V0_ZME_NODE_E;


typedef  struct
{
    HI_S32   s32ZmeOffsetHL;
    HI_S32   s32ZmeOffsetHC;
    HI_S32   s32ZmeOffsetVL;
    HI_S32   s32ZmeOffsetVC;
    HI_S32   s32ZmeOffsetVLBtm;
    HI_S32   s32ZmeOffsetVCBtm;
} HI_PQ_ZME_OFFSET_S;

typedef  struct
{
    HI_U32 u32ZmeCoefAddrHL;
    //HI_U32 u32ZmeCoefAddrHC;
    HI_U32 u32ZmeCoefAddrVL;
    //HI_U32 u32ZmeCoefAddrVC;
} HI_PQ_ZME_COEF_ADD_S;


typedef  struct
{
    HI_U32   u32InWidth;
    HI_U32   u32InHeight;
    HI_U32   u32OutWidth;
    HI_U32   u32OutHeight;

    //HI_U32   u32PixInFmt;     /* video format for zme input : 0-422; 1-420; 2-444 */
    //HI_U32   u32PixOutFmt;    /* video format for zme output: 0-422; 1-420; 2-444 */

    HI_ZME_FORMAT_E enZmeInFmt ;
    HI_ZME_FORMAT_E enZmeOutFmt ;

    HI_BOOL  bZmeHorEnable;   /* zme  enable of horizontal : 0-off; 1-on */
    HI_BOOL  bZmeVerEnable;   /* zme  enable of vertical     : 0-off; 1-on */

    HI_BOOL  bZmeFirHL;       /* zme mode of horizontal luma  : 0-copy mode; 1-FIR filter mode */
    HI_BOOL  bZmeFirHC;       /* zme mode of horizontal chroma: 0-copy mode; 1-FIR filter mode */
    HI_BOOL  bZmeFirVL;       /* zme mode of vertial    luma  : 0-copy mode; 1-FIR filter mode */
    HI_BOOL  bZmeFirVC;       /* zme mode of vertial    chroma: 0-copy mode; 1-FIR filter mode */

    HI_BOOL  bZmeMedH;        /* zme Median filter enable of horizontal: 0-off; 1-on */
    HI_BOOL  bZmeMedV;

    HI_BOOL  bInFmt;          /* Frame format for zme Intput: 0-field; 1-frame */
    HI_BOOL  bOutFmt;         /* Frame format for zme Output: 0-field; 1-frame */

    HI_PQ_ZME_OFFSET_S  stZmeOffset;
    HI_PQ_ZME_COEF_ADD_S stZmeAddr; /* zme coef add */
} HI_PQ_IMAGE_FMT_S;

typedef  struct
{
    /*HI_BOOL bPreZme;
    HI_BOOL bPreZmeFir;*/

    HI_U32   u32InWidth;
    HI_U32   u32InHeight;
    HI_U32   u32OutWidth;
    HI_U32   u32OutHeight;

    //HI_U32   u32PixInFmt;     /* video format for zme input : 0-422; 1-420; 2-444 */
    //HI_U32   u32PixOutFmt;    /* video format for zme output: 0-422; 1-420; 2-444 */

    HI_ZME_FORMAT_E enZmeInFmt ;
    HI_ZME_FORMAT_E enZmeOutFmt ;

    HI_BOOL  bZmeHorEnable;   /* zme  enable of horizontal : 0-off; 1-on */

    HI_BOOL  bZmeFirHL;       /* zme mode of horizontal luma  : 0-copy mode; 1-FIR filter mode */
    HI_BOOL  bZmeFirHC;       /* zme mode of horizontal chroma: 0-copy mode; 1-FIR filter mode */

    HI_BOOL  bZmeMedH;        /* zme Median filter enable of horizontal: 0-off; 1-on */

    HI_BOOL  bInFmt;          /* Frame format for zme Intput: 0-field; 1-frame */
    HI_BOOL  bOutFmt;         /* Frame format for zme Output: 0-field; 1-frame */

    HI_S32   s32ZmeOffsetHL;
    HI_S32   s32ZmeOffsetHC;

    HI_U32  u32ZmeCoefAddrHL;

} HI_PQ_HZME_S;

typedef  struct
{
    HI_U32   u32InWidth;
    HI_U32   u32InHeight;
    HI_U32   u32OutWidth;
    HI_U32   u32OutHeight;

    //HI_U32   u32DataFmtIn;     /* video format for zme input : 0-422; 1-420; 2-444 */
    //HI_U32   u32DataFmtOut;    /* video format for zme output: 0-422; 1-420; 2-444 */

    HI_BOOL  bInFmt;          /* Frame format for zme Intput: 0-field; 1-frame */

    HI_PQ_PREZME_HOR_MUL_E  eHScalerModeVf;   /* Horizontal Extract Pixel */
    HI_PQ_PREZME_VER_MUL_E  eVScalerModeVf;   /* Vertical   Extract Line */
} HI_PQ_VF_FDR_CONFIG_S;


/*V0*/
typedef  struct
{
    HI_BOOL   bReadFmtIn;      /* Frame format for zme input: 0-field; 1-frame */
    HI_BOOL   bReadBFIn;       /* Input field polar when input is field format: 0-top field; 1-bottom field */
    HI_BOOL   bOpenP2I;

    HI_BOOL   bZmeDefault;     /* 1:rwzb; 0:no rwzb */
    /* v0 fdr */
    HI_PQ_PREZME_HOR_MUL_E  eHScalerMode;   /* Horizontal Extract Pixel */
    HI_PQ_PREZME_VER_MUL_E  eVScalerMode;   /* Vertical   Extract Line */

    HI_PQ_HZME_S   stHZmeCfg; /* New Module HPZme Config */

    /* vf fdr */
    HI_PQ_VF_FDR_CONFIG_S   stFdrVfConfig; /* New Module fdr_vf Config */

    HI_PQ_IMAGE_FMT_S   stZmeFmt[HI_PQ_V0_ZME_NODE_BUTT];
    HI_U32 u32ZmeNum; /* 430 only one zme */

} HI_PQ_LAYER_STRATEGY_OUT_S;

/* WBC VP*/
typedef  struct
{
    HI_BOOL   bReadFmtIn;      /* Frame format for zme  input: 0-field; 1-frame */
    HI_BOOL   bReadBFIn;       /* Input field polar when input is field format: 0-top field; 1-bottom field */
    HI_BOOL   bOpenP2I;

    HI_BOOL   bZmeDefault;     /* 1:rwzb; 0:no rwzb */

    HI_PQ_PREZME_HOR_MUL_E    eHScalerMode;
    HI_PQ_WBC_VP_POINT_SEL_E  enVpPoint;
    HI_PQ_ZME_BIND_POSITION_E eZmePosition;

    HI_PQ_IMAGE_FMT_S   stZmeFmt;
} HI_PQ_WBC_VP_STRATEGY_OUT_S;

/* WBC DHD */
typedef  struct
{
    HI_BOOL   bReadFmtIn;      /* Frame format for zme  input: 0-field; 1-frame */
    HI_BOOL   bReadBFIn;       /* Input field polar when input is field format: 0-top field; 1-bottom field */

    HI_BOOL   bZmeDefault;     /* 1:rwzb; 0:no rwzb */

    HI_BOOL   bInWbcDhdZmeFmt;   /* Frame format for zme Output: 0-field; 1-frame */

    //HI_PQ_PREZME_HOR_MUL_E       eHScalerMode;
    HI_PQ_WBC_DHD0_POINT_SEL_E   enDhd0Point;

    HI_PQ_IMAGE_FMT_S   stZmeFmt;
} HI_PQ_WBC_DHD0_STRATEGY_OUT_S;

typedef union
{
    HI_PQ_LAYER_STRATEGY_OUT_S    stStrategyLayerId;
    HI_PQ_WBC_VP_STRATEGY_OUT_S   stStrategyWbcVp;
    HI_PQ_WBC_DHD0_STRATEGY_OUT_S stStrategyWbcDhd;
} HI_PQ_ZME_STRATEGY_OUT_U;
//#endif

typedef struct
{
    HI_RECT_S stSrcReso;
    HI_RECT_S stZme1InReso;
    HI_RECT_S stZme1OutReso;
    HI_RECT_S stZme2InReso;
    HI_RECT_S stZme2OutReso;
    HI_RECT_S stIntfReso;
} HI_PQ_SHARP_RESO_S;

typedef struct
{
    HI_U32 u32ZmeFrmWIn;    /* zme input  frame width  */
    HI_U32 u32ZmeFrmHIn;    /* zme input  frame height */
    HI_U32 u32ZmeFrmWOut;   /* zme output frame width  */
    HI_U32 u32ZmeFrmHOut;   /* zme output frame height */

    HI_BOOL bZmeFrmFmtIn;   /* Frame format for zme input:  0-field; 1-frame */
    HI_BOOL bZmeFrmFmtOut;  /* Frame format for zme Output: 0-field; 1-frame */

    HI_BOOL bDeFlicker;
    HI_BOOL bSlvGp;         /* 0-no isogeny; 1-isogeny */
} HI_PQ_GFX_ZME_PARA_S;

typedef enum hiPQ_PROC_ZME_NUM_E
{
    HI_PQ_PROC_ZME_NUM_ORI        = 0,
    HI_PQ_PROC_ZME_NUM_ONLY_ZME1  = 1, /* NO ZME2 */

    HI_PQ_PROC_ZME_NUM_BUTT
} HI_PQ_PROC_ZME_NUM_E;

typedef enum hiPQ_PROC_PREZME_HOR_MUL_E
{
    HI_PQ_PROC_PREZME_HOR_ORI = 0,
    HI_PQ_PROC_PREZME_HOR_1X  = 1,
    HI_PQ_PROC_PREZME_HOR_2X  = 2,
    HI_PQ_PROC_PREZME_HOR_4X  = 4,
    HI_PQ_PROC_PREZME_HOR_8X  = 8,
    HI_PQ_PROC_PREZME_HOR_16X  = 16,

    HI_PQ_PROC_PREZME_HOR_BUTT
} HI_PQ_PROC_PREZME_HOR_MUL_E;

typedef enum hiPQ_PROC_PREZME_VER_MUL_E
{
    HI_PQ_PROC_PREZME_VER_ORI = 0,
    HI_PQ_PROC_PREZME_VER_1X  = 1,
    HI_PQ_PROC_PREZME_VER_2X  = 2,
    HI_PQ_PROC_PREZME_VER_4X  = 4,
    HI_PQ_PROC_PREZME_VER_8X  = 8,
    HI_PQ_PROC_PREZME_VER_16X  = 16,

    HI_PQ_PROC_PREZME_VER_BUTT
} HI_PQ_PROC_PREZME_VER_MUL_E;

typedef  struct
{
    HI_PQ_PROC_ZME_NUM_E  enProcVdpZmeNum;
    HI_BOOL bProcVdpHpzmeEn;
    HI_PQ_PROC_PREZME_HOR_MUL_E  enProcVdpWidthDrawMode;
    HI_PQ_PROC_PREZME_VER_MUL_E  enProcVdpHeightDrawMode;
    HI_BOOL bProcHDCPEn;
    HI_U32 u32VidRatio[HI_PQ_ZME_COEF_TYPE_BUTT];
    HI_U32 u32WbcRatio[HI_PQ_ZME_COEF_TYPE_BUTT];
} HI_PQ_PROC_VDPZME_STRATEGY_S;

typedef struct
{
    HI_RECT_S stVdpInReso;
    HI_RECT_S stVdpOutreso;
    HI_RECT_S stVdpZme1Inreso;
    HI_RECT_S stVdpZme1Outreso;
    HI_RECT_S stVdpZme2Inreso;
    HI_RECT_S stVdpZme2Outreso;
} HI_PQ_PROC_VDPZME_RESO_S;


typedef enum hiPQ_PROC_WBC_LAYER_E
{
    HI_PQ_PROC_WBC_LAYER_DHD = 0,
    HI_PQ_PROC_WBC_LAYER_VP  = 1,

    HI_PQ_PROC_WBC_LAYER_BUTT
} HI_PQ_PROC_WBC_LAYER_E;

typedef struct
{
    HI_U32    u32PointSel; /* wbcvp : 0:VP,1:V0;  wbcdhd : 0:CBN,1:GP */
    HI_BOOL   bP2iEn;
    HI_RECT_S stZme1Inreso;
    HI_RECT_S stZme1Outreso;
    HI_RECT_S stZme2Inreso;
    HI_RECT_S stZme2Outreso;
} HI_PQ_PROC_WBC_STRATEGY_S;


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* End of #ifndef __DRV_PQ_EXT_ZME_H__ */
