/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : drv_hifb_proc.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                       Author                 Modification
2018/01/01                 sdk                    Created file
***************************************************************************************************/
#ifdef CONFIG_GFX_PROC_SUPPORT

/*********************************add include here*************************************************/
#include "hi_drv_proc.h"
#include "drv_hifb_proc.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_wbc.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_config.h"
#include "drv_hifb_fence.h"
#include "drv_hifb_debug.h"
/***************************** Macro Definition ***************************************************/


/*************************** Structure Definition *************************************************/


/********************** Global Variable declaration ***********************************************/
static const HI_CHAR* s_pszFmtName[] ={
                                        "RGB565",
                                        "RGB888",
                                        "KRGB444",
                                        "KRGB555",
                                        "KRGB888",
                                        "ARGB4444",
                                        "ARGB1555",
                                        "ARGB8888",
                                        "ARGB8565",
                                        "RGBA4444",
                                        "RGBA5551",
                                        "RGBA5658",
                                        "RGBA8888",
                                        "BGR565",
                                        "BGR888",
                                        "ABGR4444",
                                        "ABGR1555",
                                        "ABGR8888",
                                        "ABGR8565",
                                        "KBGR444",
                                        "KBGR555",
                                        "KBGR888",
                                        "1BPP",
                                        "2BPP",
                                        "4BPP",
                                        "8BPP",
                                        "ACLUT44",
                                        "ACLUT88",
                                        "PUYVY",
                                        "PYUYV",
                                        "PYVYU",
                                        "YUV888",
                                        "AYUV8888",
                                        "YUVA8888",
                                        "BUTT"
                                    };

const static HI_CHAR* gs_LayerName[] ={
                                        "layer_hd_0",
                                        "layer_hd_1",
                                        "layer_hd_2",
                                        "layer_hd_3",
                                        "layer_sd_0",
                                        "layer_sd_1",
                                        "layer_sd_2",
                                        "layer_sd_3",
                                        "layer_ad_0",
                                        "layer_ad_1",
                                        "layer_ad_2",
                                        "layer_ad_3",
                                        "layer_cursor"
                                      };

#ifdef CONFIG_HIFB_FENCE_SUPPORT
extern HIFB_SYNC_INFO_S gs_SyncInfo;
#endif
extern OPTM_GFX_LAYER_S *g_pstGfxDevice[HIFB_LAYER_ID_BUTT];

/******************************* API declaration **************************************************/
#ifdef CONFIG_HIFB_CAPTURE_BMP_SUPPORT
extern HI_VOID HI_UNF_HIFB_CaptureImgFromLayer(HI_U32 u32LayerID, HI_U32 LineLength, HI_BOOL CaptureData);
#endif

extern HI_VOID DRV_HIFB_SNAPSHOT_CaptureRegister(HI_VOID);

static HI_S32 HIFB_PROC_Read  (struct seq_file *p, HI_VOID *v);
static HI_S32 HIFB_PROC_Write (struct file * file,const char __user * buf, size_t count, loff_t *ppos);

static HI_VOID HIFB_PROC_ParseEchoCmd  (HIFB_PAR_S *pstPar, HI_U32 Stride, HI_CHAR *pBuf);
static HI_VOID HIFB_PROC_SetRegister   (HI_U32 LayerId, HI_CHAR *pBuf);

static HI_VOID HIFB_PROC_ReadHdMsg          (HIFB_PAR_S *pstPar, struct seq_file *p, struct fb_info *info);
static HI_VOID HIFB_PROC_ReadRefreshMsg     (HIFB_PAR_S *pstPar, struct seq_file *p);
static HI_VOID HIFB_PROC_ReadUpCostTimesMsg (HIFB_PAR_S *pstPar, struct seq_file *p);
static HI_VOID HIFB_PROC_ReadFenceDebugMsg  (HIFB_PAR_S *pstPar, struct seq_file *p);
static HI_VOID HIFB_PROC_ReadWbcMsg         (struct seq_file *p);
static HI_VOID HIFB_PROC_ReadLogMsg         (struct seq_file *p);

