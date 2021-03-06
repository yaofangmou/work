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


/****************************************************************************

	Abstract:

	All MAC80211/CFG80211 Related Structure & Definition.

***************************************************************************/
#ifndef __CFG80211_H__
#define __CFG80211_H__

#ifdef RT_CFG80211_SUPPORT

#include <linux/ieee80211.h>

#ifdef CFG_CFG80211_VERSION
#define CFG80211_VERSION_CODE CFG_CFG80211_VERSION
#else
#define CFG80211_VERSION_CODE LINUX_VERSION_CODE
#endif

#if KERNEL_VERSION(4, 7, 0) <= CFG80211_VERSION_CODE
/**
 * enum nl80211_band - Frequency band
 * @NL80211_BAND_2GHZ: 2.4 GHz ISM band
 * @NL80211_BAND_5GHZ: around 5 GHz band (4.9 - 5.7 GHz)
 * @NL80211_BAND_60GHZ: around 60 GHz band (58.32 - 64.80 GHz)
 * @NUM_NL80211_BANDS: number of bands, avoid using this in userspace
 *	 since newer kernel versions may support more bands
 */
#define KAL_BAND_2GHZ NL80211_BAND_2GHZ
#define KAL_BAND_5GHZ NL80211_BAND_5GHZ
#define KAL_NUM_BANDS NUM_NL80211_BANDS
#else
#define KAL_BAND_2GHZ IEEE80211_BAND_2GHZ
#define KAL_BAND_5GHZ IEEE80211_BAND_5GHZ
#define KAL_NUM_BANDS IEEE80211_NUM_BANDS
#endif

extern UCHAR Cfg80211_Chan[];
extern const int Num_Cfg80211_Chan;

#define RT_REG_RULE(regr, start, end, bw, gain, eirp, reg_flags) \
	do {                                                \
		regr.freq_range.start_freq_khz = MHZ_TO_KHZ(start);	\
		regr.freq_range.end_freq_khz = MHZ_TO_KHZ(end);	\
		regr.freq_range.max_bandwidth_khz = MHZ_TO_KHZ(bw);	\
		regr.power_rule.max_antenna_gain = DBI_TO_MBI(gain);\
		regr.power_rule.max_eirp = DBM_TO_MBM(eirp);	\
		regr.flags = reg_flags;                         \
	} while (0)

typedef enum _NDIS_HOSTAPD_STATUS {
	Hostapd_Diable = 0,
	Hostapd_EXT,
	Hostapd_CFG
} NDIS_HOSTAPD_STATUS, *PNDIS_HOSTAPD_STATUS;

#ifdef JUNGLE_SUPPORT
/*  the following define just for compile, please follow the definition of include/cfg80211.h
*	the value only sync with kernel 3.10
*/
#define IEEE80211_CHAN_PASSIVE_SCAN	(1<<1)
#define IEEE80211_CHAN_RADAR (1<<3)
struct _CH_FLAGS_BEACON {
	UCHAR ch;
	UINT32 flags;
};
#endif

typedef struct __CFG80211_CB {

	/* we can change channel/rate information on the fly so we backup them */
	struct ieee80211_supported_band Cfg80211_bands[KAL_NUM_BANDS];
	struct ieee80211_channel *pCfg80211_Channels;
	struct ieee80211_rate *pCfg80211_Rates;

	/* used in wiphy_unregister */
	struct wireless_dev *pCfg80211_Wdev;

	/* used in scan end */
	struct cfg80211_scan_request *pCfg80211_ScanReq;

	/* monitor filter */
	UINT32 MonFilterFlag;
#ifdef JUNGLE_SUPPORT
	struct _CH_FLAGS_BEACON *ch_flags_by_beacon;
#endif
	/* channel information */
	struct ieee80211_channel ChanInfo[MAX_NUM_OF_CHANNELS];

	/* to protect scan status */
	spinlock_t scan_notify_lock;

	BOOLEAN ScanIsAborted;   /*MLME BUSY*/

} CFG80211_CB;

/*
========================================================================
Routine Description:
	Register MAC80211 Module.

Arguments:
	pAd				- WLAN control block pointer
	pDev			- Generic device interface
	pNetDev			- Network device

Return Value:
	NONE

Note:
	pDev != pNetDev
	#define SET_NETDEV_DEV(net, pdev)	((net)->dev.parent = (pdev))

	Can not use pNetDev to replace pDev; Or kernel panic.
========================================================================
*/
BOOLEAN CFG80211_Register(VOID *pAd, struct device *pDev, struct net_device *pNetDev);

/**
 * kalCfg80211ScanDone - abstraction of cfg80211_scan_done
 *
 * @request: the corresponding scan request (sanity checked by callers!)
 * @aborted: set to true if the scan was aborted for any reason,
 *	userspace will be notified of that
 *
 * Since linux-4.8.y the 2nd parameter is changed from bool to
 * struct cfg80211_scan_info, but we don't use all fields yet.
 */
#if KERNEL_VERSION(4, 8, 0) <= CFG80211_VERSION_CODE
static inline void kalCfg80211ScanDone(struct cfg80211_scan_request *request,
				       bool aborted)
{
	struct cfg80211_scan_info info = { .aborted = aborted };

	cfg80211_scan_done(request, &info);
}
#else
static inline void kalCfg80211ScanDone(struct cfg80211_scan_request *request,
				       bool aborted)
{
	cfg80211_scan_done(request, aborted);
}
#endif

#endif /* RT_CFG80211_SUPPORT */

#endif /* __CFG80211_H__ */

/* End of cfg80211.h */
