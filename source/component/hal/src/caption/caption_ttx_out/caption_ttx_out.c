#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#ifdef ANDROID
#include "hi_unf_disp.h"
#else
#include "hi_go.h"
#endif

#include "tvos_hal_common.h"
#include "caption_osd.h"
#include "caption_out_common.h"
#include "caption_ttx_msg.h"
#include "caption_ttx_out.h"

#ifdef LOG_TAG
#undef LOG_TAG
#endif
#define LOG_TAG "CAPTION"

#define ANDROID_COLOR2ARGB(a, c)  (a) = (c&0xff00ff00)|((c>>16)&0x000000ff)|((c<<16)&0x00ff0000)
#define HI_INVALID_HANDLE (0xffffffff)

#define   TTX_OSD_XOFFSET (60)
#define   TTX_OSD_YOFFSET (27)
#define   TTX_OSD_PAGEWIDTH (1800)    /** The width in display buffer, not in srceen. The max value of buffer width */
#define   TTX_OSD_PAGEHEIGHT (1026)     /** The height  in display buffer, not in srceen. The max value of buffer height*/

#define  TTX_PIXBYTE (4)      /** 4 byets per pixel*/
#define  TTX_OUTPUT_HANDLE    (0xFE00)

#define TTX_CHARWIDTH (12)   /** The width of a  char in picture(font0.png) */
#define TTX_CHARHEIGHT (10)   /** The height of a char iin picture(font0.png) */

#define TTX_CHARWIDTH1 (6) /*The width of a  char in small size*/
#define TTX_CHARHEIGHT1 (5)/*The height of a  char in small size*/

#define TTX_ROWOFFONT (16)   /** Row number of the font */
#define TTX_COLOFFONT (85)   /**  Column number of the font *//*64*/


static HI_U32 s_u32RowNum = 0;
static HI_U32 s_u32ColNum = 0;
static HI_CHAR* s_pu8FontAddr = HI_NULL;
static HI_U8* s_pu8MemAddr = HI_NULL;

/**  National char set */
static HI_U32 s_u32aNatCharset [14][96] =
{
    {          /* Latin G0 Primary Set----0 */
        0x00,  0x01, 0x02,  0x03,  0x04,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x20,  0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A,  0x3B,  0x3C,  0x3D,  0x3E,  0x3F,
        0x40,  0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A,  0x5B,  0x5C,  0x5D,  0x5E,  0x5F,
    },
    {          /* Latin G0 Czech/Slovak----1 */
        0x00,  0x01, 0x02,  0x03, 0x1A0,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1A1, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1A2, 0x1A3, 0x1A4, 0x1A5, 0x1A6,
        0x1A7, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1A8, 0x1A9, 0x1AA, 0x1AB,  0x5F,
    },
    {         /* Latin G0 English----2 */
        0x00,  0x01, 0x02, 0x143, 0x144,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x20,  0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x14C, 0x15D, 0x14E, 0x14D,  0x03,
        0x170, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x15C, 0x1AE, 0x15E, 0x158,  0x5F,
    },
    {          /* Latin G0 Estonian----3 */
        0x00,  0x01, 0x02,  0x03, 0x1AF,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1B0, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1B1, 0x1B2, 0x1B3, 0x1B4, 0x1B5,
        0x1AB, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1B6, 0x1B7, 0x1A3, 0x1B8,  0x5F,
    },
    {          /* Latin G0 French----4 */
        0x00,  0x01, 0x02, 0x1A7, 0x1B9,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1BA, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1BB, 0x1BC, 0x1BD, 0x1BE,  0x03,
        0x1BF, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1C0, 0x1C1, 0x1C2, 0x1C3,  0x5F,
    },

    {          /* Latin G0 German----5 */
        0x00,  0x01, 0x02,  0x03, 0x144,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x147, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1B1, 0x1B2, 0x1B4,  0x3E,  0x3F,
        0x150, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1B6, 0x1B7, 0x1B8, 0x19B,  0x5F,
    },

    {          /* Latin G0 Italian----6 */
        0x00,  0x01, 0x02, 0x143, 0x144,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1A7, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x150, 0x1C3, 0x14E, 0x14D,  0x03,
        0x1BD, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1BA, 0x1AD, 0x1BF, 0x1C5,  0x5F,
    },
    {          /* Latin G0 Lettish/Lithuanian----7 */
        0x00,  0x01, 0x02,  0x03, 0x144,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1B0, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1C6, 0x1C7, 0x1B3, 0x1A1, 0x1C8,
        0x1AB, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1C9, 0x1CA, 0x1A3, 0x1CB,  0x5F,
    },
    {          /* Latin G0 Polish----8 */
        0x00,  0x01, 0x02,  0x03, 0x1CC,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1C9, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1CD, 0x1CE, 0x188, 0x1CF, 0x1D0,
        0x1D1, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1D2, 0x1D3, 0x198, 0x1D4,  0x5F,
    },
    {          /* Latin G0 Portuguese/Spanish----9 */
        0x00,  0x01, 0x02, 0x1C3, 0x144,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x141, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1A8, 0x1A7, 0x1A5, 0x1D0, 0x1AA,
        0x15F, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1B8, 0x1D5, 0x1BF, 0x1BA,  0x5F,
    },
    {          /* Latin G0 Rumanian----10 */
        0x00,  0x01, 0x02, 0x03, 0x148,  0x05,  0x06,   0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1D6, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1D7, 0x1D8, 0x1D9, 0x1DA, 0x195,
        0x1DB, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1C0, 0x1DC, 0x1DD, 0x1BE,  0x5F,
    },
    {          /* Latin G0 Serbian/Croatian/Slovenian----11 */
        0x00,  0x01, 0x02,  0x03, 0x1DE,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1DF, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1E0, 0x1B3, 0x182, 0x1B0, 0x1BB,
        0x1A1, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1E0, 0x1A3, 0x192, 0x1AB,  0x5F,
    },
    {          /* Latin G0 Swedish/Finnish/Hungarian----12 */
        0x00,  0x01, 0x02,  0x03,  0x04,  0x05,  0x06,  0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1E1, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1B1, 0x1B2, 0x1E2, 0x1B4,  0x3F,
        0x1A7, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1B6, 0x1B7, 0x1E3, 0x1B8,  0x5F,
    },
    {          /* Latin G0 Turkish----13 */
        0x00,  0x01, 0x02,  0x1e4,  0x1e5,  0x05,  0x06,    0x07,
        0x08,  0x09, 0x0A,  0x0B,  0x0C,  0x0D,  0x0E,  0x0F,
        0x10,  0x11, 0x12,  0x13,  0x14,  0x15,  0x16,  0x17,
        0x18,  0x19, 0x1A,  0x1B,  0x1C,  0x1D,  0x1E,  0x1F,
        0x1E6, 0x21, 0x22,  0x23,  0x24,  0x25,  0x26,  0x27,
        0x28,  0x29, 0x2A,  0x2B,  0x2C,  0x2D,  0x2E,  0x2F,
        0x30,  0x31, 0x32,  0x33,  0x34,  0x35,  0x36,  0x37,
        0x38,  0x39, 0x3A, 0x1D8, 0x1B2, 0x1C4, 0x1B4, 0x1AC,
        0x195, 0x41, 0x42,  0x43,  0x44,  0x45,  0x46,  0x47,
        0x48,  0x49, 0x4A,  0x4B,  0x4C,  0x4D,  0x4E,  0x4F,
        0x50,  0x51, 0x52,  0x53,  0x54,  0x55,  0x56,  0x57,
        0x58,  0x59, 0x5A, 0x1DC, 0x1B7, 0x1C3, 0x1B8,  0x5F,
    },
};

