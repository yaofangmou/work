#include "hi_type.h"
#include "hi_common.h"
#include "drv_win_alg_ratio.h"
#include "drv_win_common.h"
#include "drv_display.h"
#include "drv_window.h"
#include "drv_win_priv.h"

#include "drv_win_alg_ratio.h"
#include "drv_win_share.h"
#include "drv_disp_osal.h"
#include "drv_win_policy.h"
#include "drv_xdr_adapter.h"
#include "drv_win_alg_osal.h"

extern HI_S32 WinOutRectSizeConversionByType(const HI_DISP_DISPLAY_INFO_S  *pstInfo,
                                                 HI_RECT_S *pstRevisedRect,
                                                 WINDOW_S *pstWin);



HI_VOID Win_ReviseInRect(HI_RECT_S *pstDstRect,HI_RECT_S *pstSrctRect)
{
    if ((0 == pstDstRect->s32Width) || (0 == pstDstRect->s32Height))
    {
        pstDstRect->s32Width = pstSrctRect->s32Width;
        pstDstRect->s32Height = pstSrctRect->s32Height;
    }

    if ( pstDstRect->s32Width > pstSrctRect->s32Width)
    {
        pstDstRect->s32Width =  pstSrctRect->s32Width;
        //WIN_ERROR("inrect s32Width outof srource rect!");
    }

    if ( pstDstRect->s32Height > pstSrctRect->s32Height)
    {
        pstDstRect->s32Height =  pstSrctRect->s32Height;
        //WIN_ERROR("inrect s32Height outof srource rect!");
    }

    if ( pstDstRect->s32Y > pstSrctRect->s32Height -64 )
    {
        pstDstRect->s32Y =    pstSrctRect->s32Height -64;

    }
    if ( pstDstRect->s32X > pstSrctRect->s32Width -64 )
    {
        pstDstRect->s32X =  pstSrctRect->s32Width -64;

    }

    if ( (pstDstRect->s32Y + pstDstRect->s32Height) > pstSrctRect->s32Height )
    {
        pstDstRect->s32Height = pstSrctRect->s32Height - pstDstRect->s32Y;
    }

    if ( (pstDstRect->s32X + pstDstRect->s32Width) > pstSrctRect->s32Width )
    {
        pstDstRect->s32Width = pstSrctRect->s32Width - pstDstRect->s32X;
    }

    if ( pstDstRect->s32Width < 64)
       pstDstRect->s32Width = 64;

     if ( pstDstRect->s32Height < 64)
       pstDstRect->s32Height = 64;
}

HI_S32 DRV_PQ_GetVdpZmeStrategy (HI_PQ_ZME_LAYER_E enLayerId,
                            HI_PQ_ZME_STRATEGY_IN_U *pstZmeIn,
                            HI_PQ_ZME_STRATEGY_OUT_U *pstZmeOut);

HI_VOID Win_AspRatioProcess(VDP_ALG_RATIO_DRV_PARA_S *pstAspDrvPara,VDP_ALG_RATIO_OUT_PARA_S *pstAspCfg)
{
    HI_S32 out_x, out_y;

    out_x = pstAspDrvPara->stOutWnd.s32X;
    out_y = pstAspDrvPara->stOutWnd.s32Y;

    pstAspDrvPara->stOutWnd.s32Y = 0;
    pstAspDrvPara->stOutWnd.s32X = 0;

    if (0 == pstAspDrvPara->stDispRect.stRect.s32Height || 0 == pstAspDrvPara->stDispRect.stRect.s32Width)
    {
        WIN_ERROR("Denominator may be zero !\n");
        return;
    }

    VDP_ALG_RATIO_RatioProcess(pstAspDrvPara, pstAspCfg);

    if (pstAspCfg->bEnCrop)
    {
        /*cal inRect */
        pstAspDrvPara->stInRect.stRect.s32X = (pstAspCfg->stCropWnd.s32X * pstAspDrvPara->stDispRect.stRect.s32Width / pstAspCfg->u32ZmeW);
        pstAspDrvPara->stInRect.stRect.s32Width = (pstAspCfg->stCropWnd.s32Width * pstAspDrvPara->stDispRect.stRect.s32Width / pstAspCfg->u32ZmeW);
        pstAspDrvPara->stInRect.stRect.s32Y = (pstAspCfg->stCropWnd.s32Y * pstAspDrvPara->stDispRect.stRect.s32Height / pstAspCfg->u32ZmeH);
        pstAspDrvPara->stInRect.stRect.s32Height = (pstAspCfg->stCropWnd.s32Height * pstAspDrvPara->stDispRect.stRect.s32Height / pstAspCfg->u32ZmeH);

    }

    pstAspCfg->stVideoWnd.s32X += out_x;
    pstAspCfg->stVideoWnd.s32Y += out_y;

    XDP_ASP_INFO("stVideoWnd(%d %d %d %d) -> (%d %d %d %d)\n",
            out_x, out_y, pstAspDrvPara->stOutWnd.s32Width, pstAspDrvPara->stOutWnd.s32Height,
            pstAspCfg->stVideoWnd.s32X, pstAspCfg->stVideoWnd.s32Y,
            pstAspCfg->stVideoWnd.s32Width, pstAspCfg->stVideoWnd.s32Height);

}



