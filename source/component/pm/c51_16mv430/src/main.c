#include "base.h"
#include "gpio.h"
#include "keyled.h"
#include "ir.h"
#include "timer.h"
#include "hdmi_v2/hdmi_mcu_task.h"

HI_U8 g_u8ChipType = 0;
HI_U16 g_u16ChipId = 0;
static HI_U8 g_u8HighWakeUp;

static DATA_U32_S g_u32GpioPort;
static HI_U8 kltype = 0;

HI_U8 g_u8KeyEnterPmoc = 0x0;

HI_U8 g_u8GpioIEV = 0; //0:Falling edge or low level; 1: Rising edge or high level
HI_U8 g_u8GpioIBE = 0; //0:single edge; 1:double edge
HI_U8 g_u8GpioIS  = 0; //0:edge; 1: level

static HI_U8 g_u8CECWakeUpEnable = 0;

HI_U32 g_u32DateBaseAddr = DATA_BASE_ADDR;

HI_BOOL g_bBootSuspend = HI_FALSE;

HI_U32  switchStdbyModeTime = 0x0;
HI_BOOL ethToNomalStdby = HI_FALSE;

#define MCU_LOAD_CODE 0x12345678
#define ENTER_PMOC_FLAG 0x1
#define MCU_BOOT_SUSPEND_FLAG 0x12345678

#define KEYLED_TYPE_GPIOKEY 5

void SystemPowerDown(void);

/*************************************************************************
                        main  module
*************************************************************************/
HI_U8 intStatus, intStatus1, intStatus2, intStatus3;
HI_VOID intr_process() interrupt 4
{
    HI_U8 i;

    if (HI_FALSE != pmocflag)
    {
        return;
    }

    EA = 0;
    INT_MASK_0 = 0x0;
    INT_MASK_1 = 0x0;
    INT_MASK_2 = 0x0;
    INT_MASK_3 = 0x0;

    intStatus  = INT_STATUS_IP0;
    intStatus1 = INT_STATUS_IP1;
    intStatus2 = INT_STATUS_IP2;
    intStatus3 = INT_STATUS_IP3;

    if (intStatus & 0x10) //bit4
    {
        for (i = 0; i < 4; i++)
        {
            if (g_u32GpioPort.val8[i] != 0)
            {
                gpio_isr(g_u32GpioPort.val8[i]);
                if (pmocflag == HI_TRUE)
                {
                    intStatus &= 0xef;
                }
            }
        }
    }

    /* The keyled who use GPIO to get key has no interrupt, so it needs other */
    /* interrupts to help itself to check key.                                */
#if (defined KEYLED_CT1642_INNER) || (defined KEYLED_74HC164)
    if ((intStatus & 0x10)) //bit4
#endif
    {
        if (kltype != KEYLED_TYPE_GPIOKEY)
        {
            KEYLED_Isr();
        }
    }

    if (intStatus & 0x02) //bit1
    {
        TIMER_Isr();

        if (0 == switchStdbyModeTime && HI_TRUE == ethToNomalStdby)
        {
            g_u8HighWakeUp = NORMAL_WAKEUP;

            if (!(dbgmask & 0x4))
            {
                SystemPowerDown();
            }
        }
    }

    if (intStatus & 0x08) //bit3
    {
        IR_Isr();
    }

    if (intStatus2 & 0x10) //bit20
    {
        /* clear the interrupt */
        regAddr.val32 = 0xf9840a00;
        read_regValEx();
        regData.val8[3] = 0x60;
        write_regValEx();

        pmocflag = HI_TRUE;
        pmocType = HI_UNF_PMOC_WKUP_ETH;
    }

    if (intStatus2 & 0x01) //bit 16
    {
        //printf_char('u');
        pmocflag = HI_TRUE;
        pmocType = HI_UNF_PMOC_WKUP_USB;
    }

    if ((intStatus3 & 0x20) && (g_u8CECWakeUpEnable))//bit29
    {
        MCU_HDMI_TaskIrqHandle();
    }

    if (pmocflag == HI_FALSE)
    {
        INT_MASK_0 = 0x1a;
        INT_MASK_1 = 0x20;
        INT_MASK_2 = 0x11;

        if (g_u8CECWakeUpEnable)
        {
            INT_MASK_3 = 0x20;
        }
    }

    EA = 1;

    return;
}

