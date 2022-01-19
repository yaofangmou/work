/******************************************************************************
   Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 * @File Name            :   drv_tee_sci_agent.c
 * @Author               :   Kylin
 * @Date                 :   2017-04-20 20:55:12
 * @Last Modified by     :   Kylin
 * @Last Modified time   :   2017-05-27 08:57:01
 * @Email                :   kylin.zhuang@hisilicon.com
 * @Description          :   drv_tee_sci_agent
 ******************************************************************************/

#include <linux/fs.h>
#include <linux/list.h>
#include <linux/mutex.h>
#include <linux/slab.h>
#include <linux/kthread.h>
#include <linux/delay.h>

#ifdef CONFIG_OPTEE
#include <linux/tee_drv.h>
#else
#include "tee_client_constants.h"
#include "teek_ns_client.h"
#include "agent.h"
#include "mem.h"
#endif

#include "drv_tzsci.h"

#include "hi_debug.h"

#define SCI_AGENT_ID 0x1698

typedef enum
{
    HISI_SCI_AGENT_SLEEP = 0x0,
    HISI_SCI_AGENT_CLOSE,
} sci_cmd_t;

struct sci_ctrl_t
{
    sci_cmd_t cmd;
    int duration_sleep;
};

#ifdef CONFIG_OPTEE
static int sci_ops(struct sci_ctrl_t *sci_ctrl)
{
    int ret = 0;
    mmb_addr_t addr;
    int iommu;

    if (!sci_ctrl) {
        HI_PRINT("parameters from tee is NULL!\n");
        return -1;
    }

    switch (sci_ctrl->cmd)
    {
        case HISI_SCI_AGENT_SLEEP:
        {
            HI_PRINT("HISI_SCI_AGENT_SLEEP\n");
            msleep(sci_ctrl->duration_sleep);
            break;
        }
        case HISI_SCI_AGENT_CLOSE:
        {
            HI_PRINT("HISI_SCI_AGENT_SLEEP\n");
            break;
        }
        default :
        {
            HI_PRINT("%s cmd err!\n", __func__);
            ret = -1;
            return ret;
        }
    }

    return ret;
}

static int sci_agent_run(void *priv, void *virt, unsigned int size)
{
    struct sci_ctrl_t *sci_ctrl = NULL;

    if (!virt || !size || size < sizeof(*sci_ctrl)) {
        HI_PRINT("parameter from tee is null!\n");
        return -1;
    }
    sci_ctrl = (struct sci_ctrl_t *)virt;
    return sci_ops(sci_ctrl);
}


struct tee_agent_kernel_ops sci_agent_ops = {
    .agent_name = "sci_agent",
    .agent_id = SCI_AGENT_ID,
    .mutex = __MUTEX_INITIALIZER(sci_agent_ops.mutex),
    .tee_agent_run = sci_agent_run,
};

int sci_agent_register(void)
{
    HI_PRINT("tee_agent_kernel_register\n");
    return tee_agent_kernel_register(&sci_agent_ops);
}

int sci_agent_unregister(void)
{
    HI_PRINT("tee_agent_kernel_unregister\n");
    return tee_agent_kernel_unregister(&sci_agent_ops);
}
#else

#define CLOSE_AGENT 0x12

static int sci_agent_init(struct tee_agent_kernel_ops* agent_instance)
{
    return 0;
}

static int sci_agent_exit(struct tee_agent_kernel_ops* agent_instance)
{
    return 0;
}

static int sci_tee_agent_work(void *data)
{
    int ret = 0;
    int agent_station = 0;
    struct tee_agent_kernel_ops *agent_instance =
            (struct tee_agent_kernel_ops *)data;

    while (!kthread_should_stop())
    {
        ret = TC_NS_wait_event(agent_instance->agent_id);
        if (ret)
        {
            HI_PRINT("%s wait event fail\n", agent_instance->agent_name);
            break;
        }

        if (agent_instance->tee_agent_work)
            agent_station = agent_instance->tee_agent_work(agent_instance);

        ret = TC_NS_send_event_response(agent_instance->agent_id);
        if (ret)
        {
            HI_PRINT("%s send event response fail\n", agent_instance->agent_name);
            break;
        }

        if (CLOSE_AGENT == agent_station)
        {
            /*
             * agent will be closed.
             **/
            break;
        }
    }

    return ret;
}

