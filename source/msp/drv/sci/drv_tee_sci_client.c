/******************************************************************************
   Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 * @File Name            :   drv_tee_sci_client.c
 * @Author               :   Kylin
 * @Date                 :   2017-04-20 20:55:12
 * @Last Modified by     :   Kylin
 * @Last Modified time   :   2017-05-27 08:57:01
 * @Email                :   kylin.zhuang@hisilicon.com
 * @Description          :   drv_tee_sci_client
 ******************************************************************************/

#include <linux/slab.h>
#include <linux/dma-mapping.h>
#include <linux/semaphore.h>
#include <linux/semaphore.h>
#include <asm/cacheflush.h>
#include <linux/list.h>

#include <drv_tee_sci_client.h>

#include "teek_client_api.h"
#include "hi_unf_sci.h"
/* for tee  */
static TEEC_Context context;
static TEEC_Session session;
typedef enum
{
    HI_SECSCIAGENT_CLOSED,
    HI_SECSCICLIENT_INIT,
    HI_SECSCICLIENT_OPEN,
    HI_SECSCICLIENT_CLOSE,
} SCICOMMANDID;

typedef enum
{
    SECSCIAGENT_CLOSED,
    SECSCICLIENT_INIT,
    SECSCICLIENT_OPEN,
    SECSCICLIENT_CLOSE,
} SCIOPERATION;

static const TEEC_UUID sci_uuid =
{
    /* TEEC_UUIC needed   */
    0x068A89F2,0x9b64,0x474e,
    {0xb9, 0x46, 0x85, 0x85, 0x16, 0x37, 0x7e, 0xa6}
};

static int init_done;
int hisi_teesciinit(void)
{
    TEEC_Result result;
    unsigned int origin;
    TEEC_Operation operation;
    u8 package_name[] = "hisi_teesci";
    u32 root_id = 0;

    /* init context*/
    result = TEEK_InitializeContext(NULL, &context);
    if(result != TEEC_SUCCESS)
    {
        TEEC_Error("TEEC_InitializeContext failed, ret=0x%x.\n", result);
        goto cleanup_1;
    }


    memset(&operation, 0x0, sizeof(TEEC_Operation));

    operation.started = 1;
    operation.cancel_flag = 0;
    operation.paramTypes = TEEC_PARAM_TYPES(
            TEEC_NONE,
            TEEC_NONE,
            TEEC_MEMREF_TEMP_INPUT,
            TEEC_MEMREF_TEMP_INPUT);
    operation.params[2].tmpref.buffer = (void *)(&root_id);
    operation.params[2].tmpref.size = sizeof(root_id);
    operation.params[3].tmpref.buffer = (void *)(package_name);
    operation.params[3].tmpref.size = strlen(package_name) + 1;
    /* open session */
    result = TEEK_OpenSession(&context, &session, &sci_uuid,
                TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if(result != TEEC_SUCCESS)
    {
        TEEC_Error("TEEC_OpenSession failed, ReturnCode=0x%x, \
                ReturnOrigin=0x%x\n", result, origin);
        goto cleanup_2;
    }
    TEEC_Debug("TEEC sec sciinitialized.\n");
    init_done++;

    return 0;

    cleanup_2:
    TEEK_FinalizeContext(&context);
    cleanup_1:
    return -1;
}

void hisi_teesciexit(void)
{
    TEEK_CloseSession(&session);
    TEEK_FinalizeContext(&context);
    init_done = 0;

    TEEC_Debug("TEEC sec sci removed.\n");
}

static int hisi_sec_sci_handle(int chioce)
{
    TEEC_Result result;
    TEEC_Operation operation;
    unsigned int origin;
    int ret;
    int init = 0;

    if (!init_done)
    {
        ret = hisi_teesciinit();
        if (ret)
        {
            TEEC_Error("TEEC sec sciinit failed!\n");
            goto out;
        }
        init = 1;
    }

    memset(&operation, 0x00, sizeof(operation));
    operation.started = 1;

    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE,
                                            TEEC_NONE,
                                            TEEC_NONE,
                                            TEEC_NONE);

    switch (chioce)
    {
        case SECSCIAGENT_CLOSED:
        {
            result = TEEK_InvokeCommand(&session, HI_SECSCIAGENT_CLOSED,
                            &operation, &origin);
            break;
        }
        case SECSCICLIENT_INIT:
        {
            result = TEEK_InvokeCommand(&session, HI_SECSCICLIENT_INIT,
                            &operation, &origin);
            break;
        }
        default:
        {
            TEEC_Error("%s :cmd err!\n", __func__);
            ret = -1;
            goto exit;
        }
    }

    if(result != TEEC_SUCCESS)
    {
        TEEC_Error("InvokeCommand failed, ReturnCode=0x%x, \
                    ReturnOrigin=0x%x\n", result, origin);
        ret = result;
        goto exit;
    }
    else
    {
        TEEC_Debug("InvokeCommand success\n");
        ret = 0;
    }

    exit:
    if (init)
        hisi_teesciexit();
    out:
    return ret;
}

