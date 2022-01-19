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
#include <string.h>
#include <malloc.h>
#include <delay.h>

#include "usbcore.h"
#include "ehci.h"

static struct usbdevice usbdev[MAX_DEVICE];
static int usbdev_index = 0;

static int hiusb_new_device(struct usbdevice *dev);
static struct usbdevice *hiusb_alloc_device(void *controller);
/******************************************************************************/

int hiusb_control_msg(struct usbdevice *dev, unsigned int pipe, 
		struct device_request *req, void *buf)
{
	int timeout = CNTL_TIMEOUT * 5;
	struct device_request setup_packet = {
		.type = req->type,
		.request = req->request,
		.value = req->value,
		.index = req->index,
		.length = req->length,
	};
	dev->stat= ST_NOT_PROC;

	if (usb_pipedevice(pipe) == dev->host->root_hub) {
		if (hiusb_ehci_submit_roothub(dev, buf, &setup_packet) < 0)
			goto error;
	} else  {
		if (hiusb_ehci_submit_async(dev, pipe, buf, req->length, &setup_packet) < 0)
			goto error;
	}

	do {
		if (!(dev->stat & ST_NOT_PROC))
			break;
		mdelay(1);
	} while (--timeout);

	if (dev->stat)
		goto error;

	return dev->act_len;

error:
	return -1;
}
/******************************************************************************/

int hiusb_bulk_msg(struct usbdevice *dev, unsigned int pipe, 
					void *buf, int len, int *act_len)
{
	int timeout = CNTL_TIMEOUT * 5;
	dev->stat = ST_NOT_PROC;

	if((len < 0) || (hiusb_ehci_submit_async(dev, pipe, buf, len, NULL) < 0))
		goto fail;

	do {
		if (!(dev->stat & ST_NOT_PROC))
			break;
		mdelay(1);
	} while (--timeout);

	*act_len = dev->act_len;

	if (dev->stat != 0)
		goto fail;

	return 0;
fail:
	return -1;
}
/******************************************************************************/

static int hiusb_get_descriptor(struct usbdevice *dev, unsigned short type, void *buf, int size)
{
	struct device_request request = {
		.type = DIR_IN,
		.request = REQ_GET_DESCRIPTOR,
		.value = type,
		.index =0,
		.length = size,
	};
	return hiusb_control_msg(dev, usb_rcvctrlpipe(dev, 0), &request, buf);
}
/******************************************************************************/

static int hiusb_get_config(struct usbdevice *dev, unsigned char *buffer)
{
	int err;
	struct configuration_descriptor *config;

	config = (struct configuration_descriptor *)&buffer[0];
	err = hiusb_get_descriptor(dev, (DT_CONFIG<<8), buffer, 9);
	if (err < 0) {
		return -1;
	} else if (err < 9) {
		return -1;
	}

	if ( config->totallength > BUFSIZ) {
		return -1;
	}

	return hiusb_get_descriptor(dev, (DT_CONFIG<<8), buffer, config->totallength);
}
/******************************************************************************/

static int hiusb_parse_config(struct usbdevice *dev, unsigned char *buffer)
{
	char len, type;
	int index, interf_num, ep_num;

	len = buffer[0];
	type = buffer[1];
	interf_num = ep_num = -1;

	memcpy(&dev->config, buffer, len);
	dev->config.interf_num= 0;
	dev->configno = 0;
	index = dev->config.desc.len;

	for (; index + 1 < dev->config.desc.totallength; index += len) {

		len = buffer[index];
		type = buffer[index+1];

		if (type == DT_INTERFACE) {

			interf_num = dev->config.interf_num;
			dev->config.interf_num++;
			memcpy(&dev->config.interf_desc[interf_num], &buffer[index], buffer[index]);
			dev->config.interf_desc[interf_num].ep_num = 0;
			dev->config.interf_desc[interf_num].altsetting_num = 1;

		} else if (type == DT_ENDPOINT) {

			ep_num = dev->config.interf_desc[interf_num].ep_num;
			dev->config.interf_desc[interf_num].ep_num++;
			memcpy(&dev->config.interf_desc[interf_num].ep_desc[ep_num], &buffer[index], buffer[index]);

		} 
	}

	return 1;
}

/******************************************************************************/

