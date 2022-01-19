#ifndef __DRV_WBC_H__
#define __DRV_WBC_H__
#include "vdp_define.h"
#include "vdp_hal_wbc.h"
#include "vdp_drv_comm.h"

#include "vdp_drv_vid.h"

typedef enum tagVDP_WBC_ADDR_E
{
    VDP_ADDR_WBCVP0 = 0,
    VDP_ADDR_WBCDHD0 ,
    VDP_ADDR_WBC_BUTT

}VDP_WBC_ADDR_E;


typedef enum tagVDP_WBC_DITHER_MODE_E
{
    VDP_WBC_DITHER_MODE_8BIT_OUT  = 0,
    VDP_WBC_DITHER_MODE_10BIT_OUT ,
    VDP_WBC_DITHER_MODE_BUTT

}VDP_WBC_DITHER_MODE_E;


typedef struct tagVDP_LAYER_WBC_INFO_S
{
    HI_BOOL                        bWbcLayerEn;
    VDP_DISP_MODE_E      enDispMode;
    HI_BOOL            bP2iEn;

    HI_BOOL  bZmeHorEnable;   /* zme  enable of horizontal : 0-off; 1-on */
    HI_BOOL  bZmeVerEnable;   /* zme  enable of vertical     : 0-off; 1-on */

    HI_BOOL   bZmeFirHL;       /* zme mode of horizontal luma     : 0-copy mode; 1-FIR filter mode */
    HI_BOOL   bZmeFirHC;       /* zme mode of horizontal chroma  : 0-copy mode; 1-FIR filter mode */
    HI_BOOL   bZmeFirVL;       /* zme mode of vertial luma          : 0-copy mode; 1-FIR filter mode */
    HI_BOOL   bZmeFirVC;       /* zme mode of vertial chroma      : 0-copy mode; 1-FIR filter mode */

    HI_BOOL      bZmeMedH;         /* zme Median filter enable of horizontal luma: 0-off; 1-on */
    HI_BOOL      bZmeMedV;
    HI_BOOL   bZmeDefault;   /* 1:rwzb; 0:no rwzb */

    HI_BOOL   bZmeFrmFmtIn;     /* Frame format for zme input: 0-field; 1-frame */
    HI_BOOL   bZmeFrmFmtOut;    /* Frame format for zme Output: 0-field; 1-frame */
    HI_BOOL   bZmeBFIn;         /* Input field polar when input is field format: 0-top field; 1-bottom field */
    HI_BOOL   bZmeBFOut;        /* Output field polar when Output is field format: 0-top field; 1-bottom field */

    HI_S32   s32ZmeOffsetHL;
    HI_S32   s32ZmeOffsetHC;
    HI_S32   s32ZmeOffsetVL;
    HI_S32   s32ZmeOffsetVC;
    HI_S32   s32ZmeOffsetVLBtm;
    HI_S32   s32ZmeOffsetVCBtm;
    VDP_WBC_DITHER_MODE_E       enWbcDitherMode;
    VDP_ADDR_S                    stAddr[VDP_ADDR_WBC_BUTT] ;
    HI_BOOL bSecure;
    HI_BOOL bSmmu;
    VDP_WBC_OFMT_E                  enOutFmt;
    VDP_RECT_S                     stInRect;
    VDP_RECT_S                     stCropRect;
    VDP_RECT_S                    stVideoRect;
    VDP_RECT_S                    stOutRect;
    HI_U32                        u32OutIop;
    VDP_LAYER_CONN_E                enWbcVpConnPoint;

    VDP_VID_IFMT_E            enInFmt;
    HI_PQ_ZME_COEF_ADD_S stZmeAddr; /* zme coef add */
}VDP_LAYER_WBC_INFO_S;

HI_S32 VDP_DRV_SetWbcLayer(HI_U32 u32LayerId, VDP_LAYER_WBC_INFO_S *pstInfo);

#endif
