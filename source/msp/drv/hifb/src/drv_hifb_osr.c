/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name       : drv_hifb_osr.c
Version         : Initial Draft
Author          :
Created         : 2018/08/01
Description     :
Function List   :


History         :
Date                    Author                Modification
2018/08/01               sdk                  Created file
*************************************************************************************************/


/*********************************add include here***********************************************/
#include <linux/ctype.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/delay.h>
#include <linux/file.h>
#include <linux/slab.h>
#include <linux/mm.h>

#include <linux/fb.h>
#include <asm/uaccess.h>

#include <asm/types.h>
#include <asm/stat.h>
#include <asm/fcntl.h>

#include <linux/interrupt.h>
#include "hi_module.h"
#include "hi_drv_module.h"
#include "hi_drv_proc.h"
#include "drv_pdm_ext.h"

#include "hifb.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_mem.h"

#ifdef CONFIG_HIFB_LOGO_SUPPORT
#include "drv_hifb_logo.h"
#endif
#ifdef CONFIG_HIFB_FENCE_SUPPORT
#include "drv_hifb_fence.h"
#endif
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
#include "drv_hifb_scrolltext.h"
#endif

#include "drv_hifb_ext.h"
#include "drv_hifb_config.h"
#include "drv_hifb_debug.h"

/***************************** Macro Definition *************************************************/
#define HIFB_MAX_WIDTH(u32LayerId)        gs_pstCapacity[u32LayerId].u32MaxWidth
#define HIFB_MAX_HEIGHT(u32LayerId)       gs_pstCapacity[u32LayerId].u32MaxHeight
#define HIFB_MAX_STRIDE(u32LayerId)       gs_pstCapacity[u32LayerId].u32MaxStride
#define HIFB_MAX_SIZE(u32LayerId)         gs_pstCapacity[u32LayerId].u32MaxSize
#define HIFB_MIN_WIDTH(u32LayerId)        gs_pstCapacity[u32LayerId].u32MinWidth
#define HIFB_MIN_HEIGHT(u32LayerId)       gs_pstCapacity[u32LayerId].u32MinHeight
#define HIFB_MIN_STRIDE(u32LayerId)       gs_pstCapacity[u32LayerId].u32MinStride
#define HIFB_MIN_SIZE(u32LayerId)         gs_pstCapacity[u32LayerId].u32MinSize

#define IS_STEREO_SBS(pstPar)             ((HIFB_STEREO_SIDEBYSIDE_HALF == pstPar->st3DInfo.StereoMode))
#define IS_STEREO_TAB(pstPar)             ((HIFB_STEREO_TOPANDBOTTOM    == pstPar->st3DInfo.StereoMode))
#define IS_STEREO_FPK(pstPar)             ((HIFB_STEREO_FRMPACKING      == pstPar->st3DInfo.StereoMode))

#define IS_2BUF_MODE(pstPar)              (((HIFB_LAYER_BUF_DOUBLE == pstPar->stExtendInfo.enBufMode) || (HIFB_LAYER_BUF_DOUBLE_IMMEDIATE == pstPar->stExtendInfo.enBufMode) || (HIFB_LAYER_BUF_FENCE == pstPar->stExtendInfo.enBufMode)))
#define IS_1BUF_MODE(pstPar)              ((HIFB_LAYER_BUF_ONE     == pstPar->stExtendInfo.enBufMode))


#define DRV_HIFB_IOCTLCMD_NUM_MAX            151
#define DRV_HIFB_IOCTLFUNC_ITEM_NUM_MAX      51

#define DRV_HIFB_CHECK_IOCTL_CMD(CmdNum)\
    if ((CmdNum < 1) || (CmdNum > DRV_HIFB_IOCTLCMD_NUM_MAX))\
    {\
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, CmdNum);\
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, DRV_HIFB_IOCTLCMD_NUM_MAX);\
        return HI_FAILURE;\
    }\

#define DRV_HIFB_CHECK_IOCTL_NUM(CmdFunc)\
        if ((CmdFunc < 1) || (CmdFunc > DRV_HIFB_IOCTLFUNC_ITEM_NUM_MAX))\
        {\
            HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, CmdFunc);\
            HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, DRV_HIFB_IOCTLFUNC_ITEM_NUM_MAX);\
            return HI_FAILURE;\
        }\

typedef HI_S32(*DRV_HIFB_IoctlFunc)(struct fb_info *info, HI_ULONG arg);

#define DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp)\
        if ((NULL == info) || (NULL == argp)) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, info); HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, argp); return HI_FAILURE; }\
        pstPar = (HIFB_PAR_S *)info->par;\
        if (NULL == pstPar) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, pstPar); return HI_FAILURE; }

#define DRV_HIFB_DEFINE_PAR_FROM_INFO(info, ret)\
        if (NULL == info) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, info); return ret; }\
        pstPar = (HIFB_PAR_S *)info->par;\
        if (NULL == pstPar) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, pstPar); return ret; }

#define DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_VALUE(LayerID)\
        if (LayerID >= HIFB_LAYER_ID_BUTT) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerID); return HI_FAILURE; }\
        info = s_stLayer[LayerID].pstInfo;\
        if (NULL == info) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, info); return HI_FAILURE; }\
        pstPar = (HIFB_PAR_S *)info->par;\
        if (NULL == pstPar) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, pstPar); return HI_FAILURE; }

#define DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_NOVALUE(LayerID)\
        if (LayerID >= HIFB_LAYER_ID_BUTT) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerID); return; }\
        info = s_stLayer[LayerID].pstInfo;\
        if (NULL == info) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, info); return; }\
        pstPar = (HIFB_PAR_S *)info->par;\
        if (NULL == pstPar) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, pstPar); return; }

#define DRV_HIFB_DEFINE_INFO_FROM_LAYER(LayerID)\
        if (LayerID >= HIFB_LAYER_ID_BUTT) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerID); return HI_FAILURE; }\
        info = s_stLayer[LayerID].pstInfo;\
        if (NULL == info) { HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, info); return HI_FAILURE; }

//#define  CONFIG_HIFB_REALLOC_MEM /** 支持重新分配大的内存,暂不支持 **/

/*************************** Structure Definition ***********************************************/
static char* video = NULL;
module_param(video, charp, S_IRUGO);

static char* tc_wbc = "off";
module_param(tc_wbc, charp, S_IRUGO);


HIFB_DRV_OPS_S    g_stDrvAdpCallBackFunction;
HIFB_DRV_TDEOPS_S g_stGfx2dCallBackFunction;

/* to save layer id and layer size */
HIFB_LAYER_S s_stLayer[HIFB_MAX_LAYER_NUM];

const static HIFB_CAPABILITY_S *gs_pstCapacity = NULL;

#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
HIFB_SCROLLTEXT_INFO_S s_stTextLayer[HIFB_LAYER_ID_BUTT];
#endif

typedef struct tagDrvHifbIoctlFunc
{
    HI_U32 Cmd;
    DRV_HIFB_IoctlFunc DrvHifbIoctlFunc;
}DRV_HIFB_IOCTLFUNC_ITEM;

/********************** Global Variable declaration *********************************************/
static HI_U32 gs_u32MenuconfigLayerSize[HIFB_MAX_LAYER_NUM] =
{
    #ifdef CFG_HI_HD0_FB_VRAM_SIZE
        CFG_HI_HD0_FB_VRAM_SIZE,
    #else
        0,
    #endif
    #ifdef CFG_HI_HD1_FB_VRAM_SIZE
        CFG_HI_HD1_FB_VRAM_SIZE,
    #else
        0,
    #endif
    #ifdef CFG_HI_HD2_FB_VRAM_SIZE
        CFG_HI_HD2_FB_VRAM_SIZE,
    #else
        0,
    #endif
    #ifdef CFG_HI_HD3_FB_VRAM_SIZE
        CFG_HI_HD3_FB_VRAM_SIZE,
    #else
        0,
    #endif
        0,
        0,
};

static struct fb_fix_screeninfo gs_stDefFix =
{
    .id          = "hifb",
    .type        = FB_TYPE_PACKED_PIXELS,
    .visual      = FB_VISUAL_TRUECOLOR,
    .xpanstep    = 1,
    .ypanstep    = 1,
    .ywrapstep   = 0,
    .line_length = 7680,
    .accel       = FB_ACCEL_NONE,
    .mmio_len    = 0,
    .mmio_start  = 0,
};

static struct fb_var_screeninfo s_stDefVar[HIFB_LAYER_TYPE_BUTT] =
{
    {
        .xres           = CONFIG_HIFB_LAYER_MAXWIDTH,
        .yres           = CONFIG_HIFB_LAYER_MAXHEIGHT,
        .xres_virtual   = CONFIG_HIFB_LAYER_MAXWIDTH,
        .yres_virtual   = CONFIG_HIFB_LAYER_MAXHEIGHT * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM,
        .xoffset        = 0,
        .yoffset        = 0,
        .bits_per_pixel = 16,
        .red            = {10, 5, 0},
        .green          = { 5, 5, 0},
        .blue           = { 0, 5, 0},
        .transp         = {15, 1, 0},
        .activate       = FB_ACTIVATE_NOW,
        .pixclock       = -1,
        .left_margin    = -1,
        .right_margin   = -1,
        .upper_margin   = -1,
        .lower_margin   = -1,
        .hsync_len      = -1,
        .vsync_len      = -1,
    },
    {
        .xres           = 720,
        .yres           = 576,
        .xres_virtual   = 720,
        .yres_virtual   = 1152,
        .xoffset        = 0,
        .yoffset        = 0,
        .bits_per_pixel = 32,
        .red            = {16, 8, 0},
        .green          = { 8, 8, 0},
        .blue           = { 0, 8, 0},
        .transp         = {24, 8, 0},
        .activate       = FB_ACTIVATE_NOW,
        .pixclock       = -1,
        .left_margin    = -1,
        .right_margin   = -1,
        .upper_margin   = -1,
        .lower_margin   = -1,
        .hsync_len      = -1,
        .vsync_len      = -1,
    },
    {
        .xres           = 128,
        .yres           = 128,
        .xres_virtual   = 128,
        .yres_virtual   = 128 * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM,
        .xoffset        = 0,
        .yoffset        = 0,
        .bits_per_pixel = 32,
        .red            = {16, 8, 0},
        .green          = { 8, 8, 0},
        .blue           = { 0, 8, 0},
        .transp         = {24, 8, 0},
        .activate       = FB_ACTIVATE_NOW,
        .pixclock       = -1,
        .left_margin    = -1,
        .right_margin   = -1,
        .upper_margin   = -1,
        .lower_margin   = -1,
        .hsync_len      = -1,
        .vsync_len      = -1,
    },
    {
        .xres           = 128,
        .yres           = 128,
        .xres_virtual   = 128,
        .yres_virtual   = 256,
        .xoffset        = 0,
        .yoffset        = 0,
        .bits_per_pixel = 32,
        .red            = {16, 8, 0},
        .green          = { 8, 8, 0},
        .blue           = { 0, 8, 0},
        .transp         = {24, 8, 0},
        .activate       = FB_ACTIVATE_NOW,
        .pixclock       = -1,
        .left_margin    = -1,
        .right_margin   = -1,
        .upper_margin   = -1,
        .lower_margin   = -1,
        .hsync_len      = -1,
        .vsync_len      = -1,
    }
};

