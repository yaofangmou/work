#include <linux/device.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/fs.h>
#include <asm/uaccess.h>
#include <asm/io.h>
#include <asm/delay.h>
#include <linux/poll.h>
#include <mach/hardware.h>
#include <linux/interrupt.h>
//#include <linux/himedia.h>
#include <linux/types.h>
#include <linux/sched.h>
#include <linux/spinlock.h>

#include "hi_drv_ir.h"
#include "drv_ir_protocol.h"
#include "drv_ir_utils.h"

/* store the max & min value of pluse and space to minx and maxx */
#if 1
#define mm_ps(phase, minp, maxp, mins, maxs)    \
    do \
    {                 \
        minp = (phase)->minp;       \
        maxp = (phase)->maxp;       \
        mins = (phase)->mins;       \
        maxs = (phase)->maxs;       \
    } while (0)
#else
#define mm_ps(phase, minp, maxp, mins, maxs)
#endif


#define XMP_UNIT              150 /* us */
#define XMP_LEADER            210 /* us */
#define XMP_NIBBLE_PREFIX     760/* us */
#define XMP_DIVIDER_UNIT      1540 /* us */
#define XMP_HALFFRAME_SPACE   12000 /* us */
#define XMP_TRAILER_SPACE     20000 /* should be 80ms but not all dureation supliers can go that high */
#define MAX_XMP_INFR_NR       2

struct xmp_dec {
        u32 toggle;
        u32 count;
        u32 durations[16];
        u32 scancode;
};

struct xmp_dec xmp_dec_info;
extern u32 g_bTimeOutFlag;
static u32 deal_1st_pulse_group = 0;
static unsigned long xmp_repeat_next_time[MAX_XMP_INFR_NR];
static struct key_attr xmp_last_key[MAX_XMP_INFR_NR];
static struct timer_list xmp_timer[MAX_XMP_INFR_NR];
static unsigned int redundant_frame_flag = 0;

static void xmp_keyup_proc(unsigned long i)
{
    struct key_attr *last_key;
    extern struct ir_priv ir_local;
    if (i >= MAX_XMP_INFR_NR) {
        hiir_error("xmp keyup timer, i > MAX_XMP_INFR_NR!\n");
        return;
    }

    last_key = &xmp_last_key[i];
    if ((last_key->lower || last_key->upper)
        && last_key->key_stat != KEY_STAT_UP) {
        last_key->key_stat = KEY_STAT_UP;
        deal_1st_pulse_group = 0;
        redundant_frame_flag = 0;

        if (ir_local.key_up_event) {
            ir_insert_key_tail(ir_local.key_buf, last_key);
            wake_up_interruptible(&ir_local.read_wait);
        }
        last_key->lower = last_key->upper = 0;
        memset(&xmp_dec_info,0,sizeof(struct xmp_dec));
    }
}

void xmp_init(void)
{
    int i;
    for (i = 0; i < MAX_XMP_INFR_NR; i++) {
        init_timer(&xmp_timer[i]);
        xmp_timer[i].expires = 0;
        xmp_timer[i].data = (unsigned long)~0;
        xmp_timer[i].function = xmp_keyup_proc;
    }
    memset(xmp_last_key, 0,
        MAX_XMP_INFR_NR * sizeof(struct key_attr));
    memset(&xmp_dec_info,0,sizeof(struct xmp_dec));
}
void xmp_exit(void)
{
    int i;
    for (i = 0; i < MAX_XMP_INFR_NR; i++)
        del_timer_sync(&xmp_timer[i]);
}

#define print_mm_sp(phase, name)        \
    do {                            \
        hiir_debug("%s: minp:%d, maxp:%d, mins:%d, maxp:%d\n",  \
            name,(phase)->minp, (phase)->maxp, (phase)->mins,\
            (phase)->maxs);\
    } while(0)