static inline HI_VOID HIFB_PROC_OpenLayer   (HIFB_PAR_S *pstPar);
static inline HI_VOID HIFB_PROC_CloseLayer  (HIFB_PAR_S *pstPar);

/******************************* API relese *******************************************************/
HI_S32 DRV_HIFB_PROC_Create(HI_U32 LayerID)
{
    GFX_PROC_ITEM_S item;
    HI_CHAR entry_name[256] = {'\0'};
    struct fb_info *info = NULL;
    HIFB_PAR_S *par = NULL;

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(LayerID, HI_FAILURE);
    info = s_stLayer[LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);

    par  = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);
    if (HI_TRUE == par->stProcInfo.bCreateProc) { return HI_SUCCESS; }

    snprintf(entry_name, sizeof(entry_name), "hifb%d", LayerID);
    entry_name[sizeof(entry_name) - 1] = '\0';

    item.fnRead   = HIFB_PROC_Read;
    item.fnWrite  = HIFB_PROC_Write;
    item.fnIoctl  = NULL;

    HI_GFX_PROC_AddModule(entry_name, &item, (HI_VOID*)s_stLayer[LayerID].pstInfo);

    par->stProcInfo.bCreateProc = HI_TRUE;

    return HI_SUCCESS;
}

HI_VOID DRV_HIFB_PROC_Destory(HI_U32 LayerID)
{
    HIFB_PAR_S *par = NULL;
    struct fb_info *info = NULL;
    HI_CHAR entry_name[256] = {'\0'};

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerID);
    info = s_stLayer[LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);

    par  = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);
    if (HI_FALSE == par->stProcInfo.bCreateProc) { return; }

    snprintf(entry_name, sizeof(entry_name), "hifb%d", LayerID);
    entry_name[sizeof(entry_name) - 1] = '\0';

    HI_GFX_PROC_RemoveModule(entry_name);

    par->stProcInfo.bCreateProc = HI_FALSE;

    return;
}

static HI_S32 HIFB_PROC_Write(struct file * file,const char __user * buf, size_t count, loff_t *ppos)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar   = NULL;
    HI_CHAR buffer[256]  = {'\0'};
    struct seq_file *seq  = NULL;
    DRV_PROC_ITEM_S *item = NULL;

    /***************************beg check para ***********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(file, 0);
    seq  = file->private_data;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(seq, 0);
    item = seq->private;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(item, 0);
    info = (struct fb_info *)(item->data);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, 0);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, 0);
    /***************************end check para ***********************************/

    if (count >= sizeof(buffer))
    {
        return 0;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(buf, 0);
    if (copy_from_user(buffer, buf, count))
    {
        return 0;
    }
    buffer[sizeof(buffer) - 1] = '\0';

    HIFB_PROC_ParseEchoCmd(pstPar, info->fix.line_length, buffer);

    return count;
}

static HI_VOID HIFB_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue)
{
    HI_CHAR *pReadStr = NULL;

    if (NULL != pBuf) { pReadStr = strstr(pBuf, "="); }

    if ((NULL != pReadStr) && (NULL != pValue))
    {
        *pValue = simple_strtoul((pReadStr + 1), (char **)NULL, 0);
    }

    return;
}