#ifdef LINUX_OS
#define TTX_FONT_FILE_PNG "/usr/data/font/font0.png"
#define TTX_FONT_FILE_BIN "/usr/data/font/font0.bin"

static HI_HANDLE s_hLayer = HIGO_INVALID_HANDLE;
static HI_HANDLE s_hLayerSurface = HIGO_INVALID_HANDLE;
static HI_HANDLE s_hMemSurface = HIGO_INVALID_HANDLE;
static HI_HANDLE s_hFontSurface = HIGO_INVALID_HANDLE;
#else
#define TTX_FONT_FILE_BIN "/system/ttx/font0.bin"

static HI_HANDLE s_hSurface = HI_INVALID_HANDLE;
static HI_U32 s_u32ScreenWidth = 1920;
static HI_U32 s_u32ScreenHeight = 1080;
#endif

#ifndef LINUX_OS

#if (PLATFORM_SDK_VERSION >= 24)
static pthread_mutex_t s_CaptionTTXHandleMutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
#else
static pthread_mutex_t s_CaptionTTXHandleMutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER;
#endif

#define CAPTION_TTX_LOCK() HAL_DEBUG("CAPTIONTTXLOCK %d", __LINE__);(VOID)pthread_mutex_lock( &s_CaptionTTXHandleMutex )
#define CAPTION_TTX_UNLOCK() HAL_DEBUG("CAPTIONTTXUNLOCK %d", __LINE__);(VOID)pthread_mutex_unlock( &s_CaptionTTXHandleMutex )
//#define CAPTION_TTX_LOCK() (void)pthread_mutex_lock( &s_CaptionTTXHandleMutex )
//#define CAPTION_TTX_UNLOCK() (void)pthread_mutex_unlock( &s_CaptionTTXHandleMutex )

#endif

#ifdef LINUX_OS

/** decode the picture of font to a layer  */
static HI_S32 ttx_higo_decFile(HI_CHAR* pszFileName, HI_HANDLE* pSurface)
{
    HI_S32 s32Ret;
    HI_HANDLE hDecoder;
    HIGO_DEC_ATTR_S stSrcDesc;

    /** create decode*/
    stSrcDesc.SrcType = HIGO_DEC_SRCTYPE_FILE;
    stSrcDesc.SrcInfo.pFileName = pszFileName;
    s32Ret = HI_GO_CreateDecoder(&stSrcDesc, &hDecoder);

    if (HI_SUCCESS != s32Ret)
    {
        return s32Ret;
    }

    /** decode it to Surface */
    s32Ret  = HI_GO_DecImgData(hDecoder, 0, NULL, pSurface);
    s32Ret |= HI_GO_DestroyDecoder(hDecoder);
    return s32Ret;
}

/** Init higo , used to show teletext */
HI_S32  ttx_higo_surface_init(HI_HANDLE hOut)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_CHAR* aszFileName = NULL;
    HI_PIXELDATA stPixData;

    HAL_CHK_RETURN((HIGO_INVALID_HANDLE == hOut), FAILURE, "s_hLayer failed! s32Ret = 0x%x !\n", s32Ret);

    s_hLayer = hOut;

    HAL_DEBUG("[%s, %d] s_hLayer = 0x%x!\n", __FUNCTION__, __LINE__, s_hLayer);

    s32Ret = HI_GO_GetLayerSurface(s_hLayer, &s_hLayerSurface);

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("HI_GO_GetLayerSurface failed ! s32Ret = 0x%x\n", s32Ret);
        goto ERR;
    }

    HAL_DEBUG("[%s, %d] s_hLayerSurface = 0x%x!\n", __FUNCTION__, __LINE__, s_hLayerSurface);

    /**decoding*/
    aszFileName = TTX_FONT_FILE_PNG;
    s32Ret = ttx_higo_decFile(aszFileName, &s_hFontSurface);

    if (HI_SUCCESS == s32Ret)
    {
        HAL_ERROR("[%s, %d] s_hFontSurface = 0x%x!\n", __FUNCTION__, __LINE__, s_hFontSurface);

        if (HI_SUCCESS != HI_GO_LockSurface(s_hFontSurface, stPixData, HI_TRUE))
        {
            HAL_ERROR("[%s, %d]HI_GO_LockSurface failed ! s32Ret = 0x%x\n", __FUNCTION__, __LINE__, s32Ret);
            goto ERR;
        }

        s_pu8FontAddr = (HI_CHAR*)(stPixData[0].pData);

        if (HI_SUCCESS != HI_GO_UnlockSurface(s_hFontSurface))
        {
            HAL_ERROR("[%s, %d]HI_GO_UnlockSurface failed ! s32Ret = 0x%x\n", __FUNCTION__, __LINE__, s32Ret);
            goto ERR;
        }

        return s32Ret;
    }
    else
    {
        /* if not support png decoding, read font data from font0.bin */
        HI_S32 s32File = 0;

        s32Ret = HI_GO_CreateSurface(1020, 160, HIGO_PF_8888, &s_hFontSurface);

        if (HI_SUCCESS != s32Ret)
        {
            HAL_ERROR("[%s, %d]HI_GO_CreateSurface failed ! s32Ret = 0x%x\n", __FUNCTION__, __LINE__, s32Ret);
            goto ERR;
        }

        if (HI_SUCCESS != HI_GO_LockSurface(s_hFontSurface, stPixData, HI_TRUE))
        {
            HAL_ERROR("[%s, %d]HI_GO_LockSurface failed ! s32Ret = 0x%x\n", __FUNCTION__, __LINE__, s32Ret);
            goto ERR;
        }

        s_pu8FontAddr = (HI_CHAR*)stPixData[0].pData;

        (HI_VOID)HI_GO_FillRect(s_hFontSurface, NULL, 0x00000000, HIGO_COMPOPT_NONE);
        s32File = open(TTX_FONT_FILE_BIN, O_RDONLY, 0);

        if (-1 == s32File)
        {
            HAL_ERROR("[%s, %d] open /font0.bin failed ! s32Ret = 0x%x\n", __FUNCTION__, __LINE__, s32Ret);
            goto ERR;
        }

        ssize_t u32ReadLength = 1020 * 160 * 4;
        ssize_t u32ReadCount = 0;

        (VOID)lseek(s32File, 0, s32File);

        u32ReadCount = read(s32File, s_pu8FontAddr, u32ReadLength);

        if (u32ReadCount != u32ReadLength)
        {
            close(s32File);

            (HI_VOID)HI_GO_UnlockSurface(s_hFontSurface);

            goto ERR;
        }

        close(s32File);

        if (HI_SUCCESS != HI_GO_UnlockSurface(s_hFontSurface))
        {
            HAL_ERROR("[%s, %d]HI_GO_UnlockSurface failed ! s32Ret = 0x%x\n", __FUNCTION__, __LINE__, s32Ret);
            goto ERR;
        }

        return s32Ret;
    }

