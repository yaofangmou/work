#include "vmm_osal.h"
#include "vmm_memory_ops.h"
#ifdef OPS_PRESERVE_SUPPORT
#include "vmm_memory_preserve.h"
#endif
#ifdef OPS_DYNAMIC_SUPPORT
#include "vmm_memory_dynamic.h"
#endif

typedef struct VMM_MEMORY_OPS_FUN_PTR_S
{
    SINT32  (*pfun_Init)(VOID *pArgs);
    VOID    (*pfun_Deinit)(VOID);
    SINT32  (*pfun_Alloc)(VMM_BUFFER_S *pMemInfo);
    SINT32  (*pfun_Release)(VMM_BUFFER_S *pMemInfo);
    SINT32  (*pfun_Map)(VMM_BUFFER_S *pMemInfo);
    SINT32  (*pfun_Unmap)(VMM_BUFFER_S *pMemInfo);
    SINT32  (*pfun_Invoke)(VMM_INVOKE_ATTR_S *pParam);
    VOID    (*pfun_ReadProc)(VOID *p);
} MEMORY_OPS_FUN_PTR_S;

typedef struct VMM_MEMORY_OPS_CTX_S
{
    UINT32               ModuleNum;
    UINT32               RegisterNum;
    MEMORY_OPS_FUN_PTR_S *pVmmOpsFunc;
} MEMORY_OPS_CTX_S;

VMM_PRIVATE MEMORY_OPS_CTX_S g_VmmOpsCtx =
{
    .ModuleNum   = 0,
    .RegisterNum = 0,
    .pVmmOpsFunc = NULL
};

#define Mem_Alloc(Handle, pMemInfo) \
    (((Handle < g_VmmOpsCtx.RegisterNum) && (g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Alloc)) ? \
     g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Alloc(pMemInfo): \
     MEM_OPS_NULL_FUNC_PTR)

#define Mem_Release(Handle, pMemInfo) \
    (((Handle < g_VmmOpsCtx.RegisterNum) && (g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Release)) ? \
     g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Release(pMemInfo): \
     MEM_OPS_NULL_FUNC_PTR)

#define Mem_Map(Handle, pMemInfo) \
    (((Handle < g_VmmOpsCtx.RegisterNum) && (g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Map)) ? \
     g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Map(pMemInfo): \
     MEM_OPS_NULL_FUNC_PTR)

#define Mem_UnMap(Handle, pMemInfo) \
    (((Handle < g_VmmOpsCtx.RegisterNum) && (g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Unmap)) ? \
     g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Unmap(pMemInfo): \
     MEM_OPS_NULL_FUNC_PTR)

#define Mem_Invoke(Handle, pParam) \
    (((Handle < g_VmmOpsCtx.RegisterNum) && (g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Invoke)) ? \
     g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_Invoke(pParam): \
     MEM_OPS_NULL_FUNC_PTR)

#define Mem_ReadProc(Handle, p) \
    do \
    { \
        if((Handle < g_VmmOpsCtx.RegisterNum) && (g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_ReadProc)) \
        {  \
            g_VmmOpsCtx.pVmmOpsFunc[Handle].pfun_ReadProc(p); \
        }  \
    }while(0)

VMM_PRIVATE UINT32 GetSupportModuleNum(VOID)
{
    UINT32 SupportModuleNum = 0;

#if (defined(OPS_DYNAMIC_SUPPORT) && defined(OPS_PRESERVE_SUPPORT))
    SupportModuleNum = 2;
#elif defined(OPS_PRESERVE_SUPPORT)
    SupportModuleNum = 1;
#elif defined(OPS_DYNAMIC_SUPPORT)
    SupportModuleNum = 1;
#endif

    return SupportModuleNum;
}

VMM_PRIVATE UINT32 GetHandle(VMM_MEM_TYPE_E MemType)
{
    UINT32 Handle = INVALID_HANDLE;

    D_VMM_ASSERT_RET((MemType <= VMM_MEM_TYPE_EXT_RESERVE), INVALID_HANDLE);

    if ((MemType == VMM_MEM_TYPE_SYS_ADAPT) || (MemType == VMM_MEM_TYPE_FORCE_MMZ))
    {
    #ifdef OPS_DYNAMIC_SUPPORT
        Handle = 0;
    #endif
    }
    else if ((MemType == VMM_MEM_TYPE_PRE_ALLOC) || (MemType == VMM_MEM_TYPE_EXT_RESERVE))
    {
    #if (defined(OPS_DYNAMIC_SUPPORT) && defined(OPS_PRESERVE_SUPPORT))
        Handle = 1;
    #elif defined(OPS_PRESERVE_SUPPORT)
        Handle = 0;
    #endif
    }

    return Handle;
}