/** bit filed info of color fmt, the order must be the same as HIFB_COLOR_FMT_E **/
HIFB_ARGB_BITINFO_S s_stArgbBitField[HIFB_MAX_PIXFMT_NUM] =
{   /*RGB565*/
    {
        .stRed    = {11, 5, 0},
        .stGreen  = {5, 6, 0},
        .stBlue   = {0, 5, 0},
        .stTransp = {0, 0, 0},
    },
    /*RGB888*/
    {
        .stRed    = {16, 8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {0, 8, 0},
        .stTransp = {0, 0, 0},
    },
    /*KRGB444*/
    {
        .stRed    = {8, 4, 0},
        .stGreen  = {4, 4, 0},
        .stBlue   = {0, 4, 0},
        .stTransp = {0, 0, 0},
    },
    /*KRGB555*/
    {
        .stRed    = {10, 5, 0},
        .stGreen  = {5, 5, 0},
        .stBlue   = {0, 5, 0},
        .stTransp = {0, 0, 0},
    },
    /*KRGB888*/
    {
        .stRed    = {16,8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {0, 8, 0},
        .stTransp = {0, 0, 0},
    },
    /*ARGB4444*/
    {
        .stRed    = {8, 4, 0},
        .stGreen  = {4, 4, 0},
        .stBlue   = {0, 4, 0},
        .stTransp = {12, 4, 0},
    },
    /*ARGB1555*/
    {
        .stRed    = {10, 5, 0},
        .stGreen  = {5, 5, 0},
        .stBlue   = {0, 5, 0},
        .stTransp = {15, 1, 0},
    },
    /*ARGB8888*/
    {
        .stRed    = {16, 8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {0, 8, 0},
        .stTransp = {24, 8, 0},
    },
    /*ARGB8565*/
    {
        .stRed    = {11, 5, 0},
        .stGreen  = {5, 6, 0},
        .stBlue   = {0, 5, 0},
        .stTransp = {16, 8, 0},
    },
    /*RGBA4444*/
    {
        .stRed    = {12, 4, 0},
        .stGreen  = {8, 4, 0},
        .stBlue   = {4, 4, 0},
        .stTransp = {0, 4, 0},
    },
    /*RGBA5551*/
    {
        .stRed    = {11, 5, 0},
        .stGreen  = {6, 5, 0},
        .stBlue   = {1, 5, 0},
        .stTransp = {0, 1, 0},
    },
    /*RGBA5658*/
    {
        .stRed    = {19, 5, 0},
        .stGreen  = {13, 6, 0},
        .stBlue   = {8, 5, 0},
        .stTransp = {0, 8, 0},
    },
    /*RGBA8888*/
    {
        .stRed    = {24, 8, 0},
        .stGreen  = {16, 8, 0},
        .stBlue   = {8, 8, 0},
        .stTransp = {0, 8, 0},
    },
    /*BGR565*/
    {
        .stRed    = {0, 5, 0},
        .stGreen  = {5, 6, 0},
        .stBlue   = {11, 5, 0},
        .stTransp = {0, 0, 0},
    },
    /*BGR888*/
    {
        .stRed    = {0, 8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {16, 8, 0},
        .stTransp = {0, 0, 0},
    },
    /*ABGR4444*/
    {
        .stRed    = {0, 4, 0},
        .stGreen  = {4, 4, 0},
        .stBlue   = {8, 4, 0},
        .stTransp = {12, 4, 0},
    },
    /*ABGR1555*/
    {
        .stRed    = {0, 5, 0},
        .stGreen  = {5, 5, 0},
        .stBlue   = {10, 5, 0},
        .stTransp = {15, 1, 0},
    },
    /*ABGR8888*/
    {
        .stRed    = {0, 8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {16, 8, 0},
        .stTransp = {24, 8, 0},
    },
    /*ABGR8565*/
    {
        .stRed    = {0, 5, 0},
        .stGreen  = {5, 6, 0},
        .stBlue   = {11, 5, 0},
        .stTransp = {16, 8, 0},
    },
    /*KBGR444 16bpp*/
    {
        .stRed    = {0, 4, 0},
        .stGreen  = {4, 4, 0},
        .stBlue   = {8, 4, 0},
        .stTransp = {0, 0, 0},
    },
    /*KBGR555 16bpp*/
    {
        .stRed    = {0, 5, 0},
        .stGreen  = {5, 5, 0},
        .stBlue   = {10, 5, 0},
        .stTransp = {0, 0, 0},
    },
    /*KBGR888 32bpp*/
    {
        .stRed    = {0, 8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {16, 8, 0},
        .stTransp = {0, 0, 0},
    },

    /*1bpp*/
    {
        .stRed    = {0, 1, 0},
        .stGreen  = {0, 1, 0},
        .stBlue   = {0, 1, 0},
        .stTransp = {0, 0, 0},
    },
    /*2bpp*/
    {
        .stRed    = {0, 2, 0},
        .stGreen  = {0, 2, 0},
        .stBlue   = {0, 2, 0},
        .stTransp = {0, 0, 0},
    },
    /*4bpp*/
    {
        .stRed    = {0, 4, 0},
        .stGreen  = {0, 4, 0},
        .stBlue   = {0, 4, 0},
        .stTransp = {0, 0, 0},
    },
    /*8bpp*/
    {
        .stRed    = {0, 8, 0},
        .stGreen  = {0, 8, 0},
        .stBlue   = {0, 8, 0},
        .stTransp = {0, 0, 0},
    },
    /*ACLUT44*/
    {
        .stRed    = {4, 4, 0},
        .stGreen  = {4, 4, 0},
        .stBlue   = {4, 4, 0},
        .stTransp = {0, 4, 0},
    },
    /*ACLUT88*/
    {
        .stRed    = {8, 8, 0},
        .stGreen  = {8, 8, 0},
        .stBlue   = {8, 8, 0},
        .stTransp = {0, 8, 0},
    }
};

static HI_S32 DRV_HIFB_Open        (struct fb_info *info, HI_S32 user);
static HI_S32 DRV_HIFB_Close       (struct fb_info *info, HI_S32 user);
static HI_S32 DRV_HIFB_CheckVar    (struct fb_var_screeninfo *var, struct fb_info *info);
static HI_S32 DRV_HIFB_SetPar      (struct fb_info *info);
static HI_S32 DRV_HIFB_SetCmap     (struct fb_cmap *cmap, struct fb_info *info);
static HI_S32 DRV_HIFB_SetColorReg (unsigned regno, unsigned red, unsigned green,unsigned blue, unsigned transp, struct fb_info *info);
static HI_S32 DRV_HIFB_Ioctl       (struct fb_info *info, HI_U32 cmd, unsigned long arg);
#ifdef CONFIG_COMPAT
static HI_S32 DRV_HIFB_CompatIoctl (struct fb_info *info, HI_U32 cmd, unsigned long arg);
#endif
#ifdef CFG_HIFB_SUPPORT_CONSOLE
static HI_VOID DRV_HIFB_FillRect   (struct fb_info *p, const struct fb_fillrect *rect);
static HI_VOID DRV_HIFB_CopyArea   (struct fb_info *p, const struct fb_copyarea *area);
static HI_VOID DRV_HIFB_ImageBlit  (struct fb_info *p, const struct fb_image *image);
#endif
#ifdef CONFIG_DMA_SHARED_BUFFER
static struct dma_buf* DRV_HIFB_ExportDmaBuf (struct fb_info *info);
#endif
#ifdef CONFIG_GFX_MMU_SUPPORT
static HI_S32 DRV_HIFB_MapMemKernalToUser    (struct fb_info *info, struct vm_area_struct *vma);
#endif

#ifdef CONFIG_HIFB_FENCE_SUPPORT
extern HI_S32 DRV_HIFB_REFRESH_FenceFlip     (HIFB_PAR_S* pstPar, HI_VOID *pArgs);
#else
extern HI_S32 DRV_HIFB_REFRESH_NoFenceFlip   (HIFB_PAR_S* pstPar, HI_VOID *pArgs);
#endif
extern HI_S32 DRV_HIFB_REFRESH_PanDisplay    (struct fb_var_screeninfo *var, struct fb_info *info);

/********************** Global Variable declaration *********************************************/
static struct fb_ops s_sthifbops =
{
    .owner          = THIS_MODULE,
    .fb_open        = DRV_HIFB_Open,
    .fb_release     = DRV_HIFB_Close,
    .fb_check_var   = DRV_HIFB_CheckVar,
    .fb_set_par     = DRV_HIFB_SetPar,
    .fb_pan_display = DRV_HIFB_REFRESH_PanDisplay,
#ifdef CONFIG_COMPAT
    .fb_compat_ioctl= DRV_HIFB_CompatIoctl,
#endif
    .fb_ioctl       = DRV_HIFB_Ioctl,
    .fb_setcolreg   = DRV_HIFB_SetColorReg,
    .fb_setcmap     = DRV_HIFB_SetCmap,
#ifdef CFG_HIFB_SUPPORT_CONSOLE
    .fb_fillrect    = DRV_HIFB_FillRect,
    .fb_copyarea    = DRV_HIFB_CopyArea,
    .fb_imageblit   = DRV_HIFB_ImageBlit,
#endif
#ifdef CONFIG_DMA_SHARED_BUFFER
    .fb_dmabuf_export = DRV_HIFB_ExportDmaBuf,
#endif
#ifdef CONFIG_GFX_MMU_SUPPORT
    .fb_mmap          = DRV_HIFB_MapMemKernalToUser
#endif
};

static HI_S32 DRV_HIFB_GetColorKey         (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetColorKey         (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetLayerAlpha       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetLayerAlpha       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetScreenOriginPos  (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetScreenOriginPos  (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetDeFlicker        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetDeFlicker        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetVblank           (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ShowLayer           (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetLayerShowState   (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetCapablity        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetDecompress       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetLayerInfo        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetLayerInfo        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetCanvasBuffer     (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_RefreshLayer        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_WaiteRefreshFinish  (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetSteroFraming     (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetSteroFraming     (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetSteroMode        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetSteroMode        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetScreenSize       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetScreenSize       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetCompress         (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetCompress         (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ScrolltextCreate    (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ScrolltextFill      (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ScrolltextPause     (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ScrolltextResume    (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ScrolltextDestory   (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetSteroDepth       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetSteroDepth       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetLayerZorder      (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetLayerZorder      (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_ReleaseLogo         (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_SetCompressionMode  (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetCompressionMode  (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_FenceRefresh        (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetSmemStartPhy     (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_FixScreenInfo       (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_HwcGetLayerInfo     (struct fb_info *info, HI_ULONG arg);
static HI_S32 DRV_HIFB_GetCurDispBuffer    (struct fb_info *info, HI_ULONG arg);

static HI_S32 gs_DrvHifbCtlNum[DRV_HIFB_IOCTLCMD_NUM_MAX] = {
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,/** index = 89  **/
     1,  2,  3,  4,  5,  6,  0,  0,  7,  8, 9,/** index = 100 **/
     11, 12, 13, 15,/** index = 104 **/
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,/** index = 119 **/
     17, 18, 0,  19, 21, 22, 23, 24, 25, 26, /** index = 129 **/
     27, 28, 29, 30, 31, 32, 33, 34, 35, 37, /** index = 139 **/
     38, 39, 40, 41, 43, 44, 45, 47, 48, 49, 50  /** index = 150 **/
   };

static DRV_HIFB_IOCTLFUNC_ITEM gs_DrvHifbCtlFunc[DRV_HIFB_IOCTLFUNC_ITEM_NUM_MAX] = {{0, NULL},
   {FBIOGET_COLORKEY_HIFB,           DRV_HIFB_GetColorKey},            {FBIOPUT_COLORKEY_HIFB,            DRV_HIFB_SetColorKey},
   {FBIOGET_ALPHA_HIFB,              DRV_HIFB_GetLayerAlpha},          {FBIOPUT_ALPHA_HIFB,               DRV_HIFB_SetLayerAlpha},
   {FBIOGET_SCREEN_ORIGIN_HIFB,      DRV_HIFB_GetScreenOriginPos},     {FBIOPUT_SCREEN_ORIGIN_HIFB,       DRV_HIFB_SetScreenOriginPos},
   {FBIOGET_DEFLICKER_HIFB,          DRV_HIFB_GetDeFlicker},           {FBIOPUT_DEFLICKER_HIFB,           DRV_HIFB_SetDeFlicker},
   {FBIOGET_VBLANK_HIFB,             DRV_HIFB_GetVblank},              {0,                                NULL},/** index = 10**/
   {FBIOPUT_SHOW_HIFB,               DRV_HIFB_ShowLayer},              {FBIOGET_SHOW_HIFB,                DRV_HIFB_GetLayerShowState},
   {FBIOGET_CAPABILITY_HIFB,         DRV_HIFB_GetCapablity},           {0,                                NULL},
   {FBIOPUT_DECOMPRESS_HIFB,         DRV_HIFB_SetDecompress},          {0,                                NULL},
   {FBIOPUT_LAYER_INFO,              DRV_HIFB_SetLayerInfo},           {FBIOGET_LAYER_INFO,               DRV_HIFB_GetLayerInfo},
   {FBIOGET_CANVAS_BUFFER,           DRV_HIFB_GetCanvasBuffer},        {0,                                NULL},/** index = 20**/
   {FBIO_REFRESH,                    DRV_HIFB_RefreshLayer},           {FBIO_WAITFOR_FREFRESH_DONE,       DRV_HIFB_WaiteRefreshFinish},
   {FBIOPUT_ENCODER_PICTURE_FRAMING, DRV_HIFB_SetSteroFraming},        {FBIOGET_ENCODER_PICTURE_FRAMING,  DRV_HIFB_GetSteroFraming},
   {FBIOPUT_STEREO_MODE,             DRV_HIFB_SetSteroMode},           {FBIOGET_STEREO_MODE,              DRV_HIFB_GetSteroMode},
   {FBIOPUT_SCREENSIZE,              DRV_HIFB_SetScreenSize},          {FBIOGET_SCREENSIZE,               DRV_HIFB_GetScreenSize},
   {FBIOPUT_COMPRESSION,             DRV_HIFB_SetCompress},            {FBIOGET_COMPRESSION,              DRV_HIFB_GetCompress},/** index = 30**/
   {FBIO_SCROLLTEXT_CREATE,          DRV_HIFB_ScrolltextCreate},       {FBIO_SCROLLTEXT_FILL,             DRV_HIFB_ScrolltextFill},
   {FBIO_SCROLLTEXT_PAUSE,           DRV_HIFB_ScrolltextPause},        {FBIO_SCROLLTEXT_RESUME,           DRV_HIFB_ScrolltextResume},
   {FBIO_SCROLLTEXT_DESTORY,         DRV_HIFB_ScrolltextDestory},      {0,                                NULL},
   {FBIOPUT_STEREO_DEPTH,            DRV_HIFB_SetSteroDepth},          {FBIOGET_STEREO_DEPTH,             DRV_HIFB_GetSteroDepth},
   {FBIOPUT_ZORDER,                  DRV_HIFB_SetLayerZorder},         {FBIOGET_ZORDER,                   DRV_HIFB_GetLayerZorder},/** index = 40**/
   {FBIO_FREE_LOGO,                  DRV_HIFB_ReleaseLogo},            {0,                                NULL},
   {FBIOPUT_COMPRESSIONMODE,         DRV_HIFB_SetCompressionMode},     {FBIOGET_COMPRESSIONMODE,          DRV_HIFB_GetCompressionMode},
   {FBIO_HWC_REFRESH,                DRV_HIFB_FenceRefresh},           {0,                                NULL},
   {FBIOGET_SMEMSTART_PHY,           DRV_HIFB_GetSmemStartPhy},        {FBIO_HWC_GETLAYERINFO,            DRV_HIFB_HwcGetLayerInfo},
   {FBIOGET_FSCREENINFO_HIFB,        DRV_HIFB_FixScreenInfo},          {FBIOGET_CURDISPLAY_PHY,           DRV_HIFB_GetCurDispBuffer}};

/******************************* API declaration ************************************************/
static HI_VOID DRV_HIFB_SelectAntiflickerMode(HIFB_PAR_S *pstPar);

static HI_S32  DRV_HIFB_Flip               (HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf, HIFB_LAYER_BUF_E enBufMode);
static HI_S32  DRV_HIFB_FlipAll            (struct fb_info *info);
static HI_VOID DRV_HIFB_AssignDispBuf      (HI_U32 u32LayerId);
static HI_S32  DRV_HIFB_InitLayerInfo      (HI_U32 u32LayerID);
static HI_S32  DRV_HIFB_GetLayerBufferInfo (HI_U32 u32LayerID);
static HI_VOID DRV_HIFB_SetDisplayBuffer   (HI_U32 u32LayerId);
#ifdef CONFIG_HIFB_STEREO_SUPPORT
static HI_S32 DRV_HIFB_StereoCallBack      (HI_VOID * pParaml,HI_VOID * pParamr);
#endif
#ifdef CONFIG_DMA_SHARED_BUFFER
extern struct dma_buf *DRV_HIFB_DMABUF_MemBlockExport(phys_addr_t base, size_t size, int flags);
#endif
static inline HI_S32   DRV_HIFB_ParseInsmodParameter    (HI_VOID);
static inline HI_ULONG DRV_HIFB_GetVramSize             (HI_CHAR* pstr);
static inline HI_S32   DRV_HIFB_RegisterFrameBuffer     (HI_U32 u32LayerId);
static inline HI_VOID  DRV_HIFB_UnRegisterFrameBuffer   (HI_U32 u32LayerId);
static inline HI_S32   DRV_HIFB_AllocLayerBuffer        (HI_U32 u32LayerId, HI_U32 BufSize);
static inline HI_VOID  DRV_HIFB_FreeLayerBuffer         (HI_U32 u32LayerId);
static inline HI_S32   DRV_HIFB_InitAllocCmapBuffer     (HI_U32 u32LayerId);
static inline HI_VOID  DRV_HIFB_DInitAllocCmapBuffer    (HI_U32 u32LayerId);
static inline HI_BOOL  DRV_HIFB_CheckSmmuSupport        (HI_U32 LayerId);
static inline HI_VOID  DRV_HIFB_PrintVersion            (HI_BOOL bLoad);
static inline HI_S32   DRV_HIFB_RegisterCallBackFunction(HI_U32 u32LayerId);
static inline HI_VOID  DRV_HIFB_ReleaseScrollText       (struct fb_info *info);
#ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
static inline HI_VOID  DRV_HIFB_UpLowPowerInfo          (HI_U32 LayerId);
#endif
static inline HI_VOID  DRV_HIFB_UpdataRefreshInfo       (HI_U32 LayerId);
static inline HI_VOID  DRV_HIFB_UpdataInputDataFmt      (HI_U32 LayerId);
static inline HI_VOID  DRV_HIFB_UpdataInputDataStride   (HI_U32 LayerId);
static inline HI_VOID  DRV_HIFB_UpdataInputDataDDR      (HI_U32 LayerId);
static inline HI_VOID  DRV_HIFB_SwitchDispBuffer        (HI_U32 LayerId);
static inline HI_VOID  DRV_HIFB_SetDispInfo             (HI_U32 LayerId);

static inline HI_S32   DRV_HIFB_CheckWhetherResolutionSupport   (HI_U32 LayerId, HI_U32 Width, HI_U32 Height);
static inline HI_S32   DRV_HIFB_CheckWhetherLayerSizeSupport    (struct fb_info *info, HIFB_LAYER_INFO_S *pstLayerInfo);
static inline HI_VOID  DRV_HIFB_CheckWhetherDispSizeChange      (struct fb_info *info, HIFB_LAYER_INFO_S *pstLayerInfo);
static inline HI_S32   DRV_HIFB_CheckWhetherMemSizeEnough       (struct fb_info *info, HIFB_LAYER_INFO_S *pstLayerInfo);
static inline HI_S32   DRV_HIFB_CheckWhetherLayerPosSupport     (HIFB_LAYER_INFO_S *pstLayerInfo);

#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
static inline HI_S32 DRV_HIFB_SCROLLTEXT_Enable(HI_BOOL bEnable, HI_ULONG arg);
#endif

/******************************* API realization ************************************************/
/***************************************************************************************
* func        : HIFB_GetFmtByArgb
* description : CNcomment: 从argb中判断像素格式 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HIFB_COLOR_FMT_E HIFB_GetFmtByArgb(struct fb_bitfield *red,struct fb_bitfield *green,struct fb_bitfield *blue,struct fb_bitfield *transp,HI_U32 u32ColorDepth)
{
    HI_U32 i = 0;
    HI_U32 u32Bpp = 0;

    if ((NULL == red) || (NULL == green) || (NULL == blue) || (NULL == transp))
    {
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, red);
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, green);
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, blue);
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, transp);
        return HIFB_FMT_BUTT;
    }

    for (i = 0; i < HI_GFX_ARRAY_SIZE(s_stArgbBitField); i++)
    {
        if (   (DRV_HIFB_MEM_BitFieldCmp(*red,    s_stArgbBitField[i].stRed)    == 0)
            && (DRV_HIFB_MEM_BitFieldCmp(*green,  s_stArgbBitField[i].stGreen)  == 0)
            && (DRV_HIFB_MEM_BitFieldCmp(*blue,   s_stArgbBitField[i].stBlue)   == 0)
            && (DRV_HIFB_MEM_BitFieldCmp(*transp, s_stArgbBitField[i].stTransp) == 0))
        {
            u32Bpp = DRV_HIFB_MEM_GetBppByFmt(i);
            if (u32Bpp == u32ColorDepth)
            {
                return i;
            }
        }
    }

    switch(u32ColorDepth)
    {
        case 1:
            i = HIFB_FMT_1BPP;
            break;
        case 2:
            i = HIFB_FMT_2BPP;
            break;
        case 4:
            i = HIFB_FMT_4BPP;
            break;
        case 8:
            i = HIFB_FMT_8BPP;
            break;
        case 16:
            i = HIFB_FMT_RGB565;
            break;
        case 24:
            i = HIFB_FMT_RGB888;
            break;
        case 32:
            i = HIFB_FMT_ARGB8888;
            break;
        default:
            i = HIFB_FMT_BUTT;
            break;
    }

    if (HIFB_FMT_BUTT != i)
    {
        *red    = s_stArgbBitField[i].stRed;
        *green  = s_stArgbBitField[i].stGreen;
        *blue   = s_stArgbBitField[i].stBlue;
        *transp = s_stArgbBitField[i].stTransp;
    }

    return i;
}

#ifdef CONFIG_HIFB_REALLOC_MEM
/***************************************************************************************
* func          : HIFB_ReAllocWork
* description   : CNcomment: 重新分配内存，旧内存释放处理,放这里的原因是为了
                             保证这快内存不再被逻辑使用的时候才释放，这样就不会发生访问页表错误
                             CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_VOID HIFB_ReAllocWork(struct work_struct *work)
{
    HIFB_DISP_TMPBUF_S *pstDispTmpBuf = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(work);
    pstDispTmpBuf = (HIFB_DISP_TMPBUF_S *)container_of(work, HIFB_DISP_TMPBUF_S, bDisBufWork);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispTmpBuf);

    if (NULL != pstDispTmpBuf->pVirBuf)
    {
        DRV_HIFB_MEM_UnMap(pstDispTmpBuf->pVirBuf);
    }

    if (0 != pstDispTmpBuf->u32SmemStartPhy)
    {
        DRV_HIFB_MEM_UnMapFromSmmu(pstDispTmpBuf->u32PhyBuf);
        DRV_HIFB_MEM_Free(pstDispTmpBuf->u32SmemStartPhy, HI_FALSE);
    }
    else
    {
        DRV_HIFB_MEM_Free(pstDispTmpBuf->u32PhyBuf, HI_TRUE);
    }

    pstDispTmpBuf->pVirBuf         = NULL;
    pstDispTmpBuf->u32PhyBuf       = 0;
    pstDispTmpBuf->u32SmemStartPhy = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

/***************************************************************************************
* func          : HIFB_CheckMemEnough
* description   : CNcomment: 判断内存是否足够 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 HIFB_CheckMemEnough(struct fb_info *info, HI_U32 u32Stride, HI_U32 u32Height)
{
    HI_U32 u32BufferNum = 0;
    HI_U32 u32BufSize   = 0;
    HIFB_PAR_S *pstPar = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO(info, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_FAILURE);

    switch (pstPar->stExtendInfo.enBufMode)
    {
        case HIFB_LAYER_BUF_DOUBLE:
        case HIFB_LAYER_BUF_DOUBLE_IMMEDIATE:
        case HIFB_LAYER_BUF_FENCE:
            u32BufferNum = 2;
            break;
        case HIFB_LAYER_BUF_ONE:
        case HIFB_REFRESH_MODE_WITH_PANDISPLAY:
            u32BufferNum = 1;
            break;
        default:
            u32BufferNum = 0;
            break;
    }

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32Height, HIFB_MAX_HEIGHT(pstPar->stBaseInfo.u32LayerID) * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(u32Height, HIFB_MIN_HEIGHT(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32Stride, HIFB_MAX_STRIDE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(u32Stride, HIFB_MIN_STRIDE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);

    u32BufSize = HI_HIFB_GetMemSize(u32Stride, u32Height);
    if (0 != u32BufferNum)
    {
       HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(u32BufferNum,u32BufSize,HI_FAILURE);
       u32BufSize = u32BufferNum * u32BufSize;
    }

    if (info->fix.smem_len < u32BufSize)
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, u32BufSize);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->fix.smem_len);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, u32Stride);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, u32Height);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, u32BufferNum);
         HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "the mem size is not enough for this refresh mode");
         return HI_FAILURE;
    }

    u32BufSize = HI_HIFB_GetMemSize(u32Stride, info->var.yres_virtual);
    if (info->fix.smem_len < u32BufSize)
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, u32BufSize);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->fix.smem_len);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, u32Stride);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->var.yres_virtual);
         HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "the mem size is not enough for this refresh mode");
         return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_CheckVar
* description : CNcomment: 判断参数信息是否合法 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_CheckVar(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HIFB_PAR_S *pstPar  = NULL;
    HIFB_COLOR_FMT_E enFmt = HIFB_FMT_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(var,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info,HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar,HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_FAILURE);

    enFmt = HIFB_GetFmtByArgb(&var->red, &var->green, &var->blue, &var->transp, var->bits_per_pixel);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(enFmt, HI_GFX_ARRAY_SIZE(gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bColFmt), HI_FAILURE);

    if (  (!gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bColFmt[enFmt])
        ||(!g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_SupportFmt(enFmt) && pstPar->stExtendInfo.enBufMode != HIFB_REFRESH_MODE_WITH_PANDISPLAY))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enFmt);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bColFmt[enFmt]);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stBaseInfo.u32LayerID);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstPar->stExtendInfo.enBufMode);
        return HI_FAILURE;
    }

    if (var->xres_virtual < HIFB_MIN_WIDTH(pstPar->stBaseInfo.u32LayerID))
    {
        var->xres_virtual = HIFB_MIN_WIDTH(pstPar->stBaseInfo.u32LayerID);
    }
    if (var->yres_virtual < HIFB_MIN_HEIGHT(pstPar->stBaseInfo.u32LayerID))
    {
        var->yres_virtual = HIFB_MIN_HEIGHT(pstPar->stBaseInfo.u32LayerID);
    }

    if (var->xres > var->xres_virtual)
    {
        var->xres = var->xres_virtual;
    }
    else if (var->xres < HIFB_MIN_WIDTH(pstPar->stBaseInfo.u32LayerID))
    {
        var->xres = HIFB_MIN_WIDTH(pstPar->stBaseInfo.u32LayerID);
    }

    if (var->yres > var->yres_virtual)
    {
        var->yres = var->yres_virtual;
    }
    else if (var->yres < HIFB_MIN_HEIGHT(pstPar->stBaseInfo.u32LayerID))
    {
        var->yres = HIFB_MIN_HEIGHT(pstPar->stBaseInfo.u32LayerID);
    }

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(var->xres, HIFB_MAX_WIDTH(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(var->yres, HIFB_MAX_HEIGHT(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(var->xres_virtual, HIFB_MAX_WIDTH(pstPar->stBaseInfo.u32LayerID) * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    //HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(var->yres_virtual, HIFB_MAX_HEIGHT(pstPar->stBaseInfo.u32LayerID) * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(var->xoffset, HIFB_MAX_WIDTH(pstPar->stBaseInfo.u32LayerID) * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(var->yoffset, HIFB_MAX_HEIGHT(pstPar->stBaseInfo.u32LayerID) * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(var->xres, var->xoffset, HI_FAILURE);
    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(var->yres, var->yoffset, HI_FAILURE);
    if (   (var->xoffset > var->xres_virtual)
        || (var->yoffset > var->yres_virtual)
        || (var->xoffset + var->xres > var->xres_virtual)
        || (var->yoffset + var->yres > var->yres_virtual))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, var->xoffset);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, var->yoffset);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, var->xres_virtual);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, var->yres_virtual);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_AssignDispBuf
* description : CNcomment: 分配display buffer CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_VOID DRV_HIFB_AssignDispBuf(HI_U32 u32LayerId)
{
#ifdef CONFIG_HIFB_STEREO_SUPPORT
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 u32BufSize  = 0;
    HI_S32 Ret = HI_SUCCESS;

    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    if (pstPar->st3DInfo.IsStereo)
    {
        HI_U32 CmpStride = 0;
        HI_U32 Stride = 0;
        HI_U32 u32StartAddr = 0;

        Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT | HIFB_PARA_CHECK_BITSPERPIXEL,
                                      info->var.xres, info->var.yres, 0, 0, info->var.bits_per_pixel);
        if (HI_SUCCESS != Ret)
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->var.xres);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->var.yres);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->var.bits_per_pixel);
            return;
        }

        Stride = CONIFG_HIFB_GetMaxStride(info->var.xres,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
        HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(Stride, 0);

        u32BufSize = HI_HIFB_GetMemSize(Stride,info->var.yres);
        HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(u32BufSize, 0);

        if (IS_2BUF_MODE(pstPar) || IS_1BUF_MODE(pstPar))
        {
            u32StartAddr = info->fix.smem_start;
            if (1 == pstPar->stRunInfo.StereoBufNum)
            {
                pstPar->st3DInfo.u32DisplayAddr[0] = u32StartAddr;
                pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr;
            }
            else if (2 == pstPar->stRunInfo.StereoBufNum)
            {
                pstPar->st3DInfo.u32DisplayAddr[0] = u32StartAddr;
                if (u32BufSize > (info->fix.smem_len / 2))
                {
                    pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr;
                }
                else
                {
                    pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr + u32BufSize;
                }
            }
            return;
        }
        else if (  (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart)
                || (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemLen)
                || (0 == pstPar->stRunInfo.StereoBufNum))
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return;
        }
        else
        {/**<-- android used pandisplay refresh **/
            u32StartAddr = pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart;
        }

        if (1 == pstPar->stRunInfo.StereoBufNum)
        {
            pstPar->st3DInfo.u32DisplayAddr[0] = u32StartAddr;
            pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr;
        }
        else if (2 == pstPar->stRunInfo.StereoBufNum)
        {/**<-- generally is two buffer **/
            pstPar->st3DInfo.u32DisplayAddr[0] = u32StartAddr;
            if (HIFB_STEREO_SIDEBYSIDE_HALF == pstPar->st3DInfo.StereoMode)
            {
                pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr + pstPar->st3DInfo.st3DSurface.u32Pitch / 2;
            }
            else if (HIFB_STEREO_TOPANDBOTTOM == pstPar->st3DInfo.StereoMode)
            {
                pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr + pstPar->st3DInfo.st3DSurface.u32Pitch * pstPar->stExtendInfo.DisplayHeight / 2;
            }
            else
            {/**<-- frame packing user display buffer, no user 3d buffer **/
                pstPar->st3DInfo.u32DisplayAddr[1] = u32StartAddr + u32BufSize;
            }
        }
    }
    else
#endif
    {
        DRV_HIFB_SetDisplayBuffer(u32LayerId);
    }

    return;
}

/***************************************************************************************
* func         : HIFB_GetUpdateRect
* description  : CNcomment: 获取图层的更新区域 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_GetUpdateRect(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf, HIFB_RECT *pstUpdateRect)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar;
    struct fb_info *info = NULL;
    TDE2_RECT_S SrcRect = {0}, DstRect = {0}, InSrcRect = {0}, InDstRect = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstUpdateRect, HI_FAILURE);

    SrcRect.u32Width  = pstCanvasBuf->stCanvas.u32Width;
    SrcRect.u32Height = pstCanvasBuf->stCanvas.u32Height;

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  pstPar->stExtendInfo.DisplayWidth, pstPar->stExtendInfo.DisplayHeight, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayHeight);
        return HI_FAILURE;
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  SrcRect.u32Width, SrcRect.u32Height, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, SrcRect.u32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, SrcRect.u32Height);
        return HI_FAILURE;
    }

    if (pstPar->st3DInfo.StereoMode == HIFB_STEREO_SIDEBYSIDE_HALF)
    {
        DstRect.u32Width  = pstPar->stExtendInfo.DisplayWidth >> 1;
        DstRect.u32Height = pstPar->stExtendInfo.DisplayHeight;
    }
    else if (pstPar->st3DInfo.StereoMode == HIFB_STEREO_TOPANDBOTTOM)
    {
        DstRect.u32Width  = pstPar->stExtendInfo.DisplayWidth;
        DstRect.u32Height = pstPar->stExtendInfo.DisplayHeight >> 1;
    }
    else
    {
        DstRect.u32Width  = pstPar->stExtendInfo.DisplayWidth;
        DstRect.u32Height = pstPar->stExtendInfo.DisplayHeight;
    }

    if (SrcRect.u32Width != DstRect.u32Width || SrcRect.u32Height != DstRect.u32Height)
    {
        InSrcRect.s32Xpos   = pstCanvasBuf->UpdateRect.x;
        InSrcRect.s32Ypos   = pstCanvasBuf->UpdateRect.y;
        InSrcRect.u32Width  = pstCanvasBuf->UpdateRect.w;
        InSrcRect.u32Height = pstCanvasBuf->UpdateRect.h;

        g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_CalScaleRect(&SrcRect, &DstRect, &InSrcRect, &InDstRect);

        pstUpdateRect->x = InDstRect.s32Xpos;
        pstUpdateRect->y = InDstRect.s32Ypos;
        pstUpdateRect->w = InDstRect.u32Width;
        pstUpdateRect->h = InDstRect.u32Height;
    }
    else
    {
        HI_GFX_Memcpy(pstUpdateRect, &pstCanvasBuf->UpdateRect, sizeof(HIFB_RECT));
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HIFB_BackUpForeBuf
* description  : CNcomment: 更新前景数据CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_BackUpForeBuf(HI_U32 u32LayerId, HIFB_BUFFER_S *pstBackBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 ForePhyAddr = 0;
    HIFB_PAR_S *pstPar = NULL;
    HIFB_RECT  *pstForeUpdateRect = NULL;
    struct fb_info *info = NULL;
    HIFB_BUFFER_S stForeBuf, stBackBuf;
    HIFB_BLIT_OPT_S stBlitTmp;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstBackBuf, HI_FAILURE);
    HI_GFX_Memcpy(&stBackBuf, pstBackBuf, sizeof(HIFB_BUFFER_S));

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE((1 - pstPar->stRunInfo.u32IndexForInt), CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

    if ((pstPar->st3DInfo.StereoMode != HIFB_STEREO_MONO) && (pstPar->st3DInfo.StereoMode != HIFB_STEREO_BUTT))
    {
        pstForeUpdateRect = &pstPar->st3DInfo.st3DUpdateRect;
        ForePhyAddr = pstPar->st3DInfo.u32DisplayAddr[1 - pstPar->stRunInfo.u32IndexForInt];
    }
    else
    {
        pstForeUpdateRect = &pstPar->stDispInfo.stUpdateRect;
        ForePhyAddr = pstPar->stDispInfo.u32DisplayAddr[1 - pstPar->stRunInfo.u32IndexForInt];
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  stBackBuf.stCanvas.u32Width, stBackBuf.stCanvas.u32Height, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stBackBuf.stCanvas.u32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stBackBuf.stCanvas.u32Height);
        return HI_FAILURE;
    }

    if (pstPar->st3DInfo.StereoMode == HIFB_STEREO_SIDEBYSIDE_HALF)
    {
        stBackBuf.stCanvas.u32Width  = stBackBuf.stCanvas.u32Width >> 1;
    }
    else if (pstPar->st3DInfo.StereoMode == HIFB_STEREO_TOPANDBOTTOM)
    {
        stBackBuf.stCanvas.u32Height = stBackBuf.stCanvas.u32Height >> 1;
    }

    if (0 == pstForeUpdateRect->w)
    {
        pstForeUpdateRect->w = stBackBuf.stCanvas.u32Width;
    }

    if (0 == pstForeUpdateRect->h)
    {
        pstForeUpdateRect->h = stBackBuf.stCanvas.u32Height;
    }

    if (HI_TRUE == DRV_HIFB_MEM_IsConTain(&stBackBuf.UpdateRect, pstForeUpdateRect))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_Memcpy(&stForeBuf, &stBackBuf, sizeof(HIFB_BUFFER_S));
    stForeBuf.stCanvas.u32PhyAddr = ForePhyAddr;

    HI_GFX_Memcpy(&stForeBuf.UpdateRect, pstForeUpdateRect, sizeof(HIFB_RECT));
    HI_GFX_Memcpy(&stBackBuf.UpdateRect, &stForeBuf.UpdateRect , sizeof(HIFB_RECT));

    HI_GFX_Memset(&stBlitTmp, 0x0, sizeof(stBlitTmp));

    stBlitTmp.bBlock = HI_FALSE;
    pstPar->stFrameInfo.bBlitBlock = stBlitTmp.bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(&stForeBuf, &stBackBuf, &stBlitTmp, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


/***************************************************************************************
* func         : HIFB_SetDispSize
* description  : CNcomment: set display size CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_SetDispSize(HI_U32 u32LayerId, HI_U32 u32Width, HI_U32 u32Height)
{
    HI_S32 Ret = HI_SUCCESS;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    if ((pstPar->stExtendInfo.DisplayWidth == u32Width) && (pstPar->stExtendInfo.DisplayHeight == u32Height))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  u32Width, u32Height, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Height);
        return HI_FAILURE;
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_BITSPERPIXEL,0,0,0, 0,info->var.bits_per_pixel);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        return HI_FAILURE;
    }

    u32Stride = CONIFG_HIFB_GetMaxStride(u32Width, info->var.bits_per_pixel, &CmpStride, CONFIG_HIFB_STRIDE_16ALIGN);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(u32Stride, 0, HI_FAILURE);

    if (HI_FAILURE == HIFB_CheckMemEnough(info, u32Stride, u32Height))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Stride);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Height);
        return HI_FAILURE;
    }

    pstPar->stExtendInfo.DisplayWidth  = u32Width;
    pstPar->stExtendInfo.DisplayHeight = u32Height;

    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;

    DRV_HIFB_SelectAntiflickerMode(pstPar);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HIFB_SetCanvasBufInfo
* description : CNcomment: 设置canvas buffer 信息 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_S32 HIFB_SetCanvasBufInfo(struct fb_info *info, HIFB_LAYER_INFO_S *pLayerInfo)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride = 0;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pLayerInfo,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info,HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar,HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID ,HI_FAILURE);

    if (!(pLayerInfo->u32Mask & HIFB_LAYERMASK_CANVASSIZE))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
        return HI_SUCCESS;
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT, pLayerInfo->u32CanvasWidth, pLayerInfo->u32CanvasHeight, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pLayerInfo->u32CanvasWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pLayerInfo->u32CanvasHeight);
        return HI_FAILURE;
    }

    u32Stride = CONIFG_HIFB_GetMaxStride(pLayerInfo->u32CanvasWidth,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32Stride, HIFB_MAX_STRIDE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(u32Stride, HIFB_MIN_STRIDE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);

    pstPar->stDispInfo.stCanvasSur.u32Width  = pLayerInfo->u32CanvasWidth;
    pstPar->stDispInfo.stCanvasSur.u32Height = pLayerInfo->u32CanvasHeight;
    pstPar->stDispInfo.stCanvasSur.enFmt     = HIFB_GetFmtByArgb(&info->var.red, &info->var.green, &info->var.blue, &info->var.transp, info->var.bits_per_pixel);
    pstPar->stDispInfo.stCanvasSur.u32Pitch  = u32Stride;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

#ifdef CONFIG_HIFB_STEREO_SUPPORT
static HI_VOID DRV_HIFB_FreeStereoBuf(HIFB_PAR_S *par)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_ULONG StereoLockFlag = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);
    g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone(HI_TRUE);

    DRV_HIFB_Lock(&par->st3DInfo.StereoLock,&StereoLockFlag);
    par->st3DInfo.IsStereo = HI_FALSE;
    DRV_HIFB_UnLock(&par->st3DInfo.StereoLock,&StereoLockFlag);

    Ret = wait_event_interruptible_timeout(par->st3DInfo.WaiteFinishUpStereoInfoMutex, (HI_FALSE == par->st3DInfo.BegUpStereoInfo), CONFIG_HIFB_STEREO_WAITE_TIME);
    HI_UNUSED(Ret);
    /** delay ensure for gfx finish display **/
    msleep(25 * 4);

    if (0 != par->st3DInfo.st3DMemInfo.u32StereoMemStart)
    {
        DRV_HIFB_MEM_Free(par->st3DInfo.st3DMemInfo.u32StereoMemStart, HI_TRUE);
    }

    DRV_HIFB_Lock(&par->st3DInfo.StereoLock,&StereoLockFlag);
        par->st3DInfo.BegUpStereoInfo = HI_FALSE;
        par->st3DInfo.st3DMemInfo.u32StereoMemStart = 0;
        par->st3DInfo.st3DMemInfo.u32StereoMemLen   = 0;
        par->st3DInfo.st3DSurface.u32PhyAddr        = 0;
    DRV_HIFB_UnLock(&par->st3DInfo.StereoLock,&StereoLockFlag);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_S32 DRV_HIFB_AllocStereoBuf(struct fb_info *info, HI_U32 u32BufSize)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_CHAR name[256] = "\0";
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID ,HI_FAILURE);

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32BufSize, HIFB_MAX_SIZE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(u32BufSize, HIFB_MIN_SIZE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(u32BufSize, pstPar->st3DInfo.st3DMemInfo.u32StereoMemLen, HI_SUCCESS);

    if (pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart)
    {
        DRV_HIFB_FreeStereoBuf(pstPar);
    }

    snprintf(name, sizeof(name), "HIFB_STEREO_BUF_%d", pstPar->stBaseInfo.u32LayerID);
    name[sizeof(name) - 1] = '\0';

    pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart = DRV_HIFB_MEM_Alloc(name, "iommu", u32BufSize);
    if (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32BufSize);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart);
        return HI_FAILURE;
    }

    pstPar->st3DInfo.st3DMemInfo.u32StereoMemLen = u32BufSize;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_VOID DRV_HIFB_ClearStereoBuf(struct fb_info *info)
{
    HIFB_PAR_S *par = NULL;
    HIFB_BLIT_OPT_S stOpt;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    par = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);

    if ((0 == par->st3DInfo.st3DMemInfo.u32StereoMemStart) || (0 == par->st3DInfo.st3DMemInfo.u32StereoMemLen))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_Memset(&stOpt, 0x0, sizeof(stOpt));
    par->st3DInfo.st3DSurface.u32PhyAddr = par->st3DInfo.st3DMemInfo.u32StereoMemStart;

    stOpt.bBlock = HI_TRUE;
    g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_ClearRect(&(par->st3DInfo.st3DSurface), &stOpt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_S32 DRV_HIFB_ClearUnUsedStereoBuf(struct fb_info *info)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride = 0;
    HIFB_PAR_S *par = NULL;
    HIFB_BLIT_OPT_S stOpt;
    HIFB_SURFACE_S Surface;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    par = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);

    if (par->stExtendInfo.enBufMode == HIFB_REFRESH_MODE_WITH_PANDISPLAY || par->stExtendInfo.enBufMode == HIFB_LAYER_BUF_NONE)
    {
        DRV_HIFB_ClearStereoBuf(info);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_Memset(&stOpt, 0x0, sizeof(stOpt));
    HI_GFX_Memset(&Surface, 0x0, sizeof(Surface));

    Surface.enFmt     = par->stExtendInfo.enColFmt;
    Surface.u32Height = par->stExtendInfo.DisplayHeight;
    Surface.u32Width  = par->stExtendInfo.DisplayWidth;

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_BITSPERPIXEL, par->stExtendInfo.DisplayWidth,0,0, 0,info->var.bits_per_pixel);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, par->stExtendInfo.DisplayWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        return HI_FAILURE;
    }

    u32Stride = CONIFG_HIFB_GetMaxStride(par->stExtendInfo.DisplayWidth,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    Surface.u32Pitch  = u32Stride;

    if (   (HIFB_LAYER_BUF_DOUBLE == par->stExtendInfo.enBufMode)
        || (HIFB_LAYER_BUF_DOUBLE_IMMEDIATE == par->stExtendInfo.enBufMode)
        || (HIFB_LAYER_BUF_FENCE == par->stExtendInfo.enBufMode))
    {
        HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(par->stRunInfo.u32IndexForInt, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
        Surface.u32PhyAddr = par->st3DInfo.u32DisplayAddr[par->stRunInfo.u32IndexForInt];
    }
    else
    {
        Surface.u32PhyAddr = par->st3DInfo.u32DisplayAddr[0];
    }

    if (0 == Surface.u32PhyAddr)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Surface.u32PhyAddr);
        return HI_FAILURE;
    }

    stOpt.bBlock = HI_TRUE;
    g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_ClearRect(&Surface, &stOpt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_ReAllocStereoBuf(HIFB_LAYER_ID_E enLayerId, HI_U32 u32BufStride, HI_U32 u32BufferSize)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *info = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(enLayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[enLayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_FAILURE);

    if (HIFB_STEREO_MONO == pstPar->st3DInfo.StereoMode)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if ((HIFB_LAYER_BUF_NONE != pstPar->stExtendInfo.enBufMode) && (HIFB_REFRESH_MODE_WITH_PANDISPLAY != pstPar->stExtendInfo.enBufMode))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if ((HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode) && (HIFB_STEREO_FRMPACKING  == pstPar->st3DInfo.StereoMode))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (u32BufferSize <= pstPar->st3DInfo.st3DMemInfo.u32StereoMemLen)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32BufferSize, HIFB_MAX_SIZE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(u32BufferSize, HIFB_MIN_SIZE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
    Ret = DRV_HIFB_AllocStereoBuf(info, u32BufferSize);
    if (Ret != HI_SUCCESS)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32BufferSize);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_AllocStereoBuf, Ret);
        return Ret;
    }

    pstPar->st3DInfo.st3DSurface.u32Width  = info->var.xres;
    pstPar->st3DInfo.st3DSurface.u32Height = info->var.yres;
    pstPar->st3DInfo.st3DSurface.u32Pitch  = u32BufStride;
    pstPar->st3DInfo.st3DSurface.u32PhyAddr = pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart;
    pstPar->st3DInfo.u32rightEyeAddr = pstPar->st3DInfo.st3DSurface.u32PhyAddr;
    pstPar->stRunInfo.u32IndexForInt = 0;

    DRV_HIFB_ClearStereoBuf(info);

    DRV_HIFB_AssignDispBuf(pstPar->stBaseInfo.u32LayerID);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_SetPar
* description  : CNcomment: 配置参数 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_SetPar(struct fb_info *info)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride = 0;
    HIFB_PAR_S *pstPar = NULL;
    HIFB_COLOR_FMT_E enFmt = HIFB_FMT_ARGB8888;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_FAILURE);

    Ret = DRV_HIFB_CheckWhetherResolutionSupport(pstPar->stBaseInfo.u32LayerID, info->var.xres, info->var.yres);
    if (HI_SUCCESS != Ret)
    {
        return HI_FAILURE;
    }

    enFmt = HIFB_GetFmtByArgb(&info->var.red, &info->var.green, &info->var.blue, &info->var.transp, info->var.bits_per_pixel);

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_BITSPERPIXEL,info->var.xres_virtual,0,0, 0,info->var.bits_per_pixel);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.xres_virtual);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_PARA_CHECK_SUPPORT, Ret);
        return HI_FAILURE;
    }
    u32Stride = CONIFG_HIFB_GetMaxStride(info->var.xres_virtual,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
#ifdef CONFIG_HIFB_REALLOC_MEM
    if (!pstPar->bPanFlag)
    {
        u32BufSize = HI_HIFB_GetMemSize(u32Stride,info->var.yres_virtual);
        HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32BufSize, HIFB_MAX_SIZE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);
        HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(u32BufSize, HIFB_MIN_SIZE(pstPar->stBaseInfo.u32LayerID), HI_FAILURE);

        if (u32BufSize > info->fix.smem_len)
        {
            HI_GFX_Memset(&(pstPar->stDispTmpBuf),0,sizeof(pstPar->stDispTmpBuf));

            pstPar->stDispTmpBuf.u32SmemStartPhy  = pstPar->u32SmemStartPhy;
            pstPar->stDispTmpBuf.u32PhyBuf        = info->fix.smem_start;
            pstPar->stDispTmpBuf.pVirBuf          = info->screen_base;

            Ret = DRV_HIFB_AllocLayerBuffer(pstPar->stBaseInfo.u32LayerID, u32BufSize);
            if (HI_FAILURE == Ret)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stBaseInfo.u32LayerID);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32BufSize);
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_AllocLayerBuffer, Ret);
                return HI_FAILURE;
            }

            info->fix.smem_len = u32BufSize;
            pstPar->stRunInfo.u32IndexForInt = 0;

            DRV_HIFB_AssignDispBuf(pstPar->stBaseInfo.u32LayerID);

            pstPar->stRunInfo.bModifying = HI_TRUE;
            pstPar->stRunInfo.CurScreenAddr = info->fix.smem_start;
            pstPar->st3DInfo.u32rightEyeAddr = info->fix.smem_start;
            pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
            pstPar->stRunInfo.bModifying = HI_FALSE;

            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(pstPar->stBaseInfo.u32LayerID, info->fix.smem_start);

            INIT_WORK(&(pstPar->stDispTmpBuf.bDisBufWork), HIFB_ReAllocWork);
            pstPar->stDispTmpBuf.bStartRelease = HI_TRUE;
        }
    }
    else
#endif
    {
        Ret = HIFB_CheckMemEnough(info, u32Stride, info->var.yres);
        if (HI_FAILURE == Ret)
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.yres);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Stride);
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_CheckMemEnough, Ret);
            return HI_FAILURE;
        }
    }

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if ((pstPar->st3DInfo.IsStereo) && (HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode))
    {
        u32Stride = CONIFG_HIFB_GetMaxStride(info->var.xres,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);

        pstPar->st3DInfo.st3DSurface.enFmt     = enFmt;
        pstPar->st3DInfo.st3DSurface.u32Width  = info->var.xres;
        pstPar->st3DInfo.st3DSurface.u32Height = info->var.yres;

        pstPar->stRunInfo.bModifying           = HI_TRUE;
        pstPar->st3DInfo.st3DSurface.u32Pitch  = u32Stride;
        pstPar->stRunInfo.u32ParamModifyMask  |= HIFB_LAYER_PARAMODIFY_STRIDE;
        pstPar->stRunInfo.bModifying           = HI_FALSE;
        info->fix.line_length = u32Stride;
    }
    else
#endif
    {
        u32Stride = CONIFG_HIFB_GetMaxStride(info->var.xres_virtual,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
        if ((u32Stride != info->fix.line_length) ||(info->var.yres != pstPar->stExtendInfo.DisplayHeight))
        {
            pstPar->stRunInfo.bModifying     = HI_TRUE;
            info->fix.line_length            = u32Stride;
            DRV_HIFB_AssignDispBuf(pstPar->stBaseInfo.u32LayerID);
            pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
            pstPar->stRunInfo.bModifying      = HI_FALSE;
        }
    }

    if ((pstPar->stExtendInfo.enColFmt != enFmt))
    {
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
        HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_GFX_ARRAY_SIZE(s_stTextLayer), HI_FAILURE);
        if (s_stTextLayer[pstPar->stBaseInfo.u32LayerID].bAvailable)
        {
            HI_U32 i = 0;
            for (i = 0; i < SCROLLTEXT_NUM; i++)
            {
                if (s_stTextLayer[pstPar->stBaseInfo.u32LayerID].stScrollText[i].bAvailable)
                {
                    DRV_HIFB_SCROLLTEXT_FreeCacheBuf(&(s_stTextLayer[pstPar->stBaseInfo.u32LayerID].stScrollText[i]));
                    HI_GFX_Memset(&s_stTextLayer[pstPar->stBaseInfo.u32LayerID].stScrollText[i],0,sizeof(HIFB_SCROLLTEXT_S));
                }
            }
            s_stTextLayer[pstPar->stBaseInfo.u32LayerID].bAvailable      = HI_FALSE;
            s_stTextLayer[pstPar->stBaseInfo.u32LayerID].u32textnum      = 0;
            s_stTextLayer[pstPar->stBaseInfo.u32LayerID].u32ScrollTextId = 0;
        }
#endif
        pstPar->stRunInfo.bModifying   = HI_TRUE;
        pstPar->stExtendInfo.enColFmt = enFmt;
        pstPar->stRunInfo.u32ParamModifyMask  |= HIFB_LAYER_PARAMODIFY_FMT;
        pstPar->stRunInfo.bModifying = HI_FALSE;

    }

    DRV_HIFB_SetDispInfo(pstPar->stBaseInfo.u32LayerID);

    pstPar->bPanFlag = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static inline HI_S32 DRV_HIFB_CheckWhetherResolutionSupport(HI_U32 LayerId, HI_U32 Width, HI_U32 Height)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    switch (LayerId)
    {
       case HIFB_LAYER_HD_0:
       case HIFB_LAYER_HD_1:
       case HIFB_LAYER_HD_2:
       case HIFB_LAYER_HD_3:
           if (  (Width  < CONFIG_HIFB_LAYER_MINWIDTH)  || (Width > CONFIG_HIFB_LAYER_MAXWIDTH)
               ||(Height < CONFIG_HIFB_LAYER_MINHEIGHT) ||(Height > CONFIG_HIFB_LAYER_MAXHEIGHT))
           {
               HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Width);
               HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Height);
               return HI_FAILURE;
           }
           break;
       default:
            return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static inline HI_VOID DRV_HIFB_SetDispInfo(HI_U32 LayerId)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    if (  (info->var.xres == pstPar->stExtendInfo.DisplayWidth)
        &&(info->var.yres == pstPar->stExtendInfo.DisplayHeight))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.xres);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.yres);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->stExtendInfo.DisplayWidth);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->stExtendInfo.DisplayHeight);
        return;
    }

    if (((0 == info->var.xres) || (0 == info->var.yres)) && ((HI_TRUE == pstPar->stExtendInfo.bShow)))
    {
        pstPar->stRunInfo.bModifying          = HI_TRUE;
        pstPar->stExtendInfo.bShow            = HI_FALSE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_SHOW;
        pstPar->stRunInfo.bModifying          = HI_FALSE;
    }

    HIFB_SetDispSize(LayerId, info->var.xres, info->var.yres);
    DRV_HIFB_AssignDispBuf(LayerId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_VOID HIFB_SetDispLayerPos(HI_U32 u32LayerId, HI_S32 s32XPos, HI_S32 s32YPos)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stExtendInfo.stPos.s32XPos = s32XPos;
    pstPar->stExtendInfo.stPos.s32YPos = s32YPos;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_VOID HIFB_SetBufMode(HI_U32 u32LayerId, HIFB_LAYER_BUF_E enLayerBufMode)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    if ((pstPar->stExtendInfo.enBufMode == HIFB_LAYER_BUF_NONE) && (pstPar->stExtendInfo.enBufMode != enLayerBufMode))
    {
        pstPar->stRunInfo.bModifying = HI_TRUE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FMT;
        pstPar->stRunInfo.bModifying = HI_FALSE;
    }

    pstPar->stExtendInfo.enBufMode = enLayerBufMode;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}


/***************************************************************************************
* func         : HIFB_SetDispSize
* description  : CNcomment: choose the module to do  flicker resiting,
                            TDE or VOU ? the rule is as this ,the moudle
                            should do flicker resisting who has do scaling CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_VOID DRV_HIFB_SelectAntiflickerMode(HIFB_PAR_S *pstPar)
{
    HIFB_RECT stOutputRect = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    if (HIFB_LAYER_ANTIFLICKER_NONE == pstPar->stBaseInfo.enAntiflickerLevel)
    {
       pstPar->stBaseInfo.bNeedAntiflicker = HI_FALSE;
       pstPar->stBaseInfo.enAntiflickerMode = HIFB_ANTIFLICKER_NONE;
       HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
       return;
    }

    pstPar->stBaseInfo.bNeedAntiflicker = HI_TRUE;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOutRect(pstPar->stBaseInfo.u32LayerID, &stOutputRect);

   if ((pstPar->stExtendInfo.DisplayWidth != stOutputRect.w) || (pstPar->stExtendInfo.DisplayHeight != stOutputRect.h))
   {
       pstPar->stBaseInfo.enAntiflickerMode = HIFB_ANTIFLICKER_VO;
       HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
       return;
   }

   pstPar->stBaseInfo.enAntiflickerMode = HIFB_ANTIFLICKER_TDE;

   HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
   return;
}

/***************************************************************************************
* func         : DRV_HIFB_SetAntiflickerLevel
* description  : CNcomment: 设置抗闪级别 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_VOID DRV_HIFB_SetAntiflickerLevel(HI_U32 u32LayerId, HIFB_LAYER_ANTIFLICKER_LEVEL_E enAntiflickerLevel)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    /***********************END CHECK PAR ******************************/

    pstPar->stBaseInfo.enAntiflickerLevel = enAntiflickerLevel;
    DRV_HIFB_SelectAntiflickerMode(pstPar);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return;
}

static HI_S32 DRV_HIFB_SetDispAddressr(HI_U32 u32LayerId)
{
    HI_U32 u32Index;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    u32Index = pstPar->stRunInfo.u32IndexForInt;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if (pstPar->st3DInfo.IsStereo)
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(u32LayerId, pstPar->st3DInfo.u32DisplayAddr[u32Index]);
        pstPar->stRunInfo.CurScreenAddr  = pstPar->st3DInfo.u32DisplayAddr[u32Index];
        pstPar->st3DInfo.u32rightEyeAddr = pstPar->stRunInfo.CurScreenAddr;
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimAddr(u32LayerId, pstPar->st3DInfo.u32rightEyeAddr);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
#endif
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(u32LayerId, pstPar->stDispInfo.u32DisplayAddr[u32Index]);
        pstPar->stRunInfo.CurScreenAddr  = pstPar->stDispInfo.u32DisplayAddr[u32Index];
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if (HI_TRUE == pstPar->st3DInfo.IsStereo)
    {
        pstPar->stRunInfo.u32IndexForInt = (0 == pstPar->stRunInfo.StereoBufNum) ? (0) : (++u32Index) % pstPar->stRunInfo.StereoBufNum;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
#endif
    {
        pstPar->stRunInfo.u32IndexForInt = (0 == pstPar->stRunInfo.u32BufNum) ? (0) : (++u32Index) % pstPar->stRunInfo.u32BufNum;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    pstPar->stRunInfo.bFliped = HI_TRUE;
    pstPar->stRunInfo.bNeedFlip = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_VoCallBack
* description  : CNcomment: vo中断处理 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_VoCallBack(HI_VOID *pParaml, HI_VOID *pParamr)
{
    HI_U32 *pu32LayerId  = NULL;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar   = NULL;
    HIFB_RECT stInRect   = {0};
    HI_U32 NowTimeMs = 0;
    HI_U32 EndTimeMs = 0;
    static HI_U32 FlipFps = 0;
    HI_BOOL  HasBeenClosedForVoCallBack = HI_FALSE;
    HI_BOOL  bARDataDecompressErr = HI_FALSE;
    HI_BOOL  bGBDataDecompressErr = HI_FALSE;
    HI_ULONG ExpectIntLineNumsForVoCallBack  = 0;
    HI_ULONG ExpectIntLineNumsForEndCallBack = 0;
    HI_ULONG ActualIntLineNumsForVoCallBack  = 0;
    HI_ULONG HardIntCntForVoCallBack = 0;
    HI_GFX_TINIT();
    HI_UNUSED(pParamr);

    /***************************beg check para ***********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pParaml, HI_FAILURE);
    pu32LayerId = (HI_U32*)pParaml;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(*pu32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[*pu32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***************************end check para ***********************************/

    /***************************beg count fps ************************************/
    HI_GFX_TSTART(NowTimeMs);
    FlipFps++;
    if ((NowTimeMs - pstPar->stFrameInfo.StartTimeMs) >= 1000)
    {
        pstPar->stFrameInfo.StartTimeMs = NowTimeMs;
        pstPar->stFrameInfo.FlipFps = (FlipFps != pstPar->stFrameInfo.FlipFps) ? FlipFps : pstPar->stFrameInfo.FlipFps;
        pstPar->stFrameInfo.DrawFps = pstPar->stFrameInfo.RefreshFrame;
        pstPar->stFrameInfo.RefreshFrame = 0;
        FlipFps = 0;
    }
    /***************************end count fps ************************************/

    /***************************beg count times **********************************/
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetCloseState(*pu32LayerId,&HasBeenClosedForVoCallBack, NULL);
    if (HI_TRUE == HasBeenClosedForVoCallBack)
    {
        pstPar->stFrameInfo.PreTimeMs = 0;
        pstPar->stFrameInfo.MaxTimeMs = 0;
    }
    if (0 == pstPar->stFrameInfo.PreTimeMs)
    {
        pstPar->stFrameInfo.PreTimeMs = NowTimeMs;
    }
    if ((NowTimeMs - pstPar->stFrameInfo.PreTimeMs) > pstPar->stFrameInfo.MaxTimeMs)
    {
        pstPar->stFrameInfo.MaxTimeMs = NowTimeMs - pstPar->stFrameInfo.PreTimeMs;
    }
    pstPar->stFrameInfo.PreTimeMs = NowTimeMs;
    /***************************end count fps ************************************/

    /***************************beg count interupt information *******************/
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDhd0Info(*pu32LayerId,&ExpectIntLineNumsForVoCallBack,
                                                        &ExpectIntLineNumsForEndCallBack,
                                                        &ActualIntLineNumsForVoCallBack,
                                                        &HardIntCntForVoCallBack);
    pstPar->stFrameInfo.ExpectIntLineNumsForVoCallBack  = ExpectIntLineNumsForVoCallBack;
    pstPar->stFrameInfo.ActualIntLineNumsForVoCallBack  = ActualIntLineNumsForVoCallBack;
    pstPar->stFrameInfo.ExpectIntLineNumsForEndCallBack = ExpectIntLineNumsForEndCallBack;
    pstPar->stFrameInfo.HardIntCntForVoCallBack         = HardIntCntForVoCallBack;

    pstPar->stFrameInfo.VoSoftCallBackCnt++;
    /***************************end count interupt information *******************/

    /***************************beg count decompress times ***********************/
#ifdef CONFIG_GFX_PROC_SUPPORT
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDecompressStatus(*pu32LayerId, &bARDataDecompressErr, &bGBDataDecompressErr, pstPar->stProcInfo.bCloseInterrupt);
#else
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDecompressStatus(*pu32LayerId, &bARDataDecompressErr, &bGBDataDecompressErr, HI_FALSE);
#endif
    if (HI_TRUE == bARDataDecompressErr)
    {
       pstPar->stFrameInfo.ARDataDecompressErrCnt++;
    }

    if (HI_TRUE == bGBDataDecompressErr)
    {
       pstPar->stFrameInfo.GBDataDecompressErrCnt++;
    }
    /***************************end count decompress times ***********************/

    /*************************** up register information **********************/
    if (!pstPar->stRunInfo.bModifying)
    {
        if (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_SHOW)
        {
            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetEnable(*pu32LayerId, pstPar->stExtendInfo.bShow);
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_SHOW;
        }

        if (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_ALPHA)
        {
            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAlpha(*pu32LayerId, &pstPar->stExtendInfo.stAlpha);
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_ALPHA;
        }

        if (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_COLORKEY)
        {
            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayKeyMask(*pu32LayerId, &pstPar->stExtendInfo.stCkey);
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_COLORKEY;
        }

        if (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_BMUL)
        {
            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerPreMult(*pu32LayerId, pstPar->stBaseInfo.bPreMul);
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_BMUL;
        }

        if (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_ANTIFLICKERLEVEL)
        {
            HIFB_DEFLICKER_S stDeflicker;
            stDeflicker.pu8HDfCoef  = pstPar->stBaseInfo.ucHDfcoef;
            stDeflicker.pu8VDfCoef  = pstPar->stBaseInfo.ucVDfcoef;
            stDeflicker.u32HDfLevel = pstPar->stBaseInfo.u32HDflevel;
            stDeflicker.u32VDfLevel = pstPar->stBaseInfo.u32VDflevel;

            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDeFlicker(*pu32LayerId, &stDeflicker);
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_ANTIFLICKERLEVEL;
        }

        if (  (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_INRECT)
            ||(pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_OUTRECT))
        {
            stInRect.x = pstPar->stExtendInfo.stPos.s32XPos;
            stInRect.y = pstPar->stExtendInfo.stPos.s32YPos;
            stInRect.w = (HI_S32)pstPar->stExtendInfo.DisplayWidth;
            stInRect.h = (HI_S32)pstPar->stExtendInfo.DisplayHeight;

            g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerRect(*pu32LayerId, &stInRect);
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_INRECT;
            pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_OUTRECT;
        }

        DRV_HIFB_UpdataInputDataFmt(*pu32LayerId);

        DRV_HIFB_UpdataInputDataStride(*pu32LayerId);

        #ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
        DRV_HIFB_UpLowPowerInfo(*pu32LayerId);
        #endif

        DRV_HIFB_UpdataRefreshInfo(*pu32LayerId);
    }

    DRV_HIFB_SwitchDispBuffer(*pu32LayerId);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_UpLayerReg(*pu32LayerId);

#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    DRV_HIFB_SCROLLTEXT_Blit(*pu32LayerId);
#endif

    /***************************beg count run times ******************************/
    HI_GFX_TEND(EndTimeMs);
    if ((EndTimeMs - NowTimeMs) > pstPar->stFrameInfo.RunMaxTimeMs)
    {
        pstPar->stFrameInfo.RunMaxTimeMs = EndTimeMs - NowTimeMs;
    }
    /***************************end count run times ******************************/

    return HI_SUCCESS;
}

#ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
static inline HI_VOID DRV_HIFB_UpLowPowerInfo(HI_U32 LayerId)
{
    HI_U32 IsLowPowerHasRfresh = 0x0;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *info = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    /***********************END CHECK PAR ******************************/

    IsLowPowerHasRfresh = (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_LOWPOWER);
    if (!IsLowPowerHasRfresh)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLowPowerInfo(LayerId, &(pstPar->stLowPowerInfo));

    pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_LOWPOWER;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

static inline HI_VOID DRV_HIFB_UpdataRefreshInfo(HI_U32 LayerId)
{
    HI_U32 IsInputDataHasRfresh = 0x0;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    /***********************END CHECK PAR ******************************/

    IsInputDataHasRfresh = (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_REFRESH);
    if (!IsInputDataHasRfresh)
    {
        return;
    }

    DRV_HIFB_UpdataInputDataDDR(LayerId);

#if defined(CONFIG_HIFB_FENCE_SUPPORT) || defined(CFG_HI_FB_DECOMPRESS_SUPPORT)
    DRV_HIFB_SetDecmpLayerInfo(LayerId);
#endif

    pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_REFRESH;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID DRV_HIFB_UpdataInputDataFmt(HI_U32 LayerId)
{
    HI_U32 IsInputDataFmtHasChanged = 0x0;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    /***********************END CHECK PAR ******************************/

    IsInputDataFmtHasChanged = (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_FMT);
    if (!IsInputDataFmtHasChanged)
    {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
    }

    if ((pstPar->stExtendInfo.enBufMode == HIFB_LAYER_BUF_NONE) && pstPar->stDispInfo.stUserBuffer.stCanvas.u32PhyAddr)
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt(LayerId, pstPar->stDispInfo.stUserBuffer.stCanvas.enFmt);
    }
    else
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt(LayerId, pstPar->stExtendInfo.enColFmt);
    }

    pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_FMT;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID DRV_HIFB_UpdataInputDataStride(HI_U32 LayerId)
{
     HI_U32 InputDataStride = 0;
     HI_U32 IsInputDataStrideHasChanged = 0x0;
     struct fb_info *info = NULL;
     HIFB_PAR_S *pstPar = NULL;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     /***********************BEG CHECK PAR ******************************/
     HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
     info = s_stLayer[LayerId].pstInfo;
     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
     pstPar = (HIFB_PAR_S *)(info->par);
     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
     /***********************END CHECK PAR ******************************/

     IsInputDataStrideHasChanged = (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_STRIDE);
     if (!IsInputDataStrideHasChanged)
     {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
     }

 #ifdef CONFIG_HIFB_STEREO_SUPPORT
     if (pstPar->st3DInfo.IsStereo)
     {
         InputDataStride = pstPar->st3DInfo.st3DSurface.u32Pitch;
     }
     else
 #endif
    {
         if ((pstPar->stExtendInfo.enBufMode == HIFB_LAYER_BUF_NONE) && (pstPar->stDispInfo.stUserBuffer.stCanvas.u32PhyAddr))
         {
             InputDataStride = pstPar->stDispInfo.stUserBuffer.stCanvas.u32Pitch;
         }
         else
         {
             InputDataStride = info->fix.line_length;
         }
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride(LayerId, InputDataStride);

    pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_STRIDE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID DRV_HIFB_UpdataInputDataDDR(HI_U32 LayerId)
{
    HI_U32 IsInputDataDDRHasChanged = 0x0;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    /***********************END CHECK PAR ******************************/

    IsInputDataDDRHasChanged = (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_DISPLAYADDR);
    if (!IsInputDataDDRHasChanged)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(LayerId, pstPar->stRunInfo.CurScreenAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->stRunInfo.CurScreenAddr);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if (pstPar->st3DInfo.IsStereo)
    {
        pstPar->st3DInfo.u32rightEyeAddr = pstPar->stRunInfo.CurScreenAddr;
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimAddr(LayerId, pstPar->st3DInfo.u32rightEyeAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->st3DInfo.u32rightEyeAddr);
    }
#endif

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");

    pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_DISPLAYADDR;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_SwitchDispBuffer
* description  : CNcomment: switch display buffer CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_VOID DRV_HIFB_SwitchDispBuffer(HI_U32 LayerId)
{
    HI_BOOL bDispEnable = HI_TRUE;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***************************beg check par **********************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LayerId, HI_GFX_ARRAY_SIZE(s_stLayer));
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    /***************************end check par **********************************/

    /***************************beg set display buffer *************************/
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetHaltDispStatus(pstPar->stBaseInfo.u32LayerID, &bDispEnable);

    if ((HIFB_LAYER_BUF_DOUBLE == pstPar->stExtendInfo.enBufMode) && (HI_TRUE == pstPar->stRunInfo.bNeedFlip))
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        DRV_HIFB_SetDispAddressr(LayerId);
    }

    if ((HIFB_LAYER_BUF_FENCE == pstPar->stExtendInfo.enBufMode) && (HI_TRUE == pstPar->stRunInfo.bNeedFlip))
    {
        DRV_HIFB_SetDispAddressr(LayerId);
#ifdef CONFIG_HIFB_FENCE_SUPPORT
        while (pstPar->FenceRefreshCount > 0)
        {
           DRV_HIFB_FENCE_IncRefreshTime(bDispEnable);
           pstPar->FenceRefreshCount--;
        }
#endif
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    /***************************end set display buffer *************************/

#ifdef CONFIG_HIFB_REALLOC_MEM
    if (HI_TRUE == pstPar->stDispTmpBuf.bStartRelease)
    {
        schedule_work(&(pstPar->stDispTmpBuf.bDisBufWork));
        pstPar->stDispTmpBuf.bStartRelease = HI_FALSE;
    }
#endif
#ifdef CONFIG_HIFB_STEREO_SUPPORT
    else if (  (pstPar->stExtendInfo.enBufMode == HIFB_REFRESH_MODE_WITH_PANDISPLAY)
            && (0 != pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart)
            && (HI_TRUE == pstPar->st3DInfo.IsStereo)
            && (HI_TRUE == pstPar->stRunInfo.bNeedFlip))
    {
        DRV_HIFB_SetDispAddressr(LayerId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_Flip_0buf
* description   : CNcomment: no display buffer refresh CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_0buf(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_U32 u32StartAddr;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);
    u32StartAddr = pstCanvasBuf->stCanvas.u32PhyAddr;

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.CurScreenAddr = u32StartAddr;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;

    pstPar->stDispInfo.stUserBuffer.stCanvas.u32Pitch = pstCanvasBuf->stCanvas.u32Pitch;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;

    pstPar->stDispInfo.stUserBuffer.stCanvas.enFmt = pstCanvasBuf->stCanvas.enFmt;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FMT;

    HIFB_SetDispSize(u32LayerId, pstCanvasBuf->stCanvas.u32Width, pstCanvasBuf->stCanvas.u32Height);

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;

    pstPar->stRunInfo.bModifying = HI_FALSE;

    DRV_HIFB_WaitVBlank(u32LayerId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_Flip_1buf
* description  : CNcomment: one canvas buffer,one display buffer refresh CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_1buf(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_BUFFER_S stDisplayBuf;
    HIFB_OSD_DATA_S stOsdData;
    HIFB_BLIT_OPT_S stBlitOpt;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    HI_GFX_Memset(&stBlitOpt,    0, sizeof(stBlitOpt));
    HI_GFX_Memset(&stDisplayBuf, 0, sizeof(stDisplayBuf));

    stDisplayBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
    stDisplayBuf.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stDisplayBuf.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stDisplayBuf.stCanvas.u32Pitch   = info->fix.line_length;
    stDisplayBuf.stCanvas.u32PhyAddr = pstPar->stDispInfo.u32DisplayAddr[0];

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOSDData(u32LayerId, &stOsdData);

    if (stOsdData.u32RegPhyAddr != pstPar->stDispInfo.u32DisplayAddr[0] && pstPar->stDispInfo.u32DisplayAddr[0])
    {
        pstPar->stRunInfo.bModifying = HI_TRUE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
        pstPar->stRunInfo.CurScreenAddr = pstPar->stDispInfo.u32DisplayAddr[0];
        HI_GFX_Memset(info->screen_base, 0x0, info->fix.smem_len);
        pstPar->stRunInfo.bModifying = HI_FALSE;
    }

#if 0
    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }
#endif
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);

    if (   pstCanvasBuf->stCanvas.u32Height != pstPar->stExtendInfo.DisplayHeight
        || pstCanvasBuf->stCanvas.u32Width != pstPar->stExtendInfo.DisplayWidth)
    {
        stBlitOpt.bScale = HI_TRUE;
        stDisplayBuf.UpdateRect.x = 0;
        stDisplayBuf.UpdateRect.y = 0;
        stDisplayBuf.UpdateRect.w = stDisplayBuf.stCanvas.u32Width;
        stDisplayBuf.UpdateRect.h = stDisplayBuf.stCanvas.u32Height;
    }
    else
    {
        stDisplayBuf.UpdateRect = pstCanvasBuf->UpdateRect;
    }

    stBlitOpt.bBlock = HI_FALSE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;

    pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(pstCanvasBuf, &stDisplayBuf, &stBlitOpt, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        return HI_FAILURE;
    }

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


/***************************************************************************************
* func         : DRV_HIFB_Flip_2buf
* description  : CNcomment: 异步刷新 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_2buf(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Index;
    unsigned long lockflag;
    HIFB_BUFFER_S stForeBuf;
    HIFB_BUFFER_S stBackBuf;
    HIFB_BLIT_OPT_S stBlitOpt;
    HIFB_OSD_DATA_S stOsdData;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    u32Index = pstPar->stRunInfo.u32IndexForInt;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(1 - u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    HI_GFX_Memset(&stForeBuf, 0, sizeof(stForeBuf));
    HI_GFX_Memset(&stBackBuf, 0, sizeof(stBackBuf));

    stBlitOpt.bCallBack = HI_TRUE;
    stBlitOpt.pfnCallBack = (IntCallBack)DRV_HIFB_BlitFinishCallBack;
    stBlitOpt.pParam = &(pstPar->stBaseInfo.u32LayerID);

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&lockflag);
    pstPar->stRunInfo.bNeedFlip = HI_FALSE;
    pstPar->stRunInfo.s32RefreshHandle = 0;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&lockflag);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOSDData(u32LayerId, &stOsdData);

    stBackBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
    stBackBuf.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stBackBuf.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stBackBuf.stCanvas.u32Pitch   = info->fix.line_length;
    stBackBuf.stCanvas.u32PhyAddr = pstPar->stDispInfo.u32DisplayAddr[u32Index];

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);

    if (  (pstCanvasBuf->stCanvas.u32Height != pstPar->stExtendInfo.DisplayHeight)
        ||(pstCanvasBuf->stCanvas.u32Width  != pstPar->stExtendInfo.DisplayWidth))
    {
        stBlitOpt.bScale = HI_TRUE;
    }

    HIFB_GetUpdateRect(u32LayerId, pstCanvasBuf, &stBackBuf.UpdateRect);

    if ((pstPar->stRunInfo.bFliped) && (stOsdData.u32RegPhyAddr == pstPar->stDispInfo.u32DisplayAddr[1-u32Index]))
    {
        HIFB_BackUpForeBuf(u32LayerId, &stBackBuf);
        HI_GFX_Memset(&(pstPar->stDispInfo.stUpdateRect), 0, sizeof(pstPar->stDispInfo.stUpdateRect));
        pstPar->stRunInfo.bFliped = HI_FALSE;
    }

    /* update union rect */
    if ((pstPar->stDispInfo.stUpdateRect.w == 0) || (pstPar->stDispInfo.stUpdateRect.h == 0))
    {
        HI_GFX_Memcpy(&pstPar->stDispInfo.stUpdateRect, &stBackBuf.UpdateRect, sizeof(HIFB_RECT));
    }
    else
    {
        HIFB_UNITE_RECT(pstPar->stDispInfo.stUpdateRect, stBackBuf.UpdateRect);
    }

    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    if (stBlitOpt.bScale == HI_TRUE)
    {
        stBackBuf.UpdateRect.x = 0;
        stBackBuf.UpdateRect.y = 0;
        stBackBuf.UpdateRect.w = stBackBuf.stCanvas.u32Width;
        stBackBuf.UpdateRect.h = stBackBuf.stCanvas.u32Height;
    }
    else
    {
        stBackBuf.UpdateRect = pstCanvasBuf->UpdateRect;
    }

    stBlitOpt.bBlock = HI_FALSE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;

    pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(pstCanvasBuf, &stBackBuf,&stBlitOpt, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        goto RET;
    }

    pstPar->stRunInfo.s32RefreshHandle = Ret;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.bModifying = HI_FALSE;

RET:
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_Flip_2buf_immediate_display
* description  : CNcomment: 同步刷新 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_2buf_immediate_display(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Index = 0;
    unsigned long lockflag = 0;
    HIFB_BUFFER_S stForeBuf;
    HIFB_BUFFER_S stBackBuf;
    HIFB_BLIT_OPT_S stBlitOpt;
    HIFB_OSD_DATA_S stOsdData;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    u32Index = pstPar->stRunInfo.u32IndexForInt;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(1-u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    HI_GFX_Memset(&stForeBuf, 0, sizeof(stForeBuf));
    HI_GFX_Memset(&stBackBuf, 0, sizeof(stBackBuf));

    stBlitOpt.bCallBack = HI_FALSE;
    stBlitOpt.pParam = &(pstPar->stBaseInfo.u32LayerID);

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&lockflag);
    pstPar->stRunInfo.bNeedFlip = HI_FALSE;
    pstPar->stRunInfo.s32RefreshHandle = 0;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&lockflag);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOSDData(u32LayerId, &stOsdData);

    stBackBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
    stBackBuf.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stBackBuf.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stBackBuf.stCanvas.u32Pitch   = info->fix.line_length;
    stBackBuf.stCanvas.u32PhyAddr = pstPar->stDispInfo.u32DisplayAddr[u32Index];

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);

    if (   (pstCanvasBuf->stCanvas.u32Height != pstPar->stExtendInfo.DisplayHeight)
        || (pstCanvasBuf->stCanvas.u32Width  != pstPar->stExtendInfo.DisplayWidth))
    {
        stBlitOpt.bScale = HI_TRUE;
    }

    HIFB_GetUpdateRect(u32LayerId, pstCanvasBuf, &stBackBuf.UpdateRect);

    HIFB_BackUpForeBuf(u32LayerId, &stBackBuf);

    HI_GFX_Memcpy(&pstPar->stDispInfo.stUpdateRect, &stBackBuf.UpdateRect, sizeof(HIFB_RECT));

    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    if (stBlitOpt.bScale == HI_TRUE)
    {
        stBackBuf.UpdateRect.x = 0;
        stBackBuf.UpdateRect.y = 0;
        stBackBuf.UpdateRect.w = stBackBuf.stCanvas.u32Width;
        stBackBuf.UpdateRect.h = stBackBuf.stCanvas.u32Height;
    }
    else
    {
        stBackBuf.UpdateRect = pstCanvasBuf->UpdateRect;
    }

    stBlitOpt.bRegionDeflicker = HI_TRUE;
    stBlitOpt.bBlock           = HI_TRUE;

    pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(pstCanvasBuf, &stBackBuf,&stBlitOpt, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        goto RET;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.CurScreenAddr = pstPar->stDispInfo.u32DisplayAddr[u32Index];
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    pstPar->stRunInfo.u32IndexForInt = 1 - u32Index;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    DRV_HIFB_WaitVBlank(u32LayerId);
RET:
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_FlipWithFence
* description  : CNcomment: fence异步刷新 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_FlipWithFence(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Index;
    unsigned long lockflag;
    HIFB_BUFFER_S stForeBuf;
    HIFB_BUFFER_S stBackBuf;
    HIFB_BLIT_OPT_S stBlitOpt;
    HIFB_OSD_DATA_S stOsdData;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    struct hi_sync_fence *pSyncfence = NULL;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***************************beg check par **********************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);
    /***************************end check par **********************************/

    /***************************beg wait draw finish ***************************/
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    if (pstCanvasBuf->AcquireFenceFd >= 0)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstCanvasBuf->AcquireFenceFd);
        pSyncfence = hi_sync_fence_fdget(pstCanvasBuf->AcquireFenceFd);
    }

    if (NULL != pSyncfence)
    {
        DRV_HIFB_FENCE_Wait(pSyncfence, 3000);
        hi_sync_fence_put(pSyncfence);
        pSyncfence = NULL;
    }
#endif
    /***************************end wait draw finish ***************************/

    /***************************get cur display buffer *************************/
    u32Index = pstPar->stRunInfo.u32IndexForInt;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(1 - u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    pstCanvasBuf->CurDispBufferNum = u32Index;
    /***************************end cur display buffer *************************/

    /***************************beg initial struct *****************************/
    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    HI_GFX_Memset(&stForeBuf, 0, sizeof(stForeBuf));
    HI_GFX_Memset(&stBackBuf, 0, sizeof(stBackBuf));
    /***************************end initial struct *****************************/

    stBlitOpt.bCallBack   = HI_TRUE;
    stBlitOpt.pfnCallBack = (IntCallBack)DRV_HIFB_BlitFinishCallBack;
    stBlitOpt.pParam      = &(pstPar->stBaseInfo.u32LayerID);

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&lockflag);
    pstPar->stRunInfo.bNeedFlip        = HI_FALSE;
    pstPar->stRunInfo.s32RefreshHandle = 0;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&lockflag);

    stBackBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
    stBackBuf.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stBackBuf.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stBackBuf.stCanvas.u32Pitch   = info->fix.line_length;
    stBackBuf.stCanvas.u32PhyAddr = pstPar->stDispInfo.u32DisplayAddr[u32Index];

    if (  (pstCanvasBuf->stCanvas.u32Height != pstPar->stExtendInfo.DisplayHeight)
        ||(pstCanvasBuf->stCanvas.u32Width  != pstPar->stExtendInfo.DisplayWidth))
    {
        stBlitOpt.bScale = HI_TRUE;
    }

    HIFB_GetUpdateRect(u32LayerId, pstCanvasBuf, &stBackBuf.UpdateRect);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOSDData(u32LayerId, &stOsdData);
    if ((pstPar->stRunInfo.bFliped) && (stOsdData.u32RegPhyAddr == pstPar->stDispInfo.u32DisplayAddr[1 - u32Index]))
    {
        HIFB_BackUpForeBuf(u32LayerId, &stBackBuf);
        HI_GFX_Memset(&(pstPar->stDispInfo.stUpdateRect), 0, sizeof(pstPar->stDispInfo.stUpdateRect));
        pstPar->stRunInfo.bFliped = HI_FALSE;
    }

    if ((pstPar->stDispInfo.stUpdateRect.w == 0) || (pstPar->stDispInfo.stUpdateRect.h == 0))
    {
        HI_GFX_Memcpy(&pstPar->stDispInfo.stUpdateRect, &stBackBuf.UpdateRect, sizeof(HIFB_RECT));
    }
    else
    {
        HIFB_UNITE_RECT(pstPar->stDispInfo.stUpdateRect, stBackBuf.UpdateRect);
    }

    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    if (stBlitOpt.bScale == HI_TRUE)
    {
        stBackBuf.UpdateRect.x = 0;
        stBackBuf.UpdateRect.y = 0;
        stBackBuf.UpdateRect.w = stBackBuf.stCanvas.u32Width;
        stBackBuf.UpdateRect.h = stBackBuf.stCanvas.u32Height;
    }
    else
    {
        stBackBuf.UpdateRect = pstCanvasBuf->UpdateRect;
    }

    stBlitOpt.bBlock = HI_FALSE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;

    pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(pstCanvasBuf, &stBackBuf, &stBlitOpt, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        goto FINISH_EXIT;
    }

    pstPar->stRunInfo.s32RefreshHandle = Ret;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    /***************************get create release fence fd ********************/
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    pstCanvasBuf->ReleaseFenceFd = DRV_HIFB_FENCE_Create();
    if (pstCanvasBuf->ReleaseFenceFd < 0)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstCanvasBuf->ReleaseFenceFd);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_FENCE_Create, pstCanvasBuf->ReleaseFenceFd);
        goto FINISH_EXIT;
    }
#endif
    /***************************end create release fence fd ********************/

FINISH_EXIT:
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_Flip_panbuf
* description  : CNcomment: 给android使用 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifdef CONFIG_HIFB_STEREO_SUPPORT
static HI_S32 DRV_HIFB_Flip_panbuf(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_ULONG StereoLockFlag = 0;
    HI_U32 u32TmpAddr = 0;
    HI_U32 u32TmpSize = 0;
    HIFB_RECT UpdateRect;
    HIFB_BLIT_OPT_S stBlitOpt;
    HIFB_BUFFER_S stCanvasBuf;
    HIFB_BUFFER_S stDisplayBuf;
    struct fb_var_screeninfo *var = NULL;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    var = &(info->var);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(var, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);
    UpdateRect = pstCanvasBuf->UpdateRect;

    if (   (UpdateRect.x >=  pstPar->stExtendInfo.DisplayWidth)
        || (UpdateRect.y >= pstPar->stExtendInfo.DisplayHeight)
        || (UpdateRect.w == 0) || (UpdateRect.h == 0))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, UpdateRect.x);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, UpdateRect.y);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, UpdateRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, UpdateRect.h);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayHeight);
        return HI_FAILURE;
    }

    DRV_HIFB_Lock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
    /** IsStereo and BegUpStereoInfo should in one lock**/
    if (HI_FALSE == pstPar->st3DInfo.IsStereo)
    {
        DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart)
    {
       DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
       HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
       return HI_SUCCESS;
    }
    pstPar->st3DInfo.BegUpStereoInfo = HI_TRUE;
    DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    stBlitOpt.bScale = HI_TRUE;

    if (HIFB_ANTIFLICKER_TDE == pstPar->stBaseInfo.enAntiflickerMode)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    stBlitOpt.bBlock = HI_TRUE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;

    /** get address **/
    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT | HIFB_PARA_CHECK_STRIDE | HIFB_PARA_CHECK_BITSPERPIXEL,
                                  var->xoffset, var->yoffset, info->fix.line_length, 0, var->bits_per_pixel);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, var->xoffset);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, var->yoffset);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.line_length);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, var->bits_per_pixel);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_PARA_CHECK_SUPPORT, Ret);
        return HI_FAILURE;
    }

    if (var->bits_per_pixel >= 8)
    {
        u32TmpSize = info->fix.line_length * var->yoffset + var->xoffset * (var->bits_per_pixel >> 3);
    }
    else
    {
        u32TmpSize = info->fix.line_length * var->yoffset + var->xoffset * var->bits_per_pixel / 8;
    }

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32TmpSize,info->fix.smem_len, HI_FAILURE);
    HI_GFX_CHECK_U64_ADDITION_REVERSAL_RETURN(info->fix.smem_start,u32TmpSize, HI_FAILURE);
    HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_RETURN(info->fix.smem_start + u32TmpSize, HI_FAILURE);
    u32TmpAddr = info->fix.smem_start + u32TmpSize;

    if ((var->bits_per_pixel == 24) && ((var->xoffset != 0)||(var->yoffset != 0)))
    {
        u32TmpSize = info->fix.line_length * var->yoffset + var->xoffset * (var->bits_per_pixel >> 3);

        HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(u32TmpSize,info->fix.smem_len, HI_FAILURE);
        HI_GFX_CHECK_U64_ADDITION_REVERSAL_RETURN(info->fix.smem_start,u32TmpSize, HI_FAILURE);
        HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_RETURN(info->fix.smem_start + u32TmpSize, HI_FAILURE);

        u32TmpAddr = (info->fix.smem_start + u32TmpSize)/16/3;
        u32TmpAddr = u32TmpAddr * 16 * 3;
    }

    /********************config pan buffer*******************/
    HI_GFX_Memset(&stCanvasBuf, 0, sizeof(stCanvasBuf));
    stCanvasBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
    stCanvasBuf.stCanvas.u32Pitch   = info->fix.line_length;
    stCanvasBuf.stCanvas.u32PhyAddr = u32TmpAddr;
    stCanvasBuf.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stCanvasBuf.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stCanvasBuf.UpdateRect          = UpdateRect;
    /***********************end**************************/

    /*******************config 3D buffer********************/
    HI_GFX_Memset(&stDisplayBuf, 0, sizeof(stDisplayBuf));
    stDisplayBuf.stCanvas.enFmt      = pstPar->st3DInfo.st3DSurface.enFmt;
    stDisplayBuf.stCanvas.u32Pitch   = pstPar->st3DInfo.st3DSurface.u32Pitch;
    stDisplayBuf.stCanvas.u32PhyAddr = pstPar->stRunInfo.CurScreenAddr;
    stDisplayBuf.stCanvas.u32Width   = pstPar->st3DInfo.st3DSurface.u32Width;
    stDisplayBuf.stCanvas.u32Height  = pstPar->st3DInfo.st3DSurface.u32Height;
    /***********************end**************************/

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  stDisplayBuf.stCanvas.u32Width, stDisplayBuf.stCanvas.u32Height, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stDisplayBuf.stCanvas.u32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stDisplayBuf.stCanvas.u32Height);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_PARA_CHECK_SUPPORT, Ret);
        return HI_FAILURE;
    }
    if (HIFB_STEREO_SIDEBYSIDE_HALF == pstPar->st3DInfo.StereoMode)
    {
        stDisplayBuf.stCanvas.u32Width >>= 1;
    }
    else if (HIFB_STEREO_TOPANDBOTTOM == pstPar->st3DInfo.StereoMode)
    {
        stDisplayBuf.stCanvas.u32Height >>= 1;
    }

    stDisplayBuf.UpdateRect.x = 0;
    stDisplayBuf.UpdateRect.y = 0;
    stDisplayBuf.UpdateRect.w = stDisplayBuf.stCanvas.u32Width;
    stDisplayBuf.UpdateRect.h = stDisplayBuf.stCanvas.u32Height;

    pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(&stCanvasBuf, &stDisplayBuf, &stBlitOpt, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        return HI_FAILURE;
    }

    /** can relese stereo memory **/
    pstPar->st3DInfo.BegUpStereoInfo = HI_FALSE;
    wake_up_interruptible(&pstPar->st3DInfo.WaiteFinishUpStereoInfoMutex);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_Flip_0buf_3D