static HI_VOID HIFB_PROC_ParseEchoCmd(HIFB_PAR_S *pstPar, HI_U32 Stride, HI_CHAR *pBuf)
{
    HI_S32 OpenDevCnt  = 0;
    HI_U32 LogLevel = 0;
    HI_U32 LogSave  = 0;
    HI_CHAR *pStr = NULL;
#ifdef CONFIG_HIFB_CAPTURE_BMP_SUPPORT
   HI_U32 CaptureType = 0;
#endif
    /***************************beg check para ***********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pBuf);
    /***************************end check para ***********************************/

    OpenDevCnt = atomic_read(&(pstPar->stBaseInfo.ref_count));
    if ((0 == OpenDevCnt) || (HI_FALSE == pstPar->stProcInfo.bCreateProc)) { return; }

    if (strncmp("help", pBuf, 4) == 0)
    {
        HI_DRV_PROC_EchoHelper("===============================================================\n");
        HI_DRV_PROC_EchoHelper("### help info:\n");
        HI_DRV_PROC_EchoHelper("### ***********************************************************\n");
        HI_DRV_PROC_EchoHelper("### ***********************************************************\n");
        HI_DRV_PROC_EchoHelper("### hifb proc support cmd as follows:\n");
        HI_DRV_PROC_EchoHelper("###     show      : show layer\n");
        HI_DRV_PROC_EchoHelper("###     hide      : hide layer\n");
        HI_DRV_PROC_EchoHelper("###     capture   : capture image from frame buffer\n");
        return;
    }

    if (0 == strncmp("show", pBuf, 4))
    {
        HIFB_PROC_OpenLayer(pstPar);
        return;
    }

    if (0 == strncmp("hide", pBuf, 4))
    {
        HIFB_PROC_CloseLayer(pstPar);
        return;
    }

    if (0 == strncmp("trace_on", pBuf, 8))
    {
        pstPar->stProcInfo.bTrace = HI_TRUE;
        return;
    }

    if (0 == strncmp("trace_off", pBuf, 9))
    {
        pstPar->stProcInfo.bTrace = HI_FALSE;
        return;
    }

    if (0 == strncmp("mute_on", pBuf, 7))
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_OpenMute(pstPar->stBaseInfo.u32LayerID);
        return;
    }

    if (0 == strncmp("mute_off", pBuf, 8))
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_CloseMute(pstPar->stBaseInfo.u32LayerID);
        return;
    }

    if (0 == strncmp("close_interrupt", pBuf, 15))
    {
        pstPar->stProcInfo.bCloseInterrupt = HI_TRUE;
        return;
    }

    if (0 == strncmp("open_interrupt", pBuf, 14))
    {
        pstPar->stProcInfo.bCloseInterrupt = HI_FALSE;
        DRV_HIFB_HAL_GFX_SetInterrupt(HI_TRUE);
        return;
    }

    if (0 == strncmp("discard_times", pBuf, 13))
    {
        HIFB_PROC_Parse(pBuf,&(pstPar->DiscardFrameTimes));
        return;
    }

    if (0 == strncmp("discard", pBuf, 7))
    {
        HIFB_PROC_Parse(pBuf,&(pstPar->bDiscardFrame));
        return;
    }

#ifdef CONFIG_HIFB_CAPTURE_BMP_SUPPORT
    if (0 == strncmp("capture", pBuf, 7))
    {
        HIFB_PROC_Parse(pBuf, &CaptureType);
        if (0 == CaptureType)
        {/** save bmp **/
           HI_UNF_HIFB_CaptureImgFromLayer(pstPar->stBaseInfo.u32LayerID, Stride, HI_FALSE);
        }
        else
        {/** save data **/
           HI_UNF_HIFB_CaptureImgFromLayer(pstPar->stBaseInfo.u32LayerID, Stride, HI_TRUE);
        }
        return;
    }

    if (0 == strncmp("wbc_capture", pBuf, 11))
    {
        HIFB_PROC_Parse(pBuf, &CaptureType);
        if (0 == CaptureType)
        {/** save bmp **/
           HI_UNF_HIFB_CaptureImgFromLayer(OPTM_SLAVER_LAYERID, Stride, HI_FALSE);
        }
        else
        {/** save data **/
           HI_UNF_HIFB_CaptureImgFromLayer(OPTM_SLAVER_LAYERID, Stride, HI_TRUE);
        }
        return;
    }
