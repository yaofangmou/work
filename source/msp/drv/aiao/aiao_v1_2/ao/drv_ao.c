/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : drv_ao.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2013/04/17
  Description   :
  History       :
  1.Date        : 2013/04/17
    Author      :
    Modification: Created file

******************************************************************************/

/******************************* Include Files *******************************/

/* Sys headers */
#include <linux/version.h>
#include <linux/proc_fs.h>
#include <linux/ioport.h>
#include <linux/string.h>
#include <linux/ioctl.h>
#include <linux/fs.h>
#include <linux/delay.h>
#include <linux/sched.h>
#include <linux/vmalloc.h>
#include <linux/interrupt.h>
#include <linux/seq_file.h>
#include <asm/uaccess.h>
#include <asm/io.h>

/* Unf headers */
#include "hi_error_mpi.h"
#include "hi_drv_module.h"
#include "hi_drv_proc.h"

/* Drv headers */
#include "hi_aiao_log.h"
#include "hi_drv_ao.h"
#include "hi_drv_ai.h"
#include "drv_ao_ioctl.h"
#include "drv_ao_ext.h"
#include "drv_ao_private.h"
#include "drv_ao_engine.h"

#include "hi_audsp_aoe.h"
#include "hal_aoe.h"
#include "hal_cast.h"
#include "hal_aiao.h"

#include "drv_ao_op.h"
#include "drv_ao_track.h"
#include "audio_util.h"
#if defined (HI_AUDIO_AI_SUPPORT)
#include "drv_ai_private.h"
#endif

#include "drv_hdmi_ext.h"
#include "drv_ao_cast.h"
#include "hi_drv_file.h"

#ifdef HI_ALSA_AO_SUPPORT
#include <linux/platform_device.h>

#ifdef CONFIG_PM
extern int snd_soc_suspend(struct device* dev); //kernel inteface
extern int snd_soc_resume(struct device* dev);
static  HI_BOOL bu32shallowSuspendActive = HI_FALSE;
#endif

extern struct platform_device* hisi_snd_device;

#define PM_LOW_SUSPEND_FLAG   0x5FFFFFFF
#endif

#ifdef HI_AIAO_TIMER_SUPPORT
#include "drv_timer_private.h"
#endif

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define PAGE_NUM_SHIFT     3 /* it depends on how many pages can be maped, 0:one page, 1:two pages, 2:four pages, 3: eight pages */
#define AIAO_MAP_PAGE_NUM  (1ULL << PAGE_NUM_SHIFT)
#define AIAO_MAP_MASK      (((AIAO_MAP_PAGE_NUM) << PAGE_SHIFT) - 1)
#define AIAO_REG_BASE      (0xF8CD0000)
#define DSP_SHARESRAM_BASEADDR (0xF9868000)

static struct file g_filp;

#ifdef HI_PROC_SUPPORT
static HI_S32   AO_RegProc(HI_U32 u32Snd);
static HI_VOID  AO_UnRegProc(HI_U32 u32Snd);
static HI_S32   AO_DRV_ReadProc(struct seq_file* file, HI_VOID* v);
static HI_S32   AO_DRV_WriteProc(struct file* file, const char __user* buf, size_t count, loff_t* ppos);
#endif

HI_S32 AO_DRV_Resume(PM_BASEDEV_S* pdev);
HI_S32 AO_DRV_Suspend(PM_BASEDEV_S* pdev, pm_message_t state);
HI_S32 AO_Track_GetDefAttr(HI_UNF_AUDIOTRACK_ATTR_S* pstDefAttr);
HI_S32 AO_Track_AllocHandle(HI_UNF_SND_E enSound, HI_UNF_SND_TRACK_TYPE_E enTrackType, struct file* pstFile, HI_HANDLE* phHandle);
HI_VOID AO_Track_FreeHandle(HI_HANDLE hHandle);
HI_S32 AO_Track_PreCreate(HI_UNF_SND_E enSound, HI_UNF_AUDIOTRACK_ATTR_S* pstAttr,
                          HI_BOOL bAlsaTrack, AO_BUF_ATTR_S* pstBuf, HI_HANDLE hTrack);
HI_S32 AO_Track_Destory(HI_U32 u32TrackID);
HI_S32 AO_Track_Start(HI_U32 u32TrackID);
HI_S32 AO_Track_Stop(HI_U32 u32TrackID);
HI_S32 AO_Track_SendData(HI_U32 u32TrackID, AO_FRAMEINFO_S* pstAOFrame);
HI_S32 AO_Track_GetDelayMs(HI_U32 u32TrackID, HI_U32* pu32DelayMs);
#ifdef HI_PROC_SUPPORT
HI_S32 AO_DRV_Kopen(struct file* file);
HI_S32 AO_DRV_Krelease(struct file* file);
HI_S32 AO_Snd_Kclose(HI_UNF_SND_E arg, struct file* file);
#endif

DEFINE_SEMAPHORE(g_AoMutex);

/**
 * AO_DRV_GetPllCfg - read EPLL frac and int register cfg
 * @pu32Frac:    EPLL frac register cfg.
 * @pu32Int:     EPLL int  register cfg.
 * @return:      HI_SUCCESS or HI_FAILURE.
 */
static HI_S32 AO_DRV_GetPllCfg(HI_U32* pu32Frac, HI_U32* pu32Int)
{
    CHECK_AO_NULL_PTR(pu32Frac);
    CHECK_AO_NULL_PTR(pu32Int);

    return AUTIL_GetPllCfg(pu32Frac, pu32Int);
}

static AO_GLOBAL_PARAM_S s_stAoDrv =
{
    .u32TrackNum         =  0,
    .u32SndNum           =  0,
    .bLowLatencyCreated  =  HI_FALSE,
    .atmOpenCnt          = ATOMIC_INIT(0),
    .bReady              = HI_FALSE,

#ifdef HI_PROC_SUPPORT
    .stProcParam         =
    {
        .pfnReadProc     = AO_DRV_ReadProc,
        .pfnWriteProc    = AO_DRV_WriteProc,
    },
#endif

    .pstPDMFunc          = HI_NULL,
    .stExtFunc           =
    {
        .pfnAO_DrvResume = AO_DRV_Resume,
        .pfnAO_DrvSuspend = AO_DRV_Suspend,
        .pfnAO_DrvGetPllCfg = AO_DRV_GetPllCfg,

        .pfnAO_TrackGetDefAttr = AO_Track_GetDefAttr,
        .pfnAO_TrackAllocHandle = AO_Track_AllocHandle,
        .pfnAO_TrackFreeHandle = AO_Track_FreeHandle,

        .pfnAO_TrackCreate = AO_Track_PreCreate,
        .pfnAO_TrackDestory = AO_Track_Destory,
        .pfnAO_TrackStart = AO_Track_Start,
        .pfnAO_TrackStop = AO_Track_Stop,
        .pfnAO_TrackSendData = AO_Track_SendData,
    }
};

/***************************** Original Static Definition *****************************/
static SND_CARD_STATE_S* SND_CARD_GetCard(HI_UNF_SND_E enSound)
{
    if (HI_UNF_SND_BUTT <= enSound)
    {
        HI_WARN_AO("Invalid snd id %d\n", enSound);
        return HI_NULL;
    }

    return s_stAoDrv.astSndEntity[enSound].pCard;
}

static HI_UNF_SND_E SND_CARD_GetSnd(SND_CARD_STATE_S* pCard)
{
    HI_U32 i;

    for (i = 0; i < AO_MAX_TOTAL_SND_NUM; i++)
    {
        if (s_stAoDrv.astSndEntity[i].pCard == pCard)
        {
            return i;
        }
    }

    return AO_MAX_TOTAL_SND_NUM;
}

