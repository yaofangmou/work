/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : drv_pq_ext.h
  Version       : Initial Draft
  Author        : sdk sdk
  Created       : 2014/04/01
  Description   :

******************************************************************************/

#ifndef __DRV_PQ_EXT_V5_H__
#define __DRV_PQ_EXT_V5_H__

#include "hi_type.h"
#include "hi_drv_video.h"

#ifndef HI_BUILD_IN_BOOT
#include "hi_drv_dev.h"
#include "drv_pq_ext_hdr.h"
#endif

#include "drv_pq_ext_zme.h"
#include "drv_pq_ext_csc.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#if defined(CHIP_TYPE_hi3716mv430)
#define ACC_HISTGRAM0_SIZE      3
#define ACC_HISTGRAM1_SIZE      64
#endif



/* display ID */
typedef enum hiPQ_DISPLAY_E
{
    HI_PQ_DISPLAY_SD0 = 0,   /**< DISPLAY0,Compatible with SD */
    HI_PQ_DISPLAY_HD1,       /**< DISPLAY1, HD */

    //HI_PQ_DISPLAY_HD2,       /**< DISPLAY2, HD, temp not used */
    HI_PQ_DISPLAY_BUTT
} HI_PQ_DISPLAY_E;

/* Layer ID */
typedef enum hiPQ_VDP_LAYER_VID_E
{
    HI_PQ_VDP_LAYER_VID_HD0  = 0, /* 高清视频层0 */
    HI_PQ_VDP_LAYER_VID_HD1  = 1, /* 高清视频层1 */

    HI_PQ_VDP_LAYER_VID_SD0  = 3, /* 标清视频层0 */

    HI_PQ_VDP_LAYER_VID_BUTT
} HI_PQ_VDP_LAYER_VID_E;


/* VPSS视频信息 */
#if 1
typedef struct hiHI_VPSS_PQ_INFO_S
{
    HI_U32              u32FrameIndex;       /* 帧号: 0表示需要初始化 */
    HI_U32              u32Width;           /* 图像宽度 */
    HI_U32              u32Height;          /* 图像高度 */
    HI_U32              u32FrameRate;       /* 输入帧率 */
    HI_BOOL             bInterlace;         /* 是否隔行信号 */
} HI_VPSS_PQ_INFO_S;

typedef struct hiHI_ONLINE_INFO_S
{
    //HI_U32     u32FrameIndex;       /* 帧号: 0表示需要初始化 */
    HI_RECT_S  stSrcRect;  /* frame src rect */
    HI_RECT_S  stOutRect;  /* frame out rect */
} HI_PQ_ONLINE_INFO_S;
#endif

typedef struct hiHI_VDP_CHANNEL_TIMING_S
{
    HI_RECT_S  stFmtRect;
    HI_U32     u32RefreshRate;
    HI_BOOL    bProgressive;
    HI_DRV_COLOR_SPACE_E enOutColorSpace;
} HI_VDP_CHANNEL_TIMING_S;

/* 算法绑定位置 */
typedef enum hiPQ_ALGIP_SEL_E
{
    HI_PQ_ALGIP_SEL_VDP = 0,   /* Alg Sel Vdp */
    HI_PQ_ALGIP_SEL_VPSS   ,   /* Alg Sel Vpss */

    HI_PQ_ALGIP_SEL_BUTT
} HI_PQ_ALGIP_SEL_E;

/* GRAPH CSC LAYER */
typedef enum hiPQ_GFX_LAYER_E
{
    PQ_GFX_GP0 = 0  , /* HD */
    PQ_GFX_GP1      , /* SD */

    PQ_GFX_WBC_GP   , /* 暂未使用 */

    PQ_GFX_LAYER_BUTT
} HI_PQ_GFX_LAYER_E;


/* DCI统计窗口 */
typedef struct  hiPQ_DCI_WIN_S
{
    HI_U16      u16HStar;
    HI_U16      u16HEnd;
    HI_U16      u16VStar;
    HI_U16      u16VEnd;
} HI_PQ_DCI_WIN_S;

