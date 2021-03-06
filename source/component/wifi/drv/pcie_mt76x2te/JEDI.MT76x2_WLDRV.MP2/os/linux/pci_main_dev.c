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

#include "mt76x2_version.h"
#include "rtmp_comm.h"
#include "rt_os_util.h"
#include "rt_os_net.h"
#include <linux/pci.h>

/* Ralink PCI device table, include all supported chipsets */
static struct pci_device_id rt_pci_tbl[] = {
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3091_PCIe_DEVICE_ID)},
#ifdef RT2860
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC2860_PCI_DEVICE_ID)},	/*RT28602.4G */
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC2860_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC2760_PCI_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC2790_PCIe_DEVICE_ID)},
	{PCI_DEVICE(VEN_AWT_PCI_VENDOR_ID, VEN_AWT_PCIe_DEVICE_ID)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7708)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7728)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7758)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7727)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7738)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7748)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7768)},
#endif /* RT2860 */
#ifdef RT3090
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3090_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3091_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3092_PCIe_DEVICE_ID)},
#endif /* RT3090 */
#ifdef RT35xx
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3062_PCI_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3562_PCI_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3060_PCI_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3592_PCIe_DEVICE_ID)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7711)},
	{PCI_DEVICE(EDIMAX_PCI_VENDOR_ID, 0x7722)},
#endif /* RT35xx */
#ifdef RT3390
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3390_PCIe_DEVICE_ID)},
#endif /* RT3390 */
#ifdef RT3593
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3593_PCI_OR_PCIe_DEVICE_ID)},
#endif /* RT3593 */
#ifdef RT5390
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC5390_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC539F_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC5392_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC5362_PCI_DEVICE_ID)},
	{PCI_DEVICE(DLINK_PCI_VENDOR_ID, 0x3C05)},
#endif /* RT5390 */
#ifdef RT5392
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC5392_PCIe_DEVICE_ID)},
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC5362_PCI_DEVICE_ID)},
	{PCI_DEVICE(DLINK_PCI_VENDOR_ID, 0x3C06)},
#endif /* RT5392 */
#ifdef RT5592
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC5592_PCIe_DEVICE_ID)},
#endif /* RT5592 */
#ifdef RT3290
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC3290_PCIe_DEVICE_ID)},
#endif /* RT3290 */
#ifdef RT8592
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC8592_PCIe_DEVICE_ID)},
#endif /* RT8592 */
#ifdef MT7601E
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC7601_PCIe_DEVICE_ID)},
#endif /* MT7601E */
#ifdef MT76x0
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7650_PCIe_DEVICE_ID)},
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7610_PCIe_DEVICE_ID)},
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7630_PCIe_DEVICE_ID)},
#ifdef CONFIG_FPGA_MODE
	{PCI_DEVICE(NIC_PCI_VENDOR_ID, NIC6390_PCIe_DEVICE_ID)},
#endif /* CONFIG_FPGA_MODE */
#endif /* MT76x0 */
#ifdef MT76x2
	{PCI_DEVICE(0x1400, NIC7650_PCIe_DEVICE_ID)},
	{PCI_DEVICE(0x1400, NIC7662_PCIe_DEVICE_ID)},
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7662_PCIe_DEVICE_ID)},
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7632_PCIe_DEVICE_ID)},
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7612_PCIe_DEVICE_ID)},
	{PCI_DEVICE(MTK_PCI_VENDOR_ID, NIC7602_PCIe_DEVICE_ID)},
#endif /* MT76x2 */
	{}			/* terminate list */
};

MODULE_DEVICE_TABLE(pci, rt_pci_tbl);

/***************************************************************************
 *
 *	PCI device initialization related procedures.
 *
 ***************************************************************************/
#ifdef CONFIG_PM

#if LINUX_VERSION_CODE <= KERNEL_VERSION(2, 6, 10)
#define pm_message_t u32
#endif /* endif */