ERR:

    if (HIGO_INVALID_HANDLE != s_hFontSurface)
    {
        (VOID)HI_GO_FreeSurface(s_hFontSurface);
        s_hFontSurface = HIGO_INVALID_HANDLE;
    }

    s_hLayerSurface = HIGO_INVALID_HANDLE;

    HAL_ERROR("Higo_Teletext_Init failed !\n");

    return FAILURE;
}

/** Deinit higo  */
static HI_S32 ttx_higo_surface_deInit()
{
    HI_S32 s32Ret = HI_SUCCESS;

    HAL_DEBUG("\n -----%s, %d begin ---\n", __FUNCTION__, __LINE__);

    s32Ret = HI_GO_FreeSurface(s_hFontSurface);

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("call HI_GO_FreeSurface failed !\n");
    }

    s_hFontSurface = HIGO_INVALID_HANDLE;
    s_hLayerSurface = HIGO_INVALID_HANDLE;
    s_hLayer = HIGO_INVALID_HANDLE;

    return s32Ret;
}

static HI_S32 ttx_higo_fillRect(HI_UNF_TTX_FILLRECT_S* pstParam)
{
    HI_U32 i = 0;
    HI_U32 j = 0;
    HI_U32 u32Color = 0;
    HI_U32 u32Row = 0;
    HI_U32 u32Column = 0;
    HI_U32 u32RowCount = 0;
    HI_U32 u32ColCount = 0;
    HI_U32 u32BytesPerRowInMem = 0;

    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

    if ((HIGO_INVALID_HANDLE == s_hLayer) ||
        (HIGO_INVALID_HANDLE == s_hLayerSurface) ||
        (HIGO_INVALID_HANDLE == s_hMemSurface) ||
        (HI_NULL == s_pu8MemAddr))
    {
        HAL_ERROR("In fillRect, surface Invalid!\n");
        return HI_FAILURE;
    }

    u32Row = pstParam->pstPageArea->u32Row;
    u32Column = pstParam->pstPageArea->u32Column;
    u32RowCount = pstParam->pstPageArea->u32RowCount;
    u32ColCount = pstParam->pstPageArea->u32ColumnCount;
    u32BytesPerRowInMem = s_u32ColNum * TTX_CHARWIDTH * TTX_PIXBYTE;

    for (i = u32Row * TTX_CHARHEIGHT; i < (u32Row + u32RowCount) * TTX_CHARHEIGHT; i++)
    {

        for (j = u32Column * TTX_CHARWIDTH;  j < (u32Column + u32ColCount) * TTX_CHARWIDTH; j++)
        {
            u32Color = pstParam->u32Color;
            *((HI_U32*)(s_pu8MemAddr + i * u32BytesPerRowInMem + j * TTX_PIXBYTE)) = u32Color;
        }
    }

    return HI_SUCCESS;
}

static HI_S32 ttx_higo_refresh(HI_UNF_TTX_REFRESHLAYER_S* pstParam)
{
    HI_RECT stDesRect = {0};
    HI_RECT stSrcRect = {0};
    HI_PIXELDATA stPixData;
    HIGO_BLTOPT_S stBltOpt;
    HI_U32 u32WidthPerCol;
    HI_U32 u32HeightPerRow;
    HI_S32 s32Ret = HI_SUCCESS;

    if ((HIGO_INVALID_HANDLE == s_hLayer) ||
        (HIGO_INVALID_HANDLE == s_hLayerSurface) ||
        (HIGO_INVALID_HANDLE == s_hMemSurface))
    {
        HAL_ERROR("In refresh, surface Invalid!\n");
        return HI_FAILURE;
    }

    u32WidthPerCol = TTX_OSD_PAGEWIDTH / s_u32ColNum;
    u32HeightPerRow = TTX_OSD_PAGEHEIGHT / s_u32RowNum;

    memset(&stPixData, 0, sizeof(stPixData));
    memset(&stBltOpt, 0, sizeof(stBltOpt));
    stBltOpt.EnableScale = HI_TRUE;

    stSrcRect.x = pstParam->pstPageArea->u32Column * TTX_CHARWIDTH;
    stSrcRect.y = pstParam->pstPageArea->u32Row * TTX_CHARHEIGHT;
    stSrcRect.w = pstParam->pstPageArea->u32ColumnCount * TTX_CHARWIDTH;
    stSrcRect.h = pstParam->pstPageArea->u32RowCount * TTX_CHARHEIGHT;

    stDesRect.x = TTX_OSD_XOFFSET + pstParam->pstPageArea->u32Column * u32WidthPerCol;
    stDesRect.y = TTX_OSD_YOFFSET + pstParam->pstPageArea->u32Row * u32HeightPerRow;
    stDesRect.w = pstParam->pstPageArea->u32ColumnCount * u32WidthPerCol;
    stDesRect.h = pstParam->pstPageArea->u32RowCount * u32HeightPerRow;

    s32Ret = HI_GO_Blit(s_hMemSurface, &stSrcRect, s_hLayerSurface, &stDesRect, &stBltOpt);

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("HI_GO_Blit Failed. s32Ret = 0x%x!\n", s32Ret);
        return HI_FAILURE;
    }

    s32Ret = HI_GO_RefreshLayer(s_hLayer, &stDesRect);

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("HI_GO_RefreshLayer Failed. s32Ret = 0x%x!\n", s32Ret);
        //return HI_FAILURE;
    }

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("ttx_output_refresh failed !\n");
    }

    return HI_SUCCESS;
}

