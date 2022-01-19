#ifndef __VDP_DRV_VID_H__
#define __VDP_DRV_VID_H__
#include "vdp_define.h"
#include "vdp_hal_vid.h"
#include "vdp_hal_chn.h"
#include "vdp_drv_comm.h"
#include "vdp_ip_define.h"
#include "hi_register_vdp.h"
#include "vdp_qfrm_reg.h"
#include "hi_type.h"

#include "outer_depend.h"

#ifdef  VDP_PQ_STRATEGY
#include "drv_pq_ext.h"
#include "drv_pq_ext_zme.h"
#else
#include "vdp_drv_pq_ext.h"
#endif

#if ((VDP_CBB_FPGA) && defined(VDP_ZME_COPY_MODE))
//#define  GetVdpZmeCoef VDP_GetVdpZmeCoef
#else
#endif

#define CBB_CFG_FROM_PQ  1

#define MAX_WINDOWS_NUM  17

typedef enum tagXDP_THE_NUM_ZME_E
{
    XDP_THE_NUM_ZME1 = 1,
    XDP_THE_NUM_ZME2 = 2,
    XDP_THE_NUM_ZME_BUTT

} XDP_THE_NUM_ZME_E;

typedef struct tagVDP_ADDR_S
{
    HI_U32 u32LumAddr;
    HI_U32 u32ChmAddr;

    HI_U32 u32LumStr;
    HI_U32 u32ChmStr;

    HI_U32  u32DcmpHeadSize;

    HI_BOOL bSecure;
    HI_BOOL bSmmu;
} VDP_ADDR_S;

typedef enum tagVDP_ADDR_E
{
    VDP_ADDR_DATA = 0,//2d left eye data
    VDP_ADDR_3D      ,//3d right eye data
    VDP_ADDR_TILE    ,//tile64 2bit
    VDP_ADDR_TILE_3D ,//tile64 2bit  right eye data
    VDP_ADDR_HEAD    ,//dcmp head data
    VDP_ADDR_EL      ,//dolby EL data
    VDP_ADDR_BUTT
} VDP_ADDR_E;

typedef enum tagVDP_CLR_SPACE_E
{
    VDP_CLR_SPACE_YUV_601   = 0x1,
    VDP_CLR_SPACE_YUV_709   ,
    VDP_CLR_SPACE_YUV_2020  ,
    VDP_CLR_SPACE_RGB_601   ,
    VDP_CLR_SPACE_RGB_709   ,
    VDP_CLR_SPACE_RGB_2020  ,
    VDP_CLR_SPACE_YUV_601_L   ,
    VDP_CLR_SPACE_YUV_709_L   ,
    VDP_CLR_SPACE_YUV_2020_L  ,
    VDP_CLR_SPACE_RGB_601_L   ,
    VDP_CLR_SPACE_RGB_709_L   ,
    VDP_CLR_SPACE_RGB_2020_L  ,

    VDP_CLR_SPACE_BUTT

} VDP_CLR_SPACE_E;

typedef struct tagVDP_CSC_INFO
{
    VDP_CLR_SPACE_E enTmpInClr;
    VDP_CLR_SPACE_E enTmpOutClr;
    VDP_CSC_MODE_E enCscMode;
    HI_PQ_CSC_MODE_E enPqCscMode;
} VDP_CSC_INFO;

typedef enum hiXDP_VIDEO_FRAME_TYPE_E
{
    XDP_VIDEO_FRAME_TYPE_SDR = 0,      /*Normal SDR frame.*/
    XDP_VIDEO_FRAME_TYPE_DOLBY_BL,     /*Dolby BL frame.*/
    XDP_VIDEO_FRAME_TYPE_DOLBY_EL,     /*Dolby EL frame.*/
    XDP_VIDEO_FRAME_TYPE_HDR10,        /*HDR10 frame.*/
    XDP_VIDEO_FRAME_TYPE_HLG,          /*HLG frame.*/
    XDP_VIDEO_FRAME_TYPE_SLF,          /*SLF frame.*/
    XDP_VIDEO_FRAME_TYPE_JTP_SL_HDR,
    XDP_VIDEO_FRAME_TYPE_BUTT
} XDP_VIDEO_FRAME_TYPE_E;

typedef enum hiXDP_DISP_OUT_TYPE_E
{
    XDP_DISP_TYPE_NORMAL = 0,    /* 普通信号显示 BT601 BT709*/
    XDP_DISP_TYPE_SDR_CERT,      /* SDR输出认证时需要*/
    XDP_DISP_TYPE_DOLBY,         /* DolbyVision信号显示 */
    XDP_DISP_TYPE_HDR10,         /* 标准HDR信号显示 */
    XDP_DISP_TYPE_HDR10_CERT,
    XDP_DISP_TYPE_HLG,
    XDP_DISP_TYPE_TECHNICOLOR,

    XDP_DISP_TYPE_BUTT
} XDP_DISP_OUT_TYPE_E;

