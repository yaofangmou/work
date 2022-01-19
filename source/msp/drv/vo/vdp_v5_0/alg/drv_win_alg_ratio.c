

#include "drv_win_alg_ratio.h"
#include "drv_disp_osal.h"
#include "drv_win_alg_osal.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif


#define CHECK_NULL_POINTER(ptr) \
    {                                \
        if (HI_NULL == (ptr))                    \
        {                            \
            WIN_ERROR("null pointer\n"); \
            return HI_ERR_VO_NULL_PTR;  \
        }                             \
    }


#define VDP_PIXEL_ALGIN_CROP_OUTW(pix) ((pix) & 0xFFFFFFFE)
#define VDP_PIXEL_ALGIN_CROP_OUTH(pix) ((pix) & 0xFFFFFFFE)

#define VDP_PIXEL_ALGIN_ZME_OUTW(pix)   ((pix) & 0xFFFFFFFE)
#define VDP_PIXEL_ALGIN_ZME_OUTH(pix)   ((pix) & 0xFFFFFFFE)

#define VDP_PIXEL_ALGIN_LBOX(pix)   ((pix) & 0xFFFFFFFE)



HI_VOID VDP_ALG_RATIO_CorrectAspectRatioW_H(HI_U32 *pw, HI_U32 *ph)
{
    HI_U32 w, h;
    HI_U32 ratioRange = 1;

    w = *pw;
    h = *ph;

    //we only support to 256:1 or 1:256
    if (w != 0 && h != 0)
    {
        ratioRange = ((w * ALG_RATIO_PIX_RATIO1) / h);
        if (ratioRange > 256 * ALG_RATIO_PIX_RATIO1)
        {
            w = 256;
            h = 1;
        }

        if (ratioRange < ALG_RATIO_PIX_RATIO1 / 256)
        {
            w = 1;
            h = 256;
        }
    }

    while ((w > 256) || (h > 256))
    {
        w >>= 1;
        h >>= 1;
    }

    if (!w)
    {
        w = 1;
    }
    if (!h)
    {
        h = 1;
    }

    *pw = w;
    *ph  = h;
}

HI_VOID VDP_ALG_RATIO_LetterBox(HI_U32 AspectRatioW, HI_U32 AspectRatioH, HI_RECT_S *pOutWnd, HI_S32 pixr1_out)
{
    HI_U32 v_w, v_h;
    HI_U32 ar_w = AspectRatioW, ar_h = AspectRatioH;
    HI_U32 u32Temp;

    if (0 == ar_h || 0 == pixr1_out)
    {
        WIN_ERROR("Denominator may be zero !\n");
        return;
    }
    // (v_w / v_h) * u32pixr1_out = ar_w / ar_h
    v_w = (ar_w * pOutWnd->s32Height * ALG_RATIO_PIX_RATIO1) / (ar_h * pixr1_out);

    if (v_w <= pOutWnd->s32Width)
    {
        v_w = VDP_PIXEL_ALGIN_ZME_OUTW(v_w);
        u32Temp = pOutWnd->s32X + (pOutWnd->s32Width - v_w) / 2;
        pOutWnd->s32X = VDP_PIXEL_ALGIN_ZME_OUTW(u32Temp);
        pOutWnd->s32Width = v_w;
    }
    else
    {
        if (0 == v_w)
        {
            WIN_ERROR("Denominator may be zero !\n");
            return;
        }
        v_h = pOutWnd->s32Height * pOutWnd->s32Width / v_w;
        v_h = VDP_PIXEL_ALGIN_ZME_OUTH(v_h);
        u32Temp = (pOutWnd->s32Y + (pOutWnd->s32Height - v_h) / 2);
        pOutWnd->s32Y =  VDP_PIXEL_ALGIN_ZME_OUTH(u32Temp);
        pOutWnd->s32Height = v_h;
    }
}

