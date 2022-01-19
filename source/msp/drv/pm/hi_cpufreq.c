/*
 * hi-cpufreq.c - hisilicon Processor cpufreq Driver
 *
 * Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
 *
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/err.h>
#include <linux/clk.h>
#include <linux/smp.h>
#include <linux/sched.h>
#include <linux/cpufreq.h>
#include <linux/compiler.h>
#include <linux/dmi.h>
#include <linux/slab.h>
#include <linux/input.h>
#include <linux/version.h>
#include <linux/io.h>
#include <linux/delay.h>
#include <linux/uaccess.h>
#include <linux/platform_device.h>
#include <asm/processor.h>
#include <linux/cpu.h>
#include <asm/smp_plat.h>
#include <asm/cpu.h>

#include "hi_dvfs.h"
#include "opp.h"
#include "clock.h"
#include "hipm.h"
#include "hi_drv_pmoc.h"
#include "drv_pmoc_debug.h"

static struct cpufreq_frequency_table *freq_table;

static atomic_t freq_table_users = ATOMIC_INIT(0);
static unsigned int max_freq;
static unsigned int current_target_freq;
unsigned int cpu_dvfs_enable = HI_TRUE;

static unsigned int g_BoostCount = 0;

static unsigned int g_SetMinFreqCount = 0;
static unsigned int g_LastMinFreq = 0;

#define CPU_SCALING_MIN_FREQ "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq"

int read_cpufreq_node(const char * node);
int write_cpufreq_node(const char * node, int value);

DEFINE_MUTEX(hi_cpufreq_lock);

struct clk *pMpuClk;
static unsigned int hi_cpufreq_getspeed(unsigned int cpu)
{
    unsigned int rate;

    PM_FUNC_ENTER();

    if (cpu >= NR_CPUS)
    {
        return 0;
    }

    rate = (unsigned int)hi_clk_get_rate(pMpuClk);

    PM_FUNC_EXIT();
    return rate;
}

static int hi_cpufreq_scale(struct cpufreq_policy *policy, unsigned int target_freq, unsigned int cur_freq)
{
    int ret;
    struct cpufreq_freqs freqs;

    PM_FUNC_ENTER();

    freqs.new = target_freq;
    freqs.old = hi_cpufreq_getspeed(0);

    if ((freqs.old == freqs.new) && (cur_freq == freqs.new))
    {
        return 0;
    }

    get_online_cpus();

    /* notifiers */
    for_each_online_cpu(freqs.cpu)

    cpufreq_freq_transition_begin(policy, &freqs);

    ret = hi_device_scale(&mpu_dev, freqs.old, freqs.new );

    freqs.new = hi_cpufreq_getspeed(0);

    /* notifiers */
    for_each_online_cpu(freqs.cpu)

    cpufreq_freq_transition_end(policy, &freqs, 0);

    put_online_cpus();

    PM_FUNC_EXIT();
    return ret;
}

static int hi_cpufreq_target(struct cpufreq_policy *policy,
                             unsigned int target_freq, unsigned int relation)
{
    unsigned int i;
    int ret = 0;

    PM_FUNC_ENTER();

    if (!freq_table)
    {
        PM_ERR_PrintInfo("no freq table:");
        PM_ERR_PrintS32(policy->cpu);

        return -EINVAL;
    }

#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 44))
    ret = cpufreq_frequency_table_target(policy, freq_table, target_freq,
                                         relation, &i);
    if (ret)
    {
        PM_PrintWarnFunc(cpufreq_frequency_table_target, ret);
        PM_WARN_PrintS32(policy->cpu);
        PM_WARN_PrintS32(target_freq);
        return ret;
    }
#else
    i = cpufreq_frequency_table_target(policy, target_freq, relation);
#endif

    mutex_lock(&hi_cpufreq_lock);

    current_target_freq = freq_table[i].frequency;

    if (cpu_dvfs_enable)
    {
        ret = hi_cpufreq_scale(policy, current_target_freq, policy->cur);
    }

    mutex_unlock(&hi_cpufreq_lock);

    PM_FUNC_EXIT();
    return ret;
}

static int hi_cpufreq_verify(struct cpufreq_policy *policy)
{
    PM_FUNC_ENTER();

    if (!freq_table)
    {
        return -EINVAL;
    }

    PM_FUNC_EXIT();
    return cpufreq_frequency_table_verify(policy, freq_table);
}

