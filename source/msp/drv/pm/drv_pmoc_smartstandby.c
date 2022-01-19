#include "hi_drv_dev.h"
#include "drv_pmoc_priv.h"
#include "hi_drv_pmoc.h"

#include "hi_drv_module.h"
#include "drv_ao_ext.h"
#ifdef HI_AUDIO_AI_SUPPORT
#include "drv_ai_ext.h"
#endif

#include "drv_hdmi_ext.h"
#include "drv_disp_ext.h"
#include "drv_win_ext.h"
#include "drv_sci_ext.h"
#include "drv_venc_ext.h"
#include "drv_png_ext.h"
#include "drv_jpge_ext.h"
#include "drv_jpeg_ext.h"
#include "drv_tuner_ext.h"
#include "drv_adsp_ext.h"
#include "drv_cipher_ext.h"
#include "drv_vdec_ext.h"
#include "drv_otp_ext.h"
#include "drv_tde_ext.h"
#include "drv_i2c_ext.h"
#include "drv_gpio_ext.h"
#include "drv_vpss_ext.h"
#include "drv_pq_ext.h"
#include "drv_pmoc_debug.h"

#ifdef HI_DEMUX_SUPPORT
#include "drv_demux_ext.h"
#endif

#include "clock.h"
#include <linux/cpu.h>
#include <asm/io.h>
#include <linux/platform_device.h>

typedef enum
{
    PMOC_HOLD_ETH = 0x0001,   /**<Keep eth working */    /**<CNcomment:网口不下电 */
    PMOC_HOLD_WIFI = 0x0002,  /**<Keep WIFI working */   /**<CNcomment:WIFI不下电 */
    PMOC_HOLD_USB = 0x0004,   /**<Keep USB working */    /**<CNcomment:USB不下电 */
    PMOC_HOLD_TUNER = 0x0008, /**<Keep tuner working */  /**<CNcomment:Tuner不下电 */
    PMOC_HOLD_DEMUX = 0x0010, /**<Keep demux working */  /**<CNcomment:Demux不下电 */
    PMOC_HOLD_SDIO = 0x0020,  /**<Keep SDIO working */   /**<CNcomment:SD卡不下电 */
    PMOC_HOLD_SCI = 0x0040,   /**<Keep SCI working */    /**<CNcomment:SCI不下电 */
    PMOC_HOLD_VENC = 0x0080,  /**<Keep VENC working */   /**<CNcomment:VENC不下电 */
    PMOC_HOLD_PNG = 0x0100,   /**<Keep PNG working */    /**<CNcomment:PNG不下电 */
    PMOC_HOLD_JPGE = 0x0200,  /**<Keep JPGE working */   /**<CNcomment:JPGE不下电 */
    PMOC_HOLD_JPEG = 0x0400,  /**<Keep JPEG working */   /**<CNcomment:JPEG不下电 */
    PMOC_HOLD_WDG = 0x0800,   /**<Keep WDG working */    /**<CNcomment:WDG不下电 */
    PMOC_HOLD_HDMI = 0x1000,  /**<Keep HDMI working */   /**<CNcomment:HDMI不下电 */
    PMOC_HOLD_VO = 0x2000,    /**<Keep VO working */     /**<CNcomment:VO不下电 */
    PMOC_HOLD_DISP = 0x4000,  /**<Keep DISP working */   /**<CNcomment:DISP不下电 */
    PMOC_HOLD_AO = 0x8000,    /**<Keep AO working */     /**<CNcomment:AO不下电 */
    PMOC_HOLD_AI = 0x10000,   /**<Keep AI working */     /**<CNcomment:AI不下电 */
    PMOC_HOLD_ADSP = 0x20000, /**<Keep ADSP working */   /**<CNcomment:ADSP不下电 */
    PMOC_HOLD_CIPHER = 0x40000, /**<Keep CIPHER working */   /**<CNcomment:CIPHER不下电 */
    PMOC_HOLD_VDEC = 0x80000, /**<Keep VDEC working */   /**<CNcomment:VDEC不下电 */
    PMOC_HOLD_VPSS = 0x100000, /**<Keep VPSS working */  /**<CNcomment:VPSS不下电 */
    PMOC_HOLD_OTP = 0x200000, /**<Keep OTP working */    /**<CNcomment:OTP不下电 */
    PMOC_HOLD_TDE = 0x400000, /**<Keep TDE working */    /**<CNcomment:TDE不下电 */
    PMOC_HOLD_I2C = 0x800000, /**<Keep I2C working */    /**<CNcomment:I2C不下电 */
    PMOC_HOLD_GPIO = 0x1000000,/**<Keep GPIO working */  /**<CNcomment:GPIO不下电 */
    PMOC_HOLD_PQ   = 0x2000000,/**<Keep PQ working */  /**<CNcomment:PQ不下电 */
    PMOC_HOLD_BUTT = 0x80000000,
}PMOC_HOLD_MOD_E;

