/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name       : drv_hifb_osr.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                     Author                Modification
2018/01/01               sdk                   Created file
*************************************************************************************************/
#ifndef __DRV_HIFB_OSR_H__
#define __DRV_HIFB_OSR_H__

/*********************************add include here***********************************************/
#include "hi_type.h"
#include <linux/fb.h>
#include "drv_hifb_common.h"
#include "drv_hifb_scrolltext.h"
#include "drv_hifb_config.h"
#include "drv_hifb_blit.h"
#include "drv_hifb_proc.h"
#include "drv_hifb_adp.h"
/************************************************************************************************/


/************************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition *************************************************/
#define HIFB_DEFLICKER_LEVEL_MAX           5
#define HIFB_MAX_LAYER_NUM                 HIFB_LAYER_ID_BUTT
#define HIFB_MAX_PIXFMT_NUM                28
#define FBIOGET_FSCREENINFO_HIFB           0x4693
#define HIFB_REFRESH_MODE_WITH_PANDISPLAY  HIFB_LAYER_BUF_STANDARD
#define CONFIG_HIFB_STEREO_WAITE_TIME     ((2000 * HZ) / 1000)

/*************************** Structure Definition ***********************************************/

typedef enum
{
    HIFB_ANTIFLICKER_NONE,    /* no antiflicker.If scan mode is progressive, hifb will set antiflicker mode to none */
    HIFB_ANTIFLICKER_TDE,     /* tde antiflicker mode, it's effect for 1buf or 2buf only */
    HIFB_ANTIFLICKER_VO,      /* vo antiflicker mode, need hardware supprot */
    HIFB_ANTIFLICKER_BUTT
}HIFB_LAYER_ANTIFLICKER_MODE_E;

typedef enum
{
    HIFB_LAYER_TYPE_HD,
    HIFB_LAYER_TYPE_SD,
    HIFB_LAYER_TYPE_AD,
    HIFB_LAYER_TYPE_CURSOR,
    HIFB_LAYER_TYPE_BUTT,
}HIFB_LAYER_TYPE_E;

typedef struct
{
    HI_BOOL  bBlitBlock;                       /** 是否阻塞                                      **/
    HI_U32   BlockTime;                        /** 阻塞时间                                      **/
    HI_U32   StartTimeMs;
    HI_U32   RefreshFrame;                     /** 保存调用刷新的次数，帧率会根据这个来计算      **/
    HI_U32   FlipFps;                          /** 显示帧率                                      **/
    HI_U32   DrawFps;                          /** 调用刷新的绘制帧率                            **/
    HI_U32   PreRefreshTimeMs;                 /** 上一次进入刷新接口的时间                      **/
    HI_U32   RunRefreshTimeMs;                 /** 刷新函数执行的时间                            **/
    HI_U32   TwiceRefreshTimeMs;               /** 上一次进入刷新接口和当前进入刷新接口的时间差  **/
    HI_U32   PreTimeMs;                        /** 上一次进入VO中断的时间                        **/
    HI_U32   MaxTimeMs;                        /** 上一次进入VO中断和当前进入VO中断的时间差      **/
    HI_U32   RunMaxTimeMs;                     /** VO中断函数执行的最长时间                      **/
    HI_ULONG RepeatFrameCnt;                   /** 重复帧次数                                    **/
    HI_ULONG VoSoftCallBackCnt;                /** VO中断函数执行的次数                          **/
    HI_ULONG ARDataDecompressErrCnt;           /** 解压错误次数                                  **/
    HI_ULONG GBDataDecompressErrCnt;           /** 解压错误次数                                  **/
    HI_ULONG ExpectIntLineNumsForVoCallBack;   /** 90%期望上报的行数                             **/
    HI_ULONG ExpectIntLineNumsForEndCallBack;  /** FrameEnde期望上报的行数                       **/
    HI_ULONG ActualIntLineNumsForVoCallBack;   /** 90%实际上报的行数                             **/
    HI_ULONG HardIntCntForVoCallBack;          /** 90%中断函数硬件的中断个数                     **/
}HIFB_FRAME_INFO_S;