static int hiusb_set_config(struct usbdevice *dev, int config)
{
	int res;
	struct device_request request = {
		.type = DIR_OUT,
		.request = REQ_SET_CONFIGURATION,
		.value = config,
		.index =0,
		.length = 0,
	};
	res = hiusb_control_msg(dev, usb_sndctrlpipe(dev, 0), &request, NULL);
	if (res == 0) {
		dev->tog[0] = 0;
		dev->tog[1] = 0;
		return 0;
	} else
		return -1;
}
/******************************************************************************/

static int hiusb_clear_port_feature(struct usbdevice *dev, int port, int feature)
{
	struct device_request request = {
		.type = Root_PORT,
		.request = REQ_CLEAR_FEATURE,
		.value = feature,
		.index =port,
		.length = 0,
	};
	return hiusb_control_msg(dev, usb_sndctrlpipe(dev, 0), &request, NULL);
}
/******************************************************************************/

static int hiusb_get_port_status(struct usbdevice *dev, int port, void *buf)
{
	struct device_request request = {
		.type = RootHubPortInRequest,
		.request = REQ_GET_STATUS,
		.value = 0,
		.index =port,
		.length = sizeof(struct hub_status),
	};
	return hiusb_control_msg(dev, usb_rcvctrlpipe(dev, 0), &request, buf);
}
/******************************************************************************/

int hiusb_clear_halt(struct usbdevice *dev, int pipe)
{
	int result;
	int endp = usb_pipeendpoint(pipe)|(usb_pipein(pipe)<<7);
	struct device_request request = {
		.type = RECIP_ENDPOINT,
		.request = REQ_CLEAR_FEATURE,
		.value = 0,
		.index =endp,
		.length = 0,
	};

	result = hiusb_control_msg(dev, usb_sndctrlpipe(dev, 0),&request, NULL);

	if (result < 0)
		return result;

	usb_set_tog(dev, usb_pipeendpoint(pipe), usb_pipeout(pipe), 0);
	return 0;
}
/******************************************************************************/

static int hiusb_set_maxpacket(struct usbdevice *dev)
{
	int if_idx, ep_idx;
	int b;
	struct endpoint_descriptor *ep;

	for (if_idx = 0;(if_idx < dev->config.desc.interf_num)&&(if_idx <MAXINTERFACES); if_idx++)
		for (ep_idx = 0; (ep_idx < dev->config.interf_desc[if_idx].desc.endp_num)
			&&(ep_idx <MAXENDPOINTS); ep_idx++){
			ep = &dev->config.interf_desc[if_idx].ep_desc[ep_idx];
			b = ep->EndpointAddress & ENDPOINT_NUMBER_MASK;

			if ((ep->EndpointAddress & 0x80) == 0) {
				if (ep->MaxPkt > dev->epout_maxpkt[b]) {
					dev->epout_maxpkt[b] = ep->MaxPkt;
				}
			} else {
				if (ep->MaxPkt > dev->epin_maxpkt[b]) {
					dev->epin_maxpkt[b] = ep->MaxPkt;
				}
			}
	}

	return 0;
}
/******************************************************************************/

static void hiusb_hub_poweron(struct usbdevice * usbdev, unsigned int power)
{
	int i;
	struct device_request request = {
		.type = Root_PORT,
		.request = REQ_SET_FEATURE,
		.value = FEAT_POWER,
		.index =0,
		.length = 0,
	};	

	for (i = 0; i < usbdev->max_child; i++) {
		request.index = i+1;
		hiusb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), &request, NULL);
	}

	mdelay(max(power * 2, (unsigned)100));
}
/******************************************************************************/

static int hiusb_hub_portreset(struct usbdevice *dev, int port, unsigned short *portstat)
{
	int tries;
	struct port_status portsts;
	struct device_request request = {
		.type = Root_PORT,
		.request = REQ_SET_FEATURE,
		.value = FEAT_RESET,
		.index =0,
		.length = 0,
	};

	for (tries = 0; tries < 5; tries++) {

		request.index = port + 1;
		hiusb_control_msg(dev, usb_sndctrlpipe(dev, 0), &request, NULL);
		mdelay(200);

		if (hiusb_get_port_status(dev, port + 1, &portsts) < 0) {
			return -1;
		}

		if ((portsts.PortChange & STAT_C_CONNECTION) ||
		    !(portsts.PortStatus & STAT_CONNECTION))
			return -1;

		if (portsts.PortStatus & STAT_ENABLE)
			break;

		mdelay(200);
	}

	if (tries == 5) {
		return -1;
	}

	hiusb_clear_port_feature(dev, port + 1, FEAT_C_RESET);
	if (portstat)
		*portstat = portsts.PortStatus;

	return 0;
}
/******************************************************************************/

