/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_mailbox_intf.c
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include <linux/kthread.h>
#include <linux/vmalloc.h>
#include <linux/slab.h>

#include <linux/semaphore.h>
#include <linux/compat.h>
#include <linux/mutex.h>
#include <asm/uaccess.h>

#include "hi_common.h"
#include "hi_osal.h"
#include "hi_drv_module.h"
#include "hi_drv_mem.h"
#include "hi_drv_dev.h"
#include "hi_drv_proc.h"
#include "hi_drv_mailbox.h"

#include "drv_mailbox_ext.h"
#include "drv_mailbox.h"
#include "drv_mailbox_ioctl.h"
#include "drv_mailbox_debug.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

typedef struct
{
    HI_S32 pid;
    HI_S32 tid;
    struct mutex lock;
} TRANSACTION_S;


static TRANSACTION_S s_transaction;

static UMAP_DEVICE_S s_mailbox_dev;

MAILBOX_EXPORT_FUNC_S s_MailboxExportFuncs =
{
    .pfnMailbox_Open          = HI_DRV_MAILBOX_Open,
    .pfnMailbox_Close         = HI_DRV_MAILBOX_Close,
    .pfnMailbox_SendMessage   = HI_DRV_MAILBOX_SendMessage,
};

static HI_S32 MAILBOX_Open(struct inode* inode, struct file* filp)
{
    MAILBOX_FUNC_ENTER();

    MAILBOX_FUNC_EXIT();
    return HI_SUCCESS;
}

static HI_S32 MAILBOX_Release(struct inode* inode, struct file* filp)
{
    MAILBOX_FUNC_ENTER();

    if (s_transaction.pid == task_tgid_nr(current))
    {
        BUG_ON(!mutex_is_locked(&s_transaction.lock));

        s_transaction.pid = -1;
        s_transaction.tid = -1;
        mutex_unlock(&s_transaction.lock);
    }

    MAILBOX_FUNC_EXIT();

    return HI_SUCCESS;
}

static HI_S32 MAILBOX_Resume(PM_BASEDEV_S* pdev)
{
    MAILBOX_FUNC_ENTER();

    MAILBOX_FUNC_EXIT();

    return HI_SUCCESS;
}

static HI_S32 MAILBOX_Suspend(PM_BASEDEV_S* pdev, pm_message_t state)
{
    MAILBOX_FUNC_ENTER();

    MAILBOX_FUNC_EXIT();

    return HI_SUCCESS;
}

static HI_S32 process_send(HI_VOID *arg)
{
    HI_S32 ret = HI_FAILURE;
    DRV_MAILBOX_CMD_SEND_S *p = (DRV_MAILBOX_CMD_SEND_S *) arg;
    HI_U32 output_len;
    HI_U8 *input_buffer;
    HI_U8 *output_buffer;
    DRV_MAILBOX_BUFFER_S buffer_info;

    MAILBOX_FUNC_ENTER();

    MAILBOX_CHECK_POINTER(p->message);
    MAILBOX_CHECK_POINTER(p->output);
    MAILBOX_CHECK_POINTER(p->output_len);
    MAILBOX_CHECK_PARAM(((p->message_len > 0) && (p->message_len <= DRV_MAILBOX_MAX_MESSAGE_LEN)));

    get_user(output_len, p->output_len);
    MAILBOX_CHECK_PARAM(((output_len > 0) && (output_len <= DRV_MAILBOX_MAX_MESSAGE_LEN)));

    input_buffer = (HI_U8 *) HI_KMALLOC(HI_ID_MAILBOX, p->message_len, GFP_KERNEL);
    if (HI_NULL == input_buffer)
    {
        MAILBOX_PrintErrorCode(HI_ERR_MAILBOX_NO_MEMORY);
        return HI_ERR_MAILBOX_NO_MEMORY;
    }

    output_buffer = (HI_U8 *) HI_KMALLOC(HI_ID_MAILBOX, output_len ,GFP_KERNEL);
    if (HI_NULL == output_buffer)
    {
        HI_KFREE(HI_ID_MAILBOX, input_buffer);
        MAILBOX_PrintErrorCode(HI_ERR_MAILBOX_NO_MEMORY);
        return HI_ERR_MAILBOX_NO_MEMORY;
    }

    memset(input_buffer, 0x0, p->message_len);
    if (copy_from_user(input_buffer, p->message, p->message_len))
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        HI_KFREE (HI_ID_MAILBOX, output_buffer);

        MAILBOX_PrintErrorFunc(copy_from_user, HI_FAILURE);
        return HI_FAILURE;
    }

    buffer_info.pMessage = input_buffer;
    buffer_info.u32MessageLen = p->message_len;
    buffer_info.pOutBuffer = output_buffer;
    buffer_info.pu32OutBufferLen = &output_len;

    ret = DRV_MAILBOX_SendMessage(p->handle, p->receiver, &buffer_info, p->flag, p->param);
    if (HI_SUCCESS != ret)
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        HI_KFREE (HI_ID_MAILBOX, output_buffer);

        MAILBOX_PrintErrorFunc(DRV_MAILBOX_SendMessage, ret);
        return ret;
    }

    put_user(output_len, p->output_len);
    if (copy_to_user(p->output, output_buffer, output_len))
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        HI_KFREE (HI_ID_MAILBOX, output_buffer);

        MAILBOX_PrintErrorFunc(copy_to_user, HI_FAILURE);
        return HI_FAILURE;
    }

    HI_KFREE (HI_ID_MAILBOX, input_buffer);
    HI_KFREE (HI_ID_MAILBOX, output_buffer);

    MAILBOX_FUNC_EXIT();
    return HI_SUCCESS;
}

