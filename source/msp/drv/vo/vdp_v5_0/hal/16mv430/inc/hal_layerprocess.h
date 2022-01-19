/******************************************************************************

  Copyright (C), 2001-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hal_layerprocess.h
  Version       : 1.0
  Created       : 2018/05/16
  Description   : 定义业务层与hal之间的接口
  Revision      : 1.0 发布

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
    //模式状态
    VDP_CYCBUF_DTV_MODE_E enDtvMode;         //dtv_mode ; 只有一个RW寄存器，是否需要一个RO寄存器
    HI_BOOL bResetEn;                        //reset_mode
    VDP_CYCBUF_RESET_MODE_E enResetMode;     //reset_en
    HI_BOOL bCurOnline;                      //on_off_mode

    //低带宽状态
    HI_U32 u32UnderloadSta;                      //VID_DTV_DEBUG3
    HI_U32 u32UnderloadCount;                //VID_DTV_DEBUG4

    //输入校验和debug
    HI_U32 u32YCheckSum;    // xdp in checksum
    HI_U32 u32CCheckSum;    // xdp in checksum

    //VDP_EchoDebugStatus  可参考逻辑的环境中的Debug，肯定不全

    //q帧当前逻辑状态
    HI_U32 u32NxtIndex ;//VID_DTV_CHANGE_INFO 下一节点Q帧信息,Q帧ID号

    HI_U32 u32NextNodeAddr;                  //VID_DTV_CFG_READY; WC 写清寄存器

    HI_U32 u32NextOnOffMode ;//VID_DTV_CHANGE_INFO 下一节点Q帧当前在线离线模式
    HI_U32 u32NextAddrMode ;//捞帧任务。
    HI_U32 u32NextBtmTask ;//
    HI_U32 u32nxt_top_task_typ ;//0:普通输出任务；1回写参考帧任务从DI回写；2回写参考帧任务从HPZME回写
    HI_U32 u32nxt_first_field_sel ;//隔行读时，优先输出场控制寄存器
    HI_U32 u32nxt_btm_disp_num ;//底场播放次数寄存器。
    HI_U32 u32nxt_top_disp_num ;//顶场播放次数寄存器。
    HI_U32 u32SendErr;//松针Err，送帧buffer已满还在送帧

    //还帧
    HI_U32 dtv_back_addr; //VID_DTV_BACK_ADDR 还帧buffer亮度地址
    HI_U32 u32VID_DTV_BACK_NUM ;//视频层DTV场景还帧个数寄存器。
    HI_U32 u32BackErr;//还帧Err，还帧buffer已满还在还帧

    //场景切换q帧地址状态
    HI_U32 u32ChangeAddr;  //VID_DTV_CHANGE_ADDR 下一节点的CFG地址，帧信息变化时上报的配置地址

    //disp 显示状态
    HI_U32 u32CurrentDispAddr;               //VID_DTV_DISP_ADDR 上报正在显示的亮度地址，即时寄存器。
    HI_U32 u32DispFrameCount;                //VID_DTV_DEBUG1 or VID_DTV_DEBUG6,需要逻辑确认哪个更好用 .内部可显示帧数量。
    HI_U32 u32DispCntReal;                //VID_DTV_DEBUG6 可显示帧数（不包含参考帧任务）。
    HI_U32 u32cur_index;                //VID_DTV_DEBUG7 当前节点Q帧ID号。
    HI_U32 u32cur_on_off_mode;                //VID_DTV_DEBUG7 当前在线离线模式。
    HI_U32 u32cur_addr_mode;                //VID_DTV_DEBUG7 捞帧任务。
    HI_U32 u32cur_btm_task_typ;                //VID_DTV_DEBUG7 Q帧任务。
    HI_U32 u32cur_top_task_typ;                //VID_DTV_DEBUG7 Q帧任务。

    HI_U32 u32cur_first_field_sel;                //VID_DTV_DEBUG7 隔行读时，优先输出场控制寄存器。
    HI_U32 u32cur_btm_disp_num;                //VID_DTV_DEBUG7 底场播放次数寄存器。
    HI_U32 u32cur_top_disp_num;                //VID_DTV_DEBUG7 顶场播放次数寄存器。

    //软复位状态
    HI_U32 VOSRSTSTA;                //VDP软复位测试寄存器。为1表示复位成功。
    HI_U32 cur_line_mode;                //当前在线离线状态寄存器
    HI_U32 LINE_SW_STATE;                //在线离线切换DEBUG寄存器。后续切换的时候再补充
    HI_U32 OFFLINE_INTSTA;                //    离线部分在线中断口中断状态，只读寄存器。再补充

    //vpss_ip状态
    HI_U32 src0_status0;                //    软复位状态寄存器。
    HI_U32 src0_status1;                //    软复位状态寄存器。
    HI_U32 src1_status0;                //    软复位状态寄存器。
    HI_U32 src1_status1;                //    软复位状态寄存器。
    HI_U32 src2_status0;                //    软复位状态寄存器。
    HI_U32 src2_status1;                //    软复位状态寄存器。
    HI_U32 stt_w_raddr;                //    STT回写通道上一帧DDR写出首地址。
    HI_U32 p1y_raddr;                //    通道输入亮度地址输出寄存器。
    HI_U32 p1c_raddr;                //    通道输入色度地址输出寄存器。
    HI_U32 p2y_raddr;                //    通道输入亮度地址输出寄存器。
    HI_U32 p2c_raddr;                //    通道输入色度地址输出寄存器。
    HI_U32 p3y_raddr;                //  通道输入亮度地址输出寄存器。
    HI_U32 p3c_raddr;                //    通道输入色度地址输出寄存器。
    HI_U32 rhism_raddr;                //    通道输入地址输出寄存器。
    HI_U32 rdm_cnt_raddr;                //    '通道输入地址输出寄存器。
    HI_U32 nr_rmad_raddr;                //'通道输入地址输出寄存器。
    HI_U32 snr_rmad_raddr;                //
    HI_U32 p2stath_raddr;                //
    HI_U32 p2statv_raddr;                //
    HI_U32 p2rgmv_raddr;                //
    HI_U32 p1rgmv_raddr;                //

    HI_U32 debug_sta1;                //硬件buf管理DEBUG STA寄存器1
    HI_U32 debug_sta2;                //硬件buf管理DEBUG STA寄存器2
    HI_U32 debug_sta3;                //硬件buf管理DEBUG STA寄存器3

    //para冲突
    HI_U32 para_conflict_sd;                //    PARA标清通道冲突清除寄存器。
    HI_U32 para_conflict_hd;                //    PARA高清通道冲突清除寄存器。
    //fifo状态
    HI_U32 u32VID_DTV_DEBUG2 ;//fifo state
    HI_U32 fi_start_pos;                //fi的状态机在有效区的前几行开始工作。
    HI_U32 para_busy_rd_sta;                //只读寄存器。start点到来时，para是否还没载完系数状态寄存器。
    HI_U32 rm_busy_rd_sta;                //只读寄存器。pre_start点到来时，rm是否运行完状态寄存器。
    //接口状态
    HI_U32 intf_under_flow;                //DHD0_STATE 低带宽信号。
    HI_U32 dhd_even;                //3D SG显示时，当前为3D的左眼或右眼标志信号
    HI_U32 count_int;                //DHD0中断统计计数器。每上报一次垂直时序中断加1。
    HI_U32 count_vcnt;                //DHD0显示行有效计数，起始0行：垂直前消隐到垂直后消隐为起始0行
    HI_U32 bottom_field;                //DHD0显示顶底场标识。
    HI_U32 vblank;                //DHD0显示消隐区标识。
    HI_U32 vback_blank;                //DHD0显示后消隐标识。
    HI_U32 DHD0_UF_STATE;                //DHD0每帧首次发生低带宽时，行号寄存器。
    HI_U32 ud_first_cnt;                //DHD0首次发生低带宽时，行号寄存器，注意此寄存器值是从后消影开始计算。

    //离线只读寄存器还未补全
    //中断状态寄存器还未补全
    //VPSS IP的状态还未补全
    //工作寄存器状态未补全
    //图形状态未补全
    //接口状态未补全

    //VID_DTV_BACK_PSW 还帧地址密码寄存器
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
    LAYER_FROST_CLOSE = 0x0 ,       /**<Close  */ /**<CNcomment:关闭 CNend*/
    LAYER_FROST_LOW         ,       /**<Low    */ /**<CNcomment:弱   CNend*/
    LAYER_FROST_MIDDLE      ,       /**<Middle */ /**<CNcomment:中   CNend*/
    LAYER_FROST_HIGH        ,       /**<High   */ /**<CNcomment:强   CNend*/

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
1，送帧接口内部的处理；
    a，把驱动决策出来的VPSS的初始化信息配置到逻辑，初始化信息包括buff的分割，
        初始化配置等等信息，该部分信息需要业务层依据芯片能力，并且从hal层获取
        到相应的信息，才能决策逻辑配置需要的信息，然后通过hal层接口配置即可；
    b，依据帧信息等软件帧节点生成配置逻辑需要的节点信息；
    c，送帧到逻辑，包括把节点que进去以及逐隔行、在线离线等信息，但是这些信息
        的计算全部放到业务层。
    d，在在线切换到离线的时候，内存的申请为业务层行为，hal层接口不参与；
    e，第一帧送进来的时候，PQ的初始化函数；
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
2，VPSS的完成中断的处理；
    VPSS每次完成处理，buff轮转、软算法计算，需要如何运行？
*/

/*
3，垂直时序中断的处理；
在线离线切换时候，在垂直时序中断内，需要控制在线离线切换流程，
保证此时不去响应用户属性变化。此时需要：
    a，逻辑提供接口查询当前逻辑状态，查询当前是否要做在线离线切换；
    b，要有接口配置下一步的逻辑需要的控制；
        在用户信息发生变化的时候，需要的接口同上。

*/
HI_VOID VDP_DRV_GetLayerState(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState);

HI_VOID  HW_BUF_GetUnderloadStatus(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState);
HI_VOID  HW_BUF_GetTotalBufStatus(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState);

/*
新增hal层播放控制接口
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

