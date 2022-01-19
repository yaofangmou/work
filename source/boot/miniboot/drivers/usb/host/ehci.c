/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Create By liuhui 2018.09.25
 *
******************************************************************************/
#include <compile.h>
#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <malloc.h>
#include <string.h>
#include <delay.h>

#include "usbcore.h"
#include "ehci.h"

#if defined(CONFIG_ARCH_HI3716MV410)
#  include "hiusb-hi3716mv410.c"
#endif

#if defined(CONFIG_ARCH_HI3716MV420N)
#  include "hiusb-hi3716mv420n.c"
#endif

#if defined(CONFIG_ARCH_HI3796MV2X)
#  include "hiusb-hi3796mv2x.c"
#endif

#if defined(CONFIG_ARCH_HI3798CV2X)
#  include "hiusb-hi3798cv2x.c"
#endif

#if defined(CONFIG_ARCH_HI3798MV2X)
#  include "hiusb-hi3798mv2x.c"
#endif

#if defined(CONFIG_ARCH_HI3798MV310)
#  include "hiusb-hi3798mv310.c"
#endif

#if defined(CONFIG_ARCH_HI3798MX)
#  include "hiusb-hi3798mx.c"
#endif

#if defined(CONFIG_ARCH_HI3716MV430)
#  include "hiusb-hi3716mv430.c"
#endif

#ifdef CONFIG_ARCH_HI3716MV310
#  include "hiusb_hi3716mv310.c"
#endif

static char __qh_list[roundup(sizeof(struct QH), 32)] __attribute__((aligned(32)));
static struct QH*qh_list = (struct QH *)__qh_list ;	

static struct ehci_host ehcihost;

static struct roothub_dev  root_hub = {
		{0x8, 0x29, 2, 0, 10 },
		{0x12, 1, 0x0200, 9, 0, 1, 64, 0, 0, 0x0100, 1, 2, 0, 1},
		{0x9, 2, 0x19, 1, 1, 0, 0x40, 0},
		{0x9,4,0,0,1,9,0,0,0	},
		{0x7,5,0x81,3,	8,255},
};

#define hccr_readl(addr)   readl((host->base_hccr) + (addr))
#define hccr_writel(val,addr)   writel((val), (host->base_hccr + (addr)))
#define hcor_readl(addr)   readl(host->base_hcor + (addr))
#define hcor_writel(val, addr)   writel((val), (host->base_hcor + (addr)))
/******************************************************************************/

static int hiusb_ehci_reset(struct ehci_host * host)
{
	u32 cmd;
	int32 usec = 500*1000;
	int ret = 0;

	cmd = hcor_readl(REG_EHCI_USBCMD);
	cmd &= ~USBCMD_RUN;
	cmd |= USBCMD_RESET;
	hcor_writel(cmd, REG_EHCI_USBCMD);

	/* wait for reset bit 0 */
	while (usec-- > 0) {
		udelay(5);
		cmd = hcor_readl(REG_EHCI_USBCMD);
		cmd &= USBCMD_RESET;
		if (cmd == 0)
			break;
	}

	if (usec <= 0)
		ret = -1;

	return ret;
}
/******************************************************************************/

static int hiusb_ehci_enable_async(struct ehci_host * host, int enable)
{
	u32 cmd;
	int32 usec = 20*1000;
	int ret = 0;

	cmd = hcor_readl(REG_EHCI_USBCMD);
	if (enable)
		cmd |= USBCMD_ASE;
	else
		cmd &= ~USBCMD_ASE;
	hcor_writel(cmd, REG_EHCI_USBCMD);

	do {
		udelay(5);
		cmd =  hcor_readl(REG_EHCI_USBSTS);
		cmd &= USBSTS_ASS;
		if (enable) {
			if (cmd == USBSTS_ASS)
				break;
		} else {
			if (cmd == 0)
				break;
		}
		usec--;
	} while (usec > 0);

	if (usec <= 0)
		ret = -1;

	return ret;
}
/******************************************************************************/