static int rt_pci_suspend(struct pci_dev *pci_dev, pm_message_t state)
{
	struct net_device *net_dev = pci_get_drvdata(pci_dev);
	VOID *pAd = NULL;
	INT32 retval = 0;
#if defined(NEW_WOW_SUPPORT)
	UCHAR wow_enable;
#endif


	DBGPRINT(RT_DEBUG_TRACE, ("===>%s()\n", __func__));

	if (net_dev == NULL) {
		DBGPRINT(RT_DEBUG_ERROR, ("net_dev == NULL!\n"));
	} else {
		ULONG IfNum;

		GET_PAD_FROM_NET_DEV(pAd, net_dev);

		/* we can not use IFF_UP because ra0 down but ra1 up */
		/* and 1 suspend/resume function for 1 module, not for each interface */
		/* so Linux will call suspend/resume function once */
		RTMP_DRIVER_VIRTUAL_INF_NUM_GET(pAd, &IfNum);
		if (IfNum > 0) {
			/* avoid users do suspend after interface is down */

			/* stop interface */
			netif_carrier_off(net_dev);
			netif_stop_queue(net_dev);

			/* mark device as removed from system and therefore no longer available */
			netif_device_detach(net_dev);

#if defined(NEW_WOW_SUPPORT)
			RTMP_DRIVER_ADAPTER_RT28XX_WOW_READY(pAd, &wow_enable);
			if (wow_enable) {
				RTMP_DRIVER_ADAPTER_RT28XX_WOW_ENABLE(pAd);
			} else
#endif /* defined(NEW_WOW_SUPPORT) */
			{
				/* mark halt flag */
/*				RTMP_SET_FLAG(pAd, fRTMP_ADAPTER_HALT_IN_PROGRESS); */
/*				RTMP_SET_FLAG(pAd, fRTMP_ADAPTER_RADIO_OFF); */
				RTMP_DRIVER_PCI_SUSPEND(pAd);

				/* take down the device */
				rt28xx_close((PNET_DEV)net_dev);
			}
			RT_MOD_DEC_USE_COUNT();
		}
	}

#if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 10)
	/*
	 * reference to http://vovo2000.com/type-lab/linux/kernel-api/linux-kernel-api.html
	 * enable device to generate PME# when suspended
	 * pci_choose_state(): Choose the power state of a PCI device to be suspended
	 */
	retval = pci_enable_wake(pci_dev, pci_choose_state(pci_dev, state), 1);
	/* save the PCI configuration space of a device before suspending */
	pci_save_state(pci_dev);
	/* disable PCI device after use */
	pci_disable_device(pci_dev);

	retval = pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
#endif /* endif */

	DBGPRINT(RT_DEBUG_TRACE, ("<===%s()\n", __func__));
	return retval;
}

