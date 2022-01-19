#ifndef __BASE_H__
#define __BASE_H__

#include "hi_type.h"

//#define HI_ADVCA_RELEASE

#define NORMAL_WAKEUP 0
#define USB_WAKEUP 1
#define ETH_WAKEUP 2

#define HI_UNF_PMOC_WKUP_IR 0
#define HI_UNF_PMOC_WKUP_KEYLED 1
#define HI_UNF_PMOC_WKUP_TIMEOUT 2
#define HI_UNF_PMOC_WKUP_ETH 3
#define HI_UNF_PMOC_WKUP_USB 4
#define HI_UNF_PMOC_WKUP_GPIO 5
#define HI_UNF_PMOC_WKUP_CEC 6

#define CFG_BASE_ADDR (0xF8000000)
#define SC_GEN32_ADDR (0xF8000F00)
#define PMC_BASE_ADDR (0xF8A23000)
#define CRG_BASE_ADDR (0xF8A22000)
#define DATA_BASE_ADDR (0xF8407000)
#define TIMER_BASE_ADDR (0xF8002000)
#define IR_BASE_ADDR (0xF8001000)

#define MCU_CTRL 0x00
#define LOW_POWER_CTRL 0x40
#define MCU_IO_REUSE 0x44
#define MCU_SRST_CTRL 0x48
#define DDR_PHY_ISO 0x58

#define DATA_CHIP (0x0)
#define DATA_WDGON (0x04)
#define DATA_DBGMASK (0x08)
#define DATA_GPIO0 (0x0c)
#define DATA_GPIO1 (0x10)

#define DATA_DISPMODE (0x14)
#define DATA_DISPVAL (0x18)
#define DATA_TIMEVAL (0x1c)

#define DATA_KEYTYPE (0x20)
#define DATA_KEYVAL (0x24)
#define DATA_CAVENDOR (0x28)
#define DATA_GPIOPORT (0x2c)
#define DATA_IRTYPE (0x30)
#define DATA_IRNUM (0x34)
#define DATA_IRVAL (0x38)
#define DATA_RESET_TIME (0x68)

#define DATA_ENTER_FLAG (CFG_BASE_ADDR + 0xa08)
#define DATA_SUSPEND_FLAG (DATA_BASE_ADDR + 0x51c)
#define DATA_BOOT_SUSPEND_FLAG (DATA_BASE_ADDR + 0x52c)
#define DATA_WAKEUPGPIO (DATA_BASE_ADDR + 0xff0)
#define DATA_WAKEUPKEYLOW (DATA_BASE_ADDR + 0xff0)
#define DATA_WAKEUPKEYHIGH (DATA_BASE_ADDR + 0xff4)
#define DATA_WAKEUPTYPE (DATA_BASE_ADDR + 0xff8)
#define DATA_PERIOD (DATA_BASE_ADDR + 0xffc)

#define TIMER_LOAD 0x0
#define TIMER_VALUE 0x04
#define TIMER_CONTROL 0x08
#define TIMER_INTCLR 0x0c
#define TIMER_RIS 0x10
#define TIMER_MIS 0x14
#define TIMER_BGLOAD 0x18

#define IR_EN 0x0
#define IR_CFG 0x04
#define IR_LEADS 0x08
#define IR_LEADE 0x0c
#define IR_SLEADE 0x10
#define IR_B0 0x14
#define IR_B1 0x18
#define IR_BUSY 0x1c
#define IR_DATAH 0x20
#define IR_DATAL 0x24
#define IR_INT_MASK 0x28
#define IR_INT_STATUS 0x2c
#define IR_INT_CLR 0x30
#define IR_START 0x34

#define IR_PMOC_NUM 0xC
#define TEMP_CHECK_TO_SUSPEND     0x11111111

#define KEY_DOWN 0x1
#define KEY_UP   0x0

#define LSADC_NORMAL_STATUS 0
#define LSADC_STANDBY_KEY 1
#define TIME_COUNT 0xA08DL //for 1s

extern void printf_char(HI_U8 ch);
extern void printf_val(DATA_U32_S stData);

#ifndef HI_ADVCA_RELEASE
extern void printf_str(char *string);
extern void printf_hex(HI_U32 u32Hex);
#else
 #define printf_str
 #define printf_hex
#endif

extern HI_U8 g_u8KeyEnterPmoc;
extern HI_U32 g_u32DateBaseAddr;

#define wait_minute_1(x) do { \
        HI_U8 i; \
        for (i = 0; i < x; i++) ;\
    } while (0);

#define wait_minute_2(x, y) do { \
        HI_U8 i, j; \
        for (i = 0; i < x; i++) {\
            for (j = 0; j < y; j++) ;\
        } \
    } while (0);

#define wait_minute_3(x, y, z) do { \
        HI_U8 i, j, k; \
        for (i = 0; i < x; i++) {\
            for (j = 0; j < y; j++) {\
                for (k = 0; k < z; k++) ;\
            } \
        } \
    } while (0);

/* variable*/
extern volatile HI_U8 pmocType;
extern volatile HI_U8 pmocflag;

extern DATA_U32_S regAddr;
extern DATA_U32_S regData;

extern void read_regVal(void);
extern void write_regVal(void);
extern void read_regValEx(void);
extern void write_regValEx(void);
extern HI_U32 HI_SYS_ReadRegister(HI_U32 u32RegAddr);
extern void HI_SYS_WriteRegister(HI_U32 u32Value, HI_U32 u32RegAddr);
extern void lsadc_enable(void);
extern void lsadc_disable(void);
extern HI_S32 get_lsadc_volt_region_index(void);

extern HI_U8 dbgflag;
extern HI_U8 dbgmask;
extern HI_U8 wdgon;
extern HI_U8 GpioValArray[2];

extern HI_U8 klPmocVal;

extern HI_U8 ir_type;
extern HI_U8 ir_pmocnum;
extern idata DATA_U32_S irPmocHval[IR_PMOC_NUM];
extern idata DATA_U32_S irPmocLval[IR_PMOC_NUM];

extern HI_U8 time_hour;
extern HI_U8 time_minute;
extern HI_U8 time_second;
extern HI_U8 time_dot;
extern HI_U8 time_type;

extern DATA_U32_S waittime;
extern HI_U32  switchStdbyModeTime;


#endif