#endif

    if (0 == strncmp("more_capture", pBuf, 12))
    {
        DRV_HIFB_SNAPSHOT_CaptureRegister();
        return;
    }

    if (0 == strncmp("offset", pBuf, 6))
    {
       HIFB_PROC_SetRegister(pstPar->stBaseInfo.u32LayerID, pBuf);
       return;
    }

    if (0 == strncmp("gfx_log_level", pBuf, 13))
    {
       HIFB_PROC_Parse(pBuf,&LogLevel);
       HI_GFX_SetLogLevel(LogLevel);
       return;
    }

    if (0 == strncmp("gfx_log_save", pBuf, 12))
    {
       HIFB_PROC_Parse(pBuf,&LogSave);
       HI_GFX_SetLogSave(LogSave);
       return;
    }

    if (0 == strncmp("gfx_log_func", pBuf, 12))
    {
       pStr = strstr(pBuf, "=");
       HI_GFX_SetLogFunc(pStr);
       return;
    }

    return;
}

static HI_VOID HIFB_PROC_SetRegister(HI_U32 LayerId, HI_CHAR *pBuf)
{
    HI_CHAR *pReadStr = NULL;
    HI_CHAR *pWriteStr = NULL;
    HI_U32 Offset = 0x0;
    HI_U32 Value  = 0x0;

    if (NULL != pBuf)     { pReadStr = strstr(pBuf, "="); }
    if (NULL == pReadStr) { return; }

    Offset = simple_strtoul((pReadStr + 1), (char **)NULL, 0);
    if (0 != (Offset % 4))
    {
        return;
    }

    pWriteStr = strstr((pReadStr + 1), "=");
    if (NULL == pWriteStr)
    {
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_ReadRegister(Offset, NULL);
        return;
    }

    Value = simple_strtoul((pWriteStr + 1), (char **)NULL, 0);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_WriteRegister(Offset, Value);

    return;
}

static inline HI_VOID HIFB_PROC_CloseLayer(HIFB_PAR_S *pstPar)
{
    if ((NULL != pstPar) && (HI_TRUE == pstPar->stExtendInfo.bShow))
    {
        pstPar->stRunInfo.bModifying = HI_TRUE;
        pstPar->stExtendInfo.bShow   = HI_FALSE;
        pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_SHOW;
        pstPar->stRunInfo.bModifying = HI_FALSE;
    }

    return;
}

static inline HI_VOID HIFB_PROC_OpenLayer(HIFB_PAR_S *pstPar)
{
   if ((NULL != pstPar) && (HI_FALSE == pstPar->stExtendInfo.bShow))
   {
       pstPar->stRunInfo.bModifying = HI_TRUE;
       pstPar->stExtendInfo.bShow   = HI_TRUE;
       pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_SHOW;
       pstPar->stRunInfo.bModifying = HI_FALSE;
   }

   return;
}

static HI_S32 HIFB_PROC_Read(struct seq_file *p, HI_VOID *v)
{
    DRV_PROC_ITEM_S *item = NULL;
    struct fb_info* info = NULL;
    HIFB_PAR_S *par =  NULL;

    /***************************beg check para ***********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(p, HI_FAILURE);
    item = (DRV_PROC_ITEM_S *)(p->private);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(item, HI_FAILURE);
    info = (struct fb_info *)(item->data);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    par = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);
    /***************************end check para ***********************************/

    HIFB_PROC_ReadHdMsg           (par, p, info);
    HIFB_PROC_ReadRefreshMsg      (par, p);

    if (HI_TRUE == par->stProcInfo.bTrace)
    {
        HIFB_PROC_ReadUpCostTimesMsg  (par, p);
        HIFB_PROC_ReadFenceDebugMsg   (par, p);
        HIFB_PROC_ReadWbcMsg          (p);
        HIFB_PROC_ReadLogMsg          (p);
    }

    return HI_SUCCESS;
}

