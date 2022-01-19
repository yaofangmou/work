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
    HI_PQ_VDP_LAYER_VID_HD0  = 0, /* ������Ƶ��0 */
    HI_PQ_VDP_LAYER_VID_HD1  = 1, /* ������Ƶ��1 */

    HI_PQ_VDP_LAYER_VID_SD0  = 3, /* ������Ƶ��0 */

    HI_PQ_VDP_LAYER_VID_BUTT
} HI_PQ_VDP_LAYER_VID_E;


/* VPSS��Ƶ��Ϣ */
#if 1
typedef struct hiHI_VPSS_PQ_INFO_S
{
    HI_U32              u32FrameIndex;       /* ֡��: 0��ʾ��Ҫ��ʼ�� */
    HI_U32              u32Width;           /* ͼ���� */
    HI_U32              u32Height;          /* ͼ��߶� */
    HI_U32              u32FrameRate;       /* ����֡�� */
    HI_BOOL             bInterlace;         /* �Ƿ�����ź� */
} HI_VPSS_PQ_INFO_S;

typedef struct hiHI_ONLINE_INFO_S
{
    //HI_U32     u32FrameIndex;       /* ֡��: 0��ʾ��Ҫ��ʼ�� */
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

/* �㷨��λ�� */
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

    PQ_GFX_WBC_GP   , /* ��δʹ�� */

    PQ_GFX_LAYER_BUTT
} HI_PQ_GFX_LAYER_E;


/* DCIͳ�ƴ��� */
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
/* IFMD���㷨�����������������VPSS->PQ */
typedef struct hi_PQ_IFMD_CALC_S
{
    HI_U32  u32HandleNo;
    HI_U32  u32WidthY;
    HI_U32  u32HeightY;
    HI_U32  u32FieldOrder;                 /* ���׳��� �������ȵ׳����� */
    HI_S32  s32FieldMode;                  /* ���׳���־ */
    HI_U32  u32FrameRate;
    HI_BOOL bPreInfo;                      /* DEI�߼�����timeout���Ծɴ�����һ�� */

    PQ_VDEC_INFO_S      stVdecInfo;
    HI_VOID *pstIfmdHardOutReg; /* ��ȡifmd��״̬�Ĵ���,���ڲ�ת��ΪS_VPSS_STT_REGS_TYPE����ʹ�� */

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
    HI_U32  u32FieldOrder;    /* ���س��� */
#if 1
    HI_S32  s32SceneChanged;  /* �����л���Ϣ */
    HI_S32  s32FilmType;      /* ��Ӱģʽ */
    HI_U32  u32KeyValue;      /* �ؼ�֡ */
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

/* Vdec����Э��; 0: H265, 1: H264, 2: Mpeg2, 3: VP9, 4: mndet */
typedef enum hiPQ_VDEC_PROTOCOL_E
{
    HI_PQ_VDEC_PROTOCOL_H265 = 0,
    HI_PQ_VDEC_PROTOCOL_H264    ,
    HI_PQ_VDEC_PROTOCOL_MPEG2   ,
    HI_PQ_VDEC_PROTOCOL_VP9     ,
    HI_PQ_VDEC_PROTOCOL_MNDET   ,

    HI_PQ_VDEC_PROTOCOL_BUTT    ,

} HI_PQ_VDEC_PROTOCOL_E;

/* VDP��Ƶ��Ϣ */
typedef struct hiHI_VDP_PQ_INFO_S
{
    HI_PQ_VDP_LAYER_VID_E       enLayerId;          /* ͨ���µĲ� */
    HI_U32                      u32Width;           /* ͼ���� */
    HI_U32                      u32Height;          /* ͼ��߶� */
    HI_U32                      u32FrameRate;       /* ����֡�� */
    HI_BOOL                     bInterlace;         /* �Ƿ�����ź� */
    HI_BOOL                     bSRState;           /* SR ���� */
    HI_BOOL                     bIsogenyMode;       /* �Ƿ�ͬԴģʽ */
    HI_BOOL                     bHdrMode;           /* �Ƿ�hdrģʽ*/
    HI_BOOL                     bPartUpdate;        /* �Ƿ񲿷ָ��²��� */
    HI_BOOL                     b3dType;            /* �Ƿ�3D���� */
    HI_VDP_CHANNEL_TIMING_S     stChannelTiming[HI_PQ_DISPLAY_BUTT];
    HI_RECT_S                   stVideo;            /* ��Чͼ������ */
} HI_VDP_PQ_INFO_S;

#if 0
typedef struct hiPQ_VPSS_MODULE_S
{
    HI_PQ_SCENEMODE_E           enSceneMode;

} HI_PQ_VPSS_MODULE_S;
#endif

/* VPSS �����������Ϣ */
typedef struct hiPQ_WBC_INFO_S
{
    /* Common */
    HI_U32    u32FrameIndex;

    HI_U32    u32HandleNo;
    HI_U32    u32BitDepth;              /* ͨ·����λ�� */
    HI_U32    u32Width;                 /* ʵ�ʴ���Ŀ�� */
    HI_U32    u32Height;                /* ʵ�ʴ���ĸ߶� */
    HI_BOOL   bProgressive;             /* ��������Ϣ */
    HI_S32    s32FieldMode;             /* ��ǰ�����Ա�ʶ: 0:Top; 1:Bottom */
    HI_BOOL    bDeiEn;             /* DEI ʹ�ܱ�ʶ */
    HI_BOOL   bMcnrEn;          /* MCNR ʹ�ܱ�־, tile,rwzb disable mcnr */

    HI_VOID *pstVpssWbcReg;  /* ifmd��Globlal Motion and DB�Ļ�д��Ϣ,�ڲ�ת��ΪS_VPSS_STT_REGS_TYPE���ʹ��� */

    /* GlobalMotion */
    HI_U32   u32Scd;
    HI_U32   u32Stride;
    HI_VOID *pRGMV;

    /* IFMD */
    HI_U32   u32FieldOrder;              /* ���׳��� �������ȵ׳����� */
    HI_U32   u32FrameRate;               /* ֡�� */
    HI_BOOL  bPreInfo;                   /* DEI�߼�����timeout, �Ծɴ�����һ�� */
    PQ_VDEC_INFO_S stVdecInfo;           /* VDEC ���ݵĸ�������Ϣ */

#if 1
    /* DNR */
    HI_U32  u32SingleModeFlag;           /* ����ģʽ��ʶ; 1:����;0:�ǵ��� */
    HI_U32  u32Protocol;                 /* ����Э�� */
    HI_U32  u32ImageAvgQP;               /* ͼ��ƽ�� QP */
    HI_U32  u32VdhInfoAddr;              /* dbinfo ��ַ */
    HI_U32  u32VdhInfoStride;            /* ��Ϣstride, �㷨Լ��Ϊ(ͼ����+7)/8 */
    HI_U32  u32ImageStruct;              /* ֡/�������ʶ */
#endif
} HI_PQ_WBC_INFO_S;

/* PQ Calc ����VPSS��������Ϣ */
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
    HI_U32  u32FieldOrder;    /* ���س��� */
    //HI_S32  s32SceneChanged;  /* �����л���Ϣ */
    //HI_S32  s32FilmType;      /* ��Ӱģʽ */
    //HI_U32  u32KeyValue;      /* �ؼ�֡ */
    /* DNR */
} HI_PQ_CFG_INFO_S;