typedef struct
{
    HI_S32 IsProgressiveSeq;
    HI_S32 IsProgressiveFrm;
    HI_S32 RealFrmRate;

} PQ_VDEC_INFO_S;

typedef enum tagHI_DRV_PQ_FIELDORDER_E
{
    HI_PQ_FIELDORDER_BOTTOMFIRST = 0,
    HI_PQ_FIELDORDER_TOPFIRST    = 1,
    HI_PQ_FIELDORDER_UNKOWN      = 2,

    HI_PQ_FIELDORDER_BUTT
} HI_DRV_PQ_FIELDORDER_E;

typedef enum hiDRV_PQ_MCDI_SPLIT_MODE_E
{
    HI_DRV_PQ_MCDI_SPLIT_MODE_0 = 0, /* Mcdi Split Mode */
    HI_DRV_PQ_MCDI_SPLIT_MODE_1 = 1, /* Mcdi Split Mode */
    HI_DRV_PQ_MCDI_SPLIT_MODE_2 = 2, /* Mcdi Split Mode */
    HI_DRV_PQ_MCDI_SPLIT_MODE_3 = 3, /* Mcdi Split Mode */
    HI_DRV_PQ_MCDI_SPLIT_MODE_4 = 4, /* Mcdi Split Mode */
    HI_DRV_PQ_MCDI_SPLIT_MODE_5 = 5, /* Mcdi Split Mode */

    HI_DRV_PQ_MCDI_SPLIT_MODE_BUTT
} HI_DRV_PQ_MCDI_SPLIT_MODE_E;

#if 0
/* IFMD软算法所需驱动传入参数，VPSS->PQ */
typedef struct hi_PQ_IFMD_CALC_S
{
    HI_U32  u32HandleNo;
    HI_U32  u32WidthY;
    HI_U32  u32HeightY;
    HI_U32  u32FieldOrder;                 /* 顶底场序 顶场优先底场优先 */
    HI_S32  s32FieldMode;                  /* 顶底场标志 */
    HI_U32  u32FrameRate;
    HI_BOOL bPreInfo;                      /* DEI逻辑处理timeout，仍旧处理上一场 */

    PQ_VDEC_INFO_S      stVdecInfo;
    HI_VOID *pstIfmdHardOutReg; /* 读取ifmd的状态寄存器,，内部转换为S_VPSS_STT_REGS_TYPE类型使用 */

} HI_PQ_IFMD_CALC_S;
#endif

typedef struct
{
    HI_S32  die_reset;
    HI_S32  die_stop;
    HI_S32  dir_mch;
    HI_S32  die_out_sel;
    //HI_S32  jud_en;
    //HI_S32  ChromaVertFltEn;
    HI_U32  u32FieldOrder;    /* 顶地场序 */
#if 1
    HI_S32  s32SceneChanged;  /* 场景切换信息 */
    HI_S32  s32FilmType;      /* 电影模式 */
    HI_U32  u32KeyValue;      /* 关键帧 */
    HI_U32  u32EdgeSmoothEn;
#endif
} HI_PQ_IFMD_PLAYBACK_S;

/* Brightness/Contrast/Hue/Saturation setting */
typedef struct hiPQ_PICTURE_SETTING_S
{
    HI_U16 u16Brightness;
    HI_U16 u16Contrast;
    HI_U16 u16Hue;
    HI_U16 u16Saturation;
} HI_PQ_PICTURE_SETTING_S;

/* Vdec解码协议; 0: H265, 1: H264, 2: Mpeg2, 3: VP9, 4: mndet */
typedef enum hiPQ_VDEC_PROTOCOL_E
{
    HI_PQ_VDEC_PROTOCOL_H265 = 0,
    HI_PQ_VDEC_PROTOCOL_H264    ,
    HI_PQ_VDEC_PROTOCOL_MPEG2   ,
    HI_PQ_VDEC_PROTOCOL_VP9     ,
    HI_PQ_VDEC_PROTOCOL_MNDET   ,

    HI_PQ_VDEC_PROTOCOL_BUTT    ,

} HI_PQ_VDEC_PROTOCOL_E;

