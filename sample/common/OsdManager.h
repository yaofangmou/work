/******************************************************************************

  Copyright (C), 2014-2024, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : OsdManager.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2014/02/18
  Description   :
  History       :
  1.Date        : 2014/02/18
  Author        :
  Modification  : Created file

******************************************************************************/

#ifndef __OSDMANAGER_H__
#define __OSDMANAGER_H__

#include <stdint.h>
#include <sys/types.h>

//UI
#include <ui/PixelFormat.h>
#include <ui/DisplayInfo.h>
#include <gui/ISurfaceComposer.h>
#include <gui/Surface.h>
#include <gui/SurfaceComposerClient.h>


#include "hi_type.h"
#include "hi_common.h"
#include "hi_unf_video.h"

typedef struct tagSURFACE_ATTR_S
{
    HI_U32   u32Width;
    HI_U32   u32Height;
    HI_U32   u32Stride;
    HI_S32   s32PixelFormat;
}SURFACE_ATTR_S;

typedef struct tagCCTEXT_ATTR_S
{
    HI_U32  u32BufLen;

    HI_U32  u32bgColor;
    HI_U32  u32fgColor;
    HI_U32  u32edgeColor;

    HI_U8   u8justify;
    HI_U32  u8WordWrap;

    HI_U32  u8fontstyle;
    HI_U32  u8fontSize;
    HI_U32  u8edgeType;

    HI_BOOL bUnderline;
    HI_BOOL bItalic;

}CCTEXT_ATTR_S;
namespace android {

class Surface;
class SurfaceComposerClient;
class SurfaceControl;

// ---------------------------------------------------------------------------

class OsdManager : public RefBase
{
public:
                OsdManager();
    virtual     ~OsdManager();
    sp<SurfaceComposerClient>       mSession;

private:
    int         mWidth;
    int         mHeight;
    EGLDisplay  mDisplay;
    EGLDisplay  mContext;
    EGLDisplay  mSidebandSurface;
    EGLDisplay  mOSDSurface;
    sp<SurfaceControl> mFlingerSurfaceControl;
    sp<Surface> mFlingerSurface;
    sp<SurfaceControl> mFlingerSurfaceControl2;
    sp<Surface> mFlingerSurface2;


public:

    HI_S32 lock(HI_HANDLE hSurface){return 0;};
    HI_S32 unLock(HI_HANDLE hSurface){return 0;};

    HI_S32 CreateSurface(SURFACE_ATTR_S *pstAttr, HI_HANDLE *phSurface);
    HI_S32 DestroySurface(HI_HANDLE hSurface);

    HI_S32 FillRect(HI_HANDLE hSurface, HI_RECT_S *pstRect, HI_U32 u32Color);
    HI_S32 Refresh(HI_HANDLE hSurface){return 0;};

    HI_S32 Blit(HI_HANDLE hSrcSurface, HI_RECT_S *pstSrcRect, HI_HANDLE hDstSurface, HI_RECT_S *pstDstRect){return 0;};

    HI_S32 BlitFrameToSurface(HI_UNF_VIDEO_FRAME_INFO_S *pstFrame,HI_HANDLE hDstSurface, HI_RECT_S *pstDstRect);

    HI_S32 ClearSurface(HI_HANDLE hSurface);


    HI_S32 Videoframe2jpg(HI_UNF_VIDEO_FRAME_INFO_S *pstFrame, HI_CHAR *DstFile){return 0;};

    HI_S32 GetCCTextSize(HI_CHAR* pTest,HI_S32 *pWidth, HI_S32 *pHeigh );
    HI_S32 FillCCRect(HI_HANDLE hSurface,SURFACE_ATTR_S * pstSurfaceAttr , HI_RECT_S *pstRect, HI_U32 u32Color);
    HI_S32 DrawCCText(HI_HANDLE hSurface, SURFACE_ATTR_S * pstSurfaceAttr ,HI_RECT_S *pstRect, HI_CHAR *pText,CCTEXT_ATTR_S * pstAttr);
    HI_S32 CCBlit(HI_HANDLE hSrcSurface,SURFACE_ATTR_S * pstSurfaceAttr , HI_RECT_S *pstSrcRect, HI_RECT_S *pstDstRect){return 0;};

    HI_S32 TeletextDrawBitmap(HI_HANDLE hSurface, HI_U8 *bitmapBuffer,HI_RECT_S *pstSrcRect,HI_RECT_S *pstDstRect);
    HI_S32 SubDrawBitmap(HI_HANDLE hSurface, HI_U8 *pu8BitmapBuffer,SURFACE_ATTR_S * pstSurfaceAttr ,HI_RECT_S *pstSrcRect);

private:
    HI_S32 DrawBMP(HI_HANDLE hSurface, HI_U8 *bitmapBuffer,HI_RECT_S *pstSrcRect,HI_RECT_S *pstDstRect, int colortype);
    HI_S32 DrawText(HI_HANDLE hSurface, HI_RECT_S *pstRect, HI_U32 u32Color, HI_CHAR *pText);
    void   show();
};

// ---------------------------------------------------------------------------

}; // namespace android

#endif // __OSDMANAGER_H__
