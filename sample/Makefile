#===============================================================================
# export variable
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(CURDIR)/..
include $(SDK_DIR)/base.mak
endif

include $(SAMPLE_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
CFLAGS += $(CFG_HI_SAMPLE_CFLAGS)
CFLAGS += -I$(HI_INCLUDE_DIR) -I$(SAMPLE_DIR)/common

objects :=  esplay audiocast tsplay es_ts_switch ipplay mosaic pip log userproc cgms \
            fb tde \
            gpio pmoc ir e2prom i2c register \
            otp flash uart network fs cipher pq test/video_test rawplay ms12_ipc_mp ion \
            debug_assistant

ifeq ($(CFG_HI_HDMI_SUPPORT),y)
objects += test/hdmi_tsplay
endif

ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += capture 3dtv mce ao snapshot deviceinfo
endif

ifeq ($(CFG_HI_KEYPROVISION_SUPPORT),y)
objects += keyprovision
endif

ifneq ($(CFG_HI_LOADER_APPLOADER),y)
objects += jpeg png
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += higo
endif
endif

ifneq ($(CFG_HI_ADVCA_SUPPORT),y)
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv100 hi3796mv100 hi3798cv200 hi3798mv200 hi3798mv300 hi3796mv200),)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += test/ddr_test
endif
endif
endif

ifneq ($(CFG_HI_LOADER_APPLOADER),y)
ifeq ($(CFG_HI_DIRECTFB_SUPPORT),y)
objects += directfb
endif
endif

ifeq ($(CFG_HI_PWM_SUPPORT),y)
objects += pwm
endif

ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
objects += tuner demux dvbplay fullband test/sync_test

ifeq ($(CFG_HI_HDMI_SUPPORT),y)
objects += test/hdmi_dvbplay
endif

ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += iframe_dec test/dolby  test/ms12
endif
endif

ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += factory_detect
endif
endif

ifeq ($(CFG_HI_PLCIPHER_SUPPORT),y)
objects += plcipher
endif

ifeq ($(CFG_HI_TEE_SUPPORT),y)
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200 hi3798mv300 hi3798mv310 hi3796mv200 hi3716mv450),)
objects += tee
endif
endif

ifeq ($(CFG_HI_PVR_SUPPORT),y)
ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += pvr
endif
endif
endif

ifeq ($(CFG_HI_KEYLED_SUPPORT),y)
objects += keyled
endif

ifeq ($(CFG_HI_CI_SUPPORT),y)
objects += ci
endif

ifeq ($(CFG_HI_HDMI_SUPPORT_HDCP),y)
objects += hdcpkey
endif

ifeq ($(CFG_HI_AENC_SUPPORT),y)
objects += aenc
endif

ifeq ($(CFG_HI_AI_SUPPORT),y)
objects += ai
endif

ifeq ($(CFG_HI_KARAOKE_SUPPORT),y)
objects += karaoke
endif

ifeq ($(CFG_HI_OMX_SUPPORT),y)
objects += omxvdec
objects += omxadec
objects += omxaenc
endif

ifeq ($(CFG_HI_LOADER_SUPPORT),y)
objects += loader
endif

ifeq ($(CFG_HI_WIFI_SUPPORT),y)
objects += wifi
endif

ifeq ($(CFG_HI_GPU_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += gpu
endif
endif

ifeq ($(CFG_HI_SCI_SUPPORT),y)
objects += sci
endif

ifeq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv100 hi3796mv100),)
objects += wdg
endif

ifeq ($(CFG_HI_AENC_SUPPORT),y)
ifeq ($(CFG_HI_VENC_SUPPORT),y)
objects += transcode
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += avcast
endif
endif
endif

ifeq ($(CFG_HI_VI_SUPPORT),y)
CFLAGS += -I$(MSP_DIR)/drv/include
ifeq ($(CFG_HI_VENC_SUPPORT),y)
ifneq ($(CFG_HI_VO_SINGLE_VIDEO_SUPPORT),y)
objects += vi_venc
ifeq ($(CFG_HI_VP_SUPPORT),y)
objects += vp
endif
endif
endif
endif

ifeq ($(CFG_HI_VENC_SUPPORT),y)
objects += venc
endif

