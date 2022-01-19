/******************************************************************************

  Copyright (C), 2001-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hal_layerprocess.h
  Version       : 1.0
  Created       : 2018/05/16
  Description   : ����ҵ�����hal֮��Ľӿ�
  Revision      : 1.0 ����

******************************************************************************/
#ifndef __DRV_LAYERPROCESS_H__
#define __DRV_LAYERPROCESS_H__

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#include "hi_type.h"
#include "hi_drv_disp.h"
#include "hi_drv_video.h"
#include "vdp_drv_vid.h"
#include "drv_xdr_adapter.h"
#include "vdp_drv_comm.h"


typedef struct
{
    HI_BOOL bDispResoChange;
    HI_U32 u32VideoX;
    HI_U32 u32VideoY;
    HI_U32 u32VideoWth;
    HI_U32 u32VideoHgt;
    HI_U32 u32DispX;
    HI_U32 u32DispY;
    HI_U32 u32DispWth;
    HI_U32 u32DispHgt;
}VDP_CHANGEINFO_S;

typedef enum hiHW_ALG_DI_MODE_E
{
    ALG_MADI_MODE_INTERPOLATION = 0,
    ALG_MADI_MODE_INTERLEAVE,
    ALG_MADI_MODE_BUTT,
}HI_HW_ALG_DI_MODE_E;

/**********************for lowdelay start**************************/
typedef struct tagVDP_DRV_CAPACITY_S
{
    HI_BOOL  bSupportDolby;
    HI_BOOL  bSupportHdr10;
    HI_BOOL  bSupportHdr10Plus;
    HI_BOOL  bSupportHlg;
    HI_BOOL  bSupportSlf;
    HI_BOOL  bSupportTechnicolor;
    HI_BOOL  bSupportCompress;
    HI_BOOL  bSupportPIP;
    HI_U32   u32SupportPixFmtNum;
    HI_DRV_PIX_FORMAT_E *pPixFmtData;
    HI_U32   u32SupportColorSapceNum;
    HI_DRV_COLOR_SPACE_E *pstColorSpace;
} VDP_DRV_CAPACITY_S;

typedef struct tagVDP_DRV_RELEASE_FRAME_NODE_S
{
    HI_U32                 u32FrameIndex;
    HI_U32                 u32NodeAddr;
    HI_U32                 u32VPSSPQBaseAddr;
    HI_U32                 u32FrameAddr;
} VDP_DRV_RELEASE_FRAME_NODE_S;


