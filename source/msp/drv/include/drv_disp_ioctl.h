/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_disp_ioctl.h
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2012/12/30
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/

#ifndef __DRV_DISP_IOCTL_H__
#define __DRV_DISP_IOCTL_H__

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

#include "hi_type.h"
#include "hi_drv_video.h"
#include "hi_drv_disp.h"

typedef struct hiDISP_SET_OUTPUT_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_DRV_DISP_OUT_TYPE_E  enDispType;
}DISP_SET_OUTPUT_S;

typedef struct hiDISP_GET_OUTPUT_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_DRV_DISP_OUT_TYPE_E  enDispType;
}DISP_GET_OUTPUT_S;

typedef struct hiDISP_ATTACH_S
{
    HI_DRV_DISPLAY_E   enMaster;
    HI_DRV_DISPLAY_E   enSlave;
}DISP_ATTACH_S;

typedef struct hiDISP_ENABLE_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_BOOL        bEnable;
}DISP_ENABLE_S;

typedef struct hiDISP_SET_INTF_S
{
   HI_DRV_DISPLAY_E    enDisp;
   HI_DRV_DISP_INTF_S  stIntf;
}DISP_SET_INTF_S;

typedef struct hiDISP_GET_INTF_S
{
   HI_DRV_DISPLAY_E    enDisp;
   HI_U32              u32IntfNum;
   HI_DRV_DISP_INTF_S *pstIntf;
   HI_S32              Revd;
}DISP_GET_INTF_S;

typedef struct hiDISP_FORMAT_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_DRV_DISP_STEREO_MODE_E enStereo;
    HI_DRV_DISP_FMT_E enFormat;
}DISP_FORMAT_S;

typedef struct hiDISP_TIMING_S
{
    HI_DRV_DISPLAY_E           enDisp;
    HI_DRV_DISP_TIMING_S  stTimingPara;
}DISP_TIMING_S;


typedef struct hiDISP_R_EYE_FIRST_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_BOOL  bREFirst;
}DISP_R_EYE_FIRST_S;

typedef struct hiDISP_VIRTSCREEN_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_RECT_S stVirtScreen;
}DISP_VIRTSCREEN_S;


typedef struct hiDISP_SCREENOFFSET_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_DRV_DISP_OFFSET_S stScreenOffset;
}DISP_SCREENOFFSET_S;


typedef struct hiDISP_ZORDER_S
{
    HI_DRV_DISPLAY_E    enDisp;
    HI_DRV_DISP_LAYER_E Layer;
    HI_DRV_DISP_ZORDER_E   ZFlag;
}DISP_ZORDER_S;

typedef struct hiDISP_ORDER_S
{
    HI_DRV_DISPLAY_E    enDisp;
    HI_DRV_DISP_LAYER_E Layer;
    HI_U32              Order;
}DISP_ORDER_S;

typedef struct hiDISP_BGC_S
{
    HI_DRV_DISPLAY_E enDisp;
    HI_DRV_DISP_COLOR_S stBgColor;
}DISP_BGC_S;

typedef struct hiDISP_SCREEN_S
{
    HI_DRV_DISPLAY_E enDisp;
    HI_RECT_S stRect;
}DISP_SCREEN_S;

typedef struct hiDISP_VBI_S
{
    HI_HANDLE hVbi;
    HI_DRV_DISP_VBI_DATA_S stVbiData;
}DISP_VBI_S;

typedef struct hiDISP_COMPAT_VBI_S
{
    HI_HANDLE hVbi;
    HI_DRV_DISP_COMPAT_VBI_DATA_S stVbiData;
}DISP_COMPAT_VBI_S;

typedef struct hiDISP_VBI_CREATE_CHANNEL_S
{
    HI_DRV_DISPLAY_E      enDisp;
    HI_DRV_DISP_VBI_CFG_S  stCfg;
    HI_HANDLE hVbi;
}DISP_VBI_CREATE_CHANNEL_S;