static HI_VOID HIFB_PROC_ReadHdMsg(HIFB_PAR_S *pstPar, struct seq_file *p, struct fb_info *info)
{
    HI_U32 BufNum = 0;
    HI_U32 DispBufStride = 0;
    HI_U32 DispBufSize   = 0;
    HI_U32 CmpStride     = 0;
    HI_BOOL bHDR = HI_FALSE;
    HI_BOOL bPreMult = HI_FALSE;
    HI_BOOL bDePreMult = HI_FALSE;
    HI_BOOL bMask = HI_FALSE;
    HIFB_RECT stOutputRect = {0};
    HIFB_RECT stDispRect = {0};

    if (pstPar->stBaseInfo.u32LayerID >= sizeof(gs_LayerName)/sizeof(*gs_LayerName)) { return; }
    if (pstPar->stExtendInfo.enColFmt >= sizeof(s_pszFmtName)/sizeof(*s_pszFmtName)) { return; }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetOutRect      (pstPar->stBaseInfo.u32LayerID, &stOutputRect);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDispFMTSize  (pstPar->stBaseInfo.u32LayerID, &stDispRect);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerPreMult (pstPar->stBaseInfo.u32LayerID, &bPreMult, &bDePreMult);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerHdr     (pstPar->stBaseInfo.u32LayerID, &bHDR);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetGPMask       (pstPar->stBaseInfo.u32LayerID, &bMask);

    DispBufStride = CONIFG_HIFB_GetMaxStride(pstPar->stExtendInfo.DisplayWidth,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);
    DispBufSize = HI_HIFB_GetMemSize(DispBufStride,pstPar->stExtendInfo.DisplayHeight);

    PROC_PRINT(p,  "************************** hd layer information *****************************\n");
    PROC_PRINT(p,  "LayerId                      \t : %s\n", gs_LayerName[pstPar->stBaseInfo.u32LayerID]);
    PROC_PRINT(p,  "ShowState                    \t : %s\n", pstPar->stExtendInfo.bShow ? "ON" : "OFF");
    PROC_PRINT(p,  "layer mask                   \t : %s\n", (HI_TRUE == bMask)? ("true") : ("false"));
    PROC_PRINT(p,  "IsDecompress                 \t : %s\n", pstPar->bDeCompress ? "yes" : "no");
    PROC_PRINT(p,  "IsStereo                     \t : %s\n", pstPar->st3DInfo.IsStereo ? "yes" : "no");
    PROC_PRINT(p,  "HDR                          \t : %s\n", bHDR ? "yes" : "no");
    PROC_PRINT(p,  "Enable Premult               \t : %s\n", bPreMult ?   "enable" : "disable");
    PROC_PRINT(p,  "Enable DePremult             \t : %s\n", bDePreMult ? "enable" : "disable");

    PROC_PRINT(p,  "[xres,yres]                  \t : (%d, %d)\n", info->var.xres, info->var.yres);
    PROC_PRINT(p,  "(xoffset,yoffset)            \t : (%d, %d)\n", info->var.xoffset, info->var.yoffset);
    PROC_PRINT(p,  "[xres_virtual,yres_virtual]  \t : (%d, %d)\n", info->var.xres_virtual, info->var.yres_virtual);
    PROC_PRINT(p,  "GP0 Output                   \t : (%d, %d,  %d, %d)\n",stDispRect.x, stDispRect.y, stDispRect.w, stDispRect.h);
    PROC_PRINT(p,  "Input ColorFormat            \t : %s\n",       s_pszFmtName[pstPar->stExtendInfo.enColFmt]);
    PROC_PRINT(p,  "Cur HD Disp Addr             \t : 0x%x\n",     pstPar->stRunInfo.CurScreenAddr);
    PROC_PRINT(p,  "fence and reality stride     \t : [%d, %d]\n", pstPar->stProcInfo.HwcRefreshInDispStride,info->fix.line_length);
    PROC_PRINT(p,  "One HD Buffer Size           \t : %d\n",       DispBufSize);
    PROC_PRINT(p,  "Total HD Buffer MemSize      \t : %d KB\n",    info->fix.smem_len / 1024);

    for (BufNum = 0; BufNum < CONFIG_HIFB_LAYER_BUFFER_MAX_NUM; BufNum++)
    {
       PROC_PRINT(p,  "HD %d BUFFER ADDR            \t : [0X%lX,0X%lX]\n", BufNum, \
                                          (unsigned long)info->fix.smem_start + BufNum * DispBufSize,\
                                          (unsigned long)pstPar->u32SmemStartPhy + BufNum * DispBufSize);
    }

    PROC_PRINT(p, "**************************************************************************\n");
    return;
}