* description  : CNcomment: 单buffer刷新 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_0buf_3D(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 BufferSize = 0;
    HI_ULONG StereoLockFlag = 0;
    HIFB_BLIT_OPT_S stBlitOpt;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);
    pstPar->st3DInfo.st3DSurface.enFmt     = pstCanvasBuf->stCanvas.enFmt;
    pstPar->st3DInfo.st3DSurface.u32Pitch  = pstCanvasBuf->stCanvas.u32Pitch;
    pstPar->st3DInfo.st3DSurface.u32Width  = pstCanvasBuf->stCanvas.u32Width;
    pstPar->st3DInfo.st3DSurface.u32Height = pstCanvasBuf->stCanvas .u32Height;

    BufferSize = HI_HIFB_GetMemSize(pstCanvasBuf->stCanvas.u32Pitch,pstCanvasBuf->stCanvas.u32Height);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(BufferSize, 0, HI_FAILURE);

    (HI_VOID)wait_event_interruptible_timeout(pstPar->st3DInfo.WaiteFinishFreeStereoMemMutex,
                                              (HI_FALSE == pstPar->st3DInfo.BegFreeStereoMem),
                                              CONFIG_HIFB_STEREO_WAITE_TIME);

    DRV_HIFB_Lock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
    /** IsStereo and BegUpStereoInfo should in one lock**/
    if (HI_FALSE == pstPar->st3DInfo.IsStereo)
    {
        DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }
    pstPar->st3DInfo.BegUpStereoInfo = HI_TRUE;
    DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);

    /**<--alloc stereo buffer >**/
    Ret = DRV_HIFB_ReAllocStereoBuf(u32LayerId, pstCanvasBuf->stCanvas.u32Pitch, BufferSize);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32LayerId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, BufferSize);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstCanvasBuf->stCanvas.u32Pitch);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ReAllocStereoBuf, Ret);
        return Ret;
    }

    /**<--config 3D surface par, user display buffer0 >**/
    pstPar->st3DInfo.st3DSurface.u32PhyAddr = pstPar->st3DInfo.u32DisplayAddr[0];

    /**<--config 3D buffer >**/
    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    stBlitOpt.bBlock = HI_FALSE;
    stBlitOpt.bScale = HI_TRUE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;

    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    Ret = DRV_HIFB_UpStereoData(u32LayerId, pstCanvasBuf, &stBlitOpt);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_UpStereoData, Ret);
        wake_up_interruptible(&pstPar->st3DInfo.WaiteFinishUpStereoInfoMutex);
        return HI_FAILURE;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
       pstPar->stRunInfo.CurScreenAddr = pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart;
       pstPar->stDispInfo.stUserBuffer.stCanvas.u32Pitch = pstCanvasBuf->stCanvas.u32Pitch;
       pstPar->stDispInfo.stUserBuffer.stCanvas.enFmt = pstCanvasBuf->stCanvas.enFmt;
       HIFB_SetDispSize(u32LayerId,pstCanvasBuf->stCanvas.u32Width,pstCanvasBuf->stCanvas.u32Height);

       pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
       pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
       pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FMT;
       pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
       pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    DRV_HIFB_WaitVBlank(u32LayerId);

    DRV_HIFB_Lock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
    /** can relese stereo memory **/
    pstPar->st3DInfo.BegUpStereoInfo = HI_FALSE;
    DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);

    wake_up_interruptible(&pstPar->st3DInfo.WaiteFinishUpStereoInfoMutex);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_Flip_1buf_3D