typedef struct hiDISP_WSS_S
{
    HI_DRV_DISPLAY_E      enDisp;
    HI_DRV_DISP_WSS_DATA_S  WssData;
}DISP_WSS_S;

typedef struct hiDISP_MCRVSN_S
{
    HI_DRV_DISPLAY_E          enDisp;
    HI_DRV_DISP_MACROVISION_E eMcrvsn;
}DISP_MCRVSN_S;

typedef struct hiDISP_HDMIINF_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_DRV_DISP_HDMI_S HDMIInf;
}DISP_HDMIINF_S;

/* CGMS parameter struct */
typedef struct hiDISP_CGMS_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_DRV_DISP_CGMSA_CFG_S stCgmsCfg;
}DISP_CGMS_S;


/* CGMS parameter struct */
typedef struct hiDISP_OUTRECT_S
{
    HI_DRV_DISPLAY_E          enDisp;
    HI_RECT_S          stOutRectCfg;
}DISP_OUTRECT_S;

typedef struct hiDISP_TCCSC_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_BOOL        bEnable;
}DISP_TCCSC_S;

typedef struct hiDISP_ASPECT_RATIO_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_U32 u32ARHori;
    HI_U32 u32ARVert;
}DISP_ASPECT_RATIO_S;

typedef struct hiDISP_CAST_CREATE_S
{
    HI_DRV_DISPLAY_E enDisp;
    HI_DRV_DISP_CAST_CFG_S stCfg;
    HI_HANDLE hCast;
}DISP_CAST_CREATE_S;

typedef struct hiDISP_CAST_DESTROY_S
{
    HI_HANDLE hCast;
}DISP_CAST_DESTROY_S;

typedef struct hiDISP_CAST_ENABLE_S
{
    HI_HANDLE hCast;
    HI_BOOL bEnable;
}DISP_CAST_ENABLE_S;

typedef struct hiDISP_CAST_FRAME_S
{
    HI_HANDLE hCast;
    HI_DRV_VIDEO_FRAME_S stFrame;
}DISP_CAST_FRAME_S;

typedef struct hiDISP_SNAPSHOT_FRAME_S
{
    HI_DRV_DISPLAY_E enDispLayer;
    HI_DRV_VIDEO_FRAME_S stFrame;
}DISP_SNAPSHOT_FRAME_S;

typedef enum hiDISP_EXT_ATTACH_TYPE_E
{
    EXT_ATTACH_TYPE_SRC = 0,
    EXT_ATTACH_TYPE_SINK,
    EXT_ATTACH_TYPE_BUTT
}DISP_EXT_ATTACH_TYPE_E;

typedef struct hiDISP_EXT_ATTACH_S
{
    DISP_EXT_ATTACH_TYPE_E enType;
    HI_HANDLE hCast;
    HI_HANDLE hMutual;
}DISP_EXT_ATTACH_S;

typedef struct hiDISP_CAST_EXT_ATTR_S
{
    HI_HANDLE hCast;
    HI_DRV_DISP_Cast_Attr_S castAttr;
}DISP_CAST_EXT_ATTR_S;

typedef struct hiDISP_COLORSPACE_S
{
    HI_DRV_DISPLAY_E          enDisp;
    HI_DRV_DISP_COLOR_SPACE_E enColorSpace;
}DISP_COLORSPACE_S;

typedef struct hiDISP_XDR_ENGINE_S
{
    HI_DRV_DISPLAY_E          enDisp;
    HI_DRV_DISP_XDR_ENGINE_E     enXdrEngine;
}DISP_XDR_ENGINE_S;

typedef struct hiDISP_ALPHA_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_U32     u32ALpha;
} DISP_ALPHA_S;

typedef struct hiDISP_SINK_CAPABILITY_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_DRV_DISP_SINK_CAPABILITY_S stSinkCapability;
}DISP_SINK_CAPABILITY_S;

typedef struct hiDISP_OUTPUT_STATUS_S
{
    HI_DRV_DISPLAY_E  enDisp;
    HI_DRV_DISP_OUTPUT_STATUS_S stOutputStatus;
}DISP_OUTPUT_STATUS_S;