static HI_VOID HIFB_PROC_ReadRefreshMsg(HIFB_PAR_S *pstPar, struct seq_file *p)
{
    PROC_PRINT(p,  "************************** refresh information ***************************\n");

    PROC_PRINT(p,  "sync type                  \t : %s\n", pstPar->hifb_sync ? "fence" : "vblank");

    PROC_PRINT(p,  "flip fps                   \t : %d\n", pstPar->stFrameInfo.FlipFps);

    PROC_PRINT(p,  "draw fps                   \t : %d\n", pstPar->stFrameInfo.DrawFps);

    if (HI_TRUE == pstPar->bDiscardFrame)
    {
        PROC_PRINT(p,  "whether discard frame      \t : yes\n");
    }
    else
    {
        PROC_PRINT(p,  "whether discard frame      \t : %s\n", (HI_TRUE == pstPar->bProcDiscardFrame)? "yes" : "no");
    }

    PROC_PRINT(p,  "repeat refresh frame times \t : %ld\n", pstPar->stFrameInfo.RepeatFrameCnt);

    if (HI_TRUE == pstPar->hifb_sync)
    {
         PROC_PRINT(p,  "refresh mode               \t : %s\n", "fb-hwc-refresh");
         goto FINISH_EXIT;
    }

    switch (pstPar->stExtendInfo.enBufMode)
    {
        case HIFB_LAYER_BUF_DOUBLE:
            PROC_PRINT(p,  "refresh mode               \t : %s\n", "(fb-double)-(higo-over-or-butt)");
            break;
        case HIFB_LAYER_BUF_ONE:
            PROC_PRINT(p,  "refresh mode               \t : %s\n", "(fb-one)-(higo-double)");
            break;
        case HIFB_LAYER_BUF_NONE:
            PROC_PRINT(p,  "refresh mode               \t : %s\n", "(fb-zero)-(higo-normal)");
            break;
        case HIFB_LAYER_BUF_DOUBLE_IMMEDIATE:
            PROC_PRINT(p,  "refresh mode               \t : %s\n", "(fb-doulbe-immediate)(sync)-(higo-flip)");
            break;
        case HIFB_LAYER_BUF_STANDARD:
            PROC_PRINT(p,  "refresh mode               \t : %s\n", "pandisplay");
            break;
        case HIFB_LAYER_BUF_FENCE:
            PROC_PRINT(p,  "refresh mode               \t : %s\n", "(fb-double)-(higo-fence)");
            break;
        default:
            break;
    }

FINISH_EXIT:
    PROC_PRINT(p, "**************************************************************************\n");
    return;
}

static HI_VOID HIFB_PROC_ReadUpCostTimesMsg(HIFB_PAR_S *pstPar, struct seq_file *p)
{
    PROC_PRINT(p,  "************************** refresh cost times ****************************\n");

    /** 刷新函数执行的时间 **/
    PROC_PRINT(p,  "run refresh func cost times            \t : %dms\n",  pstPar->stFrameInfo.RunRefreshTimeMs);

    /** 刷新函数前后进入的时间差 **/
    PROC_PRINT(p,  "into refresh func cur - pre cost times \t : %dms\n",  pstPar->stFrameInfo.TwiceRefreshTimeMs);

    if (HI_TRUE == pstPar->stFrameInfo.bBlitBlock)
    {
        /** 硬件搬移是否阻塞 **/
        PROC_PRINT(p,  "hard blit whether block                \t : yes\n");
        /** 阻塞时间 **/
        PROC_PRINT(p,  "hard blit block times                  \t : %dms\n",  pstPar->stFrameInfo.BlockTime);
    }
    else
    {
        /** 硬件搬移是否阻塞 **/
        PROC_PRINT(p,  "hard blit whether block                \t : no\n");
    }

    PROC_PRINT(p, "**************************************************************************\n");
    return;
}