static int hiusb_fill_tdbuf(struct qTD *td, void *buf, size_t sz)
{
#define ALIGNE	0x1000
	uint32 delta, next;
	uint32 addr = (uint32_t)buf;
	int idx = 0;

	td->qt_buffer[0] = addr;
	td->qt_buffer_hi[0] = 0;
	next = (addr + ALIGNE) & ~(ALIGNE - 1);
	delta = next - addr;
	if (sz <= delta)
		return 0;
	sz -= delta;
	addr = next;

	for (idx = 1;idx < 5; idx++) {
		td->qt_buffer[idx] = addr;
		td->qt_buffer_hi[idx] = 0;
		if (sz <= ALIGNE)
			break;
		sz -= ALIGNE;
		addr += ALIGNE;
	}

	if (idx == 5) {
		return -1;
	}

	return 0;
}
/******************************************************************************/

static void hiusb_fill_qh(struct usbdevice *dev, unsigned long pipe, struct QH* qh)
{
	int maxpacket;

	memset(qh, 0, sizeof(struct QH));

	qh->qh_link = (uint32)qh_list | QH_LINK_TYPE_QH;
	
	if (pipe & DIR_IN)
		maxpacket = dev->epin_maxpkt[((pipe>>15) & 0xf)];
	else
		maxpacket = dev->epout_maxpkt[((pipe>>15) & 0xf)];
	
	qh->qh_endpt1 = (8 << 28) |(maxpacket << 16) |
	    (0 << 15) |(1 << 14) |(usb_pipespeed(pipe) << 12) |
	    (usb_pipeendpoint(pipe) << 8) | (0 << 7) | (usb_pipedevice(pipe) << 0);

	if ((usb_pipespeed(pipe) != SPEED_HIGH) 
	    && (usb_pipeendpoint(pipe) == 0))
		qh->qh_endpt1 |= 1 << 27;

	qh->qh_endpt2 = (1 << 30) | (dev->portnr << 23) |
			(dev->parent->devnum << 16) | (0 << 8) | (0 << 0);
	qh->qh_overlay.qt_next = QT_NEXT_TERMINATE;
}
/******************************************************************************/