/* VDP视频信息 */
typedef struct hiHI_VDP_PQ_INFO_S
{
    HI_PQ_VDP_LAYER_VID_E       enLayerId;          /* 通道下的层 */
    HI_U32                      u32Width;           /* 图像宽度 */
    HI_U32                      u32Height;          /* 图像高度 */
    HI_U32                      u32FrameRate;       /* 输入帧率 */
    HI_BOOL                     bInterlace;         /* 是否隔行信号 */
    HI_BOOL                     bSRState;           /* SR 开关 */
    HI_BOOL                     bIsogenyMode;       /* 是否同源模式 */
    HI_BOOL                     bHdrMode;           /* 是否hdr模式*/
    HI_BOOL                     bPartUpdate;        /* 是否部分更新参数 */
    HI_BOOL                     b3dType;            /* 是否3D播放 */
    HI_VDP_CHANNEL_TIMING_S     stChannelTiming[HI_PQ_DISPLAY_BUTT];
    HI_RECT_S                   stVideo;            /* 有效图像区域 */
} HI_VDP_PQ_INFO_S;

#if 0
typedef struct hiPQ_VPSS_MODULE_S
{
    HI_PQ_SCENEMODE_E           enSceneMode;

} HI_PQ_VPSS_MODULE_S;
#endif

/* VPSS 驱动传入的信息 */
typedef struct hiPQ_WBC_INFO_S
{
    /* Common */
    HI_U32    u32FrameIndex;

    HI_U32    u32HandleNo;
    HI_U32    u32BitDepth;              /* 通路处理位宽 */
    HI_U32    u32Width;                 /* 实际处理的宽度 */
    HI_U32    u32Height;                /* 实际处理的高度 */
    HI_BOOL   bProgressive;             /* 隔逐行信息 */
    HI_S32    s32FieldMode;             /* 当前场极性标识: 0:Top; 1:Bottom */
    HI_BOOL    bDeiEn;             /* DEI 使能标识 */
    HI_BOOL   bMcnrEn;          /* MCNR 使能标志, tile,rwzb disable mcnr */

    HI_VOID *pstVpssWbcReg;  /* ifmd、Globlal Motion and DB的回写信息,内部转换为S_VPSS_STT_REGS_TYPE类型处理 */

    /* GlobalMotion */
    HI_U32   u32Scd;
    HI_U32   u32Stride;
    HI_VOID *pRGMV;

    /* IFMD */
    HI_U32   u32FieldOrder;              /* 顶底场序 顶场优先底场优先 */
    HI_U32   u32FrameRate;               /* 帧率 */
    HI_BOOL  bPreInfo;                   /* DEI逻辑处理timeout, 仍旧处理上一场 */
    PQ_VDEC_INFO_S stVdecInfo;           /* VDEC 传递的隔逐行信息 */

#if 1
    /* DNR */
    HI_U32  u32SingleModeFlag;           /* 单场模式标识; 1:单场;0:非单场 */
    HI_U32  u32Protocol;                 /* 解码协议 */
    HI_U32  u32ImageAvgQP;               /* 图像平均 QP */
    HI_U32  u32VdhInfoAddr;              /* dbinfo 地址 */
    HI_U32  u32VdhInfoStride;            /* 信息stride, 算法约定为(图像宽度+7)/8 */
    HI_U32  u32ImageStruct;              /* 帧/场编码标识 */
#endif
} HI_PQ_WBC_INFO_S;

/* PQ Calc 传给VPSS驱动的信息 */
typedef struct hiPQ_CFG_INFO_S
{
    /* GlobalMotion */

    /* IFMD */
    HI_S32  die_reset;
    HI_S32  die_stop;
    HI_S32  dir_mch;
    HI_S32  die_out_sel;
    //HI_S32  jud_en;
    //HI_S32  ChromaVertFltEn;
    HI_U32  u32FieldOrder;    /* 顶地场序 */
    //HI_S32  s32SceneChanged;  /* 场景切换信息 */
    //HI_S32  s32FilmType;      /* 电影模式 */
    //HI_U32  u32KeyValue;      /* 关键帧 */
    /* DNR */
} HI_PQ_CFG_INFO_S;

