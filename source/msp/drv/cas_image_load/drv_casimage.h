/******************************************************************************
 *
 * Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
 * ******************************************************************************
 * File Name     : drv_casimage.h
 * Version       : Initial
 * Author        : Hisilicon hisecurity team
 * Created       : 2017-08-18
 * Last Modified :
 * Description   :
 * Function List :
 * History       :
 * ******************************************************************************/
#ifndef __DRV_CASIMAGE_H__
#define __DRV_CASIMAGE_H__

#include "hi_type.h"
#include "hi_drv_struct.h"
#include "hi_drv_dev.h"


#ifdef __cplusplus
#if __cplusplus
extern "C"
{
#endif
#endif /* __cpluscplus */

HI_S32 DRV_CASIMAGE_Init(HI_VOID);
HI_S32 DRV_CASIMAGE_DeInit(HI_VOID);
HI_S32 DRV_CASIMAGE_LoadImage(HI_VOID);
HI_S32 DRV_CASIMAGE_Suspend(HI_VOID);
HI_S32 DRV_CASIMAGE_Ioctl(struct inode *inode, struct file *file, unsigned int cmd, HI_VOID *arg);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cpluscplus */

#endif /* __DRV_CASIMAGE_H__ */