static HI_S32 MAILBOX_Ioctl(struct inode *inode, struct file *file, unsigned int cmd, HI_VOID *arg)
{
    HI_S32 ret = HI_FAILURE;

    MAILBOX_FUNC_ENTER();

    switch (cmd)
    {
        case CMD_MAILBOX_OPEN:
        {
            DRV_MAILBOX_CMD_OPEN_S *p = (DRV_MAILBOX_CMD_OPEN_S *) arg;

            ret = DRV_MAILBOX_Open(&(p->handle), p->id);
            if (HI_SUCCESS != ret)
            {
                MAILBOX_PrintErrorFunc(DRV_MAILBOX_Open, ret);
                return ret;
            }

            break;
        }
        case CMD_MAILBOX_CLOSE:
        {
            DRV_MAILBOX_CMD_CLOSE_S *p = (DRV_MAILBOX_CMD_CLOSE_S *) arg;

            ret = DRV_MAILBOX_Close(p->handle);
            if (HI_SUCCESS != ret)
            {
                MAILBOX_PrintErrorFunc(DRV_MAILBOX_Close, ret);
                return ret;
            }

            break;
        }
        case CMD_MAILBOX_SEND:
        {
            ret = process_send(arg);
            if (HI_SUCCESS != ret)
            {
                MAILBOX_PrintErrorFunc(process_send, ret);
                return ret;
            }

            break;
        }
        case CMD_MAILBOX_BEGINTRANSACTION:
        {
            if (mutex_lock_interruptible(&s_transaction.lock))
            {
                MAILBOX_PrintErrorFunc(mutex_lock_interruptible, HI_FAILURE);
                return HI_FAILURE;
            }
            s_transaction.pid = task_tgid_nr(current);
            s_transaction.tid = task_pid_nr(current);

            break;
        }
        case CMD_MAILBOX_ENDTRANSACTION:
        {
            if (s_transaction.pid == task_tgid_nr(current))
            {
                if (s_transaction.tid != task_pid_nr(current))
                {
                    HI_WARN_MAILBOX("start and end not in the same thread\n");
                }

                s_transaction.pid = -1;
                s_transaction.tid = -1;
                mutex_unlock(&s_transaction.lock);
            }
            else
            {
                MAILBOX_PrintErrorCode(HI_FAILURE);
                return HI_FAILURE;
            }

            break;
        }
        default:
            MAILBOX_PrintErrorCode(HI_ERR_MAILBOX_UNKNOWN_CMD);
            return HI_ERR_MAILBOX_UNKNOWN_CMD;
    }

    MAILBOX_FUNC_EXIT();
    return HI_SUCCESS;
}

static long DRV_MAILBOX_Ioctl(struct file* ffile, unsigned int cmd, unsigned long arg)
{
    return (long)HI_DRV_UserCopy(ffile->f_path.dentry->d_inode, ffile, cmd, arg, MAILBOX_Ioctl);
}