typedef struct hiPQ_VDP_WBC_INFO_S
{
    /* Common */
    HI_PQ_VDP_LAYER_VID_E  enLayerId;          /* 层 */
    HI_U32                 u32BitDepth;        /* 通路处理位宽 */
    HI_RECT_S              stOriCoordinate;    /* Crop之前坐标 */
    HI_RECT_S              stCropCoordinate;   /* Crop之后坐标 */
    HI_PQ_ALGIP_SEL_E      enAlgIPSel;         /* 算法绑定位置 */
    HI_VOID    *pstVdpWbcReg;       /* ifmd、Globlal Motion and DB的回写信息，内部转换为S_VPSS_STT_REGS_TYPE类型处理 */
    HI_U32                 u32VdpWbcRegPhyAddr;

    /* DNR */
    HI_BOOL                bCropBeforeDB;      /* 0: 在DB之后Crop;1: 在DB 之前Crop */
    HI_U32                 u32SingleModeFlag;  /* 单场模式标识; 1:单场;0:非单场 */
    HI_U32                 u32ImageAvgQP;      /* 图像平均 QP */
    HI_U32                 u32VdhInfoAddr;     /* dbinfo 地址 */
    HI_U32                 u32VdhInfoStride;   /* 信息stride, 算法约定为(图像宽度+7)/8 */
    HI_U32                 u32ImageStruct;     /* 帧/场编码标识 */
    HI_PQ_VDEC_PROTOCOL_E  enVdecProtocol;     /* 解码协议 */

} HI_PQ_VDP_WBC_INFO_S;

#if 1  // 新增的帧信息
// 帧信息类型
typedef struct hiHI_PQ_FRAME_INFO_S
{
    /* Common */
    HI_U32    u32FrameIndex;      /* 帧号: 从1开始 1,2,3,... */
    HI_BOOL   bInit;              /* 是否需要初始化PQ */
    HI_U32    u32HandleNo;
    HI_BOOL   bSoftAlgPass;       /* 软算法全部透传模式 */

    HI_BOOL   bProgressive;       /* 隔逐行信息 */
    HI_U32    u32Width;           /* 图像宽度 */
    HI_U32    u32Height;          /* 图像高度 */
    HI_U32    u32BitDepth;        /* 通路处理位宽 */

    HI_BOOL   bDeiEn;             /* DEI 使能标识 */
    HI_BOOL   bTnrEn;             /* TNR 使能标识 */
    HI_BOOL   bMcnrEn;            /* MCNR 使能标志, tile,rwzb disable mcnr */
    HI_BOOL   bSnrEn;             /* SNR 使能标识 */
    HI_BOOL   bDbEn;              /* DB 使能标识 */
    HI_BOOL   bDmEn;              /* DM 使能标识 */

    /* GlobalMotion */
    HI_U32   u32Scd;              /* no use */
    HI_U32   u32Stride;
    HI_VOID  *pRGMV;

    /* IFMD */
    HI_BOOL  bPreInfo;                   /* DEI逻辑处理timeout, 仍旧处理上一场 */ /* 以前一致给false*/

    HI_U32    u32FrameRate;       /* 输入帧率 */
    HI_S32    s32FieldMode;       /* 当前场极性标识: 0:Top; 1:Bottom */
    HI_U32   u32FieldOrder;              /* 顶底场序 顶场优先底场优先 */
    PQ_VDEC_INFO_S stVdecInfo;           /* VDEC 传递的隔逐行信息 */

#if 0 // 暂时都不用
    /* DNR */  //dbm
    HI_U32  u32SingleModeFlag;           /* 单场模式标识; 1:单场;0:非单场 */
    HI_U32  u32Protocol;                 /* 解码协议 */
    HI_U32  u32ImageAvgQP;               /* 图像平均 QP */                                  // 98c2 要用，430 nr不用，待确认dbm用不用

    HI_U32  u32VdhInfoAddr;              /* dbinfo 地址 */
    HI_U32  u32VdhInfoStride;            /* 信息stride, 算法约定为(图像宽度+7)/8 */
    HI_U32  u32ImageStruct;              /* 帧/场编码标识 */
#endif
} HI_PQ_FRAME_INFO_S;

