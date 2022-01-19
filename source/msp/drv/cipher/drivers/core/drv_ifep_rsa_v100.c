/*****************************************************************************

    Copyright (C), 2017, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : drv_ifep_rsa_v100.c
  Version       : Initial Draft
  Created       : 2017
  Last Modified :
  Description   :
  Function List :
  History       :
******************************************************************************/
#include "drv_ifep_rsa_v100.h"
#include "drv_srsa.h"
#include "drv_trng.h"

#ifdef CHIP_IFEP_RSA_VER_V100

/*************************** Structure Definition ****************************/
/** \addtogroup     rsa */
/** @{ */  /** <!-- [rsa] */


/*! Define the time out */
#define RSA_TIME_OUT                 5000

/* rsa support rand mask or not */
#define RSA_SUB_VER_RAND_MASK    (0x20160907)
#define RSA_SUB_VER_NORMAL       (0x00)

/* crc 16 */
#define CRC16_TABLE_SIZE          256
#define U16_MSB                   0x8000
#define BYTE_MASK                 0xFF
#define CRC16_POLYNOMIAL          0x1021
#define BLOCK_BYTES               0x08

/* rsa work mode */
#define RSA_MODE_EXP              0x00
#define RSA_MODE_CLEAR_RAM        0x02

/*! rsa already initialize or not */
static u32 rsa_initialize = HI_FALSE;

/*! Define the context of sm2 */
typedef struct
{
    u32 rsa_sub_ver;
    u32 done;                   /*!<  calculation finish flag*/
    crypto_queue_head  queue;   /*!<  quene list */
}rsa_hard_context;

static rsa_hard_context rsainfo;

/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API Declaration *****************************/
/** \addtogroup      rsa */
/** @{ */  /** <!--[rsa]*/

static u16 drv_rsa_CrcTable(u16 n)
{
    u16 nRemainder = 0;
    u16 m = 0;

    nRemainder = (unsigned short)n << 8;

    for (m = 8; m > 0; m --)
    {
        if (nRemainder & 0x8000)
        {
            nRemainder = (nRemainder << 1) ^ CRC16_POLYNOMIAL;
        }
        else
        {
            nRemainder = (nRemainder << 1);
        }
    }

    return nRemainder;
}

static u16 drv_rsa_crc16_block(u16 crc, u8 block[BLOCK_BYTES], u8 u32Rnadom[BLOCK_BYTES])
{
    u8 i, j;
    u8 val;

    for (i=0; i<BLOCK_BYTES/WORD_WIDTH; i++)
    {
        for (j=0; j<WORD_WIDTH; j++)
        {
            val = block[i*4+3-j] ^ u32Rnadom[i*4+3-j];
            crc = (crc<<BITS_IN_BYTE) ^ drv_rsa_CrcTable(((crc>>BITS_IN_BYTE) ^ val) & BYTE_MASK);
        }
    }
    return crc;
}

static u16 drv_rsa_key_crc(u8 *n, u8 *k, u32 klen, u32 randnum[2])
{
    u32 i;
    u16 crc = 0;

    for (i=0; i<klen; i+=BLOCK_BYTES)
    {
        crc = drv_rsa_crc16_block(crc, n+i, (u8*)randnum);
    }
    for (i=0; i<klen; i+=BLOCK_BYTES)
    {
        crc = drv_rsa_crc16_block(crc, k+i, (u8*)randnum);
    }
    return crc;
}

#ifdef CHIP_TYPE_hi3716mv430

#define SMCU_CRYPTO_ACCESS_CTRL          (0xF9A39094)
#define SMCU_HRSA_OCCUPY_MASK            (0x03 << 0)
#define SMCU_HRSA_OCCUPY_IDLE            (0x00 << 0)
#define SMCU_HRSA_OCCUPY_ACPU            (0x01 << 0)
#define SMCU_HRSA_OCCUPY_SMCU            (0x02 << 0)
#define SPACC_SMCU_ACCESS_HRSA_TIMEOUT   1000