VMM_PRIVATE VOID DeregisterModules(MEMORY_OPS_CTX_S *pVmmOpsCtx)
{
    SINT32 i;

    D_VMM_ASSERT(pVmmOpsCtx->ModuleNum >= pVmmOpsCtx->RegisterNum);

    for (i = 0; i < pVmmOpsCtx->RegisterNum; i++)
    {
        pVmmOpsCtx->pVmmOpsFunc[i].pfun_Deinit();
    }

    OSAL_FP_memset(&pVmmOpsCtx->pVmmOpsFunc, 0, pVmmOpsCtx->ModuleNum * sizeof(MEMORY_OPS_FUN_PTR_S));

    pVmmOpsCtx->RegisterNum = 0;

    return;
}

VMM_PRIVATE VOID RegisterModules(MEMORY_OPS_CTX_S *pVmmOpsCtx, VMM_CALL_FUN_PTR_S *pCallBack)
{
    UINT32 Index = 0;

#ifdef OPS_DYNAMIC_SUPPORT
    D_VMM_ASSERT(pVmmOpsCtx->ModuleNum > Index);
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Init     = VMM_Dynamic_Init;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Deinit   = VMM_Dynamic_Deinit;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Alloc    = VMM_Dynamic_Alloc;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Release  = VMM_Dynamic_Release;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Map      = VMM_Dynamic_Map;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Unmap    = VMM_Dynamic_Unmap;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Invoke   = VMM_Dynamic_Invoke;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_ReadProc = VMM_Dynamic_ReadProc;

    if (VMM_Dynamic_Init(pCallBack) != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "call VMM_Dynamic_Init failed!\n");
        goto error;
    }

    Index++;
    pVmmOpsCtx->RegisterNum = Index;
#endif

#ifdef OPS_PRESERVE_SUPPORT
    D_VMM_ASSERT(pVmmOpsCtx->ModuleNum > Index);
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Init     = VMM_Preserve_Init;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Deinit   = VMM_Preserve_Deinit;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Alloc    = VMM_Preserve_Alloc;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Release  = VMM_Preserve_Release;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Map      = VMM_Preserve_Map;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Unmap    = VMM_Preserve_Unmap;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_Invoke   = VMM_Preserve_Invoke;
    pVmmOpsCtx->pVmmOpsFunc[Index].pfun_ReadProc = VMM_Preserve_ReadProc;

    if (VMM_Preserve_Init(pCallBack) != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "call VMM_Dynamic_Init failed!\n");
        goto error;
    }

    Index++;
    pVmmOpsCtx->RegisterNum = Index;
#endif

    return;

error:
    DeregisterModules(pVmmOpsCtx);

    return;
}


/***************************  External Interface *********************************/

SINT32 VMM_Ops_Init(VMM_CALL_FUN_PTR_S *pCallBack)
{
    UINT32 FuncPtrSize;
    UINT32 ModuleNum;

    if (g_VmmOpsCtx.ModuleNum == 0)
    {
        ModuleNum   = GetSupportModuleNum();
        FuncPtrSize = ModuleNum * sizeof(MEMORY_OPS_FUN_PTR_S);

        g_VmmOpsCtx.pVmmOpsFunc = (MEMORY_OPS_FUN_PTR_S *)OSAL_FP_alloc_virmem(FuncPtrSize);
        if (!g_VmmOpsCtx.pVmmOpsFunc)
        {
            PRINT(VMM_ERROR,"%s,%d malloc g_pVmmMemoryOps memory size = %dx%d = %d failed!\n",__func__,__LINE__,
                sizeof(MEMORY_OPS_FUN_PTR_S), ModuleNum, FuncPtrSize);

            return MEM_OPS_FAILURE;
        }

        OSAL_FP_memset(g_VmmOpsCtx.pVmmOpsFunc, 0, FuncPtrSize);

        g_VmmOpsCtx.ModuleNum   = ModuleNum;
        g_VmmOpsCtx.RegisterNum = 0;

        RegisterModules(&g_VmmOpsCtx, pCallBack);
    }

    return VMM_SUCCESS;
}