typedef struct hiPQ_VDP_WBC_INFO_S
{
    /* Common */
    HI_PQ_VDP_LAYER_VID_E  enLayerId;          /* �� */
    HI_U32                 u32BitDepth;        /* ͨ·����λ�� */
    HI_RECT_S              stOriCoordinate;    /* Crop֮ǰ���� */
    HI_RECT_S              stCropCoordinate;   /* Crop֮������ */
    HI_PQ_ALGIP_SEL_E      enAlgIPSel;         /* �㷨��λ�� */
    HI_VOID    *pstVdpWbcReg;       /* ifmd��Globlal Motion and DB�Ļ�д��Ϣ���ڲ�ת��ΪS_VPSS_STT_REGS_TYPE���ʹ��� */
    HI_U32                 u32VdpWbcRegPhyAddr;

    /* DNR */
    HI_BOOL                bCropBeforeDB;      /* 0: ��DB֮��Crop;1: ��DB ֮ǰCrop */
    HI_U32                 u32SingleModeFlag;  /* ����ģʽ��ʶ; 1:����;0:�ǵ��� */
    HI_U32                 u32ImageAvgQP;      /* ͼ��ƽ�� QP */
    HI_U32                 u32VdhInfoAddr;     /* dbinfo ��ַ */
    HI_U32                 u32VdhInfoStride;   /* ��Ϣstride, �㷨Լ��Ϊ(ͼ����+7)/8 */
    HI_U32                 u32ImageStruct;     /* ֡/�������ʶ */
    HI_PQ_VDEC_PROTOCOL_E  enVdecProtocol;     /* ����Э�� */

} HI_PQ_VDP_WBC_INFO_S;

