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
#ifndef HIUSB_EHCI_H
#define HIUSB_EHCI_H
#include <stddef.h>

/*
 * Register Space.
 */
#define  REG_EHCI_CAPLENGTH    (0x00)
#define  REG_EHCI_HCSPARAMS    (0x04)
#define  REG_EHCI_HCCPARAMS    (0x08)
#define  REG_EHCI_HCSP_PORTRT    (0x0C)

#define REG_EHCI_USBCMD        (0x00)
#define REG_EHCI_USBSTS        (0x04)  
#define REG_EHCI_ASYNCLISTADDR       (0x18)  
#define REG_EHCI_CONFIGFLAG        (0x40)  
#define REG_EHCI_PORTSC        (0x44) 

struct qTD {
	uint32 qt_next;
	uint32 qt_altnext;
	uint32 qt_token;
	uint32 qt_buffer[5];
	uint32 qt_buffer_hi[5];
	uint32 unused[3];
};

struct QH {
	uint32 qh_link;
	uint32 qh_endpt1;
	uint32 qh_endpt2;
	uint32 qh_curtd;
	struct qTD qh_overlay;
	uint8 fill[16];
};

struct ehci_host {
	unsigned long    base_hccr;
	unsigned long    base_hcor;
	u32 root_hub;
	u16 port_reset;
	u16 init_flag;
};


/* port status */
#define EHCI_PS_PO		BIT(13)
#define EHCI_PS_PP		BIT(12)
#define EHCI_PS_LS		(3 << 10)
#define EHCI_PS_PR		BIT(8)
#define EHCI_PS_SUSP	BIT(7)
#define EHCI_PS_FPR		BIT(6)
#define EHCI_PS_OCC		BIT(5)
#define EHCI_PS_OCA		BIT(4)
#define EHCI_PS_PEC		BIT(3)
#define EHCI_PS_PE		BIT(2)
#define EHCI_PS_CSC		BIT(1)
#define EHCI_PS_CS		BIT(0)
#define EHCI_PS_CLEAR		(EHCI_PS_OCC | EHCI_PS_PEC | EHCI_PS_CSC)
#define EHCI_PS_IS_LOWSPEED(x)	(((x) & EHCI_PS_LS) == (1 << 10))


/* HC BIT */
#define HC_LENGTH(p)		((p) & 0x00ff)
#define HC_VERSION(p)		(((p) >> 16) & 0xffff)
#define HCS_PPC(p)		((p) & (BIT(4)))
#define HCS_INDICATOR(p)	((p) & (BIT(16)))
#define HCS_N_PORTS(p)		((p) & 0xf)

/* USBCMD BIT */
#define USBCMD_PARK	BIT(11)		
#define USBCMD_PARK_CNT(c)	(((c) >> 8) & 3)
#define USBCMD_ASE		BIT( 5)
#define USBCMD_LRESET	BIT(7)
#define USBCMD_IAAD	BIT(5)
#define USBCMD_PSE		BIT(4)
#define USBCMD_RESET	BIT(1)
#define USBCMD_RUN		BIT(0)
#define USBSTS_ASS		BIT(15)
#define USBSTS_HALT		BIT(12)

/* FLAG BIT */
#define CONFIGFLAG_CF		BIT(0)

/* qt/qh bit */
#define	QT_NEXT_TERMINATE	1
#define	QH_LINK_TERMINATE	1
#define	QH_LINK_TYPE_ITD	0
#define	QH_LINK_TYPE_QH		2
#define	QH_LINK_TYPE_SITD	4
#define	QH_LINK_TYPE_FSTN	6

int hiusb_ehci_submit_roothub(struct usbdevice *dev, void *buffer,
		 struct device_request *req);
int
hiusb_ehci_submit_async(struct usbdevice *dev, unsigned long pipe, void *buffer,
		   int length, struct device_request *req);
int hiusb_ehci_init(void **controller);
#endif /*HIUSB_EHCI_H */
