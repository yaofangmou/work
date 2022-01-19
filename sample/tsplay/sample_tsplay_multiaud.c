/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : tsplay_multiaud.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2010/01/26
  Description   :
  History       :
  1.Date        : 2010/01/26
    Author      : sdk
    Modification: Created file

******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <pthread.h>

#include <assert.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>

#include "hi_unf_common.h"
#include "hi_unf_ecs.h"
#include "hi_unf_avplay.h"
#include "hi_unf_sound.h"
#include "hi_unf_disp.h"
#include "hi_unf_vo.h"
#include "hi_unf_demux.h"
#include "hi_adp_hdmi.h"
#include "hi_adp_mpi.h"

#include "HA.AUDIO.MP3.decode.h"
#include "HA.AUDIO.MP2.decode.h"
#include "HA.AUDIO.AAC.decode.h"
#include "HA.AUDIO.DRA.decode.h"
#include "HA.AUDIO.PCM.decode.h"
#include "HA.AUDIO.WMA9STD.decode.h"
#include "HA.AUDIO.AMRNB.codec.h"
#include "HA.AUDIO.DTSHD.decode.h"
#ifdef DOLBYPLUS_HACODEC_SUPPORT
#include "HA.AUDIO.DOLBYPLUS.decode.h"
#endif
#include "HA.AUDIO.DOLBYTRUEHD.decode.h"
#include "HA.AUDIO.TRUEHDPASSTHROUGH.decode.h"

FILE                    *g_pTsFile = HI_NULL;
static pthread_t        g_TsThd;
static pthread_mutex_t  g_TsMutex;
static HI_BOOL          g_bStopTsThread = HI_FALSE;
HI_HANDLE               g_TsBuf;
PMT_COMPACT_TBL         *g_pProgTbl = HI_NULL;
HI_UNF_AVPLAY_MULTIAUD_ATTR_S   g_stMultiAudAttr;
HI_U32                   g_AudPid[32] = {0};
#define  PLAY_DMX_ID  0

HI_S32 AVPlay_ResetMultiAudAttr(HI_HANDLE hAvplay,PMT_COMPACT_TBL *pProgTbl,HI_U32 ProgNum)
{
    HI_S32                  j, Ret;
    HI_UNF_ACODEC_ATTR_S    stAdecAttr[32];

    g_stMultiAudAttr.u32PidNum = pProgTbl->proginfo[ProgNum].AElementNum;
    for(j = 0; j < g_stMultiAudAttr.u32PidNum; j++)
    {
        stAdecAttr[j].enType = pProgTbl->proginfo[ProgNum].Audioinfo[j].u32AudioEncType;

        if (HA_AUDIO_ID_MP2 == stAdecAttr[j].enType)
        {
            HA_MP2_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam));
        }
        else if (HA_AUDIO_ID_AAC == stAdecAttr[j].enType)
        {
            HA_AAC_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam));
        }
        else if (HA_AUDIO_ID_MP3 == stAdecAttr[j].enType)
        {
            HA_MP3_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam));
        }
        else if (HA_AUDIO_ID_DTSHD == stAdecAttr[j].enType)
        {
            static DTSHD_DECODE_OPENCONFIG_S DtsConfig = {0};

            HA_DTSHD_DecGetDefalutOpenConfig(&DtsConfig);

            HA_DTSHD_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam), &DtsConfig);

            stAdecAttr[j].stDecodeParam.enDecMode = HD_DEC_MODE_SIMUL;
        }
    #ifdef DOLBYPLUS_HACODEC_SUPPORT
        else if (HA_AUDIO_ID_DOLBY_PLUS == stAdecAttr[j].enType)
        {
            static DOLBYPLUS_DECODE_OPENCONFIG_S DolbyConfig = {0};

            HA_DOLBYPLUS_DecGetDefalutOpenConfig(&DolbyConfig);

            /* Dolby DVB Broadcast default settings */
            DolbyConfig.enDrcMode = DOLBYPLUS_DRC_RF;
            DolbyConfig.enDmxMode = DOLBYPLUS_DMX_SRND;

            HA_DOLBYPLUS_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam), &DolbyConfig);

            stAdecAttr[j].stDecodeParam.enDecMode = HD_DEC_MODE_SIMUL;
        }
    #endif
     else if (HA_AUDIO_ID_TRUEHD == stAdecAttr[j].enType)
        {
            HA_TRUEHD_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam));
            stAdecAttr[j].stDecodeParam.enDecMode = HD_DEC_MODE_THRU;        /* truehd just support pass-through */
            sample_common_printf(" TrueHD decoder(HBR Pass-through only).\n");
        }
        else if (HA_AUDIO_ID_DOLBY_TRUEHD == stAdecAttr[j].enType)
        {
            static TRUEHD_DECODE_OPENCONFIG_S DolbyTrueHDConfig = {0};
            HA_DOLBY_TRUEHD_DecGetDefalutOpenConfig(&DolbyTrueHDConfig);
            HA_DOLBY_TRUEHD_DecGetDefalutOpenParam(&(stAdecAttr[j].stDecodeParam), &DolbyTrueHDConfig);
        }

        g_AudPid[j] = (HI_U32)(g_pProgTbl->proginfo[ProgNum].Audioinfo[j].u16AudioPid);
        //printf("dai %u, AudPid[%u] : 0x%x\n", g_stMultiAudAttr.u32PidNum, j,  g_AudPid[j]);
    }

    g_stMultiAudAttr.pu32AudPid = g_AudPid;
    g_stMultiAudAttr.pstAcodecAttr = stAdecAttr;

    Ret = HI_UNF_AVPLAY_SetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_MULTIAUD, &g_stMultiAudAttr);
    if (HI_SUCCESS != Ret)
    {
        sample_common_printf("set multi audio attr to avplay failed.\n");
        return Ret;
    }

    return HI_SUCCESS;
}

