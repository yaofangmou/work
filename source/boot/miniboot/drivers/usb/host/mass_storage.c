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
#include "mass_storage.h"

static scsicmd usb_scsicmd;
static u32 CBWTag;
static int usb_max_stor;
static struct stor_dev usb_stor[USB_MAX_STOR_DEV];

unsigned char us_direction[32] = {
	0x28, 0x81, 0x14, 0x14, 0x20, 0x01, 0x90, 0x77,
	0x0C, 0x20, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	};
#define US_DIRECTION(x) ((us_direction[x>>3] >> (x & 7)) & 1)


/******************************************************************************/

static int hiusb_scsi_inquiry(struct stor_dev *udisk)
{
	scsicmd *scmd = udisk->scmd;
	int retries = 5, ret;

	do {
		memset(&scmd->cmd_buf[0], 0, SCSI_CMD_LENGTH);
		scmd->cmd_buf[0] = SCSI_CMD_INQUIRY;
		scmd->cmd_buf[1] = scmd->lun << 5;
		scmd->cmd_buf[4] = 36;
		scmd->cmdlen = SCSI_CMD_LENGTH;
		scmd->datalen = 36;
		ret = udisk->stor_trans(udisk, scmd);
		if (ret == TRANSPORT_GOOD)
			break;
	} while (retries--);

	if (!retries) {
		return TRANSPORT_FAILED;
	}

	return ret;
}
/******************************************************************************/

static int hiusb_scsi_request_sense(struct stor_dev *udisk)
{
	scsicmd *scmd = udisk->scmd;
	char * tmp;

	tmp = (char *)scmd->pdata;
	memset(&scmd->cmd_buf[0], 0, SCSI_CMD_LENGTH);

	scmd->cmd_buf[0] = SCSI_CMD_REQ_SENSE;
	scmd->cmd_buf[1] = scmd->lun << 5;
	scmd->cmd_buf[4] = 18;
	scmd->datalen = 18;
	scmd->pdata = &scmd->sense_buf[0];
	scmd->cmdlen = SCSI_CMD_LENGTH;
	udisk->stor_trans(udisk, scmd);
	scmd->pdata = (unsigned char *)tmp;

	return 0;
}
/******************************************************************************/

static int hiusb_scsi_test_ready(struct stor_dev *udisk)
{
	scsicmd *scmd = udisk->scmd;
	int retries = 10;

	do {
		memset(&scmd->cmd_buf[0], 0, SCSI_CMD_LENGTH);
		scmd->cmd_buf[0] = SCSI_CMD_TST_RDY;
		scmd->cmd_buf[1] = scmd->lun << 5;
		scmd->datalen = 0;
		scmd->cmdlen = SCSI_CMD_LENGTH;
		if (!udisk->stor_trans(udisk, scmd))
			return TRANSPORT_GOOD;

		hiusb_scsi_request_sense(udisk);
		mdelay(100);
	} while (retries--);

	return TRANSPORT_FAILED;
}
/******************************************************************************/

static int hiusb_scsi_read_capacity(struct stor_dev *udisk)
{
	scsicmd *scmd = udisk->scmd;
	int retries = 3;

	do {
		memset(&scmd->cmd_buf[0], 0, SCSI_CMD_LENGTH);
		scmd->cmd_buf[0] = SCSI_CMD_READ_CAP;
		scmd->cmd_buf[1] = scmd->lun << 5;
		scmd->datalen = 8;
		scmd->cmdlen = SCSI_CMD_LENGTH;
		if (!udisk->stor_trans(udisk, scmd))
			return TRANSPORT_GOOD;
	} while (retries--);

	return TRANSPORT_FAILED;
}
/******************************************************************************/