#if 0
typedef struct tagVDP_DRV_LAYER_INFO_S
{
    //ģʽ״̬
    VDP_CYCBUF_DTV_MODE_E enDtvMode;         //dtv_mode ; ֻ��һ��RW�Ĵ������Ƿ���Ҫһ��RO�Ĵ���
    HI_BOOL bResetEn;                        //reset_mode
    VDP_CYCBUF_RESET_MODE_E enResetMode;     //reset_en
    HI_BOOL bCurOnline;                      //on_off_mode

    //�ʹ���״̬
    HI_U32 u32UnderloadSta;                      //VID_DTV_DEBUG3
    HI_U32 u32UnderloadCount;                //VID_DTV_DEBUG4

    //����У���debug
    HI_U32 u32YCheckSum;    // xdp in checksum
    HI_U32 u32CCheckSum;    // xdp in checksum

    //VDP_EchoDebugStatus  �ɲο��߼��Ļ����е�Debug���϶���ȫ

    //q֡��ǰ�߼�״̬
    HI_U32 u32NxtIndex ;//VID_DTV_CHANGE_INFO ��һ�ڵ�Q֡��Ϣ,Q֡ID��

    HI_U32 u32NextNodeAddr;                  //VID_DTV_CFG_READY; WC д��Ĵ���

    HI_U32 u32NextOnOffMode ;//VID_DTV_CHANGE_INFO ��һ�ڵ�Q֡��ǰ��������ģʽ
    HI_U32 u32NextAddrMode ;//��֡����
    HI_U32 u32NextBtmTask ;//
    HI_U32 u32nxt_top_task_typ ;//0:��ͨ�������1��д�ο�֡�����DI��д��2��д�ο�֡�����HPZME��д
    HI_U32 u32nxt_first_field_sel ;//���ж�ʱ��������������ƼĴ���
    HI_U32 u32nxt_btm_disp_num ;//�׳����Ŵ����Ĵ�����
    HI_U32 u32nxt_top_disp_num ;//�������Ŵ����Ĵ�����
    HI_U32 u32SendErr;//����Err����֡buffer����������֡

    //��֡
    HI_U32 dtv_back_addr; //VID_DTV_BACK_ADDR ��֡buffer���ȵ�ַ
    HI_U32 u32VID_DTV_BACK_NUM ;//��Ƶ��DTV������֡�����Ĵ�����
    HI_U32 u32BackErr;//��֡Err����֡buffer�������ڻ�֡

    //�����л�q֡��ַ״̬
    HI_U32 u32ChangeAddr;  //VID_DTV_CHANGE_ADDR ��һ�ڵ��CFG��ַ��֡��Ϣ�仯ʱ�ϱ������õ�ַ

    //disp ��ʾ״̬
    HI_U32 u32CurrentDispAddr;               //VID_DTV_DISP_ADDR �ϱ�������ʾ�����ȵ�ַ����ʱ�Ĵ�����
    HI_U32 u32DispFrameCount;                //VID_DTV_DEBUG1 or VID_DTV_DEBUG6,��Ҫ�߼�ȷ���ĸ������� .�ڲ�����ʾ֡������
    HI_U32 u32DispCntReal;                //VID_DTV_DEBUG6 ����ʾ֡�����������ο�֡���񣩡�
    HI_U32 u32cur_index;                //VID_DTV_DEBUG7 ��ǰ�ڵ�Q֡ID�š�
    HI_U32 u32cur_on_off_mode;                //VID_DTV_DEBUG7 ��ǰ��������ģʽ��
    HI_U32 u32cur_addr_mode;                //VID_DTV_DEBUG7 ��֡����
    HI_U32 u32cur_btm_task_typ;                //VID_DTV_DEBUG7 Q֡����
    HI_U32 u32cur_top_task_typ;                //VID_DTV_DEBUG7 Q֡����

    HI_U32 u32cur_first_field_sel;                //VID_DTV_DEBUG7 ���ж�ʱ��������������ƼĴ�����
    HI_U32 u32cur_btm_disp_num;                //VID_DTV_DEBUG7 �׳����Ŵ����Ĵ�����
    HI_U32 u32cur_top_disp_num;                //VID_DTV_DEBUG7 �������Ŵ����Ĵ�����

    //��λ״̬
    HI_U32 VOSRSTSTA;                //VDP��λ���ԼĴ�����Ϊ1��ʾ��λ�ɹ���
    HI_U32 cur_line_mode;                //��ǰ��������״̬�Ĵ���
    HI_U32 LINE_SW_STATE;                //���������л�DEBUG�Ĵ����������л���ʱ���ٲ���
    HI_U32 OFFLINE_INTSTA;                //    ���߲��������жϿ��ж�״̬��ֻ���Ĵ������ٲ���

    //vpss_ip״̬
    HI_U32 src0_status0;                //    ��λ״̬�Ĵ�����
    HI_U32 src0_status1;                //    ��λ״̬�Ĵ�����
    HI_U32 src1_status0;                //    ��λ״̬�Ĵ�����
    HI_U32 src1_status1;                //    ��λ״̬�Ĵ�����
    HI_U32 src2_status0;                //    ��λ״̬�Ĵ�����
    HI_U32 src2_status1;                //    ��λ״̬�Ĵ�����
    HI_U32 stt_w_raddr;                //    STT��дͨ����һ֡DDRд���׵�ַ��
    HI_U32 p1y_raddr;                //    ͨ���������ȵ�ַ����Ĵ�����
    HI_U32 p1c_raddr;                //    ͨ������ɫ�ȵ�ַ����Ĵ�����
    HI_U32 p2y_raddr;                //    ͨ���������ȵ�ַ����Ĵ�����
    HI_U32 p2c_raddr;                //    ͨ������ɫ�ȵ�ַ����Ĵ�����
    HI_U32 p3y_raddr;                //  ͨ���������ȵ�ַ����Ĵ�����
    HI_U32 p3c_raddr;                //    ͨ������ɫ�ȵ�ַ����Ĵ�����
    HI_U32 rhism_raddr;                //    ͨ�������ַ����Ĵ�����
    HI_U32 rdm_cnt_raddr;                //    'ͨ�������ַ����Ĵ�����
    HI_U32 nr_rmad_raddr;                //'ͨ�������ַ����Ĵ�����
    HI_U32 snr_rmad_raddr;                //
    HI_U32 p2stath_raddr;                //
    HI_U32 p2statv_raddr;                //
    HI_U32 p2rgmv_raddr;                //
    HI_U32 p1rgmv_raddr;                //

    HI_U32 debug_sta1;                //Ӳ��buf����DEBUG STA�Ĵ���1
    HI_U32 debug_sta2;                //Ӳ��buf����DEBUG STA�Ĵ���2
    HI_U32 debug_sta3;                //Ӳ��buf����DEBUG STA�Ĵ���3

    //para��ͻ
    HI_U32 para_conflict_sd;                //    PARA����ͨ����ͻ����Ĵ�����
    HI_U32 para_conflict_hd;                //    PARA����ͨ����ͻ����Ĵ�����
    //fifo״̬
    HI_U32 u32VID_DTV_DEBUG2 ;//fifo state
    HI_U32 fi_start_pos;                //fi��״̬������Ч����ǰ���п�ʼ������
    HI_U32 para_busy_rd_sta;                //ֻ���Ĵ�����start�㵽��ʱ��para�Ƿ�û����ϵ��״̬�Ĵ�����
    HI_U32 rm_busy_rd_sta;                //ֻ���Ĵ�����pre_start�㵽��ʱ��rm�Ƿ�������״̬�Ĵ�����
    //�ӿ�״̬
    HI_U32 intf_under_flow;                //DHD0_STATE �ʹ����źš�
    HI_U32 dhd_even;                //3D SG��ʾʱ����ǰΪ3D�����ۻ����۱�־�ź�
    HI_U32 count_int;                //DHD0�ж�ͳ�Ƽ�������ÿ�ϱ�һ�δ�ֱʱ���жϼ�1��
    HI_U32 count_vcnt;                //DHD0��ʾ����Ч��������ʼ0�У���ֱǰ��������ֱ������Ϊ��ʼ0��
    HI_U32 bottom_field;                //DHD0��ʾ���׳���ʶ��
    HI_U32 vblank;                //DHD0��ʾ��������ʶ��
    HI_U32 vback_blank;                //DHD0��ʾ��������ʶ��
    HI_U32 DHD0_UF_STATE;                //DHD0ÿ֡�״η����ʹ���ʱ���кżĴ�����
    HI_U32 ud_first_cnt;                //DHD0�״η����ʹ���ʱ���кżĴ�����ע��˼Ĵ���ֵ�ǴӺ���Ӱ��ʼ���㡣

    //����ֻ���Ĵ�����δ��ȫ
    //�ж�״̬�Ĵ�����δ��ȫ
    //VPSS IP��״̬��δ��ȫ
    //�����Ĵ���״̬δ��ȫ
    //ͼ��״̬δ��ȫ
    //�ӿ�״̬δ��ȫ

    //VID_DTV_BACK_PSW ��֡��ַ����Ĵ���
} VDP_DRV_LAYER_INFO_S;
#else

    typedef struct tagVDP_DRV_LAYER_INFO_S
    {
        HI_U32 u32QueueNodeCnts;
        HI_U32 u32DeQueueNodeCnts;
        HI_U32 u32TotalPlayCnts;
        HI_U32 u32UnloadPlayCnts;
}VDP_DRV_LAYER_INFO_S;