HI_S32 AVPlay_PlayProg(HI_HANDLE hAvplay,PMT_COMPACT_TBL *pProgTbl,HI_U32 ProgNum,HI_BOOL bAudPlay)
{
    HI_UNF_AVPLAY_STOP_OPT_S    Stop;
    HI_U32                  VidPid;
    HI_U32                  AudPid;
    HI_U32                  PcrPid;
    HI_UNF_VCODEC_TYPE_E    enVidType;
    HI_U32                  u32AudType;
    HI_S32                  Ret;

    Stop.enMode = HI_UNF_AVPLAY_STOP_MODE_BLACK;
    Stop.u32TimeoutMs = 0;
    Ret = HI_UNF_AVPLAY_Stop(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_VID | HI_UNF_AVPLAY_MEDIA_CHAN_AUD, &Stop);
    if (HI_SUCCESS != Ret)
    {
        sample_common_printf("call HI_UNF_AVPLAY_Stop failed.\n");
        return Ret;
    }

    Ret = AVPlay_ResetMultiAudAttr(hAvplay, pProgTbl, ProgNum);
    if (HI_SUCCESS != Ret)
    {
        sample_common_printf("AVPlay_ResetMultiAudAttr failed 0x%x\n", Ret);
        return Ret;
    }

    ProgNum = ProgNum % pProgTbl->prog_num;
    if (pProgTbl->proginfo[ProgNum].VElementNum > 0 )
    {
        VidPid = pProgTbl->proginfo[ProgNum].VElementPid;
        enVidType = pProgTbl->proginfo[ProgNum].VideoType;
    }
    else
    {
        VidPid = INVALID_TSPID;
        enVidType = HI_UNF_VCODEC_TYPE_BUTT;
    }

    if (pProgTbl->proginfo[ProgNum].AElementNum > 0)
    {
        AudPid  = pProgTbl->proginfo[ProgNum].AElementPid;
        u32AudType = pProgTbl->proginfo[ProgNum].AudioType;
    }
    else
    {
        AudPid = INVALID_TSPID;
        u32AudType = 0xffffffff;
    }

    PcrPid = pProgTbl->proginfo[ProgNum].PcrPid;
    if (INVALID_TSPID != PcrPid)
    {
        HI_UNF_SYNC_ATTR_S  SyncAttr;

        Ret = HI_UNF_AVPLAY_GetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_SYNC, &SyncAttr);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("HI_UNF_AVPLAY_GetAttr Sync failed 0x%x\n", Ret);
            return Ret;
        }

        if (HI_UNF_SYNC_REF_PCR == SyncAttr.enSyncRef)
        {
            Ret = HI_UNF_AVPLAY_SetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_PCR_PID, &PcrPid);
            if (HI_SUCCESS != Ret)
            {
                sample_common_printf("HI_UNF_AVPLAY_SetAttr Sync failed 0x%x\n", Ret);
                return Ret;
            }
        }
    }

    if (VidPid != INVALID_TSPID)
    {
        Ret = HIADP_AVPlay_SetVdecAttr(hAvplay,enVidType,HI_UNF_VCODEC_MODE_NORMAL);
        Ret |= HI_UNF_AVPLAY_SetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_VID_PID,&VidPid);
        if (Ret != HI_SUCCESS)
        {
            sample_common_printf("call HIADP_AVPlay_SetVdecAttr failed.\n");
            return Ret;
        }

        Ret = HI_UNF_AVPLAY_Start(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_VID, HI_NULL);
        if (Ret != HI_SUCCESS)
        {
            sample_common_printf("call HI_UNF_AVPLAY_Start failed.\n");
            return Ret;
        }
    }

    if (HI_TRUE == bAudPlay && AudPid != INVALID_TSPID)
    {
        //u32AudType = HA_AUDIO_ID_DTSHD;
        //printf("u32AudType = %#x\n",u32AudType);
        Ret  = HIADP_AVPlay_SetAdecAttr(hAvplay, u32AudType, HD_DEC_MODE_RAWPCM, 1);

        Ret |= HI_UNF_AVPLAY_SetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_AUD_PID, &AudPid);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("HIADP_AVPlay_SetAdecAttr failed:%#x\n",Ret);
            return Ret;
        }

        Ret = HI_UNF_AVPLAY_Start(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_AUD, HI_NULL);
        if (Ret != HI_SUCCESS)
        {
            printf("call HI_UNF_AVPLAY_Start to start audio failed.\n");
            //return Ret;
        }
    }

    return HI_SUCCESS;
}