s32 drv_rsa_occupy(void)
{
    u32 val = 0;
    void * reg = HI_NULL;
    u32 i;

    reg = crypto_ioremap_nocache(SMCU_CRYPTO_ACCESS_CTRL, 0x100);
    if (HI_NULL == reg)
    {
        HI_LOG_ERROR("occupy rsa ioremap failed\n");
        return HI_ERR_CIPHER_BUSY;
    }

    /* check hrsa idle status, occupied if free */
    for (i=0; i<SPACC_SMCU_ACCESS_HRSA_TIMEOUT; i++)
    {
        /* check chn idle status, occupied if free */
        val = crypto_read(reg);
        if(SMCU_HRSA_OCCUPY_IDLE != (val & SMCU_HRSA_OCCUPY_MASK))
        {
            crypto_msleep(1);
            continue;
        }

        /* occupy rsa */
        val |= SMCU_HRSA_OCCUPY_ACPU;
        crypto_write(reg, val);

        /* occupy success ? */
        val = crypto_read(reg);
        if(SMCU_HRSA_OCCUPY_ACPU == (val & SMCU_HRSA_OCCUPY_MASK))
        {
            break;
        }
    }

    crypto_iounmap(reg, 0x100);

    if (SPACC_SMCU_ACCESS_HRSA_TIMEOUT <= i)
    {
        HI_LOG_ERROR("occupy rsa failed\n");
        return HI_ERR_CIPHER_BUSY;
    }

    return HI_SUCCESS;
}

void  drv_rsa_revert(void)
{
    u32 val = 0;
    void * reg = HI_NULL;

    reg = crypto_ioremap_nocache(SMCU_CRYPTO_ACCESS_CTRL, 0x100);
    if (HI_NULL == reg)
    {
        HI_LOG_ERROR("occupy rsa ioremap failed\n");
        return;
    }

    /* check hrsa idle status, release if busy */
    val = crypto_read(reg);
    val &= ~SMCU_HRSA_OCCUPY_ACPU;
    crypto_write(reg, val);

    crypto_iounmap(reg, 0x100);
}
#else
s32 drv_rsa_occupy(void)
{
    return HI_SUCCESS;
}

void drv_rsa_revert(void)
{
    return;
}

#endif

#ifdef CRYPTO_OS_INT_SUPPORT

/*! set interrupt */
static void rsa_set_interrupt(void)
{
    u32 int_valid = 0, int_num = 0;
    U_SEC_RSA_INT_EN int_en;

    module_get_attr(CRYPTO_MODULE_ID_IFEP_RSA, &int_valid, &int_num, HI_NULL);
    if (HI_FALSE == int_valid)
    {
        return;
    }
    if (RSA_SUB_VER_RAND_MASK > rsainfo.rsa_sub_ver)
    {
        return;
    }

    int_en.u32 = IFEP_RSA_READ(REG_SEC_RSA_INT_EN);

    /*The top interrupt switch only can be enable/disable by secure CPU*/
    int_en.bits.rsa_int_en = 1;
    int_en.bits.int_en = 1;
    IFEP_RSA_WRITE(REG_SEC_RSA_INT_EN, int_en.u32);
    HI_LOG_DEBUG("RSA_INT_EN: 0x%x\n", int_en.u32);

    return;
}

static u32 drv_rsa_done_notify(void)
{
    U_SEC_RSA_INT_STATUS int_st;
    U_SEC_RSA_INT_RAW int_raw;

    int_st.u32 = IFEP_RSA_READ(REG_SEC_RSA_INT_STATUS);
    int_raw.u32 = 0x00;

    HI_LOG_DEBUG("REG_SEC_RSA_INT_STATUS: 0x%x\n", int_st.u32);

    /*Clean raw int*/
    int_raw.bits.rsa_int_raw = 1;
    IFEP_RSA_WRITE(REG_SEC_RSA_INT_RAW, int_raw.u32);

    return int_st.bits.rsa_int_status;
}