ifeq ($(CFG_HI_PLAYER_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += localplay
endif
endif

ifeq ($(CFG_HI_CAPTION_CC_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += cc
endif
endif

ifeq ($(CFG_HI_CAPTION_TTX_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += teletext
endif
endif

ifeq ($(CFG_HI_CAPTION_SUBT_SUPPORT),y)
ifeq ($(CFG_HI_HIGO_SUPPORT),y)
objects += subtitle
endif
endif

ifeq ($(CFG_HI_OPENSSL_SUPPORT),y)
objects += openssl
endif

ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
    objects += nagra
else ifeq ($(CFG_HI_ADVCA_TYPE), CONAX)
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv410 hi3716mv420),)
        objects += advca
    else
        objects += conax
    endif
else ifeq ($(CFG_HI_ADVCA_TYPE), IRDETO)
    ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv200)
        objects += advca
    else
        objects += irdeto
    endif
else ifeq ($(CFG_HI_ADVCA_TYPE), VERIMATRIX_ULTRA)
    objects += vmx_ultra
else
    ifeq ($(CFG_HI_OTP_KLAD_V100),y)
        objects += advca
    endif
endif

ifeq ($(CFG_HI_OTP_KLAD_V200),y)
    objects += klad
endif

ifeq ($(CFG_HI_DLNA_SUPPORT),y)
objects += hidlna
endif

#ifeq ($(CFG_HI_BLUETOOTH_SUPPORT),y)
#objects += bluetooth
#ifeq ($(CFG_HI_AUDIO_RESAMPLER_SUPPORT),y)
#objects += castbluetooth
#endif
#endif

ifeq ($(CFG_HI_TRANSCODER_SUPPORT),y)
objects += hitranscoder
endif

FILE = playready
ifeq ($(FILE), $(wildcard $(FILE)))
ifeq ($(CFG_HI_PLAYREADY_SUPPORT),y)
objects += playready
endif
endif

FILE = widevine
ifeq ($(FILE), $(wildcard $(FILE)))
ifeq ($(CFG_HI_WIDEVINE_SUPPORT),y)
objects += widevine
endif
endif

ifeq ($(CFG_HI_MARLIN_SUPPORT),y)
objects += marlin
endif

ifeq ($(CFG_HI_ADVCA_SANDBOX_TYPE),LXC)
ifneq ($(wildcard lxc_ipc),)
objects += lxc_ipc
endif
ifneq ($(wildcard lxc),)
objects += lxc
endif
endif

ifeq ($(CFG_HI_TEE_SUPPORT),y)
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200 hi3798mv300),)
objects += tee
endif
endif

objects_clean := $(addsuffix _clean, $(objects))

SAMPLE_RES := $(HI_OUT_DIR)/obj/sample
SAMPLE_RES64 := $(HI_OUT_DIR)/obj64/sample

SAMPLE_INSTALL_DIR := $(HI_ROOTBOX_DIR)/usr/local

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200 hi3798mv300 hi3798mv310 hi3796mv200 hi3716mv450 hi3798mv100 hi3796mv100 hi3716mv430),)
CFG_HI_SAMPLE_INSTALL=y
else
CFG_HI_SAMPLE_INSTALL=n
endif

ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
CFG_HI_SAMPLE_INSTALL=n
endif

#===============================================================================
# rules
#===============================================================================
.PHONY: all clean image $(objects) $(objects_clean) prepare sample_common sample_common_clean

all: $(objects)

clean: $(objects_clean)

image: all
ifeq ($(CFG_HI_SAMPLE_INSTALL),y)
ifeq ($(HI_USER_SPACE_LIB),y)
	$(AT)mkdir -p $(SAMPLE_INSTALL_DIR)/sample

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)
	$(AT)test -f $(HI_OUT_DIR)/obj/sample/dvbplay/sample_dvbplay && cp $(HI_OUT_DIR)/obj/sample/dvbplay/sample_dvbplay $(SAMPLE_INSTALL_DIR)/sample
else
	$(AT)test -d $(HI_OUT_DIR)/obj/sample && cp -drf $(HI_OUT_DIR)/obj/sample $(SAMPLE_INSTALL_DIR)
	$(AT)rm -rf $(SAMPLE_INSTALL_DIR)/sample/common $(SAMPLE_INSTALL_DIR)/sample/gpu/common $(SAMPLE_INSTALL_DIR)/sample/test/ddr_test/base
	$(AT)rm -rf $(SAMPLE_INSTALL_DIR)/sample/directfb $(SAMPLE_INSTALL_DIR)/sample/openssl $(SAMPLE_INSTALL_DIR)/sample/factory_detect
	$(AT)rm -rf $(SAMPLE_INSTALL_DIR)/sample/res/cfg