HI_VOID MCUInit(HI_VOID)
{
    EA = 0;
    ARM_INTR_MASK = 0xff;  // intr mask
    INT_MASK_0 = 0x1a;     //  key ir timer intr
    INT_MASK_1 = 0x20;     // GPIO_STB1
    INT_MASK_2 = 0x11;     //GSF usb


    RI = 0;
    TI = 0;
    ES = 1;

    pmocflag = HI_FALSE;

    return;
}

HI_VOID GetBaseParams(HI_VOID)
{
    /* Get the boot suspend flag */
    regAddr.val32 = DATA_BOOT_SUSPEND_FLAG;
    read_regValEx();
    if (regData.val32 == MCU_BOOT_SUSPEND_FLAG)
    {
        g_bBootSuspend = HI_TRUE;
    }

    return;
}

HI_VOID PrintInitParams(HI_VOID)
{
#ifndef HI_ADVCA_RELEASE
    HI_U8 i;

    printf_str("======== [16mv430 MCU PARAM 1023] ======== \r\n");
    printf_str("Chip Type:");
    printf_hex(g_u8ChipType);
    printf_str("Chip Version:");
    printf_hex(g_u16ChipId);
    printf_str("Suspend Type:");
    printf_hex(g_u8HighWakeUp);
    printf_str("Reboot Enable:");
    printf_hex(wdgon);
    printf_str("Debug Mask:");
    printf_hex(dbgmask);
    printf_str("HDMI CEC Wakeup Enable:");
    printf_hex(g_u8CECWakeUpEnable);
    printf_str("Power off/on Gpio No:");
    printf_hex(GpioValArray[0]);
    printf_str("Power off/on Gpio Value:");
    printf_hex(GpioValArray[1]);
    printf_str("Display Mode:");
    printf_hex(time_type);
    printf_str("Display Time Hour:");
    printf_hex(time_hour);
    printf_str("Display Time Minute:");
    printf_hex(time_minute);
    printf_str("Display Time Second:");
    printf_hex(time_second);
    printf_str("WakeUp Time:");
    printf_hex(waittime.val32);
    printf_str("WakeUp key type:");
    printf_hex(kltype);
    printf_str("WakeUp Key:");
    printf_hex(klPmocVal);
    printf_str("IR Type:");
    printf_hex(ir_type);
    printf_str("IR No:");
    printf_hex(ir_pmocnum);
    printf_str("switchStdbyModeTime:");
    printf_hex(switchStdbyModeTime);

    for (i = 0; i < ir_pmocnum; i++)
    {
        printf_str("IR KeyLow:");
        printf_hex(irPmocLval[i].val32);
        printf_str("IR KeyHigh:");
        printf_hex(irPmocHval[i].val32);
    }

    printf_str("WakeUpGpioNo:");
    printf_hex(g_u32GpioPort.val32);

    printf_str("======== [MCU Init Ready] ======== \r\n");
#endif

    return;
}