static HI_VOID AO_Snd_FreeHandle(HI_UNF_SND_E enSound, struct file* filp)
{
    SND_CARD_STATE_S* pCard = s_stAoDrv.astSndEntity[enSound].pCard;
    HI_U32 u32FileId;
    DRV_AO_STATE_S* pAOState = HI_NULL;

    if (HI_NULL == pCard)
    {
        return;
    }

    if (0 == atomic_read(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
    {
        AUTIL_AO_FREE(HI_ID_AO, pCard);
        s_stAoDrv.astSndEntity[enSound].pCard = HI_NULL;
        s_stAoDrv.u32SndNum--;
    }

    if (HI_NULL == filp)
    {
        return;
    }

    pAOState = (DRV_AO_STATE_S*)filp->private_data;
    if (HI_NULL == pAOState)
    {
        return;
    }

    u32FileId = pAOState->u32FileId[enSound];
    if (u32FileId < SND_MAX_OPEN_NUM)
    {
        s_stAoDrv.astSndEntity[enSound].pstFile[u32FileId] = HI_NULL;
    }

    pAOState->u32FileId[enSound] = AO_SND_FILE_NOUSE_FLAG;
}

static HI_S32 SNDGetFreeFileId(HI_UNF_SND_E enSound)
{
    HI_U32 i;

    for (i = 0; i < SND_MAX_OPEN_NUM; i++)
    {
        if (s_stAoDrv.astSndEntity[enSound].pstFile[i] == HI_NULL)
        {
            return i;
        }
    }

    return SND_MAX_OPEN_NUM;
}

static HI_S32 AO_Snd_AllocHandle(HI_UNF_SND_E enSound, struct file* pstFile)
{
    SND_CARD_STATE_S* pCard = HI_NULL;
    HI_U32 u32FreeId;

    if (enSound >= HI_UNF_SND_BUTT)
    {
        HI_ERR_AO("Bad param!\n");
        return HI_ERR_AO_INVALID_ID;
    }

    /* Check ready flag */
    if (s_stAoDrv.bReady != HI_TRUE)
    {
        HI_ERR_AO("Need open first!\n");
        return HI_ERR_AO_DEV_NOT_OPEN;
    }

    u32FreeId = SNDGetFreeFileId(enSound);
    if (u32FreeId >= SND_MAX_OPEN_NUM)
    {
        HI_ERR_AO("Get free file id failed!\n");
        return HI_FAILURE;
    }

    if (AO_SND_FILE_NOUSE_FLAG == ((DRV_AO_STATE_S*)(pstFile->private_data))->u32FileId[enSound])
    {
        ((DRV_AO_STATE_S*)(pstFile->private_data))->u32FileId[enSound] = u32FreeId;
        s_stAoDrv.astSndEntity[enSound].pstFile[u32FreeId] = pstFile;
    }

    /* Allocate new snd resource */
    if (0 == atomic_read(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
    {
        pCard = (SND_CARD_STATE_S*)AUTIL_AO_MALLOC(HI_ID_AO, sizeof(SND_CARD_STATE_S), GFP_KERNEL);
        if (HI_NULL == pCard)
        {
            HI_ERR_AO("Kmalloc card failed!\n");
            s_stAoDrv.astSndEntity[enSound].pstFile[u32FreeId] = HI_NULL;
            return HI_FAILURE;
        }
        memset(pCard, 0, sizeof(SND_CARD_STATE_S));

        s_stAoDrv.astSndEntity[enSound].pCard = pCard;
        s_stAoDrv.u32SndNum++;
    }

    return HI_SUCCESS;
}

/******************************Snd process FUNC*************************************/
static HI_BOOL AOCheckOutPortIsAttached(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort)
{
    HI_U32 u32Snd;
    HI_U32 u32Port;
    SND_CARD_STATE_S* pCard;

    // check if port is attached by another sound
    for (u32Snd = 0; u32Snd < (HI_U32)HI_UNF_SND_BUTT; u32Snd++)
    {
        if (u32Snd == (HI_U32)enSound)
        {
            continue;
        }

        pCard = SND_CARD_GetCard((HI_UNF_SND_E)u32Snd);
        if (HI_NULL == pCard)
        {
            continue;
        }

        for (u32Port = 0; u32Port < pCard->stUserOpenParam.u32PortNum; u32Port++)
        {
            if (enOutPort == pCard->stUserOpenParam.stOutport[u32Port].enOutPort)
            {
                return HI_TRUE;
            }
        }
    }

    return HI_FALSE;
}

#if 0
static HI_VOID AOGetI2SDefOpenAttr(HI_UNF_I2S_ATTR_S* pstAttr)
{
    pstAttr->bMaster = HI_TRUE;
    pstAttr->enI2sMode = HI_UNF_I2S_STD_MODE;
    pstAttr->enMclkSel = HI_UNF_I2S_MCLK_256_FS;
    pstAttr->enBclkSel = HI_UNF_I2S_BCLK_4_DIV;
    pstAttr->enChannel = HI_UNF_I2S_CHNUM_2;
    pstAttr->enBitDepth = HI_UNF_I2S_BIT_DEPTH_16;
    pstAttr->bPcmSampleRiseEdge = HI_TRUE;
    pstAttr->enPcmDelayCycle = HI_UNF_I2S_PCM_1_DELAY;
}
#endif

static HI_S32 AOGetOpenAttrFromPDM(AO_SND_OpenDefault_Param_S* pstSndDefaultAttr)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 i = 0;
    HI_U32 u32PortNum = 0;
    HI_UNF_PDM_SOUND_PARAM_S stSoundPdmParam;

    if (!(s_stAoDrv.pstPDMFunc && s_stAoDrv.pstPDMFunc->pfnGetSoundParam))
    {
        HI_WARN_AO("Get PDMFunc Symbol failed, use default param!\n");
        return HI_FAILURE;
    }

    s32Ret = (s_stAoDrv.pstPDMFunc->pfnGetSoundParam)(pstSndDefaultAttr->enSound, &stSoundPdmParam);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_AO("Get PDM param failed, use default param!\n");
        return s32Ret;
    }

    if (HI_UNF_SND_OUTPUTPORT_MAX < stSoundPdmParam.u32PortNum || 0 == stSoundPdmParam.u32PortNum)
    {
        HI_ERR_AO("Get PDM param invalid u32PortNum = 0x%x\n", stSoundPdmParam.u32PortNum);
        return HI_ERR_AO_INVALID_PARA;
    }

    for (i = 0; i < stSoundPdmParam.u32PortNum; i++)
    {
        pstSndDefaultAttr->stAttr.stOutport[u32PortNum].enOutPort = stSoundPdmParam.stOutport[i].enOutPort;
        switch (stSoundPdmParam.stOutport[i].enOutPort)
        {
            case HI_UNF_SND_OUTPUTPORT_DAC0:
                HI_INFO_AO(">> HI_UNF_SND_OUTPUTPORT_DAC0\n");
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stDacAttr.u32Reserved = HI_NULL;
                u32PortNum++;
                break;

#ifdef HI_SND_SPDIF_SUPPORT
            case HI_UNF_SND_OUTPUTPORT_SPDIF0:
                HI_INFO_AO(">> HI_UNF_SND_OUTPUTPORT_SPDIF0\n");
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stSpdifAttr.u32Reserved = HI_NULL;
                u32PortNum++;
                break;
#endif
            case HI_UNF_SND_OUTPUTPORT_HDMI0:
                HI_INFO_AO(">> HI_UNF_SND_OUTPUTPORT_HDMI0\n");
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stHDMIAttr.u32Reserved = HI_NULL;
                u32PortNum++;
                break;

            case HI_UNF_SND_OUTPUTPORT_I2S0:    //default support
                HI_INFO_AO(">> HI_UNF_SND_OUTPUTPORT_I2S0\n");
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bMaster = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.bMaster;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enI2sMode = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enI2sMode;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enMclkSel = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enMclkSel;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBclkSel = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enBclkSel;
                /*Compatible with old base param,  force to 2ch output */
                //pstSndDefaultAttr->stAttr.stOutport[i].unAttr.stI2sAttr.stAttr.enChannel = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enChannel;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enChannel = HI_UNF_I2S_CHNUM_2;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBitDepth = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enBitDepth;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bPcmSampleRiseEdge = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.bPcmSampleRiseEdge;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enPcmDelayCycle = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enPcmDelayCycle;
                HI_INFO_AO("bMaster:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bMaster);
                HI_INFO_AO("enI2sMode:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enI2sMode);
                HI_INFO_AO("enMclkSel:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enMclkSel);
                HI_INFO_AO("enBclkSel:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBclkSel);
                HI_INFO_AO("enChannel:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enChannel);
                HI_INFO_AO("enBitDepth:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBitDepth);
                HI_INFO_AO("bPcmSampleRiseEdge:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bPcmSampleRiseEdge);
                HI_INFO_AO("enPcmDelayCycle:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enPcmDelayCycle);
                u32PortNum++;
                break;

            case HI_UNF_SND_OUTPUTPORT_I2S1:    //default support
                HI_INFO_AO(">> HI_UNF_SND_OUTPUTPORT_I2S1\n");
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bMaster = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.bMaster;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enI2sMode = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enI2sMode;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enMclkSel = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enMclkSel;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBclkSel = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enBclkSel;
                /* I2S do not support 1&8 channel output, so force to 2ch output */
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enChannel = HI_UNF_I2S_CHNUM_2;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBitDepth = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enBitDepth;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bPcmSampleRiseEdge = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.bPcmSampleRiseEdge;
                pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enPcmDelayCycle = stSoundPdmParam.stOutport[i].unAttr.stI2sAttr.stAttr.enPcmDelayCycle;
                HI_INFO_AO("bMaster:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bMaster);
                HI_INFO_AO("enI2sMode:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enI2sMode);
                HI_INFO_AO("enMclkSel:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enMclkSel);
                HI_INFO_AO("enBclkSel:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBclkSel);
                HI_INFO_AO("enChannel:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enChannel);
                HI_INFO_AO("enBitDepth:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enBitDepth);
                HI_INFO_AO("bPcmSampleRiseEdge:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.bPcmSampleRiseEdge);
                HI_INFO_AO("enPcmDelayCycle:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].unAttr.stI2sAttr.stAttr.enPcmDelayCycle);
                u32PortNum++;
                break;

            default:
                HI_WARN_AO("SND Not support OUTPUTPORT:0x%x\n", pstSndDefaultAttr->stAttr.stOutport[u32PortNum].enOutPort);
                break;
        }
    }

    pstSndDefaultAttr->stAttr.u32PortNum = u32PortNum;
    pstSndDefaultAttr->stAttr.enSampleRate = HI_UNF_SAMPLE_RATE_48K;

    return HI_SUCCESS;
}

/*
 * use bootargs to contrl audio output ports:
 * 1. example: "audio=noadac,nospdif",then adac and spdif will be closed
 * 2. if audio is not set in bootargs, then use default setting
 * 3. audio_options_string is defined in kernel
 */
extern char* audio_options_string;

static HI_S32 AOGetOpenAttrFromBootargs(AO_SND_OpenDefault_Param_S* pstAttr)
{
    if (HI_NULL == audio_options_string)
    {
        return HI_FAILURE;
    }

    pstAttr->stAttr.u32PortNum = 0;

    if (HI_NULL == strstr(audio_options_string, "noadac"))
    {
        pstAttr->stAttr.stOutport[pstAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_DAC0;
        pstAttr->stAttr.stOutport[pstAttr->stAttr.u32PortNum].unAttr.stDacAttr.u32Reserved = HI_NULL;
        pstAttr->stAttr.u32PortNum++;
    }

#ifdef HI_SND_SPDIF_SUPPORT
    if (HI_NULL == strstr(audio_options_string, "nospdif"))
    {
        pstAttr->stAttr.stOutport[pstAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_SPDIF0;
        pstAttr->stAttr.stOutport[pstAttr->stAttr.u32PortNum].unAttr.stSpdifAttr.u32Reserved = HI_NULL;
        pstAttr->stAttr.u32PortNum++;
    }
#endif

    if (HI_NULL == strstr(audio_options_string, "nohdmi"))
    {
        pstAttr->stAttr.stOutport[pstAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_HDMI0;
        pstAttr->stAttr.stOutport[pstAttr->stAttr.u32PortNum].unAttr.stHDMIAttr.u32Reserved = HI_NULL;
        pstAttr->stAttr.u32PortNum++;
    }

    if (0 == pstAttr->stAttr.u32PortNum)
    {
        HI_ERR_AO("Invalid audio close port bootargs setting!\n");
        return HI_FAILURE;
    }

    pstAttr->stAttr.enSampleRate = HI_UNF_SAMPLE_RATE_48K;

    return HI_SUCCESS;
}

HI_S32 AOGetSndDefOpenAttr(AO_SND_OpenDefault_Param_S* pstSndDefaultAttr)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = AOGetOpenAttrFromBootargs(pstSndDefaultAttr);
    if (HI_SUCCESS == s32Ret)
    {
        return HI_SUCCESS;
    }

    s32Ret = AOGetOpenAttrFromPDM(pstSndDefaultAttr);
    if (HI_SUCCESS == s32Ret)
    {
        return HI_SUCCESS;
    }

    pstSndDefaultAttr->stAttr.u32PortNum = 0;

    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_DAC0;
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].unAttr.stDacAttr.u32Reserved = HI_NULL;
    pstSndDefaultAttr->stAttr.u32PortNum++;

#ifdef HI_SND_SPDIF_SUPPORT
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_SPDIF0;
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].unAttr.stSpdifAttr.u32Reserved = HI_NULL;
    pstSndDefaultAttr->stAttr.u32PortNum++;
#endif

    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_HDMI0;
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].unAttr.stHDMIAttr.u32Reserved = HI_NULL;
    pstSndDefaultAttr->stAttr.u32PortNum++;

    pstSndDefaultAttr->stAttr.enSampleRate = HI_UNF_SAMPLE_RATE_48K;

#if 0 //#if defined(HI_I2S0_SUPPORT)
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_I2S0;
    AOGetI2SDefOpenAttr(&pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].unAttr.stI2sAttr.stAttr);
    pstSndDefaultAttr->stAttr.u32PortNum++;
#endif

#if 0 //#if defined(HI_I2S1_SUPPORT)
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].enOutPort = HI_UNF_SND_OUTPUTPORT_I2S1;
    AOGetI2SDefOpenAttr(&pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].unAttr.stI2sAttr.stAttr);
    pstSndDefaultAttr->stAttr.stOutport[pstSndDefaultAttr->stAttr.u32PortNum].unAttr.stI2sAttr.stAttr.enBitDepth = HI_UNF_I2S_BIT_DEPTH_24;  //connet AMP, use 24bit avoiding little signal noise
    pstSndDefaultAttr->stAttr.u32PortNum++;
#endif

    return HI_SUCCESS;
}

static HI_BOOL AOCheckOutPortIsValid(HI_UNF_SND_OUTPUTPORT_E enOutPort)
{
#if    defined(CHIP_TYPE_hi3716cv200)   \
    || defined(CHIP_TYPE_hi3716mv400)   \
    || defined(CHIP_TYPE_hi3718cv100)   \
    || defined(CHIP_TYPE_hi3719cv100)   \
    || defined(CHIP_TYPE_hi3719mv100_a) \
    || defined(CHIP_TYPE_hi3798cv100)   \
    || defined(CHIP_TYPE_hi3798mv100)   \
    || defined(CHIP_TYPE_hi3796mv100)
    if ((HI_UNF_SND_OUTPUTPORT_DAC0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_SPDIF0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_HDMI0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_I2S0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_I2S1 != enOutPort))
    {
        HI_ERR_AO("just support I2S0, I2S1, DAC0, SPDIF0 and HDMI0 Port!\n");
        return HI_FALSE;
    }
#elif    defined(CHIP_TYPE_hi3719mv100)   \
      || defined(CHIP_TYPE_hi3718mv100)   \
      || defined(CHIP_TYPE_hi3798cv200_a) \
      || defined(CHIP_TYPE_hi3798cv200_b) \
      || defined(CHIP_TYPE_hi3798cv200)   \
      || defined(CHIP_TYPE_hi3798mv200)   \
      || defined(CHIP_TYPE_hi3798mv300)   \
      || defined(CHIP_TYPE_hi3716mv420)   \
      || defined(CHIP_TYPE_hi3796mv200)   \
      || defined(CHIP_TYPE_hi3716mv450)   \
      || defined(CHIP_TYPE_hi3798mv310)
    if ((HI_UNF_SND_OUTPUTPORT_DAC0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_SPDIF0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_HDMI0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_I2S0 != enOutPort))
    {
        HI_ERR_AO("just support I2S0, DAC0, SPDIF0 and HDMI0 Port!\n");
        return HI_FALSE;
    }
#elif    defined(CHIP_TYPE_hi3716mv410)   \
      || defined(CHIP_TYPE_hi3716mv430)
    if ((HI_UNF_SND_OUTPUTPORT_DAC0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_SPDIF0 != enOutPort) &&
        (HI_UNF_SND_OUTPUTPORT_HDMI0 != enOutPort))
    {
        HI_ERR_AO("just support DAC0, SPDIF0 and HDMI0 Port!\n");
        return HI_FALSE;
    }
#elif defined(CHIP_TYPE_hi3751v100)  || defined(CHIP_TYPE_hi3751v100b)
    if ((HI_UNF_SND_OUTPUTPORT_DAC0 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_EXT_DAC1 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_EXT_DAC2 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_EXT_DAC3 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_SPDIF0 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_I2S0 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_I2S1 != enOutPort))
    {
        HI_ERR_AO("just support I2S0, I2S1, DAC0, DAC1, DAC2, DAC3 and SPDIF0 Port!\n");
        return HI_FALSE;
    }
#elif defined(CHIP_TYPE_hi3751v600) || defined (CHIP_TYPE_hi3751lv500) || defined(CHIP_TYPE_hi3751v620)
    if ((HI_UNF_SND_OUTPUTPORT_DAC0 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_EXT_DAC1 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_EXT_DAC2 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_SPDIF0 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_I2S0 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_I2S1 != enOutPort))
    {
        HI_ERR_AO("just support I2S0, I2S1, DAC0, DAC1, DAC2 and SPDIF0 Port!\n");
        return HI_FALSE;
    }
#elif defined(CHIP_TYPE_hi3751v500)
    if ((HI_UNF_SND_OUTPUTPORT_DAC0 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_EXT_DAC1 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_EXT_DAC2 != enOutPort) && (HI_UNF_SND_OUTPUTPORT_SPDIF0 != enOutPort)
        && (HI_UNF_SND_OUTPUTPORT_I2S1 != enOutPort))
    {
        HI_ERR_AO("just support I2S0, I2S1, DAC0, DAC1, DAC2 and SPDIF0 Port!\n");
        return HI_FALSE;
    }
#else
#error YOU MUST DEFINE  CHIP_TYPE!
#endif

    return HI_TRUE;
}

#ifndef HI_SND_DSP_SUPPORT
static HI_S32 AOAllocCacheAipBuf(SND_CARD_STATE_S* pCard)
{
    HI_S32 Ret = HI_SUCCESS;

    Ret = HI_DRV_MMZ_Alloc("AO_MAipPcm", MMZ_OTHERS, AO_TRACK_PCM_BUFSIZE_BYTE_MAX, AIAO_BUFFER_ADDR_ALIGN,
                           &pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("MMZ_AllocAndMap(AO_MAipPcm) failed\n");
        goto ALLOCATE_MAIPPCM_ERR;
    }

    Ret = HI_DRV_MMZ_MapCache(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("HI_DRV_MMZ_MapCache(AO_MAipPcm) failed\n");
        goto MAPCACHE_MAIPPCM_ERR;
    }

    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        Ret = HI_DRV_MMZ_Alloc("AO_MAipSpdRaw", MMZ_OTHERS, AO_TRACK_LBR_BUFSIZE_BYTE_MAX, AIAO_BUFFER_ADDR_ALIGN,
                               &pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
        if (HI_SUCCESS != Ret)
        {
            HI_ERR_AO("MMZ_AllocAndMap(AO_MAipSpdRaw) failed\n");
            goto ALLOCATE_MAIPSPDRAW_ERR;
        }

        Ret = HI_DRV_MMZ_MapCache(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
        if (HI_SUCCESS != Ret)
        {
            HI_ERR_AO("HI_DRV_MMZ_MapCache(AO_MAipSpdRaw) failed\n");
            goto MAPCACHE_MAIPSPDRAW_ERR;
        }
    }

    if (SND_MODE_NONE != pCard->enHdmiPassthrough)
    {
        Ret = HI_DRV_MMZ_Alloc("AO_MAipHdmiRaw", MMZ_OTHERS, AO_TRACK_HBR_BUFSIZE_BYTE_MAX, AIAO_BUFFER_ADDR_ALIGN,
                               &pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
        if (HI_SUCCESS != Ret)
        {
            HI_ERR_AO("HI_DRV_MMZ_Alloc(AO_MAipHdmiRaw) failed\n");
            goto ALLOCATE_MAIPHDMIRAW_ERR;
        }

        Ret = HI_DRV_MMZ_MapCache(&pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
        if (HI_SUCCESS != Ret)
        {
            HI_ERR_AO("HI_DRV_MMZ_MapCache(AO_MAipHdmiRaw) failed\n");
            goto MAPCACHE_MAIPHDMIRAW_ERR;
        }
    }

    return HI_SUCCESS;

MAPCACHE_MAIPHDMIRAW_ERR:
    if (SND_MODE_NONE != pCard->enHdmiPassthrough)
    {
        HI_DRV_MMZ_Release(&pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
    }
ALLOCATE_MAIPHDMIRAW_ERR:
    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        HI_DRV_MMZ_Unmap(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
    }
MAPCACHE_MAIPSPDRAW_ERR:
    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        HI_DRV_MMZ_Release(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
    }
ALLOCATE_MAIPSPDRAW_ERR:
    HI_DRV_MMZ_Unmap(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
MAPCACHE_MAIPPCM_ERR:
    HI_DRV_MMZ_Release(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
ALLOCATE_MAIPPCM_ERR:

    return HI_FAILURE;
}

static HI_VOID AOReleaseCacheAipBuf(SND_CARD_STATE_S* pCard)
{
    HI_DRV_MMZ_Unmap(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
    HI_DRV_MMZ_Release(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);

    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        HI_DRV_MMZ_Unmap(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
        HI_DRV_MMZ_Release(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
    }

    if (SND_MODE_NONE != pCard->enHdmiPassthrough)
    {
        HI_DRV_MMZ_Unmap(&pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
        HI_DRV_MMZ_Release(&pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
    }
}

#else

static HI_S32 AOAllocNoCacheAipBuf(SND_CARD_STATE_S* pCard)
{
    HI_S32 Ret = HI_SUCCESS;

    Ret = HI_DRV_MMZ_AllocAndMap("AO_MAipPcm", MMZ_OTHERS, AO_TRACK_PCM_BUFSIZE_BYTE_MAX, AIAO_BUFFER_ADDR_ALIGN,
                                 &pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("MMZ_AllocAndMap(AO_MAipPcm) failed\n");
        goto ALLOCATE_MAIPPCM_ERR;
    }

    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        Ret = HI_DRV_MMZ_AllocAndMap("AO_MAipSpdRaw", MMZ_OTHERS, AO_TRACK_LBR_BUFSIZE_BYTE_MAX, AIAO_BUFFER_ADDR_ALIGN,
                                     &pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
        if (HI_SUCCESS != Ret)
        {
            HI_ERR_AO("MMZ_AllocAndMap(AO_MAipSpdRaw) failed\n");
            goto ALLOCATE_MAIPSPDRAW_ERR;
        }
    }

    if (SND_MODE_NONE != pCard->enHdmiPassthrough)
    {
        Ret = HI_DRV_MMZ_AllocAndMap("AO_MAipHdmiRaw", MMZ_OTHERS, AO_TRACK_HBR_BUFSIZE_BYTE_MAX, AIAO_BUFFER_ADDR_ALIGN,
                                     &pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
        if (HI_SUCCESS != Ret)
        {
            HI_ERR_AO("MMZ_AllocAndMap(AO_MAipHdmiRaw) failed\n");
            goto ALLOCATE_MAIPHDMIRAW_ERR;
        }
    }

    return HI_SUCCESS;

ALLOCATE_MAIPHDMIRAW_ERR:
    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        HI_DRV_MMZ_UnmapAndRelease(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
    }

ALLOCATE_MAIPSPDRAW_ERR:
    HI_DRV_MMZ_UnmapAndRelease(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);
ALLOCATE_MAIPPCM_ERR:

    return HI_FAILURE;
}

static HI_VOID AOReleaseNoCacheAipBuf(SND_CARD_STATE_S* pCard)
{
    HI_DRV_MMZ_UnmapAndRelease(&pCard->stTrackRbfMmz[SND_AIP_TYPE_PCM]);

    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        HI_DRV_MMZ_UnmapAndRelease(&pCard->stTrackRbfMmz[SND_AIP_TYPE_SPDIF_RAW]);
    }

    if (SND_MODE_NONE != pCard->enHdmiPassthrough)
    {
        HI_DRV_MMZ_UnmapAndRelease(&pCard->stTrackRbfMmz[SND_AIP_TYPE_HDMI_RAW]);
    }
}
#endif

static HI_VOID AOInitCardState(SND_CARD_STATE_S* pCard)
{
    memset(pCard, 0, sizeof(SND_CARD_STATE_S));

    pCard->enPcmOutput = SND_PCM_OUTPUT_VIR_SPDIFORHDMI;
    pCard->enHdmiPassthrough = SND_MODE_NONE;
    pCard->enSpdifPassthrough = SND_MODE_NONE;
    pCard->bHdmiDebug = HI_FALSE;
    pCard->bCastSimulateOp = HI_FALSE;

    pCard->bHdmiMute = HI_TRUE;
    pCard->bUserSetHdmiMute= HI_FALSE;

#ifdef HI_PROC_SUPPORT
    pCard->u32SaveCnt = 0;
    pCard->enSaveState = SND_DEBUG_CMD_CTRL_STOP;
    pCard->pstFileHandle = HI_NULL;
#endif
}

static HI_S32 AOCheckOutPortAttr(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPORT_S* pstOutPort)
{
    if (HI_FALSE == AOCheckOutPortIsValid(pstOutPort->enOutPort))
    {
        HI_ERR_AO("port(%d) is invalid.\n", pstOutPort->enOutPort);
        return HI_FAILURE;
    }

    if (HI_TRUE == AOCheckOutPortIsAttached(enSound, pstOutPort->enOutPort))
    {
        HI_ERR_AO("port(%d) is aready attatched.\n", pstOutPort->enOutPort);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 AOInitHdmiAttr(SND_CARD_STATE_S* pCard)
{
    HI_S32 s32Ret;
    HDMI_AUDIO_ATTR_S stHdmiAttr;

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_HDMI, (HI_VOID**)&pCard->pstHdmiFunc);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("Get hdmi function failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    if (HI_NULL == pCard->pstHdmiFunc)
    {
        HI_ERR_AO("Hdmi func is null\n");
        return HI_FAILURE;
    }

    if (pCard->pstHdmiFunc->pfnHdmiGetAoAttr)
    {
        (pCard->pstHdmiFunc->pfnHdmiGetAoAttr)(HI_UNF_HDMI_ID_0, &stHdmiAttr);
    }

    if (pCard->pstHdmiFunc->pfnHdmiAudioChange)
    {
        stHdmiAttr.enSoundIntf  = HDMI_AUDIO_INTERFACE_I2S;
        stHdmiAttr.enSampleRate = pCard->enUserSampleRate;
        stHdmiAttr.u32Channels  = AO_TRACK_NORMAL_CHANNELNUM;
        stHdmiAttr.enAudioCode  = HI_UNF_EDID_AUDIO_FORMAT_CODE_PCM;
        (pCard->pstHdmiFunc->pfnHdmiAudioChange)(HI_UNF_HDMI_ID_0, &stHdmiAttr);
    }

    return HI_SUCCESS;
}

static HI_S32 AOInitOutputMode(SND_CARD_STATE_S* pCard,
                               HI_UNF_SND_OUTPUTPORT_E enOutPort)
{
    if (HI_UNF_SND_OUTPUTPORT_HDMI0 == enOutPort)
    {
        HI_S32 s32Ret = AOInitHdmiAttr(pCard);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("Init hdmi attr failed(0x%x)\n", s32Ret);
            return s32Ret;
        }

        pCard->enHdmiPassthrough = SND_MODE_PCM;
    }

#ifdef HI_SND_SPDIF_SUPPORT
    else if (HI_UNF_SND_OUTPUTPORT_SPDIF0 == enOutPort)
    {
        pCard->enSpdifPassthrough = SND_MODE_PCM;
    }
#endif

    else
    {
        pCard->enPcmOutput = SND_PCM_OUTPUT_CERTAIN;
    }

    return HI_SUCCESS;
}

static HI_S32 AOAllocAipBuf(SND_CARD_STATE_S* pCard)
{
#ifndef HI_SND_DSP_SUPPORT
    return AOAllocCacheAipBuf(pCard);
#else
    return AOAllocNoCacheAipBuf(pCard);
#endif
}

static HI_VOID AOReleaseAipBuf(SND_CARD_STATE_S* pCard)
{
#ifndef HI_SND_DSP_SUPPORT
    AOReleaseCacheAipBuf(pCard);
#else
    AOReleaseNoCacheAipBuf(pCard);
#endif
}

static HI_VOID AO_SND_AOEDeInit(SND_CARD_STATE_S* pCard)
{
    AOReleaseAipBuf(pCard);
    AO_ENGINE_DeInit(pCard);
}

static HI_S32 AO_SND_AOEInit(SND_CARD_STATE_S* pCard)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = AO_ENGINE_Init(pCard);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(AO_ENGINE_Init, s32Ret);
        return s32Ret;
    }

    s32Ret = AOAllocAipBuf(pCard);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(AOAllocAipBuf, s32Ret);
        goto ERR_EXIT0;
    }

    return HI_SUCCESS;

ERR_EXIT0:
    AO_ENGINE_DeInit(pCard);

    return s32Ret;
}

HI_S32 AO_SND_Open(HI_UNF_SND_E enSound, HI_UNF_SND_ATTR_S* pstAttr,
                   HI_BOOL bResume)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32PortId;
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);
    CHECK_AO_NULL_PTR(pstAttr);
    CHECK_AO_PORTNUM(pstAttr->u32PortNum);
    CHECK_AO_SAMPLERATE(pstAttr->enSampleRate);

    AOInitCardState(pCard);
    pCard->enUserSampleRate = pstAttr->enSampleRate;

    for (u32PortId = 0; u32PortId < pstAttr->u32PortNum; u32PortId++)
    {
        s32Ret = AOCheckOutPortAttr(enSound, &pstAttr->stOutport[u32PortId]);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("Check outport attr failed(0x%x)\n", s32Ret);
            return s32Ret;
        }

        s32Ret = AOInitOutputMode(pCard, pstAttr->stOutport[u32PortId].enOutPort);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("Init output mode failed(0x%x)\n", s32Ret);
            return s32Ret;
        }
    }

    s32Ret = SND_CreateOp(pCard, pstAttr, bResume);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("Create snd op failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    s32Ret = AO_SND_AOEInit(pCard);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(AO_SND_AOEInit, s32Ret);
        goto ERR_EXIT0;
    }

#ifdef HI_PROC_SUPPORT
    s32Ret = AO_RegProc((HI_U32)enSound);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(AO_RegProc, s32Ret);
        goto ERR_EXIT1;
    }
#endif

    return HI_SUCCESS;

#ifdef HI_PROC_SUPPORT
ERR_EXIT1:
    AO_SND_AOEDeInit(pCard);
#endif

ERR_EXIT0:
    SND_DestroyOp(pCard, HI_FALSE);

    return s32Ret;
}

HI_S32 AO_SND_Close(HI_UNF_SND_E enSound, HI_BOOL bSuspend)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);

#ifdef HI_PROC_SUPPORT
    AO_UnRegProc((HI_U32)enSound);
#endif

    AO_SND_AOEDeInit(pCard);
    SND_DestroyOp(pCard, bSuspend);
    TRACK_DestroyEngine(pCard);

    return HI_SUCCESS;
}

HI_S32 AO_SND_SetMute(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_BOOL bMute)
{
    HI_S32 s32Ret = HI_SUCCESS;
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pCard);

    s32Ret = SND_SetOpMute(pCard, enOutPort, bMute);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("call SND_SetOpMute failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    if(HI_UNF_SND_OUTPUTPORT_HDMI0 == enOutPort || HI_UNF_SND_OUTPUTPORT_ALL == enOutPort)
    {
        pCard->bUserSetHdmiMute = bMute;
    }

    return HI_SUCCESS;
}

HI_S32 AO_SND_GetMute(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_BOOL* pbMute)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pbMute);
    CHECK_AO_NULL_PTR(pCard);

    return SND_GetOpMute(pCard, enOutPort, pbMute);
}

HI_S32 AO_SND_GetAlsaTrackDelayMs(HI_UNF_SND_E enSound, HI_U32* pu32DelayMs)
{
    HI_U32 u32TrackCount = 0;
    HI_U32 u32TrackId = -1;
    SND_TRACK_STATE_S* pstTrackState;
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pu32DelayMs);
    CHECK_AO_NULL_PTR(pCard);

    for (u32TrackCount = 0; u32TrackCount < AO_MAX_TOTAL_TRACK_NUM; u32TrackCount++)
    {
        pstTrackState = (SND_TRACK_STATE_S*)pCard->pSndTrack[u32TrackCount];
        if (pstTrackState && pstTrackState->bAlsaTrack)
        {
            u32TrackId = pstTrackState->TrackId;
            break;
        }
    }

    if (AO_MAX_TOTAL_TRACK_NUM == u32TrackCount)
    {
        return HI_FAILURE;
    }

    return AO_Track_GetDelayMs(u32TrackId, pu32DelayMs);
}

static HI_S32 AO_SND_SetHdmiMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_HDMI_MODE_E enMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_HDMIMODE(enMode);
    CHECK_AO_NULL_PTR(pCard);

    if (HI_UNF_SND_OUTPUTPORT_HDMI0 != enOutPort)
    {
        return HI_ERR_AO_INVALID_PARA;
    }

    return SND_SetOpHdmiMode(pCard, enOutPort, enMode);
}

static HI_S32 AO_SND_GetHdmiMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_HDMI_MODE_E* penMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);
    if (HI_UNF_SND_OUTPUTPORT_HDMI0 != enOutPort)
    {
        return HI_ERR_AO_INVALID_PARA;
    }

    return SND_GetOpHdmiMode(pCard, enOutPort, penMode);
}

#ifdef HI_SND_SPDIF_SUPPORT
static HI_S32 AO_SND_SetSpdifMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_SPDIF_MODE_E enMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_SPDIFMODE(enMode);
    CHECK_AO_NULL_PTR(pCard);

    return SND_SetOpSpdifMode(pCard, enOutPort, enMode);
}

static HI_S32 AO_SND_GetSpdifMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_SPDIF_MODE_E* penMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pCard);

    return SND_GetOpSpdifMode(pCard, enOutPort, penMode);
}
#endif

HI_S32 AO_SND_SetVolume(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_GAIN_ATTR_S* pstGain)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pstGain);

    if (HI_TRUE == pstGain->bLinearMode)
    {
        CHECK_AO_LINEARVOLUME(pstGain->s32Gain);
    }
    else
    {
        CHECK_AO_ABSLUTEVOLUME(pstGain->s32Gain);
    }
    CHECK_AO_NULL_PTR(pCard);

    return SND_SetOpVolume(pCard, enOutPort, pstGain);
}

static HI_S32 AO_SND_GetVolume(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_GAIN_ATTR_S* pstGain)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pstGain);
    CHECK_AO_NULL_PTR(pCard);

    // TODO: Check volumn Attr

    return SND_GetOpVolume(pCard, enOutPort, pstGain);
}

#ifdef HI_SND_SPDIF_SUPPORT
static HI_S32 AO_SND_SetSpdifCategoryCode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort,
        HI_UNF_SND_SPDIF_CATEGORYCODE_E enCategoryCode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_CATEGORYCODE(enCategoryCode);
    CHECK_AO_NULL_PTR(pCard);

    return SND_SetOpSpdifCategoryCode(pCard, enOutPort, enCategoryCode);
}

static HI_S32 AO_SND_GetSpdifCategoryCode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort,
        HI_UNF_SND_SPDIF_CATEGORYCODE_E* penCategoryCode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pCard);

    return SND_GetOpSpdifCategoryCode(pCard, enOutPort, penCategoryCode);
}

static HI_S32 AO_SND_SetSpdifSCMSMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort,
                                      HI_UNF_SND_SPDIF_SCMSMODE_E enSCMSMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_SPDIFSCMSMODE(enSCMSMode);
    CHECK_AO_NULL_PTR(pCard);

    return SND_SetOpSpdifSCMSMode(pCard, enOutPort, enSCMSMode);
}

static HI_S32 AO_SND_GetSpdifSCMSMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort,
                                      HI_UNF_SND_SPDIF_SCMSMODE_E* penSCMSMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pCard);

    return SND_GetOpSpdifSCMSMode(pCard, enOutPort, penSCMSMode);
}
#endif

static HI_S32 AO_SND_SetTrackMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_TRACK_MODE_E enMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_TRACKMODE(enMode);
    CHECK_AO_NULL_PTR(pCard);

    return SND_SetOpTrackMode(pCard, enOutPort, enMode);
}

static HI_S32 AO_SND_GetTrackMode(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_TRACK_MODE_E* penMode)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pCard);

    return SND_GetOpTrackMode(pCard, enOutPort, penMode);
}

#ifdef HI_SOUND_PORT_DELAY_SUPPORT
static HI_S32 AO_SND_SetDelayCompensation(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_U32 u32DelayMs)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);

    if (u32DelayMs > AO_MAX_DELAYMS)
    {
        HI_ERR_AO("Invalid u32DelayMs(%d), Max(%d)\n", u32DelayMs, AO_MAX_DELAYMS);
        return HI_ERR_AO_INVALID_PARA;
    }

    s32Ret = SND_SetDelayCompensation(pCard, enOutPort, u32DelayMs);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("SND_SetDelayCompensation (enOutPort = 0x%x) failed(0x%x)\n", enOutPort, s32Ret);
    }

    return s32Ret;
}

