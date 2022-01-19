#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(CURDIR)/..
include $(SDK_DIR)/base.mak
endif

#***********************************************************************************
#   varibale
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++

#***********************************************************************************
#   rule
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++
.PHONY: all clean load unload
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++
all: load unload

load:
	$(AT)test -d $(HI_MODULE_DIR) || mkdir -p $(HI_MODULE_DIR)
	$(AT)rm -rf $(HI_MODULE_DIR)/load
ifneq ($(CFG_HI_MSP_BUILDIN),y)
    ifneq ($(CFG_HI_KEYLED_CT1642_KERNEL_SUPPORT),y)
		$(AT)echo "insmod hi_media.ko" >> $(HI_MODULE_DIR)/load
    endif

	$(AT)echo "insmod hi_mmz.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_common.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_pdm.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_pq.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_cipher.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_hdmi.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_vou.ko" >> $(HI_MODULE_DIR)/load

	$(AT)echo "insmod hi_gpio.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_GPIOI2C_SUPPORT),y)
		$(AT)echo "insmod hi_gpio_i2c.ko i2cmode=2" >> $(HI_MODULE_DIR)/load
    endif

	$(AT)echo "insmod hi_i2c.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_tde.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_otp.ko" >> $(HI_MODULE_DIR)/load

ifeq ($(CFG_HI_DEMUX_SUPPORT),y)
	$(AT)echo "insmod hi_demux.ko" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_TSIO_SUPPORT),y)
	$(AT)echo "insmod hi_tsio.ko" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_PLCIPHER_SUPPORT),y)
	$(AT)echo "insmod hi_plcipher.ko" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_ADVCA_TYPE),NAGRA)
	$(AT)echo "insmod hi_cert.ko" >> $(HI_MODULE_DIR)/load
endif

	$(AT)echo "insmod hi_adec.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_vfmw.ko" >> $(HI_MODULE_DIR)/load
ifneq ($(CFG_HI_CHIP_TYPE), hi3716mv430)
	$(AT)echo "insmod hi_vpss.ko" >> $(HI_MODULE_DIR)/load
endif
	$(AT)echo "insmod hi_vdec.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_adsp.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_aiao.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod hi_sync.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_PVR_SUPPORT),y)
		$(AT)echo "insmod hi_pvr.ko" >> $(HI_MODULE_DIR)/load
    endif

	$(AT)echo "insmod hi_mce.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
		$(AT)echo "insmod hi_tuner.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_PWM_SUPPORT),y)
		$(AT)echo "insmod hi_pwm.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifndef CFG_HI_ADVCA_FUNCTION
		$(AT)echo "# About hi_fb:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  For 1920*1080, triple buffer, ARGB8888 format, use:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  insmod hi_fb.ko video=\"hi_fb:vram0_size:16200,vram4_size:2430\"" >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  For 1280*720, use:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  insmod hi_fb.ko video=\"hi_fb:vram0_size:7200,vram2_size:2430\"" >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  Insmod hi_fb.ko with no args will use defaule value,The defaule value is set by cfg.mak." >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  vram0 is memory size for HD and vram4 is for SD0. The size is calculated as below:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "#  vram0_size = (1920*1080*4*2/1024)KB; vram4_size = (720*576*2*2/1024)KB" >> $(HI_MODULE_DIR)/load
    endif
	$(AT)echo "insmod hi_fb.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_GPU_MALI400_SUPPORT),y)
		$(AT)echo "insmod mali.ko" >> $(HI_MODULE_DIR)/load
		$(AT)echo "insmod hi_dbe.ko" >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_GPU_MALI450_SUPPORT),y)
		$(AT)echo "insmod mali.ko" >> $(HI_MODULE_DIR)/load
		$(AT)echo "insmod hi_dbe.ko" >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_GPU_MALI700_SUPPORT),y)
		$(AT)echo "insmod mali_kbase.ko" >> $(HI_MODULE_DIR)/load
		$(AT)echo "insmod hi_dbe.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifneq ($(CFG_HI_IR_TYPE_LIRC),y)
		$(AT)echo "insmod hi_ir.ko" >> $(HI_MODULE_DIR)/load
    endif

	$(AT)echo "insmod hi_jpeg.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_JPGE_SUPPORT),y)
		$(AT)echo "insmod hi_jpge.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_PNG_SUPPORT),y)
		$(AT)echo "insmod hi_png.ko" >> $(HI_MODULE_DIR)/load
    endif

	$(AT)echo "insmod hi_advca.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_VENC_SUPPORT),y)
		$(AT)echo "insmod hi_venc.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_AENC_SUPPORT),y)
		$(AT)echo "insmod hi_aenc.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_KEYLED_SUPPORT),y)
		$(AT)echo "insmod hi_keyled.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_SCI_SUPPORT),y)
		$(AT)echo "insmod hi_sci.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_VI_SUPPORT),y)
		$(AT)echo "insmod hi_vi.ko" >> $(HI_MODULE_DIR)/load
    endif

	$(AT)echo "insmod hi_pmoc.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_SPI_BUS_SUPPORT),y)
		$(AT)echo "insmod hi_spi.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_ADAC_SLIC_SUPPORT),y)
		$(AT)echo "insmod hi_slic.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_CI_SUPPORT),y)
		$(AT)echo "insmod hi_ci.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_SM_SUPPORT),y)
		$(AT)echo "insmod hi_sm.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_MAILBOX_SUPPORT),y)
		$(AT)echo "insmod hi_mailbox.ko" >> $(HI_MODULE_DIR)/load
    endif

    ifeq ($(CFG_HI_LOAD_CAS_IMAGE),y)
		$(AT)echo "insmod hi_casimage.ko" >> $(HI_MODULE_DIR)/load
    endif