typedef enum
{
    HIHDR_HDR10_IN_SDR_OUT = 0,
    HIHDR_HDR10_IN_HDR10_OUT ,
    HIHDR_HDR10_IN_HLG_OUT,
    HIHDR_HLG_IN_SDR_OUT ,
    HIHDR_HLG_IN_HDR10_OUT ,
    HIHDR_HLG_IN_HLG_OUT ,

    HIHDR_SLF_IN_SDR_OUT ,
    HIHDR_SLF_IN_HDR10_OUT ,
    HIHDR_SLF_IN_HLG_OUT ,
    HIHDR_XVYCC,

    HIHDR_SDR_BT2020CL_IN_BT709_OUT,
    HIHDR_SDR_BT2020CL_IN_BT2020CL_OUT,
    HIHDR_BT2020_IN_RGB_709_OUT,
    HIHDR_BT2020_IN_709_OUT,
    HIHDR_BT2020_IN_2020_OUT,
    HIHDR_SDR_IN_HDR10_OUT ,
    HIHDR_SDR_IN_HLG_OUT ,
    HIHDR_709_IN_BT2020_OUT,
    HIHDR_BYPASS_MODE ,
    HIHDR_TECHNI_IN_HDR10_OUT,
    HIHDR_TECHNI_IN_HLG_OUT,
    HIHDR_TECHNI_IN_SDR_OUT,

    HIHDR_AVS_IN_SDR_OUT,
    HIHDR_AVS_IN_HDR10_OUT,


    HIHDR_SCENE_BUTT
} HIHDR_SCENE_MODE_E;

typedef struct tagXDP_LAYER_SRC_INFO_S
{
    VDP_ADDR_S             stAddr[VDP_ADDR_BUTT] ;
    VDP_CLR_SPACE_E        enSrcClrSpace         ;//no use
    VDP_RECT_S             stSrcRect             ;
    HI_BOOL                bSmmuEn               ;//no use
    XDP_VIDEO_FRAME_TYPE_E enXdpViDeoFrameType   ;//no use

    VDP_VID_IFMT_E         enInFmt     ;
    VDP_DATA_WTH           enDataWidth ;
    HI_BOOL                bDcmpEn     ;//no use
    HI_BOOL                bDcmpLost   ;//no use
    HI_BOOL                bCompatibleSource;//no use
    VDP_RECT_S             stElSrcRect   ;//no use
    VDP_VID_IFMT_E         enElInFmt     ;//no use
    VDP_DATA_WTH           enElDataWidth ;//no use
    HI_BOOL                bUVOrder;

    HI_U32 u32FrameRate;
    HI_U32  u32TopFieldFirst;


} XDP_LAYER_SRC_INFO_S;

typedef struct tagXDP_ZME_SHOOTCTRL_S
{
    HI_BOOL bShootctrlEn;
    HI_BOOL bShootctrlMode;
    HI_BOOL bFlatdectMode;
    HI_BOOL bCoringadjEn;
    HI_U32 u32Gain;
    HI_U32 u32Coring;
} XDP_ZME_SHOOTCTRL_S;

typedef struct tagXDP_LAYER_HZME_CFG_S
{
    HI_BOOL          bHzmeEn;
    HI_BOOL          bHLumMidEn;
    HI_BOOL          bHChmMidEn;
    VDP_ZME_FIR_MODE_E  enHLumFirMode;
    VDP_ZME_FIR_MODE_E  enHChmFirMode;
    HI_U32           u32HzmeOutWth;
    HI_U32           u32HzmeOutHgt;
    HI_U32           u32LumOffset;
    HI_U32           u32ChmOffset;
    XDP_ZME_SHOOTCTRL_S stShootCtrl[XDP_ZME_SHOOT_BUTT];
    HI_U32 u32HorCoefAddr;

    VDP_HZME_MODE_E  enHzmeMode;//need del

} XDP_LAYER_HZME_CFG_S;

typedef struct tagXDP_LAYER_EXTERN_S
{
    HI_U32 u32HorRation;
    HI_U32 u32VerRation;
    HI_BOOL bReduceDataWth;

    HI_BOOL bVtapReduce;

    HI_PQ_ZME_COEF_RATIO_E enRationHL;
    HI_PQ_ZME_COEF_RATIO_E enRationHC;
    HI_PQ_ZME_COEF_RATIO_E enRationVL;
    HI_PQ_ZME_COEF_RATIO_E enRationVC;

    HI_PQ_ZME_COEF_RATIO_E enZme2RationHL;
    HI_PQ_ZME_COEF_RATIO_E enZme2RationHC;
    HI_PQ_ZME_COEF_RATIO_E enZme2RationVL;
    HI_PQ_ZME_COEF_RATIO_E enZme2RationVC;

    VDP_VID_IFMT_E         enXdpElInfmt  ;

    HI_BOOL bConfigWholeLayer;
    HI_BOOL bGfxWeakCorlor;
    HI_U32  u32LinkEn; // use
    HI_BOOL bPQZmeCoefRefresh;
    HI_BOOL bPQHDRCoefRefresh;
    HI_BOOL bCloseY2R;
} XDP_LAYER_EXTERN_S;