HI_S32 VDP_ALG_RATIO_RatioProcess(VDP_ALG_RATIO_DRV_PARA_S *pstDrvPara, VDP_ALG_RATIO_OUT_PARA_S *pstOutPara)
{
    // screen ratio w h, aspect ratio w h, output format w h
    HI_S32 s32ScreenAspW, s32ScreenAspH, s32SrcAspW = 0, s32SrcAspH = 0, s32ScreenRectW, s32ScreenRectH;
    // output video w h
    //u32pixr1_out:tv pixel aspect ratio concluded from  tv resolution and  output aspect ratio.   pixel width / pixel height
    HI_S32 s32ScreenSkew;

    XDP_ASP_INFO("ASP InRect %d %d %d %d aspw h %d %d \n",
                 pstDrvPara->stInRect.stRect.s32X,
                 pstDrvPara->stInRect.stRect.s32Y,
                 pstDrvPara->stInRect.stRect.s32Width,
                 pstDrvPara->stInRect.stRect.s32Height,
                 pstDrvPara->stInRect.u32AspectWidth,
                 pstDrvPara->stInRect.u32AspectHeight);

    /*In Customer mode cvrs==Ignore will not full the window */
    if ((HI_DRV_ASP_RAT_MODE_BUTT == pstDrvPara->eAspMode)
        || (HI_DRV_ASP_RAT_MODE_FULL == pstDrvPara->eAspMode))
    {
        pstOutPara->u32ZmeW = pstDrvPara->stOutWnd.s32Width;
        pstOutPara->u32ZmeH = pstDrvPara->stOutWnd.s32Height;

        pstOutPara->stVideoWnd.s32Height = pstDrvPara->stOutWnd.s32Height;
        pstOutPara->stVideoWnd.s32Width = pstDrvPara->stOutWnd.s32Width;
        pstOutPara->stVideoWnd.s32X = pstDrvPara->stOutWnd.s32X;
        pstOutPara->stVideoWnd.s32Y = pstDrvPara->stOutWnd.s32Y;

        pstOutPara->stOutWnd.s32X = 0;
        pstOutPara->stOutWnd.s32Y = 0;
        pstOutPara->stOutWnd.s32Height = pstDrvPara->stScreen.stRect.s32Height;
        pstOutPara->stOutWnd.s32Width = pstDrvPara->stScreen.stRect.s32Width;

        return HI_SUCCESS;
    }

    //In customer mode ,process pOutInfo first
    if (HI_TRUE == pstDrvPara->stUsrAsp.bUserDefAspectRatio)
    {
        s32SrcAspW = pstDrvPara->stUsrAsp.u32UserAspectWidth;
        s32SrcAspH = pstDrvPara->stUsrAsp.u32UserAspectHeight;

        XDP_ASP_INFO("Use user SrcASP %d %d \n",
                     s32SrcAspW,
                     s32SrcAspH);
    }

    if ((0 == s32SrcAspW) || (0 == s32SrcAspH))
    {
        // using s32SrcAspW and s32SrcAspH replace video output window ratio
        s32SrcAspW = pstDrvPara->stInRect.u32AspectWidth;
        s32SrcAspH = pstDrvPara->stInRect.u32AspectHeight;
        //HI_UNF_DISP_ASPECT_RATIO_AUTO&Square 0/0
        if ((0 == s32SrcAspW) || (0 == s32SrcAspH))
        {
            s32SrcAspW = pstDrvPara->stInRect.stRect.s32Width;
            s32SrcAspH = pstDrvPara->stInRect.stRect.s32Height;


            XDP_ASP_INFO("Use img w h as SrcASP %d %d \n",
                         s32SrcAspW,
                         s32SrcAspH);
        }
        XDP_ASP_INFO("Src ASP is %d %d \n",
                     s32SrcAspW,
                     s32SrcAspH);
    }
    VDP_ALG_RATIO_CorrectAspectRatioW_H(&s32SrcAspW, &s32SrcAspH);

    // using s32ScreenAspW and s32ScreenAspH replace screen ratio
    s32ScreenAspW = pstDrvPara->stScreen.u32AspectWidth;
    s32ScreenAspH = pstDrvPara->stScreen.u32AspectHeight;
    if ((0 == s32ScreenAspW) || (0 == s32ScreenAspH))
    {
        s32ScreenAspW = pstDrvPara->stScreen.stRect.s32Width;
        s32ScreenAspH = pstDrvPara->stScreen.stRect.s32Height;
    }
    VDP_ALG_RATIO_CorrectAspectRatioW_H(&s32ScreenAspW, &s32ScreenAspH);

    // get output format w h
    s32ScreenRectW = pstDrvPara->stScreen.stRect.s32Width;
    s32ScreenRectH = pstDrvPara->stScreen.stRect.s32Height;

    if (0 == s32ScreenAspH || 0 == s32ScreenRectW)
    {
        WIN_ERROR("Denominator may be zero !\n");
        return HI_FAILURE;
    }

    //In customer mode use logic pixel,too
    s32ScreenSkew = (s32ScreenAspW * s32ScreenRectH * ALG_RATIO_PIX_RATIO1) / (s32ScreenAspH * s32ScreenRectW);

    XDP_ASP_INFO("Screen ASP is %d %d w h %d %d skew %d aspmode %d\n",
                 s32ScreenAspW,
                 s32ScreenAspH,
                 s32ScreenRectW,
                 s32ScreenRectH,
                 s32ScreenSkew,
                 pstDrvPara->eAspMode);

    if (HI_DRV_ASP_RAT_MODE_LETTERBOX == pstDrvPara->eAspMode)
    {
        VDP_ALG_RATIO_LetterBox(s32SrcAspW, s32SrcAspH, &(pstDrvPara->stOutWnd), s32ScreenSkew);
        pstOutPara->u32ZmeW = pstDrvPara->stOutWnd.s32Width;
        pstOutPara->u32ZmeH = pstDrvPara->stOutWnd.s32Height;

        pstOutPara->stVideoWnd.s32Height = pstDrvPara->stOutWnd.s32Height;
        pstOutPara->stVideoWnd.s32Width = pstDrvPara->stOutWnd.s32Width;
        pstOutPara->stVideoWnd.s32X = pstDrvPara->stOutWnd.s32X;
        pstOutPara->stVideoWnd.s32Y = pstDrvPara->stOutWnd.s32Y;
        pstOutPara->stVideoWnd.s32X = pstOutPara->stVideoWnd.s32X & VDP_WIDTH_ALIGN;
        pstOutPara->stVideoWnd.s32Y = pstOutPara->stVideoWnd.s32Y & VDP_HEIGHT_ALIGN;

        pstOutPara->stOutWnd.s32X = 0;
        pstOutPara->stOutWnd.s32Y = 0;
        pstOutPara->stOutWnd.s32Height = pstDrvPara->stScreen.stRect.s32Height;
        pstOutPara->stOutWnd.s32Width = pstDrvPara->stScreen.stRect.s32Width;
    }
    else //  HI_UNF_VO_ASPECT_CVRS_PAN_SCAN == enCvrsMode  ||  HI_UNF_VO_ASPECT_CVRS_COMBINED == enCvrsMode
    {
        HI_U32 u32ZmeH;
        HI_U32 u32ZmeW;
        HI_U32 u32ExpH;
        HI_U32 u32ExpW;

        if (0 == s32SrcAspW || 0 == s32ScreenSkew || 0 == s32SrcAspH)
        {
            WIN_ERROR("Denominator may be zero !\n");
            return HI_FAILURE;
        }
        u32ExpH = pstDrvPara->stOutWnd.s32Width * (s32ScreenSkew) * s32SrcAspH / s32SrcAspW;
        u32ExpW = s32SrcAspW * pstDrvPara->stOutWnd.s32Height * ALG_RATIO_PIX_RATIO1 / s32ScreenSkew / s32SrcAspH;
        if (u32ExpH > pstDrvPara->stOutWnd.s32Height * ALG_RATIO_PIX_RATIO1 )
        {
            u32ZmeW = pstDrvPara->stOutWnd.s32Width;
            u32ZmeH = u32ExpH / ALG_RATIO_PIX_RATIO1;
            if (HI_DRV_ASP_RAT_MODE_COMBINED == pstDrvPara->eAspMode)
            {
                u32ZmeH = pstDrvPara->stOutWnd.s32Height
                          + (u32ZmeH - pstDrvPara->stOutWnd.s32Height) / 2;
                u32ZmeW = s32SrcAspW * u32ZmeH * ALG_RATIO_PIX_RATIO1 / s32ScreenSkew / s32SrcAspH;
            }
        }
        else
        {
            u32ZmeW = u32ExpW ;
            u32ZmeH = pstDrvPara->stOutWnd.s32Height;
            if (HI_DRV_ASP_RAT_MODE_COMBINED == pstDrvPara->eAspMode)
            {
                u32ZmeW = pstDrvPara->stOutWnd.s32Width
                          + (u32ZmeW - pstDrvPara->stOutWnd.s32Width) / 2;
                u32ZmeH = u32ZmeW * (s32ScreenSkew) * s32SrcAspH / s32SrcAspW / ALG_RATIO_PIX_RATIO1;
            }
        }
        u32ZmeW = (u32ZmeW & VDP_WIDTH_ALIGN) < 4092 ? (u32ZmeW & VDP_WIDTH_ALIGN) : 4092;
        u32ZmeH = (u32ZmeH & VDP_HEIGHT_ALIGN) < 4092 ? (u32ZmeH & VDP_HEIGHT_ALIGN) : 4092;

        pstOutPara->u32ZmeH = u32ZmeH;
        pstOutPara->u32ZmeW = u32ZmeW;

        if (pstOutPara->u32ZmeH > pstDrvPara->stOutWnd.s32Height)
        {
            pstOutPara->stCropWnd.s32X = 0;
            pstOutPara->stCropWnd.s32Y = ((u32ZmeH - pstDrvPara->stOutWnd.s32Height) / 2) & VDP_HEIGHT_ALIGN;
            pstOutPara->stCropWnd.s32Height = pstDrvPara->stOutWnd.s32Height;
            pstOutPara->stCropWnd.s32Width = u32ZmeW;
        }
        else
        {
            pstOutPara->stCropWnd.s32X = ((u32ZmeW - pstDrvPara->stOutWnd.s32Width) / 2) & VDP_WIDTH_ALIGN;
            pstOutPara->stCropWnd.s32Y = 0;
            pstOutPara->stCropWnd.s32Height = u32ZmeH;
            pstOutPara->stCropWnd.s32Width = pstDrvPara->stOutWnd.s32Width;
        }

        pstOutPara->bEnCrop = HI_TRUE;

        XDP_ASP_INFO("OutWnd w h %d %d\n", pstDrvPara->stOutWnd.s32Width, pstDrvPara->stOutWnd.s32Height);

        pstOutPara->stVideoWnd.s32Height = pstOutPara->stCropWnd.s32Height;
        pstOutPara->stVideoWnd.s32Width = pstOutPara->stCropWnd.s32Width;
        pstOutPara->stVideoWnd.s32X = (pstDrvPara->stOutWnd.s32Width - pstOutPara->stCropWnd.s32Width) / 2;
        pstOutPara->stVideoWnd.s32Y = (pstDrvPara->stOutWnd.s32Height - pstOutPara->stCropWnd.s32Height) / 2;
        pstOutPara->stVideoWnd.s32X = pstOutPara->stVideoWnd.s32X & VDP_WIDTH_ALIGN;
        pstOutPara->stVideoWnd.s32Y = pstOutPara->stVideoWnd.s32Y & VDP_HEIGHT_ALIGN;

        pstOutPara->stOutWnd.s32X = 0;
        pstOutPara->stOutWnd.s32Y = 0;
        pstOutPara->stOutWnd.s32Height = pstDrvPara->stScreen.stRect.s32Height;
        pstOutPara->stOutWnd.s32Width = pstDrvPara->stScreen.stRect.s32Width;

    }

    XDP_ASP_INFO("Crop xywh %d %d %d %d\nVideo xywh %d %d %d %d\nOut xywh %d %d %d %d\n",
                 pstOutPara->stCropWnd.s32X,
                 pstOutPara->stCropWnd.s32Y,
                 pstOutPara->stCropWnd.s32Width,
                 pstOutPara->stCropWnd.s32Height,

                 pstOutPara->stVideoWnd.s32X,
                 pstOutPara->stVideoWnd.s32Y,
                 pstOutPara->stVideoWnd.s32Width,
                 pstOutPara->stVideoWnd.s32Height,

                 pstOutPara->stOutWnd.s32X,
                 pstOutPara->stOutWnd.s32Y,
                 pstOutPara->stOutWnd.s32Width,
                 pstOutPara->stOutWnd.s32Height);

    return HI_SUCCESS;
}
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