HI_VOID GetInitParams(HI_VOID)
{
    HI_U8 i;

    /* Get the standby scene */
    regAddr.val32 = g_u32DateBaseAddr + DATA_CHIP;
    read_regValEx();
    g_u8ChipType = regData.val8[3];
    g_u8HighWakeUp = regData.val8[2];
    g_u16ChipId = regData.val16[0];

    regAddr.val32 = g_u32DateBaseAddr + DATA_WDGON;
    read_regValEx();
    wdgon = regData.val8[3] & 0x1;

    switchStdbyModeTime = (regData.val32 >> 8) & 0xFFFFFF;

    if ((0 != switchStdbyModeTime) && (ETH_WAKEUP == g_u8HighWakeUp))
    {
        ethToNomalStdby = HI_TRUE;
    }

    /* Get the debug param */
    regAddr.val32 = g_u32DateBaseAddr + DATA_DBGMASK;
    read_regValEx();
    dbgmask = regData.val8[3] & 0x7;
    g_u8CECWakeUpEnable = regData.val8[2];

    /*record gpio index, between 40 and 47 */
    regAddr.val32 = g_u32DateBaseAddr + DATA_GPIO0;
    read_regValEx();
    GpioValArray[0] = regData.val8[3];

    /*record gpio output, 1 or 0 */
    regAddr.val32 = g_u32DateBaseAddr + DATA_GPIO1;
    read_regValEx();
    GpioValArray[1] = regData.val8[3];
    g_u8GpioIEV = regData.val8[2];
    g_u8GpioIBE = regData.val8[1];
    g_u8GpioIS  = regData.val8[0];

    regAddr.val32 = g_u32DateBaseAddr + DATA_KEYTYPE;
    read_regValEx();
    kltype = regData.val8[3];

    /* Get timer param */
    if (kltype != KEYLED_TYPE_GPIOKEY)
    {
        regAddr.val32 = g_u32DateBaseAddr + DATA_DISPMODE;
        read_regValEx();
        time_type = regData.val8[3];

        regAddr.val32 = g_u32DateBaseAddr + DATA_DISPVAL;
        read_regValEx();
        if (time_type == TIME_DISPLAY)
        {
            // timer display
            if ((regData.val8[1] >= 24)
                || (regData.val8[2] >= 60)
                || (regData.val8[3] >= 60))
            {
                // default value
                time_hour = 9;
                time_minute = 58;
                time_second = 0;
            }
            else
            {
                time_hour = regData.val8[1];
                time_minute = regData.val8[2];
                time_second = regData.val8[3];
            }
        }
    }

    /* Get the time out of wake up */
    regAddr.val32 = g_u32DateBaseAddr + DATA_TIMEVAL;
    read_regValEx();
    waittime.val32 = regData.val32;

    regAddr.val32 = g_u32DateBaseAddr + DATA_KEYVAL;
    read_regValEx();
    klPmocVal = regData.val8[3];

    /* Get gpio port param */
    regAddr.val32 = g_u32DateBaseAddr + DATA_GPIOPORT;
    read_regValEx();
    g_u32GpioPort.val32 = regData.val32;

    /* Get the IR param */
    regAddr.val32 = g_u32DateBaseAddr + DATA_IRTYPE;
    read_regValEx();
    ir_type = regData.val8[3];

    regAddr.val32 = g_u32DateBaseAddr + DATA_IRNUM;
    read_regValEx();
    ir_pmocnum = regData.val8[3];
    if (ir_pmocnum > IR_PMOC_NUM)
    {
        ir_pmocnum = IR_PMOC_NUM;
    }

    regAddr.val32 = g_u32DateBaseAddr + DATA_IRVAL;
    for (i = 0; i < ir_pmocnum; i++)
    {
        read_regValEx();
        irPmocLval[i].val32 = regData.val32;
        regAddr.val8[3] += 0x4;
        read_regValEx();
        irPmocHval[i].val32 = regData.val32;
        regAddr.val8[3] += 0x4;
    }

    PrintInitParams();

    return;
}

void GetTimePeriod(void)
{
    HI_U32 u32TimePeriod = 0;

    regAddr.val32 = g_u32DateBaseAddr + DATA_TIMEVAL;
    read_regValEx();
    u32TimePeriod = regData.val32 - waittime.val32;

    /* save standby period in 51 ram */
    regAddr.val32 = DATA_PERIOD;
    regData.val32 = u32TimePeriod;
    write_regValEx();

#ifndef HI_ADVCA_RELEASE
    printf_str("Suspend Period:");
    printf_hex(u32TimePeriod);
#endif

    // record wakeup type in C51 Ram
    regAddr.val32 = DATA_WAKEUPTYPE;
    regData.val32 = 0x0;
    regData.val8[3] = pmocType;
    write_regValEx();

    return;
}

