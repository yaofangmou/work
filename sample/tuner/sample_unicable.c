#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>

#include "hi_type.h"
#include "hi_unf_frontend.h"
#include "hi_adp_tuner.h"

//#include "hi_sample_frontend.h"
//#include "frontend_cmdCore.h"

extern HI_S32 ODU_UB_avail(HI_U32 u32TunerId, HI_U32 *pu32TotalUbNum, HI_U32 *pu32BitMap);
extern HI_S32 ODU_UB_pin(HI_U32 u32TunerId, HI_U32 *pu32TotalUbNum, HI_U32 *pu32BitMap);
extern HI_S32 ODU_UB_inuse(HI_U32 u32TunerId, HI_U32 *pu32InuseNum, HI_U32 *pu32BitMap);
extern HI_S32 ODU_UB_freq(HI_U32 u32TunerId, HI_U32 u32UbId, HI_U32 *pu32Freq);
extern HI_S32 ODU_UB_switches(HI_U32 u32TunerId, HI_U32 u32UbId, HI_U8 *pu8Switches);

extern HI_S32 ODU_Channel_change(HI_U32 u32TunerId, HI_U32 u32Frequency, HI_UNF_TUNER_FE_POLARIZATION_E enPolar);
extern HI_S32 ODU_PowerOff(HI_U32 u32TunerId, HI_U32 u32UbId);
extern HI_S32 ODU_SwitchOnToneCenter(HI_U32 u32TunerId, HI_U32 u32UbId);
extern HI_S32 ODU_SwitchOnTone20MHz(HI_U32 u32TunerId, HI_U32 u32UbId);
extern HI_S32 ODU_SwitchOnAllTones(HI_U32 u32TunerId,HI_U8 u8Switch);
extern HI_S32 ODU_SwitchOffAllTones(HI_U32 u32TunerId, HI_U8 u8UBId);

extern HI_S32 ODU_Channel_change_PIN(HI_U32 u32TunerId, HI_U32 u32Frequency, HI_UNF_TUNER_FE_POLARIZATION_E enPolar, HI_U8 u8PIN);
extern HI_S32 ODU_PowerOff_PIN(HI_U32 u32TunerId, HI_U32 u32UbId, HI_U8 u8PIN);
extern HI_S32 ODU_SwitchOnToneCenter_PIN(HI_U32 u32TunerId, HI_U32 u32UbId, HI_U8 u8PIN);
extern HI_S32 ODU_SwitchOnTone20MHz_PIN(HI_U32 u32TunerId, HI_U32 u32UbId, HI_U8 u8PIN);
extern HI_S32 ODU_SwitchOnAllTones_PIN(HI_U32 u32TunerId);
extern HI_S32 ODU_SwitchOffAllTones_PIN(HI_U32 u32TunerId);


extern HI_S32 UNIC_SCRxSignal_ON(HI_U32 u32TunerId);
extern HI_S32 UNIC_PowerOFF(HI_U32 u32TunerId,HI_U8 u8SCRNO);

#define MAX_UB_NUM (32)
#define MAX_CMD_BUFFER_LEN 256

static HI_U32 s_u32UbNum = 0;
static HI_S32 s_au8PinCode[MAX_UB_NUM] = {-1};
static HI_U32 s_au32Freq[MAX_UB_NUM] = {0};

static HI_U32 g_au32KnownUBFreq[MAX_UB_NUM] = {1210, 1420, 1680, 2040,    984, 1020, 1056, 1092,
                                               1128, 1164, 1256, 1292,   1328, 1364, 1458, 1494,
                                               1530, 1566, 1602, 1638,   1716, 1752, 1788, 1824,
                                               1860, 1896, 1932, 1968,   2004, 2076, 2112, 2148};


static HI_S32 get_all_ub_freq(HI_U32 u32TunerId)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_S32 i = 0;
    HI_U32 u32UbNum = 0;
    HI_U32 u32BitMap = 0;
    HI_U32 u32UbFreq;


    if (s_u32UbNum == 0)
    {
        s32Ret = ODU_UB_avail(u32TunerId, &u32UbNum, &u32BitMap);
        if (HI_SUCCESS != s32Ret)
        {
            printf("ODU_UB_avail error!\n");
            return HI_FAILURE;
        }
        s_u32UbNum = u32UbNum;
    }
    printf("Total %d UB.\n", s_u32UbNum);

    for (i = 0; i < s_u32UbNum; i++)
    {
        s32Ret = ODU_UB_freq(u32TunerId, i, &u32UbFreq);
        if (HI_SUCCESS != s32Ret)
        {
            printf("ODU_UB_freq %d error!\n", i);
            continue;
        }
        printf("%2d: %dMHz\n", i, u32UbFreq);
        s_au32Freq[i] = u32UbFreq;
    }

    return HI_SUCCESS;
}

