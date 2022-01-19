#include "basedef.h"
#include "mem_manage.h"
#include "public.h"
#ifdef ENV_SOS_KERNEL
#include "vfmw_sos_kernel_osal.h"
#else
#include "vfmw_linux_kernel_osal.h"
#endif
#include "vfmw_osal_ext.h"


#ifdef ENV_ARMLINUX_KERNEL
#define  TRACE_MEM_SIZE     (16*1024*2)
#define  MAX_FUNC_NAME_LEN  (15)

/* Trace object */
typedef struct hiTRACE_OBJ_S
{
    SINT8    s8FuncName[MAX_FUNC_NAME_LEN + 1];
    SINT32   s32LineNum;
    SINT32   s32Data;
    UINT32   u32Time;
} TRACE_OBJ_S;

/* Traver */
typedef struct  hiTRACE_DESC_S
{
    /* ID */
    UINT32   u32ValidFlag[4];

    /* Base Addr */
    TRACE_OBJ_S  *pstTraceBaseObj;
    UADDR       s32TraceBasePhyAddr;

    /* Index */
    SINT32   s32MaxTraceNumMinus4;
    SINT32   s32CurrTraceNum;
} TRACE_DESC_S;


TRACE_DESC_S *s_pstTracer = 0;
UADDR        g_TracerPhyAddr = 0;

VOID  *g_fpLog    = NULL;
SINT32 g_LogEnable = 0;
SINT8  g_LogFileName[500];
#endif

UINT32 g_PrintEnable = DEFAULT_PRINT_ENABLE;    /* print control */
UINT32 g_PrintDevice = DEFAULT_PRINT_DEVICE;    /* print output device */
SINT8  g_TmpMsg[TMP_MSG_SIZE];                          /* print msg tmp space */
MEMPRINT *g_pMemPrint = 0;

SINT32 g_TraceCtrl = 0xffffffff;                /* vfmw run state control */
SINT32 g_TraceBsPeriod = 200;                   /* bit stream print period */
SINT32 g_TraceFramePeriod = 0;                  /* frame info print period */
SINT32 g_TraceImgPeriod = 500;                  /* image info print period */
SINT32 g_TunnelLineNumber = 1;                 /* line number of tunnel mode */
UINT32 g_BackTunnelCtrl = 0x140;

char *g_strDefine[] =
{
    "vdec_vdh",
    "vdec_vdh_safe",
    "vdec_vdh1",
    "vdec_vdh2",
    "vdec_scd",
    "vdec_scd_safe",
    "vdec_scd1",
    "VFMW_Chan_Ctx",
    "VFMW_Chan_Vdh",
    "VFMW_Chan_Scd",
    "VFMW_DspCtxMem",
    "RESERVE_1",
    "RESERVE_2",
    "mmu_vdh",
    "mmu_vdh_safe",
    "VFMW_Hal_%d",
    "VFMW_VP9Prob_%d",
    "VFMW_ScdMsg_%d",
    "VFMW_Tracer",
    "VFMW_SAVE_YUV_MEM",
    "%s/vfmw_raw_save_%d.dat",
    "%s/vfmw_seg_save_%d.dat",
    "%s/vfmw_yuv_save_disp_%d.yuv", /*20*/
    "%s/vfmw_yuv_save_dec_%d.yuv",
    "%s/vfmw_metadata_save_%d.dat",
    "%s/vfmw_metadata_reorder_save_%d.dat",
    "%s/vfmw_el_save_%d.dat",
};

char *VFMW_GetString(VFMW_STRING_E enStringName)
{
    if (enStringName >= VFMW_STRING_BUTT)
    {
        dprint(PRN_FATAL, "___________invalid parm= %d ____________\n", enStringName);
        return "";
    }

    return g_strDefine[enStringName];
}

#ifdef ENV_ARMLINUX_KERNEL
#define VF0  0x1a2a3a4a
#define VF1  0x55657585
#define VF2  0x0f152f35
#define VF3  0x4a5f6a7f