* description   : CNcomment: 双buffer刷新 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_1buf_3D(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_BLIT_OPT_S stBlitOpt;
    HIFB_OSD_DATA_S stOsdData;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride = 0;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOSDData(u32LayerId, &stOsdData);

    if ((stOsdData.u32RegPhyAddr != pstPar->stDispInfo.u32DisplayAddr[0]) && (pstPar->stDispInfo.u32DisplayAddr[0]))
    {
        pstPar->stRunInfo.bModifying = HI_TRUE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
        pstPar->stRunInfo.CurScreenAddr = pstPar->stDispInfo.u32DisplayAddr[0];

        HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info->screen_base,HI_FAILURE);
        HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(info->fix.smem_len, 0, HI_FAILURE);
        HI_GFX_Memset(info->screen_base, 0x0, info->fix.smem_len);

        pstPar->stRunInfo.bModifying = HI_FALSE;
    }

    u32Stride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(u32Stride, 0, HI_FAILURE);

    pstPar->st3DInfo.st3DSurface.enFmt     = pstPar->stExtendInfo.enColFmt;
    pstPar->st3DInfo.st3DSurface.u32Pitch  = u32Stride;
    pstPar->st3DInfo.st3DSurface.u32Width  = pstPar->stExtendInfo.DisplayWidth;
    pstPar->st3DInfo.st3DSurface.u32Height = pstPar->stExtendInfo.DisplayHeight;
    pstPar->st3DInfo.st3DSurface.u32PhyAddr= pstPar->st3DInfo.u32DisplayAddr[0];

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));

    stBlitOpt.bBlock = HI_FALSE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;
    stBlitOpt.bScale = HI_TRUE;
    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);
    Ret = DRV_HIFB_UpStereoData(u32LayerId, pstCanvasBuf, &stBlitOpt);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_UpStereoData, Ret);
        return HI_FAILURE;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_Flip_2buf_3D
* description   : CNcomment: 3 buffer刷新 异步，刷新不等更新完，允许丢帧 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_2buf_3D(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Index;
    unsigned long lockflag;
    HIFB_BUFFER_S stBackBuf;
    HIFB_BLIT_OPT_S stBlitOpt;
    HIFB_OSD_DATA_S stOsdData;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride   = 0;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/
    u32Index = pstPar->stRunInfo.u32IndexForInt;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE((1 - u32Index), CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    HI_GFX_Memset(&stBackBuf, 0, sizeof(stBackBuf));

    stBlitOpt.bCallBack = HI_TRUE;
    stBlitOpt.pfnCallBack = (IntCallBack)DRV_HIFB_BlitFinishCallBack;
    stBlitOpt.pParam = &(pstPar->stBaseInfo.u32LayerID);

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&lockflag);
    pstPar->stRunInfo.bNeedFlip        = HI_FALSE;
    pstPar->stRunInfo.s32RefreshHandle = 0;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&lockflag);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOSDData(u32LayerId, &stOsdData);

    u32Stride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(u32Stride, 0, HI_FAILURE);

    pstPar->st3DInfo.st3DSurface.enFmt      = pstPar->stExtendInfo.enColFmt;
    pstPar->st3DInfo.st3DSurface.u32Pitch   = u32Stride;
    pstPar->st3DInfo.st3DSurface.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    pstPar->st3DInfo.st3DSurface.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    pstPar->st3DInfo.st3DSurface.u32PhyAddr = pstPar->st3DInfo.u32DisplayAddr[u32Index];

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->st3DInfo.st3DSurface.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->st3DInfo.st3DSurface.u32Pitch);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->st3DInfo.st3DSurface.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->st3DInfo.st3DSurface.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->st3DInfo.st3DSurface.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32Index);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstPar->stRunInfo.u32IndexForInt);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");

    HI_GFX_Memcpy(&stBackBuf.stCanvas, &pstPar->st3DInfo.st3DSurface, sizeof(HIFB_SURFACE_S));

    HIFB_GetUpdateRect(u32LayerId, pstCanvasBuf, &stBackBuf.UpdateRect);

    if (pstPar->stRunInfo.bFliped && (stOsdData.u32RegPhyAddr == pstPar->st3DInfo.u32DisplayAddr[1 - u32Index]))
    {
        HIFB_BackUpForeBuf(u32LayerId, &stBackBuf);
        HI_GFX_Memset(&(pstPar->st3DInfo.st3DUpdateRect), 0, sizeof(HIFB_RECT));
        pstPar->stRunInfo.bFliped = HI_FALSE;
    }

    if ((pstPar->st3DInfo.st3DUpdateRect.w == 0) || (pstPar->st3DInfo.st3DUpdateRect.h == 0))
    {
        HI_GFX_Memcpy(&pstPar->st3DInfo.st3DUpdateRect, &stBackBuf.UpdateRect, sizeof(HIFB_RECT));
    }
    else
    {
        HIFB_UNITE_RECT(pstPar->st3DInfo.st3DUpdateRect, stBackBuf.UpdateRect);
    }

    stBlitOpt.bBlock = HI_FALSE;
    stBlitOpt.bScale = HI_TRUE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;
    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    Ret = DRV_HIFB_UpStereoData(u32LayerId, pstCanvasBuf, &stBlitOpt);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_UpStereoData, Ret);
        return HI_FAILURE;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_Flip_2buf_immediate_display_3D