HI_S32 get_all_ub_switches(HI_U32 u32TunerId)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_S32 i = 0;
    HI_U32 u32UbNum = 0;
    HI_U32 u32BitMap = 0;
    HI_U8 u8Switches;


    if (s_u32UbNum == 0)
    {
        s32Ret = ODU_UB_avail(u32TunerId, &u32UbNum, &u32BitMap);
        if (HI_SUCCESS != s32Ret)
        {
            printf("ODU_UB_avail error!\n");
            return HI_FAILURE;
        }
        s_u32UbNum = u32UbNum;
    }
    printf("Total %d UB.\n", s_u32UbNum);

    for (i = 0; i < s_u32UbNum; i++)
    {
        s32Ret = ODU_UB_switches(u32TunerId, i, &u8Switches);
        if (HI_SUCCESS != s32Ret)
        {
            printf("ODU_UB_switches error!\n");
            continue;
        }
        printf("%2d: 0x%x\n", i, u8Switches);
    }

    return HI_SUCCESS;
}

static HI_S32 get_ub_pin(HI_U32 u32TunerId, HI_U32 u32UbId, HI_U8 *pu8Pin)
{
    HI_S32 s32Ret = HI_FAILURE;
    //HI_U32 u32UbNum = 0;
    //HI_U32 u32BitMap = 0;
    HI_U32 u32TmpUbNum = 0;
    HI_U32 u32TmpBitMap = 0;
    HI_U32 u32UbFreq = 0;
    HI_U32 i = 0;
    HI_UNF_TUNER_FE_LNB_CONFIG_S stLNBConfig;


    //Set LNB config
    if (s_au32Freq[u32UbId] == 0)
    {
        s32Ret = ODU_UB_freq(u32TunerId, u32UbId, &u32UbFreq);
        if (HI_SUCCESS != s32Ret)
        {
            printf("ODU_UB_freq error!\n");
            return HI_FAILURE;
        }
        s_au32Freq[u32UbId] = u32UbFreq;
    }

    stLNBConfig.enLNBType = HI_UNF_TUNER_FE_LNB_UNICABLE2;
    stLNBConfig.u32LowLO = 9750;
    stLNBConfig.u32HighLO = 10600;
    stLNBConfig.enLNBBand = HI_UNF_TUNER_FE_LNB_BAND_KU;
    stLNBConfig.u8UNIC_SCRNO = u32UbId;
    stLNBConfig.u32UNICIFFreqMHz = s_au32Freq[u32UbId];
    stLNBConfig.enSatPosn = HI_UNF_TUNER_SATPOSN_A;
    stLNBConfig.bPinProtect = HI_TRUE;

    s32Ret = HI_UNF_TUNER_SetLNBConfig(u32TunerId, &stLNBConfig);
    if (HI_SUCCESS != s32Ret)
    {
        printf("HI_UNF_TUNER_SetLNBConfig error!\n");
        return HI_FAILURE;
    }

    //Get the UB's status
//    s32Ret = ODU_UB_pin(u32TunerId, &u32UbNum, &u32BitMap);
//    if (HI_SUCCESS != s32Ret)
//    {
//        printf("ODU_UB_pin error!\n");
//        return HI_FAILURE;
//    }
//
//    if (u32BitMap & (1 << u32UbId)) //already in used.
//    {
//        for (i = 0; i < 256; i++)
//        {
//            s32Ret = ODU_PowerOff_PIN(u32TunerId, u32UbId, i);
//            if (HI_SUCCESS != s32Ret)
//            {
//                printf("ODU_PowerOff_PIN error!\n");
//                break;
//            }
//
//            s32Ret = ODU_UB_pin(u32TunerId, &u32TmpUbNum, &u32TmpBitMap);
//            if (HI_SUCCESS != s32Ret)
//            {
//                printf("ODU_UB_pin error!\n");
//                break;
//            }
//            if ((u32TmpBitMap & (1 << u32UbId)) == 0)
//            {
//                *pu8Pin = i;
//                return HI_SUCCESS;
//            }
//        }
//    }
//    else          //not in used.
    {
        for (i = 0; i < 256; i++)
        {
            s32Ret = ODU_Channel_change_PIN(u32TunerId, 12345, HI_UNF_TUNER_FE_POLARIZATION_H, i);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_Channel_change_PIN error!\n");
                break;
            }

            s32Ret = ODU_UB_pin(u32TunerId, &u32TmpUbNum, &u32TmpBitMap);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_UB_pin error!\n");
                break;
            }
            if (u32TmpBitMap & (1 << u32UbId))
            {
                *pu8Pin = i;
                return HI_SUCCESS;
            }
        }
    }

    return HI_FAILURE;
}