endif   # End of ifneq ($(CFG_HI_MSP_BUILDIN),y)

ifeq ($(CFG_HI_IR_TYPE_LIRC),y)
	$(AT)echo "insmod lirc_dev.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod lirc_serial.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "mkdir -p /var/run/lirc" >> $(HI_MODULE_DIR)/load
	$(AT)echo "mkdir -p /var/log" >> $(HI_MODULE_DIR)/load
	$(AT)echo "cat > /var/log/lircd << EOF" >> $(HI_MODULE_DIR)/load
	$(AT)echo "EOF" >> $(HI_MODULE_DIR)/load
	$(AT)echo "ln -fs /dev/lirc0 /dev/lirc" >> $(HI_MODULE_DIR)/load
	$(AT)echo "lircd -d /dev/lirc0 -o /dev/lircd -r__up" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_ADAC_TVL320AIC31_SUPPORT),y)
	$(AT)echo "insmod hi_tlv320.ko" >> $(HI_MODULE_DIR)/load
endif

	$(AT)echo "insmod ./usb/ehci-platform.ko" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod ./usb/ohci-platform.ko" >> $(HI_MODULE_DIR)/load

    ifeq ($(CFG_HI_USB3_SUPPORT),y)
		$(AT)echo "insmod ./usb/xhci-plat-hcd.ko" >> $(HI_MODULE_DIR)/load
    endif