static int hiusb_scsi_read(struct stor_dev *udisk, unsigned long offset, unsigned short blocks)
{
	scsicmd *scmd = udisk->scmd;
	int ret;

	memset(&scmd->cmd_buf[0], 0, SCSI_CMD_LENGTH);
	scmd->cmd_buf[0] = SCSI_CMD_READ;
	scmd->cmd_buf[1] = scmd->lun << 5;
	scmd->cmd_buf[2] = (unsigned char) (offset >> 24);
	scmd->cmd_buf[3] = (unsigned char) (offset >> 16);
	scmd->cmd_buf[4] = (unsigned char) (offset >> 8);
	scmd->cmd_buf[5] = (unsigned char) (offset);
	scmd->cmd_buf[7] = (unsigned char) (blocks >> 8);
	scmd->cmd_buf[8] = (unsigned char) blocks;
	scmd->cmdlen = SCSI_CMD_LENGTH;
	ret = udisk->stor_trans(udisk, scmd);

	return ret;
}
/******************************************************************************/

static int hiusb_stor_send_cbw(struct stor_dev *udisk, scsicmd *scmd)
{
	int result;
	int actlen;
	int dir_in;
	unsigned int pipe;
	cbw_t cbw;

	dir_in = US_DIRECTION(scmd->cmd_buf[0]);

	pipe = usb_sndbulkpipe(udisk->pusb_dev, udisk->ep_out);

	cbw.signature = CBW_SIGNATURE;
	cbw.tag = CBWTag++;
	cbw.data_len = scmd->datalen;
	cbw.flags = (dir_in ? CBW_FLAGS_IN : CBW_FLAGS_OUT);
	cbw.lun = scmd->lun;
	cbw.length = scmd->cmdlen;
	memcpy(cbw.cdb, scmd->cmd_buf, scmd->cmdlen);
	result = hiusb_bulk_msg(udisk->pusb_dev, pipe, &cbw, SCSI_CBW_SIZE, &actlen);
	return result;
}
/******************************************************************************/

static int hiusb_stor_reset_recovery(struct stor_dev *udisk)
{
	unsigned int pipe;
	struct device_request request = {
		.type =  TYPE_CLASS |RECIP_INTERFACE,
		.request = US_BBB_RESET,
		.value = 0,
		.index =udisk->ifnum,
		.length = 0,
	};

	/* step1: reset bulk only device */
	hiusb_control_msg(udisk->pusb_dev, usb_sndctrlpipe(udisk->pusb_dev, 0), &request, NULL);
	mdelay(200);

	/* step2: clear bulk in endpoint */
	pipe = usb_rcvbulkpipe(udisk->pusb_dev, udisk->ep_in);
	hiusb_clear_halt(udisk->pusb_dev, pipe);
	mdelay(200);

	/* step3: clear bulk out endpoint */
	pipe = usb_sndbulkpipe(udisk->pusb_dev, udisk->ep_out);
	hiusb_clear_halt(udisk->pusb_dev, pipe);
	mdelay(200);

	return 0;
}
/******************************************************************************/

