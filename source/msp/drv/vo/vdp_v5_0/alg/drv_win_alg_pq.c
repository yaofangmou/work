#include <linux/wait.h>
#include <linux/sched.h>
#include <linux/semaphore.h>
#include <linux/spinlock.h>
#include <linux/fs.h>
#include <linux/mm.h>
#include <linux/rwlock.h>
#include <asm/uaccess.h>
#include "hi_type.h"
#include "hi_osal.h"
#include "hi_math.h"
#include "hi_common.h"
#include "hi_drv_log.h"
#include "hi_drv_mmz.h"
#include "hi_drv_video.h"
#include "drv_pq_ext.h"
#include "drv_disp_osal.h"
#include "hi_drv_disp.h"
#include "drv_display.h"
#include "hi_drv_proc.h"
#include "vdp_hal_comm.h"
#include "drv_win_hal.h"
#include "drv_win_alg_pq.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif


#ifdef XDP_SUPPORT_ALG_STAT

#define PQ_ALG_TIMESTAMP_RUNCNT 3
#define PQ_ALG_TIMESTAMP_RESERVE 1 //reserve for first time
#define PQ_ALG_TIMESTAMP_CNT (PQ_ALG_TIMESTAMP_RUNCNT+PQ_ALG_TIMESTAMP_RESERVE)

typedef struct hiXDP_PQ_Stat_S_tag
{
    HI_ULONG aulCfgLogicRun[PQ_ALG_TIMESTAMP_CNT];
    HI_ULONG aulFrmEndInt[PQ_ALG_TIMESTAMP_CNT];
    HI_ULONG aulThreadStart[PQ_ALG_TIMESTAMP_CNT];
    HI_ULONG aulAlgStart[PQ_ALG_TIMESTAMP_CNT];
    HI_ULONG aulAlgEnd[PQ_ALG_TIMESTAMP_CNT];

    HI_ULONG ulMax;
    HI_ULONG ulMin;
    HI_ULONG ulAvg;
    HI_ULONG ulTotal;
    HI_U32 u32Cnt;
    HI_U32 u32Idx;
} hiXDP_PQ_Stat_S;
#endif

typedef struct hiXDP_PQ_Buf_S_tag
{
    hiXDP_OSAL_MEM_S stAddr;
    hiXDP_PQ_RGMV_S stRgmv;
    hiXDP_OSAL_MEM_S stRegAddr;
    HW_DYNAMIC_FrameInfor_S stFrameInfo;
#ifdef XDP_SUPPORT_ALG_STAT
    hiXDP_PQ_Stat_S stStat;
#endif
    HI_U32 u32Index;
} hiXDP_PQ_Buf_S;

typedef struct hiXDP_PQ_MEM_BASE_S_tag
{
    hiXDP_OSAL_MEM_S stMemInfo;
    HI_U32 u32PhyAddr_BASE;
    HI_U8  *pu8VirAddr_BASE;

    HI_U32 u32PhyAddr_CUR;
    HI_U8  *pu8VirAddr_CUR;
    HI_U32 u32CurrSize;
    HI_BOOL bInit;
} hiXDP_PQ_MEM_BASE_S;

typedef hiXDP_PQ_Buf_S hiXDP_PQ_Para_S;
#define XDP_OSAL_ALIGN(base, align) ((((base) + (align - 1)) / (align)) * (align))
#define XDP_SOFTALG_PARA_SIZE  ((sizeof(S_VPSSIP_ALG_SET_REGS_TYPE) + 15) & 0xFFFFFFF0)
#define XDP_SOFTALG_BUF_SIZE ((sizeof(S_VPSS_STT_REGS_TYPE) + 15) & 0xFFFFFFF0)
#define XDP_VPSS_ALG_REG_BUF_SIZE ((sizeof(S_VPSSIP_ALG_SET_REGS_TYPE) + 15) & 0xFFFFFFF0)
#define XDP_SOFTALG_PARA_NODE_CNT 3
#define XDP_SOFTALG_BUF_NODE_CNT 3
#define XDP_SOFTALG_ADRR_ALIGN 16

#define XDP_VIRTUAL_FRAMEINFO
#define XDP_SOFTALG_BASEMEM_SUPPORT


static HI_VOID ConfigLogic(hiXDP_PQ_Buf_S *pstBuf, hiXDP_PQ_Para_S *pstPara);

static HI_VOID SoftAlgCacl(hiXDP_PQ_Buf_S *alg_r_buf,
                           hiXDP_PQ_Para_S *alg_w_para);
static hiXDP_PQ_LIST_NODE_S   *FindMatchedInputParamNodeForlogic(HI_VOID);
static hiXDP_PQ_LIST_NODE_S   *FindUsefulBufNodeForLogic(HI_VOID);
static HI_U32 GetCurFrameIdISR(HI_VOID);
static HI_U32 GetCurFrameIdThread(HI_VOID);
hiXDP_PQ_Buf_S *GetDefaultAlgCoefPtr(HI_VOID);
static HI_BOOL GetFrameInitFlag(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo);
static HI_BOOL GetSoftAlgEnableFlag(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo);
static HI_BOOL GetSoftAlgTurnOffFlag(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo);
static HI_VOID  Get_CurFrameInfo(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo);
static HI_S32 InitDefaultAlgCoef(HI_VOID);
static HI_VOID   SetDefaultAlgCoef(hiXDP_PQ_LIST_NODE_S *pstSoftOutputPara);
HI_S32 Win_PQAlgDeInit(HI_VOID);
HI_S32 Win_PQAlgEnable(HI_BOOL bEnable);
static  HI_S32  Win_PQAlgFirstFrameInit(HI_VOID);
HI_S32 Win_PQAlgInit(HI_VOID);
HI_S32 Win_PQAlgStart(HI_VOID);
HI_S32 Win_PQAlgStop(HI_VOID);
HI_S32 Win_PQAlg_BufListAddEmpty(hiXDP_PQ_LIST_S *pstList,
                                 hiXDP_PQ_LIST_NODE_S *pNode);
HI_S32 Win_PQAlg_BufListAddFull(hiXDP_PQ_LIST_S *pstList,
                                hiXDP_PQ_LIST_NODE_S *pNode);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListCheckEmpty(hiXDP_PQ_LIST_S *pstList);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListCheckFull(hiXDP_PQ_LIST_S *pstList);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListDelEmpty(hiXDP_PQ_LIST_S *pstList);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListDelFull(hiXDP_PQ_LIST_S *pstList);
HI_BOOL Win_PQAlg_CheckFrameBufMatch(hiXDP_PQ_Buf_S *pstNextBuf, HI_U32 u32FrameId);
HI_BOOL Win_PQAlg_CheckFrameParaMatch(hiXDP_PQ_Para_S *pstNextPara, HI_U32 u32FrameId);
HI_S32 Win_PQAlg_CommonListDeInit(hiXDP_PQ_LIST_S *pstList);
HI_S32 Win_PQAlg_CommonListInit(hiXDP_PQ_LIST_S *pstList, hiXDP_PQ_LIST_ATTR_S *
                                pstAttr);
HI_VOID Win_PQAlg_FreeListResouce(hiXDP_PQ_LIST_S *pstList);
HI_U32 Win_PQAlg_GetCurFrameId(HI_VOID);
HI_VOID Win_PQAlg_ISR(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
HI_S32 Win_PQAlg_ParaListAddEmpty(hiXDP_PQ_LIST_S *pstList,
                                  hiXDP_PQ_LIST_NODE_S *pNode);
HI_S32 Win_PQAlg_ParaListAddFull(hiXDP_PQ_LIST_S *pstList,
                                 hiXDP_PQ_LIST_NODE_S *pNode);
hiXDP_PQ_LIST_NODE_S   *Win_PQAlg_ParaListCheckEmpty(hiXDP_PQ_LIST_S *pstList);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_ParaListCheckFull(hiXDP_PQ_LIST_S *pstList);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_ParaListDelEmpty(hiXDP_PQ_LIST_S *pstList);
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_ParaListDelFull(hiXDP_PQ_LIST_S *pstList);
HI_S32 Win_PQAlg_ResetList(HI_VOID);
HI_VOID Win_PQAlg_SetDIMode(HI_VOID);
HI_VOID Win_PQAlg_ShowListState(struct seq_file *p, hiXDP_PQ_LIST_S *pstList);
HI_VOID Win_PQAlg_ShowTaskState(struct seq_file *p);
HI_S32 Win_PQAlg_Task(HI_VOID *pArg);
HI_VOID Win_PQAlg_WakeUp(HI_VOID);
HI_VOID printframeinfo(HW_DYNAMIC_FrameInfor_S *pstCurFrameInfo);
static HI_S32 InitLogicWBC(HI_VOID);
static HI_VOID GetAlgCtrlInfo(hiXDP_PQ_Buf_S *pstBuf);
static HI_VOID GetRGMEInfo(hiXDP_PQ_RGMV_S *pstRgmv);
static HI_S32 Win_PQAlg_AlgProcess(hiXDP_PQ_LIST_S *pstPQListBuf,
                                   hiXDP_PQ_LIST_S *pstPQListPara,
                                   hiXDP_PQ_ThreadInfo_S *pstPQAlgInfo,
                                   HI_U32 u32FrameId, HI_ULONG ulThreadStart);
static HI_S32 PQAlg_AllocateMemFromBase(hiXDP_OSAL_MEM_S *pstAddr);
static HI_S32 PQAlg_DeInitBaseMem(HI_VOID);
static HI_S32 PQAlg_FreeMemToBase(hiXDP_OSAL_MEM_S *pstAddr);
static HI_S32 PQAlg_InitBaseMem(HI_VOID);


extern HI_S32 VDP_DRV_StartLogic(HI_U32 u32LayerId);
extern volatile S_VDP_REGS_TYPE *pVdpReg;


hiXDP_PQ_ThreadInfo_S g_stPQAlgInfo = {0};
hiXDP_PQ_LIST_S g_stPQListBuf = {0};
hiXDP_PQ_LIST_S g_stPQListPara = {0};
hiXDP_PQ_Buf_S g_stPQDefAlgCoef = {{{0}}};
hiXDP_PQ_MEM_BASE_S g_stPQAlgBaseMem = {{{0}}};
HI_PQ_FRAME_INFO_S g_stPQFrameInfo = {0};
HW_DYNAMIC_FrameInfor_S g_stPQCurFrameInfo = {0};

hiXDP_PQ_LIST_NODE_S *g_pstLogicWBuf = HI_NULL;
hiXDP_PQ_LIST_NODE_S *g_pstCurPara = HI_NULL;
HI_U32 g_u32FrameIndexCur = 0xffffffff;
HI_BOOL g_bDefaultParaInit = HI_FALSE;

HI_U32 g_u32a = 0, g_u32b = 0, g_u32c = 0, g_u32d = 0;

#ifdef XDP_VIRTUAL_FRAMEINFO
HI_U32 g_u32FrameIdxDbg = 0;
#endif

static HI_S32 InitDefaultAlgCoef(HI_VOID)
{
    if (HI_NULL != g_stPQDefAlgCoef.stAddr.pu8VirAddr)
    {
        memcpy(g_stPQDefAlgCoef.stAddr.pu8VirAddr, (HI_VOID *) & (pVdpReg->VPSS_TNR_CTRL.u32), XDP_SOFTALG_PARA_SIZE);
    }

    return HI_SUCCESS;
}

hiXDP_PQ_Buf_S *GetDefaultAlgCoefPtr(HI_VOID)
{
    return  &g_stPQDefAlgCoef;
}


static HI_S32 PQAlg_InitBaseMem(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
#ifdef XDP_SOFTALG_BASEMEM_SUPPORT
    HI_U32 u32BufSize;
    HI_U32 u32ParaSize;
    HI_U32 u32ParaRegSize;
    HI_U32 u32ParaDefaultSize;
    hiXDP_OSAL_MEM_S *pstRegBuf;

    if (HI_TRUE == g_stPQAlgBaseMem.bInit)
    {
        PQAlg_DeInitBaseMem();
    }

    pstRegBuf = &(g_stPQAlgBaseMem.stMemInfo);
    XDP_MEM_CLEAR(*pstRegBuf);

    u32BufSize = (XDP_SOFTALG_BUF_SIZE + XDP_OSAL_MemGetMagicSize(HI_NULL));
    u32BufSize = XDP_OSAL_ALIGN(u32BufSize, XDP_SOFTALG_ADRR_ALIGN);
    u32BufSize = u32BufSize * XDP_SOFTALG_BUF_NODE_CNT;

    u32ParaSize = (XDP_SOFTALG_PARA_SIZE + XDP_OSAL_MemGetMagicSize(HI_NULL));
    u32ParaSize = XDP_OSAL_ALIGN(u32ParaSize, XDP_SOFTALG_ADRR_ALIGN);
    u32ParaSize = u32ParaSize * XDP_SOFTALG_PARA_NODE_CNT;
    u32ParaRegSize = u32ParaSize;
    u32ParaDefaultSize = XDP_VPSS_ALG_REG_BUF_SIZE;

    strncpy(pstRegBuf->aName, "VDP_PQALG_BUF", XDP_MEM_NAME_LEN_MAX);
    pstRegBuf->bMap = HI_TRUE;
    pstRegBuf->bSecure = HI_FALSE;
    pstRegBuf->bSmmu = HI_FALSE;
    pstRegBuf->u32Size = u32BufSize + u32ParaSize + u32ParaRegSize + u32ParaDefaultSize;

    s32Ret = XDP_OSAL_AllocateMem(pstRegBuf);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("malloc mem for pq alg fail!\n");

    }

    g_stPQAlgBaseMem.u32PhyAddr_BASE = pstRegBuf->u32PhyAddr;
    g_stPQAlgBaseMem.pu8VirAddr_BASE = pstRegBuf->pu8VirAddr;
    g_stPQAlgBaseMem.u32PhyAddr_CUR  = g_stPQAlgBaseMem.u32PhyAddr_BASE;
    g_stPQAlgBaseMem.pu8VirAddr_CUR = g_stPQAlgBaseMem.pu8VirAddr_BASE;
    g_stPQAlgBaseMem.u32CurrSize = pstRegBuf->u32Size;
    g_stPQAlgBaseMem.bInit = HI_TRUE;
#endif
    return s32Ret;
}