ifeq ($(CFG_HI_SATA_SUPPORT),y)
	$(AT)echo 'if [ -e "./sata/libahci.ko" ]; then insmod ./sata/libahci.ko; fi' >> $(HI_MODULE_DIR)/load
	$(AT)echo 'if [ -e "./sata/libahci_platform.ko" ]; then insmod ./sata/libahci_platform.ko; fi' >> $(HI_MODULE_DIR)/load
	$(AT)echo 'if [ -e "./sata/ahci_platform.ko" ]; then insmod ./sata/ahci_platform.ko; fi' >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_NTFS_SUPPORT),y)
	$(AT)echo "insmod tntfs.ko" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_WIFI_SUPPORT),y)
	$(AT)echo "insmod cfg80211.ko " >> $(HI_MODULE_DIR)/load
    ifeq ($(CFG_HI_WIFI_DEVICE_RTL8188EUS),y)
		$(AT)echo "insmod rtl8188eu.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8192EU),y)
		$(AT)echo "insmod rtl8192eu.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8188FU),y)
		$(AT)echo "insmod rtl8188fu.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8812AE),y)
		$(AT)echo "insmod rtl8812ae.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8812AU),y)
		$(AT)echo "insmod rtl8812au.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8723BU),y)
		$(AT)echo "insmod rtl8723bu.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8822BU),y)
		$(AT)echo "insmod rtl8822bu.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8821AU),y)
		$(AT)echo "insmod rtl8821au.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_MT76X2U),y)
		$(AT)echo "insmod mtprealloc76x2.ko " >> $(HI_MODULE_DIR)/load
		$(AT)echo "insmod mt76x2u_sta.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_MT7662TE),y)
		$(AT)echo "insmod mt7662e_sta.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8822BEH),y)
		$(AT)echo "insmod rtl8822be.ko " >> $(HI_MODULE_DIR)/load
    else ifeq ($(CFG_HI_WIFI_DEVICE_QCA6174),y)
		$(AT)echo "insmod qca6174.ko " >> $(HI_MODULE_DIR)/load
    endif
endif

ifeq ($(CFG_GSTREAMER_SUPPORT),y)
	$(AT)echo "insmod hi_omxvdec.ko" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_DIRECTFB_MULTI_SUPPORT),y)
	$(AT)echo "# about 32bits:" >> $(HI_MODULE_DIR)/load
	$(AT)echo "# insmod fusion.ko fusion_shm_base=0x20000000" >> $(HI_MODULE_DIR)/load
	$(AT)echo "# about 64bits:" >> $(HI_MODULE_DIR)/load
	$(AT)echo "# insmod fusion.ko fusion_shm_base=0x6f00000000" >> $(HI_MODULE_DIR)/load
	$(AT)echo "insmod fusion.ko" >> $(HI_MODULE_DIR)/load
endif

	$(AT)echo "echo 2097152 > /proc/sys/net/core/rmem_max" >> $(HI_MODULE_DIR)/load

ifndef CFG_HI_ADVCA_FUNCTION
	$(AT)echo "echo 6 > /proc/sys/vm/dirty_ratio" >> $(HI_MODULE_DIR)/load # see source/msp/component/hifat/how to use.txt for detail
	$(AT)echo "echo 1 > /proc/sys/vm/overcommit_memory" >> $(HI_MODULE_DIR)/load
	$(AT)echo "echo 8192 > /proc/sys/vm/min_free_kbytes" >> $(HI_MODULE_DIR)/load
endif

ifeq ($(CFG_HI_DVFS_CPU_SUPPORT),y)
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv100 hi3796mv100 hi3716mv410 hi3716mv420),)
		$(AT)echo "echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq" >> $(HI_MODULE_DIR)/load
    endif
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv200 hi3798mv300 hi3798mv310),)
        ifeq ($(CFG_HI3716DV110H),y)
			$(AT)echo "echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq" >> $(HI_MODULE_DIR)/load
        else
			$(AT)echo "echo 1200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq" >> $(HI_MODULE_DIR)/load
        endif
    endif
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450),)
		$(AT)echo "echo 1450000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq" >> $(HI_MODULE_DIR)/load
    endif

ifeq ($(CFG_HI_NVR_SUPPORT),y)
	$(AT)echo "echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" >> $(HI_MODULE_DIR)/load
	$(AT)echo "echo 1200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed" >> $(HI_MODULE_DIR)/load
else
	$(AT)echo "echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" >> $(HI_MODULE_DIR)/load
	$(AT)echo "echo 200000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate" >> $(HI_MODULE_DIR)/load
endif
endif

ifeq ($(CFG_HI_GPU_MALI700_SUPPORT),y)
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200),)
		$(AT)echo "echo 200000000 >/sys/devices/platform/soc/f9200000.gpu/devfreq/f9200000.gpu/min_freq " >> $(HI_MODULE_DIR)/load
		$(AT)echo "echo 600000000 >/sys/devices/platform/soc/f9200000.gpu/devfreq/f9200000.gpu/max_freq " >> $(HI_MODULE_DIR)/load
    endif