typedef struct
{
    HI_U32 u32StereoMemStart;
    HI_U32 u32StereoMemLen;
}HIFB_3DMEM_INFO_S;

typedef struct
{
    HI_BOOL                BegFreeStereoMem;
    HI_BOOL                BegUpStereoInfo;
    HI_BOOL                IsStereo;
    HI_S32                 s32StereoDepth;
    HI_U32                 u32rightEyeAddr;
    HI_U32                 u32DisplayAddr[CONFIG_HIFB_LAYER_BUFFER_MAX_NUM];
    spinlock_t             StereoLock;
    wait_queue_head_t      WaiteFinishUpStereoInfoMutex;
    wait_queue_head_t      WaiteFinishFreeStereoMemMutex;
    HIFB_STEREO_MODE_E     StereoMode;
    HIFB_RECT              st3DUpdateRect;
    HIFB_SURFACE_S         st3DSurface;
    HIFB_3DMEM_INFO_S      st3DMemInfo;
}HIFB_3D_PAR_S;

typedef struct
{
    HIFB_RECT       stCmpRect;
    HIFB_RECT       stUpdateRect;
    HI_U32          u32DisplayAddr[CONFIG_HIFB_LAYER_BUFFER_MAX_NUM];
    HIFB_SURFACE_S  stCanvasSur;
    HIFB_BUFFER_S   stUserBuffer;
}HIFB_DISP_INFO_S;

typedef struct
{
    HI_BOOL   bModifying;
    HI_U32    u32ParamModifyMask;
    HI_BOOL   bNeedFlip;
    HI_BOOL   bFliped;
    HI_U32    u32IndexForInt;
    HI_U32    u32BufNum;
    HI_U32    StereoBufNum;
    HI_U32    PreRefreshAddr;    /**上次送显的地址，用来判断是否有送重复帧的情况**/
    HI_U32    CurScreenAddr;
    HI_U32    LastScreenAddr;
    HI_S32    s32RefreshHandle;
}HIFB_RTIME_INFO_S;

typedef struct
{
    HI_BOOL            bShow;               /* show status */
    HI_U32             DisplayWidth;        /* width  of layer's display buffer*/
    HI_U32             DisplayHeight;       /* height of layer's display buffer*/
    HI_U32             DisplayStride;
    HIFB_COLOR_FMT_E   enColFmt;            /* color format */
    HIFB_LAYER_BUF_E   enBufMode;           /* refresh mode*/
    HIFB_POINT_S       stPos;               /* beginning position of layer*/
    HIFB_ALPHA_S       stAlpha;             /* alpha attribution */
    HIFB_COLORKEYEX_S  stCkey;              /* colorkey attribution */
}HIFB_EXTEND_INFO_S;

typedef struct
{
    HI_U32             u32LayerID;       /* layer id */
    atomic_t           ref_count;        /* framebuffer reference count */
    spinlock_t         lock;             /* using in 2buf refresh */
    HI_BOOL            bPreMul;
    HI_BOOL            bNeedAntiflicker;
    HI_U32             u32HDflevel;      /* horizontal deflicker level */
    HI_U32             u32VDflevel;      /* vertical deflicker level */
    HI_UCHAR           ucHDfcoef[HIFB_DEFLICKER_LEVEL_MAX - 1];  /* horizontal deflicker coefficients */
    HI_UCHAR           ucVDfcoef[HIFB_DEFLICKER_LEVEL_MAX - 1];  /* vertical deflicker coefficients */
    HIFB_LAYER_ANTIFLICKER_LEVEL_E  enAntiflickerLevel;          /* antiflicker level */
    HIFB_LAYER_ANTIFLICKER_MODE_E   enAntiflickerMode;           /* antiflicker mode */
}HIFB_BASE_INFO_S;

typedef struct
{
    HI_BOOL bStartRelease;
    HI_U32  u32PhyBuf;
    HI_U32  u32SmemStartPhy;
    HI_CHAR *pVirBuf;
    struct work_struct  bDisBufWork;
}HIFB_DISP_TMPBUF_S;