//每个UB都有1个PIN码，这里用遍历的方法来查找。遍历完需要花费20min左右的时间!!
//标准中有查找pin码的方法，现在还不知道算法。
HI_S32 get_all_ub_pin(HI_U32 u32TunerId)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32UbNum = 0;
    HI_U32 u32BitMap = 0;
    HI_S32 i = 0;
    HI_U8 u8Pin;


    if (s_u32UbNum == 0)
    {
        s32Ret = ODU_UB_avail(u32TunerId, &u32UbNum, &u32BitMap);
        if (HI_SUCCESS != s32Ret)
        {
            printf("ODU_UB_avail error!\n");
            return HI_FAILURE;
        }
        s_u32UbNum = u32UbNum;
    }
    printf("Total %d UB.\n", s_u32UbNum);

    for (i = 0; i < s_u32UbNum; i++)
    {
        s32Ret = get_ub_pin(u32TunerId, i, &u8Pin);
        if (HI_SUCCESS != s32Ret)
        {
            printf("get UB %d pin error!\n", i);
            continue;
        }
        s_au8PinCode[i] = u8Pin;
    }

    return HI_SUCCESS;
}


//7A~7E, send and receive
static void proc_cmd_bilateral(HI_U32 u32TunerId, HI_S32 func)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32UbNum = 0;
    HI_U32 u32BitMap = 0;
    HI_U32 u32UbId = 0;
    HI_U32 u32UbFreq = 0;
    HI_U8 u8Switches = 0;


    switch (func)
    {
        case 1:
        {
            printf("ODU_UB_avail: \n");
            s32Ret = ODU_UB_avail(u32TunerId, &u32UbNum, &u32BitMap);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_UB_avail error!\n");
            }
            else
            {
                printf("Total UB num: %d, BitMap 0x%x.\n", u32UbNum, u32BitMap);
                s_u32UbNum = u32UbNum;
            }
            break;
        }
        case 2:
        {
            printf("ODU_UB_pin: \n");
            s32Ret = ODU_UB_pin(u32TunerId, &u32UbNum, &u32BitMap);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_UB_pin error!\n");
            }
            else
            {
                printf("Total UB num: %d, BitMap 0x%x.\n", u32UbNum, u32BitMap);
            }
            break;
        }
        case 3:
        {
            printf("ODU_UB_inuse: \n");
            s32Ret = ODU_UB_inuse(u32TunerId, &u32UbNum, &u32BitMap);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_UB_inuse error!\n");
            }
            else
            {
                printf("Using UB num: %d -- 0x%x.\n", u32UbNum, u32BitMap);
            }
            break;
        }

        case 4:
        {
            printf("ODU_UB_freq: \nPlease input UB id: ");
            scanf("%d", &u32UbId);
            s32Ret = ODU_UB_freq(u32TunerId, u32UbId, &u32UbFreq);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_UB_freq error!\n");
            }
            else
            {
                printf("UB Center Freq: %d.\n", u32UbFreq);
                s_au32Freq[u32UbId] = u32UbFreq;
            }

            break;
        }
        case 5:
        {
            printf("ODU_UB_switches: \nPlease input UB id:");
            scanf("%d", &u32UbId);
            s32Ret = ODU_UB_switches(u32TunerId, u32UbId, &u8Switches);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_UB_switches error!\n");
            }
            else
            {
                printf("Switches: 0x%x.\n", u8Switches);
            }

            break;
        }
    }
}