VOID VMM_Ops_Deinit(VOID)
{
    if (g_VmmOpsCtx.ModuleNum)
    {
        if (g_VmmOpsCtx.pVmmOpsFunc)
        {
            DeregisterModules(&g_VmmOpsCtx);

            OSAL_FP_free_virmem(g_VmmOpsCtx.pVmmOpsFunc);

            g_VmmOpsCtx.pVmmOpsFunc = NULL;
        }
        g_VmmOpsCtx.RegisterNum = 0;
        g_VmmOpsCtx.ModuleNum   = 0;
    }

    return ;
}

SINT32 VMM_Ops_Alloc(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = MEM_OPS_SUCCESS;
    SINT32 Handle = INVALID_HANDLE;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_OPS_NULL_PTR);
    D_VMM_ASSERT_RET(g_VmmOpsCtx.RegisterNum != 0, MEM_OPS_NOT_INIT);

    Handle = GetHandle(pMemInfo->MemType);

    D_VMM_ASSERT_RET(Handle < g_VmmOpsCtx.RegisterNum, MEM_OPS_NOT_SUPPORT);

    Ret = Mem_Alloc(Handle, pMemInfo);

    return Ret;
}

SINT32 VMM_Ops_Release(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = MEM_OPS_SUCCESS;
    SINT32 Handle = INVALID_HANDLE;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_OPS_NULL_PTR);
    D_VMM_ASSERT_RET(g_VmmOpsCtx.RegisterNum != 0, MEM_OPS_NOT_INIT);

    Handle = GetHandle(pMemInfo->MemType);

    D_VMM_ASSERT_RET(Handle < g_VmmOpsCtx.RegisterNum, MEM_OPS_NOT_SUPPORT);

    Ret = Mem_Release(Handle, pMemInfo);

    return Ret;

}

SINT32 VMM_Ops_Map(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = MEM_OPS_SUCCESS;
    SINT32 Handle = INVALID_HANDLE;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_OPS_NULL_PTR);
    D_VMM_ASSERT_RET(g_VmmOpsCtx.RegisterNum != 0, MEM_OPS_NOT_INIT);

    Handle = GetHandle(pMemInfo->MemType);

    D_VMM_ASSERT_RET(Handle < g_VmmOpsCtx.RegisterNum, MEM_OPS_NOT_SUPPORT);

    Ret = Mem_Map(Handle, pMemInfo);

    return Ret;
}

SINT32 VMM_Ops_Unmap(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = MEM_OPS_SUCCESS;
    SINT32 Handle = INVALID_HANDLE;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_OPS_NULL_PTR);
    D_VMM_ASSERT_RET(g_VmmOpsCtx.RegisterNum != 0, MEM_OPS_NOT_INIT);

    Handle = GetHandle(pMemInfo->MemType);

    D_VMM_ASSERT_RET(Handle < g_VmmOpsCtx.RegisterNum, MEM_OPS_NOT_SUPPORT);

    Ret = Mem_UnMap(Handle, pMemInfo);

    return Ret;
}

SINT32 VMM_Ops_Invoke(VMM_INVOKE_ATTR_S *pParam)
{
    SINT32 Ret = MEM_OPS_SUCCESS;
    SINT32 Handle = INVALID_HANDLE;

    D_VMM_CHECK_PTR_RET(pParam, MEM_OPS_NULL_PTR);
    D_VMM_ASSERT_RET(g_VmmOpsCtx.RegisterNum != 0, MEM_OPS_NOT_INIT);

    Handle = GetHandle(pParam->MemType);

    D_VMM_ASSERT_RET(Handle < g_VmmOpsCtx.RegisterNum, MEM_OPS_NOT_SUPPORT);

    Ret = Mem_Invoke(Handle, pParam);

    return Ret;
}

#ifdef HI_PROC_SUPPORT
VOID VMM_Ops_ReadProc(VOID *p)
{
    SINT32 i;

    for (i = 0; i < g_VmmOpsCtx.RegisterNum; i++)
    {
        Mem_ReadProc(i, p);
    }

    return;
}
#endif