#else
static HI_S32 ttx_osd_get_filesize(FILE* f, HI_U32* pu32Size)
{
    long pos = ftell(f);

    fseek(f, 0, SEEK_END);

    long len = ftell(f);

    fseek(f, pos, SEEK_SET);

    if (-1 != len)
    {
        *pu32Size = (HI_U32)len;
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

static HI_VOID ttx_osd_font_deinit(HI_VOID)
{
    if (HI_NULL != s_pu8FontAddr)
    {
        free(s_pu8FontAddr);
        s_pu8FontAddr = HI_NULL;
    }
}

static HI_S32 ttx_osd_font_init(HI_VOID)
{
    HI_CHAR* pbuffer = HI_NULL;
    HI_U32  u32Size = 0;
    HI_S32 s32Ret = 0;

    ttx_osd_font_deinit();

    FILE* pfile = fopen(TTX_FONT_FILE_BIN, "rb");

    if (HI_NULL == pfile)
    {
        HAL_ERROR("LoadFont: Load files failed for ttx font");
        return FAILURE;
    }

    s32Ret = ttx_osd_get_filesize(pfile, &u32Size);

    if (HI_SUCCESS != s32Ret || 0 == u32Size)
    {
        HAL_ERROR("u32Size is error");
        fclose(pfile);
        return FAILURE;
    }

    pbuffer = (HI_CHAR*) malloc(u32Size * sizeof(HI_U8));

    if (HI_NULL == pbuffer)
    {
        HAL_ERROR("LoadFont: Memory alloc failed for ttx font ");
        fclose(pfile);
        return FAILURE;
    }

    memset(pbuffer, 0, u32Size * sizeof(HI_U8));
    fread(pbuffer, 1, u32Size, pfile);

    s_pu8FontAddr = pbuffer;

    fclose(pfile);

    return SUCCESS;
}

static HI_S32 ttx_osd_fillRect(HI_UNF_TTX_FILLRECT_S* pstParam)
{
    HI_U32 i = 0;
    HI_U32 j = 0;
    HI_U32 u32Color = 0;
    HI_U32 u32Row = 0;
    HI_U32 u32Column = 0;
    HI_U32 u32RowCount = 0;
    HI_U32 u32ColCount = 0;
    HI_U32 u32BytesPerRowInMem = 0;

    if (HI_INVALID_HANDLE == s_hSurface || HI_NULL == s_pu8MemAddr)
    {
        HAL_ERROR("[%s, %d] In DrawChar, surface Invalid! %x, %x\n", __FUNCTION__, __LINE__, s_hSurface, s_pu8MemAddr);
        return HI_FAILURE;
    }
    CAPTION_TTX_LOCK();
    u32Row = pstParam->pstPageArea->u32Row;
    u32Column    = pstParam->pstPageArea->u32Column;
    u32RowCount = pstParam->pstPageArea->u32RowCount;
    u32ColCount = pstParam->pstPageArea->u32ColumnCount;
    u32BytesPerRowInMem = s_u32ColNum * TTX_CHARWIDTH * TTX_PIXBYTE;

    for (i = u32Row * TTX_CHARHEIGHT; i < (u32Row + u32RowCount) * TTX_CHARHEIGHT; i++)
    {
        for (j = u32Column * TTX_CHARWIDTH;  j < (u32Column + u32ColCount) * TTX_CHARWIDTH; j++)
        {
#ifdef ANDROID
            ANDROID_COLOR2ARGB(u32Color, pstParam->u32Color);
#else
            u32Color = pstParam->u32Color;
#endif
            *((HI_U32*)(s_pu8MemAddr + i * u32BytesPerRowInMem + j * TTX_PIXBYTE)) = u32Color;
        }
    }
    CAPTION_TTX_UNLOCK();
    return HI_SUCCESS;
}

static HI_S32 ttx_osd_refresh(HI_UNF_TTX_REFRESHLAYER_S* pstParam)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_RECT_S stDesRect = {0};
    HI_RECT_S stSrcRect = {0};
    CAPTION_TTX_LOCK();
    if (HI_INVALID_HANDLE == s_hSurface || HI_NULL == s_pu8MemAddr)
    {
        HAL_ERROR("[%s, %d] In DrawChar, surface Invalid! %x, %x\n", __FUNCTION__, __LINE__, s_hSurface, s_pu8MemAddr);
        CAPTION_TTX_UNLOCK();
        return HI_FAILURE;
    }

    stSrcRect.s32X = 0;
    stSrcRect.s32Y = 0;
    stSrcRect.s32Width = s_u32ColNum * TTX_CHARWIDTH;
    stSrcRect.s32Height = s_u32RowNum * TTX_CHARHEIGHT;

    stDesRect.s32X = 10;
    stDesRect.s32Y = 10;

    stDesRect.s32Width = s_u32ScreenWidth - stDesRect.s32X * 2;
    stDesRect.s32Height = s_u32ScreenHeight - stDesRect.s32Y * 2;

    s32Ret = caption_osd_ttx_draw_bitmap(s_hSurface, s_pu8MemAddr, &stSrcRect, &stDesRect);
    CAPTION_TTX_UNLOCK();
    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("ttx_output_refresh failed !\n");
    }

    return HI_SUCCESS;
}

#endif

