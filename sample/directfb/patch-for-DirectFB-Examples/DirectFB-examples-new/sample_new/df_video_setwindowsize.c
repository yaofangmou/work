/******************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name       : df_video_setwindowsize.c
Version           :
Author            :
Created           : 2017/08/17
Description      : CNcomment: 设置视频窗口大小，先跑一个视屏，
                                             然后再跑该sample 进行设置CNend\n
Function List    :
History            :
Date                        Author                  Modification
2017/08/17             sdk
******************************************************************************/


/*********************************add include here*******************************/
#include <stdio.h>
#include <dirent.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>


#include "hi_adp_gfx.h"


/***************************** Macro Definition **********************************/
#define DFBCHECK(x...) \
     {                                                                \
          err = x;                                                    \
          if (err != DFB_OK) {                                        \
               SAMPLE_TRACE("%s <%d>:\n\t", __FILE__, __LINE__ );     \
               DirectFBErrorFatal( #x, err );                         \
          }                                                           \
     }

#define HDMI_VIDEO_LAYER_ID 1

/*************************** Structure Definition **********************************/

/********************** Global Variable declaration *********************************/
static DFBRectangle dest_rect =
{
    .x = 0,
    .y = 0,
};

static DFBRectangle src_rect =
{
    .x = 0,
    .y = 0,
};

static DFBDisplayLayerConfig config =
{
    .flags = DLCONF_WIDTH | DLCONF_HEIGHT
};

static DFBDisplayLayerID layer_id = HDMI_VIDEO_LAYER_ID;

/******************************* API forward declarations **************************/

/******************************* API realization **********************************/
static int process_window_args( int argc, char **argv )
{
    int k = 0;
    int retval = -1;

    if (argc <= 1)
    {
        goto cleanup;
    }

    retval = 0;

    for ( k = 1; k < argc; k++ )
    {
        if ( strncmp( argv[k], "--dx=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--dx=%d", &dest_rect.x ) != 1 )
            {
                goto cleanup;
            }
       }
        else if ( strncmp( argv[k], "--dy=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--dy=%d", &dest_rect.y ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--dw=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--dw=%d", &dest_rect.w ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--dh=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--dh=%d", &dest_rect.h ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--sx=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--sx=%d", &src_rect.x ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--sy=", 5 ) == 0 )
        {
           if ( sscanf( argv[k], "--sy=%d", &src_rect.y ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--sw=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--sw=%d", &src_rect.w ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--sh=", 5 ) == 0 )
        {
            if ( sscanf( argv[k], "--sh=%d", &src_rect.h ) != 1 )
            {
                goto cleanup;
            }
        }
        else
        {
            goto cleanup;
        }
    }

cleanup:
    if ( retval == -1 )
    {/** ./df_video_setwindowsize --dx=100 --dy=100 --dw=400 --dh=400 **/
        SAMPLE_TRACE("\n===================================================================\n");
        SAMPLE_TRACE(
                 "Usage: %s [options]\n"
                 "Options:\n"
                 "    --dx=<pixels>    (layer destination x in screen coordinates)\n"
                 "    --dy=<pixels>    (layer destination y in screen coordinates)\n"
                 "    --dw=<pixels>    (layer destination width in screen coordinates)\n"
                 "    --dh=<pixels>    (layer destination height in screen coordinates)\n"
                 "    --sx=<pixels>    (layer source x in screen coordinates)\n"
                 "    --sy=<pixels>    (layer source y in screen coordinates)\n"
                 "    --sw=<pixels>    (layer source width in screen coordinates)\n"
                 "    --sh=<pixels>    (layer source height in screen coordinates)\n"
                 "\n"
                 "The screen is %d %d pixels\n",
                 argv[0],
                 config.width,
                 config.height
               );
        SAMPLE_TRACE("===================================================================\n");
    }

    return 0;
}

int main( int argc, char *argv[] )
{
	 DFBResult err;
     IDirectFB *dfb = NULL;
     IDirectFBScreen *screen = NULL;
     IDirectFBDisplayLayer *layer = NULL;

#ifndef CONFIG_GFX_DFB_OPTV5_SUPPORT
     return 0;
#endif

     /* init and get main interface */
     DFBCHECK(DirectFBInit(&argc, &argv));
     DFBCHECK(DirectFBCreate(&dfb));
     DFBCHECK(dfb->GetDisplayLayer(dfb, layer_id, &layer));
     DFBCHECK(layer->SetCooperativeLevel( layer, DLSCL_ADMINISTRATIVE));

     DFBCHECK(dfb->GetScreen(dfb, DSCID_PRIMARY, &screen));
     DFBCHECK(screen->GetSize(screen, &config.width, &config.height));

     src_rect.w  = config.width;
     src_rect.h  = config.height;
     dest_rect.w = config.width;
     dest_rect.h = config.height;

     if (process_window_args(argc, argv))
     {
        goto cleanup;
     }

     SAMPLE_TRACE("\n=================================================\n");
     SAMPLE_TRACE( "+++++ src to  x:%d, y:%d, w:%d, h:%d\n", src_rect.x,  src_rect.y,  src_rect.w,  src_rect.h);
     SAMPLE_TRACE( "+++++ dest to x:%d, y:%d, w:%d, h:%d\n", dest_rect.x, dest_rect.y, dest_rect.w, dest_rect.h);
     SAMPLE_TRACE( "+++++ screen-coordinate dimensions are %d %d\n", config.width, config.height);
     SAMPLE_TRACE("=================================================\n");

     SAMPLE_TRACE("+++++ begin set screen size\n");
     getchar();
     DFBCHECK( layer->SetConfiguration(layer, &config));

     SAMPLE_TRACE("+++++ begin set screen rectangle\n");
     getchar();
     DFBCHECK( layer->SetScreenRectangle(layer, dest_rect.x, dest_rect.y, dest_rect.w, dest_rect.h));

     SAMPLE_TRACE("+++++ begin set source rectangle\n");
     getchar();
     DFBCHECK( layer->SetSourceRectangle(layer, src_rect.x, src_rect.y, src_rect.w, src_rect.h));

     getchar();

cleanup:
    if (screen)
    {
        DFBCHECK(screen->Release(screen));
        screen = NULL;
    }

    if (layer)
    {
        DFBCHECK(layer->Release(layer));
        layer = NULL;
    }
    if (dfb)
    {
        dfb->Release(dfb);
        dfb = NULL;
    }

    return 0;
}