static void hiusb_hub_portchange(struct usbdevice *parent, int port)
{
	struct usbdevice *usbdev;
	struct port_status portsts;

	if (hiusb_get_port_status(parent, port + 1, &portsts) < 0) {
		return;
	}

	hiusb_clear_port_feature(parent, port + 1, FEAT_C_CONNECTION);

	if (((!(portsts.PortStatus & STAT_CONNECTION)) &&
	     (!(portsts.PortStatus & STAT_ENABLE))) || (parent->child[port])) {
		if (!(portsts.PortStatus & STAT_CONNECTION))
			return;
	}
	mdelay(200);

	if (hiusb_hub_portreset(parent, port, &portsts.PortStatus) < 0) {
		return;
	}

	mdelay(200);

	usbdev = hiusb_alloc_device(parent->host);
	parent->child[port] = usbdev;
	usbdev->parent = parent;
	usbdev->portnr = port + 1;

	if (hiusb_new_device(usbdev)) {
		hiusb_clear_port_feature(parent, port + 1, FEAT_ENABLE);
	}
}
/******************************************************************************/

static int hiusb_hub_configure(struct usbdevice *dev)
{
	int i;
	unsigned char buffer[BUFSIZ];
	struct hub_descriptor *descriptor;
	struct device_request request = {
		.type = RootHubRequest,
		.request = REQ_GET_DESCRIPTOR,
		.value = DT_HUB << 8,
		.index =0,
		.length = 4,
	};

	if (hiusb_control_msg(dev, usb_rcvctrlpipe(dev, 0), &request, buffer) < 0) {
		return -1;
	}

	descriptor = (struct hub_descriptor *)buffer;
	request.length = descriptor->Length;
	if (hiusb_control_msg(dev, usb_rcvctrlpipe(dev, 0), &request, buffer) < 0) {
		return -1;
	}

	dev->max_child = descriptor->NbrPorts;

	request.request = REQ_GET_STATUS;
	request.type = RootHubRequest;
	request.value = 0;
	request.index = 0;
	request.length = sizeof(struct hub_status);
	if (hiusb_control_msg(dev, usb_rcvctrlpipe(dev, 0), &request, buffer)< 0) {
		return -1;
	}

	hiusb_hub_poweron(dev,descriptor->PwrOn2PwrGood);
	mdelay(2000);

	for (i = 0; i < dev->max_child; i++) {
		struct port_status portsts;
		if (hiusb_get_port_status(dev, i + 1, &portsts) < 0) {
			continue;
		}

		if (portsts.PortChange & STAT_C_CONNECTION) {
			hiusb_hub_portchange(dev, i);
		}

		if (portsts.PortChange & STAT_C_ENABLE) {
			hiusb_clear_port_feature(dev, i + 1,  FEAT_C_ENABLE);

			if (!(portsts.PortStatus & STAT_ENABLE) &&
			     (portsts.PortStatus & STAT_CONNECTION) &&
			     ((dev->child[i]))) {
					hiusb_hub_portchange(dev, i);
			}
		}

		if (portsts.PortStatus & STAT_SUSPEND) {
			hiusb_clear_port_feature(dev, i + 1, FEAT_SUSPEND);
		}

		if (portsts.PortChange & STAT_C_OVERCURRENT) {
			hiusb_clear_port_feature(dev, i + 1, FEAT_C_OVER_CURRENT);
			hiusb_hub_poweron(dev,descriptor->PwrOn2PwrGood);
		}

		if (portsts.PortChange & STAT_C_RESET) {
			hiusb_clear_port_feature(dev, i + 1, FEAT_C_RESET);
		}
	}

	return 0;
}
/***************************************************************************/

static int hiusb_reset_device(struct usbdevice *dev)
{
	if (hiusb_hub_portreset(dev->parent, dev->portnr-1, NULL) < 0) {
		return -1;
	}

	return 0;
}
/***************************************************************************/

