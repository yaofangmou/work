#include "base.h"

/*************************************************************************
                        lsadc  module
*************************************************************************/
#define REG_SC_LSADC_CTRL_EN_B      (1 << 1)
#define REG_SC_LSADC_CTRL_PD_CTRL   (1 << 8)
#define REG_SC_LSADC_CTRL_RESET     (1 << 9)

#define SC_WDG_RST_CTRL_ADDR        (0xF8000050)
#define REG_SC_LSADC_CTRL           (CFG_BASE_ADDR + 0x6c)
#define REG_SC_LSADC_DATA           (CFG_BASE_ADDR + 0x70)
#define REG_SC_LSADC_DATA_B_MASK    (0x3FF)

struct lsadc_volt_region {
    HI_U16 vmin;
    HI_U16 vmax;
};
/*
normal  3.3V    1023
STANDBY 2.749V  853
CH+     2.2v    682
CH-     1.65v   512
*/
static struct lsadc_volt_region lsadc_volt_regions[] = {
    {1006, 1023},
    {827, 878},
    {662, 704},
    {496, 528},
};

void lsadc_enable(void)
{
    HI_U32 regval;

    /* enable LSADC channel B*/
    regval = HI_SYS_ReadRegister(REG_SC_LSADC_CTRL);
    regval &= ~REG_SC_LSADC_CTRL_PD_CTRL;
    HI_SYS_WriteRegister(regval, REG_SC_LSADC_CTRL);

    regval = HI_SYS_ReadRegister(REG_SC_LSADC_CTRL);
    regval &= ~REG_SC_LSADC_CTRL_RESET;
    HI_SYS_WriteRegister(regval, REG_SC_LSADC_CTRL);

    wait_minute_2(10, 10);

    regval = HI_SYS_ReadRegister(REG_SC_LSADC_CTRL);
    regval |= REG_SC_LSADC_CTRL_EN_B;
    HI_SYS_WriteRegister(regval, REG_SC_LSADC_CTRL);
}

void lsadc_disable(void)
{
    /* disable LSADC channel B*/
    regAddr.val32 = REG_SC_LSADC_CTRL;
    read_regVal();
    regData.val8[3] &= 0xfd; //bit1 to 0: disable LSADC B channel
    write_regVal();
}

HI_S32 get_lsadc_volt_region_index(void)
{
    int ix;
    HI_U32 lsadc_val;

    /*read data of LSADC B channel: bit[25:16]*/
    lsadc_val = (HI_SYS_ReadRegister(REG_SC_LSADC_DATA) >> 16) & REG_SC_LSADC_DATA_B_MASK;

    for (ix = 0; ix < 4; ix++)
    {
        if (lsadc_volt_regions[ix].vmin <= lsadc_val &&
            lsadc_val <= lsadc_volt_regions[ix].vmax)
            return ix;
    }

    return -1;
}