static HI_VOID HIFB_PROC_ReadFenceDebugMsg(HIFB_PAR_S *pstPar, struct seq_file *p)
{
#ifdef CONFIG_HIFB_FENCE_SUPPORT
    HI_U32 RegUpdateCnt = 0;
    DRV_HIFB_FENCE_GetRegUpCnt(&RegUpdateCnt);
#endif
    PROC_PRINT(p,  "************************** fence information *****************************\n");

    /** VO CALLBACK 期望产生中断的行数 **/
    PROC_PRINT(p,  "vo callback expect interrupt lines     \t : %ld\n",  pstPar->stFrameInfo.ExpectIntLineNumsForVoCallBack);

    /** VO CALLBACK 实际产生中断的行数 **/
    PROC_PRINT(p,  "vo callback actual interrupt lines     \t : %ld\n",  pstPar->stFrameInfo.ActualIntLineNumsForVoCallBack);

    /** VO CALLBACK 函数执行的时间 **/
    PROC_PRINT(p,  "vo callback run max cost times         \t : %dms\n", pstPar->stFrameInfo.RunMaxTimeMs);

    /** VO CALLBACK 前后进入的时间差 **/
    PROC_PRINT(p,  "vo callback cur - pre max cost times   \t : %dms\n", pstPar->stFrameInfo.MaxTimeMs);

    /** VO CALLBACK硬件中断函数执行的次数，只有8bit，所以最大是255，又从0开始统计 **/
    PROC_PRINT(p,  "vo callback hard interupt times        \t : %ld\n",  pstPar->stFrameInfo.HardIntCntForVoCallBack);

    /** VO CALLBACK软件中断上报的次数 **/
    PROC_PRINT(p,  "run vo callback func times             \t : %ld\n",  pstPar->stFrameInfo.VoSoftCallBackCnt);

#ifdef CONFIG_HIFB_FENCE_SUPPORT
    /** FRAMEEND CALLBACK 期望产生中断的行数 **/
    PROC_PRINT(p,  "frame callback expect interrupt lines  \t : %ld\n",  pstPar->stFrameInfo.ExpectIntLineNumsForEndCallBack);

    /** FRAMEEND CALLBACK 实际产生中断的行数 **/
    PROC_PRINT(p,  "frame callback actual interrupt lines  \t : %ld\n",  gs_SyncInfo.ActualIntLineNumsForEndCallBack);

    /** FRAMEEND CALLBACK 函数执行的时间 **/
    PROC_PRINT(p,  "frame callback run max cost times      \t : %dms\n", gs_SyncInfo.RunMaxTimeMs);

    /** FRAMEEND CALLBACK 前后进入的时间差 **/
    PROC_PRINT(p,  "frame callback cur - pre max cost times\t : %dms\n", gs_SyncInfo.MaxTimeMs);

    /** FRAMEEND CALLBACK硬件中断上报的次数，只有8bit，所以最大是255，又从0开始统计 **/
    PROC_PRINT(p,  "frame callback hard interupt times     \t : %ld\n",  gs_SyncInfo.HardIntCntForEndCallBack);

    /** FRAMEEND CALLBACK软件中断函数执行的次数 **/
    PROC_PRINT(p,  "run frame callback func times          \t : %ld\n",  gs_SyncInfo.EndSoftCallBackCnt);

    /** 调用刷新的次数 **/
    PROC_PRINT(p,  "refresh times                          \t : %d\n",   pstPar->FenceRefreshCount);

    /** 实际寄存器更新的次数，和刷新次数对比 **/
    PROC_PRINT(p,  "updata regiter times                   \t : %d\n",   RegUpdateCnt);

    /** AR数据解压出错的次数 **/
    PROC_PRINT(p,  "ar data decompress err times           \t : %ld\n",  pstPar->stFrameInfo.ARDataDecompressErrCnt);

    /** GB数据解压出错的次数 **/
    PROC_PRINT(p,  "gb data decompress err times           \t : %ld\n",  pstPar->stFrameInfo.GBDataDecompressErrCnt);

    /** fence信息 **/
    PROC_PRINT(p,  "fence[release_fd][FenceValue][TimeLine]\t : [%d][%d][%d]\n",gs_SyncInfo.ReleaseFenceFd, gs_SyncInfo.FenceValue, gs_SyncInfo.TimeLine);
#endif

    PROC_PRINT(p,  "**************************************************************************\n");

    return;
}

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
extern HI_VOID DRV_HIFB_WBC_GetWriteBuffer(HI_U32* pAddr, HI_U32* pStride);
extern DRV_HIFB_WBC_GFX_S g_stGfxWbc2;
#endif
static HI_VOID HIFB_PROC_ReadWbcMsg(struct seq_file *p)
{
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    HI_BOOL bMask = HI_FALSE;
    HI_BOOL bLayerEnable = HI_FALSE;
    HI_U32 ReadMode = 0;
    HI_U32 WbcWorkEnable = 0, WbcWorkState = 0;
    HI_U32 WbcReadAddr = 0, WbcWriteAddr = 0, WbcWriteStride = 0;
    HIFB_RECT stRect = {0};

    DRV_HIFB_WBC_GetWriteBuffer(&WbcWriteAddr, &WbcWriteStride);

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerAddr (HIFB_LAYER_SD_0, &WbcReadAddr);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetEnable    (HIFB_LAYER_SD_0, &bLayerEnable);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerRect (HIFB_LAYER_SD_0, &stRect);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetGPMask    (HIFB_LAYER_SD_0, &bMask);

    DRV_HIFB_HAL_GFX_GetReadMode(g_pstGfxDevice[HIFB_LAYER_SD_0]->enGfxHalId, &ReadMode);
    DRV_HIFB_HAL_WBC_GP_GetWorkEnable(g_stGfxWbc2.enWbcHalId, &WbcWorkEnable, &WbcWorkState);

    PROC_PRINT(p, "*************************** wbc msg **************************************\n");
    PROC_PRINT(p,  "layer enable                   \t : %s\n",     (HI_TRUE == bLayerEnable)? ("true") : ("false"));
    PROC_PRINT(p,  "wbc work enable                \t : %s\n",     (1 == WbcWorkEnable)? ("true") : ("false"));
    PROC_PRINT(p,  "wbc work state                 \t : %s\n",     (0 == WbcWorkState)? ("finish") : ("busy"));
    PROC_PRINT(p,  "layer mask                     \t : %s\n",     (HI_TRUE == bMask)? ("true") : ("false"));
    PROC_PRINT(p,  "wbc finish hinterupt cnt       \t : %d\n",     g_stGfxWbc2.WbcIntCnt);
    PROC_PRINT(p,  "layer read buffer              \t : 0X%X\n",   WbcReadAddr);
    PROC_PRINT(p,  "wbc_gp write buffer            \t : 0X%X\n",   WbcWriteAddr);
    PROC_PRINT(p,  "wbc_gp write stride            \t : %d\n",     WbcWriteStride);
    PROC_PRINT(p,  "layer resolution               \t : [%d,%d][%d,%d]\n", stRect.x,stRect.y,stRect.w,stRect.h);
    PROC_PRINT(p,  "layer data fmt is              \t : AYCbCr8888\n");
    PROC_PRINT(p,  "layer read mod                 \t : %d\n",     ReadMode);
    #ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    PROC_PRINT(p,  "whether use field buffer       \t : %s\n",     (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)? ("true") : ("false"));
    PROC_PRINT(p,  "whether write bottom_filed_buf \t : %s\n",     (HI_TRUE == g_stGfxWbc2.bIsWriteBottomField)? ("true") : ("false"));
    PROC_PRINT(p, "**************************************************************************\n");
    #endif
#else
    HI_UNUSED(p);
#endif
    return;
}

static HI_VOID HIFB_PROC_ReadLogMsg(struct seq_file *p)
{
    PROC_PRINT(p, "*************************** debug msg ************************************\n");
    HI_GFX_ProcMsg(p);
    PROC_PRINT(p, "**************************************************************************\n");
    return;
}
#endif