typedef struct tagXDP_ZME_LTICTRL_S
{
    HI_BOOL bLtiEn;
    HI_U32 u32LgainRatio;
    HI_U32 u32LmixingRatio;
    HI_U32 u32LcoringThd;
    HI_U32 u32LunderSwing;
    HI_U32 u32LoverSwing;
} XDP_ZME_LTICTRL_S;

typedef struct tagXDP_LAYER_ZME_CFG_S
{
    HI_BOOL bHzmeEn;
    HI_BOOL bVzmeEn;
    HI_BOOL bHLumMidEn;
    HI_BOOL bVLumMidEn;
    HI_BOOL bHChmMidEn;
    HI_BOOL bVChmMidEn;

    VDP_ZME_FIR_MODE_E  enHLumFirMode;
    VDP_ZME_FIR_MODE_E  enHChmFirMode;
    VDP_ZME_FIR_MODE_E  enVLumFirMode;
    VDP_ZME_FIR_MODE_E  enVChmFirMode;

    HI_S32           s32HLumOffset;
    HI_S32           s32HChmOffset;
    HI_S32           s32VLumOffset;
    HI_S32           s32VChmOffset;
    HI_S32           s32VLumBOffset;
    HI_S32           s32VChmBOffset;

    HI_U32 u32HorCoefAddr;
    HI_U32 u32VerCoefAddr;

    XDP_ZME_SHOOTCTRL_S stShootCtrl[XDP_ZME_SHOOT_BUTT];
    XDP_ZME_LTICTRL_S stLtiCtrl;

    VDP_RECT_S stZme2InRect;//del
    HI_PQ_IMAGE_FMT_S   stZmeFmt[HI_PQ_V0_ZME_NODE_BUTT];//del

    HI_BOOL bZmeFrmFmtOut;//del
    HI_BOOL bZmeBFIn ;//del
    HI_BOOL bZmeBFOut;//del
    HI_U32 u32ZmeNum;//del

} XDP_LAYER_ZME_CFG_S;

typedef struct tagXDP_CSC_CFG_S
{
    //VDP_CSC_MODE_E     enCbbCscMode;
    HI_PQ_CSC_MODE_E   enPqCscMode;

    HI_PQ_CSC_COEF_S   stPqCscCoef;
    HI_PQ_CSC_DCCOEF_S stPqCscDc;

} XDP_CSC_CFG_S;

typedef struct
{
    HI_S32 s32ZmeOffsetHC;
    HI_S32 s32ZmeOffsetVC;
    HI_S32 s32ZmeOffsetVLBtm;
    HI_S32 s32ZmeOffsetVCBtm;
    HI_S32 bZmeOrder;

    HI_U32 u32ZmeWIn ;
    HI_U32 u32ZmeWOut;
    HI_U32 u32ZmeHIn ;
    HI_U32 u32ZmeHOut;
    HI_U32 u32ZmeRatioHL;
    HI_U32 u32ZmeRatioVL;
    HI_U32 u32ZmeRatioHC;
    HI_U32 u32ZmeRatioVC;

    HI_S32 s32ZmeOffsetHL;
    HI_S32 s32ZmeOffsetVL;
} VDP_VZME_RTL_PARA_S;

typedef struct tagXDP_LAYER_DISP_INF_S
{
    HI_BOOL                bInterlace;//no use
    VDP_RECT_S             stFmtReso;//no use
    VDP_DISP_MODE_E        enDispMode;
    VDP_CLR_SPACE_E        enOutClrSpace;//no use
    XDP_DISP_OUT_TYPE_E    enDisPlayMode;//no use

} XDP_LAYER_DISP_INF_S;

typedef enum XDP_ADDR_3D_2LOWBIT_E
{
    XDP_ADDR_3D_2LOWBIT_LEFT_EYE = 0x0,
    XDP_ADDR_3D_2LOWBIT_RIGHT_EYE = 0x1,
    XDP_ADDR_3D_2LOWBIT_2LOWBIT = XDP_ADDR_3D_2LOWBIT_RIGHT_EYE,

    XDP_ADDR_3D_2LOWBIT_BUTT

} XDP_ADDR_3D_2LOWBIT_E;

typedef struct tagXDP_LAYER_SYS_CFG_S
{
    HI_U32  u32RegionNO   ;//no use
    HI_U32  u32LayerZorder;//no use
    HI_BOOL bRegionEn     ;
    HI_BOOL bMuteEn       ;//no use
    HI_BOOL bRegionModeEn ;//no use
    HI_BOOL bSecureEn     ;//no use
    HI_U32  u32Alpha      ;//no use
    HI_U32  u32AllAlpha   ;
    HI_BOOL bVdmProcess[MAX_WINDOWS_NUM];//no use
    HI_U32  u32VdmOnLayerId;//no use
    HI_BOOL bRWZB;
    HI_BOOL bLowMemMode;
    HI_BOOL bForceFodEn;
    HI_BOOL bFieldMatch;

} XDP_LAYER_SYS_CFG_S;