#ifdef CONFIG_COMPAT
static HI_S32 process_send_compat(HI_VOID *arg)
{

    HI_S32 ret = HI_FAILURE;
    DRV_MAILBOX_CMD_SEND_COMPAT_S *p = (DRV_MAILBOX_CMD_SEND_COMPAT_S *) arg;
    HI_U32 output_len;
    HI_U8 *input_buffer;
    HI_U8 *output_buffer;
    DRV_MAILBOX_BUFFER_S buffer_info;

    MAILBOX_FUNC_ENTER();

    MAILBOX_CHECK_POINTER(compat_ptr(p->message));
    MAILBOX_CHECK_POINTER(compat_ptr(p->output));
    MAILBOX_CHECK_POINTER(compat_ptr(p->output_len));
    MAILBOX_CHECK_PARAM(((p->message_len > 0) && (p->message_len <= DRV_MAILBOX_MAX_MESSAGE_LEN)));

    get_user(output_len, (HI_U32 *)compat_ptr(p->output_len));
    MAILBOX_CHECK_PARAM(((p->message_len > 0) && (p->message_len <= DRV_MAILBOX_MAX_MESSAGE_LEN)));

    input_buffer = (HI_U8 *) HI_KMALLOC(HI_ID_MAILBOX, p->message_len, GFP_KERNEL);
    if (HI_NULL == input_buffer)
    {
        MAILBOX_PrintErrorCode(HI_ERR_MAILBOX_NO_MEMORY);
        return HI_ERR_MAILBOX_NO_MEMORY;
    }

    output_buffer = (HI_U8 *) HI_KMALLOC(HI_ID_MAILBOX, output_len, GFP_KERNEL);
    if (HI_NULL == output_buffer)
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        MAILBOX_PrintErrorCode(HI_ERR_MAILBOX_NO_MEMORY);
        return HI_ERR_MAILBOX_NO_MEMORY;
    }

    memset(input_buffer, 0x0, p->message_len);
    if (copy_from_user(input_buffer, compat_ptr(p->message), p->message_len))
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        HI_KFREE (HI_ID_MAILBOX, output_buffer);
        MAILBOX_PrintErrorFunc(copy_from_user, HI_FAILURE);
        return HI_FAILURE;
    }

    buffer_info.pMessage = input_buffer;
    buffer_info.u32MessageLen = p->message_len;
    buffer_info.pOutBuffer = output_buffer;
    buffer_info.pu32OutBufferLen = &output_len;

    ret = DRV_MAILBOX_SendMessage(p->handle, p->receiver, &buffer_info, p->flag, p->param);
    if (HI_SUCCESS != ret)
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        HI_KFREE (HI_ID_MAILBOX, output_buffer);
        MAILBOX_PrintErrorFunc(DRV_MAILBOX_SendMessage, ret);
        return HI_FAILURE;
    }

    put_user(output_len, (HI_U32 *)compat_ptr(p->output_len));
    if (copy_to_user(compat_ptr(p->output), output_buffer, output_len))
    {
        HI_KFREE (HI_ID_MAILBOX, input_buffer);
        HI_KFREE (HI_ID_MAILBOX, output_buffer);
        MAILBOX_PrintErrorFunc(copy_to_user, HI_FAILURE);
        return HI_FAILURE;
    }

    HI_KFREE (HI_ID_MAILBOX, input_buffer);
    HI_KFREE (HI_ID_MAILBOX, output_buffer);

    MAILBOX_FUNC_EXIT();
    return HI_SUCCESS;
}

static HI_S32 MAILBOX_Compat_Ioctl(struct inode *inode, struct file *file, unsigned int cmd, HI_VOID *arg)
{
    HI_S32 ret = HI_FAILURE;

    MAILBOX_FUNC_ENTER();

    switch (cmd)
    {
        case CMD_MAILBOX_OPEN:
        {
            DRV_MAILBOX_CMD_OPEN_S *p = (DRV_MAILBOX_CMD_OPEN_S *) arg;

            ret = DRV_MAILBOX_Open(&(p->handle), p->id);
            if (HI_SUCCESS != ret)
            {
                MAILBOX_PrintErrorFunc(DRV_MAILBOX_Open, ret);
                return ret;
            }

            break;
        }
        case CMD_MAILBOX_CLOSE:
        {
            DRV_MAILBOX_CMD_CLOSE_S *p = (DRV_MAILBOX_CMD_CLOSE_S *) arg;

            ret = DRV_MAILBOX_Close(p->handle);
            if (HI_SUCCESS != ret)
            {
                MAILBOX_PrintErrorFunc(DRV_MAILBOX_Close, ret);
                return ret;
            }

            break;
        }
        case CMD_MAILBOX_COMPAT_SEND:
        {
            ret = process_send_compat(arg);
            if (HI_SUCCESS != ret)
            {
                MAILBOX_PrintErrorFunc(process_send_compat, ret);
                return ret;
            }

            break;
        }
        case CMD_MAILBOX_BEGINTRANSACTION:
        {
            if (mutex_lock_interruptible(&s_transaction.lock))
            {
                MAILBOX_PrintErrorFunc(mutex_lock_interruptible, HI_FAILURE);
                return HI_FAILURE;
            }
            s_transaction.pid = task_tgid_nr(current);
            s_transaction.tid = task_pid_nr(current);

            break;
        }
        case CMD_MAILBOX_ENDTRANSACTION:
        {
            if (s_transaction.pid == task_tgid_nr(current))
            {
                if (s_transaction.tid != task_pid_nr(current))
                {
                    HI_WARN_MAILBOX("start and end not in the same thread\n");
                }

                s_transaction.pid = -1;
                s_transaction.tid = -1;
                mutex_unlock(&s_transaction.lock);
            }
            else
            {
                MAILBOX_PrintErrorCode(HI_FAILURE);
                return HI_FAILURE;
            }

            break;
        }
        default:
            MAILBOX_PrintErrorCode(HI_ERR_MAILBOX_UNKNOWN_CMD);
            return HI_ERR_MAILBOX_UNKNOWN_CMD;
    }

    MAILBOX_FUNC_EXIT();
    return HI_SUCCESS;
}