typedef struct hiDISP_TECHNI_BRIGHT_S
{
    HI_DRV_DISPLAY_E        enDisp;
    HI_S32                  s32TechniDispBright;
}DISP_TECHNI_BRIGHT_S;

typedef enum
{
    IOC_DISP_ATTACH = 0,
    IOC_DISP_DETACH,

    IOC_DISP_OPEN,
    IOC_DISP_CLOSE,

    IOC_DISP_SET_ENABLE,
    IOC_DISP_GET_ENABLE,

    IOC_DISP_ADD_INTF,
    IOC_DISP_DEL_INTF,

    IOC_DISP_SET_FORMAT,
    IOC_DISP_GET_FORMAT,

    IOC_DISP_SET_R_EYE_FIRST,
    IOC_DISP_GET_R_EYE_FIRST,

    IOC_DISP_SET_VIRTSCREEN,
    IOC_DISP_GET_VIRTSCREEN,

    IOC_DISP_SET_SCREENOFFSET,
    IOC_DISP_GET_SCREENOFFSET,

    IOC_DISP_SET_DAC,
    IOC_DISP_GET_DAC,

    IOC_DISP_SET_TIMING,
    IOC_DISP_GET_TIMING,

    IOC_DISP_SET_ZORDER,
    IOC_DISP_GET_ORDER,

    IOC_DISP_SET_BGC,
    IOC_DISP_GET_BGC,

    IOC_DISP_SET_SCREEN,
    IOC_DISP_GET_SCREEN,

    IOC_DISP_CREATE_VBI_CHANNEL,
    IOC_DISP_DESTROY_VBI_CHANNEL,
    IOC_DISP_SEND_VBI,
    IOC_DISP_SET_WSS,

    IOC_DISP_SET_MCRVSN,
    IOC_DISP_GET_MCRVSN,

    IOC_DISP_SET_HDMIINF,
    IOC_DISP_GET_HDMIINF,

    IOC_DISP_SET_CGMS,
    IOC_DISP_SET_DISP_SCREEN,
    IOC_DISP_GET_DISP_SCREEN,

    IOC_DISP_SET_DEV_RATIO,
    IOC_DISP_GET_DEV_RATIO,

    IOC_DISP_ACQUIRE_SNAPSHOT,
    IOC_DISP_RELEASE_SNAPSHOT,

    IOC_DISP_CREATE_CAST,
    IOC_DISP_DESTROY_CAST,
    IOC_DISP_SET_CAST_ENABLE,
    IOC_DISP_GET_CAST_ENABLE,
    IOC_DISP_ACQUIRE_CAST_FRAME,
    IOC_DISP_RELEASE_CAST_FRAME,
    IOC_DISP_EXT_ATTACH,
    IOC_DISP_EXT_DEATTACH,
    IOC_DISP_SET_CASTATTR,
    IOC_DISP_GET_CASTATTR,
    IOC_DISP_SUSPEND,
    IOC_DISP_RESUME,
    IOC_DISP_FORCESET_DAC_ENABLE,
    IOC_DISP_SET_OUTPUT_TYPE,
    IOC_DISP_GET_OUTPUT_TYPE,

    IOC_DISP_SET_OUTPUT_COLOR_SPACE,
    IOC_DISP_GET_OUTPUT_COLOR_SPACE,
    IOC_DISP_SET_XDR_ENGINE,
    IOC_DISP_GET_XDR_ENGINE,
    IOC_DISP_SET_ALPHA,
    IOC_DISP_GET_ALPHA,

    IOC_DISP_SET_SINK_CAPABILITY,
    IOC_DISP_GET_OUTPUT_STATUS,

    IOC_DISP_SET_TECHNI_BRIGHT,
    IOC_DISP_GET_TECHNI_BRIGHT,

    IOC_DISP_SET_BUTT
}IOC_DISP_E;