static HI_S32 PQAlg_DeInitBaseMem(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
#ifdef XDP_SOFTALG_BASEMEM_SUPPORT
    if (HI_TRUE != g_stPQAlgBaseMem.bInit)
    {
        return HI_SUCCESS;
    }

    if (g_stPQAlgBaseMem.u32CurrSize != g_stPQAlgBaseMem.stMemInfo.u32Size)
    {
        XDP_ERROR("Mem size is invalid (%d,%d)!\n", g_stPQAlgBaseMem.u32CurrSize, g_stPQAlgBaseMem.stMemInfo.u32Size);
    }

    s32Ret = XDP_OSAL_FreeMem(&(g_stPQAlgBaseMem.stMemInfo));
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("Free mem for pq alg fail!\n");
        return s32Ret;
    }

    XDP_MEM_CLEAR(g_stPQAlgBaseMem);

    g_stPQAlgBaseMem.bInit = HI_FALSE;
#endif
    return s32Ret;
}

static HI_S32 PQAlg_AllocateMemFromBase(hiXDP_OSAL_MEM_S *pstAddr)
{
#ifdef XDP_SOFTALG_BASEMEM_SUPPORT
    hiXDP_OSAL_MEM_S *pstRegBuf;
    HI_U32 u32SizeAlign = 0;

    if (HI_TRUE != g_stPQAlgBaseMem.bInit)
    {
        XDP_ERROR("g_stPQAlgBaseMem has not been inited!\n");
        return HI_FAILURE;
    }

    pstRegBuf = &(g_stPQAlgBaseMem.stMemInfo);

    if ((pstRegBuf->bMap != pstAddr->bMap)
        || (pstRegBuf->bSecure != pstAddr->bSecure)
        || (pstRegBuf->bSmmu != pstAddr->bSmmu))
    {
        XDP_ERROR("Mem attribute is different! bMap(%d,%d) bSecure(%d,%d) bSmmu(%d,%d)\n",
                  pstRegBuf->bMap, pstAddr->bMap,
                  pstRegBuf->bSecure, pstAddr->bSecure,
                  pstRegBuf->bSmmu, pstAddr->bSmmu
                 );
        return HI_FAILURE;
    }

    u32SizeAlign = XDP_OSAL_ALIGN(pstAddr->u32Size, XDP_SOFTALG_ADRR_ALIGN);

    if (u32SizeAlign > g_stPQAlgBaseMem.u32CurrSize)
    {
        XDP_ERROR("Mem size is bigger than current allowance(%d, %d)\n", pstAddr->u32Size, g_stPQAlgBaseMem.u32CurrSize);
        return HI_FAILURE;
    }


    pstAddr->u32PhyAddr = g_stPQAlgBaseMem.u32PhyAddr_CUR;
    pstAddr->pu8VirAddr = g_stPQAlgBaseMem.pu8VirAddr_CUR;
    pstAddr->u32Size = u32SizeAlign;

    XDP_INFO("malloc buf %s phy %#x vir %p size%d bmap%d\n",
              pstAddr->aName,
              pstAddr->u32PhyAddr,
              pstAddr->pu8VirAddr,
              pstAddr->u32Size,
              pstAddr->bMap
             );

    g_stPQAlgBaseMem.u32PhyAddr_CUR = g_stPQAlgBaseMem.u32PhyAddr_CUR + u32SizeAlign;
    g_stPQAlgBaseMem.pu8VirAddr_CUR = g_stPQAlgBaseMem.pu8VirAddr_CUR + u32SizeAlign;
    g_stPQAlgBaseMem.u32CurrSize = g_stPQAlgBaseMem.u32CurrSize - u32SizeAlign;

    return HI_SUCCESS;
#else
    return XDP_OSAL_AllocateMem(pstAddr);
#endif
}

static HI_S32 PQAlg_FreeMemToBase(hiXDP_OSAL_MEM_S *pstAddr)
{
#ifdef XDP_SOFTALG_BASEMEM_SUPPORT

    hiXDP_OSAL_MEM_S *pstRegBuf;

    if (HI_TRUE != g_stPQAlgBaseMem.bInit)
    {
        XDP_ERROR("g_stPQAlgBaseMem has not been inited!\n");
        return HI_FAILURE;
    }

    if ((0x0 == pstAddr->u32PhyAddr) || (HI_NULL == pstAddr->pu8VirAddr))
    {
        return HI_FAILURE;
    }

    pstRegBuf = &(g_stPQAlgBaseMem.stMemInfo);

    if ((pstRegBuf->bMap != pstAddr->bMap)
        || (pstRegBuf->bSecure != pstAddr->bSecure)
        || (pstRegBuf->bSmmu != pstAddr->bSmmu))
    {
        XDP_ERROR("Mem attribute is different! MemName %s yaddr %#x vir %p size %d bMap(%d,%d) bSecure(%d,%d) bSmmu(%d,%d)\n",
                  pstAddr->aName,
                  pstAddr->u32PhyAddr,
                  pstAddr->pu8VirAddr,
                  pstAddr->u32Size,
                  pstRegBuf->bMap, pstAddr->bMap,
                  pstRegBuf->bSecure, pstAddr->bSecure,
                  pstRegBuf->bSmmu, pstAddr->bSmmu
                 );
        return HI_FAILURE;
    }

    if ((pstAddr->u32PhyAddr > g_stPQAlgBaseMem.u32PhyAddr_CUR)
        || (pstAddr->u32PhyAddr < g_stPQAlgBaseMem.u32PhyAddr_BASE)
        || (pstAddr->pu8VirAddr > g_stPQAlgBaseMem.pu8VirAddr_CUR)
        || (pstAddr->pu8VirAddr < g_stPQAlgBaseMem.pu8VirAddr_BASE))
    {
        XDP_ERROR("Free an invalid address phy(%#x, %#x) vir(%p, %p)\n",
                  g_stPQAlgBaseMem.u32PhyAddr_CUR,
                  pstAddr->u32PhyAddr,
                  g_stPQAlgBaseMem.pu8VirAddr_CUR,
                  pstAddr->pu8VirAddr
                 );
        return HI_FAILURE;
    }

    g_stPQAlgBaseMem.u32CurrSize = g_stPQAlgBaseMem.u32CurrSize + XDP_OSAL_ALIGN(pstAddr->u32Size, XDP_SOFTALG_ADRR_ALIGN);

    XDP_INFO("free buf %s phy %#x vir %p size %d cursize %d\n",
              pstAddr->aName,
              pstAddr->u32PhyAddr,
              pstAddr->pu8VirAddr,
              pstAddr->u32Size,
              g_stPQAlgBaseMem.u32CurrSize
             );


    if (g_stPQAlgBaseMem.u32CurrSize == pstRegBuf->u32Size)
    {
        return PQAlg_DeInitBaseMem();
    }
    else if (g_stPQAlgBaseMem.u32CurrSize > pstRegBuf->u32Size)
    {
        XDP_ERROR("Mem size is invalid (%d,%d)!\n", g_stPQAlgBaseMem.u32CurrSize, pstRegBuf->u32Size);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
#else
    return XDP_OSAL_FreeMem(pstAddr);
#endif
}


HI_S32 Win_PQAlgInit(HI_VOID)
{
    struct sched_param param;
    hiXDP_PQ_LIST_ATTR_S stListAttr;
    HI_S32 s32Ret;

    if (HI_TRUE == g_stPQAlgInfo.bInit)
    {
        return HI_SUCCESS;
    }

    /*memset global param and temp param.*/
    XDP_MEM_CLEAR(g_stPQAlgInfo);
    XDP_MEM_CLEAR(g_stPQListBuf);
    XDP_MEM_CLEAR(g_stPQListPara);
    XDP_MEM_CLEAR(stListAttr);

    XDP_OSAL_InitEvent(&(g_stPQAlgInfo.stNextFrame), EVENT_UNDO, EVENT_UNDO);
    XDP_OSAL_ResetEvent(&(g_stPQAlgInfo.stNextFrame), EVENT_DONE, EVENT_UNDO);
    XDP_OSAL_InitSpin(&(g_stPQAlgInfo.stSplock));

    XDP_OSAL_InitEvent(&(g_stPQAlgInfo.stEventStop), EVENT_UNDO, EVENT_UNDO);
    XDP_OSAL_ResetEvent(&(g_stPQAlgInfo.stEventStop), EVENT_UNDO, EVENT_UNDO);


    /* just init the single buffer node,  not in empty or full list, just at using status.*/
    g_pstLogicWBuf = HI_NULL;
    g_pstCurPara = HI_NULL;

    PQAlg_InitBaseMem();

    /*init the write buffer list for hardware write*/
    g_stPQListBuf.stMemInfo.u32Size = XDP_SOFTALG_BUF_SIZE + XDP_OSAL_MemGetMagicSize(HI_NULL);
    g_stPQListBuf.stMemInfo.bSecure = HI_FALSE;
    g_stPQListBuf.stMemInfo.bMap = HI_TRUE;
    g_stPQListBuf.stMemInfo.bSmmu = HI_FALSE;

    stListAttr.bRegAddr = HI_TRUE;


    strncpy(g_stPQListBuf.stMemInfo.aName, "VDP_STT_BUF", XDP_MEM_NAME_LEN_MAX);

    stListAttr.u32NodeCount = XDP_SOFTALG_BUF_NODE_CNT;
    s32Ret = Win_PQAlg_CommonListInit(&g_stPQListBuf, &stListAttr);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("BufListInit fail Ret %d\n", s32Ret);
        goto PQALG_INIT_FAIL;
    }

    stListAttr.u32NodeCount = XDP_SOFTALG_PARA_NODE_CNT;
    /*init the param buffer list for software */
    g_stPQListPara.stMemInfo.u32Size = XDP_SOFTALG_PARA_SIZE + XDP_OSAL_MemGetMagicSize(HI_NULL);
    g_stPQListPara.stMemInfo.bSecure = HI_FALSE;
    g_stPQListPara.stMemInfo.bMap = HI_TRUE;
    g_stPQListPara.stMemInfo.bSmmu = HI_FALSE;
    stListAttr.bRegAddr = HI_FALSE;

    strncpy(g_stPQListPara.stMemInfo.aName, "VDP_STT_Para", XDP_MEM_NAME_LEN_MAX);

    s32Ret = Win_PQAlg_CommonListInit(&g_stPQListPara, &stListAttr);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("ParaListInit fail Ret %d\n", s32Ret);
        goto PQALG_INIT_FAIL;
    }

    {
        hiXDP_OSAL_MEM_S *pstRegBuf;

        XDP_MEM_CLEAR(g_stPQDefAlgCoef);
        pstRegBuf = &(g_stPQDefAlgCoef.stAddr);
        strncpy(pstRegBuf->aName, "VDP_DEFPARA_BUF", XDP_MEM_NAME_LEN_MAX);
        pstRegBuf->bMap = HI_TRUE;
        pstRegBuf->bSecure = HI_FALSE;
        pstRegBuf->bSmmu = HI_FALSE;
        pstRegBuf->u32Size = XDP_VPSS_ALG_REG_BUF_SIZE;

        s32Ret = PQAlg_AllocateMemFromBase(pstRegBuf);
        if (HI_SUCCESS != s32Ret)
        {
            XDP_ERROR("malloc reg default buf for pq fail!\n");
            goto PQALG_INIT_FAIL;
        }
        g_bDefaultParaInit = HI_FALSE;
    }

    /*below, create the thread and isr function.*/
    g_stPQAlgInfo.pstThread = kthread_create(Win_PQAlg_Task, HI_NULL, "VDP_PQAlg_Task");

    if ( IS_ERR(g_stPQAlgInfo.pstThread) )
    {
        XDP_ERROR("Can not create thread.\n");
        goto PQALG_INIT_FAIL;
    }

    param.sched_priority = 99;
    sched_setscheduler(g_stPQAlgInfo.pstThread, SCHED_RR, &param);
    wake_up_process(g_stPQAlgInfo.pstThread);
    g_stPQAlgInfo.bInit = HI_TRUE;
    g_stPQAlgInfo.u32NextFrameGap = 16; //60HZ
    g_stPQAlgInfo.bNeedSleep = HI_TRUE;
    g_stPQAlgInfo.bExit = HI_FALSE;
    g_stPQAlgInfo.bEnable = HI_FALSE;
