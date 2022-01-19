#
# Automatically generated make config: don't edit
# SDK version: KERNELVERSION
# Mon Oct 29 14:42:21 2018
#

#
# Base
#
CFG_LINUX_PRODUCT=y
# CFG_ANDROID_PRODUCT is not set
CFG_PRODUCT_TYPE=linux
# CFG_HI_USER_MODE is not set
CFG_HI_ENG_MODE=y
# CFG_HI3716MV410 is not set
# CFG_HI3716MV420 is not set
# CFG_HI3716MV430 is not set
# CFG_HI3716MV450 is not set
# CFG_HI3798MV100 is not set
# CFG_HI3798MV200 is not set
# CFG_HI3798MV200H is not set
# CFG_HI3798MV300 is not set
# CFG_HI3798MV310 is not set
# CFG_HI3798MV300H is not set
# CFG_HI3796MV100 is not set
CFG_HI3796MV200=y
# CFG_HI3798CV200 is not set
# CFG_HI3716DV110H is not set
CFG_HI_CHIP_TYPE=hi3796mv200
# CFG_HI_ADVCA_SUPPORT is not set
# CFG_HI_NVR_SUPPORT is not set

#
# System Config
#
CFG_HI_32BIT_SYSTEM=y
# CFG_HI_64BIT_SYSTEM is not set
CFG_HI_USER_SPACE_LIB=y
# CFG_HI_USER_SPACE_LIB64 is not set
# CFG_HI_USER_SPACE_ALL_LIB is not set
CFG_HI_CPU_ARCH=arm

#
# Toolchains Config
#
# CFG_ARM_HISTBV300_LINUX is not set
# CFG_ARM_HISTBV310_LINUX is not set
CFG_ARM_HISTBV320_LINUX=y
CFG_HI_ARM_TOOLCHAINS_NAME=arm-histbv320-linux
CFG_AARCH64_HISTBV100_LINUX=y
# CFG_AARCH64_HISTBV400_LINUX is not set
CFG_HI_AARCH64_TOOLCHAINS_NAME=aarch64-histbv100-linux
CFG_HI_OUT_DIR=hi3796mv200dmo
CFG_HI_USB3_SUPPORT=y
CFG_HI_SATA_SUPPORT=y
CFG_HI_JPGE_SUPPORT=y
CFG_HI_PNG_SUPPORT=y
CFG_HI_SMMU_SUPPORT=y
CFG_HI_HDR_SUPPORT=y
CFG_HI_HDR_DOLBYVISION_SUPPORT=y
CFG_HI_MAILBOX_SUPPORT=y
CFG_HI_OTP_KLAD_V200=y
# CFG_HI_OPTM_SIZE_SUPPORT is not set

#
# Debug Config
#
CFG_HI_LOG_SUPPORT=y
# CFG_HI_LOG_LEVEL_FATAL is not set
# CFG_HI_LOG_LEVEL_ERROR is not set
# CFG_HI_LOG_LEVEL_WARNING is not set
# CFG_HI_LOG_LEVEL_INFO is not set
CFG_HI_LOG_LEVEL_DEBUG=y
CFG_HI_LOG_LEVEL=4
CFG_HI_LOG_NETWORK_SUPPORT=y
CFG_HI_LOG_UDISK_SUPPORT=y
CFG_HI_PROC_SUPPORT=y
CFG_HI_PROC_WRITE_SUPPORT=y

#
# Board
#

#
# Ethernet Config
#
CFG_HI_ETH_SUPPORT=y

#
# Flash Config
#
# CFG_HI_NAND_FLASH_SUPPORT is not set
CFG_HI_SPI_SUPPORT=y
CFG_HI_SPI_BLOCK_SIZE=0x10000
CFG_HI_EMMC_SUPPORT=y
# CFG_HI_KEYLED_74HC164_SELECT is not set
# CFG_HI_KEYLED_GPIOKEY_SELECT is not set
CFG_HI_KEYLED_CT1642_SELECT=y
# CFG_HI_KEYLED_PT6961_SELECT is not set
# CFG_HI_KEYLED_PT6964_SELECT is not set
# CFG_HI_KEYLED_FD650_SELECT is not set
# CFG_HI_GPIO_LIGHT_SUPPORT is not set