static HI_S32 AO_SND_GetDelayCompensation(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_U32* pu32DelayMs)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);
    CHECK_AO_NULL_PTR(pu32DelayMs);

    s32Ret = SND_GetDelayCompensation(pCard, enOutPort, pu32DelayMs);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("SND_GetDelayCompensation (enOutPort = 0x%x) failed(0x%x)\n", enOutPort, s32Ret);
    }

    return s32Ret;
}
#endif

static HI_S32 AO_SND_SetAllTrackMute(HI_UNF_SND_E enSound, HI_BOOL bMute)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);
    CHECK_AO_NULL_PTR(pCard);

    s32Ret = TRACK_SetAllMute(pCard, bMute);
    if (HI_SUCCESS != s32Ret)
    {
        // TODO:
    }

    pCard->bAllTrackMute = bMute;
    HI_INFO_AO("bAllTrackMute status %d.\n", pCard->bAllTrackMute);

    return s32Ret;
}

static HI_S32 AO_SND_GetAllTrackMute(HI_UNF_SND_E enSound, HI_BOOL* pbMute)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pbMute);
    CHECK_AO_NULL_PTR(pCard);

    *pbMute = pCard->bAllTrackMute;
    return HI_SUCCESS;
}

static HI_S32 AO_SND_SetPreciVol(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_PRECIGAIN_ATTR_S stPreciGain)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_ABSLUTEPRECIVOLUME(stPreciGain.s32IntegerGain, stPreciGain.s32DecimalGain);
    CHECK_AO_NULL_PTR(pCard);

    return SND_SetOpPreciVol(pCard, enOutPort, stPreciGain);
}

static HI_S32 AO_SND_GetPreciVol(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_PRECIGAIN_ATTR_S* pstPreciGain)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_OUTPORT(enOutPort);
    CHECK_AO_NULL_PTR(pstPreciGain);
    CHECK_AO_NULL_PTR(pCard);

    return SND_GetOpPreciVol(pCard, enOutPort, pstPreciGain);
}

/******************************Snd Track FUNC*************************************/
static SND_CARD_STATE_S* TRACK_CARD_GetCard(HI_U32 Id)
{
    HI_UNF_SND_E sndx;
    SND_CARD_STATE_S* pCard = HI_NULL;

    if (Id >= AO_MAX_TOTAL_TRACK_NUM)
    {
        return HI_NULL;
    }

    for (sndx = HI_UNF_SND_0; sndx < HI_UNF_SND_BUTT; sndx++)
    {
        pCard = SND_CARD_GetCard(sndx);
        if (pCard)
        {
            if (pCard->uSndTrackInitFlag & (1L << Id))
            {
                return pCard;
            }
        }
    }

    return HI_NULL;
}

static HI_S32 AO_Snd_GetXRunCount(HI_UNF_SND_E enSound, HI_U32* pu32Count)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);
    SND_GetXRunCount(pCard, pu32Count);

    return HI_SUCCESS;
}

#ifdef HI_PROC_SUPPORT
/* snd open kernel intf, only used by proc for now */
HI_S32 AO_Snd_Kopen(AO_SND_Open_Param_S_PTR arg, struct file* file)
{
    HI_S32 s32Ret;
    HI_UNF_SND_E enSound = HI_UNF_SND_BUTT;
    AO_SND_Open_Param_S_PTR pstSndParam = ( AO_SND_Open_Param_S_PTR )arg;
    DRV_AO_STATE_S* pAOState = file->private_data;

    enSound = pstSndParam->enSound;
    CHECK_AO_SNDCARD( enSound );

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    if (HI_SUCCESS == AO_Snd_AllocHandle(enSound, file))
    {
        if (0 == atomic_read(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
        {
            s32Ret = AO_SND_Open(enSound, &pstSndParam->stAttr, HI_FALSE);
            if (HI_SUCCESS != s32Ret)
            {
                AO_Snd_FreeHandle(enSound, file);
                up(&g_AoMutex);
                return HI_FAILURE;
            }
        }
    }

    atomic_inc(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
    atomic_inc(&pAOState->atmUserOpenCnt[enSound]);

    up(&g_AoMutex);

    return HI_SUCCESS;
}

/* snd close kernel intf */
HI_S32 AO_Snd_Kclose(HI_UNF_SND_E arg, struct file* file)
{
    HI_S32 s32Ret;
    HI_UNF_SND_E enSound = HI_UNF_SND_BUTT;
    DRV_AO_STATE_S* pAOState = file->private_data;
    enSound = arg;
    CHECK_AO_SNDCARD_OPEN( enSound );

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    if (atomic_dec_and_test(&pAOState->atmUserOpenCnt[enSound]))
    {
        if (atomic_dec_and_test(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
        {
            s32Ret = AO_SND_Close( enSound, HI_FALSE );
            if (HI_SUCCESS != s32Ret)
            {
                atomic_inc(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
                up(&g_AoMutex);
                return HI_FAILURE;
            }

            AO_Snd_FreeHandle(enSound, file);
        }
    }
    else
    {
        atomic_dec(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
    }

    up(&g_AoMutex);

    return HI_SUCCESS;
}
#endif

HI_S32 AO_Track_AllocHandle(HI_UNF_SND_E enSound, HI_UNF_SND_TRACK_TYPE_E enTrackType, struct file* pstFile, HI_HANDLE* phHandle)
{
    HI_U32 i;

    CHECK_AO_NULL_PTR(phHandle);
    CHECK_AO_SNDCARD_OPEN(enSound);

    if (s_stAoDrv.bReady != HI_TRUE)
    {
        HI_ERR_AO("Need open first!\n");
        return HI_ERR_AO_DEV_NOT_OPEN;
    }

    if (s_stAoDrv.u32TrackNum >= AO_MAX_TOTAL_TRACK_NUM)
    {
        HI_ERR_AO("Too many track:%d!\n", s_stAoDrv.u32TrackNum);
        return HI_ERR_AO_NOTSUPPORT;
    }

    for (i = 0; i < AO_MAX_TOTAL_TRACK_NUM; i++)
    {
        if (0 == atomic_read(&s_stAoDrv.astTrackEntity[i].atmUseCnt))
        {
            break;
        }
    }

    if (i >= AO_MAX_TOTAL_TRACK_NUM)
    {
        HI_ERR_AO("Too many track!\n");
        return HI_ERR_AO_NOTSUPPORT;
    }

    if (enTrackType == HI_UNF_SND_TRACK_TYPE_LOWLATENCY)
    {
        if (s_stAoDrv.bLowLatencyCreated == HI_TRUE)
        {
            HI_ERR_AO("Too many LowLatency track!\n");
            return HI_ERR_AO_NOTSUPPORT;
        }
    }

    s_stAoDrv.astTrackEntity[i].pstFile = pstFile;
    s_stAoDrv.u32TrackNum++;
    atomic_inc(&s_stAoDrv.astTrackEntity[i].atmUseCnt);

    /*
      define of Track Handle :
      bit31                                                           bit0
        |<----   16bit --------->|<---   8bit    --->|<---  8bit   --->|
        |--------------------------------------------------------------|
        |      HI_MOD_ID_E       |  sub_mod defined  |     chnID       |
        |--------------------------------------------------------------|
      */

    if (enTrackType == HI_UNF_SND_TRACK_TYPE_LOWLATENCY)
    {
        *phHandle = (HI_ID_AO << 16) | (HI_ID_LOWLATENCY_TRACK << 8) | i;
        s_stAoDrv.bLowLatencyCreated = HI_TRUE;
    }
    else
    {
        *phHandle = (HI_ID_AO << 16) | (HI_ID_MASTER_SLAVE_TRACK << 8) | i;
    }

    return HI_SUCCESS;
}

HI_VOID AO_Track_FreeHandleById(HI_U32 u32TrackID)
{
    s_stAoDrv.bLowLatencyCreated = HI_FALSE;  //low latency track

    if (0 == atomic_read(&s_stAoDrv.astTrackEntity[u32TrackID].atmUseCnt))
    {
        return;
    }

    s_stAoDrv.astTrackEntity[u32TrackID].pstFile = HI_NULL;
    s_stAoDrv.u32TrackNum--;
    atomic_set(&s_stAoDrv.astTrackEntity[u32TrackID].atmUseCnt, 0);
}


HI_VOID AO_Track_FreeHandle(HI_HANDLE hHandle)
{
    if ((hHandle & 0xff00) == (HI_ID_LOWLATENCY_TRACK << 8)) //low latency track
    {
        s_stAoDrv.bLowLatencyCreated = HI_FALSE;
    }

    hHandle &= AO_TRACK_CHNID_MASK;
    if (0 == atomic_read(&s_stAoDrv.astTrackEntity[hHandle].atmUseCnt))
    {
        return;
    }
    s_stAoDrv.astTrackEntity[hHandle].pstFile = HI_NULL;
    s_stAoDrv.u32TrackNum--;
    atomic_set(&s_stAoDrv.astTrackEntity[hHandle].atmUseCnt, 0);
}

static HI_VOID AO_TRACK_SaveSuspendAttr(HI_HANDLE hHandle, AO_Track_Create_Param_S_PTR pstTrack)
{
    hHandle &= AO_TRACK_CHNID_MASK;
    s_stAoDrv.astTrackEntity[hHandle].stSuspendAttr.enSound = pstTrack->enSound;
    s_stAoDrv.astTrackEntity[hHandle].stSuspendAttr.bAlsaTrack = pstTrack->bAlsaTrack;
    memcpy(&s_stAoDrv.astTrackEntity[hHandle].stSuspendAttr.stBufAttr, &pstTrack->stBuf, sizeof(AO_BUF_ATTR_S));
}

HI_S32 AO_Track_GetDefAttr(HI_UNF_AUDIOTRACK_ATTR_S* pstDefAttr)
{
    return TRACK_GetDefAttr(pstDefAttr);
}

static HI_S32 AO_Track_GetAttr(HI_U32 u32TrackID, HI_UNF_AUDIOTRACK_ATTR_S* pstTrackAttr)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_GetAttr(pCard, u32TrackID, pstTrackAttr);
}

static HI_S32 AO_Track_SetAttr(HI_U32 u32TrackID, HI_UNF_AUDIOTRACK_ATTR_S* pstTrackAttr)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard;

    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    s32Ret = TRACK_SetAttr(pCard, u32TrackID, pstTrackAttr);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(TRACK_SetAttr, s32Ret);
    }

    return s32Ret;
}

HI_S32 AO_Track_Create(HI_UNF_SND_E enSound, HI_UNF_AUDIOTRACK_ATTR_S* pstAttr,
                       HI_BOOL bAlsaTrack, AO_BUF_ATTR_S* pstBuf, HI_HANDLE hTrack)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard;
    hTrack &= AO_TRACK_CHNID_MASK;
    pCard = SND_CARD_GetCard(enSound);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    s32Ret = TRACK_CreateNew(pCard, pstAttr, bAlsaTrack, pstBuf, hTrack);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(TRACK_CreateNew, s32Ret);
        return s32Ret;
    }

    if (HI_FALSE == bAlsaTrack)  //Not alsa track
    {
        HI_INFO_AO("set track %d mute \n", hTrack);
        return TRACK_SetMute(pCard, hTrack, HI_FALSE);
    }

    return s32Ret;
}

HI_S32 AO_Track_Destory(HI_U32 u32TrackID)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_Destroy(pCard, u32TrackID);
}

HI_S32 AO_Track_Start(HI_U32 u32TrackID)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_Start(pCard, u32TrackID);
}

HI_S32 AO_Track_Stop(HI_U32 u32TrackID)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_Stop(pCard, u32TrackID);
}

HI_S32 AO_Track_SendData(HI_U32 u32TrackID, AO_FRAMEINFO_S* pstAOFrame)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SendData(pCard, u32TrackID, pstAOFrame);
}

static HI_S32 AO_Track_SetWeight(HI_U32 u32TrackID, HI_UNF_SND_GAIN_ATTR_S* pstTrackGain)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetWeight(pCard, u32TrackID, pstTrackGain);
}

static HI_S32 AO_Track_GetWeight(HI_U32 u32TrackID, HI_UNF_SND_GAIN_ATTR_S* pstTrackGain)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_GetWeight(pCard, u32TrackID, pstTrackGain);
}

static HI_S32 AO_Track_SetAbsGain(HI_U32 u32TrackID, HI_UNF_SND_ABSGAIN_ATTR_S* pstTrackAbsGain)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetAbsGain(pCard, u32TrackID, pstTrackAbsGain);
}

static HI_S32 AO_Track_GetAbsGain(HI_U32 u32TrackID, HI_UNF_SND_ABSGAIN_ATTR_S* pstTrackAbsGain)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_GetAbsGain(pCard, u32TrackID, pstTrackAbsGain);
}

static HI_S32 AO_Track_SetMute(HI_U32 u32TrackID, HI_BOOL bMute)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetMute(pCard, u32TrackID, bMute);
}

static HI_S32 AO_Track_GetMute(HI_U32 u32TrackID, HI_BOOL* pbMute)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_GetMute(pCard, u32TrackID, pbMute);
}

static HI_S32 AO_Track_SetChannelMode(HI_U32 u32TrackID, HI_UNF_TRACK_MODE_E enMode)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetChannelMode(pCard, u32TrackID, enMode);
}

static HI_S32 AO_Track_GetChannelMode(HI_U32 u32TrackID, HI_UNF_TRACK_MODE_E* penMode)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_GetChannelMode(pCard, u32TrackID, penMode);
}

static HI_S32 AO_Track_SetSpeedAdjust(HI_U32 u32TrackID, AO_SND_SPEEDADJUST_TYPE_E enType, HI_S32 s32Speed)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetSpeedAdjust(pCard, u32TrackID, enType, s32Speed);
}

HI_S32 AO_Track_GetDelayMs(HI_U32 u32TrackID, HI_U32* pu32DelayMs)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_GetDelayMs(pCard, u32TrackID, pu32DelayMs);
}

static HI_S32 AO_Track_GetExtDelayMs(HI_U32 u32TrackID, HI_U32* pu32DelayMs)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    *pu32DelayMs = pCard->u32ExtDelayMs;
    return HI_SUCCESS;
}

static HI_S32 AO_Track_IsBufEmpty(HI_U32 u32TrackID, HI_BOOL* pbBufEmpty)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_IsBufEmpty(pCard, u32TrackID, pbBufEmpty);
}

static HI_S32 AO_Track_SetEosFlag(HI_U32 u32TrackID, HI_BOOL bEosFlag)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetEosFlag(pCard, u32TrackID, bEosFlag);
}

#if defined (HI_AUDIO_AI_SUPPORT)
HI_S32 AO_Track_AttachAi(HI_U32 u32TrackID, HI_HANDLE hAi)
{
    HI_S32 Ret;
    SND_CARD_STATE_S* pCard;
    HI_HANDLE   hTrack;
    hTrack = u32TrackID & AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(hTrack);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    Ret = TRACK_SetPcmAttr(pCard, hTrack, hAi);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("call TRACK_SetPcmAttr failed!\n");
        return Ret;
    }

    Ret = AI_AttachTrack(hAi, hTrack);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("call AI_SetAttachFlag failed!\n");
        return Ret;
    }

    Ret = TRACK_AttachAi(pCard, hTrack, hAi);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("call TRACK_AttachAi failed!\n");
    }

    return Ret;
}

HI_S32 AO_Track_DetachAi(HI_U32 u32TrackID, HI_HANDLE hAi)
{
    HI_S32 Ret;
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);

    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    Ret = TRACK_DetachAi(pCard, u32TrackID);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("call TRACK_DetachAi failed!\n");
        return Ret;
    }

    Ret = AI_DetachTrack(hAi, u32TrackID);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("call AI_SetAttachFlag failed!\n");
    }

    return Ret;
}
#endif

static HI_S32 AO_Track_MasterSlaveExchange(SND_CARD_STATE_S* pCard, HI_U32 u32TrackID)
{
    HI_U32 u32MTrackID;
    HI_UNF_AUDIOTRACK_ATTR_S* pstTrackAttr;
    HI_BOOL bAlsaTrack;
    AO_BUF_ATTR_S* pstBuf;
    HI_UNF_SND_E enSound;

    SND_TRACK_SETTINGS_S stTrackSettings;
    HI_S32 s32Ret;

    enSound = SND_CARD_GetSnd(pCard);
    if (AO_MAX_TOTAL_SND_NUM == enSound)
    {
        return HI_FAILURE;
    }

    u32MTrackID = TRACK_GetMasterId(pCard);
    if (AO_MAX_TOTAL_TRACK_NUM != u32MTrackID)  //judge if master track exist
    {
        //Master -> slave
        TRACK_GetSetting(pCard, u32MTrackID, &stTrackSettings); //save track setting
        //Master Track is NOT STOP,Not support Exchange
        if (SND_TRACK_STATUS_STOP != stTrackSettings.enCurnStatus)
        {
            HI_FATAL_AO("Exist Master Track(%d) is Not Stop!\n", u32MTrackID);
            return HI_FAILURE;
        }

        /* Destory track */
        s32Ret = AO_Track_Destory(u32MTrackID);
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AO_Track_Destory fail\n");
            return HI_FAILURE;
        }

        pstTrackAttr = &stTrackSettings.stTrackAttr;
        //bAlsaTrack = stTrackSettings.bAlsaTrack;
        bAlsaTrack = HI_FALSE;        //ALSA TRACK NEVER EXCHANGE
        pstBuf = &stTrackSettings.stBufAttr;
        pstTrackAttr->enTrackType = HI_UNF_SND_TRACK_TYPE_SLAVE;

        /* Recreate slave track  */
        s32Ret = AO_Track_Create(enSound, pstTrackAttr, bAlsaTrack, pstBuf, u32MTrackID);
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AO_Track_Create fail\n");
            return HI_FAILURE;
        }
        TRACK_RestoreSetting(pCard, u32MTrackID, &stTrackSettings); //restore track setting
    }

    if (u32MTrackID == u32TrackID)    //if input track id is master ,just return here
    {
        return HI_SUCCESS;
    }
    else
    {
        //slave -> Master
        TRACK_GetSetting(pCard, u32TrackID, &stTrackSettings);
        /* Destory track */
        s32Ret = AO_Track_Destory(u32TrackID);
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AO_Track_Destory fail\n");
            return HI_FAILURE;
        }

        pstTrackAttr = &stTrackSettings.stTrackAttr;
        //bAlsaTrack = stTrackSettings.bAlsaTrack;
        bAlsaTrack = HI_FALSE;        //ALSA TRACK NEVER EXCHANGE
        pstBuf = &stTrackSettings.stBufAttr;
        pstTrackAttr->enTrackType = HI_UNF_SND_TRACK_TYPE_MASTER;

        /* Recreate Master track  */
        s32Ret = AO_Track_Create(enSound, pstTrackAttr, bAlsaTrack, pstBuf, u32TrackID);
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AO_Track_Create fail\n");
            return HI_FAILURE;
        }

        TRACK_RestoreSetting(pCard, u32TrackID, &stTrackSettings);
        return HI_SUCCESS;
    }
}

HI_S32 AO_Track_PreCreate(HI_UNF_SND_E enSound, HI_UNF_AUDIOTRACK_ATTR_S* pstAttr,
                          HI_BOOL bAlsaTrack, AO_BUF_ATTR_S* pstBuf, HI_HANDLE hTrack)
{
    HI_U32 u32TrackID;
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard;

    hTrack &= AO_TRACK_CHNID_MASK;
    pCard = SND_CARD_GetCard(enSound);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    s32Ret = TRACK_CheckAttr(pstAttr);
    if (HI_SUCCESS != s32Ret)
    {
        return s32Ret;
    }

    if (HI_UNF_SND_TRACK_TYPE_MASTER == pstAttr->enTrackType)
    {
        u32TrackID = TRACK_GetMasterId(pCard);
        if (AO_MAX_TOTAL_TRACK_NUM != u32TrackID)  //judge if master track exist
        {
            s32Ret = AO_Track_MasterSlaveExchange(pCard, u32TrackID);    //force master to slave
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_AO("Failed to Force Master track(%d) To Slave!\n", u32TrackID);
                return s32Ret;
            }
        }
    }

    return AO_Track_Create(enSound, pstAttr, bAlsaTrack, pstBuf, hTrack);
}

static HI_S32 AO_Track_PreSetAttr(HI_U32 u32TrackID, HI_UNF_AUDIOTRACK_ATTR_S* pstTrackAttr)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard;
    SND_TRACK_ATTR_SETTING_E enAttrSetting = SND_TRACK_ATTR_BUTT;
    HI_UNF_AUDIOTRACK_ATTR_S stTrackTmpAttr = {0};

    u32TrackID &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    s32Ret = TRACK_DetectAttr(pCard, u32TrackID, pstTrackAttr, &enAttrSetting);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("TRACK_DetectAttr failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    switch (enAttrSetting)
    {
        case SND_TRACK_ATTR_RETAIN:
            return HI_SUCCESS;

        case SND_TRACK_ATTR_MODIFY:
            s32Ret = AO_Track_SetAttr(u32TrackID, pstTrackAttr);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_AO("AO_Track_SetAttr failed(0x%x)\n", s32Ret);
            }
            return s32Ret;

        case SND_TRACK_ATTR_MASTER2SLAVE:
        case SND_TRACK_ATTR_SLAVE2MASTER:
            s32Ret = AO_Track_GetAttr(u32TrackID, &stTrackTmpAttr);          //save track attr
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_AO("AO_Track_GetAttr failed(0x%x)\n", s32Ret);
                return s32Ret;
            }

            s32Ret = AO_Track_SetAttr(u32TrackID, pstTrackAttr);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_AO("AO_Track_SetAttr failed(0x%x)\n", s32Ret);
                return s32Ret;
            }

            s32Ret = AO_Track_MasterSlaveExchange(pCard, u32TrackID);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_AO("AO_Track_MasterSlaveExchange failed(0x%x), Restore track attr.\n", s32Ret);
                s32Ret = AO_Track_SetAttr(u32TrackID, &stTrackTmpAttr);      //exchange failed ,restore track attr
                if (HI_SUCCESS != s32Ret)
                {
                    HI_ERR_AO("AO_Track_SetAttr failed(0x%x)\n", s32Ret);
                    return s32Ret;
                }

                return HI_FAILURE;
            }
            return s32Ret;

        default:
            return HI_SUCCESS;
    }
}

static HI_S32 AO_Track_SetUsedByKernel(HI_U32 u32TrackID)
{
    SND_CARD_STATE_S* pCard;
    u32TrackID &= AO_TRACK_CHNID_MASK;

    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_SetUsedByKernel(pCard, u32TrackID);
}