/*! sm2 interrupt process function */
static irqreturn_t drv_rsa_interrupt_isr(s32 irq, void *devId)
{
    CRYPTO_UNUSED(irq);

    drv_rsa_done_notify();

    rsainfo.done = HI_TRUE;
    HI_LOG_DEBUG("rsa wake up\n");
    crypto_queue_wait_up(&rsainfo.queue);

    return IRQ_HANDLED;
}

/*! rsa register interrupt process function */
static s32 drv_rsa_register_interrupt(void)
{
    s32 ret = HI_FAILURE;
    u32 int_valid = 0, int_num = 0;
    const char *name;

    HI_LOG_FuncEnter();

    module_get_attr(CRYPTO_MODULE_ID_IFEP_RSA, &int_valid, &int_num, &name);
    if (HI_FALSE == int_valid)
    {
        return HI_SUCCESS;
    }
    if (RSA_SUB_VER_RAND_MASK > rsainfo.rsa_sub_ver)
    {
        return HI_SUCCESS;
    }

    /* request irq */
    ret = crypto_request_irq(int_num, drv_rsa_interrupt_isr, name);
    if (HI_SUCCESS != ret)
    {
        HI_LOG_ERROR("Irq request failure, irq = %d", int_num);
        HI_LOG_PrintErrCode(HI_ERR_CIPHER_REGISTER_IRQ);
        return ret;
    }

    /* initialize queue list*/
    crypto_queue_init(&rsainfo.queue);

    HI_LOG_FuncExit();
    return HI_SUCCESS;
}

/*! rsa unregister interrupt process function */
static void drv_rsa_unregister_interrupt(void)
{
    u32 int_valid = 0, int_num = 0;
    const char *name = HI_NULL;

    HI_LOG_FuncEnter();

    module_get_attr(CRYPTO_MODULE_ID_IFEP_RSA, &int_valid, &int_num, &name);

    if (HI_FALSE == int_valid)
    {
        return;
    }
    if (RSA_SUB_VER_RAND_MASK > rsainfo.rsa_sub_ver)
    {
        return;
    }

    /* free irq */
    HI_LOG_DEBUG("rsa free irq, num %d, name %s\n", int_num, name);
    crypto_free_irq(int_num, name);

    HI_LOG_FuncExit();

    return;
}
#endif

s32 drv_rsa_init(void)
{
    s32 ret = HI_FAILURE;

    HI_LOG_FuncEnter();

    HI_LOG_DEBUG("enable rsa\n");

    if (HI_TRUE == rsa_initialize)
    {
        return HI_SUCCESS;
    }

    ret = drv_rsa_occupy();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(drv_rsa_occupy, ret);
        return ret;
    }

    module_enable(CRYPTO_MODULE_ID_IFEP_RSA);
    rsainfo.rsa_sub_ver = IFEP_RSA_READ(REG_SEC_RSA_VERSION_ID);
    HI_LOG_DEBUG("rsa version 0x%x\n", rsainfo.rsa_sub_ver);
    module_disable(CRYPTO_MODULE_ID_IFEP_RSA);

    drv_rsa_revert();

#ifdef CRYPTO_OS_INT_SUPPORT
    {
        s32 ret = HI_FAILURE;

        HI_LOG_DEBUG("rsa register interrupt function\n");
        ret = drv_rsa_register_interrupt();
        if (HI_SUCCESS != ret)
        {
            HI_LOG_ERROR("error, register interrupt failed\n");
            HI_LOG_PrintFuncErr(drv_rsa_register_interrupt, ret);
            return ret;
        }
    }
#endif

    rsa_initialize = HI_TRUE;

    HI_LOG_FuncExit();
    return HI_SUCCESS;
}