HI_VOID TsTthread(HI_VOID *args)
{
    HI_UNF_STREAM_BUF_S   StreamBuf;
    HI_U32                Readlen;
    HI_S32                Ret;

    while (!g_bStopTsThread)
    {
        pthread_mutex_lock(&g_TsMutex);
        Ret = HI_UNF_DMX_GetTSBuffer(g_TsBuf, 188*50, &StreamBuf, 1000);
        if (Ret != HI_SUCCESS )
        {
            pthread_mutex_unlock(&g_TsMutex);
            continue;
        }

        Readlen = fread(StreamBuf.pu8Data, sizeof(HI_S8), 188*50, g_pTsFile);
        if(Readlen <= 0)
        {
            printf("read ts file end and rewind!\n");
            rewind(g_pTsFile);
            pthread_mutex_unlock(&g_TsMutex);
            continue;
        }

        Ret = HIADP_DMX_PushTsBuffer(g_TsBuf, &StreamBuf, 0, Readlen);
        if (Ret != HI_SUCCESS )
        {
            printf("call HI_UNF_DMX_PutTSBuffer failed.\n");
        }
        pthread_mutex_unlock(&g_TsMutex);
    }

    Ret = HI_UNF_DMX_ResetTSBuffer(g_TsBuf);
    if (Ret != HI_SUCCESS )
    {
        printf("call HI_UNF_DMX_ResetTSBuffer failed.\n");
    }

    return;
}


