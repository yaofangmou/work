#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/prctl.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <errno.h>
#include <time.h>

#include "capability.h"
#include "common.h"

void list_caps()
{
    cap_t    caps;
    caps = cap_get_proc();
    sample_printf("capabilities: %s\n", cap_to_text(caps, NULL));
    cap_free(caps);
}

int  set_time()
{
    time_t t_t = 0;
    struct timeval tv;
    struct tm info;

    info.tm_year = 2001 - 1900;
    info.tm_mon = 6;
    info.tm_mday = 4;
    info.tm_hour = 0;
    info.tm_min = 0;
    info.tm_sec = 1;
    info.tm_isdst = -1;

    t_t = mktime(&info);
    if(t_t == -1 )
    {
        sample_printf("call mktime fail\n");
        exit(0);
    }

    tv.tv_sec = t_t;
    tv.tv_usec = 0;
    if(settimeofday(&tv, (struct timezone *) 0) < 0)
    {
        sample_printf("Set system datatime fail!\n");
        exit(0);
    }

    return 0;
}

int get_time()
{
    struct  timeval    tv;
    struct  timezone   tz;
    time_t t = 0;

    gettimeofday(&tv,&tz);

    sample_printf("tv_sec:%ld\n",tv.tv_sec);
    sample_printf("tv_usec:%ld\n",tv.tv_usec);
    sample_printf("tz_minuteswest:%d\n",tz.tz_minuteswest);
    sample_printf("tz_dsttime:%d\n",tz.tz_dsttime);

    time(&t);
    sample_printf("\n%s\n", ctime(&t));

    return 0;
}

int main(int argc, char **argv)
{
    unsigned int num_caps;
    cap_t caps = cap_init();

    list_caps();
    sample_printf("--------------------First set time--------------------\n");
    set_time();
    get_time();

    /* These capabilities MUST be enabled in lxc.cap.keep, otherwise, cap_set_proc will fail */
    cap_value_t capList[] = {CAP_SETGID,CAP_SETUID,CAP_NET_ADMIN,CAP_NET_RAW,CAP_SYS_ADMIN};
    num_caps = sizeof(capList) / capList[0];
    cap_set_flag(caps, CAP_EFFECTIVE, num_caps, capList, CAP_SET);
    cap_set_flag(caps, CAP_INHERITABLE, num_caps, capList, CAP_SET);
    cap_set_flag(caps, CAP_PERMITTED, num_caps, capList, CAP_SET);
    if (prctl(PR_SET_KEEPCAPS,1) < 0)
    {
        sample_printf("Fail to PR_SET_KEEPCAPS, please check the lxc.cap.keep! Error info:%s\n", strerror(errno));
        exit(-1);
    }

    if (cap_set_proc(caps) == -1)
    {
        sample_printf("Fail to set process capabilities, please check if caps in capList have been enabled in the lxc.cap.keep!Error Info:%s\n"
                        , strerror(errno));
        exit(-1);
    }

    list_caps();
    sample_printf("--------------------Second set time--------------------\n");
    set_time();
    get_time();
    return 0;
}