s32 drv_rsa_deinit(void)
{
    HI_LOG_FuncEnter();

    if (HI_FALSE == rsa_initialize)
    {
        return HI_SUCCESS;
    }

#ifdef CRYPTO_OS_INT_SUPPORT
    drv_rsa_unregister_interrupt();
#endif

    rsa_initialize = HI_FALSE;

    HI_LOG_FuncExit();
    return HI_SUCCESS;
}

static s32 drv_rsa_resume(void)
{
    s32 ret = HI_FAILURE;

    HI_LOG_FuncEnter();

    ret = drv_rsa_occupy();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(drv_rsa_occupy, ret);
        return ret;
    }

    module_enable(CRYPTO_MODULE_ID_IFEP_RSA);

#ifdef CRYPTO_OS_INT_SUPPORT
    HI_LOG_DEBUG("rsa interrupt configure\n");
    rsa_set_interrupt();
#endif

    HI_LOG_FuncExit();
    return HI_SUCCESS;
}

static void drv_rsa_suspend(void)
{
    HI_LOG_FuncEnter();

    module_disable(CRYPTO_MODULE_ID_IFEP_RSA);

    drv_rsa_revert();

    HI_LOG_FuncExit();
    return;
}

static void drv_rsa_set_width(rsa_key_width width)
{
    U_SEC_RSA_MOD_REG ctrl;

    ctrl.u32 = 0x00;
    ctrl.bits.sec_rsa_mod_sel = RSA_MODE_EXP;
    ctrl.bits.sec_rsa_key_width = width;
    IFEP_RSA_WRITE(REG_SEC_RSA_MOD_REG, ctrl.u32);
    HI_LOG_DEBUG("REG_SEC_RSA_MOD_REG 0x%x\n", ctrl.u32);
    return;
}

static void drv_rsa_set_key(u8 *n, u8 *d, u32 klen, u32 random[2])
{
    u32 i =0, id = 0;
    u32 val = 0x00;

    /**
     * The even word shell XOR with even random[0]
     * The odd word shell XOR with odd random[1]
     * The random may be zero.
     * Must set N before set E.
     * The E must padding with zero.
     */

    /* Set N */
    for (i=0; i<klen; i+=WORD_WIDTH)
    {
        crypto_memcpy(&val, sizeof(u32), n + i, WORD_WIDTH);
        val ^= random[id];
        IFEP_RSA_WRITE(REG_SEC_RSA_WSEC_REG, val);

        /* switch between even and odd */
        id ^= 0x01;
    }

    /* Set D */
    for (i=0; i<klen; i+=WORD_WIDTH)
    {
        crypto_memcpy(&val, sizeof(u32), d + i, WORD_WIDTH);
        val ^= random[id];
        IFEP_RSA_WRITE(REG_SEC_RSA_WSEC_REG, val);

        /* switch between even and odd */
        id ^= 0x01;
    }
    return;
}

static void drv_rsa_set_input(u8 *in, u32 klen)
{
    u32 i =0;
    u32 val =0x00;

    for (i=0; i<klen; i+=WORD_WIDTH)
    {
        crypto_memcpy(&val, sizeof(u32), in + i, WORD_WIDTH);
        IFEP_RSA_WRITE(REG_SEC_RSA_WDAT_REG, val);
    }
    return;
}

static void drv_rsa_get_output(u8 *out, u32 klen)
{
    u32 i =0;
    u32 val =0x00;

    for (i=0; i<klen; i+=4)
    {
        val = IFEP_RSA_READ(REG_SEC_RSA_RRSLT_REG);
        crypto_memcpy(out + i, sizeof(u32), &val, 4);
    }
    return;
}