static long DRV_MAILBOX_COMPAT_Ioctl(struct file* ffile, unsigned int cmd, unsigned long arg)
{
    return (long)HI_DRV_UserCopy(ffile->f_path.dentry->d_inode, ffile, cmd, arg, MAILBOX_Compat_Ioctl);
}
#endif

static struct file_operations mailbox_fpops =
{
    .owner = THIS_MODULE,
    .open = MAILBOX_Open,
    .unlocked_ioctl = DRV_MAILBOX_Ioctl,
#ifdef CONFIG_COMPAT
    .compat_ioctl = DRV_MAILBOX_COMPAT_Ioctl,
#endif
    .release = MAILBOX_Release,
};

static PM_BASEOPS_S mailbox_drvops =
{
    .probe        = NULL,
    .remove       = NULL,
    .shutdown     = NULL,
    .prepare      = NULL,
    .complete     = NULL,
    .suspend      = MAILBOX_Suspend,
    .suspend_late = NULL,
    .resume_early = NULL,
    .resume       = MAILBOX_Resume,
};


HI_S32 MAILBOX_ModInit(HI_VOID)
{
    HI_S32 ret = HI_FAILURE;

    HI_OSAL_Snprintf(s_mailbox_dev.devfs_name, sizeof(s_mailbox_dev.devfs_name), UMAP_DEVNAME_MAILBOX);
    s_mailbox_dev.minor  = UMAP_MIN_MINOR_MAILBOX;
    s_mailbox_dev.owner  = THIS_MODULE;
    s_mailbox_dev.fops   = &mailbox_fpops;
    s_mailbox_dev.drvops = &mailbox_drvops;

    ret = HI_DRV_DEV_Register(&s_mailbox_dev);
    if (ret < 0)
    {
        MAILBOX_PrintErrorFunc(HI_DRV_DEV_Register, ret);
        return ret;
    }

    ret = HI_DRV_MODULE_Register(HI_ID_MAILBOX, "HI_MAILBOX", (HI_VOID*)&s_MailboxExportFuncs);
    if (HI_SUCCESS != ret)
    {
        MAILBOX_PrintErrorFunc(HI_DRV_MODULE_Register, ret);
        return ret;
    }

    ret = DRV_MAILBOX_Init();
    if (HI_SUCCESS != ret)
    {
        MAILBOX_PrintErrorFunc(DRV_MAILBOX_Init, ret);
        return ret;
    }

    mutex_init(&s_transaction.lock);
    s_transaction.pid = -1;
    s_transaction.tid = -1;

#ifdef MODULE
    HI_PRINT("Load hi_mailbox.ko success.\t(%s)\n", VERSION_STRING);
#endif
    return HI_SUCCESS;
}


HI_VOID MAILBOX_ModExit(HI_VOID)
{
    DRV_MAILBOX_DeInit();
    HI_DRV_DEV_UnRegister(&s_mailbox_dev);
    HI_DRV_MODULE_UnRegister(HI_ID_MAILBOX);
    return;
}

#ifdef MODULE
module_init(MAILBOX_ModInit);
module_exit(MAILBOX_ModExit);
#endif

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("HISILICON");
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