void SystemPowerDown(void)
{
    /*set the delay 100ms between power up and  revocation of reset*/
    /* (1000 / 12) * 0x124f80 ns  */
    regAddr.val32 = 0xf8000038;
    regData.val32 = 0x124f80;
    write_regVal();

    regAddr.val32 = 0xf8000008;
    regData.val32 = 0x0;
    write_regVal();

    while (1)
    {
        regAddr.val32 = 0xf8000040;
        read_regVal();
        if ((regData.val8[3] & 0xf0) == 0x50) //bit[7:4]
        {
            break;
        }
    }

    /* set ddrphy to retension */
    regAddr.val32 = 0xf8000058;
    regData.val32 = 0x2;
    write_regVal();

    return;
}

void PowerOffPeripheral(void)
{
    if (0 != GpioValArray[0])
    {
        gpio5_dirset_bit(GpioValArray[0]%8, 0);
        gpio5_write_bit(GpioValArray[0]%8, GpioValArray[1]);
    }
}

void PowerOnPeripheral(void)
{
    if (0 != GpioValArray[0])
    {
        gpio5_dirset_bit(GpioValArray[0]%8, 0);
        gpio5_write_bit(GpioValArray[0]%8, !GpioValArray[1]);
    }
}

void SystemSuspend(void)
{
    /* change MCU bus clock to 24M / 8 */
    regAddr.val32 = CFG_BASE_ADDR + MCU_CTRL;
    read_regVal();
    regData.val8[3] &= 0xfc; //bit [1:0] = 0x0
    write_regVal();

    PowerOffPeripheral();

    if (!(dbgmask & 0x4) && (NORMAL_WAKEUP == g_u8HighWakeUp))
    {
        SystemPowerDown();
    }

    return;
}

HI_VOID SystemResume(HI_VOID)
{
    if (!(dbgmask & 0x4))
    {
        if (g_u8HighWakeUp != NORMAL_WAKEUP)
        {
            SystemPowerDown();
        }

        PowerOnPeripheral();

        /* power up */
        regAddr.val32 = 0xf8000008;
        regData.val32 = 0x1;
        write_regVal();

        while (1)
        {
            wait_minute_2(10, 10);
        }
    }
}

void WaitforEnterFlag(void)
{
    while (1)
    {
        wait_minute_2(200, 200);

        /* read kernel flag to break; */
        regAddr.val32 = DATA_ENTER_FLAG;
        read_regVal();
        if (ENTER_PMOC_FLAG == regData.val32)
        {
            regData.val32 = 0x0;
            write_regVal();
            break;
        }
        else if (TEMP_CHECK_TO_SUSPEND == regData.val32)
        {
            regData.val32 = 0x0;
            write_regVal();
            g_u8KeyEnterPmoc = 0x1;
            break;
        }
    }
}