static u32 drv_rsa_get_klen(rsa_key_width width)
{
    u32 klen = 0x00;

    /* nonsupport rsa 3072, can compute it as 4096 */

    switch(width)
    {
        case RSA_KEY_WIDTH_1024:
        {
            klen = RSA_KEY_LEN_1024;
            break;
        }
        case RSA_KEY_WIDTH_2048:
        {
            klen = RSA_KEY_LEN_2048;
            break;
        }
        case RSA_KEY_WIDTH_4096:
        {
            klen = RSA_KEY_LEN_4096;
            break;
        }
        default:
        {
            HI_LOG_ERROR("error, nonsupport RSA width %d\n", width);
            klen = 0;
            break;
        }
    }

    return klen;
}

static void drv_rsa_start(void)
{
    U_SEC_RSA_START_REG start;

    HI_LOG_FuncEnter();

    rsainfo.done = HI_FALSE;

    start.u32 = 0x00;

    if (RSA_SUB_VER_RAND_MASK <= rsainfo.rsa_sub_ver)
    {
        start.bits.sec_rsa_start_reg = 0x05;
    }
    else
    {
        start.bits.sec_rsa_start_reg = 0x01;
    }

    IFEP_RSA_WRITE(REG_SEC_RSA_START_REG, start.u32);
    HI_LOG_DEBUG("REG_SEC_RSA_START_REG 0x%x\n", start.u32);

    HI_LOG_FuncExit();

    return;
}

static s32 drv_rsa_wait_done(void)
{
    u32 int_valid = 0, int_num = 0;
    u32 i;
    U_SEC_RSA_BUSY_REG ready;
    const char *name = HI_NULL;

    HI_LOG_FuncEnter();

    module_get_attr(CRYPTO_MODULE_ID_IFEP_RSA, &int_valid, &int_num, &name);

#ifdef CRYPTO_OS_INT_SUPPORT
    /* interrupt support, wait irq*/
    if (RSA_SUB_VER_RAND_MASK <= rsainfo.rsa_sub_ver && HI_TRUE == int_valid)
    {
        s32 ret = HI_FAILURE;

        /* wait interrupt */
        ret = crypto_queue_wait_timeout(rsainfo.queue, rsainfo.done != HI_FALSE, RSA_TIME_OUT);
        if (0x00 == ret)
        {
            HI_LOG_ERROR("wait done timeout\n");
            HI_LOG_PrintFuncErr(crypto_queue_wait_timeout, ret);
            return HI_ERR_CIPHER_TIMEOUT;
        }
    }
    else
#endif
    {
        /* wait ready */
        for (i=0; i<RSA_TIME_OUT; i++)
        {
            ready.u32 = IFEP_RSA_READ(REG_SEC_RSA_BUSY_REG);
            if (!ready.bits.sec_rsa_busy_reg)
            {
                break;
            }
            crypto_msleep(1);
        }

        if (RSA_TIME_OUT <= i)
        {
            HI_LOG_ERROR("error, rsa wait free timeout\n");
            HI_LOG_PrintErrCode(HI_ERR_CIPHER_TIMEOUT);
            return HI_ERR_CIPHER_TIMEOUT;
        }
    }

    HI_LOG_FuncExit();
    return HI_SUCCESS;
}

static void drv_rsa_randnum(u8 *n, u8 *k, u32 klen, u32 random[2])
{
    u16 crc16 = 0;

    HI_LOG_FuncEnter();

    if (RSA_SUB_VER_RAND_MASK <= rsainfo.rsa_sub_ver)
    {
        random[0] = get_rand();
        random[1] = get_rand();

        crc16 = drv_rsa_key_crc(n, k, klen, random);
        HI_LOG_DEBUG("random 0x%x 0x%x, CRC16: 0x%x\n", random[0], random[1], crc16);
        IFEP_RSA_WRITE(REG_SEC_RSA_KEY_RANDOM_1, random[0]);
        IFEP_RSA_WRITE(REG_SEC_RSA_KEY_RANDOM_2, random[1]);
        IFEP_RSA_WRITE(REG_SEC_RSA_CRC16_REG, crc16);
    }
    else
    {
        random[0] = 0x00;
        random[1] = 0x00;
    }

    HI_LOG_FuncExit();

    return;
}