#
# PCIe Config
#
CFG_HI_PCIE_SUPPORT=y
CFG_HI_GPIO_PCIE_RESET=0x3D
CFG_HI_GPIO_PCIE_POWER_EN_SUPPORT=y
CFG_HI_GPIO_PCIE_POWER_EN=0x2E

#
# SCI Config
#
CFG_HI_SCI_CLK_MODE_CMOS=y
# CFG_HI_SCI_CLK_MODE_OD is not set
CFG_HI_SCI_VCCEN_MODE_CMOS=y
# CFG_HI_SCI_VCCEN_MODE_OD is not set
CFG_HI_SCI_RESET_MODE_CMOS=y
# CFG_HI_SCI_RESET_MODE_OD is not set
CFG_HI_SCI_VCCEN_LOW=y
# CFG_HI_SCI_VCCEN_HIGH is not set
CFG_HI_SCI_DETECT_LOW=y
# CFG_HI_SCI_DETECT_HIGH is not set
CFG_HI_AUDIO_EXTERNAL_AMP=y
# CFG_HI_AUDIO_INTERNAL_AMP is not set
CFG_HI_SND_MUTECTL_SUPPORT=y
CFG_HI_SND_MUTECTL_GPIO=0x37
CFG_HI_SND_MUTECTL_LEVEL=0

#
# Video DAC Config
#
CFG_HI_DAC_CVBS=3
# CFG_HI_VO_VDAC_LC_CIRCUIT is not set
CFG_HI_VO_VDAC_VIDEO_BUFFER=y
# CFG_HI_YPBPR_SUPPORT is not set
CFG_HI_BOOT_REG_NAME=hi3796mv2dma_hi3796mv200_DDR4-2133_2GB_16bitx2_4layers.reg

#
# Boot Regfile Config List
#
CFG_HI_BOOT_REG1_NAME=hi3796mv2dmb_hi3796mv200_DDR4-2133_2GB_16bitx2_2layers.reg
CFG_HI_BOOT_REG2_NAME=
CFG_HI_BOOT_REG3_NAME=
CFG_HI_BOOT_REG4_NAME=
CFG_HI_BOOT_REG5_NAME=

#
# Boot System
#
CFG_HI_UBOOT_SUPPORT=y
# CFG_HI_MINIBOOT_SUPPORT is not set
CFG_HI_BOOT_LOG_SUPPORT=y
# CFG_HI_FORCE_ENV_TO_MEDIA is not set
CFG_HI_BOOT_ENV_STARTADDR=0x100000
CFG_HI_BOOT_ENV_SIZE=0x10000
CFG_HI_BOOT_ENV_RANGE=0x10000
# CFG_HI_BOOT_ENV_BAK_SUPPORT is not set
# CFG_HI_BOOT_COMPRESSED is not set
CFG_HI_UNIFIED_BOOT_SUPPORT=y
CFG_HI_BOOT_USB_SUPPORT=y
CFG_HI_BUILD_WITH_PRODUCT=y
CFG_HI_BOOT_LOGO_SUPPORT=y
CFG_HI_BOOT_UPGRADE_SUPPORT=y
CFG_HI_BUILD_WITH_KEYLED=y
CFG_HI_BUILD_WITH_IR=y

#
# Linux(REE) System
#

#
# Kernel
#
# CFG_LINUX-3.18.y is not set
CFG_LINUX-4.4.y=y
# CFG_LINUX-4.9.y is not set
CFG_HI_KERNEL_VERSION=linux-4.4.y
CFG_HI_KERNEL_CFG=hi3796mv200_defconfig
# CFG_HI_FS_BUILDIN is not set
CFG_HI_MSP_BUILDIN=y

#
# Filesystem
#

