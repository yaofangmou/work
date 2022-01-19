/******************************************************************************
Copyright (C), 2011-2021, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : sample_rsa_sign.c
Version       : Initial Draft
Author        : Hisilicon
Created       : 2012/07/10
Last Modified :
Description   : sample for hash
Function List :
History       :
******************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

#include "hi_type.h"
#include "hi_unf_cipher.h"
#include "hi_common.h"

#define HI_ERR_CIPHER(format, arg...)     HI_PRINT( "\033[0;1;31m" format "\033[0m", ## arg)
#define HI_INFO_CIPHER(format, arg...)    HI_PRINT( "\033[0;1;32m" format "\033[0m", ## arg)
#define TEST_END_PASS()				  	  HI_INFO_CIPHER("****************** %s test PASS !!! ******************\n", __FUNCTION__)
#define TEST_END_FAIL()				  	  HI_ERR_CIPHER("****************** %s test FAIL !!! ******************\n", __FUNCTION__)
#define TEST_RESULT_PRINT()				  { if (ret) TEST_END_FAIL(); else TEST_END_PASS();}

static HI_S32 printBuffer(const HI_CHAR *string, const HI_U8 *pu8Input, HI_U32 u32Length)
{
    HI_U32 i = 0;

    if ( NULL != string )
    {
        printf("%s\n", string);
    }

    for ( i = 0 ; i < u32Length; i++ )
    {
        if( (i % 16 == 0) && (i != 0)) printf("\n");
        printf("0x%02x ", pu8Input[i]);
    }
    printf("\n");

    return HI_SUCCESS;
}

static unsigned char test_data[] = {"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"};
static unsigned char sha256_sum[32] =
{
    0x24, 0x8D, 0x6A, 0x61, 0xD2, 0x06, 0x38, 0xB8, 0xE5, 0xC0, 0x26, 0x93, 0x0C, 0x3E, 0x60, 0x39,
    0xA3, 0x3C, 0xE4, 0x59, 0x64, 0xFF, 0x21, 0x67, 0xF6, 0xEC, 0xED, 0xD4, 0x19, 0xDB, 0x06, 0xC1,
};

static HI_U8 N[]  =
{
    0x82, 0x78, 0xA0, 0xC5, 0x39, 0xE6, 0xF6, 0xA1, 0x5E, 0xD1, 0xC6, 0x8B, 0x9C, 0xF9, 0xC4, 0x3F,
    0xEA, 0x19, 0x16, 0xB0, 0x96, 0x3A, 0xB0, 0x5A, 0x94, 0xED, 0x6A, 0xD3, 0x83, 0xE8, 0xA0, 0xFD,
    0x01, 0x5E, 0x92, 0x2A, 0x7D, 0x0D, 0xF9, 0x72, 0x1E, 0x03, 0x8A, 0x68, 0x8B, 0x4D, 0x57, 0x55,
    0xF5, 0x2F, 0x9A, 0xC9, 0x45, 0xCF, 0x9B, 0xB7, 0xF5, 0x11, 0x94, 0x7A, 0x16, 0x0B, 0xED, 0xD9,
    0xA3, 0xF0, 0x63, 0x8A, 0xEC, 0xD3, 0x21, 0xAB, 0xCF, 0x74, 0xFC, 0x6B, 0xCE, 0x06, 0x4A, 0x51,
    0xC9, 0x7C, 0x7C, 0xA3, 0xC4, 0x10, 0x63, 0x7B, 0x00, 0xEC, 0x2D, 0x02, 0x18, 0xD5, 0xF1, 0x8E,
    0x19, 0x7F, 0xBE, 0xE2, 0x45, 0x5E, 0xD7, 0xA8, 0x95, 0x90, 0x88, 0xB0, 0x73, 0x35, 0x89, 0x66,
    0x1C, 0x23, 0xB9, 0x6E, 0x88, 0xE0, 0x7A, 0x57, 0xB0, 0x55, 0x8B, 0x81, 0x9B, 0x9C, 0x34, 0x9F,
    0x86, 0x0E, 0x15, 0x94, 0x2C, 0x6B, 0x12, 0xC3, 0xB9, 0x56, 0x60, 0x25, 0x59, 0x3E, 0x50, 0x7B,
    0x62, 0x4A, 0xD0, 0xF0, 0xB6, 0xB1, 0x94, 0x83, 0x51, 0x66, 0x6F, 0x60, 0x4D, 0xEF, 0x8F, 0x94,
    0xA6, 0xD1, 0xA2, 0x80, 0x06, 0x24, 0xF2, 0x6E, 0xD2, 0xC7, 0x01, 0x34, 0x8D, 0x2B, 0x6B, 0x03,
    0xF7, 0x05, 0xA3, 0x99, 0xCC, 0xC5, 0x16, 0x75, 0x1A, 0x81, 0xC1, 0x67, 0xA0, 0x88, 0xE6, 0xE9,
    0x00, 0xFA, 0x62, 0xAF, 0x2D, 0xA9, 0xFA, 0xC3, 0x30, 0x34, 0x98, 0x05, 0x4C, 0x1A, 0x81, 0x0C,
    0x52, 0xCE, 0xBA, 0xD6, 0xEB, 0x9C, 0x1E, 0x76, 0x01, 0x41, 0x6C, 0x34, 0xFB, 0xC0, 0x83, 0xC5,
    0x4E, 0xB3, 0xF2, 0x5B, 0x4F, 0x94, 0x08, 0x33, 0x87, 0x5E, 0xF8, 0x39, 0xEF, 0x7F, 0x72, 0x94,
    0xFF, 0xD7, 0x51, 0xE8, 0xA2, 0x5E, 0x26, 0x25, 0x5F, 0xE9, 0xCC, 0x2A, 0x7D, 0xAC, 0x5B, 0x35
};
HI_U8 E[]  =
{
    0x01, 0x00, 0x01
};
HI_U8 D[]  =
{
    0x49, 0x7E, 0x93, 0xE9, 0xA5, 0x7D, 0x42, 0x0E, 0x92, 0xB0, 0x0E, 0x6C, 0x94, 0xC7, 0x69, 0x52,
    0x2B, 0x97, 0x68, 0x5D, 0x9E, 0xB2, 0x7E, 0xA6, 0xF7, 0xDF, 0x69, 0x5E, 0xAE, 0x9E, 0x7B, 0x19,
    0x2A, 0x0D, 0x50, 0xBE, 0xD8, 0x64, 0xE7, 0xCF, 0xED, 0xB2, 0x46, 0xE4, 0x2F, 0x1C, 0x29, 0x07,
    0x45, 0xAF, 0x44, 0x3C, 0xFE, 0xB3, 0x3C, 0xDF, 0x7A, 0x10, 0x26, 0x18, 0x43, 0x95, 0x02, 0xAD,
    0xA7, 0x98, 0x81, 0x2A, 0x3F, 0xCF, 0x8A, 0xD7, 0x12, 0x6C, 0xAE, 0xC8, 0x37, 0x6C, 0xF9, 0xAE,
    0x6A, 0x96, 0x52, 0x4B, 0x99, 0xE5, 0x35, 0x74, 0x93, 0x87, 0x76, 0xAF, 0x08, 0xB8, 0x73, 0x72,
    0x7D, 0x50, 0xA5, 0x81, 0x26, 0x5C, 0x8F, 0x94, 0xEA, 0x73, 0x59, 0x5C, 0x33, 0xF9, 0xC3, 0x65,
    0x1E, 0x92, 0xCD, 0x20, 0xC3, 0xBF, 0xD7, 0x8A, 0xCF, 0xCC, 0xD0, 0x61, 0xF8, 0xFB, 0x1B, 0xF4,
    0xB6, 0x0F, 0xD4, 0xCF, 0x3E, 0x55, 0x48, 0x4C, 0x99, 0x2D, 0x40, 0x44, 0x7C, 0xBA, 0x7B, 0x6F,
    0xDB, 0x5D, 0x71, 0x91, 0x2D, 0x93, 0x80, 0x19, 0xE3, 0x26, 0x5D, 0x59, 0xBE, 0x46, 0x6D, 0x90,
    0x4B, 0xDF, 0x72, 0xCE, 0x6C, 0x69, 0x72, 0x8F, 0x5B, 0xA4, 0x74, 0x50, 0x2A, 0x42, 0x95, 0xB2,
    0x19, 0x04, 0x88, 0xD7, 0xDA, 0xBB, 0x17, 0x23, 0x69, 0xF4, 0x52, 0xEB, 0xC8, 0x55, 0xBE, 0xBC,
    0x2E, 0xA9, 0xD0, 0x57, 0x7D, 0xC6, 0xC8, 0x8B, 0x86, 0x7B, 0x73, 0xCD, 0xE4, 0x32, 0x79, 0xC0,
    0x75, 0x53, 0x53, 0xE7, 0x59, 0x38, 0x0A, 0x8C, 0xEC, 0x06, 0xA9, 0xFC, 0xA5, 0x15, 0x81, 0x61,
    0x3E, 0x44, 0xCD, 0x05, 0xF8, 0x54, 0x04, 0x00, 0x79, 0xB2, 0x0D, 0x69, 0x2A, 0x47, 0x60, 0x1A,
    0x2B, 0x79, 0x3D, 0x4B, 0x50, 0x8A, 0x31, 0x72, 0x48, 0xBB, 0x75, 0x78, 0xD6, 0x35, 0x90, 0xE1,
};
HI_U8 P[]  =
{
    0xC4, 0x29, 0x15, 0xFD, 0xE6, 0xAD, 0x5D, 0x4D, 0xC5, 0xDE, 0x95, 0xB6, 0x4A, 0xA8, 0x25, 0x42,
    0x15, 0x1D, 0x58, 0x0E, 0xA5, 0xEB, 0xDD, 0xE4, 0xDC, 0x70, 0xA4, 0x28, 0xA7, 0xC1, 0xC9, 0x1C,
    0xBA, 0x2F, 0xA7, 0xAF, 0xE4, 0xCF, 0xC7, 0xBD, 0x87, 0x3F, 0x7C, 0xD6, 0xD7, 0x7B, 0x7D, 0x4F,
    0xA1, 0xBB, 0x79, 0x06, 0x2D, 0xF1, 0xDE, 0x00, 0x1E, 0xA9, 0x87, 0x29, 0xFD, 0xE1, 0xA8, 0x43,
    0xB6, 0x28, 0xC5, 0xF7, 0x2F, 0xFB, 0x64, 0x05, 0x7C, 0x6C, 0xD2, 0xFD, 0x54, 0xE4, 0x43, 0xE0,
    0x80, 0xD2, 0xE3, 0xE3, 0xB4, 0xBC, 0x4E, 0xE5, 0x59, 0x93, 0x36, 0x5E, 0x9A, 0x79, 0x49, 0x7B,
    0x40, 0x5F, 0xCE, 0xAE, 0x4A, 0x1B, 0x59, 0x63, 0x5F, 0xA1, 0x37, 0x6C, 0x18, 0x65, 0xA9, 0x2F,
    0x71, 0x0C, 0x1A, 0xB4, 0xA1, 0x00, 0xD3, 0x20, 0x0D, 0x9A, 0xC1, 0x0B, 0x96, 0x88, 0x16, 0xC9,
};
HI_U8 Q[] =
{
    0xAA, 0x45, 0x9E, 0x08, 0x44, 0x6B, 0x7B, 0x7D, 0x47, 0x09, 0x4C, 0xFA, 0x24, 0x4A, 0xAD, 0xD3,
    0x4B, 0xF6, 0x46, 0x35, 0x63, 0xA0, 0xAD, 0xB6, 0x61, 0x0A, 0xE6, 0x1D, 0x8E, 0xAB, 0x74, 0xF1,
    0x16, 0x5F, 0x83, 0xD8, 0x96, 0xB8, 0x69, 0xC5, 0x17, 0x70, 0x5B, 0x31, 0x18, 0xA4, 0xD7, 0x32,
    0x83, 0xCD, 0x41, 0xAF, 0xC1, 0xAB, 0xD3, 0xA2, 0x15, 0xBF, 0x29, 0x05, 0x8F, 0xB9, 0xB7, 0xB8,
    0xDB, 0xCC, 0x42, 0x3C, 0x4E, 0x8C, 0xC7, 0xF2, 0x27, 0x89, 0xA6, 0x0D, 0x6C, 0x4F, 0xD2, 0x11,
    0x94, 0x64, 0xAA, 0xA0, 0x8C, 0x31, 0x7E, 0x5B, 0x0D, 0xF0, 0x6B, 0xAA, 0xE8, 0x43, 0x80, 0x2B,
    0x73, 0x1B, 0x69, 0xD0, 0x0F, 0x0F, 0xD8, 0x5E, 0x35, 0xC5, 0xDF, 0x67, 0x86, 0x33, 0x0B, 0xDD,
    0xE6, 0xCF, 0x6D, 0x2D, 0x60, 0x8B, 0x2B, 0x0F, 0x9F, 0xFA, 0x06, 0x7E, 0x4D, 0x7C, 0x1B, 0x0D,
};
HI_U8 DP[] =
{
    0x3E, 0xCD, 0x40, 0xA3, 0x37, 0x55, 0x4D, 0xC7, 0xF6, 0x8F, 0x9A, 0xB2, 0xF0, 0x18, 0x01, 0x45,
    0xB4, 0xE8, 0xDE, 0x26, 0x62, 0x6C, 0xAF, 0x6F, 0xF4, 0x3B, 0x83, 0xF3, 0x18, 0x32, 0x6C, 0xA6,
    0xEB, 0xDD, 0x11, 0xFC, 0xB8, 0x6E, 0xE5, 0x6E, 0x02, 0x7D, 0x0B, 0x04, 0xE5, 0x9C, 0x3D, 0xB4,
    0x5E, 0xFD, 0x5C, 0x73, 0xE4, 0x05, 0xC9, 0xA3, 0x94, 0x2D, 0x86, 0x7E, 0xA5, 0x2F, 0xB7, 0xE5,
    0x65, 0xCE, 0x8C, 0x02, 0xE5, 0xB3, 0xC0, 0x84, 0x19, 0x1F, 0xE6, 0x35, 0x01, 0x16, 0xCB, 0xBC,
    0x76, 0xC2, 0x0D, 0xFF, 0xFA, 0xFF, 0x46, 0xEB, 0x1A, 0xD0, 0x8C, 0xD9, 0xA0, 0xEF, 0x2F, 0xDD,
    0x6B, 0xF0, 0xC0, 0x85, 0x00, 0x68, 0xDD, 0x27, 0x79, 0x98, 0x6D, 0xDC, 0x07, 0xBB, 0x94, 0x7D,
    0x01, 0xDE, 0x74, 0x36, 0x5C, 0x4D, 0x9D, 0x4A, 0x67, 0xD0, 0xA1, 0xF9, 0x89, 0xCA, 0x2C, 0x31,
};
HI_U8 DQ[] =
{
    0x6F, 0xE5, 0x28, 0x21, 0x4E, 0xB5, 0x43, 0x85, 0xE4, 0x74, 0xDC, 0x3D, 0x56, 0x34, 0x2D, 0x5F,
    0x3A, 0x00, 0x31, 0xCB, 0x4C, 0x19, 0x7F, 0x8E, 0xE6, 0xDE, 0xFE, 0xB2, 0x55, 0xDB, 0x9F, 0x12,
    0x00, 0x1D, 0xEC, 0xCB, 0x1C, 0xE1, 0x3B, 0xC0, 0xE5, 0xD2, 0x54, 0x5B, 0x43, 0x52, 0xB0, 0x88,
    0xE5, 0xCC, 0xB1, 0x6A, 0x0A, 0xE0, 0x1C, 0x47, 0xDB, 0xFA, 0xAF, 0xBE, 0x93, 0xE0, 0xFC, 0x37,
    0x63, 0x5A, 0x2B, 0xFC, 0xED, 0xB1, 0xDE, 0x83, 0xE8, 0x2F, 0xB1, 0x0C, 0x09, 0x2D, 0xBB, 0x63,
    0x0A, 0x1D, 0xCD, 0x73, 0x8C, 0x2D, 0xCA, 0x57, 0x94, 0x25, 0x76, 0xDB, 0xED, 0x9E, 0xCE, 0x4F,
    0xBF, 0x69, 0x38, 0x74, 0x1E, 0x31, 0xCF, 0x82, 0xB9, 0xDB, 0xBB, 0x20, 0x91, 0x34, 0x62, 0x8C,
    0x04, 0xEE, 0x33, 0x55, 0x2A, 0xA8, 0xCA, 0x37, 0x8E, 0x6E, 0x04, 0x6E, 0x64, 0x05, 0x36, 0xD1,
};
HI_U8 QP[] =
{
    0xBA, 0xBE, 0x60, 0x75, 0x6A, 0x59, 0x4B, 0x63, 0xE6, 0x2D, 0xBF, 0x48, 0x28, 0xDD, 0xC2, 0x8F,
    0x3F, 0x59, 0x74, 0xCC, 0xD0, 0xC4, 0x0B, 0xD4, 0x19, 0x2E, 0x88, 0x80, 0x58, 0x8E, 0x28, 0x11,
    0x69, 0x55, 0xB3, 0xC5, 0x16, 0x12, 0x0F, 0xF5, 0xDB, 0x99, 0x2A, 0xCA, 0x02, 0x1B, 0xA7, 0xBA,
    0xC0, 0x80, 0x97, 0x63, 0x3A, 0xD7, 0x9F, 0x8C, 0xF4, 0xC7, 0xA8, 0x26, 0xEC, 0x03, 0x36, 0x5C,
    0xE2, 0x01, 0x07, 0xF4, 0xD6, 0x6E, 0xAF, 0x31, 0x3B, 0x0E, 0xD8, 0xA5, 0x84, 0x9D, 0x8F, 0x20,
    0x29, 0xA9, 0x28, 0xFB, 0x8D, 0x5D, 0xD4, 0xBD, 0xF0, 0x08, 0x31, 0x88, 0x9E, 0x04, 0x43, 0x5F,
    0x0F, 0x21, 0x50, 0xBD, 0x25, 0x01, 0xFA, 0xD9, 0x0A, 0xA0, 0xDE, 0xA6, 0x16, 0xDA, 0x11, 0xC3,
    0x99, 0x05, 0xCA, 0x16, 0x59, 0x62, 0x1F, 0xB4, 0x78, 0xE7, 0x96, 0x1D, 0xCF, 0x2F, 0x23, 0xE8,
};

HI_U8 RES[] =
{
    0x5c, 0xfd, 0x7c, 0xb3, 0x9f, 0xf1, 0x2b, 0xd0, 0x73, 0x23, 0x21, 0x4e, 0x25, 0x3d, 0x68, 0x5c,
    0x6c, 0x4b, 0x12, 0x77, 0x6b, 0x0e, 0x26, 0x80, 0x2a, 0xf4, 0xd2, 0x92, 0x66, 0x40, 0xe0, 0xb2,
    0x5f, 0xbe, 0x81, 0xa1, 0xda, 0xa4, 0xc5, 0x07, 0x96, 0x17, 0x4a, 0x12, 0x5f, 0xa4, 0x33, 0x43,
    0x3f, 0x94, 0x7e, 0xe7, 0xbb, 0xd1, 0x7b, 0xde, 0x03, 0xb8, 0xcc, 0xe5, 0x79, 0x5c, 0x3e, 0x5c,
    0x3c, 0xa1, 0x49, 0xbf, 0xda, 0xc4, 0xb4, 0x73, 0x2d, 0x49, 0x9f, 0x7a, 0xf9, 0x1d, 0x8a, 0xbc,
    0x39, 0x17, 0xbc, 0xd7, 0x45, 0xaf, 0xad, 0x38, 0x99, 0xc1, 0x1c, 0xf7, 0xe6, 0xf2, 0x7b, 0x16,
    0x26, 0xaa, 0xa9, 0x16, 0x96, 0xff, 0x02, 0x41, 0x97, 0x1e, 0x81, 0x43, 0xab, 0xff, 0xa8, 0xb7,
    0x19, 0xdf, 0x19, 0xac, 0x19, 0xdb, 0xbf, 0x15, 0x00, 0x12, 0xbe, 0x64, 0x2b, 0xd4, 0x50, 0x32,
    0x87, 0xdf, 0x52, 0xb1, 0x78, 0x65, 0x53, 0x7d, 0x10, 0x2d, 0xc1, 0x39, 0xfc, 0x9d, 0x05, 0x15,
    0x07, 0x84, 0xb2, 0xa1, 0x5b, 0x72, 0x82, 0x22, 0x73, 0x1f, 0x00, 0xbf, 0xf8, 0x71, 0x3a, 0xf3,
    0x5a, 0x02, 0x60, 0x53, 0x40, 0x44, 0x65, 0x0e, 0xb1, 0x3b, 0xe4, 0x9a, 0xe9, 0x8d, 0x10, 0x81,
    0xa4, 0x0b, 0xed, 0x02, 0xb7, 0x7f, 0x4a, 0x32, 0x90, 0xbb, 0xe7, 0xe6, 0xb8, 0x69, 0x0f, 0x95,
    0xea, 0x93, 0x45, 0x2c, 0x5f, 0x76, 0xfd, 0xb6, 0xcb, 0x1a, 0x7b, 0xe9, 0xc1, 0x37, 0xf7, 0x77,
    0xba, 0xb4, 0x1a, 0x26, 0xea, 0x68, 0x18, 0x35, 0x5d, 0x71, 0xe8, 0x3f, 0xdd, 0x97, 0x7d, 0x57,
    0xa6, 0x40, 0x45, 0xd8, 0x0d, 0xe4, 0xc7, 0xc0, 0x04, 0xdf, 0x20, 0x9e, 0x3a, 0x85, 0x85, 0x44,
    0x37, 0x45, 0x31, 0x96, 0x3b, 0xa8, 0xa7, 0xf6, 0xec, 0xff, 0xf1, 0xd1, 0xa4, 0x23, 0x7e, 0x8c,
};

HI_S32 RSA_SIGN_VERIFY(HI_UNF_CIPHER_RSA_SIGN_SCHEME_E enScheme)
{
    HI_S32 ret = HI_SUCCESS;
    HI_U8  u8Sign[256];
    HI_U32 u32SignLen;
    HI_UNF_CIPHER_RSA_SIGN_S stRsaSign;
    HI_UNF_CIPHER_RSA_VERIFY_S stRsaVerify;

    ret = HI_UNF_CIPHER_Init();
    if ( HI_SUCCESS != ret )
    {
        return HI_FAILURE;
    }

    memset(&stRsaSign, 0, sizeof(HI_UNF_CIPHER_RSA_SIGN_S));
    stRsaSign.enScheme = enScheme;
    stRsaSign.stPriKey.pu8N = N;
    stRsaSign.stPriKey.pu8D = D;
    stRsaSign.stPriKey.u16NLen = sizeof(N);
    stRsaSign.stPriKey.u16DLen = sizeof(D);

    ret = HI_UNF_CIPHER_RsaSign(&stRsaSign, test_data, sizeof(test_data) - 1, sha256_sum, u8Sign, &u32SignLen);
//  ret = HI_UNF_CIPHER_RsaSign(&stRsaSign, test_data, sizeof(test_data) - 1, HI_NULL, u8Sign, &u32SignLen);
    if ( HI_SUCCESS != ret )
    {
        HI_ERR_CIPHER("HI_UNF_CIPHER_RsaSign failed\n");
        return HI_FAILURE;
    }

    switch(enScheme)
    {
    case HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA256:
        if(memcmp(u8Sign, RES, sizeof(RES)) != 0)
        {
            HI_ERR_CIPHER("HI_UNF_CIPHER_RsaSign failed\n");
            printBuffer("sign", u8Sign, u32SignLen);
            printBuffer("golden", RES, sizeof(RES));
            return HI_FAILURE;
        }
        break;
    default:
        break;
    }

//    printBuffer("sign", u8Sign, u32SignLen);

    memset(&stRsaVerify, 0, sizeof(HI_UNF_CIPHER_RSA_VERIFY_S));
    stRsaVerify.enScheme = enScheme;
    stRsaVerify.stPubKey.pu8N = N;
    stRsaVerify.stPubKey.pu8E = E;
    stRsaVerify.stPubKey.u16NLen = sizeof(N);
    stRsaVerify.stPubKey.u16ELen = sizeof(E);

//  ret = HI_UNF_CIPHER_RsaVerify(&stRsaVerify, test_data, sizeof(test_data) - 1, HI_NULL, u8Sign, u32SignLen);
    ret = HI_UNF_CIPHER_RsaVerify(&stRsaVerify, test_data, sizeof(test_data) - 1, sha256_sum, u8Sign, u32SignLen);
    if ( HI_SUCCESS != ret )
    {
        HI_ERR_CIPHER("HI_UNF_CIPHER_RsaVerify failed\n");
        return HI_FAILURE;
    }

    TEST_END_PASS();

    HI_UNF_CIPHER_DeInit();

    return HI_SUCCESS;
}

int main(int argc, char* argv[])
{
    HI_SYS_Init();

    RSA_SIGN_VERIFY(HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA256);
    RSA_SIGN_VERIFY(HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_PSS_SHA256);

    HI_SYS_DeInit();

    return HI_SUCCESS;
}