static inline void freq_table_free(void)
{
    PM_FUNC_ENTER();

    if (atomic_dec_and_test(&freq_table_users))
    {
        opp_free_cpufreq_table(&mpu_dev, &freq_table);
    }

    PM_FUNC_EXIT();
    return;
}

extern int cpufreq_interactive_boostpulse(void);
int pm_cpufreq_boost(void)
{
    int ret;
    struct cpufreq_policy cur_policy;
    const char name[CPUFREQ_NAME_LEN] = "interactive";

    PM_FUNC_ENTER();

    ret = cpufreq_get_policy(&cur_policy, 0);
    if (ret)
    {
        return ret;
    }

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0))
    if (!strncasecmp(cur_policy.governor->name, name, CPUFREQ_NAME_LEN))
#else
    if (!strncasecmp(cur_policy.user_policy.governor->name, name, CPUFREQ_NAME_LEN))
#endif
    {
#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 44))
        ret = cpufreq_interactive_boostpulse();
        if (ret)
        {
            return ret;
        }
#endif
    }

    PM_FUNC_EXIT();
    return 0;
}

extern int cpufreq_interactive_setboost(int val, int freq);
int pm_cpufreq_set_boost(int flag, int freq)
{
    int ret;
    struct cpufreq_policy cur_policy;
    const char name[CPUFREQ_NAME_LEN] = "interactive";

    PM_FUNC_ENTER();

    /* can't boost freq more than once consecutively */
    if (flag == g_BoostCount)
    {
        return 0;
    }

    ret = cpufreq_get_policy(&cur_policy, 0);
    if (ret)
    {
        return ret;
    }

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0))
    if (!strncasecmp(cur_policy.governor->name, name, CPUFREQ_NAME_LEN))
#else
    if (!strncasecmp(cur_policy.user_policy.governor->name, name, CPUFREQ_NAME_LEN))
#endif
    {
        ret = cpufreq_interactive_setboost(flag, freq);
        if (ret)
        {
            return ret;
        }
    }

    g_BoostCount = flag;

    PM_FUNC_EXIT();
    return 0;
}

int hi_cpufreq_set_min_freq(int flag, int freq)
{
    int ret;

    PM_FUNC_ENTER();

    if (flag == g_SetMinFreqCount)
    {
        return 0;
    }

    if (flag)
    {
        g_LastMinFreq = read_cpufreq_node(CPU_SCALING_MIN_FREQ);

        ret = write_cpufreq_node(CPU_SCALING_MIN_FREQ, freq);
        if (ret)
        {
            PM_PrintErrorFunc(write_cpufreq_node, ret);
            return ret;
        }
    }
    else
    {
        ret = write_cpufreq_node(CPU_SCALING_MIN_FREQ, g_LastMinFreq);
        if (ret)
        {
            PM_ERR_PrintInfo("Failed to write ori scaling min freq");
            PM_PrintErrorFunc(write_cpufreq_node, ret);
            return ret;
        }
    }

    g_SetMinFreqCount = flag;

    PM_FUNC_EXIT();
    return 0;
}

#ifndef HI_ADVCA_FUNCTION_RELEASE
 #ifndef MODULE
static void cpufreq_interactive_input_event(struct input_handle *handle,
                                            unsigned int type,
                                            unsigned int code, int value)
{
    PM_FUNC_ENTER();

    if ((type == EV_SYN) && (code == SYN_REPORT))
    {
        pm_cpufreq_boost();
    }

    PM_FUNC_EXIT();
    return;
}

static int cpufreq_interactive_input_connect(struct input_handler *        handler,
                                             struct input_dev *            dev,
                                             const struct input_device_id *id)
{
    struct input_handle *handle;
    int error;

    PM_FUNC_ENTER();

    handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
    if (!handle)
    {
        return -ENOMEM;
    }

    handle->dev = dev;
    handle->handler = handler;
    handle->name = "cpufreq_interactive";

    error = input_register_handle(handle);
    if (error)
    {
        PM_PrintErrorFunc(input_register_handle, error);
        kfree(handle);
        return error;
    }

    error = input_open_device(handle);
    if (error)
    {
        PM_PrintErrorFunc(input_open_device, error);
        input_unregister_handle(handle);
        kfree(handle);
        return error;
    }

    PM_FUNC_EXIT();
    return 0;
}