* description : CNcomment: 3 buffer 同步，刷新等待更新完 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip_2buf_immediate_display_3D(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Index = 0;
    unsigned long lockflag;
    HIFB_BUFFER_S stBackBuf;
    HIFB_BLIT_OPT_S stBlitOpt;
    HI_U32 u32Stride = 0;
    HI_U32 CmpStride   = 0;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    u32Index = pstPar->stRunInfo.u32IndexForInt;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE((1 - u32Index), CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstCanvasBuf, HI_FAILURE);

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
    HI_GFX_Memset(&stBackBuf, 0, sizeof(stBackBuf));

    stBlitOpt.bCallBack = HI_FALSE;
    stBlitOpt.pParam = &(pstPar->stBaseInfo.u32LayerID);

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&lockflag);
    pstPar->stRunInfo.bNeedFlip        = HI_FALSE;
    pstPar->stRunInfo.s32RefreshHandle = 0;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&lockflag);

    u32Stride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(u32Stride, 0, HI_FAILURE);

    pstPar->st3DInfo.st3DSurface.enFmt     = pstPar->stExtendInfo.enColFmt;
    pstPar->st3DInfo.st3DSurface.u32Pitch  = u32Stride;
    pstPar->st3DInfo.st3DSurface.u32Width  = pstPar->stExtendInfo.DisplayWidth;
    pstPar->st3DInfo.st3DSurface.u32Height = pstPar->stExtendInfo.DisplayHeight;
    pstPar->st3DInfo.st3DSurface.u32PhyAddr= pstPar->st3DInfo.u32DisplayAddr[u32Index];

    HI_GFX_Memcpy(&stBackBuf.stCanvas, &pstPar->st3DInfo.st3DSurface, sizeof(HIFB_SURFACE_S));

    HIFB_GetUpdateRect(u32LayerId, pstCanvasBuf, &stBackBuf.UpdateRect);

    HIFB_BackUpForeBuf(u32LayerId, &stBackBuf);

    HI_GFX_Memcpy(&pstPar->st3DInfo.st3DUpdateRect, &stBackBuf.UpdateRect, sizeof(HIFB_RECT));

    stBlitOpt.bScale = HI_TRUE;
    stBlitOpt.bBlock = HI_TRUE;
    stBlitOpt.bRegionDeflicker = HI_TRUE;
    if (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
    {
        stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    }

    Ret = DRV_HIFB_UpStereoData(u32LayerId, pstCanvasBuf, &stBlitOpt);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_UpStereoData, Ret);
        return HI_FAILURE;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.CurScreenAddr = pstPar->st3DInfo.u32DisplayAddr[u32Index];
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    pstPar->stRunInfo.u32IndexForInt = 1 - u32Index;

    HI_GFX_Memcpy(&(pstPar->stDispInfo.stUserBuffer), pstCanvasBuf, sizeof(HIFB_BUFFER_S));

    DRV_HIFB_WaitVBlank(u32LayerId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_Flip
* description  : CNcomment: 刷新 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_Flip(HI_U32 u32LayerId, HIFB_BUFFER_S *pstCanvasBuf, HIFB_LAYER_BUF_E enBufMode)
{
    HI_S32 Ret = HI_FAILURE;
    struct fb_info *info = NULL;
    HIFB_PAR_S *par = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***************************beg check par **********************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    par = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);
    /***************************end check par **********************************/

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if (par->st3DInfo.IsStereo)
    {
        switch (enBufMode)
        {
            case HIFB_LAYER_BUF_DOUBLE:
            case HIFB_LAYER_BUF_FENCE:
                Ret = DRV_HIFB_Flip_2buf_3D(u32LayerId, pstCanvasBuf);
                break;
            case HIFB_LAYER_BUF_ONE:
                Ret = DRV_HIFB_Flip_1buf_3D(u32LayerId, pstCanvasBuf);
                break;
            case HIFB_LAYER_BUF_NONE:
               Ret = DRV_HIFB_Flip_0buf_3D(u32LayerId, pstCanvasBuf);
               break;
            case HIFB_LAYER_BUF_DOUBLE_IMMEDIATE:
                Ret = DRV_HIFB_Flip_2buf_immediate_display_3D(u32LayerId, pstCanvasBuf);
                break;
            default:
                break;
        }
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return Ret;
    }
#endif
    switch (enBufMode)
    {
        case HIFB_LAYER_BUF_DOUBLE:
            Ret = DRV_HIFB_Flip_2buf(u32LayerId, pstCanvasBuf);
            break;
        case HIFB_LAYER_BUF_ONE:
            Ret = DRV_HIFB_Flip_1buf(u32LayerId, pstCanvasBuf);
            break;
        case HIFB_LAYER_BUF_NONE:
           Ret = DRV_HIFB_Flip_0buf(u32LayerId, pstCanvasBuf);
           break;
        case HIFB_LAYER_BUF_DOUBLE_IMMEDIATE:
            Ret = DRV_HIFB_Flip_2buf_immediate_display(u32LayerId, pstCanvasBuf);
            break;
        case HIFB_LAYER_BUF_FENCE:
            Ret = DRV_HIFB_FlipWithFence(u32LayerId, pstCanvasBuf);
            break;
        default:
            break;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

/***************************************************************************
* func          : DRV_HIFB_Refresh
* description   : CNcomment: 图形层扩展刷新接口 CNend\n
* param[in]     : pFbInfo
* param[in]     : Args
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
****************************************************************************/
static HI_S32 DRV_HIFB_Refresh(HIFB_PAR_S* pstPar, HI_VOID __user *pArgp)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_BUFFER_S stCanvasBuf;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***************************beg check par **********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pArgp,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar,HI_FAILURE);
    /***************************end check par **********************************/

    if (copy_from_user(&stCanvasBuf, pArgp, sizeof(HIFB_BUFFER_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    /***************************beg pandisplay for stereo **********************/
    #ifdef CONFIG_HIFB_STEREO_SUPPORT
    if ( (HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode) &&
         ( (0 != pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart) && (HI_TRUE == pstPar->st3DInfo.IsStereo)) )
    {
        return DRV_HIFB_Flip_panbuf(pstPar->stBaseInfo.u32LayerID, &stCanvasBuf);
    }

    if (HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.enBufMode);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_REFRESH_MODE_WITH_PANDISPLAY);
        return HI_FAILURE;
    }
    #endif
    /***************************end pandisplay for stereo **********************/

    /***************************beg check par **********************************/
    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  stCanvasBuf.stCanvas.u32Width, stCanvasBuf.stCanvas.u32Height, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.u32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.u32Height);
        return HI_FAILURE;
    }

    if (stCanvasBuf.stCanvas.enFmt >= HIFB_FMT_BUTT)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.enFmt);
        return HI_FAILURE;
    }

    if (   (stCanvasBuf.UpdateRect.x >= stCanvasBuf.stCanvas.u32Width)
        || (stCanvasBuf.UpdateRect.y >= stCanvasBuf.stCanvas.u32Height)
        || (0 == stCanvasBuf.UpdateRect.w)
        || (0 == stCanvasBuf.UpdateRect.h))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.UpdateRect.x);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.UpdateRect.y);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.UpdateRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.UpdateRect.h);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.u32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.u32Height);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(stCanvasBuf.UpdateRect.w, stCanvasBuf.UpdateRect.x, HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(stCanvasBuf.UpdateRect.x,stCanvasBuf.stCanvas.u32Width,HI_FAILURE);
    if (stCanvasBuf.UpdateRect.x + stCanvasBuf.UpdateRect.w > stCanvasBuf.stCanvas.u32Width)
    {
        stCanvasBuf.UpdateRect.w = stCanvasBuf.stCanvas.u32Width - stCanvasBuf.UpdateRect.x;
    }

    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(stCanvasBuf.UpdateRect.h, stCanvasBuf.UpdateRect.y, HI_FAILURE);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(stCanvasBuf.UpdateRect.y,stCanvasBuf.stCanvas.u32Height,HI_FAILURE);
    if (stCanvasBuf.UpdateRect.y + stCanvasBuf.UpdateRect.h > stCanvasBuf.stCanvas.u32Height)
    {
        stCanvasBuf.UpdateRect.h =  stCanvasBuf.stCanvas.u32Height - stCanvasBuf.UpdateRect.y;
    }

    if (HIFB_LAYER_BUF_NONE == pstPar->stExtendInfo.enBufMode)
    {
        if ((stCanvasBuf.stCanvas.u32PhyAddr & 0xf) || (stCanvasBuf.stCanvas.u32Pitch & 0xf))
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.u32PhyAddr);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCanvasBuf.stCanvas.u32Pitch);
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO,  "address and stride are not 16 bytes align");
            return HI_FAILURE;
        }
    }
    /***************************end check par **********************************/

    Ret = DRV_HIFB_Flip(pstPar->stBaseInfo.u32LayerID, &stCanvasBuf, pstPar->stExtendInfo.enBufMode);

    /***************************beg get fence fd and buffer num ****************/
    if (HIFB_LAYER_BUF_FENCE == pstPar->stExtendInfo.enBufMode)
    {
        if (copy_to_user(pArgp, &stCanvasBuf, sizeof(HIFB_BUFFER_S)))
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
            return HI_FAILURE;
        }
    }
    /***************************end get fence fd and buffer num ****************/

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

static inline HI_S32 DRV_HIFB_CheckWhetherMemSizeEnough(struct fb_info *info, HIFB_LAYER_INFO_S *pstLayerInfo)
{
     HI_U32 Stride   = 0;
     HI_U32 CmpStride   = 0;
     HI_U32 IsInputDataSizeHasChanged = 0x0;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstLayerInfo, HI_FAILURE);
     IsInputDataSizeHasChanged = (pstLayerInfo->u32Mask & HIFB_LAYERMASK_DISPSIZE);

     if (!IsInputDataSizeHasChanged)
     {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
     }

     Stride = CONIFG_HIFB_GetMaxStride(pstLayerInfo->u32DisplayWidth, info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
     HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(Stride, 0, HI_FAILURE);

     if (pstLayerInfo->u32DisplayWidth == 0 || pstLayerInfo->u32DisplayHeight == 0)
     {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstLayerInfo->u32DisplayWidth);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstLayerInfo->u32DisplayHeight);
         return HI_FAILURE;
     }

     if (HI_FAILURE == HIFB_CheckMemEnough(info, Stride, pstLayerInfo->u32DisplayHeight))
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_CheckMemEnough, FAILURE_TAG);
         return HI_FAILURE;
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return HI_SUCCESS;
}

static inline HI_S32 DRV_HIFB_CheckWhetherLayerSizeSupport(struct fb_info *info, HIFB_LAYER_INFO_S *pstLayerInfo)
{
    HI_U32 LayerSize = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstLayerInfo, HI_FAILURE);
    if (HIFB_LAYERMASK_BUFMODE == (pstLayerInfo->u32Mask & HIFB_LAYERMASK_BUFMODE))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    LayerSize = HI_HIFB_GetMemSize(info->fix.line_length, info->var.yres);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(LayerSize, 0, HI_FAILURE);

    if (pstLayerInfo->BufMode == HIFB_LAYER_BUF_ONE)
    {
       LayerSize = 1 * LayerSize;
    }
    else if ((HIFB_LAYER_BUF_DOUBLE == pstLayerInfo->BufMode) || (HIFB_LAYER_BUF_DOUBLE_IMMEDIATE == pstLayerInfo->BufMode) || (HIFB_LAYER_BUF_FENCE == pstLayerInfo->BufMode))
    {
       HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(LayerSize,2,HI_FAILURE);
       LayerSize = 2 * LayerSize;
    }
    else
    {
       LayerSize = 0 * LayerSize;
    }

    if (LayerSize > info->fix.smem_len)
    {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerSize);
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.smem_len);
       return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


static inline HI_S32 DRV_HIFB_CheckWhetherLayerPosSupport(HIFB_LAYER_INFO_S *pstLayerInfo)
{
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstLayerInfo, HI_FAILURE);

    if ((pstLayerInfo->u32Mask & HIFB_LAYERMASK_POS) && ((pstLayerInfo->s32XPos < 0) || (pstLayerInfo->s32YPos < 0)))
    {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstLayerInfo->u32Mask);
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstLayerInfo->s32XPos);
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstLayerInfo->s32YPos);
       return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static inline HI_VOID DRV_HIFB_CheckWhetherDispSizeChange(struct fb_info *info, HIFB_LAYER_INFO_S *pstLayerInfo)
{
     HI_S32 Ret = HI_SUCCESS;
     HI_U32 IsInputDataSizeHasChanged = 0x0;
     HIFB_PAR_S *pstPar = NULL;

     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
     pstPar = (HIFB_PAR_S *)info->par;
     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstLayerInfo);
     IsInputDataSizeHasChanged = (pstLayerInfo->u32Mask & HIFB_LAYERMASK_DISPSIZE);
     if (!IsInputDataSizeHasChanged)
     {
        return;
     }

     if ((pstLayerInfo->u32DisplayWidth > info->var.xres_virtual) || (pstLayerInfo->u32DisplayHeight > info->var.yres_virtual))
     {
        return;
     }

     Ret = HIFB_SetDispSize(pstPar->stBaseInfo.u32LayerID, pstLayerInfo->u32DisplayWidth, pstLayerInfo->u32DisplayHeight);
     if (Ret == HI_SUCCESS)
     {
         info->var.xres = pstLayerInfo->u32DisplayWidth;
         info->var.yres = pstLayerInfo->u32DisplayHeight;
         DRV_HIFB_AssignDispBuf(pstPar->stBaseInfo.u32LayerID);
     }

     DRV_HIFB_FlipAll(info);

     return;
}

static HI_S32 DRV_HIFB_RefreshUserBuffer(HI_U32 u32LayerId)
{
    HIFB_BUFFER_S stCanvas;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *info = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***********************BEG CHECK PAR ******************************/
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32LayerId, HI_GFX_ARRAY_SIZE(s_stLayer), HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    /***********************END CHECK PAR ******************************/

    if (pstPar->stDispInfo.stUserBuffer.stCanvas.u32PhyAddr)
    {/**<-- has user buffer >**/
        HI_GFX_Memset(&stCanvas, 0x0, sizeof(stCanvas));
        stCanvas = pstPar->stDispInfo.stUserBuffer;
        stCanvas.UpdateRect.x = 0;
        stCanvas.UpdateRect.y = 0;
        stCanvas.UpdateRect.w = stCanvas.stCanvas.u32Width;
        stCanvas.UpdateRect.h = stCanvas.stCanvas.u32Height;

        DRV_HIFB_Flip(pstPar->stBaseInfo.u32LayerID, &stCanvas, pstPar->stExtendInfo.enBufMode);
    }
    else
    {/**<-- after open, change un stereo to stereo, now has not user buffer >**/
        pstPar->stRunInfo.bModifying = HI_TRUE;
        pstPar->stRunInfo.CurScreenAddr = info->fix.smem_start;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FMT;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
        pstPar->stRunInfo.bModifying = HI_FALSE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_FlipAll(struct fb_info *info)
{
    HIFB_PAR_S *par = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    par = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if (par->st3DInfo.IsStereo)
    {
        if (HIFB_REFRESH_MODE_WITH_PANDISPLAY == par->stExtendInfo.enBufMode)
        {
            DRV_HIFB_REFRESH_PanDisplay(&info->var, info);
        }

        if (HIFB_LAYER_BUF_NONE == par->stExtendInfo.enBufMode)
        {
            DRV_HIFB_RefreshUserBuffer(par->stBaseInfo.u32LayerID);
        }
    }
#endif

    if (HIFB_REFRESH_MODE_WITH_PANDISPLAY != par->stExtendInfo.enBufMode && HIFB_LAYER_BUF_NONE != par->stExtendInfo.enBufMode)
    {
        DRV_HIFB_RefreshUserBuffer(par->stBaseInfo.u32LayerID);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


#ifdef CONFIG_COMPAT
static HI_S32 DRV_HIFB_CompatIoctl(struct fb_info *info, HI_U32 cmd, unsigned long arg)
{
    struct fb_fix_screeninfo *fix = NULL;
    struct fb_fix_compat_screeninfo *fix32 = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 VirMemStart = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    fix = &(info->fix);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    if (FBIOGET_FSCREENINFO_HIFB == cmd)
    {
         if (0 == arg)
         {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, arg);
            return HI_FAILURE;
         }

         fix32 = compat_ptr(arg);
         HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(fix32, HI_FAILURE);

         HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_RETURN(fix->mmio_start, HI_FAILURE);
         VirMemStart = (HI_U32)(unsigned long)fix->mmio_start;

         if (copy_to_user(&fix32->id, &(fix->id), sizeof(fix32->id)))
         {
             return -EFAULT;
         }

         if (copy_to_user(fix32->reserved, fix->reserved, sizeof(fix->reserved)))
         {
             return -EFAULT;
         }

         if (put_user(pstPar->u32SmemStartPhy, &(fix32->smem_start)))
         {
             return -EFAULT;
         }

         if (put_user(fix->smem_len, &(fix32->smem_len)))
         {
             return -EFAULT;
         }

         if (put_user(fix->type, &(fix32->type)))
         {
             return -EFAULT;
         }

         if (put_user(fix->type_aux,  &(fix32->type_aux)))
         {
             return -EFAULT;
         }

         if (put_user(fix->visual, &(fix32->visual)))
         {
             return -EFAULT;
         }

         if (put_user(fix->xpanstep, &(fix32->xpanstep)))
         {
             return -EFAULT;
         }

         if (put_user(fix->ypanstep, &(fix32->ypanstep)))
         {
             return -EFAULT;
         }

         if (put_user(fix->ywrapstep, &(fix32->ywrapstep)))
         {
             return -EFAULT;
         }

         if (put_user(fix->line_length, &(fix32->line_length)))
         {
             return -EFAULT;
         }

         if (put_user(VirMemStart,  &(fix32->mmio_start)))
         {
             return -EFAULT;
         }

         if (put_user(fix->mmio_len,  &(fix32->mmio_len)))
         {
             return -EFAULT;
         }

         if (put_user(fix->accel, &(fix32->accel)))
         {
             return -EFAULT;
         }

         if (put_user(fix->capabilities,    &(fix32->capabilities)))
         {
             return -EFAULT;
         }
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return HI_SUCCESS;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return DRV_HIFB_Ioctl(info, cmd, arg);
}
#endif

static HI_S32 DRV_HIFB_Ioctl(struct fb_info *info, HI_U32 cmd, unsigned long arg)
{
    HI_S32 s32Cnt = 0;
    HI_U8 u8Cmd = _IOC_NR(cmd);
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info,-EFAULT);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar,-EFAULT);

    s32Cnt = atomic_read(&pstPar->stBaseInfo.ref_count);
    if (s32Cnt <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, atomic_read, s32Cnt);
        return -EINVAL;
    }

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_FAILURE);
    if (!gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bLayerSupported)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stBaseInfo.u32LayerID);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bLayerSupported);
        return HI_FAILURE;
    }

    if (FBIOGET_FSCREENINFO_HIFB == cmd)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return gs_DrvHifbCtlFunc[49].DrvHifbIoctlFunc(info, arg);
    }

    DRV_HIFB_CHECK_IOCTL_CMD(u8Cmd);
    DRV_HIFB_CHECK_IOCTL_NUM(gs_DrvHifbCtlNum[u8Cmd]);

    if (NULL == gs_DrvHifbCtlFunc[gs_DrvHifbCtlNum[u8Cmd]].DrvHifbIoctlFunc)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this cmd not support");
        return HI_FAILURE;
    }

    if (cmd != gs_DrvHifbCtlFunc[gs_DrvHifbCtlNum[u8Cmd]].Cmd)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this cmd not support");
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return gs_DrvHifbCtlFunc[gs_DrvHifbCtlNum[u8Cmd]].DrvHifbIoctlFunc(info,arg);
}


static HI_S32 DRV_HIFB_GetColorKey(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_COLORKEY_S ck;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    HI_GFX_Memset(&ck, 0x0, sizeof(ck));
    ck.bKeyEnable = pstPar->stExtendInfo.stCkey.bKeyEnable;
    ck.u32Key = pstPar->stExtendInfo.stCkey.u32Key;
    if (copy_to_user(argp, &ck, sizeof(HIFB_COLORKEY_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetColorKey(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_COLORKEY_S ckey;
    HI_U32 RLen = 0, GLen = 0, BLen = 0;
    HI_U32 ROffset = 0, GOffset = 0, BOffset = 0;
    HI_U8 RMask = 0, GMask = 0, BMask = 0;
    HI_U8 RKey = 0, GKey = 0, BKey = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&ckey, argp, sizeof(HIFB_COLORKEY_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    if (ckey.bKeyEnable && pstPar->stBaseInfo.bPreMul)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, ckey.bKeyEnable);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstPar->stBaseInfo.bPreMul);
        return HI_FAILURE;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stExtendInfo.stCkey.u32Key = ckey.u32Key;
    pstPar->stExtendInfo.stCkey.bKeyEnable = ckey.bKeyEnable;

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(info->var.bits_per_pixel, 0, HI_FAILURE);
    if (info->var.bits_per_pixel <= 8)
    {
        if (ckey.u32Key >= (1 << info->var.bits_per_pixel))
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, ckey.u32Key);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, info->var.bits_per_pixel);
            return HI_FAILURE;
        }
        pstPar->stExtendInfo.stCkey.u8BlueMax  = pstPar->stExtendInfo.stCkey.u8BlueMin  = info->cmap.blue[ckey.u32Key];
        pstPar->stExtendInfo.stCkey.u8GreenMax = pstPar->stExtendInfo.stCkey.u8GreenMin = info->cmap.green[ckey.u32Key];
        pstPar->stExtendInfo.stCkey.u8RedMax   = pstPar->stExtendInfo.stCkey.u8RedMin   = info->cmap.red[ckey.u32Key];
    }
    else
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_ColorConvert(&info->var, &pstPar->stExtendInfo.stCkey);

        HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(pstPar->stExtendInfo.enColFmt, HIFB_MAX_PIXFMT_NUM, HI_FAILURE);
        RLen = s_stArgbBitField[pstPar->stExtendInfo.enColFmt].stRed.length;
        GLen = s_stArgbBitField[pstPar->stExtendInfo.enColFmt].stGreen.length;
        BLen = s_stArgbBitField[pstPar->stExtendInfo.enColFmt].stBlue.length;

        RMask  = (0xff >> (8 - RLen));
        GMask  = (0xff >> (8 - GLen));
        BMask  = (0xff >> (8 - BLen));

        ROffset = s_stArgbBitField[pstPar->stExtendInfo.enColFmt].stRed.offset;
        GOffset = s_stArgbBitField[pstPar->stExtendInfo.enColFmt].stGreen.offset;
        BOffset = s_stArgbBitField[pstPar->stExtendInfo.enColFmt].stBlue.offset;

        if (HIFB_FMT_ABGR8888 != pstPar->stExtendInfo.enColFmt)
        {
            RKey = (pstPar->stExtendInfo.stCkey.u32Key >> (BLen + GLen)) & (RMask);
            GKey = (pstPar->stExtendInfo.stCkey.u32Key >> (BLen)) & (GMask);
            BKey = (pstPar->stExtendInfo.stCkey.u32Key) & (BMask);
        }
        else
        {
            RKey = (pstPar->stExtendInfo.stCkey.u32Key >> ROffset) & (RMask);
            GKey = (pstPar->stExtendInfo.stCkey.u32Key >> GOffset) & (GMask);
            BKey = (pstPar->stExtendInfo.stCkey.u32Key >> BOffset) & (BMask);
        }

        /** add low bit with 0 value **/
        pstPar->stExtendInfo.stCkey.u8RedMin   = RKey << (8 - RLen);
        pstPar->stExtendInfo.stCkey.u8GreenMin = GKey << (8 - GLen);
        pstPar->stExtendInfo.stCkey.u8BlueMin  = BKey << (8 - BLen);

        /** add low bit with 1 value **/
        pstPar->stExtendInfo.stCkey.u8RedMax   = pstPar->stExtendInfo.stCkey.u8RedMin   | (0xff >> RLen);
        pstPar->stExtendInfo.stCkey.u8GreenMax = pstPar->stExtendInfo.stCkey.u8GreenMin | (0xff >> GLen);
        pstPar->stExtendInfo.stCkey.u8BlueMax  = pstPar->stExtendInfo.stCkey.u8BlueMin  | (0xff >> BLen);
    }

    pstPar->stExtendInfo.stCkey.u8RedMask   = 0xff;
    pstPar->stExtendInfo.stCkey.u8BlueMask  = 0xff;
    pstPar->stExtendInfo.stCkey.u8GreenMask = 0xff;

    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_COLORKEY;
    pstPar->stRunInfo.bModifying          = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetLayerAlpha(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_to_user(argp, &pstPar->stExtendInfo.stAlpha, sizeof(HIFB_ALPHA_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetLayerAlpha(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_ALPHA_S stAlpha = {0};

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&(pstPar->stExtendInfo.stAlpha), argp, sizeof(HIFB_ALPHA_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->stExtendInfo.stAlpha.u8Alpha0);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->stExtendInfo.stAlpha.u8Alpha1);

    stAlpha = pstPar->stExtendInfo.stAlpha;
    if (!pstPar->stExtendInfo.stAlpha.bAlphaChannel)
    {
        stAlpha.u8GlobalAlpha |= 0xff;
        pstPar->stExtendInfo.stAlpha.u8GlobalAlpha |= 0xff;
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->stExtendInfo.stAlpha.u8Alpha0);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstPar->stExtendInfo.stAlpha.u8Alpha1);

    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_ALPHA;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetScreenOriginPos(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_to_user(argp, &pstPar->stExtendInfo.stPos, sizeof(HIFB_POINT_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetScreenOriginPos(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_POINT_S origin;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&origin, argp, sizeof(HIFB_POINT_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    if (pstPar->stBaseInfo.u32LayerID != HIFB_LAYER_HD_3)
    {
         if (origin.s32XPos < 0 || origin.s32YPos < 0)
         {
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, origin.s32XPos);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, origin.s32YPos);
             return HI_FAILURE;
         }
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stExtendInfo.stPos.s32XPos = origin.s32XPos;
    pstPar->stExtendInfo.stPos.s32YPos = origin.s32YPos;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "=========================================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstPar->stExtendInfo.stPos.s32XPos);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstPar->stExtendInfo.stPos.s32YPos);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "=========================================================");

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetDeFlicker(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    return HI_FAILURE;
}

static HI_S32 DRV_HIFB_SetDeFlicker(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    return HI_FAILURE;
}

static HI_S32 DRV_HIFB_GetVblank(struct fb_info *info, HI_ULONG arg)
{
    HI_S32 Ret = HI_FAILURE;
    HIFB_PAR_S *pstPar = NULL;
    HI_UNUSED(arg);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if (NULL == info) { return HI_FAILURE; }
    pstPar = (HIFB_PAR_S *)info->par;
    if (NULL == pstPar) { return HI_FAILURE; }

    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_WaitVBlank(pstPar->stBaseInfo.u32LayerID);
    if (Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_WaitVBlank, Ret);
        return -EPERM;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_ShowLayer(struct fb_info *info, HI_ULONG arg)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HI_BOOL bShow = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    Ret = copy_from_user(&bShow, argp, sizeof(HI_BOOL));
    if (Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Ret);
        return -EFAULT;
    }

    /* reset the same status */
    if (bShow == pstPar->stExtendInfo.bShow)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
        return 0;
    }

    pstPar->stRunInfo.bModifying          = HI_TRUE;
    pstPar->stExtendInfo.bShow            = bShow;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_SHOW;
    pstPar->stRunInfo.bModifying          = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetLayerShowState(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_to_user(argp, &pstPar->stExtendInfo.bShow, sizeof(HI_BOOL)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetCapablity(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (pstPar->stBaseInfo.u32LayerID >= HIFB_LAYER_ID_BUTT) { return HI_FAILURE; }

    if (copy_to_user(argp, (HI_VOID *)&gs_pstCapacity[pstPar->stBaseInfo.u32LayerID], sizeof(HIFB_CAPABILITY_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetDecompress(struct fb_info *info, HI_ULONG arg)
{
#ifdef CFG_HI_FB_DECOMPRESS_SUPPORT
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HI_BOOL bDeComp = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&bDeComp, argp, sizeof(HI_BOOL)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetDeCmpSwitch(pstPar->stBaseInfo.u32LayerID, bDeComp);

    pstPar->bDeCompress = bDeComp;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
#endif

    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetLayerInfo(struct fb_info *info, HI_ULONG arg)
{
    HI_S32 Ret   = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_LAYER_INFO_S stLayerInfo;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&stLayerInfo, argp, sizeof(HIFB_LAYER_INFO_S)))
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
       return -EFAULT;
    }

    Ret = HIFB_SetCanvasBufInfo(info, &stLayerInfo);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_SetCanvasBufInfo, Ret);
        return HI_FAILURE;
    }

    Ret = DRV_HIFB_CheckWhetherMemSizeEnough(info,&stLayerInfo);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_CheckWhetherMemSizeEnough, Ret);
        return HI_FAILURE;
    }

#ifdef CONFIG_HIFB_STEREO_SUPPORT
     if((stLayerInfo.u32Mask & HIFB_LAYERMASK_DISPSIZE) && pstPar->st3DInfo.IsStereo)
     {
        DRV_HIFB_ClearUnUsedStereoBuf(info);
     }
#endif

    Ret = DRV_HIFB_CheckWhetherLayerSizeSupport(info, &stLayerInfo);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_CheckWhetherLayerSizeSupport, Ret);
        return HI_FAILURE;
    }

    Ret = DRV_HIFB_CheckWhetherLayerPosSupport(&stLayerInfo);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_CheckWhetherLayerPosSupport, Ret);
        return HI_FAILURE;
    }

    if ((stLayerInfo.u32Mask & HIFB_LAYERMASK_BMUL) && pstPar->stExtendInfo.stCkey.bKeyEnable)
    {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stLayerInfo.u32Mask);
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstPar->stExtendInfo.stCkey.bKeyEnable);
       return HI_FAILURE;
    }

    pstPar->stRunInfo.bModifying = HI_TRUE;

    if (stLayerInfo.u32Mask & HIFB_LAYERMASK_BMUL)
    {
        pstPar->stBaseInfo.bPreMul = stLayerInfo.bPreMul;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_BMUL;
    }

    if (stLayerInfo.u32Mask & HIFB_LAYERMASK_BUFMODE)
    {
        HIFB_SetBufMode(pstPar->stBaseInfo.u32LayerID, stLayerInfo.BufMode);
    }

    if (stLayerInfo.u32Mask & HIFB_LAYERMASK_POS)
    {
        HIFB_SetDispLayerPos(pstPar->stBaseInfo.u32LayerID, stLayerInfo.s32XPos, stLayerInfo.s32YPos);
    }

    if (stLayerInfo.u32Mask & HIFB_LAYERMASK_ANTIFLICKER_MODE)
    {
        DRV_HIFB_SetAntiflickerLevel(pstPar->stBaseInfo.u32LayerID, stLayerInfo.eAntiflickerLevel);
    }

    DRV_HIFB_CheckWhetherDispSizeChange(info,&stLayerInfo);

    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