endif

endif

ifeq ($(HI_USER_SPACE_LIB64),y)
	$(AT)mkdir -p $(SAMPLE_INSTALL_DIR)/sample64
	$(AT)test -d $(HI_OUT_DIR)/obj64/sample && cp -drf $(HI_OUT_DIR)/obj64/sample/* $(SAMPLE_INSTALL_DIR)/sample64
ifeq ($(HI_USER_SPACE_LIB),y)
	$(AT)rm -rf $(SAMPLE_INSTALL_DIR)/sample64/res
	$(AT)ln -s ../sample/res $(SAMPLE_INSTALL_DIR)/sample64/res
endif
	$(AT)rm -rf $(SAMPLE_INSTALL_DIR)/sample64/common $(SAMPLE_INSTALL_DIR)/sample64/gpu/common $(SAMPLE_INSTALL_DIR)/sample64/test/ddr_test/base
	$(AT)rm -rf $(SAMPLE_INSTALL_DIR)/sample64/directfb $(SAMPLE_INSTALL_DIR)/sample64/openssl $(SAMPLE_INSTALL_DIR)/sample64/factory_detect
endif

	$(AT)find $(SAMPLE_INSTALL_DIR) -name "*.o" | xargs rm -rf
endif

ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
	$(AT)mkdir -p $(SAMPLE_INSTALL_DIR)/cfg
    ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv410)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3716m41dma.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv420)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3716m42*.ini $(SAMPLE_INSTALL_DIR)/cfg
        ifneq ($(findstring dmc, $(HI_OUT_DIR)),)
			$(AT)cp  $(SAMPLE_INSTALL_DIR)/cfg/*dmc*.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
        else
			$(AT)cp  $(SAMPLE_INSTALL_DIR)/cfg/*dmb*.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
        endif
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv430)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3716m43*.ini $(SAMPLE_INSTALL_DIR)/cfg
        ifneq ($(findstring dmb, $(HI_OUT_DIR)),)
			$(AT)cp  $(SAMPLE_INSTALL_DIR)/cfg/*dmb*.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
        else
			$(AT)cp  $(SAMPLE_INSTALL_DIR)/cfg/*dma*.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
        endif
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv450)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3716m45dma.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3796mv100)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3796mdmo1a.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3796mv200)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3796mv2*.ini $(SAMPLE_INSTALL_DIR)/cfg
        ifneq ($(findstring dmb, $(HI_OUT_DIR)),)
			$(AT)cp  $(SAMPLE_INSTALL_DIR)/cfg/*dmb*.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
        else
			$(AT)cp  $(SAMPLE_INSTALL_DIR)/cfg/*dma*.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
        endif
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3798cv200)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3798cv2dmb.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3798mv200)
		$(AT)cp  $(SAMPLE_DIR)/res/cfg/frontend_config.hi3798mv2dmg.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
    else
		$(AT)cp -drf $(SAMPLE_DIR)/res/cfg/frontend_config*.ini  $(SAMPLE_INSTALL_DIR)/cfg
    endif
	test ! -f $(SAMPLE_DIR)/res/cfg/frontend_config.ini || cp $(SAMPLE_DIR)/res/cfg/frontend_config.ini $(SAMPLE_INSTALL_DIR)/cfg/frontend_config.ini
endif
	$(AT)echo "" > /dev/null

$(objects): sample_common
	$(AT)make -C $@

$(objects_clean): sample_common_clean
	$(AT)make -C $(patsubst %_clean, %, $@) clean

sample_common: prepare
	$(AT)make -C common

sample_common_clean:
	$(AT)make -C common clean

prepare:
ifeq ($(HI_USER_SPACE_LIB),y)
	$(AT)test -d $(SAMPLE_RES) || mkdir -p $(SAMPLE_RES)
	$(AT)test -d $(SAMPLE_RES)/res || cp -rf $(SAMPLE_DIR)/res $(SAMPLE_RES)/
endif
ifeq ($(HI_USER_SPACE_LIB64),y)
	$(AT)test -d $(SAMPLE_RES64) || mkdir -p $(SAMPLE_RES64)
	$(AT)test -d $(SAMPLE_RES64)/res || cp -rf $(SAMPLE_DIR)/res $(SAMPLE_RES64)/
endif
