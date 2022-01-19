/*
 * Copyright (c) (2014 - ...) Device Chipset Source Algorithm and Chipset Platform Development Dept
 * Hisilicon. All rights reserved.
 *
 * File:    decoder.h
 *
 * Purpose: omxvdec decoder interface
 *
 * Author:  sdk
 *
 * Date:    26, 11, 2014
 *
 */

#ifndef __DECODER_H__
#define __DECODER_H__

#include "channel.h"
#include "vfmw.h"

#define LAST_FRAME_BUF_ID           (0xFFFFFFEE)
#define LAST_FRAME_BUF_SIZE         (20)

typedef struct
{
    HI_U64 EsBufferPhyAddr;
    HI_U64 EsBufferVirAddr;
    HI_ULONG  Size;
} IndirectInputBufferInfoParams;

typedef enum
{
    DEC_CMD_CLEAR_STREAM,
    DEC_CMD_ALLOC_MEM,
    DEC_CMD_BIND_MEM,
    DEC_CMD_ACTIVATE_INST,
    DEC_CMD_CONFIG_MEM,
    DEC_CMD_BUTT,
} DECODER_CMD_E;

typedef struct
{
    OMX_VID_STD_E omx_vid;
    VID_STD_E vfmw_vid;
} VID_CONVERSION_TABLE;

HI_S32 decoder_init(HI_VOID);
HI_S32 decoder_exit(HI_VOID);
HI_S32 decoder_create_inst(OMXVDEC_CHAN_CTX *pchan, OMXVDEC_DRV_CFG *pdrv_cfg);
HI_S32 decoder_release_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 decoder_start_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 decoder_stop_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 decoder_reset_inst(OMXVDEC_CHAN_CTX *pchan);
HI_S32 decoder_reset_inst_with_option(OMXVDEC_CHAN_CTX *pchan);
HI_S32 decoder_command_handler(OMXVDEC_CHAN_CTX *pchan, DECODER_CMD_E eCmd, HI_VOID *pArgs, HI_U32 ParamLength);
HI_S32 decoder_get_stream_ex(HI_S32 chan_id, HI_VOID *stream_data);
HI_S32 decoder_release_stream_ex(HI_S32 chan_id, HI_VOID *stream_data);
HI_S32 decoder_init_trusted(HI_VOID);
HI_S32 decoder_exit_trusted(HI_VOID);
HI_S32 decoder_find_special2Normal_Index(OMXVDEC_CHAN_CTX *pchan, HI_U32 u32Phyaddr, HI_U32 *pIndex);
HI_S32 decoder_record_occoupied_frame(OMXVDEC_CHAN_CTX *pchan);
HI_S32 decoder_global_release_frame_inter(HI_U32 u32Index);
HI_S32 decoder_global_release_frame(HI_DRV_VIDEO_FRAME_S* pstFrame, HI_BOOL bRlsVfmw);
#ifdef HI_OMX_TEE_SUPPORT
HI_S32 decoder_allocbuf_by_vfmw(OMXVDEC_CHAN_CTX *pchan, const char *bufname, char *zone_name, HI_U32 size, int align, MMZ_BUFFER_S *psMBuf);
HI_VOID decoder_releasebuf_by_vfmw(MMZ_BUFFER_S *psMBuf);
#endif
#endif