typedef struct hwBUFNODE_Infor_S
{
    HI_U32  u32FrameIndex;
    HI_U32  u32FrameAddr_Y;
    HI_U32  u32FrameAddr_C;
} HW_BUFNODE_Infor_S;
#endif

typedef struct hwALG_WBC_STATUS_INFOR_S
{
    HI_U32  u32P1RgmvAddr;
    HI_U32  u32P2RgmvAddr;
    HI_U32 *pu32AddrP1Vir;
    HI_U32 *pu32AddrP2Vir;
    HI_U32  u32Stride;
    HI_U32  u32SttAddr;
}HW_ALG_WBC_STATUS_INFOR_S;


typedef struct hwALG_WBC_CONFIG_INFOR_S
{
    /*this address is configured by queue, and will not enable when frame change.*/
    HI_U32  u32P1RgmvAddr;
    HI_U32  u32P2RgmvAddr;

    /*this address is configured by software alg module.*/
    HI_U32  u32SttAddr;

    /*this is for Software result.*/
    HI_U32  u32SoftAlgCaculateResult;
}HW_ALG_WBC_CONFIG_INFOR_S;



typedef struct tagVDP_DRV_Frame_INFO_S
{
    HI_DRV_VIDEO_FRAME_S stSrcFrameInfo;
    HI_DRV_DISP_STEREO_E eDispMode;
} VDP_DRV_Frame_INFO_S;

