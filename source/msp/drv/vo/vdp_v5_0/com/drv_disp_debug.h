
/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_disp_error.h
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2012/12/30
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __DRV_DISP_DEBUG_H__
#define __DRV_DISP_DEBUG_H__

#include "hi_type.h"
#include "drv_disp_com.h"


#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */


int vdp_str2val(char *str, unsigned int *data);

struct file *vdp_k_fopen(const char *filename, int flags, int mode);
void vdp_k_fclose(struct file *filp);
int vdp_k_fread(char *buf, unsigned int len, struct file *filp);
int vdp_k_fwrite(char *buf, int len, struct file *filp);


#define DRV_WIN_PROC_CMD_VALID  0xffffffffU
#define DRV_WIN_PROC_CMD_EN     0x00010001U
#define DRV_WIN_PROC_CMD_DIS    0x00010002U
#define DRV_WIN_PROC_CMD_FRZ_B  0x00010010U
#define DRV_WIN_PROC_CMD_FRZ_S  0x00010011U
#define DRV_WIN_PROC_CMD_UNFRZ  0x00010012U
#define DRV_WIN_PROC_CMD_PAUSE  0x00010021U
#define DRV_WIN_PROC_CMD_RESUME 0x00010022U
#define DRV_WIN_PROC_CMD_SV_YUV 0x00020001U


HI_S32 vdp_k_SaveYUVImg(struct file *pfYUV, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_S32 num);
HI_S32 vdp_DebugSaveYUVImg(HI_DRV_VIDEO_FRAME_S *pstCurFrame, HI_CHAR *buffer, HI_U32 count);
HI_VOID Disp_SetDebugFlag(HI_U32 u32mask,HI_BOOL bClear);
HI_S32 Disp_CreateDebugFile(HI_U8 *pDebugFileName);
HI_VOID Disp_DestroyDebugFile(HI_VOID);
HI_VOID DISP_PRINT_FUNC(const HI_CHAR *pFunctionName, HI_U32 u32LineNumber, const HI_CHAR *format, ...);

extern HI_U32 g_u32DfxFunctionComposer;

#define MAX_DEBUG_NAME_LENGTH  128
typedef enum hiDEBUG_INFOR_CLASSIFY_E
{
    AVSYNC_INFOR    = 1 << 1,
    BUFFER_INFOR    = 1 << 2,
    VPSS_INFOR      = 1 << 3,
    WINATTR_INFOR   = 1 << 4,
    MASK_INFOR      = 1 << 5,
    IOCTL_INFOR     = 1 << 6,
    SOFTALG_INFOR   = 1 << 7,


    CLEAR_FLAG      = 1 << 25,
    FILE_INFOR      = 1 << 26,
    SERIAL_INFOR    = 1 << 27,
    DEBUG_INFOR_CLASSIFY_BUTT
} DEBUG_INFOR_CLASSIFY_E;


#define WIN_INFO_NEW(FUNCTION, fmt...) do{\
    \
    if (g_u32DfxFunctionComposer & FILE_INFOR)\
    {\
            if (FUNCTION & g_u32DfxFunctionComposer)\
            DISP_PRINT_FUNC(__func__, __LINE__, fmt);\
    }\
    else\
    {\
        if (FUNCTION & g_u32DfxFunctionComposer)\
        {\
            WIN_INFO(fmt);\
        }\
    }\
}while(0)

#define WIN_WARN_NEW(FUNCTION, fmt...) do{\
    \
    if (g_u32DfxFunctionComposer & FILE_INFOR)\
    {\
            if (FUNCTION & g_u32DfxFunctionComposer)\
            DISP_PRINT_FUNC(__func__, __LINE__, fmt);\
    }\
    else\
    {\
        if (FUNCTION & g_u32DfxFunctionComposer)\
        {\
            WIN_WARN(fmt);\
        }\
    }\
}while(0)


#define WIN_ERROR_NEW(FUNCTION, fmt...) do{\
    \
    if (g_u32DfxFunctionComposer & FILE_INFOR)\
    {\
            if (FUNCTION & g_u32DfxFunctionComposer)\
            DISP_PRINT_FUNC(__func__, __LINE__, fmt);\
    }\
    else\
    {\
        if (FUNCTION & g_u32DfxFunctionComposer)\
        {\
            WIN_ERROR(fmt);\
        }\
    }\
}while(0)


#define WIN_FATAL_NEW(FUNCTION, fmt...) do{\
    \
    if (g_u32DfxFunctionComposer & FILE_INFOR)\
    {\
            if (FUNCTION & g_u32DfxFunctionComposer)\
            DISP_PRINT_FUNC(__func__, __LINE__, fmt);\
    }\
    else\
    {\
        if (FUNCTION & g_u32DfxFunctionComposer)\
        {\
            WIN_FATAL(fmt);\
        }\
    }\
}while(0)

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /*  __DRV_DISP_ERROR_H__  */