#
# Busybox Config
#
CFG_HI_BUSYBOX_CFG_NAME=glibc.config
CFG_HI_LIBCPP_SUPPORT=y
CFG_HI_ROOTFS_STRIP=y
CFG_HI_ROOTFS_INSTALL_SHARED_LIBS=y
# CFG_HI_ROOTFS_CRAMFS is not set
# CFG_HI_ROOTFS_JFFS2 is not set
CFG_HI_ROOTFS_SQUASHFS=y
CFG_HI_ROOTFS_EXT4=y
CFG_HI_EMMC_ROOTFS_SIZE=384

#
# Tools
#
CFG_HI_NTFS_SUPPORT=y
CFG_HI_NTFS_TOOLS_SUPPORT=y
CFG_HI_EXFAT_SUPPORT=y
# CFG_HI_TOOL_DOSFS_SUPPORT is not set
CFG_HI_TOOL_E2FSPROGS_SUPPORT=y
# CFG_HI_TOOL_FILECAP_SUPPORT is not set
# CFG_HI_TOOL_GDB_SUPPORT is not set
# CFG_HI_TOOL_IPTABLES_SUPPORT is not set
CFG_HI_TOOL_MTDUTILS_SUPPORT=y
CFG_HI_TOOL_REG_SUPPORT=y
# CFG_HI_TOOL_PPPD_SUPPORT is not set
# CFG_HI_TOOL_MIITOOLS_SUPPORT is not set
# CFG_HI_TOOL_IPERF_SUPPORT is not set
# CFG_HI_TOOL_SYSSTAT_SUPPORT is not set
# CFG_HI_TOOL_SOC_SERVER is not set
CFG_HI_TOOL_MSP_DEBUG_SUPPORT=y
CFG_HI_TOOL_PQ_DEBUG_SUPPORT=y

#
# Features
#
CFG_HI_FRONTEND_SUPPORT=y
CFG_HI_DVBC_SUPPORT=y

#
# DVB-C Demod Config
#
CFG_HI_DEMOD_TYPE_HI3130V200=y
# CFG_HI_DEMOD_TYPE_J83B is not set
CFG_HI_DEMOD_TYPE_MXL254=y
CFG_HI_DEMOD_TYPE_MXL214=y
# CFG_HI_DEMOD_TYPE_TDA18280 is not set
# CFG_HI_DEMOD_TYPE_MXL251 is not set

#
# DVB-C Tuner Config
#
CFG_HI_TUNER_TYPE_TDA18250=y
CFG_HI_TUNER_TYPE_TDA18250B=y
CFG_HI_TUNER_TYPE_MXL254=y
CFG_HI_TUNER_TYPE_MXL214=y
# CFG_HI_TUNER_TYPE_TDA18280 is not set
# CFG_HI_TUNER_TYPE_MXL203 is not set
# CFG_HI_TUNER_TYPE_MXL603 is not set
# CFG_HI_TUNER_TYPE_R820C is not set
# CFG_HI_TUNER_TYPE_si2147 is not set
CFG_HI_TUNER_TYPE_MXL608=y
CFG_HI_TUNER_TYPE_RAFAEL836=y
# CFG_HI_TUNER_TYPE_R850 is not set
# CFG_HI_TUNER_TYPE_TDA182I5A is not set
# CFG_HI_TUNER_TYPE_SI2144 is not set
# CFG_HI_TUNER_TYPE_MXL251 is not set
# CFG_HI_TUNER_TYPE_R858 is not set
# CFG_HI_TUNER_TYPE_MXL661 is not set
CFG_HI_DVBS_SUPPORT=y

#
# DVB-S/S2 Demod Config
#
# CFG_HI_DEMOD_TYPE_AVL6211 is not set
CFG_HI_DEMOD_TYPE_HI3136=y
# CFG_HI_DEMOD_TYPE_TP5001 is not set
# CFG_HI_DEMOD_TYPE_HD2501 is not set
# CFG_HI_DEMOD_TYPE_MXL541 is not set
# CFG_HI_DEMOD_TYPE_MXL582 is not set

#
# DVB-S/S2 Tuner Config
#
CFG_HI_TUNER_TYPE_AV2011=y
CFG_HI_TUNER_TYPE_AV2018=y
# CFG_HI_TUNER_TYPE_RDA5815 is not set
# CFG_HI_TUNER_TYPE_AV2026 is not set
CFG_HI_DISEQC_SUPPORT=y