//2、输出类型
typedef struct hiHI_PQ_DISP_INFO_S
{
    HI_PQ_DISPLAY_E enDisplayId; /* DISP通道 */
    HI_PQ_VDP_LAYER_VID_E       enLayerId;          /* 通道下的层 */
    HI_VDP_CHANNEL_TIMING_S     stChannelTiming[HI_PQ_DISPLAY_BUTT];
    HI_RECT_S                   stVideo;            /* 有效图像区域 */

    HI_BOOL                     bIsogenyMode;       /* 是否同源模式 */
    HI_BOOL                     bPartUpdate;        /* 是否部分更新参数 */
    HI_BOOL                     b3dType;            /* 是否3D播放 */
} HI_PQ_DISP_INFO_S;


//4、reg类型
typedef struct hiHI_PQ_VPSS_REG_INFO_S
{
    HI_VOID *pstVpssReg;    /* reg in , only read，内部转换为S_VPSSIP_ALG_SET_REGS_TYPE类型处理 */
    HI_VOID *pstVpssWbcReg; /* ifmd、Globlal Motion and DB的回写信息，内部转换为S_VPSS_STT_REGS_TYPE类型处理 */  /* reg in , only read */

    HI_VOID *pstVpssAlgRegOut; /* reg out , write，内部转换为S_VPSSIP_ALG_SET_REGS_TYPE类型处理 */
} HI_PQ_VPSS_REG_INFO_S;

//5、softout

/* PQ Calc 传给VPSS驱动的信息 */
typedef struct hiPQ_VPSS_OUT_INFO_S
{
    /* IFMD */
    HI_S32  die_reset;
    HI_S32  die_stop;
    HI_S32  dir_mch;
    HI_S32  die_out_sel;
    /* 传给VPSS做插帧处理 */

    HI_U32  u32FieldOrder;    /* 顶地场序0 topFirst */
    HI_DRV_PQ_FIELDORDER_E  enFieldOrder;

    /* 以上几个需要使用 */

    HI_U32  u32EdgeSmoothEn; /* inner use */
#if 0
    HI_S32  jud_en; //未用过
    HI_S32  ChromaVertFltEn;//未用过

    HI_S32  s32SceneChanged;  /* 场景切换信息 */   /* 没用过 */
    HI_S32  s32FilmType;      /* 电影模式 */  /* PQ内部使用，VPSS不用 */
    HI_U32  u32KeyValue;      /* 关键帧 */     /* PQ内部使用，VPSS不用 */
#endif
} HI_PQ_VPSS_OUT_INFO_S;

#endif


typedef struct
{
    HI_U16  u16GammCoef[1024];
} HI_PQ_GAMM_PARA_S;

typedef struct hiPQ_ACC_HISTGRAM_S
{
    HI_U32 u32HistGram0[ACC_HISTGRAM0_SIZE];
    HI_U32 u32HistGram1[ACC_HISTGRAM1_SIZE];
} HI_PQ_ACC_HISTGRAM_S;

#ifndef HI_BUILD_IN_BOOT

typedef HI_S32 (*FN_PQ_Suspend) (PM_BASEDEV_S *pdev, pm_message_t state);
typedef HI_S32 (*FN_PQ_Resume) (PM_BASEDEV_S *pdev);
typedef HI_S32 (*FN_PQ_UpdateVdpPQ)(HI_PQ_DISPLAY_E enDisplayId, HI_VDP_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVDPReg);
typedef HI_S32 (*FN_PQ_GetCSCCoef)(HI_PQ_CSC_CRTL_S *pstCscCtrl, HI_PQ_CSC_MODE_E enCscMode, HI_PQ_CSC_COEF_S *pstCscCoef, HI_PQ_CSC_DCCOEF_S *pstCscDcCoef);
typedef HI_S32 (*FN_PQ_Get8BitCSCCoef)(HI_PQ_CSC_MODE_E  enCSCMode, HI_PQ_CSC_COEF_S *pstCSCCoef, HI_PQ_CSC_DCCOEF_S *pstCSCDCCoef);
typedef HI_S32 (*FN_PQ_GetSetting)(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);
typedef HI_S32 (*FN_PQ_SetSetting)(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);
typedef HI_S32 (*FN_PQ_GetVdpZmeStrategy) (HI_PQ_ZME_LAYER_E enLayerId, HI_PQ_ZME_STRATEGY_IN_U *pstZmeIn, HI_PQ_ZME_STRATEGY_OUT_U *pstZmeOut);
typedef HI_S32 (*FN_PQ_SetGfxZme) (HI_PQ_GFX_LAYER_E enGfxZmeLayer, HI_PQ_GFX_ZME_PARA_S *pstGfxZmePara);
typedef HI_S32 (*FN_PQ_SetGfxCscCoef) (HI_PQ_GFX_LAYER_E enGfxCscLayer, HI_PQ_GFX_CSC_PARA_S *pstGfxCscPara);

