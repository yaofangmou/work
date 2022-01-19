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

#ifndef __DRV_TEE_SCI_CLIENT_H
#define __DRV_TEE_SCI_CLIENT_H
#include "hi_unf_sci.h"

#ifdef CONFIG_TZDRIVER

/*
 * hisi_teesci_init -- init sci CA to TA
 * Parameter: null
 * Return: null
 */
int hisi_teesci_init(void);


/*
 * hisi_teesci_exit -- exit sci CA from TA and destroy CA
 * Parameter: null
 * Return: null
 */
void hisi_teesci_exit(void);

/*
 * hisi_secsci_agent_end ---- close agent of sci
 * parameter:null
 * return:
 *  0, success
 *  -1, failed.
 */
int hisi_secsci_agent_end(void);

/*
 * hisi_secsci_client_init ---- init of sci_tee
 * parameter:sci port
 * return:
 *  0, success
 *  -1, failed.
 */
int hisi_secsci_client_init(void);

/*
 * hisi_secsci_client_open ---- open of sci_tee
 * parameter:sci port
 * return:
 *  0, success
 *  -1, failed.
 */
int hisi_secsci_client_open(HI_UNF_SCI_PORT_E enSciPort,HI_UNF_SCI_PROTOCOL_E enSciProtocol,HI_U32 u32Frequency);

/*
 * hisi_secsci_client_close ---- close of sci_tee
 * parameter:sci port
 * return:
 *	0, success
 *	-1, failed.
 */
int hisi_secsci_client_close(HI_UNF_SCI_PORT_E enSciPort);

#else

static inline int hisi_teesci_init(void)
{
    return 0;
}

static inline void hisi_teesci_exit(void)
{
}

static inline int hisi_secsci_agent_end(void)
{
    return 0;
}

static inline int hisi_secsci_client_init(void)
{
    return 0;
}

static inline int hisi_secsci_client_open(HI_UNF_SCI_PORT_E enSciPort,HI_UNF_SCI_PROTOCOL_E enSciProtocol,HI_U32 u32Frequency)
{
    return 0;
}

static inline int hisi_secsci_client_close(HI_UNF_SCI_PORT_E enSciPort)
{
    return 0;
}
#endif

#endif