#
# LNB Chip Config
#
CFG_HI_LNB_CTRL_ISL9492=y
CFG_HI_LNB_CTRL_MPS8125=y
# CFG_HI_LNB_CTRL_A8300 is not set
# CFG_HI_LNB_CTRL_A8297 is not set
# CFG_HI_LNB_CTRL_TPS65233 is not set
CFG_HI_DVBT_SUPPORT=y

#
# DVB-T/T2/ISDBT/DTMB Demod Config
#
CFG_HI_DEMOD_TYPE_HI3137=y
# CFG_HI_DEMOD_TYPE_MN88472 is not set
# CFG_HI_DEMOD_TYPE_MN88473 is not set
# CFG_HI_DEMOD_TYPE_ATBM888X is not set
# CFG_HI_DEMOD_TYPE_MXL683 is not set
# CFG_HI_DEMOD_TYPE_AVL6381 is not set

#
# DVB-T/T2/ISDBT/DTMB Tuner Config
#
# CFG_HI_TUNER_TYPE_CXD2861 is not set
# CFG_HI_TUNER_TYPE_SI2147 is not set
# CFG_HI_TUNER_TYPE_MXL683 is not set

#
# Demux Config
#
CFG_HI_DEMUX_SUPPORT=y
CFG_HI_DEMUX_POOLBUF_SIZE=0x200000
# CFG_HI_DMX_TSBUF_MULTI_THREAD_SUPPORT is not set
# CFG_HI_DMX_DUP_PID_CHANNEL_SUPPORT is not set

#
# Audio Config
#
CFG_HI_AUDIO_OUTPUT_SUPPORT=y
CFG_HI_SPDIF_SUPPORT=y
# CFG_HI_ADAC_SUPPORT is not set
CFG_HI_AENC_SUPPORT=y
CFG_HI_ADEC_AUDSPECTRUM_SUPPORT=y
CFG_HI_AI_SUPPORT=y
# CFG_HI_SND_SMARTVOLUME_SUPPORT is not set
CFG_HI_SND_HBRA_PASSTHROUGH_SUPPORT=y
# CFG_HI_SND_PORT_DELAY_SUPPORT is not set
CFG_HI_ALSA_SUPPORT=y
# CFG_HI_ALSA_LIB_SUPPORT is not set
# CFG_HI_ALSA_DRIVER_SUPPORT is not set
# CFG_HI_AUDIO_RESAMPLER_SUPPORT is not set
# CFG_HI_SONIC_SUPPORT is not set
CFG_HI_HACODEC_SUPPORT=y
CFG_HI_HACODEC_MP3DECODE_SUPPORT=y
CFG_HI_HACODEC_AACDECODE_SUPPORT=y
CFG_HI_HACODEC_AACENCODE_SUPPORT=y
CFG_HI_HACODEC_AC3PASSTHROUGH_SUPPORT=y
CFG_HI_HACODEC_AMRNBCODEC_SUPPORT=y
CFG_HI_HACODEC_AMRWBCODEC_SUPPORT=y
CFG_HI_HACODEC_BLURAYLPCMDECODE_SUPPORT=y
CFG_HI_HACODEC_COOKDECODE_SUPPORT=y
CFG_HI_HACODEC_DRADECODE_SUPPORT=y
CFG_HI_HACODEC_DTSPASSTHROUGH_SUPPORT=y
CFG_HI_HACODEC_G711CODEC_SUPPORT=y
CFG_HI_HACODEC_G722CODEC_SUPPORT=y
CFG_HI_HACODEC_PCMDECODE_SUPPORT=y
CFG_HI_HACODEC_TRUEHDPASSTHROUGH_SUPPORT=y
CFG_HI_HACODEC_OPUSDECODE_SUPPORT=y
CFG_HI_HACODEC_VORBISDECODE_SUPPORT=y