static HI_S32 DRV_HIFB_GetLayerInfo(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_LAYER_INFO_S stLayerInfo = {0};

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    DRV_HIFB_WaitVBlank(pstPar->stBaseInfo.u32LayerID);

    stLayerInfo.bPreMul           = pstPar->stBaseInfo.bPreMul;
    stLayerInfo.BufMode           = pstPar->stExtendInfo.enBufMode;
    stLayerInfo.eAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
    stLayerInfo.s32XPos           = pstPar->stExtendInfo.stPos.s32XPos;
    stLayerInfo.s32YPos           = pstPar->stExtendInfo.stPos.s32YPos;
    stLayerInfo.u32DisplayWidth   = pstPar->stExtendInfo.DisplayWidth;
    stLayerInfo.u32DisplayHeight  = pstPar->stExtendInfo.DisplayHeight;
    stLayerInfo.u32ScreenWidth    = pstPar->stExtendInfo.DisplayWidth;
    stLayerInfo.u32ScreenHeight   = pstPar->stExtendInfo.DisplayHeight;

    if (copy_to_user(argp, &stLayerInfo, sizeof(HIFB_LAYER_INFO_S)))
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
       return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetCanvasBuffer(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_to_user(argp, &(pstPar->stDispInfo.stCanvasSur), sizeof(HIFB_SURFACE_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************
* func          : DRV_HIFB_RefreshLayer
* description   : CNcomment: 图形层扩展刷新接口 CNend\n
* param[in]     : pFbInfo
* param[in]     : Args
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
****************************************************************************/
static HI_S32 DRV_HIFB_RefreshLayer(struct fb_info *pFbInfo, HI_ULONG Args)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 NowTimeMs = 0;
    HI_U32 EndTimeMs = 0;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_TINIT();
    HI_VOID __user *pArgp = (HI_VOID __user *)Args;

    /***************************beg check par **********************************/
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(pFbInfo, pArgp);
    /***************************end check par **********************************/

    /***************************beg count times ********************************/
    HI_GFX_TSTART(NowTimeMs);
    pstPar->stFrameInfo.TwiceRefreshTimeMs = NowTimeMs - pstPar->stFrameInfo.PreRefreshTimeMs;
    pstPar->stFrameInfo.PreRefreshTimeMs   = NowTimeMs;
    /***************************end count times ********************************/

    Ret = DRV_HIFB_Refresh(pstPar, pArgp);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_Refresh, Ret);
        return HI_FAILURE;
    }

    /***************************beg count draw fps *****************************/
    pstPar->stFrameInfo.RefreshFrame++;
    /***************************end count draw fps *****************************/

    /***************************beg count run refresh times ********************/
    HI_GFX_TEND(EndTimeMs);
    pstPar->stFrameInfo.RunRefreshTimeMs = EndTimeMs - NowTimeMs;
    /***************************end count run refresh times ********************/

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_WaiteRefreshFinish(struct fb_info *info, HI_ULONG arg)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;
    HI_UNUSED(arg);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if (NULL == info) { return HI_FAILURE; }
    pstPar = (HIFB_PAR_S *)info->par;
    if (NULL == pstPar) { return HI_FAILURE; }

    if ((pstPar->stRunInfo.s32RefreshHandle) && (pstPar->stExtendInfo.enBufMode != HIFB_LAYER_BUF_ONE))
    {
        Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitForDone(pstPar->stRunInfo.s32RefreshHandle, 1000);
    }

    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_WaitForDone, Ret);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetSteroFraming(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_FAILURE;
}

static HI_S32 DRV_HIFB_GetSteroFraming(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_FAILURE;
}

static HI_S32 DRV_HIFB_SetSteroMode(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetSteroMode(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetScreenSize(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetScreenSize(struct fb_info *info, HI_ULONG arg)
{
    HIFB_SIZE_S stScreenSize = {0};
    HIFB_RECT stOutputRect = {0};
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOutRect(pstPar->stBaseInfo.u32LayerID, &stOutputRect);

    stScreenSize.u32Width = stOutputRect.w;
    stScreenSize.u32Height = stOutputRect.h;
    if (copy_to_user(argp, &stScreenSize, sizeof(HIFB_SIZE_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetCompress(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetCompress(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_ScrolltextCreate(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_SCROLLTEXT_CREATE_S stScrollText;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    HI_GFX_Memset(&stScrollText, 0x0, sizeof(stScrollText));
    if (copy_from_user(&stScrollText, argp, sizeof(HIFB_SCROLLTEXT_CREATE_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    if (stScrollText.stAttr.ePixelFmt >= HIFB_FMT_BUTT)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stScrollText.stAttr.ePixelFmt);
        return HI_FAILURE;
    }

    if (stScrollText.stAttr.stRect.w < 0 || stScrollText.stAttr.stRect.h < 0)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stScrollText.stAttr.stRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stScrollText.stAttr.stRect.h);
        return HI_FAILURE;
    }

    Ret = DRV_HIFB_SCROLLTEXT_Create(pstPar->stBaseInfo.u32LayerID, &stScrollText);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_Create, Ret);
        return -EFAULT;
    }

    if (copy_to_user(argp, &stScrollText, sizeof(HIFB_SCROLLTEXT_CREATE_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support scrolltext");
    return HI_FAILURE;
#endif
}

static HI_S32 DRV_HIFB_ScrolltextFill(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_S32 Ret = HI_SUCCESS;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_SCROLLTEXT_DATA_S stScrollTextData;
    HIFB_SCROLLTEXT_DATA_64BITS_S stScrollText64BitsData;

    HI_UNUSED(info);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if (NULL == argp) { return HI_FAILURE; }

    HI_GFX_Memset(&stScrollTextData, 0x0, sizeof(stScrollTextData));
    HI_GFX_Memset(&stScrollText64BitsData, 0x0, sizeof(stScrollText64BitsData));
    if (copy_from_user(&stScrollText64BitsData, argp, sizeof(HIFB_SCROLLTEXT_DATA_64BITS_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    stScrollTextData.u32Handle  = stScrollText64BitsData.u32Handle;
    stScrollTextData.u32PhyAddr = stScrollText64BitsData.u32PhyAddr;
    stScrollTextData.pu8VirAddr = (HI_U8*)(unsigned long)stScrollText64BitsData.u64VirAddr;
    stScrollTextData.u32Stride  = stScrollText64BitsData.u32Stride;

    if ((0 == stScrollTextData.u32PhyAddr) && (NULL == stScrollTextData.pu8VirAddr))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextData.u32PhyAddr);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, stScrollTextData.pu8VirAddr);
        return -EFAULT;
    }

    Ret = DRV_HIFB_SCROLLTEXT_FillText(&stScrollTextData);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_FillText, Ret);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support scrolltext");
    return HI_FAILURE;
#endif
}

static HI_S32 DRV_HIFB_ScrolltextPause(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_S32 Ret = HI_SUCCESS;

    HI_UNUSED(info);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    Ret = DRV_HIFB_SCROLLTEXT_Enable(HI_TRUE, arg);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_Enable, Ret);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support scrolltext");
    return HI_FAILURE;
#endif
}

static HI_S32 DRV_HIFB_ScrolltextResume(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_S32 Ret = HI_SUCCESS;

    HI_UNUSED(info);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    Ret = DRV_HIFB_SCROLLTEXT_Enable(HI_FALSE, arg);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_Enable, Ret);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support scrolltext");
    return HI_FAILURE;
#endif
}

#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
static inline HI_S32 DRV_HIFB_SCROLLTEXT_Enable(HI_BOOL bEnable, HI_ULONG arg)
{
     HI_S32 Ret = HI_SUCCESS;
     HI_U32 u32LayerId = HIFB_LAYER_ID_BUTT;
     HI_U32 u32ScrollTextID = SCROLLTEXT_NUM;
     HI_U32 u32Handle;
     HIFB_SCROLLTEXT_S *pstScrollText = NULL;
     HI_VOID __user *argp = (HI_VOID __user *)arg;

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
     if (NULL == argp) { return HI_FAILURE; }

     if (copy_from_user(&u32Handle, argp, sizeof(HI_U32)))
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
         return HI_FAILURE;
     }

     Ret = DRV_HIFB_SCROLLTEXT_GetHandle(u32Handle,&u32LayerId,&u32ScrollTextID);
     if (HI_SUCCESS != Ret)
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_GetHandle, Ret);
         return HI_FAILURE;
     }

     HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
     HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32ScrollTextID, SCROLLTEXT_NUM, HI_FAILURE);
     pstScrollText = &(s_stTextLayer[u32LayerId].stScrollText[u32ScrollTextID]);

     pstScrollText->bPause = bEnable;

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
     return HI_SUCCESS;
}
#endif

static HI_S32 DRV_HIFB_ScrolltextDestory(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_S32 Ret = HI_SUCCESS;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HI_U32 u32LayerId = HIFB_LAYER_ID_BUTT;
    HI_U32 u32ScrollTextID = SCROLLTEXT_NUM;
    HI_U32 u32Handle;

    HI_UNUSED(info);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if (NULL == argp) { return HI_FAILURE; }

    if (copy_from_user(&u32Handle, argp, sizeof(HI_U32)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = DRV_HIFB_SCROLLTEXT_GetHandle(u32Handle,&u32LayerId,&u32ScrollTextID);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_GetHandle, Ret);
        return -EFAULT;
    }

    Ret = DRV_HIFB_SCROLLTEXT_Destory(u32LayerId,u32ScrollTextID);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_Destory, Ret);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support scrolltext");
    return HI_FAILURE;
#endif
}

static HI_S32 DRV_HIFB_SetSteroDepth(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_STEREO_SUPPORT
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HI_S32 s32StereoDepth = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&s32StereoDepth, argp, sizeof(HI_S32)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    if (!pstPar->st3DInfo.IsStereo)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstPar->st3DInfo.IsStereo);
        return HI_FAILURE;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetStereoDepth(pstPar->stBaseInfo.u32LayerID, s32StereoDepth);

    pstPar->st3DInfo.s32StereoDepth = s32StereoDepth;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
#endif

    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetSteroDepth(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_STEREO_SUPPORT
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (!pstPar->st3DInfo.IsStereo)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "u need to set disp stereo mode first");
        return HI_FAILURE;
    }

    if (copy_to_user(argp, &(pstPar->st3DInfo.s32StereoDepth), sizeof(HI_S32)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
#endif

    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetLayerZorder(struct fb_info *info, HI_ULONG arg)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_ZORDER_E enZorder;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&enZorder, argp, sizeof(HIFB_ZORDER_E)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerPriority(pstPar->stBaseInfo.u32LayerID, enZorder);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetLayerPriority, Ret);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetLayerZorder(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HI_U32 u32Zorder = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerPriority(pstPar->stBaseInfo.u32LayerID, &u32Zorder);
    if (copy_to_user(argp, &(u32Zorder), sizeof(HI_U32)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_ReleaseLogo(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_UNUSED(arg);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if (NULL == info) { return HI_FAILURE; }
    pstPar = (HIFB_PAR_S *)info->par;
    if (NULL == pstPar) { return HI_FAILURE; }

    if (0 == pstPar->stBaseInfo.u32LayerID)
    {
       DRV_HIFB_LOGO_Close(pstPar->stBaseInfo.u32LayerID);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_SetCompressionMode(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetCompressionMode(struct fb_info *info, HI_ULONG arg)
{
    HI_UNUSED(info);
    HI_UNUSED(arg);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_FenceRefresh(struct fb_info *info, HI_ULONG arg)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 NowTimeMs = 0;
    HI_U32 EndTimeMs = 0;
#ifndef CONFIG_GFX_CANVASE_TO_LAYER_SUPPORT
    HI_U32 UnCmpStride = 0, CmpStride = 0;
#endif
    HIFB_PAR_S *pstPar = NULL;
    HIFB_HWC_LAYERINFO_S stLayerInfo;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_TINIT();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (0 != pstPar->stBaseInfo.u32LayerID)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stBaseInfo.u32LayerID);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this layer id not support fence refresh");
        return HI_FAILURE;
    }

    /***************************beg count times **********************************/
    HI_GFX_TSTART(NowTimeMs);
    pstPar->stFrameInfo.TwiceRefreshTimeMs = NowTimeMs - pstPar->stFrameInfo.PreRefreshTimeMs;
    pstPar->stFrameInfo.PreRefreshTimeMs = NowTimeMs;
    /***************************end count times **********************************/

    /***************************beg discard times ********************************/
    if ((0 != pstPar->DiscardFrameTimes) && (pstPar->DiscardFrameTimes < 10))
    {/** if suspend should not refresh black ui, and can soon resume **/
        pstPar->DiscardFrameTimes--;
        return HI_SUCCESS;
    }
    /***************************end discard times ********************************/

    /***************************beg check whether support ************************/
#if 0
    if (NULL != current)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, current->pid);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_STR, current->comm);/** pid name is current->comm **/
    }
#endif
    if (copy_from_user(&stLayerInfo, argp, sizeof(HIFB_HWC_LAYERINFO_S)))
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
       return HI_FAILURE;
    }

#ifndef CONFIG_GFX_CANVASE_TO_LAYER_SUPPORT
    if (   (stLayerInfo.u32LayerAddr != info->fix.smem_start)
        && (stLayerInfo.u32LayerAddr != info->fix.smem_start + info->fix.line_length * pstPar->stExtendInfo.DisplayHeight)
        && (stLayerInfo.u32LayerAddr != info->fix.smem_start + info->fix.line_length * pstPar->stExtendInfo.DisplayHeight * 2))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, stLayerInfo.u32LayerAddr);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, info->fix.smem_start);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, info->fix.smem_start + info->fix.line_length * pstPar->stExtendInfo.DisplayHeight);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, info->fix.smem_start + info->fix.line_length * pstPar->stExtendInfo.DisplayHeight * 2);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "input disp ddr is not alloc by fb");
        return HI_FAILURE;
    }

    UnCmpStride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth, 32, &CmpStride, CONFIG_HIFB_DECOMPRESS_DATA_STRIDE_ALIGN);
#ifndef CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE
    if ((HI_TRUE == stLayerInfo.bDeCompress) && (CmpStride != stLayerInfo.u32Stride))
#else
    if ((HI_TRUE == stLayerInfo.bDeCompress) && (CmpStride != stLayerInfo.u32Stride))
#endif
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CmpStride);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stLayerInfo.u32Stride);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "input stride is not frome fb, input error");
        return HI_FAILURE;
    }

    if ((HI_FALSE == stLayerInfo.bDeCompress) && (UnCmpStride != stLayerInfo.u32Stride))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, UnCmpStride);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stLayerInfo.bDeCompress);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stLayerInfo.u32Stride);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "input stride is not frome fb, input error");
        return HI_FAILURE;
    }

    if (HIFB_FMT_ARGB8888 != stLayerInfo.eFmt)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stLayerInfo.eFmt);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_FMT_ARGB8888);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "input fmt is not frome fb, input error");
        return HI_FAILURE;
    }
#endif
    /***************************end check whether support ************************/

    /*************************** beg check whether has repeat frame **************/
    if (stLayerInfo.u32LayerAddr == pstPar->stRunInfo.PreRefreshAddr)
    {
        pstPar->stFrameInfo.RepeatFrameCnt++;
    }
    pstPar->stRunInfo.PreRefreshAddr = stLayerInfo.u32LayerAddr;
    /*************************** end check whether has repeat frame **************/

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    Ret = DRV_HIFB_REFRESH_FenceFlip(pstPar, argp);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_REFRESH_FenceFlip, Ret);
        return HI_FAILURE;
    }
#else
    Ret = DRV_HIFB_REFRESH_NoFenceFlip(pstPar, argp);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_REFRESH_NoFenceFlip, Ret);
        return HI_FAILURE;
    }
#endif

    pstPar->stFrameInfo.RefreshFrame++;
    pstPar->hifb_sync = HI_TRUE;

    /***************************beg count times **********************************/
    HI_GFX_TEND(EndTimeMs);
    pstPar->stFrameInfo.RunRefreshTimeMs = EndTimeMs - NowTimeMs;
    /***************************end count times **********************************/

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetSmemStartPhy(struct fb_info *info, HI_ULONG arg)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_to_user(argp, &(pstPar->u32SmemStartPhy), sizeof(HI_U32)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_FixScreenInfo(struct fb_info *info, HI_ULONG arg)
{
    struct fb_fix_screeninfo fix;
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    HI_GFX_Memcpy(&fix, &(info->fix), sizeof(fix));
#ifdef CONFIG_GFX_MMU_SUPPORT
    fix.smem_start = pstPar->u32SmemStartPhy;
#endif
    if (copy_to_user(argp, &fix, sizeof(fix)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_HwcGetLayerInfo(struct fb_info *info, HI_ULONG arg)
{
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 Stride = 0;
    HI_U32 CmpStride = 0;
    HI_VOID __user *argp = (HI_VOID __user *)arg;
    HIFB_HWC_LAYERINFO_S stLayerInfo = {0};
    HI_U32 BitsPerPixel = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    if (copy_from_user(&stLayerInfo, argp, sizeof(HIFB_HWC_LAYERINFO_S)))
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
       return -EFAULT;
    }

    if ((HIFB_FMT_ABGR8888 == stLayerInfo.eFmt) || (HIFB_FMT_ARGB8888 == stLayerInfo.eFmt) || (HIFB_FMT_RGBA8888 == stLayerInfo.eFmt))
    {
        BitsPerPixel = 32;
    }
    else if ((HIFB_FMT_RGB888 == stLayerInfo.eFmt) || (HIFB_FMT_BGR888 == stLayerInfo.eFmt))
    {
        BitsPerPixel = 24;
    }
    else if ((HIFB_FMT_ABGR1555 == stLayerInfo.eFmt) || (HIFB_FMT_ARGB1555 == stLayerInfo.eFmt) || (HIFB_FMT_RGBA5551 == stLayerInfo.eFmt))
    {
        BitsPerPixel = 16;
    }
    else
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stLayerInfo.eFmt);
        return -EFAULT;
    }

    Stride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth,BitsPerPixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    stLayerInfo.u32NoCmpStride = Stride;
    stLayerInfo.u32Stride = CmpStride;

    if (copy_to_user(argp, &stLayerInfo, sizeof(stLayerInfo)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
#else
    HI_UNUSED(info);
    HI_UNUSED(arg);
#endif

    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetCurDispBuffer(struct fb_info *info, HI_ULONG arg)
{
    HI_U32 CurDispPhy = 0;
    HIFB_PAR_S *pstPar = NULL;
    HI_VOID __user *argp = (HI_VOID __user *)arg;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO_WITH_ARGP(info, argp);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerAddr(pstPar->stBaseInfo.u32LayerID, &CurDispPhy);
    if (copy_to_user(argp, &CurDispPhy, sizeof(HI_U32)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

#ifdef CONFIG_HIFB_STEREO_SUPPORT
/***************************************************************************
* func          : DRV_HIFB_StereoCallBack
* description   : NA
                  CNcomment: 使用工作队列方式 CNend\n
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
****************************************************************************/
static HI_S32 DRV_HIFB_StereoCallBack(HI_VOID * pParaml,HI_VOID * pParamr)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 LayerId = 0,BufferSize = 0,CompressStride = 0, UnCompressStride = 0;
    HIFB_PAR_S *pstPar = NULL;
    HI_ULONG StereoLockFlag = 0;
    struct fb_info *info = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pParamr, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pParaml, HI_FAILURE);

    LayerId = *((HI_U32*)pParaml);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(LayerId, HI_FAILURE);
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);

    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    pstPar->st3DInfo.StereoMode = *((HIFB_STEREO_MODE_E*)pParamr);

    if (HIFB_STEREO_MONO == pstPar->st3DInfo.StereoMode)
    {
        pstPar->st3DInfo.BegFreeStereoMem = HI_TRUE;
        DRV_HIFB_FreeStereoBuf(pstPar);
        pstPar->st3DInfo.BegFreeStereoMem = HI_FALSE;
        wake_up_interruptible(&pstPar->st3DInfo.WaiteFinishFreeStereoMemMutex);
    }
    else
    {
        if (HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode)
        {
            UnCompressStride = CONIFG_HIFB_GetMaxStride(info->var.xres,info->var.bits_per_pixel,&CompressStride,CONFIG_HIFB_STRIDE_16ALIGN);
            HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(UnCompressStride, 0, HI_FAILURE);

            /**<-- one buffer need size >**/
            BufferSize = HI_HIFB_GetMemSize(UnCompressStride,info->var.yres) / 2;
            HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(BufferSize, 0, HI_FAILURE);

            /**<-- generally need two buffer >**/
            HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(BufferSize,pstPar->stRunInfo.StereoBufNum,HI_FAILURE);
            BufferSize *= pstPar->stRunInfo.StereoBufNum;
            Ret = DRV_HIFB_ReAllocStereoBuf(pstPar->stBaseInfo.u32LayerID, UnCompressStride, BufferSize);
            if (HI_SUCCESS != Ret) { return HI_FAILURE; }

            pstPar->st3DInfo.st3DSurface.u32Pitch = UnCompressStride;
        }
        DRV_HIFB_Lock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
        pstPar->st3DInfo.IsStereo = HI_TRUE;
        DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
    }

    if (   (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart)
        && (pstPar->st3DInfo.StereoMode == HIFB_STEREO_SIDEBYSIDE_HALF || pstPar->st3DInfo.StereoMode == HIFB_STEREO_TOPANDBOTTOM)
        && (HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode))
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimMode(pstPar->stBaseInfo.u32LayerID, pstPar->st3DInfo.StereoMode, HIFB_STEREO_MONO);
    }
    else
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimMode(pstPar->stBaseInfo.u32LayerID, pstPar->st3DInfo.StereoMode, pstPar->st3DInfo.StereoMode);
    }

    DRV_HIFB_AssignDispBuf(pstPar->stBaseInfo.u32LayerID);
    DRV_HIFB_ClearUnUsedStereoBuf(info);

    if (HIFB_REFRESH_MODE_WITH_PANDISPLAY == pstPar->stExtendInfo.enBufMode)
    {
        DRV_HIFB_REFRESH_PanDisplay(&info->var, info);
    }
    else
    {
        DRV_HIFB_RefreshUserBuffer(pstPar->stBaseInfo.u32LayerID);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);

    return HI_SUCCESS;
}
#endif

#ifdef CONFIG_GFX_MMU_SUPPORT
extern phys_addr_t hisi_iommu_domain_iova_to_phys(unsigned long iova);
extern struct sg_table *get_meminfo(u32 addr, u32 iommu, u32 *size, u32 *base);

static inline int hifb_valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return (pfn + (size >> PAGE_SHIFT)) <= (1 + (PHYS_MASK >> PAGE_SHIFT));
}

/***************************************************************************
* func          : HI_GFX_MapToUser
* description   :
                  CNcomment: 将内核态的内存映射到用户态使用 CNend\n
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
****************************************************************************/
static inline HI_S32 hifb_smmu_map_to_user(HI_U32 u32PhyAddr,struct vm_area_struct *vma)
{
    HI_U32 Size = 0;
    HI_U32 u32Cnt  = 0;
    HI_U32 u32Len  = 0;
    HI_U32 pfn     = 0;
    HI_U32 BaseAddr = 0;
    struct sg_table  *pTable = NULL;
    struct scatterlist *sg   = NULL;
    struct page *page        = NULL;
    unsigned long addr = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if ((0 == u32PhyAddr) || (NULL == vma))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32PhyAddr);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, vma);
        return HI_FAILURE;
    }

    pTable = get_meminfo(u32PhyAddr, 1, &Size, &BaseAddr);
    HI_UNUSED(BaseAddr);
    if (!pTable)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, get_meminfo, FAILURE_TAG);
        return HI_FAILURE;
    }

    if (Size != (vma->vm_end - vma->vm_start))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Size);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, vma->vm_end);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, vma->vm_start);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, vma->vm_end - vma->vm_start);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, u32PhyAddr);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, BaseAddr);
        return -EINVAL;
    }

    /**<--check valid_mmap_phys_addr_range() >**/
    if (!hifb_valid_mmap_phys_addr_range(vma->vm_pgoff, Size))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hifb_valid_mmap_phys_addr_range, FAILURE_TAG);
        return -EINVAL;
    }

    addr = vma->vm_start;

    for_each_sg(pTable->sgl, sg, pTable->nents, u32Cnt)
    {
        HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(sg, HI_FAILURE);
        page    = sg_page(sg);
        pfn     = page_to_pfn(page);
        u32Len  = PAGE_ALIGN(sg->length);
        if (!hifb_valid_mmap_phys_addr_range(vma->vm_pgoff, u32Len))
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hifb_valid_mmap_phys_addr_range, FAILURE_TAG);
            return HI_FAILURE;
        }
        if (remap_pfn_range(vma, addr, pfn, u32Len, vma->vm_page_prot))
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, remap_pfn_range, FAILURE_TAG);
            return HI_FAILURE;
        }
        addr = addr + u32Len;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_MapMemKernalToUser(struct fb_info *info, struct vm_area_struct *vma)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 Size = 0;
    unsigned long iova = 0;
    unsigned long addr = 0;
    unsigned long phy_addr;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(vma, HI_FAILURE);

    iova = (unsigned long)info->fix.smem_start;
    addr = vma->vm_start;

    if (0 == info->fix.smem_start)
    {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.smem_start);
       return HI_FAILURE;
    }

    Size = vma->vm_end - vma->vm_start;
    if (info->fix.smem_len < Size)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.smem_len);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Size);
        return HI_FAILURE;
    }

    vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);

    if (info->fix.smem_len == Size)
    {
        Ret = hifb_smmu_map_to_user((HI_U32)info->fix.smem_start, vma);
        if (HI_SUCCESS != Ret)
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Size);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.smem_len);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, info->fix.smem_start);
        }
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return Ret;
    }

    while (addr < vma->vm_end)
    {
        phy_addr = (unsigned long)hisi_iommu_domain_iova_to_phys(iova);
        if (!phy_addr)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hisi_iommu_domain_iova_to_phys, FAILURE_TAG);
            return HI_FAILURE;
        }

        if (!hifb_valid_mmap_phys_addr_range(vma->vm_pgoff, SZ_4K))
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hifb_valid_mmap_phys_addr_range, FAILURE_TAG);
            return HI_FAILURE;
        }

        if (remap_pfn_range(vma, addr, __phys_to_pfn(phy_addr), SZ_4K, vma->vm_page_prot))
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, remap_pfn_range, FAILURE_TAG);
            return HI_FAILURE;
        }
        addr = addr + SZ_4K;
        iova = iova + SZ_4K;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

