#ifndef __VFMW_EXT_H__
#define __VFMW_EXT_H__

typedef HI_S32 (*FN_VFMW_Init)(HI_VOID *);
typedef HI_S32 (*FN_VFMW_Control)(HI_S32, HI_U32, HI_VOID *, HI_U32);
typedef HI_S32 (*FN_VFMW_Exit)(HI_U8);
typedef HI_S32 (*FN_VFMW_Suspend)(HI_VOID);
typedef HI_S32 (*FN_VFMW_Resume)(HI_VOID);
typedef HI_S32 (*FN_VFMW_GetImage)(HI_S32 InstID, HI_VOID *pImage);
typedef HI_S32 (*FN_VFMW_ReleaseImage)(HI_S32 InstID, HI_VOID *pImage);

typedef struct
{
    FN_VFMW_Init         pfnVfmwInit;
    FN_VFMW_Control      pfnVfmwControl;
    FN_VFMW_Exit         pfnVfmwExit;
    FN_VFMW_Suspend      pfnVfmwSuspend;
    FN_VFMW_Resume       pfnVfmwResume;
    FN_VFMW_GetImage     pfnVfmwGetImage;
    FN_VFMW_ReleaseImage pfnVfmwReleaseImage;
} VFMW_EXPORT_FUNC_S;

#endif
