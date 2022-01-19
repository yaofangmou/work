#include <delay.h>
#include <asm/io.h>
#include <cpuinfo.h>

#define PERI_USB3                       (0xF8A20000 + 0x12c)
#define USB2_2P_SS_WORD_IF_I            (1 << 0)
#define USB2_2P_SS_ENA_INCR16_I         (1 << 9)

#define PERI_CRG46                      (0xF8A22000 + 0xb8)
#define USB2_BUS_CKEN                   (1<<0)
#define USB2_OHCI48M_CKEN               (1<<1)
#define USB2_OHCI12M_CKEN               (1<<2)
#define USB2_HST_PHY_CKEN               (1<<4)
#define USB2_UTMI0_CKEN                 (1<<5)
#define USB2_UTMI1_CKEN                 (1<<6)
#define USB2_BUS_SRST_REQ               (1<<12)
#define USB2_UTMI0_SRST_REQ             (1<<13)
#define USB2_UTMI1_SRST_REQ             (1<<14)
#define USB2_HST_PHY_SYST_REQ           (1<<16)

#define PERI_CRG47                      (0xF8A22000 + 0xbc)
#define USB2_PHY01_REF_CKEN              (1 << 0)
#define USB2_PHY01_SRST_REQ              (1 << 4)
#define USB2_PHY0_SRST_TREQ              (1 << 8)
#define USB2_PHY1_SRST_TREQ              (1 << 9)
#define USB2_PHY01_REFCLK_SEL            (1 << 12)
#define USB2_PHY01_TEST_SRST_REQ          (1 << 15)

#define USB2_PHY01_REGBASE               0xF9865000

#define REG_OTP_USB_TRIM                 0x032C
/******************************************************************************/

static void inno_phy_config_2p(void)
{
	int chiptrim_usbphy, reg;

	writel(0x5, USB2_PHY01_REGBASE + 0x18);
	udelay(100);

	/* 2.HS eye height tuning 0x02[6:4]=3b'110 : 437.5mV */
	writel(0x6c, USB2_PHY01_REGBASE + 0x08);
	writel(0x6c, USB2_PHY01_REGBASE + 0x408);
	udelay(20);

	/* 3.pre-emphasis tuning 0x00[2:0]=3b'111 : always enable pre-emphasis */
	writel(0x1f, USB2_PHY01_REGBASE );
	writel(0x1f, USB2_PHY01_REGBASE + 0x400);
	udelay(20);

	/* 4.pre-emphasis strength 0x05[4:2]=3b'100 */
	writel(0x90, USB2_PHY01_REGBASE +0x14);
	writel(0x90, USB2_PHY01_REGBASE + 0x414);
	udelay(20);

	/* 5.HS driver slew rate tunning 0x1d[3:1]=3'010 */
	writel(0x14, USB2_PHY01_REGBASE +0x74);
	writel(0x14, USB2_PHY01_REGBASE + 0x474);
	udelay(20);

	/* 6.HOST disconnects detection trigger point 0x04[7:4]=4b'1101: 625mV */
	writel(0xd7, USB2_PHY01_REGBASE +0x10);
	writel(0xd7, USB2_PHY01_REGBASE + 0x410);
	udelay(20);

	chiptrim_usbphy = readl( OTP_REG_BASE + REG_OTP_USB_TRIM);
	chiptrim_usbphy <<= 2;
	chiptrim_usbphy &= 0x7C;

	if ((chiptrim_usbphy >= 0x3c) && (chiptrim_usbphy <= 0x70)) {
		/* 2xport port0 */
		reg = readl(USB2_PHY01_REGBASE + 0x00c);
		reg &= (~0x7C);
		reg |= chiptrim_usbphy;
		writel(reg, USB2_PHY01_REGBASE + 0x00c);
		udelay(20);

		/* 2xport port1 */
		reg = readl(USB2_PHY01_REGBASE + 0x40c);
		reg &= (~0x7C);
		reg |= chiptrim_usbphy;
		writel(reg, USB2_PHY01_REGBASE + 0x40c);
		udelay(20);
	}
}
/******************************************************************************/