static int hiusb_stor_transport(struct stor_dev *udisk, scsicmd *scmd)
{
	int result, retry;
	int dir_in;
	int actlen, data_actlen;
	unsigned int pipe, pipein, pipeout;
	csw_t csw;

	dir_in = US_DIRECTION(scmd->cmd_buf[0]);

	/* step1: cmd */
	result = hiusb_stor_send_cbw(udisk, scmd);
	if (result < 0) {
		hiusb_stor_reset_recovery(udisk);
		return TRANSPORT_FAILED;
	}
	mdelay(5);


	/* step2: data */
	pipein = usb_rcvbulkpipe(udisk->pusb_dev, udisk->ep_in);
	pipeout = usb_sndbulkpipe(udisk->pusb_dev, udisk->ep_out);
	data_actlen = 0;
	if (scmd->datalen == 0)
		goto st;
	if (dir_in)
		pipe = pipein;
	else
		pipe = pipeout;
	result = hiusb_bulk_msg(udisk->pusb_dev, pipe, scmd->pdata, scmd->datalen, &data_actlen);
	if ((result < 0) && (udisk->pusb_dev->stat & ST_STALLED)) {
		result = hiusb_clear_halt(udisk->pusb_dev, pipe);
		if (result >= 0)
			goto st;
	}
	if (result < 0) {
		hiusb_stor_reset_recovery(udisk);
		return TRANSPORT_FAILED;
	}

	/* step3: command status wrapper*/
st:
	retry = 0;
again:
	result = hiusb_bulk_msg(udisk->pusb_dev, pipein, &csw, SCSI_CSW_SIZE, &actlen);

	if ((result < 0) && (retry < 1) &&
	    (udisk->pusb_dev->stat & ST_STALLED)) {
		result = hiusb_clear_halt(udisk->pusb_dev, pipein);
		if (result >= 0 && (retry++ < 1))
			goto again;
	}
	if (result < 0) {
		hiusb_stor_reset_recovery(udisk);
		return TRANSPORT_FAILED;
	}
	pipe = csw.dataresidue;
	if (pipe == 0 && scmd->datalen != 0 && scmd->datalen - data_actlen != 0)
		pipe = scmd->datalen - data_actlen;
	if ((CSW_SIGNATURE != csw.signature) ||
	((CBWTag - 1) != csw.tag) ||
	 (csw.status >= CSW_STATUS_PHASE) ){
		hiusb_stor_reset_recovery(udisk);
		return TRANSPORT_FAILED;
	}else if ((data_actlen > scmd->datalen) ||
		(csw.status == CSW_STATUS_FAILED) ){
		return TRANSPORT_FAILED;
	}

	return result;
}
/******************************************************************************/

unsigned long hiusb_stor_read(int target, unsigned long blknr,
			    unsigned long blkcnt, void *buffer)
{
	unsigned long blk_offset, blk_count, buf_addr;
	unsigned short maxblks;
	struct stor_dev *udisk = NULL;
	scsicmd *scmd;
	int retry, i;
	
	if (blkcnt == 0)
		return 0;

	/* step 1: find out the udisk target */
	for (i = 0 ; i < hiusb_stor_get_max(); i++) {
		udisk = hiusb_stor_get_udisk(i);
		if (!udisk)
			return 0;
		
		if (udisk->target== target)
			break;
	}

	if (!udisk)
		return 0;

	/* step 2: init scsi command and test udisk ready */
	scmd = udisk->scmd;
	scmd->lun = udisk->lun;
	buf_addr = (unsigned long)buffer;
	blk_offset = blknr;
	blk_count = blkcnt;
	if (hiusb_scsi_test_ready(udisk)) {
		printf("udisk not ready!\n");
		return 0;
	}

	/* step 3: read data and request sense */
	do {
		retry = 2;
		scmd->pdata = (unsigned char *)buf_addr;
		maxblks = (unsigned short) USB_MAX_XFER_BLK(buf_addr, udisk->blksz);
		if (blk_count < maxblks)
			maxblks = (unsigned short) blk_count;

retry_it:
		scmd->datalen = udisk->blksz * maxblks;
		scmd->pdata = (unsigned char *)buf_addr;
		if (hiusb_scsi_read(udisk, blk_offset, maxblks)) {
			hiusb_scsi_request_sense(udisk);
			if (retry--)
				goto retry_it;
			blkcnt -= blk_count;
			break;
		}
		blk_offset += maxblks;
		blk_count -= maxblks;
		buf_addr += scmd->datalen;
	} while (blk_count != 0);

	return blkcnt;
}
/******************************************************************************/