static HI_U32 caption_ttx_font_getG0CharIndex(HI_UNF_TTX_CHARATTR_S stCharAttr)
{
    HI_U32 u32Char = 0;
    HI_U8 u8NationSet = 0;

    u32Char = stCharAttr.u32Index;

    switch (stCharAttr.enG0Set)
    {
        case HI_UNF_TTX_G0SET_LATIN:
            u8NationSet = stCharAttr.u8NationSet;
            u32Char = s_u32aNatCharset[u8NationSet][u32Char - 0x20];
            break;

        case  HI_UNF_TTX_G0SET_CYRILLIC_1:
            u32Char -= 0x20;
            u32Char += 0x2b0;
            break;

        case HI_UNF_TTX_G0SET_CYRILLIC_2:
            u32Char -= 0x20;
            u32Char += 0x310;
            break;

        case HI_UNF_TTX_G0SET_CYRILLIC_3:
            u32Char -= 0x20;
            u32Char += 0x370;
            break;

        case HI_UNF_TTX_G0SET_GREEK:
            u32Char -= 0x20;
            u32Char += 0x430;
            break;

        case HI_UNF_TTX_G0SET_HEBREW:
            u32Char -= 0x20;
            u32Char += 0x4f0;
            break;

        case HI_UNF_TTX_G0SET_ARABIC:
            u32Char -= 0x20;
            u32Char += 0x1f0;
            break;

        default:
            break;
    }

    return u32Char;
}

static HI_U32 caption_ttx_font_getG2CharIndex(HI_UNF_TTX_CHARATTR_S stCharAttr)
{
    HI_U32 u32Char = 0;

    u32Char = stCharAttr.u32Index;

    switch (stCharAttr.enG2Set)
    {
        case HI_UNF_TTX_G2SET_LATIN:
            u32Char -= 0x20;
            u32Char += 0x140;
            break;

        case HI_UNF_TTX_G2SET_CYRILLIC:
            u32Char -= 0x20;
            u32Char += 0x3d0;
            break;

        case HI_UNF_TTX_G2SET_GREEK:
            u32Char -= 0x20;
            u32Char += 0x490;
            break;

        case HI_UNF_TTX_G2SET_ARABIC:
            u32Char -= 0x20;
            u32Char += 0x250;
            break;

        default:
            break;
    }

    return u32Char;
}

HI_U32 caption_ttx_font_findIndex(HI_UNF_TTX_CHARATTR_S stCharAttr)
{
    HI_U32 u32Char = 0;

    if ((stCharAttr.u32Index < 0x20) || (stCharAttr.u32Index > 0x7f)) /**  Invalid param, just return */
    {
        return u32Char;
    }

    u32Char = stCharAttr.u32Index;

    switch (stCharAttr.enCharSet)
    {
        case HI_UNF_TTX_CHARSET_G0:
            u32Char = caption_ttx_font_getG0CharIndex(stCharAttr);
            break;

        case HI_UNF_TTX_CHARSET_G1:
            u32Char -= 0x20;
            u32Char += (stCharAttr.bContiguous ? 0 : 1) * 64 + ((u32Char >= 32) ? 64 : 96);
            break;

        case HI_UNF_TTX_CHARSET_G2:
            u32Char = caption_ttx_font_getG2CharIndex(stCharAttr);
            break;

        case HI_UNF_TTX_CHARSET_G3:
            u32Char -= 0x20;
            u32Char += 0xE0;
            break;

        default:
            break;
    }

    return u32Char;
}


static HI_BOOL  ttx_output_IsValidArea(HI_UNF_TTX_PAGEAREA_S* pstPageArea)
{
    if (HI_NULL == pstPageArea)
    {
        return HI_FALSE;
    }

    if ((pstPageArea->u32Row >= s_u32RowNum) || (pstPageArea->u32RowCount > s_u32RowNum))
    {
        return HI_FALSE;
    }

    if ((pstPageArea->u32Column >= s_u32ColNum) || (pstPageArea->u32ColumnCount > s_u32ColNum))
    {
        return HI_FALSE;
    }

    if ((pstPageArea->u32Row + pstPageArea->u32RowCount) > s_u32RowNum)
    {
        return HI_FALSE;
    }

    if ((pstPageArea->u32Column + pstPageArea->u32ColumnCount) > s_u32ColNum)
    {
        return HI_FALSE;
    }

    return HI_TRUE;
}

/** ????????**/

/** ????????????????4????????????????????????????

??????????:  ????????????????????????????????????

????????????????????????????????????????????255

??????????????????????????????**/

/** ????  */

/*1.????????????????????????????????????
2.??????????????????????????????????????????????????????????
3.??????????????????????????????????????????????????????????
4.??????????????????????????????????????????????????????255??
   ?????????????????????? ????????????????????????????????
5.??????????????????????????????????????????????????????????????*/

