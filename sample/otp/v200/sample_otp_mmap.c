#include "hi_unf_otp.h"
#include<sys/mman.h>
#include<sys/types.h>
#include<fcntl.h>
#include<string.h>
#include<stdio.h>
#include<unistd.h>
#include <errno.h>
#include<stdlib.h>

#define PAGE_SHIFT  0xc
#define PAGE_NUM_SHIFT          0 /* it depends on how many pages can be maped, 0:one page, 1:two pages, 2:four pages, 3: eight pages */
#define OTP_MAP_PAGE_NUM        (1ULL << PAGE_NUM_SHIFT)
#define OTP_MAP_MASK            (((OTP_MAP_PAGE_NUM) << PAGE_SHIFT) - 1)

HI_VOID print_buffer(char* buf, int len)
{
    HI_U32 i = 0;

    if (NULL == buf )
    {
        printf("Null pointer input in function print_buf!\n");
        return ;
    }
    for ( i = 0 ; i < len ; i+=4 )
    {
        if ( ( i != 0) && ( (i % 16) == 0) )
        {
            printf("\n");
        }
        if ((i % 16) == 0)
        {
            printf("%04x: ", i);
        }
        printf("%08x ", *((unsigned int*)&buf[i]));
    }
    printf("\n");
}

HI_S32 reg_read(off_t addr, char *dev)
{

    HI_S32 fd = 0;
    HI_VOID *p_map;
    HI_U32 len = 0x100;
    off_t off_set = 0;
    off_t base_addr = 0;

    base_addr = addr & (~OTP_MAP_MASK);
    off_set = addr & (OTP_MAP_MASK);
    len = len + off_set;

    fd = open(dev, O_RDWR, 00777);
    printf("Open file %s fd = %d\n", dev, fd);
    if (fd < 0)
    {
        printf("Open file(%s) failed.fd = %d [%d:%s]\n", dev, fd, errno, strerror(errno));
        return HI_FAILURE;
    }
    p_map = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, base_addr);
    close(fd);

    if (MAP_FAILED == p_map)
    {
        printf("Mmap failed.\nmmap error[%d:%s]\n", errno, strerror(errno));
        return HI_FAILURE;
    }
    printf("====dump memory 0X%08lX(vir addr %p)=====\n", (long int)addr, p_map);
    print_buffer(p_map + off_set, 0x100);
    printf("[END]\n");
    return HI_SUCCESS;
}

HI_S32 reg_write(off_t addr, HI_U8 value, char *dev)
{

    HI_S32 fd = 0;
    HI_VOID *p_map;
    HI_U32 len = 0x100;
    off_t off_set = 0;
    off_t base_addr = 0;
    HI_U8 tmp = 0;

    base_addr = addr & (~OTP_MAP_MASK);
    off_set = addr & (OTP_MAP_MASK);
    len = len + off_set;

    fd = open(dev, O_RDWR, 00777);
    printf("Open file %s fd = %d\n", dev, fd);
    if (fd < 0)
    {
        printf("Open file(%s) failed.fd = %d [%d:%s]\n", dev, fd, errno, strerror(errno));
        return HI_FAILURE;
    }
    p_map = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, base_addr);
    close(fd);

    if (MAP_FAILED == p_map)
    {
        printf("Mmap failed.\nmmap error[%d:%s]\n", errno, strerror(errno));
        return HI_FAILURE;
    }
    tmp = *(HI_U8*)(p_map + off_set);
    *(HI_U8*)(p_map + off_set) = value;

    printf("0x%08lx: 0x%08x --> 0x%08x\n[END]\n", (long int)addr, tmp, *(HI_U8*)(p_map + off_set));
    return HI_SUCCESS;
}

HI_VOID show_usage(HI_VOID)
{
    printf("\nHelp:\n");
    printf("----------------------------------------------------\n");
    printf("./sample [r|w] dev_node addr {value}\n");
    printf("./sample r /dev/hi_otp 0xf8ab0000 \n");
    printf("./sample w /dev/hi_otp 0xf8ab0000 0xff\n\n");
}

HI_S32 main(HI_S32 argc,HI_CHAR **argv)
{
    off_t off_addr = 0;
    HI_U8 value = 0;

    if (argc < 4)
    {
        printf("Input para wrong,argc = %d.\n", argc);
        show_usage();
        return HI_SUCCESS;
    }
    off_addr = (off_t)strtoul(argv[3], NULL, 16);
    if (!strcasecmp("w", argv[1]))
    {
        if (argc < 5)
        {
            printf("Input para wrong,argc = %d.\n", argc);
            show_usage();
            return HI_SUCCESS;
        }
        value = (HI_U8)strtoul(argv[4], NULL, 16);
        return reg_write(off_addr, value, argv[2]);
    }
    if (!strcasecmp("r", argv[1]))
    {
        return reg_read(off_addr, argv[2]);
    }
    show_usage();
    return HI_SUCCESS;
}