HI_S32 main(HI_S32 argc,HI_CHAR *argv[])
{
    HI_S32                      Ret;
    HI_HANDLE                   hWin;
    HI_HANDLE                   hAvplay;
    HI_UNF_AVPLAY_ATTR_S        AvplayAttr;
    HI_UNF_SYNC_ATTR_S          SyncAttr;
    HI_UNF_AVPLAY_STOP_OPT_S    Stop;
    HI_CHAR                     InputCmd[32];
    HI_UNF_ENC_FMT_E            enFormat = HI_UNF_ENC_FMT_1080i_50;
    HI_U32                      ProgNum;

    HI_S32                      i;
    HI_HANDLE                   hTrack;
    HI_UNF_AUDIOTRACK_ATTR_S    stTrackAttr;

    if (3 == argc)
    {
        enFormat = HIADP_Disp_StrToFmt(argv[2]);
    }
    else if (2 == argc)
    {
        enFormat = HI_UNF_ENC_FMT_1080i_50;
    }
    else
    {
        printf("Usage: %s file [vo_format]\n", argv[0]);
        printf("       vo_format:2160P_30|2160P_24|1080P_60|1080P_50|1080i_60|[1080i_50]|720P_60|720P_50\n");
        printf("Example: %s ./test.ts 1080i_50\n", argv[0]);
        return 0;
    }

    g_pTsFile = fopen(argv[1], "rb");
    if (!g_pTsFile)
    {
        printf("open file %s error!\n", argv[1]);
        return -1;
    }

    HI_SYS_Init();

    HIADP_MCE_Exit();

    Ret = HIADP_Snd_Init();
    if (HI_SUCCESS != Ret)
    {
        printf("call SndInit failed.\n");
        goto SYS_DEINIT;
    }

    Ret = HIADP_Disp_Init(enFormat);
    if (HI_SUCCESS != Ret)
    {
        printf("call HIADP_Disp_Init failed.\n");
        goto SND_DEINIT;
    }

    Ret = HIADP_VO_Init(HI_UNF_VO_DEV_MODE_NORMAL);
    Ret |= HIADP_VO_CreatWin(HI_NULL,&hWin);
    if (HI_SUCCESS != Ret)
    {
        printf("call VoInit failed.\n");
        HIADP_VO_DeInit();
        goto DISP_DEINIT;
    }

    Ret = HI_UNF_DMX_Init();
    if (HI_SUCCESS != Ret)
    {
        printf("call HI_UNF_DMX_Init failed.\n");
        goto DISP_DEINIT;
    }

    Ret = HI_UNF_DMX_AttachTSPort(PLAY_DMX_ID,HI_UNF_DMX_PORT_RAM_0);
    if (HI_SUCCESS != Ret)
    {
        printf("call HI_UNF_DMX_AttachTSPort failed.\n");
        goto VO_DEINIT;
    }

    Ret = HI_UNF_DMX_CreateTSBuffer(HI_UNF_DMX_PORT_RAM_0, 0x200000, &g_TsBuf);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_DMX_CreateTSBuffer failed.\n");
        goto DMX_DEINIT;
    }

    Ret = HIADP_AVPlay_RegADecLib();
    if (HI_SUCCESS != Ret)
    {
        printf("call RegADecLib failed.\n");
        goto TSBUF_FREE;
    }

    Ret = HI_UNF_AVPLAY_Init();
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_AVPLAY_Init failed.\n");
        goto DMX_DEINIT;
    }

    Ret = HI_UNF_AVPLAY_GetDefaultConfig(&AvplayAttr, HI_UNF_AVPLAY_STREAM_TYPE_TS);
    AvplayAttr.u32DemuxId = PLAY_DMX_ID;
    Ret |= HI_UNF_AVPLAY_Create(&AvplayAttr, &hAvplay);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_AVPLAY_Create failed.\n");
        goto AVPLAY_DEINIT;
    }

    Ret = HI_UNF_AVPLAY_ChnOpen(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_VID, HI_NULL);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_AVPLAY_ChnOpen failed.\n");
        goto AVPLAY_DESTROY;
    }

    Ret = HI_UNF_AVPLAY_ChnOpen(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_AUD, HI_NULL);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_AVPLAY_ChnOpen failed.\n");
        goto VCHN_CLOSE;
    }

    Ret = HI_UNF_VO_AttachWindow(hWin, hAvplay);
    if (HI_SUCCESS != Ret)
    {
        printf("call HI_UNF_VO_AttachWindow failed:%#x.\n",Ret);
    }
    Ret = HI_UNF_VO_SetWindowEnable(hWin, HI_TRUE);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_VO_SetWindowEnable failed.\n");
        goto WIN_DETACH;
    }

    Ret = HI_UNF_SND_GetDefaultTrackAttr(HI_UNF_SND_TRACK_TYPE_MASTER, &stTrackAttr);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_SND_GetDefaultTrackAttr failed.\n");
        goto WIN_DETACH;
    }
    Ret = HI_UNF_SND_CreateTrack(HI_UNF_SND_0, &stTrackAttr, &hTrack);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_SND_CreateTrack failed.\n");
        goto WIN_DETACH;
    }

    Ret = HI_UNF_SND_Attach(hTrack, hAvplay);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_SND_Attach failed.\n");
        goto TRACK_DESTROY;
    }

    Ret = HI_UNF_AVPLAY_GetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_SYNC, &SyncAttr);
    SyncAttr.enSyncRef = HI_UNF_SYNC_REF_AUDIO;
    Ret |= HI_UNF_AVPLAY_SetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_SYNC, &SyncAttr);
    if (Ret != HI_SUCCESS)
    {
        printf("call HI_UNF_AVPLAY_SetAttr failed.\n");
        goto SND_DETACH;
    }

    pthread_mutex_init(&g_TsMutex,NULL);
    g_bStopTsThread = HI_FALSE;
    pthread_create(&g_TsThd, HI_NULL, (HI_VOID *)TsTthread, HI_NULL);

    HIADP_Search_Init();
    Ret = HIADP_Search_GetAllPmt(PLAY_DMX_ID, &g_pProgTbl);
    if (Ret != HI_SUCCESS)
    {
        printf("call HIADP_Search_GetAllPmt failed.\n");
        goto PSISI_FREE;
    }

    ProgNum = 0;

    pthread_mutex_lock(&g_TsMutex);
    rewind(g_pTsFile);
    HI_UNF_DMX_ResetTSBuffer(g_TsBuf);

    Ret = AVPlay_PlayProg(hAvplay,g_pProgTbl,ProgNum,HI_TRUE);
    if (Ret != HI_SUCCESS)
    {
        printf("call SwitchProg failed.\n");
        goto AVPLAY_STOP;;
    }

    pthread_mutex_unlock(&g_TsMutex);

    i = ProgNum + 1;

    while (1)
    {
        printf("please input 'q' to quit, 'c' to switch the aud!\n");

        SAMPLE_GET_INPUTCMD(InputCmd);
        if ('q' == InputCmd[0])
        {
            printf("prepare to quit!\n");
            break;
        }

        if ('c' == InputCmd[0])
        {
            if (g_stMultiAudAttr.u32PidNum <= 1)
            {
                printf("only one audio track exists, can not switch!\n");
                continue;
            }

            i = (i >= g_stMultiAudAttr.u32PidNum) ? 0 : i;

            printf("now switch the aud, pid = %#x!\n", g_AudPid[i]);

            Ret = HI_UNF_AVPLAY_SetAttr(hAvplay, HI_UNF_AVPLAY_ATTR_ID_AUD_PID, &g_AudPid[i++]);
            if (HI_SUCCESS != Ret)
            {
                printf("HI_UNF_AVPLAY_SetAttr failed 0x%x\n", Ret);
            }

            continue;
        }

        ProgNum = atoi(InputCmd);
        if (ProgNum == 0)
            ProgNum = 1;

        pthread_mutex_lock(&g_TsMutex);
        rewind(g_pTsFile);
        HI_UNF_DMX_ResetTSBuffer(g_TsBuf);

        Ret = AVPlay_PlayProg(hAvplay,g_pProgTbl,ProgNum-1,HI_TRUE);
        if (Ret != HI_SUCCESS)
        {
            printf("call SwitchProgfailed!\n");
            break;
        }
        pthread_mutex_unlock(&g_TsMutex);
    }