/******************************Snd Cast FUNC*************************************/
#ifdef HI_PROC_SUPPORT
static HI_S32 AO_Cast_AllocHandle(HI_HANDLE* phHandle, struct file* pstFile, HI_UNF_SND_CAST_ATTR_S* pstUserCastAttr)
{
    HI_U32 i;
    HI_S32 Ret;
    HI_U32 uFrameSize, uBufSize;
    MMZ_BUFFER_S stRbfMmz;

    if (HI_NULL == phHandle)
    {
        HI_ERR_AO("Bad param!\n");
        return HI_FAILURE;
    }

    /* Check ready flag */
    if (s_stAoDrv.bReady != HI_TRUE)
    {
        HI_ERR_AO("Need open first!\n");
        return HI_FAILURE;
    }

    /* Check channel number */
    if (s_stAoDrv.u32CastNum >= AO_MAX_CAST_NUM)
    {
        HI_ERR_AO("Too many Cast:%d!\n", s_stAoDrv.u32CastNum);
        goto err0;
    }

    /* Allocate new channel */
    for (i = 0; i < AO_MAX_CAST_NUM; i++)
    {
        if (0 == atomic_read(&s_stAoDrv.astCastEntity[i].atmUseCnt))
        {
            s_stAoDrv.astCastEntity[i].pstFile = HI_NULL;
            break;
        }
    }

    if (i >= AO_MAX_CAST_NUM)
    {
        HI_ERR_AO("Too many Cast chans!\n");
        goto err0;
    }

    /* Allocate cast mmz resource */
    uFrameSize = AUTIL_CalcFrameSize(AO_TRACK_NORMAL_CHANNELNUM, AO_TRACK_BITDEPTH_LOW); /* force 2ch 16bit */
    uBufSize = pstUserCastAttr->u32PcmFrameMaxNum * pstUserCastAttr->u32PcmSamplesPerFrame * uFrameSize;
    if (uBufSize > AO_CAST_MMZSIZE_MAX)
    {
        HI_ERR_AO("Invalid Cast FrameMaxNum(%d), PcmSamplesPerFrame(%d)!\n", pstUserCastAttr->u32PcmFrameMaxNum,
                  pstUserCastAttr->u32PcmSamplesPerFrame);
        goto err0;
    }

    Ret = HI_DRV_MMZ_AllocAndMap("AO_Cast", MMZ_OTHERS, AO_CAST_MMZSIZE_MAX, AIAO_BUFFER_ADDR_ALIGN, &stRbfMmz);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AIAO("MMZ_AllocAndMap failed\n");
        goto err0;
    }

    s_stAoDrv.astCastEntity[i].stRbfMmz   = stRbfMmz;
    s_stAoDrv.astCastEntity[i].u32ReqSize = uBufSize;

    /* Allocate resource */
    s_stAoDrv.astCastEntity[i].pstFile = pstFile;
    s_stAoDrv.u32CastNum++;
    atomic_inc(&s_stAoDrv.astCastEntity[ i].atmUseCnt);
    *phHandle = (HI_ID_AO << 16) | (HI_ID_CAST << 8) | i;
    return HI_SUCCESS;

err0:
    return HI_FAILURE;
}

static HI_VOID AO_Cast_FreeHandle(HI_HANDLE hHandle)
{
    hHandle &= AO_CAST_CHNID_MASK;

    /* Freee cast mmz resource */
    HI_DRV_MMZ_UnmapAndRelease(&s_stAoDrv.astCastEntity[hHandle].stRbfMmz);

    s_stAoDrv.astCastEntity[hHandle].pstFile = HI_NULL;
    s_stAoDrv.u32CastNum--;
    atomic_set(&s_stAoDrv.astCastEntity[hHandle].atmUseCnt, 0);
}

#define CHECK_AO_CAST_OPEN(Cast) \
    do                                                         \
    {                                                          \
        CHECK_AO_CAST(Cast);                             \
        if (0 == atomic_read(&s_stAoDrv.astCastEntity[Cast & AO_CAST_CHNID_MASK].atmUseCnt))   \
        {                                                       \
            HI_WARN_AO(" Invalid Cast id 0x%x\n", Cast);        \
            return HI_ERR_AO_INVALID_PARA;                       \
        }                                                       \
    } while (0)


static SND_CARD_STATE_S* CAST_CARD_GetCard(HI_U32 Id)
{
    HI_UNF_SND_E sndx;
    SND_CARD_STATE_S* pCard = HI_NULL;

    if (Id >= AO_MAX_CAST_NUM)
    {
        HI_WARN_AO(" Invalid Cast id 0x%x\n", Id);
        return HI_NULL;
    }

    for (sndx = HI_UNF_SND_0; sndx < HI_UNF_SND_BUTT; sndx++)
    {
        pCard = SND_CARD_GetCard(sndx);
        if (pCard)
        {
            if (pCard->uSndCastInitFlag & (1L << Id))
            {
                return pCard;
            }
        }
    }

    return HI_NULL;
}

static HI_S32 AO_Cast_SetMute(HI_U32 u32CastID, HI_BOOL bMute)
{
    SND_CARD_STATE_S* pCard;

    u32CastID &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(u32CastID);
    if (pCard)
    {
        return CAST_SetMute(pCard, u32CastID, bMute);
    }
    else
    {
        HI_FATAL_AO("Ao Sound Not Open!\n");
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }
}

static HI_S32 AO_Cast_GetMute(HI_U32 u32CastID, HI_BOOL* pbMute)
{
    SND_CARD_STATE_S* pCard;

    u32CastID &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(u32CastID);

    if (pCard)
    {
        return CAST_GetMute(pCard, u32CastID, pbMute);
    }
    else
    {
        HI_FATAL_AO("Ao Sound Not Open!\n");
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }
}


static HI_S32 AO_Cast_SetAbsGain(HI_U32 u32CastID, HI_UNF_SND_ABSGAIN_ATTR_S stCastAbsGain)
{
    SND_CARD_STATE_S* pCard;
    u32CastID &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(u32CastID);

    if (pCard)
    {
        return CAST_SetAbsGain(pCard, u32CastID, &stCastAbsGain);
    }
    else
    {
        HI_FATAL_AO("Ao Sound Not Open!\n");
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }
}

static HI_S32 AO_Cast_GetAbsGain(HI_U32 u32CastID, HI_UNF_SND_ABSGAIN_ATTR_S* pstCastAbsGain)
{
    SND_CARD_STATE_S* pCard;
    u32CastID &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(u32CastID);

    if (pCard)
    {
        return CAST_GetAbsGain(pCard, u32CastID, pstCastAbsGain);
    }
    else
    {
        HI_FATAL_AO("Ao Sound Not Open!\n");
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }
}

static HI_VOID AO_Cast_SaveSuspendAttr(HI_UNF_SND_E enSound, HI_HANDLE hHandle, HI_UNF_SND_CAST_ATTR_S* pstCastAttr)
{
    hHandle &= AO_TRACK_CHNID_MASK;
    s_stAoDrv.astCastEntity[hHandle].stSuspendAttr.enSound = enSound;
    s_stAoDrv.astCastEntity[hHandle].stSuspendAttr.stCastAttr = *pstCastAttr;
}

HI_S32 AO_Cast_Create(HI_UNF_SND_E enSound, HI_UNF_SND_CAST_ATTR_S* pstCastAttr, MMZ_BUFFER_S* pstMMz, HI_HANDLE hCast)
{
    HI_S32 s32Ret;
    SND_CARD_STATE_S* pCard;
    pCard = SND_CARD_GetCard(enSound);
    CHECK_AO_NULL_PTR(pCard);

    s32Ret = CAST_CreateChn(pCard, pstCastAttr, pstMMz, hCast);
    if (HI_SUCCESS == s32Ret)
    {
        HI_INFO_AO("set cast %d mute or unmute \n", hCast);
        return CAST_SetMute(pCard, hCast & AO_CAST_CHNID_MASK, HI_FALSE);
    }

    return s32Ret;
}

HI_S32 AO_Cast_Destory(HI_HANDLE hCast)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_DestroyChn(pCard, hCast);
}

HI_S32 AO_Cast_SetInfo(HI_HANDLE hCast, HI_VIRT_ADDR_T tUserVirtAddr)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_SetInfo(pCard, hCast, tUserVirtAddr);
}

HI_S32 AO_Cast_GetInfo(HI_HANDLE hCast, AO_Cast_Info_Param_S* pstInfo)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_GetInfo(pCard, hCast, pstInfo);
}

HI_S32 AO_Cast_SetEnable(HI_HANDLE hCast, HI_BOOL bEnable)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_SetEnable(pCard, hCast, bEnable);
}

HI_S32 AO_Cast_GetEnable(HI_HANDLE hCast, HI_BOOL* pbEnable)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_GetEnable(pCard, hCast, pbEnable);
}

static HI_S32 AO_Cast_ReadData(HI_HANDLE hCast, AO_Cast_Data_Param_S* pstCastData)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_ReadData(pCard, hCast, pstCastData);
}

static HI_S32 AO_Cast_ReleseData(HI_HANDLE hCast, AO_Cast_Data_Param_S* pstCastData)
{
    SND_CARD_STATE_S* pCard;
    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    return CAST_ReleaseData(pCard, hCast, pstCastData);
}
#endif

/********************************Driver inteface FUNC****************************************/

#ifdef HI_PROC_SUPPORT
/*********************************** Code ************************************/
static HI_BOOL bSaveThreadRunFlag = HI_FALSE;
static HI_BOOL bSuspend2SaveThreadFlag = HI_FALSE;    //HI_TRUE meas suspend start, thread should exit
static volatile HI_BOOL bSaveThread2SuspendFlag = HI_FALSE;    //HI_TRUE means  suspend wait until hi_false

static HI_S32 AODebugShowHelp(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    HI_DRV_PROC_EchoHelper("-----------------------------------------------------------------------------SOUND HELP-----------------------------------------------------------------------------\n");
    HI_DRV_PROC_EchoHelper("echo command1         para1             command2      para2            path                explanation\n\n");
    HI_DRV_PROC_EchoHelper("echo save_track       [track_id]                      [start/stop]  >  /proc/msp/sound%d    save pcm data from track(track_id:0,1,2...)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo save_sound       [start/stop]                                  >  /proc/msp/sound%d    save pcm data from sound\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  TRACK[track_id]   weight        [0~100]       >  /proc/msp/sound%d    set track L/R weight(track_id:0,1,2...)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  TRACK[track_id]   mute          [0/1]         >  /proc/msp/sound%d    set track prescale(track_id:0,1,2...;step:0.125dB)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  [outport]         mute          [0/1]         >  /proc/msp/sound%d    set outport mute(outport:DAC0/DAC1/SPDIF0/I2S0/...;0:off;1:on)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  [outport]         precivolume   [-81~18]      >  /proc/msp/sound%d    set outport precivolume(outport:DAC0/DAC1/SPDIF0/I2S0/...;step:0.125dB)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  [outport]         delaycomps    [0~500]       >  /proc/msp/sound%d    set outport delay compensation(outport:DAC0/DAC1/SPDIF0/I2S0/...;step:1ms)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  [outport]         drc           [0/1]         >  /proc/msp/sound%d    outport drc switch(outport:DAC0/DAC1/SPDIF0/I2S0/...;1:on;0:off)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                  [outport]         peq           [0/1]         >  /proc/msp/sound%d    outport peq switch(outport:DAC0/DAC1/SPDIF0/I2S0/...;1:on;0:off)\n", enSound);
    HI_DRV_PROC_EchoHelper("echo                                    avc           [0/1]         >  /proc/msp/sound%d    outport avc switch(1:on;0:off)\n", enSound);
    HI_DRV_PROC_EchoHelper("---------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
    return HI_SUCCESS;
}

static HI_S32 AODebugShowPivHelp(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    HI_DRV_PROC_EchoHelper("\necho TRACK0 weight -40dB > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo TRACK0 mute on|off > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 drc on|off > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 drc attacktime|releasetime 1000ms|1000ms > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 drc thrhd|limit -10dB|-20dB > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 mute on|off > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 volume -40dB > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 precivolume -40dB > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 peq on|off > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo DAC0 peq band0 type|gain|Q|freq HP|-10dB|0.7|1000Hz > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("\necho avc on|off > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo avc attacktime|releasetime 1000ms|1000ms > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo avc thrhd|limit -30dB|-10dB > /proc/msp/sound%d\n", enSound);
    HI_DRV_PROC_EchoHelper("echo avc gain 5dB > /proc/msp/sound%d\n", enSound);

    return HI_SUCCESS;
}

static HI_S32 SndProcSaveThread(void* Arg)
{
    HI_S32 s32Ret;
    SND_PCM_SAVE_ATTR_S* pstThreadArg = (SND_PCM_SAVE_ATTR_S*)Arg;
    SND_PCM_SAVE_ATTR_S stThreadArg;

    //use cast
    HI_UNF_SND_CAST_ATTR_S stCastAttr;
    AO_Cast_Create_Param_S  stCastParam;
    AO_Cast_Enable_Param_S stEnableAttr;
    AO_Cast_Info_Param_S stCastInfo;
    AO_Cast_Data_Param_S stCastData;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    stThreadArg.enSound = pstThreadArg->enSound;
    stThreadArg.pstFileHandle = pstThreadArg->pstFileHandle;
    stThreadArg.pstDevfileHandle = pstThreadArg->pstDevfileHandle;

    CHECK_AO_SNDCARD_OPEN(stThreadArg.enSound);
    CHECK_AO_NULL_PTR(stThreadArg.pstFileHandle);

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    bSaveThread2SuspendFlag = HI_TRUE;

    s32Ret = CAST_GetDefAttr(&stCastAttr);
    if (HI_SUCCESS != s32Ret)
    {
        up(&g_AoMutex);
        goto Close_File;
    }

    stCastParam.enSound = stThreadArg.enSound;
    memcpy(&stCastParam.stCastAttr, &stCastAttr, sizeof(HI_UNF_SND_CAST_ATTR_S));

    if (HI_SUCCESS == AO_Cast_AllocHandle(&hHandle, stThreadArg.pstFileHandle, &stCastParam.stCastAttr))
    {
        s32Ret = AO_Cast_Create(stCastParam.enSound, &stCastParam.stCastAttr, &s_stAoDrv.astCastEntity[hHandle & AO_CAST_CHNID_MASK].stRbfMmz,
                                hHandle);
        if (HI_SUCCESS != s32Ret)
        {
            AO_Cast_FreeHandle(hHandle);
            up(&g_AoMutex);
            goto Close_File;
        }
        //AO_Cast_SaveSuspendAttr(stCastParam.enSound, hHandle, &stCastParam.stCastAttr);   //NO resume
        stCastParam.u32ReqSize = s_stAoDrv.astCastEntity[hHandle & AO_CAST_CHNID_MASK].u32ReqSize;
        stCastParam.hCast = hHandle;
    }
    else
    {
        up(&g_AoMutex);
        goto Close_File;
    }

    stCastInfo.hCast = stCastParam.hCast;
    s32Ret = AO_Cast_GetInfo(stCastInfo.hCast, &stCastInfo);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO(" AO_Cast_GetInfo Failed\n");
        up(&g_AoMutex);
        goto Destory_Cast;
    }
    //HI_ERR_AO(" stCastInfo u32KernelVirtAddr=0x%x \n", stCastInfo.u32KernelVirtAddr);

    stEnableAttr.hCast = stCastParam.hCast;
    stEnableAttr.bCastEnable = HI_TRUE;
    s32Ret = AO_Cast_SetEnable(stEnableAttr.hCast, stEnableAttr.bCastEnable);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO(" AO_Cast_SetEnable Enable Failed\n");
        up(&g_AoMutex);
        //return HI_FAILURE;
        goto Destory_Cast;
    }
    up(&g_AoMutex);

    stCastData.hCast = stCastParam.hCast;
    while (HI_TRUE == bSaveThreadRunFlag) // NO !kthread_should_stop() to avoid dead lock
    {
        HI_U32 u32PcmSize;

        s32Ret = down_interruptible(&g_AoMutex);
        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_AO("lock g_AoMutex failed\n");
            return s32Ret;
        }

        if (bSuspend2SaveThreadFlag == HI_TRUE)
        {
            up(&g_AoMutex);
            goto Destory_Cast;
        }

        s32Ret = AO_Cast_ReadData(stCastData.hCast, &stCastData);
        up(&g_AoMutex);
        if (HI_SUCCESS == s32Ret)
        {
            if (stCastData.stAOFrame.u32PcmSamplesPerFrame == 0)
            {
                msleep(5);
                continue;
            }
            else
            {
                //HI_ERR_AO(" Once Length : %d\n", u32PcmSize);
                //HI_ERR_AO(" Once Offset : %d\n", stCastData.u32DataOffset);
                u32PcmSize = stCastData.stAOFrame.u32PcmSamplesPerFrame * stCastData.stAOFrame.u32Channels * stCastData.stAOFrame.s32BitPerSample / 8;
                if (stThreadArg.pstFileHandle)
                {
                    HI_DRV_FILE_Write(stThreadArg.pstFileHandle, (HI_S8*)(stCastInfo.tKernelVirtAddr + stCastData.u32DataOffset) , u32PcmSize);
                }
                else
                {
                    HI_ERR_AO("stThreadArg.fileHandle is NULL!\n");
                    goto Destory_Cast;
                }
                s32Ret = down_interruptible(&g_AoMutex);
                if (s32Ret != HI_SUCCESS)
                {
                    HI_ERR_AO("lock g_AoMutex failed\n");
                    goto Destory_Cast;
                }

                if (bSuspend2SaveThreadFlag == HI_TRUE)
                {
                    up(&g_AoMutex);
                    goto Destory_Cast;
                }

                s32Ret = AO_Cast_ReleseData(stCastData.hCast, &stCastData);
                up(&g_AoMutex);
                if (HI_SUCCESS != s32Ret)
                {
                    goto Destory_Cast;
                }
            }
        }
        else
        {
            goto Destory_Cast;
        }
    }

Destory_Cast:
    CHECK_AO_CAST_OPEN(stCastParam.hCast);
    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
    }

    s32Ret = AO_Cast_Destory(stCastParam.hCast);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("call AO_Cast_Destory failed(0x%x)\n", s32Ret);
    }

    AO_Cast_FreeHandle(stCastParam.hCast);
    up(&g_AoMutex);
Close_File:
    if (stThreadArg.pstFileHandle)
    {
        HI_DRV_FILE_Close(stThreadArg.pstFileHandle);
    }

    s32Ret = AO_Snd_Kclose(stThreadArg.enSound, stThreadArg.pstDevfileHandle);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Snd_Kclose %d failed \n", (HI_U32)stThreadArg.enSound);
    }

    s32Ret = AO_DRV_Krelease(stThreadArg.pstDevfileHandle);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_DRV_Krelease\n");
    }

    bSaveThread2SuspendFlag = HI_FALSE;
    return HI_SUCCESS;
}

HI_S32 SND_WriteProc(SND_CARD_STATE_S* pCard, HI_BOOL bBypass, SND_DEBUG_CMD_CTRL_E enCmd)
{
    HI_CHAR szPath[AO_SOUND_PATH_NAME_MAXLEN + AO_SOUND_FILE_NAME_MAXLEN] = {0};
    HI_UNF_SND_E enSound;
    static struct  task_struct* g_pstSndSaveThread = NULL; //name todo
    static SND_PCM_SAVE_ATTR_S stThreadArg;
    static AO_SND_Open_Param_S stSndOpenParam;
    static struct file g_file; //just a dev handle no use
    struct tm now;
    HI_S32 s32Ret;

    if (HI_NULL == pCard)
    {
        HI_ERR_AO("Snd not open!\n");
        return HI_FAILURE;
    }

    enSound = SND_CARD_GetSnd(pCard);

    if (SND_DEBUG_CMD_CTRL_START == enCmd && pCard->enSaveState == SND_DEBUG_CMD_CTRL_STOP)
    {
        if (HI_SUCCESS != HI_DRV_FILE_GetStorePath(szPath, AO_SOUND_PATH_NAME_MAXLEN))
        {
            HI_ERR_AO("get store path failed\n");
            return HI_FAILURE;
        }

        time_to_tm(get_seconds(), 0, &now);

        snprintf( szPath, sizeof(szPath), "%s/sound%d_%02u_%02u_%02u.pcm", szPath, (HI_U32)enSound, now.tm_hour, now.tm_min, now.tm_sec);

        pCard->pstFileHandle = HI_DRV_FILE_Open(szPath, 1);
        if (!pCard->pstFileHandle)
        {
            HI_ERR_AO("open %s error\n", szPath);
            return HI_FAILURE;
        }

        stThreadArg.enSound = enSound;
        stThreadArg.bAefBypass = bBypass;
        stThreadArg.pstFileHandle = pCard->pstFileHandle;
        stThreadArg.pstDevfileHandle = &g_file;

        stSndOpenParam.enSound = enSound;
        up(&g_AoMutex);
        s32Ret = AO_DRV_Kopen(&g_file);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("AO_DRV_Kopen failed\n");
        }

        s32Ret = AO_Snd_Kopen(&stSndOpenParam, &g_file);    //never first open
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("AO_Snd_Kopen failed\n");
        }
        s32Ret = down_interruptible(&g_AoMutex);
        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_AO("lock g_AoMutex failed\n");
            return s32Ret;
        }

        bSaveThreadRunFlag = HI_TRUE;
        g_pstSndSaveThread = kthread_run(SndProcSaveThread, &stThreadArg, "AoSndProcSave");        //Name To Do
        if (IS_ERR(g_pstSndSaveThread))
        {
            HI_ERR_AO("creat sound proc write thread failed\n");
            return HI_FAILURE;
        }
        HI_DRV_PROC_EchoHelper("Started saving sound data to %s\n", szPath);

        pCard->u32SaveCnt++;
    }
    else if (SND_DEBUG_CMD_CTRL_START == enCmd && pCard->enSaveState == SND_DEBUG_CMD_CTRL_START)
    {
        HI_DRV_PROC_EchoHelper("Started saving sound data already.\n");
    }

    if (SND_DEBUG_CMD_CTRL_STOP == enCmd && pCard->enSaveState == SND_DEBUG_CMD_CTRL_START)
    {
        bSaveThreadRunFlag = HI_FALSE;
        //kthread_stop(g_pstSndSaveThread);
        g_pstSndSaveThread = HI_NULL;
        HI_DRV_PROC_EchoHelper("Finished saving sound data.\n");

        //Warnning : HI_DRV_FILE_Close called in Thread, To avoid hold mutex lock long time
    }
    else if (SND_DEBUG_CMD_CTRL_STOP == enCmd && pCard->enSaveState == SND_DEBUG_CMD_CTRL_STOP)
    {
        HI_DRV_PROC_EchoHelper("No sound data saved, please start saving.\n");
        AODebugShowHelp(enSound, pCard, HI_NULL);
    }

    pCard->enSaveState = enCmd;

    return HI_SUCCESS;
}