typedef struct tagXDP_LAYER_FDR_CFG_S
{
    VDP_DATA_RMODE_E       enReadMode       ;
    VDP_RECT_S             stCropRect       ;
    VDP_RECT_S             stTileCropRect   ;//no use
    VDP_DRAW_MODE_E        enDrawMode       ;
    VDP_DRAW_MODE_E        enDrawPixelMode  ;
    HI_BOOL                bFlipEn          ;
    HI_BOOL                bWtunlEn;
    HI_U32                 u32ReverseTunnelPhyAddr;

} XDP_LAYER_FDR_CFG_S;

typedef struct tagXDP_LAYER_VFFDR_CFG_S
{
    VDP_RECT_S             stSrcRect        ;
    VDP_RECT_S             stCropRect       ;
    VDP_DRAW_MODE_E        enDrawMode       ;
    VDP_DRAW_MODE_E        enDrawPixelMode  ;
    HI_BOOL                bUVOrder;
} XDP_LAYER_VFFDR_CFG_S;


typedef struct tagXDP_LAYER_BKG_CFG_S
{
    VDP_BKG_S   stMuteColor     ;
    VDP_BKG_S   stLetterBoxColor;
    VDP_BKG_S   stMixvColor     ;
    VDP_BKG_S   stCbm0Color     ;

} XDP_LAYER_BKG_CFG_S;

typedef struct tagXDP_LAYER_DISP_POSITION_CFG_S
{
    VDP_RECT_S  stCropRect  ;
    VDP_RECT_S  stVideoRect  ;
    VDP_RECT_S  stDispRect   ;
    VDP_RECT_S  stVp0DispRect;//no use

} XDP_LAYER_DISP_POSITION_CFG_S;

typedef struct tagXDP_LAYER_VC1_CFG_S
{
    HI_U32 u32RangeDfrm;
    HI_U32 u32ProFile;
    HI_U32 u32MapYFlg;
    HI_U32 u32MapCFlg;
    HI_U32 u32MapY;
    HI_U32 u32MapC;

} XDP_LAYER_VC1_CFG_S;

typedef enum tagXDP_DEMO_MODE_E
{
    XDP_DEMO_RIGHT  = 0,
    XDP_DEMO_LEFT   = 1,

    XDP_DEMO_BUTT

}XDP_DEMO_MODE_E;
typedef enum tagXDP_ACC_TABLE_E
{
    XDP_ACC_LOW  = 0,
    XDP_ACC_MID  = 1,
    XDP_ACC_HIGH = 2,

    XDP_ACC_BUTT

}XDP_ACC_TABLE_E;

typedef struct tagXDP_ACC_TABLE_S
{
    HI_U32 u32Data0;
    HI_U32 u32Data1;
    HI_U32 u32Data2;
    HI_U32 u32Data3;
    HI_U32 u32Data4;
    HI_U32 u32Data5;
    HI_U32 u32Data6;
    HI_U32 u32Data7;
    HI_U32 u32Data8;

} XDP_ACC_TABLE_S;
typedef struct tagXDP_LAYER_ACC_CFG_S
{
    HI_BOOL bEn;
    HI_BOOL bAccMode;
    HI_U32  u32ThdMedLow;
    HI_U32  u32ThdHigh;
    HI_U32  u32ThdLow;
    HI_BOOL bAccRst;
    HI_U32  u32ThdMedHigh;

    HI_U32  u32DemoSplitPoint;
    XDP_DEMO_MODE_E enDemoMode;
    HI_BOOL bDemoEn;
    XDP_ACC_TABLE_S stAccTable[XDP_ACC_BUTT];

} XDP_LAYER_ACC_CFG_S;
typedef struct tagXDP_LAYER_CSC_CFG_S
{
    HI_PQ_CSC_MODE_E   enPqCscMode;
    HI_PQ_CSC_COEF_S   stPqCscCoef;
    HI_PQ_CSC_DCCOEF_S stPqCscDc;

} XDP_LAYER_CSC_CFG_S;
typedef enum tagXDP_ACM_PARA_E
{
    XDP_ACM_PARA0 = 0,
    XDP_ACM_PARA1 = 1,
    XDP_ACM_PARA2 = 2,
    XDP_ACM_PARA3 = 3,

    XDP_ACM_BUTT

}XDP_ACM_PARA_E;