static void proc_cmd_single(HI_U32 u32TunerId, HI_S32 func)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_UNF_TUNER_FE_LNB_CONFIG_S stLNBConfig;
    HI_U32 u32UbId = 0,u32Switch,u32UBId;
    HI_U32 u32UbFreq = 0;
    HI_U32 u32TPFreq = 0;
    //HI_U8 u8UBId;


    switch (func)
    {
        case 70:
        {
            printf("ODU_Channel_change.\nPlease input UB Num & downlink Frequency(MHz):");
            scanf("%d %u", &u32UbId, &u32TPFreq);
            if (u32UbId >= MAX_UB_NUM)
            {
                printf("Input UB error: %d.\n", u32UbId);
                break;
            }

#ifdef GLASS_BOARD
            s_au32Freq[u32UbId] = g_au32KnownUBFreq[u32UbId];
#else
            if (s_au32Freq[u32UbId] == 0)
            {
                s32Ret = ODU_UB_freq(u32TunerId, u32UbId, &u32UbFreq);
                if (HI_SUCCESS != s32Ret)
                {
                    printf("ODU_UB_freq error!\n");
                    break;
                }
                s_au32Freq[u32UbId] = u32UbFreq;
            }
#endif
            stLNBConfig.enLNBType = HI_UNF_TUNER_FE_LNB_UNICABLE2;
            stLNBConfig.u32LowLO = 9750;
            stLNBConfig.u32HighLO = 10600;
            stLNBConfig.enLNBBand = HI_UNF_TUNER_FE_LNB_BAND_KU;
            stLNBConfig.u8UNIC_SCRNO = u32UbId;
            stLNBConfig.u32UNICIFFreqMHz = s_au32Freq[u32UbId];
            stLNBConfig.enSatPosn = HI_UNF_TUNER_SATPOSN_A;
            stLNBConfig.bPinProtect = HI_FALSE;

            s32Ret = HI_UNF_TUNER_SetLNBConfig(u32TunerId, &stLNBConfig);
            if (HI_SUCCESS != s32Ret)
            {
                printf("HI_UNF_TUNER_SetLNBConfig error!\n");
                break;
            }

            s32Ret = ODU_Channel_change(u32TunerId, u32TPFreq, HI_UNF_TUNER_FE_POLARIZATION_H);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_Channel_change error!\n");
            }
            else
            {
                printf("ODU_Channel_change succeed!\n");
            }
            break;
        }
        case 700:
        {
            printf("ODU_PowerOff.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = ODU_PowerOff(u32TunerId, u32UbId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_PowerOff error!\n");
            }
            else
            {
                printf("ODU_PowerOff succeed!\n");
            }
            break;
        }
        case 701:
        {
            printf("ODU_SwitchOnToneCenter.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = ODU_SwitchOnToneCenter(u32TunerId, u32UbId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnToneCenter error!\n");
            }
            else
            {
                printf("ODU_SwitchOnToneCenter succeed!\n");
            }
            break;
        }
        case 702:
        {
            printf("ODU_SwitchOnTone20MHz.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = ODU_SwitchOnTone20MHz(u32TunerId, u32UbId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnTone20MHz error!\n");
            }
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnTone20MHz succeed!\n");
            }
            break;
        }
        case 703:
        {
            printf("Switch On AllTones.\nPlease input switch information:");
            scanf("%x", &u32Switch);
            s32Ret = ODU_SwitchOnAllTones(u32TunerId, u32Switch);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnAllTones error!\n");
            }
            else
            {
                printf("ODU_SwitchOnAllTones succeed!\n");
            }
            break;
        }
        case 704:
        {
            printf("Switch Off All Tones.\nPlease input UB ID:");
            scanf("%d", &u32UBId);
            s32Ret = ODU_SwitchOffAllTones(u32TunerId, u32UBId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOffAllTones error!\n");
            }
            else
            {
                printf("ODU_SwitchOffAllTones succeed!\n");
            }

            break;
        }
    }
}

