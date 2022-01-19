/******************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name       : df_video_setlevel.c
Version           :
Author            :
Created           : 2017/08/17
Description      : CNcomment: 设置视频层和图形层的Z  序，先跑一个视屏
                                            和一个图形，然后再跑该sample 进行设置CNend\n
Function List    :
History            :
Date                        Author                  Modification
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

/**< tde_gfxdriver.c   中dfb_screens_at(DSCID_PRIMARY)，这个函数实现中layernum 会自己加>**/
/** 和DFB  视频层注册的ID 保持一致**/
#define HDMI_VIDEO_LAYER_ID       1

/*************************** Structure Definition *********************************/

/********************** Global Variable declaration ********************************/

static DFBDisplayLayerID layer_id = HDMI_VIDEO_LAYER_ID;

static int opacity = 255;

/**< 0 不做调整，> 0   图形在上，< 0 视频在上>**/
static int level = 0;

/******************************* API forward declarations *************************/

static int process_level_args( int argc, char **argv )
{
    int k = 0;
    int retval = -1;

    if (argc <= 1)
    {
        goto cleanup;
    }

    retval = 0;

    for (k = 1; k < argc; k++ )
    {
        if ( strncmp( argv[k], "--layer-id=", 11 ) == 0 )
        {
            if ( sscanf( argv[k], "--layer-id=%d", &layer_id ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--opacity=", 10 ) == 0 )
        {
            if ( sscanf( argv[k], "--opacity=%d", &opacity ) != 1 )
            {
                goto cleanup;
            }
        }
        else if ( strncmp( argv[k], "--level=", 8) == 0 )
        {
            if ( sscanf( argv[k], "--level=%d", &level ) != 1 )
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
    /** ./df_video_setlevel --layer-id=1 --opacity=255 --level=1**/
    if ( retval == -1 )
    {
        SAMPLE_TRACE("\n===================================================================\n");
        SAMPLE_TRACE(
                     "Usage: %s [options]\n"
                     "Options:\n"
                     "    --layer-id=<num> (layer id, default is 1 for video layer)\n"
                     "    --opacity=<num>  (layer opacity, default is 255 to show)\n"
                     "    --level=<num>    (layer level, default is 0 to show)\n",
                     argv[0]
               );
        SAMPLE_TRACE("===================================================================\n");
    }

    return 0;
}

/******************************* API realization *********************************/
int main( int argc, char *argv[])
{
	 DFBResult err;
     int get_level = 0;
     IDirectFB *dfb = NULL;
     IDirectFBDisplayLayer *layer = NULL;

#ifndef CONFIG_GFX_DFB_OPTV5_SUPPORT
     return 0;
#endif

     /* init and get main interface */
     DFBCHECK(DirectFBInit(&argc, &argv));
     DFBCHECK(DirectFBCreate(&dfb));

     if (process_level_args(argc, argv))
     {
        goto cleanup;
     }

     SAMPLE_TRACE("\n=================================================\n");
     SAMPLE_TRACE("+++++ layer_id = %d\n",layer_id);
     SAMPLE_TRACE("+++++ opacity  = %d\n",opacity);
     if (0 == level)
     {
          SAMPLE_TRACE("+++++ level = %d 不做调整\n",level);
     }
     else if (level > 0)
     {
          SAMPLE_TRACE("+++++ level = %d 视频在上\n",level);
     }
     else
     {
          SAMPLE_TRACE("+++++ level = %d 图形在上\n",level);
     }
     SAMPLE_TRACE("=================================================\n");

     DFBCHECK(dfb->GetDisplayLayer(dfb, layer_id, &layer));
     DFBCHECK(layer->SetCooperativeLevel(layer, DLSCL_ADMINISTRATIVE));

     DFBCHECK(layer->SetOpacity(layer, opacity));

     if (HDMI_VIDEO_LAYER_ID == layer_id)
     {
        DFBCHECK(layer->SetLevel(layer, level));
        DFBCHECK(layer->GetLevel(layer, &get_level));
        SAMPLE_TRACE("\n=================================================\n");
        SAMPLE_TRACE("+++++ level = %d get_level = %d \n",level,get_level);
        SAMPLE_TRACE("=================================================\n");
     }

     getchar();

cleanup:
    if(layer)
    {
        DFBCHECK(layer->Release(layer));
        layer = NULL;
    }

    if(dfb)
    {
        dfb->Release(dfb);
        dfb = NULL;
    }

    return 0;
}