#define CMD_DISP_ATTACH            _IOW(HI_ID_DISP, IOC_DISP_ATTACH, DISP_ATTACH_S)
#define CMD_DISP_DETACH            _IOW(HI_ID_DISP, IOC_DISP_DETACH, DISP_ATTACH_S)

#define CMD_DISP_OPEN              _IOW(HI_ID_DISP, IOC_DISP_OPEN, HI_DRV_DISPLAY_E)
#define CMD_DISP_CLOSE             _IOW(HI_ID_DISP, IOC_DISP_CLOSE, HI_DRV_DISPLAY_E)

#define CMD_DISP_SET_ENABLE        _IOW(HI_ID_DISP, IOC_DISP_SET_ENABLE, DISP_ENABLE_S)
#define CMD_DISP_GET_ENABLE        _IOWR(HI_ID_DISP, IOC_DISP_GET_ENABLE, DISP_ENABLE_S)

#define CMD_DISP_ADD_INTF          _IOW(HI_ID_DISP, IOC_DISP_ADD_INTF, DISP_SET_INTF_S)
#define CMD_DISP_DEL_INTF          _IOW(HI_ID_DISP, IOC_DISP_DEL_INTF, DISP_SET_INTF_S)

#define CMD_DISP_SET_FORMAT        _IOW(HI_ID_DISP, IOC_DISP_SET_FORMAT, DISP_FORMAT_S)
#define CMD_DISP_GET_FORMAT        _IOWR(HI_ID_DISP, IOC_DISP_GET_FORMAT, DISP_FORMAT_S)

#define CMD_DISP_SET_R_E_FIRST     _IOW(HI_ID_DISP, IOC_DISP_SET_R_EYE_FIRST, DISP_R_EYE_FIRST_S)
#define CMD_DISP_GET_R_E_FIRST     _IOWR(HI_ID_DISP, IOC_DISP_GET_R_EYE_FIRST, DISP_R_EYE_FIRST_S)


#define CMD_DISP_SET_VIRTSCREEN     _IOW(HI_ID_DISP, IOC_DISP_SET_VIRTSCREEN, DISP_VIRTSCREEN_S)
#define CMD_DISP_GET_VIRTSCREEN     _IOWR(HI_ID_DISP, IOC_DISP_GET_VIRTSCREEN, DISP_VIRTSCREEN_S)

#define CMD_DISP_SET_SCREENOFFSET     _IOW(HI_ID_DISP, IOC_DISP_SET_SCREENOFFSET, DISP_SCREENOFFSET_S)
#define CMD_DISP_GET_SCREENOFFSET     _IOWR(HI_ID_DISP, IOC_DISP_GET_SCREENOFFSET, DISP_SCREENOFFSET_S)

#define CMD_DISP_SET_DAC           _IOW(HI_ID_DISP, IOC_DISP_SET_DAC, DISP_SET_INTF_S)
#define CMD_DISP_GET_DAC           _IOR(HI_ID_DISP, IOC_DISP_GET_DAC, DISP_SET_INTF_S)

#define CMD_DISP_SET_TIMING        _IOW(HI_ID_DISP, IOC_DISP_SET_TIMING , DISP_TIMING_S)
#define CMD_DISP_GET_TIMING        _IOWR(HI_ID_DISP, IOC_DISP_GET_TIMING , DISP_TIMING_S)

#define CMD_DISP_SET_ZORDER        _IOW(HI_ID_DISP, IOC_DISP_SET_ZORDER, DISP_ZORDER_S)
#define CMD_DISP_GET_ORDER         _IOWR(HI_ID_DISP, IOC_DISP_GET_ORDER, DISP_ORDER_S)

#define CMD_DISP_SET_BGC           _IOW(HI_ID_DISP, IOC_DISP_SET_BGC, DISP_BGC_S)
#define CMD_DISP_GET_BGC           _IOWR(HI_ID_DISP, IOC_DISP_GET_BGC, DISP_BGC_S)