SINT32 DBG_CreateTracer(VOID)
{
    SINT32 ret;
    MEM_RECORD_S MemRecord;

    if (s_pstTracer)
    {
        return DBG_OK;
    }

#ifdef HI_SMMU_SUPPORT
    MemRecord.eMode = MEM_MMU_MMU;
#else
    MemRecord.eMode = MEM_CMA_CMA;
#endif

    ret = MEM_AllocMemBlock(VFMW_GetString(VFMW_STRING_TRACER), 0, TRACE_MEM_SIZE, &MemRecord, 0);

    if (ret != MEM_MAN_OK)
    {
        return DBG_ERR;
    }

    MEM_AddMemRecord(MemRecord.PhyAddr, MemRecord.VirAddr, MemRecord.Length);

    s_pstTracer = (TRACE_DESC_S *)MemRecord.VirAddr;
    g_TracerPhyAddr = MemRecord.PhyAddr;

    OSAL_FP_memset(MemRecord.VirAddr, 0, TRACE_MEM_SIZE);

    s_pstTracer->pstTraceBaseObj = (TRACE_OBJ_S *)(MemRecord.VirAddr + sizeof(TRACE_DESC_S));
    s_pstTracer->s32TraceBasePhyAddr = (MemRecord.PhyAddr + sizeof(TRACE_DESC_S));

    s_pstTracer->s32MaxTraceNumMinus4 = (MemRecord.Length - sizeof(TRACE_DESC_S)) / sizeof(TRACE_OBJ_S) - 4;
    s_pstTracer->s32CurrTraceNum = 0;

    s_pstTracer->u32ValidFlag[0] = VF0;
    s_pstTracer->u32ValidFlag[1] = VF1;
    s_pstTracer->u32ValidFlag[2] = VF2;
    s_pstTracer->u32ValidFlag[3] = VF3;

    dprint(PRN_DBG, "________________ mem_phy, trace_phy,trace_max = 0x%x, 0x%x,%d _________________\n", MemRecord.PhyAddr,
           (MemRecord.PhyAddr + sizeof(TRACE_DESC_S)), s_pstTracer->s32MaxTraceNumMinus4);

    return DBG_OK;
}

VOID DBG_DestroyTracer(VOID)
{
    UADDR PhyAddr;

    if (s_pstTracer == NULL)
    {
        return;
    }

    PhyAddr = MEM_Vir2Phy((SINT8 *)s_pstTracer);

    MEM_ReleaseMemBlock(PhyAddr, (SINT8 *)s_pstTracer);

    dprint(PRN_DBG, "=============== destroy tracer: phy,vir = 0x%x,%p ===================\n", PhyAddr, s_pstTracer);
    s_pstTracer = NULL;

    return;
}

VOID DBG_AddTrace(SINT8 *pFuncName, SINT32 nLine, SINT32 Data)
{
    SINT32 s32CurrTraceNum;
    TRACE_OBJ_S *pstTraceObj;

    if (s_pstTracer == NULL)
    {
        return;
    }

    s32CurrTraceNum = s_pstTracer->s32CurrTraceNum;

    s_pstTracer->s32CurrTraceNum = (s32CurrTraceNum < s_pstTracer->s32MaxTraceNumMinus4) ? (s32CurrTraceNum + 1) : 0;
    pstTraceObj = s_pstTracer->pstTraceBaseObj + s32CurrTraceNum;

    pstTraceObj->s32LineNum = nLine;
    pstTraceObj->s32Data = Data;

    pstTraceObj->u32Time = OSAL_FP_get_time_us();

    OSAL_FP_strlcpy(pstTraceObj->s8FuncName, pFuncName, MAX_FUNC_NAME_LEN);

    return;
}