/** Draw a char in osd */
static HI_VOID ttx_output_draw_char(HI_UNF_TTX_DRAWCAHR_S* pstParam)
{
    HI_U32 i = 0;
    HI_U32 j = 0;
    HI_U32 k = 0;
    HI_U32 h = 0;
    HI_U32 m = 0;
    HI_U32 n = 0;
    HI_U32 u32Color = 0;
    HI_U32 u32Index = 0;
    HI_U32 u32SrcRow = 0;
    HI_U32 u32SrcColumn = 0;
    HI_U32 u32DesRow = 0;
    HI_U32 u32DesColumn = 0;
    HI_U32 u32DesRowCount = 0;
    HI_U32 u32DesColCount = 0;
    HI_BOOL bRedrawChar = HI_FALSE;
    HI_U32 u32BytesPerRowInFont = 0;
    HI_U32 u32BytesPerRowInMem = 0;

    HAL_CHK_RETURN_VOID((HI_NULL == pstParam), "In DrawChar, pstParam invalid!");
    HAL_CHK_RETURN_VOID((HI_NULL == pstParam->pstCharAttr), "In DrawChar, pstCharAttr invalid!");
    HAL_CHK_RETURN_VOID((!ttx_output_IsValidArea(pstParam->pstPageArea)), "In DrawChar, pstPageArea invalid!");

#ifdef LINUX_OS
    HAL_CHK_RETURN_VOID(((HI_INVALID_HANDLE == s_hLayerSurface) || (HIGO_INVALID_HANDLE == s_hMemSurface)),
                        "In ttx_output_draw_drcs, surface Invalid!\n");
#else
    HAL_CHK_RETURN_VOID((HI_INVALID_HANDLE == s_hSurface), "In ttx_output_draw_char, surface Invalid!\n");
#endif

    u32Index  = caption_ttx_font_findIndex(*(pstParam->pstCharAttr));
    u32SrcRow = u32Index % TTX_ROWOFFONT;
    u32SrcColumn = u32Index / TTX_ROWOFFONT;

    u32DesRow = pstParam->pstPageArea->u32Row;
    u32DesColumn   = pstParam->pstPageArea->u32Column;
    u32DesRowCount = pstParam->pstPageArea->u32RowCount;
    u32DesColCount = pstParam->pstPageArea->u32ColumnCount;

    u32BytesPerRowInFont = TTX_COLOFFONT * TTX_CHARWIDTH * TTX_PIXBYTE;
    u32BytesPerRowInMem = s_u32ColNum * TTX_CHARWIDTH * TTX_PIXBYTE;

    /**jude if it is Diacritical mark*/
    if ((pstParam->pstCharAttr->enCharSet == HI_UNF_TTX_CHARSET_G2) &&
        (pstParam->pstCharAttr->u32Index > 0x40) &&
        (pstParam->pstCharAttr->u32Index < 0x50))
    {
        bRedrawChar = HI_TRUE;
    }
    else
    {
        bRedrawChar = HI_FALSE;
    }

    for (i = u32DesRow * TTX_CHARHEIGHT, n = u32SrcRow * TTX_CHARHEIGHT;
         i < (u32DesRow + u32DesRowCount) * TTX_CHARHEIGHT;  i += u32DesRowCount, n++)
    {
        for (j = u32DesColumn * TTX_CHARWIDTH, m = u32SrcColumn * TTX_CHARWIDTH;
             j < (u32DesColumn + u32DesColCount) * TTX_CHARWIDTH; j += u32DesColCount, m++)
        {
            for (k = 0; k < u32DesRowCount; k++)
            {
                for (h = 0; h < u32DesColCount; h++)
                {
                    if ((HI_U8) * (s_pu8FontAddr + n * u32BytesPerRowInFont + m * TTX_PIXBYTE + 3) == 0xFF)
                    {
#ifdef LINUX_OS
                        u32Color = pstParam->u32Foreground;
#else
                        ANDROID_COLOR2ARGB(u32Color, pstParam->u32Foreground);
#endif

                        *((HI_U32*)(s_pu8MemAddr + (i + k) * u32BytesPerRowInMem + (j + h) * TTX_PIXBYTE)) = u32Color;
                    }
                    else
                    {
                        if (!bRedrawChar)
                        {
#ifdef LINUX_OS
                            u32Color = pstParam->u32Background;
#else
                            ANDROID_COLOR2ARGB(u32Color, pstParam->u32Background);
#endif
                            *((HI_U32*)(s_pu8MemAddr + (i + k) * u32BytesPerRowInMem + (j + h) * TTX_PIXBYTE)) = u32Color;
                        }
                    }
                }
            }
        }
    }

    return;
}

/** ???????? */

/**  1.??????????????????????
       2.??????????????????????????????????
       3.??????????????????????????????
 */

/**  Use specify  color  to fill  a rectangle */
static HI_VOID ttx_output_fill_rect(HI_UNF_TTX_FILLRECT_S* pstParam)
{
    if ((HI_NULL == pstParam) || !ttx_output_IsValidArea(pstParam->pstPageArea))
    {
        HAL_ERROR("In FillRect, Invalid param!\n");

        return;
    }

#ifdef LINUX_OS
    ttx_higo_fillRect(pstParam);
#else
    ttx_osd_fillRect(pstParam);
#endif

    return;
}

/** ???????? */

/**  1.??????????????????????
       2.??????????????????????????????????
       3.??????????????????????????????????
 */

/**  Use specify  colors  to draw  a drcs */
static HI_VOID ttx_output_draw_drcs(HI_UNF_TTX_DRAWDRCSCHAR_S* pstParam)
{
    HI_U32 i = 0;
    HI_U32 j = 0;
    HI_U32 m = 0;
    HI_U32 n = 0;
    HI_U32 m1 = 0;
    HI_U32 n1 = 0;
    HI_U32 u32Row = 0;
    HI_U32 u32Column = 0;
    HI_U32 u32RowCount = 0;
    HI_U32 u32ColCount = 0;
    HI_U32 u32BytesPerRowInMem = 0;

#ifdef LINUX_OS
    HAL_CHK_RETURN_VOID((HI_INVALID_HANDLE == s_hLayerSurface), "In ttx_output_draw_drcs, surface Invalid!\n");
#else
    HAL_CHK_RETURN_VOID((HI_INVALID_HANDLE == s_hSurface), "In ttx_output_draw_drcs, surface Invalid!\n");
#endif

    if ((HI_NULL == pstParam) || !ttx_output_IsValidArea(pstParam->pstPageArea))
    {
        HAL_ERROR("In ttx_output_draw_drcs, Invalid param!\n");
        return;
    }

    u32Row = pstParam->pstPageArea->u32Row;
    u32Column   = pstParam->pstPageArea->u32Column;
    u32RowCount = pstParam->pstPageArea->u32RowCount;
    u32ColCount = pstParam->pstPageArea->u32ColumnCount;
    u32BytesPerRowInMem = s_u32ColNum * TTX_CHARWIDTH * TTX_PIXBYTE;

    if (HI_UNF_TTX_DRCS_SIZE_NORMAL == pstParam->enDRCSSize)
    {
        for (i = u32Row * TTX_CHARHEIGHT, m = 0; i < (u32Row + u32RowCount) * TTX_CHARHEIGHT; i++, m++)
        {
            m1 = (m / u32RowCount);

            for (j = u32Column * TTX_CHARWIDTH, n = 0;  j < (u32Column + u32ColCount) * TTX_CHARWIDTH; j++, n++)
            {
                n1 = (n / u32ColCount);
                *((HI_U32*)(s_pu8MemAddr + i * u32BytesPerRowInMem + j * TTX_PIXBYTE)) = pstParam->pu32DRCSColorInfo[m1 * TTX_CHARWIDTH + n1];
            }
        }
    }
    else
    {
        for (i = u32Row * TTX_CHARHEIGHT, m = 0; i < (u32Row + u32RowCount) * TTX_CHARHEIGHT; i++, m++)
        {
            m1 = (m / u32RowCount);

            for (j = u32Column * TTX_CHARWIDTH, n = 0;  j < (u32Column + u32ColCount) * TTX_CHARWIDTH; j++, n++)
            {
                n1 = (n / u32ColCount);

                if (( m1 < TTX_CHARHEIGHT1) && (n1 < TTX_CHARWIDTH1))
                {
                    *((HI_U32*)(s_pu8MemAddr + i * u32BytesPerRowInMem + j * TTX_PIXBYTE)) = pstParam->pu32DRCSColorInfo[m1 * TTX_CHARWIDTH + n1];
                }
                else
                {
                    *((HI_U32*)(s_pu8MemAddr + i * u32BytesPerRowInMem + j * TTX_PIXBYTE)) = pstParam->u32Background;
                }
            }
        }
    }

    return;
}

