#ifdef HI_MINIBOOT_SUPPORT
#include "app.h"
#endif
#include "ir.h"
#include "ir_protocol.h"
#include "ir_utils.h"

#ifdef HI_MINIBOOT_SUPPORT
#include "errno.h"
#endif
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


#define XMP_UNIT                  150 /* us */
#define XMP_LEADER                210 /* us */
#define XMP_NIBBLE_PREFIX         760/* us */
#define XMP_HALFFRAME_SPACE       12000 /* us */
#define XMP_TRAILER_SPACE         20000 /* should be 80ms but not all dureation supliers can go that high */
#define MAX_XMP_INFR_NR           2
enum xmp_state {
    STATE_INACTIVE,
    STATE_LEADER_PULSE,
    STATE_NIBBLE_SPACE,
};

struct xmp_dec {
        u32 toggle;
        int state;
        unsigned int count;
        u32 durations[16];
        u32 scancode;
};

struct xmp_dec xmp_dec_info;
extern u32 g_bTimeOutFlag;
static u32 handle_first_pulse_group = 0;
static unsigned long xmp_repeat_next_time[MAX_XMP_INFR_NR];
static struct key_attr xmp_last_key[MAX_XMP_INFR_NR];
static struct timer_list xmp_timer[MAX_XMP_INFR_NR];
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
        if (ir_local.key_up_event) {
            ir_insert_key_tail(ir_local.key_buf, last_key);
            wake_up_interruptible(&ir_local.read_wait);
        }
        last_key->lower = last_key->upper = 0;
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
    int idx,n;
    idx = ip->priv;
    if (idx >= MAX_XMP_INFR_NR) {
        hiir_error("xmp , private data error!\n");
        return IR_MATCH_NOT_MATCH;
    }
    key = &buf->buf[buf->reader];
    switch (type) {
    case IR_MTT_HEADER: {
        if (!key->upper && !key->lower)
            return IR_MATCH_NOT_MATCH;
        /* Is a frame header? */
        if (!key_match_phase(key, &ip->attr.header))
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
    case IR_MTT_FRAME: {
#if 1
        unsigned long long minp, maxp;
        int i, j;
        hiir_debug("idx:%d, checking symbol(at %d)[%d, %d]!\n",
                idx, buf->reader,
                (u32)buf->buf[buf->reader].lower,
                (u32)buf->buf[buf->reader].upper
                );

        if (!key->upper && !key->lower) {
            hiir_debug("%s->%d, idx:%d, key empty!\n", __func__,__LINE__,idx);
            return IR_MATCH_NOT_MATCH;
        }
        /* header match? */
        hiir_debug("%s->%d, idx:%d, checking header!\n", __func__,__LINE__,idx);
        if (key_match_phase(key, &ip->attr.header)) {
            printk("%s->%d, header not match! ip at:%p"\
                " header[p, s, f]: [%d, %d, %d],"\
                " key[l, u]:[%d, %d]\n",
                __func__, __LINE__, ip,
                ip->attr.header.pluse,
                ip->attr.header.space,
                ip->attr.header.factor,
                (u32)key->lower, (u32)key->upper);
                return IR_MATCH_NOT_MATCH;
        } else
            n = ip->attr.burst_offset;

        /* try find burst. */
        n = buf->reader + n;
        if (n >= MAX_SYMBOL_NUM)
            n -= MAX_SYMBOL_NUM;

        /* check frame symbols */
        for (i = 0, j = i + buf->reader + 1; i < (ip->attr.wanna_bits) && j != n;
                i++, j++) {

            if (j >= MAX_SYMBOL_NUM)
                j -= MAX_SYMBOL_NUM;

            if (j == n)
                break;

            key = &buf->buf[j];

            if (!key->lower && !key->upper)
                return IR_MATCH_NEED_MORE_DATA;
        }
        hiir_debug("%s->%d, checking burst at(%d)up%d,low:%d!\n",
                __func__,__LINE__,n,(u32)key->upper,(u32)key->lower);

        key = &buf->buf[n];
        if (!key->upper && !key->lower) {
            hiir_debug("%s->%d, idx:%d, needs more data\n",
                    __func__,__LINE__,idx);
            return IR_MATCH_NEED_MORE_DATA;
        }

        /* burst match? */
        /* XMP frame burst may constains b0's pluse or b1's pluse
         * and space will > 20000.
         */
        minp = ip->attr.b0.minp;
        maxp = ip->attr.b1.maxp;
        if (((u32)key->lower >= minp && (u32)key->lower <= maxp)
            && (u32)key->upper > ip->attr.burst.space) {

            hiir_debug("%s->%d, idx:%d, frame burst match!\n",
                    __func__,__LINE__,idx);
            hiir_debug("matched!!\n");
            return IR_MATCH_MATCH;
        } else {
            hiir_debug("%s->%d, idx:%d. burst not match!"
                    " key[l, u][%d, %d],"
                    " burst[p, s, f]: [%d, %d, %d]\n",
                    __func__,__LINE__,idx,
                    (u32)key->lower, (u32)key->upper,
                    ip->attr.burst.pluse,
                    ip->attr.burst.space,
                    ip->attr.burst.factor);
            hiir_debug("not match!\n");
            return IR_MATCH_NOT_MATCH;
        }
#endif
        return 0;
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

static int ir_xmp_decode(struct key_attr *symbol)
{
    struct xmp_dec *data = &xmp_dec_info;

    hiir_debug("----xmp low:%d,up:%d,data->state:%d,data->count:%d\n",(u32)symbol->lower,(u32)symbol->upper,data->state,data->count);

    if(data->state == STATE_INACTIVE)
    {
        if (eq_margin((u32)symbol->lower, XMP_LEADER, XMP_UNIT)) {
            data->count = 0;
            goto xmp_parse;
        }
        hiir_debug("error inactive!symbol->lower:%d\n",(u32)symbol->lower);
        return -1;

    }
    else if(data->state == STATE_LEADER_PULSE)
    {
        if (eq_margin((u32)symbol->lower, XMP_LEADER, XMP_UNIT))
            goto xmp_parse;
        hiir_debug("error STATE_LEADER_PULSE!symbol->lower:%d\n",(u32)symbol->lower);
        data->state = STATE_INACTIVE;
        return -1;
    }

    xmp_parse:

        if (geq_margin((u32)symbol->upper, XMP_TRAILER_SPACE, XMP_NIBBLE_PREFIX)) {
            int divider, i;
            u8 addr, subaddr, subaddr2, toggle, oem, obc1, obc2, sum1, sum2;
            u32 *n;
            u32 scancode;

            if (data->count != 16) {
                hiir_debug( "received TRAILER period at index %d: %u\n",
                    data->count, (u32)symbol->upper);
                data->state = STATE_INACTIVE;
                return -EINVAL;
            }

            n = data->durations;
            /*
             * the 4th nibble should be 15 so base the divider on this
             * to transform durations into nibbles. Substract 2000 from
             * the divider to compensate for fluctuations in the signal
             */
            divider = (n[3] - XMP_NIBBLE_PREFIX) / 15 - 2;
            if (divider < 50) {
                hiir_debug( "divider to small %d.n[3]:%d\n", divider,n[3]);
                data->state = STATE_INACTIVE;
                return -EINVAL;
            }
            hiir_debug("devider:%d\n",divider);

           for (i = 0; i < 16; i++)
            {
                if (n[i]< 890)
                {
                    n[i] = 0;
                    continue;
                }
                if(((n[i] - XMP_NIBBLE_PREFIX)%divider) > (divider * 78 /100))
                {
                    n[i] = (n[i] - XMP_NIBBLE_PREFIX) / divider + 1;
                    hiir_debug("changed n[%d]:%d divider:%d tmp1:%d \n",i,n[i],divider,tmp1);
                }
                else
                    n[i] = (n[i] - XMP_NIBBLE_PREFIX) / divider;
            }
            sum1 = (15 + n[0] + n[1] + n[2] + n[3] +
                n[4] + n[5] + n[6] + n[7]) % 16;
            sum2 = (15 + n[8] + n[9] + n[10] + n[11] +
                n[12] + n[13] + n[14] + n[15]) % 16;

            for (i = 0; i < 16; i++)
            {
                hiir_debug("n[%d]:%d \n",i,n[i]);
            }

            if (sum1 != 15 || sum2 != 15) {
                hiir_debug("checksum errors sum1=0x%X sum2=0x%X\n",
                    sum1, sum2);

            //  data->state = STATE_INACTIVE;
                return -EINVAL;
            }

            subaddr  = n[0] << 4 | n[2];
            subaddr2 = n[8] << 4 | n[11];
            oem      = n[4] << 4 | n[5];
            addr     = n[6] << 4 | n[7];
            toggle   = n[10];
            obc1 = n[12] << 4 | n[13];
            obc2 = n[14] << 4 | n[15];
            if (subaddr != subaddr2) {
                hiir_debug("subaddress nibbles mismatch 0x%02X != 0x%02X\n",
                    subaddr, subaddr2);
                data->state = STATE_INACTIVE;
                return -EINVAL;
            }
            if (oem != 0x44)
                hiir_debug( "Warning: OEM nibbles 0x%02X. Expected 0x44\n",
                    oem);

            scancode = addr << 24 | subaddr << 16 |
                   obc1 << 8 | obc2;
            xmp_dec_info.scancode = scancode;

            data->toggle = toggle;
            data->state = STATE_INACTIVE;

            return 0;

        }
        else if (geq_margin((u32)symbol->upper, XMP_HALFFRAME_SPACE, XMP_NIBBLE_PREFIX)) {
            /* Expect 8 or 16 nibble pulses. 16 in case of 'final' frame */
            if (data->count == 16) {
                hiir_debug("received half frame pulse at index %d. Probably a final frame key-up event: %u\n",
                    (u32)data->count, (u32)symbol->upper);
                /*
                 * TODO: for now go back to half frame position
                 *   so trailer can be found and key press
                 *   can be handled.
                 */
                 symbol->upper = symbol->upper + 20000;
                 goto xmp_parse;

            }

            else if (data->count != 8)
                hiir_debug("received half frame pulse at index %d: %u\n",
                    data->count, (u32)symbol->upper);
            data->state = STATE_LEADER_PULSE;

            return 0;

        }
        else if (geq_margin(symbol->upper, XMP_NIBBLE_PREFIX, XMP_UNIT)) {
            /* store nibble raw data, decode after trailer */
            if (data->count == 16) {
                hiir_debug("to many pulses (%d) ignoring: %u\n",
                    data->count, (u32)symbol->upper);
                data->state = STATE_INACTIVE;
                return -EINVAL;
            }
            if(((u32)symbol->lower >= 80)||((u32)symbol->lower <= 320))
            {
               data->durations[data->count] = (u32)symbol->upper + (u32)symbol->lower - 210;
            }
            else
            {
               hiir_debug("---error symbol lower %d\n",(u32)symbol->lower);
               data->state = STATE_INACTIVE;
               return -1;
            }

            data->count++;
            data->state = STATE_LEADER_PULSE;
            return 0;

        }

    hiir_debug( "XMP decode failed at count %d state %d \n", data->count, data->state);
    data->state = STATE_INACTIVE;
    return -EINVAL;
}


int xmp_parse(struct ir_priv *ir, struct ir_protocol *ip,
                                  struct ir_buffer *rd, struct ir_buffer *wr)
{
    struct key_attr *symbol;
    struct key_attr key;
    unsigned i,cnt = 0, fail = 0;
    struct key_attr *last_key;
    uint idx = ip->priv;
    int ret;

    if (idx >= MAX_XMP_INFR_NR) {
        hiir_error("xmp , private data error!\n");
        return -1;
    }

    del_timer_sync(&xmp_timer[idx]);
    last_key = &xmp_last_key[idx];
    /* header phase */
    memset(&key, 0, sizeof(struct key_attr));
    symbol = &rd->buf[rd->reader];

    /* data phase */
    memcpy(key.protocol_name, ip->ir_code_name, PROTOCOL_NAME_SZ);
    i=0;
    while(symbol->upper && symbol->lower && i < ip->attr.wanna_bits)
    {
       ret = ir_xmp_decode(symbol);
       if(ret)
       {
          hiir_debug("xmp decode failed!\n");
          memset(&xmp_dec_info,0,sizeof(struct xmp_dec));
          symbol = ir_next_reader_clr_inc(rd);
          goto start_timer_out;
       }

       if((xmp_dec_info.count == 16)&&(STATE_INACTIVE == xmp_dec_info.state))
       {
           key.upper = 0;
           key.lower = xmp_dec_info.scancode;


           if((last_key->upper || last_key->lower ) && (handle_first_pulse_group == 1)
                && (xmp_dec_info.toggle == 9)
                && (last_key->key_stat != KEY_STAT_UP))
           {
                last_key->key_stat = KEY_STAT_UP;
                if (ir->key_up_event) {
                    ir_insert_key_tail(wr, last_key);
                }

                cnt++;
                handle_first_pulse_group = 0;
                goto start_timer_out;
           }

           if((xmp_dec_info.toggle == 9) && (handle_first_pulse_group == 0))
            {
               key.key_stat = KEY_STAT_DOWN;

               ir_insert_key_tail(wr, &key);
               (HI_VOID)ir_next_reader_clr_inc(rd);
               xmp_repeat_next_time[idx] = jiffies +
                   msecs_to_jiffies(ir->key_repeat_interval);
               memcpy(last_key, &key, sizeof(struct key_attr));
                cnt++;
                goto start_timer_out;
           }

           if ((last_key->upper || last_key->lower) && (xmp_dec_info.toggle != 9)
                && last_key->upper == key.upper
                && last_key->lower == key.lower
                && last_key->key_stat != KEY_STAT_UP){
                /* should i send a repeat key? */
                if (ir->key_repeat_event && time_after(jiffies,
                        xmp_repeat_next_time[idx])) {

                    last_key->key_stat = KEY_STAT_HOLD;
                    ir_insert_key_tail(wr, last_key);
                    (HI_VOID)ir_next_reader_clr_inc(rd);
                    xmp_repeat_next_time[idx] = jiffies +
                        msecs_to_jiffies(
                            ir->key_repeat_interval);

                    cnt++;
                }
                goto start_timer_out;
            }

            /* a new key received.
             * send a up event of last key if exist.
             */
            if ((last_key->upper || last_key->lower)
                && (xmp_dec_info.toggle == 9|| xmp_dec_info.toggle == 0)
                && last_key->key_stat != KEY_STAT_UP
                && (last_key->upper != key.upper
                    || last_key->lower != key.lower)) {
                last_key->key_stat = KEY_STAT_UP;
                if (ir->key_up_event) {
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
                (HI_VOID)ir_next_reader_clr_inc(rd);
                xmp_repeat_next_time[idx] = jiffies +
                    msecs_to_jiffies(ir->key_repeat_interval);
                memcpy(last_key, &key, sizeof(struct key_attr));
                handle_first_pulse_group=1;
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
          symbol = ir_next_reader_clr_inc(rd);
          fail++;
       }
    }

start_timer_out:
    del_timer_sync(&xmp_timer[idx]);
	xmp_timer[idx].expires = jiffies +
						msecs_to_jiffies(ir->key_hold_timeout_time);
	xmp_timer[idx].data = idx;
	add_timer(&xmp_timer[idx]);

    return fail ? -1 : (cnt ? 0 : -1);
}


EXPORT_SYMBOL(xmp_match);
EXPORT_SYMBOL(xmp_parse);