/* to see a frame is a full frame or a repeat frame */
enum IR_MATCH_RESULT xmp_match(enum IR_MATCH_TYPE type,
        struct ir_buffer *buf, struct ir_protocol *ip)
{
    struct key_attr *key;
    int idx;
    idx = ip->priv;
    if (idx >= MAX_XMP_INFR_NR) {
        hiir_error("xmp , private data error!\n");
        return IR_MATCH_NOT_MATCH;
    }
    key = &buf->buf[buf->reader];
    switch (type) {
    case IR_MTT_HEADER:
    {
        if (!key->upper && !key->lower)
        {
            return IR_MATCH_NOT_MATCH;
        }

        /* Is a frame header? */
        if (key_match_phase(key, &ip->attr.header)
            || (key->lower + key->upper - XMP_LEADER) < (4*XMP_LEADER - 40))
        {
            return IR_MATCH_NOT_MATCH;
        }

        if (!key_match_phase(key, &ip->attr.header) && (key->upper < 5*XMP_LEADER))
        {
            hiir_debug("xmp header match ok!\n");
            return IR_MATCH_MATCH;
        }
        hiir_debug("%s->%d, header not match! ip at:%p"\
                " header[p, s, f]: [%d, %d, %d],"\
                " key[l, u]:[%d, %d]\n",
                __func__, __LINE__, ip,
                ip->attr.header.pluse,
                ip->attr.header.space,
                ip->attr.header.factor,
                (u32)key->lower, (u32)key->upper);
        print_mm_sp(&ip->attr.header, "header");

        return IR_MATCH_NOT_MATCH;
    }

    case IR_MTT_FRAME:
    {
        int i, j, n;
        hiir_debug("idx:%d, checking symbol(at %d)[%d, %d]!\n",
                idx, buf->reader,
                (u32)buf->buf[buf->reader].lower,
                (u32)buf->buf[buf->reader].upper
                );

        if (!key->upper && !key->lower)
        {
            hiir_debug("%s->%d, idx:%d, key empty!\n", __func__,__LINE__,idx);
            return IR_MATCH_NOT_MATCH;
        }
        /* header match? */
        hiir_debug("%s->%d, idx:%d, checking header!\n", __func__,__LINE__,idx);
        if (key_match_phase(key, &ip->attr.header)) {
            hiir_debug("%s->%d, header not match! ip at:%p"\
                " header[p, s, f]: [%d, %d, %d],"\
                " key[l, u]:[%d, %d]\n",
                __func__, __LINE__, ip,
                ip->attr.header.pluse,
                ip->attr.header.space,
                ip->attr.header.factor,
                (u32)key->lower, (u32)key->upper);

                return IR_MATCH_NOT_MATCH;
        }

         hiir_debug("%s->%d,idx:%d header match!\n", __func__, __LINE__, idx);
         n = buf->reader + ip->attr.wanna_bits;
         n %= MAX_SYMBOL_NUM;

         key = &buf->buf[n];
         if (!key->upper && !key->lower)
         {
             hiir_debug("%s->%d, idx:%d, needs more data\n",
                        __func__, __LINE__, idx);

             return IR_MATCH_NEED_MORE_DATA;
         }

        /* check frame symbols */
        for (i = 0, j = i + buf->reader; i < ip->attr.wanna_bits + 1;
                i++, j++)
        {
            if (j >= MAX_SYMBOL_NUM)
                j -= MAX_SYMBOL_NUM;

            key = &buf->buf[j];

            if (!key->lower && !key->upper)
            {
                return IR_MATCH_NEED_MORE_DATA;
            }

            if (!eq_margin((u32)key->lower, XMP_LEADER, XMP_UNIT))
            {
                return IR_MATCH_NOT_MATCH;
            }

            if (((3 == i) && ((key->lower + key->upper - XMP_LEADER) < (XMP_LEADER*10)))
                || ((8 == i) && (key->upper < 8000)))
            {
                return IR_MATCH_NOT_MATCH;
            }

        }

        return IR_MATCH_MATCH;;
    }
    case IR_MTT_BURST:
        /* fall though */
    default:
        return IR_MATCH_NOT_MATCH;
    }
}

/**
 * ir_xmp_decode() - Decode one XMP pulse or space
 * @dev:    the struct rc_dev descriptor of the device
 * @duration:   the struct ir_raw_event descriptor of the pulse/space
 *
 * This function returns -EINVAL if the pulse violates the state machine
 */

