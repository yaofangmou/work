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
#ifndef _HIUSB_CORE_H_
#define _HIUSB_CORE_H_
#include <stddef.h>

#define MAX_DEVICE			7
#define MAXINTERFACES		3
#define MAXENDPOINTS		5
#define MAXCHILDREN		8

#define CNTL_TIMEOUT 100

#define BUFSIZ	512

/* USB-status codes: */
#define ST_STALLED          BIT(1)
#define ST_BUF_ERR          BIT(2)
#define ST_BABBLE_DET     BIT(3)
#define ST_CRC_ERR          BIT(5)
#define ST_NOT_PROC         0x80000000L


#define RECIP_DEVICE      0x00
#define RECIP_INTERFACE   0x01
#define RECIP_ENDPOINT    0x02
#define RECIP_OTHER       0x03

#define DIR_OUT           0
#define DIR_IN            0x80

#define SPEED_FULL		0x0
#define SPEED_LOW		0x1
#define SPEED_HIGH		0x2
#define SPEED_RESERVED	0x3

#define DT_DEVICE        0x01
#define DT_CONFIG        0x02
#define DT_STRING        0x03
#define DT_INTERFACE     0x04
#define DT_ENDPOINT      0x05
#define DT_HUB          (TYPE_CLASS | 0x09)

#define ENDPOINT_NUMBER_MASK  0x0f
#define ENDPOINT_XFERTYPE_MASK 0x03
#define ENDPOINT_XFER_CONTROL  0
#define ENDPOINT_XFER_BULK     2

#define REQ_GET_STATUS          0x00
#define REQ_CLEAR_FEATURE       0x01
#define REQ_SET_FEATURE         0x03
#define REQ_SET_ADDRESS         0x05
#define REQ_GET_DESCRIPTOR      0x06
#define REQ_SET_CONFIGURATION   0x09

#define PIPE_CONTROL        2
#define PIPE_BULK           3

#define TYPE_STANDARD   (0x00 << 5)
#define TYPE_CLASS      (0x01 << 5)
#define CLASS_HUB            9

#define DeviceRequest ((DIR_IN | TYPE_STANDARD | RECIP_DEVICE) << 8)
#define DeviceOutRequest ((DIR_OUT | TYPE_STANDARD | RECIP_DEVICE) << 8)
#define RootHubRequest (DIR_IN | TYPE_CLASS | RECIP_DEVICE)
#define RootHubPortInRequest (DIR_IN  | TYPE_CLASS | RECIP_OTHER)
#define RootHubPortOutRequest (DIR_OUT  | TYPE_CLASS | RECIP_OTHER)
#define Root_PORT	(TYPE_CLASS | RECIP_OTHER)

#define FEAT_ENABLE         1
#define FEAT_SUSPEND        2
#define FEAT_OVER_CURRENT   3
#define FEAT_RESET          4
#define FEAT_POWER          8
#define FEAT_C_CONNECTION   16
#define FEAT_C_ENABLE       17
#define FEAT_C_OVER_CURRENT 19
#define FEAT_C_RESET        20
#define STAT_CONNECTION    0x0001
#define STAT_ENABLE        0x0002
#define STAT_SUSPEND       0x0004
#define STAT_OVERCURRENT   0x0008
#define STAT_RESET         0x0010
#define STAT_POWER         0x0100
#define STAT_LOW_SPEED     0x0200
#define STAT_HIGH_SPEED    0x0400
#define STAT_SPEED (STAT_LOW_SPEED | STAT_HIGH_SPEED)
#define STAT_C_CONNECTION  0x0001
#define STAT_C_ENABLE      0x0002
#define STAT_C_SUSPEND     0x0004
#define STAT_C_OVERCURRENT 0x0008
#define STAT_C_RESET       0x0010

struct endpoint_descriptor {
	u8 Length;
	u8 DescriptorType;
	u8 EndpointAddress;
	u8 Attributes;
	u16 MaxPkt;
	u8 Interval;
} __attribute__ ((packed));

struct interface_descriptor {
	u8 len;
	u8 desc_type;
	u8 interf_num;
	u8 alter_setting;
	u8 endp_num;
	u8 interf_class;
	u8 interf_subclass;
	u8 interf_protocol;
	u8 interface;
} __attribute__ ((packed));

struct configuration_descriptor {
	u8 len;
	u8 desc_type;
	u16 totallength;
	u8 interf_num;
	u8 config_value;
	u8 config;
	u8 attrib;
	u8 maxpower;
} __attribute__ ((packed));

struct device_descriptor {
	u8 Length;
	u8 DescriptorType;
	u16 Bcd;
	u8 DeviceClass;
	u8 DeviceSubClass;
	u8 DeviceProtocol;
	u8 MaxPktSize0;
	u16 Vendor;
	u16 idProduct;
	u16 idDevice;
	u8 Manufacturer;
	u8 iProduct;
	u8 SerialNumber;
	u8 NumConfigurations;
} __attribute__ ((packed));

