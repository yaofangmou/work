#include "hi_unf_otp.h"
#include "sample_otp_base.h"

HI_S32 main(int argc, char* argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_BOOL lock_flag = HI_FALSE;

#if defined(CHIP_TYPE_hi3716mv430)
    printf("The sample does not support this chip.\n");
    return HI_ERR_OTP_NOT_SUPPORT;
#endif

    ret = HI_UNF_OTP_Init();
    if (HI_SUCCESS != ret)
    {
        printf("OTP init failed, return 0x%x\n", ret);
        return HI_FAILURE;
    }

    ret = HI_UNF_OTP_GetStbRootKeyLockFlag(&lock_flag);
    if (HI_SUCCESS != ret)
    {
        printf("Failed to get stb rootkey lock flag, return 0x%x\n", ret);
        (HI_VOID)HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    printf("Get stb root key lock flag : %d\n", lock_flag);

    (HI_VOID)HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}


