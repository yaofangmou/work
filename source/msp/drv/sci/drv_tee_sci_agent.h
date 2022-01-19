/******************************************************************************
   Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 * @File Name            :   drv_tee_sci_agent.h
 * @Author               :   Kylin
 * @Date                 :   2017-04-20 20:55:12
 * @Last Modified by     :   Kylin
 * @Last Modified time   :   2017-05-27 08:57:01
 * @Email                :   kylin.zhuang@hisilicon.com
 * @Description          :   drv_tee_sci_agent
 ******************************************************************************/

#ifndef _DRV_TEE_SCI_AGENT_H
#define _DRV_TEE_SCI_AGENT_H

#ifdef CONFIG_TZDRIVER

int sci_agent_register(void);

int sci_agent_unregister(void);

#else
static inline int sci_agent_register(void)
{
    return 0;
}

static inline int sci_agent_unregister(void)
{
    return 0;
}

#endif
#endif
