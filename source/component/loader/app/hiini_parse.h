/******************************************************************************

  Copyright (C) 2011-2018 Hisilicon Technologies Co., Ltd.  All rights reserved.

******************************************************************************
    File Name     : hiini_parse.h
    Version       : Initial Draft
    Author        : Device Chipset STB Development Dept
    Created       : 2018/08/23
    Description   : head file

******************************************************************************/

#ifndef HI_INI_PARSE_H
#define HI_INI_PARSE_H

#include <stdio.h>
#include "hi_type.h"

#define HI_INI_BUFSIZE  512

#define HIINI_Read(buffer,size,file)    (fgets((buffer),(size),*(file)) != NULL)
#define HIINI_Atof(string)              (float)strtod((string),NULL)


HI_BOOL  HIINI_GetBool(const HI_CHAR *section, const HI_CHAR *key, HI_BOOL default_value, const HI_CHAR *file);
long     HIINI_GetLong(const HI_CHAR *section, const HI_CHAR *key, long default_value, const HI_CHAR *file);
HI_S32   HIINI_GetString(const HI_CHAR *section, const HI_CHAR *key, const HI_CHAR *default_value, HI_CHAR *buffer, HI_S32 size, const HI_CHAR *file);
float    HIINI_GetFloat(const HI_CHAR *section, const HI_CHAR *key, float default_value, const HI_CHAR *file);



#endif /* HI_ADP_INI_H */