static int rt_pci_resume(struct pci_dev *pci_dev)
{
	struct net_device *net_dev = pci_get_drvdata(pci_dev);
	VOID *pAd = NULL;
#if defined(NEW_WOW_SUPPORT)
		UCHAR wow_is_running;
#endif /* (defined(WOW_SUPPORT) && defined(RTMP_MAC_USB)) || defined(NEW_WOW_SUPPORT) */

#if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 10)
	INT32 retval;

	retval = pci_set_power_state(pci_dev, PCI_D0);

	/* restore the saved state of a PCI device */
	pci_restore_state(pci_dev);

	/* initialize device before it's used by a driver */
	if (pci_enable_device(pci_dev)) {
		DBGPRINT(RT_DEBUG_ERROR, ("pci enable fail!\n"));
		return 0;
	}
#endif /* endif */

	DBGPRINT(RT_DEBUG_TRACE, ("===>%s()\n", __func__));

	if (net_dev == NULL)
		DBGPRINT(RT_DEBUG_ERROR, ("net_dev == NULL!\n"));
	else
		GET_PAD_FROM_NET_DEV(pAd, net_dev);

	if (pAd != NULL) {
		ULONG IfNum;

		/*
		 * we can not use IFF_UP because ra0 down but ra1 up
		 * and 1 suspend/resume function for 1 module, not for each interface
		 * so Linux will call suspend/resume function once
		 */
		RTMP_DRIVER_VIRTUAL_INF_NUM_GET(pAd, &IfNum);
/*		if (VIRTUAL_IF_NUM(pAd) > 0) */
		if (IfNum > 0) {
			/* mark device as attached from system and restart if needed */
			netif_device_attach(net_dev);

#if defined(NEW_WOW_SUPPORT)
			RTMP_DRIVER_ADAPTER_RT28XX_WOW_RUNSTATUS(pAd, &wow_is_running);
			if (wow_is_running) {
				RTMP_DRIVER_ADAPTER_RT28XX_WOW_DISABLE(pAd);
			} else
#endif /* defined(NEW_WOW_SUPPORT) */
			{
				if (rt28xx_open((PNET_DEV)net_dev) != 0) {
					/* open fail */
					DBGPRINT(RT_DEBUG_TRACE,
						 ("<===%s()\n", __func__));
					return 0;
				}
			}

			/* increase MODULE use count */
			RT_MOD_INC_USE_COUNT();

/*			RTMP_CLEAR_FLAG(pAd, fRTMP_ADAPTER_HALT_IN_PROGRESS); */
/*			RTMP_CLEAR_FLAG(pAd, fRTMP_ADAPTER_RADIO_OFF); */
			RTMP_DRIVER_PCI_RESUME(pAd);

			netif_start_queue(net_dev);
			netif_carrier_on(net_dev);
			netif_wake_queue(net_dev);
		}
	}

	DBGPRINT(RT_DEBUG_TRACE, ("<=== %s()\n", __func__));
	return 0;
}
#endif /* CONFIG_PM */

/*
 *	PCI device probe & initialization function
 */