endif

ifeq ($(CFG_HI_DONGLE_SUPPORT),y)
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv200 hi3798mv300 hi3798mv310),)
		$(AT)echo "echo 400000 > /sys/module/mali/parameters/mali_dvfs_max_frequency " >> $(HI_MODULE_DIR)/load
    endif
endif

ifeq ($(CFG_HI_ADVCA_RUNTIME_CHECK_ENABLE),y)
	$(AT)echo "insmod hi_runtime.ko" >> $(HI_MODULE_DIR)/load
endif

#create r/w partition for advanced ca
ifeq ($(CFG_HI_ADVCA_TYPE),NAGRA)
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450),)
		$(AT)echo "#create trusted_storage partition:" >> $(HI_MODULE_DIR)/load

		$(AT)echo "if [ -e \"/dev/mmcblk0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	#for SPI+EMMC FLASH case:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	mount -t ext4 /dev/disk/by-name/trusted_storage /mnt/trusted_storage" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	if [ \"\$$?\" != \"0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		echo y | mkfs.ext4 -q /dev/disk/by-name/trusted_storage" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		mount -t ext4 /dev/disk/by-name/trusted_storage /mnt/trusted_storage" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	fi" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	mount -t ext4 /dev/disk/by-name/data /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	if [ \"\$$?\" != \"0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		echo y | mkfs.ext4 -q /dev/disk/by-name/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		mount -t ext4 /dev/disk/by-name/data /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	fi" >> $(HI_MODULE_DIR)/load
		$(AT)echo "else" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/disk/by-name/data\" ] && ubiattach /dev/ubi_ctrl -p /dev/disk/by-name/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/ubi0_0\" ] && mount -t ubifs /dev/ubi0_0 /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/disk/by-name/trusted_storage\" ] && ubiattach /dev/ubi_ctrl -p /dev/disk/by-name/trusted_storage" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/ubi1_0\" ] && mount -t ubifs /dev/ubi1_0 /mnt/trusted_storage" >> $(HI_MODULE_DIR)/load
		$(AT)echo "fi" >> $(HI_MODULE_DIR)/load
    endif
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)
		$(AT)echo "#create app data partition:" >> $(HI_MODULE_DIR)/load

		$(AT)echo "if [ -e \"/dev/mmcblk0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	#for SPI+EMMC FLASH case:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	mount -t ext4 /dev/disk/by-name/data /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	if [ \"\$$?\" != \"0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		echo y | mkfs.ext4 -q /dev/disk/by-name/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		mount -t ext4 /dev/disk/by-name/data /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	fi" >> $(HI_MODULE_DIR)/load
		$(AT)echo "else" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/disk/by-name/data\" ] && ubiattach /dev/ubi_ctrl -p /dev/disk/by-name/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/ubi0_0\" ] && mount -t ubifs /dev/ubi0_0 /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "fi" >> $(HI_MODULE_DIR)/load
    endif
else ifeq ($(CFG_HI_ADVCA_TYPE),CONAX)
    ifeq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv410 hi3716mv420),)
		$(AT)echo "#create data partition:" >> $(HI_MODULE_DIR)/load

		$(AT)echo "if [ -e \"/dev/mmcblk0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	#for SPI+EMMC FLASH case:" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	mount -t ext4 /dev/disk/by-name/data /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	if [ \"\$$?\" != \"0\" ]; then" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		echo y | mkfs.ext4 -q /dev/disk/by-name/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "		mount -t ext4 /dev/disk/by-name/data /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	fi" >> $(HI_MODULE_DIR)/load
		$(AT)echo "else" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/disk/by-name/data\" ] && ubiattach /dev/ubi_ctrl -p /dev/disk/by-name/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "	[ -e \"/dev/ubi0_0\" ] && mount -t ubifs /dev/ubi0_0 /mnt/data" >> $(HI_MODULE_DIR)/load
		$(AT)echo "fi" >> $(HI_MODULE_DIR)/load
    endif
endif

		$(AT)chmod +x $(HI_MODULE_DIR)/load

unload:
	$(AT)test -d $(HI_MODULE_DIR) || mkdir -p $(HI_MODULE_DIR)
	$(AT)rm -rf $(HI_MODULE_DIR)/unload

ifeq ($(CFG_HI_ADVCA_RUNTIME_CHECK_ENABLE),y)
	$(AT)echo "rmmod hi_runtime" >> $(HI_MODULE_DIR)/unload
endif

ifeq ($(CFG_HI_DIRECTFB_MULTI_SUPPORT),y)
	$(AT)echo "rmmod fusion" >> $(HI_MODULE_DIR)/unload
endif

ifeq ($(CFG_HI_WIFI_SUPPORT),y)
    ifeq ($(CFG_HI_WIFI_DEVICE_RTL8188EUS),y)
		$(AT)echo "rmmod rtl8188eu " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8192EU),y)
		$(AT)echo "rmmod rtl8192eu " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8188FU),y)
		$(AT)echo "rmmod rtl8188fu " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8812AE),y)
		$(AT)echo "rmmod rtl8812ae " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8812AU),y)
		$(AT)echo "rmmod rtl8812au " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8723BU),y)
		$(AT)echo "rmmod rtl8723bu " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8822BU),y)
		$(AT)echo "rmmod rtl8822bu " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8821AU),y)
		$(AT)echo "rmmod rtl8821au " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_MT76X2U),y)
		$(AT)echo "rmmod mt76x2u_sta " >> $(HI_MODULE_DIR)/unload
		$(AT)echo "rmmod mtprealloc76x2 " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_MT7662TE),y)
		$(AT)echo "rmmod mt7662e_sta " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_RTL8822BEH),y)
		$(AT)echo "rmmod rtl8822be " >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_WIFI_DEVICE_QCA6174),y)
		$(AT)echo "rmmod qca6174 " >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod cfg80211" >> $(HI_MODULE_DIR)/unload
