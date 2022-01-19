.PHONY: prebuilts_compose

ifeq ($(CFG_HI_ADVCA_TYPE),VERIMATRIX)
    BOOTARGS_ADVCA := _vmx_advanced
else ifeq ($(CFG_HI_ADVCA_TYPE),VERIMATRIX_ULTRA)
    BOOTARGS_ADVCA := _vmx_ultra
else ifeq ($(CFG_HI_ADVCA_TYPE),NAGRA)
    ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450 hi3716mv410 hi3716mv420 hi3716mv430),)
        ifeq ($(CFG_HI_ADVCA_FUNCTION),RELEASE)
            BOOTARGS_ADVCA := _nagra_release
        else
            BOOTARGS_ADVCA := _nagra_debug
        endif
    else
    BOOTARGS_ADVCA := _nagra
    endif
else ifeq ($(CFG_HI_ADVCA_TYPE),CONAX)
    ifeq ($(CFG_HI_ADVCA_FUNCTION),DEBUG)
        BOOTARGS_ADVCA := _conax_debug
    else
        BOOTARGS_ADVCA := _conax_release
    endif
else ifeq ($(CFG_HI_ADVCA_TYPE),IRDETO)
        BOOTARGS_ADVCA := _irdeto
else ifeq ($(CFG_HI_ADVCA_TYPE),DCAS)
    BOOTARGS_ADVCA :=
    ifeq ($(CFG_HI_TEE_SUPPORT),y)
        ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450 hi3798mv310),)
            BOOTARGS_TEE := _tee
        else
            BOOTARGS_TEE := _tee_DDR_$(CFG_HI_TVP_MEM_LAYOUT)B
        endif
    endif
else ifeq ($(CFG_HI_ADVCA_TYPE),SUMA)
    BOOTARGS_ADVCA :=
    ifeq ($(CFG_HI_TEE_SUPPORT),y)
        ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450 hi3798mv310),)
            BOOTARGS_TEE := _tee
        else
            BOOTARGS_TEE := _tee_DDR_$(CFG_HI_TVP_MEM_LAYOUT)B
        endif
    endif
else ifneq ($(CFG_HI_ADVCA_TYPE),)
    ifeq ($(CFG_HI_ADVCA_FUNCTION),)
        BOOTARGS_ADVCA :=
    else
        BOOTARGS_ADVCA := _ca_$(shell echo $(CFG_HI_ADVCA_FUNCTION) | tr '[A-Z]' '[a-z]')
    endif

    ifeq ($(CFG_HI_TEE_SUPPORT),y)
        ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450 hi3798mv310),)
            BOOTARGS_TEE := _tee
        else
            BOOTARGS_TEE := _tee_DDR_$(CFG_HI_TVP_MEM_LAYOUT)B
        endif
    endif
else
    ifeq ($(CFG_HI_TEE_SUPPORT),y)
        ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450 hi3798mv310),)
            BOOTARGS_TEE := _tee
        else
            BOOTARGS_TEE := _tee_DDR_$(CFG_HI_TVP_MEM_LAYOUT)B
        endif
    endif
endif


ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)
        BOOTARGS_LITE := _lite
endif

BOOTARGS_DTB :=
ifeq ($(CFG_HI_KERNEL_VERSION),linux-4.9.y)
    BOOTARGS_DTB := _linux4.9
endif

NAND_PARTITIONS     := $(HI_PREBUILTS_DIR)/nand_partitions$(BOOTARGS_SBL)$(BOOTARGS_ADVCA)$(BOOTARGS_DTB).xml
SPI_PARTITIONS_LITE := $(HI_PREBUILTS_DIR)/spi_partitions$(BOOTARGS_LITE)$(BOOTARGS_SBL)$(BOOTARGS_ADVCA).xml
EMMC_PARTITIONS     := $(HI_PREBUILTS_DIR)/emmc_partitions$(BOOTARGS_SBL)$(BOOTARGS_ADVCA)$(BOOTARGS_DTB).xml
SPI_EMMC_PARTITIONS := $(HI_PREBUILTS_DIR)/spi_emmc_partitions$(BOOTARGS_SBL)$(BOOTARGS_ADVCA)$(BOOTARGS_DTB).xml
SPI_PARTITIONS      := $(HI_PREBUILTS_DIR)/spi_partitions.xml