VOID DBG_PrintTracer(VOID)
{
    SINT32 i;
    SINT32 s32CurrTraceNum;
    UINT32 *pv;
    TRACE_OBJ_S *pstTraceObj;
    TRACE_DESC_S *pstThisTracer;

    if (s_pstTracer == NULL)
    {
        pstThisTracer = (TRACE_DESC_S *)OSAL_FP_ioremap(g_TracerPhyAddr, 1024 * 1024);

        if (pstThisTracer == NULL)
        {
            dprint(PRN_ALWS, "map vir address for '%x' failed!!!\n", g_TracerPhyAddr);
            return;
        }

        pstThisTracer->pstTraceBaseObj = (TRACE_OBJ_S *)((UINT8 *)pstThisTracer + sizeof(TRACE_DESC_S));

        dprint(PRN_ALWS, "tracer memory '0x%x' is mapped to '%p'\n", g_TracerPhyAddr, pstThisTracer);
    }
    else
    {
        pstThisTracer = s_pstTracer;
    }

    if (pstThisTracer == NULL)
    {
        dprint(PRN_ALWS, "map vir address for '%x' failed!!!\n", g_TracerPhyAddr);
        return;
    }

    pv = &pstThisTracer->u32ValidFlag[0];

    if (pv[0] != VF0 || pv[1] != VF1 || pv[2] != VF2 || pv[3] != VF3)
    {
        dprint(PRN_ALWS, "no valid trace info stored in '%x'!!!\n", g_TracerPhyAddr);
        return;
    }

    dprint(PRN_ALWS, "====================== tracer context =====================\n");
    dprint(PRN_ALWS, "%-25s :%x\n", "pstTraceBaseObj", pstThisTracer->pstTraceBaseObj);
    dprint(PRN_ALWS, "%-25s :%p\n", "s32TraceBasePhyAddr", pstThisTracer->s32TraceBasePhyAddr);
    dprint(PRN_ALWS, "%-25s :%d\n", "s32MaxTraceNumMinus4", pstThisTracer->s32MaxTraceNumMinus4);
    dprint(PRN_ALWS, "%-25s :%d\n", "s32CurrTraceNum", pstThisTracer->s32CurrTraceNum);

    s32CurrTraceNum = pstThisTracer->s32CurrTraceNum;

    for (i = 0; i < pstThisTracer->s32MaxTraceNumMinus4; i++)
    {
        s32CurrTraceNum = (s32CurrTraceNum == 0) ? pstThisTracer->s32MaxTraceNumMinus4 : (s32CurrTraceNum - 1);
        pstTraceObj = pstThisTracer->pstTraceBaseObj + s32CurrTraceNum;

        dprint(PRN_ALWS, "-%05d-", i);
        dprint(PRN_ALWS, "func:%-15s;", pstTraceObj->s8FuncName);
        dprint(PRN_ALWS, " line:%5d;", pstTraceObj->s32LineNum);
        dprint(PRN_ALWS, " data:0x%08x(%-10d);", pstTraceObj->s32Data, pstTraceObj->s32Data);
        dprint(PRN_ALWS, " time:%u\n", pstTraceObj->u32Time);
    }

    if (s_pstTracer == NULL)
    {
        OSAL_FP_iounmap(pstThisTracer);
    }

    return;
}
#endif

VBOOL IsPrintStateAllow(SINT32 ChanID)
{
    UINT32 CurTime = 0;
    static UINT32 LastRecStateTime[MAX_CHAN_NUM] = {0};

    if (ChanID < 0 || ChanID >= MAX_CHAN_NUM)
    {
        return VDEC_FALSE;
    }

    CurTime = OSAL_FP_get_time_ms();

    if (CurTime - LastRecStateTime[ChanID] < g_TraceBsPeriod)
    {
        return VDEC_FALSE;
    }

    LastRecStateTime[ChanID] = CurTime;

    return VDEC_TRUE;
}

SINT32 IsDprintTypeEnable(UINT32 type)
{
    if ((PRN_ALWS != type) && (0 == (g_PrintEnable & (1 << type))))
    {
        return 0;
    }

    return 1;
}

VOID dprint_nothing(VOID)
{
    return;
}