int
hiusb_ehci_submit_async(struct usbdevice *dev, unsigned long pipe, void *buffer,
		   int length, struct device_request *req)
{
	static char __qh[roundup(sizeof(struct QH), 32)] __attribute__((aligned(32)));
	static struct QH*qh = (struct QH *)__qh;

	static char __qtd[roundup(3*sizeof(struct qTD), 32)] __attribute__((aligned(32)));
	static struct qTD*qtd = (struct qTD *)__qtd;

	int qtd_counter = 0;
	struct ehci_host *host = dev->host;
	volatile struct qTD *vtd;
	uint32 *tdp;
	uint32 token, usbsts;
	uint32 toggle;
	int timeout;
	int ret = 0;

	memset(qtd, 0, 3 * sizeof(*qtd));

	toggle = usb_get_tog(dev, usb_pipeendpoint(pipe), usb_pipeout(pipe));
	hiusb_fill_qh(dev, pipe, qh);

	tdp = &qh->qh_overlay.qt_next;

	if (!req)
		goto setup_request_qTD1;

	qtd[qtd_counter].qt_next = QT_NEXT_TERMINATE;
	qtd[qtd_counter].qt_altnext = QT_NEXT_TERMINATE;
	token = (0 << 31) | (sizeof(*req) << 16) | (0 << 15) 
		| (2 << 8) | (0 << 12) | (3 << 10) | (0x80 << 0);
	qtd[qtd_counter].qt_token = token;
	if (hiusb_fill_tdbuf(&qtd[qtd_counter], req, sizeof(*req)) != 0) {
		goto fail;
	}

	*tdp = (uint32)&qtd[qtd_counter];
	tdp = &qtd[qtd_counter++].qt_next;
	toggle = 1;

	if (length <= 0)
		goto setup_request_qTD2;

setup_request_qTD1:
	qtd[qtd_counter].qt_next = QT_NEXT_TERMINATE;
	qtd[qtd_counter].qt_altnext = QT_NEXT_TERMINATE;
	token = (toggle << 31) | (0 << 12) | (3 << 10) | (0x80 << 0);

	if (length > 0)
		token |= length << 16;

	if (req == NULL)
		token |= 1 << 15;
	if (usb_pipein(pipe))
		token |= 1 << 8;

	qtd[qtd_counter].qt_token = token;
	if (hiusb_fill_tdbuf(&qtd[qtd_counter], buffer, length) != 0) {
		goto fail;
	}

	*tdp = (uint32)&qtd[qtd_counter];
	tdp = &qtd[qtd_counter++].qt_next;

	if (!req)
		goto setup_request_qTD_done;

setup_request_qTD2:
	qtd[qtd_counter].qt_next = QT_NEXT_TERMINATE;
	qtd[qtd_counter].qt_altnext = QT_NEXT_TERMINATE;
	token = (toggle << 31) | (0 << 16) | (1 << 15) 
		| (0 << 12) | (3 << 10) | (0x80 << 0);
	if (!usb_pipein(pipe))
		token |= 1 << 8;
	
	qtd[qtd_counter].qt_token = token;
	*tdp = (uint32_t)&qtd[qtd_counter];
	tdp = &qtd[qtd_counter++].qt_next;

setup_request_qTD_done:
	qh_list->qh_link = (uint32_t)qh | QH_LINK_TYPE_QH;

	hcor_writel((uint32)qh_list, REG_EHCI_ASYNCLISTADDR);

	usbsts = hcor_readl(REG_EHCI_USBSTS);
	usbsts &= 0x3f;
	hcor_writel(usbsts, REG_EHCI_USBSTS);


	ret = hiusb_ehci_enable_async(host, 1);
	if (ret < 0) {
		goto fail;
	}
	
	vtd = &qtd[qtd_counter - 1];
	timeout = USB_TIMEOUT_MS(pipe);
	do {

		token = vtd->qt_token;
		if (!(token & 0x80))
			break;
		mdelay(1);
	} while (timeout--);

	if (token & 0x80) {
		printf("EHCI timed out on TD - token=%#x\n", token);
	}

	ret = hiusb_ehci_enable_async(host, 0);
	if (ret < 0) {
		goto fail;
	}

	token = qh->qh_overlay.qt_token;
	if (!(token & 0x80)) {
		uint32_t tmp = token & 0xfc;
		if (tmp == 0) {
			toggle = token >> 31;
			usb_set_tog(dev, usb_pipeendpoint(pipe),
				       usb_pipeout(pipe), toggle);
			dev->stat = 0;
		} else if (tmp == 0x40) {
			dev->stat = ST_STALLED;
		} else if (tmp == 0xa0 || tmp == 0x20) {
			dev->stat= ST_BUF_ERR;
		} else if (tmp == 0x50 || tmp == 0x10) {
			dev->stat = ST_BABBLE_DET;
		} else {
			dev->stat = ST_CRC_ERR;
			if ((token & 0x40) == 0x40)
				dev->stat |= ST_STALLED;
		}
		dev->act_len = length - ((token >> 16) & 0x7fff);
	} else {
		dev->act_len = 0;
	}

	if (dev->stat != ST_NOT_PROC)
		return 0;

fail:
	return -1;
}
/******************************************************************************/
int hiusb_ehci_submit_roothub(struct usbdevice *dev, void *buffer,
		 struct device_request *req)
{
	struct ehci_host *host = dev->host;
	u32 tmpval = 0;
	u16 typeReq;
	void *srcptr = NULL;
	int len, srclen;
	u32 reg;
	u32 status_reg;


	status_reg = REG_EHCI_PORTSC + 4*(req->index - 1);
	srclen = 0;
	typeReq = req->request | req->type << 8;

