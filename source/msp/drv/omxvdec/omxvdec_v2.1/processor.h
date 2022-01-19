/*
 * Copyright (c) (2011 - ...) digital media project platform development dept,
 * Hisilicon. All rights reserved.
 *
 * File: processor.h
 *
 * Purpose: common post processor interface
 *
 * Author:  sdk
 *
 * Date: 26, November, 2014
 *
 */

#ifndef __PROCESSOR_H__
#define __PROCESSOR_H__


#include "channel.h"
#include "vfmw.h"

HI_S32 processor_init(HI_VOID);
HI_S32 processor_exit(HI_VOID);
HI_S32 processor_create_inst(OMXVDEC_CHAN_CTX *pchan, OMX_PIX_FORMAT_E color_format);
HI_S32 processor_release_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 processor_start_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 processor_stop_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 processor_reset_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 processor_inform_img_ready(OMXVDEC_CHAN_CTX *pchan);
HI_S32 processor_convert_frame_to_image(HI_DRV_VIDEO_FRAME_S *pFrame, IMAGE *pImage);

HI_S32 processor_release_image(OMXVDEC_CHAN_CTX *pchan, HI_DRV_VIDEO_FRAME_S *pstFrame);
HI_S32 processor_set_bypass(OMXVDEC_CHAN_CTX *pchan);
HI_S32 processor_get_bypass(OMXVDEC_CHAN_CTX *pchan, PROCESSOR_BYPASSATTR_S *pBypasaAttr);

#endif

