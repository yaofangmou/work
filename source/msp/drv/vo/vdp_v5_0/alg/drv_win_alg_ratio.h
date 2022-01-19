
#ifndef __VDP_ALG_RATIO_H__
#define __VDP_ALG_RATIO_H__
//#include"vpss_common.h"
#include"hi_drv_video.h"

#define VDP_HEIGHT_ALIGN 0xfffffffe
#define VDP_WIDTH_ALIGN 0xfffffffe
#define ALG_RATIO_PIX_RATIO1 1024


typedef enum tagVDP_ALG_RATIO_CROP_E
{
    VDP_ALG_RATIO_CROP_FDRV0 = 0x0,
    VDP_ALG_RATIO_CROP_FDRVF,
    VDP_ALG_RATIO_CROP_FDRV1,
    VDP_ALG_RATIO_CROP_1,       //����vpss�ڵ�crop
    VDP_ALG_RATIO_CROP_2,       //����ͨ·letterboxǰ��1���ض���ʹ��
    VDP_ALG_RATIO_CROP_3,       //�����дͨ·crop
    VDP_ALG_RATIO_CROP_4,       //v1��crop,1���ض���
    VDP_ALG_RATIO_CROP_BUTT
} VDP_ALG_RATIO_CROP_E;


typedef enum tagVDP_ALG_RATIO_LBOX_E
{
    VDP_ALG_RATIO_LBOX1 = 0x0, //hd letterbox
    VDP_ALG_RATIO_LBOX2,        //wbc-dhd letterbox
    VDP_ALG_RATIO_LBOX3,        ////v1 letterbox

    VDP_ALG_RATIO_LBOX_BUTT
} VDP_ALG_RATIO_LBOX_E;



typedef struct tagVDP_ALG_RATIO_USR_ASPECTRATIO_S
{
    HI_BOOL bUserDefAspectRatio;
    HI_U32 u32UserAspectWidth;
    HI_U32 u32UserAspectHeight;
} VDP_ALG_RATIO_USR_ASPECTRATIO_S;

typedef struct tagVDP_ALG_RATIO_RECTASP_S
{
    HI_RECT_S stRect;
    HI_U32 u32AspectWidth;
    HI_U32 u32AspectHeight;
} VDP_ALG_RATIO_RECTASP_S;

typedef struct
{
#if 0
    HI_U32 u32SrcAspectWidth;
    HI_U32 u32SrcAspectHeight;
    HI_U32 DeviceAspWidth;
    HI_U32 DeviceAspHeight;
    HI_DRV_ASP_RAT_MODE_E eAspMode;
    VDP_ALG_RATIO_USR_ASPECTRATIO_S stUsrAsp;
    HI_RECT_S stInRect;
    HI_RECT_S stDispRect;
    HI_RECT_S stOutWnd;
    HI_RECT_S stScreen;
#endif
    HI_DRV_ASP_RAT_MODE_E eAspMode;
    VDP_ALG_RATIO_USR_ASPECTRATIO_S stUsrAsp;
    VDP_ALG_RATIO_RECTASP_S stDispRect;         //Դ�����asp
    VDP_ALG_RATIO_RECTASP_S stInRect;           //disprect + user crop֮��rect
    HI_RECT_S stOutWnd;
    VDP_ALG_RATIO_RECTASP_S stScreen;           //�豸�Ŀ����asp
    HI_BOOL bPause;
} VDP_ALG_RATIO_DRV_PARA_S;

typedef struct
{
#if 0
    HI_RECT_S stCropWnd;
    HI_RECT_S stVideoWnd;
    HI_RECT_S stOutWnd;
    HI_U32 u32ZmeH;
    HI_U32 u32ZmeW;
    HI_BOOL bEnAsp;
    HI_BOOL bEnCrop;
    HI_U32 u32BgColor;
    HI_U32 u32BgAlpha;
#endif
    HI_RECT_S stCropWnd;    //�ü�����
    HI_U32 u32ZmeH;
    HI_U32 u32ZmeW;
    HI_RECT_S stVideoWnd;   // //���ź�����,����zme�������С��,letterbox�ļӺڱ�x,y
    HI_RECT_S stOutWnd;     //�����������,�ѼӺڱ�
    HI_BOOL bEnCrop;

    VDP_ALG_RATIO_CROP_E enCropId;
    VDP_ALG_RATIO_LBOX_E enLboxId;

    VDP_ALG_RATIO_RECTASP_S stOutBufRect;       //���߲��ֵ����buf rect
    VDP_ALG_RATIO_RECTASP_S stWBC1Rect;         //��д��1
    VDP_ALG_RATIO_RECTASP_S stWBC2Rect;         //��д��2

} VDP_ALG_RATIO_OUT_PARA_S;


HI_S32 VDP_ALG_RATIO_RatioProcess(VDP_ALG_RATIO_DRV_PARA_S *pstDrvPara, VDP_ALG_RATIO_OUT_PARA_S *pstOutPara);

HI_VOID VDP_ALG_RATIO_LetterBox(HI_U32 AspectRatioW, HI_U32 AspectRatioH, HI_RECT_S *pOutWnd, HI_S32 pixr1_out);
HI_VOID VDP_ALG_RATIO_CorrectAspectRatioW_H(HI_U32 *pw, HI_U32 *ph);

#endif /*__ALG_ASP_H__*/