static HI_S32 AOReadSndProc(struct seq_file* p, HI_UNF_SND_E enSnd)
{
    HI_U32 i;
    HI_UNF_SND_ATTR_S* pstSndAttr;
    SND_CARD_STATE_S* pCard;

    pCard = SND_CARD_GetCard(enSnd);
    if (HI_NULL == pCard)
    {
        PROC_PRINT( p, "\n------------------------------------  SOUND[%d] Not Open ----------------------------------\n", (HI_U32)enSnd );
        return HI_SUCCESS;
    }

    PROC_PRINT( p, "\n-------------------------------------------  SOUND[%d]  Status  ----------------------------------------------------\n", (HI_U32)enSnd );
    pstSndAttr = &pCard->stUserOpenParam;

    PROC_PRINT( p,
                "SampleRate   :%d\n",
                pstSndAttr->enSampleRate );

    if (SND_MODE_NONE != pCard->enSpdifPassthrough)
    {
        PROC_PRINT( p,
                    "SPDIF Status :UserSetMode(%s) DataFormat(%s)\n",
                    AUTIL_SpdifMode2Name(pCard->enUserSpdifMode),
                    AUTIL_Format2Name(pCard->u32SpdifDataFormat));
    }

    if (SND_MODE_NONE != pCard->enHdmiPassthrough)
    {
        PROC_PRINT( p,
                    "HDMI Status  :UserSetMode(%s) DataFormat(%s)\n",
                    AUTIL_HdmiMode2Name(pCard->enUserHdmiMode),
                    AUTIL_Format2Name(pCard->u32HdmiDataFormat));
    }

    PROC_PRINT( p, "\n---------------------------------------------  OutPort Status  ---------------------------------------------\n" );
    for (i = 0; i < pstSndAttr->u32PortNum; i++)
    {
        SND_ReadOpProc( p, pCard, pstSndAttr->stOutport[i].enOutPort );
    }

    if (pCard->uSndCastInitFlag)
    {
        PROC_PRINT( p, "------------------------------------------------ Cast Status  ----------------------------------------------\n" );
        CAST_ReadProc(p, pCard);
    }

    if (pCard->uSndTrackInitFlag)
    {
        PROC_PRINT( p, "------------------------------------------------ Track Status  ----------------------------------------------\n" );
        TRACK_ReadProc( p, pCard );
    }

    PROC_PRINT( p, "--------------------------------------------------------------------------------------------------------------------\n");

    return HI_SUCCESS;
}

HI_S32 AO_DRV_ReadProc(struct seq_file* file, HI_VOID* v)
{
    HI_U32 u32Snd;
    DRV_PROC_ITEM_S* pstProcItem;

    pstProcItem = file->private;

    u32Snd = (pstProcItem->entry_name[5] - '0');
    if (u32Snd >= AO_MAX_TOTAL_SND_NUM)
    {
        PROC_PRINT(file, "Invalid Sound ID:%d.\n", u32Snd);
        return HI_FAILURE;
    }

    AOReadSndProc(file, (HI_UNF_SND_E)u32Snd);

    return HI_SUCCESS;
}

static HI_S32 AO_Proc_SetHdmiDebug(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    pCard->bHdmiDebug = !(pCard->bHdmiDebug);
    return HI_SUCCESS;
}

static HI_S32 AO_Proc_SetHdmiModeLpcm(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    return AO_SND_SetHdmiMode(enSound, HI_UNF_SND_OUTPUTPORT_HDMI0, HI_UNF_SND_HDMI_MODE_LPCM);
}

static HI_S32 AO_Proc_SetHdmiModeRaw(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    return AO_SND_SetHdmiMode(enSound, HI_UNF_SND_OUTPUTPORT_HDMI0, HI_UNF_SND_HDMI_MODE_RAW);
}

static HI_S32 AO_Proc_SetHdmiModeHbr2Lbr(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    return AO_SND_SetHdmiMode(enSound, HI_UNF_SND_OUTPUTPORT_HDMI0, HI_UNF_SND_HDMI_MODE_HBR2LBR);
}

static HI_S32 AO_Proc_SetHdmiModeAuto(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    return AO_SND_SetHdmiMode(enSound, HI_UNF_SND_OUTPUTPORT_HDMI0, HI_UNF_SND_HDMI_MODE_AUTO);
}

#ifdef HI_SND_SPDIF_SUPPORT
static HI_S32 AO_Proc_SetSpdifModeLpcm(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    return AO_SND_SetSpdifMode(enSound, HI_UNF_SND_OUTPUTPORT_SPDIF0, HI_UNF_SND_SPDIF_MODE_LPCM);
}

static HI_S32 AO_Proc_SetSpdifModeRaw(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    return AO_SND_SetSpdifMode(enSound, HI_UNF_SND_OUTPUTPORT_SPDIF0, HI_UNF_SND_SPDIF_MODE_RAW);
}
#endif

static HI_BOOL AO_PROC_JUDGE_OUTPORT(HI_CHAR* pcBuf)
{
    if ((pcBuf == strstr(pcBuf, "DAC0")) || (pcBuf == strstr(pcBuf, "DAC1")) || (pcBuf == strstr(pcBuf, "DAC2")) || (pcBuf == strstr(pcBuf, "DAC3"))
        || (pcBuf == strstr(pcBuf, "I2S0")) || (pcBuf == strstr(pcBuf, "I2S1")) || (pcBuf == strstr(pcBuf, "SPDIF0"))
        || (pcBuf == strstr(pcBuf, "HDMI0")) || (pcBuf == strstr(pcBuf, "ARC0")) || (pcBuf == strstr(pcBuf, "ALLPORT")))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_S32 AO_WriteProc_SaveTrack(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    HI_U32 u32TrackId = AO_MAX_TOTAL_TRACK_NUM;
    SND_DEBUG_CMD_CTRL_E enCtrlCmd;
    HI_CHAR* pcStartCmd = "start";
    HI_CHAR* pcStopCmd = "stop";

    if (pcBuf[0] < '0' || pcBuf[0] > '9')//do not have param
    {
        return HI_FAILURE;
    }

    u32TrackId = (HI_U32)simple_strtoul(pcBuf, &pcBuf, 10);
    if (u32TrackId >= AO_MAX_TOTAL_TRACK_NUM)
    {
        return HI_FAILURE;
    }

    AO_STRING_SKIP_NON_BLANK(pcBuf);
    AO_STRING_SKIP_BLANK(pcBuf);

    if (pcBuf == strstr(pcBuf, pcStartCmd))
    {
        enCtrlCmd = SND_DEBUG_CMD_CTRL_START;
    }
    else if (pcBuf == strstr(pcBuf, pcStopCmd))
    {
        enCtrlCmd = SND_DEBUG_CMD_CTRL_STOP;
    }
    else
    {
        return HI_FAILURE;
    }

    if (HI_SUCCESS != TRACK_WriteProc_SaveData(pCard, u32TrackId, enCtrlCmd))
    {
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 AO_WriteProc_SaveSound(HI_UNF_SND_E enSound, SND_CARD_STATE_S* pCard, HI_CHAR* pcBuf)
{
    SND_DEBUG_CMD_CTRL_E enCtrlCmd;
    HI_BOOL bBypass;
    HI_CHAR* pcStartCmd = "start";
    HI_CHAR* pcStopCmd = "stop";
    HI_CHAR* pcAefCmd = "aef";

    if (pcBuf == strstr(pcBuf, pcAefCmd))
    {
        bBypass = HI_FALSE;
        pcBuf += strlen(pcAefCmd);
        AO_STRING_SKIP_BLANK(pcBuf);
    }
    else
    {
        bBypass = HI_TRUE;
    }

    if (pcBuf == strstr(pcBuf, pcStartCmd))
    {
        enCtrlCmd = SND_DEBUG_CMD_CTRL_START;
    }
    else if (pcBuf == strstr(pcBuf, pcStopCmd))
    {
        enCtrlCmd = SND_DEBUG_CMD_CTRL_STOP;
    }
    else
    {
        return HI_FAILURE;
    }

#ifdef __DPT__
    if (HI_FALSE == bBypass)
    {
        if (HI_SUCCESS != SND_AefWriteProc(pCard, HI_FALSE, enCtrlCmd))
        {
            return HI_FAILURE;
        }
    }
    else
#endif
    {
        if (HI_SUCCESS != SND_WriteProc(pCard, HI_TRUE, enCtrlCmd))
        {
            return HI_FAILURE;
        }
    }

    return HI_SUCCESS;
}

HI_S32 AO_DRV_WriteProc(struct file* file, const char __user* buf, size_t count, loff_t* ppos)
{
    HI_S32 s32Ret;
    HI_U32 u32Snd;
    HI_U32 u32CmdId;
    SND_CARD_STATE_S* pCard  = HI_NULL;
    HI_CHAR szBuf[256] = {0};
    HI_CHAR* pcBuf = szBuf;

    struct seq_file* p = file->private_data;
    DRV_PROC_ITEM_S* pstProcItem = p->private;

    SND_WRITE_PROC_S stWritePoc[] =
    {
        {"help",            AODebugShowHelp},
        {"*help",           AODebugShowPivHelp},
        {"save_sound",      AO_WriteProc_SaveSound},
        {"save_track",      AO_WriteProc_SaveTrack},
        {"TRACK",           TRACK_WriteProc},
        {"hdmi=debug",      AO_Proc_SetHdmiDebug},
        {"hdmi=pcm",        AO_Proc_SetHdmiModeLpcm},
        {"hdmi=raw",        AO_Proc_SetHdmiModeRaw},
        {"hdmi=hbr2lbr",    AO_Proc_SetHdmiModeHbr2Lbr},
        {"hdmi=auto",       AO_Proc_SetHdmiModeAuto},
#ifdef HI_SND_SPDIF_SUPPORT
        {"spdif=pcm",       AO_Proc_SetSpdifModeLpcm},
        {"spdif=raw",       AO_Proc_SetSpdifModeRaw},
#endif
    };

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    if (copy_from_user(szBuf, buf, count < sizeof(szBuf) - 1 ? count : sizeof(szBuf) - 1))
    {
        HI_ERR_AO("copy from user failed\n");
        up(&g_AoMutex);
        return HI_FAILURE;
    }

    // sizeof("sound") is 5
    u32Snd = (pstProcItem->entry_name[5] - '0');
    if (u32Snd >= AO_MAX_TOTAL_SND_NUM)
    {
        HI_ERR_AO("Invalid Sound ID:%d\n", u32Snd);
        goto SAVE_CMD_FAULT;
    }

    pCard = SND_CARD_GetCard((HI_UNF_SND_E)u32Snd);
    if (HI_NULL == pCard)
    {
        HI_ERR_AO("Sound %d is not open\n", u32Snd);
        goto SAVE_CMD_FAULT;
    }

    AO_STRING_SKIP_BLANK(pcBuf);

    if (HI_TRUE == AO_PROC_JUDGE_OUTPORT(pcBuf))
    {
        if (HI_SUCCESS != SND_WriteOpProc(pCard, pcBuf))
        {
            goto SAVE_CMD_FAULT;
        }
    }

    for (u32CmdId = 0; u32CmdId < sizeof(stWritePoc) / sizeof(stWritePoc[0]); u32CmdId++)
    {
        if (pcBuf == strstr(pcBuf, stWritePoc[u32CmdId].pCmd))
        {
            pcBuf += strlen(stWritePoc[u32CmdId].pCmd);
            AO_STRING_SKIP_BLANK(pcBuf);
            if (HI_SUCCESS != stWritePoc[u32CmdId].func(u32Snd, pCard, pcBuf))
            {
                goto SAVE_CMD_FAULT;
            }
            break;
        }
    }

    up(&g_AoMutex);
    return count;

SAVE_CMD_FAULT:
    HI_ERR_AO("proc cmd is fault\n");
    AODebugShowHelp(u32Snd, pCard, pcBuf);
    up(&g_AoMutex);
    return HI_FAILURE;
}

static HI_S32 AO_RegProc(HI_U32 u32Snd)
{
    HI_CHAR aszBuf[16];
    DRV_PROC_ITEM_S* pProcItem;

    /* Create proc */
    snprintf(aszBuf, sizeof(aszBuf), "sound%d", u32Snd);
    pProcItem = HI_DRV_PROC_AddModule(aszBuf, HI_NULL, HI_NULL);
    if (!pProcItem)
    {
        HI_INFO_AO("Create sound%d proc entry fail!\n", u32Snd);
        return HI_FAILURE;
    }

    /* Set functions */
    pProcItem->read  = s_stAoDrv.stProcParam.pfnReadProc;
    pProcItem->write = s_stAoDrv.stProcParam.pfnWriteProc;

    HI_INFO_AO("Create sound%d proc entry OK!\n", u32Snd);
    return HI_SUCCESS;
}

static HI_VOID AO_UnRegProc(HI_U32 u32Snd)
{
    HI_CHAR aszBuf[16];
    snprintf(aszBuf, sizeof(aszBuf), "sound%d", u32Snd);

    HI_DRV_PROC_RemoveModule(aszBuf);
}
#endif

static HI_S32 AO_OpenDev(HI_VOID)
{
    HI_U32 i;

    HI_S32 s32Ret;

    /* Init global track parameter */
    for (i = 0; i < AO_MAX_TOTAL_TRACK_NUM; i++)
    {
        atomic_set(&s_stAoDrv.astTrackEntity[i].atmUseCnt, 0);
    }

    s_stAoDrv.u32SndNum = 0;
    /* Init global snd parameter */
    for (i = 0; i < AO_MAX_TOTAL_SND_NUM; i++)
    {
        atomic_set(&s_stAoDrv.astSndEntity[i].atmUseTotalCnt, 0);
    }

    /* Get pdm functions */
    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_PDM, (HI_VOID**)&s_stAoDrv.pstPDMFunc);
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_AO("Get pdm function err:%#x!\n", s32Ret);
        return s32Ret;
    }

    /* HAL_AIAO_Init, Init aiao hardware */
    HAL_AIAO_Init();

    /* HAL_AOE_Init , Init aoe hardware */
    s32Ret = HAL_AOE_Init();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_AO("call HAL_AOE_Init failed(0x%x)\n", s32Ret);
        HAL_AIAO_DeInit();
        return s32Ret;
    }

#ifdef HI_PROC_SUPPORT
    /* HAL_CAST_Init , Init cast hardware */
    HAL_CAST_Init();
#endif

    /* Set ready flag */
    s_stAoDrv.bReady = HI_TRUE;

    HI_INFO_AO("AO_OpenDev OK.\n");
    return HI_SUCCESS;
}

static HI_S32 AO_CloseDev(HI_VOID)
{
    HI_U32 i, j;

    DRV_AO_STATE_S* pAOState = HI_NULL;

    /* Reentrant */
    if (s_stAoDrv.bReady == HI_FALSE)
    {
        return HI_SUCCESS;
    }

    /* Set ready flag */
    s_stAoDrv.bReady = HI_FALSE;

#ifdef HI_PROC_SUPPORT
    /* Free all Cast */
    for (i = 0; i < AO_MAX_CAST_NUM; i++)
    {
        if (atomic_read(&s_stAoDrv.astCastEntity[i].atmUseCnt))
        {
            (HI_VOID)AO_Cast_Destory( i );
            AO_Cast_FreeHandle(i);
        }
    }
#endif

    /* Free all track */
    for (i = 0; i < AO_MAX_TOTAL_TRACK_NUM; i++)
    {
        if (atomic_read(&s_stAoDrv.astTrackEntity[i].atmUseCnt))
        {
            (HI_VOID)AO_Track_Destory(i);
            AO_Track_FreeHandleById(i);
        }
    }

    /* Free all snd */
    for (i = 0; i < AO_MAX_TOTAL_SND_NUM; i++)
    {
        if (s_stAoDrv.astSndEntity[i].pCard)
        {
            for (j = 0; j < SND_MAX_OPEN_NUM; j++)
            {
                if (s_stAoDrv.astSndEntity[i].pstFile[j] != 0)
                {
                    HI_U32 u32UserOpenCnt = 0;
                    pAOState = (DRV_AO_STATE_S*)((s_stAoDrv.astSndEntity[i].pstFile[j]))->private_data;

                    u32UserOpenCnt = atomic_read(&pAOState->atmUserOpenCnt[i]);
                    if (atomic_sub_and_test(u32UserOpenCnt, &s_stAoDrv.astSndEntity[i].atmUseTotalCnt))
                    {
                        (HI_VOID)AO_SND_Close( i, HI_FALSE );
                    }
                    AO_Snd_FreeHandle(i, s_stAoDrv.astSndEntity[i].pstFile[j]);
                }
            }
        }
    }

    /* HAL_AOE_DeInit */
    HAL_AOE_DeInit();

#ifdef HI_PROC_SUPPORT
    /* HAL_CAST_DeInit  */
    HAL_CAST_DeInit();
#endif

    /* HAL_AIAO_DeInit */
    HAL_AIAO_DeInit();

    return HI_SUCCESS;
}

/* ao ioctl start */
static HI_S32 AO_IOCTL_GetSndDefOpenAttr(struct file* file, HI_VOID* arg)
{
    return AOGetSndDefOpenAttr((AO_SND_OpenDefault_Param_S_PTR)arg);
}

