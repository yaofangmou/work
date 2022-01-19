#include "hi_unf_otp.h"
#include "sample_otp_base.h"

HI_S32 main(int argc, char* argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8 stb_ta_rootKey[16] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};

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

    ret = HI_UNF_OTP_SetRootKey(HI_UNF_OTP_STBTA_ROOTKEY, stb_ta_rootKey, 16);
    if (HI_SUCCESS != ret)
    {
        printf("Write STB TA rootKey failed, ret = 0x%x \n", ret);
        (HI_VOID)HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    print_buffer("Set STB TA root key", stb_ta_rootKey, sizeof(stb_ta_rootKey));

    (HI_VOID)HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}




