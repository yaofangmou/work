#include <string.h>
#include <stdlib.h>
#include "debug_assistant_media.h"

#define TUNER_MAX (16)

static HI_VOID AnalyseTunerLockStatus(HI_VOID)
{
    HI_U32 u32Pos = 0;
    HI_U8 i = 0, j = 0;
    HI_U8 u8Port[TUNER_MAX];
    HI_BOOL bStatus[TUNER_MAX];

    while (u32Pos < u32Len)
    {
        if ('P' == pszBuf[u32Pos])
        {
            /* Find Port */
            if (0 == strncasecmp("Port", pszBuf+u32Pos, strlen("Port")))
            {
                /* Find next line */
                while (('\n' != pszBuf[u32Pos]) && (u32Pos < u32Len))
                {
                    u32Pos++;
                }

                /* Find ':' */
                while ((':' != pszBuf[u32Pos]) && (u32Pos < u32Len))
                {
                    u32Pos++;
                }

                /* Valid tuner is found */
                if (i >= TUNER_MAX)
                {
                    break;
                }
                u8Port[i] = atoi(pszBuf+u32Pos-1);

                u32Pos++;
                while ((' ' == pszBuf[u32Pos]) && (u32Pos < u32Len))
                {
                    u32Pos++;
                }

                if (0 == strncasecmp("locked", pszBuf+u32Pos, strlen("locked")))
                {
                    bStatus[i] = HI_TRUE;
                    i++;
                    u32Pos += strlen("locked");
                }
                else if (0 == strncasecmp("unlocked", pszBuf+u32Pos, strlen("unlocked")))
                {
                    bStatus[i] = HI_FALSE;
                    i++;
                    u32Pos += strlen("unlocked");
                }
            }
            else
            {
                u32Pos++;
            }
        }
        else
        {
            u32Pos++;
        }
    }

    while (j < i)
    {
        if (HI_TRUE == bStatus[j])
        {
            assistant_printf_ext("%s %d %s.\r\n", TUNER[u32Lang], u8Port[j], TUNER_LOCK[u32Lang]);
        }
        else
        {
            assistant_printf_ext("%s %s %d %s.\r\n", WARNING[u32Lang], TUNER[u32Lang], u8Port[j], TUNER_UNLOCK[u32Lang]);
        }

        j++;
    }
}

static HI_VOID RecordStream(HI_U32 u32Sec)
{
    WriteProc("echo save allts start 0 > /proc/msp/demux_main");
    WriteProc("echo save ipts start 128 > /proc/msp/demux_main");
    WriteProc("echo save es start > /proc/msp/demux_main");
    /* Record stream from vdec */
    WriteProc("echo savestream 0 > /proc/msp/vdec_ctrl");
    
    Wait(u32Sec);
    
    WriteProc("echo save allts stop > /proc/msp/demux_main");
    WriteProc("echo save ipts stop > /proc/msp/demux_main");
    WriteProc("echo save es stop > /proc/msp/demux_main");
    WriteProc("echo savestream 0 > /proc/msp/vdec_ctrl");
}

static HI_VOID DebugOutofSync(HI_VOID)
{
    WriteProc("echo SyncLogDepth=600 > /proc/msp/sync00");
    Wait(10);
    WriteProc("echo SyncLogDetail=on > /proc/msp/sync00");
    ReadProc("/proc/msp/sync00");
    WriteProc("echo SyncLogDetail=off > /proc/msp/sync00");
    
    RecordStream(20);
}

static HI_VOID PlaybackFail(HI_VOID)
{
    HI_S32      i;
    HI_S32      s32Cnt = 4;

    /* Get tuner proc and analyse */
    ReadProc("/proc/msp/tuner");
    AnalyseTunerLockStatus();
    ReadProc("/proc/msp/tuner_diseqc");
    ReadProc("/proc/msp/tuner_reg");

    for (i=0; i<s32Cnt; i++)
    {
        ReadProc("/proc/msp/tuner");
        ReadProc("/proc/msp/demux_chan");
        ReadProc("/proc/msp/demux_chanbuf");
        ReadProc("/proc/msp/demux_filter");
        ReadProc("/proc/msp/demux_main");
        ReadProc("/proc/msp/demux_key");
        ReadProc("/proc/msp/demux_pcr");
        ReadProc("/proc/msp/demux_port");

        if (i<s32Cnt-1)
        {
            Wait(5);
        }
    }

    RecordStream(20);
}

