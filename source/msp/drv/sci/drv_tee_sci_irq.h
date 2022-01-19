/******************************************************************************
   Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 * @File Name            :   drv_tee_sci_client.h
 * @Author               :   Kylin
 * @Date                 :   2017-04-20 20:55:12
 * @Last Modified by     :   Kylin
 * @Last Modified time   :   2017-05-27 08:57:01
 * @Email                :   kylin.zhuang@hisilicon.com
 * @Description          :   drv_tee_sci_client
 ******************************************************************************/

#ifndef __DRV_TEE_SCI_IRQ_H
#define __DRV_TEE_SCI_IRQ_H

#include <hi_unf_sci.h>
#include <hi_drv_sci.h>
HI_S32 tee_sci_irq_init(HI_VOID);

HI_VOID tee_sci_irq_deinit(HI_VOID);

HI_S32 hi_sci_tee_get_card_status_via_irq(HI_UNF_SCI_STATUS_E *card_status);

#endif