int hiusb_stor_probe(struct usbdevice *dev,  struct stor_dev *udisk, unsigned int ifnum)
{
	struct interface *interf;
	int i;

	/* step1: wether the device is usb masstorage */
	interf = &dev->config.interf_desc[ifnum];
	if (dev->descriptor.DeviceClass != 0 ||
		interf->desc.interf_class != USB_CLASS_MASS_STORAGE ||
		interf->desc.interf_subclass != US_SC_SCSI ||
		interf->desc.interf_protocol != US_PR_BULK) {
		return 0;
	}

	/* step2: init udisk struction */
	memset(udisk, 0, sizeof(struct stor_dev));
	udisk->ifnum = ifnum;
	udisk->pusb_dev = dev;
	udisk->target = dev->devnum;
	udisk->scmd = &usb_scsicmd;
	udisk->stor_trans = hiusb_stor_transport;
	udisk->stor_read = hiusb_stor_read;


	/* init endpoint address */
	for (i = 0; (i < interf->desc.endp_num)&&(i <MAXENDPOINTS); i++) {
		if ((interf->ep_desc[i].Attributes &
		     ENDPOINT_XFERTYPE_MASK) == ENDPOINT_XFER_BULK) {
			if (interf->ep_desc[i].EndpointAddress & DIR_IN)
				udisk->ep_in = interf->ep_desc[i].EndpointAddress &
					ENDPOINT_NUMBER_MASK;
			else
				udisk->ep_out = interf->ep_desc[i].EndpointAddress &
					ENDPOINT_NUMBER_MASK;
		}

	}

	if ( !udisk->ep_in || !udisk->ep_out) {
		printf(" the udisk has no in/out ep \n");
		return 0;
	}

	dev->privptr = (void *)udisk;

	return 1;
}
/******************************************************************************/

int hiusb_stor_get_info(struct usbdevice *dev, struct stor_dev *udisk)
{
	unsigned char perq, modi;

	unsigned long cap[2];
	unsigned char usb_stor_buf[36];
	unsigned long *capacity, *blksz;
	scsicmd *scmd;

	scmd = udisk->scmd;
	scmd->pdata = usb_stor_buf;

	udisk->target = dev->devnum;
	scmd->lun = udisk->lun;

	if (hiusb_scsi_inquiry(udisk))  {
		return -1;
	}

	perq = usb_stor_buf[0];
	modi = usb_stor_buf[1];

	if ((perq & 0x1f) == 0x1f) {
		return 0;
	}
	if ((modi&0x80) == 0x80) {
		udisk->removable = 1;
	}

	if (hiusb_scsi_test_ready(udisk)) {
		printf("Device NOT ready\n"
		       "   Request Sense returned %02X %02X %02X\n",
		       scmd->sense_buf[2], scmd->sense_buf[12],
		       scmd->sense_buf[13]);
		if (udisk->removable == 1) {
			return 1;
		}
		return 0;
	}

	scmd->pdata = (unsigned char *)&cap[0];
	memset(scmd->pdata, 0, 8);
	if (hiusb_scsi_read_capacity(udisk) != 0) {
		printf("READ_CAP ERROR\n");
		cap[0] = 2880;
		cap[1] = 0x200;
	}
#define uswap_32(x) \
	((((x) & 0xff000000) >> 24) | \
	 (((x) & 0x00ff0000) >>  8) | \
	 (((x) & 0x0000ff00) <<  8) | \
	 (((x) & 0x000000ff) << 24))
	 
	cap[0] = uswap_32(cap[0]);
	cap[1] = uswap_32(cap[1]);
	
	cap[0] += 1;
	capacity = &cap[0];
	blksz = &cap[1];

	udisk->lba = *capacity;
	udisk->blksz = *blksz;

	return 1;
}
/******************************************************************************/

void hiusb_stor_scan (void)
{
	u8 i;
	struct usbdevice *dev;

	usb_max_stor = 0;

	for (i = 0; i < MAX_DEVICE; i++) {
		dev = hiusb_get_device(i); 
		if (dev == NULL)
			break;
	
		if (hiusb_stor_probe(dev, &usb_stor[usb_max_stor], 0)) {
			if (hiusb_stor_get_info(dev, &usb_stor[usb_max_stor]) == 1) {
				usb_max_stor++;
			}

			if (usb_max_stor == USB_MAX_STOR_DEV) {
				printf("max USB Storage Device reached: %d stopping\n",
				usb_max_stor);
			}
	 	}
	}
}
/******************************************************************************/
int hiusb_stor_get_max(void)
{
	return usb_max_stor;
}

/******************************************************************************/
struct stor_dev* hiusb_stor_get_udisk(int index)
{
	if (index >= usb_max_stor)
		return NULL;
	else
		return &usb_stor[index];
}