#ifdef XDP_VIRTUAL_FRAMEINFO
    g_u32FrameIdxDbg = 0;
#endif
    g_u32FrameIndexCur = 0;
    g_stPQAlgInfo.eFieldOrder = WIN_FIELDORDER_BUTT;

    s32Ret = InitLogicWBC();
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("InitLogicWBC fail Ret %d\n", s32Ret);
        goto PQALG_INIT_FAIL;
    }

    return HI_SUCCESS;

PQALG_INIT_FAIL:
    g_stPQAlgInfo.bInit = HI_TRUE;
    Win_PQAlgDeInit();
    g_stPQAlgInfo.bInit = HI_FALSE;

    return HI_FAILURE;
}

HI_S32 Win_PQAlgDeInit(HI_VOID)
{
    HI_S32 s32Ret;

    XDP_INFO("enter Win_PQAlgDeInit\n");
    if (HI_TRUE != g_stPQAlgInfo.bInit)
    {
        return HI_SUCCESS;
    }
    /* thread goto idle */
    XDP_OSAL_ResetEvent(&(g_stPQAlgInfo.stEventStop), EVENT_UNDO, EVENT_UNDO);
    g_stPQAlgInfo.bNeedSleep = HI_TRUE;
    g_stPQAlgInfo.bEnable = HI_FALSE;
    g_stPQAlgInfo.bExit = HI_TRUE;
    s32Ret = XDP_OSAL_WaitEvent(&(g_stPQAlgInfo.stEventStop), 10000);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("Can not stop thread.\n");
        g_stPQAlgInfo.bNeedSleep = HI_FALSE;
        return HI_FAILURE;
    }
    /* thread exit */
    s32Ret = kthread_stop(g_stPQAlgInfo.pstThread);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("Destory Thread Error.\n");
        return HI_FAILURE;
    }

    /* list deinit */
    s32Ret = Win_PQAlg_CommonListDeInit(&g_stPQListBuf);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("Win_PQAlg_BufListDeInit fail Ret %d\n", s32Ret);
    }

    s32Ret = Win_PQAlg_CommonListDeInit(&g_stPQListPara);
    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("Win_PQAlg_ParaListInit fail Ret %d\n", s32Ret);
    }

    {
        hiXDP_OSAL_MEM_S *pstRegBuf;

        pstRegBuf = &(g_stPQDefAlgCoef.stAddr);

        s32Ret = PQAlg_FreeMemToBase(pstRegBuf);
        if (HI_SUCCESS != s32Ret)
        {
            XDP_ERROR("Free reg default buf for pq fail!\n");
        }
        XDP_MEM_CLEAR(g_stPQDefAlgCoef);
        g_bDefaultParaInit = HI_FALSE;
    }

    PQAlg_DeInitBaseMem();

    g_stPQAlgInfo.bInit = HI_FALSE;

    XDP_INFO("exit Win_PQAlgDeInit\n");

    return HI_SUCCESS;
}


HI_S32 Win_PQAlgStart(HI_VOID)
{
    g_stPQAlgInfo.bNeedSleep = HI_FALSE;
    XDP_INFO("Win_PQAlgStart success!\n");
    return HI_SUCCESS;
}

HI_S32 Win_PQAlgStop(HI_VOID)
{
    g_stPQAlgInfo.bNeedSleep = HI_TRUE;
    XDP_INFO("Win_PQAlgStop success!\n");
    return HI_SUCCESS;
}

HI_S32 Win_PQAlgEnable(HI_BOOL bEnable)
{
    g_stPQAlgInfo.bEnable = bEnable;
    XDP_INFO("Win_PQAlgEnable %d !\n", bEnable);
    return HI_SUCCESS;
}

#ifdef XDP_SUPPORT_MEM_MAGIC
HI_S32 Win_PQAlgEnableMagic(HI_BOOL bEnable)
{
    g_stPQAlgInfo.bMagicEnable = bEnable;
    XDP_INFO("Win_PQAlgEnableMagic %d !\n", bEnable);
    return HI_SUCCESS;
}
#endif

HI_S32 Win_PQAlg_ResetList(HI_VOID)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;

    /*send all BUF nodes back to empty list*/
    XDP_OSAL_DownSpin(&(g_stPQListBuf.stSpinLock));
    list_for_each_safe(pos, n, &(g_stPQListBuf.stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        list_del_init(pos);
        list_add_tail(&(pstTarget->node), &(g_stPQListBuf.stEmptyList));
        XDP_INFO("pass buf full node to empty %p\n", pos);
    }
    if (HI_NULL != g_pstLogicWBuf)
    {
        list_add_tail(&(g_pstLogicWBuf->node), &(g_stPQListBuf.stEmptyList));
        XDP_INFO("pass buf cur node to empty %p\n", &(g_pstLogicWBuf->node));
        g_pstLogicWBuf = HI_NULL;
    }
    XDP_OSAL_UpSpin(&(g_stPQListBuf.stSpinLock));


    /*send all para nodes back to empty list*/
    XDP_OSAL_DownSpin(&(g_stPQListPara.stSpinLock));
    list_for_each_safe(pos, n, &(g_stPQListPara.stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        list_del_init(pos);
        list_add_tail(&(pstTarget->node), &(g_stPQListPara.stEmptyList));
        XDP_INFO("pass para full node to empty %p\n", pos);
    }
    if (HI_NULL != g_pstCurPara)
    {
        list_add_tail(&(g_pstCurPara->node), &(g_stPQListPara.stEmptyList));
        XDP_INFO("pass Para cur node to empty %p\n", &(g_pstCurPara->node));
        g_pstCurPara = HI_NULL;
    }
    XDP_OSAL_UpSpin(&(g_stPQListPara.stSpinLock));


    /* Don not free buf here, but in delempty */
    return HI_SUCCESS;
}

HI_S32 Win_PQAlg_CommonListInit(hiXDP_PQ_LIST_S *pstList, hiXDP_PQ_LIST_ATTR_S *
                                pstAttr)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32Idx;
    hiXDP_PQ_LIST_NODE_S *pstSrcNode = HI_NULL;
    hiXDP_OSAL_MEM_S *pstBuf = HI_NULL;

    if (HI_TRUE == pstList->bInit)
    {
        XDP_INFO("Win_PQAlg_BufListInit has been called!\n");
        return HI_SUCCESS;
    }

    /* init list spinlock */
    XDP_OSAL_InitSpin(&(pstList->stSpinLock));

    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    INIT_LIST_HEAD(&(pstList->stEmptyList));
    INIT_LIST_HEAD(&(pstList->stFullList));
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    for (u32Idx = 0; u32Idx < pstAttr->u32NodeCount; u32Idx++)
    {
        /* malloc list node */
        pstSrcNode = (hiXDP_PQ_LIST_NODE_S *)XDP_KMALLOC(sizeof(
                         hiXDP_PQ_LIST_NODE_S), GFP_ATOMIC);
        if (pstSrcNode == HI_NULL)
        {
            XDP_ERROR("vmalloc SrcNode failed\n");
            goto LIST_INIT_FAIL;
        }

        pstSrcNode->pData = XDP_KMALLOC(sizeof(hiXDP_PQ_Buf_S), GFP_ATOMIC);
        if (pstSrcNode->pData == HI_NULL)
        {
            XDP_KFREE(pstSrcNode);
            XDP_ERROR("vmalloc SrcNode failed\n");
            goto LIST_INIT_FAIL;
        }

        memset(pstSrcNode->pData, 0, sizeof(hiXDP_PQ_Buf_S));

        /* add all nodes to empty list */
        XDP_OSAL_DownSpin(&(pstList->stSpinLock));
        list_add_tail(&(pstSrcNode->node), &(pstList->stEmptyList));
        XDP_OSAL_UpSpin(&(pstList->stSpinLock));

        XDP_INFO("add node %p (data %p)\n", &(pstSrcNode->node), pstSrcNode->pData);
        pstBuf = &(((hiXDP_PQ_Buf_S *)pstSrcNode->pData)->stAddr);
        *pstBuf = pstList->stMemInfo;

        s32Ret = PQAlg_AllocateMemFromBase(pstBuf);
        if (HI_SUCCESS != s32Ret)
        {
            XDP_ERROR("malloc buf for node fail!\n");
            goto LIST_INIT_FAIL;
        }

        XDP_OSAL_MemAddMagic(pstBuf, OSAL_MEM_MAGIC_NO);

        if (HI_TRUE == pstAttr->bRegAddr)
        {
            pstBuf = &(((hiXDP_PQ_Buf_S *)pstSrcNode->pData)->stRegAddr);
            strncpy(pstBuf->aName, "VDP_STT_REG_BUF", XDP_MEM_NAME_LEN_MAX);
            pstBuf->bMap = HI_TRUE;
            pstBuf->bSecure = HI_FALSE;
            pstBuf->bSmmu = HI_FALSE;
            pstBuf->u32Size = XDP_VPSS_ALG_REG_BUF_SIZE + XDP_OSAL_MemGetMagicSize(HI_NULL);

            s32Ret = PQAlg_AllocateMemFromBase(pstBuf);
            if (HI_SUCCESS != s32Ret)
            {
                XDP_ERROR("malloc reg buf for pq fail!\n");
                goto LIST_INIT_FAIL;
            }
            XDP_OSAL_MemAddMagic(pstBuf, OSAL_MEM_MAGIC_NO);
        }
    }
    pstList->u32ListNodeCnt = pstAttr->u32NodeCount;
    pstList->u32CompleteCount = 0;
    pstList->bInit = HI_TRUE;

    return s32Ret;
LIST_INIT_FAIL:
    Win_PQAlg_FreeListResouce(pstList);

    return HI_FAILURE;
}