#if 1  // ������֡��Ϣ
// ֡��Ϣ����
typedef struct hiHI_PQ_FRAME_INFO_S
{
    /* Common */
    HI_U32    u32FrameIndex;      /* ֡��: ��1��ʼ 1,2,3,... */
    HI_BOOL   bInit;              /* �Ƿ���Ҫ��ʼ��PQ */
    HI_U32    u32HandleNo;
    HI_BOOL   bSoftAlgPass;       /* ���㷨ȫ��͸��ģʽ */

    HI_BOOL   bProgressive;       /* ��������Ϣ */
    HI_U32    u32Width;           /* ͼ���� */
    HI_U32    u32Height;          /* ͼ��߶� */
    HI_U32    u32BitDepth;        /* ͨ·����λ�� */

    HI_BOOL   bDeiEn;             /* DEI ʹ�ܱ�ʶ */
    HI_BOOL   bTnrEn;             /* TNR ʹ�ܱ�ʶ */
    HI_BOOL   bMcnrEn;            /* MCNR ʹ�ܱ�־, tile,rwzb disable mcnr */
    HI_BOOL   bSnrEn;             /* SNR ʹ�ܱ�ʶ */
    HI_BOOL   bDbEn;              /* DB ʹ�ܱ�ʶ */
    HI_BOOL   bDmEn;              /* DM ʹ�ܱ�ʶ */

    /* GlobalMotion */
    HI_U32   u32Scd;              /* no use */
    HI_U32   u32Stride;
    HI_VOID  *pRGMV;

    /* IFMD */
    HI_BOOL  bPreInfo;                   /* DEI�߼�����timeout, �Ծɴ�����һ�� */ /* ��ǰһ�¸�false*/

    HI_U32    u32FrameRate;       /* ����֡�� */
    HI_S32    s32FieldMode;       /* ��ǰ�����Ա�ʶ: 0:Top; 1:Bottom */
    HI_U32   u32FieldOrder;              /* ���׳��� �������ȵ׳����� */
    PQ_VDEC_INFO_S stVdecInfo;           /* VDEC ���ݵĸ�������Ϣ */

#if 0 // ��ʱ������
    /* DNR */  //dbm
    HI_U32  u32SingleModeFlag;           /* ����ģʽ��ʶ; 1:����;0:�ǵ��� */
    HI_U32  u32Protocol;                 /* ����Э�� */
    HI_U32  u32ImageAvgQP;               /* ͼ��ƽ�� QP */                                  // 98c2 Ҫ�ã�430 nr���ã���ȷ��dbm�ò���

    HI_U32  u32VdhInfoAddr;              /* dbinfo ��ַ */
    HI_U32  u32VdhInfoStride;            /* ��Ϣstride, �㷨Լ��Ϊ(ͼ����+7)/8 */
    HI_U32  u32ImageStruct;              /* ֡/�������ʶ */
#endif
} HI_PQ_FRAME_INFO_S;

//2���������
typedef struct hiHI_PQ_DISP_INFO_S
{
    HI_PQ_DISPLAY_E enDisplayId; /* DISPͨ�� */
    HI_PQ_VDP_LAYER_VID_E       enLayerId;          /* ͨ���µĲ� */
    HI_VDP_CHANNEL_TIMING_S     stChannelTiming[HI_PQ_DISPLAY_BUTT];
    HI_RECT_S                   stVideo;            /* ��Чͼ������ */

    HI_BOOL                     bIsogenyMode;       /* �Ƿ�ͬԴģʽ */
    HI_BOOL                     bPartUpdate;        /* �Ƿ񲿷ָ��²��� */
    HI_BOOL                     b3dType;            /* �Ƿ�3D���� */
} HI_PQ_DISP_INFO_S;


//4��reg����
typedef struct hiHI_PQ_VPSS_REG_INFO_S
{
    HI_VOID *pstVpssReg;    /* reg in , only read���ڲ�ת��ΪS_VPSSIP_ALG_SET_REGS_TYPE���ʹ��� */
    HI_VOID *pstVpssWbcReg; /* ifmd��Globlal Motion and DB�Ļ�д��Ϣ���ڲ�ת��ΪS_VPSS_STT_REGS_TYPE���ʹ��� */  /* reg in , only read */

    HI_VOID *pstVpssAlgRegOut; /* reg out , write���ڲ�ת��ΪS_VPSSIP_ALG_SET_REGS_TYPE���ʹ��� */
} HI_PQ_VPSS_REG_INFO_S;

//5��softout