#define CMD_DISP_SET_SCREEN        _IOW(HI_ID_DISP, IOC_DISP_SET_SCREEN, DISP_SCREEN_S)
#define CMD_DISP_GET_SCREEN        _IOWR(HI_ID_DISP, IOC_DISP_GET_SCREEN, DISP_SCREEN_S)

#define CMD_DISP_CREATE_VBI_CHANNEL   _IOWR(HI_ID_DISP, IOC_DISP_CREATE_VBI_CHANNEL, DISP_VBI_CREATE_CHANNEL_S)
#define CMD_DISP_DESTROY_VBI_CHANNEL  _IOW(HI_ID_DISP, IOC_DISP_DESTROY_VBI_CHANNEL, HI_HANDLE)
#define CMD_DISP_SEND_VBI             _IOW(HI_ID_DISP, IOC_DISP_SEND_VBI, DISP_VBI_S)
#define CMD_DISP_COMPAT_SEND_VBI      _IOW(HI_ID_DISP, IOC_DISP_SEND_VBI, DISP_COMPAT_VBI_S)
#define CMD_DISP_SET_WSS              _IOW(HI_ID_DISP, IOC_DISP_SET_WSS, DISP_WSS_S)

#define CMD_DISP_SET_MCRVSN        _IOW(HI_ID_DISP, IOC_DISP_SET_MCRVSN, DISP_MCRVSN_S)
#define CMD_DISP_GET_MCRVSN        _IOWR(HI_ID_DISP, IOC_DISP_GET_MCRVSN, DISP_MCRVSN_S)

#define CMD_DISP_SET_HDMI_INTF     _IOW(HI_ID_DISP, IOC_DISP_SET_HDMIINF, DISP_HDMIINF_S)
#define CMD_DISP_GET_HDMI_INTF     _IOWR(HI_ID_DISP, IOC_DISP_GET_HDMIINF, DISP_HDMIINF_S)

#define CMD_DISP_SET_CGMS          _IOW(HI_ID_DISP, IOC_DISP_SET_CGMS, DISP_CGMS_S)

#define CMD_DISP_GET_DISP_SCREEN     _IOWR(HI_ID_DISP, IOC_DISP_GET_DISP_SCREEN, DISP_OUTRECT_S)
#define CMD_DISP_SET_DISP_SCREEN     _IOW(HI_ID_DISP, IOC_DISP_SET_DISP_SCREEN, DISP_OUTRECT_S)

#define CMD_DISP_SET_DEV_RATIO  _IOW(HI_ID_DISP, IOC_DISP_SET_DEV_RATIO, DISP_ASPECT_RATIO_S)
#define CMD_DISP_GET_DEV_RATIO  _IOWR(HI_ID_DISP, IOC_DISP_GET_DEV_RATIO, DISP_ASPECT_RATIO_S)


#define CMD_DISP_CREATE_CAST         _IOWR(HI_ID_DISP, IOC_DISP_CREATE_CAST,  DISP_CAST_CREATE_S)
#define CMD_DISP_DESTROY_CAST        _IOW(HI_ID_DISP, IOC_DISP_DESTROY_CAST, DISP_CAST_DESTROY_S)
#define CMD_DISP_SET_CAST_ENABLE     _IOW(HI_ID_DISP, IOC_DISP_SET_CAST_ENABLE, DISP_CAST_ENABLE_S)
#define CMD_DISP_GET_CAST_ENABLE     _IOWR(HI_ID_DISP, IOC_DISP_GET_CAST_ENABLE, DISP_CAST_ENABLE_S)
#define CMD_DISP_ACQUIRE_CAST_FRAME  _IOWR(HI_ID_DISP, IOC_DISP_ACQUIRE_CAST_FRAME, DISP_CAST_FRAME_S)
#define CMD_DISP_RELEASE_CAST_FRAME  _IOW(HI_ID_DISP, IOC_DISP_RELEASE_CAST_FRAME, DISP_CAST_FRAME_S)
#define CMD_DISP_EXT_ATTACH          _IOWR(HI_ID_DISP, IOC_DISP_EXT_ATTACH, DISP_EXT_ATTACH_S)
#define CMD_DISP_EXT_DEATTACH          _IOWR(HI_ID_DISP, IOC_DISP_EXT_DEATTACH, DISP_EXT_ATTACH_S)