/****************************************************************************
Structures
*****************************************************************************/
/* NOTE: struct belowed amid to fix boot compile issue. */
typedef enum hiLAYER_FROST_E
{
    LAYER_FROST_CLOSE = 0x0 ,       /**<Close  */ /**<CNcomment:�ر� CNend*/
    LAYER_FROST_LOW         ,       /**<Low    */ /**<CNcomment:��   CNend*/
    LAYER_FROST_MIDDLE      ,       /**<Middle */ /**<CNcomment:��   CNend*/
    LAYER_FROST_HIGH        ,       /**<High   */ /**<CNcomment:ǿ   CNend*/

    LAYER_FROST_BUTT
} LAYER_FROST_E;

typedef enum tagTESTPATTERN_MODE
{
    TESTPATTERN_MODE_FIXED = 0 ,
    TESTPATTERN_MODE_RAND      ,
    TESTPATTERN_MODE_MOVE      ,
    TESTPATTERN_MODE_BUTT
} TESTPATTERN_MODE;

typedef enum tagTESTPATTERN_COLOR_MODE
{
    TESTPATTERN_COLOR_MODE_FIXED = 0 ,
    TESTPATTERN_COLOR_MODE_GRADIENT  ,
    TESTPATTERN_COLOR_MODE_BUTT
} TESTPATTERN_COLOR_MODE;

typedef enum tagTESTPATTERN_LINEWIDTH
{
    TESTPATTERN_LINEWIDTH_1PIX = 0 ,
    TESTPATTERN_LINEWIDTH_2PIX  ,
    TESTPATTERN_LINEWIDTH_BUTT
} TESTPATTERN_LINEWIDTH;

typedef struct tagLAYER_TESTPATTERN_S
{
    HI_BOOL                     bEnable;
    TESTPATTERN_MODE            enMode;
    TESTPATTERN_COLOR_MODE      enColorMode;
    TESTPATTERN_LINEWIDTH       enLineWidth;
    HI_U32                      u32Speed;
    HI_U32                      u32Seed;
} LAYER_TESTPATTERN_S;