typedef struct tagXDP_ACM_PARA_S
{
    HI_U32 u32AcmSecBlk;
    HI_U32 u32AcmFirBlk;
    HI_U32 u32AcmDUoff;
    HI_U32 u32AcmCUoff;
    HI_U32 u32AcmBUoff;
    HI_U32 u32AcmAUoff;
    HI_U32 u32AcmDVoff;
    HI_U32 u32AcmCVoff;
    HI_U32 u32AcmBVoff;
    HI_U32 u32AcmAVoff;

} XDP_ACM_PARA_S;
typedef struct tagXDP_LAYER_ACM_CFG_S
{
    HI_BOOL bAcm0En;
    HI_BOOL bAcm1En;
    HI_BOOL bAcm2En;
    HI_BOOL bAcm3En;
    HI_BOOL bBwProMode;
    XDP_DEMO_MODE_E enDemoMode;
    HI_BOOL bDemoEn;

    XDP_ACM_PARA_S stAcmPara[XDP_ACM_BUTT];

} XDP_LAYER_ACM_CFG_S;

typedef struct
{
    S_VDP_QF_REGS_TYPE *pstXdpRegTmp;//LOCAL REG STUCT
    S_VDP_QF_REGS_TYPE *pstCfgNode;

} XDP_CFG_MODE_S;

typedef enum
{
    XDP_DEI_FLD_FOUR = 1,
    XDP_DEI_FLD_THIRD,
    XDP_DEI_FLD_BUTT

} XDP_DEI_FLD_MODE_E;

typedef enum
{
    XDP_VPSSIP_BUFTYPE_FRAME = 1,
    XDP_VPSSIP_BUFTYPE_FIELD,
    XDP_VPSSIP_BUFTYPE_MAX,
    XDP_VPSSIP_BUFTYPE_BUTT

} XDP_VPSSIP_BUFTYPE_E;

typedef struct
{
    HI_BOOL bFrmInit;
    HI_BOOL bMacMadEn;
    HI_U32  u32BfieldFirst;
    HI_BOOL bIgbmEn;
    HI_BOOL bIfmdEn;
    HI_BOOL bTnrEn;
    HI_BOOL bSnrEn;
    XDP_DEI_FLD_MODE_E  u32DeiFldMode;
    HI_BOOL bBlkDetEn;
    HI_BOOL bRgmeEn;
    HI_BOOL bVc1En;
    HI_BOOL bDeiEn;
    HI_BOOL bMadVfirEn;
    HI_BOOL bMcnrEn;
    HI_BOOL bTnrMadMode;

    HI_U32  u32FrmCnt;
    HI_U32  u32HzmeWth;
    HI_U32  u32HzmeHgt;
    VDP_DATA_RMODE_E enRdMode;
    VDP_VID_IFMT_E  enDataFmt;
    HI_BOOL bVpssOutChnEn;
    HI_U32  u32BufStartAddr;
    HI_U32  u32BufStartVirtAddr;

    HI_U32  u32VpssoutStartAddr;
    HI_U32  u32VpssoutVirtAddr;
    HI_BOOL bFieldMatch;

    HI_BOOL bIsSD;
    XDP_DATA_WTH enNrDataWidth;

} XDP_VPSSIP_POLICY_S;

typedef struct
{
    HI_U32  u32BufSize;
    HI_U32  u32Str;
    HI_U32  u32Wth;
    HI_U32  u32Hgt;

    HI_U32  u32StartAddr;
    HI_U32  u32EndAddr;

} XDP_BUF_ADDR_S;

typedef enum
{
    VPSS_CYCBUF_CHNSET_OUT_Y,
    VPSS_CYCBUF_CHNSET_OUT_C,
    VPSS_CYCBUF_CHNSET_DI_Y,
    VPSS_CYCBUF_CHNSET_DI_C,
    VPSS_CYCBUF_CHNSET_HISM,
    VPSS_CYCBUF_CHNSET_DM_CNT,
    VPSS_CYCBUF_CHNSET_NR_MAD,
    VPSS_CYCBUF_CHNSET_STATH,
    VPSS_CYCBUF_CHNSET_STATV,
    VPSS_CYCBUF_CHNSET_RGMV,

    VPSS_CYCBUF_CHNSET_BUTT

} VPSS_CYCBUF_CHNSET_E;

typedef struct
{
    XDP_BUF_ADDR_S stChnSet[VPSS_CYCBUF_CHNSET_BUTT];

} XDP_VPSSIP_CHN_CFG_S;


typedef enum
{
    XDP_WBC_ROOT_PATH_ACBM = 0,
    XDP_WBC_ROOT_PATH_BZME,
    XDP_WBC_ROOT_PATH_BLBX,

    XDP_WBC_ROOT_PATH_BUTT

} XDP_WBC_ROOT_PATH_E;

typedef enum
{
    XDP_WBC_MODE_OUT_INTERFACE  = 0,
    XDP_WBC_MODE_OUT_PROGRESIVE = 1,
    XDP_WBC_MODE_OUT_TOP        = 2,
    XDP_WBC_MODE_OUT_BOTTOM     = 3,

    XDP_WBC_MODE_OUT_BUTT

} XDP_WBC_MODE_OUT_E;

