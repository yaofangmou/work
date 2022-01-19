#include "hi_unf_otp.h"
#include "sample_otp_base.h"

HI_S32 main(int argc, char* argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8 stb_rootKey[16] = {0x12, 0x34, 0x56, 0x78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

#if defined(CHIP_TYPE_hi3716mv430)
    printf("The sample does not support this chip.\n");
    return HI_ERR_OTP_NOT_SUPPORT;
#endif

    ret = HI_UNF_OTP_Init();
    if (HI_SUCCESS != ret)
    {
        printf("OTP init failed, ret = 0x%x \n", ret);
        return HI_FAILURE;
    }

    ret = HI_UNF_OTP_WriteStbRootKey(stb_rootKey, 16);
    if (HI_SUCCESS != ret)
    {
        printf("Write STB rootKey failed, ret = 0x%x \n", ret);
        (HI_VOID)HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    print_buffer("Set STB root key", stb_rootKey, sizeof(stb_rootKey));

    (HI_VOID)HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}




