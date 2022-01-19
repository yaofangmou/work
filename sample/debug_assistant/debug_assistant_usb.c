#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "debug_assistant_usb.h"


static HI_VOID USBDebug(HI_VOID)
{	
	HI_CHAR		InputCmd[32];
	HI_CHAR		usbmonFileName[256] ;
	HI_CHAR		cmd[400] ;
    
	/* 1 insmod usbmon*/
	system("insmod ./usbmon.ko");
    
	/* 2 mount debugfs*/
    system("mount -t debugfs none_debugs /sys/kernel/debug");

	/* 4 Monitors all buses*/
    snprintf(usbmonFileName, sizeof(usbmonFileName), "%s/usbmon_out.txt", aszLogDir);
    snprintf(cmd, sizeof(cmd), "touch %s", usbmonFileName);
    assistant_printf_ext("%s\n", cmd);
    system(cmd);
    snprintf(cmd, sizeof(cmd), "dd if=/sys/kernel/debug/usb/usbmon/0u of=%s &", usbmonFileName);
    assistant_printf_ext("%s\n", cmd);
    system(cmd);

    assistant_printf("=============================================\r\n");
	assistant_printf("Initialization usbmon completed.\n");	
	assistant_printf("Plug/Unplug the USB device until the problem recurs, then input q to quit debug. \n");
USBMON_AGAIN:
	SAMPLE_GET_INPUTCMD(InputCmd);
	switch (InputCmd[0]){
		case 'q':
		case 'Q':
			system("killall dd");
			usleep(100);
			system("umount /sys/kernel/debug/");
			system("rmmod /kmod/usb/usbmon.ko");
			/* 5 Copy Monitoring File  to the specified folder*/
			break;

		default:
			assistant_printf(RESPONSE_INVALID_INPUT[u32Lang]);
			assistant_printf("If debug operation was complete, Enter q/Q to exit.\n");
			goto USBMON_AGAIN;
			break;
	}
}

HI_S32 USBIssueHandler(HI_VOID)
{
    HI_CHAR                 aszInputCmd[32];

    assistant_printf("\n\n\n\n*** !!!!!!!!!!!!! For Your Attention !!!!!!!!!!!!! ***\n\n");
    assistant_printf("This USB debug tool depends on the kernel option \"CONFIG_DEBUG_FS\" and \"CONFIG_USB_MON\", \n");
    assistant_printf("please ensure they are enabled in your kernel: \n");
    assistant_printf("    CONFIG_DEBUG_FS=y\n");
    assistant_printf("    CONFIG_USB_MON=m\n\n");
    assistant_printf("*** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ***\r\n\n\n\n");

OTHER_AGAIN:
    assistant_printf(CATALOG_3[u32Lang]);
    assistant_printf(CASE_SELECT_3_1[u32Lang]);
    assistant_printf(CASE_SELECT_BACK[u32Lang]);
    assistant_printf(CASE_SELECT_QUIT[u32Lang]);
    assistant_printf(CASE_SELECT_INPUT[u32Lang]);

    SAMPLE_GET_INPUTCMD(aszInputCmd);
    assistant_printf_ext("Input [%c]\r\n", aszInputCmd[0]);

    switch (aszInputCmd[0])
    {
        case '1':
            USBDebug();
            return HI_DONE;

        case '0':
            return HI_FAILURE;

        case 'q':
        case 'Q':
            return HI_SUCCESS;

        default:
            assistant_printf(RESPONSE_INVALID_INPUT[u32Lang]);
            goto OTHER_AGAIN;
    }
}