static HI_S32 DRV_HIFB_Close(struct fb_info *info, HI_S32 user)
{
    HIFB_PAR_S *par = NULL;
    HI_U32 s32Cnt = 0;
#ifdef CONFIG_HIFB_LOGO_SUPPORT
    HI_U32 StartTimeMs = 0;
    HI_U32 EndTimeMs = 0;
    HI_U32 TotalTimeMs = 0;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    par = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);

    s32Cnt = atomic_read(&par->stBaseInfo.ref_count);
    if (s32Cnt <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, atomic_read, s32Cnt);
        return -EINVAL;
    }

    if (s32Cnt > 1)
    {
        atomic_dec(&par->stBaseInfo.ref_count);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(par->stBaseInfo.u32LayerID, HI_FAILURE);

    g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone(HI_TRUE);

    par->stExtendInfo.bShow = HI_FALSE;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetEnable(par->stBaseInfo.u32LayerID, HI_FALSE);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_UpLayerReg(par->stBaseInfo.u32LayerID);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetCallback(HIFB_CALLBACK_TYPE_VO,         NULL, par->stBaseInfo.u32LayerID);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetCallback(HIFB_CALLBACK_TYPE_3DMode_CHG, NULL, par->stBaseInfo.u32LayerID);

    DRV_HIFB_ReleaseScrollText(info);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    DRV_HIFB_FreeStereoBuf(par);
    par->st3DInfo.StereoMode = HIFB_STEREO_MONO;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimMode(par->stBaseInfo.u32LayerID, HIFB_STEREO_MONO, HIFB_STEREO_MONO);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimAddr(par->stBaseInfo.u32LayerID, 0);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(par->stBaseInfo.u32LayerID, 0);
#endif

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_CloseLayer(par->stBaseInfo.u32LayerID);

#ifdef CONFIG_GFX_PROC_SUPPORT
    DRV_HIFB_PROC_Destory(par->stBaseInfo.u32LayerID);
#endif

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    DRV_HIFB_FENCE_DeInit(par);
#endif

    if ((NULL != info->screen_base) && (0 != info->fix.smem_len))
    {
       HI_GFX_Memset(info->screen_base,0x0,info->fix.smem_len);
    }

    atomic_dec(&par->stBaseInfo.ref_count);

#ifdef CONFIG_HIFB_LOGO_SUPPORT
    if (HIFB_LAYER_HD_0 == par->stBaseInfo.u32LayerID)
    {
        HI_GFX_GetTimeStamp(&StartTimeMs,NULL);
        while (1)
        {
            if ((HI_TRUE == par->FinishHdLogoWork) && (HI_TRUE == par->FinishSdLogoWork))
            {
                break;
            }

            HI_GFX_GetTimeStamp(&EndTimeMs,NULL);
            TotalTimeMs = EndTimeMs - StartTimeMs;
            if (TotalTimeMs >= 100)
            {
               break;
            }
            udelay(1);
        }
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}


static inline HI_VOID DRV_HIFB_ReleaseScrollText(struct fb_info *info)
{
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_U32 ScrollTextCnt = 0;
    HIFB_PAR_S *pstPar = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if (NULL == info) { return; }\
    pstPar = (HIFB_PAR_S *)info->par;\
    if (NULL == pstPar) { return; }
    if (pstPar->stBaseInfo.u32LayerID >= HIFB_LAYER_ID_BUTT) { return; }

    if (HI_TRUE != s_stTextLayer[pstPar->stBaseInfo.u32LayerID].bAvailable)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
        return;
    }

    for (ScrollTextCnt = 0; ScrollTextCnt < SCROLLTEXT_NUM; ScrollTextCnt++)
    {
        if (HI_TRUE != s_stTextLayer[pstPar->stBaseInfo.u32LayerID].stScrollText[ScrollTextCnt].bAvailable)
        {
           continue;
        }
        DRV_HIFB_SCROLLTEXT_FreeCacheBuf(&(s_stTextLayer[pstPar->stBaseInfo.u32LayerID].stScrollText[ScrollTextCnt]));
        HI_GFX_Memset(&s_stTextLayer[pstPar->stBaseInfo.u32LayerID].stScrollText[ScrollTextCnt],0,sizeof(HIFB_SCROLLTEXT_S));
    }

    s_stTextLayer[pstPar->stBaseInfo.u32LayerID].bAvailable = HI_FALSE;
    s_stTextLayer[pstPar->stBaseInfo.u32LayerID].u32textnum = 0;
    s_stTextLayer[pstPar->stBaseInfo.u32LayerID].u32ScrollTextId = 0;

    flush_work(&s_stTextLayer[pstPar->stBaseInfo.u32LayerID].blitScrollTextWork);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
#else
    HI_UNUSED(info);
#endif

    return;
}


static HI_S32 DRV_HIFB_SetCmpReg(unsigned regno, unsigned red, unsigned green,unsigned blue, unsigned transp, struct fb_info *info, HI_BOOL bUpdateReg)
{
    HI_U32 argb = 0x0;
    HIFB_PAR_S *pstPar = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO(info, HI_FAILURE);

    argb = ((transp & 0xff) << 24) | ((red & 0xff) << 16) | ((green & 0xff) << 8) | (blue & 0xff);

    if (regno > 255)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, regno);
        return HI_FAILURE;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetColorReg(pstPar->stBaseInfo.u32LayerID, regno, argb, bUpdateReg);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}


static HI_S32 DRV_HIFB_SetCmapColor(unsigned regno, unsigned red, unsigned green, unsigned blue, unsigned transp, struct fb_info *info)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *pstPar = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO(info, HI_FAILURE);
    if (regno >= 256) { return HI_FAILURE; }

    if ((1 == info->var.bits_per_pixel) || (2 == info->var.bits_per_pixel) || (4 == info->var.bits_per_pixel) || (8 == info->var.bits_per_pixel))
    {
         Ret = DRV_HIFB_SetCmpReg(regno, red, green, blue, transp, info, HI_TRUE);
         return Ret;
    }

    if ((16 == info->var.bits_per_pixel) && (8 == info->var.red.offset))
    {/** ACLUT88 **/
         Ret = DRV_HIFB_SetCmpReg(regno, red, green, blue, transp, info, HI_TRUE);
         return Ret;
    }

    switch (info->var.bits_per_pixel)
    {
        case 16:
            if (regno >= 16)
            {
                break;
            }
            if (info->var.red.offset == 10)
            {
                /* 1:5:5:5 */
                ((u32*) (info->pseudo_palette))[regno] =
                    ((red   & 0xf800) >>  1) |
                    ((green & 0xf800) >>  6) |
                    ((blue  & 0xf800) >> 11);
            }
            else
            {
                /* 0:5:6:5 */
                ((u32*) (info->pseudo_palette))[regno] =
                    ((red   & 0xf800)      ) |
                    ((green & 0xfc00) >>  5) |
                    ((blue  & 0xf800) >> 11);
            }
            break;
        case 24:
        case 32:
            red   >>= 8;
            green >>= 8;
            blue  >>= 8;
            transp >>= 8;
            ((u32 *)(info->pseudo_palette))[regno] =
                (red   << info->var.red.offset)   |
                (green << info->var.green.offset) |
                (blue  << info->var.blue.offset)  |
                (transp  << info->var.transp.offset) ;
            break;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return Ret;
}

static HI_S32 DRV_HIFB_SetColorReg(unsigned regno, unsigned red, unsigned green,unsigned blue, unsigned transp, struct fb_info *info)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return DRV_HIFB_SetCmapColor(regno, red, green, blue, transp, info);
}


/***************************************************************************************
* func          : DRV_HIFB_SetCmap
* description   : CNcomment: 设置调色板 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_SetCmap(struct fb_cmap *cmap, struct fb_info *info)
{
    HI_S32 Index = 0, Start = 0;
    unsigned short *Red = NULL, *Green = NULL, *Blue = NULL, *Transp = NULL;
    unsigned short hRed = 0, hGreen= 0, hBlue= 0, hTransp = 0xffff;
    HIFB_PAR_S *pstPar = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_INFO(info, HI_FAILURE);
    if (pstPar->stBaseInfo.u32LayerID >= HIFB_LAYER_ID_BUTT) { return HI_FAILURE;}

    if (!gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bCmap)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "bcmap no support");
        return HI_FAILURE;
    }

    if (cmap->len > 256)
    {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, cmap->len);
       return HI_FAILURE;
    }

    Red    = cmap->red;
    Green  = cmap->green;
    Blue   = cmap->blue;
    Transp = cmap->transp;
    Start  = cmap->start;

    if ((NULL == Red) || (NULL == Green) || (NULL == Blue))
    {
        return HI_FAILURE;
    }

    for (Index = 0; Index < cmap->len; Index++)
    {
        hRed   = *Red++;
        hGreen = *Green++;
        hBlue  = *Blue++;
        hTransp = (Transp != NULL)? (*Transp++) : (0xffff);
        DRV_HIFB_SetCmapColor(Start++, hRed, hGreen, hBlue, hTransp, info);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

#ifdef CFG_HIFB_SUPPORT_CONSOLE
static HI_VOID DRV_HIFB_FillRect(struct fb_info *p, const struct fb_fillrect *rect)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(p);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(rect);
    cfb_fillrect(p, rect);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
}

static HI_VOID DRV_HIFB_CopyArea(struct fb_info *p, const struct fb_copyarea *area)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(p);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(area);
    cfb_copyarea(p, area);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
}
static HI_VOID DRV_HIFB_ImageBlit(struct fb_info *p, const struct fb_image *image)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(p);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(image);
    cfb_imageblit(p, image);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
}
#endif


#ifdef CONFIG_DMA_SHARED_BUFFER
static struct dma_buf * DRV_HIFB_ExportDmaBuf(struct fb_info *info)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
     HIFB_PAR_S *pstPar = NULL;

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
     DRV_HIFB_DEFINE_PAR_FROM_INFO(info, NULL);

     switch(pstPar->stBaseInfo.u32LayerID)
     {
         case 0:
     #ifdef CONFIG_GFX_HI_FB0_SMMU_SUPPORT
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "export dmabuf failure, should set smmu mem support through make menuconfig");
            return NULL;
     #else
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
            return DRV_HIFB_DMABUF_MemBlockExport(pstPar->u32SmemStartPhy, info->fix.smem_len, 0);
     #endif
         case 1:
     #ifdef CONFIG_GFX_HI_FB1_SMMU_SUPPORT
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "export dmabuf failure, should set smmu mem support through make menuconfig");
            return NULL;
     #else
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
            return DRV_HIFB_DMABUF_MemBlockExport(pstPar->u32SmemStartPhy, info->fix.smem_len, 0);
     #endif
         case 2:
     #ifdef CONFIG_GFX_HI_FB2_SMMU_SUPPORT
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "export dmabuf failure, should set smmu mem support through make menuconfig");
            return NULL;
     #else
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
            return DRV_HIFB_DMABUF_MemBlockExport(pstPar->u32SmemStartPhy, info->fix.smem_len, 0);
     #endif
         default:
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "export dmabuf failure, should set smmu mem support through make menuconfig");
            return NULL;
     }
#else
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
     return DRV_HIFB_DMABUF_MemBlockExport(info->fix.smem_start, info->fix.smem_len, 0);
#endif
}
#endif

static HI_S32 DRV_HIFB_Open(struct fb_info *info, HI_S32 user)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_S32 HifbDevOpenCnt = 0;
    HIFB_PAR_S *pstPar = NULL;
    DRV_HIFB_DEFINE_PAR_FROM_INFO(info, HI_FAILURE);

    HifbDevOpenCnt = atomic_read(&pstPar->stBaseInfo.ref_count);
    atomic_inc(&pstPar->stBaseInfo.ref_count);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID, HI_FAILURE);
    if (HI_TRUE != gs_pstCapacity[pstPar->stBaseInfo.u32LayerID].bLayerSupported)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stBaseInfo.u32LayerID);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this layer not support");
        goto ERROR_EXIT;
    }

    if (0 != HifbDevOpenCnt) { return HI_SUCCESS; }

    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Open();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_DRV_TdeOpen, Ret);
        goto ERROR_EXIT;
    }

#ifdef CONFIG_HIFB_LOGO_SUPPORT
    if (HIFB_LAYER_HD_0 == pstPar->stBaseInfo.u32LayerID)
    {/** if not open fb0 first, should call mce_eixt to clear logo **/
        Ret = DRV_HIFB_LOGO_ResetState();
        if (HI_SUCCESS != Ret)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_LOGO_ResetState, Ret);
            goto ERROR_EXIT;
        }
        DRV_HIFB_LOGO_WhetherExist();
        DRV_HIFB_LOGO_GetData(pstPar->stBaseInfo.u32LayerID);
    }
#endif

    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_OpenLayer(pstPar->stBaseInfo.u32LayerID);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_OpenLayer, Ret);
        goto ERROR_EXIT;
    }

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    Ret = DRV_HIFB_FENCE_Init(pstPar);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_FENCE_Init, Ret);
        goto ERROR_EXIT;
    }
#endif

    Ret = DRV_HIFB_InitLayerInfo(pstPar->stBaseInfo.u32LayerID);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_InitLayerInfo, Ret);
        goto ERROR_EXIT;
    }

#ifdef CONFIG_HIFB_LOGO_SUPPORT
    if (HIFB_LAYER_HD_0 == pstPar->stBaseInfo.u32LayerID)
    {/** if not open fb0 first, you should clear logo to release logo **/
        DRV_HIFB_LOGO_GetBaseData(pstPar->stBaseInfo.u32LayerID);
    }
#endif

    Ret = DRV_HIFB_GetLayerBufferInfo(pstPar->stBaseInfo.u32LayerID);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GetLayerBufferInfo, Ret);
        goto ERROR_EXIT;
    }

    pstPar->stRunInfo.LastScreenAddr = 0;
    pstPar->stRunInfo.CurScreenAddr  = info->fix.smem_start;
    pstPar->st3DInfo.u32rightEyeAddr = pstPar->stRunInfo.CurScreenAddr;
    pstPar->stRunInfo.u32IndexForInt = 0;
    DRV_HIFB_SetDisplayBuffer(pstPar->stBaseInfo.u32LayerID);

#ifdef CONFIG_HIFB_LOGO_SUPPORT
    if (HIFB_LAYER_HD_0 == pstPar->stBaseInfo.u32LayerID)
    {/** if not open fb0 first, you should clear logo to release logo **/
        DRV_HIFB_LOGO_TransitionToApp(pstPar->stBaseInfo.u32LayerID);
    }
#endif

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride (pstPar->stBaseInfo.u32LayerID, info->fix.line_length);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(pstPar->stBaseInfo.u32LayerID, info->fix.smem_start);

    Ret = DRV_HIFB_RegisterCallBackFunction(pstPar->stBaseInfo.u32LayerID);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_RegisterCallBackFunction, Ret);
        goto ERROR_EXIT;
    }

#ifdef CONFIG_GFX_PROC_SUPPORT
    DRV_HIFB_PROC_Create(pstPar->stBaseInfo.u32LayerID);
#endif

    pstPar->stExtendInfo.bShow = HI_TRUE;
    pstPar->bVblank = HI_TRUE;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetEnable(pstPar->stBaseInfo.u32LayerID, HI_TRUE);

#ifdef CONFIG_HIFB_LOGO_SUPPORT
    if (HIFB_LAYER_HD_0 == pstPar->stBaseInfo.u32LayerID)
    {/** if not open fb0 first, you should clear logo to release logo **/
        DRV_HIFB_LOGO_Close(HIFB_LAYER_HD_0);
    }
#endif

    return HI_SUCCESS;
ERROR_EXIT:

    DRV_HIFB_Close(info,user);

    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "hifb open failure");
    return HI_FAILURE;
}

static HI_S32 DRV_HIFB_InitLayerInfo(HI_U32 u32LayerID)
{
    struct fb_info *info        = NULL;
    HIFB_PAR_S *pstPar          = NULL;
    HIFB_COLOR_FMT_E enColorFmt = HIFB_FMT_BUTT;
    HIFB_RECT stInRect   = {0};
    HI_U32 u32Stride     = 0;
    HI_U32 CmpStride     = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_VALUE(u32LayerID);

    if (IS_HD_LAYER(u32LayerID))
    {
        info->var = s_stDefVar[HIFB_LAYER_TYPE_HD];
    }
    else if (IS_SD_LAYER(u32LayerID))
    {
        info->var = s_stDefVar[HIFB_LAYER_TYPE_SD];
    }
    else if(IS_MINOR_HD_LAYER(u32LayerID))
    {
        info->var = s_stDefVar[HIFB_LAYER_TYPE_AD];
    }
    else
    {
        return HI_FAILURE;
    }

    HI_GFX_Memset(&(pstPar->stDispInfo.stUserBuffer), 0, sizeof(pstPar->stDispInfo.stUserBuffer));
    HI_GFX_Memset(&(pstPar->stDispInfo.stCanvasSur),  0, sizeof(pstPar->stDispInfo.stCanvasSur));
    HI_GFX_Memset(&(pstPar->stExtendInfo.stCkey),     0, sizeof(pstPar->stExtendInfo.stCkey));
    HI_GFX_Memset(&(pstPar->stExtendInfo.stPos),      0, sizeof(pstPar->stExtendInfo.stPos));

    pstPar->stBaseInfo.bNeedAntiflicker = HI_FALSE;
    DRV_HIFB_SetAntiflickerLevel(pstPar->stBaseInfo.u32LayerID, HIFB_LAYER_ANTIFLICKER_AUTO);

    pstPar->stRunInfo.bModifying               = HI_FALSE;
    pstPar->stRunInfo.u32ParamModifyMask       = 0;
    pstPar->stExtendInfo.stAlpha.bAlphaEnable  = HI_TRUE;
    pstPar->stExtendInfo.stAlpha.bAlphaChannel = HI_FALSE;
    pstPar->stExtendInfo.stAlpha.u8Alpha0      = 0x0;
    pstPar->stExtendInfo.stAlpha.u8Alpha1      = 0xff;
    pstPar->stExtendInfo.stAlpha.u8GlobalAlpha = 0xff;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAlpha(pstPar->stBaseInfo.u32LayerID, &pstPar->stExtendInfo.stAlpha);

    pstPar->stExtendInfo.stCkey.u8RedMask   = 0xff;
    pstPar->stExtendInfo.stCkey.u8GreenMask = 0xff;
    pstPar->stExtendInfo.stCkey.u8BlueMask  = 0xff;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayKeyMask(pstPar->stBaseInfo.u32LayerID, &pstPar->stExtendInfo.stCkey);

    enColorFmt = HIFB_GetFmtByArgb(&info->var.red, &info->var.green, &info->var.blue, &info->var.transp, info->var.bits_per_pixel);
    pstPar->stExtendInfo.enColFmt = enColorFmt;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt(pstPar->stBaseInfo.u32LayerID, pstPar->stExtendInfo.enColFmt);

    u32Stride = CONIFG_HIFB_GetMaxStride(info->var.xres_virtual, info->var.bits_per_pixel, &CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    info->fix.line_length = u32Stride;

    pstPar->stExtendInfo.DisplayWidth           = info->var.xres;
    pstPar->stExtendInfo.DisplayHeight          = info->var.yres;

    pstPar->st3DInfo.st3DSurface.u32Pitch          = info->fix.line_length;
    pstPar->st3DInfo.st3DSurface.enFmt             = pstPar->stExtendInfo.enColFmt;
    pstPar->st3DInfo.st3DSurface.u32Width          = info->var.xres;
    pstPar->st3DInfo.st3DSurface.u32Height         = info->var.yres;
    pstPar->st3DInfo.st3DMemInfo.u32StereoMemLen   = 0;
    pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart = 0;

    stInRect.x = 0;
    stInRect.y = 0;
    stInRect.w = info->var.xres;
    stInRect.h = info->var.yres;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerRect(pstPar->stBaseInfo.u32LayerID, &stInRect);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride(pstPar->stBaseInfo.u32LayerID, info->fix.line_length);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTriDimMode(pstPar->stBaseInfo.u32LayerID, HIFB_STEREO_MONO, HIFB_STEREO_MONO);
#endif

    pstPar->stExtendInfo.enBufMode = HIFB_REFRESH_MODE_WITH_PANDISPLAY;
    pstPar->stRunInfo.u32BufNum    = CONFIG_HIFB_LAYER_BUFFER_MAX_NUM;
    pstPar->stRunInfo.StereoBufNum = CONFIG_HIFB_STEREO_BUFFER_MAX_NUM;

    pstPar->bPanFlag  = HI_FALSE;
    spin_lock_init(&pstPar->stBaseInfo.lock);
    spin_lock_init(&pstPar->st3DInfo.StereoLock);
    init_waitqueue_head(&pstPar->st3DInfo.WaiteFinishUpStereoInfoMutex);
    init_waitqueue_head(&pstPar->st3DInfo.WaiteFinishFreeStereoMemMutex);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GetLayerBufferInfo(HI_U32 u32LayerID)
{
#ifdef CONFIG_HIFB_REALLOC_MEM
    HI_S32 Ret = HI_SUCCESS;
#endif
    HI_U32 MemStride = 0, CmpStride = 0, LayerBufferNewSize = 0;
    struct fb_info *info = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_INFO_FROM_LAYER(u32LayerID);

    MemStride = CONIFG_HIFB_GetMaxStride(info->var.xres_virtual,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(MemStride, 0, HI_FAILURE);

    LayerBufferNewSize = HI_HIFB_GetMemSize(MemStride,info->var.yres_virtual);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(LayerBufferNewSize, 0, HI_FAILURE);

    if (info->fix.smem_len < LayerBufferNewSize)
    {
#ifdef CONFIG_HIFB_REALLOC_MEM
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
        return HI_SUCCESS;
#else
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32LayerID);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.xres_virtual);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.yres_virtual);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.smem_len);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerBufferNewSize);
        return HI_FAILURE;
#endif
    }

#ifdef CONFIG_HIFB_REALLOC_MEM
    Ret = DRV_HIFB_ReAllocLayerBuffer(u32LayerID,LayerBufferNewSize);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ReAllocLayerBuffer, Ret);
        return HI_FAILURE;
    }
    info->fix.smem_len = LayerBufferNewSize;
#endif
    info->fix.line_length = MemStride;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_VOID DRV_HIFB_SetDisplayBuffer(HI_U32 u32LayerId)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 OneBufSize = 0;
    HI_U32 BufferNum  = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_NOVALUE(u32LayerId);

    OneBufSize = HI_HIFB_GetMemSize(info->fix.line_length,info->var.yres);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(0, OneBufSize);
    BufferNum = info->fix.smem_len / OneBufSize;

    if (CONFIG_HIFB_LAYER_0BUFFER == BufferNum)
    {
       return;
    }
    else if (CONFIG_HIFB_LAYER_1BUFFER == BufferNum)
    {
       pstPar->stDispInfo.u32DisplayAddr[0] = info->fix.smem_start;
       pstPar->stDispInfo.u32DisplayAddr[1] = info->fix.smem_start;
    }
    else
    {
       HI_GFX_CHECK_U64_ADDITION_REVERSAL_UNRETURN(info->fix.smem_start,OneBufSize);
       HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_UNRETURN((info->fix.smem_start + OneBufSize));
       pstPar->stDispInfo.u32DisplayAddr[0] = info->fix.smem_start;
       if (OneBufSize <= info->fix.smem_len / 2)
       {
          pstPar->stDispInfo.u32DisplayAddr[1] = info->fix.smem_start + OneBufSize;
       }
       else
       {
          pstPar->stDispInfo.u32DisplayAddr[1] = info->fix.smem_start;
       }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return;
}


static inline HI_S32 DRV_HIFB_RegisterCallBackFunction(HI_U32 u32LayerId)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetCallback(HIFB_CALLBACK_TYPE_VO, (IntCallBack)DRV_HIFB_VoCallBack, u32LayerId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetCallback, Ret);
        return HI_FAILURE;
    }

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetCallback(HIFB_CALLBACK_TYPE_3DMode_CHG, (IntCallBack)DRV_HIFB_StereoCallBack, u32LayerId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetCallback, Ret);
        return HI_FAILURE;
    }
#endif

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetCallback(HIFB_CALLBACK_TYPE_FRAME_END, (IntCallBack)DRV_HIFB_FENCE_FrameEndCallBack, u32LayerId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetCallback, Ret);
        return HI_FAILURE;
    }
#endif

   HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
   return HI_SUCCESS;
}


HI_U32 DRV_HIFB_GetPixDepth(HI_U32 BitsPerPixel)
{
     HI_U32 PerPixDepth = 0;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     if (BitsPerPixel <= 32)
     {
        PerPixDepth = (BitsPerPixel >= 8) ? (BitsPerPixel >> 3) : (BitsPerPixel / 8);
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return PerPixDepth;
}


HI_VOID DRV_HIFB_WaitVBlank(HIFB_LAYER_ID_E enLayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_WaitVBlank(enLayerId);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 DRV_HIFB_UpStereoData(HIFB_LAYER_ID_E enLayerId, HIFB_BUFFER_S *pstSrcBuffer, HIFB_BLIT_OPT_S *pstBlitOpt)
{
#ifdef CONFIG_HIFB_STEREO_SUPPORT
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_S32 Ret = HI_SUCCESS;
    HI_ULONG LockFlag = 0;
    HIFB_BUFFER_S stDstBuf;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_VALUE(enLayerId);

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&LockFlag);
      pstPar->stRunInfo.bNeedFlip        = HI_FALSE;
      pstPar->stRunInfo.s32RefreshHandle = 0;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockFlag);

    HI_GFX_Memcpy(&stDstBuf.stCanvas, &pstPar->st3DInfo.st3DSurface, sizeof(HIFB_SURFACE_S));

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  stDstBuf.stCanvas.u32Width, stDstBuf.stCanvas.u32Height, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_PARA_CHECK_SUPPORT, Ret);
        return HI_FAILURE;
    }
    stDstBuf.stCanvas.u32Width  = (HIFB_STEREO_SIDEBYSIDE_HALF == pstPar->st3DInfo.StereoMode) ? (stDstBuf.stCanvas.u32Width >> 1) : (stDstBuf.stCanvas.u32Width);
    stDstBuf.stCanvas.u32Height = (HIFB_STEREO_TOPANDBOTTOM == pstPar->st3DInfo.StereoMode) ? (stDstBuf.stCanvas.u32Height >> 1) : (stDstBuf.stCanvas.u32Height);

    stDstBuf.UpdateRect.x = 0;
    stDstBuf.UpdateRect.y = 0;
    stDstBuf.UpdateRect.w = stDstBuf.stCanvas.u32Width;
    stDstBuf.UpdateRect.h = stDstBuf.stCanvas.u32Height;

    pstPar->stFrameInfo.bBlitBlock = pstBlitOpt->bBlock;
    pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(pstSrcBuffer, &stDstBuf, pstBlitOpt, HI_TRUE);
    if (Ret <= 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
        return HI_FAILURE;
    }

    pstPar->stRunInfo.s32RefreshHandle = Ret;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pstSrcBuffer);
    HI_UNUSED(pstBlitOpt);
#endif

    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_BlitFinishCallBack
* description  : CNcomment: tde 任务完成 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_BlitFinishCallBack(HI_VOID *pParaml, HI_VOID *pParamr)
{
    HI_U32 LayerId = 0;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *info = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    /***************************beg check par **********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pParaml, HI_FAILURE);
    LayerId = *(HI_U32 *)pParaml;
    DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_VALUE(LayerId);
    /***************************end check par **********************************/

    /***************************finsh blit, can flip ***************************/
    pstPar->stRunInfo.bNeedFlip = HI_TRUE;
    /***************************finsh blit, can flip ***************************/

    /********************beg check whether should switch buffer *****************/
    if (HI_FALSE == pstPar->st3DInfo.IsStereo)
    {
        pstPar->FenceRefreshCount++;
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
        return HI_SUCCESS;
    }

#if defined(CONFIG_HIFB_FENCE_SUPPORT) && defined(CONFIG_HIFB_STEREO_SUPPORT)
    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;
#endif
    /********************end check whether should switch buffer ****************/

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID HIFB_DRV_GetSettingInfo(HI_U32 LayerId, HIFB_SETTING_INFO* pstSettingInfo)
{
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    DRV_HIFB_DEFINE_PAR_FROM_LAYER_RETURN_NOVALUE(LayerId);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstSettingInfo);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);

    pstSettingInfo->FenceRefreshCount = pstPar->FenceRefreshCount;
    pstSettingInfo->BufferSize = info->fix.line_length * pstPar->stExtendInfo.DisplayHeight;

    DRV_HIFB_FENCE_GetFenceValue(&pstSettingInfo->FenceValue);
    DRV_HIFB_FENCE_GetTimeLineValue(&pstSettingInfo->TimelineValue);
    DRV_HIFB_FENCE_GetRegUpCnt(&pstSettingInfo->RegUpdateCnt);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerWillWorkAddr(LayerId, &pstSettingInfo->WillWorkAddress);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerWorkAddr    (LayerId, &pstSettingInfo->WorkAddress);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerStride      (LayerId, &pstSettingInfo->LayerStride);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDeCmpSwitch      (LayerId, &pstSettingInfo->DecompressState);
