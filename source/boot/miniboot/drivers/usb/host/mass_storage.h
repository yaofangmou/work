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
#ifndef _HIUSB_MASS_STORAGE_H_
#define _HIUSB_MASS_STORAGE_H_
#include <stddef.h>

#define USB_MAX_STOR_DEV          5
#define US_BBB_RESET		0xff
#define USB_CLASS_MASS_STORAGE   8
#define US_SC_SCSI             6		
#define US_PR_BULK             0x50

#define USB_MAX_XFER_BLK(start, blksz)	(((4096 * 5) - (start % 4096)) / blksz)

#define SCSI_CMD_LENGTH     0x0c
#define SCSI_SENSE_LENGTH  0x20
#define SCSI_CBW_SIZE		31
#define SCSI_CSW_SIZE		13

#define SCSI_CMD_INQUIRY	0x12	
#define SCSI_CMD_REQ_SENSE	0x03
#define SCSI_CMD_TST_RDY	0x00
#define SCSI_CMD_READ		0x28
#define SCSI_CMD_READ_CAP	0x25

#define CBW_SIGNATURE	0x43425355
#define CBW_FLAGS_OUT	0x00
#define CBW_FLAGS_IN	0x80

#define CSW_SIGNATURE	0x53425355
#define CSW_STATUS_FAILED 0x1
#define CSW_STATUS_PHASE 0x2

#define TRANSPORT_GOOD	   0
#define TRANSPORT_FAILED -1

typedef struct scsi_cmd {
	unsigned char		cmd_buf[SCSI_CMD_LENGTH];	
	unsigned char		sense_buf[SCSI_SENSE_LENGTH];
	unsigned char		lun;
	unsigned char		cmdlen;
	unsigned long		datalen;
	unsigned char	*	pdata;
} scsicmd;

typedef struct cmd_block_wrapper{
	u32		signature;
	u32		tag;
	u32		data_len;
	u8		flags;
	u8		lun;
	u8		length;
	u8		cdb[16];
} cbw_t;

typedef struct cmd_status_wrapper {
	u32		signature;
	u32		tag;
	u32		dataresidue;
	u8		status;
} csw_t;

typedef  struct stor_dev {
	struct usbdevice *pusb_dev;
	unsigned char	ifnum;
	unsigned char	ep_in;
	unsigned char	ep_out;
	unsigned char	target;
	unsigned char	lun;
	unsigned char	removable;
	unsigned long	lba;
	unsigned long	blksz;

	scsicmd *scmd;
	void		*priv;

	int (*stor_trans)(struct stor_dev *udisk, scsicmd *scmd);
	unsigned long (*stor_read)(int target, unsigned long blknr, unsigned long blkcnt, void * buffer);
} udisk;

void hiusb_stor_scan (void);
int hiusb_stor_get_max(void);
struct stor_dev* hiusb_stor_get_udisk(int index);
#endif /*_HIUSB_MASS_STORAGE_H_ */