static void cpufreq_interactive_input_disconnect(struct input_handle *handle)
{
    input_close_device(handle);
    input_unregister_handle(handle);
    kfree(handle);
}

static const struct input_device_id cpufreq_interactive_ids[] =
{
    { .driver_info = 1 },       /* Matches all devices */
    { },                        /* Terminating zero entry */
};

static struct input_handler cpufreq_interactive_input_handler =
{
    .event = cpufreq_interactive_input_event,
    .connect = cpufreq_interactive_input_connect,
    .disconnect = cpufreq_interactive_input_disconnect,
    .name = "cpufreq_interactive",
    .id_table = cpufreq_interactive_ids,
};
 #endif
#endif

int write_cpufreq_node(const char * node, int value)
{
    struct file *filep;
    char name[CPUFREQ_NAME_LEN] = {0};
    ssize_t write_len;
    mm_segment_t old_fs;
    loff_t pos = 0;

    PM_FUNC_ENTER();

    snprintf(name, CPUFREQ_NAME_LEN, "%u\n", value);

    PM_INFO_PrintS32(value);

    filep = filp_open(node, O_CREAT|O_RDWR, 0);
    if(IS_ERR(filep))
    {
        PM_PrintErrorFunc(filp_open, -1);
        PM_ERR_PrintStr(node);
        PM_ERR_PrintHex(filep);

        return -1;
    }

    old_fs = get_fs();
    set_fs(KERNEL_DS);

    write_len = vfs_write(filep, (char __user*)name, sizeof(name), &pos);
    if (write_len < 0)
    {
        PM_PrintErrorFunc(vfs_write, -1);
        PM_ERR_PrintStr(node);
    }

    pos = 0;

    set_fs(old_fs);
    filp_close(filep, 0);

    PM_FUNC_EXIT();
    return 0;
}

int read_cpufreq_node(const char * node)
{
    struct file *filep;
    char name[CPUFREQ_NAME_LEN] = {0};
    ssize_t read_len;
    mm_segment_t old_fs;
    loff_t pos = 0;
    int ret;

    int value = 0;

    PM_FUNC_ENTER();

    filep = filp_open(node, O_CREAT|O_RDWR, 0);
    if(IS_ERR(filep))
    {
        PM_PrintErrorFunc(filp_open, -1);
        PM_ERR_PrintStr(node);
        PM_ERR_PrintHex(filep);
        return -1;
    }

    old_fs = get_fs();
    set_fs(KERNEL_DS);

    read_len = vfs_read(filep, (char __user*)name, sizeof(name), &pos);
    if (read_len < 0)
    {
        PM_PrintErrorFunc(vfs_read, -1);
        PM_ERR_PrintStr(node);
        PM_ERR_PrintHex(read_len);
        return -1;
    }

    ret = kstrtou32(name, 0, &value);
    if (ret < 0)
    {
        PM_PrintErrorFunc(kstrtou32, -1);
        return -1;
    }

    PM_ERR_PrintS32(value);

    pos = 0;

    set_fs(old_fs);
    filp_close(filep, 0);

    PM_FUNC_EXIT();
    return value;
}


extern struct clk mpu_ck;
static int hi_cpufreq_cpu_init(struct cpufreq_policy *policy)
{
    int result = 0;
    int i;

    PM_FUNC_ENTER();

    pMpuClk = &mpu_ck;
    if (IS_ERR(pMpuClk))
    {
        return PTR_ERR(pMpuClk);
    }

    if (policy->cpu >= 1)
    {
        result = -EINVAL;
        goto fail_ck;
    }

    policy->cur = policy->min = policy->max = hi_cpufreq_getspeed(policy->cpu);

    if (atomic_inc_return(&freq_table_users) == 1)
    {
        result = opp_init_cpufreq_table(&mpu_dev, &freq_table);
        if (result)
        {
            PM_PrintErrorFunc(opp_init_cpufreq_table, HI_FAILURE);
            PM_ERR_PrintS32(policy->cpu);
            PM_ERR_PrintS32(result);

            goto fail_ck;
        }
    }

    result = cpufreq_table_validate_and_show(policy, freq_table);
    if (result)
    {
        goto fail_table;
    }

    policy->min = policy->cpuinfo.min_freq;
    policy->max = policy->cpuinfo.max_freq;
    policy->cur = hi_cpufreq_getspeed(policy->cpu);

    for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++)
    {
        max_freq = max(freq_table[i].frequency, max_freq);
    }

    /*
     * On hisilicon SMP configuartion, both processors share the voltage
     * and clock. So both CPUs needs to be scaled together and hence
     * needs software co-ordination. Use cpufreq affected_cpus
     * interface to handle this scenario.
     */