#else
    HI_UNUSED(LayerId);
    HI_UNUSED(pstSettingInfo);
#endif
    return;
}

static HI_VOID DRV_HIFB_ShowCmd(HI_VOID)
{
#if 0
    HI_GFX_Print("0x%X   /**<-- FBIOGET_COLORKEY_HIFB                 >**/\n",FBIOGET_COLORKEY_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_COLORKEY_HIFB                 >**/\n",FBIOPUT_COLORKEY_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_ALPHA_HIFB                    >**/\n",FBIOGET_ALPHA_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_ALPHA_HIFB                    >**/\n",FBIOPUT_ALPHA_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_SCREEN_ORIGIN_HIFB            >**/\n",FBIOGET_SCREEN_ORIGIN_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_SCREEN_ORIGIN_HIFB            >**/\n",FBIOPUT_SCREEN_ORIGIN_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_DEFLICKER_HIFB                >**/\n",FBIOGET_DEFLICKER_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_DEFLICKER_HIFB                >**/\n",FBIOPUT_DEFLICKER_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_VBLANK_HIFB                   >**/\n",FBIOGET_VBLANK_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_SHOW_HIFB                     >**/\n",FBIOPUT_SHOW_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_SHOW_HIFB                     >**/\n",FBIOGET_SHOW_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_CAPABILITY_HIFB               >**/\n",FBIOGET_CAPABILITY_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_DECOMPRESS_HIFB               >**/\n",FBIOPUT_DECOMPRESS_HIFB);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_LAYER_INFO                    >**/\n",FBIOPUT_LAYER_INFO);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_LAYER_INFO                    >**/\n",FBIOGET_LAYER_INFO);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_CANVAS_BUFFER                 >**/\n",FBIOGET_CANVAS_BUFFER);
    HI_GFX_Print("0x%X   /**<-- FBIO_REFRESH                          >**/\n",FBIO_REFRESH);
    HI_GFX_Print("0x%X   /**<-- FBIO_WAITFOR_FREFRESH_DONE            >**/\n",FBIO_WAITFOR_FREFRESH_DONE);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_ENCODER_PICTURE_FRAMING       >**/\n",FBIOPUT_ENCODER_PICTURE_FRAMING);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_ENCODER_PICTURE_FRAMING       >**/\n",FBIOGET_ENCODER_PICTURE_FRAMING);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_STEREO_MODE                   >**/\n",FBIOPUT_STEREO_MODE);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_STEREO_MODE                   >**/\n",FBIOGET_STEREO_MODE);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_SCREENSIZE                    >**/\n",FBIOPUT_SCREENSIZE);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_SCREENSIZE                    >**/\n",FBIOGET_SCREENSIZE);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_COMPRESSION                   >**/\n",FBIOPUT_COMPRESSION);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_COMPRESSION                   >**/\n",FBIOGET_COMPRESSION);
    HI_GFX_Print("0x%X   /**<-- FBIO_SCROLLTEXT_CREATE                >**/\n",FBIO_SCROLLTEXT_CREATE);
    HI_GFX_Print("0x%X   /**<-- FBIO_SCROLLTEXT_FILL                  >**/\n",FBIO_SCROLLTEXT_FILL);
    HI_GFX_Print("0x%X   /**<-- FBIO_SCROLLTEXT_PAUSE                 >**/\n",FBIO_SCROLLTEXT_PAUSE);
    HI_GFX_Print("0x%X   /**<-- FBIO_SCROLLTEXT_RESUME                >**/\n",FBIO_SCROLLTEXT_RESUME);
    HI_GFX_Print("0x%X   /**<-- FBIO_SCROLLTEXT_DESTORY               >**/\n",FBIO_SCROLLTEXT_DESTORY);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_STEREO_DEPTH                  >**/\n",FBIOPUT_STEREO_DEPTH);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_STEREO_DEPTH                  >**/\n",FBIOGET_STEREO_DEPTH);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_ZORDER                        >**/\n",FBIOPUT_ZORDER);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_ZORDER                        >**/\n",FBIOGET_ZORDER);
    HI_GFX_Print("0x%X   /**<-- FBIO_FREE_LOGO                        >**/\n",FBIO_FREE_LOGO);
    HI_GFX_Print("0x%X   /**<-- FBIOPUT_COMPRESSIONMODE               >**/\n",FBIOPUT_COMPRESSIONMODE);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_COMPRESSIONMODE               >**/\n",FBIOGET_COMPRESSIONMODE);
    HI_GFX_Print("0x%X   /**<-- FBIO_HWC_REFRESH                      >**/\n",FBIO_HWC_REFRESH);
    HI_GFX_Print("0x%X   /**<-- FBIOGET_SMEMSTART_PHY                 >**/\n",FBIOGET_SMEMSTART_PHY);
    HI_GFX_Print("0x%X   /**<-- FBIO_HWC_GETLAYERINFO                 >**/\n",FBIO_HWC_GETLAYERINFO);
#endif
   return;
}

/***************************************************************************************
* func        : HIFB_DRV_ModInit
* description : CNcomment: insmod ko initialCNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 HIFB_DRV_ModInit(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32LayerId = HIFB_LAYER_HD_0;
    HI_U32 MemStride = 0, CmpStride = 0, MemBufSize = 0;

    #define CONFIG_HIFB_DISP_BUFF_MAX_SIZE  (100 * 1024 * 1024)
    HI_GFX_Memset(&s_stLayer, 0x0, sizeof(s_stLayer));

    DRV_HIFB_ADP_GetCallBackFunction(&g_stDrvAdpCallBackFunction);
    DRV_HIFB_GFX2D_GetCallBackFunction(&g_stGfx2dCallBackFunction);

    Ret = g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_Init();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_Init, Ret);
        goto ERR_EXIT;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDevCap(&gs_pstCapacity);
    if (NULL == gs_pstCapacity)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_GetDevCap, Ret);
        goto ERR_EXIT;
    }

    if (!strncmp("on", tc_wbc, 2))
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetTCFlag(HI_TRUE);
    }

    Ret = DRV_HIFB_ParseInsmodParameter();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ParseInsmodParameter, Ret);
        goto ERR_EXIT;
    }

    if ((0 == s_stLayer[u32LayerId].u32LayerSize) || (s_stLayer[u32LayerId].u32LayerSize > CONFIG_HIFB_DISP_BUFF_MAX_SIZE))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, s_stLayer[u32LayerId].u32LayerSize);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, CONFIG_HIFB_DISP_BUFF_MAX_SIZE);
        goto ERR_EXIT;
    }

    for (u32LayerId = HIFB_LAYER_HD_0; u32LayerId < (HIFB_LAYER_HD_0 + CONFIG_HIFB_GP0_SUPPORT_GFX_COUNT); u32LayerId++)
    {
        if (0 == s_stLayer[u32LayerId].u32LayerSize)
        {
            continue;
        }

        MemStride  = CONIFG_HIFB_GetMaxStride(CONFIG_HIFB_LAYER_MAXWIDTH, CONFIG_HIFB_DEFAULT_DEPTH, &CmpStride, CONFIG_HIFB_STRIDE_16ALIGN);
        MemBufSize = HI_HIFB_GetMemSize(MemStride, CONFIG_HIFB_LAYER_MAXHEIGHT * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM);
        if ((0 == CmpStride) || (0 == MemBufSize))
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CmpStride);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, MemBufSize);
            goto ERR_EXIT;
        }

        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, s_stLayer[u32LayerId].u32LayerSize);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, MemBufSize);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, CONFIG_HIFB_LAYER_MAXWIDTH);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, CONFIG_HIFB_LAYER_MAXHEIGHT);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, CONFIG_HIFB_DEFAULT_DEPTH);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, MemStride);

#ifdef CFG_HIFB_ANDROID_SUPPORT
        if ((s_stLayer[u32LayerId].u32LayerSize < MemBufSize) && (HIFB_LAYER_HD_0 == u32LayerId))
#else
        if (s_stLayer[u32LayerId].u32LayerSize < MemBufSize)
#endif
        {
            s_stLayer[u32LayerId].u32LayerSize = MemBufSize;
        }

        Ret = DRV_HIFB_RegisterFrameBuffer(u32LayerId);
        if (HI_SUCCESS != Ret)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_RegisterFrameBuffer, Ret);
            goto ERR_EXIT;
        }

        Ret = DRV_HIFB_AllocLayerBuffer(u32LayerId, s_stLayer[u32LayerId].u32LayerSize);
        if (HI_SUCCESS != Ret)
        {
            continue;
        }

        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32LayerId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, s_stLayer[u32LayerId].u32LayerSize);

        Ret = DRV_HIFB_InitAllocCmapBuffer(u32LayerId);
        if (HI_SUCCESS != Ret)
        {
            continue;
        }

        #ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
        HI_GFX_Memset(&s_stTextLayer[u32LayerId], 0, sizeof(s_stTextLayer[u32LayerId]));
        #endif
    }

#ifndef HI_MCE_SUPPORT
    DRV_HIFB_ModInit_K();
#endif

#ifdef CONFIG_HIFB_LOGO_SUPPORT
    Ret = DRV_HIFB_LOGO_ResetState();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_LOGO_ResetState, Ret);
        goto ERR_EXIT;
    }

    DRV_HIFB_LOGO_WhetherExist();
#endif

    DRV_HIFB_PrintVersion(HI_TRUE);

    DRV_HIFB_ShowCmd();

    return HI_SUCCESS;
ERR_EXIT:

    HIFB_DRV_ModExit();

    return HI_FAILURE;
}

/***************************************************************************************
* func        : HIFB_DRV_ModExit
* description : CNcomment: rmmod ko dinitialCNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID HIFB_DRV_ModExit(HI_VOID)
{
    HI_U32 u32LayerId    = HIFB_LAYER_HD_0;
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
    HI_U32 ScrollTextNum = 0;
#endif

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_DeInit();

    for (u32LayerId = HIFB_LAYER_HD_0; u32LayerId <= HIFB_LAYER_SD_1; u32LayerId++)
    {
        DRV_HIFB_DInitAllocCmapBuffer(u32LayerId);
        DRV_HIFB_FreeLayerBuffer(u32LayerId);
        DRV_HIFB_UnRegisterFrameBuffer(u32LayerId);
#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
           if (s_stTextLayer[u32LayerId].bAvailable) { continue; }

           for (ScrollTextNum = 0; ScrollTextNum < SCROLLTEXT_NUM; ScrollTextNum++)
           {
               if (s_stTextLayer[u32LayerId].stScrollText[ScrollTextNum].bAvailable)
               {
                   DRV_HIFB_SCROLLTEXT_FreeCacheBuf(&(s_stTextLayer[u32LayerId].stScrollText[ScrollTextNum]));
                   HI_GFX_Memset(&s_stTextLayer[u32LayerId].stScrollText[ScrollTextNum],0,sizeof(HIFB_SCROLLTEXT_S));
               }
           }
           s_stTextLayer[u32LayerId].bAvailable = HI_FALSE;
           s_stTextLayer[u32LayerId].u32textnum = 0;
           s_stTextLayer[u32LayerId].u32ScrollTextId = 0;
           flush_work(&s_stTextLayer[u32LayerId].blitScrollTextWork);
#endif
    }

    g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Close();

#ifndef HI_MCE_SUPPORT
    DRV_HIFB_ModExit_K();
#endif

    DRV_HIFB_PrintVersion(HI_FALSE);

    return;
}

static HI_S32 DRV_HIFB_ParseInsmodParameter(HI_VOID)
{
    HI_CHAR *pInputStr = NULL;
    HI_CHAR number[4] = {0};
    HI_U32 LayerCnt = 0;
    HI_U32 u32LayerId = 0;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstCapacity, HI_FAILURE);

    if (NULL == video)
    {
       for (u32LayerId = HIFB_LAYER_HD_0; (u32LayerId <= HIFB_LAYER_SD_1) && (HI_TRUE == gs_pstCapacity[u32LayerId].bLayerSupported); u32LayerId++)
       {
#ifdef CFG_HIFB_ANDROID_SUPPORT
          s_stLayer[u32LayerId].u32LayerSize = (0 == gs_u32MenuconfigLayerSize[u32LayerId]) ? (252 * 1024) : HI_HIFB_GetMemSize(gs_u32MenuconfigLayerSize[u32LayerId] * 1024, 1);
#else
          s_stLayer[u32LayerId].u32LayerSize = (0 == gs_u32MenuconfigLayerSize[u32LayerId]) ? (0) : HI_HIFB_GetMemSize(gs_u32MenuconfigLayerSize[u32LayerId] * 1024, 1);
#endif
       }
       return HI_SUCCESS;
    }

    pInputStr = strstr(video, "vram");
    while (NULL != pInputStr)
    {
        LayerCnt   = 0;
        pInputStr += 4;
        while ('_' != *pInputStr)
        {
            if (LayerCnt > 1)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerCnt);
                return HI_FAILURE;
            }
            number[LayerCnt] = *pInputStr;
            LayerCnt++;
            pInputStr++;
        }
        number[LayerCnt] = '\0';

        u32LayerId = simple_strtoul(number, (char **)NULL, 10);
        HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);

        if (HI_FALSE == gs_pstCapacity[u32LayerId].bLayerSupported)
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32LayerId);
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this layer is not support");
            return HI_FAILURE;
        }

        pInputStr += sizeof("size") + LayerCnt;
        s_stLayer[u32LayerId].u32LayerSize = DRV_HIFB_GetVramSize(pInputStr);

        pInputStr = strstr(pInputStr, "vram");
    }

    return HI_SUCCESS;
}

static inline HI_ULONG DRV_HIFB_GetVramSize(HI_CHAR* pstr)
{
    HI_BOOL str_is_valid = HI_TRUE;
    unsigned long vram_size = 0;
    HI_CHAR* ptr = pstr;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if ((ptr == NULL) || (*ptr == '\0'))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return 0;
    }

    while (*ptr != '\0')
    {
        if (*ptr == ',')
        {
            break;
        }
        else if ((!isdigit(*ptr)) && ('X' != *ptr) && ('x' != *ptr) && ((*ptr > 'f' && *ptr <= 'z') || (*ptr > 'F' && *ptr <= 'Z')))
        {
            str_is_valid = HI_FALSE;
            break;
        }
        ptr++;
    }

    if (HI_TRUE == str_is_valid)
    {
        vram_size = simple_strtoul(pstr, (char **)NULL, 0);
        vram_size = ((vram_size * 1024 + PAGE_SIZE - 1) & PAGE_MASK)/1024;
    }

    if (0 != vram_size)
    {
        vram_size = HI_HIFB_GetMemSize(vram_size * 1024, 1);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return vram_size;
}

static inline HI_S32 DRV_HIFB_RegisterFrameBuffer(HI_U32 u32LayerId)
{
    HI_S32 Ret = 0;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *FbInfo = NULL;

    FbInfo = framebuffer_alloc( ( (sizeof(HIFB_PAR_S)) + (sizeof(HI_U32) * 256) ), NULL);
    if (NULL == FbInfo)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, framebuffer_alloc, FAILURE_TAG);
        return -ENOMEM;
    }

    pstPar = (HIFB_PAR_S *)(FbInfo->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
    s_stLayer[u32LayerId].pstInfo = FbInfo;

    FbInfo->fix   = gs_stDefFix;
    FbInfo->fbops = &s_sthifbops;
    FbInfo->flags = FBINFO_FLAG_DEFAULT | FBINFO_HWACCEL_YPAN | FBINFO_HWACCEL_XPAN;
    FbInfo->pseudo_palette = (HI_U8*)(FbInfo->par) + sizeof(HIFB_PAR_S);
    FbInfo->fix.smem_len  = s_stLayer[u32LayerId].u32LayerSize;

    Ret = register_framebuffer(FbInfo);
    if (Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, register_framebuffer, Ret);
        framebuffer_release(FbInfo);
        s_stLayer[u32LayerId].pstInfo = NULL;
        return HI_FAILURE;
    }

    pstPar->bFrameBufferRegister = HI_TRUE;

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    init_waitqueue_head(&pstPar->WaiteEndFenceRefresh);
#endif

    return HI_SUCCESS;
}

static inline HI_VOID DRV_HIFB_UnRegisterFrameBuffer(HI_U32 u32LayerId)
{
    HIFB_PAR_S *pstPar   = NULL;
    struct fb_info* FbInfo = NULL;
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(u32LayerId);

    FbInfo = s_stLayer[u32LayerId].pstInfo;
    if (NULL == FbInfo) { return; }

    pstPar = (HIFB_PAR_S *)FbInfo->par;
    if (NULL == pstPar) { return; }

    if (HI_TRUE == pstPar->bFrameBufferRegister) { unregister_framebuffer(FbInfo); }

    framebuffer_release(FbInfo);

    s_stLayer[u32LayerId].pstInfo = NULL;

    return;
}

#ifdef CONFIG_HIFB_REALLOC_MEM
static inline HI_S32 DRV_HIFB_ReAllocLayerBuffer(HI_U32 u32LayerId, HI_U32 BufSize)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    DRV_HIFB_FreeLayerBuffer(u32LayerId);
    Ret = DRV_HIFB_AllocLayerBuffer(u32LayerId,BufSize);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}
#endif

static inline HI_S32 DRV_HIFB_AllocLayerBuffer(HI_U32 u32LayerId, HI_U32 BufSize)
{
    HI_CHAR LayerBufferName[256] = {'\0'};
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *FbInfo = NULL;
#ifdef CONFIG_GFX_MMU_SUPPORT
    HI_BOOL bSmmu = HI_FALSE;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
    FbInfo = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(FbInfo, HI_FAILURE);

    pstPar = (HIFB_PAR_S *)FbInfo->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    pstPar->u32SmemStartPhy = 0;
    pstPar->stBaseInfo.u32LayerID = u32LayerId;
    pstPar->stDispInfo.stCanvasSur.u32PhyAddr = 0;

    snprintf(LayerBufferName, sizeof(LayerBufferName), "HIFB_FB%d_DisBuf", u32LayerId);
    LayerBufferName[sizeof(LayerBufferName) - 1] = '\0';

#ifdef CONFIG_GFX_MMU_SUPPORT
    bSmmu = DRV_HIFB_CheckSmmuSupport(u32LayerId);
    if (HI_FALSE == bSmmu)
    {
        pstPar->u32SmemStartPhy = DRV_HIFB_MEM_Alloc(LayerBufferName, NULL, BufSize);
        FbInfo->fix.smem_start  = DRV_HIFB_MEM_Map2Smmu(pstPar->u32SmemStartPhy);
    }
    else
#endif
    {
        pstPar->u32SmemStartPhy = 0;
        FbInfo->fix.smem_start = DRV_HIFB_MEM_Alloc(LayerBufferName, "iommu", BufSize);
    }

    if (0 == FbInfo->fix.smem_start)
    {
       return HI_FAILURE;
    }

    FbInfo->screen_base = DRV_HIFB_MEM_Map(FbInfo->fix.smem_start);
    if (NULL == FbInfo->screen_base)
    {
       return HI_FAILURE;
    }

    HI_GFX_Memset(FbInfo->screen_base, 0x0, BufSize);

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, BufSize);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, FbInfo->fix.smem_len);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, FbInfo->fix.smem_start);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static inline HI_VOID DRV_HIFB_FreeLayerBuffer(HI_U32 u32LayerId)
{
    struct fb_info* FbInfo = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(u32LayerId);
    FbInfo = s_stLayer[u32LayerId].pstInfo;
    if (NULL == FbInfo)
    {
       return;
    }

    pstPar = (HIFB_PAR_S *)FbInfo->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    if (NULL != FbInfo->screen_base)
    {
        DRV_HIFB_MEM_UnMap(FbInfo->screen_base);
        FbInfo->screen_base = NULL;
    }

    if (0 == FbInfo->fix.smem_start)
    {
       return;
    }

#ifdef CONFIG_GFX_MMU_SUPPORT
    if (0 != pstPar->u32SmemStartPhy)
    {
        DRV_HIFB_MEM_UnMapFromSmmu(FbInfo->fix.smem_start);
        DRV_HIFB_MEM_Free(pstPar->u32SmemStartPhy,HI_FALSE);
    }
    else
    {
        DRV_HIFB_MEM_Free(FbInfo->fix.smem_start,HI_TRUE);
    }
#else
    DRV_HIFB_MEM_Free(FbInfo->fix.smem_start,HI_FALSE);
#endif

    pstPar->u32SmemStartPhy = 0;
    FbInfo->fix.smem_start  = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_S32 DRV_HIFB_InitAllocCmapBuffer(HI_U32 u32LayerId)
{
    HI_U32 CmapLen = 256;
    struct fb_info* FbInfo = NULL;

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
    FbInfo = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(FbInfo, HI_FAILURE);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
    if (HI_TRUE != gs_pstCapacity[u32LayerId].bCmap)
    {
        return HI_SUCCESS;
    }

    if (fb_alloc_cmap(&FbInfo->cmap, CmapLen, 1) < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, fb_alloc_cmap, FAILURE_TAG);
        FbInfo->cmap.len = 0;
        return HI_FAILURE;
    }

    FbInfo->cmap.len = CmapLen;

    return HI_SUCCESS;
}

static inline HI_VOID DRV_HIFB_DInitAllocCmapBuffer(HI_U32 u32LayerId)
{
    struct fb_cmap *cmap   = NULL;
    struct fb_info *FbInfo = NULL;
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(u32LayerId);

    FbInfo = s_stLayer[u32LayerId].pstInfo;
    if (NULL == FbInfo) { return; }

    cmap = &FbInfo->cmap;
    if (0 != cmap->len) { fb_dealloc_cmap(cmap); }

    return;
}

static inline HI_BOOL DRV_HIFB_CheckSmmuSupport(HI_U32 LayerId)
{
      HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
#ifdef CONFIG_GFX_MMU_SUPPORT
      switch(LayerId)
      {
          case HIFB_LAYER_HD_0:
          {
             #ifdef CONFIG_GFX_HI_FB0_SMMU_SUPPORT
               HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
               return HI_TRUE;
             #else
               HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
               return HI_FALSE;
             #endif
          }
          case HIFB_LAYER_HD_1:
          {
             #ifdef CONFIG_GFX_HI_FB1_SMMU_SUPPORT
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_TRUE;
             #else
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_FALSE;
             #endif
          }
          case HIFB_LAYER_HD_2:
          {
             #ifdef CONFIG_GFX_HI_FB2_SMMU_SUPPORT
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_TRUE;
             #else
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_FALSE;
             #endif
          }
          default:
          {
             HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
             return HI_FALSE;
          }
      }
 #else
      HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
      return HI_FALSE;
 #endif
      HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
}

static inline HI_VOID DRV_HIFB_PrintVersion(HI_BOOL bLoad)
{
#if !defined(CONFIG_GFX_COMM_VERSION_DISABLE) && !defined(CONFIG_GFX_COMM_DEBUG_DISABLE) && defined(MODULE)
     if (HI_TRUE == bLoad)
     {
        HI_GFX_Print("Load hi_fb.ko success.\t\t(%s)\n", VERSION_STRING);
     }
     else
     {
        HI_GFX_Print("UnLoad hi_fb.ko success.\t(%s)\n", VERSION_STRING);
     }
#endif
     return;
}

HI_VOID DRV_HIFB_SetDecmpLayerInfo(HI_U32 LayerId)
{
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    HI_BOOL bDispEnable = HI_FALSE;
#endif
    HI_U32 IsFenceRefresh = 0x0;
    HI_ULONG LockParFlag = 0;
    HI_U32 CmpStride   = 0;
    HI_U32 UnCmpStride = 0;
    HIFB_PAR_S *pstPar = NULL;
    HI_S32 Ret = HI_SUCCESS;
#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT) && !defined(CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE)
    HI_U32 HeadSize  = 0;
    HI_U32 ARHeadDdr = 0;
    HI_U32 ARDataDdr = 0;
    HI_U32 GBHeadDdr = 0;
    HI_U32 GBDataDdr = 0;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);
    if ((NULL == s_stLayer[LayerId].pstInfo) || (NULL == s_stLayer[LayerId].pstInfo->par))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "pstInfo or par is null");
        return;
    }
    pstPar = (HIFB_PAR_S *)s_stLayer[LayerId].pstInfo->par;

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&LockParFlag);

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetHaltDispStatus(pstPar->stBaseInfo.u32LayerID, &bDispEnable);
    while (pstPar->FenceRefreshCount > 0)
    {
        DRV_HIFB_FENCE_IncRefreshTime(bDispEnable);
        pstPar->FenceRefreshCount--;
    }
#endif

    IsFenceRefresh = (pstPar->stRunInfo.u32ParamModifyMask & HIFB_LAYER_PARAMODIFY_FENCE);
    if (!IsFenceRefresh)
    {
       pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_FENCE;
       DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);
       return;
    }

    if (HI_TRUE == pstPar->st3DInfo.IsStereo)
    {
        pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_FENCE;
        DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);
        return;
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,pstPar->stExtendInfo.DisplayWidth,pstPar->stExtendInfo.DisplayHeight,0,0,0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayHeight);
        return;
    }

    UnCmpStride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth,32,&CmpStride,CONFIG_HIFB_DECOMPRESS_DATA_STRIDE_ALIGN);
#ifdef CONFIG_GFX_CANVASE_TO_LAYER_SUPPORT
    UnCmpStride = pstPar->stExtendInfo.DisplayStride;
#endif

#ifdef CFG_HI_FB_DECOMPRESS_SUPPORT
    #ifndef CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE
    if (HI_TRUE == pstPar->bDeCompress)
    {
        DRV_HIFB_MEM_GetCmpHeadInfo(pstPar->stExtendInfo.DisplayHeight,&HeadSize,NULL);
        ARHeadDdr = pstPar->stRunInfo.CurScreenAddr;

        HI_GFX_CHECK_INT_ADDITION_REVERSAL_UNRETURN(ARHeadDdr,HeadSize);
        ARDataDdr = ARHeadDdr + HeadSize;
        HI_GFX_CHECK_INT_ADDITION_REVERSAL_UNRETURN(ARDataDdr,CmpStride * pstPar->stExtendInfo.DisplayHeight);
        GBHeadDdr = ARDataDdr + CmpStride * pstPar->stExtendInfo.DisplayHeight;
        HI_GFX_CHECK_INT_ADDITION_REVERSAL_UNRETURN(GBHeadDdr,HeadSize);
        GBDataDdr = GBHeadDdr + HeadSize;

        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetDeCmpDdrInfo(LayerId, ARHeadDdr,ARDataDdr,GBHeadDdr,GBDataDdr,CmpStride);
    }
    else
    #endif
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride(LayerId, UnCmpStride);
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(LayerId, pstPar->stRunInfo.CurScreenAddr);
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetDeCmpSwitch (LayerId, pstPar->bDeCompress);
#else
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride(LayerId, UnCmpStride);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerAddr(LayerId, pstPar->stRunInfo.CurScreenAddr);
#endif

    pstPar->stRunInfo.u32ParamModifyMask &= ~HIFB_LAYER_PARAMODIFY_FENCE;

    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_VOID DRV_HIFB_Lock(spinlock_t *pLock, HI_ULONG *pLockParFlag)
{
    spin_lock_irqsave(pLock,*pLockParFlag);
    return;
}

HI_VOID DRV_HIFB_UnLock(spinlock_t *pLock, HI_ULONG *pLockParFlag)
{
    spin_unlock_irqrestore(pLock,*pLockParFlag);
    return;
}
/*****************************************************************************/
/*****************************************************************************/
#ifdef MODULE
module_init(HIFB_DRV_ModInit);
module_exit(HIFB_DRV_ModExit);
MODULE_LICENSE("GPL");
#endif