#
# Video Config
#
CFG_HI_VIDEO_MAX_DISP_FRAME_NUM=4
CFG_HI_VDEC_MJPEG_SUPPORT=y
CFG_HI_VDEC_USERDATA_CC_SUPPORT=y
CFG_HI_VDEC_USERDATA_CC_BUFSIZE=0xC000
CFG_HI_VENC_SUPPORT=y
CFG_HI_VPSS_MAX_BUFFER_NUMB=6
# CFG_HI_DISP_USE_QPLL_SOLELY is not set
CFG_HI_DISP_TTX_INBUFFERSIZE=0x4000
CFG_HI_DISP_CC_INBUFFERSIZE=0x4000
CFG_HI_PQ_V4_0=y
# CFG_HI_DISP_VIRT_OFFSET_EFFECT_WHEN_FULLSCREEN is not set
# CFG_HI_GFX_SDR2HDR_WEAK_PARA is not set
CFG_HI_VI_SUPPORT=y

#
# Graphics Config
#
CFG_HI_HIGO_SUPPORT=y
CFG_HI_DIRECTFB_SUPPORT=y
CFG_HI_DIRECTFB_MULTI_SUPPORT=y
# CFG_HI_DIRECTFB_DEBUG_SUPPORT is not set
# CFG_HI_FB0_SMMU_SUPPORT is not set
CFG_HI_FB1_SMMU_SUPPORT=y
CFG_HI_FB2_SMMU_SUPPORT=y
CFG_HI_HD0_FB_VRAM_SIZE=7200
CFG_HI_HD1_FB_VRAM_SIZE=0
CFG_HI_HD2_FB_VRAM_SIZE=0
CFG_HI_HDMI_SUPPORT=y
CFG_HI_HDMI_SUPPORT_2_0=y
CFG_HI_HDMI_SUPPORT_HDCP=y
CFG_HI_HDMI_SUPPORT_CEC=y
# CFG_HI_HDMI_CEC_FORCE_RAWDATA is not set
# CFG_HI_HDMI_SUPPORT_DEBUG is not set
# CFG_HI_HDMI_START_SUPPORT is not set

#
# GPU Config
#
CFG_HI_GPU_SUPPORT=y
CFG_HI_GPU_MALI450_SUPPORT=y
# CFG_HI_GPU_DEBUG is not set
CFG_EGL_FB=y
# CFG_EGL_DFB is not set
CFG_HI_EGL_TYPE=fb

#
# Peripherals Config
#

#
# IR Config
#
CFG_HI_IR_TYPE_S2=y
# CFG_HI_IR_TYPE_STD is not set
# CFG_HI_IR_TYPE_LIRC is not set
CFG_HI_IR_NEC_SUPPORT=y
CFG_HI_IR_RC6_SUPPORT=y
CFG_HI_IR_RC5_SUPPORT=y
# CFG_HI_IR_RSTEP_SUPPORT is not set
CFG_HI_IR_SONY_SUPPORT=y
CFG_HI_IR_TC9012_SUPPORT=y
# CFG_HI_IR_CREDIT_SUPPORT is not set
# CFG_HI_IR_XMP_SUPPORT is not set

#
# Keyled Config
#
CFG_HI_KEYLED_SUPPORT=y
CFG_HI_KEYLED_74HC164_SUPPORT=y
CFG_HI_KEYLED_GPIOKEY_SUPPORT=y
CFG_HI_KEYLED_GPIOKEY_POWER_GPIO=0x2d
CFG_HI_KEYLED_GPIOKEY_OK_GPIO=0xd
CFG_HI_KEYLED_GPIOKEY_MENU_GPIO=0xe
CFG_HI_KEYLED_GPIOKEY_LEFT_GPIO=0xf
CFG_HI_KEYLED_GPIOKEY_RIGHT_GPIO=0x10
CFG_HI_KEYLED_GPIOKEY_UP_GPIO=0x12
CFG_HI_KEYLED_GPIOKEY_DOWN_GPIO=0x11
CFG_HI_KEYLED_CT1642_SUPPORT=y
# CFG_HI_KEYLED_CT1642_GPIO_MODE is not set
CFG_HI_KEYLED_PT6961_SUPPORT=y
CFG_HI_KEYLED_PT6961_CLOCK_GPIO=0x2a
CFG_HI_KEYLED_PT6961_STB_GPIO=0x2b
CFG_HI_KEYLED_PT6961_DIN_GPIO=0x2c
CFG_HI_KEYLED_PT6961_DOUT_GPIO=0x2d
CFG_HI_KEYLED_PT6964_SUPPORT=y
CFG_HI_KEYLED_PT6964_CLOCK_GPIO=0x2a
CFG_HI_KEYLED_PT6964_STB_GPIO=0x2b
CFG_HI_KEYLED_PT6964_DINOUT_GPIO=0x2c
CFG_HI_KEYLED_FD650_SUPPORT=y
CFG_HI_KEYLED_FD650_CLOCK_GPIO=0x2b
CFG_HI_KEYLED_FD650_DINOUT_GPIO=0x2d