#ifdef CONFIG_SMP
    policy->shared_type = CPUFREQ_SHARED_TYPE_ANY;
    cpumask_setall(policy->cpus);
#endif

    policy->cpuinfo.transition_latency = 300 * 1000;

#ifndef HI_ADVCA_FUNCTION_RELEASE
 #ifndef MODULE
    result = input_register_handler(&cpufreq_interactive_input_handler);
    if (result)
    {
        goto fail_ck;
    }
 #endif
#endif

    PM_FUNC_EXIT();
    return 0;

fail_table:
    freq_table_free();
fail_ck:
    return result;
}

static int hi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
{
    PM_FUNC_ENTER();

    freq_table_free();

    PM_FUNC_EXIT();
    return 0;
}

static int hi_cpufreq_resume(struct cpufreq_policy *policy)
{
    PM_FUNC_ENTER();
    PM_FUNC_EXIT();
    return 0;
}

static int hi_cpufreq_resume_noirq(struct device *dev)
{
    PM_FUNC_ENTER();
    PM_FUNC_EXIT();
    return 0;
}

static int hi_cpufreq_suspend_noirq(struct device *dev)
{
    PM_FUNC_ENTER();
    PM_FUNC_EXIT();
    return 0;
}

static struct freq_attr *hi_cpufreq_attr[] =
{
    &cpufreq_freq_attr_scaling_available_freqs,
    NULL,
};

static struct cpufreq_driver hi_cpufreq_driver =
{
    .verify = hi_cpufreq_verify,
    .target = hi_cpufreq_target,
    .get    = hi_cpufreq_getspeed,
    .init   = hi_cpufreq_cpu_init,
    .exit   = hi_cpufreq_cpu_exit,
    .resume = hi_cpufreq_resume,
    .name   = "hi-cpufreq",
    .attr   = hi_cpufreq_attr,
};

static struct dev_pm_ops hi_cpufreq_driver_pm_ops =
{
    .suspend_noirq = hi_cpufreq_suspend_noirq,
    .resume_noirq  = hi_cpufreq_resume_noirq,
};

static struct platform_driver hi_cpufreq_platform_driver =
{
    .driver.name = "hi_cpufreq",
    .driver.pm   = &hi_cpufreq_driver_pm_ops,
};

static void cf_platform_device_release(struct device* dev){}

static struct platform_device hi_cpufreq_device =
{
    .name              = "mpu_pm_dev",
    .dev               = {
        .platform_data = NULL,
        .release       = cf_platform_device_release,
    },
};

int  hi_cpufreq_init(void)
{
    int ret;

    PM_FUNC_ENTER();

    hi_opp_init();
    ret = cpufreq_register_driver(&hi_cpufreq_driver);
    if (!ret)
    {
        int t;

        t = platform_device_register(&hi_cpufreq_device);
        if (t)
        {
            PM_PrintErrorFunc(platform_device_register, HI_FAILURE);
        }

        t = platform_driver_register(&hi_cpufreq_platform_driver);
        if (t)
        {
            PM_PrintErrorFunc(platform_device_register, HI_FAILURE);
        }
    }

    PM_FUNC_EXIT();
    return ret;
}

void hi_cpufreq_exit(void)
{
    PM_FUNC_ENTER();

    platform_driver_unregister(&hi_cpufreq_platform_driver);
    platform_device_unregister(&hi_cpufreq_device);
    cpufreq_unregister_driver(&hi_cpufreq_driver);

    hi_opp_deinit();

    PM_FUNC_EXIT();
    return;
}

//MODULE_DESCRIPTION("cpufreq driver for hisilicon SOCs");
MODULE_LICENSE("GPL");
#if 0
 #ifndef MODULE
late_initcall(hi_cpufreq_init);
module_exit(hi_cpufreq_exit);
 #endif
#endif