#ifdef ENV_ARMLINUX_KERNEL
SINT32 dprint_normal(UINT32 type, UINT32 line, const SINT8 *format, ...)
{
    va_list args;
    SINT32 nTotalChar = 0;

    if (IsDprintTypeEnable(type) == 0)
    {
        return -1;
    }

    va_start(args, format);
    nTotalChar = vsnprintf(g_TmpMsg, sizeof(g_TmpMsg), format, args);
    g_TmpMsg[sizeof(g_TmpMsg) - 1] = '\0';
    va_end(args);

    if ((nTotalChar <= 0) || (nTotalChar > TMP_MSG_SIZE))
    {
        return -1;
    }

    if (DEV_SCREEN == g_PrintDevice)
    {
    #ifdef HI_ADVCA_FUNCTION_RELEASE
        return 0;
    #else
        return (printk("VFMW[%d]: %s", line, g_TmpMsg));
    #endif
    }

    return -1;
}
#endif

SINT32 CHECK_REC_POS_ENABLE(SINT32 type)
{
    if ((g_TraceCtrl & (1 << type)) != 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

VOID RecordPOS(SINT32 SmID, VFMW_STATE_TYPE_E VfmwStateType, UINT32 *LastRecPosTimeInMs, SINT8 *FunctionName, SINT32 LineNumber)
{
    SINT32 data = 0;
    UINT32 CurTimeInMs = 0;

    if (CHECK_REC_POS_ENABLE(VfmwStateType))
    {
        CurTimeInMs = OSAL_FP_get_time_ms();

        if ((CurTimeInMs - *LastRecPosTimeInMs) > g_TraceBsPeriod)
        {
            *LastRecPosTimeInMs = CurTimeInMs;
            data = (SmID << 24) + (VfmwStateType << 16);
            REC_POS_NEW(FunctionName, LineNumber, data);
        }
    }
}

SINT32 GetCompressRatio(SINT32 CompressRegCfg)
{
    SINT32 CompressRatio;

    switch (CompressRegCfg)
    {
        case 0: /*0.5*/
            CompressRatio = COMPRESS_RATIO_0;
            break;

        case 1: /*0.625*/
            CompressRatio = COMPRESS_RATIO_1;
            break;

        case 2: /*0.75*/
            CompressRatio = COMPRESS_RATIO_2;
            break;

        case 3: /*0.875*/
            CompressRatio = COMPRESS_RATIO_3;
            break;

        default: /*1*/
            CompressRatio = COMPRESS_RATIO_LCM;
            break;
    }

    return CompressRatio;
}

inline VBOOL check_signed_integer_operation_overflow(SINT32 a, SINT32 b)
{
    if (((b > 0) && (a > (VFMW_INT_MAX - b)))
        || ((b < 0) && (a < (VFMW_INT_MIN - b))))
    {
        return VDEC_TRUE;
    }
    else
    {
        return VDEC_FALSE;
    }
}

inline VBOOL check_unsigned_integer_operation_overflow(UINT32 a, UINT32 b)
{
    if ((VFMW_UINT_MAX - a) < b)
    {
        return VDEC_TRUE;
    }
    else
    {
        return VDEC_FALSE;
    }
}

/* this parameter defines the cutoff between using quick sort and
   insertion sort for arrays; arrays with lengths shorter or equal to the
   below value use insertion sort */

#define CUTOFF 8            /* testing shows that this is good value */

static void swap_kn(char *a, char *b, size_t width)
{
    char tmp;

    if (a != b)
    {
        /* Do the swap one character at a time to avoid potential alignment
           problems. */
        while (width--)
        {
            tmp = *a;
            *a++ = *b;
            *b++ = tmp;
        }
    }
}

static void shortsort(char *lo, char *hi, size_t width,
                      int (*comp)(const void *, const void *))
{
    char *p, *max;

    /* Note: in assertions below, i and j are alway inside original bound of
       array to sort. */

    while (hi > lo)
    {
        /* A[i] <= A[j] for i <= j, j > hi */
        max = lo;

        for (p = lo + width; p <= hi; p += width)
        {
            /* A[i] <= A[max] for lo <= i < p */
            if (comp(p, max) > 0)
            {
                max = p;
            }

            /* A[i] <= A[max] for lo <= i <= p */
        }

        /* A[i] <= A[max] for lo <= i <= hi */

        swap_kn(max, hi, width);

        /* A[i] <= A[hi] for i <= hi, so A[i] <= A[j] for i <= j, j >= hi */

        hi -= width;

        /* A[i] <= A[j] for i <= j, j > hi, loop top condition established */
    }

    /* A[i] <= A[j] for i <= j, j > lo, which implies A[i] <= A[j] for i < j,
       so array is sorted */
}

#define STKSIZ (8 * sizeof(void *) - 2)

void qsort(void *base, UINT32 num, UINT32 width, int (*comp)(const void *, const void *))
{
    char *lo, *hi;
    char *mid;
    char *loguy, *higuy;
    UINT32 size;
    char *lostk[STKSIZ], *histk[STKSIZ];
    int stkptr;

    if (num < 2 || width == 0)
    {
        return;  /* nothing to do */
    }

    stkptr = 0;                 /* initialize stack */

    lo = base;
    hi = (char *)base + width * (num - 1);      /* initialize limits */

    /* this entry point is for pseudo-recursion calling: setting
       lo and hi and jumping to here is like recursion, but stkptr is
       preserved, locals aren't, so we preserve stuff on the stack */

recurse:

    size = (hi - lo) / width + 1;        /* number of el's to sort */

    /* below a certain size, it is faster to use a O(n^2) sorting method */

    if (size <= CUTOFF)
    {
        shortsort(lo, hi, width, comp);
    }
    else
    {
        /* First we pick a partitioning element.  The efficiency of the
           algorithm demands that we find one that is approximately the
           median of the values, but also that we select one fast.  We choose the
           median of the first, middle, and last elements, to avoid bad
           performance in the face of already sorted data, or data that is
           made up of multiple sorted runs appended together.  Testing shows that
           a median-of-three algorithm provides better performance than simply
           picking the middle element for the latter case. */

        mid = lo + (size / 2) * width;      /* find middle element */

        /* Sort the first, middle, last elements into order */
        if (comp(lo, mid) > 0)
        {
            swap_kn(lo, mid, width);
        }

        if (comp(lo, hi) > 0)
        {
            swap_kn(lo, hi, width);
        }

        if (comp(mid, hi) > 0)
        {
            swap_kn(mid, hi, width);
        }

        /* We now wish to partition the array into three pieces, one
           consisting of elements <= partition element, one of elements equal to the
           partition element, and one of elements > than it.  This is done
           below; comments indicate conditions established at every step. */
        loguy = lo;
        higuy = hi;

        /* Note that higuy decreases and loguy increases on every iteration,
           so loop must terminate. */
        for (;;)
        {
            /* lo <= loguy < hi, lo < higuy <= hi,
               A[i] <= A[mid] for lo <= i <= loguy,
               A[i] > A[mid] for higuy <= i < hi,
               A[hi] >= A[mid] */

            /* The doubled loop is to avoid calling comp(mid,mid), since some
               existing comparison funcs don't work when passed the same
               value for both pointers. */

            if (mid > loguy)
            {
                do
                {
                    loguy += width;
                }
                while (loguy < mid && comp(loguy, mid) <= 0);
            }

            if (mid <= loguy)
            {
                do
                {
                    loguy += width;
                }
                while (loguy <= hi && comp(loguy, mid) <= 0);
            }

            /* lo < loguy <= hi+1, A[i] <= A[mid] for lo <= i < loguy,
               either loguy > hi or A[loguy] > A[mid] */
            do
            {
                higuy -= width;
            }
            while (higuy > mid && comp(higuy, mid) > 0);

            /* lo <= higuy < hi, A[i] > A[mid] for higuy < i < hi,
               either higuy == lo or A[higuy] <= A[mid] */
            if (higuy < loguy)
            {
                break;
            }

            /* if loguy > hi or higuy == lo, then we would have exited, so
               A[loguy] > A[mid], A[higuy] <= A[mid],
               loguy <= hi, higuy > lo */

            swap_kn(loguy, higuy, width);

            /* If the partition element was moved, follow it.  Only need
               to check for mid == higuy, since before the swap,
               A[loguy] > A[mid] implies loguy != mid. */

            if (mid == higuy)
            { mid = loguy; }

            /* A[loguy] <= A[mid], A[higuy] > A[mid]; so condition at top
               of loop is re-established */
        }

        /* A[i] <= A[mid] for lo <= i < loguy,
           A[i] > A[mid] for higuy < i < hi,
           A[hi] >= A[mid]
           higuy < loguy
        implying:
           higuy == loguy-1
           or higuy == hi - 1, loguy == hi + 1, A[hi] == A[mid] */

        /* Find adjacent elements equal to the partition element.  The
           doubled loop is to avoid calling comp(mid,mid), since some
           existing comparison funcs don't work when passed the same value
           for both pointers. */
        higuy += width;

        if (mid < higuy)
        {
            do
            {
                higuy -= width;
            }
            while (higuy > mid && comp(higuy, mid) == 0);
        }

        if (mid >= higuy)
        {
            do
            {
                higuy -= width;
            }
            while (higuy > lo && comp(higuy, mid) == 0);
        }

        /* OK, now we have the following:
              higuy < loguy
              lo <= higuy <= hi
              A[i]  <= A[mid] for lo <= i <= higuy
              A[i]  == A[mid] for higuy < i < loguy
              A[i]  >  A[mid] for loguy <= i < hi
              A[hi] >= A[mid] */

        /* We've finished the partition, now we want to sort the subarrays
           [lo, higuy] and [loguy, hi].
           We do the smaller one first to minimize stack usage.
           We only sort arrays of length 2 or more.*/

        if (higuy - lo >= hi - loguy)
        {
            if (lo < higuy)
            {
                lostk[stkptr] = lo;
                histk[stkptr] = higuy;
                ++stkptr;
            }                           /* save big recursion for later */

            if (loguy < hi)
            {
                lo = loguy;
                goto recurse;           /* do small recursion */
            }
        }
        else
        {
            if (loguy < hi)
            {
                lostk[stkptr] = loguy;
                histk[stkptr] = hi;
                ++stkptr;               /* save big recursion for later */
            }

            if (lo < higuy)
            {
                hi = higuy;
                goto recurse;           /* do small recursion */
            }
        }
    }

    /* We have sorted the array, except for any pending sorts on the stack.
       Check if there are any, and do them. */
    --stkptr;

    if (stkptr >= 0)
    {
        lo = lostk[stkptr];
        hi = histk[stkptr];
        goto recurse;           /* pop subarray from stack */
    }

    return;                     /* all subarrays done */
}

SINT32 string_to_value(char *str, UINT32 *data)
{
    UINT32 i, d, dat, weight;

    dat = 0;

    i = 0;
    weight = 10;

    if (str[0] == '0' && (str[1] == 'x' || str[1] == 'X'))
    {
        i = 2;
        weight = 16;
    }

    for (; i < 10; i++)
    {
        if (str[i] < 0x20)
        {
            break;
        }
        else if (weight == 16 && str[i] >= 'a' && str[i] <= 'f')
        {
            d = str[i] - 'a' + 10;
        }
        else if (weight == 16 && str[i] >= 'A' && str[i] <= 'F')
        {
            d = str[i] - 'A' + 10;
        }
        else if (str[i] >= '0' && str[i] <= '9')
        {
            d = str[i] - '0';
        }
        else
        {
            return -1;
        }

        dat = dat * weight + d;
    }

    *data = dat;

    return 0;
}