HI_VOID Win_PQAlg_FreeListResouce(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;


    /*del full*/
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    list_for_each_safe(pos, n, &(pstList->stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        list_del_init(pos);

        XDP_OSAL_UpSpin(&(pstList->stSpinLock));

        if (HI_NULL != pstTarget)
        {
            if (HI_NULL != pstTarget->pData)
            {
                PQAlg_FreeMemToBase(&(((hiXDP_PQ_Buf_S *)pstTarget->pData)->stAddr));
                PQAlg_FreeMemToBase(&(((hiXDP_PQ_Buf_S *)pstTarget->pData)->stRegAddr));
                XDP_INFO("FullList free buf data %p!\n", pstTarget->pData);
                XDP_KFREE(pstTarget->pData);
                pstTarget->pData = HI_NULL;
            }

            XDP_INFO("FullList free buf node %p!\n", pstTarget);
            XDP_KFREE(pstTarget);
            pstTarget = HI_NULL;
        }
        XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    /*del empty*/
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    list_for_each_safe(pos, n, &(pstList->stEmptyList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        list_del_init(pos);
        XDP_OSAL_UpSpin(&(pstList->stSpinLock));

        if (HI_NULL != pstTarget)
        {
            if (HI_NULL != pstTarget->pData)
            {
                PQAlg_FreeMemToBase(&(((hiXDP_PQ_Buf_S *)pstTarget->pData)->stAddr));
                PQAlg_FreeMemToBase(&(((hiXDP_PQ_Buf_S *)pstTarget->pData)->stRegAddr));
                XDP_INFO("EmptyList free data %p!\n", pstTarget->pData);
                XDP_KFREE(pstTarget->pData);
                pstTarget->pData = HI_NULL;
            }

            XDP_INFO("EmptyList free node %p!\n", pstTarget);
            XDP_KFREE(pstTarget);
            pstTarget = HI_NULL;
        }
        XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    XDP_MEM_CLEAR((*pstList));

    return;
}


HI_S32 Win_PQAlg_CommonListDeInit(hiXDP_PQ_LIST_S *pstList)
{
    if (HI_TRUE != pstList->bInit)
    {
        XDP_INFO("Win_PQAlg_CommonListDeInit fail!\n");
        return HI_FAILURE;
    }

    Win_PQAlg_FreeListResouce(pstList);

    pstList->bInit = HI_FALSE;

    return HI_SUCCESS;
}


HI_VOID Win_PQAlg_PrintFullList(hiXDP_PQ_LIST_S *pstList)
{
    return;

#if 0
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    hiXDP_PQ_Buf_S *pBuf = HI_NULL;

    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    list_for_each_safe(pos, n, &(pstList->stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pBuf = (hiXDP_PQ_Buf_S *)pstTarget->pData;
        HI_PRINT("(node %p idx %d)->", pstTarget, pBuf->u32Index);
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    HI_PRINT("\n");
#endif
}

HI_S32 Win_PQAlg_BufListAddFull(hiXDP_PQ_LIST_S *pstList,
                                hiXDP_PQ_LIST_NODE_S *pNode)
{
    HI_S32 s32Ret = HI_SUCCESS;
    if (HI_NULL == pNode)
    {
        return HI_FAILURE;
    }

    XDP_INFO("add buf full node %p\n", &(pNode->node));
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32FullListAddTryCnt++;
    pstList->u32FullListAddOkCnt++;
    list_add_tail(&(pNode->node), &(pstList->stFullList));
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));
    Win_PQAlg_PrintFullList(pstList);

    return s32Ret;
}

hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListDelFull(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32FullListDelTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pstList->u32FullListDelOkCnt++;
        XDP_INFO("del buf full node %p\n", pos);
        list_del_init(pos);
        break;
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    Win_PQAlg_PrintFullList(pstList);

    if (pstTarget)
    {
        return pstTarget;
    }
    else
    {
        return HI_NULL;
    }
}

/* read the lastest node, but not del it from list */
hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListCheckFull(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;

    XDP_OSAL_DownSpin(&(pstList->stSpinLock));

    pstList->u32FullListCheckTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pstList->u32FullListCheckOkCnt++;
        XDP_INFO("check buf full node %p\n", pos);
        break;
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    if (pstTarget)
    {
        //return (hiXDP_PQ_Buf_S *)pstTarget->pData;
        return pstTarget;
    }
    else
    {
        return HI_NULL;
    }

}

HI_S32 Win_PQAlg_BufListAddEmpty(hiXDP_PQ_LIST_S *pstList,
                                 hiXDP_PQ_LIST_NODE_S *pNode)
{
    HI_S32 s32Ret = HI_SUCCESS;
    XDP_INFO("add buf empty node %p\n", &(pNode->node));
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32EmptyListAddTryCnt++;
    pstList->u32EmptyListAddOkCnt++;
    list_add_tail(&(pNode->node), &(pstList->stEmptyList));
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    return s32Ret;
}

hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListCheckEmpty(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32EmptyListCheckTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stEmptyList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pstList->u32EmptyListCheckOkCnt++;
        XDP_INFO("check buf empty node %p\n", pos);
        break;
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    if (pstTarget)
    {
        //return (hiXDP_PQ_Buf_S *)pstTarget->pData;
        return pstTarget;
    }
    else
    {
        return HI_NULL;
    }

}

hiXDP_PQ_LIST_NODE_S *Win_PQAlg_BufListDelEmpty(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    hiXDP_PQ_Buf_S *pstBuf = HI_NULL;

    pstList->u32EmptyListDelTryCnt++;

    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    list_for_each_safe(pos, n, &(pstList->stEmptyList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);

        pstBuf = (hiXDP_PQ_Buf_S *)pstTarget->pData;
        if (HI_NULL == pstBuf)
        {
            XDP_OSAL_UpSpin(&(pstList->stSpinLock));
            XDP_ERROR("pstBuf is null!\n");
            return HI_NULL;
        }
        else
        {

            list_del_init(pos);
            XDP_OSAL_UpSpin(&(pstList->stSpinLock));
            XDP_INFO("del buf empty node %p\n", pos);
#if 0
            s32Ret = VPSS_OSAL_ReAllocateMem(&(pstBuf->stAddr), &(pstList->stMemInfo));
            if (HI_SUCCESS != s32Ret)
            {
                XDP_OSAL_DownSpin(&(pstList->stSpinLock));
                list_add_tail(pos, &(pstList->stEmptyList));
                XDP_OSAL_UpSpin(&(pstList->stSpinLock));
                XDP_ERROR("VPSS_OSAL_ReAllocateMem fail!\n");
                return HI_NULL;
            }
#endif
        }
        break;
    }

    if (pstTarget)
    {
        pstList->u32EmptyListDelOkCnt++;
        return pstTarget;
    }
    else
    {
        XDP_OSAL_UpSpin(&(pstList->stSpinLock));
        return HI_NULL;
    }
}


HI_S32 Win_PQAlg_ParaListAddFull(hiXDP_PQ_LIST_S *pstList,
                                 hiXDP_PQ_LIST_NODE_S *pNode)
{
    HI_S32 s32Ret = HI_SUCCESS;

    XDP_INFO("add para full node %p\n", &(pNode->node));
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32FullListAddTryCnt++;
    pstList->u32FullListAddOkCnt++;
    list_add_tail(&(pNode->node), &(pstList->stFullList));
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));
    return s32Ret;
}

hiXDP_PQ_LIST_NODE_S *Win_PQAlg_ParaListCheckFull(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));

    pstList->u32FullListCheckTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stFullList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pstList->u32FullListCheckOkCnt++;
        XDP_INFO("check para full node %p\n", pos);
        break;
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    if (pstTarget)
    {
        //return (hiXDP_PQ_Buf_S *)pstTarget->pData;
        return pstTarget;
    }
    else
    {
        return HI_NULL;
    }

}


hiXDP_PQ_LIST_NODE_S *Win_PQAlg_ParaListDelFull(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;

    XDP_OSAL_DownSpin(&(pstList->stSpinLock));

    pstList->u32FullListDelTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stFullList))
    {
        pstList->u32FullListDelOkCnt++;
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        list_del_init(pos);
        XDP_INFO("del para full node %p\n", pos);
        break;
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    if (pstTarget)
    {
        return pstTarget;
    }
    else
    {
        return HI_NULL;
    }
}


HI_S32 Win_PQAlg_ParaListAddEmpty(hiXDP_PQ_LIST_S *pstList,
                                  hiXDP_PQ_LIST_NODE_S *pNode)
{
    HI_S32 s32Ret = HI_SUCCESS;

    XDP_INFO("add para empty node %p\n", &(pNode->node));
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32EmptyListAddTryCnt++;
    pstList->u32EmptyListAddOkCnt++;
    list_add_tail(&(pNode->node), &(pstList->stEmptyList));
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    return s32Ret;
}


hiXDP_PQ_LIST_NODE_S   *Win_PQAlg_ParaListCheckEmpty(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32EmptyListCheckTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stEmptyList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pstList->u32EmptyListCheckOkCnt++;
        XDP_INFO("check para empty node %p\n", pos);
        break;
    }
    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    if (pstTarget)
    {
        //return (hiXDP_PQ_Buf_S *)pstTarget->pData;
        return pstTarget;
    }
    else
    {
        return HI_NULL;
    }

}