#define AGENT_BUFF_SIZE (4*1024)
static int sci_tee_agent_run(struct tee_agent_kernel_ops* agent_instance)
{
    TC_NS_Shared_MEM *shared_mem = NULL;
    TC_NS_DEV_File dev;
    int ret;

    /*1. Allocate agent buffer */
    #ifdef CONFIG_TEE_VMX_ULTRA
        shared_mem = tc_mem_allocate(&dev, AGENT_BUFF_SIZE);
    #else
        shared_mem = tc_mem_allocate(&dev, AGENT_BUFF_SIZE, true);
    #endif
    if (IS_ERR(shared_mem))
    {
        HI_PRINT("allocate agent buffer fail\n");
        ret = PTR_ERR(shared_mem);
        goto out;
    }
    agent_instance->agent_buffer = shared_mem;

    /*2. Register agent buffer to TEE */
    ret = TC_NS_register_agent(&dev, agent_instance->agent_id, shared_mem);
    if (ret)
    {
        HI_PRINT("register agent buffer fail\n");
        ret = -1;
        goto out;
    }

    /*3. Creat thread to run agent */
    agent_instance->agent_thread
        = kthread_run(sci_tee_agent_work, (void *)agent_instance, "agent_%s", agent_instance->agent_name);
    if (IS_ERR(agent_instance->agent_thread))
    {
        HI_PRINT("kthread creat fail\n");
        ret = PTR_ERR(agent_instance->agent_thread);
        agent_instance->agent_thread = NULL;
        goto out;
    }
    return 0;

    out:
    if(!IS_ERR_OR_NULL(shared_mem))
    {
        tc_mem_free(shared_mem);
    }
    if (!IS_ERR_OR_NULL(agent_instance->agent_thread))
    {
        kthread_stop(agent_instance->agent_thread);
        agent_instance->agent_thread = NULL;
    }

    return ret;
}

static int sci_agent_work(struct tee_agent_kernel_ops* agent_instance)
{
    struct sci_ctrl_t *sci_ctrl = (struct sci_ctrl_t *)agent_instance->agent_buffer->kernel_addr;

    int ret = 0;

    if (!sci_ctrl)
    {
        HI_PRINT("%s :system err!\n", __func__);
        return -1;
    }

    switch (sci_ctrl->cmd)
    {
        case HISI_SCI_AGENT_SLEEP:
        {
            msleep(sci_ctrl->duration_sleep);
            break;
        }
        case HISI_SCI_AGENT_CLOSE:
        {
            ret = CLOSE_AGENT;
            break;
        }
        default :
        {
            HI_PRINT("%s cmd err!\n", __func__);
            ret = -1;
            return ret;
        }
    }
    return ret;
}

static int sci_tee_agent_init(struct tee_agent_kernel_ops* agent_instance)
{
    int ret;

    if ((NULL == agent_instance) || (agent_instance->agent_id == 0) ||
        (agent_instance->agent_name == NULL) ||
        (agent_instance->tee_agent_work == NULL))
    {
        HI_PRINT("agent is invalid\n");
        return -1;;
    }

    /* Initialize the agent */
    if (agent_instance->tee_agent_init)
    {
        ret = agent_instance->tee_agent_init(agent_instance);
    }
    else
    {
        HI_PRINT("tee_agent_init %s should not be null\n", agent_instance->agent_name);
        return -1;
    }

    if (ret)
    {
        HI_PRINT("tee_agent_init %s failed\n", agent_instance->agent_name);
        return -1;
    }

    /* Run the agent */
    if (agent_instance->tee_agent_run)
    {
        ret = agent_instance->tee_agent_run(agent_instance);
    }
    else
    {
        HI_PRINT("tee_agent_run %s should not be null\n", agent_instance->agent_name);
        return -1;
    }

    if (ret)
    {
        HI_PRINT("tee_agent_run %s failed\n", agent_instance->agent_name);
        if (agent_instance->tee_agent_exit)
        {
            agent_instance->tee_agent_exit(agent_instance);
        }
        return -1;;
    }

    return 0;
}

static int sci_agent_stop(struct tee_agent_kernel_ops* agent_instance)
{
    int ret;

    /*
     * make agent in secure os to send message to agent in
     * no secure world to stop wait event, and stop the thread
     */
    ret = hi_tee_sci_agent_end();
    if (ret)
    {
        HI_PRINT("%s  close agend failed!\n", __func__);
        return -1;
    }

    TC_NS_unregister_agent(agent_instance->agent_id);
    if (!IS_ERR_OR_NULL(agent_instance->agent_thread))
    {
        kthread_stop(agent_instance->agent_thread);
    }
    return 0;
}

static struct tee_agent_kernel_ops sci_agent_ops =
{
    .agent_name = "sci",
    .agent_id = SCI_AGENT_ID,   //to do
    .tee_agent_init = sci_agent_init,
    .tee_agent_run = sci_tee_agent_run,
    .tee_agent_work = sci_agent_work,
    .tee_agent_exit = sci_agent_exit,
    .tee_agent_stop = sci_agent_stop,
    .list = LIST_HEAD_INIT(sci_agent_ops.list)
};

int sci_agent_register(void)
{
    tee_agent_kernel_register(&sci_agent_ops);
    sci_tee_agent_init(&sci_agent_ops);
    return 0;
}

int sci_agent_unregister(void)
{
    int ret = 0;
    struct tee_agent_kernel_ops* agent_instance = &sci_agent_ops;

    if (agent_instance->tee_agent_exit)
    {
        ret = agent_instance->tee_agent_exit(agent_instance);
    }
    else
    {
        HI_PRINT("tee_agent_init %s should not be null\n", agent_instance->agent_name);
        return -1;
    }

    if (agent_instance->tee_agent_stop)
    {
        agent_instance->tee_agent_stop(agent_instance);
    }

    return 0;
}
#endif
