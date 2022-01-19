#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <fcntl.h>
#include <unistd.h>
#include <assert.h>
#include "hi_unf_otp.h"
#include "hi_type.h"


void showusage()
{
    printf("Usage:\n"
           "To burn to nomal  chipset and lock id word: ./sample_otp_lockidword 0\n"
           "To burn to secure chipset and lock id word: ./sample_otp_lockidword 1\n"
          );
}

HI_S32 main(int argc, char* argv[])
{
    HI_S32 ret = HI_SUCCESS;

    if (argc < 2)
    {
        showusage();
        return HI_SUCCESS;
    }

    ret = HI_UNF_OTP_Init();
    if (HI_SUCCESS != ret)
    {
        printf("OTP init failed, return 0x%x\n", ret);
        return HI_FAILURE;
    }

    if (0 == atoi(argv[1]))
    {
        ret = HI_UNF_OTP_BurnToNormalChipset();
        if (HI_SUCCESS != ret)
        {
            printf("Burn to normal chipset failed, return 0x%x\n", ret);
            (HI_VOID)HI_UNF_OTP_DeInit();
            return HI_FAILURE;
        }
        printf("Burn to normal chipset success\n");
    }
    else if (1 == atoi(argv[1]))
    {
        ret = HI_UNF_OTP_BurnToSecureChipset();
        if (HI_SUCCESS != ret)
        {
            printf("Burn to secure chipset failed, return 0x%x\n", ret);
            (HI_VOID)HI_UNF_OTP_DeInit();
            return HI_FAILURE;
        }
        printf("Burn to secure chipset success\n");
    }
    else
    {
        showusage();
    }
    (HI_VOID)HI_UNF_OTP_DeInit();
    return HI_SUCCESS;
}