hiXDP_PQ_LIST_NODE_S *Win_PQAlg_ParaListDelEmpty(hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    hiXDP_PQ_Para_S *pstPara = HI_NULL;
    pstList->u32EmptyListDelTryCnt++;
    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    list_for_each_safe(pos, n, &(pstList->stEmptyList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        pstPara = (hiXDP_PQ_Para_S *)pstTarget->pData;
        if (HI_NULL == pstPara)
        {
            XDP_OSAL_UpSpin(&(pstList->stSpinLock));
            XDP_ERROR("pstPara is null!\n");
            return HI_NULL;
        }
        else
        {
            list_del_init(pos);
            XDP_OSAL_UpSpin(&(pstList->stSpinLock));
            XDP_INFO("del para empty node %p\n", pos);
        }
        break;
    }


    if (pstTarget)
    {
        pstList->u32EmptyListDelOkCnt++;
        return pstTarget;
    }
    else
    {
        XDP_OSAL_UpSpin(&(pstList->stSpinLock));
        return HI_NULL;
    }
}


static HI_VOID   SetDefaultAlgCoef(hiXDP_PQ_LIST_NODE_S *pstSoftOutputPara)
{
    hiXDP_PQ_Para_S *pstBuf = HI_NULL, *pstDefaultPtr = HI_NULL;

    if (HI_NULL == pstSoftOutputPara)
    {
        XDP_ERROR("Null Pointer!\n");
        return;
    }
    pstBuf = (hiXDP_PQ_Para_S *)pstSoftOutputPara->pData;

    if (HI_NULL == pstBuf)
    {
        XDP_ERROR("Null Pointer!\n");
        return;
    }

    if (HI_FALSE == g_bDefaultParaInit)
    {
        InitDefaultAlgCoef();
        g_bDefaultParaInit = HI_TRUE;
    }

    pstBuf->u32Index = GetCurFrameIdISR();

    pstDefaultPtr = GetDefaultAlgCoefPtr();
    /*just copy the value to the */
    if ((HI_NULL != pstBuf->stAddr.pu8VirAddr) && (HI_NULL != pstDefaultPtr->stAddr.pu8VirAddr))
    {
        memcpy(pstBuf->stAddr.pu8VirAddr, pstDefaultPtr->stAddr.pu8VirAddr, XDP_SOFTALG_PARA_SIZE);
    }
    else
    {
        XDP_ERROR("Invalid default para %p %p!\n",
                  pstBuf->stAddr.pu8VirAddr, pstDefaultPtr->stAddr.pu8VirAddr);
    }

    pstBuf->u32Index = 0;
    return;
}


/*find the matched param  for logic read,  if not matched  just delete it and insert it
   to the empty node .  finally  no matched node find,  just use the last matched one.*/
static hiXDP_PQ_LIST_NODE_S   *FindMatchedInputParamNodeForlogic(HI_VOID)
{
    hiXDP_PQ_Para_S *pstNextPara = HI_NULL;
    hiXDP_PQ_LIST_NODE_S *pstNextParaNode = HI_NULL;
    HI_BOOL  bMatch =  HI_FALSE;
    HI_U32   u32FrameId = 0;
    HI_S32  s32RetryCnt = 0;
    HI_S32  s32Ret;
    HI_ULONG ulThreadStart = 0;
    u32FrameId = Win_PQAlg_GetCurFrameId();

    s32RetryCnt = 1;

#ifdef XDP_SUPPORT_ALG_STAT
    ulThreadStart = XDP_OSAL_GetTimeUS();
#endif

ISR_PARA_FIND_START:
    pstNextParaNode = Win_PQAlg_ParaListDelFull(&g_stPQListPara);
    if (HI_NULL != pstNextParaNode)
    {
        while (HI_TRUE != bMatch)
        {
            g_stPQAlgInfo.u32ParaFullGet++;
            pstNextPara = (hiXDP_PQ_Para_S *)pstNextParaNode->pData;

            bMatch = Win_PQAlg_CheckFrameParaMatch(pstNextPara, u32FrameId);
            if (HI_TRUE != bMatch)
            {
                g_stPQAlgInfo.u32ParaMisMatch++;
                Win_PQAlg_ParaListAddEmpty(&g_stPQListPara, pstNextParaNode);
                pstNextParaNode = HI_NULL;
            }
            else
            {
                g_stPQAlgInfo.u32ParaMatch++;
                break;
            }

            pstNextParaNode = Win_PQAlg_ParaListDelFull(&g_stPQListPara);
            if (HI_NULL == pstNextParaNode)
            {
                g_u32a++;
                g_stPQAlgInfo.u32ParaFullUnderload++;
                XDP_WARN("del to the end\n");
                bMatch = HI_FALSE;
                break;
            }
            else
            {
                g_u32c++;
            }
        }
    }
    else
    {
        g_u32b++;
        g_stPQAlgInfo.u32ParaFullUnderload++;
        bMatch = HI_FALSE;
    }

    /*if matched ,just return.*/
    if (HI_TRUE == bMatch)
    {
        if (0 == s32RetryCnt)
        {
            g_stPQAlgInfo.u32ParaRetryOk++;
        }
        return pstNextParaNode;
    }
    g_stPQAlgInfo.u32ParaRunInISR++;

    if (s32RetryCnt-- > 0)
    {
        s32Ret = Win_PQAlg_AlgProcess(&g_stPQListBuf, &g_stPQListPara,
                                      &g_stPQAlgInfo, u32FrameId, ulThreadStart);
        /*ignore ret, Maybe thread has already created the newest result */
        goto ISR_PARA_FIND_START;
    }

    if (g_pstCurPara != HI_NULL)
    {
        pstNextParaNode = g_pstCurPara;
        g_stPQAlgInfo.u32ParaUseLast++;
        pstNextPara = (hiXDP_PQ_Para_S *)pstNextParaNode->pData;
        XDP_WARN("use last %d\n", pstNextPara->u32Index);
    }
    else
    {
        g_u32d++;
        XDP_ERROR("g_pstCurPara is null !!!!\n");

        /*if no node exist, just set default value.*/
        pstNextParaNode = Win_PQAlg_ParaListDelEmpty(&g_stPQListPara);

        if (HI_NULL != pstNextParaNode)
        {
            g_stPQAlgInfo.u32ParaEmptyGet++;
        }
        else
        {
            pstNextParaNode = g_pstCurPara;
            g_stPQAlgInfo.u32ParaUseLast++;
            g_stPQAlgInfo.u32ParaEmptyUnderload++;
        }

        SetDefaultAlgCoef(pstNextParaNode);
    }

    return pstNextParaNode;
}



static hiXDP_PQ_LIST_NODE_S   *FindUsefulBufNodeForLogic(HI_VOID)
{
    hiXDP_PQ_LIST_NODE_S *pstNextLogicWBufNode = HI_NULL;

    /* get next logic_w_buf from buf empty list  */
    if (HI_NULL != Win_PQAlg_BufListCheckEmpty(&g_stPQListBuf))
    {
        pstNextLogicWBufNode = Win_PQAlg_BufListDelEmpty(&g_stPQListBuf);
        g_stPQAlgInfo.u32BufEmptyGet++;
    }
    else
    {
        pstNextLogicWBufNode =  g_pstLogicWBuf;
        g_stPQAlgInfo.u32BufEmptyUnderload++;
    }

    return pstNextLogicWBufNode;
}


HI_U32 Win_PQAlg_GetCurFrameId(HI_VOID)
{
    VIDEO_LAYER_FUNCTIONG_S stFunc = {0};
    //HW_DYNAMIC_FrameInfor_S stCurrentFrameInfo;

    VideoLayer_GetFunction(&stFunc);
    Get_CurFrameInfo(&g_stPQCurFrameInfo);

    return  g_stPQCurFrameInfo.u32DynamicFrameIndex;
}


static HI_VOID  Get_CurFrameInfo(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo)
{
    VIDEO_LAYER_FUNCTIONG_S *pstFunc = VideoLayer_GetFunctionPtr();

    memset(pstVpssIpFinfo, 0x0, sizeof(*pstVpssIpFinfo));

    if ((HI_NULL == pstFunc) || (HI_NULL == pstFunc->PF_HW_BUF_GetFramePrivateInfor))
    {
        return;
    }

    pstFunc->PF_HW_BUF_GetFramePrivateInfor(0, pstVpssIpFinfo);

#ifdef XDP_VIRTUAL_FRAMEINFO
    pstVpssIpFinfo->u32DynamicFrameIndex = g_u32FrameIdxDbg;
#endif
    return;
}

static HI_BOOL GetFrameInitFlag(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo)
{
    /*get frame init flag,  when resolution/p2i/BT change.*/
    return (0 == pstVpssIpFinfo->u32DynamicFrameIndex) ? HI_TRUE : HI_FALSE;

}

static HI_BOOL GetSoftAlgTurnOffFlag(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo)
{
    return (pstVpssIpFinfo->bRWZB || pstVpssIpFinfo->bFastForward || pstVpssIpFinfo->bFastRefMode);
}

static HI_BOOL GetSoftAlgEnableFlag(HW_DYNAMIC_FrameInfor_S *pstVpssIpFinfo)
{
    return (pstVpssIpFinfo->bOfflineMode);
}


static HI_U32 GetCurFrameIdISR(HI_VOID)
{
    g_u32FrameIndexCur = Win_PQAlg_GetCurFrameId();
    return g_u32FrameIndexCur;
}

static HI_U32 GetCurFrameIdThread(HI_VOID)
{
    return g_u32FrameIndexCur; //use isr index ,not newst Win_PQAlg_GetCurFrameId
}

HI_VOID Win_PQAlg_SetDIMode(HI_VOID)
{

}

static  HI_S32  Win_PQAlgFirstFrameInit(HI_VOID)
{
    hiXDP_PQ_LIST_NODE_S *pstSoftOutputPara = HI_NULL;
    g_stPQAlgInfo.u32ReInitCycle++;
    Win_PQAlg_ResetList();

    /*get empty node,init it, use as full node */
    pstSoftOutputPara = Win_PQAlg_ParaListDelEmpty(&g_stPQListPara);
    if (HI_NULL == pstSoftOutputPara)
    {
        g_stPQAlgInfo.u32ParaEmptyUnderload++;
        XDP_ERROR("Para emptylist is underload\n");
        return  HI_FAILURE;
    }

    /*****************************todolist******************************/
    /*get default value to */
    SetDefaultAlgCoef(pstSoftOutputPara);
    Win_PQAlg_SetDIMode();
    /*****************************todolist******************************/

    /* cfg g_pstCurPara  and g_pstLogicWBuf to first field */
    Win_PQAlg_ParaListAddFull(&g_stPQListPara, pstSoftOutputPara);

    g_stPQAlgInfo.eFieldOrder = WIN_FIELDORDER_BUTT;

    return HI_SUCCESS;
}

static HI_VOID GetRGMEInfo(hiXDP_PQ_RGMV_S *pstRgmv)
{
    VIDEO_LAYER_FUNCTIONG_S stFunc = {0};
    HW_ALG_WBC_STATUS_INFOR_S stWbcStatus = {0};
    VideoLayer_GetFunction(&stFunc);

    if (HI_NULL != stFunc.PF_Alg_GetWbcConfig)
    {
        stFunc.PF_Alg_GetWbcConfig(&stWbcStatus);
        pstRgmv->u32AddrP1 = stWbcStatus.u32P1RgmvAddr;
        pstRgmv->u32AddrP2 = stWbcStatus.u32P2RgmvAddr;
        pstRgmv->u32Stride = stWbcStatus.u32Stride;

        Get_CurFrameInfo(&g_stPQCurFrameInfo);

        pstRgmv->pu32AddrP1Vir  = (HI_U32 *)((pstRgmv->u32AddrP1 - g_stPQCurFrameInfo.u32VpssChnAddr)
                                             + g_stPQCurFrameInfo.u32VpssChnVirtAddr);
        pstRgmv->pu32AddrP2Vir  = (HI_U32 *)((pstRgmv->u32AddrP2 - g_stPQCurFrameInfo.u32VpssChnAddr)
                                             + g_stPQCurFrameInfo.u32VpssChnVirtAddr);
    }

    return;
}

static HI_VOID GetAlgCtrlInfo(hiXDP_PQ_Buf_S *pstBuf)
{
    if (HI_NULL != pstBuf->stRegAddr.pu8VirAddr)
    {
        memcpy(pstBuf->stRegAddr.pu8VirAddr, (HI_VOID *) & (pVdpReg->VPSS_TNR_CTRL.u32), XDP_VPSS_ALG_REG_BUF_SIZE);
    }
    else
    {
        XDP_ERROR("null pointer!\n");
    }

    return;
}

static HI_VOID ConfigLogic(hiXDP_PQ_Buf_S *pstBuf, hiXDP_PQ_Para_S *pstPara)
{
    VIDEO_LAYER_FUNCTIONG_S stFunc = {0};
    HW_ALG_WBC_CONFIG_INFOR_S stWbConfig = {0};
    VideoLayer_GetFunction(&stFunc);

    if ((HI_NULL != stFunc.PF_Alg_SetWbcConfig) && (HI_NULL != pstBuf) && (HI_NULL != pstPara))
    {
        stWbConfig.u32SoftAlgCaculateResult = pstPara->stAddr.u32PhyAddr;
        stWbConfig.u32SttAddr = pstBuf->stAddr.u32PhyAddr;
        stFunc.PF_Alg_SetWbcConfig(&stWbConfig);
#ifdef XDP_SUPPORT_ALG_STAT
        pstBuf->stStat.aulCfgLogicRun[pstBuf->stStat.u32Idx] = XDP_OSAL_GetTimeUS();
#endif
    }

    return;
}

static HI_S32 InitLogicWBC(HI_VOID)
{
    VIDEO_LAYER_FUNCTIONG_S stFunc = {0};
    HW_ALG_WBC_CONFIG_INFOR_S stWbConfig = {0};
    hiXDP_PQ_LIST_NODE_S *pstNextLogicWBufNode = HI_NULL;
    hiXDP_PQ_LIST_NODE_S *pstNextParaNode = HI_NULL;
    hiXDP_PQ_Buf_S *pstBuf = HI_NULL;
    hiXDP_PQ_Para_S *pstPara = HI_NULL;
    HI_S32 s32Ret = HI_SUCCESS;

    pstNextLogicWBufNode = Win_PQAlg_BufListDelEmpty(&g_stPQListBuf);
    pstNextParaNode = Win_PQAlg_ParaListDelEmpty(&g_stPQListPara);

    if ((HI_NULL != pstNextLogicWBufNode) && (HI_NULL != pstNextParaNode))
    {
        pstBuf = (hiXDP_PQ_Buf_S *)pstNextLogicWBufNode->pData;
        pstPara = (hiXDP_PQ_Para_S *)pstNextParaNode->pData;
        VideoLayer_GetFunction(&stFunc);
        if ((HI_NULL != stFunc.PF_Alg_SetWbcConfig) && (HI_NULL != pstBuf) && (HI_NULL != pstPara))
        {
            stWbConfig.u32SoftAlgCaculateResult = pstPara->stAddr.u32PhyAddr;
            stWbConfig.u32SttAddr = pstBuf->stAddr.u32PhyAddr;
            stFunc.PF_Alg_SetWbcConfig(&stWbConfig);
        }
        else
        {
            s32Ret = HI_FAILURE;
        }
    }
    else
    {
        s32Ret = HI_FAILURE;
    }

    //if (HI_SUCCESS != s32Ret)
    /* force return, loop in normal flow */
    {
        if (HI_NULL != pstNextLogicWBufNode)
        {
            Win_PQAlg_BufListAddEmpty(&g_stPQListBuf, pstNextLogicWBufNode);
        }

        if (HI_NULL != pstNextParaNode)
        {
            Win_PQAlg_ParaListAddEmpty(&g_stPQListPara, pstNextParaNode);
        }
    }

    return s32Ret;
}


static HI_VOID SoftAlgCacl(hiXDP_PQ_Buf_S *alg_r_buf,
                           hiXDP_PQ_Para_S *alg_w_para)
{
    HI_PQ_DISP_INFO_S stPqDispInfo = {0};
    HI_PQ_VPSS_REG_INFO_S stVpssRegInfo = {0};
    HI_PQ_VPSS_OUT_INFO_S stPqVpssOutInfo = {0};
    HW_DYNAMIC_FrameInfor_S *pstCurFrame = &(alg_r_buf->stFrameInfo);
    HI_S32 s32Ret = HI_SUCCESS;

    g_stPQFrameInfo.u32FrameIndex =  alg_r_buf->u32Index; // start from 1,2,3,4...
    g_stPQFrameInfo.u32HandleNo = 0;
    g_stPQFrameInfo.bSoftAlgPass = HI_FALSE;
    g_stPQFrameInfo.bInit = (1 != alg_r_buf->u32Index) ? HI_FALSE : HI_TRUE;

    g_stPQFrameInfo.bProgressive =  pstCurFrame->bProgressive;
    g_stPQFrameInfo.u32Width =  pstCurFrame->u32Width;
    g_stPQFrameInfo.u32Height =  pstCurFrame->u32Height;
    g_stPQFrameInfo.u32BitDepth =  pstCurFrame->u32BitWidth;

    g_stPQFrameInfo.bDeiEn = pstCurFrame->bDeiEn;
    g_stPQFrameInfo.bTnrEn = pstCurFrame->bTnrEn;
    g_stPQFrameInfo.bMcnrEn = pstCurFrame->bMcnrEn;
    g_stPQFrameInfo.bSnrEn = pstCurFrame->bSnrEn;
    g_stPQFrameInfo.bDbEn = pstCurFrame->bDbEn;
    g_stPQFrameInfo.bDmEn = pstCurFrame->bDmEn;

    g_stPQFrameInfo.u32Scd =  0;
    g_stPQFrameInfo.u32Stride =  alg_r_buf->stRgmv.u32Stride;
    g_stPQFrameInfo.bPreInfo =  HI_FALSE;

    g_stPQFrameInfo.u32FrameRate =  pstCurFrame->u32FrameRate;
    g_stPQFrameInfo.s32FieldMode =  pstCurFrame->s32FieldMode;
    g_stPQFrameInfo.u32FieldOrder =  pstCurFrame->u32FieldOrder;
    //1 TODO
    //g_stPQFrameInfo.stVdecInfo =  pstCurFrame->stVd  ;

    stVpssRegInfo.pstVpssAlgRegOut = (S_VPSSIP_ALG_SET_REGS_TYPE *)alg_w_para->stAddr.pu8VirAddr;
    stVpssRegInfo.pstVpssReg = (S_VPSSIP_ALG_SET_REGS_TYPE *)(alg_r_buf->stRegAddr.pu8VirAddr);
    stVpssRegInfo.pstVpssWbcReg = (S_VPSS_STT_REGS_TYPE *)alg_r_buf->stAddr.pu8VirAddr;
    g_stPQFrameInfo.pRGMV =  (HI_VOID *) alg_r_buf->stRgmv.pu32AddrP1Vir;

#ifdef XDP_SUPPORT_ALG_STAT
    alg_r_buf->stStat.aulAlgStart[alg_r_buf->stStat.u32Idx] = XDP_OSAL_GetTimeUS();
#endif

    s32Ret = DRV_PQ_GetVpssAlgCfg(&g_stPQFrameInfo, &stPqDispInfo, &stVpssRegInfo, &stPqVpssOutInfo);
#ifdef XDP_SUPPORT_ALG_STAT
    alg_r_buf->stStat.aulAlgEnd[alg_r_buf->stStat.u32Idx] = XDP_OSAL_GetTimeUS();
#endif

    if (HI_SUCCESS == s32Ret)
    {
        /* meaning of frame fieldorder , meaning of ifmd fieldorder are different  */
        if (HI_PQ_FIELDORDER_TOPFIRST == stPqVpssOutInfo.enFieldOrder)
        {
            g_stPQAlgInfo.eFieldOrder = WIN_FIELDORDER_TOPFIRST;
        }
        else if (HI_PQ_FIELDORDER_BOTTOMFIRST == stPqVpssOutInfo.enFieldOrder)
        {
            g_stPQAlgInfo.eFieldOrder = WIN_FIELDORDER_BOTTOMFIRST;
        }
        else
        {
            g_stPQAlgInfo.eFieldOrder = WIN_FIELDORDER_UNKOWN;
        }
    }
    else
    {
        g_stPQAlgInfo.eFieldOrder = WIN_FIELDORDER_UNKOWN;

        XDP_ERROR("RunPQAlg  fail! idx %d sttbuf %p reg %p  retbuf %p \n"
                  "soft vir rgmvp1 %p rgmvp2 %p phy %#x %#x  rgmvstride %d\n",
                  g_stPQFrameInfo.u32FrameIndex,
                  stVpssRegInfo.pstVpssWbcReg,
                  stVpssRegInfo.pstVpssReg,
                  stVpssRegInfo.pstVpssAlgRegOut,
                  alg_r_buf->stRgmv.pu32AddrP1Vir,
                  alg_r_buf->stRgmv.pu32AddrP2Vir,
                  alg_r_buf->stRgmv.u32AddrP1,
                  alg_r_buf->stRgmv.u32AddrP2,
                  alg_r_buf->stRgmv.u32Stride
                 );
    }

#ifdef XDP_SUPPORT_ALG_STAT
    {
        hiXDP_PQ_Stat_S *pstStat = &(alg_r_buf->stStat);
        HI_ULONG ulCurTime = pstStat->aulAlgEnd[pstStat->u32Idx] - pstStat->aulAlgStart[pstStat->u32Idx];

        pstStat->ulMax = XDP_OSAL_MAX(pstStat->ulMax, ulCurTime);
        pstStat->ulMin = (0 != pstStat->ulMin) ? XDP_OSAL_MIN(pstStat->ulMin, ulCurTime) : 0xffffffff;
        pstStat->ulTotal += ulCurTime;
        pstStat->u32Cnt++;
        alg_r_buf->stStat.u32Idx++;

        if (alg_r_buf->stStat.u32Idx >= PQ_ALG_TIMESTAMP_CNT)
        {
            alg_r_buf->stStat.u32Idx = PQ_ALG_TIMESTAMP_RESERVE; //skip the reserved node
        }
    }
#endif

    return;
}

HI_DRV_WIN_FIELDORDER_E Win_PQAlg_GetFodResult(HI_VOID *pstWin)
{
    (HI_VOID)pstWin;
    return  g_stPQAlgInfo.eFieldOrder;
}

static HI_S32 Win_PQAlg_AlgProcess(hiXDP_PQ_LIST_S *pstPQListBuf, hiXDP_PQ_LIST_S *pstPQListPara,
                                   hiXDP_PQ_ThreadInfo_S *pstPQAlgInfo, HI_U32 u32FrameId, HI_ULONG ulThreadStart)
{
    hiXDP_PQ_LIST_NODE_S *pstNextAlgRBufNode;
    hiXDP_PQ_LIST_NODE_S *pstNextAlgWParaNode;
    hiXDP_PQ_Buf_S *alg_r_buf;
    hiXDP_PQ_Para_S *alg_w_para;


    XDP_OSAL_DownSpin(&(g_stPQAlgInfo.stSplock));

    pstPQAlgInfo->u32AlgTry++;

    /* get alg_r_buf from buf full list */
    pstNextAlgRBufNode = Win_PQAlg_BufListDelFull(pstPQListBuf);
    if (HI_NULL != pstNextAlgRBufNode)
    {
        alg_r_buf = (hiXDP_PQ_Buf_S *)pstNextAlgRBufNode->pData;
#ifdef XDP_SUPPORT_ALG_STAT
        alg_r_buf->stStat.aulThreadStart[alg_r_buf->stStat.u32Idx] = ulThreadStart;
#endif
        pstPQAlgInfo->u32BufFullGet++;

        /* check alg_r_buf match with fn+2 */

        if (HI_TRUE == Win_PQAlg_CheckFrameBufMatch(alg_r_buf, u32FrameId))
        {
            pstPQAlgInfo->u32MatchBuf++;
            /* get alg_w_para from para empty list */
            pstNextAlgWParaNode = Win_PQAlg_ParaListDelEmpty(pstPQListPara);
            if (HI_NULL != pstNextAlgWParaNode)
            {
                pstPQAlgInfo->u32ParaEmptyGet++;

                alg_w_para = (hiXDP_PQ_Para_S *)pstNextAlgWParaNode->pData;
                SoftAlgCacl(alg_r_buf, alg_w_para);
#ifdef XDP_SUPPORT_MEM_MAGIC
                if (HI_TRUE == pstPQAlgInfo->bMagicEnable)
                {
                    XDP_OSAL_MemCheckMagic(&alg_r_buf->stAddr);
                    XDP_OSAL_MemCheckMagic(&alg_r_buf->stRegAddr);
                    XDP_OSAL_MemCheckMagic(&alg_w_para->stAddr);
                }
#endif
                alg_w_para->u32Index = alg_r_buf->u32Index; //para index is cur buf's index

                /* send alg_r_buf back to buf empty list */
                Win_PQAlg_BufListAddEmpty(pstPQListBuf, pstNextAlgRBufNode);
                /* send alg_w_para back to para full list */
                Win_PQAlg_ParaListAddFull(pstPQListPara, pstNextAlgWParaNode);

                pstPQListPara->u32CompleteCount++;
                pstPQAlgInfo->u32AlgOk++;
            }
            else
            {
                pstPQAlgInfo->u32ParaEmptyUnderload++;
                XDP_WARN("Para emptylist is underload\n");
                Win_PQAlg_BufListAddFull(pstPQListBuf, pstNextAlgRBufNode);

                XDP_OSAL_UpSpin(&(g_stPQAlgInfo.stSplock));
                return HI_FAILURE;
            }
        }
        else
        {
            pstPQAlgInfo->u32MisMatchBuf++;
            /* Not match!!! send alg_r_buf back to buf empty list,drop it */
            Win_PQAlg_BufListAddEmpty(pstPQListBuf, pstNextAlgRBufNode);
        }

        XDP_OSAL_UpSpin(&(g_stPQAlgInfo.stSplock));
        return HI_SUCCESS;
    }
    else
    {
        pstPQAlgInfo->u32BufFullUnderload++;

        XDP_OSAL_UpSpin(&(g_stPQAlgInfo.stSplock));
        return HI_FAILURE;
    }
}

HI_VOID Win_PQAlg_ISR(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    hiXDP_PQ_LIST_NODE_S *pstNextLogicWBufNode = HI_NULL;
    hiXDP_PQ_LIST_NODE_S *pstNextParaNode = HI_NULL;
    HW_DYNAMIC_FrameInfor_S *pstCurFrameInfo = &g_stPQCurFrameInfo;
    hiXDP_PQ_Buf_S *pstPrePQBuf = HI_NULL;

    XDP_INFO("enter Win_PQAlg_ISR\n");

    if (HI_TRUE != g_stPQAlgInfo.bInit)
    {
        XDP_ERROR("g_stPQAlgInfo is not init!\n");
        return;
    }

    g_stPQAlgInfo.u32ISRCycle++;

#ifdef XDP_SUPPORT_ALG_STAT
    if ((jiffies - g_stPQAlgInfo.ulISRLastCheckTime) >= HZ)
    {
        g_stPQAlgInfo.u32ISRHz = g_stPQAlgInfo.u32ISRCycle - g_stPQAlgInfo.u32ISRCycleLast;
        g_stPQAlgInfo.u32ISRCycleLast = g_stPQAlgInfo.u32ISRCycle;
        g_stPQAlgInfo.ulISRLastCheckTime = jiffies;
    }
#endif

    if (HI_FALSE == g_stPQAlgInfo.bEnable)
    {
        XDP_INFO("g_stPQAlgInfo.bEnable:%d\n", g_stPQAlgInfo.bEnable);
        return;
    }

    g_stPQAlgInfo.u32ReloadTryCnt++;
    (HI_VOID)Get_CurFrameInfo(pstCurFrameInfo);
    //printframeinfo(pstCurFrameInfo);

    /*if rwzb and fastforward scene, just turn off the logic.*/
    if (HI_TRUE == GetSoftAlgTurnOffFlag(pstCurFrameInfo))
    {
        g_stPQAlgInfo.u32RwzbCycle++;
        //1 TODO   close read, write channel
        return;
    }

    if (HI_TRUE == GetFrameInitFlag(pstCurFrameInfo))
    {
        (HI_VOID)Win_PQAlgFirstFrameInit();
    }

    if (HI_TRUE != GetSoftAlgEnableFlag(pstCurFrameInfo))
    {
        Win_PQAlgEnable(HI_FALSE);
    }
    else
    {
        Win_PQAlgEnable(HI_TRUE);
    }

    /*get the  bufnode for logical*/
    pstNextLogicWBufNode = FindUsefulBufNodeForLogic();
    /*get the input param node and write buf node.*/
    pstNextParaNode   = FindMatchedInputParamNodeForlogic();

    /*both should not be null */
    DISP_ASSERT((HI_NULL != pstNextParaNode) && (HI_NULL != pstNextLogicWBufNode));

    /*if last param not equal to current, just return it .*/
    if (g_pstCurPara != pstNextParaNode)
    {
        if (HI_NULL != g_pstCurPara)
        {
            Win_PQAlg_ParaListAddEmpty(&g_stPQListPara, g_pstCurPara);
        }

        g_pstCurPara = pstNextParaNode;
    }

    /*if last param not equal to current, just return it .*/
    if (g_pstLogicWBuf != pstNextLogicWBufNode)
    {
        if (HI_NULL != g_pstLogicWBuf)
        {
            pstPrePQBuf  = ((hiXDP_PQ_Buf_S *)(g_pstLogicWBuf->pData));
            if (HI_NULL != pstPrePQBuf)
            {
                pstPrePQBuf->stFrameInfo = *pstCurFrameInfo;
                pstPrePQBuf->u32Index = GetCurFrameIdISR();
                GetAlgCtrlInfo(pstPrePQBuf);
                GetRGMEInfo(&(pstPrePQBuf->stRgmv));
#ifdef XDP_SUPPORT_ALG_STAT
                pstPrePQBuf->stStat.aulFrmEndInt[pstPrePQBuf->stStat.u32Idx] = XDP_OSAL_GetTimeUS();
#endif
            }
            else
            {
                XDP_ERROR("Null pointer!\n");
            }

            Win_PQAlg_BufListAddFull(&g_stPQListBuf, g_pstLogicWBuf);
            Win_PQAlg_WakeUp();
        }
        g_pstLogicWBuf = pstNextLogicWBufNode;
    }

    /*next, we will config the node to hardware to let the logic run.*/
    if ((HI_NULL != g_pstLogicWBuf) && (HI_NULL != g_pstCurPara))
    {
        ConfigLogic(((hiXDP_PQ_Buf_S *)g_pstLogicWBuf->pData), ((hiXDP_PQ_Para_S *)g_pstCurPara->pData));
        g_stPQAlgInfo.u32ReloadOkCnt++;
    }
    else
    {
        XDP_ERROR("Null Pointer config %p %p\n", g_pstLogicWBuf, g_pstCurPara);
    }

    g_stPQListBuf.u32CompleteCount++;

#ifdef XDP_VIRTUAL_FRAMEINFO
    g_u32FrameIdxDbg++;
#endif

    XDP_INFO("exit Win_PQAlg_ISR\n");
    return;
}

HI_S32 Win_PQAlg_Task(HI_VOID *pArg)
{
    HI_U32 u32FrameId;
    HI_S32 s32Ret;
    HI_ULONG ulThreadStart = 0;

    XDP_INFO("enter Win_PQAlg_Task\n");

    while (!kthread_should_stop())
    {
    SOFTWARE_TASK_START:

#ifdef XDP_SUPPORT_ALG_STAT
        ulThreadStart = XDP_OSAL_GetTimeUS();
        if ((jiffies - g_stPQAlgInfo.ulTaskLastCheckTime) >= HZ)
        {
            g_stPQAlgInfo.u32TaskHz = g_stPQAlgInfo.u32TaskCycle - g_stPQAlgInfo.u32TaskCycleLast;
            g_stPQAlgInfo.u32TaskCycleLast = g_stPQAlgInfo.u32TaskCycle;
            g_stPQAlgInfo.ulTaskLastCheckTime = jiffies;
        }
#endif
        g_stPQAlgInfo.u32TaskCycle++;

        if ((HI_TRUE == g_stPQAlgInfo.bNeedSleep)
            || (HI_TRUE == g_stPQAlgInfo.bExit)
           )
        {
            g_stPQAlgInfo.u32ExitCycle++;
            goto SOFTWARE_TASK_IDLE;
        }

        g_stPQAlgInfo.u32Pos = 1;

        if (HI_TRUE != g_stPQAlgInfo.bEnable)
        {
            g_stPQAlgInfo.u32DisableCycle++;
            goto SOFTWARE_TASK_IDLE;
        }

        u32FrameId = GetCurFrameIdThread();
        s32Ret = Win_PQAlg_AlgProcess(&g_stPQListBuf, &g_stPQListPara, &g_stPQAlgInfo, u32FrameId, ulThreadStart);
        if (HI_SUCCESS == s32Ret)
        {
            goto SOFTWARE_TASK_START;
        }

    SOFTWARE_TASK_IDLE:
        g_stPQAlgInfo.u32IdleCycle++;
        g_stPQAlgInfo.u32Pos = 2;
        if (HI_TRUE == g_stPQAlgInfo.bExit)
        {
            Win_PQAlg_ResetList();
            XDP_OSAL_GiveEvent(&g_stPQAlgInfo.stEventStop, EVENT_DONE, EVENT_UNDO);
            break;
        }
        XDP_OSAL_WaitEvent(&g_stPQAlgInfo.stNextFrame, g_stPQAlgInfo.u32NextFrameGap);
        XDP_OSAL_ResetEvent(&g_stPQAlgInfo.stNextFrame, EVENT_UNDO, EVENT_UNDO);
    }

    g_stPQAlgInfo.u32Pos = 9;

    XDP_INFO("exit Win_PQAlg_Task\n");
    return HI_SUCCESS;
}

HI_VOID Win_PQAlg_WakeUp(HI_VOID)
{
    XDP_OSAL_GiveEvent(&(g_stPQAlgInfo.stNextFrame), EVENT_DONE, EVENT_UNDO);
}

HI_BOOL Win_PQAlg_CheckFrameParaMatch(hiXDP_PQ_Para_S *pstNextPara, HI_U32 u32FrameId)
{
    /*will the para*/
    if ((pstNextPara->u32Index + 1 == u32FrameId)
        || ((0 == pstNextPara->u32Index) && (0 == u32FrameId)))
    {
        //HI_PRINT("Para MATCH curfrmid paraid %d %d\n", u32FrameId, pstNextPara->u32Index);
        return HI_TRUE;
    }
    else
    {
        XDP_WARN("Para MisMATCH curfrmid paraid %d %d\n", u32FrameId, pstNextPara->u32Index);
        return HI_FALSE;
    }
}

HI_BOOL Win_PQAlg_CheckFrameBufMatch(hiXDP_PQ_Buf_S *pstNextBuf, HI_U32 u32FrameId)
{
    if ((pstNextBuf->u32Index + 1 == u32FrameId)
        || (pstNextBuf->u32Index == u32FrameId))
    {
        //HI_PRINT("Buf MATCH curfrmid bufid %d %d\n", u32FrameId, pstNextBuf->u32Index);
        return HI_TRUE;
    }
    else
    {
        XDP_WARN("Buf MisMATCH curfrmid bufid %d %d\n", u32FrameId, pstNextBuf->u32Index);
        return HI_FALSE;
    }
}

HI_VOID Win_PQAlg_ShowTaskState(struct seq_file *p)
{
    PROC_PRINT(p,
               "------------------------------\n"
               "bInit %d bEn %d bExit %d bSleep %d Pos %d\n"
               "------------------------------\n"
#ifdef XDP_SUPPORT_MEM_MAGIC
               "MagicEnable:%d\n"
#endif
               "u32ExitCycle: %d\n"
               "u32DisableCycle: %d\n"
               "u32RepeatCycle: %d\n"
               "u32RwzbCycle: %d\n"
               "u32IdleCycle: %d\n"
               "u32ReInitCycle: %d\n"
               "u32FrameIndexCur:%d\n"
               "ISR  Hz(/%dms):%d\n"
               "Task Hz(/%dms):%d\n"
               "------------------------------\n"
               "u32ISRCycle: %d\n"
               "u32ReloadTryCnt: %d\n"
               "u32ParaFullGet: %d\n"
               "u32ParaFullUnderload: %d\n"
               "u32ParaMatch: %d\n"
               "u32ParaMisMatch: %d\n"
               "u32ParaRunInISR:%d\n"
               "u32ParaRetryOk:%d\n"
               "u32ParaUseLast:%d\n"
               "u32BufEmptyGet:%d\n"
               "u32BufEmptyUnderload:%d\n"
               "u32ReloadOkCnt: %d\n"
               "a:%d b:%d c:%d d:%d\n"
               "------------------------------\n"
               "u32TaskCycle: %d\n"
               "u32AlgTry: %d\n"
               "u32BufFullGet: %d\n"
               "u32BufFullUnderload: %d\n"
               "u32BufMatch: %d\n"
               "u32BufMisMatch: %d\n"
               "u32ParaEmptyGet: %d\n"
               "u32ParaEmptyUnderload: %d\n"
               "u32AlgOk: %d\n"
               ,

               g_stPQAlgInfo.bInit,
               g_stPQAlgInfo.bEnable,
               g_stPQAlgInfo.bExit,
               g_stPQAlgInfo.bNeedSleep,
               g_stPQAlgInfo.u32Pos,
#ifdef XDP_SUPPORT_MEM_MAGIC
               g_stPQAlgInfo.bMagicEnable,
#endif
               g_stPQAlgInfo.u32ExitCycle,
               g_stPQAlgInfo.u32DisableCycle,
               g_stPQAlgInfo.u32RepeatCycle,
               g_stPQAlgInfo.u32RwzbCycle,
               g_stPQAlgInfo.u32IdleCycle,
               g_stPQAlgInfo.u32ReInitCycle,
               g_u32FrameIndexCur,
#ifdef XDP_SUPPORT_ALG_STAT
               HZ, g_stPQAlgInfo.u32ISRHz,
               HZ, g_stPQAlgInfo.u32TaskHz,
#else
               0, 0,
               0, 0,
#endif
               g_stPQAlgInfo.u32ISRCycle,
               g_stPQAlgInfo.u32ReloadTryCnt,
               g_stPQAlgInfo.u32ParaFullGet,
               g_stPQAlgInfo.u32ParaFullUnderload,
               g_stPQAlgInfo.u32ParaMatch,
               g_stPQAlgInfo.u32ParaMisMatch,
               g_stPQAlgInfo.u32ParaRunInISR,
               g_stPQAlgInfo.u32ParaRetryOk,
               g_stPQAlgInfo.u32ParaUseLast,
               g_stPQAlgInfo.u32BufEmptyGet,
               g_stPQAlgInfo.u32BufEmptyUnderload,
               g_stPQAlgInfo.u32ReloadOkCnt,

               g_u32a, g_u32b, g_u32c, g_u32d,

               g_stPQAlgInfo.u32TaskCycle,
               g_stPQAlgInfo.u32AlgTry,
               g_stPQAlgInfo.u32BufFullGet,
               g_stPQAlgInfo.u32BufFullUnderload,
               g_stPQAlgInfo.u32MatchBuf,
               g_stPQAlgInfo.u32MisMatchBuf,
               g_stPQAlgInfo.u32ParaEmptyGet,
               g_stPQAlgInfo.u32ParaEmptyUnderload,
               g_stPQAlgInfo.u32AlgOk
              );

}
#ifdef XDP_SUPPORT_ALG_STAT
HI_VOID Win_PQAlg_ShowListState(struct seq_file *p, hiXDP_PQ_LIST_S *pstList)
{

    PROC_PRINT(p,
               "--------------FULL--------------\n"
               "Add(Try/Ok):      %d/%d\n"
               "Del(Try/Ok):      %d/%d\n"
               "Check(Try/Ok):    %d/%d\n"

               "--------------EMPTY--------------\n"
               "Add(Try/Ok):      %d/%d\n"
               "Del(Try/Ok):      %d/%d\n"
               "Check(Try/Ok):    %d/%d\n"
               "Complete:         %d\n",
               pstList->u32FullListAddTryCnt,
               pstList->u32FullListAddOkCnt,
               pstList->u32FullListDelTryCnt,
               pstList->u32FullListDelOkCnt,
               pstList->u32FullListCheckTryCnt,
               pstList->u32FullListCheckOkCnt,

               pstList->u32EmptyListAddTryCnt,
               pstList->u32EmptyListAddOkCnt,
               pstList->u32EmptyListDelTryCnt,
               pstList->u32EmptyListDelOkCnt,
               pstList->u32EmptyListCheckTryCnt,
               pstList->u32EmptyListCheckOkCnt,
               pstList->u32CompleteCount
              );

    return;
}

HI_VOID Win_PQAlg_ShowTimeStat(struct seq_file *p, hiXDP_PQ_LIST_S *pstList)
{
    LIST *pos, *n;
    hiXDP_PQ_LIST_NODE_S *pstTarget = HI_NULL;
    hiXDP_PQ_Buf_S *pstBuf = HI_NULL;
    hiXDP_PQ_Stat_S *pstStat = HI_NULL;
    HI_U32 u32Idx;

    XDP_OSAL_DownSpin(&(pstList->stSpinLock));
    pstList->u32EmptyListCheckTryCnt++;
    list_for_each_safe(pos, n, &(pstList->stEmptyList))
    {
        pstTarget = list_entry(pos, hiXDP_PQ_LIST_NODE_S, node);
        if (HI_NULL != pstTarget)
        {
            pstBuf = (hiXDP_PQ_Buf_S *)pstTarget->pData;
            if (HI_NULL != pstBuf)
            {
                PROC_PRINT(p,
                           "---------TimeStat---------\n"
                          );
                pstStat = &(pstBuf->stStat);

                for (u32Idx = 0; u32Idx < PQ_ALG_TIMESTAMP_CNT; u32Idx++)
                {

                    PROC_PRINT(p, "CfgLogic %lu FrmEnd %lu ThreadStart %lu AlgStart %lu AlgEnd %lu\n",
                               pstStat->aulCfgLogicRun[u32Idx],
                               pstStat->aulFrmEndInt[u32Idx],
                               pstStat->aulThreadStart[u32Idx],
                               pstStat->aulAlgStart[u32Idx],
                               pstStat->aulAlgEnd[u32Idx]
                              );
                }
                PROC_PRINT(p,
                           "MAX %lu MIN %lu AVG %lu Count %u\n",
                           pstStat->ulMax,
                           pstStat->ulMin,
                           (0 != pstStat->u32Cnt) ? pstStat->ulTotal / pstStat->u32Cnt : 0xffffffff,
                           pstStat->u32Cnt
                          );

            }
        }
    }

    XDP_OSAL_UpSpin(&(pstList->stSpinLock));

    return;
}
#endif

#if 0
HI_VOID printframeinfo(HW_DYNAMIC_FrameInfor_S *pstCurFrameInfo)
{
    HI_PRINT("Frm idx %d Prog %d w h %d %d bitw %d field %d fieldorder %d rata %d\n"
             "rwzb %d ff %d fr %d offline %d dei %d tnr %d mcnr %d snr %d db %d dm %d\n"
             "u32VpssChnAddr %#x  u32VpssChnVirtAddr %#x\n",

             pstCurFrameInfo->u32DynamicFrameIndex,
             pstCurFrameInfo->bProgressive,
             pstCurFrameInfo->u32Width,
             pstCurFrameInfo->u32Height,
             pstCurFrameInfo->u32BitWidth,
             pstCurFrameInfo->s32FieldMode,
             pstCurFrameInfo->u32FieldOrder,
             pstCurFrameInfo->u32FrameRate,

             pstCurFrameInfo->bRWZB,
             pstCurFrameInfo->bFastForward,
             pstCurFrameInfo->bFastRefMode,
             pstCurFrameInfo->bOfflineMode,
             pstCurFrameInfo->bDeiEn,
             pstCurFrameInfo->bTnrEn,
             pstCurFrameInfo->bMcnrEn,
             pstCurFrameInfo->bSnrEn,
             pstCurFrameInfo->bDbEn,
             pstCurFrameInfo->bDmEn,

             pstCurFrameInfo->u32VpssChnAddr,
             pstCurFrameInfo->u32VpssChnVirtAddr
            );
}
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