static void proc_cmd_single_pin(HI_U32 u32TunerId, HI_S32 func)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_UNF_TUNER_FE_LNB_CONFIG_S stLNBConfig;
    HI_U32 u32UbId = 0;
    //HI_U32 u32UbFreq = 0;
    HI_U32 u32TPFreq = 0;


    switch (func)
    {
        case 71:
        {
            printf("ODU_Channel_change_PIN.\nPlease input UB Number & downlink Frequency(MHz): ");
            scanf("%d %u", &u32UbId, &u32TPFreq);

#if 1
            s_au32Freq[u32UbId] = g_au32KnownUBFreq[u32UbId];
#else
            if (s_au32Freq[u32UbId] == 0)
            {
                s32Ret = ODU_UB_freq(u32TunerId, u32UbId, &u32UbFreq);
                if (HI_SUCCESS != s32Ret)
                {
                    printf("ODU_UB_freq error!\n");
                    break;
                }
                s_au32Freq[u32UbId] = u32UbFreq;
            }
#endif

            stLNBConfig.enLNBType = HI_UNF_TUNER_FE_LNB_UNICABLE2;
            stLNBConfig.u32LowLO = 9750;
            stLNBConfig.u32HighLO = 10600;
            stLNBConfig.enLNBBand = HI_UNF_TUNER_FE_LNB_BAND_KU;
            stLNBConfig.u8UNIC_SCRNO = u32UbId;
            stLNBConfig.u32UNICIFFreqMHz = s_au32Freq[u32UbId];
            stLNBConfig.enSatPosn = HI_UNF_TUNER_SATPOSN_A;
            stLNBConfig.bPinProtect = HI_TRUE;
            s32Ret = HI_UNF_TUNER_SetLNBConfig(u32TunerId, &stLNBConfig);
            if (HI_SUCCESS != s32Ret)
            {
                printf("HI_UNF_TUNER_SetLNBConfig error!\n");
                break;
            }

            s32Ret = ODU_Channel_change_PIN(u32TunerId, u32TPFreq, HI_UNF_TUNER_FE_POLARIZATION_H, s_au8PinCode[u32UbId]);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_Channel_change_PIN error!\n");
            }
            else
            {
                printf("ODU_Channel_change_PIN succeed!\n");
            }

            break;
        }
        case 710:
        {
            printf("ODU_PowerOff_PIN.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = ODU_PowerOff_PIN(u32TunerId, u32UbId, s_au8PinCode[u32UbId]);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_PowerOff_PIN error!\n");
            }
            else
            {
                printf("ODU_PowerOff_PIN succeed!\n");
            }
            break;
        }
        case 711:
        {
            printf("ODU_SwitchOnToneCenter_PIN.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = ODU_SwitchOnToneCenter_PIN(u32TunerId, u32UbId, s_au8PinCode[u32UbId]);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnToneCenter_PIN error!\n");
            }
            else
            {
                printf("ODU_SwitchOnToneCenter_PIN succeed!\n");
            }
            break;
        }
        case 712:
        {
            printf("ODU_SwitchOnTone20MHz_PIN.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = ODU_SwitchOnTone20MHz_PIN(u32TunerId, u32UbId, s_au8PinCode[u32UbId]);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnTone20MHz_PIN error!\n");
            }
            else
            {
                printf("ODU_SwitchOnTone20MHz_PIN succeed!\n");
            }
            break;
        }
        case 713:
        {
            printf("Switch On All Tones with PIN.\n");
            s32Ret = ODU_SwitchOnAllTones_PIN(u32TunerId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOnAllTones_PIN error!\n");
            }
            else
            {
                printf("ODU_SwitchOnAllTones_PIN succeed!\n");
            }
            break;
        }
        case 714:
        {
            printf("Switch Off All Tones with PIN.\n");
            s32Ret = ODU_SwitchOffAllTones_PIN(u32TunerId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("ODU_SwitchOffAllTones_PIN error!\n");
            }
            else
            {
                printf("ODU_SwitchOffAllTones_PIN succeed!\n");
            }
            break;
        }
    }
}

static void set_lnbout_level(HI_U32 u32TunerId, HI_U32 u32Level)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_UNF_TUNER_FE_LNB_POWER_E enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_ON;

    if (u32Level == 0)
    {
        printf("Output 0V.\n");
        enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_OFF;
    }
    else if (u32Level == 13)
    {
        printf("Output 13V.\n");
        enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_ON;
    }
    else if (u32Level == 18)
    {
        printf("Output 18V.\n");
        enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_ON;
    }
    else if (u32Level == 14)
    {
        printf("Output 14V.\n");
        enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_ENHANCED;
    }
    else if (u32Level == 19)
    {
        printf("Output 19V.\n");
        enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_ENHANCED;
    }
    else
    {
        printf("Input error: %d.\n", u32Level);
        enLNBPower = HI_UNF_TUNER_FE_LNB_POWER_OFF;
        return;
    }
    s32Ret = HI_UNF_TUNER_SetLNBPower(u32TunerId,  enLNBPower);
    if (HI_SUCCESS != s32Ret)
    {
        printf("Set LNB Power error!\n");
    }

    return;
}