static int rt_pci_probe(struct pci_dev *pdev,
				const struct pci_device_id *pci_id)
{
	void *pAd = NULL;
	struct os_cookie *handle;
	struct net_device *net_dev;
	const char *print_name;
	unsigned long csr_addr;
	int rv = 0;
	RTMP_OS_NETDEV_OP_HOOK netDevHook;
	unsigned long OpMode;

	DBGPRINT(RT_DEBUG_TRACE, ("===> %s()\n", __func__));

/*PCIDevInit============================================== */
	/* wake up and enable device */
	rv = pci_enable_device(pdev);
	if (rv != 0) {
		DBGPRINT(RT_DEBUG_ERROR,
			 ("Enable PCI device failed, errno=%d!\n", rv));
		return rv;
	}

	print_name = pci_name(pdev);
	rv = pci_request_regions(pdev, print_name);

	if (rv) {
		DBGPRINT(RT_DEBUG_ERROR,
			 ("Request PCI resource failed, errno=%d!\n", rv));
		goto err_out;
	}

	/* map physical address to virtual address for accessing register */
	csr_addr =
	    (unsigned long)ioremap(pci_resource_start(pdev, 0),
				   pci_resource_len(pdev, 0));
	if (!csr_addr) {
		DBGPRINT(RT_DEBUG_ERROR,
			 ("ioremap failed for device %s, region 0x%lX @ 0x%lX\n",
			  print_name, (ULONG)pci_resource_len(pdev, 0),
			  (ULONG)pci_resource_start(pdev, 0)));
		goto err_out_free_res;
	} else
		DBGPRINT(RT_DEBUG_TRACE, ("%s: at 0x%lx, VA 0x%lx, IRQ %d.\n",
					  print_name,
					  (ULONG)pci_resource_start(pdev, 0),
					  (ULONG)csr_addr, pdev->irq));

	/* Set DMA master */
	pci_set_master(pdev);

	/* Allocate RTMP_ADAPTER adapter structure */
	handle = RtmpOsVmalloc(sizeof(struct os_cookie));
	if (!handle) {
		DBGPRINT(RT_DEBUG_ERROR,
			 ("%s(): Allocate memory for os handle failed!\n",
			  __func__));
		goto err_out_iounmap;
	}
	memset(handle, 0, sizeof(struct os_cookie));

	handle->pci_dev = pdev;

#if defined(CCN3_STB)
	if (IS_ENABLED(CONFIG_ARM64) && (!IS_ENABLED(CONFIG_ZONE_DMA))) {
		rv = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
		if (rv != 0) {
			DBGPRINT(RT_DEBUG_ERROR, ("set DMA consistent mask failed!errno=%d\n", rv));
			return rv;
		}
	}
#endif

	/* we may need the pdev for allocate structure of "RTMP_ADAPTER" */
	rv = RTMPAllocAdapterBlock(handle, &pAd);
	if (rv != NDIS_STATUS_SUCCESS)
		goto err_out_iounmap;

	RTMP_DRIVER_PCI_CSR_SET(pAd, csr_addr);

	RTMP_DRIVER_PCIE_INIT(pAd, pdev);

/*NetDevInit============================================== */
	net_dev = RtmpPhyNetDevInit(pAd, &netDevHook);
	if (net_dev == NULL)
		goto err_out_free_radev;

	/* Here are the net_device structure with pci-bus specific parameters. */
	net_dev->irq = pdev->irq;	/* Interrupt IRQ number */
	net_dev->base_addr = csr_addr;	/* Save CSR virtual address and irq to device structure */
	pci_set_drvdata(pdev, net_dev);	/* Set driver data */

#ifdef NATIVE_WPA_SUPPLICANT_SUPPORT
/* for supporting Network Manager */
	/*
	 * Set the sysfs physical device reference for the network logical device
	 * if set prior to registration will cause a symlink during initialization.
	 */
	SET_NETDEV_DEV(net_dev, &(pdev->dev));
#endif /* NATIVE_WPA_SUPPLICANT_SUPPORT */

/*All done, it's time to register the net device to linux kernel. */
	/* Register this device */
#ifdef RT_CFG80211_SUPPORT
	{
/*	pAd->pCfgDev = &(pdev->dev); */
/*	pAd->CFG80211_Register = CFG80211_Register; */
/*	RTMP_DRIVER_CFG80211_INIT(pAd, pdev); */

		/*
		 *  In 2.6.32, cfg80211 register must be before register_netdevice();
		 *  We can not put the register in rt28xx_open();
		 *  Or you will suffer NULL pointer in list_add of
		 *  cfg80211_netdev_notifier_call().
		 */
		CFG80211_Register(pAd, &(pdev->dev), net_dev);
	}
#endif /* RT_CFG80211_SUPPORT */

	RTMP_DRIVER_OP_MODE_GET(pAd, &OpMode);
	rv = RtmpOSNetDevAttach(OpMode, net_dev, &netDevHook);
	if (rv)
		goto err_out_free_netdev;

#ifdef CONFIG_STA_SUPPORT
/*	pAd->StaCfg.OriDevType = net_dev->type; */
	RTMP_DRIVER_STA_DEV_TYPE_SET(pAd, net_dev->type);
#endif /* CONFIG_STA_SUPPORT */

#ifdef PRE_ASSIGN_MAC_ADDR
	{
		UCHAR mac_addr[MAC_ADDR_LEN];

		RTMP_DRIVER_MAC_ADDR_GET(pAd, &mac_addr[0]);
		DBGPRINT(RT_DEBUG_TRACE,
			 ("@%s MAC address: %02x:%02x:%02x:%02x:%02x:%02x\n",
			  __func__, mac_addr[0], mac_addr[1], mac_addr[2],
			  mac_addr[3], mac_addr[4], mac_addr[5]));
		/* Set up the Mac address */
		RtmpOSNetDevAddrSet(OpMode, net_dev, &mac_addr[0], NULL);
	}
#endif /* PRE_ASSIGN_MAC_ADDR */

	DBGPRINT(RT_DEBUG_TRACE, ("<=== %s()\n", __func__));

	return 0;		/* probe ok */

	/* --------------------------- ERROR HANDLE --------------------------- */
err_out_free_netdev:
	RtmpOSNetDevFree(net_dev);
	net_dev = NULL;

err_out_free_radev:
	/* free RTMP_ADAPTER strcuture and os_cookie */
	RTMPFreeAdapter(pAd);

err_out_iounmap:
	iounmap((void *)(csr_addr));
	release_mem_region(pci_resource_start(pdev, 0),
			   pci_resource_len(pdev, 0));

err_out_free_res:
	pci_release_regions(pdev);

err_out:
	pci_disable_device(pdev);

	DBGPRINT(RT_DEBUG_ERROR, ("<=== %s() failed with rv = %d!\n",
				  __func__, rv));

	return -ENODEV;		/* probe fail */
}