static int hisi_sec_sci_handle_client_open(HI_UNF_SCI_PORT_E enSciPort,HI_UNF_SCI_PROTOCOL_E enSciProtocol,HI_U32 u32Frequency)
{
    TEEC_Result result;
    TEEC_Operation operation;
    unsigned int origin;
    int ret;
    int init = 0;

    if (!init_done)
    {
        ret = hisi_teesciinit();
        if (ret)
        {
            TEEC_Error("TEEC sec sciinit failed!\n");
            goto out;
        }
        init = 1;
    }

    memset(&operation, 0x00, sizeof(operation));
    operation.started = 1;

    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INPUT, TEEC_VALUE_INPUT,
                            TEEC_NONE, TEEC_NONE);
    operation.params[0].value.a = enSciPort;
    operation.params[0].value.b = enSciProtocol;
    operation.params[1].value.a = u32Frequency;
    result = TEEK_InvokeCommand(&session, HI_SECSCICLIENT_OPEN,
                            &operation, &origin);
    if(result != TEEC_SUCCESS)
    {
        TEEC_Error("InvokeCommand failed, ReturnCode=0x%x, \
                    ReturnOrigin=0x%x\n", result, origin);
        ret = result;
        goto exit;
    }
    else
    {
        TEEC_Debug("InvokeCommand success\n");
        ret = 0;
    }

    exit:
    if (init)
        hisi_teesciexit();
    out:
    return ret;
}

static int hisi_sec_sci_handle_client_close(HI_UNF_SCI_PORT_E enSciPort)
{
    TEEC_Result result;
    TEEC_Operation operation;
    unsigned int origin;
    int ret;
    int init = 0;

    if (!init_done)
    {
        ret = hisi_teesciinit();
        if (ret)
        {
            TEEC_Error("TEEC sec sciinit failed!\n");
            goto out;
        }
        init = 1;
    }

    memset(&operation, 0x00, sizeof(operation));
    operation.started = 1;

    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INPUT, TEEC_NONE,
                            TEEC_NONE, TEEC_NONE);
    operation.params[0].value.a = enSciPort;
    result = TEEK_InvokeCommand(&session, HI_SECSCICLIENT_CLOSE,
                            &operation, &origin);
    if(result != TEEC_SUCCESS)
    {
        TEEC_Error("InvokeCommand failed, ReturnCode=0x%x, \
                    ReturnOrigin=0x%x\n", result, origin);
        ret = result;
        goto exit;
    }
    else
    {
        TEEC_Debug("InvokeCommand success\n");
        ret = 0;
    }

    exit:
    if (init)
        hisi_teesciexit();
    out:
    return ret;
}

int hisi_secsci_agent_end(void)
{
    int ret = 0;

    ret = hisi_sec_sci_handle(SECSCIAGENT_CLOSED);
    if (ret)
    {
        TEEC_Error("%s failed!\n", __func__);
        return -1;
    }

    return 0;
}

int hisi_secsci_client_init(void)//int sel_port replace with HI_UNF_SCI_PORT_E sel_port
{
    int ret = 0;

    ret = hisi_sec_sci_handle(SECSCICLIENT_INIT);
    if (ret)
    {
        TEEC_Error("%s failed!\n", __func__);
        return -1;
    }

    return 0;
}

int hisi_secsci_client_open(HI_UNF_SCI_PORT_E enSciPort,HI_UNF_SCI_PROTOCOL_E enSciProtocol,HI_U32 u32Frequency)
{
    int ret = 0;

    ret = hisi_sec_sci_handle_client_open(enSciPort,enSciProtocol,u32Frequency);
    if (ret)
    {
        TEEC_Error("%s failed!\n", __func__);
        return -1;
    }

    return 0;
}

int hisi_secsci_client_close(HI_UNF_SCI_PORT_E enSciPort)//int sel_port replace with HI_UNF_SCI_PORT_E sel_port
{
    int ret = 0;

    ret = hisi_sec_sci_handle_client_close(enSciPort);
    if (ret)
    {
        TEEC_Error("%s failed!\n", __func__);
        return -1;
    }

    return 0;
}

EXPORT_SYMBOL(hisi_secsci_agent_end);
EXPORT_SYMBOL(hisi_secsci_client_init);
EXPORT_SYMBOL(hisi_secsci_client_open);
EXPORT_SYMBOL(hisi_secsci_client_close);