void show_help(void)
{
    printf("\033[1;31;40m" "[UNICABLE II COMMANDs]" "\033[0m\n"
           "(Please input the " "\033[1;32;40m" "NUMBER" "\033[0m" " before the command when you want to use it.\n"
           "Command 1~5 will make SCIF replies, and the others won't.)\n"
           "  1: ODU_UB_avail\n"
           "  2: ODU_UB_pin\n"
           "  3: ODU_UB_inuse\n"
           "  4: ODU_UB_freq\n"
           "  5: ODU_UB_switches\n\n"

           " 70: ODU_Channel_change\n"
           "700: ODU_PowerOff\n"
           "701: ODU_SwitchOnToneCenter\n"
           "702: ODU_SwitchOnTone20MHz\n"
           "703: ODU_SwitchOnAllTones\n"
           "704: ODU_SwitchOffAllTones\n\n"

           " 71: ODU_Channel_change_PIN\n"
           "710: ODU_PowerOff_PIN\n"
           "711: ODU_SwitchOnToneCenter_PIN\n"
           "712: ODU_SwitchOnTone20MHz_PIN\n"
           "713: ODU_SwitchOnAllTones_PIN\n"
           "714: ODU_SwitchOffAllTones_PIN\n\n");

    printf("\033[1;31;40m" "[UNICABLE I COMMANDs]" "\033[0m\n"
           " 10: UNIC_SCRxSignal_ON\n"
           " 11: UNIC_PowerOFF\n\n");

    printf("\033[1;31;40m" "[Other COMMANDs]" "\033[0m\n"
           "  20: Set LNBOUT Level\n"
           "  21: Get all UB center frequency\n"
           "  22: Get all UB switches info\n"
           "  23: Get UB's PIN_code\n"
           "  24: Get All UB's PIN_code\n"
           "exit: exit this program.\n"
           "help: show this help info.\n\n");
}

void proc_cmd(HI_S32 func)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32TunerId = 0;
    //HI_U32 u32UbNum = 0;
    //HI_U32 u32BitMap = 0;
    HI_U32 u32UbId = 0;
    //HI_U32 u32UbFreq = 0;
    //HI_U32 u32TPFreq = 0;
    //HI_U8 u8Switches = 0;
    HI_U8 u8Pin;
    HI_U32 u32Level = 0;
    HI_S32 i = 0;


    switch (func)
    {
        //**************** UNICABLE 2 ******************
        case 1:     //7A
        case 2:     //7B
        case 3:     //7C
        case 4:     //7D
        case 5:     //7E
            proc_cmd_bilateral(u32TunerId, func);
            break;

        case 70:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
            proc_cmd_single(u32TunerId, func);
            break;

        case 71:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
            proc_cmd_single_pin(u32TunerId, func);
            break;
        //**************** UNICABLE 1 ******************
        case 10:
        {
            printf("UNIC_SCRxSignal_ON.\n");
            s32Ret = UNIC_SCRxSignal_ON(u32TunerId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("UNIC_SCRxSignal_ON error!\n");
            }
            else
            {
                printf("UNIC_SCRxSignal_ON succeed!\n");
            }
            break;
        }
        case 11:
        {
            printf("UNIC_PowerOFF.\nPlease input UB id: ");
            scanf("%u", &u32UbId);
            s32Ret = UNIC_PowerOFF(u32TunerId, u32UbId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("UNIC_PowerOFF error!\n");
            }
            else
            {
                printf("UNIC_PowerOFF succeed!\n");
            }
            break;
        }

        //**************** Others ******************
        case 20:
        {
            printf("Set LnbOut Level.\nPlease input LNB Level(0, 13, 14, 18, 19): ");
            scanf("%d", &u32Level);
            set_lnbout_level(u32TunerId, u32Level);
            break;
        }
        case 21:
        {
            printf("Get all UB center freq:\n");
            s32Ret = get_all_ub_freq(u32TunerId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("Get all UB center freq failed!\n");
            }

            break;
        }
        case 22:
        {
            printf("Get all UB switches info:\n");
            s32Ret = get_all_ub_switches(u32TunerId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("Get all UB switches info failed!\n");
            }

            break;
        }
        case 23:
        {
            printf("Get UB's PIN_code.\nPlease input UB id: ");
            scanf("%u", &u32UbId);

            s32Ret = get_ub_pin(u32TunerId, u32UbId, &u8Pin);
            if (HI_SUCCESS != s32Ret)
            {
                printf("PIN: Unkown.\n");
            }
            else
            {
                printf("PIN: %d.\n", u8Pin);
            }
            break;
        }
        case 24:
        {
            printf("Get All UB's PIN_Code.\n");

            s32Ret = get_all_ub_pin(u32TunerId);
            if (HI_SUCCESS != s32Ret)
            {
                printf("Get All UB's PIN_code failed.\n");
                break;
            }

            for (i = 0; i < s_u32UbNum; i++)
            {
                printf("%5d", s_au8PinCode[i]);
                if ((i + 1) % 8 == 0)
                {
                    printf("\n");
                }
            }

            break;
        }

        //********************* END *********************
        default:
            break;
    }
}