int usb_host_init(int index, unsigned int *addr)
{
	int reg;

	if (index != 0)
		return -1;

	if (addr) {
		*addr = REG_BASE_EHCI;
	}

	/* reset controller bus/utmi/roothub  */
	reg = readl(PERI_CRG46);
	reg |= (USB2_BUS_SRST_REQ
		| USB2_UTMI0_SRST_REQ
		| USB2_UTMI1_SRST_REQ
		| USB2_HST_PHY_SYST_REQ);
	writel(reg, PERI_CRG46);
	udelay(100);

	/* reset phy por/utmi */
	reg = readl(PERI_CRG47);
	reg |= (USB2_PHY01_TEST_SRST_REQ
		| USB2_PHY01_SRST_REQ
		| USB2_PHY0_SRST_TREQ
		| USB2_PHY1_SRST_TREQ);
	writel(reg, PERI_CRG47);
	udelay(100);

	/* write default value. */
	reg = readl(PERI_USB3);
	reg &= ~(USB2_2P_SS_WORD_IF_I);      /* 8bit */
	reg &= ~(USB2_2P_SS_ENA_INCR16_I);      /* 16 bit burst disable */
	writel(reg, PERI_USB3);
	udelay(100);

	/* open ref clk */
	reg = readl(PERI_CRG47);
	reg |= (USB2_PHY01_REF_CKEN);
	writel(reg, PERI_CRG47);
	udelay(100);

	reg = readl(PERI_CRG47);
	reg &= ~(USB2_PHY01_TEST_SRST_REQ);
	writel(reg, PERI_CRG47);
	udelay(100);

	/* cancel power on reset */
	reg = readl(PERI_CRG47);
	reg &= ~(USB2_PHY01_SRST_REQ);
	writel(reg, PERI_CRG47);
	mdelay(2);

	inno_phy_config_2p();

	/* cancel port reset 
	 * delay 10ms for waiting comp circuit stable
	*/
	reg = readl(PERI_CRG47);
	reg &= ~(USB2_PHY0_SRST_TREQ | USB2_PHY1_SRST_TREQ);
	writel(reg, PERI_CRG47);
	udelay(100);

	/* open controller clk */
	reg = readl(PERI_CRG46);
	reg |= (USB2_BUS_CKEN
		| USB2_OHCI48M_CKEN
		| USB2_OHCI12M_CKEN
		| USB2_HST_PHY_CKEN
		| USB2_UTMI0_CKEN
		| USB2_UTMI1_CKEN);
	writel(reg, PERI_CRG46);
	udelay(100);

	/* cancel control reset */
	reg = readl(PERI_CRG46);
	reg &= ~(USB2_BUS_SRST_REQ
		| USB2_UTMI0_SRST_REQ
		| USB2_UTMI1_SRST_REQ
		| USB2_HST_PHY_SYST_REQ);
	writel(reg, PERI_CRG46);
	udelay(100);

	return 0;
}
/******************************************************************************/

int usb_cpu_stop(int index)
{
	int reg;

	if (index != 0)
		return -1;

	reg = readl(PERI_CRG46);
	reg |= (USB2_BUS_SRST_REQ
		| USB2_UTMI0_SRST_REQ
		| USB2_UTMI1_SRST_REQ
		| USB2_HST_PHY_SYST_REQ);
	writel(reg, PERI_CRG46);

	udelay(100);

	reg = readl(PERI_CRG47);
	reg |= (USB2_PHY01_SRST_REQ
		| USB2_PHY0_SRST_TREQ
		| USB2_PHY1_SRST_TREQ);
	writel(reg, PERI_CRG47);

	udelay(100);

	return 0;
}