void WaitforEnterStandbyFlag(void)
{
    HI_U32 u32KeyDownCount = 0;
    HI_U32 u32KeyUpCount = 0;
    HI_U8 u8keyDownFlag = KEY_UP;
    HI_U32 u32ResetTime = 0;
    HI_S32 s32Index = -1;

    regAddr.val32 = DATA_SUSPEND_FLAG;
    read_regValEx();

    /* first power, jump wait */
    if (regData.val32 == MCU_LOAD_CODE)
    {
        return;
    }

    lsadc_enable();

    regAddr.val32 = DATA_BASE_ADDR + DATA_RESET_TIME;
    read_regValEx();
    u32ResetTime = TIME_COUNT * regData.val8[3];

    while (1)
    {
        wait_minute_2(10, 10);

        /* read kernel flag to break; */
        regAddr.val32 = DATA_ENTER_FLAG;
        read_regVal();
        if (ENTER_PMOC_FLAG == regData.val32)
        {
            regData.val32 = 0x0;
            write_regVal();

            lsadc_disable();
            break;
        }
        else if (TEMP_CHECK_TO_SUSPEND == regData.val32)
        {
            regData.val32 = 0x0;
            write_regVal();
            g_u8KeyEnterPmoc = 0x1;

            lsadc_disable();
            break;
        }

        s32Index = get_lsadc_volt_region_index();
        if (LSADC_STANDBY_KEY == s32Index)
        {
            u32KeyUpCount = 0;
            u32KeyDownCount++;

            if ((u32KeyDownCount >= 1000) && (KEY_UP == u8keyDownFlag))//for debounce
            {
                u8keyDownFlag = KEY_DOWN;
            }

            if (u32KeyDownCount >= u32ResetTime)
            {
#ifndef HI_ADVCA_RELEASE
                dbgmask = 4;
                printf_str("system reset in LPMCU...\r\n");
                dbgmask = 0;
#endif
                SystemSuspend();
                SystemResume();
            }
        }
        else if (LSADC_NORMAL_STATUS == s32Index)
        {
            u32KeyDownCount = 0;

            if (KEY_DOWN == u8keyDownFlag)
            {
                u32KeyUpCount++;

                if (u32KeyUpCount >= 1000) //for debounce
                {
                    u8keyDownFlag = KEY_UP;
                    lsadc_disable();

                    break;
                }
            }
        }
    }
}

void main()
{
    HI_U8 i;

    MCUInit();

    GetBaseParams();

    if (g_bBootSuspend == HI_TRUE)
    {
        WaitforEnterStandbyFlag();
    }
    else
    {
        WaitforEnterFlag();
    }

#ifndef HI_ADVCA_RELEASE
    dbgmask = 4;
    printf_str("Enter MCU \r\n");
#endif
    GetInitParams();

    if (kltype != KEYLED_TYPE_GPIOKEY)
    {
        KEYLED_Init();
    }

    for (i = 0; i < 4; i++)
    {
        if (g_u32GpioPort.val8[i] != 0)
        {
            gpio_SetIntType(g_u32GpioPort.val8[i]);
        }
    }
    TIMER_Init();

    SystemSuspend();

    TIMER_Disable(1);
    TIMER_Disable(2);

    if (kltype != KEYLED_TYPE_GPIOKEY)
    {
        KEYLED_Early_Display();
    }

    TIMER_Enable(0);

    for (i = 0; i < 4; i++)
    {
        if (g_u32GpioPort.val8[i] != 0)
        {
            gpio_IntEnable(g_u32GpioPort.val8[i], HI_TRUE);
        }
    }

    IR_Disable();
    IR_Init();
    IR_Start();

    if (g_u8CECWakeUpEnable)
    {
        MCU_HDMI_TaskInit();
    }

#ifndef HI_ADVCA_RELEASE
    printf_str("Enter while circle \r\n");
#endif

    while (1)
    {
        wait_minute_2(10, 10);
        EA = 0;

        if (g_u8CECWakeUpEnable)
        {
            MCU_HDMI_TaskHandle();
        }

        if (pmocflag)
        {
            break;
        }

        EA = 1;
    }

#ifndef HI_ADVCA_RELEASE
    printf_str("Quit while circle \r\n");
#endif

    if (kltype != KEYLED_TYPE_GPIOKEY)
    {
        KEYLED_Disable();
    }

    if (g_u8CECWakeUpEnable)
    {
        MCU_HDMI_TaskDeInit();
    }

    IR_Disable();

    TIMER_Disable(0);

    GetTimePeriod();

    // resume system
    SystemResume();

    return;
}