typedef struct tagPQ_EXPORT_FUNC_S
{
    FN_PQ_Suspend                 pfnPqSuspend;
    FN_PQ_Resume                  pfnPqResume;
    FN_PQ_UpdateVdpPQ             pfnPQ_UpdateVdpPQ;
    FN_PQ_GetCSCCoef              pfnPQ_GetCSCCoef;
    FN_PQ_Get8BitCSCCoef          pfnPQ_Get8BitCSCCoef;
    FN_PQ_GetSetting              pfnPQ_GetHDPictureSetting;
    FN_PQ_GetSetting              pfnPQ_GetSDPictureSetting;
    FN_PQ_SetSetting              pfnPQ_SetHDPictureSetting;
    FN_PQ_SetSetting              pfnPQ_SetSDPictureSetting;
    FN_PQ_GetSetting              pfnPQ_GetHDVideoSetting;
    FN_PQ_GetSetting              pfnPQ_GetSDVideoSetting;
    FN_PQ_SetSetting              pfnPQ_SetHDVideoSetting;
    FN_PQ_SetSetting              pfnPQ_SetSDVideoSetting;
    FN_PQ_GetVdpZmeStrategy       pfnPQ_GetVdpZmeStrategy;
    FN_PQ_SetGfxZme               pfnPQ_SetGfxZme;
    FN_PQ_SetGfxCscCoef           pfnPQ_SetGfxCscCoef;
} PQ_EXPORT_FUNC_S;


HI_S32  PQ_DRV_ModInit(HI_VOID);

HI_VOID PQ_DRV_ModuleExit(HI_VOID);

HI_S32  HI_DRV_PQ_Init(HI_CHAR *pszPath);

HI_S32  HI_DRV_PQ_DeInit(HI_VOID);



/**
 \brief Timming变化后进行VDP PQ参数更新
 \attention \n
无

 \param[in] u32DisplayId
 \param[in] pstTimingInfo: Timming Info
 \param[in] *pstVDPReg:VDP 虚拟寄存器地址，内部转换为S_VDP_REGS_TYPE类型处理

 \retval ::HI_SUCCESS

 */

HI_S32 DRV_PQ_UpdateVdpPQ(HI_PQ_DISPLAY_E enDisplayId, HI_VDP_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVDPReg);


/**
 \brief 设置ZME
 \attention \n
无

 \param[in] u32LayerId:
 \param[in] pstZmeDrvPara:
 \param[in] bFirEnable

 \retval ::HI_SUCCESS

 */
/*HI_S32 DRV_PQ_SetZme(HI_PQ_ZME_LAYER_E e32LayerId, HI_PQ_ZME_PARA_IN_S *pstZmeDrvPara, HI_BOOL bFirEnable);*/


/**
 \brief 获取CSC系数
 \attention \n
无

 \param[in] enCSCMode:
 \param[out] pstCSCCoef:
 \param[out] pstCSCDCCoef:

 \retval ::HI_SUCCESS

 */

HI_S32 DRV_PQ_GetCSCCoef(HI_PQ_CSC_CRTL_S *pstCscCtrl, HI_PQ_CSC_MODE_E enCscMode, HI_PQ_CSC_COEF_S *pstCscCoef, HI_PQ_CSC_DCCOEF_S *pstCscDcCoef);

