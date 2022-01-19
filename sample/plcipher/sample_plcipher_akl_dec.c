/******************************************************************************

  Copyright (C), 2004-2017, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : sample_plcipher_akl_dec.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2017/04/07
  Description   :
  History       :
******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <pthread.h>

#include "hi_adp.h"
#include "hi_unf_common.h"
#include "hi_unf_disp.h"
#include "hi_unf_demux.h"
#include "hi_adp_mpi.h"
#include "hi_unf_payloadcipher.h"
#include "hi_unf_klad.h"
#include "hi_unf_klad_common_ca.h"
#include "hi_unf_klad_nagra.h"
#include "parse_config_file.h"
#include "hi_unf_cert.h"

#define PLCIPHERCHANNELNUM 3

#define FIX_ARGNUM 4
#define MAX_ARGNUM 9

#define MAXBB (47*1024)
#if defined(CHIP_TYPE_hi3716mv420) || defined(CHIP_TYPE_hi3716mv410)
#define MINBB (188*16)
#else
#define MINBB (188)
#endif

HI_MMZ_BUF_S PlainBuf1,EncrytedBuf1;

HI_BOOL bMMZAlloced = HI_FALSE;
#define MMZLEN  (47*1024 + 188*16)

HI_SIZE_T cmd_num = 0;
HI_UNF_CERT_COMMAND cmds[16];
HI_UNF_CERT_KEY_DATA_S ctl_data;

HI_S32 AllocMMZ(const char* mmz_name,HI_MMZ_BUF_S* pMMZ)
{
    HI_S32 ret;

    memset(pMMZ, 0, sizeof(HI_MMZ_BUF_S));
    strcpy(pMMZ->bufname,mmz_name);
    pMMZ->bufsize = MMZLEN;
    pMMZ->overflow_threshold = 100;
    pMMZ->underflow_threshold = 0;
    ret = HI_MMZ_Malloc(pMMZ);
    if (HI_SUCCESS != ret)
    {
        printf("HI_MMZ_Malloc failed:%x\n",ret);
        return HI_FAILURE;
    }
    memset(pMMZ->user_viraddr, 0,pMMZ->bufsize);

    return ret;

}


HI_S32 AllocAllMMZ(HI_VOID)
{
    HI_S32 ret;
    if (bMMZAlloced)
    {
        memset(PlainBuf1.user_viraddr, 0, PlainBuf1.bufsize);
        memset(EncrytedBuf1.user_viraddr, 0, EncrytedBuf1.bufsize);
        return HI_SUCCESS;
    }

    ret = AllocMMZ("PlainBuf1",&PlainBuf1);
    ret |= AllocMMZ("EncrytedBuf1",&EncrytedBuf1);
    if (HI_SUCCESS != ret)
    {
        printf("HI_MMZ_Malloc failed:%x\n",ret);
        return HI_FAILURE;
    }

    bMMZAlloced = HI_TRUE;
    return ret;
}
HI_S32 FreeAllMMZ(HI_VOID)
{
    if (!bMMZAlloced)
    {
       return HI_SUCCESS;
    }

    if (PlainBuf1.bufsize != 0)
    {
        (HI_VOID)HI_MMZ_Free(&PlainBuf1);
    }

    if (EncrytedBuf1.bufsize != 0)
    {
        (HI_VOID)HI_MMZ_Free(&EncrytedBuf1);
    }

    bMMZAlloced = HI_FALSE;
    return HI_SUCCESS;
}

static HI_VOID printBuffer(HI_CHAR *string, HI_U8 *pu8Input, HI_U32 u32Length)
{
    HI_U32 i = 0;

    if ( NULL != string )
    {
        printf("%s\n", string);
    }

    for ( i = 0 ; i < u32Length; i++ )
    {
        if( (i % 16 == 0) && (i != 0)) printf("\n");
        printf("0x%02x ,", pu8Input[i]);
    }
    printf("\n");

    return;
}

static HI_S32 get_cert_cmd_num()
{
    HI_CHAR *value = HI_NULL;

    value = get_config_var("CMDNUM");
    if (HI_NULL == value)
    {
        return -1;
    }

    if (0 == strncmp(value, "0", sizeof ("0")))
    {
        cmd_num = 0;
        printf("Number of commands is valid\n");
        return -1;
    }

    if (0 == strncmp(value, "1", sizeof ("1")))
    {
        cmd_num = 1;
        printf("Number of commands is 1\n");
        return 0;
    }

    if (0 == strncmp(value, "2", sizeof ("2")))
    {
        cmd_num = 2;
        printf("Number of commands is 2\n");
        return 0;
    }

    cmd_num = 0;
    printf("not set Number of commands\n");

    return -1;
}

static HI_S32 readConfigFile(HI_CHAR *pFileName)
{
    HI_S32 cnt = 0;
    HI_S32 s32Ret = 0;
    HI_CHAR* var_name = "TIMEOUT1";
    HI_S32 s32ValueNum = 0;

    s32ValueNum = parse_config_file(pFileName);
    if (0 == s32ValueNum || MAX_VAR_NUM < s32ValueNum)
    {
        return HI_FAILURE;
    }

    s32Ret = get_cert_cmd_num();
    if (s32Ret != 0)
    {
        printf("read number of commands failed\n");
        return HI_FAILURE;
    }

    for (cnt = 0;cnt < (HI_S32)cmd_num ; cnt++)
    {
        if(0 == cnt)
        {
            s32Ret = get_key_value("INPUTDATA1", cmds[cnt].u8InputData, 32);
            printBuffer("INPUTDATA1: ", cmds[cnt].u8InputData, 32);
            s32Ret |= get_key_value("OUTPUTDATA1", cmds[cnt].u8OutputData, 32);
            printBuffer("OUTPUTDATA1: ", cmds[cnt].u8OutputData, 32);
            s32Ret |= get_key_value("STATUS1", cmds[cnt].u8Status, 4);
            printBuffer("STATUS1: ", cmds[cnt].u8Status, 4);
            s32Ret |= get_key_value("OPCODES1", cmds[cnt].u8Opcodes, 4);
            printBuffer("OPCODES1: ", cmds[cnt].u8Opcodes, 4);
            strncpy(var_name, "TIMEOUT1", sizeof("TIMEOUT1"));
            get_cert_timeout(var_name, &cmds[cnt].enTimeout);
        }
        else if(1 == cnt)
        {
            s32Ret = get_key_value("INPUTDATA2", cmds[cnt].u8InputData, 32);
            printBuffer("INPUTDATA2: ", cmds[cnt].u8InputData, 32);
            s32Ret |= get_key_value("OUTPUTDATA2", cmds[cnt].u8OutputData, 32);
            printBuffer("OUTPUTDATA2: ", cmds[cnt].u8OutputData, 32);
            s32Ret |= get_key_value("STATUS2", cmds[cnt].u8Status, 4);
            printBuffer("STATUS2: ", cmds[cnt].u8Status, 4);
            s32Ret |= get_key_value("OPCODES2", cmds[cnt].u8Opcodes, 4);
            printBuffer("OPCODES2: ", cmds[cnt].u8Opcodes, 4);
            strncpy(var_name, "TIMEOUT1", sizeof("TIMEOUT2"));
            get_cert_timeout(var_name, &cmds[cnt].enTimeout);
        }

    }

    s32Ret |= get_cert_oddeven_type(&ctl_data.bIsEven);

    s32Ret |= get_cert_target_engine(&ctl_data.enEngine);

    s32Ret |= get_cert_key_port_sel(&ctl_data.enPortSel);

    if (s32Ret != 0)
    {
        printf("read config file failed\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_VOID show_usage(HI_VOID)
{
    printf(" usage: sample_plcipher_akl_dec configfile file_to_encrypt file_encrypted pid1 pid2 pid3 pid4 pid5 \n");
    printf(" examples: \n");
    printf("   sample_plcipher_akl_dec cw_key_config_akl.ini plain.ts encrypted.ts 0x20 0x21\n");
}

HI_S32 main(HI_S32 argc, HI_CHAR *argv[])
{
    HI_S32   Ret = HI_FAILURE;
    HI_S32   index = 0;
    HI_U32   TmpPid = 0;
    HI_U32   PidNum = 0;
    HI_S32   ReadLen = 0;

    FILE     *pEncOutTsFile = HI_NULL;
    FILE     *pEncInTsFile = HI_NULL;

    //HI_UNF_PLCIPHER_KEY_EVENODD_E enOddEven;
    HI_UNF_PLCIPHER_ATTR_S stAttr;

    HI_UNF_CERT_RES_HANDLE *p_handle = NULL;

    HI_SIZE_T num_of_processed = 0;

    if (argc < FIX_ARGNUM || argc > MAX_ARGNUM)
    {
        show_usage();
        return 0;
    }
    printf("argc = %d\n",argc);

    /* get the pid num */
    PidNum = argc - FIX_ARGNUM;

    Ret = readConfigFile(argv[1]);
    if (HI_SUCCESS != Ret)
    {
        printf("readConfigFile failed\n");
        return 0;
    }

    pEncInTsFile = fopen(argv[2], "rb");
    pEncOutTsFile = fopen(argv[3], "wb");
    if (HI_NULL == pEncInTsFile || HI_NULL == pEncOutTsFile)
    {
        printf("Open original or new file failed\n");
        return 0;
    }

    AllocAllMMZ();

    Ret = HI_UNF_CERT_Init();
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_CERT_Init failed, Ret[0x%x]\n", Ret);
        goto out0;
    }

    Ret = HI_UNF_PLCIPHER_Init();
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_PLCIPHER_Init failed, Ret[0x%x]\n", Ret);
        goto out1;
    }

    Ret = HI_UNF_PLCIPHER_Create(&ctl_data.hHandle);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_PLCIPHER_Create failed, Ret[0x%x]\n", Ret);
        goto out2;
    }

    Ret = HI_UNF_PLCIPHER_GetAttr(ctl_data.hHandle, &stAttr);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_PLCIPHER_GetAttr failed, Ret[0x%x]\n", Ret);
        goto out3;
    }

    stAttr.enAlg = HI_UNF_PLCIPHER_ALG_AES_CBC;

    if (PidNum > 0)
    {
        stAttr.bPIDFilterEn = HI_TRUE;
        stAttr.u32PidNum = PidNum;
        memset(stAttr.u16PID, 0xff, HI_UNF_PLCIPHER_PIDFILTER_NUM*2);

        for (index = 0; index < PidNum; index++)
        {
            if (strstr(argv[FIX_ARGNUM+index], "0x") || strstr(argv[FIX_ARGNUM+index], "0X"))
            {
                TmpPid = strtoul(argv[FIX_ARGNUM+index], NULL ,16);
            }
            else
            {
                TmpPid = strtoul(argv[FIX_ARGNUM+index], NULL, 10);
            }
            stAttr.u16PID[index] = TmpPid;
        }
    }
    else
    {
        stAttr.bPIDFilterEn = HI_FALSE;
    }

    Ret = HI_UNF_PLCIPHER_SetAttr(ctl_data.hHandle, &stAttr);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_PLCIPHER_SetAttr failed, Ret[0x%x]\n", Ret);
        goto out3;
    }

    Ret = HI_UNF_CERT_Lock(&p_handle);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_CERT_Lock failed, Ret[0x%x]\n", Ret);
        goto out3;
    }

    Ret = HI_UNF_CERT_Exchange(p_handle, cmd_num, cmds, &num_of_processed);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_CERT_Exchange failed, Ret[0x%x]\n", Ret);
        goto out3;
    }

    Ret |= HI_UNF_CERT_UseKey(&ctl_data);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_CERT_UseKey failed, Ret[0x%x]\n", Ret);
        goto out3;
    }

    Ret |= HI_UNF_CERT_Unlock(p_handle);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_CERT_Unlock failed, Ret[0x%x]\n", Ret);
        goto out3;
    }

    /* decrypt the clear TS stream */
    while((ReadLen=fread(EncrytedBuf1.user_viraddr, 1, MAXBB, pEncInTsFile)) != 0)
    {
        if ((ReadLen % MINBB) != 0)
        {
            printf("ReadLen[0x%x] must be 188 or 188*16 aligned, may reach the end of file\n", ReadLen);
            break;
        }

        Ret = HI_UNF_PLCIPHER_Decrypt(ctl_data.hHandle, (HI_VOID *)((HI_ULONG)(EncrytedBuf1.phyaddr)), (HI_VOID *)((HI_ULONG)PlainBuf1.phyaddr), ReadLen);
        if (HI_SUCCESS != Ret)
        {
            printf("HI_UNF_PLCIPHER_Decrypt failed, Ret[0x%x]\n", Ret);
            break;
        }

        fwrite(PlainBuf1.user_viraddr, 1, ReadLen, pEncOutTsFile);
    }

out3:
    Ret = HI_UNF_PLCIPHER_Destroy(ctl_data.hHandle);
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_PLCIPHER_Destroy failed, Ret[0x%x]\n", Ret);
    }

out2:
    Ret = HI_UNF_PLCIPHER_DeInit();
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_PLCIPHER_DeInit failed, Ret[0x%x]\n", Ret);
    }

out1:
    Ret = HI_UNF_CERT_DeInit();
    if (HI_SUCCESS != Ret)
    {
        printf("HI_UNF_CERT_DeInit failed, Ret[0x%x]\n", Ret);
    }

out0:
    FreeAllMMZ();

    if (HI_NULL != pEncOutTsFile && HI_NULL != pEncInTsFile)
    {
        fclose(pEncOutTsFile);
        pEncOutTsFile = HI_NULL;
        fclose(pEncInTsFile);
        pEncInTsFile = HI_NULL;
    }

    printf("end\n");
    return Ret;
}