NAND_BOOTARGS       := $(HI_PREBUILTS_DIR)/nand_bootargs$(BOOTARGS_SBL)$(BOOTARGS_TEE)$(BOOTARGS_ADVCA)$(BOOTARGS_DTB).txt
SPI_BOOTARGS_LITE := $(HI_PREBUILTS_DIR)/spi_bootargs$(BOOTARGS_LITE)$(BOOTARGS_SBL)$(BOOTARGS_ADVCA).txt
EMMC_BOOTARGS       := $(HI_PREBUILTS_DIR)/emmc_bootargs$(BOOTARGS_SBL)$(BOOTARGS_TEE)$(BOOTARGS_ADVCA)$(BOOTARGS_DTB).txt
SPI_EMMC_BOOTARGS   := $(HI_PREBUILTS_DIR)/spi_emmc_bootargs$(BOOTARGS_SBL)$(BOOTARGS_TEE)$(BOOTARGS_ADVCA)$(BOOTARGS_DTB).txt
SPI_BOOTARGS        := $(HI_PREBUILTS_DIR)/spi_bootargs.txt

ifeq ($(CFG_HI_DONGLE_SUPPORT),y)
NAND_BOOTARGS_DONGLE       := $(HI_PREBUILTS_DIR)/nand_bootargs_dongle.txt
EMMC_BOOTARGS_DONGLE       := $(HI_PREBUILTS_DIR)/emmc_bootargs_dongle.txt
SPI_EMMC_BOOTARGS_DONGLE   := $(HI_PREBUILTS_DIR)/spi_emmc_bootargs_dongle.txt
SPI_BOOTARGS_DONGLE        := $(HI_PREBUILTS_DIR)/spi_bootargs_dongle.txt
endif

CASIMAGE := $(HI_PREBUILTS_DIR)/casimage.bin
VSCSTORE := $(HI_PREBUILTS_DIR)/vscstore.bin