/* PQ Calc ����VPSS��������Ϣ */
typedef struct hiPQ_VPSS_OUT_INFO_S
{
    /* IFMD */
    HI_S32  die_reset;
    HI_S32  die_stop;
    HI_S32  dir_mch;
    HI_S32  die_out_sel;
    /* ����VPSS����֡���� */

    HI_U32  u32FieldOrder;    /* ���س���0 topFirst */
    HI_DRV_PQ_FIELDORDER_E  enFieldOrder;

    /* ���ϼ�����Ҫʹ�� */

    HI_U32  u32EdgeSmoothEn; /* inner use */
#if 0
    HI_S32  jud_en; //δ�ù�
    HI_S32  ChromaVertFltEn;//δ�ù�

    HI_S32  s32SceneChanged;  /* �����л���Ϣ */   /* û�ù� */
    HI_S32  s32FilmType;      /* ��Ӱģʽ */  /* PQ�ڲ�ʹ�ã�VPSS���� */
    HI_U32  u32KeyValue;      /* �ؼ�֡ */     /* PQ�ڲ�ʹ�ã�VPSS���� */
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
 \brief Timming�仯�����VDP PQ��������
 \attention \n
��

 \param[in] u32DisplayId
 \param[in] pstTimingInfo: Timming Info
 \param[in] *pstVDPReg:VDP ����Ĵ�����ַ���ڲ�ת��ΪS_VDP_REGS_TYPE���ʹ���

 \retval ::HI_SUCCESS

 */

HI_S32 DRV_PQ_UpdateVdpPQ(HI_PQ_DISPLAY_E enDisplayId, HI_VDP_PQ_INFO_S *pstTimingInfo, HI_VOID *pstVDPReg);


/**
 \brief ����ZME
 \attention \n
��

 \param[in] u32LayerId:
 \param[in] pstZmeDrvPara:
 \param[in] bFirEnable

 \retval ::HI_SUCCESS

 */
/*HI_S32 DRV_PQ_SetZme(HI_PQ_ZME_LAYER_E e32LayerId, HI_PQ_ZME_PARA_IN_S *pstZmeDrvPara, HI_BOOL bFirEnable);*/


/**
 \brief ��ȡCSCϵ��
 \attention \n
��

 \param[in] enCSCMode:
 \param[out] pstCSCCoef:
 \param[out] pstCSCDCCoef:

 \retval ::HI_SUCCESS

 */

HI_S32 DRV_PQ_GetCSCCoef(HI_PQ_CSC_CRTL_S *pstCscCtrl, HI_PQ_CSC_MODE_E enCscMode, HI_PQ_CSC_COEF_S *pstCscCoef, HI_PQ_CSC_DCCOEF_S *pstCscDcCoef);

/**
 \brief ��ȡ8bit CSCϵ��
 \attention \n
��

 \param[in] enCSCMode:
 \param[out] pstCSCCoef:
 \param[out] pstCSCDCCoef:

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_Get8BitCSCCoef(HI_PQ_CSC_MODE_E enCSCMode, HI_PQ_CSC_COEF_S *pstCSCCoef, HI_PQ_CSC_DCCOEF_S *pstCSCDCCoef);


/**
 \brief �����㷨������֮��ļĴ���
 \attention \n
��

 \param[in]  *pstWbcInfo
 \param[out]
 \retval ::HI_SUCCESS

 */
/*HI_S32 DRV_PQ_SetAlgCalcCfg(HI_PQ_WBC_INFO_S *pstVpssWbcInfo, HI_PQ_CFG_INFO_S *pstVpssCfgInfo);*/

/**
 \brief �����㷨������֮��ļĴ���
 \attention \n
��

 \param[in]  *pstWbcInfo
 \param[out]
 \retval ::HI_SUCCESS

 */
/*HI_S32 DRV_PQ_SetVdpAlgCalcCfg(HI_PQ_VDP_WBC_INFO_S *pstVdpWbcInfo);*/

/**
 \brief ��ȡWbcInfo��Ϣ
 \attention \n
��

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
 \brief ��ȡͼ�θ�������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[out] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetHDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief ��ȡͼ�α�������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[out] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetSDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);


/**
 \brief ����ͼ�θ�������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[in] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetHDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief ����ͼ�α�������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[in] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetSDPictureSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief ��ȡ��Ƶ��������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[out] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetHDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief ��ȡ��Ƶ��������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[out] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_GetSDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);


/**
 \brief ������Ƶ��������/�Աȶ�/ɫ��/���Ͷ�
 \attention \n
��

 \param[in] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetHDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief ������Ƶ��������/�Աȶ�/ɫ��/���Ͷ�
��

 \param[in] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

 \retval ::HI_SUCCESS

 */
HI_S32 DRV_PQ_SetSDVideoSetting(HI_PQ_PICTURE_SETTING_S *pstPictureSetting);

/**
 \brief ��ȡ��Ƶͨ����������/�Աȶ�/ɫ��/���Ͷ�
��

 \param[in] u32Hue   ����/�Աȶ�/ɫ��/���Ͷ�

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