#define CMD_DISP_SET_CASTATTR        _IOWR(HI_ID_DISP, IOC_DISP_SET_CASTATTR, DISP_CAST_EXT_ATTR_S)
#define CMD_DISP_GET_CASTATTR        _IOWR(HI_ID_DISP, IOC_DISP_GET_CASTATTR, DISP_CAST_EXT_ATTR_S)
#define CMD_DISP_ACQUIRE_SNAPSHOT    _IOWR(HI_ID_DISP, IOC_DISP_ACQUIRE_SNAPSHOT,  DISP_SNAPSHOT_FRAME_S)
#define CMD_DISP_RELEASE_SNAPSHOT    _IOW(HI_ID_DISP, IOC_DISP_RELEASE_SNAPSHOT,  DISP_SNAPSHOT_FRAME_S)

#define CMD_DISP_SUSPEND  _IOW(HI_ID_DISP, IOC_DISP_SUSPEND, HI_U32)
#define CMD_DISP_RESUME   _IOW(HI_ID_DISP, IOC_DISP_RESUME, HI_U32)

#define CMD_DISP_FORCESET_DAC_ENABLE  _IOW(HI_ID_DISP, IOC_DISP_FORCESET_DAC_ENABLE, HI_BOOL)
#define CMD_DISP_SET_OUTPUT_TYPE      _IOW(HI_ID_DISP, IOC_DISP_SET_OUTPUT_TYPE, DISP_SET_OUTPUT_S)
#define CMD_DISP_GET_OUTPUT_TYPE      _IOWR(HI_ID_DISP, IOC_DISP_GET_OUTPUT_TYPE, DISP_GET_OUTPUT_S)

#define CMD_DISP_SET_ALPHA      _IOW(HI_ID_DISP, IOC_DISP_SET_ALPHA, DISP_ALPHA_S)
#define CMD_DISP_GET_ALPHA      _IOWR(HI_ID_DISP, IOC_DISP_GET_ALPHA, DISP_ALPHA_S)

#define CMD_DISP_SET_OUTPUT_COLOR_SPACE      _IOW(HI_ID_DISP, IOC_DISP_SET_OUTPUT_COLOR_SPACE, DISP_COLORSPACE_S)
#define CMD_DISP_GET_OUTPUT_COLOR_SPACE      _IOWR(HI_ID_DISP, IOC_DISP_GET_OUTPUT_COLOR_SPACE, DISP_COLORSPACE_S)
#define CMD_DISP_SET_XDR_ENGINE              _IOW(HI_ID_DISP, IOC_DISP_SET_XDR_ENGINE, DISP_XDR_ENGINE_S)
#define CMD_DISP_GET_XDR_ENGINE              _IOWR(HI_ID_DISP, IOC_DISP_GET_XDR_ENGINE, DISP_XDR_ENGINE_S)

#define CMD_DISP_SET_SINK_CAPABILITY  _IOW(HI_ID_DISP, IOC_DISP_SET_SINK_CAPABILITY, DISP_SINK_CAPABILITY_S)
#define CMD_DISP_GET_OUTPUT_STATUS      _IOWR(HI_ID_DISP, IOC_DISP_GET_OUTPUT_STATUS, DISP_OUTPUT_STATUS_S)

#define CMD_DISP_SET_TECHNI_BRIGHT      _IOW(HI_ID_DISP, IOC_DISP_SET_TECHNI_BRIGHT, DISP_TECHNI_BRIGHT_S)
#define CMD_DISP_GET_TECHNI_BRIGHT      _IOWR(HI_ID_DISP, IOC_DISP_GET_TECHNI_BRIGHT, DISP_TECHNI_BRIGHT_S)

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __DRV_DISP_IOCTL_H__ */

