/******************************************************************************
   Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 * @File Name            :   drv_tzsci.c
 * @Author               :   Kylin
 * @Date                 :   2017-04-20 20:55:12
 * @Last Modified by     :   Kylin
 * @Last Modified time   :   2017-05-27 08:57:01
 * @Email                :   kylin.zhuang@hisilicon.com
 * @Description          :   drv_tzsci
 ******************************************************************************/

#include <linux/slab.h>
#include <linux/dma-mapping.h>
#include <linux/semaphore.h>
#include <linux/semaphore.h>
#include <asm/cacheflush.h>

#include <drv_tee_sci_client.h>
#include "drv_tzsci.h"
#include "hi_debug.h"

int hi_tee_sci_agent_end(void)
{
    return hisi_secsci_agent_end();
}

EXPORT_SYMBOL(hi_tee_sci_agent_end);