/**
 \brief 获取8bit CSC系数
 \attention \n
无

 \param[in] enCSCMode:
 \param[out] pstCSCCoef:
 \param[out] pstCSCDCCoef:

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_Get8BitCSCCoef(HI_PQ_CSC_MODE_E enCSCMode, HI_PQ_CSC_COEF_S *pstCSCCoef, HI_PQ_CSC_DCCOEF_S *pstCSCDCCoef);


/**
 \brief 设置算法运算完之后的寄存器
 \attention \n
无

 \param[in]  *pstWbcInfo
 \param[out]
 \retval ::HI_SUCCESS

 */
/*HI_S32 DRV_PQ_SetAlgCalcCfg(HI_PQ_WBC_INFO_S *pstVpssWbcInfo, HI_PQ_CFG_INFO_S *pstVpssCfgInfo);*/

/**
 \brief 设置算法运算完之后的寄存器
 \attention \n
无

 \param[in]  *pstWbcInfo
 \param[out]
 \retval ::HI_SUCCESS

 */
/*HI_S32 DRV_PQ_SetVdpAlgCalcCfg(HI_PQ_VDP_WBC_INFO_S *pstVdpWbcInfo);*/

/**
 \brief 获取WbcInfo信息
 \attention \n
无

 \param[in]  HI_PQ_WBC_INFO_S* pstWbcInfo

 \retval ::HI_SUCCESS

 */

HI_S32 DRV_PQ_InitVpssAlgCfg(HI_U32 u32HandleNo, HI_VPSS_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVPSSReg);

HI_S32 DRV_PQ_InitVdpAlgCfg(HI_PQ_DISPLAY_E enDisplayId, HI_VDP_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVDPReg);

HI_S32 DRV_PQ_GetVpssAlgCfg(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_DISP_INFO_S *pstPqDispInfo,
                            HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, HI_PQ_VPSS_OUT_INFO_S *pstPqVpssOutInfo);
HI_S32 DRV_PQ_UpdateVdpOnlinePQ(HI_PQ_DISPLAY_E enDisplayId, HI_PQ_ONLINE_INFO_S *pstOnlineInfo, HI_VOID *pstVDPReg);

/*HI_S32 DRV_PQ_GetWbcInfo(HI_PQ_WBC_INFO_S *pstVpssWbcInfo);*/


/**
 \brief 获取图形高清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[out] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetHDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief 获取图形标清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[out] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetSDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);


/**
 \brief 设置图形高清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[in] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetHDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief 设置图形标清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[in] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetSDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief 获取视频高清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[out] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetHDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief 获取视频标清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[out] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetSDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);


/**
 \brief 设置视频高清亮度/对比度/色调/饱和度
 \attention \n
无

 \param[in] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetHDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief 设置视频标清亮度/对比度/色调/饱和度
无

 \param[in] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetSDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief 获取视频通话近端亮度/对比度/色调/饱和度
无

 \param[in] u32Hue   亮度/对比度/色调/饱和度

 \retval ::HI_SUCCESS

 */

/*HI_S32 DRV_PQ_GetVdpZmeCoef(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, HI_PQ_ZME_COEF_TYPE_E enCoefType, HI_PQ_ZME_TAP_E enZmeTap, HI_S16 *ps16Coef);*/

HI_S32 DRV_PQ_GetVdpZmeStrategy (HI_PQ_ZME_LAYER_E enLayerId, HI_PQ_ZME_STRATEGY_IN_U *pstZmeIn, HI_PQ_ZME_STRATEGY_OUT_U *pstZmeOut);

HI_S32 DRV_PQ_SetDefaultParam(HI_BOOL bDefault);

#endif

HI_S32 DRV_PQ_InitGfxZme(HI_VOID);

HI_S32 DRV_PQ_SetGfxZme(HI_PQ_GFX_LAYER_E enGfxZmeLayer, HI_PQ_GFX_ZME_PARA_S *pstGfxZmePara);

HI_S32 DRV_PQ_SetGfxCscCoef(HI_PQ_GFX_LAYER_E enGfxCscLayer, HI_PQ_GFX_CSC_PARA_S *pstGfxCscPara);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* End of #ifndef __DRV_PQ_EXT_H__ */
