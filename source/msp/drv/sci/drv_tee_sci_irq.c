/******************************************************************************
   Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 * @File Name            :   drv_tee_sci_irq.c
 * @Author               :   Kylin
 * @Date                 :   2017-04-20 20:55:12
 * @Last Modified by     :   Kylin
 * @Last Modified time   :   2017-05-27 08:57:01
 * @Email                :   kylin.zhuang@hisilicon.com
 * @Description          :   drv_tee_sci_irq
 ******************************************************************************/

#include <linux/slab.h>
#include <linux/dma-mapping.h>
#include <linux/semaphore.h>
#include <linux/semaphore.h>
#include <asm/cacheflush.h>
#include <linux/interrupt.h>
#include <linux/printk.h>

#include "hi_debug.h"
#include "drv_tee_sci_irq.h"

#include "hi_kernel_adapt.h"
#include "hi_type.h"

#define TEE_SCI_CARD_IN_IRQ_NUM  (156+32)
#define TEE_SCI_CARD_OUT_IRQ_NUM  (157+32)
static HI_U32 hsciteeIRQ_cardIn;
static HI_U32 hsciteeIRQ_cardOut;

typedef enum _SCI_TEE_STATUS_E
{
    CARD_REMOVED = 0,/*The card is removed*/
    CARD_INSERTED = 1,/*The card is inserted*/
    CARD_STATUS_BUTT
}SCI_TEE_STATUS_E;

SCI_TEE_STATUS_E g_card_status_sci_tee = CARD_REMOVED;

HI_S32 hi_sci_tee_get_card_status_via_irq(HI_UNF_SCI_STATUS_E *card_status)
{
    if (g_card_status_sci_tee == CARD_INSERTED)
    {
        *card_status = HI_UNF_SCI_STATUS_INACTIVECARD;
    }
    else
    {
        *card_status = HI_UNF_SCI_STATUS_NOCARD;
    }
    return 0;
}

irqreturn_t tee_sci_card_in_isr(HI_S32 irq, HI_VOID *dev_id)
{
    g_card_status_sci_tee = CARD_INSERTED;

    HI_INFO_SCI("TeeSciCardInIrq \n");
    return IRQ_HANDLED;
}

irqreturn_t tee_sci_card_out_isr(HI_S32 irq, HI_VOID *dev_id)
{
    g_card_status_sci_tee = CARD_REMOVED;

    HI_INFO_SCI("TeeSciCardOutIrq \n");
    return IRQ_HANDLED;
}

HI_S32 tee_sci_irq_init(HI_VOID)
{
    HI_S32 ret;
    /* request irq card in by Ree*/
    ret = osal_request_irq(TEE_SCI_CARD_IN_IRQ_NUM, tee_sci_card_in_isr, 0x00000080, "TeeSciCardInIrq", (HI_VOID*)&hsciteeIRQ_cardIn);
    if (ret != HI_SUCCESS)
    {
        HI_ERR_SCI("request_irq(TEE_SCI_CARD_IN_IRQ_NUM Failed!\n");
        osal_free_irq(TEE_SCI_CARD_IN_IRQ_NUM, "TeeSciCardInIrq", (HI_VOID*)&hsciteeIRQ_cardIn);
    }
    /* request irq card out by Ree*/
    ret = osal_request_irq(TEE_SCI_CARD_OUT_IRQ_NUM, tee_sci_card_out_isr, 0x00000080, "TeeSciCardOutIrq", (HI_VOID*)&hsciteeIRQ_cardOut);
    if (ret != HI_SUCCESS)
    {
        HI_ERR_SCI("request_irq(TEE_SCI_CARD_OUT_IRQ_NUM Failed!\n");
        osal_free_irq(TEE_SCI_CARD_OUT_IRQ_NUM, "TeeSciCardOutIrq", (HI_VOID*)&hsciteeIRQ_cardOut);
    }
    return ret;
}

HI_VOID tee_sci_irq_deinit(HI_VOID)
{
    osal_free_irq(TEE_SCI_CARD_IN_IRQ_NUM, "TeeSciCardInIrq", (HI_VOID*)&hsciteeIRQ_cardIn);
    osal_free_irq(TEE_SCI_CARD_OUT_IRQ_NUM, "TeeSciCardOutIrq", (HI_VOID*)&hsciteeIRQ_cardOut);
}

EXPORT_SYMBOL(tee_sci_irq_init);
EXPORT_SYMBOL(tee_sci_irq_deinit);
EXPORT_SYMBOL(hi_sci_tee_get_card_status_via_irq);
