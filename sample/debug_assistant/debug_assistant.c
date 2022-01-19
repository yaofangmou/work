/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : tsplay_pid.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2011/05/13
  Description   :
  History       :
  1.Date        : 2011/05/13
    Author      :
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
#include <pthread.h>
#include <sys/stat.h>
#include <assert.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdarg.h>
#include <dirent.h>
#include <time.h>

#include "hi_type.h"
#include "debug_assistant_common.h"
#include "debug_assistant_media.h"
#include "debug_assistant_hdmi.h"
#include "debug_assistant_usb.h"
#include "debug_assistant_lang.h"

#include "hi_common.h"
#include "hi_adp.h"


#define LOG_NAME "/debug_assistant.log"

#ifdef CONFIG_SUPPORT_CA_RELEASE
#define sample_printf
#else
#define sample_printf printf
#endif

HI_U32      u32Lang = 0;
FILE        *fLog = HI_NULL;
HI_CHAR     *pszBuf = HI_NULL;
HI_U32      u32Len = 0;

HI_CHAR     aszLogDir[256];


/* Print variable log to both console and log file */
HI_VOID assistant_printf_ext(const HI_CHAR *pszFormat, ...)
{
    HI_CHAR szTmp[1024];
    va_list stArgs = {0};

    va_start(stArgs, pszFormat);
    vsnprintf(szTmp, sizeof(szTmp), pszFormat, stArgs);
    va_end(stArgs);

    printf("%s", szTmp);
    if (HI_NULL != fLog)
    {
        fwrite(szTmp, strlen(szTmp), 1, fLog);
    }
}

HI_BOOL ProcExist(const HI_CHAR * pszFile)
{
    HI_S32 s32Ret = 0;    
    struct stat stSta = {0};

    s32Ret = stat(pszFile, &stSta);
    if (0 != s32Ret)
    {
        sample_printf("Access %s fail: %s\n", pszFile, strerror(errno));
        return HI_FALSE;
    }
    else
    {
        return HI_TRUE;
    }
}

HI_VOID WriteProc(const HI_CHAR * pszCmd)
{
    assistant_printf(WRITE_PROC[u32Lang]);
    assistant_printf_ext("%s \r\n", pszCmd);
    system(pszCmd);
}

HI_VOID ReadProc(const HI_CHAR * pszProc)
{
    FILE *fProc = HI_NULL;
    HI_U32 u32ReadLen = 0;

    assistant_printf_ext("%s %s\r\n", READ_PROC[u32Lang], pszProc);

    fProc = fopen(pszProc, "r");
    if (HI_NULL == fProc)
    {
        assistant_printf_ext("Open %s fail.\r\n", pszProc);
        return;
    }

    if (HI_NULL == pszBuf)
    {
        return;
    }

    memset(pszBuf, 0, CACHE_SIZE);
    u32Len = 0;

    //while (1)
    {
        u32ReadLen = fread(pszBuf, 1, CACHE_SIZE, fProc);
        if (u32ReadLen > 0)
        {
            u32Len += u32ReadLen;
            if (HI_NULL != fLog)
            {
                fwrite(pszBuf, u32ReadLen, 1, fLog);
            }
        }
        else
        {
            //break;
        }
    }

    assistant_printf_ext("%s %u B.\r\n\r\n", READ_RESULT[u32Lang], u32Len);

    fclose(fProc);
}

HI_VOID Wait(HI_U32 u32Second)
{
    int i = 0;

    assistant_printf_ext("wait %ds ", u32Second);
    fflush(stdout);

    while (i++ < u32Second)
    {
        assistant_printf(".");
        fflush(stdout);
        sleep(1);
    }

    assistant_printf("\n");
}

HI_CHAR * GetNewDirName(HI_CHAR *pszPath, HI_CHAR *pszNewDir, HI_U32 u32Size)
{
    struct dirent* pEnt = NULL;
    DIR *pDir = NULL;
    HI_U32 u32MaxNumber = 0;
    HI_U32 u32Number = 0;

    if (HI_NULL == pszPath)
    {
        sample_printf("GetNewDirName need an input directory!\n");
        return HI_NULL;
    }

    pDir=opendir(pszPath);

    while (HI_NULL != (pEnt=readdir(pDir)))
    {
        //sample_printf("pEnt->d_name = %s\n", pEnt->d_name);
        u32Number = atoi(pEnt->d_name);
        if (u32Number > u32MaxNumber)
        {
            u32MaxNumber = u32Number;
        }
    }

    closedir(pDir);

    if (++u32MaxNumber > 99999)
        u32MaxNumber %= 100000;

    snprintf(pszNewDir, u32Size, "%05d", u32MaxNumber);
    return pszNewDir;
}

