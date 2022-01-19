#ifndef __OMX_TUNNEL_H__
#define __OMX_TUNNEL_H__

#include "OMX_Types.h"
#include "OMX_VideoExt.h"

#include "gralloc_priv.h"

typedef struct
{
    OMX_U32 phyaddr;
    OMX_U32 length;
    OMX_U32 profile;
    OMX_U32 level;
    OMX_U32 dual_layer;
    OMX_U32 found_dolby_info_start_code;
    OMX_U32 rpu_assoc_flag;
    OMX_U32 valid;
} OMX_TUNNEL_CSD;

typedef struct
{
    HI_HANDLE client_player;
    HI_HANDLE play_handle;
    HI_HANDLE win_handle;
    ConfigureVideoTunnelModeParams config_param;
    native_handle_t native_handle;
} OMX_TUNNEL_INFO;

OMX_ERRORTYPE omx_tunnel_init(OMX_COMPONENTTYPE *pcomp, OMX_PTR pInitParam);
OMX_ERRORTYPE omx_tunnel_deinit(OMX_COMPONENTTYPE *pcomp);
OMX_ERRORTYPE omx_tunnel_enable(OMX_COMPONENTTYPE *pcomp);
OMX_ERRORTYPE omx_tunnel_disable(OMX_COMPONENTTYPE *pcomp);
OMX_ERRORTYPE omx_tunnel_start(OMX_COMPONENTTYPE *pcomp);
OMX_ERRORTYPE omx_tunnel_stop(OMX_COMPONENTTYPE *pcomp);
OMX_ERRORTYPE omx_tunnel_flush(OMX_COMPONENTTYPE *pcomp);
OMX_ERRORTYPE omx_tunnel_parse_csd(OMXVDEC_BUF_DESC *pBuffer, OMX_TUNNEL_CSD *csd);
OMX_ERRORTYPE omx_tunnel_config_avlay_dolbyhdr(OMX_COMPONENTTYPE *pcom_priv, OMXVDEC_BUF_DESC *pBuffer);
OMX_ERRORTYPE omx_tunnel_get_hdr_static_info(OMX_COMPONENTTYPE *pcomp, DescribeHDRStaticInfoParams *describe_hdr_static_info);
OMX_ERRORTYPE omx_tunnel_set_hdr_static_info(OMX_COMPONENTTYPE *pcomp, DescribeHDRStaticInfoParams *describe_hdr_static_info);
OMX_ERRORTYPE omx_tunnel_get_color_aspects(OMX_COMPONENTTYPE *pcomp, DescribeColorAspectsParams *describe_color_aspects_params);
OMX_ERRORTYPE omx_tunnel_set_color_aspects(OMX_COMPONENTTYPE *pcomp, DescribeColorAspectsParams *describe_color_aspects_params);

#ifdef HI_OMX_TEE_SUPPORT
OMX_ERRORTYPE omx_tunnel_secure_parse_csd(OMXVDEC_BUF_DESC *pBuffer, OMX_TUNNEL_CSD *pcsd);
#endif

#endif