AVPLAY_STOP:
    Stop.enMode = HI_UNF_AVPLAY_STOP_MODE_BLACK;
    Stop.u32TimeoutMs = 0;
    HI_UNF_AVPLAY_Stop(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_VID | HI_UNF_AVPLAY_MEDIA_CHAN_AUD, &Stop);

PSISI_FREE:
    HIADP_Search_FreeAllPmt(g_pProgTbl);
    g_pProgTbl = HI_NULL;
    HIADP_Search_DeInit();

    g_bStopTsThread = HI_TRUE;
    pthread_join(g_TsThd, HI_NULL);
    pthread_mutex_destroy(&g_TsMutex);

SND_DETACH:
    HI_UNF_SND_Detach(hTrack, hAvplay);

TRACK_DESTROY:
    HI_UNF_SND_DestroyTrack(hTrack);

WIN_DETACH:
    HI_UNF_VO_SetWindowEnable(hWin,HI_FALSE);
    HI_UNF_VO_DetachWindow(hWin, hAvplay);

    HI_UNF_AVPLAY_ChnClose(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_AUD);

VCHN_CLOSE:
    HI_UNF_AVPLAY_ChnClose(hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_VID);

AVPLAY_DESTROY:
    HI_UNF_AVPLAY_Destroy(hAvplay);

AVPLAY_DEINIT:
    HI_UNF_AVPLAY_DeInit();

TSBUF_FREE:
    HI_UNF_DMX_DestroyTSBuffer(g_TsBuf);

DMX_DEINIT:
    HI_UNF_DMX_DetachTSPort(0);
    HI_UNF_DMX_DeInit();

VO_DEINIT:
    HI_UNF_VO_DestroyWindow(hWin);
    HIADP_VO_DeInit();

DISP_DEINIT:
    HIADP_Disp_DeInit();

SND_DEINIT:
    HIADP_Snd_DeInit();

SYS_DEINIT:
    HI_SYS_DeInit();

    fclose(g_pTsFile);
    g_pTsFile = HI_NULL;

    return Ret;
}


