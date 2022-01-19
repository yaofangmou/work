#ifndef __VDP_DRV_HAL_COMMON_H_
#define __VDP_DRV_HAL_COMMON_H_

#include "drv_disp_osal.h"


typedef enum hiXDP_HAL_STATUS_E
{
    XDP_HAL_STATUS_ONLINE = 0x0 ,       /**<Close  */ /**<CNcomment:纯在线 CNend*/
    XDP_HAL_STATUS_OFFLINE      ,  /**<Low    */ /**<CNcomment:通用离线CNend*/

    XDP_HAL_STATUS_BUTT
}XDP_HAL_STATUS_E;

typedef enum hiXDP_ACTIVE_REF_MODE_E
{
    XDP_ACTIVE_REF_NULL = 0x0 ,       /**<Close  */ /**<CNcomment:纯在线 CNend*/
    XDP_ACTIVE_REF_DI = 0x1 ,  /**<Low    */ /**<CNcomment:通用离线CNend*/
    XDP_ACTIVE_REF_HPZME = 0x3 ,

    XDP_ACTIVE_REF_BUTT
}XDP_ACTIVE_REF_MODE_E;

typedef struct tagXDP_LAYER_VPSSIP_CFG_S
{
    HI_BOOL bCcsEn;
    HI_BOOL bClsEn;
    HI_BOOL bVc1En;

    HI_U32 u32VpssBufStartAddr;
    HI_U32 u32VpssBufVirtStartAddr;

    HI_U32 u32VpssOutStartAddr;
    HI_U32 u32VpssOutVirtStartAddr;
} XDP_LAYER_VPSSIP_CFG_S;

typedef struct hwDYNAMIC_FrameInfor_S
{
    HI_U32  u32DynamicFrameIndex;
    HI_BOOL bRWZB;
    HI_BOOL bFastForward;
    HI_BOOL bFastRefMode;
    HI_BOOL bOfflineMode;          //1 在线离线的状态标志
    HI_BOOL bProgressive;        //逐行隔行标志,读寄存器获取
    HI_U32  u32Width;            //图像宽度,读寄存器获取
    HI_U32  u32Height;           //图像高度,读寄存器获取
    HI_U32  u32BitWidth;         //位宽,读寄存器
    HI_U32  u32FrameRate;        //帧率,根据帧信息查询,不保证即时
    HI_S32  s32FieldMode;        //lm_rmode寄存器。
    HI_U32  u32FieldOrder;       //顶场优先, 读寄存器

    HI_U32  u32VpssChnAddr;
    HI_U32  u32VpssChnVirtAddr;

    HI_BOOL bDeiEn;
    HI_BOOL bTnrEn;
    HI_BOOL bMcnrEn;
    HI_BOOL bSnrEn;
    HI_BOOL bDbEn;               //读寄存器
    HI_BOOL bDmEn;               //读寄存器
}HW_DYNAMIC_FrameInfor_S;

typedef struct hiXDP_NODE_PRIVATE_DEBUG_INFOR_S
{
    HW_DYNAMIC_FrameInfor_S stTopFrameInfo;
    HW_DYNAMIC_FrameInfor_S stBottomFrameInfo;
}HW_NODE_PRIVATE_DEBUG_INFOR_S;

typedef struct hiXDP_NODE_INFO_S
{
    HI_U32   u32Index;
    HI_BOOL   bFastforward;

    /*eos of file*/
    HI_BOOL   bLastFrame;

    /*when fastforward etc, just turn off softwareAlg.*/
    HI_BOOL  bDisableSoftwareAlg;

    /*progressive or user setting, just turn off Dei.*/
    HI_BOOL  bClearResetMuteFlag; //no use

    /*when change, mute the alg*/
    HI_BOOL  bMuteSoftwareAlgBuf; //no use

    HI_BOOL  bCompactAccess;

    /*switch online or offline.*/
    XDP_HAL_STATUS_E  enOnOffLineMode; // 加个枚举，在线和离线、通用离线

    HI_BOOL  bMaskEn;
    HI_BOOL  bApbConfig;
    HI_BOOL  bFreezeEn;
    HI_U32                  u32TopPlaycnts; // U8
    HI_U32                  u32BottomPlaycnts; //U8

    XDP_ACTIVE_REF_MODE_E   enTopActiveRefMode;
    XDP_ACTIVE_REF_MODE_E   enBottomActiveRefMode;

    DISP_MMZ_BUF_S         *pstXdpNodeAddr;
    DISP_MMZ_BUF_S         *pstXdpPqBaseAddr;

    HW_NODE_PRIVATE_DEBUG_INFOR_S *pstXdpNodePrivateInfor;

    XDP_LAYER_VPSSIP_CFG_S        stXdpVpssIpCfg   ;

} HW_NODE_RUNNING_CONFIG_S;

#endif