endif

ifeq ($(CFG_HI_NTFS_SUPPORT),y)
	$(AT)echo "rmmod tntfs" >> $(HI_MODULE_DIR)/unload
endif

ifeq ($(CFG_HI_SATA_SUPPORT),y)
	$(AT)echo 'if [ -e "./sata/ahci_platform.ko" ]; then rmmod ahci_platform; fi' >> $(HI_MODULE_DIR)/unload
	$(AT)echo 'if [ -e "./sata/libahci_platform.ko" ]; then rmmod libahci_platform; fi' >> $(HI_MODULE_DIR)/unload
	$(AT)echo 'if [ -e "./sata/libahci.ko" ]; then rmmod libahci; fi' >> $(HI_MODULE_DIR)/unload
endif

    ifeq ($(CFG_HI_USB3_SUPPORT),y)
		$(AT)echo "rmmod xhci-plat-hcd" >> $(HI_MODULE_DIR)/unload
    endif
	$(AT)echo "rmmod ohci-platform" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod ehci-platform" >> $(HI_MODULE_DIR)/unload

ifeq ($(CFG_HI_ADAC_TVL320AIC31_SUPPORT),y)
	$(AT)echo "rmmod hi_tlv320" >> $(HI_MODULE_DIR)/unload
endif

ifeq ($(CFG_HI_IR_TYPE_LIRC),y)
	$(AT)echo "rmmod lirc_serial" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod lirc_dev" >> $(HI_MODULE_DIR)/unload
endif