static int ir_xmp_decode(struct xmp_dec *data)
{
    u32 divider;
    u8 i, addr, subaddr, subaddr2, toggle, oem, obc1, obc2, sum1, sum2;
    u32 *n;
    u32 scancode;
    u32 tmp1;

    n = data->durations;

    if(data->count != 16 || n[3] < 10*XMP_LEADER)
    {
        hiir_debug("frame error!\n");

        return -EINVAL;
    }

    /*
     * the 4th nibble should be 15 so base the divider on this
     * to transform durations into nibbles. Substract 2000 from
     * the divider to compensate for fluctuations in the signal
     */
    divider = (n[3] - XMP_NIBBLE_PREFIX) / 15 - 2;
    if (divider < 50) {
        hiir_debug( "divider(%d) too small n[3]:%d\n", divider,n[3]);
    }

    hiir_debug("devider:%d\n",divider);

    for (i = 0; i < 16; i++)
    {
        tmp1 = n[i];
        if (n[i]< 850)
        {
            n[i] = 0;
            continue;
        }
        if(((n[i] - XMP_NIBBLE_PREFIX)%divider) >= (divider * 74 /100))
        {
            n[i] = (n[i] - XMP_NIBBLE_PREFIX) / divider + 1;
            hiir_debug("changed n[%d]:%d divider:%d tmp1:%d \n",i,n[i],divider,tmp1);
        }
        else
        {
            n[i] = (n[i] - XMP_NIBBLE_PREFIX) / divider;
        }
    }

    sum1 = (15 + n[0] + n[1] + n[2] + n[3] +
        n[4] + n[5] + n[6] + n[7]) % 16;
    sum2 = (15 + n[8] + n[9] + n[10] + n[11] +
        n[12] + n[13] + n[14] + n[15]) % 16;
    for (i = 0; i < 16; i++)
    {
        hiir_debug("n[%d]:%d \n",i,n[i]);
    }

    if (sum1 != 15 || sum2 != 15)
    {
        hiir_debug("checksum errors sum1=0x%X sum2=0x%X\n",
            sum1, sum2);

        return -EINVAL;
    }

    subaddr  = n[0] << 4 | n[2];
    subaddr2 = n[8] << 4 | n[11];
    oem      = n[4] << 4 | n[5];
    addr     = n[6] << 4 | n[7];
    toggle   = n[10];
    obc1 = n[12] << 4 | n[13];
    obc2 = n[14] << 4 | n[15];
    if (subaddr != subaddr2)
    {
        hiir_debug("subaddress nibbles mismatch 0x%02X != 0x%02X\n",
            subaddr, subaddr2);

        hiir_info("3f 0x%02X != 0x%02X\n", subaddr, subaddr2);

        for(i=0;i<16;++i)
        hiir_info("n[%d]==%d\n", i, n[i]);

        return -EINVAL;
    }
    if (oem != 0x44)
    {
        hiir_debug( "Warning: OEM nibbles 0x%02X. Expected 0x44\n", oem);
    }

    scancode = addr << 24 | subaddr << 16 | obc1 << 8 | obc2;
    xmp_dec_info.scancode = scancode;

    data->toggle = toggle;

    return 0;
}

int xmp_parse(struct ir_priv *ir, struct ir_protocol *ip,
                                  struct ir_buffer *rd, struct ir_buffer *wr)
{
    struct key_attr *symbol;
    struct key_attr key;
    unsigned long long minp, maxp, mins, maxs;
    unsigned i,cnt = 0, fail = 0;
    struct key_attr *last_key;
    uint idx = ip->priv;
    struct xmp_dec *data = &xmp_dec_info;
    int ret;

    if (idx >= MAX_XMP_INFR_NR) {
        hiir_error("xmp , private data error!\n");
        return -1;
    }

    del_timer_sync(&xmp_timer[idx]);
    last_key = &xmp_last_key[idx];
    /* header phase */
    memset(&key, 0, sizeof(struct key_attr));
    memset(data, 0, sizeof(struct xmp_dec));
    symbol = &rd->buf[rd->reader];
    mm_ps(&ip->attr.header, minp, maxp, mins, maxs);

    /* data phase */
    memcpy(key.protocol_name, ip->ir_code_name, PROTOCOL_NAME_SZ);
    i = 0;
    while(symbol->upper && symbol->lower && i < ip->attr.wanna_bits)
    {
        if (symbol->upper < 8000)
        {
            data->durations[data->count++] = (u32)symbol->upper + (u32)symbol->lower - XMP_LEADER;
            i++;
        }
       symbol = ir_next_reader_clr_inc(rd);
    }
    hiir_debug("count = %d, i = %d [%d,%d]\n", data->count, i, (u32)symbol->lower, (u32)symbol->upper);