typedef struct tagXDP_WBCDHD_CAP_CFG_S
{
    VDP_ADDR_S stAddr[VDP_ADDR_BUTT];

} XDP_WBCDHD_CAP_CFG_S;

typedef struct tagXDP_WBCDHD_LBOX_CFG_S
{
    HI_U32 u32X; //vzme输出图在屏幕里的位置
    HI_U32 u32Y;
    HI_U32 u32Wth; //vzme输出
    HI_U32 u32Hgt;
    HI_U32 u32OutWth; //回写大小(整个标清屏幕大小,包含了黑边)
    HI_U32 u32OutHgt;
    HI_BOOL bLboxEn;

} XDP_WBCDHD_LBOX_CFG_S;

typedef struct tagXDP_WBCDHD_CROP_CFG_S
{
    HI_U32 u32X;
    HI_U32 u32Y;
    HI_U32 u32Wth;
    HI_U32 u32Hgt;

} XDP_WBCDHD_CROP_CFG_S;

typedef struct tagXDP_WBCDHD_ZME_CFG_S
{
    HI_BOOL bHzmeEn       ;
    HI_BOOL bHLumMidEn    ;
    HI_BOOL bHChmMidEn    ;
    VDP_ZME_FIR_MODE_E enHLumFirMode ;
    VDP_ZME_FIR_MODE_E enHChmFirMode ;
    HI_U32 u32HLumOffset ;
    HI_U32 u32HChmOffset ;
    HI_BOOL bVzmeEn       ;
    HI_BOOL bVLumMidEn    ;
    HI_BOOL bVChmMidEn    ;
    VDP_ZME_FIR_MODE_E enVLumFirMode ;
    VDP_ZME_FIR_MODE_E enVChmFirMode ;
    HI_U32 u32VLumOffset ;
    HI_U32 u32VChmOffset ;
    HI_U32 u32VLumBOffset;
    HI_U32 u32VChmBOffset;
    HI_U32 u32HorCoefAddr;
    HI_U32 u32VerCoefAddr;

} XDP_WBCDHD_ZME_CFG_S;


typedef struct tagXDP_LAYER_WBCDHD_CFG_S
{
   XDP_WBC_ROOT_PATH_E enWbcRootPath;
   XDP_WBC_MODE_OUT_E enWbcModeOut;
   HI_BOOL bWbcEn;
   XDP_WBCDHD_CAP_CFG_S stWbcDhdCapCfg;
   XDP_WBCDHD_LBOX_CFG_S stWbcDhdLboxCfg;
   XDP_WBCDHD_CROP_CFG_S stWbcDhdCropCfg;
   XDP_WBCDHD_ZME_CFG_S stWbcDhdZmeCfg;

} XDP_LAYER_WBCDHD_CFG_S;

typedef struct tagXDP_LAYER_VID_INFO_S
{
    XDP_LAYER_SYS_CFG_S           stXdpSysCfg      ;
    XDP_LAYER_SRC_INFO_S          stXdpSrcCfg      ;
    XDP_LAYER_FDR_CFG_S           stXdpFdrCfg      ;
    XDP_LAYER_VFFDR_CFG_S         stXdpVfFdrCfg    ;
    XDP_LAYER_BKG_CFG_S           stXdpBkgCfg      ;//no use
    XDP_LAYER_DISP_POSITION_CFG_S stXdpPositionCfg ;
    XDP_LAYER_DISP_INF_S          stXdpDispCfg     ;
    XDP_LAYER_ZME_CFG_S           stXdpZmeCfg      ;
    XDP_LAYER_VC1_CFG_S           stXdpVc1Cfg      ;
    XDP_LAYER_ACC_CFG_S           stXdpAccCfg      ;
    XDP_LAYER_CSC_CFG_S           stXdpCscCfg[HI_PQ_CSC_TYPE_BUTT];
    XDP_LAYER_ACM_CFG_S           stXdpAcmCfg      ;

    XDP_LAYER_HZME_CFG_S          stXdpHZmeCfg     ;
    XDP_LAYER_EXTERN_S            stXdpLayerExtern ;
    HW_NODE_RUNNING_CONFIG_S      stXdpNodeInfo    ;

    XDP_LAYER_WBCDHD_CFG_S        stXdpWbcDhdCfg   ;

} XDP_LAYER_VID_INFO_S;

typedef struct tagVDP_DRV_ADDR_INFO_S
{
    //for flip calc
    HI_U32 u32Hgt;
    HI_U32 u32ChmRatio;

    VDP_VID_IFMT_E enInFmt;
    VDP_DISP_MODE_E enDispMode;

    //addr
    VDP_ADDR_S stAddr[VDP_ADDR_BUTT];

    //dcmp
    HI_BOOL bDcmpEn;

    //draw mode
    VDP_DRAW_MODE_E enDrawMode;

    VDP_DATA_WTH      enDataWidth          ;

} VDP_DRV_ADDR_INFO_S;

