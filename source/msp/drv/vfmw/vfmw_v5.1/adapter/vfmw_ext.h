#ifndef __VFMW_EXT_H__
#define __VFMW_EXT_H__

typedef HI_S32 (*FN_VFMW_Init)(HI_VOID *);
typedef HI_S32 (*FN_VFMW_Control)(HI_S32, HI_U32, HI_VOID *, HI_U32);
typedef HI_S32 (*FN_VFMW_Exit)(HI_U8);
typedef HI_S32 (*FN_VFMW_Suspend)(HI_VOID);
typedef HI_S32 (*FN_VFMW_Resume)(HI_VOID);
typedef HI_S32 (*FN_VFMW_GetImage)(HI_S32 InstID, HI_VOID *pImage);
typedef HI_S32 (*FN_VFMW_ReleaseImage)(HI_S32 InstID, HI_VOID *pImage);
typedef HI_S32 (*FN_VFMW_ReceiveFrame)(HI_S32 InstID, HI_VOID *pFrame);
typedef HI_S32 (*FN_VFMW_ReleaseFrame)(HI_S32 InstID, HI_VOID *pFrame);
typedef HI_S32 (*FN_VFMW_GLOBAL_ReleaseImage)(HI_VOID *pImage);
typedef HI_S32 (*FN_VFMW_Alloc_DeiMem)(HI_S32 InstID, HI_VOID *pMem);
typedef HI_S32 (*FN_VFMW_Release_DeiMem)(HI_S32 InstID, HI_VOID *pMem);

typedef struct
{
    FN_VFMW_Init         pfnVfmwInit;
    FN_VFMW_Control      pfnVfmwControl;
    FN_VFMW_Exit         pfnVfmwExit;
    FN_VFMW_Suspend      pfnVfmwSuspend;
    FN_VFMW_Resume       pfnVfmwResume;
    FN_VFMW_GetImage     pfnVfmwGetImage;
    FN_VFMW_ReleaseImage pfnVfmwReleaseImage;
    FN_VFMW_ReceiveFrame pfnVfmwReceiveFrame;
    FN_VFMW_ReleaseFrame pfnVfmwReleaseFrame;
    FN_VFMW_GLOBAL_ReleaseImage pfnVfmwGlobalReleaseImage;
    FN_VFMW_Alloc_DeiMem pfnVfmwAllocDeiMem;
    FN_VFMW_Release_DeiMem pfnVfmwReleaseDeiMem;
} VFMW_EXPORT_FUNC_S;

#endif