/** Refresh  osd  layer  */
static HI_VOID ttx_output_refresh(HI_UNF_TTX_REFRESHLAYER_S* pstParam)
{
    if ((HI_NULL == pstParam) || !ttx_output_IsValidArea(pstParam->pstPageArea))
    {
        HAL_ERROR("In RefreshLayer, Invalid param!\n");
        return;
    }

#ifdef LINUX_OS
    ttx_higo_refresh(pstParam);
#else
    ttx_osd_refresh(pstParam);
#endif

    return;
}

static HI_VOID ttx_output_send_guimsg(HI_HANDLE*   phDispalyHandle)
{
    HI_HANDLE hDispalyHandle;
    MESSAGE_S stMsg;

    HAL_CHK_RETURN_VOID((HI_NULL == phDispalyHandle), "phDispalyHandle invalid!");

    hDispalyHandle = (*phDispalyHandle);

    stMsg.pu8MsgData   = (HI_U8*) &hDispalyHandle;
    stMsg.u16MsgLength = sizeof(hDispalyHandle);

    if (HI_SUCCESS != MsgQueue_En(&stMsg))
    {
        HAL_ERROR("call MsgQueue_En failed !\n");
    }

    return;
}

static HI_S32 ttx_output_create_buff(HI_UNF_TTX_BUFFER_PARAM_S* pstBufferParam)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

    if (HI_NULL == pstBufferParam)
    {
        return HI_FAILURE;
    }

    s_u32RowNum = pstBufferParam->u32Row;
    s_u32ColNum = pstBufferParam->u32Column;

#ifdef LINUX_OS
    HI_PIXELDATA stPixData;
    HI_S32 s32Width = TTX_CHARWIDTH * s_u32ColNum;
    HI_S32 s32Height = TTX_CHARHEIGHT * s_u32RowNum;

    if (HIGO_INVALID_HANDLE == s_hMemSurface)
    {
        if (HI_SUCCESS != HI_GO_CreateSurface(s32Width, s32Height, HIGO_PF_8888, &s_hMemSurface))
        {
            HAL_ERROR("HI_GO_CreateSurface failed ! row = %d, col = %d\n", s_u32RowNum, s_u32ColNum);
            goto BEBACK;
        }
    }

    HAL_DEBUG("[%s, %d] s_hMemSurface = 0x%x!\n", __FUNCTION__, __LINE__, s_hMemSurface);

    s32Ret = HI_GO_LockSurface(s_hMemSurface, stPixData, HI_TRUE);

    if (HI_SUCCESS != s32Ret)
    {
        s32Ret &= HI_GO_FreeSurface(s_hMemSurface);
        s_hMemSurface = HIGO_INVALID_HANDLE;
        s_pu8MemAddr = HI_NULL;
        goto BEBACK;
    }

    s_pu8MemAddr = (HI_U8*)stPixData[0].pData;

    if (HI_SUCCESS != HI_GO_UnlockSurface(s_hMemSurface))
    {
        s32Ret &= HI_GO_FreeSurface(s_hMemSurface);
        s_hMemSurface = HIGO_INVALID_HANDLE;
        HAL_ERROR("HI_GO_UnlockSurface failed !\n");
        goto BEBACK;
    }

#else

    if (HI_NULL == s_pu8MemAddr)
    {
        s_pu8MemAddr = (HI_U8*)malloc(TTX_CHARWIDTH * s_u32ColNum * TTX_CHARHEIGHT * s_u32RowNum * TTX_PIXBYTE);

        if (HI_NULL == s_pu8MemAddr)
        {
            HAL_ERROR("ttx_output_create_buff failed !\n");
            return HI_FAILURE;
        }
    }

#endif

    return HI_SUCCESS;

BEBACK:

    HAL_ERROR("TTX_Create_Buffer failed !\n");
    return HI_FAILURE;
}

static HI_S32 ttx_output_destory_buff()
{
    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

#ifdef LINUX_OS

    HAL_CHK_RETURN((0 == s_pu8MemAddr), HI_FAILURE, "[%s,%d]\n", __FUNCTION__, __LINE__);

    s_pu8MemAddr = HI_NULL;
    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

    if (s_hMemSurface != HIGO_INVALID_HANDLE)
    {
        HAL_DEBUG("[%s,%d] s_hMemSurface = %x\n", __FUNCTION__, __LINE__, s_hMemSurface);

        if (HI_SUCCESS != HI_GO_FreeSurface(s_hMemSurface))
        {
            HAL_ERROR("[%s,%d]\n", __FUNCTION__, __LINE__);
            return HI_FAILURE;
        }

        HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);
        s_hMemSurface = HIGO_INVALID_HANDLE;
    }

#else

    if (HI_NULL != s_pu8MemAddr)
    {
        free(s_pu8MemAddr);
        s_pu8MemAddr = HI_NULL;
    }

#endif

    return HI_SUCCESS;
}

HI_S32 caption_ttx_output_init(HI_HANDLE* phOut)
{
    HI_S32 s32Ret = FAILURE;

    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

    s32Ret = caption_output_init(phOut);
    HAL_CHK_RETURN((SUCCESS != s32Ret), FAILURE, "caption_output_init failed, ret = 0x%x !\n", s32Ret);

#ifdef LINUX_OS
    s32Ret = ttx_higo_surface_init(*phOut);
    HAL_CHK_RETURN((SUCCESS != s32Ret), FAILURE, "ttx_higo_Init failed, ret = 0x%x !\n", s32Ret);

#else
    s32Ret = ttx_osd_font_init();
    HAL_CHK_RETURN((SUCCESS != s32Ret), FAILURE, "caption_output_init failed, ret = 0x%x !\n", s32Ret);

#endif

    return SUCCESS;
}

HI_S32 caption_ttx_output_deinit(HI_HANDLE hOut)
{
    HI_S32 s32Ret = HI_FAILURE;

    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

#ifndef LINUX_OS
    CAPTION_TTX_LOCK();
#endif

#ifdef LINUX_OS
    s32Ret = ttx_higo_surface_deInit();
    HAL_CHK_RETURN((HI_SUCCESS != s32Ret), FAILURE, "ttx_higo_surface_deInit failed, ret = 0x%x !\n", s32Ret);

#else
    ttx_osd_font_deinit();
#endif

    s32Ret = caption_output_deinit();
#ifndef LINUX_OS
        CAPTION_TTX_UNLOCK();
#endif
    HAL_CHK_RETURN((SUCCESS != s32Ret), FAILURE, "caption_output_deinit failed, ret = 0x%x !\n", s32Ret);

    return SUCCESS;
}

