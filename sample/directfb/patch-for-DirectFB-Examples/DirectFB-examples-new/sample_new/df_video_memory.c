/******************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name       : df_video_memory.c
Version         :
Author          :
Created         : 2017/08/17
Description     :
Function List   :
History         :
Date                  Author                  Modification
2017/08/17             sdk
******************************************************************************/


/*********************************add include here******************************/
#include <stdio.h>
#include <dirent.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>


#include "hi_adp_gfx.h"

/***************************** Macro Definition *********************************/
#define DFBCHECK(x...) \
     {                                                                \
          err = x;                                                    \
          if (err != DFB_OK) {                                        \
               SAMPLE_TRACE("%s <%d>:\n\t", __FILE__, __LINE__ );     \
               DirectFBErrorFatal( #x, err );                         \
          }                                                           \
     }

/*************************** Structure Definition **********************************/

/********************** Global Variable declaration ********************************/

/******************************* API forward declarations **************************/


/******************************* API realization ***********************************/
int main( int argc, char **argv )
{
    char key;
    DFBResult err;
    IDirectFB *dfb = NULL;
    IDirectFBSurface *surface = NULL;
    void *surface_buffer = NULL;
    int surface_pitch = 0;

    DFBSurfaceDescription surface_description =
    {
        .flags  = DSDESC_CAPS | DSDESC_WIDTH | DSDESC_HEIGHT | DSDESC_PIXELFORMAT,
        .width  = 1920,
        .height = 1080,
        .pixelformat = DSPF_ARGB
    };

    DFBCHECK(DirectFBInit(&argc, &argv));

    DFBCHECK(DirectFBCreate(&dfb));

#if 1
    SAMPLE_TRACE("\n===================================================\n");
    SAMPLE_TRACE("press y to create system memory [%d %d]\n",
                                                  surface_description.width,
                                                  surface_description.height);
    SAMPLE_TRACE("===================================================\n");
    {
        surface_description.caps = DSCAPS_SYSTEMONLY;

        DFBCHECK(dfb->CreateSurface(dfb, &surface_description, &surface));
        DFBCHECK(surface->Lock(surface, DSLF_WRITE, &surface_buffer, &surface_pitch));
        DFBCHECK(surface->Unlock(surface));

        SAMPLE_TRACE("===================================================\n");
        SAMPLE_TRACE("Lock system pointer is %p stride %d\n",surface_buffer,surface_pitch);
        SAMPLE_TRACE("===================================================\n");

        DFBCHECK(surface->Release(surface));
    }
#endif


#if 1
    SAMPLE_TRACE("\n===================================================\n");
    SAMPLE_TRACE("press y to create video memory [%d %d]\n",
                                                  surface_description.width,
                                                  surface_description.height);
    SAMPLE_TRACE("===================================================\n");
    {
        surface_description.caps = DSCAPS_VIDEOONLY;

        DFBCHECK(dfb->CreateSurface(dfb, &surface_description, &surface));

        DFBCHECK(surface->Lock( surface, DSLF_WRITE, &surface_buffer, &surface_pitch));
        DFBCHECK(surface->Unlock(surface));

        SAMPLE_TRACE("===================================================\n");
        SAMPLE_TRACE("Lock video pointer is %p stride %d\n",surface_buffer,surface_pitch);
        SAMPLE_TRACE("===================================================\n");

        DFBCHECK(surface->Release(surface));
    }
#endif

    SAMPLE_TRACE("===================================================\n");
    SAMPLE_TRACE("press q to exit\n");
    SAMPLE_TRACE("===================================================\n");
    key = getchar();
    while (('q' != key) && ('Q' != key))
    {
        key = getchar();
    }

    DFBCHECK(dfb->Release(dfb));

    return 0;
}
