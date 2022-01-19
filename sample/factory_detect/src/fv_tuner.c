#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "hi_unf_ecs.h"
#include "hi_adp_boardcfg.h"
#include "fv_dbg.h"
#include "fv_config.h"
#include "fv_adapter.h"

#include "fv.h"
#include "fv_face.h"
#include "fv_threads.h"

/* For tuner AV2011 */
#define AV2011_DEF_ADDR (0xC2)
#define AV2011_DEF_MAXLPF (34)
#define AV2011_DEF_I2CCLK_KHZ (400)
#define AV2011_DEF_RFAGC (HI_UNF_TUNER_RFAGC_INVERT)
#define AV2011_DEF_IQSPEC (HI_UNF_TUNER_IQSPECTRUM_NORMAL)

/* For tuner SHARP7903 */
#define SHARP7903_DEF_ADDR (0xC0)
#define SHARP7903_DEF_MAXLPF (34)
#define SHARP7903_DEF_I2CCLK_KHZ (400)
#define SHARP7903_DEF_RFAGC (HI_UNF_TUNER_RFAGC_INVERT)
#define SHARP7903_DEF_IQSPEC (HI_UNF_TUNER_IQSPECTRUM_NORMAL)

/* For demod AVL6211 */
#define AVL6211_DEF_RESET_GPIO (12)    /* GPIO1_4 */
#define AVL6211_DEF_CLK_KHZ (16000)
#define AVL6211_DEF_ADDR_1 (0x0C)
#define AVL6211_DEF_ADDR_2 (0x0D)
#define AVL6211_DEF_DISEQCWAVE (HI_UNF_TUNER_DISEQCWAVE_NORMAL)
#define AVL6211_DEF_TSCLKPOLAR (HI_UNF_TUNER_TSCLK_POLAR_RISING)
#define AVL6211_DEF_TSFORMAT (HI_UNF_TUNER_TS_FORMAT_TS)
#define AVL6211_DEF_TSSERIALPIN (HI_UNF_TUNER_TS_SERIAL_PIN_0)

/* For LNB control chipset MPS8125 */
#define MPS8125_DEF_ADDR (0x0)

/* For LNB control chipset ISL9492 */
#define ISL9492_DEF_ADDR (0x10)

#define GET_TUNER_CONNECT_CONFIG(stConnectAttr) \
{\
    stConnectAttr.enSigType = HI_UNF_TUNER_SIG_TYPE_CAB; \
    stConnectAttr.unConnectPara.stCab.bReverse = p->reverse;\
    stConnectAttr.unConnectPara.stCab.u32Freq = p->freq;\
    stConnectAttr.unConnectPara.stCab.u32SymbolRate = p->symbol_rate_or_band;\
    stConnectAttr.unConnectPara.stCab.enModType = p->mode_type_or_polar;\
}