typedef struct tagLAYERPROCESS_INFO_S
{
    //=========window=================
    HI_HANDLE              hWinHandle;         /* handle of window  */
    HI_BOOL                bWinEnable;         /* window status.    */
    HI_BOOL                bCloseHdr;         /* whether to close win's hdr function,just for show. */
    HI_U32                 u32Alpha;
    HI_U32                 u32AllAlpha;
    HI_U32                 u32Zorder;

    //=========layer ==================
    HI_U32                 u32LayerId;         /* window layer id.  */
    HI_U32                 u32RegionNo;
    HI_BOOL                bRegionEnable;
    HI_BOOL                bRegionMute;
    HI_BOOL                bFlipEn;
    HI_BOOL                bTnrOnVdp;
    DISP_MMZ_BUF_S         stLayerAlgMmz;
    HI_RECT_S              stIn;

    //=========buffer==================
    HI_DRV_COLOR_SPACE_E   enInCsc;            /* input color space*/
    HI_DRV_VIDEO_FRAME_S   *pCurrentFrame;
    HI_DRV_VIDEO_FRAME_S   *pNextFrame;

    //=========display=================
    HI_DRV_COLOR_SPACE_E   enOutCsc;           /* output color space */
    HI_DRV_DISP_OUT_TYPE_E enOutType;
    HI_DISP_DISPLAY_INFO_S *pstDispInfo;
    HI_RECT_S              stDisp;
    HI_RECT_S              stVideo;

    //=========extern use. such as pq=======
    HI_BOOL                bHdcpDegradePQ;
    HI_RECT_S              stHdcpIntermediateRect;
    LAYER_FROST_E          enLayerFrostMode;

    //=========add for 430=======
    LAYER_TESTPATTERN_S stTestPatternCfg;
    HI_BOOL             bInputCheckSumEn;
    HI_BOOL             bOfflineMode;
    HI_U32              u32TopFieldDispNumber;
    HI_U32              u32BottomFieldDispNumber;

    HW_NODE_RUNNING_CONFIG_S  stXdpNodeInfo;
} LAYERPROCESS_INFO_S;

/*
1����֡�ӿ��ڲ��Ĵ���
    a�����������߳�����VPSS�ĳ�ʼ����Ϣ���õ��߼�����ʼ����Ϣ����buff�ķָ
        ��ʼ�����õȵ���Ϣ���ò�����Ϣ��Ҫҵ�������оƬ���������Ҵ�hal���ȡ
        ����Ӧ����Ϣ�����ܾ����߼�������Ҫ����Ϣ��Ȼ��ͨ��hal��ӿ����ü��ɣ�
    b������֡��Ϣ�����֡�ڵ����������߼���Ҫ�Ľڵ���Ϣ��
    c����֡���߼��������ѽڵ�que��ȥ�Լ�����С��������ߵ���Ϣ��������Щ��Ϣ
        �ļ���ȫ���ŵ�ҵ��㡣
    d���������л������ߵ�ʱ���ڴ������Ϊҵ�����Ϊ��hal��ӿڲ����룻
    e����һ֡�ͽ�����ʱ��PQ�ĳ�ʼ��������
*/
VDP_DRV_CAPACITY_S *VDP_DRV_GetCapacity(HI_U32 u32LayerId);

HI_VOID VDP_DRV_PrepareLayerInfo(HI_U32 u32LayerId, VDP_DRV_RELEASE_FRAME_NODE_S *pstReleaseNode);

HI_S32 VDP_DRV_InitLayer(HI_U32 u32LayerId);

HI_S32 VDP_DRV_DeInitLayer(HI_U32 u32LayerId);

HI_S32 HW_BUF_QueueFrame(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstHalInputPara);

HI_S32 HW_DRV_DeQueueFrame(HI_U32 u32LayerId, VDP_DRV_RELEASE_FRAME_NODE_S *pstReleaseNode);


HI_S32 VDP_DRV_PqInit(HI_U32 u32LayerId, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_BOOL bNewScene);

HI_S32 VDP_DRV_PqDeInit(HI_U32 u32LayerId, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_BOOL bNewScene);
/*
2��VPSS������жϵĴ���
    VPSSÿ����ɴ���buff��ת�����㷨���㣬��Ҫ������У�
*/

/*
3����ֱʱ���жϵĴ���
���������л�ʱ���ڴ�ֱʱ���ж��ڣ���Ҫ�������������л����̣�
��֤��ʱ��ȥ��Ӧ�û����Ա仯����ʱ��Ҫ��
    a���߼��ṩ�ӿڲ�ѯ��ǰ�߼�״̬����ѯ��ǰ�Ƿ�Ҫ�����������л���
    b��Ҫ�нӿ�������һ�����߼���Ҫ�Ŀ��ƣ�
        ���û���Ϣ�����仯��ʱ����Ҫ�Ľӿ�ͬ�ϡ�

*/
HI_VOID VDP_DRV_GetLayerState(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState);