prebuilts_compose:
ifneq ($(CFG_HI_LOADER_APPLOADER),y)
ifeq ($(CFG_HI_NAND_FLASH_SUPPORT),y)
	$(AT)test -d $(HI_NAND_IMAGE_DIR) || mkdir -p $(HI_NAND_IMAGE_DIR)
	$(AT)test ! -f $(NAND_PARTITIONS) || cp -f $(NAND_PARTITIONS) $(HI_NAND_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/logo.img         $(HI_NAND_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/baseparam.img    $(HI_NAND_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/pq_param.bin     $(HI_NAND_IMAGE_DIR)/
ifeq ($(CFG_HI_ADVCA_TYPE),CONAX)
ifeq ($(CASIMAGE), $(wildcard $(CASIMAGE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/casimage.bin     $(HI_NAND_IMAGE_DIR)/casimage.bin
endif
ifeq ($(VSCSTORE), $(wildcard $(VSCSTORE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/vscstore.bin     $(HI_NAND_IMAGE_DIR)/vscstore.bin
endif
endif

ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv430)
	$(AT)(test ! -f $(NAND_BOOTARGS) || (cd $(HI_NAND_IMAGE_DIR) && $(MKBOOTARGS) \
		-s 64 -r $(NAND_BOOTARGS) -o bootargs.bin > /dev/null))
else
	$(AT)(test ! -f $(NAND_BOOTARGS) || (cd $(HI_NAND_IMAGE_DIR) && $(MKBOOTARGS) \
		-s 64 -r $(NAND_BOOTARGS) -o bootargs.bin > /dev/null))
endif

    ifeq ($(CFG_HI_DONGLE_SUPPORT),y)
		$(AT)(test ! -f $(NAND_BOOTARGS_DONGLE) || (cd $(HI_NAND_IMAGE_DIR) && $(MKBOOTARGS) \
			-s 64 -r $(NAND_BOOTARGS_DONGLE) -o bootargs_dongle.bin > /dev/null))
    endif
endif

ifeq ($(CFG_HI_EMMC_SUPPORT),y)
	$(AT)test -d $(HI_EMMC_IMAGE_DIR) || mkdir -p $(HI_EMMC_IMAGE_DIR)
	$(AT)test ! -f $(EMMC_PARTITIONS) || cp -f $(EMMC_PARTITIONS) $(HI_EMMC_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/logo.img         $(HI_EMMC_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/baseparam.img    $(HI_EMMC_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/pq_param.bin     $(HI_EMMC_IMAGE_DIR)/
ifeq ($(CFG_HI_ADVCA_TYPE),CONAX)
ifeq ($(CASIMAGE), $(wildcard $(CASIMAGE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/casimage.bin     $(HI_EMMC_IMAGE_DIR)/casimage.bin
endif
ifeq ($(VSCSTORE), $(wildcard $(VSCSTORE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/vscstore.bin     $(HI_EMMC_IMAGE_DIR)/vscstore.bin
endif
endif

	$(AT)(test ! -f $(EMMC_BOOTARGS) || (cd $(HI_EMMC_IMAGE_DIR) && $(MKBOOTARGS) \
		-s 64 -r $(EMMC_BOOTARGS) -o bootargs.bin > /dev/null))
    ifeq ($(CFG_HI_DONGLE_SUPPORT),y)
		$(AT)(test ! -f $(EMMC_BOOTARGS_DONGLE) || (cd $(HI_EMMC_IMAGE_DIR) && $(MKBOOTARGS) \
			-s 64 -r $(EMMC_BOOTARGS_DONGLE) -o bootargs_dongle.bin > /dev/null))
    endif
endif

ifeq ($(CFG_HI_SPI_SUPPORT)_$(CFG_HI_EMMC_SUPPORT),y_y)
	$(AT)test -d $(HI_SPI_EMMC_IMAGE_DIR) || mkdir -p $(HI_SPI_EMMC_IMAGE_DIR)
	$(AT)test ! -f $(SPI_EMMC_PARTITIONS) || cp -f $(SPI_EMMC_PARTITIONS) $(HI_SPI_EMMC_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/logo.img         $(HI_SPI_EMMC_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/baseparam.img    $(HI_SPI_EMMC_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/pq_param.bin     $(HI_SPI_EMMC_IMAGE_DIR)/
ifeq ($(CFG_HI_ADVCA_TYPE),CONAX)
ifeq ($(CASIMAGE), $(wildcard $(CASIMAGE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/casimage.bin     $(HI_SPI_EMMC_IMAGE_DIR)/casimage.bin
endif
ifeq ($(VSCSTORE), $(wildcard $(VSCSTORE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/vscstore.bin     $(HI_SPI_EMMC_IMAGE_DIR)/vscstore.bin
endif
endif

	$(AT)(test ! -f $(SPI_EMMC_BOOTARGS) || (cd $(HI_SPI_EMMC_IMAGE_DIR) && $(MKBOOTARGS) \
		-s 64 -r $(SPI_EMMC_BOOTARGS) -o bootargs.bin > /dev/null))
    ifeq ($(CFG_HI_DONGLE_SUPPORT),y)
		$(AT)(test ! -f $(SPI_EMMC_BOOTARGS_DONGLE) || (cd $(HI_SPI_EMMC_IMAGE_DIR) && $(MKBOOTARGS) \
			-s 64 -r $(SPI_EMMC_BOOTARGS_DONGLE) -o bootargs_dongle.bin > /dev/null))
    endif
endif

ifeq ($(CFG_HI_SPI_SUPPORT),y)
	$(AT)test -d $(HI_SPI_IMAGE_DIR) || mkdir -p $(HI_SPI_IMAGE_DIR)
	$(AT)test ! -f $(SPI_PARTITIONS) || cp -f $(SPI_PARTITIONS) $(HI_SPI_IMAGE_DIR)/
ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv430)
	$(AT)test ! -f $(SPI_PARTITIONS_LITE) || cp -f $(SPI_PARTITIONS_LITE) $(HI_SPI_IMAGE_DIR)/
endif
	$(AT)cp -f $(HI_PREBUILTS_DIR)/logo.img         $(HI_SPI_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/baseparam.img    $(HI_SPI_IMAGE_DIR)/
	$(AT)cp -f $(HI_PREBUILTS_DIR)/pq_param.bin     $(HI_SPI_IMAGE_DIR)/
ifeq ($(CFG_HI_ADVCA_TYPE),CONAX)
ifeq ($(CASIMAGE), $(wildcard $(CASIMAGE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/casimage.bin     $(HI_SPI_IMAGE_DIR)/casimage.bin
endif
ifeq ($(VSCSTORE), $(wildcard $(VSCSTORE)))
	$(AT)cp -f $(HI_PREBUILTS_DIR)/vscstore.bin     $(HI_SPI_IMAGE_DIR)/vscstore.bin
endif
endif

	$(AT)(test ! -f $(SPI_BOOTARGS) || (cd $(HI_SPI_IMAGE_DIR) && $(MKBOOTARGS) \
		-s 64 -r $(SPI_BOOTARGS) -o bootargs.bin > /dev/null))
	$(AT)(test ! -f $(SPI_BOOTARGS_LITE) || (cd $(HI_SPI_IMAGE_DIR) && $(MKBOOTARGS) \
		-s 64 -r $(SPI_BOOTARGS_LITE) -o bootargs.bin > /dev/null))
    ifeq ($(CFG_HI_DONGLE_SUPPORT),y)
		$(AT)(test ! -f $(SPI_BOOTARGS_DONGLE) || (cd $(HI_SPI_IMAGE_DIR) && $(MKBOOTARGS) \
			-s 64 -r $(SPI_BOOTARGS_DONGLE) -o bootargs_dongle.bin > /dev/null))
    endif
endif

endif
