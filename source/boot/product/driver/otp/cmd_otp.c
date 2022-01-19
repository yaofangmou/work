/******************************************************************************

Copyright (C), 2005-2014, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : cmd_otp.c
Version       : Initial
Author        : Hisilicon hisecurity group
Created       : 2014-09-19
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef HI_ADVCA_FUNCTION_RELEASE

#ifdef OTP_CMD_TEST
#include "otp_debug.h"
#include "hi_common.h"
#include "command.h"
#include "hi_unf_otp.h"
#include "exports.h"

#undef HI_INFO_OTP
#define HI_INFO_OTP HI_PRINT

HI_S32 OTP_Get_CustomerKey_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_U8 i = 0;
    HI_U8 u32CustomerKey[16];

    HI_UNF_OTP_Init();

    memset(u32CustomerKey,0,sizeof(u32CustomerKey));
    HI_UNF_OTP_GetCustomerKey(u32CustomerKey,16);

    HI_INFO_OTP("customer = \n");
    for(i = 0;i<16;i++)
    {
        HI_INFO_OTP("0x%x ",u32CustomerKey[i]);
    }
    HI_INFO_OTP("\n");
    HI_INFO_OTP("get customerkey success\n");

    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otp_getcustomerkey,2,1,OTP_Get_CustomerKey_test,"otp_getcustomerkey ","");

HI_S32 OTP_Set_StbPrivData_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_U8 i = 0;
    HI_U8 StbPrivData[16] = {0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,0x10};

    HI_UNF_OTP_Init();
    for(i = 0; i < 16; i++)
    {
        HI_UNF_OTP_SetStbPrivData(i, StbPrivData[i]);
    }

    HI_INFO_OTP("Set StbPrivData success\n");

    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otp_setstbprivdata,2,1,OTP_Set_StbPrivData_test,"StbPrivData ","");

HI_S32 OTP_Get_StbPrivData_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_U8 i = 0;
    HI_U8 StbPrivData[16];

    HI_INFO_OTP("StbPrivData:\n");

    HI_UNF_OTP_Init();

    for(i = 0;i<16;i++)
    {
        HI_UNF_OTP_GetStbPrivData(i, &(StbPrivData[i]));
        HI_INFO_OTP("0x%x ",StbPrivData[i]);
    }
    HI_INFO_OTP("\n");
    HI_INFO_OTP("get StbPrivData success\n");

    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otp_getstbprivdata,2,1,OTP_Get_StbPrivData_test,"otp_getstbprivdata ","");

#if ((defined(CHIP_TYPE_hi3716mv410) || defined(CHIP_TYPE_hi3716mv420)) && defined(HI_ADVCA_TYPE_NAGRA)) \
    || defined(CHIP_TYPE_hi3716mv430) || defined(CHIP_TYPE_hi3716mv450) || defined(CHIP_TYPE_hi3796mv200)
#define OTP_READ_LEN 0x400
#else
#define OTP_READ_LEN 0x200
#endif
HI_S32 OTP_ReadAll_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    int i;

    HI_UNF_OTP_Init();

    for (i = 0; i < OTP_READ_LEN; i++)
    {
        if (!(i & 0x3))
            HI_INFO_OTP("\n%04x ", i * 4);

        HI_INFO_OTP("%08x ", HI_UNF_OTP_Read(i * 4));
    }
    HI_INFO_OTP("\n");

    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otpreadall,1,1,OTP_ReadAll_test,"read otp ,for example otpreadall ","");

HI_S32 OTP_WriteAddress_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_U32  addr = 0;
    HI_U32  value = 0;

    HI_UNF_OTP_Init();

    addr = simple_strtoul(argv[1], NULL, 16);
    value = simple_strtoul(argv[2], NULL, 16);

    HI_UNF_OTP_WriteByte(addr, value);

    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otpwrite,3,1,OTP_WriteAddress_test,"write otp ,for example otpwrite adddress value ","");

HI_S32 OTP_BurnToSecureChipset(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_BurnToSecureChipset();
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Burn to secure chipset failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_INFO_OTP("Burn to secure chipset success.\n");
    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otp_burntosecurechipset, 3, 1, OTP_BurnToSecureChipset,"Burn to secure chipset, please be careful !!!","");

HI_S32 OTP_GetTrustZoneStat_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_BOOL pbEnable = HI_FALSE;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_GetTrustZoneStat(&pbEnable);
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Get TEE status failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_INFO_OTP("TEE status: %s.\n",pbEnable?"Enable":"Disable");
    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otp_gettrustzonestat, 3, 1, OTP_GetTrustZoneStat_test,"Get TEE status","");

HI_S32 OTP_SetTrustZone_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_EnableTrustZone();
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Set TEE enable failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_INFO_OTP("Set TEE enable sucesss.\n");
    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(otp_settrustzone, 3, 1, OTP_SetTrustZone_test,"Set TEE enable","");

HI_S32 OTP_GetVendorID_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U32 vendorId = 0;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_GetVendorID(&vendorId);
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Get vendor id failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_INFO_OTP("vendor id: 0x%02x\n", vendorId);

    HI_UNF_OTP_DeInit();

    return HI_SUCCESS;
}
U_BOOT_CMD(OTP_getvendorid, 3, 1, OTP_GetVendorID_test,"Get vendor id","");

HI_S32 OTP_SetStbSn_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8 stb_sn[4] = {0x11, 0x22, 0x33, 0x44};
    HI_U32 loop = 0;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_SetStbSN(stb_sn, 4);
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Set stb sn failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_UNF_OTP_DeInit();

    for(loop = 0; loop < 4; loop++)
    {
        HI_INFO_OTP("set: 0x%02x\n", stb_sn[loop]);
    }

    return HI_SUCCESS;
}
U_BOOT_CMD(OTP_setstbsn, 3, 1, OTP_SetStbSn_test,"Set stb sn","");

HI_S32 OTP_GetStbSn_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8 stb_sn[4] = {0x00};
    HI_U32 len = 4;
    HI_U32 loop = 0;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_GetStbSN(stb_sn, &len);
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Get stb sn failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_UNF_OTP_DeInit();

    for(loop = 0; loop < 4; loop++)
    {
        HI_INFO_OTP("get: 0x%02x\n", stb_sn[loop]);
    }

    return HI_SUCCESS;
}
U_BOOT_CMD(OTP_getstbsn, 3, 1, OTP_GetStbSn_test,"Get stb sn","");

HI_S32 OTP_SetMSID_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8  msid[4] = {0x12, 0x23, 0x34, 0x45};
    HI_U32 loop = 0;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_SetMSID(msid, 4);
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Set MSID failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_UNF_OTP_DeInit();

    for(loop = 0; loop < 4; loop++)
    {
        HI_INFO_OTP("set : 0x%02x\n", msid[loop]);
    }

    return HI_SUCCESS;
}
U_BOOT_CMD(OTP_setmsid, 3, 1, OTP_SetMSID_test,"Set MSID","");

HI_S32 OTP_GetMSID_test(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8 msid[4] = {0x00};
    HI_U32 len = 4;
    HI_U32 loop = 0;

    HI_UNF_OTP_Init();

    ret = HI_UNF_OTP_GetMSID(msid, &len);
    if(HI_SUCCESS != ret)
    {
        HI_INFO_OTP("Get msid failed, ret: 0x%x\n", ret);
        HI_UNF_OTP_DeInit();
        return HI_FAILURE;
    }

    HI_UNF_OTP_DeInit();

    for(loop = 0; loop < 4; loop++)
    {
        HI_INFO_OTP("get: 0x%02x\n", msid[loop]);
    }

    return HI_SUCCESS;
}
U_BOOT_CMD(OTP_getmsid, 3, 1, OTP_GetMSID_test,"Get msid","");

#endif /* #ifdef OTP_CMD_TEST */
#endif /* #ifndef HI_ADVCA_FUNCTION_RELEASE */