static int fv_detect_one_tuner(int ix, struct fv_config_tuner *p)
{
    int s32Ret;
    HI_U32  I2CType = 0;
    HI_U32  GpioSDA = 0;
    HI_U32  GpioSCL = 0;
    HI_U32  GpioI2cNum = 0;
    HI_UNF_TUNER_ATTR_S stTunerAttr;
    HI_UNF_TUNER_STATUS_S status;
    HI_UNF_TUNER_CONNECT_PARA_S  stConnectPara;

    s32Ret = HI_UNF_TUNER_Open(ix);
    if (s32Ret) {
        goto err_open;
    }

    stTunerAttr.enSigType        = HIADP_INI_Getl("tunerinfo", "SigType",      DEFAULT_SIG_TYPE,   FRONTEND_CONFIG_FILE);
    stTunerAttr.enTunerDevType   = HIADP_INI_Getl("tunerinfo", "TunerType",    DEFAULT_TUNER_TYPE, FRONTEND_CONFIG_FILE);
    stTunerAttr.u32TunerAddr     = HIADP_INI_Getl("tunerinfo", "TunerI2cAddr", DEFAULT_TUNER_ADDR, FRONTEND_CONFIG_FILE);
    stTunerAttr.enDemodDevType   = HIADP_INI_Getl("tunerinfo", "DemodType",    DEFAULT_DEMOD_TYPE, FRONTEND_CONFIG_FILE);;
    stTunerAttr.u32DemodAddr     = HIADP_INI_Getl("tunerinfo", "DemodI2cAddr", DEFAULT_DEMOD_ADDR, FRONTEND_CONFIG_FILE);;
    stTunerAttr.enOutputMode     = HIADP_INI_Getl("tunerinfo", "DemodOutPutMode", DEFAULT_DEMOD_OUTPUT_MODE, FRONTEND_CONFIG_FILE);;
    if(1 == HIADP_INI_Getl("tunerinfo", "DemodRstType", DEFAULT_DEMOD_RST_TYPE, FRONTEND_CONFIG_FILE))
    {
        stTunerAttr.u32ResetGpioNo   = HIADP_INI_Getl("tunerinfo", "DemodRstGpio", DEFAULT_DEMOD_RST_GPIO, FRONTEND_CONFIG_FILE);;
    }

    I2CType = HIADP_INI_Getl("tunerinfo", "I2cType", 0, FRONTEND_CONFIG_FILE);

        if(0 == I2CType)
    {
        stTunerAttr.enI2cChannel  = HIADP_INI_Getl("tunerinfo", "I2cChNum", DEFAULT_I2C_CHNUM, FRONTEND_CONFIG_FILE);
    }
    else if(1 == I2CType)
    {
        GpioSCL = HIADP_INI_Getl("tunerinfo", "GpioI2cScl", DEFAULT_GPIOI2C_SCL, FRONTEND_CONFIG_FILE);
        GpioSDA = HIADP_INI_Getl("tunerinfo", "GpioI2cSda", DEFAULT_GPIOI2C_SDA, FRONTEND_CONFIG_FILE);
        if(GpioSCL && GpioSDA)
        {
            s32Ret = HI_UNF_I2C_CreateGpioI2c(&GpioI2cNum, GpioSCL, GpioSDA);
            if (HI_SUCCESS != s32Ret)
            {
                fv_debug("HI_UNF_I2C_CreateGpioI2c failed 0x%x\n", s32Ret);
                return HI_FAILURE;
            }

            stTunerAttr.enI2cChannel = GpioI2cNum;
        }
        else
        {
            fv_debug("Invalid data: GpioSCL[%d] or GpioSDA[%d]\n", GpioSCL, GpioSDA);
            return HI_FAILURE;
        }

    }

    s32Ret = HI_UNF_TUNER_SetAttr(ix, &stTunerAttr);
    if (HI_SUCCESS != s32Ret)
    {
        fv_debug("call HI_UNF_TUNER_SetAttr failed.\n");
        goto err_out;
    }

    GET_TUNER_CONNECT_CONFIG(stConnectPara)

    /* connect Tuner*/
    s32Ret = HI_UNF_TUNER_Connect(ix, &stConnectPara, 500);
    if (HI_SUCCESS != s32Ret)
    {
        fv_debug("call HI_UNF_TUNER_Connect failed, s32Ret:0x%x\n",s32Ret);
        HI_UNF_TUNER_Close(ix);
        return 1;
    }
    fv_debug("HI_UNF_TUNER_Connect OK.\n");

    s32Ret = HI_UNF_TUNER_GetStatus(ix, &status);

    HI_UNF_TUNER_Close(ix);

    if (s32Ret || HI_UNF_TUNER_SIGNAL_LOCKED != status.enLockStatus) {
        fv_debug("%s->%d, tuner not connected!\n",__func__,__LINE__);
        return 1;
    } else {
        fv_debug("%s->%d, tuner connected!\n",__func__,__LINE__);
        return 0;
    }

err_out:
    HI_UNF_TUNER_Close(ix);
err_open:
    return -1;
}
void fv_tuner_detect(int howmany, struct fv_config_tuner *para)
{
    int ret;
    int i, left,used;
    char buf[32] = {0};
    char *p = buf;

    ret = HI_UNF_TUNER_Init();
    if (ret)
        goto err_tuner_init;

    left = sizeof(buf);
    for (i = 0; i < howmany; i++) {
        ret = fv_detect_one_tuner(i, para);
        if (ret < 0)
            break;
        else if (ret == 0) {
            used = snprintf(p, left, "%d: %s", i, TUNER_CONNECT_STRING);
        } else {
            used = snprintf(p, left, "%d: %s", i, TUNER_DISCON_STRING);
        }
        p += used;
        left -= used;
        if (i + 1 <= howmany) {
            used = snprintf(p, left, "%s",";");
            p += used;
            left -= used;
        }
    }
    HI_FV_DrawText(FV_ITEM_TUNER_TXT, buf, strlen(buf));

err_tuner_init:
        HI_UNF_TUNER_DeInit();
        return;
}

