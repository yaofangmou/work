/*
  * Copyright (c) 2016 MediaTek Inc.  All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
  * General Public License (GPL) Version 2, available from the file
  * COPYING in the main directory of this source tree, or the
  * BSD license below:
  *
  *     Redistribution and use in source and binary forms, with or
  *     without modification, are permitted provided that the following
  *     conditions are met:
  *
  *      - Redistributions of source code must retain the above
  *        copyright notice, this list of conditions and the following
  *        disclaimer.
  *
  *      - Redistributions in binary form must reproduce the above
  *        copyright notice, this list of conditions and the following
  *        disclaimer in the documentation and/or other materials
  *        provided with the distribution.
  *
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
  * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
  * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  */


#define RTMP_MODULE_OS

#include "rt_config.h"
#include "rtmp_comm.h"
#include "rt_os_util.h"
#include "rt_os_net.h"

#ifdef RT_CFG80211_ANDROID_PRIV_LIB_SUPPORT

#define ANDROID_CMD_P2P_DEV_ADDR		"P2P_DEV_ADDR"
#define ANDROID_CMD_SET_AP_WPS_P2P_IE	"SET_AP_WPS_P2P_IE"

struct android_wifi_priv_cmd {
	char *buf;
	int used_len;
	int total_len;
};

static INT priv_cmd_get_p2p_dev_addr(PNET_DEV net_dev, PCHAR command, INT total_len)
{
	VOID *pAdSrc;
	PRTMP_ADAPTER pAd;
	INT bytes_written = 0;

	pAdSrc = RTMP_OS_NETDEV_GET_PRIV(net_dev);
	ASSERT(pAdSrc);

	pAd = (PRTMP_ADAPTER)pAdSrc;
	
	COPY_MAC_ADDR(command, pAd->cfg80211_ctrl.P2PCurrentAddress);
	bytes_written = MAC_ADDR_LEN;
	
	return bytes_written;
}

static INT priv_cmd_set_ap_wps_p2p_ie(PNET_DEV net_dev, PCHAR buf, INT len, INT type)
{
	//0x1: BEACON
	//0x2: PROBE_RESP
	//0x4: ASSOC_RESP

	INT ret = 0;

	return ret;
}

int rt_android_private_command_entry(
	VOID *pAdSrc, PNET_DEV net_dev, struct ifreq *ifr, INT cmd)	   
{
	struct android_wifi_priv_cmd priv_cmd;
	UCHAR *command = NULL;
	INT ret = 0, bytes_written = 0;

	if (!ifr->ifr_data) 
		return -EINVAL;
	
	if (copy_from_user(&priv_cmd, ifr->ifr_data, sizeof(priv_cmd)))
		return -EFAULT;

	os_alloc_mem(NULL, (UCHAR **)&command, priv_cmd.total_len);
	if (!command)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("%s: MEM ALLOC ERROR\n", __FUNCTION__));
		return -ENOMEM;
	}
	
	if (copy_from_user(command, priv_cmd.buf, priv_cmd.total_len)) 
	{
		ret = -EFAULT;
		goto FREE;
	}

	if (strnicmp(command, ANDROID_CMD_SET_AP_WPS_P2P_IE, strlen(ANDROID_CMD_SET_AP_WPS_P2P_IE)) == 0) 
	{
		int skip = strlen(ANDROID_CMD_SET_AP_WPS_P2P_IE) + 3;
		bytes_written = priv_cmd_set_ap_wps_p2p_ie(net_dev, command + skip,
							priv_cmd.total_len - skip, *(command + skip - 2) - '0');
	}
	else if (strnicmp(command, ANDROID_CMD_P2P_DEV_ADDR, strlen(ANDROID_CMD_P2P_DEV_ADDR)) == 0) 
	{		
		bytes_written = priv_cmd_get_p2p_dev_addr(net_dev, command, priv_cmd.total_len);
	} 
	else
	{
		DBGPRINT(RT_DEBUG_ERROR, ("%s: unsupport priv_cmd !!!\n", command));
		snprintf(command, 3, "OK");
		bytes_written = strlen("OK");
	}

	if (bytes_written >= 0) 
	{
		/* priv_cmd in but no response */
		if ((bytes_written == 0) && (priv_cmd.total_len > 0))
			command[0] = '\0';
		
		if (bytes_written >= priv_cmd.total_len) 
		{
			bytes_written = priv_cmd.total_len;
		} 
		else 
		{
			bytes_written++;
		}
		priv_cmd.used_len = bytes_written;
		
		if (copy_to_user(priv_cmd.buf, command, bytes_written)) 
			ret = -EFAULT;
	}
	else 
	{
		ret = bytes_written;
	}

FREE:
	if (command) 
		os_free_mem(NULL, command);

	return ret;
}
#endif /* RT_CFG80211_ANDROID_PRIV_LIB_SUPPORT */