    ret = ir_xmp_decode(data);
    if(!ret)
    {
        key.upper = 0;
        key.lower = xmp_dec_info.scancode;

        if((last_key->upper || last_key->lower ) && (deal_1st_pulse_group == 1)
            && (xmp_dec_info.toggle == 9)
                && (last_key->key_stat != KEY_STAT_UP))
        {
            last_key->key_stat = KEY_STAT_UP;
            if (ir->key_up_event)
            {
                ir_insert_key_tail(wr, last_key);
            }

            cnt++;
            deal_1st_pulse_group = 0;
            redundant_frame_flag = 0;

            goto start_timer_out;
        }

        if ((last_key->upper || last_key->lower)
            && (xmp_dec_info.toggle != 9)
                && last_key->upper == key.upper
                    && last_key->lower == key.lower
                        && time_after(jiffies, xmp_repeat_next_time[idx])
                            && last_key->key_stat != KEY_STAT_UP)
        {
            redundant_frame_flag++;
            /* should i send a repeat key? */
            if (ir->key_repeat_event && redundant_frame_flag > 1)
            {
                last_key->key_stat = KEY_STAT_HOLD;
                ir_insert_key_tail(wr, last_key);
                xmp_repeat_next_time[idx] = jiffies +
                msecs_to_jiffies(ir->key_repeat_interval);

                cnt++;
            }

            goto start_timer_out;
        }

        if((xmp_dec_info.toggle != 0)
            && (deal_1st_pulse_group == 0)
                && (last_key->key_stat != KEY_STAT_DOWN)
                    && (last_key->key_stat != KEY_STAT_HOLD))
        {
            key.key_stat = KEY_STAT_DOWN;

            ir_insert_key_tail(wr, &key);
            xmp_repeat_next_time[idx] = jiffies + msecs_to_jiffies(ir->key_repeat_interval);
            memcpy(last_key, &key, sizeof(struct key_attr));
            cnt++;

            goto start_timer_out;
        }

        /* a new key received.
        * send a up event of last key if exist.
        */
        if ((last_key->upper || last_key->lower)
            && (xmp_dec_info.toggle == 9 || xmp_dec_info.toggle == 0)
                && last_key->key_stat != KEY_STAT_UP
                    && (last_key->upper != key.upper || last_key->lower != key.lower))
        {
            last_key->key_stat = KEY_STAT_UP;
            deal_1st_pulse_group = 0;
            redundant_frame_flag = 0;
            if (ir->key_up_event)
            {
                ir_insert_key_tail(wr, last_key);
            }
            cnt++;
        }

        hiir_debug("key parsed:[l:%llu, u:%llu, s:%d, p:%s]!\n",
            key.lower, key.upper, key.key_stat, key.protocol_name);

        if (xmp_dec_info.toggle != 9)
        {
            key.key_stat = KEY_STAT_DOWN;
            ir_insert_key_tail(wr, &key);
            xmp_repeat_next_time[idx] = jiffies + msecs_to_jiffies(ir->key_repeat_interval);
            memcpy(last_key, &key, sizeof(struct key_attr));
            deal_1st_pulse_group = 1;
            cnt++;
        }
        else
        {
            xmp_dec_info.toggle = 0;
        }

        goto start_timer_out;
    }
    else
    {
      fail++;
    }
start_timer_out:
    memset(&xmp_dec_info, 0, sizeof(struct xmp_dec));

    del_timer_sync(&xmp_timer[idx]);

    if (HI_TRUE == g_bTimeOutFlag)
    {
        g_bTimeOutFlag = HI_FALSE;
        if((last_key->key_stat != KEY_STAT_UP)&&(last_key->upper || last_key->lower))
        {
            last_key->key_stat = KEY_STAT_UP;
            deal_1st_pulse_group = 0;
            redundant_frame_flag = 0;
            if (ir->key_up_event)
            {
                ir_insert_key_tail(wr, last_key);
            }
            cnt++;
        }
    }
    else
    {
        if (0 == ip->key_hold_timeout_time)
        {
            xmp_timer[idx].expires = jiffies +
                                 msecs_to_jiffies(ir->key_hold_timeout_time);
        }
        else
        {
            xmp_timer[idx].expires = jiffies +
                                 msecs_to_jiffies(ip->key_hold_timeout_time);
        }

        xmp_timer[idx].data = idx;
        add_timer(&xmp_timer[idx]);
    }

    return fail ? -1 : (cnt ? 0 : -1);
}

EXPORT_SYMBOL(xmp_match);
EXPORT_SYMBOL(xmp_parse);

