#ifndef __DBG_VFMW_WRITE_YUV_HEADER__
#define __DBG_VFMW_WRITE_YUV_HEADER__

#include "vfmw.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MAX_DUMP_PIXEL_ARRAY_SIZE    (MAX_PLAIN_SIZE * 5)


/*----------------------------EXTERNAL FUNCTION-------------------------------*/
VBOOL  YUV_IsDumpEnable(SINT32 ChanID);
SINT32 YUV_DumpImage(SINT32 ChanID, IMAGE *pImage);

#ifdef __cplusplus
}
#endif

#endif