static HI_VOID PlaybackNotSmooth(HI_VOID)
{    
    HI_CHAR     aszInputCmd[32];
    HI_S32      i;
    HI_S32      s32Cnt = 4;

    if (! ProcExist("/proc/msp/sync00"))
    {
        assistant_printf(ERR_NEED_PLAY_FIRST[u32Lang]);
        return ;
    }

    WriteProc("echo SyncRef=none > /proc/msp/sync00");
    Wait(10);

    assistant_printf(PROMPT_CHECK_OK_OR_NOT[u32Lang]);
    
    SAMPLE_GET_INPUTCMD(aszInputCmd);
    assistant_printf_ext("Input [%c]\r\n", aszInputCmd[0]);

    if (('y' == aszInputCmd[0]) || ('Y' == aszInputCmd[0]))
    {
        DebugOutofSync();
    }
    else
    {
        for (i=0; i<s32Cnt; i++)
        {
            ReadProc("/proc/msp/tuner");
            ReadProc("/proc/msp/demux_main");
            ReadProc("/proc/msp/demux_port");
            ReadProc("/proc/msp/demux_pcr");
            ReadProc("/proc/msp/demux_chan");
            ReadProc("/proc/msp/demux_chanbuf");
            ReadProc("/proc/msp/avplay00");
            ReadProc("/proc/msp/vfmw_scd");
            ReadProc("/proc/msp/vfmw_vdh");
            ReadProc("/proc/msp/vfmw_chan");
            ReadProc("/proc/msp/sync00");
            ReadProc("/proc/msp/vdec00");
            ReadProc("/proc/msp/win0100");
            ReadProc("/proc/msp/adec00");
            ReadProc("/proc/msp/sound0");

            if (i<s32Cnt-1)
            {
                Wait(5);
            }
        }

        RecordStream(20);
    }
    
}

static HI_VOID PlaybackOutOfSync(HI_VOID)
{
    HI_S32      i;
    
    if (! ProcExist("/proc/msp/sync00"))
    {
        assistant_printf(ERR_NEED_PLAY_FIRST[u32Lang]);
        return ;
    }

    for (i=0; i<3; i++)
    {
        ReadProc("/proc/msp/avplay00");
        ReadProc("/proc/msp/sync00");
        Wait(1);
    }

    DebugOutofSync();
}

static HI_VOID PlaybackOther(HI_VOID)
{
    HI_S32      i;
    HI_S32      s32Cnt = 4;

    for (i=0; i<s32Cnt; i++)
    {
        system("cat /proc/media-mem; cat /proc/meminfo; cat /proc/msp/*;");

        if (i<s32Cnt-1)
        {
            Wait(5);
        }
    }

    RecordStream(20);
}

HI_S32 PlaybackIssueHandler(HI_VOID)
{
    HI_CHAR                 aszInputCmd[32];

PLAYBACK_AGAIN:
    assistant_printf(CATALOG_1[u32Lang]);
    assistant_printf(CASE_SELECT_1_1[u32Lang]);
    assistant_printf(CASE_SELECT_1_2[u32Lang]);
    assistant_printf(CASE_SELECT_1_3[u32Lang]);
    assistant_printf(CASE_SELECT_1_4[u32Lang]);
    assistant_printf(CASE_SELECT_BACK[u32Lang]);
    assistant_printf(CASE_SELECT_QUIT[u32Lang]);
    assistant_printf(CASE_SELECT_INPUT[u32Lang]);

    SAMPLE_GET_INPUTCMD(aszInputCmd);
    assistant_printf_ext("Input [%c]\r\n", aszInputCmd[0]);

    switch (aszInputCmd[0])
    {
        case '1':
            PlaybackFail();
            return HI_DONE;

        case '2':
            PlaybackNotSmooth();
            return HI_DONE;

        case '3':
            PlaybackOutOfSync();
            return HI_DONE;

        case '4':
            PlaybackOther();
            return HI_DONE;

        case '0':
            return HI_FAILURE;

        case 'q':
        case 'Q':
            return HI_SUCCESS;

        default:
            assistant_printf(RESPONSE_INVALID_INPUT[u32Lang]);
            goto PLAYBACK_AGAIN;
    }
}