#
# SCI Config
#
CFG_HI_SCI_SUPPORT=y
# CFG_HI_SCI_SUPPORT_PPS is not set
CFG_HI_GPIOI2C_SUPPORT=y
# CFG_HI_SPI_BUS_SUPPORT is not set

#
# PowerManagement Config
#
CFG_HI_DVFS_CPU_SUPPORT=y
CFG_HI_AVS_SUPPORT=y
# CFG_HI_PM_IN_BOOT_SUPPORT is not set
CFG_HI_PM_SMARTSTANDBY_SUPPORT=y

#
# Temperature Control
#
CFG_HI_TEMP_CTRL_DOWN_THRESHOLD=0x73
CFG_HI_TEMP_CTRL_UP_THRESHOLD=0x64
CFG_HI_TEMP_CTRL_REBOOT_THRESHOLD=0x7d
# CFG_HI_PM_START_MCU_RUNNING is not set

#
# PVR Config
#
CFG_HI_PVR_SUPPORT=y
# CFG_HI_PVR_EXTRA_BUF_SUPPORT is not set

#
# Caption Config
#
CFG_HI_CAPTION_SUBT_SUPPORT=y
CFG_HI_CAPTION_TTX_SUPPORT=y
CFG_HI_CAPTION_SO_SUPPORT=y
CFG_HI_CAPTION_CC_SUPPORT=y

#
# Crypto Config
#
CFG_HI_PLCIPHER_SUPPORT=y
CFG_HI_OPENSSL_SUPPORT=y

#
# CI Config
#
# CFG_HI_CI_SUPPORT is not set
# CFG_HI_OMX_SUPPORT is not set
# CFG_HI_MCE_SUPPORT is not set
# CFG_HI_PLAYER_SUPPORT is not set
CFG_HI_WIFI_SUPPORT=y

#
# WiFi Device Type
#
# CFG_HI_WIFI_DEVICE_RTL8188EUS is not set
# CFG_HI_WIFI_DEVICE_RTL8192EU is not set
# CFG_HI_WIFI_DEVICE_RTL8188FU is not set
# CFG_HI_WIFI_DEVICE_RTL8812AU is not set
# CFG_HI_WIFI_DEVICE_RTL8723BU is not set
CFG_HI_WIFI_DEVICE_RTL8822BU=y
# CFG_HI_WIFI_DEVICE_MT76X2U is not set
# CFG_HI_WIFI_DEVICE_MT7662TE is not set
# CFG_HI_WIFI_DEVICE_RTL8822BEH is not set
# CFG_HI_WIFI_DEVICE_QCA6174 is not set

#
# WiFi Working Mode
#
CFG_HI_WIFI_MODE_STA=y
CFG_HI_WIFI_MODE_AP=y
# CFG_HI_BLUETOOTH_SUPPORT is not set
# CFG_HI_DRM_SUPPORT is not set
CFG_HI_VP_SUPPORT=y
# CFG_HI_KEYPROVISION_SUPPORT is not set
# CFG_HI_TEE_SUPPORT is not set

#
# Upgrade System
#
CFG_HI_UPGRADE_SUPPORT=y
# CFG_HI_RECOVERY_SUPPORT is not set
CFG_HI_APPLOADER_SUPPORT=y
# CFG_HI_BOOTLOADER_SUPPORT is not set
CFG_HI_LOADER_SUPPORT=y
# CFG_HI_LOADER_APPLOADER is not set