	if ((REQ_GET_DESCRIPTOR | DeviceRequest) == typeReq) {
		if (DT_DEVICE == (req->value >> 8) ) {
			srcptr = &root_hub;
			srclen = 0x12;
		} else if (DT_CONFIG == (req->value >> 8)) {
			srcptr = &root_hub.config;
			srclen = 0x19;
		} else {
			goto error;
		}
	} else if ((REQ_GET_DESCRIPTOR | (RootHubRequest << 8)) == typeReq) {
		if (DT_HUB == (req->value >> 8)) {
			reg = hccr_readl(REG_EHCI_HCSPARAMS);
			root_hub.hub.NbrPorts = HCS_N_PORTS(reg);
			root_hub.hub.HubCharacteristics 	|= (HCS_INDICATOR(reg) ? 0x80 : 0);
			root_hub.hub.HubCharacteristics 
				|= HCS_PPC(reg) ? 0x01 : 0;
			srcptr = &root_hub.hub;
			srclen = 0x8;
		} else 
			goto error;
	} else if((REQ_SET_ADDRESS | (RECIP_DEVICE << 8)) == typeReq) {
		host->root_hub = req->value;
	} else if ((REQ_GET_STATUS | (RootHubRequest << 8)) == typeReq) {
		tmpval = 0x0001;
		srcptr = &tmpval;
		srclen = 2;
	} else if ((REQ_GET_STATUS | (RootHubPortInRequest << 8)) == typeReq) {
		tmpval = 0;
		tmpval |= (STAT_HIGH_SPEED >> 8) << 8;

		reg = hcor_readl(status_reg);

		tmpval |= (reg & EHCI_PS_CS) ? STAT_CONNECTION : 0;
		tmpval |= (reg & EHCI_PS_PE) ? STAT_ENABLE : 0;
		tmpval |= (reg & EHCI_PS_SUSP) ? STAT_SUSPEND : 0;
		tmpval |= (reg & EHCI_PS_OCA) ? STAT_OVERCURRENT : 0;
		tmpval |= (reg & EHCI_PS_PR) ? STAT_RESET : 0;
		tmpval |= (reg & EHCI_PS_PP) ? ((STAT_POWER >> 8) << 8) : 0;
		tmpval |= (reg & EHCI_PS_CSC) ? (STAT_C_CONNECTION << 16) : 0;
		tmpval |= (reg & EHCI_PS_PEC) ? (STAT_C_ENABLE << 16) : 0;
		tmpval |= (reg & EHCI_PS_OCC) ? (STAT_C_OVERCURRENT << 16) : 0;
		tmpval |= (host->port_reset & (1 << req->index)) ? (STAT_C_RESET << 16) : 0;
		srcptr = &tmpval;
		srclen = 4;
	} else if ((REQ_SET_FEATURE | (RootHubPortOutRequest << 8)) == typeReq) {
		tmpval = (uint32_t)req->value;
		reg = hcor_readl(status_reg);
		reg &= ~EHCI_PS_CLEAR;

		if (tmpval == FEAT_ENABLE) {
			reg |= EHCI_PS_PE;
			hcor_writel(reg, status_reg);
		} else if ((tmpval == FEAT_POWER) 
			   && HCS_PPC(hccr_readl(REG_EHCI_HCSPARAMS))) {
			reg |= EHCI_PS_PP;
			hcor_writel(reg, status_reg);
		} else if (tmpval == FEAT_RESET) {
			if (((reg & (EHCI_PS_PE | EHCI_PS_CS)) == EHCI_PS_CS) &&
			    EHCI_PS_IS_LOWSPEED(reg)) {
				reg |= EHCI_PS_PO;
				hcor_writel(reg, status_reg);
			} else {
				int usec = 400;

				reg |= EHCI_PS_PR;
				reg &= ~EHCI_PS_PE;
				hcor_writel(reg, status_reg);
				mdelay(50);
				reg &= ~EHCI_PS_PR;
				hcor_writel(reg, status_reg);

				while (usec-- > 0) {
					udelay(5);
					reg = hcor_readl(status_reg);
					reg &= EHCI_PS_PR;
					if (reg == 0)
						break;
				}

				if (usec > 0)
					host->port_reset |= 1 << req->index;
			}
		} else
			goto error;

		(void) hcor_readl(REG_EHCI_USBCMD);
	} 
	else if ((REQ_CLEAR_FEATURE | (RootHubPortOutRequest << 8)) == typeReq) {
		reg = hcor_readl(status_reg);
		tmpval = (uint32_t)req->value;
		if (tmpval == FEAT_ENABLE)
			reg &= ~EHCI_PS_PE;
		else if (tmpval == FEAT_C_ENABLE)
			reg = (reg & ~EHCI_PS_CLEAR) | EHCI_PS_PE;
		else if ((tmpval == FEAT_POWER) 
			 && HCS_PPC(hccr_readl(REG_EHCI_HCSPARAMS)))
			reg = reg & ~(EHCI_PS_CLEAR | EHCI_PS_PP);
		else if (tmpval == FEAT_C_CONNECTION)
			reg = (reg & ~EHCI_PS_CLEAR) | EHCI_PS_CSC;
		else if (tmpval == FEAT_OVER_CURRENT)
			reg = (reg & ~EHCI_PS_CLEAR) | EHCI_PS_OCC;
		else if (tmpval == FEAT_C_RESET)
			host->port_reset &= ~(1 << req->index);
		else 
			goto error;

		hcor_writel(reg, status_reg);
		(void) hcor_readl(REG_EHCI_USBCMD);
	} else if ((DeviceOutRequest | REQ_SET_CONFIGURATION) == typeReq) {
		/* do nothing */
	} else {
		goto error;
	}