static s32 drv_rsa_clean_ram(void)
{
    s32 ret = HI_FAILURE;
    U_SEC_RSA_MOD_REG ctrl;

    ctrl.u32 = IFEP_RSA_READ(REG_SEC_RSA_MOD_REG);
    ctrl.bits.sec_rsa_mod_sel = RSA_MODE_CLEAR_RAM;
    ctrl.bits.sec_rsa_data0_clr = 1;
    ctrl.bits.sec_rsa_data1_clr = 1;
    ctrl.bits.sec_rsa_data2_clr = 1;
    IFEP_RSA_WRITE(REG_SEC_RSA_MOD_REG, ctrl.u32);

    /* start */
    drv_rsa_start();

    /* wait done */
    ret = drv_rsa_wait_done();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(drv_rsa_wait_done, ret);
        return ret;
    }

    return HI_SUCCESS;
}

static s32 drv_rsa_error_code(void)
{
    u32 code = 0;
    s32 ret = HI_FAILURE;

    HI_LOG_FuncEnter();

    if (RSA_SUB_VER_RAND_MASK <= rsainfo.rsa_sub_ver)
    {
        code = IFEP_RSA_READ(REG_SEC_RSA_ERROR_REG);
    }

    if (0x00 == code)
    {
        ret = HI_SUCCESS;
    }
    else
    {
        HI_LOG_ERROR("rsa error code: 0x%x\n", code);
        HI_LOG_PrintErrCode(HI_ERR_CIPHER_HARD_STATUS);
        return HI_ERR_CIPHER_HARD_STATUS;
    }

    HI_LOG_FuncExit();

    return ret;
}

s32 drv_ifep_rsa_exp_mod(u8 *n, u8 *k, u8 *in, u8 *out, rsa_key_width width)
{
    s32 ret = HI_FAILURE;
    u32 klen = 0;
    u32 random[2] = {0, 0};

    HI_LOG_FuncEnter();

    HI_LOG_CHECK_INITED(rsa_initialize);

    ret = drv_rsa_resume();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(drv_rsa_resume, ret);
        return ret;
    }

    klen = drv_rsa_get_klen(width);
    if (0 == klen)
    {
        ret = HI_ERR_CIPHER_INVALID_PARA;
        goto exit;
    }

    HI_LOG_INFO("[RSA] compute exp-mod, klen 0x%x\n", klen);

    //HI_PRINT_HEX("n", n, klen);
    //HI_PRINT_HEX("k", k, klen);
    //HI_PRINT_HEX("in", in, klen);

    /* set rsa width */
    drv_rsa_set_width(width);

    /* config randnum */
    drv_rsa_randnum(n, k, klen, random);

    /* set rsa key */
    drv_rsa_set_key(n, k, klen, random);

    /* set input data */
    drv_rsa_set_input(in, klen);

    /* start */
    drv_rsa_start();

    /* wait done */
    ret = drv_rsa_wait_done();
    if (HI_SUCCESS != ret)
    {
        HI_LOG_PrintFuncErr(drv_rsa_wait_done, ret);
        ret = HI_ERR_CIPHER_TIMEOUT;
        goto exit;
    }

    /* get input data */
    drv_rsa_get_output(out, klen);

    //HI_PRINT_HEX("out", out, klen);

    ret = drv_rsa_error_code();
exit:
    /* clean key and data */
    (void)drv_rsa_clean_ram();
    drv_rsa_suspend();

    HI_LOG_FuncExit();

    return ret;
}

void drv_ifep_rsa_get_capacity(rsa_capacity *capacity)
{
    crypto_memset(capacity, sizeof(rsa_capacity), 0,  sizeof(rsa_capacity));

    capacity->rsa = CRYPTO_CAPACITY_SUPPORT;

    return;
}

/** @} */  /** <!-- ==== API declaration end ==== */

#endif //End of CHIP_RSA_VER_V100