static HI_S32 AO_IOCTL_SndOpen(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_SND_E enSound = HI_UNF_SND_BUTT;
    DRV_AO_STATE_S* pstAOState = file->private_data;
    AO_SND_Open_Param_S_PTR pstParam = (AO_SND_Open_Param_S_PTR)arg;

    enSound = pstParam->enSound;
    CHECK_AO_SNDCARD(enSound);

    s32Ret = AO_Snd_AllocHandle(enSound, file);
    if (HI_SUCCESS == s32Ret)
    {
        if (0 == atomic_read(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
        {
            s32Ret = AO_SND_Open(enSound, &pstParam->stAttr, HI_FALSE);
            if (HI_SUCCESS != s32Ret)
            {
                AO_Snd_FreeHandle(enSound, file);
                return s32Ret;
            }
        }
    }

    atomic_inc(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
    atomic_inc(&pstAOState->atmUserOpenCnt[enSound]);

    return s32Ret;
}

static HI_S32 AO_IOCTL_SndClose(struct file* file, HI_VOID* arg)
{
    HI_UNF_SND_E enSound = HI_UNF_SND_BUTT;
    HI_U32 u32TrackIdx = 0;
    DRV_AO_STATE_S* pstAOState = file->private_data;

    enSound = *( HI_UNF_SND_E*)arg;
    CHECK_AO_SNDCARD_OPEN(enSound);

    if (atomic_dec_and_test(&pstAOState->atmUserOpenCnt[enSound]))
    {
        if (atomic_dec_and_test(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
        {
            HI_S32 s32Ret = HI_SUCCESS;

            //destory all track before close sound
            for (u32TrackIdx = 0; u32TrackIdx < AO_MAX_TOTAL_TRACK_NUM; u32TrackIdx++)
            {
                if (atomic_read(&s_stAoDrv.astTrackEntity[u32TrackIdx].atmUseCnt))
                {

                    if (TRACK_CARD_GetCard(u32TrackIdx) != SND_CARD_GetCard(enSound))
                    {
                        continue;
                    }

                    (HI_VOID)AO_Track_Destory(u32TrackIdx);
                    AO_Track_FreeHandleById(u32TrackIdx);
                }
            }

            s32Ret = AO_SND_Close( enSound, HI_FALSE );
            if (HI_SUCCESS != s32Ret)
            {
                atomic_inc(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
                atomic_inc(&pstAOState->atmUserOpenCnt[enSound]);
                return s32Ret;
            }

            AO_Snd_FreeHandle(enSound, file);
        }
    }
    else
    {
        atomic_dec(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
    }

    return HI_SUCCESS;
}

static HI_S32 AO_IOCTL_SndSetMute(struct file* file, HI_VOID* arg)
{
    AO_SND_Mute_Param_S_PTR pstMute = (AO_SND_Mute_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMute->enSound);
    return AO_SND_SetMute(pstMute->enSound, pstMute->enOutPort, pstMute->bMute);
}

static HI_S32 AO_IOCTL_SndGetMute(struct file* file, HI_VOID* arg)
{
    AO_SND_Mute_Param_S_PTR pstMute = (AO_SND_Mute_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMute->enSound);
    return AO_SND_GetMute(pstMute->enSound, pstMute->enOutPort, &pstMute->bMute);
}

static HI_S32 AO_IOCTL_SndSetVolume(struct file* file, HI_VOID* arg)
{
    AO_SND_Volume_Param_S_PTR pstVolume = (AO_SND_Volume_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstVolume->enSound);
    return AO_SND_SetVolume(pstVolume->enSound, pstVolume->enOutPort, &pstVolume->stGain);
}

static HI_S32 AO_IOCTL_SndGetVolume(struct file* file, HI_VOID* arg)
{
    AO_SND_Volume_Param_S_PTR pstVolume = (AO_SND_Volume_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstVolume->enSound);
    return AO_SND_GetVolume(pstVolume->enSound, pstVolume->enOutPort, &pstVolume->stGain);
}

static HI_S32 AO_IOCTL_SndSetHdmiMode(struct file* file, HI_VOID* arg)
{
    AO_SND_HdmiMode_Param_S_PTR pstMode = (AO_SND_HdmiMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMode->enSound);
    return AO_SND_SetHdmiMode(pstMode->enSound, pstMode->enOutPort, pstMode->enMode);
}

static HI_S32 AO_IOCTL_SndGetHdmiMode(struct file* file, HI_VOID* arg)
{
    AO_SND_HdmiMode_Param_S_PTR pstMode = (AO_SND_HdmiMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMode->enSound);
    return AO_SND_GetHdmiMode(pstMode->enSound, pstMode->enOutPort, &pstMode->enMode);
}

#ifdef HI_SND_SPDIF_SUPPORT
static HI_S32 AO_IOCTL_SndSetSpdifMode(struct file* file, HI_VOID* arg)
{
    AO_SND_SpdifMode_Param_S_PTR pstMode = (AO_SND_SpdifMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMode->enSound);
    return AO_SND_SetSpdifMode(pstMode->enSound, pstMode->enOutPort, pstMode->enMode);
}

static HI_S32 AO_IOCTL_SndGetSpdifMode(struct file* file, HI_VOID* arg)
{
    AO_SND_SpdifMode_Param_S_PTR pstMode = (AO_SND_SpdifMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMode->enSound);
    return AO_SND_GetSpdifMode(pstMode->enSound, pstMode->enOutPort, &pstMode->enMode);
}
#endif

static HI_S32 AO_IOCTL_SndSetTrackMode(struct file* file, HI_VOID* arg)
{
    AO_SND_TrackMode_Param_S_PTR pstMode = (AO_SND_TrackMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMode->enSound);
    return AO_SND_SetTrackMode(pstMode->enSound, pstMode->enOutPort, pstMode->enMode);
}

static HI_S32 AO_IOCTL_SndGetTrackMode(struct file* file, HI_VOID* arg)
{
    AO_SND_TrackMode_Param_S_PTR pstMode = (AO_SND_TrackMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstMode->enSound);
    return AO_SND_GetTrackMode(pstMode->enSound, pstMode->enOutPort, &pstMode->enMode);
}

#ifdef HI_SND_SPDIF_SUPPORT

static HI_S32 AO_IOCTL_SndSetSpdifSCMSMode(struct file* file, HI_VOID* arg)
{
    AO_SND_SpdifSCMSMode_Param_S_PTR pstSCMSMode = (AO_SND_SpdifSCMSMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstSCMSMode->enSound);
    return AO_SND_SetSpdifSCMSMode(pstSCMSMode->enSound, pstSCMSMode->enOutPort, pstSCMSMode->enSCMSMode);
}

static HI_S32 AO_IOCTL_SndGetSpdifSCMSMode(struct file* file, HI_VOID* arg)
{
    AO_SND_SpdifSCMSMode_Param_S_PTR pstSCMSMode = (AO_SND_SpdifSCMSMode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN( pstSCMSMode->enSound );
    return AO_SND_GetSpdifSCMSMode(pstSCMSMode->enSound, pstSCMSMode->enOutPort, &pstSCMSMode->enSCMSMode);
}

static HI_S32 AO_IOCTL_SndSetSpdifCategoryCode(struct file* file, HI_VOID* arg)
{
    AO_SND_SpdifCategoryCode_Param_S_PTR pstCategoryCode = (AO_SND_SpdifCategoryCode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstCategoryCode->enSound);
    return AO_SND_SetSpdifCategoryCode(pstCategoryCode->enSound, pstCategoryCode->enOutPort, pstCategoryCode->enCategoryCode);
}

static HI_S32 AO_IOCTL_SndGetSpdifCategoryCode(struct file* file, HI_VOID* arg)
{
    AO_SND_SpdifCategoryCode_Param_S_PTR pstCategoryCode = (AO_SND_SpdifCategoryCode_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstCategoryCode->enSound);
    return AO_SND_GetSpdifCategoryCode(pstCategoryCode->enSound, pstCategoryCode->enOutPort, &pstCategoryCode->enCategoryCode);
}
#endif

static HI_S32 AO_IOCTL_SndSetAllTrackMute(struct file* file, HI_VOID* arg)
{
    AO_SND_AllTrackMute_Param_S_PTR pstAllMute = (AO_SND_AllTrackMute_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstAllMute->enSound);
    return AO_SND_SetAllTrackMute(pstAllMute->enSound, pstAllMute->bMute);
}

static HI_S32 AO_IOCTL_SndGetAllTrackMute(struct file* file, HI_VOID* arg)
{
    AO_SND_AllTrackMute_Param_S_PTR pstAllMute = (AO_SND_AllTrackMute_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstAllMute->enSound);
    return AO_SND_GetAllTrackMute(pstAllMute->enSound, &pstAllMute->bMute);
}

static HI_S32 AO_IOCTL_SndSetAdacEnable(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    SND_CARD_STATE_S* pCard;
    AO_SND_Adac_Enable_Param_S_PTR pstParam = (AO_SND_Adac_Enable_Param_S_PTR)arg;

    CHECK_AO_SNDCARD_OPEN(pstParam->enSound);
    pCard = SND_CARD_GetCard(pstParam->enSound);

    s32Ret = SND_SetAdacEnable(pCard, pstParam->bEnable);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintCallFunErr(SND_SetAdacEnable, s32Ret);
        return s32Ret;
    }

    pCard->bAdacEnable = pstParam->bEnable;

    return s32Ret;
}

static HI_S32 AO_IOCTL_SndGetAdacEnable(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    SND_CARD_STATE_S* pCard;
    AO_SND_Adac_Enable_Param_S_PTR pstParam = (AO_SND_Adac_Enable_Param_S_PTR)arg;

    CHECK_AO_SNDCARD_OPEN(pstParam->enSound);
    pCard = SND_CARD_GetCard(pstParam->enSound);

    pstParam->bEnable = pCard->bAdacEnable;

    return s32Ret;
}

static HI_S32 AO_IOCTL_SndSetPreciVolume(struct file* file, HI_VOID* arg)
{
    AO_SND_PreciVolume_Param_S_PTR pstPreciVol = (AO_SND_PreciVolume_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstPreciVol->enSound);
    return AO_SND_SetPreciVol(pstPreciVol->enSound, pstPreciVol->enOutPort, pstPreciVol->stPreciGain);
}

static HI_S32 AO_IOCTL_SndGetPreciVolume(struct file* file, HI_VOID* arg)
{
    AO_SND_PreciVolume_Param_S_PTR pstPreciVol = (AO_SND_PreciVolume_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN( pstPreciVol->enSound );
    return AO_SND_GetPreciVol(pstPreciVol->enSound, pstPreciVol->enOutPort, &pstPreciVol->stPreciGain);
}

static HI_S32 AO_IOCTL_SndGetXRunCount(struct file* file, HI_VOID* arg)
{

    AO_SND_Get_Xrun_Param_S_PTR pstXrunStatus = (AO_SND_Get_Xrun_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstXrunStatus->enSound);
    return AO_Snd_GetXRunCount(pstXrunStatus->enSound, &pstXrunStatus->u32Count);
}

static HI_S32 AO_IOCTL_SndSetDelayCompensation(struct file* file, HI_VOID* arg)
{
#if defined (HI_SOUND_PORT_DELAY_SUPPORT)
    AO_SND_OpDelay_Param_S_PTR pstSetDelay = (AO_SND_OpDelay_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstSetDelay->enSound);
    return AO_SND_SetDelayCompensation(pstSetDelay->enSound, pstSetDelay->enOutPort, pstSetDelay->u32DelayMs);
#else
    HI_ERR_AO("Do not Support, enable 'SND Port Delay' at make menuconfig.\n");
    return HI_ERR_AO_NOTSUPPORT;
#endif
}

static HI_S32 AO_IOCTL_SndGetDelayCompensation(struct file* file, HI_VOID* arg)
{
#if defined (HI_SOUND_PORT_DELAY_SUPPORT)
    AO_SND_OpDelay_Param_S_PTR pstSetDelay = (AO_SND_OpDelay_Param_S_PTR)arg;
    CHECK_AO_SNDCARD_OPEN(pstSetDelay->enSound);
    return AO_SND_GetDelayCompensation(pstSetDelay->enSound, pstSetDelay->enOutPort, &pstSetDelay->u32DelayMs);
#else
    HI_ERR_AO("Do not Support, enable 'SND Port Delay' at make menuconfig.\n");
    return HI_ERR_AO_NOTSUPPORT;
#endif
}

/* AO Track ioctl */
static HI_S32 AO_IOCTL_TrackGetDefAttr(struct file* file, HI_VOID* arg)
{
    return AO_Track_GetDefAttr((HI_UNF_AUDIOTRACK_ATTR_S*)arg);
}

static HI_S32 AO_IOCTL_TrackCreate(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    HI_HANDLE hHandle;
    AO_Track_Create_Param_S_PTR pstTrack = (AO_Track_Create_Param_S_PTR)arg;

    s32Ret = AO_Track_AllocHandle(pstTrack->enSound, pstTrack->stAttr.enTrackType, file, &hHandle);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Track_AllocHandle failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    s32Ret = AO_Track_PreCreate(pstTrack->enSound, &pstTrack->stAttr, pstTrack->bAlsaTrack,
                                &pstTrack->stBuf, hHandle);
    if (HI_SUCCESS != s32Ret)
    {
        AO_Track_FreeHandle(hHandle);
        return s32Ret;
    }

    AO_TRACK_SaveSuspendAttr(hHandle, pstTrack);
    pstTrack->hTrack = hHandle;

    return HI_SUCCESS;
}

static HI_S32 AO_IOCTL_TrackDestory(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    HI_HANDLE hTrack = *(HI_HANDLE*)arg;

    CHECK_AO_TRACK_OPEN(hTrack);

    s32Ret = AO_Track_Destory(hTrack);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Track_Destory failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    AO_Track_FreeHandle(hTrack);

    return HI_SUCCESS;
}

static HI_S32 AO_IOCTL_TrackStart(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    HI_HANDLE hTrack = *(HI_HANDLE*)arg;

    CHECK_AO_TRACK_OPEN(hTrack);

    s32Ret = AO_Track_Start(hTrack);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Track_Start failed(0x%x)\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 AO_IOCTL_TrackStop(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    HI_HANDLE hTrack = *(HI_HANDLE*)arg;

    CHECK_AO_TRACK_OPEN(hTrack);

    s32Ret = AO_Track_Stop(hTrack);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Track_Stop failed(0x%x)\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 AO_IOCTL_TrackPause(struct file* file, HI_VOID* arg)
{
    HI_HANDLE hTrack = *(HI_HANDLE*)arg;
    HI_U32 u32TrackID;
    SND_CARD_STATE_S* pCard;

    CHECK_AO_TRACK_OPEN(hTrack);

    u32TrackID = hTrack & AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_Pause(pCard, u32TrackID);
}

static HI_S32 AO_IOCTL_TrackFlush(struct file* file, HI_VOID* arg)
{
    HI_HANDLE hTrack = *(HI_HANDLE*)arg;
    HI_U32 u32TrackID;
    SND_CARD_STATE_S* pCard;

    CHECK_AO_TRACK_OPEN(hTrack);

    u32TrackID = hTrack & AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_Flush(pCard, u32TrackID);
}

static HI_S32 AO_IOCTL_TrackSendData(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    AO_Track_SendData_Param_S_PTR pstData = (AO_Track_SendData_Param_S_PTR)arg;

    CHECK_AO_TRACK_OPEN(pstData->hTrack);

    s32Ret = AO_Track_SendData(pstData->hTrack, &pstData->stAOFrame);
    if (HI_FAILURE == s32Ret)
    {
        HI_ERR_AO("AO_Track_SendData failed(0x%x)\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 AO_IOCTL_TrackSetWeight(struct file* file, HI_VOID* arg)
{
    AO_Track_Weight_Param_S_PTR pstWeight = (AO_Track_Weight_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstWeight->hTrack);
    return AO_Track_SetWeight(pstWeight->hTrack, &pstWeight->stTrackGain);
}

static HI_S32 AO_IOCTL_TrackGetWeight(struct file* file, HI_VOID* arg)
{
    AO_Track_Weight_Param_S_PTR pstWeight = (AO_Track_Weight_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstWeight->hTrack);
    return AO_Track_GetWeight(pstWeight->hTrack, &pstWeight->stTrackGain);
}

static HI_S32 AO_IOCTL_TrackSetSpeedAdjust(struct file* file, HI_VOID* arg)
{
    AO_Track_SpeedAdjust_Param_S_PTR pstSpeed = (AO_Track_SpeedAdjust_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstSpeed->hTrack);
    return AO_Track_SetSpeedAdjust(pstSpeed->hTrack, pstSpeed->enType, pstSpeed->s32Speed);
}

static HI_S32 AO_IOCTL_TrackGetDelayMs(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    HI_U32 u32TrackDelayMs = 0;
    HI_U32 u32ExtDelayMs = 0;
    AO_Track_DelayMs_Param_S_PTR pstDelayMs = (AO_Track_DelayMs_Param_S_PTR)arg;

    CHECK_AO_TRACK_OPEN(pstDelayMs->hTrack);

    s32Ret = AO_Track_GetDelayMs(pstDelayMs->hTrack, &u32TrackDelayMs);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Track_GetDelayMs failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    s32Ret = AO_Track_GetExtDelayMs(pstDelayMs->hTrack, &u32ExtDelayMs);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Track_GetExtDelayMs failed(0x%x)\n", s32Ret);
        return s32Ret;
    }
    pstDelayMs->u32DelayMs = u32TrackDelayMs + u32ExtDelayMs;

    return s32Ret;
}

static HI_S32 AO_IOCTL_TrackIsBufEmpty(struct file* file, HI_VOID* arg)
{
    AO_Track_BufEmpty_Param_S_PTR pstBufEmpty = (AO_Track_BufEmpty_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstBufEmpty->hTrack);
    return AO_Track_IsBufEmpty(pstBufEmpty->hTrack, &pstBufEmpty->bEmpty);
}

static HI_S32 AO_IOCTL_TrackSetEosFlag(struct file* file, HI_VOID* arg)
{
    AO_Track_EosFlag_Param_S_PTR pstEosFlag = (AO_Track_EosFlag_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstEosFlag->hTrack);
    return AO_Track_SetEosFlag(pstEosFlag->hTrack, pstEosFlag->bEosFlag);
}

static HI_S32 AO_IOCTL_TrackSetAttr(struct file* file, HI_VOID* arg)
{
    AO_Track_Attr_Param_S_PTR pstTrackAttr = (AO_Track_Attr_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstTrackAttr->hTrack);
    return AO_Track_PreSetAttr(pstTrackAttr->hTrack, &pstTrackAttr->stAttr);
}

static HI_S32 AO_IOCTL_TrackGetAttr(struct file* file, HI_VOID* arg)
{
    AO_Track_Attr_Param_S_PTR pstTrackAttr = (AO_Track_Attr_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstTrackAttr->hTrack);
    return AO_Track_GetAttr(pstTrackAttr->hTrack, &pstTrackAttr->stAttr);
}

#if defined (HI_AUDIO_AI_SUPPORT)
static HI_S32 AO_IOCTL_TrackAttachAi(struct file* file, HI_VOID* arg)
{
    AO_Track_AttAi_Param_S_PTR pstTrackAttAi = (AO_Track_AttAi_Param_S_PTR)arg;
    CHECK_AI_ID(pstTrackAttAi->hAi);
    CHECK_AO_TRACK_OPEN(pstTrackAttAi->hTrack);
    return AO_Track_AttachAi(pstTrackAttAi->hTrack, pstTrackAttAi->hAi);
}

static HI_S32 AO_IOCTL_TrackDetachAi(struct file* file, HI_VOID* arg)
{
    AO_Track_AttAi_Param_S_PTR pstTrackDetAi = (AO_Track_AttAi_Param_S_PTR)arg;
    CHECK_AI_ID(pstTrackDetAi->hAi);
    CHECK_AO_TRACK_OPEN(pstTrackDetAi->hTrack);
    return AO_Track_DetachAi(pstTrackDetAi->hTrack, pstTrackDetAi->hAi);
}
#endif

static HI_S32 AO_IOCTL_TrackSetAbsGain(struct file* file, HI_VOID* arg)
{
    AO_Track_AbsGain_Param_S_PTR pstAbsGain = (AO_Track_AbsGain_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstAbsGain->hTrack);
    return AO_Track_SetAbsGain(pstAbsGain->hTrack, &pstAbsGain->stTrackAbsGain);
}

static HI_S32 AO_IOCTL_TrackGetAbsGain(struct file* file, HI_VOID* arg)
{
    AO_Track_AbsGain_Param_S_PTR pstAbsGain = (AO_Track_AbsGain_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstAbsGain->hTrack);
    return AO_Track_GetAbsGain(pstAbsGain->hTrack, &pstAbsGain->stTrackAbsGain);
}

static HI_S32 AO_IOCTL_TrackSetMute(struct file* file, HI_VOID* arg)
{
    AO_Track_Mute_Param_S_PTR pstMute = (AO_Track_Mute_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstMute->hTrack);
    return AO_Track_SetMute(pstMute->hTrack, pstMute->bMute);
}

static HI_S32 AO_IOCTL_TrackGetMute(struct file* file, HI_VOID* arg)
{
    AO_Track_Mute_Param_S_PTR pstMute = (AO_Track_Mute_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstMute->hTrack);
    return AO_Track_GetMute(pstMute->hTrack, &pstMute->bMute);
}

static HI_S32 AO_IOCTL_TrackSetChannelMode(struct file* file, HI_VOID* arg)
{
    AO_Track_ChannelMode_Param_S_PTR pstChannelMode = (AO_Track_ChannelMode_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstChannelMode->hTrack);
    return AO_Track_SetChannelMode(pstChannelMode->hTrack, pstChannelMode->enMode);
}

static HI_S32 AO_IOCTL_TrackGetChannelMode(struct file* file, HI_VOID* arg)
{
    AO_Track_ChannelMode_Param_S_PTR pstChannelMode = (AO_Track_ChannelMode_Param_S_PTR)arg;
    CHECK_AO_TRACK_OPEN(pstChannelMode->hTrack);
    return AO_Track_GetChannelMode(pstChannelMode->hTrack, &pstChannelMode->enMode);
}

#ifdef HI_PROC_SUPPORT
static HI_S32 AO_IOCTL_CastGetDefAttr(struct file* file, HI_VOID* arg)
{
    return CAST_GetDefAttr((HI_UNF_SND_CAST_ATTR_S*)arg);
}

static HI_S32 AO_IOCTL_CastCreate(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret;
    HI_HANDLE hHandle;
    AO_Cast_Create_Param_S_PTR pstCastAttr = (AO_Cast_Create_Param_S_PTR)arg;

    CHECK_AO_SNDCARD_OPEN(pstCastAttr->enSound);

    s32Ret = AO_Cast_AllocHandle(&hHandle, file, &pstCastAttr->stCastAttr);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO_Cast_AllocHandle failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    s32Ret = AO_Cast_Create(pstCastAttr->enSound,
                         &pstCastAttr->stCastAttr,
                         &s_stAoDrv.astCastEntity[hHandle & AO_CAST_CHNID_MASK].stRbfMmz,
                         hHandle);
    if (HI_SUCCESS != s32Ret)
    {
        AO_Cast_FreeHandle(hHandle);
        HI_ERR_AO("AO_Cast_Create failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    AO_Cast_SaveSuspendAttr(pstCastAttr->enSound, hHandle, &pstCastAttr->stCastAttr);
    pstCastAttr->u32ReqSize = s_stAoDrv.astCastEntity[hHandle & AO_CAST_CHNID_MASK].u32ReqSize;
    pstCastAttr->hCast = hHandle;

    return HI_SUCCESS;
}

static HI_S32 AO_IOCTL_CastDestory(struct file* file, HI_VOID* arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hCast = *(HI_HANDLE*)arg;

    CHECK_AO_CAST_OPEN(hCast);

    s32Ret = AO_Cast_Destory(hCast);
    if (HI_SUCCESS != s32Ret)
    {
        return s32Ret;
    }

    AO_Cast_FreeHandle(hCast);

    return s32Ret;
}

static HI_S32 AO_IOCTL_CastSetInfo(struct file* file, HI_VOID* arg)
{
    AO_Cast_Info_Param_S_PTR pstInfo = (AO_Cast_Info_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstInfo->hCast);
    return AO_Cast_SetInfo(pstInfo->hCast, pstInfo->tUserVirtAddr);
}

static HI_S32 AO_IOCTL_CastGetInfo(struct file* file, HI_VOID* arg)
{
    AO_Cast_Info_Param_S_PTR pstInfo = (AO_Cast_Info_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstInfo->hCast);
    return AO_Cast_GetInfo(pstInfo->hCast, pstInfo);
}

static HI_S32 AO_IOCTL_CastSetEnable(struct file* file, HI_VOID* arg)
{
    AO_Cast_Enable_Param_S_PTR pstEnable = (AO_Cast_Enable_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstEnable->hCast);
    return AO_Cast_SetEnable(pstEnable->hCast, pstEnable->bCastEnable);
}

static HI_S32 AO_IOCTL_CastGetEnable(struct file* file, HI_VOID* arg)
{
    AO_Cast_Enable_Param_S_PTR pstEnable = (AO_Cast_Enable_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstEnable->hCast);
    return AO_Cast_GetEnable(pstEnable->hCast, &pstEnable->bCastEnable);
}

static HI_S32 AO_IOCTL_CastAcquireFrame(struct file* file, HI_VOID* arg)
{
    AO_Cast_Data_Param_S_PTR pstCastData = (AO_Cast_Data_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstCastData->hCast);
    return AO_Cast_ReadData(pstCastData->hCast, pstCastData);
}

static HI_S32 AO_IOCTL_CastReleaseFrame(struct file* file, HI_VOID* arg)
{
    AO_Cast_Data_Param_S_PTR pstCastData = (AO_Cast_Data_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstCastData->hCast);
    return AO_Cast_ReleseData(pstCastData->hCast, pstCastData);
}

static HI_S32 AO_IOCTL_CastSetAbsGain(struct file* file, HI_VOID* arg)
{
    AO_Cast_AbsGain_Param_S_PTR pstAbsGain = (AO_Cast_AbsGain_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstAbsGain->hCast);
    return AO_Cast_SetAbsGain(pstAbsGain->hCast, pstAbsGain->stCastAbsGain);
}

static HI_S32 AO_IOCTL_CastGetAbsGain(struct file* file, HI_VOID* arg)
{
    AO_Cast_AbsGain_Param_S_PTR pstAbsGain = (AO_Cast_AbsGain_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstAbsGain->hCast);
    return AO_Cast_GetAbsGain(pstAbsGain->hCast, &pstAbsGain->stCastAbsGain);
}

static HI_S32 AO_IOCTL_CastSetMute(struct file* file, HI_VOID* arg)
{
    AO_Cast_Mute_Param_S_PTR pstMute = (AO_Cast_Mute_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstMute->hCast);
    return AO_Cast_SetMute(pstMute->hCast, pstMute->bMute);
}

static HI_S32 AO_IOCTL_CastGetMute(struct file* file, HI_VOID* arg)
{
    AO_Cast_Mute_Param_S_PTR pstMute = (AO_Cast_Mute_Param_S_PTR)arg;
    CHECK_AO_CAST_OPEN(pstMute->hCast);
    return AO_Cast_GetMute(pstMute->hCast, &pstMute->bMute);
}
#endif

/* ao ioctl end */

static const struct
{
    HI_U32 u32Cmd;
    HI_S32 (*ioctl)(struct file* file, HI_VOID* arg);
} g_fnAoIoctl[CMD_ID_AO_BUTT] =
{
    [CMD_ID_AO_SND_GETDEFOPENATTR]       = {CMD_AO_GETSNDDEFOPENATTR        , AO_IOCTL_GetSndDefOpenAttr},
    [CMD_ID_AO_SND_OPEN]                 = {CMD_AO_SND_OPEN                 , AO_IOCTL_SndOpen},
    [CMD_ID_AO_SND_CLOSE]                = {CMD_AO_SND_CLOSE                , AO_IOCTL_SndClose},
    [CMD_ID_AO_SND_SETMUTE]              = {CMD_AO_SND_SETMUTE              , AO_IOCTL_SndSetMute},
    [CMD_ID_AO_SND_GETMUTE]              = {CMD_AO_SND_GETMUTE              , AO_IOCTL_SndGetMute},
    [CMD_ID_AO_SND_SETVOLUME]            = {CMD_AO_SND_SETVOLUME            , AO_IOCTL_SndSetVolume},
    [CMD_ID_AO_SND_GETVOLUME]            = {CMD_AO_SND_GETVOLUME            , AO_IOCTL_SndGetVolume},

    [CMD_ID_AO_SND_SETHDMIMODE]          = {CMD_AO_SND_SETHDMIMODE          , AO_IOCTL_SndSetHdmiMode},
    [CMD_ID_AO_SND_GETHDMIMODE]          = {CMD_AO_SND_GETHDMIMODE          , AO_IOCTL_SndGetHdmiMode},
#ifdef HI_SND_SPDIF_SUPPORT
    [CMD_ID_AO_SND_SETSPDIFMODE]         = {CMD_AO_SND_SETSPDIFMODE         , AO_IOCTL_SndSetSpdifMode},
    [CMD_ID_AO_SND_GETSPDIFMODE]         = {CMD_AO_SND_GETSPDIFMODE         , AO_IOCTL_SndGetSpdifMode},
#endif
    [CMD_ID_AO_SND_SETTRACKMODE]         = {CMD_AO_SND_SETTRACKMODE         , AO_IOCTL_SndSetTrackMode},
    [CMD_ID_AO_SND_GETTRACKMODE]         = {CMD_AO_SND_GETTRACKMODE         , AO_IOCTL_SndGetTrackMode},
#ifdef HI_SND_SPDIF_SUPPORT
    [CMD_ID_AO_SND_SETSPDIFSCMSMODE]     = {CMD_AO_SND_SETSPDIFSCMSMODE     , AO_IOCTL_SndSetSpdifSCMSMode},
    [CMD_ID_AO_SND_GETSPDIFSCMSMODE]     = {CMD_AO_SND_GETSPDIFSCMSMODE     , AO_IOCTL_SndGetSpdifSCMSMode},
    [CMD_ID_AO_SND_SETSPDIFCATEGORYCODE] = {CMD_AO_SND_SETSPDIFCATEGORYCODE , AO_IOCTL_SndSetSpdifCategoryCode},
    [CMD_ID_AO_SND_GETSPDIFCATEGORYCODE] = {CMD_AO_SND_GETSPDIFCATEGORYCODE , AO_IOCTL_SndGetSpdifCategoryCode},
#endif
    [CMD_ID_AO_SND_SETALLTRACKMUTE]      = {CMD_AO_SND_SETALLTRACKMUTE      , AO_IOCTL_SndSetAllTrackMute},
    [CMD_ID_AO_SND_GETALLTRACKMUTE]      = {CMD_AO_SND_GETALLTRACKMUTE      , AO_IOCTL_SndGetAllTrackMute},

    [CMD_ID_AO_SND_SETADACENABLE]        = {CMD_AO_SND_SETADACENABLE        , AO_IOCTL_SndSetAdacEnable},
    [CMD_ID_AO_SND_GETADACENABLE]        = {CMD_AO_SND_GETADACENABLE        , AO_IOCTL_SndGetAdacEnable},

    [CMD_ID_AO_SND_SETPRECIVOL]          = {CMD_AO_SND_SETPRECIVOL          , AO_IOCTL_SndSetPreciVolume},
    [CMD_ID_AO_SND_GETPRECIVOL]          = {CMD_AO_SND_GETPRECIVOL          , AO_IOCTL_SndGetPreciVolume},

    [CMD_ID_AO_SND_GETXRUNCOUNT]         = {CMD_AO_SND_GETXRUNCOUNT         , AO_IOCTL_SndGetXRunCount},

    [CMD_ID_AO_SND_SETSOUNDDELAY]        = {CMD_AO_SND_SETSOUNDDELAY        , AO_IOCTL_SndSetDelayCompensation},
    [CMD_ID_AO_SND_GETSOUNDDELAY]        = {CMD_AO_SND_GETSOUNDDELAY        , AO_IOCTL_SndGetDelayCompensation},

    /* AO Track ioctl */
    [CMD_ID_AO_TRACK_GETDEFATTR]         = {CMD_AO_TRACK_GETDEFATTR         , AO_IOCTL_TrackGetDefAttr},
    [CMD_ID_AO_TRACK_CREATE]             = {CMD_AO_TRACK_CREATE             , AO_IOCTL_TrackCreate},
    [CMD_ID_AO_TRACK_DESTROY]            = {CMD_AO_TRACK_DESTROY            , AO_IOCTL_TrackDestory},
    [CMD_ID_AO_TRACK_START]              = {CMD_AO_TRACK_START              , AO_IOCTL_TrackStart},
    [CMD_ID_AO_TRACK_STOP]               = {CMD_AO_TRACK_STOP               , AO_IOCTL_TrackStop},
    [CMD_ID_AO_TRACK_PAUSE]              = {CMD_AO_TRACK_PAUSE              , AO_IOCTL_TrackPause},
    [CMD_ID_AO_TRACK_FLUSH]              = {CMD_AO_TRACK_FLUSH              , AO_IOCTL_TrackFlush},
    [CMD_ID_AO_TRACK_SENDDATA]           = {CMD_AO_TRACK_SENDDATA           , AO_IOCTL_TrackSendData},
    [CMD_ID_AO_TRACK_SETWEITHT]          = {CMD_AO_TRACK_SETWEITHT          , AO_IOCTL_TrackSetWeight},
    [CMD_ID_AO_TRACK_GETWEITHT]          = {CMD_AO_TRACK_GETWEITHT          , AO_IOCTL_TrackGetWeight},
    [CMD_ID_AO_TRACK_SETSPEEDADJUST]     = {CMD_AO_TRACK_SETSPEEDADJUST     , AO_IOCTL_TrackSetSpeedAdjust},
    [CMD_ID_AO_TRACK_GETDELAYMS]         = {CMD_AO_TRACK_GETDELAYMS         , AO_IOCTL_TrackGetDelayMs},
    [CMD_ID_AO_TRACK_ISBUFEMPTY]         = {CMD_AO_TRACK_ISBUFEMPTY         , AO_IOCTL_TrackIsBufEmpty},
    [CMD_ID_AO_TRACK_SETEOSFLAG]         = {CMD_AO_TRACK_SETEOSFLAG         , AO_IOCTL_TrackSetEosFlag},
    [CMD_ID_AO_TRACK_GETATTR]            = {CMD_AO_TRACK_GETATTR            , AO_IOCTL_TrackGetAttr},
    [CMD_ID_AO_TRACK_SETATTR]            = {CMD_AO_TRACK_SETATTR            , AO_IOCTL_TrackSetAttr},
#if defined (HI_AUDIO_AI_SUPPORT)
    [CMD_ID_AO_TRACK_ATTACHAI]           = {CMD_AO_TRACK_ATTACHAI           , AO_IOCTL_TrackAttachAi},
    [CMD_ID_AO_TRACK_DETACHAI]           = {CMD_AO_TRACK_DETACHAI           , AO_IOCTL_TrackDetachAi},
#endif
    [CMD_ID_AO_TRACK_SETABSGAIN]         = {CMD_AO_TRACK_SETABSGAIN         , AO_IOCTL_TrackSetAbsGain},
    [CMD_ID_AO_TRACK_GETABSGAIN]         = {CMD_AO_TRACK_GETABSGAIN         , AO_IOCTL_TrackGetAbsGain},
    [CMD_ID_AO_TRACK_SETMUTE]            = {CMD_AO_TRACK_SETMUTE            , AO_IOCTL_TrackSetMute},
    [CMD_ID_AO_TRACK_GETMUTE]            = {CMD_AO_TRACK_GETMUTE            , AO_IOCTL_TrackGetMute},
    [CMD_ID_AO_TRACK_SETCHANNELMODE]     = {CMD_AO_TRACK_SETCHANNELMODE     , AO_IOCTL_TrackSetChannelMode},
    [CMD_ID_AO_TRACK_GETCHANNELMODE]     = {CMD_AO_TRACK_GETCHANNELMODE     , AO_IOCTL_TrackGetChannelMode},

#ifdef HI_PROC_SUPPORT
    /* AO Cast ioctl */
    [CMD_ID_AO_CAST_GETDEFATTR]          = {CMD_AO_CAST_GETDEFATTR          , AO_IOCTL_CastGetDefAttr},
    [CMD_ID_AO_CAST_CREATE]              = {CMD_AO_CAST_CREATE              , AO_IOCTL_CastCreate},
    [CMD_ID_AO_CAST_DESTROY]             = {CMD_AO_CAST_DESTROY             , AO_IOCTL_CastDestory},
    [CMD_ID_AO_CAST_SETENABLE]           = {CMD_AO_CAST_SETENABLE           , AO_IOCTL_CastSetEnable},
    [CMD_ID_AO_CAST_GETENABLE]           = {CMD_AO_CAST_GETENABLE           , AO_IOCTL_CastGetEnable},
    [CMD_ID_AO_CAST_GETINFO]             = {CMD_AO_CAST_GETINFO             , AO_IOCTL_CastGetInfo},
    [CMD_ID_AO_CAST_SETINFO]             = {CMD_AO_CAST_SETINFO             , AO_IOCTL_CastSetInfo},
    [CMD_ID_AO_CAST_ACQUIREFRAME]        = {CMD_AO_CAST_ACQUIREFRAME        , AO_IOCTL_CastAcquireFrame},
    [CMD_ID_AO_CAST_RELEASEFRAME]        = {CMD_AO_CAST_RELEASEFRAME        , AO_IOCTL_CastReleaseFrame},
    [CMD_ID_AO_CAST_SETABSGAIN]          = {CMD_AO_CAST_SETABSGAIN          , AO_IOCTL_CastSetAbsGain},
    [CMD_ID_AO_CAST_GETABSGAIN]          = {CMD_AO_CAST_GETABSGAIN          , AO_IOCTL_CastGetAbsGain},
    [CMD_ID_AO_CAST_SETMUTE]             = {CMD_AO_CAST_SETMUTE             , AO_IOCTL_CastSetMute},
    [CMD_ID_AO_CAST_GETMUTE]             = {CMD_AO_CAST_GETMUTE             , AO_IOCTL_CastGetMute},
#endif
};

static HI_S32 AO_ProcessCmd(struct inode* inode, struct file* file, HI_U32 u32Cmd, HI_VOID* arg)
{
    HI_U32 u32CmdType = _IOC_TYPE(u32Cmd);
    HI_U32 u32CmdId = _IOC_NR(u32Cmd);

    if (HI_ID_AO == u32CmdType)
    {
        if (CMD_ID_AO_BUTT <= u32CmdId)
        {
            HI_WARN_AO("unknown cmd: 0x%x\n", u32Cmd);
            return HI_ERR_AO_INVALID_PARA;
        }

        if (u32Cmd != g_fnAoIoctl[u32CmdId].u32Cmd)
        {
            HI_WARN_AO("unknown cmd: 0x%x\n", u32Cmd);
            return HI_ERR_AO_INVALID_PARA;
        }

        if (HI_NULL == g_fnAoIoctl[u32CmdId].ioctl)
        {
            return HI_ERR_AO_NOTSUPPORT;
        }

        return (g_fnAoIoctl[u32CmdId].ioctl)(file, arg);
    }
    else
    {
        HI_WARN_AO("Unknown CMD Type.\n");
        return HI_ERR_AO_INVALID_PARA;
    }
}

long AO_DRV_Ioctl(struct file* file, HI_U32 cmd, unsigned long arg)
{
    long s32Ret = HI_SUCCESS;

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    //cmd process
    s32Ret = (long)HI_DRV_UserCopy(file->f_path.dentry->d_inode, file, cmd, arg, AO_ProcessCmd);

    up(&g_AoMutex);

    return s32Ret;
}

HI_S32 AO_DRV_Open(struct inode* inode, struct file* filp)
{
    HI_S32 s32Ret;
    HI_U32 cnt;
    DRV_AO_STATE_S* pAOState = HI_NULL;

    if (!filp)
    {
        HI_FATAL_AO("file handle is null.\n");
        return HI_FAILURE;
    }

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    pAOState = AUTIL_AO_MALLOC(HI_ID_AO, sizeof(DRV_AO_STATE_S), GFP_KERNEL);
    if (!pAOState)
    {
        HI_FATAL_AO("malloc pAOState failed.\n");
        up(&g_AoMutex);
        return HI_FAILURE;
    }
    for (cnt = 0; cnt < AO_MAX_TOTAL_SND_NUM; cnt++)
    {
        atomic_set(&(pAOState->atmUserOpenCnt[cnt]), 0);
        pAOState->u32FileId[cnt] = AO_SND_FILE_NOUSE_FLAG;
    }

    if (atomic_inc_return(&s_stAoDrv.atmOpenCnt) == 1)
    {
        /* Init device */
        if (HI_SUCCESS != AO_OpenDev())
        {
            HI_FATAL_AO("AO_OpenDev err!\n" );
            goto err;
        }
    }

    filp->private_data = pAOState;

    up(&g_AoMutex);
    return HI_SUCCESS;
err:
    AUTIL_AO_FREE(HI_ID_AO, pAOState);
    atomic_dec(&s_stAoDrv.atmOpenCnt);
    up(&g_AoMutex);
    return HI_FAILURE;
}

static int _valid_mmap_phys_addr_range(unsigned long pfn, size_t size, unsigned long reg_phy_mask)
{
    return (pfn + (size >> PAGE_SHIFT)) <= (1 + (reg_phy_mask >> PAGE_SHIFT));
}

HI_S32 AO_DRV_Mmap(struct file *file, struct vm_area_struct *vma)
{
    size_t size = vma->vm_end - vma->vm_start;

    /* Invalid register address of common  */
    if (((AIAO_REG_BASE >> PAGE_SHIFT) >> PAGE_NUM_SHIFT != vma->vm_pgoff >> PAGE_NUM_SHIFT)
#if defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450)
         && ((DSP_SHARESRAM_BASEADDR >> PAGE_SHIFT) >> PAGE_NUM_SHIFT != vma->vm_pgoff >> PAGE_NUM_SHIFT)
#endif
        )
    {
        HI_ERR_AO("Invalid page frame, vm_page_prot[%#x]\n", vma->vm_pgoff);
        return -EINVAL;
    }

    /* Invalid register address or len of common */
    if (!_valid_mmap_phys_addr_range(vma->vm_pgoff, size, AIAO_REG_BASE | AIAO_MAP_MASK)
#if defined(CHIP_TYPE_hi3796mv200)  || defined(CHIP_TYPE_hi3716mv450)
         && !_valid_mmap_phys_addr_range(vma->vm_pgoff, size, DSP_SHARESRAM_BASEADDR | AIAO_MAP_MASK)
#endif
         )
    {
        HI_ERR_AO("invalid pgoff[%#x] or size[%#x]\n", vma->vm_pgoff, size);
        return -EINVAL;
    }

    vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff, size, vma->vm_page_prot);

    if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff, size, vma->vm_page_prot))
    {
        HI_ERR_AO("remap_pfn_range fail.\n");
        return -EAGAIN;
    }

    return HI_SUCCESS;
}

#ifdef HI_PROC_SUPPORT
static HI_S32 AOSNDFreeCast(struct file* filp)
{
    HI_S32 s32Ret;
    HI_U32 u32CastID;

    for (u32CastID = 0; u32CastID < AO_MAX_CAST_NUM; u32CastID++)
    {
        if (s_stAoDrv.astCastEntity[u32CastID].pstFile != filp)
        {
            continue;
        }

        if (!atomic_read(&s_stAoDrv.astCastEntity[u32CastID].atmUseCnt))
        {
            continue;
        }

        s32Ret = AO_Cast_Destory(u32CastID);
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AO_Cast_Destory failed(0x%x), u32CastID = %d!\n", s32Ret, u32CastID);
            return s32Ret;
        }

        AO_Cast_FreeHandle(u32CastID);
    }

    return HI_SUCCESS;
}
#endif

static HI_S32 AOSNDFreeTrack(struct file* filp)
{
    HI_S32 s32Ret;
    HI_U32 u32TrackID;

    for (u32TrackID = 0; u32TrackID < AO_MAX_TOTAL_TRACK_NUM; u32TrackID++)
    {
        if (s_stAoDrv.astTrackEntity[u32TrackID].pstFile != filp)
        {
            continue;
        }

        if (0 == atomic_read(&s_stAoDrv.astTrackEntity[u32TrackID].atmUseCnt))
        {
            continue;
        }

        s32Ret = AO_Track_Destory(u32TrackID);
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AO_Track_Destory failed(0x%x), u32TrackID = %d!\n", s32Ret, u32TrackID);
            return s32Ret;
        }

        AO_Track_FreeHandleById(u32TrackID);
    }

    return HI_SUCCESS;
}

static HI_S32 AOSndClose(DRV_AO_STATE_S* pstAoState, HI_U32 u32SndID)
{
    HI_S32 s32Ret;
    HI_U32 u32UserOpenCnt = 0;

    u32UserOpenCnt = atomic_read(&pstAoState->atmUserOpenCnt[u32SndID]);
    if (atomic_sub_and_test(u32UserOpenCnt, &s_stAoDrv.astSndEntity[u32SndID].atmUseTotalCnt))
    {
        s32Ret = AO_SND_Close(u32SndID, HI_FALSE);
        if (HI_SUCCESS != s32Ret)
        {
            atomic_inc(&s_stAoDrv.astSndEntity[u32SndID].atmUseTotalCnt);
            return s32Ret;
        }
    }

    return HI_SUCCESS;
}

static HI_S32 AOSNDFree(struct file* filp)
{
    HI_S32 s32Ret;
    HI_U32 u32SndID;
    HI_U32 u32SndOpenCnt;
    DRV_AO_STATE_S* pstAoState = filp->private_data;

    for (u32SndID = 0; u32SndID < AO_MAX_TOTAL_SND_NUM; u32SndID++)
    {
        if ((!s_stAoDrv.astSndEntity[u32SndID].pCard) || (!pstAoState))
        {
            continue;
        }

        for (u32SndOpenCnt = 0; u32SndOpenCnt < SND_MAX_OPEN_NUM; u32SndOpenCnt++)
        {
            struct file* pstFileCurSndOpen = s_stAoDrv.astSndEntity[u32SndID].pstFile[u32SndOpenCnt];
            if (pstFileCurSndOpen != filp)
            {
                continue;
            }

            s32Ret = AOSndClose(pstAoState, u32SndID);
            if (HI_SUCCESS != s32Ret)
            {
                HI_FATAL_AO("AOSndClose Failed(0x%x), u32SndID = %d!\n", s32Ret, u32SndID);
                return s32Ret;
            }

            AO_Snd_FreeHandle(u32SndID, pstFileCurSndOpen);
        }

    }

    return HI_SUCCESS;
}

HI_S32 AO_DRV_Release(struct inode* inode, struct file* filp)
{
    HI_S32 s32Ret = HI_SUCCESS;
    DRV_AO_STATE_S* pstAOState = filp->private_data;

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    /* Not the last close, only close the cast, track & snd which matches filp */
    if (0 != atomic_dec_return(&s_stAoDrv.atmOpenCnt))
    {
#ifdef HI_PROC_SUPPORT
        s32Ret = AOSNDFreeCast(filp);
        if (HI_SUCCESS != s32Ret)
        {
            goto ERR_AO_DRV_RELEASE;
        }
#endif
        s32Ret = AOSNDFreeTrack(filp);
        if (HI_SUCCESS != s32Ret)
        {
            goto ERR_AO_DRV_RELEASE;
        }

        /* Free all snd */
        s32Ret = AOSNDFree(filp);
        if (HI_SUCCESS != s32Ret)
        {
            goto ERR_AO_DRV_RELEASE;
        }
    }
    else
    {
        AO_CloseDev();
    }

    if (HI_NULL != pstAOState)
    {
        AUTIL_AO_FREE(HI_ID_AO, pstAOState);
    }
    up(&g_AoMutex);
    return HI_SUCCESS;

ERR_AO_DRV_RELEASE:
    atomic_inc(&s_stAoDrv.atmOpenCnt);
    up(&g_AoMutex);
    return HI_FAILURE;
}

#ifdef HI_PROC_SUPPORT
/* drv open  kernel intf */
HI_S32 AO_DRV_Kopen(struct file*  file)
{
    return AO_DRV_Open(HI_NULL, file);
}

/*drv close kernel intf */
HI_S32 AO_DRV_Krelease(struct file*  file)
{
    return AO_DRV_Release(HI_NULL, file);
}
#endif

#if defined (HI_SND_DRV_SUSPEND_SUPPORT)
static HI_S32 AO_TRACK_GetSettings(HI_HANDLE hTrack, SND_TRACK_SETTINGS_S* pstSndSettings)
{
    SND_CARD_STATE_S* pCard;

    hTrack &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(hTrack);
    if (pCard)
    {
        return TRACK_GetSetting(pCard, hTrack, pstSndSettings);
    }
    else
    {
        HI_ERR_AO("Track(%d) don't attach card!\n", hTrack);
        return HI_FAILURE;
    }
}

static HI_S32 AO_TRACK_RestoreSettings(HI_HANDLE hTrack, SND_TRACK_SETTINGS_S* pstSndSettings)
{
    SND_CARD_STATE_S* pCard;

    hTrack &= AO_TRACK_CHNID_MASK;
    pCard = TRACK_CARD_GetCard(hTrack);
    if (pCard)
    {
        return TRACK_RestoreSetting(pCard, hTrack, pstSndSettings);
    }
    else
    {
        HI_ERR_AO("Track(%d) don't attach card!\n", hTrack);
        return HI_FAILURE;
    }
}

static HI_S32 AO_SND_GetSettings(HI_UNF_SND_E enSound, SND_CARD_SETTINGS_S* pstSndSettings)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);
    CHECK_AO_NULL_PTR(pstSndSettings);

    pstSndSettings->bAllTrackMute = pCard->bAllTrackMute;

    if (HI_SUCCESS != SND_GetOpSetting(pCard, pstSndSettings))
    {
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 AO_SND_RestoreSettings(HI_UNF_SND_E enSound, SND_CARD_SETTINGS_S* pstSndSettings)
{
    SND_CARD_STATE_S* pCard = SND_CARD_GetCard(enSound);

    CHECK_AO_NULL_PTR(pCard);
    CHECK_AO_NULL_PTR(pstSndSettings);
    pCard->bAllTrackMute = pstSndSettings->bAllTrackMute; //All track mute restore in Track restore.

    if (HI_SUCCESS != SND_RestoreOpSetting(pCard, pstSndSettings))
    {
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}
#endif

HI_S32 HI_DRV_AO_Init(HI_VOID)
{
    return AO_DRV_Init();
}

HI_VOID HI_DRV_AO_DeInit(HI_VOID)
{
    AO_DRV_Exit();
}

HI_S32 HI_DRV_AO_SND_Init(struct file* pfile)
{
    struct file* pstfilp;

    if (HI_NULL == pfile)
    {
        pstfilp = &g_filp;
    }
    else
    {
        pstfilp = pfile;
    }

    HI_INFO_AO("HI_DRV_AO_SND_Init file = %p\n", pfile);

    return AO_DRV_Open(HI_NULL, pstfilp);
}

HI_S32 HI_DRV_AO_SND_DeInit(struct file* pfile)
{
    struct file* pstfilp;

    if (HI_NULL == pfile)
    {
        pstfilp = &g_filp;
    }
    else
    {
        pstfilp = pfile;
    }
    HI_INFO_AO("HI_DRV_AO_SND_DeInit file = %p\n", pfile);

    return AO_DRV_Release(HI_NULL, pstfilp);
}

HI_S32 HI_DRV_AO_SND_GetDefaultOpenAttr(HI_UNF_SND_E enSound, HI_UNF_SND_ATTR_S* pstAttr)
{
    HI_S32 Ret;
    AO_SND_OpenDefault_Param_S stSndDefaultAttr;
    CHECK_AO_SNDCARD(enSound);

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    stSndDefaultAttr.enSound = enSound;
    Ret = AOGetSndDefOpenAttr(&stSndDefaultAttr);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("AOGetSndDefOpenAttr Failed!\n");
        up(&g_AoMutex);
        return Ret;
    }
    memcpy(pstAttr, &stSndDefaultAttr.stAttr, sizeof(HI_UNF_SND_ATTR_S));
    up(&g_AoMutex);

    return Ret;
}

HI_S32 HI_DRV_AO_SND_Open(HI_UNF_SND_E enSound, HI_UNF_SND_ATTR_S* pstAttr, struct file*  pfile)
{
    HI_S32 Ret;
    DRV_AO_STATE_S* pAOState;
    struct file*  pstfile;

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    if (HI_NULL == pfile)
    {
        pAOState = g_filp.private_data;
        pstfile = &g_filp;
    }
    else
    {
        pAOState = pfile->private_data;
        pstfile = pfile;
    }

    CHECK_AO_SNDCARD(enSound);

    HI_INFO_AO("HI_DRV_AO_SND_Open file = %p\n", pfile);

    Ret = AO_Snd_AllocHandle(enSound, pstfile);
    if (HI_SUCCESS == Ret)
    {
        if (0 == atomic_read(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
        {
            Ret = AO_SND_Open(enSound, pstAttr, HI_FALSE);
            if (HI_SUCCESS != Ret)
            {
                HI_ERR_AO("AO_SND_Open Failed(0x%x)\n", Ret);
                AO_Snd_FreeHandle(enSound, pstfile);
                up(&g_AoMutex);
                return Ret;
            }
        }
    }

    atomic_inc(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
    atomic_inc(&pAOState->atmUserOpenCnt[enSound]);
    up(&g_AoMutex);

    return Ret;
}

HI_S32 HI_DRV_AO_SND_Close(HI_UNF_SND_E enSound, struct file* pfile)
{
    HI_S32 Ret;
    HI_U32 u32TrackIdx = 0;
    DRV_AO_STATE_S* pAOState;
    struct file* pstfilp;

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    if (HI_NULL == pfile)
    {
        pAOState = g_filp.private_data;
        pstfilp = &g_filp;
    }
    else
    {
        pAOState = pfile->private_data;
        pstfilp = pfile;
    }

    CHECK_AO_SNDCARD_OPEN(enSound);

    HI_INFO_AO("HI_DRV_AO_SND_Close file = %p\n", pfile);

    if (atomic_dec_and_test(&pAOState->atmUserOpenCnt[enSound]))
    {
        if (atomic_dec_and_test(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt))
        {
            //destory all track before close sound
            for (u32TrackIdx = 0; u32TrackIdx < AO_MAX_TOTAL_TRACK_NUM; u32TrackIdx++)
            {
                if (atomic_read(&s_stAoDrv.astTrackEntity[u32TrackIdx].atmUseCnt))
                {

                    if (TRACK_CARD_GetCard(u32TrackIdx) != SND_CARD_GetCard(enSound))
                    {
                        continue;
                    }

                    (HI_VOID)AO_Track_Destory(u32TrackIdx);
                    AO_Track_FreeHandleById(u32TrackIdx);
                }
            }

            Ret = AO_SND_Close( enSound, HI_FALSE );
            if (HI_SUCCESS != Ret)
            {
                atomic_inc(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
                atomic_inc(&pAOState->atmUserOpenCnt[enSound]);
                HI_ERR_AO("AO_SND_Close failed(0x%x)\n", Ret);
                up(&g_AoMutex);
                return Ret;
            }

            AO_Snd_FreeHandle(enSound, pstfilp);
        }
    }
    else
    {
        atomic_dec(&s_stAoDrv.astSndEntity[enSound].atmUseTotalCnt);
    }
    up(&g_AoMutex);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_AO_Snd_GetXRunCount(HI_UNF_SND_E enSound, HI_U32* pu32Count)
{
    CHECK_AO_SNDCARD_OPEN(enSound);
    return AO_Snd_GetXRunCount(enSound, pu32Count);
}

HI_S32 HI_DRV_AO_SND_SetVolume(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_GAIN_ATTR_S* pstGain)
{
    HI_S32 Ret = HI_SUCCESS;
    CHECK_AO_SNDCARD_OPEN( enSound );

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_SND_SetVolume(enSound, enOutPort, pstGain);
    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_SND_GetVolume(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_GAIN_ATTR_S* pstGain)
{
    HI_S32 Ret = HI_SUCCESS;
    CHECK_AO_SNDCARD_OPEN( enSound );
    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_SND_GetVolume(enSound, enOutPort, pstGain);
    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_SND_SetMute(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_BOOL bMute)
{
    HI_S32 Ret = HI_SUCCESS;
    CHECK_AO_SNDCARD_OPEN( enSound );

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_SND_SetMute(enSound, enOutPort, bMute);
    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_SND_GetMute(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_BOOL* pbMute)
{
    HI_S32 Ret = HI_SUCCESS;
    CHECK_AO_SNDCARD_OPEN( enSound );

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_SND_GetMute(enSound, enOutPort, pbMute);
    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_SND_GetAlsaTrackDelayMs(HI_UNF_SND_E enSound, HI_U32* pu32DelayMs)
{
    HI_S32 Ret = HI_SUCCESS;
    CHECK_AO_SNDCARD_OPEN( enSound );
    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_SND_GetAlsaTrackDelayMs(enSound, pu32DelayMs);
    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_Track_GetDefaultOpenAttr(HI_UNF_SND_TRACK_TYPE_E enTrackType, HI_UNF_AUDIOTRACK_ATTR_S* pstAttr)
{
    HI_S32 Ret = HI_SUCCESS;

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    pstAttr->enTrackType = enTrackType;
    Ret = AO_Track_GetDefAttr(pstAttr);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_PrintCallFunErr(AO_Track_GetDefAttr, Ret);
    }

    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_Track_Create(HI_UNF_SND_E enSound, HI_UNF_AUDIOTRACK_ATTR_S* pstAttr, HI_BOOL bAlsaTrack, struct file* pfile, HI_HANDLE* phTrack)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    struct file* pstfilp;

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    if (HI_NULL == pfile)
    {
        pstfilp = &g_filp;
    }
    else
    {
        pstfilp = pfile;
    }
    HI_INFO_AO("HI_DRV_AO_Track_Create bAlsaTrack = %d, file = %p\n", bAlsaTrack, pfile);

    Ret = AO_Track_AllocHandle(enSound, pstAttr->enTrackType, pstfilp, &hHandle);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("AO_Track_AllocHandle Failed \n", Ret);
        up(&g_AoMutex);
        return Ret;
    }

    Ret = AO_Track_PreCreate(enSound, pstAttr, bAlsaTrack, NULL, hHandle);
    if (HI_SUCCESS != Ret)
    {
        AO_Track_FreeHandle(hHandle);
        HI_ERR_AO("AO_Track_FreeHandle Failed(0x%x)\n", Ret);
        up(&g_AoMutex);
        return Ret;
    }

    Ret = AO_Track_SetUsedByKernel(hHandle);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("AO_Track_SetUsedByKernel failed(0x%x)\n", Ret);
        (HI_VOID)AO_Track_Destory(hHandle);
        up(&g_AoMutex);
        return Ret;
    }

    *phTrack = hHandle;
    up(&g_AoMutex);

    return Ret;
}

HI_S32 HI_DRV_AO_Track_Destroy(HI_HANDLE hSndTrack)
{
    HI_S32 Ret = HI_SUCCESS;
    CHECK_AO_TRACK_OPEN(hSndTrack);

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_Track_Destory(hSndTrack);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_AO("AO_Track_Destory Failed(0x%x)\n", Ret);
        up(&g_AoMutex);
        return Ret;
    }

    AO_Track_FreeHandle(hSndTrack);
    up(&g_AoMutex);

    return Ret;
}

HI_S32 HI_DRV_AO_Track_Flush(HI_HANDLE hTrack)
{
    return AO_IOCTL_TrackFlush(HI_NULL, (HI_VOID*)&hTrack);
}

HI_S32 HI_DRV_AO_Track_Start(HI_HANDLE hTrack)
{
    return AO_IOCTL_TrackStart(HI_NULL, (HI_VOID*)&hTrack);
}

HI_S32 HI_DRV_AO_Track_Stop(HI_HANDLE hTrack)
{
    HI_S32 Ret = HI_SUCCESS;

    Ret = down_interruptible(&g_AoMutex);
    if (Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return Ret;
    }

    Ret = AO_IOCTL_TrackStop(HI_NULL, (HI_VOID*)&hTrack);
    if (HI_SUCCESS != Ret)
    {
        HI_ERR_PrintCallFunErr(AO_IOCTL_TrackStop, Ret);
    }

    up(&g_AoMutex);
    return Ret;
}

HI_S32 HI_DRV_AO_Track_GetDelayMs(HI_HANDLE hSndTrack, HI_U32* pDelayMs)
{
    CHECK_AO_TRACK_OPEN(hSndTrack);
    return AO_Track_GetDelayMs(hSndTrack, pDelayMs);
}

HI_S32 HI_DRV_AO_Track_SendData(HI_HANDLE hSndTrack, AO_FRAMEINFO_S* pstAOFrame)
{
    CHECK_AO_TRACK_OPEN(hSndTrack);
    return AO_Track_SendData(hSndTrack, pstAOFrame);
}

HI_S32 HI_DRV_AO_Track_AtomicSendData(HI_HANDLE hTrack, AO_FRAMEINFO_S* pstAOFrame)
{
    HI_U32 u32TrackID;
    SND_CARD_STATE_S* pCard;

    CHECK_AO_TRACK_OPEN(hTrack);

    u32TrackID = hTrack & AO_TRACK_CHNID_MASK;

    pCard = TRACK_CARD_GetCard(u32TrackID);
    if (HI_NULL == pCard)
    {
        return HI_ERR_AO_SOUND_NOT_OPEN;
    }

    return TRACK_AtomicSendData(pCard, u32TrackID, pstAOFrame);
}

#if defined (HI_AUDIO_AI_SUPPORT)
HI_S32 HI_DRV_AO_Track_AttachAi(HI_HANDLE hTrack, HI_HANDLE hAi)
{
    CHECK_AO_TRACK_OPEN(hTrack);
    return AO_Track_AttachAi(hTrack, hAi);
}

HI_S32 HI_DRV_AO_Track_DetachAi(HI_HANDLE hTrack, HI_HANDLE hAi)
{
    CHECK_AO_TRACK_OPEN(hTrack);
    return AO_Track_DetachAi(hTrack, hAi);
}
#endif

#ifdef HI_PROC_SUPPORT
static HI_S32 AO_CAST_GetSettings(HI_HANDLE hCast, SND_CAST_SETTINGS_S* pstCastSettings)
{
    SND_CARD_STATE_S* pCard;

    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    CAST_GetSettings(pCard, hCast, pstCastSettings);
    return HI_SUCCESS;
}

static HI_S32 AO_CAST_RestoreSettings(HI_HANDLE hCast, SND_CAST_SETTINGS_S* pstCastSettings)
{
    SND_CARD_STATE_S* pCard;

    hCast &= AO_CAST_CHNID_MASK;
    pCard = CAST_CARD_GetCard(hCast);
    CHECK_AO_NULL_PTR(pCard);

    CAST_RestoreSettings(pCard, hCast, pstCastSettings);
    return HI_SUCCESS;
}
#endif

HI_S32 AO_DRV_Suspend(PM_BASEDEV_S* pdev,
                      pm_message_t state)
{
#if defined (HI_SND_DRV_SUSPEND_SUPPORT)
    HI_S32 i;
    HI_S32 s32Ret = HI_SUCCESS;

#if defined(HI_ALSA_AO_SUPPORT) && defined(CONFIG_PM)
    HI_INFO_AO("AO shallow suspend state.event = 0x%x\n", state.event);
    if (PM_LOW_SUSPEND_FLAG == state.event && HI_NULL != hisi_snd_device)
    {
        bu32shallowSuspendActive = HI_TRUE;
        s32Ret = snd_soc_suspend(&hisi_snd_device->dev);    //shallow suspent here suspend alsa driver
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("AO ALSA shallow suspend fail 0x%x\n", s32Ret);
        }
        HI_PRINT("AO ALSA shallow suspend OK.\n");
    }
#endif

#ifdef HI_AIAO_TIMER_SUPPORT
    s32Ret = HI_DRV_Timer_Suspend();
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_AO("AO HI_DRV_Timer_Suspend fail 0x%x\n", s32Ret);
    }
#endif

#ifdef HI_PROC_SUPPORT
    bSuspend2SaveThreadFlag = HI_TRUE; //just for echo save sound pcm
    while (HI_TRUE == bSaveThread2SuspendFlag) //wait until echo proc for save sound pcm thread exit !
    {
        msleep(2);
    }
#endif

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    if (HI_TRUE == s_stAoDrv.bReady)
    {
#ifdef HI_PROC_SUPPORT
        /* Destory all cast */
        for (i = 0; i < AO_MAX_CAST_NUM; i++)
        {
            if (atomic_read(&s_stAoDrv.astCastEntity[i].atmUseCnt))
            {
                /* Store cast settings */
                AO_CAST_GetSettings(i, &s_stAoDrv.astCastEntity[i].stSuspendAttr);

                /* Destory cast */
                s32Ret = AO_Cast_Destory(i);
                if (HI_SUCCESS != s32Ret)
                {
                    HI_FATAL_AO("AO_Cast_Destory fail\n");
                    up(&g_AoMutex);
                    return HI_FAILURE;
                }
            }
        }
#endif
        /* Destory all track */
        for (i = 0; i < AO_MAX_TOTAL_TRACK_NUM; i++)
        {
            if (atomic_read(&s_stAoDrv.astTrackEntity[i].atmUseCnt))
            {
                /* Store track settings */
                AO_TRACK_GetSettings(i, &s_stAoDrv.astTrackEntity[i].stSuspendAttr);

                /* Destory track */
                s32Ret = AO_Track_Destory(i);
                if (HI_SUCCESS != s32Ret)
                {
                    HI_FATAL_AO("AO_Track_Destory fail\n");
                    up(&g_AoMutex);
                    return HI_FAILURE;
                }
            }
        }

        /* Destory all snd */
        for (i = 0; i < AO_MAX_TOTAL_SND_NUM; i++)
        {
            if (s_stAoDrv.astSndEntity[i].pCard)
            {
                /* Store snd settings */
                AO_SND_GetSettings(i, &s_stAoDrv.astSndEntity[i].stSuspendAttr);

                /* Destory snd */
                s32Ret = AO_SND_Close(i, HI_TRUE);
                if (HI_SUCCESS != s32Ret)
                {
                    HI_FATAL_AO("AO_SND_Close fail\n");
                    up(&g_AoMutex);
                    return HI_FAILURE;
                }
            }
        }

        HAL_AOE_DeInit( );

        s32Ret = HAL_AIAO_Suspend();
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AIAO Suspend fail\n");
            up(&g_AoMutex);
            return HI_FAILURE;
        }

    }

    up(&g_AoMutex);
#endif
    HI_PRINT("AO suspend OK\n");
    return HI_SUCCESS;
}

HI_S32 AO_DRV_Resume(PM_BASEDEV_S* pdev)
{
#if defined (HI_SND_DRV_SUSPEND_SUPPORT)
    HI_S32 i;
    HI_S32 s32Ret = HI_SUCCESS;
#ifdef HI_AUDIO_AI_SUPPORT
    HI_BOOL bAiEnable;
#endif

#ifdef HI_PROC_SUPPORT
    bSuspend2SaveThreadFlag = HI_FALSE; //just for echo save sound pcm
#endif

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    if (HI_TRUE == s_stAoDrv.bReady)
    {
        s32Ret = HAL_AIAO_Resume();
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("AIAO Resume fail\n");
            up(&g_AoMutex);
            return HI_FAILURE;
        }

        /* HAL_AOE_Init , Init aoe hardare */
        s32Ret = HAL_AOE_Init();
        if (HI_SUCCESS != s32Ret)
        {
            HI_FATAL_AO("call HAL_AOE_Init failed(0x%x)\n", s32Ret);
            up(&g_AoMutex);
            return s32Ret;
        }

        /* Restore all snd */
        for (i = 0; i < AO_MAX_TOTAL_SND_NUM; i++)
        {
            if (s_stAoDrv.astSndEntity[i].pCard)
            {
                /* Recreate snd */
                s32Ret = AO_SND_Open(i, &s_stAoDrv.astSndEntity[i].stSuspendAttr.stUserOpenParam, HI_TRUE);
                if (HI_SUCCESS != s32Ret)
                {
                    HI_FATAL_AO("AO_SND_Open fail\n");
                    up(&g_AoMutex);
                    return HI_FAILURE;
                }

                /* Restore snd settings*/
                AO_SND_RestoreSettings(i, &s_stAoDrv.astSndEntity[i].stSuspendAttr);
            }
        }

        for (i = 0; i < AO_MAX_TOTAL_TRACK_NUM; i++)
        {
            if (atomic_read(&s_stAoDrv.astTrackEntity[i].atmUseCnt))
            {
                HI_UNF_SND_E enSound = s_stAoDrv.astTrackEntity[i].stSuspendAttr.enSound;
                HI_UNF_AUDIOTRACK_ATTR_S* pstAttr = &s_stAoDrv.astTrackEntity[i].stSuspendAttr.stTrackAttr;
                HI_BOOL bAlsaTrack = s_stAoDrv.astTrackEntity[i].stSuspendAttr.bAlsaTrack;
                AO_BUF_ATTR_S* pstBuf = &s_stAoDrv.astTrackEntity[i].stSuspendAttr.stBufAttr;

                /* Recreate track  */
                s32Ret = AO_Track_Create(enSound, pstAttr, bAlsaTrack, pstBuf, i);
                if (HI_SUCCESS != s32Ret)
                {
                    HI_FATAL_AO("AO_Track_Create(%d) fail\n", i);
                    up(&g_AoMutex);
                    return HI_FAILURE;
                }
#ifdef HI_AUDIO_AI_SUPPORT
                if (s_stAoDrv.astTrackEntity[i].stSuspendAttr.bAttAi)
                {
                    s32Ret = AI_GetEnable(s_stAoDrv.astTrackEntity[i].stSuspendAttr.hAi, &bAiEnable);
                    if (HI_SUCCESS != s32Ret)
                    {
                        HI_FATAL_AO("AI GetEnable fail\n");
                        up(&g_AoMutex);
                        return HI_FAILURE;
                    }
                    if (HI_TRUE == bAiEnable)
                    {
                        s32Ret = AI_SetEnable(s_stAoDrv.astTrackEntity[i].stSuspendAttr.hAi, HI_FALSE, HI_TRUE);
                        if (HI_SUCCESS != s32Ret)
                        {
                            HI_FATAL_AO("AI SetEnable failed!!\n");
                            up(&g_AoMutex);
                            return HI_FAILURE;
                        }
                    }

                    s32Ret = AO_Track_AttachAi(i, s_stAoDrv.astTrackEntity[i].stSuspendAttr.hAi);
                    if (HI_SUCCESS != s32Ret)
                    {
                        HI_FATAL_AO("AO_Track_AttachAi(%d) fail\n", i);
                        up(&g_AoMutex);
                        return HI_FAILURE;
                    }

                    if (HI_TRUE == bAiEnable)
                    {
                        s32Ret = AI_SetEnable(s_stAoDrv.astTrackEntity[i].stSuspendAttr.hAi, HI_TRUE, HI_TRUE);
                        if (HI_SUCCESS != s32Ret)
                        {
                            HI_FATAL_AO("AI SetEnable failed!!\n");
                            up(&g_AoMutex);
                            return HI_FAILURE;
                        }
                    }

                    s32Ret = AO_Track_Start(i);
                    if (HI_SUCCESS != s32Ret)
                    {
                        HI_FATAL_AO("AO_Track_Start(%d) fail\n", i);
                        up(&g_AoMutex);
                        return HI_FAILURE;
                    }
                }
#endif
                /* Restore track settings*/
                AO_TRACK_RestoreSettings(i, &s_stAoDrv.astTrackEntity[i].stSuspendAttr);
            }
        }

#ifdef HI_PROC_SUPPORT
        /* Restore all cast */
        for (i = 0; i < AO_MAX_CAST_NUM; i++)
        {
            if (atomic_read(&s_stAoDrv.astCastEntity[i].atmUseCnt))
            {
                HI_UNF_SND_E enSound = s_stAoDrv.astCastEntity[i].stSuspendAttr.enSound;
                HI_UNF_SND_CAST_ATTR_S* pstAttr = &s_stAoDrv.astCastEntity[i].stSuspendAttr.stCastAttr;

                /* Recreate cast  */
                s32Ret = AO_Cast_Create(enSound, pstAttr, &s_stAoDrv.astCastEntity[i].stRbfMmz, i);
                if (HI_SUCCESS != s32Ret)
                {
                    HI_FATAL_AO("AO_Cast_Create(%d) fail\n", i);
                    up(&g_AoMutex);
                    return HI_FAILURE;
                }

                /* Restore cast settings*/
                AO_CAST_RestoreSettings(i, &s_stAoDrv.astCastEntity[i].stSuspendAttr);
            }
        }
#endif
    }

    up(&g_AoMutex);
#endif

#ifdef HI_AIAO_TIMER_SUPPORT
    s32Ret = HI_DRV_Timer_Resume();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_AO("HI_DRV_Timer_Resume fail 0x%x\n", s32Ret);
    }
#endif

    HI_PRINT("AO resume OK\n");
#if defined(HI_ALSA_AO_SUPPORT) && defined(CONFIG_PM)
    if (HI_NULL != hisi_snd_device && HI_TRUE == bu32shallowSuspendActive)
    {
        HI_INFO_AO("AO ALSA shallow resume.\n");

        bu32shallowSuspendActive = HI_FALSE;
        s32Ret = snd_soc_resume(&hisi_snd_device->dev);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_AO("AO ALSA shallow resume fail.\n");
        }

        HI_PRINT("AO ALSA shallow resume OK.\n");
    }
#endif

    return HI_SUCCESS;
}

HI_S32 AO_DRV_Init(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return s32Ret;
    }

    s32Ret = HI_DRV_MODULE_Register(HI_ID_AO, AO_NAME,
                                    (HI_VOID*)&s_stAoDrv.stExtFunc);
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_AO("Reg module fail:%#x!\n", s32Ret);
        up(&g_AoMutex);
        return s32Ret;
    }

    up(&g_AoMutex);
    return HI_SUCCESS;
}

HI_VOID AO_DRV_Exit(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = down_interruptible(&g_AoMutex);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_AO("lock g_AoMutex failed\n");
        return;
    }

    HI_DRV_MODULE_UnRegister(HI_ID_AO);

    up(&g_AoMutex);
    return;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
