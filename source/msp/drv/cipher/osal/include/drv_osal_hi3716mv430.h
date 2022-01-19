/* the total cipher hard channel which we can used*/
#define CIPHER_HARD_CHANNEL_CNT         (0x06)

/* mask which cipher channel we can used, bit0 means channel 0*/
#define CIPHER_HARD_CHANNEL_MASK        (0xFC)

/* the total hash hard channel which we can used*/
#define HASH_HARD_CHANNEL_CNT           (0x01)

/* mask which cipher channel we can used, bit0 means channel 0*/
#define HASH_HARD_CHANNEL_MASK          (0x04)
#define HASH_HARD_CHANNEL               (0x02)

/* the total cipher hard key channel which we can used*/
#define CIPHER_HARD_KEY_CHANNEL_CNT     (0x02)

/* mask which cipher hard key channel we can used, bit0 means channel 0*/
#define CIPHER_HARD_KEY_CHANNEL_MASK    (0x0C)

/* support smmu*/
//#define CRYPTO_SMMU_SUPPORT

/* support interrupt*/
#define CRYPTO_OS_INT_SUPPORT

/* secure cpu*/
#define CRYPTO_SEC_CPU

/* MSR 2.2 remove CAUK within hi3796mv200, so needn't support hash_cmac any more after hi3796mv200 */
//#define HASH_CMAC_SUPPORT

/* the hardware version */
#define CHIP_SYMC_VER_V200
#define CHIP_TRNG_VER_V200
#define CHIP_HDCP_VER_V200
#define CHIP_HASH_VER_V200

#ifdef HI_PRODUCT_RSA_SUPPORT
#define CHIP_IFEP_RSA_VER_V100
#endif

//#define CHIP_SM2_VER_V100

/* supoort odd key */
#define CHIP_SYMC_ODD_KEY_SUPPORT

/* supoort SM1 */
//#define CHIP_SYMC_SM1_SUPPORT

/* supoort SM4 */
//#define CHIP_SYMC_SM4_SUPPORT

/* supoort spacc channel contest */
#define SPACC_CHN_WHO_USED_SUPPORT

/* the hardware capacity */
#ifdef HI_PRODUCT_AEAD_SUPPORT
#define CHIP_AES_CCM_GCM_SUPPORT
#endif

/* symc cpu key from klad */
#define CHIP_SYMC_CPU_KEY_FROM_KLAD

/* the software capacity */
//#define SOFT_AES_SUPPORT
//#define SOFT_TDES_SUPPORT
//#define SOFT_AES_CCM_GCM_SUPPORT
//#define SOFT_SHA1_SUPPORT
//#define SOFT_SHA256_SUPPORT
//#define SOFT_SHA512_SUPPORT
#ifdef HI_PRODUCT_SM2_SUPPORT
//#define SOFT_SM2_SUPPORT
#endif
#ifdef HI_PRODUCT_SM3_SUPPORT
//#define SOFT_SM3_SUPPORT
#endif
#ifdef HI_PRODUCT_SM1_SM4_SUPPORT
//#define SOFT_SM4_SUPPORT
#endif

#ifdef HI_PRODUCT_ECC_SUPPORT
#define SOFT_ECC_SUPPORT
#endif

/* moudle unsupport, we need set the table*/
#define BASE_TABLE_NULL    {\
    .reset_valid = 0,  \
    .clk_valid = 0, \
    .phy_valid = 0, \
    .crg_valid = 0, \
    .ver_valid = 0, \
    .int_valid = 0, \
}

/* define initial value of struct sys_arch_boot_dts for cipher*/
#define HARD_INFO_CIPHER {\
    .name = "cipher",  \
    .reset_valid = 0,  \
    .clk_valid = 1, \
    .phy_valid = 1, \
    .crg_valid = 1, \
    .ver_valid = 1, \
    .int_valid = 1, \
    .int_num = 100, \
    .version_reg = 0x308, \
    .version_val = 0x20180328, \
    .reg_addr_phy = 0xF9A00000, \
    .reg_addr_size = 0x4000,    \
    .crg_addr_phy = 0xF8A22410, \
    .reset_bit = 4, \
    .clk_bit = 0, \
}

/* define initial value of struct sys_arch_boot_dts for cipher*/
#define HARD_INFO_HASH {\
    .name = "cipher",  \
    .reset_valid = 0,  \
    .clk_valid = 0, \
    .phy_valid = 1, \
    .crg_valid = 0, \
    .ver_valid = 0, \
    .int_valid = 1, \
    .int_num = 100, \
    .reg_addr_phy = 0xF9A00000, \
    .reg_addr_size = 0x4000, \
}

/* define initial value of struct sys_arch_boot_dts for HASH*/
#define HARD_INFO_TRNG {\
    .name = "trng",  \
    .reset_valid = 0,  \
    .clk_valid = 0, \
    .phy_valid = 1, \
    .crg_valid = 0, \
    .ver_valid = 0, \
    .int_valid = 0, \
    .reg_addr_phy = 0xF8abc200,  \
    .reg_addr_size = 0x100,   \
}

/* define initial value of struct sys_arch_boot_dts for IFEP RSA*/
#define HARD_INFO_IFEP_RSA {\
    .name = "rsa",  \
    .reset_valid = 1,  \
    .clk_valid = 1, \
    .phy_valid = 1, \
    .crg_valid = 1, \
    .ver_valid = 1, \
    .int_valid = 1, \
    .reg_addr_phy = 0xF9A30000,  \
    .reg_addr_size = 0x1000,\
    .crg_addr_phy = 0xF8A80060, \
    .reset_bit = 15, \
    .clk_bit = 16, \
    .int_num = 107, \
    .version_reg = 0x90, \
    .version_val = 0x20170718, \
}

#define HARD_INFO_SMMU             BASE_TABLE_NULL
#define HARD_INFO_SIC_RSA          BASE_TABLE_NULL
#define HARD_INFO_CIPHER_KEY       BASE_TABLE_NULL
#define HARD_INFO_SM4              BASE_TABLE_NULL
#define HARD_INFO_SM2              BASE_TABLE_NULL

