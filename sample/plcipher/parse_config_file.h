/******************************************************************************
Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name   :  parse_config_file.h
Author        :  Hisilicon multimedia software group
Created      :  2017/04/07
Description :
******************************************************************************/

#ifndef __PLCIPHER_PARSECONFIG_H__
#define __PLCIPHER_PARSECONFIG_H__

#include "hi_unf_klad.h"
#include "hi_unf_payloadcipher.h"
#ifdef HI_ADVCA_TYPE_NAGRA
#include "hi_unf_cert.h"
#endif
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define    MAX_FILE_NAME_LEN    (128)
#define    MAX_VAR_NUM          (64)
#define    MAX_VAR_NAME_LEN     (128)
#define    MAX_VAR_VALUE_LEN    (MAX_FILE_NAME_LEN)

int parse_config_file(char *path_to_config_file);

int get_key_value(HI_CHAR *pName, HI_U8 *pKey, HI_U32 u32keyLen);

HI_CHAR* get_config_var(HI_CHAR* var_name);

HI_S32 get_cwkey_alg_type(HI_UNF_PLCIPHER_ALG_E *penCwKeyType);

HI_S32 get_cwkey_oddeven_type(HI_UNF_PLCIPHER_KEY_EVENODD_E *penCwKeyOddEven);

#ifdef HI_ADVCA_TYPE_NAGRA
HI_S32 get_cert_timeout(HI_CHAR* var_name, HI_UNF_CERT_TIMTOUT_E *pTimeout);

HI_S32 get_cert_oddeven_type(HI_BOOL *pbIsEven);

HI_S32 get_cert_target_engine(HI_UNF_CERT_TARGET_ENGINE_E *penEngine);

HI_S32 get_cert_key_port_sel(HI_UNF_CERT_KEY_PORT_SEL_E *enPortSel);
#endif
HI_VOID print_all_vars();

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif //__PLCIPHER_PARSECONFIG__