struct descriptor_header {
	unsigned char	Length;
	unsigned char	DescriptorType;
} __attribute__ ((packed));

struct device_request {
	unsigned char	type;
	unsigned char	request;
	unsigned short	value;
	unsigned short	index;
	unsigned short	length;
} __attribute__ ((packed));


struct interface {
	struct interface_descriptor desc;
	unsigned char	ep_num;
	unsigned char	altsetting_num;
	unsigned char	altsetting_act;
	struct endpoint_descriptor ep_desc[MAXENDPOINTS];
} __attribute__ ((packed));

struct config {
	struct configuration_descriptor desc;
	unsigned char	interf_num;
	struct interface interf_desc[MAXINTERFACES];
} __attribute__ ((packed));

struct port_status {
	unsigned short PortStatus;
	unsigned short PortChange;
} __attribute__ ((packed));

struct hub_status {
	unsigned short HubStatus;
	unsigned short HubChange;
} __attribute__ ((packed));

struct hub_descriptor {
	unsigned char  Length;
	unsigned char  DescriptorType;
	unsigned char  NbrPorts;
	unsigned short HubCharacteristics;
	unsigned char  PwrOn2PwrGood;
} __attribute__ ((packed));

struct roothub_dev {
	struct hub_descriptor hub;
	struct device_descriptor device;
	struct configuration_descriptor config;
	struct interface_descriptor interface;
	struct endpoint_descriptor endpoint;
} __attribute__ ((packed));

enum {
	PACKET_SIZE_8   = 0,
	PACKET_SIZE_16  = 1,
	PACKET_SIZE_32  = 2,
	PACKET_SIZE_64  = 3,
};

struct usbdevice {
	unsigned int	devnum;	
	unsigned int maxpkt;
	unsigned int tog[2];
	unsigned int epin_maxpkt[8];	
	unsigned int epout_maxpkt[8];
	unsigned int configno;
	unsigned long stat;
	unsigned int max_child;
	unsigned int act_len;
	unsigned int portnr;

	struct device_descriptor descriptor;
	struct config config;

	struct usbdevice *parent;
	struct usbdevice *child[MAXCHILDREN];
	struct ehci_host *host;
	void *privptr;
};

#define create_pipe(dev,endpoint) (((dev)->devnum << 8) | ((endpoint) << 15) |(SPEED_HIGH << 26) | (dev)->maxpkt)
#define default_pipe(dev) (SPEED_HIGH << 26)
#define usb_sndctrlpipe(dev, endpoint)	((PIPE_CONTROL << 30) | create_pipe(dev, endpoint))
#define usb_rcvctrlpipe(dev, endpoint)	((PIPE_CONTROL << 30) |create_pipe(dev, endpoint) | DIR_IN)
#define usb_sndbulkpipe(dev, endpoint)	((PIPE_BULK << 30) |create_pipe(dev, endpoint))
#define usb_rcvbulkpipe(dev, endpoint)	((PIPE_BULK << 30) |create_pipe(dev, endpoint) |DIR_IN)
#define usb_snddefctrl(dev)		((PIPE_CONTROL << 30) | default_pipe(dev))
#define usb_rcvdefctrl(dev)		((PIPE_CONTROL << 30) | default_pipe(dev) | DIR_IN)
#define usb_get_tog(dev, ep, out) (((dev)->tog[out] >> ep) & 1)
#define usb_set_tog(dev, ep, out, bit) ((dev)->tog[out] = ((dev)->tog[out] & ~(1 << ep)) | ((bit) << ep))
#define usb_pipeout(pipe)	((((pipe) >> 7) & 1) ^ 1)
#define usb_pipein(pipe)	(((pipe) >> 7) & 1)
#define usb_pipedevice(pipe)	(((pipe) >> 8) & 0x7f)
#define usb_pipeendpoint(pipe)	(((pipe) >> 15) & 0xf)
#define usb_pipespeed(pipe)	(((pipe) >> 26) & 3)
#define usb_pipetype(pipe)	(((pipe) >> 30) & 3)
#define USB_TIMEOUT_MS(pipe) ((usb_pipetype((pipe)) == PIPE_BULK) ? 5000 : 1000)

int hiusb_control_msg(struct usbdevice *dev, unsigned int pipe, struct device_request * request, void *data);

int hiusb_bulk_msg(struct usbdevice *dev, unsigned int pipe, void *buf, int len, int *act_len);

int hiusb_init(void);
struct usbdevice *hiusb_get_device(int index);
int hiusb_clear_halt(struct usbdevice *dev, int pipe);

#endif /*_HIUSB_CORE_H_ */