HI_VOID set_pin_mux(void)
{
    HI_U32 u32RegValue;

    //hv_sel config gpio
    HI_SYS_ReadRegister(0xF8A2149C, &u32RegValue);
    u32RegValue &= ~(0x7<<0);
    HI_SYS_WriteRegister(0xF8A2149C, u32RegValue);

    //dgate config gpio
    HI_SYS_ReadRegister(0xF8A214A0, &u32RegValue);
    u32RegValue &= ~(0x7<<0);
    HI_SYS_WriteRegister(0xF8A214A0, u32RegValue);
#if 0
    HI_U32 *pu32MUXAddr = NULL;

    HI_UNUSED(pu32MUXAddr);

#if defined (CHIP_TYPE_hi3796mv200)
    printf("96mv200\n");
    pu32MUXAddr = (HI_U32 *)HI_MEM_Map(0xf8a21000, 0x1000);
    if (NULL == pu32MUXAddr)
    {
        return;
    }

    if(HI_DEMOD_TYPE == HI_UNF_DEMOD_DEV_TYPE_HIFBCV200)
    {
        *(pu32MUXAddr + 0xE0/4) &= ~(0x7<<0);         //I2C1_SDA
        *(pu32MUXAddr + 0xE0/4) |= 3;
        *(pu32MUXAddr + 0xE4/4) &= ~(0x7<<0);         //I2C1_SCL
        *(pu32MUXAddr + 0xE4/4) |= 3;
    }

    if(HI_DEMOD_TS_MODE == HI_UNF_TUNER_OUTPUT_MODE_FULLBAND_SERIAL_2WIRE)
    {
        //H24 I2C2_SCL IOSHARE69
        *(pu32MUXAddr + 0x114/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x114/4) |= 3;

        //H26 I2C2_SDA IOSHARE68
        *(pu32MUXAddr + 0x110/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x110/4) |= 3;

        //J24 GPIO9-0  IOSHARE61
        *(pu32MUXAddr + 0x0F4/4) &= ~(0x7<<0);

        //G24 TSI0_D0  IOSHARE67
        *(pu32MUXAddr + 0x10C/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x10C/4) |= 1;

        //G25 TSI0_CLK IOSHARE66
        *(pu32MUXAddr + 0x108/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x108/4) |= 2;

        //H23 TSI1_D0  IOSHARE65
        *(pu32MUXAddr + 0x104/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x104/4) |= 1;

        //H25 TSI1_CLK IOSHARE64
        *(pu32MUXAddr + 0x100/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x100/4) |= 2;

        //J25 TSI2_CLK IOSHARE63
        *(pu32MUXAddr + 0x0FC/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0FC/4) |= 1;

        //J26 TSI2_D0  IOSHARE62
        *(pu32MUXAddr + 0x0F8/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0F8/4) |= 1;

        //K25 TSI3_D0  IOSHARE60
        *(pu32MUXAddr + 0x0F0/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0F0/4) |= 1;

        //K24 TSI3_CLK IOSHARE59
        *(pu32MUXAddr + 0x0EC/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0EC/4) |= 2;

        //GPIO
        pu32MUXAddr = (HI_U32 *)HI_MEM_Map(0xf8b29000, 0x1000);
        if (NULL == pu32MUXAddr)
        {
            return;
        }
        ////direction = output
        *(pu32MUXAddr + 0x400/4) |= 1;
        ////level = high
        *(pu32MUXAddr + 0x3FC/4) |= 1;
    }
    else if(HI_DEMOD_TS_MODE == HI_UNF_TUNER_OUTPUT_MODE_FULLBAND_SERIAL_9WIRE)
    {
        //F23 I2C2_SCL IOSHARE72
        *(pu32MUXAddr + 0x120/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x120/4) |= 1;

        //G23 I2C2_SDA IOSHARE71
        *(pu32MUXAddr + 0x11C/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x11C/4) |= 1;

        //F26 GPIO IOSHARE70
        *(pu32MUXAddr + 0x118/4) &= ~(0x7<<0);

        //G24 TSI0_D0  IOSHARE67
        *(pu32MUXAddr + 0x10C/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x10C/4) |= 1;

        //G25 TSI0_VALID IOSHARE66
        *(pu32MUXAddr + 0x108/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x108/4) |= 1;

        //H23 TSI1_D0  IOSHARE65
        *(pu32MUXAddr + 0x104/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x104/4) |= 1;

        //H25 TSI1_VALID IOSHARE64
        *(pu32MUXAddr + 0x100/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x100/4) |= 1;

        //J25 TSI2_CLK IOSHARE63
        *(pu32MUXAddr + 0x0FC/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0FC/4) |= 1;

        //J26 TSI2_D0  IOSHARE62
        *(pu32MUXAddr + 0x0F8/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0F8/4) |= 1;

        //J24 TSI2_VALID  IOSHARE61
        *(pu32MUXAddr + 0x0F4/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0F4/4) |= 1;

        //K25 TSI3_D0  IOSHARE60
        *(pu32MUXAddr + 0x0F0/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0F0/4) |= 1;

        //K24 TSI3_VALID IOSHARE59
        *(pu32MUXAddr + 0x0EC/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0EC/4) |= 1;
    }
    else if(HI_DEMOD_TS_MODE == HI_UNF_TUNER_OUTPUT_MODE_FULLBAND_SERIAL_2BIT_3WIRE)
    {
       //TSI3 D1
       *(pu32MUXAddr + 0x118/4) &= ~(0x7<<0);
       *(pu32MUXAddr + 0x118/4) |= 6;
       //TSI3 D0
       *(pu32MUXAddr + 0x114/4) &= ~(0x7<<0);
       *(pu32MUXAddr + 0x114/4) |= 6;
       //TSI3 CLK
       *(pu32MUXAddr + 0x110/4) &= ~(0x7<<0);
       *(pu32MUXAddr + 0x110/4) |= 6;
       //TSI3 VALID
       *(pu32MUXAddr + 0x10c/4) &= ~(0x7<<0);
       *(pu32MUXAddr + 0x10c/4) |= 6;
       //TSI3 SYNC
       *(pu32MUXAddr + 0x108/4) &= ~(0x7<<0);
       *(pu32MUXAddr + 0x108/4) |= 6;

        //K25 TSI3_D0  IOSHARE60
        *(pu32MUXAddr + 0x0F0/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0F0/4) |= 0;
        //K24 TSI3_VALID IOSHARE59
        *(pu32MUXAddr + 0x0EC/4) &= ~(0x7<<0);
        *(pu32MUXAddr + 0x0EC/4) |= 0;
    }

#endif
#endif
}

