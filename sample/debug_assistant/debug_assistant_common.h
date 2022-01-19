#ifndef __DEBUG_ASSISTANT_COMMON_H__
#define __DEBUG_ASSISTANT_COMMON_H__

#include <stdio.h>
#include "hi_type.h"
#include "hi_type.h"
#include "hi_adp.h"
#include "debug_assistant_lang.h"

/* Print log to both console and log file */
#define assistant_printf(x) {printf(x); if (HI_NULL != fLog) fwrite(x, strlen(x), 1, fLog); }
#define HI_DONE (1)
#define CACHE_SIZE (1024*128)

#define LANG (2)
#define LEN (128)

extern HI_U32      u32Lang;
extern FILE        *fLog;
extern HI_CHAR     *pszBuf;
extern HI_U32      u32Len;
extern HI_CHAR     aszLogDir[256];

extern HI_VOID assistant_printf_ext(const HI_CHAR *pszFormat, ...);
extern HI_BOOL ProcExist(const HI_CHAR * pszFile);
extern HI_VOID WriteProc(const HI_CHAR * pszCmd);
extern HI_VOID ReadProc(const HI_CHAR * pszProc);
extern HI_VOID Wait(HI_U32 u32Second);


#endif /* __DEBUG_ASSISTANT_COMMON_H__ */