typedef struct tagVDP_DRV_CROP_INFO_S
{
    VDP_RECT_S         stSrcRect   ;
    VDP_RECT_S         stCropRect  ;//Crop Out
    VDP_VID_IFMT_E     enInFmt     ;
    VDP_DATA_RMODE_E   enReadMode  ;
    VDP_DISP_MODE_E    enDispMode  ;
    VDP_DRAW_MODE_E    enDrawMode  ;

    VDP_DRAW_MODE_E    enDrawPixelMode;
    VDP_ADDR_S         stAddr[VDP_ADDR_BUTT] ;

} VDP_DRV_CROP_INFO_S;

typedef struct tagVDP_DISPLAY_INFO_S
{
    HI_BOOL bInterlace;
    VDP_DISP_MODE_E        enDispMode;
    VDP_RECT_S             stFmtResolution;
} VDP_DISPLAY_INFO_S;

typedef struct tagXDP_DRV_ZME_OFFSET_S
{
    HI_S32 s32ZmeOffsetVL;
    HI_S32 s32ZmeOffsetVC;
    HI_S32 s32ZmeOffsetVLBtm;
    HI_S32 s32ZmeOffsetVCBtm;

} XDP_DRV_ZME_OFFSET_S;

typedef struct tagVDP_DRV_ZME_INFO_S
{
    VDP_RECT_S  stZme1OutRect;
    VDP_RECT_S  stZme2InRect;
    VDP_RECT_S  stInRect  ;
    VDP_RECT_S  stOutRect ;
    VDP_VID_IFMT_E enInFmt;

    VDP_DATA_WTH        enDataWith ;
    VDP_DATA_RMODE_E    enReadMode ;
    VDP_DISP_MODE_E     enDispMode ;
    VDP_DRAW_MODE_E     enDrawMode ;
    VDP_DRAW_MODE_E     enDrawPixelMode;
    VDP_ZME_MODE_E      enHzmeMode;
    HI_BOOL  bHzmeEn;

    HI_BOOL  bzme1En;
    HI_BOOL  bzme2En;

    HI_U32 u32HorRation;
    HI_U32 u32VerRation;

    VDP_DISPLAY_INFO_S      stVdpDispInfo;

    XDP_DRV_ZME_OFFSET_S stXdpDrvZmeOffset[XDP_THE_NUM_ZME_BUTT];

    //VDP_VID_CVFIR_VCOEF_S pstCvfirVCoef;

} VDP_DRV_ZME_INFO_S;

#if 0
typedef struct tagXDP_RELEASE_FRAME_NODE_S
{
    HI_U32                 u32NodeAddr[XDP_MAX_CFG_FRM_NUM];
    HI_U32                 u32NodeNumber;
}XDP_RELEASE_FRAME_NODE_S;
#endif


typedef struct tagVDP_DRV_ZME_CBB_INFO_S
{
    HI_BOOL bZME1;
    HI_BOOL bZME2;
    VDP_RECT_S stZme1OutRect;
    VDP_RECT_S stZme2InRect;
    VDP_RECT_S stInRect         ;
    VDP_RECT_S stOutRect        ;
    VDP_VID_IFMT_E enInFmt      ;

    HI_U32 u32hlmid_en     ;
    HI_U32 u32hchmid_en    ;
    HI_U32 u32hlmfir_en    ;
    HI_U32 u32hchfir_en    ;

    HI_U32 u32vlmid_en     ;
    HI_U32 u32vchmid_en    ;
    HI_U32 u32vlmfir_en    ;
    HI_U32 u32vchfir_en    ;
    HI_S32 v_loffset       ;
    HI_S32 v_coffset       ;
    HI_S32 vtp_offset      ;
    HI_S32 vbtm_offset     ;

} VDP_DRV_ZME_CBB_INFO_S;

typedef enum
{
    VDP_V0_ZME_TYP = 0,
    VDP_V0_ZME_TYP1 ,
    VDP_V0_ZME_RAND ,
    VDP_V0_ZME_CFG ,
    VDP_V0_ZME_BUTT
} VDP_DRV_ZME_CBB_MODE_E;

typedef enum
{
    VDP_CYCBUF_DTV_MODE_NORM ,
    VDP_CYCBUF_DTV_MODE_QUICK,
    VDP_CYCBUF_DTV_MODE_PAUSE,

    VDP_CYCBUF_DTV_MODE_BUTT
} VDP_CYCBUF_DTV_MODE_E;

typedef enum
{
    VDP_CYCBUF_RESET_MODE_PAUSE,
    VDP_CYCBUF_RESET_MODE_BLACK,

    VDP_CYCBUF_RESET_MODE_BUTT
} VDP_CYCBUF_RESET_MODE_E;