static HI_U32 g_u32HoldModules = 0x0;
static HI_U32 g_bEnterSmartStandby = 0;

#ifdef HI_DVFS_CPU_SUPPORT
extern unsigned int cpu_dvfs_enable;
#endif

HI_VOID SciStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    SCI_EXT_FUNC_S *pstSciFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_SCI, (HI_VOID**)&pstSciFunc);
    if ((HI_SUCCESS != s32Ret) || !pstSciFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstSciFunc->pfnSciSuspend)
        {
            if (HI_SUCCESS != pstSciFunc->pfnSciSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("SCI suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstSciFunc->pfnSciResume)
        {
            if (HI_SUCCESS != pstSciFunc->pfnSciResume(HI_NULL))
            {
                PM_ERR_PrintInfo("SCI resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

#ifdef HI_VENC_SUPPORT
HI_VOID VencStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;

    VENC_EXPORT_FUNC_S *pstVencFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VENC, (HI_VOID**)&pstVencFunc);
    if ((HI_SUCCESS != s32Ret) || !pstVencFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstVencFunc->pfnVencSuspend)
        {
            if (HI_SUCCESS != pstVencFunc->pfnVencSuspend())
            {
                PM_ERR_PrintInfo("VENC suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstVencFunc->pfnVencResume)
        {
            if (HI_SUCCESS != pstVencFunc->pfnVencResume())
            {
                PM_ERR_PrintInfo("VENC resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}
#endif

HI_VOID PngStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    PNG_EXPORT_FUNC_S *pstPngFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_PNG, (HI_VOID**)&pstPngFunc);
    if ((HI_SUCCESS != s32Ret) || !pstPngFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstPngFunc->pfnPngSuspend)
        {
            if (HI_SUCCESS != pstPngFunc->pfnPngSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("PNG suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstPngFunc->pfnPngResume)
        {
            if (HI_SUCCESS != pstPngFunc->pfnPngResume(HI_NULL))
            {
                PM_ERR_PrintInfo("PNG resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

#ifdef HI_JPGE_SUPPORT
HI_VOID JpgeStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    JPGE_EXPORT_FUNC_S *pstJpgeFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_JPGENC, (HI_VOID**)&pstJpgeFunc);
    if ((HI_SUCCESS != s32Ret) || !pstJpgeFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstJpgeFunc->pfnJpgeSuspend)
        {
            if (HI_SUCCESS != pstJpgeFunc->pfnJpgeSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("JPGE suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstJpgeFunc->pfnJpgeResume)
        {
            if (HI_SUCCESS != pstJpgeFunc->pfnJpgeResume(HI_NULL))
            {
                PM_ERR_PrintInfo("JPGE resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}
#endif

HI_VOID JpegStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    JPEG_EXPORT_FUNC_S *pstJpegFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_JPGDEC, (HI_VOID**)&pstJpegFunc);
    if ((HI_SUCCESS != s32Ret) || !pstJpegFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstJpegFunc->pfnJpegSuspend)
        {
            if (HI_SUCCESS != pstJpegFunc->pfnJpegSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("JPEG suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstJpegFunc->pfnJpegResume)
        {
            if (HI_SUCCESS != pstJpegFunc->pfnJpegResume(HI_NULL))
            {
                PM_ERR_PrintInfo("JPEG resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID TunerStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    TUNER_EXPORT_FUNC_S *pstTunerFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_TUNER, (HI_VOID**)&pstTunerFunc);
    if ((HI_SUCCESS != s32Ret) || !pstTunerFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstTunerFunc->pfnTunerSuspend)
        {
            if (HI_SUCCESS != pstTunerFunc->pfnTunerSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("TUNER suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstTunerFunc->pfnTunerResume)
        {
            if (HI_SUCCESS != pstTunerFunc->pfnTunerResume(HI_NULL))
            {
                PM_ERR_PrintInfo("TUNER resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID HdmiStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    HDMI_EXPORT_FUNC_S *pstHdmiFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_HDMI, (HI_VOID**)&pstHdmiFunc);
    if ((HI_SUCCESS != s32Ret) || !pstHdmiFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstHdmiFunc->pfnHdmiSuspend)
        {
            if (HI_SUCCESS != pstHdmiFunc->pfnHdmiSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("HDMI suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstHdmiFunc->pfnHdmiResume)
        {
            if (HI_SUCCESS != pstHdmiFunc->pfnHdmiResume(HI_NULL))
            {
                PM_ERR_PrintInfo("HDMI resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID VoStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    WIN_EXPORT_FUNC_S *pstWinFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VO, (HI_VOID**)&pstWinFunc);
    if ((HI_SUCCESS != s32Ret) || !pstWinFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstWinFunc->pfnWinSuspend)
        {
            if (HI_SUCCESS != pstWinFunc->pfnWinSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("WINDOW suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstWinFunc->pfnWinResume)
        {
            if (HI_SUCCESS != pstWinFunc->pfnWinResume(HI_NULL))
            {
                PM_ERR_PrintInfo("WINDOW resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID DispStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    DISP_EXPORT_FUNC_S *pstDispFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_DISP, (HI_VOID**)&pstDispFunc);
    if ((HI_SUCCESS != s32Ret) || !pstDispFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstDispFunc->pfnDispSuspend)
        {
            if (HI_SUCCESS != pstDispFunc->pfnDispSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("DISP suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstDispFunc->pfnDispResume)
        {
            if (HI_SUCCESS != pstDispFunc->pfnDispResume(HI_NULL))
            {
                PM_ERR_PrintInfo("DISP resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID AoStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    AIAO_EXPORT_FUNC_S *pstAoFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_AO, (HI_VOID**)&pstAoFunc);
    if ((HI_SUCCESS != s32Ret) || !pstAoFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstAoFunc->pfnAO_DrvSuspend)
        {
            if (HI_SUCCESS != pstAoFunc->pfnAO_DrvSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("AO suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstAoFunc->pfnAO_DrvResume)
        {
            if (HI_SUCCESS != pstAoFunc->pfnAO_DrvResume(HI_NULL))
            {
                PM_ERR_PrintInfo("AO resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

#ifdef HI_AUDIO_AI_SUPPORT
HI_VOID AiStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    AI_EXPORT_FUNC_S *pstAiFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_AI, (HI_VOID**)&pstAiFunc);
    if ((HI_SUCCESS != s32Ret) || !pstAiFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstAiFunc->pfnAI_DrvSuspend)
        {
            if (HI_SUCCESS != pstAiFunc->pfnAI_DrvSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("AI suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstAiFunc->pfnAI_DrvResume)
        {
            if (HI_SUCCESS != pstAiFunc->pfnAI_DrvResume(HI_NULL))
            {
                PM_ERR_PrintInfo("AI resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}
#endif

HI_VOID CipherStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;

    CIPHER_EXPORT_FUNC_S *pstCipherFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_CIPHER, (HI_VOID**)&pstCipherFunc);
    if ((HI_SUCCESS != s32Ret) || !pstCipherFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstCipherFunc->pfnCipherSuspend)
        {
            pstCipherFunc->pfnCipherSuspend();
        }
    }
    else
    {
        if (pstCipherFunc->pfnCipherResume)
        {
            if (HI_SUCCESS != pstCipherFunc->pfnCipherResume())
            {
                PM_ERR_PrintInfo("CIPHER resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID VdecStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    VDEC_EXPORT_FUNC_S *pstVdecFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VDEC, (HI_VOID**)&pstVdecFunc);
    if ((HI_SUCCESS != s32Ret) || !pstVdecFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstVdecFunc->pfnVDEC_Suspend)
        {
            if (HI_SUCCESS != pstVdecFunc->pfnVDEC_Suspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("VDEC suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstVdecFunc->pfnVDEC_Resume)
        {
            if (HI_SUCCESS != pstVdecFunc->pfnVDEC_Resume(HI_NULL))
            {
                PM_ERR_PrintInfo("VDEC resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID VpssStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    VPSS_EXPORT_FUNC_S *pstVpssFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VPSS, (HI_VOID**)&pstVpssFunc);
    if ((HI_SUCCESS != s32Ret) || !pstVpssFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstVpssFunc->pfnVpssSuspend)
        {
            if (HI_SUCCESS != pstVpssFunc->pfnVpssSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("VPSS suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstVpssFunc->pfnVpssResume)
        {
            if (HI_SUCCESS != pstVpssFunc->pfnVpssResume(HI_NULL))
            {
                PM_ERR_PrintInfo("VPSS resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID OtpStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;

    OTP_EXPORT_FUNC_S *pstOtpFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_OTP, (HI_VOID**)&pstOtpFunc);
    if ((HI_SUCCESS != s32Ret) || !pstOtpFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstOtpFunc->pfnOTPSuspend)
        {
            if (HI_SUCCESS != pstOtpFunc->pfnOTPSuspend())
            {
                PM_ERR_PrintInfo("OTP suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstOtpFunc->pfnOTPResume)
        {
            if (HI_SUCCESS != pstOtpFunc->pfnOTPResume())
            {
                PM_ERR_PrintInfo("OTP resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID TdeStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    TDE_EXPORT_FUNC_S *pstTdeFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_TDE, (HI_VOID**)&pstTdeFunc);
    if ((HI_SUCCESS != s32Ret) || !pstTdeFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstTdeFunc->pfnTdeSuspend)
        {
            if (HI_SUCCESS != pstTdeFunc->pfnTdeSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("TDE suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstTdeFunc->pfnTdeResume)
        {
            if (HI_SUCCESS != pstTdeFunc->pfnTdeResume(HI_NULL))
            {
                PM_ERR_PrintInfo("TDE resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID I2cStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    I2C_EXT_FUNC_S *pstI2cFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_I2C, (HI_VOID**)&pstI2cFunc);
    if ((HI_SUCCESS != s32Ret) || !pstI2cFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstI2cFunc->pfnI2cSuspend)
        {
            if (HI_SUCCESS != pstI2cFunc->pfnI2cSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("I2C suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstI2cFunc->pfnI2cResume)
        {
            if (HI_SUCCESS != pstI2cFunc->pfnI2cResume(HI_NULL))
            {
                PM_ERR_PrintInfo("I2C resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

HI_VOID GpioStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    GPIO_EXT_FUNC_S *pstGpioFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_GPIO, (HI_VOID**)&pstGpioFunc);
    if ((HI_SUCCESS != s32Ret) || !pstGpioFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if (pstGpioFunc->pfnGpioSuspend)
        {
            if (HI_SUCCESS != pstGpioFunc->pfnGpioSuspend(HI_NULL, state))
            {
                PM_ERR_PrintInfo("GPIO suspend fail.\n");
            }
        }
    }
    else
    {
        if (pstGpioFunc->pfnGpioResume)
        {
            if (HI_SUCCESS != pstGpioFunc->pfnGpioResume(HI_NULL))
            {
                PM_ERR_PrintInfo("GPIO resume fail.\n");
            }
        }
    }

    PM_FUNC_EXIT();
    return;
}

#if defined(CHIP_TYPE_hi3798cv200) || defined(CHIP_TYPE_hi3798mv200) || defined(CHIP_TYPE_hi3798mv300) || defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450)
HI_VOID PqStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    PQ_EXPORT_FUNC_S *pstPqFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_PQ, (HI_VOID**)&pstPqFunc);
    if ((HI_SUCCESS != s32Ret) || !pstPqFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if ((pstPqFunc->pfnPqSuspend) && (HI_SUCCESS != pstPqFunc->pfnPqSuspend(HI_NULL, state)))
        {
            PM_ERR_PrintInfo("PQ suspend fail.\n");
        }
    }
    else
    {
        if ((pstPqFunc->pfnPqResume) && (HI_SUCCESS != pstPqFunc->pfnPqResume(HI_NULL)))
        {
            PM_ERR_PrintInfo("PQ resume fail.\n");
        }
    }

    PM_FUNC_EXIT();
    return;
}
#endif

#ifdef HI_DEMUX_SUPPORT
HI_VOID DemuxStandby(HI_BOOL bSuspendFlag)
{
    HI_S32 s32Ret;
    pm_message_t state = {0};

    DEMUX_EXPORT_FUNC_S *pstDemuxFunc;

    PM_FUNC_ENTER();

    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_DEMUX, (HI_VOID**)&pstDemuxFunc);
    if ((HI_SUCCESS != s32Ret) || !pstDemuxFunc)
    {
        PM_PrintErrorFunc(HI_DRV_MODULE_GetFunction, HI_FAILURE);
        return;
    }

    if (bSuspendFlag == HI_TRUE)
    {
        if ((pstDemuxFunc->pfnDmxSuspend) && (HI_SUCCESS != pstDemuxFunc->pfnDmxSuspend(HI_NULL, state)))
        {
            PM_ERR_PrintInfo("DEMUX suspend fail.\n");
        }
    }
    else
    {
        if ((pstDemuxFunc->pfnDmxResume) && (HI_SUCCESS != pstDemuxFunc->pfnDmxResume(HI_NULL)))
        {
            PM_ERR_PrintInfo("DEMUX resume fail.\n");
        }
    }

    PM_FUNC_EXIT();
    return;
}
#endif

HI_S32 PMEnterSmartStandby(HI_U32 u32HoldModules)
{
    PM_FUNC_ENTER();

    if (g_bEnterSmartStandby)
    {
        PM_ERR_PrintInfo("can't re-enter standby \n");
        return HI_FAILURE;
    }

    g_u32HoldModules = u32HoldModules;

#ifdef HI_DVFS_CPU_SUPPORT
    /* close dvfs */
    cpu_dvfs_enable = HI_FALSE;
#endif

    if (0 == (u32HoldModules & PMOC_HOLD_SCI))
    {
        SciStandby(HI_TRUE);
    }

#ifdef HI_VENC_SUPPORT
    if (0 == (u32HoldModules & PMOC_HOLD_VENC))
    {
        VencStandby(HI_TRUE);
    }
#endif

    if (0 == (u32HoldModules & PMOC_HOLD_PNG))
    {
       PngStandby(HI_TRUE);
    }

#ifdef HI_JPGE_SUPPORT
    if (0 == (u32HoldModules & PMOC_HOLD_JPGE))
    {
        JpgeStandby(HI_TRUE);
    }
#endif

#if 1 //del for skyplay
    if (0 == (u32HoldModules & PMOC_HOLD_JPEG))
    {
        JpegStandby(HI_TRUE);
    }
#endif

#ifdef HI_DEMUX_SUPPORT
    if (0 == (g_u32HoldModules & PMOC_HOLD_DEMUX))
    {
        DemuxStandby(HI_TRUE);
    }
#endif

    if (0 == (u32HoldModules & PMOC_HOLD_TUNER))
    {
       TunerStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_HDMI))
    {
        HdmiStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_VO))
    {
        VoStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_DISP))
    {
        DispStandby(HI_TRUE);
    }

#if defined(CHIP_TYPE_hi3798cv200) || defined(CHIP_TYPE_hi3798mv200) || defined(CHIP_TYPE_hi3798mv300) || defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450)
    if (0 == (u32HoldModules & PMOC_HOLD_PQ))
    {
        PqStandby(HI_TRUE);
    }
#endif

    if (0 == (u32HoldModules & PMOC_HOLD_AO))
    {
        AoStandby(HI_TRUE);
    }

#ifdef HI_AUDIO_AI_SUPPORT
    if (0 == (u32HoldModules & PMOC_HOLD_AI))
    {
        AiStandby(HI_TRUE);
    }
#endif

    if (0 == (u32HoldModules & PMOC_HOLD_CIPHER))
    {
        CipherStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_VDEC))
    {
        VdecStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_VPSS))
    {
        VpssStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_OTP))
    {
        OtpStandby(HI_TRUE);
    }

#if 1 //del for skyplay
    if (0 == (u32HoldModules & PMOC_HOLD_TDE))
    {
        TdeStandby(HI_TRUE);
    }
#endif

    if (0 == (u32HoldModules & PMOC_HOLD_I2C))
    {
        I2cStandby(HI_TRUE);
    }

    if (0 == (u32HoldModules & PMOC_HOLD_GPIO))
    {
        GpioStandby(HI_TRUE);
    }

    g_bEnterSmartStandby = 1;

    PM_FUNC_EXIT();
    return HI_SUCCESS;
}

HI_S32 PMQuitSmartStandby(HI_VOID)
{
    PM_FUNC_ENTER();

    if (0 == g_bEnterSmartStandby)
    {
        HI_ERR_PM("can't re-enter resume \n");
        return HI_FAILURE;
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_GPIO))
    {
        GpioStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_I2C))
    {
        I2cStandby(HI_FALSE);
    }

#if 1 //del for skyplay
    if (0 == (g_u32HoldModules & PMOC_HOLD_TDE))
    {
        TdeStandby(HI_FALSE);
    }
#endif

    if (0 == (g_u32HoldModules & PMOC_HOLD_OTP))
    {
        OtpStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_VPSS))
    {
       VpssStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_VDEC))
    {
        VdecStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_CIPHER))
    {
        CipherStandby(HI_FALSE);
    }

#ifdef HI_AUDIO_AI_SUPPORT
    if (0 == (g_u32HoldModules & PMOC_HOLD_AI))
    {
        AiStandby(HI_FALSE);
    }
#endif

    if (0 == (g_u32HoldModules & PMOC_HOLD_AO))
    {
        AoStandby(HI_FALSE);
    }

#if defined(CHIP_TYPE_hi3798cv200) || defined(CHIP_TYPE_hi3798mv200) || defined(CHIP_TYPE_hi3798mv300) || defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450)
    if (0 == (g_u32HoldModules & PMOC_HOLD_PQ))
    {
        PqStandby(HI_FALSE);
    }
#endif

    if (0 == (g_u32HoldModules & PMOC_HOLD_DISP))
    {
        DispStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_VO))
    {
        VoStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_HDMI))
    {
        HdmiStandby(HI_FALSE);
    }

    if (0 == (g_u32HoldModules & PMOC_HOLD_TUNER))
    {
        TunerStandby(HI_FALSE);
    }

#ifdef HI_DEMUX_SUPPORT
    if (0 == (g_u32HoldModules & PMOC_HOLD_DEMUX))
    {
        DemuxStandby(HI_FALSE);
    }
#endif

#if 1 //del for skyplay
    if (0 == (g_u32HoldModules & PMOC_HOLD_JPEG))
    {
        JpegStandby(HI_FALSE);
    }
#endif

#ifdef HI_JPGE_SUPPORT
    if (0 == (g_u32HoldModules & PMOC_HOLD_JPGE))
    {
        JpgeStandby(HI_FALSE);
    }
#endif

    if (0 == (g_u32HoldModules & PMOC_HOLD_PNG))
    {
        PngStandby(HI_FALSE);
    }

#ifdef HI_VENC_SUPPORT
    if (0 == (g_u32HoldModules & PMOC_HOLD_VENC))
    {
        VencStandby(HI_FALSE);
    }
#endif

    if (0 == (g_u32HoldModules & PMOC_HOLD_SCI))
    {
        SciStandby(HI_FALSE);
    }

#ifdef HI_DVFS_CPU_SUPPORT
    cpu_dvfs_enable = HI_TRUE;
#endif

    g_bEnterSmartStandby = 0;

    PM_FUNC_EXIT();
    return HI_SUCCESS;
}