HI_S32 main(HI_S32 argc, char *argv[])
{
    HI_S32 /*s32Ret = HI_FAILURE,*/func = 0;
    //HI_U32 u32tunerId = 0;
    HI_CHAR* pincmd;
    HI_CHAR acRecvBuf[MAX_CMD_BUFFER_LEN] = {0};
    //HI_U8 u8Pin;

    /*sys init*/
    HI_SYS_Init();
    set_pin_mux();

    HIADP_Tuner_Init();

    /*After LNB power on,Inverto switch needs at least 2050ms delay to prepare*/
    usleep(2050*1000);

    /*print help*/
    show_help();

    /* recieve command */
    while (1)
    {
        pincmd = fgets(acRecvBuf, MAX_CMD_BUFFER_LEN, stdin);
        if ((pincmd == 0) || (strlen(pincmd) < 1))
        {
            usleep(10000);
            continue;
        }

        if (strncmp(acRecvBuf, "exit", 4) == 0)
        {
            break;
        }
        else if (strncmp(acRecvBuf, "help", 4) == 0)
        {
            show_help();
        }
        else
        {
            func = atoi(acRecvBuf);
            if (func != 0)
            {
                proc_cmd(func);
            }
        }
    }

    HIADP_Tuner_DeInit();

    return HI_SUCCESS;
}