typedef enum
{
    VDP_CYCBUF_FRM_CHG_MODE_MANUAL,
    VDP_CYCBUF_FRM_CHG_MODE_AUTO  ,

    VDP_CYCBUF_FRM_CHG_MODE_BUTT
} VDP_CYCBUF_FRM_CHG_MODE_E;


typedef struct
{
    // top ctrl
    HI_BOOL                   bBindEn         ;
    HI_BOOL                   bSuccEn         ;
    HI_BOOL                   bMmuBypass      ;
    // cycbuf ctrl
    VDP_CYCBUF_DTV_MODE_E     enDtvMode       ;
    HI_BOOL                   bResetEn        ;
    VDP_CYCBUF_RESET_MODE_E   enResetMode     ;
    HI_BOOL                   bMuteClrEn      ;
    HI_U8                     u8CfgMask       ;
    HI_U16                    u16BurstNumHigh ;
    HI_U16                    u16BurstNumLow  ;
    // reserved
    VDP_CYCBUF_FRM_CHG_MODE_E enFrmChgMode    ; // 98mv300 only use manual mode
    HI_BOOL                   bCfgReady       ; // only use in frame_change mode

} VDP_CYCBUF_CTRL_CFG_S;


typedef enum
{
    VDP_CYCBUF_LAYER_V0,
    VDP_CYCBUF_LAYER_V1,
    VDP_CYCBUF_LAYER_GFX,

    VDP_CYCBUF_LAYER_BUTT
} VDP_CYCBUF_LAYER_E;

HI_VOID VDP_DRV_Set_SysEslSmmu(HI_VOID);

#ifndef __DISP_PLATFORM_BOOT__

HI_U32 VDP_GetTotalPlayCnts(HI_VOID);
HI_U32 VDP_GetUnloadPlayCnts(HI_VOID);
HI_U32 VDP_GetQueueNodeCnts(HI_VOID);
HI_U32 VDP_GetDeQueueCnts(HI_VOID);

HI_S32 XDP_DRV_GetVidCscInfo(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstInfoIn);

//layer
HI_S32 VDP_DRV_SetVid0Layer(XDP_LAYER_VID_INFO_S *pstLayerInfoIn);
HI_S32 VDP_DRV_SetVid1Layer(XDP_LAYER_VID_INFO_S *pstLayerInfoIn);

HI_VOID XDP_DRV_SetVid0SoftAlgCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, HI_U32 u32FrmCnt, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0IpCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S  *pstVpssIpChnCfg, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0MarkTABIpCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S  *pstVpssIpChnCfg, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);

HI_VOID XDP_DRV_SetVid0OnlineMaskCfg(XDP_LAYER_VID_INFO_S *pstInfoIn);
HI_VOID XDP_DRV_SetVid0OfflineMaskCfg(XDP_LAYER_VID_INFO_S *pstInfoIn);
HI_VOID XDP_DRV_SetVid0IpMaskCfg(XDP_LAYER_VID_INFO_S *pstInfoIn);

//ip
HI_VOID XDP_DRV_SetVid0CtrlCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0FdrCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0Vc1Cfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_GetVpssIpPolicy(XDP_LAYER_VID_INFO_S *pstInfoIn, HI_U32 u32FrmCnt, XDP_VPSSIP_POLICY_S *pstVpssIpPolicy);
HI_VOID XDP_DRV_GetVpssIpBufSize(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy,
                                          XDP_VPSSIP_CHN_CFG_S *pstVpssIpChnCfg,
                                          HI_U32 *pu32TotalBufSize,
                                          HI_U32 *pu32OtherBufSize);
HI_VOID XDP_DRV_SetDeiChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetSnrChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetTnrChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetRgmeChnCfg(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy,XDP_VPSSIP_CHN_CFG_S *pstVpssIpChnCfg,XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVpssOutChnCfg(XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVfFdrCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_VPSSIP_POLICY_S* pstVpssIpPolicy, XDP_VPSSIP_CHN_CFG_S* pstVpssIpChnCfg, XDP_CFG_MODE_S* pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVpssIpCtrlCfg(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0HZmeCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0ZmeCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0AccCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0CscCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0AcmCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0CropCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0LboxCfg(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID VDP_DRV_SetWbcDhdLayer(XDP_LAYER_VID_INFO_S *pstInfoIn, XDP_CFG_MODE_S *pstCfgMode, HI_U32 u32NodeInfo);
HI_VOID XDP_DRV_SetVid0OfflineChnDisable(HI_VOID);

VDP_VID_DATA_FMT_E XDP_DATA_FMT_ADPTER(VDP_VID_IFMT_E enFmt);
VDP_VID_DATA_TYPE_E XDP_DATA_TYPE_ADPTER(VDP_VID_IFMT_E enFmt);
HW_DYNAMIC_FrameInfor_S *XDP_DRV_GetVid0SoftAlgCfg(HI_VOID);

#endif
#endif