HI_S32 caption_ttx_output_create_surface(HI_RECT_S stRect)
{
    HI_S32 s32Ret = HI_FAILURE;

    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

#ifdef LINUX_OS
    HI_S32 s32Width = TTX_CHARWIDTH * s_u32ColNum;
    HI_S32 s32Height = TTX_CHARHEIGHT * s_u32RowNum;

    if (HIGO_INVALID_HANDLE == s_hMemSurface)
    {
        if (HI_SUCCESS != HI_GO_CreateSurface(s32Width, s32Height, HIGO_PF_8888, &s_hMemSurface))
        {
            HAL_ERROR("HI_GO_CreateSurface failed ! row = %d, col = %d\n", s_u32RowNum, s_u32ColNum);
            return FAILURE;
        }
    }

    s32Ret = HI_GO_FillRect(s_hMemSurface, NULL, 0x00000000, HIGO_COMPOPT_NONE);
    HAL_CHK_RETURN((HI_SUCCESS != s32Ret), FAILURE, "HI_GO_FillRect Failed. s32Ret = 0x%x!\n", s32Ret);

#else

    s32Ret = caption_output_create_surface(stRect, &s_hSurface);
    HAL_CHK_RETURN((SUCCESS != s32Ret), FAILURE, "caption_osd_destroy_surface failed, ret = 0x%x !\n", s32Ret);

    s_u32ScreenWidth = stRect.s32Width;
    s_u32ScreenHeight = stRect.s32Height;
#endif

    return SUCCESS;
}

HI_S32 caption_ttx_output_destory_surface()
{
    HI_S32 s32Ret = FAILURE;

    HAL_DEBUG("[%s,%d]\n", __FUNCTION__, __LINE__);

#ifdef LINUX_OS

    if (HIGO_INVALID_HANDLE != s_hMemSurface)
    {
        s32Ret = HI_GO_FreeSurface(s_hMemSurface);
        HAL_CHK_RETURN((HI_SUCCESS != s32Ret), FAILURE, "HI_GO_FreeSurface failed, ret = 0x%x !\n", s32Ret);

        s_hMemSurface = HIGO_INVALID_HANDLE;
    }

#else

    if (HI_INVALID_HANDLE != s_hSurface)
    {
        s32Ret = caption_output_destory_surface();
        HAL_CHK_RETURN((SUCCESS != s32Ret), FAILURE, "caption_osd_destroy_surface failed, ret = 0x%x !\n", s32Ret);

        s_hSurface = HI_INVALID_HANDLE;
    }

#endif
    return SUCCESS;
}

/** Callback  function, register to ttx module. draw char ,refresh osd ,fill rectangle  ,get pts,  get localtime*/
HI_S32 caption_ttx_output_callbak(HI_HANDLE hTTX, HI_UNF_TTX_CB_E enCB, HI_VOID* pvCBParam)
{
    HI_UNF_TTX_FILLRECT_S* pstFillrectparam;
    HI_UNF_TTX_DRAWCAHR_S* pstDrawparam;
    HI_UNF_TTX_REFRESHLAYER_S* pstRefreshparam;
    HI_HANDLE hDispalyHandle;

    if ((HI_NULL == pvCBParam) || (enCB > HI_UNF_TTX_CB_BUTT))
    {
        return HI_FAILURE;
    }

    //HAL_DEBUG("[%s,%d], enCB = 0x%x\n", __FUNCTION__, __LINE__, enCB);

    switch (enCB)
    {
        case HI_UNF_TTX_CB_TTX_TO_APP_MSG:
        {
            hDispalyHandle = *((HI_HANDLE*)pvCBParam);

            ttx_output_send_guimsg(&hDispalyHandle);
            break;
        }

        case HI_UNF_TTX_CB_APP_FILLRECT:
        {
            pstFillrectparam = (HI_UNF_TTX_FILLRECT_S*)pvCBParam;

            ttx_output_fill_rect(pstFillrectparam);
            break;
        }

        case HI_UNF_TTX_CB_APP_DRAWCHAR:
        {
            pstDrawparam = (HI_UNF_TTX_DRAWCAHR_S*)pvCBParam;

            ttx_output_draw_char(pstDrawparam);
            break;
        }

        case HI_UNF_TTX_CB_APP_REFRESH:
        {
            pstRefreshparam = (HI_UNF_TTX_REFRESHLAYER_S*)pvCBParam;

            ttx_output_refresh(pstRefreshparam);
            break;
        }

        case HI_UNF_TTX_CB_GETPTS:
        {
            break;
        }

        case HI_UNF_TTX_CB_CREATE_BUFF:
        {
            ttx_output_create_buff((HI_UNF_TTX_BUFFER_PARAM_S*)pvCBParam);
            break;
        }

        case HI_UNF_TTX_CB_DESTROY_BUFF:
        {
            ttx_output_destory_buff();
            break;
        }

        case HI_UNF_TTX_CB_APP_DRAWDRCSCHAR:
        {
            ttx_output_draw_drcs((HI_UNF_TTX_DRAWDRCSCHAR_S*)pvCBParam);
            break;
        }

        default:
            break;
    }

    return HI_SUCCESS;
}

HI_S32 caption_ttx_output_clear()
{
#ifdef LINUX_OS
    HI_S32 s32Ret = HI_SUCCESS;
    if ((HIGO_INVALID_HANDLE == s_hLayer) ||
        (HIGO_INVALID_HANDLE == s_hLayerSurface) ||
        (HIGO_INVALID_HANDLE == s_hMemSurface))
    {
        HAL_ERROR("In refresh, surface Invalid!\n");
        return HI_FAILURE;
    }

    s32Ret = HI_GO_FillRect(s_hLayerSurface, NULL, 0x00000000, HIGO_COMPOPT_NONE);

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("HI_GO_FillRect failed, ret = 0x%x !\n", s32Ret);
        //return HI_FAILURE;
    }

    s32Ret = HI_GO_RefreshLayer(s_hLayer, HI_NULL);

    if (HI_SUCCESS != s32Ret)
    {
        HAL_ERROR("----\n %s, %d HI_GO_RefreshLayer fail , ret = 0x%x-----\n",  __FUNCTION__, __LINE__, s32Ret);
        //return HI_FAILURE;
    }

#endif
    return SUCCESS;
}