HI_VOID  HW_BUF_GetUnderloadStatus(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState);
HI_VOID  HW_BUF_GetTotalBufStatus(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState);

/*
����hal�㲥�ſ��ƽӿ�
*/
HI_VOID VDP_DRV_SetLayerPlayMode(HI_U32 u32LayerId, VDP_CYCBUF_DTV_MODE_E enDtvMode);
HI_BOOL HW_BUF_CheckResetFinish(HI_VOID);
HI_S32 HW_DRV_SetLayerResetMode(HI_U32 u32LayerId, HI_BOOL bResetEn, HI_DRV_WIN_SWITCH_E enResetMode);

HI_S32 VDP_DRV_GetLowdelayReleaseFrameNode(HI_U32 u32LayerId, VDP_DRV_RELEASE_FRAME_NODE_S *pstReleaseNode);

HI_VOID HW_ALG_POLICY_GetVpssBufferSize(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy,
                                                    XDP_VPSSIP_CHN_CFG_S *pstVpssIpChnCfg,
                                                    HI_U32 *pu32TotalBufSize,
                                                    HI_U32 *pu32OtherBufSize);

XDP_LAYER_VID_INFO_S *HW_BUF_GetLastHardwareConfig(HI_VOID);


HI_VOID HW_BUF_GetCurrentPlayFrameInfor(HI_U32 u32LayerId, HW_BUFNODE_Infor_S *pstCurrentFrameInfor);
HI_VOID HW_BUF_GetFramePrivateInfor(HI_U32 u32LayerId, HW_DYNAMIC_FrameInfor_S *pstCurrentFrameInfor);
HI_VOID HW_ALG_GetWbcConfig(HW_ALG_WBC_STATUS_INFOR_S *pstWbcStatus);
HI_VOID HW_ALG_SetWbcConfigParam(HW_ALG_WBC_CONFIG_INFOR_S *pstWbcSettings);

HI_VOID LAYERPROCESS_SetLayerEnable(HI_U32 eLayer, HI_BOOL bEnable);
HI_VOID LAYERPROCESS_GetLayerEnable(HI_U32 eLayer, HI_BOOL *pbEnable);
HI_VOID HW_VID_SetLayerMute(HI_U32 u32LayerID, HI_BOOL bEnable);
HI_VOID HW_ChangeApbConfig(HI_BOOL bOnline,VDP_CHANGEINFO_S *pstChangeInfor);
HI_VOID HW_BUF_SetStepMode(HI_U32 u32LayerId, HI_BOOL bhold_en);
HI_VOID HW_OfflineReset(HI_VOID);



#if 0
#define VO_KMALLOC(fmt...) HI_KMALLOC(HI_ID_VO, fmt)

#define VO_KFREE_SAFE(ptr) \
    do{\
        if (HI_NULL!=ptr)\
        {\
            HI_KFREE(HI_ID_VO, ptr);\
            ptr=HI_NULL;\
        }\
    }while(0)
#endif

#if 0
#define VO_CHECK_NULL_PTR_RE_NULL(ptr) \
    do{\
        if (NULL == (ptr)){\
            HI_ERR_WIN("%s ptr is NULL!\n",#ptr);\
            return;\
        }\
    }while(0)

#define VO_CHECK_NULL_PTR_RE_FAIL(ptr) \
    do{\
        if (NULL == ptr){\
            HI_ERR_WIN("%s ptr is NULL!\n",#ptr);\
            return HI_FAILURE;\
        }\
    }while(0)


#define VO_CHECK_OVER_RANGE_RE_FAIL(ID, MaxID) \
    do{\
        if (ID >= MaxID){\
            HI_ERR_WIN("[%d] over range!\n",ID);\
            return HI_FAILURE;\
        }\
    }while(0)


#endif

/**********************for lowdelay end**************************/
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */


#endif