typedef struct
{
    HI_BOOL  bFrameBufferRegister;
    HI_BOOL  bPanFlag;
    HI_BOOL  bVblank;
    HI_BOOL  hifb_sync;
    HI_BOOL  bDeCompress;
    HI_BOOL  bProcDiscardFrame;
    HI_BOOL  bDiscardFrame;
#ifdef CONFIG_HIFB_LOGO_SUPPORT
    HI_BOOL  FinishHdLogoWork;
    HI_BOOL  FinishSdLogoWork;
#endif
    HI_BOOL  bEndFenceRefresh;
    HI_U8    FenceRefreshCount;
    HI_U32   DiscardFrameTimes;
    HI_U32   u32SmemStartPhy;
    HIFB_BASE_INFO_S stBaseInfo;
    HIFB_EXTEND_INFO_S stExtendInfo;

    HIFB_3D_PAR_S st3DInfo;
    HIFB_DISP_INFO_S stDispInfo;

    HIFB_RTIME_INFO_S stRunInfo;
    HIFB_FRAME_INFO_S stFrameInfo;
#ifdef CONFIG_GFX_PROC_SUPPORT
    DRV_HIFB_PROC_S stProcInfo;
#endif
    HIFB_DISP_TMPBUF_S stDispTmpBuf;

#ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
    HIFB_ADP_LOWPOWER_INFO_S stLowPowerInfo;
#endif

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    struct workqueue_struct *pFenceRefreshWorkqueue;
    wait_queue_head_t  WaiteEndFenceRefresh;
#endif
}HIFB_PAR_S;

typedef struct
{
    struct fb_info *pstInfo;
    HI_U32 u32LayerSize;
}HIFB_LAYER_S;

typedef struct
{
    struct fb_bitfield stRed;     /* bitfield in fb mem if true color, */
    struct fb_bitfield stGreen;   /* else only length is significant */
    struct fb_bitfield stBlue;
    struct fb_bitfield stTransp;  /* transparency    */
}HIFB_ARGB_BITINFO_S;

#ifdef CONFIG_COMPAT
struct fb_fix_compat_screeninfo
{
    HI_CHAR id[16];
    HI_U32 smem_start;
    HI_U32 smem_len;
    HI_U32 type;
    HI_U32 type_aux;
    HI_U32 visual;
    HI_U16 xpanstep;
    HI_U16 ypanstep;
    HI_U16 ywrapstep;
    HI_U32 line_length;
    HI_U32 mmio_start;
    HI_U32 mmio_len;
    HI_U32 accel;
    HI_U16 capabilities;
    HI_U16 reserved[2];
};
#endif

/********************** Global Variable declaration *********************************************/

extern HIFB_DRV_OPS_S    g_stDrvAdpCallBackFunction;
extern HIFB_DRV_TDEOPS_S g_stGfx2dCallBackFunction;
extern HIFB_LAYER_S s_stLayer[HIFB_MAX_LAYER_NUM];

extern HIFB_ARGB_BITINFO_S s_stArgbBitField[HIFB_MAX_PIXFMT_NUM];

#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
extern HIFB_SCROLLTEXT_INFO_S s_stTextLayer[HIFB_LAYER_ID_BUTT];
#endif

/******************************* API declaration ************************************************/
HI_U32  DRV_HIFB_GetPixDepth          (HI_U32 BitsPerPixel);
HI_VOID DRV_HIFB_WaitVBlank           (HIFB_LAYER_ID_E enLayerId);
HI_S32  DRV_HIFB_UpStereoData         (HIFB_LAYER_ID_E enLayerId, HIFB_BUFFER_S *pstSrcBuffer, HIFB_BLIT_OPT_S *pstBlitOpt);
HI_S32  DRV_HIFB_BlitFinishCallBack   (HI_VOID *pParaml, HI_VOID *pParamr);
HI_VOID DRV_HIFB_SetDecmpLayerInfo    (HI_U32 LayerId);
HI_VOID DRV_HIFB_Lock                 (spinlock_t *pLock, HI_ULONG *pLockParFlag);
HI_VOID DRV_HIFB_UnLock               (spinlock_t *pLock, HI_ULONG *pLockParFlag);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