static HI_S32 OtherIssueHandler(HI_VOID)
{
    assistant_printf(CAT_ALL_PROC[u32Lang]);
    system("cat /proc/media-mem; cat /proc/meminfo; cat /proc/msp/*;");
    system("cat /proc/media-mem; cat /proc/meminfo; cat /proc/msp/*;");
    system("cat /proc/media-mem; cat /proc/meminfo; cat /proc/msp/*;");
    return HI_DONE;
}


HI_S32 main(HI_S32 argc,HI_CHAR *argv[])
{
    HI_S32      s32Ret = HI_FAILURE;
    HI_CHAR     aszInputCmd[32];
    HI_CHAR     aszLogDirName[8];
    HI_CHAR     aszLogFileName[256];
    HI_CHAR     aszTmpCmd[1024];
    HI_CHAR     *pPath = HI_NULL;
    struct stat stSta = {0};

    /* Usage and arg */
    if(argc > 2)
    {
        if ((0 == strcasecmp("cn",argv[2])) || (0 == strcasecmp("1",argv[2])))
        {
            u32Lang = 0; //1;
        }
        else if ((0 == strcasecmp("en",argv[2])) || (0 == strcasecmp("0",argv[2])))
        {
            u32Lang = 0;
        }
    }
    else
    {
        u32Lang = 0;
    }

    memset(aszLogDir, 0, sizeof(aszLogDir));
    if(argc > 1)
    {
        if ((0 == strcasecmp("-h",argv[1])) || (0 == strcasecmp("--help",argv[1])))
        {
            sample_printf("Usage: %s [Log output directory] [Language]\n\tLanguage:\n\t\t0 or en: English, Only support English now\n", argv[0]);
            sample_printf("       %s -h or --help\t Print this info\n", argv[0]);
            return HI_SUCCESS;
        }
        else
        {
            /* Check and use user input directory */
            s32Ret = stat(argv[1], &stSta);
            if (0 != s32Ret)
            {
                sample_printf("Access %s fail: %s\n", argv[1], strerror(errno));
                return HI_FAILURE;
            }
            if (0 == (S_IFDIR & stSta.st_mode))
            {
                sample_printf("%s isn't a directoy\n", argv[1]);
                return HI_FAILURE;
            }
            if (0 == (S_IWUSR & stSta.st_mode))
            {
                sample_printf("%s can't be wrote\n", argv[1]);
                return HI_FAILURE;
            }

            strncpy(aszLogDir, argv[1], sizeof(aszLogDir));
        }
    }
    else
    {
        /* Use cwd as the output directory */
        pPath = getcwd(aszLogDir, sizeof(aszLogDir));
        if (HI_NULL == pPath)
        {
            sample_printf("Get work path fail.\n");
            return HI_FAILURE;
        }
    }

    /* Check whether the output directory is existed or not */
    pPath = strncat(aszLogDir, "/DA_LOG/", strlen("/DA_LOG/"));
    if (HI_NULL == pPath)
    {
        sample_printf("Generate path fail.\n");
        return HI_FAILURE;
    }

    if (0 != access(aszLogDir, F_OK))
    {
        if (0 != mkdir(aszLogDir, S_IRWXU|S_IRWXG|S_IRWXO))
        {
            sample_printf("mkdir %s fail: %s.\n", aszLogDir, strerror(errno));
            return HI_FAILURE;
        }
    }

    /* Chmod */
    if (0 != chmod(aszLogDir, S_IRWXU|S_IRWXG|S_IRWXO))
    {
        sample_printf("[WARNING] chmod fail:%s\n", strerror(errno));
    }

    /* Open cache */
    pszBuf = malloc(CACHE_SIZE);
    if (HI_NULL == pszBuf)
    {
        sample_printf("Alloc %d B memory fail.\n", CACHE_SIZE);
        return HI_FAILURE;
    }
    memset(pszBuf, 0, CACHE_SIZE);

    /* Welcome */
    assistant_printf(WELCOME_SYMBOL[u32Lang]);
    assistant_printf(WELCOME_SYMBOL2[u32Lang]);
    assistant_printf(WELCOME_PROMPT[u32Lang]);
    assistant_printf(WELCOME_SYMBOL2[u32Lang]);
    assistant_printf(WELCOME_SYMBOL[u32Lang]);

    HI_SYS_Init();
    HdmiInit();

    /* LOG path: Set */
    if (HI_NULL == GetNewDirName(aszLogDir, aszLogDirName, sizeof(aszLogDirName)))
    {
        sample_printf("Generate log directory fail.\n");
        goto FREE_CACHE;
    }

    pPath = strncat(aszLogDir, aszLogDirName, strlen(aszLogDirName));
    if (HI_NULL == pPath)
    {
        sample_printf("Generate log path fail.\n");
        return HI_FAILURE;
    }

    if (0 != mkdir(aszLogDir, S_IRWXU|S_IRWXG|S_IRWXO))
    {
        sample_printf("mkdir %s fail: %s.\n", aszLogDir, strerror(errno));
        return HI_FAILURE;
    }

    /* Log */
    snprintf(aszLogFileName, sizeof(aszLogFileName), "%s%s", aszLogDir, LOG_NAME);

    fLog = fopen(aszLogFileName, "w+");
    if (HI_NULL == fLog)
    {
        sample_printf("Open log file(%s) for debug assistant fail, please check: \r\n\t1.Whether the device is writeable; \r\n\t2.Whether the device is full.\n", aszLogFileName);
        goto FREE_CACHE;
    }

    snprintf(aszTmpCmd, sizeof(aszTmpCmd), "echo log=%s > /proc/msp/log", aszLogDir);
    WriteProc(aszTmpCmd);
    snprintf(aszTmpCmd, sizeof(aszTmpCmd), "echo storepath=%s > /proc/msp/log", aszLogDir);
    WriteProc(aszTmpCmd);

    /* Set Ret flag */
    s32Ret = HI_FAILURE;

    while(1)
    {
        if (s32Ret == HI_DONE)
        {
            assistant_printf(RESPONSE_DONE[u32Lang]);
            break;
        }

        if (s32Ret == HI_SUCCESS)
        {
            assistant_printf(RESPONSE_QUIT[u32Lang]);
            break;
        }

        assistant_printf(CATALOG_ROOT[u32Lang]);
        assistant_printf(CASE_SELECT_PROMPT[u32Lang]);
        assistant_printf(CASE_SELECT_1[u32Lang]);
        assistant_printf(CASE_SELECT_2[u32Lang]);
        assistant_printf(CASE_SELECT_3[u32Lang]);
        assistant_printf(CASE_SELECT_4[u32Lang]);
        assistant_printf(CASE_SELECT_QUIT[u32Lang]);
        assistant_printf(CASE_SELECT_INPUT[u32Lang]);

        SAMPLE_GET_INPUTCMD(aszInputCmd);
        assistant_printf_ext("Input [%c]\r\n", aszInputCmd[0]);

        switch (aszInputCmd[0])
        {
            case '1':
                s32Ret = PlaybackIssueHandler();
                break;

            case '2':
                s32Ret = HdmiIssueHandler();
                break;

            case '3':
                s32Ret = USBIssueHandler();
                break;

            case '4':
                s32Ret = OtherIssueHandler();
                break;

            case 'q':
            case 'Q':
                s32Ret = HI_SUCCESS;
                break;

            default:
                assistant_printf(RESPONSE_INVALID_INPUT[u32Lang]);
                break;
        }
    }

    /* TODO: Resume LOG path */

    HI_SYS_DeInit();

    /* Log */
    snprintf(aszTmpCmd, sizeof(aszTmpCmd), "chmod 777 -R %s", aszLogDir);
    system(aszTmpCmd);

    if (HI_NULL != fLog)
    {
        fclose(fLog);
        fLog = HI_NULL;
    }

FREE_CACHE:
    if (HI_NULL != pszBuf)
    {
        free(pszBuf);
        pszBuf = HI_NULL;
    }

    return s32Ret;
}


