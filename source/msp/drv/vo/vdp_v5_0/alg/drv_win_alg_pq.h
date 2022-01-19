/******************************************************************************

  Copyright (C), 2001-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_win_alg_pq.h
  Version       : Initial Draft
  Author        :
  Created       : 2018/5/30
  Last Modified :
  Description   : drv_win_alg_pq.c header file
  Function List :
  History       :
  1.Date        : 2018/5/30
    Author      : zhangtao 00178013
    Modification: Created file

******************************************************************************/
#ifndef __DRV_WIN_ALG_PQ_H__
#define __DRV_WIN_ALG_PQ_H__

#include "drv_win_alg_osal.h"

/*----------------------------------------------*
 * external variables                           *
 *----------------------------------------------*/

/*----------------------------------------------*
 * external routine prototypes                  *
 *----------------------------------------------*/

/*----------------------------------------------*
 * internal routine prototypes                  *
 *----------------------------------------------*/

typedef struct hiXDP_PQ_LIST_S_tag
{
    HI_BOOL bInit;
    XDP_OSAL_SPIN stSpinLock;
    HI_U32 u32ListNodeCnt;
    LIST stEmptyList;
    LIST stFullList;
    hiXDP_OSAL_MEM_S stMemInfo;

    HI_U32 u32CompleteCount;

    HI_U32 u32FullListAddTryCnt;
    HI_U32 u32FullListAddOkCnt;
    HI_U32 u32FullListDelTryCnt;
    HI_U32 u32FullListDelOkCnt;
    HI_U32 u32FullListCheckTryCnt;
    HI_U32 u32FullListCheckOkCnt;

    HI_U32 u32EmptyListAddTryCnt;
    HI_U32 u32EmptyListAddOkCnt;
    HI_U32 u32EmptyListDelTryCnt;
    HI_U32 u32EmptyListDelOkCnt;
    HI_U32 u32EmptyListCheckTryCnt;
    HI_U32 u32EmptyListCheckOkCnt;
} hiXDP_PQ_LIST_S;

typedef struct hiXDP_PQ_LIST_NODE_S_tag
{
    HI_VOID *pData;
    LIST node;
} hiXDP_PQ_LIST_NODE_S;


typedef struct hiXDP_PQ_LIST_ATTR_S_tag
{
    HI_U32  u32NodeCount;
    HI_BOOL bAddr;
    HI_BOOL bRgmv;
    HI_BOOL bRegAddr;
    HI_BOOL bFrameInfo;
} hiXDP_PQ_LIST_ATTR_S;



typedef struct hiXDP_PQ_RGMV_S_tag
{
    HI_U32 u32AddrP1;
    HI_U32 u32AddrP2;
    HI_U32 *pu32AddrP1Vir;
    HI_U32 *pu32AddrP2Vir;
    HI_U32 u32Stride;
} hiXDP_PQ_RGMV_S;




typedef struct hiXDP_PQ_ThreadInfo_S_tag
{
    struct task_struct  *pstThread;
    KERN_EVENT_S stNextFrame;
    KERN_EVENT_S stEventStop;
    XDP_OSAL_SPIN stSplock;
    HI_U32 u32NextFrameGap;
    HI_U32 u32Pos;
    HI_BOOL bNeedSleep;
    HI_BOOL bExit;
    HI_BOOL bEnable;
    HI_BOOL bInit;
#ifdef XDP_SUPPORT_MEM_MAGIC
    HI_BOOL bMagicEnable;
#endif

#ifdef XDP_SUPPORT_ALG_STAT
    HI_U32 ulISRLastCheckTime;
    HI_U32 u32ISRHz;
    HI_U32 ulTaskLastCheckTime;
    HI_U32 u32TaskHz;
    HI_U32 u32ISRCycleLast;
    HI_U32 u32TaskCycleLast;
#endif
    HI_U32 u32ExitCycle;
    HI_U32 u32RepeatCycle;
    HI_U32 u32RwzbCycle;
    HI_U32 u32DisableCycle;
    HI_U32 u32IdleCycle;
    HI_U32 u32ReInitCycle;
    HI_DRV_WIN_FIELDORDER_E eFieldOrder;


    HI_U32 u32ISRCycle;
    HI_U32 u32ReloadTryCnt;
    HI_U32 u32ReloadOkCnt;
    HI_U32 u32BufFullGet;
    HI_U32 u32BufFullUnderload;
    HI_U32 u32MatchBuf;
    HI_U32 u32MisMatchBuf;
    HI_U32 u32BufEmptyGet;
    HI_U32 u32BufEmptyUnderload;


    HI_U32 u32TaskCycle;
    HI_U32 u32AlgTry;
    HI_U32 u32AlgOk;
    HI_U32 u32ParaFullGet;
    HI_U32 u32ParaFullUnderload;
    HI_U32 u32ParaMisMatch;
    HI_U32 u32ParaMatch;
    HI_U32 u32ParaUseLast;
    HI_U32 u32ParaEmptyGet;
    HI_U32 u32ParaEmptyUnderload;
    HI_U32 u32ParaRunInISR;
    HI_U32 u32ParaRetryOk;

} hiXDP_PQ_ThreadInfo_S;

/*----------------------------------------------*
 * project-wide global variables                *
 *----------------------------------------------*/

/*----------------------------------------------*
 * module-wide global variables                 *
 *----------------------------------------------*/

/*----------------------------------------------*
 * constants                                    *
 *----------------------------------------------*/

/*----------------------------------------------*
 * macros                                       *
 *----------------------------------------------*/

/*----------------------------------------------*
 * routines' implementations                    *
 *----------------------------------------------*/
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

extern HI_S32 Win_PQAlgClear(HI_VOID);
extern HI_S32 Win_PQAlgDeInit(HI_VOID);
extern HI_S32 Win_PQAlgEnable(HI_BOOL bEnable);
extern HI_S32 Win_PQAlgInit(HI_VOID);
extern HI_S32 Win_PQAlgStart(HI_VOID);
extern HI_S32 Win_PQAlgStop(HI_VOID);
extern HI_S32 Win_PQAlgEnableMagic(HI_BOOL bEnable);
extern HI_DRV_WIN_FIELDORDER_E Win_PQAlg_GetFodResult(HI_VOID *pstWin);
extern HI_VOID Win_PQAlg_ShowTimeStat(struct seq_file *p, hiXDP_PQ_LIST_S *pstList);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */


#endif /* __DRV_WIN_ALG_PQ_H__ */