static int hiusb_new_device(struct usbdevice *dev)
{
	int addr, err;
	struct interface *iface;
	unsigned char  tmpbuf[BUFSIZ];
	struct device_descriptor *desc;
	struct device_request request;

	addr = dev->devnum;
	dev->devnum = 0;

	desc = (struct device_descriptor *)tmpbuf;
	dev->descriptor.MaxPktSize0 = 64;
	dev->maxpkt = PACKET_SIZE_64;
	dev->epin_maxpkt[0] = 64;
	dev->epout_maxpkt[0] = 64;

	mdelay(1000);
	err = hiusb_get_descriptor(dev, (DT_DEVICE<<8), desc, 64);
	if (err < 0) {
		return 1;
	}

	dev->descriptor.MaxPktSize0 = desc->MaxPktSize0;

	if (dev->parent && hiusb_reset_device(dev)) {
		return 1;
	}

	dev->epin_maxpkt[0] = dev->epout_maxpkt[0] = dev->descriptor.MaxPktSize0;

	if (dev->descriptor.MaxPktSize0 == 8) {
		dev->maxpkt  = PACKET_SIZE_8;
	} else if (dev->descriptor.MaxPktSize0 == 16) {
		dev->maxpkt = PACKET_SIZE_16;
	} else if (dev->descriptor.MaxPktSize0 == 32) {
		dev->maxpkt = PACKET_SIZE_32;
	} else if (dev->descriptor.MaxPktSize0 == 64) {
		dev->maxpkt = PACKET_SIZE_64;
	}

	dev->devnum = addr;
	request.request = REQ_SET_ADDRESS;
	request.type = 0;
	request.value = (dev->devnum);
	request.index = 0;
	request.length = 0;
	if (hiusb_control_msg(dev, usb_snddefctrl(dev), &request, NULL) < 0) 
	{
		return 1;
	}

	mdelay(10);

	err = hiusb_get_descriptor(dev, (DT_DEVICE<<8), tmpbuf, sizeof(dev->descriptor));
	if (err < 0) {
		return 1;
	} else if (err < sizeof(dev->descriptor)) {
		return 1;
	}

	memcpy(&dev->descriptor, tmpbuf, sizeof(dev->descriptor));
	hiusb_get_config(dev, tmpbuf);
	hiusb_parse_config(dev, tmpbuf);
	hiusb_set_maxpacket(dev);
	if (hiusb_set_config(dev, dev->config.desc.config_value)) {
		return -1;
	}

	iface = &dev->config.interf_desc[0];

	if (iface->desc.interf_class == CLASS_HUB){ 
		hiusb_hub_configure(dev);
	} 

	return 0;
}
/***************************************************************************/

static struct usbdevice *hiusb_alloc_device(void *controller)
{
	int i;

	if (usbdev_index == MAX_DEVICE) {
		return NULL;
	}

	printf("new Device %d\n", usbdev_index);

	usbdev[usbdev_index].devnum = usbdev_index + 1;
	usbdev[usbdev_index].max_child = 0;
	usbdev[usbdev_index].parent = NULL;
	usbdev[usbdev_index].host = controller;

	for (i = 0; i < MAXCHILDREN; i++)
		usbdev[usbdev_index].child[i] = NULL;
	
	usbdev_index++;

	return &usbdev[usbdev_index- 1];
}
/***************************************************************************/

struct usbdevice *hiusb_get_device(int index)
{
	if (usbdev[index].devnum == -1)
		return NULL;
	else
		return &usbdev[index];
}
/******************************************************************************/

int hiusb_init(void)
{
	void *ctrl;
	int ret = 0;
	int i;
	struct usbdevice * dev;

	/* step1: init usb device struct */
	usbdev_index = 0;

	for (i = 0; i < MAX_DEVICE; i++) {
		memset(&usbdev[i], 0, sizeof(struct usbdevice));
		usbdev[i].devnum = -1;
	}

	/* step2: init ehci host */
	ret = hiusb_ehci_init(&ctrl);
	if (ret)
		return ret;

	/* step3: device 0 is roothub */
	dev = hiusb_alloc_device(ctrl);

	/* step4: scan usb device */
	hiusb_new_device(dev);

	return 0;
}
/******************************************************************************/