HI_VOID WinCropRect2InRect (HI_DRV_CROP_RECT_S *pstCropRect,HI_RECT_S *pstInRect,HI_U32 u32SrcW ,HI_U32 u32SrcH)
{
    if ((0 == u32SrcW) || (0 == u32SrcH))
        return ;

    if(((pstCropRect->u32LeftOffset + pstCropRect->u32RightOffset) + WIN_FRAME_MIN_WIDTH > u32SrcW)
        ||((pstCropRect->u32TopOffset + pstCropRect->u32BottomOffset)  + WIN_FRAME_MIN_HEIGHT > u32SrcH))
    {
        WIN_ERROR("u32LeftOffset(%d) add u32RightOffset(%d) is too large(%d)\n"
            "Or TopOffset(%d) add u32BottomOffset(%d) is too large(%d)\n",
            pstCropRect->u32LeftOffset, pstCropRect->u32RightOffset, u32SrcW,
            pstCropRect->u32TopOffset, pstCropRect->u32BottomOffset, u32SrcH);
        return;
    }

    pstInRect->s32X = pstCropRect->u32LeftOffset;
    pstInRect->s32Y = pstCropRect->u32TopOffset;
    pstInRect->s32Width  = u32SrcW - (pstCropRect->u32LeftOffset + pstCropRect->u32RightOffset);
    pstInRect->s32Height = u32SrcH - (pstCropRect->u32TopOffset + pstCropRect->u32BottomOffset);

    return;
}

HI_VOID WinConfigInrect(WINDOW_S *pstWin, WIN_INFO_S *pstLayerPara,
                                                            HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = HI_NULL;

    if (HI_NULL == pstWin || HI_NULL == pstLayerPara || HI_NULL == pstFrame)
    {
        return;
    }

    pstPriv = (HI_DRV_VIDEO_PRIVATE_S *)pstFrame->u32Priv;

    if ((pstPriv->stVideoOriginalInfo.u32Width != pstFrame->u32Width )
        || (pstPriv->stVideoOriginalInfo.u32Height != pstFrame->u32Height )
       )
    {
        /*means vpss processed */
        pstLayerPara->stIn = pstFrame->stDispRect;
        XDP_ASP_INFO("use disp rect %d %d %d %d\n",
                pstFrame->stDispRect.s32X,
                pstFrame->stDispRect.s32Y,
                pstFrame->stDispRect.s32Width,
                pstFrame->stDispRect.s32Height);
    }
    else
    {
        if (HI_TRUE == pstWin->stUsingAttr.bUseCropRect)
        {
            XDP_ASP_INFO("use user CropRect LTRB %d %d %d %d\n",
                    pstWin->stUsingAttr.stCropRect.u32LeftOffset,
                    pstWin->stUsingAttr.stCropRect.u32TopOffset,
                    pstWin->stUsingAttr.stCropRect.u32RightOffset,
                    pstWin->stUsingAttr.stCropRect.u32BottomOffset);

            WinCropRect2InRect( &pstWin->stUsingAttr.stCropRect, &pstLayerPara->stIn, pstFrame->u32Width, pstFrame->u32Height);

            XDP_ASP_INFO("Change InRect %d %d %d %d\n",
                    pstLayerPara->stIn.s32X,
                    pstLayerPara->stIn.s32Y,
                    pstLayerPara->stIn.s32Width,
                    pstLayerPara->stIn.s32Height);
        }
        else
        {

            pstLayerPara->stIn = pstWin->stUsingAttr.stInRect;
            Win_ReviseInRect(&pstLayerPara->stIn, &pstFrame->stDispRect);

        XDP_ASP_INFO("use InRect %d %d %d %d\n",
                pstWin->stUsingAttr.stInRect.s32X,
                pstWin->stUsingAttr.stInRect.s32Y,
                pstWin->stUsingAttr.stInRect.s32Width,
                pstWin->stUsingAttr.stInRect.s32Height);


        }
    }
}


HI_S32 WinUpdateWinAttr(WINDOW_S *pstWin,const HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
    HI_RECT_S stOutRectRevised = {0};

    WinCheckNullPointer(pstWin);
    WinCheckNullPointer(pstDispInfo);

    memset((void *)&stOutRectRevised, 0, sizeof(stOutRectRevised));

    /*give a size conversion from:
         * 1) user setting(virtscreen)-----> virtual screen---->actual format;
         * 2) user setting(physical coordinate)--------> actual format
       * in fact, you can choose only one through the flag pstWin->bVirtScreenMode.
         */

    pstWin->stUsingAttr  = pstWin->stCfg.stAttrBuf;

    WinOutRectSizeConversionByType(pstDispInfo, &stOutRectRevised, pstWin);
    pstWin->stUsingAttr.stOutRect = stOutRectRevised;

    WinInRectAlign(&pstWin->stUsingAttr.stInRect, pstWin->u32VideoLayer);

    pstWin->stUsingAttr.stCropRect.u32LeftOffset  = WinParamAlignUp(pstWin->stUsingAttr.stCropRect.u32LeftOffset, HI_WIN_IN_RECT_WIDTH_ALIGN);
    pstWin->stUsingAttr.stCropRect.u32RightOffset = WinParamAlignUp(pstWin->stUsingAttr.stCropRect.u32RightOffset, HI_WIN_IN_RECT_WIDTH_ALIGN);
    pstWin->stUsingAttr.stCropRect.u32TopOffset  =  WinParamAlignUp(pstWin->stUsingAttr.stCropRect.u32TopOffset, HI_WIN_IN_RECT_HEIGHT_ALIGN);
    pstWin->stUsingAttr.stCropRect.u32BottomOffset = WinParamAlignUp(pstWin->stUsingAttr.stCropRect.u32BottomOffset, HI_WIN_IN_RECT_HEIGHT_ALIGN);

    /*when not virtual screen mode, the cfg's attr must be the actual physical fmt.*/
    pstWin->stCfg.stAttr = pstWin->stCfg.stAttrBuf;
    if (!pstWin->bVirtScreenMode)
    {
        pstWin->stCfg.stAttr.stOutRect =  pstWin->stUsingAttr.stOutRect;
    }

    return HI_SUCCESS;
}