static VOID rt_pci_remove(struct pci_dev *pci_dev)
{
	PNET_DEV net_dev = pci_get_drvdata(pci_dev);
	VOID *pAd = NULL;
	ULONG csr_addr = net_dev->base_addr;

	GET_PAD_FROM_NET_DEV(pAd, net_dev);

	DBGPRINT(RT_DEBUG_TRACE, ("===> %s()\n", __func__));

	if (pAd != NULL) {
		/* Unregister/Free all allocated net_device. */
		RtmpPhyNetDevExit(pAd, net_dev);

#ifdef RT_CFG80211_SUPPORT
		RTMP_DRIVER_80211_UNREGISTER(pAd, net_dev);
#endif /* RT_CFG80211_SUPPORT */

		/* Free RTMP_ADAPTER related structures. */
		RtmpRaDevCtrlExit(pAd);

		/* Unmap CSR base address */
		iounmap((char *)(csr_addr));

		/* release memory region */
		release_mem_region(pci_resource_start(pci_dev, 0),
				   pci_resource_len(pci_dev, 0));
	} else {
		/* Unregister network device */
		RtmpOSNetDevDetach(net_dev);

		/* Unmap CSR base address */
		iounmap((char *)(net_dev->base_addr));

		/* release memory region */
		release_mem_region(pci_resource_start(pci_dev, 0),
				   pci_resource_len(pci_dev, 0));
	}

	/* Free the root net_device */
	RtmpOSNetDevFree(net_dev);
	net_dev = NULL;
}

/*
 *	Our PCI driver structure
 */
static struct pci_driver rt_pci_driver = {
name:RTMP_DRV_NAME,
id_table:rt_pci_tbl,
probe:rt_pci_probe,
remove:rt_pci_remove,

#ifdef CONFIG_PM
suspend:rt_pci_suspend,
resume:rt_pci_resume,
#endif /* endif */
};

/*
 *	Driver module load/unload function
 */
int __init rt_pci_init_module(void)
{
	DBGPRINT(RT_DEBUG_OFF, ("register %s\n", RTMP_DRV_NAME));
/*
 *	DBGPRINT(RT_DEBUG_ERROR, ("DriverVersion: 2.7.0.2-Beta-121007\n"
 *								"\tBBP:120824\n"
 *								"\tRF :120813\n"));
 */

	return pci_register_driver(&rt_pci_driver);
}

void __exit rt_pci_cleanup_module(void)
{
	pci_unregister_driver(&rt_pci_driver);
}

#ifndef MULTI_INF_SUPPORT
module_init(rt_pci_init_module);
module_exit(rt_pci_cleanup_module);

MODULE_LICENSE("Dual BSD/GPL");

#ifdef MODULE_VERSION
MODULE_VERSION(DRIVER_VERSION);
#endif /* endif */

#endif /* MULTI_INF_SUPPORT */