ifneq ($(CFG_HI_MSP_BUILDIN),y)
    ifeq ($(CFG_HI_LOAD_CAS_IMAGE),y)
		$(AT)echo "rmmod hi_casimage" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_MAILBOX_SUPPORT),y)
		$(AT)echo "rmmod hi_mailbox" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_SM_SUPPORT),y)
		$(AT)echo "rmmod hi_sm" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_CIPLUS_SUPPORT),y)
		$(AT)echo "rmmod hi_ci" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_ADAC_SLIC_SUPPORT),y)
		$(AT)echo "rmmod hi_slic" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_SPI_BUS_SUPPORT),y)
		$(AT)echo "rmmod hi_spi" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_pmoc" >> $(HI_MODULE_DIR)/unload

    ifeq ($(CFG_HI_VI_SUPPORT),y)
		$(AT)echo "rmmod hi_vi" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_SCI_SUPPORT),y)
		$(AT)echo "rmmod hi_sci" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_KEYLED_SUPPORT),y)
		$(AT)echo "rmmod hi_keyled" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_AENC_SUPPORT),y)
		$(AT)echo "rmmod hi_aenc" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_VENC_SUPPORT),y)
		$(AT)echo "rmmod hi_venc" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_advca" >> $(HI_MODULE_DIR)/unload

    ifeq ($(CFG_HI_PNG_SUPPORT),y)
		$(AT)echo "rmmod hi_png" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_JPGE_SUPPORT),y)
		$(AT)echo "rmmod hi_jpge" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_jpeg" >> $(HI_MODULE_DIR)/unload

    ifneq ($(CFG_HI_IR_TYPE_LIRC),y)
		$(AT)echo "rmmod hi_ir" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_GPU_MALI400_SUPPORT),y)
		$(AT)echo "rmmod hi_dbe" >> $(HI_MODULE_DIR)/unload
		$(AT)echo "rmmod mali" >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_GPU_MALI450_SUPPORT),y)
		$(AT)echo "rmmod hi_dbe" >> $(HI_MODULE_DIR)/unload
		$(AT)echo "rmmod mali" >> $(HI_MODULE_DIR)/unload
    else ifeq ($(CFG_HI_GPU_MALI700_SUPPORT),y)
		$(AT)echo "rmmod hi_dbe" >> $(HI_MODULE_DIR)/unload
		$(AT)echo "rmmod mali_kbase" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_fb" >> $(HI_MODULE_DIR)/unload

    ifeq ($(CFG_HI_PWM_SUPPORT),y)
		$(AT)echo "rmmod hi_pwm" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
		$(AT)echo "rmmod hi_tuner" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_mce" >> $(HI_MODULE_DIR)/unload

    ifeq ($(CFG_HI_PVR_SUPPORT),y)
		$(AT)echo "rmmod hi_pvr" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_sync" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_aiao" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_adsp" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_vdec" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_vpss" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_vfmw" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_adec" >> $(HI_MODULE_DIR)/unload

    ifeq ($(CFG_HI_PLCIPHER_SUPPORT),y)
		$(AT)echo "rmmod hi_plcipher" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_ADVCA_TYPE),NAGRA)
		$(AT)echo "rmmod hi_cert" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_TSIO_SUPPORT),y)
		$(AT)echo "rmmod hi_tsio.ko" >> $(HI_MODULE_DIR)/unload
    endif

    ifeq ($(CFG_HI_DEMUX_SUPPORT),y)
		$(AT)echo "rmmod hi_demux" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_otp" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_tde" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_i2c" >> $(HI_MODULE_DIR)/unload

    ifeq ($(CFG_HI_GPIOI2C_SUPPORT),y)
		$(AT)echo "rmmod hi_gpio_i2c" >> $(HI_MODULE_DIR)/unload
    endif

	$(AT)echo "rmmod hi_gpio" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_vou" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_hdmi" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_cipher" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_pq" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_pdm" >> $(HI_MODULE_DIR)/unload

	$(AT)echo "rmmod hi_common" >> $(HI_MODULE_DIR)/unload
	$(AT)echo "rmmod hi_mmz" >> $(HI_MODULE_DIR)/unload

    ifneq ($(CFG_HI_KEYLED_CT1642_KERNEL_SUPPORT),y)
		$(AT)echo "rmmod hi_media" >> $(HI_MODULE_DIR)/unload
    endif

endif   # End of ifneq ($(CFG_HI_MSP_BUILDIN),y)
	$(AT)chmod +x $(HI_MODULE_DIR)/unload

clean:
	$(AT)rm -rf $(HI_MODULE_DIR)/load $(HI_MODULE_DIR)/unload