	mdelay(1);
	len = (srclen <= req->length) ? srclen : req->length; 
	if (srcptr != NULL && len > 0)
		memcpy(buffer, srcptr, len);

	dev->act_len = len;
	dev->stat = 0;
	return 0;

error:
	dev->act_len = 0;
	dev->stat = ST_STALLED;
	return -1;
}
/******************************************************************************/

int hiusb_ehci_init(void **controller)
{
	u32 cmd;
	unsigned long    caplength;
	unsigned int addr;
	struct ehci_host *host= &ehcihost;

	usb_host_init(0, &addr);

	memset(&host, 0, sizeof(struct ehci_host));

	host->base_hccr = addr;
	caplength = hccr_readl(REG_EHCI_CAPLENGTH);
	caplength = HC_LENGTH(caplength);
	host->base_hcor = host->base_hccr + caplength;
	host->root_hub = 0;
	
	memset(qh_list, 0, sizeof(struct QH));
	qh_list->qh_link = (uint32_t)qh_list | QH_LINK_TYPE_QH;
	qh_list->qh_endpt1 = (1 << 15) | (SPEED_HIGH << 12);
	qh_list->qh_curtd = QT_NEXT_TERMINATE;
	qh_list->qh_overlay.qt_next = QT_NEXT_TERMINATE;
	qh_list->qh_overlay.qt_altnext = QT_NEXT_TERMINATE;
	qh_list->qh_overlay.qt_token = 0x40;

	if (hiusb_ehci_reset(host) != 0)
		return -1;

	cmd = hcor_readl(REG_EHCI_USBCMD);
	cmd &= ~(USBCMD_LRESET
		|USBCMD_IAAD
		|USBCMD_PSE
		|USBCMD_ASE
		|USBCMD_RESET);
	cmd |= USBCMD_RUN;
	hcor_writel( cmd, REG_EHCI_USBCMD);

	cmd = hcor_readl(REG_EHCI_CONFIGFLAG);
	cmd |= CONFIGFLAG_CF;
	hcor_writel(cmd, REG_EHCI_CONFIGFLAG);

	cmd =hcor_readl(REG_EHCI_USBCMD);
	mdelay(5);

	*controller = host;

	return 0;
}
/******************************************************************************/